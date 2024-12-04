; tasm -65 -b -fff guntasm.s gunfight.bin

#INCLUDE "VCSTASM.H"

; Compile switches

#DEFINE NTSC
;#DEFINE PAL

; Macros
#DEFINE  LO(x)    (x & 255)
#DEFINE  HI(x)    (x >> 8)
#DEFINE  STAW(x)  ($8D, x, $00)

; Position =ates

SCREENSTART = $54
UP          = SCREENSTART
DOWN        = $04
LEFT        = $02
RIGHT       = $A0
SCOREOFFSET = $31
MAXSCORE    = $42

; Color values

#IFDEF NTSC

GREYSTONE       = $04
YELLOWBACK      = $1C
REDCACTI        = $30
PURPLEFACE      = $3C
GREENCACTI      = $D4
GREENCOWBOY1    = $E4
GREENCOWBOY2    = $E2
GREENCOWBOY3    = $E0
BROWNFRAME      = $F4
BROWNCOWBOY1    = $F2
BROWNCOWBOY2    = $F0
BROWNARROW      = $F6

#ELSE IF PAL

GREYSTONE       = $08
YELLOWBACK      = $28
REDCACTI        = $62
PURPLEFACE      = $48
GREENCACTI      = $52
GREENCOWBOY1    = $32
GREENCOWBOY2    = $30
GREENCOWBOY3    = $00
BROWNFRAME      = $22
BROWNCOWBOY1    = $20
BROWNCOWBOY2    = $00
BROWNARROW      = $24

#ENDIF

#define horPosP0            $80 ; Horizontal position player 0
#define horPosP1            $81 ; Horizontal position player 1
#define horPosM0            $82 ; Horizontal position missile 0
#define horPosM1            $83 ; Horizontal position missile 1
#define verPosP0            $84 ; Vertical position player 0
#define verPosP1            $85 ; Vertical position player 1
#define verPosM0            $86 ; Vertical position missile 0
#define verPosM1            $87 ; Vertical position missile 1
#define verPosBL            $88 ; Vertical position ball
#define verPosPF            $89 ; Vertical position obstacle
#define obstacleSize        $8A ; Size of the obstacle
#define frameCounter        $8B ;
#define bcdscore2           $8C ; Player 2 score --- Dont swap!!! ---
#define bcdscore1           $8D ; Player 1 score --- Dont swap!!! ---
#define bcdGameTimer        $8E ; Game Timer
#define switchesRead        $8F ; stores the values of the switches 
#define levelNumber         $90 ; number of current level
#define soundCount          $91 ; current note to be played
#define decayCount          $92 ; note decay
#define gameState           $93 ; OVER1/OVER2/X/X/X/DEATH1/DEATH2/MUSIC
#define aiCounter           $94 ; counter for AI movement duration
#define aiValue1            $95 ; FF in two-player, FX in AI mode
#define aiValue2            $96 ; FF in two-player, FX in AI mode
#define gunState            $97 ; BulletCount / FireDelay
#define rnd                 $99 ; Random #
#define verMunPos           $9B ; Vertical positions of the munboxes
#define horMunPos           $9D ; Horizontal positions of the munboxes
#define reflectBuffer       $9F ; Buffers the reflect state
#define hairBuffer          $A1 ; Buffer player haircolor permanent
#define animCounter         $A3 ; Simple frameCounters, one for each player
#define movementBuffer      $A5 ; backup the Joystick readings for each player
#define playerShapePtr00    $A7 ; Pointer to current player 0 shape in the ROM
#define playerShapePtr01    $A9 ; Pointer to current player 1 shape in the ROM
#define obstaclePtr00       $AB ; pointer to left obstacleData
#define obstaclePtr01       $AD ; pointer to right obstacleData
#define obstaclePtr02       $AF ; pointer to obstacleColor
#define colorShapePtr00     $B1 ; pointer to Player 0 colors
#define colorShapePtr01     $B3 ; pointer to Player 1 colors
#define bulletHorPos        $B5 ; X Coordinates of the bullets
#define bulletVerPos        $B9 ; Y Coordinates of the bullets
#define bulletData          $BD ; Direction & other Data of the bullets
#define playerShape00       $C1 ; Player 0 shape complete in the RAM
#define playerShape01       $CC ; Player 1 shape complete in the RAM
#define obstacleData00      $D7 ; Left obstacle side
#define obstacleData01      $E7 ; Right obstacle side
#define tempVar1            $F7 ;
#define tempVar2            $F8 ;
#define tempVar3            $F9 ;
#define audioFreq           $FA ; Current fr=ency of voice
#define audioVolume         $FB ;

.ORG $F000
                    
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
.byte               STAW(COLUP0)
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
                    LSR A
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
.byte               STAW(COLUPF)
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

#IFDEF PAL
                    LDA #$40            ;
                    STA TIM64T          ; Init timer
                    JSR Random          ; Seed the random values...
#ELSE IF NTSC
                    JSR Random          ; Seed the random values...
                    LDA #$23            ;
                    STA TIM64T          ; Init timer
