; Rough disassembly of Porky's
; By Omegamatrix
;

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
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXPPMM  =  $37
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

BANK_0                = $FFF8
BANK_1                = $FFF9

VBLANK_TIME           = 51
LINES_1               = 21
LINES_2               = 11

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RIOT RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x33
ram_81             ds 1  ; x18
ram_82             ds 1  ; x14
ram_83             ds 1  ; x6
ram_84             ds 1  ; x2
ram_85             ds 1  ; x1
ram_86             ds 1  ; x2
ram_87             ds 1  ; x1
ram_88             ds 3  ; x3
ram_8B             ds 1  ; x5
ram_8C             ds 1  ; x5
ram_8D             ds 1  ; x7
ram_8E             ds 1  ; x5
ram_8F             ds 1  ; x3
ram_90             ds 1  ; x15
ram_91             ds 1  ; x6
ram_92             ds 1  ; x8
ram_93             ds 2  ; x13
ram_95             ds 1  ; x14
ram_96             ds 1  ; x1
ram_97             ds 1  ; x21
ram_98             ds 1  ; x13
ram_99             ds 2  ; x3
ram_9B             ds 1  ; x2
ram_9C             ds 1  ; x15
ram_9D             ds 2  ; x7
ram_9F             ds 1  ; x2
ram_A0             ds 1  ; x6
ram_A1             ds 2  ; x1
ram_A3             ds 1  ; x2
ram_A4             ds 1  ; x5
ram_A5             ds 2  ; x1
ram_A7             ds 1  ; x1
ram_A8             ds 1  ; x10
ram_A9             ds 1  ; x5
ram_AA             ds 1  ; x1
ram_AB             ds 1  ; x2
ram_AC             ds 1  ; x6
ram_AD             ds 1  ; x3
ram_AE             ds 2  ; x1
ram_B0             ds 1  ; x6
ram_B1             ds 1  ; x6
ram_B2             ds 1  ; x1
ram_B3             ds 1  ; x5
ram_B4             ds 1  ; x1
ram_B5             ds 2  ; x3
ram_B7             ds 1  ; x2
ram_B8             ds 1  ; x5
ram_B9             ds 1  ; x3
ram_BA             ds 2  ; x1
ram_BC             ds 1  ; x7
ram_BD             ds 1  ; x6
ram_BE             ds 1  ; x7
ram_BF             ds 1  ; x5
ram_C0             ds 1  ; x19
ram_C1             ds 1  ; x2
ram_C2             ds 1  ; x17
ram_C3             ds 1  ; x2
frameCounter       ds 1  ; $C4 x19
ram_C5             ds 1  ; x5
ram_C6             ds 1  ; x4
ram_C7             ds 1  ; x4
ram_C8             ds 1  ; x25
ram_C9             ds 1  ; x72
ram_CA             ds 1  ; x46
ram_CB             ds 1  ; x2
ram_CC             ds 1  ; x13
ram_CD             ds 1  ; x3
ram_CE             ds 1  ; x4
ram_CF             ds 1  ; x3
ram_D0             ds 1  ; x27
ram_D1             ds 1  ; x7
ram_D2             ds 1  ; x19
ram_D3             ds 1  ; x4  lo score BCD 
ram_D4             ds 1  ; x4  hi score BCD
ram_D5             ds 1  ; x4
ram_D6             ds 2  ; x3
ram_D8             ds 1  ; x7
ram_D9             ds 1  ; x4
ram_DA             ds 1  ; x6
ram_DB             ds 1  ; x6
ram_DC             ds 1  ; x7
ram_DD             ds 3  ; x4
ram_E0             ds 1  ; x21
ram_E1             ds 1  ; x15
ram_E2             ds 1  ; x24
ram_E3             ds 1  ; x26
ram_E4             ds 1  ; x21
ram_E5             ds 1  ; x1
ram_E6             ds 1  ; x13
ram_E7             ds 1  ; x16
ram_E8             ds 1  ; x11
ram_E9             ds 1  ; x14
ram_EA             ds 1  ; x6
ram_EB             ds 1  ; x6
ram_EC             ds 1  ; x10
ram_ED             ds 1  ; x8
ram_EE             ds 1  ; x6
ram_EF             ds 1  ; x2
ram_F0             ds 1  ; x1
ram_F1             ds 1  ; x2
ram_F2             ds 4  ; x5
ram_F6             ds 10 ; x3


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE
       ORG $0000
      RORG $1000

START_0:
    lda    BANK_0                ; 4
    sei                          ; 2
    cld                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    jsr    L1F0F                 ; 6
    jmp    L159F                 ; 3

L100E:
    sta    CXCLR                 ; 3
    ldx    #$02                  ; 2
    stx    ram_E9                ; 3
    ldx    #$00                  ; 2
    stx    ram_C9                ; 3
    stx    ram_B8                ; 3
    stx    ram_B9                ; 3
    dex                          ; 2
    stx    ram_98                ; 3
    lda    #$03                  ; 2
    sta    ram_EA                ; 3
    sta    ram_A9                ; 3
    lda    #$08                  ; 2
    sta    ram_B5                ; 3
    lda    ram_D0                ; 3
    ror                          ; 2
    bcs    L1033                 ; 2³
    lda    #$6F                  ; 2
    tay                          ; 2
    bne    L1045                 ; 3   always branch

L1033:
    lda    #$58                  ; 2
    sta    ram_E7                ; 3
    lda    #$46                  ; 2
    sta    ram_E8                ; 3
    lda    ram_D0                ; 3
    ora    #$02                  ; 2
    sta    ram_D0                ; 3
    lda    #$9C                  ; 2
    ldy    #$7F                  ; 2
L1045:
    sta    ram_EC                ; 3
    sty    ram_EB                ; 3
    jsr    L13FA                 ; 6
    lda    #$7F                  ; 2
    ldy    #$64                  ; 2
    bne    L1059                 ; 3   always branch

L1052:
    jsr    L18C6                 ; 6
    lda    #$34                  ; 2
    ldy    #$B1                  ; 2
L1059:
    sta    ram_CA                ; 3
    sty    ram_90                ; 3
    lda    ram_D0                ; 3
    and    #$1F                  ; 2
    sta    ram_D0                ; 3
    lda    #$F0                  ; 2
    sta    ram_E3                ; 3
    sta    ram_E4                ; 3
    sta    ram_E2                ; 3
L106B:
    ldx    #$6B                  ; 2
    ldy    #$F2                  ; 2
    lda    frameCounter          ; 3
    and    #$08                  ; 2
    bne    L1076                 ; 2³
    inx                          ; 2
L1076:
    sty    ram_EE                ; 3
    stx    ram_ED                ; 3
    bit    ram_DD                ; 3
    bpl    L10A9                 ; 2³
    lda    ram_E3                ; 3
    ldy    ram_E2                ; 3
    bpl    L1098                 ; 2³
    sec                          ; 2
    sbc    #$0A                  ; 2
    sta    ram_E3                ; 3
    bne    L10A9                 ; 2³
    lda    ram_E4                ; 3
    jsr    L1BC5                 ; 6
    sta    ram_E4                ; 3
    lda    #$01                  ; 2
    sta    ram_E2                ; 3
    bne    L10A9                 ; 3   always branch

L1098:
    clc                          ; 2
    adc    #$0A                  ; 2
    sta    ram_E3                ; 3
    cmp    #$F0                  ; 2
    bne    L10A9                 ; 2³
    lda    ram_E2                ; 3
    eor    #$80                  ; 2
    sta    ram_E2                ; 3
    lsr    ram_DD                ; 5
L10A9:
    lda    ram_E3                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_E1                ; 3
    lda    #$44                  ; 2
    jsr    L14AA                 ; 6
    sta    ram_82                ; 3
    jsr    L147F                 ; 6
    sta    HMBL                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
L10BE:
    dey                          ; 2
    bpl    L10BE                 ; 2³
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$44                  ; 2
    sec                          ; 2
    sbc    ram_E1                ; 3
    jsr    L14AA                 ; 6
    sta    ram_82                ; 3
    jsr    L147F                 ; 6
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    sta    ram_81                ; 3
    tya                          ; 2
    ora    ram_81                ; 3
    sta    ram_81                ; 3
    jsr    L120F                 ; 6
    lda    #$7E                  ; 2
    sta    ram_97                ; 3
    lda    #$76                  ; 2
    sta    ram_9C                ; 3
    ldy    ram_EC                ; 3
    cpy    #$7F                  ; 2
    bcc    L1106                 ; 2³+1
    ldy    #$E2                  ; 2
    lda    frameCounter          ; 3
    and    #$20                  ; 2
    bne    L10F9                 ; 2³
    ldy    #$08                  ; 2
L10F9:
    sty    ram_A8                ; 3
    ldx    #$16                  ; 2
    ldy    #$01                  ; 2
    jsr    L1A0E                 ; 6
    ldy    #$9C                  ; 2
    sty    ram_EC                ; 3
L1106:
    lda    ram_D0                ; 3
    lsr                          ; 2
    bcs    L1124                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_98                ; 3
    cpy    #$7F                  ; 2
    bcs    L115D                 ; 2³
    jsr    L11B0                 ; 6
    ldy    #$86                  ; 2
    lda    frameCounter          ; 3
    and    #$08                  ; 2
    bne    L1120                 ; 2³
    ldy    #$1A                  ; 2
L1120:
    sty    ram_AC                ; 3
    bne    L115D                 ; 3   always branch

L1124:
    jsr    L1428                 ; 6
    lda    #$FF                  ; 2
    sta    ram_99                ; 3
    lda    #$6B                  ; 2
    sta    ram_98                ; 3
    lda    #$51                  ; 2
    sta    ram_9D                ; 3
    ldy    #$02                  ; 2
    ldx    ram_B5                ; 3
    jsr    L1A0E                 ; 6
    lda    frameCounter          ; 3
    and    #$02                  ; 2
    bne    L1145                 ; 2³
    ldx    #$02                  ; 2
    jsr    L19BB                 ; 6
L1145:
    lda    ram_E7                ; 3
    sta    ram_A9                ; 3
    lda    #$0F                  ; 2
    sta    ram_AD                ; 3
    bit    CXPPMM                ; 3
    bpl    L115D                 ; 2³
    ldx    #$00                  ; 2
    stx    ram_C9                ; 3
    jsr    L13FA                 ; 6
    lda    #$99                  ; 2
    jsr    L1EE3                 ; 6
L115D:
    ldx    #$80                  ; 2
    jsr    L17A6                 ; 6
    lda    ram_C9                ; 3
    and    #$10                  ; 2
    beq    L1175                 ; 2³
    lda    ram_D0                ; 3
    lsr                          ; 2
    bcs    L1172                 ; 2³
    rol                          ; 2
    and    #$7F                  ; 2
    sta    ram_D0                ; 3
L1172:
    jmp    L1052                 ; 3

L1175:
    lda    ram_CA                ; 3
    cmp    #$9A                  ; 2
    bcs    L117E                 ; 2³
    jmp    L106B                 ; 3

L117E:
    lda    ram_D0                ; 3
    ora    #$01                  ; 2
    and    #$1F                  ; 2
    sta    ram_D0                ; 3
    jsr    L1EAF                 ; 6
    jmp    L1647                 ; 3

L118C:
    lda    ram_D5                ; 3
    bne    L1196                 ; 2³
    lda    #$00                  ; 2
    sta    AUDV1                 ; 3
    beq    L11A6                 ; 3   always branch

L1196:
    dec    ram_D5                ; 5
    lda    ram_D6                ; 3
    sta    AUDC1                 ; 3
    lda    #$1D                  ; 2
    sta    AUDF1                 ; 3
    lda    #$16                  ; 2
    and    ram_DB                ; 3
    sta    AUDV1                 ; 3
L11A6:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcs    L11AF                 ; 2³
    jmp    L1CC3                 ; 3

L11AF:
    rts                          ; 6

L11B0:
    ldx    ram_D0                ; 3
    bmi    L11D7                 ; 2³
    lda    #$5F                  ; 2
    sta    ram_97                ; 3
    lda    #$5C                  ; 2
    sta    ram_9C                ; 3
    lda    #$48                  ; 2
    bit    ram_D0                ; 3
    bvs    L11C4                 ; 2³
    lda    #$73                  ; 2
L11C4:
    sta    ram_A8                ; 3
    bit    CXPPMM                ; 3
    bpl    L11D0                 ; 2³
    lda    ram_D0                ; 3
    ora    #$80                  ; 2
    sta    ram_D0                ; 3
L11D0:
    ldy    #$01                  ; 2
    ldx    #$14                  ; 2
    jmp    L1A0E                 ; 3

L11D7:
    stx    ram_97                ; 3
    lda    ram_CA                ; 3
    cmp    #$6A                  ; 2
    bcc    L1206                 ; 2³+1
    bit    ram_E4                ; 3
    bmi    L1207                 ; 2³+1
    bit    ram_D0                ; 3
    bvs    L1206                 ; 2³+1
    lda    #$29                  ; 2
L11E9:
    cmp    ram_90                ; 3
    bne    L1206                 ; 2³+1
    jsr    L17A9                 ; 6
    bvc    L1206                 ; 2³+1
    jsr    L1EAF                 ; 6
    lda    ram_EC                ; 3
    clc                          ; 2
    adc    #$04                  ; 2
    sta    ram_EC                ; 3
    sta    ram_EB                ; 3
    lda    ram_D0                ; 3
    and    #$7F                  ; 2
    eor    #$40                  ; 2
    sta    ram_D0                ; 3
L1206:
    rts                          ; 6

L1207:
    bit    ram_D0                ; 3
    bvc    L1206                 ; 2³
    lda    #$B1                  ; 2
    bne    L11E9                 ; 3+1  always  branch

L120F:
    ldx    ram_C9                ; 3
    lda    SWCHA                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    txa                          ; 2
    and    #$04                  ; 2
    bne    L1243                 ; 2³
    txa                          ; 2
    and    #$02                  ; 2
    bne    L1246                 ; 2³
    lda    ram_90                ; 3
    sta    ram_82                ; 3
    ldx    ram_CA                ; 3
    cpx    #$6B                  ; 2
    bcs    L1240                 ; 2³
    ldx    #$82                  ; 2
    lda    #$12                  ; 2
    pha                          ; 3
    lda    #$6F                  ; 2
    pha                          ; 3
    cpy    #$07                  ; 2
    beq    L1264                 ; 2³
    cpy    #$0B                  ; 2
    beq    L1261                 ; 2³
L123D:
    ldy    ram_90                ; 3
    rts                          ; 6

L1240:
    jmp    L1373                 ; 3

L1243:
    jmp    L12D1                 ; 3

L1246:
    lda    ram_CA                ; 3
    cmp    #$1D                  ; 2
    bcc    L124F                 ; 2³
    jmp    L132D                 ; 3

L124F:
    lda    ram_C9                ; 3
    ora    #$10                  ; 2
    sta    ram_C9                ; 3
    lda    #$50                  ; 2
    jsr    L1EE3                 ; 6
L125A:
    lda    #$1B                  ; 2
    sta    ram_E6                ; 3
    jmp    L13FE                 ; 3

L1261:
    lda    #$48                  ; 2

    .byte $2C ; BIT opcode, skip 2 bytes
L1264:
    lda    #$00                  ; 2
    sta    ram_C9                ; 3
L1268:
    ldy    #$01                  ; 2
    jsr    L1BBE                 ; 6
    jmp    L1BD0                 ; 3

    cpy    #$C1                  ; 2
    beq    L12B7                 ; 2³
    cpy    #$64                  ; 2
    beq    L125A                 ; 2³
    cpy    #$54                  ; 2
    beq    L125A                 ; 2³
    cpy    #$19                  ; 2
    beq    L12B7                 ; 2³
    cpy    #$96                  ; 2
    beq    L125A                 ; 2³
    jsr    L17A9                 ; 6
    bvc    L12AE                 ; 2³
    lda    ram_C9                ; 3
    bit    ram_E4                ; 3
    bmi    L1291                 ; 2³
    eor    #$48                  ; 2
L1291:
    and    #$48                  ; 2
    bne    L12AE                 ; 2³
    tya                          ; 2
    ldx    #$0B                  ; 2
    bit    ram_DA                ; 3
    bmi    L129E                 ; 2³
    ldx    #$16                  ; 2
L129E:
    dex                          ; 2
    bmi    L12AE                 ; 2³
    cmp    L140A,X               ; 4
    bne    L129E                 ; 2³
    cpy    ram_90                ; 3
    beq    L12B7                 ; 2³
    bit    ram_DD                ; 3
    bpl    L12BA                 ; 2³
L12AE:
    cpy    ram_90                ; 3
    beq    L12B7                 ; 2³
    sty    ram_90                ; 3
    jmp    L1972                 ; 3

L12B7:
    jmp    L18C6                 ; 3

L12BA:
    lda    ram_C9                ; 3
    ora    #$04                  ; 2
    sta    ram_C9                ; 3
    sec                          ; 2
    ror    ram_DD                ; 5
    lda    #$75                  ; 2
    jsr    L1EE3                 ; 6
    jmp    L1956                 ; 3

L12CB:
    jmp    L1345                 ; 3

L12CE:
    jmp    L1354                 ; 3

L12D1:
    lda    ram_C9                ; 3
    and    #$20                  ; 2
    bne    L12CE                 ; 2³
    lda    ram_C9                ; 3
    and    #$02                  ; 2
    bne    L1313                 ; 2³+1
    bit    INPT4                 ; 3
    bpl    L1313                 ; 2³+1
    ldy    ram_E3                ; 3
    cpy    #$82                  ; 2
    bcc    L130F                 ; 2³+1
    lda    ram_E2                ; 3
    eor    #$80                  ; 2
    sta    ram_E2                ; 3
    lda    ram_C9                ; 3
    eor    #$48                  ; 2
    sta    ram_C9                ; 3
    bcs    L1351                 ; 3+1   always branch

L12F5:
    jsr    L1268                 ; 6
    ldy    #$01                  ; 2
    jsr    L1BBE                 ; 6
    bmi    L1329                 ; 2³+1
L12FF:
    bit    ram_E4                ; 3
    bpl    L132D                 ; 2³
L1303:
    ldy    ram_E1                ; 3
    lda    L14C6,Y               ; 4
    clc                          ; 2
    adc    ram_CA                ; 3
    sta    ram_CA                ; 3
    bne    L133B                 ; 2³
L130F:
    cpy    #$1E                  ; 2
    bcs    L12CB                 ; 2³+1
L1313:
    lda    #$35                  ; 2
    sta    ram_E6                ; 3
    ldx    #$90                  ; 2
    lda    ram_E3                ; 3
    cmp    #$AA                  ; 2
    bcs    L12F5                 ; 2³+1
    lda    ram_81                ; 3
    sta    ram_90                ; 3
    lda    ram_C9                ; 3
    and    #$48                  ; 2
    beq    L12FF                 ; 2³+1
L1329:
    bit    ram_E4                ; 3
    bpl    L1303                 ; 2³
L132D:
    ldy    ram_E1                ; 3
    lda    ram_CA                ; 3
    sec                          ; 2
    sbc    L14C6,Y               ; 4
    sta    ram_CA                ; 3
    cmp    ram_E6                ; 3
    bcc    L1342                 ; 2³
L133B:
    lda    ram_E3                ; 3
    beq    L1351                 ; 2³
    jmp    L1984                 ; 3

L1342:
    jmp    L18C6                 ; 3

L1345:
    lda    ram_C9                ; 3
    ora    #$20                  ; 2
    and    #$BF                  ; 2
    sta    ram_C9                ; 3
    lda    #$6C                  ; 2
    sta    ram_E6                ; 3
L1351:
    jmp    L13FE                 ; 3

L1354:
    ldx    #$90                  ; 2
    jsr    L1268                 ; 6
    lda    ram_C9                ; 3
    and    #$40                  ; 2
    bne    L132D                 ; 2³
    lda    ram_CA                ; 3
    cmp    #$7F                  ; 2
    bcc    L1303                 ; 2³
    lda    ram_C9                ; 3
    ora    #$40                  ; 2
    sta    ram_C9                ; 3
    lda    ram_CC                ; 3
    sta    ram_CD                ; 3
    sta    ram_CE                ; 3
    bne    L132D                 ; 2³
L1373:
    ldx    #$82                  ; 2
    lda    #$13                  ; 2
    pha                          ; 3
    lda    #$D1                  ; 2
    pha                          ; 3
    tya                          ; 2
    lsr                          ; 2
    ldy    ram_90                ; 3
    sty    ram_82                ; 3
    bcc    L1399                 ; 2³
    lsr                          ; 2
    bcc    L13FE                 ; 2³
    lsr                          ; 2
    bcs    L138C                 ; 2³
    jmp    L1261                 ; 3

L138C:
    lsr                          ; 2
    bcs    L1392                 ; 2³
    jmp    L1264                 ; 3

L1392:
    bit    ram_C9                ; 3
    bmi    L13AD                 ; 2³
    jmp    L123D                 ; 3

L1399:
    cpy    #$B1                  ; 2
    beq    L13A1                 ; 2³
    cpy    #$29                  ; 2
    bne    L13D1                 ; 2³
L13A1:
    lda    ram_C9                ; 3
    bit    ram_E4                ; 3
    bmi    L13A9                 ; 2³
    eor    #$48                  ; 2
L13A9:
    and    #$08                  ; 2
    beq    L13D1                 ; 2³
L13AD:
    lda    ram_CA                ; 3
    cmp    ram_EC                ; 3
    bcs    L13D1                 ; 2³
    bit    ram_C9                ; 3
    bmi    L13C7                 ; 2³
    jsr    L1420                 ; 6
    lda    ram_C9                ; 3
    ora    #$80                  ; 2
    sta    ram_C9                ; 3
L13C0:
    lda    #$12                  ; 2
    ldx    #$0F                  ; 2
L13C4:
    jmp    L197E                 ; 3

L13C7:
    jsr    L1984                 ; 6
    bcc    L13D1                 ; 2³
    jsr    L1420                 ; 6
    ldy    ram_90                ; 3
L13D1:
    rts                          ; 6

    bit    ram_C9                ; 3
    bmi    L13DC                 ; 2³
    lda    ram_CA                ; 3
    cmp    ram_E6                ; 3
    bcs    L13FE                 ; 2³
L13DC:
    bit    ram_C9                ; 3
    bmi    L13D1                 ; 2³
    bit    ram_E4                ; 3
    bpl    L13F2                 ; 2³
    cpy    #$C1                  ; 2
    beq    L13EF                 ; 2³
    cpy    #$43                  ; 2
    beq    L13FA                 ; 2³
L13EC:
    jmp    L12AE                 ; 3

L13EF:
    jmp    L12B7                 ; 3

L13F2:
    cpy    #$19                  ; 2
    beq    L13EF                 ; 2³
    cpy    #$B7                  ; 2
    bne    L13EC                 ; 2³
L13FA:
    lda    #$35                  ; 2
    sta    ram_E6                ; 3
L13FE:
    lda    ram_C9                ; 3
    ora    #$02                  ; 2
    sta    ram_C9                ; 3
L1404:
    lda    #$1A                  ; 2
    ldx    #$16                  ; 2
    bne    L13C4                 ; 3+1   always branch

L140A:
    .byte $53 ; | X X  XX| $140A
    .byte $43 ; | X    XX| $140B
    .byte $33 ; |  XX  XX| $140C
    .byte $23 ; |  X   XX| $140D
    .byte $13 ; |   X  XX| $140E
    .byte $03 ; |      XX| $140F
    .byte $E7 ; |XXX  XXX| $1410
    .byte $D7 ; |XX X XXX| $1411
    .byte $C7 ; |XX   XXX| $1412
    .byte $B7 ; |X XX XXX| $1413
    .byte $A7 ; |X X  XXX| $1414
    .byte $97 ; |X  X XXX| $1415
    .byte $73 ; | XXX  XX| $1416
    .byte $63 ; | XX   XX| $1417
    .byte $F3 ; |XXXX  XX| $1418
    .byte $E3 ; |XXX   XX| $1419
    .byte $D3 ; |XX X  XX| $141A
    .byte $07 ; |     XXX| $141B
    .byte $F7 ; |XXXX XXX| $141C
    .byte $78 ; | XXXX   | $141D
    .byte $68 ; | XX X   | $141E
    .byte $58 ; | X XX   | $141F

L1420:
    ldy    ram_CA                ; 3
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    sty    ram_CA                ; 3
    rts                          ; 6

L1428:
    dec    ram_EA                ; 5
    bpl    L1457                 ; 2³
    lda    #$02                  ; 2
    sta    ram_EA                ; 3
    ldy    ram_E9                ; 3
    lda    ram_E8                ; 3
    cmp    #$46                  ; 2
    bcs    L1441                 ; 2³
    lda    L14C2,Y               ; 4
L143B:
    cmp    ram_E8                ; 3
    bne    L146C                 ; 2³
    beq    L1446                 ; 3   always branch

L1441:
    lda    L14BE,Y               ; 4
    bne    L143B                 ; 3   always branch?

L1446:
    cmp    #$52                  ; 2
    beq    L1458                 ; 2³
    cmp    #$03                  ; 2
    beq    L1462                 ; 2³
L144E:
    lda    ram_E9                ; 3
    clc                          ; 2
    adc    #$01                  ; 2
    and    #$03                  ; 2
    sta    ram_E9                ; 3
L1457:
    rts                          ; 6

L1458:
    bit    ram_DA                ; 3
    bpl    L144E                 ; 2³
    lda    #$03                  ; 2
    ldy    #$B1                  ; 2
    bne    L1466                 ; 3   always branch

L1462:
    lda    #$52                  ; 2
    ldy    #$A8                  ; 2
L1466:
    sta    ram_E8                ; 3
    sty    ram_E7                ; 3
    bne    L144E                 ; 2³
L146C:
    ldx    #$E7                  ; 2
    bcc    L1476                 ; 2³
    inc    ram_E8                ; 5
    lda    #$01                  ; 2
    bne    L147A                 ; 3   always branch

L1476:
    dec    ram_E8                ; 5
    lda    #$FF                  ; 2
L147A:
    sta    ram_B1                ; 3
    jmp    L1BD0                 ; 3

L147F:
    lda    ram_82                ; 3
    ldx    ram_E4                ; 3
    bpl    L1488                 ; 2³
    jsr    L1BC5                 ; 6
L1488:
    clc                          ; 2
    adc    #$53                  ; 2
    clc                          ; 2
    adc    #$2E                  ; 2
    tay                          ; 2
    and    #$0F                  ; 2
    sta    ram_81                ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc    ram_81                ; 3
    cmp    #$0F                  ; 2
    bcc    L14A3                 ; 2³
    sbc    #$0F                  ; 2
    iny                          ; 2
L14A3:
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    rts                          ; 6

L14AA:
    sta    ram_E0                ; 3
    ldx    #$08                  ; 2
    lda    #$00                  ; 2
L14B0:
    lsr    ram_E0                ; 5
    bcc    L14B7                 ; 2³
    clc                          ; 2
    adc    ram_E3                ; 3
L14B7:
    lsr                          ; 2
    dex                          ; 2
    bne    L14B0                 ; 2³
    stx    ram_E0                ; 3
    rts                          ; 6

L14BE:
    .byte $52 ; | X X  X | $14BE
    .byte $46 ; | X   XX | $14BF
    .byte $4B ; | X  X XX| $14C0
    .byte $46 ; | X   XX | $14C1
L14C2:
    .byte $03 ; |      XX| $14C2
    .byte $14 ; |   X X  | $14C3
    .byte $0A ; |    X X | $14C4
    .byte $14 ; |   X X  | $14C5
L14C6:
    .byte $01 ; |       X| $14C6
    .byte $01 ; |       X| $14C7
    .byte $01 ; |       X| $14C8
    .byte $01 ; |       X| $14C9
    .byte $01 ; |       X| $14CA
    .byte $01 ; |       X| $14CB
    .byte $01 ; |       X| $14CC
    .byte $01 ; |       X| $14CD
    .byte $01 ; |       X| $14CE
    .byte $01 ; |       X| $14CF
    .byte $01 ; |       X| $14D0
    .byte $01 ; |       X| $14D1
    .byte $01 ; |       X| $14D2
    .byte $01 ; |       X| $14D3
    .byte $01 ; |       X| $14D4
    .byte $01 ; |       X| $14D5
    .byte $01 ; |       X| $14D6
    .byte $01 ; |       X| $14D7
    .byte $01 ; |       X| $14D8
    .byte $01 ; |       X| $14D9
    .byte $01 ; |       X| $14DA
    .byte $01 ; |       X| $14DB
    .byte $02 ; |      X | $14DC
    .byte $02 ; |      X | $14DD
    .byte $02 ; |      X | $14DE
    .byte $02 ; |      X | $14DF
    .byte $02 ; |      X | $14E0
    .byte $02 ; |      X | $14E1
    .byte $01 ; |       X| $14E2
    .byte $01 ; |       X| $14E3
    .byte $01 ; |       X| $14E4
    .byte $01 ; |       X| $14E5
L14E6:
    .byte $76 ; | XXX XX | $14E6
