; Rough disassembly of Raiders of the Lost Ark
; By Omegamatrix
;
;
; Raid1.cfg contents:
;
;      ORG D000
;      CODE D000 DAFC
;      GFX DAFD DCE8
;      CODE DCE9 DCFA
;      GFX DCFB DCFB
;      CODE DCFC DDF7
;      GFX DDF8 DF9B
;      CODE DF9C DFD4
;      GFX DFD5 DFFF
;
; Raid2.cfg contents:
;
;      ORG F000
;      CODE F000 F708
;      GFX F709 F709
;      CODE F70A F8FB
;      GFX F8FC FCE9
;      CODE FCEA FCFE
;      GFX FCFF FEF3
;      CODE FEF4 FEFF
;      GFX FF00 FFFF

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
RESBL   =  $14
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
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
CXM0P   =  $30
CXM1P   =  $31
CXP1FB  =  $33
CXM1FB  =  $35
CXPPMM  =  $37
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

BANK_0       = $FFF8
BANK_1       = $FFF9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      RIOT RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x9
ram_81             ds 1  ; x34
ram_82             ds 1  ; x26
ram_83             ds 1  ; x10
ram_84             ds 1  ; x20
ram_85             ds 1  ; x8
ram_86             ds 1  ; x7
ram_87             ds 1  ; x9
ram_88             ds 1  ; x7
ram_89             ds 1  ; x7
ram_8A             ds 1  ; x20
ram_8B             ds 1  ; x4
ram_8C             ds 1  ; x6
ram_8D             ds 1  ; x15
ram_8E             ds 1  ; x6
ram_8F             ds 1  ; x6
ram_90             ds 1  ; x1
ram_91             ds 1  ; x15
ram_92             ds 1  ; x3
ram_93             ds 1  ; x10
ram_94             ds 1  ; x2
ram_95             ds 1  ; x12
ram_96             ds 1  ; x5
ram_97             ds 1  ; x2
ram_98             ds 1  ; x4
ram_99             ds 1  ; x3
ram_9A             ds 1  ; x8
ram_9B             ds 1  ; x2
ram_9C             ds 1  ; x7
ram_9D             ds 1  ; x18
ram_9E             ds 1  ; x6
ram_9F             ds 1  ; x3
ram_A0             ds 1  ; x6
ram_A1             ds 1  ; x5
ram_A2             ds 1  ; x6
ram_A3             ds 1  ; x8
ram_A4             ds 1  ; x3
ram_A5             ds 1  ; x2
ram_A6             ds 1  ; x2
ram_A7             ds 1  ; x2
ram_A8             ds 1  ; x2
ram_A9             ds 1  ; x2
ram_AA             ds 1  ; x3
ram_AB             ds 1  ; x2
ram_AC             ds 1  ; x2
ram_AD             ds 1  ; x2
ram_AE             ds 1  ; x1
ram_AF             ds 2  ; x10
ram_B1             ds 1  ; x8
ram_B2             ds 1  ; x13
ram_B3             ds 1  ; x5
ram_B4             ds 1  ; x17
ram_B5             ds 1  ; x10
ram_B6             ds 1  ; x8
ram_B7             ds 1  ; x16
ram_B8             ds 1  ; x2
ram_B9             ds 1  ; x4
ram_BA             ds 1  ; x2
ram_BB             ds 1  ; x3
ram_BC             ds 1  ; x1
ram_BD             ds 1  ; x3
ram_BE             ds 1  ; x1
ram_BF             ds 1  ; x3
ram_C0             ds 1  ; x1
ram_C1             ds 1  ; x1
ram_C2             ds 1  ; x1
ram_C3             ds 1  ; x9
ram_C4             ds 1  ; x9
ram_C5             ds 1  ; x12
ram_C6             ds 1  ; x6
ram_C7             ds 1  ; x7
ram_C8             ds 1  ; x16
ram_C9             ds 1  ; x44
ram_CA             ds 1  ; x3
ram_CB             ds 1  ; x15
ram_CC             ds 1  ; x7
ram_CD             ds 1  ; x3
ram_CE             ds 1  ; x31
ram_CF             ds 1  ; x51
ram_D0             ds 1  ; x17
ram_D1             ds 1  ; x28
ram_D2             ds 1  ; x16
ram_D3             ds 1  ; x3
ram_D4             ds 1  ; x21
ram_D5             ds 1  ; x7
ram_D6             ds 1  ; x11
ram_D7             ds 1  ; x4
ram_D8             ds 1  ; x6
ram_D9             ds 1  ; x7
ram_DA             ds 1  ; x1
ram_DB             ds 1  ; x8
ram_DC             ds 1  ; x12
ram_DD             ds 1  ; x11
ram_DE             ds 1  ; x2
ram_DF             ds 1  ; x29
ram_E0             ds 1  ; x5
ram_E1             ds 1  ; x4
ram_E2             ds 1  ; x2
ram_E3             ds 1  ; x4
ram_E4             ds 1  ; x2
ram_E5             ds 1  ; x11
ram_E6             ds 1  ; x2
ram_E7             ds 1  ; x2
ram_E8             ds 1  ; x2
ram_E9             ds 1  ; x3
ram_EA             ds 1  ; x2
ram_EB             ds 1  ; x3
ram_EC             ds 1  ; x3
ram_ED             ds 1  ; x2
ram_EE             ds 18 ; x2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE
       ORG $0000,0
      RORG $D000

    lda    BANK_0                ; 4
    jmp    START_0               ; 3

LD006:
    ldx    #$04                  ; 2
LD008:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_C8,X              ; 4
    tay                          ; 2
    lda    LDB00,Y               ; 4
    sta    HMP0,X                ; 4
    and    #$0F                  ; 2
    tay                          ; 2
LD015:
    dey                          ; 2
    bpl    LD015                 ; 2³
    sta    RESP0,X               ; 4
    dex                          ; 2
    bpl    LD008                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    LDF9C                 ; 3

LD024:  ; indirect jump
    bit    CXM1P                 ; 3
    bpl    LD05C                 ; 2³
    ldx    ram_81                ; 3
    cpx    #$0A                  ; 2
    bcc    LD05C                 ; 2³
    beq    LD03F                 ; 2³
    lda    ram_D1                ; 3
    adc    #$01                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    #$08                  ; 2
    eor    ram_DF,X              ; 4
    sta    ram_DF,X              ; 4
LD03F:
    lda    ram_8F                ; 3
    bpl    LD054                 ; 2³
    and    #$7F                  ; 2
    sta    ram_8F                ; 3
    lda    ram_95                ; 3
    and    #$1F                  ; 2
    beq    LD050                 ; 2³
    jsr    LDCE9                 ; 6
LD050:
    lda    #$40                  ; 2
    sta    ram_95                ; 3
LD054:
    lda    #$7F                  ; 2
    sta    ram_D1                ; 3
    lda    #$04                  ; 2
    sta    ram_AC                ; 3
LD05C:
    bit    CXM1FB                ; 3
    bpl    LD0AA                 ; 2³
    ldx    ram_81                ; 3
    cpx    #$09                  ; 2
    beq    LD0BC                 ; 2³
    cpx    #$06                  ; 2
    beq    LD06E                 ; 2³
    cpx    #$08                  ; 2
    bne    LD0AA                 ; 2³
LD06E:
    lda    ram_D1                ; 3
    sbc    ram_D4                ; 3
    lsr                          ; 2
    lsr                          ; 2
    beq    LD087                 ; 2³
    tax                          ; 2
    ldy    ram_CB                ; 3
    cpy    #$12                  ; 2
    bcc    LD0A4                 ; 2³
    cpy    #$8D                  ; 2
    bcs    LD0A4                 ; 2³
    lda    #$00                  ; 2
    sta    ram_E5,X              ; 4
    beq    LD0A4                 ; 3   always branch

LD087:
    lda    ram_CB                ; 3
    cmp    #$30                  ; 2
    bcs    LD09E                 ; 2³
    sbc    #$10                  ; 2
    eor    #$1F                  ; 2
LD091:
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LDC5C,X               ; 4
    and    ram_E5                ; 3
    sta    ram_E5                ; 3
    jmp    LD0A4                 ; 3

LD09E:
    sbc    #$71                  ; 2
    cmp    #$20                  ; 2
    bcc    LD091                 ; 2³
LD0A4:
    ldy    #$7F                  ; 2
    sty    ram_8F                ; 3
    sty    ram_D1                ; 3
LD0AA:
    bit    CXM1FB                ; 3
    bvc    LD0BC                 ; 2³
    bit    ram_93                ; 3
    bvc    LD0BC                 ; 2³
    lda    #$5A                  ; 2
    sta    ram_D2                ; 3
    sta    ram_DC                ; 3
    sta    ram_8F                ; 3
    sta    ram_D1                ; 3
LD0BC:
    bit    CXP1FB                ; 3
    bvc    LD0ED                 ; 2³
    ldx    ram_81                ; 3
    cpx    #$06                  ; 2
    beq    LD0E2                 ; 2³
    lda    ram_C5                ; 3
    cmp    #$02                  ; 2
    beq    LD0ED                 ; 2³
    bit    ram_93                ; 3
    bpl    LD0DA                 ; 2³
    lda    ram_83                ; 3
    and    #$07                  ; 2
    ora    #$80                  ; 2
    sta    ram_A1                ; 3
    bne    LD0ED                 ; 3   always branch

LD0DA:
    bvc    LD0ED                 ; 2³
    lda    #$80                  ; 2
    sta    ram_9D                ; 3
    bne    LD0ED                 ; 3   always branch

LD0E2:
    lda    ram_D6                ; 3
    cmp    #$BA                  ; 2
    bne    LD0ED                 ; 2³
    lda    #$0F                  ; 2
    jsr    LDCE9                 ; 6
LD0ED:
    ldx    #$05                  ; 2
    cpx    ram_81                ; 3
    bne    LD12D                 ; 2³+1
    bit    CXM0P                 ; 3
    bpl    LD106                 ; 2³+1
    stx    ram_CF                ; 3
    lda    #$0C                  ; 2
    sta    ram_81                ; 3
    jsr    LD878                 ; 6
    lda    #$4C                  ; 2
    sta    ram_C9                ; 3
    bne    LD12B                 ; 3   always branch

LD106:
    ldx    ram_CF                ; 3
    cpx    #$4F                  ; 2
    bcc    LD12D                 ; 2³
    lda    #$0A                  ; 2
    sta    ram_81                ; 3
    jsr    LD878                 ; 6
    lda    ram_EB                ; 3
    sta    ram_DF                ; 3
    lda    ram_EC                ; 3
    sta    ram_CF                ; 3
    lda    ram_ED                ; 3
    sta    ram_C9                ; 3
    lda    #$FD                  ; 2
    and    ram_B4                ; 3
    sta    ram_B4                ; 3
    bmi    LD12B                 ; 2³
    lda    #$80                  ; 2
    sta    ram_9D                ; 3
LD12B:
    sta    CXCLR                 ; 3
LD12D:
    bit    CXPPMM                ; 3
    bmi    LD140                 ; 2³
    ldx    #$00                  ; 2
    stx    ram_91                ; 3
    dex                          ; 2
    stx    ram_97                ; 3
    rol    ram_95                ; 5
    clc                          ; 2
    ror    ram_95                ; 5
LD13D:
    jmp    LD2B4                 ; 3

LD140:
    lda    ram_81                ; 3
    bne    LD157                 ; 2³
    lda    ram_AF                ; 3
    and    #$07                  ; 2
    tax                          ; 2
    lda    LDF78,X               ; 4
    jsr    LDCE9                 ; 6
    bcc    LD13D                 ; 2³
    lda    #$01                  ; 2
    sta    ram_DF                ; 3
    bne    LD13D                 ; 3   always branch

LD157:
    asl                          ; 2
    tax                          ; 2
    lda    LDC9B+1,X             ; 4
    pha                          ; 3
    lda    LDC9B,X               ; 4
    pha                          ; 3
    rts                          ; 6

LD162:  ; indirect jump
    lda    ram_CF                ; 3
    cmp    #$3F                  ; 2
    bcc    LD18A                 ; 2³
    lda    ram_96                ; 3
    cmp    #$54                  ; 2
    bne    LD1C1                 ; 2³
    lda    ram_8C                ; 3
    cmp    ram_8B                ; 3
    bne    LD187                 ; 2³
    lda    #$58                  ; 2
    sta    ram_9C                ; 3
    sta    ram_9E                ; 3
    jsr    LDDDB                 ; 6
    lda    #$0D                  ; 2
    sta    ram_81                ; 3
    jsr    LD878                 ; 6
    jmp    LD3D8                 ; 3

LD187:
    jmp    LD2DA                 ; 3

LD18A:
    lda    #$0B                  ; 2
    bne    LD194                 ; 3   always branch

LD18E:  ; indirect jump
    lda    #$07                  ; 2
    bne    LD194                 ; 3   always branch

LD192:  ; indirect jump
    lda    #$04                  ; 2
LD194:
    bit    ram_95                ; 3
    bmi    LD1C1                 ; 2³
    clc                          ; 2
    jsr    LDA10                 ; 6
    bcs    LD1A4                 ; 2³
    sec                          ; 2
    jsr    LDA10                 ; 6
    bcc    LD1C1                 ; 2³
LD1A4:
    cpy    #$0B                  ; 2
    bne    LD1AD                 ; 2³
    ror    ram_B2                ; 5
    clc                          ; 2
    rol    ram_B2                ; 5
LD1AD:
    lda    ram_95                ; 3
    jsr    LDD59                 ; 6
    tya                          ; 2
    ora    #$C0                  ; 2
    sta    ram_95                ; 3
    bne    LD1C1                 ; 3   always branch

LD1B9:  ; indirect jump
    ldx    #$00                  ; 2
    stx    ram_B6                ; 3
    lda    #$80                  ; 2
    sta    ram_9D                ; 3
LD1C1:
    jmp    LD2B4                 ; 3

LD1C4:  ; indirect jump
    bit    ram_B4                ; 3
    bvs    LD1E8                 ; 2³
    bpl    LD1E8                 ; 2³
    lda    ram_C9                ; 3
    cmp    #$2B                  ; 2
    bcc    LD1E2                 ; 2³
    ldx    ram_CF                ; 3
    cpx    #$27                  ; 2
    bcc    LD1E2                 ; 2³
    cpx    #$2B                  ; 2
    bcs    LD1E2                 ; 2³
    lda    #$40                  ; 2
    ora    ram_B4                ; 3
    sta    ram_B4                ; 3
    bne    LD1E8                 ; 2³
LD1E2:
    lda    #$03                  ; 2
    sec                          ; 2
    jsr    LDA10                 ; 6
LD1E8:
    jmp    LD2B4                 ; 3

LD1EB:  ; indirect jump
    bit    CXP1FB                ; 3
    bpl    LD21A                 ; 2³+1
    ldy    ram_CF                ; 3
    cpy    #$3A                  ; 2
    bcc    LD200                 ; 2³+1
    lda    #$E0                  ; 2
    and    ram_91                ; 3
    ora    #$43                  ; 2
    sta    ram_91                ; 3
    jmp    LD2B4                 ; 3

LD200:
    cpy    #$20                  ; 2
    bcc    LD20B                 ; 2³
LD204:
    lda    #$00                  ; 2
    sta    ram_91                ; 3
    jmp    LD2B4                 ; 3

LD20B:
    cpy    #$09                  ; 2
    bcc    LD204                 ; 2³
    lda    #$E0                  ; 2
    and    ram_91                ; 3
    ora    #$42                  ; 2
    sta    ram_91                ; 3
    jmp    LD2B4                 ; 3

LD21A:
    lda    ram_CF                ; 3
    cmp    #$3A                  ; 2
    bcc    LD224                 ; 2³
    ldx    #$07                  ; 2
    bne    LD230                 ; 3   always branch

LD224:
    lda    ram_C9                ; 3
    cmp    #$4C                  ; 2
    bcs    LD22E                 ; 2³
    ldx    #$05                  ; 2
    bne    LD230                 ; 3   always branch

LD22E:
    ldx    #$0D                  ; 2
LD230:
    lda    #$40                  ; 2
    sta    ram_93                ; 3
    lda    ram_83                ; 3
    and    #$1F                  ; 2
    cmp    #$02                  ; 2
    bcs    LD23E                 ; 2³
    ldx    #$0E                  ; 2
LD23E:
    jsr    LDD43                 ; 6
    bcs    LD247                 ; 2³
    txa                          ; 2
    jsr    LDCE9                 ; 6
LD247:
    jmp    LD2B4                 ; 3

LD24A:  ; indirect jump
    bit    CXP1FB                ; 3
    bmi    LD26E                 ; 2³
    lda    ram_C9                ; 3
    cmp    #$50                  ; 2
    bcs    LD262                 ; 2³
    dec    ram_C9                ; 5
    rol    ram_B2                ; 5
    clc                          ; 2
    ror    ram_B2                ; 5
LD25B:
    lda    #$00                  ; 2
    sta    ram_91                ; 3
LD25F:
    jmp    LD2B4                 ; 3

LD262:
    ldx    #$06                  ; 2
    lda    ram_83                ; 3
    cmp    #$40                  ; 2
    bcs    LD23E                 ; 2³
    ldx    #$07                  ; 2
    bne    LD23E                 ; 3   always branch

LD26E:
    ldy    ram_CF                ; 3
    cpy    #$44                  ; 2
    bcc    LD27E                 ; 2³
    lda    #$E0                  ; 2
    and    ram_91                ; 3
    ora    #$0B                  ; 2
LD27A:
    sta    ram_91                ; 3
    bne    LD25F                 ; 2³
LD27E:
    cpy    #$20                  ; 2
    bcs    LD25B                 ; 2³
    cpy    #$0B                  ; 2
    bcc    LD25B                 ; 2³
    lda    #$E0                  ; 2
    and    ram_91                ; 3
    ora    #$41                  ; 2
    bne    LD27A                 ; 3   always branch

LD28E:  ; indirect jump
    inc    ram_C9                ; 5
    bne    LD2B4                 ; 3   always branch?

LD292:  ; indirect jump
    lda    ram_CF                ; 3
    cmp    #$3F                  ; 2
    bcc    LD2AA                 ; 2³
    lda    #$0A                  ; 2
    jsr    LDCE9                 ; 6
    bcc    LD2B4                 ; 2³
    ror    ram_B1                ; 5
    sec                          ; 2
    rol    ram_B1                ; 5
    lda    #$42                  ; 2
    sta    ram_DF                ; 3
    bne    LD2B4                 ; 3   always branch

LD2AA:
    cmp    #$16                  ; 2
    bcc    LD2B2                 ; 2³
    cmp    #$1F                  ; 2
    bcc    LD2B4                 ; 2³
LD2B2:
    dec    ram_C9                ; 5
LD2B4:  ; indirect jump also
    lda    ram_81                ; 3
    asl                          ; 2
    tax                          ; 2
    bit    CXP1FB                ; 3
    bpl    LD2C5                 ; 2³
    lda    LDCB5+1,X             ; 4
    pha                          ; 3
    lda    LDCB5,X               ; 4
    pha                          ; 3
    rts                          ; 6

LD2C5:
    lda    LDCCF+1,X             ; 4
    pha                          ; 3
    lda    LDCCF,X               ; 4
    pha                          ; 3
    rts                          ; 6

LD2CE:  ; indirect jump also
    lda    ram_DF                ; 3
    sta    ram_EB                ; 3
    lda    ram_CF                ; 3
    sta    ram_EC                ; 3
    lda    ram_C9                ; 3
LD2D8:
    sta    ram_ED                ; 3
LD2DA:
    lda    #$05                  ; 2
    sta    ram_81                ; 3
    jsr    LD878                 ; 6
    lda    #$05                  ; 2
    sta    ram_CF                ; 3
    lda    #$50                  ; 2
    sta    ram_C9                ; 3
    tsx                          ; 2
    cpx    #$FE                  ; 2
    bcs    LD2EF                 ; 2³
    rts                          ; 6

LD2EF:
    jmp    LD374                 ; 3

LD2F2:  ; indirect jump
    bit    ram_B3                ; 3
    bmi    LD2EF                 ; 2³
    lda    #$50                  ; 2
    sta    ram_EB                ; 3
    lda    #$41                  ; 2
    sta    ram_EC                ; 3
    lda    #$4C                  ; 2
    bne    LD2D8                 ; 3+1   always branch

LD302:  ; indirect jump
    ldy    ram_C9                ; 3
    cpy    #$2C                  ; 2
    bcc    LD31A                 ; 2³
    cpy    #$6B                  ; 2
    bcs    LD31C                 ; 2³
    ldy    ram_CF                ; 3
    iny                          ; 2
    cpy    #$1E                  ; 2
    bcc    LD315                 ; 2³
    dey                          ; 2
    dey                          ; 2
LD315:
    sty    ram_CF                ; 3
    jmp    LD364                 ; 3

LD31A:
    iny                          ; 2
    iny                          ; 2
LD31C:
    dey                          ; 2
    sty    ram_C9                ; 3
    bne    LD364                 ; 3   always branch

LD321:  ; always branch
    lda    #$02                  ; 2
    and    ram_B1                ; 3
    beq    LD331                 ; 2³
    lda    ram_CF                ; 3
    cmp    #$12                  ; 2
    bcc    LD331                 ; 2³
    cmp    #$24                  ; 2
    bcc    LD36A                 ; 2³
LD331:
    dec    ram_C9                ; 5
    bne    LD364                 ; 3   always branch?

LD335:  ; indirect jump
    ldx    #$1A                  ; 2
    lda    ram_C9                ; 3
    cmp    #$4C                  ; 2
    bcc    LD33F                 ; 2³
    ldx    #$7D                  ; 2
LD33F:
    stx    ram_C9                ; 3
    ldx    #$40                  ; 2
    stx    ram_CF                ; 3
    ldx    #$FF                  ; 2
    stx    ram_E5                ; 3
    ldx    #$01                  ; 2
    stx    ram_E6                ; 3
    stx    ram_E7                ; 3
    stx    ram_E8                ; 3
    stx    ram_E9                ; 3
    stx    ram_EA                ; 3
    bne    LD364                 ; 3   always branch

LD357:  ; indirect jump
    lda    ram_92                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LDFD5,Y               ; 4
    ldx    #$01                  ; 2
    jsr    LDFC0                 ; 6
LD364:
    lda    #$05                  ; 2
    sta    ram_A2                ; 3
    bne    LD374                 ; 3   always branch

LD36A:  ; indirect jump also
    rol    ram_8A                ; 5
    sec                          ; 2
    bcs    LD372                 ; 3   always branch

LD36F:  ; indirect jump
    rol    ram_8A                ; 5
    clc                          ; 2
LD372:
    ror    ram_8A                ; 5
LD374:  ; indirect jump also
    bit    CXM0P                 ; 3
    bpl    LD396                 ; 2³
    ldx    ram_81                ; 3
    cpx    #$07                  ; 2
    beq    LD386                 ; 2³
    bcc    LD396                 ; 2³
    lda    #$80                  ; 2
    sta    ram_9D                ; 3
    bne    LD390                 ; 3   always branch

LD386:
    rol    ram_8A                ; 5
    sec                          ; 2
    ror    ram_8A                ; 5
    rol    ram_B6                ; 5
    sec                          ; 2
    ror    ram_B6                ; 5
LD390:
    lda    #$7F                  ; 2
    sta    ram_8E                ; 3
    sta    ram_D0                ; 3
LD396:
    bit    ram_9A                ; 3
    bpl    LD3D8                 ; 2³
    bvs    LD3A8                 ; 2³
    lda    ram_83                ; 3
    cmp    ram_9B                ; 3
    bne    LD3D8                 ; 2³
    lda    #$A0                  ; 2
    sta    ram_D1                ; 3
    sta    ram_9D                ; 3
LD3A8:
    lsr    ram_9A                ; 5
    bcc    LD3D4                 ; 2³
    lda    #$02                  ; 2
    sta    ram_A5                ; 3
    ora    ram_B1                ; 3
    sta    ram_B1                ; 3
    ldx    #$02                  ; 2
    cpx    ram_81                ; 3
    bne    LD3BD                 ; 2³
    jsr    LD878                 ; 6
LD3BD:
    lda    ram_B5                ; 3
    and    #$0F                  ; 2
    beq    LD3D4                 ; 2³
    lda    ram_B5                ; 3
    and    #$F0                  ; 2
    ora    #$01                  ; 2
    sta    ram_B5                ; 3
    ldx    #$02                  ; 2
    cpx    ram_81                ; 3
    bne    LD3D4                 ; 2³
    jsr    LD878                 ; 6
LD3D4:
    sec                          ; 2
    jsr    LDA10                 ; 6
LD3D8:  ; indirect jump also
    lda    INTIM                 ; 4
    bne    LD3D8                 ; 2³
LD3DD:
    lda    #$02                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #$50                  ; 2
    cmp    ram_D1                ; 3
    bcs    LD3EB                 ; 2³
    sta    ram_CB                ; 3
LD3EB:
    inc    ram_82                ; 5
    lda    #$3F                  ; 2
    and    ram_82                ; 3
    bne    LD3FB                 ; 2³
    inc    ram_83                ; 5
    lda    ram_A1                ; 3
    bpl    LD3FB                 ; 2³
    dec    ram_A1                ; 5
LD3FB:
    sta    WSYNC                 ; 3
;---------------------------------------
    bit    ram_9C                ; 3
    bpl    LD409                 ; 2³
    ror    SWCHB                 ; 6
    bcs    LD409                 ; 2³
    jmp    START_0               ; 3

LD409:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    ldx    #$2C                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    stx    TIM64T                ; 4
    ldx    ram_9D                ; 3
    inx                          ; 2
    bne    LD42A                 ; 2³
    stx    ram_9D                ; 3
    jsr    LDDDB                 ; 6
    lda    #$0D                  ; 2
    sta    ram_81                ; 3
    jsr    LD878                 ; 6
LD427:
    jmp    LD80D                 ; 3

LD42A:
    lda    ram_81                ; 3
    cmp    #$0D                  ; 2
    bne    LD482                 ; 2³
    lda    #$9C                  ; 2
    sta    ram_A3                ; 3
    ldy    ram_AA                ; 3
    beq    LD44A                 ; 2³
    bit    ram_9C                ; 3
    bmi    LD44A                 ; 2³
    ldx    #>LFF46               ; 2
    stx    ram_B8                ; 3
    stx    ram_BA                ; 3
    lda    #<LFF46               ; 2
    sta    ram_B7                ; 3
    lda    #<LFF01               ; 2
    sta    ram_B9                ; 3
LD44A:
    ldy    ram_CF                ; 3
    cpy    #$7C                  ; 2
    bcs    LD465                 ; 2³
    cpy    ram_9E                ; 3
    bcc    LD45B                 ; 2³
    bit    INPT5                 ; 3
    bmi    LD427                 ; 2³
    jmp    START_0               ; 3

LD45B:
    lda    ram_82                ; 3
    ror                          ; 2
    bcc    LD427                 ; 2³
    iny                          ; 2
    sty    ram_CF                ; 3
    bne    LD427                 ; 2³
LD465:
    bit    ram_9C                ; 3
    bmi    LD46D                 ; 2³
    lda    #$0E                  ; 2
    sta    ram_A2                ; 3
LD46D:
    lda    #$80                  ; 2
    sta    ram_9C                ; 3
    bit    INPT5                 ; 3
    bmi    LD427                 ; 2³
    lda    ram_82                ; 3
    and    #$0F                  ; 2
    bne    LD47D                 ; 2³
    lda    #$05                  ; 2
LD47D:
    sta    ram_8C                ; 3
    jmp    LDDA6                 ; 3

LD482:
    bit    ram_93                ; 3
    bvs    LD489                 ; 2³
LD486:
    jmp    LD51C                 ; 3

LD489:
    lda    ram_82                ; 3
    and    #$03                  ; 2
    bne    LD501                 ; 2³+1
    ldx    ram_DC                ; 3
    cpx    #$60                  ; 2
    bcc    LD4A5                 ; 2³
    bit    ram_9D                ; 3
    bmi    LD486                 ; 2³
    ldx    #$00                  ; 2
    lda    ram_C9                ; 3
    cmp    #$20                  ; 2
    bcs    LD4A3                 ; 2³
    lda    #$20                  ; 2
LD4A3:
    sta    ram_CC                ; 3
LD4A5:
    inx                          ; 2
    stx    ram_DC                ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    #$07                  ; 2
    bpl    LD4B0                 ; 2³
    lda    #$00                  ; 2
LD4B0:
    sta    ram_D2                ; 3
    and    #$F8                  ; 2
    cmp    ram_D5                ; 3
    beq    LD501                 ; 2³+1
    sta    ram_D5                ; 3
    lda    ram_D4                ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    ram_D4                ; 3
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LDBFF,X               ; 4
    clc                          ; 2
    adc    LDBFF,Y               ; 4
    clc                          ; 2
    adc    ram_CC                ; 3
    ldx    #$00                  ; 2
    cmp    #$87                  ; 2
    bcs    LD4E2                 ; 2³
    cmp    #$18                  ; 2
    bcc    LD4DE                 ; 2³
    sbc    ram_C9                ; 3
    sbc    #$03                  ; 2
    bpl    LD4E2                 ; 2³
LD4DE:
    inx                          ; 2
    inx                          ; 2
    eor    #$FF                  ; 2