#ENDIF

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
                    LDY #LO(death2)
                    LDA animCounter
                    BPL AnimDone
                    LSR A
                    LSR A
                    LSR A
                    LSR A
                    AND #$07
                    CLC
                    ADC #LO(death2)
                    TAY
                    JMP AnimDone
NoGameOver
                    JSR PlayHigh
                    LDY #LO(death1)
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
                    LDA #LO(deathcolor)
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
                    LDA #LO(deathcolor)
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
                    STA bcdscore1
                    LDA tempVar2
                    STA bcdscore2
NoGameOver3
                    JMP OscanEnd

JoyNow
                    JSR joy        ; Read the joysticks.

                    LDA gameState
                    LSR A
                    BCC NoMusicNow
                    JSR PlayCash
                    JMP NoTimer
NoMusicNow
; Do timer in Escape Mode
                    LDA gameState
                    AND #$06
                    BNE NoTimer
                    LDA frameCounter
                    ASL A
                    ASL A
                    BNE NoTimer
                    LDA levelNumber
                    AND #%00011000
                    CMP #%00010000
                    BNE NoTimer
                    SED
                    LDA bcdscore2
                    SEC
                    SBC #$01
                    STA bcdscore2
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
                    ASL A
                    ASL A
                    STA movementBuffer,X
                    INC animCounter,X
                    LDA animCounter,X
                    AND #$18
                    LSR A
                    LSR A
                    LSR A
                    ADC movementBuffer,X
                    TAY
                    TXA
                    ASL A
                    TAX
                    LDA cowboyWalk,Y
                    STA playerShapePtr00,X
                    TXA
                    LSR A
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
                    LSR A 
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
                    ASL A
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
                    ASL A
                    BCS NoKi2
                    LDX #$F0
NewValue
                    JSR Random
                    AND #$07
                    TAY
                    LDA frameCounter
                    LSR A
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
                    INC audioFreq       ; ...and increment the fr=ency
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

                    LDA #(UP-DOWN)/4
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


#IFDEF PAL
                    LDA #$4A            ;
#ELSE IF NTSC
                    LDA #$2B            ;
#ENDIF
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
                    LSR A                 ; Reset?
                    BCS NoReset         ; N: Continue
GameOver                    
                    JSR InitGame          ; Init Game
                    JSR NextObstacle
                    JMP ResetDone
NoReset             
                    LSR A                 ; Select?
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

                    ASL A
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
                    ASL A
                    BCC SlowBullet
                    INY 
SlowBullet                    
                    ROL A
                    BCC DoVertical
                    ROL A
                    JMP SkipVertical
DoVertical          
                    ROL A
                    BCS VertIncrement
                    DEC bulletVerPos,X
                    BCC SkipVertical
VertIncrement
                    INC bulletVerPos,X
SkipVertical        
                    ROL A
                    BCS HorzIncrement
                    DEC bulletHorPos,X
                    BCC Done
HorzIncrement
                    INC bulletHorPos,X
Done                
                    ROR A
                    ROR A
                    ROR A
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
                    LSR A
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
                    ASL A
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
                    LSR A
                    BCS VBLANKDone
                    INC verPosPF
                    LSR A
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
                    LSR A 
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
                    LSR A
                    LSR A
                    LSR A
                    LSR A
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
                    ASL A
                    ASL A
                    ASL A
AutoFireSlow
NoAIFire            AND INPT5
                    BMI BranchShortCut2
                    LDY tempVar2
                    LDA gameState
                    LSR A 
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
                    LSR A
                    TAY
                    BCS UpDone
                    INC verPosP0,X
                    LDA verPosP0,X
                    CMP #SCREENSTART+2
                    BNE UpDone
                    DEC verPosP0,X
                    LDA movementBuffer,X
                    ORA #$01
                    STA movementBuffer,X
UpDone              
                    TYA     
                    LSR A
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
                    LSR A
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
                    LSR A
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
                    ASL A
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
         .byte LO(cbup01),LO(cbup00),LO(cbup01),LO(cbup02)  ; DummyLine
         .byte LO(cbup01),LO(cbup00),LO(cbup01),LO(cbup02)  ; Up
         .byte LO(cbup01),LO(cbup00),LO(cbup01),LO(cbup02)  ; Down
         .byte LO(cbup01),LO(cbup00),LO(cbup01),LO(cbup02)  ; DummyLine
         .byte LO(cblt01),LO(cblt00),LO(cblt01),LO(cblt02)  ; Left
         .byte LO(cblu01),LO(cblu00),LO(cblu01),LO(cblu02)  ; Left-Up
         .byte LO(cbld01),LO(cbld00),LO(cbld01),LO(cbld02)  ; Left-Down
         .byte LO(cbup01),LO(cbup00),LO(cbup01),LO(cbup02)  ; DummyLine
         .byte LO(cblt01),LO(cblt00),LO(cblt01),LO(cblt02)  ; Right
         .byte LO(cblu01),LO(cblu00),LO(cblu01),LO(cblu02)  ; Right-Up
         .byte LO(cbld01),LO(cbld00),LO(cbld01),LO(cbld02)  ; Right-Down