L14E7:
    .byte $F3 ; |XXXX  XX| $14E7
    .byte $80 ; |X       | $14E8
    .byte $F7 ; |XXXX XXX| $14E9
    .byte $15 ; |   X X X| $14EA
    .byte $F6 ; |XXXX XX | $14EB
    .byte $2D ; |  X XX X| $14EC
    .byte $F6 ; |XXXX XX | $14ED
    .byte $C5 ; |XX   X X| $14EE
    .byte $FE ; |XXXXXXX | $14EF
    .byte $DF ; |XX XXXXX| $14F0
    .byte $FE ; |XXXXXXX | $14F1
    .byte $F9 ; |XXXXX  X| $14F2
    .byte $FE ; |XXXXXXX | $14F3
    .byte $13 ; |   X  XX| $14F4
    .byte $FF ; |XXXXXXXX| $14F5
    .byte $F7 ; |XXXX XXX| $14F6
    .byte $FB ; |XXXXX XX| $14F7
    .byte $80 ; |X       | $14F8
    .byte $F6 ; |XXXX XX | $14F9
    .byte $6F ; | XX XXXX| $14FA
    .byte $F2 ; |XXXX  X | $14FB
    .byte $7E ; | XXXXXX | $14FC
    .byte $F3 ; |XXXX  XX| $14FD
    .byte $7E ; | XXXXXX | $14FE
    .byte $F3 ; |XXXX  XX| $14FF
    .byte $7B ; | XXXX XX| $1500
    .byte $FC ; |XXXXXX  | $1501
L1502:
    .byte $00 ; |        | $1502
    .byte $3E ; |  XXXXX | $1503
    .byte $1A ; |   XX X | $1504
    .byte $1A ; |   XX X | $1505
    .byte $C6 ; |XX   XX | $1506
    .byte $43 ; | X    XX| $1507

L1508:
    lda    #$58                  ; 2
    sta    ram_CA                ; 3
    lda    #$D2                  ; 2
    sta    ram_90                ; 3
    lda    #$11                  ; 2
    sta    ram_C8                ; 3
    lda    #$81                  ; 2
    sta    ram_D0                ; 3
    ldy    #$00                  ; 2
    sty    ram_C5                ; 3
    sty    ram_C7                ; 3
    sty    ram_F1                ; 3
    sty    ram_C9                ; 3
    sty    ram_B9                ; 3
    iny                          ; 2
    sty    ram_F0                ; 3
    sty    ram_D2                ; 3
    sty    ram_B1                ; 3
    lda    #$08                  ; 2
    sta    ram_B5                ; 3
    lda    #$11                  ; 2
    sta    ram_EC                ; 3
    lda    #$25                  ; 2
    sta    ram_A9                ; 3
    lda    #$38                  ; 2
    sta    ram_E2                ; 3
    lda    #$F8                  ; 2
    sta    ram_AD                ; 3
    lda    #$1F                  ; 2
    sta    ram_98                ; 3
    lda    #$05                  ; 2
    sta    ram_9D                ; 3
    lda    #$14                  ; 2
    sta    ram_E6                ; 3
    lda    #$64                  ; 2
    sta    ram_97                ; 3
    lda    #$5C                  ; 2
    sta    ram_9C                ; 3
    lda    #$C0                  ; 2
    sta    ram_A8                ; 3
    lda    frameCounter          ; 3
    sta    ram_C6                ; 3
L155B:
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    L1587                 ; 2³
    ldy    #$FF                  ; 2
    lda    ram_E2                ; 3
    dec    ram_E6                ; 5
    bne    L1575                 ; 2³
    ldx    #$14                  ; 2
    stx    ram_E6                ; 3
    cmp    ram_C8                ; 3
    bpl    L1573                 ; 2³
    ldy    #$01                  ; 2
L1573:
    sty    ram_B1                ; 3
L1575:
    clc                          ; 2
    adc    ram_B1                ; 3
    beq    L1587                 ; 2³
    cmp    #$6E                  ; 2
    bcs    L1587                 ; 2³
    sta    ram_E2                ; 3
    lda    ram_B1                ; 3
    ldx    #$A9                  ; 2
    jsr    L1BD0                 ; 6
L1587:
    ldx    #$02                  ; 2
    jsr    L19BB                 ; 6
    lda    #$7E                  ; 2
    cmp    ram_CA                ; 3
    bcc    L1595                 ; 2³
    jmp    L1620                 ; 3

L1595:
    bit    ram_D0                ; 3
    bpl    L159C                 ; 2³
    jmp    L161E                 ; 3

L159C:
    jsr    L1EBE                 ; 6
L159F:
    jsr    L18C6                 ; 6
    ldx    #$DC                  ; 2
    stx    ram_98                ; 3
L15A6:
    lda    #$5A                  ; 2
    sta    ram_CA                ; 3
    lda    #$D2                  ; 2
    sta    ram_90                ; 3
    lda    #$CE                  ; 2
    sta    ram_C8                ; 3
    lda    #$46                  ; 2
    sta    ram_97                ; 3
    lda    #$3C                  ; 2
    sta    ram_9C                ; 3
    lda    #$07                  ; 2
    sta    ram_A8                ; 3
    lda    #$02                  ; 2
    sta    ram_D8                ; 3
    lda    #$00                  ; 2
    sta    ram_D9                ; 3
    sta    ram_C9                ; 3
    sta    ram_B8                ; 3
    lda    #$F0                  ; 2
    sta    ram_AC                ; 3
    lda    #$E0                  ; 2
    sta    ram_E3                ; 3
    txa                          ; 2
    pha                          ; 3
    jsr    L163C                 ; 6
    pla                          ; 4
    tax                          ; 2
    dex                          ; 2
    bne    L15A6                 ; 2³
L15DC:
    jsr    L1972                 ; 6
    lda    #$01                  ; 2
L15E1:
    jsr    L1BCE                 ; 6
L15E4:
    jsr    L163C                 ; 6
    inc    ram_C8                ; 5
    bmi    L15DC                 ; 2³
    bne    L15FA                 ; 2³
    lda    #$06                  ; 2
    sta    ram_CC                ; 3
    ldx    #$0E                  ; 2
    lda    #$0D                  ; 2
    jsr    L1980                 ; 6
    inc    ram_C8                ; 5
L15FA:
    jsr    L1984                 ; 6
    dec    ram_C8                ; 5
    bcc    L15E4                 ; 2³+1
    cpx    ram_CE                ; 3
    bcs    L160A                 ; 2³
    lda    L1BA9,X               ; 4
    bcc    L15E1                 ; 3+1   always branch

L160A:
    inc    ram_E0                ; 5
    lda    ram_D9                ; 3
    eor    #$0F                  ; 2
    sta    ram_D9                ; 3
    inc    ram_D8                ; 5
    bit    ram_D8                ; 3
    bvc    L15E4                 ; 2³+1
    lda    #$00                  ; 2
    sta    ram_DB                ; 3
    beq    L159F                 ; 3+1   always branch

L161E:
    sta    ram_CA                ; 3
L1620:
    jsr    L17B3                 ; 6
    ldx    #$01                  ; 2
    jsr    L17A6                 ; 6
    ldy    #$01                  ; 2
    ldx    #$18                  ; 2
    bit    ram_D0                ; 3
    bpl    L1632                 ; 2³
    ldx    #$1A                  ; 2
L1632:
    jsr    L1A06                 ; 6
    bit    CXPPMM                ; 3
    bmi    L168F                 ; 2³
    jmp    L155B                 ; 3

L163C:
    lda    #$FB                  ; 2
    sta    ram_EA                ; 3
    lda    #$5D                  ; 2
    sta    ram_E6                ; 3
    jmp    L1FE8                 ; 3

L1647:
    lda    #$1E                  ; 2
    sta    ram_CA                ; 3
    ldy    #$01                  ; 2
    sty    ram_90                ; 3
    dey                          ; 2
    sty    ram_C8                ; 3
    sty    ram_B4                ; 3
    sty    ram_C9                ; 3
    lda    #$40                  ; 2
    sta    ram_D2                ; 3
    ldx    #$0F                  ; 2
L165C:
    lda    L171A,X               ; 4
    sta    ram_E0,X              ; 4
    dex                          ; 2
    bpl    L165C                 ; 2³
    lda    #$FD                  ; 2
    sta    ram_C5                ; 3
    ldx    ram_D1                ; 3
    lda    L172A,X               ; 4
    sta    ram_EB                ; 3
    clc                          ; 2
    adc    #$61                  ; 2
    sta    ram_E9                ; 3
L1674:
    lda    frameCounter          ; 3
    and    #$3F                  ; 2
    bne    L167F                 ; 2³
    lda    #$90                  ; 2
    jsr    L1EE3                 ; 6
L167F:
    lda    ram_CA                ; 3
    cmp    #$99                  ; 2
    bcc    L168B                 ; 2³
    jsr    L1EAF                 ; 6
    jmp    L1D97                 ; 3

L168B:
    cmp    #$05                  ; 2
    bcs    L16AF                 ; 2³
L168F:
    jsr    L1EDE                 ; 6
    bit    ram_D2                ; 3
    bvc    L16AC                 ; 2³
    lda    #$01                  ; 2
    sta    frameCounter          ; 3
L169A:
    jsr    L16FF                 ; 6
    lda    #$FF                  ; 2
    sta    ram_98                ; 3
    sta    ram_E9                ; 3
    jsr    L17A4                 ; 6
    lda    frameCounter          ; 3
    and    #$3F                  ; 2
    bne    L169A                 ; 2³
L16AC:
    jmp    L100E                 ; 3

L16AF:
    ldy    #$7E                  ; 2
    lda    ram_E9                ; 3
    bmi    L16C4                 ; 2³
    bne    L16BC                 ; 2³
    jsr    L1EAF                 ; 6
    ldy    #$7E                  ; 2
L16BC:
    cpy    ram_CA                ; 3
    bcs    L16D5                 ; 2³
    sty    ram_CA                ; 3
    bne    L16D5                 ; 2³
L16C4:
    sty    ram_98                ; 3
    ldx    #$16                  ; 2
    ldy    #$02                  ; 2
    jsr    L1A06                 ; 6
    lda    #$76                  ; 2
    sta    ram_9D                ; 3
    lda    #$05                  ; 2
    sta    ram_A9                ; 3
L16D5:
    lda    ram_C5                ; 3
    cmp    #$FD                  ; 2
    bcc    L16EF                 ; 2³
    lda    ram_CA                ; 3
    cmp    #$52                  ; 2
    bne    L1731                 ; 2³+1
    lda    ram_C8                ; 3
    sbc    #$40                  ; 2
    tay                          ; 2
    jsr    L1BBE                 ; 6
    bpl    L1731                 ; 2³+1
    lda    #$00                  ; 2
    sta    ram_C5                ; 3
L16EF:
    jsr    L16FF                 ; 6
    bit    CXPPMM                ; 3
    bpl    L1748                 ; 2³+1
    ldx    #$E2                  ; 2
    jsr    L1B8A                 ; 6
    bcs    L168F                 ; 2³
    bcc    L1748                 ; 3+1   always branch

L16FF:
    ldx    #$01                  ; 2
    jsr    L19BB                 ; 6
    lda    ram_E3                ; 3
    sta    ram_97                ; 3
    sec                          ; 2
    sbc    #$18                  ; 2
    sta    ram_9C                ; 3
    lda    ram_E4                ; 3
    sta    ram_A8                ; 3
    lda    ram_E7                ; 3
    sta    ram_B0                ; 3
    lda    #$0F                  ; 2
    sta    ram_AC                ; 3
    rts                          ; 6

L171A:
    .byte $00 ; |        | $171A
    .byte $02 ; |      X | $171B
    .byte $3A ; |  XXX X | $171C
    .byte $1C ; |   XXX  | $171D
    .byte $25 ; |  X  X X| $171E
    .byte $00 ; |        | $171F
    .byte $00 ; |        | $1720
    .byte $00 ; |        | $1721
    .byte $38 ; |  XXX   | $1722
    .byte $84 ; |X    X  | $1723
    .byte $45 ; | X   X X| $1724
    .byte $10 ; |   X    | $1725
    .byte $04 ; |     X  | $1726
    .byte $00 ; |        | $1727
    .byte $01 ; |       X| $1728
    .byte $04 ; |     X  | $1729
L172A:
    .byte $09 ; |    X  X| $172A
    .byte $07 ; |     XXX| $172B
    .byte $10 ; |   X    | $172C
    .byte $09 ; |    X  X| $172D
    .byte $07 ; |     XXX| $172E
    .byte $09 ; |    X  X| $172F
    .byte $0A ; |    X X | $1730

L1731:
    ldx    #$12                  ; 2
    ldy    #$01                  ; 2
    jsr    L1A0E                 ; 6
    lda    #$57                  ; 2
    sta    ram_97                ; 3
    lda    #$2F                  ; 2
    ldx    #$05                  ; 2
    ldy    frameCounter          ; 3
    sta    ram_9C                ; 3
    stx    ram_A8                ; 3
    sty    ram_B0                ; 3
L1748:
    lda    ram_ED                ; 3
    cmp    #$01                  ; 2
    bne    L1785                 ; 2³
    ldy    #$01                  ; 2
    lda    #$40                  ; 2
    sbc    ram_E8                ; 3
    bpl    L1758                 ; 2³
    ldy    #$FF                  ; 2
L1758:
    tya                          ; 2
    clc                          ; 2
    adc    ram_E8                ; 3
    sta    ram_E8                ; 3
    tya                          ; 2
    ldx    #$EA                  ; 2
    jsr    L1BD0                 ; 6
    ldx    ram_EE                ; 3
    lda    ram_E9                ; 3
    clc                          ; 2
    adc    L1783,X               ; 4
    sta    ram_E9                ; 3
    dec    ram_EF                ; 5
    bpl    L178A                 ; 2³
    dec    ram_EE                ; 5
    bpl    L177D                 ; 2³
    ldy    #$01                  ; 2
    sty    ram_EE                ; 3
    dey                          ; 2
    sty    ram_ED                ; 3
L177D:
    lda    #$03                  ; 2
    sta    ram_EF                ; 3
    bne    L178A                 ; 3   always branch

L1783:
    .byte $FD ; |XXXXXX X| $1783
    .byte $03 ; |      XX| $1784

L1785:
    ldy    ram_E9                ; 3
    jsr    L1B4F                 ; 6
L178A:
    lda    frameCounter          ; 3
    and    ram_C7                ; 3
    bne    L1793                 ; 2³
    jsr    L17B3                 ; 6
L1793:
    dec    ram_E1                ; 5
    bne    L179E                 ; 2³
    jsr    L1BF8                 ; 6
    lda    #$02                  ; 2
    sta    ram_E1                ; 3
L179E:
    jsr    L17A4                 ; 6
    jmp    L1674                 ; 3

L17A4:
    ldx    #$40                  ; 2
L17A6:
    jmp    (L1FEF+1)             ; 5

L17A9:
    asl    INPT4                 ; 5
    clv                          ; 2
    ror    ram_CB                ; 5
    bmi    L17B2                 ; 2³
    bit    ram_CB                ; 3
L17B2:
    rts                          ; 6

L17B3:
    ldy    #$00                  ; 2
    sty    ram_C7                ; 3
    lda    ram_C9                ; 3
    and    #$10                  ; 2
    beq    L17CE                 ; 2³
    lda    #$03                  ; 2
    bit    ram_DA                ; 3
    bvc    L17C5                 ; 2³
    lda    #$07                  ; 2
L17C5:
    sta    ram_C7                ; 3
    iny                          ; 2
    jsr    L1BBE                 ; 6
    jsr    L1B52                 ; 6
L17CE:
    lda    ram_C9                ; 3
    lsr                          ; 2
    bcc    L17F5                 ; 2³
    jsr    L1984                 ; 6
    bcc    L17B2                 ; 2³
    ldy    L1BA9,X               ; 4
    jsr    L1BBE                 ; 6
    tax                          ; 2
    clc                          ; 2
    adc    ram_C8                ; 3
    jmp    L186F                 ; 3

L17E5:
    .byte $00 ; |        | $17E5
    .byte $3A ; |  XXX X | $17E6
    .byte $62 ; | XX   X | $17E7
    .byte $00 ; |        | $17E8
    .byte $20 ; |  X     | $17E9
    .byte $40 ; | X      | $17EA
    .byte $60 ; | XX     | $17EB
    .byte $00 ; |        | $17EC
    .byte $1C ; |   XXX  | $17ED
    .byte $50 ; | X X    | $17EE
    .byte $78 ; | XXXX   | $17EF
    .byte $00 ; |        | $17F0
    .byte $17 ; |   X XXX| $17F1
    .byte $37 ; |  XX XXX| $17F2
    .byte $57 ; | X X XXX| $17F3
    .byte $77 ; | XXX XXX| $17F4

L17F5:
    lsr                          ; 2
    bcc    L185C                 ; 2³+1
    lda    ram_C9                ; 3
    and    #$0A                  ; 2
    bit    CXPPMM                ; 3
    bpl    L1802                 ; 2³
    ora    #$10                  ; 2
L1802:
    sta    ram_C9                ; 3
    jsr    L1984                 ; 6
    bcc    L17B2                 ; 2³+1
    cpx    #$12                  ; 2
    bcs    L1835                 ; 2³
    lda    SWCHA                 ; 4
    and    #$20                  ; 2
    bne    L1818                 ; 2³
    lda    #$FD                  ; 2
    bne    L1838                 ; 3   always branch

L1818:
    ldy    #$03                  ; 2
    lda    ram_CA                ; 3
    bit    ram_D2                ; 3
    bvs    L1822                 ; 2³
    ldy    #$07                  ; 2
L1822:
    dey                          ; 2
    cmp    L17E5,Y               ; 4
    bcc    L1822                 ; 2³
    bne    L1835                 ; 2³
    ldx    #$00                  ; 2
    lda    #$16                  ; 2
    jsr    L1980                 ; 6
    ldx    #$12                  ; 2
    stx    ram_CC                ; 3
L1835:
    lda    L1B99,X               ; 4
L1838:
    clc                          ; 2
    adc    ram_CA                ; 3
    bit    ram_D2                ; 3
    ldy    #$0B                  ; 2
    bvs    L1843                 ; 2³
    ldy    #$10                  ; 2
L1843:
    dey                          ; 2
    cmp    L17E5,Y               ; 4
    bcc    L1843                 ; 2³
    beq    L18A4                 ; 2³
    sta    ram_CA                ; 3
    ldy    L1BA7,X               ; 4
    jsr    L1BBE                 ; 6
    clc                          ; 2
    adc    ram_C8                ; 3
    sta    ram_C8                ; 3
    tya                          ; 2
    jmp    L1BCE                 ; 3

L185C:
    lsr                          ; 2
    bcc    L18D2                 ; 2³
    jsr    L1984                 ; 6
    ldy    ram_CA                ; 3
    dey                          ; 2
    bpl    L186A                 ; 2³
    sty    ram_CA                ; 3
    rts                          ; 6

L186A:
    lda    ram_C8                ; 3
    ldx    #$00                  ; 2

    .byte $2C ; BIT opcode, skip 2 bytes
L186F:
    ldy    ram_CA                ; 3
    jsr    L1A2B                 ; 6
    bne    L189D                 ; 2³
    sta    ram_C8                ; 3
    bcs    L18F6                 ; 2³
    lda    ram_C9                ; 3
    lsr                          ; 2
    bcc    L1885                 ; 2³
    lda    ram_CC                ; 3
    cmp    #$0C                  ; 2
    bcc    L18A1                 ; 2³
L1885:
    jsr    L1BCB                 ; 6
L1888:
    lda    ram_C9                ; 3
    and    #$08                  ; 2
    ora    #$04                  ; 2
    sta    ram_C9                ; 3
    jmp    L1404                 ; 3

L1893:
    cmp    #$16                  ; 2
    bcc    L18A1                 ; 2³
    cmp    #$64                  ; 2
    bcs    L190C                 ; 2³+1
    bcc    L1908                 ; 3+1   always branch

L189D:
    bcc    L18AC                 ; 2³
    sta    ram_C8                ; 3
L18A1:
    jmp    L1BCB                 ; 3

L18A4:
    dec    ram_CA                ; 5
    bit    ram_D2                ; 3
    bvs    L18AC                 ; 2³
    dec    ram_CA                ; 5
L18AC:
    lda    ram_C9                ; 3
    lsr                          ; 2
    bcs    L1888                 ; 2³
    lda    ram_C9                ; 3
    and    #$04                  ; 2
    beq    L18C6                 ; 2³
    ldx    #$00                  ; 2
    lda    #$1A                  ; 2
    cmp    ram_CC                ; 3
    bcc    L18C1                 ; 2³
    sta    ram_CC                ; 3
L18C1:
    lda    #$20                  ; 2
    jmp    L1980                 ; 3

L18C6:
    lda    ram_C9                ; 3
    and    #$08                  ; 2
    sta    ram_C9                ; 3
    lda    #$00                  ; 2
    tax                          ; 2
    jmp    L197E                 ; 3

L18D2:
    jsr    L17A9                 ; 6
    bvs    L194E                 ; 2³+1
    lda    SWCHA                 ; 4
    and    #$10                  ; 2
    bne    L1914                 ; 2³+1
    jsr    L1960                 ; 6
    lda    #$09                  ; 2
    bit    ram_D2                ; 3
    bvs    L18E9                 ; 2³
    lda    #$17                  ; 2
L18E9:
    sta    ram_EC                ; 3
    ldy    ram_CA                ; 3
    iny                          ; 2
    bit    ram_D2                ; 3
    bvs    L18F3                 ; 2³
    iny                          ; 2
L18F3:
    jmp    L186A                 ; 3

L18F6:
    lda    ram_C9                ; 3
    and    #$02                  ; 2
    beq    L18A1                 ; 2³
    sta    ram_C9                ; 3
    lda    ram_C8                ; 3
    bit    ram_D2                ; 3
    bvc    L1893                 ; 2³+1
    cpy    #$52                  ; 2
    bcc    L1893                 ; 2³+1
L1908:
    cmp    #$40                  ; 2
    bcs    L18A1                 ; 2³+1
L190C:
    lda    ram_C9                ; 3
    ora    #$08                  ; 2
    sta    ram_C9                ; 3
    bne    L18A1                 ; 3+1   always branch

L1914:
    lda    #$01                  ; 2
    bit    SWCHA                 ; 4
    bpl    L191F                 ; 2³
    bvs    L18C6                 ; 2³+1
    lda    #$FF                  ; 2
L191F:
    pha                          ; 3
    jsr    L192B                 ; 6
    pla                          ; 4
    tax                          ; 2
    clc                          ; 2
    adc    ram_C8                ; 3
    jmp    L186F                 ; 3

L192B:
    sta    ram_81                ; 3
    and    #$08                  ; 2
    tay                          ; 2
    eor    ram_C9                ; 3
    and    #$EF                  ; 2
    bne    L1970                 ; 2³
    bit    CXPPMM                ; 3
    bpl    L1972                 ; 2³
    lda    ram_E9                ; 3
    bmi    L1972                 ; 2³
    lda    ram_81                ; 3
    asl                          ; 2
    jsr    L1B52                 ; 6
    lda    ram_C9                ; 3
    and    #$08                  ; 2
    ora    #$10                  ; 2
    sta    ram_C9                ; 3
    bne    L1972                 ; 3   always branch

L194E:
    lda    ram_C9                ; 3
    and    #$08                  ; 2
    ora    #$01                  ; 2
    sta    ram_C9                ; 3
L1956:
    ldx    #$06                  ; 2
    stx    ram_CC                ; 3
    ldx    #$00                  ; 2
    lda    #$0F                  ; 2
    bne    L1980                 ; 3   always branch

L1960:
    lda    ram_C9                ; 3
    and    #$08                  ; 2
    ora    #$02                  ; 2
    sta    ram_C9                ; 3
    jmp    L13C0                 ; 3

L196B:
    clc                          ; 2
    rts                          ; 6

L196D:
    jmp    L18C6                 ; 3

L1970:
    sty    ram_C9                ; 3
L1972:
    ldx    #$01                  ; 2
    lda    #$06                  ; 2
    cpx    ram_CC                ; 3
    bcs    L197E                 ; 2³
    cmp    ram_CC                ; 3
    bcs    L1984                 ; 2³
L197E:
    stx    ram_CC                ; 3
L1980:
    stx    ram_CD                ; 3
    sta    ram_CE                ; 3
L1984:
    pha                          ; 3
    ldx    ram_CC                ; 3
    bit    ram_DC                ; 3
    bpl    L19A3                 ; 2³
    lda    L19E5,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDV0                 ; 3
    lda    L19E5,X               ; 4
    and    ram_DB                ; 3
    and    #$0F                  ; 2
    sta    AUDF0                 ; 3
    lda    #$06                  ; 2
    and    ram_DB                ; 3
    sta    AUDC0                 ; 3
L19A3:
    pla                          ; 4
L19A4:
    dec    ram_CF                ; 5
    bne    L196B                 ; 2³
    inx                          ; 2
    pha                          ; 3
    lda    #$04                  ; 2
    sta    ram_CF                ; 3
    pla                          ; 4
    cpx    ram_CE                ; 3
    bcc    L19B7                 ; 2³
    ldx    ram_CD                ; 3
    beq    L196D                 ; 2³
L19B7:
    sec                          ; 2
    stx    ram_CC                ; 3
    rts                          ; 6

L19BB:
    ldy    ram_B3,X              ; 4
    lda    L14E6,Y               ; 4
    sta    ram_9F,X              ; 4
    lda    L14E7,Y               ; 4
    sta    ram_A3,X              ; 4
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    L196B                 ; 2³
    ldy    ram_B3,X              ; 4
    tya                          ; 2
    and    #$F8                  ; 2
    sta    ram_B3,X              ; 4
    tya                          ; 2
    and    #$07                  ; 2
    clc                          ; 2
    adc    #$02                  ; 2
    cmp    #$08                  ; 2
    bcc    L19E0                 ; 2³
    lda    #$00                  ; 2
L19E0:
    ora    ram_B3,X              ; 4
    sta    ram_B3,X              ; 4
    rts                          ; 6

L19E5:
    .byte $00 ; |        | $19E5   audio
    .byte $00 ; |        | $19E6
    .byte $00 ; |        | $19E7
    .byte $42 ; | X    X | $19E8
    .byte $00 ; |        | $19E9
    .byte $00 ; |        | $19EA
    .byte $00 ; |        | $19EB
    .byte $64 ; | XX  X  | $19EC
    .byte $73 ; | XXX  XX| $19ED
    .byte $73 ; | XXX  XX| $19EE
    .byte $72 ; | XXX  X | $19EF
    .byte $81 ; |X      X| $19F0
    .byte $71 ; | XXX   X| $19F1
    .byte $00 ; |        | $19F2
    .byte $83 ; |X     XX| $19F3
    .byte $00 ; |        | $19F4
    .byte $51 ; | X X   X| $19F5
    .byte $52 ; | X X  X | $19F6
    .byte $00 ; |        | $19F7
    .byte $51 ; | X X   X| $19F8
    .byte $00 ; |        | $19F9
    .byte $52 ; | X X  X | $19FA
    .byte $00 ; |        | $19FB
    .byte $81 ; |X      X| $19FC
    .byte $82 ; |X     X | $19FD
    .byte $73 ; | XXX  XX| $19FE
    .byte $71 ; | XXX   X| $19FF
    .byte $62 ; | XX   X | $1A00
    .byte $63 ; | XX   XX| $1A01
    .byte $61 ; | XX    X| $1A02
    .byte $62 ; | XX   X | $1A03
    .byte $63 ; | XX   XX| $1A04
    .byte $00 ; |        | $1A05

L1A06:
    lda    frameCounter          ; 3
    and    #$10                  ; 2
    bne    L1A0E                 ; 2³
    ldx    #$10                  ; 2
L1A0E:
    lda    L14E6,X               ; 4
    sta.wy ram_9F,Y              ; 5
    lda    L14E7,X               ; 4
    sta.wy ram_A3,Y              ; 5
    txa                          ; 2
    lsr                          ; 2
    sbc    #$07                  ; 2
    tax                          ; 2
    lda    L1502,X               ; 4
    sta.wy ram_AB,Y              ; 5
    lda    #$00                  ; 2
    sta.wy ram_B7,Y              ; 5
    rts                          ; 6

L1A2B:
    sty    ram_81                ; 3
L1A2D:
    stx    ram_80                ; 3
    sta    ram_82                ; 3
    tya                          ; 2
    ldx    ram_EC                ; 3
L1A34:
    cmp    L1A7A,X               ; 4
    bne    L1A3C                 ; 2³
    jmp    L1AE1                 ; 3

L1A3C:
    bcc    L1A41                 ; 2³
    jmp    L1AEC                 ; 3

L1A41:
    dex                          ; 2
    bpl    L1A34                 ; 3   always branch?

