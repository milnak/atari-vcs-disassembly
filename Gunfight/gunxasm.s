; xasm gunxasm.s /o:gunfight.bin
    OPT h-
    ICL 'vcsxasm.h'

; Compile switches

NTSC                    EQU 1
PAL                     EQU 0

; Position equates

SCREENSTART EQU $54
UP          EQU SCREENSTART
DOWN        EQU $04
LEFT        EQU $02
RIGHT       EQU $A0
SCOREOFFSET EQU $31
MAXSCORE    EQU $42

; Color values

    IFT NTSC

GREYSTONE       EQU $04
YELLOWBACK      EQU $1C
REDCACTI        EQU $30
PURPLEFACE      EQU $3C
GREENCACTI      EQU $D4
GREENCOWBOY1    EQU $E4
GREENCOWBOY2    EQU $E2
GREENCOWBOY3    EQU $E0
BROWNFRAME      EQU $F4
BROWNCOWBOY1    EQU $F2
BROWNCOWBOY2    EQU $F0
BROWNARROW      EQU $F6

    ELI PAL

GREYSTONE       EQU $08
YELLOWBACK      EQU $28
REDCACTI        EQU $62
PURPLEFACE      EQU $48
GREENCACTI      EQU $52
GREENCOWBOY1    EQU $32
GREENCOWBOY2    EQU $30
GREENCOWBOY3    EQU $00
BROWNFRAME      EQU $22
BROWNCOWBOY1    EQU $20
BROWNCOWBOY2    EQU $00
BROWNARROW      EQU $24

    EIF

    ORG $80

horPosP0            EQU $80 ; Horizontal position player 0
horPosP1            EQU $81 ; Horizontal position player 1
horPosM0            EQU $82 ; Horizontal position missile 0
horPosM1            EQU $83 ; Horizontal position missile 1
verPosP0            EQU $84 ; Vertical position player 0
verPosP1            EQU $85 ; Vertical position player 1
verPosM0            EQU $86 ; Vertical position missile 0
verPosM1            EQU $87 ; Vertical position missile 1
verPosBL            EQU $88 ; Vertical position ball
verPosPF            EQU $89 ; Vertical position obstacle
obstacleSize        EQU $8A ; Size of the obstacle
frameCounter        EQU $8B ;
bcdscore2           EQU $8C ; Player 2 score --- Dont swap!!! ---
bcdscore1           EQU $8D ; Player 1 score --- Dont swap!!! ---
bcdGameTimer        EQU $8E ; Game Timer
switchesRead        EQU $8F ; stores the values of the switches 
levelNumber         EQU $90 ; number of current level
soundCount          EQU $91 ; current note to be played
decayCount          EQU $92 ; note decay
gameState           EQU $93 ; OVER1/OVER2/X/X/X/DEATH1/DEATH2/MUSIC
aiCounter           EQU $94 ; counter for AI movement duration
aiValue1            EQU $95 ; FF in two-player, FX in AI mode
aiValue2            EQU $96 ; FF in two-player, FX in AI mode
gunState            EQU $97 ; BulletCount / FireDelay
rnd                 EQU $99 ; Random #
verMunPos           EQU $9B ; Vertical positions of the munboxes
horMunPos           EQU $9D ; Horizontal positions of the munboxes
reflectBuffer       EQU $9F ; Buffers the reflect state
hairBuffer          EQU $A1 ; Buffer player haircolor permanent
animCounter         EQU $A3 ; Simple frameCounters, one for each player
movementBuffer      EQU $A5 ; backup the Joystick readings for each player
playerShapePtr00    EQU $A7 ; Pointer to current player 0 shape in the ROM
playerShapePtr01    EQU $A9 ; Pointer to current player 1 shape in the ROM
obstaclePtr00       EQU $AB ; pointer to left obstacleData
obstaclePtr01       EQU $AD ; pointer to right obstacleData
obstaclePtr02       EQU $AF ; pointer to obstacleColor
colorShapePtr00     EQU $B1 ; pointer to Player 0 colors
colorShapePtr01     EQU $B3 ; pointer to Player 1 colors
bulletHorPos        EQU $B5 ; X Coordinates of the bullets
bulletVerPos        EQU $B9 ; Y Coordinates of the bullets
bulletData          EQU $BD ; Direction & other Data of the bullets
playerShape00       EQU $C1 ; Player 0 shape complete in the RAM
playerShape01       EQU $CC ; Player 1 shape complete in the RAM
obstacleData00      EQU $D7 ; Left obstacle side
obstacleData01      EQU $E7 ; Right obstacle side
tempVar1            EQU $F7 ;
tempVar2            EQU $F8 ;
tempVar3            EQU $F9 ;
audioFreq           EQU $FA ; Current fr=ency of voice
audioVolume         EQU $FB ;

    ORG $F000

SkipDraw0
                    LDA #$00
                    STA PF2
                    STA COLUPF
                    NOP
                    NOP
                    NOP
                    NOP
                    STA tempVar1
                    BEQ Continue0
SkipDraw
                    SEC
                    NOP
                    LDA #$00
                    STA a:COLUP0
                    BEQ Continue
SkipDraw2
                    SEC
                    NOP
                    LDA #$00
                    STA COLUP1
                    LDA tempVar2
                    STA PF2
                    LDA #$00
                    BEQ Continue2

MainScreen          STA WSYNC           ; Finish current line
                    STA CXCLR           ; Clear collisions
                    STA VBLANK          ; Stop vertical blank
                    JSR SixDigit
NextLine            TXA
                    LDX #$1F
                    TXS
                    TAX
                    LSR @
                    STA WSYNC
                    TAY
                    CMP verPosBL
                    PHP
                    TYA
                    SEC
                    SBC verPosPF
                    ADC obstacleSize
                    BCC SkipDraw0
                    LDA (obstaclePtr02),Y
                    STA a:COLUPF
                    LDA (obstaclePtr00),Y
                    STA PF2
                    STA tempVar1
                    LDA (obstaclePtr01),Y
Continue0
                    STA PF2
                    STA tempVar2
                    SEC
                    TXA
                    SBC verPosP0             ;
                    ADC #$0B
                    BCC SkipDraw
                    TAY
                    LDA (colorShapePtr00),Y
                    STA COLUP0
                    LDA playerShape00,Y           ;
Continue
                    CPX verPosM1
                    PHP
                    CPX verPosM0
                    PHP
                    STA GRP0
                    LDA tempVar1
                    SEC
                    STA PF2
                    TXA
                    SBC verPosP1             ;
                    ADC #$0B
                    BCC SkipDraw2
                    TAY
                    LDA (colorShapePtr01),Y
                    STA COLUP1
                    LDA tempVar2
                    STA PF2
                    LDA playerShape01,Y           ;
Continue2
                    STA GRP1
                    DEX
                    BNE NextLine

; Ok, screen is drawn, now start the overscan & blank the screen

                    STX PF2
                    STX COLUPF
                    DEX
                    TXS
                    STA WSYNC
                    LDA #$02            ;
                    STA VBLANK          ; Start vertical blank

        IFT PAL
                    LDA #$40            ;
                    STA TIM64T          ; Init timer
                    JSR Random          ; Seed the random values...
        ELI NTSC
                    JSR Random          ; Seed the random values...
                    LDA #$23            ;
                    STA TIM64T          ; Init timer
        EIF

; We're in the overscan now...

                    LDA gameState
                    AND #$06
                    BNE Death
                    JMP JoyNow
Death
; No Bullets when someone's death
                    LDY #$03
DeleteAllBuls       LDA #$FF
                    STA bulletVerPos,Y
                    STA bulletData,Y
                    DEY
                    BPL DeleteAllBuls

                    LDA gameState
                    BPL NoGameOver
                    JSR PlayGood
                    LDY #<death2
                    LDA animCounter
                    BPL AnimDone
                    LSR @
                    LSR @
                    LSR @
                    LSR @
                    AND #$07
                    CLC
                    ADC #<death2
                    TAY
                    JMP AnimDone
NoGameOver
                    JSR PlayHigh
                    LDY #<death1
AnimDone
                    LDX #$0A

                    LDA gameState
                    AND #$02
                    BEQ OtherDaysie

NextPlayerLine
                    LDA #$AA
                    STA tempVar1
                    LDA #$BB
                    STA tempVar2
                    LDA $F90A,Y
                    STA playerShape00,X
                    DEY
                    DEX
                    BPL NextPlayerLine
                    LDA #<deathcolor
                    STA colorShapePtr00
                    BNE LoopDone