cowboyshoot
         .byte LO(cbup01) ; DummyLine
         .byte LO(cbup01) ; DummyLine
         .byte LO(cbup01) ; DummyLine
         .byte LO(cbup01) ; DummyLine
         .byte LO(cblt03) ; Left
         .byte LO(cblu03) ; Left-Up
         .byte LO(cbld03) ; Left-Down
         .byte LO(cbup01) ; DummyLine
         .byte LO(cblt03) ; Right
         .byte LO(cblu03) ; Right-Up
         .byte LO(cbld03) ; Right-Down

bulletinit
         .byte %00000000 ; DummyBullet
         .byte %00000000 ; DummyBullet
         .byte %00000000 ; DummyBullet
         .byte %00000000 ; DummyBullet
         .byte %01000000 ; Left
         .byte %00100000 ; Left-Up
         .byte %00000000 ; Left-Down
         .byte %00000000 ; DummyBullet
         .byte %01010000 ; Right
         .byte %00110000 ; Right-Up
         .byte %00010000 ; Right-Down

; Init the game after reset/select

InitGame
            LDA gameState
            AND #$7F
            STA gameState

; Reset score
            LDX #$00
            STX bcdscore1
            LDA levelNumber
            AND #%00011000
            CMP #%00010000
            BNE ScoreInitZero
            LDX #$99
ScoreInitZero            
            STX bcdscore2

            LDA gameState
            LSR A
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
            LDA #LO(cbup00)
            sta playerShapePtr00
            sta playerShapePtr01
            LDA #HI(cbup00)
            sta playerShapePtr00+1
            sta playerShapePtr01+1

            LDA #LO(colordata)
            sta colorShapePtr00
            STA hairBuffer
            LDA #HI(colordata)
            sta colorShapePtr00+1

            LDA #LO(colordata2)
            sta colorShapePtr01
            STA hairBuffer+1
            LDA #HI(colordata2)
            sta colorShapePtr01+1

.ORG $F702    ; HOLY CRAP!!!!!!!

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
            LSR A
            LSR A
            LSR A
            LSR A
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
            ASL A
            ASL A
            ASL A
            ASL A
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
        LSR A
        LSR A
        SBC rnd
        LSR A
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
            LSR A
            LSR A
            LSR A
            LSR A
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
            LSR A
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

.ORG $F900

cbup00
    .byte %00001100
    .byte %01101100
    .byte %01101100
    .byte %00111000
    .byte %00111010
    .byte %10111010
    .byte %01111100
    .byte %00010000
    .byte %00111000
    .byte %01111100
    .byte %00111000

cbup01
    .byte %01101100
    .byte %01101100
    .byte %01101100
    .byte %00111000
    .byte %10111010
    .byte %10111010
    .byte %01111100

cbup02
    .byte %01100000
    .byte %01101100
    .byte %01101100
    .byte %00111000
    .byte %10111000
    .byte %10111010
    .byte %01111100

cblt00
    .byte %11000011
    .byte %11000110
    .byte %01101100
    .byte %00111000
    .byte %10111000
    .byte %10111110
    .byte %01111000

cblt01
    .byte %00111100
    .byte %00111000
    .byte %00111000
    .byte %00111000
    .byte %01111000
    .byte %01111000
    .byte %00111000

cblt02
    .byte %11000011
    .byte %11000110
    .byte %01101100
    .byte %00111000
    .byte %01111000
    .byte %00111100
    .byte %00111000

cblt03
    .byte %00111100
    .byte %00111000
    .byte %00111000
    .byte %00111000
    .byte %00111100
    .byte %00111111
    .byte %00111000



cbld00
    .byte %11001100
    .byte %11001110
    .byte %01101100
    .byte %00111000
    .byte %01111000
    .byte %11111000
    .byte %01111000

cbld01
    .byte %01111110
    .byte %01101100
    .byte %01101100
    .byte %00111000
    .byte %10111010
    .byte %11111100
    .byte %01111000

cbld02
    .byte %11001100
    .byte %11001110
    .byte %01101100
    .byte %00111000 
    .byte %10111100
    .byte %10111111
    .byte %01111100

cbld03
    .byte %01111110
    .byte %01101100
    .byte %01101100
    .byte %00111000
    .byte %01111010
    .byte %11111100
    .byte %01111000


cblu00
    .byte %11001100
    .byte %11001110
    .byte %01101100
    .byte %00111000
    .byte %00111000
    .byte %01111100
    .byte %01111100

cblu01
    .byte %01111110
    .byte %01101100
    .byte %01101100
    .byte %00111000
    .byte %11111001
    .byte %11111110
    .byte %01111100

cblu02
    .byte %11001100
    .byte %11001110
    .byte %01101100
    .byte %00111000
    .byte %10111000
    .byte %11111110
    .byte %01111100

