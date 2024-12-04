; Disassembly of twhome.bin
; Disassembled Sat Jun 21 11:18:13 2008
; Using DiStella v3.0
;
; By Omegamatrix
;
; Command Line: C:\DISTELLA.EXE -pasfctw.cfg twhome.bin
;
; tw.cfg contents:
;
;      ORG 1000
;      CODE 1000 1B8E
;      DATA 1B8F 1BFF
;      GFX 1C00 1C9F
;      CODE 1CA0 1CFE
;      GFX 1CFF 1D68
;      DATA 1D69 1D80
;      GFX 1D81 1DA0
;      DATA 1DA1 1DA4
;      CODE 1DA5 1DFF
;      GFX 1E00 1E68
;      DATA 1E69 1E80
;      CODE 1E81 1EFE
;      GFX 1EFF 1F68
;      DATA 1F69 1F80
;      CODE 1F81 1FC9
;      DATA 1FCA 1FD5
;      CODE 1FD6 1FE6
;      GFX 1FE7 1FFF

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
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;==================================================================================================
;              USER CONSTANTS
;==================================================================================================

;------------------------------------
;              C O L O R S
;------------------------------------
COL_ENEMY_COUNTER  = GREY+16

BLACK              = $00
BROWN              = $46
BLUE               = $D8
GREY               = $0C
PURPLE             = $A6

; values for NUSIZx:
ONE_COPY           = %000
TWO_COPIES         = %001
TWO_WIDE_COPIES    = %010
THREE_COPIES       = %011
DOUBLE_SIZE        = %101
THREE_MED_COPIES   = %110
QUAD_SIZE          = %111

; values for Missile Size (clocks)
ONE_CLOCK          = %00000
MISSILE_TWO        = %10000

;==================================================================================================
;              RAM LOCATIONS
;==================================================================================================
leftDgtEnemy          = $85     ; $85 - $86
rightDgtEnemy         = $87     ; $87 - $88
tankPtr               = $B5     ; $B5 - $B6 shared with num lives disp

enemyTankPtr          = $B8     ; $B8 - $B9
xPosMissile           = $C6
yPosMissile           = $C7
xPosEnemyMissile      = $D3
yPosEnemyMissile      = $D4
reflectPFcolorBK      = $E9
;==================================================================================================
;              MAIN PROGRAM
;==================================================================================================


 
    ORG $1000

    CLD
    LDX    #0
    TXA
.loopClear:
    STA    VSYNC,X
    TXS
    INX
    BNE    .loopClear

    LDA    #32
    STA    TIM64T
    JSR    OneShotRam
    JSR    L1A58
    LDA    #1
    STA    $AB
    STA    reflectPFcolorBK              ; black background start screen
    STA    $CB
    JSR    L1CA0
    JMP    L105A

MainLoop:
    JSR    L1F81              ; 6
    LDA    xPosMissile        ; 3
    LDX    #2                 ; 2
    JSR    CalcHorizPos       ; 6
    LDA    xPosEnemyMissile   ; 3
    LDX    #3                 ; 2
    JSR    CalcHorizPos       ; 6
    LDA    SWCHB              ; 4
    AND    #$02               ; 2
    BNE    L106F              ; 2³
    LDA    $DF                ; 3
    CMP    #$88               ; 2
    BCS    L105A              ; 2³
    LDX    $AB                ; 3
    INX                       ; 2
    CPX    #5                 ; 2
    BCC    L104A              ; 2³
    LDX    #1                 ; 2
L104A:
    STX    $AB                ; 3
L104C:
    LDA    #0                 ; 2
    STA    $B2                ; 3
    STA    AUDV0              ; 3
    STA    AUDV1              ; 3
    LDA    #$88               ; 2
    STA    $DF                ; 3
    BNE    L1080              ; 2³
L105A:
    LDA    #0                 ; 2
    STA    $81                ; 3
    STA    $82                ; 3
    STA    $83                ; 3
    JSR    L1AF7              ; 6
    LDA    $AB                ; 3
    JSR    L1A51              ; 6
    STA    $A7                ; 3
    JMP    L104C              ; 3
L106F:
    LDA    $DF                ; 3
    BEQ    L107D              ; 2³
    CMP    #$80               ; 2
    BCC    L1080              ; 2³
    AND    #$F7               ; 2
    STA    $DF                ; 3
    BCS    L1080              ; 2³
L107D:
    JSR    L15F1              ; 6
L1080:
    LDA    INTIM              ; 4
    BNE    L1080              ; 2³
    STA    CXCLR              ; 3
    LDA    #0                 ; 2
    STA    $BA                ; 3
    STA    $B7                ; 3
    LDA    $BE               ; 3
    STA    tankPtr            ; 3
    LDA    $C5                ; 3
    STA    enemyTankPtr       ; 3
    LDA    #25                ; 2
    STA    TIM64T             ; 4
    JSR    L1A8F              ; 6
    LDA    $C3                ; 3
    LDX    #1                 ; 2
    JSR    CalcHorizPos       ; 6
    LDA    $BC                ; 3
    LDX    #0                 ; 2
    JSR    CalcHorizPos       ; 6
L10AB:
    LDA    INTIM              ; 4
    BNE    L10AB              ; 2³
    STA    WSYNC              ; 3
;--------------------------------------
    STA    HMOVE              ; 3
    STX    REFP0              ; 3
    STX    REFP1              ; 3
    JSR    ClearGraphics      ; 6
    LDA    #1                 ; 2
    STA    $EE                ; 3
    LDA    #$24               ; 2
    STA    $F0                ; 3
    LDA    #$47               ; 2
    STA    $F2                ; 3
    LDA    $E8                ; 3
    CMP    #2                 ; 2
    BCC    L10E3              ; 2³
    BEQ    L10D9              ; 2³
    LDA    #$FF               ; 2
    STA    $EF                ; 3
    STA    $F1                ; 3
    STA    $F3                ; 3
    BNE    L10EB              ; 2³
L10D9:
    LDA    #$FE               ; 2
    STA    $EF                ; 3
    STA    $F1                ; 3
    STA    $F3                ; 3
    BNE    L10EB              ; 2³
L10E3:
    LDA    #$FD               ; 2
    STA    $EF                ; 3
    STA    $F1                ; 3
    STA    $F3                ; 3
L10EB:
    LDY    #$21               ; 2
    STY    $80                ; 3
    LDX    #$7E               ; 2
    LDA    reflectPFcolorBK   ; 3
    STA    COLUBK             ; 3
    STA    CTRLPF             ; 3
    LDA    $E8                ; 3
    CMP    #2                 ; 2
    BCS    L1107              ; 2³+1
    LDA    #$22               ; 2
    STA    $F5                ; 3
    LDA    #PURPLE            ; 2  top of playfield down
    STA    $ED                ; 3
    BNE    L110F              ; 2³
L1107:
    LDA    #0                 ; 2
    STA    $F5                ; 3
    LDA    #BROWN+8           ; 2
    STA    $ED                ; 3
L110F:
    STA    COLUPF             ; 3
    STA    WSYNC              ; 3
    LDA    #$FF               ; 2
    STA    PF0                ; 3
    STA    PF1                ; 3
    STA    PF2                ; 3
    LDA    #MISSILE_TWO       ; 2
    STA    NUSIZ0             ; 3
    STA    NUSIZ1             ; 3
    BNE    L118A              ; 2³
L1123:
    TYA                       ; 2
    JMP    L1135              ; 3
L1127:
    STY    GRP1               ; 3
    JMP    L116F              ; 3
L112C:
    LDY    $B7                ; 3
    BEQ    L1123              ; 2³
    DEY                       ; 2
    LDA    (tankPtr),Y        ; 5
    STY    $B7                ; 3
L1135:
    STA    WSYNC              ; 3
    STA    GRP0               ; 3
    LDY    $80                ; 3
    LDA    ($EE),Y            ; 5
    STA    PF0                ; 3
    LDA    ($F0),Y            ; 5
    STA    PF1                ; 3
    LDA    ($F2),Y            ; 5
    STA    PF2                ; 3
    DEX                       ; 2
    CPX    $BD                ; 3
    BNE    L1150              ; 2³
    LDY    #$08               ; 2
    STY    $B7                ; 3
L1150:
    LDA    #0                 ; 2
    CPX    yPosMissile        ; 3
    BNE    L1158              ; 2³
    LDA    #$FF               ; 2
L1158:
    STA    ENAM0              ; 3
    STA    WSYNC              ; 3
;--------------------------------------
    CPX    $C4                ; 3
    BNE    L1164              ; 2³
    LDY    #8                 ; 2
    STY    $BA                ; 3
L1164:
    LDY    $BA                ; 3
    BEQ    L1127              ; 2³
    DEY                       ; 2
    LDA    (enemyTankPtr),Y   ; 5
    STA    GRP1               ; 3
    STY    $BA                ; 3
L116F:
    LDA    #0                 ; 2
    CPX    yPosEnemyMissile   ; 3
    BNE    L1177              ; 2³
    LDA    #$FF               ; 2
L1177:
    STA    ENAM1              ; 3
    STA    WSYNC              ; 3
;--------------------------------------
    LDY    $B7                ; 3
    BNE    L1183              ; 2³
    TYA                       ; 2
    JMP    L1188              ; 3
L1183:
    DEY                       ; 2
    LDA    (tankPtr),Y        ; 5
    STY    $B7                ; 3
L1188:
    STA    GRP0               ; 3
L118A:
    DEX                       ; 2
    CPX    $BD                ; 3
    BNE    L1193              ; 2³
    LDY    #8                 ; 2
    STY    $B7                ; 3
L1193:
    LDA    #0                 ; 2
    CPX    yPosMissile        ; 3
    BNE    L119B              ; 2³
    LDA    #$FF               ; 2
L119B:
    STA    ENAM0              ; 3
    STA    WSYNC              ; 3
    LDY    $BA                ; 3
    BNE    L11A7              ; 2³
    TYA                       ; 2
    JMP    L11AA              ; 3
L11A7:
    DEY                       ; 2
    LDA    (enemyTankPtr),Y   ; 5
L11AA:
    STA    GRP1               ; 3
    STY    $BA                ; 3
    CPX    $C4                ; 3
    BNE    L11B6              ; 2³
    LDY    #$08               ; 2
    STY    $BA                ; 3
L11B6:
    LDA    #0                 ; 2
    CPX    yPosEnemyMissile   ; 3
    BNE    L11BE              ; 2³
    LDA    #$FF               ; 2
L11BE:
    STA    ENAM1              ; 3
    STA    WSYNC              ; 3
    CLC                       ; 2
    LDA    $ED                ; 3
    ADC    #1                 ; 2    increment obstacle color
    STA    $ED                ; 3
    LDY    $B7                ; 3
    BEQ    L1215              ; 2³+1
    DEY                       ; 2
    LDA    (tankPtr),Y        ; 5
    STY    $B7                ; 3
L11D2:
    STA    GRP0               ; 3
    DEX                       ; 2
    CPX    $BD                ; 3
    BNE    L11DD              ; 2³
    LDY    #8                 ; 2
    STY    $B7                ; 3
L11DD:
    LDA    #0                 ; 2
    CPX    yPosMissile        ; 3
    BNE    L11E5              ; 2³
    LDA    #$FF               ; 2
L11E5:
    STA    ENAM0              ; 3
    LDA    $ED                ; 3
    ORA    $F5                ; 3
    CPX    $C4                ; 3
    BNE    L11F3              ; 2³
    LDY    #8                 ; 2
    STY    $BA                ; 3
L11F3:
    STA    WSYNC              ; 3
    STA    COLUPF             ; 3
    LDY    $BA                ; 3
    BEQ    L1219              ; 2³+1
    DEY                       ; 2
    LDA    (enemyTankPtr),Y   ; 5
    STA    GRP1               ; 3
    STY    $BA                ; 3
L1202:
    LDA    #0                 ; 2
    CPX    yPosEnemyMissile   ; 3
    BNE    L120A              ; 2³
    LDA    #$FF               ; 2
L120A:
    STA    ENAM1              ; 3
    DEC    $80                ; 5
    BMI    L121E              ; 2³
    STA    HMCLR              ; 3
    JMP    L112C              ; 3