LD4E2:
    cmp    #$09                  ; 2
    bcc    LD4E7                 ; 2³
    inx                          ; 2
LD4E7:
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_84                ; 3
    lda    ram_D4                ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    LDBFF,X               ; 4
    clc                          ; 2
    adc    ram_CC                ; 3
    sta    ram_CC                ; 3
    lda    ram_D4                ; 3
    lsr                          ; 2
    lsr                          ; 2
    ora    ram_84                ; 3
    sta    ram_D4                ; 3
LD501:
    lda    ram_D4                ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    LDBFB,X               ; 4
    sta    ram_D6                ; 3
    lda    #$FA                  ; 2
    sta    ram_D7                ; 3
    lda    ram_D4                ; 3
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LDBFB,X               ; 4
    sec                          ; 2
    sbc    #$08                  ; 2
    sta    ram_D8                ; 3
LD51C:
    bit    ram_9D                ; 3
    bpl    LD523                 ; 2³
    jmp    LD802                 ; 3

LD523:
    bit    ram_A1                ; 3
    bpl    LD52A                 ; 2³
    jmp    LD78C                 ; 3

LD52A:
    lda    ram_82                ; 3
    ror                          ; 2
    bcc    LD532                 ; 2³
    jmp    LD627                 ; 3

LD532:
    ldx    ram_81                ; 3
    cpx    #$05                  ; 2
    beq    LD579                 ; 2³
    bit    ram_8D                ; 3
    bvc    LD56E                 ; 2³
    ldx    ram_CB                ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    ram_C9                ; 3
    tay                          ; 2
    lda    SWCHA                 ; 4
    ror                          ; 2
    bcc    LD55B                 ; 2³
    ror                          ; 2
    bcs    LD579                 ; 2³
    cpy    #$09                  ; 2
    bcc    LD579                 ; 2³
    tya                          ; 2
    bpl    LD556                 ; 2³
LD553:
    inx                          ; 2
    bne    LD557                 ; 2³
LD556:
    dex                          ; 2
LD557:
    stx    ram_CB                ; 3
    bne    LD579                 ; 2³
LD55B:
    cpx    #$75                  ; 2
    bcs    LD579                 ; 2³
    cpx    #$1A                  ; 2
    bcc    LD579                 ; 2³
    dey                          ; 2
    dey                          ; 2
    cpy    #$07                  ; 2
    bcc    LD579                 ; 2³
    tya                          ; 2
    bpl    LD553                 ; 2³
    bmi    LD556                 ; 3   always branch

LD56E:
    bit    ram_B4                ; 3
    bmi    LD579                 ; 2³
    bit    ram_8A                ; 3
    bpl    LD57C                 ; 2³
    ror                          ; 2
    bcc    LD57C                 ; 2³
LD579:
    jmp    LD5E0                 ; 3

LD57C:
    ldx    #$01                  ; 2
    lda    SWCHA                 ; 4
    sta    ram_85                ; 3
    and    #$0F                  ; 2
    cmp    #$0F                  ; 2
    beq    LD579                 ; 2³
    sta    ram_92                ; 3
    jsr    LDFC0                 ; 6
    ldx    ram_81                ; 3
    ldy    #$00                  ; 2
    sty    ram_84                ; 3
    beq    LD599                 ; 3   always branch

LD596:
    tax                          ; 2
    inc    ram_84                ; 5
LD599:
    lda    ram_C9                ; 3
    pha                          ; 3
    lda    ram_CF                ; 3
    ldy    ram_84                ; 3
    cpy    #$02                  ; 2
    bcs    LD5AC                 ; 2³
    sta    ram_86                ; 3
    pla                          ; 4
    sta    ram_87                ; 3
    jmp    LD5B1                 ; 3

LD5AC:
    sta    ram_87                ; 3
    pla                          ; 4
    sta    ram_86                ; 3
LD5B1:
    ror    ram_85                ; 5
    bcs    LD5D1                 ; 2³
    jsr    LD97C                 ; 6
    bcs    LD5DB                 ; 2³
    bvc    LD5D1                 ; 2³
    ldy    ram_84                ; 3
    lda    LDF6C,Y               ; 4
    cpy    #$02                  ; 2
    bcs    LD5CC                 ; 2³
    adc    ram_CF                ; 3
    sta    ram_CF                ; 3
    jmp    LD5D1                 ; 3

LD5CC:
    clc                          ; 2
    adc    ram_C9                ; 3
    sta    ram_C9                ; 3
LD5D1:
    txa                          ; 2
    clc                          ; 2
    adc    #$0D                  ; 2
    cmp    #$34                  ; 2
    bcc    LD596                 ; 2³
    bcs    LD5E0                 ; 3   always branch

LD5DB:
    sty    ram_81                ; 3
    jsr    LD878                 ; 6
LD5E0:
    bit    INPT4                 ; 3
    bmi    LD5F5                 ; 2³
    bit    ram_9A                ; 3
    bmi    LD624                 ; 2³+1
    lda    ram_8A                ; 3
    ror                          ; 2
    bcs    LD5FA                 ; 2³
    sec                          ; 2
    jsr    LDA10                 ; 6
    inc    ram_8A                ; 5
    bne    LD5FA                 ; 2³
LD5F5:
    ror    ram_8A                ; 5
    clc                          ; 2
    rol    ram_8A                ; 5
LD5FA:
    lda    ram_91                ; 3
    bpl    LD624                 ; 2³+1
    and    #$1F                  ; 2
    cmp    #$01                  ; 2
    bne    LD60C                 ; 2³
    inc    ram_A0                ; 5
    inc    ram_A0                ; 5
    inc    ram_A0                ; 5
    bne    LD620                 ; 3   always branch?

LD60C:
    cmp    #$0B                  ; 2
    bne    LD61D                 ; 2³
    ror    ram_B2                ; 5
    sec                          ; 2
    rol    ram_B2                ; 5
    ldx    #$45                  ; 2
    stx    ram_DF                ; 3
    ldx    #$7F                  ; 2
    stx    ram_D0                ; 3
LD61D:
    jsr    LDCE9                 ; 6
LD620:
    lda    #$00                  ; 2
    sta    ram_91                ; 3
LD624:
    jmp    LD777                 ; 3

LD627:
    bit    ram_9A                ; 3
    bmi    LD624                 ; 2³
    bit    INPT5                 ; 3
    bpl    LD638                 ; 2³
    lda    #$FD                  ; 2
    and    ram_8A                ; 3
    sta    ram_8A                ; 3
    jmp    LD777                 ; 3

LD638:
    lda    #$02                  ; 2
    bit    ram_8A                ; 3
    bne    LD696                 ; 2³
    ora    ram_8A                ; 3
    sta    ram_8A                ; 3
    ldx    ram_C5                ; 3
    cpx    #$05                  ; 2
    beq    LD64C                 ; 2³
    cpx    #$06                  ; 2
    bne    LD671                 ; 2³
LD64C:
    ldx    ram_CF                ; 3
    stx    ram_D1                ; 3
    ldy    ram_C9                ; 3
    sty    ram_CB                ; 3
    lda    ram_83                ; 3
    adc    #$04                  ; 2
    sta    ram_9B                ; 3
    lda    #$80                  ; 2
    cpx    #$35                  ; 2
    bcs    LD66C                 ; 2³
    cpy    #$64                  ; 2
    bcc    LD66C                 ; 2³
    ldx    ram_81                ; 3
    cpx    #$02                  ; 2
    bne    LD66C                 ; 2³
    ora    #$01                  ; 2
LD66C:
    sta    ram_9A                ; 3
    jmp    LD777                 ; 3

LD671:
    cpx    #$03                  ; 2
    bne    LD68B                 ; 2³
    stx    ram_A8                ; 3
    lda    ram_B4                ; 3
    bmi    LD696                 ; 2³
    ora    #$80                  ; 2
    sta    ram_B4                ; 3
    lda    ram_CF                ; 3
    sbc    #$06                  ; 2
    bpl    LD687                 ; 2³
    lda    #$01                  ; 2
LD687:
    sta    ram_CF                ; 3
    bpl    LD6D2                 ; 2³
LD68B:
    bit    ram_8D                ; 3
    bvc    LD6D5                 ; 2³
    bit    CXM1FB                ; 3
    bmi    LD699                 ; 2³
    jsr    LD2CE                 ; 6
LD696:
    jmp    LD777                 ; 3

LD699:
    lda    ram_D1                ; 3
    lsr                          ; 2
    sec                          ; 2
    sbc    #$06                  ; 2
    clc                          ; 2
    adc    ram_DF                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    #$08                  ; 2
    bcc    LD6AC                 ; 2³
    lda    #$07                  ; 2
LD6AC:
    sta    ram_84                ; 3
    lda    ram_CB                ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    and    #$60                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    adc    ram_84                ; 3
    tay                          ; 2
    lda    LDF7C,Y               ; 4
    sta    ram_8B                ; 3
    ldx    ram_D1                ; 3
    dex                          ; 2
    stx    ram_D1                ; 3
    stx    ram_CF                ; 3
    ldx    ram_CB                ; 3
    dex                          ; 2
    dex                          ; 2
    stx    ram_CB                ; 3
    stx    ram_C9                ; 3
    lda    #$46                  ; 2
    sta    ram_8D                ; 3
LD6D2:
    jmp    LD773                 ; 3

LD6D5:
    cpx    #$0B                  ; 2
    bne    LD6F7                 ; 2³
    lda    ram_CF                ; 3
    cmp    #$41                  ; 2
    bcc    LD696                 ; 2³
    bit    CXPPMM                ; 3
    bpl    LD696                 ; 2³
    inc    ram_97                ; 5
    bne    LD696                 ; 2³
    ldy    ram_96                ; 3
    dey                          ; 2
    cpy    #$54                  ; 2
    bcs    LD6EF                 ; 2³
    iny                          ; 2
LD6EF:
    sty    ram_96                ; 3
    lda    #$0A                  ; 2
    sta    ram_A7                ; 3
    bne    LD696                 ; 3   always branch

LD6F7:
    cpx    #$10                  ; 2
    bne    LD71E                 ; 2³+1
    ldx    ram_81                ; 3
    cpx    #$00                  ; 2
    beq    LD696                 ; 2³+1
    lda    #$09                  ; 2
    sta    ram_A9                ; 3
    sta    ram_81                ; 3
    jsr    LD878                 ; 6
    lda    #$4C                  ; 2
    sta    ram_C9                ; 3
    sta    ram_CB                ; 3
    lda    #$46                  ; 2
    sta    ram_CF                ; 3
    sta    ram_D1                ; 3
    sta    ram_8D                ; 3
    lda    #$1D                  ; 2
    sta    ram_DF                ; 3
    bne    LD777                 ; 3   always branch

LD71E:
    lda    SWCHA                 ; 4
    and    #$0F                  ; 2
    cmp    #$0F                  ; 2
    beq    LD777                 ; 2³
    cpx    #$0D                  ; 2
    bne    LD747                 ; 2³
    bit    ram_8F                ; 3
    bmi    LD777                 ; 2³
    ldy    ram_A0                ; 3
    bmi    LD777                 ; 2³
    dec    ram_A0                ; 5
    ora    #$80                  ; 2
    sta    ram_8F                ; 3
    lda    ram_CF                ; 3
    adc    #$04                  ; 2
    sta    ram_D1                ; 3
    lda    ram_C9                ; 3
    adc    #$04                  ; 2
    sta    ram_CB                ; 3
    bne    LD773                 ; 3   always branch?

LD747:
    cpx    #$0A                  ; 2
    bne    LD777                 ; 2³
    ora    #$80                  ; 2
    sta    ram_8D                ; 3
    ldy    #$04                  ; 2
    ldx    #$05                  ; 2
    ror                          ; 2
    bcs    LD758                 ; 2³
    ldx    #$FA                  ; 2
LD758:
    ror                          ; 2
    bcs    LD75D                 ; 2³
    ldx    #$0F                  ; 2
LD75D:
    ror                          ; 2
    bcs    LD762                 ; 2³
    ldy    #$F7                  ; 2
LD762:
    ror                          ; 2
    bcs    LD767                 ; 2³
    ldy    #$10                  ; 2
LD767:
    tya                          ; 2
    clc                          ; 2
    adc    ram_C9                ; 3
    sta    ram_CB                ; 3
    txa                          ; 2
    clc                          ; 2
    adc    ram_CF                ; 3
    sta    ram_D1                ; 3
LD773:
    lda    #$0F                  ; 2
    sta    ram_A3                ; 3
LD777:
    bit    ram_B4                ; 3
    bpl    LD783                 ; 2³
    lda    #<LFA63               ; 2
    sta    ram_D9                ; 3
    lda    #$0F                  ; 2
    bne    LD792                 ; 3   always branch

LD783:
    lda    SWCHA                 ; 4
    and    #$0F                  ; 2
    cmp    #$0F                  ; 2
    bne    LD796                 ; 2³
LD78C:
    lda    #<LFA58               ; 2
LD78E:
    sta    ram_D9                ; 3
    lda    #$0B                  ; 2
LD792:
    sta    ram_DB                ; 3
    bne    LD7B2                 ; 3   always branch

LD796:
    lda    #$03                  ; 2
    bit    ram_8A                ; 3
    bmi    LD79D                 ; 2³
    lsr                          ; 2
LD79D:
    and    ram_82                ; 3
    bne    LD7B2                 ; 2³
    lda    #$0B                  ; 2
    clc                          ; 2
    adc    ram_D9                ; 3
    cmp    #<LFA58               ; 2
    bcc    LD78E                 ; 2³
    lda    #$02                  ; 2
    sta    ram_A3                ; 3
    lda    #<LFA00               ; 2
    bcs    LD78E                 ; 3   always branch

LD7B2:
    ldx    ram_81                ; 3
    cpx    #$09                  ; 2
    beq    LD7BC                 ; 2³
    cpx    #$0A                  ; 2
    bne    LD802                 ; 2³+1
LD7BC:
    lda    ram_82                ; 3
    bit    ram_8A                ; 3
    bpl    LD7C3                 ; 2³
    lsr                          ; 2
LD7C3:
    ldy    ram_CF                ; 3
    cpy    #$27                  ; 2
    beq    LD802                 ; 2³+1
    ldx    ram_DF                ; 3
    bcs    LD7E8                 ; 2³
    beq    LD802                 ; 2³+1
    inc    ram_CF                ; 5
    inc    ram_D1                ; 5
    and    #$02                  ; 2
    bne    LD802                 ; 2³+1
    dec    ram_DF                ; 5
    inc    ram_CE                ; 5
    inc    ram_D0                ; 5
    inc    ram_D2                ; 5
    inc    ram_CE                ; 5
    inc    ram_D0                ; 5
    inc    ram_D2                ; 5
    jmp    LD802                 ; 3

LD7E8:
    cpx    #$50                  ; 2
    bcs    LD802                 ; 2³+1
    dec    ram_CF                ; 5
    dec    ram_D1                ; 5
    and    #$02                  ; 2
    bne    LD802                 ; 2³+1
    inc    ram_DF                ; 5
    dec    ram_CE                ; 5
    dec    ram_D0                ; 5
    dec    ram_D2                ; 5
    dec    ram_CE                ; 5
    dec    ram_D0                ; 5
    dec    ram_D2                ; 5
LD802:
    lda    #<LF528               ; 2
    sta    ram_88                ; 3
    lda    #>LF528               ; 2
    sta    ram_89                ; 3
    jmp    LDFAD                 ; 3

LD80D:  ; indirect jump also
    lda    ram_99                ; 3
    beq    LD816                 ; 2³
    jsr    LDD59                 ; 6
    lda    #$00                  ; 2
LD816:
    sta    ram_99                ; 3
    ldx    ram_81                ; 3
    lda    LDB00,X               ; 4
    sta    NUSIZ0                ; 3
    lda    ram_94                ; 3
    sta    CTRLPF                ; 3
    lda    LDBA0,X               ; 4
    sta    COLUBK                ; 3
    lda    LDBAE,X               ; 4
    sta    COLUPF                ; 3
    lda    LDBC3,X               ; 4
    sta    COLUP0                ; 3
    lda    LDBBC,X               ; 4
    sta    COLUP1                ; 3
    cpx    #$0B                  ; 2
    bcc    LD84B                 ; 2³
    lda    #$20                  ; 2
    sta    ram_D4                ; 3
    ldx    #$04                  ; 2
LD841:
    ldy    ram_E5,X              ; 4
    lda    LDB00,Y               ; 4
    sta    ram_EE,X              ; 4
    dex                          ; 2
    bpl    LD841                 ; 2³
LD84B:
    jmp    LD006                 ; 3

LD84E:
    lda    #$4D                  ; 2
    sta    ram_C9                ; 3
    lda    #$48                  ; 2
    sta    ram_C8                ; 3
    lda    #$1F                  ; 2
    sta    ram_CF                ; 3
    rts                          ; 6

LD85B:
    ldx    #$00                  ; 2
    txa                          ; 2
LD85E:
    sta    ram_DF,X              ; 4
    sta    ram_E0,X              ; 4
    sta    ram_E1,X              ; 4
    sta    ram_E2,X              ; 4
    sta    ram_E3,X              ; 4
    sta    ram_E4,X              ; 4
    txa                          ; 2
    bne    LD873                 ; 2³
    ldx    #$06                  ; 2
    lda    #$14                  ; 2
    bne    LD85E                 ; 3   always branch

LD873:
    lda    #$FC                  ; 2
    sta    ram_D7                ; 3
    rts                          ; 6

LD878:
    lda    ram_9A                ; 3
    bpl    LD880                 ; 2³
    ora    #$40                  ; 2
    sta    ram_9A                ; 3
LD880:
    lda    #$5C                  ; 2
    sta    ram_96                ; 3
    ldx    #$00                  ; 2
    stx    ram_93                ; 3
    stx    ram_B6                ; 3
    stx    ram_8E                ; 3
    stx    ram_90                ; 3
    lda    ram_95                ; 3
    stx    ram_95                ; 3
    jsr    LDD59                 ; 6
    rol    ram_8A                ; 5
    clc                          ; 2
    ror    ram_8A                ; 5
    ldx    ram_81                ; 3
    lda    LDB92,X               ; 4
    sta    ram_94                ; 3
    cpx    #$0D                  ; 2
    beq    LD84E                 ; 2³
    cpx    #$05                  ; 2
    beq    LD8B1                 ; 2³
    cpx    #$0C                  ; 2
    beq    LD8B1                 ; 2³
    lda    #$00                  ; 2
    sta    ram_8B                ; 3
LD8B1:
    lda    LDBEE,X               ; 4
    sta    ram_DD                ; 3
    lda    LDBE1,X               ; 4
    sta    ram_DE                ; 3
    lda    LDBC9,X               ; 4
    sta    ram_DC                ; 3
    lda    LDBD4,X               ; 4
    sta    ram_C8                ; 3
    lda    LDC0E,X               ; 4
    sta    ram_CA                ; 3
    lda    LDC1B,X               ; 4
    sta    ram_D0                ; 3
    cpx    #$0B                  ; 2
    bcs    LD85B                 ; 2³
    adc    LDC03,X               ; 4
    sta    ram_E0                ; 3
    lda    LDC28,X               ; 4
    sta    ram_E1                ; 3
    lda    LDC33,X               ; 4
    sta    ram_E2                ; 3
    lda    LDC3E,X               ; 4
    sta    ram_E3                ; 3
    lda    LDC49,X               ; 4
    sta    ram_E4                ; 3
    lda    #$55                  ; 2
    sta    ram_D2                ; 3
    sta    ram_D1                ; 3
    cpx    #$06                  ; 2
    bcs    LD93E                 ; 2³+1
    lda    #$00                  ; 2
    cpx    #$00                  ; 2
    beq    LD91B                 ; 2³+1
    cpx    #$02                  ; 2
    beq    LD92A                 ; 2³
    sta    ram_CE                ; 3
LD902:
    ldy    #$4F                  ; 2
    cpx    #$02                  ; 2
    bcc    LD918                 ; 2³
    lda    ram_AF,X              ; 4
    ror                          ; 2
    bcc    LD918                 ; 2³
    ldy    LDF72,X               ; 4
    cpx    #$03                  ; 2
    bne    LD918                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_D0                ; 3
LD918:
    sty    ram_DF                ; 3
    rts                          ; 6

LD91B:
    lda    ram_AF                ; 3
    and    #$78                  ; 2
    sta    ram_AF                ; 3
    lda    #$1A                  ; 2
    sta    ram_CE                ; 3
    lda    #$26                  ; 2
    sta    ram_DF                ; 3
    rts                          ; 6

LD92A:
    lda    ram_B1                ; 3
    and    #$07                  ; 2
    lsr                          ; 2
    bne    LD935                 ; 2³
    ldy    #$FF                  ; 2
    sty    ram_D0                ; 3
LD935:
    tay                          ; 2
    lda    LDF70,Y               ; 4
    sta    ram_CE                ; 3
    jmp    LD902                 ; 3

LD93E:
    cpx    #$08                  ; 2
    beq    LD950                 ; 2³
    cpx    #$06                  ; 2
    bne    LD968                 ; 2³
    ldy    #$00                  ; 2
    sty    ram_D8                ; 3
    ldy    #$40                  ; 2
    sty    ram_E5                ; 3
    bne    LD958                 ; 3   always branch

LD950:
    ldy    #$FF                  ; 2
    sty    ram_E5                ; 3
    iny                          ; 2
    sty    ram_D8                ; 3
    iny                          ; 2
LD958:
    sty    ram_E6                ; 3
    sty    ram_E7                ; 3
    sty    ram_E8                ; 3
    sty    ram_E9                ; 3
    sty    ram_EA                ; 3
    ldy    #$39                  ; 2
    sty    ram_D4                ; 3
    sty    ram_D5                ; 3
LD968:
    cpx    #$09                  ; 2
    bne    LD977                 ; 2³
    ldy    ram_CF                ; 3
    cpy    #$49                  ; 2
    bcc    LD977                 ; 2³
    lda    #$50                  ; 2
    sta    ram_DF                ; 3
    rts                          ; 6

LD977:
    lda    #$00                  ; 2
    sta    ram_DF                ; 3
    rts                          ; 6

LD97C:
    ldy    LDE00,X               ; 4
    cpy    ram_86                ; 3
    beq    LD986                 ; 2³
    clc                          ; 2
    clv                          ; 2
    rts                          ; 6

LD986:
    ldy    LDE34,X               ; 4
    bmi    LD99B                 ; 2³
LD98B:
    lda    LDF04,X               ; 4
    beq    LD992                 ; 2³
LD990:
    sta    ram_CF                ; 3
LD992:
    lda    LDF38,X               ; 4
    beq    LD999                 ; 2³
    sta    ram_C9                ; 3
LD999:
    sec                          ; 2
    rts                          ; 6

LD99B:
    iny                          ; 2
    beq    LD9F9                 ; 2³
    iny                          ; 2
    bne    LD9B6                 ; 2³
    ldy    LDE68,X               ; 4
    cpy    ram_87                ; 3
    bcc    LD9AF                 ; 2³
    ldy    LDE9C,X               ; 4
    bmi    LD9C7                 ; 2³
    bpl    LD98B                 ; 3   always branch

LD9AF:
    ldy    LDED0,X               ; 4
    bmi    LD9C7                 ; 2³
    bpl    LD98B                 ; 3   always branch

LD9B6:
    lda    ram_87                ; 3
    cmp    LDE68,X               ; 4
    bcc    LD9F9                 ; 2³
    cmp    LDE9C,X               ; 4
    bcs    LD9F9                 ; 2³
    ldy    LDED0,X               ; 4
    bpl    LD98B                 ; 2³
LD9C7:
    iny                          ; 2
    bmi    LD9D4                 ; 2³
    ldy    #$08                  ; 2
    bit    ram_AF                ; 3
    bpl    LD98B                 ; 2³
    lda    #$41                  ; 2
    bne    LD990                 ; 3   always branch

LD9D4:
    iny                          ; 2
    bne    LD9E1                 ; 2³
    lda    ram_B5                ; 3
    and    #$0F                  ; 2
    bne    LD9F9                 ; 2³
    ldy    #$06                  ; 2
    bne    LD98B                 ; 3   always branch

LD9E1:
    iny                          ; 2
    bne    LD9F0                 ; 2³
    lda    ram_B5                ; 3
    and    #$0F                  ; 2
    cmp    #$0A                  ; 2
    bcs    LD9F9                 ; 2³
    ldy    #$06                  ; 2
    bne    LD98B                 ; 3   always branch

LD9F0:
    iny                          ; 2
    bne    LD9FE                 ; 2³
    ldy    #$01                  ; 2
    bit    ram_8A                ; 3
    bmi    LD98B                 ; 2³
LD9F9:
    clc                          ; 2
    bit    LD9FD                 ; 4
LD9FD:
    rts                          ; 6

LD9FE:
    iny                          ; 2
    bne    LD9F9                 ; 2³+1
    ldy    #$06                  ; 2
    lda    #$0E                  ; 2
    cmp    ram_C5                ; 3
    bne    LD9F9                 ; 2³+1
    bit    INPT5                 ; 3
    bmi    LD9F9                 ; 2³+1
    jmp    LD98B                 ; 3

LDA10:
    ldy    ram_C4                ; 3
    bne    LDA16                 ; 2³
    clc                          ; 2
    rts                          ; 6

LDA16:
    bcs    LDA40                 ; 2³
    tay                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ldx    #$0A                  ; 2
LDA1E:
    cmp    ram_B7,X              ; 4
    bne    LDA3A                 ; 2³
    cpx    ram_C3                ; 3
    beq    LDA3A                 ; 2³
    dec    ram_C4                ; 5
    lda    #<LFB00               ; 2
    sta    ram_B7,X              ; 4
    cpy    #$05                  ; 2
    bcc    LDA37                 ; 2³
    tya                          ; 2
    tax                          ; 2
    jsr    LDD1B                 ; 6
    txa                          ; 2
    tay                          ; 2
LDA37:
    jmp    LDAF7                 ; 3

LDA3A:
    dex                          ; 2
    dex                          ; 2
    bpl    LDA1E                 ; 2³
    clc                          ; 2
    rts                          ; 6

LDA40:
    lda    #<LFB00               ; 2
    ldx    ram_C3                ; 3
    sta    ram_B7,X              ; 4
    ldx    ram_C5                ; 3
    cpx    #$07                  ; 2
    bcc    LDA4F                 ; 2³
    jsr    LDD1B                 ; 6
LDA4F:
    txa                          ; 2
    tay                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    LDC77-1,X             ; 4
    pha                          ; 3
    lda    LDC77-2,X             ; 4
    pha                          ; 3
    ldx    ram_81                ; 3
    rts                          ; 6

LDA5E:  ; indirect jump
    lda    #$3F                  ; 2
    and    ram_B4                ; 3
    sta    ram_B4                ; 3
LDA64:
    jmp    LDAD8                 ; 3

LDA67:  ; indirect jump
    stx    ram_8D                ; 3
    lda    #$70                  ; 2
    sta    ram_D1                ; 3
    bne    LDA64                 ; 3   always branch

LDA6F:  ; indirect jump
    lda    #$42                  ; 2
    cmp    ram_91                ; 3
    bne    LDA86                 ; 2³
    lda    #$03                  ; 2
    sta    ram_81                ; 3
    jsr    LD878                 ; 6
    lda    #$15                  ; 2
    sta    ram_C9                ; 3
    lda    #$1C                  ; 2
    sta    ram_CF                ; 3
    bne    LDAD8                 ; 3   always branch

LDA86:
    cpx    #$05                  ; 2
    bne    LDAD8                 ; 2³
    lda    #$05                  ; 2
    cmp    ram_8B                ; 3
    bne    LDAD8                 ; 2³
    sta    ram_AA                ; 3
    lda    #$00                  ; 2
    sta    ram_CE                ; 3
    lda    #$02                  ; 2
    ora    ram_B4                ; 3
    sta    ram_B4                ; 3
    bne    LDAD8                 ; 3   always branch

LDA9E:  ; indirect jump
    ror    ram_B1                ; 5
    clc                          ; 2
    rol    ram_B1                ; 5
    cpx    #$02                  ; 2
    bne    LDAAB                 ; 2³
    lda    #$4E                  ; 2
    sta    ram_DF                ; 3
LDAAB:
    bne    LDAD8                 ; 3   always branch

LDAAD:  ; indirect jump
    ror    ram_B2                ; 5
    clc                          ; 2
    rol    ram_B2                ; 5
    cpx    #$03                  ; 2
    bne    LDABE                 ; 2³
    lda    #$4F                  ; 2
    sta    ram_DF                ; 3
    lda    #$4B                  ; 2
    sta    ram_D0                ; 3
LDABE:
    bne    LDAD8                 ; 3   always branch

LDAC0:  ; indirect jump
    ldx    ram_81                ; 3
    cpx    #$03                  ; 2
    bne    LDAD1                 ; 2³
    lda    ram_C9                ; 3
    cmp    #$3C                  ; 2
    bcs    LDAD1                 ; 2³
    rol    ram_B2                ; 5
    sec                          ; 2
    ror    ram_B2                ; 5
LDAD1:
    lda    ram_91                ; 3
    clc                          ; 2
    adc    #$40                  ; 2
    sta    ram_91                ; 3
