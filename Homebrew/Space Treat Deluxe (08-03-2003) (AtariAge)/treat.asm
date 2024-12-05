
;
;                        ----------------------------
;                              SPACE TREAT DELUXE
;                        (c) 2003 by Fabrizio Zavagli
;                        ----------------------------
;
; v1.0
; Released on: May 21, 2003
;
; Space Treat Deluxe's source code and assembled binaries have been released for
; educational purposes, meaning it cannot be sold without authorization from
; the autor.
;
; Links: http://www.rasty.com and http://www.atariage.com
; Contact information: rasty@rasty.com
;
; Thanks to:
; - Thomas Jentzsch, Manuel Polik, Dennis Debro, Eckhard Stolberg, Andrew 
;   Davie, Paul Slocum and all the people on the Stella List (sorry all others I've 
;   forgotten!)
; - AtariAge
;
; *** Assembling notes ***
;
; 1) Required files:
;    - treat.asm (main file, this one)
;    - vcs.h
;    - macros.h
;    - treat_pal_shapes1.asm
;    - treat_ntsc_shapes1.asm
; 
; 2) You'll want to change the path references to "..\gen\" in treat.asm
;    to wherever you have put the "vcs.h" and "macros.h" files that
;    get included from the source.
;
; 3) Assemble with "dasm treat.asm -f3 -otreat.bin"
;

	processor 6502
	include "..\gen\vcs.h"

	org $F000

YES = 1
NO = 0

; --- Compile Switches ---
PAL_COLORS = NO		; YES = Pal colors - NO = NTSC colors
PAL50 = NO		; YES = Pal50/Pal60 switchable - NO = NTSC
; ------------------------

	IF PAL_COLORS = NO
INTROSPRITES_COLOR = $36
INTROLINES_COLOR = $82
ENEMYLINECOLOR_DEFAULT = $f4
	ELSE	; PAL
INTROSPRITES_COLOR = $46
INTROLINES_COLOR = $d2
ENEMYLINECOLOR_DEFAULT = $22
	ENDIF

MAX_STRIPE = 6
MIN_STRIPE = 1

INTROSPR_SIZE = 16
GAMEOVERSPR_SIZE = 4

TOTAL_STRIPES = 7

INITIAL_STRIPE = 0

PLAYERDELAY_DEFAULT = 2	; 1 = update every frame

PLAYER_INITIALLIVES = 6

PLAYERX_DEFAULT = 80

TOTAL_LEVELS = 99

FUELLEVEL_DEFAULT = 36	; Starting fuel level
FUELDELAY_DEFAULT = 40	; Fuel decrease delay (in frames) - The lower, the faster

	IF PAL_COLORS = NO
FUELCOLOR_OK = $d4
FUELCOLOR_WARNING = $1a
FUELCOLOR_DANGER = $42
	ELSE
FUELCOLOR_OK = $52
FUELCOLOR_WARNING = $28
FUELCOLOR_DANGER = $62
	ENDIF

