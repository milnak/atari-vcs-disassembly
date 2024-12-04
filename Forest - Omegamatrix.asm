; Disassembly of forest.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
;
; forest.cfg contents:
;
;      ORG F000
;      CODE F000 F9D9
;      GFX F9DA FA40
;      CODE FA41 FCE1
;      DATA FCE2 FDBF
;      GFX FDC0 FFFF

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
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM1    =  $23
HMBL    =  $24
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
;time
TIME_VBLANK       = $27
TIME_OVERSCAN     = $20
TIME_TO_LOGO         = $09

START_LIVES        = 3

;man graphics order inside rom
MAN_STEP_ONE       = 0
MAN_STEP_TWO       = 1
MAN_STEP_THREE     = 2
MAN_STAND_STILL    = 3
MAN_JUMPING        = 4
MAN_CLIMB_ONE      = 5
MAN_CLIMB_TWO      = 6
MAN_AXE_OUT        = 7
MAN_AXE_DOWN       = 8
MAN_TURN_FRONT     = 9

DO_SCORE           = $20

;NUSIZx
DOUBLE_SIZE       = %101
THREE_COPIES      = %011
EIGHT_CLOCKS      = %110000

;CTRLPF
FIELD_IN_FRONT    = %100

;colors
BLACK                  = $00
BLUE                   = $CA
BROWNGREEN             = $31
BROWN                  = $47
GREEN                  = $53
MAROON                 = $86
TAN                    = $24
WHITE                  = $0F

;==================================================================================================
;              RAM LOCATIONS
;==================================================================================================
logoScorePtrs          = $80   ; $80 - $8B
logoPtrs               = logoScorePtrs
scorePtrs              = logoScorePtrs

manGfxPtr              = $8C   ; $8C - $8D
;           = $8E
;           = $8F
;           = $90
;           = $91
tempStorage               = $92
scoreSpriteLine           = tempStorage
copyScoreBCD              = tempStorage   ; $92 - $94
copyTimer                 = tempStorage
;           = $95
;           = $96
;           = $97
;           = $98
;           = $99
;           = $9A
;           = $9B
;           = $9C
;           = $9D
;           = $9E
;           = $9F
;           = $A0
;           = $A1
;           = $A2
;           = $A3
screenType             = $A4    ; 0 start screen, 1 screen two, 2 tree screen
;           = $A5
;           = $A6
;           = $A7
;           = $A8
;           = $A9
;           = $AA
;           = $AB
manCurrentGfx          = $AC   ; graphic marker
;           = $AD
;           = $AE
;           = $AF
;           = $B0
;           = $B1
;           = $B2
;           = $B3
;           = $B4
;           = $B5
;           = $B6
xPosCoarseFieldObj     = $B7
xPosFineFieldObj       = $B8
;           = $B9
scoreBCD               = $BA   ; $BA - $BC
;           = $BD
;           = $BE
;           = $BF
timerHi                = $C0
timerLo                = $C1
;           = $C2
numOfLives             = $C3
xPosCoarseMan          = $C4
xPosFineMan            = $C5
displayType            = $C6  ; $80 logo, $20 score, $01-$0F timer, default is logo
animalGfxPtr           = $C7  ; $C7 - $C8
;           = $C9
;           = $CA
;           = $CB
;           = $CC
xPosCoarseAnimal       = $CD
xPosFineAnimal         = $CE
reflectSizeAnimal      = $CF
;           = $D0
;           = $D1
;           = $D2
birdGfxPtr             = $D3   ; $D3 - $D4
;           = $D5
;           = $D6
;           = $D7
;           = $D8
xPosCoarseBird         = $D9
xPosFineBird           = $DA
reflectSizeBird        = $DB
;           = $DC
;           = $DD
;           = $DE
;           = $DF
;           = $E0
displayMarker          = $E1  ; holds values placed into $C6 (displayType)
;           = $E2
;           = $E3
;           = $E4
;           = $E5
;           = $E6
;           = $E7
;           = $E8
;           = $E9
;           = $EA
;           = $EB
;           = $EC
;           = $ED
;           = $EE
;           = $EF
;           = $F0
;           = $F1
;           = $F2
;           = $F3
;           = $F4
;           = $F5
;           = $F6
;           = $F7
;           = $F8
;           = $F9
;           = $FA
;           = $FB
;           = $FC
;           = $FD
;           = $FE
;           = $FF
;==================================================================================================
;              MAIN PROGRAM
;==================================================================================================

     ORG $F000

START:
     SEI
     CLD
     LDX    #0
     TXA
.clearLoop:
     STA    VSYNC,X
     TXS
     INX
     BNE    .clearLoop
     JSR    GameReset           ;6

     LDX    #3                  ;2
     STA    WSYNC               ;3
;--------------------------------------
.loopNoWsync:
     DEX                        ;2
     BPL    .loopNoWsync        ;2³  never hits wsync

     STA    RESBL               ;3
     LDA    #$20                ;2
     STA    HMBL                ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMCLR               ;3
     LDA    #$80                ;2
     STA    $F4                 ;3
     STA    displayMarker       ;3
F029:
     LDA    SWCHB               ;4
     LSR                        ;2
     BCS    .skipGameReset      ;2³
     JSR    GameReset           ;6
     LDA    #$0F                ;2
     STA    displayMarker       ;3
     LDA    #START_LIVES        ;2
     STA    numOfLives          ;3
     LDA    #0                  ;2
     STA    $A5                 ;3
     STA    $F4                 ;3
     STA    scoreBCD+2          ;3
     STA    scoreBCD+1          ;3
     STA    scoreBCD            ;3
.skipGameReset:
     LDA    $AA                 ;3
     BEQ    F057                ;2³
     DEC    $AA                 ;5
     BEQ    F057                ;2³
     LDA    #MAN_TURN_FRONT     ;2
     CMP    manCurrentGfx       ;3
     BNE    F080                ;2³
     JMP    F0FC                ;3
F057:
     LDA    manCurrentGfx       ;3
     CMP    #MAN_TURN_FRONT     ;2
     BNE    F06D                ;2³
     DEC    numOfLives          ;5
     BPL    F067                ;2³
     LDA    #$80                ;2
     STA    $F4                 ;3
     STA    displayMarker       ;3
F067:
     JSR    GameReset           ;6
     JMP    F0FC                ;3
F06D:
     BIT    displayMarker       ;3
     BPL    F074                ;2³
     JMP    F0FC                ;3
F074:
     BIT    VBLANK              ;3
     BPL    F080                ;2³
     LDA    #0                  ;2
     STA    $E0                 ;3
     LDA    #$6A                ;2
     STA    $AA                 ;3
F080:
     BIT    COLUP1              ;3
     BPL    F0FC                ;2³
     BIT    $A0                 ;3
     BPL    F097                ;2³
     LDA    #$FF                ;2
     STA    $AA                 ;3
     LDA    #MAN_TURN_FRONT     ;2
     STA    manCurrentGfx       ;3
     LDA    #4                  ;2
     STA    $F4                 ;3
     JMP    F0FC                ;3
F097:
     LDA    manCurrentGfx       ;3
     CMP    #MAN_AXE_OUT        ;2
     BNE    F0C2                ;2³
     LDA    $9C                 ;3
     CMP    $9B                 ;3
     BCC    F0AC                ;2³
     LDA    #$0F                ;2
     CLC                        ;2
     ADC    $9B                 ;3
     CMP    $9C                 ;3
     BCS    F0FC                ;2³
F0AC:
     LDA    #$0F                ;2
     AND    $A1                 ;3
     BEQ    F0D8                ;2³
     LDA    $B6                 ;3
     AND    #$0F                ;2
     CMP    #7                  ;2
     BEQ    F0BC                ;2³
     INC    $B6                 ;5
F0BC:
     JSR    F930                ;6
     JMP    F0EA                ;3
F0C2:
     CMP    #8                  ;2
     BNE    F0FC                ;2³
     JSR    FBED                ;6
     BCS    F0D2                ;2³
     JSR    F7BE                ;6
     LDA    #$10                ;2
     STA    $A9                 ;3
F0D2:
     JSR    FB4C                ;6
     JMP    F0FC                ;3
F0D8:
     LDA    $B6                 ;3
     AND    #$F0                ;2
     CMP    #$70                ;2
     BEQ    F0E7                ;2³
     CLC                        ;2
     LDA    $B6                 ;3
     ADC    #$10                ;2
     STA    $B6                 ;3
F0E7:
     JSR    ChopTree            ;6
F0EA:
     LDA    $B1                 ;3
     BNE    F0FC                ;2³
     LDA    #$80                ;2
     STA    $AA                 ;3
     STA    $F4                 ;3
     JSR    FA53                ;6
     JSR    GameReset           ;6
     INC    $A5                 ;5
F0FC:
     DEC    $CA                 ;5
     BMI    F103                ;2³
     JMP    F1AE                ;3
F103:
     LDA    $CC                 ;3
     STA    $CA                 ;3
     BIT    $E3                 ;3
     BMI    F10E                ;2³
     JMP    F1AE                ;3
F10E:
     LDA    #$FF                ;2
     STA    $B9                 ;3
     LDA    $CB                 ;3
     EOR    #$01                ;2
     STA    $CB                 ;3
     TAX                        ;2
     LDA    AnimalTab,X         ;4
     STA    animalGfxPtr        ;3
     LDA    reflectSizeAnimal   ;3
     AND    #$08                ;2
     BNE    F170                ;2³
     LDA    $D1                 ;3
     AND    #$03                ;2
     CLC                        ;2
     ADC    $D0                 ;3
     STA    $D0                 ;3
     BIT    reflectSizeAnimal   ;3
     BMI    F14F                ;2³
     CMP    #$18                ;2
     BCC    F14F                ;2³
     LDA    reflectSizeAnimal   ;3
     ORA    #$80                ;2
     STA    reflectSizeAnimal   ;3
     JSR    F967                ;6
     BCC    F14F                ;2³
     LDA    reflectSizeAnimal   ;3
     AND    #$07                ;2
     BNE    F14F                ;2³
     INC    reflectSizeAnimal   ;5
     LDA    $D0                 ;3
     SEC                        ;2
     SBC    #$10                ;2
     STA    $D0                 ;3
F14F:
     LDA    reflectSizeAnimal   ;3
     AND    #$01                ;2
     BEQ    F15C                ;2³
     LDA    $D0                 ;3
     CMP    #$8E                ;2
     JMP    F160                ;3
F15C:
     LDA    $D0                 ;3
     CMP    #$9E                ;2
F160:
     BCC    F1A3                ;2³
     JSR    FBED                ;6
     BCC    F16A                ;2³
     JMP    F1A3                ;3
F16A:
     JSR    F7BE                ;6
     JMP    F1AE                ;3
F170:
     LDA    $D1                 ;3
     AND    #$03                ;2
     EOR    #$FF                ;2
     CLC                        ;2
     ADC    $D0                 ;3
     STA    $D0                 ;3
     BIT    reflectSizeAnimal   ;3
     BMI    F198                ;2³
     CMP    #$8A                ;2
     BCS    F198                ;2³
     LDA    reflectSizeAnimal   ;3
     ORA    #$80                ;2
     STA    reflectSizeAnimal   ;3
     JSR    F967                ;6
     BCC    F198                ;2³
     LDA    reflectSizeAnimal   ;3
     AND    #$07                ;2
     BNE    F198                ;2³
     INC    reflectSizeAnimal   ;5
     BNE    F1A3                ;2³
F198:
     LDA    $D0                 ;3
     CMP    #$0A                ;2
     BCS    F1A3                ;2³
     JSR    FBED                ;6
     BCC    F16A                ;2³
F1A3:
     LDA    $D0                 ;3
     JSR    CalcHorizPos        ;6
     STA    xPosFineAnimal      ;3
     DEY                        ;2
     DEY                        ;2
     STY    xPosCoarseAnimal    ;3
F1AE:
     DEC    $D6                 ;5
     BMI    F1B5                ;2³
     JMP    .waitOverscan       ;3
F1B5:
     LDA    $D7                 ;3
     EOR    #$01                ;2
     STA    $D7                 ;3
     TAX                        ;2
     LDA    BirdTab,X           ;4
     STA    birdGfxPtr          ;3
     LDA    $D8                 ;3
     STA    $D6                 ;3
     LDA    #$FF                ;2
     STA    $DE                 ;3
     LDA    reflectSizeBird     ;3
     AND    #$08                ;2
     BNE    F1DD                ;2³
     INC    $DC                 ;5
     JMP    F1DF                ;3