OtherDaysie
                    LDA #$BB
                    STA tempVar1
                    LDA #$AA
                    STA tempVar2
                    LDA $F90A,Y
                    STA playerShape01,X
                    DEY
                    DEX
                    BPL OtherDaysie
                    LDA #<deathcolor
                    STA colorShapePtr01
LoopDone
                    DEC animCounter
                    LDA animCounter
                    BNE StillDeath
                    LDA gameState
                    BPL NoGameOver2
                    JSR InitGame          ; Init Game
                    JSR NextObstacle
                    JMP OscanEnd
NoGameOver2
                    JSR MusicIsNotPlaying
StillDeath
                    LDA gameState
                    BPL NoGameOver3
                    LDA tempVar1
                    STA bcdScore1
                    LDA tempVar2
                    STA bcdScore2
NoGameOver3
                    JMP OscanEnd

JoyNow
                    JSR joy        ; Read the joysticks.

                    LDA gameState
                    LSR @
                    BCC NoMusicNow
                    JSR PlayCash
                    JMP NoTimer
NoMusicNow
; Do timer in Escape Mode
                    LDA gameState
                    AND #$06
                    BNE NoTimer
                    LDA frameCounter
                    ASL @
                    ASL @
                    BNE NoTimer
                    LDA levelNumber
                    AND #%00011000
                    CMP #%00010000
                    BNE NoTimer
                    SED
                    LDA bcdScore2
                    SEC
                    SBC #$01
                    STA bcdScore2
                    BNE EscapeContinues
                    LDA gameState
                    ORA #%10000010 ; Kill Player & Game Over
                    STA gameState
                    LDY #$FF
                    STY animCounter
                    INY
                    STY audioVolume
EscapeContinues
                    CLD
NoTimer

                    LDX #$01
; Reloading if in six shooter mode...

CollisionCheck      LDA CXP0FB,X
                    AND #$40 ; Player <-> Ball?
                    BEQ AnimPlayer
                    LDA gunState,X
                    ORA #$60        ; reload!
                    STA gunState,X
                    JSR Random
                    AND #$1F
                    ADC #$03
                    STA verMunPos,X
                    JSR Random
                    AND #$1F
                    ADC leftrestriction,X
                    ADC #$04
                    STA horMunPos,X

; After we read the joysticks, animate!

AnimPlayer          LDA movementBuffer,X
                    EOR #$FF
                    AND #$0F
                    BEQ NoAnim

                    LDY frontcolor,X    ; Assume No Hair
                    CMP #$01
                    BNE HairsOk
                    LDY backcolor,X ; Load Hair
HairsOk             STY hairBuffer,X
                    AND #$0F
                    BEQ NoAnim
                    ASL @
                    ASL @
                    STA movementBuffer,X
                    INC animCounter,X
                    LDA animCounter,X
                    AND #$18
                    LSR @
                    LSR @
                    LSR @
                    ADC movementBuffer,X
                    TAY
                    TXA
                    ASL @
                    TAX
                    LDA cowboyWalk,Y
                    STA playerShapePtr00,X
                    TXA
                    LSR @
                    TAX
NoAnim              DEX
                    BPL CollisionCheck

                    LDA hairBuffer
                    STA colorShapePtr00
                    LDA hairBuffer+1
                    STA colorShapePtr01

; Do AI here!
                    LDA aiCounter
                    BNE KiDone
                    LDA frameCounter
                    LSR @
                    BCS DoVerticalMove
                    LDA gunState+1
                    AND #$F0
                    BEQ GrabBox
                    BNE DoRandomMove
GrabBox
                    LDX #%00000111 ; right
                    LDA horPosP1
                    CMP horMunPos+1
                    BMI MoveRight
                    LDX #%00001011 ; left
MoveRight
                    STX aiValue2
                    JMP CalculateMovelength
DoVerticalMove
                    LDA gunState+1
                    AND #$F0
                    BEQ GrabBox2
                    BNE DoRandomMove
GrabBox2
                    LDX #%00001101 ; down
                    LDA verMunPos+1
                    ASL @
                    CMP verPosP1
                    BMI MoveUp
                    LDX #%00001110 ; up
MoveUp
                    STX aiValue2
                    JMP CalculateMovelength
DoRandomMove
                    LDX #$FF
                    LDY #$00
                    LDA SWCHB
                    ASL @
                    BCS NoKi2
                    LDX #$F0
NewValue
                    JSR Random
                    AND #$07
                    TAY
                    LDA frameCounter
                    LSR @
                    LDA aimovetab,Y
                    BCS AIGoodAsIs
                    ORA #$08
                    AND #$0B
AIGoodAsIs
                    TAY
                    CPY aiValue2
                    BEQ NewValue
NoKi2
                    STX aiValue1
                    STY aiValue2
CalculateMovelength
                    JSR Random
                    STA tempVar1
                    LDA #$1F
                    BIT SWCHB
                    BVS AIFastMove ;
                    LDA #$3F
AIFastMove
                    AND tempVar1
                    ADC #$01
                    LDX soundCount
                    BEQ NoDancing
                    LDA #$20
NoDancing
                    STA aiCounter
KiDone
                    DEC aiCounter
OscanEnd

; Play soundeffects for both players

                    LDA frameCounter    ;
                    AND #$01            ;
                    BNE ChannelDone     ; N: channel done
                    LDA audioVolume     ; Y: A -> current volume > 0?
                    BEQ ChannelDone     ; N: channel done
                    DEC audioVolume     ; Y: turn the volume down...
                    LDA audioVolume     ;
                    STA AUDV0           ;
                    INC audioFreq       ; ...and increment the frequency
                    LDA audioFreq       ;
                    STA AUDF0           ;
ChannelDone
                    JSR WaitIntimReady
                    JMP MainLoop

start
                    SEI
                    CLD
                    LDX #$FF
                    TXS
                    LDA #$00

zerozero            STA $00,X      ;zero out the machine
                    DEX
                    BNE zerozero

                    LDA #%00000111
                    STA levelNumber

                    LDA #YELLOWBACK
                    STA COLUBK

                    LDA #$21
                    STA CTRLPF

                    LDA #[UP-DOWN]/4
                    STA verMunPos
                    STA verMunPos+1
                    LDA #$18
                    STA horMunPos
                    LDA #$88
                    STA horMunPos+1

                    JMP GameOver

MainLoop
; Here we're in the vertical blank, we start with the vertical sync!
VerticalBlank
                    STY WSYNC           ; Finish current line
                    LDY #$02            ;
                    STY VSYNC           ; start vertical sync
                    STY WSYNC           ; Finish current line
                    STY WSYNC           ; Finish current line
                    STY WSYNC           ; Finish current line
                    STA VSYNC           ; Stop vertical sync

        IFT PAL
                    LDA #$4A            ;
        ELI NTSC
                    LDA #$2B            ;
        EIF
                    STA TIM64T          ; Init timer

                    LDA gameState
                    AND #$06
                    BNE CheckSwitches
                    LDY #$06
AnimateCowboys
                    LDA (playerShapePtr01),Y
                    STA playerShape01,Y
                    LDA (playerShapePtr00),Y
                    STA playerShape00,Y
                    DEY
                    BPL AnimateCowboys
CheckSwitches
                    LDA SWCHB
                    CMP switchesRead    ; same as last read?
                    BEQ DoObstacleDI     ; Y: Continue
                    STA switchesRead    ; N: Store new value
                    LSR @                 ; Reset?
                    BCS NoReset         ; N: Continue
GameOver
                    JSR InitGame          ; Init Game
                    JSR NextObstacle
                    JMP ResetDone
NoReset
                    LSR @                 ; Select?
                    BCS DoObstacleDI     ; N:
                    LDA levelNumber
                    CLC
                    ADC #%00001000
                    STA levelNumber
                    JSR InitGame          ; init Game

; Disintegrate the obstacle!

DoObstacleDI
                    LDA frameCounter
                    LDY #%01000000
                    AND #$01

; Stuff for bullet movement
                    BEQ vertMoveSkip
                    LDY #%00000000
vertMoveSkip
                    STY tempVar3
; Stuff for bullet movement

                    ASL @
                    TAX
                    STX tempVar2
                    LDA CXM1FB
                    BPL PFNotHit1
                    JSR Disintegrate
PFNotHit1
                    INC tempVar2
                    LDX tempVar2
                    LDA CXM0FB
                    BPL BulletMovement
                    JSR Disintegrate

; Move bullets

BulletMovement
                    LDX #$03
BulletMove
                    LDA bulletData,X
                    ORA tempVar3
                    LDY #$00
                    ASL @
                    BCC SlowBullet
                    INY
SlowBullet
                    ROL @
                    BCC DoVertical
                    ROL @
                    JMP SkipVertical
