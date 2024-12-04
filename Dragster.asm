; Partially annotated disassembly of Dragster (NTSC) for Atari 2600
; Assemble with "dasm Dragster.asm -f3"
;

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
REFP1   =  $0C
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
ENABL   =  $1F
HMP0    =  $20
VDELP0  =  $25
HMOVE   =  $2A
HMCLR   =  $2B
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296
LF6F2   =  $F6F2

GameMode                      = $80 ; 0 or 1
GlobalFrameCounter            = $81
RNG_82                        = $82 ; bit shifting PRNG
COLORS_MODIFIER1              = $84 ; used in inactive state to blink screen colors
COLORS_MODIFIER2              = $85
COLORS                        = $86 ; $86-$8c, array of length 7
CountdownTimer                = $8D ; counts dowm from $9f at the start of a game
ActivePlayer                  = $8f ; 0 or 1, alternates each frame
TachometerDisplay1            = $9c
TachometerDisplay2            = $9e
TachometerDisplay3            = $a0
TachometerDisplay4            = $a2
TachometerDisplay5            = $a4
TachometerDisplay6            = $a6
Tachometer                    = $A8 ; values of 32 and higher blow out the engine
PlayerVerticalPosition        = $AB ; lower values = top of screen
PlayerJoystickInput           = $AD ; $0-$f in the form rldu, 0 = pressed
GameModeSwitchCooldown        = $B0 ; counts down when holding select button
Audio_B1                      = $B1
InGameTimeDigit1              = $b3
InGameTimeDigit2              = $b5
InGameTimeDigit3              = $b7
InactivityTimer               = $B9 ; ticks up every 256 frames, pauses game and flashes colors at $80+
Distance                      = $ba ; starts at 0, goal at >= 97
Speed                         = $c0 ; added to subdistance every frame
DistanceSub                   = $c2 ; 256 equal one Distance
PlayerBackgroundParallaxShift = $C4 ; shifts background to simulate movement
PlayerWheelRotation           = $C6 ; 3 states, 0, $17, $2e pointing to different wheel graphics
PlayerClutchStrain            = $C8 ; if projected max speed too high (>= 16) above actual speed
PlayerScrapingWall            = $CA ; 1 if player hit against wall in game mode 2
ShiftAndGear                  = $CC ; bit7 = clutch; bit0-3 = gear
PlayerEngineBlown             = $CE ; leaves the player coasting without control
Player_Audio_D0               = $D0
PlayerDisabled                = $D2 ; stops player processing
PlayerDisqualification        = $D4 ; 0 for good, $01 for engine blow, $1d for early start, point to text graphics
PlayerShiftInput              = $D6 ; whether the player pressed left last frame

       processor 6502
       ORG $F000

START:
       SEI
       CLD
       LDX    #$00
StartupClearMem:
       LDA    #$00
StartupClearMemLoop:
       STA    $00,X   ; clear $00 to $ff
       TXS            ; also set stack pointer to $ff
       INX
       BNE    StartupClearMemLoop
       LDA    RNG_82
       BNE    WarmBoot
       JMP    ColdBoot

WarmBoot:
       JSR    StartCountdown
MainGameLoop:
       LDX    #$06
ModifyColorsLoop:
       LDA    ColorsData,X
       EOR    COLORS_MODIFIER1
       AND    COLORS_MODIFIER2
       STA    COLORS,X
       DEX
       BPL    ModifyColorsLoop
       NOP
       NOP
       NOP
       NOP
       NOP
       LDX    ActivePlayer
       SEC
       LDY    #$00
       LDA    Distance,X
LF030: INY
       SBC    #$03
       BPL    LF030
       DEY
       SEC
       TYA
       LDY    #$00
LF03A: INY
       SBC    #$05
       BPL    LF03A
       DEY
       STY    $BC,X
       ADC    #$05
       STA    $BE,X
LF046: LDA    INTIM
       BNE    LF046
       STA    WSYNC
       STA    VBLANK
       STA    $AA
