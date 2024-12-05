; Rough disassembly of Turmoil
; By Omegamatrix
;
; turmoil.cfg contents:
;
;      ORG F000
;      CODE F000 FBE8
;      GFX FBE9 FDC6
;      CODE FDC7 FDD6
;      GFX FDD7 FF83
;      CODE FF84 FF96
;      GFX FF97 FFFF

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
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXM0P   =  $30
CXPPMM  =  $37
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      USER CONSTANTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;HMPx
LEFT_7                = $70
LEFT_6                = $60
LEFT_5                = $50
LEFT_4                = $40
LEFT_3                = $30
LEFT_2                = $20
LEFT_1                = $10
NO_MOTION             = $00
RIGHT_1               = $F0
RIGHT_2               = $E0
RIGHT_3               = $D0
RIGHT_4               = $C0
RIGHT_5               = $B0
RIGHT_6               = $A0
RIGHT_7               = $90
RIGHT_8               = $80

TIME_VSYNC            = $2A
TIME_VBLANK           = $3B

PAUSE_SWITCH          = $08 ; bW/color switch used as a pause switch
FACE_LEFT             = $08 ; ship orientation is done with REFP0
FACE_RIGHT            = $00

COL_00                = $00
COL_18                = $18
COL_78                = $78
COL_B8                = $B8

SHOW_PLAY_SCREEN      = $00
GOTO_LEVEL_SCREEN     = $01
SHOW_LEVEL_SCREEN     = $FF



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      RIOT RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x7
ram_81             ds 1  ; x5
ram_82             ds 1  ; x2  counter
playerShipPtr      ds 2  ;$83-$84 x9
ram_85             ds 1  ; x4
ram_86             ds 1  ; x4
ram_87             ds 1  ; x4
ram_88             ds 1  ; x4
scoreLow           ds 1  ;$89 x9
scoreHigh          ds 1  ;$8A x9
ram_8B             ds 1  ; x25
ram_8C             ds 1  ; x8
ram_8D             ds 1  ; x4
ram_8E             ds 1  ; x15
ram_8F             ds 1  ; x7
playfieldColor     ds 1  ;$90 x16 COLUPF
ram_91             ds 1  ; x1
ram_92             ds 1  ; x1
;---------------------------------
ram_93             ds 1  ; x6  random?
ram_94             ds 1  ; x8
;---------------------------------
ram_95             ds 1  ; x7
ram_96             ds 2  ; x6
ram_98             ds 1  ; x21
ram_99             ds 6  ; x22
ram_9F             ds 1  ; x1
ram_A0             ds 1  ; x9
ram_A1             ds 1  ; x1
ram_A2             ds 1  ; x1
ram_A3             ds 1  ; x1
ram_A4             ds 1  ; x1
ram_A5             ds 1  ; x1
ram_A6             ds 1  ; x1
ram_A7             ds 1  ; x4
ram_A8             ds 7  ; x7
ram_AF             ds 2  ; x2
ram_B1             ds 6  ; x3
ram_B7             ds 1  ; x1
ram_B8             ds 1  ; x21
ram_B9             ds 1  ; x9
ram_BA             ds 1  ; x2
ram_BB             ds 1  ; x2
ram_BC             ds 1  ; x1
ram_BD             ds 1  ; x6
ram_BE             ds 7  ; x16
ram_C5             ds 1  ; x7
ram_C6             ds 1  ; x3
ram_C7             ds 1  ; x10
ram_C8             ds 1  ; x4
numOfEnemysShot    ds 1  ;$C9 x6
ram_CA             ds 1  ; x6
ram_CB             ds 1  ; x8
ram_CC             ds 1  ; x3
ram_CD             ds 1  ; x3
ram_CE             ds 1  ; x3
ram_CF             ds 1  ; x3
ram_D0             ds 2  ; x1
ram_D2             ds 1  ; x3
ram_D3             ds 1  ; x4
ram_D4             ds 1  ; x7
ram_D5             ds 1  ; x3
ram_D6             ds 1  ; x5
ram_D7             ds 1  ; x3
ram_D8             ds 1  ; x3
ram_D9             ds 1  ; x4
ram_DA             ds 7  ; x18
ram_E1             ds 1  ; x3
ram_E2             ds 1  ; x8
ram_E3             ds 7  ; x3
levelNumber        ds 1  ;$EA x16   9 levels, count is 0 to 8
ram_EB             ds 1  ; x3
ram_EC             ds 1  ; x2
pauseStatus        ds 1  ;$ED x2
ram_EE             ds 1  ; x5
ram_EF             ds 1  ; x1
ram_F0             ds 1  ; x5
ram_F1             ds 1  ; x7
ram_F2             ds 1  ; x5
shipDirection      ds 1  ;$F3 x5
ram_F4             ds 1  ; x8
ram_F5             ds 2  ; x11
ram_F7             ds 1  ; x7
ram_F8             ds 1  ; x3
ram_F9             ds 1  ; x5
screenFlag         ds 1  ;$FA x5   $FF level screen, $00 play screen, $01 transistion flag
ram_FB             ds 1  ; x6
ram_FC             ds 3  ; x7
ram_FF             ds 1  ; x17

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
    lda    #0                    ; 2
    tax                          ; 2
.loopClear:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    .loopClear            ; 2³

    dex                          ; 2
    txs                          ; 2
    lda    SWCHB                 ; 4
    and    #PAUSE_SWITCH         ; 2
    sta    pauseStatus           ; 3
    lda    #$FC                  ; 2
    sta    ram_BC                ; 3
    lda    #<LFD9B               ; 2
    sta    ram_EE                ; 3
    lda    #>LFD9B               ; 2
    sta    ram_EF                ; 3
    lda    #$FE                  ; 2
    sta    ram_94                ; 3
    sta    ram_D9                ; 3   LFE6C, LFE79
    lda    #FACE_LEFT            ; 2
    sta    shipDirection         ; 3
    lda    #$01                  ; 2
    sta    ram_80                ; 3
    sta    CTRLPF                ; 3
    lda    #$05                  ; 2
    sta    ram_8E                ; 3
    lda    #$4A                  ; 2
    sta    ram_98                ; 3
    lda    #$0A                  ; 2
    sta    ram_A7                ; 3
    lda    #$14                  ; 2
    sta    ram_8F                ; 3
    lda    #COL_18               ; 2
    sta    playfieldColor        ; 3
    lda    #<LFD6E               ; 2
    sta    ram_91                ; 3
    lda    #>LFD6E               ; 2
    sta    ram_92                ; 3
    lda    #<PlayerShip          ; 2
    sta    playerShipPtr         ; 3
    lda    #>PlayerShip          ; 2
    sta    playerShipPtr+1       ; 3
    lda    #$01                  ; 2
    sta    ram_C7                ; 3
    jsr    LFBBF                 ; 6

MainLoop:
    ldx    #TIME_VSYNC           ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    VBLANK                ; 3
    stx    VSYNC                 ; 3
    stx    TIM8T                 ; 4
    inc    ram_FC                ; 5

;do score pointers
    lda    scoreLow              ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_85                ; 3
    lda    scoreLow              ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    sta    ram_86                ; 3
    lda    scoreHigh             ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_87                ; 3
    lda    scoreHigh             ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    sta    ram_88                ; 3

    inc    ram_93                ; 5
    lda    ram_B8                ; 3
    bmi    LF093                 ; 2³
    inc    ram_F4                ; 5
    lda    #$00                  ; 2
    sta    ram_CB                ; 3
LF093:
    ldx    #TIME_VBLANK          ; 2
.waitVsync:
    lda    INTIM                 ; 4
    bne    .waitVsync            ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    stx    TIM64T                ; 4
    lda    ram_B8                ; 3
    bpl    LF0BE                 ; 2³
    lda    SWCHB                 ; 4
    and    #PAUSE_SWITCH         ; 2
    cmp    pauseStatus           ; 3
    beq    LF0BE                 ; 2³
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
    sta    AUDV0                 ; 3
    lda    playfieldColor        ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    playfieldColor        ; 3
    jmp    LF74F                 ; 3

LF0BE:
    ldx    #$06                  ; 2
    lda    screenFlag            ; 3
    cmp    #GOTO_LEVEL_SCREEN    ; 2
    beq    LF0D6                 ; 2³
    lda    numOfEnemysShot       ; 3
    ldy    levelNumber           ; 3
    cmp    EnemysShotTab,Y       ; 4
    bcc    LF11A                 ; 2³+1
LF0CF:
    lda    ram_BE,X              ; 4
    bne    LF11A                 ; 2³+1
    dex                          ; 2
    bpl    LF0CF                 ; 2³  always branch?
LF0D6:
    lda    #0                    ; 2
    sta    numOfEnemysShot       ; 3
    sta    ram_FC                ; 3
    lda    #$01                  ; 2
    sta    ram_8E                ; 3
    lda    #$4A                  ; 2
    sta    ram_98                ; 3
    lda    #$00                  ; 2
    sta    ram_F1                ; 3
    sta    ram_8D                ; 3
    sta    ram_96                ; 3
    sta    ram_F5                ; 3
    lda    ram_B8                ; 3
    bpl    LF0FE                 ; 2³
    inc    levelNumber           ; 5
    lda    levelNumber           ; 3
    cmp    #9                    ; 2
    bcc    LF0FE                 ; 2³
    lda    #8                    ; 2
    sta    levelNumber           ; 3
LF0FE:
    inc    ram_B9                ; 5
    lda    ram_B9                ; 3
    cmp    #$07                  ; 2
    bcc    LF10A                 ; 2³
    lda    #$06                  ; 2
    sta    ram_B9                ; 3
LF10A:
    tay                          ; 2
    lda    LFFEB,Y               ; 4
    sta    ram_A7                ; 3
    lda    #$FF                  ; 2
    sta    ram_CA                ; 3
    beq    LF127                 ; 2³  never branch
    sta    screenFlag            ; 3   SHOW_LEVEL_SCREEN
    bmi    LF127                 ; 3   always branch

LF11A:
    lda    numOfEnemysShot       ; 3
    ldy    levelNumber           ; 3
    cmp    EnemysShotTab,Y       ; 4
    bcc    LF127                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_C8                ; 3
LF127:
    lda    ram_CA                ; 3
    beq    LF197                 ; 2³
    dec    ram_CA                ; 5
    beq    LF149                 ; 2³
    tay                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDF0                 ; 3
    sta    AUDF1                 ; 3
    tya                          ; 2
    and    #$0F                  ; 2
    sta    AUDV1                 ; 3
    sta    AUDV0                 ; 3
    lda    #$04                  ; 2
    sta    AUDC0                 ; 3
    lda    #$07                  ; 2
    sta    AUDC1                 ; 3
    jmp    LF72F                 ; 3

LF149:
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
    sta    AUDV0                 ; 3
    sta    ram_CA                ; 3
    sta    ram_C8                ; 3
    sta    ram_F5                ; 3
    sta    ram_F4                ; 3
    sta    screenFlag            ; 3
    sta    ram_A0                ; 3
    sta    ram_A1                ; 3
    sta    ram_A2                ; 3
    sta    ram_A3                ; 3
    sta    ram_A4                ; 3
    sta    ram_A5                ; 3
    sta    ram_A6                ; 3
    sta    ram_D2                ; 3
    lda    #<PlayerShip          ; 2
    sta    playerShipPtr         ; 3
    lda    #>PlayerShip          ; 2
    sta    playerShipPtr+1       ; 3
    ldx    #$01                  ; 2
    stx    ram_8E                ; 3
    ldx    #$FF                  ; 2
    txs                          ; 2
    jsr    LFBBF                 ; 6
    lda    levelNumber           ; 3
    cmp    #$03                  ; 2
    bcc    LF185                 ; 2³
    lda    ram_CB                ; 3
    beq    LF18F                 ; 2³
LF185:
    lda    #COL_78               ; 2
    sta    playfieldColor        ; 3
    lda    #$00                  ; 2
    sta    ram_CB                ; 3
    beq    LF197                 ; 3   always branch

LF18F:
    lda    #$FF                  ; 2
    sta    ram_CB                ; 3
    lda    #COL_00               ; 2
    sta    playfieldColor        ; 3
LF197:
    lda    ram_C5                ; 3
    beq    LF217                 ; 2³+1
    dec    ram_8F                ; 5
    bne    LF1C4                 ; 2³
    lda    #$06                  ; 2
    sta    ram_8F                ; 3
    inc    ram_C5                ; 5
    lda    ram_C5                ; 3
    tay                          ; 2
    lda    #$04                  ; 2
    sta    AUDC0                 ; 3
    lda    #$05                  ; 2
    sta    AUDC1                 ; 3
    lda    #$0F                  ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    tya                          ; 2
    eor    #$0F                  ; 2
    sta    AUDF0                 ; 3
    tya                          ; 2
    eor    #$08                  ; 2
    sta    AUDF1                 ; 3
    cpy    #$30                  ; 2
    bcs    LF1C7                 ; 2³
LF1C4:
    jmp    LF21F                 ; 3

LF1C7:
    lda    #<PlayerShip          ; 2
    sta    playerShipPtr         ; 3
    lda    #>PlayerShip          ; 2
    sta    playerShipPtr+1       ; 3
    lda    #$00                  ; 2
    sta    AUDV1                 ; 3
    sta    AUDV0                 ; 3
    sta    ram_C5                ; 3
    sta    ram_B8                ; 3
    sta    levelNumber           ; 3
    sta    numOfEnemysShot       ; 3
    ldx    #$FF                  ; 2
    txs                          ; 2
    jsr    LFBBF                 ; 6
    lda    #COL_78               ; 2
    sta    playfieldColor        ; 3
    lda    ram_CC                ; 3
    cmp    ram_88                ; 3
    bcc    LF207                 ; 2³+1
    bne    LF217                 ; 2³+1
    lda    ram_CD                ; 3
    cmp    ram_87                ; 3
    bcc    LF207                 ; 2³+1
    bne    LF217                 ; 2³+1
    lda    ram_CE                ; 3
    cmp    ram_86                ; 3
    bcc    LF207                 ; 2³+1
    bne    LF217                 ; 2³+1
    lda    ram_CF                ; 3
    cmp    ram_85                ; 3
    bcc    LF207                 ; 2³
    bne    LF217                 ; 2³