L1A44:
    .byte $01 ; |       X| $1A44
    .byte $09 ; |    X  X| $1A45
    .byte $0D ; |    XX X| $1A46
    .byte $0F ; |    XXXX| $1A47
    .byte $00 ; |        | $1A48
    .byte $10 ; |   X    | $1A49
    .byte $18 ; |   XX   | $1A4A
    .byte $1C ; |   XXX  | $1A4B
    .byte $20 ; |  X     | $1A4C
    .byte $42 ; | X    X | $1A4D
    .byte $47 ; | X   XXX| $1A4E
    .byte $4E ; | X  XXX | $1A4F
    .byte $21 ; |  X    X| $1A50
    .byte $29 ; |  X X  X| $1A51
    .byte $29 ; |  X X  X| $1A52
    .byte $29 ; |  X X  X| $1A53
    .byte $29 ; |  X X  X| $1A54
    .byte $00 ; |        | $1A55
    .byte $2A ; |  X X X | $1A56
    .byte $32 ; |  XX  X | $1A57
    .byte $32 ; |  XX  X | $1A58
    .byte $32 ; |  XX  X | $1A59
    .byte $32 ; |  XX  X | $1A5A
    .byte $34 ; |  XX X  | $1A5B
    .byte $3E ; |  XXXXX | $1A5C
    .byte $3E ; |  XXXXX | $1A5D
    .byte $3E ; |  XXXXX | $1A5E
L1A5F:
    .byte $00 ; |        | $1A5F
    .byte $03 ; |      XX| $1A60
    .byte $01 ; |       X| $1A61
    .byte $00 ; |        | $1A62
    .byte $00 ; |        | $1A63
    .byte $00 ; |        | $1A64
    .byte $03 ; |      XX| $1A65
    .byte $01 ; |       X| $1A66
    .byte $01 ; |       X| $1A67
    .byte $01 ; |       X| $1A68
    .byte $01 ; |       X| $1A69
    .byte $02 ; |      X | $1A6A
    .byte $00 ; |        | $1A6B
    .byte $03 ; |      XX| $1A6C
    .byte $03 ; |      XX| $1A6D
    .byte $03 ; |      XX| $1A6E
    .byte $03 ; |      XX| $1A6F
    .byte $00 ; |        | $1A70
    .byte $00 ; |        | $1A71
    .byte $03 ; |      XX| $1A72
    .byte $03 ; |      XX| $1A73
    .byte $03 ; |      XX| $1A74
    .byte $03 ; |      XX| $1A75
    .byte $00 ; |        | $1A76
    .byte $04 ; |     X  | $1A77
    .byte $04 ; |     X  | $1A78
    .byte $04 ; |     X  | $1A79
L1A7A:
    .byte $00 ; |        | $1A7A
    .byte $1E ; |   XXXX | $1A7B
    .byte $52 ; | X X  X | $1A7C
    .byte $7A ; | XXXX X | $1A7D
    .byte $96 ; |X  X XX | $1A7E
    .byte $00 ; |        | $1A7F
    .byte $1E ; |   XXXX | $1A80
    .byte $52 ; | X X  X | $1A81
    .byte $7A ; | XXXX X | $1A82
    .byte $96 ; |X  X XX | $1A83
    .byte $00 ; |        | $1A84
    .byte $00 ; |        | $1A85
    .byte $00 ; |        | $1A86
    .byte $18 ; |   XX   | $1A87
    .byte $38 ; |  XXX   | $1A88
    .byte $58 ; | X XX   | $1A89
    .byte $78 ; | XXXX   | $1A8A
    .byte $FF ; |XXXXXXXX| $1A8B
    .byte $00 ; |        | $1A8C
    .byte $18 ; |   XX   | $1A8D
    .byte $38 ; |  XXX   | $1A8E
    .byte $58 ; | X XX   | $1A8F
    .byte $78 ; | XXXX   | $1A90
L1A91:
    .byte $FF ; |XXXXXXXX| $1A91
L1A92:
    .byte $35 ; |  XX X X| $1A92
    .byte $44 ; | X   X  | $1A93
    .byte $00 ; |        | $1A94
    .byte $08 ; |    X   | $1A95
    .byte $25 ; |  X  X X| $1A96
    .byte $2D ; |  X XX X| $1A97
    .byte $4C ; | X  XX  | $1A98
    .byte $54 ; | X X X  | $1A99
    .byte $71 ; | XXX   X| $1A9A
    .byte $78 ; | XXXX   | $1A9B
    .byte $11 ; |   X   X| $1A9C
    .byte $1C ; |   XXX  | $1A9D
    .byte $5D ; | X XXX X| $1A9E
    .byte $68 ; | XX X   | $1A9F
    .byte $35 ; |  XX X X| $1AA0
    .byte $44 ; | X   X  | $1AA1
    .byte $00 ; |        | $1AA2
    .byte $03 ; |      XX| $1AA3
L1AA4:
    .byte $07 ; |     XXX| $1AA4
    .byte $27 ; |  X  XXX| $1AA5
    .byte $2B ; |  X X XX| $1AA6
    .byte $4F ; | X  XXXX| $1AA7
    .byte $53 ; | X X  XX| $1AA8
    .byte $73 ; | XXX  XX| $1AA9
    .byte $77 ; | XXX XXX| $1AAA
    .byte $12 ; |   X  X | $1AAB
    .byte $17 ; |   X XXX| $1AAC
    .byte $62 ; | XX   X | $1AAD
    .byte $67 ; | XX  XXX| $1AAE
    .byte $36 ; |  XX XX | $1AAF
    .byte $3B ; |  XXX XX| $1AB0
    .byte $3E ; |  XXXXX | $1AB1
    .byte $43 ; | X    XX| $1AB2
    .byte $00 ; |        | $1AB3
    .byte $09 ; |    X  X| $1AB4
    .byte $0A ; |    X X | $1AB5
    .byte $2E ; |  X XXX | $1AB6
    .byte $2F ; |  X XXXX| $1AB7
    .byte $4D ; | X  XX X| $1AB8
    .byte $4E ; | X  XXX | $1AB9
    .byte $72 ; | XXX  X | $1ABA
    .byte $73 ; | XXX  XX| $1ABB
    .byte $00 ; |        | $1ABC
    .byte $02 ; |      X | $1ABD
    .byte $08 ; |    X   | $1ABE
    .byte $2C ; |  X XX  | $1ABF
    .byte $32 ; |  XX  X | $1AC0
    .byte $46 ; | X   XX | $1AC1
    .byte $4C ; | X  XX  | $1AC2
    .byte $70 ; | XXX    | $1AC3
    .byte $76 ; | XXX XX | $1AC4
    .byte $00 ; |        | $1AC5
    .byte $78 ; | XXXX   | $1AC6
    .byte $00 ; |        | $1AC7
    .byte $09 ; |    X  X| $1AC8
    .byte $0A ; |    X X | $1AC9
    .byte $2E ; |  X XXX | $1ACA
    .byte $2F ; |  X XXXX| $1ACB
    .byte $4D ; | X  XX X| $1ACC
    .byte $4E ; | X  XXX | $1ACD
    .byte $72 ; | XXX  X | $1ACE
    .byte $73 ; | XXX  XX| $1ACF
    .byte $78 ; | XXXX   | $1AD0
    .byte $00 ; |        | $1AD1
    .byte $35 ; |  XX X X| $1AD2
    .byte $44 ; | X   X  | $1AD3
    .byte $78 ; | XXXX   | $1AD4
    .byte $00 ; |        | $1AD5
    .byte $08 ; |    X   | $1AD6
    .byte $25 ; |  X  X X| $1AD7
    .byte $54 ; | X X X  | $1AD8
    .byte $71 ; | XXX   X| $1AD9
    .byte $00 ; |        | $1ADA
    .byte $00 ; |        | $1ADB
    .byte $12 ; |   X  X | $1ADC
    .byte $1A ; |   XX X | $1ADD
    .byte $5E ; | X XXXX | $1ADE
    .byte $68 ; | XX X   | $1ADF
    .byte $78 ; | XXXX   | $1AE0

L1AE1:
    txa                          ; 2
    clc                          ; 2
    adc    #$08                  ; 2
    bit    ram_D2                ; 3
    bvs    L1AEB                 ; 2³
    adc    #$02                  ; 2
L1AEB:
    tax                          ; 2
L1AEC:
    bit    ram_D2                ; 3
    bvc    L1B04                 ; 2³+1
    cpy    #$52                  ; 2
    bne    L1B04                 ; 2³+1
    lda    ram_82                ; 3
    cmp    #$2A                  ; 2
    bcc    L1B04                 ; 2³+1
    cmp    #$4E                  ; 2
    bcc    L1B3C                 ; 2³+1
    cmp    #$78                  ; 2
    bcc    L1B04                 ; 2³
    bne    L1B27                 ; 2³
L1B04:
    lda    L1A44,X               ; 4
    ldy    L1A5F,X               ; 4
    tax                          ; 2
    lda    ram_82                ; 3
L1B0D:
    cmp    L1A92,X               ; 4
    bcs    L1B1C                 ; 2³
    cmp    L1A91,X               ; 4
    bcs    L1B34                 ; 2³
    dex                          ; 2
    dex                          ; 2
    dey                          ; 2
    bpl    L1B0D                 ; 2³
L1B1C:
    ldy    #$09                  ; 2
    txa                          ; 2
L1B1F:
    cmp    L1B2A,Y               ; 4
    bcs    L1B27                 ; 2³
    dey                          ; 2
    bpl    L1B1F                 ; 2³
L1B27:
    clc                          ; 2
    bcc    L1B3C                 ; 3   always branch

L1B2A:
    .byte $36 ; |  XX XX | $1B2A
    .byte $38 ; |  XXX   | $1B2B
    .byte $3A ; |  XXX X | $1B2C
    .byte $3C ; |  XXXX  | $1B2D
    .byte $40 ; | X      | $1B2E
    .byte $43 ; | X    XX| $1B2F
    .byte $45 ; | X   X X| $1B30
    .byte $47 ; | X   XXX| $1B31
    .byte $4A ; | X  X X | $1B32
    .byte $4C ; | X  XX  | $1B33

L1B34:
    cpx    #$33                  ; 2
    ldx    #$00                  ; 2
    bcc    L1B3B                 ; 2³
    inx                          ; 2
L1B3B:
    sec                          ; 2
L1B3C:
    php                          ; 3
    lda    #$04                  ; 2
    bit    ram_D2                ; 3
    bvs    L1B45                 ; 2³
    lda    #$11                  ; 2
L1B45:
    sta    ram_EC                ; 3
    lda    ram_82                ; 3
    ldx    ram_80                ; 3
    ldy    ram_81                ; 3
    plp                          ; 4
L1B4E:
    rts                          ; 6

L1B4F:
    lda    #$00                  ; 2

    .byte $2C ; BIT opcode, skip 2 bytes
L1B52:
    ldy    ram_E9                ; 3
    tax                          ; 2
    clc                          ; 2
    adc    ram_E8                ; 3
    pha                          ; 3
    tya                          ; 2
    sec                          ; 2
    sbc    ram_EB                ; 3
    clc                          ; 2
    adc    #$1A                  ; 2
    tay                          ; 2
    lda    ram_ED                ; 3
    cmp    #$05                  ; 2
    bne    L1B6F                 ; 2³
    lda    ram_C9                ; 3
    and    #$0F                  ; 2
    sta    ram_C9                ; 3
    lda    #$05                  ; 2
L1B6F:
    and    #$01                  ; 2
    sta    ram_ED                ; 3
    pla                          ; 4
    jsr    L1A2D                 ; 6
    bne    L1B80                 ; 2³
    ldy    #$05                  ; 2
    sty    ram_ED                ; 3
    dec    ram_E9                ; 5

    .byte $2C ; BIT opcode, skip 2 bytes
L1B80:
    bcc    L1B4E                 ; 2³
    sta    ram_E8                ; 3
    txa                          ; 2
    ldx    #$EA                  ; 2
    jmp    L1BD0                 ; 3

L1B8A:
    lda    ram_CA                ; 3
    sec                          ; 2
    sbc    ram_E3                ; 3
    bcs    L1B97                 ; 2³
    cmp    #$E7                  ; 2
    bcs    L1B9C                 ; 2³
L1B95:
    clc                          ; 2
    rts                          ; 6

L1B97:
    cmp    #$1A                  ; 2
L1B99:
    bcs    L1B95                 ; 2³
    sec                          ; 2
L1B9C:
    lda    ram_C8                ; 3
    sbc    ram_E2                ; 3
    bcc    L1BA5                 ; 2³
    jsr    L1BC5                 ; 6
L1BA5:
    cmp    #$F6                  ; 2
L1BA7:
    rts                          ; 6

    .byte $03 ; |      XX| $1BA8
L1BA9:
    .byte $03 ; |      XX| $1BA9
    .byte $03 ; |      XX| $1BAA
    .byte $06 ; |     XX | $1BAB
    .byte $06 ; |     XX | $1BAC
    .byte $06 ; |     XX | $1BAD
    .byte $06 ; |     XX | $1BAE
    .byte $00 ; |        | $1BAF
    .byte $00 ; |        | $1BB0
    .byte $03 ; |      XX| $1BB1
    .byte $04 ; |     X  | $1BB2
    .byte $05 ; |     X X| $1BB3
    .byte $05 ; |     X X| $1BB4
    .byte $04 ; |     X  | $1BB5
    .byte $00 ; |        | $1BB6
    .byte $00 ; |        | $1BB7
    .byte $00 ; |        | $1BB8
    .byte $02 ; |      X | $1BB9
    .byte $01 ; |       X| $1BBA
    .byte $02 ; |      X | $1BBB
    .byte $03 ; |      XX| $1BBC
    .byte $03 ; |      XX| $1BBD

L1BBE:
    lda    ram_C9                ; 3
    and    #$08                  ; 2
    beq    L1BC9                 ; 2³
    tya                          ; 2
L1BC5:
    eor    #$FF                  ; 2
    tay                          ; 2
    iny                          ; 2
L1BC9:
    tya                          ; 2
    rts                          ; 6

L1BCB:
    sty    ram_CA                ; 3
    txa                          ; 2
L1BCE:
    ldx    #$90                  ; 2
L1BD0:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_80                ; 3
    lda    0,X                   ; 4
    sec                          ; 2
    sbc    ram_80                ; 3
    tay                          ; 2
    bvs    L1BED                 ; 2³
    and    #$F0                  ; 2
    cmp    #$80                  ; 2
    bne    L1BEA                 ; 2³
L1BE4:
    tya                          ; 2
    adc    #$00                  ; 2
    sbc    #$0F                  ; 2
    tay                          ; 2
L1BEA:
    sty    0,X                   ; 4
    rts                          ; 6

L1BED:
    sec                          ; 2
    bpl    L1BE4                 ; 2³
    tya                          ; 2
    sbc    #$01                  ; 2
    adc    #$0F                  ; 2
    tay                          ; 2
    bne    L1BEA                 ; 2³
L1BF8:
    lda    ram_E3                ; 3
    clc                          ; 2
    adc    #$02                  ; 2
    sta    ram_83                ; 3
    lda    ram_E7                ; 3
    lsr                          ; 2
    bcs    L1C53                 ; 2³
    bit    ram_E7                ; 3
    bmi    L1C48                 ; 2³
    ldy    ram_83                ; 3
    cpy    #$7A                  ; 2
    beq    L1C12                 ; 2³
    cpy    #$1E                  ; 2
    bne    L1C16                 ; 2³
L1C12:
    cpy    ram_CA                ; 3
    beq    L1C37                 ; 2³
L1C16:
    lda    #$40                  ; 2
    cmp    ram_C8                ; 3
    bcc    L1C22                 ; 2³
    cmp    ram_E2                ; 3
    bcc    L1C33                 ; 2³
    bcs    L1C26                 ; 3   always branch

L1C22:
    cmp    ram_E2                ; 3
    bcs    L1C33                 ; 2³
L1C26:
    cpy    #$52                  ; 2
    bne    L1C2E                 ; 2³
    cpy    ram_CA                ; 3
    beq    L1C37                 ; 2³
L1C2E:
    jsr    L1C63                 ; 6
    bcc    L1C37                 ; 2³
L1C33:
    cpy    #$51                  ; 2
    bcs    L1C2E                 ; 2³
L1C37:
    bit    ram_E7                ; 3
    lda    #$01                  ; 2
    bvc    L1C3F                 ; 2³
    lda    #$FF                  ; 2
L1C3F:
    jsr    L1CA7                 ; 6
L1C42:
    lsr    ram_E7                ; 5
    sec                          ; 2
    rol    ram_E7                ; 5
L1C47:
    rts                          ; 6

L1C48:
    lda    #$01                  ; 2
    bvc    L1C4E                 ; 2³
    lda    #$FF                  ; 2
L1C4E:
    jsr    L1C6E                 ; 6
    bcc    L1C42                 ; 2³
L1C53:
    lsr    ram_E7                ; 5
    clc                          ; 2
    rol    ram_E7                ; 5
    jsr    L1C9C                 ; 6
    jsr    L1C63                 ; 6
    lda    #$FF                  ; 2
    jsr    L1C9E                 ; 6
L1C63:
    lda    #$01                  ; 2
    ldx    ram_CA                ; 3
    cpx    ram_83                ; 3
    bcs    L1C6E                 ; 2³
    jsr    L1BC5                 ; 6
L1C6E:
    tax                          ; 2
    clc                          ; 2
    adc    ram_83                ; 3
    tay                          ; 2
    txa                          ; 2
    clc                          ; 2
    adc    ram_E3                ; 3
    sta    ram_81                ; 3
    lda    ram_E2                ; 3
    jsr    L1A2D                 ; 6
    bcs    L1C82                 ; 2³
    bne    L1C47                 ; 2³
L1C82:
    sty    ram_E3                ; 3
    beq    L1C8A                 ; 2³
    pla                          ; 4
    pla                          ; 4
    bcs    L1C42                 ; 2³
L1C8A:
    txa                          ; 2
    ora    #$80                  ; 2
    and    #$C0                  ; 2
    sta    ram_80                ; 3
    lda    ram_E7                ; 3
    and    #$08                  ; 2
    ora    ram_80                ; 3
    sta    ram_E7                ; 3
    pla                          ; 4
    pla                          ; 4
    rts                          ; 6

L1C9C:
    lda    #$01                  ; 2
L1C9E:
    ldx    ram_C8                ; 3
    cpx    ram_E2                ; 3
    bcs    L1CA7                 ; 2³
    jsr    L1BC5                 ; 6
L1CA7:
    tax                          ; 2
    clc                          ; 2
    adc    ram_E2                ; 3
    ldy    ram_83                ; 3
    jsr    L1A2D                 ; 6
    bcs    L1CB4                 ; 2³
    bne    L1C47                 ; 2³
L1CB4:
    sta    ram_E2                ; 3
    pla                          ; 4
    pla                          ; 4
    txa                          ; 2
    and    #$48                  ; 2
    sta    ram_E7                ; 3
    txa                          ; 2
    ldx    #$E4                  ; 2
    jmp    L1BD0                 ; 3

L1CC3:
    ldx    #$FF                  ; 2
    txs                          ; 2
    jsr    L1F0F                 ; 6
L1CC9:
    lda    SWCHA                 ; 4
    dec    ram_E2                ; 5
    bpl    L1CF4                 ; 2³
    inc    ram_E2                ; 5
    and    #$F0                  ; 2
    cmp    #$F0                  ; 2
    bne    L1CDB                 ; 2³
    jmp    L1D74                 ; 3

L1CDB:
    pha                          ; 3
    and    #$C0                  ; 2
    cmp    #$C0                  ; 2
    beq    L1CE8                 ; 2³
    lda    #$70                  ; 2
    sta    ram_C9                ; 3
    bne    L1CF3                 ; 3   always branch

L1CE8:
    lda    #$1F                  ; 2
    sta    ram_E2                ; 3
    lda    #$28                  ; 2
    ldx    #$20                  ; 2
    jsr    L197E                 ; 6
L1CF3:
    pla                          ; 4
L1CF4:
    asl                          ; 2
    bcc    L1D60                 ; 2³+1
    asl                          ; 2
    bcc    L1D2F                 ; 2³+1
    asl                          ; 2
    bcc    L1D03                 ; 2³+1
    asl                          ; 2
    bcs    L1D53                 ; 2³
    lda    #$20                  ; 2

    .byte $2C ; BIT opcode, skip 2 bytes
L1D03:
    lda    #$10                  ; 2
L1D05:
    sta    ram_F6                ; 3
    and    ram_C9                ; 3
    bne    L1D13                 ; 2³
    lda    #$1F                  ; 2
    sbc    ram_E2                ; 3
    and    #$1F                  ; 2
    sta    ram_E2                ; 3
L1D13:
    lda    ram_F6                ; 3
    cmp    #$20                  ; 2
    bne    L1D1F                 ; 2³
    jsr    L1DC6                 ; 6
    jmp    L1D22                 ; 3

L1D1F:
    jsr    L1E14                 ; 6
L1D22:
    jsr    L1984                 ; 6
    lda    ram_C9                ; 3
    and    #$08                  ; 2
    ora    ram_F6                ; 3
    ora    #$C0                  ; 2
    bne    L1D79                 ; 3   always branch

L1D2F:
    lda    ram_C9                ; 3
    ora    #$08                  ; 2
    sta    ram_C9                ; 3
    lda    ram_C8                ; 3
    beq    L1D53                 ; 2³
    ldx    #$FF                  ; 2
    lda    #$FF                  ; 2
    dec    ram_C8                ; 5
L1D3F:
    stx    REFP0                 ; 3
    ldx    #$90                  ; 2
    jsr    L1BD0                 ; 6
    lda    ram_C9                ; 3
    cmp    #$80                  ; 2
    bcs    L1D53                 ; 2³
    ldy    ram_C9                ; 3
    jsr    L1972                 ; 6
    sty    ram_C9                ; 3
L1D53:
    lda    ram_C9                ; 3
    and    #$F0                  ; 2
    cmp    #$70                  ; 2
    beq    L1D7B                 ; 2³
    and    #$30                  ; 2
    jmp    L1D05                 ; 3

L1D60:
    lda    ram_C9                ; 3
    and    #$F0                  ; 2
    sta    ram_C9                ; 3
    lda    ram_C8                ; 3
    cmp    #$88                  ; 2
    bcs    L1D53                 ; 2³
    inc    ram_C8                ; 5
    ldx    #$00                  ; 2
    lda    #$01                  ; 2
    bne    L1D3F                 ; 3   always branch

L1D74:
    jsr    L18C6                 ; 6
    lda    #$F0                  ; 2
L1D79:
    sta    ram_C9                ; 3
L1D7B:
    ldx    #$03                  ; 2
L1D7D:
    jsr    L1E60                 ; 6
    dex                          ; 2
    bpl    L1D7D                 ; 2³
    lda    #$C0                  ; 2
    sta    ram_9B                ; 3
    jsr    L1FE8                 ; 6
    lda    CXPPMM                ; 3
    bmi    L1D91                 ; 2³
    jmp    L1CC9                 ; 3

L1D91:
    jsr    L1EBE                 ; 6
    jmp    L100E                 ; 3

L1D97:
    inc    ram_D1                ; 5
    lda    ram_D1                ; 3
    cmp    #$07                  ; 2
    bcc    L1DA1                 ; 2³
    dec    ram_D1                ; 5
L1DA1:
    jsr    L1F29                 ; 6
L1DA4:
    jsr    L1FE8                 ; 6
    jsr    L17A9                 ; 6
    bvc    L1DA4                 ; 2³
    jmp    L1CC9                 ; 3

L1DAF:
    lda    ram_E3                ; 3
    cmp    #$61                  ; 2
    bcs    L1DD0                 ; 2³
    lda    ram_CA                ; 3
    cmp    #$7C                  ; 2
    bcc    L1DC3                 ; 2³
    jsr    L1EBE                 ; 6
    pla                          ; 4
    pla                          ; 4
    jmp    L1508                 ; 3

L1DC3:
    inc    ram_CA                ; 5
    rts                          ; 6

L1DC6:
    ldx    ram_CA                ; 3
    lda    ram_E0                ; 3
    beq    L1DAF                 ; 2³
    cpx    #$3C                  ; 2
    bcc    L1DC3                 ; 2³
L1DD0:
    dec    ram_E3                ; 5
    lda    ram_E3                ; 3
    cmp    #$60                  ; 2
    beq    L1DE1                 ; 2³
    bcs    L1DFA                 ; 2³
    dec    ram_E0                ; 5
    lda    #$7F                  ; 2
    sta    ram_E3                ; 3
    rts                          ; 6

L1DE1:
    ldx    #$25                  ; 2
L1DE3:
    lda    ram_97,X              ; 4
    sta    ram_98,X              ; 4
    dex                          ; 2
    bpl    L1DE3                 ; 2³
    ldx    #$0E                  ; 2
L1DEC:
    lda    ram_E6,X              ; 4
    sta    ram_E7,X              ; 4
    dex                          ; 2
    bpl    L1DEC                 ; 2³
    ldx    #$01                  ; 2
    ldy    ram_E0                ; 3
    jsr    L1F58                 ; 6
L1DFA:
    ldx    #$03                  ; 2
L1DFC:
    dec    ram_97,X              ; 6
    ldy    ram_9C,X              ; 4
    dey                          ; 2
    cpy    #$03                  ; 2
    bcs    L1E09                 ; 2³
    ldy    #$C0                  ; 2
    sty    ram_97,X              ; 4
L1E09:
    sty    ram_9C,X              ; 4
    dex                          ; 2
    bpl    L1DFC                 ; 2³+1
    rts                          ; 6

L1E0F:
    lda    #$00                  ; 2
    sta    ram_E2                ; 3
    rts                          ; 6

L1E14:
    ldx    ram_CA                ; 3
    cpx    #$3D                  ; 2
    bcs    L1E5D                 ; 2³
    cpx    #$1D                  ; 2
    bcc    L1E0F                 ; 2³
    lda    ram_E0                ; 3
    cmp    #$04                  ; 2
    bcs    L1E5D                 ; 2³
    inc    ram_E3                ; 5
    bpl    L1E38                 ; 2³
    lda    #$60                  ; 2
    sta    ram_E3                ; 3
    inc    ram_E0                ; 5
    ldy    ram_E0                ; 3
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    ldx    #$04                  ; 2
    jmp    L1F58                 ; 3

L1E38:
    ldx    #$03                  ; 2
L1E3A:
    inc    ram_97,X              ; 6
    inc    ram_9C,X              ; 6
    dex                          ; 2
    bpl    L1E3A                 ; 2³
    lda    ram_97                ; 3
    bmi    L1E46                 ; 2³
    rts                          ; 6

L1E46:
    ldx    #$00                  ; 2
L1E48:
    lda    ram_98,X              ; 4
    sta    ram_97,X              ; 4
    inx                          ; 2
    cpx    #$25                  ; 2
    bcc    L1E48                 ; 2³
    ldx    #$00                  ; 2
L1E53:
    lda    ram_E7,X              ; 4
    sta    ram_E6,X              ; 4
    inx                          ; 2
    cpx    #$0F                  ; 2
    bcc    L1E53                 ; 2³
    rts                          ; 6

L1E5D:
    dec    ram_CA                ; 5
    rts                          ; 6

L1E60:
    txa                          ; 2
    pha                          ; 3
    clc                          ; 2
    txa                          ; 2
    adc    #$A8                  ; 2
    pha                          ; 3
    lda    ram_EE,X              ; 4
    and    #$01                  ; 2
    and    frameCounter          ; 3
    bne    L1E9B                 ; 2³
    lda    ram_EE,X              ; 4
    sta    ram_B0,X              ; 4
    lsr                          ; 2
    cmp    #$04                  ; 2
    and    #$03                  ; 2
    sta    ram_80                ; 3
    lda    ram_F2,X              ; 4
    bcc    L1E9F                 ; 2³
    sbc    ram_80                ; 3
    sta    ram_F2,X              ; 4
    bmi    L1E93                 ; 2³
    lda    #$00                  ; 2
    sbc    ram_80                ; 3
    sta    ram_80                ; 3
L1E8A:
    pla                          ; 4
    tax                          ; 2
    lda    ram_80                ; 3
    jsr    L1BD0                 ; 6
    bne    L1E9C                 ; 2³
L1E93:
    lda    #$78                  ; 2
    sta    ram_F2,X              ; 4
    ldy    #$98                  ; 2
L1E99:
    sty    ram_A8,X              ; 4
L1E9B:
    pla                          ; 4
L1E9C:
    pla                          ; 4
    tax                          ; 2
    rts                          ; 6

L1E9F:
    adc    ram_80                ; 3
    sta    ram_F2,X              ; 4
    cmp    #$79                  ; 2
    bcc    L1E8A                 ; 2³
    ldy    #$00                  ; 2
    sty    ram_F2,X              ; 4
    ldy    #$90                  ; 2
    bne    L1E99                 ; 3   always branch

L1EAF:
    ldx    #$50                  ; 2
    lda    ram_D2                ; 3
    and    ram_DA                ; 3
    bne    L1EB9                 ; 2³
    ldx    #$00                  ; 2
L1EB9:
    txa                          ; 2
    ldy    #$01                  ; 2
    bne    L1EDA                 ; 3   always branch

L1EBE:
    clc                          ; 2
    lda    ram_E0                ; 3
    adc    ram_D1                ; 3
    tax                          ; 2
    lda    ram_CA                ; 3
    cmp    #$64                  ; 2
    bcs    L1ED5                 ; 2³
    inx                          ; 2
    cmp    #$50                  ; 2
    bcs    L1ED5                 ; 2³
    inx                          ; 2
    cmp    #$30                  ; 2
    bcs    L1ED5                 ; 2³
    inx                          ; 2
L1ED5:
    ldy    L1F01,X               ; 4
    lda    #$00                  ; 2