LDAD8:  ; indirect jump also
    dec    ram_C4                ; 5
    bne    LDAE2                 ; 2³
    lda    #$00                  ; 2
    sta    ram_C5                ; 3
    beq    LDAF7                 ; 3   always branch

LDAE2:
    ldx    ram_C3                ; 3
LDAE4:
    inx                          ; 2
    inx                          ; 2
    cpx    #$0B                  ; 2
    bcc    LDAEC                 ; 2³
    ldx    #$00                  ; 2
LDAEC:
    lda    ram_B7,X              ; 4
    beq    LDAE4                 ; 2³
    stx    ram_C3                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_C5                ; 3
LDAF7:
    lda    #$0D                  ; 2
    sta    ram_A2                ; 3
    sec                          ; 2
    rts                          ; 6

    .byte $00 ; |        | $DAFD
    .byte $00 ; |        | $DAFE
    .byte $00 ; |        | $DAFF
LDB00:
    .byte $00 ; |        | $DB00
    .byte $00 ; |        | $DB01
    .byte $35 ; |  XX X X| $DB02
    .byte $10 ; |   X    | $DB03
    .byte $17 ; |   X XXX| $DB04
    .byte $30 ; |  XX    | $DB05
    .byte $00 ; |        | $DB06
    .byte $00 ; |        | $DB07
    .byte $00 ; |        | $DB08
    .byte $00 ; |        | $DB09
    .byte $00 ; |        | $DB0A
    .byte $00 ; |        | $DB0B
    .byte $00 ; |        | $DB0C
    .byte $05 ; |     X X| $DB0D
    .byte $00 ; |        | $DB0E
    .byte $00 ; |        | $DB0F
    .byte $F0 ; |XXXX    | $DB10
    .byte $E0 ; |XXX     | $DB11
    .byte $D0 ; |XX X    | $DB12
    .byte $C0 ; |XX      | $DB13
    .byte $B0 ; |X XX    | $DB14
    .byte $A0 ; |X X     | $DB15
    .byte $90 ; |X  X    | $DB16
    .byte $71 ; | XXX   X| $DB17
    .byte $61 ; | XX    X| $DB18
    .byte $51 ; | X X   X| $DB19
    .byte $41 ; | X     X| $DB1A
    .byte $31 ; |  XX   X| $DB1B
    .byte $21 ; |  X    X| $DB1C
    .byte $11 ; |   X   X| $DB1D
    .byte $01 ; |       X| $DB1E
    .byte $F1 ; |XXXX   X| $DB1F
    .byte $E1 ; |XXX    X| $DB20
    .byte $D1 ; |XX X   X| $DB21
    .byte $C1 ; |XX     X| $DB22
    .byte $B1 ; |X XX   X| $DB23
    .byte $A1 ; |X X    X| $DB24
    .byte $91 ; |X  X   X| $DB25
    .byte $72 ; | XXX  X | $DB26
    .byte $62 ; | XX   X | $DB27
    .byte $52 ; | X X  X | $DB28
    .byte $42 ; | X    X | $DB29
    .byte $32 ; |  XX  X | $DB2A
    .byte $22 ; |  X   X | $DB2B
    .byte $12 ; |   X  X | $DB2C
    .byte $02 ; |      X | $DB2D
    .byte $F2 ; |XXXX  X | $DB2E
    .byte $E2 ; |XXX   X | $DB2F
    .byte $D2 ; |XX X  X | $DB30
    .byte $C2 ; |XX    X | $DB31
    .byte $B2 ; |X XX  X | $DB32
    .byte $A2 ; |X X   X | $DB33
    .byte $92 ; |X  X  X | $DB34
    .byte $73 ; | XXX  XX| $DB35
    .byte $63 ; | XX   XX| $DB36
    .byte $53 ; | X X  XX| $DB37
    .byte $43 ; | X    XX| $DB38
    .byte $33 ; |  XX  XX| $DB39
    .byte $23 ; |  X   XX| $DB3A
    .byte $13 ; |   X  XX| $DB3B
    .byte $03 ; |      XX| $DB3C
    .byte $F3 ; |XXXX  XX| $DB3D
    .byte $E3 ; |XXX   XX| $DB3E
    .byte $D3 ; |XX X  XX| $DB3F
    .byte $C3 ; |XX    XX| $DB40
    .byte $B3 ; |X XX  XX| $DB41
    .byte $A3 ; |X X   XX| $DB42
    .byte $93 ; |X  X  XX| $DB43
    .byte $74 ; | XXX X  | $DB44
    .byte $64 ; | XX  X  | $DB45
    .byte $54 ; | X X X  | $DB46
    .byte $44 ; | X   X  | $DB47
    .byte $34 ; |  XX X  | $DB48
    .byte $24 ; |  X  X  | $DB49
    .byte $14 ; |   X X  | $DB4A
    .byte $04 ; |     X  | $DB4B
    .byte $F4 ; |XXXX X  | $DB4C
    .byte $E4 ; |XXX  X  | $DB4D
    .byte $D4 ; |XX X X  | $DB4E
    .byte $C4 ; |XX   X  | $DB4F
    .byte $B4 ; |X XX X  | $DB50
    .byte $A4 ; |X X  X  | $DB51
    .byte $94 ; |X  X X  | $DB52
    .byte $75 ; | XXX X X| $DB53
    .byte $65 ; | XX  X X| $DB54
    .byte $55 ; | X X X X| $DB55
    .byte $45 ; | X   X X| $DB56
    .byte $35 ; |  XX X X| $DB57
    .byte $25 ; |  X  X X| $DB58
    .byte $15 ; |   X X X| $DB59
    .byte $05 ; |     X X| $DB5A
    .byte $F5 ; |XXXX X X| $DB5B
    .byte $E5 ; |XXX  X X| $DB5C
    .byte $D5 ; |XX X X X| $DB5D
    .byte $C5 ; |XX   X X| $DB5E
    .byte $B5 ; |X XX X X| $DB5F
    .byte $A5 ; |X X  X X| $DB60
    .byte $95 ; |X  X X X| $DB61
    .byte $76 ; | XXX XX | $DB62
    .byte $66 ; | XX  XX | $DB63
    .byte $56 ; | X X XX | $DB64
    .byte $46 ; | X   XX | $DB65
    .byte $36 ; |  XX XX | $DB66
    .byte $26 ; |  X  XX | $DB67
    .byte $16 ; |   X XX | $DB68
    .byte $06 ; |     XX | $DB69
    .byte $F6 ; |XXXX XX | $DB6A
    .byte $E6 ; |XXX  XX | $DB6B
    .byte $D6 ; |XX X XX | $DB6C
    .byte $C6 ; |XX   XX | $DB6D
    .byte $B6 ; |X XX XX | $DB6E
    .byte $A6 ; |X X  XX | $DB6F
    .byte $96 ; |X  X XX | $DB70
    .byte $77 ; | XXX XXX| $DB71
    .byte $67 ; | XX  XXX| $DB72
    .byte $57 ; | X X XXX| $DB73
    .byte $47 ; | X   XXX| $DB74
    .byte $37 ; |  XX XXX| $DB75
    .byte $27 ; |  X  XXX| $DB76
    .byte $17 ; |   X XXX| $DB77
    .byte $07 ; |     XXX| $DB78
    .byte $F7 ; |XXXX XXX| $DB79
    .byte $E7 ; |XXX  XXX| $DB7A
    .byte $D7 ; |XX X XXX| $DB7B
    .byte $C7 ; |XX   XXX| $DB7C
    .byte $B7 ; |X XX XXX| $DB7D
    .byte $A7 ; |X X  XXX| $DB7E
    .byte $97 ; |X  X XXX| $DB7F
    .byte $78 ; | XXXX   | $DB80
    .byte $68 ; | XX X   | $DB81
    .byte $58 ; | X XX   | $DB82
    .byte $48 ; | X  X   | $DB83
    .byte $38 ; |  XXX   | $DB84
    .byte $28 ; |  X X   | $DB85
    .byte $18 ; |   XX   | $DB86
    .byte $08 ; |    X   | $DB87
    .byte $F8 ; |XXXXX   | $DB88
    .byte $E8 ; |XXX X   | $DB89
    .byte $D8 ; |XX XX   | $DB8A
    .byte $C8 ; |XX  X   | $DB8B
    .byte $B8 ; |X XXX   | $DB8C
    .byte $A8 ; |X X X   | $DB8D
    .byte $98 ; |X  XX   | $DB8E
    .byte $79 ; | XXXX  X| $DB8F
    .byte $69 ; | XX X  X| $DB90
    .byte $59 ; | X XX  X| $DB91
LDB92:
    .byte $11 ; |   X   X| $DB92
    .byte $11 ; |   X   X| $DB93
    .byte $11 ; |   X   X| $DB94
    .byte $11 ; |   X   X| $DB95
    .byte $31 ; |  XX   X| $DB96
    .byte $11 ; |   X   X| $DB97
    .byte $25 ; |  X  X X| $DB98
    .byte $05 ; |     X X| $DB99
    .byte $05 ; |     X X| $DB9A
    .byte $01 ; |       X| $DB9B
    .byte $01 ; |       X| $DB9C
    .byte $05 ; |     X X| $DB9D
    .byte $05 ; |     X X| $DB9E
    .byte $01 ; |       X| $DB9F
LDBA0:
    .byte $00 ; |        | $DBA0
    .byte $24 ; |  X  X  | $DBA1
    .byte $96 ; |X  X XX | $DBA2
    .byte $22 ; |  X   X | $DBA3
    .byte $72 ; | XXX  X | $DBA4
    .byte $FC ; |XXXXXX  | $DBA5
    .byte $00 ; |        | $DBA6
    .byte $00 ; |        | $DBA7
    .byte $00 ; |        | $DBA8
    .byte $72 ; | XXX  X | $DBA9
    .byte $12 ; |   X  X | $DBAA
    .byte $00 ; |        | $DBAB
    .byte $F8 ; |XXXXX   | $DBAC
    .byte $00 ; |        | $DBAD
LDBAE:
    .byte $08 ; |    X   | $DBAE
    .byte $22 ; |  X   X | $DBAF
    .byte $08 ; |    X   | $DBB0
    .byte $00 ; |        | $DBB1
    .byte $1A ; |   XX X | $DBB2
    .byte $28 ; |  X X   | $DBB3
    .byte $C8 ; |XX  X   | $DBB4
    .byte $E8 ; |XXX X   | $DBB5
    .byte $8A ; |X   X X | $DBB6
    .byte $1A ; |   XX X | $DBB7
    .byte $C6 ; |XX   XX | $DBB8
    .byte $00 ; |        | $DBB9
    .byte $28 ; |  X X   | $DBBA
    .byte $78 ; | XXXX   | $DBBB
LDBBC:
    .byte $CC ; |XX  XX  | $DBBC
    .byte $EA ; |XXX X X | $DBBD
    .byte $5A ; | X XX X | $DBBE
    .byte $26 ; |  X  XX | $DBBF
    .byte $9E ; |X  XXXX | $DBC0
    .byte $A6 ; |X X  XX | $DBC1
    .byte $7C ; | XXXXX  | $DBC2
LDBC3:
    .byte $88 ; |X   X   | $DBC3
    .byte $28 ; |  X X   | $DBC4
    .byte $F8 ; |XXXXX   | $DBC5
    .byte $4A ; | X  X X | $DBC6
    .byte $26 ; |  X  XX | $DBC7
    .byte $A8 ; |X X X   | $DBC8
LDBC9:
    .byte $CC ; |XX  XX  | $DBC9
    .byte $CE ; |XX  XXX | $DBCA
    .byte $4A ; | X  X X | $DBCB
    .byte $98 ; |X  XX   | $DBCC
    .byte $00 ; |        | $DBCD
    .byte $00 ; |        | $DBCE
    .byte $00 ; |        | $DBCF
    .byte $08 ; |    X   | $DBD0
    .byte $07 ; |     XXX| $DBD1
    .byte $01 ; |       X| $DBD2
    .byte $10 ; |   X    | $DBD3
LDBD4:
    .byte $78 ; | XXXX   | $DBD4
    .byte $4C ; | X  XX  | $DBD5
    .byte $5D ; | X XXX X| $DBD6
    .byte $4C ; | X  XX  | $DBD7
    .byte $4F ; | X  XXXX| $DBD8
    .byte $4C ; | X  XX  | $DBD9
    .byte $12 ; |   X  X | $DBDA
    .byte $4C ; | X  XX  | $DBDB
    .byte $4C ; | X  XX  | $DBDC
    .byte $4C ; | X  XX  | $DBDD
    .byte $4C ; | X  XX  | $DBDE
    .byte $12 ; |   X  X | $DBDF
    .byte $12 ; |   X  X | $DBE0
LDBE1:
    .byte $FF ; |XXXXXXXX| $DBE1
    .byte $FF ; |XXXXXXXX| $DBE2
    .byte $FF ; |XXXXXXXX| $DBE3
    .byte $F9 ; |XXXXX  X| $DBE4
    .byte $F9 ; |XXXXX  X| $DBE5
    .byte $F9 ; |XXXXX  X| $DBE6
    .byte $FA ; |XXXXX X | $DBE7
    .byte $00 ; |        | $DBE8
    .byte $FD ; |XXXXXX X| $DBE9
    .byte $FB ; |XXXXX XX| $DBEA
    .byte $FC ; |XXXXXX  | $DBEB
    .byte $FC ; |XXXXXX  | $DBEC
    .byte $FC ; |XXXXXX  | $DBED
LDBEE:
    .byte $00 ; |        | $DBEE
    .byte $51 ; | X X   X| $DBEF
    .byte $A1 ; |X X    X| $DBF0
    .byte $00 ; |        | $DBF1
    .byte $51 ; | X X   X| $DBF2
    .byte $A2 ; |X X   X | $DBF3
    .byte $C1 ; |XX     X| $DBF4
    .byte $E5 ; |XXX  X X| $DBF5
    .byte $E0 ; |XXX     | $DBF6
    .byte $00 ; |        | $DBF7
    .byte $00 ; |        | $DBF8
    .byte $00 ; |        | $DBF9
    .byte $00 ; |        | $DBFA
LDBFB:
    .byte $72 ; | XXX  X | $DBFB
    .byte $7A ; | XXXX X | $DBFC
    .byte $8A ; |X   X X | $DBFD
    .byte $82 ; |X     X | $DBFE
LDBFF:
    .byte $FE ; |XXXXXXX | $DBFF
    .byte $FA ; |XXXXX X | $DC00
    .byte $02 ; |      X | $DC01
    .byte $06 ; |     XX | $DC02
LDC03:
    .byte $00 ; |        | $DC03
    .byte $00 ; |        | $DC04
    .byte $18 ; |   XX   | $DC05
    .byte $04 ; |     X  | $DC06
    .byte $03 ; |      XX| $DC07
    .byte $03 ; |      XX| $DC08
    .byte $85 ; |X    X X| $DC09
    .byte $85 ; |X    X X| $DC0A
    .byte $3B ; |  XXX XX| $DC0B
    .byte $85 ; |X    X X| $DC0C
    .byte $85 ; |X    X X| $DC0D
LDC0E:
    .byte $20 ; |  X     | $DC0E
    .byte $78 ; | XXXX   | $DC0F
    .byte $85 ; |X    X X| $DC10
    .byte $4D ; | X  XX X| $DC11
    .byte $62 ; | XX   X | $DC12
    .byte $17 ; |   X XXX| $DC13
    .byte $50 ; | X X    | $DC14
    .byte $50 ; | X X    | $DC15
    .byte $50 ; | X X    | $DC16
    .byte $50 ; | X X    | $DC17
    .byte $50 ; | X X    | $DC18
    .byte $12 ; |   X  X | $DC19
    .byte $12 ; |   X  X | $DC1A
LDC1B:
    .byte $FF ; |XXXXXXXX| $DC1B
    .byte $FF ; |XXXXXXXX| $DC1C
    .byte $14 ; |   X X  | $DC1D
    .byte $4B ; | X  X XX| $DC1E
    .byte $4A ; | X  X X | $DC1F
    .byte $44 ; | X   X  | $DC20
    .byte $FF ; |XXXXXXXX| $DC21
    .byte $27 ; |  X  XXX| $DC22
    .byte $FF ; |XXXXXXXX| $DC23
    .byte $FF ; |XXXXXXXX| $DC24
    .byte $FF ; |XXXXXXXX| $DC25
    .byte $F0 ; |XXXX    | $DC26
    .byte $F0 ; |XXXX    | $DC27
LDC28:
    .byte $06 ; |     XX | $DC28
    .byte $06 ; |     XX | $DC29
    .byte $06 ; |     XX | $DC2A
    .byte $06 ; |     XX | $DC2B
    .byte $06 ; |     XX | $DC2C
    .byte $06 ; |     XX | $DC2D
    .byte $48 ; | X  X   | $DC2E
    .byte $68 ; | XX X   | $DC2F
    .byte $89 ; |X   X  X| $DC30
    .byte $00 ; |        | $DC31
    .byte $00 ; |        | $DC32
LDC33:
    .byte $00 ; |        | $DC33
    .byte $00 ; |        | $DC34
    .byte $00 ; |        | $DC35
    .byte $00 ; |        | $DC36
    .byte $00 ; |        | $DC37
    .byte $00 ; |        | $DC38
    .byte $FD ; |XXXXXX X| $DC39
    .byte $FD ; |XXXXXX X| $DC3A
    .byte $FD ; |XXXXXX X| $DC3B
    .byte $FE ; |XXXXXXX | $DC3C
    .byte $FE ; |XXXXXXX | $DC3D
LDC3E:
    .byte $20 ; |  X     | $DC3E
    .byte $20 ; |  X     | $DC3F
    .byte $20 ; |  X     | $DC40
    .byte $20 ; |  X     | $DC41
    .byte $20 ; |  X     | $DC42
    .byte $20 ; |  X     | $DC43
    .byte $20 ; |  X     | $DC44
    .byte $B7 ; |X XX XXX| $DC45
    .byte $9B ; |X  XX XX| $DC46
    .byte $78 ; | XXXX   | $DC47
    .byte $78 ; | XXXX   | $DC48
LDC49:
    .byte $00 ; |        | $DC49
    .byte $00 ; |        | $DC4A
    .byte $00 ; |        | $DC4B
    .byte $00 ; |        | $DC4C
    .byte $00 ; |        | $DC4D
    .byte $00 ; |        | $DC4E
    .byte $FD ; |XXXXXX X| $DC4F
    .byte $FD ; |XXXXXX X| $DC50
    .byte $FD ; |XXXXXX X| $DC51
    .byte $FE ; |XXXXXXX | $DC52
    .byte $FE ; |XXXXXXX | $DC53
LDC54:
    .byte $01 ; |       X| $DC54
    .byte $02 ; |      X | $DC55
    .byte $04 ; |     X  | $DC56
    .byte $08 ; |    X   | $DC57
    .byte $10 ; |   X    | $DC58
    .byte $20 ; |  X     | $DC59
    .byte $40 ; | X      | $DC5A
    .byte $80 ; |X       | $DC5B
LDC5C:
    .byte $FE ; |XXXXXXX | $DC5C
    .byte $FD ; |XXXXXX X| $DC5D
    .byte $FB ; |XXXXX XX| $DC5E
    .byte $F7 ; |XXXX XXX| $DC5F
    .byte $EF ; |XXX XXXX| $DC60
    .byte $DF ; |XX XXXXX| $DC61
    .byte $BF ; |X XXXXXX| $DC62
    .byte $7F ; | XXXXXXX| $DC63
LDC64:
    .byte $00 ; |        | $DC64
    .byte $00 ; |        | $DC65
    .byte $00 ; |        | $DC66
    .byte $00 ; |        | $DC67
    .byte $08 ; |    X   | $DC68
    .byte $00 ; |        | $DC69
    .byte $02 ; |      X | $DC6A
    .byte $0A ; |    X X | $DC6B
    .byte $0C ; |    XX  | $DC6C
    .byte $0E ; |    XXX | $DC6D
    .byte $01 ; |       X| $DC6E
    .byte $03 ; |      XX| $DC6F
    .byte $04 ; |     X  | $DC70
    .byte $06 ; |     XX | $DC71
    .byte $05 ; |     X X| $DC72
    .byte $07 ; |     XXX| $DC73
    .byte $0D ; |    XX X| $DC74
    .byte $0F ; |    XXXX| $DC75
    .byte $0B ; |    X XX| $DC76
LDC77:
    .word LDAD8-1        ; $DC77
    .word LDAD8-1        ; $DC79
    .word LDA5E-1        ; $DC7B
    .word LDAC0-1        ; $DC7D
    .word LDAD8-1        ; $DC7F
    .word LDAD8-1        ; $DC81
    .word LDAD8-1        ; $DC83
    .word LDAD8-1        ; $DC85
    .word LDAD8-1        ; $DC87
    .word LDA9E-1        ; $DC89
    .word LDAAD-1        ; $DC8B
    .word LDAD8-1        ; $DC8D
    .word LDAD8-1        ; $DC8F
    .word LDAD8-1        ; $DC91
    .word LDAD8-1        ; $DC93
    .word LDA67-1        ; $DC95
    .word LDA6F-1        ; $DC97
    .word LDA67-1        ; $DC99
LDC9B:
    .word LD2B4-1        ; $DC9B
    .word LD1EB-1        ; $DC9D
    .word LD292-1        ; $DC9F
    .word LD24A-1        ; $DCA1
    .word LD2B4-1        ; $DCA3
    .word LD1C4-1        ; $DCA5
    .word LD28E-1        ; $DCA7
    .word LD1B9-1        ; $DCA9
    .word LD335-1        ; $DCAB
    .word LD2B4-1        ; $DCAD
    .word LD192-1        ; $DCAF
    .word LD18E-1        ; $DCB1
    .word LD162-1        ; $DCB3
LDCB5:
    .word LD374-1        ; $DCB5
    .word LD374-1        ; $DCB7
    .word LD321-1        ; $DCB9
    .word LD374-1        ; $DCBB
    .word LD374-1        ; $DCBD
    .word LD357-1        ; $DCBF
    .word LD302-1        ; $DCC1
    .word LD357-1        ; $DCC3
    .word LD335-1        ; $DCC5
    .word LD374-1        ; $DCC7
    .word LD36A-1        ; $DCC9
    .word LD374-1        ; $DCCB
    .word LD374-1        ; $DCCD
LDCCF:
    .word LD374-1        ; $DCCF
    .word LD374-1        ; $DCD1
    .word LD36F-1        ; $DCD3
    .word LD374-1        ; $DCD5
    .word LD2F2-1        ; $DCD7
    .word LD374-1        ; $DCD9
    .word LD374-1        ; $DCDB
    .word LD374-1        ; $DCDD
    .word LD374-1        ; $DCDF
    .word LD2CE-1        ; $DCE1
    .word LD36F-1        ; $DCE3
    .word LD374-1        ; $DCE5
    .word LD374-1        ; $DCE7

LDCE9:
    ldx    ram_C4                ; 3
    cpx    #$06                  ; 2
    bcc    LDCF1                 ; 2³
    clc                          ; 2
    rts                          ; 6

LDCF1:
    ldx    #$0A                  ; 2
LDCF3:
    ldy    ram_B7,X              ; 4
    beq    LDCFC                 ; 2³
    dex                          ; 2
    dex                          ; 2
    bpl    LDCF3                 ; 3   always branch

    .byte $00 ; |        | $DCFB

LDCFC:
    tay                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_B7,X              ; 4
    lda    ram_C4                ; 3
    bne    LDD0A                 ; 2³
    stx    ram_C3                ; 3
    sty    ram_C5                ; 3
LDD0A:
    inc    ram_C4                ; 5
    cpy    #$04                  ; 2
    bcc    LDD15                 ; 2³
    tya                          ; 2
    tax                          ; 2
    jsr    LDD2F                 ; 6
LDD15:
    lda    #$0C                  ; 2
    sta    ram_A2                ; 3
    sec                          ; 2
    rts                          ; 6

LDD1B:
    lda    LDC64,X               ; 4
    lsr                          ; 2
    tay                          ; 2
    lda    LDC5C,Y               ; 4
    bcs    LDD2A                 ; 2³
    and    ram_C6                ; 3
    sta    ram_C6                ; 3
    rts                          ; 6

LDD2A:
    and    ram_C7                ; 3
    sta    ram_C7                ; 3
    rts                          ; 6

LDD2F:
    lda    LDC64,X               ; 4
    lsr                          ; 2
    tax                          ; 2
    lda    LDC54,X               ; 4
    bcs    LDD3E                 ; 2³
    ora    ram_C6                ; 3
    sta    ram_C6                ; 3
    rts                          ; 6

LDD3E:
    ora    ram_C7                ; 3
    sta    ram_C7                ; 3
    rts                          ; 6

LDD43:
    lda    LDC64,X               ; 4
    lsr                          ; 2
    tay                          ; 2
    lda    LDC54,Y               ; 4
    bcs    LDD53                 ; 2³
    and    ram_C6                ; 3
    beq    LDD52                 ; 2³
    sec                          ; 2
LDD52:
    rts                          ; 6

LDD53:
    and    ram_C7                ; 3
    bne    LDD52                 ; 2³
    clc                          ; 2
    rts                          ; 6

LDD59:
    and    #$1F                  ; 2
    tax                          ; 2
    lda    ram_98                ; 3
    cpx    #$0C                  ; 2
    bcs    LDD67                 ; 2³
    adc    LDFE5,X               ; 4
    sta    ram_98                ; 3
LDD67:
    rts                          ; 6

START_0:
    sei                          ; 2
    cld                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    inx                          ; 2
    txa                          ; 2
LDD6F:
    sta    0,X                   ; 4
    dex                          ; 2
    bne    LDD6F                 ; 2³
    dex                          ; 2
    stx    ram_9E                ; 3
    lda    #>LFB00               ; 2
    sta    ram_B8                ; 3
    sta    ram_BA                ; 3
    sta    ram_BC                ; 3
    sta    ram_BE                ; 3
    sta    ram_C0                ; 3
    sta    ram_C2                ; 3
    lda    #<CopyrightOne        ; 2
    sta    ram_B7                ; 3
    lda    #<CopyrightTwo        ; 2
    sta    ram_B9                ; 3
    lda    #<CopyrightFour       ; 2
    sta    ram_BD                ; 3
    lda    #<CopyrightThree      ; 2
    sta    ram_BB                ; 3
    lda    #<CopyrightFive       ; 2
    sta    ram_BF                ; 3
    lda    #$0D                  ; 2
    sta    ram_81                ; 3
    lsr                          ; 2
    sta    ram_A0                ; 3
    jsr    LD878                 ; 6
    jmp    LD3DD                 ; 3

LDDA6:
    lda    #<LFB20               ; 2
    sta    ram_B7                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_C5                ; 3
    inc    ram_C4                ; 5
    lda    #<LFB00               ; 2
    sta    ram_B9                ; 3
    sta    ram_BB                ; 3
    sta    ram_BD                ; 3
    sta    ram_BF                ; 3
    lda    #$64                  ; 2
    sta    ram_9E                ; 3
    lda    #<LFA58               ; 2
    sta    ram_D9                ; 3
    lda    #>LFA58               ; 2
    sta    ram_DA                ; 3
    lda    #$4C                  ; 2
    sta    ram_C9                ; 3
    lda    #$0F                  ; 2
    sta    ram_CF                ; 3
    lda    #$02                  ; 2
    sta    ram_81                ; 3
    sta    ram_9F                ; 3
    jsr    LD878                 ; 6
    jmp    LD80D                 ; 3

LDDDB:
    lda    ram_9E                ; 3
    sec                          ; 2
    sbc    ram_A7                ; 3
    sbc    ram_A8                ; 3
    sbc    ram_A9                ; 3
    sbc    ram_AA                ; 3
    sbc    ram_9F                ; 3
    sbc    ram_AB                ; 3
    sbc    ram_AD                ; 3
    sbc    ram_AE                ; 3
    clc                          ; 2
    adc    ram_A5                ; 3
    adc    ram_A6                ; 3
    adc    ram_AC                ; 3
    sta    ram_9E                ; 3
    rts                          ; 6

    .byte $00 ; |        | $DDF8
    .byte $00 ; |        | $DDF9
    .byte $00 ; |        | $DDFA
    .byte $00 ; |        | $DDFB
    .byte $00 ; |        | $DDFC
    .byte $00 ; |        | $DDFD
    .byte $00 ; |        | $DDFE
    .byte $00 ; |        | $DDFF

       ORG $0E00
      RORG $DE00