LF051: LDX    $AA
       LDA    Distance,X
       JSR    LF4E5
       LDX    $AA
       LDA    #$03
       STA    NUSIZ0
       STA    NUSIZ1
       LDY    PlayerBackgroundParallaxShift,X
       LDA    LF6C0,Y
       STA    WSYNC
       STA    PF0
       STA    PF2
       LDA    LF6C4,Y
       STA    PF1
       JSR    LF7D0
       LDY    #$05
LF075: STA    WSYNC
       DEY
       BPL    LF075
       LDX    $AA
       LDY    $BC,X
LF07E: DEY
       BPL    LF07E
       LDY    $BE,X
       CPY    #$04
       BEQ    LF095
       CPY    #$03
       BEQ    LF098
       CPY    #$02
       BEQ    LF09B
       CPY    #$01
       BEQ    LF09E
       BNE    LF0A0
LF095: NOP
       LDA    $D8
LF098: NOP
       LDA    $D8
LF09B: NOP
       LDA    $D8
LF09E: LDA    $D8
LF0A0: NOP
       NOP
       LDA    #$16
       STA    $8E
       CLC
LF0A7: LDY    $8E
       LDA    ($90),Y
       STA    GRP0
       LDA    ($92),Y
       STA    GRP1
       LDA    ($94),Y
       STA    GRP0
       LDA    ($9A),Y
       STA    $D8
       LDA    ($98),Y
       TAX
       LDA    ($96),Y
       LDY    $D8
       STA    GRP1
       STX    GRP0
       STY    GRP1
       STA    GRP0
       LDA    $D8
       NOP
       LDA    $8E
       LSR
       LSR
       LSR
       TAY
       LDA    LF6D0,Y
       STA    PF0
       STA    PF1
       STA    PF2
       LDY    $8E
       LDA    ($90),Y
       STA    GRP0
       LDA    ($92),Y
       STA    GRP1
       LDA    ($94),Y
       STA    GRP0
       LDA    ($96),Y
       LDY    $D8
       STA    GRP1
       STX    GRP0
       STY    GRP1
       STA    GRP0
       NOP
       NOP
       NOP
       DEC    $8E
       BPL    LF0A7
       LDX    #$01
LF0FD: LDY    #$00
       STY    GRP0
       STY    GRP1
       DEX
       BPL    LF0FD
       STX    WSYNC
       LDA    COLORS+2 ; line markings and background parallax, usually blue = $88
       STA    COLUBK
       LDX    #$09
LF10E: STA    WSYNC
       LDA    #$F7
       STA    $90,X
       DEX
       DEX
       BPL    LF10E
       LDA    COLORS+3 ; background, usually green = $cc
       STA    COLUBK
       LDA    #$02
       STA    CTRLPF
       LDA    COLORS+4 ; green part of tachometer display, usually green = $d8
       STA    COLUP0
       LDA    COLORS+5 ; red part of tachometer display, usually red = $46
       STA    COLUP1
       LDX    $AA
       LDY    #$07
LF12C: STA    WSYNC
       LDA    TachometerDisplay1,X
       STA    PF0
       LDA    TachometerDisplay2,X
       STA    PF1
       LDA    TachometerDisplay3,X
       STA    PF2
       LDA    $D8
       LDA    TachometerDisplay4,X
       STA    PF0
       LDA    $D8
       LDA    TachometerDisplay5,X
       STA    PF1
       LDA    $D8
       LDA    TachometerDisplay6,X
       STA    PF2
       DEY
       BPL    LF12C
       STA    WSYNC
       INY
       STY    PF0
       STY    PF1
       STY    PF2
       LDA    #$10
       STA    CTRLPF
       LDA    COLORS+0     ; used for dragsters and some numbers, usually black
       STA    COLUP0
       STA    COLUP1
       LDA    #$0F
       JSR    LF4E5
       LDA    #$06
       STA    NUSIZ0
       LDA    #$01
       STA    NUSIZ1
       LDX    $AA
       LDY    PlayerDisqualification,X
       STA    WSYNC
       BEQ    LF181
       JSR    LF53B
       STA    WSYNC
       STA    WSYNC
       JMP    LF209