F1D4:
     LDA    #8                  ;2
     EOR    reflectSizeBird     ;3
     STA    reflectSizeBird     ;3
     JMP    .waitOverscan       ;3
F1DD:
     DEC    $DC                 ;5
F1DF:
     DEC    $E2                 ;5
     BNE    F1E5                ;2³
     BEQ    F1D4                ;2³
F1E5:
     LDA    $DC                 ;3
     CMP    $9C                 ;3
     BNE    F1F6                ;2³
     JSR    F967                ;6
     AND    #$3F                ;2
     ORA    #$07                ;2
     STA    $E2                 ;3
     LDA    $DC                 ;3
F1F6:
     CMP    #$0A                ;2
     BCS    F1FC                ;2³
     BCC    F1D4                ;2³
F1FC:
     CMP    #$9C                ;2
     BCS    F1D4                ;2³+1
     JSR    CalcHorizPos        ;6
     STA    xPosFineBird        ;3
     STY    xPosCoarseBird      ;3
     JSR    F967                ;6
     BCS    F210                ;2³
     INC    $DF                 ;5
     BNE    F212                ;2³
F210:
     DEC    $DF                 ;5
F212:
     LDA    $DF                 ;3
     CMP    #$54                ;2
     BCC    F21C                ;2³
     LDA    #$53                ;2
     BNE    F222                ;2³
F21C:
     CMP    #$46                ;2
     BCS    F222                ;2³
     LDA    #$46                ;2
F222:
     STA    $DF                 ;3
.waitOverscan:
     LDA    INTIM               ;4
     BNE    .waitOverscan       ;2³
     LDA    xPosFineBird        ;3
     LDY    xPosCoarseBird      ;3
     DEY                        ;2
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     LDX    $A6                 ;3
     BNE    F23D                ;2³
F236:
     DEY                        ;2
     BPL    F236                ;2³
     STA    RESM1               ;3
     STA    HMM1                ;3
F23D:
     STA    WSYNC               ;3
;--------------------------------------
     LDA    $DE                 ;3
     EOR    #$FF                ;2
     ORA    $E0                 ;3
     ORA    $A6                 ;3
     BNE    F254                ;2³
     LDA    $DF                 ;3
     CLC                        ;2
     SBC    #8                  ;2
     STA    $A6                 ;3
     LDA    #$FF                ;2
     STA    $E0                 ;3
F254:
     LDA    #2                  ;2
     STA    WSYNC               ;3
;--------------------------------------
     STA    VSYNC               ;3
     STA    VBLANK              ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMCLR               ;3
     STA    WSYNC               ;3
;--------------------------------------
     LDA    #0                  ;2
     STA    VSYNC               ;3
     STA    VBLANK              ;3
     STA    PF1                 ;3
     STA    PF2                 ;3
     STA    COLUBK              ;3
     STA    GRP0                ;3
     STA    $9F                 ;3
     STA    $95                 ;3
     STA    WSYNC               ;3
;--------------------------------------
     INC    $9E                 ;5
     LDA    #1                  ;2
     AND    $9E                 ;3
     BEQ    F284                ;2³
     ROR                        ;2
     ROR                        ;2
F284:
     STA    $A0                 ;3
     LDA    #$5B                ;2
     STA    $96                 ;3
     STA    WSYNC               ;3
;--------------------------------------
     LDA    #TIME_VBLANK        ;2
     STA    TIM64T              ;4
     JSR    FC1F                ;6
     BIT    displayMarker       ;3
     BPL    F29B                ;2³
     JMP    F3F4                ;3
F29B:
     LDA    $AA                 ;3
     BEQ    F2A2                ;2³
     JMP    F3F4                ;3
F2A2:
     DEC    $AB                 ;5
     BMI    F2A9                ;2³
     JMP    F3F4                ;3
F2A9:
     LDA    #3                  ;2
     STA    $AB                 ;3
     LDY    $A1                 ;3
     BIT    $A2                 ;3
     BMI    F313                ;2³+1
     BIT    REFP1               ;3
     BPL    F313                ;2³+1
     BIT    SWCHA               ;4
     BMI    F2F6                ;2³
     TYA                        ;2
     AND    #$F0                ;2
     STA    $A1                 ;3
     LDX    #$95                ;2
     CPX    $9C                 ;3
     BCC    F2CC                ;2³
     INC    $9C                 ;5
     JMP    F305                ;3
F2CC:
     INC    screenType          ;5
     LDA    #$0A                ;2
     STA    $9C                 ;3
     BNE    F2DE                ;2³
F2D4:
     LDA    screenType          ;3
     BEQ    F305                ;2³+1
     DEC    screenType          ;5
     LDA    #$9B                ;2
     STA    $9C                 ;3
F2DE:
     JSR    F7BE                ;6
     JSR    F850                ;6
     BIT    $A1                 ;3
     BPL    F2F0                ;2³
     BVC    F2F0                ;2³
     LDA    $A1                 ;3
     AND    #$BF                ;2
     STA    $A1                 ;3
F2F0:
     LDA    #0                  ;2
     STA    $E0                 ;3
     BEQ    F305                ;2³+1
F2F6:
     BVS    F30F                ;2³+1
     TYA                        ;2
     ORA    #$08                ;2
     STA    $A1                 ;3
     LDX    #$10                ;2
     CPX    $9C                 ;3
     BCS    F2D4                ;2³+1
     DEC    $9C                 ;5
F305:
     LDA    #MAN_STAND_STILL    ;2
     CMP    manCurrentGfx       ;3
     BCC    F313                ;2³
     DEC    manCurrentGfx       ;5
     BPL    F313                ;2³
F30F:
     LDA    #MAN_STAND_STILL    ;2
     STA    manCurrentGfx       ;3
F313:
     BIT    $A1                 ;3
     BPL    F347                ;2³
     LDA    #MAN_JUMPING        ;2
     STA    manCurrentGfx       ;3
     BVS    F337                ;2³
     DEC    $97                 ;5
     TAX                        ;2
     LDA    #$0A                ;2
     CMP    $97                 ;3
     BEQ    F329                ;2³
     JMP    F3BD                ;3
F329:
     DEC    $97                 ;5
     TYA                        ;2
     AND    #$0F                ;2
     STA    $A1                 ;3
     LDA    #MAN_STAND_STILL    ;2
     STA    manCurrentGfx       ;3
     JMP    F3BD                ;3
F337:
     INC    $97                 ;5
     LDA    #$10                ;2
     CMP    $97                 ;3
     BCS    F3BD                ;2³
     TYA                        ;2
     AND    #$BF                ;2
     STA    $A1                 ;3
     JMP    F3BD                ;3
F347:
     LDA    #$10                ;2
     AND    SWCHA               ;4
     BNE    F36E                ;2³
     BIT    $A2                 ;3
     BPL    F360                ;2³
F352:
     JSR    F8A4                ;6
     LDA    #$10                ;2
     CMP    $97                 ;3
     BEQ    F3BD                ;2³
     INC    $97                 ;5
     JMP    F3BD                ;3
F360:
     JSR    F8BB                ;6
     BIT    $A2                 ;3
     BMI    F352                ;2³
     LDA    #2                  ;2
     STA    $F4                 ;3
     JMP    F3B0                ;3
F36E:
     LDA    #$20                ;2
     AND    SWCHA               ;4
     BNE    F3BD                ;2³
     BIT    $A2                 ;3
     BPL    F391                ;2³
     JSR    F8A4                ;6
     DEC    $97                 ;5
     LDA    #9                  ;2
     CMP    $97                 ;3
     BNE    F3BD                ;2³
     LDA    #MAN_STAND_STILL    ;2
     STA    manCurrentGfx       ;3
     LDA    $A2                 ;3
     AND    #$7F                ;2
     STA    $A2                 ;3
     JMP    F3BD                ;3
F391:
     LDA    $A2                 ;3
     BVS    F3C7                ;2³
     BIT    REFP1               ;3
     BPL    F39C                ;2³
     JMP    .waitVblank         ;3
F39C:
     LDA    #1                  ;2
     STA    $F4                 ;3
     LDA    #MAN_AXE_DOWN       ;2
     STA    manCurrentGfx       ;3
     LDA    #$10                ;2
     STA    $AA                 ;3
     LDA    #$40                ;2
     ORA    $A2                 ;3
     STA    $A2                 ;3
     BNE    F3F4                ;2³
F3B0:
     INC    $97                 ;5
     INC    $97                 ;5
     TYA                        ;2
     ORA    #$C0                ;2
     STA    $A1                 ;3
     LDA    #MAN_JUMPING        ;2
     STA    manCurrentGfx       ;3
F3BD:
     LDA    $A2                 ;3
     BIT    $A1                 ;3
     BMI    F3F4                ;2³
     BIT    $A2                 ;3
     BMI    F3F4                ;2³
F3C7:
     LDX    #MAN_STAND_STILL    ;2
     BVC    F3D1                ;2³
     BIT    REFP1               ;3
     BMI    F3EA                ;2³
     BPL    F3F2                ;2³
F3D1:
     BIT    REFP1               ;3
     BMI    F3F4                ;2³
     LDA    #1                  ;2
     STA    $F4                 ;3
     LDX    #MAN_AXE_OUT        ;2
     STX    manCurrentGfx       ;3
     LDA    $A2                 ;3
     ORA    #$40                ;2
     STA    $A2                 ;3
     LDA    #$10                ;2
     STA    $AA                 ;3
     JMP    F3F4                ;3
F3EA:
     AND    #$B0                ;2
     STA    $A2                 ;3
     LDA    #0                  ;2
     STA    $F5                 ;3
F3F2:
     STX    manCurrentGfx       ;3
F3F4:
     LDX    screenType          ;3
     LDA    FieldObjPosTab,X              ;4
     JSR    CalcHorizPos        ;6
     STA    xPosFineFieldObj    ;3
     STY    xPosCoarseFieldObj  ;3
     LDX    #0                  ;2
     BIT    $A0                 ;3
     BMI    F41E                ;2³
     LDA    manCurrentGfx       ;3
     CMP    #MAN_AXE_OUT        ;2
     BEQ    F412                ;2³
     CMP    #MAN_AXE_DOWN       ;2
     BEQ    F412                ;2³
     BNE    F41E                ;2³
F412:
     LDA    #$0F                ;2
     AND    $A1                 ;3
     BNE    F41C                ;2³
     LDX    #7                  ;2
     BNE    F41E                ;2³
F41C:
     LDX    #$F8                ;2
F41E:
     TXA                        ;2
     CLC                        ;2
     ADC    $9C                 ;3
     JSR    CalcHorizPos        ;6
     STA    xPosFineMan         ;3
     STY    xPosCoarseMan       ;3
.waitVblank:
     LDA    INTIM               ;4
     BNE    .waitVblank         ;2³
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     LDA    #FIELD_IN_FRONT     ;2
     STA    CTRLPF              ;3
     LDA    screenType          ;3
     CMP    #2                  ;2
     BEQ    .treeTopColor       ;2³
     LDA    #WHITE              ;2
     BNE    .cloudOrTree        ;2³
.treeTopColor:
     LDA    #BROWNGREEN+5       ;2
.cloudOrTree:
     STA    COLUPF              ;3     $F442
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     LDA    $A3                 ;3
     STA    PF0                 ;3
     STA    PF1                 ;3
     STA    PF2                 ;3
     LDA    #BLUE               ;2
     STA    COLUBK              ;3
     LDA    xPosFineFieldObj    ;3
     LDY    xPosCoarseFieldObj  ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
.positionFieldObj:
     DEY                        ;2
     BPL    .positionFieldObj   ;2³
     STA    RESP1               ;3
     STA    HMP1                ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     LDX    screenType          ;3
     LDA    #$C0                ;2
     AND    $A3                 ;3
     STA    $AD                 ;3
     LDA    FieldObjLoTab,X     ;4
     STA    $8E                 ;3
     LDA    FieldObjHiTab,X     ;4
     STA    $8F                 ;3
     LDA    ColFieldObjTab,X    ;4
     STA    COLUP1              ;3
     LDA    F9F2,X              ;4
     STA    $98                 ;3
     LDA    FieldObjSizeTab,X   ;4
     STA    NUSIZ1              ;3
     STA    HMCLR               ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     LDA    $A3                 ;3
     STA    GRP1                ;3
     LDY    #7                  ;2
     LDA    screenType          ;3
     CMP    #2                  ;2
     BEQ    .loopTreeTop        ;2³