DoVertical
                    ROL @
                    BCS VertIncrement
                    DEC bulletVerPos,X
                    BCC SkipVertical
VertIncrement
                    INC bulletVerPos,X
SkipVertical
                    ROL @
                    BCS HorzIncrement
                    DEC bulletHorPos,X
                    BCC Done
HorzIncrement
                    INC bulletHorPos,X
Done
                    ROR @
                    ROR @
                    ROR @
                    DEY
                    BPL SlowBullet

; Bounce bullets
                    INY
                    STY tempVar1 ; tempvar1 = 0!
                    LDA bulletData,X
                    LDY bulletVerPos,X
                    CPY #DOWN
                    BPL BulletDownOK
                    ORA #%00100000
BulletDownOK
                    CPY #UP
                    BMI BulletUpOK
                    AND #%11011111
BulletUpOK
                    LDY bulletHorPos,X
                    CPY #LEFT
                    BNE BulletLeftOK
                    ORA #%00010000
                    STY tempVar1
BulletLeftOK
                    CPY #RIGHT
                    BNE BulletRightOK
                    AND #%11101111
                    STY tempVar1
BulletRightOK
                    STA bulletData,X

; Glenns Bounce On/Off switch
                    LDA SWCHB
                    AND #$08
                    BNE IgnoreBW
                    LDA tempVar1
                    BEQ IgnoreBW
                    LDA #$FF
                    sta bulletVerPos,x
                    sta bulletData,x
IgnoreBW
                    DEX
                    BPL BulletMove

; Ouch!!!! I'm hit?!?
ResetDone
                    LDY #$03
NextBulCol
                    TYA
                    LSR @
                    EOR #$01
                    TAX
                    LDA bulletHorPos,Y
                    ADC #$08
                    SBC horPosP0,X
                    BMI NoHit
                    SBC #$08
                    BPL NoHit
                    LDA verPosP0,X
                    SBC bulletVerPos,Y
                    BMI NoHit
                    SBC #$0B
                    BPL NoHit
                    STY tempVar2
                    LDA #$FF
                    STA bulletVerPos,Y
                    STA bulletData,Y
                    CPX #$01
                    BEQ RemoveOtherHat
                    LDA playerShape00+10
                    BEQ HatRemoved
                    LDA menwithouthats
                    STA playerShape00+9
                    LDA menwithouthats+1
                    STA playerShape00+10
                    BEQ NoHit
RemoveOtherHat
                    LDA playerShape01+10
                    BEQ HatRemoved
                    LDA menwithouthats
                    STA playerShape01+9
                    LDA menwithouthats+1
                    STA playerShape01+10
                    BEQ NoHit
HatRemoved
                    LDA #$00            ; Clear shot sound
                    STA audioVolume
                    LDA gameState
                    CPX #$01
                    BEQ OtherPlayerDead
                    ORA #$02
                    BNE ContKill
OtherPlayerDead
                    ORA #$04
ContKill
                    STA gameState
                    JSR IncTargetScore
                    LDA #$FF
                    STA animCounter
                    JMP CollcheckDone
NoHit
                    DEY
                    BPL NextBulCol

; Check which bullets are still alive

CollcheckDone
                    INC frameCounter
                    LDA frameCounter
                    AND #$0F
                    BNE CopyBulletData
                    LDY #$03
AliveCheck          LDX bulletData,Y
                    DEX
                    TXA
                    AND #$0F
                    STA tempVar1
                    BNE BulletAlive
                    LDX #$FF
                    STX bulletVerPos,Y
                    STX bulletData,Y
BulletAlive         LDA bulletData,Y
                    AND #$F0
                    ORA tempVar1
                    STA bulletData,Y
                    DEY
                    BPL AliveCheck

; Copy the right bulletdtata to the actual used bullet pointers.

CopyBulletData
                    LDA frameCounter
                    AND #$01
                    ASL @
                    TAY
                    LDX #$01
CopyNextBullet      LDA bulletHorPos,Y
                    STA horPosM0,X
                    LDA bulletVerPos,Y
                    STA verPosM0,X
                    INY
                    DEX
                    BPL CopyNextBullet

; Yes! Here we flicker!!!

                    LDA frameCounter
                    AND #$01
                    TAY

; Draw a Munbox?
                    LDX #$FF        ; assume no box
                    LDA gunState,Y
                    AND #$F0
                    BNE DrawBox
                    LDX verMunPos,Y
DrawBox
                    STX verPosBL

; Position all objects

                    LDA horMunPos,Y
                    LDX #$04
                    JSR PosPlayer2
                    DEX
                    LDA horPosM1
                    JSR PosPlayer2
                    DEX
                    LDA horPosM0
                    JSR PosPlayer2
                    DEX
                    LDA #SCOREOFFSET
                    JSR PosPlayer1
                    DEX
                    LDA #SCOREOFFSET-9
                    JSR PosPlayer1
                    STA WSYNC           ; Finish current line
                    STA HMOVE

; Init State display...

                    LDA #$06            ; players 3 copies/wide spacing
                    STA NUSIZ0          ;
                    STA NUSIZ1          ;
                    LDA #$00
                    STA REFP0           ;
                    STA REFP1           ; No Reflected score drawings...

                    LDA #$FF
                    STA tempVar1+1
                    STA obstaclePtr02+1
                    STA obstaclePtr00+1
                    STA obstaclePtr01+1
                    STA movementBuffer+1
                    STA horPosM0+1

; Move Obstacle
                    LDA frameCounter
                    AND #$03
                    BNE VBLANKDone
                    LDA levelNumber
                    LSR @
                    BCS VBLANKDone
                    INC verPosPF
                    LSR @
                    BCC SpeedOk
                    INC verPosPF
                    INC verPosPF
SpeedOk
                    LDA verPosPF
                    AND #$3F
                    STA verPosPF
VBLANKDone
		            JSR WaitIntimReady
                    JMP MainScreen

WaitIntimReady
                    LDA INTIM           ; finish vertical blank
                    BNE WaitIntimReady  ;
		            RTS
joy
                    LDX #%00001100 ; assume slow bullets
                    BIT SWCHB
                    BVS FireSlowBullets ;
                    LDX #%10000110 ; fast bullets
FireSlowBullets
                    STX tempVar1
                    LDA SWCHA
                    AND aiValue1
                    ORA aiValue2
                    STA tempVar2
                    LDX INPT4
                    BMI BranchShortCut
                    TAY
                    LDA gameState
                    LSR @
                    BCC GameStarted
                    LDA gameState
                    AND #$FE
                    STA gameState
                    LDA #$00            ; silencium!
                    STA AUDV0
                    STA AUDV1
                    STA soundCount
BranchShortCut
                    JMP NoButton1
GameStarted
                    TYA
                    EOR #$FF
                    LSR @
                    LSR @
                    LSR @
                    LSR @
                    TAX
                    AND #$08
                    BEQ NoButton1
                    LDA cowboyshoot,X
                    STA playerShapePtr00

; Fire a bullet for player 0

                    LDA gunState
                    TAY
                    AND #$0F
                    BEQ ContinueFire1
                    DEC gunState
                    JMP NoButton0
ContinueFire1
                    TYA
                    AND #$F0
                    BEQ NoButton0
                    LDA bulletinit,X
                    ORA tempVar1
                    LDX #$01
FreeBulletSearch    LDY bulletVerPos,X
                    BPL BulletOccupied
                    STA bulletData,X
                    LDA verPosP0
                    SEC
                    SBC #$06
                    STA bulletVerPos,X
                    LDA horPosP0
                    AND #$FE
                    STA bulletHorPos,X
                    LDA gunState
                    ORA #$0F
                    TAY
                    LDA levelNumber
                    AND #$18
                    CMP #$08
                    BNE NoSixMode
                    TYA
                    CLC
                    SBC #$10
                    TAY
NoSixMode
                    STY gunState

; Hit sound
                    LDX #$08
                    STX AUDC0
                    LDX #$10            ; Volume 10
                    STX audioVolume     ; Set volume
                    LDX #$05            ; Start with pitch 5...
                    STX audioFreq       ; ...It's increased from there
; Hit sound

                    LDX #$00
BulletOccupied
                    DEX
                    BPL FreeBulletSearch
NoButton0
                    LDA #$00
                    STA REFP0
                    STA reflectBuffer
                    LDA frontcolor
                    STA hairBuffer
                    LDA tempVar2
                    ORA #$F0
                    STA tempVar2
                    BNE NoButton2
NoButton1
                    LDA gunState
                    AND #$F0
                    STA gunState