LF181: LDA    COLORS+6 ; borders and decimal point, usually black
       STA    COLUPF
       LDX    $AA
       LDY    #$68
       LDA    InGameTimeDigit1,X
       BEQ    LF195
       LDY    #$50
       AND    #$F0
       BEQ    LF195
       LSR
       TAY
LF195: STA    WSYNC
       TYA
       STA    $90
       LDA    InGameTimeDigit1,X
       AND    #$0F
       ASL
       ASL
       ASL
       STA    $92
       LDA    InGameTimeDigit2,X
       AND    #$F0
       LSR
       STA    $96
       LDA    CountdownTimer
       BEQ    LF1B6
       AND    #$F0
       LSR
       ADC    #$08
       JMP    LF1BD

LF1B6: LDA    InGameTimeDigit2,X
       AND    #$0F
       ASL
       ASL
       ASL
LF1BD: STA    $94
       LDA    #$0C
       LDY    ShiftAndGear,X
       BMI    LF1CA
       TYA
       BNE    LF1CA
       LDA    #$0B
LF1CA: ASL
       ASL
       ASL
       STA    $98
       LDA    #$07
       LDY    InGameTimeDigit2,X
       CPY    #$AA
       BNE    LF1D9
       LDA    #$0A
LF1D9: TAX
       LDY    #$07
LF1DC: STA    WSYNC
       NOP
       LDA    ($92),Y
       STA    GRP1
       LDA    ($90),Y
       STA    GRP0
       LDA    ($96),Y
       STA    GRP1
       LDA    ($94),Y
       STA    GRP0
       STA    GRP1
       LDA    ($98),Y
       STA    GRP0
       STA    GRP1
       LDA    LF56A,X
       STA    ENABL
       DEX
       DEY
       BPL    LF1DC
       INY
       STY    GRP0
       STY    GRP1
       STY    GRP0
       STY    ENABL
LF209: LDA    COLORS+2 ; line markings and background parallax, usually blue = $88
       STA    COLUPF
       INC    $AA
       LDA    $AA
       LSR
       BCC    LF217
       JMP    LF051

LF217: LDA    #$0F
       JSR    LF4E5
       LDY    #$39
       JSR    LF53B
       LDA    #$21
       STA    TIM64T
       LDA    GlobalFrameCounter
       AND    #$01
       TAX
       STX    ActivePlayer
       LDY    #$00
       LDA    InactivityTimer
       BMI    SkipSoundProcessing
       LDA    PlayerDisabled,X
       BNE    SkipSoundProcessing
       LDA    Player_Audio_D0,X
       BEQ    LF242
       LDY    #$08
       DEC    Player_Audio_D0,X
       JMP    LF24E

LF242: LDA    CountdownTimer
       BEQ    LF257
       AND    #$0F
       BNE    LF257
       LDY    #$0C
       LDA    #$18
LF24E: STA    AUDV0,X
       STY    AUDF0,X
       STY    AUDC0,X
       JMP    LF285

LF257: LDA    PlayerEngineBlown,X
       BNE    SkipSoundProcessing
       LDA    GlobalFrameCounter
       AND    #$02
       BEQ    LF271
       LDY    #$09
       LDA    #$01
       STA    AUDF0,X
       LDA    Speed,X
       BEQ    LF271
       LDA    PlayerClutchStrain,X
       ORA    PlayerScrapingWall,X
       BNE    SkipSoundProcessing
LF271: LDA    Tachometer,X
       CMP    #$20
       BCC    LF279
       LDA    #$1F
LF279: EOR    #$1F
       STA    AUDF0,X
       LDY    #$03
SkipSoundProcessing: STY    AUDC0,X
       LDA    Audio_B1,X
       STA    AUDV0,X
LF285: LDA    INTIM
       BNE    LF285
       LDY    #$82
       STY    WSYNC
       STY    VBLANK
       STY    VSYNC
       STY    WSYNC
       STY    WSYNC
       STY    WSYNC
       STA    VSYNC
       INC    GlobalFrameCounter
       BNE    IncreasingTimersDone
       INC    InactivityTimer
       BNE    IncreasingTimersDone
       SEC
       ROR    InactivityTimer     ; reset inactivity timer to $80 so that is stays in a paused state