LDE00:
    .byte $FF ; |XXXXXXXX| $DE00
    .byte $FF ; |XXXXXXXX| $DE01
    .byte $FF ; |XXXXXXXX| $DE02
    .byte $FF ; |XXXXXXXX| $DE03
    .byte $FF ; |XXXXXXXX| $DE04
    .byte $FF ; |XXXXXXXX| $DE05
    .byte $FF ; |XXXXXXXX| $DE06
    .byte $F8 ; |XXXXX   | $DE07
    .byte $FF ; |XXXXXXXX| $DE08
    .byte $FF ; |XXXXXXXX| $DE09
    .byte $FF ; |XXXXXXXX| $DE0A
    .byte $FF ; |XXXXXXXX| $DE0B
    .byte $FF ; |XXXXXXXX| $DE0C
    .byte $4F ; | X  XXXX| $DE0D
    .byte $4F ; | X  XXXX| $DE0E
    .byte $4F ; | X  XXXX| $DE0F
    .byte $4F ; | X  XXXX| $DE10
    .byte $4F ; | X  XXXX| $DE11
    .byte $4F ; | X  XXXX| $DE12
    .byte $4F ; | X  XXXX| $DE13
    .byte $4F ; | X  XXXX| $DE14
    .byte $4F ; | X  XXXX| $DE15
    .byte $4F ; | X  XXXX| $DE16
    .byte $4F ; | X  XXXX| $DE17
    .byte $44 ; | X   X  | $DE18
    .byte $44 ; | X   X  | $DE19
    .byte $0F ; |    XXXX| $DE1A
    .byte $0F ; |    XXXX| $DE1B
    .byte $1C ; |   XXX  | $DE1C
    .byte $0F ; |    XXXX| $DE1D
    .byte $0F ; |    XXXX| $DE1E
    .byte $18 ; |   XX   | $DE1F
    .byte $0F ; |    XXXX| $DE20
    .byte $0F ; |    XXXX| $DE21
    .byte $0F ; |    XXXX| $DE22
    .byte $0F ; |    XXXX| $DE23
    .byte $0F ; |    XXXX| $DE24
    .byte $12 ; |   X  X | $DE25
    .byte $12 ; |   X  X | $DE26
    .byte $89 ; |X   X  X| $DE27
    .byte $89 ; |X   X  X| $DE28
    .byte $8C ; |X   XX  | $DE29
    .byte $89 ; |X   X  X| $DE2A
    .byte $89 ; |X   X  X| $DE2B
    .byte $86 ; |X    XX | $DE2C
    .byte $89 ; |X   X  X| $DE2D
    .byte $89 ; |X   X  X| $DE2E
    .byte $89 ; |X   X  X| $DE2F
    .byte $89 ; |X   X  X| $DE30
    .byte $89 ; |X   X  X| $DE31
    .byte $86 ; |X    XX | $DE32
    .byte $86 ; |X    XX | $DE33
LDE34:
    .byte $FF ; |XXXXXXXX| $DE34
    .byte $FD ; |XXXXXX X| $DE35
    .byte $FF ; |XXXXXXXX| $DE36
    .byte $FF ; |XXXXXXXX| $DE37
    .byte $FD ; |XXXXXX X| $DE38
    .byte $FF ; |XXXXXXXX| $DE39
    .byte $FF ; |XXXXXXXX| $DE3A
    .byte $FF ; |XXXXXXXX| $DE3B
    .byte $FD ; |XXXXXX X| $DE3C
    .byte $01 ; |       X| $DE3D
    .byte $FD ; |XXXXXX X| $DE3E
    .byte $04 ; |     X  | $DE3F
    .byte $FD ; |XXXXXX X| $DE40
    .byte $FF ; |XXXXXXXX| $DE41
    .byte $FD ; |XXXXXX X| $DE42
    .byte $01 ; |       X| $DE43
    .byte $FF ; |XXXXXXXX| $DE44
    .byte $0B ; |    X XX| $DE45
    .byte $0A ; |    X X | $DE46
    .byte $FF ; |XXXXXXXX| $DE47
    .byte $FF ; |XXXXXXXX| $DE48
    .byte $FF ; |XXXXXXXX| $DE49
    .byte $04 ; |     X  | $DE4A
    .byte $FF ; |XXXXXXXX| $DE4B
    .byte $FD ; |XXXXXX X| $DE4C
    .byte $FF ; |XXXXXXXX| $DE4D
    .byte $FD ; |XXXXXX X| $DE4E
    .byte $FF ; |XXXXXXXX| $DE4F
    .byte $FF ; |XXXXXXXX| $DE50
    .byte $FF ; |XXXXXXXX| $DE51
    .byte $FF ; |XXXXXXXX| $DE52
    .byte $FF ; |XXXXXXXX| $DE53
    .byte $FE ; |XXXXXXX | $DE54
    .byte $FD ; |XXXXXX X| $DE55
    .byte $FD ; |XXXXXX X| $DE56
    .byte $FF ; |XXXXXXXX| $DE57
    .byte $FF ; |XXXXXXXX| $DE58
    .byte $FF ; |XXXXXXXX| $DE59
    .byte $FF ; |XXXXXXXX| $DE5A
    .byte $FF ; |XXXXXXXX| $DE5B
    .byte $FD ; |XXXXXX X| $DE5C
    .byte $FD ; |XXXXXX X| $DE5D
    .byte $FE ; |XXXXXXX | $DE5E
    .byte $FF ; |XXXXXXXX| $DE5F
    .byte $FF ; |XXXXXXXX| $DE60
    .byte $FE ; |XXXXXXX | $DE61
    .byte $FD ; |XXXXXX X| $DE62
    .byte $FD ; |XXXXXX X| $DE63
    .byte $FF ; |XXXXXXXX| $DE64
    .byte $FF ; |XXXXXXXX| $DE65
    .byte $FF ; |XXXXXXXX| $DE66
    .byte $FF ; |XXXXXXXX| $DE67
LDE68:
    .byte $00 ; |        | $DE68
    .byte $1E ; |   XXXX | $DE69
    .byte $00 ; |        | $DE6A
    .byte $00 ; |        | $DE6B
    .byte $11 ; |   X   X| $DE6C
    .byte $00 ; |        | $DE6D
    .byte $00 ; |        | $DE6E
    .byte $00 ; |        | $DE6F
    .byte $11 ; |   X   X| $DE70
    .byte $00 ; |        | $DE71
    .byte $10 ; |   X    | $DE72
    .byte $00 ; |        | $DE73
    .byte $60 ; | XX     | $DE74
    .byte $00 ; |        | $DE75
    .byte $11 ; |   X   X| $DE76
    .byte $00 ; |        | $DE77
    .byte $00 ; |        | $DE78
    .byte $00 ; |        | $DE79
    .byte $00 ; |        | $DE7A
    .byte $00 ; |        | $DE7B
    .byte $00 ; |        | $DE7C
    .byte $00 ; |        | $DE7D
    .byte $00 ; |        | $DE7E
    .byte $00 ; |        | $DE7F
    .byte $70 ; | XXX    | $DE80
    .byte $00 ; |        | $DE81
    .byte $12 ; |   X  X | $DE82
    .byte $00 ; |        | $DE83
    .byte $00 ; |        | $DE84
    .byte $00 ; |        | $DE85
    .byte $00 ; |        | $DE86
    .byte $00 ; |        | $DE87
    .byte $30 ; |  XX    | $DE88
    .byte $15 ; |   X X X| $DE89
    .byte $24 ; |  X  X  | $DE8A
    .byte $00 ; |        | $DE8B
    .byte $00 ; |        | $DE8C
    .byte $00 ; |        | $DE8D
    .byte $00 ; |        | $DE8E
    .byte $00 ; |        | $DE8F
    .byte $18 ; |   XX   | $DE90
    .byte $03 ; |      XX| $DE91
    .byte $27 ; |  X  XXX| $DE92
    .byte $00 ; |        | $DE93
    .byte $00 ; |        | $DE94
    .byte $30 ; |  XX    | $DE95
    .byte $20 ; |  X     | $DE96
    .byte $12 ; |   X  X | $DE97
    .byte $00 ; |        | $DE98
    .byte $00 ; |        | $DE99
    .byte $00 ; |        | $DE9A
    .byte $00 ; |        | $DE9B
LDE9C:
    .byte $00 ; |        | $DE9C
    .byte $7A ; | XXXX X | $DE9D
    .byte $00 ; |        | $DE9E
    .byte $00 ; |        | $DE9F
    .byte $88 ; |X   X   | $DEA0
    .byte $00 ; |        | $DEA1
    .byte $00 ; |        | $DEA2
    .byte $00 ; |        | $DEA3
    .byte $88 ; |X   X   | $DEA4
    .byte $00 ; |        | $DEA5
    .byte $80 ; |X       | $DEA6
    .byte $00 ; |        | $DEA7
    .byte $65 ; | XX  X X| $DEA8
    .byte $00 ; |        | $DEA9
    .byte $88 ; |X   X   | $DEAA
    .byte $00 ; |        | $DEAB
    .byte $00 ; |        | $DEAC
    .byte $00 ; |        | $DEAD
    .byte $00 ; |        | $DEAE
    .byte $00 ; |        | $DEAF
    .byte $00 ; |        | $DEB0
    .byte $00 ; |        | $DEB1
    .byte $00 ; |        | $DEB2
    .byte $00 ; |        | $DEB3
    .byte $72 ; | XXX  X | $DEB4
    .byte $00 ; |        | $DEB5
    .byte $16 ; |   X XX | $DEB6
    .byte $00 ; |        | $DEB7
    .byte $00 ; |        | $DEB8
    .byte $00 ; |        | $DEB9
    .byte $00 ; |        | $DEBA
    .byte $00 ; |        | $DEBB
    .byte $02 ; |      X | $DEBC
    .byte $1F ; |   XXXXX| $DEBD
    .byte $2F ; |  X XXXX| $DEBE
    .byte $00 ; |        | $DEBF
    .byte $00 ; |        | $DEC0
    .byte $00 ; |        | $DEC1
    .byte $00 ; |        | $DEC2
    .byte $00 ; |        | $DEC3
    .byte $1C ; |   XXX  | $DEC4
    .byte $40 ; | X      | $DEC5
    .byte $01 ; |       X| $DEC6
    .byte $00 ; |        | $DEC7
    .byte $00 ; |        | $DEC8
    .byte $07 ; |     XXX| $DEC9
    .byte $27 ; |  X  XXX| $DECA
    .byte $16 ; |   X XX | $DECB
    .byte $00 ; |        | $DECC
    .byte $00 ; |        | $DECD
    .byte $00 ; |        | $DECE
    .byte $00 ; |        | $DECF
LDED0:
    .byte $00 ; |        | $DED0
    .byte $02 ; |      X | $DED1
    .byte $00 ; |        | $DED2
    .byte $00 ; |        | $DED3
    .byte $09 ; |    X  X| $DED4
    .byte $00 ; |        | $DED5
    .byte $00 ; |        | $DED6
    .byte $00 ; |        | $DED7
    .byte $07 ; |     XXX| $DED8
    .byte $00 ; |        | $DED9
    .byte $FC ; |XXXXXX  | $DEDA
    .byte $00 ; |        | $DEDB
    .byte $05 ; |     X X| $DEDC
    .byte $00 ; |        | $DEDD
    .byte $09 ; |    X  X| $DEDE
    .byte $00 ; |        | $DEDF
    .byte $00 ; |        | $DEE0
    .byte $00 ; |        | $DEE1
    .byte $00 ; |        | $DEE2
    .byte $00 ; |        | $DEE3
    .byte $00 ; |        | $DEE4
    .byte $00 ; |        | $DEE5
    .byte $00 ; |        | $DEE6
    .byte $00 ; |        | $DEE7
    .byte $03 ; |      XX| $DEE8
    .byte $00 ; |        | $DEE9
    .byte $FF ; |XXXXXXXX| $DEEA
    .byte $00 ; |        | $DEEB
    .byte $00 ; |        | $DEEC
    .byte $00 ; |        | $DEED
    .byte $00 ; |        | $DEEE
    .byte $00 ; |        | $DEEF
    .byte $01 ; |       X| $DEF0
    .byte $06 ; |     XX | $DEF1
    .byte $FE ; |XXXXXXX | $DEF2
    .byte $00 ; |        | $DEF3
    .byte $00 ; |        | $DEF4
    .byte $00 ; |        | $DEF5
    .byte $00 ; |        | $DEF6
    .byte $00 ; |        | $DEF7
    .byte $FB ; |XXXXX XX| $DEF8
    .byte $FD ; |XXXXXX X| $DEF9
    .byte $0B ; |    X XX| $DEFA
    .byte $00 ; |        | $DEFB
    .byte $00 ; |        | $DEFC
    .byte $08 ; |    X   | $DEFD
    .byte $08 ; |    X   | $DEFE
    .byte $00 ; |        | $DEFF
    .byte $00 ; |        | $DF00
    .byte $00 ; |        | $DF01
    .byte $00 ; |        | $DF02
    .byte $00 ; |        | $DF03
LDF04:
    .byte $00 ; |        | $DF04
    .byte $4E ; | X  XXX | $DF05
    .byte $00 ; |        | $DF06
    .byte $00 ; |        | $DF07
    .byte $4E ; | X  XXX | $DF08
    .byte $00 ; |        | $DF09
    .byte $00 ; |        | $DF0A
    .byte $00 ; |        | $DF0B
    .byte $4D ; | X  XX X| $DF0C
    .byte $4E ; | X  XXX | $DF0D
    .byte $4E ; | X  XXX | $DF0E
    .byte $4E ; | X  XXX | $DF0F
    .byte $04 ; |     X  | $DF10
    .byte $01 ; |       X| $DF11
    .byte $03 ; |      XX| $DF12
    .byte $01 ; |       X| $DF13
    .byte $01 ; |       X| $DF14
    .byte $01 ; |       X| $DF15
    .byte $01 ; |       X| $DF16
    .byte $01 ; |       X| $DF17
    .byte $01 ; |       X| $DF18
    .byte $01 ; |       X| $DF19
    .byte $01 ; |       X| $DF1A
    .byte $01 ; |       X| $DF1B
    .byte $40 ; | X      | $DF1C
    .byte $00 ; |        | $DF1D
    .byte $23 ; |  X   XX| $DF1E
    .byte $00 ; |        | $DF1F
    .byte $00 ; |        | $DF20
    .byte $00 ; |        | $DF21
    .byte $00 ; |        | $DF22
    .byte $00 ; |        | $DF23
    .byte $00 ; |        | $DF24
    .byte $00 ; |        | $DF25
    .byte $41 ; | X     X| $DF26
    .byte $00 ; |        | $DF27
    .byte $00 ; |        | $DF28
    .byte $00 ; |        | $DF29
    .byte $00 ; |        | $DF2A
    .byte $00 ; |        | $DF2B
    .byte $45 ; | X   X X| $DF2C
    .byte $00 ; |        | $DF2D
    .byte $42 ; | X    X | $DF2E
    .byte $00 ; |        | $DF2F
    .byte $00 ; |        | $DF30
    .byte $00 ; |        | $DF31
    .byte $42 ; | X    X | $DF32
    .byte $23 ; |  X   XX| $DF33
    .byte $28 ; |  X X   | $DF34
    .byte $00 ; |        | $DF35
    .byte $00 ; |        | $DF36
    .byte $00 ; |        | $DF37
LDF38:
    .byte $00 ; |        | $DF38
    .byte $00 ; |        | $DF39
    .byte $00 ; |        | $DF3A
    .byte $00 ; |        | $DF3B
    .byte $00 ; |        | $DF3C
    .byte $00 ; |        | $DF3D
    .byte $00 ; |        | $DF3E
    .byte $00 ; |        | $DF3F
    .byte $00 ; |        | $DF40
    .byte $00 ; |        | $DF41
    .byte $00 ; |        | $DF42
    .byte $00 ; |        | $DF43
    .byte $4C ; | X  XX  | $DF44
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
    .byte $80 ; |X       | $DF50
    .byte $00 ; |        | $DF51
    .byte $86 ; |X    XX | $DF52
    .byte $00 ; |        | $DF53
    .byte $00 ; |        | $DF54
    .byte $00 ; |        | $DF55
    .byte $00 ; |        | $DF56
    .byte $00 ; |        | $DF57
    .byte $80 ; |X       | $DF58
    .byte $86 ; |X    XX | $DF59
    .byte $80 ; |X       | $DF5A
    .byte $00 ; |        | $DF5B
    .byte $00 ; |        | $DF5C
    .byte $00 ; |        | $DF5D
    .byte $00 ; |        | $DF5E
    .byte $00 ; |        | $DF5F
    .byte $12 ; |   X  X | $DF60
    .byte $12 ; |   X  X | $DF61
    .byte $4C ; | X  XX  | $DF62
    .byte $00 ; |        | $DF63
    .byte $00 ; |        | $DF64
    .byte $16 ; |   X XX | $DF65
    .byte $80 ; |X       | $DF66
    .byte $12 ; |   X  X | $DF67
    .byte $50 ; | X X    | $DF68
    .byte $00 ; |        | $DF69
    .byte $00 ; |        | $DF6A
    .byte $00 ; |        | $DF6B
LDF6C:
    .byte $01 ; |       X| $DF6C
    .byte $FF ; |XXXXXXXX| $DF6D
    .byte $01 ; |       X| $DF6E
    .byte $FF ; |XXXXXXXX| $DF6F
LDF70:
    .byte $35 ; |  XX X X| $DF70
    .byte $09 ; |    X  X| $DF71
LDF72:
    .byte $00 ; |        | $DF72
    .byte $00 ; |        | $DF73
    .byte $42 ; | X    X | $DF74
    .byte $45 ; | X   X X| $DF75
    .byte $0C ; |    XX  | $DF76
    .byte $20 ; |  X     | $DF77
LDF78:
    .byte $04 ; |     X  | $DF78
    .byte $11 ; |   X   X| $DF79
    .byte $10 ; |   X    | $DF7A
    .byte $12 ; |   X  X | $DF7B
LDF7C:
    .byte $07 ; |     XXX| $DF7C
    .byte $03 ; |      XX| $DF7D
    .byte $05 ; |     X X| $DF7E
    .byte $06 ; |     XX | $DF7F
    .byte $09 ; |    X  X| $DF80
    .byte $0B ; |    X XX| $DF81
    .byte $0E ; |    XXX | $DF82
    .byte $00 ; |        | $DF83
    .byte $01 ; |       X| $DF84
    .byte $03 ; |      XX| $DF85
    .byte $05 ; |     X X| $DF86
    .byte $00 ; |        | $DF87
    .byte $09 ; |    X  X| $DF88
    .byte $0C ; |    XX  | $DF89
    .byte $0E ; |    XXX | $DF8A
    .byte $00 ; |        | $DF8B
    .byte $01 ; |       X| $DF8C
    .byte $04 ; |     X  | $DF8D
    .byte $05 ; |     X X| $DF8E
    .byte $00 ; |        | $DF8F
    .byte $0A ; |    X X | $DF90
    .byte $0C ; |    XX  | $DF91
    .byte $0F ; |    XXXX| $DF92
    .byte $00 ; |        | $DF93
    .byte $02 ; |      X | $DF94
    .byte $04 ; |     X  | $DF95
    .byte $05 ; |     X X| $DF96
    .byte $08 ; |    X   | $DF97
    .byte $0A ; |    X X | $DF98
    .byte $0D ; |    XX X| $DF99
    .byte $0F ; |    XXXX| $DF9A
    .byte $00 ; |        | $DF9B

LDF9C:
    lda    INTIM                 ; 4
    bne    LDF9C                 ; 2³
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #<LF844               ; 2
    sta    ram_88                ; 3
    lda    #>LF844               ; 2
    sta    ram_89                ; 3
LDFAD:
    lda    #$AD                  ; 2
    sta    ram_84                ; 3
    lda    #$F9                  ; 2
    sta    ram_85                ; 3
    lda    #$FF                  ; 2
    sta    ram_86                ; 3
    lda    #$4C                  ; 2
    sta    ram_87                ; 3
    jmp.w  ram_84                ; 3

LDFC0:
    ror                          ; 2
    bcs    LDFC5                 ; 2³
    dec    ram_CE,X              ; 6
LDFC5:
    ror                          ; 2
    bcs    LDFCA                 ; 2³
    inc    ram_CE,X              ; 6
LDFCA:
    ror                          ; 2
    bcs    LDFCF                 ; 2³
    dec    ram_C8,X              ; 6
LDFCF:
    ror                          ; 2
    bcs    LDFD4                 ; 2³
    inc    ram_C8,X              ; 6
LDFD4:
    rts                          ; 6

LDFD5:
    .byte $00 ; |        | $DFD5
    .byte $00 ; |        | $DFD6
    .byte $00 ; |        | $DFD7
    .byte $00 ; |        | $DFD8
    .byte $00 ; |        | $DFD9
    .byte $0A ; |    X X | $DFDA
    .byte $09 ; |    X  X| $DFDB
    .byte $0B ; |    X XX| $DFDC
    .byte $00 ; |        | $DFDD
    .byte $06 ; |     XX | $DFDE
    .byte $05 ; |     X X| $DFDF
    .byte $07 ; |     XXX| $DFE0
    .byte $00 ; |        | $DFE1
    .byte $0E ; |    XXX | $DFE2
    .byte $0D ; |    XX X| $DFE3
    .byte $0F ; |    XXXX| $DFE4
LDFE5:
    .byte $00 ; |        | $DFE5
    .byte $06 ; |     XX | $DFE6
    .byte $03 ; |      XX| $DFE7
    .byte $03 ; |      XX| $DFE8
    .byte $03 ; |      XX| $DFE9
    .byte $00 ; |        | $DFEA
    .byte $00 ; |        | $DFEB
    .byte $06 ; |     XX | $DFEC
    .byte $00 ; |        | $DFED
    .byte $00 ; |        | $DFEE
    .byte $00 ; |        | $DFEF
    .byte $06 ; |     XX | $DFF0
    .byte $00 ; |        | $DFF1
    .byte $00 ; |        | $DFF2
    .byte $00 ; |        | $DFF3
    .byte $00 ; |        | $DFF4
    .byte $00 ; |        | $DFF5
    .byte $00 ; |        | $DFF6
    .byte $00 ; |        | $DFF7

       ORG $0FF8
      RORG $DFF8

    .byte $00 ; |        | $DFF8
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
    lda    BANK_0                ; 4

LF003:  ; indirect jump also
    cmp    ram_E0                ; 3
    bcs    LF01A                 ; 2³
    lsr                          ; 2
    clc                          ; 2
    adc    ram_DF                ; 3
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (ram_E1),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_E3),Y            ; 5
    sta    PF2                   ; 3
    bcc    LF033                 ; 3   always branch?

LF01A:
    sbc    ram_D4                ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    tax                          ; 2
    cpx    ram_D5                ; 3
    bcc    LF02D                 ; 2³
    ldx    ram_D8                ; 3
    lda    #$00                  ; 2
    beq    LF031                 ; 3   always branch

LF02D:
    lda    ram_E5,X              ; 4
    ldx    ram_D8                ; 3
LF031:
    sta    PF1,X                 ; 4
LF033:
    ldx    #$1E                  ; 2
    txs                          ; 2
    lda    ram_80                ; 3
    sec                          ; 2
    sbc    ram_CF                ; 3
    cmp    ram_DB                ; 3
    bcs    LF079                 ; 2³
    tay                          ; 2
    lda    (ram_D9),Y            ; 5
    tax                          ; 2
LF043:
    lda    ram_80                ; 3
    sec                          ; 2
    sbc    ram_CE                ; 3
    cmp    ram_DC                ; 3
    bcs    LF07D                 ; 2³
    tay                          ; 2
    lda    (ram_DD),Y            ; 5
    tay                          ; 2
LF050:
    lda    ram_80                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    cmp    ram_D1                ; 3
    php                          ; 3
    cmp    ram_D0                ; 3
    php                          ; 3
    stx    GRP1                  ; 3
    sty    GRP0                  ; 3
    sec                          ; 2
    sbc    ram_D2                ; 3
    cmp    #$08                  ; 2
    bcs    LF06E                 ; 2³
    tay                          ; 2
    lda    (ram_D6),Y            ; 5
    sta    ENABL                 ; 3
    sta    HMBL                  ; 3
LF06E:
    inc    ram_80                ; 5
    lda    ram_80                ; 3
    cmp    #$50                  ; 2
    bcc    LF003                 ; 2³
    jmp    LF1EA                 ; 3

LF079:
    ldx    #$00                  ; 2
    beq    LF043                 ; 3   always branch

LF07D:
    ldy    #$00                  ; 2
    beq    LF050                 ; 3   always branch

LF081:
    cpx    #$4F                  ; 2
    bcc    LF088                 ; 2³
    jmp    LF1EA                 ; 3

LF088:
    lda    #$00                  ; 2
    beq    LF0A4                 ; 3   always branch

LF08C:
    lda    (ram_DD),Y            ; 5
    bmi    LF09C                 ; 2³
    cpy    ram_DF                ; 3
    bcs    LF081                 ; 2³
    cpy    ram_CE                ; 3
    bcc    LF088                 ; 2³
    sta    GRP0                  ; 3
    bcs    LF0A4                 ; 3   always branch

LF09C:
    asl                          ; 2
    tay                          ; 2
    and    #$02                  ; 2
    tax                          ; 2
    tya                          ; 2
    sta    (ram_E1,X)            ; 6
LF0A4:
    inc    ram_80                ; 5
    ldx    ram_80                ; 3
    lda    #$02                  ; 2
    cpx    ram_D0                ; 3
    bcc    LF0B2                 ; 2³
    cpx    ram_E0                ; 3
    bcc    LF0B3                 ; 2³
LF0B2:
    ror                          ; 2
LF0B3:
    sta    ENAM0                 ; 3
LF0B5:  ; indirect jump
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    ram_D5                ; 3
    cmp    #$10                  ; 2
    bcs    LF0FF                 ; 2³
    tay                          ; 2
    cmp    #$08                  ; 2
    bcc    LF0FB                 ; 2³
    lda    ram_D8                ; 3
    sta    ram_D6                ; 3
LF0CA:
    lda    (ram_D6),Y            ; 5
    sta    HMBL                  ; 3
LF0CE:
    ldy    #$00                  ; 2
    txa                          ; 2
    cmp    ram_D1                ; 3
    bne    LF0D6                 ; 2³
    dey                          ; 2
LF0D6:
    sty    ENAM1                 ; 3
    sec                          ; 2
    sbc    ram_CF                ; 3
    cmp    ram_DB                ; 3
    bcs    LF107                 ; 2³+1
    tay                          ; 2
    lda    (ram_D9),Y            ; 5
LF0E2:
    ldy    ram_80                ; 3
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$02                  ; 2
    cpx    ram_D2                ; 3
    bcc    LF0F9                 ; 2³
    cpx    ram_DC                ; 3
    bcc    LF0F5                 ; 2³
LF0F4:
    ror                          ; 2
LF0F5:
    sta    ENABL                 ; 3
    bcc    LF08C                 ; 2³
LF0F9:
    bcc    LF0F4                 ; 2³
LF0FB:
    nop                          ; 2
    jmp    LF0CA                 ; 3

LF0FF:
    pha                          ; 3
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    nop                          ; 2
    jmp    LF0CE                 ; 3

LF107:
    lda    #$00                  ; 2
    beq    LF0E2                 ; 3+1   always branch

LF10B:
    inx                          ; 2
    sta    HMCLR                 ; 3
    cpx    #$A0                  ; 2
    bcc    LF140                 ; 2³
    jmp    LF1EA                 ; 3

LF115:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    inx                          ; 2
    lda    ram_84                ; 3
    sta    GRP0                  ; 3
    lda    ram_85                ; 3
    sta    COLUP0                ; 3
    txa                          ; 2
    ldx    #$1F                  ; 2
    txs                          ; 2
    tax                          ; 2
    lsr                          ; 2
    cmp    ram_D2                ; 3
    php                          ; 3
    cmp    ram_D1                ; 3
    php                          ; 3
    cmp    ram_D0                ; 3
    php                          ; 3
    sec                          ; 2
    sbc    ram_CF                ; 3
    cmp    ram_DB                ; 3
    bcs    LF10B                 ; 2³
    tay                          ; 2
    lda    (ram_D9),Y            ; 5
    sta    HMCLR                 ; 3
    inx                          ; 2
    sta    GRP1                  ; 3
LF140:  ; indirect jump also
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    bit    ram_D4                ; 3
    bpl    LF157                 ; 2³
    ldy    ram_89                ; 3
    lda    ram_88                ; 3
    lsr    ram_D4                ; 5
LF14E:
    dey                          ; 2
    bpl    LF14E                 ; 2³
    sta    RESP0                 ; 3
    sta    HMP0                  ; 3
    bmi    LF115                 ; 3   always branch

LF157:
    bvc    LF177                 ; 2³
    txa                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    lda    (ram_DD),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D6),Y            ; 5
    sta    COLUP0                ; 3
    iny                          ; 2
    lda    (ram_DD),Y            ; 5
    sta    ram_84                ; 3
    lda    (ram_D6),Y            ; 5
    sta    ram_85                ; 3
    cpy    ram_DC                ; 3
    bcc    LF174                 ; 2³
    lsr    ram_D4                ; 5
LF174:
    jmp    LF115                 ; 3

LF177:
    lda    #$20                  ; 2
    bit    ram_D4                ; 3
    beq    LF1A7                 ; 2³
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bcs    LF115                 ; 2³
    tay                          ; 2
    sty    ram_87                ; 3
    lda.wy ram_DF,Y              ; 4
    sta    REFP0                 ; 3
    sta    NUSIZ0                ; 3
    sta    ram_86                ; 3
    bpl    LF1A2                 ; 2³
    lda    ram_96                ; 3
    sta    ram_DD                ; 3
    lda    #$65                  ; 2
    sta    ram_D6                ; 3
    lda    #$00                  ; 2
    sta    ram_D4                ; 3
    jmp    LF115                 ; 3

LF1A2:
    lsr    ram_D4                ; 5
    jmp    LF115                 ; 3