NoButton2
                    LDA levelNumber
                    AND #$18
                    CMP #$10
                    BEQ BranchShortCut2
                    LDA #$FF
                    LDX aiValue1
                    CPX #$F0
                    BNE NoAIFire

                    LDA frameCounter
                    BIT SWCHB
                    BVS AutoFireSlow
                    ASL @
                    ASL @
                    ASL @
AutoFireSlow
NoAIFire            AND INPT5
                    BMI BranchShortCut2
                    LDY tempVar2
                    LDA gameState
                    LSR @
                    BCC GameStarted2
BranchShortCut2
                    JMP NoButton4
GameStarted2
                    TYA

                    EOR #$FF
                    AND #$0F
                    TAX
                    AND #$04
                    BEQ BranchShortCut2

                    LDA cowboyshoot,X
                    STA playerShapePtr01

; Fire a bullet for player 1

                    LDA gunState+1
                    TAY
                    AND #$0F
                    BEQ ContinueFire2
                    DEC gunState+1
                    JMP NoButton3
ContinueFire2
                    TYA
                    AND #$F0
                    BEQ NoButton3
                    LDA bulletinit,X
                    ORA tempVar1
                    LDX #$01
FreeBulletSearch2   LDY bulletVerPos+2,X
                    BPL BulletOccupied2
                    STA bulletData+2,X
                    LDA verPosP1
                    SBC #$05
                    STA bulletVerPos+2,X
                    LDA horPosP1
                    SBC #$06
                    AND #$FE
                    STA bulletHorPos+2,X
                    LDA gunState+1
                    ORA #$0F
                    TAY
                    LDA levelNumber
                    AND #$18
                    CMP #$08
                    BNE NoSixMode2
                    TYA
                    CLC
                    SBC #$10
                    TAY
NoSixMode2
                    STY gunState+1
; Hit sound
                    LDX #$08
                    STX AUDC0
                    LDX #$10            ; Volume 10
                    STX audioVolume     ; Set volume
                    LDX #$05            ; Start with pitch 5...
                    STX audioFreq       ; ...It's increased from there
; Hit sound
                    LDX #$00
BulletOccupied2
                    DEX
                    BPL FreeBulletSearch2
NoButton3
                    LDA #$08
                    STA REFP1
                    STA reflectBuffer+1
                    LDA frontcolor+1
                    STA hairBuffer+1
                    LDA tempVar2
                    ORA #$0F
                    STA tempVar2
                    BNE NoButton5
NoButton4
                    LDA gunState+1
                    AND #$F0
                    STA gunState+1
NoButton5
                    LDA tempVar2
                    LDX #$01
JoyPlayer2
                    STA movementBuffer,X
                    LSR @
                    TAY
                    BCS UpDone
                    INC verPosP0,X
                    LDA verPosP0,X
                    CMP #SCREENSTART+2
                    BNE UpDone
                    DEC  verPosP0,X
                    LDA movementBuffer,X
                    ORA #$01
                    STA movementBuffer,X
UpDone
                    TYA
                    LSR @
                    TAY
                    BCS DownDone
                    DEC verPosP0,X
                    LDA verPosP0,X
                    CMP #$0C
                    BNE DownDone
                    INC verPosP0,X
                    LDA movementBuffer,X
                    ORA #$02
                    STA movementBuffer,X
DownDone
                    TYA
                    LSR @
                    TAY
                    BCS LeftDone
                    DEC horPosP0,X
                    LDA horPosP0,X
                    CMP leftrestriction,X
                    BNE HorPosOK2
                    INC horPosP0,X
                    LDA movementBuffer,X
                    ORA #$04
                    STA movementBuffer,X
HorPosOK2
                    LDA #$08
                    STA REFP0,X
                    STA reflectBuffer,X
LeftDone
                    TYA
                    LSR @
                    TAY
                    BCS RightDone
                    INC horPosP0,X
                    LDA horPosP0,X
                    CMP rightrestriction,X
                    BNE HorPosOK
                    DEC horPosP0,X
                    LDA movementBuffer,X
                    ORA #$08
                    STA movementBuffer,X
HorPosOK
                    LDA #$00
                    STA REFP0,X
                    STA reflectBuffer,X
RightDone
                    TYA
                    DEX
                    BPL JoyPlayer2
                    RTS

NextObstacle
                    LDY levelNumber     ; Y:
                    INY
                    TYA
                    AND #%00000111
                    STA tempVar1
                    TAX
                    LDA postab,X
                    STA verPosPF
                    LDA sizetab,X
                    STA obstacleSize
                    LDA levelNumber
                    AND #%11111000
                    ORA tempVar1
                    STA levelNumber
                    LDA tempVar1
                    ASL @
                    TAX
                    LDA postab1,X
                    STA obstaclePtr00
                    LDA postab1+1,X
                    STA obstaclePtr00+1
                    LDA postab2,X
                    STA obstaclePtr01
                    LDA postab2+1,X
                    STA obstaclePtr01+1
                    LDY #$0F
ROM2RAMCopy
                    LDA (obstaclePtr00),Y
                    STA obstacleData00,Y
                    LDA (obstaclePtr01),Y
                    STA obstacleData01,Y
                    DEY
                    BPL ROM2RAMCopy
                    RTS

cowboyWalk
         dta <cbup01,<cbup00,<cbup01,<cbup02  ; DummyLine
         dta <cbup01,<cbup00,<cbup01,<cbup02  ; Up
         dta <cbup01,<cbup00,<cbup01,<cbup02  ; Down
         dta <cbup01,<cbup00,<cbup01,<cbup02  ; DummyLine
         dta <cblt01,<cblt00,<cblt01,<cblt02  ; Left
         dta <cblu01,<cblu00,<cblu01,<cblu02  ; Left-Up
         dta <cbld01,<cbld00,<cbld01,<cbld02  ; Left-Down
         dta <cbup01,<cbup00,<cbup01,<cbup02  ; DummyLine
         dta <cblt01,<cblt00,<cblt01,<cblt02  ; Right
         dta <cblu01,<cblu00,<cblu01,<cblu02  ; Right-Up
         dta <cbld01,<cbld00,<cbld01,<cbld02  ; Right-Down

cowboyshoot
         dta <cbup01 ; DummyLine
         dta <cbup01 ; DummyLine
         dta <cbup01 ; DummyLine
         dta <cbup01 ; DummyLine
         dta <cblt03 ; Left
         dta <cblu03 ; Left-Up
         dta <cbld03 ; Left-Down
         dta <cbup01 ; DummyLine
         dta <cblt03 ; Right
         dta <cblu03 ; Right-Up
         dta <cbld03 ; Right-Down

bulletinit
         dta %00000000 ; DummyBullet
         dta %00000000 ; DummyBullet
         dta %00000000 ; DummyBullet
         dta %00000000 ; DummyBullet
         dta %01000000 ; Left
         dta %00100000 ; Left-Up
         dta %00000000 ; Left-Down
         dta %00000000 ; DummyBullet
         dta %01010000 ; Right
         dta %00110000 ; Right-Up
         dta %00010000 ; Right-Down

; Init the game after reset/select

InitGame
            LDA gameState
            AND #$7F
            STA gameState

; Reset score
            LDX #$00
            STX bcdScore1
            LDA levelNumber
            AND #%00011000
            CMP #%00010000
            BNE ScoreInitZero
            LDX #$99
ScoreInitZero
            STX bcdScore2

            LDA gameState
            LSR @
            BCS MusicIsPlaying
            LDA gameState
            ORA #$01
            STA gameState
MusicIsNotPlaying
            LDA #$02
            STA decayCount
            LDA #$00            ; Clear shot sound
            STA audioVolume
            STA soundCount

MusicIsPlaying
            LDA gameState
            AND #$F9
            STA gameState
            LDA #<cbup00
            sta playerShapePtr00
            sta playerShapePtr01
            LDA #>cbup00
            sta playerShapePtr00+1
            sta playerShapePtr01+1

            LDA #<colordata
            sta colorShapePtr00
            STA hairBuffer
            LDA #>colordata
            sta colorShapePtr00+1

            LDA #<colordata2
            sta colorShapePtr01
            STA hairBuffer+1
            LDA #>colordata2
            sta colorShapePtr01+1

            LDX #$03
BulletSpread
            LDA #$FF
            STA bulletVerPos,x
            STA bulletData,x
            DEX
            BPL BulletSpread

            LDA #$60
            STA gunState
            STA gunState+1

            LDX #$0A
ResetPlayers
            LDA cbup00,X
            STA playerShape00,X
            STA playerShape01,X
            DEX
            BPL ResetPlayers

            JSR Random
            AND #$3F
            ADC #$0D
            STA verPosP0
            JSR Random
            AND #$3F
            ADC #$0D
            STA verPosP1
            LDA #$14
            STA horPosP0
            LDA #$84
            STA horPosP1
            RTS