.loopClouds:
     STA    WSYNC               ;3     $F49A
;--------------------------------------
     STA    HMOVE               ;3
     NOP                        ;2
     NOP                        ;2
     LDA    CloudOne,Y          ;4
     STA    PF0                 ;3
     LDA    CloudTwo,Y          ;4
     STA    PF1                 ;3
     LDA    CloudThree,Y        ;4
     STA    PF2                 ;3
     LDA    CloudFour,Y         ;4
     STA    PF0                 ;3
     LDA    CloudFive,Y         ;4
     STA    PF1                 ;3
     LDA    CloudSix,Y          ;4
     STA    PF2                 ;3
     DEY                        ;2
     STA    HMCLR               ;3
     BPL    .loopClouds         ;2³
     JMP    F4ED                ;3
.loopTreeTop:
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     LDA    TreeTopOne,Y        ;4
     STA    PF0                 ;3
     LDA    TreeTopTwo,Y        ;4
     STA    PF1                 ;3
     LDA    TreeTopThree,Y      ;4
     STA    PF2                 ;3
     LDA    TreeTopFour,Y       ;4
     STA    PF0                 ;3
     LDA    TreeTopFive,Y       ;4
     STA    PF1                 ;3
     LDA    TreeTopSix,Y        ;4
     STA    PF2                 ;3
     DEY                        ;2
     STA    HMCLR               ;3
     BPL    .loopTreeTop        ;2³
F4ED:
     INY                        ;2     Y = 0
     STY    PF0                 ;3
     STY    PF1                 ;3
     STY    PF2                 ;3
     STY    CTRLPF              ;3     playfield is asymentrical
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     LDA    xPosFineBird        ;3
     LDY    xPosCoarseBird      ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
.positionBird:
     DEY                        ;2
     BPL    .positionBird       ;2³
     STA    RESP0               ;3
     STA    HMP0                ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     LDX    manCurrentGfx       ;3
     BIT    $A0                 ;3
     BPL    F529                ;2³
     LDA    ManGraphicsTab,X    ;4
     STA    $8C                 ;3
     LDA    F9E7+1              ;4
     STA    $90                 ;3
     NOP                        ;2
     NOP                        ;2
     NOP                        ;2
     NOP                        ;2
     STA    HMCLR               ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     BNE    F549                ;2³
F529:
     TXA                        ;2
     SEC                        ;2
     SBC    #7                  ;2
     BCS    F531                ;2³
     LDA    #$FF                ;2
F531:
     TAX                        ;2
     INX                        ;2
     CPX    #3                  ;2
     BCC    F539                ;2³
     LDX    #0                  ;2
F539:
     LDA    F9E4,X              ;4
     STA    $8C                 ;3
     LDA    F9E7                ;4
     STA    $90                 ;3
     STA    HMCLR               ;3
     STA    WSYNC               ;3
     STA    HMOVE               ;3
F549:
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     LDA    #BROWNGREEN+5       ;2
     STA    COLUPF              ;3
     LDA    #8                  ;2
     STA    $99                 ;3
     STA    $9A                 ;3
     LDX    $A3                 ;3
     STX    $95                 ;3
     LDA    reflectSizeBird     ;3    bird
     STA    NUSIZ0              ;3
     STA    REFP0               ;3
     LDX    #0                  ;2
F563:
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     STA    COLUP0              ;3
     STX    GRP0                ;3
     LDA    $95                 ;3
     STA    GRP1                ;3    tree
     DEC    $96                 ;5
     LDY    $96                 ;3
     CPY    #$3C                ;2
     BEQ    F5BD                ;2³
     LDA    $9F                 ;3
     CPY    $98                 ;3
     BNE    F57F                ;2³
     ORA    #$80                ;2
F57F:
     CPY    $DF                 ;3
     BNE    F585                ;2³
     ORA    #$40                ;2
F585:
     STA    $9F                 ;3
     LDA    #0                  ;2
     CPY    $A6                 ;3
     BNE    F591                ;2³
     ORA    #$02                ;2
     AND    $E0                 ;3
F591:
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     STA    ENAM1               ;3
     LDX    $A3                 ;3
     STX    $95                 ;3
     BIT    $9F                 ;3
     BPL    F5A9                ;2³
     DEC    $9A                 ;5
     BMI    F5A9                ;2³
     LDY    $9A                 ;3
     LDA    ($8E),Y             ;5
     STA    $95                 ;3
F5A9:
     LDX    #0                  ;2
     BVC    F563                ;2³
     DEC    $99                 ;5
     BMI    F563                ;2³
     LDY    $99                 ;3
     LDA    (birdGfxPtr),Y      ;5
     AND    $DE                 ;3
     TAX                        ;2
     LDA    $D5                 ;3
     JMP    F563                ;3
F5BD:
     LDA    #0                  ;2
     STA    $9F                 ;3
     LDY    #7                  ;2

.loopHill:
     LDX    #0                  ;2
     LDA    $A3                 ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     STA    GRP1                ;3
     STX    ENAM1               ;3
     LDA    HillOne,Y           ;4
     STA    PF0                 ;3
     LDA    HillTwo,Y           ;4
     STA    PF1                 ;3
     LDA    HillThree,Y         ;4
     STA    PF2                 ;3
     LDA    HillFour,Y          ;4
     STA    PF0                 ;3
     LDA    HillFive,Y          ;4
     STA    PF1                 ;3
     LDA    HillSix,Y           ;4
     STA    PF2                 ;3
     STA    HMCLR               ;3
     DEY                        ;2
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     LDA    ColHillSkyTab,Y     ;4
     STA    COLUBK              ;3
     LDA    HillOne,Y           ;4
     STA    PF0                 ;3
     LDA    HillTwo,Y           ;4
     STA    PF1                 ;3
     LDA    HillThree,Y         ;4
     STA    PF2                 ;3
     LDA    HillFour,Y          ;4
     STA    PF0                 ;3
     LDA    HillFive,Y          ;4
     STA    PF1                 ;3
     LDA    HillSix,Y           ;4
     STA    PF2                 ;3
     STA    HMCLR               ;3
     DEC    $96                 ;5
     DEY                        ;2
     BPL    .loopHill           ;2³

     STY    ENABL               ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     LDA    #GREEN              ;2
     STA    COLUBK              ;3
     LDX    #0                  ;2
     STX    PF0                 ;3
     STX    PF1                 ;3
     STX    PF2                 ;3
     STX    CXCLR               ;3
     LDX    #BROWNGREEN         ;2
     STX    CTRLPF              ;3
     LDX    #TAN-1              ;2
     STX    COLUPF              ;3
     LDA    xPosFineMan         ;3
     LDY    xPosCoarseMan       ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
.positionMan:
     DEY                        ;2
     BPL    .positionMan        ;2³
     STA    RESP0               ;3
     STA    HMP0                ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     LDA    $A1                 ;3
     AND    #$0F                ;2
     STA    REFP0               ;3
     LDA    #EIGHT_CLOCKS       ;2
     STA    NUSIZ0              ;3
     LDA    #$10                ;2
     STA    $99                 ;3
     LSR                        ;2
     STA    $9A                 ;3
     LDX    $A3                 ;3
     STX    $95                 ;3
     LDX    #0                  ;2
     STA    HMCLR               ;3
F666:
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     STA    COLUP0              ;3
     STX    GRP0                ;3
     LDA    $95                 ;3
     STA    GRP1                ;3
     DEC    $96                 ;5
     LDY    $96                 ;3
     BEQ    F6BC                ;2³
     LDA    $9F                 ;3
     CPY    $98                 ;3
     BNE    F680                ;2³
     ORA    #$80                ;2
F680:
     CPY    $97                 ;3
     BNE    F686                ;2³
     ORA    #$40                ;2
F686:
     STA    $9F                 ;3
     LDA    #0                  ;2
     CPY    $A6                 ;3
     BNE    F692                ;2³
     ORA    #$02                ;2
     AND    $E0                 ;3
F692:
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     STA    ENAM1               ;3
     LDX    $A3                 ;3
     STX    $95                 ;3
     BIT    $9F                 ;3
     BPL    F6AA                ;2³
     DEC    $9A                 ;5
     BMI    F6AA                ;2³
     LDY    $9A                 ;3
     LDA    ($8E),Y             ;5
     STA    $95                 ;3
F6AA:
     LDX    #0                  ;2
     BVC    F666                ;2³
     DEC    $99                 ;5
     BMI    F666                ;2³
     LDY    $99                 ;3
     LDA    ($8C),Y             ;5
     TAX                        ;2
     LDA    ($90),Y             ;5
     JMP    F666                ;3
F6BC:
     STY    $95                 ;3
     STY    ENAM1               ;3
     LDA    $AD                 ;3
     STA    PF2                 ;3
     TYA                        ;2
     BIT    $9F                 ;3
     BVC    F6D1                ;2³
     DEC    $99                 ;5
     BMI    F6D1                ;2³
     LDY    $99                 ;3
     LDA    ($8C),Y             ;5
F6D1:
     LDY    xPosCoarseAnimal    ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     TAX                        ;2
     LDA    #8                  ;2
     STA    $9A                 ;3
     LDA    xPosFineAnimal      ;3
.positionAnimal:
     DEY                        ;2
     BPL    .positionAnimal     ;2³
     STA    RESP1               ;3
     STA    HMP1                ;3
F6E5:
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     LDA    #MAROON             ;2
     STA    COLUP0              ;3
     STX    GRP0                ;3
     LDA    $95                 ;3
     STA    GRP1                ;3
     LDA    reflectSizeAnimal   ;3
     STA    NUSIZ1              ;3
     STA    REFP1               ;3
     DEC    $9A                 ;5
     BMI    F733                ;2³+1
     LDY    $9A                 ;3
     LDA    $C9                 ;3
     STA    COLUP1              ;3
     LDA    (animalGfxPtr),Y    ;5
     AND    $B9                 ;3
     STA    $95                 ;3
     STA    HMCLR               ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     LDA    #GREEN+2            ;2
     STA    COLUBK              ;3
     LDX    #7                  ;2
     CPX    $9A                 ;3
     BNE    F71F                ;2³
     BIT    $A0                 ;3
     BPL    F71F                ;2³
     STA    CXCLR               ;3
F71F:
     LDX    #0                  ;2
     BIT    $9F                 ;3
     BVC    F730                ;2³
     DEC    $99                 ;5
     BMI    F730                ;2³
     LDY    $99                 ;3
     LDA    ($8C),Y             ;5
     TAX                        ;2
     LDA    #$86                ;2
F730:
     JMP    F6E5                ;3
F733:
     LDA    #TAN                ;2     this is where the bump in scanline occurs
     STA    COLUBK              ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     LDA    #0                  ;2
     STA    GRP0                ;3
     STA    GRP1                ;3
     STA    ENAM1               ;3
     STA    PF2                 ;3
     STA    COLUPF              ;3
;--------------------------------------
     STA    WSYNC               ;3
     STA    WSYNC               ;3
     STA    WSYNC               ;3     4 lines
     STA    WSYNC               ;3
;--------------------------------------
     LDA    #TAN                ;2
     JSR    DrawScoreLogo       ;6
     LDA    displayMarker       ;3
     STA    displayType         ;3
     LDA    #TIME_TO_LOGO       ;2
     STA    TIM64T              ;4
     JSR    ScoreLogoPointers   ;6
.waitToDrawLogo:
     LDA    INTIM               ;4
     BNE    .waitToDrawLogo     ;2³
     LDA    #TAN                ;2
     JSR    DrawScoreLogo       ;6
     LDA    #BLACK              ;2
     STA    COLUBK              ;3
     STA    WSYNC               ;3
;--------------------------------------
     LDA    #TIME_OVERSCAN      ;2
     STA    TIM64T              ;4
     LDA    #DO_SCORE           ;2
     STA    displayType         ;3
     JSR    ScoreLogoPointers   ;6
     LDY    #$4A                ;2
     LDA    screenType          ;3
     TAX                        ;2
     BPL    F786                ;2³
     LDA    #0                  ;2
     TAX                        ;2
F786:
     CMP    #2                  ;2
     BCS    F790                ;2³
     LDA    #0                  ;2
     STA    $A3                 ;3
     BEQ    F79D                ;2³
F790:
     BNE    F798                ;2³
     LDA    #$FF                ;2
     STA    $A3                 ;3
     BNE    F79D                ;2³
F798:
     LDA    #0                  ;2
     STA    $A3                 ;3
     TAX                        ;2