IncreasingTimersDone:
       LDY    #$FF
       LDA    SWCHB
       AND    #$08    ; color switch
       BNE    ColorSwitchNotPressed
       LDY    #$0F
ColorSwitchNotPressed:
       LDA    #$00
       BIT    InactivityTimer
       BPL    LF2BD
       TYA
       AND    #$F7
       TAY
       LDA    InactivityTimer
       ASL
LF2BD: STA    COLORS_MODIFIER1
       STY    COLORS_MODIFIER2
       LDA    #$19
       STA    WSYNC
       STA    TIM64T
       LDA    SWCHA
       TAY
       AND    #$0F
       STA    PlayerJoystickInput+1
       TYA
       LSR
       LSR
       LSR
       LSR
       STA    PlayerJoystickInput
       LDA    Tachometer
       ORA    Tachometer+1
       BNE    DisableRightToReset
       LDA    PlayerJoystickInput,X   ; reset if current player is pressing right
       CMP    #$07
       BEQ    SoftResetGame
DisableRightToReset:
       LDA    SWCHB
       LSR
       BCS    ResetButtonNotPressed
SoftResetGame:
       LDX    #$B9    ; only clear RAM from $b9 onwards with this reset
       JMP    StartupClearMem
ResetButtonNotPressed:
       LDY    #$00
       LSR
       BCS    SelectButtonNotPressed
       LDA    GameModeSwitchCooldown
       BEQ    SwitchGameMode
       DEC    GameModeSwitchCooldown
       BPL    NoGameModeSwitch
SwitchGameMode:
       INC    GameMode
ColdBoot:
       LDA    GameMode
       AND    #$01
       STA    GameMode
       STA    InactivityTimer
       TAY
       INY
       STY    ShiftAndGear ; use player 1's gear number to display selected game mode 
       JSR    StartCountdown
       LDA    #$0A
       STA    $CD
       LDA    #$00
       STA    CountdownTimer
       STA    PlayerDisqualification
       LDY    #$1E
       STY    PlayerDisabled
       STY    PlayerDisabled+1
SelectButtonNotPressed:
       STY    GameModeSwitchCooldown
NoGameModeSwitch:
       LDA    CountdownTimer
       BEQ    CountdownTimerNotJustExpired
       DEC    CountdownTimer
       BNE    CountdownTimerNotJustExpired
       LDX    #$05
       LSR
ClearInGameTimeLoop:
       STA    InGameTimeDigit1,X
       DEX
       BPL    ClearInGameTimeLoop
CountdownTimerNotJustExpired:
       LDX    ActivePlayer
       LDA    InactivityTimer
       BMI    LF341
       LDA    PlayerDisabled,X
       BEQ    ProcessActivePlayer
DisablePlayer:
       LDY    #$01
       STY    PlayerDisabled,X
       DEY
       STY    Tachometer,X
       STY    PlayerClutchStrain,X
LF341: JMP    EndOfMainLoop_AdvanceRNG

ProcessActivePlayer:
       LDA    CountdownTimer
       BNE    IGT_CountdownNotUpYet
       SED
       CLC
       LDA    InGameTimeDigit3,X
       ADC    #$34
       STA    InGameTimeDigit3,X
       LDA    InGameTimeDigit2,X
       ADC    #$03
       STA    InGameTimeDigit2,X
       LDA    InGameTimeDigit1,X
       ADC    #$00
       STA    InGameTimeDigit1,X
       CLD
       BCC    IGT_CountdownNotUpYet   ; check for overflow
       LDA    #$99                    ; set time to 99.9999 and disable any further processing of this player
       STA    InGameTimeDigit1,X
       STA    InGameTimeDigit2,X
DisablePlayer_:
       BNE    DisablePlayer