cblu03
    .byte %01111110
    .byte %01101100
    .byte %01101100
    .byte %00111000
    .byte %10111000
    .byte %01111110
    .byte %01111101

death1
        .byte %11000110
        .byte %11101110
        .byte %01111100
        .byte %00111000
        .byte %01111100
        .byte %00111000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000

death2
        .byte %11111110
        .byte %10000010
        .byte %10010010
        .byte %10010010
        .byte %10111010
        .byte %10010010
        .byte %01000100
        .byte %00111000

deathcolor
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000

colordata
        .byte BROWNFRAME
        .byte BROWNCOWBOY1
        .byte BROWNCOWBOY1
        .byte BROWNCOWBOY2
        .byte $00
        .byte $00
        .byte $00
        .byte PURPLEFACE
        .byte PURPLEFACE
        .byte BROWNCOWBOY1
        .byte BROWNFRAME

colordata2
        .byte GREENCOWBOY1
        .byte GREENCOWBOY2
        .byte GREENCOWBOY2
        .byte GREENCOWBOY3
        .byte $00
        .byte $00
        .byte $00
        .byte PURPLEFACE
        .byte PURPLEFACE
        .byte $00
        .byte $00

colordata3
        .byte BROWNFRAME
        .byte BROWNCOWBOY1
        .byte BROWNCOWBOY1
        .byte BROWNCOWBOY2
        .byte $00
        .byte $00
        .byte $00
        .byte PURPLEFACE
        .byte BROWNCOWBOY1
        .byte BROWNCOWBOY1
        .byte BROWNFRAME

colordata4
        .byte GREENCOWBOY1
        .byte GREENCOWBOY2
        .byte GREENCOWBOY2
        .byte GREENCOWBOY3
        .byte $00
        .byte $00
        .byte $00
        .byte PURPLEFACE
        .byte $00
        .byte $00
        .byte $00

frontcolor  .byte LO(colordata),LO(colordata2)
backcolor   .byte LO(colordata3),LO(colordata4)

;Sound =ates for 16 different states/notes voice 1

HOLD1       = $00   ; Hold last note
SIL1        = $01   ; Silencium please

E61         = $02   ; note E6 
D61         = $03   ; note D6 
C61         = $04   ; note C6 
                            
H51         = $05   ; note H5 
A51         = $06   ; note A5 

G51         = $07   ; note G5 
F551        = $08   ; note F#5
E51         = $09   ; note E5 
D51         = $0A   ; note D5 
C51         = $0B   ; note C5 

H41         = $0C   ; note H4 
A41         = $0D   ; note A4 
G41         = $0E   ; note G4 
F451        = $0F   ; note F#4

;Sound =ates for 10 different states/notes voice 2

HOLD2       = $00   ; Hold last note
DRM2        = $10   ; Base Drum :-)
A32         = $20   ; note A3
G32         = $30   ; note G3 
F352        = $40   ; note F#3
E32         = $50   ; note E3
D32         = $60   ; note D3 
C32         = $70   ; note C3 

H22         = $80   ; note H2
A22         = $90   ; note A2
G22         = $A0   ; note G2

; fr=ency & distortion tabs - notes see above!