LF207:
    lda    ram_88                ; 3
    sta    ram_CC                ; 3
    lda    ram_87                ; 3
    sta    ram_CD                ; 3
    lda    ram_86                ; 3
    sta    ram_CE                ; 3
    lda    ram_85                ; 3
    sta    ram_CF                ; 3
LF217:
    lda    INPT4                 ; 3
    bmi    LF21F                 ; 2³
    lda    ram_B8                ; 3
    bpl    LF225                 ; 2³
LF21F:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcs    LF24F                 ; 2³
LF225:
    ldy    #$FF                  ; 2
    sty    ram_E1                ; 3
    sty    ram_B8                ; 3
    iny                          ; 2
    sty    ram_D4                ; 3
    sty    ram_D5                ; 3
    sty    scoreLow              ; 3
    sty    scoreHigh             ; 3
    sty    AUDV1                 ; 3
    sty    AUDV0                 ; 3
    sty    ram_C5                ; 3
    sty    ram_CA                ; 3
    sty    ram_C8                ; 3
    iny                          ; 2
    sty    ram_CB                ; 3
    sty    ram_8E                ; 3
    lda    #$03                  ; 2
    sta    ram_B9                ; 3
    lda    LFFEE                 ; 4
    sta    ram_A7                ; 3
    jmp    LF72F                 ; 3

LF24F:
    lda    ram_E1                ; 3
    bpl    LF278                 ; 2³
    sta    ram_B8                ; 3
    ldx    #$FF                  ; 2
    txs                          ; 2
    jsr    LFBBF                 ; 6
    lda    #$00                  ; 2
    sta    ram_E1                ; 3
    sta    ram_F4                ; 3
    sta    numOfEnemysShot       ; 3
    lda    #GOTO_LEVEL_SCREEN    ; 2
    sta    screenFlag            ; 3
    lda    levelNumber           ; 3
    sta    ram_D0                ; 3
    dec    levelNumber           ; 5
    lda    #<PlayerShip          ; 2
    sta    playerShipPtr         ; 3
    lda    #>PlayerShip          ; 2
    sta    playerShipPtr+1       ; 3
    jmp    LF72F                 ; 3

LF278:
    lda    ram_C5                ; 3
    beq    LF27F                 ; 2³
    jmp    LF74F                 ; 3

LF27F:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    bcc    LF28A                 ; 2³
    sta    ram_C6                ; 3
    bpl    LF2CB                 ; 3   always branch

LF28A:
    lda    #$00                  ; 2
    sta    AUDV1                 ; 3
    sta    AUDV0                 ; 3
    sta    ram_D4                ; 3
    sta    ram_F5                ; 3
    lda    #$4A                  ; 2
    sta    ram_98                ; 3
    lda    #<PlayerShip          ; 2
    sta    playerShipPtr         ; 3
    lda    #>PlayerShip          ; 2
    sta    playerShipPtr+1       ; 3
    lda    #COL_78               ; 2
    sta    playfieldColor        ; 3
    lda    ram_C6                ; 3
    bpl    LF2B5                 ; 2³
    lda    ram_B8                ; 3
    clc                          ; 2
    adc    #$03                  ; 2
    sta    ram_B8                ; 3
    bpl    LF2CB                 ; 2³
    lda    #$00                  ; 2
    sta    ram_B8                ; 3
LF2B5:
    inc    levelNumber           ; 5
    lda    levelNumber           ; 3
    cmp    #$09                  ; 2
    bcc    LF2C1                 ; 2³
    lda    #$00                  ; 2
    sta    levelNumber           ; 3
LF2C1:
    lda    #$FF                  ; 2
    sta    ram_C6                ; 3
    ldx    #$FF                  ; 2
    txs                          ; 2
    jsr    LFBBF                 ; 6
LF2CB:
    lda    ram_F5                ; 3
    bne    LF315                 ; 2³+1
    lda    ram_F4                ; 3
    bpl    LF2D7                 ; 2³
    lda    ram_B8                ; 3
    bmi    LF2DA                 ; 2³
LF2D7:
    jmp    LF388                 ; 3

LF2DA:
    ldy    ram_8E                ; 3
    lda.wy ram_BD,Y              ; 4
    cmp    #$03                  ; 2
    bne    LF310                 ; 2³+1
    sta    ram_F4                ; 3
    lda    #$50                  ; 2
    sta    ram_D3                ; 3
    lda    #$00                  ; 2
    sta    ram_D4                ; 3
    lda    #$0C                  ; 2
    sta.wy ram_BD,Y              ; 5
    lda    ram_98                ; 3
    cmp    #$4A                  ; 2
    bcs    LF304                 ; 2³+1
    lda    #$9B                  ; 2
    sta.wy ram_98,Y              ; 5
    lda    #$10                  ; 2
    sta.wy ram_D9,Y              ; 5
    bne    LF2D7                 ; 3+1   always branch

LF304:
    lda    #$06                  ; 2
    sta.wy ram_98,Y              ; 5
    lda    #$11                  ; 2
    sta.wy ram_D9,Y              ; 5
    bne    LF2D7                 ; 3+1   always branch

LF310:
    lda    #$00                  ; 2
    sta.wy ram_BD,Y              ; 5
LF315:
    lda    ram_8F                ; 3
    cmp    #$02                  ; 2
    beq    LF31F                 ; 2³
    cmp    #$08                  ; 2
    bne    LF38C                 ; 2³
LF31F:
    inc    ram_F5                ; 5
    lda    ram_CB                ; 3
    bne    LF327                 ; 2³
    inc    playfieldColor        ; 5
LF327:
    lda    ram_F5                ; 3
    tay                          ; 2
    lda    #$0D                  ; 2
    sta    AUDC0                 ; 3
    lda    #$04                  ; 2
    sta    AUDC1                 ; 3
    lda    #$0F                  ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    tya                          ; 2
    eor    #$0F                  ; 2
    sta    AUDF0                 ; 3
    tya                          ; 2
    eor    #$08                  ; 2
    sta    AUDF1                 ; 3
    cpy    #$17                  ; 2
    bcs    LF351                 ; 2³
    lda    DeathSequence,Y       ; 4
    sta    playerShipPtr         ; 3
    lda    #>DeathOne            ; 2
    sta    playerShipPtr+1       ; 3
    bmi    LF38C                 ; 3   always branch

LF351:
    lda    #<PlayerShip          ; 2
    sta    playerShipPtr         ; 3
    lda    #>PlayerShip          ; 2
    sta    playerShipPtr+1       ; 3
    lda    #$00                  ; 2
    sta    ram_D3                ; 3
    sta    ram_F1                ; 3
    sta    ram_F0                ; 3
    sta    ram_CA                ; 3
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    ram_F5                ; 3
    sta    ram_F4                ; 3
    sta    ram_FC                ; 3
    lda    #$0A                  ; 2
    sta    ram_F0                ; 3
    lda    #$4A                  ; 2
    sta    ram_98                ; 3
    lda    ram_CB                ; 3
    bne    LF37D                 ; 2³
    lda    #COL_78               ; 2
    sta    playfieldColor        ; 3
LF37D:
    dec    ram_B9                ; 5
    bpl    LF388                 ; 2³
    ldy    #$00                  ; 2
    sty    ram_B9                ; 3
    iny                          ; 2
    sty    ram_C5                ; 3
LF388:
    lda    #<PlayerShip          ; 2  assuming <PlayerShip
    sta    playerShipPtr         ; 3
LF38C:
    ldy    ram_B9                ; 3
    lda    LFFEB,Y               ; 4
    sec                          ; 2
    sbc    levelNumber           ; 3
    sta    ram_A7                ; 3
    ldx    #$07                  ; 2
LF398:
    lda    ram_F2                ; 3
    and    LFEAD,X               ; 4
    bne    LF3A2                 ; 2³
LF39F:
    jmp    LF430                 ; 3

LF3A2:
    lda    #$B4                  ; 2
    sta    ram_A0,X              ; 4
    lda    ram_F2                ; 3
    eor    LFEAD,X               ; 4
    sta    ram_F2                ; 3
    lda    ram_BE,X              ; 4
    tay                          ; 2
    cmp    #$03                  ; 2
    beq    LF39F                 ; 2³
    cmp    #$0A                  ; 2
    beq    LF3D1                 ; 2³
    lda    ram_B8                ; 3
    bpl    LF3CE                 ; 2³
    inc    numOfEnemysShot       ; 5
    sed                          ; 2
    lda    scoreLow              ; 3
    clc                          ; 2
    adc    LFEB5,Y               ; 4
    sta    scoreLow              ; 3
    lda    scoreHigh             ; 3
    adc    #$00                  ; 2
    sta    scoreHigh             ; 3
    cld                          ; 2
LF3CE:
    jmp    LF40E                 ; 3

LF3D1:
    lda    ram_DA,X              ; 4
    and    #$01                  ; 2
    beq    LF3E9                 ; 2³
    lda    ram_99,X              ; 4
    cmp    #$0E                  ; 2
    bcc    LF430                 ; 2³+1
    cmp    #$55                  ; 2
    bcs    LF3FB                 ; 2³
    sec                          ; 2
    sbc    #$08                  ; 2
    sta    ram_99,X              ; 4
    jmp    LF430                 ; 3

LF3E9:
    lda    ram_99,X              ; 4
    cmp    #$91                  ; 2
    bcs    LF430                 ; 2³+1
    cmp    #$4B                  ; 2
    bcc    LF3FB                 ; 2³
    clc                          ; 2
    adc    #$08                  ; 2
    sta    ram_99,X              ; 4
    jmp    LF430                 ; 3

LF3FB:
    lda    ram_B8                ; 3
    bpl    LF40E                 ; 2³+1
    sed                          ; 2
    lda    scoreLow              ; 3
    clc                          ; 2
    adc    #$05                  ; 2
    sta    scoreLow              ; 3
    lda    scoreHigh             ; 3
    adc    #$00                  ; 2
    sta    scoreHigh             ; 3
    cld                          ; 2
LF40E:
    lda    #$0B                  ; 2
    sta    ram_BE,X              ; 4
    lda    ram_DA,X              ; 4
    and    #$01                  ; 2
    beq    LF424                 ; 2³
    lda    ram_BE,X              ; 4
    cmp    #$55                  ; 2
    bcs    LF430                 ; 2³
    lda    ram_DA,X              ; 4
    eor    #$01                  ; 2
    sta    ram_DA,X              ; 4
LF424:
    lda    ram_99,X              ; 4
    cmp    #$55                  ; 2
    bcc    LF430                 ; 2³
    lda    ram_DA,X              ; 4
    eor    #$01                  ; 2
    sta    ram_DA,X              ; 4
LF430:
    lda    ram_A0,X              ; 4
    beq    LF445                 ; 2³
    clc                          ; 2
    adc    ram_E3,X              ; 4
    sta    ram_A0,X              ; 4
    cmp    #$9E                  ; 2
    bcs    LF441                 ; 2³
    cmp    #$01                  ; 2
    bcs    LF445                 ; 2³
LF441:
    lda    #$00                  ; 2
    sta    ram_A0,X              ; 4
LF445:
    dex                          ; 2
    bmi    LF44B                 ; 2³
    jmp    LF398                 ; 3

LF44B:
    lda    ram_82                ; 3
    clc                          ; 2
    adc    #$18                  ; 2
    sta    ram_82                ; 3
    bpl    LF45B                 ; 2³
    lda    #<LFE6C               ; 2
    sta    ram_D8                ; 3
    jmp    LF45F                 ; 3

LF45B:
    lda    #<LFE79               ; 2
    sta    ram_D8                ; 3
LF45F:
    inc    ram_80                ; 5
    ldx    #$06                  ; 2
LF463:
    lda    ram_BE,X              ; 4
    cmp    #$0B                  ; 2
    bne    LF483                 ; 2³
    lda    ram_99,X              ; 4
    cmp    #$5F                  ; 2
    bcs    LF47D                 ; 2³
    cmp    #$41                  ; 2
    bcc    LF47D                 ; 2³
    lda    #$00                  ; 2
    sta    ram_BE,X              ; 4
    lda    #$A0                  ; 2
    sta    ram_99,X              ; 4
    bmi    LF483                 ; 3   always branch

LF47D:
    lda    ram_DA,X              ; 4
    and    #$0F                  ; 2
    sta    ram_DA,X              ; 4
LF483:
    dex                          ; 2
    bpl    LF463                 ; 2³
    ldx    #$06                  ; 2
LF488:
    lda    ram_DA,X              ; 4
    cmp    #$FF                  ; 2
    beq    LF49C                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_E2                ; 3
    and    ram_80                ; 3
    cmp    ram_E2                ; 3
    bne    LF510                 ; 2³+1
    lda    ram_99,X              ; 4
LF49C:
    beq    LF510                 ; 2³+1
    ldy    ram_BE,X              ; 4
    cpy    #$01                  ; 2
    bne    LF4AA                 ; 2³
    inc    ram_C7                ; 5
    inc    ram_C7                ; 5
    inc    ram_C7                ; 5
LF4AA:
    lda    ram_DA,X              ; 4
    and    #$01                  ; 2
    beq    LF4B8                 ; 2³
    lda    ram_99,X              ; 4
    clc                          ; 2
    adc    ram_C7                ; 3
    jmp    LF4BD                 ; 3