L1EDA:
    ldx    #$05                  ; 2
    bne    L1EE7                 ; 3   always branch

L1EDE:
    lda    #$00                  ; 2
    ldy    #$98                  ; 2

    .byte $2C ; BIT opcode, skip 2 bytes
L1EE3:
    ldy    #$99                  ; 2
    ldx    #$0C                  ; 2
L1EE7:
    sed                          ; 2
    adc    ram_D3                ; 3
    sta    ram_D3                ; 3
    tya                          ; 2
    adc    ram_D4                ; 3
    cmp    #$90                  ; 2
    bcc    L1EF7                 ; 2³
    lda    #$00                  ; 2
    sta    ram_D3                ; 3
L1EF7:
    sta    ram_D4                ; 3
    cld                          ; 2
    stx    ram_D6                ; 3
    lda    #$0A                  ; 2
    sta    ram_D5                ; 3
    rts                          ; 6

L1F01:
    .byte $32 ; |  XX  X | $1F01
    .byte $16 ; |   X XX | $1F02
    .byte $08 ; |    X   | $1F03
    .byte $04 ; |     X  | $1F04
    .byte $02 ; |      X | $1F05
    .byte $01 ; |       X| $1F06
    .byte $00 ; |        | $1F07
    .byte $00 ; |        | $1F08
    .byte $00 ; |        | $1F09
    .byte $00 ; |        | $1F0A
    .byte $00 ; |        | $1F0B
    .byte $00 ; |        | $1F0C
    .byte $00 ; |        | $1F0D
    .byte $00 ; |        | $1F0E

L1F0F:
    ldx    #$80                  ; 2
    lda    #$00                  ; 2
L1F13:
    sta    0,X                   ; 4
    inx                          ; 2
    cpx    #$F8                  ; 2
    bcc    L1F13                 ; 2³
    lda    SWCHB                 ; 4
    sta    ram_DA                ; 3
    lda    #$10                  ; 2
    sta    ram_D4                ; 3
    lda    #$FF                  ; 2
    sta    ram_DB                ; 3
    sta    ram_DC                ; 3
L1F29:
    lda    #$5F                  ; 2
    sta    ram_E3                ; 3
    ldy    #$02                  ; 2
    sty    ram_D8                ; 3
    iny                          ; 2
    sty    ram_C8                ; 3
    iny                          ; 2
    sty    ram_CF                ; 3
    sty    ram_E0                ; 3
    lda    #$51                  ; 2
    sta    ram_90                ; 3
    lda    #$1C                  ; 2
    sta    ram_CA                ; 3
    lda    #$F0                  ; 2
    sta    ram_C9                ; 3
    sta    ram_E2                ; 3
    ldx    #$01                  ; 2
L1F49:
    jsr    L1F58                 ; 6
    inx                          ; 2
    iny                          ; 2
    cpy    #$08                  ; 2
    bcc    L1F49                 ; 2³
    jsr    L1FE8                 ; 6
    jmp    L1972                 ; 3

L1F58:
    jsr    L1F7E                 ; 6
    lda    L1FA6,Y               ; 4
    sta    ram_E5,X              ; 4
    lda    L1FAD,Y               ; 4
    sta    ram_E9,X              ; 4
    lda    L1FB4,Y               ; 4
    sta    ram_AB,X              ; 4
    lda    L1FBB,Y               ; 4
    sta    ram_B7,X              ; 4
    sec                          ; 2
    lda    L1FDC,X               ; 4
    sbc    L1FD5,Y               ; 4
    sta    ram_96,X              ; 4
    sbc    L1FE1,Y               ; 4
    sta    ram_9B,X              ; 4
    rts                          ; 6

L1F7E:
    stx    ram_80                ; 3
    sty    ram_81                ; 3
    clc                          ; 2
    tya                          ; 2
    adc    ram_D1                ; 3
    tay                          ; 2
    lda    L1FC2,Y               ; 4
    pha                          ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L1FD2,X               ; 4
    pha                          ; 3
    lda    L1FCF,X               ; 4
    ldx    ram_80                ; 3
    sta    ram_A7,X              ; 4
    pla                          ; 4
    sta    ram_F1,X              ; 4
    pla                          ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_ED,X              ; 4
    ldy    ram_81                ; 3
    rts                          ; 6

L1FA6:
    .byte $F7 ; |XXXX XXX| $1FA6
    .byte $14 ; |   X X  | $1FA7
    .byte $62 ; | XX   X | $1FA8
    .byte $F5 ; |XXXX X X| $1FA9
    .byte $08 ; |    X   | $1FAA
    .byte $71 ; | XXX   X| $1FAB
    .byte $1E ; |   XXXX | $1FAC
L1FAD:
    .byte $FB ; |XXXXX XX| $1FAD
    .byte $FA ; |XXXXX X | $1FAE
    .byte $F5 ; |XXXX X X| $1FAF
    .byte $F9 ; |XXXXX  X| $1FB0
    .byte $FA ; |XXXXX X | $1FB1
    .byte $F5 ; |XXXX X X| $1FB2
    .byte $FA ; |XXXXX X | $1FB3
L1FB4:
    .byte $00 ; |        | $1FB4
    .byte $48 ; | X  X   | $1FB5
    .byte $00 ; |        | $1FB6
    .byte $44 ; | X   X  | $1FB7
    .byte $3C ; |  XXXX  | $1FB8
    .byte $81 ; |X      X| $1FB9
    .byte $0F ; |    XXXX| $1FBA
L1FBB:
    .byte $00 ; |        | $1FBB
    .byte $05 ; |     X X| $1FBC
    .byte $03 ; |      XX| $1FBD
    .byte $01 ; |       X| $1FBE
    .byte $01 ; |       X| $1FBF
    .byte $05 ; |     X X| $1FC0
    .byte $05 ; |     X X| $1FC1
L1FC2:
    .byte $00 ; |        | $1FC2
    .byte $E1 ; |XXX    X| $1FC3
    .byte $40 ; | X      | $1FC4
    .byte $F1 ; |XXXX   X| $1FC5
    .byte $21 ; |  X    X| $1FC6
    .byte $A1 ; |X X    X| $1FC7
    .byte $30 ; |  XX    | $1FC8
    .byte $00 ; |        | $1FC9
    .byte $01 ; |       X| $1FCA
    .byte $02 ; |      X | $1FCB
    .byte $00 ; |        | $1FCC
    .byte $01 ; |       X| $1FCD
    .byte $02 ; |      X | $1FCE
L1FCF:
    .byte $01 ; |       X| $1FCF
    .byte $18 ; |   XX   | $1FD0
    .byte $45 ; | X   X X| $1FD1
L1FD2:
    .byte $00 ; |        | $1FD2
    .byte $68 ; | XX X   | $1FD3
    .byte $38 ; |  XXX   | $1FD4
L1FD5:
    .byte $07 ; |     XXX| $1FD5
    .byte $0A ; |    X X | $1FD6
    .byte $07 ; |     XXX| $1FD7
    .byte $0F ; |    XXXX| $1FD8
    .byte $07 ; |     XXX| $1FD9
    .byte $09 ; |    X  X| $1FDA
    .byte $0F ; |    XXXX| $1FDB
L1FDC:
    .byte $60 ; | XX     | $1FDC
    .byte $80 ; |X       | $1FDD
    .byte $60 ; | XX     | $1FDE
    .byte $40 ; | X      | $1FDF
    .byte $20 ; |  X     | $1FE0
L1FE1:
    .byte $03 ; |      XX| $1FE1
    .byte $0C ; |    XX  | $1FE2
    .byte $13 ; |   X  XX| $1FE3
    .byte $09 ; |    X  X| $1FE4
    .byte $13 ; |   X  XX| $1FE5
    .byte $0F ; |    XXXX| $1FE6
    .byte $0A ; |    X X | $1FE7

L1FE8:
    ldx    #$00                  ; 2
    jmp    (L1FEF+1)             ; 5

    .byte $2E ; |  X XXX | $1FED
    .byte $F6 ; |XXXX XX | $1FEE

L1FEF:
    jmp    L1FF2                 ; 3

L1FF2:
    bit    BANK_1                ; 4

    jmp    L118C                 ; 3

       ORG $0FF8
      RORG $1FF8

    .byte $00 ; |        | $1FF8
    .byte $00 ; |        | $1FF9

    .byte $E1 ; |XXX    X| $1FFA
    .byte $FF ; |XXXXXXXX| $1FFB

    .word START_0        ; reset
    .word START_0        ; break


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $F000

    lda    BANK_0                ; 4

LF003:
    lda    ram_B8                ; 3
    sta    NUSIZ1                ; 3
    lda    ram_B0                ; 3
    sta    REFP1                 ; 3
    lda    ram_90                ; 3
    jsr    LF2FE                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_A8                ; 3
    jsr    LF304                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_A4                ; 3
    sta    ram_8F                ; 3
    lda    ram_A0                ; 3
    sta    ram_8E                ; 3
    lda    ram_97                ; 3
    sta    ram_8C                ; 3
    lda    ram_9C                ; 3
    sta    ram_8B                ; 3
    ldx    #$00                  ; 2
    stx    NUSIZ0                ; 3
    inx                          ; 2
    stx    ram_8D                ; 3
    lda    #$01                  ; 2
    sta    CTRLPF                ; 3
    ldy    #$7F                  ; 2
    lda    ram_88                ; 3
    sta    PF0                   ; 3
    sta    HMCLR                 ; 3
LF03E:
    tya                          ; 2
    lsr                          ; 2
    bcs    LF045                 ; 2³
    jmp.ind (ram_BC)             ; 5

LF045:  ; indirect jump also
    sta    WSYNC                 ; 3
;---------------------------------------
    bcc    LF051                 ; 2³
    lda    (ram_C0),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_C2),Y            ; 5
    sta    PF2                   ; 3
LF051:
    dey                          ; 2
    bmi    LF0A3                 ; 2³
    cpy    ram_91                ; 3
    beq    LF0C8                 ; 2³
LF058:
    cpy    ram_8C                ; 3
    bne    LF03E                 ; 2³
LF05C:
    lda    (ram_8E),Y            ; 5
    tax                          ; 2
    tya                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lsr                          ; 2
    bcc    LF06D                 ; 2³
    lda    (ram_C0),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_C2),Y            ; 5
    sta    PF2                   ; 3
LF06D:
    stx    GRP1                  ; 3
    dey                          ; 2
LF070:
    cpy    ram_8B                ; 3
    beq    LF0A4                 ; 2³
    cpy    ram_91                ; 3
    bne    LF05C                 ; 2³
LF078:
    lda    (ram_93),Y            ; 5
    tax                          ; 2
    lda    (ram_95),Y            ; 5
    sta    ram_80                ; 3
    lda    (ram_8E),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    ram_80                ; 3
    sta    COLUP0                ; 3
    tya                          ; 2
    lsr                          ; 2
    bcc    LF097                 ; 2³
    lda    (ram_C0),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_C2),Y            ; 5
    sta    PF2                   ; 3
LF097:
    dey                          ; 2
    cpy    ram_8B                ; 3
    beq    LF0F2                 ; 2³
    cpy    ram_92                ; 3
    bcc    LF070                 ; 2³
    jmp    LF078                 ; 3

LF0A3:
    rts                          ; 6

LF0A4:
    tya                          ; 2
    sec                          ; 2
    sbc    ram_91                ; 3
    cmp    #$04                  ; 2
    bcc    LF0F2                 ; 2³
    jmp    LF1F3                 ; 3

    .byte $61 ; | XX    X| $F0AF
    .byte $61 ; | XX    X| $F0B0
    .byte $61 ; | XX    X| $F0B1
    .byte $61 ; | XX    X| $F0B2
    .byte $61 ; | XX    X| $F0B3
    .byte $61 ; | XX    X| $F0B4
    .byte $61 ; | XX    X| $F0B5
    .byte $61 ; | XX    X| $F0B6
    .byte $61 ; | XX    X| $F0B7
    .byte $61 ; | XX    X| $F0B8
    .byte $61 ; | XX    X| $F0B9
    .byte $61 ; | XX    X| $F0BA
    .byte $61 ; | XX    X| $F0BB
    .byte $0F ; |    XXXX| $F0BC
    .byte $0F ; |    XXXX| $F0BD
    .byte $0F ; |    XXXX| $F0BE
    .byte $0F ; |    XXXX| $F0BF
    .byte $0F ; |    XXXX| $F0C0
    .byte $0F ; |    XXXX| $F0C1
    .byte $3E ; |  XXXXX | $F0C2
    .byte $3E ; |  XXXXX | $F0C3
    .byte $3E ; |  XXXXX | $F0C4
    .byte $3E ; |  XXXXX | $F0C5
    .byte $00 ; |        | $F0C6
    .byte $00 ; |        | $F0C7

LF0C8:
    cpy    ram_8C                ; 3
    beq    LF078                 ; 2³
    lda    (ram_93),Y            ; 5
    tax                          ; 2
    tya                          ; 2
    lsr                          ; 2
    bcs    LF0D6                 ; 2³
    jmp.ind (ram_BE)             ; 5

LF0D6:  ; indirect jump also
    sta    WSYNC                 ; 3
;---------------------------------------
    bcc    LF0E2                 ; 2³
    lda    (ram_C0),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_C2),Y            ; 5
    sta    PF2                   ; 3
LF0E2:
    stx    GRP0                  ; 3
    lda    (ram_95),Y            ; 5
    sta    COLUP0                ; 3
LF0E8:
    dey                          ; 2
    bmi    LF0A3                 ; 2³
    cpy    ram_92                ; 3
    bcs    LF0C8                 ; 2³
    jmp    LF058                 ; 3

LF0F2:
    lda    (ram_93),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    (ram_95),Y            ; 5
    sta    COLUP0                ; 3
    tya                          ; 2
    lsr                          ; 2
    bcc    LF108                 ; 2³
    lda    (ram_C0),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_C2),Y            ; 5
    sta    PF2                   ; 3
LF108:
    ldx    ram_8D                ; 3
    lda    ram_A8,X              ; 4
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    dey                          ; 2
    tya                          ; 2
    lsr                          ; 2
    bcc    LF132                 ; 2³
    dex                          ; 2
    dex                          ; 2
    bpl    LF142                 ; 2³
    lda    (ram_95),Y            ; 5
    sta    COLUP0                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_93),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_C0),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_C2),Y            ; 5
    nop                          ; 2
    sta    RESP1                 ; 3
    sta    PF2                   ; 3
    jmp    LF159                 ; 3

LF132:
    lda    (ram_93),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    (ram_95),Y            ; 5
    sta    COLUP0                ; 3
    dex                          ; 2
    bit    ram_80                ; 3
    jmp    LF154                 ; 3

LF142:
    lda    (ram_93),Y            ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_95),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_C0),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_C2),Y            ; 5
    sta    PF2                   ; 3
LF154:
    dex                          ; 2
    bpl    LF154                 ; 2³
    sta    RESP1                 ; 3
LF159:
    dey                          ; 2
    tya                          ; 2
    ldx    ram_8D                ; 3
    lsr                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    bcs    LF16D                 ; 2³
    lda    (ram_93),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_95),Y            ; 5
    sta    COLUP0                ; 3
    jmp    LF17D                 ; 3

LF16D:
    lda    (ram_93),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_95),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_C0),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_C2),Y            ; 5
    sta    PF2                   ; 3
LF17D:
    lda    ram_AC,X              ; 4
    sta    COLUP1                ; 3
    lda    ram_B8,X              ; 4
    sta    NUSIZ1                ; 3
    lda    ram_97,X              ; 4
    sta    ram_8C                ; 3
    lda    ram_9C,X              ; 4
    sta    ram_8B                ; 3
    dey                          ; 2
    lda    (ram_93),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    (ram_95),Y            ; 5
    sta    COLUP0                ; 3
    tya                          ; 2
    lsr                          ; 2
    bcc    LF1A4                 ; 2³
    lda    (ram_C0),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_C2),Y            ; 5
    sta    PF2                   ; 3
LF1A4:
    lda    ram_A0,X              ; 4
    sta    ram_8E                ; 3
    lda    ram_A4,X              ; 4
    sta    ram_8F                ; 3
    lda    ram_B0,X              ; 4
    sta    REFP1                 ; 3
    inc    ram_8D                ; 5
    dey                          ; 2
    lda    (ram_93),Y            ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (ram_95),Y            ; 5
    sta    COLUP0                ; 3
    tya                          ; 2
    lsr                          ; 2
    bcc    LF1CB                 ; 2³
    lda    (ram_C0),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_C2),Y            ; 5
    sta    PF2                   ; 3
LF1CB:
    jmp    LF0E8                 ; 3

    .byte $00 ; |        | $F1CE
    .byte $00 ; |        | $F1CF
    .byte $00 ; |        | $F1D0
    .byte $00 ; |        | $F1D1
    .byte $00 ; |        | $F1D2
    .byte $00 ; |        | $F1D3
    .byte $00 ; |        | $F1D4
    .byte $00 ; |        | $F1D5
    .byte $00 ; |        | $F1D6
    .byte $00 ; |        | $F1D7
    .byte $00 ; |        | $F1D8
    .byte $00 ; |        | $F1D9
    .byte $3C ; |  XXXX  | $F1DA
    .byte $3C ; |  XXXX  | $F1DB
    .byte $28 ; |  X X   | $F1DC
    .byte $28 ; |  X X   | $F1DD
    .byte $28 ; |  X X   | $F1DE
    .byte $28 ; |  X X   | $F1DF
    .byte $28 ; |  X X   | $F1E0
    .byte $28 ; |  X X   | $F1E1
    .byte $28 ; |  X X   | $F1E2
    .byte $28 ; |  X X   | $F1E3
    .byte $28 ; |  X X   | $F1E4
    .byte $38 ; |  XXX   | $F1E5
    .byte $38 ; |  XXX   | $F1E6
    .byte $18 ; |   XX   | $F1E7
    .byte $38 ; |  XXX   | $F1E8
    .byte $2C ; |  X XX  | $F1E9
    .byte $2C ; |  X XX  | $F1EA
    .byte $1C ; |   XXX  | $F1EB
    .byte $0C ; |    XX  | $F1EC
    .byte $08 ; |    X   | $F1ED
    .byte $1C ; |   XXX  | $F1EE
    .byte $1E ; |   XXXX | $F1EF
    .byte $1C ; |   XXX  | $F1F0
    .byte $1E ; |   XXXX | $F1F1
    .byte $1C ; |   XXX  | $F1F2

LF1F3:
    sta    WSYNC                 ; 3
;---------------------------------------
    tya                          ; 2
    lsr                          ; 2
    bcc    LF201                 ; 2³+1
    lda    (ram_C0),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_C2),Y            ; 5
    sta    PF2                   ; 3
LF201:
    dey                          ; 2
    ldx    ram_8D                ; 3
    lda    ram_97,X              ; 4
    sta    ram_8C                ; 3
    sta    HMCLR                 ; 3
    lda    ram_A0,X              ; 4
    sta    ram_8E                ; 3
    lda    ram_A4,X              ; 4
    sta    ram_8F                ; 3
    lda    ram_A8,X              ; 4
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    tya                          ; 2
    lsr                          ; 2
    bcc    LF231                 ; 2³
    lda    (ram_C0),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    lda    (ram_C2),Y            ; 5
    sta    PF2                   ; 3
    bit    ram_80                ; 3
LF229:
    dex                          ; 2
    bpl    LF229                 ; 2³
    sta    RESP1                 ; 3
    jmp    LF23C                 ; 3

LF231:
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    LF0A3                 ; 6
    nop                          ; 2
LF237:
    dex                          ; 2
    bpl    LF237                 ; 2³
    sta    RESP1                 ; 3
LF23C:
    dey                          ; 2
    tya                          ; 2
    lsr                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    bcc    LF24D                 ; 2³
    lda    (ram_C0),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_C2),Y            ; 5
    sta    PF2                   ; 3
LF24D:
    ldx    ram_8D                ; 3
    lda    ram_AC,X              ; 4
    sta    COLUP1                ; 3
    lda    ram_B8,X              ; 4
    sta    NUSIZ1                ; 3
    inc    ram_8D                ; 5
    lda    ram_9C,X              ; 4
    sta    ram_8B                ; 3
    lda    ram_B0,X              ; 4
    sta    REFP1                 ; 3
    dey                          ; 2
    tya                          ; 2
    lsr                          ; 2
    jmp    LF045                 ; 3

LF267:
    sty    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    LF267                 ; 2³
    rts                          ; 6

    .byte $00 ; |        | $F26D
    .byte $F0 ; |XXXX    | $F26E
    .byte $F0 ; |XXXX    | $F26F
    .byte $00 ; |        | $F270
    .byte $00 ; |        | $F271
    .byte $90 ; |X  X    | $F272
    .byte $82 ; |X     X | $F273
    .byte $92 ; |X  X  X | $F274
    .byte $80 ; |X       | $F275
    .byte $91 ; |X  X   X| $F276
    .byte $83 ; |X     XX| $F277
    .byte $94 ; |X  X X  | $F278
    .byte $82 ; |X     X | $F279
    .byte $93 ; |X  X  XX| $F27A
    .byte $85 ; |X    X X| $F27B
    .byte $96 ; |X  X XX | $F27C
    .byte $84 ; |X    X  | $F27D
    .byte $95 ; |X  X X X| $F27E
    .byte $87 ; |X    XXX| $F27F
    .byte $97 ; |X  X XXX| $F280
    .byte $86 ; |X    XX | $F281
    .byte $96 ; |X  X XX | $F282
    .byte $88 ; |X   X   | $F283
    .byte $98 ; |X  XX   | $F284
    .byte $87 ; |X    XXX| $F285
    .byte $97 ; |X  X XXX| $F286
    .byte $88 ; |X   X   | $F287
    .byte $00 ; |        | $F288
    .byte $00 ; |        | $F289
    .byte $00 ; |        | $F28A
    .byte $00 ; |        | $F28B
    .byte $00 ; |        | $F28C
    .byte $00 ; |        | $F28D
    .byte $00 ; |        | $F28E
    .byte $00 ; |        | $F28F
    .byte $00 ; |        | $F290
    .byte $00 ; |        | $F291
    .byte $00 ; |        | $F292
    .byte $00 ; |        | $F293
    .byte $6C ; | XX XX  | $F294
    .byte $6C ; | XX XX  | $F295
    .byte $48 ; | X  X   | $F296
    .byte $48 ; | X  X   | $F297
    .byte $48 ; | X  X   | $F298
    .byte $48 ; | X  X   | $F299
    .byte $48 ; | X  X   | $F29A
    .byte $70 ; | XXX    | $F29B
    .byte $F0 ; |XXXX    | $F29C
    .byte $E0 ; |XXX     | $F29D
    .byte $E0 ; |XXX     | $F29E
    .byte $E6 ; |XXX  XX | $F29F
    .byte $E9 ; |XXX X  X| $F2A0
    .byte $E8 ; |XXX X   | $F2A1
    .byte $78 ; | XXXX   | $F2A2
    .byte $3C ; |  XXXX  | $F2A3
    .byte $1E ; |   XXXX | $F2A4
    .byte $1C ; |   XXX  | $F2A5
    .byte $1C ; |   XXX  | $F2A6
    .byte $1E ; |   XXXX | $F2A7
    .byte $1C ; |   XXX  | $F2A8
    .byte $00 ; |        | $F2A9
    .byte $00 ; |        | $F2AA
    .byte $00 ; |        | $F2AB
    .byte $00 ; |        | $F2AC
    .byte $00 ; |        | $F2AD
    .byte $00 ; |        | $F2AE
    .byte $00 ; |        | $F2AF
    .byte $0C ; |    XX  | $F2B0
    .byte $78 ; | XXXX   | $F2B1
    .byte $48 ; | X  X   | $F2B2
    .byte $48 ; | X  X   | $F2B3
    .byte $2C ; |  X XX  | $F2B4
    .byte $2C ; |  X XX  | $F2B5
    .byte $58 ; | X XX   | $F2B6
    .byte $F0 ; |XXXX    | $F2B7
    .byte $F0 ; |XXXX    | $F2B8
    .byte $F0 ; |XXXX    | $F2B9
    .byte $F0 ; |XXXX    | $F2BA
    .byte $F8 ; |XXXXX   | $F2BB
    .byte $B8 ; |X XXX   | $F2BC
    .byte $FC ; |XXXXXX  | $F2BD
    .byte $1E ; |   XXXX | $F2BE
    .byte $1C ; |   XXX  | $F2BF
    .byte $1E ; |   XXXX | $F2C0
    .byte $1C ; |   XXX  | $F2C1
    .byte $00 ; |        | $F2C2
    .byte $00 ; |        | $F2C3
    .byte $00 ; |        | $F2C4
    .byte $00 ; |        | $F2C5
    .byte $00 ; |        | $F2C6
    .byte $00 ; |        | $F2C7
    .byte $00 ; |        | $F2C8
    .byte $18 ; |   XX   | $F2C9
    .byte $70 ; | XXX    | $F2CA
    .byte $50 ; | X X    | $F2CB
    .byte $50 ; | X X    | $F2CC
    .byte $50 ; | X X    | $F2CD
    .byte $50 ; | X X    | $F2CE
    .byte $48 ; | X  X   | $F2CF
    .byte $28 ; |  X X   | $F2D0
    .byte $28 ; |  X X   | $F2D1
    .byte $38 ; |  XXX   | $F2D2
    .byte $39 ; |  XXX  X| $F2D3
    .byte $39 ; |  XXX  X| $F2D4
    .byte $3A ; |  XXX X | $F2D5
    .byte $1A ; |   XX X | $F2D6
    .byte $1C ; |   XXX  | $F2D7
    .byte $18 ; |   XX   | $F2D8
    .byte $18 ; |   XX   | $F2D9
    .byte $3C ; |  XXXX  | $F2DA
    .byte $38 ; |  XXX   | $F2DB
    .byte $3C ; |  XXXX  | $F2DC
    .byte $38 ; |  XXX   | $F2DD
    .byte $00 ; |        | $F2DE
    .byte $00 ; |        | $F2DF
    .byte $00 ; |        | $F2E0
    .byte $00 ; |        | $F2E1
    .byte $00 ; |        | $F2E2
    .byte $00 ; |        | $F2E3
    .byte $00 ; |        | $F2E4
    .byte $00 ; |        | $F2E5
    .byte $00 ; |        | $F2E6
    .byte $08 ; |    X   | $F2E7
    .byte $48 ; | X  X   | $F2E8
    .byte $48 ; | X  X   | $F2E9
    .byte $68 ; | XX X   | $F2EA
    .byte $24 ; |  X  X  | $F2EB
    .byte $14 ; |   X X  | $F2EC
    .byte $2C ; |  X XX  | $F2ED
    .byte $58 ; | X XX   | $F2EE
    .byte $70 ; | XXX    | $F2EF
    .byte $70 ; | XXX    | $F2F0
    .byte $70 ; | XXX    | $F2F1
    .byte $70 ; | XXX    | $F2F2
    .byte $76 ; | XXX XX | $F2F3
    .byte $35 ; |  XX X X| $F2F4
    .byte $38 ; |  XXX   | $F2F5
    .byte $18 ; |   XX   | $F2F6
    .byte $0C ; |    XX  | $F2F7
    .byte $1E ; |   XXXX | $F2F8
    .byte $1C ; |   XXX  | $F2F9
    .byte $1E ; |   XXXX | $F2FA
    .byte $1C ; |   XXX  | $F2FB
    .byte $00 ; |        | $F2FC
    .byte $00 ; |        | $F2FD

LF2FE:
    stx    ram_80                ; 3
    ldx    #$00                  ; 2
    beq    LF308                 ; 3   always branch

LF304:
    stx    ram_80                ; 3
    ldx    #$01                  ; 2
LF308:
    sty    ram_81                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    bit    ram_80                ; 3
    sta    HMP0,X                ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    nop                          ; 2
LF314:
    dey                          ; 2
    bpl    LF314                 ; 2³
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    ram_80                ; 3
    ldy    ram_81                ; 3
    rts                          ; 6

LF320:  ; indirect jump
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP0                  ; 3
    lda    (ram_95),Y            ; 5
    sta    COLUP0                ; 3
    cpy    #$56                  ; 2
    bcs    LF334                 ; 2³
    lda    #$5E                  ; 2
    sta    ram_C0                ; 3
    lda    #<LF337               ; 2
    sta    ram_BE                ; 3
LF334:
    jmp    LF0E8                 ; 3

LF337:  ; indirect jump
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP0                  ; 3
    lda    #<LF6E8               ; 2
    sta    ram_BC                ; 3
    lda    #>LF6E8               ; 2
    sta    ram_BD                ; 3
    sta    ram_BF                ; 3
    lda    #<LF6D9               ; 2
    sta    ram_BE                ; 3
    jmp    LF0E8                 ; 3