soundfreq

   .byte G32   | D61
   .byte HOLD2 | SIL1
   .byte DRM2  | D61
   .byte HOLD2 | D61
   .byte G32   | SIL1
   .byte HOLD2 | D61
   .byte DRM2  | D61
   .byte HOLD2 | HOLD1
   .byte C32   | E61
   .byte HOLD2 | HOLD1
   .byte DRM2  | C61
   .byte HOLD2 | HOLD1
   .byte G32   | D61
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte D32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte G32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte D32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte G32   | H51
   .byte HOLD2 | SIL1
   .byte DRM2  | H51
   .byte HOLD2 | H51
   .byte D32   | SIL1
   .byte HOLD2 | H51
   .byte DRM2  | H51
   .byte HOLD2 | HOLD1
   .byte D32   | C61
   .byte HOLD2 | HOLD1
   .byte DRM2  | A51
   .byte HOLD2 | HOLD1
   .byte G32   | H51
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte D32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte G32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte D32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte E32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte G32   | SIL1
   .byte HOLD2 | HOLD1
   .byte D32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte E32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte F352  | HOLD1
   .byte HOLD2 | HOLD1
   .byte G32   | D51
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte D32   | SIL1
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte G32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte DRM2  | D51
   .byte HOLD2 | HOLD1
   .byte C32   | E51
   .byte HOLD2 | HOLD1
   .byte DRM2  | C51
   .byte HOLD2 | HOLD1
   .byte G32   | D51
   .byte HOLD2 | HOLD1
   .byte DRM2  | D61
   .byte HOLD2 | D61
   .byte D32   | SIL1
   .byte HOLD2 | D61
   .byte DRM2  | D61
   .byte HOLD2 | HOLD1
   .byte C32   | E61
   .byte HOLD2 | HOLD1
   .byte DRM2  | C61
   .byte HOLD2 | HOLD1
   .byte G32   | D61
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte D32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte G32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte D32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte G32   | H41
   .byte HOLD2 | HOLD1
   .byte DRM2  | H41
   .byte HOLD2 | H41
   .byte D32   | HOLD1
   .byte HOLD2 | SIL1
   .byte DRM2  | H41
   .byte HOLD2 | H41
   .byte D32   | A41
   .byte HOLD2 | HOLD1
   .byte DRM2  | F451
   .byte HOLD2 | HOLD1
   .byte G32   | G41
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte D32   | SIL1
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte G32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte H22   | HOLD1
   .byte HOLD2 | HOLD1
   .byte C32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte D32   | D51
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | SIL1
   .byte A22   | F551
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | SIL1
   .byte D32   | A51
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | SIL1
   .byte A22   | A51
   .byte HOLD2 | A51
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte C32   | G51
   .byte HOLD2 | G51
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte G32   | G51
   .byte HOLD2 | HOLD1
   .byte E32   | G51
   .byte HOLD2 | HOLD1
   .byte G22   | E51
   .byte HOLD2 | D51
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte H22   | SIL1
   .byte HOLD2 | H41
   .byte C32   | C51
   .byte HOLD2 | HOLD1
   .byte D32   | D51
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | SIL1
   .byte A22   | F551
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | SIL1
   .byte D32   | A51
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | SIL1
   .byte A22   | HOLD1
   .byte HOLD2 | F551
   .byte DRM2  | F551
   .byte HOLD2 | HOLD1
   .byte C32   | G51
   .byte HOLD2 | HOLD1
   .byte A32   | HOLD1
   .byte HOLD2 | SIL1
   .byte G32   | G51
   .byte HOLD2 | HOLD1
   .byte E32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte G22   | E51
   .byte HOLD2 | HOLD1
   .byte DRM2  | D51
   .byte HOLD2 | HOLD1
   .byte C32   | SIL1
   .byte HOLD2 | H41
   .byte D32   | H41
   .byte HOLD2 | SIL1
   .byte G32   | G41
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | SIL1
   .byte D32   | H41
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | SIL1
   .byte G32   | D51
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte D32   | SIL1
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte G22   | HOLD1
   .byte HOLD2 | HOLD1
   .byte DRM2  | H41
   .byte HOLD2 | HOLD1
   .byte D32   | C51
   .byte HOLD2 | HOLD1
   .byte DRM2  | A41
   .byte HOLD2 | HOLD1
   .byte G32   | H41
   .byte HOLD2 | HOLD1
   .byte DRM2  | D51
   .byte HOLD2 | HOLD1
   .byte D32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte DRM2  | SIL1
   .byte HOLD2 | HOLD1
   .byte G32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte DRM2  | G41
   .byte HOLD2 | HOLD1
   .byte D32   | A41
   .byte HOLD2 | HOLD1
   .byte DRM2  | F451
   .byte HOLD2 | HOLD1
   .byte G32   | G41
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte D32   | SIL1
   .byte HOLD2 | HOLD1
   .byte DRM2  | HOLD1
   .byte HOLD2 | HOLD1
   .byte G32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte D32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte E32   | HOLD1
   .byte HOLD2 | HOLD1
   .byte F352  | HOLD1
   .byte HOLD2 | HOLD1

.ORG $FB00

SixDigit

; Display player scores
                    LDA #BROWNFRAME
                    STA COLUPF
                    LDA #$80
                    STA PF1
                    LDA bcdscore1       ; load low/high values of states
                    LSR A                 ; select higher nibble... 
                    LSR A                 ; ...of status value (bcd!)
                    LSR A                 ; (numbers 0-9)
                    LSR A                 ;
                    TAX                 ; X-> shape of value
                    LDA digittab,X      ; Load pointer to desired value
                    STA obstaclePtr00   ; Store sprite pointer
                    LDA bcdscore1       ; load low/high values of states
                    AND #$0F            ; select lower nibble
                    TAX                 ; X-> shape of value
                    LDA digittab,X      ; Load pointer to desired value
                    STA obstaclePtr01   ; Store sprite pointer

                    LDA bcdscore2       ; load low/high values of states
                    LSR A                 ; select higher nibble... 
                    LSR A                 ; ...of status value (bcd!)
                    LSR A                 ; (numbers 0-9)
                    LSR A                 ;
                    TAX                 ; X-> shape of value
                    LDA digittab,X      ; Load pointer to desired value
                    STA movementBuffer  ; Store sprite pointer
                    LDA bcdscore2       ; load low/high values of states
                    AND #$0F            ; select lower nibble
                    TAX                 ; X-> shape of value
                    LDA digittab,X      ; Load pointer to desired value
                    STA tempVar1        ; Store sprite pointer

; Display Level Icon

                    LDA levelNumber
                    LSR A
                    LSR A
                    LSR A
                    AND #$03
                    TAX
                    LDA leveltab,X
                    STA obstaclePtr02

; Display Ki/Human Symbol

                    LDX #LO(human)
                    LDA SWCHB
                    ASL A
                    BCS NoKi
                    LDX #LO(ki)