LF4B8:
    lda    ram_99,X              ; 4
    sec                          ; 2
    sbc    ram_C7                ; 3
LF4BD:
    sta    ram_99,X              ; 4
    cpy    #$01                  ; 2
    bne    LF4C9                 ; 2³
    dec    ram_C7                ; 5
    dec    ram_C7                ; 5
    dec    ram_C7                ; 5
LF4C9:
    cmp    #$C8                  ; 2
    bcs    LF500                 ; 2³+1
    cmp    #$9B                  ; 2
    bcs    LF4D5                 ; 2³
    cmp    #$06                  ; 2
    bcs    LF510                 ; 2³+1
LF4D5:
    lda    ram_BE,X              ; 4
    cmp    #$0A                  ; 2
    beq    LF4EF                 ; 2³
    cmp    #$01                  ; 2
    bne    LF4E5                 ; 2³
    lda    #$05                  ; 2
    sta    ram_96                ; 3
    bne    LF4EF                 ; 3   always branch

LF4E5:
    cmp    #$09                  ; 2
    bne    LF500                 ; 2³+1
    lda    #$0A                  ; 2
    sta    ram_BE,X              ; 4
    sta    ram_F1                ; 3
LF4EF:
    lda    ram_DA,X              ; 4
    eor    #$01                  ; 2
    sta    ram_DA,X              ; 4
    lda    ram_F5                ; 3
    beq    LF510                 ; 2³+1
    lda    #$00                  ; 2
    sta    ram_BE,X              ; 4
    jmp    LF510                 ; 3

LF500:
    stx    ram_80                ; 3
    lda    #$00                  ; 2
    sta    ram_99,X              ; 4
    sta    ram_BE,X              ; 4
    ldx    #$FF                  ; 2
    txs                          ; 2
    jsr    LFB43                 ; 6
    ldx    ram_80                ; 3
LF510:
    dex                          ; 2
    bmi    LF516                 ; 2³
    jmp    LF488                 ; 3

LF516:
    inc    ram_BA                ; 5
    bpl    LF54F                 ; 2³
    lda    #$00                  ; 2
    sta    ram_BA                ; 3
    lda    ram_D4                ; 3
    beq    LF53E                 ; 2³
    dec    ram_D4                ; 5
    bne    LF53E                 ; 2³
    ldx    ram_D5                ; 3
    lda    #$01                  ; 2
    sta    ram_BE,X              ; 4
    lda    ram_99,X              ; 4
    cmp    #$50                  ; 2
    bcs    LF53A                 ; 2³
    inc    ram_99,X              ; 6
    lda    #$01                  ; 2
    sta    ram_DA,X              ; 4
    bne    LF53E                 ; 3   always branch

LF53A:
    lda    #$00                  ; 2
    sta    ram_DA,X              ; 4
LF53E:
    lda    ram_CB                ; 3
    beq    LF548                 ; 2³
    lda    #COL_00               ; 2
    sta    playfieldColor        ; 3
    beq    LF54F                 ; 3   always branch

LF548:
    lda    playfieldColor        ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    playfieldColor        ; 3
LF54F:
    lda    ram_B8                ; 3
    bmi    LF556                 ; 2³
    jmp    LF60C                 ; 3

LF556:
    lda    ram_F5                ; 3
    beq    LF55D                 ; 2³
    jmp    LF60C                 ; 3

LF55D:
    lda    ram_D3                ; 3
    beq    LF595                 ; 2³
    asl                          ; 2
    asl                          ; 2
    sta    AUDF0                 ; 3
    eor    #$28                  ; 2
    sta    AUDF1                 ; 3
    lda    #$04                  ; 2
    sta    AUDC0                 ; 3
    lda    #$04                  ; 2
    sta    AUDC1                 ; 3
    lda    #$0F                  ; 2
    sta    AUDV1                 ; 3
    sta    AUDV0                 ; 3

    sed                          ; 2
    lda    scoreLow              ; 3
    clc                          ; 2
    adc    #1                    ; 2
    sta    scoreLow              ; 3
    lda    scoreHigh             ; 3
    adc    #0                    ; 2
    sta    scoreHigh             ; 3
    cld                          ; 2

    dec    ram_D3                ; 5
    bne    LF592                 ; 2³
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
    sta    AUDV0                 ; 3
    inc    ram_D2                ; 5
LF592:
    jmp    LF60C                 ; 3

LF595:
    lda    ram_96                ; 3
    beq    LF5AB                 ; 2³
    sta    AUDF0                 ; 3
    lda    #$0F                  ; 2
    sta    AUDV0                 ; 3
    lda    #$01                  ; 2
    sta    AUDC0                 ; 3
    dec    ram_96                ; 5
    bne    LF5AB                 ; 2³
    lda    #$00                  ; 2
    sta    AUDV0                 ; 3
LF5AB:
    lda    ram_8D                ; 3
    beq    LF5C3                 ; 2³
    eor    #$1F                  ; 2
    sta    AUDF0                 ; 3
    lda    #$0F                  ; 2
    sta    AUDV0                 ; 3
    lda    #$0C                  ; 2
    sta    AUDC0                 ; 3
    dec    ram_8D                ; 5
    bne    LF5C3                 ; 2³
    lda    #$00                  ; 2
    sta    AUDV0                 ; 3
LF5C3:
    lda    ram_F1                ; 3
    beq    LF5DF                 ; 2³
    sta    AUDF1                 ; 3
    lda    #$0F                  ; 2
    sta    AUDV1                 ; 3
    lda    #$04                  ; 2
    sta    AUDC1                 ; 3
    inc    ram_F1                ; 5
    lda    ram_F1                ; 3
    cmp    #$1E                  ; 2
    bne    LF60C                 ; 2³+1
    lda    #$00                  ; 2
    sta    ram_F1                ; 3
    sta    AUDV1                 ; 3
LF5DF:
    lda    ram_F0                ; 3
    beq    LF5F5                 ; 2³
    sta    AUDF1                 ; 3
    lda    #$0F                  ; 2
    sta    AUDV1                 ; 3
    lda    #$08                  ; 2
    sta    AUDC1                 ; 3
    dec    ram_F0                ; 5
    bne    LF5F5                 ; 2³
    lda    #$00                  ; 2
    sta    AUDV1                 ; 3
LF5F5:
    lda    ram_FB                ; 3
    beq    LF60C                 ; 2³+1
    lsr                          ; 2
    sta    AUDF1                 ; 3
    lda    #$0F                  ; 2
    sta    AUDV1                 ; 3
    lda    #$0C                  ; 2
    sta    AUDC1                 ; 3
    dec    ram_FB                ; 5
    bne    LF60C                 ; 2³
    lda    #$00                  ; 2
    sta    AUDV1                 ; 3
LF60C:
    dec    ram_8F                ; 5
    bpl    LF628                 ; 2³
    lda    #$09                  ; 2
    sta    ram_8F                ; 3
    lda    #>SneakerA            ; 2
    sta    ram_F8                ; 3
    lda    ram_F7                ; 3
    cmp    #<SneakerA            ; 2
    bne    LF624                 ; 2³
    lda    #<SneakerB            ; 2
    sta    ram_F7                ; 3
    bne    LF628                 ; 3   always branch

LF624:
    lda    #<SneakerA            ; 2
    sta    ram_F7                ; 3
LF628:
    lda    ram_F5                ; 3
    beq    LF62F                 ; 2³
    jmp    LF72F                 ; 3

LF62F:
    lda    ram_B8                ; 3
    bmi    LF63B                 ; 2³
    lda    ram_94                ; 3
    ldx    #$03                  ; 2
    stx    ram_95                ; 3
    bne    LF645                 ; 3   always branch

LF63B:
    lda    SWCHA                 ; 4
    cmp    #$FF                  ; 2
    bne    LF645                 ; 2³
    jmp    LF6F7                 ; 3

LF645:
    inc    ram_94                ; 5
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$0F                  ; 2
    tay                          ; 2
    and    #$08                  ; 2
    beq    LF674                 ; 2³
    ldx    ram_8E                ; 3
    lda    ram_BD,X              ; 4
    cmp    #$03                  ; 2
    beq    LF660                 ; 2³
    lda    ram_98                ; 3
    cmp    #$4A                  ; 2
    beq    LF66E                 ; 2³
LF660:
    lda    ram_98                ; 3
    cmp    #$90                  ; 2
    bcs    LF66E                 ; 2³
    lda    ram_B8                ; 3
    bpl    LF66E                 ; 2³
    inc    ram_98                ; 5
    inc    ram_98                ; 5
LF66E:
    lda    #FACE_RIGHT           ; 2
    sta    shipDirection         ; 3
    beq    LF699                 ; 3   always branch

LF674:
    tya                          ; 2
    and    #$04                  ; 2
    beq    LF699                 ; 2³
    ldx    ram_8E                ; 3
    lda    ram_BD,X              ; 4
    cmp    #$03                  ; 2
    beq    LF687                 ; 2³
    lda    ram_98                ; 3
    cmp    #$4A                  ; 2
    beq    LF695                 ; 2³
LF687:
    lda    ram_98                ; 3
    cmp    #$08                  ; 2
    bcc    LF695                 ; 2³
    lda    ram_B8                ; 3
    bpl    LF695                 ; 2³
    dec    ram_98                ; 5
    dec    ram_98                ; 5
LF695:
    lda    #FACE_LEFT            ; 2
    sta    shipDirection         ; 3
LF699:
    tya                          ; 2
    and    #$01                  ; 2
    beq    LF6CC                 ; 2³
    inc    ram_95                ; 5
    lda    ram_95                ; 3
    cmp    #$04                  ; 2
    bcc    LF6F7                 ; 2³
    lda    #$00                  ; 2
    sta    ram_95                ; 3
    sta    ram_FC                ; 3
    lda    #$0E                  ; 2
    sta    ram_96                ; 3
    lda    ram_98                ; 3
    cmp    #$46                  ; 2  CannonBall?
    bcc    LF6F7                 ; 2³
    cmp    #$50                  ; 2
    bcs    LF6F7                 ; 2³
    lda    #$4A                  ; 2
    sta    ram_98                ; 3
    inc    ram_8E                ; 5
    lda    ram_8E                ; 3
    cmp    #$07                  ; 2
    bcc    LF6F7                 ; 2³
    lda    #$07                  ; 2
    sta    ram_8E                ; 3
    bpl    LF6F7                 ; 3   always branch

LF6CC:
    tya                          ; 2
    and    #$02                  ; 2
    beq    LF6F7                 ; 2³
    inc    ram_95                ; 5
    lda    ram_95                ; 3
    cmp    #$04                  ; 2
    bcc    LF6F7                 ; 2³
    lda    #$0E                  ; 2
    sta    ram_96                ; 3
    lda    #$00                  ; 2
    sta    ram_95                ; 3
    sta    ram_FC                ; 3
    lda    ram_98                ; 3
    cmp    #$46                  ; 2  CannonBall?
    bcc    LF6F7                 ; 2³
    cmp    #$4F                  ; 2
    bcs    LF6F7                 ; 2³
    lda    #$4A                  ; 2
    sta    ram_98                ; 3
    dec    ram_8E                ; 5
    bne    LF6F7                 ; 2³
    inc    ram_8E                ; 5
LF6F7:
    lda    ram_B8                ; 3
    bpl    LF6FF                 ; 2³
    lda    INPT4                 ; 3
    bmi    LF72F                 ; 2³+1
LF6FF:
    lda    ram_98                ; 3
    cmp    #$4A                  ; 2
    bne    LF72F                 ; 2³
    ldy    ram_8E                ; 3
    inc    ram_94                ; 5
    dey                          ; 2
    lda.wy ram_A0,Y              ; 4
    bne    LF72F                 ; 2³
    lda.wy ram_BE,Y              ; 4
    cmp    #$03                  ; 2
    beq    LF72F                 ; 2³
    lda    #$4E                  ; 2
    sta.wy ram_A0,Y              ; 5
    lda    #$0E                  ; 2
    sta    ram_8D                ; 3
    lda    shipDirection         ; 3
    bne    LF72A                 ; 2³  if FACE_LEFT, branch
    lda    #$04                  ; 2
    sta.wy ram_E3,Y              ; 5
    bpl    LF72F                 ; 3   always branch

LF72A:
    lda    #$FC                  ; 2
    sta.wy ram_E3,Y              ; 5
LF72F:
    ldy    #$0F                  ; 2
LF731:
    lda.wy ram_98,Y              ; 4
    ldx    #$01                  ; 2
LF736:
    cmp    #$0F                  ; 2
    bcc    LF740                 ; 2³
    sec                          ; 2
    sbc    #$0F                  ; 2
    inx                          ; 2
    bne    LF736                 ; 3   always branch

LF740:
    stx    $A8,Y                 ; 4
    tax                          ; 2
    lda    LFFD4,X               ; 4
    ora.wy ram_A8,Y              ; 4
    sta.wy ram_A8,Y              ; 5
    dey                          ; 2
    bpl    LF731                 ; 2³
LF74F:
    lda    INTIM                 ; 4
    bne    LF74F                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    #$07                  ; 2
    sta    ram_81                ; 3
    ldx    #$D4                  ; 2
LF75E:
    sta    WSYNC                 ; 3   Overscan loop
;---------------------------------------
    cpx    #$D4                  ; 2
    beq    LF774                 ; 2³
LF764:
    dex                          ; 2
    beq    LF76A                 ; 2³
    jmp    LF75E                 ; 3

LF76A:
    lda    #$00                  ; 2
    sta    COLUPF                ; 3
    jmp    MainLoop              ; 3

LF771:
    jmp    LF7F4                 ; 3