LF1A7:
    lsr                          ; 2
    bit    ram_D4                ; 3
    beq    LF1CE                 ; 2³
    ldy    ram_87                ; 3
    lda    #$08                  ; 2
    and    ram_86                ; 3
    beq    LF1B6                 ; 2³
    lda    #$03                  ; 2
LF1B6:
    eor.wy ram_E5,Y              ; 4
    and    #$03                  ; 2
    tay                          ; 2
    lda    LFC40,Y               ; 4
    sta    ram_DD                ; 3
    lda    #$44                  ; 2
    sta    ram_D6                ; 3
    lda    #$0F                  ; 2
    sta    ram_DC                ; 3
    lsr    ram_D4                ; 5
    jmp    LF115                 ; 3

LF1CE:
    txa                          ; 2
    and    #$1F                  ; 2
    cmp    #$0C                  ; 2
    beq    LF1D8                 ; 2³
    jmp    LF115                 ; 3

LF1D8:
    ldy    ram_87                ; 3
    lda.wy ram_EE,Y              ; 4
    sta    ram_88                ; 3
    and    #$0F                  ; 2
    sta    ram_89                ; 3
    lda    #$80                  ; 2
    sta    ram_D4                ; 3
    jmp    LF115                 ; 3

LF1EA:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    #$FF                  ; 2
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    inx                          ; 2
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    ENAM0                 ; 3
    stx    ENAM1                 ; 3
    stx    ENABL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$03                  ; 2
    ldy    #$00                  ; 2
    sty    REFP1                 ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sty    HMP1                  ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    sty    REFP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$1A                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    ram_C3                ; 3
    lsr                          ; 2
    tay                          ; 2
    lda    LFFF2,Y               ; 4
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    ldx    #$00                  ; 2
    stx    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    PF0                   ; 3
    stx    COLUBK                ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
LF24A:
    dey                          ; 2
    bpl    LF24A                 ; 2³
    sta    RESBL                 ; 3
    stx    CTRLPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$3F                  ; 2
    and    ram_82                ; 3
    bne    LF26D                 ; 2³
    lda    #$3F                  ; 2
    and    ram_83                ; 3
    bne    LF26D                 ; 2³
    lda    ram_B5                ; 3
    and    #$0F                  ; 2
    beq    LF26D                 ; 2³
    cmp    #$0F                  ; 2
    beq    LF26D                 ; 2³
    inc    ram_B5                ; 5
LF26D:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$42                  ; 2
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$07                  ; 2
    sta    ram_84                ; 3
LF27F:
    ldy    ram_84                ; 3
    lda    (ram_B7),Y            ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_B9),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_BB),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_BD),Y            ; 5
    sta    ram_85                ; 3
    lda    (ram_BF),Y            ; 5
    tax                          ; 2
    lda    (ram_C1),Y            ; 5
    tay                          ; 2
    lda    ram_85                ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    dec    ram_84                ; 5
    bpl    LF27F                 ; 2³
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    ldy    #$02                  ; 2
    lda    ram_C4                ; 3
    bne    LF2C6                 ; 2³
    dey                          ; 2
LF2C6:
    sty    ENABL                 ; 3
    ldy    #$08                  ; 2
    sty    COLUPF                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$00                  ; 2
    sty    ENABL                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$0F                  ; 2
    stx    VBLANK                ; 3
    ldx    #$24                  ; 2
    stx    TIM64T                ; 4
    ldx    #$FF                  ; 2
    txs                          ; 2
    ldx    #$01                  ; 2
LF2E8:
    lda    ram_A2,X              ; 4
    sta    AUDC0,X               ; 4
    sta    AUDV0,X               ; 4
    bmi    LF2FB                 ; 2³
    ldy    #$00                  ; 2
    sty    ram_A2,X              ; 4
LF2F4:
    sta    AUDF0,X               ; 4
    dex                          ; 2
    bpl    LF2E8                 ; 2³
    bmi    LF320                 ; 3+1   always branch

LF2FB:
    cmp    #$9C                  ; 2
    bne    LF314                 ; 2³+1
    lda    #$0F                  ; 2
    and    ram_82                ; 3
    bne    LF30D                 ; 2³
    dec    ram_A4                ; 5
    bpl    LF30D                 ; 2³
    lda    #$17                  ; 2
    sta    ram_A4                ; 3
LF30D:
    ldy    ram_A4                ; 3
    lda    LFBE8,Y               ; 4
    bne    LF2F4                 ; 3+1   always branch

LF314:
    lda    ram_82                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LFAEE,Y               ; 4
    bne    LF2F4                 ; 3+1   always branch

LF320:
    lda    ram_C5                ; 3
    cmp    #$0F                  ; 2
    beq    LF330                 ; 2³
    cmp    #$02                  ; 2
    bne    LF344                 ; 2³
    lda    #$84                  ; 2
    sta    ram_A3                ; 3
    bne    LF348                 ; 3   always branch

LF330:
    bit    INPT5                 ; 3
    bpl    LF338                 ; 2³
    lda    #<LFB78               ; 2
    bne    LF340                 ; 3   always branch

LF338:
    lda    ram_83                ; 3
    and    #$E0                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    adc    #<LFB98               ; 2
LF340:
    ldx    ram_C3                ; 3
    sta    ram_B7,X              ; 4
LF344:
    lda    #$00                  ; 2
    sta    ram_A3                ; 3
LF348:
    bit    ram_93                ; 3
    bpl    LF371                 ; 2³
    lda    ram_82                ; 3
    and    #$07                  ; 2
    cmp    #$05                  ; 2
    bcc    LF365                 ; 2³
    ldx    #$04                  ; 2
    ldy    #$01                  ; 2
    bit    ram_9D                ; 3
    bmi    LF360                 ; 2³
    bit    ram_A1                ; 3
    bpl    LF362                 ; 2³
LF360:
    ldy    #$03                  ; 2
LF362:
    jsr    LF8B3                 ; 6
LF365:
    lda    ram_82                ; 3
    and    #$06                  ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_D6                ; 3
    lda    #$FD                  ; 2
    sta    ram_D7                ; 3
LF371:
    ldx    #$02                  ; 2
LF373:
    jsr    LFEF4                 ; 6
    inx                          ; 2
    cpx    #$05                  ; 2
    bcc    LF373                 ; 2³
    bit    ram_9D                ; 3
    bpl    LF3BF                 ; 2³
    lda    ram_82                ; 3
    bvs    LF39D                 ; 2³
    and    #$0F                  ; 2
    bne    LF3C5                 ; 2³
    ldx    ram_DB                ; 3
    dex                          ; 2
    stx    ram_A3                ; 3
    cpx    #$03                  ; 2
    bcc    LF398                 ; 2³
    lda    #$8F                  ; 2
    sta    ram_D1                ; 3
    stx    ram_DB                ; 3
    bcs    LF3C5                 ; 3   always branch

LF398:
    sta    ram_82                ; 3
    sec                          ; 2
    ror    ram_9D                ; 5
LF39D:
    cmp    #$3C                  ; 2
    bcc    LF3A9                 ; 2³
    bne    LF3A5                 ; 2³
    sta    ram_A3                ; 3
LF3A5:
    ldy    #$00                  ; 2
    sty    ram_DB                ; 3
LF3A9:
    cmp    #$78                  ; 2
    bcc    LF3C5                 ; 2³
    lda    #$0B                  ; 2
    sta    ram_DB                ; 3
    sta    ram_A3                ; 3
    sta    ram_9D                ; 3
    dec    ram_9F                ; 5
    bpl    LF3C5                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_9D                ; 3
    bne    LF3C5                 ; 3   always branch

LF3BF:
    lda    ram_81                ; 3
    cmp    #$0D                  ; 2
    bne    LF3D0                 ; 2³
LF3C5:
    lda    #<LD3D8               ; 2
    sta    ram_88                ; 3
    lda    #>LD3D8               ; 2
    sta    ram_89                ; 3
    jmp    LF493                 ; 3

LF3D0:
    bit    ram_8D                ; 3
    bvs    LF437                 ; 2³+1
    bit    ram_B4                ; 3
    bmi    LF437                 ; 2³+1
    bit    ram_9A                ; 3
    bmi    LF437                 ; 2³+1
    lda    #$07                  ; 2
    and    ram_82                ; 3
    bne    LF437                 ; 2³+1
    lda    ram_C4                ; 3
    and    #$06                  ; 2
    beq    LF437                 ; 2³+1
    ldx    ram_C3                ; 3
    lda    ram_B7,X              ; 4
    cmp    #<LFB98               ; 2
    bcc    LF3F2                 ; 2³
    lda    #<LFB78               ; 2
LF3F2:
    bit    SWCHA                 ; 4
    bmi    LF407                 ; 2³+1
    sta    ram_B7,X              ; 4
LF3F9:
    inx                          ; 2
    inx                          ; 2
    cpx    #$0B                  ; 2
    bcc    LF401                 ; 2³+1
    ldx    #$00                  ; 2
LF401:
    ldy    ram_B7,X              ; 4
    beq    LF3F9                 ; 2³+1
    bne    LF415                 ; 3   always branch

LF407:
    bvs    LF437                 ; 2³
    sta    ram_B7,X              ; 4
LF40B:
    dex                          ; 2
    dex                          ; 2
    bpl    LF411                 ; 2³
    ldx    #$0A                  ; 2
LF411:
    ldy    ram_B7,X              ; 4
    beq    LF40B                 ; 2³
LF415:
    stx    ram_C3                ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_C5                ; 3
    cpy    #<HourGlass           ; 2
    bne    LF437                 ; 2³
    ldy    #$09                  ; 2
    cpy    ram_81                ; 3
    bne    LF437                 ; 2³
    lda    #$49                  ; 2
    sta    ram_8D                ; 3
    lda    ram_CF                ; 3
    adc    #$09                  ; 2
    sta    ram_D1                ; 3
    lda    ram_C9                ; 3
    adc    #$09                  ; 2
    sta    ram_CB                ; 3
LF437:
    lda    ram_8D                ; 3
    bpl    LF454                 ; 2³
    cmp    #$BF                  ; 2
    bcs    LF44B                 ; 2³
    adc    #$10                  ; 2
    sta    ram_8D                ; 3
    ldx    #$03                  ; 2
    jsr    LFCEA                 ; 6
    jmp    LF48B                 ; 3

LF44B:
    lda    #$70                  ; 2
    sta    ram_D1                ; 3
    lsr                          ; 2
    sta    ram_8D                ; 3
    bne    LF48B                 ; 3   always branch

LF454:
    bit    ram_8D                ; 3
    bvc    LF48B                 ; 2³
    ldx    #$03                  ; 2
    jsr    LFCEA                 ; 6
    lda    ram_CB                ; 3
    sec                          ; 2
    sbc    #$04                  ; 2
    cmp    ram_C9                ; 3
    bne    LF46A                 ; 2³
    lda    #$03                  ; 2
    bne    LF481                 ; 3   always branch

LF46A:
    cmp    #$11                  ; 2
    beq    LF472                 ; 2³
    cmp    #$84                  ; 2
    bne    LF476                 ; 2³
LF472:
    lda    #$0F                  ; 2
    bne    LF481                 ; 3   always branch

LF476:
    lda    ram_D1                ; 3
    sec                          ; 2
    sbc    #$05                  ; 2
    cmp    ram_CF                ; 3
    bne    LF487                 ; 2³
    lda    #$0C                  ; 2
LF481:
    eor    ram_8D                ; 3
    sta    ram_8D                ; 3
    bne    LF48B                 ; 2³
LF487:
    cmp    #$4A                  ; 2
    bcs    LF472                 ; 2³
LF48B:
    lda    #<LD024               ; 2
    sta    ram_88                ; 3
    lda    #>LD024               ; 2
    sta    ram_89                ; 3
LF493:
    lda    #$AD                  ; 2
    sta    ram_84                ; 3
    lda    #$F8                  ; 2
    sta    ram_85                ; 3
    lda    #$FF                  ; 2
    sta    ram_86                ; 3
    lda    #$4C                  ; 2
    sta    ram_87                ; 3
    jmp.w  ram_84                ; 3

LF4A6:  ; indirect jump also
    sta    WSYNC                 ; 3
;---------------------------------------
    cpx    #$12                  ; 2
    bcc    LF4D0                 ; 2³
    txa                          ; 2
    sbc    ram_CF                ; 3
    bmi    LF4C9                 ; 2³
    cmp    #$14                  ; 2
    bcs    LF4BD                 ; 2³
    lsr                          ; 2
    tay                          ; 2
    lda    LFA58,Y               ; 4
    jmp    LF4C3                 ; 3

LF4BD:
    and    #$03                  ; 2
    tay                          ; 2
    lda    LF9FC,Y               ; 4
LF4C3:
    sta    GRP1                  ; 3
    lda    ram_CF                ; 3
    sta    COLUP1                ; 3
LF4C9:
    inx                          ; 2
    cpx    #$90                  ; 2
    bcs    LF4EA                 ; 2³
    bcc    LF4A6                 ; 3   always branch

LF4D0:
    bit    ram_9C                ; 3
    bmi    LF4E5                 ; 2³
    txa                          ; 2
    sbc    #$07                  ; 2
    bmi    LF4E5                 ; 2³
    tay                          ; 2
    lda    LFB40,Y               ; 4
    sta    GRP1                  ; 3
    txa                          ; 2
    adc    ram_82                ; 3
    asl                          ; 2
    sta    COLUP1                ; 3
LF4E5:
    inx                          ; 2
    cpx    #$0F                  ; 2
    bcc    LF4A6                 ; 2³
LF4EA:
    sta    WSYNC                 ; 3
;---------------------------------------
    cpx    #$20                  ; 2
    bcs    LF511                 ; 2³+1
    bit    ram_9C                ; 3
    bmi    LF504                 ; 2³+1
    txa                          ; 2
    ldy    #$7E                  ; 2
    and    #$0E                  ; 2
    bne    LF4FD                 ; 2³
    ldy    #$FF                  ; 2
LF4FD:
    sty    GRP0                  ; 3
    txa                          ; 2
    eor    #$FF                  ; 2
    sta    COLUP0                ; 3
LF504:
    inx                          ; 2
    cpx    #$1D                  ; 2
    bcc    LF4EA                 ; 2³+1
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    beq    LF4A6                 ; 3+1   always branch

LF511:
    txa                          ; 2
    sbc    #$90                  ; 2
    cmp    #$0F                  ; 2
    bcc    LF51B                 ; 2³
    jmp    LF1EA                 ; 3

LF51B:
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LFEF0,Y               ; 4
    sta    GRP0                  ; 3
    stx    COLUP0                ; 3
    inx                          ; 2
    bne    LF4EA                 ; 3+1   always branch

LF528:  ; indirect jump
    lda    ram_81                ; 3
    asl                          ; 2
    tax                          ; 2
    lda    LFC88+1,X             ; 4
    pha                          ; 3
    lda    LFC88,X               ; 4
    pha                          ; 3
    rts                          ; 6

LF535:  ; indirect jump
    lda    #$7F                  ; 2
    sta    ram_CE                ; 3
    sta    ram_D0                ; 3
    sta    ram_D2                ; 3
    bne    LF59A                 ; 3   always branch

LF53F:  ; indirect jump
    ldx    #$00                  ; 2
    ldy    #$01                  ; 2
    bit    CXP1FB                ; 3
    bmi    LF55B                 ; 2³
    bit    ram_B6                ; 3
    bmi    LF55B                 ; 2³
    lda    ram_82                ; 3
    and    #$07                  ; 2
    bne    LF55E                 ; 2³
    ldy    #$05                  ; 2
    lda    #$4C                  ; 2
    sta    ram_CD                ; 3
    lda    #$23                  ; 2
    sta    ram_D3                ; 3
LF55B:
    jsr    LF8B3                 ; 6
LF55E:
    lda    #$80                  ; 2
    sta    ram_93                ; 3
    lda    ram_CE                ; 3
    and    #$01                  ; 2
    ror    ram_C8                ; 5
    rol                          ; 2
    tay                          ; 2
    ror                          ; 2
    rol    ram_C8                ; 5
    lda    LFAEA,Y               ; 4
    sta    ram_DD                ; 3
    lda    #>LFCAE               ; 2
    sta    ram_DE                ; 3
    lda    ram_8E                ; 3
    bmi    LF59A                 ; 2³
    ldx    #$50                  ; 2
    stx    ram_CA                ; 3
    ldx    #$26                  ; 2
    stx    ram_D0                ; 3
    lda    ram_B6                ; 3
    bmi    LF59A                 ; 2³
    bit    ram_9D                ; 3
    bmi    LF59A                 ; 2³
    and    #$07                  ; 2
    bne    LF592                 ; 2³
    ldy    #$06                  ; 2
    sty    ram_B6                ; 3
LF592:
    tax                          ; 2
    lda    LFCD2,X               ; 4
    sta    ram_8E                ; 3
    dec    ram_B6                ; 5
LF59A:
    jmp    LF833                 ; 3

LF59D:  ; indirect jump
    lda    #$80                  ; 2
    sta    ram_93                ; 3
    ldx    #$00                  ; 2
    bit    ram_9D                ; 3
    bmi    LF5AB                 ; 2³
    bit    ram_95                ; 3
    bvc    LF5B7                 ; 2³
LF5AB:
    ldy    #$05                  ; 2
    lda    #$55                  ; 2
    sta    ram_CD                ; 3
    sta    ram_D3                ; 3
    lda    #$01                  ; 2
    bne    LF5BB                 ; 3   always branch

LF5B7:
    ldy    #$01                  ; 2
    lda    #$03                  ; 2
LF5BB:
    and    ram_82                ; 3
    bne    LF5CE                 ; 2³
    jsr    LF8B3                 ; 6
    lda    ram_CE                ; 3
    bpl    LF5CE                 ; 2³
    cmp    #$A0                  ; 2
    bcc    LF5CE                 ; 2³
    inc    ram_CE                ; 5
    inc    ram_CE                ; 5
LF5CE:
    bvc    LF5DE                 ; 2³
    lda    ram_CE                ; 3
    cmp    #$51                  ; 2
    bcc    LF5DE                 ; 2³
    lda    ram_95                ; 3
    sta    ram_99                ; 3
    lda    #$00                  ; 2
    sta    ram_95                ; 3
LF5DE:
    lda    ram_C8                ; 3
    cmp    ram_C9                ; 3
    bcs    LF5E7                 ; 2³
    dex                          ; 2
    eor    #$03                  ; 2
LF5E7:
    stx    REFP0                 ; 3
    and    #$03                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_DD                ; 3
    lda    ram_82                ; 3
    and    #$7F                  ; 2
    bne    LF617                 ; 2³+1
    lda    ram_CE                ; 3
    cmp    #$4A                  ; 2
    bcs    LF617                 ; 2³+1
    ldy    ram_98                ; 3
    beq    LF617                 ; 2³
    dey                          ; 2
    sty    ram_98                ; 3
    ldy    #$8E                  ; 2
    adc    #$03                  ; 2
    sta    ram_D0                ; 3
    cmp    ram_CF                ; 3
    bcs    LF60F                 ; 2³
    dey                          ; 2
LF60F:
    lda    ram_C8                ; 3
    adc    #$04                  ; 2
    sta    ram_CA                ; 3
    sty    ram_8E                ; 3
LF617:
    ldy    #$7F                  ; 2
    lda    ram_8E                ; 3
    bmi    LF61F                 ; 2³
    sty    ram_D0                ; 3
LF61F:
    lda    ram_D1                ; 3
    cmp    #$52                  ; 2
    bcc    LF627                 ; 2³
    sty    ram_D1                ; 3
LF627:
    jmp    LF833                 ; 3

LF62A:  ; indirect jump
    ldx    #$3A                  ; 2
    stx    ram_E9                ; 3
    ldx    #$85                  ; 2
    stx    ram_E3                ; 3
    ldx    #$03                  ; 2
    stx    ram_AD                ; 3
    bne    LF63A                 ; 3   always branch

LF638:  ; indirect jump
    ldx    #$04                  ; 2
LF63A:
    lda    LFCD8,X               ; 4
    and    ram_82                ; 3
    bne    LF656                 ; 2³
    ldy    ram_E5,X              ; 4
    lda    #$08                  ; 2
    and    ram_DF,X              ; 4
    bne    LF65C                 ; 2³
    dey                          ; 2
    cpy    #$14                  ; 2
    bcs    LF654                 ; 2³
LF64E:
    lda    #$08                  ; 2
    eor    ram_DF,X              ; 4
    sta    ram_DF,X              ; 4
LF654:
    sty    ram_E5,X              ; 4
LF656:
    dex                          ; 2
    bpl    LF63A                 ; 2³
    jmp    LF833                 ; 3

LF65C:
    iny                          ; 2
    cpy    #$85                  ; 2
    bcs    LF64E                 ; 2³
    bcc    LF654                 ; 3   always branch

LF663:  ; indirect jump
    bit    ram_B4                ; 3
    bpl    LF685                 ; 2³
    bvc    LF66D                 ; 2³
    dec    ram_C9                ; 5
    bne    LF685                 ; 2³
LF66D:
    lda    ram_82                ; 3
    ror                          ; 2
    bcc    LF685                 ; 2³
    lda    SWCHA                 ; 4
    sta    ram_92                ; 3
    ror                          ; 2
    ror                          ; 2
    ror                          ; 2
    bcs    LF680                 ; 2³
    dec    ram_C9                ; 5
    bne    LF685                 ; 2³
LF680:
    ror                          ; 2
    bcs    LF685                 ; 2³
    inc    ram_C9                ; 5
LF685:
    lda    #$02                  ; 2
    and    ram_B4                ; 3
    bne    LF691                 ; 2³
    sta    ram_8D                ; 3
    lda    #$0B                  ; 2
    sta    ram_CE                ; 3
LF691:
    ldx    ram_CF                ; 3
    lda    ram_82                ; 3
    bit    ram_B4                ; 3
    bmi    LF6A3                 ; 2³
    cpx    #$15                  ; 2
    bcc    LF6A3                 ; 2³
    cpx    #$30                  ; 2
    bcc    LF6AA                 ; 2³
    bcs    LF6A9                 ; 3   always branch

LF6A3:
    ror                          ; 2
    bcc    LF6AA                 ; 2³
LF6A6:
    jmp    LF833                 ; 3

LF6A9:
    inx                          ; 2
LF6AA:
    inx                          ; 2
    stx    ram_CF                ; 3
    bne    LF6A6                 ; 3   always branch?

LF6AF:  ; indirect jump
    lda    ram_C9                ; 3
    cmp    #$64                  ; 2
    bcc    LF6BC                 ; 2³
    rol    ram_B2                ; 5
    clc                          ; 2
    ror    ram_B2                ; 5
    bpl    LF6DE                 ; 2³
LF6BC:
    cmp    #$2C                  ; 2
    beq    LF6C6                 ; 2³
    lda    #$7F                  ; 2
    sta    ram_D2                ; 3
    bne    LF6DE                 ; 3   always branch

LF6C6:
    bit    ram_B2                ; 3
    bmi    LF6DE                 ; 2³
    lda    #$30                  ; 2
    sta    ram_CC                ; 3
    ldy    #$00                  ; 2
    sty    ram_D2                ; 3
    ldy    #$7F                  ; 2
    sty    ram_DC                ; 3
    sty    ram_D5                ; 3
    inc    ram_C9                ; 5
    lda    #$80                  ; 2
    sta    ram_9D                ; 3
LF6DE:
    jmp    LF833                 ; 3

LF6E1:  ; indirect jump
    ldy    ram_DF                ; 3
    dey                          ; 2
    bne    LF6DE                 ; 2³
    lda    ram_AF                ; 3
    and    #$07                  ; 2
    bne    LF71D                 ; 2³+1
    lda    #$40                  ; 2
    sta    ram_93                ; 3
    lda    ram_83                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    ldy    LFCDC,X               ; 4
    ldx    LFCAA,Y               ; 4
    sty    ram_84                ; 3
    jsr    LF89D                 ; 6
    bcc    LF70A                 ; 2³
LF705:
    inc    ram_DF                ; 5
    bne    LF6DE                 ; 3+1   always branch

    .byte $00 ; |        | $F709

LF70A:
    ldy    ram_84                ; 3
    tya                          ; 2
    ora    ram_AF                ; 3
    sta    ram_AF                ; 3
    lda    LFCA2,Y               ; 4
    sta    ram_CE                ; 3
    lda    LFCA6,Y               ; 4
    sta    ram_DF                ; 3
    bne    LF6DE                 ; 3+1   always branch

LF71D:
    cmp    #$04                  ; 2
    bcs    LF705                 ; 2³
    rol    ram_AF                ; 5
    sec                          ; 2
    ror    ram_AF                ; 5
    bmi    LF705                 ; 3   always branch

LF728:  ; indirect jump
    ldy    #$00                  ; 2
    sty    ram_D2                ; 3
    ldy    #$7F                  ; 2
    sty    ram_DC                ; 3
    sty    ram_D5                ; 3
    lda    #$71                  ; 2
    sta    ram_CC                ; 3
    ldy    #$4F                  ; 2
    lda    #$3A                  ; 2
    cmp    ram_CF                ; 3
    bne    LF74A                 ; 2³
    lda    ram_C5                ; 3
    cmp    #$07                  ; 2
    beq    LF74C                 ; 2³
    lda    #$5E                  ; 2
    cmp    ram_C9                ; 3
    beq    LF74C                 ; 2³
LF74A:
    ldy    #$0D                  ; 2
LF74C:
    sty    ram_DF                ; 3
    lda    ram_83                ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    bpl    LF75A                 ; 2³
    eor    #$FF                  ; 2
    sec                          ; 2
    adc    #$00                  ; 2
LF75A:
    cmp    #$0B                  ; 2
    bcc    LF760                 ; 2³
    lda    #$0B                  ; 2
LF760:
    sta    ram_CE                ; 3
    bit    ram_B3                ; 3
    bpl    LF78B                 ; 2³
    cmp    #$08                  ; 2
    bcs    LF787                 ; 2³
    ldx    ram_C5                ; 3
    cpx    #$0E                  ; 2
    bne    LF787                 ; 2³
    stx    ram_AB                ; 3
    lda    #$04                  ; 2
    and    ram_82                ; 3
    bne    LF787                 ; 2³
    lda    ram_8C                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LFAC2,X               ; 4
    sta    ram_CB                ; 3
    lda    LFAD2,X               ; 4
    bne    LF789                 ; 3   always branch

LF787:
    lda    #$70                  ; 2
LF789:
    sta    ram_D1                ; 3
LF78B:
    rol    ram_B3                ; 5
    lda    #$3A                  ; 2
    cmp    ram_CF                ; 3
    bne    LF7A2                 ; 2³
    cpy    #$4F                  ; 2
    beq    LF79D                 ; 2³
    lda    #$5E                  ; 2
    cmp    ram_C9                ; 3
    bne    LF7A2                 ; 2³
LF79D:
    sec                          ; 2
    ror    ram_B3                ; 5
    bmi    LF7A5                 ; 2³
LF7A2:
    clc                          ; 2
    ror    ram_B3                ; 5
LF7A5:
    jmp    LF833                 ; 3


LF7A8:  ; indirect jump
    lda    #$08                  ; 2
    and    ram_C7                ; 3
    bne    LF7C0                 ; 2³
    lda    #$4C                  ; 2
    sta    ram_CC                ; 3
    lda    #$2A                  ; 2
    sta    ram_D2                ; 3
    lda    #$BA                  ; 2
    sta    ram_D6                ; 3
    lda    #$FA                  ; 2
    sta    ram_D7                ; 3
    bne    LF7C4                 ; 3   always branch

LF7C0:
    lda    #$F0                  ; 2
    sta    ram_D2                ; 3
LF7C4:
    lda    ram_B5                ; 3
    and    #$0F                  ; 2
    beq    LF833                 ; 2³+1
    sta    ram_DC                ; 3
    ldy    #$14                  ; 2
    sty    ram_CE                ; 3
    ldy    #$3B                  ; 2
    sty    ram_E0                ; 3
    iny                          ; 2
    sty    ram_D4                ; 3
    lda    #$C1                  ; 2
    sec                          ; 2
    sbc    ram_DC                ; 3
    sta    ram_DD                ; 3
    bne    LF833                 ; 3+1   always branch

LF7E0:  ; indirect jump
    lda    ram_82                ; 3
    and    #$18                  ; 2
    adc    #$E0                  ; 2
    sta    ram_DD                ; 3
    lda    ram_82                ; 3
    and    #$07                  ; 2
    bne    LF80F                 ; 2³+1
    ldx    #$00                  ; 2
    ldy    #$01                  ; 2
    lda    ram_CF                ; 3
    cmp    #$3A                  ; 2
    bcc    LF80C                 ; 2³+1
    lda    ram_C9                ; 3
    cmp    #$2B                  ; 2
    bcc    LF802                 ; 2³+1
    cmp    #$6D                  ; 2
    bcc    LF80C                 ; 2³
LF802:
    ldy    #$05                  ; 2
    lda    #$4C                  ; 2
    sta    ram_CD                ; 3
    lda    #$0B                  ; 2
    sta    ram_D3                ; 3
LF80C:
    jsr    LF8B3                 ; 6
LF80F:
    ldx    #$4E                  ; 2
    cpx    ram_CF                ; 3
    bne    LF833                 ; 2³
    ldx    ram_C9                ; 3
    cpx    #$76                  ; 2
    beq    LF81F                 ; 2³
    cpx    #$14                  ; 2
    bne    LF833                 ; 2³