NoKi
                    STX horPosM0

                    LDX #$0D            ; 7 lines to draw
                    LDY #$06
NextDigitLine:      STA WSYNC
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
                    LSR A
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
                    ASL A
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
                    LDA #LO(obstacleData00)
                    SBC verPosPF
                    ADC obstacleSize
                    STA obstaclePtr00
                    LDA #HI(obstacleData00)
                    STA obstaclePtr00+1
                    LDA #LO(obstacleData01)
                    SBC verPosPF
                    ADC obstacleSize
                    STA obstaclePtr01
                    LDA #HI(obstacleData01)
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
                    LSR A
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
                    LSR A
                    LSR A
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
                    LSR A                    
                    EOR #$01
                    TAX
                    SED
                    LDA bcdscore2,X
                    CLC
                    ADC #$01
                    STA bcdscore2,X
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
                    STA bcdscore2,X
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
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
arrowdata1
        .byte %00000101
        .byte %00000010
        .byte %00000010
        .byte %00000010
        .byte %00000010
        .byte %00000111
        .byte %00000010
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %10100000
        .byte %01000000
        .byte %01000000
        .byte %01000000
        .byte %01000000
        .byte %11100000
        .byte %01000000

arrowcolor
        .byte $00
        .byte BROWNCOWBOY2
        .byte BROWNCOWBOY1
        .byte BROWNFRAME
        .byte BROWNARROW
        .byte $04
        .byte $06
        .byte $00
        .byte BROWNCOWBOY2
        .byte BROWNCOWBOY1
        .byte BROWNFRAME
        .byte BROWNARROW
        .byte $04
        .byte $06
        .byte $00 ; DummyValue!
        .byte $00
        .byte BROWNCOWBOY2
        .byte BROWNCOWBOY1
        .byte BROWNFRAME
        .byte BROWNARROW
        .byte $04
        .byte $06

highfreq
   .byte 23
   .byte 00
   .byte 17
   .byte 00
   .byte 15
   .byte 00
   .byte 13
   .byte 00
   .byte 17
   .byte 00
   .byte 12
   .byte 00
   .byte 13
   .byte 00
   .byte 15
   .byte 00
   .byte 17
   .byte 00
   .byte 00
   .byte 00
   .byte 00
   .byte $FF

goodfreq
   .byte 11
   .byte $08
   .byte 11
   .byte $08
   .byte 11
   .byte 00
   .byte 00
   .byte 00
   .byte 00
   .byte 00
   .byte 00
   .byte 00
   .byte 14
   .byte 00
   .byte 00
   .byte 00
   .byte 12
   .byte 00
   .byte 00
   .byte 00
   .byte 17
   .byte 00
   .byte 00
   .byte 00
   .byte 00
   .byte 00
   .byte 00
   .byte 00
   .byte 00
   .byte $FF

cactidata1
        .byte %11100000
        .byte %11000011
        .byte %10000000
        .byte %10000000
        .byte %10000000
        .byte %10000000
        .byte %10000000
        .byte %11100100
        .byte %10100100
        .byte %10000100
        .byte %10000100
        .byte %00000111
        .byte %00011101
        .byte %00010101
        .byte %00000001
        .byte %00000001

cactidata2
        .byte %10000001
        .byte %00000010
        .byte %00000000
        .byte %00000100
        .byte %00000100
        .byte %00000100
        .byte %11000100
        .byte %01000100
        .byte %01000100
        .byte %00000111
        .byte %00011101
        .byte %00010101
        .byte %00000101
        .byte %00000001
        .byte %00000000
        .byte %00000000
        
cacticolor
        .byte $02
        .byte $02
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte REDCACTI
        .byte REDCACTI

ruincolor
        .byte GREYSTONE
        .byte GREYSTONE
        .byte GREYSTONE

voice2freqtab
    .byte 00   ; Dummy    
    .byte 07   ; 
    .byte 18   ; 
    .byte 20   ; 
    .byte 10   ; 
    .byte 24   ; 
    .byte 13   ; 
    .byte 31   ; 
    .byte 15   ; 
    .byte 17   ; 
    .byte 20   ; 

        .byte GREYSTONE
        .byte GREYSTONE
        .byte GREYSTONE

voice2disttab
    .byte 00   ; Dummy    
    .byte $08  ; 
    .byte 01   ; 
    .byte 01   ; 
    .byte 07   ; 
    .byte 01   ; 
    .byte 07   ; 
    .byte 01   ; 
    .byte 07   ; 
    .byte 07   ; 
    .byte 07   ; 

        .byte GREYSTONE
        .byte GREYSTONE
        .byte GREYSTONE

salondata1
salondata2
        .byte %11111111
        .byte %11111111
        .byte %00111110
        .byte %01111110
        .byte %01111110
        .byte %01111110
        .byte %00111110
        .byte %11111110
        .byte %11111110
        .byte %01100110
        .byte %01100110
        .byte %01100110
        .byte %11111111
        .byte %11111111
        .byte %11111000
        .byte %11100000