LF774:
    lda    #$00                  ; 2
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    ram_B8                ; 3
    bmi    LF771                 ; 2³
    lda    playfieldColor        ; 3
    cmp    #COL_78               ; 2
    bcs    LF771                 ; 2³
    sta    HMCLR                 ; 3
    lda    ram_F4                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    #$04                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LF790:
    dex                          ; 2
    bne    LF790                 ; 2³
    nop                          ; 2
    nop                          ; 2
    rol    START,X               ; 7
    nop                          ; 2
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$03                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$07                  ; 2
    sta    ram_8C                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3

LF7B3:
    ldy    ram_8C                ; 3
    lda    TurmoilSix,Y          ; 4
    sta.w  ram_8B                ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    TurmoilFive,Y         ; 4
    tax                          ; 2
    lda    TurmoilOne,Y          ; 4
    nop                          ; 2
    bit    ram_FF                ; 3
    sta    GRP0                  ; 3
    lda    TurmoilTwo,Y          ; 4
    sta.w  GRP1                  ; 4
    lda    TurmoilThree,Y        ; 4
    sta.w  GRP0                  ; 4
    lda    TurmoilFour,Y         ; 4
    ldy.w  ram_8B                ; 4
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_8C                ; 5
    bpl    LF7B3                 ; 2³

    lda    #$00                  ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    jmp    LF898                 ; 3

LF7F4:
    sta    HMCLR                 ; 3
    lda    #$0F                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$00                  ; 2
    sta    REFP0                 ; 3
    ldx    #$04                  ; 2
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    NUSIZ0                ; 3
    sta    REFP1                 ; 3
    bit    ram_FF                ; 3
    bit    ram_FF                ; 3
    nop                          ; 2
    bit    ram_FF                ; 3
LF815:
    dex                          ; 2
    bne    LF815                 ; 2³
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #<Zero+7              ; 2
    sta    ram_8B                ; 3
    lda    #>Zero                ; 2
    sta    ram_8C                ; 3
    lda    #$03                  ; 2
    sta    NUSIZ0                ; 3
    lda    #$01                  ; 2
    sta    NUSIZ1                ; 3
    lda    ram_B8                ; 3
    bmi    LF842                 ; 2³
    lda    playfieldColor        ; 3
    cmp    #COL_B8               ; 2
    bcc    LF842                 ; 2³
    lda    #$38                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    bpl    LF86E                 ; 3   always branch

LF842:
    ldy    ram_85                ; 3
    lda    (ram_8B),Y            ; 5
    tax                          ; 2
    ldy    ram_88                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    lda    (ram_8B),Y            ; 5
    ldy    ram_87                ; 3
    sta    GRP0                  ; 3
    lda    (ram_8B),Y            ; 5
    sta    GRP1                  ; 3
    ldy    ram_86                ; 3
    lda    (ram_8B),Y            ; 5
    sta    ram_E2                ; 3
    ldy    #$00                  ; 2
    lda    (ram_8B),Y            ; 5
    ldy    ram_E2                ; 3
    sty    GRP0                  ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_8B                ; 5
    bpl    LF842                 ; 2³
    bmi    LF898                 ; 3   always branch

LF86E:
    ldy    ram_CF                ; 3
    lda    (ram_8B),Y            ; 5
    tax                          ; 2
    ldy    ram_CC                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    lda    (ram_8B),Y            ; 5
    ldy    ram_CD                ; 3
    sta    GRP0                  ; 3
    lda    (ram_8B),Y            ; 5
    sta    GRP1                  ; 3
    ldy    ram_CE                ; 3
    lda    (ram_8B),Y            ; 5
    sta    ram_E2                ; 3
    ldy    #$00                  ; 2
    lda    (ram_8B),Y            ; 5
    ldy    ram_E2                ; 3
    sty    GRP0                  ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_8B                ; 5
    bpl    LF86E                 ; 2³
LF898:
    lda    #$00                  ; 2
    sta    NUSIZ1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    screenFlag            ; 3
    bne    LF8AB                 ; 2³
    jmp    LF952                 ; 3

LF8AB:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    NUSIZ0                ; 3
    lda    #$08                  ; 2
    sta    ram_FB                ; 3
    lda    #$0F                  ; 2
    sta    COLUP0                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    levelNumber           ; 3
    lda    LevelDisplayNum,Y     ; 4
    sta    ram_8B                ; 3
    lda    #$FE                  ; 2
    sta    ram_8C                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    dec    ram_F7                ; 5
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    inc    ram_F8                ; 5
    ldx    #$90                  ; 2
    ldy    ram_F7                ; 3
    lda    ram_F8                ; 3
    sta    ram_F9                ; 3
    lda    #$C8                  ; 2  draw vertical columns of color scrolling down with playfield
    sta    PF0                   ; 3
    lda    #$3C                  ; 2
    sta    PF1                   ; 3
    lda    #$2C                  ; 2
    sta    PF2                   ; 3
    bit    ram_FF                ; 3
    bit    ram_FF                ; 3
    nop                          ; 2
    sta    RESP1                 ; 3
    sta.w  RESP0                 ; 4
    sta    COLUP1                ; 3
    lda    #$07                  ; 2
    sta    NUSIZ1                ; 3
LF8FA:
    dec    ram_F9                ; 5
    lda    ram_F9                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUPF                ; 3
    dey                          ; 2
    sty    COLUBK                ; 3
    cpx    #$3C                  ; 2
    bne    LF911                 ; 2³
    lda    #$00                  ; 2
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    beq    LF93D                 ; 3   always branch

LF911:
    bcc    LF93D                 ; 2³
    cpx    #$5A                  ; 2
    bcs    LF93D                 ; 2³
    cpx    #$50                  ; 2
    bcc    LF927                 ; 2³
    lda    #$FF                  ; 2
    sta    GRP1                  ; 3
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    COLUP1                ; 3
    beq    LF93D                 ; 3   always branch

LF927:
    cpx    #$48                  ; 2
    bcc    LF939                 ; 2³
    sty    ram_A0                ; 3
    ldy    ram_FB                ; 3
    lda    (ram_8B),Y            ; 5
    sta    GRP0                  ; 3
    dec    ram_FB                ; 5
    ldy    ram_A0                ; 3
    bne    LF93D                 ; 2³
LF939:
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
LF93D:
    dex                          ; 2
    bne    LF8FA                 ; 2³+1
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    COLUPF                ; 3
    stx    COLUBK                ; 3
    stx    NUSIZ1                ; 3
    ldx    #$04                  ; 2
LF94A:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LF94A                 ; 2³
    jmp    LFA31                 ; 3

LF952:
    lda    #$30                  ; 2
    sta    NUSIZ0                ; 3
    lda    ram_A8                ; 3
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    shipDirection         ; 3
    sta    REFP0                 ; 3
    lda    ram_A8                ; 3
    nop                          ; 2
    bit    ram_FF                ; 3
    bit    ram_FF                ; 3
LF96A:
    dex                          ; 2
    bne    LF96A                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    HMP0                  ; 3
LF977:
    ldy    ram_81                ; 3
    lda.wy ram_AF,Y              ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda.wy ram_AF,Y              ; 4
    sta    HMM0                  ; 3
    sta    CXCLR                 ; 3
    lda    playfieldColor        ; 3
    sta    COLUPF                ; 3
LF98C:
    dex                          ; 2
    bne    LF98C                 ; 2³
    sta    RESM0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$FF                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    lda    RowGraphics,Y         ; 4
    sta    PF2                   ; 3
    lda.wy ram_A8,Y              ; 4
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda.wy ram_A8,Y              ; 4
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    bit    ram_FF                ; 3
LF9B1:
    dex                          ; 2
    bne    LF9B1                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda.wy ram_9F,Y              ; 4
    beq    LF9C7                 ; 2³
    lda    #<LFE93               ; 2
    sta    ram_EB                ; 3
    lda    #>LFE93               ; 2
    sta    ram_EC                ; 3
    bmi    LF9CF                 ; 3   always branch

LF9C7:
    lda    #$B6                  ; 2
    sta    ram_EB                ; 3
    lda    #$FC                  ; 2
    sta    ram_EC                ; 3
LF9CF:
    lda.wy ram_BD,Y              ; 4
    tay                          ; 2
    cpy    #$09                  ; 2
    beq    LF9E6                 ; 2³
    cpy    #$0C                  ; 2
    beq    LF9E6                 ; 2³
    cpy    #$0B                  ; 2
    bcc    LF9ED                 ; 2³
    lda    #$8D                  ; 2
    sta    ram_EE                ; 3
    jmp    LF9F1                 ; 3

LF9E6:
    lda    #$7D                  ; 2
    sta    ram_EE                ; 3
    jmp    LF9F1                 ; 3

LF9ED:
    lda    #$9B                  ; 2
    sta    ram_EE                ; 3
LF9F1:
    lda    (ram_D8),Y            ; 5
    sta    ram_BB                ; 3
    ldy    ram_81                ; 3
    lda.wy ram_D9,Y              ; 4
    and    #$01                  ; 2
    bne    LFA04                 ; 2³+1
    lda    #$08                  ; 2
    sta    REFP1                 ; 3
    bpl    LFA08                 ; 3   always branch

LFA04:
    lda    #0                    ; 2
    sta    REFP1                 ; 3
LFA08:
    cpy    ram_8E                ; 3
    beq    LFA16                 ; 2³
    lda    #<BlankGfx            ; 2
    sta    ram_D6                ; 3
    lda    #>BlankGfx            ; 2
    sta    ram_D7                ; 3
    bmi    LFA1E                 ; 3   always branch

LFA16:
    lda    playerShipPtr         ; 3
    sta    ram_D6                ; 3
    lda    playerShipPtr+1       ; 3
    sta    ram_D7                ; 3
LFA1E:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    dec    ram_81                ; 5
    bmi    LFA31                 ; 2³
    jmp    LFB06                 ; 3

LFA31:
    lda    #$00                  ; 2
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    ram_B8                ; 3
    bmi    LFAA5                 ; 2³
    lda    ram_F7                ; 3
    ldy    levelNumber           ; 3
    lda    LevelDisplayNum,Y     ; 4
    sta    ram_8B                ; 3
    lda    #$FE                  ; 2
    sta    ram_8C                ; 3
    lda    #$C5                  ; 2
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    bit    ram_FF                ; 3
    nop                          ; 2
    nop                          ; 2
    bit    ram_FF                ; 3
    bit    ram_FF                ; 3
    bit    ram_FF                ; 3
    bit    ram_FF                ; 3
LFA5D:
    dex                          ; 2
    bne    LFA5D                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
LFA64:
    lda    playfieldColor        ; 3
    cmp    #COL_78               ; 2
    bcc    LFA8A                 ; 2³
    ldy    #$08                  ; 2
LFA6C:
    lda    #$0F                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP0                ; 3
    lda    (ram_8B),Y            ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    LFA6C                 ; 2³
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
LFA81:
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    LFB01                 ; 3

LFA8A:
    ldy    #$09                  ; 2
LFA8C:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ColSneaker,Y               ; 4
    sta    COLUP0                ; 3
    lda    (ram_F7),Y            ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    LFA8C                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    beq    LFA81                 ; 3   always branch

LFAA5:
    lda    #$00                  ; 2
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    ldy    ram_B9                ; 3
    lda    LFE50,Y               ; 4
    sta    ram_8B                ; 3
    lda    LFE5E,Y               ; 4
    sta    ram_8C                ; 3
    lda    LFE57,Y               ; 4
    sta    ram_D6                ; 3
    lda    LFE65,Y               ; 4
    sta    ram_D7                ; 3
    lda    ram_B7                ; 3
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    ram_B9                ; 3
    lda    LFD1A,Y               ; 4
    sta    NUSIZ0                ; 3
    lda    LFD21,Y               ; 4
    sta    NUSIZ1                ; 3
LFAD8:
    dex                          ; 2
    bne    LFAD8                 ; 2³
    sta    RESP0                 ; 3
    nop                          ; 2
    nop                          ; 2
    bit    ram_FF                ; 3
    bit    ram_FF                ; 3
    bit    ram_FF                ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    #$0C                  ; 2
LFAED:
    lda    (ram_8B),Y            ; 5
    ldx    LFD6E,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    stx    COLUP0                ; 3
    stx    COLUP1                ; 3
    lda    (ram_D6),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    bpl    LFAED                 ; 2³+1
LFB01:
    ldx    #$17                  ; 2   Overscan lines
    jmp    LF764                 ; 3

LFB06:
    ldy    #$0E                  ; 2
LFB08:
    lda    (ram_EE),Y            ; 5
    tax                          ; 2
    lda    (ram_D6),Y            ; 5
    sta    ram_E2                ; 3
    lda    (ram_EB),Y            ; 5
    sta    ram_F9                ; 3
    lda    (ram_BB),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    LFD6E,Y               ; 4
    sta    COLUP0                ; 3
    lda    ram_F9                ; 3
    sta    ENAM0                 ; 3
    lda    ram_E2                ; 3
    stx    COLUP1                ; 3
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    LFB08                 ; 2³
    lda    CXPPMM                ; 3
    bpl    LFB33                 ; 2³
    sta    ram_F4                ; 3
    bmi    LFB40                 ; 3   always branch

LFB33:
    lda    CXM0P                 ; 3
    bpl    LFB40                 ; 2³
    ldy    ram_81                ; 3
    lda    ram_F2                ; 3
    ora    LFEAD,Y               ; 4
    sta    ram_F2                ; 3
LFB40:
    jmp    LF977                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFB43; SUBROUTINE X1
    ldx    ram_8E                ; 3
    dex                          ; 2
    lda    ram_99,X              ; 4
    bne    LFB58                 ; 2³
    lda    ram_FC                ; 3
    bpl    LFB58                 ; 2³
    lda    #$19                  ; 2
    sta    ram_FB                ; 3
    lda    #$0C                  ; 2
    sta    ram_FC                ; 3
    bne    LFB78                 ; 3   always branch