LF81F:
    lda    SWCHA                 ; 4
    and    #$0F                  ; 2
    cmp    #$0D                  ; 2
    bne    LF833                 ; 2³
    sta    ram_A6                ; 3
    lda    #$4C                  ; 2
    sta    ram_C9                ; 3
    ror    ram_B5                ; 5
    sec                          ; 2
    rol    ram_B5                ; 5
LF833:  ; indirect jump also
    lda    #<LD80D               ; 2
    sta    ram_88                ; 3
    lda    #>LD80D               ; 2
    sta    ram_89                ; 3
    jmp    LF493                 ; 3

LF83E:  ; indirect jump
    lda    #$40                  ; 2
    sta    ram_93                ; 3
    bne    LF833                 ; 3   always branch

LF844:  ; indirect jump
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    sta    CXCLR                 ; 3
    ldy    #$FF                  ; 2
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    ldx    ram_81                ; 3
    lda    LFAAC,X               ; 4
    sta    PF0                   ; 3
    iny                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    VBLANK                ; 3
    sty    ram_80                ; 3
    cpx    #$04                  ; 2
    bne    LF865                 ; 2³
    dey                          ; 2
LF865:
    sty    ENABL                 ; 3
    cpx    #$0D                  ; 2
    beq    LF874                 ; 2³
    bit    ram_9D                ; 3
    bmi    LF874                 ; 2³
    ldy    SWCHA                 ; 4
    sty    REFP1                 ; 3
LF874:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    ram_81                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LFA91,Y               ; 4
    sta    PF1                   ; 3
    lda    LFA9E,Y               ; 4
    sta    PF2                   ; 3
    ldx    LF9EE,Y               ; 4
    lda    LFAE2+1,X             ; 4
    pha                          ; 3
    lda    LFAE2,X               ; 4
    pha                          ; 3
    lda    #$00                  ; 2
    tax                          ; 2
    sta    ram_84                ; 3
    rts                          ; 6

LF89D:
    lda    LFC75,X               ; 4
    lsr                          ; 2
    tay                          ; 2
    lda    LFCE2,Y               ; 4
    bcs    LF8AD                 ; 2³
    and    ram_C6                ; 3
    beq    LF8AC                 ; 2³
    sec                          ; 2
LF8AC:
    rts                          ; 6

LF8AD:
    and    ram_C7                ; 3
    bne    LF8AC                 ; 2³
    clc                          ; 2
    rts                          ; 6

LF8B3:
    cpy    #$01                  ; 2
    bne    LF8BB                 ; 2³
    lda    ram_CF                ; 3
    bmi    LF8CC                 ; 2³
LF8BB:
    lda    ram_CE,X              ; 4
    cmp.wy ram_CE,Y              ; 4
    bne    LF8C6                 ; 2³
    cpy    #$05                  ; 2
    bcs    LF8CE                 ; 2³
LF8C6:
    bcs    LF8CC                 ; 2³
    inc    ram_CE,X              ; 6
    bne    LF8CE                 ; 2³
LF8CC:
    dec    ram_CE,X              ; 6
LF8CE:
    lda    ram_C8,X              ; 4
    cmp.wy ram_C8,Y              ; 4
    bne    LF8D9                 ; 2³
    cpy    #$05                  ; 2
    bcs    LF8DD                 ; 2³
LF8D9:
    bcs    LF8DE                 ; 2³
    inc    ram_C8,X              ; 6
LF8DD:
    rts                          ; 6

LF8DE:
    dec    ram_C8,X              ; 6
    rts                          ; 6

LF8E1:
    lda    ram_CE,X              ; 4
    cmp    #$53                  ; 2
    bcc    LF8F1                 ; 2³
LF8E7:
    rol    ram_8C,X              ; 6
    clc                          ; 2
    ror    ram_8C,X              ; 6
    lda    #$78                  ; 2
    sta    ram_CE,X              ; 4
    rts                          ; 6

LF8F1:
    lda    ram_C8,X              ; 4
    cmp    #$10                  ; 2
    bcc    LF8E7                 ; 2³
    cmp    #$8E                  ; 2
    bcs    LF8E7                 ; 2³
    rts                          ; 6

    .byte $00 ; |        | $F8FC  free bytes
    .byte $00 ; |        | $F8FD
    .byte $00 ; |        | $F8FE
    .byte $00 ; |        | $F8FF

       ORG $1900
      RORG $F900

    .byte $00 ; |        | $F900
    .byte $E4 ; |XXX  X  | $F901
    .byte $7E ; | XXXXXX | $F902
    .byte $9A ; |X  XX X | $F903
    .byte $E4 ; |XXX  X  | $F904
    .byte $A6 ; |X X  XX | $F905
    .byte $5A ; | X XX X | $F906
    .byte $7E ; | XXXXXX | $F907
    .byte $E4 ; |XXX  X  | $F908
    .byte $7F ; | XXXXXXX| $F909
    .byte $00 ; |        | $F90A
    .byte $00 ; |        | $F90B
    .byte $84 ; |X    X  | $F90C
    .byte $08 ; |    X   | $F90D
    .byte $2A ; |  X X X | $F90E
    .byte $22 ; |  X   X | $F90F
    .byte $00 ; |        | $F910
    .byte $22 ; |  X   X | $F911
    .byte $2A ; |  X X X | $F912
    .byte $08 ; |    X   | $F913
    .byte $00 ; |        | $F914
    .byte $B9 ; |X XXX  X| $F915
    .byte $D4 ; |XX X X  | $F916
    .byte $89 ; |X   X  X| $F917
    .byte $6C ; | XX XX  | $F918
    .byte $7B ; | XXXX XX| $F919
    .byte $7F ; | XXXXXXX| $F91A
    .byte $81 ; |X      X| $F91B
    .byte $A6 ; |X X  XX | $F91C
    .byte $3F ; |  XXXXXX| $F91D
    .byte $77 ; | XXX XXX| $F91E
    .byte $07 ; |     XXX| $F91F
    .byte $7F ; | XXXXXXX| $F920
    .byte $86 ; |X    XX | $F921
    .byte $89 ; |X   X  X| $F922
    .byte $3F ; |  XXXXXX| $F923
    .byte $1F ; |   XXXXX| $F924
    .byte $0E ; |    XXX | $F925
    .byte $0C ; |    XX  | $F926
    .byte $00 ; |        | $F927
    .byte $C1 ; |XX     X| $F928
    .byte $B6 ; |X XX XX | $F929
    .byte $00 ; |        | $F92A
    .byte $00 ; |        | $F92B
    .byte $00 ; |        | $F92C
    .byte $81 ; |X      X| $F92D
    .byte $1C ; |   XXX  | $F92E
    .byte $2A ; |  X X X | $F92F
    .byte $55 ; | X X X X| $F930
    .byte $2A ; |  X X X | $F931
    .byte $14 ; |   X X  | $F932
    .byte $3E ; |  XXXXX | $F933
    .byte $00 ; |        | $F934
    .byte $A9 ; |X X X  X| $F935
    .byte $00 ; |        | $F936
    .byte $E4 ; |XXX  X  | $F937
    .byte $89 ; |X   X  X| $F938
    .byte $81 ; |X      X| $F939
    .byte $7E ; | XXXXXX | $F93A
    .byte $9A ; |X  XX X | $F93B
    .byte $E4 ; |XXX  X  | $F93C
    .byte $A6 ; |X X  XX | $F93D
    .byte $5A ; | X XX X | $F93E
    .byte $7E ; | XXXXXX | $F93F
    .byte $E4 ; |XXX  X  | $F940
    .byte $7F ; | XXXXXXX| $F941
    .byte $00 ; |        | $F942
    .byte $C9 ; |XX  X  X| $F943
    .byte $89 ; |X   X  X| $F944
    .byte $82 ; |X     X | $F945
    .byte $00 ; |        | $F946
    .byte $7C ; | XXXXX  | $F947
    .byte $18 ; |   XX   | $F948
    .byte $18 ; |   XX   | $F949
    .byte $92 ; |X  X  X | $F94A
    .byte $7F ; | XXXXXXX| $F94B
    .byte $1F ; |   XXXXX| $F94C
    .byte $07 ; |     XXX| $F94D
    .byte $00 ; |        | $F94E
    .byte $00 ; |        | $F94F
    .byte $00 ; |        | $F950
    .byte $94 ; |X  X X  | $F951
    .byte $00 ; |        | $F952
    .byte $08 ; |    X   | $F953
    .byte $1C ; |   XXX  | $F954
    .byte $3E ; |  XXXXX | $F955
    .byte $3E ; |  XXXXX | $F956
    .byte $3E ; |  XXXXX | $F957
    .byte $3E ; |  XXXXX | $F958
    .byte $1C ; |   XXX  | $F959
    .byte $08 ; |    X   | $F95A
    .byte $00 ; |        | $F95B
    .byte $8E ; |X   XXX | $F95C
    .byte $7F ; | XXXXXXX| $F95D
    .byte $7F ; | XXXXXXX| $F95E
    .byte $7F ; | XXXXXXX| $F95F
    .byte $14 ; |   X X  | $F960
    .byte $14 ; |   X X  | $F961
    .byte $00 ; |        | $F962
    .byte $00 ; |        | $F963
    .byte $2A ; |  X X X | $F964
    .byte $2A ; |  X X X | $F965
    .byte $00 ; |        | $F966
    .byte $00 ; |        | $F967
    .byte $14 ; |   X X  | $F968
    .byte $36 ; |  XX XX | $F969
    .byte $22 ; |  X   X | $F96A
    .byte $08 ; |    X   | $F96B
    .byte $08 ; |    X   | $F96C
    .byte $3E ; |  XXXXX | $F96D
    .byte $1C ; |   XXX  | $F96E
    .byte $08 ; |    X   | $F96F
    .byte $00 ; |        | $F970
    .byte $41 ; | X     X| $F971
    .byte $63 ; | XX   XX| $F972
    .byte $49 ; | X  X  X| $F973
    .byte $08 ; |    X   | $F974
    .byte $00 ; |        | $F975
    .byte $00 ; |        | $F976
    .byte $14 ; |   X X  | $F977
    .byte $14 ; |   X X  | $F978
    .byte $00 ; |        | $F979
    .byte $00 ; |        | $F97A
    .byte $08 ; |    X   | $F97B
    .byte $6B ; | XX X XX| $F97C
    .byte $6B ; | XX X XX| $F97D
    .byte $08 ; |    X   | $F97E
    .byte $00 ; |        | $F97F
    .byte $22 ; |  X   X | $F980
    .byte $22 ; |  X   X | $F981
    .byte $00 ; |        | $F982
    .byte $00 ; |        | $F983
    .byte $08 ; |    X   | $F984
    .byte $1C ; |   XXX  | $F985
    .byte $1C ; |   XXX  | $F986
    .byte $7F ; | XXXXXXX| $F987
    .byte $7F ; | XXXXXXX| $F988
    .byte $7F ; | XXXXXXX| $F989
    .byte $E4 ; |XXX  X  | $F98A
    .byte $41 ; | X     X| $F98B
    .byte $41 ; | X     X| $F98C
    .byte $41 ; | X     X| $F98D
    .byte $41 ; | X     X| $F98E
    .byte $41 ; | X     X| $F98F
    .byte $41 ; | X     X| $F990
    .byte $41 ; | X     X| $F991
    .byte $41 ; | X     X| $F992
    .byte $41 ; | X     X| $F993
    .byte $41 ; | X     X| $F994
    .byte $7F ; | XXXXXXX| $F995
    .byte $92 ; |X  X  X | $F996
    .byte $77 ; | XXX XXX| $F997
    .byte $77 ; | XXX XXX| $F998
    .byte $63 ; | XX   XX| $F999
    .byte $77 ; | XXX XXX| $F99A
    .byte $14 ; |   X X  | $F99B
    .byte $36 ; |  XX XX | $F99C
    .byte $55 ; | X X X X| $F99D
    .byte $63 ; | XX   XX| $F99E
    .byte $77 ; | XXX XXX| $F99F
    .byte $7F ; | XXXXXXX| $F9A0
    .byte $7F ; | XXXXXXX| $F9A1
    .byte $00 ; |        | $F9A2
    .byte $86 ; |X    XX | $F9A3
    .byte $24 ; |  X  X  | $F9A4
    .byte $18 ; |   XX   | $F9A5
    .byte $24 ; |  X  X  | $F9A6
    .byte $24 ; |  X  X  | $F9A7
    .byte $7E ; | XXXXXX | $F9A8
    .byte $5A ; | X XX X | $F9A9
    .byte $5B ; | X XX XX| $F9AA
    .byte $3C ; |  XXXX  | $F9AB
    .byte $00 ; |        | $F9AC
    .byte $00 ; |        | $F9AD
    .byte $00 ; |        | $F9AE
    .byte $00 ; |        | $F9AF
    .byte $00 ; |        | $F9B0
    .byte $00 ; |        | $F9B1
    .byte $00 ; |        | $F9B2
    .byte $00 ; |        | $F9B3
    .byte $00 ; |        | $F9B4
    .byte $00 ; |        | $F9B5
    .byte $00 ; |        | $F9B6
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
    .byte $B9 ; |X XXX  X| $F9C5
    .byte $E4 ; |XXX  X  | $F9C6
    .byte $81 ; |X      X| $F9C7
    .byte $89 ; |X   X  X| $F9C8
    .byte $55 ; | X X X X| $F9C9
    .byte $F9 ; |XXXXX  X| $F9CA
    .byte $89 ; |X   X  X| $F9CB
    .byte $F9 ; |XXXXX  X| $F9CC
    .byte $81 ; |X      X| $F9CD
    .byte $FA ; |XXXXX X | $F9CE
    .byte $32 ; |  XX  X | $F9CF
    .byte $1C ; |   XXX  | $F9D0
    .byte $89 ; |X   X  X| $F9D1
    .byte $3E ; |  XXXXX | $F9D2
    .byte $91 ; |X  X   X| $F9D3
    .byte $7F ; | XXXXXXX| $F9D4
    .byte $7F ; | XXXXXXX| $F9D5
    .byte $7F ; | XXXXXXX| $F9D6
    .byte $7F ; | XXXXXXX| $F9D7
    .byte $89 ; |X   X  X| $F9D8
    .byte $1F ; |   XXXXX| $F9D9
    .byte $07 ; |     XXX| $F9DA
    .byte $01 ; |       X| $F9DB
    .byte $00 ; |        | $F9DC
    .byte $E9 ; |XXX X  X| $F9DD
    .byte $FE ; |XXXXXXX | $F9DE
    .byte $89 ; |X   X  X| $F9DF
    .byte $3F ; |  XXXXXX| $F9E0
    .byte $7F ; | XXXXXXX| $F9E1
    .byte $F9 ; |XXXXX  X| $F9E2
    .byte $91 ; |X  X   X| $F9E3
    .byte $F9 ; |XXXXX  X| $F9E4
    .byte $89 ; |X   X  X| $F9E5
    .byte $3F ; |  XXXXXX| $F9E6
    .byte $F9 ; |XXXXX  X| $F9E7
    .byte $7F ; | XXXXXXX| $F9E8
    .byte $3F ; |  XXXXXX| $F9E9
    .byte $7F ; | XXXXXXX| $F9EA
    .byte $7F ; | XXXXXXX| $F9EB
    .byte $00 ; |        | $F9EC
    .byte $00 ; |        | $F9ED
LF9EE:
    .byte $00 ; |        | $F9EE
    .byte $00 ; |        | $F9EF
    .byte $00 ; |        | $F9F0
    .byte $00 ; |        | $F9F1
    .byte $00 ; |        | $F9F2
    .byte $00 ; |        | $F9F3
    .byte $02 ; |      X | $F9F4
    .byte $02 ; |      X | $F9F5
    .byte $02 ; |      X | $F9F6
    .byte $02 ; |      X | $F9F7
    .byte $02 ; |      X | $F9F8
    .byte $04 ; |     X  | $F9F9
    .byte $04 ; |     X  | $F9FA
    .byte $06 ; |     XX | $F9FB
LF9FC:
    .byte $1C ; |   XXX  | $F9FC
    .byte $36 ; |  XX XX | $F9FD
    .byte $63 ; | XX   XX| $F9FE
    .byte $36 ; |  XX XX | $F9FF
LFA00:
    .byte $18 ; |   XX   | $FA00
    .byte $3C ; |  XXXX  | $FA01
    .byte $00 ; |        | $FA02
    .byte $18 ; |   XX   | $FA03
    .byte $1C ; |   XXX  | $FA04
    .byte $18 ; |   XX   | $FA05
    .byte $18 ; |   XX   | $FA06
    .byte $0C ; |    XX  | $FA07
    .byte $62 ; | XX   X | $FA08
    .byte $43 ; | X    XX| $FA09
    .byte $00 ; |        | $FA0A
    .byte $18 ; |   XX   | $FA0B
    .byte $3C ; |  XXXX  | $FA0C
    .byte $00 ; |        | $FA0D
    .byte $18 ; |   XX   | $FA0E
    .byte $38 ; |  XXX   | $FA0F
    .byte $1C ; |   XXX  | $FA10
    .byte $18 ; |   XX   | $FA11
    .byte $14 ; |   X X  | $FA12
    .byte $64 ; | XX  X  | $FA13
    .byte $46 ; | X   XX | $FA14
    .byte $00 ; |        | $FA15
    .byte $18 ; |   XX   | $FA16
    .byte $3C ; |  XXXX  | $FA17
    .byte $00 ; |        | $FA18
    .byte $38 ; |  XXX   | $FA19
    .byte $38 ; |  XXX   | $FA1A
    .byte $18 ; |   XX   | $FA1B
    .byte $18 ; |   XX   | $FA1C
    .byte $28 ; |  X X   | $FA1D
    .byte $48 ; | X  X   | $FA1E
    .byte $8C ; |X   XX  | $FA1F
    .byte $00 ; |        | $FA20
    .byte $18 ; |   XX   | $FA21
    .byte $3C ; |  XXXX  | $FA22
    .byte $00 ; |        | $FA23
    .byte $38 ; |  XXX   | $FA24
    .byte $58 ; | X XX   | $FA25
    .byte $38 ; |  XXX   | $FA26
    .byte $10 ; |   X    | $FA27
    .byte $E8 ; |XXX X   | $FA28
    .byte $88 ; |X   X   | $FA29
    .byte $0C ; |    XX  | $FA2A
    .byte $00 ; |        | $FA2B
    .byte $18 ; |   XX   | $FA2C
    .byte $3C ; |  XXXX  | $FA2D
    .byte $00 ; |        | $FA2E
    .byte $30 ; |  XX    | $FA2F
    .byte $78 ; | XXXX   | $FA30
    .byte $34 ; |  XX X  | $FA31
    .byte $18 ; |   XX   | $FA32
    .byte $60 ; | XX     | $FA33
    .byte $50 ; | X X    | $FA34
    .byte $18 ; |   XX   | $FA35
    .byte $00 ; |        | $FA36
    .byte $18 ; |   XX   | $FA37
    .byte $3C ; |  XXXX  | $FA38
    .byte $00 ; |        | $FA39
    .byte $30 ; |  XX    | $FA3A
    .byte $38 ; |  XXX   | $FA3B
    .byte $3C ; |  XXXX  | $FA3C
    .byte $18 ; |   XX   | $FA3D
    .byte $38 ; |  XXX   | $FA3E
    .byte $20 ; |  X     | $FA3F
    .byte $30 ; |  XX    | $FA40
    .byte $00 ; |        | $FA41
    .byte $18 ; |   XX   | $FA42
    .byte $3C ; |  XXXX  | $FA43
    .byte $00 ; |        | $FA44
    .byte $18 ; |   XX   | $FA45
    .byte $38 ; |  XXX   | $FA46
    .byte $1C ; |   XXX  | $FA47
    .byte $18 ; |   XX   | $FA48
    .byte $2C ; |  X XX  | $FA49
    .byte $20 ; |  X     | $FA4A
    .byte $30 ; |  XX    | $FA4B
    .byte $00 ; |        | $FA4C
    .byte $18 ; |   XX   | $FA4D
    .byte $3C ; |  XXXX  | $FA4E
    .byte $00 ; |        | $FA4F
    .byte $18 ; |   XX   | $FA50
    .byte $18 ; |   XX   | $FA51
    .byte $18 ; |   XX   | $FA52
    .byte $08 ; |    X   | $FA53
    .byte $16 ; |   X XX | $FA54
    .byte $30 ; |  XX    | $FA55
    .byte $20 ; |  X     | $FA56
    .byte $00 ; |        | $FA57
LFA58:
    .byte $18 ; |   XX   | $FA58
    .byte $3C ; |  XXXX  | $FA59
    .byte $00 ; |        | $FA5A
    .byte $18 ; |   XX   | $FA5B
    .byte $3C ; |  XXXX  | $FA5C
    .byte $5A ; | X XX X | $FA5D
    .byte $3C ; |  XXXX  | $FA5E
    .byte $18 ; |   XX   | $FA5F
    .byte $18 ; |   XX   | $FA60
    .byte $3C ; |  XXXX  | $FA61
    .byte $00 ; |        | $FA62
LFA63:
    .byte $3C ; |  XXXX  | $FA63
    .byte $7E ; | XXXXXX | $FA64
    .byte $FF ; |XXXXXXXX| $FA65
    .byte $A5 ; |X X  X X| $FA66
    .byte $42 ; | X    X | $FA67
    .byte $42 ; | X    X | $FA68
    .byte $18 ; |   XX   | $FA69
    .byte $3C ; |  XXXX  | $FA6A
    .byte $81 ; |X      X| $FA6B
    .byte $5A ; | X XX X | $FA6C
    .byte $3C ; |  XXXX  | $FA6D
    .byte $3C ; |  XXXX  | $FA6E
    .byte $38 ; |  XXX   | $FA6F
    .byte $18 ; |   XX   | $FA70
    .byte $00 ; |        | $FA71
    .byte $10 ; |   X    | $FA72
    .byte $10 ; |   X    | $FA73
    .byte $00 ; |        | $FA74
    .byte $F0 ; |XXXX    | $FA75
    .byte $F0 ; |XXXX    | $FA76
    .byte $00 ; |        | $FA77
    .byte $10 ; |   X    | $FA78
    .byte $00 ; |        | $FA79
    .byte $10 ; |   X    | $FA7A
    .byte $10 ; |   X    | $FA7B
    .byte $00 ; |        | $FA7C
    .byte $F0 ; |XXXX    | $FA7D
    .byte $00 ; |        | $FA7E
    .byte $10 ; |   X    | $FA7F
    .byte $10 ; |   X    | $FA80
    .byte $00 ; |        | $FA81
    .byte $10 ; |   X    | $FA82
    .byte $00 ; |        | $FA83
    .byte $F0 ; |XXXX    | $FA84
    .byte $F0 ; |XXXX    | $FA85
    .byte $00 ; |        | $FA86
    .byte $F0 ; |XXXX    | $FA87
    .byte $F0 ; |XXXX    | $FA88
    .byte $00 ; |        | $FA89
    .byte $F0 ; |XXXX    | $FA8A
    .byte $F0 ; |XXXX    | $FA8B
    .byte $00 ; |        | $FA8C
    .byte $10 ; |   X    | $FA8D
    .byte $10 ; |   X    | $FA8E
    .byte $00 ; |        | $FA8F
    .byte $F0 ; |XXXX    | $FA90
LFA91:
    .byte $00 ; |        | $FA91
    .byte $00 ; |        | $FA92
    .byte $E0 ; |XXX     | $FA93
    .byte $00 ; |        | $FA94
    .byte $00 ; |        | $FA95
    .byte $C0 ; |XX      | $FA96
    .byte $FF ; |XXXXXXXX| $FA97
    .byte $FF ; |XXXXXXXX| $FA98
    .byte $00 ; |        | $FA99
    .byte $FF ; |XXXXXXXX| $FA9A
    .byte $FF ; |XXXXXXXX| $FA9B
    .byte $F0 ; |XXXX    | $FA9C
    .byte $F0 ; |XXXX    | $FA9D
LFA9E:
    .byte $00 ; |        | $FA9E
    .byte $E0 ; |XXX     | $FA9F
    .byte $00 ; |        | $FAA0
    .byte $E0 ; |XXX     | $FAA1
    .byte $80 ; |X       | $FAA2
    .byte $00 ; |        | $FAA3
    .byte $FF ; |XXXXXXXX| $FAA4
    .byte $FF ; |XXXXXXXX| $FAA5
    .byte $00 ; |        | $FAA6
    .byte $FF ; |XXXXXXXX| $FAA7
    .byte $FF ; |XXXXXXXX| $FAA8
    .byte $C0 ; |XX      | $FAA9
    .byte $00 ; |        | $FAAA
    .byte $00 ; |        | $FAAB
LFAAC:
    .byte $C0 ; |XX      | $FAAC
    .byte $F0 ; |XXXX    | $FAAD
    .byte $F0 ; |XXXX    | $FAAE
    .byte $F0 ; |XXXX    | $FAAF
    .byte $F0 ; |XXXX    | $FAB0
    .byte $F0 ; |XXXX    | $FAB1
    .byte $C0 ; |XX      | $FAB2
    .byte $C0 ; |XX      | $FAB3
    .byte $C0 ; |XX      | $FAB4
    .byte $F0 ; |XXXX    | $FAB5
    .byte $F0 ; |XXXX    | $FAB6
    .byte $F0 ; |XXXX    | $FAB7
    .byte $F0 ; |XXXX    | $FAB8
    .byte $C0 ; |XX      | $FAB9
    .byte $F7 ; |XXXX XXX| $FABA
    .byte $F7 ; |XXXX XXX| $FABB
    .byte $F7 ; |XXXX XXX| $FABC
    .byte $F7 ; |XXXX XXX| $FABD
    .byte $F7 ; |XXXX XXX| $FABE
    .byte $37 ; |  XX XXX| $FABF
    .byte $37 ; |  XX XXX| $FAC0
    .byte $00 ; |        | $FAC1
LFAC2:
    .byte $63 ; | XX   XX| $FAC2
    .byte $62 ; | XX   X | $FAC3
    .byte $6B ; | XX X XX| $FAC4
    .byte $5B ; | X XX XX| $FAC5
    .byte $6A ; | XX X X | $FAC6
    .byte $5F ; | X XXXXX| $FAC7
    .byte $5A ; | X XX X | $FAC8
    .byte $5A ; | X XX X | $FAC9
    .byte $6B ; | XX X XX| $FACA
    .byte $5E ; | X XXXX | $FACB
    .byte $67 ; | XX  XXX| $FACC
    .byte $5A ; | X XX X | $FACD
    .byte $62 ; | XX   X | $FACE
    .byte $6B ; | XX X XX| $FACF
    .byte $5A ; | X XX X | $FAD0
    .byte $6B ; | XX X XX| $FAD1
LFAD2:
    .byte $22 ; |  X   X | $FAD2
    .byte $13 ; |   X  XX| $FAD3
    .byte $13 ; |   X  XX| $FAD4
    .byte $18 ; |   XX   | $FAD5
    .byte $18 ; |   XX   | $FAD6
    .byte $1E ; |   XXXX | $FAD7
    .byte $21 ; |  X    X| $FAD8
    .byte $13 ; |   X  XX| $FAD9
    .byte $21 ; |  X    X| $FADA
    .byte $26 ; |  X  XX | $FADB
    .byte $26 ; |  X  XX | $FADC
    .byte $2B ; |  X X XX| $FADD
    .byte $2A ; |  X X X | $FADE
    .byte $2B ; |  X X XX| $FADF
    .byte $31 ; |  XX   X| $FAE0
    .byte $31 ; |  XX   X| $FAE1
LFAE2:
    .word LF0B5-1        ; $FAE2
    .word LF003-1        ; $FAE4
    .word LF140-1        ; $FAE6
    .word LF4A6-1        ; $FAE8

LFAEA:
    .byte <LFCAE         ; $FAEA
    .byte <LFCC0         ; $FAEB
    .byte <LFCB7         ; $FAEC
    .byte <LFCC9         ; $FAED
LFAEE:
    .byte $1B ; |   XX XX| $FAEE
    .byte $18 ; |   XX   | $FAEF
    .byte $17 ; |   X XXX| $FAF0
    .byte $17 ; |   X XXX| $FAF1
    .byte $18 ; |   XX   | $FAF2
    .byte $18 ; |   XX   | $FAF3
    .byte $1B ; |   XX XX| $FAF4
    .byte $1B ; |   XX XX| $FAF5
    .byte $1D ; |   XXX X| $FAF6
    .byte $18 ; |   XX   | $FAF7
    .byte $17 ; |   X XXX| $FAF8
    .byte $12 ; |   X  X | $FAF9
    .byte $18 ; |   XX   | $FAFA
    .byte $17 ; |   X XXX| $FAFB
    .byte $1B ; |   XX XX| $FAFC
    .byte $1D ; |   XXX X| $FAFD
    .byte $00 ; |        | $FAFE
    .byte $00 ; |        | $FAFF
LFB00:
    .byte $00 ; |        | $FB00
    .byte $00 ; |        | $FB01
    .byte $00 ; |        | $FB02
    .byte $00 ; |        | $FB03
    .byte $00 ; |        | $FB04
    .byte $00 ; |        | $FB05
    .byte $00 ; |        | $FB06
    .byte $00 ; |        | $FB07