L1215:
    TYA                       ; 2
    JMP    L11D2              ; 3
L1219:
    STY    GRP1               ; 3
    JMP    L1202              ; 3
L121E:
    LDA    #BLACK             ; 2    top and bottom of background
    STA    COLUBK             ; 3
    STA    WSYNC              ; 3
;--------------------------------------
    LDA    #$FF               ; 2
    STA    PF0                ; 3
    STA    PF1                ; 3
    STA    PF2                ; 3
    DEC    $C9                ; 5
    LDA    $B2                ; 3
    CMP    #7                 ; 2
    BNE    L123A              ; 2³
    JSR    L19E0              ; 6
    JMP    L12A9              ; 3
L123A:
    STA    WSYNC              ; 3
    STA    WSYNC              ; 3
    LDA    #0                 ; 2
    STA    GRP0               ; 3
    STA    GRP1               ; 3
    STA    WSYNC              ; 3
    STA    WSYNC              ; 3
    STA    REFP0              ; 3
    STA    REFP1              ; 3
    LDA    #THREE_COPIES      ; 2
    STA    NUSIZ0             ; 3
    STA    NUSIZ1             ; 3
    LDA    #GREY              ; 2
    STA    COLUP0             ; 3
    STA    COLUP1             ; 3
    LDY    #$07               ; 2
    STY    VDELP0             ; 3    delay
    STY    VDELP1             ; 3
    LDA    #$10               ; 2
    STA    HMP1               ; 3
    STA    RESP0              ; 3
    STA    RESP1              ; 3
    STA    WSYNC              ; 3
    STA    HMOVE              ; 3
    LDA    #0                 ; 2
    STA    PF0                ; 3
    STA    PF1                ; 3
    STA    PF2                ; 3

.loopLogo:
    STY    $FF                ; 3
    LDA    LogoSix,Y          ; 4
    STA    $FE                ; 3
    STA    WSYNC              ; 3
    LDA    LogoOne,Y          ; 4
    STA.w  $1B                ; 4
    LDA    LogoTwo,Y          ; 4
    STA.w  $1C                ; 4
    LDA    LogoThree,Y        ; 4
    STA.w  $1B                ; 4
    LDA    LogoFive,Y         ; 4
    TAX                       ; 2
    LDA    LogoFour,Y         ; 4
    LDY    $FE                ; 3
    NOP                       ; 2
    STA    GRP1               ; 3
    STX    GRP0               ; 3
    STY    GRP1               ; 3
    STA    GRP0               ; 3
    LDY    $FF                ; 3
    DEY                       ; 2
    BPL    .loopLogo          ; 2³

    INY                       ; 2
    STY    VDELP0             ; 3
    STY    VDELP1             ; 3
L12A9:
    LDA    #32                ; 2
    STA    TIM64T             ; 4
    LDA    $C9                ; 3
    AND    #$07               ; 2
    BEQ    L12B8              ; 2³
    CMP    #4                 ; 2
    BNE    L12BB              ; 2³
L12B8:
    JSR    L191C              ; 6
L12BB:
    LDA    SWCHB              ; 4
    AND    #$01               ; 2
    BEQ    L12C9              ; 2³
    LDA    $DF                ; 3
    BEQ    L12CC              ; 2³
    JMP    L137F              ; 3
L12C9:
    JMP    L1378              ; 3
L12CC:
    JSR    L1DA5              ; 6
    JSR    L1DD0              ; 6
    LDA    $C9                ; 3
    AND    #$07               ; 2
    BNE    L12DE              ; 2³
    JSR    L14F0              ; 6
L12DB:
    JMP    MainLoop           ; 3
L12DE:
    JSR    L15C1              ; 6
    LDA    $C9                ; 3
    AND    #$07               ; 2
    CMP    #1                 ; 2
    BNE    L12F2              ; 2³
    JSR    L1CA0              ; 6
    JSR    L1864              ; 6
    JMP    L12DB              ; 3
L12F2:
    CMP    #$02               ; 2
    BEQ    L12FA              ; 2³
    CMP    #$07               ; 2
    BNE    L1300              ; 2³+1
L12FA:
    JSR    L1864              ; 6
    JMP    L12DB              ; 3
L1300:
    CMP    #3                 ; 2
    BNE    L130D              ; 2³
    JSR    L1A1D              ; 6
    JSR    L14F0              ; 6
    JMP    L12DB              ; 3
L130D:
    CMP    #5                 ; 2
    BNE    L131A              ; 2³
    JSR    L132D              ; 6
    JSR    L1864              ; 6
    JMP    L12DB              ; 3
L131A:
    CMP    #4                 ; 2
    BNE    L1327              ; 2³
    LDA    $AB                ; 3
    CMP    #3                 ; 2
    BCC    L1327              ; 2³
    JSR    L1864              ; 6
L1327:
    JSR    L14F0              ; 6
    JMP    L12DB              ; 3
L132D:
    LDA    $EC                ; 3
    CMP    #7                 ; 2
    BNE    L134B              ; 2³
    LDX    #0                 ; 2
    LDA    $E1                ; 3
    CMP    #2                 ; 2
    BEQ    L133F              ; 2³
    STX    $E2                ; 3
    BNE    L1341              ; 2³
L133F:
    STX    $E3                ; 3
L1341:
    LDA    #$28               ; 2
    STA    $DF                ; 3
    LDA    #1                 ; 2
    STA    reflectPFcolorBK   ; 3
    STA    $EA                ; 3
L134B:
    RTS                       ; 6

L134C:
    LDX    #5                 ; 2
L134E:
    INC    $EC                ; 5
    BEQ    L1357              ; 2³
    DEX                       ; 2
    BNE    L134E              ; 2³
    BEQ    L135E              ; 2³
L1357:
    LDA    #1                 ; 2
    STA    $DF                ; 3
    JSR    L1468              ; 6
L135E:
    JMP    MainLoop           ; 3
L1361:
    INC    $EC                ; 5
    BEQ    L136B              ; 2³
    JSR    L1AF7              ; 6
    JMP    MainLoop           ; 3
L136B:
    LDA    #0                 ; 2
    STA    $DF                ; 3
    JSR    L1468              ; 6
    LDA    #$68               ; 2
    STA    $BE                ; 3
    BNE    L135E              ; 2³
L1378:
    LDA    #$48               ; 2
    STA    $DF                ; 3
    JMP    MainLoop           ; 3
L137F:
    CMP    #1                 ; 2
    BEQ    L13BE              ; 2³
    CMP    #$49               ; 2
    BEQ    L13B8              ; 2³
    CMP    #$48               ; 2
    BEQ    L13AF              ; 2³
    CMP    #$28               ; 2
    BEQ    L134C              ; 2³
    CMP    #$18               ; 2
    BEQ    L1361              ; 2³
    CMP    #$80               ; 2
    BCS    L13AC              ; 2³
    LDA    $C9                ; 3
    AND    #$7F               ; 2
    BNE    L13AC              ; 2³
    LDX    #1                 ; 2
    LDA    $E1                ; 3
    CMP    #1                 ; 2
    BNE    L13A7              ; 2³
    LDX    #2                 ; 2
L13A7:
    STX    $E1                ; 3
    JSR    L1AF7              ; 6
L13AC:
    JMP    MainLoop           ; 3
L13AF:
    JSR    L141E              ; 6
    LDA    #$49               ; 2
    STA    $DF                ; 3
    BNE    L13AC              ; 2³
L13B8:
    JSR    L1453              ; 6
    JMP    MainLoop           ; 3
L13BE:
    LDA    #0                 ; 2
    STA    $DF                ; 3
    LDA    $E1                ; 3
    CMP    #2                 ; 2
    BCS    L13F0              ; 2³
    LDA    $E0                ; 3
    STA    $E4                ; 3
    LDA    $E8                ; 3
    STA    $E5                ; 3
    LDA    $E3                ; 3
    BNE    L13DA              ; 2³
    LDA    $E2                ; 3
    BEQ    L1418              ; 2³+1
    BNE    L1402              ; 2³+1
L13DA:
    LDA    $E6                ; 3
    STA    $E0                ; 3
    STA    $D0                ; 3
    LDA    $E7                ; 3
    STA    $E8                ; 3
    DEC    $E3                ; 5
    LDA    #2                 ; 2
    STA    $E1                ; 3
    JSR    L1A58              ; 6
    JMP    MainLoop           ; 3
L13F0:
    LDA    $E0                ; 3
    STA    $E6                ; 3
    LDA    $E8                ; 3
    STA    $E7                ; 3
    LDA    $E2                ; 3
    BNE    L1402              ; 2³+1
    LDA    $E3                ; 3
    BEQ    L1418              ; 2³
    BNE    L13DA              ; 2³+1
L1402:
    LDA    $E4                ; 3
    STA    $D0                ; 3
    STA    $E0                ; 3
    LDA    $E5                ; 3
    STA    $E8                ; 3
    DEC    $E2                ; 5
    LDA    #1                 ; 2
    STA    $E1                ; 3
    JSR    L1A58              ; 6
L1415:
    JMP    MainLoop           ; 3
L1418:
    LDA    #$40               ; 2
    STA    $DF                ; 3
    BNE    L1415              ; 2³
L141E:
    LDA    #7                 ; 2
    STA    $B2                ; 3
    LDA    #$14               ; 2
    STA    $D0                ; 3
    STA    $E0                ; 3
    STA    $E4                ; 3
    STA    $E6                ; 3
    LDA    #1                 ; 2
    STA    $E5                ; 3
    STA    $E7                ; 3
    STA    $E8                ; 3
    STA    $E1                ; 3
    LDA    #0                 ; 2
    STA    $E3                ; 3
    LDA    $AB                ; 3
    AND    #$01               ; 2
    BNE    L1444              ; 2³
    LDA    #$05               ; 2
    STA    $E3                ; 3
L1444:
    LDA    #4                 ; 2
    STA    $E2                ; 3
    LDA    #$71               ; 2
    STA    reflectPFcolorBK   ; 3
    STA    $EA                ; 3
    LDA    #PURPLE            ; 2  $A6
    STA    $ED                ; 3
    RTS                       ; 6

L1453:
    JSR    L1FD6              ; 6
    LDX    $AB                ; 3
    CPX    #3                 ; 2
    BCC    L1460              ; 2³
    LDX    #$12               ; 2
    BNE    L1462              ; 2³
L1460:
    LDX    #$0A               ; 2
L1462:
    STX    $D2                ; 3
    JSR    L1A58              ; 6
    RTS                       ; 6

L1468 SUBROUTINE
    LDA    #0                 ; 2
    STA    $90                ; 3
    STA    $94                ; 3
    STA    $98                ; 3
    STA    $9C                ; 3
    STA    $8C                ; 3
    RTS                       ; 6

Joystick SUBROUTINE
    LDA    $BC                ; 3
    STA    $C0                ; 3
    LDA    $BD                ; 3
    STA    $C1                ; 3
    LDA    $BE                ; 3
    STA    $C2                ; 3
    LDX    $BC                ; 3
    LDY    $BD                ; 3
    LDA    $E1                ; 3
    CMP    #2                 ; 2
    BNE    .joystickP0        ; 2³
    LDA    SWCHA              ; 4
    ASL                       ; 2
    ASL                       ; 2
    ASL                       ; 2
    ASL                       ; 2
    JMP    JoystickP1         ; 3
.joystickP0:
    LDA    SWCHA              ; 4
JoystickP1:
    ASL                       ; 2
    BCS    .checkLeft         ; 2³
    LDA    $BE                ; 3
    CMP    #<TankRightTwo     ; 2
    BEQ    L14A5              ; 2³
    LDA    #<TankRightTwo     ; 2
    BNE    L14A7              ; 2³
L14A5:
    LDA    #<TankRightOne     ; 2
L14A7:
    STA    $BE                ; 3
    INX                       ; 2
    JMP    .exitJoystick      ; 3
.checkLeft:
    ASL                       ; 2
    BCS    .checkDown         ; 2³
    DEX                       ; 2
    LDA    $BE                ; 3
    CMP    #<TankLeftTwo      ; 2
    BEQ    L14BB              ; 2³
    LDA    #<TankLeftTwo      ; 2
    BNE    L14BD              ; 2³
L14BB:
    LDA    #<TankLeftOne      ; 2