IGT_CountdownNotUpYet:
       LDA    Speed,X
       BEQ    IGT_ZeroSpeed
       CLC
       ADC    DistanceSub,X
       STA    DistanceSub,X
       BCC    UpdateParallaxAndWheelSpin
       INC    Distance,X
UpdateParallaxAndWheelSpin:
       LDA    Speed,X
       ROL
       ROL
       ROL
       AND    #$03
       TAY
       LDA    ParallaxUpdateFrequencyData,Y
       AND    GlobalFrameCounter
       BNE    SkipUpdateParallaxAndWheelSpin
       INC    PlayerBackgroundParallaxShift,X
       CLC
       LDA    PlayerWheelRotation,X
       ADC    #$17
       CMP    #$2F
       BCC    NoOverflowWheelSpin
       LDA    #$00
NoOverflowWheelSpin:
       STA    PlayerWheelRotation,X
SkipUpdateParallaxAndWheelSpin:
       LDA    PlayerBackgroundParallaxShift,X
       AND    #$03
       STA    PlayerBackgroundParallaxShift,X
       LDA    Distance,X   ; exit out if distance is larger than 0x60
       CMP    #$60
       BCC    IGT_ZeroSpeed
       BNE    DisablePlayer_   ; disable player processing as they have won, stops timer
IGT_ZeroSpeed:
       LDA    PlayerEngineBlown,X
       BNE    EngineBlownSkipTachometer
       LDA    GlobalFrameCounter
       LDY    ShiftAndGear,X
       BPL    ClutchNotEngaged
       LDY    #$00
ClutchNotEngaged:
       AND    TachometerFrameCycleData,Y ; tacho only changes on specific frames, depending on gear
       BNE    NoTachometerChanges
       LDA    REFP1,X
       BMI    DecreaseTachometer   ; not pressing gas
       LDA    PlayerScrapingWall,X
       BEQ    IncreaseTachometer
       LDA    GlobalFrameCounter
       AND    #$02
       BEQ    DecreaseTachometer
IncreaseTachometer:
       CLC
       LDA    Tachometer,X
       ADC    TachometerChangeData,Y
       STA    Tachometer,X
       LDA    #$0C
       STA    Audio_B1,X
       STA    InactivityTimer
       BNE    CheckForEngineBlow

EngineBlownSkipTachometer:
       BNE    SkipSpeedUpdates

DecreaseTachometer:
       SEC
       LDA    Tachometer,X
       SBC    TachometerChangeData,Y
       STA    Tachometer,X
       DEC    Audio_B1,X
       LDA    #$04
       CMP    Audio_B1,X
       BCC    CheckForEngineBlow
       STA    Audio_B1,X
CheckForEngineBlow:
       LDA    Tachometer,X
       BPL    TachometerNonNegative
       LDA    #$00
TachometerNonNegative:
       CMP    #$20
       BCC    EngineNotBlown
       LDA    #$0F
       STA    Player_Audio_D0,X
       LDA    #$01
       STA    PlayerDisqualification,X
       LDA    #$04
       STA    PlayerVerticalPosition,X
       LDA    #$1A
       STA    PlayerEngineBlown,X
       LDA    #$00
EngineNotBlown:
       STA    Tachometer,X
NoTachometerChanges:
       LDA    #$00
       STA    PlayerClutchStrain,X
       TYA
       BEQ    SkipSpeedUpdates   ; no speed updates while clutch is engaged
       LDA    Tachometer,X
       CMP    #$14
LF40C: DEY
       BEQ    LF413
       ROL
       JMP    LF40C

LF413: STA    $D8     ; speed ceiling
       CMP    Speed,X
       BEQ    SkipSpeedUpdates
       BCS    NotOverSpeedCeiling
       LDA    Speed,X
       BEQ    SkipSpeedUpdates
       DEC    Speed,X
       JMP    SkipSpeedUpdates
NotOverSpeedCeiling:
       LDA    $D8
       SEC
       SBC    Speed,X
       INC    Speed,X
       INC    Speed,X
       CMP    #$10
       BCC    SkipSpeedUpdates
       LDA    PlayerEngineBlown,X
       BNE    SkipSpeedUpdates
       LDA    #$17
       STA    PlayerClutchStrain,X
       DEC    Tachometer,X