CopyrightThree:
    .byte $71 ; | XXX   X| $FB08
    .byte $41 ; | X     X| $FB09
    .byte $41 ; | X     X| $FB0A
    .byte $71 ; | XXX   X| $FB0B
    .byte $11 ; |   X   X| $FB0C
    .byte $51 ; | X X   X| $FB0D
    .byte $70 ; | XXX    | $FB0E
    .byte $00 ; |        | $FB0F
    .byte $00 ; |        | $FB10
    .byte $01 ; |       X| $FB11
    .byte $3F ; |  XXXXXX| $FB12
    .byte $6B ; | XX X XX| $FB13
    .byte $7F ; | XXXXXXX| $FB14
    .byte $01 ; |       X| $FB15
    .byte $00 ; |        | $FB16
    .byte $00 ; |        | $FB17
    .byte $77 ; | XXX XXX| $FB18
    .byte $77 ; | XXX XXX| $FB19
    .byte $77 ; | XXX XXX| $FB1A
    .byte $00 ; |        | $FB1B
    .byte $00 ; |        | $FB1C
    .byte $77 ; | XXX XXX| $FB1D
    .byte $77 ; | XXX XXX| $FB1E
    .byte $77 ; | XXX XXX| $FB1F
LFB20:
    .byte $1C ; |   XXX  | $FB20
    .byte $2A ; |  X X X | $FB21
    .byte $55 ; | X X X X| $FB22
    .byte $2A ; |  X X X | $FB23
    .byte $55 ; | X X X X| $FB24
    .byte $2A ; |  X X X | $FB25
    .byte $1C ; |   XXX  | $FB26
    .byte $3E ; |  XXXXX | $FB27
    .byte $3A ; |  XXX X | $FB28
    .byte $01 ; |       X| $FB29
    .byte $7D ; | XXXXX X| $FB2A
    .byte $01 ; |       X| $FB2B
    .byte $39 ; |  XXX  X| $FB2C
    .byte $02 ; |      X | $FB2D
    .byte $3C ; |  XXXX  | $FB2E
    .byte $30 ; |  XX    | $FB2F
    .byte $2E ; |  X XXX | $FB30
    .byte $40 ; | X      | $FB31
    .byte $5F ; | X XXXXX| $FB32
    .byte $40 ; | X      | $FB33
    .byte $4E ; | X  XXX | $FB34
    .byte $20 ; |  X     | $FB35
    .byte $1E ; |   XXXX | $FB36
    .byte $06 ; |     XX | $FB37
    .byte $00 ; |        | $FB38
    .byte $25 ; |  X  X X| $FB39
    .byte $52 ; | X X  X | $FB3A
    .byte $7F ; | XXXXXXX| $FB3B
    .byte $50 ; | X X    | $FB3C
    .byte $20 ; |  X     | $FB3D
    .byte $00 ; |        | $FB3E
    .byte $00 ; |        | $FB3F
LFB40:
    .byte $FF ; |XXXXXXXX| $FB40
    .byte $66 ; | XX  XX | $FB41
    .byte $24 ; |  X  X  | $FB42
    .byte $24 ; |  X  X  | $FB43
    .byte $66 ; | XX  XX | $FB44
    .byte $E7 ; |XXX  XXX| $FB45
    .byte $C3 ; |XX    XX| $FB46
    .byte $E7 ; |XXX  XXX| $FB47
CopyrightTwo:
    .byte $17 ; |   X XXX| $FB48
    .byte $15 ; |   X X X| $FB49
    .byte $15 ; |   X X X| $FB4A
    .byte $77 ; | XXX XXX| $FB4B
    .byte $55 ; | X X X X| $FB4C
    .byte $55 ; | X X X X| $FB4D
    .byte $77 ; | XXX XXX| $FB4E
    .byte $00 ; |        | $FB4F
    .byte $21 ; |  X    X| $FB50
    .byte $11 ; |   X   X| $FB51
    .byte $09 ; |    X  X| $FB52
    .byte $11 ; |   X   X| $FB53
    .byte $22 ; |  X   X | $FB54
    .byte $44 ; | X   X  | $FB55
    .byte $28 ; |  X X   | $FB56
    .byte $10 ; |   X    | $FB57
    .byte $01 ; |       X| $FB58
    .byte $03 ; |      XX| $FB59
    .byte $07 ; |     XXX| $FB5A
    .byte $0F ; |    XXXX| $FB5B
    .byte $06 ; |     XX | $FB5C
    .byte $0C ; |    XX  | $FB5D
    .byte $18 ; |   XX   | $FB5E
    .byte $3C ; |  XXXX  | $FB5F
CopyrightOne:
    .byte $79 ; | XXXX  X| $FB60
    .byte $85 ; |X    X X| $FB61
    .byte $B5 ; |X XX X X| $FB62
    .byte $A5 ; |X X  X X| $FB63
    .byte $B5 ; |X XX X X| $FB64
    .byte $85 ; |X    X X| $FB65
    .byte $79 ; | XXXX  X| $FB66
    .byte $00 ; |        | $FB67
    .byte $00 ; |        | $FB68
    .byte $60 ; | XX     | $FB69
    .byte $60 ; | XX     | $FB6A
    .byte $78 ; | XXXX   | $FB6B
    .byte $68 ; | XX X   | $FB6C
    .byte $3F ; |  XXXXXX| $FB6D
    .byte $5F ; | X XXXXX| $FB6E
    .byte $00 ; |        | $FB6F
    .byte $08 ; |    X   | $FB70
    .byte $1C ; |   XXX  | $FB71
    .byte $22 ; |  X   X | $FB72
    .byte $49 ; | X  X  X| $FB73
    .byte $6B ; | XX X XX| $FB74
    .byte $00 ; |        | $FB75
    .byte $1C ; |   XXX  | $FB76
    .byte $08 ; |    X   | $FB77
LFB78:
    .byte $7F ; | XXXXXXX| $FB78
    .byte $5D ; | X XXX X| $FB79
    .byte $77 ; | XXX XXX| $FB7A
    .byte $77 ; | XXX XXX| $FB7B
    .byte $5D ; | X XXX X| $FB7C
    .byte $7F ; | XXXXXXX| $FB7D
    .byte $08 ; |    X   | $FB7E
    .byte $1C ; |   XXX  | $FB7F
    .byte $3E ; |  XXXXX | $FB80
    .byte $1C ; |   XXX  | $FB81
    .byte $49 ; | X  X  X| $FB82
    .byte $7F ; | XXXXXXX| $FB83
    .byte $49 ; | X  X  X| $FB84
    .byte $1C ; |   XXX  | $FB85
    .byte $36 ; |  XX XX | $FB86
    .byte $1C ; |   XXX  | $FB87
    .byte $16 ; |   X XX | $FB88
    .byte $0B ; |    X XX| $FB89
    .byte $0D ; |    XX X| $FB8A
    .byte $05 ; |     X X| $FB8B
    .byte $17 ; |   X XXX| $FB8C
    .byte $36 ; |  XX XX | $FB8D
    .byte $64 ; | XX  X  | $FB8E
    .byte $04 ; |     X  | $FB8F
HourGlass:
    .byte $77 ; | XXX XXX| $FB90
    .byte $36 ; |  XX XX | $FB91
    .byte $14 ; |   X X  | $FB92
    .byte $22 ; |  X   X | $FB93
    .byte $22 ; |  X   X | $FB94
    .byte $14 ; |   X X  | $FB95
    .byte $36 ; |  XX XX | $FB96
    .byte $77 ; | XXX XXX| $FB97
LFB98:
    .byte $3E ; |  XXXXX | $FB98
    .byte $41 ; | X     X| $FB99
    .byte $41 ; | X     X| $FB9A
    .byte $49 ; | X  X  X| $FB9B
    .byte $49 ; | X  X  X| $FB9C
    .byte $49 ; | X  X  X| $FB9D
    .byte $3E ; |  XXXXX | $FB9E
    .byte $1C ; |   XXX  | $FB9F
    .byte $3E ; |  XXXXX | $FBA0
    .byte $41 ; | X     X| $FBA1
    .byte $41 ; | X     X| $FBA2
    .byte $49 ; | X  X  X| $FBA3
    .byte $45 ; | X   X X| $FBA4
    .byte $43 ; | X    XX| $FBA5
    .byte $3E ; |  XXXXX | $FBA6
    .byte $1C ; |   XXX  | $FBA7
    .byte $3E ; |  XXXXX | $FBA8
    .byte $41 ; | X     X| $FBA9
    .byte $41 ; | X     X| $FBAA
    .byte $4F ; | X  XXXX| $FBAB
    .byte $41 ; | X     X| $FBAC
    .byte $41 ; | X     X| $FBAD
    .byte $3E ; |  XXXXX | $FBAE
    .byte $1C ; |   XXX  | $FBAF
    .byte $3E ; |  XXXXX | $FBB0
    .byte $43 ; | X    XX| $FBB1
    .byte $45 ; | X   X X| $FBB2
    .byte $49 ; | X  X  X| $FBB3
    .byte $41 ; | X     X| $FBB4
    .byte $41 ; | X     X| $FBB5
    .byte $3E ; |  XXXXX | $FBB6
    .byte $1C ; |   XXX  | $FBB7
    .byte $3E ; |  XXXXX | $FBB8
    .byte $49 ; | X  X  X| $FBB9
    .byte $49 ; | X  X  X| $FBBA
    .byte $49 ; | X  X  X| $FBBB
    .byte $41 ; | X     X| $FBBC
    .byte $41 ; | X     X| $FBBD
    .byte $3E ; |  XXXXX | $FBBE
    .byte $1C ; |   XXX  | $FBBF
    .byte $3E ; |  XXXXX | $FBC0
    .byte $61 ; | XX    X| $FBC1
    .byte $51 ; | X X   X| $FBC2
    .byte $49 ; | X  X  X| $FBC3
    .byte $41 ; | X     X| $FBC4
    .byte $41 ; | X     X| $FBC5
    .byte $3E ; |  XXXXX | $FBC6
    .byte $1C ; |   XXX  | $FBC7
    .byte $3E ; |  XXXXX | $FBC8
    .byte $41 ; | X     X| $FBC9
    .byte $41 ; | X     X| $FBCA
    .byte $79 ; | XXXX  X| $FBCB
    .byte $41 ; | X     X| $FBCC
    .byte $41 ; | X     X| $FBCD
    .byte $3E ; |  XXXXX | $FBCE
    .byte $1C ; |   XXX  | $FBCF
    .byte $3E ; |  XXXXX | $FBD0
    .byte $41 ; | X     X| $FBD1
    .byte $41 ; | X     X| $FBD2
    .byte $49 ; | X  X  X| $FBD3
    .byte $51 ; | X X   X| $FBD4
    .byte $61 ; | XX    X| $FBD5
    .byte $3E ; |  XXXXX | $FBD6
    .byte $1C ; |   XXX  | $FBD7
CopyrightFour:
    .byte $49 ; | X  X  X| $FBD8
    .byte $49 ; | X  X  X| $FBD9
    .byte $49 ; | X  X  X| $FBDA
    .byte $C9 ; |XX  X  X| $FBDB
    .byte $49 ; | X  X  X| $FBDC
    .byte $49 ; | X  X  X| $FBDD
    .byte $BE ; |X XXXXX | $FBDE
    .byte $00 ; |        | $FBDF
CopyrightFive:
    .byte $55 ; | X X X X| $FBE0
    .byte $55 ; | X X X X| $FBE1
    .byte $55 ; | X X X X| $FBE2
    .byte $D9 ; |XX XX  X| $FBE3
    .byte $55 ; | X X X X| $FBE4
    .byte $55 ; | X X X X| $FBE5
    .byte $99 ; |X  XX  X| $FBE6
    .byte $00 ; |        | $FBE7
LFBE8:
    .byte $14 ; |   X X  | $FBE8
    .byte $14 ; |   X X  | $FBE9
    .byte $14 ; |   X X  | $FBEA
    .byte $0F ; |    XXXX| $FBEB
    .byte $10 ; |   X    | $FBEC
    .byte $12 ; |   X  X | $FBED
    .byte $0B ; |    X XX| $FBEE
    .byte $0B ; |    X XX| $FBEF
    .byte $0B ; |    X XX| $FBF0
    .byte $10 ; |   X    | $FBF1
    .byte $12 ; |   X  X | $FBF2
    .byte $14 ; |   X X  | $FBF3
    .byte $17 ; |   X XXX| $FBF4
    .byte $17 ; |   X XXX| $FBF5
    .byte $17 ; |   X XXX| $FBF6
    .byte $17 ; |   X XXX| $FBF7
    .byte $18 ; |   XX   | $FBF8
    .byte $1B ; |   XX XX| $FBF9
    .byte $0F ; |    XXXX| $FBFA
    .byte $0F ; |    XXXX| $FBFB
    .byte $0F ; |    XXXX| $FBFC
    .byte $14 ; |   X X  | $FBFD
    .byte $17 ; |   X XXX| $FBFE
    .byte $18 ; |   XX   | $FBFF
    .byte $14 ; |   X X  | $FC00
    .byte $3C ; |  XXXX  | $FC01
    .byte $7E ; | XXXXXX | $FC02
    .byte $00 ; |        | $FC03
    .byte $30 ; |  XX    | $FC04
    .byte $38 ; |  XXX   | $FC05
    .byte $3C ; |  XXXX  | $FC06
    .byte $3E ; |  XXXXX | $FC07
    .byte $3F ; |  XXXXXX| $FC08
    .byte $7F ; | XXXXXXX| $FC09
    .byte $7F ; | XXXXXXX| $FC0A
    .byte $7F ; | XXXXXXX| $FC0B
    .byte $11 ; |   X   X| $FC0C
    .byte $11 ; |   X   X| $FC0D
    .byte $33 ; |  XX  XX| $FC0E
    .byte $00 ; |        | $FC0F
    .byte $14 ; |   X X  | $FC10
    .byte $3C ; |  XXXX  | $FC11
    .byte $7E ; | XXXXXX | $FC12
    .byte $00 ; |        | $FC13
    .byte $30 ; |  XX    | $FC14
    .byte $38 ; |  XXX   | $FC15
    .byte $3C ; |  XXXX  | $FC16
    .byte $3E ; |  XXXXX | $FC17
    .byte $3F ; |  XXXXXX| $FC18
    .byte $7F ; | XXXXXXX| $FC19
    .byte $7F ; | XXXXXXX| $FC1A
    .byte $7F ; | XXXXXXX| $FC1B
    .byte $22 ; |  X   X | $FC1C
    .byte $22 ; |  X   X | $FC1D
    .byte $66 ; | XX  XX | $FC1E
    .byte $00 ; |        | $FC1F
    .byte $14 ; |   X X  | $FC20
    .byte $3C ; |  XXXX  | $FC21
    .byte $7E ; | XXXXXX | $FC22
    .byte $00 ; |        | $FC23
    .byte $30 ; |  XX    | $FC24
    .byte $38 ; |  XXX   | $FC25
    .byte $3C ; |  XXXX  | $FC26
    .byte $3E ; |  XXXXX | $FC27
    .byte $3F ; |  XXXXXX| $FC28
    .byte $7F ; | XXXXXXX| $FC29
    .byte $7F ; | XXXXXXX| $FC2A
    .byte $7F ; | XXXXXXX| $FC2B
    .byte $44 ; | X   X  | $FC2C
    .byte $44 ; | X   X  | $FC2D
    .byte $CC ; |XX  XX  | $FC2E
    .byte $00 ; |        | $FC2F
    .byte $14 ; |   X X  | $FC30
    .byte $3C ; |  XXXX  | $FC31
    .byte $7E ; | XXXXXX | $FC32
    .byte $00 ; |        | $FC33
    .byte $30 ; |  XX    | $FC34
    .byte $38 ; |  XXX   | $FC35
    .byte $3C ; |  XXXX  | $FC36
    .byte $3E ; |  XXXXX | $FC37
    .byte $3F ; |  XXXXXX| $FC38
    .byte $7F ; | XXXXXXX| $FC39
    .byte $7F ; | XXXXXXX| $FC3A
    .byte $7F ; | XXXXXXX| $FC3B
    .byte $08 ; |    X   | $FC3C
    .byte $08 ; |    X   | $FC3D
    .byte $18 ; |   XX   | $FC3E
    .byte $00 ; |        | $FC3F
LFC40:
    .byte $00 ; |        | $FC40
    .byte $10 ; |   X    | $FC41
    .byte $20 ; |  X     | $FC42
    .byte $30 ; |  XX    | $FC43
    .byte $7C ; | XXXXX  | $FC44
    .byte $0F ; |    XXXX| $FC45
    .byte $7C ; | XXXXX  | $FC46
    .byte $00 ; |        | $FC47
    .byte $0A ; |    X X | $FC48
    .byte $02 ; |      X | $FC49
    .byte $04 ; |     X  | $FC4A
    .byte $06 ; |     XX | $FC4B
    .byte $08 ; |    X   | $FC4C
    .byte $0A ; |    X X | $FC4D
    .byte $08 ; |    X   | $FC4E
    .byte $06 ; |     XX | $FC4F
    .byte $98 ; |X  XX   | $FC50
    .byte $98 ; |X  XX   | $FC51
    .byte $9E ; |X  XXXX | $FC52
    .byte $9E ; |X  XXXX | $FC53
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
    .byte $08 ; |    X   | $FC5F
    .byte $1C ; |   XXX  | $FC60
    .byte $3C ; |  XXXX  | $FC61
    .byte $3E ; |  XXXXX | $FC62
    .byte $7F ; | XXXXXXX| $FC63
    .byte $FF ; |XXXXXXXX| $FC64
    .byte $FF ; |XXXXXXXX| $FC65
    .byte $FF ; |XXXXXXXX| $FC66
    .byte $FF ; |XXXXXXXX| $FC67
    .byte $FF ; |XXXXXXXX| $FC68
    .byte $FF ; |XXXXXXXX| $FC69
    .byte $FF ; |XXXXXXXX| $FC6A
    .byte $FF ; |XXXXXXXX| $FC6B
    .byte $3E ; |  XXXXX | $FC6C
    .byte $3C ; |  XXXX  | $FC6D
    .byte $3A ; |  XXX X | $FC6E
    .byte $38 ; |  XXX   | $FC6F
    .byte $36 ; |  XX XX | $FC70
    .byte $34 ; |  XX X  | $FC71
    .byte $32 ; |  XX  X | $FC72
    .byte $20 ; |  X     | $FC73
    .byte $10 ; |   X    | $FC74
LFC75:
    .byte $00 ; |        | $FC75
    .byte $00 ; |        | $FC76
    .byte $00 ; |        | $FC77
    .byte $00 ; |        | $FC78
    .byte $08 ; |    X   | $FC79
    .byte $00 ; |        | $FC7A
    .byte $02 ; |      X | $FC7B
    .byte $0A ; |    X X | $FC7C
    .byte $0C ; |    XX  | $FC7D
    .byte $0E ; |    XXX | $FC7E
    .byte $01 ; |       X| $FC7F
    .byte $03 ; |      XX| $FC80
    .byte $04 ; |     X  | $FC81
    .byte $06 ; |     XX | $FC82
    .byte $05 ; |     X X| $FC83
    .byte $07 ; |     XXX| $FC84
    .byte $0D ; |    XX X| $FC85
    .byte $0F ; |    XXXX| $FC86
    .byte $0B ; |    X XX| $FC87
LFC88:
    .word LF6E1-1        ; $FC88
    .word LF833-1        ; $FC8A
    .word LF83E-1        ; $FC8C
    .word LF6AF-1        ; $FC8E
    .word LF728-1        ; $FC90
    .word LF663-1        ; $FC92
    .word LF7A8-1        ; $FC94
    .word LF53F-1        ; $FC96
    .word LF7E0-1        ; $FC98
    .word LF535-1        ; $FC9A
    .word LF59D-1        ; $FC9C
    .word LF638-1        ; $FC9E
    .word LF62A-1        ; $FCA0
LFCA2:
    .byte $1A ; |   XX X | $FCA2
    .byte $38 ; |  XXX   | $FCA3
    .byte $09 ; |    X  X| $FCA4
    .byte $26 ; |  X  XX | $FCA5
LFCA6:
    .byte $26 ; |  X  XX | $FCA6
    .byte $46 ; | X   XX | $FCA7
    .byte $1A ; |   XX X | $FCA8
    .byte $38 ; |  XXX   | $FCA9
LFCAA:
    .byte $04 ; |     X  | $FCAA
    .byte $11 ; |   X   X| $FCAB
    .byte $10 ; |   X    | $FCAC
    .byte $12 ; |   X  X | $FCAD
LFCAE:
    .byte $54 ; | X X X  | $FCAE
    .byte $FC ; |XXXXXX  | $FCAF
    .byte $5F ; | X XXXXX| $FCB0
    .byte $FE ; |XXXXXXX | $FCB1
    .byte $7F ; | XXXXXXX| $FCB2
    .byte $FA ; |XXXXX X | $FCB3
    .byte $3F ; |  XXXXXX| $FCB4
    .byte $2A ; |  X X X | $FCB5
    .byte $00 ; |        | $FCB6
LFCB7:
    .byte $54 ; | X X X  | $FCB7
    .byte $5F ; | X XXXXX| $FCB8
    .byte $FC ; |XXXXXX  | $FCB9
    .byte $7F ; | XXXXXXX| $FCBA
    .byte $FE ; |XXXXXXX | $FCBB
    .byte $3F ; |  XXXXXX| $FCBC
    .byte $FA ; |XXXXX X | $FCBD
    .byte $2A ; |  X X X | $FCBE
    .byte $00 ; |        | $FCBF
LFCC0:
    .byte $2A ; |  X X X | $FCC0
    .byte $FA ; |XXXXX X | $FCC1
    .byte $3F ; |  XXXXXX| $FCC2
    .byte $FE ; |XXXXXXX | $FCC3
    .byte $7F ; | XXXXXXX| $FCC4
    .byte $FA ; |XXXXX X | $FCC5
    .byte $5F ; | X XXXXX| $FCC6
    .byte $54 ; | X X X  | $FCC7
    .byte $00 ; |        | $FCC8
LFCC9:
    .byte $2A ; |  X X X | $FCC9
    .byte $3F ; |  XXXXXX| $FCCA
    .byte $FA ; |XXXXX X | $FCCB
    .byte $7F ; | XXXXXXX| $FCCC
    .byte $FE ; |XXXXXXX | $FCCD
    .byte $5F ; | X XXXXX| $FCCE
    .byte $FC ; |XXXXXX  | $FCCF
    .byte $54 ; | X X X  | $FCD0
    .byte $00 ; |        | $FCD1
LFCD2:
    .byte $8B ; |X   X XX| $FCD2
    .byte $8A ; |X   X X | $FCD3
    .byte $86 ; |X    XX | $FCD4
    .byte $87 ; |X    XXX| $FCD5
    .byte $85 ; |X    X X| $FCD6
    .byte $89 ; |X   X  X| $FCD7
LFCD8:
    .byte $03 ; |      XX| $FCD8
    .byte $01 ; |       X| $FCD9
    .byte $00 ; |        | $FCDA
    .byte $01 ; |       X| $FCDB
LFCDC:
    .byte $03 ; |      XX| $FCDC
    .byte $02 ; |      X | $FCDD
    .byte $01 ; |       X| $FCDE
    .byte $03 ; |      XX| $FCDF
    .byte $02 ; |      X | $FCE0
    .byte $03 ; |      XX| $FCE1
LFCE2:
    .byte $01 ; |       X| $FCE2
    .byte $02 ; |      X | $FCE3
    .byte $04 ; |     X  | $FCE4
    .byte $08 ; |    X   | $FCE5
    .byte $10 ; |   X    | $FCE6
    .byte $20 ; |  X     | $FCE7
    .byte $40 ; | X      | $FCE8
    .byte $80 ; |X       | $FCE9

LFCEA:
    ror                          ; 2
    bcs    LFCEF                 ; 2³
    dec    ram_CE,X              ; 6
LFCEF:
    ror                          ; 2
    bcs    LFCF4                 ; 2³
    inc    ram_CE,X              ; 6
LFCF4:
    ror                          ; 2
    bcs    LFCF9                 ; 2³
    dec    ram_C8,X              ; 6
LFCF9:
    ror                          ; 2
    bcs    LFCFE                 ; 2³
    inc    ram_C8,X              ; 6