LF34C:  ; indirect jump
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #<LF6E8               ; 2
    sta    ram_BC                ; 3
    lda    #>LF6E8               ; 2
    sta    ram_BD                ; 3
    sta    ram_BF                ; 3
    lda    #<LF6D9               ; 2
    sta    ram_BE                ; 3
    jmp    LF051                 ; 3

    .byte $00 ; |        | $F35F
    .byte $00 ; |        | $F360
    .byte $80 ; |X       | $F361
    .byte $80 ; |X       | $F362
    .byte $C0 ; |XX      | $F363
    .byte $F0 ; |XXXX    | $F364
    .byte $33 ; |  XX  XX| $F365
    .byte $33 ; |  XX  XX| $F366
    .byte $72 ; | XXX  X | $F367
    .byte $FE ; |XXXXXXX | $F368
    .byte $FE ; |XXXXXXX | $F369
    .byte $F8 ; |XXXXX   | $F36A
    .byte $F8 ; |XXXXX   | $F36B
    .byte $78 ; | XXXX   | $F36C
    .byte $7C ; | XXXXX  | $F36D
    .byte $3D ; |  XXXX X| $F36E
    .byte $3E ; |  XXXXX | $F36F
    .byte $3E ; |  XXXXX | $F370
    .byte $79 ; | XXXX  X| $F371
    .byte $78 ; | XXXX   | $F372
    .byte $7C ; | XXXXX  | $F373
    .byte $3C ; |  XXXX  | $F374
    .byte $38 ; |  XXX   | $F375
    .byte $00 ; |        | $F376
    .byte $00 ; |        | $F377
    .byte $18 ; |   XX   | $F378
    .byte $18 ; |   XX   | $F379
    .byte $18 ; |   XX   | $F37A
    .byte $18 ; |   XX   | $F37B
    .byte $5A ; | X XX X | $F37C
    .byte $3C ; |  XXXX  | $F37D
    .byte $18 ; |   XX   | $F37E
    .byte $00 ; |        | $F37F
    .byte $00 ; |        | $F380
    .byte $00 ; |        | $F381
    .byte $00 ; |        | $F382
    .byte $00 ; |        | $F383
    .byte $00 ; |        | $F384
    .byte $00 ; |        | $F385
    .byte $60 ; | XX     | $F386
    .byte $60 ; | XX     | $F387
    .byte $40 ; | X      | $F388
    .byte $40 ; | X      | $F389
    .byte $28 ; |  X X   | $F38A
    .byte $28 ; |  X X   | $F38B
    .byte $1C ; |   XXX  | $F38C
    .byte $12 ; |   X  X | $F38D
    .byte $1E ; |   XXXX | $F38E
    .byte $1C ; |   XXX  | $F38F
    .byte $1C ; |   XXX  | $F390
    .byte $1E ; |   XXXX | $F391
    .byte $3E ; |  XXXXX | $F392
    .byte $3C ; |  XXXX  | $F393
    .byte $3C ; |  XXXX  | $F394
    .byte $3C ; |  XXXX  | $F395
    .byte $1C ; |   XXX  | $F396
    .byte $04 ; |     X  | $F397
    .byte $0E ; |    XXX | $F398
    .byte $0F ; |    XXXX| $F399
    .byte $0E ; |    XXX | $F39A
    .byte $0F ; |    XXXX| $F39B
    .byte $0E ; |    XXX | $F39C
    .byte $00 ; |        | $F39D
    .byte $00 ; |        | $F39E
    .byte $00 ; |        | $F39F
    .byte $00 ; |        | $F3A0
    .byte $00 ; |        | $F3A1
    .byte $00 ; |        | $F3A2
    .byte $00 ; |        | $F3A3
    .byte $40 ; | X      | $F3A4
    .byte $40 ; | X      | $F3A5
    .byte $40 ; | X      | $F3A6
    .byte $60 ; | XX     | $F3A7
    .byte $20 ; |  X     | $F3A8
    .byte $10 ; |   X    | $F3A9
    .byte $16 ; |   X XX | $F3AA
    .byte $16 ; |   X XX | $F3AB
    .byte $14 ; |   X X  | $F3AC
    .byte $14 ; |   X X  | $F3AD
    .byte $5E ; | X XXXX | $F3AE
    .byte $5E ; | X XXXX | $F3AF
    .byte $58 ; | X XX   | $F3B0
    .byte $5E ; | X XXXX | $F3B1
    .byte $5E ; | X XXXX | $F3B2
    .byte $39 ; |  XXX  X| $F3B3
    .byte $70 ; | XXX    | $F3B4
    .byte $E0 ; |XXX     | $F3B5
    .byte $F0 ; |XXXX    | $F3B6
    .byte $E0 ; |XXX     | $F3B7
    .byte $E0 ; |XXX     | $F3B8
    .byte $00 ; |        | $F3B9
    .byte $00 ; |        | $F3BA
    .byte $F0 ; |XXXX    | $F3BB
    .byte $E0 ; |XXX     | $F3BC
    .byte $00 ; |        | $F3BD
    .byte $00 ; |        | $F3BE
    .byte $00 ; |        | $F3BF
    .byte $00 ; |        | $F3C0
    .byte $00 ; |        | $F3C1
    .byte $00 ; |        | $F3C2
    .byte $00 ; |        | $F3C3
    .byte $00 ; |        | $F3C4
    .byte $80 ; |X       | $F3C5
    .byte $80 ; |X       | $F3C6
    .byte $80 ; |X       | $F3C7
    .byte $C0 ; |XX      | $F3C8
    .byte $63 ; | XX   XX| $F3C9
    .byte $33 ; |  XX  XX| $F3CA
    .byte $12 ; |   X  X | $F3CB
    .byte $12 ; |   X  X | $F3CC
    .byte $12 ; |   X  X | $F3CD
    .byte $1E ; |   XXXX | $F3CE
    .byte $1C ; |   XXX  | $F3CF
    .byte $9C ; |X  XXX  | $F3D0
    .byte $9C ; |X  XXX  | $F3D1
    .byte $9F ; |X  XXXXX| $F3D2
    .byte $FD ; |XXXXXX X| $F3D3
    .byte $79 ; | XXXX  X| $F3D4
    .byte $38 ; |  XXX   | $F3D5
    .byte $3C ; |  XXXX  | $F3D6
    .byte $38 ; |  XXX   | $F3D7
    .byte $3C ; |  XXXX  | $F3D8
    .byte $38 ; |  XXX   | $F3D9
    .byte $00 ; |        | $F3DA
    .byte $00 ; |        | $F3DB
    .byte $00 ; |        | $F3DC
    .byte $00 ; |        | $F3DD
    .byte $00 ; |        | $F3DE
    .byte $00 ; |        | $F3DF
    .byte $00 ; |        | $F3E0
    .byte $04 ; |     X  | $F3E1
    .byte $06 ; |     XX | $F3E2
    .byte $07 ; |     XXX| $F3E3
    .byte $04 ; |     X  | $F3E4
    .byte $44 ; | X   X  | $F3E5
    .byte $44 ; | X   X  | $F3E6
    .byte $44 ; | X   X  | $F3E7
    .byte $F4 ; |XXXX X  | $F3E8
    .byte $14 ; |   X X  | $F3E9
    .byte $14 ; |   X X  | $F3EA
    .byte $1C ; |   XXX  | $F3EB
    .byte $1C ; |   XXX  | $F3EC
    .byte $1C ; |   XXX  | $F3ED
    .byte $3E ; |  XXXXX | $F3EE
    .byte $5F ; | X XXXXX| $F3EF
    .byte $5D ; | X XXX X| $F3F0
    .byte $7C ; | XXXXX  | $F3F1
    .byte $08 ; |    X   | $F3F2
    .byte $1C ; |   XXX  | $F3F3
    .byte $1E ; |   XXXX | $F3F4
    .byte $1C ; |   XXX  | $F3F5
    .byte $1C ; |   XXX  | $F3F6
    .byte $00 ; |        | $F3F7
    .byte $1E ; |   XXXX | $F3F8
    .byte $1C ; |   XXX  | $F3F9

LF3FA:
    bit    ram_D2                ; 3
    bvs    LF407                 ; 2³+1
    jsr    LFF14                 ; 6
    lda    #$FF                  ; 2
    sta    ram_99                ; 3
    bne    LF47D                 ; 3   always branch

LF407:
    lda    ram_E9                ; 3
    bmi    LF439                 ; 2³
    cmp    #$06                  ; 2
    bcs    LF411                 ; 2³
    lda    #$80                  ; 2
LF411:
    sta    ram_98                ; 3
    sec                          ; 2
    sbc    ram_EB                ; 3
    bmi    LF41C                 ; 2³
    cmp    #$04                  ; 2
    bcs    LF41E                 ; 2³
LF41C:
    lda    #$04                  ; 2
LF41E:
    sta    ram_9D                ; 3
    lda    ram_EA                ; 3
    sta    ram_A9                ; 3
    sta    ram_AA                ; 3
    ldx    ram_D1                ; 3
    lda    LFA1F,X               ; 4
    sta    ram_AD                ; 3
    sta    ram_AE                ; 3
    lda    LF534,X               ; 4
    sta    ram_A5                ; 3
    lda    LF52D,X               ; 4
    sta    ram_A1                ; 3
LF439:
    lda    #$00                  ; 2
    sta    ram_B9                ; 3
    sta    ram_BA                ; 3
    lda    #$FF                  ; 2
    sta    ram_B1                ; 3
    sta    ram_B2                ; 3
    sta    ram_99                ; 3
    lda    ram_98                ; 3
    bmi    LF47D                 ; 2³
    cmp    ram_97                ; 3
    bcs    LF457                 ; 2³
    adc    #$04                  ; 2
    sbc    ram_9C                ; 3
    bpl    LF45F                 ; 2³
    bmi    LF47D                 ; 3   always branch

LF457:
    lda    ram_97                ; 3
    sbc    ram_9D                ; 3
    adc    #$04                  ; 2
    bmi    LF464                 ; 2³
LF45F:
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcs    LF47D                 ; 2³
LF464:
    ldx    #$14                  ; 2
LF466:
    ldy    ram_9C,X              ; 4
    lda    ram_9D,X              ; 4
    sty    ram_9D,X              ; 4
    sta    ram_9C,X              ; 4
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    LF466                 ; 2³
    ldy    ram_97                ; 3
    lda    ram_98                ; 3
    sta    ram_97                ; 3
    jmp    LF500                 ; 3

LF47D:
    jmp    LF502                 ; 3

    .byte $FF ; |XXXXXXXX| $F480
    .byte $3F ; |  XXXXXX| $F481
    .byte $FF ; |XXXXXXXX| $F482
    .byte $3F ; |  XXXXXX| $F483
    .byte $FF ; |XXXXXXXX| $F484
    .byte $3F ; |  XXXXXX| $F485
    .byte $C0 ; |XX      | $F486
    .byte $00 ; |        | $F487
    .byte $80 ; |X       | $F488
    .byte $00 ; |        | $F489
    .byte $10 ; |   X    | $F48A
    .byte $02 ; |      X | $F48B
    .byte $00 ; |        | $F48C
    .byte $00 ; |        | $F48D
    .byte $00 ; |        | $F48E
    .byte $00 ; |        | $F48F
    .byte $10 ; |   X    | $F490
    .byte $02 ; |      X | $F491
    .byte $00 ; |        | $F492
    .byte $00 ; |        | $F493
    .byte $00 ; |        | $F494
    .byte $00 ; |        | $F495
    .byte $10 ; |   X    | $F496
    .byte $02 ; |      X | $F497
    .byte $80 ; |X       | $F498
    .byte $00 ; |        | $F499
    .byte $80 ; |X       | $F49A
    .byte $00 ; |        | $F49B
    .byte $10 ; |   X    | $F49C
    .byte $02 ; |      X | $F49D
    .byte $00 ; |        | $F49E
    .byte $80 ; |X       | $F49F
    .byte $0B ; |    X XX| $F4A0
    .byte $E1 ; |XXX    X| $F4A1
    .byte $17 ; |   X XXX| $F4A2
    .byte $F2 ; |XXXX  X | $F4A3
    .byte $0D ; |    XX X| $F4A4
    .byte $E1 ; |XXX    X| $F4A5
    .byte $1F ; |   XXXXX| $F4A6
    .byte $F3 ; |XXXX  XX| $F4A7
    .byte $17 ; |   X XXX| $F4A8
    .byte $C3 ; |XX    XX| $F4A9
    .byte $1D ; |   XXX X| $F4AA
    .byte $E1 ; |XXX    X| $F4AB
    .byte $0F ; |    XXXX| $F4AC
    .byte $F0 ; |XXXX    | $F4AD
    .byte $17 ; |   X XXX| $F4AE
    .byte $61 ; | XX    X| $F4AF
    .byte $1B ; |   XX XX| $F4B0
    .byte $33 ; |  XX  XX| $F4B1
    .byte $1E ; |   XXXX | $F4B2
    .byte $33 ; |  XX  XX| $F4B3
    .byte $0F ; |    XXXX| $F4B4
    .byte $23 ; |  X   XX| $F4B5
    .byte $15 ; |   X X X| $F4B6
    .byte $31 ; |  XX   X| $F4B7
    .byte $1F ; |   XXXXX| $F4B8
    .byte $23 ; |  X   XX| $F4B9
    .byte $00 ; |        | $F4BA
    .byte $20 ; |  X     | $F4BB
    .byte $00 ; |        | $F4BC
    .byte $20 ; |  X     | $F4BD
    .byte $08 ; |    X   | $F4BE
    .byte $20 ; |  X     | $F4BF
    .byte $00 ; |        | $F4C0
    .byte $20 ; |  X     | $F4C1
    .byte $00 ; |        | $F4C2
    .byte $20 ; |  X     | $F4C3
    .byte $88 ; |X   X   | $F4C4
    .byte $20 ; |  X     | $F4C5
    .byte $80 ; |X       | $F4C6
    .byte $00 ; |        | $F4C7
    .byte $00 ; |        | $F4C8
    .byte $00 ; |        | $F4C9
    .byte $08 ; |    X   | $F4CA
    .byte $20 ; |  X     | $F4CB
    .byte $00 ; |        | $F4CC
    .byte $20 ; |  X     | $F4CD
    .byte $00 ; |        | $F4CE
    .byte $20 ; |  X     | $F4CF
    .byte $88 ; |X   X   | $F4D0
    .byte $20 ; |  X     | $F4D1
    .byte $80 ; |X       | $F4D2
    .byte $30 ; |  XX    | $F4D3
    .byte $C0 ; |XX      | $F4D4
    .byte $38 ; |  XXX   | $F4D5
    .byte $E8 ; |XXX X   | $F4D6
    .byte $3C ; |  XXXX  | $F4D7
    .byte $F0 ; |XXXX    | $F4D8
    .byte $FF ; |XXXXXXXX| $F4D9
    .byte $F0 ; |XXXX    | $F4DA
    .byte $FB ; |XXXXX XX| $F4DB
    .byte $F8 ; |XXXXX   | $F4DC
    .byte $FE ; |XXXXXXX | $F4DD
    .byte $F0 ; |XXXX    | $F4DE
    .byte $FF ; |XXXXXXXX| $F4DF
    .byte $F8 ; |XXXXX   | $F4E0
    .byte $FF ; |XXXXXXXX| $F4E1
    .byte $80 ; |X       | $F4E2
    .byte $20 ; |  X     | $F4E3
    .byte $00 ; |        | $F4E4
    .byte $00 ; |        | $F4E5
    .byte $00 ; |        | $F4E6
    .byte $00 ; |        | $F4E7
    .byte $00 ; |        | $F4E8
    .byte $00 ; |        | $F4E9
    .byte $80 ; |X       | $F4EA
    .byte $20 ; |  X     | $F4EB
    .byte $80 ; |X       | $F4EC
    .byte $00 ; |        | $F4ED
    .byte $00 ; |        | $F4EE
    .byte $00 ; |        | $F4EF
    .byte $00 ; |        | $F4F0
    .byte $00 ; |        | $F4F1
    .byte $00 ; |        | $F4F2
    .byte $20 ; |  X     | $F4F3
    .byte $80 ; |X       | $F4F4
    .byte $00 ; |        | $F4F5
    .byte $80 ; |X       | $F4F6
    .byte $00 ; |        | $F4F7
    .byte $C0 ; |XX      | $F4F8
    .byte $00 ; |        | $F4F9
    .byte $E9 ; |XXX X  X| $F4FA
    .byte $28 ; |  X X   | $F4FB
    .byte $FB ; |XXXXX XX| $F4FC
    .byte $1F ; |   XXXXX| $F4FD
    .byte $FF ; |XXXXXXXX| $F4FE
    .byte $3F ; |  XXXXXX| $F4FF

LF500:
    sty    ram_98                ; 3
LF502:
    jsr    LFF85                 ; 6
LF505:
    jsr    LF003                 ; 6
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    ldy    #LINES_1              ; 2
    jsr    LF267                 ; 6
    ldy    #$02                  ; 2
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    VBLANK                ; 3
    sty    VSYNC                 ; 3
    sty    WSYNC                 ; 3
    sty    WSYNC                 ; 3
    sty    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #VBLANK_TIME          ; 2
    sta    TIM64T                ; 4
    jmp    LFFF2                 ; 3

LF52D:
    .byte $53 ; | X X  XX| $F52D
    .byte $4A ; | X  X X | $F52E
    .byte $81 ; |X      X| $F52F
    .byte $66 ; | XX  XX | $F530
    .byte $6D ; | XX XX X| $F531
    .byte $F5 ; |XXXX X X| $F532
    .byte $5D ; | X XXX X| $F533
LF534:
    .byte $FB ; |XXXXX XX| $F534
    .byte $FB ; |XXXXX XX| $F535
    .byte $F5 ; |XXXX X X| $F536
    .byte $FB ; |XXXXX XX| $F537
    .byte $FB ; |XXXXX XX| $F538
    .byte $F9 ; |XXXXX  X| $F539
    .byte $FB ; |XXXXX XX| $F53A

LF53B:  ; inidrect jump
    sta    WSYNC                 ; 3
;---------------------------------------
    cpy    #$56                  ; 2
    bcs    LF54D                 ; 2³
    lda    #$5E                  ; 2
    sta    ram_C0                ; 3
    lda    #<LF34C               ; 2
    sta    ram_BC                ; 3
    lda    #>LF34C               ; 2
    sta    ram_BD                ; 3
LF54D:
    jmp    LF051                 ; 3

    .byte $00 ; |        | $F550
    .byte $73 ; | XXX  XX| $F551
    .byte $72 ; | XXX  X | $F552
    .byte $92 ; |X  X  X | $F553
    .byte $3E ; |  XXXXX | $F554
    .byte $3E ; |  XXXXX | $F555
    .byte $3C ; |  XXXX  | $F556
    .byte $BC ; |X XXXX  | $F557
    .byte $BE ; |X XXXXX | $F558
    .byte $BF ; |X XXXXXX| $F559
    .byte $FD ; |XXXXXX X| $F55A
    .byte $7C ; | XXXXX  | $F55B
    .byte $38 ; |  XXX   | $F55C
    .byte $3C ; |  XXXX  | $F55D
    .byte $3C ; |  XXXX  | $F55E
    .byte $38 ; |  XXX   | $F55F
    .byte $3C ; |  XXXX  | $F560
    .byte $38 ; |  XXX   | $F561
    .byte $38 ; |  XXX   | $F562
    .byte $00 ; |        | $F563
    .byte $42 ; | X    X | $F564
    .byte $42 ; | X    X | $F565
    .byte $BD ; |X XXXX X| $F566
    .byte $FF ; |XXXXXXXX| $F567
    .byte $E7 ; |XXX  XXX| $F568
    .byte $E6 ; |XXX  XX | $F569
    .byte $E6 ; |XXX  XX | $F56A
    .byte $E7 ; |XXX  XXX| $F56B
    .byte $7F ; | XXXXXXX| $F56C
    .byte $20 ; |  X     | $F56D
    .byte $20 ; |  X     | $F56E
    .byte $20 ; |  X     | $F56F
    .byte $3C ; |  XXXX  | $F570
    .byte $08 ; |    X   | $F571
    .byte $00 ; |        | $F572
    .byte $1C ; |   XXX  | $F573
    .byte $3E ; |  XXXXX | $F574
    .byte $7F ; | XXXXXXX| $F575
    .byte $7F ; | XXXXXXX| $F576
    .byte $7F ; | XXXXXXX| $F577
    .byte $7D ; | XXXXX X| $F578
    .byte $79 ; | XXXX  X| $F579
    .byte $79 ; | XXXX  X| $F57A
    .byte $3E ; |  XXXXX | $F57B
    .byte $1C ; |   XXX  | $F57C
    .byte $08 ; |    X   | $F57D
    .byte $08 ; |    X   | $F57E
    .byte $08 ; |    X   | $F57F
    .byte $04 ; |     X  | $F580
    .byte $03 ; |      XX| $F581
    .byte $00 ; |        | $F582
    .byte $00 ; |        | $F583
    .byte $00 ; |        | $F584
    .byte $00 ; |        | $F585
    .byte $00 ; |        | $F586
    .byte $00 ; |        | $F587
    .byte $00 ; |        | $F588
    .byte $18 ; |   XX   | $F589
    .byte $18 ; |   XX   | $F58A
    .byte $10 ; |   X    | $F58B
    .byte $10 ; |   X    | $F58C
    .byte $10 ; |   X    | $F58D
    .byte $10 ; |   X    | $F58E
    .byte $50 ; | X X    | $F58F
    .byte $78 ; | XXXX   | $F590
    .byte $38 ; |  XXX   | $F591
    .byte $18 ; |   XX   | $F592
    .byte $1C ; |   XXX  | $F593
    .byte $1C ; |   XXX  | $F594
    .byte $3F ; |  XXXXXX| $F595
    .byte $3E ; |  XXXXX | $F596
    .byte $3C ; |  XXXX  | $F597
    .byte $1C ; |   XXX  | $F598
    .byte $1C ; |   XXX  | $F599
    .byte $08 ; |    X   | $F59A
    .byte $1C ; |   XXX  | $F59B
    .byte $1E ; |   XXXX | $F59C
    .byte $1C ; |   XXX  | $F59D
    .byte $1C ; |   XXX  | $F59E
    .byte $1E ; |   XXXX | $F59F
    .byte $1C ; |   XXX  | $F5A0
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
    .byte $20 ; |  X     | $F5AD
    .byte $40 ; | X      | $F5AE
    .byte $20 ; |  X     | $F5AF
    .byte $16 ; |   X XX | $F5B0
    .byte $24 ; |  X  X  | $F5B1
    .byte $44 ; | X   X  | $F5B2
    .byte $FC ; |XXXXXX  | $F5B3
    .byte $FC ; |XXXXXX  | $F5B4
    .byte $E0 ; |XXX     | $F5B5
    .byte $E0 ; |XXX     | $F5B6
    .byte $E4 ; |XXX  X  | $F5B7
    .byte $7C ; | XXXXX  | $F5B8
    .byte $7A ; | XXXX X | $F5B9
    .byte $39 ; |  XXX  X| $F5BA
    .byte $18 ; |   XX   | $F5BB
    .byte $1C ; |   XXX  | $F5BC
    .byte $1E ; |   XXXX | $F5BD
    .byte $1C ; |   XXX  | $F5BE
    .byte $1E ; |   XXXX | $F5BF
    .byte $1C ; |   XXX  | $F5C0
    .byte $00 ; |        | $F5C1
    .byte $00 ; |        | $F5C2
    .byte $00 ; |        | $F5C3
    .byte $00 ; |        | $F5C4
    .byte $00 ; |        | $F5C5
    .byte $00 ; |        | $F5C6
    .byte $00 ; |        | $F5C7
    .byte $80 ; |X       | $F5C8
    .byte $80 ; |X       | $F5C9
    .byte $80 ; |X       | $F5CA
    .byte $40 ; | X      | $F5CB
    .byte $44 ; | X   X  | $F5CC
    .byte $24 ; |  X  X  | $F5CD
    .byte $26 ; |  X  XX | $F5CE
    .byte $11 ; |   X   X| $F5CF
    .byte $13 ; |   X  XX| $F5D0
    .byte $1C ; |   XXX  | $F5D1
    .byte $1C ; |   XXX  | $F5D2
    .byte $1C ; |   XXX  | $F5D3
    .byte $79 ; | XXXX  X| $F5D4
    .byte $5F ; | X XXXXX| $F5D5
    .byte $78 ; | XXXX   | $F5D6
    .byte $38 ; |  XXX   | $F5D7
    .byte $10 ; |   X    | $F5D8
    .byte $38 ; |  XXX   | $F5D9
    .byte $3C ; |  XXXX  | $F5DA
    .byte $38 ; |  XXX   | $F5DB
    .byte $3C ; |  XXXX  | $F5DC
    .byte $38 ; |  XXX   | $F5DD
    .byte $00 ; |        | $F5DE
    .byte $00 ; |        | $F5DF
    .byte $00 ; |        | $F5E0
    .byte $00 ; |        | $F5E1
    .byte $00 ; |        | $F5E2
    .byte $00 ; |        | $F5E3
    .byte $00 ; |        | $F5E4
    .byte $00 ; |        | $F5E5
    .byte $03 ; |      XX| $F5E6
    .byte $04 ; |     X  | $F5E7
    .byte $08 ; |    X   | $F5E8
    .byte $16 ; |   X XX | $F5E9
    .byte $14 ; |   X X  | $F5EA
    .byte $28 ; |  X X   | $F5EB
    .byte $68 ; | XX X   | $F5EC
    .byte $F8 ; |XXXXX   | $F5ED
    .byte $E0 ; |XXX     | $F5EE
    .byte $E0 ; |XXX     | $F5EF
    .byte $E0 ; |XXX     | $F5F0
    .byte $E0 ; |XXX     | $F5F1
    .byte $E0 ; |XXX     | $F5F2
    .byte $E0 ; |XXX     | $F5F3
    .byte $E0 ; |XXX     | $F5F4
    .byte $F8 ; |XXXXX   | $F5F5
    .byte $74 ; | XXX X  | $F5F6
    .byte $32 ; |  XX  X | $F5F7
    .byte $11 ; |   X   X| $F5F8
    .byte $70 ; | XXX    | $F5F9
    .byte $78 ; | XXXX   | $F5FA
    .byte $70 ; | XXX    | $F5FB
    .byte $78 ; | XXXX   | $F5FC
    .byte $70 ; | XXX    | $F5FD
    .byte $00 ; |        | $F5FE
    .byte $0C ; |    XX  | $F5FF
    .byte $0C ; |    XX  | $F600
    .byte $08 ; |    X   | $F601
    .byte $08 ; |    X   | $F602
    .byte $08 ; |    X   | $F603
    .byte $18 ; |   XX   | $F604
    .byte $18 ; |   XX   | $F605
    .byte $18 ; |   XX   | $F606
    .byte $7C ; | XXXXX  | $F607
    .byte $FC ; |XXXXXX  | $F608
    .byte $FC ; |XXXXXX  | $F609
    .byte $F8 ; |XXXXX   | $F60A
    .byte $F8 ; |XXXXX   | $F60B
    .byte $FC ; |XXXXXX  | $F60C
    .byte $7C ; | XXXXX  | $F60D
    .byte $7F ; | XXXXXXX| $F60E
    .byte $3F ; |  XXXXXX| $F60F
    .byte $38 ; |  XXX   | $F610
    .byte $38 ; |  XXX   | $F611
    .byte $78 ; | XXXX   | $F612
    .byte $7C ; | XXXXX  | $F613
    .byte $7C ; | XXXXX  | $F614
    .byte $38 ; |  XXX   | $F615
    .byte $00 ; |        | $F616
    .byte $C0 ; |XX      | $F617
    .byte $80 ; |X       | $F618
    .byte $80 ; |X       | $F619
    .byte $46 ; | X   XX | $F61A
    .byte $44 ; | X   X  | $F61B
    .byte $4C ; | X  XX  | $F61C
    .byte $64 ; | XX  X  | $F61D
    .byte $64 ; | XX  X  | $F61E
    .byte $FC ; |XXXXXX  | $F61F
    .byte $FC ; |XXXXXX  | $F620
    .byte $F8 ; |XXXXX   | $F621
    .byte $F8 ; |XXXXX   | $F622
    .byte $78 ; | XXXX   | $F623
    .byte $7C ; | XXXXX  | $F624
    .byte $7F ; | XXXXXXX| $F625
    .byte $3E ; |  XXXXX | $F626
    .byte $39 ; |  XXX  X| $F627
    .byte $38 ; |  XXX   | $F628
    .byte $78 ; | XXXX   | $F629
    .byte $7C ; | XXXXX  | $F62A
    .byte $7C ; | XXXXX  | $F62B
    .byte $38 ; |  XXX   | $F62C
    .byte $00 ; |        | $F62D

LF62E:
    jsr    LFF85                 ; 6
    lda    #<LF53B               ; 2
    sta    ram_BC                ; 3
    lda    #>LF53B               ; 2
    sta    ram_BD                ; 3
    lda    #<LF320               ; 2
    sta    ram_BE                ; 3
    lda    #>LF320               ; 2
    sta    ram_BF                ; 3
    lda    ram_D0                ; 3
    lsr                          ; 2
    bcc    LF656                 ; 2³
    lda    #<LF6E8               ; 2
    sta    ram_BC                ; 3
    lda    #>LF6E8               ; 2
    sta    ram_BD                ; 3
    lda    #<LF6D9               ; 2
    sta    ram_BE                ; 3
    lda    #>LF6D9               ; 2
    sta    ram_BF                ; 3