SkipSpeedUpdates:
       LDA    PlayerJoystickInput,X
       AND    #$04
       CMP    PlayerShiftInput,X
       STA    PlayerShiftInput,X
       BEQ    PlayerShiftInputNotChanged
       CMP    #$00
       BNE    PlayerReleasedShift
       ASL    ShiftAndGear,X   ; sets bit7 to signal clutch
       SEC
       ROR    ShiftAndGear,X
       BMI    PlayerShiftInputNotChanged
PlayerReleasedShift:
       LDA    CountdownTimer
       BEQ    NotStartedEarly
       LDA    #$1D
       STA    PlayerDisqualification,X   ; disqualify for starting early
NotStartedEarly:
       INC    ShiftAndGear,X             ; increment gear, remove clutch bit, limit to 4 gears
       LDA    ShiftAndGear,X
       AND    #$7F
       CMP    #$04
       BCC    NotReachedMaxGearYet
       LDA    #$04
NotReachedMaxGearYet:
       STA    ShiftAndGear,X
PlayerShiftInputNotChanged:
       LDA    GameMode
       LSR
       BCC    EndOfMainLoop_AdvanceRNG   ; not in game mode 2, skip
       LDA    PlayerEngineBlown,X
       BNE    EndOfMainLoop_AdvanceRNG   ; don't steer with blown engine
       LDA    Speed,X
       BEQ    EndOfMainLoop_AdvanceRNG   ; not moving yet, skip
       LDA    GlobalFrameCounter
       AND    #$06
       BNE    EndOfMainLoop_AdvanceRNG   ; only apply every 4th player frame
       LDA    PlayerJoystickInput,X
       LSR
       BCS    UpNotPressed
       DEC    PlayerVerticalPosition,X
UpNotPressed:
       LSR
       BCS    DownNotPressed
       INC    PlayerVerticalPosition,X
DownNotPressed:
       LDA    RNG_82                     ; move up or down randomly
       BPL    RandomMovementUp
       INC    PlayerVerticalPosition,X
       INC    PlayerVerticalPosition,X
RandomMovementUp:
       DEC    PlayerVerticalPosition,X
       LDA    #$00
       STA    PlayerScrapingWall,X
       LDY    PlayerVerticalPosition,X
       BPL    NotScrapingTopWall
       TAY
       INC    PlayerScrapingWall,X
NotScrapingTopWall:
       CPY    #$08
       BCC    NotScrapingBottomWall
       LDY    #$08
       INC    PlayerScrapingWall,X
NotScrapingBottomWall:
       STY    PlayerVerticalPosition,X
EndOfMainLoop_AdvanceRNG:
       LDA    RNG_82
       ASL
       ASL
       ASL
       EOR    RNG_82
       ASL
       ROL    RNG_82
       TXA
       ORA    #$0A
       TAY
       LDA    #$00
ClearTachometerDisplayLoop:
       STA    TachometerDisplay1,Y ; clear out TachometerDisplay
       DEY
       DEY
       BPL    ClearTachometerDisplayLoop
       LDY    Tachometer,X
       CPY    #$13
       BCC    DrawTachometerLoop
       TYA
       SBC    #$13
       TAY
       LDA    #$FF
       STA    TachometerDisplay1,X
       STA    TachometerDisplay2,X
       STA    TachometerDisplay3,X
       TXA
       ORA    #$06
       TAX
DrawTachometerLoop:
       DEY
       BMI    MainGameLoop_
       LDA    TachometerDisplay1,X   ; may be TachometerDisplay4 instead for tachometer >= 19
       ORA    #$08
       ASL
       STA    TachometerDisplay1,X   ; may be TachometerDisplay4 instead for tachometer >= 19
       ROR    TachometerDisplay2,X   ; may be TachometerDisplay5 instead for tachometer >= 19
       ROL    TachometerDisplay3,X   ; may be TachometerDisplay6 instead for tachometer >= 19
       JMP    DrawTachometerLoop