L14BD:
    STA    $BE                ; 3
    BNE    .exitJoystick      ; 2³
.checkDown:
    ASL                       ; 2
    BCS    .checkUp           ; 2³
    DEY                       ; 2
    LDA    $BE                ; 3
    CMP    #<TankDownOne      ; 2
    BEQ    L14CF              ; 2³
    LDA    #<TankDownOne      ; 2
    BNE    L14D1              ; 2³
L14CF:
    LDA    #<TankDownTwo      ; 2
L14D1:
    STA    $BE                ; 3
    BNE    .exitJoystick      ; 2³
.checkUp:
    ASL                       ; 2
    BCS    .exitJoystick      ; 2³
    CPY    #$7C               ; 2
    BCS    .exitJoystick      ; 2³
    INY                       ; 2
    LDA    $BE                ; 3
    CMP    #<TankUpOne        ; 2
    BEQ    L14E7              ; 2³
    LDA    #<TankUpOne        ; 2
    BNE    L14E9              ; 2³
L14E7:
    LDA    #<TankUpTwo        ; 2
L14E9:
    STA    $BE                ; 3
.exitJoystick:
    STX    $BC                ; 3
    STY    $BD                ; 3
    RTS                       ; 6

L14F0 SUBROUTINE
    LDA    $F6                ; 3
    CMP    #$1F               ; 2
    BEQ    L14FC              ; 2³
    LDA    $BE                ; 3
    CMP    #$98               ; 2
    BNE    L1534              ; 2³+1
L14FC:
    JSR    L1DEA              ; 6
    LDA    $84                ; 3
    ORA    #$01               ; 2
    STA    reflectPFcolorBK ; 3
    STA    COLUBK             ; 3
    DEC    $BF                ; 5
    LDA    $BF                ; 3
    BEQ    L150E              ; 2³
    RTS                       ; 6

L150E:
    LDA    $EA                ; 3
    STA    reflectPFcolorBK   ; 3
    LDA    #BLACK+1           ; 2
    STA    COLUBK             ; 3
    LDA    #0                 ; 2
    STA    $BD                ; 3
    STA    $BE                ; 3
    LDA    $F6                ; 3
    CMP    #$1F               ; 2
    BEQ    L152A              ; 2³
    JSR    L17ED              ; 6
    LDA    #1                 ; 2
    STA    $DF                ; 3
    RTS                       ; 6

L152A:
    LDA    #7                 ; 2
    STA    $EC                ; 3
    STA    $F6                ; 3
    JSR    L1639              ; 6
    RTS                       ; 6

L1534:
    LDA.w  $02                ; 4
    AND    #$80               ; 2
    BEQ    L1548              ; 2³
    LDA    $C0                ; 3
    STA    $BC                ; 3
    LDA    $C1                ; 3
    STA    $BD                ; 3
    LDA    $C2                ; 3
    STA    $BE                ; 3
    RTS                       ; 6

L1548:
    JSR    Joystick           ; 6
    LDA.w  $02                ; 4
    AND    #$80               ; 2
    BNE    L1555              ; 2³
    JSR    L1556              ; 6
L1555:
    RTS                       ; 6

L1556:
    LDA    $E1                ; 3
    CMP    #2                 ; 2
    BNE    L1565              ; 2³
    LDA.w  $0D                ; 4
    AND    #$80               ; 2
    BNE    L1591              ; 2³
    BEQ    L156C              ; 2³
L1565:
    LDA.w  $0C                ; 4
    AND    #$80               ; 2
    BNE    L1591              ; 2³
L156C:
    LDA    yPosMissile        ; 3
    BNE    L1591              ; 2³
    LDX    $BC                ; 3
    LDY    $BD                ; 3
    LDA    $BE                ; 3
    CMP    #<TankRightOne     ; 2
    BEQ    L1592              ; 2³
    CMP    #<TankRightTwo     ; 2
    BEQ    L1592              ; 2³
    CMP    #<TankLeftOne      ; 2
    BEQ    L159B              ; 2³
    CMP    #<TankLeftTwo      ; 2
    BEQ    L159B              ; 2³
    CMP    #<TankDownOne      ; 2
    BEQ    L15A4              ; 2³
    CMP    #<TankDownTwo      ; 2
    BEQ    L15A4              ; 2³
    JMP    L15AE              ; 3
L1591:
    RTS                       ; 6

L1592:
    LDA    #1                 ; 2
    INX                       ; 2
    INX                       ; 2
    INX                       ; 2
    INX                       ; 2
    INX                       ; 2
    BNE    L159E              ; 2³
L159B:
    LDA    #2                 ; 2
    DEX                       ; 2
L159E:
    DEY                       ; 2
    DEY                       ; 2
    DEY                       ; 2
    JMP    L15B4              ; 3
L15A4:
    LDA    #3                 ; 2
    DEY                       ; 2
    INX                       ; 2
    INX                       ; 2
    INX                       ; 2
    INX                       ; 2
    JMP    L159E              ; 3
L15AE:
    LDA    #4                 ; 2
    INX                       ; 2
    INX                       ; 2
    INX                       ; 2
    INX                       ; 2
L15B4:
    STA    $C8                ; 3
    STX    xPosMissile        ; 3
    STY    yPosMissile        ; 3
    LDA    #$44               ; 2
    ORA    $DE                ; 3
    STA    $DE                ; 3
    RTS                       ; 6

L15C1 SUBROUTINE
    LDA    NUSIZ0             ; 3
    AND    #$80               ; 2
    BEQ    L15CC              ; 2³
    LDA    #0                 ; 2
    STA    yPosMissile        ; 3
    RTS                       ; 6

L15CC:
    LDX    xPosMissile        ; 3
    LDY    yPosMissile        ; 3
    LDA    yPosMissile        ; 3
    BEQ    L15EC              ; 2³
    LDA    $C8                ; 3
    CMP    #1                 ; 2
    BEQ    L15EB              ; 2³
    CMP    #2                 ; 2
    BEQ    L15E8              ; 2³
    CMP    #3                 ; 2
    BEQ    L15E5              ; 2³
    INY                       ; 2
    BNE    L15EC              ; 2³
L15E5:
    DEY                       ; 2
    BNE    L15EC              ; 2³
L15E8:
    DEX                       ; 2
    BNE    L15EC              ; 2³
L15EB:
    INX                       ; 2
L15EC:
    STX    xPosMissile        ; 3
    STY    yPosMissile        ; 3
    RTS                       ; 6

L15F1:
    LDA    $EC                ; 3
    CMP    #7                 ; 2
    BNE    L15F8              ; 2³
    RTS                       ; 6

L15F8:
    LDA    $F6                ; 3
    CMP    #$1F               ; 2
    BEQ    L1636              ; 2³+1
    LDA    RSYNC              ; 3
    AND    #$80               ; 2
    BNE    L1607              ; 2³
    JMP    L16B0              ; 3
L1607:
    LDX    $CA                ; 3
    LDA    $8D,X              ; 4
    CMP    #<Explosion        ; 2
    BNE    L1612              ; 2³
    JMP    L16CD              ; 3
L1612:
    LDA    $8C,X              ; 4
    BNE    L1619              ; 2³
    JMP    L16DD              ; 3
L1619:
    CMP    #$34               ; 2
    BCS    L1646              ; 2³
    LDA    $8B,X              ; 4
    CMP    #$3E               ; 2
    BCC    L1646              ; 2³
    CMP    #$5C               ; 2
    BCS    L1646              ; 2³
L1627:
    LDA    $F6                ; 3
    CMP    #$1F               ; 2
    BEQ    L1636              ; 2³
    LDA    #$1F               ; 2
    STA    $F6                ; 3
    LDA    #$80               ; 2
    JSR    L1DE0              ; 6
L1636:
    JSR    L14FC              ; 6
L1639:
    LDA    #$4C               ; 2
    STA    $C3                ; 3
    LDA    #$31               ; 2
    STA    $C4                ; 3
    LDA    #$98               ; 2
    STA    $C5                ; 3
    RTS                       ; 6

L1646:
    INC    $CC                ; 5
    LDX    $CA                ; 3
    LDA    $CD                ; 3
    STA    $8B,X              ; 4
    LDA    $CE                ; 3
    STA    $8C,X              ; 4
    LDA    $CC                ; 3
    AND    #$37               ; 2
    CMP    #$37               ; 2
    BNE    L165E              ; 2³
    LDA    #$04               ; 2
    STA    $CC                ; 3
L165E:
    STA    $8E,X              ; 4
    AND    #$03               ; 2
    BEQ    L1686              ; 2³
    LDA    $C9                ; 3
    AND    #$30               ; 2
    BEQ    L1686              ; 2³
    LDA    $8D,X              ; 4
    CMP    #<TankLeftOne      ; 2
    BEQ    L16A4              ; 2³
    CMP    #<TankLeftTwo      ; 2
    BEQ    L16A4              ; 2³
    CMP    #<TankDownOne      ; 2
    BEQ    L16A8              ; 2³
    CMP    #<TankDownTwo      ; 2
    BEQ    L16A8              ; 2³
    CMP    #<TankRightOne     ; 2
    BEQ    L16AC              ; 2³
    CMP    #<TankRightTwo     ; 2
    BEQ    L16AC              ; 2³
    BNE    L16A0              ; 2³
L1686:
    LDA    $8D,X              ; 4
    CMP    #<TankLeftOne      ; 2
    BEQ    L16AC              ; 2³
    CMP    #<TankLeftTwo      ; 2
    BEQ    L16AC              ; 2³
    CMP    #<TankUpOne        ; 2
    BEQ    L16A8              ; 2³
    CMP    #<TankUpTwo        ; 2
    BEQ    L16A8              ; 2³
    CMP    #<TankRightOne     ; 2
    BEQ    L16A4              ; 2³
    CMP    #<TankRightTwo     ; 2
    BEQ    L16A4              ; 2³
L16A0:
    LDA    #<TankLeftOne      ; 2
    BNE    L16AE              ; 2³
L16A4:
    LDA    #<TankDownOne      ; 2
    BNE    L16AE              ; 2³
L16A8:
    LDA    #<TankRightOne     ; 2
    BNE    L16AE              ; 2³
L16AC:
    LDA    #<TankUpOne        ; 2
L16AE:
    STA    $8D,X              ; 4
L16B0:
    INC    $CA                ; 5
    INC    $CA                ; 5
    INC    $CA                ; 5
    INC    $CA                ; 5
    LDA    $CA                ; 3
    CMP    #$14               ; 2
    BEQ    L16C1              ; 2³
    JMP    L16C5              ; 3
L16C1:
    LDA    #0                 ; 2
    STA    $CA                ; 3
L16C5:
    LDX    $CA                ; 3
    LDA    $8D,X              ; 4
    CMP    #<Explosion        ; 2
    BNE    L16DD              ; 2³
L16CD:
    DEC    $8E,X              ; 6
    BEQ    L16D4              ; 2³
    JMP    L17B9              ; 3
L16D4:
    LDA    #0                 ; 2
    STA    $8C,X              ; 4
    STA    $8D,X              ; 4
    JSR    L17D9              ; 6
L16DD:
    LDA    $8C,X              ; 4
    BNE    L16FF              ; 2³
    LDA    $AB                ; 3
    CMP    #3                 ; 2
    BCC    L16F6              ; 2³
    LDA    $BB                ; 3
    BNE    L16F6              ; 2³
    LDA    $E0                ; 3
    CMP    #$0A               ; 2
    BCS    L16F6              ; 2³
    INC    $BB                ; 5
    JMP    L16B0              ; 3
L16F6:
    LDA    #0                 ; 2
    STA    $BB                ; 3
    STA    $CE                ; 3
    STA    $C4                ; 3
    RTS                       ; 6

L16FF:
    LDX    $CA                ; 3
    LDA    $8C,X              ; 4
    STA    $CE                ; 3
    LDA    $8B,X              ; 4
    STA    $CD                ; 3
    LDA    $8C,X              ; 4
    CMP    #$72               ; 2
    BCS    L1715              ; 2³
    CMP    #$70               ; 2
    BCC    L1715              ; 2³
    BCS    L1718              ; 2³
L1715:
    JMP    L172F              ; 3