LF656:
    jmp    LF505                 ; 3

    .byte $00 ; |        | $F659
    .byte $12 ; |   X  X | $F65A
    .byte $12 ; |   X  X | $F65B
    .byte $12 ; |   X  X | $F65C
    .byte $12 ; |   X  X | $F65D
    .byte $16 ; |   X XX | $F65E
    .byte $36 ; |  XX XX | $F65F
    .byte $34 ; |  XX X  | $F660
    .byte $34 ; |  XX X  | $F661
    .byte $3C ; |  XXXX  | $F662
    .byte $3C ; |  XXXX  | $F663
    .byte $1C ; |   XXX  | $F664
    .byte $1C ; |   XXX  | $F665
    .byte $18 ; |   XX   | $F666
    .byte $18 ; |   XX   | $F667
    .byte $38 ; |  XXX   | $F668
    .byte $3C ; |  XXXX  | $F669
    .byte $3C ; |  XXXX  | $F66A
    .byte $3E ; |  XXXXX | $F66B
    .byte $79 ; | XXXX  X| $F66C
    .byte $D9 ; |XX XX  X| $F66D
    .byte $9B ; |X  XX XX| $F66E
    .byte $BE ; |X XXXXX | $F66F
    .byte $5C ; | X XXX  | $F670
    .byte $78 ; | XXXX   | $F671
    .byte $38 ; |  XXX   | $F672
    .byte $82 ; |X     X | $F673
    .byte $08 ; |    X   | $F674
    .byte $00 ; |        | $F675
    .byte $20 ; |  X     | $F676
    .byte $02 ; |      X | $F677
    .byte $00 ; |        | $F678
    .byte $10 ; |   X    | $F679
    .byte $04 ; |     X  | $F67A
    .byte $00 ; |        | $F67B
    .byte $00 ; |        | $F67C
    .byte $3C ; |  XXXX  | $F67D
    .byte $18 ; |   XX   | $F67E
    .byte $18 ; |   XX   | $F67F
    .byte $18 ; |   XX   | $F680
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
    .byte $40 ; | X      | $F68B
    .byte $58 ; | X XX   | $F68C
    .byte $B8 ; |X XXX   | $F68D
    .byte $A0 ; |X X     | $F68E
    .byte $A0 ; |X X     | $F68F
    .byte $60 ; | XX     | $F690
    .byte $50 ; | X X    | $F691
    .byte $50 ; | X X    | $F692
    .byte $E0 ; |XXX     | $F693
    .byte $E0 ; |XXX     | $F694
    .byte $E0 ; |XXX     | $F695
    .byte $E0 ; |XXX     | $F696
    .byte $E0 ; |XXX     | $F697
    .byte $F8 ; |XXXXX   | $F698
    .byte $7C ; | XXXXX  | $F699
    .byte $36 ; |  XX XX | $F69A
    .byte $3A ; |  XXX X | $F69B
    .byte $3C ; |  XXXX  | $F69C
    .byte $38 ; |  XXX   | $F69D
    .byte $3C ; |  XXXX  | $F69E
    .byte $38 ; |  XXX   | $F69F
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
    .byte $40 ; | X      | $F6AE
    .byte $B0 ; |X XX    | $F6AF
    .byte $E0 ; |XXX     | $F6B0
    .byte $40 ; | X      | $F6B1
    .byte $E0 ; |XXX     | $F6B2
    .byte $FB ; |XXXXX XX| $F6B3
    .byte $FA ; |XXXXX X | $F6B4
    .byte $F2 ; |XXXX  X | $F6B5
    .byte $F4 ; |XXXX X  | $F6B6
    .byte $FC ; |XXXXXX  | $F6B7
    .byte $7C ; | XXXXX  | $F6B8
    .byte $3C ; |  XXXX  | $F6B9
    .byte $1C ; |   XXX  | $F6BA
    .byte $1E ; |   XXXX | $F6BB
    .byte $1C ; |   XXX  | $F6BC
    .byte $1E ; |   XXXX | $F6BD
    .byte $1C ; |   XXX  | $F6BE
    .byte $00 ; |        | $F6BF
    .byte $61 ; | XX    X| $F6C0
    .byte $61 ; | XX    X| $F6C1
    .byte $61 ; | XX    X| $F6C2
    .byte $61 ; | XX    X| $F6C3
    .byte $61 ; | XX    X| $F6C4
    .byte $61 ; | XX    X| $F6C5
    .byte $61 ; | XX    X| $F6C6
    .byte $61 ; | XX    X| $F6C7
    .byte $61 ; | XX    X| $F6C8
    .byte $61 ; | XX    X| $F6C9
    .byte $61 ; | XX    X| $F6CA
    .byte $61 ; | XX    X| $F6CB
    .byte $0F ; |    XXXX| $F6CC
    .byte $0F ; |    XXXX| $F6CD
    .byte $0F ; |    XXXX| $F6CE
    .byte $0F ; |    XXXX| $F6CF
    .byte $0F ; |    XXXX| $F6D0
    .byte $3E ; |  XXXXX | $F6D1
    .byte $3E ; |  XXXXX | $F6D2
    .byte $3E ; |  XXXXX | $F6D3
    .byte $3E ; |  XXXXX | $F6D4
    .byte $00 ; |        | $F6D5
    .byte $00 ; |        | $F6D6
    .byte $00 ; |        | $F6D7
    .byte $00 ; |        | $F6D8

LF6D9:  ; indirect jump
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP0                  ; 3
    lda    (ram_95),Y            ; 5
    sta    COLUP0                ; 3
    cpy    #$48                  ; 2
    bcc    LF723                 ; 2³+1
    jmp    LF0E8                 ; 3

LF6E8:  ; indirect jump
    sta    WSYNC                 ; 3
;---------------------------------------
    cpy    #$48                  ; 2
    bcc    LF6F1                 ; 2³
    jmp    LF051                 ; 3

LF6F1:
    dey                          ; 2
LF6F2:
    ldx    #$44                  ; 2
    cpy    ram_91                ; 3
    beq    LF72E                 ; 2³+1
LF6F8:
    sta    HMCLR                 ; 3
    lda    ram_E3                ; 3
    clc                          ; 2
    adc    ram_E0                ; 3
    sta    ram_E0                ; 3
    bcc    LF707                 ; 2³
    lda    ram_E4                ; 3
    sta    HMBL                  ; 3
LF707:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    dec    ram_E1                ; 5
    bpl    LF717                 ; 2³
    lda    #$02                  ; 2
    sta    ENABL                 ; 3
LF717:
    dex                          ; 2
    dey                          ; 2
    cpy    ram_91                ; 3
    beq    LF72E                 ; 2³
    cpy    #$1B                  ; 2
    beq    LF75D                 ; 2³
    bne    LF6F8                 ; 3+1   always branch

LF723:
    cpy    ram_92                ; 3
    beq    LF6F1                 ; 2³+1
    dey                          ; 2
    cpy    ram_92                ; 3
    beq    LF6F2                 ; 2³+1
    ldx    #$44                  ; 2
LF72E:
    sta    HMCLR                 ; 3
    lda    ram_E3                ; 3
    clc                          ; 2
    adc    ram_E0                ; 3
    sta    ram_E0                ; 3
    bcc    LF73D                 ; 2³
    lda    ram_E4                ; 3
    sta    HMBL                  ; 3
LF73D:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (ram_95),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_93),Y            ; 5
    sta    GRP0                  ; 3
    dec    ram_E1                ; 5
    bpl    LF751                 ; 2³
    lda    #$02                  ; 2
    sta    ENABL                 ; 3
LF751:
    dex                          ; 2
    dey                          ; 2
    cpy    #$1B                  ; 2
    beq    LF75D                 ; 2³
    cpy    ram_92                ; 3
    beq    LF6F8                 ; 2³+1
    bne    LF72E                 ; 3   always branch

LF75D:
    sta    HMCLR                 ; 3
    lda    ram_E3                ; 3
    clc                          ; 2
    adc    ram_E0                ; 3
    sta    ram_E0                ; 3
    jmp    LF7FD                 ; 3

    .byte $00 ; |        | $F769
    .byte $02 ; |      X | $F76A
    .byte $02 ; |      X | $F76B
    .byte $05 ; |     X X| $F76C
    .byte $45 ; | X   X X| $F76D
    .byte $48 ; | X  X   | $F76E
    .byte $68 ; | XX X   | $F76F
    .byte $38 ; |  XXX   | $F770
    .byte $78 ; | XXXX   | $F771
    .byte $F8 ; |XXXXX   | $F772
    .byte $F8 ; |XXXXX   | $F773
    .byte $F8 ; |XXXXX   | $F774
    .byte $F8 ; |XXXXX   | $F775
    .byte $78 ; | XXXX   | $F776
    .byte $7C ; | XXXXX  | $F777
    .byte $3D ; |  XXXX X| $F778
    .byte $3E ; |  XXXXX | $F779
    .byte $3F ; |  XXXXXX| $F77A
    .byte $38 ; |  XXX   | $F77B
    .byte $78 ; | XXXX   | $F77C
    .byte $7C ; | XXXXX  | $F77D
    .byte $7C ; | XXXXX  | $F77E
    .byte $38 ; |  XXX   | $F77F
    .byte $00 ; |        | $F780
    .byte $00 ; |        | $F781
    .byte $00 ; |        | $F782
    .byte $00 ; |        | $F783
    .byte $61 ; | XX    X| $F784
    .byte $61 ; | XX    X| $F785
    .byte $61 ; | XX    X| $F786
    .byte $61 ; | XX    X| $F787
    .byte $61 ; | XX    X| $F788
    .byte $61 ; | XX    X| $F789
    .byte $61 ; | XX    X| $F78A
    .byte $61 ; | XX    X| $F78B
    .byte $0F ; |    XXXX| $F78C
    .byte $0F ; |    XXXX| $F78D
    .byte $0F ; |    XXXX| $F78E
    .byte $0F ; |    XXXX| $F78F
    .byte $0F ; |    XXXX| $F790
    .byte $0F ; |    XXXX| $F791
    .byte $0F ; |    XXXX| $F792
    .byte $3E ; |  XXXXX | $F793
    .byte $3E ; |  XXXXX | $F794
    .byte $3E ; |  XXXXX | $F795
    .byte $3E ; |  XXXXX | $F796
    .byte $00 ; |        | $F797
    .byte $00 ; |        | $F798
    .byte $00 ; |        | $F799
    .byte $00 ; |        | $F79A
    .byte $00 ; |        | $F79B
    .byte $00 ; |        | $F79C
    .byte $00 ; |        | $F79D
    .byte $61 ; | XX    X| $F79E
    .byte $61 ; | XX    X| $F79F
    .byte $61 ; | XX    X| $F7A0
    .byte $61 ; | XX    X| $F7A1
    .byte $61 ; | XX    X| $F7A2
    .byte $61 ; | XX    X| $F7A3
    .byte $0F ; |    XXXX| $F7A4
    .byte $0F ; |    XXXX| $F7A5
    .byte $0F ; |    XXXX| $F7A6
    .byte $0F ; |    XXXX| $F7A7
    .byte $0F ; |    XXXX| $F7A8
    .byte $0F ; |    XXXX| $F7A9
    .byte $0F ; |    XXXX| $F7AA
    .byte $0F ; |    XXXX| $F7AB
    .byte $3E ; |  XXXXX | $F7AC
    .byte $3E ; |  XXXXX | $F7AD
    .byte $3E ; |  XXXXX | $F7AE
    .byte $3E ; |  XXXXX | $F7AF
    .byte $00 ; |        | $F7B0
    .byte $00 ; |        | $F7B1
    .byte $00 ; |        | $F7B2
    .byte $00 ; |        | $F7B3
    .byte $61 ; | XX    X| $F7B4
    .byte $61 ; | XX    X| $F7B5
    .byte $61 ; | XX    X| $F7B6
    .byte $61 ; | XX    X| $F7B7
    .byte $61 ; | XX    X| $F7B8
    .byte $61 ; | XX    X| $F7B9
    .byte $61 ; | XX    X| $F7BA
    .byte $61 ; | XX    X| $F7BB
    .byte $61 ; | XX    X| $F7BC
    .byte $0F ; |    XXXX| $F7BD
    .byte $0F ; |    XXXX| $F7BE
    .byte $0F ; |    XXXX| $F7BF
    .byte $0F ; |    XXXX| $F7C0
    .byte $0F ; |    XXXX| $F7C1
    .byte $0F ; |    XXXX| $F7C2
    .byte $0F ; |    XXXX| $F7C3
    .byte $0F ; |    XXXX| $F7C4
    .byte $3E ; |  XXXXX | $F7C5
    .byte $3E ; |  XXXXX | $F7C6
    .byte $3E ; |  XXXXX | $F7C7
    .byte $3E ; |  XXXXX | $F7C8
    .byte $00 ; |        | $F7C9
    .byte $00 ; |        | $F7CA
    .byte $61 ; | XX    X| $F7CB
    .byte $61 ; | XX    X| $F7CC
    .byte $61 ; | XX    X| $F7CD
    .byte $61 ; | XX    X| $F7CE
    .byte $61 ; | XX    X| $F7CF
    .byte $61 ; | XX    X| $F7D0
    .byte $61 ; | XX    X| $F7D1
    .byte $61 ; | XX    X| $F7D2
    .byte $61 ; | XX    X| $F7D3
    .byte $61 ; | XX    X| $F7D4
    .byte $61 ; | XX    X| $F7D5
    .byte $61 ; | XX    X| $F7D6
    .byte $61 ; | XX    X| $F7D7
    .byte $0F ; |    XXXX| $F7D8
    .byte $0F ; |    XXXX| $F7D9
    .byte $0F ; |    XXXX| $F7DA
    .byte $0F ; |    XXXX| $F7DB
    .byte $0F ; |    XXXX| $F7DC
    .byte $0F ; |    XXXX| $F7DD
    .byte $3E ; |  XXXXX | $F7DE
    .byte $3E ; |  XXXXX | $F7DF
    .byte $3E ; |  XXXXX | $F7E0
    .byte $00 ; |        | $F7E1
    .byte $00 ; |        | $F7E2
    .byte $00 ; |        | $F7E3
    .byte $61 ; | XX    X| $F7E4
    .byte $61 ; | XX    X| $F7E5
    .byte $61 ; | XX    X| $F7E6
    .byte $61 ; | XX    X| $F7E7
    .byte $61 ; | XX    X| $F7E8
    .byte $61 ; | XX    X| $F7E9
    .byte $61 ; | XX    X| $F7EA
    .byte $61 ; | XX    X| $F7EB
    .byte $61 ; | XX    X| $F7EC
    .byte $61 ; | XX    X| $F7ED
    .byte $61 ; | XX    X| $F7EE
    .byte $61 ; | XX    X| $F7EF
    .byte $0F ; |    XXXX| $F7F0
    .byte $0F ; |    XXXX| $F7F1
    .byte $0F ; |    XXXX| $F7F2
    .byte $0F ; |    XXXX| $F7F3
    .byte $0F ; |    XXXX| $F7F4
    .byte $3E ; |  XXXXX | $F7F5
    .byte $3E ; |  XXXXX | $F7F6
    .byte $3E ; |  XXXXX | $F7F7
    .byte $3E ; |  XXXXX | $F7F8
    .byte $3E ; |  XXXXX | $F7F9
    .byte $00 ; |        | $F7FA
    .byte $00 ; |        | $F7FB
    .byte $00 ; |        | $F7FC


LF7FD:
    bcc    LF803                 ; 2³+1
    lda    ram_E4                ; 3
    sta    HMBL                  ; 3
LF803:
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    tya                          ; 2
    and    #$01                  ; 2
    beq    LF81E                 ; 2³
    lda    LFB6D,Y               ; 4
    sta    PF1                   ; 3
    lda    (ram_ED),Y            ; 5
    sta    COLUBK                ; 3
    lda    LFB6E,Y               ; 4
    sta    PF2                   ; 3
LF81E:
    dey                          ; 2
    dex                          ; 2
    beq    LF825                 ; 2³
    jmp    LF75D                 ; 3

LF825:
    stx    ENABL                 ; 3
    stx    ram_E0                ; 3
    rts                          ; 6

LF82A:  ; indirect jump
    sta    WSYNC                 ; 3
;---------------------------------------
    cpy    ram_E4                ; 3
    bcs    LF846                 ; 2³
    ldx    ram_E1                ; 3
    lda    LF8E5,X               ; 4
    sta    COLUBK                ; 3
    inc    ram_E1                ; 5
    lda    ram_E4                ; 3
    sbc    #$1F                  ; 2
    bcs    LF841                 ; 2³
    lda    #$00                  ; 2
LF841:
    sta    ram_E4                ; 3
    jmp    LF051                 ; 3

LF846:
    tya                          ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
    clc                          ; 2
    adc    #$FF                  ; 2
    sta    ram_C0                ; 3
    sta    ram_C2                ; 3
    jmp    LF051                 ; 3

LF856:  ; indirect jump
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP0                  ; 3
    lda    (ram_95),Y            ; 5
    sta    COLUP0                ; 3
    cpy    ram_E4                ; 3
    bcs    LF878                 ; 2³
    ldx    ram_E1                ; 3
    lda    LF8E5,X               ; 4
    sta    COLUBK                ; 3
    inc    ram_E1                ; 5
    lda    ram_E4                ; 3
    sbc    #$1F                  ; 2
    bcs    LF873                 ; 2³
    lda    #$00                  ; 2
LF873:
    sta    ram_E4                ; 3
    jmp    LF0E8                 ; 3

LF878:
    tya                          ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
    clc                          ; 2
    adc    #$FF                  ; 2
    sta    ram_C0                ; 3
    sta    ram_C2                ; 3
    jmp    LF0E8                 ; 3

    .byte $00 ; |        | $F888
    .byte $00 ; |        | $F889
    .byte $00 ; |        | $F88A
    .byte $00 ; |        | $F88B
    .byte $00 ; |        | $F88C
    .byte $00 ; |        | $F88D
    .byte $00 ; |        | $F88E
    .byte $00 ; |        | $F88F
    .byte $00 ; |        | $F890
    .byte $20 ; |  X     | $F891
    .byte $20 ; |  X     | $F892
    .byte $30 ; |  XX    | $F893
    .byte $18 ; |   XX   | $F894
    .byte $0E ; |    XXX | $F895
    .byte $04 ; |     X  | $F896
    .byte $0C ; |    XX  | $F897
    .byte $1A ; |   XX X | $F898
    .byte $1F ; |   XXXXX| $F899
    .byte $5F ; | X XXXXX| $F89A
    .byte $78 ; | XXXX   | $F89B
    .byte $BC ; |X XXXX  | $F89C
    .byte $BE ; |X XXXXX | $F89D
    .byte $F8 ; |XXXXX   | $F89E
    .byte $71 ; | XXX   X| $F89F
    .byte $E0 ; |XXX     | $F8A0
    .byte $F0 ; |XXXX    | $F8A1
    .byte $E0 ; |XXX     | $F8A2
    .byte $E0 ; |XXX     | $F8A3
    .byte $00 ; |        | $F8A4
    .byte $00 ; |        | $F8A5
    .byte $F0 ; |XXXX    | $F8A6
    .byte $E0 ; |XXX     | $F8A7
    .byte $00 ; |        | $F8A8
    .byte $00 ; |        | $F8A9
    .byte $00 ; |        | $F8AA
    .byte $00 ; |        | $F8AB
    .byte $00 ; |        | $F8AC
    .byte $00 ; |        | $F8AD
    .byte $00 ; |        | $F8AE
    .byte $00 ; |        | $F8AF
    .byte $80 ; |X       | $F8B0
    .byte $80 ; |X       | $F8B1
    .byte $C0 ; |XX      | $F8B2
    .byte $63 ; | XX   XX| $F8B3
    .byte $33 ; |  XX  XX| $F8B4
    .byte $12 ; |   X  X | $F8B5
    .byte $12 ; |   X  X | $F8B6
    .byte $12 ; |   X  X | $F8B7
    .byte $1E ; |   XXXX | $F8B8
    .byte $1C ; |   XXX  | $F8B9
    .byte $38 ; |  XXX   | $F8BA
    .byte $3B ; |  XXX XX| $F8BB
    .byte $3F ; |  XXXXXX| $F8BC
    .byte $38 ; |  XXX   | $F8BD
    .byte $38 ; |  XXX   | $F8BE
    .byte $18 ; |   XX   | $F8BF
    .byte $38 ; |  XXX   | $F8C0
    .byte $3C ; |  XXXX  | $F8C1
    .byte $38 ; |  XXX   | $F8C2
    .byte $3C ; |  XXXX  | $F8C3
    .byte $38 ; |  XXX   | $F8C4
    .byte $00 ; |        | $F8C5
    .byte $00 ; |        | $F8C6
    .byte $00 ; |        | $F8C7
    .byte $00 ; |        | $F8C8
    .byte $00 ; |        | $F8C9
    .byte $00 ; |        | $F8CA
    .byte $00 ; |        | $F8CB
    .byte $00 ; |        | $F8CC
    .byte $02 ; |      X | $F8CD
    .byte $03 ; |      XX| $F8CE
    .byte $03 ; |      XX| $F8CF
    .byte $04 ; |     X  | $F8D0
    .byte $04 ; |     X  | $F8D1
    .byte $14 ; |   X X  | $F8D2
    .byte $24 ; |  X  X  | $F8D3
    .byte $34 ; |  XX X  | $F8D4
    .byte $1C ; |   XXX  | $F8D5
    .byte $0E ; |    XXX | $F8D6
    .byte $0E ; |    XXX | $F8D7
    .byte $1C ; |   XXX  | $F8D8
    .byte $9C ; |X  XXX  | $F8D9
    .byte $B8 ; |X XXX   | $F8DA
    .byte $B9 ; |X XXX  X| $F8DB
    .byte $FE ; |XXXXXXX | $F8DC
    .byte $E0 ; |XXX     | $F8DD
    .byte $F0 ; |XXXX    | $F8DE
    .byte $E0 ; |XXX     | $F8DF
    .byte $E0 ; |XXX     | $F8E0
    .byte $00 ; |        | $F8E1
    .byte $00 ; |        | $F8E2
    .byte $F0 ; |XXXX    | $F8E3
    .byte $E0 ; |XXX     | $F8E4
LF8E5:
    .byte $A8   ; $F8E5  colors
    .byte $02   ; $F8E6
    .byte $4A   ; $F8E7
    .byte $18   ; $F8E8
    .byte $62   ; $F8E9
    .byte $08   ; $F8EA
    .byte $82   ; $F8EB
    .byte $F8   ; $F8EC

LF8ED:
    clc                          ; 2
    lda    ram_E3                ; 3
    adc    #$20                  ; 2
    sta    ram_E4                ; 3
    lda    ram_E0                ; 3
    sta    ram_E1                ; 3
    ldx    #$03                  ; 2
LF8FA:
    lda    ram_E6,X              ; 4
    sta    ram_A0,X              ; 4
    lda    ram_EA,X              ; 4
    sta    ram_A4,X              ; 4
    dex                          ; 2
    bpl    LF8FA                 ; 2³+1
    lda    #$30                  ; 2
    sta    ram_88                ; 3
    jsr    LFF85                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    ram_E1                ; 3
    lda    LF8E5,X               ; 4
    sta    COLUBK                ; 3
    jmp    LF505                 ; 3

LF918:
    .byte $F2 ; |XXXX  X | $F918
    .byte $F1 ; |XXXX   X| $F919
    .byte $CA ; |XX  X X | $F91A
    .byte $F7 ; |XXXX XXX| $F91B
    .byte $DC ; |XX XXX  | $F91C
    .byte $F3 ; |XXXX  XX| $F91D
    .byte $D8 ; |XX XX   | $F91E
    .byte $F6 ; |XXXX XX | $F91F
    .byte $F9 ; |XXXXX  X| $F920
    .byte $F3 ; |XXXX  XX| $F921
    .byte $FC ; |XXXXXX  | $F922
    .byte $F7 ; |XXXX XXX| $F923
    .byte $A1 ; |X X    X| $F924
    .byte $F5 ; |XXXX X X| $F925
    .byte $FC ; |XXXXXX  | $F926
    .byte $F7 ; |XXXX XXX| $F927
    .byte $9E ; |X  XXXX | $F928
    .byte $F3 ; |XXXX  XX| $F929
    .byte $D8 ; |XX XX   | $F92A
    .byte $F6 ; |XXXX XX | $F92B
    .byte $C7 ; |XX   XXX| $F92C
    .byte $F8 ; |XXXXX   | $F92D
    .byte $D8 ; |XX XX   | $F92E
    .byte $F6 ; |XXXX XX | $F92F
    .byte $AC ; |X X XX  | $F930
    .byte $F2 ; |XXXX  X | $F931
    .byte $AC ; |X X XX  | $F932
    .byte $FA ; |XXXXX X | $F933
    .byte $C8 ; |XX  X   | $F934
    .byte $F2 ; |XXXX  X | $F935
    .byte $C5 ; |XX   X X| $F936
    .byte $FA ; |XXXXX X | $F937
    .byte $E1 ; |XXX    X| $F938
    .byte $F2 ; |XXXX  X | $F939
    .byte $DE ; |XX XXXX | $F93A
    .byte $FA ; |XXXXX X | $F93B
    .byte $FD ; |XXXXXX X| $F93C
    .byte $F2 ; |XXXX  X | $F93D
    .byte $D0 ; |XX X    | $F93E
    .byte $F9 ; |XXXXX  X| $F93F
    .byte $C0 ; |XX      | $F940
    .byte $F5 ; |XXXX X X| $F941
    .byte $C7 ; |XX   XXX| $F942
    .byte $F0 ; |XXXX    | $F943
    .byte $A0 ; |X X     | $F944
    .byte $F6 ; |XXXX XX | $F945
    .byte $C7 ; |XX   XXX| $F946
    .byte $F0 ; |XXXX    | $F947
    .byte $A7 ; |X X  XXX| $F948
    .byte $F8 ; |XXXXX   | $F949
    .byte $D8 ; |XX XX   | $F94A
    .byte $F6 ; |XXXX XX | $F94B
    .byte $AC ; |X X XX  | $F94C
    .byte $F2 ; |XXXX  X | $F94D
    .byte $AC ; |X X XX  | $F94E
    .byte $FA ; |XXXXX X | $F94F
    .byte $C8 ; |XX  X   | $F950
    .byte $F2 ; |XXXX  X | $F951
    .byte $C5 ; |XX   X X| $F952
    .byte $FA ; |XXXXX X | $F953
    .byte $EC ; |XXX XX  | $F954
    .byte $F9 ; |XXXXX  X| $F955
    .byte $98 ; |X  XX   | $F956
    .byte $F7 ; |XXXX XXX| $F957
    .byte $C0 ; |XX      | $F958
    .byte $F5 ; |XXXX X X| $F959
    .byte $C7 ; |XX   XXX| $F95A
    .byte $F0 ; |XXXX    | $F95B
    .byte $FD ; |XXXXXX X| $F95C
    .byte $F5 ; |XXXX X X| $F95D
    .byte $CA ; |XX  X X | $F95E
    .byte $F7 ; |XXXX XXX| $F95F
    .byte $A0 ; |X X     | $F960
    .byte $F6 ; |XXXX XX | $F961
    .byte $E3 ; |XXX   XX| $F962
    .byte $F7 ; |XXXX XXX| $F963
    .byte $BF ; |X XXXXXX| $F964
    .byte $F6 ; |XXXX XX | $F965
    .byte $E3 ; |XXX   XX| $F966
    .byte $F7 ; |XXXX XXX| $F967
    .byte $AC ; |X X XX  | $F968
    .byte $F2 ; |XXXX  X | $F969
    .byte $AC ; |X X XX  | $F96A
    .byte $FA ; |XXXXX X | $F96B
    .byte $DC ; |XX XXX  | $F96C
    .byte $F3 ; |XXXX  XX| $F96D
    .byte $D8 ; |XX XX   | $F96E
    .byte $F6 ; |XXXX XX | $F96F
    .byte $A7 ; |X X  XXX| $F970
    .byte $F8 ; |XXXXX   | $F971
    .byte $D8 ; |XX XX   | $F972
    .byte $F6 ; |XXXX XX | $F973
    .byte $E4 ; |XXX  X  | $F974
    .byte $F8 ; |XXXXX   | $F975
    .byte $D8 ; |XX XX   | $F976
    .byte $F6 ; |XXXX XX | $F977
    .byte $DC ; |XX XXX  | $F978
    .byte $F3 ; |XXXX  XX| $F979
    .byte $D8 ; |XX XX   | $F97A
    .byte $F6 ; |XXXX XX | $F97B
    .byte $BC ; |X XXXX  | $F97C
    .byte $F3 ; |XXXX  XX| $F97D
    .byte $D8 ; |XX XX   | $F97E
    .byte $F6 ; |XXXX XX | $F97F
    .byte $A7 ; |X X  XXX| $F980
    .byte $F8 ; |XXXXX   | $F981
    .byte $D8 ; |XX XX   | $F982
    .byte $F6 ; |XXXX XX | $F983
    .byte $AC ; |X X XX  | $F984
    .byte $F2 ; |XXXX  X | $F985
    .byte $AC ; |X X XX  | $F986
    .byte $FA ; |XXXXX X | $F987
    .byte $C8 ; |XX  X   | $F988
    .byte $F2 ; |XXXX  X | $F989
    .byte $C5 ; |XX   X X| $F98A
    .byte $FA ; |XXXXX X | $F98B
    .byte $BF ; |X XXXXXX| $F98C
    .byte $F6 ; |XXXX XX | $F98D
    .byte $E3 ; |XXX   XX| $F98E
    .byte $F7 ; |XXXX XXX| $F98F
    .byte $C8 ; |XX  X   | $F990
    .byte $F2 ; |XXXX  X | $F991
    .byte $C5 ; |XX   X X| $F992
    .byte $FA ; |XXXXX X | $F993
    .byte $AC ; |X X XX  | $F994
    .byte $F2 ; |XXXX  X | $F995
    .byte $AC ; |X X XX  | $F996
    .byte $FA ; |XXXXX X | $F997
    .byte $AC ; |X X XX  | $F998
    .byte $F2 ; |XXXX  X | $F999
    .byte $AC ; |X X XX  | $F99A
    .byte $FA ; |XXXXX X | $F99B
    .byte $C8 ; |XX  X   | $F99C
    .byte $F2 ; |XXXX  X | $F99D
    .byte $C5 ; |XX   X X| $F99E
    .byte $FA ; |XXXXX X | $F99F
    .byte $E1 ; |XXX    X| $F9A0
    .byte $F2 ; |XXXX  X | $F9A1
    .byte $DE ; |XX XXXX | $F9A2
    .byte $FA ; |XXXXX X | $F9A3
    .byte $FD ; |XXXXXX X| $F9A4
    .byte $F2 ; |XXXX  X | $F9A5
    .byte $D0 ; |XX X    | $F9A6
    .byte $F9 ; |XXXXX  X| $F9A7
    .byte $A0 ; |X X     | $F9A8
    .byte $F6 ; |XXXX XX | $F9A9
    .byte $E3 ; |XXX   XX| $F9AA
    .byte $F7 ; |XXXX XXX| $F9AB
    .byte $E1 ; |XXX    X| $F9AC
    .byte $F2 ; |XXXX  X | $F9AD
    .byte $DE ; |XX XXXX | $F9AE
    .byte $FA ; |XXXXX X | $F9AF
    .byte $C8 ; |XX  X   | $F9B0
    .byte $F2 ; |XXXX  X | $F9B1
    .byte $C5 ; |XX   X X| $F9B2
    .byte $FA ; |XXXXX X | $F9B3
    .byte $AC ; |X X XX  | $F9B4
    .byte $F2 ; |XXXX  X | $F9B5
    .byte $AC ; |X X XX  | $F9B6
    .byte $FA ; |XXXXX X | $F9B7