LFB58:
    jmp    LFF84                 ; 3

LFB5B:
    lda    ram_94                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    beq    LFB66                 ; 2³
    dex                          ; 2
LFB66:
    lda    ram_99,X              ; 4
    beq    LFB6C                 ; 2³
    ldx    ram_80                ; 3
LFB6C:
    lda    ram_8F                ; 3
    ldy    ram_F5                ; 3
    bne    LFB76                 ; 2³
    ldy    ram_C8                ; 3
    bpl    LFB78                 ; 2³
LFB76:
    lda    #$00                  ; 2
LFB78:
    tay                          ; 2
    sta    ram_BE,X              ; 4
    cmp    #$01                  ; 2
    bne    LFB81                 ; 2³
    inc    ram_BE,X              ; 6
LFB81:
    cmp    #$09                  ; 2
    bne    LFB89                 ; 2³
    lda    #$1E                  ; 2
    sta    ram_F0                ; 3
LFB89:
    lda    ram_93                ; 3
    bpl    LFB98                 ; 2³
    lda    #$9B                  ; 2
    sta    ram_99,X              ; 4
    lda    LFE86,Y               ; 4
    sta    ram_DA,X              ; 4
    bpl    LFBA3                 ; 2³
LFB98:
    lda    #$06                  ; 2
    sta    ram_99,X              ; 4
    lda    #$01                  ; 2
    ora    LFE86,Y               ; 4
    sta    ram_DA,X              ; 4
LFBA3:
    cpy    #$03                  ; 2
    bne    LFBBB                 ; 2³
    lda    ram_D4                ; 3
    bne    LFB76                 ; 2³
    lda    ram_D2                ; 3
    cmp    #$0F                  ; 2
    bcs    LFB76                 ; 2³
    lda    #$02                  ; 2
    sta    ram_D4                ; 3
    stx    ram_D5                ; 3
    lda    #$FF                  ; 2
    sta    ram_DA,X              ; 4
LFBBB:
    lda    ram_80                ; 3
    tax                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBBF; SUBROUTINE x5
    ldy    #$06                  ; 2
    ldx    levelNumber           ; 3
LFBC3:
    lda    LFFB9,X               ; 4
    sta    ram_8B                ; 3
    lda    #>LFD28               ; 2
    sta    ram_8C                ; 3
    lda    (ram_8B),Y            ; 5
    sta.wy ram_99,Y              ; 5
    lda    #$00                  ; 2
    sta.wy ram_DA,Y              ; 5
    lda    LFFC2,X               ; 4
    sta    ram_8B                ; 3
    lda    (ram_8B),Y            ; 5
    sta.wy ram_BE,Y              ; 5
    dey                          ; 2
    bpl    LFBC3                 ; 2³
    lda    LFFCB,X               ; 4
    sta    ram_C7                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



    .byte $00 ; |        | $FBE9  unused?
    .byte $00 ; |        | $FBEA
    .byte $00 ; |        | $FBEB
    .byte $00 ; |        | $FBEC
    .byte $00 ; |        | $FBED
    .byte $00 ; |        | $FBEE
    .byte $00 ; |        | $FBEF
    .byte $00 ; |        | $FBF0
    .byte $00 ; |        | $FBF1
    .byte $70 ; | XXX    | $FBF2
    .byte $70 ; | XXX    | $FBF3
    .byte $47 ; | X   XXX| $FBF4
    .byte $47 ; | X   XXX| $FBF5
    .byte $44 ; | X   X  | $FBF6
    .byte $44 ; | X   X  | $FBF7
    .byte $7C ; | XXXXX  | $FBF8
    .byte $FE ; |XXXXXXX | $FBF9
    .byte $F0 ; |XXXX    | $FBFA
    .byte $E0 ; |XXX     | $FBFB
    .byte $E6 ; |XXX  XX | $FBFC
    .byte $E6 ; |XXX  XX | $FBFD
    .byte $7C ; | XXXXX  | $FBFE
    .byte $38 ; |  XXX   | $FBFF

       ORG $FC00

EnemyShip4_A:
    .byte $00 ; |        | $FC00
    .byte $00 ; |        | $FC01
    .byte $1E ; |   XXXX | $FC02
    .byte $10 ; |   X    | $FC03
    .byte $18 ; |   XX   | $FC04
    .byte $24 ; |  X  X  | $FC05
    .byte $42 ; | X    X | $FC06
    .byte $81 ; |X      X| $FC07
    .byte $42 ; | X    X | $FC08
    .byte $24 ; |  X  X  | $FC09
    .byte $18 ; |   XX   | $FC0A
    .byte $08 ; |    X   | $FC0B
    .byte $78 ; | XXXX   | $FC0C
    .byte $00 ; |        | $FC0D
EnemyShip4_B:
    .byte $00 ; |        | $FC0E
    .byte $00 ; |        | $FC0F
    .byte $78 ; | XXXX   | $FC10
    .byte $08 ; |    X   | $FC11
    .byte $18 ; |   XX   | $FC12
    .byte $3C ; |  XXXX  | $FC13
    .byte $7E ; | XXXXXX | $FC14
    .byte $FF ; |XXXXXXXX| $FC15
    .byte $7E ; | XXXXXX | $FC16
    .byte $3C ; |  XXXX  | $FC17
    .byte $18 ; |   XX   | $FC18
    .byte $10 ; |   X    | $FC19
    .byte $1E ; |   XXXX | $FC1A
EnemyShip3:
    .byte $00 ; |        | $FC1B
    .byte $00 ; |        | $FC1C
    .byte $00 ; |        | $FC1D
    .byte $00 ; |        | $FC1E
    .byte $00 ; |        | $FC1F
    .byte $FF ; |XXXXXXXX| $FC20
    .byte $00 ; |        | $FC21
    .byte $FF ; |XXXXXXXX| $FC22
    .byte $00 ; |        | $FC23
    .byte $FF ; |XXXXXXXX| $FC24
    .byte $00 ; |        | $FC25
    .byte $00 ; |        | $FC26
    .byte $00 ; |        | $FC27
    .byte $00 ; |        | $FC28
    .byte $00 ; |        | $FC29
Tank_A:
    .byte $00 ; |        | $FC2A
    .byte $7E ; | XXXXXX | $FC2B
    .byte $D5 ; |XX X X X| $FC2C
    .byte $AB ; |X X X XX| $FC2D
    .byte $7E ; | XXXXXX | $FC2E
    .byte $18 ; |   XX   | $FC2F
    .byte $F8 ; |XXXXX   | $FC30
    .byte $CF ; |XX  XXXX| $FC31
    .byte $F8 ; |XXXXX   | $FC32
    .byte $18 ; |   XX   | $FC33
    .byte $7E ; | XXXXXX | $FC34
    .byte $AB ; |X X X XX| $FC35
    .byte $D5 ; |XX X X X| $FC36
    .byte $7E ; | XXXXXX | $FC37
Prize:
    .byte $00 ; |        | $FC38
    .byte $00 ; |        | $FC39
    .byte $00 ; |        | $FC3A
    .byte $18 ; |   XX   | $FC3B
    .byte $3C ; |  XXXX  | $FC3C
    .byte $66 ; | XX  XX | $FC3D
    .byte $C3 ; |XX    XX| $FC3E
    .byte $C3 ; |XX    XX| $FC3F
    .byte $C3 ; |XX    XX| $FC40
    .byte $66 ; | XX  XX | $FC41
    .byte $3C ; |  XXXX  | $FC42
    .byte $18 ; |   XX   | $FC43
    .byte $00 ; |        | $FC44
    .byte $00 ; |        | $FC45
CannonBall:
    .byte $00 ; |        | $FC46
    .byte $00 ; |        | $FC47
    .byte $00 ; |        | $FC48
    .byte $00 ; |        | $FC49
    .byte $00 ; |        | $FC4A
    .byte $18 ; |   XX   | $FC4B
    .byte $3C ; |  XXXX  | $FC4C
    .byte $3C ; |  XXXX  | $FC4D
    .byte $3C ; |  XXXX  | $FC4E
    .byte $18 ; |   XX   | $FC4F
    .byte $00 ; |        | $FC50
    .byte $00 ; |        | $FC51
    .byte $00 ; |        | $FC52
    .byte $00 ; |        | $FC53
Tank_B:
    .byte $00 ; |        | $FC54
    .byte $7E ; | XXXXXX | $FC55
    .byte $AB ; |X X X XX| $FC56
    .byte $D5 ; |XX X X X| $FC57
    .byte $7E ; | XXXXXX | $FC58
    .byte $18 ; |   XX   | $FC59
    .byte $F8 ; |XXXXX   | $FC5A
    .byte $CF ; |XX  XXXX| $FC5B
    .byte $F8 ; |XXXXX   | $FC5C
    .byte $18 ; |   XX   | $FC5D
    .byte $7E ; | XXXXXX | $FC5E
    .byte $D5 ; |XX X X X| $FC5F
    .byte $AB ; |X X X XX| $FC60
    .byte $7E ; | XXXXXX | $FC61
EnemyShip2_A:
    .byte $00 ; |        | $FC62
    .byte $00 ; |        | $FC63
    .byte $FF ; |XXXXXXXX| $FC64
    .byte $42 ; | X    X | $FC65
    .byte $24 ; |  X  X  | $FC66
    .byte $18 ; |   XX   | $FC67
    .byte $18 ; |   XX   | $FC68
    .byte $FF ; |XXXXXXXX| $FC69
    .byte $18 ; |   XX   | $FC6A
    .byte $18 ; |   XX   | $FC6B
    .byte $24 ; |  X  X  | $FC6C
    .byte $42 ; | X    X | $FC6D
    .byte $FF ; |XXXXXXXX| $FC6E
    .byte $00 ; |        | $FC6F
EnemyShip2_B:
    .byte $00 ; |        | $FC70
    .byte $00 ; |        | $FC71
    .byte $81 ; |X      X| $FC72
    .byte $C3 ; |XX    XX| $FC73
    .byte $A5 ; |X X  X X| $FC74
    .byte $99 ; |X  XX  X| $FC75
    .byte $99 ; |X  XX  X| $FC76
    .byte $FF ; |XXXXXXXX| $FC77
    .byte $99 ; |X  XX  X| $FC78
    .byte $99 ; |X  XX  X| $FC79
    .byte $A5 ; |X X  X X| $FC7A
    .byte $C3 ; |XX    XX| $FC7B
    .byte $81 ; |X      X| $FC7C
    .byte $00 ; |        | $FC7D
EnemyShip5_A:
    .byte $00 ; |        | $FC7E
    .byte $FE ; |XXXXXXX | $FC7F
    .byte $10 ; |   X    | $FC80
    .byte $10 ; |   X    | $FC81
    .byte $10 ; |   X    | $FC82
    .byte $38 ; |  XXX   | $FC83
    .byte $7C ; | XXXXX  | $FC84
    .byte $6C ; | XX XX  | $FC85
    .byte $7C ; | XXXXX  | $FC86
    .byte $38 ; |  XXX   | $FC87
    .byte $10 ; |   X    | $FC88
    .byte $10 ; |   X    | $FC89
    .byte $10 ; |   X    | $FC8A
    .byte $FE ; |XXXXXXX | $FC8B
EnemyShip5_B:
    .byte $00 ; |        | $FC8C
    .byte $00 ; |        | $FC8D
    .byte $00 ; |        | $FC8E
    .byte $FE ; |XXXXXXX | $FC8F
    .byte $10 ; |   X    | $FC90
    .byte $38 ; |  XXX   | $FC91
    .byte $7C ; | XXXXX  | $FC92
    .byte $6C ; | XX XX  | $FC93
    .byte $7C ; | XXXXX  | $FC94
    .byte $38 ; |  XXX   | $FC95
    .byte $10 ; |   X    | $FC96
    .byte $FE ; |XXXXXXX | $FC97
    .byte $00 ; |        | $FC98
    .byte $00 ; |        | $FC99
EnemyShip1_A:
    .byte $00 ; |        | $FC9A
    .byte $00 ; |        | $FC9B
    .byte $00 ; |        | $FC9C
    .byte $00 ; |        | $FC9D
    .byte $60 ; | XX     | $FC9E
    .byte $78 ; | XXXX   | $FC9F
    .byte $BE ; |X XXXXX | $FCA0
    .byte $71 ; | XXX   X| $FCA1
    .byte $BE ; |X XXXXX | $FCA2
    .byte $78 ; | XXXX   | $FCA3
    .byte $60 ; | XX     | $FCA4
    .byte $00 ; |        | $FCA5
    .byte $00 ; |        | $FCA6
    .byte $00 ; |        | $FCA7
EnemyShip1_B:
    .byte $00 ; |        | $FCA8
    .byte $00 ; |        | $FCA9
    .byte $00 ; |        | $FCAA
    .byte $00 ; |        | $FCAB
    .byte $60 ; | XX     | $FCAC
    .byte $B8 ; |X XXX   | $FCAD
    .byte $7E ; | XXXXXX | $FCAE
    .byte $B1 ; |X XX   X| $FCAF
    .byte $7E ; | XXXXXX | $FCB0
    .byte $B8 ; |X XXX   | $FCB1
    .byte $60 ; | XX     | $FCB2
    .byte $00 ; |        | $FCB3
    .byte $00 ; |        | $FCB4
    .byte $00 ; |        | $FCB5