PosPlayer2
            CLC
            ADC #$08
PosPlayer1
            CMP #$A0
            BCC NH2
            SBC #$A0
NH2
            TAY
            LSR @
            LSR @
            LSR @
            LSR @
            STA tempVar1
            TYA
            AND #15
            CLC
            ADC tempVar1
            LDY tempVar1
            CMP #15
            BCC NH
            SBC #15
            INY
NH
            EOR #7
            ASL @
            ASL @
            ASL @
            ASL @
            STA HMP0,x
            INY                         ; Waste 5 cycles, 1 Byte
            STA WSYNC
            INY                         ; Waste 7(!) cycles, 1 Byte
            BIT 0                       ; Waste 3 cycles, 2 Byte
PosDelay    DEY
            BPL PosDelay
            STA RESP0,x
            RTS

Random
        LDA rnd
        EOR frameCounter
        LSR @
        LSR @
        SBC rnd
        LSR @
        ROR rnd+1
        ROR rnd
        ROR rnd
        LDA rnd
        RTS

PlayCash
            DEC decayCount
            DEC decayCount
            BNE DecayNotZero
            LDX soundCount
            LDA soundfreq,X
            AND #$0F
            BEQ NoNote0
            TAY
            LDA voice1disttab,Y
            STA AUDC0
            LDA voice1freqtab,Y
            STA AUDF0
NoNote0
            LDX soundCount
            LDA soundfreq,X
            AND #$F0
            BEQ NoNote1
            LSR @
            LSR @
            LSR @
            LSR @
            TAY
            LDA voice2disttab,Y
            STA AUDC1
            LDA voice2freqtab,Y
            STA AUDF1
NoNote1
            LDA #14
            STA AUDV0
            LDA #6
            STA AUDV1
            LDA #16
            STA decayCount
            INC soundCount
            RTS

DecayNotZero
            LDX soundCount
            LDA soundfreq,X
            AND #$0F
            BEQ NoDecay0
            LDA decayCount
            STA AUDV0
NoDecay0
            LDX soundCount
            LDA soundfreq,X
            AND #$F0
            BEQ NoDecay1
            LDA decayCount
            LSR @
            STA AUDV1
NoDecay1
            RTS

PlayHigh
            LDX soundCount
            LDA highfreq,X
            TAX
            JMP PlayJingle
PlayGood
            LDX soundCount
            LDA goodfreq,X
            TAX
PlayJingle
            CPX #$FF
            BNE ContinueJingle
            INX
            STX AUDV0
            INX
            STX animCounter
            RTS

ContinueJingle
            DEC decayCount
            DEC decayCount
            BNE HighDecayNotZero
            TXA
            BEQ NoHighNote1
            STA AUDF0
            LDA #12
            STA AUDC0
NoHighNote1
            LDA #14
            STA AUDV0
            LDA #16
            STA decayCount
            INC soundCount
            RTS

HighDecayNotZero
            TXA
            BEQ NoHighDecay1
            LDA decayCount
            STA AUDV0
NoHighDecay1
            RTS

:$F900-* DTA $FF

cbup00
    dta %00001100
    dta %01101100
    dta %01101100
    dta %00111000
    dta %00111010
    dta %10111010
    dta %01111100
    dta %00010000
    dta %00111000
    dta %01111100
    dta %00111000

cbup01
    dta %01101100
    dta %01101100
    dta %01101100
    dta %00111000
    dta %10111010
    dta %10111010
    dta %01111100

cbup02
    dta %01100000
    dta %01101100
    dta %01101100
    dta %00111000
    dta %10111000
    dta %10111010
    dta %01111100

cblt00
    dta %11000011
    dta %11000110
    dta %01101100
    dta %00111000
    dta %10111000
    dta %10111110
    dta %01111000

cblt01
    dta %00111100
    dta %00111000
    dta %00111000
    dta %00111000
    dta %01111000
    dta %01111000
    dta %00111000

cblt02
    dta %11000011
    dta %11000110
    dta %01101100
    dta %00111000
    dta %01111000
    dta %00111100
    dta %00111000

cblt03
    dta %00111100
    dta %00111000
    dta %00111000
    dta %00111000
    dta %00111100
    dta %00111111
    dta %00111000



cbld00
    dta %11001100
    dta %11001110
    dta %01101100
    dta %00111000
    dta %01111000
    dta %11111000
    dta %01111000

cbld01
    dta %01111110
    dta %01101100
    dta %01101100
    dta %00111000
    dta %10111010
    dta %11111100
    dta %01111000

cbld02
    dta %11001100
    dta %11001110
    dta %01101100
    dta %00111000
    dta %10111100
    dta %10111111
    dta %01111100

cbld03
    dta %01111110
    dta %01101100
    dta %01101100
    dta %00111000
    dta %01111010
    dta %11111100
    dta %01111000


cblu00
    dta %11001100
    dta %11001110
    dta %01101100
    dta %00111000
    dta %00111000
    dta %01111100
    dta %01111100

cblu01
    dta %01111110
    dta %01101100
    dta %01101100
    dta %00111000
    dta %11111001
    dta %11111110
    dta %01111100

cblu02
    dta %11001100
    dta %11001110
    dta %01101100
    dta %00111000
    dta %10111000
    dta %11111110
    dta %01111100

cblu03
    dta %01111110
    dta %01101100
    dta %01101100
    dta %00111000
    dta %10111000
    dta %01111110
    dta %01111101

death1
        dta %11000110
        dta %11101110
        dta %01111100
        dta %00111000
        dta %01111100
        dta %00111000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000

death2
        dta %11111110
        dta %10000010
        dta %10010010
        dta %10010010
        dta %10111010
        dta %10010010
        dta %01000100
        dta %00111000

deathcolor
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000

colordata
        dta BROWNFRAME
        dta BROWNCOWBOY1
        dta BROWNCOWBOY1
        dta BROWNCOWBOY2
        dta $00
        dta $00
        dta $00
        dta PURPLEFACE
        dta PURPLEFACE
        dta BROWNCOWBOY1
        dta BROWNFRAME

colordata2
        dta GREENCOWBOY1
        dta GREENCOWBOY2
        dta GREENCOWBOY2
        dta GREENCOWBOY3
        dta $00
        dta $00
        dta $00
        dta PURPLEFACE
        dta PURPLEFACE
        dta $00
        dta $00

colordata3
        dta BROWNFRAME
        dta BROWNCOWBOY1
        dta BROWNCOWBOY1
        dta BROWNCOWBOY2
        dta $00
        dta $00
        dta $00
        dta PURPLEFACE
        dta BROWNCOWBOY1
        dta BROWNCOWBOY1
        dta BROWNFRAME

colordata4
        dta GREENCOWBOY1
        dta GREENCOWBOY2
        dta GREENCOWBOY2
        dta GREENCOWBOY3
        dta $00
        dta $00
        dta $00
        dta PURPLEFACE
        dta $00
        dta $00
        dta $00

frontcolor  dta <colordata,<colordata2
backcolor   dta <colordata3,<colordata4

;Sound equates for 16 different states/notes voice 1

HOLD1       EQU $00   ; Hold last note
SIL1        EQU $01   ; Silencium please

E61         EQU $02   ; note E6
D61         EQU $03   ; note D6
C61         EQU $04   ; note C6

H51         EQU $05   ; note H5
A51         EQU $06   ; note A5

G51         EQU $07   ; note G5
F551        EQU $08   ; note F#5
E51         EQU $09   ; note E5
D51         EQU $0A   ; note D5
C51         EQU $0B   ; note C5

H41         EQU $0C   ; note H4
A41         EQU $0D   ; note A4
G41         EQU $0E   ; note G4
F451        EQU $0F   ; note F#4

;Sound equates for 10 different states/notes voice 2

HOLD2       EQU $00   ; Hold last note
DRM2        EQU $10   ; Base Drum :-)
A32         EQU $20   ; note A3
G32         EQU $30   ; note G3
F352        EQU $40   ; note F#3
E32         EQU $50   ; note E3
D32         EQU $60   ; note D3
C32         EQU $70   ; note C3

H22         EQU $80   ; note H2
A22         EQU $90   ; note A2
G22         EQU $A0   ; note G2

; frequency & distortion tabs - notes see above!