ruindata1
ruindata2
        .byte %10000000
        .byte %10000000
        .byte %10000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %10000000
        .byte %10000000
        .byte %10000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %10000000
        .byte %10000000
        .byte %10000000

treedata1
treedata2
        .byte %01000000
        .byte %01000000
        .byte %01000000
        .byte %01110000
        .byte %01010000
        .byte %01010000
        .byte %01000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000000
        .byte %00000001
        .byte %00000001
        .byte %00000001
        .byte %00000111
        .byte %00000101
        .byte %00000101
        .byte %00000001

postab  .byte $00,$1E,$00,$25,$00,$1E,$00,$2A

sizetab .byte $10,$10,$16,$1F,$10,$10,$16,$29

postab1 .word xypedata1
        .word cactidata1
        .word arrowdata1
        .word ruindata1
        .word coachdata1
        .word salondata1
        .word arrowdata2
        .word treedata1

postab2 .word xypedata2
        .word cactidata2
        .word arrowdata2
        .word ruindata2
        .word coachdata2
        .word salondata2
        .word arrowdata1
        .word treedata2

coltab  .word xypecolor
        .word cacticolor
        .word arrowcolor
        .word ruincolor
        .word coachcolor
        .word saloncolor
        .word arrowcolor
        .word treecolor

voice1disttab
    .byte 00   ; Dummy    
    .byte 04   ; 
    .byte 04   ; 
    .byte 04   ; 
    .byte 04   ; 
    .byte 04   ; 
    .byte 04   ; 
    .byte 04   ; 
    .byte 04   ; 
    .byte 04   ; 
    .byte 04   ; 
    .byte 04   ; 
    .byte 04   ; 
    .byte 12   ; 
    .byte 12   ; 
    .byte 12   ; 

voice1freqtab
    .byte 00   ; Dummy    
    .byte 00   ; 
    .byte 11   ; 
    .byte 12   ; 
    .byte 14   ; 
    .byte 15   ; 
    .byte 17   ; 
    .byte 19   ; 
    .byte 20   ; 
    .byte 23   ; 
    .byte 26   ; 
    .byte 29   ; 
    .byte 31   ; 
    .byte 11   ; 
    .byte 12   ; 
    .byte 13   ; 

disintigratetab
    .byte %01111111
    .byte %10111111
    .byte %11011111
    .byte %11101111
    .byte %11110111
    .byte %11111011
    .byte %11111101
    .byte %11111110

aimovetab:
    .byte %00001110
    .byte %00001101
    .byte %00001011
    .byte %00001010
    .byte %00001001
    .byte %00000111
    .byte %00000110
    .byte %00000101

.ORG $FEF8

digittab .byte LO(zero),LO(one),LO(two),LO(three),LO(four)
         .byte LO(five),LO(six),LO(seven),LO(eight),LO(nine),LO(lost),LO(victory)

zero
       .byte $3C ; ..xxxx..
       .byte $66 ; .xx..xx.
       .byte $66 ; .xx..xx.
       .byte $66 ; .xx..xx.
       .byte $66 ; .xx..xx.
       .byte $66 ; .xx..xx.
       .byte $3C ; ..xxxx..

one
       .byte $3C ; ..xxxx..
       .byte $18 ; ...xx...
       .byte $18 ; ...xx...
       .byte $18 ; ...xx...
       .byte $18 ; ...xx...
       .byte $38 ; ..xxx...
       .byte $18 ; ...xx...

two
       .byte $7E ; .xxxxxx.
       .byte $60 ; .xx.....
       .byte $60 ; .xx.....
       .byte $3C ; ..xxxx..
       .byte $06 ; .....xx.
       .byte $46 ; .x...xx.
       .byte $3C ; ..xxxx..

three
       .byte $3C ; ..xxxx..
       .byte $46 ; .x...xx.
       .byte $06 ; .....xx.
       .byte $0C ; ....xx..
       .byte $06 ; .....xx.
       .byte $46 ; .x...xx.
       .byte $3C ; ..xxxx..

four
       .byte $0C ; ....xx..
       .byte $0C ; ....xx..
       .byte $7E ; .xxxxxx.
       .byte $4C ; .x..xx..
       .byte $2C ; ..x.xx..
       .byte $1C ; ...xxx..
       .byte $0C ; ....xx..

five
       .byte $7C ; .xxxxx..
       .byte $46 ; .x...xx.
       .byte $06 ; .....xx.
       .byte $7C ; .xxxxx..
       .byte $60 ; .xx.....
       .byte $60 ; .xx.....
       .byte $7E ; .xxxxxx.

six
       .byte $3C ; ..xxxx..
       .byte $66 ; .xx..xx.
       .byte $66 ; .xx..xx.
       .byte $7C ; .xxxxx..
       .byte $60 ; .xx.....
       .byte $62 ; .xx...x.
       .byte $3C ; ..xxxx..

seven
       .byte $18 ; ...xx...
       .byte $18 ; ...xx...
       .byte $18 ; ...xx...
       .byte $0C ; ....xx..
       .byte $06 ; .....xx.
       .byte $42 ; .x....x.
       .byte $7E ; .xxxxxx.
       