F79D:
     STX    screenType          ;3
     LDA    manCurrentGfx       ;3
     CMP    #MAN_TURN_FRONT     ;2
     BEQ    F7B0                ;2³
     JSR    DecrementTimer      ;6
     BNE    F7B0                ;2³
     DEC    numOfLives          ;5
     LDA    #$50                ;2
     STA    timerHi             ;3     restart time
F7B0:
     LDA    $A6                 ;3
     BNE    F7B9                ;2³
     STA    $E0                 ;3
     JMP    F029                ;3
F7B9:
     DEC    $A6                 ;5
     JMP    F029                ;3
F7BE:
     LDA    #0                  ;2
     STA    $B9                 ;3
     LDX    manCurrentGfx       ;3
     CPX    #MAN_TURN_FRONT     ;2
     BNE    F7CC                ;2³
     STA    $E3                 ;3
     BEQ    F83A                ;2³+1
F7CC:
     LDA    #$FF                ;2
     STA    $E3                 ;3
     JSR    F967                ;6
     ORA    #$0C                ;2
     STA    $C9                 ;3
     JSR    F967                ;6
     AND    #$03                ;2
     ASL                        ;2
     STA    $CB                 ;3
     JSR    F967                ;6
     AND    #$03                ;2
     ORA    #$01                ;2
     STA    $CC                 ;3
     LDA    $A5                 ;3
     ASL                        ;2
     STA    $BE                 ;3
     LDA    #$48                ;2
     SBC    $BE                 ;3
     CMP    #5                  ;2
     BCS    F7F7                ;2³
     LDA    #5                  ;2
F7F7:
     STA    $CA                 ;3
     LDA    $A5                 ;3
     LSR                        ;2
     STA    $BD                 ;3
     JSR    F967                ;6
     ADC    $BD                 ;3
     ORA    #$01                ;2
     STA    $D1                 ;3
     JSR    F967                ;6
     AND    #$0F                ;2
     BNE    F810                ;2³
     LDA    #1                  ;2
F810:
     TAY                        ;2
     LDX    $9C                 ;3
     CPX    #$28                ;2
     BCS    F81B                ;2³
     LDA    #8                  ;2
     BNE    F825                ;2³
F81B:
     CPX    #$78                ;2
     BCC    F823                ;2³
     LDA    #0                  ;2
     BEQ    F825                ;2³
F823:
     AND    #$08                ;2
F825:
     STA    reflectSizeAnimal   ;3
     TYA                        ;2
     AND    #$01                ;2
     TAX                        ;2
     LDA    AnimalRefSizTab,X   ;4
     ORA    reflectSizeAnimal   ;3
     STA    reflectSizeAnimal   ;3
     LDX    #$9B                ;2
     AND    #$08                ;2
     BNE    F83A                ;2³
     LDX    #8                  ;2
F83A:
     STX    $D0                 ;3
     LDA    $A3                 ;3
     BEQ    F84E                ;2³
     LDA    $CB                 ;3
     BNE    F84E                ;2³
     LDA    #$80                ;2
     ORA    reflectSizeAnimal   ;3
     STA    reflectSizeAnimal   ;3
     LDX    #$50                ;2
     STX    $D0                 ;3
F84E:
     TXA                        ;2
     RTS                        ;6

F850:
     LDA    #0                  ;2
     STA    $E0                 ;3
     STA    $DE                 ;3
     JSR    F967                ;6
     ORA    #$0F                ;2
     STA    $D5                 ;3
     JSR    F967                ;6
     STA    $E2                 ;3
     LDA    #$3C                ;2
     STA    $DF                 ;3
     LDA    $A5                 ;3
     AND    #$07                ;2
     STA    $BD                 ;3
     LDA    #0                  ;2
     STA    $D7                 ;3
     LDA    #4                  ;2
     CLC                        ;2
     SBC    $BD                 ;3
     CMP    #1                  ;2
     BCS    F87B                ;2³
     LDA    #1                  ;2
F87B:
     STA    $D8                 ;3     D8 always one now
     LDA    #$30                ;2
     STA    $D6                 ;3
     JSR    F967                ;6
     AND    #$0F                ;2
     BNE    F88A                ;2³
     LDA    #1                  ;2
F88A:
     TAY                        ;2
     AND    #$08                ;2
     STA    reflectSizeBird     ;3
     TYA                        ;2
     AND    #$01                ;2
     TAX                        ;2
     LDA    BirdRefSizTab,X     ;4
     ORA    reflectSizeBird     ;3
     STA    reflectSizeBird     ;3
     JSR    F967                ;6
     AND    #$3F                ;2
     ADC    #$10                ;2
     STA    $DC                 ;3
     RTS                        ;6

F8A4:
     LDX    #MAN_CLIMB_ONE      ;2
     LDA    $A2                 ;3
     BVS    F8B3                ;2³
     ORA    #$40                ;2
     STA    $A2                 ;3
     STX    manCurrentGfx       ;3
     JMP    F8BA                ;3
F8B3:
     INX                        ;2     MAN_CLIMB_TWO
     STX    manCurrentGfx       ;3
     AND    #$BF                ;2
     STA    $A2                 ;3
F8BA:
     RTS                        ;6

F8BB:
     BIT    $A3                 ;3
     BPL    F8F4                ;2³
     CLC                        ;2
     LDA    #8                  ;2
     ADC    $9B                 ;3
     SEC                        ;2
     SBC    $9C                 ;3
     BCS    F8DD                ;2³
     CMP    #$F6                ;2
     BCC    F8F4                ;2³
     LDA    $9B                 ;3
     CLC                        ;2
     ADC    #$0D                ;2
     STA    $9C                 ;3
     LDA    $A1                 ;3
     ORA    #$08                ;2
     STA    $A1                 ;3
     JMP    F8EE                ;3
F8DD:
     CMP    #$0A                ;2
     BCS    F8F4                ;2³
     LDA    $9B                 ;3
     SEC                        ;2
     SBC    #4                  ;2
     STA    $9C                 ;3
     LDA    $A1                 ;3
     AND    #$F0                ;2
     STA    $A1                 ;3
F8EE:
     LDA    #$80                ;2
     ORA    $A2                 ;3
     STA    $A2                 ;3
F8F4:
     RTS                        ;6

ChopTree SUBROUTINE
     BIT    $A3                 ;3
     BPL    .exitChopTree       ;2³+1
     LDA    #$0F                ;2
     BIT    $A2                 ;3
     BNE    .exitChopTree       ;2³+1
     ORA    $A2                 ;3
     STA    $A2                 ;3
     LDA    $B6                 ;3
     AND    #$F0                ;2
     LSR                        ;2
     LSR                        ;2
     LSR                        ;2
     LSR                        ;2
     TAX                        ;2
     SEC                        ;2
     SBC    #3                  ;2
     BEQ    .exitChopTree       ;2³
     ASL                        ;2
     STA    $BD                 ;3
F914:
     LDA    $AE,X               ;4
     TAY                        ;2
     AND    #$0F                ;2
     STA    $BE                 ;3
     TYA                        ;2
     LSR                        ;2
     AND    #$F0                ;2
     ORA    $BE                 ;3
     STA    $AE,X               ;4
     DEX                        ;2
     DEC    $BD                 ;5
     BNE    F914                ;2³
     LDA    #1                  ;2
     STA    $A8                 ;3
     JSR    FB4C                ;6
.exitChopTree:
     RTS                        ;6

F930:
     BIT    $A3                 ;3
     BPL    F966                ;2³
     LDA    #$0F                ;2
     BIT    $A2                 ;3
     BNE    F966                ;2³
     ORA    $A2                 ;3
     STA    $A2                 ;3
     LDA    $B6                 ;3
     AND    #$0F                ;2
     TAX                        ;2
     SEC                        ;2
     SBC    #3                  ;2
     BEQ    F966                ;2³
     ASL                        ;2
     STA    $BD                 ;3
F94B:
     LDA    $AE,X               ;4
     TAY                        ;2
     AND    #$F0                ;2
     STA    $BE                 ;3
     TYA                        ;2
     ASL                        ;2
     AND    #$0F                ;2
     ORA    $BE                 ;3
     STA    $AE,X               ;4
     DEX                        ;2
     DEC    $BD                 ;5
     BNE    F94B                ;2³
     LDA    #1                  ;2
     STA    $A8                 ;3
     JSR    FB4C                ;6
F966:
     RTS                        ;6

F967:
     LDA    $9C                 ;3
     ORA    scoreBCD+1          ;3
     EOR    $9E                 ;3
     EOR    $D2                 ;3
     LSR                        ;2
     STA    $D2                 ;3
     RTS                        ;6
;-------------------------------------------

GameReset SUBROUTINE
     LDA    F9E7+1              ;4
     STA    $90                 ;3
     LDA    #$50                ;2     set timer to 5000
     STA    timerHi             ;3
     LDY    #0                  ;2
     STY    $BF                 ;3
     STY    timerLo             ;3

     LDX    #9                  ;2
.clearRamOne:
     STY    $A1,X               ;4    zeros in $A1 - $AA
     DEX                        ;2
     BPL    .clearRamOne        ;2³

     DEY                        ;2
     STY    $8D                 ;3  = $FF
     STY    $91                 ;3  = $FF

     LDX    #7                  ;2
.fillRam:
     STY    $AE,X               ;4    ones in $AE - $B5
     DEX                        ;2
     BPL    .fillRam            ;2³

     DEY                        ;2
     STY    $8B                 ;3  = $FE
     STY    $89                 ;3  = $FE
     STY    $87                 ;3  = $FE
     STY    $85                 ;3  = $FE
     STY    $83                 ;3  = $FE
     STY    $81                 ;3  = $FE

     LDA    #8                  ;2
     STA    $97                 ;3

     LDA    #$10                ;2
     STA    $9C                 ;3

     LDA    #$33                ;2
     STA    $B6                 ;3

     LDA    #MAN_STAND_STILL    ;2
     STA    manCurrentGfx       ;3

     LDA    #$58                ;2
     STA    $8E                 ;3

     LDA    #$4A                ;2
     STA    $9B                 ;3

     JSR    F7BE                ;6
     JSR    F850                ;6

     LDA    #$FD                ;2
     STA    animalGfxPtr+1      ;3
     STA    birdGfxPtr+1        ;3

     LDA    #3                  ;2
     STA    $AB                 ;3

     LDX    #15                 ;2
     LDA    #0                  ;2
.clearRamTwo:
     STA    $E4,X               ;4     zeros in $E4 - $F3
     DEX                        ;2
     BPL    .clearRamTwo        ;2³

     LDA    #0                  ;2
     STA    AUDV0               ;3     kill volume
     STA    AUDV1               ;3
     RTS                        ;6

;-------------------------------------------

ManGraphicsTab:
     .byte StepOne,StepTwo,StepThree,StandingStill,Jumping
     .byte ClimbingOne,ClimbingTwo,SwingAxeOut,SwingAxeDown,FrontTurn
F9E4:
     .byte $A0 ; |X X     | $F9E4
     .byte $B0 ; |X XX    | $F9E5
     .byte $C0 ; |XX      | $F9E6

F9E7:
     .byte MFD0,MFE0   ; stored in $90, ($90),Y = $FFD0, $FFE0

FieldObjLoTab:
     .byte HouseOne,HouseTwo, $AE   ; $AE tree

FieldObjHiTab:
     .byte >HouseOne,>HouseTwo, $00

ColFieldObjTab:
     .byte TAN+3,BROWN,TAN-1

F9F2:
     .byte $28,$1E,$08

FieldObjPosTab:
    .byte $30,$60,$4A

FieldObjSizeTab:
     .byte DOUBLE_SIZE,DOUBLE_SIZE,DOUBLE_SIZE

AnimalTab:
     .byte SnakeUp,SnakeDown,PigAAFeetOpen,PigAAFeetShut
     .byte BirdWingDown,BirdWingUp,PigBBFeetOpen,PigBBFeetShut

BirdTab:
     .byte BirdWingDown,BirdWingUp

AnimalRefSizTab:
     .byte $00,$05

BirdRefSizTab:
     .byte $00,$05

;-------------------------------------------

HillOne:
     .byte %11110000 ; |XXXX    | $FA09
     .byte %11110000 ; |XXXX    | $FA0A
     .byte %11110000 ; |XXXX    | $FA0B
     .byte %11000000 ; |XX      | $FA0C
     .byte %00000000 ; |        | $FA0D
     .byte %00000000 ; |        | $FA0E
     .byte %00000000 ; |        | $FA0F
     .byte %00000000 ; |        | $FA10