NOTHING_ELSE = 0

  IF NOTHING_ELSE

    .word LF1F2          ; $F918
    .word LF7CA          ; $F91A
    .word LF3DC          ; $F91C
    .word LF6D8          ; $F91E
    .word LF3F9          ; $F920
    .word LF7FC          ; $F922
    .word LF5A1          ; $F924
    .word LF7FC          ; $F926
    .word LF39E          ; $F928
    .word LF6D8          ; $F92A
    .word LF8C7          ; $F92C
    .word LF6D8          ; $F92E
    .word LF2AC          ; $F930
    .word LFAAC          ; $F932
    .word LF2C8          ; $F934
    .word LFAC5          ; $F936
    .word LF2E1          ; $F938
    .word LFADE          ; $F93A
    .word LF2FD          ; $F93C
    .word LF9D0          ; $F93E
    .word LF5C0          ; $F940
    .word LF0C7          ; $F942
    .word LF6A0          ; $F944
    .word LF0C7          ; $F946
    .word LF8A7          ; $F948
    .word LF6D8          ; $F94A
    .word LF2AC          ; $F94C
    .word LFAAC          ; $F94E
    .word LF2C8          ; $F950
    .word LFAC5          ; $F952
    .word LF9EC          ; $F954
    .word LF798          ; $F956
    .word LF5C0          ; $F958
    .word LF0C7          ; $F95A
    .word LF5FD          ; $F95C
    .word LF7CA          ; $F95E
    .word LF6A0          ; $F960
    .word LF7E3          ; $F962
    .word LF6BF          ; $F964
    .word LF7E3          ; $F966
    .word LF2AC          ; $F968
    .word LFAAC          ; $F96A
    .word LF3DC          ; $F96C
    .word LF6D8          ; $F96E
    .word LF8A7          ; $F970
    .word LF6D8          ; $F972
    .word LF8E4          ; $F974
    .word LF6D8          ; $F976
    .word LF3DC          ; $F978
    .word LF6D8          ; $F97A

LF0C7
LF1F2
LF2AC
LF2C8
LF2E1
LF2FD
LF39E
LF3DC
LF3F9
LF5A1
LF5C0
LF5FD
LF6A0
LF6BF
LF6D8
LF798
LF7CA
LF7E3
LF7FC
LF8A7
LF8C7
LF8E4
LF9D0
LF9EC
LFAAC
LFAC5
LFADE

  ENDIF



    .byte $61 ; | XX    X| $F9B8
    .byte $61 ; | XX    X| $F9B9
    .byte $61 ; | XX    X| $F9BA
    .byte $61 ; | XX    X| $F9BB
    .byte $61 ; | XX    X| $F9BC
    .byte $61 ; | XX    X| $F9BD
    .byte $61 ; | XX    X| $F9BE
    .byte $61 ; | XX    X| $F9BF
    .byte $61 ; | XX    X| $F9C0
    .byte $61 ; | XX    X| $F9C1
    .byte $61 ; | XX    X| $F9C2
    .byte $61 ; | XX    X| $F9C3
    .byte $0F ; |    XXXX| $F9C4
    .byte $0F ; |    XXXX| $F9C5
    .byte $0F ; |    XXXX| $F9C6
    .byte $0F ; |    XXXX| $F9C7
    .byte $0F ; |    XXXX| $F9C8
    .byte $0F ; |    XXXX| $F9C9
    .byte $3E ; |  XXXXX | $F9CA
    .byte $3E ; |  XXXXX | $F9CB
    .byte $3E ; |  XXXXX | $F9CC
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
    .byte $03 ; |      XX| $F9D7
    .byte $04 ; |     X  | $F9D8
    .byte $08 ; |    X   | $F9D9
    .byte $10 ; |   X    | $F9DA
    .byte $20 ; |  X     | $F9DB
    .byte $43 ; | X    XX| $F9DC
    .byte $C2 ; |XX    X | $F9DD
    .byte $FC ; |XXXXXX  | $F9DE
    .byte $E0 ; |XXX     | $F9DF
    .byte $E0 ; |XXX     | $F9E0
    .byte $E0 ; |XXX     | $F9E1
    .byte $E0 ; |XXX     | $F9E2
    .byte $E3 ; |XXX   XX| $F9E3
    .byte $E4 ; |XXX  X  | $F9E4
    .byte $FB ; |XXXXX XX| $F9E5
    .byte $70 ; | XXX    | $F9E6
    .byte $38 ; |  XXX   | $F9E7
    .byte $74 ; | XXX X  | $F9E8
    .byte $7A ; | XXXX X | $F9E9
    .byte $72 ; | XXX  X | $F9EA
    .byte $79 ; | XXXX  X| $F9EB
    .byte $71 ; | XXX   X| $F9EC
    .byte $00 ; |        | $F9ED
    .byte $A5 ; |X X  X X| $F9EE
    .byte $66 ; | XX  XX | $F9EF
    .byte $7E ; | XXXXXX | $F9F0
    .byte $7F ; | XXXXXXX| $F9F1
    .byte $FF ; |XXXXXXXX| $F9F2
    .byte $7E ; | XXXXXX | $F9F3
    .byte $7D ; | XXXXX X| $F9F4
    .byte $00 ; |        | $F9F5
    .byte $00 ; |        | $F9F6
    .byte $D4 ; |XX X X  | $F9F7
    .byte $76 ; | XXX XX | $F9F8
    .byte $23 ; |  X   XX| $F9F9
    .byte $44 ; | X   X  | $F9FA
    .byte $CC ; |XX  XX  | $F9FB
    .byte $78 ; | XXXX   | $F9FC
    .byte $30 ; |  XX    | $F9FD
    .byte $1C ; |   XXX  | $F9FE
    .byte $1E ; |   XXXX | $F9FF
    .byte $1E ; |   XXXX | $FA00
    .byte $59 ; | X XX  X| $FA01
    .byte $BA ; |X XXX X | $FA02
    .byte $7C ; | XXXXX  | $FA03
    .byte $38 ; |  XXX   | $FA04
    .byte $18 ; |   XX   | $FA05
    .byte $3C ; |  XXXX  | $FA06
    .byte $BC ; |X XXXX  | $FA07
    .byte $58 ; | X XX   | $FA08
    .byte $00 ; |        | $FA09
    .byte $22 ; |  X   X | $FA0A
    .byte $22 ; |  X   X | $FA0B
    .byte $22 ; |  X   X | $FA0C
    .byte $DD ; |XX XXX X| $FA0D
    .byte $7F ; | XXXXXXX| $FA0E
    .byte $7F ; | XXXXXXX| $FA0F
    .byte $FF ; |XXXXXXXX| $FA10
    .byte $A5 ; |X X  X X| $FA11
    .byte $A0 ; |X X     | $FA12
    .byte $38 ; |  XXX   | $FA13
    .byte $38 ; |  XXX   | $FA14
    .byte $00 ; |        | $FA15
    .byte $F0 ; |XXXX    | $FA16
    .byte $F8 ; |XXXXX   | $FA17
    .byte $FC ; |XXXXXX  | $FA18
    .byte $FE ; |XXXXXXX | $FA19
    .byte $FF ; |XXXXXXXX| $FA1A
    .byte $80 ; |X       | $FA1B
    .byte $C0 ; |XX      | $FA1C
    .byte $C0 ; |XX      | $FA1D
    .byte $C0 ; |XX      | $FA1E
LFA1F:
    .byte $1A ; |   XX X | $FA1F
    .byte $00 ; |        | $FA20
    .byte $42 ; | X    X | $FA21
    .byte $0C ; |    XX  | $FA22
    .byte $F2 ; |XXXX  X | $FA23
    .byte $44 ; | X   X  | $FA24
    .byte $F0 ; |XXXX    | $FA25
    .byte $66 ; | XX  XX | $FA26
    .byte $54 ; | X X X  | $FA27
    .byte $56 ; | X X XX | $FA28
    .byte $57 ; | X X XXX| $FA29
    .byte $5A ; | X XX X | $FA2A
    .byte $47 ; | X   XXX| $FA2B
    .byte $3C ; |  XXXX  | $FA2C
    .byte $42 ; | X    X | $FA2D
    .byte $42 ; | X    X | $FA2E
    .byte $42 ; | X    X | $FA2F
    .byte $3C ; |  XXXX  | $FA30
    .byte $1C ; |   XXX  | $FA31
    .byte $08 ; |    X   | $FA32
    .byte $08 ; |    X   | $FA33
    .byte $08 ; |    X   | $FA34
    .byte $18 ; |   XX   | $FA35
    .byte $7E ; | XXXXXX | $FA36
    .byte $20 ; |  X     | $FA37
    .byte $1C ; |   XXX  | $FA38
    .byte $42 ; | X    X | $FA39
    .byte $3C ; |  XXXX  | $FA3A
    .byte $3C ; |  XXXX  | $FA3B
    .byte $02 ; |      X | $FA3C
    .byte $1C ; |   XXX  | $FA3D
    .byte $02 ; |      X | $FA3E
    .byte $3C ; |  XXXX  | $FA3F
    .byte $04 ; |     X  | $FA40
    .byte $04 ; |     X  | $FA41
    .byte $7E ; | XXXXXX | $FA42
    .byte $44 ; | X   X  | $FA43
    .byte $40 ; | X      | $FA44
    .byte $7C ; | XXXXX  | $FA45
    .byte $02 ; |      X | $FA46
    .byte $7C ; | XXXXX  | $FA47
    .byte $40 ; | X      | $FA48
    .byte $7C ; | XXXXX  | $FA49
    .byte $3C ; |  XXXX  | $FA4A
    .byte $46 ; | X   XX | $FA4B
    .byte $7C ; | XXXXX  | $FA4C
    .byte $40 ; | X      | $FA4D
    .byte $3C ; |  XXXX  | $FA4E
    .byte $08 ; |    X   | $FA4F
    .byte $08 ; |    X   | $FA50
    .byte $04 ; |     X  | $FA51
    .byte $02 ; |      X | $FA52
    .byte $7E ; | XXXXXX | $FA53
    .byte $3C ; |  XXXX  | $FA54
    .byte $42 ; | X    X | $FA55
    .byte $3C ; |  XXXX  | $FA56
    .byte $42 ; | X    X | $FA57
    .byte $3C ; |  XXXX  | $FA58
    .byte $02 ; |      X | $FA59
    .byte $02 ; |      X | $FA5A
    .byte $3E ; |  XXXXX | $FA5B
    .byte $42 ; | X    X | $FA5C
    .byte $3C ; |  XXXX  | $FA5D
LFA5E:
    .byte $2C ; |  X XX  | $FA5E
    .byte $31 ; |  XX   X| $FA5F
    .byte $36 ; |  XX XX | $FA60
    .byte $3B ; |  XXX XX| $FA61
    .byte $40 ; | X      | $FA62
    .byte $45 ; | X   X X| $FA63
    .byte $4A ; | X  X X | $FA64
    .byte $4F ; | X  XXXX| $FA65
    .byte $54 ; | X X X  | $FA66
    .byte $59 ; | X XX  X| $FA67
LFA68:
    .byte $00 ; |        | $FA68
    .byte $E1 ; |XXX    X| $FA69
    .byte $21 ; |  X    X| $FA6A
    .byte $21 ; |  X    X| $FA6B
    .byte $21 ; |  X    X| $FA6C
    .byte $3C ; |  XXXX  | $FA6D
    .byte $24 ; |  X  X  | $FA6E
    .byte $24 ; |  X  X  | $FA6F
    .byte $3C ; |  XXXX  | $FA70
    .byte $00 ; |        | $FA71
LFA72:
    .byte $00 ; |        | $FA72
    .byte $E8 ; |XXX X   | $FA73
    .byte $28 ; |  X X   | $FA74
    .byte $28 ; |  X X   | $FA75
    .byte $EE ; |XXX XXX | $FA76
    .byte $08 ; |    X   | $FA77
    .byte $00 ; |        | $FA78
    .byte $00 ; |        | $FA79
    .byte $00 ; |        | $FA7A
    .byte $00 ; |        | $FA7B
LFA7C:
    .byte $00 ; |        | $FA7C
    .byte $92 ; |X  X  X | $FA7D
    .byte $A2 ; |X X   X | $FA7E
    .byte $C2 ; |XX    X | $FA7F
    .byte $A7 ; |X X  XXX| $FA80
    .byte $94 ; |X  X X  | $FA81
    .byte $00 ; |        | $FA82
    .byte $00 ; |        | $FA83
    .byte $00 ; |        | $FA84
    .byte $00 ; |        | $FA85
LFA86:
    .byte $00 ; |        | $FA86
    .byte $0E ; |    XXX | $FA87
    .byte $02 ; |      X | $FA88
    .byte $0E ; |    XXX | $FA89
    .byte $88 ; |X   X   | $FA8A
    .byte $AE ; |X X XXX | $FA8B
    .byte $A0 ; |X X     | $FA8C
    .byte $00 ; |        | $FA8D
    .byte $00 ; |        | $FA8E
    .byte $00 ; |        | $FA8F
    .byte $83 ; |X     XX| $FA90
    .byte $C1 ; |XX     X| $FA91
    .byte $01 ; |       X| $FA92
    .byte $80 ; |X       | $FA93
    .byte $61 ; | XX    X| $FA94
    .byte $61 ; | XX    X| $FA95
    .byte $61 ; | XX    X| $FA96
    .byte $61 ; | XX    X| $FA97
    .byte $61 ; | XX    X| $FA98
    .byte $61 ; | XX    X| $FA99
    .byte $61 ; | XX    X| $FA9A
    .byte $61 ; | XX    X| $FA9B
    .byte $61 ; | XX    X| $FA9C
    .byte $61 ; | XX    X| $FA9D
    .byte $61 ; | XX    X| $FA9E
    .byte $0F ; |    XXXX| $FA9F
    .byte $0F ; |    XXXX| $FAA0
    .byte $0F ; |    XXXX| $FAA1
    .byte $0F ; |    XXXX| $FAA2
    .byte $0F ; |    XXXX| $FAA3
    .byte $3E ; |  XXXXX | $FAA4
    .byte $3E ; |  XXXXX | $FAA5
    .byte $3E ; |  XXXXX | $FAA6
    .byte $00 ; |        | $FAA7
    .byte $00 ; |        | $FAA8
    .byte $00 ; |        | $FAA9
    .byte $00 ; |        | $FAAA
    .byte $00 ; |        | $FAAB
    .byte $00 ; |        | $FAAC
    .byte $61 ; | XX    X| $FAAD
    .byte $61 ; | XX    X| $FAAE
    .byte $61 ; | XX    X| $FAAF
    .byte $61 ; | XX    X| $FAB0
    .byte $61 ; | XX    X| $FAB1
    .byte $61 ; | XX    X| $FAB2
    .byte $61 ; | XX    X| $FAB3
    .byte $61 ; | XX    X| $FAB4
    .byte $61 ; | XX    X| $FAB5
    .byte $61 ; | XX    X| $FAB6
    .byte $0F ; |    XXXX| $FAB7
    .byte $0F ; |    XXXX| $FAB8
    .byte $0F ; |    XXXX| $FAB9
    .byte $0F ; |    XXXX| $FABA
    .byte $3E ; |  XXXXX | $FABB
    .byte $3E ; |  XXXXX | $FABC
    .byte $00 ; |        | $FABD
    .byte $00 ; |        | $FABE
    .byte $00 ; |        | $FABF
    .byte $00 ; |        | $FAC0
    .byte $00 ; |        | $FAC1
    .byte $00 ; |        | $FAC2
    .byte $00 ; |        | $FAC3
    .byte $00 ; |        | $FAC4
    .byte $00 ; |        | $FAC5
    .byte $61 ; | XX    X| $FAC6
    .byte $61 ; | XX    X| $FAC7
    .byte $61 ; | XX    X| $FAC8
    .byte $61 ; | XX    X| $FAC9
    .byte $61 ; | XX    X| $FACA
    .byte $61 ; | XX    X| $FACB
    .byte $61 ; | XX    X| $FACC
    .byte $61 ; | XX    X| $FACD
    .byte $61 ; | XX    X| $FACE
    .byte $61 ; | XX    X| $FACF
    .byte $61 ; | XX    X| $FAD0
    .byte $0F ; |    XXXX| $FAD1
    .byte $0F ; |    XXXX| $FAD2
    .byte $0F ; |    XXXX| $FAD3
    .byte $0F ; |    XXXX| $FAD4
    .byte $0F ; |    XXXX| $FAD5
    .byte $3E ; |  XXXXX | $FAD6
    .byte $3E ; |  XXXXX | $FAD7
    .byte $3E ; |  XXXXX | $FAD8
    .byte $00 ; |        | $FAD9
    .byte $00 ; |        | $FADA
    .byte $00 ; |        | $FADB
    .byte $00 ; |        | $FADC
    .byte $00 ; |        | $FADD
    .byte $00 ; |        | $FADE
    .byte $FF ; |XXXXXXXX| $FADF
    .byte $FF ; |XXXXXXXX| $FAE0
    .byte $FF ; |XXXXXXXX| $FAE1
    .byte $FF ; |XXXXXXXX| $FAE2
    .byte $7E ; | XXXXXX | $FAE3
    .byte $18 ; |   XX   | $FAE4
    .byte $00 ; |        | $FAE5
    .byte $00 ; |        | $FAE6
    .byte $00 ; |        | $FAE7
    .byte $00 ; |        | $FAE8
    .byte $DE ; |XX XXXX | $FAE9
    .byte $BE ; |X XXXXX | $FAEA
    .byte $DE ; |XX XXXX | $FAEB
LFAEC:
    .byte $BE ; |X XXXXX | $FAEC
    .byte $10 ; |   X    | $FAED
    .byte $FF ; |XXXXXXXX| $FAEE
    .byte $00 ; |        | $FAEF
    .byte $00 ; |        | $FAF0
    .byte $00 ; |        | $FAF1
    .byte $00 ; |        | $FAF2
LFAF3:
    .byte $00 ; |        | $FAF3
    .byte $08 ; |    X   | $FAF4
    .byte $FF ; |XXXXXXXX| $FAF5
    .byte $FC ; |XXXXXX  | $FAF6
    .byte $FC ; |XXXXXX  | $FAF7
    .byte $FC ; |XXXXXX  | $FAF8
    .byte $FC ; |XXXXXX  | $FAF9
LFAFA:
    .byte $FC ; |XXXXXX  | $FAFA
    .byte $00 ; |        | $FAFB
    .byte $00 ; |        | $FAFC
    .byte $00 ; |        | $FAFD
    .byte $EE ; |XXX XXX | $FAFE
    .byte $00 ; |        | $FAFF
    .byte $EE ; |XXX XXX | $FB00
LFB01:
    .byte $00 ; |        | $FB01
    .byte $00 ; |        | $FB02
    .byte $00 ; |        | $FB03
    .byte $FF ; |XXXXXXXX| $FB04
    .byte $00 ; |        | $FB05
    .byte $00 ; |        | $FB06
    .byte $00 ; |        | $FB07
LFB08:
    .byte $00 ; |        | $FB08
    .byte $00 ; |        | $FB09
    .byte $02 ; |      X | $FB0A
    .byte $0A ; |    X X | $FB0B
    .byte $01 ; |       X| $FB0C
    .byte $00 ; |        | $FB0D
    .byte $01 ; |       X| $FB0E
    .byte $00 ; |        | $FB0F
LFB10:
    .byte $04 ; |     X  | $FB10
    .byte $50 ; | X X    | $FB11
    .byte $40 ; | X      | $FB12
    .byte $42 ; | X    X | $FB13
    .byte $32 ; |  XX  X | $FB14
    .byte $34 ; |  XX X  | $FB15
    .byte $36 ; |  XX XX | $FB16
    .byte $38 ; |  XXX   | $FB17
    .byte $1A ; |   XX X | $FB18
    .byte $1D ; |   XXX X| $FB19
    .byte $D0 ; |XX X    | $FB1A
    .byte $0F ; |    XXXX| $FB1B
    .byte $0F ; |    XXXX| $FB1C
    .byte $94 ; |X  X X  | $FB1D
    .byte $98 ; |X  XX   | $FB1E
    .byte $94 ; |X  X X  | $FB1F
    .byte $92 ; |X  X  X | $FB20
    .byte $95 ; |X  X X X| $FB21
LFB22:
    .byte $FB ; |XXXXX XX| $FB22
    .byte $F4 ; |XXXX X  | $FB23
    .byte $FC ; |XXXXXX  | $FB24
LFB25:
    .byte $80 ; |X       | $FB25
    .byte $80 ; |X       | $FB26
    .byte $7F ; | XXXXXXX| $FB27
LFB28:
    .byte $91 ; |X  X   X| $FB28
    .byte $08 ; |    X   | $FB29
    .byte $93 ; |X  X  XX| $FB2A

LFB2B:
    .byte <LF82A         ; $FB2B
    .byte <LF045         ; $FB2C
LFB2D:
    .byte >LF82A         ; $FB2D
    .byte >LF045         ; $FB2E

LFB2F:
    .byte <LF856         ; $FB2F
    .byte <LF0D6         ; $FB30
LFB31:
    .byte >LF856         ; $FB31
    .byte >LF0D6         ; $FB32

LFB33:
    tax                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    txa                          ; 2
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LFA5E,X               ; 4
    ldx    LFA5E,Y               ; 4
    rts                          ; 6

    .byte $00 ; |        | $FB44
    .byte $60 ; | XX     | $FB45
    .byte $E0 ; |XXX     | $FB46
    .byte $3F ; |  XXXXXX| $FB47
    .byte $3F ; |  XXXXXX| $FB48
    .byte $E0 ; |XXX     | $FB49
    .byte $60 ; | XX     | $FB4A
    .byte $00 ; |        | $FB4B
    .byte $07 ; |     XXX| $FB4C
    .byte $1C ; |   XXX  | $FB4D
    .byte $32 ; |  XX  X | $FB4E
    .byte $63 ; | XX   XX| $FB4F
    .byte $63 ; | XX   XX| $FB50
    .byte $65 ; | XX  X X| $FB51
    .byte $FA ; |XXXXX X | $FB52
    .byte $9C ; |X  XXX  | $FB53
    .byte $00 ; |        | $FB54
    .byte $7F ; | XXXXXXX| $FB55
    .byte $7F ; | XXXXXXX| $FB56
    .byte $7F ; | XXXXXXX| $FB57
    .byte $7F ; | XXXXXXX| $FB58
    .byte $7F ; | XXXXXXX| $FB59
    .byte $7F ; | XXXXXXX| $FB5A
    .byte $08 ; |    X   | $FB5B
    .byte $08 ; |    X   | $FB5C
    .byte $7F ; | XXXXXXX| $FB5D
    .byte $00 ; |        | $FB5E
    .byte $07 ; |     XXX| $FB5F
    .byte $06 ; |     XX | $FB60
    .byte $04 ; |     X  | $FB61
    .byte $FF ; |XXXXXXXX| $FB62
    .byte $FE ; |XXXXXXX | $FB63
    .byte $04 ; |     X  | $FB64
    .byte $06 ; |     XX | $FB65
    .byte $07 ; |     XXX| $FB66
    .byte $00 ; |        | $FB67
    .byte $FF ; |XXXXXXXX| $FB68
    .byte $BD ; |X XXXX X| $FB69
    .byte $00 ; |        | $FB6A
    .byte $3C ; |  XXXX  | $FB6B
    .byte $3C ; |  XXXX  | $FB6C
LFB6D:
    .byte $3C ; |  XXXX  | $FB6D
LFB6E:
    .byte $FF ; |XXXXXXXX| $FB6E
    .byte $FF ; |XXXXXXXX| $FB6F
    .byte $FF ; |XXXXXXXX| $FB70
    .byte $FF ; |XXXXXXXX| $FB71
    .byte $FF ; |XXXXXXXX| $FB72
    .byte $7F ; | XXXXXXX| $FB73
    .byte $FD ; |XXXXXX X| $FB74
    .byte $77 ; | XXX XXX| $FB75
    .byte $FD ; |XXXXXX X| $FB76
    .byte $17 ; |   X XXX| $FB77
    .byte $F9 ; |XXXXX  X| $FB78
    .byte $06 ; |     XX | $FB79
    .byte $F8 ; |XXXXX   | $FB7A
    .byte $02 ; |      X | $FB7B
    .byte $F0 ; |XXXX    | $FB7C
    .byte $02 ; |      X | $FB7D
    .byte $F0 ; |XXXX    | $FB7E
    .byte $00 ; |        | $FB7F
    .byte $F0 ; |XXXX    | $FB80
    .byte $00 ; |        | $FB81
    .byte $F8 ; |XXXXX   | $FB82
    .byte $00 ; |        | $FB83
    .byte $F9 ; |XXXXX  X| $FB84
    .byte $01 ; |       X| $FB85
    .byte $FF ; |XXXXXXXX| $FB86
    .byte $00 ; |        | $FB87
    .byte $FF ; |XXXXXXXX| $FB88
    .byte $03 ; |      XX| $FB89

LFB8A:
    sta    HMCLR                 ; 3
    lda    ram_CA                ; 3
    tay                          ; 2
    sec                          ; 2
    sbc    #$1A                  ; 2
    bpl    LFB96                 ; 2³
    lda    #$00                  ; 2