MainGameLoop_:
       JMP    MainGameLoop

LF4E5: STA    $D9
       LDX    #$00
StartCountdownCont:
       STA    HMCLR
LF4EB: LDY    COLORS+6 ; borders and decimal point, usually black = $00
       STY    WSYNC
       STY    COLUBK
       CLC
       ADC    #$2E
       TAY
       AND    #$0F
       STA    $D8
       TYA
       LSR
       LSR
       LSR
       LSR
       TAY
       CLC
       ADC    $D8
       CMP    #$0F
       BCC    LF509
       SBC    #$0F
       INY
LF509: EOR    #$07
       ASL
       ASL
       ASL
       ASL
       STA    HMP0,X
       STA    WSYNC
LF513: DEY
       BPL    LF513
       STA    RESP0,X
       LDA    $D9
       CLC
       ADC    #$08
       INX
       CPX    #$02
       BCC    LF4EB
       STA    WSYNC
       STA    HMOVE
       LDA    COLORS+3 ; background, usually green = $cc
       STA    WSYNC
       STA    COLUBK
       RTS

LF52D: LDA    LF7C5,Y
       STA    $0091,Y
       DEY
       DEY
       BMI    LF53A
       JMP    LF7D2
LF53A: RTS

LF53B: LDA    #$01
       STA    NUSIZ0
       STA    WSYNC
       LDX    #$06
LF543: STA    WSYNC
       INY
       LDA    LF76E,Y
       STA    GRP0
       LDA    LF775,Y
       STA    GRP1
       LDA    LF77C,Y
       STA    GRP0
       LDA    LF783,Y
       NOP
       STA    GRP1
       STA    GRP0
       DEX
       BPL    LF543
       INX
       STX    GRP0
       STX    GRP1
       STX    GRP0
       STA    WSYNC
       RTS

LF56A: .byte $02,$02,$02,$02,$00,$00,$00,$00,$00,$00,$00,$00,$07,$1F,$3F,$7E
       .byte $7D,$FD,$EF,$F7,$FE,$7E,$7D,$3F,$1F,$07,$01,$00,$00,$00,$00,$00
       .byte $00,$00,$00,$07,$1F,$3F,$77,$77,$FB,$FF,$FF,$FB,$77,$7F,$3F,$1F
       .byte $07,$01,$00,$00,$00,$00,$00,$00,$00,$00,$07,$1F,$3F,$7F,$6F,$F6
       .byte $FB,$FF,$FD,$7B,$77,$3F,$1F,$07,$01,$00,$00,$00,$00,$00,$00,$00
       .byte $00,$80,$E0,$F7,$FB,$FB,$FF,$BF,$DF,$FD,$FA,$FA,$F6,$EC,$B8,$E0
       .byte $00,$00,$00,$00,$00,$00,$00,$00,$80,$E0,$F7,$FB,$BB,$7F,$FF,$FF
       .byte $7D,$BA,$BA,$F6,$EC,$B8,$E0,$00,$00,$00,$00,$00,$00,$00,$00,$80
       .byte $E0,$F7,$BB,$7B,$FF,$FF,$7F,$BD,$DA,$FA,$F6,$EC,$B8,$E0,$00,$00
       .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$44,$22
       .byte $EE,$F7,$FB,$FD,$FF,$EF,$E8,$F8,$00,$00,$00,$00,$00,$00,$00,$00
       .byte $00,$00,$00,$00,$00,$00,$00,$20,$92,$E1,$F6,$FB,$FB,$FF,$EF,$E0
       .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$20,$EF,$74
       .byte $BA,$DD,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
       .byte $00,$00,$00,$00,$00,$00,$00,$20,$10,$60,$B6,$BB,$FA,$FF,$0F,$00
       .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$00,$FF,$80
       .byte $80,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
       .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$F0,$0E,$E1,$1F,$00,$00,$00
       .byte $00,$00,$00,$00,$00,$00,$00,$00,$30,$78,$FC,$FE,$FA,$34,$18,$00
       .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
       .byte $00,$00,$00,$00,$00,$00,$00,$60,$F0,$F8,$FC,$F4,$68,$30,$00,$00
       .byte $00,$00,$00,$00,$00,$00