L1718:
    LDA    $8B,X              ; 4
    CMP    #$24               ; 2
    BCC    L172F              ; 2³
    CMP    #$2A               ; 2
    BCC    L172C              ; 2³
    CMP    #$6C               ; 2
    BCC    L172F              ; 2³
    CMP    #$72               ; 2
    BCC    L172C              ; 2³
    BCS    L172F              ; 2³
L172C:
    JMP    L17B3              ; 3
L172F:
    LDA    $8E,X              ; 4
    BNE    L1736              ; 2³
    JMP    L17AF              ; 3
L1736:
    DEC    $8E,X              ; 6
    LDA    $8D,X              ; 4
    CMP    #<TankLeftOne      ; 2
    BEQ    L1792              ; 2³
    CMP    #<TankLeftTwo      ; 2
    BEQ    L179D              ; 2³
    CMP    #<TankRightOne     ; 2
    BEQ    L17A1              ; 2³
    CMP    #<TankRightTwo     ; 2
    BEQ    L17AB              ; 2³
    CMP    #<TankDownOne      ; 2
    BEQ    L178E              ; 2³
    CMP    #<TankDownTwo      ; 2
    BEQ    L1771              ; 2³
    CMP    #<TankUpOne        ; 2
    BEQ    L176D              ; 2³
    LDA    #<TankUpOne        ; 2
L1758:
    STA    $8D,X              ; 4
    INC    $8C,X              ; 6
    LDA    $8E,X              ; 4
    CMP    #2                 ; 2
    BCS    L176A              ; 2³
    LDA    #$10               ; 2
    STA    $8E,X              ; 4
L1766:
    LDA    #<TankLeftOne      ; 2
    STA    $8D,X              ; 4
L176A:
    JMP    L17B9              ; 3
L176D:
    LDA    #<TankUpTwo        ; 2
    BNE    L1758              ; 2³
L1771:
    LDA    #<TankDownOne      ; 2
L1773:
    STA    $8D,X              ; 4
    DEC    $8C,X              ; 6
    LDA    $8E,X              ; 4
    CMP    #2                 ; 2
    BCS    L178B              ; 2³
    LDA    #$10               ; 2
    STA    $8E,X              ; 4
    LDA    $C9                ; 3
    AND    #$01               ; 2
    BEQ    L1766              ; 2³
    LDA    #<TankRightOne     ; 2
    STA    $8D,X              ; 4
L178B:
    JMP    L17B9              ; 3
L178E:
    LDA    #<TankDownTwo      ; 2
    BNE    L1773              ; 2³
L1792:
    LDA    #<TankLeftTwo      ; 2
L1794:
    STA    $8D,X              ; 4
    DEC    $8B,X              ; 6
    DEC    $8B,X              ; 6
    JMP    L17B9              ; 3
L179D:
    LDA    #<TankLeftOne      ; 2
    BNE    L1794              ; 2³
L17A1:
    LDA    #<TankRightTwo     ; 2
L17A3:
    STA    $8D,X              ; 4
    INC    $8B,X              ; 6
    INC    $8B,X              ; 6
    BNE    L17B9              ; 2³
L17AB:
    LDA    #<TankRightOne     ; 2
    BNE    L17A3              ; 2³
L17AF:
    LDA    #$10               ; 2
    STA    $8E,X              ; 4
L17B3:
    LDA    #<TankDownOne      ; 2
    STA    $8D,X              ; 4
    DEC    $8C,X              ; 6
L17B9:
    LDA    $8C,X              ; 4
    CMP    #$7B               ; 2
    BCC    L17C1              ; 2³
    LDA    #$7B               ; 2
L17C1:
    STA    $C4                ; 3
    LDA    $8B,X              ; 4
    STA    $C3                ; 3
    LDA    $8D,X              ; 4
    STA    $C5                ; 3
    LDA    RSYNC              ; 3
    AND    #$80               ; 2
    BNE    L17D8              ; 2³
    LDA    yPosEnemyMissile   ; 3
    BNE    L17D8              ; 2³
    JSR    L1810              ; 6
L17D8:
    RTS                       ; 6

L17D9:
    DEC    $E0                ; 5
    LDA    $E0                ; 3
    BNE    L180F              ; 2³+1
    LDA    $BE                ; 3
    CMP    #<Explosion        ; 2
    BNE    L17E6              ; 2³
    RTS                       ; 6

L17E6:
    JSR    L17ED              ; 6
    JSR    L1A58              ; 6
    RTS                       ; 6

L17ED:
    LDA    $E0                ; 3
    BNE    L180F              ; 2³+1
    LDA    #$14               ; 2
    STA    $E0                ; 3
    STA    $D0                ; 3
    INC    $E8                ; 5
    LDA    $E8                ; 3
    CMP    #4                 ; 2
    BNE    L1803              ; 2³+1
    LDA    #2                 ; 2
    STA    $E8                ; 3
L1803:
    LDA    $E1                ; 3
    CMP    #2                 ; 2
    BEQ    L180D              ; 2³
    INC    $E2                ; 5
    BNE    L180F              ; 2³
L180D:
    INC    $E3                ; 5
L180F:
    RTS                       ; 6

L1810:
    LDA    $8B,X              ; 4
    STA    $D6                ; 3
    LDA    $8C,X              ; 4
    STA    $D7                ; 3
    LDA    $8D,X              ; 4
    CMP    #<TankRightOne     ; 2
    BEQ    L1834              ; 2³
    CMP    #<TankRightTwo     ; 2
    BEQ    L1834              ; 2³
    CMP    #<TankLeftOne      ; 2
    BEQ    L1843              ; 2³
    CMP    #<TankLeftTwo      ; 2
    BEQ    L1843              ; 2³
    CMP    #<TankDownOne      ; 2
    BEQ    L1847              ; 2³
    CMP    #<TankDownTwo      ; 2
    BEQ    L1847              ; 2³
    BNE    L184B              ; 2³
L1834:
    LDA    #1                 ; 2
L1836:
    INC    $D6                ; 5
    INC    $D6                ; 5
    INC    $D6                ; 5
L183C:
    DEC    $D7                ; 5
    DEC    $D7                ; 5
    JMP    L1853              ; 3
L1843:
    LDA    #2                 ; 2
    BNE    L183C              ; 2³
L1847:
    LDA    #3                 ; 2
    BNE    L1836              ; 2³
L184B:
    LDA    #4                 ; 2
    INC    $D6                ; 5
    INC    $D6                ; 5
    INC    $D6                ; 5
L1853:
    STA    $D5                ; 3
    LDA    $D6                ; 3
    STA    xPosEnemyMissile   ; 3
    LDA    $D7                ; 3
    STA    yPosEnemyMissile   ; 3
    LDA    #$11               ; 2
    ORA    $DE                ; 3
    STA    $DE                ; 3
    RTS                       ; 6

L1864:
    LDA    $EC                ; 3
    CMP    #7                 ; 2
    BNE    L186B              ; 2³
    RTS                       ; 6

L186B:
    LDA    COLUP1             ; 3
    AND    #$40               ; 2
    BEQ    L1877              ; 2³
    LDA    #0                 ; 2
    STA    yPosEnemyMissile   ; 3
    STA    yPosMissile        ; 3
L1877:
    LDA    yPosEnemyMissile   ; 3
    CMP    #$2D               ; 2
    BCC    L1896              ; 2³
    LDA    NUSIZ1             ; 3
    AND    #$80               ; 2
    BEQ    L189B              ; 2³
    LDA    yPosEnemyMissile   ; 3
    CMP    #$34               ; 2
    BCS    L1896              ; 2³
    LDA    xPosEnemyMissile   ; 3
    CMP    #$3E               ; 2
    BCC    L1896              ; 2³
    CMP    #$5C               ; 2
    BCS    L1896              ; 2³
    JMP    L1627              ; 3
L1896:
    LDA    #0                 ; 2
    STA    yPosEnemyMissile   ; 3
    RTS                       ; 6

L189B:
    LDX    xPosEnemyMissile   ; 3
    LDY    yPosEnemyMissile   ; 3
    LDA    yPosEnemyMissile   ; 3
    BEQ    L18BB              ; 2³
    LDA    $D5                ; 3
    CMP    #1                 ; 2
    BEQ    L18BA              ; 2³
    CMP    #2                 ; 2
    BEQ    L18B7              ; 2³
    CMP    #3                 ; 2
    BEQ    L18B4              ; 2³
    INY                       ; 2
    BNE    L18BB              ; 2³
L18B4:
    DEY                       ; 2
    BNE    L18BB              ; 2³
L18B7:
    DEX                       ; 2
    BNE    L18BB              ; 2³
L18BA:
    INX                       ; 2
L18BB:
    STX    xPosEnemyMissile   ; 3
    STY    yPosEnemyMissile   ; 3
    RTS                       ; 6

L18C0:
    AND    #$04               ; 2
    BEQ    L18CE              ; 2³
    LDA    $DE                ; 3
    AND    #$FB               ; 2
    STA    $DE                ; 3
    LDA    #2                 ; 2
    STA    $DC                ; 3
L18CE:
    LDA    #8                 ; 2
    STA    AUDC0              ; 3
    DEC    $DC                ; 5
    BMI    L18E8              ; 2³
    LDX    $DC                ; 3
    LDA    FrequencyZeroTab,X ; 4
    STA    AUDF0              ; 3
    LDA    #$17               ; 2
    STA    AUDV0              ; 3
    LDA    $DE                ; 3
    AND    #$3B               ; 2
    JMP    L1928              ; 3
L18E8:
    LDA    #0                 ; 2
    STA    AUDV0              ; 3
    LDA    $DE                ; 3
    AND    #$BB               ; 2
    STA    $DE                ; 3
    AND    #$3B               ; 2
    JMP    L1928              ; 3
L18F7:
    AND    #$01               ; 2
    BEQ    L1905              ; 2³+1
    LDA    $DE                ; 3
    AND    #$FE               ; 2
    STA    $DE                ; 3
    LDA    #2                 ; 2
    STA    $DD                ; 3
L1905:
    LDA    #8                 ; 2
    STA    AUDC1              ; 3
    DEC    $DD                ; 5
    BPL    L1910              ; 2³
    JMP    L1CF4              ; 3
L1910:
    LDX    $DD                ; 3
    LDA    FrequencyOneTab,X  ; 4
    STA    AUDF1              ; 3
    LDA    #$16               ; 2
    STA    AUDV1              ; 3
    RTS                       ; 6

L191C:
    LDA    $DE                ; 3
    BEQ    L1931              ; 2³
    CMP    #$80               ; 2
    BCS    L1938              ; 2³
L1924:
    CMP    #$40               ; 2
    BCS    L18C0              ; 2³+1
L1928:
    CMP    #$20               ; 2
    BCS    L1990              ; 2³
L192C:
    CMP    #$10               ; 2
    BCS    L18F7              ; 2³+1
    RTS                       ; 6

L1931:
    LDA    #0                 ; 2
    STA    AUDV0              ; 3
    STA    AUDV1              ; 3
    RTS                       ; 6

L1938:
    AND    #$08               ; 2
    BEQ    L194E              ; 2³
    LDA    $DE                ; 3
    AND    #$F7               ; 2
    STA    $DE                ; 3
    LDA    #4                 ; 2
    STA    $DC                ; 3
    LDA    #$0A               ; 2
    STA    $F4                ; 3
    LDA    #$FF               ; 2
    STA    $DA                ; 3
L194E:
    LDA    #8                 ; 2
    STA    AUDC0              ; 3
    LDX    $DC                ; 3
    LDA    $DA                ; 3
    CMP    VolumeZeroTab,X    ; 4
    BCC    L1969              ; 2³
    DEX                       ; 2
    BMI    L1974              ; 2³
    STX    $DC                ; 3
    LDA    VolumeZeroTab,X    ; 4
    STA    AUDV0              ; 3
    LDA    #$15               ; 2
    STA    $DA                ; 3
L1969:
    STA    AUDF0              ; 3
    INC    $DA                ; 5
    LDA    $DE                ; 3
    AND    #$37               ; 2
    JMP    L1928              ; 3