soundfreq
   dta G32|D61
   dta HOLD2|SIL1
   dta DRM2|D61
   dta HOLD2|D61
   dta G32|SIL1
   dta HOLD2|D61
   dta DRM2|D61
   dta HOLD2|HOLD1
   dta C32|E61
   dta HOLD2|HOLD1
   dta DRM2|C61
   dta HOLD2|HOLD1
   dta G32|D61
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta D32|HOLD1
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta G32|HOLD1
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta D32|HOLD1
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta G32|H51
   dta HOLD2|SIL1
   dta DRM2|H51
   dta HOLD2|H51
   dta D32|SIL1
   dta HOLD2|H51
   dta DRM2|H51
   dta HOLD2|HOLD1
   dta D32|C61
   dta HOLD2|HOLD1
   dta DRM2|A51
   dta HOLD2|HOLD1
   dta G32|H51
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta D32|HOLD1
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta G32|HOLD1
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta D32|HOLD1
   dta HOLD2|HOLD1
   dta E32|HOLD1
   dta HOLD2|HOLD1
   dta G32|SIL1
   dta HOLD2|HOLD1
   dta D32|HOLD1
   dta HOLD2|HOLD1
   dta E32|HOLD1
   dta HOLD2|HOLD1
   dta F352|HOLD1
   dta HOLD2|HOLD1
   dta G32|D51
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta D32|SIL1
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta G32|HOLD1
   dta HOLD2|HOLD1
   dta DRM2|D51
   dta HOLD2|HOLD1
   dta C32|E51
   dta HOLD2|HOLD1
   dta DRM2|C51
   dta HOLD2|HOLD1
   dta G32|D51
   dta HOLD2|HOLD1
   dta DRM2|D61
   dta HOLD2|D61
   dta D32|SIL1
   dta HOLD2|D61
   dta DRM2|D61
   dta HOLD2|HOLD1
   dta C32|E61
   dta HOLD2|HOLD1
   dta DRM2|C61
   dta HOLD2|HOLD1
   dta G32|D61
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta D32|HOLD1
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta G32|HOLD1
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta D32|HOLD1
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta G32|H41
   dta HOLD2|HOLD1
   dta DRM2|H41
   dta HOLD2|H41
   dta D32|HOLD1
   dta HOLD2|SIL1
   dta DRM2|H41
   dta HOLD2|H41
   dta D32|A41
   dta HOLD2|HOLD1
   dta DRM2|F451
   dta HOLD2|HOLD1
   dta G32|G41
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta D32|SIL1
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta G32|HOLD1
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta H22|HOLD1
   dta HOLD2|HOLD1
   dta C32|HOLD1
   dta HOLD2|HOLD1
   dta D32|D51
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|SIL1
   dta A22|F551
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|SIL1
   dta D32|A51
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|SIL1
   dta A22|A51
   dta HOLD2|A51
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta C32|G51
   dta HOLD2|G51
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta G32|G51
   dta HOLD2|HOLD1
   dta E32|G51
   dta HOLD2|HOLD1
   dta G22|E51
   dta HOLD2|D51
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta H22|SIL1
   dta HOLD2|H41
   dta C32|C51
   dta HOLD2|HOLD1
   dta D32|D51
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|SIL1
   dta A22|F551
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|SIL1
   dta D32|A51
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|SIL1
   dta A22|HOLD1
   dta HOLD2|F551
   dta DRM2|F551
   dta HOLD2|HOLD1
   dta C32|G51
   dta HOLD2|HOLD1
   dta A32|HOLD1
   dta HOLD2|SIL1
   dta G32|G51
   dta HOLD2|HOLD1
   dta E32|HOLD1
   dta HOLD2|HOLD1
   dta G22|E51
   dta HOLD2|HOLD1
   dta DRM2|D51
   dta HOLD2|HOLD1
   dta C32|SIL1
   dta HOLD2|H41
   dta D32|H41
   dta HOLD2|SIL1
   dta G32|G41
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|SIL1
   dta D32|H41
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|SIL1
   dta G32|D51
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta D32|SIL1
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta G22|HOLD1
   dta HOLD2|HOLD1
   dta DRM2|H41
   dta HOLD2|HOLD1
   dta D32|C51
   dta HOLD2|HOLD1
   dta DRM2|A41
   dta HOLD2|HOLD1
   dta G32|H41
   dta HOLD2|HOLD1
   dta DRM2|D51
   dta HOLD2|HOLD1
   dta D32|HOLD1
   dta HOLD2|HOLD1
   dta DRM2|SIL1
   dta HOLD2|HOLD1
   dta G32|HOLD1
   dta HOLD2|HOLD1
   dta DRM2|G41
   dta HOLD2|HOLD1
   dta D32|A41
   dta HOLD2|HOLD1
   dta DRM2|F451
   dta HOLD2|HOLD1
   dta G32|G41
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta D32|SIL1
   dta HOLD2|HOLD1
   dta DRM2|HOLD1
   dta HOLD2|HOLD1
   dta G32|HOLD1
   dta HOLD2|HOLD1
   dta D32|HOLD1
   dta HOLD2|HOLD1
   dta E32|HOLD1
   dta HOLD2|HOLD1
   dta F352|HOLD1
   dta HOLD2|HOLD1

:$FB00-* DTA $FF

SixDigit

; Display player scores
                    LDA #BROWNFRAME
                    STA COLUPF
                    LDA #$80
                    STA PF1
                    LDA bcdScore1       ; load low/high values of states
                    LSR @                 ; select higher nibble...
                    LSR @                 ; ...of status value (bcd!)
                    LSR @                 ; (numbers 0-9)
                    LSR @                 ;
                    TAX                 ; X-> shape of value
                    LDA digittab,X      ; Load pointer to desired value
                    STA obstaclePtr00   ; Store sprite pointer
                    LDA bcdScore1       ; load low/high values of states
                    AND #$0F            ; select lower nibble
                    TAX                 ; X-> shape of value
                    LDA digittab,X      ; Load pointer to desired value
                    STA obstaclePtr01   ; Store sprite pointer

                    LDA bcdScore2       ; load low/high values of states
                    LSR @                 ; select higher nibble...
                    LSR @                 ; ...of status value (bcd!)
                    LSR @                 ; (numbers 0-9)
                    LSR @                 ;
                    TAX                 ; X-> shape of value
                    LDA digittab,X      ; Load pointer to desired value
                    STA movementBuffer  ; Store sprite pointer
                    LDA bcdScore2       ; load low/high values of states
                    AND #$0F            ; select lower nibble
                    TAX                 ; X-> shape of value
                    LDA digittab,X      ; Load pointer to desired value
                    STA tempVar1        ; Store sprite pointer

; Display Level Icon

                    LDA levelNumber
                    LSR @
                    LSR @
                    LSR @
                    AND #$03
                    TAX
                    LDA leveltab,X
                    STA obstaclePtr02

; Display Ki/Human Symbol

                    LDX #<human
                    LDA SWCHB
                    ASL @
                    BCS NoKi
                    LDX #<ki
NoKi
                    STX horPosM0

                    LDX #$0D            ; 7 lines to draw
                    LDY #$06
NextDigitLine       STA WSYNC
                    STY COLUP0
                    STY COLUP1
                    LDA (tempVar1),Y         ;
                    STA tempVar3
                    LDA (obstaclePtr00),Y         ;
                    STA GRP0            ;
                    LDA (obstaclePtr01),Y         ;
                    STA GRP1            ;
                    LDA (obstaclePtr02),Y         ;
                    STA GRP0            ;
                    LDA (horPosM0),Y         ;
                    STA GRP1            ;
                    LDA (movementBuffer),Y         ;
                    STA GRP0            ;
                    LDA tempVar3         ;
                    STA GRP1            ;
                    DEX
                    TXA
                    LSR @
                    TAY
                    TXA
                    BPL NextDigitLine   ; (64)N: Draw next line

                    LDY #$01
                    INX
                    STX HMCLR           ; !!!!!!!!!!!!
RestoreAfterDigit   STX GRP0,Y            ;
                    STX NUSIZ0,Y          ;
                    LDA reflectBuffer,Y
                    STA REFP0,Y
                    DEY
                    BPL RestoreAfterDigit

; Adjust pointers
                    LDA levelNumber     ;
                    AND #$07
                    ASL @
                    TAX
                    LDA levelNumber     ;
                    AND #$02            ;
                    BEQ P2Shootable     ; Point to RAM!
                    CLC
                    LDA postab1,X
                    SBC verPosPF
                    ADC obstacleSize
                    STA obstaclePtr00
                    LDA postab1+1,X
                    STA obstaclePtr00+1
                    LDA postab2,X
                    SBC verPosPF
                    ADC obstacleSize
                    STA obstaclePtr01
                    LDA postab2+1,X
                    STA obstaclePtr01+1
                    JMP ColPointer