HillTwo:
     .byte %11111111 ; |XXXXXXXX| $FA11
     .byte %11111111 ; |XXXXXXXX| $FA12
     .byte %11111111 ; |XXXXXXXX| $FA13
     .byte %11111111 ; |XXXXXXXX| $FA14
     .byte %11111111 ; |XXXXXXXX| $FA15
     .byte %00111111 ; |  XXXXXX| $FA16
     .byte %00001111 ; |    XXXX| $FA17
     .byte %00000000 ; |        | $FA18
HillThree:
     .byte %11111111 ; |XXXXXXXX| $FA19
     .byte %11111111 ; |XXXXXXXX| $FA1A
     .byte %11111111 ; |XXXXXXXX| $FA1B
     .byte %00111111 ; |  XXXXXX| $FA1C
     .byte %00001111 ; |    XXXX| $FA1D
     .byte %00000011 ; |      XX| $FA1E
     .byte %00000000 ; |        | $FA1F
     .byte %00000000 ; |        | $FA20
HillFour:
     .byte %11110000 ; |XXXX    | $FA21
     .byte %11110000 ; |XXXX    | $FA22
     .byte %11110000 ; |XXXX    | $FA23
     .byte %11000000 ; |XX      | $FA24
     .byte %11000000 ; |XX      | $FA25
     .byte %00000000 ; |        | $FA26
     .byte %00000000 ; |        | $FA27
     .byte %00000000 ; |        | $FA28
HillFive:
     .byte %11111111 ; |XXXXXXXX| $FA29
     .byte %11111111 ; |XXXXXXXX| $FA2A
     .byte %11111111 ; |XXXXXXXX| $FA2B
     .byte %11111111 ; |XXXXXXXX| $FA2C
     .byte %11111111 ; |XXXXXXXX| $FA2D
     .byte %11111111 ; |XXXXXXXX| $FA2E
     .byte %00011111 ; |   XXXXX| $FA2F
     .byte %00000111 ; |     XXX| $FA30
HillSix:
     .byte %11111111 ; |XXXXXXXX| $FA31
     .byte %11111111 ; |XXXXXXXX| $FA32
     .byte %11111111 ; |XXXXXXXX| $FA33
     .byte %11111111 ; |XXXXXXXX| $FA34
     .byte %11111111 ; |XXXXXXXX| $FA35
     .byte %00011111 ; |   XXXXX| $FA36
     .byte %00000111 ; |     XXX| $FA37
     .byte %00000001 ; |       X| $FA38

ColHillSkyTab:
     .byte TAN+11,TAN+11,BROWN+8,BROWN+7
     .byte MAROON+7,MAROON+6,MAROON+5,MAROON+4

DecrementTimer SUBROUTINE
     SED                        ;2
     SEC                        ;2
     LDA    timerLo             ;3
     SBC    #1                  ;2
     STA    timerLo             ;3
     LDA    timerHi             ;3
     SBC    #0                  ;2
     STA    timerHi             ;3
     CLD                        ;2
     ORA    timerLo             ;3
     RTS                        ;6

FA53:
     LDX    #2                  ;2
     SED                        ;2
     CLC                        ;2
FA57:
     LDA    $BF,X               ;4
     ADC    scoreBCD,X          ;4
     STA    scoreBCD,X          ;4
     DEX                        ;2
     BPL    FA57                ;2³
     CLD                        ;2
     RTS                        ;6

DrawScoreLogo:
     STA    WSYNC               ;3
;--------------------------------------
     STA    COLUBK              ;3
     LDA    #0                  ;2
     STA    GRP0                ;3
     STA    GRP1                ;3
     STA    PF0                 ;3
     STA    PF1                 ;3
     STA    PF2                 ;3
     NOP                        ;2
     STA    HMP0                ;3
     STA    RESP0               ;3
     STA    RESP1               ;3
     STA    REFP0               ;3
     STA    REFP1               ;3
     LDA    #THREE_COPIES       ;2
     STA    NUSIZ0              ;3
     STA    NUSIZ1              ;3
     LDA    #7                  ;2
     STA    scoreSpriteLine     ;3
     STA    VDELP0              ;3
     STA    VDELP1              ;3
     LDA    #$10                ;2
     STA    HMP1                ;3
     STA    WSYNC               ;3
;--------------------------------------
     STA    HMOVE               ;3
     LDA    #0                  ;2
     STA    GRP0                ;3
     STA    GRP1                ;3
     LDA    #WHITE+$F0          ;2     same white color as #$0F
     STA    COLUP0              ;3
     STA    COLUP1              ;3
.loopScore:
     LDY    scoreSpriteLine     ;3
     LDA    (scorePtrs+10),Y    ;5
     STA    tempStorage+1       ;3
     LDA    (scorePtrs+8),Y     ;5
     TAX                        ;2
     LDA    (scorePtrs),Y       ;5
     STA    WSYNC               ;3
;--------------------------------------
     NOP                        ;2
     STA    GRP0                ;3
     LDA    (scorePtrs+2),Y     ;5
     STA    GRP1                ;3
     LDA    (scorePtrs+4),Y     ;5
     STA    GRP0                ;3
     LDA    (scorePtrs+6),Y     ;5
     LDY    tempStorage+1       ;3
     STA    GRP1                ;3
     STX    GRP0                ;3
     STY    GRP1                ;3
     STA    GRP0                ;3
     DEC    scoreSpriteLine     ;5
     BPL    .loopScore          ;2³
     STA    WSYNC               ;3
;--------------------------------------
     LDA    #0                  ;2
     STA    VDELP0              ;3
     STA    VDELP1              ;3
     STA    GRP0                ;3
     STA    GRP1                ;3
     RTS                        ;6

;-------------------------------------------

ScoreLogoPointers SUBROUTINE
     LDA    #$80                ;2
     AND    displayType         ;3
     BEQ    .doScore            ;2³
     LDA    #<LogoSix           ;2
     STA    logoPtrs+10         ;3
     LDA    #<LogoFive          ;2
     STA    logoPtrs+8          ;3
     LDA    #<LogoFour          ;2
     STA    logoPtrs+6          ;3
     LDA    #<LogoThree         ;2
     STA    logoPtrs+4          ;3
     LDA    #<LogoTwo           ;2
     STA    logoPtrs+2          ;3
     LDA    #<LogoOne           ;2
     STA    logoPtrs            ;3
     RTS                        ;6

.doScore:
     LDA    #$20                ;2
     AND    displayType         ;3
     BEQ    .doTimer            ;2³+1
     LDA    scoreBCD            ;3
     STA    copyScoreBCD        ;3
     LDA    scoreBCD+1          ;3
     STA    copyScoreBCD+1      ;3
     LDA    scoreBCD+2          ;3
     STA    copyScoreBCD+2      ;3
     JSR    FB1F                ;6
     RTS                        ;6

.doTimer:
     LDA    #$0F                ;2
     AND    displayType         ;3
     BEQ    .exitTimer          ;2³
     LDA    $BF                 ;3
     STA    copyScoreBCD        ;3
     LDA    timerHi             ;3
     STA    copyTimer+1         ;3
     LDA    timerLo             ;3
     STA    copyTimer+2         ;3
     JSR    FB1F                ;6
.exitTimer:
     RTS                        ;6

FB1F:
     LDX    #2                  ;2
FB21:
     TXA                        ;2
     ASL                        ;2
     ASL                        ;2
     TAY                        ;2
     LDA    copyScoreBCD,X      ;4
     AND    #$F0                ;2
     LSR                        ;2
     STA.wy $80,Y               ;5
     LDA    copyScoreBCD,X      ;4
     AND    #$0F                ;2
     ASL                        ;2
     ASL                        ;2
     ASL                        ;2
     STA.wy $82,Y               ;5
     DEX                        ;2
     BPL    FB21                ;2³
     INX                        ;2
.loopBlankScore:
     LDA    $80,X               ;4
     CMP    #0                  ;2    after logo drawn, prepare for next frame
     BNE    .exitBlankScore     ;2³
     LDA    #<Blank             ;2
     STA    $80,X               ;4
     INX                        ;2
     INX                        ;2
     CPX    #9                  ;2    2nd last digit
     BCC    .loopBlankScore     ;2³
.exitBlankScore:
     RTS                        ;6
;-------------------------------------------
FB4C:
     LDX    #2                  ;2
     LDY    #0                  ;2
     SED                        ;2
     CLC                        ;2
.logoMoveClear:
     LDA    $A7,X               ;4  $A7, $A8, $A9
     ADC    scoreBCD,X               ;4  $BA, $BB, $BC
     STA    scoreBCD,X               ;4
     STY    $A7,X               ;4  moving and clearing
     DEX                        ;2
     BPL    .logoMoveClear      ;2³
     CLD                        ;2
     RTS                        ;6

CalcHorizPos:
     SEC                        ;2
     SBC    #8                  ;2
     LDY    #2                  ;2
     SEC                        ;2
.divideLoop:
     INY                        ;2
     SBC    #$0F                ;2
     BCS    .divideLoop         ;2³
     EOR    #$FF                ;2
     SBC    #6                  ;2
     ASL                        ;2
     ASL                        ;2
     ASL                        ;2
     ASL                        ;2
     RTS                        ;6

FB73:
     LDA    $E4                 ;3
     STA    AUDC0               ;3
     LDA    $EA                 ;3
     BNE    FBA4                ;2³
     LDY    $E9                 ;3
     INC    $E9                 ;5
     LDA    ($E7),Y             ;5
     BNE    FB8C                ;2³
     STA    AUDV0               ;3
     STA    $E4                 ;3
     STA    $E9                 ;3
     STA    $F4                 ;3
     RTS                        ;6

FB8C:
     LDX    $E5                 ;3
     STX    $EA                 ;3
     STA    AUDF0               ;3
     TAX                        ;2
     AND    #$0F                ;2
     BNE    FB9B                ;2³
     STA    $EB                 ;3
     BEQ    FBA4                ;2³
FB9B:
     TXA                        ;2
     AND    #$80                ;2
     ORA    $E6                 ;3
     STA    $EB                 ;3
     BNE    FBAE                ;2³
FBA4:
     DEC    $EA                 ;5
     LDA    $EB                 ;3
     BMI    FBAE                ;2³
     BEQ    FBAE                ;2³
     DEC    $EB                 ;5
FBAE:
     STA    AUDV0               ;3
     RTS                        ;6

FBB1:
     LDA    $EC                 ;3
     STA    AUDC1               ;3
     LDA    $F2                 ;3
     BNE    FBE0                ;2³
     LDY    $F1                 ;3
     INC    $F1                 ;5
     LDA    ($EF),Y             ;5
     BNE    FBC8                ;2³
     STA    AUDV1               ;3
     STA    $EC                 ;3
     STA    $F1                 ;3
     RTS                        ;6

FBC8:
     LDX    $ED                 ;3
     STX    $F2                 ;3
     STA    AUDF1               ;3
     TAX                        ;2
     AND    #$0F                ;2
     BNE    FBD7                ;2³
     STA    $F3                 ;3
     BEQ    FBE0                ;2³
FBD7:
     TXA                        ;2
     AND    #$80                ;2
     ORA    $EE                 ;3
     STA    $F3                 ;3
     BNE    FBEA                ;2³
FBE0:
     DEC    $F2                 ;5
     LDA    $F3                 ;3
     BMI    FBEA                ;2³
     BEQ    FBEA                ;2³
     DEC    $F3                 ;5
FBEA:
     STA    AUDV1               ;3
     RTS                        ;6

FBED:
     LDY    #$10                ;2
     LDA    reflectSizeAnimal   ;3
     TAX                        ;2
     AND    #$88                ;2
     STA    $BD                 ;3
     AND    #$08                ;2
     BNE    FBFC                ;2³
     LDY    #0                  ;2
FBFC:
     STY    $BE                 ;3
     TXA                        ;2
     AND    #$07                ;2
     TAX                        ;2
     BEQ    FC1D                ;2³
     CMP    #4                  ;2
     BCS    FC1D                ;2³
     AND    #$01                ;2
     BEQ    FC1D                ;2³
     TXA                        ;2
     LSR                        ;2
     AND    reflectSizeAnimal   ;3
     ORA    $BD                 ;3
     STA    reflectSizeAnimal   ;3
     LDA    $D0                 ;3
     CLC                        ;2
     ADC    $BE                 ;3
     STA    $D0                 ;3
     SEC                        ;2
     RTS                        ;6

FC1D:
     CLC                        ;2
     RTS                        ;6