L1974:
    LDA    $F4                ; 3
    STA    AUDV0              ; 3
    ORA    #$10               ; 2
    STA    AUDF0              ; 3
    DEC    $F4                ; 5
    BMI    L1989              ; 2³
    LDA    $DE                ; 3
    AND    #$33               ; 2
    STA    $DE                ; 3
    JMP    L1928              ; 3
L1989:
    LDA    $DE                ; 3
    AND    #$77               ; 2
    JMP    L1924              ; 3
L1990:
    AND    #$02               ; 2
    BEQ    L19A6              ; 2³
    LDA    $DE                ; 3
    AND    #$FD               ; 2
    STA    $DE                ; 3
    LDA    #4                 ; 2
    STA    $DD                ; 3
    LDA    #$0D               ; 2
    STA    $F4                ; 3
    LDA    #$FF               ; 2
    STA    $DB                ; 3
L19A6:
    LDA    #8                 ; 2
    STA    AUDC1              ; 3
    LDX    $DD                ; 3
    LDA    $DB                ; 3
    CMP    VolumeOneTab,X     ; 4
    BCC    L19C1              ; 2³
    DEX                       ; 2
    BMI    L19C6              ; 2³
    STX    $DD                ; 3
    LDA    VolumeOneTab,X     ; 4
    STA    AUDV1              ; 3
    LDA    #$14               ; 2
    STA    $DB                ; 3
L19C1:
    STA    AUDF1              ; 3
    INC    $DB                ; 5
    RTS                       ; 6

L19C6:
    LDA    $F4                ; 3
    STA    AUDV1              ; 3
    ORA    #$10               ; 2
    STA    AUDF1              ; 3
    DEC    $F4                ; 5
    BMI    L19D9              ; 2³
    LDA    $DE                ; 3
    AND    #$DD               ; 2
    STA    $DE                ; 3
    RTS                       ; 6

L19D9:
    LDA    $DE                ; 3
    AND    #$11               ; 2
    JMP    L192C              ; 3
L19E0:
    LDA    #$48               ; 2        x position left digit tanks remaining
    LDX    #0                 ; 2
    JSR    CalcHorizPos       ; 6
    LDA    #0                 ; 2
    STA    GRP0               ; 3
    STA    GRP1               ; 3
    LDA    #$50               ; 2        x position right digit tanks remaining
    LDX    #1                 ; 2
    JSR    CalcHorizPos       ; 6
    STA    WSYNC              ; 3
;--------------------------------------
    STA    HMOVE              ; 3
    LDA    #0                 ; 2
    STA    PF0                ; 3
    STA    PF1                ; 3
    STA    PF2                ; 3
    JSR    ClearGraphics      ; 6
    LDA    #COL_ENEMY_COUNTER ; 2
    STA    COLUP0             ; 3
    STA    COLUP1             ; 3
    LDY    #7                 ; 2
L1A0B:
    STA    WSYNC              ; 3
;--------------------------------------
    LDA    (leftDgtEnemy),Y   ; 5
    STA    GRP0               ; 3
    LDA    (rightDgtEnemy),Y  ; 5
    STA    GRP1               ; 3
    STA    HMCLR              ; 3
    DEY                       ; 2
    BPL    L1A0B              ; 2³
    STA    WSYNC              ; 3
    RTS                       ; 6

L1A1D:
    LDA    $B2                ; 3
    CMP    #7                 ; 2
    BNE    L1A50              ; 2³
    DEC    $8A                ; 5
    BNE    L1A2B              ; 2³
    LDA    #7                 ; 2
    STA    $8A                ; 3
L1A2B:
    LDA    $E0                ; 3
    CMP    #$14               ; 2
    BCC    L1A35              ; 2³
    LDA    #$20               ; 2
    BNE    L1A3C              ; 2³
L1A35:
    CMP    #$0A               ; 2
    BCC    L1A3C              ; 2³
    CLC                       ; 2
    ADC    #6                 ; 2
L1A3C:
    STA    $89                ; 3
    LSR                       ; 2
    LSR                       ; 2
    LSR                       ; 2
    LSR                       ; 2
    JSR    L1A51              ; 6
    STA    leftDgtEnemy       ; 3
    LDA    $89                ; 3
    AND    #$0F               ; 2
    JSR    L1A51              ; 6
    STA    rightDgtEnemy      ; 3
L1A50:
    RTS                       ; 6

L1A51:
    ASL                       ; 2
    ASL                       ; 2
    ASL                       ; 2
    CLC                       ; 2
    ADC    #8                 ; 2
    RTS                       ; 6

L1A58 SUBROUTINE
    LDA    #0                 ; 2
    STA    $C4                ; 3
    STA    yPosMissile        ; 3
    STA    yPosEnemyMissile   ; 3
    STA    $DE                ; 3
    LDA    #$4C               ; 2
    STA    $BC                ; 3
    LDA    #$2A               ; 2
    STA    $BD                ; 3
    JSR    L1468              ; 6
    JSR    L1E81              ; 6
    LDA    #$61               ; 2
    STA    $89                ; 3
    LDA    #1                 ; 2
    STA    $8A                ; 3
    LDA    $E8                ; 3
    CMP    #2                 ; 2
    BEQ    L1A84              ; 2³
    BCS    L1A88              ; 2³
    LDA    #$71               ; 2
    BNE    L1A8A              ; 2³
L1A84:
    LDA    #$A1               ; 2
    BNE    L1A8A              ; 2³
L1A88:
    LDA    #1                 ; 2
L1A8A:
    STA    reflectPFcolorBK   ; 3
    STA    $EA                ; 3
    RTS                       ; 6

L1A8F:
    LDA    #$28               ; 2
    LDX    #0                 ; 2
    JSR    CalcHorizPos       ; 6
    LDA    #$58               ; 2
    LDX    #1                 ; 2
    JSR    CalcHorizPos       ; 6
    STA    WSYNC              ; 3
;--------------------------------------
    STA    HMOVE              ; 3
    LDX    #GREY+14           ; 2  $1A
    LDA    $E1                ; 3
    CMP    #2                 ; 2
    BCC    L1AAB              ; 2³
    LDX    #PURPLE            ; 2  $A6
L1AAB:
    STX    COLUP0             ; 3
    STX    COLUP1             ; 3
    LDA    #THREE_COPIES      ; 2
    STA    NUSIZ0             ; 3
    LDA    #TWO_COPIES        ; 2
    STA    NUSIZ1             ; 3
    LDY    #7                 ; 2
L1AB9:
    STA    WSYNC              ; 3
;--------------------------------------
    STA    HMCLR              ; 3
    LDA    ($9F),Y            ; 5
    STA.w  $1B                ; 4
    LDA    ($A5),Y            ; 5
    STA    GRP1               ; 3
    LDA    ($A1),Y            ; 5
    LDA    ($A1),Y            ; 5
    LDA    ($A1),Y            ; 5
    STA    GRP0               ; 3
    LDA    ($A3),Y            ; 5
    STA    GRP0               ; 3
    NOP                       ; 2
    LDA    ($A7),Y            ; 5
    STA    GRP1               ; 3
    STA    GRP1               ; 3
    DEY                       ; 2
    BNE    L1AB9              ; 2³
    LDA    #0                 ; 2
    STA    GRP0               ; 3
    STA    GRP1               ; 3
    LDA    $E8                ; 3
    CMP    #2                 ; 2
    BEQ    L1AEE              ; 2³
    BCS    L1AF2              ; 2³
    LDA    #BROWN             ; 2  $46
    BNE    L1AF4              ; 2³
L1AEE:
    LDA    #BLUE              ; 2  $D8
    BNE    L1AF4              ; 2³
L1AF2:
    LDA    #BROWN             ; 2  $46
L1AF4:
    STA    COLUP1             ; 3
    RTS                       ; 6

L1AF7:
    LDX    #2                 ; 2
    LDY    #8                 ; 2
L1AFB:
    LDA    $81,X              ; 4
    AND    #$F0               ; 2
    LSR                       ; 2
    ADC    #8                 ; 2
    STA.wy $9F,Y              ; 5
    LDA    $81,X              ; 4
    AND    #$0F               ; 2
    JSR    L1A51              ; 6
    STA.wy $A1,Y              ; 5
    LDA    #$FC               ; 2
    STA.wy $A0,Y              ; 5
    STA.wy $A2,Y              ; 5
    DEY                       ; 2
    DEY                       ; 2
    DEY                       ; 2
    DEY                       ; 2
    DEX                       ; 2
    BPL    L1AFB              ; 2³+1
    LDA    $E1                ; 3
    CMP    #1                 ; 2
    BEQ    L1B30              ; 2³
    LDA    $A5                ; 3
    STA    $9F                ; 3
    LDA    $A7                ; 3
    STA    $A1                ; 3
    LDA    $A9                ; 3
    STA    $A3                ; 3
L1B30:
    LDA    #8                 ; 2
    STA    $A5                ; 3
    STA    $A7                ; 3
    LDX    #0                 ; 2
    LDA    #8                 ; 2
    CMP    $9F                ; 3
    BNE    L1B52              ; 2³
    STX    $9F                ; 3
    CMP    $A1                ; 3
    BNE    L1B52              ; 2³
    STX    $A1                ; 3
    CMP    $A3                ; 3
    BNE    L1B52              ; 2³
    STX    $A3                ; 3
    CMP    $A5                ; 3
    BNE    L1B52              ; 2³
    STX    $A5                ; 3
L1B52:
    RTS                       ; 6

L1B53 SUBROUTINE
    LDA    $AC                ; 3
    CLC                       ; 2
    LDX    #2                 ; 2
    SED                       ; 2
L1B59:
    ADC    $81,X              ; 4
    STA    $81,X              ; 4
    LDA    #0                 ; 2
    DEX                       ; 2
    BNE    L1B59              ; 2³
    CLD                       ; 2
    LDA    $AD                ; 3
    CLC                       ; 2
    LDX    #1                 ; 2
    SED                       ; 2
L1B69:
    ADC    $AE,X              ; 4
    STA    $AE,X              ; 4
    STA    $B0,X              ; 4
    LDA    #0                 ; 2
    DEX                       ; 2
    BPL    L1B69              ; 2³
    CLD                       ; 2
    LDX    #4                 ; 2
L1B77:
    CLC                       ; 2
    ASL    $B1                ; 5
    ROL    $B0                ; 5
    DEX                       ; 2
    BNE    L1B77              ; 2³
    LDA    $B0                ; 3
    STA    $81                ; 3
    LDA    $82                ; 3
    AND    #$0F               ; 2
    ORA    $B1                ; 3
    STA    $82                ; 3
    JSR    L1AF7              ; 6
    RTS                       ; 6

L1B8F:
    .byte $C5,$90,$B0,$B7,$D6,$C2,$C5,$A5,$D3,$80,$A0,$85,$C2,$CC,$B1,$C4
    .byte $C0,$A0,$A5,$B7,$A0,$C2,$C1,$9E,$A0,$F0,$A0,$A0,$B8,$A0,$A9,$A0
    .byte $85,$A0,$C5,$B3,$A0,$8A,$A0,$A8,$A0,$C8,$FF,$A0,$A0,$A0,$A0,$A0
    .byte $A6,$B7,$B1,$B8,$A0,$97,$A0,$98,$B8,$A0,$FF,$B0,$97,$B8,$A0,$A0
    .byte $A0,$A9,$A0,$85,$B8,$90,$B8,$C4,$A5,$D3,$92,$A0,$A0,$C2,$CC,$B1
    .byte $CC,$A5,$A0,$D6,$A0,$A0,$C2,$C1,$83,$A0,$F0,$A0,$A0,$B8,$A0,$85
    .byte $A0,$85,$A0,$A4,$A0,$A0,$8A,$A0,$88,$A0,$F4,$FF,$CC,$A0,$A0,$A0
    .byte $B9
Blank:
    .byte %00000000 ; |        | $1C00
    .byte %00000000 ; |        | $1C01
    .byte %00000000 ; |        | $1C02
    .byte %00000000 ; |        | $1C03
    .byte %00000000 ; |        | $1C04
    .byte %00000000 ; |        | $1C05
    .byte %00000000 ; |        | $1C06
    .byte %00000000 ; |        | $1C07
