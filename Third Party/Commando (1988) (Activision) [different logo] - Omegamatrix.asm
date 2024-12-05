; Rough disassembly of Commando
; By Omegamatrix
;
;
; Comm1.cfg contents:
;
;      ORG 9000
;      CODE 9000 90E4
;      GFX 90E5 90FF
;      CODE 9100 91FD
;      GFX 91FE 91FF
;      CODE 9200 947A
;      GFX 947B 9489
;      CODE 948A 94D8
;      GFX 94D9 9D3F
;      CODE 9D40 9D76
;      GFX 9D77 9DB4
;      CODE 9DB5 9E14
;      GFX 9E15 9F6C
;      DATA 9F6D 9F6F
;      CODE 9F70 9F75
;      GFX 9F76 9F97
;      DATA 9F98 9F9A
;      CODE 9F9B 9FA0
;      GFX 9FA1 9FD8
;      DATA 9FD9 9FDB
;      CODE 9FDC 9FE1
;      DATA 9FE2 9FE4
;      CODE 9FE5 9FF5
;      DATA 9FF6 9FFB
;      GFX 9FFC 9FFF
;
; Comm2.cfg contents:
;
;      ORG B000
;      CODE B000 B0E4
;      GFX B0E5 B0FF
;      CODE B100 B1FD
;      GFX B1FE B1FF
;      CODE B200 B47A
;      GFX B47B B489
;      CODE B48A B4D8
;      GFX B4D9 BD3F
;      CODE BD40 BD76
;      GFX BD77 BDB4
;      CODE BDB5 BE45
;      GFX BE46 BF75
;      DATA BF76 BF78
;      CODE BF79 BF7E
;      GFX BF7F BFA1
;      DATA BFA2 BFA4
;      CODE BFA5 BFAA
;      GFX BFAB BFCF
;      DATA BFD0 BFD2
;      CODE BFD3 BFD8
;      GFX BFD9 BFEA
;      CODE BFEB BFF5
;      DATA BFF6 BFFB
;      GFX BFFC BFFF
;
; Comm3.cfg contents:
;
;      ORG D000
;      CODE D000 D0E4
;      GFX D0E5 D0FF
;      CODE D100 D1FD
;      GFX D1FE D1FF
;      CODE D200 D47A
;      GFX D47B D489
;      CODE D48A D4D8
;      GFX D4D9 DDFF
;      CODE DE00 DE36
;      GFX DE37 DE74
;      CODE DE75 DF2E
;      GFX DF2F DF7E
;      DATA DF7F DF81
;      CODE DF82 DF87
;      GFX DF88 DFAB
;      DATA DFAC DFAE
;      CODE DFAF DFB4
;      DATA DFB5 DFB7
;      CODE DFB8 DFBD
;      DATA DFBE DFC0
;      CODE DFC1 DFC6
;      DATA DFC7 DFC9
;      CODE DFCA DFCF
;      GFX DFD0 DFEA
;      CODE DFEB DFF5
;      DATA DFF6 DFFB
;      GFX DFFC DFFF
;
; Comm4.cfg contents:
;
;      ORG F000
;      CODE F000 FC0F
;      GFX FC10 FE5D
;      CODE FE5E FE71
;      GFX FE72 FF5E
;      CODE FF5F FF6F
;      DATA FF70 FF75
;      CODE FF76 FF78
;      DATA FF79 FF7E
;      CODE FF7F FF81
;      DATA FF82 FF87
;      CODE FF88 FF9A
;      DATA FF9B FFA0
;      CODE FFA1 FFA4
;      DATA FFA5 FFAA
;      CODE FFAB FFAE
;      DATA FFAF FFB4
;      CODE FFB5 FFB7
;      DATA FFB8 FFBD
;      CODE FFBE FFC0
;      DATA FFC1 FFC6
;      CODE FFC7 FFC9
;      DATA FFCA FFCF
;      CODE FFD0 FFD2
;      DATA FFD3 FFD8
;      CODE FFD9 FFDB
;      DATA FFDC FFE1
;      CODE FFE2 FFE4
;      DATA FFE5 FFED
;      CODE FFEE FFF5
;      DATA FFF6 FFFB
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
REFP0   =  $0B
REFP1   =  $0C
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
HMOVE   =  $2A
HMCLR   =  $2B

; Read TIA Baseline = $00
INPT4   =  $0C
INPT5   =  $0D

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      USER CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DATAEAST = 0
CAPCOM   = 1

BANK_0        =  $FFF6
BANK_1        =  $FFF7
BANK_2        =  $FFF8
BANK_3        =  $FFF9

BK_9000       =  $9000   ; origin of bank 0
BK_B000       =  $B000   ; ""        bank 1
BK_D000       =  $D000   ; ""        bank 2

;some addresses manually defined,
;because of the marcro system I'm using...
L948A         =  $948A
LD7A8         =  $D7A8
LD888         =  $D888
LD8B8         =  $D8B8
LD990         =  $D990
LDADC         =  $DADC

;sound priorities, index
;breakif pc==FE5E         *address pushed on stack
SOUND_NEW_LIFE    = $C0 ; *$FBB1  highest priority
SOUND_80          = $80 ; *$F0AE
SOUND_80_2        = $80 ; *$F52B  gernade explosion
SOUND_ENEMY_DEAD  = $60 ; *$FB93
SOUND_BULLET      = $40 ; *$F35B  might be start of gernade too
SOUND_20          = $20 ; *$F782

MOVE_UP     = $01
MOVE_DOWN   = $02
MOVE_LEFT   = $04
MOVE_RIGHT  = $08

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

TIME_VBLANK     = 55
TIME_OVERSCAN   = 39


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RIOT RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x5
ram_81             ds 1  ; x18
ram_82             ds 5  ; x22
ram_87             ds 5  ; x11
ram_8C             ds 5  ; x11
ram_91             ds 1  ; x4

ram_92             ds 5  ; x26
ram_97             ds 5  ; x18
ram_9C             ds 5  ; x26
ram_A1             ds 5  ; x11
ram_A6             ds 5  ; x11
ram_AB             ds 5  ; x17

ram_B0             ds 1  ; x5
ram_B1             ds 1  ; x11
ram_B2             ds 3  ; x1
ram_B5             ds 4  ; x17
ram_B9             ds 1  ; x16
ram_BA             ds 3  ; x1
playerHpos         ds 1  ;$BD  x13
playerVpos         ds 1  ;$BE  x18
ram_BF             ds 1  ; x11
ram_C0             ds 1  ; x14
ram_C1             ds 1  ; x17
ram_C2             ds 1  ; x31
ram_C3             ds 1  ; x27
;-----------------------------------------------
playerStats        ds 5
distanceMarker     equ  playerStats    ;$C4  x17  how far up the level the player has proceeded
numOfGernades      equ  playerStats+1  ;$C5  x8
livesLevelNum      equ  playerStats+2  ;$C6  x17  lives high nibble, level low nibble
scoreBig           equ  playerStats+3  ;$C7  x9   100,000 and 10,000 digits (BCD)
scoreSmall         equ  playerStats+4  ;$C8  x4   1,000 and 100 digits (BCD)

otherPlayerStats   ds 5  ;$C9-$CD  x3
;-----------------------------------------------
ram_CE             ds 1  ; x10
ram_CF             ds 1  ; x6
soundIndex         ds 1  ;$D0  x6
frameCounter       ds 1  ;$D1  x15
ram_D2             ds 1  ; x5  bit 0,1 select logo display
ram_D3             ds 1  ; x5
enemiesKilled      ds 1  ;$D4  x3  has no meaning until we reach the base
ram_D5             ds 1  ; x20
ram_D6             ds 1  ; x128
ram_D7             ds 1  ; x60
ram_D8             ds 1  ; x29
ram_D9             ds 1  ; x35
ram_DA             ds 1  ; x21
ram_DB             ds 1  ; x11
ram_DC             ds 1  ; x1
ram_DD             ds 1  ; x67
ram_DE             ds 1  ; x10
ram_DF             ds 1  ; x37
ram_E0             ds 1  ; x10
ram_E1             ds 1  ; x52
ram_E2             ds 1  ; x10
ram_E3             ds 1  ; x37
ram_E4             ds 1  ; x10
ram_E5             ds 1  ; x46   player bullet Vpos (ptr for ENAMx)
ram_E6             ds 1  ; x1
ram_E7             ds 2  ; x45
ram_E9             ds 1  ; x43
ram_EA             ds 1  ; x1
ram_EB             ds 1  ; x34
ram_EC             ds 1  ; x1
ram_ED             ds 1  ; x31
ram_EE             ds 1  ; x4
ram_EF             ds 1  ; x13
ram_F0             ds 1  ; x5
ram_F1             ds 1  ; x15
ram_F2             ds 1  ; x5
ram_F3             ds 1  ; x7
ram_F4             ds 1  ; x4
ram_F5             ds 2  ; x3
ram_F7             ds 9  ; x3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MACROS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  banks 0, 1, and 2 all share these!

  MAC MAIN_KERNEL

;this label is outside this block of code
.mxFEB = $0FEB

.mx000:
    lda    ram_C2                ; 3
    and    #$38                  ; 2
    sta    REFP0                 ; 3
    sta    NUSIZ0                ; 3
    lda    #$00                  ; 2
    sta    COLUPF                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    ram_D9                ; 3
    lda    ram_9C,X              ; 4
    sta    NUSIZ1                ; 3
    sta    REFP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_D6                ; 3
    sec                          ; 2
    lda    ram_92,X              ; 4
    adc    #$03                  ; 2
.mx021:
    sbc    #$0F                  ; 2
    bcs    .mx021                ; 2³
    adc    #$0F                  ; 2
    tay                          ; 2
    lda    .mx47B,Y              ; 4
    nop                          ; 2
    sta    RESP1                 ; 3
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    ram_81                ; 3
    beq    .mx03F                ; 2³
    cpy    #$1F                  ; 2
    bcs    .mx041                ; 2³
    jmp    .mx100                ; 3

.mx03F:
    nop                          ; 2
    nop                          ; 2
.mx041:
    ldy    #$00                  ; 2
    lda    (ram_DD),Y            ; 5
    sta    GRP1                  ; 3
    sta    HMCLR                 ; 3
    lda    (ram_DF),Y            ; 5
    sta    ram_D6                ; 3
    lda    (ram_E1),Y            ; 5
    sta    PF2                   ; 3
    lda    (ram_E3),Y            ; 5
    sta    ram_D7                ; 3
    iny                          ; 2
    lda    (ram_E1),Y            ; 5
    sta    PF1                   ; 3
    ldy    ram_81                ; 3
    bne    .mx078                ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_D5                ; 3
    sta    COLUBK                ; 3
    lda    ram_D6                ; 3
    sta    COLUP1                ; 3
    lda    ram_D7                ; 3
    sta    COLUPF                ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    jmp    .mx384                ; 3

.mx078:
    ldy    ram_81                ; 3
    lda    ram_A1,X              ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    ram_DD                ; 3
    lda    ram_A6,X              ; 4
    sta    ram_DF                ; 3
    lda    ram_AB,X              ; 4
    sta    ram_DE                ; 3
    sta    ram_E0                ; 3
    lda    ram_87,X              ; 4
    sta    ram_E1                ; 3
    clc                          ; 2
    adc    #$20                  ; 2
    sta    ram_E3                ; 3
    lda    ram_8C,X              ; 4
    sta    ram_E2                ; 3
    sta    ram_E4                ; 3
    cpy    #$1F                  ; 2
    bne    .mx0AC                ; 2³
    lda    (ram_DD),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_E1),Y            ; 5
    sta    PF1                   ; 3
    lda    ram_D5                ; 3
    jmp    .mx19F                ; 3

.mx0AC:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_D6                ; 3
    sta    COLUP1                ; 3
    lda    ram_D7                ; 3
    sta    COLUPF                ; 3
    lda    ram_D5                ; 3
    sta    COLUBK                ; 3
    ldy    ram_81                ; 3
.mx0BE:
    dey                          ; 2
    cpy    #$1F                  ; 2
    beq    .mx0D0                ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jsr    .mx13F                ; 6
    nop                          ; 2
    lda    ram_D6                ; 3
    jmp    .mx0BE                ; 3

.mx0D0:
    jsr    .mx13F                ; 6
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    ram_D6                ; 3
    lda    (ram_DD),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_E1),Y            ; 5
    sta    PF1                   ; 3
    lda    ram_D5                ; 3
    jmp    .mx19F                ; 3

    .byte $FF ; |XXXXXXXX| $x0E5  free bytes
    .byte $FF ; |XXXXXXXX| $x0E6
    .byte $FF ; |XXXXXXXX| $x0E7
    .byte $FF ; |XXXXXXXX| $x0E8
    .byte $FF ; |XXXXXXXX| $x0E9
    .byte $FF ; |XXXXXXXX| $x0EA
    .byte $FF ; |XXXXXXXX| $x0EB
    .byte $FF ; |XXXXXXXX| $x0EC
    .byte $FF ; |XXXXXXXX| $x0ED
    .byte $FF ; |XXXXXXXX| $x0EE
    .byte $FF ; |XXXXXXXX| $x0EF
    .byte $FF ; |XXXXXXXX| $x0F0
    .byte $FF ; |XXXXXXXX| $x0F1
    .byte $FF ; |XXXXXXXX| $x0F2
    .byte $FF ; |XXXXXXXX| $x0F3
    .byte $FF ; |XXXXXXXX| $x0F4
    .byte $FF ; |XXXXXXXX| $x0F5
    .byte $FF ; |XXXXXXXX| $x0F6
    .byte $FF ; |XXXXXXXX| $x0F7
    .byte $FF ; |XXXXXXXX| $x0F8
    .byte $FF ; |XXXXXXXX| $x0F9
    .byte $FF ; |XXXXXXXX| $x0FA
    .byte $FF ; |XXXXXXXX| $x0FB
    .byte $FF ; |XXXXXXXX| $x0FC
    .byte $FF ; |XXXXXXXX| $x0FD
    .byte $FF ; |XXXXXXXX| $x0FE
    .byte $FF ; |XXXXXXXX| $x0FF

.mx100:
    jsr    .mx13F                ; 6
    sta.w  HMCLR                 ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jsr    .mx13F                ; 6
    jsr    .mx13F                ; 6
    lda    ram_D6                ; 3
    nop                          ; 2
    tya                          ; 2
    and    #$01                  ; 2
    beq    .mx12C                ; 2³
    lda    (ram_DD),Y            ; 5
    sta.w  GRP1                  ; 4
    iny                          ; 2
    lda    (ram_E1),Y            ; 5
    dey                          ; 2
    sta    PF2                   ; 3
    lda    (ram_E1),Y            ; 5
    sta    PF1                   ; 3
    lda    ram_D5                ; 3
    jmp    .mx19F                ; 3

.mx12C:
    lda    (ram_DD),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_E1),Y            ; 5
    iny                          ; 2
    sta    PF2                   ; 3
    lda    (ram_E1),Y            ; 5
    dey                          ; 2
    sta    PF1                   ; 3
    lda    ram_D5                ; 3
    jmp    .mx140                ; 3

.mx13F:
    rts                          ; 6

.mx140:
    sta    COLUBK                ; 3
.mx142:
    sta    HMOVE                 ; 3
    lda    (ram_E3),Y            ; 5
    sta    COLUPF                ; 3
    lda    (ram_DF),Y            ; 5
    sta    COLUP1                ; 3
    lda    (ram_E5),Y            ; 5
    sta    ENAM0                 ; 3
    dey                          ; 2
    lda    (ram_E1),Y            ; 5
    tax                          ; 2
    cpy    ram_DA                ; 3
    beq    .mx17F                ; 2³
    lda    ram_D9                ; 3
    cmp    ram_C0                ; 3
    bne    .mx16F                ; 2³
    cpy    ram_C1                ; 3
    bne    .mx172                ; 2³
    lda    (ram_E9),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_DD),Y            ; 5
    sta    GRP1                  ; 3
    stx    PF1                   ; 3
    jmp    .mx32D                ; 3

.mx16F:
    nop                          ; 2
    lda    ram_D6                ; 3
.mx172:
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    (ram_DD),Y            ; 5
    sta.w  GRP1                  ; 4
    stx    PF1                   ; 3
    jmp    .mx1A1                ; 3

.mx17F:
    jsr    .mx13F                ; 6
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    (ram_DD),Y            ; 5
    sta    GRP1                  ; 3
    stx    PF1                   ; 3
    stx    PF1                   ; 3
    sta    HMOVE                 ; 3
    lda    (ram_E3),Y            ; 5
    sta    COLUPF                ; 3
    lda    (ram_DF),Y            ; 5
    sta    COLUP1                ; 3
    lda    (ram_E7),Y            ; 5
    sta    ENAM1                 ; 3
    jmp    .mx384                ; 3

.mx19F:
    sta    COLUBK                ; 3
.mx1A1:
    sta    HMOVE                 ; 3
    lda    (ram_E3),Y            ; 5
    sta    COLUPF                ; 3
    lda    (ram_DF),Y            ; 5
    sta    COLUP1                ; 3
    lda    (ram_E7),Y            ; 5
    sta    ENAM1                 ; 3
    dey                          ; 2
    lda    (ram_E1),Y            ; 5
    tax                          ; 2
    cpy    ram_DA                ; 3
    beq    .mx1DE                ; 2³
    lda    ram_D9                ; 3
    cmp    ram_C0                ; 3
    bne    .mx1CE                ; 2³
    cpy    ram_C1                ; 3
    bne    .mx1D1                ; 2³
    lda    (ram_E9),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_DD),Y            ; 5
    sta    GRP1                  ; 3
    stx    PF2                   ; 3
    jmp    .mx200                ; 3

.mx1CE:
    nop                          ; 2
    lda    ram_D6                ; 3
.mx1D1:
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    (ram_DD),Y            ; 5
    sta.w  GRP1                  ; 4
    stx    PF2                   ; 3
    jmp    .mx142                ; 3

.mx1DE:
    jsr    .mx13F                ; 6
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    (ram_DD),Y            ; 5
    sta    GRP1                  ; 3
    stx    PF2                   ; 3
    stx    PF2                   ; 3
    sta    HMOVE                 ; 3
    lda    (ram_E3),Y            ; 5
    sta    COLUPF                ; 3
    lda    (ram_DF),Y            ; 5
    sta    COLUP1                ; 3
    lda    (ram_E5),Y            ; 5
    sta    ENAM0                 ; 3
    jmp    .mx384                ; 3

    .byte $FF ; |XXXXXXXX| $x1FE  free bytes
    .byte $FF ; |XXXXXXXX| $x1FF

.mx200:
    sta    HMOVE                 ; 3
    lda    (ram_E3),Y            ; 5
    sta    COLUPF                ; 3
    lda    (ram_DF),Y            ; 5
    sta    COLUP1                ; 3
    lda    (ram_EB),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_E5),Y            ; 5
    sta    ENAM0                 ; 3
    dey                          ; 2
    lda    (ram_E1),Y            ; 5
    tax                          ; 2
    cpy    ram_DA                ; 3
    beq    .mx234                ; 2³
    nop                          ; 2
    lda    (ram_E9),Y            ; 5
    sta    GRP0                  ; 3
    bne    .mx22B                ; 2³
    lda    (ram_DD),Y            ; 5
    sta.w  GRP1                  ; 4
    stx    PF1                   ; 3
    jmp    .mx1A1                ; 3

.mx22B:
    lda    (ram_DD),Y            ; 5
    sta    GRP1                  ; 3
    stx    PF1                   ; 3
    jmp    .mx32D                ; 3

.mx234:
    lda    (ram_E9),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_DD),Y            ; 5
    nop                          ; 2
    nop                          ; 2
    sta    GRP1                  ; 3
    stx    PF1                   ; 3
    sta    ram_D6                ; 3
    sta    HMOVE                 ; 3
    lda    (ram_E3),Y            ; 5
    sta    COLUPF                ; 3
    lda    (ram_DF),Y            ; 5
    sta    COLUP1                ; 3
    lda    (ram_EB),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_E7),Y            ; 5
    sta    ENAM1                 ; 3
    jmp    .mx257                ; 3

.mx257:
    ldy    #$24                  ; 2
    sec                          ; 2
    lda    ram_E9                ; 3
    sbc    #$25                  ; 2
    sta    ram_E9                ; 3
    lda    ram_EB                ; 3
    sbc    #$25                  ; 2
    sta    ram_EB                ; 3
    lda    (ram_E9),Y            ; 5
    sta    GRP0                  ; 3
    lda    ram_D6                ; 3
    sta    GRP1                  ; 3
    lda    ram_E5                ; 3
    sta    HMOVE                 ; 3
    sbc    #$25                  ; 2
    sta    ram_E5                ; 3
    lda    (ram_EB),Y            ; 5
    sta    COLUP0                ; 3
    lda    ram_E7                ; 3
    sbc    #$25                  ; 2
    sta    ram_E7                ; 3
    lda    (ram_E5),Y            ; 5
    sta    ENAM0                 ; 3
    lda    (ram_E7),Y            ; 5
    sta    ENAM1                 ; 3
    dec    ram_D9                ; 5
    ldx    ram_D9                ; 3
    lda    ram_82,X              ; 4
    sta    ram_DA                ; 3
    dey                          ; 2
    lda    (ram_E9),Y            ; 5
    sta    GRP0                  ; 3
    lda    ram_D6                ; 3
    sta    GRP1                  ; 3
    lda    (ram_EB),Y            ; 5
    sta    HMOVE                 ; 3
    sta    COLUP0                ; 3
    lda    ram_92,X              ; 4
    adc    #$03                  ; 2
.mx2A3:
    sbc    #$0F                  ; 2
    bcs    .mx2A3                ; 2³
    tax                          ; 2
    dey                          ; 2
    lda    (ram_E9),Y            ; 5
    sta.w  RESP1                 ; 4
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_D6                ; 3
    sta    GRP1                  ; 3
    lda    (ram_EB),Y            ; 5
    sta    COLUP0                ; 3
    txa                          ; 2
    adc    #$0F                  ; 2
    tax                          ; 2
    lda    .mx47B,X              ; 4
    sta    HMP1                  ; 3
    ldx    ram_D9                ; 3
    lda    ram_9C,X              ; 4
    sta    NUSIZ1                ; 3
    sta    REFP1                 ; 3
    lda    ram_A1,X              ; 4
    sta    ram_DD                ; 3
    lda    ram_AB,X              ; 4
    sta    ram_DE                ; 3
    dey                          ; 2
    lda    (ram_E9),Y            ; 5
    sta    GRP0                  ; 3
    lda    ram_D6                ; 3
    sta.w  GRP1                  ; 4
    sta    HMOVE                 ; 3
    lda    (ram_EB),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_E5),Y            ; 5
    sta    ENAM0                 ; 3
    lda    (ram_E7),Y            ; 5
    sta    ENAM1                 ; 3
    lda    ram_A6,X              ; 4
    sta    ram_DF                ; 3
    lda    ram_AB,X              ; 4
    sta    ram_E0                ; 3
    lda    ram_87,X              ; 4
    sta    ram_E1                ; 3
    clc                          ; 2
    adc    #$20                  ; 2
    sta    ram_E3                ; 3
    lda    ram_D6                ; 3
    sta    HMCLR                 ; 3
    dey                          ; 2
    lda    (ram_E9),Y            ; 5
    sta    GRP0                  ; 3
    lda    ram_D6                ; 3
    sta    GRP1                  ; 3
    sta    HMOVE                 ; 3
    lda    (ram_EB),Y            ; 5
    sta    COLUP0                ; 3
    lda    ram_8C,X              ; 4
    sta    ram_E4                ; 3
    sta    ram_E2                ; 3
    jsr    .mx13F                ; 6
    jsr    .mx13F                ; 6
    nop                          ; 2
    nop                          ; 2
    dey                          ; 2
    lda    (ram_E1),Y            ; 5
    tax                          ; 2
    lda    (ram_E9),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_DD),Y            ; 5
    sta    GRP1                  ; 3
    stx    PF1                   ; 3
.mx32D:
    sta    HMOVE                 ; 3
    lda    (ram_E3),Y            ; 5
    sta    COLUPF                ; 3
    lda    (ram_DF),Y            ; 5
    sta    COLUP1                ; 3
    lda    (ram_EB),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_E7),Y            ; 5
    sta    ENAM1                 ; 3
    dey                          ; 2
    lda    (ram_E1),Y            ; 5
    tax                          ; 2
    cpy    ram_DA                ; 3
    beq    .mx361                ; 2³
    nop                          ; 2
    lda    (ram_E9),Y            ; 5
    sta    GRP0                  ; 3
    bne    .mx358                ; 2³
    lda    (ram_DD),Y            ; 5
    sta.w  GRP1                  ; 4
    stx    PF2                   ; 3
    jmp    .mx142                ; 3

.mx358:
    lda    (ram_DD),Y            ; 5
    sta    GRP1                  ; 3
    stx    PF2                   ; 3
    jmp    .mx200                ; 3

.mx361:
    lda    (ram_E9),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_DD),Y            ; 5
    nop                          ; 2
    nop                          ; 2
    sta    GRP1                  ; 3
    stx    PF2                   ; 3
    sta    ram_D6                ; 3
    sta    HMOVE                 ; 3
    lda    (ram_E3),Y            ; 5
    sta    COLUPF                ; 3
    lda    (ram_DF),Y            ; 5
    sta    COLUP1                ; 3
    lda    (ram_EB),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_E5),Y            ; 5
    sta    ENAM0                 ; 3
    jmp    .mx257                ; 3

.mx384:
    dec    ram_D9                ; 5
    bmi    .mx3AA                ; 2³
    ldx    ram_D9                ; 3
    lda    ram_82,X              ; 4
    cmp    #$1F                  ; 2
    bcc    .mx3CA                ; 2³
    lda    #$25                  ; 2
    sbc    ram_82,X              ; 4
    tay                          ; 2
    lda    #$00                  ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
.mx39B:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    dey                          ; 2
    bne    .mx39B                ; 2³
    jsr    .mx13F                ; 6
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    ram_D6                ; 3
.mx3AA:
    lda    #$00                  ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    sta    COLUBK                ; 3
    sta.w  RESP0                 ; 4
    sta    RESP1                 ; 3
    jmp    .mxFEB | {1}          ; 3

.mx3CA:
    sta    ram_DA                ; 3
    ldy    #$24                  ; 2
    sec                          ; 2
    lda    ram_E5                ; 3
    sbc    #$25                  ; 2
    sta    ram_E5                ; 3
    lda    ram_E7                ; 3
    sbc    #$25                  ; 2
    sta    ram_E7                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (ram_E5),Y            ; 5
    sta    ENAM0                 ; 3
    lda    (ram_E7),Y            ; 5
    sta    ENAM1                 ; 3
    dey                          ; 2
    jsr    .mx13F                ; 6
    jsr    .mx13F                ; 6
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    (ram_E7),Y            ; 5
    sta.w  ram_D6                ; 4
    lda    (ram_E5),Y            ; 5
    sta    ENAM0                 ; 3
    lda    ram_D6                ; 3
    sta    ENAM1                 ; 3
    sta    HMOVE                 ; 3
    sec                          ; 2
    lda    ram_92,X              ; 4
    adc    #$03                  ; 2
.mx406:
    sbc    #$0F                  ; 2
    bcs    .mx406                ; 2³
    adc    #$0F                  ; 2
    tax                          ; 2
    lda    .mx47B,X              ; 4
    dey                          ; 2
    sta    RESP1                 ; 3
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (ram_E5),Y            ; 5
    sta    ENAM0                 ; 3
    lda    (ram_E7),Y            ; 5
    sta    ENAM1                 ; 3
    ldx    ram_D9                ; 3
    lda    ram_9C,X              ; 4
    sta    NUSIZ1                ; 3
    sta    REFP1                 ; 3
    lda    ram_A1,X              ; 4
    sta    ram_DD                ; 3
    lda    ram_AB,X              ; 4
    sta    ram_DE                ; 3
    sta    HMCLR                 ; 3
    lda    ram_A6,X              ; 4
    sta    ram_DF                ; 3
    lda    ram_AB,X              ; 4
    sta    ram_E0                ; 3
    lda    ram_87,X              ; 4
    sta    ram_E1                ; 3
    clc                          ; 2
    adc    #$20                  ; 2
    dey                          ; 2
    sta    HMOVE                 ; 3
    sta    ram_E3                ; 3
    lda    (ram_E5),Y            ; 5
    sta    ENAM0                 ; 3
    lda    (ram_E7),Y            ; 5
    sta    ENAM1                 ; 3
    lda    ram_8C,X              ; 4
    sta    ram_E4                ; 3
    sta    ram_E2                ; 3
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (ram_E5),Y            ; 5
    sta    ENAM0                 ; 3
    lda    (ram_E7),Y            ; 5
    sta    ENAM1                 ; 3
    jsr    .mx13F                ; 6
    jsr    .mx13F                ; 6
    lda    ram_D6                ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    dey                          ; 2
    lda    (ram_E1),Y            ; 5
    tax                          ; 2
    lda    (ram_DD),Y            ; 5
    sta.w  GRP1                  ; 4
    stx    PF1                   ; 3
    jmp    .mx1A1                ; 3

.mx47B:
    .byte LEFT_6         ; $947B
    .byte LEFT_5         ; $947C
    .byte LEFT_4         ; $947D
    .byte LEFT_3         ; $947E
    .byte LEFT_2         ; $947F
    .byte LEFT_1         ; $9480
    .byte NO_MOTION      ; $9481
    .byte RIGHT_1        ; $9482
    .byte RIGHT_2        ; $9483
    .byte RIGHT_3        ; $9484
    .byte RIGHT_4        ; $9485
    .byte RIGHT_5        ; $9486
    .byte RIGHT_6        ; $9487
    .byte RIGHT_7        ; $9488
    .byte RIGHT_8        ; $9489

.mx48A:
    lda    #$00                  ; 2
    sta.w  HMBL                  ; 4
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sty    HMP0                  ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    ldy    #$06                  ; 2
    sty    ram_D7                ; 3
    lda    ram_D6                ; 3
    clc                          ; 2
    bcc    .mx4A3                ; 3   always branch

.mx4A1:
    sta    HMCLR                 ; 3
.mx4A3:
    ldy    ram_D7                ; 3
    lda    (ram_F7),Y            ; 5
    sta    ram_D6                ; 3
    lda    (ram_F5),Y            ; 5
    tax                          ; 2
    lda    (ram_ED),Y            ; 5
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    (ram_EF),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_F1),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_F3),Y            ; 5
    ldy    ram_D6                ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_D7                ; 5
    bpl    .mx4A1                ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    jmp    .mxFEB | {1}          ; 3

    .byte $FF ; |XXXXXXXX| $x4D9  free bytes
    .byte $FF ; |XXXXXXXX| $x4DA
    .byte $FF ; |XXXXXXXX| $x4DB
    .byte $FF ; |XXXXXXXX| $x4DC
    .byte $FF ; |XXXXXXXX| $x4DD
    .byte $FF ; |XXXXXXXX| $x4DE
    .byte $FF ; |XXXXXXXX| $x4DF
    .byte $FF ; |XXXXXXXX| $x4E0
    .byte $FF ; |XXXXXXXX| $x4E1
    .byte $FF ; |XXXXXXXX| $x4E2
    .byte $FF ; |XXXXXXXX| $x4E3
    .byte $FF ; |XXXXXXXX| $x4E4
    .byte $FF ; |XXXXXXXX| $x4E5
    .byte $FF ; |XXXXXXXX| $x4E6
    .byte $FF ; |XXXXXXXX| $x4E7
    .byte $FF ; |XXXXXXXX| $x4E8
    .byte $FF ; |XXXXXXXX| $x4E9
    .byte $FF ; |XXXXXXXX| $x4EA
    .byte $FF ; |XXXXXXXX| $x4EB
    .byte $FF ; |XXXXXXXX| $x4EC
    .byte $FF ; |XXXXXXXX| $x4ED
    .byte $FF ; |XXXXXXXX| $x4EE
    .byte $FF ; |XXXXXXXX| $x4EF
    .byte $FF ; |XXXXXXXX| $x4F0
    .byte $FF ; |XXXXXXXX| $x4F1
    .byte $FF ; |XXXXXXXX| $x4F2
    .byte $FF ; |XXXXXXXX| $x4F3
    .byte $FF ; |XXXXXXXX| $x4F4
    .byte $FF ; |XXXXXXXX| $x4F5
    .byte $FF ; |XXXXXXXX| $x4F6
    .byte $FF ; |XXXXXXXX| $x4F7
    .byte $FF ; |XXXXXXXX| $x4F8
    .byte $FF ; |XXXXXXXX| $x4F9
    .byte $FF ; |XXXXXXXX| $x4FA
    .byte $FF ; |XXXXXXXX| $x4FB
    .byte $FF ; |XXXXXXXX| $x4FC
    .byte $FF ; |XXXXXXXX| $x4FD
    .byte $FF ; |XXXXXXXX| $x4FE
    .byte $FF ; |XXXXXXXX| $x4FF

    .byte $00 ; |        | $x500
    .byte $00 ; |        | $x501
    .byte $00 ; |        | $x502
    .byte $00 ; |        | $x503
    .byte $00 ; |        | $x504
    .byte $00 ; |        | $x505
    .byte $00 ; |        | $x506
    .byte $00 ; |        | $x507
    .byte $00 ; |        | $x508
    .byte $00 ; |        | $x509
    .byte $00 ; |        | $x50A
    .byte $00 ; |        | $x50B
    .byte $00 ; |        | $x50C
    .byte $00 ; |        | $x50D
    .byte $00 ; |        | $x50E
    .byte $00 ; |        | $x50F
    .byte $00 ; |        | $x510
    .byte $00 ; |        | $x511
    .byte $00 ; |        | $x512
    .byte $00 ; |        | $x513
    .byte $00 ; |        | $x514
    .byte $00 ; |        | $x515
    .byte $00 ; |        | $x516
    .byte $00 ; |        | $x517
    .byte $00 ; |        | $x518
    .byte $00 ; |        | $x519
    .byte $00 ; |        | $x51A
    .byte $00 ; |        | $x51B
    .byte $00 ; |        | $x51C
    .byte $00 ; |        | $x51D
    .byte $00 ; |        | $x51E
    .byte $00 ; |        | $x51F
    .byte $00 ; |        | $x520
    .byte $00 ; |        | $x521
    .byte $00 ; |        | $x522
    .byte $00 ; |        | $x523
    .byte $00 ; |        | $x524
    .byte $00 ; |        | $x525
    .byte $00 ; |        | $x526
    .byte $00 ; |        | $x527
    .byte $00 ; |        | $x528
    .byte $00 ; |        | $x529
    .byte $00 ; |        | $x52A
    .byte $00 ; |        | $x52B
    .byte $00 ; |        | $x52C
    .byte $00 ; |        | $x52D
    .byte $00 ; |        | $x52E
    .byte $00 ; |        | $x52F
    .byte $00 ; |        | $x530
    .byte $00 ; |        | $x531
    .byte $00 ; |        | $x532
    .byte $00 ; |        | $x533
    .byte $00 ; |        | $x534
    .byte $00 ; |        | $x535
    .byte $00 ; |        | $x536
    .byte $00 ; |        | $x537
    .byte $00 ; |        | $x538
    .byte $00 ; |        | $x539
    .byte $00 ; |        | $x53A
    .byte $00 ; |        | $x53B
    .byte $00 ; |        | $x53C
    .byte $00 ; |        | $x53D
    .byte $00 ; |        | $x53E
    .byte $00 ; |        | $x53F
    .byte $00 ; |        | $x540
    .byte $00 ; |        | $x541
    .byte $00 ; |        | $x542
    .byte $00 ; |        | $x543
    .byte $00 ; |        | $x544
    .byte $00 ; |        | $x545
    .byte $00 ; |        | $x546
    .byte $00 ; |        | $x547
    .byte $00 ; |        | $x548
    .byte $00 ; |        | $x549
    .byte $00 ; |        | $x54A
    .byte $00 ; |        | $x54B
    .byte $00 ; |        | $x54C
    .byte $00 ; |        | $x54D
    .byte $00 ; |        | $x54E
    .byte $00 ; |        | $x54F
    .byte $00 ; |        | $x550
    .byte $00 ; |        | $x551
    .byte $00 ; |        | $x552
    .byte $00 ; |        | $x553
    .byte $00 ; |        | $x554
    .byte $00 ; |        | $x555
    .byte $00 ; |        | $x556
    .byte $00 ; |        | $x557
    .byte $00 ; |        | $x558
    .byte $00 ; |        | $x559
    .byte $00 ; |        | $x55A
    .byte $00 ; |        | $x55B
    .byte $00 ; |        | $x55C
    .byte $00 ; |        | $x55D
    .byte $00 ; |        | $x55E
    .byte $00 ; |        | $x55F
    .byte $00 ; |        | $x560
    .byte $00 ; |        | $x561
    .byte $00 ; |        | $x562
    .byte $00 ; |        | $x563
    .byte $00 ; |        | $x564
    .byte $00 ; |        | $x565
    .byte $00 ; |        | $x566
    .byte $00 ; |        | $x567
    .byte $00 ; |        | $x568
    .byte $00 ; |        | $x569
    .byte $00 ; |        | $x56A
    .byte $00 ; |        | $x56B
    .byte $00 ; |        | $x56C
    .byte $00 ; |        | $x56D
    .byte $00 ; |        | $x56E
    .byte $00 ; |        | $x56F
    .byte $00 ; |        | $x570
    .byte $00 ; |        | $x571
    .byte $00 ; |        | $x572
    .byte $00 ; |        | $x573
    .byte $00 ; |        | $x574
    .byte $00 ; |        | $x575
    .byte $00 ; |        | $x576
    .byte $00 ; |        | $x577
    .byte $00 ; |        | $x578
    .byte $00 ; |        | $x579
    .byte $00 ; |        | $x57A
    .byte $00 ; |        | $x57B
    .byte $00 ; |        | $x57C
    .byte $00 ; |        | $x57D
    .byte $00 ; |        | $x57E
    .byte $00 ; |        | $x57F
    .byte $00 ; |        | $x580
    .byte $00 ; |        | $x581
    .byte $00 ; |        | $x582
    .byte $00 ; |        | $x583
    .byte $00 ; |        | $x584
    .byte $00 ; |        | $x585
    .byte $00 ; |        | $x586
    .byte $00 ; |        | $x587
    .byte $00 ; |        | $x588
    .byte $00 ; |        | $x589
    .byte $00 ; |        | $x58A
    .byte $00 ; |        | $x58B
    .byte $00 ; |        | $x58C
    .byte $00 ; |        | $x58D
    .byte $00 ; |        | $x58E
    .byte $00 ; |        | $x58F
    .byte $00 ; |        | $x590
    .byte $00 ; |        | $x591
    .byte $00 ; |        | $x592
    .byte $00 ; |        | $x593
    .byte $00 ; |        | $x594
    .byte $00 ; |        | $x595
    .byte $00 ; |        | $x596
    .byte $00 ; |        | $x597
    .byte $00 ; |        | $x598
    .byte $00 ; |        | $x599
    .byte $00 ; |        | $x59A
    .byte $00 ; |        | $x59B
    .byte $00 ; |        | $x59C
    .byte $00 ; |        | $x59D
    .byte $00 ; |        | $x59E
    .byte $00 ; |        | $x59F
    .byte $00 ; |        | $x5A0
    .byte $00 ; |        | $x5A1
    .byte $00 ; |        | $x5A2
    .byte $00 ; |        | $x5A3
    .byte $00 ; |        | $x5A4
    .byte $00 ; |        | $x5A5
    .byte $00 ; |        | $x5A6
    .byte $00 ; |        | $x5A7
    .byte $00 ; |        | $x5A8
    .byte $00 ; |        | $x5A9
    .byte $00 ; |        | $x5AA
    .byte $00 ; |        | $x5AB
    .byte $00 ; |        | $x5AC
    .byte $00 ; |        | $x5AD
    .byte $00 ; |        | $x5AE
    .byte $00 ; |        | $x5AF
    .byte $00 ; |        | $x5B0
    .byte $00 ; |        | $x5B1
    .byte $02 ; |      X | $x5B2
    .byte $02 ; |      X | $x5B3
    .byte $00 ; |        | $x5B4
    .byte $00 ; |        | $x5B5
    .byte $00 ; |        | $x5B6
    .byte $00 ; |        | $x5B7
    .byte $00 ; |        | $x5B8
    .byte $00 ; |        | $x5B9
    .byte $00 ; |        | $x5BA
    .byte $00 ; |        | $x5BB
    .byte $00 ; |        | $x5BC
    .byte $00 ; |        | $x5BD
    .byte $00 ; |        | $x5BE
    .byte $00 ; |        | $x5BF
    .byte $00 ; |        | $x5C0
    .byte $00 ; |        | $x5C1
    .byte $00 ; |        | $x5C2
    .byte $00 ; |        | $x5C3
    .byte $00 ; |        | $x5C4
    .byte $00 ; |        | $x5C5
    .byte $00 ; |        | $x5C6
    .byte $00 ; |        | $x5C7
    .byte $00 ; |        | $x5C8
    .byte $00 ; |        | $x5C9
    .byte $00 ; |        | $x5CA
    .byte $00 ; |        | $x5CB
    .byte $00 ; |        | $x5CC
    .byte $00 ; |        | $x5CD
    .byte $00 ; |        | $x5CE
    .byte $00 ; |        | $x5CF
    .byte $00 ; |        | $x5D0
    .byte $00 ; |        | $x5D1
    .byte $00 ; |        | $x5D2
    .byte $00 ; |        | $x5D3
    .byte $00 ; |        | $x5D4
    .byte $00 ; |        | $x5D5
    .byte $00 ; |        | $x5D6
    .byte $00 ; |        | $x5D7
    .byte $00 ; |        | $x5D8
    .byte $00 ; |        | $x5D9
    .byte $00 ; |        | $x5DA
    .byte $00 ; |        | $x5DB
    .byte $00 ; |        | $x5DC
    .byte $00 ; |        | $x5DD
    .byte $00 ; |        | $x5DE
    .byte $00 ; |        | $x5DF
    .byte $00 ; |        | $x5E0
    .byte $00 ; |        | $x5E1
    .byte $00 ; |        | $x5E2
    .byte $00 ; |        | $x5E3
    .byte $00 ; |        | $x5E4
    .byte $00 ; |        | $x5E5
    .byte $00 ; |        | $x5E6
    .byte $00 ; |        | $x5E7
    .byte $00 ; |        | $x5E8
    .byte $00 ; |        | $x5E9
    .byte $00 ; |        | $x5EA
    .byte $00 ; |        | $x5EB
    .byte $00 ; |        | $x5EC
    .byte $00 ; |        | $x5ED
    .byte $00 ; |        | $x5EE
    .byte $00 ; |        | $x5EF
    .byte $00 ; |        | $x5F0
    .byte $00 ; |        | $x5F1
    .byte $00 ; |        | $x5F2
    .byte $00 ; |        | $x5F3
    .byte $00 ; |        | $x5F4
    .byte $00 ; |        | $x5F5
    .byte $00 ; |        | $x5F6
    .byte $00 ; |        | $x5F7
    .byte $00 ; |        | $x5F8
    .byte $00 ; |        | $x5F9
    .byte $00 ; |        | $x5FA
    .byte $00 ; |        | $x5FB
    .byte $00 ; |        | $x5FC
    .byte $00 ; |        | $x5FD
    .byte $00 ; |        | $x5FE
    .byte $00 ; |        | $x5FF
    .byte $00 ; |        | $x600
    .byte $00 ; |        | $x601
    .byte $00 ; |        | $x602
    .byte $00 ; |        | $x603
    .byte $00 ; |        | $x604
    .byte $00 ; |        | $x605
    .byte $00 ; |        | $x606
    .byte $00 ; |        | $x607
    .byte $00 ; |        | $x608
    .byte $00 ; |        | $x609
    .byte $00 ; |        | $x60A
    .byte $00 ; |        | $x60B
    .byte $00 ; |        | $x60C
    .byte $00 ; |        | $x60D
    .byte $00 ; |        | $x60E
    .byte $00 ; |        | $x60F
    .byte $00 ; |        | $x610
    .byte $00 ; |        | $x611
    .byte $00 ; |        | $x612
    .byte $00 ; |        | $x613
    .byte $00 ; |        | $x614
    .byte $00 ; |        | $x615
    .byte $00 ; |        | $x616
    .byte $00 ; |        | $x617
    .byte $00 ; |        | $x618
    .byte $00 ; |        | $x619
    .byte $00 ; |        | $x61A
    .byte $00 ; |        | $x61B
    .byte $00 ; |        | $x61C
    .byte $00 ; |        | $x61D
    .byte $00 ; |        | $x61E
    .byte $00 ; |        | $x61F
    .byte $00 ; |        | $x620
    .byte $00 ; |        | $x621
    .byte $00 ; |        | $x622
    .byte $00 ; |        | $x623
    .byte $00 ; |        | $x624
    .byte $00 ; |        | $x625
    .byte $00 ; |        | $x626
    .byte $00 ; |        | $x627
    .byte $00 ; |        | $x628
    .byte $00 ; |        | $x629
    .byte $00 ; |        | $x62A
    .byte $00 ; |        | $x62B
    .byte $00 ; |        | $x62C
    .byte $00 ; |        | $x62D
    .byte $00 ; |        | $x62E
    .byte $00 ; |        | $x62F
    .byte $00 ; |        | $x630
    .byte $00 ; |        | $x631
    .byte $00 ; |        | $x632
    .byte $00 ; |        | $x633
    .byte $00 ; |        | $x634
    .byte $00 ; |        | $x635
    .byte $00 ; |        | $x636
    .byte $00 ; |        | $x637
    .byte $00 ; |        | $x638
    .byte $00 ; |        | $x639
    .byte $00 ; |        | $x63A
    .byte $00 ; |        | $x63B
    .byte $00 ; |        | $x63C
    .byte $00 ; |        | $x63D
    .byte $00 ; |        | $x63E
    .byte $00 ; |        | $x63F
    .byte $00 ; |        | $x640
    .byte $00 ; |        | $x641
    .byte $00 ; |        | $x642
    .byte $00 ; |        | $x643
    .byte $00 ; |        | $x644
    .byte $00 ; |        | $x645
    .byte $00 ; |        | $x646
    .byte $00 ; |        | $x647
    .byte $00 ; |        | $x648
    .byte $00 ; |        | $x649
    .byte $00 ; |        | $x64A
    .byte $00 ; |        | $x64B
    .byte $00 ; |        | $x64C
    .byte $00 ; |        | $x64D
    .byte $00 ; |        | $x64E
    .byte $00 ; |        | $x64F
    .byte $00 ; |        | $x650
    .byte $00 ; |        | $x651
    .byte $00 ; |        | $x652
    .byte $00 ; |        | $x653
    .byte $00 ; |        | $x654
    .byte $00 ; |        | $x655
    .byte $00 ; |        | $x656
    .byte $00 ; |        | $x657
    .byte $00 ; |        | $x658
    .byte $00 ; |        | $x659
    .byte $00 ; |        | $x65A
    .byte $00 ; |        | $x65B
    .byte $00 ; |        | $x65C
    .byte $00 ; |        | $x65D
    .byte $00 ; |        | $x65E
    .byte $00 ; |        | $x65F
    .byte $00 ; |        | $x660
    .byte $00 ; |        | $x661
    .byte $00 ; |        | $x662
    .byte $02 ; |      X | $x663
    .byte $02 ; |      X | $x664
    .byte $00 ; |        | $x665
    .byte $00 ; |        | $x666
    .byte $00 ; |        | $x667
    .byte $00 ; |        | $x668
    .byte $00 ; |        | $x669
    .byte $00 ; |        | $x66A
    .byte $00 ; |        | $x66B
    .byte $00 ; |        | $x66C
    .byte $00 ; |        | $x66D
    .byte $00 ; |        | $x66E
    .byte $00 ; |        | $x66F
    .byte $00 ; |        | $x670
    .byte $00 ; |        | $x671
    .byte $00 ; |        | $x672
    .byte $00 ; |        | $x673
    .byte $00 ; |        | $x674
    .byte $00 ; |        | $x675
    .byte $00 ; |        | $x676
    .byte $00 ; |        | $x677
    .byte $00 ; |        | $x678
    .byte $00 ; |        | $x679
    .byte $00 ; |        | $x67A
    .byte $00 ; |        | $x67B
    .byte $00 ; |        | $x67C
    .byte $00 ; |        | $x67D
    .byte $00 ; |        | $x67E
    .byte $00 ; |        | $x67F
    .byte $00 ; |        | $x680
    .byte $00 ; |        | $x681
    .byte $00 ; |        | $x682
    .byte $00 ; |        | $x683
    .byte $00 ; |        | $x684
    .byte $00 ; |        | $x685
    .byte $00 ; |        | $x686
    .byte $00 ; |        | $x687
    .byte $00 ; |        | $x688
    .byte $00 ; |        | $x689
    .byte $00 ; |        | $x68A
    .byte $00 ; |        | $x68B
    .byte $00 ; |        | $x68C
    .byte $00 ; |        | $x68D
    .byte $00 ; |        | $x68E
    .byte $00 ; |        | $x68F
    .byte $00 ; |        | $x690
    .byte $00 ; |        | $x691
    .byte $00 ; |        | $x692
    .byte $00 ; |        | $x693
    .byte $00 ; |        | $x694
    .byte $00 ; |        | $x695
    .byte $00 ; |        | $x696
    .byte $00 ; |        | $x697
    .byte $00 ; |        | $x698
    .byte $00 ; |        | $x699
    .byte $00 ; |        | $x69A
    .byte $00 ; |        | $x69B
    .byte $00 ; |        | $x69C
    .byte $00 ; |        | $x69D
    .byte $00 ; |        | $x69E
    .byte $00 ; |        | $x69F
    .byte $00 ; |        | $x6A0
    .byte $00 ; |        | $x6A1
    .byte $00 ; |        | $x6A2
    .byte $00 ; |        | $x6A3
    .byte $00 ; |        | $x6A4
    .byte $00 ; |        | $x6A5
    .byte $00 ; |        | $x6A6
    .byte $00 ; |        | $x6A7
    .byte $00 ; |        | $x6A8
    .byte $00 ; |        | $x6A9
    .byte $00 ; |        | $x6AA
    .byte $00 ; |        | $x6AB
    .byte $00 ; |        | $x6AC
    .byte $00 ; |        | $x6AD
    .byte $00 ; |        | $x6AE
    .byte $00 ; |        | $x6AF
    .byte $00 ; |        | $x6B0
    .byte $00 ; |        | $x6B1
    .byte $00 ; |        | $x6B2
    .byte $00 ; |        | $x6B3
    .byte $00 ; |        | $x6B4
    .byte $00 ; |        | $x6B5
    .byte $00 ; |        | $x6B6
    .byte $00 ; |        | $x6B7
    .byte $00 ; |        | $x6B8
    .byte $00 ; |        | $x6B9
    .byte $00 ; |        | $x6BA
    .byte $00 ; |        | $x6BB
    .byte $00 ; |        | $x6BC
    .byte $00 ; |        | $x6BD
    .byte $00 ; |        | $x6BE
    .byte $00 ; |        | $x6BF
    .byte $00 ; |        | $x6C0
    .byte $00 ; |        | $x6C1
    .byte $00 ; |        | $x6C2
    .byte $00 ; |        | $x6C3
    .byte $00 ; |        | $x6C4
    .byte $00 ; |        | $x6C5
    .byte $00 ; |        | $x6C6
    .byte $00 ; |        | $x6C7
    .byte $00 ; |        | $x6C8
    .byte $00 ; |        | $x6C9
    .byte $00 ; |        | $x6CA
    .byte $00 ; |        | $x6CB
    .byte $00 ; |        | $x6CC
    .byte $00 ; |        | $x6CD
    .byte $00 ; |        | $x6CE
    .byte $00 ; |        | $x6CF
    .byte $00 ; |        | $x6D0
    .byte $00 ; |        | $x6D1
    .byte $00 ; |        | $x6D2
    .byte $00 ; |        | $x6D3
    .byte $00 ; |        | $x6D4
    .byte $00 ; |        | $x6D5
    .byte $00 ; |        | $x6D6
    .byte $00 ; |        | $x6D7
    .byte $00 ; |        | $x6D8
    .byte $00 ; |        | $x6D9
    .byte $00 ; |        | $x6DA
    .byte $00 ; |        | $x6DB
    .byte $00 ; |        | $x6DC
    .byte $00 ; |        | $x6DD
    .byte $00 ; |        | $x6DE
    .byte $00 ; |        | $x6DF
    .byte $00 ; |        | $x6E0
    .byte $00 ; |        | $x6E1
    .byte $00 ; |        | $x6E2
    .byte $00 ; |        | $x6E3
    .byte $00 ; |        | $x6E4
    .byte $00 ; |        | $x6E5
    .byte $00 ; |        | $x6E6
    .byte $00 ; |        | $x6E7
    .byte $00 ; |        | $x6E8
    .byte $00 ; |        | $x6E9
    .byte $00 ; |        | $x6EA
    .byte $00 ; |        | $x6EB
    .byte $00 ; |        | $x6EC
    .byte $00 ; |        | $x6ED
    .byte $00 ; |        | $x6EE
    .byte $00 ; |        | $x6EF
    .byte $00 ; |        | $x6F0
    .byte $00 ; |        | $x6F1

    .byte $FF ; |XXXXXXXX| $x6F2  free bytes
    .byte $FF ; |XXXXXXXX| $x6F3
    .byte $FF ; |XXXXXXXX| $x6F4
    .byte $FF ; |XXXXXXXX| $x6F5
    .byte $FF ; |XXXXXXXX| $x6F6
    .byte $FF ; |XXXXXXXX| $x6F7
    .byte $FF ; |XXXXXXXX| $x6F8
    .byte $FF ; |XXXXXXXX| $x6F9
    .byte $FF ; |XXXXXXXX| $x6FA
    .byte $FF ; |XXXXXXXX| $x6FB
    .byte $FF ; |XXXXXXXX| $x6FC
    .byte $FF ; |XXXXXXXX| $x6FD
    .byte $FF ; |XXXXXXXX| $x6FE
    .byte $FF ; |XXXXXXXX| $x6FF

    .byte $00 ; |        | $x700
    .byte $00 ; |        | $x701
    .byte $00 ; |        | $x702
    .byte $00 ; |        | $x703
    .byte $00 ; |        | $x704
    .byte $00 ; |        | $x705
    .byte $00 ; |        | $x706
    .byte $00 ; |        | $x707
    .byte $00 ; |        | $x708
    .byte $00 ; |        | $x709
    .byte $00 ; |        | $x70A
    .byte $00 ; |        | $x70B
    .byte $00 ; |        | $x70C
    .byte $00 ; |        | $x70D
    .byte $80 ; |X       | $x70E
    .byte $C0 ; |XX      | $x70F
    .byte $60 ; | XX     | $x710
    .byte $FC ; |XXXXXX  | $x711
    .byte $FC ; |XXXXXX  | $x712
    .byte $7C ; | XXXXX  | $x713
    .byte $18 ; |   XX   | $x714
    .byte $18 ; |   XX   | $x715
    .byte $3C ; |  XXXX  | $x716
    .byte $3C ; |  XXXX  | $x717
    .byte $18 ; |   XX   | $x718
    .byte $00 ; |        | $x719
    .byte $00 ; |        | $x71A
    .byte $00 ; |        | $x71B
    .byte $00 ; |        | $x71C
    .byte $00 ; |        | $x71D
    .byte $00 ; |        | $x71E
    .byte $00 ; |        | $x71F
    .byte $00 ; |        | $x720
    .byte $00 ; |        | $x721
    .byte $00 ; |        | $x722
    .byte $00 ; |        | $x723
    .byte $00 ; |        | $x724
    .byte $00 ; |        | $x725
    .byte $00 ; |        | $x726
    .byte $00 ; |        | $x727
    .byte $E0 ; |XXX     | $x728
    .byte $78 ; | XXXX   | $x729
    .byte $0C ; |    XX  | $x72A
    .byte $40 ; | X      | $x72B
    .byte $C0 ; |XX      | $x72C
    .byte $E4 ; |XXX  X  | $x72D
    .byte $6C ; | XX XX  | $x72E
    .byte $7C ; | XXXXX  | $x72F
    .byte $78 ; | XXXX   | $x730
    .byte $78 ; | XXXX   | $x731
    .byte $3C ; |  XXXX  | $x732
    .byte $58 ; | X XX   | $x733
    .byte $AC ; |X X XX  | $x734
    .byte $AE ; |X X XXX | $x735
    .byte $DA ; |XX XX X | $x736
    .byte $FE ; |XXXXXXX | $x737
    .byte $7C ; | XXXXX  | $x738
    .byte $7C ; | XXXXX  | $x739
    .byte $78 ; | XXXX   | $x73A
    .byte $30 ; |  XX    | $x73B
    .byte $48 ; | X  X   | $x73C
    .byte $78 ; | XXXX   | $x73D
    .byte $58 ; | X XX   | $x73E
    .byte $30 ; |  XX    | $x73F
    .byte $00 ; |        | $x740
    .byte $00 ; |        | $x741
    .byte $00 ; |        | $x742
    .byte $00 ; |        | $x743
    .byte $00 ; |        | $x744
    .byte $00 ; |        | $x745
    .byte $00 ; |        | $x746
    .byte $00 ; |        | $x747
    .byte $0E ; |    XXX | $x748
    .byte $3C ; |  XXXX  | $x749
    .byte $60 ; | XX     | $x74A
    .byte $04 ; |     X  | $x74B
    .byte $06 ; |     XX | $x74C
    .byte $4E ; | X  XXX | $x74D
    .byte $6C ; | XX XX  | $x74E
    .byte $7C ; | XXXXX  | $x74F
    .byte $3C ; |  XXXX  | $x750
    .byte $3C ; |  XXXX  | $x751
    .byte $78 ; | XXXX   | $x752
    .byte $28 ; |  X X   | $x753
    .byte $54 ; | X X X  | $x754
    .byte $54 ; | X X X  | $x755
    .byte $4C ; | X  XX  | $x756
    .byte $7C ; | XXXXX  | $x757
    .byte $78 ; | XXXX   | $x758
    .byte $78 ; | XXXX   | $x759
    .byte $38 ; |  XXX   | $x75A
    .byte $18 ; |   XX   | $x75B
    .byte $24 ; |  X  X  | $x75C
    .byte $3C ; |  XXXX  | $x75D
    .byte $2C ; |  X XX  | $x75E
    .byte $18 ; |   XX   | $x75F
    .byte $00 ; |        | $x760
    .byte $00 ; |        | $x761
    .byte $00 ; |        | $x762
    .byte $00 ; |        | $x763
    .byte $00 ; |        | $x764
    .byte $00 ; |        | $x765
    .byte $00 ; |        | $x766
    .byte $00 ; |        | $x767
    .byte $0C ; |    XX  | $x768
    .byte $38 ; |  XXX   | $x769
    .byte $60 ; | XX     | $x76A
    .byte $60 ; | XX     | $x76B
    .byte $04 ; |     X  | $x76C
    .byte $0C ; |    XX  | $x76D
    .byte $4C ; | X  XX  | $x76E
    .byte $7C ; | XXXXX  | $x76F
    .byte $78 ; | XXXX   | $x770
    .byte $78 ; | XXXX   | $x771
    .byte $3C ; |  XXXX  | $x772
    .byte $78 ; | XXXX   | $x773
    .byte $FC ; |XXXXXX  | $x774
    .byte $B6 ; |X XX XX | $x775
    .byte $EA ; |XXX X X | $x776
    .byte $DE ; |XX XXXX | $x777
    .byte $BE ; |X XXXXX | $x778
    .byte $7C ; | XXXXX  | $x779
    .byte $38 ; |  XXX   | $x77A
    .byte $30 ; |  XX    | $x77B
    .byte $38 ; |  XXX   | $x77C
    .byte $78 ; | XXXX   | $x77D
    .byte $58 ; | X XX   | $x77E
    .byte $30 ; |  XX    | $x77F
    .byte $00 ; |        | $x780
    .byte $00 ; |        | $x781
    .byte $00 ; |        | $x782
    .byte $00 ; |        | $x783
    .byte $00 ; |        | $x784
    .byte $00 ; |        | $x785
    .byte $00 ; |        | $x786
    .byte $00 ; |        | $x787
    .byte $60 ; | XX     | $x788
    .byte $38 ; |  XXX   | $x789
    .byte $0C ; |    XX  | $x78A
    .byte $0C ; |    XX  | $x78B
    .byte $40 ; | X      | $x78C
    .byte $60 ; | XX     | $x78D
    .byte $64 ; | XX  X  | $x78E
    .byte $7C ; | XXXXX  | $x78F
    .byte $3C ; |  XXXX  | $x790
    .byte $3C ; |  XXXX  | $x791
    .byte $78 ; | XXXX   | $x792
    .byte $3C ; |  XXXX  | $x793
    .byte $76 ; | XXX XX | $x794
    .byte $6A ; | XX X X | $x795
    .byte $6E ; | XX XXX | $x796
    .byte $5C ; | X XXX  | $x797
    .byte $7C ; | XXXXX  | $x798
    .byte $58 ; | X XX   | $x799
    .byte $38 ; |  XXX   | $x79A
    .byte $18 ; |   XX   | $x79B
    .byte $38 ; |  XXX   | $x79C
    .byte $3C ; |  XXXX  | $x79D
    .byte $2C ; |  X XX  | $x79E
    .byte $18 ; |   XX   | $x79F
    .byte $00 ; |        | $x7A0
    .byte $00 ; |        | $x7A1
    .byte $00 ; |        | $x7A2
    .byte $00 ; |        | $x7A3
    .byte $00 ; |        | $x7A4
    .byte $00 ; |        | $x7A5
    .byte $00 ; |        | $x7A6
    .byte $00 ; |        | $x7A7
    .byte $86 ; |X    XX | $x7A8
    .byte $86 ; |X    XX | $x7A9
    .byte $86 ; |X    XX | $x7AA
    .byte $86 ; |X    XX | $x7AB
    .byte $86 ; |X    XX | $x7AC
    .byte $86 ; |X    XX | $x7AD
    .byte $82 ; |X     X | $x7AE
    .byte $84 ; |X    X  | $x7AF
    .byte $84 ; |X    X  | $x7B0
    .byte $86 ; |X    XX | $x7B1
    .byte $86 ; |X    XX | $x7B2
    .byte $86 ; |X    XX | $x7B3
    .byte $80 ; |X       | $x7B4
    .byte $EE ; |XXX XXX | $x7B5
    .byte $84 ; |X    X  | $x7B6
    .byte $88 ; |X   X   | $x7B7
    .byte $80 ; |X       | $x7B8
    .byte $80 ; |X       | $x7B9
    .byte $80 ; |X       | $x7BA
    .byte $86 ; |X    XX | $x7BB
    .byte $86 ; |X    XX | $x7BC
    .byte $86 ; |X    XX | $x7BD
    .byte $86 ; |X    XX | $x7BE
    .byte $86 ; |X    XX | $x7BF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  IF {1} = BK_9000
    .byte $28 ; |  X X   | $97C0
    .byte $26 ; |  X  XX | $97C1
    .byte $28 ; |  X X   | $97C2
    .byte $28 ; |  X X   | $97C3
  ENDIF
  IF {1} = BK_B000
    .byte $C8 ; |XX  X   | $B7C0
    .byte $C6 ; |XX   XX | $B7C1
    .byte $C8 ; |XX  X   | $B7C2
    .byte $C8 ; |XX  X   | $B7C3
  ENDIF
  IF {1} = BK_D000
    .byte $18 ; |   XX   | $D7C0
    .byte $16 ; |   X XX | $D7C1
    .byte $18 ; |   XX   | $D7C2
    .byte $18 ; |   XX   | $D7C3
  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $A0 ; |X X     | $x7C4
    .byte $A0 ; |X X     | $x7C5
    .byte $A6 ; |X X  XX | $x7C6
    .byte $A6 ; |X X  XX | $x7C7
    .byte $A6 ; |X X  XX | $x7C8
    .byte $A6 ; |X X  XX | $x7C9
    .byte $A0 ; |X X     | $x7CA
    .byte $A6 ; |X X  XX | $x7CB
    .byte $A6 ; |X X  XX | $x7CC
    .byte $A6 ; |X X  XX | $x7CD
    .byte $A6 ; |X X  XX | $x7CE
    .byte $A6 ; |X X  XX | $x7CF
    .byte $A6 ; |X X  XX | $x7D0
    .byte $A6 ; |X X  XX | $x7D1
    .byte $B0 ; |X XX    | $x7D2
    .byte $EE ; |XXX XXX | $x7D3
    .byte $B0 ; |X XX    | $x7D4
    .byte $B4 ; |X XX X  | $x7D5
    .byte $B8 ; |X XXX   | $x7D6
    .byte $B0 ; |X XX    | $x7D7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  IF {1} = BK_9000
    .byte $28 ; |  X X   | $97D8
    .byte $26 ; |  X  XX | $97D9
    .byte $28 ; |  X X   | $97DA
    .byte $28 ; |  X X   | $97DB
  ENDIF
  IF {1} = BK_B000
    .byte $C8 ; |XX  X   | $B7D8
    .byte $C6 ; |XX   XX | $B7D9
    .byte $C8 ; |XX  X   | $B7DA
    .byte $C8 ; |XX  X   | $B7DB
  ENDIF
  IF {1} = BK_D000
LD7D8:
    .byte $18 ; |   XX   | $D7D8
    .byte $16 ; |   X XX | $D7D9
    .byte $18 ; |   XX   | $D7DA
    .byte $18 ; |   XX   | $D7DB
  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    .byte $80 ; |X       | $x7DC
    .byte $80 ; |X       | $x7DD
    .byte $86 ; |X    XX | $x7DE
    .byte $86 ; |X    XX | $x7DF
    .byte $86 ; |X    XX | $x7E0
    .byte $86 ; |X    XX | $x7E1
    .byte $80 ; |X       | $x7E2
    .byte $86 ; |X    XX | $x7E3
    .byte $86 ; |X    XX | $x7E4
    .byte $86 ; |X    XX | $x7E5
    .byte $86 ; |X    XX | $x7E6
    .byte $86 ; |X    XX | $x7E7
    .byte $86 ; |X    XX | $x7E8
    .byte $86 ; |X    XX | $x7E9
    .byte $A0 ; |X X     | $x7EA
    .byte $EE ; |XXX XXX | $x7EB
    .byte $A0 ; |X X     | $x7EC
    .byte $A4 ; |X X  X  | $x7ED
    .byte $A8 ; |X X X   | $x7EE
    .byte $A0 ; |X X     | $x7EF

    .byte $FF ; |XXXXXXXX| $x7F0  free bytes
    .byte $FF ; |XXXXXXXX| $x7F1
    .byte $FF ; |XXXXXXXX| $x7F2
    .byte $FF ; |XXXXXXXX| $x7F3
    .byte $FF ; |XXXXXXXX| $x7F4
    .byte $FF ; |XXXXXXXX| $x7F5
    .byte $FF ; |XXXXXXXX| $x7F6
    .byte $FF ; |XXXXXXXX| $x7F7
    .byte $FF ; |XXXXXXXX| $x7F8
    .byte $FF ; |XXXXXXXX| $x7F9
    .byte $FF ; |XXXXXXXX| $x7FA
    .byte $FF ; |XXXXXXXX| $x7FB
    .byte $FF ; |XXXXXXXX| $x7FC
    .byte $FF ; |XXXXXXXX| $x7FD
    .byte $FF ; |XXXXXXXX| $x7FE
    .byte $FF ; |XXXXXXXX| $x7FF

    .byte $00 ; |        | $x800
    .byte $00 ; |        | $x801
    .byte $00 ; |        | $x802
    .byte $00 ; |        | $x803
    .byte $00 ; |        | $x804
    .byte $00 ; |        | $x805
    .byte $00 ; |        | $x806
    .byte $00 ; |        | $x807
    .byte $00 ; |        | $x808
    .byte $00 ; |        | $x809
    .byte $00 ; |        | $x80A
    .byte $00 ; |        | $x80B
    .byte $00 ; |        | $x80C
    .byte $00 ; |        | $x80D
    .byte $4A ; | X  X X | $x80E
    .byte $4E ; | X  XXX | $x80F
    .byte $FF ; |XXXXXXXX| $x810
    .byte $FF ; |XXXXXXXX| $x811
    .byte $FF ; |XXXXXXXX| $x812
    .byte $FF ; |XXXXXXXX| $x813
    .byte $FF ; |XXXXXXXX| $x814
    .byte $BF ; |X XXXXXX| $x815
    .byte $BF ; |X XXXXXX| $x816
    .byte $FF ; |XXXXXXXX| $x817
    .byte $7F ; | XXXXXXX| $x818
    .byte $3F ; |  XXXXXX| $x819
    .byte $3F ; |  XXXXXX| $x81A
    .byte $3F ; |  XXXXXX| $x81B
    .byte $00 ; |        | $x81C
    .byte $00 ; |        | $x81D
    .byte $00 ; |        | $x81E
    .byte $00 ; |        | $x81F
    .byte $00 ; |        | $x820
    .byte $00 ; |        | $x821
    .byte $00 ; |        | $x822
    .byte $00 ; |        | $x823
    .byte $00 ; |        | $x824
    .byte $00 ; |        | $x825
    .byte $00 ; |        | $x826
    .byte $00 ; |        | $x827
    .byte $00 ; |        | $x828
    .byte $6C ; | XX XX  | $x829
    .byte $28 ; |  X X   | $x82A
    .byte $28 ; |  X X   | $x82B
    .byte $6C ; | XX XX  | $x82C
    .byte $6C ; | XX XX  | $x82D
    .byte $6C ; | XX XX  | $x82E
    .byte $7C ; | XXXXX  | $x82F
    .byte $7C ; | XXXXX  | $x830
    .byte $38 ; |  XXX   | $x831
    .byte $7C ; | XXXXX  | $x832
    .byte $58 ; | X XX   | $x833
    .byte $AC ; |X X XX  | $x834
    .byte $AC ; |X X XX  | $x835
    .byte $DC ; |XX XXX  | $x836
    .byte $FC ; |XXXXXX  | $x837
    .byte $FC ; |XXXXXX  | $x838
    .byte $78 ; | XXXX   | $x839
    .byte $78 ; | XXXX   | $x83A
    .byte $30 ; |  XX    | $x83B
    .byte $48 ; | X  X   | $x83C
    .byte $78 ; | XXXX   | $x83D
    .byte $58 ; | X XX   | $x83E
    .byte $30 ; |  XX    | $x83F
    .byte $00 ; |        | $x840
    .byte $00 ; |        | $x841
    .byte $00 ; |        | $x842
    .byte $00 ; |        | $x843
    .byte $00 ; |        | $x844
    .byte $00 ; |        | $x845
    .byte $00 ; |        | $x846
    .byte $00 ; |        | $x847
    .byte $00 ; |        | $x848
    .byte $6C ; | XX XX  | $x849
    .byte $28 ; |  X X   | $x84A
    .byte $28 ; |  X X   | $x84B
    .byte $6C ; | XX XX  | $x84C
    .byte $6C ; | XX XX  | $x84D
    .byte $6C ; | XX XX  | $x84E
    .byte $7C ; | XXXXX  | $x84F
    .byte $7C ; | XXXXX  | $x850
    .byte $38 ; |  XXX   | $x851
    .byte $7C ; | XXXXX  | $x852
    .byte $3C ; |  XXXX  | $x853
    .byte $76 ; | XXX XX | $x854
    .byte $F2 ; |XXXX  X | $x855
    .byte $EA ; |XXX X X | $x856
    .byte $DE ; |XX XXXX | $x857
    .byte $FC ; |XXXXXX  | $x858
    .byte $38 ; |  XXX   | $x859
    .byte $78 ; | XXXX   | $x85A
    .byte $30 ; |  XX    | $x85B
    .byte $78 ; | XXXX   | $x85C
    .byte $78 ; | XXXX   | $x85D
    .byte $58 ; | X XX   | $x85E
    .byte $30 ; |  XX    | $x85F
    .byte $00 ; |        | $x860
    .byte $00 ; |        | $x861
    .byte $00 ; |        | $x862
    .byte $00 ; |        | $x863
    .byte $00 ; |        | $x864
    .byte $00 ; |        | $x865
    .byte $00 ; |        | $x866
    .byte $00 ; |        | $x867
    .byte $00 ; |        | $x868
    .byte $00 ; |        | $x869
    .byte $00 ; |        | $x86A
    .byte $00 ; |        | $x86B
    .byte $00 ; |        | $x86C
    .byte $00 ; |        | $x86D
    .byte $00 ; |        | $x86E
    .byte $00 ; |        | $x86F
    .byte $00 ; |        | $x870
    .byte $00 ; |        | $x871
    .byte $00 ; |        | $x872
    .byte $00 ; |        | $x873
    .byte $00 ; |        | $x874
    .byte $00 ; |        | $x875
    .byte $00 ; |        | $x876
    .byte $00 ; |        | $x877
    .byte $00 ; |        | $x878
    .byte $00 ; |        | $x879
    .byte $00 ; |        | $x87A
    .byte $00 ; |        | $x87B
    .byte $00 ; |        | $x87C
    .byte $00 ; |        | $x87D
    .byte $00 ; |        | $x87E
    .byte $00 ; |        | $x87F
    .byte $00 ; |        | $x880
    .byte $00 ; |        | $x881
    .byte $00 ; |        | $x882
    .byte $00 ; |        | $x883
    .byte $00 ; |        | $x884
    .byte $00 ; |        | $x885
    .byte $00 ; |        | $x886
    .byte $00 ; |        | $x887
    .byte $02 ; |      X | $x888
    .byte $02 ; |      X | $x889
    .byte $02 ; |      X | $x88A
    .byte $02 ; |      X | $x88B
    .byte $02 ; |      X | $x88C
    .byte $02 ; |      X | $x88D
    .byte $02 ; |      X | $x88E
    .byte $02 ; |      X | $x88F
    .byte $C4 ; |XX   X  | $x890
    .byte $C6 ; |XX   XX | $x891
    .byte $C8 ; |XX  X   | $x892
    .byte $C6 ; |XX   XX | $x893
    .byte $C6 ; |XX   XX | $x894
    .byte $C6 ; |XX   XX | $x895
    .byte $C6 ; |XX   XX | $x896
    .byte $C6 ; |XX   XX | $x897
    .byte $C6 ; |XX   XX | $x898
    .byte $C6 ; |XX   XX | $x899
    .byte $C8 ; |XX  X   | $x89A
    .byte $C8 ; |XX  X   | $x89B
    .byte $02 ; |      X | $x89C
    .byte $02 ; |      X | $x89D
    .byte $02 ; |      X | $x89E
    .byte $02 ; |      X | $x89F
    .byte $A0 ; |X X     | $x8A0
    .byte $A0 ; |X X     | $x8A1
    .byte $A0 ; |X X     | $x8A2
    .byte $A0 ; |X X     | $x8A3
    .byte $A0 ; |X X     | $x8A4
    .byte $A6 ; |X X  XX | $x8A5
    .byte $A6 ; |X X  XX | $x8A6
    .byte $A6 ; |X X  XX | $x8A7
    .byte $A6 ; |X X  XX | $x8A8
    .byte $A6 ; |X X  XX | $x8A9
    .byte $A0 ; |X X     | $x8AA
    .byte $A6 ; |X X  XX | $x8AB
    .byte $A6 ; |X X  XX | $x8AC
    .byte $A6 ; |X X  XX | $x8AD
    .byte $A6 ; |X X  XX | $x8AE
    .byte $A6 ; |X X  XX | $x8AF
    .byte $A6 ; |X X  XX | $x8B0
    .byte $A6 ; |X X  XX | $x8B1
    .byte $B0 ; |X XX    | $x8B2
    .byte $EE ; |XXX XXX | $x8B3
    .byte $B0 ; |X XX    | $x8B4
    .byte $B4 ; |X XX X  | $x8B5
    .byte $B8 ; |X XXX   | $x8B6
    .byte $B0 ; |X XX    | $x8B7
    .byte $80 ; |X       | $x8B8
    .byte $80 ; |X       | $x8B9
    .byte $80 ; |X       | $x8BA
    .byte $80 ; |X       | $x8BB
    .byte $80 ; |X       | $x8BC
    .byte $86 ; |X    XX | $x8BD
    .byte $86 ; |X    XX | $x8BE
    .byte $86 ; |X    XX | $x8BF
    .byte $86 ; |X    XX | $x8C0
    .byte $86 ; |X    XX | $x8C1
    .byte $80 ; |X       | $x8C2
    .byte $86 ; |X    XX | $x8C3
    .byte $86 ; |X    XX | $x8C4
    .byte $86 ; |X    XX | $x8C5
    .byte $86 ; |X    XX | $x8C6
    .byte $86 ; |X    XX | $x8C7
    .byte $86 ; |X    XX | $x8C8
    .byte $86 ; |X    XX | $x8C9
    .byte $80 ; |X       | $x8CA
    .byte $EE ; |XXX XXX | $x8CB
    .byte $80 ; |X       | $x8CC
    .byte $84 ; |X    X  | $x8CD
    .byte $88 ; |X   X   | $x8CE
    .byte $80 ; |X       | $x8CF

    .byte $FF ; |XXXXXXXX| $x8D0  free bytes
    .byte $FF ; |XXXXXXXX| $x8D1
    .byte $FF ; |XXXXXXXX| $x8D2
    .byte $FF ; |XXXXXXXX| $x8D3
    .byte $FF ; |XXXXXXXX| $x8D4
    .byte $FF ; |XXXXXXXX| $x8D5
    .byte $FF ; |XXXXXXXX| $x8D6
    .byte $FF ; |XXXXXXXX| $x8D7
    .byte $FF ; |XXXXXXXX| $x8D8
    .byte $FF ; |XXXXXXXX| $x8D9
    .byte $FF ; |XXXXXXXX| $x8DA
    .byte $FF ; |XXXXXXXX| $x8DB
    .byte $FF ; |XXXXXXXX| $x8DC
    .byte $FF ; |XXXXXXXX| $x8DD
    .byte $FF ; |XXXXXXXX| $x8DE
    .byte $FF ; |XXXXXXXX| $x8DF
    .byte $FF ; |XXXXXXXX| $x8E0
    .byte $FF ; |XXXXXXXX| $x8E1
    .byte $FF ; |XXXXXXXX| $x8E2
    .byte $FF ; |XXXXXXXX| $x8E3
    .byte $FF ; |XXXXXXXX| $x8E4
    .byte $FF ; |XXXXXXXX| $x8E5
    .byte $FF ; |XXXXXXXX| $x8E6
    .byte $FF ; |XXXXXXXX| $x8E7
    .byte $FF ; |XXXXXXXX| $x8E8
    .byte $FF ; |XXXXXXXX| $x8E9
    .byte $FF ; |XXXXXXXX| $x8EA
    .byte $FF ; |XXXXXXXX| $x8EB
    .byte $FF ; |XXXXXXXX| $x8EC
    .byte $FF ; |XXXXXXXX| $x8ED
    .byte $FF ; |XXXXXXXX| $x8EE
    .byte $FF ; |XXXXXXXX| $x8EF
    .byte $FF ; |XXXXXXXX| $x8F0
    .byte $FF ; |XXXXXXXX| $x8F1
    .byte $FF ; |XXXXXXXX| $x8F2
    .byte $FF ; |XXXXXXXX| $x8F3
    .byte $FF ; |XXXXXXXX| $x8F4
    .byte $FF ; |XXXXXXXX| $x8F5
    .byte $FF ; |XXXXXXXX| $x8F6
    .byte $FF ; |XXXXXXXX| $x8F7
    .byte $FF ; |XXXXXXXX| $x8F8
    .byte $FF ; |XXXXXXXX| $x8F9
    .byte $FF ; |XXXXXXXX| $x8FA
    .byte $FF ; |XXXXXXXX| $x8FB
    .byte $FF ; |XXXXXXXX| $x8FC
    .byte $FF ; |XXXXXXXX| $x8FD
    .byte $FF ; |XXXXXXXX| $x8FE
    .byte $FF ; |XXXXXXXX| $x8FF

    .byte $00 ; |        | $x900
    .byte $00 ; |        | $x901
    .byte $00 ; |        | $x902
    .byte $00 ; |        | $x903
    .byte $00 ; |        | $x904
    .byte $00 ; |        | $x905
    .byte $00 ; |        | $x906
    .byte $00 ; |        | $x907
    .byte $E0 ; |XXX     | $x908
    .byte $70 ; | XXX    | $x909
    .byte $70 ; | XXX    | $x90A
    .byte $30 ; |  XX    | $x90B
    .byte $38 ; |  XXX   | $x90C
    .byte $18 ; |   XX   | $x90D
    .byte $18 ; |   XX   | $x90E
    .byte $18 ; |   XX   | $x90F
    .byte $0C ; |    XX  | $x910
    .byte $0C ; |    XX  | $x911
    .byte $0C ; |    XX  | $x912
    .byte $0C ; |    XX  | $x913
    .byte $0C ; |    XX  | $x914
    .byte $06 ; |     XX | $x915
    .byte $06 ; |     XX | $x916
    .byte $06 ; |     XX | $x917
    .byte $06 ; |     XX | $x918
    .byte $06 ; |     XX | $x919
    .byte $06 ; |     XX | $x91A
    .byte $0C ; |    XX  | $x91B
    .byte $0C ; |    XX  | $x91C
    .byte $1E ; |   XXXX | $x91D
    .byte $1E ; |   XXXX | $x91E
    .byte $8D ; |X   XX X| $x91F
    .byte $FF ; |XXXXXXXX| $x920
    .byte $FE ; |XXXXXXX | $x921
    .byte $7D ; | XXXXX X| $x922
    .byte $9F ; |X  XXXXX| $x923
    .byte $FF ; |XXXXXXXX| $x924
    .byte $76 ; | XXX XX | $x925
    .byte $00 ; |        | $x926
    .byte $00 ; |        | $x927
    .byte $00 ; |        | $x928
    .byte $00 ; |        | $x929
    .byte $00 ; |        | $x92A
    .byte $00 ; |        | $x92B
    .byte $00 ; |        | $x92C
    .byte $00 ; |        | $x92D
    .byte $00 ; |        | $x92E
    .byte $00 ; |        | $x92F
    .byte $B4 ; |X XX X  | $x930
    .byte $03 ; |      XX| $x931
    .byte $02 ; |      X | $x932
    .byte $82 ; |X     X | $x933
    .byte $82 ; |X     X | $x934
    .byte $F2 ; |XXXX  X | $x935
    .byte $36 ; |  XX XX | $x936
    .byte $3E ; |  XXXXX | $x937
    .byte $3E ; |  XXXXX | $x938
    .byte $3C ; |  XXXX  | $x939
    .byte $78 ; | XXXX   | $x93A
    .byte $7C ; | XXXXX  | $x93B
    .byte $FF ; |XXXXXXXX| $x93C
    .byte $FF ; |XXXXXXXX| $x93D
    .byte $7C ; | XXXXX  | $x93E
    .byte $3C ; |  XXXX  | $x93F
    .byte $3C ; |  XXXX  | $x940
    .byte $38 ; |  XXX   | $x941
    .byte $30 ; |  XX    | $x942
    .byte $38 ; |  XXX   | $x943
    .byte $3C ; |  XXXX  | $x944
    .byte $2C ; |  X XX  | $x945
    .byte $18 ; |   XX   | $x946
    .byte $18 ; |   XX   | $x947
    .byte $00 ; |        | $x948
    .byte $00 ; |        | $x949
    .byte $00 ; |        | $x94A
    .byte $00 ; |        | $x94B
    .byte $00 ; |        | $x94C
    .byte $00 ; |        | $x94D
    .byte $00 ; |        | $x94E
    .byte $00 ; |        | $x94F
    .byte $EC ; |XXX XX  | $x950
    .byte $0C ; |    XX  | $x951
    .byte $18 ; |   XX   | $x952
    .byte $18 ; |   XX   | $x953
    .byte $08 ; |    X   | $x954
    .byte $0C ; |    XX  | $x955
    .byte $0C ; |    XX  | $x956
    .byte $1C ; |   XXX  | $x957
    .byte $1C ; |   XXX  | $x958
    .byte $1C ; |   XXX  | $x959
    .byte $3C ; |  XXXX  | $x95A
    .byte $7C ; | XXXXX  | $x95B
    .byte $FF ; |XXXXXXXX| $x95C
    .byte $FF ; |XXXXXXXX| $x95D
    .byte $5C ; | X XXX  | $x95E
    .byte $7C ; | XXXXX  | $x95F
    .byte $3C ; |  XXXX  | $x960
    .byte $3C ; |  XXXX  | $x961
    .byte $38 ; |  XXX   | $x962
    .byte $30 ; |  XX    | $x963
    .byte $38 ; |  XXX   | $x964
    .byte $3C ; |  XXXX  | $x965
    .byte $2C ; |  X XX  | $x966
    .byte $18 ; |   XX   | $x967
    .byte $00 ; |        | $x968
    .byte $00 ; |        | $x969
    .byte $00 ; |        | $x96A
    .byte $00 ; |        | $x96B
    .byte $00 ; |        | $x96C
    .byte $00 ; |        | $x96D
    .byte $00 ; |        | $x96E
    .byte $00 ; |        | $x96F
    .byte $5D ; | X XXX X| $x970
    .byte $20 ; |  X     | $x971
    .byte $42 ; | X    X | $x972
    .byte $43 ; | X    XX| $x973
    .byte $42 ; | X    X | $x974
    .byte $62 ; | XX   X | $x975
    .byte $36 ; |  XX XX | $x976
    .byte $3E ; |  XXXXX | $x977
    .byte $3E ; |  XXXXX | $x978
    .byte $1C ; |   XXX  | $x979
    .byte $1E ; |   XXXX | $x97A
    .byte $7C ; | XXXXX  | $x97B
    .byte $FF ; |XXXXXXXX| $x97C
    .byte $FF ; |XXXXXXXX| $x97D
    .byte $5C ; | X XXX  | $x97E
    .byte $7C ; | XXXXX  | $x97F
    .byte $3C ; |  XXXX  | $x980
    .byte $3C ; |  XXXX  | $x981
    .byte $38 ; |  XXX   | $x982
    .byte $30 ; |  XX    | $x983
    .byte $38 ; |  XXX   | $x984
    .byte $3C ; |  XXXX  | $x985
    .byte $2C ; |  X XX  | $x986
    .byte $18 ; |   XX   | $x987
    .byte $00 ; |        | $x988
    .byte $00 ; |        | $x989
    .byte $00 ; |        | $x98A
    .byte $00 ; |        | $x98B
    .byte $00 ; |        | $x98C
    .byte $00 ; |        | $x98D
    .byte $00 ; |        | $x98E
    .byte $00 ; |        | $x98F
    .byte $16 ; |   X XX | $x990
    .byte $14 ; |   X X  | $x991
    .byte $16 ; |   X XX | $x992
    .byte $14 ; |   X X  | $x993
    .byte $14 ; |   X X  | $x994
    .byte $16 ; |   X XX | $x995
    .byte $14 ; |   X X  | $x996
    .byte $16 ; |   X XX | $x997
    .byte $14 ; |   X X  | $x998
    .byte $16 ; |   X XX | $x999
    .byte $14 ; |   X X  | $x99A
    .byte $16 ; |   X XX | $x99B
    .byte $14 ; |   X X  | $x99C
    .byte $14 ; |   X X  | $x99D
    .byte $16 ; |   X XX | $x99E
    .byte $14 ; |   X X  | $x99F
    .byte $16 ; |   X XX | $x9A0
    .byte $14 ; |   X X  | $x9A1
    .byte $16 ; |   X XX | $x9A2
    .byte $14 ; |   X X  | $x9A3
    .byte $16 ; |   X XX | $x9A4
    .byte $14 ; |   X X  | $x9A5
    .byte $14 ; |   X X  | $x9A6
    .byte $B6 ; |X XX XX | $x9A7
    .byte $B6 ; |X XX XX | $x9A8
    .byte $B6 ; |X XX XX | $x9A9
    .byte $B6 ; |X XX XX | $x9AA
    .byte $B6 ; |X XX XX | $x9AB
    .byte $B4 ; |X XX X  | $x9AC
    .byte $B4 ; |X XX X  | $x9AD
    .byte $00 ; |        | $x9AE
    .byte $00 ; |        | $x9AF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  IF {1} = BK_9000
    .byte $26 ; |  X  XX | $99B0
  ENDIF
  IF {1} = BK_B000
    .byte $C6 ; |XX   XX | $B9B0
  ENDIF
  IF {1} = BK_D000
    .byte $16 ; |   X XX | $D9B0
  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $A0 ; |X X     | $x9B1
    .byte $A0 ; |X X     | $x9B2
    .byte $A0 ; |X X     | $x9B3
    .byte $A0 ; |X X     | $x9B4
    .byte $A0 ; |X X     | $x9B5
    .byte $A6 ; |X X  XX | $x9B6
    .byte $A6 ; |X X  XX | $x9B7
    .byte $A6 ; |X X  XX | $x9B8
    .byte $A6 ; |X X  XX | $x9B9
    .byte $A0 ; |X X     | $x9BA
    .byte $A4 ; |X X  X  | $x9BB
    .byte $A6 ; |X X  XX | $x9BC
    .byte $A8 ; |X X X   | $x9BD
    .byte $A6 ; |X X  XX | $x9BE
    .byte $A6 ; |X X  XX | $x9BF
    .byte $A6 ; |X X  XX | $x9C0
    .byte $A6 ; |X X  XX | $x9C1
    .byte $B0 ; |X XX    | $x9C2
    .byte $EE ; |XXX XXX | $x9C3
    .byte $B0 ; |X XX    | $x9C4
    .byte $B4 ; |X XX X  | $x9C5
    .byte $B8 ; |X XXX   | $x9C6
    .byte $B0 ; |X XX    | $x9C7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  IF {1} = BK_9000
    .byte $26 ; |  X  XX | $99C8
  ENDIF
  IF {1} = BK_B000
    .byte $C6 ; |XX   XX | $B9C8
  ENDIF
  IF {1} = BK_D000
LD9C8:
    .byte $16 ; |   X XX | $D9C8
LD9C9:
  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $80 ; |X       | $x9C9
    .byte $80 ; |X       | $x9CA
    .byte $80 ; |X       | $x9CB
    .byte $80 ; |X       | $x9CC
    .byte $80 ; |X       | $x9CD
    .byte $86 ; |X    XX | $x9CE
    .byte $86 ; |X    XX | $x9CF
    .byte $86 ; |X    XX | $x9D0
    .byte $86 ; |X    XX | $x9D1
    .byte $80 ; |X       | $x9D2
    .byte $84 ; |X    X  | $x9D3
    .byte $86 ; |X    XX | $x9D4
    .byte $88 ; |X   X   | $x9D5
    .byte $86 ; |X    XX | $x9D6
    .byte $86 ; |X    XX | $x9D7
    .byte $86 ; |X    XX | $x9D8
    .byte $86 ; |X    XX | $x9D9
    .byte $80 ; |X       | $x9DA
    .byte $EE ; |XXX XXX | $x9DB
    .byte $80 ; |X       | $x9DC
    .byte $84 ; |X    X  | $x9DD
    .byte $88 ; |X   X   | $x9DE
    .byte $80 ; |X       | $x9DF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  IF {1} = BK_9000
    .byte $2A ; |  X X X | $99E0
  ENDIF
  IF {1} = BK_B000
    .byte $CA ; |XX  X X | $B9E0
  ENDIF
  IF {1} = BK_D000
    .byte $1A ; |   XX X | $D9E0
  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $FF ; |XXXXXXXX| $x9E1  free bytes
    .byte $FF ; |XXXXXXXX| $x9E2
    .byte $FF ; |XXXXXXXX| $x9E3
    .byte $FF ; |XXXXXXXX| $x9E4
    .byte $FF ; |XXXXXXXX| $x9E5
    .byte $FF ; |XXXXXXXX| $x9E6
    .byte $FF ; |XXXXXXXX| $x9E7
    .byte $FF ; |XXXXXXXX| $x9E8
    .byte $FF ; |XXXXXXXX| $x9E9
    .byte $FF ; |XXXXXXXX| $x9EA
    .byte $FF ; |XXXXXXXX| $x9EB
    .byte $FF ; |XXXXXXXX| $x9EC
    .byte $FF ; |XXXXXXXX| $x9ED
    .byte $FF ; |XXXXXXXX| $x9EE
    .byte $FF ; |XXXXXXXX| $x9EF
    .byte $FF ; |XXXXXXXX| $x9F0
    .byte $FF ; |XXXXXXXX| $x9F1
    .byte $FF ; |XXXXXXXX| $x9F2
    .byte $FF ; |XXXXXXXX| $x9F3
    .byte $FF ; |XXXXXXXX| $x9F4
    .byte $FF ; |XXXXXXXX| $x9F5
    .byte $FF ; |XXXXXXXX| $x9F6
    .byte $FF ; |XXXXXXXX| $x9F7
    .byte $FF ; |XXXXXXXX| $x9F8
    .byte $FF ; |XXXXXXXX| $x9F9
    .byte $FF ; |XXXXXXXX| $x9FA
    .byte $FF ; |XXXXXXXX| $x9FB
    .byte $FF ; |XXXXXXXX| $x9FC
    .byte $FF ; |XXXXXXXX| $x9FD
    .byte $FF ; |XXXXXXXX| $x9FE
    .byte $FF ; |XXXXXXXX| $x9FF

    .byte $00 ; |        | $xA00
    .byte $00 ; |        | $xA01
    .byte $00 ; |        | $xA02
    .byte $00 ; |        | $xA03
    .byte $00 ; |        | $xA04
    .byte $00 ; |        | $xA05
    .byte $00 ; |        | $xA06
    .byte $00 ; |        | $xA07
    .byte $FF ; |XXXXXXXX| $xA08
    .byte $FF ; |XXXXXXXX| $xA09
    .byte $FF ; |XXXXXXXX| $xA0A
    .byte $FF ; |XXXXXXXX| $xA0B
    .byte $FF ; |XXXXXXXX| $xA0C
    .byte $FF ; |XXXXXXXX| $xA0D
    .byte $FF ; |XXXXXXXX| $xA0E
    .byte $FF ; |XXXXXXXX| $xA0F
    .byte $FF ; |XXXXXXXX| $xA10
    .byte $FF ; |XXXXXXXX| $xA11
    .byte $FF ; |XXXXXXXX| $xA12
    .byte $FF ; |XXXXXXXX| $xA13
    .byte $FF ; |XXXXXXXX| $xA14
    .byte $FF ; |XXXXXXXX| $xA15
    .byte $FF ; |XXXXXXXX| $xA16
    .byte $FF ; |XXXXXXXX| $xA17
    .byte $FF ; |XXXXXXXX| $xA18
    .byte $FF ; |XXXXXXXX| $xA19
    .byte $FF ; |XXXXXXXX| $xA1A
    .byte $FF ; |XXXXXXXX| $xA1B
    .byte $FF ; |XXXXXXXX| $xA1C
    .byte $FF ; |XXXXXXXX| $xA1D
    .byte $FF ; |XXXXXXXX| $xA1E
    .byte $FF ; |XXXXXXXX| $xA1F
    .byte $FF ; |XXXXXXXX| $xA20
    .byte $FF ; |XXXXXXXX| $xA21
    .byte $FF ; |XXXXXXXX| $xA22
    .byte $FF ; |XXXXXXXX| $xA23
    .byte $FF ; |XXXXXXXX| $xA24
    .byte $FF ; |XXXXXXXX| $xA25
    .byte $FF ; |XXXXXXXX| $xA26
    .byte $FF ; |XXXXXXXX| $xA27
    .byte $00 ; |        | $xA28
    .byte $00 ; |        | $xA29
    .byte $00 ; |        | $xA2A
    .byte $00 ; |        | $xA2B
    .byte $00 ; |        | $xA2C
    .byte $00 ; |        | $xA2D
    .byte $00 ; |        | $xA2E
    .byte $00 ; |        | $xA2F
    .byte $00 ; |        | $xA30
    .byte $00 ; |        | $xA31
    .byte $00 ; |        | $xA32
    .byte $00 ; |        | $xA33
    .byte $00 ; |        | $xA34
    .byte $F8 ; |XXXXX   | $xA35  gernades
    .byte $F8 ; |XXXXX   | $xA36
    .byte $F8 ; |XXXXX   | $xA37
    .byte $F8 ; |XXXXX   | $xA38
    .byte $F8 ; |XXXXX   | $xA39
    .byte $70 ; | XXX    | $xA3A
    .byte $00 ; |        | $xA3B
    .byte $3E ; |  XXXXX | $xA3C
    .byte $3E ; |  XXXXX | $xA3D
    .byte $3E ; |  XXXXX | $xA3E
    .byte $3E ; |  XXXXX | $xA3F
    .byte $3E ; |  XXXXX | $xA40
    .byte $1C ; |   XXX  | $xA41
    .byte $00 ; |        | $xA42
    .byte $00 ; |        | $xA43
    .byte $00 ; |        | $xA44
    .byte $00 ; |        | $xA45
    .byte $00 ; |        | $xA46
    .byte $00 ; |        | $xA47
    .byte $00 ; |        | $xA48
    .byte $00 ; |        | $xA49
    .byte $00 ; |        | $xA4A
    .byte $00 ; |        | $xA4B
    .byte $00 ; |        | $xA4C
    .byte $00 ; |        | $xA4D
    .byte $00 ; |        | $xA4E
    .byte $00 ; |        | $xA4F
    .byte $30 ; |  XX    | $xA50  machine gunner
    .byte $30 ; |  XX    | $xA51
    .byte $30 ; |  XX    | $xA52
    .byte $FC ; |XXXXXX  | $xA53
    .byte $FC ; |XXXXXX  | $xA54
    .byte $FC ; |XXXXXX  | $xA55
    .byte $30 ; |  XX    | $xA56
    .byte $30 ; |  XX    | $xA57
    .byte $78 ; | XXXX   | $xA58
    .byte $78 ; | XXXX   | $xA59
    .byte $30 ; |  XX    | $xA5A
    .byte $00 ; |        | $xA5B
    .byte $00 ; |        | $xA5C
    .byte $00 ; |        | $xA5D
    .byte $00 ; |        | $xA5E
    .byte $00 ; |        | $xA5F
    .byte $00 ; |        | $xA60
    .byte $00 ; |        | $xA61
    .byte $00 ; |        | $xA62
    .byte $00 ; |        | $xA63
    .byte $00 ; |        | $xA64
    .byte $00 ; |        | $xA65
    .byte $00 ; |        | $xA66
    .byte $00 ; |        | $xA67
    .byte $00 ; |        | $xA68
    .byte $00 ; |        | $xA69
    .byte $04 ; |     X  | $xA6A  machine gunner
    .byte $0C ; |    XX  | $xA6B
    .byte $18 ; |   XX   | $xA6C
    .byte $FC ; |XXXXXX  | $xA6D
    .byte $FC ; |XXXXXX  | $xA6E
    .byte $F8 ; |XXXXX   | $xA6F
    .byte $60 ; | XX     | $xA70
    .byte $60 ; | XX     | $xA71
    .byte $F0 ; |XXXX    | $xA72
    .byte $F0 ; |XXXX    | $xA73
    .byte $60 ; | XX     | $xA74
    .byte $00 ; |        | $xA75
    .byte $00 ; |        | $xA76
    .byte $00 ; |        | $xA77
    .byte $00 ; |        | $xA78
    .byte $00 ; |        | $xA79
    .byte $00 ; |        | $xA7A
    .byte $00 ; |        | $xA7B
    .byte $00 ; |        | $xA7C
    .byte $00 ; |        | $xA7D
    .byte $00 ; |        | $xA7E
    .byte $00 ; |        | $xA7F
    .byte $00 ; |        | $xA80
    .byte $00 ; |        | $xA81
    .byte $00 ; |        | $xA82
    .byte $00 ; |        | $xA83

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  IF {1} = BK_9000
    .byte $2A ; |  X X X | $9A84
    .byte $86 ; |X    XX | $9A85
    .byte $86 ; |X    XX | $9A86
    .byte $86 ; |X    XX | $9A87
    .byte $86 ; |X    XX | $9A88
    .byte $86 ; |X    XX | $9A89
    .byte $86 ; |X    XX | $9A8A
    .byte $88 ; |X   X   | $9A8B
    .byte $88 ; |X   X   | $9A8C
    .byte $86 ; |X    XX | $9A8D
    .byte $86 ; |X    XX | $9A8E
    .byte $86 ; |X    XX | $9A8F
    .byte $86 ; |X    XX | $9A90
    .byte $86 ; |X    XX | $9A91
    .byte $86 ; |X    XX | $9A92
    .byte $86 ; |X    XX | $9A93
    .byte $86 ; |X    XX | $9A94
    .byte $86 ; |X    XX | $9A95
    .byte $86 ; |X    XX | $9A96
    .byte $86 ; |X    XX | $9A97
    .byte $86 ; |X    XX | $9A98
    .byte $86 ; |X    XX | $9A99
    .byte $86 ; |X    XX | $9A9A
    .byte $86 ; |X    XX | $9A9B
    .byte $86 ; |X    XX | $9A9C
    .byte $86 ; |X    XX | $9A9D
    .byte $86 ; |X    XX | $9A9E
    .byte $84 ; |X    X  | $9A9F
    .byte $84 ; |X    X  | $9AA0
    .byte $86 ; |X    XX | $9AA1
    .byte $86 ; |X    XX | $9AA2
    .byte $86 ; |X    XX | $9AA3
    .byte $86 ; |X    XX | $9AA4
    .byte $8E ; |X   XXX | $9AA5
    .byte $8C ; |X   XX  | $9AA6
    .byte $8C ; |X   XX  | $9AA7
    .byte $8C ; |X   XX  | $9AA8
    .byte $8A ; |X   X X | $9AA9
    .byte $04 ; |     X  | $9AAA
    .byte $04 ; |     X  | $9AAB
    .byte $04 ; |     X  | $9AAC
    .byte $04 ; |     X  | $9AAD
    .byte $04 ; |     X  | $9AAE
    .byte $04 ; |     X  | $9AAF
    .byte $04 ; |     X  | $9AB0
    .byte $04 ; |     X  | $9AB1
    .byte $04 ; |     X  | $9AB2
    .byte $04 ; |     X  | $9AB3
    .byte $04 ; |     X  | $9AB4
    .byte $86 ; |X    XX | $9AB5
    .byte $88 ; |X   X   | $9AB6
    .byte $86 ; |X    XX | $9AB7
    .byte $86 ; |X    XX | $9AB8
    .byte $86 ; |X    XX | $9AB9
    .byte $86 ; |X    XX | $9ABA
    .byte $86 ; |X    XX | $9ABB
    .byte $86 ; |X    XX | $9ABC
    .byte $8C ; |X   XX  | $9ABD
    .byte $8A ; |X   X X | $9ABE
    .byte $8A ; |X   X X | $9ABF
    .byte $8A ; |X   X X | $9AC0
    .byte $88 ; |X   X   | $9AC1
    .byte $2A ; |  X X X | $9AC2
    .byte $2A ; |  X X X | $9AC3
  ENDIF
  IF {1} = BK_B000
    .byte $CA ; |XX  X X | $BA84
    .byte $28 ; |  X X   | $BA85
    .byte $28 ; |  X X   | $BA86
    .byte $28 ; |  X X   | $BA87
    .byte $28 ; |  X X   | $BA88
    .byte $28 ; |  X X   | $BA89
    .byte $28 ; |  X X   | $BA8A
    .byte $2A ; |  X X X | $BA8B
    .byte $2A ; |  X X X | $BA8C
    .byte $28 ; |  X X   | $BA8D
    .byte $28 ; |  X X   | $BA8E
    .byte $28 ; |  X X   | $BA8F
    .byte $28 ; |  X X   | $BA90
    .byte $28 ; |  X X   | $BA91
    .byte $28 ; |  X X   | $BA92
    .byte $28 ; |  X X   | $BA93
    .byte $28 ; |  X X   | $BA94
    .byte $28 ; |  X X   | $BA95
    .byte $28 ; |  X X   | $BA96
    .byte $28 ; |  X X   | $BA97
    .byte $28 ; |  X X   | $BA98
    .byte $28 ; |  X X   | $BA99
    .byte $28 ; |  X X   | $BA9A
    .byte $28 ; |  X X   | $BA9B
    .byte $28 ; |  X X   | $BA9C
    .byte $28 ; |  X X   | $BA9D
    .byte $28 ; |  X X   | $BA9E
    .byte $26 ; |  X  XX | $BA9F
    .byte $26 ; |  X  XX | $BAA0
    .byte $28 ; |  X X   | $BAA1
    .byte $28 ; |  X X   | $BAA2
    .byte $28 ; |  X X   | $BAA3
    .byte $28 ; |  X X   | $BAA4
    .byte $2E ; |  X XXX | $BAA5
    .byte $2C ; |  X XX  | $BAA6
    .byte $2C ; |  X XX  | $BAA7
    .byte $2C ; |  X XX  | $BAA8
    .byte $2A ; |  X X X | $BAA9
    .byte $06 ; |     XX | $BAAA
    .byte $06 ; |     XX | $BAAB
    .byte $06 ; |     XX | $BAAC
    .byte $06 ; |     XX | $BAAD
    .byte $06 ; |     XX | $BAAE
    .byte $06 ; |     XX | $BAAF
    .byte $06 ; |     XX | $BAB0
    .byte $06 ; |     XX | $BAB1
    .byte $06 ; |     XX | $BAB2
    .byte $06 ; |     XX | $BAB3
    .byte $06 ; |     XX | $BAB4
    .byte $28 ; |  X X   | $BAB5
    .byte $2A ; |  X X X | $BAB6
    .byte $28 ; |  X X   | $BAB7
    .byte $28 ; |  X X   | $BAB8
    .byte $28 ; |  X X   | $BAB9
    .byte $28 ; |  X X   | $BABA
    .byte $28 ; |  X X   | $BABB
    .byte $28 ; |  X X   | $BABC
    .byte $2E ; |  X XXX | $BABD
    .byte $2C ; |  X XX  | $BABE
    .byte $2C ; |  X XX  | $BABF
    .byte $2C ; |  X XX  | $BAC0
    .byte $2A ; |  X X X | $BAC1
    .byte $CA ; |XX  X X | $BAC2
    .byte $CA ; |XX  X X | $BAC3
  ENDIF
  IF {1} = BK_D000
LDA84:
    .byte $1A ; |   XX X | $DA84  bridge colors LV 1
    .byte $06 ; |     XX | $DA85
    .byte $06 ; |     XX | $DA86
    .byte $06 ; |     XX | $DA87
    .byte $06 ; |     XX | $DA88
    .byte $06 ; |     XX | $DA89
    .byte $06 ; |     XX | $DA8A
    .byte $08 ; |    X   | $DA8B
    .byte $08 ; |    X   | $DA8C
    .byte $06 ; |     XX | $DA8D
    .byte $06 ; |     XX | $DA8E
    .byte $06 ; |     XX | $DA8F
    .byte $06 ; |     XX | $DA90
    .byte $06 ; |     XX | $DA91
    .byte $06 ; |     XX | $DA92
    .byte $06 ; |     XX | $DA93
    .byte $06 ; |     XX | $DA94
    .byte $06 ; |     XX | $DA95
    .byte $06 ; |     XX | $DA96
    .byte $06 ; |     XX | $DA97
    .byte $06 ; |     XX | $DA98
    .byte $06 ; |     XX | $DA99
    .byte $06 ; |     XX | $DA9A
    .byte $06 ; |     XX | $DA9B
    .byte $06 ; |     XX | $DA9C
    .byte $06 ; |     XX | $DA9D
    .byte $06 ; |     XX | $DA9E
    .byte $04 ; |     X  | $DA9F
    .byte $04 ; |     X  | $DAA0
    .byte $06 ; |     XX | $DAA1
    .byte $06 ; |     XX | $DAA2
    .byte $06 ; |     XX | $DAA3
LDAA4:
    .byte $06 ; |     XX | $DAA4
    .byte $0E ; |    XXX | $DAA5
    .byte $0C ; |    XX  | $DAA6
    .byte $0C ; |    XX  | $DAA7
    .byte $0C ; |    XX  | $DAA8
    .byte $0A ; |    X X | $DAA9
    .byte $04 ; |     X  | $DAAA
    .byte $04 ; |     X  | $DAAB
    .byte $04 ; |     X  | $DAAC
    .byte $04 ; |     X  | $DAAD
    .byte $04 ; |     X  | $DAAE
    .byte $04 ; |     X  | $DAAF
    .byte $04 ; |     X  | $DAB0
    .byte $04 ; |     X  | $DAB1
    .byte $04 ; |     X  | $DAB2
    .byte $04 ; |     X  | $DAB3
    .byte $04 ; |     X  | $DAB4
    .byte $06 ; |     XX | $DAB5
    .byte $08 ; |    X   | $DAB6
    .byte $06 ; |     XX | $DAB7
    .byte $06 ; |     XX | $DAB8
    .byte $06 ; |     XX | $DAB9
    .byte $06 ; |     XX | $DABA
    .byte $06 ; |     XX | $DABB
    .byte $06 ; |     XX | $DABC
    .byte $0C ; |    XX  | $DABD
    .byte $0A ; |    X X | $DABE
    .byte $0A ; |    X X | $DABF
    .byte $0A ; |    X X | $DAC0
    .byte $08 ; |    X   | $DAC1
    .byte $1A ; |   XX X | $DAC2
    .byte $1A ; |   XX X | $DAC3
LDAC4:
  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $86 ; |X    XX | $xAC4
    .byte $86 ; |X    XX | $xAC5
    .byte $86 ; |X    XX | $xAC6
    .byte $86 ; |X    XX | $xAC7
    .byte $86 ; |X    XX | $xAC8
    .byte $86 ; |X    XX | $xAC9
    .byte $82 ; |X     X | $xACA
    .byte $84 ; |X    X  | $xACB
    .byte $84 ; |X    X  | $xACC
    .byte $86 ; |X    XX | $xACD
    .byte $86 ; |X    XX | $xACE
    .byte $86 ; |X    XX | $xACF
    .byte $80 ; |X       | $xAD0
    .byte $EE ; |XXX XXX | $xAD1
    .byte $84 ; |X    X  | $xAD2
    .byte $88 ; |X   X   | $xAD3
    .byte $80 ; |X       | $xAD4
    .byte $80 ; |X       | $xAD5
    .byte $80 ; |X       | $xAD6
    .byte $86 ; |X    XX | $xAD7
    .byte $86 ; |X    XX | $xAD8
    .byte $86 ; |X    XX | $xAD9
    .byte $86 ; |X    XX | $xADA
    .byte $86 ; |X    XX | $xADB
    .byte $02 ; |      X | $xADC
    .byte $08 ; |    X   | $xADD
    .byte $08 ; |    X   | $xADE
    .byte $08 ; |    X   | $xADF
    .byte $08 ; |    X   | $xAE0
    .byte $64 ; | XX  X  | $xAE1
    .byte $64 ; | XX  X  | $xAE2
    .byte $64 ; | XX  X  | $xAE3
    .byte $68 ; | XX X   | $xAE4
    .byte $66 ; | XX  XX | $xAE5
    .byte $66 ; | XX  XX | $xAE6
    .byte $00 ; |        | $xAE7
    .byte $64 ; | XX  X  | $xAE8
    .byte $64 ; | XX  X  | $xAE9
    .byte $64 ; | XX  X  | $xAEA
    .byte $68 ; | XX X   | $xAEB
    .byte $66 ; | XX  XX | $xAEC
    .byte $66 ; | XX  XX | $xAED
    .byte $02 ; |      X | $xAEE
    .byte $02 ; |      X | $xAEF
    .byte $02 ; |      X | $xAF0
    .byte $00 ; |        | $xAF1
    .byte $00 ; |        | $xAF2
    .byte $00 ; |        | $xAF3

    .byte $FF ; |XXXXXXXX| $xAF4  free bytes
    .byte $FF ; |XXXXXXXX| $xAF5
    .byte $FF ; |XXXXXXXX| $xAF6
    .byte $FF ; |XXXXXXXX| $xAF7
    .byte $FF ; |XXXXXXXX| $xAF8
    .byte $FF ; |XXXXXXXX| $xAF9
    .byte $FF ; |XXXXXXXX| $xAFA
    .byte $FF ; |XXXXXXXX| $xAFB
    .byte $FF ; |XXXXXXXX| $xAFC
    .byte $FF ; |XXXXXXXX| $xAFD
    .byte $FF ; |XXXXXXXX| $xAFE
    .byte $FF ; |XXXXXXXX| $xAFF


  ENDM


;--------------------------------------------------------------------------------------------------


;starts at $xE00 in bank 2, and $xD40 in bank 0 and 1

  MAC COMMON_ROUTINE

;this label is outside this block of code
.mxFEB = $0FEB

.mxD40:
    ldy    ram_D6                ; 3
    clc                          ; 2
    adc    #$01                  ; 2
    cmp    #$3E                  ; 2
    bcc    .mxD51                ; 2³
    sbc    #$3E                  ; 2
    eor    #$FF                  ; 2
    adc    #$3D                  ; 2
    sbc    #$03                  ; 2
.mxD51:
    pha                          ; 3
    cmp    #$1E                  ; 2
    tya                          ; 2
    bcc    .mxD5B                ; 2³
    and    #$FE                  ; 2
    bcs    .mxD5D                ; 3   always branch

.mxD5B:
    ora    #$01                  ; 2
.mxD5D:
    tay                          ; 2
    lda    (ram_EF),Y            ; 5
    sta    ram_D6                ; 3
    pla                          ; 4
    tay                          ; 2
    sec                          ; 2
    lda    ram_D6                ; 3
    and    .mxD77,Y              ; 4
    bne    .mxD74                ; 2³
    lda    ram_D6                ; 3
    and    .mxD77,Y              ; 4
    bne    .mxD74                ; 2³
    clc                          ; 2
.mxD74:
    jmp    .mxFEB | {1}          ; 3

.mxD77:
    .byte $80 ; |X       | $xD77
    .byte $80 ; |X       | $xD78
    .byte $40 ; | X      | $xD79
    .byte $40 ; | X      | $xD7A
    .byte $40 ; | X      | $xD7B
    .byte $40 ; | X      | $xD7C
    .byte $20 ; |  X     | $xD7D
    .byte $20 ; |  X     | $xD7E
    .byte $20 ; |  X     | $xD7F
    .byte $20 ; |  X     | $xD80
    .byte $10 ; |   X    | $xD81
    .byte $10 ; |   X    | $xD82
    .byte $10 ; |   X    | $xD83
    .byte $10 ; |   X    | $xD84
    .byte $08 ; |    X   | $xD85
    .byte $08 ; |    X   | $xD86
    .byte $08 ; |    X   | $xD87
    .byte $08 ; |    X   | $xD88
    .byte $04 ; |     X  | $xD89
    .byte $04 ; |     X  | $xD8A
    .byte $04 ; |     X  | $xD8B
    .byte $04 ; |     X  | $xD8C
    .byte $02 ; |      X | $xD8D
    .byte $02 ; |      X | $xD8E
    .byte $02 ; |      X | $xD8F
    .byte $02 ; |      X | $xD90
    .byte $01 ; |       X| $xD91
    .byte $01 ; |       X| $xD92
    .byte $01 ; |       X| $xD93
    .byte $01 ; |       X| $xD94
    .byte $01 ; |       X| $xD95
    .byte $01 ; |       X| $xD96
    .byte $01 ; |       X| $xD97
    .byte $01 ; |       X| $xD98
    .byte $02 ; |      X | $xD99
    .byte $02 ; |      X | $xD9A
    .byte $02 ; |      X | $xD9B
    .byte $02 ; |      X | $xD9C
    .byte $04 ; |     X  | $xD9D
    .byte $04 ; |     X  | $xD9E
    .byte $04 ; |     X  | $xD9F
    .byte $04 ; |     X  | $xDA0
    .byte $08 ; |    X   | $xDA1
    .byte $08 ; |    X   | $xDA2
    .byte $08 ; |    X   | $xDA3
    .byte $08 ; |    X   | $xDA4
    .byte $10 ; |   X    | $xDA5
    .byte $10 ; |   X    | $xDA6
    .byte $10 ; |   X    | $xDA7
    .byte $10 ; |   X    | $xDA8
    .byte $20 ; |  X     | $xDA9
    .byte $20 ; |  X     | $xDAA
    .byte $20 ; |  X     | $xDAB
    .byte $20 ; |  X     | $xDAC
    .byte $40 ; | X      | $xDAD
    .byte $40 ; | X      | $xDAE
    .byte $40 ; | X      | $xDAF
    .byte $40 ; | X      | $xDB0
    .byte $80 ; |X       | $xDB1
    .byte $80 ; |X       | $xDB2
    .byte $80 ; |X       | $xDB3
    .byte $80 ; |X       | $xDB4

  ENDM

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE
       ORG $0000
      RORG $9000

L9000:
   MAIN_KERNEL  BK_9000

    .byte $00 ; |        | $9B00
    .byte $00 ; |        | $9B01
    .byte $0F ; |    XXXX| $9B02
    .byte $1F ; |   XXXXX| $9B03
    .byte $7F ; | XXXXXXX| $9B04
    .byte $FF ; |XXXXXXXX| $9B05
    .byte $7F ; | XXXXXXX| $9B06
    .byte $FF ; |XXXXXXXX| $9B07
    .byte $7F ; | XXXXXXX| $9B08
    .byte $FF ; |XXXXXXXX| $9B09
    .byte $7F ; | XXXXXXX| $9B0A
    .byte $FF ; |XXXXXXXX| $9B0B
    .byte $7F ; | XXXXXXX| $9B0C
    .byte $FF ; |XXXXXXXX| $9B0D
    .byte $7F ; | XXXXXXX| $9B0E
    .byte $FF ; |XXXXXXXX| $9B0F
    .byte $7F ; | XXXXXXX| $9B10
    .byte $FF ; |XXXXXXXX| $9B11
    .byte $7F ; | XXXXXXX| $9B12
    .byte $FF ; |XXXXXXXX| $9B13
    .byte $7F ; | XXXXXXX| $9B14
    .byte $FF ; |XXXXXXXX| $9B15
    .byte $7F ; | XXXXXXX| $9B16
    .byte $FF ; |XXXXXXXX| $9B17
    .byte $7C ; | XXXXX  | $9B18
    .byte $F8 ; |XXXXX   | $9B19
    .byte $00 ; |        | $9B1A
    .byte $00 ; |        | $9B1B
    .byte $00 ; |        | $9B1C
    .byte $00 ; |        | $9B1D
    .byte $00 ; |        | $9B1E
    .byte $00 ; |        | $9B1F

    .byte $98 ; |X  XX   | $9B20
    .byte $20 ; |  X     | $9B21
    .byte $20 ; |  X     | $9B22
    .byte $20 ; |  X     | $9B23
    .byte $20 ; |  X     | $9B24
    .byte $20 ; |  X     | $9B25
    .byte $20 ; |  X     | $9B26
    .byte $20 ; |  X     | $9B27
    .byte $20 ; |  X     | $9B28
    .byte $20 ; |  X     | $9B29
    .byte $20 ; |  X     | $9B2A
    .byte $20 ; |  X     | $9B2B
    .byte $20 ; |  X     | $9B2C
    .byte $20 ; |  X     | $9B2D
    .byte $20 ; |  X     | $9B2E
    .byte $20 ; |  X     | $9B2F
    .byte $20 ; |  X     | $9B30
    .byte $20 ; |  X     | $9B31
    .byte $22 ; |  X   X | $9B32
    .byte $22 ; |  X   X | $9B33
    .byte $24 ; |  X  X  | $9B34
    .byte $24 ; |  X  X  | $9B35
    .byte $26 ; |  X  XX | $9B36
    .byte $26 ; |  X  XX | $9B37
    .byte $28 ; |  X X   | $9B38
    .byte $28 ; |  X X   | $9B39
    .byte $98 ; |X  XX   | $9B3A
    .byte $98 ; |X  XX   | $9B3B
    .byte $98 ; |X  XX   | $9B3C
    .byte $98 ; |X  XX   | $9B3D
    .byte $98 ; |X  XX   | $9B3E
    .byte $0E ; |    XXX | $9B3F

    .byte $00 ; |        | $9B40
    .byte $00 ; |        | $9B41
    .byte $00 ; |        | $9B42
    .byte $00 ; |        | $9B43
    .byte $00 ; |        | $9B44
    .byte $00 ; |        | $9B45
    .byte $00 ; |        | $9B46
    .byte $00 ; |        | $9B47
    .byte $F0 ; |XXXX    | $9B48
    .byte $00 ; |        | $9B49
    .byte $FC ; |XXXXXX  | $9B4A
    .byte $00 ; |        | $9B4B
    .byte $FE ; |XXXXXXX | $9B4C
    .byte $00 ; |        | $9B4D
    .byte $FE ; |XXXXXXX | $9B4E
    .byte $00 ; |        | $9B4F
    .byte $F8 ; |XXXXX   | $9B50
    .byte $00 ; |        | $9B51
    .byte $E0 ; |XXX     | $9B52
    .byte $00 ; |        | $9B53
    .byte $00 ; |        | $9B54
    .byte $00 ; |        | $9B55
    .byte $00 ; |        | $9B56
    .byte $00 ; |        | $9B57
    .byte $00 ; |        | $9B58
    .byte $00 ; |        | $9B59
    .byte $00 ; |        | $9B5A
    .byte $00 ; |        | $9B5B
    .byte $00 ; |        | $9B5C
    .byte $00 ; |        | $9B5D
    .byte $00 ; |        | $9B5E
    .byte $00 ; |        | $9B5F

    .byte $0E ; |    XXX | $9B60
    .byte $0E ; |    XXX | $9B61
    .byte $0E ; |    XXX | $9B62
    .byte $0E ; |    XXX | $9B63
    .byte $0E ; |    XXX | $9B64
    .byte $0E ; |    XXX | $9B65
    .byte $0E ; |    XXX | $9B66
    .byte $20 ; |  X     | $9B67
    .byte $20 ; |  X     | $9B68
    .byte $20 ; |  X     | $9B69
    .byte $20 ; |  X     | $9B6A
    .byte $20 ; |  X     | $9B6B
    .byte $22 ; |  X   X | $9B6C
    .byte $22 ; |  X   X | $9B6D
    .byte $24 ; |  X  X  | $9B6E
    .byte $24 ; |  X  X  | $9B6F
    .byte $26 ; |  X  XX | $9B70
    .byte $26 ; |  X  XX | $9B71
    .byte $28 ; |  X X   | $9B72
    .byte $0E ; |    XXX | $9B73
    .byte $0E ; |    XXX | $9B74
    .byte $0E ; |    XXX | $9B75
    .byte $0E ; |    XXX | $9B76
    .byte $0E ; |    XXX | $9B77
    .byte $0E ; |    XXX | $9B78
    .byte $0E ; |    XXX | $9B79
    .byte $0E ; |    XXX | $9B7A
    .byte $0E ; |    XXX | $9B7B
    .byte $0E ; |    XXX | $9B7C
    .byte $0E ; |    XXX | $9B7D
    .byte $0E ; |    XXX | $9B7E
    .byte $0E ; |    XXX | $9B7F

    .byte $00 ; |        | $9B80
    .byte $00 ; |        | $9B81
    .byte $00 ; |        | $9B82
    .byte $00 ; |        | $9B83
    .byte $00 ; |        | $9B84
    .byte $00 ; |        | $9B85
    .byte $00 ; |        | $9B86
    .byte $00 ; |        | $9B87
    .byte $07 ; |     XXX| $9B88
    .byte $07 ; |     XXX| $9B89
    .byte $1F ; |   XXXXX| $9B8A
    .byte $0F ; |    XXXX| $9B8B
    .byte $3F ; |  XXXXXX| $9B8C
    .byte $1F ; |   XXXXX| $9B8D
    .byte $3F ; |  XXXXXX| $9B8E
    .byte $1F ; |   XXXXX| $9B8F
    .byte $1F ; |   XXXXX| $9B90
    .byte $07 ; |     XXX| $9B91
    .byte $07 ; |     XXX| $9B92
    .byte $00 ; |        | $9B93
    .byte $00 ; |        | $9B94
    .byte $00 ; |        | $9B95
    .byte $00 ; |        | $9B96
    .byte $00 ; |        | $9B97
    .byte $00 ; |        | $9B98
    .byte $00 ; |        | $9B99
    .byte $00 ; |        | $9B9A
    .byte $00 ; |        | $9B9B
    .byte $00 ; |        | $9B9C
    .byte $00 ; |        | $9B9D
    .byte $00 ; |        | $9B9E
    .byte $00 ; |        | $9B9F

    .byte $0E ; |    XXX | $9BA0
    .byte $0E ; |    XXX | $9BA1
    .byte $0E ; |    XXX | $9BA2
    .byte $0E ; |    XXX | $9BA3
    .byte $0E ; |    XXX | $9BA4
    .byte $0E ; |    XXX | $9BA5
    .byte $0E ; |    XXX | $9BA6
    .byte $20 ; |  X     | $9BA7
    .byte $20 ; |  X     | $9BA8
    .byte $20 ; |  X     | $9BA9
    .byte $20 ; |  X     | $9BAA
    .byte $20 ; |  X     | $9BAB
    .byte $22 ; |  X   X | $9BAC
    .byte $22 ; |  X   X | $9BAD
    .byte $24 ; |  X  X  | $9BAE
    .byte $24 ; |  X  X  | $9BAF
    .byte $26 ; |  X  XX | $9BB0
    .byte $26 ; |  X  XX | $9BB1
    .byte $28 ; |  X X   | $9BB2
    .byte $0E ; |    XXX | $9BB3
    .byte $0E ; |    XXX | $9BB4
    .byte $0E ; |    XXX | $9BB5
    .byte $0E ; |    XXX | $9BB6
    .byte $0E ; |    XXX | $9BB7
    .byte $0E ; |    XXX | $9BB8
    .byte $0E ; |    XXX | $9BB9
    .byte $0E ; |    XXX | $9BBA
    .byte $0E ; |    XXX | $9BBB
    .byte $0E ; |    XXX | $9BBC
    .byte $0E ; |    XXX | $9BBD
    .byte $0E ; |    XXX | $9BBE
    .byte $0E ; |    XXX | $9BBF

    .byte $00 ; |        | $9BC0
    .byte $00 ; |        | $9BC1
    .byte $C0 ; |XX      | $9BC2
    .byte $80 ; |X       | $9BC3
    .byte $F8 ; |XXXXX   | $9BC4
    .byte $F0 ; |XXXX    | $9BC5
    .byte $FE ; |XXXXXXX | $9BC6
    .byte $FE ; |XXXXXXX | $9BC7
    .byte $FE ; |XXXXXXX | $9BC8
    .byte $FE ; |XXXXXXX | $9BC9
    .byte $FE ; |XXXXXXX | $9BCA
    .byte $FE ; |XXXXXXX | $9BCB
    .byte $FE ; |XXXXXXX | $9BCC
    .byte $FE ; |XXXXXXX | $9BCD
    .byte $FE ; |XXXXXXX | $9BCE
    .byte $FE ; |XXXXXXX | $9BCF
    .byte $FE ; |XXXXXXX | $9BD0
    .byte $FE ; |XXXXXXX | $9BD1
    .byte $FE ; |XXXXXXX | $9BD2
    .byte $FE ; |XXXXXXX | $9BD3
    .byte $FE ; |XXXXXXX | $9BD4
    .byte $FE ; |XXXXXXX | $9BD5
    .byte $FE ; |XXXXXXX | $9BD6
    .byte $FE ; |XXXXXXX | $9BD7
    .byte $FE ; |XXXXXXX | $9BD8
    .byte $FE ; |XXXXXXX | $9BD9
    .byte $FE ; |XXXXXXX | $9BDA
    .byte $FE ; |XXXXXXX | $9BDB
    .byte $FE ; |XXXXXXX | $9BDC
    .byte $7E ; | XXXXXX | $9BDD
    .byte $1E ; |   XXXX | $9BDE
    .byte $0E ; |    XXX | $9BDF

    .byte $2A ; |  X X X | $9BE0
    .byte $20 ; |  X     | $9BE1
    .byte $20 ; |  X     | $9BE2
    .byte $20 ; |  X     | $9BE3
    .byte $20 ; |  X     | $9BE4
    .byte $20 ; |  X     | $9BE5
    .byte $20 ; |  X     | $9BE6
    .byte $20 ; |  X     | $9BE7
    .byte $20 ; |  X     | $9BE8
    .byte $20 ; |  X     | $9BE9
    .byte $20 ; |  X     | $9BEA
    .byte $20 ; |  X     | $9BEB
    .byte $20 ; |  X     | $9BEC
    .byte $20 ; |  X     | $9BED
    .byte $20 ; |  X     | $9BEE
    .byte $20 ; |  X     | $9BEF
    .byte $20 ; |  X     | $9BF0
    .byte $20 ; |  X     | $9BF1
    .byte $20 ; |  X     | $9BF2
    .byte $20 ; |  X     | $9BF3
    .byte $20 ; |  X     | $9BF4
    .byte $20 ; |  X     | $9BF5
    .byte $20 ; |  X     | $9BF6
    .byte $20 ; |  X     | $9BF7
    .byte $22 ; |  X   X | $9BF8
    .byte $22 ; |  X   X | $9BF9
    .byte $24 ; |  X  X  | $9BFA
    .byte $24 ; |  X  X  | $9BFB
    .byte $26 ; |  X  XX | $9BFC
    .byte $26 ; |  X  XX | $9BFD
    .byte $28 ; |  X X   | $9BFE
    .byte $28 ; |  X X   | $9BFF

    .byte $00 ; |        | $9C00
    .byte $00 ; |        | $9C01
    .byte $1F ; |   XXXXX| $9C02
    .byte $FF ; |XXXXXXXX| $9C03
    .byte $1F ; |   XXXXX| $9C04
    .byte $FF ; |XXXXXXXX| $9C05
    .byte $1F ; |   XXXXX| $9C06
    .byte $FF ; |XXXXXXXX| $9C07
    .byte $1F ; |   XXXXX| $9C08
    .byte $FF ; |XXXXXXXX| $9C09
    .byte $1F ; |   XXXXX| $9C0A
    .byte $FF ; |XXXXXXXX| $9C0B
    .byte $1F ; |   XXXXX| $9C0C
    .byte $FF ; |XXXXXXXX| $9C0D
    .byte $1F ; |   XXXXX| $9C0E
    .byte $FF ; |XXXXXXXX| $9C0F
    .byte $1F ; |   XXXXX| $9C10
    .byte $FF ; |XXXXXXXX| $9C11
    .byte $1F ; |   XXXXX| $9C12
    .byte $FF ; |XXXXXXXX| $9C13
    .byte $1F ; |   XXXXX| $9C14
    .byte $FF ; |XXXXXXXX| $9C15
    .byte $1F ; |   XXXXX| $9C16
    .byte $FF ; |XXXXXXXX| $9C17
    .byte $3F ; |  XXXXXX| $9C18
    .byte $FF ; |XXXXXXXX| $9C19
    .byte $7F ; | XXXXXXX| $9C1A
    .byte $FF ; |XXXXXXXX| $9C1B
    .byte $FF ; |XXXXXXXX| $9C1C
    .byte $FF ; |XXXXXXXX| $9C1D
    .byte $FF ; |XXXXXXXX| $9C1E
    .byte $FF ; |XXXXXXXX| $9C1F

    .byte $0E ; |    XXX | $9C20
    .byte $2A ; |  X X X | $9C21
    .byte $86 ; |X    XX | $9C22
    .byte $86 ; |X    XX | $9C23
    .byte $86 ; |X    XX | $9C24
    .byte $86 ; |X    XX | $9C25
    .byte $86 ; |X    XX | $9C26
    .byte $86 ; |X    XX | $9C27
    .byte $88 ; |X   X   | $9C28
    .byte $88 ; |X   X   | $9C29
    .byte $86 ; |X    XX | $9C2A
    .byte $86 ; |X    XX | $9C2B
    .byte $86 ; |X    XX | $9C2C
    .byte $86 ; |X    XX | $9C2D
    .byte $86 ; |X    XX | $9C2E
    .byte $86 ; |X    XX | $9C2F
    .byte $86 ; |X    XX | $9C30
    .byte $86 ; |X    XX | $9C31
    .byte $86 ; |X    XX | $9C32
    .byte $86 ; |X    XX | $9C33
    .byte $86 ; |X    XX | $9C34
    .byte $86 ; |X    XX | $9C35
    .byte $86 ; |X    XX | $9C36
    .byte $86 ; |X    XX | $9C37
    .byte $86 ; |X    XX | $9C38
    .byte $86 ; |X    XX | $9C39
    .byte $86 ; |X    XX | $9C3A
    .byte $86 ; |X    XX | $9C3B
    .byte $84 ; |X    X  | $9C3C
    .byte $84 ; |X    X  | $9C3D
    .byte $86 ; |X    XX | $9C3E
    .byte $86 ; |X    XX | $9C3F

    .byte $FF ; |XXXXXXXX| $9C40
    .byte $FF ; |XXXXXXXX| $9C41
    .byte $FF ; |XXXXXXXX| $9C42
    .byte $FF ; |XXXXXXXX| $9C43
    .byte $FF ; |XXXXXXXX| $9C44
    .byte $FF ; |XXXXXXXX| $9C45
    .byte $FF ; |XXXXXXXX| $9C46
    .byte $FF ; |XXXXXXXX| $9C47
    .byte $FF ; |XXXXXXXX| $9C48
    .byte $FF ; |XXXXXXXX| $9C49
    .byte $FF ; |XXXXXXXX| $9C4A
    .byte $FF ; |XXXXXXXX| $9C4B
    .byte $FF ; |XXXXXXXX| $9C4C
    .byte $FF ; |XXXXXXXX| $9C4D
    .byte $FF ; |XXXXXXXX| $9C4E
    .byte $FF ; |XXXXXXXX| $9C4F
    .byte $FF ; |XXXXXXXX| $9C50
    .byte $FF ; |XXXXXXXX| $9C51
    .byte $FF ; |XXXXXXXX| $9C52
    .byte $FF ; |XXXXXXXX| $9C53
    .byte $FF ; |XXXXXXXX| $9C54
    .byte $FF ; |XXXXXXXX| $9C55
    .byte $FF ; |XXXXXXXX| $9C56
    .byte $FF ; |XXXXXXXX| $9C57
    .byte $FF ; |XXXXXXXX| $9C58
    .byte $FF ; |XXXXXXXX| $9C59
    .byte $FF ; |XXXXXXXX| $9C5A
    .byte $FF ; |XXXXXXXX| $9C5B
    .byte $FF ; |XXXXXXXX| $9C5C
    .byte $FF ; |XXXXXXXX| $9C5D
    .byte $FF ; |XXXXXXXX| $9C5E
    .byte $FF ; |XXXXXXXX| $9C5F

    .byte $86 ; |X    XX | $9C60
    .byte $86 ; |X    XX | $9C61
    .byte $8E ; |X   XXX | $9C62
    .byte $8C ; |X   XX  | $9C63
    .byte $8C ; |X   XX  | $9C64
    .byte $8C ; |X   XX  | $9C65
    .byte $8A ; |X   X X | $9C66
    .byte $04 ; |     X  | $9C67
    .byte $04 ; |     X  | $9C68
    .byte $04 ; |     X  | $9C69
    .byte $04 ; |     X  | $9C6A
    .byte $04 ; |     X  | $9C6B
    .byte $04 ; |     X  | $9C6C
    .byte $04 ; |     X  | $9C6D
    .byte $04 ; |     X  | $9C6E
    .byte $04 ; |     X  | $9C6F
    .byte $04 ; |     X  | $9C70
    .byte $04 ; |     X  | $9C71
    .byte $86 ; |X    XX | $9C72
    .byte $88 ; |X   X   | $9C73
    .byte $86 ; |X    XX | $9C74
    .byte $86 ; |X    XX | $9C75
    .byte $86 ; |X    XX | $9C76
    .byte $86 ; |X    XX | $9C77
    .byte $86 ; |X    XX | $9C78
    .byte $86 ; |X    XX | $9C79
    .byte $8C ; |X   XX  | $9C7A
    .byte $8A ; |X   X X | $9C7B
    .byte $8A ; |X   X X | $9C7C
    .byte $8A ; |X   X X | $9C7D
    .byte $88 ; |X   X   | $9C7E
    .byte $2A ; |  X X X | $9C7F

    .byte $00 ; |        | $9C80
    .byte $00 ; |        | $9C81
    .byte $00 ; |        | $9C82
    .byte $00 ; |        | $9C83
    .byte $00 ; |        | $9C84
    .byte $00 ; |        | $9C85
    .byte $00 ; |        | $9C86
    .byte $00 ; |        | $9C87
    .byte $00 ; |        | $9C88
    .byte $00 ; |        | $9C89
    .byte $00 ; |        | $9C8A
    .byte $00 ; |        | $9C8B
    .byte $00 ; |        | $9C8C
    .byte $00 ; |        | $9C8D
    .byte $00 ; |        | $9C8E
    .byte $00 ; |        | $9C8F
    .byte $00 ; |        | $9C90
    .byte $00 ; |        | $9C91
    .byte $00 ; |        | $9C92
    .byte $00 ; |        | $9C93
    .byte $00 ; |        | $9C94
    .byte $00 ; |        | $9C95
    .byte $00 ; |        | $9C96
    .byte $00 ; |        | $9C97
    .byte $00 ; |        | $9C98
    .byte $00 ; |        | $9C99
    .byte $00 ; |        | $9C9A
    .byte $00 ; |        | $9C9B
    .byte $00 ; |        | $9C9C
    .byte $00 ; |        | $9C9D
    .byte $00 ; |        | $9C9E
    .byte $00 ; |        | $9C9F

    .byte $2A ; |  X X X | $9CA0
    .byte $0E ; |    XXX | $9CA1
    .byte $0E ; |    XXX | $9CA2
    .byte $0E ; |    XXX | $9CA3
    .byte $0E ; |    XXX | $9CA4
    .byte $0E ; |    XXX | $9CA5
    .byte $0E ; |    XXX | $9CA6
    .byte $0E ; |    XXX | $9CA7
    .byte $0E ; |    XXX | $9CA8
    .byte $0E ; |    XXX | $9CA9
    .byte $0E ; |    XXX | $9CAA
    .byte $0E ; |    XXX | $9CAB
    .byte $0E ; |    XXX | $9CAC
    .byte $0E ; |    XXX | $9CAD
    .byte $0E ; |    XXX | $9CAE
    .byte $0E ; |    XXX | $9CAF
    .byte $0E ; |    XXX | $9CB0
    .byte $0E ; |    XXX | $9CB1
    .byte $0E ; |    XXX | $9CB2
    .byte $0E ; |    XXX | $9CB3
    .byte $0E ; |    XXX | $9CB4
    .byte $0E ; |    XXX | $9CB5
    .byte $0E ; |    XXX | $9CB6
    .byte $0E ; |    XXX | $9CB7
    .byte $0E ; |    XXX | $9CB8
    .byte $0E ; |    XXX | $9CB9
    .byte $0E ; |    XXX | $9CBA
    .byte $0E ; |    XXX | $9CBB
    .byte $0E ; |    XXX | $9CBC
    .byte $0E ; |    XXX | $9CBD
    .byte $28 ; |  X X   | $9CBE
    .byte $28 ; |  X X   | $9CBF

    .byte $00 ; |        | $9CC0
    .byte $00 ; |        | $9CC1
    .byte $3F ; |  XXXXXX| $9CC2
    .byte $FF ; |XXXXXXXX| $9CC3
    .byte $FF ; |XXXXXXXX| $9CC4
    .byte $FF ; |XXXXXXXX| $9CC5
    .byte $FF ; |XXXXXXXX| $9CC6
    .byte $FF ; |XXXXXXXX| $9CC7
    .byte $3F ; |  XXXXXX| $9CC8
    .byte $FF ; |XXXXXXXX| $9CC9
    .byte $3F ; |  XXXXXX| $9CCA
    .byte $FF ; |XXXXXXXX| $9CCB
    .byte $3F ; |  XXXXXX| $9CCC
    .byte $FF ; |XXXXXXXX| $9CCD
    .byte $3F ; |  XXXXXX| $9CCE
    .byte $FF ; |XXXXXXXX| $9CCF
    .byte $3F ; |  XXXXXX| $9CD0
    .byte $FF ; |XXXXXXXX| $9CD1
    .byte $3C ; |  XXXX  | $9CD2
    .byte $E7 ; |XXX  XXX| $9CD3
    .byte $3C ; |  XXXX  | $9CD4
    .byte $E7 ; |XXX  XXX| $9CD5
    .byte $3C ; |  XXXX  | $9CD6
    .byte $E7 ; |XXX  XXX| $9CD7
    .byte $3C ; |  XXXX  | $9CD8
    .byte $E7 ; |XXX  XXX| $9CD9
    .byte $3F ; |  XXXXXX| $9CDA
    .byte $FF ; |XXXXXXXX| $9CDB
    .byte $FF ; |XXXXXXXX| $9CDC
    .byte $FF ; |XXXXXXXX| $9CDD
    .byte $FF ; |XXXXXXXX| $9CDE
    .byte $FF ; |XXXXXXXX| $9CDF

    .byte $28 ; |  X X   | $9CE0
    .byte $2A ; |  X X X | $9CE1
    .byte $28 ; |  X X   | $9CE2
    .byte $26 ; |  X  XX | $9CE3
    .byte $24 ; |  X  X  | $9CE4
    .byte $22 ; |  X   X | $9CE5
    .byte $06 ; |     XX | $9CE6
    .byte $08 ; |    X   | $9CE7
    .byte $08 ; |    X   | $9CE8
    .byte $08 ; |    X   | $9CE9
    .byte $08 ; |    X   | $9CEA
    .byte $08 ; |    X   | $9CEB
    .byte $08 ; |    X   | $9CEC
    .byte $08 ; |    X   | $9CED
    .byte $08 ; |    X   | $9CEE
    .byte $08 ; |    X   | $9CEF
    .byte $08 ; |    X   | $9CF0
    .byte $08 ; |    X   | $9CF1
    .byte $08 ; |    X   | $9CF2
    .byte $08 ; |    X   | $9CF3
    .byte $08 ; |    X   | $9CF4
    .byte $08 ; |    X   | $9CF5
    .byte $08 ; |    X   | $9CF6
    .byte $08 ; |    X   | $9CF7
    .byte $08 ; |    X   | $9CF8
    .byte $08 ; |    X   | $9CF9
    .byte $08 ; |    X   | $9CFA
    .byte $08 ; |    X   | $9CFB
    .byte $08 ; |    X   | $9CFC
    .byte $06 ; |     XX | $9CFD
    .byte $04 ; |     X  | $9CFE
    .byte $02 ; |      X | $9CFF

    .byte $FF ; |XXXXXXXX| $9D00
    .byte $FF ; |XXXXXXXX| $9D01
    .byte $FF ; |XXXXXXXX| $9D02
    .byte $FF ; |XXXXXXXX| $9D03
    .byte $FF ; |XXXXXXXX| $9D04
    .byte $FF ; |XXXXXXXX| $9D05
    .byte $FF ; |XXXXXXXX| $9D06
    .byte $FF ; |XXXXXXXX| $9D07
    .byte $FF ; |XXXXXXXX| $9D08
    .byte $7F ; | XXXXXXX| $9D09
    .byte $FF ; |XXXXXXXX| $9D0A
    .byte $7F ; | XXXXXXX| $9D0B
    .byte $FF ; |XXXXXXXX| $9D0C
    .byte $7F ; | XXXXXXX| $9D0D
    .byte $FF ; |XXXXXXXX| $9D0E
    .byte $7F ; | XXXXXXX| $9D0F
    .byte $FF ; |XXXXXXXX| $9D10
    .byte $3F ; |  XXXXXX| $9D11
    .byte $FF ; |XXXXXXXX| $9D12
    .byte $3F ; |  XXXXXX| $9D13
    .byte $FF ; |XXXXXXXX| $9D14
    .byte $3F ; |  XXXXXX| $9D15
    .byte $FF ; |XXXXXXXX| $9D16
    .byte $3F ; |  XXXXXX| $9D17
    .byte $FF ; |XXXXXXXX| $9D18
    .byte $1F ; |   XXXXX| $9D19
    .byte $FF ; |XXXXXXXX| $9D1A
    .byte $1F ; |   XXXXX| $9D1B
    .byte $FF ; |XXXXXXXX| $9D1C
    .byte $1F ; |   XXXXX| $9D1D
    .byte $FF ; |XXXXXXXX| $9D1E
    .byte $00 ; |        | $9D1F

    .byte $04 ; |     X  | $9D20
    .byte $06 ; |     XX | $9D21
    .byte $08 ; |    X   | $9D22
    .byte $0A ; |    X X | $9D23
    .byte $08 ; |    X   | $9D24
    .byte $06 ; |     XX | $9D25
    .byte $08 ; |    X   | $9D26
    .byte $0A ; |    X X | $9D27
    .byte $08 ; |    X   | $9D28
    .byte $06 ; |     XX | $9D29
    .byte $08 ; |    X   | $9D2A
    .byte $0A ; |    X X | $9D2B
    .byte $08 ; |    X   | $9D2C
    .byte $06 ; |     XX | $9D2D
    .byte $08 ; |    X   | $9D2E
    .byte $0A ; |    X X | $9D2F
    .byte $08 ; |    X   | $9D30
    .byte $06 ; |     XX | $9D31
    .byte $08 ; |    X   | $9D32
    .byte $0A ; |    X X | $9D33
    .byte $08 ; |    X   | $9D34
    .byte $06 ; |     XX | $9D35
    .byte $08 ; |    X   | $9D36
    .byte $0A ; |    X X | $9D37
    .byte $08 ; |    X   | $9D38
    .byte $06 ; |     XX | $9D39
    .byte $08 ; |    X   | $9D3A
    .byte $08 ; |    X   | $9D3B
    .byte $0A ; |    X X | $9D3C
    .byte $06 ; |     XX | $9D3D
    .byte $2A ; |  X X X | $9D3E
    .byte $2A ; |  X X X | $9D3F

L9D40:
  COMMON_ROUTINE  BK_9000

L9DB5:
    ldy    #3                    ; 2
    lda    ram_D6                ; 3
    sec                          ; 2
    sbc    playerVpos            ; 3
    bcs    L9DC4                 ; 2³
    eor    #$FF                  ; 2
    adc    #$01                  ; 2
    dey                          ; 2
    dey                          ; 2
L9DC4:
    sta    ram_D7                ; 3
    lda    playerHpos            ; 3
    sec                          ; 2
    sbc    ram_92,X              ; 4
    bcs    L9DD2                 ; 2³
    eor    #$FF                  ; 2
    adc    #$01                  ; 2
    dey                          ; 2
L9DD2:
    sta    ram_D8                ; 3
    cmp    ram_D7                ; 3
    bcc    L9DF1                 ; 2³
    lda    ram_D7                ; 3
    asl                          ; 2
    asl                          ; 2
    adc    ram_D7                ; 3
    cmp    ram_D8                ; 3
    lda    #$00                  ; 2
    bcc    L9E0A                 ; 2³+1
    lda    ram_D7                ; 3
    lsr                          ; 2
    adc    ram_D7                ; 3
    cmp    ram_D8                ; 3
    lda    #$01                  ; 2
    bcc    L9E0A                 ; 2³+1
    bcs    L9E08                 ; 3+1   always branch

L9DF1:
    lda    ram_D8                ; 3
    asl                          ; 2
    asl                          ; 2
    adc    ram_D8                ; 3
    cmp    ram_D7                ; 3
    lda    #$04                  ; 2
    bcc    L9E0A                 ; 2³+1
    lda    ram_D8                ; 3
    lsr                          ; 2
    adc    ram_D8                ; 3
    cmp    ram_D7                ; 3
    lda    #$03                  ; 2
    bcc    L9E0A                 ; 2³
L9E08:
    lda    #$02                  ; 2
L9E0A:
    sty    ram_D7                ; 3
    asl                          ; 2
    asl                          ; 2
    ora    ram_D7                ; 3
    sta    ram_D7                ; 3
    jmp    L9FEB                 ; 3

Zero:
    .byte $34 ; |  XX X  | $9E15
    .byte $66 ; | XX  XX | $9E16
    .byte $66 ; | XX  XX | $9E17
    .byte $66 ; | XX  XX | $9E18
    .byte $66 ; | XX  XX | $9E19
    .byte $66 ; | XX  XX | $9E1A
    .byte $2C ; |  X XX  | $9E1B
    .byte $00 ; |        | $9E1C
One:
    .byte $3C ; |  XXXX  | $9E1D
    .byte $18 ; |   XX   | $9E1E
    .byte $18 ; |   XX   | $9E1F
    .byte $18 ; |   XX   | $9E20
    .byte $18 ; |   XX   | $9E21
    .byte $38 ; |  XXX   | $9E22
    .byte $18 ; |   XX   | $9E23
    .byte $00 ; |        | $9E24
Two:
    .byte $76 ; | XXX XX | $9E25
    .byte $60 ; | XX     | $9E26
    .byte $60 ; | XX     | $9E27
    .byte $2C ; |  X XX  | $9E28
    .byte $06 ; |     XX | $9E29
    .byte $46 ; | X   XX | $9E2A
    .byte $2C ; |  X XX  | $9E2B
    .byte $00 ; |        | $9E2C
Three:
    .byte $2C ; |  X XX  | $9E2D
    .byte $46 ; | X   XX | $9E2E
    .byte $06 ; |     XX | $9E2F
    .byte $0C ; |    XX  | $9E30
    .byte $06 ; |     XX | $9E31
    .byte $46 ; | X   XX | $9E32
    .byte $2C ; |  X XX  | $9E33
    .byte $00 ; |        | $9E34
Four:
    .byte $0C ; |    XX  | $9E35
    .byte $0C ; |    XX  | $9E36
    .byte $6E ; | XX XXX | $9E37
    .byte $4C ; | X  XX  | $9E38
    .byte $2C ; |  X XX  | $9E39
    .byte $0C ; |    XX  | $9E3A
    .byte $0C ; |    XX  | $9E3B
    .byte $00 ; |        | $9E3C
Five:
    .byte $6C ; | XX XX  | $9E3D
    .byte $46 ; | X   XX | $9E3E
    .byte $06 ; |     XX | $9E3F
    .byte $74 ; | XXX X  | $9E40
    .byte $60 ; | XX     | $9E41
    .byte $60 ; | XX     | $9E42
    .byte $76 ; | XXX XX | $9E43
    .byte $00 ; |        | $9E44
Six:
    .byte $2C ; |  X XX  | $9E45
    .byte $66 ; | XX  XX | $9E46
    .byte $66 ; | XX  XX | $9E47
    .byte $74 ; | XXX X  | $9E48
    .byte $60 ; | XX     | $9E49
    .byte $62 ; | XX   X | $9E4A
    .byte $2C ; |  X XX  | $9E4B
    .byte $00 ; |        | $9E4C
Seven:
    .byte $18 ; |   XX   | $9E4D
    .byte $18 ; |   XX   | $9E4E
    .byte $18 ; |   XX   | $9E4F
    .byte $0C ; |    XX  | $9E50
    .byte $06 ; |     XX | $9E51
    .byte $42 ; | X    X | $9E52
    .byte $6E ; | XX XXX | $9E53
    .byte $00 ; |        | $9E54
Eight:
    .byte $34 ; |  XX X  | $9E55
    .byte $66 ; | XX  XX | $9E56
    .byte $66 ; | XX  XX | $9E57
    .byte $2C ; |  X XX  | $9E58
    .byte $66 ; | XX  XX | $9E59
    .byte $66 ; | XX  XX | $9E5A
    .byte $34 ; |  XX X  | $9E5B
    .byte $00 ; |        | $9E5C
Nine:
    .byte $34 ; |  XX X  | $9E5D
    .byte $46 ; | X   XX | $9E5E
    .byte $06 ; |     XX | $9E5F
    .byte $2E ; |  X XXX | $9E60
    .byte $66 ; | XX  XX | $9E61
    .byte $66 ; | XX  XX | $9E62
    .byte $34 ; |  XX X  | $9E63
    .byte $00 ; |        | $9E64
ActivisionOne:
    .byte $61 ; | XX    X| $9E65
    .byte $31 ; |  XX   X| $9E66
    .byte $1F ; |   XXXXX| $9E67
    .byte $0D ; |    XX X| $9E68
    .byte $07 ; |     XXX| $9E69
    .byte $03 ; |      XX| $9E6A
    .byte $01 ; |       X| $9E6B
    .byte $00 ; |        | $9E6C
ActivisionTwo:
    .byte $6A ; | XX X X | $9E6D
    .byte $4A ; | X  X X | $9E6E
    .byte $4A ; | X  X X | $9E6F
    .byte $4A ; | X  X X | $9E70
    .byte $6A ; | XX X X | $9E71
    .byte $08 ; |    X   | $9E72
    .byte $7F ; | XXXXXXX| $9E73
    .byte $00 ; |        | $9E74
ActivisionThree:
    .byte $85 ; |X    X X| $9E75
    .byte $C4 ; |XX   X  | $9E76
    .byte $E5 ; |XXX  X X| $9E77
    .byte $B5 ; |X XX X X| $9E78
    .byte $99 ; |X  XX  X| $9E79
    .byte $8C ; |X   XX  | $9E7A
    .byte $87 ; |X    XXX| $9E7B
    .byte $00 ; |        | $9E7C
ActivisionFour:
    .byte $D7 ; |XX X XXX| $9E7D
    .byte $55 ; | X X X X| $9E7E
    .byte $D5 ; |XX X X X| $9E7F
    .byte $15 ; |   X X X| $9E80
    .byte $D7 ; |XX X XXX| $9E81
    .byte $00 ; |        | $9E82
    .byte $F0 ; |XXXX    | $9E83
    .byte $00 ; |        | $9E84
ActivisionFive:
    .byte $48 ; | X  X   | $9E85
    .byte $58 ; | X XX   | $9E86
    .byte $78 ; | XXXX   | $9E87
    .byte $68 ; | XX X   | $9E88
    .byte $48 ; | X  X   | $9E89
    .byte $00 ; |        | $9E8A
    .byte $00 ; |        | $9E8B
    .byte $00 ; |        | $9E8C
BlankDigit:
    .byte $00 ; |        | $9E8D
    .byte $00 ; |        | $9E8E
    .byte $00 ; |        | $9E8F
    .byte $00 ; |        | $9E90
    .byte $00 ; |        | $9E91
    .byte $00 ; |        | $9E92
    .byte $00 ; |        | $9E93
    .byte $00 ; |        | $9E94

  IF CAPCOM

;     XX   XX  XXX   XX   XX  X   X
;    XXXX XXXX X XX XXXX XXXX XX XX
;    X  X X  X X  X X  X X  X XXXXX
;    X    X  X X XX X    X  X X X X
;    X  X XXXX XXX  X  X X  X X X X
;    XXXX X  X X    XXXX XXXX X   X
;     XX  X  X X     XX   XX  X   X
;

LogoOne:
    .byte $64 ; | XX  X  | $9E95
    .byte $F4 ; |XXXX X  | $9E96
    .byte $97 ; |X  X XXX| $9E97
    .byte $84 ; |X    X  | $9E98
    .byte $94 ; |X  X X  | $9E99
    .byte $F7 ; |XXXX XXX| $9E9A
    .byte $63 ; | XX   XX| $9E9B
    .byte $00 ; |        | $9E9C
LogoTwo:
    .byte $A0 ; |X X     | $9E9D
    .byte $A1 ; |X X    X| $9E9E
    .byte $B9 ; |X XXX  X| $9E9F
    .byte $AD ; |X X XX X| $9EA0
    .byte $A5 ; |X X  X X| $9EA1
    .byte $AD ; |X X XX X| $9EA2
    .byte $38 ; |  XXX   | $9EA3
    .byte $00 ; |        | $9EA4
LogoThree:
    .byte $C6 ; |XX   XX | $9EA5
    .byte $EF ; |XXX XXXX| $9EA6
    .byte $29 ; |  X X  X| $9EA7
    .byte $09 ; |    X  X| $9EA8
    .byte $29 ; |  X X  X| $9EA9
    .byte $EF ; |XXX XXXX| $9EAA
    .byte $C6 ; |XX   XX | $9EAB
    .byte $00 ; |        | $9EAC
LogoFour:
    .byte $44 ; | X   X  | $9EAD
    .byte $44 ; | X   X  | $9EAE
    .byte $54 ; | X X X  | $9EAF
    .byte $54 ; | X X X  | $9EB0
    .byte $7C ; | XXXXX  | $9EB1
    .byte $6C ; | XX XX  | $9EB2
    .byte $44 ; | X   X  | $9EB3
    .byte $00 ; |        | $9EB4

  ENDIF

  IF DATAEAST

;    XX               XXX
;    X X  X  XXX  X   X    X   XX XXX
;    X X XXX  X  XXX  X   X X X    X
;    X X X X  X  X X  XX  X X  X   X
;    X X XXX  X  XXX  X   XXX   X  X
;    X X X X  X  X X  X   X X   X  X
;    XX  X X  X  X X  XXX X X XX   X
;

LogoOne:
    .byte $CA ; |XX  X X | $9E95
    .byte $AA ; |X X X X | $9E96
    .byte $AE ; |X X XXX | $9E97
    .byte $AA ; |X X X X | $9E98
    .byte $AE ; |X X XXX | $9E99
    .byte $A4 ; |X X  X  | $9E9A
    .byte $C0 ; |XX      | $9E9B
    .byte $00 ; |        | $9E9C
LogoTwo:
    .byte $4A ; | X  X X | $9E9D
    .byte $4A ; | X  X X | $9E9E
    .byte $4E ; | X  XXX | $9E9F
    .byte $4A ; | X  X X | $9EA0
    .byte $4E ; | X  XXX | $9EA1
    .byte $E4 ; |XXX  X  | $9EA2
    .byte $00 ; |        | $9EA3
    .byte $00 ; |        | $9EA4
LogoThree:
    .byte $75 ; | XXX X X| $9EA5
    .byte $45 ; | X   X X| $9EA6
    .byte $47 ; | X   XXX| $9EA7
    .byte $65 ; | XX  X X| $9EA8
    .byte $45 ; | X   X X| $9EA9
    .byte $42 ; | X    X | $9EAA
    .byte $70 ; | XXX    | $9EAB
    .byte $00 ; |        | $9EAC
LogoFour:
    .byte $62 ; | XX   X | $9EAD
    .byte $12 ; |   X  X | $9EAE
    .byte $12 ; |   X  X | $9EAF
    .byte $22 ; |  X   X | $9EB0
    .byte $42 ; | X    X | $9EB1
    .byte $37 ; |  XX XXX| $9EB2
    .byte $00 ; |        | $9EB3
    .byte $00 ; |        | $9EB4

  ENDIF

Copyright:
    .byte $78 ; | XXXX   | $9EB5
    .byte $CC ; |XX  XX  | $9EB6
    .byte $B4 ; |X XX X  | $9EB7
    .byte $A4 ; |X X  X  | $9EB8
    .byte $B4 ; |X XX X  | $9EB9
    .byte $CC ; |XX  XX  | $9EBA
    .byte $78 ; | XXXX   | $9EBB
    .byte $00 ; |        | $9EBC

    .byte $FF ; |XXXXXXXX| $9EBD  free bytes
    .byte $FF ; |XXXXXXXX| $9EBE
    .byte $FF ; |XXXXXXXX| $9EBF
    .byte $FF ; |XXXXXXXX| $9EC0
    .byte $FF ; |XXXXXXXX| $9EC1
    .byte $FF ; |XXXXXXXX| $9EC2
    .byte $FF ; |XXXXXXXX| $9EC3
    .byte $FF ; |XXXXXXXX| $9EC4
    .byte $FF ; |XXXXXXXX| $9EC5
    .byte $FF ; |XXXXXXXX| $9EC6
    .byte $FF ; |XXXXXXXX| $9EC7
    .byte $FF ; |XXXXXXXX| $9EC8
    .byte $FF ; |XXXXXXXX| $9EC9
    .byte $FF ; |XXXXXXXX| $9ECA
    .byte $FF ; |XXXXXXXX| $9ECB
    .byte $FF ; |XXXXXXXX| $9ECC
    .byte $FF ; |XXXXXXXX| $9ECD
    .byte $FF ; |XXXXXXXX| $9ECE
    .byte $FF ; |XXXXXXXX| $9ECF
    .byte $FF ; |XXXXXXXX| $9ED0
    .byte $FF ; |XXXXXXXX| $9ED1
    .byte $FF ; |XXXXXXXX| $9ED2
    .byte $FF ; |XXXXXXXX| $9ED3
    .byte $FF ; |XXXXXXXX| $9ED4
    .byte $FF ; |XXXXXXXX| $9ED5
    .byte $FF ; |XXXXXXXX| $9ED6
    .byte $FF ; |XXXXXXXX| $9ED7
    .byte $FF ; |XXXXXXXX| $9ED8
    .byte $FF ; |XXXXXXXX| $9ED9
    .byte $FF ; |XXXXXXXX| $9EDA
    .byte $FF ; |XXXXXXXX| $9EDB
    .byte $FF ; |XXXXXXXX| $9EDC
    .byte $FF ; |XXXXXXXX| $9EDD
    .byte $FF ; |XXXXXXXX| $9EDE
    .byte $FF ; |XXXXXXXX| $9EDF
    .byte $FF ; |XXXXXXXX| $9EE0
    .byte $FF ; |XXXXXXXX| $9EE1
    .byte $FF ; |XXXXXXXX| $9EE2
    .byte $FF ; |XXXXXXXX| $9EE3
    .byte $FF ; |XXXXXXXX| $9EE4
    .byte $FF ; |XXXXXXXX| $9EE5
    .byte $FF ; |XXXXXXXX| $9EE6
    .byte $FF ; |XXXXXXXX| $9EE7
    .byte $FF ; |XXXXXXXX| $9EE8
    .byte $FF ; |XXXXXXXX| $9EE9
    .byte $FF ; |XXXXXXXX| $9EEA
    .byte $FF ; |XXXXXXXX| $9EEB
    .byte $FF ; |XXXXXXXX| $9EEC
    .byte $FF ; |XXXXXXXX| $9EED
    .byte $FF ; |XXXXXXXX| $9EEE
    .byte $FF ; |XXXXXXXX| $9EEF
    .byte $FF ; |XXXXXXXX| $9EF0
    .byte $FF ; |XXXXXXXX| $9EF1
    .byte $FF ; |XXXXXXXX| $9EF2
    .byte $FF ; |XXXXXXXX| $9EF3
    .byte $FF ; |XXXXXXXX| $9EF4
    .byte $FF ; |XXXXXXXX| $9EF5
    .byte $FF ; |XXXXXXXX| $9EF6
    .byte $FF ; |XXXXXXXX| $9EF7
    .byte $FF ; |XXXXXXXX| $9EF8
    .byte $FF ; |XXXXXXXX| $9EF9
    .byte $FF ; |XXXXXXXX| $9EFA
    .byte $FF ; |XXXXXXXX| $9EFB
    .byte $FF ; |XXXXXXXX| $9EFC
    .byte $FF ; |XXXXXXXX| $9EFD
    .byte $FF ; |XXXXXXXX| $9EFE
    .byte $FF ; |XXXXXXXX| $9EFF
    .byte $FF ; |XXXXXXXX| $9F00
    .byte $FF ; |XXXXXXXX| $9F01
    .byte $FF ; |XXXXXXXX| $9F02
    .byte $FF ; |XXXXXXXX| $9F03
    .byte $FF ; |XXXXXXXX| $9F04
    .byte $FF ; |XXXXXXXX| $9F05
    .byte $FF ; |XXXXXXXX| $9F06
    .byte $FF ; |XXXXXXXX| $9F07
    .byte $FF ; |XXXXXXXX| $9F08
    .byte $FF ; |XXXXXXXX| $9F09
    .byte $FF ; |XXXXXXXX| $9F0A
    .byte $FF ; |XXXXXXXX| $9F0B
    .byte $FF ; |XXXXXXXX| $9F0C
    .byte $FF ; |XXXXXXXX| $9F0D
    .byte $FF ; |XXXXXXXX| $9F0E
    .byte $FF ; |XXXXXXXX| $9F0F
    .byte $FF ; |XXXXXXXX| $9F10
    .byte $FF ; |XXXXXXXX| $9F11
    .byte $FF ; |XXXXXXXX| $9F12
    .byte $FF ; |XXXXXXXX| $9F13
    .byte $FF ; |XXXXXXXX| $9F14
    .byte $FF ; |XXXXXXXX| $9F15
    .byte $FF ; |XXXXXXXX| $9F16
    .byte $FF ; |XXXXXXXX| $9F17
    .byte $FF ; |XXXXXXXX| $9F18
    .byte $FF ; |XXXXXXXX| $9F19
    .byte $FF ; |XXXXXXXX| $9F1A
    .byte $FF ; |XXXXXXXX| $9F1B
    .byte $FF ; |XXXXXXXX| $9F1C
    .byte $FF ; |XXXXXXXX| $9F1D
    .byte $FF ; |XXXXXXXX| $9F1E
    .byte $FF ; |XXXXXXXX| $9F1F
    .byte $FF ; |XXXXXXXX| $9F20
    .byte $FF ; |XXXXXXXX| $9F21
    .byte $FF ; |XXXXXXXX| $9F22
    .byte $FF ; |XXXXXXXX| $9F23
    .byte $FF ; |XXXXXXXX| $9F24
    .byte $FF ; |XXXXXXXX| $9F25
    .byte $FF ; |XXXXXXXX| $9F26
    .byte $FF ; |XXXXXXXX| $9F27
    .byte $FF ; |XXXXXXXX| $9F28
    .byte $FF ; |XXXXXXXX| $9F29
    .byte $FF ; |XXXXXXXX| $9F2A
    .byte $FF ; |XXXXXXXX| $9F2B
    .byte $FF ; |XXXXXXXX| $9F2C
    .byte $FF ; |XXXXXXXX| $9F2D
    .byte $FF ; |XXXXXXXX| $9F2E
    .byte $FF ; |XXXXXXXX| $9F2F
    .byte $FF ; |XXXXXXXX| $9F30
    .byte $FF ; |XXXXXXXX| $9F31
    .byte $FF ; |XXXXXXXX| $9F32
    .byte $FF ; |XXXXXXXX| $9F33
    .byte $FF ; |XXXXXXXX| $9F34
    .byte $FF ; |XXXXXXXX| $9F35
    .byte $FF ; |XXXXXXXX| $9F36
    .byte $FF ; |XXXXXXXX| $9F37
    .byte $FF ; |XXXXXXXX| $9F38
    .byte $FF ; |XXXXXXXX| $9F39
    .byte $FF ; |XXXXXXXX| $9F3A
    .byte $FF ; |XXXXXXXX| $9F3B
    .byte $FF ; |XXXXXXXX| $9F3C
    .byte $FF ; |XXXXXXXX| $9F3D
    .byte $FF ; |XXXXXXXX| $9F3E
    .byte $FF ; |XXXXXXXX| $9F3F
    .byte $FF ; |XXXXXXXX| $9F40
    .byte $FF ; |XXXXXXXX| $9F41
    .byte $FF ; |XXXXXXXX| $9F42
    .byte $FF ; |XXXXXXXX| $9F43
    .byte $FF ; |XXXXXXXX| $9F44
    .byte $FF ; |XXXXXXXX| $9F45
    .byte $FF ; |XXXXXXXX| $9F46
    .byte $FF ; |XXXXXXXX| $9F47
    .byte $FF ; |XXXXXXXX| $9F48
    .byte $FF ; |XXXXXXXX| $9F49
    .byte $FF ; |XXXXXXXX| $9F4A
    .byte $FF ; |XXXXXXXX| $9F4B
    .byte $FF ; |XXXXXXXX| $9F4C
    .byte $FF ; |XXXXXXXX| $9F4D
    .byte $FF ; |XXXXXXXX| $9F4E
    .byte $FF ; |XXXXXXXX| $9F4F
    .byte $FF ; |XXXXXXXX| $9F50
    .byte $FF ; |XXXXXXXX| $9F51
    .byte $FF ; |XXXXXXXX| $9F52
    .byte $FF ; |XXXXXXXX| $9F53
    .byte $FF ; |XXXXXXXX| $9F54
    .byte $FF ; |XXXXXXXX| $9F55
    .byte $FF ; |XXXXXXXX| $9F56
    .byte $FF ; |XXXXXXXX| $9F57
    .byte $FF ; |XXXXXXXX| $9F58
    .byte $FF ; |XXXXXXXX| $9F59
    .byte $FF ; |XXXXXXXX| $9F5A
    .byte $FF ; |XXXXXXXX| $9F5B
    .byte $FF ; |XXXXXXXX| $9F5C
    .byte $FF ; |XXXXXXXX| $9F5D
    .byte $FF ; |XXXXXXXX| $9F5E
    .byte $FF ; |XXXXXXXX| $9F5F

       ORG $0F60
      RORG $9F60

    .byte $FF ; |XXXXXXXX| $9F60
    .byte $FF ; |XXXXXXXX| $9F61
    .byte $FF ; |XXXXXXXX| $9F62
    .byte $FF ; |XXXXXXXX| $9F63
    .byte $FF ; |XXXXXXXX| $9F64
    .byte $FF ; |XXXXXXXX| $9F65
    .byte $FF ; |XXXXXXXX| $9F66
    .byte $FF ; |XXXXXXXX| $9F67
    .byte $FF ; |XXXXXXXX| $9F68
    .byte $FF ; |XXXXXXXX| $9F69
    .byte $FF ; |XXXXXXXX| $9F6A
    .byte $FF ; |XXXXXXXX| $9F6B
    .byte $FF ; |XXXXXXXX| $9F6C

    .byte $00   ; $9F6D
    .byte $00   ; $9F6E
    .byte $00   ; $9F6F

M9F70:
    jmp    L9F73                 ; 3
L9F73:
    jmp    L9000                 ; 3

    .byte $FF ; |XXXXXXXX| $9F76
    .byte $FF ; |XXXXXXXX| $9F77
    .byte $FF ; |XXXXXXXX| $9F78
    .byte $FF ; |XXXXXXXX| $9F79
    .byte $FF ; |XXXXXXXX| $9F7A
    .byte $FF ; |XXXXXXXX| $9F7B
    .byte $FF ; |XXXXXXXX| $9F7C
    .byte $FF ; |XXXXXXXX| $9F7D
    .byte $FF ; |XXXXXXXX| $9F7E
    .byte $FF ; |XXXXXXXX| $9F7F
    .byte $FF ; |XXXXXXXX| $9F80
    .byte $FF ; |XXXXXXXX| $9F81
    .byte $FF ; |XXXXXXXX| $9F82
    .byte $FF ; |XXXXXXXX| $9F83
    .byte $FF ; |XXXXXXXX| $9F84
    .byte $FF ; |XXXXXXXX| $9F85
    .byte $FF ; |XXXXXXXX| $9F86
    .byte $FF ; |XXXXXXXX| $9F87
    .byte $FF ; |XXXXXXXX| $9F88
    .byte $FF ; |XXXXXXXX| $9F89
    .byte $FF ; |XXXXXXXX| $9F8A
    .byte $FF ; |XXXXXXXX| $9F8B
    .byte $FF ; |XXXXXXXX| $9F8C
    .byte $FF ; |XXXXXXXX| $9F8D
    .byte $FF ; |XXXXXXXX| $9F8E
    .byte $FF ; |XXXXXXXX| $9F8F
    .byte $FF ; |XXXXXXXX| $9F90
    .byte $FF ; |XXXXXXXX| $9F91
    .byte $FF ; |XXXXXXXX| $9F92
    .byte $FF ; |XXXXXXXX| $9F93
    .byte $FF ; |XXXXXXXX| $9F94
    .byte $FF ; |XXXXXXXX| $9F95
    .byte $FF ; |XXXXXXXX| $9F96
    .byte $FF ; |XXXXXXXX| $9F97

    .byte $00   ; $9F98
    .byte $00   ; $9F99
    .byte $00   ; $9F9A

M9F9B:
    jmp    L9F9E                 ; 3
L9F9E:
    jmp    L9D40                 ; 3

    .byte $FF ; |XXXXXXXX| $9FA1
    .byte $FF ; |XXXXXXXX| $9FA2
    .byte $FF ; |XXXXXXXX| $9FA3
    .byte $FF ; |XXXXXXXX| $9FA4
    .byte $FF ; |XXXXXXXX| $9FA5
    .byte $FF ; |XXXXXXXX| $9FA6
    .byte $FF ; |XXXXXXXX| $9FA7
    .byte $FF ; |XXXXXXXX| $9FA8
    .byte $FF ; |XXXXXXXX| $9FA9
    .byte $FF ; |XXXXXXXX| $9FAA
    .byte $FF ; |XXXXXXXX| $9FAB
    .byte $FF ; |XXXXXXXX| $9FAC
    .byte $FF ; |XXXXXXXX| $9FAD
    .byte $FF ; |XXXXXXXX| $9FAE
    .byte $FF ; |XXXXXXXX| $9FAF
    .byte $FF ; |XXXXXXXX| $9FB0
    .byte $FF ; |XXXXXXXX| $9FB1
    .byte $FF ; |XXXXXXXX| $9FB2
    .byte $FF ; |XXXXXXXX| $9FB3
    .byte $FF ; |XXXXXXXX| $9FB4
    .byte $FF ; |XXXXXXXX| $9FB5
    .byte $FF ; |XXXXXXXX| $9FB6
    .byte $FF ; |XXXXXXXX| $9FB7
    .byte $FF ; |XXXXXXXX| $9FB8
    .byte $FF ; |XXXXXXXX| $9FB9
    .byte $FF ; |XXXXXXXX| $9FBA
    .byte $FF ; |XXXXXXXX| $9FBB
    .byte $FF ; |XXXXXXXX| $9FBC
    .byte $FF ; |XXXXXXXX| $9FBD
    .byte $FF ; |XXXXXXXX| $9FBE
    .byte $FF ; |XXXXXXXX| $9FBF
    .byte $FF ; |XXXXXXXX| $9FC0
    .byte $FF ; |XXXXXXXX| $9FC1
    .byte $FF ; |XXXXXXXX| $9FC2
    .byte $FF ; |XXXXXXXX| $9FC3
    .byte $FF ; |XXXXXXXX| $9FC4
    .byte $FF ; |XXXXXXXX| $9FC5
    .byte $FF ; |XXXXXXXX| $9FC6
    .byte $FF ; |XXXXXXXX| $9FC7
    .byte $FF ; |XXXXXXXX| $9FC8
    .byte $FF ; |XXXXXXXX| $9FC9
    .byte $FF ; |XXXXXXXX| $9FCA
    .byte $FF ; |XXXXXXXX| $9FCB
    .byte $FF ; |XXXXXXXX| $9FCC
    .byte $FF ; |XXXXXXXX| $9FCD
    .byte $FF ; |XXXXXXXX| $9FCE
    .byte $FF ; |XXXXXXXX| $9FCF
    .byte $FF ; |XXXXXXXX| $9FD0
    .byte $FF ; |XXXXXXXX| $9FD1
    .byte $FF ; |XXXXXXXX| $9FD2
    .byte $FF ; |XXXXXXXX| $9FD3
    .byte $FF ; |XXXXXXXX| $9FD4
    .byte $FF ; |XXXXXXXX| $9FD5
    .byte $FF ; |XXXXXXXX| $9FD6
    .byte $FF ; |XXXXXXXX| $9FD7
    .byte $FF ; |XXXXXXXX| $9FD8

    .byte $00   ; $9FD9
    .byte $00   ; $9FDA
    .byte $00   ; $9FDB

M9FDC:
    jmp    L9FDF                 ; 3
L9FDF:
    jmp    L9DB5                 ; 3

    .byte $00   ; $9FE2
    .byte $00   ; $9FE3
    .byte $00   ; $9FE4

M9FE5:
    jmp    L9FE8                 ; 3
L9FE8:
    jmp    L948A                 ; 3

L9FEB:
    bit    BANK_3                ; 4   bankswitch, use RTS
    rts                          ; 6   not used

START_0:
    cli                          ; 2
    bit    BANK_3                ; 4
    jmp    LF000                 ; 3   not used

       ORG $0FF6
      RORG $9FF6

    .byte $EA   ; $9FF6
    .byte $EA   ; $9FF7
    .byte $EA   ; $9FF8
    .byte $EA   ; $9FF9
    .byte $EA   ; $9FFA
    .byte $EA   ; $9FFB

    .word START_0
    .word START_0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $B000

LB000:
   MAIN_KERNEL  BK_B000

    .byte $00 ; |        | $BB00
    .byte $00 ; |        | $BB01
    .byte $00 ; |        | $BB02
    .byte $00 ; |        | $BB03
    .byte $00 ; |        | $BB04
    .byte $00 ; |        | $BB05
    .byte $00 ; |        | $BB06
    .byte $00 ; |        | $BB07
    .byte $00 ; |        | $BB08
    .byte $00 ; |        | $BB09
    .byte $00 ; |        | $BB0A
    .byte $00 ; |        | $BB0B
    .byte $00 ; |        | $BB0C
    .byte $00 ; |        | $BB0D
    .byte $00 ; |        | $BB0E
    .byte $00 ; |        | $BB0F
    .byte $00 ; |        | $BB10
    .byte $00 ; |        | $BB11
    .byte $00 ; |        | $BB12
    .byte $00 ; |        | $BB13
    .byte $00 ; |        | $BB14
    .byte $00 ; |        | $BB15
    .byte $00 ; |        | $BB16
    .byte $00 ; |        | $BB17
    .byte $00 ; |        | $BB18
    .byte $00 ; |        | $BB19
    .byte $00 ; |        | $BB1A
    .byte $00 ; |        | $BB1B
    .byte $00 ; |        | $BB1C
    .byte $00 ; |        | $BB1D
    .byte $00 ; |        | $BB1E
    .byte $00 ; |        | $BB1F

    .byte $0E ; |    XXX | $BB20
    .byte $98 ; |X  XX   | $BB21
    .byte $20 ; |  X     | $BB22
    .byte $20 ; |  X     | $BB23
    .byte $20 ; |  X     | $BB24
    .byte $20 ; |  X     | $BB25
    .byte $20 ; |  X     | $BB26
    .byte $20 ; |  X     | $BB27
    .byte $20 ; |  X     | $BB28
    .byte $20 ; |  X     | $BB29
    .byte $20 ; |  X     | $BB2A
    .byte $20 ; |  X     | $BB2B
    .byte $22 ; |  X   X | $BB2C
    .byte $22 ; |  X   X | $BB2D
    .byte $22 ; |  X   X | $BB2E
    .byte $22 ; |  X   X | $BB2F
    .byte $24 ; |  X  X  | $BB30
    .byte $24 ; |  X  X  | $BB31
    .byte $24 ; |  X  X  | $BB32
    .byte $24 ; |  X  X  | $BB33
    .byte $24 ; |  X  X  | $BB34
    .byte $26 ; |  X  XX | $BB35
    .byte $26 ; |  X  XX | $BB36
    .byte $26 ; |  X  XX | $BB37
    .byte $28 ; |  X X   | $BB38
    .byte $98 ; |X  XX   | $BB39
    .byte $98 ; |X  XX   | $BB3A
    .byte $98 ; |X  XX   | $BB3B
    .byte $98 ; |X  XX   | $BB3C
    .byte $98 ; |X  XX   | $BB3D
    .byte $98 ; |X  XX   | $BB3E
    .byte $98 ; |X  XX   | $BB3F

    .byte $00 ; |        | $BB40
    .byte $00 ; |        | $BB41
    .byte $00 ; |        | $BB42
    .byte $00 ; |        | $BB43
    .byte $00 ; |        | $BB44
    .byte $00 ; |        | $BB45
    .byte $00 ; |        | $BB46
    .byte $00 ; |        | $BB47
    .byte $F0 ; |XXXX    | $BB48
    .byte $00 ; |        | $BB49
    .byte $FC ; |XXXXXX  | $BB4A
    .byte $00 ; |        | $BB4B
    .byte $FE ; |XXXXXXX | $BB4C
    .byte $00 ; |        | $BB4D
    .byte $FE ; |XXXXXXX | $BB4E
    .byte $00 ; |        | $BB4F
    .byte $F8 ; |XXXXX   | $BB50
    .byte $00 ; |        | $BB51
    .byte $E0 ; |XXX     | $BB52
    .byte $00 ; |        | $BB53
    .byte $00 ; |        | $BB54
    .byte $00 ; |        | $BB55
    .byte $00 ; |        | $BB56
    .byte $00 ; |        | $BB57
    .byte $00 ; |        | $BB58
    .byte $00 ; |        | $BB59
    .byte $00 ; |        | $BB5A
    .byte $00 ; |        | $BB5B
    .byte $00 ; |        | $BB5C
    .byte $00 ; |        | $BB5D
    .byte $00 ; |        | $BB5E
    .byte $00 ; |        | $BB5F

    .byte $0E ; |    XXX | $BB60
    .byte $0E ; |    XXX | $BB61
    .byte $0E ; |    XXX | $BB62
    .byte $0E ; |    XXX | $BB63
    .byte $0E ; |    XXX | $BB64
    .byte $0E ; |    XXX | $BB65
    .byte $0E ; |    XXX | $BB66
    .byte $20 ; |  X     | $BB67
    .byte $20 ; |  X     | $BB68
    .byte $20 ; |  X     | $BB69
    .byte $20 ; |  X     | $BB6A
    .byte $20 ; |  X     | $BB6B
    .byte $22 ; |  X   X | $BB6C
    .byte $22 ; |  X   X | $BB6D
    .byte $24 ; |  X  X  | $BB6E
    .byte $24 ; |  X  X  | $BB6F
    .byte $26 ; |  X  XX | $BB70
    .byte $26 ; |  X  XX | $BB71
    .byte $28 ; |  X X   | $BB72
    .byte $0E ; |    XXX | $BB73
    .byte $0E ; |    XXX | $BB74
    .byte $0E ; |    XXX | $BB75
    .byte $0E ; |    XXX | $BB76
    .byte $0E ; |    XXX | $BB77
    .byte $0E ; |    XXX | $BB78
    .byte $0E ; |    XXX | $BB79
    .byte $0E ; |    XXX | $BB7A
    .byte $0E ; |    XXX | $BB7B
    .byte $0E ; |    XXX | $BB7C
    .byte $0E ; |    XXX | $BB7D
    .byte $0E ; |    XXX | $BB7E
    .byte $0E ; |    XXX | $BB7F

    .byte $00 ; |        | $BB80
    .byte $00 ; |        | $BB81
    .byte $00 ; |        | $BB82
    .byte $00 ; |        | $BB83
    .byte $00 ; |        | $BB84
    .byte $00 ; |        | $BB85
    .byte $00 ; |        | $BB86
    .byte $00 ; |        | $BB87
    .byte $07 ; |     XXX| $BB88
    .byte $07 ; |     XXX| $BB89
    .byte $1F ; |   XXXXX| $BB8A
    .byte $0F ; |    XXXX| $BB8B
    .byte $3F ; |  XXXXXX| $BB8C
    .byte $1F ; |   XXXXX| $BB8D
    .byte $3F ; |  XXXXXX| $BB8E
    .byte $1F ; |   XXXXX| $BB8F
    .byte $1F ; |   XXXXX| $BB90
    .byte $07 ; |     XXX| $BB91
    .byte $07 ; |     XXX| $BB92
    .byte $00 ; |        | $BB93
    .byte $00 ; |        | $BB94
    .byte $00 ; |        | $BB95
    .byte $00 ; |        | $BB96
    .byte $00 ; |        | $BB97
    .byte $00 ; |        | $BB98
    .byte $00 ; |        | $BB99
    .byte $00 ; |        | $BB9A
    .byte $00 ; |        | $BB9B
    .byte $00 ; |        | $BB9C
    .byte $00 ; |        | $BB9D
    .byte $00 ; |        | $BB9E
    .byte $00 ; |        | $BB9F

    .byte $0E ; |    XXX | $BBA0
    .byte $0E ; |    XXX | $BBA1
    .byte $0E ; |    XXX | $BBA2
    .byte $0E ; |    XXX | $BBA3
    .byte $0E ; |    XXX | $BBA4
    .byte $0E ; |    XXX | $BBA5
    .byte $0E ; |    XXX | $BBA6
    .byte $20 ; |  X     | $BBA7
    .byte $20 ; |  X     | $BBA8
    .byte $20 ; |  X     | $BBA9
    .byte $20 ; |  X     | $BBAA
    .byte $20 ; |  X     | $BBAB
    .byte $22 ; |  X   X | $BBAC
    .byte $22 ; |  X   X | $BBAD
    .byte $24 ; |  X  X  | $BBAE
    .byte $24 ; |  X  X  | $BBAF
    .byte $26 ; |  X  XX | $BBB0
    .byte $26 ; |  X  XX | $BBB1
    .byte $28 ; |  X X   | $BBB2
    .byte $0E ; |    XXX | $BBB3
    .byte $0E ; |    XXX | $BBB4
    .byte $0E ; |    XXX | $BBB5
    .byte $0E ; |    XXX | $BBB6
    .byte $0E ; |    XXX | $BBB7
    .byte $0E ; |    XXX | $BBB8
    .byte $0E ; |    XXX | $BBB9
    .byte $0E ; |    XXX | $BBBA
    .byte $0E ; |    XXX | $BBBB
    .byte $0E ; |    XXX | $BBBC
    .byte $0E ; |    XXX | $BBBD
    .byte $0E ; |    XXX | $BBBE
    .byte $0E ; |    XXX | $BBBF

    .byte $00 ; |        | $BBC0
    .byte $00 ; |        | $BBC1
    .byte $00 ; |        | $BBC2
    .byte $00 ; |        | $BBC3
    .byte $00 ; |        | $BBC4
    .byte $00 ; |        | $BBC5
    .byte $00 ; |        | $BBC6
    .byte $00 ; |        | $BBC7
    .byte $00 ; |        | $BBC8
    .byte $00 ; |        | $BBC9
    .byte $03 ; |      XX| $BBCA
    .byte $3F ; |  XXXXXX| $BBCB
    .byte $0F ; |    XXXX| $BBCC
    .byte $7F ; | XXXXXXX| $BBCD
    .byte $1F ; |   XXXXX| $BBCE
    .byte $FF ; |XXXXXXXX| $BBCF
    .byte $3F ; |  XXXXXX| $BBD0
    .byte $FF ; |XXXXXXXX| $BBD1
    .byte $1F ; |   XXXXX| $BBD2
    .byte $3F ; |  XXXXXX| $BBD3
    .byte $0F ; |    XXXX| $BBD4
    .byte $0F ; |    XXXX| $BBD5
    .byte $03 ; |      XX| $BBD6
    .byte $00 ; |        | $BBD7
    .byte $00 ; |        | $BBD8
    .byte $00 ; |        | $BBD9
    .byte $00 ; |        | $BBDA
    .byte $00 ; |        | $BBDB
    .byte $00 ; |        | $BBDC
    .byte $00 ; |        | $BBDD
    .byte $00 ; |        | $BBDE
    .byte $00 ; |        | $BBDF

    .byte $0E ; |    XXX | $BBE0
    .byte $0E ; |    XXX | $BBE1
    .byte $0E ; |    XXX | $BBE2
    .byte $0E ; |    XXX | $BBE3
    .byte $0E ; |    XXX | $BBE4
    .byte $0E ; |    XXX | $BBE5
    .byte $0E ; |    XXX | $BBE6
    .byte $0E ; |    XXX | $BBE7
    .byte $CA ; |XX  X X | $BBE8
    .byte $CA ; |XX  X X | $BBE9
    .byte $20 ; |  X     | $BBEA
    .byte $20 ; |  X     | $BBEB
    .byte $20 ; |  X     | $BBEC
    .byte $20 ; |  X     | $BBED
    .byte $20 ; |  X     | $BBEE
    .byte $20 ; |  X     | $BBEF
    .byte $22 ; |  X   X | $BBF0
    .byte $22 ; |  X   X | $BBF1
    .byte $24 ; |  X  X  | $BBF2
    .byte $24 ; |  X  X  | $BBF3
    .byte $26 ; |  X  XX | $BBF4
    .byte $26 ; |  X  XX | $BBF5
    .byte $CA ; |XX  X X | $BBF6
    .byte $0E ; |    XXX | $BBF7
    .byte $0E ; |    XXX | $BBF8
    .byte $0E ; |    XXX | $BBF9
    .byte $0E ; |    XXX | $BBFA
    .byte $0E ; |    XXX | $BBFB
    .byte $0E ; |    XXX | $BBFC
    .byte $0E ; |    XXX | $BBFD
    .byte $0E ; |    XXX | $BBFE
    .byte $0E ; |    XXX | $BBFF

    .byte $00 ; |        | $BC00
    .byte $00 ; |        | $BC01
    .byte $1F ; |   XXXXX| $BC02
    .byte $FF ; |XXXXXXXX| $BC03
    .byte $1F ; |   XXXXX| $BC04
    .byte $FF ; |XXXXXXXX| $BC05
    .byte $1F ; |   XXXXX| $BC06
    .byte $FF ; |XXXXXXXX| $BC07
    .byte $1F ; |   XXXXX| $BC08
    .byte $FF ; |XXXXXXXX| $BC09
    .byte $1F ; |   XXXXX| $BC0A
    .byte $FF ; |XXXXXXXX| $BC0B
    .byte $1F ; |   XXXXX| $BC0C
    .byte $FF ; |XXXXXXXX| $BC0D
    .byte $1F ; |   XXXXX| $BC0E
    .byte $FF ; |XXXXXXXX| $BC0F
    .byte $1F ; |   XXXXX| $BC10
    .byte $FF ; |XXXXXXXX| $BC11
    .byte $1F ; |   XXXXX| $BC12
    .byte $FF ; |XXXXXXXX| $BC13
    .byte $1F ; |   XXXXX| $BC14
    .byte $FF ; |XXXXXXXX| $BC15
    .byte $1F ; |   XXXXX| $BC16
    .byte $FF ; |XXXXXXXX| $BC17
    .byte $3F ; |  XXXXXX| $BC18
    .byte $FF ; |XXXXXXXX| $BC19
    .byte $7F ; | XXXXXXX| $BC1A
    .byte $FF ; |XXXXXXXX| $BC1B
    .byte $FF ; |XXXXXXXX| $BC1C
    .byte $FF ; |XXXXXXXX| $BC1D
    .byte $FF ; |XXXXXXXX| $BC1E
    .byte $FF ; |XXXXXXXX| $BC1F

    .byte $0E ; |    XXX | $BC20
    .byte $CA ; |XX  X X | $BC21
    .byte $28 ; |  X X   | $BC22
    .byte $28 ; |  X X   | $BC23
    .byte $28 ; |  X X   | $BC24
    .byte $28 ; |  X X   | $BC25
    .byte $28 ; |  X X   | $BC26
    .byte $28 ; |  X X   | $BC27
    .byte $2A ; |  X X X | $BC28
    .byte $2A ; |  X X X | $BC29
    .byte $28 ; |  X X   | $BC2A
    .byte $28 ; |  X X   | $BC2B
    .byte $28 ; |  X X   | $BC2C
    .byte $28 ; |  X X   | $BC2D
    .byte $28 ; |  X X   | $BC2E
    .byte $28 ; |  X X   | $BC2F
    .byte $28 ; |  X X   | $BC30
    .byte $28 ; |  X X   | $BC31
    .byte $28 ; |  X X   | $BC32
    .byte $28 ; |  X X   | $BC33
    .byte $28 ; |  X X   | $BC34
    .byte $28 ; |  X X   | $BC35
    .byte $28 ; |  X X   | $BC36
    .byte $28 ; |  X X   | $BC37
    .byte $28 ; |  X X   | $BC38
    .byte $28 ; |  X X   | $BC39
    .byte $28 ; |  X X   | $BC3A
    .byte $28 ; |  X X   | $BC3B
    .byte $26 ; |  X  XX | $BC3C
    .byte $26 ; |  X  XX | $BC3D
    .byte $28 ; |  X X   | $BC3E
    .byte $28 ; |  X X   | $BC3F

    .byte $FF ; |XXXXXXXX| $BC40
    .byte $FF ; |XXXXXXXX| $BC41
    .byte $FF ; |XXXXXXXX| $BC42
    .byte $FF ; |XXXXXXXX| $BC43
    .byte $FF ; |XXXXXXXX| $BC44
    .byte $FF ; |XXXXXXXX| $BC45
    .byte $FF ; |XXXXXXXX| $BC46
    .byte $FF ; |XXXXXXXX| $BC47
    .byte $FF ; |XXXXXXXX| $BC48
    .byte $FF ; |XXXXXXXX| $BC49
    .byte $FF ; |XXXXXXXX| $BC4A
    .byte $FF ; |XXXXXXXX| $BC4B
    .byte $FF ; |XXXXXXXX| $BC4C
    .byte $FF ; |XXXXXXXX| $BC4D
    .byte $FF ; |XXXXXXXX| $BC4E
    .byte $FF ; |XXXXXXXX| $BC4F
    .byte $FF ; |XXXXXXXX| $BC50
    .byte $FF ; |XXXXXXXX| $BC51
    .byte $FF ; |XXXXXXXX| $BC52
    .byte $FF ; |XXXXXXXX| $BC53
    .byte $FF ; |XXXXXXXX| $BC54
    .byte $FF ; |XXXXXXXX| $BC55
    .byte $FF ; |XXXXXXXX| $BC56
    .byte $FF ; |XXXXXXXX| $BC57
    .byte $FF ; |XXXXXXXX| $BC58
    .byte $FF ; |XXXXXXXX| $BC59
    .byte $FF ; |XXXXXXXX| $BC5A
    .byte $FF ; |XXXXXXXX| $BC5B
    .byte $FF ; |XXXXXXXX| $BC5C
    .byte $FF ; |XXXXXXXX| $BC5D
    .byte $FF ; |XXXXXXXX| $BC5E
    .byte $FF ; |XXXXXXXX| $BC5F

    .byte $28 ; |  X X   | $BC60
    .byte $28 ; |  X X   | $BC61
    .byte $2E ; |  X XXX | $BC62
    .byte $2C ; |  X XX  | $BC63
    .byte $2C ; |  X XX  | $BC64
    .byte $2C ; |  X XX  | $BC65
    .byte $2A ; |  X X X | $BC66
    .byte $06 ; |     XX | $BC67
    .byte $06 ; |     XX | $BC68
    .byte $06 ; |     XX | $BC69
    .byte $06 ; |     XX | $BC6A
    .byte $06 ; |     XX | $BC6B
    .byte $06 ; |     XX | $BC6C
    .byte $06 ; |     XX | $BC6D
    .byte $06 ; |     XX | $BC6E
    .byte $06 ; |     XX | $BC6F
    .byte $06 ; |     XX | $BC70
    .byte $06 ; |     XX | $BC71
    .byte $28 ; |  X X   | $BC72
    .byte $2A ; |  X X X | $BC73
    .byte $28 ; |  X X   | $BC74
    .byte $28 ; |  X X   | $BC75
    .byte $28 ; |  X X   | $BC76
    .byte $28 ; |  X X   | $BC77
    .byte $28 ; |  X X   | $BC78
    .byte $28 ; |  X X   | $BC79
    .byte $2E ; |  X XXX | $BC7A
    .byte $2C ; |  X XX  | $BC7B
    .byte $2C ; |  X XX  | $BC7C
    .byte $2C ; |  X XX  | $BC7D
    .byte $2A ; |  X X X | $BC7E
    .byte $CA ; |XX  X X | $BC7F

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

    .byte $0E ; |    XXX | $BCA0
    .byte $0E ; |    XXX | $BCA1
    .byte $0E ; |    XXX | $BCA2
    .byte $0E ; |    XXX | $BCA3
    .byte $0E ; |    XXX | $BCA4
    .byte $0E ; |    XXX | $BCA5
    .byte $0E ; |    XXX | $BCA6
    .byte $0E ; |    XXX | $BCA7
    .byte $0E ; |    XXX | $BCA8
    .byte $0E ; |    XXX | $BCA9
    .byte $0E ; |    XXX | $BCAA
    .byte $0E ; |    XXX | $BCAB
    .byte $0E ; |    XXX | $BCAC
    .byte $0E ; |    XXX | $BCAD
    .byte $0E ; |    XXX | $BCAE
    .byte $0E ; |    XXX | $BCAF
    .byte $0E ; |    XXX | $BCB0
    .byte $0E ; |    XXX | $BCB1
    .byte $0E ; |    XXX | $BCB2
    .byte $0E ; |    XXX | $BCB3
    .byte $0E ; |    XXX | $BCB4
    .byte $0E ; |    XXX | $BCB5
    .byte $0E ; |    XXX | $BCB6
    .byte $0E ; |    XXX | $BCB7
    .byte $0E ; |    XXX | $BCB8
    .byte $0E ; |    XXX | $BCB9
    .byte $0E ; |    XXX | $BCBA
    .byte $0E ; |    XXX | $BCBB
    .byte $0E ; |    XXX | $BCBC
    .byte $0E ; |    XXX | $BCBD
    .byte $28 ; |  X X   | $BCBE
    .byte $28 ; |  X X   | $BCBF

    .byte $00 ; |        | $BCC0
    .byte $00 ; |        | $BCC1
    .byte $3F ; |  XXXXXX| $BCC2
    .byte $FF ; |XXXXXXXX| $BCC3
    .byte $FF ; |XXXXXXXX| $BCC4
    .byte $FF ; |XXXXXXXX| $BCC5
    .byte $FF ; |XXXXXXXX| $BCC6
    .byte $FF ; |XXXXXXXX| $BCC7
    .byte $3F ; |  XXXXXX| $BCC8
    .byte $FF ; |XXXXXXXX| $BCC9
    .byte $3F ; |  XXXXXX| $BCCA
    .byte $FF ; |XXXXXXXX| $BCCB
    .byte $3F ; |  XXXXXX| $BCCC
    .byte $FF ; |XXXXXXXX| $BCCD
    .byte $3F ; |  XXXXXX| $BCCE
    .byte $FF ; |XXXXXXXX| $BCCF
    .byte $3F ; |  XXXXXX| $BCD0
    .byte $FF ; |XXXXXXXX| $BCD1
    .byte $3C ; |  XXXX  | $BCD2
    .byte $E7 ; |XXX  XXX| $BCD3
    .byte $3C ; |  XXXX  | $BCD4
    .byte $E7 ; |XXX  XXX| $BCD5
    .byte $3C ; |  XXXX  | $BCD6
    .byte $E7 ; |XXX  XXX| $BCD7
    .byte $3C ; |  XXXX  | $BCD8
    .byte $E7 ; |XXX  XXX| $BCD9
    .byte $3F ; |  XXXXXX| $BCDA
    .byte $FF ; |XXXXXXXX| $BCDB
    .byte $FF ; |XXXXXXXX| $BCDC
    .byte $FF ; |XXXXXXXX| $BCDD
    .byte $FF ; |XXXXXXXX| $BCDE
    .byte $FF ; |XXXXXXXX| $BCDF

    .byte $28 ; |  X X   | $BCE0
    .byte $CA ; |XX  X X | $BCE1
    .byte $C8 ; |XX  X   | $BCE2
    .byte $C6 ; |XX   XX | $BCE3
    .byte $C4 ; |XX   X  | $BCE4
    .byte $C2 ; |XX    X | $BCE5
    .byte $16 ; |   X XX | $BCE6
    .byte $16 ; |   X XX | $BCE7
    .byte $16 ; |   X XX | $BCE8
    .byte $16 ; |   X XX | $BCE9
    .byte $16 ; |   X XX | $BCEA
    .byte $16 ; |   X XX | $BCEB
    .byte $16 ; |   X XX | $BCEC
    .byte $16 ; |   X XX | $BCED
    .byte $16 ; |   X XX | $BCEE
    .byte $16 ; |   X XX | $BCEF
    .byte $16 ; |   X XX | $BCF0
    .byte $16 ; |   X XX | $BCF1
    .byte $16 ; |   X XX | $BCF2
    .byte $16 ; |   X XX | $BCF3
    .byte $16 ; |   X XX | $BCF4
    .byte $16 ; |   X XX | $BCF5
    .byte $16 ; |   X XX | $BCF6
    .byte $16 ; |   X XX | $BCF7
    .byte $16 ; |   X XX | $BCF8
    .byte $16 ; |   X XX | $BCF9
    .byte $16 ; |   X XX | $BCFA
    .byte $16 ; |   X XX | $BCFB
    .byte $16 ; |   X XX | $BCFC
    .byte $16 ; |   X XX | $BCFD
    .byte $14 ; |   X X  | $BCFE
    .byte $12 ; |   X  X | $BCFF

    .byte $FF ; |XXXXXXXX| $BD00
    .byte $FF ; |XXXXXXXX| $BD01
    .byte $FF ; |XXXXXXXX| $BD02
    .byte $FF ; |XXXXXXXX| $BD03
    .byte $FF ; |XXXXXXXX| $BD04
    .byte $FF ; |XXXXXXXX| $BD05
    .byte $FF ; |XXXXXXXX| $BD06
    .byte $FF ; |XXXXXXXX| $BD07
    .byte $FF ; |XXXXXXXX| $BD08
    .byte $7F ; | XXXXXXX| $BD09
    .byte $FF ; |XXXXXXXX| $BD0A
    .byte $7F ; | XXXXXXX| $BD0B
    .byte $FF ; |XXXXXXXX| $BD0C
    .byte $7F ; | XXXXXXX| $BD0D
    .byte $FF ; |XXXXXXXX| $BD0E
    .byte $7F ; | XXXXXXX| $BD0F
    .byte $FF ; |XXXXXXXX| $BD10
    .byte $3F ; |  XXXXXX| $BD11
    .byte $FF ; |XXXXXXXX| $BD12
    .byte $3F ; |  XXXXXX| $BD13
    .byte $FF ; |XXXXXXXX| $BD14
    .byte $3F ; |  XXXXXX| $BD15
    .byte $FF ; |XXXXXXXX| $BD16
    .byte $3F ; |  XXXXXX| $BD17
    .byte $FF ; |XXXXXXXX| $BD18
    .byte $1F ; |   XXXXX| $BD19
    .byte $FF ; |XXXXXXXX| $BD1A
    .byte $1F ; |   XXXXX| $BD1B
    .byte $FF ; |XXXXXXXX| $BD1C
    .byte $1F ; |   XXXXX| $BD1D
    .byte $FF ; |XXXXXXXX| $BD1E
    .byte $00 ; |        | $BD1F

    .byte $04 ; |     X  | $BD20
    .byte $06 ; |     XX | $BD21
    .byte $08 ; |    X   | $BD22
    .byte $0A ; |    X X | $BD23
    .byte $08 ; |    X   | $BD24
    .byte $06 ; |     XX | $BD25
    .byte $08 ; |    X   | $BD26
    .byte $0A ; |    X X | $BD27
    .byte $08 ; |    X   | $BD28
    .byte $06 ; |     XX | $BD29
    .byte $08 ; |    X   | $BD2A
    .byte $0A ; |    X X | $BD2B
    .byte $08 ; |    X   | $BD2C
    .byte $06 ; |     XX | $BD2D
    .byte $08 ; |    X   | $BD2E
    .byte $0A ; |    X X | $BD2F
    .byte $08 ; |    X   | $BD30
    .byte $06 ; |     XX | $BD31
    .byte $08 ; |    X   | $BD32
    .byte $0A ; |    X X | $BD33
    .byte $08 ; |    X   | $BD34
    .byte $06 ; |     XX | $BD35
    .byte $08 ; |    X   | $BD36
    .byte $0A ; |    X X | $BD37
    .byte $08 ; |    X   | $BD38
    .byte $06 ; |     XX | $BD39
    .byte $08 ; |    X   | $BD3A
    .byte $08 ; |    X   | $BD3B
    .byte $0A ; |    X X | $BD3C
    .byte $06 ; |     XX | $BD3D
    .byte $CA ; |XX  X X | $BD3E
    .byte $CA ; |XX  X X | $BD3F

LBD40:
  COMMON_ROUTINE  BK_B000

LBDB5:
    ldy    ram_CE                ; 3
    beq    LBE11                 ; 2³+1
    cpy    #$0F                  ; 2
    bcs    LBDC6                 ; 2³
    lda    LBF0A,Y               ; 4
    sta    ram_CE                ; 3
    lda    #$81                  ; 2
    sta    ram_CF                ; 3
LBDC6:
    dec    ram_CF                ; 5
    lda    ram_CF                ; 3
    and    #$7F                  ; 2
    bne    LBE11                 ; 2³+1
    tay                          ; 2
    lda    ram_CF                ; 3
    and    #$80                  ; 2
    eor    #$80                  ; 2
    sta    ram_D6                ; 3
    bne    LBDDB                 ; 2³
    inc    ram_CE                ; 5
LBDDB:
    lda    #$BF                  ; 2
    sta    ram_CF                ; 3
    lda    (ram_CE),Y            ; 5
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    (ram_CE),Y            ; 5
    and    #$0F                  ; 2
    tay                          ; 2
    lda    ram_D6                ; 3
    beq    LBDF6                 ; 2³
    ldy    #$01                  ; 2
    ora    LBED7,X               ; 4
    bmi    LBDF9                 ; 2³
LBDF6:
    ora    LBECA,X               ; 4
LBDF9:
    sta    ram_CF                ; 3
    lda    LBEBE,Y               ; 4
    sta    AUDF0                 ; 3
    lda    LBEB2,Y               ; 4
    sta    AUDV0                 ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDC0                 ; 3
    bne    LBE11                 ; 2³
    lda    #$00                  ; 2
    sta    ram_CE                ; 3
LBE11:
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcs    LBE43                 ; 2³
    lda    soundIndex            ; 3
    beq    LBE43                 ; 2³
    and    #$E0                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LBE46,Y               ; 4
    sta    AUDV1                 ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDC1                 ; 3
    lda    soundIndex            ; 3
    and    #$1F                  ; 2
    clc                          ; 2
    adc    LBE4D,Y               ; 4
    tay                          ; 2
    inc    soundIndex            ; 5
    lda    LBE54,Y               ; 4
    sta    AUDF1                 ; 3
    bne    LBE43                 ; 2³
    sta    soundIndex            ; 3
    sta    AUDC1                 ; 3
LBE43:
    jmp    LBFEB                 ; 3

LBE46:
    .byte $00 ; |        | $BE46  AUDC1 << 4 | AUDV1
    .byte $6C ; | XX XX  | $BE47
    .byte $88 ; |X   X   | $BE48
    .byte $C8 ; |XX  X   | $BE49
    .byte $8C ; |X   XX  | $BE4A
    .byte $78 ; | XXXX   | $BE4B
    .byte $48 ; | X  X   | $BE4C
LBE4D:
    .byte $00 ; |        | $BE4D
    .byte $01 ; |       X| $BE4E
    .byte $0E ; |    XXX | $BE4F
    .byte $14 ; |   X X  | $BE50
    .byte $20 ; |  X     | $BE51
    .byte $3A ; |  XXX X | $BE52
    .byte $45 ; | X   X X| $BE53
LBE54:
    .byte $00 ; |        | $BE54  AUDF1
    .byte $1F ; |   XXXXX| $BE55
    .byte $1F ; |   XXXXX| $BE56
    .byte $1F ; |   XXXXX| $BE57
    .byte $1F ; |   XXXXX| $BE58
    .byte $1F ; |   XXXXX| $BE59
    .byte $1F ; |   XXXXX| $BE5A
    .byte $1F ; |   XXXXX| $BE5B
    .byte $1F ; |   XXXXX| $BE5C
    .byte $1F ; |   XXXXX| $BE5D
    .byte $1F ; |   XXXXX| $BE5E
    .byte $1F ; |   XXXXX| $BE5F
    .byte $1F ; |   XXXXX| $BE60
    .byte $00 ; |        | $BE61
    .byte $04 ; |     X  | $BE62
    .byte $80 ; |X       | $BE63
    .byte $04 ; |     X  | $BE64
    .byte $0A ; |    X X | $BE65
    .byte $10 ; |   X    | $BE66
    .byte $00 ; |        | $BE67
    .byte $1F ; |   XXXXX| $BE68
    .byte $1F ; |   XXXXX| $BE69
    .byte $1D ; |   XXX X| $BE6A
    .byte $1C ; |   XXX  | $BE6B
    .byte $1B ; |   XX XX| $BE6C
    .byte $19 ; |   XX  X| $BE6D
    .byte $17 ; |   X XXX| $BE6E
    .byte $80 ; |X       | $BE6F
    .byte $17 ; |   X XXX| $BE70
    .byte $80 ; |X       | $BE71
    .byte $17 ; |   X XXX| $BE72
    .byte $00 ; |        | $BE73
    .byte $14 ; |   X X  | $BE74
    .byte $10 ; |   X    | $BE75
    .byte $0C ; |    XX  | $BE76
    .byte $0E ; |    XXX | $BE77
    .byte $10 ; |   X    | $BE78
    .byte $13 ; |   X  XX| $BE79
    .byte $16 ; |   X XX | $BE7A
    .byte $1A ; |   XX X | $BE7B
    .byte $1F ; |   XXXXX| $BE7C
    .byte $1F ; |   XXXXX| $BE7D
    .byte $12 ; |   X  X | $BE7E
    .byte $14 ; |   X X  | $BE7F
    .byte $16 ; |   X XX | $BE80
    .byte $18 ; |   XX   | $BE81
    .byte $1A ; |   XX X | $BE82
    .byte $1D ; |   XXX X| $BE83
    .byte $1E ; |   XXXX | $BE84
    .byte $1E ; |   XXXX | $BE85
    .byte $1E ; |   XXXX | $BE86
    .byte $1E ; |   XXXX | $BE87
    .byte $1E ; |   XXXX | $BE88
    .byte $1E ; |   XXXX | $BE89
    .byte $1F ; |   XXXXX| $BE8A
    .byte $1F ; |   XXXXX| $BE8B
    .byte $1F ; |   XXXXX| $BE8C
    .byte $00 ; |        | $BE8D
    .byte $06 ; |     XX | $BE8E
    .byte $05 ; |     X X| $BE8F
    .byte $04 ; |     X  | $BE90
    .byte $03 ; |      XX| $BE91
    .byte $02 ; |      X | $BE92
    .byte $06 ; |     XX | $BE93
    .byte $05 ; |     X X| $BE94
    .byte $04 ; |     X  | $BE95
    .byte $03 ; |      XX| $BE96
    .byte $02 ; |      X | $BE97
    .byte $00 ; |        | $BE98
    .byte $10 ; |   X    | $BE99
    .byte $10 ; |   X    | $BE9A
    .byte $08 ; |    X   | $BE9B
    .byte $08 ; |    X   | $BE9C
    .byte $10 ; |   X    | $BE9D
    .byte $10 ; |   X    | $BE9E
    .byte $08 ; |    X   | $BE9F
    .byte $08 ; |    X   | $BEA0
    .byte $10 ; |   X    | $BEA1
    .byte $10 ; |   X    | $BEA2
    .byte $08 ; |    X   | $BEA3
    .byte $08 ; |    X   | $BEA4
    .byte $10 ; |   X    | $BEA5
    .byte $10 ; |   X    | $BEA6
    .byte $08 ; |    X   | $BEA7
    .byte $08 ; |    X   | $BEA8
    .byte $10 ; |   X    | $BEA9
    .byte $10 ; |   X    | $BEAA
    .byte $08 ; |    X   | $BEAB
    .byte $08 ; |    X   | $BEAC
    .byte $10 ; |   X    | $BEAD
    .byte $10 ; |   X    | $BEAE
    .byte $08 ; |    X   | $BEAF
    .byte $08 ; |    X   | $BEB0
    .byte $00 ; |        | $BEB1
LBEB2:
    .byte $00 ; |        | $BEB2  AUDC0 << 4 | AUDV0
    .byte $C0 ; |XX      | $BEB3
    .byte $C6 ; |XX   XX | $BEB4
    .byte $C6 ; |XX   XX | $BEB5
    .byte $C6 ; |XX   XX | $BEB6
    .byte $C6 ; |XX   XX | $BEB7
    .byte $C6 ; |XX   XX | $BEB8
    .byte $C6 ; |XX   XX | $BEB9
    .byte $C6 ; |XX   XX | $BEBA
    .byte $C6 ; |XX   XX | $BEBB
    .byte $C6 ; |XX   XX | $BEBC
    .byte $86 ; |X    XX | $BEBD
LBEBE:
    .byte $00 ; |        | $BEBE  AUDF0
    .byte $00 ; |        | $BEBF
    .byte $16 ; |   X XX | $BEC0
    .byte $13 ; |   X  XX| $BEC1
    .byte $12 ; |   X  X | $BEC2
    .byte $10 ; |   X    | $BEC3
    .byte $0E ; |    XXX | $BEC4
    .byte $0D ; |    XX X| $BEC5
    .byte $17 ; |   X XXX| $BEC6
    .byte $1D ; |   XXX X| $BEC7
    .byte $1F ; |   XXXXX| $BEC8
    .byte $10 ; |   X    | $BEC9
LBECA:
    .byte $20 ; |  X     | $BECA
    .byte $0F ; |    XXXX| $BECB
    .byte $04 ; |     X  | $BECC
    .byte $04 ; |     X  | $BECD
    .byte $06 ; |     XX | $BECE
    .byte $12 ; |   X  X | $BECF
    .byte $07 ; |     XXX| $BED0
    .byte $06 ; |     XX | $BED1
    .byte $17 ; |   X XXX| $BED2
    .byte $02 ; |      X | $BED3
    .byte $03 ; |      XX| $BED4
    .byte $03 ; |      XX| $BED5
    .byte $2C ; |  X XX  | $BED6
LBED7:
    .byte $00 ; |        | $BED7
    .byte $03 ; |      XX| $BED8
    .byte $02 ; |      X | $BED9
    .byte $08 ; |    X   | $BEDA
    .byte $06 ; |     XX | $BEDB
    .byte $06 ; |     XX | $BEDC
    .byte $05 ; |     X X| $BEDD
    .byte $12 ; |   X  X | $BEDE
    .byte $01 ; |       X| $BEDF
    .byte $04 ; |     X  | $BEE0
    .byte $09 ; |    X  X| $BEE1
    .byte $21 ; |  X    X| $BEE2
    .byte $04 ; |     X  | $BEE3

    .byte $FF ; |XXXXXXXX| $BEE4
    .byte $FF ; |XXXXXXXX| $BEE5
    .byte $FF ; |XXXXXXXX| $BEE6
    .byte $FF ; |XXXXXXXX| $BEE7
    .byte $FF ; |XXXXXXXX| $BEE8
    .byte $FF ; |XXXXXXXX| $BEE9
    .byte $FF ; |XXXXXXXX| $BEEA
    .byte $FF ; |XXXXXXXX| $BEEB
    .byte $FF ; |XXXXXXXX| $BEEC
    .byte $FF ; |XXXXXXXX| $BEED
    .byte $FF ; |XXXXXXXX| $BEEE
    .byte $FF ; |XXXXXXXX| $BEEF
    .byte $FF ; |XXXXXXXX| $BEF0
    .byte $FF ; |XXXXXXXX| $BEF1
    .byte $FF ; |XXXXXXXX| $BEF2
    .byte $FF ; |XXXXXXXX| $BEF3
    .byte $FF ; |XXXXXXXX| $BEF4
    .byte $FF ; |XXXXXXXX| $BEF5
    .byte $FF ; |XXXXXXXX| $BEF6
    .byte $FF ; |XXXXXXXX| $BEF7
    .byte $FF ; |XXXXXXXX| $BEF8
    .byte $FF ; |XXXXXXXX| $BEF9
    .byte $FF ; |XXXXXXXX| $BEFA
    .byte $FF ; |XXXXXXXX| $BEFB
    .byte $FF ; |XXXXXXXX| $BEFC
    .byte $FF ; |XXXXXXXX| $BEFD
    .byte $FF ; |XXXXXXXX| $BEFE
    .byte $FF ; |XXXXXXXX| $BEFF
    .byte $FF ; |XXXXXXXX| $BF00
    .byte $FF ; |XXXXXXXX| $BF01
    .byte $FF ; |XXXXXXXX| $BF02
    .byte $FF ; |XXXXXXXX| $BF03
    .byte $FF ; |XXXXXXXX| $BF04
    .byte $FF ; |XXXXXXXX| $BF05
    .byte $FF ; |XXXXXXXX| $BF06
    .byte $FF ; |XXXXXXXX| $BF07
    .byte $FF ; |XXXXXXXX| $BF08
    .byte $FF ; |XXXXXXXX| $BF09
LBF0A:
    .byte $0E ; |    XXX | $BF0A  $BF0E??
    .byte <LBF0F         ; $BF0B
    .byte <LBF2F         ; $BF0C
    .byte <LBF4B         ; $BF0D
    .byte <LBF54         ; $BF0E
LBF0F:
    .byte $00 ; |        | $BF0F
    .byte $12 ; |   X  X | $BF10
    .byte $22 ; |  X   X | $BF11
    .byte $32 ; |  XX  X | $BF12
    .byte $42 ; | X    X | $BF13
    .byte $52 ; | X X  X | $BF14
    .byte $63 ; | XX   XX| $BF15
    .byte $44 ; | X   X  | $BF16
    .byte $15 ; |   X X X| $BF17
    .byte $25 ; |  X  X X| $BF18
    .byte $35 ; |  XX X X| $BF19
    .byte $45 ; | X   X X| $BF1A
    .byte $55 ; | X X X X| $BF1B
    .byte $65 ; | XX  X X| $BF1C
    .byte $46 ; | X   XX | $BF1D
    .byte $17 ; |   X XXX| $BF1E
    .byte $26 ; |  X  XX | $BF1F
    .byte $35 ; |  XX X X| $BF20
    .byte $44 ; | X   X  | $BF21
    .byte $43 ; | X    XX| $BF22
    .byte $42 ; | X    X | $BF23
    .byte $78 ; | XXXX   | $BF24
    .byte $29 ; |  X X  X| $BF25
    .byte $2A ; |  X X X | $BF26
    .byte $29 ; |  X X  X| $BF27
    .byte $2A ; |  X X X | $BF28
    .byte $39 ; |  XXX  X| $BF29
    .byte $38 ; |  XXX   | $BF2A
    .byte $83 ; |X     XX| $BF2B
    .byte $32 ; |  XX  X | $BF2C
    .byte $9B ; |X  XX XX| $BF2D
    .byte $9B ; |X  XX XX| $BF2E
LBF2F:
    .byte $00 ; |        | $BF2F
    .byte $AB ; |X X X XX| $BF30
    .byte $AB ; |X X X XX| $BF31
    .byte $AB ; |X X X XX| $BF32
    .byte $9B ; |X  XX XX| $BF33
    .byte $9B ; |X  XX XX| $BF34
    .byte $9B ; |X  XX XX| $BF35
    .byte $9B ; |X  XX XX| $BF36
    .byte $9B ; |X  XX XX| $BF37
    .byte $9B ; |X  XX XX| $BF38
    .byte $AB ; |X X X XX| $BF39
    .byte $9B ; |X  XX XX| $BF3A
    .byte $9B ; |X  XX XX| $BF3B
    .byte $AB ; |X X X XX| $BF3C
    .byte $9B ; |X  XX XX| $BF3D
    .byte $9B ; |X  XX XX| $BF3E
    .byte $AB ; |X X X XX| $BF3F
    .byte $9B ; |X  XX XX| $BF40
    .byte $9B ; |X  XX XX| $BF41
    .byte $AB ; |X X X XX| $BF42
    .byte $BB ; |X XXX XX| $BF43
    .byte $AB ; |X X X XX| $BF44
    .byte $BB ; |X XXX XX| $BF45
    .byte $AB ; |X X X XX| $BF46
    .byte $BB ; |X XXX XX| $BF47
    .byte $CB ; |XX  X XX| $BF48
    .byte $AB ; |X X X XX| $BF49
    .byte $BB ; |X XXX XX| $BF4A
LBF4B:
    .byte $00 ; |        | $BF4B
    .byte $27 ; |  X  XXX| $BF4C
    .byte $26 ; |  X  XX | $BF4D
    .byte $25 ; |  X  X X| $BF4E
    .byte $24 ; |  X  X  | $BF4F
    .byte $23 ; |  X   XX| $BF50
    .byte $22 ; |  X   X | $BF51
    .byte $C8 ; |XX  X   | $BF52
    .byte $81 ; |X      X| $BF53
LBF54:
    .byte $00 ; |        | $BF54
    .byte $81 ; |X      X| $BF55
    .byte $81 ; |X      X| $BF56
    .byte $53 ; | X X  XX| $BF57
    .byte $55 ; | X X X X| $BF58
    .byte $24 ; |  X  X  | $BF59
    .byte $23 ; |  X   XX| $BF5A
    .byte $42 ; | X    X | $BF5B
    .byte $C3 ; |XX    XX| $BF5C
    .byte $81 ; |X      X| $BF5D
    .byte $81 ; |X      X| $BF5E
    .byte $00 ; |        | $BF5F

       ORG $1F60
      RORG $BF60

    .byte $FF ; |XXXXXXXX| $BF60
    .byte $FF ; |XXXXXXXX| $BF61
    .byte $FF ; |XXXXXXXX| $BF62
    .byte $FF ; |XXXXXXXX| $BF63
    .byte $FF ; |XXXXXXXX| $BF64
    .byte $FF ; |XXXXXXXX| $BF65
    .byte $FF ; |XXXXXXXX| $BF66
    .byte $FF ; |XXXXXXXX| $BF67
    .byte $FF ; |XXXXXXXX| $BF68
    .byte $FF ; |XXXXXXXX| $BF69
    .byte $FF ; |XXXXXXXX| $BF6A
    .byte $FF ; |XXXXXXXX| $BF6B
    .byte $FF ; |XXXXXXXX| $BF6C
    .byte $FF ; |XXXXXXXX| $BF6D
    .byte $FF ; |XXXXXXXX| $BF6E
    .byte $FF ; |XXXXXXXX| $BF6F
    .byte $FF ; |XXXXXXXX| $BF70
    .byte $FF ; |XXXXXXXX| $BF71
    .byte $FF ; |XXXXXXXX| $BF72
    .byte $FF ; |XXXXXXXX| $BF73
    .byte $FF ; |XXXXXXXX| $BF74
    .byte $FF ; |XXXXXXXX| $BF75

    .byte $00   ; $BF76
    .byte $00   ; $BF77
    .byte $00   ; $BF78

MBF79:
    jmp    LBF7C                 ; 3
LBF7C:
    jmp    LB000                 ; 3

    .byte $FF ; |XXXXXXXX| $BF7F
    .byte $FF ; |XXXXXXXX| $BF80
    .byte $FF ; |XXXXXXXX| $BF81
    .byte $FF ; |XXXXXXXX| $BF82
    .byte $FF ; |XXXXXXXX| $BF83
    .byte $FF ; |XXXXXXXX| $BF84
    .byte $FF ; |XXXXXXXX| $BF85
    .byte $FF ; |XXXXXXXX| $BF86
    .byte $FF ; |XXXXXXXX| $BF87
    .byte $FF ; |XXXXXXXX| $BF88
    .byte $FF ; |XXXXXXXX| $BF89
    .byte $FF ; |XXXXXXXX| $BF8A
    .byte $FF ; |XXXXXXXX| $BF8B
    .byte $FF ; |XXXXXXXX| $BF8C
    .byte $FF ; |XXXXXXXX| $BF8D
    .byte $FF ; |XXXXXXXX| $BF8E
    .byte $FF ; |XXXXXXXX| $BF8F
    .byte $FF ; |XXXXXXXX| $BF90
    .byte $FF ; |XXXXXXXX| $BF91
    .byte $FF ; |XXXXXXXX| $BF92
    .byte $FF ; |XXXXXXXX| $BF93
    .byte $FF ; |XXXXXXXX| $BF94
    .byte $FF ; |XXXXXXXX| $BF95
    .byte $FF ; |XXXXXXXX| $BF96
    .byte $FF ; |XXXXXXXX| $BF97
    .byte $FF ; |XXXXXXXX| $BF98
    .byte $FF ; |XXXXXXXX| $BF99
    .byte $FF ; |XXXXXXXX| $BF9A
    .byte $FF ; |XXXXXXXX| $BF9B
    .byte $FF ; |XXXXXXXX| $BF9C
    .byte $FF ; |XXXXXXXX| $BF9D
    .byte $FF ; |XXXXXXXX| $BF9E
    .byte $FF ; |XXXXXXXX| $BF9F
    .byte $FF ; |XXXXXXXX| $BFA0
    .byte $FF ; |XXXXXXXX| $BFA1

    .byte $00   ; $BFA2
    .byte $00   ; $BFA3
    .byte $00   ; $BFA4

MBFA5:
    jmp    LBFA8                 ; 3
LBFA8:
    jmp    LBD40                 ; 3

    .byte $FF ; |XXXXXXXX| $BFAB
    .byte $FF ; |XXXXXXXX| $BFAC
    .byte $FF ; |XXXXXXXX| $BFAD
    .byte $FF ; |XXXXXXXX| $BFAE
    .byte $FF ; |XXXXXXXX| $BFAF
    .byte $FF ; |XXXXXXXX| $BFB0
    .byte $FF ; |XXXXXXXX| $BFB1
    .byte $FF ; |XXXXXXXX| $BFB2
    .byte $FF ; |XXXXXXXX| $BFB3
    .byte $FF ; |XXXXXXXX| $BFB4
    .byte $FF ; |XXXXXXXX| $BFB5
    .byte $FF ; |XXXXXXXX| $BFB6
    .byte $FF ; |XXXXXXXX| $BFB7
    .byte $FF ; |XXXXXXXX| $BFB8
    .byte $FF ; |XXXXXXXX| $BFB9
    .byte $FF ; |XXXXXXXX| $BFBA
    .byte $FF ; |XXXXXXXX| $BFBB
    .byte $FF ; |XXXXXXXX| $BFBC
    .byte $FF ; |XXXXXXXX| $BFBD
    .byte $FF ; |XXXXXXXX| $BFBE
    .byte $FF ; |XXXXXXXX| $BFBF
    .byte $FF ; |XXXXXXXX| $BFC0
    .byte $FF ; |XXXXXXXX| $BFC1
    .byte $FF ; |XXXXXXXX| $BFC2
    .byte $FF ; |XXXXXXXX| $BFC3
    .byte $FF ; |XXXXXXXX| $BFC4
    .byte $FF ; |XXXXXXXX| $BFC5
    .byte $FF ; |XXXXXXXX| $BFC6
    .byte $FF ; |XXXXXXXX| $BFC7
    .byte $FF ; |XXXXXXXX| $BFC8
    .byte $FF ; |XXXXXXXX| $BFC9
    .byte $FF ; |XXXXXXXX| $BFCA
    .byte $FF ; |XXXXXXXX| $BFCB
    .byte $FF ; |XXXXXXXX| $BFCC
    .byte $FF ; |XXXXXXXX| $BFCD
    .byte $FF ; |XXXXXXXX| $BFCE
    .byte $FF ; |XXXXXXXX| $BFCF

    .byte $00   ; $BFD0
    .byte $00   ; $BFD1
    .byte $00   ; $BFD2

MBFD3:
    jmp    LBFD6                 ; 3
LBFD6:
    jmp    LBDB5                 ; 3

    .byte $FF ; |XXXXXXXX| $BFD9
    .byte $FF ; |XXXXXXXX| $BFDA
    .byte $FF ; |XXXXXXXX| $BFDB
    .byte $FF ; |XXXXXXXX| $BFDC
    .byte $FF ; |XXXXXXXX| $BFDD
    .byte $FF ; |XXXXXXXX| $BFDE
    .byte $FF ; |XXXXXXXX| $BFDF
    .byte $FF ; |XXXXXXXX| $BFE0
    .byte $FF ; |XXXXXXXX| $BFE1
    .byte $FF ; |XXXXXXXX| $BFE2
    .byte $FF ; |XXXXXXXX| $BFE3
    .byte $FF ; |XXXXXXXX| $BFE4
    .byte $FF ; |XXXXXXXX| $BFE5
    .byte $FF ; |XXXXXXXX| $BFE6
    .byte $FF ; |XXXXXXXX| $BFE7
    .byte $FF ; |XXXXXXXX| $BFE8
    .byte $FF ; |XXXXXXXX| $BFE9
    .byte $FF ; |XXXXXXXX| $BFEA

LBFEB:
    bit    BANK_3                ; 4   bankswitch, use RTS
    rts                          ; 6   not used

START_1:
    cli                          ; 2
    bit    BANK_3                ; 4
    jmp    LF000                 ; 3   not used

       ORG $1FF6
      RORG $BFF6

    .byte $EA   ; $BFF6
    .byte $EA   ; $BFF7
    .byte $EA   ; $BFF8
    .byte $EA   ; $BFF9
    .byte $EA   ; $BFFA
    .byte $EA   ; $BFFB

    .word START_1
    .word START_1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 2
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $2000
      RORG $D000

LD000:
   MAIN_KERNEL  BK_D000

LDB00:
    .byte $00 ; |        | $DB00  PF1 gfx
    .byte $00 ; |        | $DB01
    .byte $00 ; |        | $DB02
    .byte $00 ; |        | $DB03
    .byte $00 ; |        | $DB04
    .byte $FF ; |XXXXXXXX| $DB05
    .byte $00 ; |        | $DB06
    .byte $7E ; | XXXXXX | $DB07
    .byte $00 ; |        | $DB08
    .byte $3C ; |  XXXX  | $DB09
    .byte $00 ; |        | $DB0A
    .byte $00 ; |        | $DB0B
    .byte $00 ; |        | $DB0C
    .byte $00 ; |        | $DB0D
    .byte $00 ; |        | $DB0E
    .byte $00 ; |        | $DB0F
    .byte $00 ; |        | $DB10
    .byte $00 ; |        | $DB11
    .byte $00 ; |        | $DB12
    .byte $00 ; |        | $DB13
    .byte $00 ; |        | $DB14
    .byte $00 ; |        | $DB15
    .byte $00 ; |        | $DB16
    .byte $00 ; |        | $DB17
    .byte $00 ; |        | $DB18
    .byte $00 ; |        | $DB19
    .byte $00 ; |        | $DB1A
    .byte $00 ; |        | $DB1B
    .byte $00 ; |        | $DB1C
    .byte $00 ; |        | $DB1D
    .byte $00 ; |        | $DB1E
    .byte $00 ; |        | $DB1F


    .byte $0E ; |    XXX | $DB20  PF1 colors
    .byte $0E ; |    XXX | $DB21
    .byte $0E ; |    XXX | $DB22
    .byte $00 ; |        | $DB23
    .byte $18 ; |   XX   | $DB24
    .byte $16 ; |   X XX | $DB25
    .byte $16 ; |   X XX | $DB26
    .byte $14 ; |   X X  | $DB27
    .byte $14 ; |   X X  | $DB28
    .byte $12 ; |   X  X | $DB29
    .byte $14 ; |   X X  | $DB2A
    .byte $14 ; |   X X  | $DB2B
    .byte $14 ; |   X X  | $DB2C
    .byte $14 ; |   X X  | $DB2D
    .byte $14 ; |   X X  | $DB2E
    .byte $14 ; |   X X  | $DB2F
    .byte $14 ; |   X X  | $DB30
    .byte $14 ; |   X X  | $DB31
    .byte $14 ; |   X X  | $DB32
    .byte $14 ; |   X X  | $DB33
    .byte $14 ; |   X X  | $DB34
    .byte $16 ; |   X XX | $DB35
    .byte $16 ; |   X XX | $DB36
    .byte $16 ; |   X XX | $DB37
    .byte $0E ; |    XXX | $DB38
    .byte $0E ; |    XXX | $DB39
    .byte $0E ; |    XXX | $DB3A
    .byte $0E ; |    XXX | $DB3B
    .byte $0E ; |    XXX | $DB3C
    .byte $0E ; |    XXX | $DB3D
    .byte $0E ; |    XXX | $DB3E
    .byte $0E ; |    XXX | $DB3F

LDB40:
    .byte $00 ; |        | $DB40  PF2 gfx
    .byte $00 ; |        | $DB41
    .byte $00 ; |        | $DB42
    .byte $00 ; |        | $DB43
    .byte $7F ; | XXXXXXX| $DB44
    .byte $00 ; |        | $DB45
    .byte $3E ; |  XXXXX | $DB46
    .byte $00 ; |        | $DB47
    .byte $1C ; |   XXX  | $DB48
    .byte $00 ; |        | $DB49
    .byte $00 ; |        | $DB4A
    .byte $00 ; |        | $DB4B
    .byte $00 ; |        | $DB4C
    .byte $00 ; |        | $DB4D
    .byte $00 ; |        | $DB4E
    .byte $00 ; |        | $DB4F
    .byte $00 ; |        | $DB50
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

    .byte $0E ; |    XXX | $DB60  PF2 colors
    .byte $1A ; |   XX X | $DB61
    .byte $18 ; |   XX   | $DB62
    .byte $18 ; |   XX   | $DB63
    .byte $16 ; |   X XX | $DB64
    .byte $14 ; |   X X  | $DB65
    .byte $14 ; |   X X  | $DB66
    .byte $12 ; |   X  X | $DB67
    .byte $10 ; |   X    | $DB68
    .byte $FF ; |XXXXXXXX| $DB69
    .byte $16 ; |   X XX | $DB6A
    .byte $14 ; |   X X  | $DB6B
    .byte $14 ; |   X X  | $DB6C
    .byte $14 ; |   X X  | $DB6D
    .byte $14 ; |   X X  | $DB6E
    .byte $14 ; |   X X  | $DB6F
    .byte $14 ; |   X X  | $DB70
    .byte $14 ; |   X X  | $DB71
    .byte $12 ; |   X  X | $DB72
    .byte $14 ; |   X X  | $DB73
    .byte $16 ; |   X XX | $DB74
    .byte $16 ; |   X XX | $DB75
    .byte $18 ; |   XX   | $DB76
    .byte $18 ; |   XX   | $DB77
    .byte $1A ; |   XX X | $DB78
    .byte $0E ; |    XXX | $DB79
    .byte $0E ; |    XXX | $DB7A
    .byte $0E ; |    XXX | $DB7B
    .byte $0E ; |    XXX | $DB7C
    .byte $0E ; |    XXX | $DB7D
    .byte $0E ; |    XXX | $DB7E
    .byte $0E ; |    XXX | $DB7F

LDB80:
    .byte $00 ; |        | $DB80
    .byte $00 ; |        | $DB81
    .byte $00 ; |        | $DB82
    .byte $00 ; |        | $DB83
    .byte $FC ; |XXXXXX  | $DB84
    .byte $00 ; |        | $DB85
    .byte $FC ; |XXXXXX  | $DB86
    .byte $00 ; |        | $DB87
    .byte $F8 ; |XXXXX   | $DB88
    .byte $00 ; |        | $DB89
    .byte $F8 ; |XXXXX   | $DB8A
    .byte $00 ; |        | $DB8B
    .byte $F0 ; |XXXX    | $DB8C
    .byte $00 ; |        | $DB8D
    .byte $F0 ; |XXXX    | $DB8E
    .byte $00 ; |        | $DB8F
    .byte $00 ; |        | $DB90
    .byte $00 ; |        | $DB91
    .byte $00 ; |        | $DB92
    .byte $00 ; |        | $DB93
    .byte $00 ; |        | $DB94
    .byte $00 ; |        | $DB95
    .byte $00 ; |        | $DB96
    .byte $00 ; |        | $DB97
    .byte $00 ; |        | $DB98
    .byte $00 ; |        | $DB99
    .byte $00 ; |        | $DB9A
    .byte $00 ; |        | $DB9B
    .byte $00 ; |        | $DB9C
    .byte $00 ; |        | $DB9D
    .byte $00 ; |        | $DB9E
    .byte $00 ; |        | $DB9F

    .byte $00 ; |        | $DBA0
    .byte $00 ; |        | $DBA1
    .byte $0E ; |    XXX | $DBA2
    .byte $C4 ; |XX   X  | $DBA3
    .byte $C6 ; |XX   XX | $DBA4
    .byte $C8 ; |XX  X   | $DBA5
    .byte $C6 ; |XX   XX | $DBA6
    .byte $C4 ; |XX   X  | $DBA7
    .byte $C6 ; |XX   XX | $DBA8
    .byte $C8 ; |XX  X   | $DBA9
    .byte $C6 ; |XX   XX | $DBAA
    .byte $C4 ; |XX   X  | $DBAB
    .byte $C6 ; |XX   XX | $DBAC
    .byte $C8 ; |XX  X   | $DBAD
    .byte $C6 ; |XX   XX | $DBAE
    .byte $0E ; |    XXX | $DBAF
    .byte $0E ; |    XXX | $DBB0
    .byte $0E ; |    XXX | $DBB1
    .byte $0E ; |    XXX | $DBB2
    .byte $0E ; |    XXX | $DBB3
    .byte $0E ; |    XXX | $DBB4
    .byte $0E ; |    XXX | $DBB5
    .byte $0E ; |    XXX | $DBB6
    .byte $0E ; |    XXX | $DBB7
    .byte $0E ; |    XXX | $DBB8
    .byte $0E ; |    XXX | $DBB9
    .byte $0E ; |    XXX | $DBBA
    .byte $0E ; |    XXX | $DBBB
    .byte $0E ; |    XXX | $DBBC
    .byte $0E ; |    XXX | $DBBD
    .byte $0E ; |    XXX | $DBBE
    .byte $0E ; |    XXX | $DBBF
LDBC0:
    .byte $00 ; |        | $DBC0
    .byte $00 ; |        | $DBC1
    .byte $00 ; |        | $DBC2
    .byte $00 ; |        | $DBC3
    .byte $0F ; |    XXXX| $DBC4
    .byte $FF ; |XXXXXXXX| $DBC5
    .byte $0F ; |    XXXX| $DBC6
    .byte $FF ; |XXXXXXXX| $DBC7
    .byte $0F ; |    XXXX| $DBC8
    .byte $7F ; | XXXXXXX| $DBC9
    .byte $07 ; |     XXX| $DBCA
    .byte $7F ; | XXXXXXX| $DBCB
    .byte $07 ; |     XXX| $DBCC
    .byte $3F ; |  XXXXXX| $DBCD
    .byte $03 ; |      XX| $DBCE
    .byte $3F ; |  XXXXXX| $DBCF
    .byte $03 ; |      XX| $DBD0
    .byte $00 ; |        | $DBD1
    .byte $00 ; |        | $DBD2
    .byte $00 ; |        | $DBD3
    .byte $00 ; |        | $DBD4
    .byte $00 ; |        | $DBD5
    .byte $00 ; |        | $DBD6
    .byte $00 ; |        | $DBD7
    .byte $00 ; |        | $DBD8
    .byte $00 ; |        | $DBD9
    .byte $00 ; |        | $DBDA
    .byte $00 ; |        | $DBDB
    .byte $00 ; |        | $DBDC
    .byte $00 ; |        | $DBDD
    .byte $00 ; |        | $DBDE
    .byte $00 ; |        | $DBDF

    .byte $00 ; |        | $DBE0
    .byte $00 ; |        | $DBE1
    .byte $0E ; |    XXX | $DBE2
    .byte $1A ; |   XX X | $DBE3
    .byte $C4 ; |XX   X  | $DBE4
    .byte $C6 ; |XX   XX | $DBE5
    .byte $C8 ; |XX  X   | $DBE6
    .byte $C6 ; |XX   XX | $DBE7
    .byte $C4 ; |XX   X  | $DBE8
    .byte $C6 ; |XX   XX | $DBE9
    .byte $C8 ; |XX  X   | $DBEA
    .byte $C6 ; |XX   XX | $DBEB
    .byte $C4 ; |XX   X  | $DBEC
    .byte $C6 ; |XX   XX | $DBED
    .byte $C8 ; |XX  X   | $DBEE
    .byte $C6 ; |XX   XX | $DBEF
    .byte $1A ; |   XX X | $DBF0
    .byte $0E ; |    XXX | $DBF1
    .byte $0E ; |    XXX | $DBF2
    .byte $0E ; |    XXX | $DBF3
    .byte $0E ; |    XXX | $DBF4
    .byte $0E ; |    XXX | $DBF5
    .byte $0E ; |    XXX | $DBF6
    .byte $0E ; |    XXX | $DBF7
    .byte $0E ; |    XXX | $DBF8
    .byte $0E ; |    XXX | $DBF9
    .byte $0E ; |    XXX | $DBFA
    .byte $0E ; |    XXX | $DBFB
    .byte $0E ; |    XXX | $DBFC
    .byte $0E ; |    XXX | $DBFD
    .byte $0E ; |    XXX | $DBFE
    .byte $0E ; |    XXX | $DBFF
LDC00:
    .byte $00 ; |        | $DC00
    .byte $00 ; |        | $DC01
    .byte $1F ; |   XXXXX| $DC02
    .byte $FF ; |XXXXXXXX| $DC03
    .byte $1F ; |   XXXXX| $DC04
    .byte $FF ; |XXXXXXXX| $DC05
    .byte $1F ; |   XXXXX| $DC06
    .byte $FF ; |XXXXXXXX| $DC07
    .byte $1F ; |   XXXXX| $DC08
    .byte $FF ; |XXXXXXXX| $DC09
    .byte $1F ; |   XXXXX| $DC0A
    .byte $FF ; |XXXXXXXX| $DC0B
    .byte $1F ; |   XXXXX| $DC0C
    .byte $FF ; |XXXXXXXX| $DC0D
    .byte $1F ; |   XXXXX| $DC0E
    .byte $FF ; |XXXXXXXX| $DC0F
    .byte $1F ; |   XXXXX| $DC10
    .byte $FF ; |XXXXXXXX| $DC11
    .byte $1F ; |   XXXXX| $DC12
    .byte $FF ; |XXXXXXXX| $DC13
    .byte $1F ; |   XXXXX| $DC14
    .byte $FF ; |XXXXXXXX| $DC15
    .byte $1F ; |   XXXXX| $DC16
    .byte $FF ; |XXXXXXXX| $DC17
    .byte $3F ; |  XXXXXX| $DC18
    .byte $FF ; |XXXXXXXX| $DC19
    .byte $7F ; | XXXXXXX| $DC1A
    .byte $FF ; |XXXXXXXX| $DC1B
    .byte $FF ; |XXXXXXXX| $DC1C
    .byte $FF ; |XXXXXXXX| $DC1D
    .byte $FF ; |XXXXXXXX| $DC1E
    .byte $FF ; |XXXXXXXX| $DC1F

    .byte $0E ; |    XXX | $DC20
    .byte $1A ; |   XX X | $DC21
    .byte $06 ; |     XX | $DC22
    .byte $06 ; |     XX | $DC23
    .byte $06 ; |     XX | $DC24
    .byte $06 ; |     XX | $DC25
    .byte $06 ; |     XX | $DC26
    .byte $06 ; |     XX | $DC27
    .byte $08 ; |    X   | $DC28
    .byte $08 ; |    X   | $DC29
    .byte $06 ; |     XX | $DC2A
    .byte $06 ; |     XX | $DC2B
    .byte $06 ; |     XX | $DC2C
    .byte $06 ; |     XX | $DC2D
    .byte $06 ; |     XX | $DC2E
    .byte $06 ; |     XX | $DC2F
    .byte $06 ; |     XX | $DC30
    .byte $06 ; |     XX | $DC31
    .byte $06 ; |     XX | $DC32
    .byte $06 ; |     XX | $DC33
    .byte $06 ; |     XX | $DC34
    .byte $06 ; |     XX | $DC35
    .byte $06 ; |     XX | $DC36
    .byte $06 ; |     XX | $DC37
    .byte $06 ; |     XX | $DC38
    .byte $06 ; |     XX | $DC39
    .byte $06 ; |     XX | $DC3A
    .byte $06 ; |     XX | $DC3B
    .byte $04 ; |     X  | $DC3C
    .byte $04 ; |     X  | $DC3D
    .byte $06 ; |     XX | $DC3E
    .byte $06 ; |     XX | $DC3F
LDC40:
    .byte $FF ; |XXXXXXXX| $DC40
    .byte $FF ; |XXXXXXXX| $DC41
    .byte $FF ; |XXXXXXXX| $DC42
    .byte $FF ; |XXXXXXXX| $DC43
    .byte $FF ; |XXXXXXXX| $DC44
    .byte $FF ; |XXXXXXXX| $DC45
    .byte $FF ; |XXXXXXXX| $DC46
    .byte $FF ; |XXXXXXXX| $DC47
    .byte $FF ; |XXXXXXXX| $DC48
    .byte $FF ; |XXXXXXXX| $DC49
    .byte $FF ; |XXXXXXXX| $DC4A
    .byte $FF ; |XXXXXXXX| $DC4B
    .byte $FF ; |XXXXXXXX| $DC4C
    .byte $FF ; |XXXXXXXX| $DC4D
    .byte $FF ; |XXXXXXXX| $DC4E
    .byte $FF ; |XXXXXXXX| $DC4F
    .byte $FF ; |XXXXXXXX| $DC50
    .byte $FF ; |XXXXXXXX| $DC51
    .byte $FF ; |XXXXXXXX| $DC52
    .byte $FF ; |XXXXXXXX| $DC53
    .byte $FF ; |XXXXXXXX| $DC54
    .byte $FF ; |XXXXXXXX| $DC55
    .byte $FF ; |XXXXXXXX| $DC56
    .byte $FF ; |XXXXXXXX| $DC57
    .byte $FF ; |XXXXXXXX| $DC58
    .byte $FF ; |XXXXXXXX| $DC59
    .byte $FF ; |XXXXXXXX| $DC5A
    .byte $FF ; |XXXXXXXX| $DC5B
    .byte $FF ; |XXXXXXXX| $DC5C
    .byte $FF ; |XXXXXXXX| $DC5D
    .byte $FF ; |XXXXXXXX| $DC5E
    .byte $FF ; |XXXXXXXX| $DC5F

    .byte $06 ; |     XX | $DC60
    .byte $06 ; |     XX | $DC61
    .byte $0E ; |    XXX | $DC62
    .byte $0C ; |    XX  | $DC63
    .byte $0C ; |    XX  | $DC64
    .byte $0C ; |    XX  | $DC65
    .byte $0A ; |    X X | $DC66
    .byte $04 ; |     X  | $DC67
    .byte $04 ; |     X  | $DC68
    .byte $04 ; |     X  | $DC69
    .byte $04 ; |     X  | $DC6A
    .byte $04 ; |     X  | $DC6B
    .byte $04 ; |     X  | $DC6C
    .byte $04 ; |     X  | $DC6D
    .byte $04 ; |     X  | $DC6E
    .byte $04 ; |     X  | $DC6F
    .byte $04 ; |     X  | $DC70
    .byte $04 ; |     X  | $DC71
    .byte $06 ; |     XX | $DC72
    .byte $08 ; |    X   | $DC73
    .byte $06 ; |     XX | $DC74
    .byte $06 ; |     XX | $DC75
    .byte $06 ; |     XX | $DC76
    .byte $06 ; |     XX | $DC77
    .byte $06 ; |     XX | $DC78
    .byte $06 ; |     XX | $DC79
    .byte $0C ; |    XX  | $DC7A
    .byte $0A ; |    X X | $DC7B
    .byte $0A ; |    X X | $DC7C
    .byte $0A ; |    X X | $DC7D
    .byte $08 ; |    X   | $DC7E
    .byte $1A ; |   XX X | $DC7F
LDC80:
    .byte $00 ; |        | $DC80
    .byte $00 ; |        | $DC81
    .byte $00 ; |        | $DC82
    .byte $00 ; |        | $DC83
    .byte $00 ; |        | $DC84
    .byte $00 ; |        | $DC85
    .byte $00 ; |        | $DC86
    .byte $00 ; |        | $DC87
    .byte $00 ; |        | $DC88
    .byte $00 ; |        | $DC89
    .byte $00 ; |        | $DC8A
    .byte $00 ; |        | $DC8B
    .byte $00 ; |        | $DC8C
    .byte $00 ; |        | $DC8D
    .byte $00 ; |        | $DC8E
    .byte $00 ; |        | $DC8F
    .byte $00 ; |        | $DC90
    .byte $00 ; |        | $DC91
    .byte $00 ; |        | $DC92
    .byte $00 ; |        | $DC93
    .byte $00 ; |        | $DC94
    .byte $00 ; |        | $DC95
    .byte $00 ; |        | $DC96
    .byte $00 ; |        | $DC97
    .byte $00 ; |        | $DC98
    .byte $00 ; |        | $DC99
    .byte $00 ; |        | $DC9A
    .byte $00 ; |        | $DC9B
    .byte $00 ; |        | $DC9C
    .byte $00 ; |        | $DC9D
    .byte $00 ; |        | $DC9E
    .byte $00 ; |        | $DC9F

    .byte $2A ; |  X X X | $DCA0
    .byte $0E ; |    XXX | $DCA1
    .byte $0E ; |    XXX | $DCA2
    .byte $0E ; |    XXX | $DCA3
    .byte $0E ; |    XXX | $DCA4
    .byte $0E ; |    XXX | $DCA5
    .byte $0E ; |    XXX | $DCA6
    .byte $0E ; |    XXX | $DCA7
    .byte $0E ; |    XXX | $DCA8
    .byte $0E ; |    XXX | $DCA9
    .byte $0E ; |    XXX | $DCAA
    .byte $0E ; |    XXX | $DCAB
    .byte $0E ; |    XXX | $DCAC
    .byte $0E ; |    XXX | $DCAD
    .byte $0E ; |    XXX | $DCAE
    .byte $0E ; |    XXX | $DCAF
    .byte $0E ; |    XXX | $DCB0
    .byte $0E ; |    XXX | $DCB1
    .byte $0E ; |    XXX | $DCB2
    .byte $0E ; |    XXX | $DCB3
    .byte $0E ; |    XXX | $DCB4
    .byte $0E ; |    XXX | $DCB5
    .byte $0E ; |    XXX | $DCB6
    .byte $0E ; |    XXX | $DCB7
    .byte $0E ; |    XXX | $DCB8
    .byte $0E ; |    XXX | $DCB9
    .byte $0E ; |    XXX | $DCBA
    .byte $0E ; |    XXX | $DCBB
    .byte $0E ; |    XXX | $DCBC
    .byte $0E ; |    XXX | $DCBD
    .byte $28 ; |  X X   | $DCBE
    .byte $28 ; |  X X   | $DCBF
LDCC0:
    .byte $00 ; |        | $DCC0
    .byte $00 ; |        | $DCC1
    .byte $3F ; |  XXXXXX| $DCC2
    .byte $FF ; |XXXXXXXX| $DCC3
    .byte $FF ; |XXXXXXXX| $DCC4
    .byte $FF ; |XXXXXXXX| $DCC5
    .byte $FF ; |XXXXXXXX| $DCC6
    .byte $FF ; |XXXXXXXX| $DCC7
    .byte $3F ; |  XXXXXX| $DCC8
    .byte $FF ; |XXXXXXXX| $DCC9
    .byte $3F ; |  XXXXXX| $DCCA
    .byte $FF ; |XXXXXXXX| $DCCB
    .byte $3F ; |  XXXXXX| $DCCC
    .byte $FF ; |XXXXXXXX| $DCCD
    .byte $3F ; |  XXXXXX| $DCCE
    .byte $FF ; |XXXXXXXX| $DCCF
    .byte $3F ; |  XXXXXX| $DCD0
    .byte $FF ; |XXXXXXXX| $DCD1
    .byte $3C ; |  XXXX  | $DCD2
    .byte $E7 ; |XXX  XXX| $DCD3
    .byte $3C ; |  XXXX  | $DCD4
    .byte $E7 ; |XXX  XXX| $DCD5
    .byte $3C ; |  XXXX  | $DCD6
    .byte $E7 ; |XXX  XXX| $DCD7
    .byte $3C ; |  XXXX  | $DCD8
    .byte $E7 ; |XXX  XXX| $DCD9
    .byte $3F ; |  XXXXXX| $DCDA
    .byte $FF ; |XXXXXXXX| $DCDB
    .byte $FF ; |XXXXXXXX| $DCDC
    .byte $FF ; |XXXXXXXX| $DCDD
    .byte $FF ; |XXXXXXXX| $DCDE
    .byte $FF ; |XXXXXXXX| $DCDF

    .byte $28 ; |  X X   | $DCE0
    .byte $1A ; |   XX X | $DCE1
    .byte $18 ; |   XX   | $DCE2
    .byte $16 ; |   X XX | $DCE3
    .byte $14 ; |   X X  | $DCE4
    .byte $12 ; |   X  X | $DCE5
    .byte $C6 ; |XX   XX | $DCE6
    .byte $C8 ; |XX  X   | $DCE7
    .byte $C8 ; |XX  X   | $DCE8
    .byte $C8 ; |XX  X   | $DCE9
    .byte $C8 ; |XX  X   | $DCEA
    .byte $C8 ; |XX  X   | $DCEB
    .byte $C8 ; |XX  X   | $DCEC
    .byte $C8 ; |XX  X   | $DCED
    .byte $C8 ; |XX  X   | $DCEE
    .byte $C8 ; |XX  X   | $DCEF
    .byte $C8 ; |XX  X   | $DCF0
    .byte $C8 ; |XX  X   | $DCF1
    .byte $C8 ; |XX  X   | $DCF2
    .byte $C8 ; |XX  X   | $DCF3
    .byte $C8 ; |XX  X   | $DCF4
    .byte $C8 ; |XX  X   | $DCF5
    .byte $C8 ; |XX  X   | $DCF6
    .byte $C8 ; |XX  X   | $DCF7
    .byte $C8 ; |XX  X   | $DCF8
    .byte $C8 ; |XX  X   | $DCF9
    .byte $C8 ; |XX  X   | $DCFA
    .byte $C8 ; |XX  X   | $DCFB
    .byte $C8 ; |XX  X   | $DCFC
    .byte $C6 ; |XX   XX | $DCFD
    .byte $C4 ; |XX   X  | $DCFE
    .byte $C2 ; |XX    X | $DCFF
LDD00:
    .byte $FF ; |XXXXXXXX| $DD00
    .byte $FF ; |XXXXXXXX| $DD01
    .byte $FF ; |XXXXXXXX| $DD02
    .byte $FF ; |XXXXXXXX| $DD03
    .byte $FF ; |XXXXXXXX| $DD04
    .byte $FF ; |XXXXXXXX| $DD05
    .byte $FF ; |XXXXXXXX| $DD06
    .byte $FF ; |XXXXXXXX| $DD07
    .byte $FF ; |XXXXXXXX| $DD08
    .byte $7F ; | XXXXXXX| $DD09
    .byte $FF ; |XXXXXXXX| $DD0A
    .byte $7F ; | XXXXXXX| $DD0B
    .byte $FF ; |XXXXXXXX| $DD0C
    .byte $7F ; | XXXXXXX| $DD0D
    .byte $FF ; |XXXXXXXX| $DD0E
    .byte $7F ; | XXXXXXX| $DD0F
    .byte $FF ; |XXXXXXXX| $DD10
    .byte $3F ; |  XXXXXX| $DD11
    .byte $FF ; |XXXXXXXX| $DD12
    .byte $3F ; |  XXXXXX| $DD13
    .byte $FF ; |XXXXXXXX| $DD14
    .byte $3F ; |  XXXXXX| $DD15
    .byte $FF ; |XXXXXXXX| $DD16
    .byte $3F ; |  XXXXXX| $DD17
    .byte $FF ; |XXXXXXXX| $DD18
    .byte $1F ; |   XXXXX| $DD19
    .byte $FF ; |XXXXXXXX| $DD1A
    .byte $1F ; |   XXXXX| $DD1B
    .byte $FF ; |XXXXXXXX| $DD1C
    .byte $1F ; |   XXXXX| $DD1D
    .byte $FF ; |XXXXXXXX| $DD1E
    .byte $00 ; |        | $DD1F

    .byte $04 ; |     X  | $DD20
    .byte $06 ; |     XX | $DD21
    .byte $08 ; |    X   | $DD22
    .byte $0A ; |    X X | $DD23
    .byte $08 ; |    X   | $DD24
    .byte $06 ; |     XX | $DD25
    .byte $08 ; |    X   | $DD26
    .byte $0A ; |    X X | $DD27
    .byte $08 ; |    X   | $DD28
    .byte $06 ; |     XX | $DD29
    .byte $08 ; |    X   | $DD2A
    .byte $0A ; |    X X | $DD2B
    .byte $08 ; |    X   | $DD2C
    .byte $06 ; |     XX | $DD2D
    .byte $08 ; |    X   | $DD2E
    .byte $0A ; |    X X | $DD2F
    .byte $08 ; |    X   | $DD30
    .byte $06 ; |     XX | $DD31
    .byte $08 ; |    X   | $DD32
    .byte $0A ; |    X X | $DD33
    .byte $08 ; |    X   | $DD34
    .byte $06 ; |     XX | $DD35
    .byte $08 ; |    X   | $DD36
    .byte $0A ; |    X X | $DD37
    .byte $08 ; |    X   | $DD38
    .byte $06 ; |     XX | $DD39
    .byte $08 ; |    X   | $DD3A
    .byte $08 ; |    X   | $DD3B
    .byte $0A ; |    X X | $DD3C
    .byte $06 ; |     XX | $DD3D
    .byte $1A ; |   XX X | $DD3E
    .byte $1A ; |   XX X | $DD3F

    .byte $FF ; |XXXXXXXX| $DD40  free bytes
    .byte $FF ; |XXXXXXXX| $DD41
    .byte $FF ; |XXXXXXXX| $DD42
    .byte $FF ; |XXXXXXXX| $DD43
    .byte $FF ; |XXXXXXXX| $DD44
    .byte $FF ; |XXXXXXXX| $DD45
    .byte $FF ; |XXXXXXXX| $DD46
    .byte $FF ; |XXXXXXXX| $DD47
    .byte $FF ; |XXXXXXXX| $DD48
    .byte $FF ; |XXXXXXXX| $DD49
    .byte $FF ; |XXXXXXXX| $DD4A
    .byte $FF ; |XXXXXXXX| $DD4B
    .byte $FF ; |XXXXXXXX| $DD4C
    .byte $FF ; |XXXXXXXX| $DD4D
    .byte $FF ; |XXXXXXXX| $DD4E
    .byte $FF ; |XXXXXXXX| $DD4F
    .byte $FF ; |XXXXXXXX| $DD50
    .byte $FF ; |XXXXXXXX| $DD51
    .byte $FF ; |XXXXXXXX| $DD52
    .byte $FF ; |XXXXXXXX| $DD53
    .byte $FF ; |XXXXXXXX| $DD54
    .byte $FF ; |XXXXXXXX| $DD55
    .byte $FF ; |XXXXXXXX| $DD56
    .byte $FF ; |XXXXXXXX| $DD57
    .byte $FF ; |XXXXXXXX| $DD58
    .byte $FF ; |XXXXXXXX| $DD59
    .byte $FF ; |XXXXXXXX| $DD5A
    .byte $FF ; |XXXXXXXX| $DD5B
    .byte $FF ; |XXXXXXXX| $DD5C
    .byte $FF ; |XXXXXXXX| $DD5D
    .byte $FF ; |XXXXXXXX| $DD5E
    .byte $FF ; |XXXXXXXX| $DD5F
    .byte $FF ; |XXXXXXXX| $DD60
    .byte $FF ; |XXXXXXXX| $DD61
    .byte $FF ; |XXXXXXXX| $DD62
    .byte $FF ; |XXXXXXXX| $DD63
    .byte $FF ; |XXXXXXXX| $DD64
    .byte $FF ; |XXXXXXXX| $DD65
    .byte $FF ; |XXXXXXXX| $DD66
    .byte $FF ; |XXXXXXXX| $DD67
    .byte $FF ; |XXXXXXXX| $DD68
    .byte $FF ; |XXXXXXXX| $DD69
    .byte $FF ; |XXXXXXXX| $DD6A
    .byte $FF ; |XXXXXXXX| $DD6B
    .byte $FF ; |XXXXXXXX| $DD6C
    .byte $FF ; |XXXXXXXX| $DD6D
    .byte $FF ; |XXXXXXXX| $DD6E
    .byte $FF ; |XXXXXXXX| $DD6F
    .byte $FF ; |XXXXXXXX| $DD70
    .byte $FF ; |XXXXXXXX| $DD71
    .byte $FF ; |XXXXXXXX| $DD72
    .byte $FF ; |XXXXXXXX| $DD73
    .byte $FF ; |XXXXXXXX| $DD74
    .byte $FF ; |XXXXXXXX| $DD75
    .byte $FF ; |XXXXXXXX| $DD76
    .byte $FF ; |XXXXXXXX| $DD77
    .byte $FF ; |XXXXXXXX| $DD78
    .byte $FF ; |XXXXXXXX| $DD79
    .byte $FF ; |XXXXXXXX| $DD7A
    .byte $FF ; |XXXXXXXX| $DD7B
    .byte $FF ; |XXXXXXXX| $DD7C
    .byte $FF ; |XXXXXXXX| $DD7D
    .byte $FF ; |XXXXXXXX| $DD7E
    .byte $FF ; |XXXXXXXX| $DD7F
    .byte $FF ; |XXXXXXXX| $DD80
    .byte $FF ; |XXXXXXXX| $DD81
    .byte $FF ; |XXXXXXXX| $DD82
    .byte $FF ; |XXXXXXXX| $DD83
    .byte $FF ; |XXXXXXXX| $DD84
    .byte $FF ; |XXXXXXXX| $DD85
    .byte $FF ; |XXXXXXXX| $DD86
    .byte $FF ; |XXXXXXXX| $DD87
    .byte $FF ; |XXXXXXXX| $DD88
    .byte $FF ; |XXXXXXXX| $DD89
    .byte $FF ; |XXXXXXXX| $DD8A
    .byte $FF ; |XXXXXXXX| $DD8B
    .byte $FF ; |XXXXXXXX| $DD8C
    .byte $FF ; |XXXXXXXX| $DD8D
    .byte $FF ; |XXXXXXXX| $DD8E
    .byte $FF ; |XXXXXXXX| $DD8F
    .byte $FF ; |XXXXXXXX| $DD90
    .byte $FF ; |XXXXXXXX| $DD91
    .byte $FF ; |XXXXXXXX| $DD92
    .byte $FF ; |XXXXXXXX| $DD93
    .byte $FF ; |XXXXXXXX| $DD94
    .byte $FF ; |XXXXXXXX| $DD95
    .byte $FF ; |XXXXXXXX| $DD96
    .byte $FF ; |XXXXXXXX| $DD97
    .byte $FF ; |XXXXXXXX| $DD98
    .byte $FF ; |XXXXXXXX| $DD99
    .byte $FF ; |XXXXXXXX| $DD9A
    .byte $FF ; |XXXXXXXX| $DD9B
    .byte $FF ; |XXXXXXXX| $DD9C
    .byte $FF ; |XXXXXXXX| $DD9D
    .byte $FF ; |XXXXXXXX| $DD9E
    .byte $FF ; |XXXXXXXX| $DD9F
    .byte $FF ; |XXXXXXXX| $DDA0
    .byte $FF ; |XXXXXXXX| $DDA1
    .byte $FF ; |XXXXXXXX| $DDA2
    .byte $FF ; |XXXXXXXX| $DDA3
    .byte $FF ; |XXXXXXXX| $DDA4
    .byte $FF ; |XXXXXXXX| $DDA5
    .byte $FF ; |XXXXXXXX| $DDA6
    .byte $FF ; |XXXXXXXX| $DDA7
    .byte $FF ; |XXXXXXXX| $DDA8
    .byte $FF ; |XXXXXXXX| $DDA9
    .byte $FF ; |XXXXXXXX| $DDAA
    .byte $FF ; |XXXXXXXX| $DDAB
    .byte $FF ; |XXXXXXXX| $DDAC
    .byte $FF ; |XXXXXXXX| $DDAD
    .byte $FF ; |XXXXXXXX| $DDAE
    .byte $FF ; |XXXXXXXX| $DDAF
    .byte $FF ; |XXXXXXXX| $DDB0
    .byte $FF ; |XXXXXXXX| $DDB1
    .byte $FF ; |XXXXXXXX| $DDB2
    .byte $FF ; |XXXXXXXX| $DDB3
    .byte $FF ; |XXXXXXXX| $DDB4
    .byte $FF ; |XXXXXXXX| $DDB5
    .byte $FF ; |XXXXXXXX| $DDB6
    .byte $FF ; |XXXXXXXX| $DDB7
    .byte $FF ; |XXXXXXXX| $DDB8
    .byte $FF ; |XXXXXXXX| $DDB9
    .byte $FF ; |XXXXXXXX| $DDBA
    .byte $FF ; |XXXXXXXX| $DDBB
    .byte $FF ; |XXXXXXXX| $DDBC
    .byte $FF ; |XXXXXXXX| $DDBD
    .byte $FF ; |XXXXXXXX| $DDBE
    .byte $FF ; |XXXXXXXX| $DDBF
    .byte $FF ; |XXXXXXXX| $DDC0
    .byte $FF ; |XXXXXXXX| $DDC1
    .byte $FF ; |XXXXXXXX| $DDC2
    .byte $FF ; |XXXXXXXX| $DDC3
    .byte $FF ; |XXXXXXXX| $DDC4
    .byte $FF ; |XXXXXXXX| $DDC5
    .byte $FF ; |XXXXXXXX| $DDC6
    .byte $FF ; |XXXXXXXX| $DDC7
    .byte $FF ; |XXXXXXXX| $DDC8
    .byte $FF ; |XXXXXXXX| $DDC9
    .byte $FF ; |XXXXXXXX| $DDCA
    .byte $FF ; |XXXXXXXX| $DDCB
    .byte $FF ; |XXXXXXXX| $DDCC
    .byte $FF ; |XXXXXXXX| $DDCD
    .byte $FF ; |XXXXXXXX| $DDCE
    .byte $FF ; |XXXXXXXX| $DDCF
    .byte $FF ; |XXXXXXXX| $DDD0
    .byte $FF ; |XXXXXXXX| $DDD1
    .byte $FF ; |XXXXXXXX| $DDD2
    .byte $FF ; |XXXXXXXX| $DDD3
    .byte $FF ; |XXXXXXXX| $DDD4
    .byte $FF ; |XXXXXXXX| $DDD5
    .byte $FF ; |XXXXXXXX| $DDD6
    .byte $FF ; |XXXXXXXX| $DDD7
    .byte $FF ; |XXXXXXXX| $DDD8
    .byte $FF ; |XXXXXXXX| $DDD9
    .byte $FF ; |XXXXXXXX| $DDDA
    .byte $FF ; |XXXXXXXX| $DDDB
    .byte $FF ; |XXXXXXXX| $DDDC
    .byte $FF ; |XXXXXXXX| $DDDD
    .byte $FF ; |XXXXXXXX| $DDDE
    .byte $FF ; |XXXXXXXX| $DDDF
    .byte $FF ; |XXXXXXXX| $DDE0
    .byte $FF ; |XXXXXXXX| $DDE1
    .byte $FF ; |XXXXXXXX| $DDE2
    .byte $FF ; |XXXXXXXX| $DDE3
    .byte $FF ; |XXXXXXXX| $DDE4
    .byte $FF ; |XXXXXXXX| $DDE5
    .byte $FF ; |XXXXXXXX| $DDE6
    .byte $FF ; |XXXXXXXX| $DDE7
    .byte $FF ; |XXXXXXXX| $DDE8
    .byte $FF ; |XXXXXXXX| $DDE9
    .byte $FF ; |XXXXXXXX| $DDEA
    .byte $FF ; |XXXXXXXX| $DDEB
    .byte $FF ; |XXXXXXXX| $DDEC
    .byte $FF ; |XXXXXXXX| $DDED
    .byte $FF ; |XXXXXXXX| $DDEE
    .byte $FF ; |XXXXXXXX| $DDEF
    .byte $FF ; |XXXXXXXX| $DDF0
    .byte $FF ; |XXXXXXXX| $DDF1
    .byte $FF ; |XXXXXXXX| $DDF2
    .byte $FF ; |XXXXXXXX| $DDF3
    .byte $FF ; |XXXXXXXX| $DDF4
    .byte $FF ; |XXXXXXXX| $DDF5
    .byte $FF ; |XXXXXXXX| $DDF6
    .byte $FF ; |XXXXXXXX| $DDF7
    .byte $FF ; |XXXXXXXX| $DDF8
    .byte $FF ; |XXXXXXXX| $DDF9
    .byte $FF ; |XXXXXXXX| $DDFA
    .byte $FF ; |XXXXXXXX| $DDFB
    .byte $FF ; |XXXXXXXX| $DDFC
    .byte $FF ; |XXXXXXXX| $DDFD
    .byte $FF ; |XXXXXXXX| $DDFE
    .byte $FF ; |XXXXXXXX| $DDFF

LDE00:
  COMMON_ROUTINE  BK_D000

LDE75:
    inc    ram_81                ; 5
    lda    ram_81                ; 3
    cmp    #$25                  ; 2
    bcc    LDE83                 ; 2³
    lda    #$00                  ; 2
    sta    ram_81                ; 3
    inc    ram_80                ; 5
LDE83:
    inc    ram_82                ; 5
    lda    ram_82                ; 3
    cmp    #$25                  ; 2
    bcc    LDEBC                 ; 2³
    lda    #$00                  ; 2
    sta    ram_82                ; 3
    ldx    #$01                  ; 2
    ldy    #$00                  ; 2
LDE93:
    lda    ram_82,X              ; 4
    sta.wy ram_82,Y              ; 5
    lda    ram_92,X              ; 4
    sta.wy ram_92,Y              ; 5
    lda    ram_97,X              ; 4
    sta.wy ram_97,Y              ; 5
    lda    ram_9C,X              ; 4
    sta.wy ram_9C,Y              ; 5
    iny                          ; 2
    inx                          ; 2
    cpx    #$05                  ; 2
    bcc    LDE93                 ; 2³
    dex                          ; 2
    lda    #$80                  ; 2
    sta    ram_92,X              ; 4
    lda    #$00                  ; 2
    sta    ram_97,X              ; 4
    sta    ram_9C,X              ; 4
    dec    ram_80                ; 5
    inc    distanceMarker        ; 5
LDEBC:
    ldx    #$03                  ; 2
LDEBE:
    dec    ram_B5,X              ; 6
    lda    ram_B5,X              ; 4
    cmp    #$8E                  ; 2
    bcc    LDECA                 ; 2³
    lda    #$8F                  ; 2
    sta    ram_B5,X              ; 4
LDECA:
    dex                          ; 2
    bpl    LDEBE                 ; 2³
    jmp    LDFEB                 ; 3

LDED0:
    lda.wy ram_B9,Y              ; 4
    and    #$F0                  ; 2
    beq    LDEFB                 ; 2³
    lda.wy ram_B1,Y              ; 4
    sec                          ; 2
    sbc    playerHpos            ; 3
    bcc    LDEFB                 ; 2³
    cmp    #$02                  ; 2
    bcc    LDEFB                 ; 2³
    cmp    #$07                  ; 2
    bcs    LDEFB                 ; 2³
    lda    playerVpos            ; 3
    sec                          ; 2
    sbc.wy ram_B5,Y              ; 4
    bcc    LDEFB                 ; 2³
    cmp    #$06                  ; 2
    bcc    LDEFB                 ; 2³
    cmp    #$12                  ; 2
    bcs    LDEFB                 ; 2³
    sec                          ; 2
    jmp    LDFEB                 ; 3

LDEFB:
    clc                          ; 2
    jmp    LDFEB                 ; 3

LDEFF:
    sec                          ; 2
    sbc    ram_B5                ; 3
    bcc    LDF2B                 ; 2³
    cmp    #$02                  ; 2
    bcc    LDF2B                 ; 2³
    cmp    #$15                  ; 2
    bcs    LDF2B                 ; 2³
    lda    ram_B5                ; 3
    cmp    #$8E                  ; 2
    bcs    LDF2B                 ; 2³
    lda    ram_B9                ; 3
    and    #$F0                  ; 2
    beq    LDF2B                 ; 2³
    lda    ram_B1                ; 3
    sec                          ; 2
    sbc    ram_92,X              ; 4
    bcc    LDF2B                 ; 2³
    cmp    #$01                  ; 2
    bcc    LDF2B                 ; 2³
    cmp    #$08                  ; 2
    bcs    LDF2B                 ; 2³
    sec                          ; 2
    jmp    LDFEB                 ; 3

LDF2B:
    clc                          ; 2
    jmp    LDFEB                 ; 3

    .byte $FF ; |XXXXXXXX| $DF2F  free bytes
    .byte $FF ; |XXXXXXXX| $DF30
    .byte $FF ; |XXXXXXXX| $DF31
    .byte $FF ; |XXXXXXXX| $DF32
    .byte $FF ; |XXXXXXXX| $DF33
    .byte $FF ; |XXXXXXXX| $DF34
    .byte $FF ; |XXXXXXXX| $DF35
    .byte $FF ; |XXXXXXXX| $DF36
    .byte $FF ; |XXXXXXXX| $DF37
    .byte $FF ; |XXXXXXXX| $DF38
    .byte $FF ; |XXXXXXXX| $DF39
    .byte $FF ; |XXXXXXXX| $DF3A
    .byte $FF ; |XXXXXXXX| $DF3B
    .byte $FF ; |XXXXXXXX| $DF3C
    .byte $FF ; |XXXXXXXX| $DF3D
    .byte $FF ; |XXXXXXXX| $DF3E
    .byte $FF ; |XXXXXXXX| $DF3F
    .byte $FF ; |XXXXXXXX| $DF40
    .byte $FF ; |XXXXXXXX| $DF41
    .byte $FF ; |XXXXXXXX| $DF42
    .byte $FF ; |XXXXXXXX| $DF43
    .byte $FF ; |XXXXXXXX| $DF44
    .byte $FF ; |XXXXXXXX| $DF45
    .byte $FF ; |XXXXXXXX| $DF46
    .byte $FF ; |XXXXXXXX| $DF47
    .byte $FF ; |XXXXXXXX| $DF48
    .byte $FF ; |XXXXXXXX| $DF49
    .byte $FF ; |XXXXXXXX| $DF4A
    .byte $FF ; |XXXXXXXX| $DF4B
    .byte $FF ; |XXXXXXXX| $DF4C
    .byte $FF ; |XXXXXXXX| $DF4D
    .byte $FF ; |XXXXXXXX| $DF4E
    .byte $FF ; |XXXXXXXX| $DF4F
    .byte $FF ; |XXXXXXXX| $DF50
    .byte $FF ; |XXXXXXXX| $DF51
    .byte $FF ; |XXXXXXXX| $DF52
    .byte $FF ; |XXXXXXXX| $DF53
    .byte $FF ; |XXXXXXXX| $DF54
    .byte $FF ; |XXXXXXXX| $DF55
    .byte $FF ; |XXXXXXXX| $DF56
    .byte $FF ; |XXXXXXXX| $DF57
    .byte $FF ; |XXXXXXXX| $DF58
    .byte $FF ; |XXXXXXXX| $DF59
    .byte $FF ; |XXXXXXXX| $DF5A
    .byte $FF ; |XXXXXXXX| $DF5B
    .byte $FF ; |XXXXXXXX| $DF5C
    .byte $FF ; |XXXXXXXX| $DF5D
    .byte $FF ; |XXXXXXXX| $DF5E
    .byte $FF ; |XXXXXXXX| $DF5F

       ORG $2F60
      RORG $DF60

    .byte $FF ; |XXXXXXXX| $DF60
    .byte $FF ; |XXXXXXXX| $DF61
    .byte $FF ; |XXXXXXXX| $DF62
    .byte $FF ; |XXXXXXXX| $DF63
    .byte $FF ; |XXXXXXXX| $DF64
    .byte $FF ; |XXXXXXXX| $DF65
    .byte $FF ; |XXXXXXXX| $DF66
    .byte $FF ; |XXXXXXXX| $DF67
    .byte $FF ; |XXXXXXXX| $DF68
    .byte $FF ; |XXXXXXXX| $DF69
    .byte $FF ; |XXXXXXXX| $DF6A
    .byte $FF ; |XXXXXXXX| $DF6B
    .byte $FF ; |XXXXXXXX| $DF6C
    .byte $FF ; |XXXXXXXX| $DF6D
    .byte $FF ; |XXXXXXXX| $DF6E
    .byte $FF ; |XXXXXXXX| $DF6F
    .byte $FF ; |XXXXXXXX| $DF70
    .byte $FF ; |XXXXXXXX| $DF71
    .byte $FF ; |XXXXXXXX| $DF72
    .byte $FF ; |XXXXXXXX| $DF73
    .byte $FF ; |XXXXXXXX| $DF74
    .byte $FF ; |XXXXXXXX| $DF75
    .byte $FF ; |XXXXXXXX| $DF76
    .byte $FF ; |XXXXXXXX| $DF77
    .byte $FF ; |XXXXXXXX| $DF78
    .byte $FF ; |XXXXXXXX| $DF79
    .byte $FF ; |XXXXXXXX| $DF7A
    .byte $FF ; |XXXXXXXX| $DF7B
    .byte $FF ; |XXXXXXXX| $DF7C
    .byte $FF ; |XXXXXXXX| $DF7D
    .byte $FF ; |XXXXXXXX| $DF7E

    .byte $00   ; $DF7F
    .byte $00   ; $DF80
    .byte $00   ; $DF81

MDF82:
    jmp    LDF85                 ; 3
LDF85:
    jmp    LD000                 ; 3

    .byte $FF ; |XXXXXXXX| $DF88
    .byte $FF ; |XXXXXXXX| $DF89
    .byte $FF ; |XXXXXXXX| $DF8A
    .byte $FF ; |XXXXXXXX| $DF8B
    .byte $FF ; |XXXXXXXX| $DF8C
    .byte $FF ; |XXXXXXXX| $DF8D
    .byte $FF ; |XXXXXXXX| $DF8E
    .byte $FF ; |XXXXXXXX| $DF8F
    .byte $FF ; |XXXXXXXX| $DF90
    .byte $FF ; |XXXXXXXX| $DF91
    .byte $FF ; |XXXXXXXX| $DF92
    .byte $FF ; |XXXXXXXX| $DF93
    .byte $FF ; |XXXXXXXX| $DF94
    .byte $FF ; |XXXXXXXX| $DF95
    .byte $FF ; |XXXXXXXX| $DF96
    .byte $FF ; |XXXXXXXX| $DF97
    .byte $FF ; |XXXXXXXX| $DF98
    .byte $FF ; |XXXXXXXX| $DF99
    .byte $FF ; |XXXXXXXX| $DF9A
    .byte $FF ; |XXXXXXXX| $DF9B
    .byte $FF ; |XXXXXXXX| $DF9C
    .byte $FF ; |XXXXXXXX| $DF9D
    .byte $FF ; |XXXXXXXX| $DF9E
    .byte $FF ; |XXXXXXXX| $DF9F
    .byte $FF ; |XXXXXXXX| $DFA0
    .byte $FF ; |XXXXXXXX| $DFA1
    .byte $FF ; |XXXXXXXX| $DFA2
    .byte $FF ; |XXXXXXXX| $DFA3
    .byte $FF ; |XXXXXXXX| $DFA4
    .byte $FF ; |XXXXXXXX| $DFA5
    .byte $FF ; |XXXXXXXX| $DFA6
    .byte $FF ; |XXXXXXXX| $DFA7
    .byte $FF ; |XXXXXXXX| $DFA8
    .byte $FF ; |XXXXXXXX| $DFA9
    .byte $FF ; |XXXXXXXX| $DFAA
    .byte $FF ; |XXXXXXXX| $DFAB

    .byte $00   ; $DFAC
    .byte $00   ; $DFAD
    .byte $00   ; $DFAE

MDFAF:
    jmp    LDFB2                 ; 3
LDFB2:
    jmp    LDE00                 ; 3

    .byte $00   ; $DFB5
    .byte $00   ; $DFB6
    .byte $00   ; $DFB7

MDFB8:
    jmp    LDFBB                 ; 3
LDFBB:
    jmp    LDED0                 ; 3

    .byte $00   ; $DFBE
    .byte $00   ; $DFBF
    .byte $00   ; $DFC0

MDFC1:
    jmp    LDFC4                 ; 3
LDFC4:
    jmp    LDEFF                 ; 3

    .byte $00   ; $DFC7
    .byte $00   ; $DFC8
    .byte $00   ; $DFC9

MDFCA:
    jmp    LDFCD                 ; 3
LDFCD:
    jmp    LDE75                 ; 3

    .byte $FF ; |XXXXXXXX| $DFD0
    .byte $FF ; |XXXXXXXX| $DFD1
    .byte $FF ; |XXXXXXXX| $DFD2
    .byte $FF ; |XXXXXXXX| $DFD3
    .byte $FF ; |XXXXXXXX| $DFD4
    .byte $FF ; |XXXXXXXX| $DFD5
    .byte $FF ; |XXXXXXXX| $DFD6
    .byte $FF ; |XXXXXXXX| $DFD7
    .byte $FF ; |XXXXXXXX| $DFD8
    .byte $FF ; |XXXXXXXX| $DFD9
    .byte $FF ; |XXXXXXXX| $DFDA
    .byte $FF ; |XXXXXXXX| $DFDB
    .byte $FF ; |XXXXXXXX| $DFDC
    .byte $FF ; |XXXXXXXX| $DFDD
    .byte $FF ; |XXXXXXXX| $DFDE
    .byte $FF ; |XXXXXXXX| $DFDF
    .byte $FF ; |XXXXXXXX| $DFE0
    .byte $FF ; |XXXXXXXX| $DFE1
    .byte $FF ; |XXXXXXXX| $DFE2
    .byte $FF ; |XXXXXXXX| $DFE3
    .byte $FF ; |XXXXXXXX| $DFE4
    .byte $FF ; |XXXXXXXX| $DFE5
    .byte $FF ; |XXXXXXXX| $DFE6
    .byte $FF ; |XXXXXXXX| $DFE7
    .byte $FF ; |XXXXXXXX| $DFE8
    .byte $FF ; |XXXXXXXX| $DFE9
    .byte $FF ; |XXXXXXXX| $DFEA

LDFEB:
    bit    BANK_3                ; 4   bankswitch, use RTS
    rts                          ; 6   not used

START_2:
    cli                          ; 2
    bit    BANK_3                ; 4
    jmp    LF000                 ; 3   not used

       ORG $2FF6
      RORG $DFF6

    .byte $EA   ; $DFF6
    .byte $EA   ; $DFF7
    .byte $EA   ; $DFF8
    .byte $EA   ; $DFF9
    .byte $EA   ; $DFFA
    .byte $EA   ; $DFFB

    .word START_2
    .word START_2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 3
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $3000
      RORG $F000

LF000:
    sei                          ; 2
    cld                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    inx                          ; 2
    txa                          ; 2
.loopClear:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    .loopClear            ; 2³

    sta    ram_81                ; 3
    lda    #$AB                  ; 2
    sta    scoreBig              ; 3
    lda    #$CD                  ; 2
    sta    scoreSmall            ; 3
    lda    #$31                  ; 2
    sta    CTRLPF                ; 3
    sta    ram_D3                ; 3
    lda    #$CC                  ; 2
    bne    LF058                 ; 3   always branch

LF020:
    lda    ram_C3                ; 3
    and    #$0C                  ; 2
    sta    ram_D6                ; 3
    lda    SWCHB                 ; 4
    and    #$03                  ; 2  keep select and reset
    asl                          ; 2
    asl                          ; 2
    sta    ram_D7                ; 3
    lda    ram_C3                ; 3
    and    #$F3                  ; 2
    ora    ram_D7                ; 3
    sta    ram_C3                ; 3
    lda    ram_D6                ; 3
    eor    ram_D7                ; 3
    and    ram_D6                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bcs    LF050                 ; 2³
    beq    LF071                 ; 2³
    lda    #0                    ; 2
    sta    scoreBig              ; 3
    lda    ram_C3                ; 3
    eor    #$02                  ; 2
    ora    #$C0                  ; 2
    bne    LF054                 ; 3   always branch

LF050:
    lda    ram_C3                ; 3
    and    #$3E                  ; 2
LF054:
    ldy    #0                    ; 2
    sty    scoreBig              ; 3
LF058:
    sta    ram_C3                ; 3
    lda    ram_C2                ; 3
    ora    #$80                  ; 2
    sta    ram_C2                ; 3
    lda    #$80                  ; 2
    sta    frameCounter          ; 3
    lda    #$20                  ; 2
    jsr    LFB47                 ; 6
    jsr    LFB5C                 ; 6
    lda    #$30                  ; 2
    jsr    LFB47                 ; 6
LF071:
    lda    SWCHB                 ; 4
    ora    #$FC                  ; 2
    cmp    SWCHA                 ; 4
    bne    LF083                 ; 2³
    lda.w  INPT4                 ; 4
    and.w  INPT5                 ; 4
    bmi    LF087                 ; 2³
LF083:
    lda    #$00                  ; 2
    sta    ram_D2                ; 3
LF087:
    lda    livesLevelNum         ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    LFE4B,Y               ; 4
    sta    ram_D5                ; 3
    lda    ram_C2                ; 3
    bmi    LF098                 ; 2³
    jmp    LF149                 ; 3

LF098:
    ora    #$40                  ; 2
    sta    ram_C2                ; 3
    lda    ram_C3                ; 3
    and    #$10                  ; 2
    beq    LF0B5                 ; 2³
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    ora    #$40                  ; 2
    sta    ram_D5                ; 3
    lda    #SOUND_80              ; 2
    jsr    SetSoundEvent         ; 6
    lda    ram_CE                ; 3
    bne    LF0BB                 ; 2³
    beq    LF0C5                 ; 3   always branch

LF0B5:
    lda    frameCounter          ; 3
    cmp    #$80                  ; 2
    beq    LF0BE                 ; 2³
LF0BB:
    jmp    LF149                 ; 3

LF0BE:
    lda    livesLevelNum         ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    livesLevelNum         ; 3
LF0C5:
    lda    ram_C2                ; 3
    and    #$7F                  ; 2
    sta    ram_C2                ; 3
    lda    ram_C3                ; 3
    and    #$10                  ; 2
    beq    LF0E5                 ; 2³
    lda    livesLevelNum         ; 3
    adc    #$01                  ; 2
    and    #$F7                  ; 2
    sta    livesLevelNum         ; 3
    lda    ram_C3                ; 3
    and    #$EF                  ; 2
    sta    ram_C3                ; 3
    lda    #0                    ; 2
    sta    distanceMarker        ; 3
    beq    LF103                 ; 3+1   always branch

LF0E5:
    lda    distanceMarker        ; 3
    sta    ram_D6                ; 3
    jsr    LFB5C                 ; 6
    lda    livesLevelNum         ; 3
    bpl    LF103                 ; 2³+1
    jsr    LFB5C                 ; 6
    lda    livesLevelNum         ; 3
    bpl    LF103                 ; 2³+1
    lda    ram_D6                ; 3
    sta    otherPlayerStats      ; 3
    lda    ram_C3                ; 3
    ora    #$80                  ; 2
    sta    ram_C3                ; 3
    bne    LF149                 ; 3   always branch

LF103:
    lda    distanceMarker        ; 3
    and    #$F8                  ; 2
    sta    distanceMarker        ; 3
    lda    #$3A                  ; 2
    sta    playerHpos            ; 3
    lda    #$23                  ; 2
    sta    playerVpos            ; 3
    ldx    #$01                  ; 2
    stx    ram_BF                ; 3
    lda    ram_C2                ; 3
    and    #$F8                  ; 2
    sta    ram_C2                ; 3
    ldx    #$03                  ; 2
LF11D:
    lda    #$00                  ; 2
    sta    ram_B9,X              ; 4
    sta    ram_B1,X              ; 4
    lda    #$8F                  ; 2
    sta    ram_B5,X              ; 4
    dex                          ; 2
    bpl    LF11D                 ; 2³
    inx                          ; 2
    stx    ram_B0                ; 3
    lda    #$1E                  ; 2
    sta    ram_81                ; 3
    ldx    #$03                  ; 2
    stx    ram_80                ; 3
    inx                          ; 2
    stx    ram_91                ; 3
LF138:
    lda    #$80                  ; 2
    sta    ram_92,X              ; 4
    lda    #$00                  ; 2
    sta    ram_97,X              ; 4
    sta    ram_9C,X              ; 4
    sta    ram_82,X              ; 4
    dex                          ; 2
    bpl    LF138                 ; 2³
    sta    ram_92                ; 3
LF149:
    bit    ram_C3                ; 3
    bvs    LF176                 ; 2³
    bpl    LF15B                 ; 2³
    lda    frameCounter          ; 3
    and    #$7F                  ; 2
    bne    LF176                 ; 2³
    jsr    LFB5C                 ; 6
    jmp    LF176                 ; 3

LF15B:
    bit    ram_C2                ; 3
    bvc    LF176                 ; 2³
    bmi    LF176                 ; 2³
    lda    ram_C3                ; 3
    and    #$01                  ; 2
    tay                          ; 2
    lda.wy INPT4,Y               ; 4
    bpl    LF170                 ; 2³
    jsr    LFB76                 ; 6
    beq    LF176                 ; 2³
LF170:
    lda    ram_C2                ; 3
    and    #$BF                  ; 2
    sta    ram_C2                ; 3
LF176:
    lda    ram_CE                ; 3
    bne    LF18F                 ; 2³
    ldy    #$02                  ; 2
    bit    ram_C3                ; 3
    bmi    LF18F                 ; 2³
    bit    ram_C2                ; 3
    bmi    LF18F                 ; 2³
    bvs    LF18D                 ; 2³
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcc    LF18D                 ; 2³
    ldy    #$01                  ; 2
LF18D:
    sty    ram_CE                ; 3
LF18F:
    jsr    LFFD0                 ; 6   bankswitch, goto LBDB5
    bit    ram_C2                ; 3
    bvs    LF19C                 ; 2³
    lda    frameCounter          ; 3
    and    #$01                  ; 2
    beq    LF19F                 ; 2³
LF19C:
    jmp    LF3AD                 ; 3

LF19F:
    jsr    LFB76                 ; 6
    tay                          ; 2
    lda    LFECA,Y               ; 4
    tay                          ; 2
    sta    ram_D8                ; 3
    bne    LF1AE                 ; 2³
    jmp    LF1B6                 ; 3

LF1AE:
    lda    ram_BF                ; 3
    and    #$F0                  ; 2
    ora    ram_D8                ; 3
    sta    ram_BF                ; 3
LF1B6:
    lda    playerHpos            ; 3
    sta    ram_F3                ; 3
    lda    playerVpos            ; 3
    sta    ram_F4                ; 3
    clc                          ; 2
    lda    playerHpos            ; 3
    adc    LFEDA,Y               ; 4
    bpl    LF1C8                 ; 2³
    lda    #$00                  ; 2
LF1C8:
    cmp    #$75                  ; 2
    bcc    LF1CE                 ; 2³
    lda    #$74                  ; 2
LF1CE:
    sta    playerHpos            ; 3
    clc                          ; 2
    lda    playerVpos            ; 3
    adc    LFEE6,Y               ; 4
    cmp    #$86                  ; 2
    bcc    LF1DC                 ; 2³
    lda    #$86                  ; 2
LF1DC:
    cmp    #$20                  ; 2
    bcs    LF1E2                 ; 2³
    lda    #$20                  ; 2
LF1E2:
    sta    playerVpos            ; 3
    lda    playerVpos            ; 3
    sec                          ; 2
    sbc    #$15                  ; 2
    sta    ram_F1                ; 3
    lda    #$00                  ; 2
    sec                          ; 2
    sbc    ram_82                ; 3
    ldx    #$FF                  ; 2
LF1F2:
    clc                          ; 2
    inx                          ; 2
    adc    #$25                  ; 2
    cmp    ram_F1                ; 3
    bcc    LF1F2                 ; 2³
    beq    LF1F2                 ; 2³
    stx    ram_C0                ; 3
    sbc    ram_F1                ; 3
    eor    #$FF                  ; 2
    adc    #$25                  ; 2
    sta    ram_C1                ; 3
    jsr    LFBEB                 ; 6
    lda    ram_C0                ; 3
    clc                          ; 2
    adc    distanceMarker        ; 3
    tay                          ; 2
    lda    (ram_D9),Y            ; 5
    sta    ram_ED                ; 3
    lda    #$FC                  ; 2
    sta    ram_EE                ; 3
    ldy    #$00                  ; 2
    sty    ram_D7                ; 3
    lda    (ram_ED),Y            ; 5
    sta    ram_EF                ; 3
    iny                          ; 2
    lda    (ram_ED),Y            ; 5
    jsr    LFC03                 ; 6
    sta    ram_F0                ; 3
    ldy    ram_C1                ; 3
    sty    ram_D6                ; 3
    cpy    #$1F                  ; 2
    bcs    LF23E                 ; 2³
    lda    playerHpos            ; 3
    jsr    LFF88                 ; 6
    bcc    LF23E                 ; 2³
    ldy    #$03                  ; 2
    lda    (ram_ED),Y            ; 5
    bpl    LF294                 ; 2³
    inc    ram_D7                ; 5
LF23E:
    ldx    ram_C0                ; 3
    lda    ram_9C,X              ; 4
    bpl    LF286                 ; 2³
    jsr    LFBD1                 ; 6
    sec                          ; 2
    sbc    #$15                  ; 2
    sec                          ; 2
    sbc    ram_C1                ; 3
    bpl    LF251                 ; 2³
    eor    #$FF                  ; 2
LF251:
    cmp    #$07                  ; 2
    bcs    LF286                 ; 2³
    lda    ram_92,X              ; 4
    sec                          ; 2
    sbc    playerHpos            ; 3
    bpl    LF25E                 ; 2³
    eor    #$FF                  ; 2
LF25E:
    cmp    #$06                  ; 2
    bcs    LF286                 ; 2³
    ldy    #$03                  ; 2
    lda    (ram_ED),Y            ; 5
    and    #$40                  ; 2
    bne    LF294                 ; 2³
    lda    (ram_ED),Y            ; 5
    and    #$38                  ; 2
    cmp    #$20                  ; 2
    beq    LF276                 ; 2³
    inc    ram_D7                ; 5
    bne    LF286                 ; 2³
LF276:
    lda    numOfGernades         ; 3
    sed                          ; 2
    clc                          ; 2
    adc    #$04                  ; 2
    cld                          ; 2
    sta    numOfGernades         ; 3
    lda    #$10                  ; 2
    ldy    #$A0                  ; 2
    jsr    LFB8D                 ; 6
LF286:
    ldy    #$02                  ; 2
    jsr    LFFB5                 ; 6   bankswitch, goto LDED0
    bcs    LF294                 ; 2³
    ldy    #$03                  ; 2
    jsr    LFFB5                 ; 6   bankswitch, goto LDED0
    bcc    LF29A                 ; 2³
LF294:
    lda    ram_D7                ; 3
    ora    #$80                  ; 2
    sta    ram_D7                ; 3
LF29A:
    lda    distanceMarker        ; 3
    clc                          ; 2
    adc    ram_C0                ; 3
    cmp    #$0E                  ; 2
    beq    LF2BB                 ; 2³
    cmp    #$0F                  ; 2
    beq    LF2A9                 ; 2³
    bne    LF2C7                 ; 3   always branch

LF2A9:
    lda    ram_C1                ; 3
    cmp    #$1E                  ; 2
    bcc    LF2C1                 ; 2³
    ldy    ram_F4                ; 3
    cpy    playerVpos            ; 3
    bcs    LF2C7                 ; 2³
    cmp    #$1E                  ; 2
    beq    LF2C1                 ; 2³
    bne    LF2C7                 ; 3   always branch

LF2BB:
    lda    ram_C1                ; 3
    cmp    #$1B                  ; 2
    bcc    LF2C7                 ; 2³
LF2C1:
    lda    #$3A                  ; 2
    sta    playerHpos            ; 3
    bne    LF2DE                 ; 3   always branch

LF2C7:
    lda    ram_D7                ; 3
    bpl    LF2CE                 ; 2³
    jsr    LFB2D                 ; 6
LF2CE:
    lda    ram_D7                ; 3
    beq    LF2DE                 ; 2³
    lda    ram_F3                ; 3
    sta    playerHpos            ; 3
    lda    ram_F4                ; 3
    sta    playerVpos            ; 3
    lda    #$00                  ; 2
    sta    ram_D8                ; 3
LF2DE:
    lda    playerVpos            ; 3
    cmp    #$48                  ; 2
    bcc    LF315                 ; 2³+1
    lda    distanceMarker        ; 3
    cmp    #$1B                  ; 2
    bcc    LF304                 ; 2³+1
    lda    enemiesKilled         ; 3
    bpl    LF315                 ; 2³+1
    lda    distanceMarker        ; 3
    cmp    #$1C                  ; 2
    bcs    LF2F8                 ; 2³
    dec    playerVpos            ; 5
    bcc    LF312                 ; 2³+1
LF2F8:
    lda    playerVpos            ; 3
    cmp    #$62                  ; 2
    bcc    LF315                 ; 2³+1
    jsr    LFB32                 ; 6
    jmp    LF312                 ; 3

LF304:
    lda    ram_D8                ; 3
    and    #$01                  ; 2
    beq    LF315                 ; 2³
    lda    #7                    ; 2  reached the base, and the number of enemies to kill gets loaded...
    sta    enemiesKilled         ; 3
    lda    #$48                  ; 2
    sta    playerVpos            ; 3
LF312:
    jsr    LFFC7                 ; 6   bankswitch, goto LDE75
LF315:
    lda    ram_C3                ; 3
    and    #$01                  ; 2
    tay                          ; 2
    lda.wy INPT4,Y               ; 4
    bmi    LF373                 ; 2³
    lda    ram_BF                ; 3
    cmp    #$E0                  ; 2
    bcs    LF379                 ; 2³
    ldx    #$00                  ; 2
    lda    ram_BF                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    ram_BF                ; 3
    adc    #$10                  ; 2
    sta    ram_BF                ; 3
    and    #$F0                  ; 2
    cmp    #$10                  ; 2
    beq    LF34D                 ; 2³
    cmp    #$E0                  ; 2
    bne    LF379                 ; 2³
    lda    numOfGernades         ; 3
    beq    LF379                 ; 2³
    lda    numOfGernades         ; 3
    sed                          ; 2
    sec                          ; 2
    sbc    #$01                  ; 2
    cld                          ; 2
    sta    numOfGernades         ; 3
    ldx    #$01                  ; 2
    ldy    #$01                  ; 2
LF34D:
    lda    ram_B9,X              ; 4
    and    #$F0                  ; 2
    bne    LF379                 ; 2³
    cpx    #$00                  ; 2
    bne    LF35C                 ; 2³
    lda    #SOUND_BULLET         ;
    jsr    SetSoundEvent         ;
LF35C:
    lda    LFCD4,Y               ; 4
    ora    #$10                  ; 2
    sta    ram_B9,X              ; 4
    lda    playerHpos            ; 3
    clc                          ; 2
    adc    #$03                  ; 2
    sta    ram_B1,X              ; 4
    lda    playerVpos            ; 3
    sbc    #$09                  ; 2
    sta    ram_B5,X              ; 4
    jmp    LF379                 ; 3

LF373:
    lda    ram_BF                ; 3
    and    #$0F                  ; 2
    sta    ram_BF                ; 3
LF379:
    lda    ram_BF                ; 3
    jsr    LFBDE                 ; 6
    ldy    #$01                  ; 2
    lda    ram_C2                ; 3
    and    #$F7                  ; 2
    ora    (ram_DB),Y            ; 5
    sta    ram_C2                ; 3
    lda    ram_C2                ; 3
    and    #$07                  ; 2
    sta    ram_D6                ; 3
    dey                          ; 2
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    LF39F                 ; 2³
    lda    ram_D8                ; 3
    beq    LF39D                 ; 2³
    inc    ram_D6                ; 5
    bne    LF39F                 ; 2³
LF39D:
    sty    ram_D6                ; 3
LF39F:
    lda    ram_D6                ; 3
    cmp    (ram_DB),Y            ; 5
    bcs    LF39D                 ; 2³
    lda    ram_C2                ; 3
    and    #$F8                  ; 2
    ora    ram_D6                ; 3
    sta    ram_C2                ; 3
LF3AD:
    lda    #$00                  ; 2
    sec                          ; 2
    sbc    ram_82                ; 3
    ldx    #$FF                  ; 2
LF3B4:
    clc                          ; 2
    inx                          ; 2
    adc    #$25                  ; 2
    cmp    playerVpos            ; 3
    bcc    LF3B4                 ; 2³
    beq    LF3B4                 ; 2³
    stx    ram_C0                ; 3
    sbc    playerVpos            ; 3
    eor    #$FF                  ; 2
    adc    #$25                  ; 2
    sta    ram_C1                ; 3
    sta    ram_D6                ; 3
    beq    LF3D8                 ; 2³
    cmp    #$1F                  ; 2
    bcc    LF3DC                 ; 2³
    inc    ram_C0                ; 5
    lda    ram_D6                ; 3
    sbc    #$25                  ; 2
    sta    ram_D6                ; 3
LF3D8:
    lda    #$01                  ; 2
    sta    ram_C1                ; 3
LF3DC:
    lda    ram_D6                ; 3
    sec                          ; 2
    sbc    #$17                  ; 2
    sta    ram_D6                ; 3
    lda    distanceMarker        ; 3
    clc                          ; 2
    adc    ram_C0                ; 3
    cmp    #$0E                  ; 2
    beq    LF40D                 ; 2³+1
    cmp    #$0F                  ; 2
    beq    LF3FC                 ; 2³
    cmp    #$10                  ; 2
    bne    LF417                 ; 2³+1
    lda    ram_C1                ; 3
    cmp    #$0E                  ; 2
    bcc    LF427                 ; 2³+1
    bcs    LF417                 ; 3+1   always branch

LF3FC:
    lda    ram_C1                ; 3
    cmp    #$0D                  ; 2
    bcs    LF427                 ; 2³
    dec    ram_C0                ; 5
    lda    ram_D6                ; 3
    adc    #$25                  ; 2
    sta    ram_D6                ; 3
    jmp    LF413                 ; 3

LF40D:
    lda    ram_C1                ; 3
    cmp    #$18                  ; 2
    bcc    LF417                 ; 2³
LF413:
    lda    #$18                  ; 2
    sta    ram_C1                ; 3
LF417:
    bit    ram_C3                ; 3
    bmi    LF427                 ; 2³
    bit    ram_C2                ; 3
    bmi    LF427                 ; 2³
    bvc    LF431                 ; 2³
    lda    frameCounter          ; 3
    and    #$10                  ; 2
    bne    LF431                 ; 2³
LF427:
    lda    ram_C2                ; 3
    and    #$F8                  ; 2
    sta    ram_C2                ; 3
    lda    #$00                  ; 2
    beq    LF433                 ; 3   always branch

LF431:
    lda    ram_BF                ; 3
LF433:
    jsr    LFBDE                 ; 6
    lda    ram_C2                ; 3
    and    #$07                  ; 2
    sta    ram_D7                ; 3
    asl                          ; 2
    adc    ram_D7                ; 3
    adc    #$02                  ; 2
    tay                          ; 2
    lda    (ram_DB),Y            ; 5
    sec                          ; 2
    sbc    ram_D6                ; 3
    sta    ram_E9                ; 3
    iny                          ; 2
    lda    (ram_DB),Y            ; 5
    sec                          ; 2
    sbc    ram_D6                ; 3
    sec                          ; 2
    sbc    #$18                  ; 2
    sta    ram_EB                ; 3
    iny                          ; 2
    lda    (ram_DB),Y            ; 5
    jsr    LFC03                 ; 6
    sta    ram_EA                ; 3
    sta    ram_EC                ; 3
    ldx    ram_B0                ; 3
    inx                          ; 2
    inx                          ; 2
    cpx    #$0C                  ; 2
    bcc    LF468                 ; 2³
    ldx    #$00                  ; 2
LF468:
    stx    ram_B0                ; 3
    lda    #$02                  ; 2
    sta    ram_ED                ; 3
LF46E:
    lda    LFCFC,X               ; 4
    tax                          ; 2
    lda    #$00                  ; 2
    cpx    #$03                  ; 2
    adc    #$00                  ; 2
    sta    ram_D7                ; 3
    lda    ram_B9,X              ; 4
    and    #$F0                  ; 2
    bne    LF483                 ; 2³
    jmp    LF598                 ; 3

LF483:
    bit    ram_C2                ; 3
    bvc    LF48A                 ; 2³
    jmp    LF5B8                 ; 3

LF48A:
    cpx    #$03                  ; 2
    bne    LF495                 ; 2³
    lda    ram_B0                ; 3
    beq    LF495                 ; 2³
    jmp    LF5B8                 ; 3

LF495:
    lda    #$00                  ; 2
    sta    ram_D6                ; 3
    lda    ram_B9,X              ; 4
    clc                          ; 2
    adc    #$10                  ; 2
    sta    ram_B9,X              ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    cpx    #$01                  ; 2
    beq    LF4AB                 ; 2³
    ldy    #$01                  ; 2
LF4AB:
    lda    LFD28,Y               ; 4
    clc                          ; 2
    adc    ram_B1,X              ; 4
    sta    ram_B1,X              ; 4
    lda    ram_B9,X              ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFD08,Y               ; 4
    clc                          ; 2
    adc    ram_B1,X              ; 4
    cmp    #$7C                  ; 2
    bcc    LF4C6                 ; 2³
    inc    ram_D6                ; 5
    lda    #$7C                  ; 2
LF4C6:
    sta    ram_B1,X              ; 4
    lda    LFD18,Y               ; 4
    adc    ram_B5,X              ; 4
    cmp    #$8E                  ; 2
    bcc    LF4D5                 ; 2³
    inc    ram_D6                ; 5
    lda    #$8E                  ; 2
LF4D5:
    sta    ram_B5,X              ; 4
    lda    #$00                  ; 2
    sec                          ; 2
    sbc    ram_82                ; 3
    ldy    #$FF                  ; 2
LF4DE:
    clc                          ; 2
    iny                          ; 2
    adc    #$25                  ; 2
    cmp    ram_B5,X              ; 4
    bcc    LF4DE                 ; 2³
    beq    LF4DE                 ; 2³
    pha                          ; 3
    sbc    ram_B5,X              ; 4
    sta    ram_D8                ; 3
    pla                          ; 4
    sec                          ; 2
    sbc    #$25                  ; 2
    sta    ram_F1                ; 3
    tya                          ; 2
    clc                          ; 2
    adc    distanceMarker        ; 3
    cmp    #$0E                  ; 2
    bne    LF505                 ; 2³+1
    pha                          ; 3
    lda    ram_D8                ; 3
    cmp    #$18                  ; 2
    pla                          ; 4
    bcc    LF509                 ; 2³
    bcs    LF50C                 ; 3   always branch

LF505:
    cmp    #$0F                  ; 2
    bne    LF50C                 ; 2³
LF509:
    jmp    LF598                 ; 3

LF50C:
    cpy    #$05                  ; 2
    bcc    LF513                 ; 2³
    jmp    LF594                 ; 3

LF513:
    cpx    #$02                  ; 2
    beq    LF584                 ; 2³
    cpx    #$03                  ; 2
    beq    LF584                 ; 2³
    stx    ram_D8                ; 3
    cpx    #$00                  ; 2
    beq    LF549                 ; 2³
    lda    ram_BA                ; 3
    and    #$F0                  ; 2
    bne    LF594                 ; 2³
    lda    #SOUND_80_2           ; 2
    jsr    SetSoundEvent         ; 6
    lda.wy ram_9C,Y              ; 4
    bpl    LF594                 ; 2³
    lda    ram_B2                ; 3
    sec                          ; 2
    sbc.wy ram_92,Y              ; 4
    cmp    #$EC                  ; 2
    bcs    LF53F                 ; 2³
    cmp    #$18                  ; 2
    bcs    LF594                 ; 2³
LF53F:
    lda    #$03                  ; 2
    jsr    UpdateScore           ; 6
    tya                          ; 2
    tax                          ; 2
    jmp    LF57A                 ; 3

LF549:
    tya                          ; 2
    tax                          ; 2
    lda    ram_9C,X              ; 4
    bpl    LF57F                 ; 2³
    jsr    LFBEB                 ; 6
    txa                          ; 2
    clc                          ; 2
    adc    distanceMarker        ; 3
    tay                          ; 2
    lda    (ram_D9),Y            ; 5
    sta    ram_D9                ; 3
    lda    #$FC                  ; 2
    sta    ram_DA                ; 3
    ldy    #$03                  ; 2
    lda    (ram_D9),Y            ; 5
    and    #$40                  ; 2
    beq    LF57F                 ; 2³
    lda    (ram_D9),Y            ; 5
    and    #$38                  ; 2
    cmp    #$28                  ; 2
    beq    LF57F                 ; 2³
    jsr    LFBD1                 ; 6
    clc                          ; 2
    adc    ram_F1                ; 3
    jsr    LFFBE                 ; 6   bankswitch, goto LDEFF
    bcc    LF57F                 ; 2³
LF57A:
    jsr    LFB87                 ; 6
    inc    ram_D6                ; 5
LF57F:
    ldx    ram_D8                ; 3
    jmp    LF594                 ; 3

LF584:
    cmp    #$10                  ; 2
    beq    LF594                 ; 2³
    txa                          ; 2
    tay                          ; 2
    jsr    LFFB5                 ; 6   bankswitch, goto LDED0
    bcc    LF594                 ; 2³
    jsr    LFB2D                 ; 6
    inc    ram_D6                ; 5
LF594:
    lda    ram_D6                ; 3
    beq    LF5B8                 ; 2³
LF598:
    lda    #$00                  ; 2
    sta    ram_B9,X              ; 4
    sta    ram_B1,X              ; 4
    lda    #$8F                  ; 2
    sta    ram_B5,X              ; 4
    cpx    #$03                  ; 2
    beq    LF5B8                 ; 2³
    ldx    #$02                  ; 2
    lda    ram_B9,X              ; 4
    and    #$F0                  ; 2
    bne    LF5B8                 ; 2³
    ldx    #$00                  ; 2
    lda    ram_B9,X              ; 4
    and    #$F0                  ; 2
    bne    LF5B8                 ; 2³
    ldx    #$01                  ; 2
LF5B8:
    cpx    #$03                  ; 2
    beq    LF5C5                 ; 2³
    lda    ram_C2                ; 3
    and    #$CF                  ; 2
    ora    LFCF8,X               ; 4
    sta    ram_C2                ; 3
LF5C5:
    lda    ram_B1,X              ; 4
    ldy    ram_D7                ; 3
    sta.wy ram_EF,Y              ; 5
    lda    ram_B5,X              ; 4
    cmp    #$41                  ; 2
    bcc    LF5DE                 ; 2³
    lda    #$8F                  ; 2
    sbc    ram_B5,X              ; 4
    sta    ram_D8                ; 3
    lda    #$24                  ; 2
    ldy    #$D5                  ; 2
    bne    LF5E9                 ; 3   always branch

LF5DE:
    lda    #$40                  ; 2
    sec                          ; 2
    sbc    ram_B5,X              ; 4
    sta    ram_D8                ; 3
    lda    #$24                  ; 2
    ldy    #$D6                  ; 2
LF5E9:
    clc                          ; 2
    adc    ram_D8                ; 3
    sec                          ; 2
    sbc    ram_82                ; 3
    ldx    ram_80                ; 3
    dex                          ; 2
    clc                          ; 2
LF5F3:
    adc    #$25                  ; 2
    dex                          ; 2
    bpl    LF5F3                 ; 2³
    pha                          ; 3
    lda    ram_D7                ; 3
    asl                          ; 2
    tax                          ; 2
    pla                          ; 4
    sta    ram_E5,X              ; 4
    sty    ram_E6,X              ; 4
    dec    ram_ED                ; 5
    beq    LF60C                 ; 2³
    ldx    ram_B0                ; 3
    inx                          ; 2
    jmp    LF46E                 ; 3

LF60C:
    ldy    INTIM                 ; 4
    bmi    LF613                 ; 2³
    bne    LF60C                 ; 2³
LF613:
    lda    #$82                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda.w  ram_EF                ; 4
    clc                          ; 2
    adc    #$04                  ; 2
    sec                          ; 2
LF620:
    sbc    #$0F                  ; 2
    bcs    LF620                 ; 2³
    adc    #$0F                  ; 2
    tay                          ; 2
    lda    LFE4F,Y               ; 4
    sta    RESM0                 ; 3
    sta    HMM0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    nop                          ; 2
    lda    ram_F0                ; 3
    clc                          ; 2
    adc    #$04                  ; 2
    sec                          ; 2
LF638:
    sbc    #$0F                  ; 2
    bcs    LF638                 ; 2³
    adc    #$0F                  ; 2
    tay                          ; 2
    lda    LFE4F,Y               ; 4
    sta    RESM1                 ; 3
    sta    HMM1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    #TIME_VBLANK          ; 2
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    TIM64T                ; 4
    sta    VSYNC                 ; 3
    sta    HMCLR                 ; 3
    jsr    LFBEB                 ; 6
    ldx    #$00                  ; 2
    txa                          ; 2
    sec                          ; 2
    sbc    ram_82                ; 3
    sta    ram_F1                ; 3
LF662:
    txa                          ; 2
    clc                          ; 2
    adc    distanceMarker        ; 3
    tay                          ; 2
    lda    (ram_D9),Y            ; 5
    sta    ram_ED                ; 3
    lda    #$FC                  ; 2
    sta    ram_EE                ; 3
    ldy    #$00                  ; 2
    lda    (ram_ED),Y            ; 5
    sta    ram_87,X              ; 4
    sta    ram_EF                ; 3
    iny                          ; 2
    lda    (ram_ED),Y            ; 5
    jsr    LFC03                 ; 6
    sta    ram_8C,X              ; 4
    sta    ram_F0                ; 3
    lda    ram_92,X              ; 4
    bpl    LF6F2                 ; 2³
LF685:
    ldy    #$03                  ; 2
    lda    (ram_ED),Y            ; 5
    pha                          ; 3
    and    #$38                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_D8                ; 3
    pla                          ; 4
    and    #$07                  ; 2
    ora    #$90                  ; 2
    sta    ram_9C,X              ; 4
    dey                          ; 2
    lda    (ram_ED),Y            ; 5
    and    #$E0                  ; 2
    sta    ram_97,X              ; 4
    lda    ram_92,X              ; 4
    bmi    LF6D1                 ; 2³
    lda    ram_D8                ; 3
    cmp    #$05                  ; 2
    beq    LF6D1                 ; 2³
    lda    ram_F1                ; 3
    bmi    LF6BD                 ; 2³
    cmp    playerVpos            ; 3
    bcs    LF6BD                 ; 2³
    adc    #$2F                  ; 2
    cmp    playerVpos            ; 3
    bcc    LF6BD                 ; 2³
    lda    playerHpos            ; 3
    cmp    #$3A                  ; 2
    bne    LF6C2                 ; 2³
LF6BD:
    lda    frameCounter          ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
LF6C2:
    lda    #$00                  ; 2
    ldy    #$09                  ; 2
    bcs    LF6CC                 ; 2³
    lda    #$74                  ; 2
    ldy    #$05                  ; 2
LF6CC:
    sta    ram_92,X              ; 4
    jmp    LF6EC                 ; 3

LF6D1:
    lda    (ram_ED),Y            ; 5
    and    #$1F                  ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$01                  ; 2
    sta    ram_92,X              ; 4
    ldy    ram_D8                ; 3
    lda    LFDFA,Y               ; 4
    bpl    LF6EB                 ; 2³
    jsr    LFE65                 ; 6
    and    #$1F                  ; 2
    tay                          ; 2
    lda    SoldierMovementTab,Y  ; 4
LF6EB:
    tay                          ; 2
LF6EC:
    jsr    LFBBB                 ; 6
    jmp    LF720                 ; 3

LF6F2:
    ldy    #$00                  ; 2
    lda    ram_9C,X              ; 4
    bpl    LF720                 ; 2³+1
    ldy    #$03                  ; 2
    lda    (ram_ED),Y            ; 5
    and    #$38                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LFDFA,Y               ; 4
    tay                          ; 2
    bpl    LF720                 ; 2³
    ldy    #$00                  ; 2
    lda    ram_9C,X              ; 4
    and    #$40                  ; 2
    beq    LF711                 ; 2³
    iny                          ; 2
LF711:
    lda    ram_97,X              ; 4
    and    #$18                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    cpy    #$01                  ; 2
    adc    #$00                  ; 2
    tay                          ; 2
    lda    SoldierMovementTab,Y  ; 4
    tay                          ; 2
LF720:
    jsr    LFBE1                 ; 6
    bit    ram_C2                ; 3
    bvs    LF74F                 ; 2³
    cpx    ram_91                ; 3
    bne    LF74F                 ; 2³
    lda    ram_9C,X              ; 4
    bmi    LF754                 ; 2³
    ldy    #$03                  ; 2
    lda    (ram_ED),Y            ; 5
    and    #$38                  ; 2
    cmp    #$30                  ; 2
    beq    LF73D                 ; 2³
    cmp    #$28                  ; 2
    bne    LF74F                 ; 2³
LF73D:
    jsr    LFE65                 ; 6
    and    #$1F                  ; 2
    cmp    #$05                  ; 2
    bcs    LF74F                 ; 2³
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    LF74F                 ; 2³
    jmp    LF685                 ; 3

LF74F:
    lda    ram_97,X              ; 4
    jmp    LF8CB                 ; 3

LF754:
    sty    ram_F2                ; 3
    lda    ram_82,X              ; 4
    cmp    #$1F                  ; 2
    bcc    LF762                 ; 2³
    jsr    LFB94                 ; 6
    jmp    LF74F                 ; 3

LF762:
    ldy    #$03                  ; 2
    lda    (ram_ED),Y            ; 5
    and    #$38                  ; 2
    cmp    #$08                  ; 2
    beq    LF783                 ; 2³
    cmp    #$30                  ; 2
    beq    LF783                 ; 2³
    cmp    #$28                  ; 2
    beq    LF77E                 ; 2³
    cmp    #$18                  ; 2
    bne    LF77B                 ; 2³
    jmp    LF81B                 ; 3

LF77B:
    jmp    LF8A2                 ; 3

LF77E:
    lda    #SOUND_20             ; 2
    jsr    SetSoundEvent         ; 6
LF783:
    ldy    ram_F2                ; 3
    lda    ram_92,X              ; 4
    clc                          ; 2
    adc    LFEF2,Y               ; 4
    sta    ram_D8                ; 3
    lda    LFEF2,Y               ; 4
    beq    LF79E                 ; 2³
    lda    ram_D8                ; 3
    beq    LF7D6                 ; 2³
    bmi    LF7D6                 ; 2³
    cmp    #$75                  ; 2
    bcs    LF7D6                 ; 2³
    bcc    LF7A0                 ; 3   always branch

LF79E:
    lda    ram_92,X              ; 4
LF7A0:
    sta    ram_D8                ; 3
    lda    ram_97,X              ; 4
    and    #$E0                  ; 2
    clc                          ; 2
    adc    LFF00,Y               ; 4
    sta    ram_D7                ; 3
    lda    LFF00,Y               ; 4
    beq    LF7C1                 ; 2³
    bpl    LF7BB                 ; 2³
    lda    ram_D7                ; 3
    cmp    #$E0                  ; 2
    beq    LF7D6                 ; 2³
    bne    LF7C5                 ; 3   always branch

LF7BB:
    lda    ram_D7                ; 3
    beq    LF7D6                 ; 2³
    bne    LF7C5                 ; 3   always branch

LF7C1:
    lda    ram_97,X              ; 4
    and    #$E0                  ; 2
LF7C5:
    sta    ram_D7                ; 3
    jsr    LFBD3                 ; 6
    sec                          ; 2
    sbc    #$15                  ; 2
    sta    ram_D6                ; 3
    lda    ram_D8                ; 3
    jsr    LFF88                 ; 6
    bcc    LF7EE                 ; 2³
LF7D6:
    ldy    #$03                  ; 2
    lda    (ram_ED),Y            ; 5
    and    #$38                  ; 2
    cmp    #$28                  ; 2
    bne    LF7E6                 ; 2³
    jsr    LFB94                 ; 6
    jmp    LF81B                 ; 3

LF7E6:
    ldy    ram_F2                ; 3
    lda    LFC10,Y               ; 4
    jmp    LF815                 ; 3

LF7EE:
    lda    ram_D8                ; 3
    sta    ram_92,X              ; 4
    lda    ram_97,X              ; 4
    and    #$1F                  ; 2
    ora    ram_D7                ; 3
    sta    ram_97,X              ; 4
    ldy    #$03                  ; 2
    lda    (ram_ED),Y            ; 5
    and    #$38                  ; 2
    cmp    #$28                  ; 2
    beq    LF81B                 ; 2³
    lda    frameCounter          ; 3
    and    #$1F                  ; 2
    cmp    #$19                  ; 2
    bcc    LF81B                 ; 2³
    jsr    LFE65                 ; 6
    and    #$1F                  ; 2
    tay                          ; 2
    lda    SoldierMovementTab,Y  ; 4
LF815:
    tay                          ; 2
    sty    ram_F2                ; 3
    jsr    LFBBB                 ; 6
LF81B:
    jsr    LFBD1                 ; 6
    clc                          ; 2
    adc    ram_F1                ; 3
    sta    ram_D6                ; 3
    ldy    #$03                  ; 2
    lda    (ram_ED),Y            ; 5
    and    #$38                  ; 2
    cmp    #$28                  ; 2
    beq    LF849                 ; 2³
    lda    ram_D6                ; 3
    cmp    #$98                  ; 2
    bcs    LF849                 ; 2³
    cmp    #$0C                  ; 2
    bcc    LF849                 ; 2³
    ldy    #$02                  ; 2
    lda.wy ram_B9,Y              ; 4
    and    #$F0                  ; 2
    beq    LF84C                 ; 2³
    ldy    #$03                  ; 2
    lda.wy ram_B9,Y              ; 4
    and    #$F0                  ; 2
    beq    LF84C                 ; 2³
LF849:
    jmp    LF886                 ; 3

LF84C:
    jsr    LFE65                 ; 6
    and    #$0F                  ; 2
    cmp    #$0A                  ; 2
    bcs    LF886                 ; 2³
    tya                          ; 2
    pha                          ; 3
    jsr    LFFD9                 ; 6   bankswitch, goto L9DB5
    ldy    ram_D7                ; 3
    lda    LFCE4,Y               ; 4
    sta    ram_D7                ; 3
    pla                          ; 4
    tay                          ; 2
    lda    ram_D7                ; 3
    cpy    #$03                  ; 2
    bne    LF871                 ; 2³
    cmp    #$08                  ; 2
    beq    LF871                 ; 2³
    cmp    #$00                  ; 2
    bne    LF886                 ; 2³
LF871:
    ora    #$10                  ; 2
    sta.wy ram_B9,Y              ; 5
    lda    ram_92,X              ; 4
    clc                          ; 2
    adc    #$03                  ; 2
    sta.wy ram_B1,Y              ; 5
    lda    ram_D6                ; 3
    sec                          ; 2
    sbc    #$0B                  ; 2
    sta.wy ram_B5,Y              ; 5
LF886:
    lda    ram_D6                ; 3
    cmp    #$A6                  ; 2
    bcs    LF8A2                 ; 2³
    jsr    LFFBE                 ; 6   bankswitch, goto LDEFF
    bcc    LF8A2                 ; 2³
    ldy    #$03                  ; 2
    lda    (ram_ED),Y            ; 5
    and    #$38                  ; 2
    cmp    #$28                  ; 2
    beq    LF8A2                 ; 2³
    lda    #$00                  ; 2
    sta    ram_B9                ; 3
    jsr    LFB87                 ; 6
LF8A2:
    ldy    #$03                  ; 2
    lda    (ram_ED),Y            ; 5
    and    #$38                  ; 2
    ldy    #$01                  ; 2
    cmp    #$18                  ; 2
    beq    LF8C0                 ; 2³
    cmp    #$38                  ; 2
    bne    LF8C7                 ; 2³
    txa                          ; 2
    clc                          ; 2
    adc    distanceMarker        ; 3
    cmp    #$0F                  ; 2
    lda    #$01                  ; 2
    bcs    LF8CB                 ; 2³
    lda    #$00                  ; 2
    beq    LF8CB                 ; 3   always branch

LF8C0:
    lda    frameCounter          ; 3
    and    #$04                  ; 2
    beq    LF8C7                 ; 2³
    dey                          ; 2
LF8C7:
    tya                          ; 2
    clc                          ; 2
    adc    ram_97,X              ; 4
LF8CB:
    and    #$07                  ; 2
    ldy    #$00                  ; 2
    cmp    (ram_DB),Y            ; 5
    bcc    LF8D4                 ; 2³
    tya                          ; 2
LF8D4:
    sta    ram_D6                ; 3
    lda    ram_97,X              ; 4
    and    #$F8                  ; 2
    ora    ram_D6                ; 3
    sta    ram_97,X              ; 4
    ldy    #$01                  ; 2
    lda    ram_9C,X              ; 4
    and    #$F7                  ; 2
    ora    (ram_DB),Y            ; 5
    sta    ram_9C,X              ; 4
    lda    ram_97,X              ; 4
    and    #$07                  ; 2
    sta    ram_D7                ; 3
    asl                          ; 2
    adc    ram_D7                ; 3
    adc    #$02                  ; 2
    tay                          ; 2
    jsr    LFBD1                 ; 6
    sec                          ; 2
    sbc    #$17                  ; 2
    sta    ram_D7                ; 3
    lda    (ram_DB),Y            ; 5
    sec                          ; 2
    sbc    ram_D7                ; 3
    sta    ram_A1,X              ; 4
    iny                          ; 2
    lda    (ram_DB),Y            ; 5
    sec                          ; 2
    sbc    ram_D7                ; 3
    sta    ram_A6,X              ; 4
    iny                          ; 2
    lda    (ram_DB),Y            ; 5
    jsr    LFC03                 ; 6
    sta    ram_AB,X              ; 4
    lda    ram_F1                ; 3
    clc                          ; 2
    adc    #$25                  ; 2
    sta    ram_F1                ; 3
    inx                          ; 2
    cpx    #$05                  ; 2
    bcs    LF922                 ; 2³
    jmp    LF662                 ; 3

LF922:
    ldx    ram_91                ; 3
    dex                          ; 2
    bpl    LF929                 ; 2³
    ldx    #$04                  ; 2
LF929:
    stx    ram_91                ; 3
    ldy    #$00                  ; 2
    bit    ram_C3                ; 3
    bvc    LF95A                 ; 2³
    lda    scoreBig              ; 3
    cmp    #$9A                  ; 2
    bcc    LF952                 ; 2³

    lda    ram_D2                ; 3
    and    #$03                  ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_D6                ; 3
    asl                          ; 2
    adc    ram_D6                ; 3
    adc    #$0B                  ; 2
    tay                          ; 2
    ldx    #$0B                  ; 2
LF947:
    lda    LFF0E,Y               ; 4
    sta    ram_ED,X              ; 4
    dey                          ; 2
    dex                          ; 2
    bpl    LF947                 ; 2³
    bmi    LF999                 ; 3   always branch

LF952:
    iny                          ; 2
    lda    ram_C3                ; 3
    and    #$02                  ; 2
    beq    LF95A                 ; 2³
    iny                          ; 2
LF95A:
    tya                          ; 2
    ldx    #$02                  ; 2
LF95D:
    sta    ram_D6                ; 3
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    #$9E                  ; 2
    sta.wy ram_EE,Y              ; 5
    sta.wy ram_F0,Y              ; 5
    lda    ram_D6                ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    #$15                  ; 2
    sta.wy ram_ED,Y              ; 5
    lda    ram_D6                ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    #$15                  ; 2
    sta.wy ram_EF,Y              ; 5
    lda    livesLevelNum,X       ; 4
    dex                          ; 2
    bpl    LF95D                 ; 2³
    inx                          ; 2
    ldy    #$8D                  ; 2
LF98B:
    lda    ram_ED,X              ; 4
    cmp    #$15                  ; 2
    bne    LF999                 ; 2³
    sty    ram_ED,X              ; 4
    inx                          ; 2
    inx                          ; 2
    cpx    #$0A                  ; 2
    bcc    LF98B                 ; 2³
LF999:
    ldx    ram_80                ; 3
    stx    ram_D9                ; 3
    lda    ram_82,X              ; 4
    sta    ram_DA                ; 3
    lda    ram_81                ; 3
    beq    LF9A9                 ; 2³
    cmp    #$1F                  ; 2
    bcc    LF9AB                 ; 2³
LF9A9:
    ldx    #$04                  ; 2
LF9AB:
    lda    ram_87,X              ; 4
    sta    ram_E1                ; 3
    clc                          ; 2
    adc    #$20                  ; 2
    sta    ram_E3                ; 3
    lda    ram_8C,X              ; 4
    sta    ram_E2                ; 3
    sta    ram_E4                ; 3
    lda    ram_A1,X              ; 4
    sta    ram_DD                ; 3
    lda    ram_A6,X              ; 4
    sta    ram_DF                ; 3
    lda    ram_AB,X              ; 4
    sta    ram_DE                ; 3
    sta    ram_E0                ; 3
    lda    ram_D2                ; 3
    asl                          ; 2
    lda    #$01                  ; 2
    adc    #$00                  ; 2
LF9CF:
    ldx    INTIM                 ; 4
    bmi    LF9D6                 ; 2³
    bne    LF9CF                 ; 2³
LF9D6:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    VBLANK                ; 3
    lda    #$06                  ; 2
    sta    COLUBK                ; 3
    sta    COLUPF                ; 3
    ldx    #$00                  ; 2
    stx    REFP0                 ; 3
    stx    REFP1                 ; 3
    inx                          ; 2
    stx    VDELP0                ; 3
    stx    VDELP1                ; 3
    ldy    #$F3                  ; 2
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    lda    ram_C3                ; 3
    and    #$01                  ; 2
    ldx    scoreBig              ; 3
    cpx    #$9A                  ; 2
    rol                          ; 2
    tax                          ; 2
    lda    LFD80,X               ; 4
    sta.w  COLUP0                ; 4
    sta    COLUP1                ; 3
    lda    #$B0                  ; 2
    sta    HMBL                  ; 3
    lda    #$00                  ; 2
    sta    RESBL                 ; 3
    sta    COLUPF                ; 3
    sta    HMOVE                 ; 3
    jsr    LFFE2                 ; 6   bankswitch, goto L948A
    sta    VDELP1                ; 3
    inc    frameCounter          ; 5
    bne    LFA27                 ; 2³
    lda    ram_D2                ; 3
    and    #$7F                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
    bpl    LFA25                 ; 2³
    lda    #$FF                  ; 2
LFA25:
    sta    ram_D2                ; 3
LFA27:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    nop                          ; 2
    clc                          ; 2
    lda    playerHpos            ; 3
    adc    #$03                  ; 2
    sec                          ; 2
LFA32:
    sbc    #$0F                  ; 2
    bcs    LFA32                 ; 2³
    adc    #$0F                  ; 2
    tay                          ; 2
    sta    HMCLR                 ; 3
    sta    RESP0                 ; 3
    lda    LFE4F,Y               ; 4
    sta    HMP0                  ; 3
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    jsr    LFF5F                 ; 6
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    #$F0                  ; 2
    sta.w  HMP0                  ; 4
    lda    #$00                  ; 2
    sta    HMP1                  ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    sta    VDELP0                ; 3
    sta    NUSIZ0                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$06                  ; 2
    sta    NUSIZ1                ; 3
    lda    #$00                  ; 2
    sta    COLUPF                ; 3
    lda    #$06                  ; 2
    sta    COLUBK                ; 3
    lda    #$02                  ; 2
    sta    ENABL                 ; 3
    ldy    #$0B                  ; 2
    sta    HMCLR                 ; 3
    lda    LevelGfx,Y            ; 4
    sta    ram_D7                ; 3
    lda    #$FE                  ; 2
    sta    ram_EE                ; 3
    sta    ram_F0                ; 3
    sta    ram_F2                ; 3
    sta    ram_F4                ; 3

LFA86:
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    lda    ColLevelGfx,Y         ; 4
    sta    ram_D8                ; 3
    ldx    ColLivesGfx,Y         ; 4
    lda    GernadeGfx,Y          ; 4
    sta    GRP1                  ; 3
    lda    ColGernadeGfx,Y       ; 4
    sta    COLUP1                ; 3
    lda    LivesGfx,Y            ; 4
    sta.w  GRP1                  ; 4
    stx    COLUP1                ; 3
    lda    ram_D7                ; 3
    nop                          ; 2
    sta    GRP1                  ; 3
    lda    ram_D8                ; 3
    sta    COLUP1                ; 3
    lda    LevelGfx-1,Y          ; 4
    sta    ram_D7                ; 3
    dey                          ; 2
    bpl    LFA86                 ; 2³

    iny                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    lda    numOfGernades         ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    adc    #$72                  ; 2
    sta    ram_ED                ; 3
    lda    numOfGernades         ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$72                  ; 2
    sta    ram_EF                ; 3
    lda    livesLevelNum         ; 3
    and    #$07                  ; 2
    adc    #$01                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$72                  ; 2
    sta    ram_F3                ; 3
    lda    livesLevelNum         ; 3
    and    #$F0                  ; 2
    bmi    LFAE2                 ; 2³
    bpl    LFAE4                 ; 3   always branch

LFAE2:
    lda    #$00                  ; 2
LFAE4:
    lsr                          ; 2
    adc    #$72                  ; 2
    sta    ram_F1                ; 3
    lda    ram_C3                ; 3
    and    #$01                  ; 2
    asl                          ; 2
    tay                          ; 2
    lda    LFD80,Y               ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldy    #$07                  ; 2
LFAF8:
    lda    (ram_ED),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_EF),Y            ; 5
    sta    GRP1                  ; 3
    lda    ram_D6                ; 3
    lda    ram_D6                ; 3
    lda    ram_D6                ; 3
    lda    (ram_F1),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_F3),Y            ; 5
    nop                          ; 2
    sta    GRP1                  ; 3
    dey                          ; 2
    bmi    LFB16                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    bpl    LFAF8                 ; 3+1   always branch

LFB16:
    iny                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #TIME_OVERSCAN        ; 2
    ldx    #$82                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    TIM64T                ; 4
    stx    VBLANK                ; 3
    jmp    LF020                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFB2D SUBROUTINE ;x2
    lda    #$03                  ; 2
    jmp    LFB3A                 ; 3

LFB32 SUBROUTINE ;x1
    lda    ram_C3                ; 3
    ora    #$10                  ; 2
    sta    ram_C3                ; 3
    lda    #$04                  ; 2
LFB3A:
    sta    ram_CE                ; 3
    lda    ram_C2                ; 3
    ora    #$80                  ; 2
    sta    ram_C2                ; 3
    lda    #$00                  ; 2
    sta    frameCounter          ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFB47 SUBROUTINE ;x2
    sta    livesLevelNum         ; 3
    lda    #3                    ; 2
    sta    numOfGernades         ; 3
    lda    scoreBig              ; 3
    cmp    #$99+1                ; 2
    lda    #0                    ; 2
    bcs    LFB59                 ; 2³
    sta    scoreBig              ; 3
    sta    scoreSmall            ; 3
LFB59:
    sta    distanceMarker        ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFB5C SUBROUTINE ;x4
    lda    ram_C3                ; 3
    and    #$02                  ; 2
    beq    LFB75                 ; 2³
    lda    ram_C3                ; 3
    eor    #$01                  ; 2
    sta    ram_C3                ; 3
    ldx    #$04                  ; 2
LFB6A:
    lda    playerStats,X         ; 4
    ldy    otherPlayerStats,X    ; 4
    sta    otherPlayerStats,X    ; 4
    sty    playerStats,X         ; 4
    dex                          ; 2
    bpl    LFB6A                 ; 2³
LFB75:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFB76 SUBROUTINE ;x2
    lda    ram_C3                ; 3
    lsr                          ; 2
    lda    SWCHA                 ; 4
    bcs    LFB82                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
LFB82:
    and    #$0F                  ; 2
    eor    #$0F                  ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFB87 SUBROUTINE ;x2
    dec    enemiesKilled         ; 5
    lda    #$02                  ; 2
    ldy    #SOUND_ENEMY_DEAD     ; 2
LFB8D SUBROUTINE ;x1
    jsr    UpdateScore           ; 6
    tya                          ; 2
    jsr    SetSoundEvent         ; 6
LFB94 SUBROUTINE ;x2
    lda    ram_9C,X              ; 4
    and    #$7F                  ; 2
    sta    ram_9C,X              ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ONE_LIFE = 1 << 4
LIVES_LIMIT = ONE_LIFE * 7

UpdateScore SUBROUTINE ;x2
    sed                          ;
    clc                          ;
    adc    scoreSmall            ;
    sta    scoreSmall            ;
    bcc    .scoreFinished        ;
    lda    livesLevelNum         ;
    cmp    #LIVES_LIMIT          ;
    bcs    .addOneThousandPoints ;
    adc    #ONE_LIFE             ;
    sta    livesLevelNum         ;
    lda    #SOUND_NEW_LIFE       ;
    jsr    SetSoundEvent         ;
.addOneThousandPoints:
    clc                          ;
    lda    scoreBig              ;
    adc    #1                    ;
    sta    scoreBig              ;
.scoreFinished:
    cld                          ;
    rts                          ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBBB SUBROUTINE ;x2
    tya                          ; 2
    beq    LFBD0                 ; 2³
    lda    ram_9C,X              ; 4
    and    #$BF                  ; 2
    ora    LFE13,Y               ; 4
    sta    ram_9C,X              ; 4
    lda    ram_97,X              ; 4
    and    #$E7                  ; 2
    ora    LFE03,Y               ; 4
    sta    ram_97,X              ; 4
LFBD0:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBD1 SUBROUTINE ;x4
    lda    ram_97,X              ; 4
LFBD3 SUBROUTINE ;x1
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$20                  ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBDE SUBROUTINE ;x2
    and    #$0F                  ; 2
    tay                          ; 2
LFBE1 SUBROUTINE ;x1
    lda    LFD84,Y               ; 4
    sta    ram_DB                ; 3
    lda    #$FD                  ; 2
    sta    ram_DC                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBEB SUBROUTINE ;x3
    lda    livesLevelNum         ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    LFE43,Y               ; 4  0,1,2,1
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2 $00,$20,$40,$20
    adc    #<LFC74               ; 2 $74,$94,$B4,$94
    sta    ram_D9                ; 3
    lda    #$00                  ; 2
    adc    #>LFC74               ; 2  LFC74, LFC94, LFCB4, LFC94
    sta    ram_DA                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFC03 SUBROUTINE ;x4
    pha                          ; 3
    lda    livesLevelNum         ; 3
    and    #$03                  ; 2
    tay                          ; 2
    pla                          ; 4
    and    #$0F                  ; 2
    ora    HighAddressTab,Y      ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFC10:
    .byte $00 ; |        | $FC10
    .byte $02 ; |      X | $FC11
    .byte $01 ; |       X| $FC12
    .byte $00 ; |        | $FC13
    .byte $08 ; |    X   | $FC14
    .byte $0A ; |    X X | $FC15
    .byte $09 ; |    X  X| $FC16
    .byte $00 ; |        | $FC17
    .byte $04 ; |     X  | $FC18
    .byte $06 ; |     XX | $FC19
    .byte $05 ; |     X X| $FC1A
    .byte $00 ; |        | $FC1B

LFC1C:
    .word LDC00          ; $FC1C
    .byte $FF ; |XXXXXXXX| $FC1E
    .byte $BF ; |X XXXXXX| $FC1F
LFC20:
    .word LDC40          ; $FC20
    .byte $FF ; |XXXXXXXX| $FC22
    .byte $BF ; |X XXXXXX| $FC23
LFC24:
    .word LDCC0          ; $FC24
    .byte $00 ; |        | $FC26
    .byte $80 ; |X       | $FC27
LFC28:
    .word LDD00          ; $FC28
    .byte $00 ; |        | $FC2A
    .byte $80 ; |X       | $FC2B
LFC2C:
    .word LDC80          ; $FC2C
    .byte $74 ; | XXX X  | $FC2E
    .byte $70 ; | XXX    | $FC2F
LFC30:
    .word LDC80          ; $FC30
    .byte $FC ; |XXXXXX  | $FC32
    .byte $6D ; | XX XX X| $FC33
LFC34:
    .word LDC80          ; $FC34
    .byte $79 ; | XXXX  X| $FC36
    .byte $20 ; |  X     | $FC37
TwoBarrPF1:
    .word LDB00          ; $FC38
    .byte $71 ; | XXX   X| $FC3A
    .byte $C8 ; |XX  X   | $FC3B
LFC3C:
    .word LDB00          ; $FC3C
    .byte $6A ; | XX X X | $FC3E
    .byte $A0 ; |X X     | $FC3F
LFC40:
    .word LDB40          ; $FC40
    .byte $E2 ; |XXX   X | $FC42
    .byte $90 ; |X  X    | $FC43
LFC44:
    .word LDB80          ; $FC44
    .byte $4F ; | X  XXXX| $FC46
    .byte $D8 ; |XX XX   | $FC47
LFC48:
    .word LDBC0          ; $FC48
    .byte $47 ; | X   XXX| $FC4A
    .byte $D8 ; |XX XX   | $FC4B
LFC4C:
    .word LDBC0          ; $FC4C
    .byte $55 ; | X X X X| $FC4E
    .byte $D8 ; |XX XX   | $FC4F
LFC50:
    .word LDC80          ; $FC50
    .byte $EE ; |XXX XXX | $FC52  AND with #$1F, <<2, add 1 for position (of trees first level)
    .byte $14 ; |   X X  | $FC53  bits 5-3 select objects | Nusiz

;AND #$38, >> 3, TAY, LDA $FDFA,Y
;0 = blank, stops you though, seems to be used inside of fortress, maybe as a trigger/collision area to start detonation
;1 = enemy soldier
;2 = palm tree
;3 = machine gunner
;4 = gernades
;5 = truck
;6 = enemy solder... again?
;7 = bridge... or fortress?

LFC54:
    .word LDB40          ; $FC54
    .byte $8F ; |X   XXXX| $FC56
    .byte $58 ; | X XX   | $FC57
LFC58:
    .word LDB80          ; $FC58
    .byte $95 ; |X  X X X| $FC5A
    .byte $58 ; | X XX   | $FC5B
LFC5C:
    .word LDBC0          ; $FC5C
    .byte $87 ; |X    XXX| $FC5E
    .byte $58 ; | X XX   | $FC5F
LFC60:
    .word LDB40          ; $FC60
    .byte $8F ; |X   XXXX| $FC62
    .byte $58 ; | X XX   | $FC63
LFC64:
    .word LDB80          ; $FC64
    .byte $87 ; |X    XXX| $FC66
    .byte $58 ; | X XX   | $FC67
LFC68:
    .word LDB00          ; $FC68
    .byte $8B ; |X   X XX| $FC6A
    .byte $58 ; | X XX   | $FC6B
LFC6C:
    .word LDB00          ; $FC6C
    .byte $91 ; |X  X   X| $FC6E
    .byte $58 ; | X XX   | $FC6F
LFC70:
    .word LDBC0          ; $FC70
    .byte $8F ; |X   XXXX| $FC72
    .byte $58 ; | X XX   | $FC73


LFC74:
    .byte <TwoBarrPF1    ; $FC74  level 1
    .byte <LFC50         ; $FC75
    .byte <LFC40         ; $FC76
    .byte <LFC2C         ; $FC77
    .byte <TwoBarrPF1    ; $FC78
    .byte <LFC50         ; $FC79
    .byte <LFC3C         ; $FC7A
    .byte <LFC40         ; $FC7B
    .byte <LFC2C         ; $FC7C
    .byte <LFC50         ; $FC7D
    .byte <LFC40         ; $FC7E
    .byte <TwoBarrPF1    ; $FC7F
    .byte <LFC50         ; $FC80
    .byte <LFC2C         ; $FC81
    .byte <LFC1C         ; $FC82
    .byte <LFC20         ; $FC83
    .byte <LFC50         ; $FC84
    .byte <LFC34         ; $FC85
    .byte <LFC44         ; $FC86
    .byte <LFC50         ; $FC87
    .byte <LFC48         ; $FC88
    .byte <LFC44         ; $FC89
    .byte <LFC4C         ; $FC8A
    .byte <LFC2C         ; $FC8B
    .byte <LFC48         ; $FC8C
    .byte <LFC2C         ; $FC8D
    .byte <LFC44         ; $FC8E
    .byte <LFC2C         ; $FC8F
    .byte <LFC2C         ; $FC90
    .byte <LFC2C         ; $FC91
    .byte <LFC24         ; $FC92
    .byte <LFC28         ; $FC93

    .byte <LFC2C         ; $FC94  level 2
    .byte <LFC2C         ; $FC95
    .byte <LFC2C         ; $FC96
    .byte <LFC34         ; $FC97
    .byte <LFC2C         ; $FC98
    .byte <LFC2C         ; $FC99
    .byte <LFC2C         ; $FC9A
    .byte <LFC2C         ; $FC9B
    .byte <LFC30         ; $FC9C
    .byte <LFC30         ; $FC9D
    .byte <LFC34         ; $FC9E
    .byte <LFC2C         ; $FC9F
    .byte <LFC2C         ; $FCA0
    .byte <LFC2C         ; $FCA1
    .byte <LFC1C         ; $FCA2
    .byte <LFC20         ; $FCA3
    .byte <LFC34         ; $FCA4
    .byte <LFC58         ; $FCA5
    .byte <LFC5C         ; $FCA6
    .byte <LFC54         ; $FCA7
    .byte <LFC30         ; $FCA8
    .byte <LFC5C         ; $FCA9
    .byte <LFC2C         ; $FCAA
    .byte <LFC54         ; $FCAB
    .byte <LFC2C         ; $FCAC
    .byte <LFC30         ; $FCAD
    .byte <LFC2C         ; $FCAE
    .byte <LFC30         ; $FCAF
    .byte <LFC2C         ; $FCB0
    .byte <LFC2C         ; $FCB1
    .byte <LFC24         ; $FCB2
    .byte <LFC28         ; $FCB3

    .byte <LFC2C         ; $FCB4  level 3
    .byte <LFC2C         ; $FCB5
    .byte <LFC2C         ; $FCB6
    .byte <LFC60         ; $FCB7
    .byte <LFC64         ; $FCB8
    .byte <LFC30         ; $FCB9
    .byte <LFC60         ; $FCBA
    .byte <LFC30         ; $FCBB
    .byte <LFC68         ; $FCBC
    .byte <LFC2C         ; $FCBD
    .byte <LFC60         ; $FCBE
    .byte <LFC2C         ; $FCBF
    .byte <LFC2C         ; $FCC0
    .byte <LFC2C         ; $FCC1
    .byte <LFC1C         ; $FCC2
    .byte <LFC20         ; $FCC3
    .byte <LFC2C         ; $FCC4
    .byte <LFC2C         ; $FCC5
    .byte <LFC30         ; $FCC6
    .byte <LFC60         ; $FCC7
    .byte <LFC6C         ; $FCC8
    .byte <LFC70         ; $FCC9
    .byte <LFC68         ; $FCCA
    .byte <LFC30         ; $FCCB
    .byte <LFC68         ; $FCCC
    .byte <LFC64         ; $FCCD
    .byte <LFC70         ; $FCCE
    .byte <LFC60         ; $FCCF
    .byte <LFC2C         ; $FCD0
    .byte <LFC2C         ; $FCD1
    .byte <LFC24         ; $FCD2
    .byte <LFC28         ; $FCD3

LFCD4:
    .byte $00 ; |        | $FCD4
    .byte $04 ; |     X  | $FCD5
    .byte $0C ; |    XX  | $FCD6
    .byte $00 ; |        | $FCD7
    .byte $08 ; |    X   | $FCD8
    .byte $06 ; |     XX | $FCD9
    .byte $0A ; |    X X | $FCDA
    .byte $00 ; |        | $FCDB
    .byte $00 ; |        | $FCDC
    .byte $02 ; |      X | $FCDD
    .byte $0E ; |    XXX | $FCDE
    .byte $00 ; |        | $FCDF
    .byte $00 ; |        | $FCE0
    .byte $00 ; |        | $FCE1
    .byte $00 ; |        | $FCE2
    .byte $00 ; |        | $FCE3
LFCE4:
    .byte $08 ; |    X   | $FCE4
    .byte $00 ; |        | $FCE5
    .byte $08 ; |    X   | $FCE6
    .byte $00 ; |        | $FCE7
    .byte $07 ; |     XXX| $FCE8
    .byte $01 ; |       X| $FCE9
    .byte $09 ; |    X  X| $FCEA
    .byte $0F ; |    XXXX| $FCEB
    .byte $06 ; |     XX | $FCEC
    .byte $02 ; |      X | $FCED
    .byte $0A ; |    X X | $FCEE
    .byte $0E ; |    XXX | $FCEF
    .byte $05 ; |     X X| $FCF0
    .byte $03 ; |      XX| $FCF1
    .byte $0B ; |    X XX| $FCF2
    .byte $0D ; |    XX X| $FCF3
    .byte $04 ; |     X  | $FCF4
    .byte $04 ; |     X  | $FCF5
    .byte $0C ; |    XX  | $FCF6
    .byte $0C ; |    XX  | $FCF7
LFCF8:
    .byte $10 ; |   X    | $FCF8
    .byte $20 ; |  X     | $FCF9
    .byte $10 ; |   X    | $FCFA
    .byte $10 ; |   X    | $FCFB
LFCFC:
    .byte 0              ; $FCFC   ram_B9
    .byte 3              ; $FCFD   ram_BC
    .byte 0              ; $FCFE   ram_B9
    .byte 3              ; $FCFF   ram_BC
    .byte 2              ; $FD00   ram_BB
    .byte 3              ; $FD01   ram_BC
    .byte 0              ; $FD02   ram_B9
    .byte 3              ; $FD03   ram_BC
    .byte 0              ; $FD04   ram_B9
    .byte 3              ; $FD05   ram_BC
    .byte 1              ; $FD06   ram_BA
    .byte 3              ; $FD07   ram_BC

LFD08:
    .byte  4             ; $FD08
    .byte  4             ; $FD09
    .byte  3             ; $FD0A
    .byte  2             ; $FD0B
    .byte  0             ; $FD0C
    .byte -2             ; $FD0D
    .byte -3             ; $FD0E
    .byte -4             ; $FD0F
    .byte -4             ; $FD10
    .byte -4             ; $FD11
    .byte -3             ; $FD12
    .byte -2             ; $FD13
    .byte  0             ; $FD14
    .byte  2             ; $FD15
    .byte  3             ; $FD16
    .byte  4             ; $FD17
LFD18:
    .byte  0             ; $FD18
    .byte  2             ; $FD19
    .byte  4             ; $FD1A
    .byte  6             ; $FD1B
    .byte  6             ; $FD1C
    .byte  6             ; $FD1D
    .byte  4             ; $FD1E
    .byte  2             ; $FD1F
    .byte  0             ; $FD20
    .byte -2             ; $FD21
    .byte -4             ; $FD22
    .byte -6             ; $FD23
    .byte -6             ; $FD24
    .byte -6             ; $FD25
    .byte -4             ; $FD26
    .byte -2             ; $FD27
LFD28:
    .byte  2             ; $FD28
    .byte  0             ; $FD29
    .byte  0             ; $FD2A
    .byte -1             ; $FD2B
    .byte  0             ; $FD2C
    .byte -1             ; $FD2D
    .byte  0             ; $FD2E
    .byte -1             ; $FD2F
    .byte  0             ; $FD30
    .byte -1             ; $FD31
    .byte  0             ; $FD32
    .byte -1             ; $FD33
    .byte  0             ; $FD34
    .byte  0             ; $FD35
    .byte  1             ; $FD36
    .byte  2             ; $FD37

LevelGfx:
    .byte $18 ; |   XX   | $FD38
    .byte $3C ; |  XXXX  | $FD39
    .byte $3C ; |  XXXX  | $FD3A
    .byte $3C ; |  XXXX  | $FD3B
    .byte $3C ; |  XXXX  | $FD3C
    .byte $18 ; |   XX   | $FD3D
    .byte $7E ; | XXXXXX | $FD3E
    .byte $7E ; | XXXXXX | $FD3F
    .byte $7E ; | XXXXXX | $FD40
    .byte $7E ; | XXXXXX | $FD41
    .byte $7E ; | XXXXXX | $FD42
    .byte $7E ; | XXXXXX | $FD43
ColLevelGfx:
    .byte $18            ; $FD44
    .byte $1A            ; $FD45
    .byte $1C            ; $FD46
    .byte $1C            ; $FD47
    .byte $1A            ; $FD48
    .byte $18            ; $FD49
    .byte $54            ; $FD4A
    .byte $54            ; $FD4B
    .byte $72            ; $FD4C
    .byte $72            ; $FD4D
    .byte $24            ; $FD4E
    .byte $24            ; $FD4F

GernadeGfx:
    .byte $1C ; |   XXX  | $FD50
    .byte $1C ; |   XXX  | $FD51
    .byte $BE ; |X XXXXX | $FD52
    .byte $BE ; |X XXXXX | $FD53
    .byte $BE ; |X XXXXX | $FD54
    .byte $BE ; |X XXXXX | $FD55
    .byte $BE ; |X XXXXX | $FD56
    .byte $BE ; |X XXXXX | $FD57
    .byte $5C ; | X XXX  | $FD58
    .byte $7C ; | XXXXX  | $FD59
    .byte $3C ; |  XXXX  | $FD5A
    .byte $08 ; |    X   | $FD5B
ColGernadeGfx:
    .byte $C2            ; $FD5C
    .byte $C4            ; $FD5D
    .byte $C4            ; $FD5E
    .byte $C2            ; $FD5F
    .byte $C4            ; $FD60
    .byte $C4            ; $FD61
    .byte $C2            ; $FD62
    .byte $C4            ; $FD63
    .byte $C4            ; $FD64
    .byte $C2            ; $FD65
    .byte $C2            ; $FD66
    .byte $C2            ; $FD67

LivesGfx:
    .byte $1C ; |   XXX  | $FD68
    .byte $08 ; |    X   | $FD69
    .byte $08 ; |    X   | $FD6A
    .byte $1C ; |   XXX  | $FD6B
    .byte $1C ; |   XXX  | $FD6C
    .byte $3C ; |  XXXX  | $FD6D
    .byte $7C ; | XXXXX  | $FD6E
    .byte $5C ; | X XXX  | $FD6F
    .byte $38 ; |  XXX   | $FD70
    .byte $1C ; |   XXX  | $FD71
    .byte $1C ; |   XXX  | $FD72
    .byte $08 ; |    X   | $FD73

ColLivesGfx:
    .byte $C2            ; $FD74
    .byte $C2            ; $FD75
    .byte $C4            ; $FD76
    .byte $C4            ; $FD77
    .byte $C2            ; $FD78
    .byte $C4            ; $FD79
    .byte $C4            ; $FD7A
    .byte $C2            ; $FD7B
    .byte $46            ; $FD7C
    .byte $C4            ; $FD7D
    .byte $C4            ; $FD7E
    .byte $C4            ; $FD7F

LFD80:
    .byte $0C ; |    XX  | $FD80
    .byte $0E ; |    XXX | $FD81  colors for score
    .byte $00 ; |        | $FD82
    .byte $0E ; |    XXX | $FD83

LFD84:
    .byte <LFD92         ; $FD84  cover up dead soldier?
    .byte <LFDBC         ; $FD85
    .byte <LFDD0         ; $FD86
    .byte <LFD97         ; $FD87
    .byte <LFDEF         ; $FD88
    .byte <LFDBC         ; $FD89
    .byte <LFDD0         ; $FD8A
    .byte <LFDAE         ; $FD8B
    .byte <LFDE4         ; $FD8C
    .byte <LFDBC         ; $FD8D
    .byte <LFDD0         ; $FD8E
    .byte <LFDA9         ; $FD8F
    .byte <LFD9C         ; $FD90
    .byte <LFDA1         ; $FD91
LFD92:
    .byte $01 ; |       X| $FD92
    .byte $00 ; |        | $FD93
    .byte $68 ; | XX X   | $FD94
    .word LD8B8          ; $FD95

LFD97:
    .byte $01 ; |       X| $FD97
    .byte $00 ; |        | $FD98  nusiz value
    .byte $08 ; |    X   | $FD99  Palm tree
    .word LD990          ; $FD9A  color ptr

LFD9C:
    .byte $01 ; |       X| $FD9C
    .byte $00 ; |        | $FD9D
    .byte $08 ; |    X   | $FD9E
    .word LD888          ; $FD9F

LFDA1:
    .byte $02 ; |      X | $FDA1
    .byte $00 ; |        | $FDA2
    .byte $08 ; |    X   | $FDA3
    .word LDA84          ; $FDA4
    .byte $0A ; |    X X | $FDA6
    .word LDAA4          ; $FDA7
LFDA9:
    .byte $01 ; |       X| $FDA9
    .byte $00 ; |        | $FDAA  NUSIZ1
    .byte $30 ; |  XX    | $FDAB  gernade pointer
    .word LDADC          ; $FDAC
LFDAE:
    .byte $04 ; |     X  | $FDAE
    .byte $00 ; |        | $FDAF
    .byte $08 ; |    X   | $FDB0
    .word LD7A8          ; $FDB1
    .byte $4A ; | X  X X | $FDB3
    .word LDAC4          ; $FDB4
    .byte $64 ; | XX  X  | $FDB6
    .word LDAC4          ; $FDB7
    .byte $4A ; | X  X X | $FDB9
    .word LDAC4          ; $FDBA
LFDBC:
    .byte $06 ; |     XX | $FDBC
    .byte $00 ; |        | $FDBD
    .byte $48 ; | X  X   | $FDBE
    .word LD8B8          ; $FDBF
    .word LD888          ; $FDC1
    .byte $D7 ; |XX X XXX| $FDC3
    .word LD888          ; $FDC4
    .byte $D7 ; |XX X XXX| $FDC6
    .byte $48 ; | X  X   | $FDC7
    .word LD8B8          ; $FDC8
    .byte $68 ; | XX X   | $FDCA
    .word LD7D8          ; $FDCB
    .byte $68 ; | XX X   | $FDCD
    .word LD7D8          ; $FDCE
LFDD0:
    .byte $06 ; |     XX | $FDD0
    .byte $00 ; |        | $FDD1
    .byte $28 ; |  X X   | $FDD2
    .word LD8B8          ; $FDD3
    .byte $48 ; | X  X   | $FDD5
    .word LD7D8          ; $FDD6
    .byte $48 ; | X  X   | $FDD8
    .word LD7D8          ; $FDD9
    .byte $28 ; |  X X   | $FDDB
    .word LD8B8          ; $FDDC
    .byte $28 ; |  X X   | $FDDE
    .word LD7D8          ; $FDDF
    .byte $28 ; |  X X   | $FDE1
    .word LD7D8          ; $FDE2
LFDE4:
    .byte $03 ; |      XX| $FDE4
    .byte $00 ; |        | $FDE5
    .byte $50 ; | X X    | $FDE6
    .word LD9C8          ; $FDE7
    .byte $70 ; | XXX    | $FDE9
    .word LD9C8          ; $FDEA
    .byte $30 ; |  XX    | $FDEC
    .word LD9C9          ; $FDED
LFDEF:
    .byte $03 ; |      XX| $FDEF
    .byte $08 ; |    X   | $FDF0
    .byte $50 ; | X X    | $FDF1
    .word LD9C8          ; $FDF2
    .byte $70 ; | XXX    | $FDF4
    .word LD9C8          ; $FDF5
    .byte $30 ; |  XX    | $FDF7
    .word LD9C9          ; $FDF8
LFDFA:
    .byte $00 ; |        | $FDFA  <LFD92
    .byte $80 ; |X       | $FDFB  no
    .byte $03 ; |      XX| $FDFC  <LFD97
    .byte $07 ; |     XXX| $FDFD  <LFDAE
    .byte $0B ; |    X XX| $FDFE  <LFDA9
    .byte $0C ; |    XX  | $FDFF  <LFD9C
    .byte $80 ; |X       | $FE00  no
    .byte $0D ; |    XX X| $FE01  <LFDA1
    .byte $00 ; |        | $FE02  <LFD92
LFE03:
    .byte $00 ; |        | $FE03
    .byte $00 ; |        | $FE04
    .byte $00 ; |        | $FE05
    .byte $00 ; |        | $FE06
    .byte $08 ; |    X   | $FE07 $08 >> 2 = 2
    .byte $08 ; |    X   | $FE08            2
    .byte $10 ; |   X    | $FE09            4
    .byte $00 ; |        | $FE0A            0
    .byte $10 ; |   X    | $FE0B            4
    .byte $18 ; |   XX   | $FE0C            6
    .byte $18 ; |   XX   | $FE0D            6
    .byte $00 ; |        | $FE0E
    .byte $00 ; |        | $FE0F
    .byte $00 ; |        | $FE10
    .byte $00 ; |        | $FE11
    .byte $00 ; |        | $FE12
LFE13:
    .byte $00 ; |        | $FE13
    .byte $00 ; |        | $FE14
    .byte $40 ; | X      | $FE15
    .byte $00 ; |        | $FE16
    .byte $00 ; |        | $FE17
    .byte $40 ; | X      | $FE18
    .byte $00 ; |        | $FE19
    .byte $00 ; |        | $FE1A
    .byte $40 ; | X      | $FE1B
    .byte $00 ; |        | $FE1C
    .byte $40 ; | X      | $FE1D
    .byte $00 ; |        | $FE1E
    .byte $00 ; |        | $FE1F
    .byte $00 ; |        | $FE20
    .byte $00 ; |        | $FE21
    .byte $00 ; |        | $FE22

SoldierMovementTab:
    .byte MOVE_UP        ; $FE23
    .byte MOVE_DOWN      ; $FE24
    .byte MOVE_LEFT      ; $FE25
    .byte MOVE_LEFT | MOVE_UP    ; $FE26
    .byte MOVE_LEFT | MOVE_DOWN  ; $FE27
    .byte MOVE_RIGHT             ; $FE28
    .byte MOVE_RIGHT | MOVE_UP   ; $FE29
    .byte MOVE_RIGHT | MOVE_DOWN ; $FE2A
    .byte MOVE_LEFT      ; $FE2B
    .byte MOVE_LEFT      ; $FE2C
    .byte MOVE_LEFT      ; $FE2D
    .byte MOVE_LEFT      ; $FE2E
    .byte MOVE_RIGHT     ; $FE2F
    .byte MOVE_RIGHT     ; $FE30
    .byte MOVE_RIGHT     ; $FE31
    .byte MOVE_RIGHT     ; $FE32
    .byte MOVE_RIGHT     ; $FE33
    .byte MOVE_RIGHT     ; $FE34
    .byte MOVE_RIGHT     ; $FE35
    .byte MOVE_RIGHT     ; $FE36
    .byte MOVE_LEFT      ; $FE37
    .byte MOVE_LEFT      ; $FE38
    .byte MOVE_LEFT      ; $FE39
    .byte MOVE_LEFT      ; $FE3A
    .byte MOVE_LEFT      ; $FE3B
    .byte MOVE_LEFT      ; $FE3C
    .byte MOVE_LEFT      ; $FE3D
    .byte MOVE_LEFT      ; $FE3E
    .byte MOVE_RIGHT     ; $FE3F
    .byte MOVE_RIGHT     ; $FE40
    .byte MOVE_RIGHT     ; $FE41
    .byte MOVE_RIGHT     ; $FE42

LFE43:
    .byte 0              ; $FE43   lv 1
    .byte 1              ; $FE44   lv 2
    .byte 2              ; $FE45   lv 3
    .byte 1              ; $FE46   lv 4
HighAddressTab:
    .byte $D0 ; |XX X    | $FE47
    .byte $B0 ; |X XX    | $FE48
    .byte $90 ; |X  X    | $FE49
    .byte $B0 ; |X XX    | $FE4A
LFE4B:
    .byte $1A ; |   XX X | $FE4B
    .byte $CA ; |XX  X X | $FE4C
    .byte $2A ; |  X X X | $FE4D
    .byte $CA ; |XX  X X | $FE4E

LFE4F:
    .byte LEFT_6         ; $FE4F
    .byte LEFT_5         ; $FE50
    .byte LEFT_4         ; $FE51
    .byte LEFT_3         ; $FE52
    .byte LEFT_2         ; $FE53
    .byte LEFT_1         ; $FE54
    .byte NO_MOTION      ; $FE55
    .byte RIGHT_1        ; $FE56
    .byte RIGHT_2        ; $FE57
    .byte RIGHT_3        ; $FE58
    .byte RIGHT_4        ; $FE59
    .byte RIGHT_5        ; $FE5A
    .byte RIGHT_6        ; $FE5B
    .byte RIGHT_7        ; $FE5C
    .byte RIGHT_8        ; $FE5D

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SetSoundEvent SUBROUTINE ;x6
    cmp    soundIndex            ; 3
    bcc    .soundAlreadyStarted  ; 2³
    sta    soundIndex            ; 3
.soundAlreadyStarted:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFE65 SUBROUTINE ;x4
    lda    ram_D3                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    eor    ram_D3                ; 3
    asl                          ; 2
    rol    ram_D3                ; 5
    lda    ram_D3                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $34 ; |  XX X  | $FE72
    .byte $66 ; | XX  XX | $FE73
    .byte $66 ; | XX  XX | $FE74
    .byte $66 ; | XX  XX | $FE75
    .byte $66 ; | XX  XX | $FE76
    .byte $66 ; | XX  XX | $FE77
    .byte $2C ; |  X XX  | $FE78
    .byte $00 ; |        | $FE79
    .byte $3C ; |  XXXX  | $FE7A
    .byte $18 ; |   XX   | $FE7B
    .byte $18 ; |   XX   | $FE7C
    .byte $18 ; |   XX   | $FE7D
    .byte $18 ; |   XX   | $FE7E
    .byte $38 ; |  XXX   | $FE7F
    .byte $18 ; |   XX   | $FE80
    .byte $00 ; |        | $FE81
    .byte $76 ; | XXX XX | $FE82
    .byte $60 ; | XX     | $FE83
    .byte $60 ; | XX     | $FE84
    .byte $2C ; |  X XX  | $FE85
    .byte $06 ; |     XX | $FE86
    .byte $46 ; | X   XX | $FE87
    .byte $2C ; |  X XX  | $FE88
    .byte $00 ; |        | $FE89
    .byte $2C ; |  X XX  | $FE8A
    .byte $46 ; | X   XX | $FE8B
    .byte $06 ; |     XX | $FE8C
    .byte $0C ; |    XX  | $FE8D
    .byte $06 ; |     XX | $FE8E
    .byte $46 ; | X   XX | $FE8F
    .byte $2C ; |  X XX  | $FE90
    .byte $00 ; |        | $FE91
    .byte $0C ; |    XX  | $FE92
    .byte $0C ; |    XX  | $FE93
    .byte $6E ; | XX XXX | $FE94
    .byte $4C ; | X  XX  | $FE95
    .byte $2C ; |  X XX  | $FE96
    .byte $0C ; |    XX  | $FE97
    .byte $0C ; |    XX  | $FE98
    .byte $00 ; |        | $FE99
    .byte $6C ; | XX XX  | $FE9A
    .byte $46 ; | X   XX | $FE9B
    .byte $06 ; |     XX | $FE9C
    .byte $74 ; | XXX X  | $FE9D
    .byte $60 ; | XX     | $FE9E
    .byte $60 ; | XX     | $FE9F
    .byte $76 ; | XXX XX | $FEA0
    .byte $00 ; |        | $FEA1
    .byte $2C ; |  X XX  | $FEA2
    .byte $66 ; | XX  XX | $FEA3
    .byte $66 ; | XX  XX | $FEA4
    .byte $74 ; | XXX X  | $FEA5
    .byte $60 ; | XX     | $FEA6
    .byte $62 ; | XX   X | $FEA7
    .byte $2C ; |  X XX  | $FEA8
    .byte $00 ; |        | $FEA9
    .byte $18 ; |   XX   | $FEAA
    .byte $18 ; |   XX   | $FEAB
    .byte $18 ; |   XX   | $FEAC
    .byte $0C ; |    XX  | $FEAD
    .byte $06 ; |     XX | $FEAE
    .byte $42 ; | X    X | $FEAF
    .byte $6E ; | XX XXX | $FEB0
    .byte $00 ; |        | $FEB1
    .byte $34 ; |  XX X  | $FEB2
    .byte $66 ; | XX  XX | $FEB3
    .byte $66 ; | XX  XX | $FEB4
    .byte $2C ; |  X XX  | $FEB5
    .byte $66 ; | XX  XX | $FEB6
    .byte $66 ; | XX  XX | $FEB7
    .byte $34 ; |  XX X  | $FEB8
    .byte $00 ; |        | $FEB9
    .byte $34 ; |  XX X  | $FEBA
    .byte $46 ; | X   XX | $FEBB
    .byte $06 ; |     XX | $FEBC
    .byte $2E ; |  X XXX | $FEBD
    .byte $66 ; | XX  XX | $FEBE
    .byte $66 ; | XX  XX | $FEBF
    .byte $34 ; |  XX X  | $FEC0
    .byte $00 ; |        | $FEC1
    .byte $00 ; |        | $FEC2
    .byte $00 ; |        | $FEC3
    .byte $00 ; |        | $FEC4
    .byte $00 ; |        | $FEC5
    .byte $00 ; |        | $FEC6
    .byte $00 ; |        | $FEC7
    .byte $00 ; |        | $FEC8
    .byte $00 ; |        | $FEC9
LFECA:
    .byte $00 ; |        | $FECA
    .byte $01 ; |       X| $FECB
    .byte $02 ; |      X | $FECC
    .byte $00 ; |        | $FECD
    .byte $04 ; |     X  | $FECE
    .byte $05 ; |     X X| $FECF
    .byte $06 ; |     XX | $FED0
    .byte $00 ; |        | $FED1
    .byte $08 ; |    X   | $FED2
    .byte $09 ; |    X  X| $FED3
    .byte $0A ; |    X X | $FED4
    .byte $00 ; |        | $FED5
    .byte $00 ; |        | $FED6
    .byte $00 ; |        | $FED7
    .byte $00 ; |        | $FED8
    .byte $00 ; |        | $FED9
LFEDA:
    .byte  0             ; $FEDA
    .byte  0             ; $FEDB
    .byte  0             ; $FEDC
    .byte  0             ; $FEDD
    .byte -1             ; $FEDE
    .byte -1             ; $FEDF
    .byte -1             ; $FEE0
    .byte  0             ; $FEE1
    .byte  1             ; $FEE2
    .byte  1             ; $FEE3
    .byte  1             ; $FEE4
    .byte  0             ; $FEE5
LFEE6:
    .byte  0             ; $FEE6
    .byte  1             ; $FEE7
    .byte -1             ; $FEE8
    .byte  0             ; $FEE9
    .byte  0             ; $FEEA
    .byte  1             ; $FEEB
    .byte -1             ; $FEEC
    .byte  0             ; $FEED
    .byte  0             ; $FEEE
    .byte  1             ; $FEEF
    .byte -1             ; $FEF0
    .byte  0             ; $FEF1
LFEF2:
    .byte  0             ; $FEF2
    .byte  0             ; $FEF3
    .byte  0             ; $FEF4
    .byte  0             ; $FEF5
    .byte -2             ; $FEF6
    .byte -2             ; $FEF7
    .byte -2             ; $FEF8
    .byte  0             ; $FEF9
    .byte  2             ; $FEFA
    .byte  2             ; $FEFB
    .byte  2             ; $FEFC
    .byte  0             ; $FEFD
    .byte -5             ; $FEFE
    .byte  0             ; $FEFF
LFF00:
    .byte $00            ; $FF00
    .byte $E0            ; $FF01
    .byte $20            ; $FF02
    .byte $00            ; $FF03
    .byte $00            ; $FF04
    .byte $E0            ; $FF05
    .byte $20            ; $FF06
    .byte $00            ; $FF07
    .byte $00            ; $FF08
    .byte $E0            ; $FF09
    .byte $20            ; $FF0A
    .byte $00            ; $FF0B
    .byte $00            ; $FF0C
    .byte $00            ; $FF0D
LFF0E:
    .word Copyright      ; $FF0E
    .word One            ; $FF10
    .word Nine           ; $FF12
    .word Eight          ; $FF14
    .word Eight          ; $FF16
    .word BlankDigit     ; $FF18

    .word ActivisionOne  ; $FF1A
    .word ActivisionTwo  ; $FF1C
    .word ActivisionThree; $FF1E
    .word ActivisionFour ; $FF20
    .word ActivisionFive ; $FF22
    .word BlankDigit     ; $FF24

    .word Copyright      ; $FF26
    .word One            ; $FF28
    .word Nine           ; $FF2A
    .word Eight          ; $FF2C
    .word Six            ; $FF2E
    .word BlankDigit     ; $FF30

    .word LogoOne        ; $FF32
    .word LogoTwo        ; $FF34
    .word LogoThree      ; $FF36
    .word LogoFour       ; $FF38
    .word BlankDigit     ; $FF3A
    .word BlankDigit     ; $FF3C

    .byte $FF ; |XXXXXXXX| $FF3E   free bytes
    .byte $FF ; |XXXXXXXX| $FF3F
    .byte $FF ; |XXXXXXXX| $FF40
    .byte $FF ; |XXXXXXXX| $FF41
    .byte $FF ; |XXXXXXXX| $FF42
    .byte $FF ; |XXXXXXXX| $FF43
    .byte $FF ; |XXXXXXXX| $FF44
    .byte $FF ; |XXXXXXXX| $FF45
    .byte $FF ; |XXXXXXXX| $FF46
    .byte $FF ; |XXXXXXXX| $FF47
    .byte $FF ; |XXXXXXXX| $FF48
    .byte $FF ; |XXXXXXXX| $FF49
    .byte $FF ; |XXXXXXXX| $FF4A
    .byte $FF ; |XXXXXXXX| $FF4B
    .byte $FF ; |XXXXXXXX| $FF4C
    .byte $FF ; |XXXXXXXX| $FF4D
    .byte $FF ; |XXXXXXXX| $FF4E
    .byte $FF ; |XXXXXXXX| $FF4F
    .byte $FF ; |XXXXXXXX| $FF50
    .byte $FF ; |XXXXXXXX| $FF51
    .byte $FF ; |XXXXXXXX| $FF52
    .byte $FF ; |XXXXXXXX| $FF53
    .byte $FF ; |XXXXXXXX| $FF54
    .byte $FF ; |XXXXXXXX| $FF55
    .byte $FF ; |XXXXXXXX| $FF56
    .byte $FF ; |XXXXXXXX| $FF57
    .byte $FF ; |XXXXXXXX| $FF58
    .byte $FF ; |XXXXXXXX| $FF59
    .byte $FF ; |XXXXXXXX| $FF5A
    .byte $FF ; |XXXXXXXX| $FF5B
    .byte $FF ; |XXXXXXXX| $FF5C
    .byte $FF ; |XXXXXXXX| $FF5D
    .byte $FF ; |XXXXXXXX| $FF5E

       ORG $3F5F
      RORG $FF5F

LFF5F:
    lda    livesLevelNum         ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    LFE43,Y               ; 4
    cmp    #$01                  ; 2
    bcc    LFF7F                 ; 2³  bankswitch, goto LD000
    beq    LFF76                 ; 2³  bankswitch, goto LB000
    bit    BANK_0                ; 4   bankswitch, goto L9000

    .byte $00   ; $FF70
    .byte $00   ; $FF71
    .byte $00   ; $FF72
    .byte $00   ; $FF73
    .byte $00   ; $FF74
    .byte $00   ; $FF75

LFF76:
    bit    BANK_1                ; 4   bankswitch, goto LB000

    .byte $00   ; $FF79
    .byte $00   ; $FF7A
    .byte $00   ; $FF7B
    .byte $00   ; $FF7C
    .byte $00   ; $FF7D
    .byte $00   ; $FF7E

LFF7F:
    bit    BANK_2                ; 4   bankswitch, goto LD000

    .byte $00   ; $FF82
    .byte $00   ; $FF83
    .byte $00   ; $FF84
    .byte $00   ; $FF85
    .byte $00   ; $FF86
    .byte $00   ; $FF87

LFF88:
    pha                          ; 3
    lda    livesLevelNum         ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    LFE43,Y               ; 4
    cmp    #$01                  ; 2
    bcc    LFFAB                 ; 2³  bankswitch, goto LDE00
    beq    LFFA1                 ; 2³  bankswitch, goto LBD40
    pla                          ; 4
    bit    BANK_0                ; 4   bankswitch, goto L9D40

    .byte $00   ; $FF9B
    .byte $00   ; $FF9C
    .byte $00   ; $FF9D
    .byte $00   ; $FF9E
    .byte $00   ; $FF9F
    .byte $00   ; $FFA0

LFFA1:
    pla                          ; 4
    bit    BANK_1                ; 4   bankswitch, goto LBD40

    .byte $00   ; $FFA5
    .byte $00   ; $FFA6
    .byte $00   ; $FFA7
    .byte $00   ; $FFA8
    .byte $00   ; $FFA9
    .byte $00   ; $FFAA

LFFAB:
    pla                          ; 4
    bit    BANK_2                ; 4   bankswitch, goto LDE00

    .byte $00   ; $FFAF
    .byte $00   ; $FFB0
    .byte $00   ; $FFB1
    .byte $00   ; $FFB2
    .byte $00   ; $FFB3
    .byte $00   ; $FFB4

LFFB5:
    bit    BANK_2                ; 4   bankswitch, goto LDED0

    .byte $00   ; $FFB8
    .byte $00   ; $FFB9
    .byte $00   ; $FFBA
    .byte $00   ; $FFBB
    .byte $00   ; $FFBC
    .byte $00   ; $FFBD

LFFBE:
    bit    BANK_2                ; 4   bankswitch, goto LDEFF

    .byte $00   ; $FFC1
    .byte $00   ; $FFC2
    .byte $00   ; $FFC3
    .byte $00   ; $FFC4
    .byte $00   ; $FFC5
    .byte $00   ; $FFC6

LFFC7:
    bit    BANK_2                ; 4   bankswitch, goto LDE75

    .byte $00   ; $FFCA
    .byte $00   ; $FFCB
    .byte $00   ; $FFCC
    .byte $00   ; $FFCD
    .byte $00   ; $FFCE
    .byte $00   ; $FFCF

LFFD0:
    bit    BANK_1                ; 4   bankswitch, goto LBDB5

    .byte $00   ; $FFD3
    .byte $00   ; $FFD4
    .byte $00   ; $FFD5
    .byte $00   ; $FFD6
    .byte $00   ; $FFD7
    .byte $00   ; $FFD8

LFFD9:
    bit    BANK_0                ; 4   bankswitch, goto L9DB5

    .byte $00   ; $FFDC
    .byte $00   ; $FFDD
    .byte $00   ; $FFDE
    .byte $00   ; $FFDF
    .byte $00   ; $FFE0
    .byte $00   ; $FFE1

LFFE2:
    bit    BANK_0                ; 4   bankswitch, goto L948A

    .byte $00   ; $FFE5
    .byte $00   ; $FFE6
    .byte $00   ; $FFE7
    .byte $00   ; $FFE8
    .byte $00   ; $FFE9
    .byte $00   ; $FFEA
    .byte $00   ; $FFEB
    .byte $00   ; $FFEC
    .byte $00   ; $FFED

;coming from all other banks
    rts                          ; 6

START_3:
    cli                          ; 2
    bit    BANK_3                ; 4
    jmp    LF000                 ; 3

       ORG $3FF6
      RORG $FFF6

    .byte $EA   ; $FFF6
    .byte $EA   ; $FFF7
    .byte $EA   ; $FFF8
    .byte $EA   ; $FFF9
    .byte $EA   ; $FFFA
    .byte $EA   ; $FFFB

    .word START_3
    .word START_3