FC1F:
     LDX    $F4                 ;3
     BPL    FC2A                ;2³
     LDA    #0                  ;2
     STA    AUDV0               ;3
     STA    AUDV1               ;3
     RTS                        ;6

FC2A:
     BEQ    FCA9                ;2³
     CPX    #1                  ;2
     BNE    FC56                ;2³
     CPX    $F5                 ;3
     BEQ    FC44                ;2³
     STX    $F5                 ;3
     LDA    #8                  ;2
     STA    AUDC0               ;3
     STA    $E4                 ;3
     LDA    #$1F                ;2
     STA    AUDF0               ;3
     LDA    #$10                ;2
     STA    $EA                 ;3
FC44:
     DEC    $EA                 ;5
     LDA    $EA                 ;3
     STA    AUDV0               ;3
     BEQ    FC4E                ;2³
     BNE    FCA9                ;2³
FC4E:
     STA    AUDC0               ;3
     STA    $F4                 ;3
     STA    $E4                 ;3
     BEQ    FCA9                ;2³
FC56:
     CPX    #2                  ;2
     BNE    FC72                ;2³
     CPX    $F5                 ;3
     BEQ    FC6C                ;2³
     STX    $F5                 ;3
     LDX    #5                  ;2
FC62:
     LDA    FCE2,X              ;4
     STA    $E4,X               ;4
     STX    $EA                 ;3
     DEX                        ;2
     BPL    FC62                ;2³
FC6C:
     JSR    FB73                ;6
     JMP    FCA9                ;3
FC72:
     CPX    #4                  ;2
     BNE    FCA9                ;2³
     CPX    $F5                 ;3
     BEQ    FC94                ;2³
     STX    $F5                 ;3
     LDX    #5                  ;2
FC7E:
     LDA    FCE8,X              ;4
     STA    $E4,X               ;4
     STX    $EA                 ;3
     DEX                        ;2
     BPL    FC7E                ;2³
     LDX    #5                  ;2
FC8A:
     LDA    FCEE,X              ;4
     STA    $EC,X               ;4
     STX    $F2                 ;3
     DEX                        ;2
     BPL    FC8A                ;2³
FC94:
     LDA    $EA                 ;3
     STA    $F2                 ;3
     LDA    $E9                 ;3
     STA    $F1                 ;3
     JSR    FB73                ;6
     JSR    FBB1                ;6
     LDA    $E4                 ;3
     BNE    FCE1                ;2³
     STA    $AA                 ;3
     RTS                        ;6

FCA9:
     LDA    $EC                 ;3
     BNE    FCB7                ;2³
     LDX    #5                  ;2
FCAF:
     LDA    FD22,X              ;4
     STA    $EC,X               ;4
     DEX                        ;2
     BPL    FCAF                ;2³
FCB7:
     JSR    FBB1                ;6
     LDX    $F4                 ;3
     BNE    FCE1                ;2³
     CPX    $F5                 ;3
     BEQ    FCC8                ;2³
     LDX    $F2                 ;3
     BNE    FCE1                ;2³
     STX    $F5                 ;3
FCC8:
     LDX    #5                  ;2
FCCA:
     LDA    FD1C,X              ;4
     STA    $E4,X               ;4
     DEX                        ;2
     BPL    FCCA                ;2³
     LDA    $F2                 ;3
     STA    $EA                 ;3
     LDA    $F1                 ;3
     STA    $E9                 ;3
     LDA    $F3                 ;3
     STA    $EB                 ;3
     JSR    FB73                ;6
FCE1:
     RTS                        ;6

FCE2:
     .byte $04,$03,$0F,$F4,$FC,$00
FCE8:
     .byte $0C,$0C,$0D,$FA,$FC,$00
FCEE:
     .byte $0C,$0C,$0F,$0B,$FD,$00,$9D,$9B,$97,$95,$93,$00,$8C,$8C,$8C,$0C
     .byte $8F,$8F,$8F,$0F,$0C,$0E,$0F,$11,$8F,$8F,$8F,$0F,$00,$93,$93,$93
     .byte $13,$9A,$9A,$9A,$1A,$13,$1A,$17,$14,$93,$93,$93,$13,$00
FD1C:
     .byte $0C,$0C,$0A,$6A,$FD,$00
FD22:
     .byte $0C,$0C,$09,$28,$FD,$00,$80,$13,$13,$13,$0F,$0C,$0C,$0C,$0C,$0B
     .byte $0B,$0B,$09,$8C,$8C,$8C,$0C,$0E,$0E,$0E,$0B,$0F,$0F,$0F,$0F,$11
     .byte $11,$11,$11,$8C,$8C,$8C,$0C,$13,$13,$13,$0F,$0C,$0C,$0C,$0C,$0B
     .byte $0B,$0B,$09,$8C,$8C,$8C,$0C,$0E,$0E,$0E,$0B,$0F,$0F,$0F,$0F,$11
     .byte $11,$11,$0F,$93,$93,$93,$13,$00,$80,$13,$13,$13,$17,$1A,$13,$13
     .byte $13,$0E,$0E,$0B,$0E,$8F,$8F,$8F,$0F,$11,$11,$11,$0E,$13,$13,$13
     .byte $13,$14,$14,$14,$14,$91,$91,$91,$11,$13,$13,$13,$17,$1A,$13,$13
     .byte $13,$0E,$0E,$0B,$0E,$8F,$8F,$8F,$0F,$11,$11,$11,$0E,$13,$13,$13
     .byte $13,$14,$17,$1A,$14,$93,$93,$93,$13,$00,$D2,$A0,$A3,$A4,$B0,$B1
     .byte $8D,$A0,$D3,$D4,$C1,$A0,$BE,$CF,$C2,$CA,$C3,$C1,$D4,$8D

SnakeUp:
     .byte %01000011 ; | X    XX| $FDC0
     .byte %01010101 ; | X X X X| $FDC1
     .byte %00101001 ; |  X X  X| $FDC2
     .byte %00000001 ; |       X| $FDC3
     .byte %00000010 ; |      X | $FDC4
     .byte %00000011 ; |      XX| $FDC5
     .byte %00000000 ; |        | $FDC6
     .byte %00000000 ; |        | $FDC7
SnakeDown:
     .byte %11010111 ; |XX X XXX| $FDC8
     .byte %00101001 ; |  X X  X| $FDC9
     .byte %00000001 ; |       X| $FDCA
     .byte %00000001 ; |       X| $FDCB
     .byte %00000010 ; |      X | $FDCC
     .byte %00000011 ; |      XX| $FDCD
     .byte %00000000 ; |        | $FDCE
     .byte %00000000 ; |        | $FDCF
PigAAFeetOpen:
     .byte %10000010 ; |X     X | $FDD0
     .byte %10000010 ; |X     X | $FDD1
     .byte %11111110 ; |XXXXXXX | $FDD2
     .byte %11111111 ; |XXXXXXXX| $FDD3
     .byte %11111111 ; |XXXXXXXX| $FDD4
     .byte %11111110 ; |XXXXXXX | $FDD5
     .byte %01111110 ; | XXXXXX | $FDD6
     .byte %00000100 ; |     X  | $FDD7
PigAAFeetShut:
     .byte %00101000 ; |  X X   | $FDD8
     .byte %01000100 ; | X   X  | $FDD9
     .byte %11111110 ; |XXXXXXX | $FDDA
     .byte %11111111 ; |XXXXXXXX| $FDDB
     .byte %11111110 ; |XXXXXXX | $FDDC
     .byte %11111111 ; |XXXXXXXX| $FDDD
     .byte %01111110 ; | XXXXXX | $FDDE
     .byte %00000100 ; |     X  | $FDDF
BirdWingDown:
     .byte %00010000 ; |   X    | $FDE0
     .byte %00011000 ; |   XX   | $FDE1
     .byte %00111100 ; |  XXXX  | $FDE2
     .byte %01111110 ; | XXXXXX | $FDE3
     .byte %11111110 ; |XXXXXXX | $FDE4
     .byte %00000010 ; |      X | $FDE5
     .byte %00000011 ; |      XX| $FDE6
     .byte %00000000 ; |        | $FDE7
BirdWingUp:
     .byte %00000000 ; |        | $FDE8
     .byte %00000000 ; |        | $FDE9
     .byte %00000000 ; |        | $FDEA
     .byte %01111110 ; | XXXXXX | $FDEB
     .byte %11111110 ; |XXXXXXX | $FDEC
     .byte %00011110 ; |   XXXX | $FDED
     .byte %00011011 ; |   XX XX| $FDEE
     .byte %00010000 ; |   X    | $FDEF
PigBBFeetOpen:
     .byte %10000010 ; |X     X | $FDF0
     .byte %10000010 ; |X     X | $FDF1
     .byte %11111110 ; |XXXXXXX | $FDF2
     .byte %11111111 ; |XXXXXXXX| $FDF3
     .byte %11111111 ; |XXXXXXXX| $FDF4
     .byte %11111110 ; |XXXXXXX | $FDF5
     .byte %01111110 ; | XXXXXX | $FDF6
     .byte %00000100 ; |     X  | $FDF7
PigBBFeetShut:
     .byte %00101000 ; |  X X   | $FDF8
     .byte %01000100 ; | X   X  | $FDF9
     .byte %11111110 ; |XXXXXXX | $FDFA
     .byte %11111111 ; |XXXXXXXX| $FDFB
     .byte %11111110 ; |XXXXXXX | $FDFC
     .byte %11111111 ; |XXXXXXXX| $FDFD
     .byte %01111110 ; | XXXXXX | $FDFE
     .byte %00000100 ; |     X  | $FDFF
Zero:
     .byte %00111100 ; |  XXXX  | $FE00
     .byte %01100110 ; | XX  XX | $FE01
     .byte %01100110 ; | XX  XX | $FE02
     .byte %01100110 ; | XX  XX | $FE03
     .byte %01100110 ; | XX  XX | $FE04
     .byte %01100110 ; | XX  XX | $FE05
     .byte %01100110 ; | XX  XX | $FE06
     .byte %00111100 ; |  XXXX  | $FE07
One:
     .byte %00111100 ; |  XXXX  | $FE08
     .byte %00011000 ; |   XX   | $FE09
     .byte %00011000 ; |   XX   | $FE0A
     .byte %00011000 ; |   XX   | $FE0B
     .byte %00011000 ; |   XX   | $FE0C
     .byte %00011000 ; |   XX   | $FE0D
     .byte %00111000 ; |  XXX   | $FE0E
     .byte %00011000 ; |   XX   | $FE0F
Two:
     .byte %01111110 ; | XXXXXX | $FE10
     .byte %01100000 ; | XX     | $FE11
     .byte %01100000 ; | XX     | $FE12
     .byte %00111100 ; |  XXXX  | $FE13
     .byte %00000110 ; |     XX | $FE14
     .byte %00000110 ; |     XX | $FE15
     .byte %01000110 ; | X   XX | $FE16
     .byte %00111100 ; |  XXXX  | $FE17
Three:
     .byte %00111100 ; |  XXXX  | $FE18
     .byte %01000110 ; | X   XX | $FE19
     .byte %00000110 ; |     XX | $FE1A
     .byte %00001100 ; |    XX  | $FE1B
     .byte %00001100 ; |    XX  | $FE1C
     .byte %00000110 ; |     XX | $FE1D
     .byte %01000110 ; | X   XX | $FE1E
     .byte %00111100 ; |  XXXX  | $FE1F
Four:
     .byte %00001100 ; |    XX  | $FE20
     .byte %00001100 ; |    XX  | $FE21
     .byte %00001100 ; |    XX  | $FE22
     .byte %01111110 ; | XXXXXX | $FE23
     .byte %01001100 ; | X  XX  | $FE24
     .byte %00101100 ; |  X XX  | $FE25
     .byte %00011100 ; |   XXX  | $FE26
     .byte %00001100 ; |    XX  | $FE27
Five:
     .byte %01111100 ; | XXXXX  | $FE28
     .byte %01000110 ; | X   XX | $FE29
     .byte %00000110 ; |     XX | $FE2A
     .byte %00000110 ; |     XX | $FE2B
     .byte %01111100 ; | XXXXX  | $FE2C
     .byte %01100000 ; | XX     | $FE2D
     .byte %01100000 ; | XX     | $FE2E
     .byte %01111110 ; | XXXXXX | $FE2F