Zero:
    .byte %00000000 ; |        | $1C08
    .byte %00111100 ; |  XXXX  | $1C09
    .byte %01100110 ; | XX  XX | $1C0A
    .byte %01100110 ; | XX  XX | $1C0B
    .byte %01100110 ; | XX  XX | $1C0C
    .byte %01100110 ; | XX  XX | $1C0D
    .byte %01100110 ; | XX  XX | $1C0E
    .byte %00111100 ; |  XXXX  | $1C0F
One:
    .byte %00000000 ; |        | $1C10
    .byte %00111100 ; |  XXXX  | $1C11
    .byte %00011000 ; |   XX   | $1C12
    .byte %00011000 ; |   XX   | $1C13
    .byte %00011000 ; |   XX   | $1C14
    .byte %00011000 ; |   XX   | $1C15
    .byte %00111000 ; |  XXX   | $1C16
    .byte %00011000 ; |   XX   | $1C17
Two:
    .byte %00000000 ; |        | $1C18
    .byte %01111110 ; | XXXXXX | $1C19
    .byte %01100000 ; | XX     | $1C1A
    .byte %01100000 ; | XX     | $1C1B
    .byte %00111100 ; |  XXXX  | $1C1C
    .byte %00000110 ; |     XX | $1C1D
    .byte %01000110 ; | X   XX | $1C1E
    .byte %00111100 ; |  XXXX  | $1C1F
Three:
    .byte %00000000 ; |        | $1C20
    .byte %00111100 ; |  XXXX  | $1C21
    .byte %01000110 ; | X   XX | $1C22
    .byte %00000110 ; |     XX | $1C23
    .byte %00011100 ; |   XXX  | $1C24
    .byte %00000110 ; |     XX | $1C25
    .byte %01000110 ; | X   XX | $1C26
    .byte %00111100 ; |  XXXX  | $1C27
Four:
    .byte %00000000 ; |        | $1C28
    .byte %00001100 ; |    XX  | $1C29
    .byte %00001100 ; |    XX  | $1C2A
    .byte %01111110 ; | XXXXXX | $1C2B
    .byte %01101100 ; | XX XX  | $1C2C
    .byte %00111100 ; |  XXXX  | $1C2D
    .byte %00011100 ; |   XXX  | $1C2E
    .byte %00001100 ; |    XX  | $1C2F
Five:
    .byte %00000000 ; |        | $1C30
    .byte %01111100 ; | XXXXX  | $1C31
    .byte %00000110 ; |     XX | $1C32
    .byte %00000110 ; |     XX | $1C33
    .byte %01111100 ; | XXXXX  | $1C34
    .byte %01100000 ; | XX     | $1C35
    .byte %01100000 ; | XX     | $1C36
    .byte %01111110 ; | XXXXXX | $1C37
Six:
    .byte %00000000 ; |        | $1C38
    .byte %00111100 ; |  XXXX  | $1C39
    .byte %01100110 ; | XX  XX | $1C3A
    .byte %01100110 ; | XX  XX | $1C3B
    .byte %01111100 ; | XXXXX  | $1C3C
    .byte %01100000 ; | XX     | $1C3D
    .byte %01100010 ; | XX   X | $1C3E
    .byte %00111100 ; |  XXXX  | $1C3F
Seven:
    .byte %00000000 ; |        | $1C40
    .byte %00011000 ; |   XX   | $1C41
    .byte %00011000 ; |   XX   | $1C42
    .byte %00011000 ; |   XX   | $1C43
    .byte %00001100 ; |    XX  | $1C44
    .byte %00000110 ; |     XX | $1C45
    .byte %01100110 ; | XX  XX | $1C46
    .byte %01111110 ; | XXXXXX | $1C47
Eight:
    .byte %00000000 ; |        | $1C48
    .byte %00111100 ; |  XXXX  | $1C49
    .byte %01100110 ; | XX  XX | $1C4A
    .byte %01100110 ; | XX  XX | $1C4B
    .byte %00111100 ; |  XXXX  | $1C4C
    .byte %01100110 ; | XX  XX | $1C4D
    .byte %01100110 ; | XX  XX | $1C4E
    .byte %00111100 ; |  XXXX  | $1C4F
Nine:
    .byte %00000000 ; |        | $1C50
    .byte %00111100 ; |  XXXX  | $1C51
    .byte %01000110 ; | X   XX | $1C52
    .byte %00000110 ; |     XX | $1C53
    .byte %00111110 ; |  XXXXX | $1C54
    .byte %01100110 ; | XX  XX | $1C55
    .byte %01100110 ; | XX  XX | $1C56
    .byte %00111100 ; |  XXXX  | $1C57
TankLeftOne:
    .byte %00000000 ; |        | $1C58
    .byte %00000000 ; |        | $1C59
    .byte %00000000 ; |        | $1C5A
    .byte %11001101 ; |XX  XX X| $1C5B
    .byte %00111011 ; |  XXX XX| $1C5C
    .byte %11110111 ; |XXXX XXX| $1C5D
    .byte %00111011 ; |  XXX XX| $1C5E
    .byte %11001101 ; |XX  XX X| $1C5F
TankRightOne:
    .byte %00000000 ; |        | $1C60
    .byte %00000000 ; |        | $1C61
    .byte %00000000 ; |        | $1C62
    .byte %10110011 ; |X XX  XX| $1C63
    .byte %11011100 ; |XX XXX  | $1C64
    .byte %11101111 ; |XXX XXXX| $1C65
    .byte %11011100 ; |XX XXX  | $1C66
    .byte %10110011 ; |X XX  XX| $1C67
TankUpOne:
    .byte %00000000 ; |        | $1C68
    .byte %00000000 ; |        | $1C69
    .byte %00000000 ; |        | $1C6A
    .byte %11111111 ; |XXXXXXXX| $1C6B
    .byte %01101110 ; | XX XXX | $1C6C
    .byte %11011011 ; |XX XX XX| $1C6D
    .byte %01111110 ; | XXXXXX | $1C6E
    .byte %10011001 ; |X  XX  X| $1C6F
TankDownOne:
    .byte %00000000 ; |        | $1C70
    .byte %00000000 ; |        | $1C71
    .byte %00000000 ; |        | $1C72
    .byte %10011001 ; |X  XX  X| $1C73
    .byte %01111110 ; | XXXXXX | $1C74
    .byte %11011011 ; |XX XX XX| $1C75
    .byte %01101110 ; | XX XXX | $1C76
    .byte %11111111 ; |XXXXXXXX| $1C77
TankLeftTwo:
    .byte %00000000 ; |        | $1C78
    .byte %00000000 ; |        | $1C79
    .byte %00000000 ; |        | $1C7A
    .byte %11001101 ; |XX  XX X| $1C7B
    .byte %00110110 ; |  XX XX | $1C7C
    .byte %11111010 ; |XXXXX X | $1C7D
    .byte %00110110 ; |  XX XX | $1C7E
    .byte %11001101 ; |XX  XX X| $1C7F
TankRightTwo:
    .byte %00000000 ; |        | $1C80
    .byte %00000000 ; |        | $1C81
    .byte %00000000 ; |        | $1C82
    .byte %10110011 ; |X XX  XX| $1C83
    .byte %01101100 ; | XX XX  | $1C84
    .byte %01011111 ; | X XXXXX| $1C85
    .byte %01101100 ; | XX XX  | $1C86
    .byte %10110011 ; |X XX  XX| $1C87
TankUpTwo:
    .byte %00000000 ; |        | $1C88
    .byte %00000000 ; |        | $1C89
    .byte %00000000 ; |        | $1C8A
    .byte %11111111 ; |XXXXXXXX| $1C8B
    .byte %01011010 ; | X XX X | $1C8C
    .byte %11110111 ; |XXXX XXX| $1C8D
    .byte %01111110 ; | XXXXXX | $1C8E
    .byte %10011001 ; |X  XX  X| $1C8F
TankDownTwo:
    .byte %00000000 ; |        | $1C90
    .byte %00000000 ; |        | $1C91
    .byte %00000000 ; |        | $1C92
    .byte %10011001 ; |X  XX  X| $1C93
    .byte %01111110 ; | XXXXXX | $1C94
    .byte %11110111 ; |XXXX XXX| $1C95
    .byte %01011010 ; | X XX X | $1C96
    .byte %11111111 ; |XXXXXXXX| $1C97
Explosion:
    .byte %00000000 ; |        | $1C98
    .byte %10010010 ; |X  X  X | $1C99
    .byte %01000100 ; | X   X  | $1C9A
    .byte %00010000 ; |   X    | $1C9B
    .byte %10111010 ; |X XXX X | $1C9C
    .byte %00010000 ; |   X    | $1C9D
    .byte %01000100 ; | X   X  | $1C9E
    .byte %10010010 ; |X  X  X | $1C9F

L1CA0 SUBROUTINE
    LDY    $E8                ; 3
    INY                       ; 2
    INY                       ; 2
    INY                       ; 2
    CPY    #6                 ; 2
    BNE    L1CAB              ; 2³
    LDY    #5                 ; 2
L1CAB:
    STY    $D1                ; 3
    LDA    $D0                ; 3
    BEQ    L1CE2              ; 2³
    LDY    #0                 ; 2
    LDX    #$10               ; 2
L1CB5:
    LDA    $8C,X              ; 4
    BEQ    L1CBA              ; 2³
    INY                       ; 2
L1CBA:
    DEX                       ; 2
    DEX                       ; 2
    DEX                       ; 2
    DEX                       ; 2
    BPL    L1CB5              ; 2³
    CPY    $D1                ; 3
    BCS    L1CE2              ; 2³
L1CC4:
    INX                       ; 2
    INX                       ; 2
    INX                       ; 2
    INX                       ; 2
    LDA    $8C,X              ; 4
    BNE    L1CC4              ; 2³
    LDA    #$7C               ; 2
    STA    $8C,X              ; 4
    DEC    $D0                ; 5
    LDA    $8A                ; 3
    ADC    $C9                ; 3
    ASL                       ; 2
    ASL                       ; 2
    ASL                       ; 2
    LSR                       ; 2
    ADC    #$0C               ; 2
    STA    $8B,X              ; 4
    LDA    #<TankDownOne      ; 2
    STA    $8D,X              ; 4
L1CE2:
    RTS                       ; 6

ClearGraphics SUBROUTINE
    LDA    #0                 ; 2
    STA    NUSIZ0             ; 3
    STA    NUSIZ1             ; 3
    STA    GRP0               ; 3
    STA    GRP1               ; 3
    STA    ENAM0              ; 3
    STA    ENAM1              ; 3
    STA    ENABL              ; 3
    RTS                       ; 6