LF6C0: .byte $77,$BB,$DD,$EE
LF6C4: .byte $EE,$DD,$BB,$77
ParallaxUpdateFrequencyData:
       .byte $06,$02
ColorsData:
       .byte $00,$00,$88,$CC,$D8,$46
LF6D0: .byte $00,$00,$FF

StartCountdown:
       LDA    #$9F
       STA    CountdownTimer
       LDX    #$01
StartCountdownLoop:
       LDA    #$01
       STA    VDELP0,X
       STA    RNG_82
       LDA    #$AA
       STA    InGameTimeDigit1,X
       STA    InGameTimeDigit2,X
       LDA    #$04
       STA    PlayerVerticalPosition,X
       STA    PlayerShiftInput,X
       STA    Audio_B1,X
       DEX
       BPL    StartCountdownLoop
       TAX
       LDA    #$23
       JMP    StartCountdownCont

TachometerFrameCycleData:
       .byte $00,$00,$02,$06,$0E
TachometerChangeData:
       .byte $03,$01,$01,$01,$01
       .byte $3C,$66,$66,$66,$66,$66,$66,$3C,$7E,$18,$18
       .byte $18,$18,$78,$38,$18,$7E,$60,$60,$3C,$06,$06,$46,$3C,$3C,$46,$06
       .byte $0C,$0C,$06,$46,$3C,$0C,$0C,$0C,$7E,$4C,$2C,$1C,$0C,$7C,$46,$06
       .byte $06,$7C,$60,$60,$7E,$3C,$66,$66,$66,$7C,$60,$62,$3C,$18,$18,$18
       .byte $18,$0C,$06,$42,$7E,$3C,$66,$66,$3C,$3C,$66,$66,$3C,$3C,$46,$06
       .byte $3E,$66,$66,$66,$3C,$00,$00,$00,$00,$00,$00,$00,$00,$C3,$C7,$CF
       .byte $DF,$FB,$F3,$E3,$C3,$7E,$C3,$C0,$C0,$C0,$C0,$C3,$7E,$7E,$C3,$C3
       .byte $CF,$C0,$C0
LF76E: .byte $C3,$7E,$F2,$4A,$4A,$72,$4A
LF775: .byte $4A,$F3,$0E,$11,$11,$11,$11
LF77C: .byte $11,$CE,$45,$45,$45,$45,$55
LF783: .byte $6D,$45,$10,$90,$50,$30,$10,$10,$10,$F8,$81,$82,$E2,$83,$82,$FA
       .byte $8F,$48,$28,$2F,$EA,$29,$28,$21,$A1,$A0,$20,$20,$20,$BE,$10,$10
       .byte $A0,$40,$40,$40,$40,$0F,$41,$ED,$A9,$E9,$A9,$AD,$F0,$11,$53,$56
       .byte $5C,$58,$50,$FE,$80,$3A,$A2,$BA,$8A,$BA,$00,$00,$E9,$AD,$AF,$AB
       .byte $E9
LF7C4: .byte $6E
LF7C5: .byte $F5,$B3,$F5,$00,$F6,$2E,$F6,$5C,$F6,$8A,$F6
LF7D0: LDY    #$0A
LF7D2: LDA    LF7C4,Y
       CLC
       ADC    PlayerVerticalPosition,X
       CPY    #$04
       BCC    LF7F1
       CLC
       ADC    PlayerClutchStrain,X
       CPY    #$08
       BCS    LF7F4
       STA    $D8
       LDA    PlayerEngineBlown,X
       BEQ    LF7EC
       ADC    LF6F2,Y
LF7EC: ADC    $D8
       JMP    LF7F4
LF7F1: CLC
       ADC    PlayerWheelRotation,X
LF7F4: STA    $0090,Y
       JMP    LF52D
LF7FA: .byte $00,$00,$00,$F0,$00,$00