Six:
     .byte %00111100 ; |  XXXX  | $FE30
     .byte %01100110 ; | XX  XX | $FE31
     .byte %01100110 ; | XX  XX | $FE32
     .byte %01100110 ; | XX  XX | $FE33
     .byte %01111100 ; | XXXXX  | $FE34
     .byte %01100000 ; | XX     | $FE35
     .byte %01100010 ; | XX   X | $FE36
     .byte %00111100 ; |  XXXX  | $FE37
Seven:
     .byte %00011000 ; |   XX   | $FE38
     .byte %00011000 ; |   XX   | $FE39
     .byte %00011000 ; |   XX   | $FE3A
     .byte %00011000 ; |   XX   | $FE3B
     .byte %00001100 ; |    XX  | $FE3C
     .byte %00000110 ; |     XX | $FE3D
     .byte %01000010 ; | X    X | $FE3E
     .byte %01111110 ; | XXXXXX | $FE3F
Eight:
     .byte %00111100 ; |  XXXX  | $FE40
     .byte %01100110 ; | XX  XX | $FE41
     .byte %01100110 ; | XX  XX | $FE42
     .byte %00111100 ; |  XXXX  | $FE43
     .byte %00111100 ; |  XXXX  | $FE44
     .byte %01100110 ; | XX  XX | $FE45
     .byte %01100110 ; | XX  XX | $FE46
     .byte %00111100 ; |  XXXX  | $FE47
Nine:
     .byte %00111100 ; |  XXXX  | $FE48
     .byte %01000110 ; | X   XX | $FE49
     .byte %00000110 ; |     XX | $FE4A
     .byte %00111110 ; |  XXXXX | $FE4B
     .byte %01100110 ; | XX  XX | $FE4C
     .byte %01100110 ; | XX  XX | $FE4D
     .byte %01100110 ; | XX  XX | $FE4E
     .byte %00111100 ; |  XXXX  | $FE4F
Blank:
     .byte %00000000 ; |        | $FE50
     .byte %00000000 ; |        | $FE51
     .byte %00000000 ; |        | $FE52
     .byte %00000000 ; |        | $FE53
     .byte %00000000 ; |        | $FE54
     .byte %00000000 ; |        | $FE55
     .byte %00000000 ; |        | $FE56
     .byte %00000000 ; |        | $FE57
LogoSix:
     .byte %00000000 ; |        | $FE58
     .byte %11101101 ; |XXX XX X| $FE59
     .byte %10100100 ; |X X  X  | $FE5A
     .byte %11101100 ; |XXX XX  | $FE5B
     .byte %10100100 ; |X X  X  | $FE5C
     .byte %11101100 ; |XXX XX  | $FE5D
     .byte %00000000 ; |        | $FE5E
     .byte %00000000 ; |        | $FE5F
LogoFive:
     .byte %00000000 ; |        | $FE60
     .byte %00101110 ; |  X XXX | $FE61
     .byte %00100010 ; |  X   X | $FE62
     .byte %00101110 ; |  X XXX | $FE63
     .byte %00101010 ; |  X X X | $FE64
     .byte %00101110 ; |  X XXX | $FE65
     .byte %00000000 ; |        | $FE66
     .byte %00000000 ; |        | $FE67
LogoFour:
     .byte %00000000 ; |        | $FE68
     .byte %01011100 ; | X XXX  | $FE69
     .byte %01010100 ; | X X X  | $FE6A
     .byte %01010100 ; | X X X  | $FE6B
     .byte %11011100 ; |XX XXX  | $FE6C
     .byte %00000000 ; |        | $FE6D
     .byte %00000000 ; |        | $FE6E
     .byte %00000000 ; |        | $FE6F
LogoThree:
     .byte %00000000 ; |        | $FE70
     .byte %01011101 ; | X XXX X| $FE71
     .byte %01010001 ; | X X   X| $FE72
     .byte %01010001 ; | X X   X| $FE73
     .byte %11011101 ; |XX XXX X| $FE74
     .byte %00000001 ; |       X| $FE75
     .byte %00000001 ; |       X| $FE76
     .byte %11111101 ; |XXXXXX X| $FE77
LogoTwo:
     .byte %00000000 ; |        | $FE78
     .byte %10111101 ; |X XXXX X| $FE79
     .byte %10101001 ; |X X X  X| $FE7A
     .byte %10101001 ; |X X X  X| $FE7B
     .byte %10111011 ; |X XXX XX| $FE7C
     .byte %00000000 ; |        | $FE7D
     .byte %00000000 ; |        | $FE7E
     .byte %11111111 ; |XXXXXXXX| $FE7F
LogoOne:
     .byte %00000000 ; |        | $FE80
     .byte %11111101 ; |XXXXXX X| $FE81
     .byte %10000100 ; |X    X  | $FE82
     .byte %10110100 ; |X XX X  | $FE83
     .byte %10100101 ; |X X  X X| $FE84
     .byte %10110101 ; |X XX X X| $FE85
     .byte %10000101 ; |X    X X| $FE86
     .byte %11111101 ; |XXXXXX X| $FE87
UnknownUnusedGfx:
     .byte %01000100 ; | X   X  | $FE88      is this a hunter with a shotgun?
     .byte %00101000 ; |  X X   | $FE89      or is this for showing where to chop the tree?
     .byte %00110000 ; |  XX    | $FE8A
     .byte %01100000 ; | XX     | $FE8B
     .byte %11111000 ; |XXXXX   | $FE8C
     .byte %11100100 ; |XXX  X  | $FE8D
     .byte %01111111 ; | XXXXXXX| $FE8E
     .byte %01100000 ; | XX     | $FE8F
HouseOne:
     .byte %01111110 ; | XXXXXX | $FE90
     .byte %01111110 ; | XXXXXX | $FE91
     .byte %01111110 ; | XXXXXX | $FE92
     .byte %01011110 ; | X XXXX | $FE93
     .byte %01111110 ; | XXXXXX | $FE94
     .byte %11111111 ; |XXXXXXXX| $FE95
     .byte %01111110 ; | XXXXXX | $FE96
     .byte %00100000 ; |  X     | $FE97
HouseTwo:
     .byte %01111110 ; | XXXXXX | $FE98
     .byte %01111110 ; | XXXXXX | $FE99
     .byte %01111110 ; | XXXXXX | $FE9A
     .byte %01011110 ; | X XXXX | $FE9B
     .byte %01111110 ; | XXXXXX | $FE9C
     .byte %11111111 ; |XXXXXXXX| $FE9D
     .byte %01111110 ; | XXXXXX | $FE9E
     .byte %00100000 ; |  X     | $FE9F
CloudOne:
     .byte %00000000 ; |        | $FEA0
     .byte %00000000 ; |        | $FEA1
     .byte %01100000 ; | XX     | $FEA2
     .byte %01100000 ; | XX     | $FEA3
     .byte %11000000 ; |XX      | $FEA4
     .byte %11000000 ; |XX      | $FEA5
     .byte %00000000 ; |        | $FEA6
     .byte %00000000 ; |        | $FEA7
CloudTwo:
     .byte %00000000 ; |        | $FEA8
     .byte %00000000 ; |        | $FEA9
     .byte %00000000 ; |        | $FEAA
     .byte %11110000 ; |XXXX    | $FEAB
     .byte %11111011 ; |XXXXX XX| $FEAC
     .byte %11011110 ; |XX XXXX | $FEAD
     .byte %00011110 ; |   XXXX | $FEAE
     .byte %00000000 ; |        | $FEAF
CloudThree:
     .byte %00000000 ; |        | $FEB0
     .byte %00000111 ; |     XXX| $FEB1
     .byte %00011101 ; |   XXX X| $FEB2
     .byte %11111100 ; |XXXXXX  | $FEB3
     .byte %11110000 ; |XXXX    | $FEB4
     .byte %11110000 ; |XXXX    | $FEB5
     .byte %00000000 ; |        | $FEB6
     .byte %00000000 ; |        | $FEB7
CloudFour:
     .byte %00000000 ; |        | $FEB8
     .byte %00000000 ; |        | $FEB9
     .byte %00010000 ; |   X    | $FEBA
     .byte %11110000 ; |XXXX    | $FEBB
     .byte %11110000 ; |XXXX    | $FEBC
     .byte %11110000 ; |XXXX    | $FEBD
     .byte %00000000 ; |        | $FEBE
     .byte %00000000 ; |        | $FEBF
CloudFive:
     .byte %00000000 ; |        | $FEC0
     .byte %00000000 ; |        | $FEC1
     .byte %00000000 ; |        | $FEC2
     .byte %00000011 ; |      XX| $FEC3
     .byte %10001110 ; |X   XXX | $FEC4
     .byte %11111000 ; |XXXXX   | $FEC5
     .byte %11100000 ; |XXX     | $FEC6
     .byte %00000000 ; |        | $FEC7
CloudSix:
     .byte %00000000 ; |        | $FEC8
     .byte %00000000 ; |        | $FEC9
     .byte %00000000 ; |        | $FECA
     .byte %00000001 ; |       X| $FECB
     .byte %00000110 ; |     XX | $FECC
     .byte %00001100 ; |    XX  | $FECD
     .byte %10010000 ; |X  X    | $FECE
     .byte %01100000 ; | XX     | $FECF
TreeTopOne:
     .byte %00110000 ; |  XX    | $FED0
     .byte %11110000 ; |XXXX    | $FED1
     .byte %11110000 ; |XXXX    | $FED2
     .byte %11110000 ; |XXXX    | $FED3
     .byte %11110000 ; |XXXX    | $FED4
     .byte %11111111 ; |XXXXXXXX| $FED5
     .byte %11111111 ; |XXXXXXXX| $FED6
     .byte %11111111 ; |XXXXXXXX| $FED7
TreeTopTwo:
     .byte %00000000 ; |        | $FED8
     .byte %00000000 ; |        | $FED9
     .byte %11000000 ; |XX      | $FEDA
     .byte %11110000 ; |XXXX    | $FEDB
     .byte %11111111 ; |XXXXXXXX| $FEDC
     .byte %11111111 ; |XXXXXXXX| $FEDD
     .byte %11111111 ; |XXXXXXXX| $FEDE
     .byte %11111111 ; |XXXXXXXX| $FEDF
TreeTopThree:
     .byte %11000000 ; |XX      | $FEE0
     .byte %11110000 ; |XXXX    | $FEE1
     .byte %11111100 ; |XXXXXX  | $FEE2
     .byte %11111111 ; |XXXXXXXX| $FEE3
     .byte %11111111 ; |XXXXXXXX| $FEE4
     .byte %11111111 ; |XXXXXXXX| $FEE5
     .byte %11111111 ; |XXXXXXXX| $FEE6
     .byte %11111111 ; |XXXXXXXX| $FEE7
TreeTopFour:
     .byte %00000000 ; |        | $FEE8
     .byte %00110000 ; |  XX    | $FEE9
     .byte %11110000 ; |XXXX    | $FEEA
     .byte %11110000 ; |XXXX    | $FEEB
     .byte %11110000 ; |XXXX    | $FEEC
     .byte %11111111 ; |XXXXXXXX| $FEED
     .byte %11111111 ; |XXXXXXXX| $FEEE
     .byte %11111111 ; |XXXXXXXX| $FEEF
TreeTopFive:
     .byte %00000000 ; |        | $FEF0
     .byte %00000000 ; |        | $FEF1
     .byte %00000000 ; |        | $FEF2
     .byte %11100000 ; |XXX     | $FEF3
     .byte %11111000 ; |XXXXX   | $FEF4
     .byte %11111111 ; |XXXXXXXX| $FEF5
     .byte %11111111 ; |XXXXXXXX| $FEF6
     .byte %11111111 ; |XXXXXXXX| $FEF7
TreeTopSix:
     .byte %00000000 ; |        | $FEF8
     .byte %00000000 ; |        | $FEF9
     .byte %11100000 ; |XXX     | $FEFA
     .byte %11111000 ; |XXXXX   | $FEFB
     .byte %11111110 ; |XXXXXXX | $FEFC
     .byte %11111111 ; |XXXXXXXX| $FEFD
     .byte %11111111 ; |XXXXXXXX| $FEFE
     .byte %11111111 ; |XXXXXXXX| $FEFF
