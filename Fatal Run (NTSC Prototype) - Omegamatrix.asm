; Rough disassembly of Fatal Run (NTSC Prototype)
; By Omegamatrix
;
; FR1.cfg contents:
;
;      ORG 1000
;      DATA 1000 10FF
;      CODE 1100 1784
;      GFX 1785 1792
;      CODE 1793 17A8
;      GFX 17A9 1B4C
;      CODE 1B4D 1DD6
;      GFX 1DD7 1E28
;      CODE 1E29 1E5B
;      GFX 1E5C 1EBE
;      CODE 1EBF 1EFA
;      GFX 1EFB 1EFB
;      CODE 1EFC 1F77
;      GFX 1F78 1FFF
;
; FR2.cfg contents:
;
;      ORG 3000
;      DATA 3000 30FF
;      CODE 3100 3111
;      GFX 3112 3241
;      CODE 3242 33F1
;      GFX 33F2 3451
;      CODE 3452 3556
;      GFX 3557 3A51
;      CODE 3A52 3BA0
;      GFX 3BA1 3BAC
;      CODE 3BAD 3DE8
;      GFX 3DE9 3EFB
;      CODE 3EFC 3F77
;      GFX 3F78 3FFF
;
; fr3.cfg contents:
;
;      ORG 5000
;      DATA 5000 50FF
;      CODE 5100 5114
;      GFX 5115 51C8
;      CODE 51C9 52F8
;      GFX 52F9 537B
;      CODE 537C 5668
;      GFX 5669 56CE
;      CODE 56CF 5736
;      GFX 5737 57D9
;      CODE 57DA 58EC
;      GFX 58ED 5BE9
;      CODE 5BEA 5C6E
;      GFX 5C6F 5D2A
;      CODE 5D2B 5D49
;      GFX 5D4A 5EFB
;      CODE 5EFC 5F77
;      GFX 5F78 5FFF
;
; fr4.cfg contents:
;
;      ORG 7000
;      DATA 7000 70FF
;      CODE 7100 733D
;      GFX 733E 74AB
;      CODE 74AC 7B8D
;      GFX 7B8E 7D5B
;      CODE 7D5C 7DE8
;      GFX 7DE9 7E30
;      CODE 7E31 7E54
;      GFX 7E55 7E59
;      CODE 7E5A 7ED1
;      GFX 7ED2 7EFB
;      CODE 7EFC 7F77
;      GFX 7F78 7FFF
;
; fr5.cfg contents:
;
;      ORG 9000
;      DATA 9000 90FF
;      CODE 9100 9114
;      GFX 9115 911B
;      CODE 911C 9205
;      GFX 9206 920D
;      CODE 920E 9415
;      GFX 9416 952D
;      CODE 952E 957E
;      GFX 957F 9840
;      CODE 9841 9A26
;      GFX 9A27 9A4E
;      CODE 9A4F 9A7F
;      GFX 9A80 9B97
;      CODE 9B98 9BB7
;      GFX 9BB8 9EFB
;      CODE 9EFC 9F77
;      GFX 9F78 9FFF
;
; fr6.cfg contents:
;
;      ORG B000
;      DATA B000 B0FF
;      CODE B100 B200
;      GFX B201 B730
;      CODE B731 B7AA
;      GFX B7AB B7B4
;      CODE B7B5 B8F2
;      GFX B8F3 B8FD
;      CODE B8FE B92F
;      GFX B930 BC7E
;      CODE BC7F BC90
;      GFX BC91 BEFB
;      CODE BEFC BF77
;      GFX BF78 BFFF
;
; fr7.cfg contents:
;
;      ORG D000
;      DATA D000 D0FF
;      CODE D100 D211
;      GFX D212 D53F
;      CODE D540 D70C
;      GFX D70D D84E
;      CODE D84F D9D0
;      GFX D9D1 D9E4
;      CODE D9E5 DA0F
;      GFX DA10 DEFB
;      CODE DEFC DF77
;      GFX DF78 DFFF
;
; fr8.cfg contents:
;
;      ORG F000
;      DATA F000 F0FF
;      CODE F100 F2CB
;      GFX F2CC F34C
;      CODE F34D F377
;      GFX F378 F776
;      CODE F777 F874
;      GFX F875 FDFF
;      CODE FE00 FE68
;      GFX FE69 FEFB
;      CODE FEFC FF77
;      GFX FF78 FFFF

      processor 6502

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
RSYNC   =  $03
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
VDELP0  =  $25
VDELP1  =  $26
VDELBL  =  $27
RESMP0  =  $28
RESMP1  =  $29
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C

CXM0P   =  $00
CXP0FB  =  $02
CXP1FB  =  $03
CXM1FB  =  $05
CXPPMM  =  $07
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296
T1024T  =  $0297


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      RIOT RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x28
ram_81             ds 1  ; x18
ram_82             ds 1  ; x61
ram_83             ds 1  ; x39
ram_84             ds 1  ; x28
ram_85             ds 1  ; x14
ram_86             ds 1  ; x43
ram_87             ds 1  ; x34
ram_88             ds 1  ; x33
ram_89             ds 1  ; x22
ram_8A             ds 1  ; x19
ram_8B             ds 1  ; x34
ram_8C             ds 1  ; x53
ram_8D             ds 1  ; x17
ram_8E             ds 1  ; x41
ram_8F             ds 1  ; x30
ram_90             ds 1  ; x33
ram_91             ds 1  ; x22
ram_92             ds 1  ; x26
ram_93             ds 1  ; x10
ram_94             ds 1  ; x22
ram_95             ds 1  ; x40
ram_96             ds 1  ; x22
ram_97             ds 1  ; x11
ram_98             ds 1  ; x8
ram_99             ds 1  ; x11
ram_9A             ds 1  ; x3
ram_9B             ds 1  ; x21
ram_9C             ds 1  ; x8
ram_9D             ds 1  ; x7
ram_9E             ds 1  ; x1
ram_9F             ds 1  ; x1
ram_A0             ds 1  ; x1
ram_A1             ds 1  ; x4
ram_A2             ds 1  ; x3
ram_A3             ds 1  ; x2
ram_A4             ds 1  ; x1
ram_A5             ds 1  ; x4
ram_A6             ds 1  ; x5
ram_A7             ds 2  ; x7
ram_A9             ds 1  ; x2
ram_AA             ds 1  ; x4
ram_AB             ds 2  ; x15
ram_AD             ds 2  ; x9
ram_AF             ds 2  ; x8
ram_B1             ds 1  ; x7
ram_B2             ds 3  ; x2
ram_B5             ds 1  ; x10
ram_B6             ds 3  ; x5
ram_B9             ds 5  ; x3
ram_BE             ds 3  ; x2
ram_C1             ds 1  ; x6
ram_C2             ds 1  ; x2
ram_C3             ds 1  ; x5
ram_C4             ds 1  ; x25
ram_C5             ds 1  ; x5
ram_C6             ds 1  ; x3
ram_C7             ds 1  ; x14
ram_C8             ds 1  ; x10
ram_C9             ds 1  ; x6
ram_CA             ds 1  ; x14
ram_CB             ds 1  ; x62
ram_CC             ds 1  ; x11
ram_CD             ds 1  ; x52
ram_CE             ds 1  ; x9
ram_CF             ds 1  ; x4
ram_D0             ds 1  ; x10
ram_D1             ds 1  ; x12
ram_D2             ds 1  ; x42
ram_D3             ds 1  ; x9
ram_D4             ds 1  ; x16
ram_D5             ds 1  ; x20
ram_D6             ds 1  ; x8
ram_D7             ds 1  ; x5
ram_D8             ds 1  ; x8
ram_D9             ds 1  ; x14
ram_DA             ds 1  ; x6
ram_DB             ds 1  ; x3
ram_DC             ds 1  ; x7
ram_DD             ds 1  ; x11
ram_DE             ds 1  ; x3
ram_DF             ds 5  ; x3
ram_E4             ds 1  ; x6
ram_E5             ds 1  ; x4
ram_E6             ds 2  ; x5
ram_E8             ds 1  ; x1
ram_E9             ds 1  ; x1
ram_EA             ds 6  ; x1
ram_F0             ds 16 ; x1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      SUPERCHIP RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        SEG.U SUPERCHIP_RAM
        ORG $F000

sc_00               ds 1  ; x9
sc_01               ds 1  ; x10
sc_02               ds 1  ; x5
sc_03               ds 1  ; x12
sc_04               ds 1  ; x13
sc_05               ds 1  ; x26
sc_06               ds 1  ; x23
bonusStatus         ds 1  ;$F007 x8
sc_08               ds 1  ; x5
fuelStatus          ds 1  ;$F009 x10
engineStatus        ds 1  ;$F00A x21
bulletStatus        ds 1  ;$F00B x7
tireStatus          ds 1  ;$F00C x18
sc_0D               ds 1  ; x4
sc_0E               ds 1  ; x8
sc_0F               ds 16 ; x5
sc_1F               ds 16 ; x5
sc_2F               ds 1  ; x9
sc_30               ds 4  ; x17
armorStatus         ds 1  ;$F034 x20
sc_35               ds 1  ; x11
sc_36               ds 1  ; x3
sc_37               ds 1  ; x18
sc_38               ds 1  ; x2
sc_39               ds 8  ; x2
sc_41               ds 1  ; x15
sc_42               ds 9  ; x1
sc_4B               ds 1  ; x34
sc_4C               ds 1  ; x16
sc_4D               ds 1  ; x8
sc_4E               ds 1  ; x1
sc_4F               ds 1  ; x13
sc_50               ds 1  ; x1
sc_51               ds 1  ; x13
sc_52               ds 1  ; x9
sc_53               ds 1  ; x3
sc_54               ds 1  ; x5
sc_55               ds 1  ; x3
sc_56               ds 1  ; x8
sc_57               ds 1  ; x4
sc_58               ds 22 ; x10
sc_6E               ds 1  ; x7
sc_6F               ds 11 ; x5
sc_7A               ds 2  ; x7
sc_7C               ds 1  ; x4
sc_7D               ds 1  ; x28
sc_7E               ds 1  ; x11
sc_7F               ds 1  ; x2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      USER CONSTANTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BANK_0          = $FFF4
BANK_1          = $FFF5
BANK_2          = $FFF6
BANK_3          = $FFF7
BANK_4          = $FFF8
BANK_5          = $FFF9
BANK_6          = $FFFA
BANK_7          = $FFFB

READ            = $0080  ; read superchip ram
BANK_MASK       = $F000

WASTE_4_CYCLES  = $F100  ; replace with 2 nops and save a byte each time...


;HMPx
LEFT_7          = $70
LEFT_6          = $60
LEFT_5          = $50
LEFT_4          = $40
LEFT_3          = $30
LEFT_2          = $20
LEFT_1          = $10
NO_MOTION       = $00
RIGHT_1         = $F0
RIGHT_2         = $E0
RIGHT_3         = $D0
RIGHT_4         = $C0
RIGHT_5         = $B0
RIGHT_6         = $A0
RIGHT_7         = $90
RIGHT_8         = $80


COL_EDGE_LIGHT  = $0F  ; white
COL_EDGE_DARK   = $34  ;

;hack settings
;1 = enable damage or losses
;0 = no damage, have unlimited supply...
;'1' for every setting would compile to the original game

ENGINE_DAMAGE   = 1
TIRE_DAMAGE     = 1
ARMOR_DAMAGE    = 1
BONUS_LOSS      = 1  ; if this is set to 0, you wait a long time while all the bonus men are counted every level
FUEL_LOSS       = 1
BULLET_LOSS     = 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      MACROS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  MAC SC_RAM_SPACE

    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; SUPERCHIP RAM
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

  ENDM

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      BANK 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE

       ORG $0000,0
      RORG $1000

    SC_RAM_SPACE


START_0:
    lda    BANK_0                ; 4
    nop                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    jsr    L1F14                 ; 6   bankswitch, goto L3242
    jmp    L1F26                 ; 3   bankswitch, goto L7E5A

    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    #$04                  ; 2
    sta    AUDV0                 ; 3
    lda    #$03                  ; 2
    sta    AUDC0                 ; 3
    ldy    #$05                  ; 2
    sty    ram_D6                ; 3
    jsr    L1F0E                 ; 6   bankswitch, goto L56E5
    bit    ram_CA                ; 3
    bvc    L112A                 ; 2³
    jsr    L1F1A                 ; 6   bankswitch, goto L920E
L112A:
    jsr    L1EF5                 ; 6
    ldy    #$00                  ; 2
    sty    AUDV1                 ; 3
    sty    ram_D8                ; 3
    sty    ram_D5                ; 3
L1135:
    lda    #$03                  ; 2
    sta    VSYNC                 ; 3
    sta    RSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    inc    ram_D1                ; 5
    ldx    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    VSYNC                 ; 3
    lda    #$03                  ; 2
    sta    VBLANK                ; 3
    lda    #$32                  ; 2
    sta    TIM64T                ; 4
    lda    ram_94                ; 3
    and    #$01                  ; 2
    beq    L1159                 ; 2³
    ldx    #$01                  ; 2
    jsr    L1F4A                 ; 6   bankswitch, goto L9241
L1159:
    jsr    L1B4D                 ; 6
    bit    ram_CA                ; 3
    bvs    L1169                 ; 2³
    lda    ram_94                ; 3
    and    #$01                  ; 2
    beq    L116C                 ; 2³
    jmp    L1235                 ; 3

L1169:
    jmp    L121E                 ; 3

L116C:
    ldy    ram_D5                ; 3
    beq    L1197                 ; 2³
    sed                          ; 2
    clc                          ; 2
    lda    sc_02|READ            ; 4
    adc    #$10                  ; 2
    sta    sc_02                 ; 4
    bcc    L1190                 ; 2³
    lda    sc_01|READ            ; 4
    clc                          ; 2
    adc    #$01                  ; 2
    sta    sc_01                 ; 4
    bcc    L1190                 ; 2³
    lda    sc_00|READ            ; 4
    clc                          ; 2
    adc    #$01                  ; 2
    sta    sc_00                 ; 4
L1190:
    cld                          ; 2
    dey                          ; 2
    sty    ram_D5                ; 3
    jmp    L11D7                 ; 3

L1197:
    ldx    fuelStatus|READ       ; 4
    bne    L11C4                 ; 2³
L119C:
    lda    #$0F                  ; 2
    sta    ram_81                ; 3
    sta    sc_6E                 ; 4
    lda    #$00                  ; 2
    sta    ram_C8                ; 3
    lda    ram_D2                ; 3
    cmp    #$01                  ; 2
    bcs    L11B7                 ; 2³
    lda    ram_D1                ; 3
    bne    L11B4                 ; 2³
    jmp    L1F62                 ; 3   bankswitch, goto LD568

L11B4:
    jmp    L1235                 ; 3

L11B7:
    lda    #$B4                  ; 2
    sta    ram_D1                ; 3
    jsr    L1E29                 ; 6
    jsr    L1F0E                 ; 6   bankswitch, goto L56E5
    jmp    L1235                 ; 3

L11C4:
    lda    armorStatus|READ      ; 4
    and    #$FE                  ; 2
    beq    L119C                 ; 2³
    lda    engineStatus|READ     ; 4
    and    #$FE                  ; 2
    beq    L119C                 ; 2³
    ldx    tireStatus|READ       ; 4
    beq    L119C                 ; 2³
L11D7:
    lda    SWCHA                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_81                ; 3
    ldx    engineStatus|READ     ; 4
    cpx    #$19                  ; 2
    bcs    L11F1                 ; 2³
    lda    ram_D2                ; 3
    cmp    #$78                  ; 2
    bcc    L11F1                 ; 2³
    lda    #$0D                  ; 2
    sta    ram_81                ; 3
L11F1:
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    bne    L11FB                 ; 2³
    jmp    START_0               ; 3

L11FB:
    lda    ram_C8                ; 3
    cmp    #$B2                  ; 2
    bcc    L1235                 ; 2³
    lda    ram_D2                ; 3
    cmp    #$04                  ; 2
    beq    L121B                 ; 2³
    bcc    L1217                 ; 2³
    jsr    L1E29                 ; 6
    lda    #$B4                  ; 2
    sta    sc_6E                 ; 4
    sta    ram_D1                ; 3
    lda    #$60                  ; 2
    sta    ram_CB                ; 3
L1217:
    lda    ram_D1                ; 3
    bne    L1235                 ; 2³
L121B:
    jmp    L1EE3                 ; 3

L121E:
    bit    INPT4|$30             ; 3
    bpl    L1232                 ; 2³
    lda    ram_92                ; 3
    cmp    #$14                  ; 2
    bcs    L1232                 ; 2³
    ldy    ram_C8                ; 3
    lda    L1DF7,Y               ; 4
    sta    ram_81                ; 3
    jmp    L1235                 ; 3

L1232:
    jmp    START_0               ; 3

L1235:
    ldy    INTIM                 ; 4
    bne    L1235                 ; 2³
    jmp    L12C9                 ; 3

L123D:
    ldx    #$27                  ; 2
    stx    NUSIZ0                ; 3
    ldy    ram_C9                ; 3
    bne    L1287                 ; 2³
    ldx    ram_C4                ; 3
    lda    L1A4D,X               ; 4
    sta    HMM0                  ; 3
    tay                          ; 2
    clc                          ; 2
    lda    ram_C4                ; 3
    adc    sc_0E|READ            ; 4
    tax                          ; 2
    lda    L1A4D,X               ; 4
    tax                          ; 2
    sta    HMBL                  ; 3
    tya                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    WASTE_4_CYCLES|$80    ; 4
    ldy    ram_80                ; 3
    ldy    ram_80                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
L1267:
    dey                          ; 2
    bpl    L1267                 ; 2³
    sta    RESM0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    ram_80                ; 3
    txa                          ; 2
    nop                          ; 2
    ldy    ram_80                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
L1277:
    dey                          ; 2
    bpl    L1277                 ; 2³
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    dec    ram_8B                ; 5
    rts                          ; 6

L1287:
    ldx    ram_C4                ; 3
    lda    L1A4D,X               ; 4
    sta    HMBL                  ; 3
    tay                          ; 2
    clc                          ; 2
    lda    ram_C4                ; 3
    adc    sc_0E|READ            ; 4
    tax                          ; 2
    lda    L1A4D,X               ; 4
    tax                          ; 2
    sta    HMM0                  ; 3
    tya                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    WASTE_4_CYCLES        ; 4
    ldy    ram_80                ; 3
    ldy    ram_80                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
L12A9:
    dey                          ; 2
    bpl    L12A9                 ; 2³
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    ram_80                ; 3
    txa                          ; 2
    nop                          ; 2
    ldy    ram_80                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
L12B9:
    dey                          ; 2
    bpl    L12B9                 ; 2³
    sta    RESM0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    dec    ram_8B                ; 5
    rts                          ; 6

L12C9:
    lda    #$00                  ; 2
    sta    VBLANK                ; 3
    lda    #$0F                  ; 2
    sta    COLUP0                ; 3
    lda    #$00                  ; 2
    sta    sc_7D                 ; 4
    jsr    L1EFC                 ; 6   bankswitch, goto L537C
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jsr    L123D                 ; 6
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    HMCLR                 ; 3
    ldx    #$00                  ; 2
    stx    sc_7D                 ; 4
    jsr    L1F20                 ; 6   bankswitch, goto L57DA
    ldx    ram_CD                ; 3
    lda    L1A4D,X               ; 4
    sta    HMP1                  ; 3
    ldx    #$01                  ; 2
    jsr    L1793                 ; 6
    dec    ram_8B                ; 5
    sta    CXCLR                 ; 3
    ldx    ram_84                ; 3
    lda    L1A4D,X               ; 4
    sta    HMP0                  ; 3
    ldx    #$00                  ; 2
    stx    HMP1                  ; 3
    jsr    L1793                 ; 6
    dec    ram_8B                ; 5
    lda    ram_CC                ; 3
    sta    NUSIZ1                ; 3
    lda    #$00                  ; 2
    sta    ram_85                ; 3
    sta    ram_87                ; 3
    sta    ram_8C                ; 3
    sta    HMCLR                 ; 3
    lda    ram_C7                ; 3
    asl                          ; 2
    tay                          ; 2
    lda    L1785,Y               ; 4
    sta    ram_C5                ; 3
    lda    L1785+1,Y             ; 4
    sta    ram_C6                ; 3
    lda    #$04                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    RESM1                 ; 3
    sta    COLUBK                ; 3
    ldy    #$03                  ; 2
    lda    (ram_C1),Y            ; 5
    sta    COLUPF                ; 3
    sta    COLUP0                ; 3
    lda    #$02                  ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
    lda    ram_8B                ; 3
    sec                          ; 2
    sbc    #$3C                  ; 2
    tax                          ; 2
    ldy    ram_C9                ; 3
    beq    L1353                 ; 2³
    jmp    L1423                 ; 3

L1353:
    and    #$01                  ; 2
    bne    L1388                 ; 2³
L1357:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    ram_8C                ; 3
    cpy    ram_CB                ; 3
    bcc    L1368                 ; 2³
    ldy    ram_87                ; 3
    lda    sc_41|READ,Y          ; 4
    sta    COLUP1                ; 3
L1368:
    ldy    ram_8C                ; 3
    lda    (ram_C1),Y            ; 5
    sta    COLUPF                ; 3
    sta    COLUP0                ; 3
    lda    (ram_C5),Y            ; 5
    tay                          ; 2
    bit    CXPPMM|$30            ; 3
    bvc    L137B                 ; 2³
    lda    #$00                  ; 2
    sta    ENAM0                 ; 3
L137B:
    sta    HMM0                  ; 3
    bit    CXM1FB|$30            ; 3
    bvc    L1385                 ; 2³
    ldy    #$00                  ; 2
    sty    ENABL                 ; 3
L1385:
    sty    HMBL                  ; 3
    dex                          ; 2
L1388:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    ram_8C                ; 3
    cpy    ram_CB                ; 3
    bcc    L139D                 ; 2³
    ldy    ram_87                ; 3
    lda    sc_37|READ,Y          ; 4
    sta    GRP1                  ; 3
    beq    L139D                 ; 2³
    inc    ram_87                ; 5
L139D:
    ldy    ram_8C                ; 3
    lda.wy ram_96,Y              ; 4
    bit    CXPPMM|$30            ; 3
    bvs    L13A8                 ; 2³
    sta    HMM0                  ; 3
L13A8:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    bit    CXM1FB|$30            ; 3
    bvs    L13B2                 ; 2³
    sta    HMBL                  ; 3
L13B2:
    inc    ram_8C                ; 5
    dex                          ; 2
    bne    L1357                 ; 2³
    stx    ENAM0                 ; 3
    ldx    #$10                  ; 2
L13BB:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    sc_1F|READ,X          ; 4
    sta    COLUP0                ; 3
    lda    sc_0F|READ,X          ; 4
    sta    GRP0                  ; 3
    ldy    ram_8C                ; 3
    lda.wy ram_96,Y              ; 4
    bit    CXPPMM|$30            ; 3
    bvs    L13D4                 ; 2³
    stx    ram_C9                ; 3
L13D4:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    bit    CXM1FB|$30            ; 3
    bvs    L13DE                 ; 2³
    sta    HMBL                  ; 3
L13DE:
    cpy    ram_CB                ; 3
    bcc    L13E9                 ; 2³
    ldy    ram_87                ; 3
    lda    sc_41|READ,Y          ; 4
    sta    COLUP1                ; 3
L13E9:
    dex                          ; 2
    ldy    ram_8C                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    sc_1F|READ,X          ; 4
    sta    COLUP0                ; 3
    lda    sc_0F|READ,X          ; 4
    sta    GRP0                  ; 3
    cpy    ram_CB                ; 3
    bcc    L1409                 ; 2³+1
    ldy    ram_87                ; 3
    lda    sc_37|READ,Y          ; 4
    sta    GRP1                  ; 3
    beq    L1409                 ; 2³
    inc    ram_87                ; 5
L1409:
    ldy    ram_8C                ; 3
    lda    (ram_C5),Y            ; 5
    bit    CXM1FB|$30            ; 3
    bvc    L1415                 ; 2³
    lda    #$00                  ; 2
    sta    ENABL                 ; 3
L1415:
    sta    HMBL                  ; 3
    inc    ram_8C                ; 5
    dex                          ; 2
    bne    L13BB                 ; 2³+1
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    L14EE                 ; 3

L1423:
    and    #$01                  ; 2
    bne    L1458                 ; 2³
L1427:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    ram_8C                ; 3
    cpy    ram_CB                ; 3
    bcc    L1438                 ; 2³
    ldy    ram_87                ; 3
    lda    sc_41|READ,Y          ; 4
    sta    COLUP1                ; 3
L1438:
    ldy    ram_8C                ; 3
    lda    (ram_C1),Y            ; 5
    sta    COLUP0                ; 3
    sta    COLUPF                ; 3
    lda    (ram_C5),Y            ; 5
    tay                          ; 2
    bit    CXPPMM|$30            ; 3
    bvc    L144B                 ; 2³
    lda    #$00                  ; 2
    sta    ENAM0                 ; 3
L144B:
    sta    HMM0                  ; 3
    bit    CXM1FB|$30            ; 3
    bvc    L1455                 ; 2³
    ldy    #$00                  ; 2
    sty    ENABL                 ; 3
L1455:
    sty    HMBL                  ; 3
    dex                          ; 2
L1458:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    ram_8C                ; 3
    cpy    ram_CB                ; 3
    bcc    L146D                 ; 2³
    ldy    ram_87                ; 3
    lda    sc_37|READ,Y          ; 4
    sta    GRP1                  ; 3
    beq    L146D                 ; 2³
    inc    ram_87                ; 5
L146D:
    ldy    ram_8C                ; 3
    lda.wy ram_96,Y              ; 4
    bit    CXM1FB|$30            ; 3
    bvs    L1478                 ; 2³
    sta    HMBL                  ; 3
L1478:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    bit    CXPPMM|$30            ; 3
    bvs    L1482                 ; 2³
    sta    HMM0                  ; 3
L1482:
    inc    ram_8C                ; 5
    dex                          ; 2
    bne    L1427                 ; 2³
    stx    ENAM0                 ; 3
    ldx    #$10                  ; 2
L148B:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    sc_1F|READ,X          ; 4
    sta    COLUP0                ; 3
    lda    sc_0F|READ,X          ; 4
    sta    GRP0                  ; 3
    ldy    ram_8C                ; 3
    lda.wy ram_96,Y              ; 4
    bit    CXM1FB|$30            ; 3
    bvs    L14A4                 ; 2³
    sta    HMBL                  ; 3
L14A4:
    bit    CXPPMM|$30            ; 3
    bvs    L14AC                 ; 2³
    lda    #$00                  ; 2
    sta    ram_C9                ; 3
L14AC:
    cpy    ram_CB                ; 3
    bcc    L14B7                 ; 2³
    ldy    ram_87                ; 3
    lda    sc_41|READ,Y          ; 4
    sta    COLUP1                ; 3
L14B7:
    dex                          ; 2
    ldy    ram_8C                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    sc_1F|READ,X          ; 4
    sta    COLUP0                ; 3
    lda    sc_0F|READ,X          ; 4
    sta    GRP0                  ; 3
    cpy    ram_CB                ; 3
    bcc    L14D7                 ; 2³
    ldy    ram_87                ; 3
    lda    sc_37|READ,Y          ; 4
    sta    GRP1                  ; 3
    beq    L14D7                 ; 2³
    inc    ram_87                ; 5
L14D7:
    ldy    ram_8C                ; 3
    lda    (ram_C5),Y            ; 5
    bit    CXM1FB|$30            ; 3
    bvc    L14E3                 ; 2³
    lda    #$00                  ; 2
    sta    ENABL                 ; 3
L14E3:
    sta    HMBL                  ; 3
    inc    ram_8C                ; 5
    dex                          ; 2
    bne    L148B                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
L14EE:
    lda    #$00                  ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUBK                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    COLUPF                ; 3
    lda    #$00                  ; 2
    jsr    L1F02                 ; 6   bankswitch, goto L545C
    lda    #$30                  ; 2
    sta    TIM64T                ; 4
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    dec    ram_94                ; 5
    bne    L1533                 ; 2³
    lda    #$3C                  ; 2
    sta    ram_94                ; 3
    inc    ram_92                ; 5
    lda    ram_92                ; 3
    and    #$03                  ; 2
    bne    L1533                 ; 2³
    lda    bonusStatus|READ      ; 4
    beq    L1533                 ; 2³
    sec                          ; 2
    sbc    #$01                  ; 2
  IF BONUS_LOSS
    sta    bonusStatus           ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
L1533:
    lda    ram_94                ; 3
    and    #$01                  ; 2
    beq    L157D                 ; 2³
    jsr    L1F08                 ; 6   bankswitch, goto L911C
    bit    ram_CA                ; 3
    bpl    L1570                 ; 2³
    lda    ram_C4                ; 3
    ldy    #$06                  ; 2
    cmp    #$76                  ; 2
    bcs    L1568                 ; 2³
    ldy    #$05                  ; 2
    cmp    #$68                  ; 2
    bcs    L1568                 ; 2³
    ldy    #$04                  ; 2
    cmp    #$58                  ; 2
    bcs    L1568                 ; 2³
    ldy    #$03                  ; 2
    cmp    #$39                  ; 2
    bcs    L1568                 ; 2³
    ldy    #$02                  ; 2
    cmp    #$29                  ; 2
    bcs    L1568                 ; 2³
    ldy    #$01                  ; 2
    cmp    #$1B                  ; 2
    bcs    L1568                 ; 2³
    ldy    #$00                  ; 2
L1568:
    sty    ram_C7                ; 3
    lda    ram_CA                ; 3
    and    #$7F                  ; 2
    sta    ram_CA                ; 3
L1570:
    ldy    ram_C7                ; 3
    lda    ram_D3                ; 3
    clc                          ; 2
    adc    L1A46,Y               ; 4
    sta    ram_C3                ; 3
    jmp    L166F                 ; 3

L157D:
    jsr    L1F14                 ; 6   bankswitch, goto L3242
    lda    ram_81                ; 3
    cmp    #$0F                  ; 2
    beq    L1589                 ; 2³
    jsr    L15BF                 ; 6
L1589:
    lda    ram_C7                ; 3
    cmp    #$02                  ; 2
    bcc    L1595                 ; 2³
    cmp    #$05                  ; 2
    bcc    L15AB                 ; 2³
    bcs    L15A0                 ; 3   always branch

L1595:
    jsr    L1EBF                 ; 6
    bcc    L159D                 ; 2³
    jsr    L16C9                 ; 6
L159D:
    jmp    L15AB                 ; 3

L15A0:
    jsr    L1EBF                 ; 6
    bcc    L159D                 ; 2³
    jsr    L1726                 ; 6
    jmp    L15AB                 ; 3

L15AB:
    ldy    INTIM                 ; 4
    bne    L15AB                 ; 2³
    jmp    L1135                 ; 3

L15B3:
    jmp    L1726                 ; 3

L15B6:
    jmp    L16C9                 ; 3

    jsr    L1639                 ; 6  ever reached?
    jmp    L15CB                 ; 3

L15BF:
    lda    ram_94                ; 3
    and    #$03                  ; 2
    bne    L15CB                 ; 2³
    lda    ram_81                ; 3
    and    #$01                  ; 2
    beq    L15E4                 ; 2³
L15CB:
    lda    ram_81                ; 3
    cmp    #$0D                  ; 2
    beq    L1639                 ; 2³+1
L15D1:
    lda    ram_81                ; 3
    cmp    #$07                  ; 2
    beq    L15B6                 ; 2³
    cmp    #$0B                  ; 2
    beq    L15B3                 ; 2³
    cmp    #$0A                  ; 2
    beq    L15B3                 ; 2³
    cmp    #$06                  ; 2
    beq    L15B6                 ; 2³
    rts                          ; 6

L15E4:
    jsr    L1ED1                 ; 6
    bcc    L1636                 ; 2³+1
    lda    #$C8                  ; 2
    sta    ram_83                ; 3
    lda    sc_6E|READ            ; 4
    bne    L1636                 ; 2³+1
    lda    engineStatus|READ     ; 4
    cmp    #$26                  ; 2
    bcs    L15FD                 ; 2³
    lda    #$6E                  ; 2
    sta    ram_83                ; 3
L15FD:
    lda    ram_D2                ; 3
    cmp    ram_83                ; 3
    bcs    L1632                 ; 2³
    lda    ram_D2                ; 3
    clc                          ; 2
    adc    #$02                  ; 2
    sta    ram_D2                ; 3
    sed                          ; 2
    lda    sc_04|READ            ; 4
    clc                          ; 2
    adc    #$02                  ; 2
    sta    sc_04                 ; 4
    bcc    L161E                 ; 2³
    lda    sc_03|READ            ; 4
    adc    #$00                  ; 2
    sta    sc_03                 ; 4
L161E:
    lda    ram_D2                ; 3
    cmp    #$C9                  ; 2
    bcc    L1632                 ; 2³
    lda    #$C8                  ; 2
    sta    ram_D2                ; 3
    lda    #$20                  ; 2
    sta    sc_03                 ; 4
    lda    #$00                  ; 2
    sta    sc_04                 ; 4
L1632:
    cld                          ; 2
    jsr    L1F1A                 ; 6   bankswitch, goto L920E
L1636:
    jmp    L15D1                 ; 3

L1639:
    lda    ram_D2                ; 3
    beq    L166A                 ; 2³
    sec                          ; 2
    sbc    #$04                  ; 2
    sta    ram_D2                ; 3
    sed                          ; 2
    lda    sc_04|READ            ; 4
    sec                          ; 2
    sbc    #$04                  ; 2
    sta    sc_04                 ; 4
    bcs    L1656                 ; 2³
    lda    sc_03|READ            ; 4
    sbc    #$00                  ; 2
    sta    sc_03                 ; 4
L1656:
    lda    ram_D2                ; 3
    bpl    L166A                 ; 2³
    cmp    #$D2                  ; 2
    beq    L166A                 ; 2³
    bcc    L166A                 ; 2³
    lda    #$00                  ; 2
    sta    ram_D2                ; 3
    sta    sc_04                 ; 4
    sta    sc_03                 ; 4
L166A:
    cld                          ; 2
    jsr    L1F1A                 ; 6   bankswitch, goto L920E
    rts                          ; 6

L166F:
    ldx    #$00                  ; 2
    jsr    L1F4A                 ; 6   bankswitch, goto L9241
    ldx    #$00                  ; 2
    lda    engineStatus|READ     ; 4   update status bars display
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L1E5C,Y               ; 4
    sta    sc_30,X               ; 5
    inx                          ; 2
    lda    tireStatus|READ       ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L1E5C,Y               ; 4
    sta    sc_30,X               ; 5
    inx                          ; 2
    lda    armorStatus|READ      ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L1E5C,Y               ; 4
    sta    sc_30,X               ; 5
    inx                          ; 2
    lda    bonusStatus|READ      ; 4
    lsr                          ; 2
    tay                          ; 2
    lda    L1E7A,Y               ; 4
    sta    sc_30,X               ; 5
    lda    ram_84                ; 3
    cmp    #$66                  ; 2
    bcs    L16BD                 ; 2³
    cmp    #$14                  ; 2
    bcc    L16BD                 ; 2³
L16B5:
    ldy    INTIM                 ; 4
    bne    L16B5                 ; 2³
    jmp    L1135                 ; 3

L16BD:
    lda    ram_D2                ; 3
    cmp    #$28                  ; 2
    bcc    L16B5                 ; 2³
    jsr    L1E29                 ; 6
    jmp    L16B5                 ; 3

L16C9:
    lda    ram_D2                ; 3
    beq    L1719                 ; 2³+1
    lda    ram_C7                ; 3
    bne    L16DE                 ; 2³
    lda    ram_94                ; 3
    and    #$07                  ; 2
    bne    L16DE                 ; 2³
    bit    ram_D9                ; 3
    bmi    L16DE                 ; 2³
    jsr    L1639                 ; 6
L16DE:
    lda    ram_84                ; 3
    cmp    #$40                  ; 2
    bne    L171C                 ; 2³+1
    lda    ram_D3                ; 3
    cmp    #$C2                  ; 2
    bcs    L16EE                 ; 2³
    cmp    #$2E                  ; 2
    bcs    L171A                 ; 2³+1
L16EE:
    bit    sc_4B|READ            ; 4
    bmi    L1710                 ; 2³+1
    bit    CXP1FB|$30            ; 3
    bvs    L1710                 ; 2³+1
    bit    CXM0P|$30             ; 3
    bmi    L1710                 ; 2³+1
    lda    ram_CD                ; 3
    cmp    #$6B                  ; 2
    bcs    L1710                 ; 2³
    lda    ram_CB                ; 3
    cmp    #$16                  ; 2
    bcs    L1709                 ; 2³
    bcc    L1710                 ; 3   always branch

L1709:
    lda    ram_CD                ; 3
    sec                          ; 2
    sbc    #$02                  ; 2
    sta    ram_CD                ; 3
L1710:
    lda    ram_D3                ; 3
    and    #$FE                  ; 2
    sec                          ; 2
    sbc    #$04                  ; 2
    sta    ram_D3                ; 3
L1719:
    rts                          ; 6

L171A:
    lda    ram_84                ; 3
L171C:
    cmp    #$7A                  ; 2
    beq    L1719                 ; 2³
    clc                          ; 2
    adc    #$02                  ; 2
    sta    ram_84                ; 3
    rts                          ; 6

L1726:
    lda    ram_D2                ; 3
    beq    L1778                 ; 2³
    lda    ram_C7                ; 3
    cmp    #$06                  ; 2
    bne    L173D                 ; 2³
    bit    ram_D9                ; 3
    bmi    L173D                 ; 2³
    lda    ram_94                ; 3
    and    #$07                  ; 2
    bne    L173D                 ; 2³
    jsr    L1639                 ; 6
L173D:
    lda    ram_84                ; 3
    cmp    #$40                  ; 2
    bne    L177B                 ; 2³
    lda    ram_D3                ; 3
    cmp    #$2A                  ; 2
    bcc    L174D                 ; 2³
    cmp    #$BE                  ; 2
    bcc    L1779                 ; 2³
L174D:
    bit    sc_4B|READ            ; 4
    bmi    L176F                 ; 2³
    bit    CXP1FB|$30            ; 3
    bvs    L176F                 ; 2³
    bit    CXM0P|$30             ; 3
    bmi    L176F                 ; 2³
    lda    ram_CD                ; 3
    cmp    #$14                  ; 2
    bcc    L176F                 ; 2³
    lda    ram_CB                ; 3
    cmp    #$16                  ; 2
    bcs    L1768                 ; 2³
    bcc    L176F                 ; 3   always branch

L1768:
    lda    ram_CD                ; 3
    clc                          ; 2
    adc    #$02                  ; 2
    sta    ram_CD                ; 3
L176F:
    lda    ram_D3                ; 3
    and    #$FE                  ; 2
    clc                          ; 2
    adc    #$04                  ; 2
    sta    ram_D3                ; 3
L1778:
    rts                          ; 6

L1779:
    lda    ram_84                ; 3
L177B:
    cmp    #$06                  ; 2
    beq    L1778                 ; 2³
    sec                          ; 2
    sbc    #$02                  ; 2
    sta    ram_84                ; 3
    rts                          ; 6

L1785:
    .word L17A9          ; $1785
    .word L17D6          ; $1787
    .word L1803          ; $1789
    .word L1830          ; $178B
    .word L185D          ; $178D
    .word L188A          ; $178F
    .word L18B7          ; $1791

L1793:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    WASTE_4_CYCLES        ; 4
    ldy    ram_80                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
L179F:
    dey                          ; 2
    bpl    L179F                 ; 2³
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

L17A9:
    .byte RIGHT_2        ; $17A9
    .byte RIGHT_2        ; $17AA
    .byte RIGHT_2        ; $17AB
    .byte RIGHT_2        ; $17AC
    .byte RIGHT_2        ; $17AD
    .byte RIGHT_1        ; $17AE
    .byte RIGHT_2        ; $17AF
    .byte RIGHT_1        ; $17B0
    .byte RIGHT_2        ; $17B1
    .byte RIGHT_1        ; $17B2
    .byte RIGHT_1        ; $17B3
    .byte RIGHT_1        ; $17B4
    .byte RIGHT_1        ; $17B5
    .byte RIGHT_1        ; $17B6
    .byte RIGHT_1        ; $17B7
    .byte RIGHT_1        ; $17B8
    .byte RIGHT_1        ; $17B9
    .byte RIGHT_1        ; $17BA
    .byte RIGHT_1        ; $17BB
    .byte RIGHT_1        ; $17BC
    .byte RIGHT_1        ; $17BD
    .byte RIGHT_1        ; $17BE
    .byte RIGHT_1        ; $17BF
    .byte RIGHT_1        ; $17C0
    .byte RIGHT_1        ; $17C1
    .byte RIGHT_1        ; $17C2
    .byte NO_MOTION      ; $17C3
    .byte RIGHT_1        ; $17C4
    .byte NO_MOTION      ; $17C5
    .byte RIGHT_1        ; $17C6
    .byte RIGHT_1        ; $17C7
    .byte NO_MOTION      ; $17C8
    .byte RIGHT_1        ; $17C9
    .byte NO_MOTION      ; $17CA
    .byte RIGHT_1        ; $17CB
    .byte NO_MOTION      ; $17CC
    .byte NO_MOTION      ; $17CD
    .byte NO_MOTION      ; $17CE
    .byte NO_MOTION      ; $17CF
    .byte NO_MOTION      ; $17D0
    .byte NO_MOTION      ; $17D1
    .byte NO_MOTION      ; $17D2
    .byte NO_MOTION      ; $17D3
    .byte NO_MOTION      ; $17D4
    .byte NO_MOTION      ; $17D5
L17D6:
    .byte RIGHT_2        ; $17D6
    .byte RIGHT_2        ; $17D7
    .byte RIGHT_2        ; $17D8
    .byte RIGHT_1        ; $17D9
    .byte RIGHT_2        ; $17DA
    .byte RIGHT_2        ; $17DB
    .byte RIGHT_1        ; $17DC
    .byte RIGHT_2        ; $17DD
    .byte RIGHT_1        ; $17DE
    .byte RIGHT_1        ; $17DF
    .byte RIGHT_1        ; $17E0
    .byte RIGHT_1        ; $17E1
    .byte RIGHT_1        ; $17E2
    .byte NO_MOTION      ; $17E3
    .byte RIGHT_2        ; $17E4
    .byte RIGHT_1        ; $17E5
    .byte NO_MOTION      ; $17E6
    .byte RIGHT_1        ; $17E7
    .byte NO_MOTION      ; $17E8
    .byte NO_MOTION      ; $17E9
    .byte RIGHT_1        ; $17EA
    .byte NO_MOTION      ; $17EB
    .byte RIGHT_1        ; $17EC
    .byte NO_MOTION      ; $17ED
    .byte RIGHT_2        ; $17EE
    .byte RIGHT_1        ; $17EF
    .byte NO_MOTION      ; $17F0
    .byte RIGHT_1        ; $17F1
    .byte NO_MOTION      ; $17F2
    .byte NO_MOTION      ; $17F3
    .byte RIGHT_1        ; $17F4
    .byte NO_MOTION      ; $17F5
    .byte NO_MOTION      ; $17F6
    .byte RIGHT_1        ; $17F7
    .byte NO_MOTION      ; $17F8
    .byte RIGHT_1        ; $17F9
    .byte NO_MOTION      ; $17FA
    .byte NO_MOTION      ; $17FB
    .byte RIGHT_1        ; $17FC
    .byte NO_MOTION      ; $17FD
    .byte NO_MOTION      ; $17FE
    .byte NO_MOTION      ; $17FF
    .byte NO_MOTION      ; $1800
    .byte NO_MOTION      ; $1801
    .byte NO_MOTION      ; $1802
L1803:
    .byte RIGHT_2        ; $1803
    .byte RIGHT_2        ; $1804
    .byte RIGHT_1        ; $1805
    .byte RIGHT_1        ; $1806
    .byte RIGHT_1        ; $1807
    .byte RIGHT_1        ; $1808
    .byte NO_MOTION      ; $1809
    .byte RIGHT_1        ; $180A
    .byte NO_MOTION      ; $180B
    .byte RIGHT_1        ; $180C
    .byte RIGHT_1        ; $180D
    .byte NO_MOTION      ; $180E
    .byte RIGHT_1        ; $180F
    .byte NO_MOTION      ; $1810
    .byte NO_MOTION      ; $1811
    .byte RIGHT_1        ; $1812
    .byte NO_MOTION      ; $1813
    .byte RIGHT_1        ; $1814
    .byte NO_MOTION      ; $1815
    .byte NO_MOTION      ; $1816
    .byte RIGHT_1        ; $1817
    .byte NO_MOTION      ; $1818
    .byte NO_MOTION      ; $1819
    .byte NO_MOTION      ; $181A
    .byte NO_MOTION      ; $181B
    .byte RIGHT_1        ; $181C
    .byte NO_MOTION      ; $181D
    .byte RIGHT_1        ; $181E
    .byte NO_MOTION      ; $181F
    .byte NO_MOTION      ; $1820
    .byte RIGHT_1        ; $1821
    .byte NO_MOTION      ; $1822
    .byte NO_MOTION      ; $1823
    .byte NO_MOTION      ; $1824
    .byte NO_MOTION      ; $1825
    .byte RIGHT_1        ; $1826
    .byte NO_MOTION      ; $1827
    .byte NO_MOTION      ; $1828
    .byte NO_MOTION      ; $1829
    .byte NO_MOTION      ; $182A
    .byte RIGHT_1        ; $182B
    .byte NO_MOTION      ; $182C
    .byte NO_MOTION      ; $182D
    .byte NO_MOTION      ; $182E
    .byte NO_MOTION      ; $182F
L1830:
    .byte NO_MOTION      ; $1830
    .byte NO_MOTION      ; $1831
    .byte NO_MOTION      ; $1832
    .byte NO_MOTION      ; $1833
    .byte NO_MOTION      ; $1834
    .byte NO_MOTION      ; $1835
    .byte NO_MOTION      ; $1836
    .byte NO_MOTION      ; $1837
    .byte NO_MOTION      ; $1838
    .byte NO_MOTION      ; $1839
    .byte NO_MOTION      ; $183A
    .byte NO_MOTION      ; $183B
    .byte NO_MOTION      ; $183C
    .byte NO_MOTION      ; $183D
    .byte NO_MOTION      ; $183E
    .byte NO_MOTION      ; $183F
    .byte NO_MOTION      ; $1840
    .byte NO_MOTION      ; $1841
    .byte NO_MOTION      ; $1842
    .byte NO_MOTION      ; $1843
    .byte NO_MOTION      ; $1844
    .byte NO_MOTION      ; $1845
    .byte NO_MOTION      ; $1846
    .byte NO_MOTION      ; $1847
    .byte NO_MOTION      ; $1848
    .byte NO_MOTION      ; $1849
    .byte NO_MOTION      ; $184A
    .byte NO_MOTION      ; $184B
    .byte NO_MOTION      ; $184C
    .byte NO_MOTION      ; $184D
    .byte NO_MOTION      ; $184E
    .byte NO_MOTION      ; $184F
    .byte NO_MOTION      ; $1850
    .byte NO_MOTION      ; $1851
    .byte NO_MOTION      ; $1852
    .byte NO_MOTION      ; $1853
    .byte NO_MOTION      ; $1854
    .byte NO_MOTION      ; $1855
    .byte NO_MOTION      ; $1856
    .byte NO_MOTION      ; $1857
    .byte NO_MOTION      ; $1858
    .byte NO_MOTION      ; $1859
    .byte NO_MOTION      ; $185A
    .byte NO_MOTION      ; $185B
    .byte NO_MOTION      ; $185C
L185D:
    .byte LEFT_2         ; $185D
    .byte LEFT_2         ; $185E
    .byte LEFT_1         ; $185F
    .byte LEFT_1         ; $1860
    .byte LEFT_1         ; $1861
    .byte LEFT_1         ; $1862
    .byte NO_MOTION      ; $1863
    .byte LEFT_1         ; $1864
    .byte NO_MOTION      ; $1865
    .byte LEFT_1         ; $1866
    .byte LEFT_1         ; $1867
    .byte NO_MOTION      ; $1868
    .byte LEFT_1         ; $1869
    .byte NO_MOTION      ; $186A
    .byte NO_MOTION      ; $186B
    .byte LEFT_1         ; $186C
    .byte NO_MOTION      ; $186D
    .byte LEFT_1         ; $186E
    .byte NO_MOTION      ; $186F
    .byte NO_MOTION      ; $1870
    .byte LEFT_1         ; $1871
    .byte NO_MOTION      ; $1872
    .byte NO_MOTION      ; $1873
    .byte NO_MOTION      ; $1874
    .byte NO_MOTION      ; $1875
    .byte LEFT_1         ; $1876
    .byte NO_MOTION      ; $1877
    .byte LEFT_1         ; $1878
    .byte NO_MOTION      ; $1879
    .byte NO_MOTION      ; $187A
    .byte LEFT_1         ; $187B
    .byte NO_MOTION      ; $187C
    .byte NO_MOTION      ; $187D
    .byte NO_MOTION      ; $187E
    .byte NO_MOTION      ; $187F
    .byte LEFT_1         ; $1880
    .byte NO_MOTION      ; $1881
    .byte NO_MOTION      ; $1882
    .byte NO_MOTION      ; $1883
    .byte NO_MOTION      ; $1884
    .byte LEFT_1         ; $1885
    .byte NO_MOTION      ; $1886
    .byte NO_MOTION      ; $1887
    .byte NO_MOTION      ; $1888
    .byte NO_MOTION      ; $1889
L188A:
    .byte LEFT_2         ; $188A
    .byte LEFT_2         ; $188B
    .byte LEFT_2         ; $188C
    .byte LEFT_1         ; $188D
    .byte LEFT_2         ; $188E
    .byte LEFT_2         ; $188F
    .byte LEFT_1         ; $1890
    .byte LEFT_2         ; $1891
    .byte LEFT_1         ; $1892
    .byte LEFT_1         ; $1893
    .byte LEFT_1         ; $1894
    .byte LEFT_1         ; $1895
    .byte LEFT_1         ; $1896
    .byte NO_MOTION      ; $1897
    .byte LEFT_2         ; $1898
    .byte LEFT_1         ; $1899
    .byte NO_MOTION      ; $189A
    .byte LEFT_1         ; $189B
    .byte NO_MOTION      ; $189C
    .byte NO_MOTION      ; $189D
    .byte LEFT_1         ; $189E
    .byte NO_MOTION      ; $189F
    .byte LEFT_1         ; $18A0
    .byte NO_MOTION      ; $18A1
    .byte LEFT_2         ; $18A2
    .byte LEFT_1         ; $18A3
    .byte NO_MOTION      ; $18A4
    .byte LEFT_1         ; $18A5
    .byte NO_MOTION      ; $18A6
    .byte NO_MOTION      ; $18A7
    .byte LEFT_1         ; $18A8
    .byte NO_MOTION      ; $18A9
    .byte NO_MOTION      ; $18AA
    .byte LEFT_1         ; $18AB
    .byte NO_MOTION      ; $18AC
    .byte LEFT_1         ; $18AD
    .byte NO_MOTION      ; $18AE
    .byte NO_MOTION      ; $18AF
    .byte LEFT_1         ; $18B0
    .byte NO_MOTION      ; $18B1
    .byte NO_MOTION      ; $18B2
    .byte NO_MOTION      ; $18B3
    .byte NO_MOTION      ; $18B4
    .byte NO_MOTION      ; $18B5
    .byte NO_MOTION      ; $18B6
L18B7:
    .byte LEFT_2         ; $18B7
    .byte LEFT_2         ; $18B8
    .byte LEFT_2         ; $18B9
    .byte LEFT_2         ; $18BA
    .byte LEFT_2         ; $18BB
    .byte LEFT_1         ; $18BC
    .byte LEFT_2         ; $18BD
    .byte LEFT_1         ; $18BE
    .byte LEFT_2         ; $18BF
    .byte LEFT_1         ; $18C0
    .byte LEFT_1         ; $18C1
    .byte LEFT_1         ; $18C2
    .byte LEFT_1         ; $18C3
    .byte LEFT_1         ; $18C4
    .byte LEFT_1         ; $18C5
    .byte LEFT_1         ; $18C6
    .byte LEFT_1         ; $18C7
    .byte LEFT_1         ; $18C8
    .byte LEFT_1         ; $18C9
    .byte LEFT_1         ; $18CA
    .byte LEFT_1         ; $18CB
    .byte LEFT_1         ; $18CC
    .byte LEFT_1         ; $18CD
    .byte LEFT_1         ; $18CE
    .byte LEFT_1         ; $18CF
    .byte LEFT_1         ; $18D0
    .byte NO_MOTION      ; $18D1
    .byte LEFT_1         ; $18D2
    .byte NO_MOTION      ; $18D3
    .byte LEFT_1         ; $18D4
    .byte LEFT_1         ; $18D5
    .byte NO_MOTION      ; $18D6
    .byte LEFT_1         ; $18D7
    .byte NO_MOTION      ; $18D8
    .byte LEFT_1         ; $18D9
    .byte NO_MOTION      ; $18DA
    .byte NO_MOTION      ; $18DB
    .byte NO_MOTION      ; $18DC
    .byte NO_MOTION      ; $18DD
    .byte NO_MOTION      ; $18DE
    .byte NO_MOTION      ; $18DF
    .byte NO_MOTION      ; $18E0
    .byte NO_MOTION      ; $18E1
    .byte NO_MOTION      ; $18E2
    .byte NO_MOTION      ; $18E3

    .byte $10 ; |   X    | $18E4   LEFT_1?

L18E5:
    .byte $04 ; |     X  | $18E5
    .byte $03 ; |      XX| $18E6
    .byte $02 ; |      X | $18E7
    .byte $01 ; |       X| $18E8
    .byte $00 ; |        | $18E9
    .byte $FF ; |XXXXXXXX| $18EA
    .byte $FF ; |XXXXXXXX| $18EB
    .byte $FF ; |XXXXXXXX| $18EC
    .byte $FF ; |XXXXXXXX| $18ED
L18EE:
    .byte $1F ; |   XXXXX| $18EE  AUDF0
    .byte $1D ; |   XXX X| $18EF
    .byte $19 ; |   XX  X| $18F0
    .byte $17 ; |   X XXX| $18F1
    .byte $15 ; |   X X X| $18F2
    .byte $14 ; |   X X  | $18F3
    .byte $11 ; |   X   X| $18F4
    .byte $10 ; |   X    | $18F5
    .byte $0F ; |    XXXX| $18F6
    .byte $0D ; |    XX X| $18F7
    .byte $0C ; |    XX  | $18F8
    .byte $0B ; |    X XX| $18F9
    .byte $0A ; |    X X | $18FA
    .byte $09 ; |    X  X| $18FB
    .byte $08 ; |    X   | $18FC

L18FD:
    .word L1A19          ; $18FD
    .word L19EC          ; $18FF
    .word L19BF          ; $1901
    .word L1992          ; $1903
    .word L1965          ; $1905
    .word L1938          ; $1907
    .word L190B          ; $1909

L190B:
    .byte COL_EDGE_DARK  ; $190B
    .byte COL_EDGE_DARK  ; $190C
    .byte COL_EDGE_DARK  ; $190D
    .byte COL_EDGE_LIGHT ; $190E
    .byte COL_EDGE_LIGHT ; $190F
    .byte COL_EDGE_LIGHT ; $1910
    .byte COL_EDGE_DARK  ; $1911
    .byte COL_EDGE_DARK  ; $1912
    .byte COL_EDGE_DARK  ; $1913
    .byte COL_EDGE_LIGHT ; $1914
    .byte COL_EDGE_LIGHT ; $1915
    .byte COL_EDGE_LIGHT ; $1916
    .byte COL_EDGE_LIGHT ; $1917
    .byte COL_EDGE_DARK  ; $1918
    .byte COL_EDGE_DARK  ; $1919
    .byte COL_EDGE_DARK  ; $191A
    .byte COL_EDGE_DARK  ; $191B
    .byte COL_EDGE_LIGHT ; $191C
    .byte COL_EDGE_LIGHT ; $191D
    .byte COL_EDGE_LIGHT ; $191E
    .byte COL_EDGE_LIGHT ; $191F
    .byte COL_EDGE_LIGHT ; $1920
    .byte COL_EDGE_DARK  ; $1921
    .byte COL_EDGE_DARK  ; $1922
    .byte COL_EDGE_DARK  ; $1923
    .byte COL_EDGE_DARK  ; $1924
    .byte COL_EDGE_DARK  ; $1925
    .byte COL_EDGE_LIGHT ; $1926
    .byte COL_EDGE_LIGHT ; $1927
    .byte COL_EDGE_LIGHT ; $1928
    .byte COL_EDGE_LIGHT ; $1929
    .byte COL_EDGE_LIGHT ; $192A
    .byte COL_EDGE_DARK  ; $192B
    .byte COL_EDGE_DARK  ; $192C
    .byte COL_EDGE_DARK  ; $192D
    .byte COL_EDGE_DARK  ; $192E
    .byte COL_EDGE_DARK  ; $192F
    .byte COL_EDGE_LIGHT ; $1930
    .byte COL_EDGE_LIGHT ; $1931
    .byte COL_EDGE_LIGHT ; $1932
    .byte COL_EDGE_LIGHT ; $1933
    .byte COL_EDGE_LIGHT ; $1934
    .byte COL_EDGE_DARK  ; $1935
    .byte COL_EDGE_DARK  ; $1936
    .byte COL_EDGE_DARK  ; $1937
L1938:
    .byte COL_EDGE_LIGHT ; $1938
    .byte COL_EDGE_DARK  ; $1939
    .byte COL_EDGE_DARK  ; $193A
    .byte COL_EDGE_DARK  ; $193B
    .byte COL_EDGE_LIGHT ; $193C
    .byte COL_EDGE_LIGHT ; $193D
    .byte COL_EDGE_LIGHT ; $193E
    .byte COL_EDGE_DARK  ; $193F
    .byte COL_EDGE_DARK  ; $1940
    .byte COL_EDGE_DARK  ; $1941
    .byte COL_EDGE_LIGHT ; $1942
    .byte COL_EDGE_LIGHT ; $1943
    .byte COL_EDGE_LIGHT ; $1944
    .byte COL_EDGE_LIGHT ; $1945
    .byte COL_EDGE_DARK  ; $1946
    .byte COL_EDGE_DARK  ; $1947
    .byte COL_EDGE_DARK  ; $1948
    .byte COL_EDGE_DARK  ; $1949
    .byte COL_EDGE_LIGHT ; $194A
    .byte COL_EDGE_LIGHT ; $194B
    .byte COL_EDGE_LIGHT ; $194C
    .byte COL_EDGE_LIGHT ; $194D
    .byte COL_EDGE_LIGHT ; $194E
    .byte COL_EDGE_DARK  ; $194F
    .byte COL_EDGE_DARK  ; $1950
    .byte COL_EDGE_DARK  ; $1951
    .byte COL_EDGE_DARK  ; $1952
    .byte COL_EDGE_DARK  ; $1953
    .byte COL_EDGE_LIGHT ; $1954
    .byte COL_EDGE_LIGHT ; $1955
    .byte COL_EDGE_LIGHT ; $1956
    .byte COL_EDGE_LIGHT ; $1957
    .byte COL_EDGE_LIGHT ; $1958
    .byte COL_EDGE_DARK  ; $1959
    .byte COL_EDGE_DARK  ; $195A
    .byte COL_EDGE_DARK  ; $195B
    .byte COL_EDGE_DARK  ; $195C
    .byte COL_EDGE_DARK  ; $195D
    .byte COL_EDGE_LIGHT ; $195E
    .byte COL_EDGE_LIGHT ; $195F
    .byte COL_EDGE_LIGHT ; $1960
    .byte COL_EDGE_LIGHT ; $1961
    .byte COL_EDGE_LIGHT ; $1962
    .byte COL_EDGE_DARK  ; $1963
    .byte COL_EDGE_DARK  ; $1964
L1965:
    .byte COL_EDGE_LIGHT ; $1965
    .byte COL_EDGE_LIGHT ; $1966
    .byte COL_EDGE_DARK  ; $1967
    .byte COL_EDGE_DARK  ; $1968
    .byte COL_EDGE_DARK  ; $1969
    .byte COL_EDGE_LIGHT ; $196A
    .byte COL_EDGE_LIGHT ; $196B
    .byte COL_EDGE_LIGHT ; $196C
    .byte COL_EDGE_DARK  ; $196D
    .byte COL_EDGE_DARK  ; $196E
    .byte COL_EDGE_DARK  ; $196F
    .byte COL_EDGE_LIGHT ; $1970
    .byte COL_EDGE_LIGHT ; $1971
    .byte COL_EDGE_LIGHT ; $1972
    .byte COL_EDGE_LIGHT ; $1973
    .byte COL_EDGE_DARK  ; $1974
    .byte COL_EDGE_DARK  ; $1975
    .byte COL_EDGE_DARK  ; $1976
    .byte COL_EDGE_DARK  ; $1977
    .byte COL_EDGE_LIGHT ; $1978
    .byte COL_EDGE_LIGHT ; $1979
    .byte COL_EDGE_LIGHT ; $197A
    .byte COL_EDGE_LIGHT ; $197B
    .byte COL_EDGE_LIGHT ; $197C
    .byte COL_EDGE_DARK  ; $197D
    .byte COL_EDGE_DARK  ; $197E
    .byte COL_EDGE_DARK  ; $197F
    .byte COL_EDGE_DARK  ; $1980
    .byte COL_EDGE_DARK  ; $1981
    .byte COL_EDGE_LIGHT ; $1982
    .byte COL_EDGE_LIGHT ; $1983
    .byte COL_EDGE_LIGHT ; $1984
    .byte COL_EDGE_LIGHT ; $1985
    .byte COL_EDGE_LIGHT ; $1986
    .byte COL_EDGE_DARK  ; $1987
    .byte COL_EDGE_DARK  ; $1988
    .byte COL_EDGE_DARK  ; $1989
    .byte COL_EDGE_DARK  ; $198A
    .byte COL_EDGE_DARK  ; $198B
    .byte COL_EDGE_LIGHT ; $198C
    .byte COL_EDGE_LIGHT ; $198D
    .byte COL_EDGE_LIGHT ; $198E
    .byte COL_EDGE_LIGHT ; $198F
    .byte COL_EDGE_LIGHT ; $1990
    .byte COL_EDGE_DARK  ; $1991
L1992:
    .byte COL_EDGE_LIGHT ; $1992
    .byte COL_EDGE_LIGHT ; $1993
    .byte COL_EDGE_LIGHT ; $1994
    .byte COL_EDGE_DARK  ; $1995
    .byte COL_EDGE_DARK  ; $1996
    .byte COL_EDGE_DARK  ; $1997
    .byte COL_EDGE_LIGHT ; $1998
    .byte COL_EDGE_LIGHT ; $1999
    .byte COL_EDGE_LIGHT ; $199A
    .byte COL_EDGE_DARK  ; $199B
    .byte COL_EDGE_DARK  ; $199C
    .byte COL_EDGE_DARK  ; $199D
    .byte COL_EDGE_DARK  ; $199E
    .byte COL_EDGE_LIGHT ; $199F
    .byte COL_EDGE_LIGHT ; $19A0
    .byte COL_EDGE_LIGHT ; $19A1
    .byte COL_EDGE_LIGHT ; $19A2
    .byte COL_EDGE_DARK  ; $19A3
    .byte COL_EDGE_DARK  ; $19A4
    .byte COL_EDGE_DARK  ; $19A5
    .byte COL_EDGE_DARK  ; $19A6
    .byte COL_EDGE_LIGHT ; $19A7
    .byte COL_EDGE_LIGHT ; $19A8
    .byte COL_EDGE_LIGHT ; $19A9
    .byte COL_EDGE_LIGHT ; $19AA
    .byte COL_EDGE_LIGHT ; $19AB
    .byte COL_EDGE_DARK  ; $19AC
    .byte COL_EDGE_DARK  ; $19AD
    .byte COL_EDGE_DARK  ; $19AE
    .byte COL_EDGE_DARK  ; $19AF
    .byte COL_EDGE_DARK  ; $19B0
    .byte COL_EDGE_LIGHT ; $19B1
    .byte COL_EDGE_LIGHT ; $19B2
    .byte COL_EDGE_LIGHT ; $19B3
    .byte COL_EDGE_LIGHT ; $19B4
    .byte COL_EDGE_LIGHT ; $19B5
    .byte COL_EDGE_DARK  ; $19B6
    .byte COL_EDGE_DARK  ; $19B7
    .byte COL_EDGE_DARK  ; $19B8
    .byte COL_EDGE_DARK  ; $19B9
    .byte COL_EDGE_DARK  ; $19BA
    .byte COL_EDGE_LIGHT ; $19BB
    .byte COL_EDGE_LIGHT ; $19BC
    .byte COL_EDGE_LIGHT ; $19BD
    .byte COL_EDGE_LIGHT ; $19BE
L19BF:
    .byte COL_EDGE_DARK  ; $19BF
    .byte COL_EDGE_LIGHT ; $19C0
    .byte COL_EDGE_LIGHT ; $19C1
    .byte COL_EDGE_LIGHT ; $19C2
    .byte COL_EDGE_DARK  ; $19C3
    .byte COL_EDGE_DARK  ; $19C4
    .byte COL_EDGE_DARK  ; $19C5
    .byte COL_EDGE_LIGHT ; $19C6
    .byte COL_EDGE_LIGHT ; $19C7
    .byte COL_EDGE_LIGHT ; $19C8
    .byte COL_EDGE_DARK  ; $19C9
    .byte COL_EDGE_DARK  ; $19CA
    .byte COL_EDGE_DARK  ; $19CB
    .byte COL_EDGE_DARK  ; $19CC
    .byte COL_EDGE_LIGHT ; $19CD
    .byte COL_EDGE_LIGHT ; $19CE
    .byte COL_EDGE_LIGHT ; $19CF
    .byte COL_EDGE_LIGHT ; $19D0
    .byte COL_EDGE_DARK  ; $19D1
    .byte COL_EDGE_DARK  ; $19D2
    .byte COL_EDGE_DARK  ; $19D3
    .byte COL_EDGE_DARK  ; $19D4
    .byte COL_EDGE_DARK  ; $19D5
    .byte COL_EDGE_LIGHT ; $19D6
    .byte COL_EDGE_LIGHT ; $19D7
    .byte COL_EDGE_LIGHT ; $19D8
    .byte COL_EDGE_LIGHT ; $19D9
    .byte COL_EDGE_LIGHT ; $19DA
    .byte COL_EDGE_DARK  ; $19DB
    .byte COL_EDGE_DARK  ; $19DC
    .byte COL_EDGE_DARK  ; $19DD
    .byte COL_EDGE_DARK  ; $19DE
    .byte COL_EDGE_DARK  ; $19DF
    .byte COL_EDGE_LIGHT ; $19E0
    .byte COL_EDGE_LIGHT ; $19E1
    .byte COL_EDGE_LIGHT ; $19E2
    .byte COL_EDGE_LIGHT ; $19E3
    .byte COL_EDGE_LIGHT ; $19E4
    .byte COL_EDGE_DARK  ; $19E5
    .byte COL_EDGE_DARK  ; $19E6
    .byte COL_EDGE_DARK  ; $19E7
    .byte COL_EDGE_DARK  ; $19E8
    .byte COL_EDGE_DARK  ; $19E9
    .byte COL_EDGE_LIGHT ; $19EA
    .byte COL_EDGE_LIGHT ; $19EB
L19EC:
    .byte COL_EDGE_DARK  ; $19EC
    .byte COL_EDGE_DARK  ; $19ED
    .byte COL_EDGE_LIGHT ; $19EE
    .byte COL_EDGE_LIGHT ; $19EF
    .byte COL_EDGE_LIGHT ; $19F0
    .byte COL_EDGE_DARK  ; $19F1
    .byte COL_EDGE_DARK  ; $19F2
    .byte COL_EDGE_DARK  ; $19F3
    .byte COL_EDGE_LIGHT ; $19F4
    .byte COL_EDGE_LIGHT ; $19F5
    .byte COL_EDGE_LIGHT ; $19F6
    .byte COL_EDGE_DARK  ; $19F7
    .byte COL_EDGE_DARK  ; $19F8
    .byte COL_EDGE_DARK  ; $19F9
    .byte COL_EDGE_DARK  ; $19FA
    .byte COL_EDGE_LIGHT ; $19FB
    .byte COL_EDGE_LIGHT ; $19FC
    .byte COL_EDGE_LIGHT ; $19FD
    .byte COL_EDGE_LIGHT ; $19FE
    .byte COL_EDGE_DARK  ; $19FF
    .byte COL_EDGE_DARK  ; $1A00
    .byte COL_EDGE_DARK  ; $1A01
    .byte COL_EDGE_DARK  ; $1A02
    .byte COL_EDGE_DARK  ; $1A03
    .byte COL_EDGE_LIGHT ; $1A04
    .byte COL_EDGE_LIGHT ; $1A05
    .byte COL_EDGE_LIGHT ; $1A06
    .byte COL_EDGE_LIGHT ; $1A07
    .byte COL_EDGE_LIGHT ; $1A08
    .byte COL_EDGE_DARK  ; $1A09
    .byte COL_EDGE_DARK  ; $1A0A
    .byte COL_EDGE_DARK  ; $1A0B
    .byte COL_EDGE_DARK  ; $1A0C
    .byte COL_EDGE_DARK  ; $1A0D
    .byte COL_EDGE_LIGHT ; $1A0E
    .byte COL_EDGE_LIGHT ; $1A0F
    .byte COL_EDGE_LIGHT ; $1A10
    .byte COL_EDGE_LIGHT ; $1A11
    .byte COL_EDGE_LIGHT ; $1A12
    .byte COL_EDGE_DARK  ; $1A13
    .byte COL_EDGE_DARK  ; $1A14
    .byte COL_EDGE_DARK  ; $1A15
    .byte COL_EDGE_DARK  ; $1A16
    .byte COL_EDGE_DARK  ; $1A17
    .byte COL_EDGE_LIGHT ; $1A18
L1A19:
    .byte COL_EDGE_DARK  ; $1A19
    .byte COL_EDGE_DARK  ; $1A1A
    .byte COL_EDGE_DARK  ; $1A1B
    .byte COL_EDGE_LIGHT ; $1A1C
    .byte COL_EDGE_LIGHT ; $1A1D
    .byte COL_EDGE_LIGHT ; $1A1E
    .byte COL_EDGE_DARK  ; $1A1F
    .byte COL_EDGE_DARK  ; $1A20
    .byte COL_EDGE_DARK  ; $1A21
    .byte COL_EDGE_LIGHT ; $1A22
    .byte COL_EDGE_LIGHT ; $1A23
    .byte COL_EDGE_LIGHT ; $1A24
    .byte COL_EDGE_LIGHT ; $1A25
    .byte COL_EDGE_DARK  ; $1A26
    .byte COL_EDGE_DARK  ; $1A27
    .byte COL_EDGE_DARK  ; $1A28
    .byte COL_EDGE_DARK  ; $1A29
    .byte COL_EDGE_LIGHT ; $1A2A
    .byte COL_EDGE_LIGHT ; $1A2B
    .byte COL_EDGE_LIGHT ; $1A2C
    .byte COL_EDGE_LIGHT ; $1A2D
    .byte COL_EDGE_DARK  ; $1A2E
    .byte COL_EDGE_DARK  ; $1A2F
    .byte COL_EDGE_DARK  ; $1A30
    .byte COL_EDGE_DARK  ; $1A31
    .byte COL_EDGE_DARK  ; $1A32
    .byte COL_EDGE_LIGHT ; $1A33
    .byte COL_EDGE_LIGHT ; $1A34
    .byte COL_EDGE_LIGHT ; $1A35
    .byte COL_EDGE_LIGHT ; $1A36
    .byte COL_EDGE_LIGHT ; $1A37
    .byte COL_EDGE_DARK  ; $1A38
    .byte COL_EDGE_DARK  ; $1A39
    .byte COL_EDGE_DARK  ; $1A3A
    .byte COL_EDGE_DARK  ; $1A3B
    .byte COL_EDGE_DARK  ; $1A3C
    .byte COL_EDGE_LIGHT ; $1A3D
    .byte COL_EDGE_LIGHT ; $1A3E
    .byte COL_EDGE_LIGHT ; $1A3F
    .byte COL_EDGE_LIGHT ; $1A40
    .byte COL_EDGE_LIGHT ; $1A41
    .byte COL_EDGE_DARK  ; $1A42
    .byte COL_EDGE_DARK  ; $1A43
    .byte COL_EDGE_DARK  ; $1A44
    .byte COL_EDGE_DARK  ; $1A45
L1A46:
    .byte $DA ; |XX XX X | $1A46
    .byte $E0 ; |XXX     | $1A47
    .byte $EC ; |XXX XX  | $1A48
    .byte $00 ; |        | $1A49
    .byte $14 ; |   X X  | $1A4A
    .byte $20 ; |  X     | $1A4B
    .byte $26 ; |  X  XX | $1A4C
L1A4D:
    .byte   RIGHT_8|10   ; $1A4D
    .byte    LEFT_4|0    ; $1A4E
    .byte    LEFT_3|0    ; $1A4F
    .byte    LEFT_2|0    ; $1A50
    .byte    LEFT_7|1    ; $1A51
    .byte    LEFT_6|1    ; $1A52
    .byte    LEFT_5|1    ; $1A53
    .byte    LEFT_4|1    ; $1A54
    .byte    LEFT_3|1    ; $1A55
    .byte    LEFT_2|1    ; $1A56
    .byte    LEFT_1|1    ; $1A57
    .byte NO_MOTION|1    ; $1A58
    .byte   RIGHT_1|1    ; $1A59
    .byte   RIGHT_2|1    ; $1A5A
    .byte   RIGHT_3|1    ; $1A5B
    .byte   RIGHT_4|1    ; $1A5C
    .byte   RIGHT_5|1    ; $1A5D
    .byte   RIGHT_6|1    ; $1A5E
    .byte   RIGHT_7|1    ; $1A5F
    .byte    LEFT_7|2    ; $1A60
    .byte    LEFT_6|2    ; $1A61
    .byte    LEFT_5|2    ; $1A62
    .byte    LEFT_4|2    ; $1A63
    .byte    LEFT_3|2    ; $1A64
    .byte    LEFT_2|2    ; $1A65
    .byte    LEFT_1|2    ; $1A66
    .byte NO_MOTION|2    ; $1A67
    .byte   RIGHT_1|2    ; $1A68
    .byte   RIGHT_2|2    ; $1A69
    .byte   RIGHT_3|2    ; $1A6A
    .byte   RIGHT_4|2    ; $1A6B
    .byte   RIGHT_5|2    ; $1A6C
    .byte   RIGHT_6|2    ; $1A6D
    .byte   RIGHT_7|2    ; $1A6E
    .byte    LEFT_7|3    ; $1A6F
    .byte    LEFT_6|3    ; $1A70
    .byte    LEFT_5|3    ; $1A71
    .byte    LEFT_4|3    ; $1A72
    .byte    LEFT_3|3    ; $1A73
    .byte    LEFT_2|3    ; $1A74
    .byte    LEFT_1|3    ; $1A75
    .byte NO_MOTION|3    ; $1A76
    .byte   RIGHT_1|3    ; $1A77
    .byte   RIGHT_2|3    ; $1A78
    .byte   RIGHT_3|3    ; $1A79
    .byte   RIGHT_4|3    ; $1A7A
    .byte   RIGHT_5|3    ; $1A7B
    .byte   RIGHT_6|3    ; $1A7C
    .byte   RIGHT_7|3    ; $1A7D
    .byte    LEFT_7|4    ; $1A7E
    .byte    LEFT_6|4    ; $1A7F
    .byte    LEFT_5|4    ; $1A80
    .byte    LEFT_4|4    ; $1A81
    .byte    LEFT_3|4    ; $1A82
    .byte    LEFT_2|4    ; $1A83
    .byte    LEFT_1|4    ; $1A84
    .byte NO_MOTION|4    ; $1A85
    .byte   RIGHT_1|4    ; $1A86
    .byte   RIGHT_2|4    ; $1A87
    .byte   RIGHT_3|4    ; $1A88
    .byte   RIGHT_4|4    ; $1A89
    .byte   RIGHT_5|4    ; $1A8A
    .byte   RIGHT_6|4    ; $1A8B
    .byte   RIGHT_7|4    ; $1A8C
    .byte    LEFT_7|5    ; $1A8D
    .byte    LEFT_6|5    ; $1A8E
    .byte    LEFT_5|5    ; $1A8F
    .byte    LEFT_4|5    ; $1A90
    .byte    LEFT_3|5    ; $1A91
    .byte    LEFT_2|5    ; $1A92
    .byte    LEFT_1|5    ; $1A93
    .byte NO_MOTION|5    ; $1A94
    .byte   RIGHT_1|5    ; $1A95
    .byte   RIGHT_2|5    ; $1A96
    .byte   RIGHT_3|5    ; $1A97
    .byte   RIGHT_4|5    ; $1A98
    .byte   RIGHT_5|5    ; $1A99
    .byte   RIGHT_6|5    ; $1A9A
    .byte   RIGHT_7|5    ; $1A9B
    .byte    LEFT_7|6    ; $1A9C
    .byte    LEFT_6|6    ; $1A9D
    .byte    LEFT_5|6    ; $1A9E
    .byte    LEFT_4|6    ; $1A9F
    .byte    LEFT_3|6    ; $1AA0
    .byte    LEFT_2|6    ; $1AA1
    .byte    LEFT_1|6    ; $1AA2
    .byte NO_MOTION|6    ; $1AA3
    .byte   RIGHT_1|6    ; $1AA4
    .byte   RIGHT_2|6    ; $1AA5
    .byte   RIGHT_3|6    ; $1AA6
    .byte   RIGHT_4|6    ; $1AA7
    .byte   RIGHT_5|6    ; $1AA8
    .byte   RIGHT_6|6    ; $1AA9
    .byte   RIGHT_7|6    ; $1AAA
    .byte    LEFT_7|7    ; $1AAB
    .byte    LEFT_6|7    ; $1AAC
    .byte    LEFT_5|7    ; $1AAD
    .byte    LEFT_4|7    ; $1AAE
    .byte    LEFT_3|7    ; $1AAF
    .byte    LEFT_2|7    ; $1AB0
    .byte    LEFT_1|7    ; $1AB1
    .byte NO_MOTION|7    ; $1AB2
    .byte   RIGHT_1|7    ; $1AB3
    .byte   RIGHT_2|7    ; $1AB4
    .byte   RIGHT_3|7    ; $1AB5
    .byte   RIGHT_4|7    ; $1AB6
    .byte   RIGHT_5|7    ; $1AB7
    .byte   RIGHT_6|7    ; $1AB8
    .byte   RIGHT_7|7    ; $1AB9
    .byte    LEFT_7|8    ; $1ABA
    .byte    LEFT_6|8    ; $1ABB
    .byte    LEFT_5|8    ; $1ABC
    .byte    LEFT_4|8    ; $1ABD
    .byte    LEFT_3|8    ; $1ABE
    .byte    LEFT_2|8    ; $1ABF
    .byte    LEFT_1|8    ; $1AC0
    .byte NO_MOTION|8    ; $1AC1
    .byte   RIGHT_1|8    ; $1AC2
    .byte   RIGHT_2|8    ; $1AC3
    .byte   RIGHT_3|8    ; $1AC4
    .byte   RIGHT_4|8    ; $1AC5
    .byte   RIGHT_5|8    ; $1AC6
    .byte   RIGHT_6|8    ; $1AC7
    .byte   RIGHT_7|8    ; $1AC8
    .byte    LEFT_7|9    ; $1AC9
    .byte    LEFT_6|9    ; $1ACA
    .byte    LEFT_5|9    ; $1ACB
    .byte    LEFT_4|9    ; $1ACC
    .byte    LEFT_3|9    ; $1ACD
    .byte    LEFT_2|9    ; $1ACE
    .byte    LEFT_1|9    ; $1ACF
    .byte NO_MOTION|9    ; $1AD0
    .byte   RIGHT_1|9    ; $1AD1
    .byte   RIGHT_2|9    ; $1AD2
    .byte   RIGHT_3|9    ; $1AD3
    .byte   RIGHT_4|9    ; $1AD4
    .byte   RIGHT_5|9    ; $1AD5
    .byte   RIGHT_6|9    ; $1AD6
    .byte   RIGHT_7|9    ; $1AD7
    .byte    LEFT_7|10   ; $1AD8
    .byte    LEFT_6|10   ; $1AD9
    .byte    LEFT_5|10   ; $1ADA
    .byte    LEFT_4|10   ; $1ADB
    .byte    LEFT_3|10   ; $1ADC
    .byte    LEFT_2|10   ; $1ADD
    .byte    LEFT_1|10   ; $1ADE
    .byte NO_MOTION|10   ; $1ADF
    .byte   RIGHT_1|10   ; $1AE0
    .byte   RIGHT_2|10   ; $1AE1
    .byte   RIGHT_3|10   ; $1AE2
    .byte   RIGHT_4|10   ; $1AE3
    .byte   RIGHT_5|10   ; $1AE4
    .byte   RIGHT_6|10   ; $1AE5
    .byte   RIGHT_7|10   ; $1AE6
    .byte   RIGHT_8|10   ; $1AE7
    .byte   RIGHT_8|10   ; $1AE8
    .byte   RIGHT_8|10   ; $1AE9
    .byte   RIGHT_8|10   ; $1AEA
    .byte   RIGHT_8|10   ; $1AEB
    .byte   RIGHT_8|10   ; $1AEC
    .byte   RIGHT_8|10   ; $1AED
    .byte   RIGHT_8|10   ; $1AEE
    .byte   RIGHT_8|10   ; $1AEF
    .byte   RIGHT_8|10   ; $1AF0
    .byte   RIGHT_8|10   ; $1AF1
    .byte   RIGHT_8|10   ; $1AF2
    .byte   RIGHT_8|10   ; $1AF3
    .byte   RIGHT_8|10   ; $1AF4
    .byte   RIGHT_8|10   ; $1AF5
    .byte   RIGHT_8|10   ; $1AF6
    .byte   RIGHT_8|10   ; $1AF7
    .byte   RIGHT_8|10   ; $1AF8
    .byte   RIGHT_8|10   ; $1AF9
    .byte   RIGHT_8|10   ; $1AFA
    .byte   RIGHT_8|10   ; $1AFB
    .byte   RIGHT_8|10   ; $1AFC
    .byte   RIGHT_8|10   ; $1AFD
    .byte   RIGHT_8|10   ; $1AFE
    .byte   RIGHT_8|10   ; $1AFF
    .byte   RIGHT_8|10   ; $1B00
    .byte   RIGHT_8|10   ; $1B01
    .byte   RIGHT_8|10   ; $1B02
    .byte   RIGHT_8|10   ; $1B03
    .byte   RIGHT_8|10   ; $1B04
    .byte   RIGHT_8|10   ; $1B05
    .byte   RIGHT_8|10   ; $1B06
    .byte   RIGHT_8|10   ; $1B07
    .byte   RIGHT_8|10   ; $1B08
    .byte   RIGHT_8|10   ; $1B09
    .byte   RIGHT_8|10   ; $1B0A
    .byte   RIGHT_8|10   ; $1B0B
    .byte   RIGHT_8|10   ; $1B0C
    .byte   RIGHT_8|10   ; $1B0D
    .byte   RIGHT_8|10   ; $1B0E
    .byte   RIGHT_8|10   ; $1B0F
    .byte   RIGHT_8|10   ; $1B10
    .byte   RIGHT_8|10   ; $1B11
    .byte   RIGHT_8|10   ; $1B12
    .byte   RIGHT_8|10   ; $1B13
    .byte   RIGHT_8|10   ; $1B14
    .byte   RIGHT_8|10   ; $1B15
    .byte   RIGHT_8|10   ; $1B16
    .byte   RIGHT_8|10   ; $1B17
    .byte   RIGHT_8|10   ; $1B18
    .byte   RIGHT_8|10   ; $1B19
    .byte   RIGHT_8|10   ; $1B1A
    .byte   RIGHT_8|10   ; $1B1B
    .byte   RIGHT_8|10   ; $1B1C
    .byte   RIGHT_8|10   ; $1B1D
    .byte   RIGHT_8|10   ; $1B1E
    .byte   RIGHT_8|10   ; $1B1F
    .byte   RIGHT_8|10   ; $1B20
    .byte   RIGHT_8|10   ; $1B21
    .byte   RIGHT_8|10   ; $1B22
    .byte   RIGHT_8|10   ; $1B23
    .byte   RIGHT_8|10   ; $1B24
    .byte   RIGHT_8|10   ; $1B25
    .byte   RIGHT_8|10   ; $1B26
    .byte   RIGHT_8|10   ; $1B27
    .byte   RIGHT_8|10   ; $1B28
    .byte   RIGHT_8|10   ; $1B29
    .byte   RIGHT_8|10   ; $1B2A
    .byte   RIGHT_8|10   ; $1B2B
    .byte   RIGHT_8|10   ; $1B2C
    .byte   RIGHT_8|10   ; $1B2D
    .byte   RIGHT_8|10   ; $1B2E
    .byte   RIGHT_8|10   ; $1B2F
    .byte   RIGHT_8|10   ; $1B30
    .byte   RIGHT_8|10   ; $1B31
    .byte   RIGHT_8|10   ; $1B32
    .byte   RIGHT_8|10   ; $1B33
    .byte   RIGHT_8|10   ; $1B34
    .byte   RIGHT_8|10   ; $1B35
    .byte   RIGHT_8|10   ; $1B36
    .byte   RIGHT_8|10   ; $1B37
    .byte   RIGHT_8|10   ; $1B38
    .byte   RIGHT_8|10   ; $1B39
    .byte   RIGHT_8|10   ; $1B3A
    .byte   RIGHT_8|10   ; $1B3B
    .byte   RIGHT_8|10   ; $1B3C
    .byte   RIGHT_8|10   ; $1B3D
    .byte   RIGHT_8|10   ; $1B3E
    .byte   RIGHT_8|10   ; $1B3F
    .byte   RIGHT_8|10   ; $1B40
    .byte   RIGHT_8|10   ; $1B41
    .byte   RIGHT_8|10   ; $1B42
    .byte   RIGHT_8|10   ; $1B43
    .byte   RIGHT_8|10   ; $1B44
    .byte   RIGHT_8|10   ; $1B45
    .byte   RIGHT_8|10   ; $1B46
    .byte   RIGHT_8|10   ; $1B47
    .byte   RIGHT_8|10   ; $1B48
    .byte   RIGHT_8|10   ; $1B49
    .byte   RIGHT_8|10   ; $1B4A
    .byte   RIGHT_8|10   ; $1B4B
    .byte   RIGHT_8|10   ; $1B4C

L1B4D:
    lda    ram_D2                ; 3
    beq    L1BB0                 ; 2³
    dec    ram_CF                ; 5
    bpl    L1BB0                 ; 2³
    ldy    ram_CE                ; 3
    lda    L18E5,Y               ; 4
    sta    ram_CF                ; 3
    bit    sc_4B|READ            ; 4
    bpl    L1B6B                 ; 2³
    lda    sc_4C|READ            ; 4
    ora    #$80                  ; 2
    sta    sc_4C                 ; 4
    inc    ram_CB                ; 5
L1B6B:
    dec    ram_D0                ; 5
    bpl    L1B9B                 ; 2³
    ldy    #$05                  ; 2
    sty    ram_D0                ; 3
    ldy    ram_CE                ; 3
    cpy    #$05                  ; 2
    bne    L1B84                 ; 2³
    lda    #$04                  ; 2
    sta    ram_D0                ; 3
    bit    sc_4B|READ            ; 4
    bpl    L1B84                 ; 2³
    inc    ram_CB                ; 5
L1B84:
    cpy    #$06                  ; 2
    bne    L1B8C                 ; 2³
    lda    #$03                  ; 2
    sta    ram_D0                ; 3
L1B8C:
    cpy    #$07                  ; 2
    bcc    L1B9B                 ; 2³
    lda    #$02                  ; 2
    sta    ram_D0                ; 3
    bit    sc_4B|READ            ; 4
    bpl    L1B9B                 ; 2³
    inc    ram_CB                ; 5
L1B9B:
    lda    ram_D0                ; 3
    ldy    ram_CE                ; 3
    cpy    #$07                  ; 2
    bne    L1BA4                 ; 2³
    asl                          ; 2
L1BA4:
    asl                          ; 2
    tay                          ; 2
    lda    L18FD,Y               ; 4
    sta    ram_C1                ; 3
    lda    L18FD+1,Y             ; 4
    sta    ram_C2                ; 3
L1BB0:
    ldy    #$07                  ; 2
    lda    ram_D2                ; 3
    bne    L1C05                 ; 2³+1
    jmp    L1D0D                 ; 3

L1BB9:
    jsr    L1E29                 ; 6
    ldx    tireStatus|READ       ; 4
    cpx    #$02                  ; 2
    bcc    L1BC8                 ; 2³
    dex                          ; 2
    dex                          ; 2
  IF TIRE_DAMAGE
    stx    tireStatus            ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
L1BC8:
    lda    ram_C7                ; 3
    cmp    #$03                  ; 2
    bcs    L1BD6                 ; 2³
    jsr    L16C9                 ; 6
    ldy    #$04                  ; 2
    jmp    L1D0D                 ; 3

L1BD6:
    jsr    L1726                 ; 6
    ldy    #$04                  ; 2
    jmp    L1D0D                 ; 3

L1BDE:
    ldy    #$06                  ; 2
    lda    ram_D5                ; 3
    clc                          ; 2
    adc    #$32                  ; 2
    sta    ram_D5                ; 3
    lda    armorStatus|READ      ; 4
    clc                          ; 2
    adc    #$05                  ; 2
    bmi    L1BF2                 ; 2³
  IF ARMOR_DAMAGE
    sta    armorStatus           ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
L1BF2:
    lda    engineStatus|READ     ; 4
    clc                          ; 2
    adc    #$0A                  ; 2
    bmi    L1BFD                 ; 2³
  IF ENGINE_DAMAGE
    sta    engineStatus          ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
L1BFD:
    lda    #$00                  ; 2
    sta    sc_37                 ; 4
    jmp    L1D0D                 ; 3

L1C05:
    bit    ram_D9                ; 3
    bpl    L1C66                 ; 2³
    bit    CXPPMM|$30            ; 3
    bpl    L1C66                 ; 2³
    ldy    #$05                  ; 2
    lda    ram_D9                ; 3
    and    #$03                  ; 2
    beq    L1C4A                 ; 2³
    cmp    #$01                  ; 2
    beq    L1BB9                 ; 2³+1
    cmp    #$03                  ; 2
    bne    L1C42                 ; 2³
    jsr    L1E29                 ; 6
    ldy    #$02                  ; 2
    lda    #$0D                  ; 2
    sta    sc_4B                 ; 4
    ldx    tireStatus|READ       ; 4
    beq    L1C30                 ; 2³
    dex                          ; 2
  IF TIRE_DAMAGE
    stx    tireStatus            ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
L1C30:
    lda    armorStatus|READ      ; 4
    sec                          ; 2
    sbc    #$02                  ; 2
    cmp    #$F0                  ; 2
    bcc    L1C3C                 ; 2³
    lda    #$00                  ; 2
L1C3C:
  IF ARMOR_DAMAGE
    sta    armorStatus           ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
    jmp    L1C5E                 ; 3

L1C42:
    lda    #$50                  ; 2
    sta    bulletStatus          ; 4  reload, same value as unlimited bullet hack
    jmp    L1C5E                 ; 3

L1C4A:
    lda    fuelStatus|READ       ; 4
    cmp    #$44                  ; 2
    bcs    L1C5A                 ; 2³
    clc                          ; 2
    adc    #$03                  ; 2
  IF FUEL_LOSS
    sta    fuelStatus            ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
    jmp    L1C5E                 ; 3

L1C5A:
    inc    ram_D5                ; 5
    inc    ram_D5                ; 5
L1C5E:
    lda    #$00                  ; 2
    sta    sc_37                 ; 4
    jmp    L1D0D                 ; 3

L1C66:
    bit    CXP0FB|$30            ; 3
    bvc    L1C84                 ; 2³
    lda    ram_94                ; 3
    cmp    #$02                  ; 2
    bne    L1C84                 ; 2³
    ldy    #$04                  ; 2
    ldx    tireStatus|READ       ; 4
    beq    L1C7B                 ; 2³
    dex                          ; 2
  IF TIRE_DAMAGE
    stx    tireStatus            ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
L1C7B:
    ldx    engineStatus|READ     ; 4
    beq    L1C84                 ; 2³
    dex                          ; 2
  IF ENGINE_DAMAGE
    stx    engineStatus          ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
L1C84:
    bit    ram_D8                ; 3
    bpl    L1CBE                 ; 2³
    ldy    #$02                  ; 2
    lda    sc_4B|READ            ; 4
    cmp    #$0C                  ; 2
    bcs    L1CBE                 ; 2³
    ldy    #$03                  ; 2
    bit    ram_D8                ; 3
    bvs    L1CB8                 ; 2³
    lda    armorStatus|READ      ; 4
    sec                          ; 2
    sbc    #$01                  ; 2
    cmp    #$F0                  ; 2
    bcc    L1CA3                 ; 2³
    lda    #$00                  ; 2
L1CA3:
  IF ARMOR_DAMAGE
    sta    armorStatus           ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
    ldx    engineStatus|READ     ; 4
    beq    L1CB5                 ; 2³
    dex                          ; 2
    cpx    #-16                  ; 2
    bcc    L1CB2                 ; 2³
    ldx    #$00                  ; 2
L1CB2:
  IF ENGINE_DAMAGE
    stx    engineStatus          ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
L1CB5:
    jmp    L1D0D                 ; 3

L1CB8:
    inc    ram_D5                ; 5
    inc    ram_D4                ; 5
    inc    ram_D4                ; 5
L1CBE:
    bit    CXPPMM|$30            ; 3
    bpl    L1D07                 ; 2³+1
    bit    sc_4B|READ            ; 4
    bpl    L1D07                 ; 2³+1
    lda    sc_4B|READ            ; 4
    and    #$0F                  ; 2
    bne    L1CD1                 ; 2³
    jmp    L1BDE                 ; 3

L1CD1:
    ldy    #$02                  ; 2
    lda    #$00                  ; 2
    sta    sc_37                 ; 4
    lda    #$88                  ; 2
    sta    ram_CB                ; 3
    lda    tireStatus|READ       ; 4
    cmp    #$02                  ; 2
    bcc    L1CE9                 ; 2³
    sec                          ; 2
    sbc    #$02                  ; 2
  IF TIRE_DAMAGE
    sta    tireStatus            ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
L1CE9:
    lda    armorStatus|READ      ; 4
    sec                          ; 2
    sbc    #$04                  ; 2
    cmp    #$F0                  ; 2
    bcc    L1CF5                 ; 2³
    lda    #$00                  ; 2
L1CF5:
  IF ARMOR_DAMAGE
    sta    armorStatus           ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
    lda    engineStatus|READ     ; 4
    sec                          ; 2
    sbc    #2                    ; 2
    cmp    #-16                  ; 2
    bcc    L1D04                 ; 2³
    lda    #0                    ; 2
L1D04:
  IF ENGINE_DAMAGE
    sta    engineStatus          ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
L1D07:
    lda    ram_DB                ; 3
    beq    L1D0D                 ; 2³
    ldy    #$02                  ; 2
L1D0D:
    cpy    ram_D6                ; 3
    beq    L1D1D                 ; 2³
    bcs    L1D1D                 ; 2³
    sty    ram_D6                ; 3
    ldy    #$14                  ; 2
    sty    ram_80                ; 3
    lda    #$06                  ; 2
    sta    AUDV1                 ; 3
L1D1D:
    ldy    ram_80                ; 3
    beq    L1D24                 ; 2³
    jsr    L1F38                 ; 6   bankswitch, goto L3DB9
L1D24:
    ldy    ram_DC                ; 3
    bne    L1D4D                 ; 2³
    lda    ram_D2                ; 3
    cmp    #$0D                  ; 2
    bcc    L1D32                 ; 2³
    bit    INPT4|$30             ; 3
    bpl    L1D75                 ; 2³
L1D32:
    lda    ram_D2                ; 3
    beq    L1D3F                 ; 2³
    cmp    #$C9                  ; 2
    bcs    L1D3F                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
L1D3F:
    iny                          ; 2
    lda    L18EE,Y               ; 4
    sta    AUDF0                 ; 3
    ldy    #$03                  ; 2
    sty    AUDC0                 ; 3
    iny                          ; 2
    sty    AUDV0                 ; 3
    rts                          ; 6

L1D4D:
    bmi    L1D5D                 ; 2³
    lda    L1DD7,Y               ; 4
    sta    AUDF0                 ; 3
    lda    L1DDF,Y               ; 4
    sta    AUDC0                 ; 3
    dey                          ; 2
    sty    ram_DC                ; 3
    rts                          ; 6

L1D5D:
    tya                          ; 2
    and    #$07                  ; 2
    tay                          ; 2
    sec                          ; 2
    sbc    #$01                  ; 2
    beq    L1D68                 ; 2³
    ora    #$80                  ; 2
L1D68:
    sta    ram_DC                ; 3
    lda    L1DE7,Y               ; 4
    sta    AUDF0                 ; 3
    lda    L1DEF,Y               ; 4
    sta    AUDC0                 ; 3
    rts                          ; 6

L1D75:
    lda    bulletStatus|READ     ; 4
    beq    L1D32                 ; 2³
    lda    #$07                  ; 2
    sta    ram_DC                ; 3
    lda    #$09                  ; 2
    sta    AUDV0                 ; 3
    bit    CXPPMM|$30            ; 3
    bmi    L1DD6                 ; 2³
    ldy    ram_CB                ; 3
    cpy    #$0C                  ; 2
    bcc    L1DBC                 ; 2³
    cpy    #$22                  ; 2
    bcs    L1DBC                 ; 2³
    lda    ram_84                ; 3
    sec                          ; 2
    sbc    #$14                  ; 2
    sta    ram_8E                ; 3
    clc                          ; 2
    adc    #$5F                  ; 2
    sta    ram_8F                ; 3
    lda    ram_CD                ; 3
    cmp    ram_8E                ; 3
    bcc    L1DBC                 ; 2³
    cmp    ram_8F                ; 3
    bcs    L1DBC                 ; 2³
    ldx    sc_4D|READ            ; 4
    bmi    L1DC6                 ; 2³
    beq    L1DC6                 ; 2³
    ldx    #$87                  ; 2
    stx    ram_DC                ; 3
    ldx    sc_4D|READ            ; 4
    dex                          ; 2
    stx    sc_4D                 ; 4
    inc    ram_D5                ; 5
    beq    L1DC6                 ; 2³
L1DBC:
    lda    bulletStatus|READ     ; 4
    sec                          ; 2
    sbc    #$01                  ; 2
  IF BULLET_LOSS
    sta    bulletStatus          ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
    rts                          ; 6

L1DC6:
    lda    #$0D                  ; 2
    sta    sc_4B                 ; 4
    lda    #$0A                  ; 2
    sta    ram_D4                ; 3
    lda    ram_D5                ; 3
    clc                          ; 2
    adc    #$14                  ; 2
    sta    ram_D5                ; 3
L1DD6:
    rts                          ; 6

L1DD7:
    .byte $00 ; |        | $1DD7  AUDF0
    .byte $11 ; |   X   X| $1DD8
    .byte $13 ; |   X  XX| $1DD9
    .byte $15 ; |   X X X| $1DDA
    .byte $0E ; |    XXX | $1DDB
    .byte $0E ; |    XXX | $1DDC
    .byte $10 ; |   X    | $1DDD
    .byte $15 ; |   X X X| $1DDE
L1DDF:
    .byte $00 ; |        | $1DDF  AUDC0
    .byte $02 ; |      X | $1DE0
    .byte $06 ; |     XX | $1DE1
    .byte $06 ; |     XX | $1DE2
    .byte $02 ; |      X | $1DE3
    .byte $09 ; |    X  X| $1DE4
    .byte $0A ; |    X X | $1DE5
    .byte $0A ; |    X X | $1DE6
L1DE7:
    .byte $00 ; |        | $1DE7  AUDF0
    .byte $15 ; |   X X X| $1DE8
    .byte $18 ; |   XX   | $1DE9
    .byte $18 ; |   XX   | $1DEA
    .byte $13 ; |   X  XX| $1DEB
    .byte $1F ; |   XXXXX| $1DEC
    .byte $1F ; |   XXXXX| $1DED
    .byte $14 ; |   X X  | $1DEE
L1DEF:
    .byte $00 ; |        | $1DEF  AUDC0
    .byte $02 ; |      X | $1DF0
    .byte $06 ; |     XX | $1DF1
    .byte $06 ; |     XX | $1DF2
    .byte $02 ; |      X | $1DF3
    .byte $09 ; |    X  X| $1DF4
    .byte $0A ; |    X X | $1DF5
    .byte $0A ; |    X X | $1DF6
L1DF7:
    .byte $0F ; |    XXXX| $1DF7
    .byte $0F ; |    XXXX| $1DF8
    .byte $0F ; |    XXXX| $1DF9
    .byte $0F ; |    XXXX| $1DFA
    .byte $0F ; |    XXXX| $1DFB
    .byte $0F ; |    XXXX| $1DFC
    .byte $0B ; |    X XX| $1DFD
    .byte $0B ; |    X XX| $1DFE
    .byte $0B ; |    X XX| $1DFF
    .byte $0B ; |    X XX| $1E00
    .byte $0B ; |    X XX| $1E01
    .byte $0F ; |    XXXX| $1E02
    .byte $0F ; |    XXXX| $1E03
    .byte $07 ; |     XXX| $1E04
    .byte $0F ; |    XXXX| $1E05
    .byte $0F ; |    XXXX| $1E06
    .byte $07 ; |     XXX| $1E07
    .byte $07 ; |     XXX| $1E08
    .byte $07 ; |     XXX| $1E09
    .byte $07 ; |     XXX| $1E0A
    .byte $07 ; |     XXX| $1E0B
    .byte $0F ; |    XXXX| $1E0C
    .byte $0F ; |    XXXX| $1E0D
    .byte $0F ; |    XXXX| $1E0E
    .byte $0B ; |    X XX| $1E0F
    .byte $07 ; |     XXX| $1E10
    .byte $07 ; |     XXX| $1E11
    .byte $07 ; |     XXX| $1E12
    .byte $07 ; |     XXX| $1E13
    .byte $0F ; |    XXXX| $1E14
    .byte $0F ; |    XXXX| $1E15
    .byte $0F ; |    XXXX| $1E16
    .byte $0B ; |    X XX| $1E17
    .byte $0B ; |    X XX| $1E18
    .byte $0B ; |    X XX| $1E19
    .byte $0B ; |    X XX| $1E1A
    .byte $0B ; |    X XX| $1E1B
    .byte $0B ; |    X XX| $1E1C
    .byte $0B ; |    X XX| $1E1D
    .byte $0B ; |    X XX| $1E1E
    .byte $0B ; |    X XX| $1E1F
    .byte $0F ; |    XXXX| $1E20
    .byte $0F ; |    XXXX| $1E21
    .byte $07 ; |     XXX| $1E22
    .byte $0F ; |    XXXX| $1E23
    .byte $07 ; |     XXX| $1E24
    .byte $0F ; |    XXXX| $1E25
    .byte $0B ; |    X XX| $1E26
    .byte $07 ; |     XXX| $1E27
    .byte $0F ; |    XXXX| $1E28

L1E29:
    lda    ram_D2                ; 3
    beq    L1E5A                 ; 2³
    sec                          ; 2
    sbc    #$02                  ; 2
    sta    ram_D2                ; 3
    sed                          ; 2
    lda    sc_04|READ            ; 4
    sec                          ; 2
    sbc    #$02                  ; 2
    sta    sc_04                 ; 4
    bcs    L1E46                 ; 2³
    lda    sc_03|READ            ; 4
    sbc    #$00                  ; 2
    sta    sc_03                 ; 4
L1E46:
    lda    ram_D2                ; 3
    bpl    L1E5A                 ; 2³
    cmp    #$D2                  ; 2
    beq    L1E5A                 ; 2³
    bcc    L1E5A                 ; 2³
    lda    #$00                  ; 2
    sta    ram_D2                ; 3
    sta    sc_04                 ; 4
    sta    sc_03                 ; 4
L1E5A:
    cld                          ; 2
    rts                          ; 6

L1E5C:
    .byte $80 ; |X       | $1E5C
    .byte $C0 ; |XX      | $1E5D
    .byte $C0 ; |XX      | $1E5E
    .byte $E0 ; |XXX     | $1E5F
    .byte $E0 ; |XXX     | $1E60
    .byte $F0 ; |XXXX    | $1E61
    .byte $F0 ; |XXXX    | $1E62
    .byte $F8 ; |XXXXX   | $1E63
    .byte $F8 ; |XXXXX   | $1E64
    .byte $FC ; |XXXXXX  | $1E65
    .byte $FC ; |XXXXXX  | $1E66
    .byte $FE ; |XXXXXXX | $1E67
    .byte $FE ; |XXXXXXX | $1E68
    .byte $FF ; |XXXXXXXX| $1E69
    .byte $FF ; |XXXXXXXX| $1E6A
    .byte $FF ; |XXXXXXXX| $1E6B
    .byte $FF ; |XXXXXXXX| $1E6C
    .byte $FF ; |XXXXXXXX| $1E6D
    .byte $FF ; |XXXXXXXX| $1E6E
    .byte $FF ; |XXXXXXXX| $1E6F
    .byte $FF ; |XXXXXXXX| $1E70
    .byte $FF ; |XXXXXXXX| $1E71
    .byte $FF ; |XXXXXXXX| $1E72
    .byte $FF ; |XXXXXXXX| $1E73
    .byte $FF ; |XXXXXXXX| $1E74
    .byte $FF ; |XXXXXXXX| $1E75
    .byte $FF ; |XXXXXXXX| $1E76
    .byte $FF ; |XXXXXXXX| $1E77
    .byte $FF ; |XXXXXXXX| $1E78
    .byte $FF ; |XXXXXXXX| $1E79
L1E7A:
    .byte $80 ; |X       | $1E7A
    .byte $80 ; |X       | $1E7B
    .byte $C0 ; |XX      | $1E7C
    .byte $C0 ; |XX      | $1E7D
    .byte $E0 ; |XXX     | $1E7E
    .byte $E0 ; |XXX     | $1E7F
    .byte $F0 ; |XXXX    | $1E80
    .byte $F0 ; |XXXX    | $1E81
    .byte $F8 ; |XXXXX   | $1E82
    .byte $F8 ; |XXXXX   | $1E83
    .byte $FC ; |XXXXXX  | $1E84
    .byte $FC ; |XXXXXX  | $1E85
    .byte $FC ; |XXXXXX  | $1E86
    .byte $FE ; |XXXXXXX | $1E87
    .byte $FE ; |XXXXXXX | $1E88
    .byte $FE ; |XXXXXXX | $1E89
    .byte $FF ; |XXXXXXXX| $1E8A
    .byte $FF ; |XXXXXXXX| $1E8B
    .byte $FF ; |XXXXXXXX| $1E8C
    .byte $FF ; |XXXXXXXX| $1E8D
    .byte $FF ; |XXXXXXXX| $1E8E
    .byte $FF ; |XXXXXXXX| $1E8F
    .byte $FF ; |XXXXXXXX| $1E90
    .byte $FF ; |XXXXXXXX| $1E91
    .byte $FF ; |XXXXXXXX| $1E92
    .byte $FF ; |XXXXXXXX| $1E93
    .byte $FF ; |XXXXXXXX| $1E94
    .byte $FF ; |XXXXXXXX| $1E95
    .byte $FF ; |XXXXXXXX| $1E96
    .byte $FF ; |XXXXXXXX| $1E97
    .byte $FF ; |XXXXXXXX| $1E98
    .byte $FF ; |XXXXXXXX| $1E99
    .byte $FF ; |XXXXXXXX| $1E9A
    .byte $FF ; |XXXXXXXX| $1E9B
L1E9C:
    .byte $FF ; |XXXXXXXX| $1E9C
    .byte $FF ; |XXXXXXXX| $1E9D
    .byte $FF ; |XXXXXXXX| $1E9E
    .byte $F0 ; |XXXX    | $1E9F
    .byte $E0 ; |XXX     | $1EA0
    .byte $E0 ; |XXX     | $1EA1
    .byte $D0 ; |XX X    | $1EA2
    .byte $C0 ; |XX      | $1EA3
    .byte $A0 ; |X X     | $1EA4
    .byte $80 ; |X       | $1EA5
    .byte $78 ; | XXXX   | $1EA6
    .byte $70 ; | XXX    | $1EA7
    .byte $70 ; | XXX    | $1EA8
    .byte $68 ; | XX X   | $1EA9
    .byte $68 ; | XX X   | $1EAA
    .byte $60 ; | XX     | $1EAB
    .byte $40 ; | X      | $1EAC
    .byte $40 ; | X      | $1EAD
L1EAE:
    .byte $08 ; |    X   | $1EAE
    .byte $10 ; |   X    | $1EAF
    .byte $20 ; |  X     | $1EB0
    .byte $30 ; |  XX    | $1EB1
    .byte $40 ; | X      | $1EB2
    .byte $50 ; | X X    | $1EB3
    .byte $60 ; | XX     | $1EB4
    .byte $70 ; | XXX    | $1EB5
    .byte $80 ; |X       | $1EB6
    .byte $90 ; |X  X    | $1EB7
    .byte $B0 ; |X XX    | $1EB8
    .byte $C0 ; |XX      | $1EB9
    .byte $C0 ; |XX      | $1EBA
    .byte $C0 ; |XX      | $1EBB
    .byte $C0 ; |XX      | $1EBC
    .byte $C2 ; |XX    X | $1EBD
    .byte $F4 ; |XXXX X  | $1EBE

L1EBF:
    lda    ram_D2                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    sc_53|READ            ; 4
    clc                          ; 2
    adc    L1EAE,X               ; 4
    sta    sc_53                 ; 4
    rts                          ; 6

L1ED1:
    lda    ram_D2                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    sc_54|READ            ; 4
    clc                          ; 2
    adc    L1E9C,X               ; 4
    sta    sc_54                 ; 4
    rts                          ; 6

L1EE3:
    ldy    INTIM                 ; 4
    bne    L1EE3                 ; 2³
    lda    #$10                  ; 2
    sta    T1024T                ; 4
L1EED:
    ldy    INTIM                 ; 4
    bne    L1EED                 ; 2³
    jmp    L1F2C                 ; 3   bankswitch, goto L785A

L1EF5:
    lda    INTIM                 ; 4
    bne    L1EF5                 ; 2³
    rts                          ; 6


  IF SHOW_BYTES_REMAINING
    ECHO ([$1EFC-*]d), "bytes free BANK_0"
  ENDIF


       ORG $0EFC
      RORG $1EFC

L1EFC:
    lda    BANK_2                ; 4   bankswitch, goto L537C
    jmp    M5106|BANK_MASK       ; 3

L1F02:
    lda    BANK_2                ; 4   bankswitch, goto L545C
    jmp    M5109|BANK_MASK       ; 3

L1F08:
    lda    BANK_4                ; 4   bankswitch, goto L911C
    jmp    M9106|BANK_MASK       ; 3

L1F0E:
    lda    BANK_2                ; 4   bankswitch, goto L56E5
    jmp    M510C|BANK_MASK       ; 3

L1F14:
    lda    BANK_1                ; 4   bankswitch, goto L3242
    jmp    M3109|BANK_MASK       ; 3

L1F1A:
    lda    BANK_4                ; 4   bankswitch, goto L920E
    jmp    M9109|BANK_MASK       ; 3

L1F20:
    lda    BANK_2                ; 4   bankswitch, goto L57DA
    jmp    M510F|BANK_MASK       ; 3

L1F26:
    lda    BANK_3                ; 4   bankswitch, goto L7E5A
    jmp    M7106|BANK_MASK       ; 3

L1F2C:
    lda    BANK_3                ; 4   bankswitch, goto L785A
    jmp    M7109|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M5112|BANK_MASK       ; 3

L1F38:
    lda    BANK_1                ; 4   bankswitch, goto L3DB9
    jmp    M310F|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB10C|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB10F|BANK_MASK       ; 3

L1F4A:
    lda    BANK_4                ; 4   bankswitch, goto L9241
    jmp    M9112|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB106|BANK_MASK       ; 3

    lda    BANK_7                ; 4
    jmp    MF106|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M910F|BANK_MASK       ; 3

L1F62:
    lda    BANK_6                ; 4
    jmp    MD106|BANK_MASK       ; 3   bankswitch, goto LD568

    lda    BANK_0                ; 4
    rts                          ; 6

    lda    BANK_3                ; 4
    rts                          ; 6

    lda    BANK_4                ; 4
    rts                          ; 6

    lda    BANK_6                ; 4
    rts                          ; 6


; $1F78 - $1FF3 are free bytes


       ORG $0FF4
      RORG $1FF4

    .byte $00 ; |        | $1FF4
    .byte $00 ; |        | $1FF5
    .byte $00 ; |        | $1FF6
    .byte $00 ; |        | $1FF7
    .byte $00 ; |        | $1FF8
    .byte $00 ; |        | $1FF9
    .byte $00 ; |        | $1FFA
    .byte $00 ; |        | $1FFB

    .word START_0
    .word 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      BANK 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


       ORG $1000
      RORG $3000

    SC_RAM_SPACE

START_1:
    lda    BANK_0                ; 4
    jmp    START_1               ; 3

;$3106:
    jmp    $3112                 ; 3   not used

M3109:
    jmp    L3242                 ; 3

;$310C:
    jmp    $3112                 ; 3   not used

M310F:
    jmp    L3DB9                 ; 3

L3112:
    .byte $10 ; |   X    | $3112
    .byte $10 ; |   X    | $3113
    .byte $00 ; |        | $3114
    .byte $00 ; |        | $3115
    .byte $00 ; |        | $3116
    .byte $00 ; |        | $3117
    .byte $00 ; |        | $3118
    .byte $00 ; |        | $3119
    .byte $00 ; |        | $311A
    .byte $00 ; |        | $311B
L311C:
    .byte $38 ; |  XXX   | $311C
    .byte $7C ; | XXXXX  | $311D
    .byte $38 ; |  XXX   | $311E
    .byte $10 ; |   X    | $311F
    .byte $00 ; |        | $3120
    .byte $00 ; |        | $3121
    .byte $00 ; |        | $3122
    .byte $00 ; |        | $3123
    .byte $00 ; |        | $3124
    .byte $00 ; |        | $3125
L3126:
    .byte $38 ; |  XXX   | $3126
    .byte $7C ; | XXXXX  | $3127
    .byte $38 ; |  XXX   | $3128
    .byte $38 ; |  XXX   | $3129
    .byte $10 ; |   X    | $312A
    .byte $00 ; |        | $312B
    .byte $00 ; |        | $312C
    .byte $00 ; |        | $312D
    .byte $00 ; |        | $312E
    .byte $00 ; |        | $312F
L3130:
    .byte $18 ; |   XX   | $3130
    .byte $18 ; |   XX   | $3131
    .byte $18 ; |   XX   | $3132
    .byte $18 ; |   XX   | $3133
    .byte $18 ; |   XX   | $3134
    .byte $18 ; |   XX   | $3135
    .byte $18 ; |   XX   | $3136
    .byte $00 ; |        | $3137
    .byte $00 ; |        | $3138
    .byte $00 ; |        | $3139
L313A:
    .byte $1A ; |   XX X | $313A
    .byte $18 ; |   XX   | $313B
    .byte $18 ; |   XX   | $313C
    .byte $28 ; |  X X   | $313D
    .byte $28 ; |  X X   | $313E
    .byte $28 ; |  X X   | $313F
    .byte $28 ; |  X X   | $3140
    .byte $28 ; |  X X   | $3141
    .byte $00 ; |        | $3142
    .byte $00 ; |        | $3143
L3144:
    .byte $1C ; |   XXX  | $3144
    .byte $1A ; |   XX X | $3145
    .byte $1A ; |   XX X | $3146
    .byte $18 ; |   XX   | $3147
    .byte $18 ; |   XX   | $3148
    .byte $18 ; |   XX   | $3149
    .byte $18 ; |   XX   | $314A
    .byte $18 ; |   XX   | $314B
    .byte $18 ; |   XX   | $314C
    .byte $00 ; |        | $314D
L314E:
    .byte $02 ; |      X | $314E
    .byte $1F ; |   XXXXX| $314F
    .byte $1D ; |   XXX X| $3150
    .byte $15 ; |   X X X| $3151
    .byte $00 ; |        | $3152
    .byte $00 ; |        | $3153
    .byte $00 ; |        | $3154
    .byte $00 ; |        | $3155
    .byte $00 ; |        | $3156
    .byte $00 ; |        | $3157
L3158:
    .byte $02 ; |      X | $3158
    .byte $3F ; |  XXXXXX| $3159
    .byte $3F ; |  XXXXXX| $315A
    .byte $2D ; |  X XX X| $315B
    .byte $2D ; |  X XX X| $315C
    .byte $2F ; |  X XXXX| $315D
    .byte $00 ; |        | $315E
    .byte $00 ; |        | $315F
    .byte $00 ; |        | $3160
    .byte $00 ; |        | $3161
L3162:
    .byte $04 ; |     X  | $3162
    .byte $7F ; | XXXXXXX| $3163
    .byte $7F ; | XXXXXXX| $3164
    .byte $7B ; | XXXX XX| $3165
    .byte $6B ; | XX X XX| $3166
    .byte $6B ; | XX X XX| $3167
    .byte $6F ; | XX XXXX| $3168
    .byte $6F ; | XX XXXX| $3169
    .byte $00 ; |        | $316A
    .byte $00 ; |        | $316B
L316C:
    .byte $84 ; |X    X  | $316C
    .byte $84 ; |X    X  | $316D
    .byte $0F ; |    XXXX| $316E
    .byte $0F ; |    XXXX| $316F
    .byte $0F ; |    XXXX| $3170
    .byte $0F ; |    XXXX| $3171
    .byte $0F ; |    XXXX| $3172
    .byte $0F ; |    XXXX| $3173
    .byte $00 ; |        | $3174
    .byte $00 ; |        | $3175
L3176:
    .byte $84 ; |X    X  | $3176
    .byte $84 ; |X    X  | $3177
    .byte $0F ; |    XXXX| $3178
    .byte $0F ; |    XXXX| $3179
    .byte $0F ; |    XXXX| $317A
    .byte $0F ; |    XXXX| $317B
    .byte $0F ; |    XXXX| $317C
    .byte $0F ; |    XXXX| $317D
    .byte $00 ; |        | $317E
    .byte $00 ; |        | $317F
L3180:
    .byte $84 ; |X    X  | $3180
    .byte $84 ; |X    X  | $3181
    .byte $84 ; |X    X  | $3182
    .byte $0F ; |    XXXX| $3183
    .byte $0F ; |    XXXX| $3184
    .byte $0F ; |    XXXX| $3185
    .byte $0F ; |    XXXX| $3186
    .byte $0F ; |    XXXX| $3187
    .byte $0F ; |    XXXX| $3188
    .byte $00 ; |        | $3189
L318A:
    .byte $7C ; | XXXXX  | $318A
    .byte $1E ; |   XXXX | $318B
    .byte $10 ; |   X    | $318C
    .byte $00 ; |        | $318D
    .byte $00 ; |        | $318E
    .byte $00 ; |        | $318F
    .byte $00 ; |        | $3190
    .byte $00 ; |        | $3191
    .byte $00 ; |        | $3192
    .byte $00 ; |        | $3193
L3194:
    .byte $10 ; |   X    | $3194
    .byte $10 ; |   X    | $3195
    .byte $3C ; |  XXXX  | $3196
    .byte $78 ; | XXXX   | $3197
    .byte $7E ; | XXXXXX | $3198
    .byte $10 ; |   X    | $3199
    .byte $10 ; |   X    | $319A
    .byte $00 ; |        | $319B
    .byte $00 ; |        | $319C
    .byte $00 ; |        | $319D
L319E:
    .byte $10 ; |   X    | $319E
    .byte $1C ; |   XXX  | $319F
    .byte $38 ; |  XXX   | $31A0
    .byte $7C ; | XXXXX  | $31A1
    .byte $38 ; |  XXX   | $31A2
    .byte $FC ; |XXXXXX  | $31A3
    .byte $7E ; | XXXXXX | $31A4
    .byte $10 ; |   X    | $31A5
    .byte $10 ; |   X    | $31A6
    .byte $00 ; |        | $31A7
L31A8:
    .byte $C8 ; |XX  X   | $31A8
    .byte $C8 ; |XX  X   | $31A9
    .byte $24 ; |  X  X  | $31AA
    .byte $24 ; |  X  X  | $31AB
    .byte $24 ; |  X  X  | $31AC
    .byte $24 ; |  X  X  | $31AD
    .byte $24 ; |  X  X  | $31AE
    .byte $00 ; |        | $31AF
    .byte $00 ; |        | $31B0
    .byte $00 ; |        | $31B1
L31B2:
    .byte $C8 ; |XX  X   | $31B2
    .byte $C8 ; |XX  X   | $31B3
    .byte $C8 ; |XX  X   | $31B4
    .byte $C8 ; |XX  X   | $31B5
    .byte $C8 ; |XX  X   | $31B6
    .byte $24 ; |  X  X  | $31B7
    .byte $24 ; |  X  X  | $31B8
    .byte $24 ; |  X  X  | $31B9
    .byte $00 ; |        | $31BA
    .byte $00 ; |        | $31BB
L31BC:
    .byte $C8 ; |XX  X   | $31BC
    .byte $C8 ; |XX  X   | $31BD
    .byte $C8 ; |XX  X   | $31BE
    .byte $C8 ; |XX  X   | $31BF
    .byte $C8 ; |XX  X   | $31C0
    .byte $C8 ; |XX  X   | $31C1
    .byte $C8 ; |XX  X   | $31C2
    .byte $C8 ; |XX  X   | $31C3
    .byte $24 ; |  X  X  | $31C4
    .byte $24 ; |  X  X  | $31C5
L31C6:
    .byte $18 ; |   XX   | $31C6
    .byte $3C ; |  XXXX  | $31C7
    .byte $18 ; |   XX   | $31C8
    .byte $18 ; |   XX   | $31C9
    .byte $00 ; |        | $31CA
    .byte $00 ; |        | $31CB
    .byte $00 ; |        | $31CC
    .byte $00 ; |        | $31CD
    .byte $00 ; |        | $31CE
    .byte $00 ; |        | $31CF
L31D0:
    .byte $18 ; |   XX   | $31D0
    .byte $7E ; | XXXXXX | $31D1
    .byte $18 ; |   XX   | $31D2
    .byte $3C ; |  XXXX  | $31D3
    .byte $18 ; |   XX   | $31D4
    .byte $18 ; |   XX   | $31D5
    .byte $00 ; |        | $31D6
    .byte $00 ; |        | $31D7
    .byte $00 ; |        | $31D8
    .byte $00 ; |        | $31D9
L31DA:
    .byte $18 ; |   XX   | $31DA
    .byte $FF ; |XXXXXXXX| $31DB
    .byte $18 ; |   XX   | $31DC
    .byte $7E ; | XXXXXX | $31DD
    .byte $18 ; |   XX   | $31DE
    .byte $18 ; |   XX   | $31DF
    .byte $18 ; |   XX   | $31E0
    .byte $18 ; |   XX   | $31E1
    .byte $18 ; |   XX   | $31E2
    .byte $00 ; |        | $31E3
L31E4:
    .byte $26 ; |  X  XX | $31E4
    .byte $24 ; |  X  X  | $31E5
    .byte $26 ; |  X  XX | $31E6
    .byte $26 ; |  X  XX | $31E7
    .byte $26 ; |  X  XX | $31E8
    .byte $26 ; |  X  XX | $31E9
    .byte $26 ; |  X  XX | $31EA
    .byte $00 ; |        | $31EB
    .byte $00 ; |        | $31EC
    .byte $00 ; |        | $31ED
L31EE:
    .byte $26 ; |  X  XX | $31EE
    .byte $24 ; |  X  X  | $31EF
    .byte $26 ; |  X  XX | $31F0
    .byte $24 ; |  X  X  | $31F1
    .byte $26 ; |  X  XX | $31F2
    .byte $26 ; |  X  XX | $31F3
    .byte $26 ; |  X  XX | $31F4
    .byte $26 ; |  X  XX | $31F5
    .byte $26 ; |  X  XX | $31F6
    .byte $00 ; |        | $31F7
L31F8:
    .byte $26 ; |  X  XX | $31F8
    .byte $24 ; |  X  X  | $31F9
    .byte $26 ; |  X  XX | $31FA
    .byte $14 ; |   X X  | $31FB
    .byte $26 ; |  X  XX | $31FC
    .byte $26 ; |  X  XX | $31FD
    .byte $26 ; |  X  XX | $31FE
    .byte $26 ; |  X  XX | $31FF
    .byte $26 ; |  X  XX | $3200
    .byte $26 ; |  X  XX | $3201

L3202:
    .word L3112          ; $3202
    .word L311C          ; $3204
    .word L3126          ; $3206
    .word L3126          ; $3208
    .word L314E          ; $320A
    .word L3158          ; $320C
    .word L3162          ; $320E
    .word L3162          ; $3210
    .word L318A          ; $3212
    .word L3194          ; $3214
    .word L319E          ; $3216
    .word L319E          ; $3218
    .word L31C6          ; $321A
    .word L31D0          ; $321C
    .word L31DA          ; $321E
    .word L31DA          ; $3220

L3222:
    .word L3130          ; $3222
    .word L313A          ; $3224
    .word L3144          ; $3226
    .word L3144          ; $3228
    .word L316C          ; $322A
    .word L3176          ; $322C
    .word L3180          ; $322E
    .word L3180          ; $3230
    .word L31A8          ; $3232
    .word L31B2          ; $3234
    .word L31BC          ; $3236
    .word L31BC          ; $3238
    .word L31E4          ; $323A
    .word L31EE          ; $323C
    .word L31F8          ; $323E
    .word L31F8          ; $3240

L3242:
    bit    sc_4B|READ            ; 4
    bpl    L3257                 ; 2³
    bit    sc_4C|READ            ; 4
    bmi    L325A                 ; 2³
    bit    sc_4B|READ            ; 4
    bvs    L3254                 ; 2³
    jmp    L3368                 ; 3

L3254:
    jmp    L33AF                 ; 3

L3257:
    jmp    L3A66                 ; 3

L325A:
    lda    sc_4C|READ            ; 4
    and    #$7F                  ; 2
    sta    sc_4C                 ; 4
    ldy    ram_CB                ; 3
    bit    sc_4B|READ            ; 4
    bvs    L32D5                 ; 2³
    ldx    #$00                  ; 2
    stx    ram_CC                ; 3
    cpy    #$02                  ; 2
    bcc    L32C3                 ; 2³
    ldx    #$01                  ; 2
    cpy    #$09                  ; 2
    bcc    L32C3                 ; 2³
    ldx    #$02                  ; 2
    cpy    #$10                  ; 2
    bcc    L32C3                 ; 2³
    dec    ram_CD                ; 5
    lda    #$05                  ; 2
    sta    ram_CC                ; 3
    cpy    #$19                  ; 2
    bcc    L32C3                 ; 2³
    lda    ram_CD                ; 3
    sec                          ; 2
    sbc    #$04                  ; 2
    sta    ram_CD                ; 3
    lda    #$07                  ; 2
    sta    ram_CC                ; 3
    cpy    #$3F                  ; 2
    bcc    L32C3                 ; 2³
L3296:
    lda    ram_D2                ; 3
    beq    L32A0                 ; 2³
    lda    ram_C4                ; 3
    and    #$03                  ; 2
    beq    L32A3                 ; 2³
L32A0:
    jmp    L3452                 ; 3

L32A3:
    ldy    #$00                  ; 2
    sty    ram_D9                ; 3
    sty    ram_CB                ; 3
    sty    ram_CC                ; 3
    lda    ram_92                ; 3
    and    #$01                  ; 2
    bne    L3305                 ; 2³+1
L32B1:
    lda    ram_C8                ; 3
    and    #$03                  ; 2
    ora    #$80                  ; 2
    sta    sc_4B                 ; 4
    sec                          ; 2
    lda    ram_C4                ; 3
    sbc    #$16                  ; 2
    sta    ram_CD                ; 3
    ldx    #$00                  ; 2
L32C3:
    txa                          ; 2
    stx    ram_83                ; 3
    lda    sc_4B|READ            ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    ram_83                ; 3
    asl                          ; 2
    tax                          ; 2
    jmp    L3322                 ; 3

L32D5:
    ldx    #$00                  ; 2
    stx    ram_CC                ; 3
    cpy    #$02                  ; 2
    bcc    L32C3                 ; 2³
    ldx    #$01                  ; 2
    cpy    #$09                  ; 2
    bcc    L32C3                 ; 2³
    ldx    #$02                  ; 2
    cpy    #$10                  ; 2
    bcc    L32C3                 ; 2³
    inc    ram_CD                ; 5
    lda    #$05                  ; 2
    sta    ram_CC                ; 3
    cpy    #$19                  ; 2
    bcc    L32C3                 ; 2³
    lda    ram_CD                ; 3
    clc                          ; 2
    adc    #$04                  ; 2
    sta    ram_CD                ; 3
    lda    #$07                  ; 2
    sta    ram_CC                ; 3
    cpy    #$3F                  ; 2
    bcc    L32C3                 ; 2³+1
    jmp    L3296                 ; 3

L3305:
    lda    ram_C4                ; 3
    bmi    L32B1                 ; 2³+1
    lda    ram_C8                ; 3
    and    #$03                  ; 2
    ora    #$C0                  ; 2
    sta    sc_4B                 ; 4
    lda    ram_C4                ; 3
    clc                          ; 2
    adc    sc_0E|READ            ; 4
    clc                          ; 2
    adc    #$18                  ; 2
    sta    ram_CD                ; 3
    ldx    #$00                  ; 2
    jmp    L32C3                 ; 3

L3322:
    ldy    ram_CB                ; 3
    cpy    #$2D                  ; 2
    bcs    L338B                 ; 2³
    lda    L3202,X               ; 4
    sta    ram_86                ; 3
    lda    L3202+1,X             ; 4
    sta    ram_87                ; 3
    lda    L3222,X               ; 4
    sta    ram_82                ; 3
    lda    L3222+1,X             ; 4
    sta    ram_83                ; 3
    ldy    #$09                  ; 2
L333E:
    lda    (ram_86),Y            ; 5
    sta    sc_37,Y               ; 5
    lda    (ram_82),Y            ; 5
    sta    sc_41,Y               ; 5
    dey                          ; 2
    bpl    L333E                 ; 2³
    bit    sc_4B|READ            ; 4
    bvs    L3399                 ; 2³
    ldy    ram_CB                ; 3
    lda.wy ram_96,Y              ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    L33F2,X               ; 4
    sta    ram_89                ; 3
    lda    ram_CD                ; 3
    sec                          ; 2
    sbc    ram_89                ; 3
    sbc    ram_89                ; 3
    sta    ram_CD                ; 3
L3368:
    bit    CXM0P|$30             ; 3
    bmi    L3370                 ; 2³
    bit    CXP1FB|$30            ; 3
    bvc    L3381                 ; 2³
L3370:
    sec                          ; 2
    lda    ram_CD                ; 3
    sbc    #$09                  ; 2
    sta    ram_CD                ; 3
    ldy    ram_CE                ; 3
    cpy    #$05                  ; 2
    bcc    L3381                 ; 2³
    sbc    #$02                  ; 2
    sta    ram_CD                ; 3
L3381:
    lda    ram_CD                ; 3
    cmp    ram_C4                ; 3
    bcc    L33EF                 ; 2³
    lda    #$30                  ; 2
    sta    ram_CB                ; 3
L338B:
    lda    #$00                  ; 2
    sta    sc_37                 ; 4
    sta    sc_38                 ; 4
    sta    sc_39                 ; 4
    jmp    L3F68                 ; 3

L3399:
    ldy    ram_CB                ; 3
    lda.wy ram_96,Y              ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L3402,X               ; 4
    sta    ram_89                ; 3
    lda    ram_CD                ; 3
    clc                          ; 2
    adc    ram_89                ; 3
    adc    ram_89                ; 3
    sta    ram_CD                ; 3
L33AF:
    bit    CXM0P|$30             ; 3
    bmi    L33B7                 ; 2³
    bit    CXP1FB|$30            ; 3
    bvc    L33C8                 ; 2³
L33B7:
    clc                          ; 2
    lda    ram_CD                ; 3
    adc    #$0B                  ; 2
    sta    ram_CD                ; 3
    ldy    ram_CE                ; 3
    cpy    #$05                  ; 2
    bcc    L33C8                 ; 2³
    adc    #$02                  ; 2
    sta    ram_CD                ; 3
L33C8:
    lda    ram_CD                ; 3
    ldx    ram_CC                ; 3
    cpx    #$07                  ; 2
    bne    L33D4                 ; 2³
    cmp    #$82                  ; 2
    bcs    L33E0                 ; 2³
L33D4:
    cmp    ram_C4                ; 3
    bcc    L33E0                 ; 2³
    cmp    #$95                  ; 2
    bcc    L33EF                 ; 2³
    lda    #$30                  ; 2
    sta    ram_CB                ; 3
L33E0:
    lda    #$00                  ; 2
    sta    sc_37                 ; 4
    sta    sc_38                 ; 4
    sta    sc_39                 ; 4
    lda    #$97                  ; 2
    sta    ram_CD                ; 3
L33EF:
    jmp    L3F68                 ; 3

L33F2:
    .byte $00 ; |        | $33F2
    .byte $01 ; |       X| $33F3
    .byte $02 ; |      X | $33F4
    .byte $03 ; |      XX| $33F5
    .byte $04 ; |     X  | $33F6
    .byte $00 ; |        | $33F7
    .byte $00 ; |        | $33F8
    .byte $00 ; |        | $33F9
    .byte $00 ; |        | $33FA
    .byte $00 ; |        | $33FB
    .byte $00 ; |        | $33FC
    .byte $00 ; |        | $33FD
    .byte $FC ; |XXXXXX  | $33FE
    .byte $FD ; |XXXXXX X| $33FF
    .byte $FE ; |XXXXXXX | $3400
    .byte $FF ; |XXXXXXXX| $3401
L3402:
    .byte $00 ; |        | $3402
    .byte $FF ; |XXXXXXXX| $3403
    .byte $FE ; |XXXXXXX | $3404
    .byte $FD ; |XXXXXX X| $3405
    .byte $FC ; |XXXXXX  | $3406
    .byte $00 ; |        | $3407
    .byte $00 ; |        | $3408
    .byte $00 ; |        | $3409
    .byte $00 ; |        | $340A
    .byte $00 ; |        | $340B
    .byte $00 ; |        | $340C
    .byte $00 ; |        | $340D
    .byte $04 ; |     X  | $340E
    .byte $03 ; |      XX| $340F
    .byte $02 ; |      X | $3410
    .byte $01 ; |       X| $3411
L3412:
    .byte $07 ; |     XXX| $3412
    .byte $07 ; |     XXX| $3413
    .byte $08 ; |    X   | $3414
    .byte $08 ; |    X   | $3415
    .byte $09 ; |    X  X| $3416
    .byte $09 ; |    X  X| $3417
    .byte $0A ; |    X X | $3418
    .byte $0A ; |    X X | $3419
    .byte $0A ; |    X X | $341A
    .byte $0B ; |    X XX| $341B
    .byte $0B ; |    X XX| $341C
    .byte $0B ; |    X XX| $341D
    .byte $0B ; |    X XX| $341E
    .byte $0B ; |    X XX| $341F
    .byte $0C ; |    XX  | $3420
    .byte $0C ; |    XX  | $3421
    .byte $0C ; |    XX  | $3422
    .byte $0C ; |    XX  | $3423
    .byte $0C ; |    XX  | $3424
    .byte $0D ; |    XX X| $3425
    .byte $0D ; |    XX X| $3426
    .byte $0D ; |    XX X| $3427
    .byte $0D ; |    XX X| $3428
    .byte $0E ; |    XXX | $3429
    .byte $0E ; |    XXX | $342A
    .byte $0E ; |    XXX | $342B
    .byte $0E ; |    XXX | $342C
    .byte $0E ; |    XXX | $342D
    .byte $0E ; |    XXX | $342E
    .byte $0E ; |    XXX | $342F
    .byte $0F ; |    XXXX| $3430
    .byte $0F ; |    XXXX| $3431
L3432:
    .byte $02 ; |      X | $3432
    .byte $03 ; |      XX| $3433
    .byte $03 ; |      XX| $3434
    .byte $03 ; |      XX| $3435
    .byte $03 ; |      XX| $3436
    .byte $03 ; |      XX| $3437
    .byte $04 ; |     X  | $3438
    .byte $04 ; |     X  | $3439
    .byte $04 ; |     X  | $343A
    .byte $04 ; |     X  | $343B
    .byte $04 ; |     X  | $343C
    .byte $04 ; |     X  | $343D
    .byte $04 ; |     X  | $343E
    .byte $05 ; |     X X| $343F
    .byte $05 ; |     X X| $3440
    .byte $05 ; |     X X| $3441
    .byte $05 ; |     X X| $3442
    .byte $05 ; |     X X| $3443
    .byte $05 ; |     X X| $3444
    .byte $05 ; |     X X| $3445
    .byte $05 ; |     X X| $3446
    .byte $05 ; |     X X| $3447
    .byte $06 ; |     XX | $3448
    .byte $06 ; |     XX | $3449
    .byte $06 ; |     XX | $344A
    .byte $06 ; |     XX | $344B
    .byte $06 ; |     XX | $344C
    .byte $06 ; |     XX | $344D
    .byte $07 ; |     XXX| $344E
    .byte $07 ; |     XXX| $344F
    .byte $08 ; |    X   | $3450
    .byte $08 ; |    X   | $3451

L3452:
    ldy    sc_35|READ            ; 4
    lda    L3412,Y               ; 4
    sta    sc_4D                 ; 4
    lda    L3432,Y               ; 4
    sta    ram_DA                ; 3
    ldy    #$00                  ; 2
    sty    sc_58                 ; 4
    sty    sc_55                 ; 4
    sty    ram_D9                ; 3
    sty    ram_CC                ; 3
    sty    NUSIZ1                ; 3
    lda    ram_C8                ; 3
    and    #$07                  ; 2
    sta    sc_4B                 ; 4
    lda    ram_D1                ; 3
    lsr                          ; 2
    and    #$01                  ; 2
    sta    sc_56                 ; 4
    lda    ram_DD                ; 3
    bne    L34B5                 ; 2³
    lda    ram_D2                ; 3
    cmp    #$41                  ; 2
    bcc    L348D                 ; 2³
    lda    ram_92                ; 3
    and    #$03                  ; 2
    bne    L34B5                 ; 2³
L348D:
    lda    sc_35|READ            ; 4
    cmp    #$06                  ; 2
    bcc    L34B5                 ; 2³
    lda    #$70                  ; 2
    sta    ram_CB                ; 3
    lda    sc_4C|READ            ; 4
    and    #$F0                  ; 2
    sta    sc_4C                 ; 4
    lda    #$20                  ; 2
    clc                          ; 2
    adc    ram_C4                ; 3
    and    #$3F                  ; 2
    ora    #$10                  ; 2
    sta    ram_CD                ; 3
    lda    ram_D2                ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    ram_D4                ; 3
    jmp    L34DE                 ; 3

L34B5:
    lda    #$01                  ; 2
    sta    ram_CB                ; 3
    lda    sc_4C|READ            ; 4
    and    #$F0                  ; 2
    ora    #$02                  ; 2
    sta    sc_4C                 ; 4
    lda    ram_D2                ; 3
    sec                          ; 2
    sbc    #$14                  ; 2
    sta    ram_D4                ; 3
    lda    ram_C4                ; 3
    clc                          ; 2
    adc    #$04                  ; 2
    sta    ram_CD                ; 3
    lda    ram_DD                ; 3
    bne    L34E8                 ; 2³
    lda    bonusStatus|READ      ; 4
    and    #$03                  ; 2
    bne    L34DE                 ; 2³
    beq    L34E8                 ; 3   always branch

L34DE:
    lda    #$00                  ; 2
    sta    sc_37                 ; 4
    sta    ram_DD                ; 3
    jmp    L3F68                 ; 3

L34E8:
    lda    #$00                  ; 2
    sta    sc_37                 ; 4
    sta    ram_D4                ; 3
    lda    ram_DE                ; 3
    beq    L3501                 ; 2³+1
    bmi    L34DE                 ; 2³
    lda    ram_DD                ; 3
    beq    L3501                 ; 2³+1
    bmi    L34FE                 ; 2³
    jmp    L3537                 ; 3

L34FE:
    jmp    L3547                 ; 3

L3501:
    lda    #$00                  ; 2
    sta    ram_DD                ; 3
    lda    #$06                  ; 2
    sta    ram_CB                ; 3
    lda    ram_D1                ; 3
    lsr                          ; 2
    and    #$03                  ; 2
    ldx    bulletStatus|READ     ; 4
    cpx    #$30                  ; 2
    bcc    L3517                 ; 2³
    ora    #$01                  ; 2
L3517:
    cpx    #$00                  ; 2
    bne    L351D                 ; 2³
    lda    #$02                  ; 2
L351D:
    tay                          ; 2
    ora    #$80                  ; 2
    sta    ram_D9                ; 3
    tya                          ; 2
    and    #$01                  ; 2
    beq    L352E                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_DD                ; 3
    jmp    L3532                 ; 3

L352E:
    lda    #$01                  ; 2
    sta    ram_DD                ; 3
L3532:
    dec    ram_DE                ; 5
    jmp    L3F68                 ; 3

L3537:
    lda    ram_D1                ; 3
    lsr                          ; 2
    and    #$03                  ; 2
    ora    #$81                  ; 2
    sta    ram_D9                ; 3
    lda    #$00                  ; 2
    sta    ram_DD                ; 3
    jmp    L3F68                 ; 3

L3547:
    lda    ram_D1                ; 3
    lsr                          ; 2
    and    #$02                  ; 2
    ora    #$80                  ; 2
    sta    ram_D9                ; 3
    lda    #$00                  ; 2
    sta    ram_DD                ; 3
    jmp    L3F68                 ; 3

L3557:
    .word L35BF          ; $3557
    .word L359B          ; $3559
    .word L35E3          ; $355B
    .word CarPtrs01      ; $355D
    .word L358F          ; $355F
    .word L35D7          ; $3561
    .word L35CB          ; $3563
    .word L35A7          ; $3565
    .word L35FB          ; $3567
    .word L35EF          ; $3569
    .word L35FB          ; $356B
    .word L3607          ; $356D
    .word L3615          ; $356F
    .word L3621          ; $3571

L3573:
    .word L36A5          ; $3573
    .word L3681          ; $3575
    .word L36C9          ; $3577
    .word CarColPtrs1    ; $3579
    .word L3675          ; $357B
    .word L36BD          ; $357D
    .word L36B1          ; $357F
    .word L368D          ; $3581
    .word L3651          ; $3583
    .word L3645          ; $3585
    .word L365D          ; $3587
    .word L3669          ; $3589
    .word L362D          ; $358B
    .word L3639          ; $358D

L358F:
    .word Car06_F, Car06_E, Car06_D, Car06_C, Car06_B, Car06_A
L359B:
    .word Car05_F, Car05_E, Car05_D, Car05_C, Car05_B, Car05_A
L35A7:
    .word Car03_F, Car03_E, Car03_D, Car03_C, Car03_B, Car03_A
CarPtrs01:
    .word Car01_F, Car01_E, Car01_C, Car01_D, Car01_A, Car01_B
L35BF:
    .word Car04_F, Car04_E, Car04_D, Car04_C, Car04_B, Car04_A
L35CB:
    .word Car06_F, Car06_E, Car06_D, Car06_C, Car06_B, Car06_A
L35D7:
    .word Car04_F, Car04_E, Car04_D, Car04_C, Car04_B, Car04_A
L35E3:
    .word Car02_E, Car02_F, Car02_C, Car02_D, Car02_A, Car02_B
L35EF:
    .word OilSlick_A          ; $35EF
    .word OilSlick_A          ; $35F1
    .word OilSlick_A          ; $35F3
    .word OilSlick_B          ; $35F5
    .word OilSlick_C          ; $35F7
    .word OilSlick_C          ; $35F9
L35FB:
    .word L39C3          ; $35FB
    .word L39C3          ; $35FD
    .word L39CD          ; $35FF
    .word L39CD          ; $3601
    .word L39D7          ; $3603
    .word L39D7          ; $3605
L3607:
    .word L39E1          ; $3607
    .word L39E1          ; $3609
    .word L39E1          ; $360B
    .word L39EB          ; $360D
    .word L39EB          ; $360F
    .word L39F5          ; $3611
    .word L39F5          ; $3613
L3615:
    .word L3A27          ; $3615
    .word L3A27          ; $3617
    .word L3A27          ; $3619
    .word L3A27          ; $361B
    .word L3A27          ; $361D
    .word L3A27          ; $361F
L3621:
    .word L3A3B          ; $3621
    .word L3A3B          ; $3623
    .word L3A3B          ; $3625
    .word L3A3B          ; $3627
    .word L3A3B          ; $3629
    .word L3A3B          ; $362B
L362D:
    .word L3A31          ; $362D
    .word L3A31          ; $362F
    .word L3A31          ; $3631
    .word L3A31          ; $3633
    .word L3A31          ; $3635
    .word L3A31          ; $3637
L3639:
    .word L3A45          ; $3639
    .word L3A45          ; $363B
    .word L3A45          ; $363D
    .word L3A45          ; $363F
    .word L3A45          ; $3641
    .word L3A45          ; $3643
L3645:
    .word L3A1D          ; $3645
    .word L3A1D          ; $3647
    .word L3A1D          ; $3649
    .word L3A1D          ; $364B
    .word L3A1D          ; $364D
    .word L3A1D          ; $364F
L3651:
    .word L39FF          ; $3651
    .word L39FF          ; $3653
    .word L39FF          ; $3655
    .word L39FF          ; $3657
    .word L39FF          ; $3659
    .word L39FF          ; $365B
L365D:
    .word L3A13          ; $365D
    .word L3A13          ; $365F
    .word L3A13          ; $3661
    .word L3A13          ; $3663
    .word L3A13          ; $3665
    .word L3A13          ; $3667
L3669:
    .word L3A09          ; $3669
    .word L3A09          ; $366B
    .word L3A09          ; $366D
    .word L3A09          ; $366F
    .word L3A09          ; $3671
    .word L3A09          ; $3673
L3675:
    .word CarCol02_F, CarCol02_E, CarCol02_D, CarCol02_C, CarCol02_B, CarCol02_A
L3681:
    .word CarCol05_F, CarCol05_E, CarCol05_D, CarCol05_C, CarCol05_B, CarCol05_A
L368D:
    .word CarCol03_F, CarCol03_E, CarCol03_D, CarCol03_C, CarCol03_B, CarCol03_A
CarColPtrs1:
    .word CarCol01_F, CarCol01_E, CarCol01_D, CarCol01_C, CarCol01_B, CarCol01_A
L36A5:
    .word CarCol06_F, CarCol06_E, CarCol06_D, CarCol06_C, CarCol06_B, CarCol06_A
L36B1:
    .word CarCol06_F, CarCol06_E, CarCol06_D, CarCol06_C, CarCol06_B, CarCol06_A
L36BD:
    .word CarCol04_F, CarCol04_E, CarCol04_D, CarCol04_C, CarCol04_B, CarCol04_A
L36C9:
    .word CarCol02_F, CarCol02_E, CarCol02_D, CarCol02_C, CarCol02_B, CarCol02_A

Car01_A:
    .byte $18 ; |   XX   | $36D5
    .byte $5A ; | X XX X | $36D6
    .byte $3C ; |  XXXX  | $36D7
    .byte $3C ; |  XXXX  | $36D8
    .byte $7E ; | XXXXXX | $36D9
    .byte $5A ; | X XX X | $36DA
    .byte $66 ; | XX  XX | $36DB
    .byte $00 ; |        | $36DC
    .byte $00 ; |        | $36DD
    .byte $00 ; |        | $36DE
Car01_B:
    .byte $18 ; |   XX   | $36DF
    .byte $5A ; | X XX X | $36E0
    .byte $3C ; |  XXXX  | $36E1
    .byte $7E ; | XXXXXX | $36E2
    .byte $DB ; |XX XX XX| $36E3
    .byte $FF ; |XXXXXXXX| $36E4
    .byte $DB ; |XX XX XX| $36E5
    .byte $C3 ; |XX    XX| $36E6
    .byte $00 ; |        | $36E7
    .byte $00 ; |        | $36E8
Car01_C:
    .byte $5A ; | X XX X | $36E9
    .byte $3C ; |  XXXX  | $36EA
    .byte $7E ; | XXXXXX | $36EB
    .byte $66 ; | XX  XX | $36EC
    .byte $00 ; |        | $36ED
    .byte $00 ; |        | $36EE
    .byte $00 ; |        | $36EF
    .byte $00 ; |        | $36F0
    .byte $00 ; |        | $36F1
    .byte $00 ; |        | $36F2
Car01_D:
    .byte $18 ; |   XX   | $36F3
    .byte $5A ; | X XX X | $36F4
    .byte $3C ; |  XXXX  | $36F5
    .byte $7E ; | XXXXXX | $36F6
    .byte $FF ; |XXXXXXXX| $36F7
    .byte $C3 ; |XX    XX| $36F8
    .byte $00 ; |        | $36F9
    .byte $00 ; |        | $36FA
    .byte $00 ; |        | $36FB
    .byte $00 ; |        | $36FC
Car01_E:
    .byte $18 ; |   XX   | $36FD
    .byte $7E ; | XXXXXX | $36FE
    .byte $FF ; |XXXXXXXX| $36FF
    .byte $C3 ; |XX    XX| $3700
    .byte $00 ; |        | $3701
    .byte $00 ; |        | $3702
    .byte $00 ; |        | $3703
    .byte $00 ; |        | $3704
    .byte $00 ; |        | $3705
    .byte $00 ; |        | $3706
Car01_F:
    .byte $3C ; |  XXXX  | $3707
    .byte $7E ; | XXXXXX | $3708
    .byte $00 ; |        | $3709
    .byte $00 ; |        | $370A
    .byte $00 ; |        | $370B
    .byte $00 ; |        | $370C
    .byte $00 ; |        | $370D
    .byte $00 ; |        | $370E
    .byte $00 ; |        | $370F
    .byte $00 ; |        | $3710
CarCol01_A:
    .byte $14 ; |   X X  | $3711
    .byte $00 ; |        | $3712
    .byte $A6 ; |X X  XX | $3713
    .byte $B8 ; |X XXX   | $3714
    .byte $B4 ; |X XX X  | $3715
    .byte $B4 ; |X XX X  | $3716
    .byte $B4 ; |X XX X  | $3717
    .byte $00 ; |        | $3718
    .byte $00 ; |        | $3719
    .byte $00 ; |        | $371A
CarCol01_B:
    .byte $14 ; |   X X  | $371B
    .byte $00 ; |        | $371C
    .byte $A6 ; |X X  XX | $371D
    .byte $B8 ; |X XXX   | $371E
    .byte $B4 ; |X XX X  | $371F
    .byte $B4 ; |X XX X  | $3720
    .byte $00 ; |        | $3721
    .byte $00 ; |        | $3722
    .byte $00 ; |        | $3723
    .byte $00 ; |        | $3724
CarCol01_C:
    .byte $00 ; |        | $3725
    .byte $A6 ; |X X  XX | $3726
    .byte $B4 ; |X XX X  | $3727
    .byte $B4 ; |X XX X  | $3728
    .byte $B6 ; |X XX XX | $3729
    .byte $00 ; |        | $372A
    .byte $00 ; |        | $372B
    .byte $00 ; |        | $372C
    .byte $00 ; |        | $372D
    .byte $00 ; |        | $372E
CarCol01_D:
    .byte $00 ; |        | $372F
    .byte $A6 ; |X X  XX | $3730
    .byte $B6 ; |X XX XX | $3731
    .byte $00 ; |        | $3732
    .byte $00 ; |        | $3733
    .byte $00 ; |        | $3734
    .byte $00 ; |        | $3735
    .byte $00 ; |        | $3736
    .byte $00 ; |        | $3737
    .byte $00 ; |        | $3738
CarCol01_E:
    .byte $00 ; |        | $3739
    .byte $A4 ; |X X  X  | $373A
    .byte $B4 ; |X XX X  | $373B
    .byte $00 ; |        | $373C
    .byte $00 ; |        | $373D
    .byte $00 ; |        | $373E
    .byte $00 ; |        | $373F
    .byte $00 ; |        | $3740
    .byte $00 ; |        | $3741
    .byte $00 ; |        | $3742
CarCol01_F:
    .byte $00 ; |        | $3743
    .byte $B4 ; |X XX X  | $3744
    .byte $00 ; |        | $3745
    .byte $00 ; |        | $3746
    .byte $00 ; |        | $3747
    .byte $00 ; |        | $3748
    .byte $00 ; |        | $3749
    .byte $00 ; |        | $374A
    .byte $00 ; |        | $374B
    .byte $00 ; |        | $374C
Car02_A:
    .byte $18 ; |   XX   | $374D
    .byte $24 ; |  X  X  | $374E
    .byte $7E ; | XXXXXX | $374F
    .byte $7E ; | XXXXXX | $3750
    .byte $7E ; | XXXXXX | $3751
    .byte $7E ; | XXXXXX | $3752
    .byte $66 ; | XX  XX | $3753
    .byte $00 ; |        | $3754
    .byte $00 ; |        | $3755
    .byte $00 ; |        | $3756
Car02_B:
    .byte $3C ; |  XXXX  | $3757
    .byte $66 ; | XX  XX | $3758
    .byte $FF ; |XXXXXXXX| $3759
    .byte $FF ; |XXXXXXXX| $375A
    .byte $FF ; |XXXXXXXX| $375B
    .byte $FF ; |XXXXXXXX| $375C
    .byte $DB ; |XX XX XX| $375D
    .byte $C3 ; |XX    XX| $375E
    .byte $00 ; |        | $375F
    .byte $00 ; |        | $3760
Car02_C:
    .byte $18 ; |   XX   | $3761
    .byte $3C ; |  XXXX  | $3762
    .byte $7E ; | XXXXXX | $3763
    .byte $7E ; | XXXXXX | $3764
    .byte $42 ; | X    X | $3765
    .byte $00 ; |        | $3766
    .byte $00 ; |        | $3767
    .byte $00 ; |        | $3768
    .byte $00 ; |        | $3769
    .byte $00 ; |        | $376A
Car02_D:
    .byte $3C ; |  XXXX  | $376B
    .byte $66 ; | XX  XX | $376C
    .byte $FF ; |XXXXXXXX| $376D
    .byte $FF ; |XXXXXXXX| $376E
    .byte $FF ; |XXXXXXXX| $376F
    .byte $C3 ; |XX    XX| $3770
    .byte $00 ; |        | $3771
    .byte $00 ; |        | $3772
    .byte $00 ; |        | $3773
    .byte $00 ; |        | $3774
Car02_E:
    .byte $3C ; |  XXXX  | $3775
    .byte $7E ; | XXXXXX | $3776
    .byte $00 ; |        | $3777
    .byte $00 ; |        | $3778
    .byte $00 ; |        | $3779
    .byte $00 ; |        | $377A
    .byte $00 ; |        | $377B
    .byte $00 ; |        | $377C
    .byte $00 ; |        | $377D
    .byte $00 ; |        | $377E
Car02_F:
    .byte $3C ; |  XXXX  | $377F
    .byte $7E ; | XXXXXX | $3780
    .byte $7E ; | XXXXXX | $3781
    .byte $66 ; | XX  XX | $3782
    .byte $00 ; |        | $3783
    .byte $00 ; |        | $3784
    .byte $00 ; |        | $3785
    .byte $00 ; |        | $3786
    .byte $00 ; |        | $3787
    .byte $00 ; |        | $3788
CarCol02_A:
    .byte $A6 ; |X X  XX | $3789
    .byte $A6 ; |X X  XX | $378A
    .byte $AA ; |X X X X | $378B
    .byte $96 ; |X  X XX | $378C
    .byte $94 ; |X  X X  | $378D
    .byte $84 ; |X    X  | $378E
    .byte $96 ; |X  X XX | $378F
    .byte $00 ; |        | $3790
    .byte $00 ; |        | $3791
    .byte $00 ; |        | $3792
CarCol02_B:
    .byte $A6 ; |X X  XX | $3793
    .byte $AA ; |X X X X | $3794
    .byte $96 ; |X  X XX | $3795
    .byte $94 ; |X  X X  | $3796
    .byte $84 ; |X    X  | $3797
    .byte $96 ; |X  X XX | $3798
    .byte $00 ; |        | $3799
    .byte $00 ; |        | $379A
    .byte $00 ; |        | $379B
    .byte $00 ; |        | $379C
CarCol02_C:
    .byte $A6 ; |X X  XX | $379D
    .byte $AA ; |X X X X | $379E
    .byte $96 ; |X  X XX | $379F
    .byte $94 ; |X  X X  | $37A0
    .byte $96 ; |X  X XX | $37A1
    .byte $00 ; |        | $37A2
    .byte $00 ; |        | $37A3
    .byte $00 ; |        | $37A4
    .byte $00 ; |        | $37A5
    .byte $00 ; |        | $37A6
CarCol02_D:
    .byte $A6 ; |X X  XX | $37A7
    .byte $96 ; |X  X XX | $37A8
    .byte $94 ; |X  X X  | $37A9
    .byte $96 ; |X  X XX | $37AA
    .byte $00 ; |        | $37AB
    .byte $00 ; |        | $37AC
    .byte $00 ; |        | $37AD
    .byte $00 ; |        | $37AE
    .byte $00 ; |        | $37AF
    .byte $00 ; |        | $37B0
CarCol02_E:
    .byte $A6 ; |X X  XX | $37B1
    .byte $96 ; |X  X XX | $37B2
    .byte $94 ; |X  X X  | $37B3
    .byte $00 ; |        | $37B4
    .byte $00 ; |        | $37B5
    .byte $00 ; |        | $37B6
    .byte $00 ; |        | $37B7
    .byte $00 ; |        | $37B8
    .byte $00 ; |        | $37B9
    .byte $00 ; |        | $37BA
CarCol02_F:
    .byte $A6 ; |X X  XX | $37BB
    .byte $94 ; |X  X X  | $37BC
    .byte $00 ; |        | $37BD
    .byte $00 ; |        | $37BE
    .byte $00 ; |        | $37BF
    .byte $00 ; |        | $37C0
    .byte $00 ; |        | $37C1
    .byte $00 ; |        | $37C2
    .byte $00 ; |        | $37C3
    .byte $00 ; |        | $37C4
Car03_A:
    .byte $3C ; |  XXXX  | $37C5
    .byte $E7 ; |XXX  XXX| $37C6
    .byte $FF ; |XXXXXXXX| $37C7
    .byte $FF ; |XXXXXXXX| $37C8
    .byte $FF ; |XXXXXXXX| $37C9
    .byte $FF ; |XXXXXXXX| $37CA
    .byte $C3 ; |XX    XX| $37CB
    .byte $C3 ; |XX    XX| $37CC
    .byte $00 ; |        | $37CD
    .byte $00 ; |        | $37CE
Car03_B:
    .byte $3C ; |  XXXX  | $37CF
    .byte $66 ; | XX  XX | $37D0
    .byte $7E ; | XXXXXX | $37D1
    .byte $7E ; | XXXXXX | $37D2
    .byte $7E ; | XXXXXX | $37D3
    .byte $7E ; | XXXXXX | $37D4
    .byte $42 ; | X    X | $37D5
    .byte $00 ; |        | $37D6
    .byte $00 ; |        | $37D7
    .byte $00 ; |        | $37D8
Car03_C:
    .byte $3C ; |  XXXX  | $37D9
    .byte $E7 ; |XXX  XXX| $37DA
    .byte $FF ; |XXXXXXXX| $37DB
    .byte $FF ; |XXXXXXXX| $37DC
    .byte $FF ; |XXXXXXXX| $37DD
    .byte $C3 ; |XX    XX| $37DE
    .byte $00 ; |        | $37DF
    .byte $00 ; |        | $37E0
    .byte $00 ; |        | $37E1
    .byte $00 ; |        | $37E2
Car03_D:
    .byte $3C ; |  XXXX  | $37E3
    .byte $66 ; | XX  XX | $37E4
    .byte $7E ; | XXXXXX | $37E5
    .byte $7E ; | XXXXXX | $37E6
    .byte $42 ; | X    X | $37E7
    .byte $00 ; |        | $37E8
    .byte $00 ; |        | $37E9
    .byte $00 ; |        | $37EA
    .byte $00 ; |        | $37EB
    .byte $00 ; |        | $37EC
Car03_E:
    .byte $3C ; |  XXXX  | $37ED
    .byte $E7 ; |XXX  XXX| $37EE
    .byte $FF ; |XXXXXXXX| $37EF
    .byte $C3 ; |XX    XX| $37F0
    .byte $00 ; |        | $37F1
    .byte $00 ; |        | $37F2
    .byte $00 ; |        | $37F3
    .byte $00 ; |        | $37F4
    .byte $00 ; |        | $37F5
    .byte $00 ; |        | $37F6
Car03_F:
    .byte $3C ; |  XXXX  | $37F7
    .byte $7E ; | XXXXXX | $37F8
    .byte $7E ; | XXXXXX | $37F9
    .byte $00 ; |        | $37FA
    .byte $00 ; |        | $37FB
    .byte $00 ; |        | $37FC
    .byte $00 ; |        | $37FD
    .byte $00 ; |        | $37FE
    .byte $00 ; |        | $37FF
    .byte $00 ; |        | $3800
CarCol03_A:
    .byte $00 ; |        | $3801
    .byte $00 ; |        | $3802
    .byte $56 ; | X X XX | $3803
    .byte $00 ; |        | $3804
    .byte $94 ; |X  X X  | $3805
    .byte $96 ; |X  X XX | $3806
    .byte $00 ; |        | $3807
    .byte $00 ; |        | $3808
    .byte $00 ; |        | $3809
    .byte $00 ; |        | $380A
CarCol03_B:
    .byte $00 ; |        | $380B
    .byte $00 ; |        | $380C
    .byte $56 ; | X X XX | $380D
    .byte $00 ; |        | $380E
    .byte $96 ; |X  X XX | $380F
    .byte $96 ; |X  X XX | $3810
    .byte $00 ; |        | $3811
    .byte $00 ; |        | $3812
    .byte $00 ; |        | $3813
    .byte $00 ; |        | $3814
CarCol03_C:
    .byte $00 ; |        | $3815
    .byte $00 ; |        | $3816
    .byte $56 ; | X X XX | $3817
    .byte $94 ; |X  X X  | $3818
    .byte $96 ; |X  X XX | $3819
    .byte $00 ; |        | $381A
    .byte $00 ; |        | $381B
    .byte $00 ; |        | $381C
    .byte $00 ; |        | $381D
    .byte $00 ; |        | $381E
CarCol03_D:
    .byte $00 ; |        | $381F
    .byte $56 ; | X X XX | $3820
    .byte $94 ; |X  X X  | $3821
    .byte $96 ; |X  X XX | $3822
    .byte $00 ; |        | $3823
    .byte $00 ; |        | $3824
    .byte $00 ; |        | $3825
    .byte $00 ; |        | $3826
    .byte $00 ; |        | $3827
    .byte $00 ; |        | $3828
CarCol03_E:
    .byte $00 ; |        | $3829
    .byte $56 ; | X X XX | $382A
    .byte $94 ; |X  X X  | $382B
    .byte $00 ; |        | $382C
    .byte $00 ; |        | $382D
    .byte $00 ; |        | $382E
    .byte $00 ; |        | $382F
    .byte $00 ; |        | $3830
    .byte $00 ; |        | $3831
    .byte $00 ; |        | $3832
CarCol03_F:
    .byte $00 ; |        | $3833
    .byte $56 ; | X X XX | $3834
    .byte $00 ; |        | $3835
    .byte $00 ; |        | $3836
    .byte $00 ; |        | $3837
    .byte $00 ; |        | $3838
    .byte $00 ; |        | $3839
    .byte $00 ; |        | $383A
    .byte $00 ; |        | $383B
    .byte $00 ; |        | $383C
Car04_A:
    .byte $3C ; |  XXXX  | $383D
    .byte $42 ; | X    X | $383E
    .byte $E7 ; |XXX  XXX| $383F
    .byte $FF ; |XXXXXXXX| $3840
    .byte $FF ; |XXXXXXXX| $3841
    .byte $FF ; |XXXXXXXX| $3842
    .byte $FF ; |XXXXXXXX| $3843
    .byte $FF ; |XXXXXXXX| $3844
    .byte $C3 ; |XX    XX| $3845
    .byte $00 ; |        | $3846
Car04_B:
    .byte $3C ; |  XXXX  | $3847
    .byte $42 ; | X    X | $3848
    .byte $66 ; | XX  XX | $3849
    .byte $7E ; | XXXXXX | $384A
    .byte $7E ; | XXXXXX | $384B
    .byte $7E ; | XXXXXX | $384C
    .byte $7E ; | XXXXXX | $384D
    .byte $42 ; | X    X | $384E
    .byte $00 ; |        | $384F
    .byte $00 ; |        | $3850
Car04_C:
    .byte $3C ; |  XXXX  | $3851
    .byte $42 ; | X    X | $3852
    .byte $E7 ; |XXX  XXX| $3853
    .byte $FF ; |XXXXXXXX| $3854
    .byte $FF ; |XXXXXXXX| $3855
    .byte $FF ; |XXXXXXXX| $3856
    .byte $C3 ; |XX    XX| $3857
    .byte $00 ; |        | $3858
    .byte $00 ; |        | $3859
    .byte $00 ; |        | $385A
Car04_D:
    .byte $3C ; |  XXXX  | $385B
    .byte $42 ; | X    X | $385C
    .byte $7E ; | XXXXXX | $385D
    .byte $7E ; | XXXXXX | $385E
    .byte $42 ; | X    X | $385F
    .byte $00 ; |        | $3860
    .byte $00 ; |        | $3861
    .byte $00 ; |        | $3862
    .byte $00 ; |        | $3863
    .byte $00 ; |        | $3864
Car04_E:
    .byte $3C ; |  XXXX  | $3865
    .byte $42 ; | X    X | $3866
    .byte $FF ; |XXXXXXXX| $3867
    .byte $C3 ; |XX    XX| $3868
    .byte $00 ; |        | $3869
    .byte $00 ; |        | $386A
    .byte $00 ; |        | $386B
    .byte $00 ; |        | $386C
    .byte $00 ; |        | $386D
    .byte $00 ; |        | $386E
Car04_F:
    .byte $3C ; |  XXXX  | $386F
    .byte $7E ; | XXXXXX | $3870
    .byte $42 ; | X    X | $3871
    .byte $00 ; |        | $3872
    .byte $00 ; |        | $3873
    .byte $00 ; |        | $3874
    .byte $00 ; |        | $3875
    .byte $00 ; |        | $3876
    .byte $00 ; |        | $3877
    .byte $00 ; |        | $3878
CarCol04_A:
    .byte $1C ; |   XXX  | $3879
    .byte $1A ; |   XX X | $387A
    .byte $44 ; | X   X  | $387B
    .byte $46 ; | X   XX | $387C
    .byte $00 ; |        | $387D
    .byte $40 ; | X      | $387E
    .byte $42 ; | X    X | $387F
    .byte $44 ; | X   X  | $3880
    .byte $00 ; |        | $3881
    .byte $00 ; |        | $3882
CarCol04_B:
    .byte $1C ; |   XXX  | $3883
    .byte $1A ; |   XX X | $3884
    .byte $44 ; | X   X  | $3885
    .byte $46 ; | X   XX | $3886
    .byte $00 ; |        | $3887
    .byte $40 ; | X      | $3888
    .byte $44 ; | X   X  | $3889
    .byte $00 ; |        | $388A
    .byte $00 ; |        | $388B
    .byte $00 ; |        | $388C
CarCol04_C:
    .byte $1C ; |   XXX  | $388D
    .byte $1A ; |   XX X | $388E
    .byte $44 ; | X   X  | $388F
    .byte $46 ; | X   XX | $3890
    .byte $00 ; |        | $3891
    .byte $44 ; | X   X  | $3892
    .byte $00 ; |        | $3893
    .byte $00 ; |        | $3894
    .byte $00 ; |        | $3895
    .byte $00 ; |        | $3896
CarCol04_D:
    .byte $1C ; |   XXX  | $3897
    .byte $1A ; |   XX X | $3898
    .byte $44 ; | X   X  | $3899
    .byte $46 ; | X   XX | $389A
    .byte $00 ; |        | $389B
    .byte $00 ; |        | $389C
    .byte $00 ; |        | $389D
    .byte $00 ; |        | $389E
    .byte $00 ; |        | $389F
    .byte $00 ; |        | $38A0
CarCol04_E:
    .byte $1A ; |   XX X | $38A1
    .byte $44 ; | X   X  | $38A2
    .byte $46 ; | X   XX | $38A3
    .byte $00 ; |        | $38A4
    .byte $00 ; |        | $38A5
    .byte $00 ; |        | $38A6
    .byte $00 ; |        | $38A7
    .byte $00 ; |        | $38A8
    .byte $00 ; |        | $38A9
    .byte $00 ; |        | $38AA
CarCol04_F:
    .byte $18 ; |   XX   | $38AB
    .byte $44 ; | X   X  | $38AC
    .byte $00 ; |        | $38AD
    .byte $00 ; |        | $38AE
    .byte $00 ; |        | $38AF
    .byte $00 ; |        | $38B0
    .byte $00 ; |        | $38B1
    .byte $00 ; |        | $38B2
    .byte $00 ; |        | $38B3
    .byte $00 ; |        | $38B4
Car05_A:
    .byte $C3 ; |XX    XX| $38B5
    .byte $DB ; |XX XX XX| $38B6
    .byte $E7 ; |XXX  XXX| $38B7
    .byte $FF ; |XXXXXXXX| $38B8
    .byte $E7 ; |XXX  XXX| $38B9
    .byte $FF ; |XXXXXXXX| $38BA
    .byte $DB ; |XX XX XX| $38BB
    .byte $C3 ; |XX    XX| $38BC
    .byte $00 ; |        | $38BD
    .byte $00 ; |        | $38BE
Car05_B:
    .byte $42 ; | X    X | $38BF
    .byte $5A ; | X XX X | $38C0
    .byte $66 ; | XX  XX | $38C1
    .byte $7E ; | XXXXXX | $38C2
    .byte $66 ; | XX  XX | $38C3
    .byte $7E ; | XXXXXX | $38C4
    .byte $42 ; | X    X | $38C5
    .byte $00 ; |        | $38C6
    .byte $00 ; |        | $38C7
    .byte $00 ; |        | $38C8
Car05_C:
    .byte $DB ; |XX XX XX| $38C9
    .byte $E7 ; |XXX  XXX| $38CA
    .byte $FF ; |XXXXXXXX| $38CB
    .byte $E7 ; |XXX  XXX| $38CC
    .byte $FF ; |XXXXXXXX| $38CD
    .byte $C3 ; |XX    XX| $38CE
    .byte $00 ; |        | $38CF
    .byte $00 ; |        | $38D0
    .byte $00 ; |        | $38D1
    .byte $00 ; |        | $38D2
Car05_D:
    .byte $5A ; | X XX X | $38D3
    .byte $66 ; | XX  XX | $38D4
    .byte $7E ; | XXXXXX | $38D5
    .byte $7E ; | XXXXXX | $38D6
    .byte $42 ; | X    X | $38D7
    .byte $00 ; |        | $38D8
    .byte $00 ; |        | $38D9
    .byte $00 ; |        | $38DA
    .byte $00 ; |        | $38DB
    .byte $00 ; |        | $38DC
Car05_E:
    .byte $DB ; |XX XX XX| $38DD
    .byte $E7 ; |XXX  XXX| $38DE
    .byte $FF ; |XXXXXXXX| $38DF
    .byte $C3 ; |XX    XX| $38E0
    .byte $00 ; |        | $38E1
    .byte $00 ; |        | $38E2
    .byte $00 ; |        | $38E3
    .byte $00 ; |        | $38E4
    .byte $00 ; |        | $38E5
    .byte $00 ; |        | $38E6
Car05_F:
    .byte $5A ; | X XX X | $38E7
    .byte $7E ; | XXXXXX | $38E8
    .byte $42 ; | X    X | $38E9
    .byte $00 ; |        | $38EA
    .byte $00 ; |        | $38EB
    .byte $00 ; |        | $38EC
    .byte $00 ; |        | $38ED
    .byte $00 ; |        | $38EE
    .byte $00 ; |        | $38EF
    .byte $00 ; |        | $38F0
CarCol05_A:
    .byte $44 ; | X   X  | $38F1
    .byte $44 ; | X   X  | $38F2
    .byte $44 ; | X   X  | $38F3
    .byte $88 ; |X   X   | $38F4
    .byte $42 ; | X    X | $38F5
    .byte $44 ; | X   X  | $38F6
    .byte $44 ; | X   X  | $38F7
    .byte $00 ; |        | $38F8
    .byte $00 ; |        | $38F9
    .byte $00 ; |        | $38FA
CarCol05_B:
    .byte $44 ; | X   X  | $38FB
    .byte $44 ; | X   X  | $38FC
    .byte $44 ; | X   X  | $38FD
    .byte $88 ; |X   X   | $38FE
    .byte $42 ; | X    X | $38FF
    .byte $44 ; | X   X  | $3900
    .byte $00 ; |        | $3901
    .byte $00 ; |        | $3902
    .byte $00 ; |        | $3903
    .byte $00 ; |        | $3904
CarCol05_C:
    .byte $44 ; | X   X  | $3905
    .byte $44 ; | X   X  | $3906
    .byte $88 ; |X   X   | $3907
    .byte $42 ; | X    X | $3908
    .byte $44 ; | X   X  | $3909
    .byte $00 ; |        | $390A
    .byte $00 ; |        | $390B
    .byte $00 ; |        | $390C
    .byte $00 ; |        | $390D
    .byte $00 ; |        | $390E
CarCol05_D:
    .byte $44 ; | X   X  | $390F
    .byte $44 ; | X   X  | $3910
    .byte $88 ; |X   X   | $3911
    .byte $44 ; | X   X  | $3912
    .byte $00 ; |        | $3913
    .byte $00 ; |        | $3914
    .byte $00 ; |        | $3915
    .byte $00 ; |        | $3916
    .byte $00 ; |        | $3917
    .byte $00 ; |        | $3918
CarCol05_E:
    .byte $44 ; | X   X  | $3919
    .byte $88 ; |X   X   | $391A
    .byte $44 ; | X   X  | $391B
    .byte $00 ; |        | $391C
    .byte $00 ; |        | $391D
    .byte $00 ; |        | $391E
    .byte $00 ; |        | $391F
    .byte $00 ; |        | $3920
    .byte $00 ; |        | $3921
    .byte $00 ; |        | $3922
CarCol05_F:
    .byte $44 ; | X   X  | $3923
    .byte $42 ; | X    X | $3924
    .byte $00 ; |        | $3925
    .byte $00 ; |        | $3926
    .byte $00 ; |        | $3927
    .byte $00 ; |        | $3928
    .byte $00 ; |        | $3929
    .byte $00 ; |        | $392A
    .byte $00 ; |        | $392B
    .byte $00 ; |        | $392C
Car06_A:
    .byte $18 ; |   XX   | $392D
    .byte $3C ; |  XXXX  | $392E
    .byte $5A ; | X XX X | $392F
    .byte $7E ; | XXXXXX | $3930
    .byte $FF ; |XXXXXXXX| $3931
    .byte $E7 ; |XXX  XXX| $3932
    .byte $FF ; |XXXXXXXX| $3933
    .byte $FF ; |XXXXXXXX| $3934
    .byte $C3 ; |XX    XX| $3935
    .byte $00 ; |        | $3936
Car06_B:
    .byte $3C ; |  XXXX  | $3937
    .byte $5A ; | X XX X | $3938
    .byte $7E ; | XXXXXX | $3939
    .byte $66 ; | XX  XX | $393A
    .byte $7E ; | XXXXXX | $393B
    .byte $7E ; | XXXXXX | $393C
    .byte $42 ; | X    X | $393D
    .byte $00 ; |        | $393E
    .byte $00 ; |        | $393F
    .byte $00 ; |        | $3940
Car06_C:
    .byte $18 ; |   XX   | $3941
    .byte $3C ; |  XXXX  | $3942
    .byte $5A ; | X XX X | $3943
    .byte $FF ; |XXXXXXXX| $3944
    .byte $FF ; |XXXXXXXX| $3945
    .byte $FF ; |XXXXXXXX| $3946
    .byte $C3 ; |XX    XX| $3947
    .byte $00 ; |        | $3948
    .byte $00 ; |        | $3949
    .byte $00 ; |        | $394A
Car06_D:
    .byte $18 ; |   XX   | $394B
    .byte $24 ; |  X  X  | $394C
    .byte $7E ; | XXXXXX | $394D
    .byte $7E ; | XXXXXX | $394E
    .byte $7E ; | XXXXXX | $394F
    .byte $42 ; | X    X | $3950
    .byte $00 ; |        | $3951
    .byte $00 ; |        | $3952
    .byte $00 ; |        | $3953
    .byte $00 ; |        | $3954
Car06_E:
    .byte $1C ; |   XXX  | $3955
    .byte $36 ; |  XX XX | $3956
    .byte $7F ; | XXXXXXX| $3957
    .byte $7F ; | XXXXXXX| $3958
    .byte $43 ; | X    XX| $3959
    .byte $00 ; |        | $395A
    .byte $00 ; |        | $395B
    .byte $00 ; |        | $395C
    .byte $00 ; |        | $395D
    .byte $00 ; |        | $395E
Car06_F:
    .byte $1C ; |   XXX  | $395F
    .byte $3E ; |  XXXXX | $3960
    .byte $63 ; | XX   XX| $3961
    .byte $00 ; |        | $3962
    .byte $00 ; |        | $3963
    .byte $00 ; |        | $3964
    .byte $00 ; |        | $3965
    .byte $00 ; |        | $3966
    .byte $00 ; |        | $3967
    .byte $00 ; |        | $3968
CarCol06_A:
    .byte $0F ; |    XXXX| $3969
    .byte $0F ; |    XXXX| $396A
    .byte $8A ; |X   X X | $396B
    .byte $88 ; |X   X   | $396C
    .byte $96 ; |X  X XX | $396D
    .byte $44 ; | X   X  | $396E
    .byte $96 ; |X  X XX | $396F
    .byte $96 ; |X  X XX | $3970
    .byte $00 ; |        | $3971
    .byte $00 ; |        | $3972
CarCol06_B:
    .byte $0F ; |    XXXX| $3973
    .byte $0F ; |    XXXX| $3974
    .byte $8A ; |X   X X | $3975
    .byte $96 ; |X  X XX | $3976
    .byte $44 ; | X   X  | $3977
    .byte $96 ; |X  X XX | $3978
    .byte $00 ; |        | $3979
    .byte $00 ; |        | $397A
    .byte $00 ; |        | $397B
    .byte $00 ; |        | $397C
CarCol06_C:
    .byte $0F ; |    XXXX| $397D
    .byte $0F ; |    XXXX| $397E
    .byte $88 ; |X   X   | $397F
    .byte $94 ; |X  X X  | $3980
    .byte $44 ; | X   X  | $3981
    .byte $96 ; |X  X XX | $3982
    .byte $00 ; |        | $3983
    .byte $00 ; |        | $3984
    .byte $00 ; |        | $3985
    .byte $00 ; |        | $3986
CarCol06_D:
    .byte $0F ; |    XXXX| $3987
    .byte $88 ; |X   X   | $3988
    .byte $94 ; |X  X X  | $3989
    .byte $44 ; | X   X  | $398A
    .byte $96 ; |X  X XX | $398B
    .byte $00 ; |        | $398C
    .byte $00 ; |        | $398D
    .byte $00 ; |        | $398E
    .byte $00 ; |        | $398F
    .byte $00 ; |        | $3990
CarCol06_E:
    .byte $0F ; |    XXXX| $3991
    .byte $88 ; |X   X   | $3992
    .byte $94 ; |X  X X  | $3993
    .byte $44 ; | X   X  | $3994
    .byte $00 ; |        | $3995
    .byte $00 ; |        | $3996
    .byte $00 ; |        | $3997
    .byte $00 ; |        | $3998
    .byte $00 ; |        | $3999
    .byte $00 ; |        | $399A
CarCol06_F:
    .byte $88 ; |X   X   | $399B
    .byte $94 ; |X  X X  | $399C
    .byte $00 ; |        | $399D
    .byte $00 ; |        | $399E
    .byte $00 ; |        | $399F
    .byte $00 ; |        | $39A0
    .byte $00 ; |        | $39A1
    .byte $00 ; |        | $39A2
    .byte $00 ; |        | $39A3
    .byte $00 ; |        | $39A4
OilSlick_A:
    .byte $10 ; |   X    | $39A5
    .byte $30 ; |  XX    | $39A6
    .byte $00 ; |        | $39A7
    .byte $00 ; |        | $39A8
    .byte $00 ; |        | $39A9
    .byte $00 ; |        | $39AA
    .byte $00 ; |        | $39AB
    .byte $00 ; |        | $39AC
    .byte $00 ; |        | $39AD
    .byte $00 ; |        | $39AE
OilSlick_B:
    .byte $7C ; | XXXXX  | $39AF
    .byte $FC ; |XXXXXX  | $39B0
    .byte $F8 ; |XXXXX   | $39B1
    .byte $10 ; |   X    | $39B2
    .byte $00 ; |        | $39B3
    .byte $00 ; |        | $39B4
    .byte $00 ; |        | $39B5
    .byte $00 ; |        | $39B6
    .byte $00 ; |        | $39B7
    .byte $00 ; |        | $39B8
OilSlick_C:
    .byte $04 ; |     X  | $39B9
    .byte $1E ; |   XXXX | $39BA
    .byte $3F ; |  XXXXXX| $39BB
    .byte $7C ; | XXXXX  | $39BC
    .byte $38 ; |  XXX   | $39BD
    .byte $10 ; |   X    | $39BE
    .byte $00 ; |        | $39BF
    .byte $00 ; |        | $39C0
    .byte $00 ; |        | $39C1
    .byte $00 ; |        | $39C2
L39C3:
    .byte $10 ; |   X    | $39C3
    .byte $30 ; |  XX    | $39C4
    .byte $00 ; |        | $39C5
    .byte $00 ; |        | $39C6
    .byte $00 ; |        | $39C7
    .byte $00 ; |        | $39C8
    .byte $00 ; |        | $39C9
    .byte $00 ; |        | $39CA
    .byte $00 ; |        | $39CB
    .byte $00 ; |        | $39CC
L39CD:
    .byte $10 ; |   X    | $39CD
    .byte $28 ; |  X X   | $39CE
    .byte $10 ; |   X    | $39CF
    .byte $00 ; |        | $39D0
    .byte $00 ; |        | $39D1
    .byte $00 ; |        | $39D2
    .byte $00 ; |        | $39D3
    .byte $00 ; |        | $39D4
    .byte $00 ; |        | $39D5
    .byte $00 ; |        | $39D6
L39D7:
    .byte $10 ; |   X    | $39D7
    .byte $28 ; |  X X   | $39D8
    .byte $10 ; |   X    | $39D9
    .byte $00 ; |        | $39DA
    .byte $00 ; |        | $39DB
    .byte $00 ; |        | $39DC
    .byte $00 ; |        | $39DD
    .byte $00 ; |        | $39DE
    .byte $00 ; |        | $39DF
    .byte $00 ; |        | $39E0
L39E1:
    .byte $FF ; |XXXXXXXX| $39E1
    .byte $FF ; |XXXXXXXX| $39E2
    .byte $FF ; |XXXXXXXX| $39E3
    .byte $00 ; |        | $39E4
    .byte $00 ; |        | $39E5
    .byte $00 ; |        | $39E6
    .byte $00 ; |        | $39E7
    .byte $00 ; |        | $39E8
    .byte $00 ; |        | $39E9
    .byte $00 ; |        | $39EA
L39EB:
    .byte $7F ; | XXXXXXX| $39EB
    .byte $7F ; | XXXXXXX| $39EC
    .byte $7F ; | XXXXXXX| $39ED
    .byte $7F ; | XXXXXXX| $39EE
    .byte $7F ; | XXXXXXX| $39EF
    .byte $00 ; |        | $39F0
    .byte $00 ; |        | $39F1
    .byte $00 ; |        | $39F2
    .byte $00 ; |        | $39F3
    .byte $00 ; |        | $39F4
L39F5:
    .byte $FF ; |XXXXXXXX| $39F5
    .byte $FF ; |XXXXXXXX| $39F6
    .byte $FF ; |XXXXXXXX| $39F7
    .byte $FF ; |XXXXXXXX| $39F8
    .byte $FF ; |XXXXXXXX| $39F9
    .byte $FF ; |XXXXXXXX| $39FA
    .byte $FF ; |XXXXXXXX| $39FB
    .byte $FF ; |XXXXXXXX| $39FC
    .byte $00 ; |        | $39FD
    .byte $00 ; |        | $39FE
L39FF:
    .byte $96 ; |X  X XX | $39FF
    .byte $96 ; |X  X XX | $3A00
    .byte $96 ; |X  X XX | $3A01
    .byte $96 ; |X  X XX | $3A02
    .byte $00 ; |        | $3A03
    .byte $00 ; |        | $3A04
    .byte $00 ; |        | $3A05
    .byte $00 ; |        | $3A06
    .byte $00 ; |        | $3A07
    .byte $00 ; |        | $3A08
L3A09:
    .byte $F8 ; |XXXXX   | $3A09
    .byte $F8 ; |XXXXX   | $3A0A
    .byte $0C ; |    XX  | $3A0B
    .byte $0C ; |    XX  | $3A0C
    .byte $F8 ; |XXXXX   | $3A0D
    .byte $F8 ; |XXXXX   | $3A0E
    .byte $0C ; |    XX  | $3A0F
    .byte $0C ; |    XX  | $3A10
    .byte $F8 ; |XXXXX   | $3A11
    .byte $00 ; |        | $3A12
L3A13:
    .byte $C8 ; |XX  X   | $3A13
    .byte $C8 ; |XX  X   | $3A14
    .byte $C8 ; |XX  X   | $3A15
    .byte $C8 ; |XX  X   | $3A16
    .byte $00 ; |        | $3A17
    .byte $00 ; |        | $3A18
    .byte $00 ; |        | $3A19
    .byte $00 ; |        | $3A1A
    .byte $00 ; |        | $3A1B
    .byte $00 ; |        | $3A1C
L3A1D:
    .byte $00 ; |        | $3A1D
    .byte $00 ; |        | $3A1E
    .byte $00 ; |        | $3A1F
    .byte $00 ; |        | $3A20
    .byte $00 ; |        | $3A21
    .byte $00 ; |        | $3A22
    .byte $00 ; |        | $3A23
    .byte $00 ; |        | $3A24
    .byte $00 ; |        | $3A25
    .byte $00 ; |        | $3A26
L3A27:
    .byte $B2 ; |X XX  X | $3A27
    .byte $C2 ; |XX    X | $3A28
    .byte $56 ; | X X XX | $3A29
    .byte $FF ; |XXXXXXXX| $3A2A
    .byte $C2 ; |XX    X | $3A2B
    .byte $7E ; | XXXXXX | $3A2C
    .byte $30 ; |  XX    | $3A2D
    .byte $C3 ; |XX    XX| $3A2E
    .byte $C2 ; |XX    X | $3A2F
    .byte $00 ; |        | $3A30
L3A31:
    .byte $0F ; |    XXXX| $3A31
    .byte $18 ; |   XX   | $3A32
    .byte $38 ; |  XXX   | $3A33
    .byte $36 ; |  XX XX | $3A34
    .byte $24 ; |  X  X  | $3A35
    .byte $18 ; |   XX   | $3A36
    .byte $34 ; |  XX X  | $3A37
    .byte $44 ; | X   X  | $3A38
    .byte $28 ; |  X X   | $3A39
    .byte $00 ; |        | $3A3A
L3A3B:
    .byte $03 ; |      XX| $3A3B
    .byte $72 ; | XXX  X | $3A3C
    .byte $73 ; | XXX  XX| $3A3D
    .byte $03 ; |      XX| $3A3E
    .byte $BD ; |X XXXX X| $3A3F
    .byte $CB ; |XX  X XX| $3A40
    .byte $80 ; |X       | $3A41
    .byte $76 ; | XXX XX | $3A42
    .byte $69 ; | XX X  X| $3A43
    .byte $00 ; |        | $3A44
L3A45:
    .byte $18 ; |   XX   | $3A45
    .byte $28 ; |  X X   | $3A46
    .byte $02 ; |      X | $3A47
    .byte $18 ; |   XX   | $3A48
    .byte $06 ; |     XX | $3A49
    .byte $44 ; | X   X  | $3A4A
    .byte $18 ; |   XX   | $3A4B
    .byte $34 ; |  XX X  | $3A4C
    .byte $26 ; |  X  XX | $3A4D
    .byte $00 ; |        | $3A4E
L3A4F:
    .byte $FF ; |XXXXXXXX| $3A4F
    .byte $00 ; |        | $3A50
    .byte $01 ; |       X| $3A51

L3A52:
    lda    ram_D9                ; 3
    and    #$03                  ; 2
    clc                          ; 2
    adc    #$08                  ; 2
    ldy    ram_CB                ; 3
    cpy    #$30                  ; 2
    bcc    L3A63                 ; 2³
    ldy    #$72                  ; 2
    sty    ram_CB                ; 3
L3A63:
    jmp    L3AB8                 ; 3

L3A66:
    ldy    ram_CB                ; 3
    ldx    #$00                  ; 2
    lda    #$00                  ; 2
    cpy    #$03                  ; 2
    bcc    L3A8E                 ; 2³
    ldx    #$01                  ; 2
    cpy    #$06                  ; 2
    bcc    L3A8E                 ; 2³
    ldx    #$02                  ; 2
    lda    #$05                  ; 2
    cpy    #$0A                  ; 2
    bcc    L3A8E                 ; 2³
    ldx    #$03                  ; 2
    cpy    #$0D                  ; 2
    bcc    L3A8E                 ; 2³
    ldx    #$04                  ; 2
    lda    #$07                  ; 2
    cpy    #$11                  ; 2
    bcc    L3A8E                 ; 2³
    ldx    #$05                  ; 2
L3A8E:
    sta    ram_CC                ; 3
    stx    ram_8F                ; 3
    bit    ram_D9                ; 3
    bmi    L3A52                 ; 2³
    lda    sc_4B|READ            ; 4
    and    #$0F                  ; 2
    cmp    #$0C                  ; 2
    bcc    L3AB5                 ; 2³
    bit    sc_4B|READ            ; 4
    bmi    L3AB5                 ; 2³
    cmp    #$0D                  ; 2
    beq    L3AB0                 ; 2³
    lda    #$0D                  ; 2
    sta    sc_4B                 ; 4
    jmp    L3AB5                 ; 3

L3AB0:
    lda    #$0C                  ; 2
    sta    sc_4B                 ; 4
L3AB5:
    lda    sc_4B|READ            ; 4
L3AB8:
    ldy    ram_CB                ; 3
    cpy    #$2D                  ; 2
    bcs    L3AFA                 ; 2³
    asl                          ; 2
    tay                          ; 2
    lda    L3557,Y               ; 4
    sta    ram_88                ; 3
    lda    L3557+1,Y             ; 4
    sta    ram_89                ; 3
    lda    L3573,Y               ; 4
    sta    ram_90                ; 3
    lda    L3573+1,Y             ; 4
    sta    ram_91                ; 3
    lda    ram_8F                ; 3
    asl                          ; 2
    tay                          ; 2
    lda    (ram_88),Y            ; 5
    sta    ram_86                ; 3
    lda    (ram_90),Y            ; 5
    sta    ram_82                ; 3
    iny                          ; 2
    lda    (ram_88),Y            ; 5
    sta    ram_87                ; 3
    lda    (ram_90),Y            ; 5
    sta    ram_83                ; 3
    ldy    #$09                  ; 2
L3AEB:
    lda    (ram_86),Y            ; 5
    sta    sc_37,Y               ; 5
    lda    (ram_82),Y            ; 5
    sta    sc_41,Y               ; 5
    dey                          ; 2
    bpl    L3AEB                 ; 2³
    bmi    L3AFF                 ; 3   always branch

L3AFA:
    lda    #$00                  ; 2
    sta    sc_37                 ; 4
L3AFF:
    jsr    L3BAD                 ; 6
    lda    sc_56|READ            ; 4
    bne    L3B10                 ; 2³
    lda    CXP1FB|$0150          ; 4
    sta    sc_57                 ; 4
    jmp    L3B19                 ; 3

L3B10:
    lda    CXP1FB|$0150          ; 4
    clc                          ; 2
    adc    #$A0                  ; 2
    sta    sc_57                 ; 4
L3B19:
    ldx    ram_CB                ; 3
    bmi    L3B7D                 ; 2³
    cpx    #$72                  ; 2
    bcs    L3B79                 ; 2³
    bit    ram_D9                ; 3
    bpl    L3B28                 ; 2³
    jmp    L3CB5                 ; 3

L3B28:
    lda    sc_58|READ            ; 4
    bne    L3B65                 ; 2³
    lda    ram_CB                ; 3
    ldy    #$0B                  ; 2
    cmp    #$20                  ; 2
    bcs    L3B38                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
L3B38:
    lda    sc_55|READ            ; 4
    clc                          ; 2
    adc    L3BA1,Y               ; 4
    sta    sc_55                 ; 4
    bcc    L3B65                 ; 2³
    lda    sc_4C|READ            ; 4
    and    #$03                  ; 2
    tax                          ; 2
    lda    ram_CB                ; 3
    clc                          ; 2
    adc    L3A4F,X               ; 4
    sta    ram_CB                ; 3
    cmp    #$1F                  ; 2
    bne    L3B65                 ; 2³
    lda    #$19                  ; 2
    sta    sc_58                 ; 4
    lda    sc_4C|READ            ; 4
    and    #$F0                  ; 2
    ora    #$01                  ; 2
    sta    sc_4C                 ; 4
L3B65:
    lda    sc_4B|READ            ; 4
    cmp    #$0C                  ; 2
    bcc    L3B76                 ; 2³
    inc    ram_CB                ; 5
    ldy    ram_CB                ; 3
    cpy    #$30                  ; 2
    bcc    L3B76                 ; 2³
    bcs    L3B7D                 ; 3   always branch

L3B76:
    jmp    L3BD8                 ; 3

L3B79:
    inc    ram_D5                ; 5
    inc    ram_D5                ; 5
L3B7D:
    lda    #$FE                  ; 2
    sta    ram_CB                ; 3
    lda    ram_DD                ; 3
    bne    L3B9E                 ; 2³
    lda    ram_C4                ; 3
    clc                          ; 2
    adc    #$26                  ; 2
    sta    ram_CD                ; 3
    lda    sc_4B|READ            ; 4
    ora    #$C0                  ; 2
    and    #$F0                  ; 2
    sta    sc_4B                 ; 4
    lda    #$00                  ; 2
    sta    sc_37                 ; 4
    jmp    L3F68                 ; 3

L3B9E:
    jmp    L3452                 ; 3

L3BA1:
    .byte $10 ; |   X    | $3BA1
    .byte $30 ; |  XX    | $3BA2
    .byte $60 ; | XX     | $3BA3
    .byte $A0 ; |X X     | $3BA4
    .byte $D0 ; |XX X    | $3BA5
    .byte $E0 ; |XXX     | $3BA6
    .byte $F0 ; |XXXX    | $3BA7
    .byte $FF ; |XXXXXXXX| $3BA8
    .byte $FF ; |XXXXXXXX| $3BA9
    .byte $FF ; |XXXXXXXX| $3BAA
    .byte $FF ; |XXXXXXXX| $3BAB
    .byte $FF ; |XXXXXXXX| $3BAC

L3BAD:
    lda    sc_4B|READ            ; 4
    cmp    #$0C                  ; 2
    bcs    L3BCD                 ; 2³
    lda    ram_D2                ; 3
    and    #$F0                  ; 2
    sta    ram_8E                ; 3
    lda    ram_D4                ; 3
    and    #$F0                  ; 2
    cmp    ram_8E                ; 3
    beq    L3BD7                 ; 2³
    bcc    L3BCD                 ; 2³
    lda    sc_4C|READ            ; 4
    and    #$F0                  ; 2
    sta    sc_4C                 ; 4
    rts                          ; 6

L3BCD:
    lda    sc_4C|READ            ; 4
    and    #$F0                  ; 2
    ora    #$02                  ; 2
    sta    sc_4C                 ; 4
L3BD7:
    rts                          ; 6

L3BD8:
    bit    ram_DA                ; 3
    bmi    L3C05                 ; 2³+1
    ldy    ram_CB                ; 3
    cpy    #$0E                  ; 2
    bcc    L3C05                 ; 2³+1
    beq    L3BF4                 ; 2³
    cmp    #$32                  ; 2
    bne    L3C05                 ; 2³+1
    dec    ram_DA                ; 5
    lda    ram_D2                ; 3
    clc                          ; 2
    adc    #$0F                  ; 2
    sta    ram_D4                ; 3
    jmp    L3BFD                 ; 3

L3BF4:
    lda    ram_D2                ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    ram_D4                ; 3
    dec    ram_DA                ; 5
L3BFD:
    lda    sc_56|READ            ; 4
    eor    #$01                  ; 2
    sta    sc_56                 ; 4
L3C05:
    lda    sc_58|READ            ; 4
    beq    L3C37                 ; 2³
    ldy    ram_D2                ; 3
    sty    ram_D4                ; 3
    sec                          ; 2
    sbc    #$01                  ; 2
    sta    sc_58                 ; 4
    bne    L3C2F                 ; 2³
    lda    sc_56|READ            ; 4
    beq    L3C25                 ; 2³
    lda    ram_D2                ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    ram_D4                ; 3
    jmp    L3C37                 ; 3

L3C25:
    lda    ram_D2                ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    ram_D4                ; 3
    jmp    L3C37                 ; 3

L3C2F:
    cpy    #$28                  ; 2
    bcs    L3C37                 ; 2³
    ldy    #$3C                  ; 2
    sty    ram_D4                ; 3
L3C37:
    ldy    ram_CB                ; 3
    cpy    #$1F                  ; 2
    beq    L3C4C                 ; 2³
    cpy    #$24                  ; 2
    bcs    L3C47                 ; 2³
    lda    sc_57|READ            ; 4
    jmp    L3C4E                 ; 3

L3C47:
    lda    #$46                  ; 2
    jmp    L3C4E                 ; 3

L3C4C:
    lda    ram_84                ; 3
L3C4E:
    sta    ram_8E                ; 3
    jsr    L3CE7                 ; 6
    bcs    L3C5D                 ; 2³
    lda    ram_CD                ; 3
    cmp    ram_8E                ; 3
    bcc    L3C60                 ; 2³
    bcs    L3C68                 ; 3   always branch

L3C5D:
    jmp    L3C70                 ; 3

L3C60:
    clc                          ; 2
    adc    #$02                  ; 2
    sta    ram_CD                ; 3
    jmp    L3C70                 ; 3

L3C68:
    sec                          ; 2
    sbc    #$02                  ; 2
    sta    ram_CD                ; 3
    jmp    L3C70                 ; 3

L3C70:
    ldy    ram_CB                ; 3
    cpy    #$24                  ; 2
    bcs    L3C99                 ; 2³
    lda    ram_CD                ; 3
    cmp    sc_4F|READ            ; 4
    bcs    L3C8A                 ; 2³
    lda    sc_4F|READ            ; 4
    sta    ram_CD                ; 3
    lda    #$00                  ; 2
    sta    sc_58                 ; 4
    jmp    L3C99                 ; 3

L3C8A:
    cmp    sc_51|READ            ; 4
    bcc    L3C99                 ; 2³
    lda    sc_51|READ            ; 4
    sta    ram_CD                ; 3
    lda    #$00                  ; 2
    sta    sc_58                 ; 4
L3C99:
    jsr    L3D91                 ; 6
    bcs    L3CB2                 ; 2³
    lda    ram_D2                ; 3
    sec                          ; 2
    sbc    #$14                  ; 2
    lda    #$00                  ; 2
    sta    sc_58                 ; 4
    sta    sc_56                 ; 4
    lda    ram_CB                ; 3
    clc                          ; 2
    adc    #$04                  ; 2
    sta    ram_CB                ; 3
L3CB2:
    jmp    L3F68                 ; 3

L3CB5:
    lda    ram_D2                ; 3
    cmp    #$02                  ; 2
    bcc    L3CBD                 ; 2³
    inc    ram_CB                ; 5
L3CBD:
    lda    sc_51|READ            ; 4
    sec                          ; 2
    sbc    sc_4F|READ            ; 4
    lsr                          ; 2
    ldx    ram_C7                ; 3
    cpx    #$03                  ; 2
    bcc    L3CD4                 ; 2³
    clc                          ; 2
    adc    sc_4F|READ            ; 4
    sta    ram_CD                ; 3
    jmp    L3F68                 ; 3

L3CD4:
    sta    ram_8D                ; 3
    lda    sc_51|READ            ; 4
    sec                          ; 2
    sbc    ram_8D                ; 3
    sta    ram_CD                ; 3
    jmp    L3F68                 ; 3

L3CE1:
    lda    #$00                  ; 2
    sta    ram_D8                ; 3
    clc                          ; 2
    rts                          ; 6

L3CE7:
    bit    CXPPMM|$30            ; 3
    bpl    L3CE1                 ; 2³
    lda    sc_4B|READ            ; 4
    cmp    #$0C                  ; 2
    bcs    L3CE1                 ; 2³
    bit    sc_4B|READ            ; 4
    bmi    L3CE1                 ; 2³
    ldy    ram_CB                ; 3
    cpy    #$1F                  ; 2
    beq    L3D3F                 ; 2³+1
    bcc    L3D2B                 ; 2³+1
    ldy    ram_CB                ; 3
    cpy    #$27                  ; 2
    bcs    L3CE1                 ; 2³+1
    ldx    #$80                  ; 2
    stx    ram_D8                ; 3
    lda    ram_81                ; 3
    cmp    #$0D                  ; 2
    beq    L3D1A                 ; 2³
    lda    ram_CB                ; 3
    clc                          ; 2
    adc    #$06                  ; 2
    sta    ram_CB                ; 3
    sta    CXCLR                 ; 3
    sec                          ; 2
    rts                          ; 6

L3D1A:
    ldx    #$C0                  ; 2
    stx    ram_D8                ; 3
    inc    ram_CB                ; 5
    ldy    sc_4D|READ            ; 4
    dey                          ; 2
    dey                          ; 2
    sty    sc_4D                 ; 4
    jmp    L3D62                 ; 3

L3D2B:
    ldx    #$80                  ; 2
    bit    INPT4|$30             ; 3
    bmi    L3D33                 ; 2³
    ldx    #$C0                  ; 2
L3D33:
    stx    ram_D8                ; 3
    lda    ram_CB                ; 3
    sec                          ; 2
    sbc    #$03                  ; 2
    sta    ram_CB                ; 3
    jmp    L3D62                 ; 3

L3D3F:
    ldx    #$80                  ; 2
    lda    ram_81                ; 3
    cmp    #$0B                  ; 2
    beq    L3D4B                 ; 2³
    cmp    #$07                  ; 2
    bne    L3D4D                 ; 2³
L3D4B:
    ldx    #$C0                  ; 2
L3D4D:
    stx    ram_D8                ; 3
    lda    ram_CD                ; 3
    cmp    ram_84                ; 3
    bcc    L3D5D                 ; 2³
    clc                          ; 2
    adc    #$0C                  ; 2
    sta    ram_CD                ; 3
    jmp    L3D62                 ; 3

L3D5D:
    sec                          ; 2
    sbc    #$0C                  ; 2
    sta    ram_CD                ; 3
L3D62:
    cpx    #$C0                  ; 2
    bne    L3D8F                 ; 2³
    ldy    sc_4D|READ            ; 4
    dey                          ; 2
    bmi    L3D71                 ; 2³
    sty    sc_4D                 ; 4
    bne    L3D8F                 ; 2³
L3D71:
    ldx    armorStatus|READ      ; 4
    inx                          ; 2
    bmi    L3D7A                 ; 2³
  IF ARMOR_DAMAGE
    stx    armorStatus           ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
L3D7A:
    lda    #$0D                  ; 2
    sta    sc_4B                 ; 4
    lda    #$0A                  ; 2
    sta    ram_D4                ; 3
    lda    ram_D5                ; 3
    clc                          ; 2
    adc    #$14                  ; 2
    sta    ram_D5                ; 3
    lda    #$00                  ; 2
    sta    sc_58                 ; 4
L3D8F:
    sec                          ; 2
    rts                          ; 6

L3D91:
    ldy    ram_CB                ; 3
    cpy    #$1F                  ; 2
    bcc    L3DB7                 ; 2³
    cpy    #$23                  ; 2
    bcs    L3DB7                 ; 2³
    bit    CXPPMM|$30            ; 3
    bpl    L3DB7                 ; 2³
    lda    ram_84                ; 3
    sta    ram_8E                ; 3
    clc                          ; 2
    adc    #$1C                  ; 2
    sta    ram_8F                ; 3
    lda    ram_CD                ; 3
    cmp    ram_8F                ; 3
    bcs    L3DB7                 ; 2³
    clc                          ; 2
    adc    #$1A                  ; 2
    cmp    ram_8E                ; 3
    bcc    L3DB7                 ; 2³
    clc                          ; 2
    rts                          ; 6

L3DB7:
    sec                          ; 2
    rts                          ; 6

L3DB9:
    lda    ram_D6                ; 3
    asl                          ; 2
    tax                          ; 2
    lda    L3DE9,X               ; 4
    sta    ram_86                ; 3
    lda    L3DE9+1,X             ; 4
    sta    ram_87                ; 3
    lda    L3DF7,X               ; 4
    sta    ram_82                ; 3
    lda    L3DF7+1,X             ; 4
    sta    ram_83                ; 3
    lda    (ram_86),Y            ; 5
    sta    AUDF1                 ; 3
    lda    (ram_82),Y            ; 5
    sta    AUDC1                 ; 3
    dey                          ; 2
    bne    L3DE4                 ; 2³
    lda    #$00                  ; 2
    sta    AUDV1                 ; 3
    lda    #$07                  ; 2
    sta    ram_D6                ; 3
L3DE4:
    sty    ram_80                ; 3
    jmp    L3F68                 ; 3

L3DE9:
    .word L3E05          ; $3DE9
    .word L3E05          ; $3DEB
    .word L3E05          ; $3DED
    .word L3E2D          ; $3DEF
    .word L3E4D          ; $3DF1
    .word L3E6F          ; $3DF3
    .word L3E97          ; $3DF5
L3DF7:
    .word L3E19          ; $3DF7
    .word L3E19          ; $3DF9
    .word L3E19          ; $3DFB
    .word L3E39          ; $3DFD
    .word L3E5B          ; $3DFF
    .word L3E83          ; $3E01
    .word L3EAB          ; $3E03

L3E05:
    .byte $15 ; |   X X X| $3E05
    .byte $12 ; |   X  X | $3E06
    .byte $0F ; |    XXXX| $3E07
    .byte $0E ; |    XXX | $3E08
    .byte $0C ; |    XX  | $3E09
    .byte $0C ; |    XX  | $3E0A
    .byte $0D ; |    XX X| $3E0B
    .byte $0C ; |    XX  | $3E0C
    .byte $0F ; |    XXXX| $3E0D
    .byte $0E ; |    XXX | $3E0E
    .byte $12 ; |   X  X | $3E0F
    .byte $11 ; |   X   X| $3E10
    .byte $14 ; |   X X  | $3E11
    .byte $13 ; |   X  XX| $3E12
    .byte $15 ; |   X X X| $3E13
    .byte $14 ; |   X X  | $3E14
    .byte $15 ; |   X X X| $3E15
    .byte $18 ; |   XX   | $3E16
    .byte $15 ; |   X X X| $3E17
    .byte $00 ; |        | $3E18
L3E19:
    .byte $0F ; |    XXXX| $3E19
    .byte $08 ; |    X   | $3E1A
    .byte $08 ; |    X   | $3E1B
    .byte $08 ; |    X   | $3E1C
    .byte $08 ; |    X   | $3E1D
    .byte $08 ; |    X   | $3E1E
    .byte $08 ; |    X   | $3E1F
    .byte $08 ; |    X   | $3E20
    .byte $08 ; |    X   | $3E21
    .byte $08 ; |    X   | $3E22
    .byte $08 ; |    X   | $3E23
    .byte $08 ; |    X   | $3E24
    .byte $08 ; |    X   | $3E25
    .byte $08 ; |    X   | $3E26
    .byte $08 ; |    X   | $3E27
    .byte $08 ; |    X   | $3E28
    .byte $08 ; |    X   | $3E29
    .byte $08 ; |    X   | $3E2A
    .byte $08 ; |    X   | $3E2B
    .byte $08 ; |    X   | $3E2C
L3E2D:
    .byte $1E ; |   XXXX | $3E2D
    .byte $18 ; |   XX   | $3E2E
    .byte $15 ; |   X X X| $3E2F
    .byte $17 ; |   X XXX| $3E30
    .byte $1D ; |   XXX X| $3E31
    .byte $0E ; |    XXX | $3E32
    .byte $18 ; |   XX   | $3E33
    .byte $1D ; |   XXX X| $3E34
    .byte $18 ; |   XX   | $3E35
    .byte $17 ; |   X XXX| $3E36
    .byte $18 ; |   XX   | $3E37
    .byte $00 ; |        | $3E38
L3E39:
    .byte $03 ; |      XX| $3E39
    .byte $08 ; |    X   | $3E3A
    .byte $08 ; |    X   | $3E3B
    .byte $07 ; |     XXX| $3E3C
    .byte $08 ; |    X   | $3E3D
    .byte $08 ; |    X   | $3E3E
    .byte $0E ; |    XXX | $3E3F
    .byte $0D ; |    XX X| $3E40
    .byte $08 ; |    X   | $3E41
    .byte $08 ; |    X   | $3E42
    .byte $08 ; |    X   | $3E43
    .byte $00 ; |        | $3E44
    .byte $00 ; |        | $3E45
    .byte $00 ; |        | $3E46
    .byte $00 ; |        | $3E47
    .byte $00 ; |        | $3E48
    .byte $00 ; |        | $3E49
    .byte $00 ; |        | $3E4A
    .byte $00 ; |        | $3E4B
    .byte $00 ; |        | $3E4C
L3E4D:
    .byte $19 ; |   XX  X| $3E4D
    .byte $1D ; |   XXX X| $3E4E
    .byte $1B ; |   XX XX| $3E4F
    .byte $1E ; |   XXXX | $3E50
    .byte $1B ; |   XX XX| $3E51
    .byte $1D ; |   XXX X| $3E52
    .byte $1A ; |   XX X | $3E53
    .byte $1C ; |   XXX  | $3E54
    .byte $1E ; |   XXXX | $3E55
    .byte $1B ; |   XX XX| $3E56
    .byte $19 ; |   XX  X| $3E57
    .byte $1C ; |   XXX  | $3E58
    .byte $1A ; |   XX X | $3E59
    .byte $1E ; |   XXXX | $3E5A
L3E5B:
    .byte $04 ; |     X  | $3E5B
    .byte $04 ; |     X  | $3E5C
    .byte $04 ; |     X  | $3E5D
    .byte $04 ; |     X  | $3E5E
    .byte $04 ; |     X  | $3E5F
    .byte $04 ; |     X  | $3E60
    .byte $04 ; |     X  | $3E61
    .byte $04 ; |     X  | $3E62
    .byte $04 ; |     X  | $3E63
    .byte $04 ; |     X  | $3E64
    .byte $04 ; |     X  | $3E65
    .byte $04 ; |     X  | $3E66
    .byte $04 ; |     X  | $3E67
    .byte $04 ; |     X  | $3E68
    .byte $00 ; |        | $3E69
    .byte $00 ; |        | $3E6A
    .byte $00 ; |        | $3E6B
    .byte $00 ; |        | $3E6C
    .byte $00 ; |        | $3E6D
    .byte $00 ; |        | $3E6E
L3E6F:
    .byte $11 ; |   X   X| $3E6F
    .byte $11 ; |   X   X| $3E70
    .byte $11 ; |   X   X| $3E71
    .byte $00 ; |        | $3E72
    .byte $11 ; |   X   X| $3E73
    .byte $11 ; |   X   X| $3E74
    .byte $11 ; |   X   X| $3E75
    .byte $00 ; |        | $3E76
    .byte $11 ; |   X   X| $3E77
    .byte $11 ; |   X   X| $3E78
    .byte $11 ; |   X   X| $3E79
    .byte $00 ; |        | $3E7A
    .byte $11 ; |   X   X| $3E7B
    .byte $11 ; |   X   X| $3E7C
    .byte $11 ; |   X   X| $3E7D
    .byte $00 ; |        | $3E7E
    .byte $00 ; |        | $3E7F
    .byte $00 ; |        | $3E80
    .byte $00 ; |        | $3E81
    .byte $00 ; |        | $3E82
L3E83:
    .byte $05 ; |     X X| $3E83
    .byte $05 ; |     X X| $3E84
    .byte $05 ; |     X X| $3E85
    .byte $00 ; |        | $3E86
    .byte $05 ; |     X X| $3E87
    .byte $05 ; |     X X| $3E88
    .byte $05 ; |     X X| $3E89
    .byte $00 ; |        | $3E8A
    .byte $05 ; |     X X| $3E8B
    .byte $05 ; |     X X| $3E8C
    .byte $05 ; |     X X| $3E8D
    .byte $00 ; |        | $3E8E
    .byte $05 ; |     X X| $3E8F
    .byte $05 ; |     X X| $3E90
    .byte $05 ; |     X X| $3E91
    .byte $00 ; |        | $3E92
    .byte $00 ; |        | $3E93
    .byte $00 ; |        | $3E94
    .byte $00 ; |        | $3E95
    .byte $00 ; |        | $3E96
L3E97:
    .byte $08 ; |    X   | $3E97
    .byte $11 ; |   X   X| $3E98
    .byte $14 ; |   X X  | $3E99
    .byte $00 ; |        | $3E9A
    .byte $08 ; |    X   | $3E9B
    .byte $11 ; |   X   X| $3E9C
    .byte $14 ; |   X X  | $3E9D
    .byte $00 ; |        | $3E9E
    .byte $08 ; |    X   | $3E9F
    .byte $11 ; |   X   X| $3EA0
    .byte $14 ; |   X X  | $3EA1
    .byte $18 ; |   XX   | $3EA2
    .byte $1A ; |   XX X | $3EA3
    .byte $1D ; |   XXX X| $3EA4
    .byte $1E ; |   XXXX | $3EA5
    .byte $1F ; |   XXXXX| $3EA6
    .byte $00 ; |        | $3EA7
    .byte $00 ; |        | $3EA8
    .byte $00 ; |        | $3EA9
    .byte $00 ; |        | $3EAA
L3EAB:
    .byte $05 ; |     X X| $3EAB
    .byte $05 ; |     X X| $3EAC
    .byte $05 ; |     X X| $3EAD
    .byte $00 ; |        | $3EAE
    .byte $05 ; |     X X| $3EAF
    .byte $05 ; |     X X| $3EB0
    .byte $05 ; |     X X| $3EB1
    .byte $00 ; |        | $3EB2
    .byte $05 ; |     X X| $3EB3
    .byte $05 ; |     X X| $3EB4
    .byte $05 ; |     X X| $3EB5
    .byte $05 ; |     X X| $3EB6
    .byte $05 ; |     X X| $3EB7
    .byte $05 ; |     X X| $3EB8
    .byte $05 ; |     X X| $3EB9
    .byte $05 ; |     X X| $3EBA
    .byte $00 ; |        | $3EBB
    .byte $00 ; |        | $3EBC
    .byte $00 ; |        | $3EBD
    .byte $00 ; |        | $3EBE


  IF SHOW_BYTES_REMAINING
    ECHO ([$3EFC-*]d), "bytes free BANK_1"
  ENDIF


       ORG $1EFC
      RORG $3EFC

    lda    BANK_2                ; 4
    jmp    M5106|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M5109|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9106|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M510C|BANK_MASK       ; 3

    lda    BANK_1                ; 4
    jmp    M3109|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9109|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M510F|BANK_MASK       ; 3

    lda    BANK_3                ; 4
    jmp    M7106|BANK_MASK       ; 3

    lda    BANK_3                ; 4
    jmp    M7109|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M5112|BANK_MASK       ; 3

    lda    BANK_1                ; 4
    jmp    M310F|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB10C|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB10F|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9112|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB106|BANK_MASK       ; 3

    lda    BANK_7                ; 4
    jmp    MF106|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M910F|BANK_MASK       ; 3

    lda    BANK_6                ; 4
    jmp    MD106|BANK_MASK       ; 3

L3F68:
    lda    BANK_0                ; 4
    rts                          ; 6

    lda    BANK_3                ; 4
    rts                          ; 6

    lda    BANK_4                ; 4
    rts                          ; 6

    lda    BANK_6                ; 4
    rts                          ; 6


; $3F78 - $3FF3 are free bytes


       ORG $1FF4
      RORG $3FF4

    .byte $00 ; |        | $3FF4
    .byte $00 ; |        | $3FF5
    .byte $00 ; |        | $3FF6
    .byte $00 ; |        | $3FF7
    .byte $00 ; |        | $3FF8
    .byte $00 ; |        | $3FF9
    .byte $00 ; |        | $3FFA
    .byte $00 ; |        | $3FFB

    .word START_1
    .word 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      BANK 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $2000
      RORG $5000

    SC_RAM_SPACE

START_2:
    lda    BANK_0                ; 4
    jmp    START_2               ; 3

M5106:
    jmp    L537C                 ; 3

M5109:
    jmp    L545C                 ; 3

M510C:
    jmp    L56E5                 ; 3

M510F:
    jmp    L57DA                 ; 3

M5112:
    jmp    L51C9                 ; 3

L5115:
    .word Zero            ; $5115
    .word One             ; $5117
    .word Two             ; $5119
    .word Three           ; $511B
    .word Four            ; $511D
    .word Five            ; $511F
    .word Six             ; $5121
    .word Seven           ; $5123
    .word Eight           ; $5125
    .word Nine            ; $5127

Zero:
    .byte $00 ; |        | $5129
    .byte $3C ; |  XXXX  | $512A
    .byte $66 ; | XX  XX | $512B
    .byte $76 ; | XXX XX | $512C
    .byte $6E ; | XX XXX | $512D
    .byte $66 ; | XX  XX | $512E
    .byte $3C ; |  XXXX  | $512F
One:
    .byte $00 ; |        | $5130
    .byte $7E ; | XXXXXX | $5131
    .byte $18 ; |   XX   | $5132
    .byte $18 ; |   XX   | $5133
    .byte $18 ; |   XX   | $5134
    .byte $38 ; |  XXX   | $5135
    .byte $18 ; |   XX   | $5136
Two:
    .byte $00 ; |        | $5137
    .byte $7E ; | XXXXXX | $5138
    .byte $30 ; |  XX    | $5139
    .byte $18 ; |   XX   | $513A
    .byte $0C ; |    XX  | $513B
    .byte $66 ; | XX  XX | $513C
    .byte $3C ; |  XXXX  | $513D
Three:
    .byte $00 ; |        | $513E
    .byte $3C ; |  XXXX  | $513F
    .byte $66 ; | XX  XX | $5140
    .byte $0C ; |    XX  | $5141
    .byte $18 ; |   XX   | $5142
    .byte $0C ; |    XX  | $5143
    .byte $7E ; | XXXXXX | $5144
Four:
    .byte $00 ; |        | $5145
    .byte $0C ; |    XX  | $5146
    .byte $7E ; | XXXXXX | $5147
    .byte $6C ; | XX XX  | $5148
    .byte $3C ; |  XXXX  | $5149
    .byte $1C ; |   XXX  | $514A
    .byte $0C ; |    XX  | $514B
Five:
    .byte $00 ; |        | $514C
    .byte $3C ; |  XXXX  | $514D
    .byte $66 ; | XX  XX | $514E
    .byte $06 ; |     XX | $514F
    .byte $7C ; | XXXXX  | $5150
    .byte $60 ; | XX     | $5151
    .byte $7E ; | XXXXXX | $5152
Six:
    .byte $00 ; |        | $5153
    .byte $3C ; |  XXXX  | $5154
    .byte $66 ; | XX  XX | $5155
    .byte $66 ; | XX  XX | $5156
    .byte $7C ; | XXXXX  | $5157
    .byte $60 ; | XX     | $5158
    .byte $3C ; |  XXXX  | $5159
Seven:
    .byte $00 ; |        | $515A
    .byte $30 ; |  XX    | $515B
    .byte $30 ; |  XX    | $515C
    .byte $18 ; |   XX   | $515D
    .byte $0C ; |    XX  | $515E
    .byte $06 ; |     XX | $515F
    .byte $7E ; | XXXXXX | $5160
Eight:
    .byte $00 ; |        | $5161
    .byte $3C ; |  XXXX  | $5162
    .byte $66 ; | XX  XX | $5163
    .byte $66 ; | XX  XX | $5164
    .byte $3C ; |  XXXX  | $5165
    .byte $66 ; | XX  XX | $5166
    .byte $3C ; |  XXXX  | $5167
Nine:
    .byte $00 ; |        | $5168
    .byte $38 ; |  XXX   | $5169
    .byte $0C ; |    XX  | $516A
    .byte $06 ; |     XX | $516B
    .byte $3E ; |  XXXXX | $516C
    .byte $66 ; | XX  XX | $516D
    .byte $3C ; |  XXXX  | $516E

L516F:
    .word Sm_Zero         ; $516F
    .word Sm_One          ; $5171
    .word Sm_Two          ; $5173
    .word Sm_Three        ; $5175
    .word Sm_Four         ; $5177
    .word Sm_Five         ; $5179
    .word Sm_Six          ; $517B
    .word Sm_Seven        ; $517D
    .word Sm_Eight        ; $517F
    .word Sm_Nine         ; $5181
Sm_Zero:
    .byte $02 ; |      X | $5183
    .byte $05 ; |     X X| $5184
    .byte $05 ; |     X X| $5185
    .byte $05 ; |     X X| $5186
    .byte $05 ; |     X X| $5187
    .byte $02 ; |      X | $5188
    .byte $00 ; |        | $5189
Sm_One:
    .byte $02 ; |      X | $518A
    .byte $06 ; |     XX | $518B
    .byte $02 ; |      X | $518C
    .byte $02 ; |      X | $518D
    .byte $02 ; |      X | $518E
    .byte $07 ; |     XXX| $518F
    .byte $00 ; |        | $5190
Sm_Two:
    .byte $07 ; |     XXX| $5191
    .byte $01 ; |       X| $5192
    .byte $07 ; |     XXX| $5193
    .byte $04 ; |     X  | $5194
    .byte $04 ; |     X  | $5195
    .byte $07 ; |     XXX| $5196
    .byte $00 ; |        | $5197
Sm_Three:
    .byte $07 ; |     XXX| $5198
    .byte $01 ; |       X| $5199
    .byte $07 ; |     XXX| $519A
    .byte $01 ; |       X| $519B
    .byte $01 ; |       X| $519C
    .byte $07 ; |     XXX| $519D
    .byte $00 ; |        | $519E
Sm_Four:
    .byte $05 ; |     X X| $519F
    .byte $05 ; |     X X| $51A0
    .byte $07 ; |     XXX| $51A1
    .byte $01 ; |       X| $51A2
    .byte $01 ; |       X| $51A3
    .byte $01 ; |       X| $51A4
    .byte $00 ; |        | $51A5
Sm_Five:
    .byte $07 ; |     XXX| $51A6
    .byte $04 ; |     X  | $51A7
    .byte $07 ; |     XXX| $51A8
    .byte $01 ; |       X| $51A9
    .byte $01 ; |       X| $51AA
    .byte $07 ; |     XXX| $51AB
    .byte $00 ; |        | $51AC
Sm_Six:
    .byte $07 ; |     XXX| $51AD
    .byte $04 ; |     X  | $51AE
    .byte $07 ; |     XXX| $51AF
    .byte $05 ; |     X X| $51B0
    .byte $05 ; |     X X| $51B1
    .byte $07 ; |     XXX| $51B2
    .byte $00 ; |        | $51B3
Sm_Seven:
    .byte $07 ; |     XXX| $51B4
    .byte $01 ; |       X| $51B5
    .byte $01 ; |       X| $51B6
    .byte $01 ; |       X| $51B7
    .byte $01 ; |       X| $51B8
    .byte $01 ; |       X| $51B9
    .byte $00 ; |        | $51BA
Sm_Eight:
    .byte $07 ; |     XXX| $51BB
    .byte $05 ; |     X X| $51BC
    .byte $07 ; |     XXX| $51BD
    .byte $05 ; |     X X| $51BE
    .byte $05 ; |     X X| $51BF
    .byte $07 ; |     XXX| $51C0
    .byte $00 ; |        | $51C1
Sm_Nine:
    .byte $07 ; |     XXX| $51C2
    .byte $05 ; |     X X| $51C3
    .byte $07 ; |     XXX| $51C4
    .byte $01 ; |       X| $51C5
    .byte $01 ; |       X| $51C6
    .byte $01 ; |       X| $51C7
    .byte $00 ; |        | $51C8

L51C9:
    lda    #$BA                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    #$4A                  ; 2
    lda    L5737,X               ; 4
    sta    HMP0                  ; 3
    ldx    #$00                  ; 2
    stx    REFP0                 ; 3
    stx    REFP1                 ; 3
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    stx    VDELP0                ; 3
    stx    VDELP1                ; 3
    jsr    L56CF                 ; 6
    nop                          ; 2
    nop                          ; 2
    ldx    #$52                  ; 2
    lda    L5737,X               ; 4
    sta    HMCLR                 ; 3
    ldx    #$07                  ; 2
    stx    ram_96                ; 3
    nop                          ; 2
    nop                          ; 2
    sta    HMP1                  ; 3
    ldx    #$01                  ; 2
    jsr    L56CF                 ; 6
    lda    sc_05|READ            ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L516F,Y               ; 4
    sta    ram_8C                ; 3
    lda    L516F+1,Y             ; 4
    sta    ram_8D                ; 3
    lda    sc_05|READ            ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L516F,Y               ; 4
    sta    ram_8E                ; 3
    lda    L516F+1,Y             ; 4
    sta    ram_8F                ; 3
    lda    sc_06|READ            ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L516F,Y               ; 4
    sta    ram_90                ; 3
    lda    L516F+1,Y             ; 4
    sta    ram_91                ; 3
    lda    sc_06|READ            ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L516F,Y               ; 4
    sta    ram_88                ; 3
    lda    L516F+1,Y             ; 4
    sta    ram_89                ; 3
    ldy    #$00                  ; 2
L5247:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_8C),Y            ; 5
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    (ram_8E),Y            ; 5
    tax                          ; 2
    lda    (ram_90),Y            ; 5
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    (ram_88),Y            ; 5
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    iny                          ; 2
    cpy    #$07                  ; 2
    bne    L5247                 ; 2³
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$05                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    sc_7D|READ            ; 4
    cmp    #$0A                  ; 2
    bne    L527E                 ; 2³
    lda    #$00                  ; 2
    sta    sc_7D                 ; 4
    jmp    L5F6C                 ; 3

L527E:
    ldx    ram_92                ; 3
    stx    COLUP0                ; 3
    ldx    #$94                  ; 2
    stx    COLUPF                ; 3
    jsr    L5BEA                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$49                  ; 2
    lda    L5737,X               ; 4
    sta    HMP1                  ; 3
    ldx    #$01                  ; 2
    jsr    L56CF                 ; 6
    ldx    #$00                  ; 2
    stx    ram_97                ; 3
    lda    ram_9C,X              ; 4
    tax                          ; 2
    sta    HMCLR                 ; 3
    lda    L567E,X               ; 4
    sta    COLUP1                ; 3
    ldx    #$49                  ; 2
    lda    L5737,X               ; 4
    sta    HMP0                  ; 3
    ldx    #$00                  ; 2
    jsr    L56CF                 ; 6
    ldx    #$27                  ; 2
    ldy    ram_9A                ; 3
    lda    L5322,Y               ; 4
    sta    GRP0                  ; 3
    iny                          ; 2
L52BB:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    L5322,Y               ; 4
    sta    GRP0                  ; 3
    lda    L52F9,X               ; 4
    sta    GRP1                  ; 3
    stx    ram_B6                ; 3
    ldx    ram_97                ; 3
    lda    ram_9C,X              ; 4
    tax                          ; 2
    lda    L567E,X               ; 4
    sta    COLUP1                ; 3
    dec    ram_96                ; 5
    bne    L52DD                 ; 2³
    inc    ram_97                ; 5
    lda    #$08                  ; 2
    sta    ram_96                ; 3
L52DD:
    ldx    ram_B6                ; 3
    iny                          ; 2
    dex                          ; 2
    bpl    L52BB                 ; 2³
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    jsr    L5BEA                 ; 6
    jsr    L5C0C                 ; 6
    ldx    #$18                  ; 2
L52F1:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    L52F1                 ; 2³
    jmp    L5F6C                 ; 3

L52F9:
    .byte $00 ; |        | $52F9
    .byte $00 ; |        | $52FA
    .byte $32 ; |  XX  X | $52FB
    .byte $55 ; | X X X X| $52FC
    .byte $55 ; | X X X X| $52FD
    .byte $45 ; | X   X X| $52FE
    .byte $45 ; | X   X X| $52FF
    .byte $32 ; |  XX  X | $5300
    .byte $00 ; |        | $5301
    .byte $00 ; |        | $5302
    .byte $20 ; |  X     | $5303
    .byte $20 ; |  X     | $5304
    .byte $38 ; |  XXX   | $5305
    .byte $20 ; |  X     | $5306
    .byte $20 ; |  X     | $5307
    .byte $3C ; |  XXXX  | $5308
    .byte $00 ; |        | $5309
    .byte $00 ; |        | $530A
    .byte $24 ; |  X  X  | $530B
    .byte $24 ; |  X  X  | $530C
    .byte $3C ; |  XXXX  | $530D
    .byte $24 ; |  X  X  | $530E
    .byte $24 ; |  X  X  | $530F
    .byte $18 ; |   XX   | $5310
    .byte $00 ; |        | $5311
    .byte $00 ; |        | $5312
    .byte $10 ; |   X    | $5313
    .byte $10 ; |   X    | $5314
    .byte $10 ; |   X    | $5315
    .byte $10 ; |   X    | $5316
    .byte $10 ; |   X    | $5317
    .byte $7C ; | XXXXX  | $5318
    .byte $00 ; |        | $5319
    .byte $00 ; |        | $531A
    .byte $3C ; |  XXXX  | $531B
    .byte $20 ; |  X     | $531C
    .byte $20 ; |  X     | $531D
    .byte $38 ; |  XXX   | $531E
    .byte $20 ; |  X     | $531F
    .byte $3C ; |  XXXX  | $5320
    .byte $00 ; |        | $5321
L5322:
    .byte $00 ; |        | $5322
    .byte $00 ; |        | $5323
    .byte $00 ; |        | $5324
    .byte $00 ; |        | $5325
    .byte $00 ; |        | $5326
    .byte $00 ; |        | $5327
    .byte $00 ; |        | $5328
    .byte $00 ; |        | $5329
    .byte $00 ; |        | $532A
    .byte $00 ; |        | $532B
    .byte $00 ; |        | $532C
    .byte $00 ; |        | $532D
    .byte $00 ; |        | $532E
    .byte $00 ; |        | $532F
    .byte $00 ; |        | $5330
    .byte $00 ; |        | $5331
    .byte $00 ; |        | $5332
    .byte $00 ; |        | $5333
    .byte $00 ; |        | $5334
    .byte $00 ; |        | $5335
    .byte $00 ; |        | $5336
    .byte $00 ; |        | $5337
    .byte $00 ; |        | $5338
    .byte $00 ; |        | $5339
    .byte $00 ; |        | $533A
    .byte $00 ; |        | $533B
    .byte $00 ; |        | $533C
    .byte $00 ; |        | $533D
    .byte $00 ; |        | $533E
    .byte $00 ; |        | $533F
    .byte $00 ; |        | $5340
    .byte $00 ; |        | $5341
    .byte $FF ; |XXXXXXXX| $5342
    .byte $81 ; |X      X| $5343
    .byte $81 ; |X      X| $5344
    .byte $81 ; |X      X| $5345
    .byte $81 ; |X      X| $5346
    .byte $81 ; |X      X| $5347
    .byte $81 ; |X      X| $5348
    .byte $FF ; |XXXXXXXX| $5349
    .byte $00 ; |        | $534A
    .byte $00 ; |        | $534B
    .byte $00 ; |        | $534C
    .byte $00 ; |        | $534D
    .byte $00 ; |        | $534E
    .byte $00 ; |        | $534F
    .byte $00 ; |        | $5350
    .byte $00 ; |        | $5351
    .byte $00 ; |        | $5352
    .byte $00 ; |        | $5353
    .byte $00 ; |        | $5354
    .byte $00 ; |        | $5355
    .byte $00 ; |        | $5356
    .byte $00 ; |        | $5357
    .byte $00 ; |        | $5358
    .byte $00 ; |        | $5359
    .byte $00 ; |        | $535A
    .byte $00 ; |        | $535B
    .byte $00 ; |        | $535C
    .byte $00 ; |        | $535D
    .byte $00 ; |        | $535E
    .byte $00 ; |        | $535F
    .byte $00 ; |        | $5360
    .byte $00 ; |        | $5361
    .byte $00 ; |        | $5362
    .byte $00 ; |        | $5363
    .byte $00 ; |        | $5364
    .byte $00 ; |        | $5365
    .byte $00 ; |        | $5366
    .byte $00 ; |        | $5367
    .byte $00 ; |        | $5368
    .byte $00 ; |        | $5369
    .byte $00 ; |        | $536A
    .byte $00 ; |        | $536B
    .byte $00 ; |        | $536C
    .byte $00 ; |        | $536D
    .byte $00 ; |        | $536E
    .byte $00 ; |        | $536F
    .byte $00 ; |        | $5370
    .byte $00 ; |        | $5371
L5372:
    .byte $86 ; |X    XX | $5372
    .byte $86 ; |X    XX | $5373
    .byte $AA ; |X X X X | $5374
    .byte $84 ; |X    X  | $5375
    .byte $00 ; |        | $5376
L5377:
    .byte $2E ; |  X XXX | $5377
    .byte $0C ; |    XX  | $5378
    .byte $4F ; | X  XXXX| $5379
    .byte $41 ; | X     X| $537A
    .byte $28 ; |  X X   | $537B

L537C:
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    COLUBK                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ENABL                 ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    #$03                  ; 2
    sta    VDELP1                ; 3
    sta    VDELP0                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    HMCLR                 ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$34                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    lda    sc_00|READ            ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L5115,Y               ; 4
    sta    ram_8C                ; 3
    lda    L5115+1,Y             ; 4
    sta    ram_8D                ; 3
    lda    sc_00|READ            ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L5115,Y               ; 4
    sta    ram_8E                ; 3
    lda    L5115+1,Y             ; 4
    sta    ram_8F                ; 3
    lda    sc_01|READ            ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L5115,Y               ; 4
    sta    ram_90                ; 3
    lda    L5115+1,Y             ; 4
    sta    ram_91                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    sc_01|READ            ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L5115+1,Y             ; 4
    sta    ram_89                ; 3
    lda    L5115,Y               ; 4
    sta    ram_88                ; 3
    lda    sc_02|READ            ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L5115,Y               ; 4
    sta    ram_86                ; 3
    lda    L5115+1,Y             ; 4
    sta    ram_87                ; 3
    lda    sc_02|READ            ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L5115,Y               ; 4
    sta    ram_82                ; 3
    lda    L5115+1,Y             ; 4
    sta    ram_83                ; 3
    ldx    #$06                  ; 2
    stx    ram_8B                ; 3
    jsr    L5434                 ; 6
    lda    #$00                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    jmp    L5D2B                 ; 3

L5434:
    ldy    ram_8B                ; 3
    lda    (ram_86),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    ram_85                ; 3
    lda    (ram_88),Y            ; 5
    tax                          ; 2
    lda    (ram_8C),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_8E),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_90),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_82),Y            ; 5
    ldy    ram_85                ; 3
    stx    GRP1                  ; 3
    sty    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_8B                ; 5
    bpl    L5434                 ; 2³
    rts                          ; 6

L545C:
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    COLUBK                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ENABL                 ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    #$03                  ; 2
    sta    VDELP1                ; 3
    sta    VDELP0                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    HMCLR                 ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    lda    sc_03|READ            ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L5115,Y               ; 4
    sta    ram_8C                ; 3
    lda    L5115+1,Y             ; 4
    sta    ram_8D                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    sc_04|READ            ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L5115,Y               ; 4
    sta    ram_8E                ; 3
    lda    L5115+1,Y             ; 4
    sta    ram_8F                ; 3
    lda    sc_04|READ            ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L5115,Y               ; 4
    sta    ram_90                ; 3
    lda    L5115+1,Y             ; 4
    sta    ram_91                ; 3
    lda    #$69                  ; 2
    sta    ram_88                ; 3
    lda    #$70                  ; 2
    sta    ram_86                ; 3
    lda    #$77                  ; 2
    sta    ram_82                ; 3
    lda    #$56                  ; 2
    sta    ram_89                ; 3
    lda    #$56                  ; 2
    sta    ram_87                ; 3
    lda    #$56                  ; 2
    sta    ram_83                ; 3
    sta    HMCLR                 ; 3
    ldx    #$06                  ; 2
    stx    ram_8B                ; 3
    ldx    #$C6                  ; 2
    stx    COLUP0                ; 3
    stx    COLUP1                ; 3
    jsr    L5434                 ; 6
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    #$27                  ; 2
    sta    NUSIZ1                ; 3
    lda    #$20                  ; 2
    sta    NUSIZ0                ; 3
    lda    #$14                  ; 2
    sta    sc_08                 ; 4
    lda    sc_4B|READ            ; 4
    bmi    L5519                 ; 2³
    bit    ram_D9                ; 3
    bmi    L5519                 ; 2³
    lda    ram_CB                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_83                ; 3
    lda    #$0E                  ; 2
    sec                          ; 2
    sbc    ram_83                ; 3
    sta    sc_08                 ; 4
L5519:
    lda    #$0A                  ; 2
    bit    sc_4B|READ            ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    bmi    L554B                 ; 2³
    bit    ram_D9                ; 3
    bmi    L554B                 ; 2³
    lda    ram_84                ; 3
    cmp    ram_CD                ; 3
    bcs    L553E                 ; 2³
    lda    ram_CD                ; 3
    sec                          ; 2
    sbc    ram_84                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_82                ; 3
    lda    #$21                  ; 2
    clc                          ; 2
    adc    ram_82                ; 3
    jmp    L554B                 ; 3

L553E:
    sec                          ; 2
    sbc    ram_CD                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_82                ; 3
    lda    #$21                  ; 2
    sec                          ; 2
    sbc    ram_82                ; 3
L554B:
    sta    ram_82                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    HMM0                  ; 3
    sta    HMM1                  ; 3
    lda    #$94                  ; 2
    sta    COLUPF                ; 3
    ldy    #$00                  ; 2
    lda    sc_30|READ,Y          ; 4
    tay                          ; 2
    lda    L569C                 ; 4
    sta    COLUP1                ; 3
    sta    RESBL                 ; 3
    sta    RESM0                 ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    RESP0                 ; 3
    lda    bulletStatus|READ     ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    RESP1                 ; 3
    clc                          ; 2
    adc    #$08                  ; 2
    sta    ram_87                ; 3
    lda    #$0C                  ; 2
    sta    COLUP0                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    GRP1                  ; 3
    lda    fuelStatus|READ       ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_86                ; 3
    lda    engineStatus|READ     ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    ldx    ram_82                ; 3
    lda    L5737,X               ; 4
    sta    HMM0                  ; 3
    ldx    #$02                  ; 2
    jsr    L56CF                 ; 6
    ldx    #$0D                  ; 2
    ldy    #$00                  ; 2
    lda    #$01                  ; 2
    sta    ram_8B                ; 3
L55A9:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    cpx    sc_08|READ            ; 4
    bne    L55B4                 ; 2³
    lda    #$02                  ; 2
L55B4:
    sta    ENAM0                 ; 3
    lda    L56A0,X               ; 4
    sta    ENABL                 ; 3
    cpx    ram_87                ; 3
    bcs    L55C3                 ; 2³
    lda    #$A4                  ; 2
    sta    COLUP0                ; 3
L55C3:
    lda    L568E,X               ; 4
    sta    GRP0                  ; 3
    dec    ram_8B                ; 5
    bpl    L55E1                 ; 2³
    lda    #$04                  ; 2
    sta    ram_8B                ; 3
    lda    #$00                  ; 2
    sta    GRP1                  ; 3
    iny                          ; 2
    lda    L569C,Y               ; 4
    sta    COLUP1                ; 3
    dex                          ; 2
    cpx    #$06                  ; 2
    bne    L55A9                 ; 2³
    beq    L55EB                 ; 3   always branch

L55E1:
    lda    sc_30|READ,Y          ; 4
    sta    GRP1                  ; 3
    dex                          ; 2
    cpx    #$06                  ; 2
    bne    L55A9                 ; 2³
L55EB:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    cpx    sc_08|READ            ; 4
    bne    L55F8                 ; 2³
    lda    #$02                  ; 2
L55F8:
    sta    ENAM0                 ; 3
    dec    ram_8B                ; 5
    bpl    L560E                 ; 2³+1
    lda    #$04                  ; 2
    sta    ram_8B                ; 3
    lda    #$00                  ; 2
    sta    GRP1                  ; 3
    iny                          ; 2
    lda    L569C,Y               ; 4
    sta    COLUP1                ; 3
    bne    L5613                 ; 3   always branch?

L560E:
    lda    sc_30|READ,Y          ; 4
    sta    GRP1                  ; 3
L5613:
    dex                          ; 2
    lda    #$88                  ; 2
    sta    COLUP0                ; 3
L5618:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    ENABL                 ; 3
    cpx    sc_08|READ            ; 4
    bne    L5625                 ; 2³
    lda    #$02                  ; 2
L5625:
    sta    ENAM0                 ; 3
    lda    L568E,X               ; 4
    cpx    ram_86                ; 3
    bcs    L5630                 ; 2³
    ora    #$E0                  ; 2
L5630:
    sta    GRP0                  ; 3
    dec    ram_8B                ; 5
    bpl    L5649                 ; 2³
    lda    #$04                  ; 2
    sta    ram_8B                ; 3
    lda    #$00                  ; 2
    sta    GRP1                  ; 3
    iny                          ; 2
    lda    L569C,Y               ; 4
    sta    COLUP1                ; 3
    dex                          ; 2
    bpl    L5618                 ; 2³
    bmi    L5651                 ; 3   always branch

L5649:
    lda    sc_30|READ,Y          ; 4
    sta    GRP1                  ; 3
    dex                          ; 2
    bpl    L5618                 ; 2³
L5651:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$01                  ; 2
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    ENAM0                 ; 3
L565B:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    ENAM0                 ; 3
    dex                          ; 2
    bpl    L565B                 ; 2³
    sta    GRP1                  ; 3
    jmp    L5F68                 ; 3

    .byte $00 ; |        | $5669
    .byte $89 ; |X   X  X| $566A
    .byte $89 ; |X   X  X| $566B
    .byte $A9 ; |X X X  X| $566C
    .byte $A9 ; |X X X  X| $566D
    .byte $D9 ; |XX XX  X| $566E
    .byte $00 ; |        | $566F
    .byte $00 ; |        | $5670
    .byte $09 ; |    X  X| $5671
    .byte $09 ; |    X  X| $5672
    .byte $CF ; |XX  XXXX| $5673
    .byte $49 ; | X  X  X| $5674
    .byte $C9 ; |XX  X  X| $5675
    .byte $00 ; |        | $5676
    .byte $00 ; |        | $5677
    .byte $00 ; |        | $5678
    .byte $00 ; |        | $5679
    .byte $00 ; |        | $567A
    .byte $00 ; |        | $567B
    .byte $00 ; |        | $567C
    .byte $00 ; |        | $567D
L567E:
    .byte $44 ; | X   X  | $567E
    .byte $48 ; | X  X   | $567F
    .byte $18 ; |   XX   | $5680
    .byte $1A ; |   XX X | $5681
    .byte $C8 ; |XX  X   | $5682
    .byte $C6 ; |XX   XX | $5683
    .byte $C4 ; |XX   X  | $5684
    .byte $B4 ; |X XX X  | $5685
    .byte $B4 ; |X XX X  | $5686
    .byte $B4 ; |X XX X  | $5687
    .byte $B4 ; |X XX X  | $5688
    .byte $B4 ; |X XX X  | $5689
    .byte $B6 ; |X XX XX | $568A
    .byte $B6 ; |X XX XX | $568B
    .byte $B6 ; |X XX XX | $568C
    .byte $B6 ; |X XX XX | $568D
L568E:
    .byte $E8 ; |XXX X   | $568E
    .byte $08 ; |    X   | $568F
    .byte $0C ; |    XX  | $5690
    .byte $08 ; |    X   | $5691
    .byte $0E ; |    XXX | $5692
    .byte $E0 ; |XXX     | $5693
    .byte $00 ; |        | $5694
    .byte $1C ; |   XXX  | $5695
    .byte $14 ; |   X X  | $5696
    .byte $14 ; |   X X  | $5697
    .byte $14 ; |   X X  | $5698
    .byte $36 ; |  XX XX | $5699
    .byte $1C ; |   XXX  | $569A
    .byte $08 ; |    X   | $569B
L569C:
    .byte $46 ; | X   XX | $569C
    .byte $86 ; |X    XX | $569D
    .byte $18 ; |   XX   | $569E
    .byte $C6 ; |XX   XX | $569F
L56A0:
    .byte $00 ; |        | $56A0
    .byte $00 ; |        | $56A1
    .byte $00 ; |        | $56A2
    .byte $00 ; |        | $56A3
    .byte $00 ; |        | $56A4
    .byte $00 ; |        | $56A5
    .byte $00 ; |        | $56A6
    .byte $00 ; |        | $56A7
    .byte $00 ; |        | $56A8
    .byte $00 ; |        | $56A9
    .byte $02 ; |      X | $56AA
    .byte $00 ; |        | $56AB
    .byte $00 ; |        | $56AC
    .byte $00 ; |        | $56AD
    .byte $00 ; |        | $56AE
L56AF:
    .byte $00 ; |        | $56AF
    .byte $C3 ; |XX    XX| $56B0
    .byte $C3 ; |XX    XX| $56B1
    .byte $DB ; |XX XX XX| $56B2
    .byte $FF ; |XXXXXXXX| $56B3
    .byte $FF ; |XXXXXXXX| $56B4
    .byte $E7 ; |XXX  XXX| $56B5
    .byte $E7 ; |XXX  XXX| $56B6
    .byte $FF ; |XXXXXXXX| $56B7
    .byte $FF ; |XXXXXXXX| $56B8
    .byte $FF ; |XXXXXXXX| $56B9
    .byte $FF ; |XXXXXXXX| $56BA
    .byte $C3 ; |XX    XX| $56BB
    .byte $66 ; | XX  XX | $56BC
    .byte $24 ; |  X  X  | $56BD
    .byte $18 ; |   XX   | $56BE
L56BF:
    .byte $00 ; |        | $56BF
    .byte $00 ; |        | $56C0
    .byte $00 ; |        | $56C1
    .byte $00 ; |        | $56C2
    .byte $84 ; |X    X  | $56C3
    .byte $86 ; |X    XX | $56C4
    .byte $84 ; |X    X  | $56C5
    .byte $84 ; |X    X  | $56C6
    .byte $00 ; |        | $56C7
    .byte $80 ; |X       | $56C8
    .byte $86 ; |X    XX | $56C9
    .byte $88 ; |X   X   | $56CA
    .byte $94 ; |X  X X  | $56CB
    .byte $8A ; |X   X X | $56CC
    .byte $0F ; |    XXXX| $56CD
    .byte $0F ; |    XXXX| $56CE

L56CF:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    WASTE_4_CYCLES        ; 4
    ldy    WASTE_4_CYCLES        ; 4
    nop                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
L56DB:
    dey                          ; 2
    bpl    L56DB                 ; 2³
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

L56E5:
    ldy    #$00                  ; 2
    sty    ram_DB                ; 3
    lda    armorStatus|READ      ; 4
    and    #$FE                  ; 2
    beq    L56FC                 ; 2³
    lda    engineStatus|READ     ; 4
    and    #$FE                  ; 2
    beq    L56FC                 ; 2³
    ldx    tireStatus|READ       ; 4
    bne    L570A                 ; 2³+1
L56FC:
    lda    ram_94                ; 3
    lsr                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    lda    #$01                  ; 2
    sta    ram_DB                ; 3
    lda    #$60                  ; 2
    sta    ram_CB                ; 3
L570A:
    tya                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L5CEB,Y               ; 4
    sta    ram_82                ; 3
    lda    L5CEB+1,Y             ; 4
    sta    ram_83                ; 3
    lda    L5D0B,Y               ; 4
    sta    ram_86                ; 3
    lda    L5D0B+1,Y             ; 4
    sta    ram_87                ; 3
    lda    ram_D2                ; 3
    beq    L5734                 ; 2³
    ldy    #$0F                  ; 2
L5727:
    lda    (ram_82),Y            ; 5
    sta    sc_0F,Y               ; 5
    lda    (ram_86),Y            ; 5
    sta    sc_1F,Y               ; 5
    dey                          ; 2
    bpl    L5727                 ; 2³
L5734:
    jmp    L5F68                 ; 3

L5737:
    .byte $9A ; |X  XX X | $5737
    .byte $20 ; |  X     | $5738
    .byte $10 ; |   X    | $5739
    .byte $00 ; |        | $573A
    .byte $F0 ; |XXXX    | $573B
    .byte $E0 ; |XXX     | $573C
    .byte $D0 ; |XX X    | $573D
    .byte $C0 ; |XX      | $573E
    .byte $B0 ; |X XX    | $573F
    .byte $A0 ; |X X     | $5740
    .byte $90 ; |X  X    | $5741
    .byte $71 ; | XXX   X| $5742
    .byte $61 ; | XX    X| $5743
    .byte $51 ; | X X   X| $5744
    .byte $41 ; | X     X| $5745
    .byte $31 ; |  XX   X| $5746
    .byte $21 ; |  X    X| $5747
    .byte $11 ; |   X   X| $5748
    .byte $01 ; |       X| $5749
    .byte $F1 ; |XXXX   X| $574A
    .byte $E1 ; |XXX    X| $574B
    .byte $D1 ; |XX X   X| $574C
    .byte $C1 ; |XX     X| $574D
    .byte $B1 ; |X XX   X| $574E
    .byte $A1 ; |X X    X| $574F
    .byte $91 ; |X  X   X| $5750
    .byte $72 ; | XXX  X | $5751
    .byte $62 ; | XX   X | $5752
    .byte $52 ; | X X  X | $5753
    .byte $42 ; | X    X | $5754
    .byte $32 ; |  XX  X | $5755
    .byte $22 ; |  X   X | $5756
    .byte $12 ; |   X  X | $5757
    .byte $02 ; |      X | $5758
    .byte $F2 ; |XXXX  X | $5759
    .byte $E2 ; |XXX   X | $575A
    .byte $D2 ; |XX X  X | $575B
    .byte $C2 ; |XX    X | $575C
    .byte $B2 ; |X XX  X | $575D
    .byte $A2 ; |X X   X | $575E
    .byte $92 ; |X  X  X | $575F
    .byte $73 ; | XXX  XX| $5760
    .byte $63 ; | XX   XX| $5761
    .byte $53 ; | X X  XX| $5762
    .byte $43 ; | X    XX| $5763
    .byte $33 ; |  XX  XX| $5764
    .byte $23 ; |  X   XX| $5765
    .byte $13 ; |   X  XX| $5766
    .byte $03 ; |      XX| $5767
    .byte $F3 ; |XXXX  XX| $5768
    .byte $E3 ; |XXX   XX| $5769
    .byte $D3 ; |XX X  XX| $576A
    .byte $C3 ; |XX    XX| $576B
    .byte $B3 ; |X XX  XX| $576C
    .byte $A3 ; |X X   XX| $576D
    .byte $93 ; |X  X  XX| $576E
    .byte $74 ; | XXX X  | $576F
    .byte $64 ; | XX  X  | $5770
    .byte $54 ; | X X X  | $5771
    .byte $44 ; | X   X  | $5772
    .byte $34 ; |  XX X  | $5773
    .byte $24 ; |  X  X  | $5774
    .byte $14 ; |   X X  | $5775
    .byte $04 ; |     X  | $5776
    .byte $F4 ; |XXXX X  | $5777
    .byte $E4 ; |XXX  X  | $5778
    .byte $D4 ; |XX X X  | $5779
    .byte $C4 ; |XX   X  | $577A
    .byte $B4 ; |X XX X  | $577B
    .byte $A4 ; |X X  X  | $577C
    .byte $94 ; |X  X X  | $577D
    .byte $75 ; | XXX X X| $577E
    .byte $65 ; | XX  X X| $577F
    .byte $55 ; | X X X X| $5780
    .byte $45 ; | X   X X| $5781
    .byte $35 ; |  XX X X| $5782
    .byte $25 ; |  X  X X| $5783
    .byte $15 ; |   X X X| $5784
    .byte $05 ; |     X X| $5785
    .byte $F5 ; |XXXX X X| $5786
    .byte $E5 ; |XXX  X X| $5787
    .byte $D5 ; |XX X X X| $5788
    .byte $C5 ; |XX   X X| $5789
    .byte $B5 ; |X XX X X| $578A
    .byte $A5 ; |X X  X X| $578B
    .byte $95 ; |X  X X X| $578C
    .byte $76 ; | XXX XX | $578D
    .byte $66 ; | XX  XX | $578E
    .byte $56 ; | X X XX | $578F
    .byte $46 ; | X   XX | $5790
    .byte $36 ; |  XX XX | $5791
    .byte $26 ; |  X  XX | $5792
    .byte $16 ; |   X XX | $5793
    .byte $06 ; |     XX | $5794
    .byte $F6 ; |XXXX XX | $5795
    .byte $E6 ; |XXX  XX | $5796
    .byte $D6 ; |XX X XX | $5797
    .byte $C6 ; |XX   XX | $5798
    .byte $B6 ; |X XX XX | $5799
    .byte $A6 ; |X X  XX | $579A
    .byte $96 ; |X  X XX | $579B
    .byte $77 ; | XXX XXX| $579C
    .byte $67 ; | XX  XXX| $579D
    .byte $57 ; | X X XXX| $579E
    .byte $47 ; | X   XXX| $579F
    .byte $37 ; |  XX XXX| $57A0
    .byte $27 ; |  X  XXX| $57A1
    .byte $17 ; |   X XXX| $57A2
    .byte $07 ; |     XXX| $57A3
    .byte $F7 ; |XXXX XXX| $57A4
    .byte $E7 ; |XXX  XXX| $57A5
    .byte $D7 ; |XX X XXX| $57A6
    .byte $C7 ; |XX   XXX| $57A7
    .byte $B7 ; |X XX XXX| $57A8
    .byte $A7 ; |X X  XXX| $57A9
    .byte $97 ; |X  X XXX| $57AA
    .byte $78 ; | XXXX   | $57AB
    .byte $68 ; | XX X   | $57AC
    .byte $58 ; | X XX   | $57AD
    .byte $48 ; | X  X   | $57AE
    .byte $38 ; |  XXX   | $57AF
    .byte $28 ; |  X X   | $57B0
    .byte $18 ; |   XX   | $57B1
    .byte $08 ; |    X   | $57B2
    .byte $F8 ; |XXXXX   | $57B3
    .byte $E8 ; |XXX X   | $57B4
    .byte $D8 ; |XX XX   | $57B5
    .byte $C8 ; |XX  X   | $57B6
    .byte $B8 ; |X XXX   | $57B7
    .byte $A8 ; |X X X   | $57B8
    .byte $98 ; |X  XX   | $57B9
    .byte $79 ; | XXXX  X| $57BA
    .byte $69 ; | XX X  X| $57BB
    .byte $59 ; | X XX  X| $57BC
    .byte $49 ; | X  X  X| $57BD
    .byte $39 ; |  XXX  X| $57BE
    .byte $29 ; |  X X  X| $57BF
    .byte $19 ; |   XX  X| $57C0
    .byte $09 ; |    X  X| $57C1
    .byte $F9 ; |XXXXX  X| $57C2
    .byte $E9 ; |XXX X  X| $57C3
    .byte $D9 ; |XX XX  X| $57C4
    .byte $C9 ; |XX  X  X| $57C5
    .byte $B9 ; |X XXX  X| $57C6
    .byte $A9 ; |X X X  X| $57C7
    .byte $99 ; |X  XX  X| $57C8
    .byte $7A ; | XXXX X | $57C9
    .byte $6A ; | XX X X | $57CA
    .byte $5A ; | X XX X | $57CB
    .byte $4A ; | X  X X | $57CC
    .byte $3A ; |  XXX X | $57CD
    .byte $2A ; |  X X X | $57CE
    .byte $1A ; |   XX X | $57CF
    .byte $0A ; |    X X | $57D0
    .byte $FA ; |XXXXX X | $57D1
    .byte $EA ; |XXX X X | $57D2
    .byte $DA ; |XX XX X | $57D3
    .byte $CA ; |XX  X X | $57D4
    .byte $BA ; |X XXX X | $57D5
    .byte $AA ; |X X X X | $57D6
    .byte $9A ; |X  XX X | $57D7
    .byte $8A ; |X   X X | $57D8
    .byte $00 ; |        | $57D9

L57DA:
    lda    ram_8A                ; 3
    clc                          ; 2
    adc    #$19                  ; 2
    sta    ram_8E                ; 3
    lda    #$9A                  ; 2
    sta    ram_8B                ; 3
    ldx    ram_95                ; 3
    lda    L5737,X               ; 4
    sta    HMP0                  ; 3
    ldx    #$00                  ; 2
    stx    VDELP0                ; 3
    jsr    L56CF                 ; 6
    ldy    sc_2F|READ            ; 4
    lda    ram_95                ; 3
    clc                          ; 2
    adc    L58ED,Y               ; 4
    cmp    #$A0                  ; 2
    bcc    L5802                 ; 2³
    sbc    #$A0                  ; 2
L5802:
    tax                          ; 2
    sta    HMCLR                 ; 3
    lda    L5737,X               ; 4
    sta    HMP1                  ; 3
    ldx    #$01                  ; 2
    jsr    L56CF                 ; 6
    ldy    sc_2F|READ            ; 4
    lda    ram_95                ; 3
    clc                          ; 2
    adc    L5377,Y               ; 4
    cmp    #$A0                  ; 2
    bcc    L581E                 ; 2³
    sbc    #$A0                  ; 2
L581E:
    tax                          ; 2
    sta    HMCLR                 ; 3
    lda    L5737,X               ; 4
    sta    HMM1                  ; 3
    ldx    #$03                  ; 2
    jsr    L56CF                 ; 6
    ldy    sc_2F|READ            ; 4
    lda    L5372,Y               ; 4
    sta    COLUBK                ; 3
    ldx    ram_8B                ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    HMCLR                 ; 3
L583B:
    dex                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    cpx    ram_8E                ; 3
    bne    L583B                 ; 2³
    ldy    sc_2F|READ            ; 4
    lda    L58FC,Y               ; 4
    sta    NUSIZ1                ; 3
    lda    L5901,Y               ; 4
    sta    NUSIZ0                ; 3
    lda    L58F2,Y               ; 4
    sta    COLUP1                ; 3
    lda    L58F7,Y               ; 4
    sta    COLUP0                ; 3
    tya                          ; 2
    asl                          ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    L590B,Y               ; 4
    sta    ram_8E                ; 3
    lda    L590B+1,Y             ; 4
    sta    ram_8F                ; 3
    lda    L5915,Y               ; 4
    sta    ram_90                ; 3
    lda    L5915+1,Y             ; 4
    sta    ram_91                ; 3
    lda    L591F,Y               ; 4
    sta    ram_88                ; 3
    lda    L591F+1,Y             ; 4
    sta    ram_89                ; 3
    lda    L5929,Y               ; 4
    sta    ram_86                ; 3
    lda    L5929+1,Y             ; 4
    sta    ram_87                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    bonusStatus|READ      ; 4
    clc                          ; 2
    adc    #$0E                  ; 2
    cmp    #$19                  ; 2
    bcs    L589A                 ; 2³
    lda    #$18                  ; 2
L589A:
    sta    ram_82                ; 3
    tay                          ; 2
    lda    (ram_86),Y            ; 5
    ldy    #$18                  ; 2
L58A1:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUBK                ; 3
    lda    (ram_8E),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_90),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_88),Y            ; 5
    sta    HMM1                  ; 3
    and    #$0F                  ; 2
    sta    ENAM1                 ; 3
    dec    ram_82                ; 5
    sty    ram_83                ; 3
    ldy    ram_82                ; 3
    lda    (ram_86),Y            ; 5
    ldy    ram_83                ; 3
    dey                          ; 2
    bpl    L58A1                 ; 2³
    sta    HMCLR                 ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    sc_2F|READ            ; 4
    lda    L5906,Y               ; 4
    sta    COLUBK                ; 3
    lda    #$00                  ; 2
    sta    ENAM1                 ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    ldx    ram_8A                ; 3
    stx    ram_8B                ; 3
    lda    #$27                  ; 2
    sta    NUSIZ0                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    L5D2B                 ; 3

L58ED:
    .byte $26 ; |  X  XX | $58ED
    .byte $06 ; |     XX | $58EE
    .byte $00 ; |        | $58EF
    .byte $41 ; | X     X| $58F0
    .byte $14 ; |   X X  | $58F1
L58F2:
    .byte $24 ; |  X  X  | $58F2
    .byte $E6 ; |XXX  XX | $58F3
    .byte $24 ; |  X  X  | $58F4
    .byte $F4 ; |XXXX X  | $58F5   COL_MOUNTAIN   LV 1
    .byte $0F ; |    XXXX| $58F6
L58F7:
    .byte $24 ; |  X  X  | $58F7
    .byte $E8 ; |XXX X   | $58F8
    .byte $C6 ; |XX   XX | $58F9
    .byte $D6 ; |XX X XX | $58FA   COL_CACTUS   LV 1
    .byte $1E ; |   XXXX | $58FB
L58FC:
    .byte $3E ; |  XXXXX | $58FC
    .byte $3E ; |  XXXXX | $58FD
    .byte $1E ; |   XXXX | $58FE
    .byte $3F ; |  XXXXXX| $58FF
    .byte $06 ; |     XX | $5900
L5901:
    .byte $3F ; |  XXXXXX| $5901
    .byte $3E ; |  XXXXX | $5902
    .byte $3E ; |  XXXXX | $5903
    .byte $3E ; |  XXXXX | $5904
    .byte $00 ; |        | $5905
L5906:
    .byte $24 ; |  X  X  | $5906
    .byte $E6 ; |XXX  XX | $5907
    .byte $B6 ; |X XX XX | $5908
    .byte $F4 ; |XXXX X  | $5909
    .byte $62 ; | XX   X | $590A

L590B:
    .word L5933          ; $590B
    .word L594F          ; $590D
    .word TreeGfx        ; $590F
    .word CactusGfx      ; $5911
    .word L59A3          ; $5913
L5915:
    .word L59BF          ; $5915
    .word L59DB          ; $5917
    .word L59F7          ; $5919
    .word L5A13          ; $591B
    .word L5A2F          ; $591D
L591F:
    .word L5A4B          ; $591F
    .word L5A67          ; $5921
    .word L5A83          ; $5923
    .word L5A9F          ; $5925
    .word L5ABB          ; $5927
L5929:
    .word L5AD7          ; $5929
    .word L5B0E          ; $592B
    .word L5B45          ; $592D
    .word L5B7C          ; $592F
    .word L5BB3          ; $5931

L5933:
    .byte $FF ; |XXXXXXXX| $5933
    .byte $FF ; |XXXXXXXX| $5934
    .byte $FE ; |XXXXXXX | $5935
    .byte $7C ; | XXXXX  | $5936
    .byte $7C ; | XXXXX  | $5937
    .byte $38 ; |  XXX   | $5938
    .byte $30 ; |  XX    | $5939
    .byte $00 ; |        | $593A
    .byte $00 ; |        | $593B
    .byte $00 ; |        | $593C
    .byte $00 ; |        | $593D
    .byte $00 ; |        | $593E
    .byte $00 ; |        | $593F
    .byte $00 ; |        | $5940
    .byte $00 ; |        | $5941
    .byte $00 ; |        | $5942
    .byte $00 ; |        | $5943
    .byte $00 ; |        | $5944
    .byte $00 ; |        | $5945
    .byte $00 ; |        | $5946
    .byte $00 ; |        | $5947
    .byte $00 ; |        | $5948
    .byte $00 ; |        | $5949
    .byte $00 ; |        | $594A
    .byte $00 ; |        | $594B
    .byte $00 ; |        | $594C
    .byte $00 ; |        | $594D
    .byte $00 ; |        | $594E
L594F:
    .byte $FF ; |XXXXXXXX| $594F
    .byte $FF ; |XXXXXXXX| $5950
    .byte $FE ; |XXXXXXX | $5951
    .byte $7C ; | XXXXX  | $5952
    .byte $78 ; | XXXX   | $5953
    .byte $7C ; | XXXXX  | $5954
    .byte $1C ; |   XXX  | $5955
    .byte $1E ; |   XXXX | $5956
    .byte $1C ; |   XXX  | $5957
    .byte $0E ; |    XXX | $5958
    .byte $04 ; |     X  | $5959
    .byte $00 ; |        | $595A
    .byte $00 ; |        | $595B
    .byte $00 ; |        | $595C
    .byte $00 ; |        | $595D
    .byte $00 ; |        | $595E
    .byte $00 ; |        | $595F
    .byte $00 ; |        | $5960
    .byte $00 ; |        | $5961
    .byte $00 ; |        | $5962
    .byte $00 ; |        | $5963
    .byte $00 ; |        | $5964
    .byte $00 ; |        | $5965
    .byte $00 ; |        | $5966
    .byte $00 ; |        | $5967
    .byte $00 ; |        | $5968
    .byte $00 ; |        | $5969
    .byte $00 ; |        | $596A
TreeGfx:
    .byte $00 ; |        | $596B
    .byte $00 ; |        | $596C
    .byte $00 ; |        | $596D
    .byte $00 ; |        | $596E
    .byte $00 ; |        | $596F
    .byte $00 ; |        | $5970
    .byte $00 ; |        | $5971
    .byte $3C ; |  XXXX  | $5972
    .byte $5E ; | X XXXX | $5973
    .byte $7E ; | XXXXXX | $5974
    .byte $F7 ; |XXXX XXX| $5975
    .byte $DF ; |XX XXXXX| $5976
    .byte $7A ; | XXXX X | $5977
    .byte $7E ; | XXXXXX | $5978
    .byte $3C ; |  XXXX  | $5979
    .byte $18 ; |   XX   | $597A
    .byte $00 ; |        | $597B
    .byte $00 ; |        | $597C
    .byte $00 ; |        | $597D
    .byte $00 ; |        | $597E
    .byte $00 ; |        | $597F
    .byte $00 ; |        | $5980
    .byte $00 ; |        | $5981
    .byte $00 ; |        | $5982
    .byte $00 ; |        | $5983
    .byte $00 ; |        | $5984
    .byte $00 ; |        | $5985
    .byte $00 ; |        | $5986
CactusGfx:
    .byte $18 ; |   XX   | $5987
    .byte $18 ; |   XX   | $5988
    .byte $3C ; |  XXXX  | $5989
    .byte $5A ; | X XX X | $598A
    .byte $5A ; | X XX X | $598B
    .byte $58 ; | X XX   | $598C
    .byte $18 ; |   XX   | $598D
    .byte $10 ; |   X    | $598E
    .byte $00 ; |        | $598F
    .byte $00 ; |        | $5990
    .byte $00 ; |        | $5991
    .byte $00 ; |        | $5992
    .byte $00 ; |        | $5993
    .byte $00 ; |        | $5994
    .byte $00 ; |        | $5995
    .byte $00 ; |        | $5996
    .byte $00 ; |        | $5997
    .byte $00 ; |        | $5998
    .byte $00 ; |        | $5999
    .byte $00 ; |        | $599A
    .byte $00 ; |        | $599B
    .byte $00 ; |        | $599C
    .byte $00 ; |        | $599D
    .byte $00 ; |        | $599E
    .byte $00 ; |        | $599F
    .byte $00 ; |        | $59A0
    .byte $00 ; |        | $59A1
    .byte $00 ; |        | $59A2
L59A3:
    .byte $00 ; |        | $59A3
    .byte $00 ; |        | $59A4
    .byte $00 ; |        | $59A5
    .byte $00 ; |        | $59A6
    .byte $00 ; |        | $59A7
    .byte $01 ; |       X| $59A8
    .byte $00 ; |        | $59A9
    .byte $00 ; |        | $59AA
    .byte $00 ; |        | $59AB
    .byte $00 ; |        | $59AC
    .byte $00 ; |        | $59AD
    .byte $00 ; |        | $59AE
    .byte $00 ; |        | $59AF
    .byte $18 ; |   XX   | $59B0
    .byte $3C ; |  XXXX  | $59B1
    .byte $7E ; | XXXXXX | $59B2
    .byte $7E ; | XXXXXX | $59B3
    .byte $FF ; |XXXXXXXX| $59B4
    .byte $FF ; |XXXXXXXX| $59B5
    .byte $7E ; | XXXXXX | $59B6
    .byte $7E ; | XXXXXX | $59B7
    .byte $3C ; |  XXXX  | $59B8
    .byte $18 ; |   XX   | $59B9
    .byte $00 ; |        | $59BA
    .byte $00 ; |        | $59BB
    .byte $00 ; |        | $59BC
    .byte $00 ; |        | $59BD
    .byte $80 ; |X       | $59BE
L59BF:
    .byte $FF ; |XXXXXXXX| $59BF
    .byte $FF ; |XXXXXXXX| $59C0
    .byte $FF ; |XXXXXXXX| $59C1
    .byte $FF ; |XXXXXXXX| $59C2
    .byte $FF ; |XXXXXXXX| $59C3
    .byte $7F ; | XXXXXXX| $59C4
    .byte $7F ; | XXXXXXX| $59C5
    .byte $7F ; | XXXXXXX| $59C6
    .byte $7F ; | XXXXXXX| $59C7
    .byte $7C ; | XXXXX  | $59C8
    .byte $78 ; | XXXX   | $59C9
    .byte $38 ; |  XXX   | $59CA
    .byte $38 ; |  XXX   | $59CB
    .byte $30 ; |  XX    | $59CC
    .byte $10 ; |   X    | $59CD
    .byte $00 ; |        | $59CE
    .byte $00 ; |        | $59CF
    .byte $00 ; |        | $59D0
    .byte $00 ; |        | $59D1
    .byte $00 ; |        | $59D2
    .byte $00 ; |        | $59D3
    .byte $00 ; |        | $59D4
    .byte $00 ; |        | $59D5
    .byte $00 ; |        | $59D6
    .byte $00 ; |        | $59D7
    .byte $00 ; |        | $59D8
    .byte $00 ; |        | $59D9
    .byte $00 ; |        | $59DA
L59DB:
    .byte $FF ; |XXXXXXXX| $59DB
    .byte $FF ; |XXXXXXXX| $59DC
    .byte $FF ; |XXXXXXXX| $59DD
    .byte $FF ; |XXXXXXXX| $59DE
    .byte $FF ; |XXXXXXXX| $59DF
    .byte $FF ; |XXXXXXXX| $59E0
    .byte $FF ; |XXXXXXXX| $59E1
    .byte $FF ; |XXXXXXXX| $59E2
    .byte $7C ; | XXXXX  | $59E3
    .byte $78 ; | XXXX   | $59E4
    .byte $38 ; |  XXX   | $59E5
    .byte $30 ; |  XX    | $59E6
    .byte $10 ; |   X    | $59E7
    .byte $00 ; |        | $59E8
    .byte $00 ; |        | $59E9
    .byte $00 ; |        | $59EA
    .byte $00 ; |        | $59EB
    .byte $00 ; |        | $59EC
    .byte $00 ; |        | $59ED
    .byte $00 ; |        | $59EE
    .byte $00 ; |        | $59EF
    .byte $00 ; |        | $59F0
    .byte $00 ; |        | $59F1
    .byte $00 ; |        | $59F2
    .byte $00 ; |        | $59F3
    .byte $00 ; |        | $59F4
    .byte $00 ; |        | $59F5
    .byte $00 ; |        | $59F6
L59F7:
    .byte $3E ; |  XXXXX | $59F7
    .byte $1C ; |   XXX  | $59F8
    .byte $18 ; |   XX   | $59F9
    .byte $18 ; |   XX   | $59FA
    .byte $18 ; |   XX   | $59FB
    .byte $18 ; |   XX   | $59FC
    .byte $18 ; |   XX   | $59FD
    .byte $18 ; |   XX   | $59FE
    .byte $18 ; |   XX   | $59FF
    .byte $18 ; |   XX   | $5A00
    .byte $18 ; |   XX   | $5A01
    .byte $18 ; |   XX   | $5A02
    .byte $00 ; |        | $5A03
    .byte $00 ; |        | $5A04
    .byte $00 ; |        | $5A05
    .byte $00 ; |        | $5A06
    .byte $00 ; |        | $5A07
    .byte $00 ; |        | $5A08
    .byte $00 ; |        | $5A09
    .byte $00 ; |        | $5A0A
    .byte $00 ; |        | $5A0B
    .byte $00 ; |        | $5A0C
    .byte $00 ; |        | $5A0D
    .byte $00 ; |        | $5A0E
    .byte $00 ; |        | $5A0F
    .byte $00 ; |        | $5A10
    .byte $00 ; |        | $5A11
    .byte $00 ; |        | $5A12
L5A13:
    .byte $FF ; |XXXXXXXX| $5A13
    .byte $FF ; |XXXXXXXX| $5A14
    .byte $FF ; |XXXXXXXX| $5A15
    .byte $FE ; |XXXXXXX | $5A16
    .byte $FA ; |XXXXX X | $5A17
    .byte $FA ; |XXXXX X | $5A18
    .byte $F8 ; |XXXXX   | $5A19
    .byte $F0 ; |XXXX    | $5A1A
    .byte $F0 ; |XXXX    | $5A1B
    .byte $D0 ; |XX X    | $5A1C
    .byte $C0 ; |XX      | $5A1D
    .byte $C0 ; |XX      | $5A1E
    .byte $80 ; |X       | $5A1F
    .byte $80 ; |X       | $5A20
    .byte $00 ; |        | $5A21
    .byte $00 ; |        | $5A22
    .byte $00 ; |        | $5A23
    .byte $00 ; |        | $5A24
    .byte $00 ; |        | $5A25
    .byte $00 ; |        | $5A26
    .byte $00 ; |        | $5A27
    .byte $00 ; |        | $5A28
    .byte $00 ; |        | $5A29
    .byte $00 ; |        | $5A2A
    .byte $00 ; |        | $5A2B
    .byte $00 ; |        | $5A2C
    .byte $00 ; |        | $5A2D
    .byte $00 ; |        | $5A2E
L5A2F:
    .byte $00 ; |        | $5A2F
    .byte $00 ; |        | $5A30
    .byte $00 ; |        | $5A31
    .byte $00 ; |        | $5A32
    .byte $02 ; |      X | $5A33
    .byte $00 ; |        | $5A34
    .byte $00 ; |        | $5A35
    .byte $01 ; |       X| $5A36
    .byte $00 ; |        | $5A37
    .byte $00 ; |        | $5A38
    .byte $00 ; |        | $5A39
    .byte $80 ; |X       | $5A3A
    .byte $00 ; |        | $5A3B
    .byte $70 ; | XXX    | $5A3C
    .byte $00 ; |        | $5A3D
    .byte $00 ; |        | $5A3E
    .byte $30 ; |  XX    | $5A3F
    .byte $00 ; |        | $5A40
    .byte $00 ; |        | $5A41
    .byte $00 ; |        | $5A42
    .byte $00 ; |        | $5A43
    .byte $00 ; |        | $5A44
    .byte $00 ; |        | $5A45
    .byte $00 ; |        | $5A46
    .byte $82 ; |X     X | $5A47
    .byte $00 ; |        | $5A48
    .byte $00 ; |        | $5A49
    .byte $01 ; |       X| $5A4A
L5A4B:
    .byte $F2 ; |XXXX  X | $5A4B
    .byte $02 ; |      X | $5A4C
    .byte $F2 ; |XXXX  X | $5A4D
    .byte $F2 ; |XXXX  X | $5A4E
    .byte $E2 ; |XXX   X | $5A4F
    .byte $02 ; |      X | $5A50
    .byte $F2 ; |XXXX  X | $5A51
    .byte $F2 ; |XXXX  X | $5A52
    .byte $02 ; |      X | $5A53
    .byte $00 ; |        | $5A54
    .byte $00 ; |        | $5A55
    .byte $00 ; |        | $5A56
    .byte $00 ; |        | $5A57
    .byte $00 ; |        | $5A58
    .byte $60 ; | XX     | $5A59
    .byte $00 ; |        | $5A5A
    .byte $00 ; |        | $5A5B
    .byte $00 ; |        | $5A5C
    .byte $00 ; |        | $5A5D
    .byte $00 ; |        | $5A5E
    .byte $00 ; |        | $5A5F
    .byte $00 ; |        | $5A60
    .byte $00 ; |        | $5A61
    .byte $00 ; |        | $5A62
    .byte $00 ; |        | $5A63
    .byte $00 ; |        | $5A64
    .byte $00 ; |        | $5A65
    .byte $00 ; |        | $5A66
L5A67:
    .byte $12 ; |   X  X | $5A67
    .byte $02 ; |      X | $5A68
    .byte $F2 ; |XXXX  X | $5A69
    .byte $F2 ; |XXXX  X | $5A6A
    .byte $F2 ; |XXXX  X | $5A6B
    .byte $F2 ; |XXXX  X | $5A6C
    .byte $02 ; |      X | $5A6D
    .byte $10 ; |   X    | $5A6E
    .byte $30 ; |  XX    | $5A6F
    .byte $00 ; |        | $5A70
    .byte $00 ; |        | $5A71
    .byte $00 ; |        | $5A72
    .byte $00 ; |        | $5A73
    .byte $00 ; |        | $5A74
    .byte $00 ; |        | $5A75
    .byte $00 ; |        | $5A76
    .byte $00 ; |        | $5A77
    .byte $00 ; |        | $5A78
    .byte $00 ; |        | $5A79
    .byte $00 ; |        | $5A7A
    .byte $00 ; |        | $5A7B
    .byte $00 ; |        | $5A7C
    .byte $00 ; |        | $5A7D
    .byte $00 ; |        | $5A7E
    .byte $00 ; |        | $5A7F
    .byte $00 ; |        | $5A80
    .byte $00 ; |        | $5A81
    .byte $00 ; |        | $5A82
L5A83:
    .byte $12 ; |   X  X | $5A83
    .byte $F2 ; |XXXX  X | $5A84
    .byte $00 ; |        | $5A85
    .byte $00 ; |        | $5A86
    .byte $00 ; |        | $5A87
    .byte $00 ; |        | $5A88
    .byte $00 ; |        | $5A89
    .byte $00 ; |        | $5A8A
    .byte $00 ; |        | $5A8B
    .byte $00 ; |        | $5A8C
    .byte $00 ; |        | $5A8D
    .byte $00 ; |        | $5A8E
    .byte $00 ; |        | $5A8F
    .byte $00 ; |        | $5A90
    .byte $00 ; |        | $5A91
    .byte $00 ; |        | $5A92
    .byte $00 ; |        | $5A93
    .byte $00 ; |        | $5A94
    .byte $00 ; |        | $5A95
    .byte $00 ; |        | $5A96
    .byte $00 ; |        | $5A97
    .byte $00 ; |        | $5A98
    .byte $00 ; |        | $5A99
    .byte $00 ; |        | $5A9A
    .byte $00 ; |        | $5A9B
    .byte $00 ; |        | $5A9C
    .byte $00 ; |        | $5A9D
    .byte $00 ; |        | $5A9E
L5A9F:
    .byte $12 ; |   X  X | $5A9F
    .byte $02 ; |      X | $5AA0
    .byte $02 ; |      X | $5AA1
    .byte $12 ; |   X  X | $5AA2
    .byte $12 ; |   X  X | $5AA3
    .byte $02 ; |      X | $5AA4
    .byte $02 ; |      X | $5AA5
    .byte $12 ; |   X  X | $5AA6
    .byte $12 ; |   X  X | $5AA7
    .byte $02 ; |      X | $5AA8
    .byte $12 ; |   X  X | $5AA9
    .byte $02 ; |      X | $5AAA
    .byte $00 ; |        | $5AAB
    .byte $00 ; |        | $5AAC
    .byte $00 ; |        | $5AAD
    .byte $00 ; |        | $5AAE
    .byte $00 ; |        | $5AAF
    .byte $00 ; |        | $5AB0
    .byte $00 ; |        | $5AB1
    .byte $00 ; |        | $5AB2
    .byte $00 ; |        | $5AB3
    .byte $00 ; |        | $5AB4
    .byte $00 ; |        | $5AB5
    .byte $00 ; |        | $5AB6
    .byte $00 ; |        | $5AB7
    .byte $00 ; |        | $5AB8
    .byte $00 ; |        | $5AB9
    .byte $00 ; |        | $5ABA
L5ABB:
    .byte $00 ; |        | $5ABB
    .byte $00 ; |        | $5ABC
    .byte $00 ; |        | $5ABD
    .byte $00 ; |        | $5ABE
    .byte $72 ; | XXX  X | $5ABF
    .byte $70 ; | XXX    | $5AC0
    .byte $72 ; | XXX  X | $5AC1
    .byte $72 ; | XXX  X | $5AC2
    .byte $72 ; | XXX  X | $5AC3
    .byte $72 ; | XXX  X | $5AC4
    .byte $70 ; | XXX    | $5AC5
    .byte $42 ; | X    X | $5AC6
    .byte $72 ; | XXX  X | $5AC7
    .byte $70 ; | XXX    | $5AC8
    .byte $72 ; | XXX  X | $5AC9
    .byte $72 ; | XXX  X | $5ACA
    .byte $70 ; | XXX    | $5ACB
    .byte $70 ; | XXX    | $5ACC
    .byte $82 ; |X     X | $5ACD
    .byte $70 ; | XXX    | $5ACE
    .byte $72 ; | XXX  X | $5ACF
    .byte $00 ; |        | $5AD0
    .byte $72 ; | XXX  X | $5AD1
    .byte $70 ; | XXX    | $5AD2
    .byte $72 ; | XXX  X | $5AD3
    .byte $82 ; |X     X | $5AD4
    .byte $82 ; |X     X | $5AD5
    .byte $02 ; |      X | $5AD6
L5AD7:
    .byte $00 ; |        | $5AD7
    .byte $00 ; |        | $5AD8
    .byte $00 ; |        | $5AD9
    .byte $00 ; |        | $5ADA
    .byte $00 ; |        | $5ADB
    .byte $00 ; |        | $5ADC
    .byte $00 ; |        | $5ADD
    .byte $90 ; |X  X    | $5ADE
    .byte $90 ; |X  X    | $5ADF
    .byte $80 ; |X       | $5AE0
    .byte $80 ; |X       | $5AE1
    .byte $92 ; |X  X  X | $5AE2
    .byte $92 ; |X  X  X | $5AE3
    .byte $92 ; |X  X  X | $5AE4
    .byte $52 ; | X X  X | $5AE5
    .byte $54 ; | X X X  | $5AE6
    .byte $64 ; | XX  X  | $5AE7
    .byte $74 ; | XXX X  | $5AE8
    .byte $28 ; |  X X   | $5AE9
    .byte $36 ; |  XX XX | $5AEA
    .byte $46 ; | X   XX | $5AEB
    .byte $56 ; | X X XX | $5AEC
    .byte $66 ; | XX  XX | $5AED
    .byte $56 ; | X X XX | $5AEE
    .byte $66 ; | XX  XX | $5AEF
    .byte $66 ; | XX  XX | $5AF0
    .byte $76 ; | XXX XX | $5AF1
    .byte $86 ; |X    XX | $5AF2
    .byte $86 ; |X    XX | $5AF3
    .byte $86 ; |X    XX | $5AF4
    .byte $86 ; |X    XX | $5AF5
    .byte $86 ; |X    XX | $5AF6
    .byte $86 ; |X    XX | $5AF7
    .byte $86 ; |X    XX | $5AF8
    .byte $86 ; |X    XX | $5AF9
    .byte $86 ; |X    XX | $5AFA
    .byte $86 ; |X    XX | $5AFB
    .byte $86 ; |X    XX | $5AFC
    .byte $86 ; |X    XX | $5AFD
    .byte $86 ; |X    XX | $5AFE
    .byte $86 ; |X    XX | $5AFF
    .byte $86 ; |X    XX | $5B00
    .byte $86 ; |X    XX | $5B01
    .byte $86 ; |X    XX | $5B02
    .byte $86 ; |X    XX | $5B03
    .byte $86 ; |X    XX | $5B04
    .byte $86 ; |X    XX | $5B05
    .byte $86 ; |X    XX | $5B06
    .byte $86 ; |X    XX | $5B07
    .byte $86 ; |X    XX | $5B08
    .byte $86 ; |X    XX | $5B09
    .byte $86 ; |X    XX | $5B0A
    .byte $86 ; |X    XX | $5B0B
    .byte $86 ; |X    XX | $5B0C
    .byte $86 ; |X    XX | $5B0D
L5B0E:
    .byte $00 ; |        | $5B0E
    .byte $00 ; |        | $5B0F
    .byte $00 ; |        | $5B10
    .byte $00 ; |        | $5B11
    .byte $00 ; |        | $5B12
    .byte $00 ; |        | $5B13
    .byte $00 ; |        | $5B14
    .byte $00 ; |        | $5B15
    .byte $00 ; |        | $5B16
    .byte $00 ; |        | $5B17
    .byte $00 ; |        | $5B18
    .byte $00 ; |        | $5B19
    .byte $00 ; |        | $5B1A
    .byte $00 ; |        | $5B1B
    .byte $00 ; |        | $5B1C
    .byte $90 ; |X  X    | $5B1D
    .byte $00 ; |        | $5B1E
    .byte $90 ; |X  X    | $5B1F
    .byte $90 ; |X  X    | $5B20
    .byte $90 ; |X  X    | $5B21
    .byte $90 ; |X  X    | $5B22
    .byte $90 ; |X  X    | $5B23
    .byte $92 ; |X  X  X | $5B24
    .byte $82 ; |X     X | $5B25
    .byte $94 ; |X  X X  | $5B26
    .byte $84 ; |X    X  | $5B27
    .byte $84 ; |X    X  | $5B28
    .byte $86 ; |X    XX | $5B29
    .byte $86 ; |X    XX | $5B2A
    .byte $96 ; |X  X XX | $5B2B
    .byte $86 ; |X    XX | $5B2C
    .byte $96 ; |X  X XX | $5B2D
    .byte $86 ; |X    XX | $5B2E
    .byte $86 ; |X    XX | $5B2F
    .byte $86 ; |X    XX | $5B30
    .byte $86 ; |X    XX | $5B31
    .byte $86 ; |X    XX | $5B32
    .byte $86 ; |X    XX | $5B33
    .byte $86 ; |X    XX | $5B34
    .byte $86 ; |X    XX | $5B35
    .byte $86 ; |X    XX | $5B36
    .byte $86 ; |X    XX | $5B37
    .byte $86 ; |X    XX | $5B38
    .byte $86 ; |X    XX | $5B39
    .byte $86 ; |X    XX | $5B3A
    .byte $86 ; |X    XX | $5B3B
    .byte $86 ; |X    XX | $5B3C
    .byte $86 ; |X    XX | $5B3D
    .byte $86 ; |X    XX | $5B3E
    .byte $86 ; |X    XX | $5B3F
    .byte $86 ; |X    XX | $5B40
    .byte $86 ; |X    XX | $5B41
    .byte $86 ; |X    XX | $5B42
    .byte $86 ; |X    XX | $5B43
    .byte $86 ; |X    XX | $5B44
L5B45:
    .byte $00 ; |        | $5B45
    .byte $00 ; |        | $5B46
    .byte $00 ; |        | $5B47
    .byte $00 ; |        | $5B48
    .byte $00 ; |        | $5B49
    .byte $00 ; |        | $5B4A
    .byte $00 ; |        | $5B4B
    .byte $00 ; |        | $5B4C
    .byte $00 ; |        | $5B4D
    .byte $00 ; |        | $5B4E
    .byte $00 ; |        | $5B4F
    .byte $00 ; |        | $5B50
    .byte $00 ; |        | $5B51
    .byte $A0 ; |X X     | $5B52
    .byte $A2 ; |X X   X | $5B53
    .byte $A4 ; |X X  X  | $5B54
    .byte $96 ; |X  X XX | $5B55
    .byte $A6 ; |X X  XX | $5B56
    .byte $98 ; |X  XX   | $5B57
    .byte $A8 ; |X X X   | $5B58
    .byte $AA ; |X X X X | $5B59
    .byte $AC ; |X X XX  | $5B5A
    .byte $9A ; |X  XX X | $5B5B
    .byte $AA ; |X X X X | $5B5C
    .byte $AA ; |X X X X | $5B5D
    .byte $AA ; |X X X X | $5B5E
    .byte $AA ; |X X X X | $5B5F
    .byte $AA ; |X X X X | $5B60
    .byte $AA ; |X X X X | $5B61
    .byte $AA ; |X X X X | $5B62
    .byte $AA ; |X X X X | $5B63
    .byte $AA ; |X X X X | $5B64
    .byte $AA ; |X X X X | $5B65
    .byte $AA ; |X X X X | $5B66
    .byte $AA ; |X X X X | $5B67
    .byte $AA ; |X X X X | $5B68
    .byte $AA ; |X X X X | $5B69
    .byte $AA ; |X X X X | $5B6A
    .byte $AA ; |X X X X | $5B6B
    .byte $AA ; |X X X X | $5B6C
    .byte $AA ; |X X X X | $5B6D
    .byte $AA ; |X X X X | $5B6E
    .byte $AA ; |X X X X | $5B6F
    .byte $AA ; |X X X X | $5B70
    .byte $AA ; |X X X X | $5B71
    .byte $AA ; |X X X X | $5B72
    .byte $AA ; |X X X X | $5B73
    .byte $AA ; |X X X X | $5B74
    .byte $AA ; |X X X X | $5B75
    .byte $AA ; |X X X X | $5B76
    .byte $AA ; |X X X X | $5B77
    .byte $AA ; |X X X X | $5B78
    .byte $AA ; |X X X X | $5B79
    .byte $AA ; |X X X X | $5B7A
    .byte $AA ; |X X X X | $5B7B
L5B7C:
    .byte $00 ; |        | $5B7C
    .byte $00 ; |        | $5B7D
    .byte $00 ; |        | $5B7E
    .byte $00 ; |        | $5B7F
    .byte $00 ; |        | $5B80
    .byte $00 ; |        | $5B81
    .byte $00 ; |        | $5B82
    .byte $00 ; |        | $5B83
    .byte $00 ; |        | $5B84
    .byte $00 ; |        | $5B85
    .byte $00 ; |        | $5B86
    .byte $00 ; |        | $5B87
    .byte $00 ; |        | $5B88
    .byte $00 ; |        | $5B89
    .byte $00 ; |        | $5B8A
    .byte $00 ; |        | $5B8B
    .byte $90 ; |X  X    | $5B8C
    .byte $80 ; |X       | $5B8D
    .byte $00 ; |        | $5B8E
    .byte $90 ; |X  X    | $5B8F
    .byte $92 ; |X  X  X | $5B90
    .byte $82 ; |X     X | $5B91
    .byte $74 ; | XXX X  | $5B92
    .byte $94 ; |X  X X  | $5B93
    .byte $96 ; |X  X XX | $5B94
    .byte $84 ; |X    X  | $5B95
    .byte $84 ; |X    X  | $5B96
    .byte $84 ; |X    X  | $5B97
    .byte $84 ; |X    X  | $5B98
    .byte $84 ; |X    X  | $5B99
    .byte $84 ; |X    X  | $5B9A
    .byte $84 ; |X    X  | $5B9B
    .byte $84 ; |X    X  | $5B9C
    .byte $84 ; |X    X  | $5B9D
    .byte $84 ; |X    X  | $5B9E
    .byte $84 ; |X    X  | $5B9F
    .byte $84 ; |X    X  | $5BA0
    .byte $84 ; |X    X  | $5BA1
    .byte $84 ; |X    X  | $5BA2
    .byte $84 ; |X    X  | $5BA3
    .byte $84 ; |X    X  | $5BA4
    .byte $84 ; |X    X  | $5BA5
    .byte $84 ; |X    X  | $5BA6
    .byte $84 ; |X    X  | $5BA7
    .byte $84 ; |X    X  | $5BA8
    .byte $84 ; |X    X  | $5BA9
    .byte $84 ; |X    X  | $5BAA
    .byte $84 ; |X    X  | $5BAB
    .byte $84 ; |X    X  | $5BAC
    .byte $84 ; |X    X  | $5BAD
    .byte $84 ; |X    X  | $5BAE
    .byte $84 ; |X    X  | $5BAF
    .byte $84 ; |X    X  | $5BB0
    .byte $84 ; |X    X  | $5BB1
    .byte $84 ; |X    X  | $5BB2
L5BB3:
    .byte $98 ; |X  XX   | $5BB3
    .byte $88 ; |X   X   | $5BB4
    .byte $9A ; |X  XX X | $5BB5
    .byte $8A ; |X   X X | $5BB6
    .byte $7A ; | XXXX X | $5BB7
    .byte $8A ; |X   X X | $5BB8
    .byte $5A ; | X XX X | $5BB9
    .byte $00 ; |        | $5BBA
    .byte $00 ; |        | $5BBB
    .byte $00 ; |        | $5BBC
    .byte $00 ; |        | $5BBD
    .byte $00 ; |        | $5BBE
    .byte $00 ; |        | $5BBF
    .byte $00 ; |        | $5BC0
    .byte $00 ; |        | $5BC1
    .byte $00 ; |        | $5BC2
    .byte $00 ; |        | $5BC3
    .byte $00 ; |        | $5BC4
    .byte $00 ; |        | $5BC5
    .byte $00 ; |        | $5BC6
    .byte $00 ; |        | $5BC7
    .byte $00 ; |        | $5BC8
    .byte $00 ; |        | $5BC9
    .byte $00 ; |        | $5BCA
    .byte $00 ; |        | $5BCB
    .byte $00 ; |        | $5BCC
    .byte $00 ; |        | $5BCD
    .byte $00 ; |        | $5BCE
    .byte $00 ; |        | $5BCF
    .byte $00 ; |        | $5BD0
    .byte $00 ; |        | $5BD1
    .byte $00 ; |        | $5BD2
    .byte $00 ; |        | $5BD3
    .byte $00 ; |        | $5BD4
    .byte $00 ; |        | $5BD5
    .byte $00 ; |        | $5BD6
    .byte $00 ; |        | $5BD7
    .byte $00 ; |        | $5BD8
    .byte $00 ; |        | $5BD9
    .byte $00 ; |        | $5BDA
    .byte $00 ; |        | $5BDB
    .byte $00 ; |        | $5BDC
    .byte $00 ; |        | $5BDD
    .byte $00 ; |        | $5BDE
    .byte $00 ; |        | $5BDF
    .byte $00 ; |        | $5BE0
    .byte $00 ; |        | $5BE1
    .byte $00 ; |        | $5BE2
    .byte $00 ; |        | $5BE3
    .byte $00 ; |        | $5BE4
    .byte $00 ; |        | $5BE5
    .byte $00 ; |        | $5BE6
    .byte $00 ; |        | $5BE7
    .byte $00 ; |        | $5BE8
    .byte $00 ; |        | $5BE9

L5BEA:
    ldx    #$1E                  ; 2
L5BEC:
    sta    WSYNC                 ; 3
;---------------------------------------
    txa                          ; 2
    and    #$01                  ; 2
    beq    L5C00                 ; 2³+1
    lda    #$00                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    PF0                   ; 3
    dex                          ; 2
    bne    L5BEC                 ; 2³
    beq    L5C0B                 ; 3   always branch

L5C00:
    lda    #$FF                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    dex                          ; 2
    bne    L5BEC                 ; 2³+1
L5C0B:
    rts                          ; 6

L5C0C:
    ldx    #$00                  ; 2
    lda    engineStatus|READ     ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L5C6F,Y               ; 4
    sta    sc_30,X               ; 5
    inx                          ; 2
    lda    tireStatus|READ       ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L5C6F,Y               ; 4
    sta    sc_30,X               ; 5
    inx                          ; 2
    lda    armorStatus|READ      ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L5C6F,Y               ; 4
    sta    sc_30,X               ; 5
    lda    #$07                  ; 2
    sta    NUSIZ1                ; 3
    lda    #$46                  ; 2
    sta    COLUP1                ; 3
    lda    #$04                  ; 2
    sta    ram_8B                ; 3
    ldx    #$0F                  ; 2
    ldy    #$00                  ; 2
L5C47:
    sta    WSYNC                 ; 3
;---------------------------------------
    dec    ram_8B                ; 5
    bpl    L5C60                 ; 2³
    lda    #$04                  ; 2
    sta    ram_8B                ; 3
    lda    #$00                  ; 2
    sta    GRP1                  ; 3
    iny                          ; 2
    lda    L569C,Y               ; 4
    sta    COLUP1                ; 3
    dex                          ; 2
    bne    L5C47                 ; 2³
    beq    L5C68                 ; 3   always branch

L5C60:
    lda    sc_30|READ,Y          ; 4
    sta    GRP1                  ; 3
    dex                          ; 2
    bne    L5C47                 ; 2³
L5C68:
    lda    #$00                  ; 2
    sta    GRP1                  ; 3
    sta    NUSIZ1                ; 3
    rts                          ; 6

L5C6F:
    .byte $80 ; |X       | $5C6F
    .byte $C0 ; |XX      | $5C70
    .byte $C0 ; |XX      | $5C71
    .byte $E0 ; |XXX     | $5C72
    .byte $E0 ; |XXX     | $5C73
    .byte $F0 ; |XXXX    | $5C74
    .byte $F0 ; |XXXX    | $5C75
    .byte $F8 ; |XXXXX   | $5C76
    .byte $F8 ; |XXXXX   | $5C77
    .byte $FC ; |XXXXXX  | $5C78
    .byte $FC ; |XXXXXX  | $5C79
    .byte $FE ; |XXXXXXX | $5C7A
    .byte $FE ; |XXXXXXX | $5C7B
    .byte $FF ; |XXXXXXXX| $5C7C
    .byte $FF ; |XXXXXXXX| $5C7D
    .byte $FF ; |XXXXXXXX| $5C7E
    .byte $FF ; |XXXXXXXX| $5C7F
    .byte $FF ; |XXXXXXXX| $5C80
    .byte $FF ; |XXXXXXXX| $5C81
    .byte $FF ; |XXXXXXXX| $5C82
    .byte $FF ; |XXXXXXXX| $5C83
    .byte $FF ; |XXXXXXXX| $5C84
    .byte $FF ; |XXXXXXXX| $5C85
    .byte $FF ; |XXXXXXXX| $5C86
    .byte $FF ; |XXXXXXXX| $5C87
    .byte $FF ; |XXXXXXXX| $5C88
    .byte $FF ; |XXXXXXXX| $5C89
    .byte $FF ; |XXXXXXXX| $5C8A
L5C8B:
    .byte $00 ; |        | $5C8B
    .byte $72 ; | XXX  X | $5C8C
    .byte $56 ; | X X XX | $5C8D
    .byte $72 ; | XXX  X | $5C8E
    .byte $CB ; |XX  X XX| $5C8F
    .byte $30 ; |  XX    | $5C90
    .byte $CB ; |XX  X XX| $5C91
    .byte $BD ; |X XXXX X| $5C92
    .byte $86 ; |X    XX | $5C93
    .byte $69 ; | XX X  X| $5C94
    .byte $9A ; |X  XX X | $5C95
    .byte $00 ; |        | $5C96
L5C97:
    .byte $00 ; |        | $5C97
    .byte $30 ; |  XX    | $5C98
    .byte $C2 ; |XX    X | $5C99
    .byte $02 ; |      X | $5C9A
    .byte $56 ; | X X XX | $5C9B
    .byte $FF ; |XXXXXXXX| $5C9C
    .byte $46 ; | X   XX | $5C9D
    .byte $56 ; | X X XX | $5C9E
    .byte $C3 ; |XX    XX| $5C9F
    .byte $33 ; |  XX  XX| $5CA0
    .byte $68 ; | XX X   | $5CA1
    .byte $00 ; |        | $5CA2
L5CA3:
    .byte $00 ; |        | $5CA3
    .byte $A1 ; |X X    X| $5CA4
    .byte $81 ; |X      X| $5CA5
    .byte $C2 ; |XX    X | $5CA6
    .byte $30 ; |  XX    | $5CA7
    .byte $CB ; |XX  X XX| $5CA8
    .byte $BD ; |X XXXX X| $5CA9
    .byte $CB ; |XX  X XX| $5CAA
    .byte $72 ; | XXX  X | $5CAB
    .byte $8D ; |X   XX X| $5CAC
    .byte $73 ; | XXX  XX| $5CAD
    .byte $81 ; |X      X| $5CAE
L5CAF:
    .byte $00 ; |        | $5CAF
    .byte $EB ; |XXX X XX| $5CB0
    .byte $81 ; |X      X| $5CB1
    .byte $EC ; |XXX XX  | $5CB2
    .byte $CE ; |XX  XXX | $5CB3
    .byte $EC ; |XXX XX  | $5CB4
    .byte $CE ; |XX  XXX | $5CB5
    .byte $EC ; |XXX XX  | $5CB6
    .byte $DD ; |XX XXX X| $5CB7
    .byte $73 ; | XXX  XX| $5CB8
    .byte $C2 ; |XX    X | $5CB9
    .byte $7E ; | XXXXXX | $5CBA
L5CBB:
    .byte $00 ; |        | $5CBB
    .byte $34 ; |  XX X  | $5CBC
    .byte $0F ; |    XXXX| $5CBD
    .byte $48 ; | X  X   | $5CBE
    .byte $34 ; |  XX X  | $5CBF
    .byte $36 ; |  XX XX | $5CC0
    .byte $FA ; |XXXXX X | $5CC1
    .byte $4A ; | X  X X | $5CC2
    .byte $1A ; |   XX X | $5CC3
    .byte $2A ; |  X X X | $5CC4
    .byte $44 ; | X   X  | $5CC5
    .byte $4A ; | X  X X | $5CC6
L5CC7:
    .byte $00 ; |        | $5CC7
    .byte $4F ; | X  XXXX| $5CC8
    .byte $1A ; |   XX X | $5CC9
    .byte $34 ; |  XX X  | $5CCA
    .byte $F4 ; |XXXX X  | $5CCB
    .byte $36 ; |  XX XX | $5CCC
    .byte $94 ; |X  X X  | $5CCD
    .byte $9A ; |X  XX X | $5CCE
    .byte $0F ; |    XXXX| $5CCF
    .byte $18 ; |   XX   | $5CD0
    .byte $F6 ; |XXXX XX | $5CD1
    .byte $14 ; |   X X  | $5CD2
L5CD3:
    .byte $00 ; |        | $5CD3
    .byte $0F ; |    XXXX| $5CD4
    .byte $38 ; |  XXX   | $5CD5
    .byte $18 ; |   XX   | $5CD6
    .byte $38 ; |  XXX   | $5CD7
    .byte $36 ; |  XX XX | $5CD8
    .byte $24 ; |  X  X  | $5CD9
    .byte $28 ; |  X X   | $5CDA
    .byte $34 ; |  XX X  | $5CDB
    .byte $F4 ; |XXXX X  | $5CDC
    .byte $18 ; |   XX   | $5CDD
    .byte $00 ; |        | $5CDE
L5CDF:
    .byte $00 ; |        | $5CDF
    .byte $18 ; |   XX   | $5CE0
    .byte $28 ; |  X X   | $5CE1
    .byte $02 ; |      X | $5CE2
    .byte $18 ; |   XX   | $5CE3
    .byte $46 ; | X   XX | $5CE4
    .byte $34 ; |  XX X  | $5CE5
    .byte $18 ; |   XX   | $5CE6
    .byte $34 ; |  XX X  | $5CE7
    .byte $26 ; |  X  XX | $5CE8
    .byte $16 ; |   X XX | $5CE9
    .byte $F4 ; |XXXX X  | $5CEA

L5CEB:
    .word L56AF          ; $5CEB
    .word L5C97          ; $5CED
    .word L5C97          ; $5CEF
    .word L5C97          ; $5CF1
    .word L5C8B          ; $5CF3
    .word L5C8B          ; $5CF5
    .word L5CA3          ; $5CF7
    .word L5CA3          ; $5CF9
    .word L5CAF          ; $5CFB
    .word L5CAF          ; $5CFD
    .word L5C8B          ; $5CFF
    .word L5C8B          ; $5D01
    .word L5CA3          ; $5D03
    .word L5CA3          ; $5D05
    .word L5CAF          ; $5D07
    .word L5CAF          ; $5D09
L5D0B:
    .word L56BF          ; $5D0B
    .word L5CBB          ; $5D0D
    .word L5CBB          ; $5D0F
    .word L5CBB          ; $5D11
    .word L5CC7          ; $5D13
    .word L5CC7          ; $5D15
    .word L5CC7          ; $5D17
    .word L5CC7          ; $5D19
    .word L5CD3          ; $5D1B
    .word L5CD3          ; $5D1D
    .word L5CD3          ; $5D1F
    .word L5CD3          ; $5D21
    .word L5CDF          ; $5D23
    .word L5CDF          ; $5D25
    .word L5CDF          ; $5D27
    .word L5CDF          ; $5D29

L5D2B:
    ldy    #$00                  ; 2
    lda    sc_7D|READ            ; 4
    sty    sc_7D                 ; 4
    beq    L5D3D                 ; 2³
    cmp    #$03                  ; 2
    beq    L5D40                 ; 2³
    cmp    #$06                  ; 2
    beq    L5D47                 ; 2³
L5D3D:
    jmp    L5F68                 ; 3

L5D40:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    L5F6C                 ; 3

L5D47:
    jmp    L5F74                 ; 3


  IF SHOW_BYTES_REMAINING
      ECHO ([$5EFC-*]d), "bytes free BANK_2"
  ENDIF


       ORG $2EFC
      RORG $5EFC

    lda    BANK_2                ; 4
    jmp    M5106|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M5109|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9106|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M510C|BANK_MASK       ; 3

    lda    BANK_1                ; 4
    jmp    M3109|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9109|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M510F|BANK_MASK       ; 3

    lda    BANK_3                ; 4
    jmp    M7106|BANK_MASK       ; 3

    lda    BANK_3                ; 4
    jmp    M7109|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M5112|BANK_MASK       ; 3

    lda    BANK_1                ; 4
    jmp    M310F|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB10C|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB10F|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9112|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB106|BANK_MASK       ; 3

    lda    BANK_7                ; 4
    jmp    MF106|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M910F|BANK_MASK       ; 3

    lda    BANK_6                ; 4
    jmp    MD106|BANK_MASK       ; 3

L5F68:
    lda    BANK_0                ; 4
    rts                          ; 6

L5F6C:
    lda    BANK_3                ; 4
    rts                          ; 6

    lda    BANK_4                ; 4
    rts                          ; 6

L5F74:
    lda    BANK_6                ; 4
    rts                          ; 6


; $5F78 - $5FF3 are free bytes


       ORG $2FF4
      RORG $5FF4

    .byte $00 ; |        | $5FF4
    .byte $00 ; |        | $5FF5
    .byte $00 ; |        | $5FF6
    .byte $00 ; |        | $5FF7
    .byte $00 ; |        | $5FF8
    .byte $00 ; |        | $5FF9
    .byte $00 ; |        | $5FFA
    .byte $00 ; |        | $5FFB

    .word START_2
    .word 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      BANK 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $3000
      RORG $7000

    SC_RAM_SPACE

START_3:
    lda    BANK_0                ; 4
    jmp    START_3               ; 3

M7106:
    jmp    L7E5A                 ; 3

M7109:
    jmp    L785A                 ; 3

L710C:
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    BANK_0                ; 4
    nop                          ; 2
    jmp    $F110                 ; 3   unused

L7118:
    lda    #$76                  ; 2
    sta    ram_98                ; 3
    lda    #$1A                  ; 2
    sta    ram_99                ; 3
    ldx    #$00                  ; 2
    stx    ram_94                ; 3
    ldx    #$01                  ; 2
    jsr    L7F3E                 ; 6   bankswitch, goto LB88B
    ldx    #$3F                  ; 2
    stx    ram_92                ; 3
L712D:
    lda    #$03                  ; 2
    sta    VSYNC                 ; 3
    sta    RSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    VSYNC                 ; 3
    lda    #$03                  ; 2
    sta    VBLANK                ; 3
    lda    #$2F                  ; 2
    sta    TIM64T                ; 4
    inc    ram_92                ; 5
    ldx    ram_92                ; 3
    cpx    #$12                  ; 2
    bne    L714F                 ; 2³
    jsr    L7E31                 ; 6
L714F:
    lda    ram_92                ; 3
    cmp    #$40                  ; 2
    bcc    L7162                 ; 2³
    sed                          ; 2
    clc                          ; 2
    lda    ram_94                ; 3
    adc    #$01                  ; 2
    sta    ram_94                ; 3
    cld                          ; 2
    lda    #$00                  ; 2
    sta    ram_92                ; 3
L7162:
    lda    ram_94                ; 3
    cmp    #$18                  ; 2
    bne    L717A                 ; 2³
    lda    ram_92                ; 3
    cmp    #$39                  ; 2
    bcc    L717A                 ; 2³
    ldx    #$00                  ; 2
    jsr    L7F3E                 ; 6   bankswitch, goto LB88B
    lda    #$20                  ; 2
    sta    ram_94                ; 3
    jmp    L71B1                 ; 3

L717A:
    lda    ram_94                ; 3
    cmp    #$37                  ; 2
    bcc    L7183                 ; 2³
    jmp    L76E1                 ; 3

L7183:
    jsr    L7F44                 ; 6   bankswitch, goto LB90C
    lda    SWCHA                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_81                ; 3
    cmp    #$0F                  ; 2
    beq    L71B1                 ; 2³
    cmp    #$0E                  ; 2
    beq    L719E                 ; 2³
    cmp    #$0D                  ; 2
    beq    L71A9                 ; 2³
    jmp    L71B1                 ; 3

L719E:
    lda    #$1A                  ; 2
    sta    ram_98                ; 3
    lda    #$76                  ; 2
    sta    ram_99                ; 3
    jmp    L71B1                 ; 3

L71A9:
    lda    #$76                  ; 2
    sta    ram_98                ; 3
    lda    #$1A                  ; 2
    sta    ram_99                ; 3
L71B1:
    ldy    INTIM                 ; 4
    bne    L71B1                 ; 2³
    lda    #$00                  ; 2
    sta    VBLANK                ; 3
    sta    COLUBK                ; 3
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    HMCLR                 ; 3
    ldx    #$0A                  ; 2
L71C6:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    L71C6                 ; 2³
    lda    #>FatalRunLogoOne     ; 2
    sta    ram_8D                ; 3
    lda    #<FatalRunLogoOne     ; 2
    sta    ram_8C                ; 3
    lda    #>FatalRunLogoTwo     ; 2
    sta    ram_8F                ; 3
    lda    #<FatalRunLogoTwo     ; 2
    sta    ram_8E                ; 3
    lda    #>FatalRunLogoThree   ; 2
    sta    ram_91                ; 3
    lda    #<FatalRunLogoThree   ; 2
    sta    ram_90                ; 3
    lda    #>FatalRunLogoFour    ; 2
    sta    ram_89                ; 3
    lda    #<FatalRunLogoFour    ; 2
    sta    ram_88                ; 3
    lda    #>FatalRunLogoFive    ; 2
    sta    ram_87                ; 3
    lda    #<FatalRunLogoFive    ; 2
    sta    ram_86                ; 3
    lda    #>FatalRunLogoSix     ; 2
    sta    ram_83                ; 3
    lda    #<FatalRunLogoSix     ; 2
    sta    ram_82                ; 3
    lda    #$0F                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    jsr    L7B5D                 ; 6
    ldx    #$31                  ; 2
    stx    ram_8B                ; 3
    jsr    L7316                 ; 6
    lda    #$00                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    sc_2F                 ; 4
    ldx    #$4B                  ; 2
    stx    ram_95                ; 3
    ldx    #$03                  ; 2
    stx    sc_7D                 ; 4
    ldx    #$69                  ; 2
    stx    ram_8A                ; 3
    jsr    L7F20                 ; 6   bankswitch, goto L57DA
    lda    #$00                  ; 2
    sta    ENABL                 ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    ldx    #$07                  ; 2
L7236:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    dex                          ; 2
    bpl    L7236                 ; 2³
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #>ResumeOne           ; 2
    sta    ram_8D                ; 3
    lda    #<ResumeOne           ; 2
    sta    ram_8C                ; 3
    lda    #>ResumeTwo           ; 2
    sta    ram_8F                ; 3
    lda    #<ResumeTwo           ; 2
    sta    ram_8E                ; 3
    lda    #>ResumeThree         ; 2
    sta    ram_91                ; 3
    lda    #<ResumeThree         ; 2
    sta    ram_90                ; 3
    lda    #>ResumeFour          ; 2
    sta    ram_89                ; 3
    lda    #<ResumeFour          ; 2
    sta    ram_88                ; 3
    lda    #>ResumeFive          ; 2
    sta    ram_87                ; 3
    lda    #<ResumeFive          ; 2
    sta    ram_86                ; 3
    lda    #>ResumeSix           ; 2
    sta    ram_83                ; 3
    lda    #<ResumeSix           ; 2
    sta    ram_82                ; 3
    lda    #$00                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    jsr    L7B5D                 ; 6
    lda    ram_98                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    #$0A                  ; 2
    stx    ram_8B                ; 3
    jsr    L7316                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #>NewGfxOne           ; 2
    sta    ram_8D                ; 3
    lda    #<NewGfxOne           ; 2
    sta    ram_8C                ; 3
    lda    #>NewGfxTwo           ; 2
    sta    ram_8F                ; 3
    lda    #<NewGfxTwo           ; 2
    sta    ram_8E                ; 3
    lda    #>NewGfxThree         ; 2
    sta    ram_91                ; 3
    lda    #<NewGfxThree         ; 2
    sta    ram_90                ; 3
    lda    #>NewGfxFour          ; 2
    sta    ram_89                ; 3
    lda    #<NewGfxFour          ; 2
    sta    ram_88                ; 3
    lda    #>NewGfxFive          ; 2
    sta    ram_87                ; 3
    lda    #<NewGfxFive          ; 2
    sta    ram_86                ; 3
    lda    #>NewGfxSix           ; 2
    sta    ram_83                ; 3
    lda    #<NewGfxSix           ; 2
    sta    ram_82                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_99                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    #$0A                  ; 2
    stx    ram_8B                ; 3
    jsr    L7316                 ; 6
    lda    #$00                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    ldx    #$1D                  ; 2
L72DC:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    L72DC                 ; 2³
    lda    #$25                  ; 2
    sta    TIM64T                ; 4
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    lda    ram_92                ; 3
    cmp    #$15                  ; 2
    bcc    L72F5                 ; 2³
    jsr    L7E41                 ; 6
    bcs    L72FD                 ; 2³
L72F5:
    ldy    INTIM                 ; 4
    bne    L72F5                 ; 2³
    jmp    L712D                 ; 3

L72FD:
    ldy    INTIM                 ; 4
    bne    L72FD                 ; 2³+1
    lda    ram_98                ; 3
    cmp    #$1A                  ; 2
    bne    L730E                 ; 2³
    jsr    L7F5C                 ; 6   bankswitch, goto L9841
    jmp    L785A                 ; 3

L730E:
    lda    #$03                  ; 2
    sta    sc_2F                 ; 4
    jmp    L785A                 ; 3

L7316:
    ldy    ram_8B                ; 3
    lda    (ram_86),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    ram_85                ; 3
    lda    (ram_88),Y            ; 5
    tax                          ; 2
    lda    (ram_8C),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_8E),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_90),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_82),Y            ; 5
    ldy    ram_85                ; 3
    stx    GRP1                  ; 3
    sty    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_8B                ; 5
    bpl    L7316                 ; 2³
    rts                          ; 6

;         X     XXXXXXX  XXXXX  XXXXXX  XXXXX  XX
;         X     XX      XX   XX   XX   XX   XX XX
;         X     XX      XX   XX   XX   XX   XX XX
;        X X    XX      XX   XX   XX   XX   XX XX
;         X     XX      XX   XX   XX   XX   XX XX
;        XXX    XXXXX   XX   XX   XX   XX   XX XX
;        XXX    XX      XX   XX   XX   XX   XX XX
;        XXX    XX      XXXXXXX   XX   XXXXXXX XX
;        XXX    XX      XX   XX   XX   XX   XX XX
;        XXX    XX      XX   XX   XX   XX   XX XX
;        XXX    XX      XX   XX   XX   XX   XX XX
;       XXXXX   XX      XX   XX   XX   XX   XX XXXXXXX
;       XXX X                          XX
;       XXXXX      XXXXX  XX   XX XX   XX
;       XXXXX     XX   XX XX   XX XX   XX     X X X
;       X   X     XX   XX XX   XX XXX  XX     X X X
;       X   X     XX   XX XX   XX XXX  XX     X X X
;       XX XX     XX   XX XX   XX XXXX XX     X X X
;       XX XX     XX   XX XX   XX XXXX XX    XX X XX
;       XXXXX     XXXXXX  XX   XX XX XXXX    XX X XX
;       X X X     XX   XX XX   XX XX XXXX   XXX X XXX
;       X X X     XX   XX XX   XX XX  XXX   XX  X  XX
;       X X X     XX   XX XX   XX XX  XXX   XX  X  XX
;       X X X     XX   XX XX   XX XX   XX
;       X   X     XX   XX  XXXXX  XX   XX
;       XXXXX
;       X   X                       XXXXX
;       X XXX              X       XX    XX
;       X   X              XXX   XX X    X X
;       XXX X       XXXXX   X  XX   X    X  XX
;       X   X      X        XXXXXXXXXXXXXXXXXXXXXX
;      XXXXXXX XXX
;      XX   XX             XXXXXXXXXX XXXXXXXXXXXXXXX
;      XX X XX  X   XXXXXX XXX  XXXXX XXXXXXXXXX  XXXX
;      XX   XX   XXX       XX XX XXXX     XXXXX XX XXX
;     XXX X XXX            X XXXX XXXXXXXXXXXX XXXX XX
;     XXXXXXXXX              XXXX              XXXX
;     XXX   XXX              XXXX              XXXX
;       XXXXX                 XX                XX
;       XXXXX
;       XXXXX  XXX   X  X   X   X   X  XXX  X  XX  XXX
;      X XXX XX   X XX X X X X X X X X  X  X X X X  X
;       XXXXXX  XX X X X X X X X X X X  X  X X X X  X
;        XXX X X   X X X X X X X X X X  X  X X X X  X
;       X X XX X   X X  XX  X   XX X X  X  X X X X  X
;        XXX X X   X X   X X X   X XXX  X  XXX XX   X
;       X X XX  XX X X   X X X   X X X  X  X X X X  X
;        XXX  X   X  X X X X X X X X X  X  X X X X  X
;         X    XXX  XXX X   X   X  X X  X  X X X X XXX
;


FatalRunLogoOne:
    .byte $00 ; |        | $733E
    .byte $08 ; |    X   | $733F
    .byte $1C ; |   XXX  | $7340
    .byte $2B ; |  X X XX| $7341
    .byte $1D ; |   XXX X| $7342
    .byte $2B ; |  X X XX| $7343
    .byte $1D ; |   XXX X| $7344
    .byte $3F ; |  XXXXXX| $7345
    .byte $5D ; | X XXX X| $7346
    .byte $3E ; |  XXXXX | $7347
    .byte $3E ; |  XXXXX | $7348
    .byte $3E ; |  XXXXX | $7349
    .byte $E3 ; |XXX   XX| $734A
    .byte $FF ; |XXXXXXXX| $734B
    .byte $EB ; |XXX X XX| $734C
    .byte $63 ; | XX   XX| $734D
    .byte $6B ; | XX X XX| $734E
    .byte $63 ; | XX   XX| $734F
    .byte $7F ; | XXXXXXX| $7350
    .byte $22 ; |  X   X | $7351
    .byte $3A ; |  XXX X | $7352
    .byte $22 ; |  X   X | $7353
    .byte $2E ; |  X XXX | $7354
    .byte $22 ; |  X   X | $7355
    .byte $3E ; |  XXXXX | $7356
    .byte $22 ; |  X   X | $7357
    .byte $2A ; |  X X X | $7358
    .byte $2A ; |  X X X | $7359
    .byte $2A ; |  X X X | $735A
    .byte $2A ; |  X X X | $735B
    .byte $3E ; |  XXXXX | $735C
    .byte $36 ; |  XX XX | $735D
    .byte $36 ; |  XX XX | $735E
    .byte $22 ; |  X   X | $735F
    .byte $22 ; |  X   X | $7360
    .byte $3E ; |  XXXXX | $7361
    .byte $3E ; |  XXXXX | $7362
    .byte $3A ; |  XXX X | $7363
    .byte $3E ; |  XXXXX | $7364
    .byte $1C ; |   XXX  | $7365
    .byte $1C ; |   XXX  | $7366
    .byte $1C ; |   XXX  | $7367
    .byte $1C ; |   XXX  | $7368
    .byte $1C ; |   XXX  | $7369
    .byte $1C ; |   XXX  | $736A
    .byte $08 ; |    X   | $736B
    .byte $14 ; |   X X  | $736C
    .byte $08 ; |    X   | $736D
    .byte $08 ; |    X   | $736E
    .byte $08 ; |    X   | $736F
FatalRunLogoTwo:
    .byte $00 ; |        | $7370
    .byte $73 ; | XXX  XX| $7371
    .byte $89 ; |X   X  X| $7372
    .byte $35 ; |  XX X X| $7373
    .byte $45 ; | X   X X| $7374
    .byte $45 ; | X   X X| $7375
    .byte $45 ; | X   X X| $7376
    .byte $35 ; |  XX X X| $7377
    .byte $8B ; |X   X XX| $7378
    .byte $71 ; | XXX   X| $7379
    .byte $00 ; |        | $737A
    .byte $00 ; |        | $737B
    .byte $80 ; |X       | $737C
    .byte $80 ; |X       | $737D
    .byte $80 ; |X       | $737E
    .byte $1C ; |   XXX  | $737F
    .byte $23 ; |  X   XX| $7380
    .byte $00 ; |        | $7381
    .byte $70 ; | XXX    | $7382
    .byte $04 ; |     X  | $7383
    .byte $03 ; |      XX| $7384
    .byte $00 ; |        | $7385
    .byte $00 ; |        | $7386
    .byte $00 ; |        | $7387
    .byte $00 ; |        | $7388
    .byte $0C ; |    XX  | $7389
    .byte $0C ; |    XX  | $738A
    .byte $0C ; |    XX  | $738B
    .byte $0C ; |    XX  | $738C
    .byte $0C ; |    XX  | $738D
    .byte $0F ; |    XXXX| $738E
    .byte $0C ; |    XX  | $738F
    .byte $0C ; |    XX  | $7390
    .byte $0C ; |    XX  | $7391
    .byte $0C ; |    XX  | $7392
    .byte $0C ; |    XX  | $7393
    .byte $07 ; |     XXX| $7394
    .byte $00 ; |        | $7395
    .byte $30 ; |  XX    | $7396
    .byte $30 ; |  XX    | $7397
    .byte $30 ; |  XX    | $7398
    .byte $30 ; |  XX    | $7399
    .byte $30 ; |  XX    | $739A
    .byte $30 ; |  XX    | $739B
    .byte $3E ; |  XXXXX | $739C
    .byte $30 ; |  XX    | $739D
    .byte $30 ; |  XX    | $739E
    .byte $30 ; |  XX    | $739F
    .byte $30 ; |  XX    | $73A0
    .byte $3F ; |  XXXXXX| $73A1
FatalRunLogoThree:
    .byte $00 ; |        | $73A2
    .byte $A2 ; |X X   X | $73A3
    .byte $55 ; | X X X X| $73A4
    .byte $15 ; |   X X X| $73A5
    .byte $15 ; |   X X X| $73A6
    .byte $32 ; |  XX  X | $73A7
    .byte $55 ; | X X X X| $73A8
    .byte $55 ; | X X X X| $73A9
    .byte $55 ; | X X X X| $73AA
    .byte $22 ; |  X   X | $73AB
    .byte $00 ; |        | $73AC
    .byte $00 ; |        | $73AD
    .byte $01 ; |       X| $73AE
    .byte $01 ; |       X| $73AF
    .byte $05 ; |     X X| $73B0
    .byte $06 ; |     XX | $73B1
    .byte $F7 ; |XXXX XXX| $73B2
    .byte $07 ; |     XXX| $73B3
    .byte $00 ; |        | $73B4
    .byte $03 ; |      XX| $73B5
    .byte $E2 ; |XXX   X | $73B6
    .byte $07 ; |     XXX| $73B7
    .byte $04 ; |     X  | $73B8
    .byte $00 ; |        | $73B9
    .byte $00 ; |        | $73BA
    .byte $67 ; | XX  XXX| $73BB
    .byte $6C ; | XX XX  | $73BC
    .byte $6C ; | XX XX  | $73BD
    .byte $6C ; | XX XX  | $73BE
    .byte $6C ; | XX XX  | $73BF
    .byte $CC ; |XX  XX  | $73C0
    .byte $6C ; | XX XX  | $73C1
    .byte $6C ; | XX XX  | $73C2
    .byte $6C ; | XX XX  | $73C3
    .byte $6C ; | XX XX  | $73C4
    .byte $6C ; | XX XX  | $73C5
    .byte $CC ; |XX  XX  | $73C6
    .byte $00 ; |        | $73C7
    .byte $31 ; |  XX   X| $73C8
    .byte $31 ; |  XX   X| $73C9
    .byte $31 ; |  XX   X| $73CA
    .byte $31 ; |  XX   X| $73CB
    .byte $3F ; |  XXXXXX| $73CC
    .byte $31 ; |  XX   X| $73CD
    .byte $31 ; |  XX   X| $73CE
    .byte $31 ; |  XX   X| $73CF
    .byte $31 ; |  XX   X| $73D0
    .byte $31 ; |  XX   X| $73D1
    .byte $31 ; |  XX   X| $73D2
    .byte $9F ; |X  XXXXX| $73D3
FatalRunLogoFour:
    .byte $00 ; |        | $73D4
    .byte $25 ; |  X  X X| $73D5
    .byte $55 ; | X X X X| $73D6
    .byte $15 ; |   X X X| $73D7
    .byte $17 ; |   X XXX| $73D8
    .byte $35 ; |  XX X X| $73D9
    .byte $55 ; | X X X X| $73DA
    .byte $55 ; | X X X X| $73DB
    .byte $55 ; | X X X X| $73DC
    .byte $22 ; |  X   X | $73DD
    .byte $00 ; |        | $73DE
    .byte $C0 ; |XX      | $73DF
    .byte $E0 ; |XXX     | $73E0
    .byte $E0 ; |XXX     | $73E1
    .byte $EF ; |XXX XXXX| $73E2
    .byte $DE ; |XX XXXX | $73E3
    .byte $3E ; |  XXXXX | $73E4
    .byte $FE ; |XXXXXXX | $73E5
    .byte $00 ; |        | $73E6
    .byte $FF ; |XXXXXXXX| $73E7
    .byte $62 ; | XX   X | $73E8
    .byte $1A ; |   XX X | $73E9
    .byte $06 ; |     XX | $73EA
    .byte $03 ; |      XX| $73EB
    .byte $00 ; |        | $73EC
    .byte $CC ; |XX  XX  | $73ED
    .byte $6C ; | XX XX  | $73EE
    .byte $6C ; | XX XX  | $73EF
    .byte $6C ; | XX XX  | $73F0
    .byte $6D ; | XX XX X| $73F1
    .byte $6D ; | XX XX X| $73F2
    .byte $6F ; | XX XXXX| $73F3
    .byte $6F ; | XX XXXX| $73F4
    .byte $6E ; | XX XXX | $73F5
    .byte $6E ; | XX XXX | $73F6
    .byte $6C ; | XX XX  | $73F7
    .byte $6C ; | XX XX  | $73F8
    .byte $00 ; |        | $73F9
    .byte $8C ; |X   XX  | $73FA
    .byte $8C ; |X   XX  | $73FB
    .byte $8C ; |X   XX  | $73FC
    .byte $8C ; |X   XX  | $73FD
    .byte $8C ; |X   XX  | $73FE
    .byte $8C ; |X   XX  | $73FF
    .byte $8C ; |X   XX  | $7400
    .byte $8C ; |X   XX  | $7401
    .byte $8C ; |X   XX  | $7402
    .byte $8C ; |X   XX  | $7403
    .byte $8C ; |X   XX  | $7404
    .byte $3F ; |  XXXXXX| $7405
FatalRunLogoFive:
    .byte $00 ; |        | $7406
    .byte $25 ; |  X  X X| $7407
    .byte $25 ; |  X  X X| $7408
    .byte $25 ; |  X  X X| $7409
    .byte $27 ; |  X  XXX| $740A
    .byte $25 ; |  X  X X| $740B
    .byte $25 ; |  X  X X| $740C
    .byte $25 ; |  X  X X| $740D
    .byte $25 ; |  X  X X| $740E
    .byte $72 ; | XXX  X | $740F
    .byte $00 ; |        | $7410
    .byte $00 ; |        | $7411
    .byte $00 ; |        | $7412
    .byte $00 ; |        | $7413
    .byte $FF ; |XXXXXXXX| $7414
    .byte $0F ; |    XXXX| $7415
    .byte $FF ; |XXXXXXXX| $7416
    .byte $FF ; |XXXXXXXX| $7417
    .byte $00 ; |        | $7418
    .byte $FF ; |XXXXXXXX| $7419
    .byte $13 ; |   X  XX| $741A
    .byte $14 ; |   X X  | $741B
    .byte $18 ; |   XX   | $741C
    .byte $E0 ; |XXX     | $741D
    .byte $00 ; |        | $741E
    .byte $60 ; | XX     | $741F
    .byte $60 ; | XX     | $7420
    .byte $E3 ; |XXX   XX| $7421
    .byte $E3 ; |XXX   XX| $7422
    .byte $E3 ; |XXX   XX| $7423
    .byte $E1 ; |XXX    X| $7424
    .byte $61 ; | XX    X| $7425
    .byte $60 ; | XX     | $7426
    .byte $60 ; | XX     | $7427
    .byte $60 ; | XX     | $7428
    .byte $60 ; | XX     | $7429
    .byte $60 ; | XX     | $742A
    .byte $60 ; | XX     | $742B
    .byte $63 ; | XX   XX| $742C
    .byte $63 ; | XX   XX| $742D
    .byte $63 ; | XX   XX| $742E
    .byte $63 ; | XX   XX| $742F
    .byte $7F ; | XXXXXXX| $7430
    .byte $63 ; | XX   XX| $7431
    .byte $63 ; | XX   XX| $7432
    .byte $63 ; | XX   XX| $7433
    .byte $63 ; | XX   XX| $7434
    .byte $63 ; | XX   XX| $7435
    .byte $63 ; | XX   XX| $7436
    .byte $3E ; |  XXXXX | $7437
FatalRunLogoSix:
    .byte $00 ; |        | $7438
    .byte $57 ; | X X XXX| $7439
    .byte $52 ; | X X  X | $743A
    .byte $52 ; | X X  X | $743B
    .byte $62 ; | XX   X | $743C
    .byte $52 ; | X X  X | $743D
    .byte $52 ; | X X  X | $743E
    .byte $52 ; | X X  X | $743F
    .byte $52 ; | X X  X | $7440
    .byte $67 ; | XX  XXX| $7441
    .byte $00 ; |        | $7442
    .byte $30 ; |  XX    | $7443
    .byte $78 ; | XXXX   | $7444
    .byte $78 ; | XXXX   | $7445
    .byte $7B ; | XXXX XX| $7446
    .byte $B7 ; |X XX XXX| $7447
    .byte $CF ; |XX  XXXX| $7448
    .byte $FE ; |XXXXXXX | $7449
    .byte $00 ; |        | $744A
    .byte $F0 ; |XXXX    | $744B
    .byte $00 ; |        | $744C
    .byte $00 ; |        | $744D
    .byte $00 ; |        | $744E
    .byte $00 ; |        | $744F
    .byte $00 ; |        | $7450
    .byte $00 ; |        | $7451
    .byte $00 ; |        | $7452
    .byte $26 ; |  X  XX | $7453
    .byte $26 ; |  X  XX | $7454
    .byte $AE ; |X X XXX | $7455
    .byte $AC ; |X X XX  | $7456
    .byte $AC ; |X X XX  | $7457
    .byte $A8 ; |X X X   | $7458
    .byte $A8 ; |X X X   | $7459
    .byte $A8 ; |X X X   | $745A
    .byte $A8 ; |X X X   | $745B
    .byte $00 ; |        | $745C
    .byte $00 ; |        | $745D
    .byte $7F ; | XXXXXXX| $745E
    .byte $60 ; | XX     | $745F
    .byte $60 ; | XX     | $7460
    .byte $60 ; | XX     | $7461
    .byte $60 ; | XX     | $7462
    .byte $60 ; | XX     | $7463
    .byte $60 ; | XX     | $7464
    .byte $60 ; | XX     | $7465
    .byte $60 ; | XX     | $7466
    .byte $60 ; | XX     | $7467
    .byte $60 ; | XX     | $7468
    .byte $60 ; | XX     | $7469

;           XX   XX  XXXXXX  XXX     XXX
;            XX  X    X   X   X   X   X
;            XX  X    X X      X  X  X
;            X X X    XXX      X X X X
;            X X X    X X      X X X X
;            X  XX    X         X   X
;            X  XX    X   X     X   X
;           XXX  XX  XXXXXX    XXX XXX

NewGfxOne:
    .byte $00 ; |        | $746A
    .byte $00 ; |        | $746B
    .byte $00 ; |        | $746C
    .byte $00 ; |        | $746D
    .byte $00 ; |        | $746E
    .byte $00 ; |        | $746F
    .byte $00 ; |        | $7470
    .byte $00 ; |        | $7471
    .byte $00 ; |        | $7472
    .byte $00 ; |        | $7473
    .byte $00 ; |        | $7474
NewGfxTwo:
    .byte $00 ; |        | $7475
    .byte $00 ; |        | $7476
    .byte $00 ; |        | $7477
    .byte $1C ; |   XXX  | $7478
    .byte $09 ; |    X  X| $7479
    .byte $09 ; |    X  X| $747A
    .byte $0A ; |    X X | $747B
    .byte $0A ; |    X X | $747C
    .byte $0C ; |    XX  | $747D
    .byte $0C ; |    XX  | $747E
    .byte $18 ; |   XX   | $747F
NewGfxThree:
    .byte $00 ; |        | $7480
    .byte $00 ; |        | $7481
    .byte $00 ; |        | $7482
    .byte $CF ; |XX  XXXX| $7483
    .byte $84 ; |X    X  | $7484
    .byte $84 ; |X    X  | $7485
    .byte $85 ; |X    X X| $7486
    .byte $87 ; |X    XXX| $7487
    .byte $85 ; |X    X X| $7488
    .byte $84 ; |X    X  | $7489
    .byte $CF ; |XX  XXXX| $748A
NewGfxFour:
    .byte $00 ; |        | $748B
    .byte $00 ; |        | $748C
    .byte $00 ; |        | $748D
    .byte $C3 ; |XX    XX| $748E
    .byte $41 ; | X     X| $748F
    .byte $01 ; |       X| $7490
    .byte $02 ; |      X | $7491
    .byte $02 ; |      X | $7492
    .byte $02 ; |      X | $7493
    .byte $44 ; | X   X  | $7494
    .byte $CE ; |XX  XXX | $7495
NewGfxFive:
    .byte $00 ; |        | $7496
    .byte $00 ; |        | $7497
    .byte $00 ; |        | $7498
    .byte $B8 ; |X XXX   | $7499
    .byte $10 ; |   X    | $749A
    .byte $10 ; |   X    | $749B
    .byte $A8 ; |X X X   | $749C
    .byte $A8 ; |X X X   | $749D
    .byte $48 ; | X  X   | $749E
    .byte $44 ; | X   X  | $749F
    .byte $0E ; |    XXX | $74A0
NewGfxSix:
    .byte $00 ; |        | $74A1
    .byte $00 ; |        | $74A2
    .byte $00 ; |        | $74A3
    .byte $00 ; |        | $74A4
    .byte $00 ; |        | $74A5
    .byte $00 ; |        | $74A6
    .byte $00 ; |        | $74A7
    .byte $00 ; |        | $74A8
    .byte $00 ; |        | $74A9
    .byte $00 ; |        | $74AA
    .byte $00 ; |        | $74AB

L74AC:
    jmp    L7637                 ; 3

L74AF:
    jsr    L7DCF                 ; 6
    ldy    sc_35|READ            ; 4
    iny                          ; 2
    beq    L74AC                 ; 2³
    lda    sc_7A|READ            ; 4
    cmp    #$88                  ; 2
    beq    L74AC                 ; 2³
    lda    L7CB6,Y               ; 4
    sta    sc_7E                 ; 4
    lda    #$00                  ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    ram_9B                ; 3
    sta    ram_9A                ; 3
    sta    ram_99                ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    ENABL                 ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    lda    #$FF                  ; 2
    sta    ram_92                ; 3
    jsr    L7ECC                 ; 6
L74E2:
    lda    #$03                  ; 2
    sta    VSYNC                 ; 3
    sta    RSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    VSYNC                 ; 3
    lda    #$03                  ; 2
    sta    VBLANK                ; 3
    lda    #$2D                  ; 2
    sta    TIM64T                ; 4
    inc    ram_92                ; 5
    lda    SWCHA                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_81                ; 3
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    bne    L750E                 ; 2³
    jmp    START_3|BANK_MASK     ; 3   bankswitch, goto L3242

L750E:
    ldy    #$01                  ; 2
    lda    #$03                  ; 2
    sta    sc_7D                 ; 4
    jsr    L7F50                 ; 6   bankswitch, goto LB112
    lda    #$01                  ; 2
    sta    CTRLPF                ; 3
    lda    ram_95                ; 3
    beq    L7524                 ; 2³
    dec    ram_95                ; 5
    bne    L752A                 ; 2³
L7524:
    lda    #$00                  ; 2
    sta    AUDC0                 ; 3
    sta    AUDV0                 ; 3
L752A:
    ldy    INTIM                 ; 4
    bne    L752A                 ; 2³
    lda    #$00                  ; 2
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    ldx    #$0A                  ; 2
L7545:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    L7545                 ; 2³
    jsr    L7B5D                 ; 6
    ldy    #$00                  ; 2
    lda    #$03                  ; 2
    sta    sc_7D                 ; 4
    jsr    L7F50                 ; 6   bankswitch, goto LB112
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUBK                ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    jsr    L7F32                 ; 6   bankswitch, goto L51C9
    lda    #$31                  ; 2
    sta    TIM64T                ; 4
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    lda    engineStatus|READ     ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_9C                ; 3
    lda    tireStatus|READ       ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_9D                ; 3
    lda    armorStatus|READ      ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_9E                ; 3
    lda    fuelStatus|READ       ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_9F                ; 3
    lda    #$07                  ; 2
    sta    ram_A0                ; 3
    lda    ram_92                ; 3
    and    #$07                  ; 2
    bne    L75D3                 ; 2³
    lda    ram_95                ; 3
    bne    L75D3                 ; 2³
    lda    ram_81                ; 3
    cmp    #$07                  ; 2
    beq    L75D0                 ; 2³
    cmp    #$0E                  ; 2
    beq    L75B6                 ; 2³
    cmp    #$0D                  ; 2
    beq    L75C2                 ; 2³
    jmp    L75D3                 ; 3

L75B6:
    dec    ram_9B                ; 5
    lda    ram_9B                ; 3
    bpl    L75D3                 ; 2³
    lda    #$04                  ; 2
    sta    ram_9B                ; 3
    bne    L75D3                 ; 3   always branch

L75C2:
    inc    ram_9B                ; 5
    lda    ram_9B                ; 3
    cmp    #$05                  ; 2
    bcc    L75D3                 ; 2³
    lda    #$00                  ; 2
    sta    ram_9B                ; 3
    beq    L75D3                 ; 3   always branch

L75D0:
    jsr    L7755                 ; 6
L75D3:
    bit    INPT4|$30             ; 3
    bmi    L75E1                 ; 2³
    lda    ram_9B                ; 3
    cmp    #$04                  ; 2
    bne    L75E1                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_99                ; 3
L75E1:
    ldy    ram_9B                ; 3
    lda    L7E55,Y               ; 4
    sta    ram_9A                ; 3
    lda    ram_99                ; 3
    bmi    L75F4                 ; 2³
L75EC:
    ldy    INTIM                 ; 4
    bne    L75EC                 ; 2³
    jmp    L74E2                 ; 3

L75F4:
    ldy    INTIM                 ; 4
    bne    L75F4                 ; 2³
    jsr    L7EB4                 ; 6
    sed                          ; 2
    clc                          ; 2
    lda    sc_06|READ            ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    adc    sc_01|READ            ; 4
    sta    sc_01                 ; 4
    bcc    L7616                 ; 2³
    lda    sc_00|READ            ; 4
    clc                          ; 2
    adc    #$01                  ; 2
    sta    sc_00                 ; 4
L7616:
    lda    sc_05|READ            ; 4
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    sc_01|READ            ; 4
    sta    sc_01                 ; 4
    bcc    L762E                 ; 2³
    lda    sc_00|READ            ; 4
    clc                          ; 2
    adc    #$01                  ; 2
    sta    sc_00                 ; 4
L762E:
    cld                          ; 2
    lda    #$00                  ; 2
    sta    sc_05                 ; 4
    sta    sc_06                 ; 4
L7637:
    jsr    L7EB4                 ; 6
    ldy    sc_35|READ            ; 4
    iny                          ; 2
    sty    sc_35                 ; 4
    lda    L7C3E,Y               ; 4
    sta    sc_2F                 ; 4
    lda    #$F0                  ; 2
    sta    ram_D6                ; 3
    lda    #$00                  ; 2
    sta    ram_80                ; 3
    jmp    L7652                 ; 3

L7652:
    ldy    #$26                  ; 2
  IF BONUS_LOSS
    sty    bonusStatus           ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
    ldy    #0                    ; 2
    sty    sc_53                 ; 4
    sty    sc_6F                 ; 4
    sty    sc_6E                 ; 4
    sty    ram_DD                ; 3
    sty    sc_52                 ; 4
    sty    ram_D1                ; 3
    sty    ram_D5                ; 3
    sty    ram_CF                ; 3
    sty    sc_03                 ; 4
    sty    ram_92                ; 3
    sty    VDELBL                ; 3
    sty    RESMP0                ; 3
    sty    RESMP1                ; 3
    sty    PF1                   ; 3
    sty    ram_C9                ; 3
    sty    ram_93                ; 3
    sty    ram_C8                ; 3
    sty    ram_D4                ; 3
    sty    ram_CE                ; 3
    sty    REFP0                 ; 3
    sty    REFP1                 ; 3
    sty    sc_05                 ; 4
    sty    sc_06                 ; 4
    sty    ram_80                ; 3
    sty    ram_DC                ; 3
    lda    #$02                  ; 2
    sta    ram_DE                ; 3
    lda    #$03                  ; 2
    sta    sc_0D                 ; 4
    sta    ram_C7                ; 3
    lda    #$F2                  ; 2
    sta    ram_CB                ; 3
    sta    ram_C3                ; 3
    sta    ram_D3                ; 3
    lda    #$48                  ; 2
    sta    ram_95                ; 3
    sta    ram_C4                ; 3
    lda    #$80                  ; 2
    sta    ram_8A                ; 3
    sta    ram_D7                ; 3
    ora    #$01                  ; 2
    sta    sc_4B                 ; 4
    lda    #$06                  ; 2
    sta    ram_D0                ; 3
    sta    ram_D6                ; 3
    lda    #$16                  ; 2
    sta    sc_0E                 ; 4
    lda    #$3C                  ; 2
    sta    ram_94                ; 3
    lda    #$20                  ; 2
    sta    NUSIZ0                ; 3
    sta    CTRLPF                ; 3
    lda    #$40                  ; 2
    sta    ram_84                ; 3
    lda    #$0A                  ; 2
    sta    ram_D2                ; 3
    lda    #$10                  ; 2
    sta    sc_04                 ; 4
    lda    ram_CA                ; 3
    and    #$BF                  ; 2
    sta    ram_CA                ; 3
    jmp    L710C                 ; 3

L76E1:
    ldy    #0                    ; 2
    sty    ram_D1                ; 3
    sty    ram_D5                ; 3
    sty    ram_92                ; 3
    sty    VDELBL                ; 3
    sty    RESMP0                ; 3
    sty    RESMP1                ; 3
    sty    PF1                   ; 3
    sty    ram_C9                ; 3
    sty    ram_93                ; 3
    sty    ram_C8                ; 3
    sty    ram_D4                ; 3
    sty    ram_CE                ; 3
    sty    REFP0                 ; 3
    sty    REFP1                 ; 3
    sty    sc_05                 ; 4
    sty    sc_06                 ; 4
    lda    #$03                  ; 2
    sta    sc_0D                 ; 4
    sta    ram_C7                ; 3
    lda    #$F2                  ; 2
    sta    ram_CB                ; 3
    sta    ram_C3                ; 3
    sta    ram_D3                ; 3
    lda    #$48                  ; 2
    sta    ram_95                ; 3
    sta    ram_C4                ; 3
    lda    #$80                  ; 2
    sta    sc_4B                 ; 4
    sta    ram_8A                ; 3
    sta    ram_D7                ; 3
    lda    #$06                  ; 2
    sta    ram_D0                ; 3
    lda    #$16                  ; 2
    sta    sc_0E                 ; 4
    lda    #$3C                  ; 2
    sta    ram_94                ; 3
    lda    #$20                  ; 2
    sta    NUSIZ0                ; 3
    sta    CTRLPF                ; 3
    lda    #$40                  ; 2
    sta    ram_84                ; 3
    lda    #$96                  ; 2
    sta    ram_D2                ; 3
    lda    #$01                  ; 2
    sta    sc_03                 ; 4
    lda    #$50                  ; 2
    sta    sc_04                 ; 4
    ldy    #$07                  ; 2
    sty    ram_CF                ; 3
    lda    ram_CA                ; 3
    ora    #$40                  ; 2
    sta    ram_CA                ; 3
    jmp    L710C                 ; 3

L7755:
    lda    #$02                  ; 2
    sta    ram_95                ; 3
    lda    sc_06|READ            ; 4
    bne    L7763                 ; 2³
    lda    sc_05|READ            ; 4
    beq    L77B1                 ; 2³
L7763:
    lda    ram_9B                ; 3
    cmp    #$04                  ; 2
    beq    L77B1                 ; 2³
    lda    #$0A                  ; 2
    sta    AUDC0                 ; 3
    sta    AUDV0                 ; 3
    lda    #$03                  ; 2
    sta    AUDF0                 ; 3
    lda    ram_9B                ; 3
    beq    L77BA                 ; 2³
    cmp    #$03                  ; 2
    beq    L7783                 ; 2³
    cmp    #$02                  ; 2
    beq    L77B4                 ; 2³
    cmp    #$01                  ; 2
    beq    L77B7                 ; 2³
L7783:
    lda    sc_05|READ            ; 4
    bne    L778F                 ; 2³
    lda    sc_06|READ            ; 4
    cmp    #$05                  ; 2
    bcc    L77B1                 ; 2³
L778F:
    ldx    fuelStatus|READ       ; 4
    cpx    #$61                  ; 2
    bcs    L77B1                 ; 2³
    inx                          ; 2
  IF FUEL_LOSS
    stx    fuelStatus            ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
    sed                          ; 2
    lda    sc_06|READ            ; 4
    sec                          ; 2
    sbc    #$05                  ; 2
    sta    sc_06                 ; 4
    bcs    L77AF                 ; 2³
    sec                          ; 2
    lda    sc_05|READ            ; 4
    sbc    #$01                  ; 2
    sta    sc_05                 ; 4
L77AF:
    cld                          ; 2
    rts                          ; 6

L77B1:
    jmp    L784D                 ; 3

L77B4:
    jmp    L77BD                 ; 3

L77B7:
    jmp    L77EE                 ; 3

L77BA:
    jmp    L781F                 ; 3

L77BD:
    lda    sc_05|READ            ; 4
    bne    L77C9                 ; 2³
    lda    sc_06|READ            ; 4
    cmp    #$0A                  ; 2
    bcc    L77EB                 ; 2³
L77C9:
    ldx    armorStatus|READ      ; 4
    cpx    #$7F                  ; 2
    bcs    L77EB                 ; 2³
    inx                          ; 2
  IF ARMOR_DAMAGE
    stx    armorStatus           ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
    sed                          ; 2
    lda    sc_06|READ            ; 4
    sec                          ; 2
    sbc    #$0A                  ; 2
    sta    sc_06                 ; 4
    bcs    L77E9                 ; 2³
    sec                          ; 2
    lda    sc_05|READ            ; 4
    sbc    #$01                  ; 2
    sta    sc_05                 ; 4
L77E9:
    cld                          ; 2
    rts                          ; 6

L77EB:
    jmp    L784D                 ; 3

L77EE:
    lda    sc_05|READ            ; 4
    bne    L77FA                 ; 2³
    lda    sc_06|READ            ; 4
    cmp    #$05                  ; 2
    bcc    L781C                 ; 2³+1
L77FA:
    ldx    tireStatus|READ       ; 4
    cpx    #$7F                  ; 2
    bcs    L781C                 ; 2³
    inx                          ; 2
  IF TIRE_DAMAGE
    stx    tireStatus            ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
    sed                          ; 2
    lda    sc_06|READ            ; 4
    sec                          ; 2
    sbc    #$05                  ; 2
    sta    sc_06                 ; 4
    bcs    L781A                 ; 2³
    sec                          ; 2
    lda    sc_05|READ            ; 4
    sbc    #$01                  ; 2
    sta    sc_05                 ; 4
L781A:
    cld                          ; 2
    rts                          ; 6

L781C:
    jmp    L784D                 ; 3

L781F:
    lda    sc_05|READ            ; 4
    bne    L782B                 ; 2³
    lda    sc_06|READ            ; 4
    cmp    #$0A                  ; 2
    bcc    L784D                 ; 2³
L782B:
    ldx    engineStatus|READ     ; 4
    cpx    #$7F                  ; 2
    bcs    L784D                 ; 2³
    inx                          ; 2
  IF ENGINE_DAMAGE
    stx    engineStatus          ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
    sed                          ; 2
    lda    sc_06|READ            ; 4
    sec                          ; 2
    sbc    #$0A                  ; 2
    sta    sc_06                 ; 4
    bcs    L784B                 ; 2³
    sec                          ; 2
    lda    sc_05|READ            ; 4
    sbc    #$01                  ; 2
    sta    sc_05                 ; 4
L784B:
    cld                          ; 2
    rts                          ; 6

L784D:
    cld                          ; 2
    lda    #$00                  ; 2
    sta    ram_95                ; 3
    sta    AUDC0                 ; 3
    sta    AUDV0                 ; 3
    rts                          ; 6

L7857:
    jmp    L7F56                 ; 3   bankswitch, goto LF777

L785A:
    ldy    sc_35|READ            ; 4
    cpy    #$1F                  ; 2
    beq    L7857                 ; 2³
    jsr    L7DCF                 ; 6
    ldx    #$00                  ; 2
    stx    sc_54                 ; 4
    stx    ram_84                ; 3
    stx    ram_92                ; 3
    stx    AUDC0                 ; 3
    stx    AUDC1                 ; 3
    lda    sc_52|READ            ; 4
    bmi    L787C                 ; 2³
    stx    sc_05                 ; 4
    stx    sc_06                 ; 4
L787C:
    stx    ram_E6                ; 3
    lda    sc_7A|READ            ; 4
    cmp    #$88                  ; 2
    bne    L7898                 ; 2³
    ldy    sc_35|READ            ; 4
    iny                          ; 2
    beq    L7898                 ; 2³
    lda    L7CB6,Y               ; 4
    sta    sc_7E                 ; 4
    lda    #$44                  ; 2
    sta    ram_E4                ; 3
    jmp    L7907                 ; 3

L7898:
    lda    bonusStatus|READ      ; 4
    tay                          ; 2
    asl                          ; 2
    sta    ram_AA                ; 3
    lda    #$30                  ; 2
    sta    ram_80                ; 3
    ldx    sc_35|READ            ; 4
    inx                          ; 2
    bne    L78B1                 ; 2³
    ldx    #$0C                  ; 2
    stx    sc_7E                 ; 4
    jmp    L7907                 ; 3

L78B1:
  IF BONUS_LOSS
    lda    L7CD6,Y               ; 4   get bonus message
  ELSE
    LDA    #0                    ;     bonus too high causes a glitch as index will load $3C from $7CFC
    NOP                          ;     correct to get best message
  ENDIF
    cmp    #$08                  ; 2
    bne    L78BA                 ; 2³
    lda    #$03                  ; 2
L78BA:
    sta    sc_7E                 ; 4
    sta    sc_56                 ; 4
    lda    sc_01|READ            ; 4
    and    #$03                  ; 2
    clc                          ; 2
    adc    #$04                  ; 2
    cpy    #$00                  ; 2
    bne    L78CE                 ; 2³
    lda    #$07                  ; 2
L78CE:
    sta    sc_57                 ; 4
    lda    #$FF                  ; 2
    sta    ram_82                ; 3
    ldx    #$17                  ; 2
    lda    tireStatus|READ       ; 4
    cmp    #$28                  ; 2
    bcs    L78E2                 ; 2³
    ldx    #$09                  ; 2
    inc    ram_82                ; 5
L78E2:
    lda    engineStatus|READ     ; 4
    cmp    #$2D                  ; 2
    bcs    L78ED                 ; 2³
    ldx    #$0A                  ; 2
    inc    ram_82                ; 5
L78ED:
    lda    armorStatus|READ      ; 4
    cmp    #$2D                  ; 2
    bcs    L78F8                 ; 2³
    ldx    #$08                  ; 2
    inc    ram_82                ; 5
L78F8:
    lda    ram_82                ; 3
    bmi    L7900                 ; 2³+1
    beq    L7900                 ; 2³+1
    ldx    #$0B                  ; 2
L7900:
    stx    sc_58                 ; 4
    lda    #$0F                  ; 2
    sta    ram_E6                ; 3
L7907:
    lda    #$03                  ; 2
    sta    VSYNC                 ; 3
    sta    RSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    VSYNC                 ; 3
    lda    #$03                  ; 2
    sta    VBLANK                ; 3
    lda    #$26                  ; 2
    sta    TIM64T                ; 4
    inc    ram_92                ; 5
    bne    L7926                 ; 2³
    inc    ram_84                ; 5
L7926:
    lda    sc_52|READ            ; 4
    bpl    L7942                 ; 2³
    lda    ram_92                ; 3
    and    #$01                  ; 2
    bne    L793E                 ; 2³
    lda    #$03                  ; 2
    sta    sc_7D                 ; 4
    ldy    #$01                  ; 2
    jsr    L7F50                 ; 6   bankswitch, goto LB112
    jmp    L795C                 ; 3

L793E:
    ldy    #$00                  ; 2
    sty    ram_80                ; 3
L7942:
    ldy    ram_80                ; 3
    beq    L795C                 ; 2³
    lda    #$04                  ; 2
    sta    AUDC0                 ; 3
    lda    #$06                  ; 2
    sta    AUDV0                 ; 3
    lda    L7D2D,Y               ; 4
    sta    AUDF0                 ; 3
    dey                          ; 2
    sty    ram_80                ; 3
    bne    L795C                 ; 2³
    lda    #$00                  ; 2
    sta    AUDV0                 ; 3
L795C:
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    bne    L7966                 ; 2³
    jmp    START_3|BANK_MASK     ; 3   bankswitch, goto L3242

L7966:
    ldy    INTIM                 ; 4
    bne    L7966                 ; 2³
    lda    #$00                  ; 2
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    RESBL                 ; 3
    lda    #$30                  ; 2
    sta    CTRLPF                ; 3
    lda    #$20                  ; 2
    sta    HMBL                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    #$0A                  ; 2
    lda    #$02                  ; 2
    sta    ENABL                 ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    HMCLR                 ; 3
L7992:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    L7992                 ; 2³
    stx    COLUPF                ; 3
    lda    #$03                  ; 2
    sta    sc_7D                 ; 4
    jsr    L7EFC                 ; 6   bankswitch, goto L537C
    lda    #$02                  ; 2
    sta    ENABL                 ; 3
    ldx    #$4B                  ; 2
    stx    ram_95                ; 3
    ldx    #$03                  ; 2
    stx    sc_7D                 ; 4
    ldx    #$67                  ; 2
    stx    ram_8A                ; 3
    jsr    L7F20                 ; 6   bankswitch, goto L57DA
    jsr    L7B5D                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    sc_2F|READ            ; 4
    lda    L7ED2,Y               ; 4
    sta    COLUBK                ; 3
    lda    #>CityGfxOne          ; 2
    sta    ram_8D                ; 3
    lda    #<CityGfxOne          ; 2
    sta    ram_8C                ; 3
    lda    #>CityGfxTwo          ; 2
    sta    ram_8F                ; 3
    lda    #<CityGfxTwo          ; 2
    sta    ram_8E                ; 3
    lda    #>CityGfxThree        ; 2
    sta    ram_91                ; 3
    lda    #<CityGfxThree        ; 2
    sta    ram_90                ; 3
    lda    #>CityGfxFour         ; 2
    sta    ram_89                ; 3
    lda    #<CityGfxFour         ; 2
    sta    ram_88                ; 3
    lda    #>CityGfxFive         ; 2
    sta    ram_87                ; 3
    lda    #<CityGfxFive         ; 2
    sta    ram_86                ; 3
    lda    #>CityGfxSix          ; 2
    sta    ram_83                ; 3
    lda    #<CityGfxSix          ; 2
    sta    ram_82                ; 3
    sta    WSYNC                 ; 3
    lda    #$02                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    ldx    #$2B                  ; 2
    stx    ram_8B                ; 3
    jsr    L7316                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    sc_52|READ            ; 4
    bpl    L7A0B                 ; 2³
    jmp    L7D5C                 ; 3

L7A0B:
    lda    #>SavedGfxOne         ; 2
    sta    ram_8D                ; 3
    lda    #<SavedGfxOne         ; 2
    sta    ram_8C                ; 3
    lda    #>SavedGfxTwo         ; 2
    sta    ram_8F                ; 3
    lda    #<SavedGfxTwo         ; 2
    sta    ram_8E                ; 3
    lda    #>SavedGfxThree       ; 2
    sta    ram_91                ; 3
    lda    #<SavedGfxThree       ; 2
    sta    ram_90                ; 3
    lda    #>SavedGfxFour        ; 2
    sta    ram_89                ; 3
    lda    #<SavedGfxFour        ; 2
    sta    ram_88                ; 3
    lda    #>SavedGfxFive        ; 2
    sta    ram_87                ; 3
    lda    #<SavedGfxFive        ; 2
    sta    ram_86                ; 3
    lda    #>SavedGfxSix         ; 2
    sta    ram_83                ; 3
    lda    #<SavedGfxSix         ; 2
    sta    ram_82                ; 3
    lda    #$92                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    ldx    #$05                  ; 2
    stx    ram_8B                ; 3
    jsr    L7316                 ; 6
    lda    #>BlankGfx            ; 2
    sta    ram_8D                ; 3
    sta    ram_8F                ; 3
    sta    ram_91                ; 3
    sta    ram_89                ; 3
    sta    ram_87                ; 3
    sta    ram_83                ; 3
    lda    #<BlankGfx            ; 2
    sta    ram_8C                ; 3
    sta    ram_8E                ; 3
    sta    ram_90                ; 3
    sta    ram_88                ; 3
    sta    ram_86                ; 3
    sta    ram_82                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$00                  ; 2
    lda    ram_AB,X              ; 4
    beq    L7ABB                 ; 2³
    lda    #>ManGfx              ; 2
    sta    ram_8D                ; 3
    lda    #<ManGfx              ; 2
    sta    ram_8C                ; 3
    inx                          ; 2
    lda    ram_AB,X              ; 4
    beq    L7ABB                 ; 2³
    lda    #>ManGfx              ; 2
    sta    ram_8F                ; 3
    lda    #<ManGfx              ; 2
    sta    ram_8E                ; 3
    inx                          ; 2
    lda    ram_AB,X              ; 4
    beq    L7ABB                 ; 2³
    lda    #>ManGfx              ; 2
    sta    ram_91                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #<ManGfx              ; 2
    sta    ram_90                ; 3
    inx                          ; 2
    lda    ram_AB,X              ; 4
    beq    L7ABD                 ; 2³
    lda    #>ManGfx              ; 2
    sta    ram_89                ; 3
    lda    #<ManGfx              ; 2
    sta    ram_88                ; 3
    inx                          ; 2
    lda    ram_AB,X              ; 4
    beq    L7ABD                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #>ManGfx              ; 2
    sta    ram_87                ; 3
    lda    #<ManGfx              ; 2
    sta    ram_86                ; 3
    inx                          ; 2
    lda    ram_AB,X              ; 4
    beq    L7ABF                 ; 2³
    lda    #>ManGfx              ; 2
    sta    ram_83                ; 3
    lda    #<ManGfx              ; 2
    sta    ram_82                ; 3
    bne    L7ABF                 ; 3   always branch

L7ABB:
    sta    WSYNC                 ; 3
L7ABD:
    sta    WSYNC                 ; 3
L7ABF:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$0F                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    ldx    #$09                  ; 2
    stx    ram_8B                ; 3
    jsr    L7316                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    lda    #$0A                  ; 2
    sta    sc_7D                 ; 4
    jsr    L7F32                 ; 6   bankswitch, goto L51C9
    ldx    #$10                  ; 2
L7ADE:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    L7ADE                 ; 2³
    lda    #$2B                  ; 2
    sta    TIM64T                ; 4
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    ram_80                ; 3
    beq    L7AF7                 ; 2³
    jmp    L7B3F                 ; 3

L7AF7:
    lda    ram_AB                ; 3
    beq    L7B24                 ; 2³+1
    ldx    #$05                  ; 2
L7AFD:
    lda    ram_AB,X              ; 4
    bne    L7B04                 ; 2³
    dex                          ; 2
    bpl    L7AFD                 ; 2³+1
L7B04:
    lda    #$00                  ; 2
    sta    ram_AB,X              ; 4
    lda    #$14                  ; 2
    sta    ram_80                ; 3
    sed                          ; 2
    lda    sc_06|READ            ; 4
    clc                          ; 2
    adc    #$25                  ; 2
    sta    sc_06                 ; 4
    bcc    L7B20                 ; 2³
    lda    sc_05|READ            ; 4
    adc    #$00                  ; 2
    sta    sc_05                 ; 4
L7B20:
    cld                          ; 2
    jmp    L7B3F                 ; 3

L7B24:
    lda    ram_AB                ; 3
    bne    L7B3F                 ; 2³
    lda    ram_AA                ; 3
    beq    L7B3F                 ; 2³
    jsr    L7E31                 ; 6
    ldy    #$05                  ; 2
    ldx    #$00                  ; 2
    lda    #$01                  ; 2
L7B35:
    sta    ram_AB,X              ; 4
    dec    ram_AA                ; 5
    beq    L7B3F                 ; 2³
    inx                          ; 2
    dey                          ; 2
    bpl    L7B35                 ; 2³
L7B3F:
    lda    ram_AA                ; 3
    bne    L7B48                 ; 2³
    jsr    L7E41                 ; 6
    bcs    L7B50                 ; 2³
L7B48:
    ldy    INTIM                 ; 4
    bne    L7B48                 ; 2³
    jmp    L7907                 ; 3

L7B50:
    ldy    INTIM                 ; 4
    bne    L7B50                 ; 2³
    lda    #$FF                  ; 2
    sta    sc_52                 ; 4
    jmp    L785A                 ; 3

L7B5D:
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ENAM0                 ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    #$03                  ; 2
    sta    VDELP1                ; 3
    sta    VDELP0                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    HMCLR                 ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

;         X
;         X
;         X
;        X X
;         X
;        XXX
;                         XXXXXXX
;                        X     XX
;                        XXXXXX X
;                        XX X X X
;             X          XXXXXX X
;           X            X X XX X
;              X         XXXXXX X
;                        XX X X X
;            X           XXXXXX X
;        X               X X XX X
;             X          XXXXXX X
;          X             XX X X X
;       X                XXXXXX X
;       X                X X XX X
;       X   X            XXXXXX X
;       X      X         XX X X X
;       X X              XXXXXX X   XXXXXXXXXXXXXXX
;       X X   X          X X XX X  X             XX
;       X X    X         XXXXXX X XXXXXXXXXXXXXXX X
;       X X  X           XX X X X X             X X
;       X X              XXXXXX X X   X   X   X X X
;       X X X            X X XX X X X   X   X   X X
;       X X X            XXXXXX X X             X X
;       X X X            XX X X X XXXXXXXXXXXXXXX X
;       X X X            XXXXXX X XXXXXXXXXXXXXXX X
;       X X X            X X XX X X X X X X X X X X
;       X X X            XXXXXX X X X X X X X X X X
;       X X X            XX X X X XXXXXXXXXXXXXXX X
;       X X X            XXXXXX X XXXXXXXXXXXXXXX X
;       X X X            X X XX X X X X X X X X X X
;       X X X            XXXXXX X X X X X X X X X X
;       XXXXXXXXXXXXX    XX X X X XXXXXXXXXXXXXXX X
;      X           XX    XXXXXX X XXXXXXXXXXXXXXX X
;      XXXXXXXXXXXX X    X X XX X X X X X X X X X X
;      X X X X X XX X    XXXXXX X X X X X X X X X X
;      X X X X X XX X    XX X X X XXXXXXXXXXXXXXX X
;      XXXXXXXXXXXX X X  XXXXXX X XXXXXXXXXXXXXXX X
;      XX X X X X X X  X X X XX X X             X X
;      XX X X X X X X  X XXXXXX X XXXXXXXXXXXXXXX X
;      XXXXXXXXXXXX X  X X  X X X XXXXXXXXXXXXXXX X
;      XXXXXXXXXXXXX XXXXX  X X XXXXXXXXXXXXXXXXX XXXX
;                      X X  X XX  XXXXXXXXXXXXXXXX
;     XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;

CityGfxOne:
    .byte $00 ; |        | $7B8E
    .byte $FF ; |XXXXXXXX| $7B8F
    .byte $00 ; |        | $7B90
    .byte $7F ; | XXXXXXX| $7B91
    .byte $7F ; | XXXXXXX| $7B92
    .byte $6A ; | XX X X | $7B93
    .byte $6A ; | XX X X | $7B94
    .byte $7F ; | XXXXXXX| $7B95
    .byte $55 ; | X X X X| $7B96
    .byte $55 ; | X X X X| $7B97
    .byte $7F ; | XXXXXXX| $7B98
    .byte $40 ; | X      | $7B99
    .byte $3F ; |  XXXXXX| $7B9A
    .byte $2A ; |  X X X | $7B9B
    .byte $2A ; |  X X X | $7B9C
    .byte $2A ; |  X X X | $7B9D
    .byte $2A ; |  X X X | $7B9E
    .byte $2A ; |  X X X | $7B9F
    .byte $2A ; |  X X X | $7BA0
    .byte $2A ; |  X X X | $7BA1
    .byte $2A ; |  X X X | $7BA2
    .byte $2A ; |  X X X | $7BA3
    .byte $2A ; |  X X X | $7BA4
    .byte $28 ; |  X X   | $7BA5
    .byte $29 ; |  X X  X| $7BA6
    .byte $28 ; |  X X   | $7BA7
    .byte $28 ; |  X X   | $7BA8
    .byte $28 ; |  X X   | $7BA9
    .byte $20 ; |  X     | $7BAA
    .byte $22 ; |  X   X | $7BAB
    .byte $20 ; |  X     | $7BAC
    .byte $20 ; |  X     | $7BAD
    .byte $04 ; |     X  | $7BAE
    .byte $00 ; |        | $7BAF
    .byte $10 ; |   X    | $7BB0
    .byte $01 ; |       X| $7BB1
    .byte $00 ; |        | $7BB2
    .byte $00 ; |        | $7BB3
    .byte $02 ; |      X | $7BB4
    .byte $00 ; |        | $7BB5
    .byte $00 ; |        | $7BB6
    .byte $00 ; |        | $7BB7
    .byte $00 ; |        | $7BB8
    .byte $00 ; |        | $7BB9
CityGfxTwo:
    .byte $00 ; |        | $7BBA
    .byte $FF ; |XXXXXXXX| $7BBB
    .byte $00 ; |        | $7BBC
    .byte $FD ; |XXXXXX X| $7BBD
    .byte $FA ; |XXXXX X | $7BBE
    .byte $AA ; |X X X X | $7BBF
    .byte $AA ; |X X X X | $7BC0
    .byte $FA ; |XXXXX X | $7BC1
    .byte $5A ; | X XX X | $7BC2
    .byte $5A ; | X XX X | $7BC3
    .byte $FA ; |XXXXX X | $7BC4
    .byte $06 ; |     XX | $7BC5
    .byte $FE ; |XXXXXXX | $7BC6
    .byte $00 ; |        | $7BC7
    .byte $00 ; |        | $7BC8
    .byte $00 ; |        | $7BC9
    .byte $00 ; |        | $7BCA
    .byte $00 ; |        | $7BCB
    .byte $00 ; |        | $7BCC
    .byte $00 ; |        | $7BCD
    .byte $00 ; |        | $7BCE
    .byte $00 ; |        | $7BCF
    .byte $00 ; |        | $7BD0
    .byte $00 ; |        | $7BD1
    .byte $00 ; |        | $7BD2
    .byte $40 ; | X      | $7BD3
    .byte $80 ; |X       | $7BD4
    .byte $00 ; |        | $7BD5
    .byte $40 ; | X      | $7BD6
    .byte $00 ; |        | $7BD7
    .byte $00 ; |        | $7BD8
    .byte $00 ; |        | $7BD9
    .byte $00 ; |        | $7BDA
    .byte $80 ; |X       | $7BDB
    .byte $00 ; |        | $7BDC
    .byte $00 ; |        | $7BDD
    .byte $00 ; |        | $7BDE
    .byte $40 ; | X      | $7BDF
    .byte $00 ; |        | $7BE0
    .byte $80 ; |X       | $7BE1
    .byte $00 ; |        | $7BE2
    .byte $00 ; |        | $7BE3
    .byte $00 ; |        | $7BE4
    .byte $00 ; |        | $7BE5
CityGfxThree:
    .byte $00 ; |        | $7BE6
    .byte $FF ; |XXXXXXXX| $7BE7
    .byte $52 ; | X X  X | $7BE8
    .byte $F2 ; |XXXX  X | $7BE9
    .byte $52 ; | X X  X | $7BEA
    .byte $5F ; | X XXXXX| $7BEB
    .byte $55 ; | X X X X| $7BEC
    .byte $9F ; |X  XXXXX| $7BED
    .byte $1A ; |   XX X | $7BEE
    .byte $1F ; |   XXXXX| $7BEF
    .byte $15 ; |   X X X| $7BF0
    .byte $1F ; |   XXXXX| $7BF1
    .byte $1A ; |   XX X | $7BF2
    .byte $1F ; |   XXXXX| $7BF3
    .byte $15 ; |   X X X| $7BF4
    .byte $1F ; |   XXXXX| $7BF5
    .byte $1A ; |   XX X | $7BF6
    .byte $1F ; |   XXXXX| $7BF7
    .byte $15 ; |   X X X| $7BF8
    .byte $1F ; |   XXXXX| $7BF9
    .byte $1A ; |   XX X | $7BFA
    .byte $1F ; |   XXXXX| $7BFB
    .byte $15 ; |   X X X| $7BFC
    .byte $1F ; |   XXXXX| $7BFD
    .byte $1A ; |   XX X | $7BFE
    .byte $1F ; |   XXXXX| $7BFF
    .byte $15 ; |   X X X| $7C00
    .byte $1F ; |   XXXXX| $7C01
    .byte $1A ; |   XX X | $7C02
    .byte $1F ; |   XXXXX| $7C03
    .byte $15 ; |   X X X| $7C04
    .byte $1F ; |   XXXXX| $7C05
    .byte $1A ; |   XX X | $7C06
    .byte $1F ; |   XXXXX| $7C07
    .byte $15 ; |   X X X| $7C08
    .byte $1F ; |   XXXXX| $7C09
    .byte $1A ; |   XX X | $7C0A
    .byte $1F ; |   XXXXX| $7C0B
    .byte $15 ; |   X X X| $7C0C
    .byte $1F ; |   XXXXX| $7C0D
    .byte $1A ; |   XX X | $7C0E
    .byte $1F ; |   XXXXX| $7C0F
    .byte $10 ; |   X    | $7C10
    .byte $0F ; |    XXXX| $7C11
CityGfxFour:
    .byte $00 ; |        | $7C12
    .byte $FF ; |XXXXXXXX| $7C13
    .byte $CF ; |XX  XXXX| $7C14
    .byte $BF ; |X XXXXXX| $7C15
    .byte $AF ; |X X XXXX| $7C16
    .byte $AF ; |X X XXXX| $7C17
    .byte $A8 ; |X X X   | $7C18
    .byte $AF ; |X X XXXX| $7C19
    .byte $AF ; |X X XXXX| $7C1A
    .byte $AA ; |X X X X | $7C1B
    .byte $AA ; |X X X X | $7C1C
    .byte $AF ; |X X XXXX| $7C1D
    .byte $AF ; |X X XXXX| $7C1E
    .byte $AA ; |X X X X | $7C1F
    .byte $AA ; |X X X X | $7C20
    .byte $AF ; |X X XXXX| $7C21
    .byte $AF ; |X X XXXX| $7C22
    .byte $AA ; |X X X X | $7C23
    .byte $AA ; |X X X X | $7C24
    .byte $AF ; |X X XXXX| $7C25
    .byte $AF ; |X X XXXX| $7C26
    .byte $A8 ; |X X X   | $7C27
    .byte $AA ; |X X X X | $7C28
    .byte $A8 ; |X X X   | $7C29
    .byte $A8 ; |X X X   | $7C2A
    .byte $AF ; |X X XXXX| $7C2B
    .byte $A4 ; |X X  X  | $7C2C
    .byte $A3 ; |X X   XX| $7C2D
    .byte $A0 ; |X X     | $7C2E
    .byte $A0 ; |X X     | $7C2F
    .byte $A0 ; |X X     | $7C30
    .byte $A0 ; |X X     | $7C31
    .byte $A0 ; |X X     | $7C32
    .byte $A0 ; |X X     | $7C33
    .byte $A0 ; |X X     | $7C34
    .byte $A0 ; |X X     | $7C35
    .byte $A0 ; |X X     | $7C36
    .byte $A0 ; |X X     | $7C37
    .byte $A0 ; |X X     | $7C38
    .byte $A0 ; |X X     | $7C39
    .byte $A0 ; |X X     | $7C3A
    .byte $A0 ; |X X     | $7C3B
    .byte $60 ; | XX     | $7C3C
    .byte $E0 ; |XXX     | $7C3D
L7C3E:
    .byte $03 ; |      XX| $7C3E
    .byte $02 ; |      X | $7C3F
    .byte $01 ; |       X| $7C40
    .byte $00 ; |        | $7C41
    .byte $04 ; |     X  | $7C42
    .byte $03 ; |      XX| $7C43
    .byte $02 ; |      X | $7C44
    .byte $01 ; |       X| $7C45
    .byte $00 ; |        | $7C46
    .byte $04 ; |     X  | $7C47
    .byte $03 ; |      XX| $7C48
    .byte $02 ; |      X | $7C49
    .byte $01 ; |       X| $7C4A
    .byte $00 ; |        | $7C4B
    .byte $04 ; |     X  | $7C4C
    .byte $03 ; |      XX| $7C4D
    .byte $02 ; |      X | $7C4E
    .byte $01 ; |       X| $7C4F
    .byte $00 ; |        | $7C50
    .byte $04 ; |     X  | $7C51
    .byte $03 ; |      XX| $7C52
    .byte $02 ; |      X | $7C53
    .byte $01 ; |       X| $7C54
    .byte $00 ; |        | $7C55
    .byte $04 ; |     X  | $7C56
    .byte $03 ; |      XX| $7C57
    .byte $02 ; |      X | $7C58
    .byte $01 ; |       X| $7C59
    .byte $00 ; |        | $7C5A
    .byte $04 ; |     X  | $7C5B
    .byte $03 ; |      XX| $7C5C
    .byte $02 ; |      X | $7C5D
CityGfxFive:
    .byte $00 ; |        | $7C5E
    .byte $FF ; |XXXXXXXX| $7C5F
    .byte $FF ; |XXXXXXXX| $7C60
    .byte $FF ; |XXXXXXXX| $7C61
    .byte $FF ; |XXXXXXXX| $7C62
    .byte $FF ; |XXXXXXXX| $7C63
    .byte $00 ; |        | $7C64
    .byte $FF ; |XXXXXXXX| $7C65
    .byte $FF ; |XXXXXXXX| $7C66
    .byte $AA ; |X X X X | $7C67
    .byte $AA ; |X X X X | $7C68
    .byte $FF ; |XXXXXXXX| $7C69
    .byte $FF ; |XXXXXXXX| $7C6A
    .byte $AA ; |X X X X | $7C6B
    .byte $AA ; |X X X X | $7C6C
    .byte $FF ; |XXXXXXXX| $7C6D
    .byte $FF ; |XXXXXXXX| $7C6E
    .byte $AA ; |X X X X | $7C6F
    .byte $AA ; |X X X X | $7C70
    .byte $FF ; |XXXXXXXX| $7C71
    .byte $FF ; |XXXXXXXX| $7C72
    .byte $00 ; |        | $7C73
    .byte $22 ; |  X   X | $7C74
    .byte $88 ; |X   X   | $7C75
    .byte $00 ; |        | $7C76
    .byte $FF ; |XXXXXXXX| $7C77
    .byte $00 ; |        | $7C78
    .byte $FF ; |XXXXXXXX| $7C79
    .byte $00 ; |        | $7C7A
    .byte $00 ; |        | $7C7B
    .byte $00 ; |        | $7C7C
    .byte $00 ; |        | $7C7D
    .byte $00 ; |        | $7C7E
    .byte $00 ; |        | $7C7F
    .byte $00 ; |        | $7C80
    .byte $00 ; |        | $7C81
    .byte $00 ; |        | $7C82
    .byte $00 ; |        | $7C83
    .byte $00 ; |        | $7C84
    .byte $00 ; |        | $7C85
    .byte $00 ; |        | $7C86
    .byte $00 ; |        | $7C87
    .byte $00 ; |        | $7C88
    .byte $00 ; |        | $7C89
CityGfxSix:
    .byte $00 ; |        | $7C8A
    .byte $FF ; |XXXXXXXX| $7C8B
    .byte $F0 ; |XXXX    | $7C8C
    .byte $EF ; |XXX XXXX| $7C8D
    .byte $E8 ; |XXX X   | $7C8E
    .byte $E8 ; |XXX X   | $7C8F
    .byte $28 ; |  X X   | $7C90
    .byte $E8 ; |XXX X   | $7C91
    .byte $E8 ; |XXX X   | $7C92
    .byte $A8 ; |X X X   | $7C93
    .byte $A8 ; |X X X   | $7C94
    .byte $E8 ; |XXX X   | $7C95
    .byte $E8 ; |XXX X   | $7C96
    .byte $A8 ; |X X X   | $7C97
    .byte $A8 ; |X X X   | $7C98
    .byte $E8 ; |XXX X   | $7C99
    .byte $E8 ; |XXX X   | $7C9A
    .byte $A8 ; |X X X   | $7C9B
    .byte $A8 ; |X X X   | $7C9C
    .byte $E8 ; |XXX X   | $7C9D
    .byte $E8 ; |XXX X   | $7C9E
    .byte $28 ; |  X X   | $7C9F
    .byte $28 ; |  X X   | $7CA0
    .byte $A8 ; |X X X   | $7CA1
    .byte $28 ; |  X X   | $7CA2
    .byte $E8 ; |XXX X   | $7CA3
    .byte $18 ; |   XX   | $7CA4
    .byte $F8 ; |XXXXX   | $7CA5
    .byte $00 ; |        | $7CA6
    .byte $00 ; |        | $7CA7
    .byte $00 ; |        | $7CA8
    .byte $00 ; |        | $7CA9
    .byte $00 ; |        | $7CAA
    .byte $00 ; |        | $7CAB
    .byte $00 ; |        | $7CAC
    .byte $00 ; |        | $7CAD
    .byte $00 ; |        | $7CAE
    .byte $00 ; |        | $7CAF
    .byte $00 ; |        | $7CB0
    .byte $00 ; |        | $7CB1
    .byte $00 ; |        | $7CB2
    .byte $00 ; |        | $7CB3
    .byte $00 ; |        | $7CB4
    .byte $00 ; |        | $7CB5
L7CB6:
    .byte $15 ; |   X X X| $7CB6
    .byte $15 ; |   X X X| $7CB7
    .byte $15 ; |   X X X| $7CB8
    .byte $0E ; |    XXX | $7CB9
    .byte $15 ; |   X X X| $7CBA
    .byte $15 ; |   X X X| $7CBB
    .byte $15 ; |   X X X| $7CBC
    .byte $0F ; |    XXXX| $7CBD
    .byte $15 ; |   X X X| $7CBE
    .byte $15 ; |   X X X| $7CBF
    .byte $15 ; |   X X X| $7CC0
    .byte $10 ; |   X    | $7CC1
    .byte $15 ; |   X X X| $7CC2
    .byte $15 ; |   X X X| $7CC3
    .byte $15 ; |   X X X| $7CC4
    .byte $11 ; |   X   X| $7CC5
    .byte $15 ; |   X X X| $7CC6
    .byte $15 ; |   X X X| $7CC7
    .byte $15 ; |   X X X| $7CC8
    .byte $12 ; |   X  X | $7CC9
    .byte $15 ; |   X X X| $7CCA
    .byte $15 ; |   X X X| $7CCB
    .byte $15 ; |   X X X| $7CCC
    .byte $13 ; |   X  XX| $7CCD
    .byte $15 ; |   X X X| $7CCE
    .byte $15 ; |   X X X| $7CCF
    .byte $15 ; |   X X X| $7CD0
    .byte $14 ; |   X X  | $7CD1
    .byte $15 ; |   X X X| $7CD2
    .byte $15 ; |   X X X| $7CD3
    .byte $15 ; |   X X X| $7CD4
    .byte $15 ; |   X X X| $7CD5
L7CD6:
    .byte $08 ; |    X   | $7CD6
    .byte $03 ; |      XX| $7CD7
    .byte $03 ; |      XX| $7CD8
    .byte $03 ; |      XX| $7CD9
    .byte $03 ; |      XX| $7CDA
    .byte $03 ; |      XX| $7CDB
    .byte $02 ; |      X | $7CDC
    .byte $02 ; |      X | $7CDD
    .byte $02 ; |      X | $7CDE
    .byte $01 ; |       X| $7CDF
    .byte $01 ; |       X| $7CE0
    .byte $01 ; |       X| $7CE1
    .byte $00 ; |        | $7CE2
    .byte $00 ; |        | $7CE3
    .byte $00 ; |        | $7CE4
    .byte $D4 ; |XX X X  | $7CE5
    .byte $00 ; |        | $7CE6
    .byte $06 ; |     XX | $7CE7
    .byte $42 ; | X    X | $7CE8
    .byte $F4 ; |XXXX X  | $7CE9
    .byte $44 ; | X   X  | $7CEA
    .byte $46 ; | X   XX | $7CEB
    .byte $48 ; | X  X   | $7CEC
    .byte $F4 ; |XXXX X  | $7CED
    .byte $26 ; |  X  XX | $7CEE
    .byte $28 ; |  X X   | $7CEF
    .byte $56 ; | X X XX | $7CF0
    .byte $66 ; | XX  XX | $7CF1
    .byte $76 ; | XXX XX | $7CF2
    .byte $B8 ; |X XXX   | $7CF3
    .byte $88 ; |X   X   | $7CF4

;      XXXXXX    XXXX  XXX  X   X XXXXX XXXX    XXXXXX
;       X    X  X     X   X X   X X     X   X  X    X
;        XXXXXX  XXX  XXXXX X   X XXXX  X   X XXXXXX
;       X    X      X X   X  X X  X     X   X  X    X
;      XXXXXX   XXXX  X   X   X   XXXXX XXXX    XXXXXX
;

SavedGfxOne:
    .byte $00 ; |        | $7CF5
    .byte $7E ; | XXXXXX | $7CF6
    .byte $21 ; |  X    X| $7CF7
    .byte $1F ; |   XXXXX| $7CF8
    .byte $21 ; |  X    X| $7CF9
    .byte $7E ; | XXXXXX | $7CFA
SavedGfxTwo:
    .byte $00 ; |        | $7CFB
    .byte $3C ; |  XXXX  | $7CFC
    .byte $02 ; |      X | $7CFD
    .byte $9C ; |X  XXX  | $7CFE
    .byte $20 ; |  X     | $7CFF
    .byte $1E ; |   XXXX | $7D00
SavedGfxThree:
    .byte $00 ; |        | $7D01
    .byte $88 ; |X   X   | $7D02
    .byte $89 ; |X   X  X| $7D03
    .byte $FA ; |XXXXX X | $7D04
    .byte $8A ; |X   X X | $7D05
    .byte $72 ; | XXX  X | $7D06
SavedGfxFour:
    .byte $00 ; |        | $7D07
    .byte $8F ; |X   XXXX| $7D08
    .byte $48 ; | X  X   | $7D09
    .byte $2F ; |  X XXXX| $7D0A
    .byte $28 ; |  X X   | $7D0B
    .byte $2F ; |  X XXXX| $7D0C
SavedGfxFive:
    .byte $00 ; |        | $7D0D
    .byte $BC ; |X XXXX  | $7D0E
    .byte $22 ; |  X   X | $7D0F
    .byte $22 ; |  X   X | $7D10
    .byte $22 ; |  X   X | $7D11
    .byte $BC ; |X XXXX  | $7D12
SavedGfxSix:
    .byte $00 ; |        | $7D13
    .byte $3F ; |  XXXXXX| $7D14
    .byte $42 ; | X    X | $7D15
    .byte $FC ; |XXXXXX  | $7D16
    .byte $42 ; | X    X | $7D17
    .byte $3F ; |  XXXXXX| $7D18
ManGfx:
    .byte $00 ; |        | $7D19
    .byte $84 ; |X    X  | $7D1A
    .byte $48 ; | X  X   | $7D1B
    .byte $30 ; |  XX    | $7D1C
    .byte $30 ; |  XX    | $7D1D
    .byte $B4 ; |X XX X  | $7D1E
    .byte $78 ; | XXXX   | $7D1F
    .byte $00 ; |        | $7D20
    .byte $30 ; |  XX    | $7D21
    .byte $30 ; |  XX    | $7D22
BlankGfx:
    .byte $00 ; |        | $7D23
    .byte $00 ; |        | $7D24
    .byte $00 ; |        | $7D25
    .byte $00 ; |        | $7D26
    .byte $00 ; |        | $7D27
    .byte $00 ; |        | $7D28
    .byte $00 ; |        | $7D29
    .byte $00 ; |        | $7D2A
    .byte $00 ; |        | $7D2B
    .byte $00 ; |        | $7D2C
L7D2D:
    .byte $00 ; |        | $7D2D
    .byte $00 ; |        | $7D2E
    .byte $00 ; |        | $7D2F
    .byte $00 ; |        | $7D30
    .byte $00 ; |        | $7D31
    .byte $00 ; |        | $7D32
    .byte $00 ; |        | $7D33
    .byte $00 ; |        | $7D34
    .byte $00 ; |        | $7D35
    .byte $00 ; |        | $7D36
    .byte $00 ; |        | $7D37
    .byte $1F ; |   XXXXX| $7D38
    .byte $1F ; |   XXXXX| $7D39
    .byte $1F ; |   XXXXX| $7D3A
    .byte $1F ; |   XXXXX| $7D3B
    .byte $1F ; |   XXXXX| $7D3C
    .byte $1F ; |   XXXXX| $7D3D
    .byte $1F ; |   XXXXX| $7D3E
    .byte $1F ; |   XXXXX| $7D3F
    .byte $1F ; |   XXXXX| $7D40
    .byte $00 ; |        | $7D41
    .byte $00 ; |        | $7D42
    .byte $00 ; |        | $7D43
    .byte $00 ; |        | $7D44
    .byte $00 ; |        | $7D45
    .byte $00 ; |        | $7D46
    .byte $00 ; |        | $7D47
    .byte $00 ; |        | $7D48
    .byte $00 ; |        | $7D49
    .byte $00 ; |        | $7D4A
    .byte $00 ; |        | $7D4B
    .byte $00 ; |        | $7D4C
    .byte $00 ; |        | $7D4D
    .byte $00 ; |        | $7D4E
    .byte $00 ; |        | $7D4F
    .byte $00 ; |        | $7D50
    .byte $00 ; |        | $7D51
    .byte $00 ; |        | $7D52
    .byte $00 ; |        | $7D53
    .byte $00 ; |        | $7D54
    .byte $00 ; |        | $7D55
    .byte $00 ; |        | $7D56
    .byte $00 ; |        | $7D57
    .byte $00 ; |        | $7D58
    .byte $00 ; |        | $7D59
    .byte $00 ; |        | $7D5A
    .byte $00 ; |        | $7D5B

L7D5C:
    ldx    #$14                  ; 2
L7D5E:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    L7D5E                 ; 2³
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    lda    #$03                  ; 2
    sta    sc_7D                 ; 4
    ldy    #$00                  ; 2
    jsr    L7F50                 ; 6   bankswitch, goto LB112
    ldx    #$12                  ; 2
L7D73:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    L7D73                 ; 2³
    lda    #$33                  ; 2
    sta    TIM64T                ; 4
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    ldx    ram_92                ; 3
    cpx    #$14                  ; 2
    bne    L7D92                 ; 2³
    ldx    ram_84                ; 3
    bne    L7D92                 ; 2³
    jsr    L7E31                 ; 6
L7D92:
    ldx    ram_92                ; 3
    cpx    #$15                  ; 2
    bcs    L7D9C                 ; 2³
    ldx    ram_84                ; 3
    beq    L7DA1                 ; 2³
L7D9C:
    jsr    L7E41                 ; 6
    bcs    L7DAE                 ; 2³
L7DA1:
    lda    #$00                  ; 2
    sta    sc_7F                 ; 4
L7DA6:
    ldy    INTIM                 ; 4
    bne    L7DA6                 ; 2³
    jmp    L7907                 ; 3

L7DAE:
    ldy    INTIM                 ; 4
    bne    L7DAE                 ; 2³
    jsr    L7EB4                 ; 6
    lda    #$00                  ; 2
    sta    sc_52                 ; 4
    sta    sc_7A                 ; 4
    lda    sc_7E|READ            ; 4
    cmp    #$0E                  ; 2
    bcs    L7DC8                 ; 2³
L7DC5:
    jmp    L74AF                 ; 3

L7DC8:
    cmp    #$15                  ; 2
    bcs    L7DC5                 ; 2³
    jmp    L75F4                 ; 3

L7DCF:
    lda    #$00                  ; 2
    sta    sc_7F                 ; 4
    ldx    #$22                  ; 2
L7DD6:
    sta    ram_BE,X              ; 4
    dex                          ; 2
    bpl    L7DD6                 ; 2³
    ldx    #$06                  ; 2
L7DDD:
    sta    ram_AB,X              ; 4
    dex                          ; 2
    bpl    L7DDD                 ; 2³
    sta    ram_E4                ; 3
    ldx    #$07                  ; 2
    stx    ram_E5                ; 3
    rts                          ; 6

;
;    XXXXX    XXXXXX   XXXX  XXX XXX  XX   XX  XXXXXX
;     X   X    X   X  X   X   X   X    XX XX    X   X
;     X   X    X X    X       X   X    X X X    X X
;     X   X    XXX     XXX    X   X    X   X    XXX
;     XXXX     X X        X   X   X    X   X    X X
;     X X      X          X   X   X    X   X    X
;     X  X     X   X  X   X   X   X    X   X    X   X
;    XXX  XX  XXXXXX  XXXX     XXX    XXX XXX  XXXXXX
;
;
;

ResumeOne:
    .byte $00 ; |        | $7DE9
    .byte $00 ; |        | $7DEA
    .byte $00 ; |        | $7DEB
    .byte $E6 ; |XXX  XX | $7DEC
    .byte $48 ; | X  X   | $7DED
    .byte $50 ; | X X    | $7DEE
    .byte $78 ; | XXXX   | $7DEF
    .byte $44 ; | X   X  | $7DF0
    .byte $44 ; | X   X  | $7DF1
    .byte $44 ; | X   X  | $7DF2
    .byte $F8 ; |XXXXX   | $7DF3
    .byte $00 ; |        | $7DF4
ResumeTwo:
    .byte $00 ; |        | $7DF5
    .byte $00 ; |        | $7DF6
    .byte $00 ; |        | $7DF7
    .byte $7E ; | XXXXXX | $7DF8
    .byte $22 ; |  X   X | $7DF9
    .byte $20 ; |  X     | $7DFA
    .byte $28 ; |  X X   | $7DFB
    .byte $38 ; |  XXX   | $7DFC
    .byte $28 ; |  X X   | $7DFD
    .byte $22 ; |  X   X | $7DFE
    .byte $7E ; | XXXXXX | $7DFF
    .byte $00 ; |        | $7E00
ResumeThree:
    .byte $00 ; |        | $7E01
    .byte $00 ; |        | $7E02
    .byte $00 ; |        | $7E03
    .byte $78 ; | XXXX   | $7E04
    .byte $44 ; | X   X  | $7E05
    .byte $04 ; |     X  | $7E06
    .byte $04 ; |     X  | $7E07
    .byte $38 ; |  XXX   | $7E08
    .byte $40 ; | X      | $7E09
    .byte $44 ; | X   X  | $7E0A
    .byte $3C ; |  XXXX  | $7E0B
    .byte $00 ; |        | $7E0C
ResumeFour:
    .byte $00 ; |        | $7E0D
    .byte $00 ; |        | $7E0E
    .byte $00 ; |        | $7E0F
    .byte $38 ; |  XXX   | $7E10
    .byte $44 ; | X   X  | $7E11
    .byte $44 ; | X   X  | $7E12
    .byte $44 ; | X   X  | $7E13
    .byte $44 ; | X   X  | $7E14
    .byte $44 ; | X   X  | $7E15
    .byte $44 ; | X   X  | $7E16
    .byte $EE ; |XXX XXX | $7E17
    .byte $00 ; |        | $7E18
ResumeFive:
    .byte $00 ; |        | $7E19
    .byte $00 ; |        | $7E1A
    .byte $00 ; |        | $7E1B
    .byte $77 ; | XXX XXX| $7E1C
    .byte $22 ; |  X   X | $7E1D
    .byte $22 ; |  X   X | $7E1E
    .byte $22 ; |  X   X | $7E1F
    .byte $22 ; |  X   X | $7E20
    .byte $2A ; |  X X X | $7E21
    .byte $36 ; |  XX XX | $7E22
    .byte $63 ; | XX   XX| $7E23
    .byte $00 ; |        | $7E24
ResumeSix:
    .byte $00 ; |        | $7E25
    .byte $00 ; |        | $7E26
    .byte $00 ; |        | $7E27
    .byte $3F ; |  XXXXXX| $7E28
    .byte $11 ; |   X   X| $7E29
    .byte $10 ; |   X    | $7E2A
    .byte $14 ; |   X X  | $7E2B
    .byte $1C ; |   XXX  | $7E2C
    .byte $14 ; |   X X  | $7E2D
    .byte $11 ; |   X   X| $7E2E
    .byte $3F ; |  XXXXXX| $7E2F
    .byte $00 ; |        | $7E30

L7E31:
    lda    INPT4|$30             ; 3
    bmi    L7E3B                 ; 2³
    lda    #$01                  ; 2
    sta    sc_6F                 ; 4
    rts                          ; 6

L7E3B:
    lda    #$FF                  ; 2
    sta    sc_6F                 ; 4
    rts                          ; 6

L7E41:
    lda    INPT4|$30             ; 3
    bmi    L7E4A                 ; 2³
    lda    #$01                  ; 2
    jmp    L7E4C                 ; 3

L7E4A:
    lda    #$FF                  ; 2
L7E4C:
    cmp    sc_6F|READ            ; 4
    beq    L7E53                 ; 2³
    sec                          ; 2
    rts                          ; 6

L7E53:
    clc                          ; 2
    rts                          ; 6

L7E55:
    .byte $20 ; |  X     | $7E55
    .byte $18 ; |   XX   | $7E56
    .byte $10 ; |   X    | $7E57
    .byte $08 ; |    X   | $7E58
    .byte $00 ; |        | $7E59

L7E5A:
    lda    #$FF                  ; 2
    sta    sc_35                 ; 4
    sta    sc_52                 ; 4
    ldx    #$03                  ; 2
L7E64:
    sta    sc_30,X               ; 5
    dex                          ; 2
    bpl    L7E64                 ; 2³
  IF FUEL_LOSS
    ldx    #$60                  ; 2
  ELSE
    LDX    #$61                  ; 2
  ENDIF
    stx    fuelStatus            ; 4
    ldx    #$0D                  ; 2
    stx    ram_CD                ; 3
    lda    #$00                  ; 2
    sta    ram_DC                ; 3
    sta    ram_80                ; 3
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    ram_D1                ; 3
    sta    sc_00                 ; 4
    sta    sc_01                 ; 4
    sta    sc_02                 ; 4
    sta    ram_CA                ; 3
    sta    sc_05                 ; 4
    sta    sc_06                 ; 4
    sta    sc_7A                 ; 4
    sta    sc_6F                 ; 4
  IF ARMOR_DAMAGE
    lda    #$6F                  ; 2
  ELSE
    LDA    #$7F                  ; 2
  ENDIF
    sta    armorStatus           ; 4
    lda    #$7F                  ; 2
    sta    tireStatus            ; 4
    sta    engineStatus          ; 4
    lda    #$50                  ; 2
    sta    bulletStatus          ; 4
    lda    #$06                  ; 2
    sta    ram_D6                ; 3
  IF BONUS_LOSS
    lda    #$1C                  ; 2
  ELSE
    LDA    #$26                  ; 2
  ENDIF
    sta    bonusStatus           ; 4
    jmp    L7118                 ; 3

L7EB4:
    lda    #$03                  ; 2
    sta    VSYNC                 ; 3
    sta    RSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$13                  ; 2
    sta    T1024T                ; 4
    lda    #$00                  ; 2
    sta    VSYNC                 ; 3
    lda    #$03                  ; 2
    sta    VBLANK                ; 3
    rts                          ; 6

L7ECC:
    lda    INTIM                 ; 4
    bne    L7ECC                 ; 2³
    rts                          ; 6

L7ED2:
    .byte $F4 ; |XXXX X  | $7ED2
    .byte $D4 ; |XX X X  | $7ED3
    .byte $C6 ; |XX   XX | $7ED4
    .byte $F6 ; |XXXX XX | $7ED5
    .byte $76 ; | XXX XX | $7ED6


  IF SHOW_BYTES_REMAINING
      ECHO ([$7EFC-*]d), "bytes free BANK_3"
  ENDIF


       ORG $3EFC
      RORG $7EFC

L7EFC:
    lda    BANK_2                ; 4   bankswitch, goto L537C
    jmp    M5106|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M5109|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9106|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M510C|BANK_MASK       ; 3

    lda    BANK_1                ; 4
    jmp    M3109|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9109|BANK_MASK       ; 3

L7F20:
    lda    BANK_2                ; 4   bankswitch, goto L57DA
    jmp    M510F|BANK_MASK       ; 3

    lda    BANK_3                ; 4
    jmp    M7106|BANK_MASK       ; 3

    lda    BANK_3                ; 4
    jmp    M7109|BANK_MASK       ; 3

L7F32:
    lda    BANK_2                ; 4   bankswitch, goto L51C9
    jmp    M5112|BANK_MASK       ; 3

    lda    BANK_1                ; 4
    jmp    M310F|BANK_MASK       ; 3

L7F3E:
    lda    BANK_5                ; 4   bankswitch, goto LB88B
    jmp    MB10C|BANK_MASK       ; 3

L7F44:
    lda    BANK_5                ; 4   bankswitch, goto LB90C
    jmp    MB10F|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9112|BANK_MASK       ; 3

L7F50:
    lda    BANK_5                ; 4   bankswitch, goto LB112
    jmp    MB106|BANK_MASK       ; 3

L7F56:
    lda    BANK_7                ; 4   bankswitch, goto LF777
    jmp    MF106|BANK_MASK       ; 3

L7F5C:
    lda    BANK_4                ; 4   bankswitch, goto L9841
    jmp    M910F|BANK_MASK       ; 3

    lda    BANK_6                ; 4
    jmp    MD106|BANK_MASK

    lda    BANK_0                ; 4
    rts                          ; 6

    lda    BANK_3                ; 4
    rts                          ; 6

    lda    BANK_4                ; 4
    rts                          ; 6

    lda    BANK_6                ; 4
    rts                          ; 6


; $7F78 - $7FF3 are free bytes


       ORG $3FF4
      RORG $7FF4

    .byte $00 ; |        | $7FF4
    .byte $00 ; |        | $7FF5
    .byte $00 ; |        | $7FF6
    .byte $00 ; |        | $7FF7
    .byte $00 ; |        | $7FF8
    .byte $00 ; |        | $7FF9
    .byte $00 ; |        | $7FFA
    .byte $00 ; |        | $7FFB

    .word START_3
    .word 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      BANK 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $4000
      RORG $9000

    SC_RAM_SPACE

START_4:
    lda    BANK_0                ; 4
    jmp    START_4               ; 3

M9106:
    jmp    L911C                 ; 3

M9109:
    jmp    L920E                 ; 3

;$910C:
    jmp    $9115                 ; 3   unused

M910F:
    jmp    L9841                 ; 3

M9112:
    jmp    L9241                 ; 3

L9115:
    .byte $06 ; |     XX | $9115
    .byte $1A ; |   XX X | $9116
    .byte $30 ; |  XX    | $9117
    .byte $48 ; | X  X   | $9118
    .byte $68 ; | XX X   | $9119
    .byte $78 ; | XXXX   | $911A
    .byte $88 ; |X   X   | $911B

L911C:
    lda    ram_D2                ; 3
    beq    L9186                 ; 2³
    lda    ram_D7                ; 3
    cmp    ram_8A                ; 3
    beq    L912F                 ; 2³
    bcc    L912D                 ; 2³
    inc    ram_8A                ; 5
    jmp    L912F                 ; 3

L912D:
    dec    ram_8A                ; 5
L912F:
    lda    ram_93                ; 3
    and    #$01                  ; 2
    bne    L915A                 ; 2³
    ldy    ram_C7                ; 3
    cpy    #$03                  ; 2
    beq    L915A                 ; 2³
    bcs    L913F                 ; 2³
    bcc    L914E                 ; 3   always branch

L913F:
    jsr    L9B98                 ; 6
    ldy    ram_C7                ; 3
    cpy    #$05                  ; 2
    bcc    L915A                 ; 2³
    jsr    L9B98                 ; 6
    jmp    L915A                 ; 3

L914E:
    jsr    L9BA8                 ; 6
    ldy    ram_C7                ; 3
    cpy    #$02                  ; 2
    bcs    L915A                 ; 2³
    jsr    L9BA8                 ; 6
L915A:
    ldy    sc_0D|READ            ; 4
    lda    ram_C4                ; 3
    cmp    L9115,Y               ; 4
    bcc    L9189                 ; 2³
    beq    L91AC                 ; 2³
    sec                          ; 2
    sbc    #$02                  ; 2
    sta    ram_C4                ; 3
    lda    ram_CA                ; 3
    ora    #$80                  ; 2
    sta    ram_CA                ; 3
    ldy    ram_CB                ; 3
    cpy    #$0E                  ; 2
    bcs    L9186                 ; 2³
    bit    CXP1FB|$30            ; 3
    bvs    L9186                 ; 2³
    bit    CXM0P|$30             ; 3
    bmi    L9186                 ; 2³
    lda    ram_CD                ; 3
    sec                          ; 2
    sbc    #$02                  ; 2
    sta    ram_CD                ; 3
L9186:
    jmp    L9F68                 ; 3

L9189:
    clc                          ; 2
    adc    #$02                  ; 2
    sta    ram_C4                ; 3
    lda    ram_CA                ; 3
    ora    #$80                  ; 2
    sta    ram_CA                ; 3
    ldy    ram_CB                ; 3
    cpy    #$0E                  ; 2
    bcs    L91A9                 ; 2³
    bit    CXP1FB|$30            ; 3
    bvs    L9186                 ; 2³
    bit    CXM0P|$30             ; 3
    bmi    L9186                 ; 2³
    lda    ram_CD                ; 3
    clc                          ; 2
    adc    #$02                  ; 2
    sta    ram_CD                ; 3
L91A9:
    jmp    L9F68                 ; 3

L91AC:
    lda    ram_93                ; 3
    beq    L91B5                 ; 2³
    dec    ram_93                ; 5
L91B2:
    jmp    L9F68                 ; 3

L91B5:
    lda    ram_D7                ; 3
    cmp    ram_8A                ; 3
    bne    L91B2                 ; 2³
    ldy    ram_CE                ; 3
    lda    L9206,Y               ; 4
    sta    ram_93                ; 3
    ldy    ram_C8                ; 3
    lda    L942E,Y               ; 4
    tay                          ; 2
    and    #$F0                  ; 2
    beq    L91D6                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    #$0C                  ; 2
    sta    sc_0E                 ; 4
L91D6:
    tya                          ; 2
    and    #$0F                  ; 2
    sta    sc_0D                 ; 4
    inc    ram_C8                ; 5
    lda    sc_0E|READ            ; 4
    sec                          ; 2
    sbc    #$0C                  ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    #$79                  ; 2
    sta    ram_D7                ; 3
    ldy    sc_36|READ            ; 4
    dey                          ; 2
    sty    sc_36                 ; 4
    bpl    L9201                 ; 2³+1
    ldy    #$05                  ; 2
    sty    sc_36                 ; 4
    ldy    fuelStatus|READ       ; 4
    beq    L9201                 ; 2³+1
    dey                          ; 2
  IF FUEL_LOSS
    sty    fuelStatus            ; 4
  ELSE
    .byte $EA,$EA,$EA
  ENDIF
L9201:
    inc    ram_D5                ; 5
    jmp    L9F68                 ; 3

L9206:
    .byte $B4 ; |X XX X  | $9206
    .byte $5A ; | X XX X | $9207
    .byte $3C ; |  XXXX  | $9208
    .byte $1E ; |   XXXX | $9209
    .byte $14 ; |   X X  | $920A
    .byte $08 ; |    X   | $920B
    .byte $04 ; |     X  | $920C
    .byte $02 ; |      X | $920D

L920E:
    lda    ram_D2                ; 3
    ldx    #$00                  ; 2
    cmp    #$0B                  ; 2
    bcc    L923C                 ; 2³
    ldx    #$01                  ; 2
    cmp    #$15                  ; 2
    bcc    L923C                 ; 2³
    ldx    #$02                  ; 2
    cmp    #$1F                  ; 2
    bcc    L923C                 ; 2³
    ldx    #$03                  ; 2
    cmp    #$29                  ; 2
    bcc    L923C                 ; 2³
    ldx    #$04                  ; 2
    cmp    #$56                  ; 2
    bcc    L923C                 ; 2³
    ldx    #$05                  ; 2
    cmp    #$6F                  ; 2
    bcc    L923C                 ; 2³
    ldx    #$06                  ; 2
    cmp    #$A1                  ; 2
    bcc    L923C                 ; 2³
    ldx    #$07                  ; 2
L923C:
    stx    ram_CE                ; 3
    jmp    L9F68                 ; 3

L9241:
    lda    ram_8A                ; 3
    sec                          ; 2
    sbc    #$2A                  ; 2
    lsr                          ; 2
    sta    ram_88                ; 3
    cpx    #$00                  ; 2
    beq    L9250                 ; 2³
    jmp    L92E1                 ; 3

L9250:
    lda    ram_C3                ; 3
    cmp    ram_C4                ; 3
    bcc    L925A                 ; 2³
    cmp    #$81                  ; 2
    bcc    L928E                 ; 2³
L925A:
    sec                          ; 2
    sbc    ram_C4                ; 3
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
    sta    ram_8C                ; 3
    cmp    #$A1                  ; 2
    bcc    L926A                 ; 2³
    lda    #$A0                  ; 2
L926A:
    ldx    ram_88                ; 3
    tay                          ; 2
    jsr    L954E                 ; 6
    lda    #$00                  ; 2
    tay                          ; 2
    sta    ram_86                ; 3
L9275:
    lda    ram_82                ; 3
    clc                          ; 2
    adc    ram_86                ; 3
    sta    ram_86                ; 3
    lda    ram_83                ; 3
    adc    #$00                  ; 2
    tax                          ; 2
    lda    L9416,X               ; 4
    sta.wy ram_96,Y              ; 5
    iny                          ; 2
    cpy    ram_88                ; 3
    bne    L9275                 ; 2³
    beq    L92B5                 ; 3   always branch

L928E:
    sec                          ; 2
    sbc    ram_C4                ; 3
    sta    ram_8C                ; 3
    ldx    ram_88                ; 3
    tay                          ; 2
    jsr    L954E                 ; 6
    lda    #$00                  ; 2
    tay                          ; 2
    sta    ram_86                ; 3
L929E:
    lda    ram_82                ; 3
    clc                          ; 2
    adc    ram_86                ; 3
    sta    ram_86                ; 3
    lda    ram_83                ; 3
    adc    #$00                  ; 2
    tax                          ; 2
    lda    L941C,X               ; 4
    sta.wy ram_96,Y              ; 5
    iny                          ; 2
    cpy    ram_88                ; 3
    bne    L929E                 ; 2³
L92B5:
    jsr    L93D8                 ; 6
    lda    ram_8E                ; 3
    sta    sc_4E                 ; 4
    lda    ram_8F                ; 3
    sta    sc_4F                 ; 4
    lda    ram_C4                ; 3
    clc                          ; 2
    adc    sc_0E|READ            ; 4
    sta    ram_90                ; 3
    lda    ram_C3                ; 3
    adc    #$B8                  ; 2
    sta    ram_85                ; 3
    sec                          ; 2
    sbc    ram_90                ; 3
    clc                          ; 2
    adc    #$01                  ; 2
    cmp    #$A1                  ; 2
    bcc    L92DC                 ; 2³
    lda    #$A0                  ; 2
L92DC:
    sta    ram_8C                ; 3
    jmp    L9F68                 ; 3

L92E1:
    lda    ram_85                ; 3
    cmp    ram_90                ; 3
    bcs    L92EB                 ; 2³
    cmp    #$4A                  ; 2
    bcs    L9314                 ; 2³+1
L92EB:
    ldx    ram_88                ; 3
    ldy    ram_8C                ; 3
    jsr    L954E                 ; 6
    lda    #$00                  ; 2
    tay                          ; 2
    sta    ram_86                ; 3
L92F7:
    lda    ram_82                ; 3
    clc                          ; 2
    adc    ram_86                ; 3
    sta    ram_86                ; 3
    lda    ram_83                ; 3
    adc    #$00                  ; 2
    tax                          ; 2
    lda    L9428,X               ; 4
    ora.wy ram_96,Y              ; 4
    sta.wy ram_96,Y              ; 5
    iny                          ; 2
    cpy    ram_88                ; 3
    bne    L92F7                 ; 2³+1
    jmp    L9343                 ; 3

L9314:
    sec                          ; 2
    sbc    ram_90                ; 3
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
    sta    ram_8C                ; 3
    ldx    ram_88                ; 3
    tay                          ; 2
    jsr    L954E                 ; 6
    lda    #$00                  ; 2
    tay                          ; 2
    sta    ram_86                ; 3
L9329:
    lda    ram_82                ; 3
    clc                          ; 2
    adc    ram_86                ; 3
    sta    ram_86                ; 3
    lda    ram_83                ; 3
    adc    #$00                  ; 2
    tax                          ; 2
    lda    L9422,X               ; 4
    ora.wy ram_96,Y              ; 4
    sta.wy ram_96,Y              ; 5
    iny                          ; 2
    cpy    ram_88                ; 3
    bne    L9329                 ; 2³
L9343:
    jsr    L93D8                 ; 6
    lda    ram_8E                ; 3
    sta    sc_50                 ; 4
    lda    ram_8F                ; 3
    sta    sc_51                 ; 4
    lda    ram_C7                ; 3
    tax                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L977F,Y               ; 4
    sta    ram_8C                ; 3
    lda    L977F+1,Y             ; 4
    sta    ram_8D                ; 3
    ldy    ram_CB                ; 3
    cpy    #$2F                  ; 2
    bcs    L93B9                 ; 2³
    lda    (ram_8C),Y            ; 5
    cpx    #$03                  ; 2
    bcs    L9379                 ; 2³
    sta    ram_8E                ; 3
    sec                          ; 2
    lda    sc_4F|READ            ; 4
    sbc    ram_8E                ; 3
    sta    sc_4F                 ; 4
    jmp    L9380                 ; 3

L9379:
    clc                          ; 2
    adc    sc_4F|READ            ; 4
    sta    sc_4F                 ; 4
L9380:
    lda    ram_C4                ; 3
    sec                          ; 2
    sbc    sc_4F|READ            ; 4
    clc                          ; 2
    adc    #$03                  ; 2
    sta    sc_4F                 ; 4
    lda    (ram_8C),Y            ; 5
    cpx    #$03                  ; 2
    bcs    L939C                 ; 2³
    clc                          ; 2
    adc    sc_51|READ            ; 4
    sta    sc_51                 ; 4
    jmp    L93A7                 ; 3

L939C:
    sta    ram_8E                ; 3
    lda    sc_51|READ            ; 4
    sec                          ; 2
    sbc    ram_8E                ; 3
    sta    sc_51                 ; 4
L93A7:
    lda    ram_C4                ; 3
    clc                          ; 2
    adc    sc_51|READ            ; 4
    ldx    ram_CB                ; 3
    cpx    #$0F                  ; 2
    bcc    L93B6                 ; 2³
    sec                          ; 2
    sbc    #$12                  ; 2
L93B6:
    sta    sc_51                 ; 4
L93B9:
    lda    sc_4F|READ            ; 4
    cmp    #$03                  ; 2
    bcc    L93C4                 ; 2³
    cmp    #$C0                  ; 2
    bcc    L93C9                 ; 2³
L93C4:
    lda    #$04                  ; 2
    sta    sc_4F                 ; 4
L93C9:
    lda    sc_51|READ            ; 4
    cmp    #$80                  ; 2
    bcc    L93D5                 ; 2³
    lda    #$7F                  ; 2
    sta    sc_51                 ; 4
L93D5:
    jmp    L9F68                 ; 3

L93D8:
    ldx    #$00                  ; 2
L93DA:
    lda    ram_83                ; 3
    beq    L93E5                 ; 2³
    lsr    ram_83                ; 5
    ror    ram_82                ; 5
    inx                          ; 2
    bne    L93DA                 ; 2³
L93E5:
    stx    ram_8C                ; 3
    ldx    ram_82                ; 3
    ldy    ram_CB                ; 3
    jsr    L93FA                 ; 6
    ldx    ram_8C                ; 3
    beq    L93F9                 ; 2³
L93F2:
    asl    ram_8E                ; 5
    rol    ram_8F                ; 5
    dex                          ; 2
    bne    L93F2                 ; 2³
L93F9:
    rts                          ; 6

L93FA:
    stx    ram_8E                ; 3
    sty    ram_82                ; 3
    lda    #$00                  ; 2
    sta    ram_8F                ; 3
    ldx    #$09                  ; 2
    clc                          ; 2
L9405:
    ror    ram_8F                ; 5
    ror    ram_8E                ; 5
    bcc    L9412                 ; 2³
    clc                          ; 2
    lda    ram_82                ; 3
    adc    ram_8F                ; 3
    sta    ram_8F                ; 3
L9412:
    dex                          ; 2
    bne    L9405                 ; 2³
    rts                          ; 6

L9416:
    .byte $00 ; |        | $9416
    .byte $10 ; |   X    | $9417
    .byte $20 ; |  X     | $9418
    .byte $30 ; |  XX    | $9419
    .byte $40 ; | X      | $941A
    .byte $00 ; |        | $941B
L941C:
    .byte $00 ; |        | $941C
    .byte $F0 ; |XXXX    | $941D
    .byte $E0 ; |XXX     | $941E
    .byte $D0 ; |XX X    | $941F
    .byte $C0 ; |XX      | $9420
    .byte $00 ; |        | $9421
L9422:
    .byte $00 ; |        | $9422
    .byte $01 ; |       X| $9423
    .byte $02 ; |      X | $9424
    .byte $03 ; |      XX| $9425
    .byte $04 ; |     X  | $9426
    .byte $00 ; |        | $9427
L9428:
    .byte $00 ; |        | $9428
    .byte $0F ; |    XXXX| $9429
    .byte $0E ; |    XXX | $942A
    .byte $0D ; |    XX X| $942B
    .byte $0C ; |    XX  | $942C
    .byte $00 ; |        | $942D
L942E:
    .byte $43 ; | X    XX| $942E
    .byte $43 ; | X    XX| $942F
    .byte $E1 ; |XXX    X| $9430
    .byte $E0 ; |XXX     | $9431
    .byte $40 ; | X      | $9432
    .byte $40 ; | X      | $9433
    .byte $40 ; | X      | $9434
    .byte $40 ; | X      | $9435
    .byte $40 ; | X      | $9436
    .byte $43 ; | X    XX| $9437
    .byte $43 ; | X    XX| $9438
    .byte $63 ; | XX   XX| $9439
    .byte $E3 ; |XXX   XX| $943A
    .byte $E6 ; |XXX  XX | $943B
    .byte $E6 ; |XXX  XX | $943C
    .byte $E6 ; |XXX  XX | $943D
    .byte $E5 ; |XXX  X X| $943E
    .byte $E5 ; |XXX  X X| $943F
    .byte $E6 ; |XXX  XX | $9440
    .byte $D4 ; |XX X X  | $9441
    .byte $E6 ; |XXX  XX | $9442
    .byte $D4 ; |XX X X  | $9443
    .byte $D3 ; |XX X  XX| $9444
    .byte $53 ; | X X  XX| $9445
    .byte $53 ; | X X  XX| $9446
    .byte $52 ; | X X  X | $9447
    .byte $56 ; | X X XX | $9448
    .byte $56 ; | X X XX | $9449
    .byte $53 ; | X X  XX| $944A
    .byte $E3 ; |XXX   XX| $944B
    .byte $E3 ; |XXX   XX| $944C
    .byte $C3 ; |XX    XX| $944D
    .byte $C0 ; |XX      | $944E
    .byte $C0 ; |XX      | $944F
    .byte $C0 ; |XX      | $9450
    .byte $C0 ; |XX      | $9451
    .byte $C1 ; |XX     X| $9452
    .byte $C2 ; |XX    X | $9453
    .byte $B2 ; |X XX  X | $9454
    .byte $B3 ; |X XX  XX| $9455
    .byte $B0 ; |X XX    | $9456
    .byte $B0 ; |X XX    | $9457
    .byte $E0 ; |XXX     | $9458
    .byte $B3 ; |X XX  XX| $9459
    .byte $B3 ; |X XX  XX| $945A
    .byte $B0 ; |X XX    | $945B
    .byte $A1 ; |X X    X| $945C
    .byte $A5 ; |X X  X X| $945D
    .byte $A6 ; |X X  XX | $945E
    .byte $A5 ; |X X  X X| $945F
    .byte $A6 ; |X X  XX | $9460
    .byte $E0 ; |XXX     | $9461
    .byte $D0 ; |XX X    | $9462
    .byte $D0 ; |XX X    | $9463
    .byte $D0 ; |XX X    | $9464
    .byte $D2 ; |XX X  X | $9465
    .byte $D0 ; |XX X    | $9466
    .byte $D6 ; |XX X XX | $9467
    .byte $D6 ; |XX X XX | $9468
    .byte $D5 ; |XX X X X| $9469
    .byte $D4 ; |XX X X  | $946A
    .byte $D0 ; |XX X    | $946B
    .byte $D3 ; |XX X  XX| $946C
    .byte $A3 ; |X X   XX| $946D
    .byte $43 ; | X    XX| $946E
    .byte $53 ; | X X  XX| $946F
    .byte $51 ; | X X   X| $9470
    .byte $50 ; | X X    | $9471
    .byte $56 ; | X X XX | $9472
    .byte $60 ; | XX     | $9473
    .byte $80 ; |X       | $9474
    .byte $43 ; | X    XX| $9475
    .byte $83 ; |X     XX| $9476
    .byte $E3 ; |XXX   XX| $9477
    .byte $A3 ; |X X   XX| $9478
    .byte $A3 ; |X X   XX| $9479
    .byte $E3 ; |XXX   XX| $947A
    .byte $E6 ; |XXX  XX | $947B
    .byte $E6 ; |XXX  XX | $947C
    .byte $E3 ; |XXX   XX| $947D
    .byte $D3 ; |XX X  XX| $947E
    .byte $C3 ; |XX    XX| $947F
    .byte $C6 ; |XX   XX | $9480
    .byte $C2 ; |XX    X | $9481
    .byte $C3 ; |XX    XX| $9482
    .byte $C3 ; |XX    XX| $9483
    .byte $C3 ; |XX    XX| $9484
    .byte $C3 ; |XX    XX| $9485
    .byte $B3 ; |X XX  XX| $9486
    .byte $B3 ; |X XX  XX| $9487
    .byte $A2 ; |X X   X | $9488
    .byte $A2 ; |X X   X | $9489
    .byte $A3 ; |X X   XX| $948A
    .byte $A3 ; |X X   XX| $948B
    .byte $A3 ; |X X   XX| $948C
    .byte $A3 ; |X X   XX| $948D
    .byte $43 ; | X    XX| $948E
    .byte $43 ; | X    XX| $948F
    .byte $E1 ; |XXX    X| $9490
    .byte $E0 ; |XXX     | $9491
    .byte $40 ; | X      | $9492
    .byte $40 ; | X      | $9493
    .byte $40 ; | X      | $9494
    .byte $40 ; | X      | $9495
    .byte $40 ; | X      | $9496
    .byte $43 ; | X    XX| $9497
    .byte $43 ; | X    XX| $9498
    .byte $63 ; | XX   XX| $9499
    .byte $E3 ; |XXX   XX| $949A
    .byte $E6 ; |XXX  XX | $949B
    .byte $E6 ; |XXX  XX | $949C
    .byte $E6 ; |XXX  XX | $949D
    .byte $E5 ; |XXX  X X| $949E
    .byte $E5 ; |XXX  X X| $949F
    .byte $E6 ; |XXX  XX | $94A0
    .byte $D4 ; |XX X X  | $94A1
    .byte $E6 ; |XXX  XX | $94A2
    .byte $D4 ; |XX X X  | $94A3
    .byte $D3 ; |XX X  XX| $94A4
    .byte $53 ; | X X  XX| $94A5
    .byte $53 ; | X X  XX| $94A6
    .byte $52 ; | X X  X | $94A7
    .byte $56 ; | X X XX | $94A8
    .byte $56 ; | X X XX | $94A9
    .byte $53 ; | X X  XX| $94AA
    .byte $E3 ; |XXX   XX| $94AB
    .byte $E3 ; |XXX   XX| $94AC
    .byte $C3 ; |XX    XX| $94AD
    .byte $C0 ; |XX      | $94AE
    .byte $C0 ; |XX      | $94AF
    .byte $C0 ; |XX      | $94B0
    .byte $C0 ; |XX      | $94B1
    .byte $C1 ; |XX     X| $94B2
    .byte $C2 ; |XX    X | $94B3
    .byte $B2 ; |X XX  X | $94B4
    .byte $B3 ; |X XX  XX| $94B5
    .byte $B0 ; |X XX    | $94B6
    .byte $B0 ; |X XX    | $94B7
    .byte $E0 ; |XXX     | $94B8
    .byte $B3 ; |X XX  XX| $94B9
    .byte $B3 ; |X XX  XX| $94BA
    .byte $B0 ; |X XX    | $94BB
    .byte $A1 ; |X X    X| $94BC
    .byte $A5 ; |X X  X X| $94BD
    .byte $A6 ; |X X  XX | $94BE
    .byte $A5 ; |X X  X X| $94BF
    .byte $A6 ; |X X  XX | $94C0
    .byte $E0 ; |XXX     | $94C1
    .byte $D0 ; |XX X    | $94C2
    .byte $D0 ; |XX X    | $94C3
    .byte $D0 ; |XX X    | $94C4
    .byte $D2 ; |XX X  X | $94C5
    .byte $D0 ; |XX X    | $94C6
    .byte $D6 ; |XX X XX | $94C7
    .byte $D6 ; |XX X XX | $94C8
    .byte $D5 ; |XX X X X| $94C9
    .byte $D4 ; |XX X X  | $94CA
    .byte $D0 ; |XX X    | $94CB
    .byte $D3 ; |XX X  XX| $94CC
    .byte $A3 ; |X X   XX| $94CD
    .byte $A6 ; |X X  XX | $94CE
    .byte $A5 ; |X X  X X| $94CF
    .byte $A6 ; |X X  XX | $94D0
    .byte $E0 ; |XXX     | $94D1
    .byte $D0 ; |XX X    | $94D2
    .byte $D0 ; |XX X    | $94D3
    .byte $D0 ; |XX X    | $94D4
    .byte $D2 ; |XX X  X | $94D5
    .byte $D0 ; |XX X    | $94D6
    .byte $D6 ; |XX X XX | $94D7
    .byte $D6 ; |XX X XX | $94D8
    .byte $D5 ; |XX X X X| $94D9
    .byte $D4 ; |XX X X  | $94DA
    .byte $D0 ; |XX X    | $94DB
    .byte $D3 ; |XX X  XX| $94DC
    .byte $A3 ; |X X   XX| $94DD
    .byte $43 ; | X    XX| $94DE
    .byte $43 ; | X    XX| $94DF
    .byte $E1 ; |XXX    X| $94E0
    .byte $E0 ; |XXX     | $94E1
    .byte $40 ; | X      | $94E2
    .byte $40 ; | X      | $94E3
    .byte $40 ; | X      | $94E4
    .byte $40 ; | X      | $94E5
    .byte $40 ; | X      | $94E6
    .byte $43 ; | X    XX| $94E7
    .byte $43 ; | X    XX| $94E8
    .byte $63 ; | XX   XX| $94E9
    .byte $E3 ; |XXX   XX| $94EA
    .byte $E6 ; |XXX  XX | $94EB
    .byte $E6 ; |XXX  XX | $94EC
    .byte $E6 ; |XXX  XX | $94ED
    .byte $E5 ; |XXX  X X| $94EE
    .byte $E5 ; |XXX  X X| $94EF
    .byte $E6 ; |XXX  XX | $94F0
    .byte $D4 ; |XX X X  | $94F1
    .byte $E6 ; |XXX  XX | $94F2
    .byte $D4 ; |XX X X  | $94F3
    .byte $D3 ; |XX X  XX| $94F4
    .byte $53 ; | X X  XX| $94F5
    .byte $53 ; | X X  XX| $94F6
    .byte $52 ; | X X  X | $94F7
    .byte $56 ; | X X XX | $94F8
    .byte $56 ; | X X XX | $94F9
    .byte $53 ; | X X  XX| $94FA
    .byte $E3 ; |XXX   XX| $94FB
    .byte $E3 ; |XXX   XX| $94FC
    .byte $C3 ; |XX    XX| $94FD
    .byte $43 ; | X    XX| $94FE
    .byte $53 ; | X X  XX| $94FF
    .byte $51 ; | X X   X| $9500
    .byte $50 ; | X X    | $9501
    .byte $56 ; | X X XX | $9502
    .byte $60 ; | XX     | $9503
    .byte $80 ; |X       | $9504
    .byte $43 ; | X    XX| $9505
    .byte $83 ; |X     XX| $9506
    .byte $E3 ; |XXX   XX| $9507
    .byte $A3 ; |X X   XX| $9508
    .byte $A3 ; |X X   XX| $9509
    .byte $E3 ; |XXX   XX| $950A
    .byte $E6 ; |XXX  XX | $950B
    .byte $E6 ; |XXX  XX | $950C
    .byte $E3 ; |XXX   XX| $950D
    .byte $D3 ; |XX X  XX| $950E
    .byte $C3 ; |XX    XX| $950F
    .byte $C6 ; |XX   XX | $9510
    .byte $C2 ; |XX    X | $9511
    .byte $C3 ; |XX    XX| $9512
    .byte $C3 ; |XX    XX| $9513
    .byte $C3 ; |XX    XX| $9514
    .byte $C3 ; |XX    XX| $9515
    .byte $B3 ; |X XX  XX| $9516
    .byte $B3 ; |X XX  XX| $9517
    .byte $A2 ; |X X   X | $9518
    .byte $A2 ; |X X   X | $9519
    .byte $A3 ; |X X   XX| $951A
    .byte $A3 ; |X X   XX| $951B
    .byte $A3 ; |X X   XX| $951C
    .byte $A3 ; |X X   XX| $951D
    .byte $C2 ; |XX    X | $951E
    .byte $C0 ; |XX      | $951F
    .byte $C6 ; |XX   XX | $9520
    .byte $C3 ; |XX    XX| $9521
    .byte $C3 ; |XX    XX| $9522
    .byte $C3 ; |XX    XX| $9523
    .byte $B3 ; |X XX  XX| $9524
    .byte $B3 ; |X XX  XX| $9525
    .byte $B0 ; |X XX    | $9526
    .byte $B0 ; |X XX    | $9527
    .byte $E3 ; |XXX   XX| $9528
    .byte $B3 ; |X XX  XX| $9529
    .byte $B3 ; |X XX  XX| $952A
    .byte $B3 ; |X XX  XX| $952B
    .byte $A3 ; |X X   XX| $952C
    .byte $A3 ; |X X   XX| $952D

L952E:
    clc                          ; 2
    lda    #$00                  ; 2
    sta    ram_8E                ; 3
    stx    ram_82                ; 3
    sty    ram_8F                ; 3
    ldx    #$08                  ; 2
L9539:
    rol    ram_8E                ; 5
    rol    ram_8F                ; 5
    sec                          ; 2
    lda    ram_8F                ; 3
    sbc    ram_82                ; 3
    bcc    L9546                 ; 2³
    sta    ram_8F                ; 3
L9546:
    dex                          ; 2
    bne    L9539                 ; 2³
    rol    ram_8E                ; 5
    rol    ram_8F                ; 5
    rts                          ; 6

L954E:
    stx    ram_82                ; 3
    cpy    ram_82                ; 3
    beq    L9576                 ; 2³
    bcc    L956A                 ; 2³
    tya                          ; 2
    ldy    ram_82                ; 3
    tax                          ; 2
    jsr    L952E                 ; 6
    ldx    ram_8E                ; 3
    lda    L967F,X               ; 4
    sta    ram_82                ; 3
    lda    L957F,X               ; 4
    sta    ram_83                ; 3
    rts                          ; 6

L956A:
    jsr    L952E                 ; 6
    lda    ram_8E                ; 3
    sta    ram_82                ; 3
    lda    #$00                  ; 2
    sta    ram_83                ; 3
    rts                          ; 6

L9576:
    lda    #$01                  ; 2
    sta    ram_83                ; 3
    lda    #$00                  ; 2
    sta    ram_82                ; 3
    rts                          ; 6

L957F:
    .byte $00 ; |        | $957F
    .byte $00 ; |        | $9580
    .byte $80 ; |X       | $9581
    .byte $55 ; | X X X X| $9582
    .byte $40 ; | X      | $9583
    .byte $33 ; |  XX  XX| $9584
    .byte $2A ; |  X X X | $9585
    .byte $24 ; |  X  X  | $9586
    .byte $20 ; |  X     | $9587
    .byte $1C ; |   XXX  | $9588
    .byte $19 ; |   XX  X| $9589
    .byte $17 ; |   X XXX| $958A
    .byte $15 ; |   X X X| $958B
    .byte $13 ; |   X  XX| $958C
    .byte $12 ; |   X  X | $958D
    .byte $11 ; |   X   X| $958E
    .byte $10 ; |   X    | $958F
    .byte $0F ; |    XXXX| $9590
    .byte $0E ; |    XXX | $9591
    .byte $0D ; |    XX X| $9592
    .byte $0C ; |    XX  | $9593
    .byte $0C ; |    XX  | $9594
    .byte $0B ; |    X XX| $9595
    .byte $0B ; |    X XX| $9596
    .byte $0A ; |    X X | $9597
    .byte $0A ; |    X X | $9598
    .byte $09 ; |    X  X| $9599
    .byte $09 ; |    X  X| $959A
    .byte $09 ; |    X  X| $959B
    .byte $08 ; |    X   | $959C
    .byte $08 ; |    X   | $959D
    .byte $08 ; |    X   | $959E
    .byte $08 ; |    X   | $959F
    .byte $07 ; |     XXX| $95A0
    .byte $07 ; |     XXX| $95A1
    .byte $07 ; |     XXX| $95A2
    .byte $07 ; |     XXX| $95A3
    .byte $06 ; |     XX | $95A4
    .byte $06 ; |     XX | $95A5
    .byte $06 ; |     XX | $95A6
    .byte $06 ; |     XX | $95A7
    .byte $06 ; |     XX | $95A8
    .byte $06 ; |     XX | $95A9
    .byte $05 ; |     X X| $95AA
    .byte $05 ; |     X X| $95AB
    .byte $05 ; |     X X| $95AC
    .byte $05 ; |     X X| $95AD
    .byte $05 ; |     X X| $95AE
    .byte $05 ; |     X X| $95AF
    .byte $05 ; |     X X| $95B0
    .byte $05 ; |     X X| $95B1
    .byte $05 ; |     X X| $95B2
    .byte $04 ; |     X  | $95B3
    .byte $04 ; |     X  | $95B4
    .byte $04 ; |     X  | $95B5
    .byte $04 ; |     X  | $95B6
    .byte $04 ; |     X  | $95B7
    .byte $04 ; |     X  | $95B8
    .byte $04 ; |     X  | $95B9
    .byte $04 ; |     X  | $95BA
    .byte $04 ; |     X  | $95BB
    .byte $04 ; |     X  | $95BC
    .byte $04 ; |     X  | $95BD
    .byte $04 ; |     X  | $95BE
    .byte $04 ; |     X  | $95BF
    .byte $03 ; |      XX| $95C0
    .byte $03 ; |      XX| $95C1
    .byte $03 ; |      XX| $95C2
    .byte $03 ; |      XX| $95C3
    .byte $03 ; |      XX| $95C4
    .byte $03 ; |      XX| $95C5
    .byte $03 ; |      XX| $95C6
    .byte $03 ; |      XX| $95C7
    .byte $03 ; |      XX| $95C8
    .byte $03 ; |      XX| $95C9
    .byte $03 ; |      XX| $95CA
    .byte $03 ; |      XX| $95CB
    .byte $03 ; |      XX| $95CC
    .byte $03 ; |      XX| $95CD
    .byte $03 ; |      XX| $95CE
    .byte $03 ; |      XX| $95CF
    .byte $03 ; |      XX| $95D0
    .byte $03 ; |      XX| $95D1
    .byte $03 ; |      XX| $95D2
    .byte $03 ; |      XX| $95D3
    .byte $03 ; |      XX| $95D4
    .byte $02 ; |      X | $95D5
    .byte $02 ; |      X | $95D6
    .byte $02 ; |      X | $95D7
    .byte $02 ; |      X | $95D8
    .byte $02 ; |      X | $95D9
    .byte $02 ; |      X | $95DA
    .byte $02 ; |      X | $95DB
    .byte $02 ; |      X | $95DC
    .byte $02 ; |      X | $95DD
    .byte $02 ; |      X | $95DE
    .byte $02 ; |      X | $95DF
    .byte $02 ; |      X | $95E0
    .byte $02 ; |      X | $95E1
    .byte $02 ; |      X | $95E2
    .byte $02 ; |      X | $95E3
    .byte $02 ; |      X | $95E4
    .byte $02 ; |      X | $95E5
    .byte $02 ; |      X | $95E6
    .byte $02 ; |      X | $95E7
    .byte $02 ; |      X | $95E8
    .byte $02 ; |      X | $95E9
    .byte $02 ; |      X | $95EA
    .byte $02 ; |      X | $95EB
    .byte $02 ; |      X | $95EC
    .byte $02 ; |      X | $95ED
    .byte $02 ; |      X | $95EE
    .byte $02 ; |      X | $95EF
    .byte $02 ; |      X | $95F0
    .byte $02 ; |      X | $95F1
    .byte $02 ; |      X | $95F2
    .byte $02 ; |      X | $95F3
    .byte $02 ; |      X | $95F4
    .byte $02 ; |      X | $95F5
    .byte $02 ; |      X | $95F6
    .byte $02 ; |      X | $95F7
    .byte $02 ; |      X | $95F8
    .byte $02 ; |      X | $95F9
    .byte $02 ; |      X | $95FA
    .byte $02 ; |      X | $95FB
    .byte $02 ; |      X | $95FC
    .byte $02 ; |      X | $95FD
    .byte $02 ; |      X | $95FE
    .byte $02 ; |      X | $95FF
    .byte $01 ; |       X| $9600
    .byte $01 ; |       X| $9601
    .byte $01 ; |       X| $9602
    .byte $01 ; |       X| $9603
    .byte $01 ; |       X| $9604
    .byte $01 ; |       X| $9605
    .byte $01 ; |       X| $9606
    .byte $01 ; |       X| $9607
    .byte $01 ; |       X| $9608
    .byte $01 ; |       X| $9609
    .byte $01 ; |       X| $960A
    .byte $01 ; |       X| $960B
    .byte $01 ; |       X| $960C
    .byte $01 ; |       X| $960D
    .byte $01 ; |       X| $960E
    .byte $01 ; |       X| $960F
    .byte $01 ; |       X| $9610
    .byte $01 ; |       X| $9611
    .byte $01 ; |       X| $9612
    .byte $01 ; |       X| $9613
    .byte $01 ; |       X| $9614
    .byte $01 ; |       X| $9615
    .byte $01 ; |       X| $9616
    .byte $01 ; |       X| $9617
    .byte $01 ; |       X| $9618
    .byte $01 ; |       X| $9619
    .byte $01 ; |       X| $961A
    .byte $01 ; |       X| $961B
    .byte $01 ; |       X| $961C
    .byte $01 ; |       X| $961D
    .byte $01 ; |       X| $961E
    .byte $01 ; |       X| $961F
    .byte $01 ; |       X| $9620
    .byte $01 ; |       X| $9621
    .byte $01 ; |       X| $9622
    .byte $01 ; |       X| $9623
    .byte $01 ; |       X| $9624
    .byte $01 ; |       X| $9625
    .byte $01 ; |       X| $9626
    .byte $01 ; |       X| $9627
    .byte $01 ; |       X| $9628
    .byte $01 ; |       X| $9629
    .byte $01 ; |       X| $962A
    .byte $01 ; |       X| $962B
    .byte $01 ; |       X| $962C
    .byte $01 ; |       X| $962D
    .byte $01 ; |       X| $962E
    .byte $01 ; |       X| $962F
    .byte $01 ; |       X| $9630
    .byte $01 ; |       X| $9631
    .byte $01 ; |       X| $9632
    .byte $01 ; |       X| $9633
    .byte $01 ; |       X| $9634
    .byte $01 ; |       X| $9635
    .byte $01 ; |       X| $9636
    .byte $01 ; |       X| $9637
    .byte $01 ; |       X| $9638
    .byte $01 ; |       X| $9639
    .byte $01 ; |       X| $963A
    .byte $01 ; |       X| $963B
    .byte $01 ; |       X| $963C
    .byte $01 ; |       X| $963D
    .byte $01 ; |       X| $963E
    .byte $01 ; |       X| $963F
    .byte $01 ; |       X| $9640
    .byte $01 ; |       X| $9641
    .byte $01 ; |       X| $9642
    .byte $01 ; |       X| $9643
    .byte $01 ; |       X| $9644
    .byte $01 ; |       X| $9645
    .byte $01 ; |       X| $9646
    .byte $01 ; |       X| $9647
    .byte $01 ; |       X| $9648
    .byte $01 ; |       X| $9649
    .byte $01 ; |       X| $964A
    .byte $01 ; |       X| $964B
    .byte $01 ; |       X| $964C
    .byte $01 ; |       X| $964D
    .byte $01 ; |       X| $964E
    .byte $01 ; |       X| $964F
    .byte $01 ; |       X| $9650
    .byte $01 ; |       X| $9651
    .byte $01 ; |       X| $9652
    .byte $01 ; |       X| $9653
    .byte $01 ; |       X| $9654
    .byte $01 ; |       X| $9655
    .byte $01 ; |       X| $9656
    .byte $01 ; |       X| $9657
    .byte $01 ; |       X| $9658
    .byte $01 ; |       X| $9659
    .byte $01 ; |       X| $965A
    .byte $01 ; |       X| $965B
    .byte $01 ; |       X| $965C
    .byte $01 ; |       X| $965D
    .byte $01 ; |       X| $965E
    .byte $01 ; |       X| $965F
    .byte $01 ; |       X| $9660
    .byte $01 ; |       X| $9661
    .byte $01 ; |       X| $9662
    .byte $01 ; |       X| $9663
    .byte $01 ; |       X| $9664
    .byte $01 ; |       X| $9665
    .byte $01 ; |       X| $9666
    .byte $01 ; |       X| $9667
    .byte $01 ; |       X| $9668
    .byte $01 ; |       X| $9669
    .byte $01 ; |       X| $966A
    .byte $01 ; |       X| $966B
    .byte $01 ; |       X| $966C
    .byte $01 ; |       X| $966D
    .byte $01 ; |       X| $966E
    .byte $01 ; |       X| $966F
    .byte $01 ; |       X| $9670
    .byte $01 ; |       X| $9671
    .byte $01 ; |       X| $9672
    .byte $01 ; |       X| $9673
    .byte $01 ; |       X| $9674
    .byte $01 ; |       X| $9675
    .byte $01 ; |       X| $9676
    .byte $01 ; |       X| $9677
    .byte $01 ; |       X| $9678
    .byte $01 ; |       X| $9679
    .byte $01 ; |       X| $967A
    .byte $01 ; |       X| $967B
    .byte $01 ; |       X| $967C
    .byte $01 ; |       X| $967D
    .byte $01 ; |       X| $967E
L967F:
    .byte $00 ; |        | $967F
    .byte $00 ; |        | $9680
    .byte $00 ; |        | $9681
    .byte $55 ; | X X X X| $9682
    .byte $00 ; |        | $9683
    .byte $33 ; |  XX  XX| $9684
    .byte $AA ; |X X X X | $9685
    .byte $92 ; |X  X  X | $9686
    .byte $00 ; |        | $9687
    .byte $71 ; | XXX   X| $9688
    .byte $99 ; |X  XX  X| $9689
    .byte $45 ; | X   X X| $968A
    .byte $55 ; | X X X X| $968B
    .byte $B1 ; |X XX   X| $968C
    .byte $49 ; | X  X  X| $968D
    .byte $11 ; |   X   X| $968E
    .byte $00 ; |        | $968F
    .byte $0F ; |    XXXX| $9690
    .byte $38 ; |  XXX   | $9691
    .byte $79 ; | XXXX  X| $9692
    .byte $CC ; |XX  XX  | $9693
    .byte $30 ; |  XX    | $9694
    .byte $A2 ; |X X   X | $9695
    .byte $21 ; |  X    X| $9696
    .byte $AA ; |X X X X | $9697
    .byte $3D ; |  XXXX X| $9698
    .byte $D8 ; |XX XX   | $9699
    .byte $7B ; | XXXX XX| $969A
    .byte $24 ; |  X  X  | $969B
    .byte $D3 ; |XX X  XX| $969C
    .byte $88 ; |X   X   | $969D
    .byte $42 ; | X    X | $969E
    .byte $00 ; |        | $969F
    .byte $C1 ; |XX     X| $96A0
    .byte $87 ; |X    XXX| $96A1
    .byte $50 ; | X X    | $96A2
    .byte $1C ; |   XXX  | $96A3
    .byte $EB ; |XXX X XX| $96A4
    .byte $BC ; |X XXXX  | $96A5
    .byte $90 ; |X  X    | $96A6
    .byte $66 ; | XX  XX | $96A7
    .byte $3E ; |  XXXXX | $96A8
    .byte $18 ; |   XX   | $96A9
    .byte $F4 ; |XXXX X  | $96AA
    .byte $D1 ; |XX X   X| $96AB
    .byte $B0 ; |X XX    | $96AC
    .byte $90 ; |X  X    | $96AD
    .byte $72 ; | XXX  X | $96AE
    .byte $55 ; | X X X X| $96AF
    .byte $39 ; |  XXX  X| $96B0
    .byte $1E ; |   XXXX | $96B1
    .byte $05 ; |     X X| $96B2
    .byte $EC ; |XXX XX  | $96B3
    .byte $D4 ; |XX X X  | $96B4
    .byte $BD ; |X XXXX X| $96B5
    .byte $A7 ; |X X  XXX| $96B6
    .byte $92 ; |X  X  X | $96B7
    .byte $7D ; | XXXXX X| $96B8
    .byte $69 ; | XX X  X| $96B9
    .byte $56 ; | X X XX | $96BA
    .byte $44 ; | X   X  | $96BB
    .byte $32 ; |  XX  X | $96BC
    .byte $21 ; |  X    X| $96BD
    .byte $10 ; |   X    | $96BE
    .byte $00 ; |        | $96BF
    .byte $F0 ; |XXXX    | $96C0
    .byte $E0 ; |XXX     | $96C1
    .byte $D2 ; |XX X  X | $96C2
    .byte $C3 ; |XX    XX| $96C3
    .byte $B5 ; |X XX X X| $96C4
    .byte $A8 ; |X X X   | $96C5
    .byte $9B ; |X  XX XX| $96C6
    .byte $8E ; |X   XXX | $96C7
    .byte $81 ; |X      X| $96C8
    .byte $75 ; | XXX X X| $96C9
    .byte $69 ; | XX X  X| $96CA
    .byte $5E ; | X XXXX | $96CB
    .byte $53 ; | X X  XX| $96CC
    .byte $48 ; | X  X   | $96CD
    .byte $3D ; |  XXXX X| $96CE
    .byte $33 ; |  XX  XX| $96CF
    .byte $29 ; |  X X  X| $96D0
    .byte $1F ; |   XXXXX| $96D1
    .byte $15 ; |   X X X| $96D2
    .byte $0C ; |    XX  | $96D3
    .byte $03 ; |      XX| $96D4
    .byte $FA ; |XXXXX X | $96D5
    .byte $F1 ; |XXXX   X| $96D6
    .byte $E8 ; |XXX X   | $96D7
    .byte $E0 ; |XXX     | $96D8
    .byte $D8 ; |XX XX   | $96D9
    .byte $D0 ; |XX X    | $96DA
    .byte $C8 ; |XX  X   | $96DB
    .byte $C0 ; |XX      | $96DC
    .byte $B9 ; |X XXX  X| $96DD
    .byte $B1 ; |X XX   X| $96DE
    .byte $AA ; |X X X X | $96DF
    .byte $A3 ; |X X   XX| $96E0
    .byte $9C ; |X  XXX  | $96E1
    .byte $95 ; |X  X X X| $96E2
    .byte $8F ; |X   XXXX| $96E3
    .byte $88 ; |X   X   | $96E4
    .byte $82 ; |X     X | $96E5
    .byte $7C ; | XXXXX  | $96E6
    .byte $76 ; | XXX XX | $96E7
    .byte $70 ; | XXX    | $96E8
    .byte $6A ; | XX X X | $96E9
    .byte $64 ; | XX  X  | $96EA
    .byte $5E ; | X XXXX | $96EB
    .byte $59 ; | X XX  X| $96EC
    .byte $53 ; | X X  XX| $96ED
    .byte $4E ; | X  XXX | $96EE
    .byte $49 ; | X  X  X| $96EF
    .byte $43 ; | X    XX| $96F0
    .byte $3E ; |  XXXXX | $96F1
    .byte $39 ; |  XXX  X| $96F2
    .byte $34 ; |  XX X  | $96F3
    .byte $30 ; |  XX    | $96F4
    .byte $2B ; |  X X XX| $96F5
    .byte $26 ; |  X  XX | $96F6
    .byte $22 ; |  X   X | $96F7
    .byte $1D ; |   XXX X| $96F8
    .byte $19 ; |   XX  X| $96F9
    .byte $14 ; |   X X  | $96FA
    .byte $10 ; |   X    | $96FB
    .byte $0C ; |    XX  | $96FC
    .byte $08 ; |    X   | $96FD
    .byte $04 ; |     X  | $96FE
    .byte $00 ; |        | $96FF
    .byte $FC ; |XXXXXX  | $9700
    .byte $F8 ; |XXXXX   | $9701
    .byte $F4 ; |XXXX X  | $9702
    .byte $F0 ; |XXXX    | $9703
    .byte $EC ; |XXX XX  | $9704
    .byte $E9 ; |XXX X  X| $9705
    .byte $E5 ; |XXX  X X| $9706
    .byte $E1 ; |XXX    X| $9707
    .byte $DE ; |XX XXXX | $9708
    .byte $DA ; |XX XX X | $9709
    .byte $D7 ; |XX X XXX| $970A
    .byte $D4 ; |XX X X  | $970B
    .byte $D0 ; |XX X    | $970C
    .byte $CD ; |XX  XX X| $970D
    .byte $CA ; |XX  X X | $970E
    .byte $C7 ; |XX   XXX| $970F
    .byte $C3 ; |XX    XX| $9710
    .byte $C0 ; |XX      | $9711
    .byte $BD ; |X XXXX X| $9712
    .byte $BA ; |X XXX X | $9713
    .byte $B7 ; |X XX XXX| $9714
    .byte $B4 ; |X XX X  | $9715
    .byte $B2 ; |X XX  X | $9716
    .byte $AF ; |X X XXXX| $9717
    .byte $AC ; |X X XX  | $9718
    .byte $A9 ; |X X X  X| $9719
    .byte $A6 ; |X X  XX | $971A
    .byte $A4 ; |X X  X  | $971B
    .byte $A1 ; |X X    X| $971C
    .byte $9E ; |X  XXXX | $971D
    .byte $9C ; |X  XXX  | $971E
    .byte $99 ; |X  XX  X| $971F
    .byte $97 ; |X  X XXX| $9720
    .byte $94 ; |X  X X  | $9721
    .byte $92 ; |X  X  X | $9722
    .byte $8F ; |X   XXXX| $9723
    .byte $8D ; |X   XX X| $9724
    .byte $8A ; |X   X X | $9725
    .byte $88 ; |X   X   | $9726
    .byte $86 ; |X    XX | $9727
    .byte $83 ; |X     XX| $9728
    .byte $81 ; |X      X| $9729
    .byte $7F ; | XXXXXXX| $972A
    .byte $7D ; | XXXXX X| $972B
    .byte $7A ; | XXXX X | $972C
    .byte $78 ; | XXXX   | $972D
    .byte $76 ; | XXX XX | $972E
    .byte $74 ; | XXX X  | $972F
    .byte $72 ; | XXX  X | $9730
    .byte $70 ; | XXX    | $9731
    .byte $6E ; | XX XXX | $9732
    .byte $6C ; | XX XX  | $9733
    .byte $6A ; | XX X X | $9734
    .byte $68 ; | XX X   | $9735
    .byte $66 ; | XX  XX | $9736
    .byte $64 ; | XX  X  | $9737
    .byte $62 ; | XX   X | $9738
    .byte $60 ; | XX     | $9739
    .byte $5E ; | X XXXX | $973A
    .byte $5C ; | X XXX  | $973B
    .byte $5A ; | X XX X | $973C
    .byte $58 ; | X XX   | $973D
    .byte $57 ; | X X XXX| $973E
    .byte $55 ; | X X X X| $973F
    .byte $53 ; | X X  XX| $9740
    .byte $51 ; | X X   X| $9741
    .byte $50 ; | X X    | $9742
    .byte $4E ; | X  XXX | $9743
    .byte $4C ; | X  XX  | $9744
    .byte $4A ; | X  X X | $9745
    .byte $49 ; | X  X  X| $9746
    .byte $47 ; | X   XXX| $9747
    .byte $46 ; | X   XX | $9748
    .byte $44 ; | X   X  | $9749
    .byte $42 ; | X    X | $974A
    .byte $41 ; | X     X| $974B
    .byte $3F ; |  XXXXXX| $974C
    .byte $3E ; |  XXXXX | $974D
    .byte $3C ; |  XXXX  | $974E
    .byte $3B ; |  XXX XX| $974F
    .byte $39 ; |  XXX  X| $9750
    .byte $38 ; |  XXX   | $9751
    .byte $36 ; |  XX XX | $9752
    .byte $35 ; |  XX X X| $9753
    .byte $33 ; |  XX  XX| $9754
    .byte $32 ; |  XX  X | $9755
    .byte $30 ; |  XX    | $9756
    .byte $2F ; |  X XXXX| $9757
    .byte $2E ; |  X XXX | $9758
    .byte $2C ; |  X XX  | $9759
    .byte $2B ; |  X X XX| $975A
    .byte $29 ; |  X X  X| $975B
    .byte $28 ; |  X X   | $975C
    .byte $27 ; |  X  XXX| $975D
    .byte $25 ; |  X  X X| $975E
    .byte $24 ; |  X  X  | $975F
    .byte $23 ; |  X   XX| $9760
    .byte $21 ; |  X    X| $9761
    .byte $20 ; |  X     | $9762
    .byte $1F ; |   XXXXX| $9763
    .byte $1E ; |   XXXX | $9764
    .byte $1C ; |   XXX  | $9765
    .byte $1B ; |   XX XX| $9766
    .byte $1A ; |   XX X | $9767
    .byte $19 ; |   XX  X| $9768
    .byte $18 ; |   XX   | $9769
    .byte $16 ; |   X XX | $976A
    .byte $15 ; |   X X X| $976B
    .byte $14 ; |   X X  | $976C
    .byte $13 ; |   X  XX| $976D
    .byte $12 ; |   X  X | $976E
    .byte $11 ; |   X   X| $976F
    .byte $0F ; |    XXXX| $9770
    .byte $0E ; |    XXX | $9771
    .byte $0D ; |    XX X| $9772
    .byte $0C ; |    XX  | $9773
    .byte $0B ; |    X XX| $9774
    .byte $0A ; |    X X | $9775
    .byte $09 ; |    X  X| $9776
    .byte $08 ; |    X   | $9777
    .byte $07 ; |     XXX| $9778
    .byte $06 ; |     XX | $9779
    .byte $05 ; |     X X| $977A
    .byte $04 ; |     X  | $977B
    .byte $03 ; |      XX| $977C
    .byte $02 ; |      X | $977D
    .byte $01 ; |       X| $977E
L977F:
    .word L978D          ; $977F
    .word L97BA          ; $9781
    .word L97E7          ; $9783
    .word L9814          ; $9785
    .word L97E7          ; $9787
    .word L97BA          ; $9789
    .word L978D          ; $978B
L978D:
    .byte $02 ; |      X | $978D
    .byte $04 ; |     X  | $978E
    .byte $06 ; |     XX | $978F
    .byte $06 ; |     XX | $9790
    .byte $06 ; |     XX | $9791
    .byte $06 ; |     XX | $9792
    .byte $08 ; |    X   | $9793
    .byte $08 ; |    X   | $9794
    .byte $0A ; |    X X | $9795
    .byte $0E ; |    XXX | $9796
    .byte $10 ; |   X    | $9797
    .byte $12 ; |   X  X | $9798
    .byte $12 ; |   X  X | $9799
    .byte $14 ; |   X X  | $979A
    .byte $16 ; |   X XX | $979B
    .byte $17 ; |   X XXX| $979C
    .byte $18 ; |   XX   | $979D
    .byte $19 ; |   XX  X| $979E
    .byte $1A ; |   XX X | $979F
    .byte $1B ; |   XX XX| $97A0
    .byte $1C ; |   XXX  | $97A1
    .byte $1D ; |   XXX X| $97A2
    .byte $1E ; |   XXXX | $97A3
    .byte $1F ; |   XXXXX| $97A4
    .byte $20 ; |  X     | $97A5
    .byte $21 ; |  X    X| $97A6
    .byte $21 ; |  X    X| $97A7
    .byte $22 ; |  X   X | $97A8
    .byte $22 ; |  X   X | $97A9
    .byte $22 ; |  X   X | $97AA
    .byte $22 ; |  X   X | $97AB
    .byte $22 ; |  X   X | $97AC
    .byte $22 ; |  X   X | $97AD
    .byte $22 ; |  X   X | $97AE
    .byte $22 ; |  X   X | $97AF
    .byte $22 ; |  X   X | $97B0
    .byte $22 ; |  X   X | $97B1
    .byte $22 ; |  X   X | $97B2
    .byte $22 ; |  X   X | $97B3
    .byte $22 ; |  X   X | $97B4
    .byte $22 ; |  X   X | $97B5
    .byte $22 ; |  X   X | $97B6
    .byte $22 ; |  X   X | $97B7
    .byte $22 ; |  X   X | $97B8
    .byte $22 ; |  X   X | $97B9
L97BA:
    .byte $02 ; |      X | $97BA
    .byte $04 ; |     X  | $97BB
    .byte $04 ; |     X  | $97BC
    .byte $04 ; |     X  | $97BD
    .byte $06 ; |     XX | $97BE
    .byte $06 ; |     XX | $97BF
    .byte $06 ; |     XX | $97C0
    .byte $08 ; |    X   | $97C1
    .byte $08 ; |    X   | $97C2
    .byte $0C ; |    XX  | $97C3
    .byte $10 ; |   X    | $97C4
    .byte $12 ; |   X  X | $97C5
    .byte $13 ; |   X  XX| $97C6
    .byte $13 ; |   X  XX| $97C7
    .byte $15 ; |   X X X| $97C8
    .byte $16 ; |   X XX | $97C9
    .byte $16 ; |   X XX | $97CA
    .byte $17 ; |   X XXX| $97CB
    .byte $17 ; |   X XXX| $97CC
    .byte $17 ; |   X XXX| $97CD
    .byte $18 ; |   XX   | $97CE
    .byte $18 ; |   XX   | $97CF
    .byte $19 ; |   XX  X| $97D0
    .byte $19 ; |   XX  X| $97D1
    .byte $1B ; |   XX XX| $97D2
    .byte $1C ; |   XXX  | $97D3
    .byte $1C ; |   XXX  | $97D4
    .byte $1C ; |   XXX  | $97D5
    .byte $1C ; |   XXX  | $97D6
    .byte $1C ; |   XXX  | $97D7
    .byte $1C ; |   XXX  | $97D8
    .byte $1C ; |   XXX  | $97D9
    .byte $1C ; |   XXX  | $97DA
    .byte $1C ; |   XXX  | $97DB
    .byte $1C ; |   XXX  | $97DC
    .byte $1C ; |   XXX  | $97DD
    .byte $1C ; |   XXX  | $97DE
    .byte $1C ; |   XXX  | $97DF
    .byte $1C ; |   XXX  | $97E0
    .byte $1C ; |   XXX  | $97E1
    .byte $1C ; |   XXX  | $97E2
    .byte $1C ; |   XXX  | $97E3
    .byte $1C ; |   XXX  | $97E4
    .byte $1C ; |   XXX  | $97E5
    .byte $1C ; |   XXX  | $97E6
L97E7:
    .byte $02 ; |      X | $97E7
    .byte $04 ; |     X  | $97E8
    .byte $04 ; |     X  | $97E9
    .byte $04 ; |     X  | $97EA
    .byte $04 ; |     X  | $97EB
    .byte $04 ; |     X  | $97EC
    .byte $06 ; |     XX | $97ED
    .byte $06 ; |     XX | $97EE
    .byte $06 ; |     XX | $97EF
    .byte $09 ; |    X  X| $97F0
    .byte $0A ; |    X X | $97F1
    .byte $0A ; |    X X | $97F2
    .byte $0A ; |    X X | $97F3
    .byte $0C ; |    XX  | $97F4
    .byte $0C ; |    XX  | $97F5
    .byte $0D ; |    XX X| $97F6
    .byte $0D ; |    XX X| $97F7
    .byte $0E ; |    XXX | $97F8
    .byte $0E ; |    XXX | $97F9
    .byte $0E ; |    XXX | $97FA
    .byte $0F ; |    XXXX| $97FB
    .byte $0F ; |    XXXX| $97FC
    .byte $0F ; |    XXXX| $97FD
    .byte $0F ; |    XXXX| $97FE
    .byte $0F ; |    XXXX| $97FF
    .byte $10 ; |   X    | $9800
    .byte $10 ; |   X    | $9801
    .byte $10 ; |   X    | $9802
    .byte $10 ; |   X    | $9803
    .byte $11 ; |   X   X| $9804
    .byte $11 ; |   X   X| $9805
    .byte $11 ; |   X   X| $9806
    .byte $11 ; |   X   X| $9807
    .byte $12 ; |   X  X | $9808
    .byte $12 ; |   X  X | $9809
    .byte $12 ; |   X  X | $980A
    .byte $12 ; |   X  X | $980B
    .byte $12 ; |   X  X | $980C
    .byte $12 ; |   X  X | $980D
    .byte $12 ; |   X  X | $980E
    .byte $12 ; |   X  X | $980F
    .byte $12 ; |   X  X | $9810
    .byte $12 ; |   X  X | $9811
    .byte $12 ; |   X  X | $9812
    .byte $12 ; |   X  X | $9813
L9814:
    .byte $00 ; |        | $9814
    .byte $00 ; |        | $9815
    .byte $00 ; |        | $9816
    .byte $00 ; |        | $9817
    .byte $00 ; |        | $9818
    .byte $00 ; |        | $9819
    .byte $00 ; |        | $981A
    .byte $00 ; |        | $981B
    .byte $00 ; |        | $981C
    .byte $00 ; |        | $981D
    .byte $00 ; |        | $981E
    .byte $00 ; |        | $981F
    .byte $00 ; |        | $9820
    .byte $00 ; |        | $9821
    .byte $00 ; |        | $9822
    .byte $00 ; |        | $9823
    .byte $00 ; |        | $9824
    .byte $00 ; |        | $9825
    .byte $00 ; |        | $9826
    .byte $00 ; |        | $9827
    .byte $00 ; |        | $9828
    .byte $00 ; |        | $9829
    .byte $00 ; |        | $982A
    .byte $00 ; |        | $982B
    .byte $00 ; |        | $982C
    .byte $00 ; |        | $982D
    .byte $00 ; |        | $982E
    .byte $00 ; |        | $982F
    .byte $00 ; |        | $9830
    .byte $00 ; |        | $9831
    .byte $00 ; |        | $9832
    .byte $00 ; |        | $9833
    .byte $00 ; |        | $9834
    .byte $00 ; |        | $9835
    .byte $00 ; |        | $9836
    .byte $00 ; |        | $9837
    .byte $00 ; |        | $9838
    .byte $00 ; |        | $9839
    .byte $00 ; |        | $983A
    .byte $00 ; |        | $983B
    .byte $00 ; |        | $983C
    .byte $00 ; |        | $983D
    .byte $00 ; |        | $983E
    .byte $00 ; |        | $983F
    .byte $00 ; |        | $9840

L9841:
    lda    #$00                  ; 2
    sta    AUDC0                 ; 3
    sta    AUDC1                 ; 3
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    sc_7A                 ; 4
    ldx    #$2B                  ; 2
L9850:
    sta    sc_41,X               ; 5
    sta    ram_BE,X              ; 4
    dex                          ; 2
    bpl    L9850                 ; 2³
    sta    ram_E4                ; 3
    ldx    #$0E                  ; 2
L985C:
    sta    sc_37,X               ; 5
    sta    ram_96,X              ; 4
    dex                          ; 2
    bpl    L985C                 ; 2³
    sta    ram_8C                ; 3
    sta    ram_8D                ; 3
    lda    #$07                  ; 2
    sta    ram_E5                ; 3
    lda    #$14                  ; 2
    sta    ram_8A                ; 3
    lda    #$FF                  ; 2
    sta    sc_41                 ; 4
    lda    #$44                  ; 2
    sta    ram_E6                ; 3
L9879:
    lda    #$03                  ; 2
    sta    VSYNC                 ; 3
    sta    RSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    VSYNC                 ; 3
    lda    #$03                  ; 2
    sta    VBLANK                ; 3
    lda    #$28                  ; 2
    sta    TIM64T                ; 4
    inc    ram_92                ; 5
    lda    ram_8A                ; 3
    beq    L98A0                 ; 2³
    dec    ram_8A                ; 5
    lda    ram_8A                ; 3
    bne    L98A0                 ; 2³
    lda    #$00                  ; 2
    sta    AUDC1                 ; 3
L98A0:
    lda    SWCHA                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_81                ; 3
    lda    #$16                  ; 2
    sta    sc_7E                 ; 4
    ldy    #$01                  ; 2
    lda    #$04                  ; 2
    sta    sc_7D                 ; 4
    jsr    L9F50                 ; 6   bankswitch, goto LB112
    lda    ram_92                ; 3
    and    #$01                  ; 2
    beq    L98C2                 ; 2³
    lda    #$00                  ; 2
    sta    AUDC0                 ; 3
L98C2:
    ldy    INTIM                 ; 4
    bne    L98C2                 ; 2³
    lda    #$00                  ; 2
    sta    VBLANK                ; 3
    sta    ENAM0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    ENAM1                 ; 3
    sta    COLUBK                ; 3
    sta    ENABL                 ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$86                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    CXCLR                 ; 3
    sta    CXCLR                 ; 3
    sta    CXCLR                 ; 3
    sta    CXCLR                 ; 3
    sta    CXCLR                 ; 3
    sta    CXCLR                 ; 3
    sta    RESP0                 ; 3
    nop                          ; 2
    nop                          ; 2
    sta    RESP1                 ; 3
    nop                          ; 2
    sta    RESM1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$1E                  ; 2
L98F8:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    L98F8                 ; 2³
    ldy    #$84                  ; 2
    ldx    #$06                  ; 2
    stx    ram_8B                ; 3
    ldx    #$00                  ; 2
L9905:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    L9A8E,Y               ; 4
    beq    L990F                 ; 2³
    eor    sc_41|READ,X          ; 4
L990F:
    sta    GRP0                  ; 3
    lda    L9B13,Y               ; 4
    beq    L9919                 ; 2³
    eor    sc_42|READ,X          ; 4
L9919:
    sta    GRP1                  ; 3
    dec    ram_8B                ; 5
    bpl    L9925                 ; 2³
    inx                          ; 2
    inx                          ; 2
    lda    #$06                  ; 2
    sta    ram_8B                ; 3
L9925:
    dey                          ; 2
    bne    L9905                 ; 2³
    jsr    L9A4F                 ; 6
    ldy    #$00                  ; 2
    lda    #$04                  ; 2
    sta    sc_7D                 ; 4
    jsr    L9F50                 ; 6   bankswitch, goto LB112
    ldx    #$14                  ; 2
L9937:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    L9937                 ; 2³
    lda    #$2A                  ; 2
    sta    TIM64T                ; 4
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    ram_92                ; 3
    and    #$03                  ; 2
    beq    L9952                 ; 2³
    jmp    L99EE                 ; 3

L9952:
    lda    ram_81                ; 3
    cmp    #$0F                  ; 2
    beq    L99BE                 ; 2³
    cmp    #$0E                  ; 2
    beq    L999C                 ; 2³
    cmp    #$0D                  ; 2
    beq    L99AC                 ; 2³
    cmp    #$0B                  ; 2
    beq    L9979                 ; 2³
    cmp    #$07                  ; 2
    bne    L99BE                 ; 2³
    ldy    ram_8C                ; 3
    lda    #$00                  ; 2
    sta    sc_41,Y               ; 5
    iny                          ; 2
    cpy    #$26                  ; 2
    bcc    L9985                 ; 2³
    ldy    #$00                  ; 2
    jmp    L9985                 ; 3

L9979:
    ldy    ram_8C                ; 3
    lda    #$00                  ; 2
    sta    sc_41,Y               ; 5
    dey                          ; 2
    bpl    L9985                 ; 2³
    ldy    #$26                  ; 2
L9985:
    lda    #$FF                  ; 2
    sty    ram_8C                ; 3
    ora    sc_41|READ,Y          ; 4
    sta    sc_41,Y               ; 5
    ldx    #$08                  ; 2
    stx    AUDC0                 ; 3
    stx    AUDF0                 ; 3
    lda    #$0F                  ; 2
    sta    AUDV0                 ; 3
    jmp    L99EE                 ; 3

L999C:
    ldy    ram_8C                ; 3
    lda    #$00                  ; 2
    sta    sc_41,Y               ; 5
    dey                          ; 2
    dey                          ; 2
    bpl    L9985                 ; 2³
    ldy    #$24                  ; 2
    jmp    L9985                 ; 3

L99AC:
    ldy    ram_8C                ; 3
    lda    #$00                  ; 2
    sta    sc_41,Y               ; 5
    iny                          ; 2
    iny                          ; 2
    cpy    #$26                  ; 2
    bcc    L9985                 ; 2³
    ldy    #$00                  ; 2
    jmp    L9985                 ; 3

L99BE:
    bit    INPT4|$30             ; 3
    bmi    L99EE                 ; 2³
    lda    ram_8A                ; 3
    bne    L99EE                 ; 2³
    lda    #$14                  ; 2
    sta    ram_8A                ; 3
    ldy    ram_8C                ; 3
    ldx    ram_8D                ; 3
    cpy    #$24                  ; 2
    bcs    L99F6                 ; 2³
    tya                          ; 2
    sta    sc_37,X               ; 5
    lda    CodeIndexTab,Y        ; 4
    sta    ram_96,X              ; 4
    inx                          ; 2
    stx    ram_8D                ; 3
    cpx    #$07                  ; 2
    bcs    L99F6                 ; 2³
    lda    #$1A                  ; 2
    sta    AUDF1                 ; 3
    lda    #$04                  ; 2
    sta    AUDV1                 ; 3
    lda    #$03                  ; 2
    sta    AUDC0                 ; 3
L99EE:
    ldy    INTIM                 ; 4
    bne    L99EE                 ; 2³
    jmp    L9879                 ; 3

L99F6:
    dex                          ; 2
    stx    ram_8C                ; 3
L99F9:
    lda    sc_37|READ,X          ; 4
    cmp    L9A80,X               ; 4
    bne    L9A17                 ; 2³
    dex                          ; 2
    bpl    L99F9                 ; 2³+1
    ldx    ram_8C                ; 3
    lda    L9A87,X               ; 4
    sta    sc_35                 ; 4
    lda    #$88                  ; 2
    sta    sc_7A                 ; 4
    sta    sc_52                 ; 4
    jmp    L9F6C                 ; 3

L9A17:
    lda    #$FF                  ; 2
    sta    sc_35                 ; 4
    sta    sc_52                 ; 4
    lda    #$00                  ; 2
    sta    sc_7A                 ; 4
    jmp    L9F6C                 ; 3

CodeIndexTab:
    .byte 12,13          ; $9A27  A  B   index for LB6CD, after a little manipulation...
    .byte 14,15          ; $9A29  C  D
    .byte 16,17          ; $9A2B  E  F
    .byte 18,19          ; $9A2D  G  H
    .byte 20,21          ; $9A2F  I  J
    .byte 22,23          ; $9A31  K  L
    .byte 24,25          ; $9A33  M  N
    .byte 26,27          ; $9A35  O  P
    .byte 28,29          ; $9A37  Q  R
    .byte 30,31          ; $9A39  S  T
    .byte 38,33          ; $9A3B  U  V   a little strangeness, 'U' is at 32, but also at 38!
    .byte 34,35          ; $9A3D  W  X
    .byte 36,37          ; $9A3F  Y  Z

    .byte  2, 7          ; $9A41  0  5
    .byte  3, 8          ; $9A43  1  6
    .byte  4, 9          ; $9A45  2  7
    .byte  5,10          ; $9A47  3  8
    .byte  6,11          ; $9A49  4  9

    .byte  1, 1          ; $9A4B  -  -   '*' is shown on game screen, selecting it boots you out of screen
    .byte  1, 1          ; $9A4D  -  -   these aren't shown on the screen, but you can get there, again you get booted off
                         ;               '\' is not shown or selected here, but is accessed with 39

L9A4F:
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ENAM0                 ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    #$03                  ; 2
    sta    VDELP1                ; 3
    sta    VDELP0                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    HMCLR                 ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

L9A80:
    .byte $13 ; |   X  XX| $9A80
    .byte $02 ; |      X | $9A81
    .byte $1C ; |   XXX  | $9A82
    .byte $0B ; |    X XX| $9A83
    .byte $04 ; |     X  | $9A84
    .byte $23 ; |  X   XX| $9A85
    .byte $07 ; |     XXX| $9A86
L9A87:
    .byte $02 ; |      X | $9A87
    .byte $06 ; |     XX | $9A88
    .byte $0A ; |    X X | $9A89
    .byte $0E ; |    XXX | $9A8A
    .byte $12 ; |   X  X | $9A8B
    .byte $16 ; |   X XX | $9A8C
    .byte $1A ; |   XX X | $9A8D
L9A8E:
    .byte $00 ; |        | $9A8E
    .byte $00 ; |        | $9A8F
    .byte $09 ; |    X  X| $9A90
    .byte $06 ; |     XX | $9A91
    .byte $0F ; |    XXXX| $9A92
    .byte $06 ; |     XX | $9A93
    .byte $09 ; |    X  X| $9A94
    .byte $00 ; |        | $9A95
    .byte $00 ; |        | $9A96
    .byte $02 ; |      X | $9A97
    .byte $1F ; |   XXXXX| $9A98
    .byte $12 ; |   X  X | $9A99
    .byte $0A ; |    X X | $9A9A
    .byte $06 ; |     XX | $9A9B
    .byte $00 ; |        | $9A9C
    .byte $00 ; |        | $9A9D
    .byte $1E ; |   XXXX | $9A9E
    .byte $01 ; |       X| $9A9F
    .byte $0E ; |    XXX | $9AA0
    .byte $01 ; |       X| $9AA1
    .byte $1E ; |   XXXX | $9AA2
    .byte $00 ; |        | $9AA3
    .byte $00 ; |        | $9AA4
    .byte $1F ; |   XXXXX| $9AA5
    .byte $10 ; |   X    | $9AA6
    .byte $0E ; |    XXX | $9AA7
    .byte $01 ; |       X| $9AA8
    .byte $1E ; |   XXXX | $9AA9
    .byte $00 ; |        | $9AAA
    .byte $00 ; |        | $9AAB
    .byte $02 ; |      X | $9AAC
    .byte $02 ; |      X | $9AAD
    .byte $02 ; |      X | $9AAE
    .byte $06 ; |     XX | $9AAF
    .byte $02 ; |      X | $9AB0
    .byte $00 ; |        | $9AB1
    .byte $00 ; |        | $9AB2
    .byte $0E ; |    XXX | $9AB3
    .byte $19 ; |   XX  X| $9AB4
    .byte $15 ; |   X X X| $9AB5
    .byte $13 ; |   X  XX| $9AB6
    .byte $0E ; |    XXX | $9AB7
    .byte $00 ; |        | $9AB8
    .byte $00 ; |        | $9AB9
    .byte $04 ; |     X  | $9ABA
    .byte $04 ; |     X  | $9ABB
    .byte $0A ; |    X X | $9ABC
    .byte $11 ; |   X   X| $9ABD
    .byte $11 ; |   X   X| $9ABE
    .byte $00 ; |        | $9ABF
    .byte $00 ; |        | $9AC0
    .byte $11 ; |   X   X| $9AC1
    .byte $1B ; |   XX XX| $9AC2
    .byte $15 ; |   X X X| $9AC3
    .byte $11 ; |   X   X| $9AC4
    .byte $11 ; |   X   X| $9AC5
    .byte $00 ; |        | $9AC6
    .byte $00 ; |        | $9AC7
    .byte $0F ; |    XXXX| $9AC8
    .byte $11 ; |   X   X| $9AC9
    .byte $11 ; |   X   X| $9ACA
    .byte $11 ; |   X   X| $9ACB
    .byte $11 ; |   X   X| $9ACC
    .byte $00 ; |        | $9ACD
    .byte $00 ; |        | $9ACE
    .byte $1E ; |   XXXX | $9ACF
    .byte $01 ; |       X| $9AD0
    .byte $0E ; |    XXX | $9AD1
    .byte $10 ; |   X    | $9AD2
    .byte $0F ; |    XXXX| $9AD3
    .byte $00 ; |        | $9AD4
    .byte $03 ; |      XX| $9AD5
    .byte $0E ; |    XXX | $9AD6
    .byte $11 ; |   X   X| $9AD7
    .byte $11 ; |   X   X| $9AD8
    .byte $11 ; |   X   X| $9AD9
    .byte $0E ; |    XXX | $9ADA
    .byte $00 ; |        | $9ADB
    .byte $00 ; |        | $9ADC
    .byte $0E ; |    XXX | $9ADD
    .byte $11 ; |   X   X| $9ADE
    .byte $11 ; |   X   X| $9ADF
    .byte $11 ; |   X   X| $9AE0
    .byte $0E ; |    XXX | $9AE1
    .byte $00 ; |        | $9AE2
    .byte $00 ; |        | $9AE3
    .byte $11 ; |   X   X| $9AE4
    .byte $11 ; |   X   X| $9AE5
    .byte $15 ; |   X X X| $9AE6
    .byte $1B ; |   XX XX| $9AE7
    .byte $11 ; |   X   X| $9AE8
    .byte $00 ; |        | $9AE9
    .byte $00 ; |        | $9AEA
    .byte $09 ; |    X  X| $9AEB
    .byte $0A ; |    X X | $9AEC
    .byte $0C ; |    XX  | $9AED
    .byte $0A ; |    X X | $9AEE
    .byte $09 ; |    X  X| $9AEF
    .byte $00 ; |        | $9AF0
    .byte $00 ; |        | $9AF1
    .byte $0E ; |    XXX | $9AF2
    .byte $04 ; |     X  | $9AF3
    .byte $04 ; |     X  | $9AF4
    .byte $04 ; |     X  | $9AF5
    .byte $0E ; |    XXX | $9AF6
    .byte $00 ; |        | $9AF7
    .byte $00 ; |        | $9AF8
    .byte $0F ; |    XXXX| $9AF9
    .byte $11 ; |   X   X| $9AFA
    .byte $13 ; |   X  XX| $9AFB
    .byte $10 ; |   X    | $9AFC
    .byte $0F ; |    XXXX| $9AFD
    .byte $00 ; |        | $9AFE
    .byte $00 ; |        | $9AFF
    .byte $1F ; |   XXXXX| $9B00
    .byte $10 ; |   X    | $9B01
    .byte $1E ; |   XXXX | $9B02
    .byte $10 ; |   X    | $9B03
    .byte $1F ; |   XXXXX| $9B04
    .byte $00 ; |        | $9B05
    .byte $00 ; |        | $9B06
    .byte $0F ; |    XXXX| $9B07
    .byte $10 ; |   X    | $9B08
    .byte $10 ; |   X    | $9B09
    .byte $10 ; |   X    | $9B0A
    .byte $0F ; |    XXXX| $9B0B
    .byte $00 ; |        | $9B0C
    .byte $00 ; |        | $9B0D
    .byte $11 ; |   X   X| $9B0E
    .byte $11 ; |   X   X| $9B0F
    .byte $1F ; |   XXXXX| $9B10
    .byte $11 ; |   X   X| $9B11
    .byte $0E ; |    XXX | $9B12
L9B13:
    .byte $00 ; |        | $9B13
    .byte $00 ; |        | $9B14
    .byte $09 ; |    X  X| $9B15
    .byte $06 ; |     XX | $9B16
    .byte $0F ; |    XXXX| $9B17
    .byte $06 ; |     XX | $9B18
    .byte $09 ; |    X  X| $9B19
    .byte $00 ; |        | $9B1A
    .byte $00 ; |        | $9B1B
    .byte $0E ; |    XXX | $9B1C
    .byte $01 ; |       X| $9B1D
    .byte $0F ; |    XXXX| $9B1E
    .byte $11 ; |   X   X| $9B1F
    .byte $0E ; |    XXX | $9B20
    .byte $00 ; |        | $9B21
    .byte $00 ; |        | $9B22
    .byte $0E ; |    XXX | $9B23
    .byte $11 ; |   X   X| $9B24
    .byte $0E ; |    XXX | $9B25
    .byte $11 ; |   X   X| $9B26
    .byte $0E ; |    XXX | $9B27
    .byte $00 ; |        | $9B28
    .byte $00 ; |        | $9B29
    .byte $04 ; |     X  | $9B2A
    .byte $04 ; |     X  | $9B2B
    .byte $02 ; |      X | $9B2C
    .byte $01 ; |       X| $9B2D
    .byte $1F ; |   XXXXX| $9B2E
    .byte $00 ; |        | $9B2F
    .byte $00 ; |        | $9B30
    .byte $0E ; |    XXX | $9B31
    .byte $11 ; |   X   X| $9B32
    .byte $1E ; |   XXXX | $9B33
    .byte $10 ; |   X    | $9B34
    .byte $0E ; |    XXX | $9B35
    .byte $00 ; |        | $9B36
    .byte $00 ; |        | $9B37
    .byte $1E ; |   XXXX | $9B38
    .byte $01 ; |       X| $9B39
    .byte $1E ; |   XXXX | $9B3A
    .byte $10 ; |   X    | $9B3B
    .byte $1E ; |   XXXX | $9B3C
    .byte $00 ; |        | $9B3D
    .byte $00 ; |        | $9B3E
    .byte $1F ; |   XXXXX| $9B3F
    .byte $08 ; |    X   | $9B40
    .byte $04 ; |     X  | $9B41
    .byte $02 ; |      X | $9B42
    .byte $1F ; |   XXXXX| $9B43
    .byte $00 ; |        | $9B44
    .byte $00 ; |        | $9B45
    .byte $11 ; |   X   X| $9B46
    .byte $0A ; |    X X | $9B47
    .byte $04 ; |     X  | $9B48
    .byte $0A ; |    X X | $9B49
    .byte $11 ; |   X   X| $9B4A
    .byte $00 ; |        | $9B4B
    .byte $00 ; |        | $9B4C
    .byte $04 ; |     X  | $9B4D
    .byte $0A ; |    X X | $9B4E
    .byte $11 ; |   X   X| $9B4F
    .byte $11 ; |   X   X| $9B50
    .byte $11 ; |   X   X| $9B51
    .byte $00 ; |        | $9B52
    .byte $00 ; |        | $9B53
    .byte $04 ; |     X  | $9B54
    .byte $04 ; |     X  | $9B55
    .byte $04 ; |     X  | $9B56
    .byte $04 ; |     X  | $9B57
    .byte $1F ; |   XXXXX| $9B58
    .byte $00 ; |        | $9B59
    .byte $00 ; |        | $9B5A
    .byte $13 ; |   X  XX| $9B5B
    .byte $14 ; |   X X  | $9B5C
    .byte $1E ; |   XXXX | $9B5D
    .byte $11 ; |   X   X| $9B5E
    .byte $1E ; |   XXXX | $9B5F
    .byte $00 ; |        | $9B60
    .byte $00 ; |        | $9B61
    .byte $10 ; |   X    | $9B62
    .byte $10 ; |   X    | $9B63
    .byte $1E ; |   XXXX | $9B64
    .byte $11 ; |   X   X| $9B65
    .byte $1E ; |   XXXX | $9B66
    .byte $00 ; |        | $9B67
    .byte $00 ; |        | $9B68
    .byte $11 ; |   X   X| $9B69
    .byte $13 ; |   X  XX| $9B6A
    .byte $15 ; |   X X X| $9B6B
    .byte $19 ; |   XX  X| $9B6C
    .byte $11 ; |   X   X| $9B6D
    .byte $00 ; |        | $9B6E
    .byte $00 ; |        | $9B6F
    .byte $0F ; |    XXXX| $9B70
    .byte $08 ; |    X   | $9B71
    .byte $08 ; |    X   | $9B72
    .byte $08 ; |    X   | $9B73
    .byte $08 ; |    X   | $9B74
    .byte $00 ; |        | $9B75
    .byte $00 ; |        | $9B76
    .byte $0E ; |    XXX | $9B77
    .byte $11 ; |   X   X| $9B78
    .byte $01 ; |       X| $9B79
    .byte $01 ; |       X| $9B7A
    .byte $01 ; |       X| $9B7B
    .byte $00 ; |        | $9B7C
    .byte $00 ; |        | $9B7D
    .byte $11 ; |   X   X| $9B7E
    .byte $11 ; |   X   X| $9B7F
    .byte $1F ; |   XXXXX| $9B80
    .byte $11 ; |   X   X| $9B81
    .byte $11 ; |   X   X| $9B82
    .byte $00 ; |        | $9B83
    .byte $00 ; |        | $9B84
    .byte $10 ; |   X    | $9B85
    .byte $10 ; |   X    | $9B86
    .byte $1E ; |   XXXX | $9B87
    .byte $10 ; |   X    | $9B88
    .byte $1F ; |   XXXXX| $9B89
    .byte $00 ; |        | $9B8A
    .byte $00 ; |        | $9B8B
    .byte $1E ; |   XXXX | $9B8C
    .byte $11 ; |   X   X| $9B8D
    .byte $11 ; |   X   X| $9B8E
    .byte $11 ; |   X   X| $9B8F
    .byte $1E ; |   XXXX | $9B90
    .byte $00 ; |        | $9B91
    .byte $00 ; |        | $9B92
    .byte $1E ; |   XXXX | $9B93
    .byte $11 ; |   X   X| $9B94
    .byte $1E ; |   XXXX | $9B95
    .byte $11 ; |   X   X| $9B96
    .byte $1E ; |   XXXX | $9B97

L9B98:
    lda    ram_95                ; 3
    sec                          ; 2
    sbc    #$03                  ; 2
    sta    ram_95                ; 3
    cmp    #$A0                  ; 2
    bcc    L9BA7                 ; 2³
    lda    #$9F                  ; 2
    sta    ram_95                ; 3
L9BA7:
    rts                          ; 6

L9BA8:
    lda    ram_95                ; 3
    clc                          ; 2
    adc    #$03                  ; 2
    sta    ram_95                ; 3
    cmp    #$A0                  ; 2
    bcc    L9BB7                 ; 2³
    lda    #$00                  ; 2
    sta    ram_95                ; 3
L9BB7:
    rts                          ; 6


  IF SHOW_BYTES_REMAINING
      ECHO ([$9EFC-*]d), "bytes free BANK_4"
  ENDIF


       ALIGN 512    ; $9C00 - $9DFF

    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; these two pages of filled bytes are free?
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


       ORG $4EFC
      RORG $9EFC

    lda    BANK_2                ; 4
    jmp    M5106|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M5109|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9106|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M510C|BANK_MASK       ; 3

    lda    BANK_1                ; 4
    jmp    M3109|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9109|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M510F|BANK_MASK       ; 3

    lda    BANK_3                ; 4
    jmp    M7106|BANK_MASK       ; 3

    lda    BANK_3                ; 4
    jmp    M7109|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M5112|BANK_MASK       ; 3

    lda    BANK_1                ; 4
    jmp    M310F|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB10C|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB10F|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9112|BANK_MASK       ; 3

L9F50:
    lda    BANK_5                ; 4   bankswitch, goto LB112
    jmp    MB106|BANK_MASK       ; 3

    lda    BANK_7                ; 4
    jmp    MF106|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M910F|BANK_MASK       ; 3

    lda    BANK_6                ; 4
    jmp    MD106|BANK_MASK       ; 3

L9F68:
    lda    BANK_0                ; 4
    rts                          ; 6

L9F6C:
    lda    BANK_3                ; 4
    rts                          ; 6

    lda    BANK_4                ; 4
    rts                          ; 6

    lda    BANK_6                ; 4
    rts                          ; 6


; $9F78 - $9FF3 are free bytes


       ORG $4FF4
      RORG $9FF4

    .byte $00 ; |        | $9FF4
    .byte $00 ; |        | $9FF5
    .byte $00 ; |        | $9FF6
    .byte $00 ; |        | $9FF7
    .byte $00 ; |        | $9FF8
    .byte $00 ; |        | $9FF9
    .byte $00 ; |        | $9FFA
    .byte $00 ; |        | $9FFB

    .word START_4
    .word 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      BANK 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $5000
      RORG $B000

    SC_RAM_SPACE

START_5:
    lda    BANK_1                ; 4
    jmp    START_5               ; 3

MB106:
    jmp    LB112                 ; 3

;$B109:
    jmp    START_5               ; 3   unused

MB10C:
    jmp    LB88B                 ; 3

MB10F:
    jmp    LB90C                 ; 3

LB112:
    cpy    #$00                  ; 2
    beq    LB119                 ; 2³
    jmp    LB120                 ; 3

LB119:
    ldx    #$04                  ; 2
    lda    ram_E6                ; 3
    jmp    LB1CA                 ; 3

LB120:
    lda    sc_7E|READ            ; 4
    asl                          ; 2
    tay                          ; 2
    lda    LB201,Y               ; 4
    sta    ram_93                ; 3
    lda    LB201+1,Y             ; 4
    sta    ram_94                ; 3
    inc    ram_E5                ; 5
    lda    ram_E5                ; 3
    and    #$03                  ; 2
    bne    LB1B4                 ; 2³
    inc    ram_E4                ; 5
    ldy    ram_E4                ; 3
    ldx    sc_7E|READ            ; 4
    tya                          ; 2
    cmp    LB231,X               ; 4
    bcc    LB166                 ; 2³
    ldy    #$00                  ; 2
    sty    ram_E4                ; 3
    cpx    #$17                  ; 2
    bcs    LB150                 ; 2³
    cpx    #$0C                  ; 2
    bcs    LB166                 ; 2³
LB150:
    ldy    sc_54|READ            ; 4
    iny                          ; 2
    cpy    #$03                  ; 2
    bcc    LB15A                 ; 2³
    ldy    #$00                  ; 2
LB15A:
    sty    sc_54                 ; 4
    lda    sc_56|READ,Y          ; 4
    sta    sc_7E                 ; 4
    jmp    LB731                 ; 3

LB166:
    lda    (ram_93),Y            ; 5
    bpl    LB16E                 ; 2³
    sta    ram_E6                ; 3
    lda    #$20                  ; 2
LB16E:
    cmp    #$20                  ; 2
    bne    LB174                 ; 2³
    lda    #$00                  ; 2
LB174:
    cmp    #$2D                  ; 2
    bne    LB17A                 ; 2³
    lda    #$01                  ; 2
LB17A:
    cmp    #$41                  ; 2
    bcs    LB186                 ; 2³
    cmp    #$30                  ; 2
    bcc    LB188                 ; 2³
    sbc    #$2E                  ; 2
    bcs    LB188                 ; 2³
LB186:
    sbc    #$35                  ; 2
LB188:
    sta    ram_82                ; 3
    lsr                          ; 2
    sta    ram_85                ; 3
    asl                          ; 2
    asl                          ; 2
    adc    ram_85                ; 3
    adc    #$04                  ; 2
    tax                          ; 2
    ldy    #$04                  ; 2
    lsr    ram_82                ; 5
    bcs    LB1A6                 ; 2³
LB19A:
    lda    LB6CD,X               ; 4
    sta.wy ram_DF,Y              ; 5
    dex                          ; 2
    dey                          ; 2
    bpl    LB19A                 ; 2³
    bmi    LB1B4                 ; 3   always branch

LB1A6:
    lda    LB6CD,X               ; 4
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta.wy ram_DF,Y              ; 5
    dex                          ; 2
    dey                          ; 2
    bpl    LB1A6                 ; 2³
LB1B4:
    ldx    #$04                  ; 2
LB1B6:
    asl    ram_DF,X              ; 6   scroll letters in ram
    rol    ram_DA,X              ; 6
    rol    ram_D5,X              ; 6
    rol    ram_D0,X              ; 6
    rol    ram_CB,X              ; 6
    rol    ram_C6,X              ; 6
    rol    ram_C1,X              ; 6
    dex                          ; 2
    bpl    LB1B6                 ; 2³
    jmp    LB731                 ; 3

LB1CA:
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    stx    ram_83                ; 3
LB1D0:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    ram_83                ; 3
    lda    ram_D5,X              ; 4
    sta    ram_82                ; 3
    ldy    ram_D0,X              ; 4
    lda    ram_C1,X              ; 4
    sta    GRP0                  ; 3
    lda    ram_C6,X              ; 4
    sta    GRP1                  ; 3
    lda    ram_CB,X              ; 4
    sta    GRP0                  ; 3
    lda    ram_DA,X              ; 4
    ldx    ram_82                ; 3
    sty    GRP1                  ; 3
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_83                ; 5
    bpl    LB1D0                 ; 2³
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    jmp    LB731                 ; 3

LB201:
    .word LB3D8          ; $B201
    .word LB409          ; $B203
    .word LB43A          ; $B205
    .word LB46B          ; $B207
    .word LB49C          ; $B209
    .word LB4CD          ; $B20B
    .word LB4FE          ; $B20D
    .word LB52F          ; $B20F
    .word LB560          ; $B211
    .word LB591          ; $B213
    .word LB5C2          ; $B215
    .word LB5F3          ; $B217
    .word LB305          ; $B219
    .word LB249          ; $B21B
    .word LB664          ; $B21D
    .word LB673          ; $B21F
    .word LB682          ; $B221
    .word LB691          ; $B223
    .word LB6A0          ; $B225
    .word LB6AF          ; $B227
    .word LB6BE          ; $B229
    .word LB655          ; $B22B

    .byte $96 ; |X  X XX | $B22D
    .byte $00 ; |        | $B22E  ram_96?

    .word LB624          ; $B22F

LB231:
    .byte $31 ; |  XX   X| $B231  length of text messages
    .byte $31 ; |  XX   X| $B232
    .byte $31 ; |  XX   X| $B233
    .byte $31 ; |  XX   X| $B234
    .byte $31 ; |  XX   X| $B235
    .byte $31 ; |  XX   X| $B236
    .byte $31 ; |  XX   X| $B237
    .byte $31 ; |  XX   X| $B238
    .byte $31 ; |  XX   X| $B239
    .byte $31 ; |  XX   X| $B23A
    .byte $31 ; |  XX   X| $B23B
    .byte $31 ; |  XX   X| $B23C
    .byte $D3 ; |XX X  XX| $B23D
    .byte $BD ; |X XXXX X| $B23E
    .byte $0F ; |    XXXX| $B23F
    .byte $0F ; |    XXXX| $B240
    .byte $0F ; |    XXXX| $B241
    .byte $0F ; |    XXXX| $B242
    .byte $0F ; |    XXXX| $B243
    .byte $0F ; |    XXXX| $B244
    .byte $0F ; |    XXXX| $B245
    .byte $0F ; |    XXXX| $B246
    .byte $0F ; |    XXXX| $B247
    .byte $31 ; |  XX   X| $B248
LB249:
    .byte $FF ; |XXXXXXXX| $B249
    .byte $FF ; |XXXXXXXX| $B24A  color?

    .byte "CONGRATULATIONS ARE IN ORDER FOR A JOB WELL DONE "
    .byte "YOU HAVE SAVED THE WORLD- "
    .byte "YOU WORKED HARD AND HONORABLY "
    .byte "-YOU DESERVE THAT VACATION YOU ASKED FOR-"
    .byte "ROCKET CODE ACCEPTED-IGNITION ACTIVATED-"

LB305:
    .byte " "
    .byte $98            ; $B306  color

    .byte " FATAL RUN-PROGRAMMED BY STEVE AGUIRRE"
    .byte "              "

    .byte $C8            ; $B33B  color

    .byte " YOUR MISSION IS TO DRIVE TO EACH CITY DELIVERING"
    .byte " THE MUCH NEEDED MEDICATION TO SAVE THE PEOPLE-"
    .byte " THEN LAUNCH THE ROCKET TO SAVE THE WORLD-"
    .byte "                  "

LB3D8:
    .byte " FANTASTIC TIME-YOUR SPEED HAS SAVED MOST OF US- "
LB409:
    .byte " NEXT TIME YOU WILL NEED TO PUSH HARDER-         "
LB43A:
    .byte " THE RADIATION IS SPREADING-YOU MUST TRY HARDER- "
LB46B:
    .byte " YOU MUST HAVE HAD TROUBLES-MANY HAVE DIED-      "
LB49C:
    .byte " THIS IS A SMALL TOKEN OF OUR APPRECIATION-      "
LB4CD:
    .byte "      WE HOPE THAT THIS HELPS-GOOD LUCK-         "
LB4FE:
    .byte " WE HOPE THIS REWARD HELPS YOU ON YOUR WAY-      "
LB52F:
    .byte " YOU MUST DRIVE QUICKLY-YOU ARE OUR ONLY HOPE-   "
LB560:
    .byte " YOUR CARS ARMOR IS IN BAD SHAPE-FIX IT-         "
LB591:
    .byte " YOUR TIRES ARE SHOT-YOU SHOULD UPGRADE THEM-    "
LB5C2:
    .byte " YOUR CARS ENGINE NEEDS A SERIOUS TUNE-UP        "
LB5F3:
    .byte " REPAIR WHAT YOU CAN-ALL OF YOUR CAR NEEDS HELP- "
LB624:
    .byte " YOUR CAR IS STILL IN PRETTY GOOD SHAPE-         "

LB655:
    .byte $88            ; $B655
    .byte "-NO CODE-     "
LB664:
    .byte $F4            ; $B664
    .byte "CODE- T       "
LB673:
    .byte $F6            ; $B673
    .byte "CODE- TC      "
LB682:
    .byte $B6            ; $B682
    .byte "CODE- TC1     "
LB691:
    .byte $96            ; $B691
    .byte "CODE- TC1L    "
LB6A0:
    .byte $AA            ; $B6A0
    .byte "CODE- TC1LE   "
LB6AF:
    .byte $D6            ; $B6AF
    .byte "CODE- TC1LE9  "
LB6BE:
    .byte $FF            ; $B6BE
    .byte "CODE- TC1LE9H "

LB6CD:
    .byte $00 ; |        | $B6CD
    .byte $00 ; |        | $B6CE
    .byte $0E ; |    XXX | $B6CF
    .byte $00 ; |        | $B6D0
    .byte $00 ; |        | $B6D1

    .byte $EE ; |XXX XXX | $B6D2
    .byte $A4 ; |X X  X  | $B6D3
    .byte $A4 ; |X X  X  | $B6D4
    .byte $AC ; |X X XX  | $B6D5
    .byte $E4 ; |XXX  X  | $B6D6

    .byte $EC ; |XXX XX  | $B6D7
    .byte $82 ; |X     X | $B6D8
    .byte $44 ; | X   X  | $B6D9
    .byte $22 ; |  X   X | $B6DA
    .byte $CC ; |XX  XX  | $B6DB

    .byte $2C ; |  X XX  | $B6DC
    .byte $22 ; |  X   X | $B6DD
    .byte $EC ; |XXX XX  | $B6DE
    .byte $A8 ; |X X X   | $B6DF
    .byte $AE ; |X X XXX | $B6E0

    .byte $E4 ; |XXX  X  | $B6E1
    .byte $A4 ; |X X  X  | $B6E2
    .byte $E2 ; |XXX   X | $B6E3
    .byte $82 ; |X     X | $B6E4
    .byte $EE ; |XXX XXX | $B6E5

    .byte $EE ; |XXX XXX | $B6E6
    .byte $A2 ; |X X   X | $B6E7
    .byte $EE ; |XXX XXX | $B6E8
    .byte $AA ; |X X X X | $B6E9
    .byte $EE ; |XXX XXX | $B6EA

    .byte $AC ; |X X XX  | $B6EB
    .byte $EA ; |XXX X X | $B6EC
    .byte $AC ; |X X XX  | $B6ED
    .byte $AA ; |X X X X | $B6EE
    .byte $4C ; | X  XX  | $B6EF

    .byte $EC ; |XXX XX  | $B6F0
    .byte $8A ; |X   X X | $B6F1
    .byte $8A ; |X   X X | $B6F2
    .byte $8A ; |X   X X | $B6F3
    .byte $EC ; |XXX XX  | $B6F4

    .byte $E8 ; |XXX X   | $B6F5
    .byte $88 ; |X   X   | $B6F6
    .byte $CC ; |XX  XX  | $B6F7
    .byte $88 ; |X   X   | $B6F8
    .byte $EE ; |XXX XXX | $B6F9

    .byte $EA ; |XXX X X | $B6FA
    .byte $AA ; |X X X X | $B6FB
    .byte $AE ; |X X XXX | $B6FC
    .byte $8A ; |X   X X | $B6FD
    .byte $EA ; |XXX X X | $B6FE

    .byte $E4 ; |XXX  X  | $B6FF
    .byte $4A ; | X  X X | $B700
    .byte $42 ; | X    X | $B701
    .byte $42 ; | X    X | $B702
    .byte $E2 ; |XXX   X | $B703

    .byte $AE ; |X X XXX | $B704
    .byte $A8 ; |X X X   | $B705
    .byte $C8 ; |XX  X   | $B706
    .byte $A8 ; |X X X   | $B707
    .byte $A8 ; |X X X   | $B708

    .byte $AA ; |X X X X | $B709
    .byte $AE ; |X X XXX | $B70A
    .byte $EE ; |XXX XXX | $B70B
    .byte $EE ; |XXX XXX | $B70C
    .byte $AA ; |X X X X | $B70D

    .byte $48 ; | X  X   | $B70E
    .byte $AC ; |X X XX  | $B70F
    .byte $AA ; |X X X X | $B710
    .byte $AA ; |X X X X | $B711
    .byte $4C ; | X  XX  | $B712

    .byte $6A ; | XX X X | $B713
    .byte $AC ; |X X XX  | $B714
    .byte $AA ; |X X X X | $B715
    .byte $AA ; |X X X X | $B716
    .byte $4C ; | X  XX  | $B717

    .byte $E4 ; |XXX  X  | $B718
    .byte $24 ; |  X  X  | $B719
    .byte $E4 ; |XXX  X  | $B71A
    .byte $84 ; |X    X  | $B71B
    .byte $EE ; |XXX XXX | $B71C

    .byte $E4 ; |XXX  X  | $B71D
    .byte $AA ; |X X X X | $B71E
    .byte $AA ; |X X X X | $B71F
    .byte $AA ; |X X X X | $B720
    .byte $AA ; |X X X X | $B721

    .byte $AA ; |X X X X | $B722
    .byte $EA ; |XXX X X | $B723
    .byte $E4 ; |XXX  X  | $B724
    .byte $AA ; |X X X X | $B725
    .byte $AA ; |X X X X | $B726

    .byte $4E ; | X  XXX | $B727
    .byte $48 ; | X  X   | $B728
    .byte $44 ; | X   X  | $B729
    .byte $A2 ; |X X   X | $B72A
    .byte $AE ; |X X XXX | $B72B

    .byte $E1 ; |XXX    X| $B72C
    .byte $A2 ; |X X   X | $B72D
    .byte $A4 ; |X X  X  | $B72E
    .byte $A8 ; |X X X   | $B72F
    .byte $A0 ; |X X     | $B730

LB731:
    ldy    #$00                  ; 2
    lda    sc_7D|READ            ; 4
    sty    sc_7D                 ; 4
    beq    LB749                 ; 2³
    cmp    #$03                  ; 2
    beq    LB74C                 ; 2³
    cmp    #$04                  ; 2
    beq    LB74F                 ; 2³
    cmp    #$06                  ; 2
    beq    LB752                 ; 2³
    bne    LB74C                 ; 3   always branch

LB749:
    jmp    LBF68                 ; 3

LB74C:
    jmp    LBF6C                 ; 3

LB74F:
    jmp    LBF70                 ; 3

LB752:
    jmp    LBF74                 ; 3

LB755:
    lda    ram_A1                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LB92F,Y               ; 4
    sta    ram_A9,X              ; 4
    lda    ram_A2                ; 3
    bne    LB76F                 ; 2³
    lda    #$04                  ; 2
    sta    ram_A7,X              ; 4
    ldy    ram_AB,X              ; 4
    lda    LB947,Y               ; 4
    sta    ram_AD,X              ; 4
    rts                          ; 6

LB76F:
    sta    AUDF0,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LB8F6,Y               ; 4
    sta    AUDC0,X               ; 4
    lda    #$00                  ; 2
    sta    ram_A7,X              ; 4
    sta    ram_AF,X              ; 4
    lda    ram_A1                ; 3
    and    #$F0                  ; 2
    tay                          ; 2
    sta    ram_AB,X              ; 4
    lda    LB940,Y               ; 4
    sta    ram_AD,X              ; 4
    lda    LB93F,Y               ; 4
    sta    AUDV0,X               ; 4
    rts                          ; 6

LB794:
    ldy    ram_A7,X              ; 4
    cpy    #$05                  ; 2
    bcc    LB79C                 ; 2³
    ldy    #$04                  ; 2
LB79C:
    lda    LB7AB,Y               ; 4
    sta    ram_A3                ; 3
    lda    LB7B0,Y               ; 4
    sta    ram_A4                ; 3
    ldy    ram_AB,X              ; 4
    jmp.ind (ram_A3)             ; 5

LB7AB:
    .byte <LB7B5         ; $B7AB
    .byte <LB7E1         ; $B7AC
    .byte <LB808         ; $B7AD
    .byte <LB814         ; $B7AE
    .byte <LB830         ; $B7AF

LB7B0:
    .byte >LB7B5         ; $B7B0
    .byte >LB7E1         ; $B7B1
    .byte >LB808         ; $B7B2
    .byte >LB814         ; $B7B3
    .byte >LB830         ; $B7B4

LB7B5:  ; indirect jump
    lda    LB942,Y               ; 4
    clc                          ; 2
    adc    ram_AF,X              ; 4
    bcs    LB7C2                 ; 2³
    cmp    LB941,Y               ; 4
    bcc    LB7C5                 ; 2³
LB7C2:
    lda    LB941,Y               ; 4
LB7C5:
    sta    ram_AF,X              ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ora    LB93F,Y               ; 4
    sta    AUDV0,X               ; 4
    dec    ram_AD,X              ; 6
    bpl    LB7E0                 ; 2³
    lda    LB943,Y               ; 4
    sta    ram_AD,X              ; 4
    inc    ram_A7,X              ; 6
    lda    LB941,Y               ; 4
    sta    ram_AF,X              ; 4
LB7E0:
    rts                          ; 6

LB7E1:  ; indirect jump
    lda    ram_AF,X              ; 4
    sec                          ; 2
    sbc    LB945,Y               ; 4
    bcc    LB7EE                 ; 2³
    cmp    LB944,Y               ; 4
    bcs    LB7F1                 ; 2³
LB7EE:
    lda    LB944,Y               ; 4
LB7F1:
    sta    ram_AF,X              ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ora    LB93F,Y               ; 4
    sta    AUDV0,X               ; 4
    dec    ram_AD,X              ; 6
    bpl    LB807                 ; 2³
    lda    LB946,Y               ; 4
    sta    ram_AD,X              ; 4
    inc    ram_A7,X              ; 6
LB807:
    rts                          ; 6

LB808:  ; indirect jump
    dec    ram_AD,X              ; 6
    bpl    LB813                 ; 2³
    lda    LB947,Y               ; 4
    sta    ram_AD,X              ; 4
    inc    ram_A7,X              ; 6
LB813:
    rts                          ; 6

LB814:  ; indirect jump
    lda    ram_AF,X              ; 4
    sec                          ; 2
    sbc    LB948,Y               ; 4
    bcs    LB81E                 ; 2³
    lda    #$00                  ; 2
LB81E:
    sta    ram_AF,X              ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ora    LB93F,Y               ; 4
    sta    AUDV0,X               ; 4
    dec    ram_AD,X              ; 6
    bpl    LB82F                 ; 2³
    inc    ram_A7,X              ; 6
LB82F:
    rts                          ; 6

LB830:  ; indirect jump
    lda    #$00                  ; 2
    sta    AUDV0,X               ; 4
    rts                          ; 6

LB835:
    jsr    LB794                 ; 6
    dec    ram_A9,X              ; 6
    bne    LB857                 ; 2³
    txa                          ; 2
    asl                          ; 2
    tax                          ; 2
    dec    ram_B9,X              ; 6
    beq    LB858                 ; 2³
LB843:
    jsr    LB905                 ; 6
    lda    (ram_B5,X)            ; 6
    sta    ram_A1                ; 3
    jsr    LB905                 ; 6
    lda    (ram_B5,X)            ; 6
    sta    ram_A2                ; 3
    txa                          ; 2
    lsr                          ; 2
    tax                          ; 2
    jsr    LB755                 ; 6
LB857:
    rts                          ; 6

LB858:
    jsr    LB8FE                 ; 6
    lda    (ram_B1,X)            ; 6
    sta    ram_B5,X              ; 4
    jsr    LB8FE                 ; 6
    lda    (ram_B1,X)            ; 6
    beq    LB86F                 ; 2³
    sta    ram_B6,X              ; 4
    lda    (ram_B5,X)            ; 6
    sta    ram_B9,X              ; 4
    jmp    LB843                 ; 3

LB86F:
    lda    ram_B5,X              ; 4
    bne    LB87A                 ; 2³
    ldx    #$00                  ; 2
    lda    ram_A5                ; 3
    jmp    LB88B                 ; 3

LB87A:
    bpl    LB883                 ; 2³
    ldx    #$00                  ; 2
    lda    #$FF                  ; 2
    sta    ram_A5                ; 3
    rts                          ; 6

LB883:
    sec                          ; 2
    sbc    #$01                  ; 2
    ldx    #$00                  ; 2
    jmp    LB88B                 ; 3

LB88B:
    txa                          ; 2
    sta    ram_A5                ; 3
    tay                          ; 2
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    #$03                  ; 2
    tax                          ; 2
    ldy    #$03                  ; 2
LB897:
    lda    LBC72,X               ; 4
    sta.wy ram_B1,Y              ; 5
    dex                          ; 2
    dey                          ; 2
    bpl    LB897                 ; 2³
    lda    #$00                  ; 2
    sta    ram_A6                ; 3
    ldx    #$02                  ; 2
LB8A7:
    lda    ram_B1,X              ; 4
    bne    LB8AF                 ; 2³
    lda    ram_B2,X              ; 4
    beq    LB8B6                 ; 2³
LB8AF:
    lda    ram_A6                ; 3
    ora    LB8F3,X               ; 4
    sta    ram_A6                ; 3
LB8B6:
    dex                          ; 2
    dex                          ; 2
    bpl    LB8A7                 ; 2³
    ldx    #$01                  ; 2
LB8BC:
    lda    #$00                  ; 2
    sta    AUDV0,X               ; 4
    lda    ram_A6                ; 3
    and    LB8F3,X               ; 4
    beq    LB8ED                 ; 2³
    txa                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    (ram_B1,X)            ; 6
    sta    ram_B5,X              ; 4
    jsr    LB8FE                 ; 6
    lda    (ram_B1,X)            ; 6
    sta    ram_B6,X              ; 4
    lda    (ram_B5,X)            ; 6
    sta    ram_B9,X              ; 4
    jsr    LB905                 ; 6
    lda    (ram_B5,X)            ; 6
    sta    ram_A1                ; 3
    jsr    LB905                 ; 6
    lda    (ram_B5,X)            ; 6
    sta    ram_A2                ; 3
    txa                          ; 2
    lsr                          ; 2
    tax                          ; 2
    jsr    LB755                 ; 6
LB8ED:
    dex                          ; 2
    bpl    LB8BC                 ; 2³
    jmp    LBC7F                 ; 3

LB8F3:
    .byte $01 ; |       X| $B8F3
    .byte $02 ; |      X | $B8F4
    .byte $02 ; |      X | $B8F5
LB8F6:
    .byte $04 ; |     X  | $B8F6
    .byte $0C ; |    XX  | $B8F7
    .byte $01 ; |       X| $B8F8
    .byte $06 ; |     XX | $B8F9
    .byte $08 ; |    X   | $B8FA
    .byte $07 ; |     XXX| $B8FB
    .byte $0F ; |    XXXX| $B8FC
    .byte $09 ; |    X  X| $B8FD

LB8FE:
    inc    ram_B1,X              ; 6
    bne    LB904                 ; 2³
    inc    ram_B2,X              ; 6
LB904:
    rts                          ; 6

LB905:
    inc    ram_B5,X              ; 6
    bne    LB90B                 ; 2³
    inc    ram_B6,X              ; 6
LB90B:
    rts                          ; 6

LB90C:
    lda    ram_A5                ; 3
    cmp    #$FF                  ; 2
    beq    LB923                 ; 2³
    ldx    #$01                  ; 2
LB914:
    lda    ram_A6                ; 3
    and    LB8F3,X               ; 4
    beq    LB91E                 ; 2³
    jsr    LB835                 ; 6
LB91E:
    dex                          ; 2
    bpl    LB914                 ; 2³
    bmi    LB92C                 ; 3   always branch

LB923:
    ldx    #$01                  ; 2
    lda    #$00                  ; 2
LB927:
    sta    AUDV0,X               ; 4
    dex                          ; 2
    bpl    LB927                 ; 2³
LB92C:
    jmp    LBC7F                 ; 3

LB92F:
    rts                          ; 6

    .byte $48 ; | X  X   | $B930
    .byte $40 ; | X      | $B931
    .byte $30 ; |  XX    | $B932
    .byte $24 ; |  X  X  | $B933
    .byte $20 ; |  X     | $B934
    .byte $18 ; |   XX   | $B935
    .byte $12 ; |   X  X | $B936
    .byte $10 ; |   X    | $B937
    .byte $0C ; |    XX  | $B938
    .byte $09 ; |    X  X| $B939
    .byte $08 ; |    X   | $B93A
    .byte $06 ; |     XX | $B93B
    .byte $04 ; |     X  | $B93C
    .byte $03 ; |      XX| $B93D
    .byte $02 ; |      X | $B93E
LB93F:
    .byte $80 ; |X       | $B93F
LB940:
    .byte $01 ; |       X| $B940
LB941:
    .byte $80 ; |X       | $B941
LB942:
    .byte $80 ; |X       | $B942
LB943:
    .byte $04 ; |     X  | $B943
LB944:
    .byte $04 ; |     X  | $B944
LB945:
    .byte $10 ; |   X    | $B945
LB946:
    .byte $FF ; |XXXXXXXX| $B946
LB947:
    .byte $20 ; |  X     | $B947
LB948:
    .byte $02 ; |      X | $B948
    .byte $00 ; |        | $B949
    .byte $00 ; |        | $B94A
    .byte $00 ; |        | $B94B
    .byte $00 ; |        | $B94C
    .byte $00 ; |        | $B94D
    .byte $00 ; |        | $B94E
    .byte $A0 ; |X X     | $B94F
    .byte $01 ; |       X| $B950
    .byte $70 ; | XXX    | $B951
    .byte $70 ; | XXX    | $B952
    .byte $08 ; |    X   | $B953
    .byte $02 ; |      X | $B954
    .byte $0A ; |    X X | $B955
    .byte $01 ; |       X| $B956
    .byte $20 ; |  X     | $B957
    .byte $01 ; |       X| $B958
    .byte $00 ; |        | $B959
    .byte $00 ; |        | $B95A
    .byte $00 ; |        | $B95B
    .byte $00 ; |        | $B95C
    .byte $00 ; |        | $B95D
    .byte $00 ; |        | $B95E
    .byte $80 ; |X       | $B95F
    .byte $01 ; |       X| $B960
    .byte $80 ; |X       | $B961
    .byte $80 ; |X       | $B962
    .byte $02 ; |      X | $B963
    .byte $01 ; |       X| $B964
    .byte $38 ; |  XXX   | $B965
    .byte $FF ; |XXXXXXXX| $B966
    .byte $20 ; |  X     | $B967
    .byte $00 ; |        | $B968
    .byte $00 ; |        | $B969
    .byte $00 ; |        | $B96A
    .byte $00 ; |        | $B96B
    .byte $00 ; |        | $B96C
    .byte $00 ; |        | $B96D
    .byte $00 ; |        | $B96E
    .byte $A0 ; |X X     | $B96F
    .byte $03 ; |      XX| $B970
    .byte $50 ; | X X    | $B971
    .byte $1A ; |   XX X | $B972
    .byte $0F ; |    XXXX| $B973
    .byte $04 ; |     X  | $B974
    .byte $01 ; |       X| $B975
    .byte $FF ; |XXXXXXXX| $B976
    .byte $10 ; |   X    | $B977
    .byte $04 ; |     X  | $B978
    .byte $00 ; |        | $B979
    .byte $00 ; |        | $B97A
    .byte $00 ; |        | $B97B
    .byte $00 ; |        | $B97C
    .byte $00 ; |        | $B97D
    .byte $00 ; |        | $B97E
    .byte $A0 ; |X X     | $B97F
    .byte $01 ; |       X| $B980
    .byte $80 ; |X       | $B981
    .byte $80 ; |X       | $B982
    .byte $0F ; |    XXXX| $B983
    .byte $04 ; |     X  | $B984
    .byte $04 ; |     X  | $B985
    .byte $FF ; |XXXXXXXX| $B986
    .byte $10 ; |   X    | $B987
    .byte $04 ; |     X  | $B988
    .byte $00 ; |        | $B989
    .byte $00 ; |        | $B98A
    .byte $00 ; |        | $B98B
    .byte $00 ; |        | $B98C
    .byte $00 ; |        | $B98D
    .byte $00 ; |        | $B98E
    .byte $80 ; |X       | $B98F
    .byte $01 ; |       X| $B990
    .byte $60 ; | XX     | $B991
    .byte $60 ; | XX     | $B992
    .byte $02 ; |      X | $B993
    .byte $01 ; |       X| $B994
    .byte $28 ; |  X X   | $B995
    .byte $FF ; |XXXXXXXX| $B996
    .byte $20 ; |  X     | $B997
    .byte $00 ; |        | $B998
    .byte $00 ; |        | $B999
    .byte $00 ; |        | $B99A
    .byte $00 ; |        | $B99B
    .byte $00 ; |        | $B99C
    .byte $00 ; |        | $B99D
    .byte $00 ; |        | $B99E
    .byte $A0 ; |X X     | $B99F
    .byte $02 ; |      X | $B9A0
    .byte $60 ; | XX     | $B9A1
    .byte $30 ; |  XX    | $B9A2
    .byte $04 ; |     X  | $B9A3
    .byte $04 ; |     X  | $B9A4
    .byte $08 ; |    X   | $B9A5
    .byte $02 ; |      X | $B9A6
    .byte $10 ; |   X    | $B9A7
    .byte $04 ; |     X  | $B9A8
    .byte $00 ; |        | $B9A9
    .byte $00 ; |        | $B9AA
    .byte $00 ; |        | $B9AB
    .byte $00 ; |        | $B9AC
    .byte $00 ; |        | $B9AD
    .byte $00 ; |        | $B9AE
    .byte $A0 ; |X X     | $B9AF
    .byte $01 ; |       X| $B9B0
    .byte $50 ; | X X    | $B9B1
    .byte $50 ; | X X    | $B9B2
    .byte $04 ; |     X  | $B9B3
    .byte $03 ; |      XX| $B9B4
    .byte $08 ; |    X   | $B9B5
    .byte $FF ; |XXXXXXXX| $B9B6
    .byte $20 ; |  X     | $B9B7
    .byte $01 ; |       X| $B9B8
    .byte $00 ; |        | $B9B9
    .byte $00 ; |        | $B9BA
    .byte $00 ; |        | $B9BB
    .byte $00 ; |        | $B9BC
    .byte $00 ; |        | $B9BD
    .byte $00 ; |        | $B9BE
    .byte $A0 ; |X X     | $B9BF
    .byte $01 ; |       X| $B9C0
    .byte $60 ; | XX     | $B9C1
    .byte $60 ; | XX     | $B9C2
    .byte $04 ; |     X  | $B9C3
    .byte $03 ; |      XX| $B9C4
    .byte $0C ; |    XX  | $B9C5
    .byte $FF ; |XXXXXXXX| $B9C6
    .byte $18 ; |   XX   | $B9C7
    .byte $02 ; |      X | $B9C8
    .byte $00 ; |        | $B9C9
    .byte $00 ; |        | $B9CA
    .byte $00 ; |        | $B9CB
    .byte $00 ; |        | $B9CC
    .byte $00 ; |        | $B9CD
    .byte $00 ; |        | $B9CE
    .byte $00 ; |        | $B9CF
    .byte $01 ; |       X| $B9D0
    .byte $80 ; |X       | $B9D1
    .byte $80 ; |X       | $B9D2
    .byte $08 ; |    X   | $B9D3
    .byte $04 ; |     X  | $B9D4
    .byte $08 ; |    X   | $B9D5
    .byte $01 ; |       X| $B9D6
    .byte $20 ; |  X     | $B9D7
    .byte $02 ; |      X | $B9D8
    .byte $00 ; |        | $B9D9
    .byte $00 ; |        | $B9DA
    .byte $00 ; |        | $B9DB
    .byte $00 ; |        | $B9DC
    .byte $00 ; |        | $B9DD
    .byte $00 ; |        | $B9DE
    .byte $A0 ; |X X     | $B9DF
    .byte $02 ; |      X | $B9E0
    .byte $80 ; |X       | $B9E1
    .byte $40 ; | X      | $B9E2
    .byte $04 ; |     X  | $B9E3
    .byte $04 ; |     X  | $B9E4
    .byte $10 ; |   X    | $B9E5
    .byte $FF ; |XXXXXXXX| $B9E6
    .byte $20 ; |  X     | $B9E7
    .byte $02 ; |      X | $B9E8
    .byte $00 ; |        | $B9E9
    .byte $00 ; |        | $B9EA
    .byte $00 ; |        | $B9EB
    .byte $00 ; |        | $B9EC
    .byte $00 ; |        | $B9ED
    .byte $00 ; |        | $B9EE
    .byte $A0 ; |X X     | $B9EF
    .byte $02 ; |      X | $B9F0
    .byte $80 ; |X       | $B9F1
    .byte $40 ; | X      | $B9F2
    .byte $04 ; |     X  | $B9F3
    .byte $04 ; |     X  | $B9F4
    .byte $10 ; |   X    | $B9F5
    .byte $FF ; |XXXXXXXX| $B9F6
    .byte $20 ; |  X     | $B9F7
    .byte $02 ; |      X | $B9F8
    .byte $00 ; |        | $B9F9
    .byte $00 ; |        | $B9FA
    .byte $00 ; |        | $B9FB
    .byte $00 ; |        | $B9FC
    .byte $00 ; |        | $B9FD
    .byte $00 ; |        | $B9FE
    .byte $A0 ; |X X     | $B9FF
    .byte $02 ; |      X | $BA00
    .byte $80 ; |X       | $BA01
    .byte $40 ; | X      | $BA02
    .byte $04 ; |     X  | $BA03
    .byte $04 ; |     X  | $BA04
    .byte $10 ; |   X    | $BA05
    .byte $FF ; |XXXXXXXX| $BA06
    .byte $20 ; |  X     | $BA07
    .byte $02 ; |      X | $BA08
    .byte $00 ; |        | $BA09
    .byte $00 ; |        | $BA0A
    .byte $00 ; |        | $BA0B
    .byte $00 ; |        | $BA0C
    .byte $00 ; |        | $BA0D
    .byte $00 ; |        | $BA0E
    .byte $A0 ; |X X     | $BA0F
    .byte $02 ; |      X | $BA10
    .byte $80 ; |X       | $BA11
    .byte $40 ; | X      | $BA12
    .byte $04 ; |     X  | $BA13
    .byte $04 ; |     X  | $BA14
    .byte $10 ; |   X    | $BA15
    .byte $FF ; |XXXXXXXX| $BA16
    .byte $20 ; |  X     | $BA17
    .byte $02 ; |      X | $BA18
    .byte $00 ; |        | $BA19
    .byte $00 ; |        | $BA1A
    .byte $00 ; |        | $BA1B
    .byte $00 ; |        | $BA1C
    .byte $00 ; |        | $BA1D
    .byte $00 ; |        | $BA1E
    .byte $A0 ; |X X     | $BA1F
    .byte $02 ; |      X | $BA20
    .byte $80 ; |X       | $BA21
    .byte $40 ; | X      | $BA22
    .byte $04 ; |     X  | $BA23
    .byte $04 ; |     X  | $BA24
    .byte $10 ; |   X    | $BA25
    .byte $FF ; |XXXXXXXX| $BA26
    .byte $20 ; |  X     | $BA27
    .byte $02 ; |      X | $BA28
    .byte $00 ; |        | $BA29
    .byte $00 ; |        | $BA2A
    .byte $00 ; |        | $BA2B
    .byte $00 ; |        | $BA2C
    .byte $00 ; |        | $BA2D
    .byte $00 ; |        | $BA2E
    .byte $A0 ; |X X     | $BA2F
    .byte $02 ; |      X | $BA30
    .byte $80 ; |X       | $BA31
    .byte $40 ; | X      | $BA32
    .byte $04 ; |     X  | $BA33
    .byte $04 ; |     X  | $BA34
    .byte $10 ; |   X    | $BA35
    .byte $FF ; |XXXXXXXX| $BA36
    .byte $20 ; |  X     | $BA37
    .byte $02 ; |      X | $BA38
    .byte $00 ; |        | $BA39
    .byte $00 ; |        | $BA3A
    .byte $00 ; |        | $BA3B
    .byte $00 ; |        | $BA3C
    .byte $00 ; |        | $BA3D
    .byte $00 ; |        | $BA3E
    .byte $00 ; |        | $BA3F
    .byte $00 ; |        | $BA40
    .byte $00 ; |        | $BA41
    .byte $00 ; |        | $BA42
    .byte $00 ; |        | $BA43
    .byte $00 ; |        | $BA44
    .byte $00 ; |        | $BA45
    .byte $00 ; |        | $BA46
    .byte $00 ; |        | $BA47
    .byte $00 ; |        | $BA48
    .byte $00 ; |        | $BA49
    .byte $00 ; |        | $BA4A
    .byte $00 ; |        | $BA4B
    .byte $00 ; |        | $BA4C
    .byte $00 ; |        | $BA4D
    .byte $00 ; |        | $BA4E

LBA4F:
    .word LBA91          ; $BA4F

    .byte $FF ; |XXXXXXXX| $BA51
    .byte $00 ; |        | $BA52

LBA53:
    .word LBB5A          ; $BA53
    .word LBB5A          ; $BA55
    .word LBB5A          ; $BA57
    .word LBB5A          ; $BA59
    .word LBB5A          ; $BA5B
    .word LBB5A          ; $BA5D
    .word LBB5A          ; $BA5F
    .word LBB5A          ; $BA61
    .word LBB5A          ; $BA63
    .word LBB5A          ; $BA65
    .word LBB6F          ; $BA67

    .byte $FF ; |XXXXXXXX| $BA69
    .byte $00 ; |        | $BA6A

LBA6B:
    .word LBB76          ; $BA6B
    .word LBB76          ; $BA6D
    .word LBBF3          ; $BA6F

    .byte $00 ; |        | $BA71
    .byte $00 ; |        | $BA72

LBA73:
    .word LBC3E          ; $BA73
    .word LBC3E          ; $BA75
    .word LBC3E          ; $BA77
    .word LBC3E          ; $BA79
    .word LBC3E          ; $BA7B
    .word LBC3E          ; $BA7D
    .word LBC3E          ; $BA7F
    .word LBC3E          ; $BA81
    .word LBC3E          ; $BA83
    .word LBC3E          ; $BA85
    .word LBC3E          ; $BA87
    .word LBC3E          ; $BA89

    .byte $00 ; |        | $BA8B
    .byte $00 ; |        | $BA8C

LBA8D:
    .word LBC59          ; $BA8D

    .byte $FF ; |XXXXXXXX| $BA8F
    .byte $00 ; |        | $BA90

LBA91:
    .byte $64 ; | XX  X  | $BA91
    .byte $49 ; | X  X  X| $BA92
    .byte $57 ; | X X XXX| $BA93
    .byte $4C ; | X  XX  | $BA94
    .byte $57 ; | X X XXX| $BA95
    .byte $4C ; | X  XX  | $BA96
    .byte $57 ; | X X XXX| $BA97
    .byte $49 ; | X  X  X| $BA98
    .byte $57 ; | X X XXX| $BA99
    .byte $4C ; | X  XX  | $BA9A
    .byte $57 ; | X X XXX| $BA9B
    .byte $4C ; | X  XX  | $BA9C
    .byte $57 ; | X X XXX| $BA9D
    .byte $49 ; | X  X  X| $BA9E
    .byte $5A ; | X XX X | $BA9F
    .byte $4C ; | X  XX  | $BAA0
    .byte $5A ; | X XX X | $BAA1
    .byte $4C ; | X  XX  | $BAA2
    .byte $5A ; | X XX X | $BAA3
    .byte $4C ; | X  XX  | $BAA4
    .byte $5B ; | X XX XX| $BAA5
    .byte $4C ; | X  XX  | $BAA6
    .byte $5B ; | X XX XX| $BAA7
    .byte $49 ; | X  X  X| $BAA8
    .byte $5F ; | X XXXXX| $BAA9
    .byte $49 ; | X  X  X| $BAAA
    .byte $57 ; | X X XXX| $BAAB
    .byte $4C ; | X  XX  | $BAAC
    .byte $57 ; | X X XXX| $BAAD
    .byte $4C ; | X  XX  | $BAAE
    .byte $57 ; | X X XXX| $BAAF
    .byte $49 ; | X  X  X| $BAB0
    .byte $57 ; | X X XXX| $BAB1
    .byte $4C ; | X  XX  | $BAB2
    .byte $57 ; | X X XXX| $BAB3
    .byte $4C ; | X  XX  | $BAB4
    .byte $57 ; | X X XXX| $BAB5
    .byte $49 ; | X  X  X| $BAB6
    .byte $5A ; | X XX X | $BAB7
    .byte $4C ; | X  XX  | $BAB8
    .byte $5A ; | X XX X | $BAB9
    .byte $4C ; | X  XX  | $BABA
    .byte $5A ; | X XX X | $BABB
    .byte $4C ; | X  XX  | $BABC
    .byte $5B ; | X XX XX| $BABD
    .byte $4C ; | X  XX  | $BABE
    .byte $5B ; | X XX XX| $BABF
    .byte $49 ; | X  X  X| $BAC0
    .byte $5F ; | X XXXXX| $BAC1
    .byte $49 ; | X  X  X| $BAC2
    .byte $57 ; | X X XXX| $BAC3
    .byte $4C ; | X  XX  | $BAC4
    .byte $33 ; |  XX  XX| $BAC5
    .byte $4C ; | X  XX  | $BAC6
    .byte $33 ; |  XX  XX| $BAC7
    .byte $49 ; | X  X  X| $BAC8
    .byte $33 ; |  XX  XX| $BAC9
    .byte $49 ; | X  X  X| $BACA
    .byte $33 ; |  XX  XX| $BACB
    .byte $19 ; |   XX  X| $BACC
    .byte $2E ; |  X XXX | $BACD
    .byte $49 ; | X  X  X| $BACE
    .byte $30 ; |  XX    | $BACF
    .byte $49 ; | X  X  X| $BAD0
    .byte $31 ; |  XX   X| $BAD1
    .byte $46 ; | X   XX | $BAD2
    .byte $33 ; |  XX  XX| $BAD3
    .byte $4C ; | X  XX  | $BAD4
    .byte $33 ; |  XX  XX| $BAD5
    .byte $4C ; | X  XX  | $BAD6
    .byte $33 ; |  XX  XX| $BAD7
    .byte $46 ; | X   XX | $BAD8
    .byte $33 ; |  XX  XX| $BAD9
    .byte $49 ; | X  X  X| $BADA
    .byte $5F ; | X XXXXX| $BADB
    .byte $4C ; | X  XX  | $BADC
    .byte $5F ; | X XXXXX| $BADD
    .byte $4C ; | X  XX  | $BADE
    .byte $5F ; | X XXXXX| $BADF
    .byte $49 ; | X  X  X| $BAE0
    .byte $5F ; | X XXXXX| $BAE1
    .byte $49 ; | X  X  X| $BAE2
    .byte $5F ; | X XXXXX| $BAE3
    .byte $49 ; | X  X  X| $BAE4
    .byte $57 ; | X X XXX| $BAE5
    .byte $4C ; | X  XX  | $BAE6
    .byte $2E ; |  X XXX | $BAE7
    .byte $4C ; | X  XX  | $BAE8
    .byte $2E ; |  X XXX | $BAE9
    .byte $19 ; |   XX  X| $BAEA
    .byte $2E ; |  X XXX | $BAEB
    .byte $49 ; | X  X  X| $BAEC
    .byte $2E ; |  X XXX | $BAED
    .byte $49 ; | X  X  X| $BAEE
    .byte $2D ; |  X XX X| $BAEF
    .byte $49 ; | X  X  X| $BAF0
    .byte $30 ; |  XX    | $BAF1
    .byte $49 ; | X  X  X| $BAF2
    .byte $30 ; |  XX    | $BAF3
    .byte $46 ; | X   XX | $BAF4
    .byte $2E ; |  X XXX | $BAF5
    .byte $4C ; | X  XX  | $BAF6
    .byte $2E ; |  X XXX | $BAF7
    .byte $4C ; | X  XX  | $BAF8
    .byte $2E ; |  X XXX | $BAF9
    .byte $46 ; | X   XX | $BAFA
    .byte $2E ; |  X XXX | $BAFB
    .byte $49 ; | X  X  X| $BAFC
    .byte $57 ; | X X XXX| $BAFD
    .byte $4C ; | X  XX  | $BAFE
    .byte $57 ; | X X XXX| $BAFF
    .byte $4C ; | X  XX  | $BB00
    .byte $57 ; | X X XXX| $BB01
    .byte $49 ; | X  X  X| $BB02
    .byte $57 ; | X X XXX| $BB03
    .byte $49 ; | X  X  X| $BB04
    .byte $57 ; | X X XXX| $BB05
    .byte $49 ; | X  X  X| $BB06
    .byte $3D ; |  XXXX X| $BB07
    .byte $4C ; | X  XX  | $BB08
    .byte $3D ; |  XXXX X| $BB09
    .byte $4C ; | X  XX  | $BB0A
    .byte $3D ; |  XXXX X| $BB0B
    .byte $49 ; | X  X  X| $BB0C
    .byte $3D ; |  XXXX X| $BB0D
    .byte $49 ; | X  X  X| $BB0E
    .byte $3D ; |  XXXX X| $BB0F
    .byte $49 ; | X  X  X| $BB10
    .byte $38 ; |  XXX   | $BB11
    .byte $49 ; | X  X  X| $BB12
    .byte $3D ; |  XXXX X| $BB13
    .byte $49 ; | X  X  X| $BB14
    .byte $34 ; |  XX X  | $BB15
    .byte $49 ; | X  X  X| $BB16
    .byte $33 ; |  XX  XX| $BB17
    .byte $49 ; | X  X  X| $BB18
    .byte $3D ; |  XXXX X| $BB19
    .byte $4C ; | X  XX  | $BB1A
    .byte $3D ; |  XXXX X| $BB1B
    .byte $4C ; | X  XX  | $BB1C
    .byte $3D ; |  XXXX X| $BB1D
    .byte $49 ; | X  X  X| $BB1E
    .byte $3D ; |  XXXX X| $BB1F
    .byte $49 ; | X  X  X| $BB20
    .byte $3D ; |  XXXX X| $BB21
    .byte $49 ; | X  X  X| $BB22
    .byte $33 ; |  XX  XX| $BB23
    .byte $49 ; | X  X  X| $BB24
    .byte $3D ; |  XXXX X| $BB25
    .byte $49 ; | X  X  X| $BB26
    .byte $30 ; |  XX    | $BB27
    .byte $49 ; | X  X  X| $BB28
    .byte $2E ; |  X XXX | $BB29
    .byte $49 ; | X  X  X| $BB2A
    .byte $51 ; | X X   X| $BB2B
    .byte $4C ; | X  XX  | $BB2C
    .byte $51 ; | X X   X| $BB2D
    .byte $4C ; | X  XX  | $BB2E
    .byte $51 ; | X X   X| $BB2F
    .byte $49 ; | X  X  X| $BB30
    .byte $51 ; | X X   X| $BB31
    .byte $49 ; | X  X  X| $BB32
    .byte $51 ; | X X   X| $BB33
    .byte $49 ; | X  X  X| $BB34
    .byte $4E ; | X  XXX | $BB35
    .byte $49 ; | X  X  X| $BB36
    .byte $51 ; | X X   X| $BB37
    .byte $49 ; | X  X  X| $BB38
    .byte $4C ; | X  XX  | $BB39
    .byte $49 ; | X  X  X| $BB3A
    .byte $4B ; | X  X XX| $BB3B
    .byte $49 ; | X  X  X| $BB3C
    .byte $4F ; | X  XXXX| $BB3D
    .byte $4C ; | X  XX  | $BB3E
    .byte $4F ; | X  XXXX| $BB3F
    .byte $4C ; | X  XX  | $BB40
    .byte $4F ; | X  XXXX| $BB41
    .byte $4C ; | X  XX  | $BB42
    .byte $4F ; | X  XXXX| $BB43
    .byte $4C ; | X  XX  | $BB44
    .byte $4F ; | X  XXXX| $BB45
    .byte $46 ; | X   XX | $BB46
    .byte $4F ; | X  XXXX| $BB47
    .byte $4C ; | X  XX  | $BB48
    .byte $47 ; | X   XXX| $BB49
    .byte $4C ; | X  XX  | $BB4A
    .byte $47 ; | X   XXX| $BB4B
    .byte $4C ; | X  XX  | $BB4C
    .byte $5F ; | X XXXXX| $BB4D
    .byte $4C ; | X  XX  | $BB4E
    .byte $5F ; | X XXXXX| $BB4F
    .byte $49 ; | X  X  X| $BB50
    .byte $5F ; | X XXXXX| $BB51
    .byte $49 ; | X  X  X| $BB52
    .byte $57 ; | X X XXX| $BB53
    .byte $4C ; | X  XX  | $BB54
    .byte $57 ; | X X XXX| $BB55
    .byte $4C ; | X  XX  | $BB56
    .byte $57 ; | X X XXX| $BB57
    .byte $46 ; | X   XX | $BB58
    .byte $57 ; | X X XXX| $BB59
LBB5A:
    .byte $0A ; |    X X | $BB5A
    .byte $29 ; |  X X  X| $BB5B
    .byte $9E ; |X  XXXX | $BB5C
    .byte $29 ; |  X X  X| $BB5D
    .byte $9A ; |X  XX X | $BB5E
    .byte $29 ; |  X X  X| $BB5F
    .byte $9E ; |X  XXXX | $BB60
    .byte $2C ; |  X XX  | $BB61
    .byte $9A ; |X  XX X | $BB62
    .byte $2C ; |  X XX  | $BB63
    .byte $9A ; |X  XX X | $BB64
    .byte $29 ; |  X X  X| $BB65
    .byte $9E ; |X  XXXX | $BB66
    .byte $29 ; |  X X  X| $BB67
    .byte $9A ; |X  XX X | $BB68
    .byte $29 ; |  X X  X| $BB69
    .byte $9E ; |X  XXXX | $BB6A
    .byte $2C ; |  X XX  | $BB6B
    .byte $9A ; |X  XX X | $BB6C
    .byte $2C ; |  X XX  | $BB6D
    .byte $9A ; |X  XX X | $BB6E
LBB6F:
    .byte $03 ; |      XX| $BB6F
    .byte $29 ; |  X X  X| $BB70
    .byte $9E ; |X  XXXX | $BB71
    .byte $29 ; |  X X  X| $BB72
    .byte $9A ; |X  XX X | $BB73
    .byte $29 ; |  X X  X| $BB74
    .byte $9E ; |X  XXXX | $BB75
LBB76:
    .byte $3E ; |  XXXXX | $BB76
    .byte $1C ; |   XXX  | $BB77
    .byte $4D ; | X  XX X| $BB78
    .byte $1C ; |   XXX  | $BB79
    .byte $4D ; | X  XX X| $BB7A
    .byte $1C ; |   XXX  | $BB7B
    .byte $5B ; | X XX XX| $BB7C
    .byte $1C ; |   XXX  | $BB7D
    .byte $5B ; | X XX XX| $BB7E
    .byte $1C ; |   XXX  | $BB7F
    .byte $5F ; | X XXXXX| $BB80
    .byte $1C ; |   XXX  | $BB81
    .byte $5F ; | X XXXXX| $BB82
    .byte $1C ; |   XXX  | $BB83
    .byte $5B ; | X XX XX| $BB84
    .byte $1C ; |   XXX  | $BB85
    .byte $5B ; | X XX XX| $BB86
    .byte $1C ; |   XXX  | $BB87
    .byte $56 ; | X X XX | $BB88
    .byte $1C ; |   XXX  | $BB89
    .byte $56 ; | X X XX | $BB8A
    .byte $1C ; |   XXX  | $BB8B
    .byte $5B ; | X XX XX| $BB8C
    .byte $1C ; |   XXX  | $BB8D
    .byte $5B ; | X XX XX| $BB8E
    .byte $1C ; |   XXX  | $BB8F
    .byte $5B ; | X XX XX| $BB90
    .byte $1C ; |   XXX  | $BB91
    .byte $5B ; | X XX XX| $BB92
    .byte $1C ; |   XXX  | $BB93
    .byte $5B ; | X XX XX| $BB94
    .byte $1C ; |   XXX  | $BB95
    .byte $5B ; | X XX XX| $BB96
    .byte $1C ; |   XXX  | $BB97
    .byte $54 ; | X X X  | $BB98
    .byte $1C ; |   XXX  | $BB99
    .byte $5B ; | X XX XX| $BB9A
    .byte $1C ; |   XXX  | $BB9B
    .byte $54 ; | X X X  | $BB9C
    .byte $1C ; |   XXX  | $BB9D
    .byte $54 ; | X X X  | $BB9E
    .byte $1C ; |   XXX  | $BB9F
    .byte $51 ; | X X   X| $BBA0
    .byte $1C ; |   XXX  | $BBA1
    .byte $54 ; | X X X  | $BBA2
    .byte $1C ; |   XXX  | $BBA3
    .byte $54 ; | X X X  | $BBA4
    .byte $1C ; |   XXX  | $BBA5
    .byte $54 ; | X X X  | $BBA6
    .byte $1C ; |   XXX  | $BBA7
    .byte $5B ; | X XX XX| $BBA8
    .byte $1C ; |   XXX  | $BBA9
    .byte $5B ; | X XX XX| $BBAA
    .byte $1C ; |   XXX  | $BBAB
    .byte $56 ; | X X XX | $BBAC
    .byte $1C ; |   XXX  | $BBAD
    .byte $5B ; | X XX XX| $BBAE
    .byte $1C ; |   XXX  | $BBAF
    .byte $4D ; | X  XX X| $BBB0
    .byte $1C ; |   XXX  | $BBB1
    .byte $4D ; | X  XX X| $BBB2
    .byte $1C ; |   XXX  | $BBB3
    .byte $5B ; | X XX XX| $BBB4
    .byte $1C ; |   XXX  | $BBB5
    .byte $5B ; | X XX XX| $BBB6
    .byte $19 ; |   XX  X| $BBB7
    .byte $5F ; | X XXXXX| $BBB8
    .byte $1C ; |   XXX  | $BBB9
    .byte $5F ; | X XXXXX| $BBBA
    .byte $1C ; |   XXX  | $BBBB
    .byte $5F ; | X XXXXX| $BBBC
    .byte $1C ; |   XXX  | $BBBD
    .byte $5F ; | X XXXXX| $BBBE
    .byte $1C ; |   XXX  | $BBBF
    .byte $5F ; | X XXXXX| $BBC0
    .byte $19 ; |   XX  X| $BBC1
    .byte $4F ; | X  XXXX| $BBC2
    .byte $1C ; |   XXX  | $BBC3
    .byte $54 ; | X X X  | $BBC4
    .byte $1C ; |   XXX  | $BBC5
    .byte $4F ; | X  XXXX| $BBC6
    .byte $1C ; |   XXX  | $BBC7
    .byte $5F ; | X XXXXX| $BBC8
    .byte $1C ; |   XXX  | $BBC9
    .byte $5F ; | X XXXXX| $BBCA
    .byte $1C ; |   XXX  | $BBCB
    .byte $54 ; | X X X  | $BBCC
    .byte $1C ; |   XXX  | $BBCD
    .byte $54 ; | X X X  | $BBCE
    .byte $1C ; |   XXX  | $BBCF
    .byte $5F ; | X XXXXX| $BBD0
    .byte $1C ; |   XXX  | $BBD1
    .byte $5F ; | X XXXXX| $BBD2
    .byte $1C ; |   XXX  | $BBD3
    .byte $5B ; | X XX XX| $BBD4
    .byte $1C ; |   XXX  | $BBD5
    .byte $5B ; | X XX XX| $BBD6
    .byte $1C ; |   XXX  | $BBD7
    .byte $56 ; | X X XX | $BBD8
    .byte $1C ; |   XXX  | $BBD9
    .byte $5B ; | X XX XX| $BBDA
    .byte $1C ; |   XXX  | $BBDB
    .byte $5B ; | X XX XX| $BBDC
    .byte $1C ; |   XXX  | $BBDD
    .byte $5B ; | X XX XX| $BBDE
    .byte $1C ; |   XXX  | $BBDF
    .byte $4D ; | X  XX X| $BBE0
    .byte $1C ; |   XXX  | $BBE1
    .byte $52 ; | X X  X | $BBE2
    .byte $1C ; |   XXX  | $BBE3
    .byte $4D ; | X  XX X| $BBE4
    .byte $1C ; |   XXX  | $BBE5
    .byte $5B ; | X XX XX| $BBE6
    .byte $1C ; |   XXX  | $BBE7
    .byte $5B ; | X XX XX| $BBE8
    .byte $1C ; |   XXX  | $BBE9
    .byte $5B ; | X XX XX| $BBEA
    .byte $1C ; |   XXX  | $BBEB
    .byte $52 ; | X X  X | $BBEC
    .byte $1C ; |   XXX  | $BBED
    .byte $52 ; | X X  X | $BBEE
    .byte $1C ; |   XXX  | $BBEF
    .byte $5B ; | X XX XX| $BBF0
    .byte $1C ; |   XXX  | $BBF1
    .byte $5B ; | X XX XX| $BBF2
LBBF3:
    .byte $25 ; |  X  X X| $BBF3
    .byte $3C ; |  XXXX  | $BBF4
    .byte $4F ; | X  XXXX| $BBF5
    .byte $39 ; |  XXX  X| $BBF6
    .byte $4F ; | X  XXXX| $BBF7
    .byte $3C ; |  XXXX  | $BBF8
    .byte $4F ; | X  XXXX| $BBF9
    .byte $39 ; |  XXX  X| $BBFA
    .byte $4F ; | X  XXXX| $BBFB
    .byte $3C ; |  XXXX  | $BBFC
    .byte $4F ; | X  XXXX| $BBFD
    .byte $39 ; |  XXX  X| $BBFE
    .byte $51 ; | X X   X| $BBFF
    .byte $3C ; |  XXXX  | $BC00
    .byte $51 ; | X X   X| $BC01
    .byte $39 ; |  XXX  X| $BC02
    .byte $4F ; | X  XXXX| $BC03
    .byte $36 ; |  XX XX | $BC04
    .byte $4D ; | X  XX X| $BC05
    .byte $3C ; |  XXXX  | $BC06
    .byte $4B ; | X  X XX| $BC07
    .byte $39 ; |  XXX  X| $BC08
    .byte $4D ; | X  XX X| $BC09
    .byte $3C ; |  XXXX  | $BC0A
    .byte $4B ; | X  X XX| $BC0B
    .byte $39 ; |  XXX  X| $BC0C
    .byte $4D ; | X  XX X| $BC0D
    .byte $3C ; |  XXXX  | $BC0E
    .byte $4D ; | X  XX X| $BC0F
    .byte $3C ; |  XXXX  | $BC10
    .byte $4D ; | X  XX X| $BC11
    .byte $39 ; |  XXX  X| $BC12
    .byte $4F ; | X  XXXX| $BC13
    .byte $34 ; |  XX X  | $BC14
    .byte $4D ; | X  XX X| $BC15
    .byte $3C ; |  XXXX  | $BC16
    .byte $4F ; | X  XXXX| $BC17
    .byte $39 ; |  XXX  X| $BC18
    .byte $4F ; | X  XXXX| $BC19
    .byte $3C ; |  XXXX  | $BC1A
    .byte $4F ; | X  XXXX| $BC1B
    .byte $39 ; |  XXX  X| $BC1C
    .byte $4F ; | X  XXXX| $BC1D
    .byte $3C ; |  XXXX  | $BC1E
    .byte $4F ; | X  XXXX| $BC1F
    .byte $39 ; |  XXX  X| $BC20
    .byte $4C ; | X  XX  | $BC21
    .byte $3C ; |  XXXX  | $BC22
    .byte $4C ; | X  XX  | $BC23
    .byte $39 ; |  XXX  X| $BC24
    .byte $4F ; | X  XXXX| $BC25
    .byte $36 ; |  XX XX | $BC26
    .byte $4D ; | X  XX X| $BC27
    .byte $3C ; |  XXXX  | $BC28
    .byte $4B ; | X  X XX| $BC29
    .byte $39 ; |  XXX  X| $BC2A
    .byte $4D ; | X  XX X| $BC2B
    .byte $3C ; |  XXXX  | $BC2C
    .byte $4B ; | X  X XX| $BC2D
    .byte $39 ; |  XXX  X| $BC2E
    .byte $4D ; | X  XX X| $BC2F
    .byte $3C ; |  XXXX  | $BC30
    .byte $4D ; | X  XX X| $BC31
    .byte $3C ; |  XXXX  | $BC32
    .byte $4D ; | X  XX X| $BC33
    .byte $1C ; |   XXX  | $BC34
    .byte $4F ; | X  XXXX| $BC35
    .byte $1C ; |   XXX  | $BC36
    .byte $4E ; | X  XXX | $BC37
    .byte $36 ; |  XX XX | $BC38
    .byte $4D ; | X  XX X| $BC39
    .byte $1C ; |   XXX  | $BC3A
    .byte $52 ; | X X  X | $BC3B
    .byte $1C ; |   XXX  | $BC3C
    .byte $52 ; | X X  X | $BC3D
LBC3E:
    .byte $0D ; |    XX X| $BC3E
    .byte $29 ; |  X X  X| $BC3F
    .byte $9E ; |X  XXXX | $BC40
    .byte $2C ; |  X XX  | $BC41
    .byte $9A ; |X  XX X | $BC42
    .byte $2C ; |  X XX  | $BC43
    .byte $9E ; |X  XXXX | $BC44
    .byte $29 ; |  X X  X| $BC45
    .byte $9E ; |X  XXXX | $BC46
    .byte $2C ; |  X XX  | $BC47
    .byte $9A ; |X  XX X | $BC48
    .byte $2C ; |  X XX  | $BC49
    .byte $9E ; |X  XXXX | $BC4A
    .byte $29 ; |  X X  X| $BC4B
    .byte $9E ; |X  XXXX | $BC4C
    .byte $2C ; |  X XX  | $BC4D
    .byte $9A ; |X  XX X | $BC4E
    .byte $2C ; |  X XX  | $BC4F
    .byte $9E ; |X  XXXX | $BC50
    .byte $2C ; |  X XX  | $BC51
    .byte $9E ; |X  XXXX | $BC52
    .byte $2C ; |  X XX  | $BC53
    .byte $9E ; |X  XXXX | $BC54
    .byte $2C ; |  X XX  | $BC55
    .byte $9A ; |X  XX X | $BC56
    .byte $2C ; |  X XX  | $BC57
    .byte $9A ; |X  XX X | $BC58
LBC59:
    .byte $0C ; |    XX  | $BC59
    .byte $23 ; |  X   XX| $BC5A
    .byte $9F ; |X  XXXXX| $BC5B
    .byte $23 ; |  X   XX| $BC5C
    .byte $9C ; |X  XXX  | $BC5D
    .byte $23 ; |  X   XX| $BC5E
    .byte $89 ; |X   X  X| $BC5F
    .byte $23 ; |  X   XX| $BC60
    .byte $85 ; |X    X X| $BC61
    .byte $23 ; |  X   XX| $BC62
    .byte $82 ; |X     X | $BC63
    .byte $23 ; |  X   XX| $BC64
    .byte $80 ; |X       | $BC65
    .byte $23 ; |  X   XX| $BC66
    .byte $DF ; |XX XXXXX| $BC67
    .byte $23 ; |  X   XX| $BC68
    .byte $DC ; |XX XXX  | $BC69
    .byte $23 ; |  X   XX| $BC6A
    .byte $C9 ; |XX  X  X| $BC6B
    .byte $23 ; |  X   XX| $BC6C
    .byte $C5 ; |XX   X X| $BC6D
    .byte $23 ; |  X   XX| $BC6E
    .byte $C2 ; |XX    X | $BC6F
    .byte $23 ; |  X   XX| $BC70
    .byte $C0 ; |XX      | $BC71
LBC72:
    .word LBA4F          ; $BC72
    .word LBA53          ; $BC74
    .word LBA6B          ; $BC76
    .word LBA73          ; $BC78
    .word LBA8D          ; $BC7A

    .byte $00 ; |        | $BC7C
    .byte $00 ; |        | $BC7D
    .byte $02 ; |      X | $BC7E

LBC7F:
    ldy    #$00                  ; 2
    lda    sc_7D|READ            ; 4
    sty    sc_7D                 ; 4
    cmp    #$06                  ; 2
    bne    LBC8E                 ; 2³
    jmp    LBF74                 ; 3

LBC8E:
    jmp    LBF6C                 ; 3


  IF SHOW_BYTES_REMAINING
      ECHO ([$BEFC-*]d), "bytes free BANK_5"
  ENDIF


       ALIGN 256    ; $BD00 - $BDFF

    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; this page of filled bytes is free?
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


       ORG $5EFC
      RORG $BEFC

    lda    BANK_2                ; 4
    jmp    M5106|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M5109|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9106|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M510C|BANK_MASK       ; 3

    lda    BANK_1                ; 4
    jmp    M3109|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9109|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M510F|BANK_MASK       ; 3

    lda    BANK_3                ; 4
    jmp    M7106|BANK_MASK       ; 3

    lda    BANK_3                ; 4
    jmp    M7109|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M5112|BANK_MASK       ; 3

    lda    BANK_1                ; 4
    jmp    M310F|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB10C|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB10F|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9112|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB106|BANK_MASK       ; 3

    lda    BANK_7                ; 4
    jmp    MF106|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M910F|BANK_MASK       ; 3

    lda    BANK_6                ; 4
    jmp    MD106|BANK_MASK       ; 3

LBF68:
    lda    BANK_0                ; 4
    rts                          ; 6

LBF6C:
    lda    BANK_3                ; 4
    rts                          ; 6

LBF70:
    lda    BANK_4                ; 4
    rts                          ; 6

LBF74:
    lda    BANK_6                ; 4
    rts                          ; 6


; $BF78 - $BFF3 are free bytes


       ORG $5FF4
      RORG $BFF4

    .byte $00 ; |        | $BFF4
    .byte $00 ; |        | $BFF5
    .byte $00 ; |        | $BFF6
    .byte $00 ; |        | $BFF7
    .byte $00 ; |        | $BFF8
    .byte $00 ; |        | $BFF9
    .byte $00 ; |        | $BFFA
    .byte $00 ; |        | $BFFB

    .word START_5
    .word 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      BANK 6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $6000
      RORG $D000

    SC_RAM_SPACE

START_6:
    lda    BANK_0                ; 4
    jmp    START_6               ; 3

MD106:
    jmp    LD568                 ; 3

MD109:
    jmp    LD84F                 ; 3

MD10C:
    lda    #$00                  ; 2
    sta    ram_95                ; 3
LD110:
    lda    #$03                  ; 2
    sta    VSYNC                 ; 3
    sta    RSYNC                 ; 3
    jsr    LDA09                 ; 6
    sta    VSYNC                 ; 3
    lda    #$03                  ; 2
    sta    VBLANK                ; 3
    lda    #$2E                  ; 2
    sta    TIM64T                ; 4
    inc    ram_95                ; 5
LD126:
    ldy    INTIM                 ; 4
    bne    LD126                 ; 2³
    lda    #$00                  ; 2
    sta    VBLANK                ; 3
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    COLUBK                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ENABL                 ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    #$03                  ; 2
    sta    VDELP1                ; 3
    sta    VDELP0                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    HMCLR                 ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$16                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    lda    #$01                  ; 2
    sta    CTRLPF                ; 3
    lda    #$40                  ; 2
    sta    COLUPF                ; 3
    lda    #>WinnersDontUseDrugsOne   ; 2
    sta    ram_81                     ; 3
    lda    #<WinnersDontUseDrugsOne   ; 2
    sta    ram_80                     ; 3
    lda    #>WinnersDontUseDrugsTwo   ; 2
    sta    ram_83                     ; 3
    lda    #<WinnersDontUseDrugsTwo   ; 2
    sta    ram_82                     ; 3
    lda    #>WinnersDontUseDrugsThree ; 2
    sta    ram_85                     ; 3
    lda    #<WinnersDontUseDrugsThree ; 2
    sta    ram_84                     ; 3
    lda    #>WinnersDontUseDrugsFour  ; 2
    sta    ram_87                     ; 3
    lda    #<WinnersDontUseDrugsFour  ; 2
    sta    ram_86                     ; 3
    lda    #>WinnersDontUseDrugsFive  ; 2
    sta    ram_89                     ; 3
    lda    #<WinnersDontUseDrugsFive  ; 2
    sta    ram_88                     ; 3
    lda    #>WinnersDontUseDrugsSix   ; 2
    sta    ram_98                     ; 3
    lda    #<WinnersDontUseDrugsSix   ; 2
    sta    ram_97                     ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$90                  ; 2
    stx    COLUBK                ; 3
    ldx    #$69                  ; 2
    stx    ram_90                ; 3
    lda    #$20                  ; 2
    sta    PF0                   ; 3
    jsr    LD540                 ; 6
    lda    #>William_F_Sessions_FBI_One   ; 2
    sta    ram_81                         ; 3
    lda    #<William_F_Sessions_FBI_One   ; 2
    sta    ram_80                         ; 3
    lda    #>William_F_Sessions_FBI_Two   ; 2
    sta    ram_83                         ; 3
    lda    #<William_F_Sessions_FBI_Two   ; 2
    sta    ram_82                         ; 3
    lda    #>William_F_Sessions_FBI_Three ; 2
    sta    ram_85                         ; 3
    lda    #<William_F_Sessions_FBI_Three ; 2
    sta    ram_84                         ; 3
    lda    #>William_F_Sessions_FBI_Four  ; 2
    sta    ram_87                         ; 3
    lda    #<William_F_Sessions_FBI_Four  ; 2
    sta    ram_86                         ; 3
    lda    #>William_F_Sessions_FBI_Five  ; 2
    sta    ram_89                         ; 3
    lda    #<William_F_Sessions_FBI_Five  ; 2
    sta    ram_88                         ; 3
    lda    #>William_F_Sessions_FBI_Six   ; 2
    sta    ram_98                         ; 3
    lda    #<William_F_Sessions_FBI_Six   ; 2
    sta    ram_97                         ; 3
    lda    #$B6                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    #$1A                  ; 2
    stx    ram_90                ; 3
    jsr    LD540                 ; 6
    ldx    #$2A                  ; 2
LD1ED:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LD1ED                 ; 2³
    lda    #$00                  ; 2
    sta    PF0                   ; 3
    lda    #$31                  ; 2
    sta    TIM64T                ; 4
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
LD203:
    ldy    INTIM                 ; 4
    bne    LD203                 ; 2³
    lda    ram_95                ; 3
    beq    LD20F                 ; 2³
    jmp    LD110                 ; 3

LD20F:
    jmp    LDF56                 ; 3   bankswitch, goto LF777

;                          XX
;                          XX
;                          XX
;                          XX
;                  XXX   XXXXXX   XXX
;                  XXXXXXXXXXXXXXXXXX
;                  XXXXXXXXXXXXXXXXXX
;                  XX XXX      XXX XX
;                  XXX X  XXXX  X XXX
;                  XXXX  X    X  XXXX
;                XXXXX  X      X  XXXXX
;                XXX   X        X   XXX
;                XX  XX   XXX    XX  XX
;               XXX X   X X  X     X XXX
;            XXXXX  X  X  X  X     X  XXXXX
;            XXXX  X  X   XXX    X  X  XXXX
;            X XX X  X  X X  X    X  X XX X
;            XX X X   XX  X  X    XX X X XX
;            XXX  X    X  XXX    X  X X XXX
;            XX  X      X     X X     X  XX
;           XXX X        X     XX      X XXX
;        XXXX X X          XX   X      X XXXXXX
;        XXXXX  X  X     XXXXXX  X  X  X  XXXXX
;        XXXXX X  XXX   X      X   XXX  X XXXXX
;        XXXX  X   X   X        X   X   X  XXXX
;          XX X        X        X        X XX
;        XXX  X       X          X       X  XXX
;        XXX X       X            X       X XXX
;        XX  X  X   X              X   X  X  XX
;        XX X  XXX  X              X  XXX  X XX
;        XX X   X  X                X  X   X XX
;        XX X     X                  X     X XX
;      XX   X     X         X         X    X   XX
;      XXXX X     X        XXX        X    X XXXX
;      XXXX X    X        XXXXX        X   X XXXX
;      XX  X     X X   XXXXX XXXXX   X X    XX XX
;      XX  X     XX X XXXXX   XXXXX X X X    X XX
;          X X  X  X  XXXX X X XXXX  X  X  X X
;          X    X  XX  XXXXXXXXXXX  XX  X    X
;      XX  X  X X XX   X X X X X X   XX X X  X XX
;    XXXX  X    X  XX  X X X X X X  XX  X    X XXXX
;    XXXX  X X  X XX   X X X X X X   XX X  X X XXXX
;    XXXX  X    X  XXX X X X X X X XXX  X    X XXXX
;    XXXX  X  X X X X  X X X X X X  X X X X  X XXXX
;    XXXX  X    X  XXX X X X X X X XXX  X    X XXXX
;    XXXX  X X  X   X  X X X X X X  X   X  X X XXXX
;      XX  X    X  XX  X X X X X X  XX  X    X XX
;          X  X X   XX X X X X X X XX   X X  X
;          X    X  XX   XX X X XX   XX  X    X
;      XX  X X  X   X X XX X X XX X X   X  X X XX
;      XX  X    X    X   XXX XXX   X    X    X XX
;      XXXX X   X   XX    XX XX    XX   X   XXXXX
;      XXXX X    X   XX    XXX    XX  XX   X XXXX
;      XX   X    X  X XX         XX X XX   X   XX
;        XX X  X X    X           X   X    X XX
;        XX X XXX X  XX           XX XX X  X XX
;        XX X  X  X    XXXX  XXXXX   X XXX X XX
;        XX  X    X   X XXXXXXXXX X  X  X X  XX
;        XXX X     X X  XXXXXXXXX  XX     X XXX
;        XXX  X     X   XXXXXXXXX  X     X  XXX
;          XX X     X   X  XX  XX  X     X XX
;        XXXX  X     X X         XX     X  XXXX
;        XXXXX X      X          X      X XXXXX
;        XXXXX  X      X        X      X  XXXXX
;        XXXXXX X      X        X      X XXXXXX
;           XXX X       X      X       X XXX
;            XX  X       XXXXXX       X  XX
;            XXX  X   X    XX    X   X  XXX
;            XX X X  XXX        XXX  X X XX
;            X XX X   X          X   X XX X
;            XXXX  X                X  XXXX
;            XXXXX  X              X  XXXXX
;               XXX X              X XXX
;                XX  XX          XX  XX
;                XXX   X        X   XXX
;                XXXXX  X      X  XXXXX
;                  XXXX  X    X  XXXX
;                  XXX X  XXXX  X XXX
;                  XX XXX      XXX XX
;                  XXXXXXXXXXXXXXXXXX
;                  XXXXXXXXXXXXXXXXXX
;                  XXX   XXXXXX   XXX
;                          XX
;                          XX
;                          XX
;                          XX
;
;        X   X  XXX  X   X X   X XXXXX XXXX   XXXX
;        X   X   X   XX  X XX  X X     X   X X
;        X X X   X   X X X X X X XXXX  XXXX   XXX
;        XX XX   X   X  XX X  XX X     X X       X
;        X   X  XXX  X   X X   X XXXXX X  XX XXXX
;
;      XXXX   XXX  X   X X XXXXX  X   X  XXXX XXXXX
;      X   X X   X XX  X X   X    X   X X     X
;      X   X X   X X X X     X    X   X  XXX  XXXX
;      X   X X   X X  XX     X    X   X     X X
;      XXXX   XXX  X   X     X     XXXX XXXX  XXXXX
;
;            XXXX  XXXX  X   X  XXXX  XXXX X
;            X   X X   X X   X X     X     X
;            X   X XXXX  X   X X  XX  XXX  X
;            X   X X X   X   X X   X     X X
;            XXXX  X  XX  XXXX  XXXX XXXX
;                                          X
;


WinnersDontUseDrugsOne:
    .byte $00 ; |        | $D212
    .byte $00 ; |        | $D213
    .byte $00 ; |        | $D214
    .byte $00 ; |        | $D215
    .byte $00 ; |        | $D216
    .byte $00 ; |        | $D217
    .byte $00 ; |        | $D218
    .byte $00 ; |        | $D219
    .byte $3C ; |  XXXX  | $D21A
    .byte $22 ; |  X   X | $D21B
    .byte $22 ; |  X   X | $D21C
    .byte $22 ; |  X   X | $D21D
    .byte $3C ; |  XXXX  | $D21E
    .byte $00 ; |        | $D21F
    .byte $08 ; |    X   | $D220
    .byte $0D ; |    XX X| $D221
    .byte $0A ; |    X X | $D222
    .byte $08 ; |    X   | $D223
    .byte $08 ; |    X   | $D224
    .byte $00 ; |        | $D225
    .byte $00 ; |        | $D226
    .byte $00 ; |        | $D227
    .byte $00 ; |        | $D228
    .byte $00 ; |        | $D229
    .byte $00 ; |        | $D22A
    .byte $00 ; |        | $D22B
    .byte $00 ; |        | $D22C
    .byte $00 ; |        | $D22D
    .byte $00 ; |        | $D22E
    .byte $00 ; |        | $D22F
    .byte $00 ; |        | $D230
    .byte $00 ; |        | $D231
    .byte $00 ; |        | $D232
    .byte $00 ; |        | $D233
    .byte $00 ; |        | $D234
    .byte $00 ; |        | $D235
    .byte $00 ; |        | $D236
    .byte $00 ; |        | $D237
    .byte $00 ; |        | $D238
    .byte $00 ; |        | $D239
    .byte $01 ; |       X| $D23A
    .byte $0F ; |    XXXX| $D23B
    .byte $0F ; |    XXXX| $D23C
    .byte $0F ; |    XXXX| $D23D
    .byte $0F ; |    XXXX| $D23E
    .byte $03 ; |      XX| $D23F
    .byte $0E ; |    XXX | $D240
    .byte $0E ; |    XXX | $D241
    .byte $0C ; |    XX  | $D242
    .byte $0D ; |    XX X| $D243
    .byte $0D ; |    XX X| $D244
    .byte $0D ; |    XX X| $D245
    .byte $31 ; |  XX   X| $D246
    .byte $3D ; |  XXXX X| $D247
    .byte $3D ; |  XXXX X| $D248
    .byte $32 ; |  XX  X | $D249
    .byte $32 ; |  XX  X | $D24A
    .byte $02 ; |      X | $D24B
    .byte $02 ; |      X | $D24C
    .byte $32 ; |  XX  X | $D24D
    .byte $F2 ; |XXXX  X | $D24E
    .byte $F2 ; |XXXX  X | $D24F
    .byte $F2 ; |XXXX  X | $D250
    .byte $F2 ; |XXXX  X | $D251
    .byte $F2 ; |XXXX  X | $D252
    .byte $F2 ; |XXXX  X | $D253
    .byte $32 ; |  XX  X | $D254
    .byte $02 ; |      X | $D255
    .byte $02 ; |      X | $D256
    .byte $32 ; |  XX  X | $D257
    .byte $32 ; |  XX  X | $D258
    .byte $3D ; |  XXXX X| $D259
    .byte $3D ; |  XXXX X| $D25A
    .byte $31 ; |  XX   X| $D25B
    .byte $0D ; |    XX X| $D25C
    .byte $0D ; |    XX X| $D25D
    .byte $0D ; |    XX X| $D25E
    .byte $0C ; |    XX  | $D25F
    .byte $0E ; |    XXX | $D260
    .byte $0E ; |    XXX | $D261
    .byte $03 ; |      XX| $D262
    .byte $0F ; |    XXXX| $D263
    .byte $0F ; |    XXXX| $D264
    .byte $0F ; |    XXXX| $D265
    .byte $0F ; |    XXXX| $D266
    .byte $01 ; |       X| $D267
    .byte $00 ; |        | $D268
    .byte $00 ; |        | $D269
    .byte $00 ; |        | $D26A
    .byte $00 ; |        | $D26B
    .byte $00 ; |        | $D26C
    .byte $00 ; |        | $D26D
    .byte $00 ; |        | $D26E
    .byte $00 ; |        | $D26F
    .byte $00 ; |        | $D270
    .byte $00 ; |        | $D271
    .byte $00 ; |        | $D272
    .byte $00 ; |        | $D273
    .byte $00 ; |        | $D274
    .byte $00 ; |        | $D275
    .byte $00 ; |        | $D276
    .byte $00 ; |        | $D277
    .byte $00 ; |        | $D278
    .byte $00 ; |        | $D279
    .byte $00 ; |        | $D27A
    .byte $00 ; |        | $D27B
WinnersDontUseDrugsTwo:
    .byte $00 ; |        | $D27C
    .byte $00 ; |        | $D27D
    .byte $F2 ; |XXXX  X | $D27E
    .byte $8A ; |X   X X | $D27F
    .byte $8B ; |X   X XX| $D280
    .byte $8A ; |X   X X | $D281
    .byte $F3 ; |XXXX  XX| $D282
    .byte $00 ; |        | $D283
    .byte $72 ; | XXX  X | $D284
    .byte $8A ; |X   X X | $D285
    .byte $8A ; |X   X X | $D286
    .byte $8B ; |X   X XX| $D287
    .byte $72 ; | XXX  X | $D288
    .byte $00 ; |        | $D289
    .byte $9C ; |X  XXX  | $D28A
    .byte $88 ; |X   X   | $D28B
    .byte $88 ; |X   X   | $D28C
    .byte $88 ; |X   X   | $D28D
    .byte $9C ; |X  XXX  | $D28E
    .byte $00 ; |        | $D28F
    .byte $00 ; |        | $D290
    .byte $00 ; |        | $D291
    .byte $00 ; |        | $D292
    .byte $00 ; |        | $D293
    .byte $03 ; |      XX| $D294
    .byte $03 ; |      XX| $D295
    .byte $03 ; |      XX| $D296
    .byte $03 ; |      XX| $D297
    .byte $03 ; |      XX| $D298
    .byte $03 ; |      XX| $D299
    .byte $0F ; |    XXXX| $D29A
    .byte $0E ; |    XXX | $D29B
    .byte $0C ; |    XX  | $D29C
    .byte $1D ; |   XXX X| $D29D
    .byte $F9 ; |XXXXX  X| $D29E
    .byte $F2 ; |XXXX  X | $D29F
    .byte $B4 ; |X XX X  | $D2A0
    .byte $D4 ; |XX X X  | $D2A1
    .byte $E4 ; |XXX  X  | $D2A2
    .byte $C8 ; |XX  X   | $D2A3
    .byte $D0 ; |XX X    | $D2A4
    .byte $D0 ; |XX X    | $D2A5
    .byte $90 ; |X  X    | $D2A6
    .byte $A0 ; |X X     | $D2A7
    .byte $20 ; |  X     | $D2A8
    .byte $41 ; | X     X| $D2A9
    .byte $41 ; | X     X| $D2AA
    .byte $82 ; |X     X | $D2AB
    .byte $84 ; |X    X  | $D2AC
    .byte $24 ; |  X  X  | $D2AD
    .byte $74 ; | XXX X  | $D2AE
    .byte $28 ; |  X X   | $D2AF
    .byte $09 ; |    X  X| $D2B0
    .byte $08 ; |    X   | $D2B1
    .byte $11 ; |   X   X| $D2B2
    .byte $10 ; |   X    | $D2B3
    .byte $91 ; |X  X   X| $D2B4
    .byte $13 ; |   X  XX| $D2B5
    .byte $51 ; | X X   X| $D2B6
    .byte $13 ; |   X  XX| $D2B7
    .byte $91 ; |X  X   X| $D2B8
    .byte $13 ; |   X  XX| $D2B9
    .byte $55 ; | X X X X| $D2BA
    .byte $13 ; |   X  XX| $D2BB
    .byte $96 ; |X  X XX | $D2BC
    .byte $13 ; |   X  XX| $D2BD
    .byte $56 ; | X X XX | $D2BE
    .byte $13 ; |   X  XX| $D2BF
    .byte $92 ; |X  X  X | $D2C0
    .byte $0D ; |    XX X| $D2C1
    .byte $0A ; |    X X | $D2C2
    .byte $08 ; |    X   | $D2C3
    .byte $04 ; |     X  | $D2C4
    .byte $04 ; |     X  | $D2C5
    .byte $04 ; |     X  | $D2C6
    .byte $12 ; |   X  X | $D2C7
    .byte $39 ; |  XXX  X| $D2C8
    .byte $91 ; |X  X   X| $D2C9
    .byte $80 ; |X       | $D2CA
    .byte $40 ; | X      | $D2CB
    .byte $40 ; | X      | $D2CC
    .byte $22 ; |  X   X | $D2CD
    .byte $A7 ; |X X  XXX| $D2CE
    .byte $92 ; |X  X  X | $D2CF
    .byte $50 ; | X X    | $D2D0
    .byte $D0 ; |XX X    | $D2D1
    .byte $C8 ; |XX  X   | $D2D2
    .byte $E4 ; |XXX  X  | $D2D3
    .byte $D4 ; |XX X X  | $D2D4
    .byte $B4 ; |X XX X  | $D2D5
    .byte $F2 ; |XXXX  X | $D2D6
    .byte $F9 ; |XXXXX  X| $D2D7
    .byte $1D ; |   XXX X| $D2D8
    .byte $0C ; |    XX  | $D2D9
    .byte $0E ; |    XXX | $D2DA
    .byte $0F ; |    XXXX| $D2DB
    .byte $03 ; |      XX| $D2DC
    .byte $03 ; |      XX| $D2DD
    .byte $03 ; |      XX| $D2DE
    .byte $03 ; |      XX| $D2DF
    .byte $03 ; |      XX| $D2E0
    .byte $03 ; |      XX| $D2E1
    .byte $00 ; |        | $D2E2
    .byte $00 ; |        | $D2E3
    .byte $00 ; |        | $D2E4
    .byte $00 ; |        | $D2E5

;            X   X XXX X   X   XXX  X  X   X
;            X   X  X  X   X    X  X X XX XX
;            X   X  X  X   X    X  X X XXXXX
;            X   X  X  X   X    X  XXX X   X
;            X X X  X  X   X    X  X X X   X
;             X X  XXX XXX XXX XXX X X X   X
;
;                         XX
;                        X
;                         XX
;                           X
;                           X
;                         XX  X
;
;           XX  XXX  XX   XX  XXX  X  X  X  XX
;          X    X   X    X     X  X X XX X X
;           XX  XX   XX   XX   X  X X XXXX  XX
;             X X      X    X  X  X X X XX    X
;             X X      X    X  X  X X X  X    X
;           XX  XXX  XX   XX  XXX  X  X  X  XX
;
;                   XXX  XX    XXX
;                   X    X X    X
;                   XX   XX     X
;                   X    X X    X
;                   X    X X    X
;                   X  X XX  X XXX X


William_F_Sessions_FBI_One:
    .byte $00 ; |        | $D2E6
    .byte $00 ; |        | $D2E7
    .byte $00 ; |        | $D2E8
    .byte $00 ; |        | $D2E9
    .byte $00 ; |        | $D2EA
    .byte $00 ; |        | $D2EB
    .byte $00 ; |        | $D2EC
    .byte $01 ; |       X| $D2ED
    .byte $00 ; |        | $D2EE
    .byte $00 ; |        | $D2EF
    .byte $01 ; |       X| $D2F0
    .byte $02 ; |      X | $D2F1
    .byte $01 ; |       X| $D2F2
    .byte $00 ; |        | $D2F3
    .byte $00 ; |        | $D2F4
    .byte $00 ; |        | $D2F5
    .byte $00 ; |        | $D2F6
    .byte $00 ; |        | $D2F7
    .byte $00 ; |        | $D2F8
    .byte $00 ; |        | $D2F9
    .byte $00 ; |        | $D2FA
    .byte $00 ; |        | $D2FB
    .byte $00 ; |        | $D2FC
    .byte $00 ; |        | $D2FD
    .byte $00 ; |        | $D2FE
    .byte $00 ; |        | $D2FF
WinnersDontUseDrugsThree:
    .byte $00 ; |        | $D300  shared
    .byte $00 ; |        | $D301
    .byte $67 ; | XX  XXX| $D302
    .byte $88 ; |X   X   | $D303
    .byte $C8 ; |XX  X   | $D304
    .byte $28 ; |  X X   | $D305
    .byte $C8 ; |XX  X   | $D306
    .byte $00 ; |        | $D307
    .byte $20 ; |  X     | $D308
    .byte $60 ; | XX     | $D309
    .byte $A0 ; |X X     | $D30A
    .byte $28 ; |  X X   | $D30B
    .byte $2B ; |  X X XX| $D30C
    .byte $00 ; |        | $D30D
    .byte $8A ; |X   X X | $D30E
    .byte $9A ; |X  XX X | $D30F
    .byte $AA ; |X X X X | $D310
    .byte $CB ; |XX  X XX| $D311
    .byte $8A ; |X   X X | $D312
    .byte $00 ; |        | $D313
    .byte $03 ; |      XX| $D314
    .byte $03 ; |      XX| $D315
    .byte $03 ; |      XX| $D316
    .byte $03 ; |      XX| $D317
    .byte $8F ; |X   XXXX| $D318
    .byte $FF ; |XXXXXXXX| $D319
    .byte $FF ; |XXXXXXXX| $D31A
    .byte $70 ; | XXX    | $D31B
    .byte $A7 ; |X X  XXX| $D31C
    .byte $C8 ; |XX  X   | $D31D
    .byte $90 ; |X  X    | $D31E
    .byte $20 ; |  X     | $D31F
    .byte $C0 ; |XX      | $D320
    .byte $00 ; |        | $D321
    .byte $00 ; |        | $D322
    .byte $00 ; |        | $D323
    .byte $40 ; | X      | $D324
    .byte $E0 ; |XXX     | $D325
    .byte $43 ; | X    XX| $D326
    .byte $0F ; |    XXXX| $D327
    .byte $10 ; |   X    | $D328
    .byte $20 ; |  X     | $D329
    .byte $20 ; |  X     | $D32A
    .byte $40 ; | X      | $D32B
    .byte $A0 ; |X X     | $D32C
    .byte $13 ; |   X  XX| $D32D
    .byte $1F ; |   XXXXX| $D32E
    .byte $9F ; |X  XXXXX| $D32F
    .byte $5F ; | X XXXXX| $D330
    .byte $3C ; |  XXXX  | $D331
    .byte $C0 ; |XX      | $D332
    .byte $40 ; | X      | $D333
    .byte $60 ; | XX     | $D334
    .byte $C3 ; |XX    XX| $D335
    .byte $86 ; |X    XX | $D336
    .byte $8E ; |X   XXX | $D337
    .byte $5A ; | X XX X | $D338
    .byte $1A ; |   XX X | $D339
    .byte $AA ; |X X X X | $D33A
    .byte $2A ; |  X X X | $D33B
    .byte $2A ; |  X X X | $D33C
    .byte $AA ; |X X X X | $D33D
    .byte $2A ; |  X X X | $D33E
    .byte $AA ; |X X X X | $D33F
    .byte $2A ; |  X X X | $D340
    .byte $2A ; |  X X X | $D341
    .byte $2A ; |  X X X | $D342
    .byte $3F ; |  XXXXXX| $D343
    .byte $7A ; | XXXX X | $D344
    .byte $7C ; | XXXXX  | $D345
    .byte $3E ; |  XXXXX | $D346
    .byte $07 ; |     XXX| $D347
    .byte $03 ; |      XX| $D348
    .byte $01 ; |       X| $D349
    .byte $00 ; |        | $D34A
    .byte $00 ; |        | $D34B
    .byte $00 ; |        | $D34C
    .byte $00 ; |        | $D34D
    .byte $80 ; |X       | $D34E
    .byte $40 ; | X      | $D34F
    .byte $20 ; |  X     | $D350
    .byte $20 ; |  X     | $D351
    .byte $10 ; |   X    | $D352
    .byte $0F ; |    XXXX| $D353
    .byte $03 ; |      XX| $D354
    .byte $08 ; |    X   | $D355
    .byte $10 ; |   X    | $D356
    .byte $27 ; |  X  XXX| $D357
    .byte $64 ; | XX  X  | $D358
    .byte $94 ; |X  X X  | $D359
    .byte $47 ; | X   XXX| $D35A
    .byte $24 ; |  X  X  | $D35B
    .byte $14 ; |   X X  | $D35C
    .byte $C7 ; |XX   XXX| $D35D
    .byte $20 ; |  X     | $D35E
    .byte $90 ; |X  X    | $D35F
    .byte $C8 ; |XX  X   | $D360
    .byte $A7 ; |X X  XXX| $D361
    .byte $70 ; | XXX    | $D362
    .byte $FF ; |XXXXXXXX| $D363
    .byte $FF ; |XXXXXXXX| $D364
    .byte $8F ; |X   XXXX| $D365
    .byte $03 ; |      XX| $D366
    .byte $03 ; |      XX| $D367
    .byte $03 ; |      XX| $D368
    .byte $03 ; |      XX| $D369
WinnersDontUseDrugsFour:
    .byte $00 ; |        | $D36A
    .byte $00 ; |        | $D36B
    .byte $9E ; |X  XXXX | $D36C
    .byte $A2 ; |X X   X | $D36D
    .byte $A6 ; |X X  XX | $D36E
    .byte $A0 ; |X X     | $D36F
    .byte $9E ; |X  XXXX | $D370
    .byte $00 ; |        | $D371
    .byte $83 ; |X     XX| $D372
    .byte $84 ; |X    X  | $D373
    .byte $84 ; |X    X  | $D374
    .byte $84 ; |X    X  | $D375
    .byte $E4 ; |XXX  X  | $D376
    .byte $00 ; |        | $D377
    .byte $2F ; |  X XXXX| $D378
    .byte $68 ; | XX X   | $D379
    .byte $AF ; |X X XXXX| $D37A
    .byte $28 ; |  X X   | $D37B
    .byte $2F ; |  X XXXX| $D37C
    .byte $00 ; |        | $D37D
    .byte $00 ; |        | $D37E
    .byte $00 ; |        | $D37F
    .byte $00 ; |        | $D380
    .byte $00 ; |        | $D381
    .byte $C7 ; |XX   XXX| $D382
    .byte $FF ; |XXXXXXXX| $D383
    .byte $FF ; |XXXXXXXX| $D384
    .byte $3B ; |  XXX XX| $D385
    .byte $97 ; |X  X XXX| $D386
    .byte $4F ; | X  XXXX| $D387
    .byte $27 ; |  X  XXX| $D388
    .byte $11 ; |   X   X| $D389
    .byte $0C ; |    XX  | $D38A
    .byte $02 ; |      X | $D38B
    .byte $02 ; |      X | $D38C
    .byte $01 ; |       X| $D38D
    .byte $08 ; |    X   | $D38E
    .byte $1C ; |   XXX  | $D38F
    .byte $08 ; |    X   | $D390
    .byte $C0 ; |XX      | $D391
    .byte $20 ; |  X     | $D392
    .byte $10 ; |   X    | $D393
    .byte $10 ; |   X    | $D394
    .byte $08 ; |    X   | $D395
    .byte $0C ; |    XX  | $D396
    .byte $32 ; |  XX  X | $D397
    .byte $F2 ; |XXXX  X | $D398
    .byte $F3 ; |XXXX  XX| $D399
    .byte $F4 ; |XXXX X  | $D39A
    .byte $F8 ; |XXXXX   | $D39B
    .byte $06 ; |     XX | $D39C
    .byte $04 ; |     X  | $D39D
    .byte $0D ; |    XX X| $D39E
    .byte $86 ; |X    XX | $D39F
    .byte $C3 ; |XX    XX| $D3A0
    .byte $E2 ; |XXX   X | $D3A1
    .byte $B5 ; |X XX X X| $D3A2
    .byte $B1 ; |X XX   X| $D3A3
    .byte $AB ; |X X X XX| $D3A4
    .byte $A9 ; |X X X  X| $D3A5
    .byte $A9 ; |X X X  X| $D3A6
    .byte $AB ; |X X X XX| $D3A7
    .byte $A9 ; |X X X  X| $D3A8
    .byte $AB ; |X X X XX| $D3A9
    .byte $A8 ; |X X X   | $D3AA
    .byte $A9 ; |X X X  X| $D3AB
    .byte $A8 ; |X X X   | $D3AC
    .byte $F9 ; |XXXXX  X| $D3AD
    .byte $BC ; |X XXXX  | $D3AE
    .byte $7D ; | XXXXX X| $D3AF
    .byte $F8 ; |XXXXX   | $D3B0
    .byte $C0 ; |XX      | $D3B1
    .byte $80 ; |X       | $D3B2
    .byte $00 ; |        | $D3B3
    .byte $00 ; |        | $D3B4
    .byte $01 ; |       X| $D3B5
    .byte $02 ; |      X | $D3B6
    .byte $02 ; |      X | $D3B7
    .byte $04 ; |     X  | $D3B8
    .byte $08 ; |    X   | $D3B9
    .byte $10 ; |   X    | $D3BA
    .byte $11 ; |   X   X| $D3BB
    .byte $23 ; |  X   XX| $D3BC
    .byte $C9 ; |XX  X  X| $D3BD
    .byte $10 ; |   X    | $D3BE
    .byte $30 ; |  XX    | $D3BF
    .byte $50 ; | X X    | $D3C0
    .byte $09 ; |    X  X| $D3C1
    .byte $86 ; |X    XX | $D3C2
    .byte $84 ; |X    X  | $D3C3
    .byte $09 ; |    X  X| $D3C4
    .byte $82 ; |X     X | $D3C5
    .byte $82 ; |X     X | $D3C6
    .byte $0C ; |    XX  | $D3C7
    .byte $11 ; |   X   X| $D3C8
    .byte $27 ; |  X  XXX| $D3C9
    .byte $4F ; | X  XXXX| $D3CA
    .byte $97 ; |X  X XXX| $D3CB
    .byte $3B ; |  XXX XX| $D3CC
    .byte $FF ; |XXXXXXXX| $D3CD
    .byte $FF ; |XXXXXXXX| $D3CE
    .byte $C7 ; |XX   XXX| $D3CF
    .byte $00 ; |        | $D3D0
    .byte $00 ; |        | $D3D1
    .byte $00 ; |        | $D3D2
    .byte $00 ; |        | $D3D3
William_F_Sessions_FBI_Three:
    .byte $2C ; |  X XX  | $D3D4
    .byte $0A ; |    X X | $D3D5
    .byte $0A ; |    X X | $D3D6
    .byte $8C ; |X   XX  | $D3D7
    .byte $0A ; |    X X | $D3D8
    .byte $CC ; |XX  XX  | $D3D9
    .byte $00 ; |        | $D3DA
    .byte $C6 ; |XX   XX | $D3DB
    .byte $21 ; |  X    X| $D3DC
    .byte $21 ; |  X    X| $D3DD
    .byte $C6 ; |XX   XX | $D3DE
    .byte $08 ; |    X   | $D3DF
    .byte $C6 ; |XX   XX | $D3E0
    .byte $00 ; |        | $D3E1
    .byte $06 ; |     XX | $D3E2
    .byte $01 ; |       X| $D3E3
    .byte $01 ; |       X| $D3E4
    .byte $06 ; |     XX | $D3E5
    .byte $08 ; |    X   | $D3E6
    .byte $06 ; |     XX | $D3E7
    .byte $00 ; |        | $D3E8
    .byte $BB ; |X XXX XX| $D3E9
    .byte $22 ; |  X   X | $D3EA
    .byte $22 ; |  X   X | $D3EB
    .byte $22 ; |  X   X | $D3EC
    .byte $22 ; |  X   X | $D3ED
    .byte $A2 ; |X X   X | $D3EE

    .byte $00 ; |        | $D3EF  free bytes
    .byte $00 ; |        | $D3F0
    .byte $00 ; |        | $D3F1
    .byte $00 ; |        | $D3F2
    .byte $00 ; |        | $D3F3
    .byte $00 ; |        | $D3F4
    .byte $00 ; |        | $D3F5
    .byte $00 ; |        | $D3F6
    .byte $00 ; |        | $D3F7
    .byte $00 ; |        | $D3F8
    .byte $00 ; |        | $D3F9
    .byte $00 ; |        | $D3FA
    .byte $00 ; |        | $D3FB
    .byte $00 ; |        | $D3FC
    .byte $00 ; |        | $D3FD
    .byte $00 ; |        | $D3FE
    .byte $00 ; |        | $D3FF

WinnersDontUseDrugsFive:
    .byte $00 ; |        | $D400
    .byte $02 ; |      X | $D401
    .byte $F0 ; |XXXX    | $D402
    .byte $0A ; |    X X | $D403
    .byte $72 ; | XXX  X | $D404
    .byte $82 ; |X     X | $D405
    .byte $7A ; | XXXX X | $D406
    .byte $00 ; |        | $D407
    .byte $DE ; |XX XXXX | $D408
    .byte $41 ; | X     X| $D409
    .byte $4E ; | X  XXX | $D40A
    .byte $50 ; | X X    | $D40B
    .byte $4F ; | X  XXXX| $D40C
    .byte $00 ; |        | $D40D
    .byte $A6 ; |X X  XX | $D40E
    .byte $28 ; |  X X   | $D40F
    .byte $3C ; |  XXXX  | $D410
    .byte $22 ; |  X   X | $D411
    .byte $BC ; |X XXXX  | $D412
    .byte $00 ; |        | $D413
    .byte $00 ; |        | $D414
    .byte $00 ; |        | $D415
    .byte $00 ; |        | $D416
    .byte $00 ; |        | $D417
    .byte $00 ; |        | $D418
    .byte $00 ; |        | $D419
    .byte $00 ; |        | $D41A
    .byte $00 ; |        | $D41B
    .byte $00 ; |        | $D41C
    .byte $00 ; |        | $D41D
    .byte $C0 ; |XX      | $D41E
    .byte $C0 ; |XX      | $D41F
    .byte $C0 ; |XX      | $D420
    .byte $E0 ; |XXX     | $D421
    .byte $7C ; | XXXXX  | $D422
    .byte $3C ; |  XXXX  | $D423
    .byte $B4 ; |X XX X  | $D424
    .byte $AC ; |X X XX  | $D425
    .byte $9C ; |X  XXX  | $D426
    .byte $4C ; | X  XX  | $D427
    .byte $2E ; |  X XXX | $D428
    .byte $2F ; |  X XXXX| $D429
    .byte $27 ; |  X  XXX| $D42A
    .byte $17 ; |   X XXX| $D42B
    .byte $13 ; |   X  XX| $D42C
    .byte $0B ; |    X XX| $D42D
    .byte $09 ; |    X  X| $D42E
    .byte $05 ; |     X X| $D42F
    .byte $94 ; |X  X X  | $D430
    .byte $BA ; |X XXX X | $D431
    .byte $D2 ; |XX X  X | $D432
    .byte $42 ; | X    X | $D433
    .byte $62 ; | XX   X | $D434
    .byte $62 ; | XX   X | $D435
    .byte $11 ; |   X   X| $D436
    .byte $10 ; |   X    | $D437
    .byte $12 ; |   X  X | $D438
    .byte $90 ; |X  X    | $D439
    .byte $14 ; |   X X  | $D43A
    .byte $90 ; |X  X    | $D43B
    .byte $12 ; |   X  X | $D43C
    .byte $90 ; |X  X    | $D43D
    .byte $54 ; | X X X  | $D43E
    .byte $90 ; |X  X    | $D43F
    .byte $D2 ; |XX X  X | $D440
    .byte $90 ; |X  X    | $D441
    .byte $D4 ; |XX X X  | $D442
    .byte $90 ; |X  X    | $D443
    .byte $92 ; |X  X  X | $D444
    .byte $50 ; | X X    | $D445
    .byte $A1 ; |X X    X| $D446
    .byte $22 ; |  X   X | $D447
    .byte $42 ; | X    X | $D448
    .byte $42 ; | X    X | $D449
    .byte $82 ; |X     X | $D44A
    .byte $22 ; |  X   X | $D44B
    .byte $72 ; | XXX  X | $D44C
    .byte $24 ; |  X  X  | $D44D
    .byte $05 ; |     X X| $D44E
    .byte $09 ; |    X  X| $D44F
    .byte $0B ; |    X XX| $D450
    .byte $13 ; |   X  XX| $D451
    .byte $97 ; |X  X XXX| $D452
    .byte $27 ; |  X  XXX| $D453
    .byte $2F ; |  X XXXX| $D454
    .byte $2E ; |  X XXX | $D455
    .byte $4C ; | X  XX  | $D456
    .byte $5C ; | X XXX  | $D457
    .byte $AC ; |X X XX  | $D458
    .byte $B4 ; |X XX X  | $D459
    .byte $3C ; |  XXXX  | $D45A
    .byte $7C ; | XXXXX  | $D45B
    .byte $E0 ; |XXX     | $D45C
    .byte $C0 ; |XX      | $D45D
    .byte $C0 ; |XX      | $D45E
    .byte $C0 ; |XX      | $D45F
    .byte $00 ; |        | $D460
    .byte $00 ; |        | $D461
    .byte $00 ; |        | $D462
    .byte $00 ; |        | $D463
    .byte $00 ; |        | $D464
    .byte $00 ; |        | $D465
    .byte $00 ; |        | $D466
    .byte $00 ; |        | $D467
    .byte $00 ; |        | $D468
    .byte $00 ; |        | $D469
WinnersDontUseDrugsSix:
    .byte $00 ; |        | $D46A
    .byte $00 ; |        | $D46B
    .byte $00 ; |        | $D46C
    .byte $00 ; |        | $D46D
    .byte $00 ; |        | $D46E
    .byte $00 ; |        | $D46F
    .byte $00 ; |        | $D470
    .byte $00 ; |        | $D471
    .byte $7C ; | XXXXX  | $D472
    .byte $40 ; | X      | $D473
    .byte $78 ; | XXXX   | $D474
    .byte $40 ; | X      | $D475
    .byte $7C ; | XXXXX  | $D476
    .byte $00 ; |        | $D477
    .byte $F0 ; |XXXX    | $D478
    .byte $08 ; |    X   | $D479
    .byte $70 ; | XXX    | $D47A
    .byte $80 ; |X       | $D47B
    .byte $78 ; | XXXX   | $D47C
    .byte $00 ; |        | $D47D
    .byte $00 ; |        | $D47E
    .byte $00 ; |        | $D47F
    .byte $00 ; |        | $D480
    .byte $00 ; |        | $D481
    .byte $00 ; |        | $D482
    .byte $00 ; |        | $D483
    .byte $00 ; |        | $D484
    .byte $00 ; |        | $D485
    .byte $00 ; |        | $D486
    .byte $00 ; |        | $D487
    .byte $00 ; |        | $D488
    .byte $00 ; |        | $D489
    .byte $00 ; |        | $D48A
    .byte $00 ; |        | $D48B
    .byte $00 ; |        | $D48C
    .byte $00 ; |        | $D48D
    .byte $00 ; |        | $D48E
    .byte $00 ; |        | $D48F
    .byte $00 ; |        | $D490
    .byte $00 ; |        | $D491
    .byte $00 ; |        | $D492
    .byte $C0 ; |XX      | $D493
    .byte $C0 ; |XX      | $D494
    .byte $C0 ; |XX      | $D495
    .byte $C0 ; |XX      | $D496
    .byte $00 ; |        | $D497
    .byte $C0 ; |XX      | $D498
    .byte $C0 ; |XX      | $D499
    .byte $C0 ; |XX      | $D49A
    .byte $C0 ; |XX      | $D49B
    .byte $C0 ; |XX      | $D49C
    .byte $C0 ; |XX      | $D49D
    .byte $30 ; |  XX    | $D49E
    .byte $F0 ; |XXXX    | $D49F
    .byte $F0 ; |XXXX    | $D4A0
    .byte $B0 ; |X XX    | $D4A1
    .byte $B0 ; |X XX    | $D4A2
    .byte $80 ; |X       | $D4A3
    .byte $80 ; |X       | $D4A4
    .byte $B0 ; |X XX    | $D4A5
    .byte $BC ; |X XXXX  | $D4A6
    .byte $BC ; |X XXXX  | $D4A7
    .byte $BC ; |X XXXX  | $D4A8
    .byte $BC ; |X XXXX  | $D4A9
    .byte $BC ; |X XXXX  | $D4AA
    .byte $BC ; |X XXXX  | $D4AB
    .byte $B0 ; |X XX    | $D4AC
    .byte $80 ; |X       | $D4AD
    .byte $80 ; |X       | $D4AE
    .byte $B0 ; |X XX    | $D4AF
    .byte $B0 ; |X XX    | $D4B0
    .byte $F0 ; |XXXX    | $D4B1
    .byte $F0 ; |XXXX    | $D4B2
    .byte $30 ; |  XX    | $D4B3
    .byte $C0 ; |XX      | $D4B4
    .byte $C0 ; |XX      | $D4B5
    .byte $C0 ; |XX      | $D4B6
    .byte $C0 ; |XX      | $D4B7
    .byte $C0 ; |XX      | $D4B8
    .byte $C0 ; |XX      | $D4B9
    .byte $00 ; |        | $D4BA
    .byte $C0 ; |XX      | $D4BB
    .byte $C0 ; |XX      | $D4BC
    .byte $C0 ; |XX      | $D4BD
    .byte $C0 ; |XX      | $D4BE
    .byte $00 ; |        | $D4BF
    .byte $00 ; |        | $D4C0
    .byte $00 ; |        | $D4C1
    .byte $00 ; |        | $D4C2
    .byte $00 ; |        | $D4C3
    .byte $00 ; |        | $D4C4
    .byte $00 ; |        | $D4C5
    .byte $00 ; |        | $D4C6
    .byte $00 ; |        | $D4C7
    .byte $00 ; |        | $D4C8
    .byte $00 ; |        | $D4C9
    .byte $00 ; |        | $D4CA
    .byte $00 ; |        | $D4CB
    .byte $00 ; |        | $D4CC
    .byte $00 ; |        | $D4CD
    .byte $00 ; |        | $D4CE
    .byte $00 ; |        | $D4CF
    .byte $00 ; |        | $D4D0
    .byte $00 ; |        | $D4D1
    .byte $00 ; |        | $D4D2
    .byte $00 ; |        | $D4D3
William_F_Sessions_FBI_Five:
    .byte $00 ; |        | $D4D4
    .byte $00 ; |        | $D4D5
    .byte $00 ; |        | $D4D6
    .byte $00 ; |        | $D4D7
    .byte $00 ; |        | $D4D8
    .byte $00 ; |        | $D4D9
    .byte $00 ; |        | $D4DA
    .byte $49 ; | X  X  X| $D4DB
    .byte $48 ; | X  X   | $D4DC
    .byte $58 ; | X XX   | $D4DD
    .byte $79 ; | XXXX  X| $D4DE
    .byte $6A ; | XX X X | $D4DF
    .byte $49 ; | X  X  X| $D4E0
    .byte $00 ; |        | $D4E1
    .byte $00 ; |        | $D4E2
    .byte $00 ; |        | $D4E3
    .byte $00 ; |        | $D4E4
    .byte $00 ; |        | $D4E5
    .byte $00 ; |        | $D4E6
    .byte $00 ; |        | $D4E7
    .byte $00 ; |        | $D4E8
    .byte $A2 ; |X X   X | $D4E9
    .byte $A2 ; |X X   X | $D4EA
    .byte $A2 ; |X X   X | $D4EB
    .byte $BE ; |X XXXXX | $D4EC
    .byte $B6 ; |X XX XX | $D4ED
    .byte $22 ; |  X   X | $D4EE
William_F_Sessions_FBI_Two:
    .byte $01 ; |       X| $D4EF
    .byte $01 ; |       X| $D4F0
    .byte $01 ; |       X| $D4F1
    .byte $01 ; |       X| $D4F2
    .byte $01 ; |       X| $D4F3
    .byte $01 ; |       X| $D4F4
    .byte $00 ; |        | $D4F5
    .byte $9C ; |X  XXX  | $D4F6
    .byte $50 ; | X X    | $D4F7
    .byte $50 ; | X X    | $D4F8
    .byte $98 ; |X  XX   | $D4F9
    .byte $11 ; |   X   X| $D4FA
    .byte $9C ; |X  XXX  | $D4FB
    .byte $00 ; |        | $D4FC
    .byte $00 ; |        | $D4FD
    .byte $00 ; |        | $D4FE
    .byte $00 ; |        | $D4FF
    .byte $00 ; |        | $D500
    .byte $00 ; |        | $D501
    .byte $00 ; |        | $D502
    .byte $00 ; |        | $D503
    .byte $53 ; | X X  XX| $D504
    .byte $A9 ; |X X X  X| $D505
    .byte $89 ; |X   X  X| $D506
    .byte $89 ; |X   X  X| $D507
    .byte $89 ; |X   X  X| $D508
    .byte $8B ; |X   X XX| $D509
William_F_Sessions_FBI_Four:
    .byte $BA ; |X XXX X | $D50A
    .byte $10 ; |   X    | $D50B
    .byte $10 ; |   X    | $D50C
    .byte $10 ; |   X    | $D50D
    .byte $10 ; |   X    | $D50E
    .byte $38 ; |  XXX   | $D50F
    .byte $00 ; |        | $D510
    .byte $72 ; | XXX  X | $D511
    .byte $25 ; |  X  X X| $D512
    .byte $25 ; |  X  X X| $D513
    .byte $25 ; |  X  X X| $D514
    .byte $25 ; |  X  X X| $D515
    .byte $72 ; | XXX  X | $D516
    .byte $00 ; |        | $D517
    .byte $40 ; | X      | $D518
    .byte $00 ; |        | $D519
    .byte $00 ; |        | $D51A
    .byte $00 ; |        | $D51B
    .byte $00 ; |        | $D51C
    .byte $00 ; |        | $D51D
    .byte $00 ; |        | $D51E
    .byte $BA ; |X XXX X | $D51F
    .byte $12 ; |   X  X | $D520
    .byte $13 ; |   X  XX| $D521
    .byte $12 ; |   X  X | $D522
    .byte $12 ; |   X  X | $D523
    .byte $39 ; |  XXX  X| $D524
William_F_Sessions_FBI_Six:
    .byte $00 ; |        | $D525
    .byte $00 ; |        | $D526
    .byte $00 ; |        | $D527
    .byte $00 ; |        | $D528
    .byte $00 ; |        | $D529
    .byte $00 ; |        | $D52A
    .byte $00 ; |        | $D52B
    .byte $80 ; |X       | $D52C
    .byte $40 ; | X      | $D52D
    .byte $40 ; | X      | $D52E
    .byte $80 ; |X       | $D52F
    .byte $00 ; |        | $D530
    .byte $80 ; |X       | $D531
    .byte $00 ; |        | $D532
    .byte $00 ; |        | $D533
    .byte $00 ; |        | $D534
    .byte $00 ; |        | $D535
    .byte $00 ; |        | $D536
    .byte $00 ; |        | $D537
    .byte $00 ; |        | $D538
    .byte $00 ; |        | $D539
    .byte $00 ; |        | $D53A
    .byte $00 ; |        | $D53B
    .byte $00 ; |        | $D53C
    .byte $00 ; |        | $D53D
    .byte $00 ; |        | $D53E
    .byte $00 ; |        | $D53F

LD540:
    ldy    ram_90                ; 3
    lda    (ram_88),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    ram_91                ; 3
    lda    (ram_86),Y            ; 5
    tax                          ; 2
    lda    (ram_80),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_82),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_84),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_97),Y            ; 5
    ldy    ram_91                ; 3
    stx    GRP1                  ; 3
    sty    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_90                ; 5
    bpl    LD540                 ; 2³
    rts                          ; 6

LD568:
    lda    #$00                  ; 2
    sta    ram_95                ; 3
    sta    ram_96                ; 3
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    ram_9B                ; 3
    sta    ram_9C                ; 3
    ldx    #$06                  ; 2
    stx    sc_7D                 ; 4
    ldx    #$01                  ; 2
    stx    CTRLPF                ; 3
    ldx    #$00                  ; 2
    stx    ram_99                ; 3
    jsr    LDF3E                 ; 6   bankswitch, goto LB88B
LD586:
    lda    #$03                  ; 2
    sta    VSYNC                 ; 3
    sta    RSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$00                  ; 2
    stx    VSYNC                 ; 3
    sta    VBLANK                ; 3
    lda    #$2C                  ; 2
    sta    TIM64T                ; 4
    inc    ram_95                ; 5
    bne    LD5A3                 ; 2³
    inc    ram_99                ; 5
LD5A3:
    lda    ram_95                ; 3
    cmp    #$19                  ; 2
    bne    LD5B0                 ; 2³
    lda    ram_99                ; 3
    bne    LD5B0                 ; 2³
    jsr    LD9E5                 ; 6
LD5B0:
    ldx    ram_95                ; 3
    cpx    #$1A                  ; 2
    bcs    LD5BA                 ; 2³
    ldx    ram_99                ; 3
    beq    LD5C2                 ; 2³
LD5BA:
    jsr    LD9F5                 ; 6
    bcc    LD5C2                 ; 2³
    jmp    START_6|BANK_MASK     ; 3   bankswitch, goto L3242

LD5C2:
    lda    ram_95                ; 3
    and    #$07                  ; 2
    bne    LD5D4                 ; 2³
    inc    ram_9C                ; 5
    lda    ram_9C                ; 3
    cmp    #$06                  ; 2
    bcc    LD5D4                 ; 2³
    lda    #$00                  ; 2
    sta    ram_9C                ; 3
LD5D4:
    lda    ram_95                ; 3
    cmp    #$40                  ; 2
    bne    LD5DE                 ; 2³
    lda    #$00                  ; 2
    sta    ram_95                ; 3
LD5DE:
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    bne    LD5E8                 ; 2³
    jmp    START_6|BANK_MASK     ; 3   bankswitch, goto L3242

LD5E8:
    ldx    #$06                  ; 2
    stx    sc_7D                 ; 4
    jsr    LDF44                 ; 6   bankswitch, goto LB90C
    lda    ram_95                ; 3
    and    #$01                  ; 2
    bne    LD602                 ; 2³+1
    inc    ram_9B                ; 5
    lda    ram_9B                ; 3
    cmp    #$0B                  ; 2
    bcc    LD602                 ; 2³+1
    lda    #$00                  ; 2
    sta    ram_9B                ; 3
LD602:
    ldy    INTIM                 ; 4
    bne    LD602                 ; 2³
    lda    #$00                  ; 2
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    lda    #$92                  ; 2
    sta    COLUPF                ; 3
    ldx    ram_9C                ; 3
    lda    GameOverSequenceTab,X ; 4
    asl                          ; 2
    tax                          ; 2
    lda    GameOverOne,X         ; 4
    sta    ram_80                ; 3
    lda    GameOverOne+1,X       ; 4
    sta    ram_81                ; 3
    lda    GameOverTwo,X         ; 4
    sta    ram_82                ; 3
    lda    GameOverTwo+1,X       ; 4
    sta    ram_83                ; 3
    lda    GameOverThree,X       ; 4
    sta    ram_84                ; 3
    lda    GameOverThree+1,X     ; 4
    sta    ram_85                ; 3
    lda    GameOverFour,X        ; 4
    sta    ram_86                ; 3
    lda    GameOverFour+1,X      ; 4
    sta    ram_87                ; 3
    lda    GameOverFive,X        ; 4
    sta    ram_88                ; 3
    lda    GameOverFive+1,X      ; 4
    sta    ram_89                ; 3
    lda    GameOverSix,X         ; 4
    sta    ram_97                ; 3
    lda    GameOverSix+1,X       ; 4
    sta    ram_98                ; 3
    lda    #$58                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    ldx    ram_9B                ; 3
    lda    LD713,X               ; 4
    sta    ram_9D                ; 3
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    ldx    #$3C                  ; 2
LD671:
    sta    WSYNC                 ; 3
;---------------------------------------
    cpx    ram_9D                ; 3
    bne    LD67E                 ; 2³
    lda    #$FF                  ; 2
    sta    PF2                   ; 3
    jmp    LD682                 ; 3

LD67E:
    lda    #$00                  ; 2
    sta    PF2                   ; 3
LD682:
    dex                          ; 2
    bne    LD671                 ; 2³
    jsr    LD6DC                 ; 6
    ldx    #$10                  ; 2
    stx    ram_90                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    LD540                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$00                  ; 2
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    PF2                   ; 3
LD69B:
    sta    WSYNC                 ; 3
;---------------------------------------
    cpx    ram_9D                ; 3
    bne    LD6A8                 ; 2³
    lda    #$FF                  ; 2
    sta    PF2                   ; 3
    jmp    LD6AC                 ; 3

LD6A8:
    lda    #$00                  ; 2
    sta    PF2                   ; 3
LD6AC:
    inx                          ; 2
    cpx    #$3E                  ; 2
    bne    LD69B                 ; 2³
    lda    #$06                  ; 2
    sta    sc_7D                 ; 4
    jsr    LDEFC                 ; 6   bankswitch, goto L537C
    jsr    LD96A                 ; 6
    ldx    #$0E                  ; 2
LD6BE:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LD6BE                 ; 2³
    lda    #$26                  ; 2
    sta    TIM64T                ; 4
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
LD6D4:
    ldy    INTIM                 ; 4
    bne    LD6D4                 ; 2³
    jmp    LD586                 ; 3

LD6DC:
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ENAM0                 ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    #$03                  ; 2
    sta    VDELP1                ; 3
    sta    VDELP0                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    HMCLR                 ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

;------------------------------------------------;
;                                                ;
;                                                ;
;                XXXXXXXXXXX                     ;
;                XXXXXXXXXXX                     ;
;                XXXXXXXXXXX                     ;
;                XXXXXXXXXXX                     ;
;                                                ;
;                                                ;
;                                                ;
;                                                ;
;         XXXX   XX  XX  XXXXXX  XXXXX           ;
;        XX  XX  XX  XX  XX      XX  XX          ;
;        XX  XX  XX  XX  XX      XX  XX          ;
;        XX  XX  XX  XX  XXXXX   XXXXX           ;
;        XX  XX  XX  XX  XX      XX XX           ;
;        XX  XX   XXXX   XX      XX  XX          ;
;         XXXX     XX    XXXXXX  XX  XX          ;
;------------------------------------------------;
;                                                ;
;               XX  X  X X XXX                   ;
;              X   X X XXX X                     ;
;              X   XXX X X XX                    ;
;              X X X X X X X                     ;
;               XX X X X X XXX                   ;
;                                                ;
;                                                ;
;                                                ;
;                                                ;
;             XX   X X  XXX  XX                  ;
;            X  X  X X  X    X X                 ;
;            X  X  X X  X    X X                 ;
;            X  X  X X  XX   XX                  ;
;            X  X  X X  X    X X                 ;
;            X  X   X   X    X X                 ;
;             XX    X   XXX  X X                 ;
;------------------------------------------------;
;             XXX  XX  X   X XXX                 ;
;            X    X  X XX XX X                   ;
;            X    X  X X X X X                   ;
;            X    XXXX X   X XX                  ;
;            X XX X  X X   X X                   ;
;            X  X X  X X   X X                   ;
;             XXX X  X X   X XXX                 ;
;                                                ;
;                                                ;
;                                                ;
;                                                ;
;               X  X X XXX XX                    ;
;              X X X X X   X X                   ;
;              X X X X XX  XX                    ;
;              X X X X X   X X                   ;
;               X   X  XXX X X                   ;
;                                                ;
;------------------------------------------------;
;         XXXXX    XX   XX   XX  XXXXXX          ;
;        XX       XXXX  XXX XXX  XX              ;
;        XX      XX  XX XXXXXXX  XX              ;
;        XX XXX  XX  XX XX X XX  XXXXX           ;
;        XX  XX  XXXXXX XX   XX  XX              ;
;        XX  XX  XX  XX XX   XX  XX              ;
;         XXXXX  XX  XX XX   XX  XXXXXX          ;
;                                                ;
;                                                ;
;                                                ;
;                                                ;
;                                                ;
;                XXXXXXXXXXX                     ;
;                XXXXXXXXXXX                     ;
;                XXXXXXXXXXX                     ;
;                XXXXXXXXXXX                     ;
;                                                ;
;------------------------------------------------;

GameOverSequenceTab:
    .byte 0,1,2,3,2,1
LD713:
    .byte $3C ; |  XXXX  | $D713
    .byte $32 ; |  XX  X | $D714
    .byte $29 ; |  X X  X| $D715
    .byte $21 ; |  X    X| $D716
    .byte $1A ; |   XX X | $D717
    .byte $16 ; |   X XX | $D718
    .byte $13 ; |   X  XX| $D719
    .byte $11 ; |   X   X| $D71A
    .byte $0F ; |    XXXX| $D71B
    .byte $0D ; |    XX X| $D71C
    .byte $0C ; |    XX  | $D71D
LD71E:
    .byte $78 ; | XXXX   | $D71E
    .byte $CC ; |XX  XX  | $D71F
    .byte $CC ; |XX  XX  | $D720
    .byte $CC ; |XX  XX  | $D721
    .byte $CC ; |XX  XX  | $D722
    .byte $CC ; |XX  XX  | $D723
    .byte $78 ; | XXXX   | $D724
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
LD72F:
    .byte $30 ; |  XX    | $D72F
    .byte $78 ; | XXXX   | $D730
    .byte $CC ; |XX  XX  | $D731
    .byte $CC ; |XX  XX  | $D732
    .byte $CC ; |XX  XX  | $D733
    .byte $CC ; |XX  XX  | $D734
    .byte $CC ; |XX  XX  | $D735
    .byte $00 ; |        | $D736
    .byte $00 ; |        | $D737
    .byte $00 ; |        | $D738
    .byte $00 ; |        | $D739
    .byte $FF ; |XXXXXXXX| $D73A
    .byte $FF ; |XXXXXXXX| $D73B
    .byte $FF ; |XXXXXXXX| $D73C
    .byte $FF ; |XXXXXXXX| $D73D
    .byte $00 ; |        | $D73E
    .byte $00 ; |        | $D73F
LD740:
    .byte $FC ; |XXXXXX  | $D740
    .byte $C0 ; |XX      | $D741
    .byte $C0 ; |XX      | $D742
    .byte $F8 ; |XXXXX   | $D743
    .byte $C0 ; |XX      | $D744
    .byte $C0 ; |XX      | $D745
    .byte $FC ; |XXXXXX  | $D746
    .byte $00 ; |        | $D747
    .byte $00 ; |        | $D748
    .byte $00 ; |        | $D749
    .byte $00 ; |        | $D74A
    .byte $E0 ; |XXX     | $D74B
    .byte $E0 ; |XXX     | $D74C
    .byte $E0 ; |XXX     | $D74D
    .byte $E0 ; |XXX     | $D74E
    .byte $00 ; |        | $D74F
    .byte $00 ; |        | $D750
LD751:
    .byte $CC ; |XX  XX  | $D751
    .byte $CC ; |XX  XX  | $D752
    .byte $D8 ; |XX XX   | $D753
    .byte $F8 ; |XXXXX   | $D754
    .byte $CC ; |XX  XX  | $D755
    .byte $CC ; |XX  XX  | $D756
    .byte $F8 ; |XXXXX   | $D757
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
LD762:
    .byte $06 ; |     XX | $D762
    .byte $09 ; |    X  X| $D763
    .byte $09 ; |    X  X| $D764
    .byte $09 ; |    X  X| $D765
    .byte $09 ; |    X  X| $D766
    .byte $09 ; |    X  X| $D767
    .byte $06 ; |     XX | $D768
    .byte $00 ; |        | $D769
    .byte $00 ; |        | $D76A
    .byte $00 ; |        | $D76B
    .byte $00 ; |        | $D76C
    .byte $01 ; |       X| $D76D
    .byte $02 ; |      X | $D76E
    .byte $02 ; |      X | $D76F
    .byte $02 ; |      X | $D770
    .byte $01 ; |       X| $D771
    .byte $00 ; |        | $D772
LD773:
    .byte $11 ; |   X   X| $D773
    .byte $11 ; |   X   X| $D774
    .byte $29 ; |  X X  X| $D775
    .byte $29 ; |  X X  X| $D776
    .byte $29 ; |  X X  X| $D777
    .byte $29 ; |  X X  X| $D778
    .byte $29 ; |  X X  X| $D779
    .byte $00 ; |        | $D77A
    .byte $00 ; |        | $D77B
    .byte $00 ; |        | $D77C
    .byte $00 ; |        | $D77D
    .byte $AA ; |X X X X | $D77E
    .byte $AA ; |X X X X | $D77F
    .byte $3A ; |  XXX X | $D780
    .byte $2B ; |  X X XX| $D781
    .byte $92 ; |X  X  X | $D782
    .byte $00 ; |        | $D783
LD784:
    .byte $CA ; |XX  X X | $D784
    .byte $0A ; |    X X | $D785
    .byte $0A ; |    X X | $D786
    .byte $8C ; |X   XX  | $D787
    .byte $0A ; |    X X | $D788
    .byte $0A ; |    X X | $D789
    .byte $CC ; |XX  XX  | $D78A
    .byte $00 ; |        | $D78B
    .byte $00 ; |        | $D78C
    .byte $00 ; |        | $D78D
    .byte $00 ; |        | $D78E
    .byte $B8 ; |X XXX   | $D78F
    .byte $A0 ; |X X     | $D790
    .byte $B0 ; |X XX    | $D791
    .byte $A0 ; |X X     | $D792
    .byte $B8 ; |X XXX   | $D793
    .byte $00 ; |        | $D794
LD795:
    .byte $00 ; |        | $D795
    .byte $00 ; |        | $D796
    .byte $00 ; |        | $D797
    .byte $00 ; |        | $D798
    .byte $00 ; |        | $D799
    .byte $00 ; |        | $D79A
    .byte $00 ; |        | $D79B
    .byte $00 ; |        | $D79C
    .byte $00 ; |        | $D79D
    .byte $00 ; |        | $D79E
    .byte $00 ; |        | $D79F
    .byte $00 ; |        | $D7A0
    .byte $00 ; |        | $D7A1
    .byte $00 ; |        | $D7A2
    .byte $00 ; |        | $D7A3
    .byte $00 ; |        | $D7A4
    .byte $00 ; |        | $D7A5
    .byte $00 ; |        | $D7A6
    .byte $00 ; |        | $D7A7
LD7A8:
    .byte $00 ; |        | $D7A8
    .byte $01 ; |       X| $D7A9
    .byte $02 ; |      X | $D7AA
    .byte $02 ; |      X | $D7AB
    .byte $02 ; |      X | $D7AC
    .byte $01 ; |       X| $D7AD
    .byte $00 ; |        | $D7AE
    .byte $00 ; |        | $D7AF
    .byte $00 ; |        | $D7B0
    .byte $00 ; |        | $D7B1
    .byte $07 ; |     XXX| $D7B2
    .byte $09 ; |    X  X| $D7B3
    .byte $0B ; |    X XX| $D7B4
    .byte $08 ; |    X   | $D7B5
    .byte $08 ; |    X   | $D7B6
    .byte $08 ; |    X   | $D7B7
    .byte $07 ; |     XXX| $D7B8
LD7B9:
    .byte $00 ; |        | $D7B9
    .byte $13 ; |   X  XX| $D7BA
    .byte $AA ; |X X X X | $D7BB
    .byte $AB ; |X X X XX| $D7BC
    .byte $AA ; |X X X X | $D7BD
    .byte $2B ; |  X X XX| $D7BE
    .byte $00 ; |        | $D7BF
    .byte $00 ; |        | $D7C0
    .byte $00 ; |        | $D7C1
    .byte $00 ; |        | $D7C2
    .byte $4A ; | X  X X | $D7C3
    .byte $4A ; | X  X X | $D7C4
    .byte $4A ; | X  X X | $D7C5
    .byte $7A ; | XXXX X | $D7C6
    .byte $4A ; | X  X X | $D7C7
    .byte $4B ; | X  X XX| $D7C8
    .byte $32 ; |  XX  X | $D7C9
LD7CA:
    .byte $00 ; |        | $D7CA
    .byte $A8 ; |X X X   | $D7CB
    .byte $28 ; |  X X   | $D7CC
    .byte $30 ; |  XX    | $D7CD
    .byte $28 ; |  X X   | $D7CE
    .byte $B0 ; |X XX    | $D7CF
    .byte $00 ; |        | $D7D0
    .byte $00 ; |        | $D7D1
    .byte $00 ; |        | $D7D2
    .byte $00 ; |        | $D7D3
    .byte $2E ; |  X XXX | $D7D4
    .byte $28 ; |  X X   | $D7D5
    .byte $28 ; |  X X   | $D7D6
    .byte $2C ; |  X XX  | $D7D7
    .byte $A8 ; |X X X   | $D7D8
    .byte $68 ; | XX X   | $D7D9
    .byte $2E ; |  X XXX | $D7DA
GameOverOne:
    .word LD795          ; $D7DB
    .word LD795          ; $D7DD
    .word LD795          ; $D7DF
    .word LD795          ; $D7E1
GameOverTwo:
    .word LD71E          ; $D7E3
    .word LD762          ; $D7E5
    .word LD7A8          ; $D7E7
    .word LD80B          ; $D7E9
GameOverThree:
    .word LD72F          ; $D7EB
    .word LD773          ; $D7ED
    .word LD7B9          ; $D7EF
    .word LD81C          ; $D7F1
GameOverFour:
    .word LD740          ; $D7F3
    .word LD784          ; $D7F5
    .word LD7CA          ; $D7F7
    .word LD82D          ; $D7F9
GameOverFive:
    .word LD751          ; $D7FB
    .word LD795          ; $D7FD
    .word LD795          ; $D7FF
    .word LD83E          ; $D801
GameOverSix:
    .word LD795          ; $D803
    .word LD795          ; $D805
    .word LD795          ; $D807
    .word LD795          ; $D809

LD80B:
    .byte $00 ; |        | $D80B
    .byte $00 ; |        | $D80C
    .byte $00 ; |        | $D80D
    .byte $00 ; |        | $D80E
    .byte $00 ; |        | $D80F
    .byte $00 ; |        | $D810
    .byte $00 ; |        | $D811
    .byte $00 ; |        | $D812
    .byte $00 ; |        | $D813
    .byte $00 ; |        | $D814
    .byte $7C ; | XXXXX  | $D815
    .byte $CC ; |XX  XX  | $D816
    .byte $CC ; |XX  XX  | $D817
    .byte $DC ; |XX XXX  | $D818
    .byte $C0 ; |XX      | $D819
    .byte $C0 ; |XX      | $D81A
    .byte $7C ; | XXXXX  | $D81B
LD81C:
    .byte $00 ; |        | $D81C
    .byte $FF ; |XXXXXXXX| $D81D
    .byte $FF ; |XXXXXXXX| $D81E
    .byte $FF ; |XXXXXXXX| $D81F
    .byte $FF ; |XXXXXXXX| $D820
    .byte $00 ; |        | $D821
    .byte $00 ; |        | $D822
    .byte $00 ; |        | $D823
    .byte $00 ; |        | $D824
    .byte $00 ; |        | $D825
    .byte $CD ; |XX  XX X| $D826
    .byte $CD ; |XX  XX X| $D827
    .byte $FD ; |XXXXXX X| $D828
    .byte $CD ; |XX  XX X| $D829
    .byte $CD ; |XX  XX X| $D82A
    .byte $79 ; | XXXX  X| $D82B
    .byte $31 ; |  XX   X| $D82C
LD82D:
    .byte $00 ; |        | $D82D
    .byte $E0 ; |XXX     | $D82E
    .byte $E0 ; |XXX     | $D82F
    .byte $E0 ; |XXX     | $D830
    .byte $E0 ; |XXX     | $D831
    .byte $00 ; |        | $D832
    .byte $00 ; |        | $D833
    .byte $00 ; |        | $D834
    .byte $00 ; |        | $D835
    .byte $00 ; |        | $D836
    .byte $8C ; |X   XX  | $D837
    .byte $8C ; |X   XX  | $D838
    .byte $8C ; |X   XX  | $D839
    .byte $AC ; |X X XX  | $D83A
    .byte $FC ; |XXXXXX  | $D83B
    .byte $DC ; |XX XXX  | $D83C
    .byte $8C ; |X   XX  | $D83D
LD83E:
    .byte $00 ; |        | $D83E
    .byte $00 ; |        | $D83F
    .byte $00 ; |        | $D840
    .byte $00 ; |        | $D841
    .byte $00 ; |        | $D842
    .byte $00 ; |        | $D843
    .byte $00 ; |        | $D844
    .byte $00 ; |        | $D845
    .byte $00 ; |        | $D846
    .byte $00 ; |        | $D847
    .byte $FC ; |XXXXXX  | $D848
    .byte $C0 ; |XX      | $D849
    .byte $C0 ; |XX      | $D84A
    .byte $F8 ; |XXXXX   | $D84B
    .byte $C0 ; |XX      | $D84C
    .byte $C0 ; |XX      | $D84D
    .byte $FC ; |XXXXXX  | $D84E

LD84F:
    lda    #$00                  ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    ram_95                ; 3
    sta    ram_96                ; 3
    sta    ram_9B                ; 3
    lda    #$0D                  ; 2
    sta    sc_7E                 ; 4
    lda    #$06                  ; 2
    sta    sc_7D                 ; 4
    ldx    #$00                  ; 2
    jsr    LDF3E                 ; 6   bankswitch, goto LB88B
    ldx    #$01                  ; 2
    stx    CTRLPF                ; 3
    ldx    #$28                  ; 2
LD870:
    sta    ram_C2,X              ; 4
    dex                          ; 2
    bpl    LD870                 ; 2³
    sta    ram_E8                ; 3
    lda    #$07                  ; 2
    sta    ram_E9                ; 3
    lda    #$0F                  ; 2
    sta    ram_EA                ; 3
LD87F:
    lda    #$03                  ; 2
    sta    VSYNC                 ; 3
    sta    RSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$00                  ; 2
    stx    VSYNC                 ; 3
    sta    VBLANK                ; 3
    lda    #$2D                  ; 2
    sta    TIM64T                ; 4
    inc    ram_95                ; 5
    bne    LD89A                 ; 2³
    inc    ram_96                ; 5
LD89A:
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    bne    LD8A4                 ; 2³
    jmp    START_6|BANK_MASK     ; 3   bankswitch, goto L3242

LD8A4:
    ldx    #$06                  ; 2
    stx    sc_7D                 ; 4
    jsr    LDF44                 ; 6   bankswitch, goto LB90C
    lda    ram_95                ; 3
    and    #$01                  ; 2
    bne    LD8C8                 ; 2³
    inc    ram_9B                ; 5
    lda    ram_9B                ; 3
    cmp    #$0B                  ; 2
    bcc    LD8BE                 ; 2³
    lda    #$00                  ; 2
    sta    ram_9B                ; 3
LD8BE:
    lda    #$06                  ; 2
    sta    sc_7D                 ; 4
    ldy    #$01                  ; 2
    jsr    LDF50                 ; 6   bankswitch, goto LB112
LD8C8:
    ldy    INTIM                 ; 4
    bne    LD8C8                 ; 2³
    lda    #$00                  ; 2
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    lda    #$44                  ; 2
    sta    COLUPF                ; 3
    lda    #$0F                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    ldx    ram_9B                ; 3
    lda    LD713,X               ; 4
    sta    ram_9D                ; 3
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    ldx    #$3C                  ; 2
LD8F4:
    sta    WSYNC                 ; 3
;---------------------------------------
    cpx    ram_9D                ; 3
    bne    LD901                 ; 2³+1
    lda    #$FF                  ; 2
    sta    PF2                   ; 3
    jmp    LD905                 ; 3

LD901:
    lda    #$00                  ; 2
    sta    PF2                   ; 3
LD905:
    dex                          ; 2
    bne    LD8F4                 ; 2³+1
    jsr    LD6DC                 ; 6
    lda    #$06                  ; 2
    sta    sc_7D                 ; 4
    ldy    #$00                  ; 2
    jsr    LDF50                 ; 6   bankswitch, goto LB112
    ldx    #$00                  ; 2
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    PF2                   ; 3
LD91D:
    sta    WSYNC                 ; 3
;---------------------------------------
    cpx    ram_9D                ; 3
    bne    LD92A                 ; 2³
    lda    #$FF                  ; 2
    sta    PF2                   ; 3
    jmp    LD92E                 ; 3

LD92A:
    lda    #$00                  ; 2
    sta    PF2                   ; 3
LD92E:
    inx                          ; 2
    cpx    #$3E                  ; 2
    bne    LD91D                 ; 2³
    lda    #$06                  ; 2
    sta    sc_7D                 ; 4
    jsr    LDEFC                 ; 6   bankswitch, goto L537C
    ldx    #$2B                  ; 2
LD93D:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LD93D                 ; 2³
    lda    #$28                  ; 2
    sta    TIM64T                ; 4
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
LD953:
    ldy    INTIM                 ; 4
    bne    LD953                 ; 2³
    lda    ram_96                ; 3
    cmp    #$06                  ; 2
    bne    LD967                 ; 2³
    lda    ram_95                ; 3
    cmp    #$2E                  ; 2
    bne    LD967                 ; 2³
    jmp    LDF68                 ; 3

LD967:
    jmp    LD87F                 ; 3

LD96A:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$00                  ; 2
    lda    engineStatus|READ     ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LD9D1,Y               ; 4
    sta    sc_30,X               ; 5
    inx                          ; 2
    lda    tireStatus|READ       ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LD9D1,Y               ; 4
    sta    sc_30,X               ; 5
    sta    RESM1                 ; 3
    inx                          ; 2
    lda    armorStatus|READ      ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LD9D1,Y               ; 4
    sta    sc_30,X               ; 5
    lda    #$07                  ; 2
    sta    NUSIZ1                ; 3
    lda    #$00                  ; 2
    sta    COLUP1                ; 3
    lda    #$04                  ; 2
    sta    ram_90                ; 3
    ldx    #$0F                  ; 2
    ldy    #$00                  ; 2
LD9A9:
    sta    WSYNC                 ; 3
;---------------------------------------
    dec    ram_90                ; 5
    bpl    LD9C2                 ; 2³
    lda    #$04                  ; 2
    sta    ram_90                ; 3
    lda    #$00                  ; 2
    sta    GRP1                  ; 3
    iny                          ; 2
    lda    LD9E1,Y               ; 4
    sta    COLUP1                ; 3
    dex                          ; 2
    bne    LD9A9                 ; 2³
    beq    LD9CA                 ; 3   always branch

LD9C2:
    lda    sc_30|READ,Y          ; 4
    sta    GRP1                  ; 3
    dex                          ; 2
    bne    LD9A9                 ; 2³
LD9CA:
    lda    #$00                  ; 2
    sta    GRP1                  ; 3
    sta    NUSIZ1                ; 3
    rts                          ; 6

LD9D1:
    .byte $00 ; |        | $D9D1
    .byte $80 ; |X       | $D9D2
    .byte $C0 ; |XX      | $D9D3
    .byte $C0 ; |XX      | $D9D4
    .byte $E0 ; |XXX     | $D9D5
    .byte $E0 ; |XXX     | $D9D6
    .byte $F0 ; |XXXX    | $D9D7
    .byte $F0 ; |XXXX    | $D9D8
    .byte $F8 ; |XXXXX   | $D9D9
    .byte $F8 ; |XXXXX   | $D9DA
    .byte $FC ; |XXXXXX  | $D9DB
    .byte $FC ; |XXXXXX  | $D9DC
    .byte $FE ; |XXXXXXX | $D9DD
    .byte $FE ; |XXXXXXX | $D9DE
    .byte $FF ; |XXXXXXXX| $D9DF
    .byte $FF ; |XXXXXXXX| $D9E0
LD9E1:
    .byte $00 ; |        | $D9E1
    .byte $00 ; |        | $D9E2
    .byte $00 ; |        | $D9E3
    .byte $00 ; |        | $D9E4

LD9E5:
    lda    INPT4|$30             ; 3
    bmi    LD9EF                 ; 2³
    lda    #$01                  ; 2
    sta    sc_6E                 ; 4
    rts                          ; 6

LD9EF:
    lda    #$FF                  ; 2
    sta    sc_6E                 ; 4
    rts                          ; 6

LD9F5:
    lda    INPT4|$30             ; 3
    bmi    LD9FE                 ; 2³
    lda    #$01                  ; 2
    jmp    LDA00                 ; 3

LD9FE:
    lda    #$FF                  ; 2
LDA00:
    cmp    sc_6E|READ            ; 4
    beq    LDA07                 ; 2³
    sec                          ; 2
    rts                          ; 6

LDA07:
    clc                          ; 2
    rts                          ; 6

LDA09:
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    rts                          ; 6

  IF SHOW_BYTES_REMAINING
      ECHO ([$DEFC-*]d), "bytes free BANK_6"
  ENDIF

       ALIGN 768    ; $DB00 - $DDFF

    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; these three pages of filled bytes are free?
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


       ORG $6EFC
      RORG $DEFC

LDEFC:
    lda    BANK_2                ; 4   bankswitch, goto L537C
    jmp    M5106|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M5109|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9106|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M510C|BANK_MASK       ; 3

    lda    BANK_6                ; 4   different from lower banks, but same as bank 7
    jmp    MD109|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9109|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M510F|BANK_MASK       ; 3

    lda    BANK_3                ; 4
    jmp    M7106|BANK_MASK       ; 3

    lda    BANK_3                ; 4   different from the rest, never reached?
    jmp    L710C|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M5112|BANK_MASK       ; 3

    lda    BANK_1                ; 4
    jmp    M310F|BANK_MASK       ; 3

LDF3E:
    lda    BANK_5                ; 4   bankswitch, goto LB88B
    jmp    MB10C|BANK_MASK       ; 3

LDF44:
    lda    BANK_5                ; 4   bankswitch, goto LB90C
    jmp    MB10F|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9112|BANK_MASK       ; 3

LDF50:
    lda    BANK_5                ; 4   bankswitch, goto LB112
    jmp    MB106|BANK_MASK       ; 3

LDF56:
    lda    BANK_7                ; 4   bankswitch, goto LF777
    jmp    MF106|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M910F|BANK_MASK       ; 3

    lda    BANK_6                ; 4
    jmp    MD106|BANK_MASK       ; 3

LDF68:
    lda    BANK_7                ; 4
    rts                          ; 6

    lda    BANK_3                ; 4
    rts                          ; 6

    lda    BANK_4                ; 4
    rts                          ; 6

    lda    BANK_6                ; 4
    rts                          ; 6


; $DF78 - $DFF3 are free bytes


       ORG $6FF4
      RORG $DFF4

    .byte $00 ; |        | $DFF4
    .byte $00 ; |        | $DFF5
    .byte $00 ; |        | $DFF6
    .byte $00 ; |        | $DFF7
    .byte $00 ; |        | $DFF8
    .byte $00 ; |        | $DFF9
    .byte $00 ; |        | $DFFA
    .byte $00 ; |        | $DFFB

    .word START_6
    .word 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      BANK 7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $7000
      RORG $F000

    SC_RAM_SPACE

START_7:
    lda    BANK_0                ; 4
    jmp    START_7               ; 3

MF106:
    jmp    LF777                 ; 3

LF109:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LF459,X               ; 4
    sta    PF1                   ; 3
    lda    LF6F2,X               ; 4
    sta    COLUBK                ; 3
    lda    LF4DE,X               ; 4
    sta    PF2                   ; 3
    lda    LF3D8,Y               ; 4
    sta    GRP0                  ; 3
    lda    LF2CC,Y               ; 4
    sta    GRP1                  ; 3
    lda    LF563,X               ; 4
    sta    PF1                   ; 3
    lda    LF5E8,X               ; 4
    sta    PF2                   ; 3
    lda    LF66D,X               ; 4
    sta    COLUPF                ; 3
    dey                          ; 2
    bmi    LF13B                 ; 2³
    dex                          ; 2
    bpl    LF109                 ; 2³
LF13B:
    lda    #$60                  ; 2
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    dex                          ; 2
    lda    LF459,X               ; 4
    sta    PF1                   ; 3
    lda    LF6F2,X               ; 4
    sta    COLUBK                ; 3
    lda    LF4DE,X               ; 4
    sta    PF2                   ; 3
    lda    #$18                  ; 2
    sta    COLUP1                ; 3
    sta    HMCLR                 ; 3
    lda    LF563,X               ; 4
    sta    PF1                   ; 3
    lda    #$44                  ; 2
    sta    COLUP0                ; 3
    lda    LF5E8,X               ; 4
    sta    PF2                   ; 3
    lda    #$0F                  ; 2
    sta    GRP0                  ; 3
    lda    #$60                  ; 2
    sta    HMP1                  ; 3
    ldy    ram_86                ; 3
    dex                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LF459,X               ; 4
    sta    PF1                   ; 3
    lda    LF6F2,X               ; 4
    sta    COLUBK                ; 3
    lda    LF4DE,X               ; 4
    sta    PF2                   ; 3
    lda    #$05                  ; 2
    sta    NUSIZ1                ; 3
    sta    NUSIZ0                ; 3
    sta    HMCLR                 ; 3
    lda    LF563,X               ; 4
    sta    PF1                   ; 3
    lda.wy ram_97,Y              ; 4
    sta    GRP0                  ; 3
    lda    LF5E8,X               ; 4
    sta    PF2                   ; 3
    lda    LF66D,X               ; 4
    sta    COLUPF                ; 3
    dey                          ; 2
    dex                          ; 2
LF1A3:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LF459,X               ; 4
    sta    PF1                   ; 3
    lda    LF6F2,X               ; 4
    sta    COLUBK                ; 3
    lda    LF4DE,X               ; 4
    sta    PF2                   ; 3
    lda.wy ram_97,Y              ; 4
    sta    GRP0                  ; 3
    lda    sc_05|READ,Y          ; 4
    sta    GRP1                  ; 3
    lda    LF563,X               ; 4
    sta    PF1                   ; 3
    lda    LF5E8,X               ; 4
    sta    PF2                   ; 3
    lda    LF66D,X               ; 4
    sta    COLUPF                ; 3
    dey                          ; 2
    beq    LF1D7                 ; 2³
    dex                          ; 2
    bpl    LF1A3                 ; 2³
    bmi    LF209                 ; 3+1   always branch

LF1D7:
    dex                          ; 2
    bmi    LF209                 ; 2³+1
LF1DA:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LF459,X               ; 4
    sta    PF1                   ; 3
    lda    LF6F2,X               ; 4
    sta    COLUBK                ; 3
    lda    LF4DE,X               ; 4
    sta    PF2                   ; 3
    lda    LF3D8,Y               ; 4
    sta    CXCLR                 ; 3
    lda    LF3D8,Y               ; 4
    sta    CXCLR                 ; 3
    lda    LF563,X               ; 4
    sta    PF1                   ; 3
    lda    LF5E8,X               ; 4
    sta    PF2                   ; 3
    lda    LF66D,X               ; 4
    sta    COLUPF                ; 3
    dex                          ; 2
    bpl    LF1DA                 ; 2³+1
LF209:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$F6                  ; 2
    sta    COLUBK                ; 3
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    PF1                   ; 3
    lda    #$03                  ; 2
    sta    ENABL                 ; 3
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUPF                ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    #$03                  ; 2
    sta    HMCLR                 ; 3
    sta    VDELP1                ; 3
    sta    sc_7E                 ; 4
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    VDELP0                ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$84                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    #$00                  ; 2
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    GRP1                  ; 3
    lda    #>LFCC8               ; 2
    sta    ram_8B                ; 3
    lda    #<LFCC8               ; 2
    sta    ram_8A                ; 3
    lda    #>LFCFC               ; 2
    sta    ram_83                ; 3
    lda    #<LFCFC               ; 2
    sta    ram_82                ; 3
    lda    #>LFD30               ; 2
    sta    ram_85                ; 3
    lda    #<LFD30               ; 2
    sta    ram_84                ; 3
    lda    #>LFD64               ; 2
    sta    ram_8D                ; 3
    lda    #<LFD64               ; 2
    sta    ram_8C                ; 3
    lda    #>LFD98               ; 2
    sta    ram_89                ; 3
    lda    #<LFD98               ; 2
    sta    ram_88                ; 3
    lda    #>LFDCC               ; 2
    sta    ram_8F                ; 3
    lda    #<LFDCC               ; 2
    sta    ram_8E                ; 3
    sta    HMCLR                 ; 3
    stx    GRP1                  ; 3
    ldx    #$32                  ; 2
    stx    ram_90                ; 3
    jsr    LFE00                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$26                  ; 2
    sta    TIM64T                ; 4
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    COLUPF                ; 3
    sta    ENABL                 ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    ram_95                ; 3
    cmp    #$D0                  ; 2
    bne    LF2C4                 ; 2³
    lda    #$00                  ; 2
    sta    ram_95                ; 3
    dec    ram_94                ; 5
    bmi    LF2BD                 ; 2³
    lda    ram_94                ; 3
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    jmp    LF2C4                 ; 3

LF2BD:
    sta    AUDC0                 ; 3
    sta    AUDC1                 ; 3
    jmp    LFF2C                 ; 3   bankswitch, goto MD10C

LF2C4:
    ldy    INTIM                 ; 4
    bne    LF2C4                 ; 2³
    jmp    LF789                 ; 3

LF2CC:
    .byte $00 ; |        | $F2CC
    .byte $AA ; |X X X X | $F2CD
    .byte $AA ; |X X X X | $F2CE
    .byte $10 ; |   X    | $F2CF
    .byte $00 ; |        | $F2D0
    .byte $6C ; | XX XX  | $F2D1
    .byte $BA ; |X XXX X | $F2D2
    .byte $6C ; | XX XX  | $F2D3
    .byte $BA ; |X XXX X | $F2D4
    .byte $6C ; | XX XX  | $F2D5
    .byte $BA ; |X XXX X | $F2D6
    .byte $6C ; | XX XX  | $F2D7
    .byte $BA ; |X XXX X | $F2D8
    .byte $6C ; | XX XX  | $F2D9
    .byte $BA ; |X XXX X | $F2DA
    .byte $6C ; | XX XX  | $F2DB
    .byte $BA ; |X XXX X | $F2DC
    .byte $6C ; | XX XX  | $F2DD
    .byte $82 ; |X     X | $F2DE
    .byte $C6 ; |XX   XX | $F2DF
    .byte $82 ; |X     X | $F2E0
    .byte $C6 ; |XX   XX | $F2E1
    .byte $82 ; |X     X | $F2E2
    .byte $44 ; | X   X  | $F2E3
    .byte $6C ; | XX XX  | $F2E4
    .byte $38 ; |  XXX   | $F2E5
    .byte $44 ; | X   X  | $F2E6
    .byte $6C ; | XX XX  | $F2E7
    .byte $6C ; | XX XX  | $F2E8
    .byte $6C ; | XX XX  | $F2E9
    .byte $6C ; | XX XX  | $F2EA
    .byte $54 ; | X X X  | $F2EB
    .byte $6C ; | XX XX  | $F2EC
    .byte $44 ; | X   X  | $F2ED
    .byte $6C ; | XX XX  | $F2EE
    .byte $44 ; | X   X  | $F2EF
    .byte $6C ; | XX XX  | $F2F0
    .byte $44 ; | X   X  | $F2F1
    .byte $6C ; | XX XX  | $F2F2
    .byte $44 ; | X   X  | $F2F3
    .byte $10 ; |   X    | $F2F4
    .byte $38 ; |  XXX   | $F2F5
    .byte $38 ; |  XXX   | $F2F6
    .byte $28 ; |  X X   | $F2F7
    .byte $28 ; |  X X   | $F2F8
    .byte $28 ; |  X X   | $F2F9
    .byte $00 ; |        | $F2FA
    .byte $28 ; |  X X   | $F2FB
    .byte $00 ; |        | $F2FC
    .byte $00 ; |        | $F2FD
    .byte $00 ; |        | $F2FE
    .byte $00 ; |        | $F2FF
    .byte $00 ; |        | $F300
    .byte $00 ; |        | $F301
    .byte $00 ; |        | $F302
    .byte $00 ; |        | $F303
    .byte $00 ; |        | $F304
    .byte $00 ; |        | $F305
    .byte $00 ; |        | $F306
    .byte $00 ; |        | $F307
    .byte $00 ; |        | $F308
    .byte $00 ; |        | $F309
    .byte $00 ; |        | $F30A
    .byte $00 ; |        | $F30B
    .byte $00 ; |        | $F30C
    .byte $00 ; |        | $F30D
    .byte $00 ; |        | $F30E
    .byte $00 ; |        | $F30F
    .byte $00 ; |        | $F310
    .byte $00 ; |        | $F311
    .byte $00 ; |        | $F312
    .byte $00 ; |        | $F313
    .byte $00 ; |        | $F314
    .byte $00 ; |        | $F315
    .byte $00 ; |        | $F316
    .byte $00 ; |        | $F317
    .byte $00 ; |        | $F318
    .byte $00 ; |        | $F319
    .byte $00 ; |        | $F31A
    .byte $00 ; |        | $F31B
    .byte $00 ; |        | $F31C
    .byte $00 ; |        | $F31D
    .byte $00 ; |        | $F31E
    .byte $00 ; |        | $F31F
    .byte $00 ; |        | $F320
    .byte $00 ; |        | $F321
    .byte $00 ; |        | $F322
    .byte $00 ; |        | $F323
    .byte $00 ; |        | $F324
    .byte $00 ; |        | $F325
    .byte $00 ; |        | $F326
    .byte $00 ; |        | $F327
    .byte $00 ; |        | $F328
    .byte $00 ; |        | $F329
    .byte $00 ; |        | $F32A
    .byte $00 ; |        | $F32B
    .byte $00 ; |        | $F32C
    .byte $00 ; |        | $F32D
    .byte $00 ; |        | $F32E
    .byte $00 ; |        | $F32F
    .byte $00 ; |        | $F330
    .byte $00 ; |        | $F331
    .byte $00 ; |        | $F332
    .byte $00 ; |        | $F333
    .byte $00 ; |        | $F334
    .byte $00 ; |        | $F335
    .byte $00 ; |        | $F336
    .byte $00 ; |        | $F337
    .byte $00 ; |        | $F338
    .byte $00 ; |        | $F339
    .byte $00 ; |        | $F33A
    .byte $00 ; |        | $F33B
    .byte $00 ; |        | $F33C
    .byte $00 ; |        | $F33D
    .byte $00 ; |        | $F33E
    .byte $00 ; |        | $F33F
    .byte $00 ; |        | $F340
    .byte $00 ; |        | $F341
    .byte $00 ; |        | $F342
    .byte $00 ; |        | $F343
    .byte $00 ; |        | $F344
    .byte $00 ; |        | $F345
    .byte $00 ; |        | $F346
    .byte $00 ; |        | $F347
    .byte $00 ; |        | $F348
    .byte $00 ; |        | $F349
    .byte $00 ; |        | $F34A
    .byte $00 ; |        | $F34B
    .byte $00 ; |        | $F34C

LF34D:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    WASTE_4_CYCLES        ; 4
    ldy    WASTE_4_CYCLES        ; 4
    ldy    WASTE_4_CYCLES        ; 4
    ldy    WASTE_4_CYCLES        ; 4
    ldy    WASTE_4_CYCLES        ; 4
    ldy    WASTE_4_CYCLES        ; 4
    ldy    WASTE_4_CYCLES        ; 4
    ldy    WASTE_4_CYCLES        ; 4
    ldy    WASTE_4_CYCLES        ; 4
    ldy    WASTE_4_CYCLES        ; 4
    ldy    WASTE_4_CYCLES        ; 4
    ldy    WASTE_4_CYCLES        ; 4
    ldy    ram_F0                ; 3
    sta    RESP0,X               ; 4
    rts                          ; 6

LF378:
    .word LF904          ; $F378
    .word LF906          ; $F37A
    .word LF913          ; $F37C
    .word LF916          ; $F37E
    .word LF91B          ; $F380
    .word LF929          ; $F382
    .word LF939          ; $F384
    .word LF94B          ; $F386
    .word LF965          ; $F388
    .word LF987          ; $F38A
    .word LF9B5          ; $F38C
    .word LF9F1          ; $F38E
    .word LFA3D          ; $F390
    .word LFA9F          ; $F392
    .word LFB29          ; $F394
    .word LFBB3          ; $F396
    .word LFC3D          ; $F398
    .word LFBB3          ; $F39A
    .word LFBB3          ; $F39C
    .word LFBB3          ; $F39E
    .word LFBB3          ; $F3A0
    .word LFBB3          ; $F3A2
    .word LFBB3          ; $F3A4
    .word LFBB3          ; $F3A6

LF3A8:
    .word LF908          ; $F3A8
    .word LF908          ; $F3AA
    .word LF908          ; $F3AC
    .word LF908          ; $F3AE
    .word LF922          ; $F3B0
    .word LF931          ; $F3B2
    .word LF942          ; $F3B4
    .word LF958          ; $F3B6
    .word LF976          ; $F3B8
    .word LF99E          ; $F3BA
    .word LF9D3          ; $F3BC
    .word LFA17          ; $F3BE
    .word LFA6E          ; $F3C0
    .word LFAE4          ; $F3C2
    .word LFB6E          ; $F3C4
    .word LFBF8          ; $F3C6
    .word LFC82          ; $F3C8
    .word LFBF8          ; $F3CA
    .word LFBF8          ; $F3CC
    .word LFBF8          ; $F3CE
    .word LFBF8          ; $F3D0
    .word LFBF8          ; $F3D2
    .word LFBF8          ; $F3D4
    .word LFBF8          ; $F3D6

LF3D8:
    .byte $00 ; |        | $F3D8
    .byte $54 ; | X X X  | $F3D9
    .byte $54 ; | X X X  | $F3DA
    .byte $6C ; | XX XX  | $F3DB
    .byte $FE ; |XXXXXXX | $F3DC
    .byte $92 ; |X  X  X | $F3DD
    .byte $44 ; | X   X  | $F3DE
    .byte $92 ; |X  X  X | $F3DF
    .byte $44 ; | X   X  | $F3E0
    .byte $92 ; |X  X  X | $F3E1
    .byte $44 ; | X   X  | $F3E2
    .byte $92 ; |X  X  X | $F3E3
    .byte $44 ; | X   X  | $F3E4
    .byte $92 ; |X  X  X | $F3E5
    .byte $44 ; | X   X  | $F3E6
    .byte $92 ; |X  X  X | $F3E7
    .byte $44 ; | X   X  | $F3E8
    .byte $92 ; |X  X  X | $F3E9
    .byte $7C ; | XXXXX  | $F3EA
    .byte $38 ; |  XXX   | $F3EB
    .byte $7C ; | XXXXX  | $F3EC
    .byte $38 ; |  XXX   | $F3ED
    .byte $7C ; | XXXXX  | $F3EE
    .byte $38 ; |  XXX   | $F3EF
    .byte $10 ; |   X    | $F3F0
    .byte $44 ; | X   X  | $F3F1
    .byte $38 ; |  XXX   | $F3F2
    .byte $10 ; |   X    | $F3F3
    .byte $10 ; |   X    | $F3F4
    .byte $10 ; |   X    | $F3F5
    .byte $10 ; |   X    | $F3F6
    .byte $28 ; |  X X   | $F3F7
    .byte $10 ; |   X    | $F3F8
    .byte $38 ; |  XXX   | $F3F9
    .byte $10 ; |   X    | $F3FA
    .byte $38 ; |  XXX   | $F3FB
    .byte $10 ; |   X    | $F3FC
    .byte $38 ; |  XXX   | $F3FD
    .byte $10 ; |   X    | $F3FE
    .byte $38 ; |  XXX   | $F3FF
    .byte $28 ; |  X X   | $F400
    .byte $00 ; |        | $F401
    .byte $00 ; |        | $F402
    .byte $10 ; |   X    | $F403
    .byte $10 ; |   X    | $F404
    .byte $10 ; |   X    | $F405
    .byte $38 ; |  XXX   | $F406
    .byte $10 ; |   X    | $F407
    .byte $10 ; |   X    | $F408
    .byte $10 ; |   X    | $F409
    .byte $10 ; |   X    | $F40A
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
LF459:
    .byte $00 ; |        | $F459
    .byte $00 ; |        | $F45A
    .byte $00 ; |        | $F45B
    .byte $00 ; |        | $F45C
    .byte $00 ; |        | $F45D
    .byte $00 ; |        | $F45E
    .byte $FF ; |XXXXXXXX| $F45F
    .byte $FF ; |XXXXXXXX| $F460
    .byte $6F ; | XX XXXX| $F461
    .byte $4F ; | X  XXXX| $F462
    .byte $07 ; |     XXX| $F463
    .byte $03 ; |      XX| $F464
    .byte $01 ; |       X| $F465
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
    .byte $07 ; |     XXX| $F497
    .byte $40 ; | X      | $F498
    .byte $3F ; |  XXXXXX| $F499
    .byte $C0 ; |XX      | $F49A
    .byte $3F ; |  XXXXXX| $F49B
    .byte $C0 ; |XX      | $F49C
    .byte $3F ; |  XXXXXX| $F49D
    .byte $C0 ; |XX      | $F49E
    .byte $BF ; |X XXXXXX| $F49F
    .byte $C0 ; |XX      | $F4A0
    .byte $FF ; |XXXXXXXX| $F4A1
    .byte $D0 ; |XX X    | $F4A2
    .byte $FF ; |XXXXXXXX| $F4A3
    .byte $F4 ; |XXXX X  | $F4A4
    .byte $3F ; |  XXXXXX| $F4A5
    .byte $FC ; |XXXXXX  | $F4A6
    .byte $3F ; |  XXXXXX| $F4A7
    .byte $DD ; |XX XXX X| $F4A8
    .byte $FF ; |XXXXXXXX| $F4A9
    .byte $FF ; |XXXXXXXX| $F4AA
    .byte $DF ; |XX XXXXX| $F4AB
    .byte $5F ; | X XXXXX| $F4AC
    .byte $5F ; | X XXXXX| $F4AD
    .byte $0E ; |    XXX | $F4AE
    .byte $1F ; |   XXXXX| $F4AF
    .byte $0E ; |    XXX | $F4B0
    .byte $0F ; |    XXXX| $F4B1
    .byte $0F ; |    XXXX| $F4B2
    .byte $0F ; |    XXXX| $F4B3
    .byte $07 ; |     XXX| $F4B4
    .byte $07 ; |     XXX| $F4B5
    .byte $03 ; |      XX| $F4B6
    .byte $03 ; |      XX| $F4B7
    .byte $03 ; |      XX| $F4B8
    .byte $03 ; |      XX| $F4B9
    .byte $03 ; |      XX| $F4BA
    .byte $01 ; |       X| $F4BB
    .byte $01 ; |       X| $F4BC
    .byte $00 ; |        | $F4BD
    .byte $00 ; |        | $F4BE
    .byte $00 ; |        | $F4BF
    .byte $00 ; |        | $F4C0
    .byte $00 ; |        | $F4C1
    .byte $00 ; |        | $F4C2
    .byte $00 ; |        | $F4C3
    .byte $00 ; |        | $F4C4
    .byte $00 ; |        | $F4C5
    .byte $20 ; |  X     | $F4C6
    .byte $18 ; |   XX   | $F4C7
    .byte $20 ; |  X     | $F4C8
    .byte $30 ; |  XX    | $F4C9
    .byte $60 ; | XX     | $F4CA
    .byte $78 ; | XXXX   | $F4CB
    .byte $30 ; |  XX    | $F4CC
    .byte $3F ; |  XXXXXX| $F4CD
    .byte $3C ; |  XXXX  | $F4CE
    .byte $3F ; |  XXXXXX| $F4CF
    .byte $1F ; |   XXXXX| $F4D0
    .byte $1F ; |   XXXXX| $F4D1
    .byte $13 ; |   X  XX| $F4D2
    .byte $01 ; |       X| $F4D3
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
LF4DE:
    .byte $00 ; |        | $F4DE
    .byte $00 ; |        | $F4DF
    .byte $00 ; |        | $F4E0
    .byte $00 ; |        | $F4E1
    .byte $00 ; |        | $F4E2
    .byte $00 ; |        | $F4E3
    .byte $FF ; |XXXXXXXX| $F4E4
    .byte $6F ; | XX XXXX| $F4E5
    .byte $27 ; |  X  XXX| $F4E6
    .byte $03 ; |      XX| $F4E7
    .byte $01 ; |       X| $F4E8
    .byte $01 ; |       X| $F4E9
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
    .byte $1E ; |   XXXX | $F51A
    .byte $00 ; |        | $F51B
    .byte $1F ; |   XXXXX| $F51C
    .byte $18 ; |   XX   | $F51D
    .byte $1F ; |   XXXXX| $F51E
    .byte $1E ; |   XXXX | $F51F
    .byte $0F ; |    XXXX| $F520
    .byte $0E ; |    XXX | $F521
    .byte $07 ; |     XXX| $F522
    .byte $04 ; |     X  | $F523
    .byte $07 ; |     XXX| $F524
    .byte $00 ; |        | $F525
    .byte $03 ; |      XX| $F526
    .byte $00 ; |        | $F527
    .byte $03 ; |      XX| $F528
    .byte $00 ; |        | $F529
    .byte $07 ; |     XXX| $F52A
    .byte $00 ; |        | $F52B
    .byte $0F ; |    XXXX| $F52C
    .byte $03 ; |      XX| $F52D
    .byte $1F ; |   XXXXX| $F52E
    .byte $03 ; |      XX| $F52F
    .byte $1F ; |   XXXXX| $F530
    .byte $1F ; |   XXXXX| $F531
    .byte $1F ; |   XXXXX| $F532
    .byte $3E ; |  XXXXX | $F533
    .byte $1F ; |   XXXXX| $F534
    .byte $1A ; |   XX X | $F535
    .byte $03 ; |      XX| $F536
    .byte $01 ; |       X| $F537
    .byte $03 ; |      XX| $F538
    .byte $01 ; |       X| $F539
    .byte $01 ; |       X| $F53A
    .byte $01 ; |       X| $F53B
    .byte $01 ; |       X| $F53C
    .byte $01 ; |       X| $F53D
    .byte $01 ; |       X| $F53E
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
    .byte $04 ; |     X  | $F550
    .byte $07 ; |     XXX| $F551
    .byte $00 ; |        | $F552
    .byte $0F ; |    XXXX| $F553
    .byte $10 ; |   X    | $F554
    .byte $1F ; |   XXXXX| $F555
    .byte $1B ; |   XX XX| $F556
    .byte $0F ; |    XXXX| $F557
    .byte $0B ; |    X XX| $F558
    .byte $07 ; |     XXX| $F559
    .byte $02 ; |      X | $F55A
    .byte $06 ; |     XX | $F55B
    .byte $02 ; |      X | $F55C
    .byte $06 ; |     XX | $F55D
    .byte $06 ; |     XX | $F55E
    .byte $02 ; |      X | $F55F
    .byte $06 ; |     XX | $F560
    .byte $00 ; |        | $F561
    .byte $00 ; |        | $F562
LF563:
    .byte $00 ; |        | $F563
    .byte $FF ; |XXXXXXXX| $F564
    .byte $FF ; |XXXXXXXX| $F565
    .byte $7C ; | XXXXX  | $F566
    .byte $7C ; | XXXXX  | $F567
    .byte $7C ; | XXXXX  | $F568
    .byte $0C ; |    XX  | $F569
    .byte $04 ; |     X  | $F56A
    .byte $04 ; |     X  | $F56B
    .byte $04 ; |     X  | $F56C
    .byte $04 ; |     X  | $F56D
    .byte $04 ; |     X  | $F56E
    .byte $04 ; |     X  | $F56F
    .byte $04 ; |     X  | $F570
    .byte $04 ; |     X  | $F571
    .byte $04 ; |     X  | $F572
    .byte $0C ; |    XX  | $F573
    .byte $04 ; |     X  | $F574
    .byte $0C ; |    XX  | $F575
    .byte $04 ; |     X  | $F576
    .byte $04 ; |     X  | $F577
    .byte $0C ; |    XX  | $F578
    .byte $04 ; |     X  | $F579
    .byte $0C ; |    XX  | $F57A
    .byte $04 ; |     X  | $F57B
    .byte $0C ; |    XX  | $F57C
    .byte $04 ; |     X  | $F57D
    .byte $04 ; |     X  | $F57E
    .byte $0C ; |    XX  | $F57F
    .byte $04 ; |     X  | $F580
    .byte $0C ; |    XX  | $F581
    .byte $04 ; |     X  | $F582
    .byte $0C ; |    XX  | $F583
    .byte $04 ; |     X  | $F584
    .byte $04 ; |     X  | $F585
    .byte $04 ; |     X  | $F586
    .byte $0C ; |    XX  | $F587
    .byte $04 ; |     X  | $F588
    .byte $04 ; |     X  | $F589
    .byte $0C ; |    XX  | $F58A
    .byte $0C ; |    XX  | $F58B
    .byte $04 ; |     X  | $F58C
    .byte $04 ; |     X  | $F58D
    .byte $04 ; |     X  | $F58E
    .byte $0C ; |    XX  | $F58F
    .byte $0C ; |    XX  | $F590
    .byte $04 ; |     X  | $F591
    .byte $0C ; |    XX  | $F592
    .byte $04 ; |     X  | $F593
    .byte $0C ; |    XX  | $F594
    .byte $04 ; |     X  | $F595
    .byte $0C ; |    XX  | $F596
    .byte $04 ; |     X  | $F597
    .byte $0C ; |    XX  | $F598
    .byte $00 ; |        | $F599
    .byte $08 ; |    X   | $F59A
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
    .byte $01 ; |       X| $F5AB
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
    .byte $51 ; | X X   X| $F5C3
    .byte $AA ; |X X X X | $F5C4
    .byte $F5 ; |XXXX X X| $F5C5
    .byte $EA ; |XXX X X | $F5C6
    .byte $EF ; |XXX XXXX| $F5C7
    .byte $FF ; |XXXXXXXX| $F5C8
    .byte $3F ; |  XXXXXX| $F5C9
    .byte $0F ; |    XXXX| $F5CA
    .byte $01 ; |       X| $F5CB
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
LF5E8:
    .byte $00 ; |        | $F5E8
    .byte $03 ; |      XX| $F5E9
    .byte $01 ; |       X| $F5EA
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
    .byte $03 ; |      XX| $F630
    .byte $05 ; |     X X| $F631
    .byte $02 ; |      X | $F632
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
    .byte $08 ; |    X   | $F646
    .byte $14 ; |   X X  | $F647
    .byte $0B ; |    X XX| $F648
    .byte $34 ; |  XX X  | $F649
    .byte $6B ; | XX X XX| $F64A
    .byte $D4 ; |XX X X  | $F64B
    .byte $2F ; |  X XXXX| $F64C
    .byte $D7 ; |XX X XXX| $F64D
    .byte $BF ; |X XXXXXX| $F64E
    .byte $57 ; | X X XXX| $F64F
    .byte $FF ; |XXXXXXXX| $F650
    .byte $5F ; | X XXXXX| $F651
    .byte $FE ; |XXXXXXX | $F652
    .byte $7F ; | XXXXXXX| $F653
    .byte $26 ; |  X  XX | $F654
    .byte $1C ; |   XXX  | $F655
    .byte $04 ; |     X  | $F656
    .byte $0C ; |    XX  | $F657
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
LF66D:
    .byte $44 ; | X   X  | $F66D
    .byte $44 ; | X   X  | $F66E
    .byte $02 ; |      X | $F66F
    .byte $04 ; |     X  | $F670
    .byte $06 ; |     XX | $F671
    .byte $06 ; |     XX | $F672
    .byte $06 ; |     XX | $F673
    .byte $F4 ; |XXXX X  | $F674
    .byte $F4 ; |XXXX X  | $F675
    .byte $F4 ; |XXXX X  | $F676
    .byte $F4 ; |XXXX X  | $F677
    .byte $F4 ; |XXXX X  | $F678
    .byte $F4 ; |XXXX X  | $F679
    .byte $F4 ; |XXXX X  | $F67A
    .byte $F4 ; |XXXX X  | $F67B
    .byte $F4 ; |XXXX X  | $F67C
    .byte $F4 ; |XXXX X  | $F67D
    .byte $F4 ; |XXXX X  | $F67E
    .byte $F4 ; |XXXX X  | $F67F
    .byte $F4 ; |XXXX X  | $F680
    .byte $F4 ; |XXXX X  | $F681
    .byte $F4 ; |XXXX X  | $F682
    .byte $F4 ; |XXXX X  | $F683
    .byte $F4 ; |XXXX X  | $F684
    .byte $F4 ; |XXXX X  | $F685
    .byte $F4 ; |XXXX X  | $F686
    .byte $F4 ; |XXXX X  | $F687
    .byte $F4 ; |XXXX X  | $F688
    .byte $F4 ; |XXXX X  | $F689
    .byte $F4 ; |XXXX X  | $F68A
    .byte $F4 ; |XXXX X  | $F68B
    .byte $F4 ; |XXXX X  | $F68C
    .byte $F4 ; |XXXX X  | $F68D
    .byte $F4 ; |XXXX X  | $F68E
    .byte $F4 ; |XXXX X  | $F68F
    .byte $F4 ; |XXXX X  | $F690
    .byte $F4 ; |XXXX X  | $F691
    .byte $F4 ; |XXXX X  | $F692
    .byte $F4 ; |XXXX X  | $F693
    .byte $F4 ; |XXXX X  | $F694
    .byte $F4 ; |XXXX X  | $F695
    .byte $F4 ; |XXXX X  | $F696
    .byte $F4 ; |XXXX X  | $F697
    .byte $F4 ; |XXXX X  | $F698
    .byte $F4 ; |XXXX X  | $F699
    .byte $F4 ; |XXXX X  | $F69A
    .byte $F4 ; |XXXX X  | $F69B
    .byte $F4 ; |XXXX X  | $F69C
    .byte $F4 ; |XXXX X  | $F69D
    .byte $F4 ; |XXXX X  | $F69E
    .byte $F4 ; |XXXX X  | $F69F
    .byte $F4 ; |XXXX X  | $F6A0
    .byte $F4 ; |XXXX X  | $F6A1
    .byte $F4 ; |XXXX X  | $F6A2
    .byte $F4 ; |XXXX X  | $F6A3
    .byte $F4 ; |XXXX X  | $F6A4
    .byte $F4 ; |XXXX X  | $F6A5
    .byte $F4 ; |XXXX X  | $F6A6
    .byte $F4 ; |XXXX X  | $F6A7
    .byte $F4 ; |XXXX X  | $F6A8
    .byte $F4 ; |XXXX X  | $F6A9
    .byte $0F ; |    XXXX| $F6AA
    .byte $0F ; |    XXXX| $F6AB
    .byte $0F ; |    XXXX| $F6AC
    .byte $0F ; |    XXXX| $F6AD
    .byte $0F ; |    XXXX| $F6AE
    .byte $0F ; |    XXXX| $F6AF
    .byte $0F ; |    XXXX| $F6B0
    .byte $0F ; |    XXXX| $F6B1
    .byte $0F ; |    XXXX| $F6B2
    .byte $0F ; |    XXXX| $F6B3
    .byte $0F ; |    XXXX| $F6B4
    .byte $0F ; |    XXXX| $F6B5
    .byte $0F ; |    XXXX| $F6B6
    .byte $0F ; |    XXXX| $F6B7
    .byte $0F ; |    XXXX| $F6B8
    .byte $0F ; |    XXXX| $F6B9
    .byte $0F ; |    XXXX| $F6BA
    .byte $0F ; |    XXXX| $F6BB
    .byte $0F ; |    XXXX| $F6BC
    .byte $0F ; |    XXXX| $F6BD
    .byte $0F ; |    XXXX| $F6BE
    .byte $0F ; |    XXXX| $F6BF
    .byte $0F ; |    XXXX| $F6C0
    .byte $0F ; |    XXXX| $F6C1
    .byte $0F ; |    XXXX| $F6C2
    .byte $0F ; |    XXXX| $F6C3
    .byte $0F ; |    XXXX| $F6C4
    .byte $0F ; |    XXXX| $F6C5
    .byte $0F ; |    XXXX| $F6C6
    .byte $0F ; |    XXXX| $F6C7
    .byte $0F ; |    XXXX| $F6C8
    .byte $0F ; |    XXXX| $F6C9
    .byte $0F ; |    XXXX| $F6CA
    .byte $0F ; |    XXXX| $F6CB
    .byte $0F ; |    XXXX| $F6CC
    .byte $0F ; |    XXXX| $F6CD
    .byte $0F ; |    XXXX| $F6CE
    .byte $0F ; |    XXXX| $F6CF
    .byte $0F ; |    XXXX| $F6D0
    .byte $0F ; |    XXXX| $F6D1
    .byte $0F ; |    XXXX| $F6D2
    .byte $0F ; |    XXXX| $F6D3
    .byte $0F ; |    XXXX| $F6D4
    .byte $0F ; |    XXXX| $F6D5
    .byte $0F ; |    XXXX| $F6D6
    .byte $0F ; |    XXXX| $F6D7
    .byte $0F ; |    XXXX| $F6D8
    .byte $0F ; |    XXXX| $F6D9
    .byte $0F ; |    XXXX| $F6DA
    .byte $0F ; |    XXXX| $F6DB
    .byte $0F ; |    XXXX| $F6DC
    .byte $0F ; |    XXXX| $F6DD
    .byte $0F ; |    XXXX| $F6DE
    .byte $0F ; |    XXXX| $F6DF
    .byte $0F ; |    XXXX| $F6E0
    .byte $0F ; |    XXXX| $F6E1
    .byte $0F ; |    XXXX| $F6E2
    .byte $0F ; |    XXXX| $F6E3
    .byte $0F ; |    XXXX| $F6E4
    .byte $0F ; |    XXXX| $F6E5
    .byte $0F ; |    XXXX| $F6E6
    .byte $0F ; |    XXXX| $F6E7
    .byte $0F ; |    XXXX| $F6E8
    .byte $0F ; |    XXXX| $F6E9
    .byte $0F ; |    XXXX| $F6EA
    .byte $0F ; |    XXXX| $F6EB
    .byte $0F ; |    XXXX| $F6EC
    .byte $0F ; |    XXXX| $F6ED
    .byte $0F ; |    XXXX| $F6EE
    .byte $0F ; |    XXXX| $F6EF
    .byte $0F ; |    XXXX| $F6F0
    .byte $0F ; |    XXXX| $F6F1
LF6F2:
    .byte $F6 ; |XXXX XX | $F6F2
    .byte $F6 ; |XXXX XX | $F6F3
    .byte $F6 ; |XXXX XX | $F6F4
    .byte $F6 ; |XXXX XX | $F6F5
    .byte $F6 ; |XXXX XX | $F6F6
    .byte $F6 ; |XXXX XX | $F6F7
    .byte $F6 ; |XXXX XX | $F6F8
    .byte $F8 ; |XXXXX   | $F6F9
    .byte $1A ; |   XX X | $F6FA
    .byte $18 ; |   XX   | $F6FB
    .byte $18 ; |   XX   | $F6FC
    .byte $28 ; |  X X   | $F6FD
    .byte $36 ; |  XX XX | $F6FE
    .byte $46 ; | X   XX | $F6FF
    .byte $56 ; | X X XX | $F700
    .byte $66 ; | XX  XX | $F701
    .byte $86 ; |X    XX | $F702
    .byte $76 ; | XXX XX | $F703
    .byte $84 ; |X    X  | $F704
    .byte $86 ; |X    XX | $F705
    .byte $84 ; |X    X  | $F706
    .byte $84 ; |X    X  | $F707
    .byte $84 ; |X    X  | $F708
    .byte $84 ; |X    X  | $F709
    .byte $84 ; |X    X  | $F70A
    .byte $84 ; |X    X  | $F70B
    .byte $84 ; |X    X  | $F70C
    .byte $84 ; |X    X  | $F70D
    .byte $84 ; |X    X  | $F70E
    .byte $84 ; |X    X  | $F70F
    .byte $84 ; |X    X  | $F710
    .byte $84 ; |X    X  | $F711
    .byte $84 ; |X    X  | $F712
    .byte $84 ; |X    X  | $F713
    .byte $84 ; |X    X  | $F714
    .byte $84 ; |X    X  | $F715
    .byte $84 ; |X    X  | $F716
    .byte $84 ; |X    X  | $F717
    .byte $84 ; |X    X  | $F718
    .byte $84 ; |X    X  | $F719
    .byte $84 ; |X    X  | $F71A
    .byte $84 ; |X    X  | $F71B
    .byte $84 ; |X    X  | $F71C
    .byte $84 ; |X    X  | $F71D
    .byte $84 ; |X    X  | $F71E
    .byte $84 ; |X    X  | $F71F
    .byte $84 ; |X    X  | $F720
    .byte $84 ; |X    X  | $F721
    .byte $84 ; |X    X  | $F722
    .byte $84 ; |X    X  | $F723
    .byte $84 ; |X    X  | $F724
    .byte $84 ; |X    X  | $F725
    .byte $84 ; |X    X  | $F726
    .byte $84 ; |X    X  | $F727
    .byte $84 ; |X    X  | $F728
    .byte $84 ; |X    X  | $F729
    .byte $84 ; |X    X  | $F72A
    .byte $84 ; |X    X  | $F72B
    .byte $84 ; |X    X  | $F72C
    .byte $84 ; |X    X  | $F72D
    .byte $84 ; |X    X  | $F72E
    .byte $84 ; |X    X  | $F72F
    .byte $84 ; |X    X  | $F730
    .byte $84 ; |X    X  | $F731
    .byte $84 ; |X    X  | $F732
    .byte $84 ; |X    X  | $F733
    .byte $84 ; |X    X  | $F734
    .byte $84 ; |X    X  | $F735
    .byte $84 ; |X    X  | $F736
    .byte $84 ; |X    X  | $F737
    .byte $84 ; |X    X  | $F738
    .byte $84 ; |X    X  | $F739
    .byte $84 ; |X    X  | $F73A
    .byte $84 ; |X    X  | $F73B
    .byte $84 ; |X    X  | $F73C
    .byte $84 ; |X    X  | $F73D
    .byte $84 ; |X    X  | $F73E
    .byte $84 ; |X    X  | $F73F
    .byte $84 ; |X    X  | $F740
    .byte $84 ; |X    X  | $F741
    .byte $84 ; |X    X  | $F742
    .byte $84 ; |X    X  | $F743
    .byte $84 ; |X    X  | $F744
    .byte $84 ; |X    X  | $F745
    .byte $84 ; |X    X  | $F746
    .byte $84 ; |X    X  | $F747
    .byte $84 ; |X    X  | $F748
    .byte $84 ; |X    X  | $F749
    .byte $84 ; |X    X  | $F74A
    .byte $84 ; |X    X  | $F74B
    .byte $84 ; |X    X  | $F74C
    .byte $84 ; |X    X  | $F74D
    .byte $84 ; |X    X  | $F74E
    .byte $84 ; |X    X  | $F74F
    .byte $84 ; |X    X  | $F750
    .byte $84 ; |X    X  | $F751
    .byte $84 ; |X    X  | $F752
    .byte $84 ; |X    X  | $F753
    .byte $84 ; |X    X  | $F754
    .byte $84 ; |X    X  | $F755
    .byte $84 ; |X    X  | $F756
    .byte $84 ; |X    X  | $F757
    .byte $84 ; |X    X  | $F758
    .byte $84 ; |X    X  | $F759
    .byte $84 ; |X    X  | $F75A
    .byte $84 ; |X    X  | $F75B
    .byte $84 ; |X    X  | $F75C
    .byte $84 ; |X    X  | $F75D
    .byte $84 ; |X    X  | $F75E
    .byte $84 ; |X    X  | $F75F
    .byte $84 ; |X    X  | $F760
    .byte $84 ; |X    X  | $F761
    .byte $84 ; |X    X  | $F762
    .byte $84 ; |X    X  | $F763
    .byte $84 ; |X    X  | $F764
    .byte $84 ; |X    X  | $F765
    .byte $84 ; |X    X  | $F766
    .byte $84 ; |X    X  | $F767
    .byte $84 ; |X    X  | $F768
    .byte $84 ; |X    X  | $F769
    .byte $84 ; |X    X  | $F76A
    .byte $84 ; |X    X  | $F76B
    .byte $84 ; |X    X  | $F76C
    .byte $84 ; |X    X  | $F76D
    .byte $84 ; |X    X  | $F76E
    .byte $84 ; |X    X  | $F76F
    .byte $84 ; |X    X  | $F770
    .byte $84 ; |X    X  | $F771
    .byte $84 ; |X    X  | $F772
    .byte $84 ; |X    X  | $F773
    .byte $84 ; |X    X  | $F774
    .byte $84 ; |X    X  | $F775
    .byte $84 ; |X    X  | $F776

LF777:
    jsr    LFF14                 ; 6   bankswitch, goto LD84F
    lda    #$02                  ; 2
    sta    AUDC0                 ; 3
    sta    AUDC1                 ; 3
    lda    #$05                  ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    jsr    LFE28                 ; 6
LF789:
    lda    #$03                  ; 2
    sta    VSYNC                 ; 3
    sta    RSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    VSYNC                 ; 3
    lda    #$03                  ; 2
    sta    VBLANK                ; 3
    lda    #$31                  ; 2
    sta    TIM64T                ; 4
    inc    ram_95                ; 5
    ldy    #$46                  ; 2
    lda    #$00                  ; 2
LF7A6:
    sta.wy ram_97,Y              ; 5
    sta    sc_05,Y               ; 5
    dey                          ; 2
    bpl    LF7A6                 ; 2³
    lda    ram_95                ; 3
    and    #$03                  ; 2
    beq    LF7CF                 ; 2³
    cmp    #$02                  ; 2
    bcc    LF7CF                 ; 2³
    lda    #$10                  ; 2
    sta    ram_80                ; 3
    ldy    ram_91                ; 3
    bmi    LF7C3                 ; 2³
    bne    LF7C9                 ; 2³
LF7C3:
    jsr    LFE58                 ; 6
    jmp    LF7E6                 ; 3

LF7C9:
    ldx    ram_86                ; 3
    txa                          ; 2
    jmp    LF7E6                 ; 3

LF7CF:
    ldx    ram_91                ; 3
    lda    LF887,X               ; 4
    sta    ram_80                ; 3
    ldy    ram_91                ; 3
    bmi    LF7DC                 ; 2³
    bne    LF7E2                 ; 2³
LF7DC:
    jsr    LFE58                 ; 6
    jmp    LF7E6                 ; 3

LF7E2:
    tax                          ; 2
    lda    LF875,X               ; 4
LF7E6:
    sta    ram_87                ; 3
    lda    ram_80                ; 3
    asl                          ; 2
    tax                          ; 2
    lda    LF378,X               ; 4
    sta    ram_82                ; 3
    lda    LF378+1,X             ; 4
    sta    ram_83                ; 3
    lda    LF3A8,X               ; 4
    sta    ram_84                ; 3
    lda    LF3A8+1,X             ; 4
    sta    ram_85                ; 3
    ldx    ram_87                ; 3
    beq    LF817                 ; 2³
    txa                          ; 2
    inx                          ; 2
    inx                          ; 2
    sta    ram_86                ; 3
    tay                          ; 2
LF80A:
    lda    (ram_82),Y            ; 5
    sta    ram_97,X              ; 4
    lda    (ram_84),Y            ; 5
    sta    sc_05,X               ; 5
    dex                          ; 2
    dey                          ; 2
    bpl    LF80A                 ; 2³
LF817:
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    bne    LF821                 ; 2³
    jmp    START_7               ; 3

LF821:
    lda    ram_95                ; 3
    and    #$03                  ; 2
    bne    LF831                 ; 2³
    dec    ram_91                ; 5
    lda    ram_91                ; 3
    bpl    LF831                 ; 2³
    lda    #$00                  ; 2
    sta    ram_91                ; 3
LF831:
    ldy    INTIM                 ; 4
    bne    LF831                 ; 2³
    lda    #$00                  ; 2
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    RESBL                 ; 3
    lda    #$20                  ; 2
    sta    HMBL                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$30                  ; 2
    sta    CTRLPF                ; 3
    sta    HMCLR                 ; 3
    ldx    #$00                  ; 2
    jsr    LF34D                 ; 6
    ldx    #$01                  ; 2
    jsr    LF34D                 ; 6
    ldy    ram_91                ; 3
    ldx    #$7E                  ; 2
    lda    #$A6                  ; 2
    sta    COLUP1                ; 3
    lda    #$08                  ; 2
    sta    COLUP0                ; 3
    lda    #$0F                  ; 2
    sta    COLUPF                ; 3
    jmp    LF109                 ; 3

LF875:
    .byte $01 ; |       X| $F875
    .byte $01 ; |       X| $F876
    .byte $02 ; |      X | $F877
    .byte $04 ; |     X  | $F878
    .byte $06 ; |     XX | $F879
    .byte $07 ; |     XXX| $F87A
    .byte $08 ; |    X   | $F87B
    .byte $0C ; |    XX  | $F87C
    .byte $10 ; |   X    | $F87D
    .byte $16 ; |   X XX | $F87E
    .byte $1D ; |   XXX X| $F87F
    .byte $25 ; |  X  X X| $F880
    .byte $30 ; |  XX    | $F881
    .byte $44 ; | X   X  | $F882
    .byte $44 ; | X   X  | $F883
    .byte $44 ; | X   X  | $F884
    .byte $44 ; | X   X  | $F885
    .byte $44 ; | X   X  | $F886
LF887:
    .byte $11 ; |   X   X| $F887
    .byte $11 ; |   X   X| $F888
    .byte $11 ; |   X   X| $F889
    .byte $11 ; |   X   X| $F88A
    .byte $11 ; |   X   X| $F88B
    .byte $11 ; |   X   X| $F88C
    .byte $0E ; |    XXX | $F88D
    .byte $0F ; |    XXXX| $F88E
    .byte $0E ; |    XXX | $F88F
    .byte $0F ; |    XXXX| $F890
    .byte $0E ; |    XXX | $F891
    .byte $0F ; |    XXXX| $F892
    .byte $0E ; |    XXX | $F893
    .byte $0F ; |    XXXX| $F894
    .byte $0E ; |    XXX | $F895
    .byte $0F ; |    XXXX| $F896
    .byte $0E ; |    XXX | $F897
    .byte $0F ; |    XXXX| $F898
    .byte $0E ; |    XXX | $F899
    .byte $0F ; |    XXXX| $F89A
    .byte $0E ; |    XXX | $F89B
    .byte $0F ; |    XXXX| $F89C
    .byte $0E ; |    XXX | $F89D
    .byte $0E ; |    XXX | $F89E
    .byte $0E ; |    XXX | $F89F
    .byte $0F ; |    XXXX| $F8A0
    .byte $0E ; |    XXX | $F8A1
    .byte $0E ; |    XXX | $F8A2
    .byte $0E ; |    XXX | $F8A3
    .byte $0E ; |    XXX | $F8A4
    .byte $0E ; |    XXX | $F8A5
    .byte $0F ; |    XXXX| $F8A6
    .byte $0E ; |    XXX | $F8A7
    .byte $0E ; |    XXX | $F8A8
    .byte $0E ; |    XXX | $F8A9
    .byte $0E ; |    XXX | $F8AA
    .byte $0E ; |    XXX | $F8AB
    .byte $0E ; |    XXX | $F8AC
    .byte $0E ; |    XXX | $F8AD
    .byte $0E ; |    XXX | $F8AE
    .byte $0E ; |    XXX | $F8AF
    .byte $0F ; |    XXXX| $F8B0
    .byte $0E ; |    XXX | $F8B1
    .byte $0E ; |    XXX | $F8B2
    .byte $0E ; |    XXX | $F8B3
    .byte $0E ; |    XXX | $F8B4
    .byte $0F ; |    XXXX| $F8B5
    .byte $0E ; |    XXX | $F8B6
    .byte $0E ; |    XXX | $F8B7
    .byte $0E ; |    XXX | $F8B8
    .byte $0E ; |    XXX | $F8B9
    .byte $0F ; |    XXXX| $F8BA
    .byte $0E ; |    XXX | $F8BB
    .byte $0D ; |    XX X| $F8BC
    .byte $0D ; |    XX X| $F8BD
    .byte $0D ; |    XX X| $F8BE
    .byte $0D ; |    XX X| $F8BF
    .byte $0D ; |    XX X| $F8C0
    .byte $0D ; |    XX X| $F8C1
    .byte $0D ; |    XX X| $F8C2
    .byte $0D ; |    XX X| $F8C3
    .byte $0D ; |    XX X| $F8C4
    .byte $0D ; |    XX X| $F8C5
    .byte $0D ; |    XX X| $F8C6
    .byte $0D ; |    XX X| $F8C7
    .byte $0D ; |    XX X| $F8C8
    .byte $0D ; |    XX X| $F8C9
    .byte $0D ; |    XX X| $F8CA
    .byte $0D ; |    XX X| $F8CB
    .byte $0D ; |    XX X| $F8CC
    .byte $0D ; |    XX X| $F8CD
    .byte $0D ; |    XX X| $F8CE
    .byte $0C ; |    XX  | $F8CF
    .byte $0C ; |    XX  | $F8D0
    .byte $0C ; |    XX  | $F8D1
    .byte $0C ; |    XX  | $F8D2
    .byte $0C ; |    XX  | $F8D3
    .byte $0C ; |    XX  | $F8D4
    .byte $0C ; |    XX  | $F8D5
    .byte $0C ; |    XX  | $F8D6
    .byte $0C ; |    XX  | $F8D7
    .byte $0C ; |    XX  | $F8D8
    .byte $0C ; |    XX  | $F8D9
    .byte $0C ; |    XX  | $F8DA
    .byte $0C ; |    XX  | $F8DB
    .byte $0B ; |    X XX| $F8DC
    .byte $0B ; |    X XX| $F8DD
    .byte $0B ; |    X XX| $F8DE
    .byte $0B ; |    X XX| $F8DF
    .byte $0B ; |    X XX| $F8E0
    .byte $0B ; |    X XX| $F8E1
    .byte $0A ; |    X X | $F8E2
    .byte $0A ; |    X X | $F8E3
    .byte $0A ; |    X X | $F8E4
    .byte $0A ; |    X X | $F8E5
    .byte $0A ; |    X X | $F8E6
    .byte $0A ; |    X X | $F8E7
    .byte $0A ; |    X X | $F8E8
    .byte $0A ; |    X X | $F8E9
    .byte $09 ; |    X  X| $F8EA
    .byte $09 ; |    X  X| $F8EB
    .byte $09 ; |    X  X| $F8EC
    .byte $09 ; |    X  X| $F8ED
    .byte $09 ; |    X  X| $F8EE
    .byte $09 ; |    X  X| $F8EF
    .byte $09 ; |    X  X| $F8F0
    .byte $09 ; |    X  X| $F8F1
    .byte $08 ; |    X   | $F8F2
    .byte $08 ; |    X   | $F8F3
    .byte $08 ; |    X   | $F8F4
    .byte $07 ; |     XXX| $F8F5
    .byte $07 ; |     XXX| $F8F6
    .byte $07 ; |     XXX| $F8F7
    .byte $06 ; |     XX | $F8F8
    .byte $06 ; |     XX | $F8F9
    .byte $05 ; |     X X| $F8FA
    .byte $05 ; |     X X| $F8FB
    .byte $04 ; |     X  | $F8FC
    .byte $04 ; |     X  | $F8FD
    .byte $03 ; |      XX| $F8FE
    .byte $03 ; |      XX| $F8FF
    .byte $02 ; |      X | $F900
    .byte $02 ; |      X | $F901
    .byte $01 ; |       X| $F902
    .byte $00 ; |        | $F903
LF904:
    .byte $00 ; |        | $F904
    .byte $38 ; |  XXX   | $F905
LF906:
    .byte $3C ; |  XXXX  | $F906
    .byte $24 ; |  X  X  | $F907
LF908:
    .byte $00 ; |        | $F908
    .byte $00 ; |        | $F909
    .byte $00 ; |        | $F90A
    .byte $00 ; |        | $F90B
    .byte $00 ; |        | $F90C
    .byte $00 ; |        | $F90D
    .byte $00 ; |        | $F90E
    .byte $00 ; |        | $F90F
    .byte $00 ; |        | $F910
    .byte $00 ; |        | $F911
    .byte $00 ; |        | $F912
LF913:
    .byte $7E ; | XXXXXX | $F913
    .byte $3E ; |  XXXXX | $F914
    .byte $24 ; |  X  X  | $F915
LF916:
    .byte $FE ; |XXXXXXX | $F916
    .byte $7E ; | XXXXXX | $F917
    .byte $66 ; | XX  XX | $F918
    .byte $24 ; |  X  X  | $F919
    .byte $24 ; |  X  X  | $F91A
LF91B:
    .byte $7E ; | XXXXXX | $F91B
    .byte $3E ; |  XXXXX | $F91C
    .byte $7C ; | XXXXX  | $F91D
    .byte $26 ; |  X  XX | $F91E
    .byte $40 ; | X      | $F91F
    .byte $02 ; |      X | $F920
    .byte $00 ; |        | $F921
LF922:
    .byte $81 ; |X      X| $F922
    .byte $C1 ; |XX     X| $F923
    .byte $03 ; |      XX| $F924
    .byte $40 ; | X      | $F925
    .byte $22 ; |  X   X | $F926
    .byte $60 ; | XX     | $F927
    .byte $02 ; |      X | $F928
LF929:
    .byte $7E ; | XXXXXX | $F929
    .byte $7F ; | XXXXXXX| $F92A
    .byte $3E ; |  XXXXX | $F92B
    .byte $7C ; | XXXXX  | $F92C
    .byte $02 ; |      X | $F92D
    .byte $40 ; | X      | $F92E
    .byte $00 ; |        | $F92F
    .byte $00 ; |        | $F930
LF931:
    .byte $81 ; |X      X| $F931
    .byte $80 ; |X       | $F932
    .byte $C1 ; |XX     X| $F933
    .byte $83 ; |X     XX| $F934
    .byte $64 ; | XX  X  | $F935
    .byte $22 ; |  X   X | $F936
    .byte $42 ; | X    X | $F937
    .byte $02 ; |      X | $F938
LF939:
    .byte $7F ; | XXXXXXX| $F939
    .byte $FE ; |XXXXXXX | $F93A
    .byte $7F ; | XXXXXXX| $F93B
    .byte $3E ; |  XXXXX | $F93C
    .byte $5A ; | X XX X | $F93D
    .byte $18 ; |   XX   | $F93E
    .byte $42 ; | X    X | $F93F
    .byte $00 ; |        | $F940
    .byte $18 ; |   XX   | $F941
LF942:
    .byte $80 ; |X       | $F942
    .byte $01 ; |       X| $F943
    .byte $80 ; |X       | $F944
    .byte $C1 ; |XX     X| $F945
    .byte $A4 ; |X X  X  | $F946
    .byte $62 ; | XX   X | $F947
    .byte $00 ; |        | $F948
    .byte $42 ; | X    X | $F949
    .byte $00 ; |        | $F94A
LF94B:
    .byte $FE ; |XXXXXXX | $F94B
    .byte $7D ; | XXXXX X| $F94C
    .byte $FE ; |XXXXXXX | $F94D
    .byte $7F ; | XXXXXXX| $F94E
    .byte $1A ; |   XX X | $F94F
    .byte $58 ; | X XX   | $F950
    .byte $1A ; |   XX X | $F951
    .byte $18 ; |   XX   | $F952
    .byte $18 ; |   XX   | $F953
    .byte $18 ; |   XX   | $F954
    .byte $18 ; |   XX   | $F955
    .byte $18 ; |   XX   | $F956
    .byte $18 ; |   XX   | $F957
LF958:
    .byte $01 ; |       X| $F958
    .byte $82 ; |X     X | $F959
    .byte $01 ; |       X| $F95A
    .byte $80 ; |X       | $F95B
    .byte $E5 ; |XXX  X X| $F95C
    .byte $23 ; |  X   XX| $F95D
    .byte $40 ; | X      | $F95E
    .byte $42 ; | X    X | $F95F
    .byte $00 ; |        | $F960
    .byte $00 ; |        | $F961
    .byte $00 ; |        | $F962
    .byte $00 ; |        | $F963
    .byte $00 ; |        | $F964
LF965:
    .byte $7E ; | XXXXXX | $F965
    .byte $FE ; |XXXXXXX | $F966
    .byte $7D ; | XXXXX X| $F967
    .byte $BE ; |X XXXXX | $F968
    .byte $5B ; | X XX XX| $F969
    .byte $18 ; |   XX   | $F96A
    .byte $5A ; | X XX X | $F96B
    .byte $18 ; |   XX   | $F96C
    .byte $18 ; |   XX   | $F96D
    .byte $18 ; |   XX   | $F96E
    .byte $18 ; |   XX   | $F96F
    .byte $18 ; |   XX   | $F970
    .byte $18 ; |   XX   | $F971
    .byte $18 ; |   XX   | $F972
    .byte $18 ; |   XX   | $F973
    .byte $18 ; |   XX   | $F974
    .byte $18 ; |   XX   | $F975
LF976:
    .byte $00 ; |        | $F976
    .byte $01 ; |       X| $F977
    .byte $82 ; |X     X | $F978
    .byte $41 ; | X     X| $F979
    .byte $A4 ; |X X  X  | $F97A
    .byte $E7 ; |XXX  XXX| $F97B
    .byte $05 ; |     X X| $F97C
    .byte $42 ; | X    X | $F97D
    .byte $00 ; |        | $F97E
    .byte $00 ; |        | $F97F
    .byte $00 ; |        | $F980
    .byte $00 ; |        | $F981
    .byte $00 ; |        | $F982
    .byte $00 ; |        | $F983
    .byte $00 ; |        | $F984
    .byte $00 ; |        | $F985
    .byte $00 ; |        | $F986
LF987:
    .byte $3C ; |  XXXX  | $F987
    .byte $7E ; | XXXXXX | $F988
    .byte $FE ; |XXXXXXX | $F989
    .byte $59 ; | X XX  X| $F98A
    .byte $9A ; |X  XX X | $F98B
    .byte $5B ; | X XX XX| $F98C
    .byte $18 ; |   XX   | $F98D
    .byte $5A ; | X XX X | $F98E
    .byte $18 ; |   XX   | $F98F
    .byte $18 ; |   XX   | $F990
    .byte $18 ; |   XX   | $F991
    .byte $18 ; |   XX   | $F992
    .byte $18 ; |   XX   | $F993
    .byte $18 ; |   XX   | $F994
    .byte $18 ; |   XX   | $F995
    .byte $18 ; |   XX   | $F996
    .byte $18 ; |   XX   | $F997
    .byte $18 ; |   XX   | $F998
    .byte $18 ; |   XX   | $F999
    .byte $18 ; |   XX   | $F99A
    .byte $18 ; |   XX   | $F99B
    .byte $18 ; |   XX   | $F99C
    .byte $18 ; |   XX   | $F99D
LF99E:
    .byte $42 ; | X    X | $F99E
    .byte $81 ; |X      X| $F99F
    .byte $01 ; |       X| $F9A0
    .byte $A6 ; |X X  XX | $F9A1
    .byte $65 ; | XX  X X| $F9A2
    .byte $A4 ; |X X  X  | $F9A3
    .byte $C7 ; |XX   XXX| $F9A4
    .byte $01 ; |       X| $F9A5
    .byte $42 ; | X    X | $F9A6
    .byte $81 ; |X      X| $F9A7
    .byte $00 ; |        | $F9A8
    .byte $00 ; |        | $F9A9
    .byte $00 ; |        | $F9AA
    .byte $00 ; |        | $F9AB
    .byte $00 ; |        | $F9AC
    .byte $00 ; |        | $F9AD
    .byte $00 ; |        | $F9AE
    .byte $00 ; |        | $F9AF
    .byte $00 ; |        | $F9B0
    .byte $00 ; |        | $F9B1
    .byte $00 ; |        | $F9B2
    .byte $00 ; |        | $F9B3
    .byte $00 ; |        | $F9B4
LF9B5:
    .byte $3C ; |  XXXX  | $F9B5
    .byte $3C ; |  XXXX  | $F9B6
    .byte $7E ; | XXXXXX | $F9B7
    .byte $DA ; |XX XX X | $F9B8
    .byte $59 ; | X XX  X| $F9B9
    .byte $18 ; |   XX   | $F9BA
    .byte $5B ; | X XX XX| $F9BB
    .byte $18 ; |   XX   | $F9BC
    .byte $18 ; |   XX   | $F9BD
    .byte $18 ; |   XX   | $F9BE
    .byte $18 ; |   XX   | $F9BF
    .byte $18 ; |   XX   | $F9C0
    .byte $18 ; |   XX   | $F9C1
    .byte $18 ; |   XX   | $F9C2
    .byte $18 ; |   XX   | $F9C3
    .byte $18 ; |   XX   | $F9C4
    .byte $18 ; |   XX   | $F9C5
    .byte $18 ; |   XX   | $F9C6
    .byte $18 ; |   XX   | $F9C7
    .byte $18 ; |   XX   | $F9C8
    .byte $18 ; |   XX   | $F9C9
    .byte $18 ; |   XX   | $F9CA
    .byte $18 ; |   XX   | $F9CB
    .byte $18 ; |   XX   | $F9CC
    .byte $18 ; |   XX   | $F9CD
    .byte $18 ; |   XX   | $F9CE
    .byte $18 ; |   XX   | $F9CF
    .byte $18 ; |   XX   | $F9D0
    .byte $18 ; |   XX   | $F9D1
    .byte $18 ; |   XX   | $F9D2
LF9D3:
    .byte $43 ; | X    XX| $F9D3
    .byte $C2 ; |XX    X | $F9D4
    .byte $81 ; |X      X| $F9D5
    .byte $25 ; |  X  X X| $F9D6
    .byte $A6 ; |X X  XX | $F9D7
    .byte $E7 ; |XXX  XXX| $F9D8
    .byte $04 ; |     X  | $F9D9
    .byte $C2 ; |XX    X | $F9DA
    .byte $41 ; | X     X| $F9DB
    .byte $02 ; |      X | $F9DC
    .byte $81 ; |X      X| $F9DD
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
LF9F1:
    .byte $18 ; |   XX   | $F9F1
    .byte $3C ; |  XXXX  | $F9F2
    .byte $3C ; |  XXXX  | $F9F3
    .byte $5A ; | X XX X | $F9F4
    .byte $BE ; |X XXXXX | $F9F5
    .byte $59 ; | X XX  X| $F9F6
    .byte $18 ; |   XX   | $F9F7
    .byte $59 ; | X XX  X| $F9F8
    .byte $18 ; |   XX   | $F9F9
    .byte $18 ; |   XX   | $F9FA
    .byte $18 ; |   XX   | $F9FB
    .byte $18 ; |   XX   | $F9FC
    .byte $18 ; |   XX   | $F9FD
    .byte $18 ; |   XX   | $F9FE
    .byte $18 ; |   XX   | $F9FF
    .byte $18 ; |   XX   | $FA00
    .byte $18 ; |   XX   | $FA01
    .byte $18 ; |   XX   | $FA02
    .byte $18 ; |   XX   | $FA03
    .byte $18 ; |   XX   | $FA04
    .byte $18 ; |   XX   | $FA05
    .byte $18 ; |   XX   | $FA06
    .byte $18 ; |   XX   | $FA07
    .byte $18 ; |   XX   | $FA08
    .byte $18 ; |   XX   | $FA09
    .byte $18 ; |   XX   | $FA0A
    .byte $18 ; |   XX   | $FA0B
    .byte $18 ; |   XX   | $FA0C
    .byte $18 ; |   XX   | $FA0D
    .byte $18 ; |   XX   | $FA0E
    .byte $18 ; |   XX   | $FA0F
    .byte $18 ; |   XX   | $FA10
    .byte $18 ; |   XX   | $FA11
    .byte $18 ; |   XX   | $FA12
    .byte $18 ; |   XX   | $FA13
    .byte $18 ; |   XX   | $FA14
    .byte $18 ; |   XX   | $FA15
    .byte $18 ; |   XX   | $FA16
LFA17:
    .byte $66 ; | XX  XX | $FA17
    .byte $C3 ; |XX    XX| $FA18
    .byte $42 ; | X    X | $FA19
    .byte $A5 ; |X X  X X| $FA1A
    .byte $40 ; | X      | $FA1B
    .byte $A6 ; |X X  XX | $FA1C
    .byte $C7 ; |XX   XXX| $FA1D
    .byte $00 ; |        | $FA1E
    .byte $02 ; |      X | $FA1F
    .byte $41 ; | X     X| $FA20
    .byte $00 ; |        | $FA21
    .byte $00 ; |        | $FA22
    .byte $00 ; |        | $FA23
    .byte $00 ; |        | $FA24
    .byte $00 ; |        | $FA25
    .byte $00 ; |        | $FA26
    .byte $00 ; |        | $FA27
    .byte $00 ; |        | $FA28
    .byte $00 ; |        | $FA29
    .byte $00 ; |        | $FA2A
    .byte $00 ; |        | $FA2B
    .byte $00 ; |        | $FA2C
    .byte $00 ; |        | $FA2D
    .byte $00 ; |        | $FA2E
    .byte $00 ; |        | $FA2F
    .byte $00 ; |        | $FA30
    .byte $00 ; |        | $FA31
    .byte $00 ; |        | $FA32
    .byte $00 ; |        | $FA33
    .byte $00 ; |        | $FA34
    .byte $00 ; |        | $FA35
    .byte $00 ; |        | $FA36
    .byte $00 ; |        | $FA37
    .byte $00 ; |        | $FA38
    .byte $00 ; |        | $FA39
    .byte $00 ; |        | $FA3A
    .byte $00 ; |        | $FA3B
    .byte $00 ; |        | $FA3C
LFA3D:
    .byte $10 ; |   X    | $FA3D
    .byte $38 ; |  XXX   | $FA3E
    .byte $1C ; |   XXX  | $FA3F
    .byte $18 ; |   XX   | $FA40
    .byte $38 ; |  XXX   | $FA41
    .byte $9E ; |X  XXXX | $FA42
    .byte $58 ; | X XX   | $FA43
    .byte $18 ; |   XX   | $FA44
    .byte $18 ; |   XX   | $FA45
    .byte $18 ; |   XX   | $FA46
    .byte $18 ; |   XX   | $FA47
    .byte $18 ; |   XX   | $FA48
    .byte $18 ; |   XX   | $FA49
    .byte $18 ; |   XX   | $FA4A
    .byte $18 ; |   XX   | $FA4B
    .byte $18 ; |   XX   | $FA4C
    .byte $18 ; |   XX   | $FA4D
    .byte $18 ; |   XX   | $FA4E
    .byte $18 ; |   XX   | $FA4F
    .byte $18 ; |   XX   | $FA50
    .byte $18 ; |   XX   | $FA51
    .byte $18 ; |   XX   | $FA52
    .byte $18 ; |   XX   | $FA53
    .byte $18 ; |   XX   | $FA54
    .byte $18 ; |   XX   | $FA55
    .byte $18 ; |   XX   | $FA56
    .byte $18 ; |   XX   | $FA57
    .byte $18 ; |   XX   | $FA58
    .byte $18 ; |   XX   | $FA59
    .byte $18 ; |   XX   | $FA5A
    .byte $18 ; |   XX   | $FA5B
    .byte $18 ; |   XX   | $FA5C
    .byte $18 ; |   XX   | $FA5D
    .byte $18 ; |   XX   | $FA5E
    .byte $18 ; |   XX   | $FA5F
    .byte $18 ; |   XX   | $FA60
    .byte $18 ; |   XX   | $FA61
    .byte $18 ; |   XX   | $FA62
    .byte $18 ; |   XX   | $FA63
    .byte $18 ; |   XX   | $FA64
    .byte $18 ; |   XX   | $FA65
    .byte $18 ; |   XX   | $FA66
    .byte $18 ; |   XX   | $FA67
    .byte $18 ; |   XX   | $FA68
    .byte $18 ; |   XX   | $FA69
    .byte $18 ; |   XX   | $FA6A
    .byte $18 ; |   XX   | $FA6B
    .byte $18 ; |   XX   | $FA6C
    .byte $18 ; |   XX   | $FA6D
LFA6E:
    .byte $AD ; |X X XX X| $FA6E
    .byte $46 ; | X   XX | $FA6F
    .byte $A3 ; |X X   XX| $FA70
    .byte $66 ; | XX  XX | $FA71
    .byte $85 ; |X    X X| $FA72
    .byte $60 ; | XX     | $FA73
    .byte $06 ; |     XX | $FA74
    .byte $01 ; |       X| $FA75
    .byte $40 ; | X      | $FA76
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
    .byte $00 ; |        | $FA9B
    .byte $00 ; |        | $FA9C
    .byte $00 ; |        | $FA9D
    .byte $00 ; |        | $FA9E
LFA9F:
    .byte $00 ; |        | $FA9F
    .byte $08 ; |    X   | $FAA0
    .byte $30 ; |  XX    | $FAA1
    .byte $0C ; |    XX  | $FAA2
    .byte $18 ; |   XX   | $FAA3
    .byte $38 ; |  XXX   | $FAA4
    .byte $1E ; |   XXXX | $FAA5
    .byte $18 ; |   XX   | $FAA6
    .byte $18 ; |   XX   | $FAA7
    .byte $18 ; |   XX   | $FAA8
    .byte $18 ; |   XX   | $FAA9
    .byte $18 ; |   XX   | $FAAA
    .byte $18 ; |   XX   | $FAAB
    .byte $18 ; |   XX   | $FAAC
    .byte $18 ; |   XX   | $FAAD
    .byte $18 ; |   XX   | $FAAE
    .byte $18 ; |   XX   | $FAAF
    .byte $18 ; |   XX   | $FAB0
    .byte $18 ; |   XX   | $FAB1
    .byte $18 ; |   XX   | $FAB2
    .byte $18 ; |   XX   | $FAB3
    .byte $18 ; |   XX   | $FAB4
    .byte $18 ; |   XX   | $FAB5
    .byte $18 ; |   XX   | $FAB6
    .byte $18 ; |   XX   | $FAB7
    .byte $18 ; |   XX   | $FAB8
    .byte $18 ; |   XX   | $FAB9
    .byte $18 ; |   XX   | $FABA
    .byte $18 ; |   XX   | $FABB
    .byte $18 ; |   XX   | $FABC
    .byte $18 ; |   XX   | $FABD
    .byte $18 ; |   XX   | $FABE
    .byte $18 ; |   XX   | $FABF
    .byte $18 ; |   XX   | $FAC0
    .byte $18 ; |   XX   | $FAC1
    .byte $18 ; |   XX   | $FAC2
    .byte $18 ; |   XX   | $FAC3
    .byte $18 ; |   XX   | $FAC4
    .byte $18 ; |   XX   | $FAC5
    .byte $18 ; |   XX   | $FAC6
    .byte $18 ; |   XX   | $FAC7
    .byte $18 ; |   XX   | $FAC8
    .byte $18 ; |   XX   | $FAC9
    .byte $18 ; |   XX   | $FACA
    .byte $18 ; |   XX   | $FACB
    .byte $18 ; |   XX   | $FACC
    .byte $18 ; |   XX   | $FACD
    .byte $18 ; |   XX   | $FACE
    .byte $18 ; |   XX   | $FACF
    .byte $18 ; |   XX   | $FAD0
    .byte $18 ; |   XX   | $FAD1
    .byte $18 ; |   XX   | $FAD2
    .byte $18 ; |   XX   | $FAD3
    .byte $18 ; |   XX   | $FAD4
    .byte $18 ; |   XX   | $FAD5
    .byte $18 ; |   XX   | $FAD6
    .byte $18 ; |   XX   | $FAD7
    .byte $18 ; |   XX   | $FAD8
    .byte $18 ; |   XX   | $FAD9
    .byte $18 ; |   XX   | $FADA
    .byte $18 ; |   XX   | $FADB
    .byte $18 ; |   XX   | $FADC
    .byte $18 ; |   XX   | $FADD
    .byte $18 ; |   XX   | $FADE
    .byte $18 ; |   XX   | $FADF
    .byte $18 ; |   XX   | $FAE0
    .byte $18 ; |   XX   | $FAE1
    .byte $18 ; |   XX   | $FAE2
    .byte $18 ; |   XX   | $FAE3
LFAE4:
    .byte $18 ; |   XX   | $FAE4
    .byte $34 ; |  XX X  | $FAE5
    .byte $4E ; | X  XXX | $FAE6
    .byte $B0 ; |X XX    | $FAE7
    .byte $46 ; | X   XX | $FAE8
    .byte $84 ; |X    X  | $FAE9
    .byte $20 ; |  X     | $FAEA
    .byte $04 ; |     X  | $FAEB
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
    .byte $00 ; |        | $FB00
    .byte $00 ; |        | $FB01
    .byte $00 ; |        | $FB02
    .byte $00 ; |        | $FB03
    .byte $00 ; |        | $FB04
    .byte $00 ; |        | $FB05
    .byte $00 ; |        | $FB06
    .byte $00 ; |        | $FB07
    .byte $00 ; |        | $FB08
    .byte $00 ; |        | $FB09
    .byte $00 ; |        | $FB0A
    .byte $00 ; |        | $FB0B
    .byte $00 ; |        | $FB0C
    .byte $00 ; |        | $FB0D
    .byte $00 ; |        | $FB0E
    .byte $00 ; |        | $FB0F
    .byte $00 ; |        | $FB10
    .byte $00 ; |        | $FB11
    .byte $00 ; |        | $FB12
    .byte $00 ; |        | $FB13
    .byte $00 ; |        | $FB14
    .byte $00 ; |        | $FB15
    .byte $00 ; |        | $FB16
    .byte $00 ; |        | $FB17
    .byte $00 ; |        | $FB18
    .byte $00 ; |        | $FB19
    .byte $00 ; |        | $FB1A
    .byte $00 ; |        | $FB1B
    .byte $00 ; |        | $FB1C
    .byte $00 ; |        | $FB1D
    .byte $00 ; |        | $FB1E
    .byte $00 ; |        | $FB1F
    .byte $00 ; |        | $FB20
    .byte $00 ; |        | $FB21
    .byte $00 ; |        | $FB22
    .byte $00 ; |        | $FB23
    .byte $00 ; |        | $FB24
    .byte $00 ; |        | $FB25
    .byte $00 ; |        | $FB26
    .byte $00 ; |        | $FB27
    .byte $00 ; |        | $FB28
LFB29:
    .byte $00 ; |        | $FB29
    .byte $00 ; |        | $FB2A
    .byte $00 ; |        | $FB2B
    .byte $00 ; |        | $FB2C
    .byte $00 ; |        | $FB2D
    .byte $00 ; |        | $FB2E
    .byte $00 ; |        | $FB2F
    .byte $00 ; |        | $FB30
    .byte $08 ; |    X   | $FB31
    .byte $10 ; |   X    | $FB32
    .byte $08 ; |    X   | $FB33
    .byte $10 ; |   X    | $FB34
    .byte $08 ; |    X   | $FB35
    .byte $10 ; |   X    | $FB36
    .byte $18 ; |   XX   | $FB37
    .byte $18 ; |   XX   | $FB38
    .byte $10 ; |   X    | $FB39
    .byte $18 ; |   XX   | $FB3A
    .byte $18 ; |   XX   | $FB3B
    .byte $08 ; |    X   | $FB3C
    .byte $18 ; |   XX   | $FB3D
    .byte $18 ; |   XX   | $FB3E
    .byte $18 ; |   XX   | $FB3F
    .byte $18 ; |   XX   | $FB40
    .byte $18 ; |   XX   | $FB41
    .byte $18 ; |   XX   | $FB42
    .byte $18 ; |   XX   | $FB43
    .byte $08 ; |    X   | $FB44
    .byte $18 ; |   XX   | $FB45
    .byte $18 ; |   XX   | $FB46
    .byte $18 ; |   XX   | $FB47
    .byte $10 ; |   X    | $FB48
    .byte $18 ; |   XX   | $FB49
    .byte $18 ; |   XX   | $FB4A
    .byte $18 ; |   XX   | $FB4B
    .byte $18 ; |   XX   | $FB4C
    .byte $18 ; |   XX   | $FB4D
    .byte $18 ; |   XX   | $FB4E
    .byte $08 ; |    X   | $FB4F
    .byte $18 ; |   XX   | $FB50
    .byte $10 ; |   X    | $FB51
    .byte $18 ; |   XX   | $FB52
    .byte $08 ; |    X   | $FB53
    .byte $18 ; |   XX   | $FB54
    .byte $18 ; |   XX   | $FB55
    .byte $18 ; |   XX   | $FB56
    .byte $18 ; |   XX   | $FB57
    .byte $18 ; |   XX   | $FB58
    .byte $10 ; |   X    | $FB59
    .byte $18 ; |   XX   | $FB5A
    .byte $18 ; |   XX   | $FB5B
    .byte $18 ; |   XX   | $FB5C
    .byte $18 ; |   XX   | $FB5D
    .byte $18 ; |   XX   | $FB5E
    .byte $08 ; |    X   | $FB5F
    .byte $18 ; |   XX   | $FB60
    .byte $18 ; |   XX   | $FB61
    .byte $10 ; |   X    | $FB62
    .byte $18 ; |   XX   | $FB63
    .byte $18 ; |   XX   | $FB64
    .byte $18 ; |   XX   | $FB65
    .byte $18 ; |   XX   | $FB66
    .byte $08 ; |    X   | $FB67
    .byte $18 ; |   XX   | $FB68
    .byte $18 ; |   XX   | $FB69
    .byte $18 ; |   XX   | $FB6A
    .byte $18 ; |   XX   | $FB6B
    .byte $18 ; |   XX   | $FB6C
    .byte $18 ; |   XX   | $FB6D
LFB6E:
    .byte $00 ; |        | $FB6E
    .byte $08 ; |    X   | $FB6F
    .byte $00 ; |        | $FB70
    .byte $08 ; |    X   | $FB71
    .byte $10 ; |   X    | $FB72
    .byte $08 ; |    X   | $FB73
    .byte $10 ; |   X    | $FB74
    .byte $08 ; |    X   | $FB75
    .byte $10 ; |   X    | $FB76
    .byte $08 ; |    X   | $FB77
    .byte $10 ; |   X    | $FB78
    .byte $08 ; |    X   | $FB79
    .byte $10 ; |   X    | $FB7A
    .byte $08 ; |    X   | $FB7B
    .byte $00 ; |        | $FB7C
    .byte $00 ; |        | $FB7D
    .byte $08 ; |    X   | $FB7E
    .byte $00 ; |        | $FB7F
    .byte $00 ; |        | $FB80
    .byte $10 ; |   X    | $FB81
    .byte $00 ; |        | $FB82
    .byte $00 ; |        | $FB83
    .byte $00 ; |        | $FB84
    .byte $00 ; |        | $FB85
    .byte $00 ; |        | $FB86
    .byte $00 ; |        | $FB87
    .byte $00 ; |        | $FB88
    .byte $10 ; |   X    | $FB89
    .byte $00 ; |        | $FB8A
    .byte $00 ; |        | $FB8B
    .byte $00 ; |        | $FB8C
    .byte $08 ; |    X   | $FB8D
    .byte $00 ; |        | $FB8E
    .byte $00 ; |        | $FB8F
    .byte $00 ; |        | $FB90
    .byte $00 ; |        | $FB91
    .byte $00 ; |        | $FB92
    .byte $00 ; |        | $FB93
    .byte $10 ; |   X    | $FB94
    .byte $00 ; |        | $FB95
    .byte $08 ; |    X   | $FB96
    .byte $00 ; |        | $FB97
    .byte $10 ; |   X    | $FB98
    .byte $00 ; |        | $FB99
    .byte $00 ; |        | $FB9A
    .byte $00 ; |        | $FB9B
    .byte $00 ; |        | $FB9C
    .byte $00 ; |        | $FB9D
    .byte $08 ; |    X   | $FB9E
    .byte $00 ; |        | $FB9F
    .byte $00 ; |        | $FBA0
    .byte $00 ; |        | $FBA1
    .byte $00 ; |        | $FBA2
    .byte $00 ; |        | $FBA3
    .byte $10 ; |   X    | $FBA4
    .byte $00 ; |        | $FBA5
    .byte $00 ; |        | $FBA6
    .byte $08 ; |    X   | $FBA7
    .byte $00 ; |        | $FBA8
    .byte $00 ; |        | $FBA9
    .byte $00 ; |        | $FBAA
    .byte $00 ; |        | $FBAB
    .byte $10 ; |   X    | $FBAC
    .byte $00 ; |        | $FBAD
    .byte $00 ; |        | $FBAE
    .byte $00 ; |        | $FBAF
    .byte $00 ; |        | $FBB0
    .byte $00 ; |        | $FBB1
    .byte $00 ; |        | $FBB2
LFBB3:
    .byte $00 ; |        | $FBB3
    .byte $00 ; |        | $FBB4
    .byte $00 ; |        | $FBB5
    .byte $00 ; |        | $FBB6
    .byte $00 ; |        | $FBB7
    .byte $00 ; |        | $FBB8
    .byte $00 ; |        | $FBB9
    .byte $00 ; |        | $FBBA
    .byte $10 ; |   X    | $FBBB
    .byte $08 ; |    X   | $FBBC
    .byte $10 ; |   X    | $FBBD
    .byte $08 ; |    X   | $FBBE
    .byte $10 ; |   X    | $FBBF
    .byte $08 ; |    X   | $FBC0
    .byte $18 ; |   XX   | $FBC1
    .byte $18 ; |   XX   | $FBC2
    .byte $18 ; |   XX   | $FBC3
    .byte $08 ; |    X   | $FBC4
    .byte $18 ; |   XX   | $FBC5
    .byte $10 ; |   X    | $FBC6
    .byte $18 ; |   XX   | $FBC7
    .byte $18 ; |   XX   | $FBC8
    .byte $18 ; |   XX   | $FBC9
    .byte $18 ; |   XX   | $FBCA
    .byte $18 ; |   XX   | $FBCB
    .byte $08 ; |    X   | $FBCC
    .byte $18 ; |   XX   | $FBCD
    .byte $18 ; |   XX   | $FBCE
    .byte $18 ; |   XX   | $FBCF
    .byte $10 ; |   X    | $FBD0
    .byte $18 ; |   XX   | $FBD1
    .byte $18 ; |   XX   | $FBD2
    .byte $18 ; |   XX   | $FBD3
    .byte $08 ; |    X   | $FBD4
    .byte $18 ; |   XX   | $FBD5
    .byte $18 ; |   XX   | $FBD6
    .byte $18 ; |   XX   | $FBD7
    .byte $10 ; |   X    | $FBD8
    .byte $18 ; |   XX   | $FBD9
    .byte $18 ; |   XX   | $FBDA
    .byte $08 ; |    X   | $FBDB
    .byte $18 ; |   XX   | $FBDC
    .byte $18 ; |   XX   | $FBDD
    .byte $18 ; |   XX   | $FBDE
    .byte $18 ; |   XX   | $FBDF
    .byte $10 ; |   X    | $FBE0
    .byte $18 ; |   XX   | $FBE1
    .byte $18 ; |   XX   | $FBE2
    .byte $18 ; |   XX   | $FBE3
    .byte $18 ; |   XX   | $FBE4
    .byte $18 ; |   XX   | $FBE5
    .byte $08 ; |    X   | $FBE6
    .byte $18 ; |   XX   | $FBE7
    .byte $18 ; |   XX   | $FBE8
    .byte $10 ; |   X    | $FBE9
    .byte $18 ; |   XX   | $FBEA
    .byte $18 ; |   XX   | $FBEB
    .byte $18 ; |   XX   | $FBEC
    .byte $18 ; |   XX   | $FBED
    .byte $18 ; |   XX   | $FBEE
    .byte $08 ; |    X   | $FBEF
    .byte $18 ; |   XX   | $FBF0
    .byte $18 ; |   XX   | $FBF1
    .byte $18 ; |   XX   | $FBF2
    .byte $18 ; |   XX   | $FBF3
    .byte $18 ; |   XX   | $FBF4
    .byte $18 ; |   XX   | $FBF5
    .byte $18 ; |   XX   | $FBF6
    .byte $18 ; |   XX   | $FBF7
LFBF8:
    .byte $00 ; |        | $FBF8
    .byte $10 ; |   X    | $FBF9
    .byte $00 ; |        | $FBFA
    .byte $10 ; |   X    | $FBFB
    .byte $08 ; |    X   | $FBFC
    .byte $10 ; |   X    | $FBFD
    .byte $08 ; |    X   | $FBFE
    .byte $10 ; |   X    | $FBFF
    .byte $08 ; |    X   | $FC00
    .byte $10 ; |   X    | $FC01
    .byte $08 ; |    X   | $FC02
    .byte $10 ; |   X    | $FC03
    .byte $08 ; |    X   | $FC04
    .byte $10 ; |   X    | $FC05
    .byte $00 ; |        | $FC06
    .byte $00 ; |        | $FC07
    .byte $00 ; |        | $FC08
    .byte $10 ; |   X    | $FC09
    .byte $00 ; |        | $FC0A
    .byte $08 ; |    X   | $FC0B
    .byte $00 ; |        | $FC0C
    .byte $00 ; |        | $FC0D
    .byte $00 ; |        | $FC0E
    .byte $00 ; |        | $FC0F
    .byte $00 ; |        | $FC10
    .byte $10 ; |   X    | $FC11
    .byte $00 ; |        | $FC12
    .byte $00 ; |        | $FC13
    .byte $00 ; |        | $FC14
    .byte $08 ; |    X   | $FC15
    .byte $00 ; |        | $FC16
    .byte $00 ; |        | $FC17
    .byte $00 ; |        | $FC18
    .byte $10 ; |   X    | $FC19
    .byte $00 ; |        | $FC1A
    .byte $00 ; |        | $FC1B
    .byte $00 ; |        | $FC1C
    .byte $08 ; |    X   | $FC1D
    .byte $00 ; |        | $FC1E
    .byte $00 ; |        | $FC1F
    .byte $10 ; |   X    | $FC20
    .byte $00 ; |        | $FC21
    .byte $00 ; |        | $FC22
    .byte $00 ; |        | $FC23
    .byte $00 ; |        | $FC24
    .byte $08 ; |    X   | $FC25
    .byte $00 ; |        | $FC26
    .byte $00 ; |        | $FC27
    .byte $00 ; |        | $FC28
    .byte $00 ; |        | $FC29
    .byte $00 ; |        | $FC2A
    .byte $10 ; |   X    | $FC2B
    .byte $00 ; |        | $FC2C
    .byte $00 ; |        | $FC2D
    .byte $08 ; |    X   | $FC2E
    .byte $00 ; |        | $FC2F
    .byte $00 ; |        | $FC30
    .byte $00 ; |        | $FC31
    .byte $00 ; |        | $FC32
    .byte $00 ; |        | $FC33
    .byte $10 ; |   X    | $FC34
    .byte $00 ; |        | $FC35
    .byte $00 ; |        | $FC36
    .byte $00 ; |        | $FC37
    .byte $00 ; |        | $FC38
    .byte $00 ; |        | $FC39
    .byte $00 ; |        | $FC3A
    .byte $00 ; |        | $FC3B
    .byte $00 ; |        | $FC3C
LFC3D:
    .byte $00 ; |        | $FC3D
    .byte $00 ; |        | $FC3E
    .byte $08 ; |    X   | $FC3F
    .byte $10 ; |   X    | $FC40
    .byte $00 ; |        | $FC41
    .byte $00 ; |        | $FC42
    .byte $00 ; |        | $FC43
    .byte $00 ; |        | $FC44
    .byte $00 ; |        | $FC45
    .byte $00 ; |        | $FC46
    .byte $00 ; |        | $FC47
    .byte $10 ; |   X    | $FC48
    .byte $08 ; |    X   | $FC49
    .byte $18 ; |   XX   | $FC4A
    .byte $10 ; |   X    | $FC4B
    .byte $10 ; |   X    | $FC4C
    .byte $08 ; |    X   | $FC4D
    .byte $18 ; |   XX   | $FC4E
    .byte $18 ; |   XX   | $FC4F
    .byte $18 ; |   XX   | $FC50
    .byte $18 ; |   XX   | $FC51
    .byte $18 ; |   XX   | $FC52
    .byte $18 ; |   XX   | $FC53
    .byte $18 ; |   XX   | $FC54
    .byte $18 ; |   XX   | $FC55
    .byte $10 ; |   X    | $FC56
    .byte $18 ; |   XX   | $FC57
    .byte $18 ; |   XX   | $FC58
    .byte $18 ; |   XX   | $FC59
    .byte $18 ; |   XX   | $FC5A
    .byte $18 ; |   XX   | $FC5B
    .byte $10 ; |   X    | $FC5C
    .byte $18 ; |   XX   | $FC5D
    .byte $18 ; |   XX   | $FC5E
    .byte $18 ; |   XX   | $FC5F
    .byte $18 ; |   XX   | $FC60
    .byte $18 ; |   XX   | $FC61
    .byte $18 ; |   XX   | $FC62
    .byte $18 ; |   XX   | $FC63
    .byte $18 ; |   XX   | $FC64
    .byte $08 ; |    X   | $FC65
    .byte $18 ; |   XX   | $FC66
    .byte $18 ; |   XX   | $FC67
    .byte $18 ; |   XX   | $FC68
    .byte $18 ; |   XX   | $FC69
    .byte $18 ; |   XX   | $FC6A
    .byte $10 ; |   X    | $FC6B
    .byte $18 ; |   XX   | $FC6C
    .byte $18 ; |   XX   | $FC6D
    .byte $18 ; |   XX   | $FC6E
    .byte $08 ; |    X   | $FC6F
    .byte $18 ; |   XX   | $FC70
    .byte $18 ; |   XX   | $FC71
    .byte $18 ; |   XX   | $FC72
    .byte $18 ; |   XX   | $FC73
    .byte $18 ; |   XX   | $FC74
    .byte $08 ; |    X   | $FC75
    .byte $18 ; |   XX   | $FC76
    .byte $18 ; |   XX   | $FC77
    .byte $10 ; |   X    | $FC78
    .byte $18 ; |   XX   | $FC79
    .byte $18 ; |   XX   | $FC7A
    .byte $18 ; |   XX   | $FC7B
    .byte $18 ; |   XX   | $FC7C
    .byte $18 ; |   XX   | $FC7D
    .byte $18 ; |   XX   | $FC7E
    .byte $18 ; |   XX   | $FC7F
    .byte $18 ; |   XX   | $FC80
    .byte $18 ; |   XX   | $FC81
LFC82:
    .byte $00 ; |        | $FC82
    .byte $00 ; |        | $FC83
    .byte $10 ; |   X    | $FC84
    .byte $00 ; |        | $FC85
    .byte $08 ; |    X   | $FC86
    .byte $10 ; |   X    | $FC87
    .byte $00 ; |        | $FC88
    .byte $18 ; |   XX   | $FC89
    .byte $00 ; |        | $FC8A
    .byte $18 ; |   XX   | $FC8B
    .byte $00 ; |        | $FC8C
    .byte $08 ; |    X   | $FC8D
    .byte $10 ; |   X    | $FC8E
    .byte $00 ; |        | $FC8F
    .byte $08 ; |    X   | $FC90
    .byte $00 ; |        | $FC91
    .byte $10 ; |   X    | $FC92
    .byte $00 ; |        | $FC93
    .byte $00 ; |        | $FC94
    .byte $00 ; |        | $FC95
    .byte $00 ; |        | $FC96
    .byte $00 ; |        | $FC97
    .byte $00 ; |        | $FC98
    .byte $00 ; |        | $FC99
    .byte $00 ; |        | $FC9A
    .byte $08 ; |    X   | $FC9B
    .byte $00 ; |        | $FC9C
    .byte $00 ; |        | $FC9D
    .byte $00 ; |        | $FC9E
    .byte $00 ; |        | $FC9F
    .byte $00 ; |        | $FCA0
    .byte $00 ; |        | $FCA1
    .byte $00 ; |        | $FCA2
    .byte $00 ; |        | $FCA3
    .byte $00 ; |        | $FCA4
    .byte $00 ; |        | $FCA5
    .byte $00 ; |        | $FCA6
    .byte $00 ; |        | $FCA7
    .byte $00 ; |        | $FCA8
    .byte $00 ; |        | $FCA9
    .byte $10 ; |   X    | $FCAA
    .byte $00 ; |        | $FCAB
    .byte $00 ; |        | $FCAC
    .byte $00 ; |        | $FCAD
    .byte $00 ; |        | $FCAE
    .byte $00 ; |        | $FCAF
    .byte $08 ; |    X   | $FCB0
    .byte $00 ; |        | $FCB1
    .byte $00 ; |        | $FCB2
    .byte $00 ; |        | $FCB3
    .byte $00 ; |        | $FCB4
    .byte $00 ; |        | $FCB5
    .byte $00 ; |        | $FCB6
    .byte $00 ; |        | $FCB7
    .byte $00 ; |        | $FCB8
    .byte $00 ; |        | $FCB9
    .byte $10 ; |   X    | $FCBA
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
LFCC8:
    .byte $EF ; |XXX XXXX| $FCC8
    .byte $00 ; |        | $FCC9
    .byte $0F ; |    XXXX| $FCCA
    .byte $00 ; |        | $FCCB
    .byte $FF ; |XXXXXXXX| $FCCC
    .byte $E0 ; |XXX     | $FCCD
    .byte $FF ; |XXXXXXXX| $FCCE
    .byte $F8 ; |XXXXX   | $FCCF
    .byte $0F ; |    XXXX| $FCD0
    .byte $00 ; |        | $FCD1
    .byte $C0 ; |XX      | $FCD2
    .byte $C0 ; |XX      | $FCD3
    .byte $CF ; |XX  XXXX| $FCD4
    .byte $CF ; |XX  XXXX| $FCD5
    .byte $9F ; |X  XXXXX| $FCD6
    .byte $9F ; |X  XXXXX| $FCD7
    .byte $8F ; |X   XXXX| $FCD8
    .byte $9F ; |X  XXXXX| $FCD9
    .byte $9F ; |X  XXXXX| $FCDA
    .byte $1F ; |   XXXXX| $FCDB
    .byte $1F ; |   XXXXX| $FCDC
    .byte $FF ; |XXXXXXXX| $FCDD
    .byte $FF ; |XXXXXXXX| $FCDE
    .byte $FF ; |XXXXXXXX| $FCDF
    .byte $01 ; |       X| $FCE0
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
    .byte $FF ; |XXXXXXXX| $FCF7
    .byte $FF ; |XXXXXXXX| $FCF8
    .byte $FF ; |XXXXXXXX| $FCF9
    .byte $00 ; |        | $FCFA
    .byte $00 ; |        | $FCFB
LFCFC:
    .byte $FC ; |XXXXXX  | $FCFC
    .byte $00 ; |        | $FCFD
    .byte $FC ; |XXXXXX  | $FCFE
    .byte $00 ; |        | $FCFF
    .byte $FE ; |XXXXXXX | $FD00
    .byte $00 ; |        | $FD01
    .byte $FE ; |XXXXXXX | $FD02
    .byte $00 ; |        | $FD03
    .byte $FF ; |XXXXXXXX| $FD04
    .byte $01 ; |       X| $FD05
    .byte $31 ; |  XX   X| $FD06
    .byte $01 ; |       X| $FD07
    .byte $FF ; |XXXXXXXX| $FD08
    .byte $FF ; |XXXXXXXX| $FD09
    .byte $FF ; |XXXXXXXX| $FD0A
    .byte $FF ; |XXXXXXXX| $FD0B
    .byte $FF ; |XXXXXXXX| $FD0C
    .byte $FF ; |XXXXXXXX| $FD0D
    .byte $FF ; |XXXXXXXX| $FD0E
    .byte $FF ; |XXXXXXXX| $FD0F
    .byte $FF ; |XXXXXXXX| $FD10
    .byte $FF ; |XXXXXXXX| $FD11
    .byte $FF ; |XXXXXXXX| $FD12
    .byte $FF ; |XXXXXXXX| $FD13
    .byte $FF ; |XXXXXXXX| $FD14
    .byte $0F ; |    XXXX| $FD15
    .byte $00 ; |        | $FD16
    .byte $01 ; |       X| $FD17
    .byte $01 ; |       X| $FD18
    .byte $01 ; |       X| $FD19
    .byte $01 ; |       X| $FD1A
    .byte $01 ; |       X| $FD1B
    .byte $01 ; |       X| $FD1C
    .byte $01 ; |       X| $FD1D
    .byte $03 ; |      XX| $FD1E
    .byte $03 ; |      XX| $FD1F
    .byte $03 ; |      XX| $FD20
    .byte $03 ; |      XX| $FD21
    .byte $03 ; |      XX| $FD22
    .byte $03 ; |      XX| $FD23
    .byte $03 ; |      XX| $FD24
    .byte $07 ; |     XXX| $FD25
    .byte $07 ; |     XXX| $FD26
    .byte $07 ; |     XXX| $FD27
    .byte $0F ; |    XXXX| $FD28
    .byte $1F ; |   XXXXX| $FD29
    .byte $7F ; | XXXXXXX| $FD2A
    .byte $FF ; |XXXXXXXX| $FD2B
    .byte $FF ; |XXXXXXXX| $FD2C
    .byte $FF ; |XXXXXXXX| $FD2D
    .byte $00 ; |        | $FD2E
    .byte $00 ; |        | $FD2F
LFD30:
    .byte $03 ; |      XX| $FD30
    .byte $00 ; |        | $FD31
    .byte $03 ; |      XX| $FD32
    .byte $00 ; |        | $FD33
    .byte $02 ; |      X | $FD34
    .byte $00 ; |        | $FD35
    .byte $02 ; |      X | $FD36
    .byte $00 ; |        | $FD37
    .byte $00 ; |        | $FD38
    .byte $00 ; |        | $FD39
    .byte $86 ; |X    XX | $FD3A
    .byte $80 ; |X       | $FD3B
    .byte $EE ; |XXX XXX | $FD3C
    .byte $F6 ; |XXXX XX | $FD3D
    .byte $F6 ; |XXXX XX | $FD3E
    .byte $FE ; |XXXXXXX | $FD3F
    .byte $EE ; |XXX XXX | $FD40
    .byte $FE ; |XXXXXXX | $FD41
    .byte $FE ; |XXXXXXX | $FD42
    .byte $FE ; |XXXXXXX | $FD43
    .byte $FF ; |XXXXXXXX| $FD44
    .byte $FF ; |XXXXXXXX| $FD45
    .byte $FF ; |XXXXXXXX| $FD46
    .byte $FF ; |XXXXXXXX| $FD47
    .byte $FF ; |XXXXXXXX| $FD48
    .byte $FC ; |XXXXXX  | $FD49
    .byte $F8 ; |XXXXX   | $FD4A
    .byte $F8 ; |XXXXX   | $FD4B
    .byte $F8 ; |XXXXX   | $FD4C
    .byte $F8 ; |XXXXX   | $FD4D
    .byte $F0 ; |XXXX    | $FD4E
    .byte $F0 ; |XXXX    | $FD4F
    .byte $F0 ; |XXXX    | $FD50
    .byte $F0 ; |XXXX    | $FD51
    .byte $E0 ; |XXX     | $FD52
    .byte $E0 ; |XXX     | $FD53
    .byte $E0 ; |XXX     | $FD54
    .byte $E0 ; |XXX     | $FD55
    .byte $C0 ; |XX      | $FD56
    .byte $C0 ; |XX      | $FD57
    .byte $C0 ; |XX      | $FD58
    .byte $C0 ; |XX      | $FD59
    .byte $80 ; |X       | $FD5A
    .byte $80 ; |X       | $FD5B
    .byte $80 ; |X       | $FD5C
    .byte $81 ; |X      X| $FD5D
    .byte $01 ; |       X| $FD5E
    .byte $02 ; |      X | $FD5F
    .byte $0E ; |    XXX | $FD60
    .byte $3C ; |  XXXX  | $FD61
    .byte $00 ; |        | $FD62
    .byte $00 ; |        | $FD63
LFD64:
    .byte $FF ; |XXXXXXXX| $FD64
    .byte $00 ; |        | $FD65
    .byte $FF ; |XXXXXXXX| $FD66
    .byte $00 ; |        | $FD67
    .byte $FF ; |XXXXXXXX| $FD68
    .byte $00 ; |        | $FD69
    .byte $FF ; |XXXXXXXX| $FD6A
    .byte $00 ; |        | $FD6B
    .byte $F0 ; |XXXX    | $FD6C
    .byte $00 ; |        | $FD6D
    .byte $1C ; |   XXX  | $FD6E
    .byte $00 ; |        | $FD6F
    .byte $FF ; |XXXXXXXX| $FD70
    .byte $FF ; |XXXXXXXX| $FD71
    .byte $FF ; |XXXXXXXX| $FD72
    .byte $FF ; |XXXXXXXX| $FD73
    .byte $FF ; |XXXXXXXX| $FD74
    .byte $FF ; |XXXXXXXX| $FD75
    .byte $FF ; |XXXXXXXX| $FD76
    .byte $FF ; |XXXXXXXX| $FD77
    .byte $F9 ; |XXXXX  X| $FD78
    .byte $FE ; |XXXXXXX | $FD79
    .byte $F9 ; |XXXXX  X| $FD7A
    .byte $F8 ; |XXXXX   | $FD7B
    .byte $00 ; |        | $FD7C
    .byte $00 ; |        | $FD7D
    .byte $00 ; |        | $FD7E
    .byte $00 ; |        | $FD7F
    .byte $00 ; |        | $FD80
    .byte $01 ; |       X| $FD81
    .byte $01 ; |       X| $FD82
    .byte $02 ; |      X | $FD83
    .byte $02 ; |      X | $FD84
    .byte $04 ; |     X  | $FD85
    .byte $04 ; |     X  | $FD86
    .byte $08 ; |    X   | $FD87
    .byte $08 ; |    X   | $FD88
    .byte $10 ; |   X    | $FD89
    .byte $10 ; |   X    | $FD8A
    .byte $20 ; |  X     | $FD8B
    .byte $20 ; |  X     | $FD8C
    .byte $40 ; | X      | $FD8D
    .byte $40 ; | X      | $FD8E
    .byte $80 ; |X       | $FD8F
    .byte $80 ; |X       | $FD90
    .byte $00 ; |        | $FD91
    .byte $00 ; |        | $FD92
    .byte $00 ; |        | $FD93
    .byte $00 ; |        | $FD94
    .byte $00 ; |        | $FD95
    .byte $00 ; |        | $FD96
    .byte $00 ; |        | $FD97
LFD98:
    .byte $80 ; |X       | $FD98
    .byte $00 ; |        | $FD99
    .byte $FC ; |XXXXXX  | $FD9A
    .byte $00 ; |        | $FD9B
    .byte $FC ; |XXXXXX  | $FD9C
    .byte $00 ; |        | $FD9D
    .byte $BC ; |X XXXX  | $FD9E
    .byte $00 ; |        | $FD9F
    .byte $3C ; |  XXXX  | $FDA0
    .byte $00 ; |        | $FDA1
    .byte $00 ; |        | $FDA2
    .byte $00 ; |        | $FDA3
    .byte $FC ; |XXXXXX  | $FDA4
    .byte $FC ; |XXXXXX  | $FDA5
    .byte $FC ; |XXXXXX  | $FDA6
    .byte $FE ; |XXXXXXX | $FDA7
    .byte $FF ; |XXXXXXXX| $FDA8
    .byte $FF ; |XXXXXXXX| $FDA9
    .byte $FF ; |XXXXXXXX| $FDAA
    .byte $BF ; |X XXXXXX| $FDAB
    .byte $BF ; |X XXXXXX| $FDAC
    .byte $BF ; |X XXXXXX| $FDAD
    .byte $1E ; |   XXXX | $FDAE
    .byte $3D ; |  XXXX X| $FDAF
    .byte $39 ; |  XXX  X| $FDB0
    .byte $3A ; |  XXX X | $FDB1
    .byte $E7 ; |XXX  XXX| $FDB2
    .byte $82 ; |X     X | $FDB3
    .byte $81 ; |X      X| $FDB4
    .byte $04 ; |     X  | $FDB5
    .byte $06 ; |     XX | $FDB6
    .byte $0F ; |    XXXX| $FDB7
    .byte $07 ; |     XXX| $FDB8
    .byte $47 ; | X   XXX| $FDB9
    .byte $47 ; | X   XXX| $FDBA
    .byte $6F ; | XX XXXX| $FDBB
    .byte $3F ; |  XXXXXX| $FDBC
    .byte $1A ; |   XX X | $FDBD
    .byte $0D ; |    XX X| $FDBE
    .byte $03 ; |      XX| $FDBF
    .byte $03 ; |      XX| $FDC0
    .byte $01 ; |       X| $FDC1
    .byte $02 ; |      X | $FDC2
    .byte $05 ; |     X X| $FDC3
    .byte $02 ; |      X | $FDC4
    .byte $05 ; |     X X| $FDC5
    .byte $02 ; |      X | $FDC6
    .byte $05 ; |     X X| $FDC7
    .byte $02 ; |      X | $FDC8
    .byte $05 ; |     X X| $FDC9
    .byte $00 ; |        | $FDCA
    .byte $00 ; |        | $FDCB
LFDCC:
    .byte $00 ; |        | $FDCC
    .byte $00 ; |        | $FDCD
    .byte $00 ; |        | $FDCE
    .byte $00 ; |        | $FDCF
    .byte $00 ; |        | $FDD0
    .byte $00 ; |        | $FDD1
    .byte $00 ; |        | $FDD2
    .byte $00 ; |        | $FDD3
    .byte $00 ; |        | $FDD4
    .byte $40 ; | X      | $FDD5
    .byte $40 ; | X      | $FDD6
    .byte $40 ; | X      | $FDD7
    .byte $40 ; | X      | $FDD8
    .byte $40 ; | X      | $FDD9
    .byte $40 ; | X      | $FDDA
    .byte $40 ; | X      | $FDDB
    .byte $40 ; | X      | $FDDC
    .byte $C0 ; |XX      | $FDDD
    .byte $C0 ; |XX      | $FDDE
    .byte $80 ; |X       | $FDDF
    .byte $80 ; |X       | $FDE0
    .byte $00 ; |        | $FDE1
    .byte $00 ; |        | $FDE2
    .byte $00 ; |        | $FDE3
    .byte $80 ; |X       | $FDE4
    .byte $80 ; |X       | $FDE5
    .byte $6A ; | XX X X | $FDE6
    .byte $68 ; | XX X   | $FDE7
    .byte $27 ; |  X  XXX| $FDE8
    .byte $A7 ; |X X  XXX| $FDE9
    .byte $27 ; |  X  XXX| $FDEA
    .byte $06 ; |     XX | $FDEB
    .byte $0E ; |    XXX | $FDEC
    .byte $8C ; |X   XX  | $FDED
    .byte $CC ; |XX  XX  | $FDEE
    .byte $FC ; |XXXXXX  | $FDEF
    .byte $F8 ; |XXXXX   | $FDF0
    .byte $78 ; | XXXX   | $FDF1
    .byte $F0 ; |XXXX    | $FDF2
    .byte $C0 ; |XX      | $FDF3
    .byte $80 ; |X       | $FDF4
    .byte $C0 ; |XX      | $FDF5
    .byte $C0 ; |XX      | $FDF6
    .byte $C0 ; |XX      | $FDF7
    .byte $C0 ; |XX      | $FDF8
    .byte $40 ; | X      | $FDF9
    .byte $C0 ; |XX      | $FDFA
    .byte $40 ; | X      | $FDFB
    .byte $80 ; |X       | $FDFC
    .byte $40 ; | X      | $FDFD
    .byte $00 ; |        | $FDFE
    .byte $00 ; |        | $FDFF

LFE00:
    ldy    ram_90                ; 3
    lda    (ram_8A),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_82),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_84),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    (ram_8C),Y            ; 5
    sta    ram_93                ; 3
    lda    (ram_88),Y            ; 5
    tax                          ; 2
    lda    (ram_8E),Y            ; 5
    ldy    ram_93                ; 3
    sty    GRP1                  ; 3
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_90                ; 5
    bpl    LFE00                 ; 2³
    rts                          ; 6

LFE28:
    lda    #$00                  ; 2
    sta    ram_95                ; 3
    sta    COLUBK                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    COLUPF                ; 3
    sta    ENABL                 ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #$44                  ; 2
    sta    sc_7C                 ; 4
    lda    #$0F                  ; 2
    sta    AUDF0                 ; 3
    lda    #$10                  ; 2
    sta    AUDF1                 ; 3
    lda    #$7A                  ; 2
    sta    ram_91                ; 3
    lda    #$00                  ; 2
    sta    ram_95                ; 3
    lda    #$05                  ; 2
    sta    ram_94                ; 3
    rts                          ; 6

LFE58:
    ldx    sc_7C|READ            ; 4
    beq    LFE65                 ; 2³
    cpx    #$04                  ; 2
    bcc    LFE65                 ; 2³
    dex                          ; 2
    stx    sc_7C                 ; 4
LFE65:
    lda    sc_7C|READ            ; 4
    rts                          ; 6


  IF SHOW_BYTES_REMAINING
      ECHO ([$FEFC-*]d), "bytes free BANK_7"
  ENDIF


       ORG $7EFC
      RORG $FEFC

    lda    BANK_2                ; 4
    jmp    M5106|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M5109|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9106|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M510C|BANK_MASK       ; 3

LFF14:
    lda    BANK_6                ; 4   different from lower banks, except for bank 6
    jmp    MD109|BANK_MASK       ; 3     bankswitch, goto LD84F

    lda    BANK_4                ; 4
    jmp    M9109|BANK_MASK       ; 3

    lda    BANK_2                ; 4
    jmp    M510F|BANK_MASK       ; 3

    lda    BANK_3                ; 4
    jmp    M7106|BANK_MASK       ; 3

LFF2C:
    lda    BANK_6                ; 4   different from the rest
    jmp    MD10C|BANK_MASK       ; 3     bankswitch, goto MD10C

    lda    BANK_2                ; 4
    jmp    M5112|BANK_MASK       ; 3

    lda    BANK_1                ; 4
    jmp    M310F|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB10C|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB10F|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M9112|BANK_MASK       ; 3

    lda    BANK_5                ; 4
    jmp    MB106|BANK_MASK       ; 3

    lda    BANK_7                ; 4
    jmp    MF106|BANK_MASK       ; 3

    lda    BANK_4                ; 4
    jmp    M910F|BANK_MASK       ; 3

    lda    BANK_6                ; 4
    jmp    MD106|BANK_MASK       ; 3

    lda    BANK_7                ; 4
    rts                          ; 6

    lda    BANK_3                ; 4
    rts                          ; 6

    lda    BANK_4                ; 4
    rts                          ; 6

    lda    BANK_6                ; 4
    rts                          ; 6


; $FF78 - $FFF3 are free bytes


       ORG $7FF4
      RORG $FFF4

    .byte $00 ; |        | $FFF4
    .byte $00 ; |        | $FFF5
    .byte $00 ; |        | $FFF6
    .byte $00 ; |        | $FFF7
    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9
    .byte $00 ; |        | $FFFA
    .byte $00 ; |        | $FFFB

    .word START_7
    .word 0

SHOW_BYTES_REMAINING = 1