L1CF4:
    LDA    #0                 ; 2
    STA    AUDV1              ; 3
    LDA    $DE                ; 3
    AND    #$EE               ; 2
    STA    $DE                ; 3
    RTS                       ; 6

    .byte %11111111 ; |XXXXXXXX| $1CFF
    .byte %11110000 ; |XXXX    | $1D00
    .byte %00010000 ; |   X    | $1D01
    .byte %00010000 ; |   X    | $1D02
    .byte %00010000 ; |   X    | $1D03
    .byte %00010000 ; |   X    | $1D04
    .byte %00010000 ; |   X    | $1D05
    .byte %00010000 ; |   X    | $1D06
    .byte %00010000 ; |   X    | $1D07
    .byte %00010000 ; |   X    | $1D08
    .byte %00010000 ; |   X    | $1D09
    .byte %00010000 ; |   X    | $1D0A
    .byte %00010000 ; |   X    | $1D0B
    .byte %00010000 ; |   X    | $1D0C
    .byte %00010000 ; |   X    | $1D0D
    .byte %00010000 ; |   X    | $1D0E
    .byte %00010000 ; |   X    | $1D0F
    .byte %11110000 ; |XXXX    | $1D10
    .byte %00010000 ; |   X    | $1D11
    .byte %00010000 ; |   X    | $1D12
    .byte %00010000 ; |   X    | $1D13
    .byte %00010000 ; |   X    | $1D14
    .byte %00010000 ; |   X    | $1D15
    .byte %00010000 ; |   X    | $1D16
    .byte %00010000 ; |   X    | $1D17
    .byte %00010000 ; |   X    | $1D18
    .byte %00010000 ; |   X    | $1D19
    .byte %00010000 ; |   X    | $1D1A
    .byte %11110000 ; |XXXX    | $1D1B
    .byte %00010000 ; |   X    | $1D1C
    .byte %00010000 ; |   X    | $1D1D
    .byte %00010000 ; |   X    | $1D1E
    .byte %00010000 ; |   X    | $1D1F
    .byte %00010000 ; |   X    | $1D20
    .byte %00010000 ; |   X    | $1D21
    .byte %11110000 ; |XXXX    | $1D22
    .byte %11111111 ; |XXXXXXXX| $1D23
    .byte %00000000 ; |        | $1D24
    .byte %00000000 ; |        | $1D25
    .byte %00000000 ; |        | $1D26
    .byte %00000000 ; |        | $1D27
    .byte %01000000 ; | X      | $1D28
    .byte %01000000 ; | X      | $1D29
    .byte %01000000 ; | X      | $1D2A
    .byte %01000011 ; | X    XX| $1D2B
    .byte %01000000 ; | X      | $1D2C
    .byte %01000000 ; | X      | $1D2D
    .byte %01000000 ; | X      | $1D2E
    .byte %01111111 ; | XXXXXXX| $1D2F
    .byte %00000000 ; |        | $1D30
    .byte %00000000 ; |        | $1D31
    .byte %00000000 ; |        | $1D32
    .byte %00000000 ; |        | $1D33
    .byte %00000000 ; |        | $1D34
    .byte %00000000 ; |        | $1D35
    .byte %00000000 ; |        | $1D36
    .byte %11111111 ; |XXXXXXXX| $1D37
    .byte %10000000 ; |X       | $1D38
    .byte %10000000 ; |X       | $1D39
    .byte %10000000 ; |X       | $1D3A
    .byte %00001000 ; |    X   | $1D3B
    .byte %00001000 ; |    X   | $1D3C
    .byte %00001000 ; |    X   | $1D3D
    .byte %11111000 ; |XXXXX   | $1D3E
    .byte %00000000 ; |        | $1D3F
    .byte %00000000 ; |        | $1D40
    .byte %10000000 ; |X       | $1D41
    .byte %11110001 ; |XXXX   X| $1D42
    .byte %00000000 ; |        | $1D43
    .byte %00000000 ; |        | $1D44
    .byte %11111111 ; |XXXXXXXX| $1D45
    .byte %11111111 ; |XXXXXXXX| $1D46
    .byte %11100000 ; |XXX     | $1D47
    .byte %11000000 ; |XX      | $1D48
    .byte %10000000 ; |X       | $1D49
    .byte %00000000 ; |        | $1D4A
    .byte %00000000 ; |        | $1D4B
    .byte %00000000 ; |        | $1D4C
    .byte %00000000 ; |        | $1D4D
    .byte %11111111 ; |XXXXXXXX| $1D4E
    .byte %00000000 ; |        | $1D4F
    .byte %00000000 ; |        | $1D50
    .byte %00000000 ; |        | $1D51
    .byte %00000111 ; |     XXX| $1D52
    .byte %00000000 ; |        | $1D53
    .byte %10000000 ; |X       | $1D54
    .byte %10000000 ; |X       | $1D55
    .byte %11111111 ; |XXXXXXXX| $1D56
    .byte %10000000 ; |X       | $1D57
    .byte %10000000 ; |X       | $1D58
    .byte %10000000 ; |X       | $1D59
    .byte %11100000 ; |XXX     | $1D5A
    .byte %10000000 ; |X       | $1D5B
    .byte %10000000 ; |X       | $1D5C
    .byte %10000000 ; |X       | $1D5D
    .byte %00000010 ; |      X | $1D5E
    .byte %00000010 ; |      X | $1D5F
    .byte %00000010 ; |      X | $1D60
    .byte %11111110 ; |XXXXXXX | $1D61
    .byte %00000000 ; |        | $1D62
    .byte %00000000 ; |        | $1D63
    .byte %00000000 ; |        | $1D64
    .byte %11000111 ; |XX   XXX| $1D65
    .byte %00000000 ; |        | $1D66
    .byte %00000000 ; |        | $1D67
    .byte %11111111 ; |XXXXXXXX| $1D68
L1D69:
    .byte $F0,$A0,$A5,$A0,$86,$B0,$A0,$C8,$A0,$E0,$C6,$80,$A0,$A0,$80,$A0
    .byte $CC,$A0,$A0,$A0,$A0,$87,$A0,$AD
LogoOne:
    .byte %00000000 ; |        |
    .byte %10010111 ; |X  X XXX|
    .byte %10010100 ; |X  X X  |
    .byte %10010100 ; |X  X X  |
    .byte %10010100 ; |X  X X  |
    .byte %11110111 ; |XXXX XXX|
    .byte %10000000 ; |X       |
    .byte %10000000 ; |X       |
LogoTwo:
    .byte %00000000 ; |        |
    .byte %10101010 ; |X X X X |
    .byte %10101010 ; |X X X X |
    .byte %10101010 ; |X X X X |
    .byte %10101010 ; |X X X X |
    .byte %10111110 ; |X XXXXX |
    .byte %00000000 ; |        |
    .byte %00000000 ; |        |
LogoThree:
    .byte %00000000 ; |        |
    .byte %11110000 ; |XXXX    |
    .byte %10000000 ; |X       |
    .byte %11110000 ; |XXXX    |
    .byte %10010000 ; |X  X    |
    .byte %11110000 ; |XXXX    |
    .byte %00000000 ; |        |
    .byte %00000000 ; |        |
LogoFour:
    .byte %00000000 ; |        |
    .byte %00010010 ; |   X  X |
    .byte %00101010 ; |  X X X |
    .byte %00101010 ; |  X X X |
    .byte %00101010 ; |  X X X |
    .byte %00101010 ; |  X X X |
    .byte %00000000 ; |        |
    .byte %00000010 ; |      X |
L1DA1:
    .byte $A0,$20,$21,$1E
L1DA5:
    LDA    COLUP1             ; 3
    AND    #$80               ; 2
    BEQ    L1DB9              ; 2³
    LDA    #2                 ; 2
    STA    $D9                ; 3
    JSR    L1DDA              ; 6
    JSR    L17D9              ; 6
    JSR    L1EA5              ; 6
L1DB8:
    RTS                       ; 6

L1DB9:
    LDA    VSYNC              ; 3
    AND    #$80               ; 2
    BEQ    L1DB8              ; 2³
    LDX    $CA                ; 3
    LDA    $8D,X              ; 4
    CMP    #$98               ; 2
    BNE    L1DC8              ; 2³
    RTS                       ; 6

L1DC8:
    LDA    #1                 ; 2
    STA    $D9                ; 3
    JSR    L1EA5              ; 6
    RTS                       ; 6

L1DD0:
    LDA    VBLANK             ; 3
    AND    #$80               ; 2
    BEQ    L1DE9              ; 2³
    LDA    #0                 ; 2
    STA    yPosEnemyMissile   ; 3
L1DDA:
    LDA    #$98               ; 2
    STA    $BE                ; 3
    LDA    #$28               ; 2
L1DE0:
    STA    $BF                ; 3
    LDA    #$E0               ; 2
    STA    $84                ; 3
    JSR    L1ECE              ; 6
L1DE9:
    RTS                       ; 6

L1DEA:
    LDX    #0                 ; 2
    LDA    #0                 ; 2
L1DEE:
    STA    $8B,X              ; 4
    DEC    $84                ; 5
    INX                       ; 2
    CPX    #20                ; 2
    BNE    L1DEE              ; 2³
    STA    $C5                ; 3
    STA    yPosMissile        ; 3
    STA    yPosEnemyMissile   ; 3
    STA    $C4                ; 3
    RTS                       ; 6

    .byte %11110000 ; |XXXX    | $1E00
    .byte %00010000 ; |   X    | $1E01
    .byte %00010000 ; |   X    | $1E02
    .byte %00010000 ; |   X    | $1E03
    .byte %00010000 ; |   X    | $1E04
    .byte %00010000 ; |   X    | $1E05
    .byte %00010000 ; |   X    | $1E06
    .byte %00010000 ; |   X    | $1E07
    .byte %00010000 ; |   X    | $1E08
    .byte %00010000 ; |   X    | $1E09
    .byte %00010000 ; |   X    | $1E0A
    .byte %00010000 ; |   X    | $1E0B
    .byte %00010000 ; |   X    | $1E0C
    .byte %00010000 ; |   X    | $1E0D
    .byte %00110000 ; |  XX    | $1E0E
    .byte %01110000 ; | XXX    | $1E0F
    .byte %11110000 ; |XXXX    | $1E10
    .byte %11110000 ; |XXXX    | $1E11
    .byte %01110000 ; | XXX    | $1E12
    .byte %00110000 ; |  XX    | $1E13
    .byte %00010000 ; |   X    | $1E14
    .byte %00010000 ; |   X    | $1E15
    .byte %00010000 ; |   X    | $1E16
    .byte %00010000 ; |   X    | $1E17
    .byte %00010000 ; |   X    | $1E18
    .byte %00010000 ; |   X    | $1E19
    .byte %00010000 ; |   X    | $1E1A
    .byte %00010000 ; |   X    | $1E1B
    .byte %00010000 ; |   X    | $1E1C
    .byte %00010000 ; |   X    | $1E1D
    .byte %00010000 ; |   X    | $1E1E
    .byte %00010000 ; |   X    | $1E1F
    .byte %00010000 ; |   X    | $1E20
    .byte %00010000 ; |   X    | $1E21
    .byte %11110000 ; |XXXX    | $1E22
    .byte %11111111 ; |XXXXXXXX| $1E23
    .byte %00000000 ; |        | $1E24
    .byte %00000000 ; |        | $1E25
    .byte %00000000 ; |        | $1E26
    .byte %00000000 ; |        | $1E27
    .byte %00000000 ; |        | $1E28
    .byte %00000000 ; |        | $1E29
    .byte %00000000 ; |        | $1E2A
    .byte %00000000 ; |        | $1E2B
    .byte %00000000 ; |        | $1E2C
    .byte %00000000 ; |        | $1E2D
    .byte %00000000 ; |        | $1E2E
    .byte %00000000 ; |        | $1E2F
    .byte %00000000 ; |        | $1E30
    .byte %00000000 ; |        | $1E31
    .byte %00000000 ; |        | $1E32
    .byte %11000000 ; |XX      | $1E33
    .byte %11000000 ; |XX      | $1E34
    .byte %00000000 ; |        | $1E35
    .byte %00000000 ; |        | $1E36
    .byte %00000000 ; |        | $1E37
    .byte %00000000 ; |        | $1E38
    .byte %00000000 ; |        | $1E39
    .byte %00000000 ; |        | $1E3A
    .byte %00000000 ; |        | $1E3B
    .byte %00000000 ; |        | $1E3C
    .byte %00000000 ; |        | $1E3D
    .byte %00000000 ; |        | $1E3E
    .byte %00000000 ; |        | $1E3F
    .byte %00000000 ; |        | $1E40
    .byte %00000000 ; |        | $1E41
    .byte %00000000 ; |        | $1E42
    .byte %00000000 ; |        | $1E43
    .byte %00000000 ; |        | $1E44
    .byte %11111111 ; |XXXXXXXX| $1E45
    .byte %11111111 ; |XXXXXXXX| $1E46
    .byte %11100000 ; |XXX     | $1E47
    .byte %11000000 ; |XX      | $1E48
    .byte %10000000 ; |X       | $1E49
    .byte %00000000 ; |        | $1E4A
    .byte %00000000 ; |        | $1E4B
    .byte %00000000 ; |        | $1E4C
    .byte %00000000 ; |        | $1E4D
    .byte %00000000 ; |        | $1E4E
    .byte %00000000 ; |        | $1E4F
    .byte %10000000 ; |X       | $1E50
    .byte %11000000 ; |XX      | $1E51
    .byte %11100000 ; |XXX     | $1E52
    .byte %11000000 ; |XX      | $1E53
    .byte %11110000 ; |XXXX    | $1E54
    .byte %11111100 ; |XXXXXX  | $1E55
    .byte %11111110 ; |XXXXXXX | $1E56
    .byte %11111110 ; |XXXXXXX | $1E57
    .byte %11100000 ; |XXX     | $1E58
    .byte %10000000 ; |X       | $1E59
    .byte %00000000 ; |        | $1E5A
    .byte %00000000 ; |        | $1E5B
    .byte %00000000 ; |        | $1E5C
    .byte %00000000 ; |        | $1E5D
    .byte %00000000 ; |        | $1E5E
    .byte %00000000 ; |        | $1E5F
    .byte %00000000 ; |        | $1E60
    .byte %00000000 ; |        | $1E61
    .byte %00000000 ; |        | $1E62
    .byte %00000000 ; |        | $1E63
    .byte %00000000 ; |        | $1E64
    .byte %00000000 ; |        | $1E65
    .byte %00000000 ; |        | $1E66
    .byte %00000000 ; |        | $1E67
    .byte %11111111 ; |XXXXXXXX| $1E68