RAND_SEED = $35		; Initial random seed (right now it's random)

ENEMY_SHAPES_NUMBER = 16
TREATS_NUMBER = 8

LEVELS_EASY = 2		; Easy levels
LEVELS_MEDIUM = 7	; Medium levels (after meduim levels we have the Hard ones)

MISSILE_TOP = 6
MISSILE_HEIGHT = 3

SCORE_1 = 5
SCORE_10 = 4
SCORE_100 = 3
SCORE_1000 = 2
SCORE_10000 = 1
SCORE_100000 = 0

Temp = $80

playerX = $81
plrPos = $82
plrOff = $83
plrStripe = $84
plrAnim = $85
plrAnimOff = $86

enemyShapeLo = $87
enemyShapeHi = $88

MissileStripe = $89	; Missile/key Stripe position (0 = no missile/key)

HiScore = $8a	; 6 bytes (score and hi score are 6 bytes since using BCD would have got too much ROM while RAM was still available...!)

PlayerDelayDefault = $90

PalNtsc = $91	; 0 = NTSC
ScreenStripeY = $92	; Y nella stripe (iniziale: 8)
Stripes = $93	; Numero della stripe corrente (iniziale: MAX_STRIPE)

Joystick0 = $94
OldJoystick0 = $95

enemyDelays = $96	; Array of MAX_STRIPES con i delay di EnemyMoves (uno per Stripe), ci vanno i delay di EnemyMoves
enemyPatterns = $96
enemyPos = $9d	; Array of MAX_STRIPES with enemies' precalculated X reposition values (one per Stripe)
enemyOff = $a4	; Array of MAX_STRIPES with enemies' precalculated hmove values (one per Stripe)
enemyX = $ab	; Array of MAX_STRIPES with the enemies' X positions (one per Stripe)
; Total: 24 bytes

GoingUp = $b2	; 0: UP - 1: DOWN

basePos = $b3	; Position of player's white base
baseOff = $b4
baseX = $b5

plrLives = $b6

ChangeLevel = $b7	; (flag)

plrExploding = $b8	; 0 if not exploding, 1 if player is exploding
plrDeathAnim = $b9
plrDeathAnimOff = $ba
plrDied = $bb	; (flag)

EnemyLineColorDefault = $bc

ChangingDirection = $bd	; (flag)

SaveFirstEnemyX = $be
NewFirstEnemyX = $bf

EnemyDirectionsPtrLo = $c0
EnemyDirectionsPtrHi = $c1

CurrentLevel = $c2

EnemyMovesPtrLo = $c3
EnemyMovesPtrHi = $c4

Score = $c5	; $c5..$ca (6 bytes)

PlayerDelay = $cb	; Flip/Flop to move player on alternate frames

PfFuel = $cc	; Fuel indicator (6 bytes: $cc .. $d1)

FuelLevel = $d2
FuelDelay = $d3
FuelColor = $d4

SoundChannel0Start = $d5
SoundChannel1Start = $d6

PS_temp = $d7
EnemyLineColor = $d8

SoundChannel0Cnt = $d9	; Counter for channel 0 pointer (init with -1). Set to -1 to stop playing, set to 1 to start.
SoundChannel1Cnt = $da	; Counter for channel 1 pointer (init with -1). Set to -1 to stop playing, set to 1 to start.
SoundChannel0Delay = $db
SoundChannel1Delay = $dc

GameScreen = $dd	; 0/1 = intro  2/3 = level  4/5 = game

LevelCounter = $de	; 2 bytes

LevelData = $e0	; 14
enemyPatternsPtr = $ee	; 7
PatternPointerLo = $f5
PatternPointerHi = $f6
random = $f7	; random routine result is stored here

MissileXPos = $f8
ColToAdd = $f9

; ---- REUSE ----
; Intro 6-digit sprite vars
LoopCount = $81	; Reuse
ptr0 = $9d	; Reuse!
ptr1 = $9f
ptr2 = $a1
ptr3 = $a3
ptr4 = $a5
ptr5 = $a7

ReleaseFire = $cc	; Reuse of pfFuel
ScanLine = $d2		; REUSE!
PFColorRAM = $d3	; REUSE!

; --- Sound pointers ---
S_SoundMovePlayer = 0
S_SoundIntro = SoundIntro-SoundMovePlayer
S_SoundGotFood = SoundGotFood-SoundMovePlayer
S_SoundStartGame = SoundStartGame-SoundMovePlayer
S_SoundFinishLevel = SoundFinishLevel-SoundMovePlayer
S_SoundStartLevel = SoundStartLevel-SoundMovePlayer
S_SoundPlayerExplode = SoundPlayerExplode-SoundMovePlayer
S_SoundFuelWarning = SoundFuelWarning-SoundMovePlayer
S_SoundGetKey = SoundGetKey-SoundMovePlayer

	INCLUDE "..\gen\macros.asm"

Start
	CLD
; Clear RAM
	LDX  #$FF
	TXS  ; Set stack to the beginning

	LDA #0
B1      STA 0,X
	DEX
	BNE B1

	STA GameScreen	; Start with the intro screen

	LDY #S_SoundIntro	; Play intro sound
	JSR ActivateChannel0

ApplicationLoop		; That's the main loop where coice is made of which screen to display
	LDA GameScreen
	BEQ StartIntroScreen
	CMP #5
	BCC ContinueApplicationLoop1
	JMP MainLoop
ContinueApplicationLoop1
	CMP #1
	BEQ MainLoopIntroScreen
	CMP #2
	BEQ StartLevelScreen
	CMP #3	
	BEQ MainLoopLevelScreen
	CMP #4
	BNE StartIntroScreen
	JMP StartGameScreen

StartIntroScreen
	JSR Position6Sprites
	INC GameScreen	; 1

	LDY #15
	JSR BlankScreen		; Do a blank screen
	LDA #0
	STA ReleaseFire
MainLoopIntroScreen
	INC random
	JSR VerticalBlank
	JSR ProcessSounds
	JSR DrawIntroScreen
	JSR OverScan
	LDA ReleaseFire
	BNE ContMainLoop
	LDA SWCHB
	LSR
	BCC MainLoopIntroScreen	; Waits for reset switch to be released (loops if pressed)
	INC ReleaseFire
ContMainLoop
	LDA SWCHB
	LSR
	BCC GameResetStart	; Start with reset ...
	LDA INPT4		; ...or check fire button
	BMI MainLoopIntroScreen	; Fire button not pressed: loop
GameResetStart
	INC GameScreen	; 2

GameInitLoop
	JSR  GameInit

	LDA #1
	STA ReleaseFire

	LDY #S_SoundStartLevel	; Play start level tune
	JSR ActivateChannel0

StartLevelScreen
	JSR InitLevelScreen
	INC GameScreen	; 3
MainLoopLevelScreen0
	LDY #20
	JSR BlankScreen		; Do a blank screen
MainLoopLevelScreen
	JSR VerticalBlank
	JSR ProcessSounds
	LDA CurrentLevel
	BEQ NoCheckSwitchesLevel
	JSR CheckSwitches
NoCheckSwitchesLevel
	JSR DrawLevelScreen
	JSR OverScan
	LDA INPT4		; Check fire button
	BPL NoReleaseFireButton	; Fire button not pressed
	LDA #0
	STA ReleaseFire
NoReleaseFireButton
	LDA ReleaseFire
	BNE LevelScreenAppLoop
	LDA SWCHB
	LSR
	BCC LevelScreenAppLoop	; Start with reset ...
	LDA INPT4		; Check fire button
	BMI LevelScreenAppLoop
	INC GameScreen	; 4
	LDA plrLives
	BNE StartGameScreen
	STA GameScreen		; A is 0 here
LevelScreenAppLoop
	STA WSYNC		; Pad with a wsync if the above code is skipped due to a press of Reset
	JMP ApplicationLoop

StartGameScreen
	LDY #5
	JSR BlankScreen		; Do a blank screen

	JSR NewLevel

	LDY #15
	JSR BlankScreen		; Do a blank screen

	LDY #S_SoundStartGame	; Play stat game tune
	JSR ActivateChannel0

	INC GameScreen	; 5


MainLoop
	JSR  VerticalBlank
	JSR  CheckSwitches
	JSR ProcessSounds
	JSR  GameCalc
	LDA #0
	JSR  DrawScreen
	JSR  OverScan
	LDA GameScreen
	CMP #6
	BCC NoIncGameScreen
	INC GameScreen
	LDA GameScreen
	CMP #100
	BNE NoIncGameScreen
	LDA #2
	STA GameScreen
	JMP StartLevelScreen
NoIncGameScreen
	JMP ApplicationLoop      ; Loop forever


VerticalBlank	subroutine  ;*********************** VERTICAL BLANK HANDLER
	LDX  #0
	LDA  #2
	STA  WSYNC
	STA  VSYNC ;Begin vertical sync.
	STA  WSYNC ; First line of VSYNC
	STA  WSYNC ; Second line of VSYNC.

	STY Temp	; Save Y
	IF PAL50 = YES
; PAL
	LDY #0
	LDA SWCHB
	AND #P0_Diff
	BNE SetNtsc
	LDA #52	; 37 vblank lines (45 if PAL)
	TAY
	.byte $2c
SetNtsc
	LDA #44
	STY PalNtsc	; PalNtsc: 0 = PAL
	ELSE
; NTSC
	LDA  #44	; 37 vblank lines (45 if PAL)
	ENDIF
	STA  TIM64T

	LDY Temp
	STA  WSYNC ; Third line of VSYNC.
	STX  VSYNC ; (0)

	RTS  

CheckSwitches	subroutine ;*************************** CONSOLE SWITCH HANDLER
	LDA #0
	STA COLUBK	; Background will be black.
	LDA SWCHA       ; Read joystick 0
	STA Joystick0   ; Store for later use
	LDA OldJoystick0

	LDA SWCHB
	LSR
	BCS NoResetGame
	LDA #0
	STA GameScreen
	JSR StopSounds
NoResetGame

; New level?
	LDA ChangeLevel
	BEQ NoChangeLevel
; Increase level counters
	DEC ChangeLevel
	LDA #6
	STA GameScreen
	JSR StopSounds

	INC CurrentLevel
	LDX LevelCounter+1
	INX
	STX LevelCounter+1
	TXA
	EOR #10		; Let's test if a is 10 (will alter the value of A, and set it to 0 if it is 10)
	BNE NoResetLevelCounter
	STA LevelCounter+1
	INC LevelCounter

NoResetLevelCounter
	LDY #S_SoundFinishLevel
	JSR ActivateChannel0
NoChangeLevel
	RTS

; --------- ACTIVATE SOUND CHANNEL -----------
; Y: Offset to sound data
ActivateChannel0	subroutine
	LDX #0
;	BEQ ContinueSoundChannel
;	JMP ContinueSoundChannel
;	.byte $2c	; Skip next 2-bytes instruction (destroys A)
	.byte $0c	; SKW (skip next word) (illegal opcode) (preserves A)
ActivateChannel1	subroutine
	LDX #1
ContinueSoundChannel
	TYA
	CLC
	ADC SoundsFull,Y
	STA SoundChannel0Cnt,X	; Load index to the sound data...
	INY
	STY SoundChannel0Start,X
	LDA #1
	STA SoundChannel0Delay,X
	LDA SoundsFull,Y
	STA AUDC0,X
	RTS

; --------- Process sound channels ----------
ProcessSounds	subroutine
	LDX #1
.ContinueProcess
	; Plays channel 0, next note
	LDA SoundChannel0Delay,X
	BMI .NoPlaySound0		; No sound to play if delay is < 0
	DEC SoundChannel0Delay,X
	BNE .NoPlaySound0
	; Next note..
	LDA SoundChannel0Start,X
	STA Temp
	LDY SoundChannel0Cnt,X
	LDA SoundsFull,Y
	STA AUDF0,X
	DEY
	LDA SoundsFull,Y
	STA SoundChannel0Delay,X
	DEY
	LDA SoundsFull,Y
	STA AUDV0,X
	DEY
	CPY Temp
	BMI .FinishChannel0Sound
	STY SoundChannel0Cnt,X
	JMP .NoPlaySound0

.FinishChannel0Sound
	LDY #-1
	STY SoundChannel0Delay,X	; Stop channel 0
	INY
	STY AUDV0,X
.NoPlaySound0

	DEX
	BPL .ContinueProcess
	RTS

; Andrew Davie'w X positioning routine
CalcSprXPos
	;lda spr0x	; absolute X pixel
	TXA	; absolute X pixel
	lsr
	lsr
	lsr
	lsr
	tay	; /16
	
	sta PS_temp
	
	;lda spr0x
	TXA
	and #15
	clc
	adc PS_temp
	cmp #15
	
	tya
	adc #0
	tay
	sty PS_temp
	iny
	iny
	iny
	
	;lda spr0x
	TXA
	and #15
	clc
	adc PS_temp	; calculate the remainder for the /15
	; Use remainder for fine adjustment
	eor #15
	sbc #7	; -8 to +7
	asl
	asl
	asl
	asl
	
;	RETURN:
;	A: HMOVE value
;	Y: reposition value
	RTS

; Game calc routines are not exactly the state of the art in efficiency :)
; (that's quite old stuff by now)
GameCalc ;******************************* GAME CALCULATION ROUTINES
; Reset the color for the treat's "cage" (the line just below the food)
	LDA EnemyLineColorDefault
	STA EnemyLineColor
	STA ColToAdd

	LDA GameScreen
	CMP #6
	BCC NoEndOfGame
	JMP MovePlayerX

NoEndOfGame
; Animation (flicker) when player collects the food
	LDA ChangingDirection
	BEQ NotChangingDirection
	DEC ChangingDirection
	BNE StillChangingDirection
	LDA #0
	STA plrExploding
	LDA #8
	STA GoingUp
	LDY #MAX_STRIPE
	LDA NewFirstEnemyX
	STA enemyX,Y
	JMP NotChangingDirection
StillChangingDirection
	LDA #0
	STA plrExploding
	LDX GoingUp
	BEQ ChangeDirectionAnim2
	STA GoingUp
	LDY #MAX_STRIPE
	LDA SaveFirstEnemyX
	STA enemyX,Y
	JMP MovePlayerX
ChangeDirectionAnim2
	LDA #8
	STA GoingUp
	LDY #MAX_STRIPE
	LDA NewFirstEnemyX
	STA enemyX,Y
	JMP MovePlayerX
NotChangingDirection

	LDA plrExploding
	BEQ NoExploding
	LDA plrStripe
	CMP #MAX_STRIPE+1
	BEQ PlayerFirstStripeCollide
	JMP MovePlayerX		; Always calc player's X position
PlayerFirstStripeCollide
	LDA GoingUp
	BEQ NoExplodingFirstLine	; If going up and collision on first stripe, then no explosion (but food contact)
	JMP MovePlayerX
NoExplodingFirstLine
	; Presa la frutta:
	LDA #8
	STA GoingUp		; Let's go down now!
	LDA #0
	STA plrExploding	; Don't explode (please!)
	STA EnemyLineColorDefault

	LDY #S_SoundGotFood	; Play "Got Food" sound
	JSR ActivateChannel0

	LDA #80
	STA ChangingDirection
	LDY #MAX_STRIPE
	LDA enemyX,Y
	STA SaveFirstEnemyX
	LDA playerX
	CMP #80		; Let's position the enemy on the first stripe depending on player's position when got food
	BCC PlayerPos1
	LDA #16
	STA NewFirstEnemyX	; Enemy on the left (16)
	JMP PlayerPos2
PlayerPos1
	LDA #110		; Enemy on the right (110)
	STA NewFirstEnemyX

PlayerPos2

NoExploding
; -- Decrease fuel level --

	LDA plrStripe
	BEQ NoDecreaseFuel	; Don't decrease fuel if player is on base
	DEC FuelDelay
	BNE NoZeroFuelDelay
	; Decrease fuel level (and reset fuel delay)
	LDA #FUELDELAY_DEFAULT
	STA FuelDelay
	DEC FuelLevel
	LDA PfFuel+3
	BEQ Fuel4
	ASL
	STA PfFuel+3
	JMP NoZeroFuelDelay
Fuel4
	LDA PfFuel+4
	BEQ Fuel3
	LSR
	STA PfFuel+4
;	JMP NoZeroFuelDelay
	BCS NoZeroFuelDelay
Fuel3
	LDA PfFuel+5
	BEQ Fuel2
	ASL
	STA PfFuel+5
	JMP NoZeroFuelDelay
Fuel2
	LDA PfFuel+2
	BEQ Fuel1
	LSR
	STA PfFuel+2
;	JMP NoZeroFuelDelay
	BCS NoZeroFuelDelay
Fuel1
	LDA PfFuel+1
	BEQ Fuel0
	ASL
	STA PfFuel+1
	JMP NoZeroFuelDelay
Fuel0
	LDA PfFuel+0
	BEQ EndOfFuel
	LSR
	AND #%11000000
	STA PfFuel+0
	JMP NoZeroFuelDelay
EndOfFuel
	; Player explodes if fuel has finished
	LDA #1
	STA plrExploding
;	JMP MovePlayerX
NoZeroFuelDelay

	LDA FuelLevel
	CMP #10
	BNE NoPlayerSlowDown
	LDA #3
	STA PlayerDelayDefault	; Slow down player if fuel is low
	LDA #FUELCOLOR_DANGER
	STA FuelColor
NoPlayerSlowDown
	LDA FuelLevel
	CMP #15
	BNE NoChangeFuelColor
	LDA #FUELCOLOR_WARNING
	CMP FuelColor
	BEQ NoRestartFuelSound
	STA FuelColor

	LDY #S_SoundFuelWarning	; Play "low fuel warning" sound
	JSR ActivateChannel1

NoRestartFuelSound
NoChangeFuelColor
; -------------------------
NoDecreaseFuel
; --
; Joystick
	DEC PlayerDelay
	LDA PlayerDelay
	BEQ PlayerCanMoveX
	LDA Joystick0
	AND #%00111111
	STA Joystick0
;	DEC PlayerDelay
	JMP ContinueJoystick
PlayerCanMoveX
	LDA PlayerDelayDefault
	STA PlayerDelay
ContinueJoystick	
	LDA Joystick0
	BMI NoJoyRight
	LDX #148
	CPX playerX
	BEQ NoJoyRight
	; Action for RIGHT
	INC playerX
NoJoyRight
	ROL
	BMI NoJoyLeft
	LDX #12
	CPX playerX
	BEQ NoJoyLeft
	; Action for LEFT
	DEC playerX
NoJoyLeft
;-- Ignore UP/DOWN if on the previous frame player moved UP or DOWN
	TAX
	LDA GoingUp
	CMP #8
	BEQ ProcessJoyUpDown
	LDA plrStripe
	CMP #6
	BNE ProcessJoyUpDown
	LDY #MAX_STRIPE
	LDA enemyX,Y
	CMP playerX
	BEQ OkJoyUpDown
	CLC
	ADC #1
	CMP playerX
	BNE ProcessJoyUpDown
OkJoyUpDown
	LDA OldJoystick0
	ORA #%00010000
	STA OldJoystick0
ProcessJoyUpDown
	TXA
	LDA OldJoystick0
	AND #J0_Up
	BEQ NoStick
	LDA OldJoystick0
	AND #J0_Down
	BEQ NoStick
	TXA
	ROL
	BMI NoJoyDown
	LDX #MIN_STRIPE
	CPX plrStripe
	BCS MaybeNoJoyDown
	JMP OkJoyDown
MaybeNoJoyDown
	LDX GoingUp
	BEQ NoJoyUp
MaybeNoJoyDown2
	; Connect to base: control player's position, control base alignment.. and increase level!
	TAX	; Save A
	LDA baseX
	CLC
	ADC #8
	CMP playerX
	BCC NoJoyUp
	LDA baseX
	SBC #8
	CMP playerX
	BCS NoJoyUp	; NoJoyDown AND NoJoyUp

	LDA baseX
	STA playerX	; Connection to base
	LDA #1
	STA ChangeLevel	; Next level, please!
	TXA	; Restore A
OkJoyDown
	; Action for DOWN
	DEC plrStripe
	LDY #S_SoundMovePlayer
	JSR ActivateChannel0
	JMP NoStick
NoJoyDown
	ROL
	BMI NoJoyUp
	LDX #MAX_STRIPE
	STA Temp
	CPX plrStripe
	BCC NoJoyUp
	; Action for UP
	STA Temp
	LDA GoingUp
	BNE OkJoyUp

	LDA plrStripe
	CMP #MAX_STRIPE
	BNE OkJoyUp
	TAY
	LDA GoingUp
	CMP #8
	BEQ NoJoyUp
	LDA MissileStripe
	BNE NoJoyUp
	LDA enemyX,Y
	CMP playerX
	BEQ OkJoyUp
	CLC
	ADC #1
	CMP playerX
	BNE NoJoyUp
OkJoyUp
	INC plrStripe
	LDY #S_SoundMovePlayer
	JSR ActivateChannel0
NoJoyUp

NoStick
	; Fire button action (none)
NoJoyFire

	LDA Joystick0
	STA OldJoystick0	; Save joystick's position for next frame

; Move enemies according to patterns
; In enemyPatterns goes pattern number
; In enemyPatternsPtr pointer to the byte of the pattern

	LDY #MAX_STRIPE
	LDX #MAX_STRIPE
MoveEnemyX
	LDA enemyPatterns,X	; Load pattern number for this stripe
	ASL
	TAX
	INX
	LDA MovePatternPointers,X
	STA PatternPointerLo
	DEX
	LDA MovePatternPointers,X
	STA PatternPointerHi	; Load pointer to this pattern
	TYA
	TAX
	LDA enemyPatternsPtr,X
	TAY
	LDA (PatternPointerLo),Y	; Get pattern byte to be added to enemy X
	STA Temp
	DEC enemyPatternsPtr,X
	BNE NoZeroPattern
	LDY #0
	LDA (PatternPointerLo),Y
	STA enemyPatternsPtr,X
NoZeroPattern
	LDA enemyX,X
	CLC
	ADC Temp
	CMP #160
	BNE NoZeroEnemyX
	LDA #0
	JMP NoResetEnemyX
NoZeroEnemyX
	CMP #-1
	BNE NoResetEnemyX
	LDA #159
NoResetEnemyX
	STA enemyX,X
NoMoveEnemyX

	STA enemyX,X
	TXA
	TAY
	DEX
	DEY
	BPL MoveEnemyX

; Move player on the X
MovePlayerX
	LDX playerX
	JSR CalcSprXPos
	STA HMP0
	STA plrOff
	STY plrPos
; Copy player's position to the base position, but only if player is on the base (plrStripe = 0)
	LDA plrStripe
	BNE NoCopyPlayerBase
	LDA plrPos
	STA basePos
	LDA plrOff
	STA baseOff
	LDA playerX
	STA baseX
NoCopyPlayerBase

; Calc X movements for all enemies
	LDX #MAX_STRIPE
CalcEnemyX
	STX Temp
	LDA enemyX,X
	TAX
	JSR CalcSprXPos
	LDX Temp
	STA enemyOff,X
	STY enemyPos,X
	DEX
	BPL CalcEnemyX
	
NoSprAddPos
	LDA plrExploding
	BEQ PlayerNormalAnim	; Player not exploding
	; Player exploding: anim and sound
	LDA PlayerDeath1Anim
	CMP plrDeathAnim
	BNE NoStartExplosionSound
	JSR StopSounds
	LDY #S_SoundPlayerExplode
	JSR ActivateChannel0
	INC plrDied
	DEC plrLives		; Decrease lives counter
	BNE NoStartExplosionSound	; End of lives?
	LDA #6
	STA GameScreen

NoStartExplosionSound
	LDX plrDeathAnim
	LDA PlayerDeath1Anim,X
	STA plrAnimOff
	DEC plrDeathAnim
	BNE NoZeroPlayerAnim

	LDA PlayerDeath1Anim
	STA plrDeathAnim	; Resets death animation
	LDA Player1Anim
	STA plrAnim
	LDA #0
	STA plrExploding	; end of explosion
	LDA #PLAYERDELAY_DEFAULT
	STA PlayerDelayDefault
	JSR StopSounds
	LDA #0
	STA GoingUp
	JSR InitFuel
	LDA #ENEMYLINECOLOR_DEFAULT
	STA EnemyLineColorDefault
	LDA #INITIAL_STRIPE
	STA plrStripe
	LDA baseX
	STA playerX

	; Next Life

	JMP NoZeroPlayerAnim
PlayerNormalAnim	; Normal player animation (not exploding)
	LDX plrAnim
	LDA Player1Anim,X
	STA plrAnimOff
	DEC plrAnim
	BNE NoZeroPlayerAnim
	LDA Player1Anim
	STA plrAnim

NoZeroPlayerAnim

	LDA #1
	STA VDELP0

	LDA MissileStripe
	BNE NoZeroColToAdd
	LDA #0
	STA ColToAdd
NoZeroColToAdd
	RTS

; ----- Initialize fuel level and graphics -----
InitFuel
	LDA #%11000000
	STA PfFuel+0
	STA PfFuel+3
	LDA #%11111111
	STA PfFuel+1
	STA PfFuel+2
	STA PfFuel+4
	STA PfFuel+5

	LDA #FUELLEVEL_DEFAULT
	STA FuelLevel
	LDA #FUELDELAY_DEFAULT
	STA FuelDelay

	LDA #FUELCOLOR_OK
	STA FuelColor
	RTS

DrawScreen ;**************************** SCREEN DRAWING ROUTINES
	LDA INTIM
	BNE DrawScreen
	STA WSYNC
	STA VBLANK	;End the VBLANK period with a zero.
	LDA  #5		; Mirrored playfield
	STA  CTRLPF

; First scanline: let's init some stuff
	LDA #0
	STA GRP0	; Sprite 0 null
	STA PF1
	STA PF2
	STA COLUPF	; Black background
	LDA #%00110000	; 8-pixel Border
	STA PF0

; -- Beginning of Stripes --
	LDA #TOTAL_STRIPES
	STA Stripes	; Total Stripes counter

	LDX MissileXPos
	LDA #0
	STA WSYNC
Missile0XposLoop1
	DEX
	BPL Missile0XposLoop1
	STA ENAM0	; Enable (or disable) missile 0 graphics
	STA RESM0
	STA WSYNC

StripesLoop
; ----------- Stripe ------------

; Load Offset and Pos for Enemies (from array) and Player (only Pos for Player).
	LDX Stripes
	DEX
	LDA enemyOff,X
	STA HMP1
	LDY enemyPos,X

	LDX plrPos	; Sprite 0 pos (player)
	STA WSYNC

; Let's position our sprites using precalculated values...
Spr0XposLoop1
	DEX
	BPL Spr0XposLoop1
	STA RESP0	; Activate the sprite at this position, after a number of cycles have been waited
;	LDA #192
;	STA ScreenY	; We can use this time since the player never moves all the way to the right!
	STA WSYNC

Spr1XposLoop1
	DEY
	BPL Spr1XposLoop1
	STA RESP1	; Activate the sprite at this position, after a number of cycles have been waited
	STA WSYNC
	STA HMOVE

; --- 8 scanlines * 2
	LDA #8
	STA ScreenStripeY

	LDA Stripes
	CLC
	ASL
	LDX GoingUp		; 8 if going up, 0 if going down
	BEQ PlayerGoingDown	; If GoingUp == 0 the player is going down!
	CMP #14
	BNE PlayerGoingDown
	LDA #13
PlayerGoingDown
	TAX
	DEX

	STX Temp

	LDY GameScreen
	CPY #6
	BCC NormalLevelData
	LDY plrLives
	BEQ NormalLevelData
	LDX #13			; If the screen has been cleared, display treats instead of the enemies
NormalLevelData
	LDA LevelData,X		; Load number pointing to shape number (e.g. 0, 1, 2..)
	LDY #0

	ASL	; *2
	BCC TranslateShapes1
	INY
TranslateShapes1
	TAX	; X: lo
	TXA

	ASL	; *4
	BCC TranslateShapes2
	INY
TranslateShapes2
	TAX	; X: lo
	TXA

	ASL	; *8
	BCC TranslateShapes3
	INY
TranslateShapes3
	TAX	; X: lo
	TXA

	ASL	; *16
	BCC TranslateShapes4
	INY
TranslateShapes4
	CLC
	ADC #<EnemyShapes
	TAX
	TYA
	ADC #>EnemyShapes

	STA enemyShapeHi
	STX enemyShapeLo

	LDX Temp
	DEX
	LDA LevelData,X
	LDY Stripes
	CPY #MAX_STRIPE + 1
	BNE NormalNuSiz
	LDA #0
NormalNuSiz
	STA NUSIZ1
	LDX plrAnimOff	; Offset Player
	LDY #0	; Offset Enemy

ScanLoop1
	LDA Stripes
	CMP plrStripe
	BNE NoDrawPlayer
	LDA Player1Shape,X
	STA GRP0
NoDrawPlayer
	INX


	LDA Player1Shape,X
	STA WSYNC
	STA COLUP0
	LDA (enemyShapeLo),Y
	STA GRP1	; Write to GRP1 and consequently display P0 and P1 since VDELP0 is active
	INY
	LDA (enemyShapeLo),Y
	STA COLUP1
	STA Temp

	INX
	INY

	; -- Missile (key)
	LDA Stripes
	CMP MissileStripe		; Stripe where to draw the missile on
	BNE NoDrawMissile
	LDA ScreenStripeY

	CLC
	SBC #MISSILE_TOP	; Missile Top
	BPL NoDrawMissile
	LDA ScreenStripeY
	SBC #MISSILE_HEIGHT	; Missile Height
	BMI NoDrawMissile

	LDA #2
	STA ENAM0
	JMP SkipZeroMissile
NoDrawMissile
	LDA #0
	STA ENAM0
SkipZeroMissile
	STA WSYNC

	LDA ScreenStripeY
	CMP #1
	BNE NoBgColor
	LDA EnemyLineColor
	STA COLUBK
	;CLC
	LDA Temp
	ADC ColToAdd
	STA COLUP1
NoBgColor

	DEC ScreenStripeY
	BNE ScanLoop1
	STA WSYNC	; Another line...

	LDA #0
	STA GRP0
	STA GRP1
; ----- End of Stripe -----

	STA COLUBK
	STA EnemyLineColor
	STA ENAM0
	STA ColToAdd
	
	DEC Stripes
	BEQ EndStripesLoop	; Loop stripes
	JMP StripesLoop
EndStripesLoop
; ------------------- Base and Ground ---------------------
; -- Base
	LDX basePos	; Sprite 0 pos (player)
	LDA baseOff
	STA HMP0
	STA WSYNC

Spr0XposLoop2
	DEX
	BPL Spr0XposLoop2
	STA RESP0
	STA WSYNC
	STA HMOVE

	LDA #8
	STA ScreenStripeY
	LDX #0
	LDA plrStripe
	BEQ ScanLoop2
	LDX #16		; Pick base's graphics

ScanLoop2
	LDA PlayerGround1Shape,X
	STA GRP0
	INX
	STA WSYNC
	LDA PlayerGround1Shape,X
	STA COLUP0
	INX
	LDA #0
	STA GRP1
	STA WSYNC

	DEC ScreenStripeY
	BNE ScanLoop2

	STA WSYNC
	LDA #0
	STA GRP0
	STA GRP1

; -- Ground
	LDY #3
GroundColorLoop
	LDA GroundColorTable,Y
	STA COLUBK
	STA WSYNC
	DEY
	BPL GroundColorLoop
	LDA #$00
	STA COLUBK

	TAX	; LDX #0

	STA PF0
	STA PF1
	STA PF2
	LDA FuelColor
	STA COLUPF	; Removing PF graphics and blanking line 1 scanline before doing the fuel in order to maintain a correct cycle count

; ---------------------------------
; --------- Draw Fuel bar ---------
; ---------------------------------

	LDY #1
LoopDrawFuelBar
	STA WSYNC
	LDA PfFuel,X	; 3
	STA PF0		; 6
	LDA PfFuel+1,X	; 9
	STA PF1		; 12
	LDA PfFuel+2,X	; 15
	STA PF2		; 18

	NOP
	NOP
	NOP

	LDA PfFuel+3,X	; 3
	STA PF0		; 6
	LDA PfFuel+4,X	; 9
	STA PF1		; 12
	LDA PfFuel+5,X	; 15
	STA PF2		; 18

	DEY
	BPL LoopDrawFuelBar
	STA WSYNC

; ---- Finish screen...
	LDY #00
	STY COLUPF
	LDA #%00110000	; Restore black border...
	STA PF0
	STY PF1
	STY PF2
	STY COLUBK

	STA HMCLR
	STA WSYNC	; black line after fuel

	IF PAL_COLORS = NO
	LDA #$f2
	ELSE
	LDA #$22
	ENDIF
	STA COLUBK

; ---- Lives Indicator -----

; Position sprite

	LDA plrLives
	ASL
	TAX
	DEX
	LDA LivesDisplayData,X
	STA NUSIZ0
	DEX
	LDA LivesDisplayData,X
	STA NUSIZ1

	LDA #$80
	STA HMP0
	LDA #$82
	STA HMP1

	LDX #3
	STA WSYNC
	STA HMOVE
Spr0XposLoopLives
	DEX
	BPL Spr0XposLoopLives
	STA RESP0
	BIT $00
	BIT $00
	BIT $00
	NOP
	NOP
	STA RESP1

	LDY #9	; Lives sprite length

	LDX plrLives
DrawLivesSprite
	LDA LivesSprite1,Y
	CPX #0
	BNE OkLivesSprite0
	LDA #0
OkLivesSprite0
	STA GRP0
	STA WSYNC
	LDA LivesSprite1,Y
	CPX #4
	BCS OkLivesSprite1
	LDA #0
OkLivesSprite1
	STA GRP1
	DEY
	LDA LivesSprite1,Y
	STA COLUP0
	STA COLUP1
	STA WSYNC
	DEY
	BPL DrawLivesSprite
	STA WSYNC

EndDrawLives
	LDA #0
	STA GRP0
	STA GRP1
	LDA #%00100000
	STA NUSIZ0

; ---- End of screen ----

	IF PAL50 = YES
	STA WSYNC
	STA WSYNC
	LDA #1
	STA COLUBK
	JMP FinishScreenNtscPal
	ELSE
	STA WSYNC
	STA WSYNC
	LDA #0
	STA COLUBK
	STA WSYNC
	ENDIF

	RTS

OverScan	subroutine   ;***************************** OVERSCAN CALCULATIONS
	LDA #2
	STA WSYNC
	STA VBLANK

; -- Read Collisions
	IF PAL50 = YES
	LDA PalNtsc
	BEQ OverscanNtsc
	LDX #36		; PAL
	.byte $2c
OverscanNtsc
	LDX #30
	ELSE
	LDX #30		; NTSC
	ENDIF

	LDA CXPPMM		; Player with player
	BPL NoCollisions1
	LDA #1
	STA plrExploding
NoCollisions1
	LDA CXM0P		; Player with missile (picked up key)
	ASL
	BPL NoCollisions2
	LDA #0
	STA MissileStripe
	STX PS_temp
	LDY #S_SoundGetKey
	JSR ActivateChannel1
	LDX PS_temp
	DEX
NoCollisions2

	STA CXCLR	; Resetta collisions after read
; --

KillLines
	STA WSYNC
	DEX
	BNE KillLines
	RTS

GameInit
	LDA #0
	STA CurrentLevel
	STA LevelCounter
	STA LevelCounter+1
	INC LevelCounter+1	; 1st level: display 01 instead of 00

	LDA #PLAYER_INITIALLIVES
	STA plrLives

	LDX #5
	LDA #0
ResetScore
	STA Score,X
	DEX
	BPL ResetScore
	RTS

; ------------------------------------------------
; ----------- David Crane's LeftRandom -----------
; ------ From Thomas Jentzsch's disassembly ------
; ------------------------------------------------

; Y: number to pick from the list (e.g. 0 = 1st number)
LeftRandom
loopRandom:
; random' = random >> 1 | (bit4^bit5^bit6^bit1) * $80
	lda    random           ; 3
	asl                     ; 2
	eor    random           ; 3
	asl                     ; 2
	eor    random           ; 3
	asl                     ; 2
	asl                     ; 2
	rol                     ; 2
	eor    random           ; 3
	lsr                     ; 2
	ror    random           ; 5
;	dey                     ; 2
;	bpl    loopRandom      ; 2³	Execute only once
	RTS

; -------------------------------------
; --------- Inits a new level ---------
; -------------------------------------

NewLevel
;	INC CurrentLevel
	LDA CurrentLevel
	CMP #TOTAL_LEVELS
	BCC NoResetLevels
; -- Resets levels count --
	LDA #0
	STA CurrentLevel
	STA LevelCounter
	STA LevelCounter+1
	INC LevelCounter+1	; 1st level: display 01 instead of 00
NoResetLevels
	LDA #0

        STA     GRP0	; clear out player graphic 0
        STA     GRP1	; clear out player graphic 1
        STA     ENAM0	; clear out missile 0
        STA     ENAM1	; clear out missile 1
        STA     ENABL	; clear out ball
	STA plrDied

	STA GoingUp
	STA plrExploding
	STA ChangingDirection

	LDA #INITIAL_STRIPE
	STA plrStripe

	LDA #$F0
	STA OldJoystick0

	LDA #PLAYERX_DEFAULT
	STA playerX

	LDA #ENEMYLINECOLOR_DEFAULT
	STA EnemyLineColorDefault
	STA ColToAdd

; -- KEY/MISSILE
	; -- Randomize Missile Stripe position
	JSR LeftRandom
	AND #7
	TAY
	LDA MissileStripePos,Y
	STA MissileStripe
	; -- Randomize Missile X position
	JSR LeftRandom
	AND #7
	TAY
	LDA MissileXPosTable,Y
	STA MissileXPos

; -- Fill in level data
; First 2 bytes of level data
	LDX #13
	LDA CurrentLevel	; Make treats cycle and not random...
	AND #7
	CLC
	ADC #ENEMY_SHAPES_NUMBER	; Point to treat shape instead of enemy shape
	STA LevelData,X
	DEX
	JSR LeftRandom
	AND #15
	STA LevelData,X
	DEX
LoadLevelTemp2
	JSR LeftRandom
	AND #15
	STA LevelData,X
	DEX
	JSR LeftRandom
	AND #7
	TAY
	LDA CurrentLevel
	CMP #LEVELS_EASY
	BCS Level2Nusiz
	LDA NuSizList1,Y
	JMP ContinueLevelNusiz
Level2Nusiz
	CMP #LEVELS_MEDIUM
	BCS Level3Nusiz
	LDA NuSizList2,Y
	JMP ContinueLevelNusiz
Level3Nusiz
	LDA NuSizList3,Y
ContinueLevelNusiz
	STA LevelData,X
	DEX
	BPL LoadLevelTemp2

; -- Init player's animation
	LDA Player1Anim
	STA plrAnim

; -- Init enemy patterns
; In enemyPatterns goes pattern number
; In enemyPatternsPtr pointer to the last byte of the pattern
	LDY #MAX_STRIPE
	JSR LeftRandom
	AND #3			; For the treat, only pick simple movement patterns (one of the first 4)
	STA enemyPatterns,Y
	ASL
	TAX
	INX
	LDA MovePatternPointers,X
	STA PatternPointerLo
	DEX
	LDA MovePatternPointers,X
	STA PatternPointerHi
	STY Temp
	LDY #0
	LDA (PatternPointerLo),Y
	LDY Temp
	STA enemyPatternsPtr,Y
	LDA enemyPatterns,Y
	DEY
; For the first line after the treat, always pick the pattern after the one of the treat
; (so the line moves on the opposite direction)
	CLC
	ADC #1
	AND #3
	STA enemyPatterns,Y
	STA FuelLevel
	ASL
	TAX
	INX
	LDA MovePatternPointers,X
	STA PatternPointerLo
	DEX
	LDA MovePatternPointers,X
	STA PatternPointerHi
	STY Temp
	LDY #0
	LDA (PatternPointerLo),Y
	LDY Temp
	STA enemyPatternsPtr,Y
	DEY

NewLevel_InitPatterns
	JSR LeftRandom
	LDX CurrentLevel
	CPX #LEVELS_EASY
	BCS Level2Patterns
	AND #3		; Easy level
	LDX #0
	STX MissileStripe	; No key on easy levels...
	JMP ContinueLevelPatterns
Level2Patterns
	CPX #LEVELS_MEDIUM
	BCS Level3Patterns
	AND #7		; Medium level
	JMP ContinueLevelPatterns
Level3Patterns
	AND #7		; Hard level
	CLC
	ADC #8
ContinueLevelPatterns
	LDX FuelLevel	; Reuse of FuelLevel as a temporary variable
	STA FuelLevel
	CPX FuelLevel
	BEQ NewLevel_InitPatterns
	STA enemyPatterns,Y
	ASL
	TAX
	INX
	LDA MovePatternPointers,X
	STA PatternPointerLo
	DEX
	LDA MovePatternPointers,X
	STA PatternPointerHi
	STY Temp
	LDY #0
	LDA (PatternPointerLo),Y
	LDY Temp
	STA enemyPatternsPtr,Y
	DEY
	BPL NewLevel_InitPatterns

; -- Init enemy X starting positions (random)
	LDY #MAX_STRIPE
	LDX #0
NewLevel_InitEnemyX
	JSR LeftRandom
	CMP #159			; If the enemy x is >= 160, make it wrap
	BCC NewLevel_NoChangeEnemyX
	CLC
	SBC #159
	ADC #1
NewLevel_NoChangeEnemyX
	CMP #0				; Never choose 0 for enemy x
	BNE NewLevel_NoChangeEnemyX2
	CLC
	ADC #1
NewLevel_NoChangeEnemyX2
	STA enemyX,X
	INX
	DEY
	BPL NewLevel_InitEnemyX
; --
	LDA #PLAYERDELAY_DEFAULT
	STA PlayerDelayDefault
	STA PlayerDelay

	LDA PlayerDeath1Anim
	STA plrDeathAnim	; Resetta death anim

	STA ChangeLevel

	LDA #%00000001
	STA NUSIZ1

	LDY #%00100000
	STY NUSIZ0

	JSR InitFuel

	JSR StopSounds

	LDA #$01
	STA VDELP0
	LDA #$00
	STA VDELP1
	STA ChangeLevel

	RTS

SetLevelPointers
         ;make pointers to num data
	ldx #1	; Number of score bytes (0-1)
	ldy #2	; Points to the last score pointer
LevelCounterLoop
	lda LevelCounter,x	; Load last byte of level number (in 01, would load 1)
        asl 
	asl 
	asl	; Multiply score digit by 8 (as a sprite in rom is 8 bytes long)

	CLC
	adc #<Number0	; Add the byte to the low byte of first pointer to number shapes
	sta ptr4,y	; And store it in the ptr data
	lda #0
	adc #>Number0	; Add the carry, if any, to the high byte of shape pointer
	sta ptr4+1,y	; And store it in the ptr data
	dey
	dey		; Next (previous) pointer
	dex		; Next (previous) byte of level number
	bpl LevelCounterLoop	; Loop

	RTS

; Enemy shapes (and colors)
	IF PAL_COLORS = NO
		include "treat_ntsc_shapes1.asm"
	ELSE
		include "treat_pal_shapes1.asm"
	ENDIF

Player1Anim	; numero frames, offset frame n, offset frame n-1, .. , offset frame 1
	.byte 16, 16, 16, 16, 16, 16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0

PlayerDeath1Anim
	.byte 32
	.byte 80, 80, 80, 80
	.byte 80, 80, 80, 80
	.byte 64, 64, 64, 64
	.byte 64, 64, 64, 64
	.byte 48, 48, 48, 48
	.byte 48, 48, 48, 48
	.byte 32, 32, 32, 32
	.byte 32, 32, 32, 32

IntroPfColors
	IF PAL_COLORS = NO
	.byte $00, $76, $78, $7a, $78, $76, $74, $72
	ELSE
	.byte $00, $b6, $b8, $ba, $b8, $b6, $b4, $b2
	ENDIF

MovePattern1	; 1 2
	.byte 3 , 0, 0, 1
MovePattern2	; 1 2
	.byte 3 , 0, 0, -1
MovePattern3	; 1 2
	.byte 2 , 0, 1
MovePattern4	; 1 2	; AND #3	First Levels	(and treats)
	.byte 2 , 0, -1

MovePattern5	; 2
	.byte 1 , 1
MovePattern6	; 2
	.byte 1 , -1
MovePattern7	; 2
	.byte 3 , 0, 1, 1
MovePattern8	; 2	; AND #7	Levels phase 2
	.byte 3 , 0, -1, -1
MovePattern9	; 3
	.byte 1 , 1
MovePattern10	; 3
	.byte 1 , -1
MovePattern11	; 3
	.byte 30 , 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0 ; ok (hard)
MovePattern12	; 3
	.byte 25 , 1,1,1,1,0,1,1,0,1,0,0,1,0,0,0,0,0,-1,-1,-1,0,0,0,0,0 ;
MovePattern13	; 3
	.byte 23 , 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0 ; ok
MovePattern14	; 3
	.byte 24, -1, -1, -1, -1, -1, 0, -1, -1, -1, 0, -1, -1, 0, -1, 0, -1, 0, -1, -1, 0, -1, -1, -1, 0	(very hard!)
MovePattern15	; 3
	.byte 19 , 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0 ; ok
MovePattern16	; 3
	.byte 3 , 0, -1, -1
MovePattern17	; temp

; NUSIZ
; 0 (one copy)
; 1 (two copies close)
; 2 (two copies med)
; 3 (three copies close)
; 4 (2 copies wide)
;  5 (NO: double size)
; 6 (3 copies medium)
;  7 (NO: triple size)

NuSizList1
	.byte 4, 4, 6, 4, 6, 2, 4, 0

NuSizList2
	.byte 6, 6, 6, 4, 6, 6, 4, 4
;	.byte 5, 5, 5, 5, 5, 5, 5, 5

NuSizList3
	.byte 6, 6, 6, 6, 4, 6, 6, 6

SoundsFull
SoundMovePlayer
	.byte 4 *3+1, 6,  00, 01, 00,  15, 2, 20,  15, 2, 15,  15, 2, 5

SoundIntro
	; (Crappy) jingle
	.byte 8 *3+1, 1,  15, 20, 11,  15, 10, 17,  15, 10, 11,  15, 10, 17,  00, 5, 00,  15, 30, 11,  00, 10, 00,  15, 10, 17

SoundGotFood
	.byte 4 *3+1, 4,  15, 20, 17,  15, 20, 11,  15, 20, 17,  15, 20, 11

SoundStartGame
	.byte 4 *3+1, 6,  00, 01, 00,  15, 2, 5,  15, 2, 15,  15, 2, 20

SoundFinishLevel
	.byte 6 *3+1, 4, 00, 1,00,  15, 5, 15,  00, 2, 00,  15, 5, 25 , 00, 2, 00,  15, 5, 30

SoundStartLevel
	.byte 8 *3+1, 4, 00, 2, 00,  15, 5, 20 , 00, 2, 00,  15, 10, 30, 00, 2, 00,  15, 5, 20, 00, 2, 00,  15, 10, 30

SoundPlayerExplode
	.byte 4 *3+1, 8, 00, 2, 00,  15, 20, 31,  15, 5, 29,  15, 10, 28

SoundFuelWarning
	.byte 10 *3+1, 4,  00, 2, 00,  15, 30, 30,  00, 100, 00,  15, 30, 30,  00, 100, 00,  15, 30, 30,  00, 100, 00,  15, 30, 30,  00, 100, 00,  15, 30, 30

SoundGetKey
	.byte 4 *3+1, 4, 00, 1,00,  15, 5, 15,  00, 2, 00,  15, 5, 30

Position6Sprites
	LDA     #$01
	STA     VDELP0
	STA     VDELP1
	LDA     #$03
	STA     NUSIZ0
	STA     NUSIZ1
	LDA     #INTROSPRITES_COLOR
	STA     COLUP0
	STA     COLUP1

	LDA #0
	STA HMCLR

	STA     WSYNC

	LDY #6		; 2
DelayLoop_introscreensprites1
	DEY		; 2 * 7
	BPL DelayLoop_introscreensprites1	; 3 * 6 + 2 =  cycles
	NOP
	NOP

	STA     RESP0	; Position sprites on the screen
	STA WSYNC

	LDY #7		; 2
DelayLoop_introscreensprites2
	DEY		; 2 * 7
	BPL DelayLoop_introscreensprites2	; 3 * 6 + 2 =  cycles

	STA     RESP1

	LDA     #$50
	STA     HMP0

	STA     WSYNC
	STA     HMOVE
	RTS

InitIntroScreen	subroutine
	STY Temp

	LDX #11
.loop2
	STA ptr0-1,X
	CLC
	SBC Temp
	DEX
	DEX
	BPL .loop2

; Load pointers to sprites data
	LDA #>IntroSpr0
	LDX #11
.loop1
	STA ptr0,X
	DEX
	DEX
	BPL .loop1

	RTS

InitLevelScreen	subroutine
; Calc game score
	LDY plrLives
	BEQ .GameOver		; Calc hi-score
	LDA CurrentLevel
	BEQ .NoLevelScore	; Don't add lives bonus if 1st level
	LDA plrDied
	BNE .NoSavedLifesBonus
	LDX #SCORE_1000
	JSR IncreaseScore
.NoSavedLifesBonus
;	LDY plrLives
.loop1	; Add lives bonus
	LDX #SCORE_100
	JSR IncreaseScore
	DEY
	BNE .loop1

	LDY FuelLevel
.loop2
	BEQ .NoFuelBonus
	LDX #SCORE_10
	JSR IncreaseScore
	DEY
	BPL .loop2

.NoFuelBonus
; Give an increasing bonus with the increase of difficulty
	LDX #SCORE_10
	JSR IncreaseScore
	LDY CurrentLevel
	CPY #LEVELS_EASY
	BMI .NoLevelScore
	LDX #SCORE_100
	JSR IncreaseScore
	CPY #LEVELS_MEDIUM
	BMI .NoLevelScore
	LDX #SCORE_1000
	JMP IncreaseScore	; Increase score and finish sub
.GameOver
	; Compare current score with hi score, if greater then set it
	LDX #0
.LoopHiScore	; Compare
	LDA HiScore,X		; Hi Score Byte 6 in A
	CMP Score,X		; A < Current Score byte 6?
	BCC .SetNewHiScore	; Copy Current Score into Hi Score
	LDA Score,X
	CMP HiScore,X
	BCC .NoLevelScore
	INX
	CPX #6
	BCC .LoopHiScore
	RTS
.SetNewHiScore	; Copy current score in hi-score
	LDX #5
.LoopSetNewHiScore
	LDA Score,X
	STA HiScore,X
	DEX
	BPL .LoopSetNewHiScore
.NoLevelScore
	RTS

LoadLevelPointers	subroutine
	JSR Position6Sprites

	LDX #11
.loop1
	LDA LevelPointersTable,X
	STA ptr0,X
	DEX
	BPL .loop1

	RTS

DrawIntroScreen	subroutine
DrawIntroScreenLoop1
	LDA INTIM
	BNE DrawIntroScreenLoop1 ; Whew!
	STA WSYNC
	STA VBLANK  ;End the VBLANK period with a zero.
	LDA PF_Reflect
	STA CTRLPF  ; Set playfield to reflect
	LDA #0
	;
	STA COLUP0
	STA COLUP1; blacking out player colors
	STA COLUPF
	STA PFColorRAM
	;
	LDA #191 
	STA ScanLine
	LDY #6

	LDA #0
	STA PF0
	STA PF1
	STA PF2

	LDX #21
	JSR EatLines

	LDA #INTROLINES_COLOR
	STA COLUBK
	STA WSYNC
	LDA #$00
	STA COLUBK

	LDX #6
	JSR EatLines

	LDX #7

ScanLoopIntroScreen
	DEY
	BNE ScanGoIntroScreen
	LDY #5
	DEX			;next big pixel line
	BEQ EndOfIntroScreen1
ScanGoIntroScreen
	STA WSYNC
	LDA IntroPfColors,X
	STA COLUPF

	LDA PFData0,X           ;[0]+4
	STA PF0                 ;[4]+3 = *7*   < 23	;PF0 visible
	
	LDA PFData1,X           ;[7]+4
	STA PF1                 ;[11]+3 = *14*  < 29	;PF1 visible
	
	LDA PFData2,X           ;[14]+4
	STA PF2                 ;[18]+3 = *21*  < 40	;PF2 visible

;	nop			;[21]+2
;	nop			;[23]+2
;	nop			;[25]+2
	
	LDA PFData0b,X          ;[27]+4

	;PF0 no longer visible, safe to rewrite
	STA PF0                 ;[31]+3 = *34* 

	LDA PFData1b,X		;[34]+4

	;PF1 no longer visible, safe to rewrite
	STA PF1			;[38]+3 = *41*  

	LDA PFData2b,X		;[41]+4
	
	;PF2 rewrite must begin at exactly cycle 45!!, no more, no less
	STA PF2			;[45]+2 = *47*  ; > 46 PF2 no longer visible

	;76-47 = 29 cycles left per scanline available for
	; further calculations (i.e. sprites), not counting the rest of the
	; existing code below that branches off and changes the indexing to the letter graphics

	DEC ScanLine
	BNE ScanLoopIntroScreen

EndOfIntroScreen1
	;
	LDA #$00
	STA PF0
	STA PF1
	STA PF2
	STA COLUPF

	LDX #7
	JSR EatLines

	LDA #INTROLINES_COLOR
	STA COLUBK
	STA WSYNC
	LDA #$00
	STA COLUBK

	LDX #11
	JSR EatLines

IntroSprites

	LDA     #INTROSPRITES_COLOR
	STA     COLUP0
	STA     COLUP1

	LDA #<IntroSpr5
	LDY #INTROSPR_SIZE
	JSR InitIntroScreen
	LDA #INTROSPR_SIZE
	JSR Display6Sprite

	LDX #25 + 40
	JSR EatLines

	; Display Hi-Score
	LDX #5
	JSR LoadScorePointers
	LDA #7
	JSR Display6Sprite

; --------------------------------

	IF PAL50 = NO
	LDX #9
	JMP EatLines
	ELSE
	LDA #9
	JMP FinishScreenNtscPal
	ENDIF

DrawLevelScreen	subroutine
	LDA INTIM
	BNE DrawLevelScreen
	STA WSYNC
	STA VBLANK

	LDX #71
	JSR EatLines

	JSR LoadLevelPointers
	JSR SetLevelPointers

	LDA #7
	JSR Display6Sprite

	LDX #(#Score-#HiScore+#5)
	JSR LoadScorePointers
	LDA #7
	JSR Display6Sprite

	LDX #10
	JSR EatLines

	LDA plrLives
	BEQ .DisplayGameOver
	IF PAL50 = NO
	LDX #80
	JMP EatLines
	ELSE
	LDA #80
	JMP FinishScreenNtscPal
	ENDIF

.DisplayGameOver
	LDY #GAMEOVERSPR_SIZE
	LDA #<GameOverSpr5
	JSR InitIntroScreen
	JSR Position6Sprites
	LDA #GAMEOVERSPR_SIZE
	JSR Display6Sprite

	IF PAL50 = NO
	LDX #67
	JMP EatLines
	ELSE
	LDA #67
	JMP FinishScreenNtscPal
	ENDIF

FinishScreenNtscPal	subroutine
	LDX PalNtsc
	BEQ .IsNtsc
	CLC
	ADC #37
.IsNtsc
	TAX

; X: nuber of lines to eat
EatLines	subroutine
	STA WSYNC
	DEX
	BNE EatLines
	RTS

LoadScorePointers	subroutine
	ldy #10
.loop
	lda HiScore,x
	asl 
	asl 
	asl 

	adc #<Number0
	sta ptr0,y
	lda #0
	adc #>Number0
	sta ptr0+1,y
	dex
	dey
	dey
	bpl .loop
	RTS

; X: Position to increase (5: units  0: hundreds of thousands)
IncreaseScore	subroutine
.scloop1
	inc Score,x
	lda Score,x
	cmp #10
	bne .scdone
	lda #0
	sta Score,x
	dex
	bpl .scloop1
.scdone
	RTS

	org $FE00

Display6Sprite
	STA     LoopCount	; 3	(40 cycles)
X1:
	STA     WSYNC

	LDY #11		; 2
DelayLoop1
	DEY		; 2 * 12
	BPL DelayLoop1	; 3 * 11 + 2 =  cycles
	BIT $00

; 9
X3:
	NOP
	NOP
	NOP
	LDY     LoopCount	; 3
	LDA     (ptr0),Y
	STA     GRP0
	LDA     (ptr1),Y
	STA     GRP1
	LDA     (ptr2),Y
	STA     GRP0
	LDA     (ptr5),Y
	STA     Temp
	LDA     (ptr4),Y
	TAX
	LDA     (ptr3),Y
	LDY     Temp
	STA     GRP1
	STX     GRP0
	STY     GRP1
	STA     GRP0
	DEC     LoopCount
	BPL     X3

	LDA     #0
	STA     GRP0
	STA     GRP1
	STA     GRP0
	STA     GRP1
	RTS

LevelSpr0
                                .byte   %11111011
                                .byte   %11011011
                                .byte   %11000011
                                .byte   %11000011
                                .byte   %11000011
                                .byte   %11000011
                                .byte   %11000011
                                .byte   %11000011
LevelSpr1
				.byte   %11100010
                                .byte   %01100111
                                .byte   %00000111
                                .byte   %10001101
                                .byte   %00001101
                                .byte   %00001101
                                .byte   %01101101
                                .byte   %11101101
LevelSpr2
                                .byte   %00111110
                                .byte   %00110110
                                .byte   %00110000
                                .byte   %10111000
                                .byte   %10110000
                                .byte   %10110000
                                .byte   %10110110
                                .byte   %10111110
LevelSpr3
                                .byte   %11111000
                                .byte   %11011000
                                .byte   %11000000
                                .byte   %11000000
                                .byte   %11000000
                                .byte   %11000000
                                .byte   %11000000
                                .byte   %11000000

NumbersShape
Number0
	.byte %01111100
	.byte %11000110
	.byte %11000110
	.byte %11000110
	.byte %11000110
	.byte %11000110
	.byte %11000110
	.byte %01111100
Number1
	.byte %11111100
	.byte %00110000
	.byte %00110000
	.byte %00110000
	.byte %00110000
	.byte %11110000
	.byte %01110000
	.byte %00110000
Number2
	.byte %11111110
	.byte %11000000
	.byte %01100000
	.byte %00110000
	.byte %00011000
	.byte %00001100
	.byte %11000110
	.byte %01111100
Number3
	.byte %01111100
	.byte %11000110
	.byte %00000110
	.byte %00000110
	.byte %00011100
	.byte %00000110
	.byte %11000110
	.byte %01111100
Number4
	.byte %00000110
	.byte %11111110
	.byte %11000110
	.byte %01100110
	.byte %01100110
	.byte %00110000
	.byte %00110000
	.byte %00011000
Number5
	.byte %01111100
	.byte %11000110
	.byte %00000110
	.byte %00000110
	.byte %11111100
	.byte %11000000
	.byte %11000000
	.byte %11111110
Number6
	.byte %01111100
	.byte %11000110
	.byte %11000110
	.byte %11000110
	.byte %11111100
	.byte %11000000
	.byte %11000110
	.byte %01111100
Number7
	.byte %00110000
	.byte %00110000
	.byte %00011000
	.byte %00011000
	.byte %00001100
	.byte %00001100
	.byte %00000110
	.byte %11111110
Number8
	.byte %01111100
	.byte %11000110
	.byte %11000110
	.byte %11000110
	.byte %01111100
	.byte %11000110
	.byte %11000110
	.byte %01111100
Number9
	.byte %01111100
	.byte %11000110
	.byte %00000110
	.byte %01111110
	.byte %11000110
	.byte %11000110
	.byte %11000110
	.byte %01111100

LivesSprite1
	IF PAL_COLORS = NO
	.byte $82,%01011010
	.byte $86,%00111100
	.byte $8a,%01111110
	.byte $86,%00111100
	.byte $82,%01011010
	ELSE
	.byte $d2,%01011010
	.byte $d6,%00111100
	.byte $da,%01111110
	.byte $d6,%00111100
	.byte $d2,%01011010
	ENDIF

LivesDisplayData
	.byte 0, 0,  0, 1 , 0, 3,  0, 3,  1, 3,  3, 3,   3, 3,  3, 3

StopSounds	subroutine
	LDA #-1
	STA SoundChannel0Delay	; Stop channel 0
	STA SoundChannel1Delay	; Stop channel 0
	LDA #0
	STA AUDV0
	STA AUDV1
	RTS

MovePatternPointers
;	.byte >MovePattern17, <MovePattern17
	.byte >MovePattern1, <MovePattern1
	.byte >MovePattern2, <MovePattern2
	.byte >MovePattern3, <MovePattern3
	.byte >MovePattern4, <MovePattern4
	.byte >MovePattern5, <MovePattern5
	.byte >MovePattern6, <MovePattern6
	.byte >MovePattern7, <MovePattern7
	.byte >MovePattern8, <MovePattern8
	.byte >MovePattern9, <MovePattern9
	.byte >MovePattern10, <MovePattern10
	.byte >MovePattern11, <MovePattern11
	.byte >MovePattern12, <MovePattern12
	.byte >MovePattern13, <MovePattern13
	.byte >MovePattern14, <MovePattern14
	.byte >MovePattern15, <MovePattern15
	.byte >MovePattern16, <MovePattern16

MissileXPosTable
;	.byte $5, $6, $7, $7, $8, $9, $9, $b
	.byte $5, $6, $7, $7, $8, $8, $b, $b

	ORG $FF00

; --- Intro Screen Graphics ---
;               REFLECTED PLAYFIELD
;   PF0|   PF1  |  PF2   |   PF2b |   PF1b |PF0b|
;  4567|76543210|01234567|76543210|01234567|7654|

PFData0
	.byte $00, $70, $80, $80, $40, $20, $20, $C0

PFData1
	.byte $00, $45, $45, $45, $47, $65, $15, $E2

PFData2
	.byte $00, $CC, $22, $22, $62, $22, $02, $FC

PFData2b
	.byte $00, $25, $25, $25, $26, $25, $21, $7E
	
PFData1b
	.byte $00, $AC, $A2, $A2, $E6, $A2, $A2, $4C

PFData0b
	.byte $00, $20, $20, $20, $20, $20, $20, $70
	
; -----------------------------

; Standard Graphics

GameOverSpr0
                                .byte   %00000001
                                .byte   %00000010
                                .byte   %00000010
                                .byte   %00000010
                                .byte   %00000001
GameOverSpr1
                                .byte   %10101010
                                .byte   %10101010
                                .byte   %10111011
                                .byte   %00101011
                                .byte   %10010010
GameOverSpr2
                                .byte   %10011000
                                .byte   %10100000
                                .byte   %10110000
                                .byte   %10100000
                                .byte   %10011000
GameOverSpr3
                                .byte   %01000100
                                .byte   %10101010
                                .byte   %10101010
                                .byte   %10101010
                                .byte   %01001010
GameOverSpr4
                                .byte   %01101010
                                .byte   %10001010
                                .byte   %11001100
                                .byte   %10001010
                                .byte   %01101100
GameOverSpr5
                                .byte   %00000000
                                .byte   %00000000
                                .byte   %00000000
                                .byte   %00000000
                                .byte   %00000000

IntroSpr0
                                .byte   %00001111
                                .byte   %00001101
                                .byte   %00000110
                                .byte   %00000011
                                .byte   %00001111
                                .byte   %00000000
                                .byte   %00011000
                                .byte   %00011000
                                .byte   %00011100
                                .byte   %00011000
                                .byte   %00011111
                                .byte   %00000000
                                .byte   %00000010
                                .byte   %00000100
                                .byte   %00000101
                                .byte   %00000100
                                .byte   %00000010
IntroSpr1
                                .byte   %10110110
                                .byte   %10110110
                                .byte   %00111110
                                .byte   %00110110
                                .byte   %10011100
                                .byte   %00000000
                                .byte   %01101101
                                .byte   %01101101
                                .byte   %01111101
                                .byte   %01101101
                                .byte   %00111001
                                .byte   %00000000
                                .byte   %00100111
                                .byte   %10010100
                                .byte   %00010010
                                .byte   %10010001
                                .byte   %00100110
IntroSpr2
                                .byte   %00100011
                                .byte   %01110011
                                .byte   %11011011
                                .byte   %11011011
                                .byte   %11011001
                                .byte   %00000000
                                .byte   %11100110
                                .byte   %10110110
                                .byte   %11100111
                                .byte   %10110110
                                .byte   %11100111
                                .byte   %00000000
                                .byte   %00100010
                                .byte   %01010101
                                .byte   %01010101
                                .byte   %01010101
                                .byte   %00100010
IntroSpr3
                                .byte   %01100111
                                .byte   %01101101
                                .byte   %11101111
                                .byte   %01101100
                                .byte   %11000111
                                .byte   %00000000
                                .byte   %11011011
                                .byte   %11011011
                                .byte   %10011001
                                .byte   %11011000
                                .byte   %10011011
                                .byte   %00000000
                                .byte   %01100000
                                .byte   %00010000
                                .byte   %00100000
                                .byte   %00010000
                                .byte   %01100000
IntroSpr4
                                .byte   %00111110
                                .byte   %10110110
                                .byte   %10110000
                                .byte   %00110000
                                .byte   %00110000
                                .byte   %00000000
                                .byte   %11101100
                                .byte   %01101101
                                .byte   %10001101
                                .byte   %11001101
                                .byte   %11101100
                                .byte   %00000000
                                .byte   %00011000
                                .byte   %00010100
                                .byte   %00011000
                                .byte   %00010101
                                .byte   %00011001
IntroSpr5
                                .byte   %11000000
                                .byte   %11000000
                                .byte   %11000000
                                .byte   %11000000
                                .byte   %11000000
                                .byte   %00000000
                                .byte   %11100000
                                .byte   %10110000
                                .byte   %10110000
                                .byte   %10110000
                                .byte   %11100000
                                .byte   %00000000
                                .byte   %10000000
                                .byte   %10000000
                                .byte   %10000000
                                .byte   %01000000
                                .byte   %01000000

; Some space here...

; Draw a blank frame
BlankScreen	subroutine
	JSR VerticalBlank
.loop1
	LDA INTIM
	BNE .loop1
	STA WSYNC
	LDA #0
	STA VBLANK	; <--
	STA COLUBK
	STA COLUPF
	STA GRP0
	STA GRP1
	IF PAL50 = NO
	LDX #191
	JSR EatLines
	ELSE
	LDA #191
	JSR FinishScreenNtscPal
	ENDIF
	JSR OverScan
	STY PS_temp
	JSR ProcessSounds
	LDY PS_temp
	DEY
	BNE BlankScreen
	RTS

MissileStripePos
	.byte 1, 2, 3, 4, 5, 6, 4, 5

GroundColorTable
	IF PAL_COLORS = NO
	.byte $f4, $f8, $fa, $f4	; NTSC
	ELSE
	.byte $44, $48, $4a, $44	; PAL
	ENDIF

LevelPointersTable	; 12 bytes
	.byte #<LevelSpr0, #>LevelSpr0, #<LevelSpr1, #>LevelSpr1, #<LevelSpr2, #>LevelSpr2, #<LevelSpr3, #>LevelSpr3, #<Number0, #>Number0, #<Number0, #>Number0

	org $FFFC
	.word Start
	.word Start