BlankGfx:
    .byte $00 ; |        | $FCB6
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
Arrow:
    .byte $00 ; |        | $FCC4
    .byte $00 ; |        | $FCC5
    .byte $00 ; |        | $FCC6
    .byte $10 ; |   X    | $FCC7
    .byte $18 ; |   XX   | $FCC8
    .byte $0C ; |    XX  | $FCC9
    .byte $06 ; |     XX | $FCCA
    .byte $FF ; |XXXXXXXX| $FCCB
    .byte $FF ; |XXXXXXXX| $FCCC
    .byte $06 ; |     XX | $FCCD
    .byte $0C ; |    XX  | $FCCE
    .byte $18 ; |   XX   | $FCCF
    .byte $10 ; |   X    | $FCD0
    .byte $00 ; |        | $FCD1
GhostShip:
    .byte $00 ; |        | $FCD2
    .byte $18 ; |   XX   | $FCD3
    .byte $18 ; |   XX   | $FCD4
    .byte $3C ; |  XXXX  | $FCD5
    .byte $7E ; | XXXXXX | $FCD6
    .byte $FF ; |XXXXXXXX| $FCD7
    .byte $00 ; |        | $FCD8
    .byte $00 ; |        | $FCD9
    .byte $00 ; |        | $FCDA
    .byte $FF ; |XXXXXXXX| $FCDB
    .byte $7E ; | XXXXXX | $FCDC
    .byte $3C ; |  XXXX  | $FCDD
    .byte $18 ; |   XX   | $FCDE
    .byte $18 ; |   XX   | $FCDF
Explosion_A:
    .byte $00 ; |        | $FCE0
    .byte $12 ; |   X  X | $FCE1
    .byte $24 ; |  X  X  | $FCE2
    .byte $22 ; |  X   X | $FCE3
    .byte $94 ; |X  X X  | $FCE4
    .byte $FA ; |XXXXX X | $FCE5
    .byte $1D ; |   XXX X| $FCE6
    .byte $38 ; |  XXX   | $FCE7
    .byte $7C ; | XXXXX  | $FCE8
    .byte $9A ; |X  XX X | $FCE9
    .byte $54 ; | X X X  | $FCEA
    .byte $24 ; |  X  X  | $FCEB
    .byte $24 ; |  X  X  | $FCEC
    .byte $62 ; | XX   X | $FCED
Explosion_B:
    .byte $00 ; |        | $FCEE
    .byte $00 ; |        | $FCEF
    .byte $08 ; |    X   | $FCF0
    .byte $44 ; | X   X  | $FCF1
    .byte $69 ; | XX X  X| $FCF2
    .byte $A5 ; |X X  X X| $FCF3
    .byte $DA ; |XX XX X | $FCF4
    .byte $7C ; | XXXXX  | $FCF5
    .byte $1E ; |   XXXX | $FCF6
    .byte $29 ; |  X X  X| $FCF7
    .byte $6B ; | XX X XX| $FCF8
    .byte $58 ; | X XX   | $FCF9
    .byte $50 ; | X X    | $FCFA


    .byte $88 ; |X   X   | $FCFB
    .byte $8A ; |X   X X | $FCFC
    .byte $8A ; |X   X X | $FCFD
    .byte $8A ; |X   X X | $FCFE
    .byte $8A ; |X   X X | $FCFF
    .byte $8A ; |X   X X | $FD00
    .byte $8A ; |X   X X | $FD01
    .byte $8A ; |X   X X | $FD02
    .byte $0F ; |    XXXX| $FD03
    .byte $0F ; |    XXXX| $FD04
    .byte $8A ; |X   X X | $FD05
    .byte $8A ; |X   X X | $FD06
    .byte $8A ; |X   X X | $FD07
    .byte $8A ; |X   X X | $FD08
    .byte $8A ; |X   X X | $FD09
    .byte $00 ; |        | $FD0A
    .byte $00 ; |        | $FD0B
PlayerShip:
    .byte $00 ; |        | $FD0C
    .byte $00 ; |        | $FD0D
    .byte $F8 ; |XXXXX   | $FD0E
    .byte $E0 ; |XXX     | $FD0F
    .byte $F8 ; |XXXXX   | $FD10
    .byte $FE ; |XXXXXXX | $FD11
    .byte $FF ; |XXXXXXXX| $FD12
    .byte $E0 ; |XXX     | $FD13
    .byte $FF ; |XXXXXXXX| $FD14
    .byte $FE ; |XXXXXXX | $FD15
    .byte $F8 ; |XXXXX   | $FD16
    .byte $E0 ; |XXX     | $FD17
    .byte $F8 ; |XXXXX   | $FD18
    .byte $00 ; |        | $FD19
LFD1A:
    .byte $00 ; |        | $FD1A
    .byte $00 ; |        | $FD1B
    .byte $01 ; |       X| $FD1C
    .byte $03 ; |      XX| $FD1D
    .byte $03 ; |      XX| $FD1E
    .byte $03 ; |      XX| $FD1F
    .byte $03 ; |      XX| $FD20
LFD21:
    .byte $00 ; |        | $FD21
    .byte $00 ; |        | $FD22
    .byte $00 ; |        | $FD23
    .byte $00 ; |        | $FD24
    .byte $00 ; |        | $FD25
    .byte $01 ; |       X| $FD26
    .byte $03 ; |      XX| $FD27

LFD28:
    .byte $00 ; |        | $FD28
    .byte $00 ; |        | $FD29
    .byte $00 ; |        | $FD2A
    .byte $40 ; | X      | $FD2B
    .byte $20 ; |  X     | $FD2C
    .byte $10 ; |   X    | $FD2D
    .byte $30 ; |  XX    | $FD2E
LFD2F:
    .byte $00 ; |        | $FD2F
    .byte $00 ; |        | $FD30
    .byte $40 ; | X      | $FD31
    .byte $10 ; |   X    | $FD32
    .byte $30 ; |  XX    | $FD33
    .byte $20 ; |  X     | $FD34
    .byte $38 ; |  XXX   | $FD35
LFD36:
    .byte $00 ; |        | $FD36
    .byte $40 ; | X      | $FD37
    .byte $38 ; |  XXX   | $FD38
    .byte $25 ; |  X  X X| $FD39
    .byte $30 ; |  XX    | $FD3A
    .byte $10 ; |   X    | $FD3B
    .byte $18 ; |   XX   | $FD3C
LFD3D:
    .byte $00 ; |        | $FD3D
    .byte $00 ; |        | $FD3E
    .byte $00 ; |        | $FD3F
    .byte $04 ; |     X  | $FD40
    .byte $05 ; |     X X| $FD41
    .byte $06 ; |     XX | $FD42
    .byte $05 ; |     X X| $FD43
LFD44:
    .byte $00 ; |        | $FD44
    .byte $00 ; |        | $FD45
    .byte $04 ; |     X  | $FD46
    .byte $04 ; |     X  | $FD47
    .byte $05 ; |     X X| $FD48
    .byte $06 ; |     XX | $FD49
    .byte $05 ; |     X X| $FD4A
LFD4B:
    .byte $00 ; |        | $FD4B
    .byte $05 ; |     X X| $FD4C
    .byte $05 ; |     X X| $FD4D
    .byte $06 ; |     XX | $FD4E
    .byte $06 ; |     XX | $FD4F
    .byte $04 ; |     X  | $FD50
    .byte $04 ; |     X  | $FD51
LFD52:
    .byte $23 ; |  X   XX| $FD52
    .byte $28 ; |  X X   | $FD53
    .byte $30 ; |  XX    | $FD54
    .byte $40 ; | X      | $FD55
    .byte $88 ; |X   X   | $FD56
    .byte $8E ; |X   XXX | $FD57
    .byte $80 ; |X       | $FD58
LFD59:
    .byte $04 ; |     X  | $FD59
    .byte $06 ; |     XX | $FD5A
    .byte $05 ; |     X X| $FD5B
    .byte $08 ; |    X   | $FD5C
    .byte $05 ; |     X X| $FD5D
    .byte $05 ; |     X X| $FD5E
    .byte $06 ; |     XX | $FD5F
LFD60:
    .byte $00 ; |        | $FD60
    .byte $00 ; |        | $FD61
    .byte $00 ; |        | $FD62
    .byte $00 ; |        | $FD63
    .byte $20 ; |  X     | $FD64
    .byte $40 ; | X      | $FD65
    .byte $10 ; |   X    | $FD66
LFD67:
    .byte $00 ; |        | $FD67
    .byte $00 ; |        | $FD68
    .byte $00 ; |        | $FD69
    .byte $00 ; |        | $FD6A
    .byte $06 ; |     XX | $FD6B
    .byte $04 ; |     X  | $FD6C
    .byte $03 ; |      XX| $FD6D
LFD6E:
    .byte $00 ; |        | $FD6E
    .byte $25 ; |  X  X X| $FD6F
    .byte $25 ; |  X  X X| $FD70
    .byte $25 ; |  X  X X| $FD71
    .byte $8B ; |X   X XX| $FD72
    .byte $89 ; |X   X  X| $FD73
    .byte $0F ; |    XXXX| $FD74
    .byte $25 ; |  X  X X| $FD75
    .byte $0F ; |    XXXX| $FD76
    .byte $89 ; |X   X  X| $FD77
    .byte $8B ; |X   X XX| $FD78
    .byte $25 ; |  X  X X| $FD79
    .byte $25 ; |  X  X X| $FD7A
    .byte $25 ; |  X  X X| $FD7B
    .byte $00 ; |        | $FD7C
    .byte $0F ; |    XXXX| $FD7D
    .byte $0F ; |    XXXX| $FD7E
    .byte $8A ; |X   X X | $FD7F
    .byte $8A ; |X   X X | $FD80
    .byte $8A ; |X   X X | $FD81
    .byte $8A ; |X   X X | $FD82
    .byte $8A ; |X   X X | $FD83
    .byte $0F ; |    XXXX| $FD84
    .byte $0F ; |    XXXX| $FD85
    .byte $8A ; |X   X X | $FD86
    .byte $8A ; |X   X X | $FD87
    .byte $8A ; |X   X X | $FD88
    .byte $8A ; |X   X X | $FD89
    .byte $0F ; |    XXXX| $FD8A
    .byte $0F ; |    XXXX| $FD8B
    .byte $0F ; |    XXXX| $FD8C

    .byte $00 ; |        | $FD8D
    .byte $2C ; |  X XX  | $FD8E
    .byte $29 ; |  X X  X| $FD8F
    .byte $25 ; |  X  X X| $FD90
    .byte $29 ; |  X X  X| $FD91
    .byte $27 ; |  X  XXX| $FD92
    .byte $2F ; |  X XXXX| $FD93
    .byte $0F ; |    XXXX| $FD94
    .byte $2A ; |  X X X | $FD95
    .byte $2A ; |  X X X | $FD96
    .byte $23 ; |  X   XX| $FD97
    .byte $25 ; |  X  X X| $FD98
    .byte $29 ; |  X X  X| $FD99
    .byte $2C ; |  X XX  | $FD9A
LFD9B:
    .byte $00 ; |        | $FD9B
    .byte $38 ; |  XXX   | $FD9C
    .byte $48 ; | X  X   | $FD9D
    .byte $58 ; | X XX   | $FD9E
    .byte $68 ; | XX X   | $FD9F
    .byte $C8 ; |XX  X   | $FDA0
    .byte $E8 ; |XXX X   | $FDA1
    .byte $25 ; |  X  X X| $FDA2
    .byte $E8 ; |XXX X   | $FDA3
    .byte $C8 ; |XX  X   | $FDA4
    .byte $58 ; | X XX   | $FDA5
    .byte $48 ; | X  X   | $FDA6
    .byte $38 ; |  XXX   | $FDA7
    .byte $28 ; |  X X   | $FDA8

SneakerA:
    .byte $07 ; |     XXX| $FDA9
    .byte $07 ; |     XXX| $FDAA
    .byte $E4 ; |XXX  X  | $FDAB
    .byte $E4 ; |XXX  X  | $FDAC
    .byte $24 ; |  X  X  | $FDAD
    .byte $FF ; |XXXXXXXX| $FDAE
    .byte $DB ; |XX XX XX| $FDAF
    .byte $DB ; |XX XX XX| $FDB0
    .byte $7E ; | XXXXXX | $FDB1
    .byte $3C ; |  XXXX  | $FDB2
SneakerB:
    .byte $E0 ; |XXX     | $FDB3
    .byte $E0 ; |XXX     | $FDB4
    .byte $27 ; |  X  XXX| $FDB5
    .byte $27 ; |  X  XXX| $FDB6
    .byte $24 ; |  X  X  | $FDB7
    .byte $FF ; |XXXXXXXX| $FDB8
    .byte $DB ; |XX XX XX| $FDB9
    .byte $DB ; |XX XX XX| $FDBA
    .byte $7E ; | XXXXXX | $FDBB
    .byte $3C ; |  XXXX  | $FDBC