P2Shootable
                    LDA #<obstacleData00
                    SBC verPosPF
                    ADC obstacleSize
                    STA obstaclePtr00
                    LDA #>obstacleData00
                    STA obstaclePtr00+1
                    LDA #<obstacleData01
                    SBC verPosPF
                    ADC obstacleSize
                    STA obstaclePtr01
                    LDA #>obstacleData01
                    STA obstaclePtr01+1
ColPointer
                    STA WSYNC
                    STY PF1
                    STY PF2
                    LDA coltab,X
                    SBC verPosPF
                    ADC obstacleSize
                    STA obstaclePtr02
                    LDA coltab+1,X
                    STA obstaclePtr02+1
                    LDX #$01
PosAnother          LDA horPosP0,X
                    JSR PosPlayer1
                    DEX
                    BPL PosAnother
                    STA WSYNC
                    LDX #$0E
HMOVEDelay          DEX
                    BNE HMOVEDelay
                    STA HMOVE           ; Do it on cycle 74!!!
                    STX PF0
                    STX PF1
                    STX PF2
                    LDX #$01
                    LDX #SCREENSTART    ; Init display Kernel
                    RTS

Disintegrate
                    LDA levelNumber
                    AND #$02
                    BNE DeleteBullet
                    LDA bulletVerPos,X
                    LSR @
                    SEC
                    SBC verPosPF
                    CLC
                    ADC #$10
                    CMP #$10
                    BNE CorrectYHitPos
                    SEC
                    SBC #$01
CorrectYHitPos
                    TAY
                    LDA bulletHorPos,X
                    SEC
                    SBC #$02
                    LSR @
                    LSR @
                    SEC
                    SBC #$0C
                    CMP #$08
                    BPL DisintiPF1
                    EOR #$07    ; reverse order!
                    TAX
                    JMP DisintegrateIt
DisintiPF1
                    SEC
                    SBC #$08
                    TAX
                    TYA
                    CLC
                    ADC #$10
                    TAY
DisintegrateIt
                    LDA disintigratetab,X
                    EOR #$FF
                    AND obstacleData00,Y
                    BNE ErasePoint1
                    DEY
ErasePoint1
GoOn                LDA disintigratetab,X
                    EOR #$FF
                    AND obstacleData00,Y
                    BNE GoAhead
                    RTS
GoAhead
                    LDA obstacleData00,Y
                    AND disintigratetab,X
                    STA obstacleData00,Y

DeleteBullet
                    LDX tempVar2
                    LDA #$FF
                    STA bulletVerPos,X
                    STA bulletData,X
                    LDA levelNumber
                    AND #$1A
                    CMP #$18
                    BEQ IncTargetScore
                    RTS
IncTargetScore
                    LDA tempVar2
                    LSR @
                    EOR #$01
                    TAX
                    SED
                    LDA bcdScore2,X
                    CLC
                    ADC #$01
                    STA bcdScore2,X
                    TAY
                    CLD
                    LDA levelNumber
                    AND #%00010000
                    BNE Mode2or3
                    TYA
                    CMP #$07
                    BEQ GameOver2
                    RTS
Mode2or3
                    LDA levelNumber
                    AND #%00001000
                    CMP #%00000000
                    BEQ GameOver2

                    LDA gameState
                    AND #$06
                    BEQ NotDeath
                    TYA
                    SED
                    CLC
                    ADC #$04
                    CLD
                    TAY
NotDeath
                    TYA
                    CMP #MAXSCORE
                    BCC TargetNotDone
                    LDA #MAXSCORE
TargetNotDone
                    STA bcdScore2,X
                    CMP #MAXSCORE
                    BEQ GameOver2
                    RTS
GameOver2
                    LDA #%10000010
                    CPX #$00
                    BEQ OtherPlayer
                    LDA #%10000100
OtherPlayer
                    ORA gameState
                    STA gameState
                    LDY #$FF
                    STY animCounter
                    INY
                    STY audioVolume
                    RTS

arrowdata2
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
arrowdata1
        dta %00000101
        dta %00000010
        dta %00000010
        dta %00000010
        dta %00000010
        dta %00000111
        dta %00000010
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %10100000
        dta %01000000
        dta %01000000
        dta %01000000
        dta %01000000
        dta %11100000
        dta %01000000

arrowcolor
        dta $00
        dta BROWNCOWBOY2
        dta BROWNCOWBOY1
        dta BROWNFRAME
        dta BROWNARROW
        dta $04
        dta $06
        dta $00
        dta BROWNCOWBOY2
        dta BROWNCOWBOY1
        dta BROWNFRAME
        dta BROWNARROW
        dta $04
        dta $06
        dta $00 ; DummyValue!
        dta $00
        dta BROWNCOWBOY2
        dta BROWNCOWBOY1
        dta BROWNFRAME
        dta BROWNARROW
        dta $04
        dta $06

highfreq
   dta 23
   dta 00
   dta 17
   dta 00
   dta 15
   dta 00
   dta 13
   dta 00
   dta 17
   dta 00
   dta 12
   dta 00
   dta 13
   dta 00
   dta 15
   dta 00
   dta 17
   dta 00
   dta 00
   dta 00
   dta 00
   dta $FF

goodfreq
   dta 11
   dta $08
   dta 11
   dta $08
   dta 11
   dta 00
   dta 00
   dta 00
   dta 00
   dta 00
   dta 00
   dta 00
   dta 14
   dta 00
   dta 00
   dta 00
   dta 12
   dta 00
   dta 00
   dta 00
   dta 17
   dta 00
   dta 00
   dta 00
   dta 00
   dta 00
   dta 00
   dta 00
   dta 00
   dta $FF

cactidata1
        dta %11100000
        dta %11000011
        dta %10000000
        dta %10000000
        dta %10000000
        dta %10000000
        dta %10000000
        dta %11100100
        dta %10100100
        dta %10000100
        dta %10000100
        dta %00000111
        dta %00011101
        dta %00010101
        dta %00000001
        dta %00000001

cactidata2
        dta %10000001
        dta %00000010
        dta %00000000
        dta %00000100
        dta %00000100
        dta %00000100
        dta %11000100
        dta %01000100
        dta %01000100
        dta %00000111
        dta %00011101
        dta %00010101
        dta %00000101
        dta %00000001
        dta %00000000
        dta %00000000

cacticolor
        dta $02
        dta $02
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta REDCACTI
        dta REDCACTI

ruincolor
        dta GREYSTONE
        dta GREYSTONE
        dta GREYSTONE

voice2freqtab
    dta 00   ; Dummy
    dta 07   ;
    dta 18   ;
    dta 20   ;
    dta 10   ;
    dta 24   ;
    dta 13   ;
    dta 31   ;
    dta 15   ;
    dta 17   ;
    dta 20   ;

        dta GREYSTONE
        dta GREYSTONE
        dta GREYSTONE

voice2disttab
    dta 00   ; Dummy
    dta $08  ;
    dta 01   ;
    dta 01   ;
    dta 07   ;
    dta 01   ;
    dta 07   ;
    dta 01   ;
    dta 07   ;
    dta 07   ;
    dta 07   ;

        dta GREYSTONE
        dta GREYSTONE
        dta GREYSTONE

salondata1
salondata2
        dta %11111111
        dta %11111111
        dta %00111110
        dta %01111110
        dta %01111110
        dta %01111110
        dta %00111110
        dta %11111110
        dta %11111110
        dta %01100110
        dta %01100110
        dta %01100110
        dta %11111111
        dta %11111111
        dta %11111000
        dta %11100000

ruindata1
ruindata2
        dta %10000000
        dta %10000000
        dta %10000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %10000000
        dta %10000000
        dta %10000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %10000000
        dta %10000000
        dta %10000000

treedata1
treedata2
        dta %01000000
        dta %01000000
        dta %01000000
        dta %01110000
        dta %01010000
        dta %01010000
        dta %01000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000000
        dta %00000001
        dta %00000001
        dta %00000001
        dta %00000111
        dta %00000101
        dta %00000101
        dta %00000001

postab  dta $00,$1E,$00,$25,$00,$1E,$00,$2A

sizetab dta $10,$10,$16,$1F,$10,$10,$16,$29

postab1 dta <xypedata1
        dta >xypedata1    
        dta <cactidata1  
        dta >cactidata1
        dta <arrowdata1  
        dta >arrowdata1
        dta <ruindata1   
        dta >ruindata1
        dta <coachdata1  
        dta >coachdata1
        dta <salondata1  
        dta >salondata1
        dta <arrowdata2  
        dta >arrowdata2
        dta <treedata1   
        dta >treedata1