LFCFE:
    rts                          ; 6

    .byte $00 ; |        | $FCFF

    .byte $F2 ; |XXXX  X | $FD00
    .byte $40 ; | X      | $FD01
    .byte $F2 ; |XXXX  X | $FD02
    .byte $C0 ; |XX      | $FD03
    .byte $12 ; |   X  X | $FD04
    .byte $10 ; |   X    | $FD05
    .byte $F2 ; |XXXX  X | $FD06
    .byte $00 ; |        | $FD07
    .byte $12 ; |   X  X | $FD08
    .byte $20 ; |  X     | $FD09
    .byte $02 ; |      X | $FD0A
    .byte $B0 ; |X XX    | $FD0B
    .byte $F2 ; |XXXX  X | $FD0C
    .byte $30 ; |  XX    | $FD0D
    .byte $12 ; |   X  X | $FD0E
    .byte $00 ; |        | $FD0F
    .byte $F2 ; |XXXX  X | $FD10
    .byte $40 ; | X      | $FD11
    .byte $F2 ; |XXXX  X | $FD12
    .byte $D0 ; |XX X    | $FD13
    .byte $12 ; |   X  X | $FD14
    .byte $10 ; |   X    | $FD15
    .byte $02 ; |      X | $FD16
    .byte $00 ; |        | $FD17
    .byte $02 ; |      X | $FD18
    .byte $30 ; |  XX    | $FD19
    .byte $12 ; |   X  X | $FD1A
    .byte $B0 ; |X XX    | $FD1B
    .byte $02 ; |      X | $FD1C
    .byte $20 ; |  X     | $FD1D
    .byte $12 ; |   X  X | $FD1E
    .byte $00 ; |        | $FD1F
    .byte $FF ; |XXXXXXXX| $FD20
    .byte $FF ; |XXXXXXXX| $FD21
    .byte $FC ; |XXXXXX  | $FD22
    .byte $F0 ; |XXXX    | $FD23
    .byte $E0 ; |XXX     | $FD24
    .byte $E0 ; |XXX     | $FD25
    .byte $C0 ; |XX      | $FD26
    .byte $80 ; |X       | $FD27
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
    .byte $80 ; |X       | $FD41
    .byte $80 ; |X       | $FD42
    .byte $C0 ; |XX      | $FD43
    .byte $E0 ; |XXX     | $FD44
    .byte $E0 ; |XXX     | $FD45
    .byte $F0 ; |XXXX    | $FD46
    .byte $FE ; |XXXXXXX | $FD47
    .byte $FF ; |XXXXXXXX| $FD48
    .byte $FF ; |XXXXXXXX| $FD49
    .byte $FF ; |XXXXXXXX| $FD4A
    .byte $FF ; |XXXXXXXX| $FD4B
    .byte $FC ; |XXXXXX  | $FD4C
    .byte $F0 ; |XXXX    | $FD4D
    .byte $E0 ; |XXX     | $FD4E
    .byte $E0 ; |XXX     | $FD4F
    .byte $C0 ; |XX      | $FD50
    .byte $80 ; |X       | $FD51
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
    .byte $C0 ; |XX      | $FD5D
    .byte $F0 ; |XXXX    | $FD5E
    .byte $F8 ; |XXXXX   | $FD5F
    .byte $FE ; |XXXXXXX | $FD60
    .byte $FE ; |XXXXXXX | $FD61
    .byte $F8 ; |XXXXX   | $FD62
    .byte $F0 ; |XXXX    | $FD63
    .byte $E0 ; |XXX     | $FD64
    .byte $C0 ; |XX      | $FD65
    .byte $80 ; |X       | $FD66
    .byte $00 ; |        | $FD67
    .byte $00 ; |        | $FD68
    .byte $00 ; |        | $FD69
    .byte $00 ; |        | $FD6A
    .byte $00 ; |        | $FD6B
    .byte $00 ; |        | $FD6C
    .byte $00 ; |        | $FD6D
    .byte $00 ; |        | $FD6E
    .byte $00 ; |        | $FD6F
    .byte $02 ; |      X | $FD70
    .byte $07 ; |     XXX| $FD71
    .byte $07 ; |     XXX| $FD72
    .byte $0F ; |    XXXX| $FD73
    .byte $0F ; |    XXXX| $FD74
    .byte $0F ; |    XXXX| $FD75
    .byte $07 ; |     XXX| $FD76
    .byte $07 ; |     XXX| $FD77
    .byte $02 ; |      X | $FD78
    .byte $00 ; |        | $FD79
    .byte $00 ; |        | $FD7A
    .byte $00 ; |        | $FD7B
    .byte $00 ; |        | $FD7C
    .byte $00 ; |        | $FD7D
    .byte $00 ; |        | $FD7E
    .byte $00 ; |        | $FD7F
    .byte $00 ; |        | $FD80
    .byte $04 ; |     X  | $FD81
    .byte $0E ; |    XXX | $FD82
    .byte $0E ; |    XXX | $FD83
    .byte $0F ; |    XXXX| $FD84
    .byte $0E ; |    XXX | $FD85
    .byte $06 ; |     XX | $FD86
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
    .byte $02 ; |      X | $FD91
    .byte $07 ; |     XXX| $FD92
    .byte $07 ; |     XXX| $FD93
    .byte $0F ; |    XXXX| $FD94
    .byte $1F ; |   XXXXX| $FD95
    .byte $0F ; |    XXXX| $FD96
    .byte $07 ; |     XXX| $FD97
    .byte $07 ; |     XXX| $FD98
    .byte $02 ; |      X | $FD99
    .byte $00 ; |        | $FD9A
    .byte $00 ; |        | $FD9B
    .byte $00 ; |        | $FD9C
    .byte $00 ; |        | $FD9D
    .byte $00 ; |        | $FD9E
    .byte $00 ; |        | $FD9F
    .byte $00 ; |        | $FDA0
    .byte $00 ; |        | $FDA1
    .byte $00 ; |        | $FDA2
    .byte $00 ; |        | $FDA3
    .byte $00 ; |        | $FDA4
    .byte $00 ; |        | $FDA5
    .byte $01 ; |       X| $FDA6
    .byte $03 ; |      XX| $FDA7
    .byte $01 ; |       X| $FDA8
    .byte $00 ; |        | $FDA9
    .byte $00 ; |        | $FDAA
    .byte $00 ; |        | $FDAB
    .byte $00 ; |        | $FDAC
    .byte $00 ; |        | $FDAD
    .byte $80 ; |X       | $FDAE
    .byte $80 ; |X       | $FDAF
    .byte $C0 ; |XX      | $FDB0
    .byte $E0 ; |XXX     | $FDB1
    .byte $F8 ; |XXXXX   | $FDB2
    .byte $E0 ; |XXX     | $FDB3
    .byte $C0 ; |XX      | $FDB4
    .byte $80 ; |X       | $FDB5
    .byte $80 ; |X       | $FDB6
    .byte $00 ; |        | $FDB7
    .byte $00 ; |        | $FDB8
    .byte $00 ; |        | $FDB9
    .byte $C0 ; |XX      | $FDBA
    .byte $E0 ; |XXX     | $FDBB
    .byte $E0 ; |XXX     | $FDBC
    .byte $C0 ; |XX      | $FDBD
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
    .byte $80 ; |X       | $FDC8
    .byte $80 ; |X       | $FDC9
    .byte $80 ; |X       | $FDCA
    .byte $80 ; |X       | $FDCB
    .byte $80 ; |X       | $FDCC
    .byte $80 ; |X       | $FDCD
    .byte $00 ; |        | $FDCE
    .byte $00 ; |        | $FDCF
    .byte $00 ; |        | $FDD0
    .byte $00 ; |        | $FDD1
    .byte $00 ; |        | $FDD2
    .byte $00 ; |        | $FDD3
    .byte $00 ; |        | $FDD4
    .byte $00 ; |        | $FDD5
    .byte $00 ; |        | $FDD6
    .byte $00 ; |        | $FDD7
    .byte $C0 ; |XX      | $FDD8
    .byte $E0 ; |XXX     | $FDD9
    .byte $E0 ; |XXX     | $FDDA
    .byte $C0 ; |XX      | $FDDB
    .byte $00 ; |        | $FDDC
    .byte $00 ; |        | $FDDD
    .byte $00 ; |        | $FDDE
    .byte $00 ; |        | $FDDF
    .byte $22 ; |  X   X | $FDE0
    .byte $41 ; | X     X| $FDE1
    .byte $08 ; |    X   | $FDE2
    .byte $14 ; |   X X  | $FDE3
    .byte $08 ; |    X   | $FDE4
    .byte $41 ; | X     X| $FDE5
    .byte $22 ; |  X   X | $FDE6
    .byte $00 ; |        | $FDE7
    .byte $41 ; | X     X| $FDE8
    .byte $08 ; |    X   | $FDE9
    .byte $14 ; |   X X  | $FDEA
    .byte $2A ; |  X X X | $FDEB
    .byte $14 ; |   X X  | $FDEC
    .byte $08 ; |    X   | $FDED
    .byte $41 ; | X     X| $FDEE
    .byte $00 ; |        | $FDEF
    .byte $08 ; |    X   | $FDF0
    .byte $14 ; |   X X  | $FDF1
    .byte $3E ; |  XXXXX | $FDF2
    .byte $55 ; | X X X X| $FDF3
    .byte $3E ; |  XXXXX | $FDF4
    .byte $14 ; |   X X  | $FDF5
    .byte $08 ; |    X   | $FDF6
    .byte $00 ; |        | $FDF7
    .byte $14 ; |   X X  | $FDF8
    .byte $3E ; |  XXXXX | $FDF9
    .byte $63 ; | XX   XX| $FDFA
    .byte $2A ; |  X X X | $FDFB
    .byte $63 ; | XX   XX| $FDFC
    .byte $3E ; |  XXXXX | $FDFD
    .byte $14 ; |   X X  | $FDFE
    .byte $00 ; |        | $FDFF
    .byte $07 ; |     XXX| $FE00
    .byte $07 ; |     XXX| $FE01
    .byte $07 ; |     XXX| $FE02
    .byte $03 ; |      XX| $FE03
    .byte $03 ; |      XX| $FE04
    .byte $03 ; |      XX| $FE05
    .byte $01 ; |       X| $FE06
    .byte $00 ; |        | $FE07
    .byte $00 ; |        | $FE08
    .byte $00 ; |        | $FE09
    .byte $00 ; |        | $FE0A
    .byte $00 ; |        | $FE0B
    .byte $00 ; |        | $FE0C
    .byte $00 ; |        | $FE0D
    .byte $00 ; |        | $FE0E
    .byte $30 ; |  XX    | $FE0F
    .byte $78 ; | XXXX   | $FE10
    .byte $7C ; | XXXXX  | $FE11
    .byte $3C ; |  XXXX  | $FE12
    .byte $3C ; |  XXXX  | $FE13
    .byte $18 ; |   XX   | $FE14
    .byte $08 ; |    X   | $FE15
    .byte $00 ; |        | $FE16
    .byte $00 ; |        | $FE17
    .byte $00 ; |        | $FE18
    .byte $00 ; |        | $FE19
    .byte $00 ; |        | $FE1A
    .byte $00 ; |        | $FE1B
    .byte $00 ; |        | $FE1C
    .byte $00 ; |        | $FE1D
    .byte $00 ; |        | $FE1E
    .byte $00 ; |        | $FE1F
    .byte $00 ; |        | $FE20
    .byte $00 ; |        | $FE21
    .byte $00 ; |        | $FE22
    .byte $00 ; |        | $FE23
    .byte $00 ; |        | $FE24
    .byte $00 ; |        | $FE25
    .byte $00 ; |        | $FE26
    .byte $00 ; |        | $FE27
    .byte $00 ; |        | $FE28
    .byte $00 ; |        | $FE29
    .byte $00 ; |        | $FE2A
    .byte $00 ; |        | $FE2B
    .byte $00 ; |        | $FE2C
    .byte $00 ; |        | $FE2D
    .byte $01 ; |       X| $FE2E
    .byte $0F ; |    XXXX| $FE2F
    .byte $01 ; |       X| $FE30
    .byte $00 ; |        | $FE31
    .byte $00 ; |        | $FE32
    .byte $00 ; |        | $FE33
    .byte $00 ; |        | $FE34
    .byte $00 ; |        | $FE35
    .byte $00 ; |        | $FE36
    .byte $00 ; |        | $FE37
    .byte $80 ; |X       | $FE38
    .byte $C0 ; |XX      | $FE39
    .byte $E0 ; |XXX     | $FE3A
    .byte $F8 ; |XXXXX   | $FE3B
    .byte $FC ; |XXXXXX  | $FE3C
    .byte $FE ; |XXXXXXX | $FE3D
    .byte $FC ; |XXXXXX  | $FE3E
    .byte $F0 ; |XXXX    | $FE3F
    .byte $E0 ; |XXX     | $FE40
    .byte $C0 ; |XX      | $FE41
    .byte $C0 ; |XX      | $FE42
    .byte $80 ; |X       | $FE43
    .byte $80 ; |X       | $FE44
    .byte $00 ; |        | $FE45
    .byte $00 ; |        | $FE46
    .byte $00 ; |        | $FE47
    .byte $00 ; |        | $FE48
    .byte $00 ; |        | $FE49
    .byte $00 ; |        | $FE4A
    .byte $00 ; |        | $FE4B
    .byte $00 ; |        | $FE4C
    .byte $00 ; |        | $FE4D
    .byte $00 ; |        | $FE4E
    .byte $00 ; |        | $FE4F
    .byte $03 ; |      XX| $FE50
    .byte $07 ; |     XXX| $FE51
    .byte $03 ; |      XX| $FE52
    .byte $01 ; |       X| $FE53
    .byte $00 ; |        | $FE54
    .byte $00 ; |        | $FE55
    .byte $00 ; |        | $FE56
    .byte $00 ; |        | $FE57
    .byte $00 ; |        | $FE58
    .byte $80 ; |X       | $FE59
    .byte $E0 ; |XXX     | $FE5A
    .byte $F8 ; |XXXXX   | $FE5B
    .byte $F8 ; |XXXXX   | $FE5C
    .byte $F8 ; |XXXXX   | $FE5D
    .byte $F8 ; |XXXXX   | $FE5E
    .byte $F0 ; |XXXX    | $FE5F
    .byte $C0 ; |XX      | $FE60
    .byte $80 ; |X       | $FE61
    .byte $00 ; |        | $FE62
    .byte $00 ; |        | $FE63
    .byte $00 ; |        | $FE64
    .byte $00 ; |        | $FE65
    .byte $00 ; |        | $FE66
    .byte $00 ; |        | $FE67
    .byte $00 ; |        | $FE68
    .byte $00 ; |        | $FE69
    .byte $03 ; |      XX| $FE6A
    .byte $0F ; |    XXXX| $FE6B
    .byte $1F ; |   XXXXX| $FE6C
    .byte $3F ; |  XXXXXX| $FE6D
    .byte $3E ; |  XXXXX | $FE6E
    .byte $3C ; |  XXXX  | $FE6F
    .byte $38 ; |  XXX   | $FE70
    .byte $30 ; |  XX    | $FE71
    .byte $00 ; |        | $FE72
    .byte $00 ; |        | $FE73
    .byte $00 ; |        | $FE74
    .byte $00 ; |        | $FE75
    .byte $00 ; |        | $FE76
    .byte $00 ; |        | $FE77
    .byte $07 ; |     XXX| $FE78
    .byte $07 ; |     XXX| $FE79
    .byte $07 ; |     XXX| $FE7A
    .byte $03 ; |      XX| $FE7B
    .byte $03 ; |      XX| $FE7C
    .byte $03 ; |      XX| $FE7D
    .byte $01 ; |       X| $FE7E
    .byte $00 ; |        | $FE7F
    .byte $00 ; |        | $FE80
    .byte $00 ; |        | $FE81
    .byte $00 ; |        | $FE82
    .byte $00 ; |        | $FE83
    .byte $00 ; |        | $FE84
    .byte $80 ; |X       | $FE85
    .byte $80 ; |X       | $FE86
    .byte $C0 ; |XX      | $FE87
    .byte $E0 ; |XXX     | $FE88
    .byte $E0 ; |XXX     | $FE89
    .byte $C0 ; |XX      | $FE8A
    .byte $C0 ; |XX      | $FE8B
    .byte $80 ; |X       | $FE8C
    .byte $00 ; |        | $FE8D
    .byte $00 ; |        | $FE8E
    .byte $00 ; |        | $FE8F
    .byte $00 ; |        | $FE90
    .byte $00 ; |        | $FE91
    .byte $00 ; |        | $FE92
    .byte $00 ; |        | $FE93
    .byte $00 ; |        | $FE94
    .byte $00 ; |        | $FE95
    .byte $00 ; |        | $FE96
    .byte $30 ; |  XX    | $FE97
    .byte $38 ; |  XXX   | $FE98
    .byte $1C ; |   XXX  | $FE99
    .byte $1E ; |   XXXX | $FE9A
    .byte $0E ; |    XXX | $FE9B
    .byte $0C ; |    XX  | $FE9C
    .byte $0C ; |    XX  | $FE9D
    .byte $00 ; |        | $FE9E
    .byte $00 ; |        | $FE9F
    .byte $00 ; |        | $FEA0
    .byte $80 ; |X       | $FEA1
    .byte $80 ; |X       | $FEA2
    .byte $C0 ; |XX      | $FEA3
    .byte $F0 ; |XXXX    | $FEA4
    .byte $FC ; |XXXXXX  | $FEA5
    .byte $FF ; |XXXXXXXX| $FEA6
    .byte $FF ; |XXXXXXXX| $FEA7
    .byte $FF ; |XXXXXXXX| $FEA8
    .byte $FF ; |XXXXXXXX| $FEA9
    .byte $FE ; |XXXXXXX | $FEAA
    .byte $FC ; |XXXXXX  | $FEAB
    .byte $F8 ; |XXXXX   | $FEAC
    .byte $F0 ; |XXXX    | $FEAD
    .byte $E0 ; |XXX     | $FEAE
    .byte $00 ; |        | $FEAF
    .byte $00 ; |        | $FEB0
    .byte $00 ; |        | $FEB1
    .byte $00 ; |        | $FEB2
    .byte $00 ; |        | $FEB3
    .byte $00 ; |        | $FEB4
    .byte $00 ; |        | $FEB5
    .byte $00 ; |        | $FEB6
    .byte $00 ; |        | $FEB7
    .byte $00 ; |        | $FEB8
    .byte $80 ; |X       | $FEB9
    .byte $E0 ; |XXX     | $FEBA
    .byte $F0 ; |XXXX    | $FEBB
    .byte $E0 ; |XXX     | $FEBC
    .byte $80 ; |X       | $FEBD
    .byte $00 ; |        | $FEBE
    .byte $00 ; |        | $FEBF
    .byte $00 ; |        | $FEC0
    .byte $00 ; |        | $FEC1
    .byte $00 ; |        | $FEC2
    .byte $00 ; |        | $FEC3
    .byte $00 ; |        | $FEC4
    .byte $00 ; |        | $FEC5
    .byte $00 ; |        | $FEC6
    .byte $03 ; |      XX| $FEC7
    .byte $07 ; |     XXX| $FEC8
    .byte $03 ; |      XX| $FEC9
    .byte $03 ; |      XX| $FECA
    .byte $01 ; |       X| $FECB
    .byte $01 ; |       X| $FECC
    .byte $00 ; |        | $FECD
    .byte $00 ; |        | $FECE
    .byte $00 ; |        | $FECF
    .byte $80 ; |X       | $FED0
    .byte $C0 ; |XX      | $FED1
    .byte $F0 ; |XXXX    | $FED2
    .byte $F0 ; |XXXX    | $FED3
    .byte $E0 ; |XXX     | $FED4
    .byte $E0 ; |XXX     | $FED5
    .byte $C0 ; |XX      | $FED6
    .byte $C0 ; |XX      | $FED7
    .byte $80 ; |X       | $FED8
    .byte $80 ; |X       | $FED9
    .byte $00 ; |        | $FEDA
    .byte $00 ; |        | $FEDB
    .byte $00 ; |        | $FEDC
    .byte $00 ; |        | $FEDD
    .byte $00 ; |        | $FEDE
    .byte $00 ; |        | $FEDF
    .byte $00 ; |        | $FEE0
    .byte $03 ; |      XX| $FEE1
    .byte $07 ; |     XXX| $FEE2
    .byte $07 ; |     XXX| $FEE3
    .byte $03 ; |      XX| $FEE4
    .byte $01 ; |       X| $FEE5
    .byte $00 ; |        | $FEE6
    .byte $00 ; |        | $FEE7
    .byte $C0 ; |XX      | $FEE8
    .byte $E0 ; |XXX     | $FEE9
    .byte $F0 ; |XXXX    | $FEEA
    .byte $F8 ; |XXXXX   | $FEEB
    .byte $F8 ; |XXXXX   | $FEEC
    .byte $FC ; |XXXXXX  | $FEED
    .byte $FC ; |XXXXXX  | $FEEE
    .byte $FC ; |XXXXXX  | $FEEF
LFEF0:
    .byte $3C ; |  XXXX  | $FEF0
    .byte $3C ; |  XXXX  | $FEF1
    .byte $7E ; | XXXXXX | $FEF2
    .byte $FF ; |XXXXXXXX| $FEF3

LFEF4:
    lda    ram_8C,X              ; 4
    bmi    LFEF9                 ; 2³
    rts                          ; 6

LFEF9:
    jsr    LFCEA                 ; 6
    jsr    LF8E1                 ; 6
    rts                          ; 6

    .byte $80 ; |X       | $FF00
LFF01:
    .byte $00 ; |        | $FF01
    .byte $07 ; |     XXX| $FF02
    .byte $04 ; |     X  | $FF03
    .byte $77 ; | XXX XXX| $FF04
    .byte $71 ; | XXX   X| $FF05
    .byte $75 ; | XXX X X| $FF06
    .byte $57 ; | X X XXX| $FF07
    .byte $50 ; | X X    | $FF08
    .byte $00 ; |        | $FF09
    .byte $D6 ; |XX X XX | $FF0A
    .byte $1C ; |   XXX  | $FF0B
    .byte $36 ; |  XX XX | $FF0C
    .byte $1C ; |   XXX  | $FF0D
    .byte $49 ; | X  X  X| $FF0E
    .byte $7F ; | XXXXXXX| $FF0F
    .byte $49 ; | X  X  X| $FF10
    .byte $1C ; |   XXX  | $FF11
    .byte $3E ; |  XXXXX | $FF12
    .byte $00 ; |        | $FF13
    .byte $B9 ; |X XXX  X| $FF14
    .byte $8A ; |X   X X | $FF15
    .byte $A1 ; |X X    X| $FF16
    .byte $81 ; |X      X| $FF17
    .byte $00 ; |        | $FF18
    .byte $00 ; |        | $FF19
    .byte $00 ; |        | $FF1A
    .byte $00 ; |        | $FF1B
    .byte $00 ; |        | $FF1C
    .byte $00 ; |        | $FF1D
    .byte $1C ; |   XXX  | $FF1E
    .byte $70 ; | XXX    | $FF1F
    .byte $07 ; |     XXX| $FF20
    .byte $70 ; | XXX    | $FF21
    .byte $0E ; |    XXX | $FF22
    .byte $00 ; |        | $FF23
    .byte $CF ; |XX  XXXX| $FF24
    .byte $A6 ; |X X  XX | $FF25
    .byte $00 ; |        | $FF26
    .byte $81 ; |X      X| $FF27
    .byte $77 ; | XXX XXX| $FF28
    .byte $36 ; |  XX XX | $FF29
    .byte $14 ; |   X X  | $FF2A
    .byte $22 ; |  X   X | $FF2B
    .byte $AE ; |X X XXX | $FF2C
    .byte $14 ; |   X X  | $FF2D
    .byte $36 ; |  XX XX | $FF2E
    .byte $77 ; | XXX XXX| $FF2F
    .byte $00 ; |        | $FF30
    .byte $BF ; |X XXXXXX| $FF31
    .byte $CE ; |XX  XXX | $FF32
    .byte $00 ; |        | $FF33
    .byte $EF ; |XXX XXXX| $FF34
    .byte $81 ; |X      X| $FF35
    .byte $00 ; |        | $FF36
    .byte $00 ; |        | $FF37
    .byte $00 ; |        | $FF38
    .byte $00 ; |        | $FF39
    .byte $00 ; |        | $FF3A
    .byte $00 ; |        | $FF3B
    .byte $68 ; | XX X   | $FF3C
    .byte $2F ; |  X XXXX| $FF3D
    .byte $0A ; |    X X | $FF3E
    .byte $0C ; |    XX  | $FF3F
    .byte $08 ; |    X   | $FF40
    .byte $00 ; |        | $FF41
    .byte $80 ; |X       | $FF42
    .byte $81 ; |X      X| $FF43
    .byte $00 ; |        | $FF44
    .byte $00 ; |        | $FF45
LFF46:
    .byte $07 ; |     XXX| $FF46
    .byte $01 ; |       X| $FF47
    .byte $57 ; | X X XXX| $FF48
    .byte $54 ; | X X X  | $FF49
    .byte $77 ; | XXX XXX| $FF4A
    .byte $50 ; | X X    | $FF4B
    .byte $50 ; | X X    | $FF4C
    .byte $00 ; |        | $FF4D
    .byte $00 ; |        | $FF4E
    .byte $00 ; |        | $FF4F
    .byte $00 ; |        | $FF50
    .byte $80 ; |X       | $FF51
    .byte $7E ; | XXXXXX | $FF52
    .byte $86 ; |X    XX | $FF53
    .byte $80 ; |X       | $FF54
    .byte $A6 ; |X X  XX | $FF55
    .byte $5A ; | X XX X | $FF56
    .byte $7E ; | XXXXXX | $FF57
    .byte $80 ; |X       | $FF58
    .byte $7F ; | XXXXXXX| $FF59
    .byte $00 ; |        | $FF5A
    .byte $B1 ; |X XX   X| $FF5B
    .byte $F9 ; |XXXXX  X| $FF5C
    .byte $F6 ; |XXXX XX | $FF5D
    .byte $06 ; |     XX | $FF5E
    .byte $1E ; |   XXXX | $FF5F
    .byte $12 ; |   X  X | $FF60
    .byte $1E ; |   XXXX | $FF61
    .byte $12 ; |   X  X | $FF62
    .byte $1E ; |   XXXX | $FF63
    .byte $7F ; | XXXXXXX| $FF64
    .byte $00 ; |        | $FF65
    .byte $B9 ; |X XXX  X| $FF66
    .byte $00 ; |        | $FF67
    .byte $D4 ; |XX X X  | $FF68
    .byte $00 ; |        | $FF69
    .byte $81 ; |X      X| $FF6A
    .byte $1C ; |   XXX  | $FF6B
    .byte $2A ; |  X X X | $FF6C
    .byte $55 ; | X X X X| $FF6D
    .byte $2A ; |  X X X | $FF6E
    .byte $14 ; |   X X  | $FF6F
    .byte $3E ; |  XXXXX | $FF70
    .byte $00 ; |        | $FF71
    .byte $C1 ; |XX     X| $FF72
    .byte $E6 ; |XXX  XX | $FF73
    .byte $00 ; |        | $FF74
    .byte $00 ; |        | $FF75
    .byte $00 ; |        | $FF76
    .byte $81 ; |X      X| $FF77
    .byte $7F ; | XXXXXXX| $FF78
    .byte $55 ; | X X X X| $FF79
    .byte $2A ; |  X X X | $FF7A
    .byte $55 ; | X X X X| $FF7B
    .byte $2A ; |  X X X | $FF7C
    .byte $3E ; |  XXXXX | $FF7D
    .byte $00 ; |        | $FF7E
    .byte $B9 ; |X XXX  X| $FF7F
    .byte $86 ; |X    XX | $FF80
    .byte $91 ; |X  X   X| $FF81
    .byte $81 ; |X      X| $FF82
    .byte $7E ; | XXXXXX | $FF83
    .byte $80 ; |X       | $FF84
    .byte $86 ; |X    XX | $FF85
    .byte $A6 ; |X X  XX | $FF86
    .byte $5A ; | X XX X | $FF87
    .byte $7E ; | XXXXXX | $FF88
    .byte $86 ; |X    XX | $FF89
    .byte $7F ; | XXXXXXX| $FF8A
    .byte $00 ; |        | $FF8B
    .byte $D6 ; |XX X XX | $FF8C
    .byte $77 ; | XXX XXX| $FF8D
    .byte $77 ; | XXX XXX| $FF8E
    .byte $80 ; |X       | $FF8F
    .byte $D6 ; |XX X XX | $FF90
    .byte $77 ; | XXX XXX| $FF91
    .byte $00 ; |        | $FF92
    .byte $C1 ; |XX     X| $FF93
    .byte $B6 ; |X XX XX | $FF94
    .byte $A1 ; |X X    X| $FF95
    .byte $81 ; |X      X| $FF96
    .byte $1C ; |   XXX  | $FF97
    .byte $2A ; |  X X X | $FF98
    .byte $55 ; | X X X X| $FF99
    .byte $2A ; |  X X X | $FF9A
    .byte $14 ; |   X X  | $FF9B
    .byte $3E ; |  XXXXX | $FF9C
    .byte $00 ; |        | $FF9D
    .byte $00 ; |        | $FF9E
    .byte $00 ; |        | $FF9F
    .byte $00 ; |        | $FFA0
    .byte $00 ; |        | $FFA1
    .byte $86 ; |X    XX | $FFA2
    .byte $70 ; | XXX    | $FFA3
    .byte $5F ; | X XXXXX| $FFA4
    .byte $72 ; | XXX  X | $FFA5
    .byte $05 ; |     X X| $FFA6
    .byte $00 ; |        | $FFA7
    .byte $C1 ; |XX     X| $FFA8
    .byte $00 ; |        | $FFA9
    .byte $81 ; |X      X| $FFAA
    .byte $84 ; |X    X  | $FFAB
    .byte $1F ; |   XXXXX| $FFAC
    .byte $89 ; |X   X  X| $FFAD
    .byte $F9 ; |XXXXX  X| $FFAE
    .byte $91 ; |X  X   X| $FFAF
    .byte $F9 ; |XXXXX  X| $FFB0
    .byte $18 ; |   XX   | $FFB1
    .byte $81 ; |X      X| $FFB2
    .byte $80 ; |X       | $FFB3
    .byte $1C ; |   XXX  | $FFB4
    .byte $1F ; |   XXXXX| $FFB5
    .byte $F1 ; |XXXX   X| $FFB6
    .byte $7F ; | XXXXXXX| $FFB7
    .byte $89 ; |X   X  X| $FFB8
    .byte $F9 ; |XXXXX  X| $FFB9
    .byte $F9 ; |XXXXX  X| $FFBA
    .byte $89 ; |X   X  X| $FFBB
    .byte $91 ; |X  X   X| $FFBC
    .byte $F1 ; |XXXX   X| $FFBD
    .byte $F9 ; |XXXXX  X| $FFBE
    .byte $89 ; |X   X  X| $FFBF
    .byte $F9 ; |XXXXX  X| $FFC0
    .byte $F9 ; |XXXXX  X| $FFC1
    .byte $89 ; |X   X  X| $FFC2
    .byte $F9 ; |XXXXX  X| $FFC3
    .byte $89 ; |X   X  X| $FFC4
    .byte $F9 ; |XXXXX  X| $FFC5
    .byte $89 ; |X   X  X| $FFC6
    .byte $3F ; |  XXXXXX| $FFC7
    .byte $91 ; |X  X   X| $FFC8
    .byte $81 ; |X      X| $FFC9
    .byte $70 ; | XXX    | $FFCA
    .byte $40 ; | X      | $FFCB
    .byte $84 ; |X    X  | $FFCC
    .byte $89 ; |X   X  X| $FFCD
    .byte $7E ; | XXXXXX | $FFCE
    .byte $F9 ; |XXXXX  X| $FFCF
    .byte $91 ; |X  X   X| $FFD0
    .byte $F9 ; |XXXXX  X| $FFD1
    .byte $F1 ; |XXXX   X| $FFD2
    .byte $00 ; |        | $FFD3
    .byte $B9 ; |X XXX  X| $FFD4
    .byte $84 ; |X    X  | $FFD5
    .byte $00 ; |        | $FFD6
    .byte $00 ; |        | $FFD7
    .byte $89 ; |X   X  X| $FFD8
    .byte $38 ; |  XXX   | $FFD9
    .byte $78 ; | XXXX   | $FFDA
    .byte $7B ; | XXXX XX| $FFDB
    .byte $F9 ; |XXXXX  X| $FFDC
    .byte $89 ; |X   X  X| $FFDD
    .byte $F9 ; |XXXXX  X| $FFDE
    .byte $6F ; | XX XXXX| $FFDF
    .byte $00 ; |        | $FFE0
    .byte $B1 ; |X XX   X| $FFE1
    .byte $92 ; |X  X  X | $FFE2
    .byte $E9 ; |XXX X  X| $FFE3
    .byte $F9 ; |XXXXX  X| $FFE4
    .byte $00 ; |        | $FFE5
    .byte $30 ; |  XX    | $FFE6
    .byte $30 ; |  XX    | $FFE7
    .byte $30 ; |  XX    | $FFE8
    .byte $E9 ; |XXX X  X| $FFE9
    .byte $30 ; |  XX    | $FFEA
    .byte $30 ; |  XX    | $FFEB
    .byte $30 ; |  XX    | $FFEC
    .byte $10 ; |   X    | $FFED
    .byte $00 ; |        | $FFEE
    .byte $00 ; |        | $FFEF
    .byte $00 ; |        | $FFF0
    .byte $00 ; |        | $FFF1
LFFF2:
    .byte $A4 ; |X X  X  | $FFF2
    .byte $15 ; |   X X X| $FFF3
    .byte $95 ; |X  X X X| $FFF4
    .byte $06 ; |     XX | $FFF5
    .byte $86 ; |X    XX | $FFF6
    .byte $F7 ; |XXXX XXX| $FFF7

       ORG $1FF8
      RORG $FFF8

    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9

    .word START_1
    .word START_1
    .word START_1