ColSneaker:
    .byte $0F            ; $FDBD
    .byte $0F            ; $FDBE
    .byte $0F            ; $FDBF
    .byte $0F            ; $FDC0
    .byte $0F            ; $FDC1
    .byte $98            ; $FDC2
    .byte $98            ; $FDC3
    .byte $98            ; $FDC4
    .byte $98            ; $FDC5
    .byte $98            ; $FDC6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unused code? ($FDC7 - $FDFF)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    lda    ram_99                ; 3  similar to "used" routine at LFF84
    ror                          ; 2
    lda    ram_B1                ; 3
    ror                          ; 2
    eor    ram_99                ; 3
    ldx    ram_B1                ; 3
    sta    ram_B1                ; 3
    stx    ram_99                ; 3
    jmp    LFA64                 ; 3

    .byte $70 ; | XXX    | $FDD8  HMxx tab?
    .byte $60 ; | XX     | $FDD9
    .byte $50 ; | X X    | $FDDA
    .byte $40 ; | X      | $FDDB
    .byte $30 ; |  XX    | $FDDC
    .byte $20 ; |  X     | $FDDD
    .byte $10 ; |   X    | $FDDE
    .byte $00 ; |        | $FDDF
    .byte $F0 ; |XXXX    | $FDE0
    .byte $E0 ; |XXX     | $FDE1
    .byte $D0 ; |XX X    | $FDE2
    .byte $C0 ; |XX      | $FDE3
    .byte $B0 ; |X XX    | $FDE4
    .byte $A0 ; |X X     | $FDE5
    .byte $90 ; |X  X    | $FDE6


    .byte $00 ; |        | $FDE7
    .byte $E0 ; |XXX     | $FDE8
    .byte $0E ; |    XXX | $FDE9
    .byte $EE ; |XXX XXX | $FDEA
    .byte $00 ; |        | $FDEB
    .byte $05 ; |     X X| $FDEC
    .byte $06 ; |     XX | $FDED
    .byte $07 ; |     XXX| $FDEE
    .byte $08 ; |    X   | $FDEF
    .byte $35 ; |  XX X X| $FDF0
    .byte $31 ; |  XX   X| $FDF1
    .byte $9E ; |X  XXXX | $FDF2
    .byte $BA ; |X XXX X | $FDF3
    .byte $B0 ; |X XX    | $FDF4
    .byte $A0 ; |X X     | $FDF5
    .byte $90 ; |X  X    | $FDF6
    .byte $00 ; |        | $FDF7
    .byte $E0 ; |XXX     | $FDF8
    .byte $0E ; |    XXX | $FDF9
    .byte $EE ; |XXX XXX | $FDFA
    .byte $00 ; |        | $FDFB
    .byte $05 ; |     X X| $FDFC
    .byte $06 ; |     XX | $FDFD
    .byte $07 ; |     XXX| $FDFE
    .byte $08 ; |    X   | $FDFF

       ORG $FE00

Zero:
    .byte $3E ; |  XXXXX | $FE00
    .byte $63 ; | XX   XX| $FE01
    .byte $63 ; | XX   XX| $FE02
    .byte $63 ; | XX   XX| $FE03
    .byte $63 ; | XX   XX| $FE04
    .byte $63 ; | XX   XX| $FE05
    .byte $63 ; | XX   XX| $FE06
    .byte $3E ; |  XXXXX | $FE07
One:
    .byte $1E ; |   XXXX | $FE08
    .byte $0C ; |    XX  | $FE09
    .byte $0C ; |    XX  | $FE0A
    .byte $0C ; |    XX  | $FE0B
    .byte $0C ; |    XX  | $FE0C
    .byte $0C ; |    XX  | $FE0D
    .byte $1C ; |   XXX  | $FE0E
    .byte $0C ; |    XX  | $FE0F
Two:
    .byte $7F ; | XXXXXXX| $FE10
    .byte $60 ; | XX     | $FE11
    .byte $60 ; | XX     | $FE12
    .byte $3E ; |  XXXXX | $FE13
    .byte $03 ; |      XX| $FE14
    .byte $03 ; |      XX| $FE15
    .byte $43 ; | X    XX| $FE16
    .byte $3E ; |  XXXXX | $FE17
Three:
    .byte $3E ; |  XXXXX | $FE18
    .byte $43 ; | X    XX| $FE19
    .byte $03 ; |      XX| $FE1A
    .byte $03 ; |      XX| $FE1B
    .byte $1E ; |   XXXX | $FE1C
    .byte $03 ; |      XX| $FE1D
    .byte $43 ; | X    XX| $FE1E
    .byte $3E ; |  XXXXX | $FE1F
Four:
    .byte $06 ; |     XX | $FE20
    .byte $06 ; |     XX | $FE21
    .byte $06 ; |     XX | $FE22
    .byte $7F ; | XXXXXXX| $FE23
    .byte $26 ; |  X  XX | $FE24
    .byte $16 ; |   X XX | $FE25
    .byte $0E ; |    XXX | $FE26
    .byte $06 ; |     XX | $FE27
Five:
    .byte $3E ; |  XXXXX | $FE28
    .byte $43 ; | X    XX| $FE29
    .byte $03 ; |      XX| $FE2A
    .byte $03 ; |      XX| $FE2B
    .byte $7E ; | XXXXXX | $FE2C
    .byte $60 ; | XX     | $FE2D
    .byte $60 ; | XX     | $FE2E
    .byte $7F ; | XXXXXXX| $FE2F
Six:
    .byte $3E ; |  XXXXX | $FE30
    .byte $63 ; | XX   XX| $FE31
    .byte $63 ; | XX   XX| $FE32
    .byte $63 ; | XX   XX| $FE33
    .byte $7E ; | XXXXXX | $FE34
    .byte $60 ; | XX     | $FE35
    .byte $60 ; | XX     | $FE36
    .byte $3E ; |  XXXXX | $FE37
Seven:
    .byte $30 ; |  XX    | $FE38
    .byte $30 ; |  XX    | $FE39
    .byte $10 ; |   X    | $FE3A
    .byte $08 ; |    X   | $FE3B
    .byte $04 ; |     X  | $FE3C
    .byte $02 ; |      X | $FE3D
    .byte $41 ; | X     X| $FE3E
    .byte $7F ; | XXXXXXX| $FE3F
Eight:
    .byte $3E ; |  XXXXX | $FE40
    .byte $63 ; | XX   XX| $FE41
    .byte $63 ; | XX   XX| $FE42
    .byte $63 ; | XX   XX| $FE43
    .byte $3E ; |  XXXXX | $FE44
    .byte $63 ; | XX   XX| $FE45
    .byte $63 ; | XX   XX| $FE46
    .byte $3E ; |  XXXXX | $FE47
Nine:
    .byte $3E ; |  XXXXX | $FE48
    .byte $43 ; | X    XX| $FE49
    .byte $03 ; |      XX| $FE4A
    .byte $3F ; |  XXXXXX| $FE4B
    .byte $63 ; | XX   XX| $FE4C
    .byte $63 ; | XX   XX| $FE4D
    .byte $63 ; | XX   XX| $FE4E
    .byte $3E ; |  XXXXX | $FE4F

LFE50:
    .byte <BlankGfx      ; $FE50
    .byte <PlayerShip    ; $FE51
    .byte <PlayerShip    ; $FE52
    .byte <PlayerShip    ; $FE53
    .byte <PlayerShip    ; $FE54  also used for graphics?
    .byte <PlayerShip    ; $FE55
    .byte <PlayerShip    ; $FE56
LFE57:
    .byte <BlankGfx      ; $FE57
    .byte <BlankGfx      ; $FE58
    .byte <BlankGfx      ; $FE59
    .byte <BlankGfx      ; $FE5A
    .byte <PlayerShip    ; $FE5B
    .byte <PlayerShip    ; $FE5C
    .byte <PlayerShip    ; $FE5D
LFE5E:
    .byte >BlankGfx      ; $FE5E
    .byte >PlayerShip    ; $FE5F
    .byte >PlayerShip    ; $FE60
    .byte >PlayerShip    ; $FE61
    .byte >PlayerShip    ; $FE62
    .byte >PlayerShip    ; $FE63
    .byte >PlayerShip    ; $FE64
LFE65:
    .byte >BlankGfx      ; $FE65
    .byte >BlankGfx      ; $FE66
    .byte >BlankGfx      ; $FE67
    .byte >BlankGfx      ; $FE68
    .byte >PlayerShip    ; $FE69
    .byte >PlayerShip    ; $FE6A
    .byte >PlayerShip    ; $FE6B

LFE6C:
    .byte <BlankGfx      ; $FE6C
    .byte <CannonBall    ; $FE6D
    .byte <EnemyShip2_A  ; $FE6E
    .byte <Prize         ; $FE6F
    .byte <EnemyShip5_A  ; $FE70
    .byte <EnemyShip3    ; $FE71
    .byte <EnemyShip1_A  ; $FE72
    .byte <EnemyShip2_A  ; $FE73
    .byte <EnemyShip4_A  ; $FE74
    .byte <Arrow         ; $FE75
    .byte <Tank_A        ; $FE76
    .byte <Explosion_A   ; $FE77
    .byte <GhostShip     ; $FE78
LFE79:
    .byte <BlankGfx      ; $FE79
    .byte <CannonBall    ; $FE7A
    .byte <EnemyShip2_B  ; $FE7B
    .byte <CannonBall    ; $FE7C
    .byte <EnemyShip5_B  ; $FE7D
    .byte <EnemyShip3    ; $FE7E
    .byte <EnemyShip1_B  ; $FE7F
    .byte <EnemyShip2_B  ; $FE80
    .byte <EnemyShip4_B  ; $FE81
    .byte <Arrow         ; $FE82
    .byte <Tank_B        ; $FE83
    .byte <Explosion_B   ; $FE84
    .byte <GhostShip     ; $FE85

LFE86:
    .byte $00 ; |        | $FE86
    .byte $00 ; |        | $FE87
    .byte $70 ; | XXX    | $FE88
    .byte $10 ; |   X    | $FE89
    .byte $30 ; |  XX    | $FE8A
    .byte $70 ; | XXX    | $FE8B
    .byte $00 ; |        | $FE8C
    .byte $10 ; |   X    | $FE8D
    .byte $30 ; |  XX    | $FE8E
    .byte $00 ; |        | $FE8F
    .byte $70 ; | XXX    | $FE90
    .byte $00 ; |        | $FE91
    .byte $00 ; |        | $FE92
LFE93:
    .byte $00 ; |        | $FE93
    .byte $00 ; |        | $FE94
    .byte $00 ; |        | $FE95
    .byte $00 ; |        | $FE96
    .byte $00 ; |        | $FE97
    .byte $00 ; |        | $FE98
    .byte $FF ; |XXXXXXXX| $FE99
    .byte $FF ; |XXXXXXXX| $FE9A
    .byte $FF ; |XXXXXXXX| $FE9B
    .byte $00 ; |        | $FE9C
    .byte $00 ; |        | $FE9D
    .byte $00 ; |        | $FE9E
    .byte $00 ; |        | $FE9F
    .byte $00 ; |        | $FEA0
    .byte $00 ; |        | $FEA1
    .byte $00 ; |        | $FEA2
    .byte $00 ; |        | $FEA3
    .byte $0B ; |    X XX| $FEA4
    .byte $16 ; |   X XX | $FEA5
    .byte $21 ; |  X    X| $FEA6
    .byte $2C ; |  X XX  | $FEA7
    .byte $37 ; |  XX XXX| $FEA8
    .byte $42 ; | X    X | $FEA9
    .byte $4D ; | X  XX X| $FEAA
    .byte $58 ; | X XX   | $FEAB
    .byte $63 ; | XX   XX| $FEAC
LFEAD:
    .byte $01 ; |       X| $FEAD
    .byte $02 ; |      X | $FEAE
    .byte $04 ; |     X  | $FEAF
    .byte $08 ; |    X   | $FEB0
    .byte $10 ; |   X    | $FEB1
    .byte $20 ; |  X     | $FEB2
    .byte $40 ; | X      | $FEB3
    .byte $80 ; |X       | $FEB4
LFEB5:
    .byte $00 ; |        | $FEB5
    .byte $10 ; |   X    | $FEB6
    .byte $02 ; |      X | $FEB7
    .byte $06 ; |     XX | $FEB8
    .byte $06 ; |     XX | $FEB9
    .byte $01 ; |       X| $FEBA
    .byte $03 ; |      XX| $FEBB
    .byte $01 ; |       X| $FEBC
    .byte $04 ; |     X  | $FEBD
    .byte $10 ; |   X    | $FEBE
    .byte $05 ; |     X X| $FEBF
    .byte $00 ; |        | $FEC0
    .byte $08 ; |    X   | $FEC1
LevelDisplayNum:
    .byte <One-1         ; $FEC2
    .byte <Two-1         ; $FEC3
    .byte <Three-1       ; $FEC4
    .byte <Four-1        ; $FEC5
    .byte <Five-1        ; $FEC6
    .byte <Six-1         ; $FEC7
    .byte <Seven-1       ; $FEC8
    .byte <Eight-1       ; $FEC9
    .byte <Nine-1        ; $FECA

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unused code? ($FECB - $FEFF)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $02 ; |      X | $FECB   looks like a key?
    .byte $A7 ; |X X  XXX| $FECC
    .byte $AD ; |X X XX X| $FECD
    .byte $FD ; |XXXXXX X| $FECE
    .byte $07 ; |     XXX| $FECF
    .byte $02 ; |      X | $FED0
    .byte $00 ; |        | $FED1
    .byte $00 ; |        | $FED2

    .byte $30 ; |  XX    | $FED3
    .byte $15 ; |   X X X| $FED4
    .byte $B5 ; |X XX X X| $FED5
    .byte $C5 ; |XX   X X| $FED6
    .byte $95 ; |X  X X X| $FED7
    .byte $E5 ; |XXX  X X| $FED8
    .byte $F5 ; |XXXX X X| $FED9
    .byte $05 ; |     X X| $FEDA
    .byte $A5 ; |X X  X X| $FEDB
    .byte $D5 ; |XX X X X| $FEDC
    .byte $75 ; | XXX X X| $FEDD
    .byte $85 ; |X    X X| $FEDE
    .byte $3C ; |  XXXX  | $FEDF
    .byte $4C ; | X  XX  | $FEE0
    .byte $5C ; | X XXX  | $FEE1
    .byte $6C ; | XX XX  | $FEE2
    .byte $7C ; | XXXXX  | $FEE3
    .byte $8C ; |X   XX  | $FEE4
    .byte $9C ; |X  XXX  | $FEE5
    .byte $AC ; |X X XX  | $FEE6

    .byte $FD ; |XXXXXX X| $FEE7  old pointers, junk code, or minus values?
    .byte $FD ; |XXXXXX X| $FEE8
    .byte $FC ; |XXXXXX  | $FEE9
    .byte $FC ; |XXXXXX  | $FEEA
    .byte $FC ; |XXXXXX  | $FEEB
    .byte $FC ; |XXXXXX  | $FEEC
    .byte $FC ; |XXXXXX  | $FEED
    .byte $FD ; |XXXXXX X| $FEEE
    .byte $FC ; |XXXXXX  | $FEEF
    .byte $FC ; |XXXXXX  | $FEF0
    .byte $FC ; |XXXXXX  | $FEF1
    .byte $FC ; |XXXXXX  | $FEF2
    .byte $FD ; |XXXXXX X| $FEF3
    .byte $FD ; |XXXXXX X| $FEF4
    .byte $FD ; |XXXXXX X| $FEF5
    .byte $FD ; |XXXXXX X| $FEF6
    .byte $FD ; |XXXXXX X| $FEF7
    .byte $FD ; |XXXXXX X| $FEF8
    .byte $FD ; |XXXXXX X| $FEF9
    .byte $FD ; |XXXXXX X| $FEFA

    .byte $01 ; |       X| $FEFB   1
    .byte $00 ; |        | $FEFC   0
    .byte $FF ; |XXXXXXXX| $FEFD  -1
    .byte $01 ; |       X| $FEFE   1
    .byte $FF ; |XXXXXXXX| $FEFF  -1

       ORG $FF00