LFB96:
    sta    ram_92                ; 3
    jmp    LFC00                 ; 3

    .byte $80 ; |X       | $FB9B
    .byte $00 ; |        | $FB9C
    .byte $80 ; |X       | $FB9D
    .byte $00 ; |        | $FB9E
    .byte $80 ; |X       | $FB9F
    .byte $00 ; |        | $FBA0
    .byte $80 ; |X       | $FBA1
    .byte $00 ; |        | $FBA2
    .byte $80 ; |X       | $FBA3
    .byte $00 ; |        | $FBA4
    .byte $80 ; |X       | $FBA5
    .byte $00 ; |        | $FBA6
    .byte $80 ; |X       | $FBA7
    .byte $00 ; |        | $FBA8
    .byte $80 ; |X       | $FBA9
    .byte $00 ; |        | $FBAA
    .byte $FE ; |XXXXXXX | $FBAB
    .byte $00 ; |        | $FBAC
    .byte $FE ; |XXXXXXX | $FBAD
    .byte $00 ; |        | $FBAE
    .byte $FE ; |XXXXXXX | $FBAF
    .byte $00 ; |        | $FBB0
    .byte $FE ; |XXXXXXX | $FBB1
    .byte $00 ; |        | $FBB2
    .byte $80 ; |X       | $FBB3
    .byte $00 ; |        | $FBB4
    .byte $00 ; |        | $FBB5
    .byte $00 ; |        | $FBB6
    .byte $80 ; |X       | $FBB7
    .byte $00 ; |        | $FBB8
    .byte $00 ; |        | $FBB9
    .byte $00 ; |        | $FBBA
    .byte $80 ; |X       | $FBBB
    .byte $00 ; |        | $FBBC
    .byte $00 ; |        | $FBBD
    .byte $00 ; |        | $FBBE
    .byte $80 ; |X       | $FBBF
    .byte $00 ; |        | $FBC0
    .byte $00 ; |        | $FBC1
    .byte $00 ; |        | $FBC2
    .byte $80 ; |X       | $FBC3
    .byte $00 ; |        | $FBC4
    .byte $00 ; |        | $FBC5
    .byte $00 ; |        | $FBC6
    .byte $80 ; |X       | $FBC7
    .byte $00 ; |        | $FBC8
    .byte $00 ; |        | $FBC9
    .byte $00 ; |        | $FBCA
    .byte $80 ; |X       | $FBCB
    .byte $00 ; |        | $FBCC
    .byte $00 ; |        | $FBCD
    .byte $00 ; |        | $FBCE
    .byte $80 ; |X       | $FBCF
    .byte $00 ; |        | $FBD0
    .byte $00 ; |        | $FBD1
    .byte $00 ; |        | $FBD2
    .byte $80 ; |X       | $FBD3
    .byte $00 ; |        | $FBD4
    .byte $00 ; |        | $FBD5
    .byte $00 ; |        | $FBD6
    .byte $80 ; |X       | $FBD7
    .byte $00 ; |        | $FBD8
    .byte $00 ; |        | $FBD9
    .byte $00 ; |        | $FBDA
    .byte $80 ; |X       | $FBDB
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
    cpy    #$7E                  ; 2
    bcc    LFC06                 ; 2³
    ldy    #$7E                  ; 2
LFC06:
    sty    ram_91                ; 3
    lda    ram_CC                ; 3
    asl                          ; 2
    asl                          ; 2
    adc    #$03                  ; 2
    tax                          ; 2
    ldy    #$03                  ; 2
LFC11:
    lda    LF918,X               ; 4
    sta.wy ram_93,Y              ; 5
    dex                          ; 2
    dey                          ; 2
    bpl    LFC11                 ; 2³
    inc    frameCounter          ; 5
    bne    LFC21                 ; 2³
    inc    ram_C5                ; 5
LFC21:
    jsr    LFE7E                 ; 6
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    stx    PF0                   ; 3
    stx    COLUBK                ; 3
    lda    #$F0                  ; 2
    sta    COLUPF                ; 3
    jsr    LFE8B                 ; 6
LFC33:
    lda    INTIM                 ; 4   wait for vblank end
    bne    LFC33                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    HMCLR                 ; 3
    lda    frameCounter          ; 3
    and    #$20                  ; 2
    beq    LFC47                 ; 2³
LFC44:
    jmp    LFD1C                 ; 3

LFC47:
    lda    ram_D8                ; 3
    cmp    #$02                  ; 2
    bne    LFC44                 ; 2³
    ldy    #$09                  ; 2
LFC4F:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    lda    LFA68,Y               ; 4
    sta    GRP0                  ; 3
    lda    LFA72,Y               ; 4
    sta    GRP1                  ; 3
    lda    LFA86,Y               ; 4
    tax                          ; 2
    lda    LFA7C,Y               ; 4
    bit    ram_80                ; 3
    nop                          ; 2
    jsr    LF0A3                 ; 6
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    dey                          ; 2
    bpl    LFC4F                 ; 2³
    jmp    LFD21                 ; 3

    .byte $00 ; |        | $FC74
    .byte $18 ; |   XX   | $FC75
    .byte $3C ; |  XXXX  | $FC76
    .byte $5A ; | X XX X | $FC77
    .byte $18 ; |   XX   | $FC78
    .byte $18 ; |   XX   | $FC79
    .byte $18 ; |   XX   | $FC7A
    .byte $18 ; |   XX   | $FC7B
    .byte $00 ; |        | $FC7C
    .byte $00 ; |        | $FC7D
    .byte $00 ; |        | $FC7E
    .byte $FF ; |XXXXXXXX| $FC7F
    .byte $FF ; |XXXXXXXX| $FC80
    .byte $10 ; |   X    | $FC81
    .byte $08 ; |    X   | $FC82
    .byte $10 ; |   X    | $FC83
    .byte $08 ; |    X   | $FC84
    .byte $10 ; |   X    | $FC85
    .byte $08 ; |    X   | $FC86
    .byte $10 ; |   X    | $FC87
    .byte $08 ; |    X   | $FC88
    .byte $10 ; |   X    | $FC89
    .byte $08 ; |    X   | $FC8A
    .byte $10 ; |   X    | $FC8B
    .byte $08 ; |    X   | $FC8C
    .byte $10 ; |   X    | $FC8D
    .byte $08 ; |    X   | $FC8E
    .byte $10 ; |   X    | $FC8F
    .byte $08 ; |    X   | $FC90
    .byte $10 ; |   X    | $FC91
    .byte $08 ; |    X   | $FC92
    .byte $10 ; |   X    | $FC93
    .byte $08 ; |    X   | $FC94
    .byte $10 ; |   X    | $FC95
    .byte $08 ; |    X   | $FC96
    .byte $10 ; |   X    | $FC97
    .byte $08 ; |    X   | $FC98
    .byte $10 ; |   X    | $FC99
    .byte $08 ; |    X   | $FC9A
    .byte $FF ; |XXXXXXXX| $FC9B
    .byte $FF ; |XXXXXXXX| $FC9C
    .byte $FF ; |XXXXXXXX| $FC9D
    .byte $FF ; |XXXXXXXX| $FC9E
    .byte $38 ; |  XXX   | $FC9F
    .byte $1C ; |   XXX  | $FCA0
    .byte $7C ; | XXXXX  | $FCA1
    .byte $3E ; |  XXXXX | $FCA2
    .byte $54 ; | X X X  | $FCA3
    .byte $2A ; |  X X X | $FCA4
    .byte $D6 ; |XX X XX | $FCA5
    .byte $6B ; | XX X XX| $FCA6
    .byte $92 ; |X  X  X | $FCA7
    .byte $49 ; | X  X  X| $FCA8
    .byte $93 ; |X  X  XX| $FCA9
    .byte $C9 ; |XX  X  X| $FCAA
    .byte $11 ; |   X   X| $FCAB
    .byte $88 ; |X   X   | $FCAC
    .byte $11 ; |   X   X| $FCAD
    .byte $88 ; |X   X   | $FCAE
    .byte $93 ; |X  X  XX| $FCAF
    .byte $C9 ; |XX  X  X| $FCB0
    .byte $92 ; |X  X  X | $FCB1
    .byte $49 ; | X  X  X| $FCB2
    .byte $D6 ; |XX X XX | $FCB3
    .byte $6B ; | XX X XX| $FCB4
    .byte $54 ; | X X X  | $FCB5
    .byte $2A ; |  X X X | $FCB6
    .byte $7C ; | XXXXX  | $FCB7
    .byte $3E ; |  XXXXX | $FCB8
    .byte $38 ; |  XXX   | $FCB9
    .byte $1C ; |   XXX  | $FCBA
    .byte $FF ; |XXXXXXXX| $FCBB
    .byte $FF ; |XXXXXXXX| $FCBC
    .byte $FF ; |XXXXXXXX| $FCBD
    .byte $FF ; |XXXXXXXX| $FCBE
    .byte $38 ; |  XXX   | $FCBF
    .byte $1C ; |   XXX  | $FCC0
    .byte $7C ; | XXXXX  | $FCC1
    .byte $3E ; |  XXXXX | $FCC2
    .byte $54 ; | X X X  | $FCC3
    .byte $2A ; |  X X X | $FCC4
    .byte $D6 ; |XX X XX | $FCC5
    .byte $6B ; | XX X XX| $FCC6
    .byte $92 ; |X  X  X | $FCC7
    .byte $49 ; | X  X  X| $FCC8
    .byte $93 ; |X  X  XX| $FCC9
    .byte $C9 ; |XX  X  X| $FCCA
    .byte $11 ; |   X   X| $FCCB
    .byte $88 ; |X   X   | $FCCC
    .byte $11 ; |   X   X| $FCCD
    .byte $88 ; |X   X   | $FCCE
    .byte $93 ; |X  X  XX| $FCCF
    .byte $C9 ; |XX  X  X| $FCD0
    .byte $92 ; |X  X  X | $FCD1
    .byte $49 ; | X  X  X| $FCD2
    .byte $D6 ; |XX X XX | $FCD3
    .byte $6B ; | XX X XX| $FCD4
    .byte $54 ; | X X X  | $FCD5
    .byte $2A ; |  X X X | $FCD6
    .byte $7C ; | XXXXX  | $FCD7
    .byte $3E ; |  XXXXX | $FCD8
    .byte $38 ; |  XXX   | $FCD9
    .byte $1C ; |   XXX  | $FCDA
    .byte $FF ; |XXXXXXXX| $FCDB
    .byte $FF ; |XXXXXXXX| $FCDC
    .byte $FF ; |XXXXXXXX| $FCDD
    .byte $FF ; |XXXXXXXX| $FCDE
    .byte $38 ; |  XXX   | $FCDF
    .byte $1C ; |   XXX  | $FCE0
    .byte $7C ; | XXXXX  | $FCE1
    .byte $3E ; |  XXXXX | $FCE2
    .byte $54 ; | X X X  | $FCE3
    .byte $2A ; |  X X X | $FCE4
    .byte $D6 ; |XX X XX | $FCE5
    .byte $6B ; | XX X XX| $FCE6
    .byte $92 ; |X  X  X | $FCE7
    .byte $49 ; | X  X  X| $FCE8
    .byte $93 ; |X  X  XX| $FCE9
    .byte $C9 ; |XX  X  X| $FCEA
    .byte $11 ; |   X   X| $FCEB
    .byte $88 ; |X   X   | $FCEC
    .byte $11 ; |   X   X| $FCED
    .byte $88 ; |X   X   | $FCEE
    .byte $93 ; |X  X  XX| $FCEF
    .byte $C9 ; |XX  X  X| $FCF0
    .byte $92 ; |X  X  X | $FCF1
    .byte $49 ; | X  X  X| $FCF2
    .byte $D6 ; |XX X XX | $FCF3
    .byte $6B ; | XX X XX| $FCF4
    .byte $54 ; | X X X  | $FCF5
    .byte $2A ; |  X X X | $FCF6
    .byte $7C ; | XXXXX  | $FCF7
    .byte $3E ; |  XXXXX | $FCF8
    .byte $38 ; |  XXX   | $FCF9
    .byte $1C ; |   XXX  | $FCFA
    .byte $FF ; |XXXXXXXX| $FCFB
    .byte $FF ; |XXXXXXXX| $FCFC
    .byte $FF ; |XXXXXXXX| $FCFD
    .byte $FF ; |XXXXXXXX| $FCFE
LFCFF:
    .byte $7A ; | XXXX X | $FCFF
    .byte $72 ; | XXX  X | $FD00
    .byte $52 ; | X X  X | $FD01
    .byte $32 ; |  XX  X | $FD02
    .byte $18 ; |   XX   | $FD03

LFD04:
    cmp    #$03                  ; 2
    bne    LFD2F                 ; 2³
    lda    ram_DB                ; 3
    eor    #$FF                  ; 2
    sta    ram_DC                ; 3
    bne    LFD2F                 ; 2³
    sta    AUDF0                 ; 3
    lda    #$02                  ; 2
    sta    AUDC0                 ; 3
    lda    #$1F                  ; 2
    sta    AUDV0                 ; 3
    bne    LFD2F                 ; 3   always branch

LFD1C:
    ldy    #LINES_2              ; 2
    jsr    LF267                 ; 6
LFD21:
    jsr    LFE7E                 ; 6
    stx    COLUP1                ; 3
    dex                          ; 2
    lda    ram_D8                ; 3
    cmp    #$02                  ; 2
    bne    LFD04                 ; 2³
    stx    PF2                   ; 3
LFD2F:
    lda    #$E4                  ; 2
    jsr    LF2FE                 ; 6
    lda    #$95                  ; 2
    jsr    LF304                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$18                  ; 2
    sta    COLUP0                ; 3
    lda    #$14                  ; 2
    sta    ram_81                ; 3
    lda    #$FF                  ; 2
    sta    ram_82                ; 3
    ldx    #$07                  ; 2
    ldy    ram_D8                ; 3
LFD4D:
    sty    ram_80                ; 3
    cpx    #$02                  ; 2
    bcs    LFD5A                 ; 2³
    ldy    #$00                  ; 2
    sty    COLUPF                ; 3
    dey                          ; 2
    sty    PF0                   ; 3
LFD5A:
    lda    #$00                  ; 2
    inc    ram_82                ; 5
    lda    ram_82                ; 3
    lsr                          ; 2
    tay                          ; 2
    lda    LFB10,Y               ; 4
    ora    ram_D9                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    dec    ram_81                ; 5
    bmi    LFD8F                 ; 2³
    dec    ram_80                ; 5
    bpl    LFD5A                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LFAEC,X               ; 4
    sta    PF1                   ; 3
    lda    LFAF3,X               ; 4
    sta    PF2                   ; 3
    lda    LFAFA,X               ; 4
    sta    GRP0                  ; 3
    lda    LFB01,X               ; 4
    sta    GRP1                  ; 3
    ldy    LFB08,X               ; 4
    dex                          ; 2
    bpl    LFD4D                 ; 2³
LFD8F:
    jsr    LFE7E                 ; 6
    lda    #$10                  ; 2
    sta    PF1                   ; 3
    lsr                          ; 2
    sta    PF2                   ; 3
    stx    COLUPF                ; 3
    dex                          ; 2
    lda    ram_D2                ; 3
    beq    LFDA2                 ; 2³
    stx    ram_88                ; 3
LFDA2:
    lsr                          ; 2
    bcs    LFDAA                 ; 2³
    lda    ram_D2                ; 3
    bmi    LFDE1                 ; 2³
    rol                          ; 2
LFDAA:
    rol                          ; 2
    rol                          ; 2
    tax                          ; 2
    lsr                          ; 2
    adc    #$00                  ; 2
    tay                          ; 2
    lda    LFB28,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    lda    #$00                  ; 2
    sta    COLUPF                ; 3
    lda    LFB2B,Y               ; 4  load indirect ptrs
    sta    ram_BC                ; 3
    lda    LFB2D,Y               ; 4
    sta    ram_BD                ; 3
    lda    LFB2F,Y               ; 4
    sta    ram_BE                ; 3
    lda    LFB31,Y               ; 4
    sta    ram_BF                ; 3
    lda    LFB22,X               ; 4
    ldy    LFB25,X               ; 4
    sty    ram_C2                ; 3
    dey                          ; 2
    sty    ram_C0                ; 3
    sta    ram_C1                ; 3
    sta    ram_C3                ; 3
    bne    LFE01                 ; 2³+1
LFDE1:
    ldy    #$FB                  ; 2
    lda    #$DD                  ; 2
    sec                          ; 2
    sbc    ram_EB                ; 3
    sta    ram_C0                ; 3
    bcs    LFDED                 ; 2³
    dey                          ; 2
LFDED:
    sty    ram_C1                ; 3
    lda    #$FB                  ; 2
    sta    ram_C3                ; 3
    lda    #$5F                  ; 2
    sta    ram_C2                ; 3
    lda    #$86                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    lda    #$00                  ; 2
    sta    COLUPF                ; 3
LFE01:
    jsr    LFE8B                 ; 6
    lda    #$1F                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    ram_D4                ; 3
    jsr    LFB33                 ; 6
    sta    ram_82                ; 3
    stx    ram_80                ; 3
    lda    ram_D3                ; 3
    jsr    LFB33                 ; 6
    stx    ram_84                ; 3
    sta    ram_86                ; 3
    lda    #$FA                  ; 2
    sta    ram_81                ; 3
    sta    ram_83                ; 3
    sta    ram_85                ; 3
    sta    ram_87                ; 3
    ldy    #$04                  ; 2
LFE28:
    lda    #$02                  ; 2
LFE2A:
    pha                          ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    lda    (ram_80),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_82),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_86),Y            ; 5
    tax                          ; 2
    lda    (ram_84),Y            ; 5
    nop                          ; 2
    jsr    LF0A3                 ; 6
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    pla                          ; 4
    sec                          ; 2
    sbc    #$01                  ; 2
    bne    LFE2A                 ; 2³
    dey                          ; 2
    bpl    LFE28                 ; 2³
    jsr    LFE7E                 ; 6
    lda    ram_C9                ; 3
    sta    REFP0                 ; 3
    sta    HMCLR                 ; 3
    sta    CXCLR                 ; 3
    lda    ram_AC                ; 3
    sta    COLUP1                ; 3
    ldx    #$03                  ; 2
LFE5E:
    lda    ram_92,X              ; 4
    sec                          ; 2
    sbc    ram_CA                ; 3
    bcs    LFE67                 ; 2³
    dec    ram_93,X              ; 6
LFE67:
    sta    ram_92,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LFE5E                 ; 2³
    ldx    #$03                  ; 2
LFE6F:
    lda    ram_A0,X              ; 4
    sec                          ; 2
    sbc    ram_97,X              ; 4
    bcs    LFE78                 ; 2³
    dec    ram_A4,X              ; 6
LFE78:
    sta    ram_A0,X              ; 4
    dex                          ; 2
    bpl    LFE6F                 ; 2³
    rts                          ; 6

LFE7E:
    ldx    #$00                  ; 2
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    stx    GRP1                  ; 3
    stx    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    rts                          ; 6

LFE8B:
    lda    #$C4                  ; 2
    jsr    LF2FE                 ; 6
    lda    #$35                  ; 2
    jsr    LF304                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$48                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$00                  ; 2
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    #$01                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    rts                          ; 6

    .byte $00 ; |        | $FEAC
    .byte $00 ; |        | $FEAD
    .byte $80 ; |X       | $FEAE
    .byte $87 ; |X    XXX| $FEAF
    .byte $87 ; |X    XXX| $FEB0
    .byte $E6 ; |XXX  XX | $FEB1
    .byte $FA ; |XXXXX X | $FEB2
    .byte $3A ; |  XXX X | $FEB3
    .byte $1E ; |   XXXX | $FEB4
    .byte $1E ; |   XXXX | $FEB5
    .byte $3E ; |  XXXXX | $FEB6
    .byte $3F ; |  XXXXXX| $FEB7
    .byte $7F ; | XXXXXXX| $FEB8
    .byte $DF ; |XX XXXXX| $FEB9
    .byte $9F ; |X  XXXXX| $FEBA
    .byte $9F ; |X  XXXXX| $FEBB
    .byte $FF ; |XXXXXXXX| $FEBC
    .byte $FE ; |XXXXXXX | $FEBD
    .byte $1C ; |   XXX  | $FEBE
    .byte $1E ; |   XXXX | $FEBF
    .byte $1F ; |   XXXXX| $FEC0
    .byte $1E ; |   XXXX | $FEC1
    .byte $1C ; |   XXX  | $FEC2
    .byte $7E ; | XXXXXX | $FEC3
    .byte $5D ; | X XXX X| $FEC4
    .byte $1C ; |   XXX  | $FEC5
    .byte $00 ; |        | $FEC6
    .byte $1C ; |   XXX  | $FEC7
    .byte $1C ; |   XXX  | $FEC8
    .byte $10 ; |   X    | $FEC9
    .byte $90 ; |X  X    | $FECA
    .byte $90 ; |X  X    | $FECB
    .byte $F0 ; |XXXX    | $FECC
    .byte $F0 ; |XXXX    | $FECD
    .byte $3C ; |  XXXX  | $FECE
    .byte $3C ; |  XXXX  | $FECF
    .byte $3C ; |  XXXX  | $FED0
    .byte $7E ; | XXXXXX | $FED1
    .byte $7F ; | XXXXXXX| $FED2
    .byte $FF ; |XXXXXXXX| $FED3
    .byte $FE ; |XXXXXXX | $FED4
    .byte $7E ; | XXXXXX | $FED5
    .byte $3E ; |  XXXXX | $FED6
    .byte $3C ; |  XXXX  | $FED7
    .byte $38 ; |  XXX   | $FED8
    .byte $3C ; |  XXXX  | $FED9
    .byte $3F ; |  XXXXXX| $FEDA
    .byte $3C ; |  XXXX  | $FEDB
    .byte $38 ; |  XXX   | $FEDC
    .byte $FE ; |XXXXXXX | $FEDD
    .byte $BA ; |X XXX X | $FEDE
    .byte $38 ; |  XXX   | $FEDF
    .byte $00 ; |        | $FEE0
    .byte $60 ; | XX     | $FEE1
    .byte $46 ; | X   XX | $FEE2
    .byte $44 ; | X   X  | $FEE3
    .byte $64 ; | XX  X  | $FEE4
    .byte $36 ; |  XX XX | $FEE5
    .byte $33 ; |  XX  XX| $FEE6
    .byte $3F ; |  XXXXXX| $FEE7
    .byte $3E ; |  XXXXX | $FEE8
    .byte $3C ; |  XXXX  | $FEE9
    .byte $3E ; |  XXXXX | $FEEA
    .byte $3F ; |  XXXXXX| $FEEB
    .byte $3F ; |  XXXXXX| $FEEC
    .byte $3F ; |  XXXXXX| $FEED
    .byte $3F ; |  XXXXXX| $FEEE
    .byte $3D ; |  XXXX X| $FEEF
    .byte $3D ; |  XXXX X| $FEF0
    .byte $3D ; |  XXXX X| $FEF1
    .byte $39 ; |  XXX  X| $FEF2
    .byte $3C ; |  XXXX  | $FEF3
    .byte $3E ; |  XXXXX | $FEF4
    .byte $3D ; |  XXXX X| $FEF5
    .byte $38 ; |  XXX   | $FEF6
    .byte $FE ; |XXXXXXX | $FEF7
    .byte $BA ; |X XXX X | $FEF8
    .byte $38 ; |  XXX   | $FEF9
    .byte $00 ; |        | $FEFA
    .byte $C0 ; |XX      | $FEFB
    .byte $C0 ; |XX      | $FEFC
    .byte $80 ; |X       | $FEFD
    .byte $80 ; |X       | $FEFE
    .byte $C6 ; |XX   XX | $FEFF
    .byte $C7 ; |XX   XXX| $FF00
    .byte $65 ; | XX  X X| $FF01
    .byte $34 ; |  XX X  | $FF02
    .byte $3E ; |  XXXXX | $FF03
    .byte $3E ; |  XXXXX | $FF04
    .byte $3F ; |  XXXXXX| $FF05
    .byte $3F ; |  XXXXXX| $FF06
    .byte $7F ; | XXXXXXX| $FF07
    .byte $FF ; |XXXXXXXX| $FF08
    .byte $FF ; |XXXXXXXX| $FF09
    .byte $FE ; |XXXXXXX | $FF0A
    .byte $1E ; |   XXXX | $FF0B
    .byte $1C ; |   XXX  | $FF0C
    .byte $1E ; |   XXXX | $FF0D
    .byte $1F ; |   XXXXX| $FF0E
    .byte $1E ; |   XXXX | $FF0F
    .byte $1C ; |   XXX  | $FF10
    .byte $7F ; | XXXXXXX| $FF11
    .byte $5D ; | X XXX X| $FF12
    .byte $1C ; |   XXX  | $FF13

LFF14:
    bit    ram_DA                ; 3
    bmi    LFF2D                 ; 2³
    bvs    LFF2D                 ; 2³
    ldx    #$03                  ; 2
    lda    ram_C6                ; 3
    and    #$03                  ; 2
    sta    ram_80                ; 3
LFF22:
    asl    ram_80                ; 5
    asl    ram_80                ; 5
    ora    ram_80                ; 3
    dex                          ; 2
    bne    LFF22                 ; 2³
    sta    ram_C6                ; 3
LFF2D:
    ldy    #$04                  ; 2
    lda    ram_CA                ; 3
LFF31:
    cmp    LFCFF,Y               ; 4
    beq    LFF3A                 ; 2³
    dey                          ; 2
    bpl    LFF31                 ; 2³
LFF39:
    rts                          ; 6

LFF3A:
    cpy    #$04                  ; 2
    bne    LFF41                 ; 2³
    jmp    LFF7A                 ; 3

LFF41:
    lda    ram_C6                ; 3
LFF43:
    dey                          ; 2
    bmi    LFF4A                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    bpl    LFF43                 ; 3   always branch

LFF4A:
    and    #$03                  ; 2
    sta    ram_80                ; 3
    lda    ram_C8                ; 3
    ldx    #$03                  ; 2
LFF52:
    cmp    LFF81,X               ; 4
    bcc    LFF5B                 ; 2³
    dex                          ; 2
    bpl    LFF52                 ; 2³
    rts                          ; 6

LFF5B:
    lda    ram_D0                ; 3
    cpx    ram_80                ; 3
    bne    LFF69                 ; 2³
    and    #$C0                  ; 2
    bne    LFF39                 ; 2³
    ldx    #$05                  ; 2
    bne    LFF73                 ; 3   always branch

LFF69:
    lda    ram_D0                ; 3
    bmi    LFF71                 ; 2³
    ora    #$80                  ; 2
    sta    ram_D0                ; 3
LFF71:
    ldx    #$0C                  ; 2
LFF73:
    stx    ram_D6                ; 3
    lda    #$0A                  ; 2
    sta    ram_D5                ; 3
    rts                          ; 6

LFF7A:
    lda    ram_D0                ; 3
    and    #$7F                  ; 2
    sta    ram_D0                ; 3
    rts                          ; 6

LFF81:
    .byte $7C ; | XXXXX  | $FF81
    .byte $5C ; | X XXX  | $FF82
    .byte $38 ; |  XXX   | $FF83
    .byte $18 ; |   XX   | $FF84

LFF85:
    bit    ram_DC                ; 3
    bvs    LFFA0                 ; 2³
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcs    LFFA0                 ; 2³
    inc    ram_DC                ; 5
    lda    ram_DC                ; 3
    cmp    #$20                  ; 2
    bcs    LFF9A                 ; 2³
    sta    AUDF0                 ; 3
    bcc    LFFA0                 ; 3   always branch

LFF9A:
    lda    #$40                  ; 2
    sbc    ram_DC                ; 3
    sta    AUDV0                 ; 3
LFFA0:
    bit    ram_D2                ; 3
    bvc    LFFB5                 ; 2³
    lda    SWCHB                 ; 4
    and    #$08                  ; 2
    bne    LFFB5                 ; 2³
    lda    frameCounter          ; 3
    and    #$08                  ; 2
    bne    LFFB5                 ; 2³
    lda    #$01                  ; 2
    sta    ram_E1                ; 3
LFFB5:
    jmp    LFB8A                 ; 3

    .byte $3C ; |  XXXX  | $FFB8
    .byte $81 ; |X      X| $FFB9
    .byte $0F ; |    XXXX| $FFBA
    .byte $00 ; |        | $FFBB
    .byte $05 ; |     X X| $FFBC
    .byte $03 ; |      XX| $FFBD
    .byte $01 ; |       X| $FFBE
    .byte $01 ; |       X| $FFBF
    .byte $05 ; |     X X| $FFC0
    .byte $05 ; |     X X| $FFC1
    .byte $00 ; |        | $FFC2
    .byte $E1 ; |XXX    X| $FFC3
    .byte $40 ; | X      | $FFC4
    .byte $F1 ; |XXXX   X| $FFC5
    .byte $21 ; |  X    X| $FFC6
    .byte $A1 ; |X X    X| $FFC7
    .byte $30 ; |  XX    | $FFC8
    .byte $00 ; |        | $FFC9
    .byte $01 ; |       X| $FFCA
    .byte $02 ; |      X | $FFCB
    .byte $00 ; |        | $FFCC
    .byte $01 ; |       X| $FFCD
    .byte $02 ; |      X | $FFCE
    .byte $01 ; |       X| $FFCF
    .byte $18 ; |   XX   | $FFD0
    .byte $45 ; | X   X X| $FFD1
    .byte $00 ; |        | $FFD2
    .byte $68 ; | XX X   | $FFD3
    .byte $38 ; |  XXX   | $FFD4
    .byte $07 ; |     XXX| $FFD5
    .byte $0A ; |    X X | $FFD6
    .byte $07 ; |     XXX| $FFD7
    .byte $0F ; |    XXXX| $FFD8
    .byte $07 ; |     XXX| $FFD9
    .byte $09 ; |    X  X| $FFDA
    .byte $0F ; |    XXXX| $FFDB
    .byte $60 ; | XX     | $FFDC
    .byte $80 ; |X       | $FFDD
    .byte $60 ; | XX     | $FFDE
    .byte $40 ; | X      | $FFDF
    .byte $20 ; |  X     | $FFE0

LFFE1:
    stx    ram_D2                ; 3
    ldx    ram_D2                ; 3
    bmi    LFFEC                 ; 2³
    bne    LFFEF                 ; 2³
    jmp    LF8ED                 ; 3

LFFEC:
    jmp    LF62E                 ; 3

LFFEF:
    jmp    LF3FA                 ; 3

LFFF2:
    bit    BANK_0                ; 4

    jmp    LFFE1                 ; 3

       ORG $1FF8
      RORG $FFF8

    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9

    .word START_0
    .word START_0
    .word START_0