eight
       .byte $3C ; ..xxxx..
       .byte $66 ; .xx..xx.
       .byte $66 ; .xx..xx.
       .byte $3C ; ..xxxx..
       .byte $66 ; .xx..xx.
       .byte $66 ; .xx..xx.
       .byte $3C ; ..xxxx..
       
nine
       .byte $3C ; ..xxxx..
       .byte $46 ; .x...xx.
       .byte $06 ; .....xx.
       .byte $3E ; ..xxxxx.
       .byte $66 ; .xx..xx.
       .byte $66 ; .xx..xx.
       .byte $3C ; ..xxxx..

lost
       .byte %00011100
       .byte %00010100
       .byte %01111111
       .byte %01101011
       .byte %01101011
       .byte %01111111
       .byte %00111110

victory
        .byte %00000000
        .byte %00100010
        .byte %00110110
        .byte %00111110
        .byte %01111111
        .byte %00011100
        .byte %00001000
      
ki
       .byte %01001001
       .byte %00101010
       .byte %00101010
       .byte %00101010
       .byte %00010100
       .byte %00010100
       .byte %00010100

human
       .byte %01111111
       .byte %01111111
       .byte %00001010
       .byte %00001000
       .byte %00011100
       .byte %00011100
       .byte %00000000

normal

       .byte %00000011
       .byte %00000110
       .byte %01111101
       .byte %00000000
       .byte %11000000
       .byte %01100000
       .byte %10111110


sixshoot
       .byte %00101010
       .byte %00101010
       .byte %00101010
       .byte %00000000
       .byte %00101010
       .byte %00101010
       .byte %00101010

escape
       .byte %00000000
       .byte %00000100
       .byte %01111110
       .byte %01111111
       .byte %01111110
       .byte %00000100
       .byte %00000000

xypedata1
        .byte %11101110
        .byte %10100010
        .byte %10101110
        .byte %10101000
        .byte %11101110
        .byte %00000000
        .byte %00000000
        .byte %11111111
        .byte %11111111
        .byte %00000000
        .byte %00000000
        .byte %00100101
        .byte %00100101
        .byte %00100010
        .byte %01010101
        .byte %01010101

xypedata2
        .byte %01110100
        .byte %01010100
        .byte %01010100
        .byte %01010100
        .byte %01110100
        .byte %00000000
        .byte %00000000
        .byte %11111110
        .byte %11111110
        .byte %00000000
        .byte %00000000
        .byte %10001110
        .byte %10001000
        .byte %11101100
        .byte %10101000
        .byte %11101110

xypecolor
        .byte BROWNCOWBOY1
        .byte BROWNFRAME
        .byte BROWNARROW
        .byte BROWNFRAME
        .byte BROWNCOWBOY1

; Still xypecolor

rightrestriction
    .byte $32,$A2

        .byte $00
        .byte $00

leftrestriction
    .byte $08,$78

; Rest of xypecolor

        .byte BROWNCOWBOY1
        .byte BROWNFRAME
        .byte BROWNARROW
        .byte BROWNFRAME
        .byte BROWNCOWBOY1

coachdata1
coachdata2
        .byte %00001000
        .byte %00001000
        .byte %00001000
        .byte %11111100
        .byte %11101000
        .byte %11101000
        .byte %11101000
        .byte %11110000
        .byte %11110000
        .byte %11110000
        .byte %11110000
        .byte %11110000
        .byte %11110000
        .byte %11110000
        .byte %11100000
        .byte %11000000

treecolor
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI

;Still treecolor!

score
       .byte %00011100
       .byte %00100010
       .byte %01000001
       .byte %01001001
       .byte %01000001
       .byte %00100010
       .byte %00011100

leveltab .byte LO(normal),LO(sixshoot),LO(escape),LO(score)

coachcolor
        .byte BROWNFRAME
        .byte BROWNCOWBOY1
        .byte BROWNCOWBOY2
        .byte $00
        .byte BROWNCOWBOY2
        .byte BROWNCOWBOY1
        .byte BROWNFRAME
        .byte $00
        .byte $00
        .byte $00
        .byte $00
        .byte $00
        .byte $00
        .byte $00
        .byte $00
        .byte $00

; Rest Of Treecolor ...

        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI
        .byte GREENCACTI

saloncolor
        .byte BROWNCOWBOY2
        .byte BROWNCOWBOY1
        .byte GREYSTONE
        .byte GREYSTONE
        .byte GREYSTONE
        .byte GREYSTONE
        .byte GREYSTONE
        .byte GREYSTONE
        .byte GREYSTONE
        .byte GREYSTONE
        .byte GREYSTONE
        .byte GREYSTONE
        .byte BROWNCOWBOY1
        .byte BROWNCOWBOY1
        .byte GREYSTONE
        .byte GREYSTONE

.ORG $FFFC
        .word start     

menwithouthats
    .byte %00111000
    .byte %00000000
    
.END