StepOne:
     .byte %11000000 ; |XX      | $FF00
     .byte %10000011 ; |X     XX| $FF01
     .byte %01000010 ; | X    X | $FF02
     .byte %00100010 ; |  X   X | $FF03
     .byte %00010010 ; |   X  X | $FF04
     .byte %00001100 ; |    XX  | $FF05
     .byte %00011000 ; |   XX   | $FF06
     .byte %00011000 ; |   XX   | $FF07
     .byte %00011010 ; |   XX X | $FF08
     .byte %00011100 ; |   XXX  | $FF09
     .byte %00011010 ; |   XX X | $FF0A
     .byte %00011000 ; |   XX   | $FF0B
     .byte %00010000 ; |   X    | $FF0C
     .byte %00011000 ; |   XX   | $FF0D
     .byte %00011000 ; |   XX   | $FF0E
     .byte %00000000 ; |        | $FF0F
StepTwo:
     .byte %00001100 ; |    XX  | $FF10
     .byte %00001000 ; |    X   | $FF11
     .byte %10000100 ; |X    X  | $FF12
     .byte %11111100 ; |XXXXXX  | $FF13
     .byte %00001100 ; |    XX  | $FF14
     .byte %00001000 ; |    X   | $FF15
     .byte %00011000 ; |   XX   | $FF16
     .byte %00011000 ; |   XX   | $FF17
     .byte %00011000 ; |   XX   | $FF18
     .byte %00011100 ; |   XXX  | $FF19
     .byte %00011010 ; |   XX X | $FF1A
     .byte %00011000 ; |   XX   | $FF1B
     .byte %00010000 ; |   X    | $FF1C
     .byte %00011000 ; |   XX   | $FF1D
     .byte %00011000 ; |   XX   | $FF1E
     .byte %00000000 ; |        | $FF1F
StepThree:
     .byte %00110000 ; |  XX    | $FF20
     .byte %00100000 ; |  X     | $FF21
     .byte %00010011 ; |   X  XX| $FF22
     .byte %00001010 ; |    X X | $FF23
     .byte %00001010 ; |    X X | $FF24
     .byte %00001110 ; |    XXX | $FF25
     .byte %00011000 ; |   XX   | $FF26
     .byte %00011000 ; |   XX   | $FF27
     .byte %01011000 ; | X XX   | $FF28
     .byte %00111100 ; |  XXXX  | $FF29
     .byte %00011010 ; |   XX X | $FF2A
     .byte %00011000 ; |   XX   | $FF2B
     .byte %00010000 ; |   X    | $FF2C
     .byte %00011000 ; |   XX   | $FF2D
     .byte %00011000 ; |   XX   | $FF2E
     .byte %00000000 ; |        | $FF2F
StandingStill:
     .byte %00011000 ; |   XX   | $FF30
     .byte %00011100 ; |   XXX  | $FF31
     .byte %00011000 ; |   XX   | $FF32
     .byte %00011000 ; |   XX   | $FF33
     .byte %00011000 ; |   XX   | $FF34
     .byte %00011000 ; |   XX   | $FF35
     .byte %00011000 ; |   XX   | $FF36
     .byte %00011000 ; |   XX   | $FF37
     .byte %00011000 ; |   XX   | $FF38
     .byte %00011100 ; |   XXX  | $FF39
     .byte %00011010 ; |   XX X | $FF3A
     .byte %00011000 ; |   XX   | $FF3B
     .byte %00010000 ; |   X    | $FF3C
     .byte %00011000 ; |   XX   | $FF3D
     .byte %00011000 ; |   XX   | $FF3E
     .byte %00000000 ; |        | $FF3F
Jumping:
     .byte %00000000 ; |        | $FF40
     .byte %00000000 ; |        | $FF41
     .byte %00000000 ; |        | $FF42
     .byte %00000000 ; |        | $FF43
     .byte %00010011 ; |   X  XX| $FF44
     .byte %10110010 ; |X XX  X | $FF45
     .byte %11010001 ; |XX X   X| $FF46
     .byte %00011110 ; |   XXXX | $FF47
     .byte %00011000 ; |   XX   | $FF48
     .byte %00011100 ; |   XXX  | $FF49
     .byte %00011010 ; |   XX X | $FF4A
     .byte %00011000 ; |   XX   | $FF4B
     .byte %00010000 ; |   X    | $FF4C
     .byte %00011000 ; |   XX   | $FF4D
     .byte %00011000 ; |   XX   | $FF4E
     .byte %00000000 ; |        | $FF4F
ClimbingOne:
     .byte %00000000 ; |        | $FF50
     .byte %00000000 ; |        | $FF51
     .byte %00000000 ; |        | $FF52
     .byte %00000001 ; |       X| $FF53
     .byte %00000001 ; |       X| $FF54
     .byte %00000001 ; |       X| $FF55
     .byte %00000011 ; |      XX| $FF56
     .byte %00011100 ; |   XXX  | $FF57
     .byte %00011000 ; |   XX   | $FF58
     .byte %00011000 ; |   XX   | $FF59
     .byte %11011000 ; |XX XX   | $FF5A
     .byte %11011000 ; |XX XX   | $FF5B
     .byte %11111100 ; |XXXXXX  | $FF5C
     .byte %00010011 ; |   X  XX| $FF5D
     .byte %00011000 ; |   XX   | $FF5E
     .byte %00011000 ; |   XX   | $FF5F
ClimbingTwo:
     .byte %00000000 ; |        | $FF60
     .byte %00000000 ; |        | $FF61
     .byte %00000000 ; |        | $FF62
     .byte %00000000 ; |        | $FF63
     .byte %00000001 ; |       X| $FF64
     .byte %00000001 ; |       X| $FF65
     .byte %00000001 ; |       X| $FF66
     .byte %00011111 ; |   XXXXX| $FF67
     .byte %00011000 ; |   XX   | $FF68
     .byte %00011000 ; |   XX   | $FF69
     .byte %11011000 ; |XX XX   | $FF6A
     .byte %11011000 ; |XX XX   | $FF6B
     .byte %11111111 ; |XXXXXXXX| $FF6C
     .byte %00010000 ; |   X    | $FF6D
     .byte %00011000 ; |   XX   | $FF6E
     .byte %00011000 ; |   XX   | $FF6F
SwingAxeOut:
     .byte %11000000 ; |XX      | $FF70
     .byte %10000011 ; |X     XX| $FF71
     .byte %01000010 ; | X    X | $FF72
     .byte %00110010 ; |  XX  X | $FF73
     .byte %00010010 ; |   X  X | $FF74
     .byte %00111110 ; |  XXXXX | $FF75
     .byte %00110000 ; |  XX    | $FF76
     .byte %00110000 ; |  XX    | $FF77
     .byte %11111111 ; |XXXXXXXX| $FF78
     .byte %01110000 ; | XXX    | $FF79
     .byte %00110000 ; |  XX    | $FF7A
     .byte %00100000 ; |  X     | $FF7B
     .byte %00110000 ; |  XX    | $FF7C
     .byte %00110000 ; |  XX    | $FF7D
     .byte %00000000 ; |        | $FF7E
     .byte %00000000 ; |        | $FF7F
SwingAxeDown:
     .byte %00000000 ; |        | $FF80
     .byte %10000110 ; |X    XX | $FF81
     .byte %11100100 ; |XXX  X  | $FF82
     .byte %00100100 ; |  X  X  | $FF83
     .byte %00010100 ; |   X X  | $FF84
     .byte %00010100 ; |   X X  | $FF85
     .byte %00010100 ; |   X X  | $FF86
     .byte %00011000 ; |   XX   | $FF87
     .byte %00011010 ; |   XX X | $FF88
     .byte %00111100 ; |  XXXX  | $FF89
     .byte %00011000 ; |   XX   | $FF8A
     .byte %00011000 ; |   XX   | $FF8B
     .byte %00010000 ; |   X    | $FF8C
     .byte %00011000 ; |   XX   | $FF8D
     .byte %00011000 ; |   XX   | $FF8E
     .byte %00000000 ; |        | $FF8F
FrontTurn:
     .byte %01100110 ; | XX  XX | $FF90
     .byte %00100100 ; |  X  X  | $FF91
     .byte %00100100 ; |  X  X  | $FF92
     .byte %01000010 ; | X    X | $FF93
     .byte %10000010 ; |X     X | $FF94
     .byte %01000010 ; | X    X | $FF95
     .byte %00100100 ; |  X  X  | $FF96
     .byte %00011000 ; |   XX   | $FF97
     .byte %00011000 ; |   XX   | $FF98
     .byte %00011000 ; |   XX   | $FF99
     .byte %00111100 ; |  XXXX  | $FF9A
     .byte %01011010 ; | X XX X | $FF9B
     .byte %10010001 ; |X  X   X| $FF9C
     .byte %01011000 ; | X XX   | $FF9D
     .byte %00011000 ; |   XX   | $FF9E
     .byte %00000000 ; |        | $FF9F
AxeUp:
     .byte %00000000 ; |        | $FFA0
     .byte %00000000 ; |        | $FFA1
     .byte %00000000 ; |        | $FFA2
     .byte %00000000 ; |        | $FFA3
     .byte %00000000 ; |        | $FFA4
     .byte %00000000 ; |        | $FFA5
     .byte %00000000 ; |        | $FFA6
     .byte %00000000 ; |        | $FFA7
     .byte %00000000 ; |        | $FFA8
     .byte %00000000 ; |        | $FFA9
     .byte %00000011 ; |      XX| $FFAA
     .byte %00011100 ; |   XXX  | $FFAB
     .byte %01010000 ; | X X    | $FFAC
     .byte %01100000 ; | XX     | $FFAD
     .byte %00100000 ; |  X     | $FFAE
     .byte %00000000 ; |        | $FFAF
AxeOut:
     .byte %00000000 ; |        | $FFB0
     .byte %00000000 ; |        | $FFB1
     .byte %00000000 ; |        | $FFB2
     .byte %00000000 ; |        | $FFB3
     .byte %00000000 ; |        | $FFB4
     .byte %00000000 ; |        | $FFB5
     .byte %00000000 ; |        | $FFB6
     .byte %00000011 ; |      XX| $FFB7
     .byte %11111111 ; |XXXXXXXX| $FFB8
     .byte %00000000 ; |        | $FFB9
     .byte %00000000 ; |        | $FFBA
     .byte %00000000 ; |        | $FFBB
     .byte %00000000 ; |        | $FFBC
     .byte %00000000 ; |        | $FFBD
     .byte %00000000 ; |        | $FFBE
     .byte %00000000 ; |        | $FFBF
AxeDown:
     .byte %00000000 ; |        | $FFC0
     .byte %00000000 ; |        | $FFC1
     .byte %00000000 ; |        | $FFC2
     .byte %00000000 ; |        | $FFC3
     .byte %00000000 ; |        | $FFC4
     .byte %00000111 ; |     XXX| $FFC5
     .byte %00001110 ; |    XXX | $FFC6
     .byte %00110010 ; |  XX  X | $FFC7
     .byte %11000000 ; |XX      | $FFC8
     .byte %00000000 ; |        | $FFC9
     .byte %00000000 ; |        | $FFCA
     .byte %00000000 ; |        | $FFCB
     .byte %00000000 ; |        | $FFCC
     .byte %00000000 ; |        | $FFCD
     .byte %00000000 ; |        | $FFCE
     .byte %00000000 ; |        | $FFCF

MFD0:
     .byte $43
     .byte $8D
     .byte $8D
     .byte $8D
     .byte $8D
     .byte $8D
     .byte $8D
     .byte $8D
     .byte $8D
     .byte $8D
     .byte $8D
     .byte $8D ; axe
     .byte $8D ; axe
     .byte $8D ; axe
     .byte $8D ; axe
     .byte $8D ; axe
     
MFE0:
     .byte $86
     .byte $86
     .byte $86
     .byte $86
     .byte $86 ; legs
     .byte $86 ; legs
     .byte $86 ; legs
     .byte $86 ; belt
     .byte $49 ; chest/arms
     .byte $49 ; chest/arms
     .byte $49 ; chest/arms
     .byte $49 ; chest/arms
     .byte $4F ; head
     .byte $4F ; head
     .byte $4F ; head
     .byte $4F ; head

     .byte $10 ; |   X    | $FFF0
     .byte $E9 ; |XXX X  X| $FFF1
     .byte $00 ; |        | $FFF2
     .byte $00 ; |        | $FFF3
     .byte $00 ; |        | $FFF4
     .byte $00 ; |        | $FFF5
     .byte $00 ; |        | $FFF6
     .byte $11 ; |   X   X| $FFF7
     .byte $11 ; |   X   X| $FFF8
     .byte $17 ; |   X XXX| $FFF9
     .byte $15 ; |   X X X| $FFFA
     .byte $17 ; |   X XXX| $FFFB

     ORG $FFFC

     .word START, START