postab2 dta <xypedata2   
        dta >xypedata2
        dta <cactidata2  
        dta >cactidata2
        dta <arrowdata2  
        dta >arrowdata2
        dta <ruindata2   
        dta >ruindata2
        dta <coachdata2  
        dta >coachdata2
        dta <salondata2  
        dta >salondata2
        dta <arrowdata1  
        dta >arrowdata1
        dta <treedata2   
        dta >treedata2

coltab  dta <xypecolor   
        dta >xypecolor
        dta <cacticolor  
        dta >cacticolor
        dta <arrowcolor  
        dta >arrowcolor
        dta <ruincolor   
        dta >ruincolor
        dta <coachcolor  
        dta >coachcolor
        dta <saloncolor  
        dta >saloncolor
        dta <arrowcolor  
        dta >arrowcolor
        dta <treecolor   
        dta >treecolor

voice1disttab
    dta 00   ; Dummy
    dta 04   ;
    dta 04   ;
    dta 04   ;
    dta 04   ;
    dta 04   ;
    dta 04   ;
    dta 04   ;
    dta 04   ;
    dta 04   ;
    dta 04   ;
    dta 04   ;
    dta 04   ;
    dta 12   ;
    dta 12   ;
    dta 12   ;

voice1freqtab
    dta 00   ; Dummy
    dta 00   ;
    dta 11   ;
    dta 12   ;
    dta 14   ;
    dta 15   ;
    dta 17   ;
    dta 19   ;
    dta 20   ;
    dta 23   ;
    dta 26   ;
    dta 29   ;
    dta 31   ;
    dta 11   ;
    dta 12   ;
    dta 13   ;

disintigratetab
    dta %01111111
    dta %10111111
    dta %11011111
    dta %11101111
    dta %11110111
    dta %11111011
    dta %11111101
    dta %11111110

aimovetab
    dta %00001110
    dta %00001101
    dta %00001011
    dta %00001010
    dta %00001001
    dta %00000111
    dta %00000110
    dta %00000101

:$FEF8-* DTA $FF

digittab dta <zero,<one,<two,<three,<four
         dta <five,<six,<seven,<eight,<nine,<lost,<victory

zero
       dta $3C ; ..xxxx..
       dta $66 ; .xx..xx.
       dta $66 ; .xx..xx.
       dta $66 ; .xx..xx.
       dta $66 ; .xx..xx.
       dta $66 ; .xx..xx.
       dta $3C ; ..xxxx..

one
       dta $3C ; ..xxxx..
       dta $18 ; ...xx...
       dta $18 ; ...xx...
       dta $18 ; ...xx...
       dta $18 ; ...xx...
       dta $38 ; ..xxx...
       dta $18 ; ...xx...

two
       dta $7E ; .xxxxxx.
       dta $60 ; .xx.....
       dta $60 ; .xx.....
       dta $3C ; ..xxxx..
       dta $06 ; .....xx.
       dta $46 ; .x...xx.
       dta $3C ; ..xxxx..

three
       dta $3C ; ..xxxx..
       dta $46 ; .x...xx.
       dta $06 ; .....xx.
       dta $0C ; ....xx..
       dta $06 ; .....xx.
       dta $46 ; .x...xx.
       dta $3C ; ..xxxx..

four
       dta $0C ; ....xx..
       dta $0C ; ....xx..
       dta $7E ; .xxxxxx.
       dta $4C ; .x..xx..
       dta $2C ; ..x.xx..
       dta $1C ; ...xxx..
       dta $0C ; ....xx..

five
       dta $7C ; .xxxxx..
       dta $46 ; .x...xx.
       dta $06 ; .....xx.
       dta $7C ; .xxxxx..
       dta $60 ; .xx.....
       dta $60 ; .xx.....
       dta $7E ; .xxxxxx.

six
       dta $3C ; ..xxxx..
       dta $66 ; .xx..xx.
       dta $66 ; .xx..xx.
       dta $7C ; .xxxxx..
       dta $60 ; .xx.....
       dta $62 ; .xx...x.
       dta $3C ; ..xxxx..

seven
       dta $18 ; ...xx...
       dta $18 ; ...xx...
       dta $18 ; ...xx...
       dta $0C ; ....xx..
       dta $06 ; .....xx.
       dta $42 ; .x....x.
       dta $7E ; .xxxxxx.

eight
       dta $3C ; ..xxxx..
       dta $66 ; .xx..xx.
       dta $66 ; .xx..xx.
       dta $3C ; ..xxxx..
       dta $66 ; .xx..xx.
       dta $66 ; .xx..xx.
       dta $3C ; ..xxxx..

nine
       dta $3C ; ..xxxx..
       dta $46 ; .x...xx.
       dta $06 ; .....xx.
       dta $3E ; ..xxxxx.
       dta $66 ; .xx..xx.
       dta $66 ; .xx..xx.
       dta $3C ; ..xxxx..

lost
       dta %00011100
       dta %00010100
       dta %01111111
       dta %01101011
       dta %01101011
       dta %01111111
       dta %00111110

victory
        dta %00000000
        dta %00100010
        dta %00110110
        dta %00111110
        dta %01111111
        dta %00011100
        dta %00001000

ki
       dta %01001001
       dta %00101010
       dta %00101010
       dta %00101010
       dta %00010100
       dta %00010100
       dta %00010100

human
       dta %01111111
       dta %01111111
       dta %00001010
       dta %00001000
       dta %00011100
       dta %00011100
       dta %00000000

normal

       dta %00000011
       dta %00000110
       dta %01111101
       dta %00000000
       dta %11000000
       dta %01100000
       dta %10111110


sixshoot
       dta %00101010
       dta %00101010
       dta %00101010
       dta %00000000
       dta %00101010
       dta %00101010
       dta %00101010

escape
       dta %00000000
       dta %00000100
       dta %01111110
       dta %01111111
       dta %01111110
       dta %00000100
       dta %00000000

xypedata1
        dta %11101110
        dta %10100010
        dta %10101110
        dta %10101000
        dta %11101110
        dta %00000000
        dta %00000000
        dta %11111111
        dta %11111111
        dta %00000000
        dta %00000000
        dta %00100101
        dta %00100101
        dta %00100010
        dta %01010101
        dta %01010101

xypedata2
        dta %01110100
        dta %01010100
        dta %01010100
        dta %01010100
        dta %01110100
        dta %00000000
        dta %00000000
        dta %11111110
        dta %11111110
        dta %00000000
        dta %00000000
        dta %10001110
        dta %10001000
        dta %11101100
        dta %10101000
        dta %11101110

xypecolor
        dta BROWNCOWBOY1
        dta BROWNFRAME
        dta BROWNARROW
        dta BROWNFRAME
        dta BROWNCOWBOY1

; Still xypecolor

rightrestriction
    dta $32,$A2

        dta $00
        dta $00

leftrestriction
    dta $08,$78

; Rest of xypecolor

        dta BROWNCOWBOY1
        dta BROWNFRAME
        dta BROWNARROW
        dta BROWNFRAME
        dta BROWNCOWBOY1

coachdata1
coachdata2
        dta %00001000
        dta %00001000
        dta %00001000
        dta %11111100
        dta %11101000
        dta %11101000
        dta %11101000
        dta %11110000
        dta %11110000
        dta %11110000
        dta %11110000
        dta %11110000
        dta %11110000
        dta %11110000
        dta %11100000
        dta %11000000

treecolor
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI

;Still treecolor!

score
       dta %00011100
       dta %00100010
       dta %01000001
       dta %01001001
       dta %01000001
       dta %00100010
       dta %00011100

leveltab dta <normal,<sixshoot,<escape,<score

coachcolor
        dta BROWNFRAME
        dta BROWNCOWBOY1
        dta BROWNCOWBOY2
        dta $00
        dta BROWNCOWBOY2
        dta BROWNCOWBOY1
        dta BROWNFRAME
        dta $00
        dta $00
        dta $00
        dta $00
        dta $00
        dta $00
        dta $00
        dta $00
        dta $00

; Rest Of Treecolor ...

        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI
        dta GREENCACTI

saloncolor
        dta BROWNCOWBOY2
        dta BROWNCOWBOY1
        dta GREYSTONE
        dta GREYSTONE
        dta GREYSTONE
        dta GREYSTONE
        dta GREYSTONE
        dta GREYSTONE
        dta GREYSTONE
        dta GREYSTONE
        dta GREYSTONE
        dta GREYSTONE
        dta BROWNCOWBOY1
        dta BROWNCOWBOY1
        dta GREYSTONE
        dta GREYSTONE

:$FFFC-* DTA $FF
        dta <start   
        dta >start
        
menwithouthats
    dta %00111000
    dta %00000000