TurmoilOne:
    .byte $08 ; |    X   | $FF00
    .byte $08 ; |    X   | $FF01
    .byte $08 ; |    X   | $FF02
    .byte $08 ; |    X   | $FF03
    .byte $08 ; |    X   | $FF04
    .byte $08 ; |    X   | $FF05
    .byte $08 ; |    X   | $FF06
    .byte $3E ; |  XXXXX | $FF07
TurmoilTwo:
    .byte $72 ; | XXX  X | $FF08
    .byte $8A ; |X   X X | $FF09
    .byte $8A ; |X   X X | $FF0A
    .byte $8A ; |X   X X | $FF0B
    .byte $8B ; |X   X XX| $FF0C
    .byte $8A ; |X   X X | $FF0D
    .byte $8A ; |X   X X | $FF0E
    .byte $8B ; |X   X XX| $FF0F
TurmoilThree:
    .byte $28 ; |  X X   | $FF10
    .byte $28 ; |  X X   | $FF11
    .byte $48 ; | X  X   | $FF12
    .byte $8A ; |X   X X | $FF13
    .byte $CA ; |XX  X X | $FF14
    .byte $2A ; |  X X X | $FF15
    .byte $2D ; |  X XX X| $FF16
    .byte $C8 ; |XX  X   | $FF17
TurmoilFour:
    .byte $9C ; |X  XXX  | $FF18
    .byte $A2 ; |X X   X | $FF19
    .byte $A2 ; |X X   X | $FF1A
    .byte $A2 ; |X X   X | $FF1B
    .byte $A2 ; |X X   X | $FF1C
    .byte $A2 ; |X X   X | $FF1D
    .byte $A2 ; |X X   X | $FF1E
    .byte $9C ; |X  XXX  | $FF1F
TurmoilFive:
    .byte $FB ; |XXXXX XX| $FF20
    .byte $22 ; |  X   X | $FF21
    .byte $22 ; |  X   X | $FF22
    .byte $22 ; |  X   X | $FF23
    .byte $22 ; |  X   X | $FF24
    .byte $22 ; |  X   X | $FF25
    .byte $22 ; |  X   X | $FF26
    .byte $FA ; |XXXXX X | $FF27
TurmoilSix:
    .byte $E0 ; |XXX     | $FF28
    .byte $00 ; |        | $FF29
    .byte $00 ; |        | $FF2A
    .byte $00 ; |        | $FF2B
    .byte $00 ; |        | $FF2C
    .byte $00 ; |        | $FF2D
    .byte $00 ; |        | $FF2E
    .byte $00 ; |        | $FF2F

DeathOne:
    .byte $00 ; |        | $FF30
    .byte $F8 ; |XXXXX   | $FF31
    .byte $F8 ; |XXXXX   | $FF32
    .byte $E0 ; |XXX     | $FF33
    .byte $F8 ; |XXXXX   | $FF34
    .byte $FC ; |XXXXXX  | $FF35
    .byte $FF ; |XXXXXXXX| $FF36
    .byte $FF ; |XXXXXXXX| $FF37
    .byte $FF ; |XXXXXXXX| $FF38
    .byte $FC ; |XXXXXX  | $FF39
    .byte $F8 ; |XXXXX   | $FF3A
    .byte $E0 ; |XXX     | $FF3B
    .byte $F8 ; |XXXXX   | $FF3C
    .byte $F8 ; |XXXXX   | $FF3D
DeathTwo:
    .byte $00 ; |        | $FF3E
    .byte $00 ; |        | $FF3F
    .byte $F8 ; |XXXXX   | $FF40
    .byte $A0 ; |X X     | $FF41
    .byte $98 ; |X  XX   | $FF42
    .byte $84 ; |X    X  | $FF43
    .byte $AB ; |X X X XX| $FF44
    .byte $80 ; |X       | $FF45
    .byte $AB ; |X X X XX| $FF46
    .byte $84 ; |X    X  | $FF47
    .byte $98 ; |X  XX   | $FF48
    .byte $A0 ; |X X     | $FF49
    .byte $F8 ; |XXXXX   | $FF4A
    .byte $00 ; |        | $FF4B
DeathThree:
    .byte $00 ; |        | $FF4C
    .byte $00 ; |        | $FF4D
    .byte $00 ; |        | $FF4E
    .byte $78 ; | XXXX   | $FF4F
    .byte $50 ; | X X    | $FF50
    .byte $48 ; | X  X   | $FF51
    .byte $66 ; | XX  XX | $FF52
    .byte $57 ; | X X XXX| $FF53
    .byte $66 ; | XX  XX | $FF54
    .byte $48 ; | X  X   | $FF55
    .byte $50 ; | X X    | $FF56
    .byte $78 ; | XXXX   | $FF57
    .byte $00 ; |        | $FF58
    .byte $00 ; |        | $FF59
DeathFour:
    .byte $00 ; |        | $FF5A
    .byte $00 ; |        | $FF5B
    .byte $00 ; |        | $FF5C
    .byte $00 ; |        | $FF5D
    .byte $38 ; |  XXX   | $FF5E
    .byte $30 ; |  XX    | $FF5F
    .byte $2E ; |  X XXX | $FF60
    .byte $20 ; |  X     | $FF61
    .byte $2E ; |  X XXX | $FF62
    .byte $30 ; |  XX    | $FF63
    .byte $38 ; |  XXX   | $FF64
    .byte $00 ; |        | $FF65
    .byte $00 ; |        | $FF66
    .byte $00 ; |        | $FF67
DeathFive:
    .byte $00 ; |        | $FF68
    .byte $00 ; |        | $FF69
    .byte $00 ; |        | $FF6A
    .byte $00 ; |        | $FF6B
    .byte $00 ; |        | $FF6C
    .byte $18 ; |   XX   | $FF6D
    .byte $1C ; |   XXX  | $FF6E
    .byte $1C ; |   XXX  | $FF6F
    .byte $1C ; |   XXX  | $FF70
    .byte $18 ; |   XX   | $FF71
    .byte $00 ; |        | $FF72
    .byte $00 ; |        | $FF73
    .byte $00 ; |        | $FF74
    .byte $00 ; |        | $FF75
DeathSix:
    .byte $00 ; |        | $FF76
    .byte $00 ; |        | $FF77
    .byte $00 ; |        | $FF78
    .byte $00 ; |        | $FF79
    .byte $00 ; |        | $FF7A
    .byte $00 ; |        | $FF7B
    .byte $10 ; |   X    | $FF7C
    .byte $18 ; |   XX   | $FF7D
    .byte $10 ; |   X    | $FF7E
    .byte $00 ; |        | $FF7F
    .byte $00 ; |        | $FF80
    .byte $00 ; |        | $FF81
    .byte $00 ; |        | $FF82
    .byte $00 ; |        | $FF83

LFF84:
    lda    ram_93                ; 3
    ror                          ; 2
    sta    ram_93                ; 3
    lda    ram_94                ; 3
    ror                          ; 2
    eor    ram_93                ; 3
    ldx    ram_94                ; 3
    sta    ram_94                ; 3
    stx    ram_93                ; 3
    jmp    LFB5B                 ; 3

EnemysShotTab:
    .byte $40            ; $FF97  lv 1
    .byte $70            ; $FF98     2
    .byte $90            ; $FF99     3
    .byte $B0            ; $FF9A     4
    .byte $C0            ; $FF9B     5
    .byte $D0            ; $FF9C     6
    .byte $E0            ; $FF9D     7
    .byte $F0            ; $FF9E     8
    .byte $F0            ; $FF9F     9
    .byte $FF            ; $FFA0

DeathSequence:
    .byte <DeathOne      ; $FFA1
    .byte <DeathOne      ; $FFA2
    .byte <DeathOne      ; $FFA3
    .byte <DeathOne      ; $FFA4
    .byte <DeathOne      ; $FFA5
    .byte <DeathOne      ; $FFA6
    .byte <DeathOne      ; $FFA7
    .byte <DeathTwo      ; $FFA8
    .byte <DeathThree    ; $FFA9
    .byte <DeathFour     ; $FFAA
    .byte <DeathFive     ; $FFAB
    .byte <DeathSix      ; $FFAC
    .byte <DeathSix      ; $FFAD
    .byte <DeathSix      ; $FFAE
    .byte <DeathSix      ; $FFAF
    .byte <DeathSix      ; $FFB0
    .byte <DeathSix      ; $FFB1
    .byte <DeathSix      ; $FFB2
    .byte <DeathSix      ; $FFB3
    .byte <DeathSix      ; $FFB4
    .byte <DeathFive     ; $FFB5
    .byte <DeathFour     ; $FFB6
    .byte <DeathThree    ; $FFB7
    .byte <DeathTwo      ; $FFB8

LFFB9:
    .byte <LFD60         ; $FFB9
    .byte <LFD28         ; $FFBA
    .byte <LFD2F         ; $FFBB
    .byte <LFD36         ; $FFBC
    .byte <LFD52         ; $FFBD
    .byte <LFD28         ; $FFBE
    .byte <LFD2F         ; $FFBF
    .byte <LFD36         ; $FFC0
    .byte <LFD52         ; $FFC1
LFFC2:
    .byte <LFD67         ; $FFC2
    .byte <LFD3D         ; $FFC3
    .byte <LFD44         ; $FFC4
    .byte <LFD4B         ; $FFC5
    .byte <LFD59         ; $FFC6
    .byte <LFD3D         ; $FFC7
    .byte <LFD44         ; $FFC8
    .byte <LFD4B         ; $FFC9
    .byte <LFD59         ; $FFCA

LFFCB:
    .byte $01 ; |       X| $FFCB
    .byte $01 ; |       X| $FFCC
    .byte $01 ; |       X| $FFCD
    .byte $01 ; |       X| $FFCE
    .byte $01 ; |       X| $FFCF
    .byte $02 ; |      X | $FFD0
    .byte $02 ; |      X | $FFD1
    .byte $02 ; |      X | $FFD2
    .byte $02 ; |      X | $FFD3

LFFD4:
    .byte LEFT_7         ; $FFD4
    .byte LEFT_6         ; $FFD5
    .byte LEFT_5         ; $FFD6
    .byte LEFT_4         ; $FFD7
    .byte LEFT_3         ; $FFD8
    .byte LEFT_2         ; $FFD9
    .byte LEFT_1         ; $FFDA
    .byte NO_MOTION      ; $FFDB
    .byte RIGHT_1        ; $FFDC
    .byte RIGHT_2        ; $FFDD
    .byte RIGHT_3        ; $FFDE
    .byte RIGHT_4        ; $FFDF
    .byte RIGHT_5        ; $FFE0
    .byte RIGHT_6        ; $FFE1
    .byte RIGHT_7        ; $FFE2

RowGraphics:
    .byte $FF ; |XXXXXXXX| $FFE3   Playfield is reflected
    .byte $3F ; |  XXXXXX| $FFE4
    .byte $3F ; |  XXXXXX| $FFE5
    .byte $3F ; |  XXXXXX| $FFE6
    .byte $3F ; |  XXXXXX| $FFE7
    .byte $3F ; |  XXXXXX| $FFE8
    .byte $3F ; |  XXXXXX| $FFE9
    .byte $FF ; |XXXXXXXX| $FFEA

LFFEB:
    .byte $00 ; |        | $FFEB
    .byte $4A ; | X  X X | $FFEC
    .byte $42 ; | X    X | $FFED
LFFEE:
    .byte $3A ; |  XXX X | $FFEE
    .byte $32 ; |  XX  X | $FFEF
    .byte $2A ; |  X X X | $FFF0
    .byte $22 ; |  X   X | $FFF1
    .byte $DD ; |XX XXX X| $FFF2
    .byte $E2 ; |XXX   X | $FFF3
    .byte $E7 ; |XXX  XXX| $FFF4
    .byte $EC ; |XXX XX  | $FFF5
    .byte $F1 ; |XXXX   X| $FFF6
    .byte $F6 ; |XXXX XX | $FFF7
    .byte $FB ; |XXXXX XX| $FFF8
    .byte $FB ; |XXXXX XX| $FFF9
    .byte $00 ; |        | $FFFA
    .byte $00 ; |        | $FFFB

       ORG $FFFC

    .word START
    .word START