L1E69:
    .byte $A0,$A3,$A0,$A2,$B1,$90,$B0,$A0,$80,$B5,$B0,$A0,$90,$B0,$A0,$91
    .byte $A0,$C0,$A0,$F7,$FF,$A0,$C0,$A0
L1E81:
    LDA    $E1                ; 3
    CMP    #2                 ; 2
    BEQ    L1E8C              ; 2³
    LDA    $E2                ; 3
    JMP    L1E8E              ; 3
L1E8C:
    LDA    $E3                ; 3
L1E8E:
    CMP    #9                 ; 2
    BCC    L1E94              ; 2³
    LDA    #9                 ; 2
L1E94:
    JSR    L1A51              ; 6
    CLC                       ; 2
    ADC    #8                 ; 2
    STA    $BE                ; 3
    LDA    #$18               ; 2
    STA    $DF                ; 3
    LDA    #$C0               ; 2
    STA    $EC                ; 3
    RTS                       ; 6

L1EA5:
    LDX    $CA                ; 3
    LDA    #<Explosion        ; 2
    STA    $8D,X              ; 4
    LDA    #4                 ; 2
    STA    $8E,X              ; 4
    LDA    #0                 ; 2
    STA    yPosMissile        ; 3
    LDA    $E1                ; 3
    CMP    #2                 ; 2
    BNE    L1EC3              ; 2³
    LDA    $D9                ; 3
    STA    $AC                ; 3
    LDA    #0                 ; 2
    STA    $AD                ; 3
    BEQ    L1ECB              ; 2³
L1EC3:
    LDA    $D9                ; 3
    STA    $AD                ; 3
    LDA    #0                 ; 2
    STA    $AC                ; 3
L1ECB:
    JSR    L1B53              ; 6
L1ECE:
    LDA    #$AA               ; 2
    ORA    $DE                ; 3
    STA    $DE                ; 3
    RTS                       ; 6

CalcHorizPos SUBROUTINE
    CLC                       ; 2
    ADC    #$2E               ; 2    add 46
    TAY                       ; 2
    AND    #$0F               ; 2
    STA.w  $B4                ; 4
    TYA                       ; 2
    LSR                       ; 2
    LSR                       ; 2
    LSR                       ; 2
    LSR                       ; 2
    TAY                       ; 2
    CLC                       ; 2
    ADC.w  $B4                ; 4
    CMP    #$0F               ; 2
    BCC    L1EEF              ; 2³
    SBC    #$0F               ; 2
    INY                       ; 2
L1EEF:
    EOR    #$07               ; 2
    ASL                       ; 2
    ASL                       ; 2
    ASL                       ; 2
    ASL                       ; 2
    STA    HMP0,X             ; 4
    STA    WSYNC              ; 3
;--------------------------------------
.loopCoarsePos:
    DEY                       ; 2
    BPL    .loopCoarsePos     ; 2³
    STA    RESP0,X            ; 4
    RTS                       ; 6

    .byte %11111111 ; |XXXXXXXX| $1EFF
    .byte %11110000 ; |XXXX    | $1F00
    .byte %00010000 ; |   X    | $1F01
    .byte %00010000 ; |   X    | $1F02
    .byte %00010000 ; |   X    | $1F03
    .byte %00010000 ; |   X    | $1F04
    .byte %00010000 ; |   X    | $1F05
    .byte %00010000 ; |   X    | $1F06
    .byte %00010000 ; |   X    | $1F07
    .byte %00010000 ; |   X    | $1F08
    .byte %00010000 ; |   X    | $1F09
    .byte %00010000 ; |   X    | $1F0A
    .byte %00010000 ; |   X    | $1F0B
    .byte %00010000 ; |   X    | $1F0C
    .byte %00010000 ; |   X    | $1F0D
    .byte %00010000 ; |   X    | $1F0E
    .byte %00010000 ; |   X    | $1F0F
    .byte %00010000 ; |   X    | $1F10
    .byte %00010000 ; |   X    | $1F11
    .byte %00010000 ; |   X    | $1F12
    .byte %00010000 ; |   X    | $1F13
    .byte %00010000 ; |   X    | $1F14
    .byte %00010000 ; |   X    | $1F15
    .byte %00010000 ; |   X    | $1F16
    .byte %00010000 ; |   X    | $1F17
    .byte %00010000 ; |   X    | $1F18
    .byte %00010000 ; |   X    | $1F19
    .byte %00010000 ; |   X    | $1F1A
    .byte %00010000 ; |   X    | $1F1B
    .byte %00010000 ; |   X    | $1F1C
    .byte %00010000 ; |   X    | $1F1D
    .byte %00010000 ; |   X    | $1F1E
    .byte %00010000 ; |   X    | $1F1F
    .byte %00010000 ; |   X    | $1F20
    .byte %00010000 ; |   X    | $1F21
    .byte %11111111 ; |XXXXXXXX| $1F22
    .byte %11111111 ; |XXXXXXXX| $1F23
    .byte %00000000 ; |        | $1F24
    .byte %00000000 ; |        | $1F25
    .byte %00000000 ; |        | $1F26
    .byte %00000000 ; |        | $1F27
    .byte %00000000 ; |        | $1F28
    .byte %00000000 ; |        | $1F29
    .byte %00000000 ; |        | $1F2A
    .byte %00000000 ; |        | $1F2B
    .byte %00000000 ; |        | $1F2C
    .byte %00000000 ; |        | $1F2D
    .byte %00000000 ; |        | $1F2E
    .byte %00000000 ; |        | $1F2F
    .byte %00000000 ; |        | $1F30
    .byte %00000000 ; |        | $1F31
    .byte %00000000 ; |        | $1F32
    .byte %00000000 ; |        | $1F33
    .byte %00000000 ; |        | $1F34
    .byte %00000000 ; |        | $1F35
    .byte %00000000 ; |        | $1F36
    .byte %00000000 ; |        | $1F37
    .byte %00000000 ; |        | $1F38
    .byte %00000000 ; |        | $1F39
    .byte %00000000 ; |        | $1F3A
    .byte %00000000 ; |        | $1F3B
    .byte %00000000 ; |        | $1F3C
    .byte %00000000 ; |        | $1F3D
    .byte %00000000 ; |        | $1F3E
    .byte %00000000 ; |        | $1F3F
    .byte %00000000 ; |        | $1F40
    .byte %00000000 ; |        | $1F41
    .byte %00000000 ; |        | $1F42
    .byte %00000000 ; |        | $1F43
    .byte %00000000 ; |        | $1F44
    .byte %11111111 ; |XXXXXXXX| $1F45
    .byte %11111111 ; |XXXXXXXX| $1F46
    .byte %11100000 ; |XXX     | $1F47
    .byte %11000000 ; |XX      | $1F48
    .byte %10000000 ; |X       | $1F49
    .byte %00000000 ; |        | $1F4A
    .byte %00000000 ; |        | $1F4B
    .byte %00000000 ; |        | $1F4C
    .byte %00000000 ; |        | $1F4D
    .byte %00000000 ; |        | $1F4E
    .byte %00000000 ; |        | $1F4F
    .byte %00000000 ; |        | $1F50
    .byte %00000000 ; |        | $1F51
    .byte %00000000 ; |        | $1F52
    .byte %00000000 ; |        | $1F53
    .byte %00000000 ; |        | $1F54
    .byte %00000000 ; |        | $1F55
    .byte %00000000 ; |        | $1F56
    .byte %00001000 ; |    X   | $1F57
    .byte %00000000 ; |        | $1F58
    .byte %00000000 ; |        | $1F59
    .byte %00000000 ; |        | $1F5A
    .byte %00000000 ; |        | $1F5B
    .byte %00000000 ; |        | $1F5C
    .byte %00000000 ; |        | $1F5D
    .byte %00000000 ; |        | $1F5E
    .byte %00001000 ; |    X   | $1F5F
    .byte %00000000 ; |        | $1F60
    .byte %00000000 ; |        | $1F61
    .byte %11100000 ; |XXX     | $1F62
    .byte %00000000 ; |        | $1F63
    .byte %00000000 ; |        | $1F64
    .byte %00000000 ; |        | $1F65
    .byte %00000000 ; |        | $1F66
    .byte %00000000 ; |        | $1F67
    .byte %11111111 ; |XXXXXXXX| $1F68
L1F69:
    .byte $CF,$A0,$E5,$B0,$A4,$B0,$A4,$C8,$A0,$A5,$A0,$FA,$B0,$A0,$B1,$A0
    .byte $99,$A0,$E5,$A0,$A0,$FF,$C2,$C0
L1F81:
    LDA    INTIM              ; 4
    BNE    L1F81              ; 2³
    LDA    #$82               ; 2
    STA    WSYNC              ; 3
    STA    VBLANK             ; 3
    STA    VSYNC              ; 3
    STA    WSYNC              ; 3
    STA    WSYNC              ; 3
    STA    WSYNC              ; 3
    LDA    #0                 ; 2
    STA    VSYNC              ; 3
    STA    VBLANK             ; 3
    STA    COLUPF             ; 3    black
    LDA    #44                ; 2
    STA    TIM64T             ; 4
    RTS                       ; 6

OneShotRam SUBROUTINE
    LDA    #0                 ; 2
    STA    $AC                ; 3
    STA    $AD                ; 3
    STA    $82                ; 3
    STA    $81                ; 3
    STA    $AE                ; 3
    STA    $AF                ; 3
    STA    $B0                ; 3
    STA    $B1                ; 3
    LDA    #1                 ; 2
    STA    $83                ; 3
    JSR    L1B53              ; 6
    LDA    #$FC               ; 2    high nybble address
    STA    $B6                ; 3
    STA    enemyTankPtr+1     ; 3
    STA    $86                ; 3
    STA    $88                ; 3
    LDA    #$10               ; 2
    STA    $CA                ; 3
    RTS                       ; 6

VolumeZeroTab:
    .byte $1B,$1F,$1E,$1A
FrequencyZeroTab:
    .byte $06,$08
VolumeOneTab:
    .byte $1C,$1E,$64,$18
FrequencyOneTab:
    .byte $04,$06

L1FD6:
    LDA    #0                 ; 2
    STA    $AE                ; 3
    STA    $AF                ; 3
    STA    $C4                ; 3
    STA    $83                ; 3
    STA    $81                ; 3
    STA    $82                ; 3
    STA    $EC                ; 3
    RTS                       ; 6

LogoFive:
    .byte %00000000 ; |        |
    .byte %11100101 ; |XXX  X X|
    .byte %00010101 ; |   X X X|
    .byte %01100101 ; | XX  X X|
    .byte %10000101 ; |X    X X|
    .byte %01110101 ; | XXX X X|
    .byte %00000000 ; |        |
    .byte %00000100 ; |     X  |
LogoSix:
    .byte %00000000 ; |        |
    .byte %11101001 ; |XXX X  X|
    .byte %00101001 ; |  X X  X|
    .byte %00101001 ; |  X X  X|
    .byte %00101001 ; |  X X  X|
    .byte %11101111 ; |XXX XXXX|
    .byte %00000000 ; |        |
    .byte %00000000 ; |        |

;unused bytes:
    .byte $FF ; |XXXXXXXX| $1FF7
    .byte $FF ; |XXXXXXXX| $1FF8
    .byte $FF ; |XXXXXXXX| $1FF9
    .byte $FF ; |XXXXXXXX| $1FFA
    .byte $FF ; |XXXXXXXX| $1FFB

     .byte $00,$F0,$00,$F0                ; Start, Start