        PROCESSOR 6502

; Medieval Mayhem
; Last Update: November 29, 2007
; bank 1        Game Vertical Blank
; bank 2        Game Display Kernel - Dragon
;               Game Overscan2
; bank 3        Game Display Kernel - Dragon
; bank 4        Music
;               Easter Egg
;               Set Dragon Frame
; bank 5        Initialize System
;               Game Display Kernel - Bottom Castles & Scores
;               Dragon Animation Processing
; bank 6        Selection Menu Display Kernel
;               Selection Menu Overscan
;               Init New Game routines
; bank 7        Game Overscan
; bank 8        Game Display Kernel - Top Castles
;               Selection Menu Vertical Blank

NTSC            = 0
PAL             = 1
COMPILE_VERSION = NTSC
DEBUG = 0 ; set to 1 for debug info in score and to flash screen if fireball
          ; skipped due to lack of time for collision processing
          ; note - 2 extra scan lines will occur when debug mode is on
          ; to prep the displaying of the time remaining values


 IF COMPILE_VERSION = NTSC
ShieldColor1 = $62 ; Purple
ShieldColor2 = $c8 ; Green
ShieldColor3 = $44 ; Red
ShieldColor4 = $86 ; Blue

WallColor0 = $22
WallColor1 = $24
WallColor2 = $26
WallColor3 = $28
WallColor4 = $2a
WallColor5 = $2c
MenuColor  = $B8 ; Teal
ValueColor = $68 ; Purple
SlctMenuColor = $FE ; Yellow
SlctBackground = $04 ; Grey
WingColor      = $1c ; Gold
BodyColor      = $42 ; Red
OVERSCAN_DELAY = $1b
;FIREBALL_DELAY = 10
FIREBALL_DELAY = 70 ; 75 second delay for launch of extra fireball
                    ; (delay * 60) / 64
ATTRACT_DELAY = 19 ; 20 second delay for going into Attract Mode
;ATTRACT_DELAY = 5
 ELSE
ShieldColor1 = $a2 ; Purple
ShieldColor2 = $58 ; Green
ShieldColor3 = $64 ; Red
ShieldColor4 = $d6 ; Blue
WallColor0 = $42
WallColor1 = $44
WallColor2 = $46
WallColor3 = $48
WallColor4 = $4a
WallColor5 = $4c
MenuColor  = $78 ; Teal
ValueColor = $C8 ; Purple
SlctMenuColor = $2E ; Yellow
SlctBackground = $04 ; Grey
WingColor      = $2C ; Gold
BodyColor      = $62 ; Red
OVERSCAN_DELAY = $57
FIREBALL_DELAY = 59 ; 75 second delay for launch of extra fireball
                    ; (delay * 50) / 64
ATTRACT_DELAY = 16  ; 20 second delay for going into Attract Mode
 ENDIF



        MAC JUMP_TABLE ; put this at the start of every bank
        RORG $F000
InitSystem
        cmp SelectBank5   ; inits system then goes to the menu
        jmp InitSystemCode
VerticalBlankMenu
        cmp SelectBank8
        jmp VerticalBlankMenuCode
KernelMenu
	cmp SelectBank6
	jmp KernelMenuCode
VerticalBlankGame
        cmp SelectBank1
        jmp VerticalBlankGameCode
KernelGame
        cmp SelectBank8    ; draws score, top castles, dragons
        jmp KernelGameCode
KernelGameDragon
        cmp SelectBank2    ; draws bottom castles
        jmp KernelGameDragonCode
KernelGameDragon2
        cmp SelectBank3    ; draws bottom castles
        jmp KernelGameDragon2Code
KernelGameBottom
        cmp SelectBank5    ; draws bottom castles
        jmp KernelGameBottomCode
OverscanMenu2             ; Menu Entry Point if user hits SELECT
        cmp SelectBank6   ; or RESET during a game
        jmp OverscanMenu2Code
OverscanGame
        cmp SelectBank7
        jmp OverscanGameCode
OverscanGame2
        cmp SelectBank2
        jmp OverscanGame2Code
StartRound
        cmp SelectBank8
        jmp StartRoundCode
        ENDM

        MAC MUSIC_JUMP_TABLE
CallMusicFromDemoGame
        cmp SelectBank4
        jsr songPlayer
        cmp SelectBank1
        jmp MusicReturnDemoGame
CallMusicFromMainMenu
        cmp SelectBank4
        jsr songPlayer
        cmp SelectBank8
        jmp MusicReturnMainMenu
        ENDM

        MAC BANKS_AND_VECTORS ; put this at the end of every bank
        RORG $FFF4
SelectBank1 .byte $00
SelectBank2 .byte $00
SelectBank3 .byte $00
SelectBank4 .byte $00
SelectBank5 .byte $00
SelectBank6 .byte $00
SelectBank7 .byte $00
SelectBank8 .byte $00
;       .word InitSystem ; NMI and 8 overlap NMI
        .word InitSystem ; RESET
        .word InitSystem ; IRQ
        ENDM

        MAC READ_PADDLE_1
        lda INPT0         ; 3   - always 9
        bpl .save         ; 2 3
        .byte $2d         ; 4 0
.save   sty Paddle1       ; 0 3
        ENDM

        MAC READ_PADDLE_2
        lda INPT1         ; 3   - always 9
        bpl .save         ; 2 3
        .byte $2d         ; 4 0
.save   sty Paddle2       ; 0 3
        ENDM

        MAC READ_PADDLE_3
        lda INPT2         ; 3   - always 9
        bpl .save         ; 2 3
        .byte $2d         ; 4 0
.save   sty Paddle3       ; 0 3
        ENDM

        MAC READ_PADDLE_4
        lda INPT3         ; 3   - always 9
        bpl .save         ; 2 3
        .byte $2d         ; 4 0
.save   sty Paddle4       ; 0 3
        ENDM


        MAC READ_PADDLE_1_OR_2
        ldx Paddles2Read  ; 13-14  3
        lda INPT0,x       ; |      4
        bpl .save         ; |      2 3
        .byte $2c         ; |      4 0
.save   sty Paddle1,x     ; |      0 4
                          ; +-14 worse case scenerio
        ENDM

        MAC READ_PADDLE_3_OR_4
        ldx Paddles2Read  ; 13-14  3
        lda INPT2,x       ; |      4
        bpl .save         ; |      2 3
        .byte $2c         ; |      4 0
.save   sty Paddle3,x     ; |      0 4
                          ; +-14 worse case scenerio

        ENDM

        MAC READ_TWO_PADDLES
        ldx Paddles2Read   ; 21-23  3
        lda INPT0,x        ; |      4
        bpl .save1         ; |      2 3
        .byte $2c          ; |      4 0
.save1  sty Paddle1,x      ; |      0 4
        lda INPT2,x        ; |      4
        bpl .save2         ; |      2 3
        .byte $2c          ; |      4 0
.save2  sty Paddle3,x      ; |      0 4
                           ; +-23 worse case scenerio
        ENDM

        MAC SOUND_LEFT
.SOUND SET {1}
        bit GameOptions    ; test if in demo mode
        bmi .skip          ; if so, don't play sound effects
        lda SoundLeft
        cmp #SoundKingTest
        bcs .skip          ; don't interrupt the king sound
        lda #.SOUND
        sta SoundLeft
.skip
        ENDM

        MAC SOUND_RIGHT
.SOUND SET {1}
        bit GameOptions    ; test if in demo mode
        bmi .skip          ; if so, don't play sound effects
        lda SoundRight
        cmp #SoundKingTest  ; don't interrupt the king sound
        bcs .skip
        lda #.SOUND
        sta SoundRight
.skip
        ENDM

        MAC RANDOM
        lda rand
        beq .recover
        lsr
        bcc .skipEOR
.recover
        eor #$8e    ; or 95,96,A6,AF,B1,B2,B4,B8,C3,C6,D4,E1,E7,F3,FA
.skipEOR
        sta rand
        ENDM

TIA_BASE_READ_ADDRESS = $30
        include VCS.H
        include macro.h
        include graphics.h

HMOVE_L7          =  $70
HMOVE_L6          =  $60
HMOVE_L5          =  $50
HMOVE_L4          =  $40
HMOVE_L3          =  $30
HMOVE_L2          =  $20
HMOVE_L1          =  $10
HMOVE_0           =  $00
HMOVE_R1          =  $F0
HMOVE_R2          =  $E0
HMOVE_R3          =  $D0
HMOVE_R4          =  $C0
HMOVE_R5          =  $B0
HMOVE_R6          =  $A0
HMOVE_R7          =  $90
HMOVE_R8          =  $80


; PLAYER POSITIONS ON THE SCREEN
; +------+
; |1    3|
; |      |
; |4    2|
; +------+

        SEG.U VARS
        ORG $80
; song player variables for main menu- note song player scratch variables
SPbeat ds 1
SPtempoCount ds 1
SPmeasure ds 1


SoundLeft    EQU SPbeat      ; reuse of song player RAM for
SoundRight   EQU SPtempoCount ; in game sound effects


; game options
GameOptions  ds 1 ; 76543210
                  ; 7 on = Attract Mode
                  ; 6 on = Attract Mode - paddle button not yet pressed
                  ; 5 on = flash brick hit
                  ; 4 on = flash king hit
                  ; 3-2  = speed
                  ; 1-0  = fireballs
GameOptions2 ds 1 ; 76543210
                  ; 7 on = P4 limited catch
                  ; 6 on = P3 limited catch
                  ; 5 on = P2 limited catch
                  ; 4 on = P1 limited catch
                  ; 3-0 = games to win
GameOptions3 ds 1 ; 76543210
                  ; 7 on = P4 catch
                  ; 6 on = P3 catch
                  ; 5 on = P2 catch
                  ; 4 on = P1 catch
                  ; 3 on = no walls
                  ; 2 on = paddle debounce for easter egg 2
DragonDirection EQU GameOptions3
                  ; bit 0, 0=left-to-right,  1=right-to-left
ChaseSequence   EQU GameOptions3
                  ; bit 1, 0=normal, 1=chase off sequence

Wall1L       ds 6
Wall1R       ds 6
Wall2L       ds 6
Wall2R       ds 6
Wall3L       ds 6
Wall3R       ds 6
Wall4L       ds 6
Wall4R       ds 6

; reuse of Wall RAM for main menu
G48            EQU Wall1L      ; uses all of Wall1L and Wall1R
Option1        EQU Wall2L      ; pointer to graphics for 1st displayed option
Value1         EQU Wall2L+2    ; pointer to graphics for 1st displayed value
Option2        EQU Wall2L+4    ; pointer to graphics for 2nd displayed option
Value2         EQU Wall2R      ; pointer to graphics for 2nd displayed value
Option3        EQU Wall2R+2    ; pointer to graphics for 3rd displayed option
Value3         EQU Wall2R+4    ; pointer to graphics for 3rd displayed value
Option4        EQU Wall3L      ; pointer to graphics for 4th displayed option
Value4         EQU Wall3L+2    ; pointer to graphics for 4th displayed value
TopOption      EQU Wall3L+4    ; top option to display
SelectedOption EQU Wall3L+5    ; option selected(0-9)
HiLiteOption   EQU Wall3R      ; option to hilite (0-3)
BitOn          EQU Wall3R+1    ; ChangeCatch subroutine
BitOff         EQU Wall3R+2    ; ChangeCatch subroutine
LastSelect     EQU Wall3R+3    ; used to reset Attract Mode countdown

Delay          EQU Wall4R
MMcolor        EQU Wall4R+1    ; holds color of Medieval Mayhem logo
SlctValueColor EQU Wall4R+2    ; holds color of selected menu value
G48temp1       EQU Wall4R+3    ; holds lines remaining during Show48graphic
G48temp2       EQU Wall4R+4    ; holds temp image data during Show48graphic
; end reuse of Wall RAM for main menu


; reuse of Wall RAM for gameplay
; 3 bytes of RAM is allocated for the "king area" to make collision calculations
; easier.  These bytes can be reused for other information EXCEPT DURING THE
; FIREBALL COLLISION ROUTINES, WHEN THEY MUST CONTAIN ZEROS.
SPtemp16L       EQU Wall3R   ; soundPlayer scratch RAM
SPtemp16H       EQU Wall3R+1 ; soundPlayer scratch RAM
SPtemp          EQU Wall4L   ; soundPlayer scratch RAM
SPatten         EQU Wall4L+1 ; soundPlayer scratch RAM
Shield1ptr      EQU Wall1L   ; +---------------------------------+
Shield2ptr      EQU Wall2R   ; | which shield graphic to display |
Shield3ptr      EQU Wall3R   ; | during the display kernel       |
Shield4ptr      EQU Wall4L   ; +---------------------------------+
; reuse of Wall RAM for AI routnes
Distance        EQU Wall1L   ; Distance to M0 uses 3 bytes
;Distance+1     EQU Wall1L+1 ; Distance to M1
;Distance+2     EQU Wall1L+2 ; Distance to BL
MaxMoveAmount   EQU Wall2R   ; Pointer to table - uses 2 bytes
;MaxMoveAmount+1EQU Wall2R+1 ; Pointer to table
;FREE           EQU Wall2r+2 ; Free
MaxMoveAmountX  EQU Wall3R   ; how far AI player can move per frame
MaxMoveAmountY  EQU Wall3R+1 ; how far AI player can move per frame
AvoidFireball   EQU Wall3R+2 ; 1 if avoiding, when fireball got past shield
TempPaddle      EQU Wall4L   ; for reversing Player 3's paddle
Dragonptr       EQU Wall4L
;?? EQU Wall4L+1   for use during AI
;?? EQU Wall4L+2   for use during AI
; end reuse of Wall RAM

DragonColor1 ds 1
DragonColor2 ds 1
Score1       ds 2            ; stored as score * 7 in the low byte
Score2       ds 2            ; high byte for Score 1-4 is used as Temp
Score3       ds 2            ; Variables when not displaying the score
Score4       ds 2

; reuse of Score RAM
PaddleButtons   EQU Score1+1 ; used to hold paddle button state
;TempFireBallY   EQU Score2+1 ; temp holder of Fireball's Y position
BounceBackDir   EQU Score2+1 ; which way to bounce off a brick
FireBallsInPlay EQU Score2+1 ; calculated # of fireballs in play
AInotCaughtFB   EQU Score3+1 ; calculated # of fireballs AI players are holding
RowHit          EQU Score3+1 ; used during brick collision
ColHit          EQU Score4+1 ; used during brick collision
TempAdjust      EQU Score4+1 ; used during captured fireball "move" routine
AIhasFB         EQU Score4+1 ; used during AI to denote player is holding a FB
; end reuse of Score RAM

Frame        ds 1
Paddle1      ds 1
Paddle2      ds 1
Paddle3      ds 1
Paddle4      ds 1

Player1X     ds 1            ; in this order for the loop to set X positions
Player3X     ds 1            ; in this order for the loop to set X positions
M0xPosHigh   ds 1            ; in this order for the loop to set X positions
M1xPosHigh   ds 1            ; in this order for the loop to set X positions
BLxPosHigh   ds 1            ; in this order for the loop to set X positions
Player4X     ds 1
Player2X     ds 1

Player1Y     ds 1
Player2Y     ds 1
Player3Y     ds 1
Player4Y     ds 1

M0yPosLow    ds 1
M1yPosLow    ds 1
BLyPosLow    ds 1

M0yPosHigh   ds 1
M1yPosHigh   ds 1
BLyPosHigh   ds 1

M0xPosLow    ds 1
M1xPosLow    ds 1
BLxPosLow    ds 1

M0DirSpeed   ds 1
M1DirSpeed   ds 1
BLDirSpeed   ds 1

M0yEvenRow   ds 1
M1yEvenRow   ds 1
BLyEvenRow   ds 1

M0yOddRow    ds 1
M1yOddRow    ds 1
BLyOddRow    ds 1
M0State      ds 1 ; 76543210 7 on = caught
M1State      ds 1 ; 654 = all not zero used to "debounce" collision
BLState      ds 1 ; 3210 = player holding or collided with

HumanPlayers ds 1 ; 76543210 - bit on = human, 0=player1 ... 3=player4
                  ; bit 7 on = doubles

DeadPlayers  ds 1 ; 76543210
                  ; 7 bit on = Message On
                  ; 6 bit on = Game Winner
                  ; 5 bit on = Round Winner
                  ; 4 bit on = Draw
                  ; 3210 on = player 4, 3, 2, 1 dead
DragonX      ds 1
DragonFrame   ds 1 ; frame in current playback sequence (stored in DragonAnim)
DragonControl ds 1 ; 76543210
                   ; 7 bit on = dragon active
                   ; 6 bit graphic bank - 0=bank 2, 1=bank 3
                   ; 5 bit on = flyin left (flip image)
                   ; 43210 = animation frame
DragonG0     ds 2
DragonG1     ds 2
DragonShift  ds 2

ShieldDir    ds 1 ; 76543210
                  ; 76 - player 4
                  ; 54 - player 3
                  ; 32 - player 2
                  ; 10 - player 1
                  ; bit 00 = |
                  ; bit 01 = \
                  ; bit 10 = -
                  ; bit 11 = /

ScreenColor  ds 1 ; used to hide dead kings during screen flash
ExtraFireball ds 1 ; countdown for launch of extra fireball
                   ; extra fireball only launched if there's 1 in play
                   ; and the game is set for 2+ fireballs
DebugOS      ds 1
DebugVB      ds 1
M0CatchTimer ds 1 ; used to time how long fireball has been held
M1CatchTimer ds 1 ; so the fireball can be moved around the
BLCatchTimer ds 1 ; shield for self-inflicted loss of castle bricks
AIcatch      ds 1 ; bits 3-0 holds bits for catching
DragonPass  EQU AIcatch  ; uses upper nybble of AIcatch
                         ; 7 0=game mode, 1=easter egg mode
                         ; 6 0=dragon 1=knight
                         ; 5 pass (0-3)
                         ; 4 pass (0-3)
AImove       ds 1 ; bits 3-0 control player 4-1's direction when holding FB
DragonAnim EQU AImove ; upper bits hold dragon animation sequence
rand         ds 1 ; random number
TempHMOVE    ds 1; 5 bytes (also uses stack) used to store object's fine position
LimitLR      EQU TempHMOVE ; limits AI player left-right movement
LimitUD      EQU DebugVB   ; limits AI player up-down movement

 echo "----",($00FC - *) , "bytes of RAM left"
; $FC - $FF stack
; reuse of stack RAM - no JSRs can be called when these are used
Paddles2Read EQU $fd ; Paddles that will be read during the current frame
SavedLineCounter EQU $fe ; save line counter during dragon routines
DragonIndex EQU $ff ; dragon row to draw - counting UP
KingIndex EQU $ff ; king row to draw
; end reuse of stack RAM

; dragon animation data from "other banks"
TempFrame    EQU TempHMOVE
TempDuration EQU $fc



; Reuse of RAM for Castle Texture
T1 = %10101010
T2 = %01010101
CT1 EQU Score1+1
; End Reuse of RAM for Castle Texture


; dragon animation constants
SmoothFrames = 4

; dragon animation Frame Constants


FlipImage = 128
FlapSound = 64
LaunchFireball = 32

Hold0 = 0 * 32 ; for Easter Egg
Hold1 = 1 * 32 ; for Easter Egg
Hold2 = 2 * 32 ; for Easter Egg
Hold3 = 3 * 32 ; for Easter Egg

F1s1 = 0
F2s1 = 1
F3s1 = 2
F4s1 = 3
F1s2 = 4
F2s2 = 5
F3s2 = 6
F4s2 = 7
F5s2 = 8
F6s2 = 9
F7s2 = 10
F1s3 = 11
F2s3 = 12
F3s3 = 13
F4s3 = 14
F5s3 = 15
F6s3 = 16
F7s3 = 17
F8s3 = 18
F1s4 = 19
F2s4 = 20
F3s4 = 21
F4s4 = 22
F5s4 = 23
F6s4 = 24
F7s4 = 25
F1s5 = 26
F1dd = 27
F2dd = 28
F3dd = 29
F4dd = 30
F5dd = 31

; end Frame Constants

; dragon animation Duration Constants

EndSeq = 128
Speed0 = 0 * 32
Speed1 = 1 * 32
SpeedHalf = 3 * 32
SpeedQuarter = 2 * 32

Dur1 = 0
Dur2 = 1
Dur3 = 2
Dur4 = 3
Dur5 = 4
Dur6 = 5
Dur7 = 6
Dur8 = 7
Dur9 = 8
Dur10 = 9
Dur11 = 10
Dur12 = 11
Dur13 = 12
Dur14 = 13
Dur15 = 14
Dur16 = 15
Dur17 = 16
Dur18 = 17
Dur19 = 18
Dur20 = 19
Dur21 = 20
Dur22 = 21
Dur23 = 22
Dur24 = 23
Dur25 = 24
Dur26 = 25
Dur27 = 26
Dur28 = 27
Dur29 = 28
Dur30 = 29
Dur31 = 30
Dur32 = 31

; end Duration Constants



        SEG CODE


;--------------------------------------------------------------------
; bank 1 - Game Vertical Blank
;--------------------------------------------------------------------
;

        ORG $8000
        JUMP_TABLE
        MUSIC_JUMP_TABLE
 IF COMPILE_VERSION = NTSC
; AI Player Speeds
; where GameSpeed = 1(slowest) thru 4(fasest)
; Speed = GameSpeed - 1 + FireballCount - 1
; effect Speeds 0 thru 5
; X = Y * 1.2
; PAL = NTSC * 1.2
;                          N T S C                      --------SPEED---------
;             -------X-------  -------Y-------    X  Y   0   1   2   3   4   5
AIPS    .byte 0,1,1,1,1,1,1,1, 0,1,1,1,0,1,1,1 ;  7  6   P1
        .byte 2,1,1,1,2,1,1,1, 1,1,1,1,1,1,1,1 ; 10  8   P2  P1
        .byte 1,2,1,2,1,2,1,2, 2,1,1,1,2,1,1,1 ; 12 10   P3  P2  P1
        .byte 1,2,2,2,1,2,2,2, 2,1,2,1,2,1,2,1 ; 14 12   P4  P3  P2  P1
        .byte 3,2,2,2,2,2,2,2, 1,2,2,2,1,2,2,2 ; 17 14       P4  P3  P2  P1
        .byte 3,2,2,3,2,2,3,2, 2,2,2,2,2,2,2,2 ; 19 16           P4  P3  P2  P1
        .byte 2,3,3,3,2,3,3,3, 3,2,2,2,3,2,2,2 ; 22 18               P4  P3  P2
AIDEMO  .byte 3,3,3,3,3,3,3,3, 3,2,3,2,3,2,3,2 ; 24 20                   P4  P3
        .byte 4,3,3,3,4,3,3,3, 2,3,3,3,2,3,3,3 ; 26 22                       P4

 ELSE
AIplayerSpeeds
; X = NTSC Y * 1.44
; Y = NTSC Y * 1.2
;                           P A L                        --------SPEED---------
;             -------X-------  -------Y-------    X  Y   0   1   2   3   4   5
AIPS    .byte 2,1,1,1,1,1,1,1, 0,1,1,1,1,1,1,1 ;  9  7   P1
        .byte 1,2,1,2,1,2,1,2, 2,1,1,1,2,1,1,1 ; 12 10   P2  P1
        .byte 1,2,2,2,1,2,2,2, 1,2,1,2,1,2,1,2 ; 14 12   P3  P2  P1
        .byte 3,2,2,2,2,2,2,2, 1,2,2,2,1,2,2,2 ; 17 14   P4  P3  P2  P1
        .byte 3,2,3,2,3,2,3,2, 3,2,2,2,2,2,2,2 ; 20 17       P4  P3  P2  P1
        .byte 2,3,3,3,3,3,3,3, 3,2,2,3,2,2,3,2 ; 23 19           P4  P3  P2  P1
        .byte 4,3,3,3,4,3,3,3, 2,3,3,3,2,3,3,3 ; 26 22               P4  P3  P2
AIDEMO  .byte 4,4,3,4,4,3,4,3, 3,3,3,3,3,3,3,3 ; 29 24                   P4  P3
        .byte 4,4,4,4,4,4,4,4, 4,3,3,3,4,3,3,3 ; 32 26                       P4
 ENDIF



VerticalBlankGameCode
        lda #$82
        sta WSYNC
        sta VSYNC             ; 3    start vertical sync, D1=1
        sta VBLANK            ; 3  6 start vertical blank and dump paddles to ground
        lda #$2C              ; 2  8 set timer for end of Vertical Blank
        sta TIM64T            ; 4 12
        bit GameOptions
        bmi SetAIPSdemogame
        lda #<AIPS            ; 2 14
        sta MaxMoveAmount     ; 3 17
        lda #>AIPS            ; 2 19
        sta MaxMoveAmount+1   ; 3 22
        lda GameOptions       ; 3 25
        and #%00001100        ; 2 27 get speed, 0-3
        lsr                   ; 2 29
        lsr                   ; 2 31
        clc                   ; 2 33
        adc FireBallsInPlay   ; 3 36
        ldx FireBallsInPlay   ; 3 39
        beq Times16           ; 2 41 3 42   if no fireballs then don't subtract
        sec                   ; 2 43
        sbc #1                ; 2 45
Times16
        asl                   ; 2 47
        asl                   ; 2 49
        asl                   ; 2 51
        asl                   ; 2 53
        clc                   ; 2 55
        adc MaxMoveAmount     ; 3 58
        sta MaxMoveAmount     ; 4 62
        bne .sync
SetAIPSdemogame
        lda #<AIDEMO          ; 2 14
        sta MaxMoveAmount     ; 3 17
        lda #>AIDEMO          ; 2 19
        sta MaxMoveAmount+1   ; 3 22
.sync
        sta WSYNC         ; 1st line of vertical sync
	lda DeadPlayers    ; 3
	and #%00001111     ; 2 5
	eor #%00001111     ; 2 7
	and HumanPlayers   ; 3 10
	bne AhumanStillLives
	lda M0DirSpeed        ; if all humans are dead then max speed
	ora #%11100000        ; on fireballs.  Due to M0/M1/Bl swapping
	sta M0DirSpeed        ; all fireballs will be maxed in 3 frames
AhumanStillLives
        lda #0
        sta PF0
        sta PF1
;        sta PF2
        sta WSYNC         ; 2nd line of vertical sync
        RANDOM
        lda #WingColor
        sta DragonColor1
        lda #BodyColor
        sta DragonColor2
        lda #0
        inc Frame
        sta WSYNC         ; 3rd line of vertical sync
        sta VSYNC         ; stop vertical sync, D1=0


        lda DeadPlayers
        bpl CheckIfAttractMode
        bit HumanPlayers
        bmi MsgColorDoubles
        and #%00001111
        cmp #%1111
        beq MsgColorDraw
        cmp #%1110
        beq MsgColor1
        cmp #%1101
        beq MsgColor2
        cmp #%1011
        beq MsgColor3
        lda #ShieldColor4
        .byte $2c
MsgColor1
        lda #ShieldColor1
        .byte $2c
MsgColor2
        lda #ShieldColor2
        .byte $2c
MsgColor3
        lda #ShieldColor3
        sta DragonColor2
        lda Frame
        lsr
        and #$0f
        bit DeadPlayers
        bvs MsgGameColor
        .byte $2c
MsgGameColor
        ora #(WingColor & $F0)
        sta DragonColor1
        jmp CheckIfAttractMode
        .byte $2c
MsgColorDraw
        lda #WallColor0
        sta DragonColor1
        sta DragonColor2
        bne CheckIfAttractMode

MsgColorDoubles
        lda DeadPlayers
        and #%1111
        cmp #%1111
        beq MsgColorDraw
        and #%0110
        bne MsgColor1
        beq MsgColor3



CheckIfAttractMode
        bit DragonPass
        bvs PlayMusicDuringKnight
        bit GameOptions       ; Test for Attract mode
        bpl SoundEffects
PlayMusicDuringKnight
        jmp CallMusicFromDemoGame
MusicReturnDemoGame
        bit GameOptions
        bpl SoundEffects      ; Test for Attract Mode
        bit DragonControl     ; Test if Dragon is flying
        bmi skipDEMOmessage
        lda #<MessageDemoL
        sta DragonG0
        lda #>MessageDemoL
        sta DragonG0+1
        lda #<MessageDemoR
        sta DragonG1
        lda #>MessageDemoR
        sta DragonG1+1
        lda #<MessageDemoShift
        sta DragonShift
        lda #>MessageDemoShift
        sta DragonShift+1
        lda #64
        sta DragonX
        lda Frame
        lsr
        and #%00001111
        tay
        lda GreyFade,y
        sta DragonColor1
        sta DragonColor2
	lda DeadPlayers
        ora #%10000000
        sta DeadPlayers

        ; lda #15
        ; sta DragonColor1
        ; sta DragonColor2
        ; lda Frame
        ; and #%00100000     ; %00100000 = blink, %00000001 = flicker
        ; bne DemoMessageOff
        ; lda DeadPlayers
        ; ora #%10000000
        ; sta DeadPlayers
        ; bne skipDEMOmessage
; DemoMessageOff
        ; lda DeadPlayers
        ; and #%00001111
        ; sta DeadPlayers
skipDEMOmessage
        lda Frame
        and #%1
        beq .skip1AI
        jsr Player1AI
        jsr Player2AI
        jmp SetShapes
.skip1AI
        jsr Player3AI
        jsr Player4AI
        jmp SetShapes

SoundEffects
        bit DragonPass ; skip sound effects while knight onscreen as the
        bvs SkipSRdec  ; music is playing and that reuses sound effect RAM
        ldx SoundLeft
        lda SoundVol,x
        sta AUDV0
        lda SoundFreq,x
        sta AUDF0
        lda SoundChannel,x
        sta AUDC0
        beq SkipSLdec
        lda GameOptions
        and #%00010000
        beq NoFlashL
        cpx #SoundKingTest
        bcc NoFlashL
      txa
      and #$0f
      tax
        lda KingFlashColors,x ; change for cycle savings
        sta ScreenColor
NoFlashL
        dec SoundLeft

SkipSLdec
        ldx SoundRight
        lda SoundVol,x
        sta AUDV1
        lda SoundFreq,x
        sta AUDF1
        lda SoundChannel,x
        sta AUDC1
        beq SkipSRdec
        lda GameOptions
        and #%00010000
        beq NoFlashR
        cpx #SoundKingTest
        bcc NoFlashR
      txa
      and #$0f
      tax
        lda KingFlashColors,x ; change for cycle savings
        sta ScreenColor
NoFlashR
        dec SoundRight
SkipSRdec


Player1Shield
        lda HumanPlayers
        and #%0001
        beq Player1Computer
        clc                ; point MaxMove table to next player's X value
        lda MaxMoveAmount
        adc #$10
        sta MaxMoveAmount
        lda Paddle1
        bit SWCHB
        bvc .normalPaddle1
        sec
        lda #74             ; reverse paddle reading
        sbc Paddle1
.normalPaddle1
        cmp #50
        bcc P1MoveX
        adc #13 ; adding 14 as carry is set
        sta Player1Y
        lda #49
        sta Player1X
        bne Player2Shield
P1MoveX
        sta Player1X
        lda #64
        sta Player1Y
        bne Player2Shield

Player1Computer
        jsr Player1AI

Player2Shield
        lda HumanPlayers
        and #%0010
        beq Player2Computer
        clc                ; point MaxMove table to next player's X value
        lda MaxMoveAmount
        adc #$10
        sta MaxMoveAmount
        lda Paddle2
        cmp #25
        bcc P2MoveY
        adc #77 ; adding 78 as carry is set
        sta Player2X
        lda #24
        sta Player2Y
        bne Player3Shield

P2MoveY
        sta Player2Y
        lda #(152-49)
        sta Player2X
        bne Player3Shield

Player2Computer
        jsr Player2AI


Player3Shield
        lda HumanPlayers
        and #%0100
        beq Player3Computer
        clc                ; point MaxMove table to next player's X value
        lda MaxMoveAmount
        adc #$10
        sta MaxMoveAmount
        lda Paddle3
        bit SWCHB
        bpl .normalPaddle3
        sec
        lda #74              ;reverse paddle reading
        sbc Paddle3
.normalPaddle3
        sta TempPaddle
        cmp #25
        bcc P3MoveY
        adc #77; adding 78 as carry is set
        sta Player3X
        lda #64
        sta Player3Y
        bne Player4Shield
P3MoveY
        lda #89
        sbc TempPaddle
        sta Player3Y
        lda #(152-49)
        sta Player3X
        bne Player4Shield

Player3Computer
        jsr Player3AI

Player4Shield
        lda HumanPlayers
        and #%1000
        beq Player4Computer
        ; clc                 not needed here, no player 5
        ; lda MaxMoveAmount
        ; adc #$10
        ; sta MaxMoveAmount
        lda Paddle4
        cmp #50
        bcc P4MoveX
        lda #74
        sbc Paddle4
        sta Player4Y
        lda #49
        sta Player4X
        bne SetShapes
P4MoveX
        sta Player4X
        lda #24
        sta Player4Y
        bne SetShapes

Player4Computer
        jsr Player4AI


SetShapes
        lda #0
        sta ShieldDir ; set all shields as |



Player1Shape
        lda DeadPlayers
        and #%0001
        beq .1notDead
        lda #<(TopShieldDead-64)
        sta Shield1ptr
        lda #>TopShieldDead
        sta Shield1ptr+1
        bne Player3Shape
.1notDead
        lda Player1X
        cmp #44
        bcs .1notDown
        lda #%00000010 ; 10 = -
        ora ShieldDir
        sta ShieldDir
        lda #<(TopShieldFacingDown-64)
        sta Shield1ptr
        lda #>TopShieldFacingDown
        sta Shield1ptr+1
        jsr P1CaptureDown
        jmp Player3Shape
.1notDown
        lda Player1Y
        cmp #69
        bcs .1sideways
        lda #%00000011 ; 11 = /
        ora ShieldDir
        sta ShieldDir
        sec
        lda #<TopShieldFacingDiagonal
        sbc Player1Y
        sta Shield1ptr
        lda #>TopShieldFacingDiagonal
        sta Shield1ptr+1
        jsr P1CaptureDiagonal
        jmp Player3Shape
.1sideways
;       sec                already set
        lda #<TopShieldFacingSideways
        sbc Player1Y
        sta Shield1ptr
        lda #>TopShieldFacingSideways
        sta Shield1ptr+1
        jsr P1CaptureSideways

Player3Shape
        lda DeadPlayers
        and #%0100
        beq .3notDead
        lda #<(TopShieldDead-64)
        sta Shield3ptr
        lda #>TopShieldDead
        sta Shield3ptr+1
        bne Player4Shape
.3notDead
        lda Player3X
        cmp #(152-43)
        bcc .3notDown
        lda #%00100000 ; 10 = -
        ora ShieldDir
        sta ShieldDir
        lda #<(TopShieldFacingDown-64)
        sta Shield3ptr
        lda #>TopShieldFacingDown
        sta Shield3ptr+1
        jsr P3CaptureDown
        jmp Player4Shape
.3notDown
        lda Player3Y
        cmp #69
        bcs .3sideways
        lda #%00010000 ; 01 = \
        ora ShieldDir
        sta ShieldDir
        sec
        lda #<TopShieldFacingDiagonal
        sbc Player3Y
        sta Shield3ptr
        lda #>TopShieldFacingDiagonal
        sta Shield3ptr+1
        jsr P3CaptureDiagonal
        jmp Player4Shape
.3sideways
;       sec      already set
        lda #<TopShieldFacingSideways
        sbc Player3Y
        sta Shield3ptr
        lda #>TopShieldFacingSideways
        sta Shield3ptr+1
        jsr P3CaptureSideways


Player4Shape
        lda DeadPlayers
        and #%1000
        beq .4notDead
        lda #<BottomShieldDead
        sta Shield4ptr
        lda #>BottomShieldDead
        sta Shield4ptr+1
        bne Player2Shape
.4notDead
        lda Player4X
        cmp #44
        bcs .4notUp
        lda #%10000000
        ora ShieldDir
        sta ShieldDir
        lda #<BottomShieldFacingUp
        sta Shield4ptr
        lda #>BottomShieldFacingUp
        sta Shield4ptr+1
        jsr P4CaptureUp
        jmp Player2Shape
.4notUp
        lda Player4Y
        cmp #20
        bcc .4sideways
        lda #%01000000
        ora ShieldDir
        sta ShieldDir
        sec
        lda #<BottomShieldFacingDiagonal
        sbc Player4Y
        sta Shield4ptr
        lda #>BottomShieldFacingDiagonal
        sta Shield4ptr+1
        jsr P4CaptureDiagonal
        jmp Player2Shape
.4sideways
        sec
        lda #<BottomShieldFacingSideways
        sbc Player4Y
        sta Shield4ptr
        lda #>BottomShieldFacingSideways
        sta Shield4ptr+1
        jsr P4CaptureSideways

Player2Shape
        lda DeadPlayers
        and #%0010
        beq .2notDead
        lda #<BottomShieldDead
        sta Shield2ptr
        lda #>BottomShieldDead
        sta Shield2ptr+1
        bne SwitchBanks
.2notDead
        lda Player2X
        cmp #(152-43)
        bcc .2NotUp
        lda #%00001000 ; 01 = -
        ora ShieldDir
        sta ShieldDir
        lda #<BottomShieldFacingUp
        sta Shield2ptr
        lda #>BottomShieldFacingUp
        sta Shield2ptr+1
        jsr P2CaptureUp
        jmp KernelGame
.2NotUp
        lda Player2Y
        cmp #20
        bcc .2sideways
        lda #%00001100 ; 11 = /
        ora ShieldDir
        sta ShieldDir
        sec
        lda #<BottomShieldFacingDiagonal
        sbc Player2Y
        sta Shield2ptr
        lda #>BottomShieldFacingDiagonal
        sta Shield2ptr+1
        jsr P2CaptureDiagonal
        jmp KernelGame
.2sideways
        sec
        lda #<BottomShieldFacingSideways
        sbc Player2Y
        sta Shield2ptr
        lda #>BottomShieldFacingSideways
        sta Shield2ptr+1
        jsr P2CaptureSideways
SwitchBanks
        jmp KernelGame


; ---------------------------------------------------------
; FireBall Captured Routines
;
; moves captured fireball to a position relative the shield
; also preps the DirSpeed for when the fireball is released
; ---------------------------------------------------------

P1CaptureDown SUBROUTINE
        lda #%10000001
        ldx #2
.loop   cmp M0State,x
        beq .caughtBall
        dex
        bpl .loop
        rts
.caughtBall
        lda M0DirSpeed,x
        and #%11100000
        sta M0DirSpeed,x ; wipe out direction
        lda Player1X
        cmp #10
        bcc .nd16
        cmp #20
        bcc .nd15
        cmp #30
        bcc .nd14
        cmp #40
        bcc .nd13
        lda #12
        .byte $2c
.nd13   lda #13
        .byte $2c
.nd14   lda #14
        .byte $2c
.nd15   lda #15
        .byte $2c
.nd16   lda #16
.newDirection
        ora M0DirSpeed,x
        sta M0DirSpeed,x
        clc
        lda Player1X
        adc #3
        sta M0xPosHigh,x
        lda #64 ;65
        jmp FixBallRows

P1CaptureDiagonal SUBROUTINE
        lda #%10000001
        ldx #2
.loop   cmp M0State,x
        beq .caughtBall
        dex
        bpl .loop
        rts
.caughtBall
        lda M0DirSpeed,x
        and #%11100000
        ora #12
        sta M0DirSpeed,x
        clc
        lda Player1X
        adc #7 ;6
        sta M0xPosHigh,x
        lda Player1Y
        clc
        adc #0 ;2
        jmp FixBallRows

P1CaptureSideways SUBROUTINE
        lda #%10000001
        ldx #2
.loop   cmp M0State,x
        beq .caughtBall
        dex
        bpl .loop
        rts
.caughtBall
        lda M0DirSpeed,x
        and #%11100000
        sta M0DirSpeed,x  ; wipe out direction
        lda Player1Y      ; new direction based on Y value
        cmp #68
        bcc .nd12
        cmp #73
        bcc .nd11
        cmp #78
        bcc .nd10
        cmp #83
        bcc .nd9
        lda #8
        .byte $2c
.nd9    lda #9
        .byte $2c
.nd10   lda #10
        .byte $2c
.nd11   lda #11
        .byte $2c
.nd12   lda #12
        ora M0DirSpeed,x
        sta M0DirSpeed,x
        clc
        lda Player1X
        adc #7 ;6
        sta M0xPosHigh,x
        lda Player1Y
        clc
        adc #5
        jmp FixBallRows

P2CaptureUp SUBROUTINE
        lda #%10000010
        ldx #2
.loop   cmp M0State,x
        beq .caughtBall
        dex
        bpl .loop
        rts
.caughtBall
        lda M0DirSpeed,x
        and #%11100000
        sta M0DirSpeed,x ; wipe out direction
        lda Player2X     ; new direction based on X position
        cmp #143
        bcs .nd0
        cmp #133
        bcs .nd31
        cmp #123
        bcs .nd30
        cmp #113
        bcs .nd29
        lda #28
        .byte $2c
.nd29   lda #29
        .byte $2c
.nd30   lda #30
        .byte $2c
.nd31   lda #31
        .byte $2c
.nd0    lda #0
        ora M0DirSpeed,x
        sta M0DirSpeed,x
        clc
        lda Player2X
        adc #3
        sta M0xPosHigh,x
        lda #32 ;31
        jmp FixBallRows

P2CaptureDiagonal SUBROUTINE
        lda #%10000010
        ldx #2
.loop   cmp M0State,x
        beq .caughtBall
        dex
        bpl .loop
        rts
.caughtBall
        lda M0DirSpeed,x
        and #%11100000
        ora #28
        sta M0DirSpeed,x
        clc
        lda Player2X
        adc #255 ;0
        sta M0xPosHigh,x
        lda Player2Y
        clc
        adc #8 ;6
        jmp FixBallRows

P2CaptureSideways SUBROUTINE
        lda #%10000010
        ldx #2
.loop   cmp M0State,x
        beq .caughtBall
        dex
        bpl .loop
        rts
.caughtBall
        lda M0DirSpeed,x
        and #%11100000
        sta M0DirSpeed,x
        lda Player2Y
        cmp #5
        bcc .nd24
        cmp #10
        bcc .nd25
        cmp #15
        bcc .nd26
        cmp #20
        bcc .nd27
        lda #28
        .byte $2c
.nd27   lda #27
        .byte $2c
.nd26   lda #26
        .byte $2c
.nd25   lda #25
        .byte $2c
.nd24   lda #24
        ora M0DirSpeed,x
        sta M0DirSpeed,x
        clc
        lda Player2X
        adc #255 ;0
        sta M0xPosHigh,x
        lda Player2Y
        clc
        adc #3
        jmp FixBallRows

P3CaptureDown SUBROUTINE
        lda #%10000100
        ldx #2
.loop   cmp M0State,x
        beq .caughtBall
        dex
        bpl .loop
        rts
.caughtBall
        lda M0DirSpeed,x
        and #%11100000
        sta M0DirSpeed,x ; wipe out direction
        lda Player3X     ; new direction based on X position
        cmp #143
        bcs .nd16
        cmp #133
        bcs .nd17
        cmp #123
        bcs .nd18
        cmp #113
        bcs .nd19
        lda #20
        .byte $2c
.nd19   lda #19
        .byte $2c
.nd18   lda #18
        .byte $2c
.nd17   lda #17
        .byte $2c
.nd16   lda #16
        ora M0DirSpeed,x
        sta M0DirSpeed,x
        clc
        lda Player3X
        adc #3
        sta M0xPosHigh,x
        lda #64 ;65
        jmp FixBallRows

P3CaptureDiagonal SUBROUTINE
        lda #%10000100
        ldx #2
.loop   cmp M0State,x
        beq .caughtBall
        dex
        bpl .loop
        rts
.caughtBall
        lda M0DirSpeed,x
        and #%11100000
        ora #20
        sta M0DirSpeed,x
        clc
        lda Player3X
        adc #255 ;0
        sta M0xPosHigh,x
        lda Player3Y
        clc
        adc #0 ;2
        jmp FixBallRows

P3CaptureSideways SUBROUTINE
        lda #%10000100
        ldx #2
.loop   cmp M0State,x
        beq .caughtBall
        dex
        bpl .loop
        rts
.caughtBall
        lda M0DirSpeed,x
        and #%11100000
        sta M0DirSpeed,x  ; wipe out direction
        lda Player3Y      ; new direction based on Y value
        cmp #68
        bcc .nd20
        cmp #73
        bcc .nd21
        cmp #78
        bcc .nd22
        cmp #83
        bcc .nd23
        lda #24
        .byte $2c
.nd23   lda #23
        .byte $2c
.nd22   lda #22
        .byte $2c
.nd21   lda #21
        .byte $2c
.nd20   lda #20
        ora M0DirSpeed,x
        sta M0DirSpeed,x
        clc
        lda Player3X
        adc #255 ;0
        sta M0xPosHigh,x
        lda Player3Y
        clc
        adc #5
        jmp FixBallRows

P4CaptureUp SUBROUTINE
        lda #%10001000
        ldx #2
.loop   cmp M0State,x
        beq .caughtBall
        dex
        bpl .loop
        rts
.caughtBall
        lda M0DirSpeed,x
        and #%11100000
        sta M0DirSpeed,x ; wipe out direction
        lda Player4X
        cmp #10
        bcc .nd0
        cmp #20
        bcc .nd1
        cmp #30
        bcc .nd2
        cmp #40
        bcc .nd3
        lda #4
        .byte $2c
.nd3    lda #3
        .byte $2c
.nd2    lda #2
        .byte $2c
.nd1    lda #1
        .byte $2c
.nd0    lda #0

        ora M0DirSpeed,x
        sta M0DirSpeed,x
        clc
        lda Player4X
        adc #3
        sta M0xPosHigh,x
        lda #32 ;31
        jmp FixBallRows

P4CaptureDiagonal SUBROUTINE
        lda #%10001000
        ldx #2
.loop   cmp M0State,x
        beq .caughtBall
        dex
        bpl .loop
        rts
.caughtBall
        lda M0DirSpeed,x
        and #%11100000
        ora #4
        sta M0DirSpeed,x
        clc
        lda Player4X
        adc #7 ;6
        sta M0xPosHigh,x
        lda Player4Y
        clc
        adc #8 ;6
        jmp FixBallRows

P4CaptureSideways SUBROUTINE
        lda #%10001000
        ldx #2
.loop   cmp M0State,x
        beq .caughtBall
        dex
        bpl .loop
        rts
.caughtBall
        lda M0DirSpeed,x
        and #%11100000
        sta M0DirSpeed,x ; wipe out direction
        lda Player4Y     ; new direction based on Y position
        cmp #5
        bcc .nd8
        cmp #10
        bcc .nd7
        cmp #15
        bcc .nd6
        cmp #20
        bcc .nd5
        lda #4
        .byte $2c
.nd5    lda #5
        .byte $2c
.nd6    lda #6
        .byte $2c
.nd7    lda #7
        .byte $2c
.nd8    lda #8
        ora M0DirSpeed,x
        sta M0DirSpeed,x
        clc
        lda Player4X
        adc #7 ; 6
        sta M0xPosHigh,x
        lda Player4Y
        clc
        adc #3
;       jmp FixBallRows

FixBallRows
         sta M0yPosHigh,x
        ; sta M0yEvenRow,x
        ; sta M0yOddRow,x
        ; and #1
        ; beq .decOdd
        ; dec M0yEvenRow,x
        ; rts
; .decOdd dec M0yOddRow,x
.1dead  rts



; KingFlash
        ; lda GameOptions
        ; and #%00010000
        ; beq NoFlash
        ; cpx #SoundKingTest
        ; bcc NoFlash
        ; txa
        ; asl
        ; asl
        ; asl
        ; asl
        ; ora #%1111
        ; sta ScreenColor
; NoFlash
; .1dead  rts


Player1AI   ; player 1 range x = 0-19 y = 64-88
        lda DeadPlayers
        and #%00000001
        bne .1dead
;        lda #0
        sta LimitLR  ; set Leftmost limit
        lda #88
        sta LimitUD  ; set Upmost limit
        lda Frame
        and #%00000111
        tay
        lda (MaxMoveAmount),y
        sta MaxMoveAmountX
        clc                  ; point MaxMove table to Y value
        lda MaxMoveAmount
        adc #8
        sta MaxMoveAmount
        lda (MaxMoveAmount),y
        sta MaxMoveAmountY
;        clc
        lda MaxMoveAmount
        adc #8                ; point MaxMove table to next player's X value
        sta MaxMoveAmount
        lda FireBallsInPlay
        bne .1ballDistances
        clc
        lda DragonX           ; no fireballs so track dragon
        adc #10
        tax
        ldy #48
        jmp .1doneXadjust
.1ballDistances
        ldx #2
        stx AIhasFB     ; >0 means AI does not have a fireball
.1distanceLoop
        lda #%10000001
        and M0State,x
        cmp #%10000001
        beq .1ignore         ; ignore fireballs we've caught
        lda M0yPosHigh,x
        bmi .1next           ; skip if not active (Distance already 255)
.1inPlay
        ldy M0xPosHigh,x
        lda ValueSquaredX,y
        sta Distance,x
        sec
        lda #95
        sbc M0yPosHigh,x
        tay
        lda ValueSquaredY,y
        clc
        adc Distance,x
	bcc .1store
; 10-1-06 test with 255, ignore far away fireballs
;       lda #254             ; store 254 to denote live but "far away"
;	.byte $2c
.1ignore
	lda #255      ; < 0 means AI has a fireball
        sta AIhasFB
.1store
        sta Distance,x
.1next
        dex
        bpl .1distanceLoop

        lda AIhasFB     ; does the AI have a fireball?
        bpl .1compare
        lda AInotCaughtFB  ; are all fireballs AI caught?
        beq .1AImovement   ; then move back/forth
.1compare
        ;compare M0 M1
	lda Distance
	cmp Distance+1
        bcc .1testM0BL       ; M0 is closest so check M0 against BL

        ; compare M1 BL
        lda Distance+1
        cmp Distance+2
        bcc .1m1Closest
.1blClosest
        ldx #2           ; BL is closest
        bne .1checkCaught
.1m1Closest
        ldx #1
        bne .1checkCaught

        ; compare M0 BL
.1testM0BL
        lda Distance
        cmp Distance+2
        bcs .1blClosest
        ldx #0

.1checkCaught
        lda Distance,x
        cmp #255
        bne .1trackBall
.1AImovement
        lda AImove       ; we're tracking the caught fireball so
        and #%0001       ; move instead of track (back-forth movement)
        beq .1skip
        lda DeadPlayers
        and #%00001000   ; is player 4 dead?
        beq .1_4notdead
        lda #20          ; set limit
        sta LimitLR
.1_4notdead
        ldx #0           ; move shield to leftmost position
        ldy #48
        bne .1follow
.1skip
        lda DeadPlayers
        and #%00000100   ; is player 3 dead?
        beq .1_3notdead
        lda #78
        sta LimitUD
.1_3notdead
        ldx #100         ; move shield to rightmost position
        ldy #95
        bne .1follow


.1trackBall
        lda M0yPosHigh,x ; get the fireball y position
        tay              ; store in Y then adjust to
        beq .1doneYadjust; "center" the tracking
        dey
        beq .1doneYadjust
        dey
        beq .1doneYadjust
        dey
        beq .1doneYadjust
        dey

.1doneYadjust
	cpy #88
	bcc .1adjustX
TestBreak1
	ldy #88
.1adjustX
        lda M0xPosHigh,x ; get the fireball x position
        tax               ; store in X then adjust to
        beq .1doneXadjust ; "center" the tracking
        dex
        beq .1doneXadjust
        dex
        beq .1doneXadjust
        dex

.1doneXadjust
        cpx #48         ; +0 test left, +0 bcs
        bcs .1follow    ; left of ball >= 48
        cpy #71-4         ; +0 test top, +0 bcs
        bcs .1avoid     ; top of ball >= 71

; if ballX < playerX then   ; is ball to the left?
;    if PlayerY = 64 then   ; does player need to move down first?
;       move left
;    else
;       move down
;    endif
; elseif ballX > playerX then
;    if playerX < 103 then   ; is player at rightmost position?
;       move right          ;  no, so move right
;    elseif ballY < playerY ; is ball below player?
;       move down           ;   yep, move down
;    elseif bally > playerY ; is ball above player?
;       move up             ;   yep, move up
;    endif
; endif
.1follow
        cpx Player1X
        bcc .1tentativeLeft
        bne .1tentativeRight
        lda #%0001    ; stop stuck at edge player
        eor AImove
        sta AImove
        rts

.1tentativeLeft
        lda Player1Y
        cmp #64
        beq AImove1left
        jmp AImove1down

.1tentativeRight
        lda Player1X
        cmp #49
        bcc AImove1right
        cpy Player1Y
        bcc AImove1down
        bne AImove1up
        lda #%0001   ; stop stuck at edge player
        eor AImove
        sta AImove
        rts

; if ballx < playerx then
;    if PlayerX < 49 then
;       move right
;    else
;       move down
;    endif
; else
;    move left
; endif
.1avoid
        lda #1
        sta AvoidFireball
        cpx Player1X
        bcs AImove1left
        lda Player1X
        cmp #49
        bcc AImove1right
        bcs AImove1down



AImove1left              ; move player 1 left
        sec
        lda Player1X
        sbc MaxMoveAmountX
        bpl .test1Xl     ; if value went negative
        lda #0           ; then reset to 0
.test1Xl
        cmp LimitLR
        bcs .store1Xl
        lda LimitLR
.store1Xl
        sta Player1X
        cmp LimitLR
        bne .test1leftovershoot
        lda #%0001       ; change direction of caught fireball motion
        eor AImove
        sta AImove
.test1leftovershoot
        cpx Player1X
        bcc .exit1left
        lda AvoidFireball
        bne .exit1left
        stx Player1X
.exit1left
        rts

AImove1right
        clc
        lda Player1X
        adc MaxMoveAmountX
        cmp #49
        bcc .store1Xr
        lda #49
.store1Xr
        sta Player1X
        cpx Player1X
        bcs .exit1right
        lda AvoidFireball
        bne .exit1right
        stx Player1X
.exit1right
        rts

AImove1up
        clc
        lda Player1Y
        adc MaxMoveAmountY
        cmp LimitUD
        bcc .store1Yu
        lda LimitUD
.store1Yu
        sta Player1Y
        cmp LimitUD
        bne .test1upovershoot
        lda #%0001       ; change direction of caught fireball motion
        eor AImove
        sta AImove
.test1upovershoot
        cpy Player1Y
        bcs .exit1up
        lda AvoidFireball
        bne .exit1up
        sty Player1Y
.exit1up
        rts

AImove1down
        sec
        lda Player1Y
        sbc MaxMoveAmountY
        cmp #64
        bcs .store1Yd
        lda #64
.store1Yd
        sta Player1Y
        cpy Player1Y
        bcc .exit1down
        lda AvoidFireball
        bne .exit1down
        sty Player1Y
.exit1down
.2dead
        rts




Player2AI   ; player 2 range x = 102-152 y = 0-24
        lda DeadPlayers
        and #%00000010
        bne .2dead
;        lda #0
        sta LimitUD  ; set Downmost limit
        lda #152
        sta LimitLR  ; set Rightmost limit

        lda Frame
        and #%00000111
        tay
        lda (MaxMoveAmount),y
        sta MaxMoveAmountX
        clc                  ; point MaxMove table to Y value
        lda MaxMoveAmount
        adc #8
        sta MaxMoveAmount
        lda (MaxMoveAmount),y
        sta MaxMoveAmountY
;        clc
        lda MaxMoveAmount
        adc #8                ; point MaxMove table to next player's X value
        sta MaxMoveAmount
        lda FireBallsInPlay
        bne .2ballDistances
        clc
        lda DragonX           ; no fireballs so track dragon
        adc #10
        tax
        ldy #48
        jmp .2doneXadjust
.2ballDistances
        ldx #2
        stx AIhasFB
.2distanceLoop
        lda #%10000010
        and M0State,x
        cmp #%10000010
        beq .2ignore
        lda M0yPosHigh,x
        bmi .2next
.2inPlay
        sec
        lda #158
        sbc M0xPosHigh,x
        tay
        lda ValueSquaredX,y
        sta Distance,x
        ldy M0yPosHigh,x
        lda ValueSquaredY,y
        clc
        adc Distance,x
	bcc .2store
; 10-1-06 test with 255, ignore far away fireballs
;	lda #254 ; denotes "live but far away"
;	.byte $2c
.2ignore

	lda #255
        sta AIhasFB
.2store
        sta Distance,x
.2next
        dex
        bpl .2distanceLoop

        lda AIhasFB
        bpl .2compare
        lda AInotCaughtFB
        beq .2AImovement
.2compare
        ;compare M0 M1
        lda Distance
        sbc Distance+1
        bcc .2testM0BL

        ; compare M1 BL
        lda Distance+1
        sbc Distance+2
        bcc .2m1Closest
.2blClosest
        ldx #2           ; BL is closest
        bne .2checkCaught
.2m1Closest
        ldx #1
        bne .2checkCaught

        ; compare M0 BL
.2testM0BL
        lda Distance
        sbc Distance+2
        bcs .2blClosest
        ldx #0

.2checkCaught
        lda Distance,x
        cmp #255
        bne .2trackBall
.2AImovement
        lda AImove
        and #%0010
        beq .2skip
        lda DeadPlayers
        and #%00000100 ; is player 3 dead?
        beq .2_3notdead
        lda #132
        sta LimitLR
.2_3notdead
        ldx #158
        ldy #48
        bne .2follow
.2skip
        lda DeadPlayers ; is player 4 dead?
        and #%00001000   ; is player 4 dead?
        beq .2_4notdead
        lda #10
        sta LimitUD
.2_4notdead
        ldx #0
        ldy #0
        beq .2follow

.2trackBall
        lda M0yPosHigh,x ; get the fireball y position
        tay              ; store in Y then adjust to
        beq .2doneYadjust; "center" the tracking
        dey
        beq .2doneYadjust
        dey
        beq .2doneYadjust
        dey
        beq .2doneYadjust
        dey

.2doneYadjust
        lda M0xPosHigh,x ; get the fireball x position
        tax               ; store in X then adjust to
        beq .2doneXadjust ; "center" the tracking
        dex
        beq .2doneXadjust
        dex
        beq .2doneXadjust
        dex

.2doneXadjust
        cpx #111 + 1 +1  ; +1 test right, +1 bcc
        bcc .2follow     ; right of ball <= 111
        cpy #24+1+1      ; +1 test bottom, +1 bcc
        bcc .2avoid      ; bottom of ball <= 24
; if ballX < playerX then   ; is ball to the left?
;    if PlayerX > 103 then  ; is player at leftmost position?
;       move left           ;   no, so move left
;    elseif ballY < playerY ; is ball below player?
;       move down           ;   yep, move down
;    elseif ballY > PlayerY ; is ball above player?
;       move up             ;   yep, move up
;    endif
; elseif ballX > playerX then
;    if PlayerY = 24 then   ; is player at topmost position?
;       move right          ;   yep, move right
;    else
;       move up             ; player needs to move down first
;    endif
; endif
.2follow
        cpx Player2X
        bcc .2tentativeLeft
        bne .2tentativeRight
        lda #%0010
        eor AImove
        sta AImove
        rts

.2tentativeLeft
        lda Player2X
        cmp #103+1          ;carry set on >=, so compare 104
        bcs AImove2left
        cpy Player2Y
        bcc AImove2down
        bne AImove2up
        lda #%0010
        eor AImove
        sta AImove
        rts

.2tentativeRight
       lda Player2Y
       cmp #24
       beq AImove2right
       jmp AImove2up

; if ballX < playerX then
;    move right
; else
;    if PlayerX > 103
;       move left
;    else
;       move up
;    endif
; endif
.2avoid
        lda #1
        sta AvoidFireball
        cpx Player2X
        bcc AImove2right
        lda Player2X
        cmp #103
        bcs AImove2left
        bcc AImove2up



AImove2left              ; move player 2 left
        sec
        lda Player2X
        sbc MaxMoveAmountX
        cmp #103
        bcs .store2Xl    ; if value went negative
        lda #103           ; then reset to 102
.store2Xl
        sta Player2X
        cpx Player2X
        bcc .exit2left
        lda AvoidFireball
        bne .exit2left
        stx Player2X
.exit2left
        rts

AImove2right
        clc
        lda Player2X
        adc MaxMoveAmountX
        cmp LimitLR
        bcc .store2Xr
        lda LimitLR
.store2Xr
        sta Player2X
        cmp LimitLR
        bne .test2rightovershoot
        lda #%0010    ; change AI direction
        eor AImove
        sta AImove
.test2rightovershoot
        cpx Player2X
        bcs .exit2right
        lda AvoidFireball
        bne .exit2right
        stx Player2X
.exit2right
        rts

AImove2up
        clc
        lda Player2Y
        adc MaxMoveAmountY
        cmp #24
        bcc .store2Yu
        lda #24
.store2Yu
        sta Player2Y
        cpy Player2Y
        bcs .exit2up
        lda AvoidFireball
        bne .exit2up
        sty Player2Y
.exit2up
        rts

AImove2down
        sec
        lda Player2Y
        sbc MaxMoveAmountY
        bpl .test2Yd
        lda #0
.test2Yd
        cmp LimitUD
        bcs .store2Yd
        lda LimitUD
.store2Yd
        sta Player2Y
        cmp LimitUD
        bne .test2downovershoot
        lda #%0010    ; change AI direction
        eor AImove
        sta AImove
.test2downovershoot
        cpy Player2Y
        bcc .exit2down
        lda AvoidFireball
        bne .exit2down
        sty Player2Y
.exit2down
.3dead
        rts




Player3AI  ; player 3 range x = 103-152 y = 64-88
        lda DeadPlayers
        and #%00000100
        bne .3dead
        lda #88
        sta LimitUD  ; set Upmost limit
        lda #152
        sta LimitLR  ; set Rightmost limit

        lda Frame
        and #%00000111
        tay
        lda (MaxMoveAmount),y
        sta MaxMoveAmountX
        clc                  ; point MaxMove table to Y value
        lda MaxMoveAmount
        adc #8
        sta MaxMoveAmount
        lda (MaxMoveAmount),y
        sta MaxMoveAmountY
;        clc
        lda MaxMoveAmount
        adc #8                ; point MaxMove table to next player's X value
        sta MaxMoveAmount
        lda FireBallsInPlay
        bne .3ballDistances
        clc
        lda DragonX           ; no fireballs so track dragon
        adc #10
        tax
        ldy #48
        jmp .3doneXadjust

.3ballDistances
        ldx #2
        stx AIhasFB
.3distanceLoop
        lda #%10000100
        and M0State,x
        cmp #%10000100
        beq .3ignore
        lda M0yPosHigh,x
        bmi .3next
.3inPlay
        sec
        lda #158
        sbc M0xPosHigh,x
        tay
        lda ValueSquaredX,y
        sta Distance,x
        sec
        lda #95
        sbc M0yPosHigh,x
        tay
        lda ValueSquaredY,y
        clc
        adc Distance,x
	bcc .3store
; 10-1-06 test with 255, ignore far away fireballs
;	lda #254        ; store 254 to denote live but "far away"
;	.byte $2c
.3ignore
	lda #255
        sta AIhasFB
.3store
        sta Distance,x
.3next
        dex
        bpl .3distanceLoop

        lda AIhasFB
        bpl .3compare
        lda AInotCaughtFB
        beq .3AImovement

.3compare
        ;compare M0 M1
        lda Distance
        cmp Distance+1
        bcc .3testM0BL

        ; compare M1 BL
        lda Distance+1
        cmp Distance+2
        bcc .3m1Closest
.3blClosest
        ldx #2           ; BL is closest
        bne .3checkCaught
.3m1Closest
        ldx #1
        bne .3checkCaught

        ; compare M0 BL
.3testM0BL
        lda Distance
        cmp Distance+2
        bcs .3blClosest
        ldx #0

.3checkCaught
        lda Distance,x
        cmp #255
        bne .3trackBall
.3AImovement
        lda AImove
        and #%0100
        beq .3skip
        lda DeadPlayers
        and #%00000010 ; is player 2 dead?
        beq .3_2notdead
        lda #132
        sta LimitLR
.3_2notdead
        ldx #158
        ldy #48
        bne .3follow
.3skip
        lda DeadPlayers
        and #%00000001 ; is player 1 dead?
        beq .3_1notdead
        lda #78
        sta LimitUD
.3_1notdead
        ldx #0
        ldy #95
        bne .3follow

.3trackBall
        lda M0yPosHigh,x ; get the fireball y position
        tay              ; store in Y then adjust to
        beq .3doneYadjust; "center" the tracking
        dey
        beq .3doneYadjust
        dey
        beq .3doneYadjust
        dey
        beq .3doneYadjust
        dey

.3doneYadjust
	cpy #88
	bcc .3adjustX
TestBreak3
	ldy #88
.3adjustX
        lda M0xPosHigh,x ; get the fireball x position
        tax               ; store in X then adjust to
        beq .3doneXadjust ; "center" the tracking
        dex
        beq .3doneXadjust
        dex
        beq .3doneXadjust
        dex

.3doneXadjust
        cpx #111 + 1 +1  ; +1 test right, +1 bcc
        bcc .3follow     ; right of ball <= 111
        cpy #67-1        ; +0 test top, +0 bcs
        bcs .3avoid      ; top of ball >= 71
; if ballX < playerX then   ; is ball to the left?
;    if PlayerX > 103 then  ; is player at leftmost position?
;       move left           ;   no, so move left
;    elseif ballY < playerY ; is ball below player?
;       move down           ;   yep, move down
;    elseif ballY > PlayerY ; is ball above player?
;       move up             ;   yep, move up
;    endif
; elseif ballX > playerX then
;    if PlayerY = 64 then   ; is player at bottommost position?
;       move right          ;   yep, move right
;    else
;       move down           ; player needs to move down first
;    endif
; endif

.3follow
        lda #0
        sta AvoidFireball
        cpx Player3X
        bcc .3tentativeLeft
        bne .3tentativeRight
        lda #%0100
        eor AImove
        sta AImove
        rts

.3tentativeLeft
        lda Player3X
        cmp #103+1          ;carry set on >=, so compare 104
        bcs AImove3left
        cpy Player3Y
        bcc AImove3down
        bne AImove3up
        lda #%0100
        eor AImove
        sta AImove
        rts

.3tentativeRight
       lda Player3Y
       cmp #64
       beq AImove3right
       jmp AImove3down

; if ballx < playerX then
;    move right
; else
;    if playerX > 103
;       move left
;    else
;       move down
;    endif
; endif
.3avoid
        lda #1
        sta AvoidFireball
        cpx Player3X
        bcc AImove3right
        lda Player3X
        cmp #103
        bcs AImove3left
        bcc AImove3down

AImove3left              ; move player 3 left
        sec
        lda Player3X
        sbc MaxMoveAmountX
        cmp #103
        bcs .store3left    ; if value went negative
        lda #103           ; then reset to 103
.store3left
        sta Player3X
        cpx Player3X       ; did we overshoot
        bcc .exit3left
        lda AvoidFireball
        bne .exit3left
        stx Player3X
.exit3left
        rts

AImove3right
        clc
        lda Player3X
        adc MaxMoveAmountX
        cmp LimitLR
        bcc .store3right
        lda LimitLR
.store3right
        sta Player3X
        cmp LimitLR
        bne .test3rightovershoot
        lda #%0100   ; change AI direction
        eor AImove
        sta AImove
.test3rightovershoot
        cpx Player3X
        bcs .exit3right
        lda AvoidFireball
        bne .exit3right
        stx Player3X
.exit3right
        rts

AImove3up
        clc
        lda Player3Y
        adc MaxMoveAmountY
        cmp LimitUD
        bcc .store3up
        lda LimitUD
.store3up
        sta Player3Y
        cmp LimitUD
        bne .test3upovershoot
        lda #%0100       ; change AI direction
        eor AImove
        sta AImove
.test3upovershoot
        cpy Player3Y
        bcs .exit3up
        lda AvoidFireball
        bne .exit3up
        sty Player3Y
.exit3up
        rts

AImove3down
        sec
        lda Player3Y
        sbc MaxMoveAmountY
        cmp #64
        bcs .store3down
        lda #64
.store3down
        sta Player3Y
        cpy Player3Y
        bcc .exit3down
        lda AvoidFireball
        bne .exit3down
        sty Player3Y
.exit3down
.4dead
        rts



Player4AI  ; player 4 range x = 0-49 y = 0-24
        lda DeadPlayers
        and #%00001000
        bne .4dead
;        lda #0
        sta LimitLR  ; set Leftmost limit
;        lda #0
        sta LimitUD  ; set Downmost limit

        lda Frame
        and #%00000111
        tay
        lda (MaxMoveAmount),y
        sta MaxMoveAmountX
        clc                  ; point MaxMove table to Y value
        lda MaxMoveAmount
        adc #8
        sta MaxMoveAmount
        lda (MaxMoveAmount),y
        sta MaxMoveAmountY
;        clc                   ; not needed - no player 5
;        lda MaxMoveAmount
;        adc #8                ; point MaxMove table to next player's X value
;        sta MaxMoveAmount
        lda FireBallsInPlay
        bne .4ballDistances
        clc
        lda DragonX           ; no fireballs so track dragon
        adc #10
        tax
        ldy #48
        jmp .4doneXadjust
.4ballDistances
        ldx #2
        stx AIhasFB
.4distanceLoop
        lda #%10001000
        and M0State,x
        cmp #%10001000
        beq .4ignore
        lda M0yPosHigh,x
        bmi .4next
.4inPlay
        ldy M0xPosHigh,x
        lda ValueSquaredX,y
        sta Distance,x
        ldy M0yPosHigh,x
        lda ValueSquaredY,y
        clc
        adc Distance,x
	bcc .4store
; 10-1-06 test with 255, ignore far away fireballs
;	lda #254       ; store 254 to denote live but far away
;	.byte $2c
.4ignore
	lda #255
        sta AIhasFB
.4store
        sta Distance,x
.4next
        dex
        bpl .4distanceLoop

        lda AIhasFB
        bpl .4compare
        lda AInotCaughtFB
        beq .4AImovement

.4compare
        ;compare M0 M1
        lda Distance
        sbc Distance+1
        bcc .4testM0BL

        ; compare M1 BL
        lda Distance+1
        cmp Distance+2
        bcc .4m1Closest
.4blClosest
        ldx #2           ; BL is closest
        bne .4checkCaught
.4m1Closest
        ldx #1
        bne .4checkCaught

        ; compare M0 BL
.4testM0BL
        lda Distance
        cmp Distance+2
        bcs .4blClosest
        ldx #0

.4checkCaught
        lda Distance,x
        cmp #255
        bne .4trackBall
.4AImovement
        lda AImove
        and #%1000
        beq .4skip
        lda DeadPlayers
        and #%00000001 ; is player 1 dead?
        beq .4_1notdead
        lda #20
        sta LimitLR
.4_1notdead
        ldx #0
        ldy #48
        bne .4follow
.4skip
        lda DeadPlayers
        and #%00000010 ; is player 2 dead?
        beq .4_2notdead
        lda #10
        sta LimitUD
.4_2notdead
        ldx #100
        ldy #0
        beq .4follow

.4trackBall
        lda M0yPosHigh,x ; get the fireball y position
        tay              ; store in Y then adjust to
        beq .4doneYadjust; "center" the tracking
        dey
        beq .4doneYadjust
        dey
        beq .4doneYadjust
        dey
        beq .4doneYadjust
        dey

.4doneYadjust
        lda M0xPosHigh,x  ; get the fireball x position
        tax               ; store in X then adjust to
        beq .4doneXadjust ; "center" the tracking
        dex
        beq .4doneXadjust
        dex
        beq .4doneXadjust
        dex

.4doneXadjust
; decide if we're going to follow or avoid the fireball
        cpx #48      ; +0 test left, +0 bcs
        bcs .4follow ; left of ball >= 48
        cpy #24+1+1  ; +1 test bottom, +1 bcc
        bcc .4avoid  ; bottom of ball <= 24
; if ballX < playerX then   ; is ball to the left?
;    if PlayerY = 24 then   ; does player need to move up first?
;       move left
;    else
;       move up
;    endif
; elseif ballX > playerX then
;    if playerX < 49 then   ; is player at rightmost position?
;       move right          ;  no, so move right
;    elseif ballY < playerY ; is ball below player?
;       move down           ;   yep, move down
;    elseif bally > playerY ; is ball above player?
;       move up             ;   yep, move up
;    endif
; endif
.4follow
        lda #0
        sta AvoidFireball
        cpx Player4X
        bcc .4tentativeLeft
        bne .4tentativeRight
        lda #%1000
        eor AImove
        sta AImove
        rts

.4tentativeLeft
        lda Player4Y
        cmp #24
        beq AImove4left
        jmp AImove4up

.4tentativeRight
        lda Player4X
        cmp #49
        bcc AImove4right
        cpy Player4Y
        bcc AImove4down
        bne AImove4up
        lda #%1000
        eor AImove
        sta AImove
        rts
; if ballX < playerX then ; is ball to the left
;   if PlayerX < 49 then  ; is player at rightmost position?
;      move right         ; no, so move right
;   else
;      move up            ; yep, move towards corner
;   endif
; else
;    move left             ; ball is to right, so move left
; endif
.4avoid
        lda #1
        sta AvoidFireball
        cpx Player4X
        bcs AImove4left
        lda Player4X
        cmp #49
        bcc AImove4right
        bcs AImove4up

AImove4left              ; move player 4 left
        sec
        lda Player4X
        sbc MaxMoveAmountX
        bpl .test4xl  ; if value went negative
        lda #0           ; then reset to 0
.test4xl
        cmp LimitLR
        bcs .store4left
        lda LimitLR
.store4left
        sta Player4X
        cmp LimitLR
        bne .test4leftovershoot
        lda #%1000      ; change AI direction
        eor AImove
        sta AImove
.test4leftovershoot
        cpx Player4X     ; did we overshoot?
        bcc .exit4left
        lda AvoidFireball
        bne .exit4left
        stx Player4X     ; if so, adjust to eliminate shield jitter
.exit4left
        rts

AImove4right
        clc
        lda Player4X
        adc MaxMoveAmountX
        cmp #49
        bcc .store4right
        lda #49
.store4right
        sta Player4X
        cpx Player4X    ; did we overshoot?
        bcs .exit4right
        lda AvoidFireball
        bne .exit4right
        stx Player4X    ; if so, adjust to eliminate shield jitter
.exit4right
        rts

AImove4up
        clc
        lda Player4Y
        adc MaxMoveAmountY
        cmp #24
        bcc .store4up
        lda #24
.store4up
        sta Player4Y
        cpy Player4Y
        bcs .exit4up
        lda AvoidFireball
        bne .exit4up
        sty Player4Y
.exit4up
        rts

AImove4down
        sec
        lda Player4Y
        sbc MaxMoveAmountY
        bpl .test4down
        lda #0
.test4down
        cmp LimitUD
        bcs .store4down
        lda LimitUD
.store4down
        sta Player4Y
        cmp LimitUD
        bne .test4downovershoot
        lda #%1000 ; change AI direction
        eor AImove
        sta AImove
.test4downovershoot
        cpy Player4Y
        bcc .exit4down
        lda AvoidFireball
        bne .exit4down
        sty Player4Y
.exit4down
        rts


SoundVol
        .byte 0,1,2,3,4,4,4,4,4,4,4,4,4,4 ; Flap Vol
SoundFlap EQU * - SoundVol - 1
        .byte 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14 ; Brick Vol
SoundBrick EQU * - SoundVol - 1
        .byte 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,14 ; Shield Vol
SoundShield EQU * - SoundVol - 1
        .byte 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14 ; Launch Vol
SoundLaunch EQU * - SoundVol - 1

SoundKingTest EQU * - SoundVol + 2
        .byte 0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15 ; Dead King Vol
        .byte 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
        .byte 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
        .byte 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
SoundKing EQU * - SoundVol - 1


SoundFreq
        .byte 0,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f ; flap
        .byte 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14 ; Brick
        .byte 0,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1 ; Shield
        .byte 0,$1a,$1a,$1a,$1a,$1a,$1a,$1a,$1a,$1a,$1a,$1a,$1a,$1a,$1a ; Fireball
        .byte 0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30 ; King
        .byte 0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30 ; King
        .byte 0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30 ; King
        .byte 0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30 ; King

SoundChannel
        .byte 0,8,8,8,8,8,8,8,8,8,8,8,8,8 ; Flap
        .byte 0,9,8,9,8,9,8,9,8,9,8,9,8,9,8 ; Brick
        .byte 0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9 ; Shield
        .byte 0,8,8,8,8,8,8,8,8,8,8,8,8,8,8 ; Fireball
        .byte 0,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7 ; King
        .byte 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7 ; King
        .byte 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7 ; King
        .byte 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7 ; King

GreyFade
        .byte    $00, $02, $04, $06, $08, $0A, $0C, $0E
        .byte    $0E, $0C, $0A, $08, $06, $04, $02 ;, $00
ValueSquaredX
        .byte 0 ; 0^2 / 101
        .byte 0 ; 1^2 / 101
        .byte 0 ; 2^2 / 101
        .byte 0 ; 3^2 / 101
        .byte 0 ; 4^2 / 101
        .byte 0 ; 5^2 / 101
        .byte 0 ; 6^2 / 101
        .byte 0 ; 7^2 / 101
        .byte 0 ; 8^2 / 101
        .byte 0 ; 9^2 / 101
        .byte 0 ; 10^2 / 101
        .byte 1 ; 11^2 / 101
        .byte 1 ; 12^2 / 101
        .byte 1 ; 13^2 / 101
        .byte 1 ; 14^2 / 101
        .byte 2 ; 15^2 / 101
        .byte 2 ; 16^2 / 101
        .byte 2 ; 17^2 / 101
        .byte 3 ; 18^2 / 101
        .byte 3 ; 19^2 / 101
        .byte 3 ; 20^2 / 101
        .byte 4 ; 21^2 / 101
        .byte 4 ; 22^2 / 101
        .byte 5 ; 23^2 / 101
        .byte 5 ; 24^2 / 101
        .byte 6 ; 25^2 / 101
        .byte 6 ; 26^2 / 101
        .byte 7 ; 27^2 / 101
        .byte 7 ; 28^2 / 101
        .byte 8 ; 29^2 / 101
        .byte 8 ; 30^2 / 101
        .byte 9 ; 31^2 / 101
        .byte 10 ; 32^2 / 101
        .byte 10 ; 33^2 / 101
        .byte 11 ; 34^2 / 101
        .byte 12 ; 35^2 / 101
        .byte 12 ; 36^2 / 101
        .byte 13 ; 37^2 / 101
        .byte 14 ; 38^2 / 101
        .byte 15 ; 39^2 / 101
        .byte 15 ; 40^2 / 101
        .byte 16 ; 41^2 / 101
        .byte 17 ; 42^2 / 101
        .byte 18 ; 43^2 / 101
        .byte 19 ; 44^2 / 101
        .byte 20 ; 45^2 / 101
        .byte 20 ; 46^2 / 101
        .byte 21 ; 47^2 / 101
        .byte 22 ; 48^2 / 101
        .byte 23 ; 49^2 / 101
        .byte 24 ; 50^2 / 101
        .byte 25 ; 51^2 / 101
        .byte 26 ; 52^2 / 101
        .byte 27 ; 53^2 / 101
        .byte 28 ; 54^2 / 101
        .byte 29 ; 55^2 / 101
        .byte 31 ; 56^2 / 101
        .byte 32 ; 57^2 / 101
        .byte 33 ; 58^2 / 101
        .byte 34 ; 59^2 / 101
        .byte 35 ; 60^2 / 101
        .byte 36 ; 61^2 / 101
        .byte 38 ; 62^2 / 101
        .byte 39 ; 63^2 / 101
        .byte 40 ; 64^2 / 101
        .byte 41 ; 65^2 / 101
        .byte 43 ; 66^2 / 101
        .byte 44 ; 67^2 / 101
        .byte 45 ; 68^2 / 101
        .byte 47 ; 69^2 / 101
        .byte 48 ; 70^2 / 101
        .byte 49 ; 71^2 / 101
        .byte 51 ; 72^2 / 101
        .byte 52 ; 73^2 / 101
        .byte 54 ; 74^2 / 101
        .byte 55 ; 75^2 / 101
        .byte 57 ; 76^2 / 101
        .byte 58 ; 77^2 / 101
        .byte 60 ; 78^2 / 101
        .byte 61 ; 79^2 / 101
        .byte 63 ; 80^2 / 101
        .byte 64 ; 81^2 / 101
        .byte 66 ; 82^2 / 101
        .byte 68 ; 83^2 / 101
        .byte 69 ; 84^2 / 101
        .byte 71 ; 85^2 / 101
        .byte 73 ; 86^2 / 101
        .byte 74 ; 87^2 / 101
        .byte 76 ; 88^2 / 101
        .byte 78 ; 89^2 / 101
        .byte 80 ; 90^2 / 101
        .byte 81 ; 91^2 / 101
        .byte 83 ; 92^2 / 101
        .byte 85 ; 93^2 / 101
        .byte 87 ; 94^2 / 101
        .byte 89 ; 95^2 / 101
        .byte 91 ; 96^2 / 101
        .byte 93 ; 97^2 / 101
        .byte 95 ; 98^2 / 101
        .byte 97 ; 99^2 / 101
        .byte 99 ; 100^2 / 101
        .byte 101 ; 101^2 / 101
        .byte 103 ; 102^2 / 101
        .byte 105 ; 103^2 / 101
        .byte 107 ; 104^2 / 101
        .byte 109 ; 105^2 / 101
        .byte 111 ; 106^2 / 101
        .byte 113 ; 107^2 / 101
        .byte 115 ; 108^2 / 101
        .byte 117 ; 109^2 / 101
        .byte 119 ; 110^2 / 101
        .byte 121 ; 111^2 / 101
        .byte 124 ; 112^2 / 101
        .byte 126 ; 113^2 / 101
        .byte 128 ; 114^2 / 101
        .byte 130 ; 115^2 / 101
        .byte 133 ; 116^2 / 101
        .byte 135 ; 117^2 / 101
        .byte 137 ; 118^2 / 101
        .byte 140 ; 119^2 / 101
        .byte 142 ; 120^2 / 101
        .byte 144 ; 121^2 / 101
        .byte 147 ; 122^2 / 101
        .byte 149 ; 123^2 / 101
        .byte 152 ; 124^2 / 101
        .byte 154 ; 125^2 / 101
        .byte 157 ; 126^2 / 101
        .byte 159 ; 127^2 / 101
        .byte 162 ; 128^2 / 101
        .byte 164 ; 129^2 / 101
        .byte 167 ; 130^2 / 101
        .byte 169 ; 131^2 / 101
        .byte 172 ; 132^2 / 101
        .byte 175 ; 133^2 / 101
        .byte 177 ; 134^2 / 101
        .byte 180 ; 135^2 / 101
        .byte 183 ; 136^2 / 101
        .byte 185 ; 137^2 / 101
        .byte 188 ; 138^2 / 101
        .byte 191 ; 139^2 / 101
        .byte 194 ; 140^2 / 101
        .byte 196 ; 141^2 / 101
        .byte 199 ; 142^2 / 101
        .byte 202 ; 143^2 / 101
        .byte 205 ; 144^2 / 101
        .byte 208 ; 145^2 / 101
        .byte 211 ; 146^2 / 101
        .byte 213 ; 147^2 / 101
        .byte 216 ; 148^2 / 101
        .byte 219 ; 149^2 / 101
        .byte 222 ; 150^2 / 101
        .byte 225 ; 151^2 / 101
        .byte 228 ; 152^2 / 101
        .byte 231 ; 153^2 / 101
        .byte 234 ; 154^2 / 101
        .byte 237 ; 155^2 / 101
        .byte 240 ; 156^2 / 101
        .byte 247 ; 158^2 / 101
        .byte 250 ; 159^2 / 101

ValueSquaredY
        .byte 0 ; (0*1.212) ^2 / 101
        .byte 0 ; (1*1.212) ^2 / 101
        .byte 0 ; (2*1.212) ^2 / 101
        .byte 0 ; (3*1.212) ^2 / 101
        .byte 0 ; (4*1.212) ^2 / 101
        .byte 0 ; (5*1.212) ^2 / 101
        .byte 0 ; (6*1.212) ^2 / 101
        .byte 0 ; (7*1.212) ^2 / 101
        .byte 0 ; (8*1.212) ^2 / 101
        .byte 1 ; (9*1.212) ^2 / 101
        .byte 1 ; (10*1.212) ^2 / 101
        .byte 1 ; (11*1.212) ^2 / 101
        .byte 2 ; (12*1.212) ^2 / 101
        .byte 2 ; (13*1.212) ^2 / 101
        .byte 2 ; (14*1.212) ^2 / 101
        .byte 3 ; (15*1.212) ^2 / 101
        .byte 3 ; (16*1.212) ^2 / 101
        .byte 4 ; (17*1.212) ^2 / 101
        .byte 4 ; (18*1.212) ^2 / 101
        .byte 5 ; (19*1.212) ^2 / 101
        .byte 5 ; (20*1.212) ^2 / 101
        .byte 6 ; (21*1.212) ^2 / 101
        .byte 7 ; (22*1.212) ^2 / 101
        .byte 7 ; (23*1.212) ^2 / 101
        .byte 8 ; (24*1.212) ^2 / 101
        .byte 9 ; (25*1.212) ^2 / 101
        .byte 9 ; (26*1.212) ^2 / 101
        .byte 10 ; (27*1.212) ^2 / 101
        .byte 11 ; (28*1.212) ^2 / 101
        .byte 12 ; (29*1.212) ^2 / 101
        .byte 13 ; (30*1.212) ^2 / 101
        .byte 13 ; (31*1.212) ^2 / 101
        .byte 14 ; (32*1.212) ^2 / 101
        .byte 15 ; (33*1.212) ^2 / 101
        .byte 16 ; (34*1.212) ^2 / 101
        .byte 17 ; (35*1.212) ^2 / 101
        .byte 18 ; (36*1.212) ^2 / 101
        .byte 19 ; (37*1.212) ^2 / 101
        .byte 21 ; (38*1.212) ^2 / 101
        .byte 22 ; (39*1.212) ^2 / 101
        .byte 23 ; (40*1.212) ^2 / 101
        .byte 24 ; (41*1.212) ^2 / 101
        .byte 25 ; (42*1.212) ^2 / 101
        .byte 26 ; (43*1.212) ^2 / 101
        .byte 28 ; (44*1.212) ^2 / 101
        .byte 29 ; (45*1.212) ^2 / 101
        .byte 30 ; (46*1.212) ^2 / 101
        .byte 32 ; (47*1.212) ^2 / 101
        .byte 33 ; (48*1.212) ^2 / 101
        .byte 34 ; (49*1.212) ^2 / 101
        .byte 36 ; (50*1.212) ^2 / 101
        .byte 37 ; (51*1.212) ^2 / 101
        .byte 39 ; (52*1.212) ^2 / 101
        .byte 40 ; (53*1.212) ^2 / 101
        .byte 42 ; (54*1.212) ^2 / 101
        .byte 43 ; (55*1.212) ^2 / 101
        .byte 45 ; (56*1.212) ^2 / 101
        .byte 47 ; (57*1.212) ^2 / 101
        .byte 48 ; (58*1.212) ^2 / 101
        .byte 50 ; (59*1.212) ^2 / 101
        .byte 52 ; (60*1.212) ^2 / 101
        .byte 54 ; (61*1.212) ^2 / 101
        .byte 55 ; (62*1.212) ^2 / 101
        .byte 57 ; (63*1.212) ^2 / 101
        .byte 59 ; (64*1.212) ^2 / 101
        .byte 61 ; (65*1.212) ^2 / 101
        .byte 63 ; (66*1.212) ^2 / 101
        .byte 65 ; (67*1.212) ^2 / 101
        .byte 67 ; (68*1.212) ^2 / 101
        .byte 69 ; (69*1.212) ^2 / 101
        .byte 71 ; (70*1.212) ^2 / 101
        .byte 73 ; (71*1.212) ^2 / 101
        .byte 75 ; (72*1.212) ^2 / 101
        .byte 77 ; (73*1.212) ^2 / 101
        .byte 79 ; (74*1.212) ^2 / 101
        .byte 81 ; (75*1.212) ^2 / 101
        .byte 84 ; (76*1.212) ^2 / 101
        .byte 86 ; (77*1.212) ^2 / 101
        .byte 88 ; (78*1.212) ^2 / 101
        .byte 90 ; (79*1.212) ^2 / 101
        .byte 93 ; (80*1.212) ^2 / 101
        .byte 95 ; (81*1.212) ^2 / 101
        .byte 97 ; (82*1.212) ^2 / 101
        .byte 100 ; (83*1.212) ^2 / 101
        .byte 102 ; (84*1.212) ^2 / 101
        .byte 105 ; (85*1.212) ^2 / 101
        .byte 107 ; (86*1.212) ^2 / 101
        .byte 110 ; (87*1.212) ^2 / 101
        .byte 112 ; (88*1.212) ^2 / 101
        .byte 115 ; (89*1.212) ^2 / 101
        .byte 117 ; (90*1.212) ^2 / 101
        .byte 120 ; (91*1.212) ^2 / 101
        .byte 123 ; (92*1.212) ^2 / 101
        .byte 125 ; (93*1.212) ^2 / 101
        .byte 128 ; (94*1.212) ^2 / 101
        .byte 131 ; (95*1.212) ^2 / 101
        .byte 134 ; (96*1.212) ^2 / 101



KingFlashColors; = * - SoundKingTest
        .byte $ff, $ef, $df, $cf, $bf, $af, $9f, $8f
        .byte $7f, $6f, $5f, $4f, $3f, $2f, $1f, $0f

        ; .byte $ff, $ef, $df, $cf, $bf, $af, $9f, $8f
        ; .byte $7f, $6f, $5f, $4f, $3f, $2f, $1f, $0f
        ;
        ; .byte $ff, $ef, $df, $cf, $bf, $af, $9f, $8f
        ; .byte $7f, $6f, $5f, $4f, $3f, $2f, $1f, $0f
        ;
        ; .byte $ff, $ef, $df, $cf, $bf, $af, $9f, $8f
        ; .byte $7f, $6f, $5f, $4f, $3f, $2f, $1f, $0f

         echo "----",($FFF4 - *) , "bytes of BANK 1 ROM left"

        ORG $8FF4
        BANKS_AND_VECTORS

;--------------------------------------------------------------------
; bank 2 - Game Display Kernel - Dragon
;--------------------------------------------------------------------
        ORG $9000
        JUMP_TABLE


DisplayKnight
        jmp KnightCode

KernelGameDragonCode SUBROUTINE                            ;    62
        bit DragonPass
        bvs DisplayKnight
        sta WSYNC
        lda #0              ; 2     turn off 2 fireballs not shown during dragon
        sta ENABL           ; 3  5
        sta ENAM1           ; 3  8
        ldy DragonIndex     ; 3 11 SavedLineCounter
        lda (DragonShift),y ; 5 16
        sta HMP0            ; 3 19
        asl                 ; 2 21
        asl                 ; 2 23
        asl                 ; 2 25
        asl                 ; 2 27
        sta HMP1            ; 3 30
        lda (DragonG0),y    ; 5 35
        tax                 ; 2 37
        lda (DragonG1),y    ; 5 42
        inc DragonIndex     ; 5 47
        ldy Paddles2Read    ; 3 50
        beq .skip           ; 2 52  53 taken
        jmp Dragon24        ; 3 55
.skip   ldy SavedLineCounter; 3 56
        dey                 ; 2 58
        cpy M0yOddRow       ; 3 61 - only drawing M0 in dragon area
        sta WSYNC           ; 3 64


DragonLoop13 SUBROUTINE
        sta HMOVE           ; 3
DL13noHM1                   ; could come here on cycle 5 or 6
        php                 ; 3  6-9  draw M0
        pha                 ; 3  9-12 draw P1
        stx GRP0            ; 3 12-15 draw P0
        READ_PADDLE_1       ; 9 21-24
        sty SavedLineCounter; 3 24-27 save line counter
        ldy DragonIndex     ; 3 27-30
        lda (DragonShift),y ; 5 32-35
        bne DL13HM1         ; 2 34-36  3 35-38 to DL13HM1
        lda (DragonG0),y    ; 5 39-42
        tax                 ; 2 41-44
        lda (DragonG1),y    ; 5 46-49
        inc DragonIndex     ; 5 51-54 update dragon graphic pointer
        ldy SavedLineCounter; 3 54-57 load line counter
        sta WSYNC           ; 3 57-60
        jmp DL13noHM2       ; 3

DL13HM1
        sta HMP0            ; 3 38-41
        asl                 ; 2 40-43
        asl                 ; 2 42-45
        asl                 ; 2 44-48
        asl                 ; 2 46-49
        sta HMP1            ; 3 49-52
        lda (DragonG0),y    ; 5 54-57
        tax                 ; 2 56-59
        lda (DragonG1),y    ; 5 61-64
        inc DragonIndex     ; 5 66-69 update dragon graphic pointer
        ldy SavedLineCounter; 3 69-72 load line counter
        sta WSYNC           ; 3 72-75 could hit at 75 if coming in on cycle 6
                            ;         or at 76 if image data crosses a page
                            ;         (max 1 page cross per image)

        sta HMOVE           ; 3
DL13noHM2
        sta GRP1            ; 3  6
        stx GRP0            ; 3  9
        ldx #ENAM0          ; 2 11
        txs                 ; 2 13
        READ_PADDLE_3       ; 9 22
        ldy DragonIndex     ; 3 25
        lda (DragonShift),y ; 5 30
        bne DL13HM2         ; 2 32 3 33 to DL13HM2
        lda (DragonG0),y    ; 5 37
        tax                 ; 2 39
        lda (DragonG1),y    ; 5 44
        inc DragonIndex     ; 5 49
        ldy SavedLineCounter; 3 52 ; load line counter
        dey                 ; 2 54
        cpy M0yEvenRow      ; 3 57
        sta WSYNC           ; 3 60
        jmp DL13noHM3       ; 3

DL13HM2
        sta HMP0            ; 3 36
        asl                 ; 2 38
        asl                 ; 2 40
        asl                 ; 2 42
        asl                 ; 2 44
        sta HMP1            ; 3 47
        lda (DragonG0),y    ; 5 52
        tax                 ; 2 54
        lda (DragonG1),y    ; 5 59
        inc DragonIndex     ; 5 64
        ldy SavedLineCounter; 3 67 ; load line counter
        dey                 ; 2 69
        cpy M0yEvenRow      ; 3 72
        sta WSYNC           ; 3 75

        sta HMOVE           ; 3
DL13noHM3
        php                 ; 3  6 draw M0
        pha                 ; 3  9 draw P1
        stx GRP0            ; 3 12 draw P0
        READ_PADDLE_1       ; 9 21
        sty SavedLineCounter; 3 24 save line counter
        ldy DragonIndex     ; 3 27
        lda (DragonShift),y ; 5 32
        bne DL13HM3         ; 2 34 3 35 to DL13HM3
        lda (DragonG0),y    ; 5 39
        tax                 ; 2 41
        lda (DragonG1),y    ; 5 46
        inc DragonIndex     ; 5 51
        ldy SavedLineCounter; 3 54 load line counter
        sta WSYNC           ; 3 57
        jmp DL13noHM4       ; 3

DL13HM3
        sta HMP0            ; 3 38
        asl                 ; 2 40
        asl                 ; 2 42
        asl                 ; 2 44
        asl                 ; 2 46
        sta HMP1            ; 3 49
        lda (DragonG0),y    ; 5 54
        tax                 ; 2 56
        lda (DragonG1),y    ; 5 61
        inc DragonIndex     ; 5 66
        ldy SavedLineCounter; 3 69 load line counter
        sta WSYNC           ; 3 72
        sta HMOVE           ; 3
DL13noHM4
        sta GRP1            ; 3  6
        stx GRP0            ; 3  9
        ldx #ENAM0          ; 2 11
        txs                 ; 2 13
        READ_PADDLE_3       ; 9 22
        ldy DragonIndex     ; 3 25
        lda (DragonShift),y ; 5 30
        beq DL13noHM5       ; 2 32 3 33 to DL13noHM5
        sta HMP0            ; 3 35
        asl                 ; 2 37
        asl                 ; 2 39
        asl                 ; 2 41
        asl                 ; 2 43
        sta HMP1            ; 3 46
        lda (DragonG0),y    ; 5 51
        tax                 ; 2 53
        lda (DragonG1),y    ; 5 58
        inc DragonIndex     ; 5 63 update dragon graphic pointer
        ldy SavedLineCounter; 3 66 load line counter
        dey                 ; 2 68
        cpy #37             ; 2 70
        beq DD13            ; 2 72
        cpy M0yOddRow       ; 3 75
        sta HMOVE           ; 3 78 HMOVE hit at cycle 2, sometimes 3 if part of
                            ;      the image data crosses a page (max 1 page
                            ;      cross per image).
        jmp DL13noHM1       ; 3 5

DL13noHM5
        lda (DragonG0),y    ; 5 38
        tax                 ; 2 40
        lda (DragonG1),y    ; 5 45
        inc DragonIndex     ; 5 50 update dragon graphic pointer
        ldy SavedLineCounter; 3 53 load line counter
        dey                 ; 2 55
        cpy #37             ; 2 57
        beq DD13            ; 2 59
        cpy M0yOddRow       ; 3 62
        sta WSYNC           ;
        jmp DL13noHM1       ;


DD13    jmp DragonDone      ; 3 76

Dragon24
        ldy SavedLineCounter ; 3 58
        dey                  ; 2 60
        cpy M0yOddRow        ; 3 63  - only drawing M0 in dragon area
        sta WSYNC            ; 3 66

DragonLoop24 SUBROUTINE
        sta HMOVE         ; 3
DL24noHM1
        php               ; 3  6   draw M0
        pha               ; 3  9   draw P1
        stx GRP0          ; 3 12   draw P0
        READ_PADDLE_2     ; 9 21
        sty SavedLineCounter      ; 3 24 save line counter
        ldy DragonIndex      ;39 Dragon
        lda (DragonShift),y; |
        bne DL24HM1
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-63 update dragon graphic pointer
        ldy SavedLineCounter      ; 3 66 load line counter
        sta WSYNC         ; 3 72
        jmp DL24noHM2
DL24HM1
        sta HMP0          ; |
        asl
        asl
        asl
        asl
        sta HMP1          ; |
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-63 update dragon graphic pointer
        ldy SavedLineCounter      ; 3 66 load line counter
        sta WSYNC         ; 3 72

        sta HMOVE         ; 3
DL24noHM2
        sta GRP1          ; 3  6
        stx GRP0          ; 3  9
        ldx #ENAM0        ; 2 11
        txs               ; 2 13
        READ_PADDLE_4     ; 9 22
        ldy DragonIndex      ;39 Dragon
        lda (DragonShift),y  ; |
        bne DL24HM2
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-61
        ldy SavedLineCounter      ; 3 64 ; load line counter
        dey               ; 2 66
        cpy M0yEvenRow    ; 3 73
        sta WSYNC         ; 3 76
        jmp DL24noHM3
DL24HM2
        sta HMP0          ; |
        asl
        asl
        asl
        asl
        sta HMP1          ; |
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-61
        ldy SavedLineCounter      ; 3 64 ; load line counter
        dey               ; 2 66
        cpy M0yEvenRow    ; 3 73
        sta WSYNC         ; 3 76

        sta HMOVE         ; 3
DL24noHM3
        php               ; 3  6 draw M0
        pha               ; 3  9 draw P1
        stx GRP0          ; 3 12 draw P0
        READ_PADDLE_2     ; 9 21
        sty SavedLineCounter      ; 3 24 save line counter
        ldy DragonIndex      ;39 Dragon
        lda (DragonShift),y ; |
        bne DL24HM3
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-63
        ldy SavedLineCounter      ; 3 66 load line counter
        sta WSYNC         ; 3 69
        jmp DL24noHM4
DL24HM3
        sta HMP0          ; |
        asl
        asl
        asl
        asl
        sta HMP1          ; |
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-63
        ldy SavedLineCounter      ; 3 66 load line counter
        sta WSYNC         ; 3 69
        sta HMOVE         ; 3
DL24noHM4
        sta GRP1          ; 3  6
        stx GRP0          ; 3  9
        ldx #ENAM0        ; 2 11
        txs               ; 2 13
        READ_PADDLE_4     ; 9 22
        ldy DragonIndex      ;39 Dragon
        lda (DragonShift),y  ; |
        beq DL24noHM5
        sta HMP0          ; |
        asl
        asl
        asl
        asl
        sta HMP1          ; |
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-61 update dragon graphic pointer
        ldy SavedLineCounter      ; 3 64 load line counter
        dey               ; 2 66
        cpy #37           ; 2 68
        beq DragonDone    ; 2 70
        cpy M0yOddRow     ; 3 73
        sta HMOVE
        jmp DL24noHM1  ; 3 76
DL24noHM5
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-61 update dragon graphic pointer
        ldy SavedLineCounter      ; 3 64 load line counter
        dey               ; 2 66
        cpy #37           ; 2 68
        beq DragonDone    ; 2 70
        cpy M0yOddRow     ; 3 73
        sta WSYNC
        jmp DL24noHM1     ; 3 76



DragonDone
        ldx #ENABL        ; 2 75  need to reset stack
        txs               ; 2 77
        cpy BLyOddRow     ; 3  4
        php               ; 3  7
        cpy M1yOddRow     ; 3 10
        php               ; 3 13
        cpy M0yOddRow     ; 3 16
        php               ; 3 19
        ldx #ENABL        ; 2 21
        txs               ; 2 22
        READ_TWO_PADDLES  ;23 45
        dey               ; 2 49
        sta WSYNC         ; 3 57
        ; test for return to easter egg here
	lda DragonPass
	bpl DDskip
	jmp MMEEafterDragon
DDskip
        sta WSYNC
        cpy BLyEvenRow     ; 3  4
        php               ; 3  7
        cpy M1yEvenRow     ; 3 10
        php               ; 3 13
        cpy M0yEvenRow     ; 3 16
        php               ; 3 19
        ldx #ENABL        ; 2 21
        txs               ; 2 22
        READ_TWO_PADDLES  ;23 45
        dey               ; 2 49
        sta WSYNC
        jmp KernelGameBottom


OverscanGame2Code
;TestEndOfRound
        bit DeadPlayers
        bpl NoMessageDisplayed
        jmp Message
NoMessageDisplayed
        lda DeadPlayers
        and #%00001111
        cmp #%1111
        beq Draw           ; everybody died
        bit HumanPlayers
        bpl WasNotDoubles
        jmp CheckDoubles
WasNotDoubles
        cmp #%1110
        bne CheckIf2Winner
        ; player 1 won round
        ldy #0
        beq HaveRoundWinner
CheckIf2Winner
        cmp #%1101
        bne CheckIf3Winner
        ldy #2
        bne HaveRoundWinner
CheckIf3Winner
        cmp #%1011
        bne CheckIf4Winner
        ldy #4
        bne HaveRoundWinner
CheckIf4Winner
        cmp #%0111
        beq WinnerIs4
        jmp Message
WinnerIs4
        ldy #6
HaveRoundWinner
        bit GameOptions
        bpl NotAttractMode
BailAttractModeDraw
;        jmp ExitAttractMode ; bail if all players died while Attract mode was on
	lda #ATTRACT_DELAY
	sta ExtraFireball
	jmp OverscanMenu2

NotAttractMode
        lda SoundLeft       ; check if king death throws are still onscreen
        cmp #SoundKingTest  ; don't trigger end-of-round until their done
        bcs SMskip
        lda SoundRight
        cmp #SoundKingTest
        bcs SMskip
        bit DragonControl   ; check if dragon still onscreen
        bmi Message         ; don't trigger end-of-round until she's flown off
                            ; can't go to SMskip as turning off the fireballs
                            ; confuses the dragon animation routines
        lda #$10
        sta DragonPass
        lda GameOptions2
        and #%00001111
        tax
        lda Times7ScoreCheck,x
        sta TempHMOVE
        clc
        lda #7
        adc Score1,y
        sta Score1,y
        cmp TempHMOVE ; game winner:
        beq GameWinner
        lda #%10100000     ; set Round Message
        bne SetMessage
Draw
        lda #$10
        sta DragonPass
        bit GameOptions
        bmi BailAttractModeDraw
        lda #%10010000     ; set DRAW Message
SetMessage
        ora DeadPlayers
        sta DeadPlayers
        lda #0
        sta DragonX
        sta M0State
        sta M1State
        sta BLState
        lda DeadPlayers
        and #%00010000
        bne SMskip
        sta SPbeat     ; music
        sta SPtempoCount ; music
        lda #$1c
        sta SPmeasure ; music
SMskip
        lda #128
        sta M0yPosHigh ; off screen
        sta M1yPosHigh ; off screen
        sta BLyPosHigh ; off screen
        bne Message
GameWinner
        lda #%11000000  ; set Game Message
        bne SetMessage
CheckDoubles
        ldy #4
        and #%1001
        cmp #%1001
        beq HaveRoundWinner
        ldy #0
        lda DeadPlayers
        and #%0110
        cmp #%0110
        beq HaveRoundWinner
Message
        bit DeadPlayers
        bmi ShowMessage
        jmp ProcessDragon
ShowMessage
        lda DeadPlayers
        and #%00010000
        beq SyncKnightToBeat
        lda Frame  ; timing for DRAW pass
        and #3
        beq MoveMessage
        bne UpdateMessage
SyncKnightToBeat
        lda SPbeat
        and #1
        ora SPtempoCount
        bne UpdateMessage

MoveMessage
        lda DragonPass
        and #$10
        beq MoveMessageLeft

MoveMessageRight
        inc DragonX
        lda DragonX
        cmp #112             ; attack?
        bne MMRskip1

        lda DeadPlayers
        and #%00010000       ; was it the draw message?
        bne MMRskip1

        bit DeadPlayers
        bvs MMRskip1         ; skip if Won Game is up

        lda rand
        and #%10000100       ; trigger chase off on 1/4th the rounds
; lda #0 ;uncomment to test chase off animations
        beq MMRchaseOff

MMRskip1
        tax
        lda DeadPlayers
        and #%00010000
        beq MMRKnightTest
        cpx #130
        beq TurnOffMessage
MMRKnightTest
        cpx #160-8
        bne UpdateMessage
        bit DeadPlayers
        bvs MMRchaseOff ; turn around Won Game knight
        bvc TurnOffMessage

MMRchaseOff
        lda #%00000010      ; trigger Chase Sequence
        ora ChaseSequence
        sta ChaseSequence
        lda DragonPass
        sec
        sbc #$10
        sta DragonPass
        lda #%00100000
        ora DragonControl
        sta DragonControl

MoveMessageLeft
        bit DeadPlayers
        bvc MMLround
        dec DragonX
        bne UpdateMessage
        beq TurnOffMessage
MMLround
        lda DragonX
        sec
        sbc #8
        sta DragonX
        cmp #8
        bcs UpdateMessage
TurnOffMessage
        bit DeadPlayers
        bvc .skip
;        lda #0
;        sta DragonX
        lda #0
        sta SPbeat
        sta SPtempoCount
        sta SPmeasure
        jmp BailAttractModeDraw ; not really attract mode but we need to reset timer
        beq UpdateMessage
.skip
        jmp StartRound
UpdateMessage
        lda DeadPlayers
        asl
        asl
        bcs SetMessageGameWinner
        asl
        bcs SetMessageRoundWinner
        lda #<MessageDrawL
        sta DragonG0
        lda #>MessageDrawL
        sta DragonG0+1
        lda #<MessageDrawR
        sta DragonG1
        lda #>MessageDrawR
        sta DragonG1+1
        lda #<MessageDrawShift
        sta DragonShift
        lda #>MessageDrawShift
        sta DragonShift+1
        bne ProcessDragon

SetMessageGameWinner
        lda SPbeat
;        lsr
;        lsr
        lsr
;        lda Frame
;        lsr
;        lsr
        and #3
        tay
        lda KnightLow,y
        sta DragonG0
        lda KnightHigh,y
        sta DragonG0+1
        lda FlagLow,y
        sta DragonG1
        lda FlagHigh,y
        sta DragonG1+1
        lda DragonPass
        and #$10
        bne MLtoR
MRtoL   lda #<KnightRtoL
        sta DragonShift
        lda #>KnightRtoL
        sta DragonShift+1
        lda #%01000000      ; flag narrow sprites in dragon area
        ora DragonPass
        sta DragonPass
        bne ProcessDragon
SetMessageRoundWinner
        lda SPbeat
;        lsr
;        lsr
        lsr
;        lda Frame
;        lsr
;        lsr
        and #3
        tay
        lda KnightLow,y
        sta DragonG0
        lda KnightHigh,y
        sta DragonG0+1
        lda FlagLow,y
        sta DragonG1
        lda FlagHigh,y
        sta DragonG1+1
        lda DragonPass
        and #$10
        beq MRtoL
MLtoR   lda #<KnightLtoR
        sta DragonShift
        lda #>KnightLtoR
        sta DragonShift+1
        lda #%01000000     ; flag narrow sprites in dragon area
        ora DragonPass
        sta DragonPass
ProcessDragon SUBROUTINE


; test if dragon's onscreen
        lda DragonControl
        bpl .skip
        lda #%10111111   ; flag wide sprites in dragon area
        and DragonPass
        sta DragonPass

        lda DragonAnim
        lsr
        lsr
        lsr
        lsr
        tay
        lda DragonSequencesLow,y
        sta Dragonptr
        lda DragonSequencesHigh,y
        sta Dragonptr+1
        jmp ProcessDragonAnimation
.skip

        lda INTIM
        sta DebugOS
OverscanWait:
        lda SWCHB
        eor #$FF
        and #%00000011
        bne SelectOrReset
        ldx INTIM
        bpl OverscanWait
        jmp VerticalBlankGame
SelectOrReset
        lda #ATTRACT_DELAY
        sta ExtraFireball
        lda #0             ; reset music
        sta SPbeat
        sta SPtempoCount
        sta SPmeasure
        jmp OverscanMenu2

KnightCode
;        sta WSYNC
        lda #0               ; 2    turn off fireballs, none onscreen during knight
        sta ENABL            ; 3  5
        sta ENAM0            ; 3  8
        sta ENAM1            ; 3 11
        sta HMP1             ; 3 14

        lda DragonColor1     ; 3 17
        and #$f0             ; 2 19
        sta TempHMOVE        ; 3 22


        ldy DragonIndex      ; 3 15
        lda (DragonShift),y  ; 5 22
        sta HMP0             ; 3 25  only need HMP1 for the knight sequence
        lda (DragonG0),y     ; 5 30
        tax                  ; 2 32  Sprite 0 in X
        lda (DragonG1),y     ; 5 37  Sprite 0 in A
        inc DragonIndex      ; 5 42
        ldy SavedLineCounter ; 3 45
        dey                  ; 2 47
        sta WSYNC            ; 3 50
        sta HMOVE            ; only HMOVE during knight loop

KnightLoop
        stx GRP0             ; 3  3
        sta GRP1             ; 3  6
        lda DragonColor1     ; 3  9
        and #$0f             ; 2 11
        ora TempHMOVE        ; 3 14
        sta COLUP0           ; 3 17
        READ_PADDLE_1_OR_2   ;14 31
        sty SavedLineCounter ; 3 34
        ldy DragonIndex      ; 3 39
        lda (DragonG0),y     ; 5 44
        tax                  ; 2 46
        lda (DragonG1),y     ; 5 51
        inc DragonIndex      ; 5 56
        ldy SavedLineCounter ; 3 59
        dec DragonColor1     ; 5 64
        sta WSYNC            ; 3 67

        stx GRP0             ; 3  3
        sta GRP1             ; 3  6
        lda DragonColor1     ; 3  9
        and #$0f             ; 2 11
        ora TempHMOVE        ; 3 14
        sta COLUP0           ; 3 17
        READ_PADDLE_3_OR_4   ;14 31
        ldy DragonIndex      ; 3 34
        lda (DragonG0),y     ; 5 39
        tax                  ; 2 41
        lda (DragonG1),y     ; 5 46
        inc DragonIndex      ; 5 51
        ldy SavedLineCounter ; 3 54
        dey                  ; 2 56
        cpy #37              ; 2 58
        beq KLDone           ; 2 60
        dec DragonColor1     ; 5 65
        sta WSYNC            ; 3 68
        jmp KnightLoop       ; 3

KLDone  jmp DragonDone       ; 3 64





Times7ScoreCheck
        .byte $0,7,14,21,28,35,42,49,56,63,70,77,84,91,98,105


DragonSequencesHigh
        .byte > DragonSequence0  ; launch right-up   & leave left version 1
        .byte > DragonSequence1  ; launch right-down & leave left version 1
        .byte > DragonSequence2  ; launch left-up    & leave right version 1
        .byte > DragonSequence3  ; launch left-down  & leave right version 1
        .byte > DragonSequence4  ; from left stop mid-way for launch up
        .byte > DragonSequence5  ; from left stop mid-way for launch down
        .byte > DragonSequence6  ; cross screen version 1
        .byte > DragonSequence7  ; cross screen version 2
        .byte > DragonSequence8  ; launch right-up   & leave left version 1
        .byte > DragonSequence9  ; launch right-down & leave left version 1
        .byte > DragonSequence10 ; launch left-up    & leave right version 1
        .byte > DragonSequence11 ; launch left-down  & leave right version 1
        .byte > DragonSequence12 ; from right stop mid-way for launch up
        .byte > DragonSequence13 ; from right stop mid-way for launch down
        .byte > DragonSequence14 ; chase-off launch up
        .byte > DragonSequence15 ; chase-off launch down

DragonSequencesLow
        .byte < DragonSequence0
        .byte < DragonSequence1
        .byte < DragonSequence2
        .byte < DragonSequence3
        .byte < DragonSequence4
        .byte < DragonSequence5
        .byte < DragonSequence6
        .byte < DragonSequence7
        .byte < DragonSequence8
        .byte < DragonSequence9
        .byte < DragonSequence10
        .byte < DragonSequence11
        .byte < DragonSequence12
        .byte < DragonSequence13
        .byte < DragonSequence14
        .byte < DragonSequence15

KnightHigh
        .byte > Knight1
        .byte > Knight2
        .byte > Knight3
        .byte > Knight4
KnightLow
        .byte < Knight1
        .byte < Knight2
        .byte < Knight3
        .byte < Knight4
FlagHigh
        .byte > Flag1
        .byte > Flag2
        .byte > Flag3
        .byte > Flag4
FlagLow
        .byte < Flag1
        .byte < Flag2
        .byte < Flag3
        .byte < Flag4

 align 256

Knight1
        .byte zz________  ; 1   frame 1
        .byte zz_______X  ; 2
        .byte zz_______X  ; 3
        .byte zz_______X  ; 4
        .byte zz_______X  ; 5
        .byte zz________  ; 6
        .byte zz________  ; 7
        .byte zz________  ; 8
        .byte zz________  ; 9
        .byte zz________  ; 10
        .byte zz________  ; 11
        .byte zz________  ; 12
        .byte zz______X_  ; 13
        .byte zz______X_  ; 14
        .byte zz_____X__  ; 15
        .byte zz_____X__  ; 16
        .byte zz_____X__  ; 17
        .byte zz_____X__  ; 18
        .byte zz_____X__  ; 19
        .byte zz________  ; 20
        .byte zz___XX___  ; 21
        .byte zz___XXX__  ; 22
        .byte zz__XXX_X_  ; 23
        .byte zz___X_XXX  ; 24
        .byte zz__X_XXX_  ; 25
        .byte zz___XX___  ; 26
        .byte zz__X_____  ; 27
        .byte zz__XXXXX_  ; 28
        .byte zz___XXX__  ; 29
        .byte zz___XX___  ; 30
        .byte zz__XX____  ; 31
        .byte zz________  ; 32
        .byte zz________  ; 33
        .byte zz________  ; 34
        .byte zz________  ; 35
        .byte zz________  ; 36
        .byte zz________  ; 37
        .byte zz_____X_X  ; 38
        .byte zz_____XXX  ; 39
        .byte zz__X__XX_  ; 40
        .byte zz_X___X__  ; 41
        .byte zzXX___X__  ; 42
        .byte zzXXX_____  ; 43
        .byte zz________  ; 44



Knight2
        .byte zz________  ; 1   frame 2
        .byte zz________  ; 2
        .byte zz________  ; 3
        .byte zz_______X  ; 4
        .byte zz_______X  ; 5
        .byte zz_______X  ; 6
        .byte zz_______X  ; 7
        .byte zz________  ; 8
        .byte zz________  ; 9
        .byte zz________  ; 10
        .byte zz________  ; 11
        .byte zz________  ; 12
        .byte zz________  ; 13
        .byte zz________  ; 14
        .byte zz______X_  ; 15
        .byte zz______X_  ; 16
        .byte zz_____X__  ; 17
        .byte zz_____X__  ; 18
        .byte zz_____X__  ; 19
        .byte zz_____X__  ; 20
        .byte zz________  ; 21
        .byte zz________  ; 22
        .byte zz___XX_X_  ; 23
        .byte zz___XXXXX  ; 24
        .byte zz__XX_XX_  ; 25
        .byte zz___XXX__  ; 26
        .byte zz__X_X___  ; 27
        .byte zz___X____  ; 28
        .byte zz__X_____  ; 29
        .byte zz__XXXXX_  ; 30
        .byte zz___XXX__  ; 31
        .byte zz___XX___  ; 32
        .byte zz___XX___  ; 33
        .byte zz________  ; 34
        .byte zz________  ; 35
        .byte zz________  ; 36
        .byte zz________  ; 37
        .byte zz________  ; 38
        .byte zz________  ; 39
        .byte zz________  ; 40
        .byte zz_X______  ; 41
        .byte zzXX___XX_  ; 42
        .byte zz_XX__XXX  ; 43
        .byte zz________  ; 44

Knight3
        .byte zz________  ; 1   frame 3
        .byte zz________  ; 2
        .byte zz________  ; 3
        .byte zz________  ; 4
        .byte zz_______X  ; 5
        .byte zz_______X  ; 6
        .byte zz_______X  ; 7
        .byte zz_______X  ; 8
        .byte zz________  ; 9
        .byte zz________  ; 10
        .byte zz________  ; 11
        .byte zz________  ; 12
        .byte zz________  ; 13
        .byte zz________  ; 14
        .byte zz________  ; 15
        .byte zz______X_  ; 16
        .byte zz______X_  ; 17
        .byte zz_____X__  ; 18
        .byte zz_____X__  ; 19
        .byte zz_____X__  ; 20
        .byte zz_____X__  ; 21
        .byte zz________  ; 22
        .byte zz___XX___  ; 23
        .byte zz___XXX__  ; 24
        .byte zz__XXXXX_  ; 25
        .byte zz___X____  ; 26
        .byte zz__X_XXXX  ; 27
        .byte zz___X_XXX  ; 28
        .byte zz__X_X_X_  ; 29
        .byte zz__XXXX__  ; 30
        .byte zz___XXX__  ; 31
        .byte zz___XX___  ; 32
        .byte zz__XX____  ; 33
        .byte zz________  ; 34
        .byte zz________  ; 35
        .byte zz________  ; 36
        .byte zz________  ; 37
        .byte zz________  ; 38
        .byte zz________  ; 39
        .byte zzX_______  ; 40
        .byte zzX_______  ; 41
        .byte zzX__XX___  ; 42
        .byte zz___XXX__  ; 43
        .byte zz________  ; 44



Knight4
        .byte zz________  ; 1   frame 4
        .byte zz________  ; 2
        .byte zz_______X  ; 3
        .byte zz_______X  ; 4
        .byte zz_______X  ; 5
        .byte zz_______X  ; 6
        .byte zz________  ; 7
        .byte zz________  ; 8
        .byte zz________  ; 9
        .byte zz________  ; 10
        .byte zz________  ; 11
        .byte zz________  ; 12
        .byte zz________  ; 13
        .byte zz______X_  ; 14
        .byte zz______X_  ; 15
        .byte zz_____X__  ; 16
        .byte zz_____X__  ; 17
        .byte zz_____X__  ; 18
        .byte zz_____X__  ; 19
        .byte zz_____X__  ; 20
        .byte zz________  ; 21
        .byte zz___XX___  ; 22
        .byte zz___XXX__  ; 23
        .byte zz__XXX_X_  ; 24
        .byte zz___X_XXX  ; 25
        .byte zz__X_XXXX  ; 26
        .byte zz___X____  ; 27
        .byte zz__X_XXXX  ; 28
        .byte zz__XXXXX_  ; 29
        .byte zz___XXX__  ; 30
        .byte zz___XX___  ; 31
        .byte zz__XX____  ; 32
        .byte zz________  ; 33
        .byte zz________  ; 34
        .byte zz________  ; 35
        .byte zz________  ; 36
        .byte zz______X_  ; 37
        .byte zz_____XX_  ; 38
        .byte zz_____X__  ; 39
        .byte zz_____X__  ; 40
        .byte zz__X_____  ; 41
        .byte zz_XX_____  ; 42
        .byte zz_XXX____  ; 43
        .byte zz________  ; 44

Flag1
        .byte zz________  ; 1
        .byte zz________  ; 2
        .byte zz___XX___  ; 3
        .byte zz__XXXX__  ; 4
        .byte zz_XXX_XXX  ; 5
        .byte zzXXX__XXX  ; 6
        .byte zz___XXX_X  ; 7
        .byte zz__XXX__X  ; 8
        .byte zz__XXXXXX  ; 9
        .byte zz_XX__XXX  ; 10
        .byte zz_X____XX  ; 11
        .byte zzX______X  ; 12
        .byte zz________  ; 13
        .byte zz________  ; 14
        .byte zz________  ; 15
        .byte zz________  ; 16
        .byte zz________  ; 17
        .byte zz________  ; 18
        .byte zz__X_____  ; 19
        .byte zz_XXX____  ; 20
        .byte zz_X______  ; 21
        .byte zz________  ; 22
        .byte zz________  ; 23
        .byte zz________  ; 24
        .byte zz________  ; 25
        .byte zz________  ; 26
        .byte zz________  ; 27
        .byte zz________  ; 28
        .byte zz________  ; 29
        .byte zz________  ; 30
        .byte zz________  ; 31
        .byte zz_X___X__  ; 32
        .byte zz_XXXXX__  ; 33
        .byte zz_XXXXX__  ; 34
        .byte zz_X_X_X__  ; 35
        .byte zz_X___X__  ; 36
        .byte zz_XX_XX__  ; 37
        .byte zz__XXX___  ; 38
        .byte zz________  ; 39
        .byte zz________  ; 40
        .byte zz________  ; 41
        .byte zz________  ; 42
        .byte zz________  ; 43
        .byte zz________  ; 44

Flag2
        .byte zz________  ; 1
        .byte zzX_______  ; 2
        .byte zz_X______  ; 3
        .byte zz_XX_____  ; 4
        .byte zz_XXXX___  ; 5
        .byte zz_X_XXX__  ; 6
        .byte zz_X_X_XXX  ; 7
        .byte zzXXXX_XXX  ; 8
        .byte zz_XX_XX_X  ; 9
        .byte zz___XX__X  ; 10
        .byte zz____XXXX  ; 11
        .byte zz_____XXX  ; 12
        .byte zz______XX  ; 13
        .byte zz_______X  ; 14
        .byte zz________  ; 15
        .byte zz________  ; 16
        .byte zz________  ; 17
        .byte zz________  ; 18
        .byte zz________  ; 19
        .byte zz_X______  ; 20
        .byte zz_XX_____  ; 21
        .byte zz__XX____  ; 22
        .byte zz________  ; 23
        .byte zz________  ; 24
        .byte zz________  ; 25
        .byte zz________  ; 26
        .byte zz________  ; 27
        .byte zz________  ; 28
        .byte zz________  ; 29
        .byte zz________  ; 30
        .byte zz________  ; 31
        .byte zz________  ; 32
        .byte zz________  ; 33
        .byte zz___X___X  ; 34
        .byte zz___XXXXX  ; 35
        .byte zz___XXXXX  ; 36
        .byte zz___X_X_X  ; 37
        .byte zz___X___X  ; 38
        .byte zz___XX_XX  ; 39
        .byte zz____XXX_  ; 40
        .byte zz________  ; 41
        .byte zz________  ; 42
        .byte zz________  ; 43
        .byte zz________  ; 44


Flag3
        .byte zz________  ; 1
        .byte zz________  ; 2
        .byte zz________  ; 3
        .byte zz________  ; 4
        .byte zzX_______  ; 5
        .byte zz_X______  ; 6
        .byte zz_X______  ; 7
        .byte zz_XX__XXX  ; 8
        .byte zzX_XXXXXX  ; 9
        .byte zz_X_XXX_X  ; 10
        .byte zz_X_X_X_X  ; 11
        .byte zz__X___XX  ; 12
        .byte zz__XXXXXX  ; 13
        .byte zz__XXXXXX  ; 14
        .byte zz____X__X  ; 15
        .byte zz________  ; 16
        .byte zz________  ; 17
        .byte zz________  ; 18
        .byte zz________  ; 19
        .byte zz________  ; 20
        .byte zz__X_____  ; 21
        .byte zz_XXX____  ; 22
        .byte zz_X______  ; 23
        .byte zz________  ; 24
        .byte zz________  ; 25
        .byte zz________  ; 26
        .byte zz________  ; 27
        .byte zz________  ; 28
        .byte zz________  ; 29
        .byte zz________  ; 30
        .byte zz________  ; 31
        .byte zz________  ; 32
        .byte zz________  ; 33
        .byte zz__X___X_  ; 34
        .byte zz__XXXXX_  ; 35
        .byte zz__XXXXX_  ; 36
        .byte zz__X_X_X_  ; 37
        .byte zz__X___X_  ; 38
        .byte zz__XX_XX_  ; 39
        .byte zz___XXX__  ; 40
        .byte zz________  ; 41
        .byte zz________  ; 42
        .byte zz________  ; 43
        .byte zz________  ; 44



Flag4
        .byte zz________  ; 1
        .byte zz________  ; 2
        .byte zz________  ; 3
        .byte zz________  ; 4
        .byte zz________  ; 5
        .byte zz____XXXX  ; 6
        .byte zz___XXXXX  ; 7
        .byte zz__XX_X_X  ; 8
        .byte zz__XX_X_X  ; 9
        .byte zz_X_XX_XX  ; 10
        .byte zzXX__XXXX  ; 11
        .byte zz__XXXXXX  ; 12
        .byte zz__XX___X  ; 13
        .byte zz_XX_____  ; 14
        .byte zz_X______  ; 15
        .byte zzX_______  ; 16
        .byte zz________  ; 17
        .byte zz________  ; 18
        .byte zz________  ; 19
        .byte zz________  ; 20
        .byte zz__XX____  ; 21
        .byte zz__X_____  ; 22
        .byte zz_X______  ; 23
        .byte zz_X______  ; 24
        .byte zz________  ; 25
        .byte zz________  ; 26
        .byte zz________  ; 27
        .byte zz________  ; 28
        .byte zz________  ; 29
        .byte zz________  ; 30
        .byte zz________  ; 31
        .byte zz________  ; 32
        .byte zz_X___X__  ; 33
        .byte zz_XXXXX__  ; 34
        .byte zz_XXXXX__  ; 35
        .byte zz_X_X_X__  ; 36
        .byte zz_X___X__  ; 37
        .byte zz_XX_XX__  ; 38
        .byte zz__XXX___  ; 39
        .byte zz________  ; 40
        .byte zz________  ; 41
        .byte zz________  ; 42
        .byte zz________  ; 43
        .byte zz________  ; 44

KnightLtoR
        .byte HMOVE_R1

        ; .byte HMOVE_0 | HMOVE_R1 ; 1
        ; .byte HMOVE_0 | HMOVE_0  ; 2
        ; .byte HMOVE_0 | HMOVE_0  ; 3
        ; .byte HMOVE_0 | HMOVE_0  ; 4
        ; .byte HMOVE_0 | HMOVE_0  ; 5
        ; .byte HMOVE_0 | HMOVE_0  ; 6
        ; .byte HMOVE_0 | HMOVE_0  ; 7
        ; .byte HMOVE_0 | HMOVE_0  ; 8
        ; .byte HMOVE_0 | HMOVE_0  ; 9
        ; .byte HMOVE_0 | HMOVE_0  ; 10
        ; .byte HMOVE_0 | HMOVE_0  ; 11
        ; .byte HMOVE_0 | HMOVE_0  ; 12
        ; .byte HMOVE_0 | HMOVE_0  ; 13
        ; .byte HMOVE_0 | HMOVE_0  ; 14
        ; .byte HMOVE_0 | HMOVE_0  ; 15
        ; .byte HMOVE_0 | HMOVE_0  ; 16
        ; .byte HMOVE_0 | HMOVE_0  ; 17
        ; .byte HMOVE_0 | HMOVE_0  ; 18
        ; .byte HMOVE_0 | HMOVE_0  ; 19
        ; .byte HMOVE_0 | HMOVE_0  ; 20
        ; .byte HMOVE_0 | HMOVE_0  ; 21
        ; .byte HMOVE_0 | HMOVE_0  ; 22
        ; .byte HMOVE_0 | HMOVE_0  ; 23
        ; .byte HMOVE_0 | HMOVE_0  ; 24
        ; .byte HMOVE_0 | HMOVE_0  ; 25
        ; .byte HMOVE_0 | HMOVE_0  ; 26
        ; .byte HMOVE_0 | HMOVE_0  ; 27
        ; .byte HMOVE_0 | HMOVE_0  ; 28
        ; .byte HMOVE_0 | HMOVE_0  ; 29
        ; .byte HMOVE_0 | HMOVE_0  ; 30
        ; .byte HMOVE_0 | HMOVE_0  ; 31
        ; .byte HMOVE_0 | HMOVE_0  ; 32
        ; .byte HMOVE_0 | HMOVE_0  ; 33
        ; .byte HMOVE_0 | HMOVE_0  ; 34
        ; .byte HMOVE_0 | HMOVE_0  ; 35
        ; .byte HMOVE_0 | HMOVE_0  ; 36
        ; .byte HMOVE_0 | HMOVE_0  ; 37
        ; .byte HMOVE_0 | HMOVE_0  ; 38
        ; .byte HMOVE_0 | HMOVE_0  ; 39
        ; .byte HMOVE_0 | HMOVE_0  ; 40
        ; .byte HMOVE_0 | HMOVE_0  ; 41
        ; .byte HMOVE_0 | HMOVE_0  ; 42
        ; .byte HMOVE_0 | HMOVE_0  ; 43
        ; .byte HMOVE_0 | HMOVE_0  ; 44



KnightRtoL
        .byte HMOVE_L1

        ; .byte HMOVE_0 | HMOVE_L1 ; 1
        ; .byte HMOVE_0 | HMOVE_0  ; 2
        ; .byte HMOVE_0 | HMOVE_0  ; 3
        ; .byte HMOVE_0 | HMOVE_0  ; 4
        ; .byte HMOVE_0 | HMOVE_0  ; 5
        ; .byte HMOVE_0 | HMOVE_0  ; 6
        ; .byte HMOVE_0 | HMOVE_0  ; 7
        ; .byte HMOVE_0 | HMOVE_0  ; 8
        ; .byte HMOVE_0 | HMOVE_0  ; 9
        ; .byte HMOVE_0 | HMOVE_0  ; 10
        ; .byte HMOVE_0 | HMOVE_0  ; 11
        ; .byte HMOVE_0 | HMOVE_0  ; 12
        ; .byte HMOVE_0 | HMOVE_0  ; 13
        ; .byte HMOVE_0 | HMOVE_0  ; 14
        ; .byte HMOVE_0 | HMOVE_0  ; 15
        ; .byte HMOVE_0 | HMOVE_0  ; 16
        ; .byte HMOVE_0 | HMOVE_0  ; 17
        ; .byte HMOVE_0 | HMOVE_0  ; 18
        ; .byte HMOVE_0 | HMOVE_0  ; 19
        ; .byte HMOVE_0 | HMOVE_0  ; 20
        ; .byte HMOVE_0 | HMOVE_0  ; 21
        ; .byte HMOVE_0 | HMOVE_0  ; 22
        ; .byte HMOVE_0 | HMOVE_0  ; 23
        ; .byte HMOVE_0 | HMOVE_0  ; 24
        ; .byte HMOVE_0 | HMOVE_0  ; 25
        ; .byte HMOVE_0 | HMOVE_0  ; 26
        ; .byte HMOVE_0 | HMOVE_0  ; 27
        ; .byte HMOVE_0 | HMOVE_0  ; 28
        ; .byte HMOVE_0 | HMOVE_0  ; 29
        ; .byte HMOVE_0 | HMOVE_0  ; 30
        ; .byte HMOVE_0 | HMOVE_0  ; 31
        ; .byte HMOVE_0 | HMOVE_0  ; 32
        ; .byte HMOVE_0 | HMOVE_0  ; 33
        ; .byte HMOVE_0 | HMOVE_0  ; 34
        ; .byte HMOVE_0 | HMOVE_0  ; 35
        ; .byte HMOVE_0 | HMOVE_0  ; 36
        ; .byte HMOVE_0 | HMOVE_0  ; 37
        ; .byte HMOVE_0 | HMOVE_0  ; 38
        ; .byte HMOVE_0 | HMOVE_0  ; 39
        ; .byte HMOVE_0 | HMOVE_0  ; 40
        ; .byte HMOVE_0 | HMOVE_0  ; 41
        ; .byte HMOVE_0 | HMOVE_0  ; 42
        ; .byte HMOVE_0 | HMOVE_0  ; 43
        ; .byte HMOVE_0 | HMOVE_0  ; 44




MessageDrawShift
MessageDemoShift
        .byte HMOVE_0 | HMOVE_0 >> 4 ; 1
        .byte HMOVE_0 | HMOVE_0 >> 4 ; 2
        .byte HMOVE_0 | HMOVE_0 >> 4 ; 3
        .byte HMOVE_0 | HMOVE_0 >> 4 ; 4
        .byte HMOVE_0 | HMOVE_0 >> 4 ; 5
        .byte HMOVE_0 | HMOVE_0 >> 4 ; 6
        .byte HMOVE_0 | HMOVE_0 >> 4 ; 7
        .byte HMOVE_0 | HMOVE_0 >> 4 ; 8
        .byte HMOVE_0 | HMOVE_0 >> 4 ; 9
        .byte HMOVE_0 | HMOVE_0 >> 4 ; 10
        .byte HMOVE_0 | HMOVE_0 >> 4 ; 11
        .byte HMOVE_0 | HMOVE_0 >> 4 ; 12
        .byte HMOVE_0 | HMOVE_0 >> 4 ; 13
        .byte HMOVE_0 | HMOVE_0 >> 4 ; 14
        .byte HMOVE_0 | HMOVE_R8 >> 4 ; 15
        .byte HMOVE_0 | HMOVE_0 >> 4 ; 16
        .byte HMOVE_0 | HMOVE_0 >> 4 ; 17
        .byte HMOVE_0 | HMOVE_R8 >> 4
        .byte HMOVE_0 | HMOVE_0 >> 4
        .byte HMOVE_0 | HMOVE_0 >> 4
        .byte HMOVE_0 | HMOVE_0 >> 4
        .byte HMOVE_0 | HMOVE_0 >> 4
        .byte HMOVE_0 | HMOVE_0 >> 4
        .byte HMOVE_0 | HMOVE_0 >> 4
        .byte HMOVE_0 | HMOVE_0 >> 4
        .byte HMOVE_0 | HMOVE_0 >> 4
        .byte HMOVE_0 | HMOVE_0 >> 4
        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4
;        .byte HMOVE_0 | HMOVE_0 >> 4




MessageDrawL
        .byte zz________ ; 1
        .byte zz________ ; 2
        .byte zz________ ; 3
        .byte zz________ ; 4
        .byte zz________ ; 5
        .byte zz________ ; 6
        .byte zz________ ; 7
        .byte zz________ ; 8
        .byte zz________ ; 9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zzXX__XX__ ; 20
        .byte zzX_X_X_X_ ; 21
        .byte zzX_X_X_X_ ; 22
        .byte zzX_X_XX__ ; 23
        .byte zzX_X_X_X_ ; 24
        .byte zzX_X_X_X_ ; 25
        .byte zzXX__X_X_ ; 26
;        .byte zz________ ; 27
;        .byte zz________ ; 28
;        .byte zz________ ; 29
;        .byte zz________ ; 30
;        .byte zz________ ; 31
;        .byte zz________ ; 32
;        .byte zz________ ; 33
;        .byte zz________ ; 34
;        .byte zz________ ; 35
;        .byte zz________ ; 36
;        .byte zz________ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44


MessageDrawR
        .byte zz________ ; 1
        .byte zz________ ; 2
        .byte zz________ ; 3
        .byte zz________ ; 4
        .byte zz________ ; 5
        .byte zz________ ; 6
        .byte zz________ ; 7
        .byte zz________ ; 8
        .byte zz________ ; 9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zz_X__X_X_ ; 20
        .byte zzX_X_X_X_ ; 21
        .byte zzX_X_X_X_ ; 22
        .byte zzXXX_X_X_ ; 23
        .byte zzX_X_X_X_ ; 24
        .byte zzX_X_XXX_ ; 25
        .byte zzX_X_X_X_ ; 26
;        .byte zz________ ; 27
;        .byte zz________ ; 28
;        .byte zz________ ; 29
;        .byte zz________ ; 30
;        .byte zz________ ; 31
;        .byte zz________ ; 32
;        .byte zz________ ; 33
;        .byte zz________ ; 34
;        .byte zz________ ; 35
;        .byte zz________ ; 36
;        .byte zz________ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44

MessageDemoL
        .byte zz________ ; 1
        .byte zz________ ; 2
        .byte zz________ ; 3
        .byte zz________ ; 4
        .byte zz________ ; 5
        .byte zz________ ; 6
        .byte zz________ ; 7
        .byte zz________ ; 8
        .byte zz________ ; 9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zzXX__XX__ ; 20
        .byte zzX_X_X__X ; 21
        .byte zzX_X_X__X ; 22
        .byte zzX_X_XX_X ; 23
        .byte zzX_X_X__X ; 24
        .byte zzX_X_X__X ; 25
        .byte zzXX__XX_X; 26
;        .byte zz________ ; 27
;        .byte zz________ ; 28
;        .byte zz________ ; 29
;        .byte zz________ ; 30
;        .byte zz________ ; 31
;        .byte zz________ ; 32
;        .byte zz________ ; 33
;        .byte zz________ ; 34
;        .byte zz________ ; 35
;        .byte zz________ ; 36
;        .byte zz________ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44


MessageDemoR
        .byte zz________ ; 1
        .byte zz________ ; 2
        .byte zz________ ; 3
        .byte zz________ ; 4
        .byte zz________ ; 5
        .byte zz________ ; 6
        .byte zz________ ; 7
        .byte zz________ ; 8
        .byte zz________ ; 9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zzX_X___X_ ; 20
        .byte zz_X_X_X_X ; 21
        .byte zz_X_X_X_X ; 22
        .byte zz_X_X_X_X ; 23
        .byte zz_X_X_X_X ; 24
        .byte zz_X_X_X_X ; 25
        .byte zz_X_X__X_ ; 26
;        .byte zz________ ; 27
;        .byte zz________ ; 28
;        .byte zz________ ; 29
;        .byte zz________ ; 30
;        .byte zz________ ; 31
;        .byte zz________ ; 32
;        .byte zz________ ; 33
;        .byte zz________ ; 34
;        .byte zz________ ; 35
;        .byte zz________ ; 36
;        .byte zz________ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44


Wings1TL1   ; TailLess image for Dragon X = 0 thru 6 (facing right)
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zz________ ; 20
        .byte zz________ ; 21
        .byte zz________ ; 22
        .byte zz________ ; 23
        .byte zz________ ; 24
        .byte zz________ ; 25
        .byte zz__X___X_ ; 26
        .byte zzXX______ ; 27
        .byte zzXX_X____ ; 28
        .byte zzXX______ ; 29
        .byte zzXX_X____ ; 30
        .byte zzXXX_____ ; 31
        .byte zzXXX_____ ; 32
        .byte zzX_X_____ ; 33
        .byte zzXXX_____ ; 34
        .byte zzX_XXXX__ ; 35
        .byte zzXX______ ; 36
        .byte zzX__XX___ ; 37
        .byte zzXXX_____ ; 38
        .byte zzX___XX__ ; 39
        .byte zz_XX_____ ; 40
        .byte zz___XXX__ ; 41
        .byte zzXXX_____ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46


Wings1HL1   ; HeadLess image for Dragon X = 0 thru 6 (facing left)
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zz________ ; 20
        .byte zz________ ; 21
        .byte zz________ ; 22
        .byte zz________ ; 23
        .byte zz________ ; 24
        .byte zz________ ; 25
        .byte zz__X_____ ; 26
        .byte zzXX______ ; 27
        .byte zzXX______ ; 28
        .byte zzXX______ ; 29
        .byte zzXX_X____ ; 30
        .byte zzXXX_____ ; 31
        .byte zzXXX_____ ; 32
        .byte zzX_X_____ ; 33
        .byte zzXXX_____ ; 34
        .byte zzX_XXXX__ ; 35
        .byte zzXX______ ; 36
        .byte zzX__XX___ ; 37
        .byte zzXXX_____ ; 38
        .byte zzX___XX__ ; 39
        .byte zz_XX_____ ; 40
        .byte zzX__XXX__ ; 41
        .byte zzXXX_____ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46
Wings1
Wings1TL2  ; TailLess image for Dragon X = 7 thru 9 (facing right)
Wings1HL2  ; Headless image for Dragon X = 7 thru 9 (facing left)

        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zz________ ; 20
        .byte zz________ ; 21
        .byte zz________ ; 22
        .byte zz________ ; 23
        .byte zz________ ; 24
        .byte zz________ ; 25
        .byte zz__X___X_ ; 26
        .byte zzXX______ ; 27
        .byte zzXX_X____ ; 28
        .byte zzXX______ ; 29
        .byte zzXX_X____ ; 30
        .byte zzXXX_____ ; 31
        .byte zzXXX_____ ; 32
        .byte zzX_X_____ ; 33
        .byte zzXXX_____ ; 34
        .byte zzX_XXXX__ ; 35
        .byte zzXX______ ; 36
        .byte zzX__XX___ ; 37
        .byte zzXXX_____ ; 38
        .byte zzX___XX__ ; 39
        .byte zz_XX_____ ; 40
        .byte zzX__XXX__ ; 41
        .byte zzXXX_____ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46




Body1TL1  ; TailLess image for Dragon X = 0 thru 6 (facing right)
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz_____X__ ; 15
        .byte zz___X____ ; 16
        .byte zzX_X_____ ; 17
        .byte zzXX______ ; 18
        .byte zz_X_X____ ; 19
        .byte zzXXX_____ ; 20
        .byte zz_XXXX___ ; 21
        .byte zzX__X____ ; 22
        .byte zz_X______ ; 23
        .byte zzX_______ ; 24
        .byte zzXX______ ; 25
        .byte zzXX______ ; 26
        .byte zzXX______ ; 27
        .byte zz_X______ ; 28
        .byte zzX__XX___ ; 29
        .byte zzXX__X___ ; 30
        .byte zzXX___X__ ; 31
        .byte zzXX___X__ ; 32
        .byte zzXXXXXXXX ; 33
        .byte zzXXX_____ ; 34
        .byte zzXXXX____ ; 35
        .byte zzXXX___X_ ; 36
        .byte zzXXXXX___ ; 37
        .byte zz___XX_X_ ; 38
        .byte zz________ ; 39
        .byte zz_____X__ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body1TL2  ; TailLess image for Dragon X = 7 thru 9 (facing right)
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz_____X__ ; 15
        .byte zz___X____ ; 16
        .byte zzX_X_____ ; 17
        .byte zzXX______ ; 18
        .byte zz_X_X____ ; 19
        .byte zzXXX_____ ; 20
        .byte zz_XXXX___ ; 21
        .byte zzX__X____ ; 22
        .byte zz_X______ ; 23
        .byte zzX_______ ; 24
        .byte zzXX______ ; 25
        .byte zzXX______ ; 26
        .byte zzXX______ ; 27
        .byte zz_X______ ; 28
        .byte zzX__XX___ ; 29
        .byte zzXX__X___ ; 30
        .byte zzXX___X__ ; 31
        .byte zzXX___X__ ; 32
        .byte zzXXXXXXXX ; 33
        .byte zzXXX_____ ; 34
        .byte zzXXXX____ ; 35
        .byte zzXXX___X_ ; 36
        .byte zzXXXXX___ ; 37
        .byte zzX__XX_X_ ; 38
        .byte zzX__X____ ; 39
        .byte zz____XX__ ; 40
        .byte zz___XX___ ; 41
        .byte zz_XXX____ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body1HL1  ; Headless image for Dragon X = 0 thru 6 (facing left)
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zz________ ; 20
        .byte zz________ ; 21
        .byte zz________ ; 22
        .byte zz________ ; 23
        .byte zz________ ; 24
        .byte zz________ ; 25
        .byte zz________ ; 26
        .byte zz________ ; 27
        .byte zz_X______ ; 28
        .byte zzX__XX___ ; 29
        .byte zzXX__X___ ; 30
        .byte zzXX___X__ ; 31
        .byte zzXX___X__ ; 32
        .byte zzXXXXXXXX ; 33
        .byte zzXXX_____ ; 34
        .byte zzXXXX____ ; 35
        .byte zzXXX___X_ ; 36
        .byte zzXXXXX___ ; 37
        .byte zzX__XX_X_ ; 38
        .byte zzX__X____ ; 39
        .byte zzXX__XX__ ; 40
        .byte zzX__XX___ ; 41
        .byte zzXXXX____ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body1HL2  ; Headless image for Dragon X = 7 thru 9 (facing right)
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz_____X__ ; 15
        .byte zz___X____ ; 16
        .byte zzX_X_____ ; 17
        .byte zzXX______ ; 18
        .byte zz_X______ ; 19
        .byte zzXX______ ; 20
        .byte zz_XX_____ ; 21
        .byte zzX_______ ; 22
        .byte zz_X______ ; 23
        .byte zzX_______ ; 24
        .byte zzXX______ ; 25
        .byte zzXX______ ; 26
        .byte zzXX______ ; 27
        .byte zz_X______ ; 28
        .byte zzX__XX___ ; 29
        .byte zzXX__X___ ; 30
        .byte zzXX___X__ ; 31
        .byte zzXX___X__ ; 32
        .byte zzXXXXXXXX ; 33
        .byte zzXXX_____ ; 34
        .byte zzXXXX____ ; 35
        .byte zzXXX___X_ ; 36
        .byte zzXXXXX___ ; 37
        .byte zzX__XX_X_ ; 38
        .byte zzX__X____ ; 39
        .byte zzXX__XX__ ; 40
        .byte zzX__XX___ ; 41
        .byte zzXXXX____ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body1
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz_____X__ ; 15
        .byte zz___X____ ; 16
        .byte zzX_X_____ ; 17
        .byte zzXX______ ; 18
        .byte zz_X_X____ ; 19
        .byte zzXXX_____ ; 20
        .byte zz_XXXX___ ; 21
        .byte zzX__X____ ; 22
        .byte zz_X______ ; 23
        .byte zzX_______ ; 24
        .byte zzXX______ ; 25
        .byte zzXX______ ; 26
        .byte zzXX______ ; 27
        .byte zz_X______ ; 28
        .byte zzX__XX___ ; 29
        .byte zzXX__X___ ; 30
        .byte zzXX___X__ ; 31
        .byte zzXX___X__ ; 32
        .byte zzXXXXXXXX ; 33
        .byte zzXXX_____ ; 34
        .byte zzXXXX____ ; 35
        .byte zzXXX___X_ ; 36
        .byte zzXXXXX___ ; 37
        .byte zzX__XX_X_ ; 38
        .byte zzX__X____ ; 39
        .byte zzXX__XX__ ; 40
        .byte zzX__XX___ ; 41
        .byte zzXXXX____ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46


Shift1LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_R7 >> 4 ; 15 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 16 x0=14 x1=27
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 17 x0=14 x1=31
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 18 x0=14 x1=33
        .byte HMOVE_0  | HMOVE_L2  >> 4 ; 19 x0=14 x1=33
        .byte HMOVE_0  | HMOVE_R2  >> 4 ; 20 x0=14 x1=33
        .byte HMOVE_0  | HMOVE_L2  >> 4 ; 21 x0=14 x1=33
        .byte HMOVE_0  | HMOVE_R2  >> 4 ; 22 x0=14 x1=33
        .byte HMOVE_0  | HMOVE_L2  >> 4 ; 23 x0=14 x1=33
        .byte HMOVE_0  | HMOVE_R2  >> 4 ; 24 x0=14 x1=33
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 25 x0=14 x1=31
        .byte HMOVE_R7 | HMOVE_L2 >> 4 ; 26 x0=21 x1=29
        .byte HMOVE_R4 | HMOVE_0  >> 4 ; 27 x0=25 x1=29
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 28 x0=25 x1=27
        .byte HMOVE_L2 | HMOVE_L6 >> 4 ; 29 x0=23 x1=21
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 30 x0=23 x1=19
        .byte HMOVE_L2 | HMOVE_L2 >> 4 ; 31 x0=21 x1=17
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 32 x0=20 x1=16
        .byte HMOVE_R2 | HMOVE_L1 >> 4 ; 33 x0=22 x1=15
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 34 x0=23 x1=15
        .byte HMOVE_L6 | HMOVE_L1 >> 4 ; 35 x0=17 x1=14
        .byte HMOVE_R5 | HMOVE_0  >> 4 ; 36 x0=22 x1=14
        .byte HMOVE_L6 | HMOVE_L1 >> 4 ; 37 x0=16 x1=13
        .byte HMOVE_R4 | HMOVE_L6 >> 4 ; 38 x0=20 x1= 7
        .byte HMOVE_L6 | HMOVE_L1 >> 4 ; 39 x0=14 x1= 6
        .byte HMOVE_R4 | HMOVE_L3 >> 4 ; 40 x0=18 x1= 3
        .byte HMOVE_L6 | HMOVE_0  >> 4 ; 41 x0=12 x1= 3
        .byte HMOVE_R4 | HMOVE_R2 >> 4 ; 42 x0=16 x1= 5
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=16 x1= 5
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=16 x1= 5
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=16 x1= 5
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=16 x1= 5

Shift1RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_0  | HMOVE_L7 >> 4 ; 15
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 16
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 17
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 18
        .byte HMOVE_0  | HMOVE_R2  >> 4 ; 19
        .byte HMOVE_0  | HMOVE_L2  >> 4 ; 20
        .byte HMOVE_0  | HMOVE_R2  >> 4 ; 21
        .byte HMOVE_0  | HMOVE_L2  >> 4 ; 22
        .byte HMOVE_0  | HMOVE_R2  >> 4 ; 23
        .byte HMOVE_0  | HMOVE_L2  >> 4 ; 24
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 25
        .byte HMOVE_L7 | HMOVE_R2 >> 4 ; 26
        .byte HMOVE_L4 | HMOVE_0  >> 4 ; 27
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 28
        .byte HMOVE_R2 | HMOVE_R6 >> 4 ; 29
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 30
        .byte HMOVE_R2 | HMOVE_R2 >> 4 ; 31
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_L2 | HMOVE_R1 >> 4 ; 33
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 34
        .byte HMOVE_R6 | HMOVE_R1 >> 4 ; 35
        .byte HMOVE_L5 | HMOVE_0  >> 4 ; 36
        .byte HMOVE_R6 | HMOVE_R1 >> 4 ; 37
        .byte HMOVE_L4 | HMOVE_R6 >> 4 ; 38
        .byte HMOVE_R6 | HMOVE_R1 >> 4 ; 39
        .byte HMOVE_L4 | HMOVE_R3 >> 4 ; 40
        .byte HMOVE_R6 | HMOVE_0  >> 4 ; 41
        .byte HMOVE_L4 | HMOVE_L2 >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 1

Wings2
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zzXXXX____ ; 18
        .byte zzXXXX____ ; 19
        .byte zzXXX_____ ; 20
        .byte zzXXX_____ ; 21
        .byte zzXXX_____ ; 22
        .byte zzXXX_____ ; 23
        .byte zzXX_X____ ; 24
        .byte zzXX_X____ ; 25
        .byte zzXXXX_X__ ; 26
        .byte zzXX______ ; 27
        .byte zzX__X____ ; 28
        .byte zz________ ; 29
        .byte zzX_______ ; 30
        .byte zz________ ; 31
        .byte zzXX______ ; 32
        .byte zzXXX_____ ; 33
        .byte zzXXX_____ ; 34
        .byte zzX__X____ ; 35
        .byte zz________ ; 36
        .byte zzX_______ ; 37
        .byte zz________ ; 38
        .byte zzX_______ ; 39
        .byte zz________ ; 40
        .byte zzX_______ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body2
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz______X_ ; 17
        .byte zz____XX__ ; 18
        .byte zzXXX_XX__ ; 19
        .byte zzXXXX____ ; 20
        .byte zzXXX_____ ; 21
        .byte zzX_______ ; 22
        .byte zzXX______ ; 23
        .byte zzXX______ ; 24
        .byte zzXX______ ; 25
        .byte zzX_______ ; 26
        .byte zzXX______ ; 27
        .byte zzXX______ ; 28
        .byte zzXXXXX___ ; 29
        .byte zzXXXXX___ ; 30
        .byte zzXXXXXX_X ; 31
        .byte zzXXX__XX_ ; 32
        .byte zzXXXX___X ; 33
        .byte zzXXX_____ ; 34
        .byte zzXX_X____ ; 35
        .byte zzXX_XX___ ; 36
        .byte zz_XX_X_X_ ; 37
        .byte zzXX__XX__ ; 38
        .byte zzX___X___ ; 39
        .byte zzX___XX__ ; 40
        .byte zzXX_XX___ ; 41
        .byte zzXXX_____ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift2LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 15 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_R7 >> 4 ; 17 x0=14 x1=21
        .byte HMOVE_R3 | HMOVE_R6 >> 4 ; 18 x0=17 x1=27
        .byte HMOVE_R2 | HMOVE_R4 >> 4 ; 19 x0=19 x1=31
        .byte HMOVE_R3 | HMOVE_R4 >> 4 ; 20 x0=22 x1=35
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 21 x0=21 x1=35
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 22 x0=19 x1=35
        .byte HMOVE_L2 | HMOVE_L2 >> 4 ; 23 x0=17 x1=33
        .byte HMOVE_R5 | HMOVE_0  >> 4 ; 24 x0=22 x1=33
        .byte HMOVE_R1 | HMOVE_L2 >> 4 ; 25 x0=23 x1=31
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 26 x0=23 x1=32
        .byte HMOVE_R2 | HMOVE_L3 >> 4 ; 27 x0=25 x1=29
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 28 x0=25 x1=27
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 29 x0=25 x1=21
        .byte HMOVE_R4 | HMOVE_L2 >> 4 ; 30 x0=29 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 31 x0=29 x1=17
        .byte HMOVE_L7 | HMOVE_L1 >> 4 ; 32 x0=22 x1=16
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 33 x0=22 x1=15
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 34 x0=21 x1=15
        .byte HMOVE_L4 | HMOVE_L1 >> 4 ; 35 x0=17 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 36 x0=17 x1=14
        .byte HMOVE_L1 | HMOVE_L3 >> 4 ; 37 x0=16 x1=11
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 38 x0=16 x1= 5
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 39 x0=14 x1= 4
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 40 x0=14 x1= 3
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 41 x0=12 x1= 3
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 42 x0=12 x1= 5
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=12 x1= 5
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=12 x1= 5
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=12 x1= 5
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=12 x1= 5

Shift2RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16
        .byte HMOVE_0  | HMOVE_L7 >> 4 ; 17
        .byte HMOVE_L3 | HMOVE_L6 >> 4 ; 18
        .byte HMOVE_L2 | HMOVE_L4 >> 4 ; 19
        .byte HMOVE_L3 | HMOVE_L4 >> 4 ; 20
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 21
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_R2 | HMOVE_R2 >> 4 ; 23
        .byte HMOVE_L5 | HMOVE_0  >> 4 ; 24
        .byte HMOVE_L1 | HMOVE_R2 >> 4 ; 25
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 26
        .byte HMOVE_L2 | HMOVE_R3 >> 4 ; 27
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 28
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 29
        .byte HMOVE_L4 | HMOVE_R2 >> 4 ; 30
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 31
        .byte HMOVE_R7 | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 33
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 34
        .byte HMOVE_R4 | HMOVE_R1 >> 4 ; 35
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 36
        .byte HMOVE_R1 | HMOVE_R3 >> 4 ; 37
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 38
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 39
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 40
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 41
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 2

Wings3
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zzXX______ ; 13
        .byte zzXX______ ; 14
        .byte zzXX______ ; 15
        .byte zzXX______ ; 16
        .byte zzXX______ ; 17
        .byte zzX_______ ; 18
        .byte zzXX_X____ ; 19
        .byte zzXXXXX_X_ ; 20
        .byte zzXXX__X__ ; 21
        .byte zzX___X___ ; 22
        .byte zzXX_X____ ; 23
        .byte zzXXX_X___ ; 24
        .byte zzXX_X____ ; 25
        .byte zzXXX__X__ ; 26
        .byte zzXX______ ; 27
        .byte zzX__X____ ; 28
        .byte zz________ ; 29
        .byte zzX_______ ; 30
        .byte zz________ ; 31
        .byte zzXX______ ; 32
        .byte zzXXX_____ ; 33
        .byte zzXXX_____ ; 34
        .byte zzX__X____ ; 35
        .byte zz________ ; 36
        .byte zzX_______ ; 37
        .byte zz________ ; 38
        .byte zzX_______ ; 39
        .byte zz________ ; 40
        .byte zzX_______ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body3
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz_____XXX ; 18
        .byte zz___X_XX_ ; 19
        .byte zzXXXXXX__ ; 20
        .byte zzXXX_____ ; 21
        .byte zzXX______ ; 22
        .byte zzXX______ ; 23
        .byte zzXX______ ; 24
        .byte zzXX______ ; 25
        .byte zzX_______ ; 26
        .byte zzXX______ ; 27
        .byte zzXX______ ; 28
        .byte zzXXXXX___ ; 29
        .byte zzXXXXX___ ; 30
        .byte zzXXXXXX_X ; 31
        .byte zzXXX__XX_ ; 32
        .byte zzXXXX___X ; 33
        .byte zzXXX_____ ; 34
        .byte zzXX_X____ ; 35
        .byte zzXX_XX___ ; 36
        .byte zz_XX_X_X_ ; 37
        .byte zzXX__XX__ ; 38
        .byte zzX_X_X___ ; 39
        .byte zzX__XXX__ ; 40
        .byte zzXX_XX___ ; 41
        .byte zzX_______ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift3LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12 x0=14 x1=14
        .byte HMOVE_R3 | HMOVE_0  >> 4 ; 13 x0=17 x1=14
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 14 x0=19 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 15 x0=20 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 16 x0=21 x1=14
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 17 x0=21 x1=16
        .byte HMOVE_R2 | HMOVE_R7 >> 4 ; 18 x0=23 x1=23
        .byte HMOVE_L4 | HMOVE_R6 >> 4 ; 19 x0=19 x1=29
        .byte HMOVE_L3 | HMOVE_R2 >> 4 ; 20 x0=16 x1=31
        .byte HMOVE_R3 | HMOVE_R4 >> 4 ; 21 x0=19 x1=35
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 22 x0=21 x1=35
        .byte HMOVE_R2 | HMOVE_L2 >> 4 ; 23 x0=23 x1=33
        .byte HMOVE_L3 | HMOVE_0  >> 4 ; 24 x0=20 x1=33
        .byte HMOVE_R3 | HMOVE_L2 >> 4 ; 25 x0=23 x1=31
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 26 x0=23 x1=32
        .byte HMOVE_R2 | HMOVE_L3 >> 4 ; 27 x0=25 x1=29
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 28 x0=25 x1=27
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 29 x0=25 x1=21
        .byte HMOVE_R4 | HMOVE_L2 >> 4 ; 30 x0=29 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 31 x0=29 x1=17
        .byte HMOVE_L7 | HMOVE_L1 >> 4 ; 32 x0=22 x1=16
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 33 x0=22 x1=15
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 34 x0=21 x1=15
        .byte HMOVE_L4 | HMOVE_L1 >> 4 ; 35 x0=17 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 36 x0=17 x1=14
        .byte HMOVE_L1 | HMOVE_L3 >> 4 ; 37 x0=16 x1=11
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 38 x0=16 x1= 5
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 39 x0=14 x1= 4
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 40 x0=14 x1= 3
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 41 x0=12 x1= 3
        .byte HMOVE_0  | HMOVE_R3 >> 4 ; 42 x0=12 x1= 6
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=12 x1= 6
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=12 x1= 6
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=12 x1= 6
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=12 x1= 6

Shift3RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12
        .byte HMOVE_L3 | HMOVE_0  >> 4 ; 13
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 14
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 15
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 16
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 17
        .byte HMOVE_L2 | HMOVE_L7 >> 4 ; 18
        .byte HMOVE_R4 | HMOVE_L6 >> 4 ; 19
        .byte HMOVE_R3 | HMOVE_L2 >> 4 ; 20
        .byte HMOVE_L3 | HMOVE_L4 >> 4 ; 21
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_L2 | HMOVE_R2 >> 4 ; 23
        .byte HMOVE_R3 | HMOVE_0  >> 4 ; 24
        .byte HMOVE_L3 | HMOVE_R2 >> 4 ; 25
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 26
        .byte HMOVE_L2 | HMOVE_R3 >> 4 ; 27
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 28
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 29
        .byte HMOVE_L4 | HMOVE_R2 >> 4 ; 30
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 31
        .byte HMOVE_R7 | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 33
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 34
        .byte HMOVE_R4 | HMOVE_R1 >> 4 ; 35
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 36
        .byte HMOVE_R1 | HMOVE_R3 >> 4 ; 37
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 38
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 39
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 40
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 41
        .byte HMOVE_0  | HMOVE_L3 >> 4 ; 42
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 3

Wings4
        .byte zzX_______ ;  3
        .byte zzX_______ ;  4
        .byte zzX_______ ;  5
        .byte zzX__X____ ;  6
        .byte zzX_X_____ ;  7
        .byte zzXXX_____ ;  8
        .byte zzXXX_____ ;  9
        .byte zzXXX_____ ; 10
        .byte zzXX______ ; 11
        .byte zzX_X_____ ; 12
        .byte zzXX______ ; 13
        .byte zzXXX_____ ; 14
        .byte zzXXX_X___ ; 15
        .byte zzXXXX_X__ ; 16
        .byte zzXXX___X_ ; 17
        .byte zzX__X____ ; 18
        .byte zzXX__X___ ; 19
        .byte zzXX__X___ ; 20
        .byte zzXX___X__ ; 21
        .byte zzXX__X___ ; 22
        .byte zzXX_XX___ ; 23
        .byte zzXX_X____ ; 24
        .byte zzXXX_____ ; 25
        .byte zzXXX__X__ ; 26
        .byte zzXX______ ; 27
        .byte zzX__X____ ; 28
        .byte zz________ ; 29
        .byte zzX_______ ; 30
        .byte zz________ ; 31
        .byte zzXX______ ; 32
        .byte zzXXX_____ ; 33
        .byte zzXXX_____ ; 34
        .byte zzX__X____ ; 35
        .byte zz________ ; 36
        .byte zzX_______ ; 37
        .byte zz________ ; 38
        .byte zzX_______ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body4
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz_____X_X ; 17
        .byte zz_XXXX___ ; 18
        .byte zzXX_X____ ; 19
        .byte zzXXX_____ ; 20
        .byte zzXXXX____ ; 21
        .byte zzX_______ ; 22
        .byte zzXX______ ; 23
        .byte zzX_______ ; 24
        .byte zzXX______ ; 25
        .byte zzX_______ ; 26
        .byte zzXX______ ; 27
        .byte zzXX______ ; 28
        .byte zzXXXXX___ ; 29
        .byte zzXXXXX___ ; 30
        .byte zzXXXXXX_X ; 31
        .byte zzXXX__XX_ ; 32
        .byte zzXXXX___X ; 33
        .byte zzXXX_____ ; 34
        .byte zzXX_X____ ; 35
        .byte zzXX_XX___ ; 36
        .byte zzXXXX_X_X ; 37
        .byte zzXXXXX___ ; 38
        .byte zzX__X____ ; 39
        .byte zzX_X_____ ; 40
        .byte zzX_______ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
        .byte zz________ ; 46

Shift4LtoR
        .byte HMOVE_R6 | HMOVE_0  >> 4 ;  3 x0=20 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  4 x0=21 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  5 x0=22 x1=14
        .byte HMOVE_L6 | HMOVE_0  >> 4 ;  6 x0=16 x1=14
        .byte HMOVE_R2 | HMOVE_0  >> 4 ;  7 x0=18 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=18 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=18 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 10 x0=19 x1=14
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 11 x0=21 x1=14
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 12 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=19 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 15 x0=20 x1=14
        .byte HMOVE_L1 | HMOVE_R6 >> 4 ; 16 x0=19 x1=20
        .byte HMOVE_L2 | HMOVE_R7 >> 4 ; 17 x0=17 x1=27
        .byte HMOVE_R6 | HMOVE_R6 >> 4 ; 18 x0=23 x1=33
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 19 x0=21 x1=33
        .byte HMOVE_L1 | HMOVE_R2 >> 4 ; 20 x0=20 x1=35
        .byte HMOVE_L1 | HMOVE_L4 >> 4 ; 21 x0=19 x1=31
        .byte HMOVE_R2 | HMOVE_R4 >> 4 ; 22 x0=21 x1=35
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 23 x0=21 x1=33
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 24 x0=22 x1=33
        .byte HMOVE_R1 | HMOVE_L2 >> 4 ; 25 x0=23 x1=31
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 26 x0=23 x1=32
        .byte HMOVE_R2 | HMOVE_L3 >> 4 ; 27 x0=25 x1=29
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 28 x0=25 x1=27
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 29 x0=25 x1=21
        .byte HMOVE_R4 | HMOVE_L2 >> 4 ; 30 x0=29 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 31 x0=29 x1=17
        .byte HMOVE_L7 | HMOVE_L1 >> 4 ; 32 x0=22 x1=16
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 33 x0=22 x1=15
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 34 x0=21 x1=15
        .byte HMOVE_L4 | HMOVE_L1 >> 4 ; 35 x0=17 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 36 x0=17 x1=14
        .byte HMOVE_L1 | HMOVE_L5 >> 4 ; 37 x0=16 x1= 9
        .byte HMOVE_0  | HMOVE_L3 >> 4 ; 38 x0=16 x1= 6
        .byte HMOVE_L3 | HMOVE_L1 >> 4 ; 39 x0=13 x1= 5
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 40 x0=13 x1= 4
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 41 x0=13 x1= 6
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=13 x1= 6
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=13 x1= 6
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=13 x1= 6
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=13 x1= 6
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=13 x1= 6

Shift4RtoL
        .byte HMOVE_L6 | HMOVE_0  >> 4 ;  3
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  4
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  5
        .byte HMOVE_R6 | HMOVE_0  >> 4 ;  6
        .byte HMOVE_L2 | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 10
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 11
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 15
        .byte HMOVE_R1 | HMOVE_L6 >> 4 ; 16
        .byte HMOVE_R2 | HMOVE_L7 >> 4 ; 17
        .byte HMOVE_L6 | HMOVE_L6 >> 4 ; 18
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 19
        .byte HMOVE_R1 | HMOVE_L2 >> 4 ; 20
        .byte HMOVE_R1 | HMOVE_R4 >> 4 ; 21
        .byte HMOVE_L2 | HMOVE_L4 >> 4 ; 22
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 23
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 24
        .byte HMOVE_L1 | HMOVE_R2 >> 4 ; 25
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 26
        .byte HMOVE_L2 | HMOVE_R3 >> 4 ; 27
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 28
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 29
        .byte HMOVE_L4 | HMOVE_R2 >> 4 ; 30
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 31
        .byte HMOVE_R7 | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 33
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 34
        .byte HMOVE_R4 | HMOVE_R1 >> 4 ; 35
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 36
        .byte HMOVE_R1 | HMOVE_R5 >> 4 ; 37
        .byte HMOVE_0  | HMOVE_R3 >> 4 ; 38
        .byte HMOVE_R3 | HMOVE_R1 >> 4 ; 39
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 40
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 4

Wings5
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zzXXX_____ ; 11
        .byte zzXXX_____ ; 12
        .byte zzXXX_____ ; 13
        .byte zzXXX_____ ; 14
        .byte zzXXXX____ ; 15
        .byte zzXX_X____ ; 16
        .byte zzX_______ ; 17
        .byte zzXX______ ; 18
        .byte zzXXX_____ ; 19
        .byte zzXXX_____ ; 20
        .byte zzX_X_____ ; 21
        .byte zzXX______ ; 22
        .byte zzXX_X____ ; 23
        .byte zzXX_X____ ; 24
        .byte zzXXX_____ ; 25
        .byte zzXX______ ; 26
        .byte zzXXX_X___ ; 27
        .byte zzX_______ ; 28
        .byte zzX_______ ; 29
        .byte zz________ ; 30
        .byte zzX_______ ; 31
        .byte zzX_X_____ ; 32
        .byte zzXX______ ; 33
        .byte zzXX______ ; 34
        .byte zzX_______ ; 35
        .byte zzX_______ ; 36
        .byte zzX_______ ; 37
        .byte zz________ ; 38
        .byte zzX_______ ; 39
        .byte zzX_______ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body5
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz___X____ ;  9
        .byte zz_X______ ; 10
        .byte zzX_X_____ ; 11
        .byte zzXX______ ; 12
        .byte zzX_X_____ ; 13
        .byte zzXXX_____ ; 14
        .byte zzXXXX____ ; 15
        .byte zzX__X____ ; 16
        .byte zzX_______ ; 17
        .byte zzX_______ ; 18
        .byte zzX_______ ; 19
        .byte zzX_______ ; 20
        .byte zzX_______ ; 21
        .byte zzX_______ ; 22
        .byte zzX_______ ; 23
        .byte zzX_______ ; 24
        .byte zzX_______ ; 25
        .byte zzXX______ ; 26
        .byte zzX_______ ; 27
        .byte zzXXX_____ ; 28
        .byte zzXXX_____ ; 29
        .byte zzXXXXX___ ; 30
        .byte zzXXXXX___ ; 31
        .byte zzXXX_X_X_ ; 32
        .byte zzXX__X___ ; 33
        .byte zzXXX__X__ ; 34
        .byte zzXXX_X___ ; 35
        .byte zzXX_X_X__ ; 36
        .byte zz_XX__X__ ; 37
        .byte zzXX_XXX__ ; 38
        .byte zzX_XXX___ ; 39
        .byte zzX__XX___ ; 40
        .byte zzX_______ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift5LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_R7 >> 4 ;  9 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 10 x0=14 x1=27
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 11 x0=13 x1=27
        .byte HMOVE_R2 | HMOVE_R2 >> 4 ; 12 x0=15 x1=29
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 13 x0=17 x1=29
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 14 x0=18 x1=29
        .byte HMOVE_L3 | HMOVE_0  >> 4 ; 15 x0=15 x1=29
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 16 x0=13 x1=29
        .byte HMOVE_R4 | HMOVE_0  >> 4 ; 17 x0=17 x1=29
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18 x0=17 x1=29
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 19 x0=16 x1=29
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 20 x0=15 x1=29
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 21 x0=17 x1=29
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 22 x0=19 x1=30
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23 x0=19 x1=30
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 24 x0=20 x1=30
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 25 x0=21 x1=30
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 26 x0=21 x1=28
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 27 x0=22 x1=28
        .byte HMOVE_R1 | HMOVE_L3 >> 4 ; 28 x0=23 x1=25
        .byte HMOVE_R6 | HMOVE_L2 >> 4 ; 29 x0=29 x1=23
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 30 x0=29 x1=19
        .byte HMOVE_L2 | HMOVE_L2 >> 4 ; 31 x0=27 x1=17
        .byte HMOVE_L5 | HMOVE_L1 >> 4 ; 32 x0=22 x1=16
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 33 x0=20 x1=16
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 34 x0=21 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 35 x0=21 x1=15
        .byte HMOVE_L3 | HMOVE_L1 >> 4 ; 36 x0=18 x1=14
        .byte HMOVE_L2 | HMOVE_L3 >> 4 ; 37 x0=16 x1=11
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 38 x0=16 x1= 5
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 39 x0=14 x1= 4
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 40 x0=12 x1= 3
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 41 x0=12 x1= 5
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=12 x1= 5
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=12 x1= 5
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=12 x1= 5
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=12 x1= 5
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=12 x1= 5

Shift5RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_L7 >> 4 ;  9
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 10
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 11
        .byte HMOVE_L2 | HMOVE_L2 >> 4 ; 12
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 13
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 14
        .byte HMOVE_R3 | HMOVE_0  >> 4 ; 15
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 16
        .byte HMOVE_L4 | HMOVE_0  >> 4 ; 17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 19
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 20
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 21
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 24
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 25
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 26
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 27
        .byte HMOVE_L1 | HMOVE_R3 >> 4 ; 28
        .byte HMOVE_L6 | HMOVE_R2 >> 4 ; 29
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 30
        .byte HMOVE_R2 | HMOVE_R2 >> 4 ; 31
        .byte HMOVE_R5 | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 33
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 34
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 35
        .byte HMOVE_R3 | HMOVE_R1 >> 4 ; 36
        .byte HMOVE_R2 | HMOVE_R3 >> 4 ; 37
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 38
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 39
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 40
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 5

Wings6
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zzXX______ ; 16
        .byte zzXXXX____ ; 17
        .byte zzX_X_____ ; 18
        .byte zzX_______ ; 19
        .byte zzXX______ ; 20
        .byte zzXX______ ; 21
        .byte zzXX_X____ ; 22
        .byte zzXX______ ; 23
        .byte zzXXX__X__ ; 24
        .byte zzXX______ ; 25
        .byte zzXX______ ; 26
        .byte zzXX_X____ ; 27
        .byte zzX_______ ; 28
        .byte zzX_______ ; 29
        .byte zzX_______ ; 30
        .byte zz________ ; 31
        .byte zzX_X_____ ; 32
        .byte zzXX______ ; 33
        .byte zzXX______ ; 34
        .byte zzX_______ ; 35
        .byte zzX_______ ; 36
        .byte zzX_______ ; 37
        .byte zz________ ; 38
        .byte zzX_______ ; 39
        .byte zzX_______ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body6
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz_X______ ;  9
        .byte zzX_______ ; 10
        .byte zzX_X_____ ; 11
        .byte zzXX______ ; 12
        .byte zzX_X_____ ; 13
        .byte zzXXX_____ ; 14
        .byte zzXXXX____ ; 15
        .byte zzX__X____ ; 16
        .byte zzX_______ ; 17
        .byte zzX_______ ; 18
        .byte zzX_______ ; 19
        .byte zzX_______ ; 20
        .byte zzX_______ ; 21
        .byte zzX_______ ; 22
        .byte zzX_______ ; 23
        .byte zzX_______ ; 24
        .byte zzXX______ ; 25
        .byte zzXX______ ; 26
        .byte zzX_______ ; 27
        .byte zzXXX_____ ; 28
        .byte zzXXXX____ ; 29
        .byte zzXXXX____ ; 30
        .byte zzXXXXX___ ; 31
        .byte zzXXXXXX__ ; 32
        .byte zzXX__X___ ; 33
        .byte zzXXX_____ ; 34
        .byte zzXXX_X___ ; 35
        .byte zzXXXX_X__ ; 36
        .byte zz_XX__X__ ; 37
        .byte zzXX_XXX__ ; 38
        .byte zzX_XXX___ ; 39
        .byte zzX__X____ ; 40
        .byte zzX_______ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift6LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_R7 >> 4 ;  9 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 10 x0=14 x1=25
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 11 x0=14 x1=23
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 12 x0=14 x1=25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13 x0=14 x1=25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 15 x0=14 x1=25
        .byte HMOVE_R4 | HMOVE_0  >> 4 ; 16 x0=18 x1=25
        .byte HMOVE_L3 | HMOVE_0  >> 4 ; 17 x0=15 x1=25
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 18 x0=17 x1=25
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 19 x0=19 x1=25
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 20 x0=18 x1=26
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 21 x0=17 x1=26
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 22 x0=15 x1=26
        .byte HMOVE_R4 | HMOVE_0  >> 4 ; 23 x0=19 x1=26
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 24 x0=17 x1=26
        .byte HMOVE_R3 | HMOVE_L1 >> 4 ; 25 x0=20 x1=25
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 26 x0=21 x1=25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 27 x0=21 x1=25
        .byte HMOVE_R1 | HMOVE_L2 >> 4 ; 28 x0=22 x1=23
        .byte HMOVE_R5 | HMOVE_L4 >> 4 ; 29 x0=27 x1=19
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 30 x0=26 x1=18
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 31 x0=26 x1=17
        .byte HMOVE_L5 | HMOVE_L1 >> 4 ; 32 x0=21 x1=16
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 33 x0=20 x1=16
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 34 x0=21 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 35 x0=21 x1=15
        .byte HMOVE_L4 | HMOVE_L1 >> 4 ; 36 x0=17 x1=14
        .byte HMOVE_L1 | HMOVE_L3 >> 4 ; 37 x0=16 x1=11
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 38 x0=16 x1= 5
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 39 x0=14 x1= 4
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 40 x0=12 x1= 4
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 41 x0=12 x1= 6
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=12 x1= 6
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=12 x1= 6
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=12 x1= 6
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=12 x1= 6
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=12 x1= 6

Shift6RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_L7 >> 4 ;  9
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 10
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 11
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 15
        .byte HMOVE_L4 | HMOVE_0  >> 4 ; 16
        .byte HMOVE_R3 | HMOVE_0  >> 4 ; 17
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 18
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 19
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 20
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 21
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_L4 | HMOVE_0  >> 4 ; 23
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 24
        .byte HMOVE_L3 | HMOVE_R1 >> 4 ; 25
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 26
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 27
        .byte HMOVE_L1 | HMOVE_R2 >> 4 ; 28
        .byte HMOVE_L5 | HMOVE_R4 >> 4 ; 29
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 30
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_R5 | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 33
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 34
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 35
        .byte HMOVE_R4 | HMOVE_R1 >> 4 ; 36
        .byte HMOVE_R1 | HMOVE_R3 >> 4 ; 37
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 38
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 39
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 40
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 6

Wings7
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zzXXX_____ ; 20
        .byte zzXXX_____ ; 21
        .byte zzXX_X____ ; 22
        .byte zzXX_X____ ; 23
        .byte zzXXX_____ ; 24
        .byte zzXX_X____ ; 25
        .byte zzXXXX____ ; 26
        .byte zzXXX_X___ ; 27
        .byte zzXX______ ; 28
        .byte zzX_______ ; 29
        .byte zz________ ; 30
        .byte zzX_______ ; 31
        .byte zzX_X_____ ; 32
        .byte zzX__X_X__ ; 33
        .byte zzXX_XX___ ; 34
        .byte zzX_X_X___ ; 35
        .byte zz________ ; 36
        .byte zz________ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body7
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz__X_____ ; 12
        .byte zzX_X_____ ; 13
        .byte zzXX______ ; 14
        .byte zzXXX_____ ; 15
        .byte zzX_X_____ ; 16
        .byte zzXXXX____ ; 17
        .byte zzX__X____ ; 18
        .byte zzX_______ ; 19
        .byte zzX_______ ; 20
        .byte zzX_______ ; 21
        .byte zzX_______ ; 22
        .byte zzXX______ ; 23
        .byte zzX_______ ; 24
        .byte zzX_______ ; 25
        .byte zzXX______ ; 26
        .byte zzX_______ ; 27
        .byte zz_X______ ; 28
        .byte zzXXX_X___ ; 29
        .byte zzXXXXXX__ ; 30
        .byte zzXXXXXX__ ; 31
        .byte zzXXXX_X__ ; 32
        .byte zzXX_XX_X_ ; 33
        .byte zzXX__X__X ; 34
        .byte zzX___XX__ ; 35
        .byte zzX___X_X_ ; 36
        .byte zzX___X___ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift7LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 12 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 13 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 14 x0=14 x1=24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 15 x0=14 x1=24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16 x0=14 x1=24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17 x0=14 x1=24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18 x0=14 x1=24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19 x0=14 x1=24
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 20 x0=15 x1=24
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 21 x0=17 x1=24
        .byte HMOVE_R3 | HMOVE_0  >> 4 ; 22 x0=20 x1=24
        .byte HMOVE_L4 | HMOVE_0  >> 4 ; 23 x0=16 x1=24
        .byte HMOVE_R4 | HMOVE_R2 >> 4 ; 24 x0=20 x1=26
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 25 x0=21 x1=25
        .byte HMOVE_L3 | HMOVE_0  >> 4 ; 26 x0=18 x1=25
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 27 x0=20 x1=26
        .byte HMOVE_R4 | HMOVE_0  >> 4 ; 28 x0=24 x1=26
        .byte HMOVE_R2 | HMOVE_L6 >> 4 ; 29 x0=26 x1=20
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 30 x0=26 x1=18
        .byte HMOVE_R1 | HMOVE_L3 >> 4 ; 31 x0=27 x1=15
        .byte HMOVE_L5 | HMOVE_L1 >> 4 ; 32 x0=22 x1=14
        .byte HMOVE_L6 | HMOVE_L2 >> 4 ; 33 x0=16 x1=12
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 34 x0=15 x1=11
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 35 x0=13 x1=10
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 36 x0=13 x1=11
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 37 x0=13 x1=12
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=13 x1=12
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=13 x1=12
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=13 x1=12
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=13 x1=12
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=13 x1=12
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=13 x1=12
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=13 x1=12
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=13 x1=12
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=13 x1=12

Shift7RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 12
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 13
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 20
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 21
        .byte HMOVE_L3 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_R4 | HMOVE_0  >> 4 ; 23
        .byte HMOVE_L4 | HMOVE_L2 >> 4 ; 24
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 25
        .byte HMOVE_R3 | HMOVE_0  >> 4 ; 26
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 27
        .byte HMOVE_L4 | HMOVE_0  >> 4 ; 28
        .byte HMOVE_L2 | HMOVE_R6 >> 4 ; 29
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 30
        .byte HMOVE_L1 | HMOVE_R3 >> 4 ; 31
        .byte HMOVE_R5 | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_R6 | HMOVE_R2 >> 4 ; 33
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 34
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 35
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 37
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 7

Wings8
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zz________ ; 20
        .byte zz________ ; 21
        .byte zz___X____ ; 22
        .byte zzXX______ ; 23
        .byte zzXX______ ; 24
        .byte zzX_X_X___ ; 25
        .byte zzXX______ ; 26
        .byte zzXX_X____ ; 27
        .byte zzXXX_____ ; 28
        .byte zzX_X_____ ; 29
        .byte zzXX______ ; 30
        .byte zzX_______ ; 31
        .byte zzX_______ ; 32
        .byte zzX_X_____ ; 33
        .byte zzX__X____ ; 34
        .byte zzX_XX____ ; 35
        .byte zz________ ; 36
        .byte zz________ ; 37
        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body8
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz__X_____ ; 11
        .byte zzX_______ ; 12
        .byte zzX_X_____ ; 13
        .byte zzXXX_____ ; 14
        .byte zzX_XX____ ; 15
        .byte zzXXXX____ ; 16
        .byte zzX_X_____ ; 17
        .byte zzX_______ ; 18
        .byte zzX_______ ; 19
        .byte zzX_______ ; 20
        .byte zzX_______ ; 21
        .byte zzX_______ ; 22
        .byte zzXX______ ; 23
        .byte zzXX______ ; 24
        .byte zzX_______ ; 25
        .byte zzXXX_____ ; 26
        .byte zzX_______ ; 27
        .byte zzXX______ ; 28
        .byte zzXX_X____ ; 29
        .byte zzXXXX____ ; 30
        .byte zzXXXXX___ ; 31
        .byte zzXXXXXX__ ; 32
        .byte zzXXXXXX__ ; 33
        .byte zzXXXXXX__ ; 34
        .byte zzXXXX____ ; 35
        .byte zzX_X_____ ; 36
        .byte zzX_______ ; 37
        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift8LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 11 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 12 x0=14 x1=26
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 13 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 14 x0=14 x1=24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 15 x0=14 x1=24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16 x0=14 x1=24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17 x0=14 x1=24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18 x0=14 x1=24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19 x0=14 x1=24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=14 x1=24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21 x0=14 x1=24
        .byte HMOVE_R6 | HMOVE_0  >> 4 ; 22 x0=20 x1=24
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 23 x0=18 x1=24
        .byte HMOVE_R3 | HMOVE_0  >> 4 ; 24 x0=21 x1=24
        .byte HMOVE_L2 | HMOVE_R1 >> 4 ; 25 x0=19 x1=25
        .byte HMOVE_R1 | HMOVE_L2 >> 4 ; 26 x0=20 x1=23
        .byte HMOVE_R2 | HMOVE_R3 >> 4 ; 27 x0=22 x1=26
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 28 x0=21 x1=26
        .byte HMOVE_R3 | HMOVE_L6 >> 4 ; 29 x0=24 x1=20
        .byte HMOVE_R2 | HMOVE_L1 >> 4 ; 30 x0=26 x1=19
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 31 x0=27 x1=18
        .byte HMOVE_L2 | HMOVE_L2 >> 4 ; 32 x0=25 x1=16
        .byte HMOVE_L3 | HMOVE_L1 >> 4 ; 33 x0=22 x1=15
        .byte HMOVE_L5 | HMOVE_L1 >> 4 ; 34 x0=17 x1=14
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 35 x0=18 x1=15
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 36 x0=18 x1=19
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 37 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=18 x1=20
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=18 x1=20
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=18 x1=20
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=18 x1=20
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=18 x1=20
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=18 x1=20
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=18 x1=20
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=18 x1=20
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=18 x1=20

Shift8RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 11
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 12
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 13
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21
        .byte HMOVE_L6 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 23
        .byte HMOVE_L3 | HMOVE_0  >> 4 ; 24
        .byte HMOVE_R2 | HMOVE_L1 >> 4 ; 25
        .byte HMOVE_L1 | HMOVE_R2 >> 4 ; 26
        .byte HMOVE_L2 | HMOVE_L3 >> 4 ; 27
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 28
        .byte HMOVE_L3 | HMOVE_R6 >> 4 ; 29
        .byte HMOVE_L2 | HMOVE_R1 >> 4 ; 30
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_R2 | HMOVE_R2 >> 4 ; 32
        .byte HMOVE_R3 | HMOVE_R1 >> 4 ; 33
        .byte HMOVE_R5 | HMOVE_R1 >> 4 ; 34
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 35
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 37
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 8

Wings9
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zz________ ; 20
        .byte zz________ ; 21
        .byte zz________ ; 22
        .byte zzX__X____ ; 23
        .byte zzXX___XX_ ; 24
        .byte zzX___XX__ ; 25
        .byte zzXXXX_XX_ ; 26
        .byte zzXXX__XX_ ; 27
        .byte zzX__XX___ ; 28
        .byte zzX__X_X__ ; 29
        .byte zz_X______ ; 30
        .byte zz________ ; 31
        .byte zzX_______ ; 32
        .byte zz________ ; 33
        .byte zzX__X____ ; 34
        .byte zzX_X_____ ; 35
        .byte zz________ ; 36
        .byte zz________ ; 37
        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body9
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz__X_____ ; 11
        .byte zzX_______ ; 12
        .byte zzXXX_____ ; 13
        .byte zzXX______ ; 14
        .byte zzX_______ ; 15
        .byte zzXX______ ; 16
        .byte zzXXX_____ ; 17
        .byte zzX_X_____ ; 18
        .byte zzX_X_____ ; 19
        .byte zzX_______ ; 20
        .byte zzX_______ ; 21
        .byte zzX_______ ; 22
        .byte zzX_X_____ ; 23
        .byte zzXXX_____ ; 24
        .byte zzXXX_____ ; 25
        .byte zzX_______ ; 26
        .byte zzXX______ ; 27
        .byte zzXX______ ; 28
        .byte zzXX_X____ ; 29
        .byte zzXXXX____ ; 30
        .byte zzXXXX____ ; 31
        .byte zzXXXX____ ; 32
        .byte zzXXXXX___ ; 33
        .byte zzXXXX____ ; 34
        .byte zzX_X_X___ ; 35
        .byte zzX_X_____ ; 36
        .byte zzX_______ ; 37
        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift9LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 11 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 12 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 13 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 14 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 15 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 22 x0=14 x1=22
        .byte HMOVE_R2 | HMOVE_L2 >> 4 ; 23 x0=16 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 24 x0=16 x1=20
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 25 x0=17 x1=19
        .byte HMOVE_L1 | HMOVE_R5 >> 4 ; 26 x0=16 x1=24
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 27 x0=16 x1=22
        .byte HMOVE_R2 | HMOVE_L2 >> 4 ; 28 x0=18 x1=20
        .byte HMOVE_L2 | HMOVE_L2 >> 4 ; 29 x0=16 x1=18
        .byte HMOVE_R6 | HMOVE_L2 >> 4 ; 30 x0=22 x1=16
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 31 x0=24 x1=16
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 32 x0=22 x1=15
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 33 x0=22 x1=14
        .byte HMOVE_L7 | HMOVE_0  >> 4 ; 34 x0=15 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 35 x0=16 x1=14
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 36 x0=16 x1=15
        .byte HMOVE_0  | HMOVE_R5 >> 4 ; 37 x0=16 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=16 x1=20
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=16 x1=20
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=16 x1=20
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=16 x1=20
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=16 x1=20
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=16 x1=20
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=16 x1=20
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=16 x1=20
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=16 x1=20

Shift9RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 11
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 12
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 13
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 22
        .byte HMOVE_L2 | HMOVE_R2 >> 4 ; 23
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 24
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 25
        .byte HMOVE_R1 | HMOVE_L5 >> 4 ; 26
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 27
        .byte HMOVE_L2 | HMOVE_R2 >> 4 ; 28
        .byte HMOVE_R2 | HMOVE_R2 >> 4 ; 29
        .byte HMOVE_L6 | HMOVE_R2 >> 4 ; 30
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 31
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 33
        .byte HMOVE_R7 | HMOVE_0  >> 4 ; 34
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 35
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_L5 >> 4 ; 37
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 9

Wings10
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zz________ ; 20
        .byte zz________ ; 21
        .byte zz________ ; 22
        .byte zz________ ; 23
        .byte zzX_____X_ ; 24
        .byte zzX__X_X__ ; 25
        .byte zzX___X___ ; 26
        .byte zzXX__XX__ ; 27
        .byte zzXX_XX___ ; 28
        .byte zzX_XX____ ; 29
        .byte zz________ ; 30
        .byte zzX_______ ; 31
        .byte zzXX______ ; 32
        .byte zzX_______ ; 33
        .byte zzX_______ ; 34
        .byte zzXX______ ; 35
        .byte zzX_X_____ ; 36
        .byte zz________ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body10
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zzX_X_____ ; 12
        .byte zzX_______ ; 13
        .byte zzX_______ ; 14
        .byte zzXXX_____ ; 15
        .byte zzX_X_____ ; 16
        .byte zzXXX_____ ; 17
        .byte zzX_______ ; 18
        .byte zzX_______ ; 19
        .byte zzX_______ ; 20
        .byte zzX_______ ; 21
        .byte zz________ ; 22
        .byte zzX_______ ; 23
        .byte zzX_______ ; 24
        .byte zz________ ; 25
        .byte zzX_______ ; 26
        .byte zzX_______ ; 27
        .byte zzX_______ ; 28
        .byte zzX_______ ; 29
        .byte zzXXX_____ ; 30
        .byte zzXXX_____ ; 31
        .byte zzXX______ ; 32
        .byte zzXXXXX___ ; 33
        .byte zzXXXX____ ; 34
        .byte zzXXX_____ ; 35
        .byte zzX_X_X___ ; 36
        .byte zzX_X_X___ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift10LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 12 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 13 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 15 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 18 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 22 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23 x0=14 x1=22
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 24 x0=15 x1=22
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 25 x0=16 x1=22
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 26 x0=17 x1=22
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 27 x0=16 x1=22
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 28 x0=16 x1=21
        .byte HMOVE_R2 | HMOVE_L1 >> 4 ; 29 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 30 x0=18 x1=18
        .byte HMOVE_R4 | HMOVE_L1 >> 4 ; 31 x0=22 x1=17
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 32 x0=20 x1=16
        .byte HMOVE_R2 | HMOVE_L1 >> 4 ; 33 x0=22 x1=15
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 34 x0=20 x1=15
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 35 x0=19 x1=14
        .byte HMOVE_L3 | HMOVE_0  >> 4 ; 36 x0=16 x1=14
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 37 x0=16 x1=15
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=16 x1=15
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=16 x1=15
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=16 x1=15
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=16 x1=15
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=16 x1=15
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=16 x1=15
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=16 x1=15
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=16 x1=15
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=16 x1=15

Shift10RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 12
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 18
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 24
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 25
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 26
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 27
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 28
        .byte HMOVE_L2 | HMOVE_R1 >> 4 ; 29
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 30
        .byte HMOVE_L4 | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_L2 | HMOVE_R1 >> 4 ; 33
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 34
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 35
        .byte HMOVE_R3 | HMOVE_0  >> 4 ; 36
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 37
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 10






 echo "----",($FFEE - *) , "bytes of BANK 2 ROM left"


        ORG $9FE8
        RORG $FFE8
MMEEafterDragon
	cmp SelectBank4
	jmp MEafterDragonCode
ProcessDragonAnimation
        cmp SelectBank5
        jmp ProcessDragonAnimationCode
        BANKS_AND_VECTORS

;--------------------------------------------------------------------
; bank 3 - second bank of dragon animation frames
;--------------------------------------------------------------------
        ORG $A000
        JUMP_TABLE

KernelGameDragon2Code SUBROUTINE
        sta WSYNC
        lda #0              ; 2     turn off 2 fireballs not shown during dragon
        sta ENABL           ; 3  5
        sta ENAM1           ; 3  8
        ldy DragonIndex     ; 3 11 SavedLineCounter
        lda (DragonShift),y ; 5 16
        sta HMP0            ; 3 19
        asl                 ; 2 21
        asl                 ; 2 23
        asl                 ; 2 25
        asl                 ; 2 27
        sta HMP1            ; 3 30
        lda (DragonG0),y    ; 5 35
        tax                 ; 2 37
        lda (DragonG1),y    ; 5 42
        inc DragonIndex     ; 5 47
        ldy Paddles2Read    ; 3 50
        beq .skip           ; 2 52  53 taken
        jmp Dragon24b3        ; 3 55
.skip   ldy SavedLineCounter; 3 56
        dey                 ; 2 58
        cpy M0yOddRow       ; 3 61 - only drawing M0 in dragon area
        sta WSYNC           ; 3 64


DragonLoop13b3 SUBROUTINE
        sta HMOVE           ; 3
DL13noHM1b3
        php                 ; 3  6   draw M0
        pha                 ; 3  9   draw P1
        stx GRP0            ; 3 12   draw P0
        READ_PADDLE_1       ; 9 21
        sty SavedLineCounter; 3 24 save line counter
        ldy DragonIndex     ; 3 25
        lda (DragonShift),y ; 5 30
        bne DL13HM1b3         ;    3
        lda (DragonG0),y    ; 5 49
        tax                 ; 2 51
        lda (DragonG1),y    ; 5 56
        inc DragonIndex     ; 5 61 update dragon graphic pointer
        ldy SavedLineCounter; 3 66 load line counter
        sta WSYNC           ; 3 69
        jmp DL13noHM2b3

DL13HM1b3
        sta HMP0            ; 3 33
        asl                 ; 2 35
        asl                 ; 2 37
        asl                 ; 2 39
        asl                 ; 2 41
        sta HMP1            ; 3 44
        lda (DragonG0),y    ; 5 49
        tax                 ; 2 51
        lda (DragonG1),y    ; 5 56
        inc DragonIndex     ; 5 61 update dragon graphic pointer
        ldy SavedLineCounter; 3 66 load line counter
        sta WSYNC           ; 3 69

        sta HMOVE         ; 3
DL13noHM2b3
        sta GRP1          ; 3  6
        stx GRP0          ; 3  9
        ldx #ENAM0        ; 2 11
        txs               ; 2 13
        READ_PADDLE_3     ; 9 22
        ldy DragonIndex      ;39 Dragon
        lda (DragonShift),y  ; |
        bne DL13HM2b3
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-61
        ldy SavedLineCounter      ; 3 64 ; load line counter
        dey               ; 2 66
        cpy M0yEvenRow    ; 3 69
        sta WSYNC         ; 3 72
        jmp DL13noHM3b3

DL13HM2b3
        sta HMP0          ; |
        asl
        asl
        asl
        asl
        sta HMP1          ; |
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-61
        ldy SavedLineCounter      ; 3 64 ; load line counter
        dey               ; 2 66
        cpy M0yEvenRow    ; 3 69
        sta WSYNC         ; 3 72

        sta HMOVE         ; 3
DL13noHM3b3
        php               ; 3  6 draw M0
        pha               ; 3  9 draw P1
        stx GRP0          ; 3 12 draw P0
        READ_PADDLE_1     ; 9 21
        sty SavedLineCounter      ; 3 24 save line counter
        ldy DragonIndex      ;39 Dragon
        lda (DragonShift),y ; |
        bne DL13HM3b3
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-63
        ldy SavedLineCounter      ; 3 66 load line counter
        sta WSYNC         ; 3 69
        jmp DL13noHM4b3

DL13HM3b3
        sta HMP0          ; |
        asl
        asl
        asl
        asl
        sta HMP1          ; |
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-63
        ldy SavedLineCounter      ; 3 66 load line counter
        sta WSYNC         ; 3 69
        sta HMOVE         ; 3
DL13noHM4b3
        sta GRP1            ; 3  6
        stx GRP0            ; 3  9
        ldx #ENAM0          ; 2 11
        txs                 ; 2 13
        READ_PADDLE_3       ; 9 22
        ldy DragonIndex     ; 3 25
        lda (DragonShift),y ; 5 30
        beq DL13noHM5b3       ; 2 32
        sta HMP0            ; 3 35
        asl                 ; 2 37
        asl                 ; 2 39
        asl                 ; 2 41
        asl                 ; 2 43
        sta HMP1            ; 3 46
        lda (DragonG0),y    ; 5 51
        tax                 ; 2 53
        lda (DragonG1),y    ; 5 58
        inc DragonIndex     ; 5 63 update dragon graphic pointer
        ldy SavedLineCounter; 3 66 load line counter
        dey                 ; 2 68
        cpy #37             ; 2 70
        beq DD13b3            ; 2 72
        cpy M0yOddRow       ; 3 75
        sta HMOVE
        jmp DL13noHM1b3    ; 3 78

DL13noHM5b3
        lda (DragonG0),y    ; 5 38
        tax                 ; 2 40
        lda (DragonG1),y    ; 5 45
        inc DragonIndex     ; 5 50 update dragon graphic pointer
        ldy SavedLineCounter; 3 53 load line counter
        dey                 ; 2 55
        cpy #37             ; 2 57
        beq DD13b3            ; 2 59
        cpy M0yOddRow       ; 3 62
        sta WSYNC           ;
        jmp DL13noHM1b3       ;


DD13b3    jmp DragonDoneb3      ; 3 76

Dragon24b3
        ldy SavedLineCounter      ; 3 50
        dey               ; 2 52
        cpy M0yOddRow     ; 3 55 - only drawing M0 in dragon area
        sta WSYNC

DragonLoop24b3 SUBROUTINE
        sta HMOVE         ; 3
DL24noHM1b3
        php               ; 3  6   draw M0
        pha               ; 3  9   draw P1
        stx GRP0          ; 3 12   draw P0
        READ_PADDLE_2     ; 9 21
        sty SavedLineCounter      ; 3 24 save line counter
        ldy DragonIndex      ;39 Dragon
        lda (DragonShift),y; |
        bne DL24HM1b3
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-63 update dragon graphic pointer
        ldy SavedLineCounter      ; 3 66 load line counter
        sta WSYNC         ; 3 72
        jmp DL24noHM2b3
DL24HM1b3
        sta HMP0          ; |
        asl
        asl
        asl
        asl
        sta HMP1          ; |
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-63 update dragon graphic pointer
        ldy SavedLineCounter      ; 3 66 load line counter
        sta WSYNC         ; 3 72

        sta HMOVE         ; 3
DL24noHM2b3
        sta GRP1          ; 3  6
        stx GRP0          ; 3  9
        ldx #ENAM0        ; 2 11
        txs               ; 2 13
        READ_PADDLE_4     ; 9 22
        ldy DragonIndex      ;39 Dragon
        lda (DragonShift),y  ; |
        bne DL24HM2b3
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-61
        ldy SavedLineCounter      ; 3 64 ; load line counter
        dey               ; 2 66
        cpy M0yEvenRow    ; 3 73
        sta WSYNC         ; 3 76
        jmp DL24noHM3b3
DL24HM2b3
        sta HMP0          ; |
        asl
        asl
        asl
        asl
        sta HMP1          ; |
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-61
        ldy SavedLineCounter      ; 3 64 ; load line counter
        dey               ; 2 66
        cpy M0yEvenRow    ; 3 73
        sta WSYNC         ; 3 76

        sta HMOVE         ; 3
DL24noHM3b3
        php               ; 3  6 draw M0
        pha               ; 3  9 draw P1
        stx GRP0          ; 3 12 draw P0
        READ_PADDLE_2     ; 9 21
        sty SavedLineCounter      ; 3 24 save line counter
        ldy DragonIndex      ;39 Dragon
        lda (DragonShift),y ; |
        bne DL24HM3b3
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-63
        ldy SavedLineCounter      ; 3 66 load line counter
        sta WSYNC         ; 3 69
        jmp DL24noHM4b3
DL24HM3b3
        sta HMP0          ; |
        asl
        asl
        asl
        asl
        sta HMP1          ; |
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-63
        ldy SavedLineCounter      ; 3 66 load line counter
        sta WSYNC         ; 3 69
        sta HMOVE         ; 3
DL24noHM4b3
        sta GRP1          ; 3  6
        stx GRP0          ; 3  9
        ldx #ENAM0        ; 2 11
        txs               ; 2 13
        READ_PADDLE_4     ; 9 22
        ldy DragonIndex      ;39 Dragon
        lda (DragonShift),y  ; |
        beq DL24noHM5b3
        sta HMP0          ; |
        asl
        asl
        asl
        asl
        sta HMP1          ; |
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-61 update dragon graphic pointer
        ldy SavedLineCounter      ; 3 64 load line counter
        dey               ; 2 66
        cpy #37           ; 2 68
        beq DragonDoneb3    ; 2 70
        cpy M0yOddRow     ; 3 73
        sta HMOVE
        jmp DL24noHM1b3  ; 3 76
DL24noHM5b3
        lda (DragonG0),y  ; |
        tax               ; |
        lda (DragonG1),y  ; |
        inc DragonIndex      ; +-61 update dragon graphic pointer
        ldy SavedLineCounter      ; 3 64 load line counter
        dey               ; 2 66
        cpy #37           ; 2 68
        beq DragonDoneb3    ; 2 70
        cpy M0yOddRow     ; 3 73
        sta WSYNC
        jmp DL24noHM1b3     ; 3 76



DragonDoneb3
        ldx #ENABL        ; 2 75  need to reset stack
        txs               ; 2 77
        cpy BLyOddRow     ; 3  4
        php               ; 3  7
        cpy M1yOddRow     ; 3 10
        php               ; 3 13
        cpy M0yOddRow     ; 3 16
        php               ; 3 19
        ldx #ENABL        ; 2 21
        txs               ; 2 22
        READ_TWO_PADDLES  ;23 45
        dey               ; 2 49
        sta WSYNC         ; 3 57
        ; test for return to easter egg here
	lda DragonPass
	bpl DDskipb3
	jmp MMEEafterDragon
DDskipb3
        sta WSYNC
        cpy BLyEvenRow     ; 3  4
        php               ; 3  7
        cpy M1yEvenRow     ; 3 10
        php               ; 3 13
        cpy M0yEvenRow     ; 3 16
        php               ; 3 19
        ldx #ENABL        ; 2 21
        txs               ; 2 22
        READ_TWO_PADDLES  ;23 45
        dey               ; 2 49
        sta WSYNC
        jmp KernelGameBottom



Body11
        .byte zzX_X_____ ;  3
        .byte zzX_______ ;  4
        .byte zzX_______ ;  5
        .byte zzX_X_____ ;  6
        .byte zzXXX_____ ;  7
        .byte zzXXX_____ ;  8
        .byte zzX_______ ;  9
        .byte zzX_______ ; 10
        .byte zzX_______ ; 11
        .byte zzX_______ ; 12
        .byte zz________ ; 13
        .byte zzX_______ ; 14
        .byte zzX_______ ; 15
        .byte zz________ ; 16
        .byte zzX_______ ; 17
        .byte zz________ ; 18
        .byte zzX_______ ; 19
        .byte zzX_______ ; 20
        .byte zz________ ; 21
        .byte zzX_______ ; 22
        .byte zzX_______ ; 23
        .byte zzXX______ ; 24
        .byte zzXX______ ; 25
        .byte zzXX______ ; 26
        .byte zzXXXX____ ; 27
        .byte zzX__X____ ; 28
        .byte zzX_X_____ ; 29
        .byte zzXXX_____ ; 30
        .byte zzXXXX____ ; 31
        .byte zzX___X___ ; 32
        .byte zzX___X___ ; 33
        .byte zzXXXXX___ ; 34
        .byte zzX__X____ ; 35
        .byte zzX_X_____ ; 36
        .byte zzX___X___ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Wings11
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zzX_______ ; 16
        .byte zz________ ; 17
        .byte zzX_______ ; 18
        .byte zz________ ; 19
        .byte zzX____X__ ; 20
        .byte zzXX_X_XX_ ; 21
        .byte zzXX_XX___ ; 22
        .byte zzXX_XX___ ; 23
        .byte zzX__X____ ; 24
        .byte zzX__X____ ; 25
        .byte zzX__X____ ; 26
        .byte zzX_______ ; 27
        .byte zzXX______ ; 28
        .byte zzX_______ ; 29
        .byte zz________ ; 30
        .byte zzX_X_____ ; 31
        .byte zzXXX_____ ; 32
        .byte zzXXX_____ ; 33
        .byte zz________ ; 34
        .byte zzXX______ ; 35
        .byte zzX_______ ; 36
        .byte zz________ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
        .byte zz________ ; 46


Shift11LtoR
        .byte HMOVE_0  | HMOVE_R5 >> 4 ;  3 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  4 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  6 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  9 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 15 x0=14 x1=21
        .byte HMOVE_R7 | HMOVE_0  >> 4 ; 16 x0=21 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17 x0=21 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18 x0=21 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19 x0=21 x1=21
        .byte HMOVE_L5 | HMOVE_0  >> 4 ; 20 x0=16 x1=21
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 21 x0=15 x1=21
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 22 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23 x0=17 x1=21
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 24 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26 x0=18 x1=20
        .byte HMOVE_R3 | HMOVE_L2 >> 4 ; 27 x0=21 x1=18
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 28 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 29 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30 x0=21 x1=19
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 31 x0=19 x1=18
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 32 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34 x0=19 x1=17
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 35 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 36 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=21 x1=17

Shift11RtoL
        .byte HMOVE_0  | HMOVE_L5 >> 4 ;  3
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  4
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 15
        .byte HMOVE_L7 | HMOVE_0  >> 4 ; 16
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19
        .byte HMOVE_R5 | HMOVE_0  >> 4 ; 20
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 21
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26
        .byte HMOVE_L3 | HMOVE_R2 >> 4 ; 27
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 28
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 29
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 35
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 11

Wings12
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zzX_______ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zzX_______ ; 18
        .byte zzX____X__ ; 19
        .byte zzXX_X_XX_ ; 20
        .byte zzX__X____ ; 21
        .byte zzXX_XX___ ; 22
        .byte zzXX_XX___ ; 23
        .byte zzX__X____ ; 24
        .byte zzX__X____ ; 25
        .byte zzX__X____ ; 26
        .byte zzX_______ ; 27
        .byte zzXX______ ; 28
        .byte zzX_______ ; 29
        .byte zz________ ; 30
        .byte zzX_X_____ ; 31
        .byte zzXXX_____ ; 32
        .byte zzXXX_____ ; 33
        .byte zz________ ; 34
        .byte zzXX______ ; 35
        .byte zzX_______ ; 36
        .byte zz________ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
;        .byte zz________ ; 46

Body12
        .byte zz________ ;  3
        .byte zzX_______ ;  4
        .byte zzX_______ ;  5
        .byte zzXXX_____ ;  6
        .byte zzXX______ ;  7
        .byte zzX_______ ;  8
        .byte zzXX______ ;  9
        .byte zzXXX_____ ; 10
        .byte zzX_X_____ ; 11
        .byte zzX_X_____ ; 12
        .byte zzX_______ ; 13
        .byte zzX_______ ; 14
        .byte zz________ ; 15
        .byte zzX_______ ; 16
        .byte zzX_______ ; 17
        .byte zz________ ; 18
        .byte zzX_______ ; 19
        .byte zz________ ; 20
        .byte zzX_______ ; 21
        .byte zzX_______ ; 22
        .byte zzX_______ ; 23
        .byte zzXX______ ; 24
        .byte zzXX______ ; 25
        .byte zzXX______ ; 26
        .byte zzXXXX____ ; 27
        .byte zzX__X____ ; 28
        .byte zzX_X_____ ; 29
        .byte zzXXX_____ ; 30
        .byte zzXXXX____ ; 31
        .byte zzX___X___ ; 32
        .byte zzX___X___ ; 33
        .byte zzXXXXX___ ; 34
        .byte zzX__X____ ; 35
        .byte zzX_X_____ ; 36
        .byte zzX___X___ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift12LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_R5 >> 4 ;  4 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  5 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  6 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  7 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=21
        .byte HMOVE_R7 | HMOVE_0  >> 4 ; 15 x0=21 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16 x0=21 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17 x0=21 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18 x0=21 x1=21
        .byte HMOVE_L5 | HMOVE_0  >> 4 ; 19 x0=16 x1=21
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 20 x0=15 x1=21
        .byte HMOVE_R3 | HMOVE_0  >> 4 ; 21 x0=18 x1=21
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 22 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23 x0=17 x1=21
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 24 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26 x0=18 x1=20
        .byte HMOVE_R3 | HMOVE_L2 >> 4 ; 27 x0=21 x1=18
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 28 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 29 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30 x0=21 x1=19
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 31 x0=19 x1=18
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 32 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34 x0=19 x1=17
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 35 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 36 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=21 x1=17
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=21 x1=17

Shift12RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_L5 >> 4 ;  4
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  5
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  6
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_L7 | HMOVE_0  >> 4 ; 15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18
        .byte HMOVE_R5 | HMOVE_0  >> 4 ; 19
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 20
        .byte HMOVE_L3 | HMOVE_0  >> 4 ; 21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26
        .byte HMOVE_L3 | HMOVE_R2 >> 4 ; 27
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 28
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 29
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 35
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 12

Wings13
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zzX_______ ; 15
        .byte zz________ ; 16
        .byte zzX_______ ; 17
        .byte zzX____X__ ; 18
        .byte zzX___X___ ; 19
        .byte zzX_X_X___ ; 20
        .byte zzX__X____ ; 21
        .byte zzXX_XX___ ; 22
        .byte zzXX_XX___ ; 23
        .byte zzX__X____ ; 24
        .byte zzX__X____ ; 25
        .byte zzX__X____ ; 26
        .byte zzX_______ ; 27
        .byte zzXX______ ; 28
        .byte zzX_______ ; 29
        .byte zz________ ; 30
        .byte zzX_X_____ ; 31
        .byte zzXXX_____ ; 32
        .byte zzXXX_____ ; 33
        .byte zz________ ; 34
        .byte zzXX______ ; 35
        .byte zzX_______ ; 36
        .byte zz________ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
;        .byte zz________ ; 46

Body13
        .byte zz________ ;  3
        .byte zzX_______ ;  4
        .byte zzX_______ ;  5
        .byte zzX_______ ;  6
        .byte zzXXX_____ ;  7
        .byte zzXXX_____ ;  8
        .byte zzX_X_____ ;  9
        .byte zzXXXX____ ; 10
        .byte zzX__X____ ; 11
        .byte zzX_______ ; 12
        .byte zzX_______ ; 13
        .byte zzX_______ ; 14
        .byte zz________ ; 15
        .byte zzX_______ ; 16
        .byte zz________ ; 17
        .byte zzX_______ ; 18
        .byte zzX_______ ; 19
        .byte zz________ ; 20
        .byte zzX_______ ; 21
        .byte zzX_______ ; 22
        .byte zzX_______ ; 23
        .byte zzXX______ ; 24
        .byte zzXX______ ; 25
        .byte zzXX______ ; 26
        .byte zzXXXX____ ; 27
        .byte zzX__X____ ; 28
        .byte zzX_X_____ ; 29
        .byte zzXXX_____ ; 30
        .byte zzXXXX____ ; 31
        .byte zzX___X___ ; 32
        .byte zzX___X___ ; 33
        .byte zzXXXXX___ ; 34
        .byte zzX__X____ ; 35
        .byte zzX_X_____ ; 36
        .byte zzX___X___ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift13LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_R5 >> 4 ;  4 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  5 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  6 x0=14 x1=23
        .byte HMOVE_0  | HMOVE_L4 >> 4 ;  7 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  8 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=21
        .byte HMOVE_R7 | HMOVE_0  >> 4 ; 15 x0=21 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16 x0=21 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17 x0=21 x1=21
        .byte HMOVE_L5 | HMOVE_0  >> 4 ; 18 x0=16 x1=21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 19 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=17 x1=21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 21 x0=18 x1=21
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 22 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23 x0=17 x1=21
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 24 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26 x0=18 x1=20
        .byte HMOVE_R3 | HMOVE_L2 >> 4 ; 27 x0=21 x1=18
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 28 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 29 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30 x0=21 x1=19
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 31 x0=19 x1=18
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 32 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34 x0=19 x1=17
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 35 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 36 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=21 x1=17
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=21 x1=17

Shift13RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_L5 >> 4 ;  4
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  5
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  6
        .byte HMOVE_0  | HMOVE_R4 >> 4 ;  7
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_L7 | HMOVE_0  >> 4 ; 15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17
        .byte HMOVE_R5 | HMOVE_0  >> 4 ; 18
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26
        .byte HMOVE_L3 | HMOVE_R2 >> 4 ; 27
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 28
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 29
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 35
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 13

Wings14
Wings15
Wings16
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zzX_______ ; 15
        .byte zzX____X__ ; 16
        .byte zzX_X_X___ ; 17
        .byte zzX___X___ ; 18
        .byte zzX___X___ ; 19
        .byte zzX_X_X___ ; 20
        .byte zzX__X____ ; 21
        .byte zzXX_XX___ ; 22
        .byte zzXX_XX___ ; 23
        .byte zzX__X____ ; 24
        .byte zzX__X____ ; 25
        .byte zzX__X____ ; 26
        .byte zzX_______ ; 27
        .byte zzXX______ ; 28
        .byte zzX_______ ; 29
        .byte zz________ ; 30
        .byte zzX_X_____ ; 31
        .byte zzXXX_____ ; 32
        .byte zzXXX_____ ; 33
        .byte zz________ ; 34
        .byte zzXX______ ; 35
        .byte zzX_______ ; 36
        .byte zz________ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
;        .byte zz________ ; 46

Body14
        .byte zz________ ;  3
        .byte zzX_______ ;  4
        .byte zzX_______ ;  5
        .byte zzX_______ ;  6
        .byte zzXXXXX___ ;  7
        .byte zzX_X_____ ;  8
        .byte zzXX_XX___ ;  9
        .byte zzXX_X____ ; 10
        .byte zzX_______ ; 11
        .byte zzX_______ ; 12
        .byte zzX_______ ; 13
        .byte zzX_______ ; 14
        .byte zz________ ; 15
        .byte zzX_______ ; 16
        .byte zz________ ; 17
        .byte zzX_______ ; 18
        .byte zzX_______ ; 19
        .byte zz________ ; 20
        .byte zzX_______ ; 21
        .byte zzX_______ ; 22
        .byte zzX_______ ; 23
        .byte zzXX______ ; 24
        .byte zzXX______ ; 25
        .byte zzXX______ ; 26
        .byte zzXXXX____ ; 27
        .byte zzX__X____ ; 28
        .byte zzX_X_____ ; 29
        .byte zzXXX_____ ; 30
        .byte zzXXXX____ ; 31
        .byte zzX___X___ ; 32
        .byte zzX___X___ ; 33
        .byte zzXXXXX___ ; 34
        .byte zzX__X____ ; 35
        .byte zzX_X_____ ; 36
        .byte zzX___X___ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift14LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_R5 >> 4 ;  4 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  5 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  6 x0=14 x1=23
        .byte HMOVE_0  | HMOVE_L6 >> 4 ;  7 x0=14 x1=17
        .byte HMOVE_0  | HMOVE_R4 >> 4 ;  8 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  9 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 10 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=21
        .byte HMOVE_R7 | HMOVE_0  >> 4 ; 15 x0=21 x1=21
        .byte HMOVE_L5 | HMOVE_0  >> 4 ; 16 x0=16 x1=21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 17 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=17 x1=21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 21 x0=18 x1=21
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 22 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23 x0=17 x1=21
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 24 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26 x0=18 x1=20
        .byte HMOVE_R3 | HMOVE_L2 >> 4 ; 27 x0=21 x1=18
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 28 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 29 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30 x0=21 x1=19
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 31 x0=19 x1=18
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 32 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34 x0=19 x1=17
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 35 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 36 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=21 x1=17
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=21 x1=17

Shift14RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_L5 >> 4 ;  4
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  5
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  6
        .byte HMOVE_0  | HMOVE_R6 >> 4 ;  7
        .byte HMOVE_0  | HMOVE_L4 >> 4 ;  8
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  9
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_L7 | HMOVE_0  >> 4 ; 15
        .byte HMOVE_R5 | HMOVE_0  >> 4 ; 16
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26
        .byte HMOVE_L3 | HMOVE_R2 >> 4 ; 27
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 28
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 29
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 35
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 14

; Wings15  same as Wings14
        ; .byte zz________ ;  3
        ; .byte zz________ ;  4
        ; .byte zz________ ;  5
        ; .byte zz________ ;  6
        ; .byte zz________ ;  7
        ; .byte zz________ ;  8
        ; .byte zz________ ;  9
        ; .byte zz________ ; 10
        ; .byte zz________ ; 11
        ; .byte zz________ ; 12
        ; .byte zz________ ; 13
        ; .byte zz________ ; 14
        ; .byte zzX_______ ; 15
        ; .byte zzX____X__ ; 16
        ; .byte zzX_X_X___ ; 17
        ; .byte zzX___X___ ; 18
        ; .byte zzX___X___ ; 19
        ; .byte zzX_X_X___ ; 20
        ; .byte zzX__X____ ; 21
        ; .byte zzXX_XX___ ; 22
        ; .byte zzXX_XX___ ; 23
        ; .byte zzX__X____ ; 24
        ; .byte zzX__X____ ; 25
        ; .byte zzX__X____ ; 26
        ; .byte zzX_______ ; 27
        ; .byte zzXX______ ; 28
        ; .byte zzX_______ ; 29
        ; .byte zz________ ; 30
        ; .byte zzX_X_____ ; 31
        ; .byte zzXXX_____ ; 32
        ; .byte zzXXX_____ ; 33
        ; .byte zz________ ; 34
        ; .byte zzXX______ ; 35
        ; .byte zzX_______ ; 36
        ; .byte zz________ ; 37
        ; .byte zz________ ; 38
        ; .byte zz________ ; 39
        ; .byte zz________ ; 40
        ; .byte zz________ ; 41
        ; .byte zz________ ; 42
        ; .byte zz________ ; 43
        ; .byte zz________ ; 44
        ; .byte zz________ ; 45
        ; .byte zz________ ; 46

Body15
        .byte zz________ ;  3
        .byte zzX_______ ;  4
        .byte zzXXXX____ ;  5
        .byte zzX_X_____ ;  6
        .byte zzXX_XX___ ;  7
        .byte zzXXXX____ ;  8
        .byte zzXX______ ;  9
        .byte zzX_______ ; 10
        .byte zzX_______ ; 11
        .byte zzX_______ ; 12
        .byte zzX_______ ; 13
        .byte zzX_______ ; 14
        .byte zz________ ; 15
        .byte zzX_______ ; 16
        .byte zz________ ; 17
        .byte zzX_______ ; 18
        .byte zzX_______ ; 19
        .byte zz________ ; 20
        .byte zzX_______ ; 21
        .byte zzX_______ ; 22
        .byte zzX_______ ; 23
        .byte zzXX______ ; 24
        .byte zzXX______ ; 25
        .byte zzXX______ ; 26
        .byte zzXXXX____ ; 27
        .byte zzX__X____ ; 28
        .byte zzX_X_____ ; 29
        .byte zzXXX_____ ; 30
        .byte zzXXXX____ ; 31
        .byte zzX___X___ ; 32
        .byte zzX___X___ ; 33
        .byte zzXXXXX___ ; 34
        .byte zzX__X____ ; 35
        .byte zzX_X_____ ; 36
        .byte zzX___X___ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift15LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_R7 >> 4 ;  4 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_L4 >> 4 ;  5 x0=14 x1=17
        .byte HMOVE_0  | HMOVE_R4 >> 4 ;  6 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  7 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  8 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=21
        .byte HMOVE_R7 | HMOVE_0  >> 4 ; 15 x0=21 x1=21
        .byte HMOVE_L5 | HMOVE_0  >> 4 ; 16 x0=16 x1=21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 17 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=17 x1=21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 21 x0=18 x1=21
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 22 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23 x0=17 x1=21
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 24 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26 x0=18 x1=20
        .byte HMOVE_R3 | HMOVE_L2 >> 4 ; 27 x0=21 x1=18
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 28 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 29 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30 x0=21 x1=19
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 31 x0=19 x1=18
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 32 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34 x0=19 x1=17
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 35 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 36 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=21 x1=17
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=21 x1=17

Shift15RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_L7 >> 4 ;  4
        .byte HMOVE_0  | HMOVE_R4 >> 4 ;  5
        .byte HMOVE_0  | HMOVE_L4 >> 4 ;  6
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  7
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_L7 | HMOVE_0  >> 4 ; 15
        .byte HMOVE_R5 | HMOVE_0  >> 4 ; 16
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26
        .byte HMOVE_L3 | HMOVE_R2 >> 4 ; 27
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 28
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 29
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 35
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 15

; Wings16   Same as Wings14
        ; .byte zz________ ;  3
        ; .byte zz________ ;  4
        ; .byte zz________ ;  5
        ; .byte zz________ ;  6
        ; .byte zz________ ;  7
        ; .byte zz________ ;  8
        ; .byte zz________ ;  9
        ; .byte zz________ ; 10
        ; .byte zz________ ; 11
        ; .byte zz________ ; 12
        ; .byte zz________ ; 13
        ; .byte zz________ ; 14
        ; .byte zzX_______ ; 15
        ; .byte zzX____X__ ; 16
        ; .byte zzX_X_X___ ; 17
        ; .byte zzX___X___ ; 18
        ; .byte zzX___X___ ; 19
        ; .byte zzX_X_X___ ; 20
        ; .byte zzX__X____ ; 21
        ; .byte zzXX_XX___ ; 22
        ; .byte zzXX_XX___ ; 23
        ; .byte zzX__X____ ; 24
        ; .byte zzX__X____ ; 25
        ; .byte zzX__X____ ; 26
        ; .byte zzX_______ ; 27
        ; .byte zzXX______ ; 28
        ; .byte zzX_______ ; 29
        ; .byte zz________ ; 30
        ; .byte zzX_X_____ ; 31
        ; .byte zzXXX_____ ; 32
        ; .byte zzXXX_____ ; 33
        ; .byte zz________ ; 34
        ; .byte zzXX______ ; 35
        ; .byte zzX_______ ; 36
        ; .byte zz________ ; 37
        ; .byte zz________ ; 38
        ; .byte zz________ ; 39
        ; .byte zz________ ; 40
        ; .byte zz________ ; 41
        ; .byte zz________ ; 42
        ; .byte zz________ ; 43
        ; .byte zz________ ; 44
        ; .byte zz________ ; 45
        ; .byte zz________ ; 46

Body16
        .byte zzX_______ ;  3
        .byte zzX_X_____ ;  4
        .byte zzXXX_____ ;  5
        .byte zzXXXX____ ;  6
        .byte zzX_XX____ ;  7
        .byte zzXXXX____ ;  8
        .byte zzXXX_____ ;  9
        .byte zzX_______ ; 10
        .byte zzX_______ ; 11
        .byte zzX_______ ; 12
        .byte zzX_______ ; 13
        .byte zzX_______ ; 14
        .byte zz________ ; 15
        .byte zzX_______ ; 16
        .byte zz________ ; 17
        .byte zzX_______ ; 18
        .byte zzX_______ ; 19
        .byte zz________ ; 20
        .byte zzX_______ ; 21
        .byte zzX_______ ; 22
        .byte zzX_______ ; 23
        .byte zzXX______ ; 24
        .byte zzXX______ ; 25
        .byte zzXX______ ; 26
        .byte zzXXXX____ ; 27
        .byte zzX__X____ ; 28
        .byte zzX_X_____ ; 29
        .byte zzXXX_____ ; 30
        .byte zzXXXX____ ; 31
        .byte zzX___X___ ; 32
        .byte zzX___X___ ; 33
        .byte zzXXXXX___ ; 34
        .byte zzX__X____ ; 35
        .byte zzX_X_____ ; 36
        .byte zzX___X___ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
        .byte zz________ ; 46

Shift16LtoR
        .byte HMOVE_0  | HMOVE_R5 >> 4 ;  3 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  4 x0=14 x1=17
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  5 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  7 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  9 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 10 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 13 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=21
        .byte HMOVE_R7 | HMOVE_0  >> 4 ; 15 x0=21 x1=21
        .byte HMOVE_L5 | HMOVE_0  >> 4 ; 16 x0=16 x1=21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 17 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=17 x1=21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 21 x0=18 x1=21
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 22 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23 x0=17 x1=21
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 24 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26 x0=18 x1=20
        .byte HMOVE_R3 | HMOVE_L2 >> 4 ; 27 x0=21 x1=18
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 28 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 29 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30 x0=21 x1=19
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 31 x0=19 x1=18
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 32 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34 x0=19 x1=17
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 35 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 36 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=21 x1=17

Shift16RtoL
        .byte HMOVE_0  | HMOVE_L5 >> 4 ;  3
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  4
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  5
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  9
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_L7 | HMOVE_0  >> 4 ; 15
        .byte HMOVE_R5 | HMOVE_0  >> 4 ; 16
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26
        .byte HMOVE_L3 | HMOVE_R2 >> 4 ; 27
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 28
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 29
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 35
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 16

Wings17
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zzX_______ ; 15
        .byte zzX_____X_ ; 16
        .byte zzX__X_X__ ; 17
        .byte zzX____X__ ; 18
        .byte zzX____X__ ; 19
        .byte zzX__X_X__ ; 20
        .byte zzX__X____ ; 21
        .byte zzXX_XX___ ; 22
        .byte zzXX_XX___ ; 23
        .byte zzX__X____ ; 24
        .byte zzX__X____ ; 25
        .byte zzX__X____ ; 26
        .byte zzX_______ ; 27
        .byte zzXX______ ; 28
        .byte zzX_______ ; 29
        .byte zz________ ; 30
        .byte zzX_X_____ ; 31
        .byte zzXXX_____ ; 32
        .byte zzXXX_____ ; 33
        .byte zz________ ; 34
        .byte zzXX______ ; 35
        .byte zzX_______ ; 36
        .byte zz________ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
        .byte zz________ ; 46

Body17
        .byte zzX_______ ;  3
        .byte zzX_X_____ ;  4
        .byte zzXX______ ;  5
        .byte zzXXX_____ ;  6
        .byte zzXX______ ;  7
        .byte zzX_X_____ ;  8
        .byte zzXXXX____ ;  9
        .byte zzX_XX____ ; 10
        .byte zzX__X____ ; 11
        .byte zzX_______ ; 12
        .byte zzX_______ ; 13
        .byte zzX_______ ; 14
        .byte zz________ ; 15
        .byte zzX_______ ; 16
        .byte zz________ ; 17
        .byte zzX_______ ; 18
        .byte zzX_______ ; 19
        .byte zz________ ; 20
        .byte zzXX______ ; 21
        .byte zzX_______ ; 22
        .byte zzX_______ ; 23
        .byte zzXX______ ; 24
        .byte zzXX______ ; 25
        .byte zzXX______ ; 26
        .byte zzXXXX____ ; 27
        .byte zzX__X____ ; 28
        .byte zzX_X_____ ; 29
        .byte zzXXX_____ ; 30
        .byte zzXXXX____ ; 31
        .byte zzX___X___ ; 32
        .byte zzX___X___ ; 33
        .byte zzXXXXX___ ; 34
        .byte zzX__X____ ; 35
        .byte zzX_X_____ ; 36
        .byte zzX___X___ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
        .byte zz________ ; 46

Shift17LtoR
        .byte HMOVE_0  | HMOVE_R5 >> 4 ;  3 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  4 x0=14 x1=17
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  5 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  7 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  9 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 10 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 13 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=21
        .byte HMOVE_R7 | HMOVE_0  >> 4 ; 15 x0=21 x1=21
        .byte HMOVE_L6 | HMOVE_0  >> 4 ; 16 x0=15 x1=21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 17 x0=16 x1=21
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 18 x0=16 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19 x0=16 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=16 x1=22
        .byte HMOVE_R2 | HMOVE_L1 >> 4 ; 21 x0=18 x1=21
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 22 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23 x0=17 x1=21
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 24 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26 x0=18 x1=20
        .byte HMOVE_R3 | HMOVE_L2 >> 4 ; 27 x0=21 x1=18
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 28 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 29 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30 x0=21 x1=19
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 31 x0=19 x1=18
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 32 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34 x0=19 x1=17
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 35 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 36 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=21 x1=17

Shift17RtoL
        .byte HMOVE_0  | HMOVE_L5 >> 4 ;  3
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  4
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  5
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  9
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_L7 | HMOVE_0  >> 4 ; 15
        .byte HMOVE_R6 | HMOVE_0  >> 4 ; 16
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 17
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 18
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        .byte HMOVE_L2 | HMOVE_R1 >> 4 ; 21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26
        .byte HMOVE_L3 | HMOVE_R2 >> 4 ; 27
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 28
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 29
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 35
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 17

Wings18
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zzX_______ ; 15
        .byte zzX______X ; 16
        .byte zzX_____X_ ; 17
        .byte zzX_____X_ ; 18
        .byte zzX__X_X__ ; 19
        .byte zzX____X__ ; 20
        .byte zzX__X____ ; 21
        .byte zzXX_XX___ ; 22
        .byte zzXX_XX___ ; 23
        .byte zzX__X____ ; 24
        .byte zzX__X____ ; 25
        .byte zzX__X____ ; 26
        .byte zzX_______ ; 27
        .byte zzXX______ ; 28
        .byte zzX_______ ; 29
        .byte zz________ ; 30
        .byte zzX_X_____ ; 31
        .byte zzXXX_____ ; 32
        .byte zzXXX_____ ; 33
        .byte zz________ ; 34
        .byte zzXX______ ; 35
        .byte zzX_______ ; 36
        .byte zz________ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
;        .byte zz________ ; 46

Body18
        .byte zz________ ;  3
        .byte zzX_X_X___ ;  4
        .byte zzX_X_XX__ ;  5
        .byte zzXX_X____ ;  6
        .byte zzXXX_____ ;  7
        .byte zzXXX_____ ;  8
        .byte zzX_______ ;  9
        .byte zzXXX_____ ; 10
        .byte zzXX_X____ ; 11
        .byte zzX_______ ; 12
        .byte zzX_______ ; 13
        .byte zzX_______ ; 14
        .byte zzX_______ ; 15
        .byte zzX_______ ; 16
        .byte zzX_______ ; 17
        .byte zzX_______ ; 18
        .byte zz________ ; 19
        .byte zzX_______ ; 20
        .byte zzXX______ ; 21
        .byte zzX_______ ; 22
        .byte zzX_______ ; 23
        .byte zzXX______ ; 24
        .byte zzXX______ ; 25
        .byte zzXX______ ; 26
        .byte zzXXXX____ ; 27
        .byte zzX__X____ ; 28
        .byte zzX_X_____ ; 29
        .byte zzXXX_____ ; 30
        .byte zzXXXX____ ; 31
        .byte zzX___X___ ; 32
        .byte zzX___X___ ; 33
        .byte zzXXXXX___ ; 34
        .byte zzX__X____ ; 35
        .byte zzX_X_____ ; 36
        .byte zzX___X___ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift18LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_R7 >> 4 ;  4 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  5 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  6 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  8 x0=14 x1=19
        .byte HMOVE_0  | HMOVE_R4 >> 4 ;  9 x0=14 x1=23
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 10 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 13 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=20
        .byte HMOVE_R7 | HMOVE_0  >> 4 ; 15 x0=21 x1=20
        .byte HMOVE_L7 | HMOVE_R1 >> 4 ; 16 x0=14 x1=21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 17 x0=15 x1=21
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 18 x0=15 x1=22
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 19 x0=16 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=16 x1=22
        .byte HMOVE_R2 | HMOVE_L1 >> 4 ; 21 x0=18 x1=21
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 22 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23 x0=17 x1=21
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 24 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26 x0=18 x1=20
        .byte HMOVE_R3 | HMOVE_L2 >> 4 ; 27 x0=21 x1=18
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 28 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 29 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30 x0=21 x1=19
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 31 x0=19 x1=18
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 32 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34 x0=19 x1=17
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 35 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 36 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=21 x1=17
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=21 x1=17

Shift18RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_L7 >> 4 ;  4
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  5
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  8
        .byte HMOVE_0  | HMOVE_L4 >> 4 ;  9
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_L7 | HMOVE_0  >> 4 ; 15
        .byte HMOVE_R7 | HMOVE_L1 >> 4 ; 16
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 17
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 18
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        .byte HMOVE_L2 | HMOVE_R1 >> 4 ; 21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26
        .byte HMOVE_L3 | HMOVE_R2 >> 4 ; 27
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 28
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 29
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 35
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 18

Wings19
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz__X_____ ; 12
        .byte zz________ ; 13
        .byte zzX_______ ; 14
        .byte zz________ ; 15
        .byte zzX_______ ; 16
        .byte zzX___X__X ; 17
        .byte zzX_____X_ ; 18
        .byte zzX____X__ ; 19
        .byte zzX____X__ ; 20
        .byte zzXX__XX__ ; 21
        .byte zzXX_XX___ ; 22
        .byte zzXX_XX___ ; 23
        .byte zzXX__XX__ ; 24
        .byte zzX__X____ ; 25
        .byte zzX__X____ ; 26
        .byte zzX_______ ; 27
        .byte zzXX______ ; 28
        .byte zzXX______ ; 29
        .byte zzXX______ ; 30
        .byte zzX_______ ; 31
        .byte zz________ ; 32
        .byte zzX_X_____ ; 33
        .byte zz________ ; 34
        .byte zzXX______ ; 35
        .byte zzX_______ ; 36
        .byte zz________ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
        .byte zz________ ; 46

Body19
        .byte zz_____X__ ;  3
        .byte zzXXX_____ ;  4
        .byte zzXX_X____ ;  5
        .byte zzX_X_____ ;  6
        .byte zzXXXX____ ;  7
        .byte zzX_______ ;  8
        .byte zzX_______ ;  9
        .byte zzX_______ ; 10
        .byte zzXXX_____ ; 11
        .byte zzX__X____ ; 12
        .byte zzX_______ ; 13
        .byte zzX_______ ; 14
        .byte zzX_______ ; 15
        .byte zzX_______ ; 16
        .byte zzX_______ ; 17
        .byte zzX_______ ; 18
        .byte zzX_______ ; 19
        .byte zzX_______ ; 20
        .byte zzX_______ ; 21
        .byte zzX_______ ; 22
        .byte zzX_______ ; 23
        .byte zzXX______ ; 24
        .byte zzXX______ ; 25
        .byte zzXX______ ; 26
        .byte zzX_X_____ ; 27
        .byte zzX__X____ ; 28
        .byte zzX__X____ ; 29
        .byte zzX_X_____ ; 30
        .byte zzXXXX____ ; 31
        .byte zzXXXXX___ ; 32
        .byte zzX_X_X___ ; 33
        .byte zzXXXXX___ ; 34
        .byte zzX__X____ ; 35
        .byte zzX_X_____ ; 36
        .byte zzX___X___ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
        .byte zz________ ; 46

Shift19LtoR
        .byte HMOVE_0  | HMOVE_R7 >> 4 ;  3 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_R6 >> 4 ;  4 x0=14 x1=27
        .byte HMOVE_0  | HMOVE_L4 >> 4 ;  5 x0=14 x1=23
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  6 x0=14 x1=25
        .byte HMOVE_0  | HMOVE_L4 >> 4 ;  7 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_R4 >> 4 ;  8 x0=14 x1=25
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=14 x1=25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=25
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 11 x0=14 x1=23
        .byte HMOVE_R6 | HMOVE_0  >> 4 ; 12 x0=20 x1=23
        .byte HMOVE_R4 | HMOVE_0  >> 4 ; 13 x0=24 x1=23
        .byte HMOVE_L1 | HMOVE_L2 >> 4 ; 14 x0=23 x1=21
        .byte HMOVE_L4 | HMOVE_R1 >> 4 ; 15 x0=19 x1=22
        .byte HMOVE_L6 | HMOVE_0  >> 4 ; 16 x0=13 x1=22
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 17 x0=14 x1=21
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 18 x0=15 x1=22
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 19 x0=16 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=16 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21 x0=16 x1=21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 22 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23 x0=17 x1=21
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 24 x0=16 x1=20
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 25 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26 x0=18 x1=20
        .byte HMOVE_R3 | HMOVE_L1 >> 4 ; 27 x0=21 x1=19
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 28 x0=20 x1=18
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 29 x0=20 x1=18
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 30 x0=20 x1=19
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 31 x0=21 x1=18
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 32 x0=21 x1=17
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 33 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34 x0=19 x1=17
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 35 x0=20 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 36 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=21 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=21 x1=17

Shift19RtoL
        .byte HMOVE_0  | HMOVE_L7 >> 4 ;  3
        .byte HMOVE_0  | HMOVE_L6 >> 4 ;  4
        .byte HMOVE_0  | HMOVE_R4 >> 4 ;  5
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  6
        .byte HMOVE_0  | HMOVE_R4 >> 4 ;  7
        .byte HMOVE_0  | HMOVE_L4 >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 11
        .byte HMOVE_L6 | HMOVE_0  >> 4 ; 12
        .byte HMOVE_L4 | HMOVE_0  >> 4 ; 13
        .byte HMOVE_R1 | HMOVE_R2 >> 4 ; 14
        .byte HMOVE_R4 | HMOVE_L1 >> 4 ; 15
        .byte HMOVE_R6 | HMOVE_0  >> 4 ; 16
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 17
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 18
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 24
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26
        .byte HMOVE_L3 | HMOVE_R1 >> 4 ; 27
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 28
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 29
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 30
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 33
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 35
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 19

Wings20
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zz________ ; 20
        .byte zz________ ; 21
        .byte zz________ ; 22
        .byte zzX_____X_ ; 23
        .byte zzX____X__ ; 24
        .byte zzX____X__ ; 25
        .byte zzX___X___ ; 26
        .byte zzXX__XX__ ; 27
        .byte zzX__X____ ; 28
        .byte zzX__X____ ; 29
        .byte zzX_X_____ ; 30
        .byte zz________ ; 31
        .byte zzXX______ ; 32
        .byte zzX_______ ; 33
        .byte zzX_______ ; 34
        .byte zzX_XX____ ; 35
        .byte zzX_X_____ ; 36
;        .byte zz________ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body20
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zzX_X_____ ; 19
        .byte zzX_______ ; 20
        .byte zzX_______ ; 21
        .byte zzXXX_____ ; 22
        .byte zzX_X_____ ; 23
        .byte zzXXX_____ ; 24
        .byte zzX_______ ; 25
        .byte zzX_______ ; 26
        .byte zzXX______ ; 27
        .byte zzXX______ ; 28
        .byte zzX_______ ; 29
        .byte zzXXX_____ ; 30
        .byte zzXXXX____ ; 31
        .byte zzXX______ ; 32
        .byte zzXXXXX___ ; 33
        .byte zzXXXX____ ; 34
        .byte zzX_______ ; 35
        .byte zzX_X_____ ; 36
        .byte zzX_X_____ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift20LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 15 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 19 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 20 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 22 x0=14 x1=20
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 23 x0=15 x1=20
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 24 x0=16 x1=20
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 25 x0=16 x1=22
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 26 x0=17 x1=22
        .byte HMOVE_L1 | HMOVE_L2 >> 4 ; 27 x0=16 x1=20
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 28 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 29 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_L3 >> 4 ; 30 x0=18 x1=17
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 31 x0=18 x1=16
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 32 x0=20 x1=16
        .byte HMOVE_R2 | HMOVE_L1 >> 4 ; 33 x0=22 x1=15
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 34 x0=20 x1=15
        .byte HMOVE_L5 | HMOVE_R2 >> 4 ; 35 x0=15 x1=17
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 36 x0=16 x1=18
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 37 x0=16 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=16 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=16 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=16 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=16 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=16 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=16 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=16 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=16 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=16 x1=19

Shift20RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 22
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 23
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 24
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 25
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 26
        .byte HMOVE_R1 | HMOVE_R2 >> 4 ; 27
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 28
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 29
        .byte HMOVE_0  | HMOVE_R3 >> 4 ; 30
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 32
        .byte HMOVE_L2 | HMOVE_R1 >> 4 ; 33
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 34
        .byte HMOVE_R5 | HMOVE_L2 >> 4 ; 35
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 37
 ;       .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 20

Wings21
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zz________ ; 20
        .byte zz________ ; 21
        .byte zz________ ; 22
        .byte zzX______X ; 23
        .byte zzX_____X_ ; 24
        .byte zzX____X__ ; 25
        .byte zzX____X__ ; 26
        .byte zzXX__XX__ ; 27
        .byte zzXX_XX___ ; 28
        .byte zzXX_XX___ ; 29
        .byte zzXX_XX___ ; 30
        .byte zzX_XX____ ; 31
        .byte zzX_X_____ ; 32
        .byte zzX_X_____ ; 33
;        .byte zz________ ; 34
;        .byte zz________ ; 35
;        .byte zz________ ; 36
;        .byte zz________ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body21
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zz________ ; 20
        .byte zz________ ; 21
        .byte zz________ ; 22
        .byte zz________ ; 23
        .byte zzX_______ ; 24
        .byte zzXX______ ; 25
        .byte zzXXX_____ ; 26
        .byte zzXX______ ; 27
        .byte zzX_______ ; 28
        .byte zzX_______ ; 29
        .byte zzX_______ ; 30
        .byte zzX_______ ; 31
        .byte zzX_______ ; 32
        .byte zzX_______ ; 33
        .byte zzXXX_____ ; 34
        .byte zzX_X_X___ ; 35
        .byte zzX_______ ; 36
        .byte zzXXX_____ ; 37
        .byte zzX_X_____ ; 38
        .byte zzXXX_____ ; 39
        .byte zzX_______ ; 40
        .byte zzX_______ ; 41
        .byte zzX_______ ; 42
        .byte zzX_______ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift21LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 15 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 22 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23 x0=14 x1=14
        .byte HMOVE_R1 | HMOVE_R7 >> 4 ; 24 x0=15 x1=21
        .byte HMOVE_R1 | HMOVE_L2 >> 4 ; 25 x0=16 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26 x0=16 x1=19
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 27 x0=16 x1=20
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 28 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 29 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30 x0=17 x1=21
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 31 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 32 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 34 x0=19 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 35 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 36 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=19 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=19 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=19 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 40 x0=19 x1=21
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=19 x1=21
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=19 x1=21
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=19 x1=21
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=19 x1=21
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=19 x1=21
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=19 x1=21

Shift21RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 16
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23
        .byte HMOVE_L1 | HMOVE_L7 >> 4 ; 24
        .byte HMOVE_L1 | HMOVE_R2 >> 4 ; 25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 27
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 28
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 29
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 31
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 32
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 33
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 34
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 35
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 40
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 21

Wings22
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zzX_______ ; 15
        .byte zzX_______ ; 16
        .byte zzX_____X_ ; 17
        .byte zzX____X__ ; 18
        .byte zzX___XX__ ; 19
        .byte zzXX__XX__ ; 20
        .byte zzXX__X___ ; 21
        .byte zzX_XX____ ; 22
        .byte zzX_XXX___ ; 23
        .byte zzX_XX____ ; 24
        .byte zzX_XX____ ; 25
        .byte zzX_XX____ ; 26
        .byte zzX__X____ ; 27
        .byte zzXX__X___ ; 28
        .byte zzX_XX____ ; 29
        .byte zzX_X_____ ; 30
        .byte zzX__X____ ; 31
        .byte zzX_XX____ ; 32
        .byte zzX_______ ; 33
;        .byte zz________ ; 34
;        .byte zz________ ; 35
;        .byte zz________ ; 36
;        .byte zz________ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body22
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zz________ ; 20
        .byte zzX_______ ; 21
        .byte zzX_______ ; 22
        .byte zzX_______ ; 23
        .byte zzX_X_____ ; 24
        .byte zzX_X_____ ; 25
        .byte zzX_X_____ ; 26
        .byte zzX_XX____ ; 27
        .byte zzX__XX___ ; 28
        .byte zzXX_X____ ; 29
        .byte zzX__X____ ; 30
        .byte zzX_XX____ ; 31
        .byte zzX_______ ; 32
        .byte zzXX______ ; 33
        .byte zzX_XX____ ; 34
        .byte zzX_X_____ ; 35
        .byte zzX_______ ; 36
        .byte zzXX______ ; 37
        .byte zzX_______ ; 38
        .byte zzXXX_____ ; 39
        .byte zzXX______ ; 40
        .byte zzX_______ ; 41
        .byte zzXX______ ; 42
        .byte zzX_______ ; 43
        .byte zzX_______ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift22LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 15 x0=15 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 16 x0=16 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 17 x0=17 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18 x0=17 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19 x0=17 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=17 x1=14
        .byte HMOVE_0  | HMOVE_R7 >> 4 ; 21 x0=17 x1=21
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 22 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 24 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26 x0=19 x1=17
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 27 x0=18 x1=16
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 28 x0=17 x1=15
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 29 x0=19 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30 x0=19 x1=15
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 31 x0=18 x1=16
        .byte HMOVE_R1 | HMOVE_R5 >> 4 ; 32 x0=19 x1=21
        .byte HMOVE_R4 | HMOVE_L2 >> 4 ; 33 x0=23 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 34 x0=23 x1=17
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 35 x0=23 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 36 x0=23 x1=21
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=23 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 38 x0=23 x1=21
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 39 x0=23 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 40 x0=23 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=23 x1=21
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 42 x0=23 x1=23
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 43 x0=23 x1=25
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=23 x1=25
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=23 x1=25
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=23 x1=25

Shift22RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 15
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 16
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        .byte HMOVE_0  | HMOVE_L7 >> 4 ; 21
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 27
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 28
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 29
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 31
        .byte HMOVE_L1 | HMOVE_L5 >> 4 ; 32
        .byte HMOVE_L4 | HMOVE_R2 >> 4 ; 33
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 34
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 35
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 38
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 39
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 40
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 42
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 22

Shift23LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  4 x0=15 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  5 x0=16 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  6 x0=17 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=17 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=17 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  9 x0=18 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=18 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=18 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12 x0=18 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13 x0=18 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=18 x1=14
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 15 x0=17 x1=14
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 16 x0=16 x1=14
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 17 x0=15 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 18 x0=16 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19 x0=16 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=16 x1=14
        .byte HMOVE_0  | HMOVE_R5 >> 4 ; 21 x0=16 x1=19
        .byte HMOVE_R2 | HMOVE_L4 >> 4 ; 22 x0=18 x1=15
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 23 x0=17 x1=14
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 24 x0=17 x1=13
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 25 x0=19 x1=13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26 x0=19 x1=13
        .byte HMOVE_R1 | HMOVE_R2 >> 4 ; 27 x0=20 x1=15
        .byte HMOVE_0  | HMOVE_R3 >> 4 ; 28 x0=20 x1=18
        .byte HMOVE_R3 | HMOVE_L1 >> 4 ; 29 x0=23 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30 x0=23 x1=17
        .byte HMOVE_L5 | HMOVE_L1 >> 4 ; 31 x0=18 x1=16
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 32 x0=19 x1=15
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 33 x0=19 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34 x0=19 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 35 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 36 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 37 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 38 x0=19 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 39 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 40 x0=19 x1=19
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 41 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 42 x0=19 x1=23
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 43 x0=19 x1=27
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=19 x1=27
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=19 x1=27
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=19 x1=27

Wings23
        .byte zz________ ;  3
        .byte zzX______X ;  4
        .byte zzX_____X_ ;  5
        .byte zzX____X__ ;  6
        .byte zzX____X__ ;  7
        .byte zzX____X__ ;  8
        .byte zzX___X___ ;  9
        .byte zzX___X___ ; 10
        .byte zzX___X___ ; 11
        .byte zzX___X___ ; 12
        .byte zzX___X___ ; 13
        .byte zzX___X___ ; 14
        .byte zzXX__X___ ; 15
        .byte zzXX__XX__ ; 16
        .byte zzXX__XX__ ; 17
        .byte zzXX__XX__ ; 18
        .byte zzXX__XX__ ; 19
        .byte zzXX__XX__ ; 20
        .byte zzXX__X___ ; 21
        .byte zzX__X____ ; 22
        .byte zzX___X___ ; 23
        .byte zzXX__X___ ; 24
        .byte zzX__X____ ; 25
        .byte zzX__X____ ; 26
        .byte zzX_X_____ ; 27
        .byte zzX_X_____ ; 28
        .byte zzX_______ ; 29
        .byte zz________ ; 30
        .byte zzX_______ ; 31
        .byte zzX_X_____ ; 32
;        .byte zz________ ; 33
;        .byte zz________ ; 34
;        .byte zz________ ; 35
;        .byte zz________ ; 36
;        .byte zz________ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body23
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zz________ ; 20
        .byte zzX_______ ; 21
        .byte zzXXX_____ ; 22
        .byte zzXXXX____ ; 23
        .byte zzXX__X___ ; 24
        .byte zzX___X___ ; 25
        .byte zzX___X___ ; 26
        .byte zzX_XXX___ ; 27
        .byte zzX_X_____ ; 28
        .byte zzXXX_____ ; 29
        .byte zzXXXX____ ; 30
        .byte zzX_XX____ ; 31
        .byte zzX__X____ ; 32
        .byte zzXXX_____ ; 33
        .byte zzXXX_____ ; 34
        .byte zzX_X_X___ ; 35
        .byte zzX_______ ; 36
        .byte zzX_______ ; 37
        .byte zzX_X_____ ; 38
        .byte zzXX______ ; 39
        .byte zzXXXX____ ; 40
        .byte zzX_X_____ ; 41
        .byte zzXXX_____ ; 42
        .byte zzX_______ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
;        .byte zz________ ; 46



Shift23RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  4
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  5
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 15
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 16
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 17
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 18
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        .byte HMOVE_0  | HMOVE_L5 >> 4 ; 21
        .byte HMOVE_L2 | HMOVE_R4 >> 4 ; 22
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 23
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 24
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 25
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 26
        .byte HMOVE_L1 | HMOVE_L2 >> 4 ; 27
        .byte HMOVE_0  | HMOVE_L3 >> 4 ; 28
        .byte HMOVE_L3 | HMOVE_R1 >> 4 ; 29
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30
        .byte HMOVE_R5 | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 33
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 35
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 37
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 38
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 39
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 40
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 41
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 42
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 43
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 23

Wings24
Wings25
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zzX_______ ;  5
        .byte zzX___X___ ;  6
        .byte zzX__X____ ;  7
        .byte zzX__X____ ;  8
        .byte zzX__X____ ;  9
        .byte zzX__X____ ; 10
        .byte zzX__X____ ; 11
        .byte zzX__X____ ; 12
        .byte zzX__X____ ; 13
        .byte zzX__X____ ; 14
        .byte zzXX__X___ ; 15
        .byte zzXX__XX__ ; 16
        .byte zzXX__XX__ ; 17
        .byte zzXX__XX__ ; 18
        .byte zzXX__XX__ ; 19
        .byte zzXX__XX__ ; 20
        .byte zzXX__X___ ; 21
        .byte zzX__X____ ; 22
        .byte zzX___X___ ; 23
        .byte zzXX__X___ ; 24
        .byte zzX__X____ ; 25
        .byte zzX__X____ ; 26
        .byte zzX_X_____ ; 27
        .byte zzX_X_____ ; 28
        .byte zzX_______ ; 29
        .byte zz________ ; 30
        .byte zzX_______ ; 31
        .byte zzX_X_____ ; 32
;        .byte zz________ ; 33
;        .byte zz________ ; 34
;        .byte zz________ ; 35
;        .byte zz________ ; 36
;        .byte zz________ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body24
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zz________ ; 20
        .byte zz________ ; 21
        .byte zzXXX_____ ; 22
        .byte zzXXXX____ ; 23
        .byte zzX___X___ ; 24
        .byte zzX__X____ ; 25
        .byte zzX_______ ; 26
        .byte zzXXX_____ ; 27
        .byte zzX_X_____ ; 28
        .byte zzXXX_____ ; 29
        .byte zzXXXX____ ; 30
        .byte zzX_XX____ ; 31
        .byte zzX__X____ ; 32
        .byte zzXXX_____ ; 33
        .byte zzXXX_____ ; 34
        .byte zzX_X_X___ ; 35
        .byte zzX_______ ; 36
        .byte zzX_______ ; 37
        .byte zzXX______ ; 38
        .byte zzXX______ ; 39
        .byte zzXXX_____ ; 40
        .byte zzX_X_____ ; 41
        .byte zzX_X_____ ; 42
        .byte zzXXX_____ ; 43
        .byte zzX_______ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift24LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_R3 | HMOVE_0  >> 4 ;  5 x0=17 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  6 x0=18 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  7 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=19 x1=14
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 15 x0=17 x1=14
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 16 x0=16 x1=14
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 17 x0=15 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 18 x0=16 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19 x0=16 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=16 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21 x0=16 x1=14
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 22 x0=18 x1=15
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 23 x0=17 x1=14
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 24 x0=17 x1=13
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 25 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_R7 >> 4 ; 26 x0=19 x1=21
        .byte HMOVE_R1 | HMOVE_L2 >> 4 ; 27 x0=20 x1=19
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 28 x0=20 x1=18
        .byte HMOVE_R3 | HMOVE_L1 >> 4 ; 29 x0=23 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30 x0=23 x1=17
        .byte HMOVE_L5 | HMOVE_L1 >> 4 ; 31 x0=18 x1=16
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 32 x0=19 x1=15
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 33 x0=19 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34 x0=19 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 35 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 36 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 37 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 39 x0=19 x1=23
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 40 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 41 x0=19 x1=23
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=19 x1=23
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 43 x0=19 x1=25
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 44 x0=19 x1=29
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=19 x1=29
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=19 x1=29

Shift24RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_L3 | HMOVE_0  >> 4 ;  5
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  6
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 15
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 16
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 17
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 18
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 22
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 23
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 24
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 25
        .byte HMOVE_0  | HMOVE_L7 >> 4 ; 26
        .byte HMOVE_L1 | HMOVE_R2 >> 4 ; 27
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 28
        .byte HMOVE_L3 | HMOVE_R1 >> 4 ; 29
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30
        .byte HMOVE_R5 | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 33
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 35
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 37
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 39
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 40
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 41
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 43
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 24

; Wings25 same as Wings24
        ; .byte zz________ ;  3
        ; .byte zz________ ;  4
        ; .byte zzX_______ ;  5
        ; .byte zzX___X___ ;  6
        ; .byte zzX__X____ ;  7
        ; .byte zzX__X____ ;  8
        ; .byte zzX__X____ ;  9
        ; .byte zzX__X____ ; 10
        ; .byte zzX__X____ ; 11
        ; .byte zzX__X____ ; 12
        ; .byte zzX__X____ ; 13
        ; .byte zzX__X____ ; 14
        ; .byte zzXX__X___ ; 15
        ; .byte zzXX__XX__ ; 16
        ; .byte zzXX__XX__ ; 17
        ; .byte zzXX__XX__ ; 18
        ; .byte zzXX__XX__ ; 19
        ; .byte zzXX__XX__ ; 20
        ; .byte zzXX__X___ ; 21
        ; .byte zzX__X____ ; 22
        ; .byte zzX___X___ ; 23
        ; .byte zzXX__X___ ; 24
        ; .byte zzX__X____ ; 25
        ; .byte zzX__X____ ; 26
        ; .byte zzX_X_____ ; 27
        ; .byte zzX_X_____ ; 28
        ; .byte zzX_______ ; 29
        ; .byte zz________ ; 30
        ; .byte zzX_______ ; 31
        ; .byte zzX_X_____ ; 32
        ; .byte zz________ ; 33
        ; .byte zz________ ; 34
        ; .byte zz________ ; 35
        ; .byte zz________ ; 36
        ; .byte zz________ ; 37
        ; .byte zz________ ; 38
        ; .byte zz________ ; 39
        ; .byte zz________ ; 40
        ; .byte zz________ ; 41
        ; .byte zz________ ; 42
        ; .byte zz________ ; 43
        ; .byte zz________ ; 44
        ; .byte zz________ ; 45
        ; .byte zz________ ; 46

Body25
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zzX_______ ; 12
        .byte zzX_______ ; 13
        .byte zzX_______ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zzX_______ ; 17
        .byte zzX_______ ; 18
        .byte zzX_______ ; 19
        .byte zzX_______ ; 20
        .byte zzX_______ ; 21
        .byte zzX_______ ; 22
        .byte zzXX______ ; 23
        .byte zzX_______ ; 24
        .byte zzX_______ ; 25
        .byte zzXX______ ; 26
        .byte zzXXX_____ ; 27
        .byte zzX_X_____ ; 28
        .byte zzXXX_____ ; 29
        .byte zzXXXX____ ; 30
        .byte zzX_XX____ ; 31
        .byte zzX__X____ ; 32
        .byte zzXXX_____ ; 33
        .byte zzXXX_____ ; 34
        .byte zzX_X_X___ ; 35
        .byte zzX_______ ; 36
        .byte zzX_X_X___ ; 37
        .byte zzXX_XX___ ; 38
        .byte zzX_X_____ ; 39
        .byte zzXXX_____ ; 40
        .byte zzX_______ ; 41
        .byte zzX_______ ; 42
        .byte zzX_______ ; 43
        .byte zzX_______ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift25LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_R3 | HMOVE_0  >> 4 ;  5 x0=17 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  6 x0=18 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  7 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 12 x0=19 x1=15
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 13 x0=19 x1=16
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 14 x0=19 x1=17
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 15 x0=17 x1=17
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 16 x0=16 x1=17
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 17 x0=15 x1=18
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 18 x0=16 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19 x0=16 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=16 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21 x0=16 x1=19
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 22 x0=18 x1=19
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 23 x0=17 x1=18
        .byte HMOVE_0  | HMOVE_R3 >> 4 ; 24 x0=17 x1=21
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 25 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 26 x0=19 x1=20
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 27 x0=20 x1=19
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 28 x0=20 x1=18
        .byte HMOVE_R3 | HMOVE_L1 >> 4 ; 29 x0=23 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30 x0=23 x1=17
        .byte HMOVE_L5 | HMOVE_L1 >> 4 ; 31 x0=18 x1=16
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 32 x0=19 x1=15
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 33 x0=19 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34 x0=19 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 35 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 36 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 37 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 39 x0=19 x1=23
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 40 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 41 x0=19 x1=23
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=19 x1=23
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 43 x0=19 x1=25
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 44 x0=19 x1=27
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=19 x1=27
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=19 x1=27

Shift25RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_L3 | HMOVE_0  >> 4 ;  5
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  6
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 12
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 13
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 14
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 15
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 16
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 17
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 18
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 23
        .byte HMOVE_0  | HMOVE_L3 >> 4 ; 24
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 25
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 26
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 27
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 28
        .byte HMOVE_L3 | HMOVE_R1 >> 4 ; 29
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30
        .byte HMOVE_R5 | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 33
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 34
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 35
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 37
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 39
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 40
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 41
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 43
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 44
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 25

Wings26
        .byte zz________ ;  3
        .byte zzX_______ ;  4
        .byte zzX_______ ;  5
        .byte zzX_______ ;  6
        .byte zzX____X__ ;  7
        .byte zzX___X___ ;  8
        .byte zzX___X___ ;  9
        .byte zzX__X____ ; 10
        .byte zzX__X____ ; 11
        .byte zzX__X____ ; 12
        .byte zzX__X____ ; 13
        .byte zzX__X____ ; 14
        .byte zzXX__X___ ; 15
        .byte zzXX___X__ ; 16
        .byte zzXX___XX_ ; 17
        .byte zzX___XX__ ; 18
        .byte zzXX___XX_ ; 19
        .byte zzX____X__ ; 20
        .byte zzXX___X__ ; 21
        .byte zzX___X___ ; 22
        .byte zzX___X___ ; 23
        .byte zzX__X____ ; 24
        .byte zzX__X____ ; 25
        .byte zzX_X_____ ; 26
        .byte zzX_______ ; 27
        .byte zzX_______ ; 28
        .byte zz________ ; 29
        .byte zz________ ; 30
        .byte zzX_______ ; 31
        .byte zzX_X_____ ; 32
        .byte zz________ ; 33
        .byte zz________ ; 34
        .byte zz________ ; 35
        .byte zz________ ; 36
        .byte zz________ ; 37
        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body26
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz__XX____ ; 11
        .byte zzX_______ ; 12
        .byte zzX_______ ; 13
        .byte zzX_______ ; 14
        .byte zzX_______ ; 15
        .byte zzXX______ ; 16
        .byte zzX_______ ; 17
        .byte zzX_______ ; 18
        .byte zzX_______ ; 19
        .byte zzX_______ ; 20
        .byte zzX_______ ; 21
        .byte zzX_______ ; 22
        .byte zzXX______ ; 23
        .byte zzXX______ ; 24
        .byte zzXX______ ; 25
        .byte zzX_______ ; 26
        .byte zzXX______ ; 27
        .byte zzX_X_____ ; 28
        .byte zzXXX_____ ; 29
        .byte zzXXXX____ ; 30
        .byte zzX_XX____ ; 31
        .byte zzX__XX___ ; 32
        .byte zzXXX_____ ; 33
        .byte zzXXX_____ ; 34
        .byte zzX_X_X___ ; 35
        .byte zzX____X__ ; 36
        .byte zzXX_XXX__ ; 37
        .byte zzXX_X____ ; 38
        .byte zzXX_X____ ; 39
        .byte zzXX______ ; 40
        .byte zzXX______ ; 41
        .byte zzX_______ ; 42
        .byte zzX_______ ; 43
        .byte zzX_______ ; 44
        .byte zzX_______ ; 45
;        .byte zz________ ; 46

Shift26LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_R2 | HMOVE_0  >> 4 ;  4 x0=16 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  5 x0=17 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  6 x0=18 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=18 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=18 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=18 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 10 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 11 x0=19 x1=20
        .byte HMOVE_0  | HMOVE_R3 >> 4 ; 12 x0=19 x1=23
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 13 x0=19 x1=22
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 14 x0=19 x1=21
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 15 x0=17 x1=21
        .byte HMOVE_L1 | HMOVE_L2 >> 4 ; 16 x0=16 x1=19
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 17 x0=15 x1=20
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 18 x0=17 x1=20
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 19 x0=15 x1=20
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 20 x0=16 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21 x0=16 x1=20
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 22 x0=18 x1=20
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 23 x0=18 x1=19
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 24 x0=19 x1=20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25 x0=19 x1=20
        .byte HMOVE_R1 | HMOVE_R2 >> 4 ; 26 x0=20 x1=22
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 27 x0=20 x1=21
        .byte HMOVE_R1 | HMOVE_L2 >> 4 ; 28 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 29 x0=21 x1=19
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 30 x0=21 x1=18
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 31 x0=19 x1=17
        .byte HMOVE_R1 | HMOVE_L2 >> 4 ; 32 x0=20 x1=15
        .byte HMOVE_0  | HMOVE_R5 >> 4 ; 33 x0=20 x1=20
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 34 x0=20 x1=19
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 35 x0=20 x1=17
        .byte HMOVE_0  | HMOVE_R5 >> 4 ; 36 x0=20 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 37 x0=20 x1=22
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 38 x0=20 x1=24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=20 x1=24
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 40 x0=20 x1=26
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 41 x0=20 x1=24
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 42 x0=20 x1=26
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=20 x1=26
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 44 x0=20 x1=28
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 45 x0=20 x1=30
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=20 x1=30

Shift26RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_L2 | HMOVE_0  >> 4 ;  4
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  5
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 11
        .byte HMOVE_0  | HMOVE_L3 >> 4 ; 12
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 13
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 14
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 15
        .byte HMOVE_R1 | HMOVE_R2 >> 4 ; 16
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 17
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 18
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 19
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 20
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 21
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 22
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 23
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25
        .byte HMOVE_L1 | HMOVE_L2 >> 4 ; 26
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 27
        .byte HMOVE_L1 | HMOVE_R2 >> 4 ; 28
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 29
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 30
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_L1 | HMOVE_R2 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_L5 >> 4 ; 33
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 34
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 35
        .byte HMOVE_0  | HMOVE_L5 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 37
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 38
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 40
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 41
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 42
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 44
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 45
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 26

Wings27
        .byte zzX_______ ;  3
        .byte zzX_______ ;  4
        .byte zzX_______ ;  5
        .byte zzX_______ ;  6
        .byte zzX_______ ;  7
        .byte zzX_______ ;  8
        .byte zzX_______ ;  9
        .byte zzX_______ ; 10
        .byte zzX_______ ; 11
        .byte zzX_______ ; 12
        .byte zzX_______ ; 13
        .byte zzX_______ ; 14
        .byte zzX_______ ; 15
        .byte zzXX___X__ ; 16
        .byte zzXX__X___ ; 17
        .byte zzXX__X___ ; 18
        .byte zzXX_XX___ ; 19
        .byte zzXX_X____ ; 20
        .byte zzX_X_____ ; 21
        .byte zzXX_X____ ; 22
        .byte zzXX_X____ ; 23
        .byte zzXX_X____ ; 24
        .byte zzX__X____ ; 25
        .byte zzX__XX___ ; 26
        .byte zzX__X____ ; 27
        .byte zzX_______ ; 28
        .byte zzX_______ ; 29
        .byte zzX__X____ ; 30
        .byte zzX__X____ ; 31
        .byte zzX_______ ; 32
        .byte zz________ ; 33
        .byte zz________ ; 34
        .byte zz________ ; 35
        .byte zzX_______ ; 36
        .byte zz________ ; 37
        .byte zz________ ; 38
        .byte zzX_______ ; 39
        .byte zzX_______ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body27
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zzX_______ ;  9
        .byte zzX_______ ; 10
        .byte zzX_______ ; 11
        .byte zzX_______ ; 12
        .byte zzX_______ ; 13
        .byte zzX_______ ; 14
        .byte zzX_______ ; 15
        .byte zzX_______ ; 16
        .byte zzX_______ ; 17
        .byte zzXX______ ; 18
        .byte zzXX______ ; 19
        .byte zzXX______ ; 20
        .byte zzXXX_____ ; 21
        .byte zzX_______ ; 22
        .byte zzX_______ ; 23
        .byte zzX_______ ; 24
        .byte zzXX______ ; 25
        .byte zzX_X_____ ; 26
        .byte zzX_X_____ ; 27
        .byte zzXXX_____ ; 28
        .byte zzXXXX____ ; 29
        .byte zzXXXXX___ ; 30
        .byte zzX_XXX___ ; 31
        .byte zzXX______ ; 32
        .byte zzXXX_____ ; 33
        .byte zzXXXX____ ; 34
        .byte zzX_XX_X__ ; 35
        .byte zzX___X___ ; 36
        .byte zzXX_X_X__ ; 37
        .byte zzXX_XXX__ ; 38
        .byte zzXXX_X___ ; 39
        .byte zzXXXXX___ ; 40
        .byte zzXXX_____ ; 41
        .byte zzX_______ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
        .byte zz________ ; 46

Shift27LtoR
        .byte HMOVE_R2 | HMOVE_0  >> 4 ;  3 x0=16 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  4 x0=17 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  5 x0=18 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  6 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=19 x1=14
        .byte HMOVE_0  | HMOVE_R3 >> 4 ;  9 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 10 x0=19 x1=16
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=19 x1=16
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 12 x0=20 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13 x0=20 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=20 x1=15
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 15 x0=20 x1=16
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 16 x0=19 x1=16
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 17 x0=20 x1=16
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 18 x0=19 x1=16
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19 x0=19 x1=16
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 20 x0=20 x1=16
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 21 x0=21 x1=16
        .byte HMOVE_L2 | HMOVE_R1 >> 4 ; 22 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 24 x0=19 x1=17
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 25 x0=20 x1=17
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 26 x0=19 x1=17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 27 x0=19 x1=17
        .byte HMOVE_R6 | HMOVE_0  >> 4 ; 28 x0=25 x1=17
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 29 x0=24 x1=16
        .byte HMOVE_L6 | HMOVE_L1 >> 4 ; 30 x0=18 x1=15
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 31 x0=17 x1=14
        .byte HMOVE_0  | HMOVE_R5 >> 4 ; 32 x0=17 x1=19
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 33 x0=17 x1=18
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 34 x0=17 x1=17
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 35 x0=17 x1=15
        .byte HMOVE_R2 | HMOVE_R6 >> 4 ; 36 x0=19 x1=21
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 37 x0=19 x1=20
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 38 x0=19 x1=21
        .byte HMOVE_R2 | HMOVE_R2 >> 4 ; 39 x0=21 x1=23
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 40 x0=23 x1=24
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 41 x0=23 x1=30
        .byte HMOVE_0  | HMOVE_R3 >> 4 ; 42 x0=23 x1=33
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=23 x1=33
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=23 x1=33
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=23 x1=33
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=23 x1=33

Shift27RtoL
        .byte HMOVE_L2 | HMOVE_0  >> 4 ;  3
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  4
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  5
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_L3 >> 4 ;  9
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 15
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 16
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 17
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 18
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 19
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 20
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 21
        .byte HMOVE_R2 | HMOVE_L1 >> 4 ; 22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 23
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 24
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 25
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 26
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 27
        .byte HMOVE_L6 | HMOVE_0  >> 4 ; 28
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 29
        .byte HMOVE_R6 | HMOVE_R1 >> 4 ; 30
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 31
        .byte HMOVE_0  | HMOVE_L5 >> 4 ; 32
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 33
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 34
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 35
        .byte HMOVE_L2 | HMOVE_L6 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 37
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 38
        .byte HMOVE_L2 | HMOVE_L2 >> 4 ; 39
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 40
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 41
        .byte HMOVE_0  | HMOVE_L3 >> 4 ; 42
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 27

; Wings28
; Wings32
        ; .byte zz________ ;  3
        ; .byte zzX_______ ;  4
        ; .byte zzX_______ ;  5
        ; .byte zzX_______ ;  6
        ; .byte zzX_______ ;  7
        ; .byte zzX_______ ;  8
        ; .byte zzX_______ ;  9
        ; .byte zzX_______ ; 10
        ; .byte zzX_______ ; 11
        ; .byte zzX_______ ; 12
        ; .byte zzX_______ ; 13
        ; .byte zzX_______ ; 14
        ; .byte zzX_______ ; 15
        ; .byte zzX__X____ ; 16
        ; .byte zzXX______ ; 17
        ; .byte zzX__X____ ; 18
        ; .byte zzX_XX____ ; 19
        ; .byte zzXXX___XX ; 20
        ; .byte zzX__X__XX ; 21
        ; .byte zzX__X__XX ; 22
        ; .byte zzX_XX____ ; 23
        ; .byte zzX___XXX_ ; 24
        ; .byte zzXX______ ; 25
        ; .byte zzX____X__ ; 26
        ; .byte zzX_______ ; 27
        ; .byte zzXX______ ; 28
        ; .byte zzX___X___ ; 29
        ; .byte zzX_______ ; 30
        ; .byte zzXX______ ; 31
        ; .byte zzX_______ ; 32
        ; .byte zz________ ; 33
        ; .byte zz________ ; 34
        ; .byte zz________ ; 35
        ; .byte zz________ ; 36
        ; .byte zz________ ; 37
        ; .byte zz________ ; 38
        ; .byte zz________ ; 39
        ; .byte zz________ ; 40
; ;        .byte zz________ ; 41
; ;        .byte zz________ ; 42
; ;        .byte zz________ ; 43
; ;        .byte zz________ ; 44
; ;        .byte zz________ ; 45
; ;        .byte zz________ ; 46
;
; Body28
        ; .byte zz________ ;  3
        ; .byte zz________ ;  4
        ; .byte zz________ ;  5
        ; .byte zz________ ;  6
        ; .byte zz________ ;  7
        ; .byte zz________ ;  8
        ; .byte zz___X_X__ ;  9
        ; .byte zzXXXX____ ; 10
        ; .byte zzXX_X____ ; 11
        ; .byte zzXX______ ; 12
        ; .byte zzXXX_____ ; 13
        ; .byte zzX____X__ ; 14
        ; .byte zzX_____X_ ; 15
        ; .byte zzX____XX_ ; 16
        ; .byte zzX_____X_ ; 17
        ; .byte zz__X_____ ; 18
        ; .byte zz__XX____ ; 19
        ; .byte zzXX____XX ; 20
        ; .byte zzX____X__ ; 21
        ; .byte zzX___X___ ; 22
        ; .byte zzXXX_____ ; 23
        ; .byte zzXXX_____ ; 24
        ; .byte zzXXXXX___ ; 25
        ; .byte zzXXXXXX__ ; 26
        ; .byte zzXXXXXX__ ; 27
        ; .byte zzX_XXXX__ ; 28
        ; .byte zzXXXXXXX_ ; 29
        ; .byte zzXXXXX___ ; 30
        ; .byte zzX_XX____ ; 31
        ; .byte zzX__X____ ; 32
        ; .byte zzX__X____ ; 33
        ; .byte zzX__X____ ; 34
        ; .byte zzX__X____ ; 35
        ; .byte zzX___X___ ; 36
        ; .byte zzX_____X_ ; 37
        ; .byte zz________ ; 38
        ; .byte zz________ ; 39
        ; .byte zz________ ; 40
        ; .byte zz________ ; 41
        ; .byte zz________ ; 42
        ; .byte zz________ ; 43
        ; .byte zz________ ; 44
        ; .byte zz________ ; 45
; ;        .byte zz________ ; 46
;
; Shift28LtoR
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ;  4 x0=13 x1=14
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ;  5 x0=14 x1=14
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ;  6 x0=15 x1=14
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ;  7 x0=16 x1=14
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=16 x1=14
        ; .byte HMOVE_0  | HMOVE_R7 >> 4 ;  9 x0=16 x1=21
        ; .byte HMOVE_0  | HMOVE_R4 >> 4 ; 10 x0=16 x1=25
        ; .byte HMOVE_R1 | HMOVE_L2 >> 4 ; 11 x0=17 x1=23
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ; 12 x0=17 x1=25
        ; .byte HMOVE_0  | HMOVE_L3 >> 4 ; 13 x0=17 x1=22
        ; .byte HMOVE_0  | HMOVE_L7 >> 4 ; 14 x0=17 x1=15
        ; .byte HMOVE_R1 | HMOVE_L2 >> 4 ; 15 x0=18 x1=13
        ; .byte HMOVE_L6 | HMOVE_0  >> 4 ; 16 x0=12 x1=13
        ; .byte HMOVE_R5 | HMOVE_L1 >> 4 ; 17 x0=17 x1=12
        ; .byte HMOVE_L6 | HMOVE_R7 >> 4 ; 18 x0=11 x1=19
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ; 19 x0=11 x1=17
        ; .byte HMOVE_R2 | HMOVE_L7 >> 4 ; 20 x0=13 x1=10
        ; .byte HMOVE_L3 | HMOVE_R1 >> 4 ; 21 x0=10 x1=11
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 22 x0=10 x1=12
        ; .byte HMOVE_R6 | HMOVE_L2 >> 4 ; 23 x0=16 x1=10
        ; .byte HMOVE_L6 | HMOVE_R2 >> 4 ; 24 x0=10 x1=12
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 25 x0=10 x1=13
        ; .byte HMOVE_R1 | HMOVE_L3 >> 4 ; 26 x0=11 x1=10
        ; .byte HMOVE_R2 | HMOVE_0  >> 4 ; 27 x0=13 x1=10
        ; .byte HMOVE_L2 | HMOVE_0  >> 4 ; 28 x0=11 x1=10
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 29 x0=11 x1=10
        ; .byte HMOVE_R2 | HMOVE_0  >> 4 ; 30 x0=13 x1=10
        ; .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 31 x0=12 x1=11
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ; 32 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 33 x0=13 x1=12
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 34 x0=13 x1=13
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 35 x0=13 x1=14
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 36 x0=13 x1=13
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=13 x1=11
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=13 x1=11
;
; Shift28RtoL
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ;  4
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ;  5
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ;  6
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ;  7
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        ; .byte HMOVE_0  | HMOVE_L7 >> 4 ;  9
        ; .byte HMOVE_0  | HMOVE_L4 >> 4 ; 10
        ; .byte HMOVE_L1 | HMOVE_R2 >> 4 ; 11
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ; 12
        ; .byte HMOVE_0  | HMOVE_R3 >> 4 ; 13
        ; .byte HMOVE_0  | HMOVE_R7 >> 4 ; 14
        ; .byte HMOVE_L1 | HMOVE_R2 >> 4 ; 15
        ; .byte HMOVE_R6 | HMOVE_0  >> 4 ; 16
        ; .byte HMOVE_L5 | HMOVE_R1 >> 4 ; 17
        ; .byte HMOVE_R6 | HMOVE_L7 >> 4 ; 18
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ; 19
        ; .byte HMOVE_L2 | HMOVE_R7 >> 4 ; 20
        ; .byte HMOVE_R3 | HMOVE_L1 >> 4 ; 21
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 22
        ; .byte HMOVE_L6 | HMOVE_R2 >> 4 ; 23
        ; .byte HMOVE_R6 | HMOVE_L2 >> 4 ; 24
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 25
        ; .byte HMOVE_L1 | HMOVE_R3 >> 4 ; 26
        ; .byte HMOVE_L2 | HMOVE_0  >> 4 ; 27
        ; .byte HMOVE_R2 | HMOVE_0  >> 4 ; 28
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 29
        ; .byte HMOVE_L2 | HMOVE_0  >> 4 ; 30
        ; .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 31
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ; 32
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 33
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 34
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 35
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 36
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
; ;End 28
;
; Wings29
        ; .byte zz________ ;  3
        ; .byte zz________ ;  4
        ; .byte zz________ ;  5
        ; .byte zz________ ;  6
        ; .byte zz________ ;  7
        ; .byte zz________ ;  8
        ; .byte zzX_______ ;  9
        ; .byte zzX_______ ; 10
        ; .byte zzX_______ ; 11
        ; .byte zzX_______ ; 12
        ; .byte zzX_______ ; 13
        ; .byte zzXX______ ; 14
        ; .byte zzX_______ ; 15
        ; .byte zzX_____XX ; 16
        ; .byte zzX____XX_ ; 17
        ; .byte zzX___XX__ ; 18
        ; .byte zzX_X___X_ ; 19
        ; .byte zzX__XX___ ; 20
        ; .byte zzX_X__X__ ; 21
        ; .byte zzX___XX__ ; 22
        ; .byte zzXX_X____ ; 23
        ; .byte zzX___X___ ; 24
        ; .byte zzXX____X_ ; 25
        ; .byte zzX____X__ ; 26
        ; .byte zzX_______ ; 27
        ; .byte zzXX______ ; 28
        ; .byte zzX___X___ ; 29
        ; .byte zzX_______ ; 30
        ; .byte zzXX______ ; 31
        ; .byte zzX_______ ; 32
        ; .byte zz________ ; 33
        ; .byte zz________ ; 34
        ; .byte zz________ ; 35
        ; .byte zz________ ; 36
        ; .byte zz________ ; 37
        ; .byte zz________ ; 38
        ; .byte zz________ ; 39
        ; .byte zz________ ; 40
        ; .byte zz________ ; 41
        ; .byte zz________ ; 42
        ; .byte zz________ ; 43
        ; .byte zz________ ; 44
; ;        .byte zz________ ; 45
; ;        .byte zz________ ; 46
;
; Body29
        ; .byte zz________ ;  3
        ; .byte zz________ ;  4
        ; .byte zzX_______ ;  5
        ; .byte zzX_______ ;  6
        ; .byte zzX_X_____ ;  7
        ; .byte zzXX______ ;  8
        ; .byte zzX_X_____ ;  9
        ; .byte zzXXX_____ ; 10
        ; .byte zzXXXX____ ; 11
        ; .byte zzX__X____ ; 12
        ; .byte zz____X___ ; 13
        ; .byte zzX______X ; 14
        ; .byte zzX_____X_ ; 15
        ; .byte zzX_____X_ ; 16
        ; .byte zzX_____X_ ; 17
        ; .byte zzX_______ ; 18
        ; .byte zzX_______ ; 19
        ; .byte zzXX______ ; 20
        ; .byte zzX____X__ ; 21
        ; .byte zzXX___XX_ ; 22
        ; .byte zzXXX__XX_ ; 23
        ; .byte zzXXX_XX__ ; 24
        ; .byte zzXXXX____ ; 25
        ; .byte zzXXXXXX__ ; 26
        ; .byte zzXXXXXX__ ; 27
        ; .byte zzX_XXXX__ ; 28
        ; .byte zzXXXXXXX_ ; 29
        ; .byte zzXXXXX___ ; 30
        ; .byte zzX_XX____ ; 31
        ; .byte zzX__X____ ; 32
        ; .byte zzX__X____ ; 33
        ; .byte zzX__X____ ; 34
        ; .byte zzX__X____ ; 35
        ; .byte zzX___X___ ; 36
        ; .byte zzX_____X_ ; 37
        ; .byte zz________ ; 38
        ; .byte zz________ ; 39
        ; .byte zz________ ; 40
        ; .byte zz________ ; 41
        ; .byte zz________ ; 42
        ; .byte zz________ ; 43
        ; .byte zz________ ; 44
; ;        .byte zz________ ; 45
; ;        .byte zz________ ; 46
;
; Shift29LtoR
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        ; .byte HMOVE_0  | HMOVE_R3 >> 4 ;  5 x0=14 x1=17
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ;  6 x0=14 x1=19
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ;  7 x0=14 x1=17
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ;  8 x0=14 x1=19
        ; .byte HMOVE_L5 | HMOVE_0  >> 4 ;  9 x0= 9 x1=19
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ; 10 x0=10 x1=19
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ; 11 x0=11 x1=19
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 12 x0=11 x1=18
        ; .byte HMOVE_0  | HMOVE_L7 >> 4 ; 13 x0=11 x1=11
        ; .byte HMOVE_0  | HMOVE_L6 >> 4 ; 14 x0=11 x1= 5
        ; .byte HMOVE_R1 | HMOVE_R2 >> 4 ; 15 x0=12 x1= 7
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 16 x0=12 x1= 8
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 17 x0=12 x1= 8
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 18 x0=12 x1= 8
        ; .byte HMOVE_L4 | HMOVE_R1 >> 4 ; 19 x0= 8 x1= 9
        ; .byte HMOVE_R5 | HMOVE_L1 >> 4 ; 20 x0=13 x1= 8
        ; .byte HMOVE_L4 | HMOVE_R3 >> 4 ; 21 x0= 9 x1=11
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 22 x0= 9 x1=10
        ; .byte HMOVE_R7 | HMOVE_L1 >> 4 ; 23 x0=16 x1= 9
        ; .byte HMOVE_L6 | HMOVE_R3 >> 4 ; 24 x0=10 x1=12
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ; 25 x0=10 x1=14
        ; .byte HMOVE_R1 | HMOVE_L4 >> 4 ; 26 x0=11 x1=10
        ; .byte HMOVE_R2 | HMOVE_0  >> 4 ; 27 x0=13 x1=10
        ; .byte HMOVE_L2 | HMOVE_0  >> 4 ; 28 x0=11 x1=10
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 29 x0=11 x1=10
        ; .byte HMOVE_R2 | HMOVE_0  >> 4 ; 30 x0=13 x1=10
        ; .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 31 x0=12 x1=11
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ; 32 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 33 x0=13 x1=12
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 34 x0=13 x1=13
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 35 x0=13 x1=14
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 36 x0=13 x1=13
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=13 x1=11
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=13 x1=11
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=13 x1=11
;
; Shift29RtoL
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        ; .byte HMOVE_0  | HMOVE_L3 >> 4 ;  5
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ;  6
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ;  7
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ;  8
        ; .byte HMOVE_R5 | HMOVE_0  >> 4 ;  9
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ; 10
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ; 11
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 12
        ; .byte HMOVE_0  | HMOVE_R7 >> 4 ; 13
        ; .byte HMOVE_0  | HMOVE_R6 >> 4 ; 14
        ; .byte HMOVE_L1 | HMOVE_L2 >> 4 ; 15
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 16
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 17
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 18
        ; .byte HMOVE_R4 | HMOVE_L1 >> 4 ; 19
        ; .byte HMOVE_L5 | HMOVE_R1 >> 4 ; 20
        ; .byte HMOVE_R4 | HMOVE_L3 >> 4 ; 21
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 22
        ; .byte HMOVE_L7 | HMOVE_R1 >> 4 ; 23
        ; .byte HMOVE_R6 | HMOVE_L3 >> 4 ; 24
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ; 25
        ; .byte HMOVE_L1 | HMOVE_R4 >> 4 ; 26
        ; .byte HMOVE_L2 | HMOVE_0  >> 4 ; 27
        ; .byte HMOVE_R2 | HMOVE_0  >> 4 ; 28
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 29
        ; .byte HMOVE_L2 | HMOVE_0  >> 4 ; 30
        ; .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 31
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ; 32
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 33
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 34
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 35
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 36
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
; ;End 29
;
; Wings30
        ; .byte zz________ ;  3
        ; .byte zz________ ;  4
        ; .byte zz________ ;  5
        ; .byte zz________ ;  6
        ; .byte zz________ ;  7
        ; .byte zz________ ;  8
        ; .byte zz________ ;  9
        ; .byte zz________ ; 10
        ; .byte zz________ ; 11
        ; .byte zz________ ; 12
        ; .byte zz________ ; 13
        ; .byte zz________ ; 14
        ; .byte zz________ ; 15
        ; .byte zz________ ; 16
        ; .byte zz________ ; 17
        ; .byte zz________ ; 18
        ; .byte zz________ ; 19
        ; .byte zzX______X ; 20
        ; .byte zzX_____X_ ; 21
        ; .byte zzX_X___X_ ; 22
        ; .byte zzX____X__ ; 23
        ; .byte zzX___XX__ ; 24
        ; .byte zzX___X___ ; 25
        ; .byte zzXX______ ; 26
        ; .byte zzX_______ ; 27
        ; .byte zzX_______ ; 28
        ; .byte zzX_______ ; 29
        ; .byte zzXX______ ; 30
        ; .byte zzX_______ ; 31
        ; .byte zzX_______ ; 32
        ; .byte zzXX______ ; 33
        ; .byte zzX_______ ; 34
        ; .byte zz________ ; 35
        ; .byte zz________ ; 36
        ; .byte zz________ ; 37
; ;        .byte zz________ ; 38
; ;        .byte zz________ ; 39
; ;        .byte zz________ ; 40
; ;        .byte zz________ ; 41
; ;        .byte zz________ ; 42
; ;        .byte zz________ ; 43
; ;        .byte zz________ ; 44
; ;        .byte zz________ ; 45
; ;        .byte zz________ ; 46
;
; Body30
        ; .byte zz________ ;  3
        ; .byte zz________ ;  4
        ; .byte zz________ ;  5
        ; .byte zz________ ;  6
        ; .byte zz________ ;  7
        ; .byte zz________ ;  8
        ; .byte zz________ ;  9
        ; .byte zz________ ; 10
        ; .byte zz________ ; 11
        ; .byte zz_X______ ; 12
        ; .byte zzXXX_____ ; 13
        ; .byte zzX_X_____ ; 14
        ; .byte zzXXX_____ ; 15
        ; .byte zzX_______ ; 16
        ; .byte zzXX______ ; 17
        ; .byte zzX_______ ; 18
        ; .byte zzX_______ ; 19
        ; .byte zzXX______ ; 20
        ; .byte zzX_X_____ ; 21
        ; .byte zzX_X_____ ; 22
        ; .byte zzX_X_____ ; 23
        ; .byte zzX_X_____ ; 24
        ; .byte zzX_X_____ ; 25
        ; .byte zzXXX_____ ; 26
        ; .byte zzXXXX____ ; 27
        ; .byte zzXXXX____ ; 28
        ; .byte zzX_X_____ ; 29
        ; .byte zzX_XX____ ; 30
        ; .byte zzX_XX____ ; 31
        ; .byte zzXX_X____ ; 32
        ; .byte zzX__X____ ; 33
        ; .byte zzX_X_____ ; 34
        ; .byte zzX_X_____ ; 35
        ; .byte zzX_X_____ ; 36
        ; .byte zzX___X___ ; 37
; ;        .byte zz________ ; 38
; ;        .byte zz________ ; 39
; ;        .byte zz________ ; 40
; ;        .byte zz________ ; 41
; ;        .byte zz________ ; 42
; ;        .byte zz________ ; 43
; ;        .byte zz________ ; 44
; ;        .byte zz________ ; 45
; ;        .byte zz________ ; 46
;
; Shift30LtoR
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  5 x0=14 x1=14
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  6 x0=14 x1=14
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=14 x1=14
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=14
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=14 x1=14
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=14
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=14
        ; .byte HMOVE_0  | HMOVE_R6 >> 4 ; 12 x0=14 x1=20
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 13 x0=14 x1=20
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=20
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ; 15 x0=14 x1=18
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ; 16 x0=14 x1=20
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ; 17 x0=14 x1=18
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ; 18 x0=14 x1=20
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 19 x0=14 x1=21
        ; .byte HMOVE_L1 | HMOVE_L2 >> 4 ; 20 x0=13 x1=19
        ; .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 21 x0=14 x1=18
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 22 x0=14 x1=17
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ; 23 x0=15 x1=17
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ; 24 x0=16 x1=17
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 25 x0=16 x1=17
        ; .byte HMOVE_R5 | HMOVE_L1 >> 4 ; 26 x0=21 x1=16
        ; .byte HMOVE_L4 | HMOVE_0  >> 4 ; 27 x0=17 x1=16
        ; .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 28 x0=18 x1=17
        ; .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 29 x0=20 x1=18
        ; .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 30 x0=18 x1=17
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ; 31 x0=19 x1=17
        ; .byte HMOVE_R2 | HMOVE_0  >> 4 ; 32 x0=21 x1=17
        ; .byte HMOVE_L2 | HMOVE_0  >> 4 ; 33 x0=19 x1=17
        ; .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 34 x0=20 x1=18
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 35 x0=20 x1=18
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 36 x0=20 x1=17
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=20 x1=15
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=20 x1=15
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=20 x1=15
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=20 x1=15
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=20 x1=15
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=20 x1=15
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=20 x1=15
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=20 x1=15
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=20 x1=15
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=20 x1=15
;
; Shift30RtoL
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  5
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  6
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        ; .byte HMOVE_0  | HMOVE_L6 >> 4 ; 12
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 13
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ; 15
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ; 16
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ; 17
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ; 18
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 19
        ; .byte HMOVE_R1 | HMOVE_R2 >> 4 ; 20
        ; .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 21
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 22
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ; 23
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ; 24
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 25
        ; .byte HMOVE_L5 | HMOVE_R1 >> 4 ; 26
        ; .byte HMOVE_R4 | HMOVE_0  >> 4 ; 27
        ; .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 28
        ; .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 29
        ; .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 30
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ; 31
        ; .byte HMOVE_L2 | HMOVE_0  >> 4 ; 32
        ; .byte HMOVE_R2 | HMOVE_0  >> 4 ; 33
        ; .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 34
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 35
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 36
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
; ;End 30
;
; Wings31
        ; .byte zz________ ;  3
        ; .byte zz________ ;  4
        ; .byte zzX_______ ;  5
        ; .byte zzX_______ ;  6
        ; .byte zzX_______ ;  7
        ; .byte zzXX______ ;  8
        ; .byte zzX_______ ;  9
        ; .byte zzX_______ ; 10
        ; .byte zzX_______ ; 11
        ; .byte zzX_______ ; 12
        ; .byte zzX_______ ; 13
        ; .byte zzX_______ ; 14
        ; .byte zzX_______ ; 15
        ; .byte zzXX______ ; 16
        ; .byte zzXX______ ; 17
        ; .byte zzX_______ ; 18
        ; .byte zzX___X__X ; 19
        ; .byte zzX____XX_ ; 20
        ; .byte zzX__XX___ ; 21
        ; .byte zzX_XX____ ; 22
        ; .byte zzXX______ ; 23
        ; .byte zzX_______ ; 24
        ; .byte zzX_X_____ ; 25
        ; .byte zzXXX_X___ ; 26
        ; .byte zzXXXXXX__ ; 27
        ; .byte zzXXX_____ ; 28
        ; .byte zzX_X_____ ; 29
        ; .byte zzXX______ ; 30
        ; .byte zzXX______ ; 31
        ; .byte zz________ ; 32
        ; .byte zzX_______ ; 33
        ; .byte zz________ ; 34
        ; .byte zz________ ; 35
        ; .byte zz________ ; 36
        ; .byte zz________ ; 37
        ; .byte zz________ ; 38
; ;        .byte zz________ ; 39
; ;        .byte zz________ ; 40
; ;        .byte zz________ ; 41
; ;        .byte zz________ ; 42
; ;        .byte zz________ ; 43
; ;        .byte zz________ ; 44
; ;        .byte zz________ ; 45
; ;        .byte zz________ ; 46
;
; Body31
        ; .byte zz________ ;  3
        ; .byte zz________ ;  4
        ; .byte zz________ ;  5
        ; .byte zz________ ;  6
        ; .byte zz________ ;  7
        ; .byte zz________ ;  8
        ; .byte zz________ ;  9
        ; .byte zz________ ; 10
        ; .byte zz___X_X__ ; 11
        ; .byte zzXXXX____ ; 12
        ; .byte zzXX_X____ ; 13
        ; .byte zzXXX_____ ; 14
        ; .byte zzXXXX____ ; 15
        ; .byte zzX_______ ; 16
        ; .byte zzX_______ ; 17
        ; .byte zzXX______ ; 18
        ; .byte zzX_______ ; 19
        ; .byte zzX_______ ; 20
        ; .byte zzX_______ ; 21
        ; .byte zzX_______ ; 22
        ; .byte zzXXX_____ ; 23
        ; .byte zzXXXX____ ; 24
        ; .byte zzX_X_XX__ ; 25
        ; .byte zzXXXX____ ; 26
        ; .byte zzX_____XX ; 27
        ; .byte zzXX______ ; 28
        ; .byte zzXXXX____ ; 29
        ; .byte zzX_XX____ ; 30
        ; .byte zzX__X____ ; 31
        ; .byte zzXXXX____ ; 32
        ; .byte zzXXXX____ ; 33
        ; .byte zzX__X____ ; 34
        ; .byte zzX__X____ ; 35
        ; .byte zzX___X___ ; 36
        ; .byte zzX____X__ ; 37
        ; .byte zz________ ; 38
        ; .byte zz________ ; 39
        ; .byte zz________ ; 40
        ; .byte zz________ ; 41
        ; .byte zz________ ; 42
        ; .byte zz________ ; 43
        ; .byte zz________ ; 44
; ;        .byte zz________ ; 45
; ;        .byte zz________ ; 46
;
; Shift31LtoR
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        ; .byte HMOVE_L3 | HMOVE_0  >> 4 ;  5 x0=11 x1=14
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ;  6 x0=12 x1=14
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ;  7 x0=13 x1=14
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=13 x1=14
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ;  9 x0=14 x1=14
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ; 10 x0=15 x1=14
        ; .byte HMOVE_0  | HMOVE_R7 >> 4 ; 11 x0=15 x1=21
        ; .byte HMOVE_0  | HMOVE_R4 >> 4 ; 12 x0=15 x1=25
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ; 13 x0=15 x1=23
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ; 14 x0=15 x1=25
        ; .byte HMOVE_L1 | HMOVE_L4 >> 4 ; 15 x0=14 x1=21
        ; .byte HMOVE_L2 | HMOVE_R4 >> 4 ; 16 x0=12 x1=25
        ; .byte HMOVE_R2 | HMOVE_0  >> 4 ; 17 x0=14 x1=25
        ; .byte HMOVE_R2 | HMOVE_L2 >> 4 ; 18 x0=16 x1=23
        ; .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 19 x0=17 x1=24
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=17 x1=24
        ; .byte HMOVE_R1 | HMOVE_L2 >> 4 ; 21 x0=18 x1=22
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ; 22 x0=18 x1=20
        ; .byte HMOVE_R3 | HMOVE_L5 >> 4 ; 23 x0=21 x1=15
        ; .byte HMOVE_L4 | HMOVE_L1 >> 4 ; 24 x0=17 x1=14
        ; .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 25 x0=15 x1=13
        ; .byte HMOVE_L2 | HMOVE_R5 >> 4 ; 26 x0=13 x1=18
        ; .byte HMOVE_0  | HMOVE_L6 >> 4 ; 27 x0=13 x1=12
        ; .byte HMOVE_R2 | HMOVE_0  >> 4 ; 28 x0=15 x1=12
        ; .byte HMOVE_L2 | HMOVE_0  >> 4 ; 29 x0=13 x1=12
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 30 x0=13 x1=12
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ; 31 x0=14 x1=12
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 32 x0=14 x1=13
        ; .byte HMOVE_R2 | HMOVE_0  >> 4 ; 33 x0=16 x1=13
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 34 x0=16 x1=14
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 35 x0=16 x1=15
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 36 x0=16 x1=14
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 37 x0=16 x1=13
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=16 x1=13
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=16 x1=13
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=16 x1=13
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=16 x1=13
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=16 x1=13
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=16 x1=13
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=16 x1=13
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=16 x1=13
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=16 x1=13
;
; Shift31RtoL
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        ; .byte HMOVE_R3 | HMOVE_0  >> 4 ;  5
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ;  6
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ;  7
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ;  9
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ; 10
        ; .byte HMOVE_0  | HMOVE_L7 >> 4 ; 11
        ; .byte HMOVE_0  | HMOVE_L4 >> 4 ; 12
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ; 13
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ; 14
        ; .byte HMOVE_R1 | HMOVE_R4 >> 4 ; 15
        ; .byte HMOVE_R2 | HMOVE_L4 >> 4 ; 16
        ; .byte HMOVE_L2 | HMOVE_0  >> 4 ; 17
        ; .byte HMOVE_L2 | HMOVE_R2 >> 4 ; 18
        ; .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 19
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        ; .byte HMOVE_L1 | HMOVE_R2 >> 4 ; 21
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ; 22
        ; .byte HMOVE_L3 | HMOVE_R5 >> 4 ; 23
        ; .byte HMOVE_R4 | HMOVE_R1 >> 4 ; 24
        ; .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 25
        ; .byte HMOVE_R2 | HMOVE_L5 >> 4 ; 26
        ; .byte HMOVE_0  | HMOVE_R6 >> 4 ; 27
        ; .byte HMOVE_L2 | HMOVE_0  >> 4 ; 28
        ; .byte HMOVE_R2 | HMOVE_0  >> 4 ; 29
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 30
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ; 31
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 32
        ; .byte HMOVE_L2 | HMOVE_0  >> 4 ; 33
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 34
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 35
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 36
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 37
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
; ;End 31
;
; ; Wings32 same as Wings28
        ; ; .byte zz________ ;  3
        ; ; .byte zzX_______ ;  4
        ; ; .byte zzX_______ ;  5
        ; ; .byte zzX_______ ;  6
        ; ; .byte zzX_______ ;  7
        ; ; .byte zzX_______ ;  8
        ; ; .byte zzX_______ ;  9
        ; ; .byte zzX_______ ; 10
        ; ; .byte zzX_______ ; 11
        ; ; .byte zzX_______ ; 12
        ; ; .byte zzX_______ ; 13
        ; ; .byte zzX_______ ; 14
        ; ; .byte zzX_______ ; 15
        ; ; .byte zzX__X____ ; 16
        ; ; .byte zzXX______ ; 17
        ; ; .byte zzX__X____ ; 18
        ; ; .byte zzX_XX____ ; 19
        ; ; .byte zzXXX___XX ; 20
        ; ; .byte zzX__X__XX ; 21
        ; ; .byte zzX__X__XX ; 22
        ; ; .byte zzX_XX____ ; 23
        ; ; .byte zzX___XXX_ ; 24
        ; ; .byte zzXX______ ; 25
        ; ; .byte zzX____X__ ; 26
        ; ; .byte zzX_______ ; 27
        ; ; .byte zzXX______ ; 28
        ; ; .byte zzX___X___ ; 29
        ; ; .byte zzX_______ ; 30
        ; ; .byte zzXX______ ; 31
        ; ; .byte zzX_______ ; 32
        ; ; .byte zz________ ; 33
        ; ; .byte zz________ ; 34
        ; ; .byte zz________ ; 35
        ; ; .byte zz________ ; 36
        ; ; .byte zz________ ; 37
        ; ; .byte zz________ ; 38
        ; ; .byte zz________ ; 39
        ; ; .byte zz________ ; 40
        ; ; .byte zz________ ; 41
        ; ; .byte zz________ ; 42
        ; ; .byte zz________ ; 43
        ; ; .byte zz________ ; 44
        ; ; .byte zz________ ; 45
        ; ; .byte zz________ ; 46
;
; Body32
        ; .byte zz________ ;  3
        ; .byte zz________ ;  4
        ; .byte zz________ ;  5
        ; .byte zz________ ;  6
        ; .byte zz________ ;  7
        ; .byte zz___X____ ;  8
        ; .byte zzX_XX____ ;  9
        ; .byte zzX_XX____ ; 10
        ; .byte zzXX_X____ ; 11
        ; .byte zzXX______ ; 12
        ; .byte zzXXX_____ ; 13
        ; .byte zz___X____ ; 14
        ; .byte zzX_____X_ ; 15
        ; .byte zzXX____X_ ; 16
        ; .byte zzX_____X_ ; 17
        ; .byte zz__XX____ ; 18
        ; .byte zz___X____ ; 19
        ; .byte zzXX____XX ; 20
        ; .byte zzX____X__ ; 21
        ; .byte zzX___X___ ; 22
        ; .byte zzXXX_____ ; 23
        ; .byte zzXXX_____ ; 24
        ; .byte zzXXXXX___ ; 25
        ; .byte zzXXXXXX__ ; 26
        ; .byte zzXXXXXX__ ; 27
        ; .byte zzX_XXXX__ ; 28
        ; .byte zzXXXXXXX_ ; 29
        ; .byte zzXXXXX___ ; 30
        ; .byte zzX_XX____ ; 31
        ; .byte zzX__X____ ; 32
        ; .byte zzX__X____ ; 33
        ; .byte zzX__X____ ; 34
        ; .byte zzX__X____ ; 35
        ; .byte zzX___X___ ; 36
        ; .byte zzX_____X_ ; 37
        ; .byte zz________ ; 38
        ; .byte zz________ ; 39
        ; .byte zz________ ; 40
        ; .byte zz________ ; 41
        ; .byte zz________ ; 42
        ; .byte zz________ ; 43
        ; .byte zz________ ; 44
        ; .byte zz________ ; 45
; ;        .byte zz________ ; 46
;
; Shift32LtoR
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ;  4 x0=13 x1=14
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ;  5 x0=14 x1=14
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ;  6 x0=15 x1=14
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ;  7 x0=16 x1=14
        ; .byte HMOVE_0  | HMOVE_R7 >> 4 ;  8 x0=16 x1=21
        ; .byte HMOVE_0  | HMOVE_R4 >> 4 ;  9 x0=16 x1=25
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=16 x1=25
        ; .byte HMOVE_R1 | HMOVE_L2 >> 4 ; 11 x0=17 x1=23
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ; 12 x0=17 x1=25
        ; .byte HMOVE_0  | HMOVE_L3 >> 4 ; 13 x0=17 x1=22
        ; .byte HMOVE_0  | HMOVE_L3 >> 4 ; 14 x0=17 x1=19
        ; .byte HMOVE_R1 | HMOVE_L6 >> 4 ; 15 x0=18 x1=13
        ; .byte HMOVE_L6 | HMOVE_0  >> 4 ; 16 x0=12 x1=13
        ; .byte HMOVE_R5 | HMOVE_L1 >> 4 ; 17 x0=17 x1=12
        ; .byte HMOVE_L6 | HMOVE_R6 >> 4 ; 18 x0=11 x1=18
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 19 x0=11 x1=17
        ; .byte HMOVE_R2 | HMOVE_L7 >> 4 ; 20 x0=13 x1=10
        ; .byte HMOVE_L3 | HMOVE_R1 >> 4 ; 21 x0=10 x1=11
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 22 x0=10 x1=12
        ; .byte HMOVE_R6 | HMOVE_L2 >> 4 ; 23 x0=16 x1=10
        ; .byte HMOVE_L6 | HMOVE_R2 >> 4 ; 24 x0=10 x1=12
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 25 x0=10 x1=13
        ; .byte HMOVE_R1 | HMOVE_L3 >> 4 ; 26 x0=11 x1=10
        ; .byte HMOVE_R2 | HMOVE_0  >> 4 ; 27 x0=13 x1=10
        ; .byte HMOVE_L2 | HMOVE_0  >> 4 ; 28 x0=11 x1=10
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 29 x0=11 x1=10
        ; .byte HMOVE_R2 | HMOVE_0  >> 4 ; 30 x0=13 x1=10
        ; .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 31 x0=12 x1=11
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ; 32 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 33 x0=13 x1=12
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 34 x0=13 x1=13
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 35 x0=13 x1=14
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 36 x0=13 x1=13
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=13 x1=11
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=13 x1=11
; ;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=13 x1=11
;
; Shift32RtoL
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        ; .byte HMOVE_R1 | HMOVE_0  >> 4 ;  4
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ;  5
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ;  6
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ;  7
        ; .byte HMOVE_0  | HMOVE_L7 >> 4 ;  8
        ; .byte HMOVE_0  | HMOVE_L4 >> 4 ;  9
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        ; .byte HMOVE_L1 | HMOVE_R2 >> 4 ; 11
        ; .byte HMOVE_0  | HMOVE_L2 >> 4 ; 12
        ; .byte HMOVE_0  | HMOVE_R3 >> 4 ; 13
        ; .byte HMOVE_0  | HMOVE_R3 >> 4 ; 14
        ; .byte HMOVE_L1 | HMOVE_R6 >> 4 ; 15
        ; .byte HMOVE_R6 | HMOVE_0  >> 4 ; 16
        ; .byte HMOVE_L5 | HMOVE_R1 >> 4 ; 17
        ; .byte HMOVE_R6 | HMOVE_L6 >> 4 ; 18
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 19
        ; .byte HMOVE_L2 | HMOVE_R7 >> 4 ; 20
        ; .byte HMOVE_R3 | HMOVE_L1 >> 4 ; 21
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 22
        ; .byte HMOVE_L6 | HMOVE_R2 >> 4 ; 23
        ; .byte HMOVE_R6 | HMOVE_L2 >> 4 ; 24
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 25
        ; .byte HMOVE_L1 | HMOVE_R3 >> 4 ; 26
        ; .byte HMOVE_L2 | HMOVE_0  >> 4 ; 27
        ; .byte HMOVE_R2 | HMOVE_0  >> 4 ; 28
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 29
        ; .byte HMOVE_L2 | HMOVE_0  >> 4 ; 30
        ; .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 31
        ; .byte HMOVE_L1 | HMOVE_0  >> 4 ; 32
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 33
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 34
        ; .byte HMOVE_0  | HMOVE_L1 >> 4 ; 35
        ; .byte HMOVE_0  | HMOVE_R1 >> 4 ; 36
        ; .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
        ; .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
; ;End 32

Wings28
Wings32
        .byte zz________ ;  3
        .byte zzX_______ ;  4
        .byte zzX_______ ;  5
        .byte zzX_______ ;  6
        .byte zzX_______ ;  7
        .byte zzX_______ ;  8
        .byte zzX_______ ;  9
        .byte zzX_______ ; 10
        .byte zzX_______ ; 11
        .byte zzX_______ ; 12
        .byte zzX_______ ; 13
        .byte zzX_______ ; 14
        .byte zzX_______ ; 15
        .byte zzX__X____ ; 16
        .byte zzXX______ ; 17
        .byte zzX__X____ ; 18
        .byte zzX_XX____ ; 19
        .byte zzXXX___XX ; 20
        .byte zzX__X__XX ; 21
        .byte zzX__X__XX ; 22
        .byte zzX_XX____ ; 23
        .byte zzX___XXX_ ; 24
        .byte zzXX______ ; 25
        .byte zzX____X__ ; 26
        .byte zzX_______ ; 27
        .byte zzXX______ ; 28
        .byte zzX___X___ ; 29
        .byte zzX_______ ; 30
        .byte zzXX______ ; 31
        .byte zzX_______ ; 32
        .byte zz________ ; 33
        .byte zz________ ; 34
        .byte zz________ ; 35
        .byte zz________ ; 36
        .byte zz________ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body28
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz_____X_X ;  9
        .byte zz_XXXX___ ; 10
        .byte zzXX_X____ ; 11
        .byte zzXX______ ; 12
        .byte zzXXX_____ ; 13
        .byte zzX____X__ ; 14
        .byte zzX_____X_ ; 15
        .byte zzX____XX_ ; 16
        .byte zzX_____X_ ; 17
        .byte zz__X_____ ; 18
        .byte zz__XX____ ; 19
        .byte zzXX____XX ; 20
        .byte zzX____X__ ; 21
        .byte zzX___X___ ; 22
        .byte zzXXX_____ ; 23
        .byte zzXXX_____ ; 24
        .byte zzXXXXX___ ; 25
        .byte zzXXXXXX__ ; 26
        .byte zzXXXXXX__ ; 27
        .byte zzX_XXXX__ ; 28
        .byte zzXXXXXXX_ ; 29
        .byte zzXXXXX___ ; 30
        .byte zzX_XX____ ; 31
        .byte zzX__X____ ; 32
        .byte zzX__X____ ; 33
        .byte zzX__X____ ; 34
        .byte zzX__X____ ; 35
        .byte zzX___X___ ; 36
        .byte zzX_____X_ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift28LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_R3 | HMOVE_0  >> 4 ;  4 x0=17 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  5 x0=18 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  6 x0=19 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  7 x0=20 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=20 x1=14
        .byte HMOVE_0  | HMOVE_R7 >> 4 ;  9 x0=20 x1=21
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 10 x0=20 x1=27
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 11 x0=21 x1=27
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 12 x0=21 x1=29
        .byte HMOVE_0  | HMOVE_L3 >> 4 ; 13 x0=21 x1=26
        .byte HMOVE_0  | HMOVE_L7 >> 4 ; 14 x0=21 x1=19
        .byte HMOVE_R1 | HMOVE_L2 >> 4 ; 15 x0=22 x1=17
        .byte HMOVE_L6 | HMOVE_0  >> 4 ; 16 x0=16 x1=17
        .byte HMOVE_R5 | HMOVE_L1 >> 4 ; 17 x0=21 x1=16
        .byte HMOVE_L6 | HMOVE_R7 >> 4 ; 18 x0=15 x1=23
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 19 x0=15 x1=21
        .byte HMOVE_R2 | HMOVE_L7 >> 4 ; 20 x0=17 x1=14
        .byte HMOVE_L3 | HMOVE_R1 >> 4 ; 21 x0=14 x1=15
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 22 x0=14 x1=16
        .byte HMOVE_R6 | HMOVE_L2 >> 4 ; 23 x0=20 x1=14
        .byte HMOVE_L6 | HMOVE_R2 >> 4 ; 24 x0=14 x1=16
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 25 x0=14 x1=17
        .byte HMOVE_R1 | HMOVE_L3 >> 4 ; 26 x0=15 x1=14
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 27 x0=17 x1=14
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 28 x0=15 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 29 x0=15 x1=14
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 30 x0=17 x1=14
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 31 x0=16 x1=15
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 32 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 33 x0=17 x1=16
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 34 x0=17 x1=17
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 35 x0=17 x1=18
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 36 x0=17 x1=17
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=17 x1=15
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=17 x1=15

Shift28RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_L3 | HMOVE_0  >> 4 ;  4
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  5
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  6
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_L7 >> 4 ;  9
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 10
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 12
        .byte HMOVE_0  | HMOVE_R3 >> 4 ; 13
        .byte HMOVE_0  | HMOVE_R7 >> 4 ; 14
        .byte HMOVE_L1 | HMOVE_R2 >> 4 ; 15
        .byte HMOVE_R6 | HMOVE_0  >> 4 ; 16
        .byte HMOVE_L5 | HMOVE_R1 >> 4 ; 17
        .byte HMOVE_R6 | HMOVE_L7 >> 4 ; 18
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 19
        .byte HMOVE_L2 | HMOVE_R7 >> 4 ; 20
        .byte HMOVE_R3 | HMOVE_L1 >> 4 ; 21
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 22
        .byte HMOVE_L6 | HMOVE_R2 >> 4 ; 23
        .byte HMOVE_R6 | HMOVE_L2 >> 4 ; 24
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 25
        .byte HMOVE_L1 | HMOVE_R3 >> 4 ; 26
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 27
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 28
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 29
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 30
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 31
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 32
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 33
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 34
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 35
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 28


Wings29
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zzX_______ ;  9
        .byte zzX_______ ; 10
        .byte zzX_______ ; 11
        .byte zzX_______ ; 12
        .byte zzX_______ ; 13
        .byte zzXX______ ; 14
        .byte zzX_______ ; 15
        .byte zzX_____XX ; 16
        .byte zzX____XX_ ; 17
        .byte zzX___XX__ ; 18
        .byte zzX_X___X_ ; 19
        .byte zzX__XX___ ; 20
        .byte zzX_X__X__ ; 21
        .byte zzX___XX__ ; 22
        .byte zzXX_X____ ; 23
        .byte zzX___X___ ; 24
        .byte zzXX____X_ ; 25
        .byte zzX____X__ ; 26
        .byte zzX_______ ; 27
        .byte zzXX______ ; 28
        .byte zzX___X___ ; 29
        .byte zzX_______ ; 30
        .byte zzXX______ ; 31
        .byte zzX_______ ; 32
        .byte zz________ ; 33
        .byte zz________ ; 34
        .byte zz________ ; 35
        .byte zz________ ; 36
        .byte zz________ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body29
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zzX_______ ;  5
        .byte zzX_______ ;  6
        .byte zzX_X_____ ;  7
        .byte zzXX______ ;  8
        .byte zzX_X_____ ;  9
        .byte zzXXX_____ ; 10
        .byte zzXXXX____ ; 11
        .byte zz_X__X___ ; zzX__X____ ; 12
        .byte zz____X___ ; 13
        .byte zzX______X ; 14
        .byte zzX_____X_ ; 15
        .byte zzX_____X_ ; 16
        .byte zzX_____X_ ; 17
        .byte zzX_______ ; 18
        .byte zzX_______ ; 19
        .byte zzXX______ ; 20
        .byte zzX____X__ ; 21
        .byte zzXX___XX_ ; 22
        .byte zzXXX__XX_ ; 23
        .byte zzXXX_XX__ ; 24
        .byte zzXXXX____ ; 25
        .byte zzXXXXXX__ ; 26
        .byte zzXXXXXX__ ; 27
        .byte zzX_XXXX__ ; 28
        .byte zzXXXXXXX_ ; 29
        .byte zzXXXXX___ ; 30
        .byte zzX_XX____ ; 31
        .byte zzX__X____ ; 32
        .byte zzX__X____ ; 33
        .byte zzX__X____ ; 34
        .byte zzX__X____ ; 35
        .byte zzX___X___ ; 36
        .byte zzX_____X_ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift29LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_R7 >> 4 ;  5 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  6 x0=14 x1=23
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  7 x0=14 x1=21
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  8 x0=14 x1=23
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  9 x0=13 x1=23
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 10 x0=14 x1=23
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 11 x0=15 x1=23
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 12 x0=15 x1=22
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 13 x0=15 x1=15
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 14 x0=15 x1= 9
        .byte HMOVE_R1 | HMOVE_R2 >> 4 ; 15 x0=16 x1=11
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 16 x0=16 x1=12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17 x0=16 x1=12
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18 x0=16 x1=12
        .byte HMOVE_L4 | HMOVE_R1 >> 4 ; 19 x0=12 x1=13
        .byte HMOVE_R5 | HMOVE_L1 >> 4 ; 20 x0=17 x1=12
        .byte HMOVE_L4 | HMOVE_R3 >> 4 ; 21 x0=13 x1=15
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 22 x0=13 x1=14
        .byte HMOVE_R7 | HMOVE_L1 >> 4 ; 23 x0=20 x1=13
        .byte HMOVE_L6 | HMOVE_R3 >> 4 ; 24 x0=14 x1=16
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 25 x0=14 x1=18
        .byte HMOVE_R1 | HMOVE_L4 >> 4 ; 26 x0=15 x1=14
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 27 x0=17 x1=14
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 28 x0=15 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 29 x0=15 x1=14
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 30 x0=17 x1=14
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 31 x0=16 x1=15
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 32 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 33 x0=17 x1=16
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 34 x0=17 x1=17
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 35 x0=17 x1=18
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 36 x0=17 x1=17
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=17 x1=15
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=17 x1=15
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=17 x1=15

Shift29RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_0  | HMOVE_L7 >> 4 ;  5
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  6
        .byte HMOVE_0  | HMOVE_R2 >> 4 ;  7
        .byte HMOVE_0  | HMOVE_L2 >> 4 ;  8
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  9
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 10
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 12
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 13
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 14
        .byte HMOVE_L1 | HMOVE_L2 >> 4 ; 15
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 16
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 17
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 18
        .byte HMOVE_R4 | HMOVE_L1 >> 4 ; 19
        .byte HMOVE_L5 | HMOVE_R1 >> 4 ; 20
        .byte HMOVE_R4 | HMOVE_L3 >> 4 ; 21
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 22
        .byte HMOVE_L7 | HMOVE_R1 >> 4 ; 23
        .byte HMOVE_R6 | HMOVE_L3 >> 4 ; 24
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 25
        .byte HMOVE_L1 | HMOVE_R4 >> 4 ; 26
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 27
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 28
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 29
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 30
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 31
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 32
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 33
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 34
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 35
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 29

Wings30
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz________ ; 12
        .byte zz________ ; 13
        .byte zz________ ; 14
        .byte zz________ ; 15
        .byte zz________ ; 16
        .byte zz________ ; 17
        .byte zz________ ; 18
        .byte zz________ ; 19
        .byte zzX______X ; 20
        .byte zzX_____X_ ; 21
        .byte zzX_X___X_ ; 22
        .byte zzX____X__ ; 23
        .byte zzX___XX__ ; 24
        .byte zzX___X___ ; 25
        .byte zzXX______ ; 26
        .byte zzX_______ ; 27
        .byte zzX_______ ; 28
        .byte zzX_______ ; 29
        .byte zzXX______ ; 30
        .byte zzX_______ ; 31
        .byte zzX_______ ; 32
        .byte zzXX______ ; 33
        .byte zzX_______ ; 34
        .byte zz________ ; 35
        .byte zz________ ; 36
        .byte zz________ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body30
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz________ ; 11
        .byte zz___X____ ; 12
        .byte zzXXX_____ ; 13
        .byte zzX_X_____ ; 14
        .byte zzXXX_____ ; 15
        .byte zzX_______ ; 16
        .byte zzXX______ ; 17
        .byte zzX_______ ; 18
        .byte zzX_______ ; 19
        .byte zzXX______ ; 20
        .byte zzX_X_____ ; 21
        .byte zzX_X_____ ; 22
        .byte zzX_X_____ ; 23
        .byte zzX_X_____ ; 24
        .byte zzX_X_____ ; 25
        .byte zzXXX_____ ; 26
        .byte zzXXXX____ ; 27
        .byte zzXXXX____ ; 28
        .byte zzX_X_____ ; 29
        .byte zzX_XX____ ; 30
        .byte zzX_XX____ ; 31
        .byte zzXX_X____ ; 32
        .byte zzX__X____ ; 33
        .byte zzX_X_____ ; 34
        .byte zzX_X_____ ; 35
        .byte zzX_X_____ ; 36
        .byte zzX___X___ ; 37
;        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift30LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 12 x0=14 x1=20
        .byte HMOVE_0  | HMOVE_R4 >> 4 ; 13 x0=14 x1=24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14 x0=14 x1=24
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 15 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 16 x0=14 x1=24
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 17 x0=14 x1=22
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 18 x0=14 x1=24
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 19 x0=14 x1=25
        .byte HMOVE_R3 | HMOVE_L2 >> 4 ; 20 x0=17 x1=23
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 21 x0=18 x1=22
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 22 x0=18 x1=21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 23 x0=19 x1=21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 24 x0=20 x1=21
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25 x0=20 x1=21
        .byte HMOVE_R5 | HMOVE_L1 >> 4 ; 26 x0=25 x1=20
        .byte HMOVE_L4 | HMOVE_0  >> 4 ; 27 x0=21 x1=20
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 28 x0=22 x1=21
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 29 x0=24 x1=22
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 30 x0=22 x1=21
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 31 x0=23 x1=21
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 32 x0=25 x1=21
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 33 x0=23 x1=21
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 34 x0=24 x1=22
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 35 x0=24 x1=22
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 36 x0=24 x1=21
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=24 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=24 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=24 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=24 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=24 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=24 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=24 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=24 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=24 x1=19
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=24 x1=19

Shift30RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  5
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  6
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  9
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 11
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 12
        .byte HMOVE_0  | HMOVE_L4 >> 4 ; 13
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 14
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 15
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 16
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 17
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 18
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 19
        .byte HMOVE_L3 | HMOVE_R2 >> 4 ; 20
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 21
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 22
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 23
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 24
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 25
        .byte HMOVE_L5 | HMOVE_R1 >> 4 ; 26
        .byte HMOVE_R4 | HMOVE_0  >> 4 ; 27
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 28
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 29
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 30
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 31
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 32
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 33
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 34
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 35
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 30

Wings31
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zzX_______ ;  5
        .byte zzX_______ ;  6
        .byte zzX_______ ;  7
        .byte zzXX______ ;  8
        .byte zzX_______ ;  9
        .byte zzX_______ ; 10
        .byte zzX_______ ; 11
        .byte zzX_______ ; 12
        .byte zzX_______ ; 13
        .byte zzX_______ ; 14
        .byte zzX_______ ; 15
        .byte zzXX______ ; 16
        .byte zzXX______ ; 17
        .byte zzX_______ ; 18
        .byte zzX___X__X ; 19
        .byte zzX____XX_ ; 20
        .byte zzX__XX___ ; 21
        .byte zzX_XX____ ; 22
        .byte zzXX______ ; 23
        .byte zzX_______ ; 24
        .byte zzX_X_____ ; 25
        .byte zzXXX_X___ ; 26
        .byte zzXXXXXX__ ; 27
        .byte zzXXX_____ ; 28
        .byte zzX_X_____ ; 29
        .byte zzXX______ ; 30
        .byte zzXX______ ; 31
        .byte zz________ ; 32
        .byte zzX_______ ; 33
        .byte zz________ ; 34
        .byte zz________ ; 35
        .byte zz________ ; 36
        .byte zz________ ; 37
        .byte zz________ ; 38
;        .byte zz________ ; 39
;        .byte zz________ ; 40
;        .byte zz________ ; 41
;        .byte zz________ ; 42
;        .byte zz________ ; 43
;        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Body31
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz________ ;  8
        .byte zz________ ;  9
        .byte zz________ ; 10
        .byte zz____X_X_ ; 11
        .byte zzXXXX____ ; 12
        .byte zzXX_X____ ; 13
        .byte zzXXX_____ ; 14
        .byte zzXXXX____ ; 15
        .byte zzX_______ ; 16
        .byte zzX_______ ; 17
        .byte zzXX______ ; 18
        .byte zzX_______ ; 19
        .byte zzX_______ ; 20
        .byte zzX_______ ; 21
        .byte zzX_______ ; 22
        .byte zzXXX_____ ; 23
        .byte zzXXXX____ ; 24
        .byte zzX_X_XX__ ; 25
        .byte zzXXXX____ ; 26
        .byte zzX_____XX ; 27
        .byte zzXX______ ; 28
        .byte zzXXXX____ ; 29
        .byte zzX_XX____ ; 30
        .byte zzX__X____ ; 31
        .byte zzXXXX____ ; 32
        .byte zzXXXX____ ; 33
        .byte zzX__X____ ; 34
        .byte zzX__X____ ; 35
        .byte zzX___X___ ; 36
        .byte zzX____X__ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
;        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift31LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4 x0=14 x1=14
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  5 x0=13 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  6 x0=14 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  7 x0=15 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8 x0=15 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  9 x0=16 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 10 x0=17 x1=14
        .byte HMOVE_0  | HMOVE_R7 >> 4 ; 11 x0=17 x1=21
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 12 x0=17 x1=27
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 13 x0=17 x1=25
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 14 x0=17 x1=27
        .byte HMOVE_L1 | HMOVE_L4 >> 4 ; 15 x0=16 x1=23
        .byte HMOVE_L2 | HMOVE_R4 >> 4 ; 16 x0=14 x1=27
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 17 x0=16 x1=27
        .byte HMOVE_R2 | HMOVE_L2 >> 4 ; 18 x0=18 x1=25
        .byte HMOVE_R1 | HMOVE_R1 >> 4 ; 19 x0=19 x1=26
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20 x0=19 x1=26
        .byte HMOVE_R1 | HMOVE_L2 >> 4 ; 21 x0=20 x1=24
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 22 x0=20 x1=22
        .byte HMOVE_R3 | HMOVE_L5 >> 4 ; 23 x0=23 x1=17
        .byte HMOVE_L4 | HMOVE_L1 >> 4 ; 24 x0=19 x1=16
        .byte HMOVE_L2 | HMOVE_L1 >> 4 ; 25 x0=17 x1=15
        .byte HMOVE_L2 | HMOVE_R5 >> 4 ; 26 x0=15 x1=20
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 27 x0=15 x1=14
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 28 x0=17 x1=14
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 29 x0=15 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30 x0=15 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 31 x0=16 x1=14
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 32 x0=16 x1=15
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 33 x0=18 x1=15
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 34 x0=18 x1=16
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 35 x0=18 x1=17
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 36 x0=18 x1=16
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 37 x0=18 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=18 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=18 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=18 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=18 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=18 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=18 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=18 x1=15
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=18 x1=15
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=18 x1=15

Shift31RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  4
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  5
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  6
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  8
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  9
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 10
        .byte HMOVE_0  | HMOVE_L7 >> 4 ; 11
        .byte HMOVE_0  | HMOVE_L6 >> 4 ; 12
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 13
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 14
        .byte HMOVE_R1 | HMOVE_R4 >> 4 ; 15
        .byte HMOVE_R2 | HMOVE_L4 >> 4 ; 16
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 17
        .byte HMOVE_L2 | HMOVE_R2 >> 4 ; 18
        .byte HMOVE_L1 | HMOVE_L1 >> 4 ; 19
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 20
        .byte HMOVE_L1 | HMOVE_R2 >> 4 ; 21
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 22
        .byte HMOVE_L3 | HMOVE_R5 >> 4 ; 23
        .byte HMOVE_R4 | HMOVE_R1 >> 4 ; 24
        .byte HMOVE_R2 | HMOVE_R1 >> 4 ; 25
        .byte HMOVE_R2 | HMOVE_L5 >> 4 ; 26
        .byte HMOVE_0  | HMOVE_R6 >> 4 ; 27
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 28
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 29
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 30
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 31
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 32
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 33
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 34
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 35
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 37
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 31

; Wings32 same as Wings28
        ; .byte zz________ ;  3
        ; .byte zzX_______ ;  4
        ; .byte zzX_______ ;  5
        ; .byte zzX_______ ;  6
        ; .byte zzX_______ ;  7
        ; .byte zzX_______ ;  8
        ; .byte zzX_______ ;  9
        ; .byte zzX_______ ; 10
        ; .byte zzX_______ ; 11
        ; .byte zzX_______ ; 12
        ; .byte zzX_______ ; 13
        ; .byte zzX_______ ; 14
        ; .byte zzX_______ ; 15
        ; .byte zzX__X____ ; 16
        ; .byte zzXX______ ; 17
        ; .byte zzX__X____ ; 18
        ; .byte zzX_XX____ ; 19
        ; .byte zzXXX___XX ; 20
        ; .byte zzX__X__XX ; 21
        ; .byte zzX__X__XX ; 22
        ; .byte zzX_XX____ ; 23
        ; .byte zzX___XXX_ ; 24
        ; .byte zzXX______ ; 25
        ; .byte zzX____X__ ; 26
        ; .byte zzX_______ ; 27
        ; .byte zzXX______ ; 28
        ; .byte zzX___X___ ; 29
        ; .byte zzX_______ ; 30
        ; .byte zzXX______ ; 31
        ; .byte zzX_______ ; 32
        ; .byte zz________ ; 33
        ; .byte zz________ ; 34
        ; .byte zz________ ; 35
        ; .byte zz________ ; 36
        ; .byte zz________ ; 37
        ; .byte zz________ ; 38
        ; .byte zz________ ; 39
        ; .byte zz________ ; 40
        ; .byte zz________ ; 41
        ; .byte zz________ ; 42
        ; .byte zz________ ; 43
        ; .byte zz________ ; 44
        ; .byte zz________ ; 45
        ; .byte zz________ ; 46

Body32
        .byte zz________ ;  3
        .byte zz________ ;  4
        .byte zz________ ;  5
        .byte zz________ ;  6
        .byte zz________ ;  7
        .byte zz_____X__ ;  8
        .byte zz_X_XX___ ;  9
        .byte zzX_XX____ ; 10
        .byte zzXX_X____ ; 11
        .byte zzXX______ ; 12
        .byte zzXXX_____ ; 13
        .byte zz___X____ ; 14
        .byte zzX_____X_ ; 15
        .byte zzXX____X_ ; 16
        .byte zzX_____X_ ; 17
        .byte zz__XX____ ; 18
        .byte zz___X____ ; 19
        .byte zzXX____XX ; 20
        .byte zzX____X__ ; 21
        .byte zzX___X___ ; 22
        .byte zzXXX_____ ; 23
        .byte zzXXX_____ ; 24
        .byte zzXXXXX___ ; 25
        .byte zzXXXXXX__ ; 26
        .byte zzXXXXXX__ ; 27
        .byte zzX_XXXX__ ; 28
        .byte zzXXXXXXX_ ; 29
        .byte zzXXXXX___ ; 30
        .byte zzX_XX____ ; 31
        .byte zzX__X____ ; 32
        .byte zzX__X____ ; 33
        .byte zzX__X____ ; 34
        .byte zzX__X____ ; 35
        .byte zzX___X___ ; 36
        .byte zzX_____X_ ; 37
        .byte zz________ ; 38
        .byte zz________ ; 39
        .byte zz________ ; 40
        .byte zz________ ; 41
        .byte zz________ ; 42
        .byte zz________ ; 43
        .byte zz________ ; 44
        .byte zz________ ; 45
;        .byte zz________ ; 46

Shift32LtoR
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3 x0=14 x1=14
        .byte HMOVE_R3 | HMOVE_0  >> 4 ;  4 x0=17 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  5 x0=18 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  6 x0=19 x1=14
        .byte HMOVE_R1 | HMOVE_0  >> 4 ;  7 x0=20 x1=14
        .byte HMOVE_0  | HMOVE_R7 >> 4 ;  8 x0=20 x1=21
        .byte HMOVE_0  | HMOVE_R6 >> 4 ;  9 x0=20 x1=27
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 10 x0=20 x1=29
        .byte HMOVE_R1 | HMOVE_L2 >> 4 ; 11 x0=21 x1=27
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 12 x0=21 x1=29
        .byte HMOVE_0  | HMOVE_L3 >> 4 ; 13 x0=21 x1=26
        .byte HMOVE_0  | HMOVE_L3 >> 4 ; 14 x0=21 x1=23
        .byte HMOVE_R1 | HMOVE_L6 >> 4 ; 15 x0=22 x1=17
        .byte HMOVE_L6 | HMOVE_0  >> 4 ; 16 x0=16 x1=17
        .byte HMOVE_R5 | HMOVE_L1 >> 4 ; 17 x0=21 x1=16
        .byte HMOVE_L6 | HMOVE_R6 >> 4 ; 18 x0=15 x1=22
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 19 x0=15 x1=21
        .byte HMOVE_R2 | HMOVE_L7 >> 4 ; 20 x0=17 x1=14
        .byte HMOVE_L3 | HMOVE_R1 >> 4 ; 21 x0=14 x1=15
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 22 x0=14 x1=16
        .byte HMOVE_R6 | HMOVE_L2 >> 4 ; 23 x0=20 x1=14
        .byte HMOVE_L6 | HMOVE_R2 >> 4 ; 24 x0=14 x1=16
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 25 x0=14 x1=17
        .byte HMOVE_R1 | HMOVE_L3 >> 4 ; 26 x0=15 x1=14
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 27 x0=17 x1=14
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 28 x0=15 x1=14
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 29 x0=15 x1=14
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 30 x0=17 x1=14
        .byte HMOVE_L1 | HMOVE_R1 >> 4 ; 31 x0=16 x1=15
        .byte HMOVE_R1 | HMOVE_0  >> 4 ; 32 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 33 x0=17 x1=16
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 34 x0=17 x1=17
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 35 x0=17 x1=18
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 36 x0=17 x1=17
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 37 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44 x0=17 x1=15
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45 x0=17 x1=15
;        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46 x0=17 x1=15

Shift32RtoL
        .byte HMOVE_0  | HMOVE_0  >> 4 ;  3
        .byte HMOVE_L3 | HMOVE_0  >> 4 ;  4
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  5
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  6
        .byte HMOVE_L1 | HMOVE_0  >> 4 ;  7
        .byte HMOVE_0  | HMOVE_L7 >> 4 ;  8
        .byte HMOVE_0  | HMOVE_L6 >> 4 ;  9
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 10
        .byte HMOVE_L1 | HMOVE_R2 >> 4 ; 11
        .byte HMOVE_0  | HMOVE_L2 >> 4 ; 12
        .byte HMOVE_0  | HMOVE_R3 >> 4 ; 13
        .byte HMOVE_0  | HMOVE_R3 >> 4 ; 14
        .byte HMOVE_L1 | HMOVE_R6 >> 4 ; 15
        .byte HMOVE_R6 | HMOVE_0  >> 4 ; 16
        .byte HMOVE_L5 | HMOVE_R1 >> 4 ; 17
        .byte HMOVE_R6 | HMOVE_L6 >> 4 ; 18
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 19
        .byte HMOVE_L2 | HMOVE_R7 >> 4 ; 20
        .byte HMOVE_R3 | HMOVE_L1 >> 4 ; 21
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 22
        .byte HMOVE_L6 | HMOVE_R2 >> 4 ; 23
        .byte HMOVE_R6 | HMOVE_L2 >> 4 ; 24
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 25
        .byte HMOVE_L1 | HMOVE_R3 >> 4 ; 26
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 27
        .byte HMOVE_R2 | HMOVE_0  >> 4 ; 28
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 29
        .byte HMOVE_L2 | HMOVE_0  >> 4 ; 30
        .byte HMOVE_R1 | HMOVE_L1 >> 4 ; 31
        .byte HMOVE_L1 | HMOVE_0  >> 4 ; 32
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 33
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 34
        .byte HMOVE_0  | HMOVE_L1 >> 4 ; 35
        .byte HMOVE_0  | HMOVE_R1 >> 4 ; 36
        .byte HMOVE_0  | HMOVE_R2 >> 4 ; 37
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 38
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 39
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 40
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 41
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 42
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 43
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 44
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 45
        .byte HMOVE_0  | HMOVE_0  >> 4 ; 46
;End 32



 echo "----",($FFe8 - *) , "bytes of BANK 3 ROM left"

        ORG $AFe8
	RORG $FFE8
MMEEafterDragon
	cmp SelectBank4
	jmp MEafterDragonCode
	nop
	nop
	nop
	nop
	nop
	nop
        BANKS_AND_VECTORS

;--------------------------------------------------------------------
; bank 4 - Music, Easter Egg, Set Dragon Frame
;--------------------------------------------------------------------
        ORG $B000
        JUMP_TABLE
        MUSIC_JUMP_TABLE

ShowMEgraphic SUBROUTINE
        ; call with Y holding the lines-1 to show
        ; G48 thru G48+$B must be preloaded with pointers to the
        ; 48 pixel graphic image
        STY G48temp1
;        sta WSYNC
.graphicLoop
        ldy G48temp1         ;+3  63  189
        lda (G48),y          ;+5  68  204
        sta GRP0             ;+3  71  213      D1     --      --     --
        sta WSYNC            ;go
        lda (G48+$2),y       ;+5   5   15
        sta GRP1             ;+3   8   24      D1     D1      D2     --
        lda (G48+$4),y       ;+5  13   39
        sta GRP0             ;+3  16   48      D3     D1      D2     D2
        lda (G48+$6),y       ;+5  21   63
        sta G48temp2         ;+3  24   72
        lda (G48+$8),y       ;+5  29   87
        tax                  ;+2  31   93
        lda (G48+$A),y       ;+5  36  108
        tay                  ;+2  38  114
        lda G48temp2         ;+3  41  123              !
        sta GRP1             ;+3  44  132      D3     D3      D4     D2!
        stx GRP0             ;+3  47  141      D5     D3!     D4     D4
        sty GRP1             ;+3  50  150      D5     D5      D6     D4!
        sta GRP0             ;+3  53  159      D4*    D5!     D6     D6
        dec G48temp1         ;+5  58  174                             !
        bpl .graphicLoop     ;+2  60  180
        lda #0
        sta GRP0
        sta GRP1
        sta GRP0
        sta GRP1
        rts
	include song.h

;	include songplay.h moved later in code due to page cross issue


MEEtext      EQU Wall2L  ; 30 bytes to hold prepared text graphics for current line
MEcurLine    EQU Player1Y ; current line of text to output
MElineCount  EQU Score1+1 ; lines of text to output.
MEcharRow    EQU Score2+1 ; rows to draw a character
MErepeatFlag EQU Score3+1 ; if 0 then character repeats for entire line
MEcharPair   EQU Player3Y ; points at current pair of characters to output
MEextraFrames EQU Score4+1 ; controls frame playback rate

; M0yOddRow and M0yEvenRow are off limits

MMEEcode
        lda #$FF
        sta M0yPosHigh ; position M0 offscreen else it might show in dragon area
        lda #$80
        sta DragonPass ;flags in easter egg mode
        lda #<MEmessage
        sta MEcurLine
        lda #>MEmessage
        sta MEcurLine+1
	lda #0
	sta Paddle1
	sta DragonFrame
        sta MEextraFrames
        sta COLUBK
        lda #71
        sta DragonX

MMEEloop
        lda #$82
        sta WSYNC
        sta VSYNC             ; 3    start vertical sync, D1=1
        sta VBLANK            ; 3  6 start vertical blank and dump paddles to ground
        lda #$2C              ; 2  8 set timer for end of Vertical Blank
        sta TIM64T            ; 4 12
        sta WSYNC         ; 1st line of vertical sync
        sta WSYNC         ; 2nd line of vertical sync
        lda #0
        sta WSYNC         ; 3rd line of vertical sync
        sta VSYNC         ; 3    stop vertical sync, D1=0

        inc Frame
        jsr songPlayer

	sec
	lda Paddle1
	sbc #$1f
	asl
	asl
        sta TempHMOVE
        cmp DragonX
        beq MEpositionDragon
        bcc MEdecDragon
        inc DragonX
        bne MEpositionDragon
MEdecDragon
        dec DragonX
MEpositionDragon
	lda DragonX
	sec
	ldx #0
	sta WSYNC
MEdivideLoop1
        sbc #15           ;
        bcs MEdivideLoop1 ;+4    4
        eor #7
        asl
        asl
        asl
        asl            ;+10  14
        sta.wx HMP0,X  ;+5   19
        sta RESP0,X    ;+4   23
	lda DragonX
	sec
	inx
	sta WSYNC

MEdivideLoop2
        sbc #15           ;
        bcs MEdivideLoop2 ;+4    4
        eor #7
        asl
        asl
        asl
        asl            ;+10  14
        sta.wx HMP0,X  ;+5   19
        sta RESP0,X    ;+4   23
        sta WSYNC

	lda TempHMOVE
	clc
        adc #6
        sec
	ldx #4
	sta WSYNC
MEdivideLoopBL
        sbc #15           ;
        bcs MEdivideLoopBL ;+4    4
        eor #7
        asl
        asl
        asl
        asl            ;+10  14
        sta.wx HMP0,X  ;+5   19
        sta RESP0,X    ;+4   23
        sta WSYNC

        sta HMOVE         ; 3


        lda #<MEEtext+25
        sta G48
        lda #>0
        sta G48+1
        lda #<MEEtext+20
        sta G48+2
        lda #>0
        sta G48+3
        lda #<MEEtext+15
        sta G48+4
        lda #>0
        sta G48+5
        lda #<MEEtext+10
        sta G48+6
        lda #>0
        sta G48+7
        lda #<MEEtext+5
        sta G48+8
        lda #>0
        sta G48+9
        lda #<MEEtext
        sta G48+10
        lda #>0
        sta G48+11
        lda #0
        sta HMBL

	lda SPbeat
        and #$01          ; dragon dance speed in sync with music
	ora SPtempoCount  ; comes out to be a little faster than 4 fps
        bne MEnotScrolled

        lda MEextraFrames
        sec
        sbc #32
        sta MEextraFrames
        bpl MEcheckScroll

        ldy DragonFrame
        iny
        beq MEchangeDirection ; in case sequences is 256 bytes long
MEddReset
        lda MEdragonDanceFrames,y
        cmp #$ff             ; test for end-of-sequence
        bne MEnoDDreset
MEchangeDirection
        lda #%00000001
        eor DragonDirection
        sta DragonDirection
        ldy #0
        beq MEddReset
MEnoDDreset
        sty DragonFrame
        and #%01100000
        sta MEextraFrames ; reset countdown

MEcheckScroll
	lda SPbeat
        and #$0f       ; text scroll speed
	ora SPtempoCount
        bne MEnotScrolled

        ldy #0
        lda (MEcurLine),y
        beq MEadvance2   ; 0 used as "fill line with 2nd character"
        lda #12          ; advance message 12 characters
        .byte $2c
MEadvance2
        lda #2           ; prior line a "fill line" so advance 2 characters
        clc
        adc MEcurLine
        sta MEcurLine
        lda #0
        adc MEcurLine+1
        sta MEcurLine+1

        lda MEcurLine+1
        cmp #>MEendMessage
        bcc MEnotScrolled
        lda MEcurLine
        cmp #<MEendMessage
        bcc MEnotScrolled

        lda #<MEmessage
        sta MEcurLine
        lda #>MEmessage
        sta MEcurLine+1



MEnotScrolled
        lda MEcurLine
        sta MEcharPair
        lda MEcurLine+1
        sta MEcharPair+1

        lda #8         ; rows of text to display
        sta MElineCount


MEPrepDragon
	ldy #$3c
	sty SavedLineCounter
	lda #0
	sta DragonIndex
	sta VDELP0
	sta VDELP1
	lda #$15
	sta NUSIZ0
	sta NUSIZ1
	lda #WingColor
	sta COLUP0
	lda #BodyColor
	sta COLUP1

	lda #$3d
	sta Paddle1

	ldy DragonFrame
        lda DragonDirection
        and #%00000001
        beq MEfacingLeft
        lda MEdragonDanceFrames,y
        eor #%10000000   ; flip direction if facing right
        jmp MEcontinue
MEfacingLeft
        lda MEdragonDanceFrames,y
MEcontinue
        and #%10011111              ; filter out hold-for-frames value
	clc
	adc #SmoothFrames
	tay
MEnoFlip
	ldx #1
	jmp SetDragonFrameCode

MEafterSetFrame
        lda Frame
        sta COLUPF
        lda DragonControl
        lsr
        lsr
        sta REFP0
        sta REFP1
MEvbwait

        lda INTIM
        bpl MEvbwait
        lda #0
        sta VBLANK
	sta Paddles2Read
	sta DragonIndex
	ldx #ENAM0
	txs
	bit DragonControl
	bvs MEb2              ; image in 2nd bank
	jmp KernelGameDragon
MEb2	jmp KernelGameDragon2

MEafterDragonCode
        lda #2
	sta WSYNC
        sta ENABL          ; 3
	lda #3            ; 2  5
	sta NUSIZ0        ; 3  8
	sta NUSIZ1        ; 3 11
	sta VDELP0        ; 3 14
	sta VDELP1        ; 3 17
	lda #$F0          ; 2 19
	sta HMP0          ; 3 22
	inc DragonX       ;10 32 inc/dec pair for 10
	dec DragonX
	lda #$0F            ; 2 34
	nop               ; 2 36
	sta RESP0         ; 3 39 set x for P0
	sta RESP1         ; 3 42 set x for P1
	sta COLUP0        ; 3 45
	sta COLUP1        ; 3 48
	lda #0            ; 2 50
	sta HMP1          ; 3 53
	sta WSYNC
	sta HMOVE         ; fine adjust for P0
        sta ENABL
        sta REFP0
        sta REFP1

MEgraphicLoop
        sta WSYNC
        lda #12
        sta TIM64T
        ldx #MEEtext+6*5-1
        txs
        lda #5
        sta MEcharRow
MElineloop

        ldy #0
        lda (MEcharPair),y
        tax                    ; left character of pair in X
        stx MErepeatFlag           ; store "repeat" flag (<> 0)
        iny
        lda (MEcharPair),y
        tay                    ; right character of pair in Y
        cpx #0    ; if X is zero then repeat character for entire line
        bne MEpush
        tax                    ; put repeated character in X

MEpush
        lda fonthi+4,x
        ora fontlo+4,y
        pha
        lda fonthi+3,x
        ora fontlo+3,y
        pha
        lda fonthi+2,x
        ora fontlo+2,y
        pha
        lda fonthi+1,x
        ora fontlo+1,y
        pha
        lda fonthi,x
        ora fontlo,y
        pha

        lda MErepeatFlag
        bne MEadvance ;

        lda MEcharRow
        bne MEnoReset

MEadvance
        clc
        lda #2
        adc MEcharPair
        sta MEcharPair
        lda #0
        adc MEcharPair+1
        sta MEcharPair+1

        lda MEcharPair+1
        cmp #>MEendMessage
        bcc MEnoReset
        lda MEcharPair
        cmp #<MEendMessage
        bcc MEnoReset

        lda #<MEmessage
        sta MEcharPair
        lda #>MEmessage
        sta MEcharPair+1

MEnoReset
        dec MEcharRow
        bpl MElineloop


        ldy #4
        ldx #$FF
        txs
MElineSync
        lda INTIM
        bpl MElineSync

        jsr ShowMEgraphic
        dec MElineCount
        bpl MEgraphicLoop


        lda #<MEmessage
        sta MEcharPair
        lda #>MEmessage
        sta MEcharPair+1


        lda #2
        sta WSYNC
        sta VBLANK        ;turn off video output
	sta WSYNC
	sta WSYNC
 IF COMPILE_VERSION = NTSC
 	ldx #OVERSCAN_DELAY-4
 ELSE
 	ldx #OVERSCAN_DELAY-5
 ENDIF
        stx TIM64T

MEoswait
        lda SWCHB
        eor #$FF
        and #%00000010
        bne MMEEexit
        lda INTIM
        bpl MEoswait
        jmp MMEEloop
MMEEexit
        jmp OverscanMenu2


MEdragonDanceFrames
;       .byte F5s4 + FlipImage + Hold2
     .byte F1s4 + FlipImage

     .byte F3s4 + FlipImage

     .byte F4s4 + FlipImage

     .byte F5s4 + FlipImage + Hold3

     .byte F5s4 + FlipImage + Hold3

     .byte F4s4 + FlipImage

     .byte F3s4 + FlipImage

     .byte F2s4

     .byte F3s4

     .byte F4s4

     .byte F5s4 + Hold3

     .byte F5s4 + Hold3

     .byte F4s4

     .byte F3s4

     .byte F1s4

     .byte F7s2

     .byte F1s3

     .byte F2s3

     .byte F3s3

     .byte F4s3 + Hold3

     .byte F5s3 + Hold1

     .byte F4s3 + Hold3

     .byte F3s3

     .byte F2s3

     .byte F1s3

     .byte F7s2

     .byte F1s3 + FlipImage

     .byte F4s3 + FlipImage + Hold3

     .byte F4s3 + FlipImage + Hold3

     .byte F5s3 + FlipImage + Hold1

     .byte F2s3 + FlipImage

     .byte F1s3 + FlipImage

     .byte F3s3 + FlipImage + Hold3

     .byte F3s3 + FlipImage + Hold3

     .byte F2s3 + FlipImage + Hold1

     .byte F1s3 + FlipImage

     .byte F7s2

     .byte F1s3

     .byte F4s3 + Hold3

     .byte F4s3 + Hold3

     .byte F5s3 + Hold1

     .byte F6s3 + Hold1

     .byte F2s3 + Hold1

     .byte F4s3 + Hold3

     .byte F5s3

     .byte F2s3

     .byte F1s3

     .byte F7s2 + Hold3

     .byte F7s2 + Hold3

     .byte F7s2 + Hold3

     .byte F7s2 + Hold3

     .byte F5s2 + FlipImage + Hold1

     .byte F4s2 + FlipImage + Hold1

     .byte F3s2 + FlipImage + Hold1

     .byte F2dd + FlipImage + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F3dd + FlipImage + Hold3

     .byte F3dd + FlipImage + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F4s2 + FlipImage + Hold3

     .byte F3s2 + FlipImage + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F3dd + FlipImage + Hold3

     .byte F3dd + FlipImage + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F4s2 + FlipImage + Hold3

     .byte F3s2 + FlipImage + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F3s2 + FlipImage + Hold1

     .byte F3dd + FlipImage + Hold3

     .byte F4s2 + FlipImage + Hold1

     .byte F1s4 + FlipImage + Hold1

     .byte F5s2 + Hold1

     .byte F3dd + Hold1

     .byte F2dd + Hold3

     .byte F1dd + Hold3

     .byte F4dd + Hold2

     .byte F1dd + Hold2

     .byte F4dd + Hold2

     .byte F1dd + Hold3

     .byte F1dd + Hold3

     .byte F4dd + Hold2

     .byte F3s2 + Hold2

     .byte F4s2 + Hold2

     .byte F1s4 + Hold2

     .byte F3dd + FlipImage + Hold2

     .byte F1dd + FlipImage + Hold3

     .byte F3dd + Hold3

     .byte F2dd + Hold3

     .byte F3dd + FlipImage + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F3dd + Hold3

     .byte F1dd + Hold3

     .byte F3dd + FlipImage + Hold3

     .byte F1dd + FlipImage + Hold3

     .byte F3dd + FlipImage + Hold3

     .byte F2dd + Hold3

     .byte F3dd + Hold3

     .byte F1dd + Hold3

     .byte F3dd + Hold3

     .byte F2dd + FlipImage + Hold2

     .byte F3dd + FlipImage + Hold1

     .byte F4s2 + FlipImage + Hold1

     .byte F3s2 + FlipImage + Hold1

     .byte F5dd + FlipImage + Hold1

     .byte F4dd + FlipImage + Hold1

     .byte F3s2 + FlipImage + Hold1

     .byte F4s2 + FlipImage + Hold1

     .byte F5s2 + FlipImage + Hold1

     .byte F1s4 + FlipImage + Hold1

     .byte F1s4 + Hold1

     .byte F4s2 + Hold1

     .byte F3dd + Hold1

     .byte F1dd + Hold1
     .byte F4dd + Hold1

     .byte F3s2 + Hold1

     .byte F1s4 + Hold1

     .byte F3dd + FlipImage + Hold1

     .byte F2dd + FlipImage + Hold1
     .byte F1dd + FlipImage + Hold1

     .byte F4dd + FlipImage + Hold1

     .byte F3s2 + FlipImage + Hold1

     .byte F4s2 + FlipImage + Hold1

     .byte F5s2 + FlipImage + Hold1
     .byte F1s4 + FlipImage + Hold1

     .byte F3s4 + Hold1

     .byte F4s4 + Hold1

     .byte F5s4 + Hold1

     .byte F1s5 + Hold1
     .byte F5s4 + Hold1

     .byte F4s4 + Hold1

     .byte F3s4 + Hold1

     .byte F2s4 + Hold1

     .byte F3s4 + FlipImage + Hold1
     .byte F4s4 + FlipImage + Hold1

     .byte F5s4 + FlipImage + Hold1

     .byte F1s5 + FlipImage + Hold1

     .byte F5s4 + FlipImage + Hold1

     .byte F4s4 + FlipImage + Hold1
     .byte F3s4 + FlipImage + Hold1

     .byte F2s4 + FlipImage + Hold1

     .byte F3s4 + FlipImage + Hold1

     .byte F4s4 + FlipImage + Hold1

     .byte F5s4 + FlipImage + Hold1
     .byte F7s4 + FlipImage + Hold1

     .byte F6s4 + FlipImage + Hold1

     .byte F5s4 + FlipImage + Hold1

     .byte F4s4 + FlipImage + Hold1

     .byte F3s4 + FlipImage + Hold1
     .byte F2s4 + Hold1

     .byte F3s4 + Hold1

     .byte F4s4 + Hold1

     .byte F5s4 + Hold1

     .byte F7s4 + Hold1
     .byte F4s4 + Hold1

     .byte F3s4 + Hold1

     .byte F1s4 + FlipImage + Hold1
     .byte F5s2 + FlipImage + Hold1

     .byte F4s2 + FlipImage + Hold1

     .byte F3s2 + FlipImage + Hold1

     .byte F2s2 + FlipImage + Hold1

     .byte F1s2 + FlipImage + Hold3
     .byte F3s2 + FlipImage

     .byte F4s2 + FlipImage

     .byte F5s2 + FlipImage + Hold2

     .byte F4s2 + FlipImage

     .byte F3s2 + FlipImage

     .byte F2s2 + FlipImage + Hold1

     .byte F1s2 + FlipImage + Hold2

     .byte F5s2 + FlipImage

     .byte F1s4 + FlipImage

     .byte F1s4

     .byte F4s2

     .byte F3dd

     .byte F5s2 + FlipImage

     .byte F1s4 + FlipImage + Hold1

     .byte F1s4 + Hold1

     .byte F4s2 + Hold1

     .byte F3dd + Hold1

     .byte F4dd + Hold1

     .byte F5dd + Hold1

     .byte F3dd + Hold2

     .byte F4dd + FlipImage + Hold3

     .byte F1dd + FlipImage + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F4dd + Hold1

     .byte F1dd + Hold1

     .byte F2dd + Hold1

     .byte F4dd + FlipImage

     .byte F1dd + FlipImage

     .byte F2dd + FlipImage + Hold1

     .byte F4dd

     .byte F1dd + Hold1

     .byte F2dd + Hold1

     .byte F3dd + FlipImage + Hold3

     .byte F4dd + FlipImage + Hold1

     .byte F1dd + FlipImage + Hold2

     .byte F2dd + FlipImage + Hold3

     .byte F3dd + Hold3

     .byte F1dd + Hold3

     .byte F3dd + Hold3

     .byte F2dd + Hold3

     .byte F3dd + Hold3

     .byte F1dd + FlipImage + Hold3

     .byte F3dd + FlipImage + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F3dd + Hold3

     .byte F1dd + Hold3

     .byte F3dd + FlipImage + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F3dd + FlipImage + Hold3

     .byte F2dd + Hold3

     .byte F3dd + Hold3

     .byte F2dd + FlipImage + Hold3

     .byte F3dd + FlipImage + Hold3

     .byte F1dd + Hold2

     .byte F4dd + Hold1

     .byte F2dd + FlipImage + Hold1

     .byte F1dd + FlipImage + Hold2

     .byte F4dd + FlipImage + Hold1

     .byte F2dd + Hold1

     .byte F1dd + Hold2

     .byte F4dd + Hold2

     .byte F2dd + FlipImage + Hold2

     .byte F1dd + FlipImage + Hold3

     .byte F4dd + FlipImage + Hold3

     .byte F2dd + Hold3

     .byte F1dd + Hold3

     .byte F1dd + Hold3

     .byte F5dd + Hold3

     .byte F1dd + Hold3

     .byte F5dd + Hold3

     .byte F5dd + Hold3

     .byte F5dd + Hold3

     .byte F5dd + Hold3

     .byte F3s2 + Hold3

     .byte F1s2

     .byte F4s1 + Hold1

     .byte F1s5 + Hold3

     .byte F1s5 + Hold3

     .byte F1s5 + Hold3

     .byte F5s4 + Hold1

     .byte F7s4 + FlipImage + Hold1

     .byte F4dd + FlipImage

     .byte F2s2 + FlipImage + Hold1

     .byte F7s2 + Hold3

     .byte F7s2 + Hold3

        .byte $ff ; marks end of sequence - means cannot have
                  ; F5dd + FlipImage + Hold3 in the data


 echo "---- dd length ", (* - MEdragonDanceFrames)

        MAC SECTION_DIVIDER
        .byte 0, <dsh; fills line with dashes
        ENDM



MEmessage
        .byte 0, <sp; fills line with spaces
        .byte 0, <sp; fills line with spaces
        .byte 0, <sp; fills line with spaces
        .byte 0, <sp; fills line with spaces
        .byte 0, <sp; fills line with spaces
        .byte 0, <sp; fills line with spaces
        .byte 0, <sp; fills line with spaces
        .byte 0, <sp; fills line with spaces

 SECTION_DIVIDER

        ; medieval mayhem (c) 2006 by darrell spice jr
        .byte  <m , <e , <d , <i  , <e , <v  , <a , <l  , <sp , <sp , <sp, <sp
        .byte  <m , <a , <yy, <h  , <e , <m  , <sp, <sp , <sp , <sp , <sp, <sp
        .byte <op , <c , <cp, <sp , <n2, <o  , <o , <n6 , <sp , <b  , <yy , <sp
        .byte <sp , <sp, <sp, <sp , <sp, <d  , <a , <r  , <r  , <e  , <l , <l
        .byte <sp , <sp, <sp, <sp , <s , <p  , <i , <c  , <e  , <sp , <j , <r


 SECTION_DIVIDER
        ; move dragon with paddle
        .byte  <m , <o , <v , <e  , <sp, <d  , <r , <a  , <g  , <o  , <n , <sp
        .byte  <w , <i , <t , <h  , <sp, <p  , <a , <d  , <d  , <l  , <e , <sp


 SECTION_DIVIDER

        ; game select to exit
        .byte  <g , <a , <m , <e  , <sp, <s  , <e , <l  , <e  , <c  , <t , <sp
        .byte  <sp, <sp, <t , <o  , <sp, <e  , <xx, <i  , <t  , <sp , <sp, <sp

 SECTION_DIVIDER

        ; dedicated to
        .byte  <d , <e , <d , <i  , <c , <a  , <t , <e  , <d  , <sp , <t , <o
        .byte 0   , <sp
        .byte  <m , <o , <m , <sp ,<amp, <sp , <d , <a  , <d  , <sp , <sp, <sp
        .byte 0   , <sp
        .byte  <m , <i , <c , <h  , <e , <l  , <l , <e  , <sp ,<amp , <sp, <sp
        .byte  <sp, <e , <r , <i  , <c , <sp , <w , <a  , <l  , <k  , <e , <r
        .byte 0   , <sp
        .byte  <s , <h , <a , <w  , <n , <cm , <sp, <sp , <sp , <sp , <sp, <sp
        .byte  <k , <r , <i , <s  , <t , <i  , <n , <cm , <sp , <sp , <sp, <sp
        .byte  <j , <u , <s , <t  , <i , <n  , <cm, <sp , <sp , <sp , <sp, <sp
        .byte  <b , <r , <a , <n  , <d , <i  , <n , <cm , <sp , <sp ,<sp , <sp
        .byte  <m , <a , <s , <o  , <n , <sp ,<amp, <sp , <sp , <sp , <sp, <sp
        .byte  <sp, <l , <o , <g  , <a , <n  , <sp, <s  , <p  , <i  , <c , <e
        .byte 0   , <sp
        .byte  <g , <r , <e , <g  , <cm, <sp , <sp, <sp , <sp , <sp , <sp, <sp
        .byte  <m , <i , <c , <h  , <e , <l  , <l , <e  , <cm , <sp , <sp, <sp
        .byte  <n , <i , <c , <o  , <l , <a  , <s , <sp ,<amp , <sp , <sp, <sp
        .byte  <m , <i , <c , <h  , <a , <e  , <l , <sp , <sp , <sp , <sp, <sp
        .byte <sp , <sp, <sp, <sp , <sp, <sp , <i , <m  , <h  , <o  , <f , <f

 SECTION_DIVIDER

        ; <dragon, knight and king graphics by david vazquez
        .byte  <d, <r , <a , <g , <o , <n , <cm, <sp, <sp, <sp, <sp, <sp
        .byte  <k, <n , <i , <g , <h , <t , <sp, <a , <n , <d , <sp, <sp
        .byte  <k, <i , <n , <g , <sp, <sp, <sp, <sp, <sp, <sp, <sp, <sp
        .byte  <g, <r , <a , <p , <h , <i , <c , <s , <sp, <b , <yy, <sp
        .byte <sp, <sp, <sp, <sp, <sp, <sp, <sp, <d , <a , <v , <i , <d
        .byte <sp, <sp, <sp, <sp, <sp, <v , <a , <z , <q , <u , <e , <z
 SECTION_DIVIDER

        .byte  <d, <r , <a , <g , <o , <n , <sp, <sp, <sp, <sp, <sp, <sp
        .byte  <a, <n , <i , <m , <a , <t , <i , <o , <n , <s , <sp, <sp
        .byte  <b, <yy, <sp, <sp, <sp, <sp, <sp, <d , <a , <v , <i , <d
        .byte <sp, <sp, <sp, <sp, <sp, <v , <a , <z , <q , <u , <e , <z
 SECTION_DIVIDER

        ; label by
        .byte  <l, <a , <b , <e , <l , <sp, <a , <n, <d , <sp, <sp, <sp
        .byte  <m, <a , <n , <u , <a , <l , <sp, <b, <yy, <sp, <sp, <sp
        .byte <sp, <sp, <sp, <sp, <sp, <sp, <sp, <d, <a , <v , <i , <d
        .byte <sp, <sp, <sp, <sp, <sp, <v , <a , <z, <q , <u , <e , <z

 SECTION_DIVIDER

        ; druid chip music by erik ehrling
        .byte  <d, <r, <u, <i, <d , <sp, <c, <h , <i , <p , <sp, <sp
        .byte  <m, <u, <s, <i, <c , <sp, <b, <yy, <sp, <sp, <sp, <sp
        .byte  <e, <r, <i, <k, <sp, <e , <h, <r , <l , <i , <n , <g

 SECTION_DIVIDER

         ; music kit 2.0 by paul slocum
        .byte  <m , <u, <s, <i, <c, <sp, <k, <i, <t, <sp, <v, <n2
        .byte  <sp, <p, <a, <u, <l, <sp, <s, <l, <o, <c , <u, <m

 SECTION_DIVIDER

        ;thank you to
        .byte  <t, <h , <a, <n, <k, <sp, <yy, <o, <u, <sp, <t, <o
        .byte 0  , <sp

        ; allan - playtester
        .byte  <a, <l , <l , <a , <n , <sp, <sp, <sp, <sp, <sp, <sp, <sp
        .byte <sp, <sp, <sp, <sp, <sp, <b , <u , <s , <h , <m , <a , <n
        .byte 0  , <sp

        ; johnnywc - playtester
        .byte  <j, <o , <h , <n , <sp, <w ,<dot, <sp, <sp, <sp, <sp, <sp
        .byte <sp, <sp, <sp, <sp, <c , <h , <a , <m , <p , <e , <a , <u
        .byte 0  , <sp

        ; andrew davie - tutorial
        .byte  <a, <n , <d, <r, <e, <w, <sp, <d, <a, <v, <i, <e
        .byte 0  , <sp

        ; PacManPlus - Bob DeCrescenzo - gameplay feedback
        .byte  <b, <o , <b, <sp, <sp, <sp, <sp, <sp, <sp, <sp, <sp, <sp
        .byte <sp, <d , <e, <c , <r , <e , <s , <c , <e , <n , <z , <o
        .byte 0  , <sp

        ; MrRetroGammer - playtester
        .byte  <r,  <i,  <c,  <h, <sp,  <g,  <a,  <l,  <l,  <o, <sp, <sp
        .byte 0, <sp

        ; Keilbaca - Christian Keilback
        .byte  <c,  <h,  <r,  <i,  <s,  <t,  <i,  <a,  <n, <sp, <sp, <sp
        .byte <sp, <sp, <sp, <sp,  <k,  <e,  <i,  <l,  <b,  <a,  <c,  <k
        .byte 0, <sp

        ; zach
        .byte  <z,  <a,  <c,  <h, <sp,  <m,  <a,  <t,  <l,  <e, <yy, <sp
        .byte 0, <sp

        ; vdub_bobby - Bob Montgomery - positioning help
        .byte  <b,  <o,  <b, <sp, <sp, <sp, <sp, <sp, <sp, <sp, <sp, <sp
        .byte <sp, <sp,  <m,  <o,  <n,  <t,  <g,  <o,  <m,  <e,  <r, <yy
        .byte 0, <sp

        ; batari
        .byte  <f,  <r,  <e,  <d, <sp,  <q,  <u,  <i,  <m,  <b, <yy, <sp
        .byte 0, <sp


        ; gobo - screen flashing
        .byte  <c,  <h,  <r,  <i,  <s,  <t,  <i,  <a,  <n, <sp,<amp, <sp
        .byte <sp, <sp, <sp,  <t,  <o,  <m, <sp,  <r,  <i,  <l,  <e, <yy
        .byte 0, <sp

        ; Jacob Rose - flicker reduction suggestion
        .byte  <j,  <a,  <c,  <o,  <b, <sp,  <r,  <o,  <s,  <e, <sp, <sp
        .byte 0, <sp

        ; cybergoth
        .byte  <m,  <a,  <n,  <u,  <e,  <l, <sp, <sp, <sp, <sp, <sp, <sp
        .byte <sp, <sp, <sp,  <r,  <o,  <t,  <s,  <c,  <h,  <k,  <a,  <r
        .byte 0, <sp

        ; mos6507
        .byte  <g,  <l,  <e,  <n,  <n, <sp, <sp, <sp, <sp, <sp, <sp, <sp
        .byte <sp, <sp, <sp, <sp,  <s,  <a,  <u,  <n,  <d,  <e,  <r,  <s
        .byte 0, <sp

        ; big player - selectable corner for 1 player game
        .byte  <m,  <i,  <k,  <e, <sp,  <s,  <t,  <a,  <g,  <n,  <e, <yy
        .byte 0, <sp

        ; Nathan Strum
        .byte  <n,  <a,  <t,  <h,  <a,  <n,  <sp, <s,  <t,  <r,  <u,  <m
        .byte 0, <sp

        ; cd-w - Chris Walton - textured <castles, coding suggestions
        .byte  <c,  <h,  <r,  <i,  <s, <sp,  <w,  <a,  <l,  <t,  <o,  <n
        .byte 0, <sp

        ; z28in82 & chickybaby - playtesters
        .byte  <s,  <h,  <a,  <u,  <n, <cm, <sp,  <a,  <n,  <n,  <a, <sp
        .byte <amp,<sp,  <b,  <e,  <a,  <n, <sp,  <w,  <o,  <w,  <k,<dsh
        .byte <sp, <sp, <sp, <sp,  <f,  <l,  <a,  <n,  <n,  <e,  <r, <yy
        .byte 0, <sp


        ; stella emulator team - great debugger
        .byte  <s,  <t,  <e,  <l,  <l,  <a,  <sp,  <t,  <e,  <a,  <m, <sp

 SECTION_DIVIDER

        .byte  <s,  <p,  <e,  <c,  <i,  <a,  <l, <sp, <sp, <sp, <sp, <sp
        .byte  <t,  <h,  <a,  <n,  <k,  <s, <sp,  <t,  <o, <sp, <sp, <sp
        .byte 0, <sp

        ; supercat - John Payson
        .byte  <<j,  <<o,  <<h,  <<n, <<sp,  <<p,  <<a, <<yy,  <<s,  <<o,  <<n, <sp
        .byte 0, <sp

        ; Albert Yarusso
        .byte  <<a,  <<l,  <<b,  <<e,  <<r,  <<t, <<sp, <<sp, <<sp, <<sp, <<sp, <sp
        .byte <<sp, <<sp, <<sp, <<sp, <<sp, <<yy,  <<a,  <r,  <u,  <s,  <s,  <o
        .byte 0, <sp
        .byte  <a,  <t,  <a,  <r,  <i,  <a,  <g,  <e,<dot,  <c,  <o,  <m

 SECTION_DIVIDER


MEendMessage

SetDragonFrameCode
; routine to set dragon frame goes here
; needs to support return to bank 4 for easter egg
; or OverscanWait for continuation of game..

;        call with Y holding frame - bit 7 on for FlipImage
;             (normally signifies flying Right-To-Left)
;        call with X holding 1 for return to EE, 0 for return to game

        tya
        bpl DragonFacingRight
        and #%01111111
        tay
        cpy #SmoothFrames
        bne DFLnoTweeks
        lda DragonX
        cmp #7
        bcc DFLuseHeadless1 ; for 0 thru 6
        cmp #10
        bcc DFLuseHeadless2 ; for 7 thru 9
        cmp #144
        bcs DFLuseTailless1
        cmp #140
        bcs DFLuseTailless2
        bcc DFLnoTweeks
DFLuseTailless1
        ldy #0
        .byte $2c
DFLuseTailless2
        ldy #1
        .byte $2c
DFLuseHeadless1
        ldy #2
        .byte $2c
DFLuseHeadless2
        ldy #3
DFLnoTweeks
        lda DragonAnimWL,y
        sta DragonG0
        lda DragonAnimWH,y
        sta DragonG0+1
        lda DragonAnimBL,y
        sta DragonG1
        lda DragonAnimBH,y
        sta DragonG1+1
        lda DragonAnimFlyingLeftL,y
        sta DragonShift
        lda DragonAnimFlyingLeftH,y
        sta DragonShift+1
        lda #%00100000
        ora DragonControl
        bne SDFCsetBank

DragonFacingRight
        cpy #SmoothFrames
        bne DFRnoTweeks
        lda DragonX
        cmp #7        ; for 0 thru 6
        bcc DFRuseTailless1
        cmp #10       ; for 7 thru 9
        bcc DFRuseTailless2
        cmp #145
        bcs DFRuseHeadless1
        cmp #141
        bcs DFRuseHeadless2
        bcc DFRnoTweeks

DFRuseTailless1
        ldy #0
        .byte $2c
DFRuseTailless2
        ldy #1
        .byte $2c
DFRuseHeadless1
        ldy #2
        .byte $2c
DFRuseHeadless2
        ldy #3
DFRnoTweeks
        lda DragonAnimWL,y
        sta DragonG0
        lda DragonAnimWH,y
        sta DragonG0+1
        lda DragonAnimBL,y
        sta DragonG1
        lda DragonAnimBH,y
        sta DragonG1+1
        lda DragonAnimFlyingRightL,y
        sta DragonShift
        lda DragonAnimFlyingRightH,y
        sta DragonShift+1
        lda #%11011111
        and DragonControl

SDFCsetBank
        sta DragonControl
	cpy #10+SmoothFrames  ; 10 dragon frames in bank 1, 6 smooth on/off frames
	bcc SDFCGraphicsInBank2
	lda #%01000000
	ora DragonControl
	bne SDFCbankDone
SDFCGraphicsInBank2
	lda #%10111111
	and DragonControl
SDFCbankDone
	sta DragonControl
        txa
        beq SDFCgame
        jmp MEafterSetFrame

SDFCgame
        lda INTIM
        sta DebugOS
DFOverscanWait:
        lda SWCHB
        eor #$FF
        and #%00000011
        bne DFSelectOrReset
        ldx INTIM
        bpl DFOverscanWait
        jmp VerticalBlankGame
DFSelectOrReset
        lda #ATTRACT_DELAY
        sta ExtraFireball
        lda #0             ; reset music
        sta SPbeat
        sta SPtempoCount
        sta SPmeasure
        jmp OverscanMenu2

	include songplay.h

DragonAnimWH
        .byte > Wings1TL1 ; 0
        .byte > Wings1TL2 ; 1
        .byte > Wings1HL1 ; 2
        .byte > Wings1HL2 ; 3
        .byte > Wings1    ; 6
        .byte > Wings2
        .byte > Wings3
        .byte > Wings4
        .byte > Wings5
        .byte > Wings6
        .byte > Wings7
        .byte > Wings8
        .byte > Wings9
        .byte > Wings10
        .byte > Wings11
        .byte > Wings12
        .byte > Wings13
        .byte > Wings14
        .byte > Wings15
        .byte > Wings16
        .byte > Wings17
        .byte > Wings18
        .byte > Wings19
        .byte > Wings20
        .byte > Wings21
        .byte > Wings22
        .byte > Wings23
        .byte > Wings24
        .byte > Wings25
        .byte > Wings26
        .byte > Wings27
        .byte > Wings28
        .byte > Wings29
        .byte > Wings30
        .byte > Wings31
        .byte > Wings32

DragonAnimWL
        .byte < Wings1TL1 ; 0
        .byte < Wings1TL2 ; 1
        .byte < Wings1HL1 ; 2
        .byte < Wings1HL2 ; 3
        .byte < Wings1    ; 4
        .byte < Wings2
        .byte < Wings3
        .byte < Wings4
        .byte < Wings5
        .byte < Wings6
        .byte < Wings7
        .byte < Wings8
        .byte < Wings9
        .byte < Wings10
        .byte < Wings11
        .byte < Wings12
        .byte < Wings13
        .byte < Wings14
        .byte < Wings15
        .byte < Wings16
        .byte < Wings17
        .byte < Wings18
        .byte < Wings19
        .byte < Wings20
        .byte < Wings21
        .byte < Wings22
        .byte < Wings23
        .byte < Wings24
        .byte < Wings25
        .byte < Wings26
        .byte < Wings27
        .byte < Wings28
        .byte < Wings29
        .byte < Wings30
        .byte < Wings31
        .byte < Wings32


DragonAnimBH
        .byte > Body1TL1 ; 0
        .byte > Body1TL2 ; 1
        .byte > Body1HL1 ; 2
        .byte > Body1HL2 ; 3
        .byte > Body1    ; 4
        .byte > Body2
        .byte > Body3
        .byte > Body4
        .byte > Body5
        .byte > Body6
        .byte > Body7
        .byte > Body8
        .byte > Body9
        .byte > Body10
        .byte > Body11
        .byte > Body12
        .byte > Body13
        .byte > Body14
        .byte > Body15
        .byte > Body16
        .byte > Body17
        .byte > Body18
        .byte > Body19
        .byte > Body20
        .byte > Body21
        .byte > Body22
        .byte > Body23
        .byte > Body24
        .byte > Body25
        .byte > Body26
        .byte > Body27
        .byte > Body28
        .byte > Body29
        .byte > Body30
        .byte > Body31
        .byte > Body32

DragonAnimBL
        .byte < Body1TL1 ; 0
        .byte < Body1TL2 ; 1
        .byte < Body1HL1 ; 2
        .byte < Body1HL2 ; 3
        .byte < Body1    ; 4
        .byte < Body2
        .byte < Body3
        .byte < Body4
        .byte < Body5
        .byte < Body6
        .byte < Body7
        .byte < Body8
        .byte < Body9
        .byte < Body10
        .byte < Body11
        .byte < Body12
        .byte < Body13
        .byte < Body14
        .byte < Body15
        .byte < Body16
        .byte < Body17
        .byte < Body18
        .byte < Body19
        .byte < Body20
        .byte < Body21
        .byte < Body22
        .byte < Body23
        .byte < Body24
        .byte < Body25
        .byte < Body26
        .byte < Body27
        .byte < Body28
        .byte < Body29
        .byte < Body30
        .byte < Body31
        .byte < Body32

DragonAnimFlyingRightH
        .byte > Shift1LtoR    ; 0
        .byte > Shift1LtoR    ; 1
        .byte > Shift1LtoR    ; 2
        .byte > Shift1LtoR    ; 3
        .byte > Shift1LtoR    ; 4
        .byte > Shift2LtoR
        .byte > Shift3LtoR
        .byte > Shift4LtoR
        .byte > Shift5LtoR
        .byte > Shift6LtoR
        .byte > Shift7LtoR
        .byte > Shift8LtoR
        .byte > Shift9LtoR
        .byte > Shift10LtoR
        .byte > Shift11LtoR
        .byte > Shift12LtoR
        .byte > Shift13LtoR
        .byte > Shift14LtoR
        .byte > Shift15LtoR
        .byte > Shift16LtoR
        .byte > Shift17LtoR
        .byte > Shift18LtoR
        .byte > Shift19LtoR
        .byte > Shift20LtoR
        .byte > Shift21LtoR
        .byte > Shift22LtoR
        .byte > Shift23LtoR
        .byte > Shift24LtoR
        .byte > Shift25LtoR
        .byte > Shift26LtoR
        .byte > Shift27LtoR
        .byte > Shift28LtoR
        .byte > Shift29LtoR
        .byte > Shift30LtoR
        .byte > Shift31LtoR
        .byte > Shift32LtoR

DragonAnimFlyingRightL
        .byte < Shift1LtoR    ; 0
        .byte < Shift1LtoR    ; 1
        .byte < Shift1LtoR    ; 2
        .byte < Shift1LtoR    ; 3
        .byte < Shift1LtoR    ; 4
        .byte < Shift2LtoR
        .byte < Shift3LtoR
        .byte < Shift4LtoR
        .byte < Shift5LtoR
        .byte < Shift6LtoR
        .byte < Shift7LtoR
        .byte < Shift8LtoR
        .byte < Shift9LtoR
        .byte < Shift10LtoR
        .byte < Shift11LtoR
        .byte < Shift12LtoR
        .byte < Shift13LtoR
        .byte < Shift14LtoR
        .byte < Shift15LtoR
        .byte < Shift16LtoR
        .byte < Shift17LtoR
        .byte < Shift18LtoR
        .byte < Shift19LtoR
        .byte < Shift20LtoR
        .byte < Shift21LtoR
        .byte < Shift22LtoR
        .byte < Shift23LtoR
        .byte < Shift24LtoR
        .byte < Shift25LtoR
        .byte < Shift26LtoR
        .byte < Shift27LtoR
        .byte < Shift28LtoR
        .byte < Shift29LtoR
        .byte < Shift30LtoR
        .byte < Shift31LtoR
        .byte < Shift32LtoR

DragonAnimFlyingLeftH
        .byte > Shift1RtoL    ; 0
        .byte > Shift1RtoL    ; 1
        .byte > Shift1RtoL    ; 2
        .byte > Shift1RtoL    ; 3
        .byte > Shift1RtoL    ; 4
        .byte > Shift2RtoL
        .byte > Shift3RtoL
        .byte > Shift4RtoL
        .byte > Shift5RtoL
        .byte > Shift6RtoL
        .byte > Shift7RtoL
        .byte > Shift8RtoL
        .byte > Shift9RtoL
        .byte > Shift10RtoL
        .byte > Shift11RtoL
        .byte > Shift12RtoL
        .byte > Shift13RtoL
        .byte > Shift14RtoL
        .byte > Shift15RtoL
        .byte > Shift16RtoL
        .byte > Shift17RtoL
        .byte > Shift18RtoL
        .byte > Shift19RtoL
        .byte > Shift20RtoL
        .byte > Shift21RtoL
        .byte > Shift22RtoL
        .byte > Shift23RtoL
        .byte > Shift24RtoL
        .byte > Shift25RtoL
        .byte > Shift26RtoL
        .byte > Shift27RtoL
        .byte > Shift28RtoL
        .byte > Shift29RtoL
        .byte > Shift30RtoL
        .byte > Shift31RtoL
        .byte > Shift32RtoL

DragonAnimFlyingLeftL
        .byte < Shift1RtoL    ; 0
        .byte < Shift1RtoL    ; 1
        .byte < Shift1RtoL    ; 2
        .byte < Shift1RtoL    ; 3
        .byte < Shift1RtoL    ; 4
        .byte < Shift2RtoL
        .byte < Shift3RtoL
        .byte < Shift4RtoL
        .byte < Shift5RtoL
        .byte < Shift6RtoL
        .byte < Shift7RtoL
        .byte < Shift8RtoL
        .byte < Shift9RtoL
        .byte < Shift10RtoL
        .byte < Shift11RtoL
        .byte < Shift12RtoL
        .byte < Shift13RtoL
        .byte < Shift14RtoL
        .byte < Shift15RtoL
        .byte < Shift16RtoL
        .byte < Shift17RtoL
        .byte < Shift18RtoL
        .byte < Shift19RtoL
        .byte < Shift20RtoL
        .byte < Shift21RtoL
        .byte < Shift22RtoL
        .byte < Shift23RtoL
        .byte < Shift24RtoL
        .byte < Shift25RtoL
        .byte < Shift26RtoL
        .byte < Shift27RtoL
        .byte < Shift28RtoL
        .byte < Shift29RtoL
        .byte < Shift30RtoL
        .byte < Shift31RtoL
        .byte < Shift32RtoL

 echo "----",($FF00 - *) , "bytes of BANK 4 ROM left"
        ORG $BF00
        RORG $FF00
fonthi

eof
	.byte zz________  ; zero used to denote "line file" for compression
                          ; so we can't use it as a character value.
j
        .byte zzX_______
        .byte zz_X______
        .byte zz_X______
        .byte zz_X______
;       .byte zzXXX_____
n2
        .byte zzXXX_____
        .byte zzX_______
        .byte zz_X______
        .byte zz__X_____
;       .byte zzXX______
d
        .byte zzXX______
        .byte zzX_X_____
        .byte zzX_X_____
        .byte zzX_X_____
;       .byte zzXX______
s
        .byte zzXX______
        .byte zz__X_____
        .byte zz_X______
        .byte zzX_______
        .byte zz_XX_____

f
        .byte zzX_______
        .byte zzX_______
        .byte zzXX______
        .byte zzX_______
;       .byte zzXXX_____
e
        .byte zzXXX_____
        .byte zzX_______
        .byte zzXX______
        .byte zzX_______
;       .byte zzXXX_____

z
        .byte zzXXX_____
        .byte zzX_______
        .byte zz_X______
        .byte zz__X_____
        .byte zzXXX_____


op
        .byte zz__X_____
        .byte zz_X______
        .byte zz_X______
        .byte zz_X______
        .byte zz__X_____



n6
        .byte zz_X______
        .byte zzX_X_____
        .byte zzXX______
        .byte zzX_______
;       .byte zz_XX_____

amp
        .byte zz_XX_____
        .byte zzX_X_____
        .byte zz_X______
        .byte zzX_X_____
        .byte zz_X______

cp
        .byte zzX_______
        .byte zz_X______
        .byte zz_X______
        .byte zz_X______
;       .byte zzX_______

cm      .byte zzX_______
;        .byte zz_X______
;        .byte zz________
;        .byte zz________
;        .byte zz________

dot
        .byte zz_X______
;        .byte zz________
;        .byte zz________
;        .byte zz________
;        .byte zz________

sp
        .byte zz________
        .byte zz________
        .byte zz________
;        .byte zz________
;        .byte zz________
dsh
        .byte zz________
        .byte zz________
        .byte zzX_X_____
        .byte zz________
        .byte zz________

g
        .byte zz_XX_____
        .byte zzX_X_____
        .byte zzX_X_____
        .byte zzX_______
;       .byte zz_XX_____

c
        .byte zz_XX_____
        .byte zzX_______
        .byte zzX_______
        .byte zzX_______
;       .byte zz_XX_____

u
        .byte zz_XX_____
        .byte zzX_X_____
;       .byte zzX_X_____
;       .byte zzX_X_____
;       .byte zzX_X_____

m
        .byte zzX_X_____
;       .byte zzX_X_____
;       .byte zzX_X_____
;       .byte zzXXX_____
;       .byte zzX_X_____

h
        .byte zzX_X_____
;       .byte zzX_X_____
;       .byte zzXXX_____
;       .byte zzX_X_____
;       .byte zzX_X_____

w
        .byte zzX_X_____
        .byte zzXXX_____
        .byte zzX_X_____
;       .byte zzX_X_____
;       .byte zzX_X_____

xx
        .byte zzX_X_____
        .byte zzX_X_____
;       .byte zz_X______
;       .byte zzX_X_____
 ;      .byte zzX_X_____

v
        .byte zz_X______
;       .byte zzX_X_____
;       .byte zzX_X_____
;       .byte zzX_X_____
;       .byte zzX_X_____

n
        .byte zzX_X_____
        .byte zzX_X_____
;       .byte zzX_X_____
;       .byte zzX_X_____
;       .byte zzXX______

k
        .byte zzX_X_____
        .byte zzX_X_____
        .byte zzXX______
;       .byte zzX_X_____
;       .byte zzX_X_____

a
        .byte zzX_X_____
        .byte zzX_X_____
        .byte zzXXX_____
        .byte zzX_X_____
;       .byte zz_X______

i
        .byte zz_X______
;       .byte zz_X______
;       .byte zz_X______
;       .byte zz_X______
;       .byte zz_X______

t
        .byte zz_X______
        .byte zz_X______
        .byte zz_X______
        .byte zz_X______
;       .byte zzXXX_____
l
        .byte zzXXX_____
        .byte zzX_______
        .byte zzX_______
;       .byte zzX_______
;       .byte zzX_______

p
        .byte zzX_______
        .byte zzX_______
;       .byte zzXX______
;       .byte zzX_X_____
;       .byte zzXX______

b
        .byte zzXX______
        .byte zzX_X_____
        .byte zzXX______
        .byte zzX_X_____
        .byte zzXX______

q
        .byte zz__X_____
        .byte zz_X______
        .byte zzX_X_____
        .byte zzX_X_____
;       .byte zz_X______

o
        .byte zz_X______
        .byte zzX_X_____
        .byte zzX_X_____
        .byte zzX_X_____
;       .byte zz_X______

yy
        .byte zz_X______
        .byte zz_X______
        .byte zz_X______
;       .byte zzX_X_____
;       .byte zzX_X_____

r
        .byte zzX_X_____
        .byte zzX_X_____
        .byte zzXX______
        .byte zzX_X_____
fontlo  .byte zzXX______


;j
        .byte zz____X___
        .byte zz_____X__
        .byte zz_____X__
        .byte zz_____X__
;       .byte zz____XXX_
;n2
        .byte zz____XXX_
        .byte zz____X___
        .byte zz_____X__
        .byte zz______X_
;       .byte zz____XX__

;d
        .byte zz____XX__
        .byte zz____X_X_
        .byte zz____X_X_
        .byte zz____X_X_
;       .byte zz____XX__
;s
        .byte zz____XX__
        .byte zz______X_
        .byte zz_____X__
        .byte zz____X___
        .byte zz_____XX_

;f
        .byte zz____X___
        .byte zz____X___
        .byte zz____XX__
        .byte zz____X___
;       .byte zz____XXX_
;e
        .byte zz____XXX_
        .byte zz____X___
        .byte zz____XX__
        .byte zz____X___
;       .byte zz____XXX_

;z
        .byte zz____XXX_
        .byte zz____X___
        .byte zz_____X__
        .byte zz______X_
        .byte zz____XXX_



        ;op
        .byte zz______X_
        .byte zz_____X__
        .byte zz_____X__
        .byte zz_____X__
        .byte zz______X_



;n6
        .byte zz_____X__
        .byte zz____X_X_
        .byte zz____XX__
        .byte zz____X___
;       .byte zz_____XX_

;amp
        .byte zz_____XX_
        .byte zz____X_X_
        .byte zz_____X__
        .byte zz____X_X_
        .byte zz_____X__
;cp
        .byte zz____X___
        .byte zz_____X__
        .byte zz_____X__
        .byte zz_____X__
;       .byte zz____X___

;cm
        .byte zz____X___
;        .byte zz_____X__
;        .byte zz________
;        .byte zz________
;        .byte zz________

;dot
        .byte zz_____X__
;        .byte zz________
;        .byte zz________
;        .byte zz________
;        .byte zz________

;sp
        .byte zz________
        .byte zz________
        .byte zz________
;        .byte zz________
;        .byte zz________

;dsh
        .byte zz________
        .byte zz________
        .byte zz____X_X_
        .byte zz________
        .byte zz________

;g
        .byte zz_____XX_
        .byte zz____X_X_
        .byte zz____X_X_
        .byte zz____X___
;       .byte zz_____XX_

;c
        .byte zz_____XX_
        .byte zz____X___
        .byte zz____X___
        .byte zz____X___
;       .byte zz_____XX_

;u
        .byte zz_____XX_
        .byte zz____X_X_
;       .byte zz____X_X_
;       .byte zz____X_X_
;       .byte zz____X_X_

;m
        .byte zz____X_X_
;       .byte zz____X_X_
;       .byte zz____X_X_
;       .byte zz____XXX_
;       .byte zz____X_X_
;h
        .byte zz____X_X_
;       .byte zz____X_X_
;       .byte zz____XXX_
;       .byte zz____X_X_
;       .byte zz____X_X_

;w
        .byte zz____X_X_
        .byte zz____XXX_
        .byte zz____X_X_
;       .byte zz____X_X_
;       .byte zz____X_X_

;xx
        .byte zz____X_X_
        .byte zz____X_X_
;       .byte zz_____X__
;       .byte zz____X_X_
;       .byte zz____X_X_

;v
        .byte zz_____X__
;       .byte zz____X_X_
;       .byte zz____X_X_
;       .byte zz____X_X_
;       .byte zz____X_X_

;n
        .byte zz____X_X_
        .byte zz____X_X_
;       .byte zz____X_X_
;       .byte zz____X_X_
;       .byte zz____XX__

;k
        .byte zz____X_X_
        .byte zz____X_X_
        .byte zz____XX__
;       .byte zz____X_X_
;       .byte zz____X_X_
;a
        .byte zz____X_X_
        .byte zz____X_X_
        .byte zz____XXX_
        .byte zz____X_X_
;       .byte zz_____X__

;i
        .byte zz_____X__
;       .byte zz_____X__
;       .byte zz_____X__
;       .byte zz_____X__
;       .byte zz_____X__

;t
        .byte zz_____X__
        .byte zz_____X__
        .byte zz_____X__
        .byte zz_____X__
;       .byte zz____XXX_

;l
        .byte zz____XXX_
        .byte zz____X___
        .byte zz____X___
;       .byte zz____X___
;       .byte zz____X___

;p
        .byte zz____X___
        .byte zz____X___
;       .byte zz____XX__
;       .byte zz____X_X_
;       .byte zz____XX__

;b
        .byte zz____XX__
        .byte zz____X_X_
        .byte zz____XX__
        .byte zz____X_X_
        .byte zz____XX__

;q
        .byte zz______X_
        .byte zz_____X__
        .byte zz____X_X_
        .byte zz____X_X_
;       .byte zz_____X__

;o
        .byte zz_____X__
        .byte zz____X_X_
        .byte zz____X_X_
        .byte zz____X_X_
;       .byte zz_____X__

;yy
        .byte zz_____X__
        .byte zz_____X__
        .byte zz_____X__
;       .byte zz____X_X_
;       .byte zz____X_X_

;r
        .byte zz____X_X_
        .byte zz____X_X_
        .byte zz____XX__
        .byte zz____X_X_
        .byte zz____XX__



        ORG $BFeb
        RORG $FFeb
	jmp MEafterDragonCode
        jmp SetDragonFrameCode
        jmp MMEEcode
        BANKS_AND_VECTORS

;--------------------------------------------------------------------
; bank 5 - Initialize System
;--------------------------------------------------------------------
        ORG $C000
        JUMP_TABLE
GetBank6SequenceData
        cmp SelectBank6
        jmp GetBank6SequenceDataCode
GetBank7SequenceData
        cmp SelectBank7
        jmp GetBank7SequenceDataCode
ReturnData
        cmp SelectBank5
        jmp ReturnDataCode


KernelGameBottomCode SUBROUTINE
        sta WSYNC
        cpy BLyOddRow     ; 3  4
        php               ; 3  7
        cpy M1yOddRow     ; 3 10
        php               ; 3 13
        cpy M0yOddRow     ; 3 16
        php               ; 3 19
        ldx #ENABL        ; 2 21
        txs               ; 2 22
        READ_TWO_PADDLES  ;23 45
        ldx #8            ; 2 47
        stx REFP1         ; 3 50
        ldx #0            ; 2 52
        stx REFP0         ; 3 55
        dey               ; 2 57
        lda Player4X      ; 3 60
        sec               ; 2 62
        sta WSYNC         ; 3 65
;PosObject
DivideLoop3
        sbc #15           ;
        bcs DivideLoop3 ;+4    4
        eor #7
        asl
        asl
        asl
        asl            ;+10  14
        sta.wx HMP0,X  ;+5   19
        sta RESP0,X    ;+4   23
        sta WSYNC

        cpy BLyEvenRow    ; 3
        php               ; 3  6
        cpy M1yEvenRow    ; 3  9
        php               ; 3 12
        cpy M0yEvenRow    ; 3 15
        php               ; 3 18
        ldx #ENABL        ; 2 20
        txs               ; 2 22
        READ_TWO_PADDLES  ;23 45
        dey               ; 2 37
        lda #ShieldColor4 ; 3 40
        sta COLUP0        ; 3 43
        ldx #ShieldColor2 ; 3 46
        stx COLUP1        ; 3 49
        ldx #1            ; 2 51
        lda Player2X      ; 3 54
        sec               ; 2 56
        sta WSYNC         ; 3 59
;PosObject
DivideLoop4
        sbc #15           ;
        bcs DivideLoop4 ;+4    4
        eor #7
        asl
        asl
        asl
        asl            ;+10  14
        sta.wx HMP0,X  ;+5   19
        sta RESP0,X    ;+4   23
        sta WSYNC
        sta HMOVE         ; 3
        cpy BLyOddRow     ; 3  6
        php               ; 3  9
        cpy M1yOddRow     ; 3 12
        php               ; 3 15
        cpy M0yOddRow     ; 3 18
        php               ; 3 21
        ldx #ENABL        ; 2 24
        txs               ; 2 27
        READ_TWO_PADDLES  ;23 50
        lda #$10          ; 2 52
        sta NUSIZ0        ; 3 55 double width missile 0
        sta NUSIZ1        ; 3 58 double width missile 1
        sta WSYNC         ; 3 61
        dey
        sta WSYNC
        cpy BLyEvenRow    ; 3
        php               ; 3  6
        cpy M1yEvenRow    ; 3  9
        php               ; 3 12
        cpy M0yEvenRow    ; 3 15
        php               ; 3 18
        ldx #ENABL        ; 2 20
        txs               ; 2 22
        READ_TWO_PADDLES  ;23 45
        sta WSYNC
        dey
        ldx ScreenColor
        lda DeadPlayers
        and #%1010
        cmp #%1010
        beq .bothDead
        cmp #%1000
        bne .notDead4
        stx COLUP0
.notDead4
        cmp #%0010
        bne .notDead2
        stx COLUP1
.notDead2
        lda #7            ; draw king shape, a player still lives
        .byte $2c
.bothDead
        lda #15           ; don't draw king shape, they're both dead
        sta KingIndex
        nop
        nop
        lda (Shield4ptr),y    ; 5 41
        sta GRP0          ; 3 44 draw player 4's shield
        sta WSYNC

.bottomShieldLoop SUBROUTINE
        cpy BLyOddRow     ; 3
        php               ; 3  6
        cpy M1yOddRow     ; 3  9
        php               ; 3 12
        cpy M0yOddRow     ; 3 15
        php               ; 3 18
        lda (Shield2ptr),y    ; 5 23
        sta GRP1          ; 3 26 draw Player 2's shield
        READ_TWO_PADDLES  ;23 49
        sta WSYNC         ; 3 52
        ldx #ENABL        ; 2
        txs               ; 2  4
        dey               ; 2  6
        inc KingIndex      ;10 16 inc/dec is a pair for 10 cycles
        dec KingIndex
        inc KingIndex      ;10 26 inc/dec is a pair for 10 cycles
        dec KingIndex
        inc KingIndex      ;10 36 inc/dec is a pair for 10 cycles
        dec KingIndex
        lda (Shield4ptr),y    ; 5 41
        sta GRP0          ; 3 44 draw player 4's shield
        sta WSYNC

        cpy BLyEvenRow     ; 3
        php               ; 3
        cpy M1yEvenRow     ; 3
        php               ; 3
        cpy M0yEvenRow     ; 3
        php               ; 3
        lda (Shield2ptr),y    ; 5
        sta GRP1          ; 3 draw Player 2's shield
        READ_TWO_PADDLES
        sta WSYNC
        ldx #ENABL        ; 2
        txs               ; 2  4
        dey               ; 2  6
        inc KingIndex      ;10 16 inc/dec is a pair for 10 cycles
        dec KingIndex
        inc KingIndex      ;10 26 inc/dec is a pair for 10 cycles
        dec KingIndex
        inc KingIndex      ;10 36 inc/dec is a pair for 10 cycles
        dec KingIndex
        lda (Shield4ptr),y    ; 5 41
        sta GRP0          ; 3 44
        cpy #23
        beq BottomCastles
        sta WSYNC
        bne .bottomShieldLoop

BottomCastles SUBROUTINE
;       ldx #7            ; 2  91
;       stx KingIndex      ; 3  94 king scan line
        lda Wall4R+5       ; precalc texture for left side PF1
        and #T2
        sta CT1

        lda Wall4L+5
        and #T1
        cpy BLyOddRow
        sta WSYNC
; start 1st line
        REPEAT 1           ; bottom players' 1st wall first 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda CT1            ; 3 21
        sta PF1            ; 3 24
        lda (Shield2ptr),y ; 5 29 load Player 2's shield
        sta GRP1           ; 3 32 draw Player 2's shield
        lda Wall2L+5       ; 3 35
        and #T2            ; 2 37
        sta PF1            ; 3 40
        lda Wall2R+5       ; 3 43
        and #T1            ; 2 45
        sta PF0            ; 3 48
        lda Wall4R+5       ; 3 51 prep next PF1 texture, this row
        and #T1            ; 2 53
        sta CT1            ; 3 56
        sta WSYNC          ; 3 59 end of line

        lda Wall4L+5       ; 3
        sta PF0            ; 3 6
        lda Wall4R+5       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall2L+5       ; 3 42
        sta PF1            ; 3 45
        lda Wall2R+5       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield4ptr),y     ; 5 58 load Player 4's Shield
        sta GRP0           ; 3 61 draw Player 4's Shield
        lda Wall4L+5       ; 3 64
        cpy BLyEvenRow     ; 3 67
        sta WSYNC          ; 3 70 end of line
        REPEND

        REPEAT 1           ; Bottom players' 1st wall second 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda Wall4R+5       ; 3 21
        sta PF1            ; 3 24
        lda (Shield2ptr),y     ; 5 29 load Player 2's shield
        sta GRP1           ; 3 32 draw Player 2's shield
        nop                ; 2 34

        lda Wall2L+5       ; 3 37
        sta PF1            ; 3 40
        lda Wall2R+5       ; 3 43
        sta PF0            ; 3 46
        sta WSYNC          ; 3 49 end of line

        lda Wall4L+5       ; 3
        sta PF0            ; 3 6
        lda Wall4R+5       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall2L+5       ; 3 42
        sta PF1            ; 3 45
        lda Wall2R+5       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield4ptr),y ; 5 58 load Player 4's shield
        sta GRP0           ; 3 61 draw Player 4's shield
        lda Wall4L+5       ; 3 64
        and #T2            ; 2 66
        cpy BLyOddRow      ; 3 69
        sta WSYNC          ; 3 72 end of line
        REPEND

        REPEAT 1           ; Bottom players' 1st wall third 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda CT1            ; 3 21
        sta PF1            ; 3 24
        lda (Shield2ptr),y ; 5 29 load Player 2's shield
        sta GRP1           ; 3 32 draw Player 2's shield
        lda Wall2L+5       ; 3 35
        and #T1            ; 2 37
        sta PF1            ; 3 40
        lda Wall2R+5       ; 3 43
        and #T2            ; 2 45
        sta PF0            ; 3 48
        lda Wall4R+4       ; 3 51 prep next PF1 texture, next row
        and #T2            ; 2 53
        sta CT1            ; 3 56
        sta WSYNC          ; 3 59 end of line

        lda Wall4L+5       ; 3
        sta PF0            ; 3 6
        lda Wall4R+5       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall2L+5       ; 3 42
        sta PF1            ; 3 45
        lda Wall2R+5       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield4ptr),y     ; 5 58 load Player 4's shield
        sta GRP0           ; 3 61 draw Player 4's shield
        lda Wall4L+5       ; 3 64
        cpy BLyEvenRow     ; 3 67
        sta WSYNC          ; 3 70 end of line
        REPEND

        REPEAT 1           ; Bottom players' 1st wall last 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda Wall4R+5       ; 3 21
        sta PF1            ; 3 24

        lda (Shield2ptr),y     ; 5 40 load Player 2's shield
        sta GRP1           ; 3 43 draw Player 2's shield
        nop                ; 2 45

        lda Wall2L+5       ; 3 49
        sta PF1            ; 3 52
        lda Wall2R+5       ; 3 55
        sta PF0            ; 3 58
        sta WSYNC          ; 3 61 end of line

        lda Wall4L+5       ; 3
        sta PF0            ; 3 6
        lda Wall4R+5       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall2L+5       ; 3 42
        sta PF1            ; 3 45
        lda Wall2R+5       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield4ptr),y     ; 5 58 load Player 4's shield
        sta GRP0           ; 3 61 draw Player 4's shield
        ldx #WallColor4    ; 2 63
        lda Wall4L+4       ; 3 66
        and #T1            ; 2 68
        cpy BLyOddRow      ; 3 71
        sta WSYNC          ; 3 74 end of line
        REPEND
; end 1st line

; start 2nd line
        REPEAT 1           ; bottom players' 2nd wall first 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        stx COLUPF         ; 3 21
        lda CT1            ; 3 24
        sta PF1            ; 3 27
        lda (Shield2ptr),y ; 5 32 load Player 2's shield
        sta GRP1           ; 3 35 draw Player 2's shield
        lda Wall2L+4       ; 3 38
        and #T2            ; 2 40
        sta PF1            ; 3 43
        lda Wall2R+4       ; 3 46
        and #T1            ; 2 48
        sta PF0            ; 3 51
        lda Wall4R+4       ; 3 54 prep next PF1 texture, this row
        and #T1            ; 2 56
        sta CT1            ; 3 59
        sta WSYNC          ; 3 62 end of line

        lda Wall4L+4       ; 3
        sta PF0            ; 3 6
        lda Wall4R+4       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall2L+4       ; 3 42
        sta PF1            ; 3 45
        lda Wall2R+4       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield4ptr),y     ; 5 58 load Player 4's shield
        sta GRP0           ; 3 61 save Player 4's shield
        lda Wall4L+4       ; 3 64
        cpy BLyEvenRow     ; 3 67
        sta WSYNC          ; 3 70 end of line
        REPEND

        REPEAT 1           ; bottom players' 2nd wall second 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda Wall4R+4       ; 3 21
        sta PF1            ; 3 24

        lda (Shield2ptr),y     ; 5 40 load Player 2's shield
        sta GRP1           ; 3 43 draw Player 2's shield
        nop                ; 2 45

        lda Wall2L+4       ; 3 49
        sta PF1            ; 3 52
        lda Wall2R+4       ; 3 55
        sta PF0            ; 3 58
        sta WSYNC          ; 3 61 end of line

        lda Wall4L+4       ; 3
        sta PF0            ; 3 6
        lda Wall4R+4       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall2L+4       ; 3 42
        sta PF1            ; 3 45
        lda Wall2R+4       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield4ptr),y     ; 5 58 load Player 4's shield
        sta GRP0           ; 3 61 draw Player 4's shield
        lda Wall4L+4       ; 3 64
        and #T2            ; 2 66
        cpy BLyOddRow      ; 3 69
        sta WSYNC          ; 3 72 end of line
        REPEND

        REPEAT 1           ; bottom players' 2nd wall third 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda CT1            ; 3 21
        sta PF1            ; 3 24
        lda (Shield2ptr),y ; 5 29 load Player 2's shield
        sta GRP1           ; 3 32 draw Player 2's shield
        lda Wall2L+4       ; 3 35
        and #T1            ; 2 37
        sta PF1            ; 3 40
        lda Wall2R+4       ; 3 43
        and #T2            ; 2 45
        sta PF0            ; 3 48
        lda Wall4R+3       ; 3 51 prep next PF1 texture, next row
        and #T2            ; 2 53
        sta CT1            ; 3 56
        sta WSYNC          ; 3 59 end of line

        lda Wall4L+4       ; 3
        sta PF0            ; 3 6
        lda Wall4R+4       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall2L+4       ; 3 42
        sta PF1            ; 3 45
        lda Wall2R+4       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield4ptr),y     ; 5 58 load Player 4's shield
        sta GRP0           ; 3 61 draw Player 4's shield
        lda Wall4L+4       ; 3 64
        cpy BLyEvenRow     ; 3 67
        sta WSYNC          ; 3 70 end of line
        REPEND

        REPEAT 1           ; bottom players' 2nd wall last 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda Wall4R+4       ; 3 21
        sta PF1            ; 3 24
        lda (Shield2ptr),y     ; 5 40 load Player 2's shield
        sta GRP1           ; 3 43 draw Player 2's shield
        nop                ; 2 45

        lda Wall2L+4       ; 3 49
        sta PF1            ; 3 52
        lda Wall2R+4       ; 3 55
        sta PF0            ; 3 58
        sta WSYNC          ; 3 61 end of line

        lda Wall4L+4       ; 3
        sta PF0            ; 3 6
        lda Wall4R+4       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall2L+4       ; 3 42
        sta PF1            ; 3 45
        lda Wall2R+4       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield4ptr),y     ; 5 58 load Player 4's shield
        sta GRP0           ; 3 61 draw Player 4's shield
        ldx #WallColor3    ; 2 63
        lda Wall4L+3       ; 3 66
        and #T1            ; 2 68
        cpy BLyOddRow      ; 3 71
        sta WSYNC          ; 3 74 end of line
        REPEND
; end 2nd line

; start 3rd line
        REPEAT 1           ; bottom players' 3rd wall first 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        stx COLUPF         ; 3 21
        lda CT1            ; 3 24
        sta PF1            ; 3 27
        lda (Shield2ptr),y ; 5 32 load Player 2's shield
        sta GRP1           ; 3 35 draw Player 2's shield
        lda Wall2L+3       ; 3 38
        and #T2            ; 2 40
        sta PF1            ; 3 43
        lda Wall2R+3       ; 3 46
        and #T1            ; 2 48
        sta PF0            ; 3 51
        lda Wall4R+3       ; 3 54 prep next PF1 texture, this row
        and #T1            ; 2 56
        sta CT1            ; 3 59
        sta WSYNC          ; 3 62 end of line

        lda Wall4L+3       ; 3
        sta PF0            ; 3 6
        lda Wall4R+3       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall2L+3       ; 3 42
        sta PF1            ; 3 45
        lda Wall2R+3       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield4ptr),y     ; 5 58 load Player 4's shield
        sta GRP0           ; 3 61 draw Player 4's shield
        lda Wall4L+3       ; 3 64
        cpy BLyEvenRow     ; 3 67
        sta WSYNC          ; 3 70 end of line
        REPEND

        REPEAT 1           ; bottom players' 3rd wall second 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda Wall4R+3       ; 3 21
        sta PF1            ; 3 24

        lda (Shield2ptr),y     ; 5 40 load Player 2's shield
        sta GRP1           ; 3 43 draw Player 2's shield
        nop                ; 2 45

        lda Wall2L+3       ; 3 49
        sta PF1            ; 3 52
        lda Wall2R+3       ; 3 55
        sta PF0            ; 3 58
        sta WSYNC          ; 3 61 end of line

        lda Wall4L+3       ; 3
        sta PF0            ; 3 6
        lda Wall4R+3       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall2L+3       ; 3 42
        sta PF1            ; 3 45
        lda Wall2R+3       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield4ptr),y     ; 5 58 load Player 4's shield
        sta GRP0           ; 3 61 draw Player 4's shield
        lda Wall4L+3       ; 3 64
        and #T2            ; 2 66
        cpy BLyOddRow      ; 3 69
        sta WSYNC          ; 3 72 end of line
        REPEND

        REPEAT 1           ; bottom players' 3rd wall third 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda CT1            ; 3 21
        sta PF1            ; 3 24
        lda (Shield2ptr),y ; 5 29 load Player 2's shield
        sta GRP1           ; 3 32 draw Player 2's shield
        lda Wall2L+3       ; 3 35
        and #T1            ; 2 37
        sta PF1            ; 3 40
        lda Wall2R+3       ; 3 43
        and #T2            ; 2 45
        sta PF0            ; 3 48
        lda Wall4R+2       ; 3 51 prep next PF1 texture, next row
        and #T2            ; 2 53
        sta CT1            ; 3 56
        sta WSYNC          ; 3 59 end of line

        lda Wall4L+3       ; 3
        sta PF0            ; 3 6
        lda Wall4R+3       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall2L+3       ; 3 42
        sta PF1            ; 3 45
        lda Wall2R+3       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield4ptr),y     ; 5 58 load Player 4's shield
        sta GRP0           ; 3 61 draw Player 4's shield
        lda Wall4L+3       ; 3 64
        cpy BLyEvenRow     ; 3 67
        sta WSYNC          ; 3 70 end of line
        REPEND


        REPEAT 1           ; bottom players' 3rd wall last 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda Wall4R+3       ; 3 21
        sta PF1            ; 3 24

        lda (Shield2ptr),y     ; 5 40 load Player 2's shield
        sta GRP1           ; 3 43 draw Player 2's shield
        nop                ; 2 45

        lda Wall2L+3       ; 3 49
        sta PF1            ; 3 52
        lda Wall2R+3       ; 3 55
        sta PF0            ; 3 58
        sta WSYNC          ; 3 61 end of line

        lda Wall4L+3       ; 3
        sta PF0            ; 3 6
        lda Wall4R+3       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        inc KingIndex       ;10 26 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        inc KingIndex       ;10 36 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        lda Wall2L+3       ; 3 39
        sta PF1            ; 3 42
        lda Wall2R+3       ; 3 45
        sta PF0            ; 3 48
        dey                ; 2 50
        lda (Shield4ptr),y     ; 5 55 load Player 4's shield
        sta GRP0           ; 3 58 draw Player 4's shield
        ldx #WallColor2    ; 2 60
        lda #0             ; 2 62
        cpy BLyOddRow      ; 3 65
        sta WSYNC          ; 3 68 end of line
        REPEND
; end 3rd line

; start 4th line
        REPEAT 1           ; bottom players' 4th wall first 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        stx COLUPF         ; 3 21
        lda CT1            ; 3 24
        sta PF1            ; 3 27
        lda #0             ; 4 31 done drawing king
        sta PF0            ; 3 34
        lda (Shield2ptr),y ; 5 39 load Player 2's shield
        sta GRP1           ; 3 42 draw Player 2's shield
        lda Wall2L+2       ; 3 45
        and #T2            ; 2 47
        sta PF1            ; 3 50
        sta WSYNC          ; 3 53 end of line

        lda Wall4R+2       ; 3
        sta PF1            ; 3 6
        ldx #ENABL         ; 2 8
        txs                ; 2 10
        inc KingIndex       ;10 20 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        inc KingIndex       ;10 30 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        inc KingIndex       ;10 40 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        lda Wall2L+2       ; 3 43
        sta PF1            ; 3 46
        dey                ; 2 49
        lda (Shield4ptr),y     ; 5 54 load Player 4's shield
        sta GRP0           ; 3 57 draw Player 4's shield
        lda Wall4R+2       ; 3 60
        cpy BLyEvenRow     ; 3 63
        sta WSYNC          ; 3 66 end of line
        REPEND

        REPEAT 1           ; bottom players' 4th wall second 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        inc KingIndex       ;10 28 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        lda (Shield2ptr),y     ; 5 33 load Player 2's shield
        sta GRP1           ; 3 36 draw Player 2's shield
        nop                ; 2 38

        nop                ; 2 40
        lda Wall2L+2       ; 3 43
        sta PF1            ; 3 46
        sta WSYNC          ; 3 49 end of line

        lda Wall4R+2       ; 3
        sta PF1            ; 3 6
        nop
        nop
        ldx #ENABL         ; 2 13
        txs                ; 2 15
        nop                ; 2 17
        nop                ; 2 19
        nop                ; 2 21
        nop                ; 2 23
        inc KingIndex       ;10 38 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        lda Wall2L+2       ; 3 41
        sta PF1            ; 3 44
        dey                ; 2 46
        lda (Shield4ptr),y     ; 5 51 load Player 4's shield
        sta GRP0           ; 3 54 draw Player 4's shield
        nop                ; 2 56
        nop                ; 2 58
        lda Wall4R+2       ; 3 63
        and #T1            ; 2 65
        cpy BLyOddRow      ; 3 72
        sta WSYNC          ; 3 75 end of line
        REPEND

        REPEAT 1           ; bottom players' 4th wall third 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        inc KingIndex       ;10 28 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        lda (Shield2ptr),y     ; 5 33 load Player 2's shield
        sta GRP1           ; 3 36 draw Player 2's shield
        nop                ; 2 38

        lda Wall2L+2       ; 3 41
        and #T1            ; 2 43
        sta PF1            ; 3 46
        sta WSYNC          ; 3 49 end of line

        lda Wall4R+2       ; 3
        sta PF1            ; 3 6
        nop                ; 2 8
        nop                ; 2 10
        ldx #ENABL         ; 2 12
        txs                ; 2 14
        nop                ; 2 16
        nop                ; 2 18
        nop                ; 2 20
        nop                ; 2 22
        inc KingIndex       ;10 32 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        lda Wall2L+2       ; 3 41
        sta PF1            ; 3 44
        dey                ; 2 46
        lda (Shield4ptr),y     ; 5 51
        sta GRP0           ; 3 54
        nop                ; 2 56
        nop                ; 2 58
        nop                ; 2 60
        lda Wall4R+2       ; 3 63
        cpy BLyEvenRow     ; 3 72
        sta WSYNC          ; 3 75 end of line
        REPEND


        REPEAT 1           ; bottom players' 4th wall last 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        ldx KingIndex       ; 3 21
        lda BottomKing,x   ; 4 25
        sta PF0            ; 3 28
        lda (Shield2ptr),y     ; 5 33 load Player 2's shield
        sta GRP1           ; 3 36 draw Player 2's shield
        nop                ; 2 38
        nop                ; 2 40
        nop                ; 2 42
        nop                ; 2 44
        lda BottomKing5thBit,x ; 4 48
        ora Wall2L+2       ; 3 51
        sta PF1            ; 3 54
        nop                ; 2 56
        nop                ; 2 58
        nop                ; 2 60
        nop                ; 2 62
        nop                ; 2 64
        lda #$13           ; 2 66 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        sta CTRLPF         ; 3 69
        sta WSYNC          ; 3 72 end of line


        lda BottomKing5thBit,x ; 4
        ora Wall4R+2       ; 3 7
        sta PF1            ; 3 10
        ldx #ENABL         ; 2 12
        txs                ; 2 14
        ldx KingIndex       ; 3 17
        dec KingIndex       ; 5 22
        nop 0              ; 3 25
        lda #$15           ; 2 27
        sta CTRLPF         ; 3 30
        nop                ; 2 32
        nop                ; 2 34
        lda BottomKing5thBit,x ; 4 38
        ora Wall2L+2       ; 3 41
        sta PF1            ; 3 44
        dey                ; 2 46
        lda (Shield4ptr),y     ; 5 51
        sta GRP0           ; 3 54
        lda Wall4R+1       ; 3 57
        and #T2            ; 2 59
        ora BottomKing5thBit,x ; 4 63
        ldx #$13           ; 2 65
                           ; stx CTRLPF needs to start 65-67 for color change
        stx CTRLPF         ; 3 69

        ldx #WallColor1    ; 2 71
        stx COLUPF         ; 3 74
        cpy BLyOddRow      ; 3 77
;       sta WSYNC          ;
        REPEND
; end 4th line

; start 5th line
        REPEAT 1           ; Bottom players' 5th wall first 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        lda #$15           ; 2 20 double size ball & reflective playfield
        ldx KingIndex       ; 3 23 load king pointer
                           ; sta needs to start at 27 for color change
        nop                ; 2 25
        nop                ; 2 27
        sta CTRLPF         ; 3 30
                           ; updating BottomKing here gives us more time at the
                           ; start of the scanline with the tradeoff of the
                           ; right kings being shifted down by 1 scanline
        lda BottomKing,x   ; 4 34
        sta PF0            ; 3 37
        lda (Shield2ptr),y     ; 5 42 load Player 2's shield
        sta GRP1           ; 3 45 draw Player 2's shield
        lda Wall2L+1       ; 3 52
        and #T2
        ora BottomKing5thBit,x   ; 4 49
        sta PF1            ; 3 55
        nop                ; 2 59
        nop                ; 2 61
        nop                ; 2 63
        lda #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        sta CTRLPF         ; 3 68
        sta WSYNC          ; 3 71 end of line


        lda BottomKing5thBit,x ; 4
        ora Wall4R+1       ; 3 7
        sta PF1            ; 3 10
        ldx #ENABL         ; 2 12
        txs                ; 2 14
        ldx KingIndex       ; 3 17
        dec KingIndex       ; 5 22
        nop 0              ; 3 25
        lda #$15           ; 2 27 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
        nop                ; 2 32
        nop                ; 2 34
        lda BottomKing5thBit,x ; 4 38
        ora Wall2L+1       ; 3 41
        sta PF1            ; 3 44
        dey                ; 2 46
        lda (Shield4ptr),y     ; 5 51 load Player 4's shield
        sta GRP0           ; 3 54 draw Player 4's shield
        nop                ; 2 56
        lda BottomKing5thBit,x ; 4 60
        ora Wall4R+1       ; 3 63
        ldx #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        stx CTRLPF         ; 3 69
        cpy BLyEvenRow     ; 3 72
        sta WSYNC          ; 3 75 end of line
        REPEND

        REPEAT 1           ; Bottom players' 5th wall second 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        lda #$15           ; 2 20 double size ball & reflective playfield
        ldx KingIndex       ; 3 23 load king pointer
                           ; sta needs to start at 27 for color change
        nop                ; 2 25
        nop                ; 2 27
        sta CTRLPF         ; 3 30
                           ; updating BottomKing here gives us more time at the
                           ; start of the scanline with the tradeoff of the
                           ; right kings being shifted down by 1 scanline
        lda BottomKing,x    ; 4 34
        sta PF0            ; 3 37
        lda (Shield2ptr),y     ; 5 42 load Player 2's shield
        sta GRP1           ; 3 45 draw Player 2's shield
        lda BottomKing5thBit,x ; 4 49
        ora Wall2L+1       ; 3 52
        sta PF1            ; 3 55
        nop                ; 2 57
        nop                ; 2 59
        nop                ; 2 61
        nop                ; 2 63
        lda #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        sta CTRLPF         ; 3 68
        sta WSYNC          ; 3 71 end of line

        lda BottomKing5thBit,x ; 4
        ora Wall4R+1       ; 3 7
        sta PF1            ; 3 10
        ldx #ENABL         ; 2 12
        txs                ; 2 14
        ldx KingIndex       ; 3 17
        dec KingIndex       ; 5 22
        nop 0              ; 3 25
        lda #$15           ; 2 27 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
        nop                ; 2 32
        nop                ; 2 34
        lda BottomKing5thBit,x ; 4 38
        ora Wall2L+1       ; 3 41
        sta PF1            ; 3 44
        dey                ; 2 46
        lda (Shield4ptr),y     ; 5 51
        sta GRP0           ; 3 54
        lda Wall4R+1       ; 3 57
        and #T1            ; 2 59
        ora BottomKing5thBit,x ; 4 63
        ldx #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        stx CTRLPF         ; 3 69
        cpy BLyOddRow      ; 3 72
        sta WSYNC          ; 3 75 end of line
        REPEND

        REPEAT 1           ; Bottom players' 5th wall third 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        lda #$15           ; 2 20 double size ball & reflective playfield
        ldx KingIndex       ; 3 23 load king pointer
                           ; sta needs to start at 27 for color change
        nop                ; 2 25
        nop                ; 2 27
        sta CTRLPF         ; 3 30
                           ; updating BottomKing here gives us more time at the
                           ; start of the scanline with the tradeoff of the
                           ; right kings being shifted down by 1 scanline
        lda BottomKing,x    ; 4 34
        sta PF0            ; 3 37
        lda (Shield2ptr),y     ; 5 42 load Player 2's shield
        sta GRP1           ; 3 45 draw Player 2's shield
        lda Wall2L+1       ; 3 52
        and #T1
        ora BottomKing5thBit,x ; 4 49
        sta PF1            ; 3 55
        nop                ; 2 59
        nop                ; 2 61
        nop                ; 2 63
        lda #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        sta CTRLPF         ; 3 68
        sta WSYNC          ; 3 71 end of line

        lda BottomKing5thBit,x ; 4
        ora Wall4R+1       ; 3 7
        sta PF1            ; 3 10
        ldx #ENABL         ; 2 12
        txs                ; 2 14
        ldx KingIndex       ; 3 17
        dec KingIndex       ; 5 22
        nop 0              ; 3 25
        lda #$15           ; 2 27 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
        nop                ; 2 32
        nop                ; 2 34
        lda BottomKing5thBit,x ; 4 38
        ora Wall2L+1       ; 3 41
        sta PF1            ; 3 44
        dey                ; 2 46
        lda (Shield4ptr),y     ; 5 51 load Player 4's shield
        sta GRP0           ; 3 54 draw Player 4's shield
        nop                ; 2 56
        lda BottomKing5thBit,x ; 4 60
        ora Wall4R+1       ; 3 63
        ldx #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        stx CTRLPF         ; 3 68
        cpy BLyEvenRow     ; 3 71
        sta WSYNC          ; 3 74 end of line
        REPEND



        REPEAT 1           ; last 2LK of 5th wall
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        lda #$15           ; 2 20 double size ball & reflective playfield
        ldx KingIndex       ; 3 23 load king pointer
        nop                ; 2 25
        nop                ; 2 27
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
                           ; updating BottomKing here gives us more time at the
                           ; start of the scanline with the tradeoff of the
                           ; right kings being shifted down by 1 scanline
        lda BottomKing,x    ; 4 34
        sta PF0            ; 3 37
        lda (Shield2ptr),y     ; 5 42 load Player 2's shield
        sta GRP1           ; 3 45 draw Player 2's shield
        lda BottomKing5thBit,x ; 4 49
        ora Wall2L+1       ; 3 52
        sta PF1            ; 3 55
        nop                ; 2 57
        nop                ; 2 59
        nop                ; 2 61
        nop                ; 2 63
        lda #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        sta CTRLPF         ; 3 68
        sta WSYNC          ; 3 71 end of line

        lda BottomKing5thBit,x ; 4
        ora Wall4R+1       ; 3 7
        sta PF1            ; 3 10
        ldx #ENABL         ; 2 12 set stack for ball & Missile php trick
        txs                ; 2 14
        ldx KingIndex       ; 3 17
        dec KingIndex       ; 5 22
        nop 0              ; 3 25
        lda #$15           ; 2 27 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
        nop                ; 2 32
        nop                ; 2 34
        lda BottomKing5thBit,x ; 4 38
        ora Wall2L+1       ; 3 41
        sta PF1            ; 3 44
        dey                ; 2 46
        lda (Shield4ptr),y     ; 5 51 load Player 4's shield
        sta GRP0           ; 3 54 draw Player 4's shield
        lda Wall4R         ; 3 63
        and #T2
        ora BottomKing5thBit,x ; 4 60
        ldx #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        stx CTRLPF         ; 3 68
        ldx #WallColor0    ; 3 70
        cpy BLyOddRow      ; 3 73
        stx COLUPF         ; 3 76
;       sta WSYNC          ;

        REPEND
; end 5th line


; start 6th line
        REPEAT 1           ; Bottom player's 6th wall first 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        lda #$15           ; 2 20 double size ball & reflective playfield
        ldx KingIndex       ; 3 23 load king pointer
        nop                ; 2 25
        nop                ; 2 27
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
                           ; updating BottomKing here gives us more time at the
                           ; start of the scanline with the tradeoff of the
                           ; right kings being shifted down by 1 scanline
        lda BottomKing,x    ; 4 34
        sta PF0            ; 3 37
        lda (Shield2ptr),y     ; 5 42 load Player 2's shield
        sta GRP1           ; 3 45 draw Player 2's shield
        lda Wall2L         ; 3 52
        and #T2
        ora BottomKing5thBit,x ; 4 49
        sta PF1            ; 3 55
        nop                ; 2 59
        nop                ; 2 61
        nop                ; 2 63
        lda #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        sta CTRLPF         ; 3 68
        sta WSYNC          ; 3 71 end of line

        lda BottomKing5thBit,x ; 4
        ora Wall4R         ; 3 7
        sta PF1            ; 3 10
        ldx #ENABL         ; 2 12
        txs                ; 2 14
        ldx KingIndex       ; 3 17
        dec KingIndex       ; 5 22
        nop 0              ; 3 25
        lda #$15           ; 2 27 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
        nop                ; 2 32
        nop                ; 2 34
        lda BottomKing5thBit,x ; 4 38
        ora Wall2L         ; 3 41
        sta PF1            ; 3 44
        dey                ; 2 46
        lda (Shield4ptr),y     ; 5 51 load Player 4's Shield
        sta GRP0           ; 3 54 draw Player 4's Shield
        nop                ; 2 56
        lda BottomKing5thBit,x ; 4 60
        ora Wall4R         ; 3 63
        ldx #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        stx CTRLPF         ; 3 69
        cpy BLyEvenRow     ; 3 72
        sta WSYNC          ; 3 75 end of line
        REPEND

        REPEAT 1           ; Bottom player's 6th wall second 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        lda #$15           ; 2 20 double size ball & reflective playfield
        ldx KingIndex       ; 3 23 load king pointer
        nop                ; 2 25
        nop                ; 2 27
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
                           ; updating BottomKing here gives us more time at the
                           ; start of the scanline with the tradeoff of the
                           ; right kings being shifted down by 1 scanline
        lda BottomKing,x    ; 4 34
        sta PF0            ; 3 37
        lda (Shield2ptr),y     ; 5 42 load Player 2's shield
        sta GRP1           ; 3 45 draw Player 2's shield
        lda BottomKing5thBit,x ; 4 49
        ora Wall2L         ; 3 52
        sta PF1            ; 3 55
        nop                ; 2 57
        nop                ; 2 59
        nop                ; 2 61
        nop                ; 2 63
        lda #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        sta CTRLPF         ; 3 68
        sta WSYNC          ; 3 71 end of line

        lda BottomKing5thBit,x ; 4
        ora Wall4R         ; 3 7
        sta PF1            ; 3 10
        ldx #ENABL         ; 2 12
        txs                ; 2 14
        ldx KingIndex       ; 3 17
        dec KingIndex       ; 5 22
        nop 0              ; 3 25
        lda #$15           ; 2 27 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
        nop                ; 2 32
        nop                ; 2 34
        lda BottomKing5thBit,x ; 4 38
        ora Wall2L         ; 3 41
        sta PF1            ; 3 44
        dey                ; 2 46
        lda (Shield4ptr),y     ; 5 51
        sta GRP0           ; 3 54
        lda Wall4R         ; 3 63
        and #T1
        ora BottomKing5thBit,x; 4 60
        ldx #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        stx CTRLPF         ; 3 69
        cpy BLyOddRow      ; 3 72
        sta WSYNC          ; 3 75 end of line
        REPEND

        REPEAT 1           ; Bottom player's 6th wall third 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        lda #$15           ; 2 20 double size ball & reflective playfield
        ldx KingIndex       ; 3 23 load king pointer
        nop                ; 2 25
        nop                ; 2 27
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
                           ; updating BottomKing here gives us more time at the
                           ; start of the scanline with the tradeoff of the
                           ; right kings being shifted down by 1 scanline
        lda BottomKing,x    ; 4 34
        sta PF0            ; 3 37
        lda (Shield2ptr),y     ; 5 42 load Player 2's shield
        sta GRP1           ; 3 45 draw Player 2's shield
        lda Wall2L         ; 3 52
        and #T1
        ora BottomKing5thBit,x ; 4 49
        sta PF1            ; 3 55

        nop                ; 2 59
        nop                ; 2 61
        nop                ; 2 63
        lda #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        sta CTRLPF         ; 3 68
        sta WSYNC          ; 3 71 end of line

        lda BottomKing5thBit,x ; 4
        ora Wall4R         ; 3 7
        sta PF1            ; 3 10
        ldx #ENABL         ; 2 12
        txs                ; 2 14
        ldx KingIndex       ; 3 17
        dec KingIndex       ; 5 22
        nop 0              ; 3 25
        lda #$15           ; 2 27 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
        nop                ; 2 32
        nop                ; 2 34
        lda BottomKing5thBit,x ; 4 38
        ora Wall2L         ; 3 41
        sta PF1            ; 3 44
        dey                ; 2 46
        lda (Shield4ptr),y     ; 5 51
        sta GRP0           ; 3 54
        nop                ; 2 56
        lda BottomKing5thBit,x ; 4 60
        ora Wall4R         ; 3 63
        ldx #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        stx CTRLPF         ; 3 69
        cpy BLyEvenRow     ; 3 72
        sta WSYNC          ; 3 75 end of line
        REPEND



        REPEAT 1           ; last 2LK of 6th wall
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        lda #$15           ; 2 20 double size ball & reflective playfield
        ldx KingIndex       ; 3 23 load king pointer
                           ; sta needs to start at 27 for color change
        nop                ; 2 25
        nop                ; 2 27
        sta CTRLPF         ; 3 30
                           ; updating BottomKing here gives us more time at the
                           ; start of the scanline with the tradeoff of the
                           ; right kings being shifted down by 1 scanline
        lda #0             ; 2 32
        sta PF0            ; 3 35
        lda (Shield2ptr),y     ; 5 40 load Player 2's shield
        sta GRP1           ; 3 43 draw Player 2's shield
        nop                ; 2 45

        nop                ; 2 47
        lda Wall2L         ; 3 50
        sta PF1            ; 3 53
;       nop                ; 2 55
;       nop                ; 2 57
;       nop                ; 2 59
;       nop                ; 2 61
;       nop                ; 2 63
;       lda #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
;       sta CTRLPF         ; 3 68
        sta WSYNC          ; 3 71 end of line

        lda Wall4R         ; 3
        sta PF1            ; 3 6
        dec KingIndex       ; 5 11 update king graphic pointer
        ldx #ENABL         ; 2 13
        txs                ; 2 15
        nop                ; 2 17
        nop                ; 2 19
        nop                ; 2 21
        nop                ; 2 23
        lda #$15           ; 2 25 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 28
        inc KingIndex       ;10 38 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        inc KingIndex       ;10 48 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        lda Wall2L         ; 3 51
        sta PF1            ; 3 54
;       nop                ; 2 56
;       nop                ; 2 58
;       dey                ; 2 60
;       lda Wall4R+1       ; 3 63
;       ldx #$13           ; 2 65


        ldy #6             ; 2 56
        lda #0             ; 2 58 turn off players and playfield
        sta GRP0           ; 3 61
        sta GRP1           ; 3 64
        sta PF1            ; 3 67
        sta PF1            ; 3 70
        sta REFP1          ; 3 73 turn off "flip player 1"
        sta ENABL          ; 3 76 turn off ball
        sta ENAM0          ; 3    turn off missile 0
        sta ENAM1          ; 3  6 turn off missle 1
        lda #%100          ; 2  8 set both players to 2 copies far
        sta NUSIZ0         ; 3 11 so we can display score
        sta NUSIZ1         ; 3 14
        lda #>Digits       ; 2 16 +-----
        sta Score1+1       ; 3 19 | reset score high pointers
        sta Score2+1       ; 3 22 | as they're used as Temp Variables
        sta Score3+1       ; 3 25 | during the rest of the program
        sta Score4+1       ; 3 28 +-----
        sta RESP0          ; 3 31
        nop                ; 2 33
        nop                ; 2 35
        nop                ; 2 37
        sta RESP1          ; 3 40

 IF DEBUG = 1
        lda DebugVB
        and #$0f
        tax
        lda Times7,x
        sta Score4
        lda DebugVB
        lsr
        lsr
        lsr
        lsr
        tax
        lda Times7,x
        sta Score1
        lda DebugOS
        and #$0f
        tax
        lda Times7,x
        sta Score3
        lda DebugOS
        lsr
        lsr
        lsr
        lsr
        tax
        lda Times7,x
        sta Score2
        sta WSYNC          ; have 2 extra scanlines instead of one so PAL
                           ; version stays in color
 ENDIF


ScoreKernel
        sta WSYNC
        lda #ShieldColor1  ; 2
        sta COLUP0         ; 3  5
        lda (Score1),y     ; 5 10
        sta GRP0           ; 3 13
        lda #ShieldColor4  ; 2 15
        sta COLUP1         ; 3 18
        lda (Score4),y     ; 5 23
        sta GRP1           ; 3 26
        lda #ShieldColor2  ; 2 28
        nop
        nop
        nop
        sta COLUP0         ; 3 31
        lda (Score2),y     ; 5 36
        sta GRP0           ; 3 39
        lda #ShieldColor3  ; 2 41
        sta COLUP1         ; 3 44
        lda (Score3),y     ; 5 49
        sta GRP1           ; 3 52
        dey
        bpl ScoreKernel
        REPEND

        jmp OverscanGame


InitSystemCode
        CLEAN_START
        lda #%00001111    ; 4 player game
;        lda #%00000001    ; 1 player game - for web site
        sta HumanPlayers
        lda #%10111011    ; Attract Mode, brick & king flash, speed 3(1-4), 3 fireballs
;        lda #%10001011    ; Attract Mode, no flash, speed 3(1-4), 3 fireballs
        sta GameOptions
        lda #5
        sta GameOptions2  ; Not Limited Catch - 5 games to win,
	lda #%11110000
	sta GameOptions3  ; Catch on for all players
        lda #64
        sta Player1Y
        sta Player3Y
        lda #24
        sta Player2Y
        sta Player4Y
        sta Player1X
        sta Player4X
        lda #140
        sta Player2X
        sta Player3X
        sta rand
        lda #ATTRACT_DELAY
        sta ExtraFireball   ; used to track start of attract mode
        jmp VerticalBlankMenu


ProcessDragonAnimationCode
        ldx #0             ; x=0 means not a new frame
        lda DragonControl
        and #%00011111
        beq PDAadvanced
        dec DragonControl
        bne PDAnotAdvanced
PDAadvanced
        ldx #1             ; x=1 means new frame
        lda DragonFrame
        clc
        adc #2
        sta DragonFrame
PDAnotAdvanced
        lda Dragonptr+1 ; get the high byte of the sequence
        cmp #>DragonSequence0
        bcs PDAthisBank      ; if => Dragon Sequence 0 then data's in this bank
        cmp #>(GetBank6SequenceDataCode)+1
        bcs PDAb7            ; if >= Bank 6's code, then data in bank 7
        jmp GetBank6SequenceData
PDAb7
        jmp GetBank7SequenceData

PDAthisBank
        lda DragonFrame
        tay
        lda (Dragonptr),y
        sta TempFrame
        iny
        lda (Dragonptr),y
        sta TempDuration

ReturnDataCode    ; return here from call to get sequence data from bank 6 or 7

        lda DragonDirection
        and #%00000001
        beq DragonFlyingRight
        jmp DragonFlyingLeft

DragonFlyingRight
        cpx #0             ; if X is 0 then we didn't start a new frame
        beq DFRadvanceX
; new frame started so process triggers

        lda TempDuration
        and #%00011111
        ora DragonControl
        sta DragonControl

        lda TempFrame
        asl
        bpl DFRnoFlapSound
        bit GameOptions
        bmi DFRnoSoundRight ; no sound effects during DEMO
        lda #SoundFlap
        ldx DragonX
        cpx #95
        bcs DFRnoSoundLeft
        sta SoundLeft
DFRnoSoundLeft
        cpx #60
        bcc DFRnoSoundRight
        sta SoundRight
DFRnoSoundRight
        jmp DFRadvanceX


DFRnoFlapSound
        asl
        bpl DFRadvanceX
        bit GameOptions
        bmi DFRinitFireball ; no sound effects during DEMO
        lda #SoundLaunch
        sta SoundLeft
        sta SoundRight
DFRinitFireball
        lda DragonX
        sec
        sbc #1
        sta M0xPosHigh
        lda rand
        and #7
        tay
        lda DragonAnim
        and #%00010000
        bne DFRlaunchDown
        lda #57
        sta M0yPosHigh
        lda DFRup,y
        sta M0DirSpeed
        bne DFRadvanceX
DFRlaunchDown
        lda #40
        sta M0yPosHigh
        lda DFRdown,y
        sta M0DirSpeed

DFRadvanceX
        lda TempDuration  ; check if sequence done (neg number)
        bpl DFRadvanceX2

        lda FireBallsInPlay ; if sequence is done, then check if fireball in play
        beq DFRnextSequence
        jmp TurnOffDragon

DFRnextSequence
        lda DragonPass    ; fireball not yet launched so dec the DragonPass
        sec
        sbc #$10
        and #%00110000
        tay
        lda DragonPass
        and #%11001111
        sta DragonPass
        tya
        ora DragonPass
        sta DragonPass
        ldx DragonX
        cpx #40
        bcc DFRnotLaunch
        cpx #120
        bcc DFRlaunchSequence
DFRnotLaunch
        and #%00110000
        bne DFRnotInitLaunch

        lda rand
        asl
        asl
        and #%00010000
        ora #%11000000  ;pick sequence 12 or 13 for stop for launch from the right
        jmp DFRsetNextSequence

DFRnotInitLaunch
        ; figure out next sequence here
        lda rand
        and #%00010000
        ora #%01100000  ; pick sequence 6 or 7 for fly across
        jmp DFRsetNextSequence

DFRlaunchSequence
        lda DragonAnim
        and #%00010000  ; launch & leave left(0 or 1 based on direction)
        ; randomly make it 8 or 9 for alternate launch & leave
        bit rand
        bpl DFRsetNextSequence
        ora #%10000000

DFRsetNextSequence
        sta DragonAnim
        lda #0          ; ends up starting at 2nd pair of bytes
        sta DragonFrame ; this lets us reuse initial sequences
        lda #%00000001  ; flip dragon's direction
        eor DragonDirection
        sta DragonDirection
        jmp DFRsetFrame


DFRadvanceX2
        rol               ; 76 speed
        rol               ; c7
        rol               ; 0c
        rol               ; 10
        and #%11
        beq DFRsetFrame
        cmp #%11
        beq DFRhalfSpeed
        cmp #%10
        beq DFRquarterSpeed
        inc DragonX
        jmp DFRsetFrame
DFRhalfSpeed
        lda Frame
        and #%1
        bne DFRsetFrame
        inc DragonX
        jmp DFRsetFrame
DFRquarterSpeed
        lda Frame
        and #%11
        bne DFRsetFrame
        inc DragonX
DFRsetFrame
        lda TempFrame
        and #%10011111       ; filter out flap and launch triggers
        clc
        adc #SmoothFrames
        tay    ; y holds frame, 7 bit = flip image
        ldx #0 ; signals to continue onto game
        jmp SetDragonFrame


DFRup   .byte 32+26,32+27,32+28,32+29,32+30,32+27,32+28,32+29
DFRdown .byte 32+18,32+19,32+20,32+21,32+22,32+19,32+20,32+21
DFLup   .byte 32+2, 32+3, 32+4, 32+5, 32+6, 32+3, 32+4, 32+5
DFLdown .byte 32+10,32+11,32+12,32+13,32+14,32+11,32+12,32+13


DragonFlyingLeft
        cpx #0             ; if X is 0 then we didn't start a new frame
        beq DFLadvanceX
; new frame started so process triggers

        lda TempDuration
        and #%00011111
        ora DragonControl
        sta DragonControl

        lda TempFrame
        asl
        bpl DFLnoFlapSound
        bit GameOptions
        bmi DFLnoSoundRight ; no sound effects during DEMO
        lda #SoundFlap
        ldx DragonX
        cpx #100
        bcs DFLnoSoundLeft
        sta SoundLeft
DFLnoSoundLeft
        cpx #60
        bcc DFLnoSoundRight
        sta SoundRight
DFLnoSoundRight
        jmp DFLadvanceX


DFLnoFlapSound
        asl
        bpl DFLadvanceX
        bit GameOptions
        bmi DFLinitFireball ; no sound effects during DEMO
        lda #SoundLaunch
        sta SoundLeft
        sta SoundRight
DFLinitFireball
        lda DragonX
        clc
        adc #17
        sta M0xPosHigh
        lda rand
        and #7
        tay
        lda DragonAnim
        and #%00010000
        bne DFLlaunchDown
        lda #57
        sta M0yPosHigh
        lda DFLup,y
        sta M0DirSpeed
        bne DFLadvanceX
DFLlaunchDown
        lda #40
        sta M0yPosHigh
        lda DFLdown,y
        sta M0DirSpeed

DFLadvanceX
        lda TempDuration  ; check if sequence done (neg number)
        bpl DFLadvanceX2

        lda FireBallsInPlay ; if sequence is done, then check if fireball in play
        beq DFLnextSequence
        jmp TurnOffDragon

DFLnextSequence
        lda DragonPass    ; nope, so dec the DragonPass
        sec
        sbc #$10
        and #%00110000
        tay
        lda DragonPass
        and #%11001111
        sta DragonPass
        tya
        ora DragonPass
        sta DragonPass
        ldx DragonX
        cpx #40
        bcc DFLnotLaunch
        cpx #120
        bcc DFLlaunchSequence

DFLnotLaunch
        and #%00110000
        bne DFLnotInitLaunch

        lda rand
        asl
        asl
        and #%00010000
        ora #%01000000  ;pick sequence 4 or 5 for a launch from the left
        jmp DFLsetNextSequence

DFLnotInitLaunch
        ; figure out next sequence here
        lda rand
        and #%00010000
        ora #%01100000 ; pick sequence 6 or 7 for fly across
        jmp DFLsetNextSequence


DFLlaunchSequence
        lda DragonAnim
        cmp #$E0
        bcc DFLnormalLaunch
        bit rand
        bmi DFLnormalLaunch

        lda #%00000001  ; flip dragon's direction
        eor DragonDirection
        sta DragonDirection

        lda DragonAnim
        and #%00010000  ; launch & leave left(0 or 1 based on direction)
        ; randomly make it 8 or 9 for alternate launch & leave
        bit rand
        bpl DFLsetNextSequence
        ora #%10000000
        jmp DFLsetNextSequence

DFLnormalLaunch
        lda DragonAnim
        and #%00010000  ; save the up/down
        ora #%00100000  ; and set launch & leave right(2 or 3)
        ; add code here for making it 10 or 11 for alternate launch & leave
        bit rand
        bpl DFLsetNextSequence
        ora #%10000000
DFLsetNextSequence
        sta DragonAnim
        lda #0          ; ends up starting at 2nd pair of bytes
        sta DragonFrame ; this lets us reuse initial sequences
        lda #%00000001  ; flip dragon's direction
        eor DragonDirection
        sta DragonDirection
        jmp DFLsetFrame

DFLadvanceX2
        rol               ; 76 speed
        rol               ; c7
        rol               ; 0c
        rol               ; 10
        and #%11
        beq DFLsetFrame
        cmp #%11
        beq DFLhalfSpeed
        cmp #%10
        beq DFLquarterSpeed
        dec DragonX
        lda DragonAnim
        cmp #$E0
        bcc DFLnormalSpeed
DFLqto1
        dec DragonX  ; double speed for chase-off sequences
DFLnormalSpeed
        jmp DFLsetFrame
DFLhalfSpeed
        lda Frame
        and #%1
        bne DFLsetFrame
        dec DragonX
        jmp DFLsetFrame
DFLquarterSpeed
        lda DragonAnim
        cmp #$E0
        bcs DFLqto1   ; treat quarter speed as 1 during chase sequences
        lda Frame
        and #%11
        bne DFLsetFrame
        dec DragonX
DFLsetFrame
        lda TempFrame
        and #%10011111       ; filter out flap and launch triggers
        eor #%10000000       ; flip direction
        clc
        adc #SmoothFrames
        tay    ; y holds frame, 7 bit = flip image
        ldx #0 ; signals to continue onto game
        jmp SetDragonFrame

TurnOffDragon
        lda #0            ; turn off the dragon & make sure other images(demo,
        sta DragonControl ; knight) are in the correct direction
        sta DragonX
        lda INTIM
        sta DebugOS
B5OverscanWait:
        lda SWCHB
        eor #$FF
        and #%00000011
        bne B5SelectOrReset
        ldx INTIM
        bpl B5OverscanWait
        jmp VerticalBlankGame
B5SelectOrReset
        lda #ATTRACT_DELAY
        sta ExtraFireball
        lda #0             ; reset music
        sta SPbeat
        sta SPtempoCount
        sta SPmeasure
        jmp OverscanMenu2



qs = 2
hs = 3
; sequence is a pair of bytes.
;  bit   byte1             byte 2
;   7  1=flip             1=done
;   6  1=flap sound        speed  0-1 normal
;   5  1=launch            speed  3=half speed, 2=quarter speed
;   4  frame              duration
;   3  frame              duration
;   2  frame              duration
;   1  frame              duration
;   0  frame              duration

DragonSequence0  ; launch up-right then fly off to the left.  Variation 1
        .byte 0, 0 ; dummy frame
        .byte      FlipImage + F1s3 ,    Speed0 + Dur12
        .byte      FlipImage + F3s3 ,    Speed0 + Dur18 ; pause
        .byte      FlipImage + F2s3 ,    Speed0 + Dur12
        .byte      FlipImage + F4s3 ,    Speed0 + Dur18 ; pause
        .byte      FlipImage + F5s3 ,    Speed0 + Dur12
        .byte      FlipImage + F6s3 ,    Speed0 + Dur6
        .byte LaunchFireball + FlipImage + F8s3 ,    Speed0 + Dur18
        .byte      FlipImage + F5s3 ,    Speed0 + Dur6
        .byte      FlipImage + F6s3 ,    Speed0 + Dur6
        .byte                  F6s2 ,    Speed0 + Dur6
        .byte                  F4s2 ,    Speed0 + Dur12
        .byte                  F3s2 ,    Speed0 + Dur12
        .byte                  F4s2 ,    Speed0 + Dur12
        .byte                  F3s2 ,    Speed0 + Dur12
        .byte                  F4s2 ,    Speed0 + Dur12
        .byte                  F3dd ,    Speed0 + Dur12
        .byte                  F4dd ,    Speed0 + Dur6
        .byte                  F1dd ,    Speed0 + Dur6
        .byte                  F2dd ,    Speed0 + Dur18 ; pause
        .byte                  F1dd ,    Speed0 + Dur18 ; pause
        .byte                  F4dd ,    Speed0 + Dur6
        .byte                  F3s2 ,    Speed0 + Dur6       ;        71
        .byte      FlapSound + F1s2 ,    SpeedHalf + Dur4    ;      2 69
        .byte                  F4s1 ,    SpeedHalf + Dur4    ;      2 67
        .byte                  F1s1 ,    SpeedHalf + Dur4    ;      2 65
        .byte                  F2s2 ,    SpeedQuarter + Dur8 ;      2 63
        .byte                  F1s2 ,    SpeedQuarter + Dur8 ;      2 61
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ;      2 59
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 55
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 51
        .byte                  F1s1 ,    Speed1 + Dur4       ;      4 47
        .byte                  F2s2 ,    Speed1 + Dur10      ;     10 37
        .byte                  F1s2 ,    SpeedHalf + Dur10   ;10/2  5 32
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ; 8/4  2 30
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 26
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 22
        ; note - must transition on/off screen using F1s1
        .byte                  F1s1 ,    Speed1 + Dur22      ;     22  0
        .byte                  F1s1 , EndSeq   ; transition frame

DragonSequence1 ;launch down-right then fly off to the left, variation 2
        .byte 0, 0 ; dummy frame
        .byte      FlipImage + F3s4 ,    Speed0 + Dur6
        .byte      FlipImage + F4s4 ,    Speed0 + Dur6
        .byte      FlipImage + F5s4 ,    Speed0 + Dur6
        .byte      FlipImage + F6s4 ,    Speed0 + Dur6
        .byte LaunchFireball + FlipImage + F7s4 ,    Speed0 + Dur18
        .byte      FlipImage + F6s4 ,    Speed0 + Dur6
        .byte      FlipImage + F5s4 ,    Speed0 + Dur6
        .byte      FlipImage + F4s4 ,    Speed0 + Dur6
        .byte      FlipImage + F3s4 ,    Speed0 + Dur6
        .byte      FlipImage + F2s4 ,    Speed0 + Dur6
        .byte                  F3s4 ,    Speed0 + Dur6
        .byte                  F4s4 ,    Speed0 + Dur6
        .byte                  F1s5 ,    Speed0 + Dur6
        .byte                  F1s2 ,    Speed0 + Dur6
        .byte                  F2s2 ,    Speed0 + Dur6
        .byte                  F4s1 ,    Speed0 + Dur6       ;        71
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 67
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 63
        .byte                  F1s1 ,    Speed1 + Dur10      ;     10 53
        .byte                  F2s1 ,    Speed1 + Dur10      ;     10 43
        .byte                  F3s1 ,    SpeedHalf + Dur10   ;10/2  5 38
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ; 8/4  2 36
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 32
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 28
        ; note - must transition on/off screen using F1s1
        .byte                  F1s1 ,    Speed1 + Dur28      ;     28  0
        .byte                  F1s1 , EndSeq   ; transition frame

DragonSequence6 ; fly across, turn variation 1
        .byte                  F1s1 ,    Speed1 + Dur20      ;     20 20
        .byte                  F2s2 ,    SpeedHalf + Dur4    ; 4/2  2 22
        .byte                  F1s2 ,    SpeedQuarter + Dur8 ; 8/4  2 24
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ; 8/4  2 26
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 30
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 34
        .byte                  F1s1 ,    Speed1 + Dur10      ;     10 44
        .byte                  F2s2 ,    Speed1 + Dur10      ;     10 54
        .byte                  F1s2 ,    SpeedHalf + Dur10   ;10/2  5 59
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ; 8/4  2 61
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 65
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 69
        .byte                  F1s1 ,    Speed1 + Dur10      ;     10 79
        .byte                  F2s1 ,    Speed1 + Dur10      ;     10 89
        .byte                  F3s1 ,    SpeedHalf + Dur10   ;10/2  5 94
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ; 8/4  2 96
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 100
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 104
        .byte                  F1s1 ,    Speed1 + Dur10      ;     10 114
        .byte                  F2s1 ,    Speed1 + Dur10      ;     10 124
        .byte                  F1s2 ,    SpeedHalf + Dur10   ;10/2  5 129
        .byte                  F2s2 ,    SpeedQuarter + Dur4 ; 4/4  1 130
        .byte                  F3s2 ,    Speed0 + Dur6
        .byte                  F4s2 ,    Speed0 + Dur6
        .byte                  F5s2 ,    Speed0 + Dur6
        .byte                  F1s4 ,    Speed0 + Dur6
        .byte      FlipImage + F3s4 ,    Speed0 + Dur6
        .byte      FlipImage + F4s4 ,    Speed0 + Dur6
        .byte      FlipImage + F1s5 ,    Speed0 + Dur6
        .byte      FlipImage + F1s2 ,    Speed0 + Dur6
        .byte      FlipImage + F2s2 ,    Speed0 + Dur6
        .byte      FlipImage + F4s1 ,    Speed0 + Dur6
        .byte      FlipImage + F4s1 , EndSeq   ; transition frame

DragonSequence7  ; fly across, turn variation 2
        .byte                  F1s1 ,    Speed1 + Dur20      ;     20 20
        .byte                  F2s2 ,    SpeedHalf + Dur4    ; 4/2  2 22
        .byte                  F1s2 ,    SpeedQuarter + Dur8 ; 8/4  2 24
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ; 8/4  2 26
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 30
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 34
        .byte                  F1s1 ,    Speed1 + Dur10      ;     10 44
        .byte                  F2s2 ,    Speed1 + Dur10      ;     10 54
        .byte                  F1s2 ,    SpeedHalf + Dur10   ;10/2  5 59
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ; 8/4  2 61
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 65
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 69
        .byte                  F1s1 ,    Speed1 + Dur10      ;     10 79
        .byte                  F2s1 ,    Speed1 + Dur10      ;     10 89
        .byte                  F3s1 ,    SpeedHalf + Dur10   ;10/2  5 94
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ; 8/4  2 96
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 100
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 104
        .byte                  F1s1 ,    Speed1 + Dur10      ;     10 114
        .byte                  F2s1 ,    Speed1 + Dur10      ;     10 124
        .byte                  F3s1 ,    SpeedHalf + Dur10   ;10/2  5 129
        .byte                  F2s1 ,    SpeedQuarter + Dur4 ; 4/4  1 130
        .byte                  F1s2 ,    Speed0 + Dur6
        .byte                  F2s2 ,    Speed0 + Dur6
        .byte                  F3s2 ,    Speed0 + Dur6
        .byte                  F4s2 ,    Speed0 + Dur6
        .byte                  F3dd ,    Speed0 + Dur6
        .byte      FlipImage + F4dd ,    Speed0 + Dur6
        .byte      FlipImage + F2dd ,    Speed0 + Dur6
        .byte      FlipImage + F3s2 ,    Speed0 + Dur6
        .byte      FlipImage + F2s2 ,    Speed0 + Dur6
        .byte      FlipImage + F4s1 ,    Speed0 + Dur6
        .byte      FlipImage + F4s1 , EndSeq   ; transition frame

DragonSequence4  ; from left position for launch up

        .byte                  F1s1 ,    Speed1 + Dur20      ;     20 20
        .byte                  F2s2 ,    SpeedHalf + Dur4    ; 4/2  2 22
        .byte                  F1s2 ,    SpeedQuarter + Dur8 ; 8/4  2 24
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ; 8/4  2 26
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 30
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 34
        .byte                  F1s2 ,    Speed1 + Dur10      ;     10 44
        .byte                  F2s2 ,    Speed1 + Dur10      ;     10 54
        .byte                  F3s2 ,    SpeedHalf + Dur10   ;10/2  5 59
        .byte                  F4s2 ,    SpeedHalf + Dur10   ;10/2  5 64
        .byte                  F5s2 ,    SpeedQuarter + Dur16;16/4  4 68
        .byte                  F6s2 ,    SpeedQuarter + Dur12;12/4  3 71
        .byte                  F7s2 ,    Speed0 + Dur6
        .byte      FlipImage + F1s3 ,    Speed0 + Dur6
        .byte      FlipImage + F2s3 ,    Speed0 + Dur6
        .byte      FlipImage + F3s3 ,    Speed0 + Dur6
        .byte      FlipImage + F4s3 ,    Speed0 + Dur18 ; pause
        .byte      FlipImage + F5s3 ,    Speed0 + Dur6
        .byte      FlipImage + F1s3 ,    Speed0 + Dur6
        .byte      FlipImage + F3s3 ,    Speed0 + Dur18 ; pause
        .byte      FlipImage + F1s3 ,    Speed0 + Dur6
        .byte                  F7s2 ,    Speed0 + Dur6
        .byte                  F7s2 ,    EndSeq


DragonSequence5 ; from left position for launch down
        .byte                  F1s1 ,    Speed1 + Dur20      ;     20 20
        .byte                  F2s2 ,    SpeedHalf + Dur4    ; 4/2  2 22
        .byte                  F1s2 ,    SpeedQuarter + Dur8 ; 8/4  2 24
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ; 8/4  2 26
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 30
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 34
        .byte                  F1s2 ,    Speed1 + Dur10      ;     10 44
        .byte                  F2s2 ,    Speed1 + Dur10      ;     10 54
        .byte                  F3s2 ,    SpeedHalf + Dur10   ;10/2  5 59
        .byte                  F4s2 ,    SpeedHalf + Dur10   ;10/2  5 64
        .byte                  F5s2 ,    SpeedQuarter + Dur16;16/4  4 68
        .byte                  F6s2 ,    SpeedQuarter + Dur12;12/4  3 71
        .byte                  F1s4 ,    Speed0 + Dur6
        .byte                  F2s4 ,    Speed0 + Dur6
        .byte      FlipImage + F3s4 ,    Speed0 + Dur6
        .byte      FlipImage + F4s4 ,    Speed0 + Dur6
        .byte      FlipImage + F5s4 ,    Speed0 + Dur18
        .byte      FlipImage + F4s4 ,    Speed0 + Dur6
        .byte      FlipImage + F3s4 ,    Speed0 + Dur6
        .byte                  F2s4 ,    Speed0 + Dur6
        .byte                  F2s4 ,    EndSeq









        echo "----",($FE00 - *) , "bytes of BANK 5 ROM left"



        ORG $CE00
        RORG $FE00


Digits:
       .byte zz____X___ ; ZERO
       .byte zz__XX_X__
       .byte zz_XX___X_
       .byte zz_X____X_
       .byte zz_X___XX_
       .byte zz__X_XX__
       .byte zz___X____

       .byte zz____X___ ; ONE
       .byte zz____XX__
       .byte zz____XX__
       .byte zz__X_XX__
       .byte zz___XXX__
       .byte zz____XX__
       .byte zz_____X__

       .byte zz____XXX_ ; TWO
       .byte zz_XXXX___
       .byte zz__X_____
       .byte zz___XX___
       .byte zz_____X__
       .byte zz__X___X_
       .byte zz___XXX__

       .byte zz___XX___ ; THREE
       .byte zz__XX_X__
       .byte zz_XX___X_
       .byte zz______X_
       .byte zz____XX__
       .byte zz__X___X_
       .byte zz___XXX__

       .byte zz____X___ ; FOUR
       .byte zz____XX__
       .byte zz_XXXXX__
       .byte zz__X_XX__
       .byte zz___XXX__
       .byte zz____XX__
       .byte zz_____X__


       .byte zz__XXX___ ; FIVE
       .byte zz_X___X__
       .byte zz______X_
       .byte zz_X___X__
       .byte zz_XXXX___
       .byte zz_X______
       .byte zz_XXXXXX_

       .byte zz___XX___ ; SIX
       .byte zz__XX_X__
       .byte zz_XX___X_
       .byte zz_X_XXX__
       .byte zz_X______
       .byte zz__X__X__
       .byte zz___XX___

       .byte zz___X____ ; SEVEN
       .byte zz___X____
       .byte zz___X____
       .byte zz____X___
       .byte zz_____X__
       .byte zz______X_
       .byte zz_XXXXXX_

       .byte zz___XX___ ; EIGHT
       .byte zz__XX_X__
       .byte zz_XX__XX_
       .byte zz_XX_XX__
       .byte zz___XXX__
       .byte zz__XX__X_
       .byte zz___XXX__

       .byte zz___XX___ ; NINE
       .byte zz__X__X__
       .byte zz______X_
       .byte zz__XXX_X_
       .byte zz_X___XX_
       .byte zz__X_XX__
       .byte zz___XX___

       .byte zz_X_____X ; A (TEN)
       .byte zz_X_____X
       .byte zz_X_____X
       .byte zz_XXXXXXX
       .byte zz__X___X_
       .byte zz___X_X__
       .byte zz____X___

       .byte zz_XXXX___ ; B (ELEVEN)
       .byte zz_X___X__
       .byte zz_X___X__
       .byte zz_XXXX___
       .byte zz_X___X__
       .byte zz_X___X__
       .byte zz_XXXX___

       .byte zz__XXX___ ; C (TWELVE)
       .byte zz_X___X__
       .byte zz_X______
       .byte zz_X______
       .byte zz_X______
       .byte zz_X___X__
       .byte zz__XXX___

       .byte zz_XXXX___ ; D (THIRTEEN)
       .byte zz_X___X__
       .byte zz_X____X_
       .byte zz_X____X_
       .byte zz_X____X_
       .byte zz_X___X__
       .byte zz_XXXX___

       .byte zz_XXXXXX_ ; E (FORTEEN)
       .byte zz_X______
       .byte zz_X______
       .byte zz_XXXX___
       .byte zz_X______
       .byte zz_X______
       .byte zz_XXXXXX_

       .byte zz_X______ ; F (FIFTEEN)
       .byte zz_X______
       .byte zz_X______
       .byte zz_XXXX___
       .byte zz_X______
       .byte zz_X______
       .byte zz_XXXXXX_

       .byte 0,0,0,0,0,0,0 ; blank

Times7  .byte $0,7,14,21,28,35,42,49,56,63,70,77,84,91,98,105



        ORG $CF00
        RORG $FF00
;PosObject
;        sec
;        sta WSYNC
;DivideLoop
;        sbc #15
;        bcs DivideLoop ;+4    4
;
;        eor #7
;        asl
;        asl
;        asl
;        asl            ;+10  14
;
;        sta.wx HMP0,X  ;+5   19
;        sta RESP0,X    ;+4   23
;
;        sta WSYNC
;        rts




BottomKing
        .byte zzX_X_____ ; test king shape for color write cycle
        .byte zzX_XX____
        .byte zzX_XX____
        .byte zz___X____
        .byte zz_X_X____
        .byte zzXXX_____
        .byte zzXXX_____
        .byte zz_X______
        .byte 0,0,0,0,0,0,0,0 ; shape for 2 dead kings

BottomKing5thBit
        .byte zz________
        .byte zzX_______
        .byte zzX_______
        .byte zzX_______
        .byte zzX_______
        .byte zz________
        .byte zz________
        .byte zz________
        .byte 0,0,0,0,0,0,0,0 ; shape for 2 dead kings


BottomShieldFacingUp
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows
        .byte zz________
        .byte zzX______X
        .byte zzXX____XX
        .byte zzXXXXXXXX
        .byte zzXXXXXXXX
        .byte zz_XXXXXX_
        .byte zz__XXXX__
        .byte zz________

BottomShieldDead
        .byte 0,0,0,0,0,0,0,0 ; for "dead" shape
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows

BottomShieldFacingSideways
        .byte zzXXXXX___
        .byte zz_XXXXX__
        .byte zz__XXXXX_
        .byte zz__XXXXX_
        .byte zz__XXXXX_
        .byte zz_XXXXX__
        .byte zzXXXXX___
        .byte zz________
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows



BottomShieldFacingDiagonal

        .byte zz____X___
        .byte zz____XX__
        .byte zz____XXX_
        .byte zz___XXXXX
        .byte zzXXXXXXXX
        .byte zz_XXXXXXX
        .byte zz__XXXXX_
        .byte zz___XXX__
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows




        ORG $CFEB
        RORG $FFEB
SetDragonFrame
        cmp SelectBank4
        jmp SetDragonFrameCode
        jmp ProcessDragonAnimationCode
        BANKS_AND_VECTORS


;--------------------------------------------------------------------
; bank 6 - Selection Menu Vertical Blank, Display Kernel and Overscan
;--------------------------------------------------------------------



        ORG $D000
        JUMP_TABLE
GetBank6SequenceData
        cmp SelectBank6
        jmp GetBank6SequenceDataCode
GetBank7SequenceData
        cmp SelectBank7
        jmp GetBank7SequenceDataCode
ReturnData
        cmp SelectBank5
        jmp ReturnDataCode


Show48graphic SUBROUTINE
        ; call with Y holding the lines-1 to show
        ; G48 thru G48+$B must be preloaded with pointers to the
        ; 48 pixel graphic image
        STY G48temp1
;        sta WSYNC
.graphicLoop
        ldy G48temp1         ;+3  63  189
        lda (G48),y          ;+5  68  204
        sta GRP0             ;+3  71  213      D1     --      --     --
        sta WSYNC            ;go
        lda (G48+$2),y       ;+5   5   15
        sta GRP1             ;+3   8   24      D1     D1      D2     --
        lda (G48+$4),y       ;+5  13   39
        sta GRP0             ;+3  16   48      D3     D1      D2     D2
        lda (G48+$6),y       ;+5  21   63
        sta G48temp2         ;+3  24   72
        lda (G48+$8),y       ;+5  29   87
        tax                  ;+2  31   93
        lda (G48+$A),y       ;+5  36  108
        tay                  ;+2  38  114
        lda G48temp2         ;+3  41  123              !
        sta GRP1             ;+3  44  132      D3     D3      D4     D2!
        stx GRP0             ;+3  47  141      D5     D3!     D4     D4
        sty GRP1             ;+3  50  150      D5     D5      D6     D4!
        sta GRP0             ;+3  53  159      D4*    D5!     D6     D6
        dec G48temp1         ;+5  58  174                             !
        bpl .graphicLoop     ;+2  60  180
        lda #0
        sta GRP0
        sta GRP1
        sta GRP0
        sta GRP1
        rts

; put bank 6 dragon sequences here
;              128  64   32
;             flip flap launch frame    hold-for-x-frames
DragonSequence12  ; from left position for launch up
        .byte 0, 0 ; dummy frame
        .byte                  F1s1 ,    Speed1 + Dur8       ;      8
        .byte                  F2s2 ,    SpeedHalf + Dur4    ; 4/2  2 22
        .byte                  F1s2 ,    SpeedQuarter + Dur8 ; 8/4  2 24
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ; 8/4  2 26
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 30
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 34
        .byte                  F1s2 ,    Speed1 + Dur10      ;     10 44
        .byte                  F2s2 ,    Speed1 + Dur10      ;     10 54
        .byte                  F3s2 ,    SpeedHalf + Dur10   ;10/2  5 59
        .byte                  F4s2 ,    SpeedHalf + Dur10   ;10/2  5 64
        .byte                  F5s2 ,    SpeedQuarter + Dur16;16/4  4 68
        .byte                  F6s2 ,    SpeedQuarter + Dur12;12/4  3 71
        .byte                  F7s2 ,    Speed0 + Dur6
        .byte      FlipImage + F1s3 ,    Speed0 + Dur6
        .byte      FlipImage + F2s3 ,    Speed0 + Dur6
        .byte      FlipImage + F3s3 ,    Speed0 + Dur6
        .byte      FlipImage + F4s3 ,    Speed0 + Dur18 ; pause
        .byte      FlipImage + F5s3 ,    Speed0 + Dur6
        .byte      FlipImage + F1s3 ,    Speed0 + Dur6
        .byte      FlipImage + F3s3 ,    Speed0 + Dur18 ; pause
        .byte      FlipImage + F1s3 ,    Speed0 + Dur6
        .byte                  F7s2 ,    Speed0 + Dur6
        .byte                  F7s2 ,    EndSeq


DragonSequence13 ; from left position for launch down
        .byte 0, 0 ;dummy frame
        .byte                  F1s1 ,    Speed1 + Dur8      ;       8
        .byte                  F2s2 ,    SpeedHalf + Dur4    ; 4/2  2 22
        .byte                  F1s2 ,    SpeedQuarter + Dur8 ; 8/4  2 24
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ; 8/4  2 26
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 30
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 34
        .byte                  F1s2 ,    Speed1 + Dur10      ;     10 44
        .byte                  F2s2 ,    Speed1 + Dur10      ;     10 54
        .byte                  F3s2 ,    SpeedHalf + Dur10   ;10/2  5 59
        .byte                  F4s2 ,    SpeedHalf + Dur10   ;10/2  5 64
        .byte                  F5s2 ,    SpeedQuarter + Dur16;16/4  4 68
        .byte                  F6s2 ,    SpeedQuarter + Dur12;12/4  3 71
        .byte                  F1s4 ,    Speed0 + Dur6
        .byte                  F2s4 ,    Speed0 + Dur6
        .byte      FlipImage + F3s4 ,    Speed0 + Dur6
        .byte      FlipImage + F4s4 ,    Speed0 + Dur6
        .byte      FlipImage + F5s4 ,    Speed0 + Dur18
        .byte      FlipImage + F4s4 ,    Speed0 + Dur6
        .byte      FlipImage + F3s4 ,    Speed0 + Dur6
        .byte                  F2s4 ,    Speed0 + Dur6
        .byte                  F2s4 ,    EndSeq



DragonSequence2  ; launch up-right then fly off to the left variation 1

        .byte 0, 0 ; dummy frame
        .byte      FlipImage + F1s3 ,    Speed0 + Dur6
        .byte      FlipImage + F2s3 ,    Speed0 + Dur6
        .byte      FlipImage + F3s3 ,    Speed0 + Dur6
        .byte      FlipImage + F4s3 ,    Speed0 + Dur18 ; pause
        .byte      FlipImage + F5s3 ,    Speed0 + Dur6
        .byte      FlipImage + F4s3 ,    Speed0 + Dur18 ; pause
        .byte      FlipImage + F5s3 ,    Speed0 + Dur6
        .byte      FlipImage + F6s3 ,    Speed0 + Dur6
        .byte      FlipImage + F7s3 ,    Speed0 + Dur6
        .byte LaunchFireball + FlipImage + F8s3 ,    Speed0 + Dur18
        .byte      FlipImage + F7s3 ,    Speed0 + Dur6
        .byte      FlipImage + F5s3 ,    Speed0 + Dur6
        .byte      FlipImage + F6s3 ,    Speed0 + Dur6
        .byte      FlipImage + F1s4 ,    Speed0 + Dur6
        .byte                  F2s4 ,    Speed0 + Dur6
        .byte                  F3s4 ,    Speed0 + Dur6
        .byte                  F4s4 ,    Speed0 + Dur6
        .byte                  F1s5 ,    Speed0 + Dur6
        .byte                  F3s2 ,    Speed0 + Dur6
        .byte                  F2s2 ,    Speed0 + Dur6
        .byte                  F1s2 ,    Speed0 + Dur6
        .byte                  F4s1 ,    Speed0 + Dur6       ;        71
        .byte      FlapSound + F3s1 ,    SpeedHalf + Dur4    ;      2 73
        .byte                  F2s1 ,    SpeedHalf + Dur4    ;      2 75
        .byte                  F1s1 ,    SpeedHalf + Dur4    ;      2 77
        .byte                  F2s2 ,    SpeedQuarter + Dur8 ;      2 79
        .byte                  F1s2 ,    SpeedQuarter + Dur8 ;      2 81
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ;      2 83
        .byte      FlapSound + F3s1 ,    Speed1 + Dur5       ;      5 88
        .byte                  F2s1 ,    Speed1 + Dur5       ;      5 93
        .byte                  F1s1 ,    Speed1 + Dur5       ;      5 98
        .byte                  F2s1 ,    Speed1 + Dur10      ;     10 108
        .byte                  F3s1 ,    SpeedHalf + Dur12   ;12/2  6 114
        .byte                  F4s1 ,    SpeedQuarter + Dur12 ;12/4 3 117
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 121
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 125
        ; note - must transition on/off screen using F1s1
        .byte                  F1s1 ,    Speed1 + Dur25      ;     20 150
        .byte                  F1s1 , EndSeq   ; transition frame


DragonSequence3 ;launch down-right then fly off to the left  variation 1
        .byte 0, 0 ; dummy frame
        .byte      FlipImage + F3s4 ,    Speed0 + Dur6
        .byte      FlipImage + F4s4 ,    Speed0 + Dur6
        .byte      FlipImage + F5s4 ,    Speed0 + Dur6
        .byte      FlipImage + F6s4 ,    Speed0 + Dur6
        .byte LaunchFireball + FlipImage + F7s4 ,    Speed0 + Dur18
        .byte      FlipImage + F6s4 ,    Speed0 + Dur6
        .byte      FlipImage + F5s4 ,    Speed0 + Dur6
        .byte      FlipImage + F4s4 ,    Speed0 + Dur6
        .byte      FlipImage + F3s4 ,    Speed0 + Dur6
        .byte                  F1s4 ,    Speed0 + Dur6
        .byte                  F5s2 ,    Speed0 + Dur6
        .byte                  F4s2 ,    Speed0 + Dur6
        .byte                  F3s2 ,    Speed0 + Dur6
        .byte                  F1s2 ,    Speed0 + Dur6
        .byte                  F2s2 ,    Speed0 + Dur6
        .byte                  F4s1 ,    Speed0 + Dur6       ;        71
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 75
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 79
        .byte                  F1s1 ,    Speed1 + Dur15      ;     15 94
        .byte                  F2s2 ,    Speed1 + Dur15      ;     15 109
        .byte                  F1s2 ,    SpeedHalf + Dur10   ;10/2  5 114
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ; 8/4  2 116
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 120
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 124
        ; note - must transition on/off screen using F1s1
        .byte                  F1s1 ,    Speed1 + Dur26      ;     26 150
        .byte                  F1s1 , EndSeq   ; transition frame

DragonSequence8 ; launch up-right, leave to left.  Variation 2
        .byte 0, 0 ; dummy frame
        .byte      FlipImage + F1s3 ,    Speed0 + Dur6
        .byte      FlipImage + F2s3 ,    Speed0 + Dur6
        .byte      FlipImage + F3s3 ,    Speed0 + Dur6
        .byte      FlipImage + F4s3 ,    Speed0 + Dur18 ; pause
        .byte      FlipImage + F5s3 ,    Speed0 + Dur6
        .byte      FlipImage + F4s3 ,    Speed0 + Dur18 ; pause
        .byte      FlipImage + F5s3 ,    Speed0 + Dur6
        .byte      FlipImage + F6s3 ,    Speed0 + Dur6
        .byte      FlipImage + F7s3 ,    Speed0 + Dur6
        .byte LaunchFireball + FlipImage + F8s3 ,    Speed0 + Dur18
        .byte      FlipImage + F5s3 ,    Speed0 + Dur6
        .byte      FlipImage + F6s3 ,    Speed0 + Dur6
        .byte                  F6s2 ,    Speed0 + Dur6
        .byte                  F4s2 ,    Speed0 + Dur12
        .byte                  F3s2 ,    Speed0 + Dur12
        .byte                  F4s2 ,    Speed0 + Dur12
        .byte                  F3s2 ,    Speed0 + Dur12
        .byte                  F4s2 ,    Speed0 + Dur12
        .byte                  F3s2 ,    Speed0 + Dur12
        .byte                  F2s2 ,    Speed0 + Dur6
        .byte                  F1s2 ,    Speed0 + Dur6
        .byte                  F4s1 ,    Speed0 + Dur6       ;        71
        .byte      FlapSound + F3s1 ,    SpeedHalf + Dur4    ;      2 69
        .byte                  F2s1 ,    SpeedHalf + Dur4    ;      2 67
        .byte                  F1s1 ,    SpeedHalf + Dur4    ;      2 65
        .byte                  F2s2 ,    SpeedQuarter + Dur8 ;      2 63
        .byte                  F1s2 ,    SpeedQuarter + Dur8 ;      2 61
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ;      2 59
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 55
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 51
        .byte                  F1s1 ,    Speed1 + Dur4       ;      4 47
        .byte                  F2s1 ,    Speed1 + Dur10      ;     10 37
        .byte                  F3s1 ,    SpeedHalf + Dur10   ;10/2  5 32
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ; 8/4  2 30
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 26
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 22
        ; note - must transition on/off screen using F1s1
        .byte                  F1s1 ,    Speed1 + Dur22      ;     22  0
        .byte                  F1s1 , EndSeq   ; transition frame

DragonSequence9 ; launch down-right, leave to left.  Variation 2
        .byte 0, 0 ; dummy frame
        .byte      FlipImage + F3s4 ,    Speed0 + Dur6
        .byte      FlipImage + F4s4 ,    Speed0 + Dur6
        .byte      FlipImage + F5s4 ,    Speed0 + Dur6
        .byte      FlipImage + F6s4 ,    Speed0 + Dur6
        .byte LaunchFireball + FlipImage + F7s4 ,    Speed0 + Dur18
        .byte      FlipImage + F6s4 ,    Speed0 + Dur6
        .byte      FlipImage + F5s4 ,    Speed0 + Dur6
        .byte      FlipImage + F4s4 ,    Speed0 + Dur6
        .byte      FlipImage + F3s4 ,    Speed0 + Dur6
        .byte      FlipImage + F2s4 ,    Speed0 + Dur6
        .byte                  F1s4 ,    Speed0 + Dur6
        .byte                  F6s2 ,    Speed0 + Dur6
        .byte                  F4s2 ,    Speed0 + Dur6
        .byte                  F3s2 ,    Speed0 + Dur6
        .byte                  F2s2 ,    Speed0 + Dur6
        .byte                  F4s1 ,    Speed0 + Dur6       ;        71
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 67
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 63
        .byte                  F1s1 ,    Speed1 + Dur10      ;     10 53
        .byte                  F2s1 ,    Speed1 + Dur10      ;     10 43
        .byte                  F3s1 ,    SpeedHalf + Dur10   ;10/2  5 38
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ; 8/4  2 36
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 32
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 28
        ; note - must transition on/off screen using F1s1
        .byte                  F1s1 ,    Speed1 + Dur28      ;     28  0
        .byte                  F1s1 , EndSeq   ; transition frame


DragonSequence10 ; launch up-left, leave right variation 2
        .byte 0, 0 ; dummy frame
        .byte      FlipImage + F1s3 ,    Speed0 + Dur6
        .byte      FlipImage + F2s3 ,    Speed0 + Dur6
        .byte      FlipImage + F3s3 ,    Speed0 + Dur6
        .byte      FlipImage + F4s3 ,    Speed0 + Dur18 ; pause
        .byte      FlipImage + F5s3 ,    Speed0 + Dur6
        .byte      FlipImage + F4s3 ,    Speed0 + Dur18 ; pause
        .byte      FlipImage + F5s3 ,    Speed0 + Dur6
        .byte      FlipImage + F6s3 ,    Speed0 + Dur6
        .byte      FlipImage + F7s3 ,    Speed0 + Dur6
        .byte LaunchFireball + FlipImage + F8s3 ,    Speed0 + Dur18
        .byte      FlipImage + F5s3 ,    Speed0 + Dur6
        .byte      FlipImage + F6s3 ,    Speed0 + Dur6
        .byte                  F6s2 ,    Speed0 + Dur6
        .byte                  F4s2 ,    Speed0 + Dur6
        .byte                  F3dd ,    Speed0 + Dur12
        .byte                  F4dd ,    Speed0 + Dur6
        .byte                  F1dd ,    Speed0 + Dur6
        .byte                  F2dd ,    Speed0 + Dur18
        .byte                  F1dd ,    Speed0 + Dur18
        .byte                  F4dd ,    Speed0 + Dur12
        .byte                  F3s2 ,    Speed0 + Dur12
        .byte                  F2s2 ,    Speed0 + Dur6       ;        71
        .byte      FlapSound + F1s2 ,    SpeedHalf + Dur4    ;      2 73
        .byte                  F4s1 ,    SpeedHalf + Dur4    ;      2 75
        .byte                  F1s1 ,    SpeedHalf + Dur4    ;      2 77
        .byte                  F2s2 ,    SpeedQuarter + Dur8 ;      2 79
        .byte                  F1s2 ,    SpeedQuarter + Dur8 ;      2 81
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ;      2 83
        .byte      FlapSound + F3s1 ,    Speed1 + Dur5       ;      5 88
        .byte                  F2s1 ,    Speed1 + Dur5       ;      5 93
        .byte                  F1s1 ,    Speed1 + Dur5       ;      5 98
        .byte                  F2s2 ,    Speed1 + Dur10      ;     10 108
        .byte                  F1s2 ,    SpeedHalf + Dur12   ;12/2  6 114
        .byte                  F4s1 ,    SpeedQuarter + Dur12 ;12/4 3 117
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 121
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 125
        ; note - must transition on/off screen using F1s1
        .byte                  F1s1 ,    Speed1 + Dur25      ;     20 150
        .byte                  F1s1 , EndSeq   ; transition frame


DragonSequence11 ; launch down-left, leave right variation 2
        .byte 0, 0 ; dummy frame
        .byte      FlipImage + F3s4 ,    Speed0 + Dur6
        .byte      FlipImage + F4s4 ,    Speed0 + Dur6
        .byte      FlipImage + F5s4 ,    Speed0 + Dur6
        .byte      FlipImage + F6s4 ,    Speed0 + Dur6
        .byte LaunchFireball + FlipImage + F7s4 ,    Speed0 + Dur18
        .byte      FlipImage + F6s4 ,    Speed0 + Dur6
        .byte      FlipImage + F5s4 ,    Speed0 + Dur6
        .byte      FlipImage + F4s4 ,    Speed0 + Dur6
        .byte      FlipImage + F3s4 ,    Speed0 + Dur6
        .byte      FlipImage + F2s4 ,    Speed0 + Dur6
        .byte                  F1s4 ,    Speed0 + Dur6
        .byte                  F6s2 ,    Speed0 + Dur6
        .byte                  F4s2 ,    Speed0 + Dur6
        .byte                  F3s2 ,    Speed0 + Dur6
        .byte                  F2s2 ,    Speed0 + Dur6
        .byte                  F4s1 ,    Speed0 + Dur6       ;        71
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 75
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 79
        .byte                  F1s1 ,    Speed1 + Dur15      ;     15 94
        .byte                  F2s1 ,    Speed1 + Dur15      ;     15 109
        .byte                  F3s1 ,    SpeedHalf + Dur10   ;10/2  5 114
        .byte                  F4s1 ,    SpeedQuarter + Dur8 ; 8/4  2 116
        .byte      FlapSound + F3s1 ,    Speed1 + Dur4       ;      4 120
        .byte                  F2s1 ,    Speed1 + Dur4       ;      4 124
        ; note - must transition on/off screen using F1s1
        .byte                  F1s1 ,    Speed1 + Dur26      ;     26 150
        .byte                  F1s1 , EndSeq   ; transition frame

GetBank6SequenceDataCode
        lda DragonFrame
        tay
        lda (Dragonptr),y
        sta TempFrame
        iny
        lda (Dragonptr),y
        sta TempDuration
        jmp ReturnData


BlankGrfx
        .byte #<BlankGraphic
        .byte #>BlankGraphic  ; overlaps with 1

; Value0Grfx
        ; .byte #<BlankGraphic
        ; .byte #>BlankGraphic
        ; .byte #<BlankGraphic
        ; .byte #>BlankGraphic
        ; .byte #<BlankGraphic
        ; .byte #>BlankGraphic
        ; .byte #<BlankGraphic
        ; .byte #>BlankGraphic
        ; .byte #<BlankGraphic
        ; .byte #>BlankGraphic
        ; .byte #<ZeroGraphic
        ; .byte #>ZeroGraphic

Value1Grfx
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<OneGraphic
        .byte #>OneGraphic

OptionSpeedGrfx
        .byte #<SpeedGraphicA
        .byte #>SpeedGraphicA
        .byte #<SpeedGraphicB
        .byte #>SpeedGraphicB
        .byte #<SpeedGraphicC
        .byte #>SpeedGraphicC
        .byte #<SpeedGraphicD
        .byte #>SpeedGraphicD
        .byte #<SpeedGraphicE
        .byte #>SpeedGraphicE
;        .byte #<BlankGraphic
;        .byte #>BlankGraphic

Value2Grfx
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<TwoGraphic
        .byte #>TwoGraphic

OptionFlashGrfx
        .byte #<FlashGraphicA
        .byte #>FlashGraphicA
        .byte #<FlashGraphicB
        .byte #>FlashGraphicB
        .byte #<FlashGraphicC
        .byte #>FlashGraphicC
        .byte #<FlashGraphicD
        .byte #>FlashGraphicD
;        .byte #<BlankGraphic
;        .byte #>BlankGraphic
;        .byte #<BlankGraphic
;        .byte #>BlankGraphic

Value3Grfx
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<ThreeGraphic
        .byte #>ThreeGraphic

Value4Grfx
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<FourGraphic
        .byte #>FourGraphic

Value5Grfx
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<FiveGraphic
        .byte #>FiveGraphic

; Value6Grfx
        ; .byte #<BlankGraphic
        ; .byte #>BlankGraphic
        ; .byte #<BlankGraphic
        ; .byte #>BlankGraphic
        ; .byte #<BlankGraphic
        ; .byte #>BlankGraphic
        ; .byte #<BlankGraphic
        ; .byte #>BlankGraphic
        ; .byte #<BlankGraphic
        ; .byte #>BlankGraphic
        ; .byte #<SixGraphic
        ; .byte #>SixGraphic

Value7Grfx
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<SevenGraphic
        .byte #>SevenGraphic

; Value8Grfx
        ; .byte #<BlankGraphic
        ; .byte #>BlankGraphic
        ; .byte #<BlankGraphic
        ; .byte #>BlankGraphic
        ; .byte #<BlankGraphic
        ; .byte #>BlankGraphic
        ; .byte #<BlankGraphic
        ; .byte #>BlankGraphic
        ; .byte #<BlankGraphic
        ; .byte #>BlankGraphic
        ; .byte #<EightGraphic
        ; .byte #>EightGraphic


Value9Grfx
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<NineGraphic
        .byte #>NineGraphic

ValueYesGrfx
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<YesGraphicA
        .byte #>YesGraphicA
        .byte #<YesGraphicB
        .byte #>YesGraphicB
        .byte #<YesGraphicC
        .byte #>YesGraphicC

ValueNoGrfx
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<NoGraphicA
        .byte #>NoGraphicA
        .byte #<NoGraphicB
        .byte #>NoGraphicB

OptionFireballsGrfx
        .byte #<FireballsGraphicA
        .byte #>FireballsGraphicA
        .byte #<FireballsGraphicB
        .byte #>FireballsGraphicB
        .byte #<FireballsGraphicC
        .byte #>FireballsGraphicC
        .byte #<FireballsGraphicD
        .byte #>FireballsGraphicD
        .byte #<FireballsGraphicE
        .byte #>FireballsGraphicE
        .byte #<FireballsGraphicF
        .byte #>FireballsGraphicF

OptionPlayerGrfx
        .byte #<PlayersGraphicA
        .byte #>PlayersGraphicA
        .byte #<PlayersGraphicB
        .byte #>PlayersGraphicB
        .byte #<PlayersGraphicC
        .byte #>PlayersGraphicC
        .byte #<PlayersGraphicD
        .byte #>PlayersGraphicD
        .byte #<PlayersGraphicE
        .byte #>PlayersGraphicE
        .byte #<PlayersGraphicF
        .byte #>PlayersGraphicF

OptionCatch1Grfx
        .byte #<CatchGraphicA
        .byte #>CatchGraphicA
        .byte #<CatchGraphicB
        .byte #>CatchGraphicB
        .byte #<CatchGraphicC
        .byte #>CatchGraphicC
        .byte #<CatchGraphicD
        .byte #>CatchGraphicD
        .byte #<CatchGraphicE
        .byte #>CatchGraphicE
        .byte #<TopLeft
        .byte #>TopLeft

OptionCatch2Grfx
        .byte #<CatchGraphicA
        .byte #>CatchGraphicA
        .byte #<CatchGraphicB
        .byte #>CatchGraphicB
        .byte #<CatchGraphicC
        .byte #>CatchGraphicC
        .byte #<CatchGraphicD
        .byte #>CatchGraphicD
        .byte #<CatchGraphicE
        .byte #>CatchGraphicE
        .byte #<BottomRight
        .byte #>BottomRight

OptionCatch3Grfx
        .byte #<CatchGraphicA
        .byte #>CatchGraphicA
        .byte #<CatchGraphicB
        .byte #>CatchGraphicB
        .byte #<CatchGraphicC
        .byte #>CatchGraphicC
        .byte #<CatchGraphicD
        .byte #>CatchGraphicD
        .byte #<CatchGraphicE
        .byte #>CatchGraphicE
        .byte #<TopRight
        .byte #>TopRight

OptionCatch4Grfx
        .byte #<CatchGraphicA
        .byte #>CatchGraphicA
        .byte #<CatchGraphicB
        .byte #>CatchGraphicB
        .byte #<CatchGraphicC
        .byte #>CatchGraphicC
        .byte #<CatchGraphicD
        .byte #>CatchGraphicD
        .byte #<CatchGraphicE
        .byte #>CatchGraphicE
        .byte #<BottomLeft
        .byte #>BottomLeft

OptionToWinGrfx
        .byte #<ToWinGraphicA
        .byte #>ToWinGraphicA
        .byte #<ToWinGraphicB
        .byte #>ToWinGraphicB
        .byte #<ToWinGraphicC
        .byte #>ToWinGraphicC
        .byte #<ToWinGraphicD
        .byte #>ToWinGraphicD
        .byte #<ToWinGraphicE
        .byte #>ToWinGraphicE
        .byte #<ToWinGraphicF
        .byte #>ToWinGraphicF
OptionStartGrfx
        .byte #<StartGraphicA
        .byte #>StartGraphicA
        .byte #<StartGraphicB
        .byte #>StartGraphicB
        .byte #<StartGraphicC
        .byte #>StartGraphicC
        .byte #<StartGraphicD
        .byte #>StartGraphicD
        .byte #<StartGraphicE
        .byte #>StartGraphicE
        .byte #<StartGraphicF
        .byte #>StartGraphicF

MoreUpGrfx
        .byte #<ArrowUp
        .byte #>ArrowUp
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<MoreOptionsA
        .byte #>MoreOptionsA
        .byte #<MoreOptionsB
        .byte #>MoreOptionsB
        .byte #<MoreOptionsC
        .byte #>MoreOptionsC
        .byte #<ArrowUp
        .byte #>ArrowUp


MoreDownGrfx
        .byte #<ArrowDown
        .byte #>ArrowDown
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<MoreOptionsA
        .byte #>MoreOptionsA
        .byte #<MoreOptionsB
        .byte #>MoreOptionsB
        .byte #<MoreOptionsC
        .byte #>MoreOptionsC
        .byte #<ArrowDown
        .byte #>ArrowDown

Value1TopLeftGrfx
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<TopLeft
        .byte #>TopLeft
        .byte #<OneGraphic
        .byte #>OneGraphic

Value1BottomRightGrfx
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BottomRight
        .byte #>BottomRight
        .byte #<OneGraphic
        .byte #>OneGraphic

Value1TopRightGrfx
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<TopRight
        .byte #>TopRight
        .byte #<OneGraphic
        .byte #>OneGraphic

Value1BottomLeftGrfx
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BlankGraphic
        .byte #>BlankGraphic
        .byte #<BottomLeft
        .byte #>BottomLeft
        .byte #<OneGraphic
        .byte #>OneGraphic

ValueDoubles
        .byte #<DoublesGraphicA
        .byte #>DoublesGraphicA
        .byte #<DoublesGraphicB
        .byte #>DoublesGraphicB
        .byte #<DoublesGraphicC
        .byte #>DoublesGraphicC
        .byte #<DoublesGraphicD
        .byte #>DoublesGraphicD
        .byte #<DoublesGraphicE
        .byte #>DoublesGraphicE
        .byte #<DoublesGraphicF
        .byte #>DoublesGraphicF

ValueLimitedGrfx
        .byte #<LimitedGraphicA
        .byte #>LimitedGraphicA
        .byte #<LimitedGraphicB
        .byte #>LimitedGraphicB
        .byte #<LimitedGraphicC
        .byte #>LimitedGraphicC
        .byte #<LimitedGraphicD
        .byte #>LimitedGraphicD
        .byte #<LimitedGraphicE
        .byte #>LimitedGraphicE
        .byte #<LimitedGraphicF
        .byte #>LimitedGraphicF

ValueCastleGrfx
	.byte #<BlankGraphic
	.byte #>BlankGraphic
        .byte #<CastleGraphicA
        .byte #>CastleGraphicA
        .byte #<CastleGraphicB
        .byte #>CastleGraphicB
        .byte #<CastleGraphicC
        .byte #>CastleGraphicC
        .byte #<CastleGraphicD
        .byte #>CastleGraphicD
        .byte #<CastleGraphicE
        .byte #>CastleGraphicE

ValueKingGrfx
	.byte #<BlankGraphic
	.byte #>BlankGraphic
	.byte #<BlankGraphic
	.byte #>BlankGraphic
        .byte #<KingGraphicA
        .byte #>KingGraphicA
        .byte #<KingGraphicB
        .byte #>KingGraphicB
        .byte #<KingGraphicC
        .byte #>KingGraphicC
        .byte #<KingGraphicD
        .byte #>KingGraphicD

ValueKidsGrfx
	.byte #<BlankGraphic
	.byte #>BlankGraphic
	.byte #<BlankGraphic
	.byte #>BlankGraphic
        .byte #<KidsGraphicA
        .byte #>KidsGraphicA
        .byte #<KidsGraphicB
        .byte #>KidsGraphicB
        .byte #<KidsGraphicC
        .byte #>KidsGraphicC
        .byte #<KidsGraphicD
        .byte #>KidsGraphicD

ValueSlowGrfx
	.byte #<BlankGraphic
	.byte #>BlankGraphic
	.byte #<BlankGraphic
	.byte #>BlankGraphic
        .byte #<SlowGraphicA
        .byte #>SlowGraphicA
        .byte #<SlowGraphicB
        .byte #>SlowGraphicB
        .byte #<SlowGraphicC
        .byte #>SlowGraphicC
        .byte #<SlowGraphicD
        .byte #>SlowGraphicD


ValueFastGrfx
	.byte #<BlankGraphic
	.byte #>BlankGraphic
	.byte #<BlankGraphic
	.byte #>BlankGraphic
        .byte #<FastGraphicA
        .byte #>FastGraphicA
        .byte #<FastGraphicB
        .byte #>FastGraphicB
        .byte #<FastGraphicC
        .byte #>FastGraphicC
        .byte #<FastGraphicD
        .byte #>FastGraphicD

ValueMedievalGrfx
        .byte #<MedievalGraphicA
        .byte #>MedievalGraphicA
        .byte #<MedievalGraphicB
        .byte #>MedievalGraphicB
        .byte #<MedievalGraphicC
        .byte #>MedievalGraphicC
        .byte #<MedievalGraphicD
        .byte #>MedievalGraphicD
        .byte #<MedievalGraphicE
        .byte #>MedievalGraphicE
        .byte #<MedievalGraphicF
        .byte #>MedievalGraphicF

;Times12 .byte  0, 12, 24, 36
;        .byte 48, 60, 72, 84
;        .byte 96,108,120,132




KernelMenuCode
;PrepLogo
        lda #<MMlogoA
        sta G48
        lda #>MMlogoA
        sta G48+1
        lda #<MMlogoB
        sta G48+2
        lda #>MMlogoB
        sta G48+3
        lda #<MMlogoC
        sta G48+4
        lda #>MMlogoC
        sta G48+5
        lda #<MMlogoD
        sta G48+6
        lda #>MMlogoD
        sta G48+7
        lda #<MMlogoE
        sta G48+8
        lda #>MMlogoE
        sta G48+9
        lda #<MMlogoF
        sta G48+10
        lda #>MMlogoF
        sta G48+11
        RANDOM

        lsr HiLiteOption
        lsr HiLiteOption

        ldy #9
        sty Paddle1
.VblankWait
        lda INTIM
        bpl .VblankWait
        lda #0
        sta VBLANK ; turn on video output & remove paddle dump to ground
        sta WSYNC

        lda MMcolor
        sta COLUP0
        sta COLUP1
        ldy #25
        jsr Show48graphic

        lda TopOption
        bne ShowMoreUp
        lda #0
        .byte $2c
ShowMoreUp
        lda #8
        sta COLUP0
        sta COLUP1

        ldy #11
smuLoop
        lda MoreUpGrfx,y
        sta G48,y
        dey
        bpl smuLoop
        ldy #4
        jsr Show48graphic

ShowOption1
        lda HiLiteOption
        bne .notSelected1
        lda #SlctBackground    ; this menu option is selected
        sta COLUBK
        lda #SlctMenuColor
        sta COLUP0
        sta COLUP1
        bne .checkPaddle1
.notSelected1
        lda #0
        sta COLUBK
        lda #MenuColor
        sta COLUP0
        sta COLUP1
.checkPaddle1
        ldy #8
        READ_PADDLE_1

        ldy #11
.o1loop
        lda (Option1),y
        sta G48,y
        dey
        bpl .o1loop
        ldy #14
        jsr Show48graphic

ShowValue1
        lda #0
        sta COLUBK
        lda HiLiteOption
        bne .notSelected1v
        lda SlctValueColor
        .byte $2c
.notSelected1v
        lda #ValueColor
        sta COLUP0
        sta COLUP1

        ldy #7
        READ_PADDLE_1

        ldy #11
.v1loop
        lda (Value1),y
        sta G48,y
        dey
        bpl .v1loop
        ldy #12
        jsr Show48graphic

ShowOption2
        lda HiLiteOption
        cmp #1
        bne .notSelected2
        lda #SlctBackground    ; this menu option is selected
        sta COLUBK
        lda #SlctMenuColor
        sta COLUP0
        sta COLUP1
        bne .checkPaddle2
.notSelected2
        lda #0
        sta COLUBK
        lda #MenuColor
        sta COLUP0
        sta COLUP1
.checkPaddle2
        ldy #6
        READ_PADDLE_1

        ldy #11
.o2loop
        lda (Option2),y
        sta G48,y
        dey
        bpl .o2loop
        ldy #14
        jsr Show48graphic

ShowValue2
        lda #0
        sta COLUBK
        lda HiLiteOption
        cmp #1
        bne .notSelected2v
        lda SlctValueColor
        .byte $2c
.notSelected2v
        lda #ValueColor
        sta COLUP0
        sta COLUP1
        ldy #5
        READ_PADDLE_1

        ldy #11
.v2loop
        lda (Value2),y
        sta G48,y
        dey
        bpl .v2loop
        ldy #12
        jsr Show48graphic

ShowOption3
        lda HiLiteOption
        cmp #2
        bne .notSelected3
        lda #SlctBackground    ; this menu option is selected
        sta COLUBK
        lda #SlctMenuColor
        sta COLUP0
        sta COLUP1
        bne .checkPaddle3
.notSelected3
        lda #0
        sta COLUBK
        lda #MenuColor
        sta COLUP0
        sta COLUP1
.checkPaddle3
        ldy #4
        READ_PADDLE_1

        ldy #11
.o3loop
        lda (Option3),y
        sta G48,y
        dey
        bpl .o3loop
        ldy #14
        jsr Show48graphic

ShowValue3
        lda #0
        sta COLUBK
        lda HiLiteOption
        cmp #2
        bne .notSelected3v
        lda SlctValueColor
        .byte $2c
.notSelected3v
        lda #ValueColor
        sta COLUP0
        sta COLUP1
        ldy #3
        READ_PADDLE_1

        ldy #11
.v3loop
        lda (Value3),y
        sta G48,y
        dey
        bpl .v3loop
        ldy #12
        jsr Show48graphic

ShowOption4
        lda HiLiteOption
        cmp #3
        bne .notSelected4
        lda #SlctBackground    ; this menu option is selected
        sta COLUBK
        lda #SlctMenuColor
        sta COLUP0
        sta COLUP1
        bne .checkPaddle4
.notSelected4
        lda #0
        sta COLUBK
        lda #MenuColor
        sta COLUP0
        sta COLUP1
.checkPaddle4
        ldy #2
        READ_PADDLE_1

        ldy #11
.o4loop
        lda (Option4),y
        sta G48,y
        dey
        bpl .o4loop
        ldy #14
        jsr Show48graphic

ShowValue4
        lda #0
        sta COLUBK
        lda HiLiteOption
        cmp #3
        bne .notSelected4v
        lda SlctValueColor
        .byte $2c
.notSelected4v
        lda #ValueColor
        sta COLUP0
        sta COLUP1

        ldy #1
        READ_PADDLE_1

        ldy #11
.v4loop
        lda (Value4),y
        sta G48,y
        dey
        bpl .v4loop
        ldy #12
        jsr Show48graphic

        ldy #0
        READ_PADDLE_1

        lda TopOption
        cmp #6
        bne ShowMoreDown
        lda #0
        .byte $2c
ShowMoreDown
        lda #8
        sta COLUP0
        sta COLUP1

        ldy #11
smdLoop
        lda MoreDownGrfx,y
        sta G48,y
        dey
        bpl smdLoop
        ldy #4
        jsr Show48graphic


ShowSpiceWareLogo
;       V 1     V   2   V     3 V       4
;123456789012345678901234567890123456789012345678
;____XXXXXXXXXXXXXXXXXXXXXX_____XXXXXXXXXXXXXXXXX
;___X_____________________X_____X________________
;___X_______XX__X__X__XXX_XX___XX__X__XX__XXX____
;___X_______X_X_X_X_X_X____X_X_X__X_X_X_X_X______
;____XXXXX__X_X_X_X___X____X_X_X__X_X_X_X_X______
;_________X_XX__X_X___XX___XXXXX__XXX_XX__XX_____
;_________X_X___X_X___X_____X_X___X_X_X_X_X______
;_________X_X___X_X_X_X_____X_X___X_X_X_X_X______
;XXXXXXXXX__X___X__X__XXX___X_X___X_X_X_X_XXX____
;       A 1     A   2   A     3 A       4
;123456789012345678901234567890123456789012345678
        sta WSYNC
        lda GameOptions3
        and #%00001000
        beq SkipNoWalls
        lda #BodyColor
        .byte $2c
SkipNoWalls
        lda #0
        sta WSYNC
        sta COLUBK
temp
        lda #$0E          ; white
White EQU temp + 1
        sta COLUP0
        sta COLUP1
        sta COLUPF
        sta WSYNC
;        sta WSYNC

; prep for row 1 of logo
        lda #zz____XXXX      ; 2     column 1
        sta GRP0             ; 3                D1     --      --     --
        sta WSYNC            ;go                      SCANLINE STARTS FOR ROW 1
        lda #zzXXXXXXXX      ; 2     column 2
        nop 0                ; 3   5
        sta GRP1             ; 3   8            D1     D1      D2     --
        lda #zzXXXXXXXX      ; 2  10 column 3
        nop 0                ; 3  13
        sta GRP0             ; 3  16            D3     D1      D2     D2
        lda #zzXX_____X      ; 2  18 column 4
        sta G48temp2         ; 3  24   72
        lda #zzXXXXXXXX      ; 2  26 column 5
        tax                  ; 2  31   93
        lda #zzXXXXXXXX      ; 2  33 column 6
        tay                  ; 2  38  114
        lda #2               ; 2
        sta ENABL            ; 3 ; use ball to fill in gap between logo and PF
; nop
; nop 0
        nop
        nop
        lda G48temp2         ; 3  41  123              !
        sta GRP1             ; 3  44  132      D3     D3      D4     D2!
        stx GRP0             ; 3  47  141      D5     D3!     D4     D4
        sty GRP1             ; 3  50  150      D5     D5      D6     D4!
        sta GRP0             ; 3  53  159      D4*    D5!     D6     D6
        sty PF2              ; use playfield to extend line
        sty PF1
        sty PF0
; prep for row 2 of logo
        lda #zz___X____      ; 2     column 1
        sta GRP0             ; 3               D1     --      --     --
        sta WSYNC            ;go                      SCANLINE STARTS FOR ROW 2
        lda #zz________      ; 2
        sta PF2
        sta GRP1             ;+3   8   24      D1     D1      D2     --
;       lda (G48+$4),y       ;+5  13   39
        lda #zz________
        sta PF1
        sta GRP0             ;+3  16   48      D3     D1      D2     D2
;       lda (G48+$6),y       ;+5  21   63
        sta PF0

        lda #zz_X_____X
        sta G48temp2         ;+3  24   72
;       lda (G48+$8),y       ;+5  29   87
        lda #zz________
        sta ENABL
        tax                  ;+2  31   93
;       lda (G48+$A),y       ;+5  36  108
        lda #zz________
        nop 0
        tay                  ;+2  38  114
        lda G48temp2         ;+3  41  123              !
        sta GRP1             ;+3  44  132      D3     D3      D4     D2!
        stx GRP0             ;+3  47  141      D5     D3!     D4     D4
        sty GRP1             ;+3  50  150      D5     D5      D6     D4!
        sta GRP0             ;+3  53  159      D4*    D5!     D6     D6

        lda #zz___X____
        nop 0
        sta GRP0             ;+3  71  213      D1     --      --     --
        sta WSYNC            ;go
;       lda (G48+$2),y       ;+5   5   15
        lda #zz___XX__X
        nop 0
        sta GRP1             ;+3   8   24      D1     D1      D2     --
;       lda (G48+$4),y       ;+5  13   39
        lda #zz__X__XXX
        nop 0
        sta GRP0             ;+3  16   48      D3     D1      D2     D2
;       lda (G48+$6),y       ;+5  21   63
        lda #zz_XX___XX
        nop 0
        sta G48temp2         ;+3  24   72
;       lda (G48+$8),y       ;+5  29   87
        lda #zz__X__XX_
        nop 0
        tax                  ;+2  31   93
;       lda (G48+$A),y       ;+5  36  108
        lda #zz_XXX____
        nop 0
        tay                  ;+2  38  114
        lda G48temp2         ;+3  41  123              !
        sta GRP1             ;+3  44  132      D3     D3      D4     D2!
        stx GRP0             ;+3  47  141      D5     D3!     D4     D4
        sty GRP1             ;+3  50  150      D5     D5      D6     D4!
        sta GRP0             ;+3  53  159      D4*    D5!     D6     D6
        dec G48temp1         ;+5  58  174                             !
        ldy G48temp1         ;+3  61  189
;       lda (G48),y          ;+5  66  204
        lda #zz___X____
        nop 0
        sta GRP0             ;+3  69  213      D1     --      --     --
;        sta HMOVE            ; 3  72   shift SW extender left 14 pixels
        sta WSYNC            ;go
;       lda (G48+$2),y       ;+5   5   15
        lda #zz___X_X_X
        nop 0
        sta GRP1             ;+3   8   24      D1     D1      D2     --
;       lda (G48+$4),y       ;+5  13   39
        lda #zz_X_X_X__
        nop 0
        sta GRP0             ;+3  16   48      D3     D1      D2     D2
;       lda (G48+$6),y       ;+5  21   63
        lda #zz__X_X_X_
        nop
        sta G48temp2         ;+3  24   72
;       lda (G48+$8),y       ;+5  29   87
        lda #zz_X_X_X_X
        nop 0
        tax                  ;+2  31   93
;       lda (G48+$A),y       ;+5  36  108
        lda #zz_X______

;       nop 0
        tay                  ;+2  38  114
        sta RESBL            ; position ball to cover left gap
 ;nop
        lda G48temp2         ;+3  41  123              !
        sta GRP1             ;+3  44  132      D3     D3      D4     D2!
        stx GRP0             ;+3  47  141      D5     D3!     D4     D4
        sty GRP1             ;+3  50  150      D5     D5      D6     D4!
        sta GRP0             ;+3  53  159      D4*    D5!     D6     D6
        dec G48temp1         ;+5  58  174                             !
        ldy G48temp1         ;+3  61  189
;       lda (G48),y          ;+5  66  204
        lda #zz____XXXX
        nop 0
        sta GRP0             ;+3  69  213      D1     --      --     --
;       sta HMOVE            ; 3  72  shift SW extender left 14 pixels
        sta WSYNC            ;go
;       lda (G48+$2),y       ;+5   5   15
        lda #zzX__X_X_X
        nop 0
        sta GRP1             ;+3   8   24      D1     D1      D2     --
;       lda (G48+$4),y       ;+5  13   39
        lda #zz_X___X__
        nop 0
        sta GRP0             ;+3  16   48      D3     D1      D2     D2
;       lda (G48+$6),y       ;+5  21   63
        lda #zz__X_X_X_
        nop 0
        sta G48temp2         ;+3  24   72
;       lda (G48+$8),y       ;+5  29   87
        lda #zz_X_X_X_X
        nop 0
        tax                  ;+2  31   93
;       lda (G48+$A),y       ;+5  36  108
        lda #zz_X______
        nop 0
        tay                  ;+2  38  114
        lda G48temp2         ;+3  41  123              !
        sta GRP1             ;+3  44  132      D3     D3      D4     D2!
        stx GRP0             ;+3  47  141      D5     D3!     D4     D4
        sty GRP1             ;+3  50  150      D5     D5      D6     D4!
        sta GRP0             ;+3  53  159      D4*    D5!     D6     D6
        dec G48temp1         ;+5  58  174                             !
        ldy G48temp1         ;+3  61  189
;       lda (G48),y          ;+5  66  204
        lda #zz________
        nop 0
        sta GRP0             ;+3  69  213      D1     --      --     --
;       sta HMOVE            ; 3  72 shift SW extender left 14 pixels
        sta WSYNC            ;go
;       lda (G48+$2),y       ;+5   5   15
        lda #zz_X_XX__X
        nop 0
        sta GRP1             ;+3   8   24      D1     D1      D2     --
;       lda (G48+$4),y       ;+5  13   39
        lda #zz_X___XX_
        nop 0
        sta GRP0             ;+3  16   48      D3     D1      D2     D2
;       lda (G48+$6),y       ;+5  21   63
        lda #zz__XXXXX_
        nop 0
        sta G48temp2         ;+3  24   72
;       lda (G48+$8),y       ;+5  29   87
        lda #zz_XXX_XX_
        nop 0
        tax                  ;+2  31   93
;       lda (G48+$A),y       ;+5  36  108
        lda #zz_XX_____
        nop 0
        tay                  ;+2  38  114
        lda G48temp2         ;+3  41  123              !
        sta GRP1             ;+3  44  132      D3     D3      D4     D2!
        stx GRP0             ;+3  47  141      D5     D3!     D4     D4
        sty GRP1             ;+3  50  150      D5     D5      D6     D4!
        sta GRP0             ;+3  53  159      D4*    D5!     D6     D6
        dec G48temp1         ;+5  58  174                             !
        ldy G48temp1         ;+3  61  189
;       lda (G48),y          ;+5  66  204
        lda #zz________
        nop 0
        sta GRP0             ;+3  69  213      D1     --      --     --
        sta WSYNC            ;go
;       lda (G48+$2),y       ;+5   5   15
        lda #zz_X_X___X
        nop 0
        sta GRP1             ;+3   8   24      D1     D1      D2     --
;       lda (G48+$4),y       ;+5  13   39
        lda #zz_X___X__
        nop 0
        sta GRP0             ;+3  16   48      D3     D1      D2     D2
;       lda (G48+$6),y       ;+5  21   63
        lda #zz___X_X__
        nop 0
        sta G48temp2         ;+3  24   72
;       lda (G48+$8),y       ;+5  29   87
        lda #zz_X_X_X_X
        nop 0
        tax                  ;+2  31   93
;       lda (G48+$A),y       ;+5  36  108
        lda #zz_X______
        nop 0
        tay                  ;+2  38  114
        lda G48temp2         ;+3  41  123              !
        sta GRP1             ;+3  44  132      D3     D3      D4     D2!
        stx GRP0             ;+3  47  141      D5     D3!     D4     D4
        sty GRP1             ;+3  50  150      D5     D5      D6     D4!
        sta GRP0             ;+3  53  159      D4*    D5!     D6     D6
        dec G48temp1         ;+5  58  174                             !
        ldy G48temp1         ;+3  61  189
;       lda (G48),y          ;+5  71  204
zero
        lda #zz________
        nop 0
        sta GRP0             ;+3  71  213      D1     --      --     --
        sta WSYNC            ;go
;       lda (G48+$2),y       ;+5   5   15
        lda #zz_X_X___X
        nop 0
        sta GRP1             ;+3   8   24      D1     D1      D2     --
;       lda (G48+$4),y       ;+5  13   39
        lda #zz_X_X_X__
        nop 0
        sta GRP0             ;+3  16   48      D3     D1      D2     D2
;       lda (G48+$6),y       ;+5  21   63
        lda #zz___X_X__
        nop 0
        sta G48temp2         ;+3  24   72
;       lda (G48+$8),y       ;+5  29   87
        lda #zz_X_X_X_X
        nop 0
        tax                  ;+2  31   93
;       lda (G48+$A),y       ;+5  36  108
        lda #zz_X______
        nop 0
        tay                  ;+2  38  114
        lda G48temp2         ;+3  41  123              !
        sta GRP1             ;+3  44  132      D3     D3      D4     D2!
        stx GRP0             ;+3  47  141      D5     D3!     D4     D4
        sty GRP1             ;+3  50  150      D5     D5      D6     D4!
        sta GRP0             ;+3  53  159      D4*    D5!     D6     D6
        dec G48temp1         ;+5  58  174                             !
        ldy G48temp1         ;+3  61  189
        lda #zzXXXXXXXX
        sta ENABL            ; use ball to cover gap
; nop 0
        sta PF1
        sta GRP0             ;+3  74  213      D1     --      --     --
        sta WSYNC            ;go
;       lda (G48+$2),y       ;+5   5   15
        sta PF0
        lda #zzX__X___X
        sta GRP1             ;+3   8   24      D1     D1      D2     --
;       lda (G48+$4),y       ;+5  13   39
        lda #zz__X__XXX
        nop 0
        sta GRP0             ;+3  16   48      D3     D1      D2     D2
;       lda (G48+$6),y       ;+5  21   63
        lda #zz___X_X__
        sta G48temp2         ;+3  24   72
;       lda (G48+$8),y       ;+5  29   87
        lda #zz_X_X_X_X
        tax                  ;+2  31   93
        lda #zz_XXX____
        tay                  ;+2  38  114
        lda #0
        sta PF0
        sta PF1
        lda G48temp2         ;+3  41  123              !
        sta GRP1             ;+3  44  132      D3     D3      D4     D2!
        stx GRP0             ;+3  47  141      D5     D3!     D4     D4
        sty GRP1             ;+3  50  150      D5     D5      D6     D4!
        sta GRP0             ;+3  53  159      D4*    D5!     D6     D6
        dec G48temp1         ;+5  58  174

        ; sta WSYNC
        ; lda #0
        ; sta GRP0
        ; sta GRP1
        ; sta GRP0
        ; sta GRP1
        ; sta ENABL

OverscanMenuCode SUBROUTINE
        sta WSYNC
        lda #2
        sta VBLANK        ; turn off video output
        ldx #OVERSCAN_DELAY
        stx TIM64T

;        sta WSYNC
;
        lda #0
        sta GRP0
        sta GRP1
        sta GRP0
        sta GRP1
        sta ENABL


        lda #SlctMenuColor
        sta SlctValueColor

        lda SWCHA
        and #%00001100
        bne NotPressed34
        lda GameOptions3 ;
        and #%00000100
        bne CheckPaddle ; already processed
        lda #%00001000
        eor GameOptions3
        ora #%00000100  ; set debouncer
        sta GameOptions3
        bne CheckPaddle

NotPressed34
        lda GameOptions3
        and #%11111011    ; reset debouncer
        sta GameOptions3
CheckPaddle
        bit SWCHA         ; if so then is button pressed?
        bpl .pressed
        jmp NotPressed
.pressed
        bvs NotEE
        jmp MMEE
NotEE
        lda #ATTRACT_DELAY  ; reset Attract Mode delay if button is down
        sta ExtraFireball
        lda MMcolor
        sta SlctValueColor
        lda Delay
        beq .delayOver
        dec Delay
        jmp OverscanMenu2Code
.delayOver
        lda SelectedOption
        bne .notChangingPlayers

        lda HumanPlayers
        cmp #%00001111
        beq .now3
        cmp #%00000111
        beq .now2
        cmp #%00000011
        beq .now1TL
        cmp #%00000001
        beq .now1BR
        cmp #%00000010
        beq .now1TR
        cmp #%00000100
        beq .now1BL
        cmp #%00001000
        beq .nowDoubles
;        cmp #%10001111
;        beq .nowZero

        lda #%00001111
        .byte $2c
.now3   lda #%00000111
        .byte $2c
.now2   lda #%00000011
        .byte $2c
.now1TL lda #%00000001
        .byte $2c
.now1BR lda #%00000010
        .byte $2c
.now1TR lda #%00000100
        .byte $2c
.now1BL lda #%00001000
        .byte $2c
.nowDoubles
        lda #%10001111
;        .byte $2c
;.nowZero
;        lda #%00000000
        sta HumanPlayers
        jmp SetDelay

.notChangingPlayers
        cmp #1
        bne .notChangingSpeed
        lda GameOptions
        and #%00001100
        tay
        lda GameOptions
        and #%11110011
        sta GameOptions
        tya
        sec
        sbc #%00000100
        and #%00001100
        ora GameOptions
        sta GameOptions
        jmp SetDelay

.notChangingSpeed
        cmp #2
        bne .notChangingFireballs
        lda GameOptions
        and #%00000011
        tay
        lda GameOptions
        and #%11111100
        sta GameOptions
        tya
        sec
        sbc #1
        bne .storeFireballs
        lda #3
.storeFireballs
        ora GameOptions;
        sta GameOptions
        jmp SetDelay

.notChangingFireballs
        cmp #3
        bne .notChangingCatch1

	lda #%00010000
	jsr ChangeCatch
	jmp SetDelay


.notChangingCatch1
        cmp #4
        bne .notChangingCatch2

	lda #%00100000
	jsr ChangeCatch
	jmp SetDelay

.notChangingCatch2
        cmp #5
        bne .notChangingCatch3

	lda #%01000000
	jsr ChangeCatch
	jmp SetDelay

.notChangingCatch3
        cmp #6
        bne .notChangingCatch4

	lda #%10000000
	jsr ChangeCatch
	jmp SetDelay

.notChangingCatch4
	cmp #7
	bne .notChangingFlash
	clc
	lda GameOptions
	adc #%00010000
	and #%00111111
	sta GameOptions
	jmp SetDelay

.notChangingFlash
	cmp #8
	bne .notChangingToWin
	lda GameOptions2
	and #%00001111
	cmp #1
	beq .add8
	lda #$FE
	.byte $2c
.add8
	lda #8
	clc
	adc GameOptions2
	sta GameOptions2
	jmp SetDelay

.notChangingToWin
	cmp #9
        beq StartGame
        jmp TestForAttractMode ; other menu choices get addedhere
SetDelay
        lda #$1F
        sta Delay
        bne TestForAttractMode


NotPressed
        lda #0
        sta Delay
        lda Paddle1
        sta SelectedOption
        cmp TopOption
        bcc StoreTop     ; reset Top option
        sec
        sbc #3
        bmi TestForAttractMode
        cmp TopOption
        bcc TestForAttractMode ; correct top is displayed, so we're OK

StoreTop
        sta TopOption


TestForAttractMode
        lda SelectedOption  ; has selection changed?
        cmp LastSelect
        beq TFAMskip
        sta LastSelect      ; if so reset Attract Mode countdown
        lda #ATTRACT_DELAY
        sta ExtraFireball
TFAMskip
        lda Frame
        and #%00111111 ; only dec every 64 frames (about 1 second NTSC)
        bne OverscanMenu2Code
        dec ExtraFireball
        beq StartAttractMode

OverscanMenu2Code
        lda SWCHB
        and #%00000001
        beq StartGame
        ldx INTIM
        bpl OverscanMenu2Code
        jmp VerticalBlankMenu

StartAttractMode
        lda #%11000000   ; turn on Attract Mode
        ora GameOptions
        sta GameOptions

        bne SGinit
StartGame
        lda #%01111111   ; turn off Attract Mode
        and GameOptions
        sta GameOptions
        lda GameOptions3
        and #%11111100   ; turn off chase sequence for new game
        sta GameOptions3

        lda #0
        sta Score1       ; reset scores to zero
        sta Score2
        sta Score3
        sta Score4
SGinit
        lda #64
        sta Player1Y
        sta Player3Y
        lda #24
        sta Player2Y
        sta Player4Y
        sta Player1X
        sta Player4X
        lda #140
        sta Player2X
        sta Player3X
;SGinit
        lda #$10
        sta NUSIZ0        ; set missile 0 to double width
        sta NUSIZ1        ; set missile 1 to double width
        lda #0
        sta VDELP0
        sta VDELP1
        bit HumanPlayers  ; check for Doubles
        bpl .skip
        lda #16*7         ; we're playing Doubles so
        sta Score2        ;     set score 2 to blank
        sta Score4        ;     set score 4 to blank
.skip	jmp StartRound

ChangeCatch
	sta BitOn
	eor #$ff
	sta BitOff
	lda BitOn
	and GameOptions3
	beq CatchNowYes
	and GameOptions2
	beq CatchNowLimited
CatchNowNo
	lda BitOff
	and GameOptions3
	sta GameOptions3
	lda BitOff
	and GameOptions2
	sta GameOptions2
	rts
CatchNowYes
	lda BitOn
	ora GameOptions3
	sta GameOptions3
	lda BitOff
	and GameOptions2
	sta GameOptions2
	rts
CatchNowLimited
	lda BitOn
	ora GameOptions3
	sta GameOptions3
	lda BitOn
	ora GameOptions2
	sta GameOptions2
	rts




;       V 1     V   2   V     3 V
;12345678901234567890123456789012
;_______X________________________
;_______X__XX____________________
;_____X_X____X___________________
;____XX_X___X____X_______________
;___X_X_X__X_____________________
;_____X_XXX_________X_XX_____XX__
;____XX_X__XX____X___X_XX___X_XX_
;___X_X_X____XX__X___X__X__X___X_
;_____X_X_____X__X___X__X__X___X_
;_____X_______X__X___X__X__XX_XX_
;_____X______XXX_X__XXXXXX__XX_X_
;____XXXX__X__X___X__X__X______XX
;______XXXX_________________XXXX_
;       A 1     A   2   A     3 A
;12345678901234567890123456789012
KingGraphicA
	.byte zz______XX
	.byte zz____XXXX
	.byte zz_____X__
	.byte zz_____X__
	.byte zz_____X_X
	.byte zz___X_X_X
	.byte zz____XX_X
	.byte zz_____X_X
	.byte zz___X_X_X
	.byte zz____XX_X
	.byte zz_____X_X
	.byte zz_______X
	.byte zz_______X
KingGraphicB
	.byte zzXX______
	.byte zz__X__X__
	.byte zz____XXX_
	.byte zz_____X__
	.byte zz_____X__
	.byte zz____XX__
	.byte zz__XX____
	.byte zzXX______
	.byte zz__X_____
	.byte zz___X____
	.byte zz____X___
	.byte zz__XX____
	.byte zz________
KingGraphicC
	.byte zz________
	.byte zz_X__X__X
	.byte zzX__XXXXX
	.byte zzX___X__X
	.byte zzX___X__X
	.byte zzX___X__X
	.byte zzX___X_XX
	.byte zz___X_XX_
	.byte zz________
	.byte zzX_______
	.byte zz________
	.byte zz________
	.byte zz________
KingGraphicD
	.byte zz___XXXX_
	.byte zz______XX
	.byte zzX__XX_X_
	.byte zz__XX_XX_
	.byte zz__X___X_
	.byte zz__X___X_
	.byte zz___X_XX_
	.byte zz____XX__
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz________

;       V 1     V   2   V     3 V       4
;123456789012345678901234567890123456789012345678
;_____X___X______________________________________
;__X_XXX__XX_________X___________________________
;_XX_X_XXX_XX_______XX___________________________
;X_X_X__X___X________XX________________________X_
;__X_X__X___X_________XX__X____________________X_
;_XX_X__X___X____X_____XX______X__X___X___XX___X_
;X_X_X__X__XX___XXX_X___X_X___XXX__X__X__X_XX__X_
;__X_X__X_X_X__X_X__X___X_X__X_X___X__X_X___X__X_
;__X_X__XX__X__XX___X___X_X__XX____X__X_X___X__X_
;__X_X__X___X__X____X___X_X__X_____X__X_X___X__X_
;__X_X_XXX_XXX_XX_X_XX_X__X__XX_X__XX_X_XX_X_X_X_
;_X_____X___X___XX___XX____X__XX____XX___XX_____X
;X_______________________________________________
;       A 1     A   2   A     3 A       4
;123456789012345678901234567890123456789012345678
MedievalGraphicA
	.byte zzX_______
	.byte zz_X_____X
	.byte zz__X_X_XX
	.byte zz__X_X__X
	.byte zz__X_X__X
	.byte zz__X_X__X
	.byte zzX_X_X__X
	.byte zz_XX_X__X
	.byte zz__X_X__X
	.byte zzX_X_X__X
	.byte zz_XX_X__X
	.byte zz__X_XXX_
	.byte zz_____X__
MedievalGraphicB
	.byte zz________
	.byte zz___X___X
	.byte zzX_XXX_XX
	.byte zz___X__X_
	.byte zzX__X__XX
	.byte zz_X_X__X_
	.byte zz__XX___X
	.byte zz___X____
	.byte zz___X____
	.byte zz___X____
	.byte zzX_XX____
	.byte zz_XX_____
	.byte zz_X______
MedievalGraphicC
	.byte zz________
	.byte zzX___XX__
	.byte zz_X_XX_X_
	.byte zz___X___X
	.byte zz___X___X
	.byte zzX__X___X
	.byte zzXX_X___X
	.byte zzX_____XX
	.byte zz_____XX_
	.byte zz____XX__
	.byte zz___XX___
	.byte zz____X___
;	.byte zz________
MedievalGraphicD
	.byte zz________
	.byte zz__X__XX_
	.byte zz_X__XX_X
	.byte zz_X__X___
	.byte zz_X__XX__
	.byte zz_X__X_X_
	.byte zz_X___XXX
	.byte zz______X_
	.byte zz_X______
	.byte zz________
	.byte zz________
	.byte zz________
;	.byte zz________
MedievalGraphicE
	.byte zz________
	.byte zz___XX___
	.byte zz__XX_X_X
	.byte zz__X__X_X
	.byte zz__X__X_X
	.byte zz__X__X_X
	.byte zz__X__X__
	.byte zz_X___X__
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz________
;	.byte zz________
MedievalGraphicF
	.byte zz________
	.byte zzXX_____X
	.byte zzX_X_X_X_
	.byte zz___X__X_
	.byte zz___X__X_
	.byte zz___X__X_
	.byte zzX_XX__X_
	.byte zz_XX___X_
	.byte zz______X_
	.byte zz______X_
	.byte zz________
	.byte zz________
	.byte zz________

;       V 1     V   2   V     3 V
;12345678901234567890123456789012
;______XXX___X___________________
;_____X__XXXX____________________
;____X___________________________
;____XX_________X________________
;______XX_______X________________
;____X___XXX____X____XX__X__X__X_
;_____XX____XX__X___X_XX__X__X__X
;_______XXX___X_X__X___X__X__X__X
;____XX____X__X_X__X___X__X__X__X
;______X__X___X_X__X___X__X__X__X
;____________X__X__XX_X___XX_XX_X
;_____XXXX__X____X__XX_____XX_XX_
;____X___XXX_____________________
;       A 1     A   2   A     3 A
;12345678901234567890123456789012
SlowGraphicA
	.byte zz____X___
	.byte zz_____XXX
	.byte zz________
	.byte zz______X_
	.byte zz____XX__
	.byte zz_______X
	.byte zz_____XX_
	.byte zz____X___
	.byte zz______XX
	.byte zz____XX__
	.byte zz____X___
	.byte zz_____X__
	.byte zz______XX
SlowGraphicB
	.byte zzXXX_____
	.byte zzX__X____
	.byte zz____X__X
	.byte zz_X___X_X
	.byte zz__X__X_X
	.byte zzXX___X_X
	.byte zz___XX__X
	.byte zzXXX____X
	.byte zz_______X
	.byte zz_______X
	.byte zz________
	.byte zzXXXX____
	.byte zzX___X___
SlowGraphicC
	.byte zz________
	.byte zzX__XX___
	.byte zz__XX_X__
	.byte zz__X___X_
	.byte zz__X___X_
	.byte zz__X___X_
	.byte zz___X_XX_
	.byte zz____XX__
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz________
;	.byte zz________
SlowGraphicD
	.byte zz________
	.byte zz__XX_XX_
	.byte zz_XX_XX_X
	.byte zz_X__X__X
	.byte zz_X__X__X
	.byte zz_X__X__X
	.byte zz_X__X__X
	.byte zzX__X__X_
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz________

;       V 1     V   2   V     3 V       4
;12345678901234567890123456789012
;__________XXXX__X_______________
;________X_X__XXX________________
;_______XX_X__________________X__
;______X_X_X__________________X__
;________X_X__________________X__
;_______XX_XXX____XX____XX__XXXXX
;______X_X_X__X__X_XX__X_XX___X__
;________X_X____X___X__X______X__
;________X_X____X___X__XXX____X__
;________X_X____X___X_____X___X__
;________X_X____XX_X_X_XX_X___X__
;_______X________XX_____XX_____X_
;______X_________________________
;       A 1     A   2   A     3 A
;12345678901234567890123456789012
FastGraphicA
	.byte zz______X_
	.byte zz_______X
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz______X_
	.byte zz_______X
	.byte zz________
	.byte zz______X_
	.byte zz_______X
;	.byte zz________
;	.byte zz________
FastGraphicB
	.byte zz________
	.byte zz________
	.byte zzX_X____X
	.byte zzX_X____X
	.byte zzX_X____X
	.byte zzX_X____X
	.byte zzX_X__X__
	.byte zzX_XXX___
	.byte zzX_X_____
	.byte zzX_X_____
	.byte zzX_X_____
	.byte zzX_X__XXX
	.byte zz__XXXX__
FastGraphicC
	.byte zz________
	.byte zzXX_____X
	.byte zzX_X_X_XX
	.byte zz___X____
	.byte zz___X__XX
	.byte zz___X__X_
	.byte zzX_XX__X_
	.byte zz_XX____X
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zzX_______
FastGraphicD
	.byte zz________
	.byte zzX_____X_
	.byte zz_X___X__
	.byte zz_X___X__
	.byte zzX____X__
	.byte zz_____X__
	.byte zzXX___X__
	.byte zzX__XXXXX
	.byte zz_____X__
	.byte zz_____X__
	.byte zz_____X__
	.byte zz________
	.byte zz________


 echo "----",($FB00 - *) , "bytes of BANK 6 ROM left"
        ORG $DB00
        RORG $FB00

;       V 1     V   2   V     3 V       4
;123456789012345678901234567890123456789012345678
;____XXX_________
;__X_X_XX________
;_XX_X__XX_______
;X_X_X___X_______
;__X_X___X_______
;_XX_X___X____XX_
;X_X_X__XX___X_XX
;__X_X_X_X__X___X
;__X_XX__X__X___X
;__X_X___X__X___X
;__X_X__XXX_XX_X_
;_X______X___XX__
;X_______________
;       A 1     A   2   A     3 A       4
;123456789012345678901234567890123456789012345678
NoGraphicA
        .byte zzX_______
        .byte zz_X______
        .byte zz__X_X__X
        .byte zz__X_X___
        .byte zz__X_XX__
        .byte zz__X_X_X_
        .byte zzX_X_X__X
        .byte zz_XX_X___
        .byte zz__X_X___
        .byte zzX_X_X___
        .byte zz_XX_X__X
        .byte zz__X_X_XX
        .byte zz____XXX_
NoGraphicB
        .byte zz________
        .byte zzX___XX__
        .byte zzXX_XX_X_
        .byte zzX__X___X
        .byte zzX__X___X
        .byte zzX__X___X
        .byte zzX___X_XX
        .byte zzX____XX_
        .byte zzX_______
        .byte zzX_______
        .byte zzX_______
        .byte zz________
        .byte zz________

;       V 1     V   2   V     3 V       4
;123456789012345678901234567890123456789012345678
;______X____XXXXX________
;_____XX___X___X_________
;____X_X_______X_________
;______X______X__________
;_____XX_____X___________
;____X_X____X_____X___XX_
;_______X___X____XXX_X_XX
;_______X__X____X_X__X___
;_______X_X_____XX___XXX_
;________X______X_______X
;________X______XX_X_XX_X
;_______X_____X__XX___XX_
;______XXXXXXX___________
;       A 1     A   2   A     3 A       4
;123456789012345678901234567890123456789012345678

YesGraphicA

        .byte zz______XX
        .byte zz_______X
        .byte zz________
        .byte zz________
        .byte zz_______X
        .byte zz_______X
        .byte zz_______X
        .byte zz____X_X_
        .byte zz_____XX_
        .byte zz______X_
        .byte zz____X_X_
        .byte zz_____XX_
        .byte zz______X_
YesGraphicB
        .byte zzXXXXX___
        .byte zz_____X__
        .byte zzX______X
        .byte zzX______X
        .byte zz_X_____X
        .byte zz__X____X
        .byte zz___X____
        .byte zz___X____
        .byte zz____X___
        .byte zz_____X__
        .byte zz______X_
        .byte zz__X___X_
        .byte zz___XXXXX
YesGraphicC
        .byte zz________
        .byte zzXX___XX_
        .byte zzX_X_XX_X
        .byte zz_______X
        .byte zzX___XXX_
        .byte zz_X__X___
        .byte zzXXX_X_XX
        .byte zz_X___XX_
        .byte zz________
        .byte zz________
        .byte zz________
;        .byte zz________
;        .byte zz________




;       V 1     V   2   V     3 V       4
;123456789012345678901234567890123456789012345678
;______________XX________________________________
;_____________X__X___________________________X___
;____________X______________________X_______XX___
;_________X_X______X____________X___X________XX__
;________XX_X_______________________X_________XX_
;_______X_X_X___________XX_XX_____XXXXX__X_____XX
;________XX_X______X___X_XX_XX__X___X___XXX_X___X
;_______X_X_X______X___X__X__X__X___X__X_X__X___X
;_________X_X______X___X__X__X__X___X__XX___X___X
;________X_________X___X__X__X__X___X__X____X___X
;_______XXXX____XX_X__XXXXXXXXX_X___X__XX_X_XX_X_
;__________XXXXXX___X__X__X__X___X___X__XX___XX__
;________________________________________________
;       A 1     A   2   A     3 A       4
;123456789012345678901234567890123456789012345678

LimitedGraphicA
        .byte zz________
        .byte zz________
        .byte zz_______X
        .byte zz________
        .byte zz________
        .byte zz_______X
        .byte zz________
        .byte zz_______X
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________
;        .byte zz________
LimitedGraphicB
        .byte zz________
        .byte zz__XXXXXX
        .byte zzXXX____X
        .byte zzX_______
        .byte zz_X_X____
        .byte zz_X_X____
        .byte zzXX_X____
        .byte zz_X_X____
        .byte zzXX_X____
        .byte zz_X_X____
        .byte zz____X___
        .byte zz_____X__
        .byte zz______XX
LimitedGraphicC
        .byte zz________
        .byte zz___X__X_
        .byte zzX_X__XXX
        .byte zz__X___X_
        .byte zz__X___X_
        .byte zz__X___X_
        .byte zz__X___X_
        .byte zz_______X
        .byte zz________
        .byte zz__X_____
        .byte zz________
        .byte zzX_______
;        .byte zz________
LimitedGraphicD
        .byte zz________
        .byte zz_X__X___
        .byte zzXXXXXX_X
        .byte zz_X__X__X
        .byte zz_X__X__X
        .byte zz_X__X__X
        .byte zzXX_XX__X
        .byte zzX_XX____
        .byte zz________
        .byte zz_______X
        .byte zz________
        .byte zz________
;        .byte zz________
LimitedGraphicE
        .byte zz________
        .byte zzX___X__X
        .byte zz___X__XX
        .byte zz___X__X_
        .byte zz___X__XX
        .byte zz___X__X_
        .byte zz___X___X
        .byte zz_XXXXX__
        .byte zz___X____
        .byte zz___X____
        .byte zz___X____
        .byte zz________
;        .byte zz________
LimitedGraphicF
        .byte zz________
        .byte zzX___XX__
        .byte zz_X_XX_X_
        .byte zz___X___X
        .byte zz___X___X
        .byte zzX__X___X
        .byte zzXX_X___X
        .byte zzX_____XX
        .byte zz_____XX_
        .byte zz____XX__
        .byte zz___XX___
        .byte zz____X___
        .byte zz________


;       V 1     V   2
;123456789012345678901234
;X___X__X__XX__XXX_______
;XX_XX_X_X_X_X_X_________
;X_X_X_X_X_XX__XX________
;X___X_X_X_X_X_X_________
;X___X__X__X_X_XXX_______
;       A 1     A   2   A     3 A       4
;123456789012345678901234567890123456789012345678

MoreOptionsA
        .byte zzX___X__X
        .byte zzX___X_X_
        .byte zzX_X_X_X_
        .byte zzXX_XX_X_
        .byte zzX___X__X

MoreOptionsB
        .byte zz__X_X_XX
        .byte zzX_X_X_X_
        .byte zzX_XX__XX
        .byte zzX_X_X_X_
        .byte zz__XX__XX

MoreOptionsC
        .byte zzX_______
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zzX_______

ArrowDown
        .byte zz____X___
        .byte zz___XXX__
        .byte zz__X_X_X_
;        .byte zz____X___
;        .byte zz____X___
ArrowUp
        .byte zz____X___
        .byte zz____X___
        .byte zz__X_X_X_
        .byte zz___XXX__
        .byte zz____X___



;       V 1     V   2   V     3 V       4
;12345678901234567890123456789012
;____XXXX__X_____________________
;__X_X__XXX______________________
;_XX_X____________________X______
;X_X_X____X_______________X______
;__X_X____X_______________X______
;_XX_XXX__X____XX____XX___XX_____
;X_X_X__X_X___X_XX__X_XX__X_XX___
;__X_X____X__X___X__X_____X___X__
;__X_X____X__X___X__XXX___X___X__
;__X_X____X__X___X_____X__X___X__
;__X_X____X__XX_X_X_XX_X_XXX__X__
;_X________X__XX_____XX___X___X__
;X___________________________X___
;___________________________X____
;__________________________X_____
;       A 1     A   2   A     3 A
;12345678901234567890123456789012

FlashGraphicA
	.byte zz________
	.byte zz________
	.byte zzX_______
	.byte zz_X______
	.byte zz__X_X___
	.byte zz__X_X___
	.byte zz__X_X___
	.byte zz__X_X___
	.byte zzX_X_X__X
	.byte zz_XX_XXX_
	.byte zz__X_X___
	.byte zzX_X_X___
	.byte zz_XX_X___
	.byte zz__X_X__X
	.byte zz____XXXX
FlashGraphicB
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz__X__XX_
	.byte zz_X__XX_X
	.byte zz_X__X___
	.byte zz_X__X___
	.byte zz_X__X___
	.byte zz_X___X_X
	.byte zz_X____XX
	.byte zz_X______
	.byte zz_X______
	.byte zz________
	.byte zzXX______
	.byte zz__X_____
FlashGraphicC
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz____XX__
	.byte zz_X_XX_X_
	.byte zzX_____X_
	.byte zzX__XXX__
	.byte zzX__X____
	.byte zzX__X_XX_
	.byte zz____XX__
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz________
FlashGraphicD
	.byte zz__X_____
	.byte zz___X____
	.byte zz____X___
	.byte zz_X___X__
	.byte zzXXX__X__
	.byte zz_X___X__
	.byte zz_X___X__
	.byte zz_X___X__
	.byte zz_X_XX___
	.byte zz_XX_____
	.byte zz_X______
	.byte zz_X______
	.byte zz_X______
	.byte zz________
	.byte zz________

 echo "------",($FC00 - *) , "bytes of BANK 6b ROM left"
        ORG $DC00
        RORG $FC00


;       V 1     V   2   V     3 V       4
;123456789012345678901234567890123456789012345678
;__XXX___X_______________________________________
;_X__XXXX_____________________X__________________
;X___________________________XX__________________
;XX___________________________XX_________________
;__XX__________________________XX________________
;X___XXX____X__XX____X____X_____XX_______________
;_XX____XX___XX_XX__XXX__XXX_X___X_______________
;___XXX___X__X___X_X_X__X_X__X___X_______________
;XX____X__X__X___X_XX___XX___X___X_______________
;__X__X___X__X___X_X____X____X___X_______________
;________X__XXX_X__XX_X_XX_X_XX_X________________
;_XXXX__X____XXX____XX___XX___XX_________________
;X___XXX_____X___________________________________
;____________X___________________________________
;____________X___________________________________
;       A 1     A   2   A     3 A       4
;123456789012345678901234567890123456789012345678


SpeedGraphicA
        .byte zz________
        .byte zz________
        .byte zzX___XXX_
        .byte zz_XXXX__X
        .byte zz________
        .byte zz__X__X__
        .byte zzXX____X_
        .byte zz___XXX__
        .byte zz_XX____X
        .byte zzX___XXX_
        .byte zz__XX____
        .byte zzXX______
        .byte zzX_______
        .byte zz_X__XXXX
        .byte zz__XXX___
SpeedGraphicB
        .byte zz____X___
        .byte zz____X___
        .byte zz____X___
        .byte zz____XXX_
        .byte zzX__XXX_X
        .byte zz_X__X___
        .byte zz_X__X___
        .byte zz_X__X___
        .byte zzX___XX_X
        .byte zz___X__XX
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zzX_______
SpeedGraphicC
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz___XX___
        .byte zz__XX_X_X
        .byte zzX_X____X
        .byte zzX_XX___X
        .byte zzX_X_X__X
        .byte zzX__XXX__
        .byte zz____X___
        .byte zz________
        .byte zz________
;        .byte zz________
;        .byte zz________
;        .byte zz________
SpeedGraphicD
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zzXX___XX_
        .byte zzX_X_XX_X
        .byte zz____X___
        .byte zzX___X___
        .byte zz_X__X___
        .byte zzXXX_X___
        .byte zz_X_____X
        .byte zz______XX
        .byte zz_____XX_
        .byte zz____XX__
        .byte zz_____X__
;        .byte zz________
SpeedGraphicE
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zzX_______
        .byte zzX_______
        .byte zzX_______
        .byte zzX_______
        .byte zzX_______
        .byte zz________
        .byte zz________
        .byte zz________
;        .byte zz________
;        .byte zz________

;       V 1     V   2   V     3 V       4
;123456789012345678901234567890123456789012345678
;______XXX__X____________________________________
;___XX_X_XXX_____________________________________
;__XXX_X____________X________X___________________
;_XX_X_X____________X________X___________________
;_X__X_X____________X________X___________________
;XX__X_X______XX__XXXXX__XX__XX__________________
;XXXXX_X_____X_XX___X___X_XX_X_XX________________
;XX__X_X____X___X___X__X_____X___X_______________
;XX__X______X___X___X__X_____X___X_______________
;_X_X_______X___X___X__X_____X___X_______________
;_XX_____XX_XX_X_X__X__XX_X_XXX__X_______________
;__XX___XX___XX______X__XX___X___X_______________
;___XXXX________________________X________________
;______________________________X_________________
;_____________________________X__________________
;       A 1     A   2   A     3 A       4
;123456789012345678901234567890123456789012345678


CatchGraphicA
        .byte zz________
        .byte zz________
        .byte zz___XXXX_
        .byte zz__XX___X
        .byte zz_XX_____
        .byte zz_X_X____
        .byte zzXX__X___
        .byte zzXX__X_X_
        .byte zzXXXXX_X_
        .byte zzXX__X_X_
        .byte zz_X__X_X_
        .byte zz_XX_X_X_
        .byte zz__XXX_X_
        .byte zz___XX_X_
        .byte zz______XX
CatchGraphicB
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zzX___XX__
        .byte zzXX_XX_X_
        .byte zz___X___X
        .byte zz___X___X
        .byte zz___X___X
        .byte zz____X_XX
        .byte zz_____XX_
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zzXXX_____
        .byte zzX__X____
CatchGraphicC
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz____X__X
        .byte zzX__X__XX
        .byte zz___X__X_
        .byte zz___X__X_
        .byte zz___X__X_
        .byte zz___X___X
        .byte zz_XXXXX__
        .byte zz___X____
        .byte zz___X____
        .byte zz___X____
        .byte zz________
        .byte zz________
CatchGraphicD
        .byte zz_____X__
        .byte zz______X_
        .byte zz_______X
        .byte zzX___X___
        .byte zz_X_XXX__
        .byte zz____X___
        .byte zz____X___
        .byte zz____X___
        .byte zz_XX_X_XX
        .byte zzXX__XX__
        .byte zz____X___
        .byte zz____X___
        .byte zz____X___
;        .byte zz________
;        .byte zz________
CatchGraphicE
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zzX_______
        .byte zzX_______
        .byte zzX_______
        .byte zzX_______
        .byte zzX_______
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________

;       V 1     V   2   V     3 V       4
;123456789012345678901234567890123456789012345678
;____XXXX__X_____________________________________
;__X_X__XXX______________________________________
;_XX_X__________________X____________X__X________
;X_X_X____X_____________X____________X__X________
;__X_X__________________X____________X__X________
;_XX_XXX_____X__X____X__X_X_____XX___X__X___XX___
;X_X_X__X_X_XXXXXX__XXX_XX_XX__X_XX__X__X__X_XX__
;__X_X____X__X__X__X_X__X___X_X___X__X__X__X_____
;__X_X____X__X_____XX___X___X_X___X__X__X__XXX___
;__X_X____X__X_____X____X___X_X___X__X__X_____X__
;__X_X____X__X_____XX_X_XX_X__XX_X_X_X__X__XX_X__
;_X________X__X_____XX__XXX____XX_____X__X__XX___
;X_______________________________________________
;________________________________________________
;________________________________________________
;       A 1     A   2   A     3 A       4
;123456789012345678901234567890123456789012345678

FireballsGraphicA
        .byte zz________
        .byte zz________
        .byte zzX_______
        .byte zz_X______
        .byte zz__X_X___
        .byte zz__X_X___
        .byte zz__X_X___
        .byte zz__X_X___
        .byte zzX_X_X__X
        .byte zz_XX_XXX_
        .byte zz__X_X___
        .byte zzX_X_X___
        .byte zz_XX_X___
        .byte zz__X_X__X
        .byte zz____XXXX
FireballsGraphicB
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz__X__X__
        .byte zz_X__X___
        .byte zz_X__X___
        .byte zz_X__X___
        .byte zz_X__X__X
        .byte zz_X_XXXXX
        .byte zz____X__X
        .byte zz________
        .byte zz_X______
        .byte zz________
        .byte zzXX______
        .byte zz__X_____
FireballsGraphicC
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz___XX__X
        .byte zz__XX_X_X
        .byte zz__X____X
        .byte zz__XX___X
        .byte zz__X_X__X
        .byte zzX__XXX_X
        .byte zz____X__X
        .byte zz_______X
        .byte zz_______X
        .byte zz_______X
;        .byte zz________
;        .byte zz________
FireballsGraphicD
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zzXX____XX
        .byte zzX_X__XX_
        .byte zz___X_X__
        .byte zz___X_X__
        .byte zz___X_X__
        .byte zzX_XX__X_
        .byte zz_X_____X
        .byte zz________
        .byte zz________
;        .byte zz________
;        .byte zz________
;        .byte zz________
FireballsGraphicE
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz_____X__
        .byte zzX_X_X__X
        .byte zz_X__X__X
        .byte zz_X__X__X
        .byte zz_X__X__X
        .byte zzXX__X__X
        .byte zzX___X__X
        .byte zz____X__X
        .byte zz____X__X
        .byte zz____X__X
;        .byte zz________
;        .byte zz________
FireballsGraphicF
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zzX__XX___
        .byte zz__XX_X__
        .byte zz_____X__
        .byte zz__XXX___
        .byte zz__X_____
        .byte zz__X_XX__
        .byte zz___XX___
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________



 echo "------",($FD00 - *) , "bytes of BANK 6c ROM left"

        ORG $DD00
        RORG $FD00


;       V  1     V    2   V      3 V        4
;12345678 90123456 78901234 56789012 3456789012345678
;________ ________ ________ ________ ______X_________
;______X_ ___X____ ____XX__ ______X_ _____X__________
;_____XX_ __XXX___ ___XXXX_ _____XX_ _____XXX________
;____XXX_ _X__XX__ __X___XX ____XXX_ ________XXX_____
;___XXXX_ X____XX_ _X____X_ ___X_XX_ ______X_X__XX___
;__XXXXX_ ______X_ _____X__ __X__XX_ _____XX_X____XX_
;_X___XX_ ______XX ___XXXX_ _X___XX_ ____X_X_X_____XX
;_____XX_ ______X_ __X__XX_ XXXXXXXX ______X_XXX___XX
;_____XX_ _____X__ _____X__ _____XX_ _____XX_X__X__XX
;_____XX_ ___XX___ ____X___ _____XX_ ____X_X_X____XX_
;_____XX_ __X_____ XX_X____ _____XX_ ______X____XX___
;_____X__ _XXXX___ _XX_____ _____X__ _____X_XX_X_____
;________ ____XXXX ________ ________ ______X__X______
;       A  1     A    2   A      3 A       4
;12345678 90123456 78901234 56789012 3456789012345678

;       V  1     V    2   V
;12345678 90123456 78901234
;________ ________ ________
;_XXXXXXX XXXXXXXX ____X___
;XX______ _______X ___XXX__
;X_______ ______X_ __X__XX_
;X_XXXX__ _____X__ _X____XX
;XX____X_ ____X___ XX___XXX
;_______X ___XX___ _XXXX_XX
;_______X ___XX___ __X___XX
;XX_____X ___XX___ _____XX_
;_XX___X_ ___XX___ ____XX__
;__XX_X__ ___XXX__ XX_XX___
;___XX___ ____X___ _XXX____
;________ ________ ________
;       A  1     A    2   A
;12345678 90123456 78901234
; ZeroGraphic
        ; .byte zz________
        ; .byte zz__XX____
        ; .byte zz_XX_X___
        ; .byte zzXX___X__
        ; .byte zzXX____X_
        ; .byte zzXX____X_
        ; .byte zzXX____X_
        ; .byte zz_X____XX
        ; .byte zz_X____XX
        ; .byte zz__X___XX
        ; .byte zz___X_XX_
        ; .byte zz____XX__
; ;        .byte zz________


OneGraphic
        .byte zz________
        .byte zz_____X__
        .byte zz_____XX_
        .byte zz_____XX_
        .byte zz_____XX_
        .byte zz_____XX_
        .byte zz_X___XX_
        .byte zz__XXXXX_
        .byte zz___XXXX_
        .byte zz____XXX_
        .byte zz_____XX_
        .byte zz______X_
        .byte zz________

TwoGraphic
        .byte zz____XXXX
        .byte zz_XXXX___
        .byte zz__X_____
        .byte zz___XX___
        .byte zz_____X__
        .byte zz______X_
        .byte zz______XX
        .byte zz______X_
        .byte zzX____XX_
        .byte zz_X__XX__
        .byte zz__XXX___
        .byte zz___X____
;        .byte zz________

ThreeGraphic
        .byte zz________
        .byte zz_XX_____
        .byte zzXX_X____
        .byte zz____X___
        .byte zz_____X__
        .byte zz__X__XX_
        .byte zz___XXXX_
        .byte zz_____X__
        .byte zz_X____X_
        .byte zz__X___XX
        .byte zz___XXXX_
        .byte zz____XX__
;        .byte zz________

FourGraphic
        .byte zz________
        .byte zz_____X__
        .byte zz_____XX_
        .byte zz_____XX_
        .byte zz_____XX_
        .byte zzXXXXXXXX
        .byte zz_X___XX_
        .byte zz__X__XX_
        .byte zz___X_XX_
        .byte zz____XXX_
        .byte zz_____XX_
        .byte zz______X_
;        .byte zz________

FiveGraphic
        .byte zz________
        .byte zz___XX___ ; FIVE
        .byte zz__XX_X__
        .byte zz_XX___X_
        .byte zzXX_____X
        .byte zz_______X
        .byte zz_______X
        .byte zzXX____X_
        .byte zzX_XXXX__
        .byte zzX_______
        .byte zzXX______
        .byte zz_XXXXXXX
;        .byte zz________

; SixGraphic
        ; .byte zz________
       ; .byte zz___XX___ ; SIX
       ; .byte zz__XX_X__
       ; .byte zz_XX___X_
       ; .byte zz_X_XXX__
       ; .byte zz_X______
       ; .byte zz__X__X__
       ; .byte zz___XX___
        ; .byte zz________
        ; .byte zz________
        ; .byte zz________
        ; .byte zz________
; ;        .byte zz________
SevenGraphic
        .byte zz________
        .byte zz____X___ ; SEVEN
        .byte zz___XXX__
        .byte zz___XX___
        .byte zz___XX___
        .byte zz___XX___
        .byte zz___XX___
        .byte zz____X___
        .byte zz_____X__
        .byte zz______X_
        .byte zz_______X
        .byte zzXXXXXXXX
;        .byte zz________

; EightGraphic
        ; .byte zz________
       ; .byte zz___XX___ ; EIGHT
       ; .byte zz__XX_X__
       ; .byte zz_XX__XX_
       ; .byte zz_XX_XX__
       ; .byte zz___XXX__
       ; .byte zz__XX__X_
       ; .byte zz___XXX__
        ; .byte zz________
        ; .byte zz________
        ; .byte zz________
        ; .byte zz________
; ;        .byte zz________

NineGraphic
        .byte zz________
        .byte zz_XXX____ ; NINE
        .byte zzXX_XX___
        .byte zz____XX__
        .byte zz_____XX_
        .byte zz__X___XX
        .byte zz_XXXX_XX
        .byte zzXX___XXX
        .byte zz_X____XX
        .byte zz__X__XX_
        .byte zz___XXX__
        .byte zz____X___
        .byte zz________


;DoublesGraphic
;       .byte zz______X_
;       .byte zz_____X_X
;       .byte zz______X_
;       .byte zz____X_X_
;       .byte zz_____XX_
;       .byte zz______X_
;       .byte zz____X_X_
;       .byte zz_____XX_
;       .byte zz______X_
;       .byte zz________
;       .byte zz_____XXX
;       .byte zz_____X__
;       .byte zz______X_
;
;       .byte zz_X______
;       .byte zzX_X_____
;       .byte zz___XX___
;       .byte zzX____XX_
;       .byte zzX__X__XX
;       .byte zzXXX___XX
;       .byte zzX_____XX
;       .byte zzX____XX_
;       .byte zzX__XX___
;       .byte zzXXX_____
;       .byte zz________
;       .byte zz________
;       .byte zz________

;       V 1     V   2   V     3 V       4
;123456789012345678901234567890123456789012345678
;_____X__________________________________________
;____X_________________________X_____X___________
;____XXX_______________________X_____X___________
;_______XXX____________________X_____X___________
;_____X_X__XX__________________X_____X___________
;____XX_X____XX____XX__X___X___X_XX__X____X___XX_
;___X_X_X_____XX__X_XX_XX__XX__XX_XX_X___XXX_X_XX
;_____X_XXX___XX_X___X__X___X__X___X_X__X_X__X___
;____XX_X__X__XX_X___X__X___X__X___X_X__XX___XXX_
;___X_X_X____XX__X___X__X___X__X___X_X__X_______X
;_____X____XX____XX_X___XX_XX__XX_X__X__XX_X_XX_X
;____X_XX_X_______XX_____XX__X__XX____X__XX___XX_
;_____X__X_______________________________________
;       A 1     A   2   A     3 A       4
;123456789012345678901234567890123456789012345678

DoublesGraphicA
        .byte zz_____X__
        .byte zz____X_XX
        .byte zz_____X__
        .byte zz___X_X_X
        .byte zz____XX_X
        .byte zz_____X_X
        .byte zz___X_X_X
        .byte zz____XX_X
        .byte zz_____X_X
        .byte zz_______X
        .byte zz____XXX_
        .byte zz____X___
        .byte zz_____X__
DoublesGraphicB
        .byte zzX_______
        .byte zz_X______
        .byte zz__XX____
        .byte zz____XX__
        .byte zz__X__XX_
        .byte zzXX___XX_
        .byte zz_____XX_
        .byte zz____XX__
        .byte zz__XX____
        .byte zzXX______
        .byte zz________
        .byte zz________
;        .byte zz________
DoublesGraphicC
        .byte zz________
        .byte zz_XX_____
        .byte zzXX_X___X
        .byte zzX___X__X
        .byte zzX___X__X
        .byte zzX___X__X
        .byte zz_X_XX_XX
        .byte zz__XX__X_
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________
;        .byte zz________
DoublesGraphicD
        .byte zz________
        .byte zzXX__X__X
        .byte zzX_XX__XX
        .byte zz___X__X_
        .byte zz___X__X_
        .byte zz___X__X_
        .byte zz__XX__XX
        .byte zz__X___X_
        .byte zz______X_
        .byte zz______X_
        .byte zz______X_
        .byte zz______X_
;        .byte zz________
DoublesGraphicE
        .byte zz________
        .byte zzX____X__
        .byte zz_X__X__X
        .byte zz__X_X__X
        .byte zz__X_X__X
        .byte zz__X_X__X
        .byte zz_XX_X___
        .byte zzXX__X___
        .byte zz____X___
        .byte zz____X___
        .byte zz____X___
        .byte zz____X___
;        .byte zz________
DoublesGraphicF
        .byte zz________
        .byte zzXX___XX_
        .byte zzX_X_XX_X
        .byte zz_______X
        .byte zzX___XXX_
        .byte zz_X__X___
        .byte zzXXX_X_XX
        .byte zz_X___XX_
        .byte zz________
        .byte zz________
        .byte zz________
;        .byte zz________
;        .byte zz________



 ;       V
;12345678
;________ ________ ________ ________
;________ ________ ________ ________
;________ ________ ________ ________
;XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
;X_X____X X______X X____X_X X______X
;XXX____X X______X X____XXX X______X
;X______X X______X X______X X______X
;X______X X____XXX X______X XXX____X
;X______X X____X_X X______X X_X____X
;XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
;________ ________ ________ ________
;________ ________ ________ ________
;________ ________ ________ ________
;       A 1     A
;1234567890123456

TopLeft
        .byte zz________
        .byte zz________
        .byte zzXXXXXXXX
        .byte zzX______X
        .byte zzX______X
        .byte zzX______X
        .byte zzX______X
        .byte zzX______X
        .byte zzXXX____X
        .byte zzX_X____X
        .byte zzXXXXXXXX
        .byte zz________
        .byte zz________
;        .byte zz________  ; for Catch title
;        .byte zz________

BottomRight
        .byte zz________
        .byte zz________
        .byte zzXXXXXXXX
        .byte zzX____X_X
        .byte zzX____XXX
        .byte zzX______X
        .byte zzX______X
        .byte zzX______X
        .byte zzX______X
        .byte zzX______X
        .byte zzXXXXXXXX
        .byte zz________
        .byte zz________
;        .byte zz________  ; for Catch title
;        .byte zz________

TopRight
        .byte zz________
        .byte zz________
        .byte zzXXXXXXXX
        .byte zzX______X
        .byte zzX______X
        .byte zzX______X
        .byte zzX______X
        .byte zzX______X
        .byte zzX____XXX
        .byte zzX____X_X
        .byte zzXXXXXXXX
        .byte zz________
        .byte zz________
;        .byte zz________  ; for Catch title
;        .byte zz________

BottomLeft
        .byte zz________
        .byte zz________
        .byte zzXXXXXXXX
        .byte zzX_X____X
        .byte zzXXX____X
        .byte zzX______X
        .byte zzX______X
        .byte zzX______X
        .byte zzX______X
        .byte zzX______X
        .byte zzXXXXXXXX
        .byte zz________
        .byte zz________
        .byte zz________  ; for Catch title
;        .byte zz________

;       V 1     V   2   V     3 V       4
;1234567890123456789012345678901234567890
;___________XXX__X_______________________
;________XX_X_XXX________________________
;_______XXX_X_________________X___X______
;______XX_X_X_________________X___X______
;______X__X_X_______________XXXXX_X______
;_____XX__X_X______XX____XX___X___X____X_
;_____XXXXX_X_____X_XX__X_XX__X___X___XXX
;_____XX__X_X____X___X__X_____X___X__X_X_
;_____XX__X______X___X__XXX___X___X__XX__
;______X_X_______X___X_____X__X___X__X___
;______XX_____XX_XX_X_X_XX_X__X___X__XX_X
;_______XX___XX___XX_____XX____X___X__XX_
;________XXXX____________________________
;       A 1     A   2   A     3 A       4
;1234567890123456789012345678901234567890

CastleGraphicA
	.byte zz________
	.byte zz_______X
	.byte zz______XX
	.byte zz______X_
	.byte zz_____XX_
	.byte zz_____XX_
	.byte zz_____XXX
	.byte zz_____XX_
	.byte zz______X_
	.byte zz______XX
	.byte zz_______X
	.byte zz________
	.byte zz________
CastleGraphicB
	.byte zzXXXX____
	.byte zzX___XX__
	.byte zz_____XX_
	.byte zzX_______
	.byte zz_X______
	.byte zz_X_X____
	.byte zzXX_X____
	.byte zz_X_X____
	.byte zz_X_X____
	.byte zz_X_X____
	.byte zzXX_X____
	.byte zzXX_X_XXX
	.byte zz___XXX__
CastleGraphicC
	.byte zz________
	.byte zz_XX_____
	.byte zzXX_X_X_X
	.byte zzX___X___
	.byte zzX___X__X
	.byte zzX___X__X
	.byte zz_X_XX__X
	.byte zz__XX____
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zzX_______





 echo "------",($FE00 - *) , "bytes of BANK 6d ROM left"


        ORG $DE00
        RORG $FE00
CastleGraphicD
	.byte zz________
	.byte zzXX____X_
	.byte zzX_X__X__
	.byte zz__X__X__
	.byte zzXX___X__
	.byte zz_____X__
	.byte zz_XX__X__
	.byte zzXX___X__
	.byte zz___XXXXX
	.byte zz_____X__
	.byte zz_____X__
	.byte zz________
;	.byte zz________
CastleGraphicE
	.byte zz________
	.byte zz__X__XX_
	.byte zz_X__XX_X
	.byte zz_X__X___
	.byte zz_X__XX__
	.byte zz_X__X_X_
	.byte zz_X___XXX
	.byte zz_X____X_
	.byte zz_X______
	.byte zz_X______
	.byte zz_X______
;	.byte zz________
;	.byte zz________

BlankGraphic
        .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0




;       V 1     V   2   V     3 V       4
;123456789012345678901234567890123456789012345678
;XXXXXX_X________________________________________
;X_X_XXX_________________________________________
;__X_X_XX__X_____________________________________
;_XX_X__XX_X_____________________________________
;X_X_X___X X_____________________________________
;__X_X__XX_X____XX__X___X____X___X__X___XX_______
;__X_X_XX__X___X_XX_XX__XX__XXX_XXXXXX_X_XX______
;_XX___X___X__X___X__X___X_X_X___X__X__X_________
;X_X_______X__X___X__X___X_XX____X_____XXX_______
;__X_______X__X___X__X___X_X_____X________X______
;__X_______X__XX_X_X_XX_XX_XX_X__X_____XX_X______
;_XXXX__X___X__XX_____XX_X__XX____X_____XX_______
;___XXXX_________________X_______________________
;_______________________X________________________
;______________________X_________________________
;       A 1     A   2   A     3 A       4
;123456789012345678901234567890123456789012345678

PlayersGraphicA
        .byte zz________
        .byte zz________
        .byte zz___XXXX_
        .byte zz_XXXX__X
        .byte zz__X_____
        .byte zz__X_____
        .byte zzX_X_____
        .byte zz_XX___X_
        .byte zz__X_X_XX
        .byte zz__X_X__X
        .byte zzX_X_X___
        .byte zz_XX_X__X
        .byte zz__X_X_XX
        .byte zzX_X_XXX_
        .byte zzXXXXXX_X
PlayersGraphicB
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz___X__XX
        .byte zz__X__XX_
        .byte zz__X__X__
        .byte zz__X__X__
        .byte zz__X__X__
        .byte zz__X___X_
        .byte zzX_X____X
        .byte zzX_X_____
        .byte zzX_X_____
        .byte zz__X_____
        .byte zz________
        .byte zz________
PlayersGraphicC
        .byte zz______X_
        .byte zz_______X
        .byte zz________
        .byte zz_____XX_
        .byte zzX_X_XX_X
        .byte zz_X__X___
        .byte zz_X__X___
        .byte zz_X__X___
        .byte zzXX_XX__X
        .byte zzX__X___X
        .byte zz________
        .byte zz________
        .byte zz________
;        .byte zz________
;        .byte zz________
PlayersGraphicD
        .byte zz________
        .byte zz________
        .byte zzX_______
        .byte zzX__XX___
        .byte zzX_XX_X__
        .byte zzX_X_____
        .byte zzX_XX____
        .byte zzX_X_X___
        .byte zzX__XXX_X
        .byte zz____X___
        .byte zz________
        .byte zz________
;        .byte zz________
;        .byte zz________
;        .byte zz________
PlayersGraphicE
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz_X_____X
        .byte zzX_____XX
        .byte zzX_______
        .byte zzX_____XX
        .byte zzX__X__X_
        .byte zzXXXXX_X_
        .byte zzX__X___X
        .byte zz________
        .byte zz________
;        .byte zz________
;        .byte zz________
;        .byte zz________
PlayersGraphicF
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zzX_______
        .byte zz_X______
        .byte zz_X______
        .byte zzX_______
        .byte zz________
        .byte zzXX______
        .byte zzX_______
        .byte zz________
        .byte zz________
        .byte zz________
;        .byte zz________
;        .byte zz________


;       V 1     V   2   V     3 V       4
;123456789012345678901234567890123456789012345678
;__XXX___X__________________________XXXXXXXXXXXXX
;_X__XXXX___________________________X___________X
;X____________X_________________X___X___X_X_X___X
;XX___________X_________________X___X___X_X_X___X
;__XX_________X_________________X___X___X_X_X___X
;X___XXX____XXXXX__XX___X__X__XXXXX_X___X_X_X___X
;_XX____XX____X___X_XX_XXXXXX___X___X___X_X_X___X
;___XXX___X___X__X___X__X__X____X___X___X_X_X___X
;XX____X__X___X__X___X__X_______X___X__X__X__X__X
;__X__X___X___X__X___X__X_______X___X_X___X___X_X
;________X____X__XX_X_X_X_______X___X___________X
;_XXXX__X______X__XX_____X_______X___X_________X_
;X___XXX______________________________XX_____XX__
;_______________________________________XX_XX____
;_________________________________________X______
;       A 1     A   2   A     3 A       4
;123456789012345678901234567890123456789012345678

StartGraphicA
        .byte zz________
        .byte zz________
        .byte zzX___XXX_
        .byte zz_XXXX__X
        .byte zz________
        .byte zz__X__X__
        .byte zzXX____X_
        .byte zz___XXX__
        .byte zz_XX____X
        .byte zzX___XXX_
        .byte zz__XX____
        .byte zzXX______
        .byte zzX_______
        .byte zz_X__XXXX
        .byte zz__XXX___
StartGraphicB
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz______X_
        .byte zzX____X__
        .byte zz_X___X__
        .byte zz_X___X__
        .byte zz_X___X__
        .byte zzX____X__
        .byte zz___XXXXX
        .byte zz_____X__
        .byte zz_____X__
        .byte zz_____X__
        .byte zz________
        .byte zzX_______
StartGraphicC
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz_XX_____
        .byte zzXX_X_X_X
        .byte zzX___X__X
        .byte zzX___X__X
        .byte zzX___X__X
        .byte zz_X_XX_XX
        .byte zz__XX___X
        .byte zz________
        .byte zz________
;        .byte zz________
;        .byte zz________
;        .byte zz________
StartGraphicD
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zzX_______
        .byte zz_______X
        .byte zz_______X
        .byte zz_______X
        .byte zz__X____X
        .byte zzXXXX___X
        .byte zz__X__XXX
        .byte zz_______X
        .byte zz_______X
        .byte zz_______X
        .byte zz________
;        .byte zz________
StartGraphicE
        .byte zz________
        .byte zz_______X
        .byte zz_____XX_
        .byte zzX___X___
        .byte zz___X____
        .byte zz___X_X__
        .byte zz___X__X_
        .byte zz___X___X
        .byte zz___X___X
        .byte zzXX_X___X
        .byte zz___X___X
        .byte zz___X___X
        .byte zz___X___X
        .byte zz___X____
        .byte zz___XXXXX
StartGraphicF
        .byte zz_X______
        .byte zzX_XX____
        .byte zz____XX__
        .byte zz______X_
        .byte zz_______X
        .byte zz_X___X_X
        .byte zz_X__X__X
        .byte zz_X_X___X
        .byte zz_X_X___X
        .byte zz_X_X___X
        .byte zz_X_X___X
        .byte zz_X_X___X
        .byte zz_X_X___X
        .byte zz_______X
        .byte zzXXXXXXXX

;       V 1     V   2   V     3 V
;12345678901234567890123456789012
;__________X_____________________
;__________X__XX________X________
;________X_X____X______XX________
;_______XX_X___X____X___XX_______
;______X_X_X__X__________XX______
;________X_XXX____________XX__XX_
;_______XX_X__XX____X__X___X_X_XX
;______X_X_X____XX__X__X___X_X___
;________X_X_____X__X__X___X_XXX_
;________X_______X__X__X___X____X
;________X______XXX_X__XX_X__XX_X
;_______XXXX__X__X___X__XX____XX_
;_________XXXX___________________
;       A 1     A   2   A     3 A
;12345678901234567890123456789012
KidsGraphicA
	.byte zz________
	.byte zz_______X
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz______X_
	.byte zz_______X
	.byte zz________
	.byte zz______X_
	.byte zz_______X
	.byte zz________
	.byte zz________
	.byte zz________
KidsGraphicB
	.byte zz_XXXX___
	.byte zzXXX__X__
	.byte zzX______X
	.byte zzX_______
	.byte zzX_X_____
	.byte zzX_X____X
	.byte zzX_X__XX_
	.byte zzX_XXX___
	.byte zzX_X__X__
	.byte zzX_X___X_
	.byte zzX_X____X
	.byte zz__X__XX_
	.byte zz__X_____
KidsGraphicC
	.byte zz________
	.byte zzX___X__X
	.byte zzXX_X__XX
	.byte zzX__X__X_
	.byte zzX__X__X_
	.byte zzX__X__X_
	.byte zz___X__X_
	.byte zz________
	.byte zz________
	.byte zz___X___X
	.byte zz______XX
	.byte zz_______X
;	.byte zz________
KidsGraphicD
	.byte zz________
	.byte zzX____XX_
	.byte zz_X__XX_X
	.byte zz__X____X
	.byte zz__X_XXX_
	.byte zz__X_X___
	.byte zz__X_X_XX
	.byte zz_XX__XX_
	.byte zzXX______
	.byte zzX_______
	.byte zz________
	.byte zz________
	.byte zz________




 echo "------",($FF00 - *) , "bytes of BANK 6e ROM left"

        ORG $DF00
        RORG $FF00

;       V 1     V   2   V     3 V       4
;123456789012345678901234567890123456789012345678
;_____X___X__________X___________________________
;__X_XXX__XX________XX____X______________________
;_XX_X_XXX_XX________XX__XXX___________________X_
;X_X_X__X__XX_________XX__X____________________X_
;__X_X__X___X____X_____XX______X__X___X___XX___X_
;_XX_X__X__XX___XXX_X___X_X___XXX__X__X__X_XX__X_
;X_X_X__X_X_X__X_X__X___X_X__X_X___X__X_X___X__X_
;__X_X__XX__X__XX___X___X_X__XX____X__X_X___X__X_
;__X_X__X___X__X____X___X_X__X_____X__X_X___X__X_
;__X_X_XXX_XXX_XX_X_XX_X__X__XX_X__XX_X_XX_X_X_X_
;_X_____X___X___XX___XX____X__XX____XX___XX_____X
;X_______________________________________________
;_____X___X______________________________________
;__X_XXX__XX_________________X___________________
;_XX_X_XXX_XX________________X___________________
;X_X_X__X___X________________X___________________
;__X_X__X___X____XX__X___X___X_X_____X____XX_XX__
;_XX_X__X__XX___X_XX_XX__XX__XXXX___XXX__X_XX_XX_
;X_X_X__X_X_X__X___X__X___X__XX_XX_X_X___X__X__X_
;__X_X__XX__X__X___X__X___X__X___X_XX____X__X__X_
;__X_X__X___X__X___X__X___X__X___X_X_____X__X__X_
;__X_X_XXX_XXX_XX_X_X_XX_XX_XXX__X_XX_X_XXXXXXXXX
;_X_____X___X___XX_____XX_X__X___X__XX___X__X__X_
;X________________________X_____X________________
;________________________X_____X_________________
;_______________________X_____X__________________
;       A 1     A   2   A     3 A       4
;123456789012345678901234567890123456789012345678
MMlogoA
        .byte zz________
        .byte zz________
        .byte zzX_______
        .byte zz_X_____X
        .byte zz__X_X_XX
        .byte zz__X_X__X
        .byte zz__X_X__X
        .byte zzX_X_X__X
        .byte zz_XX_X__X
        .byte zz__X_X__X
        .byte zzX_X_X__X
        .byte zz_XX_X_XX
        .byte zz__X_XXX_
        .byte zz_____X__
        .byte zzX_______
        .byte zz_X_____X
        .byte zz__X_X_XX
        .byte zz__X_X__X
        .byte zz__X_X__X
        .byte zzX_X_X__X
        .byte zz_XX_X__X
        .byte zz__X_X__X
        .byte zzX_X_X__X
        .byte zz_XX_X_XX
        .byte zz__X_XXX_
        .byte zz_____X__
MMlogoB
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz___X___X
        .byte zzX_XXX_XX
        .byte zz___X__X_
        .byte zzX__X__X_
        .byte zz_X_X__X_
        .byte zz__XX___X
        .byte zz___X____
        .byte zz___X____
        .byte zzX_XX____
        .byte zz_XX_____
        .byte zz_X______
        .byte zz________
        .byte zz___X___X
        .byte zzX_XXX_XX
        .byte zz___X__X_
        .byte zzX__X__XX
        .byte zz_X_X__X_
        .byte zz__XX___X
        .byte zz___X____
        .byte zz__XX____
        .byte zzX_XX____
        .byte zz_XX_____
        .byte zz_X______
MMlogoC
        .byte zz_______X
        .byte zz________
        .byte zz________
        .byte zzX_____XX
        .byte zz_X_X_XX_
        .byte zz__X__X__
        .byte zz__X__X__
        .byte zz__X__X__
        .byte zz_XX_XX__
        .byte zzXX__X___
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zzX___XX__
        .byte zz_X_XX_X_
        .byte zz___X___X
        .byte zz___X___X
        .byte zzX__X___X
        .byte zzXX_X___X
        .byte zzX_____XX
        .byte zz_____XX_
        .byte zz____XX__
        .byte zz___XX___
        .byte zz____X___
MMlogoD
        .byte zz_____X__
        .byte zzX_____X_
        .byte zz_X_____X
        .byte zz_X__X___
        .byte zzXX_XXX__
        .byte zz_X__X___
        .byte zz_X__X___
        .byte zz_X__XX_X
        .byte zzXX__XXXX
        .byte zzX___X_X_
        .byte zz____X___
        .byte zz____X___
        .byte zz____X___
        .byte zz________
        .byte zz________
        .byte zz__X__XX_
        .byte zz_X__XX_X
        .byte zz_X__X___
        .byte zz_X__XX__
        .byte zz_X__X_X_
        .byte zz_X___XXX
        .byte zz______X_
        .byte zz_X______
        .byte zzXXX_____
        .byte zz_X______
;        .byte zz________
MMlogoE
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zzX__XX___
        .byte zzX_XX_X_X
        .byte zzX_X_____
        .byte zzX_XX____
        .byte zzX_X_X___
        .byte zz___XXX__
        .byte zz____X___
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz___XX___
        .byte zz__XX_X_X
        .byte zz__X__X_X
        .byte zz__X__X_X
        .byte zz__X__X_X
        .byte zz__X__X__
        .byte zz_X___X__
        .byte zz________
;        .byte zz________
;        .byte zz________
;        .byte zz________
MMlogoF
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zzX__X__X_
        .byte zzXXXXXXXX
        .byte zzX__X__X_
        .byte zzX__X__X_
        .byte zzX__X__X_
        .byte zzX_XX_XX_
        .byte zz_XX_XX__
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zzXX_____X
        .byte zzX_X_X_X_
        .byte zz___X__X_
        .byte zz___X__X_
        .byte zz___X__X_
        .byte zzX_XX__X_
        .byte zz_XX___X_
        .byte zz______X_
        .byte zz______X_
        .byte zz________
        .byte zz________

;       V 1     V   2   V     3 V       4
;123456789012345678901234567890123456789012345678
;____________X___________________________________
;_XXXXXXXXXXX______________X_X___X_______________
;X____X_X____________X____XX_X__X________________
;____XX_X___________X_X__X_X_X_X_X_______________
;___XXX_X______________XX__X_XX__X__X____________
;__X__X_X_______XX______X_XX_X___X_____X_XX______
;_XXXXX_X______X_XX______X_X_X__XX__X___X_XX_____
;_XX__X_X_____X___X______X_X_X_X_X__X___X__X_____
;_XX__X_______X___X_____X____XX__X__X___X__X_____
;__X_X________X___X____X_____X___X__X___X__X_____
;__XX______XX_XX_X____XX____XX___X__X__XXXXXX____
;___XX___XX____XX______XX_XX_XX_X____X__X__X_____
;____XXXX_______________XX____XX_________________
;________________________________________________
;________________________________________________
;       A 1     A   2   A     3 A       4
;123456789012345678901234567890123456789012345678
ToWinGraphicA
	.byte zz________
	.byte zz________
	.byte zz____XXXX
	.byte zz___XX___
	.byte zz__XX____
	.byte zz__X_X___
	.byte zz_XX__X__
	.byte zz_XX__X_X
	.byte zz_XXXXX_X
	.byte zz__X__X_X
	.byte zz___XXX_X
	.byte zz____XX_X
	.byte zzX____X_X
	.byte zz_XXXXXXX
;	.byte zz________
ToWinGraphicB
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zzXX____XX
	.byte zz__XX_XX_
	.byte zz_____X__
	.byte zz_____X__
	.byte zz_____X__
	.byte zz______X_
	.byte zz_______X
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zzXXXX____
	.byte zz____X___
ToWinGraphicC
	.byte zz________
	.byte zz________
	.byte zz_______X
	.byte zz______XX
	.byte zzX____XX_
	.byte zz_X____X_
	.byte zz_X_____X
	.byte zz_X______
	.byte zzXX______
	.byte zzX______X
	.byte zz______XX
	.byte zz___X_X__
	.byte zz____X___
;	.byte zz________
;	.byte zz________
ToWinGraphicD
	.byte zz________
	.byte zz________
	.byte zzX____XX_
	.byte zz_XX_XX_X
	.byte zz___XX___
	.byte zz____X___
	.byte zz____XX__
	.byte zzX_X_X_X_
	.byte zzX_X_X__X
	.byte zz_XX_X___
	.byte zz__X_XX__
	.byte zzX_X_X_X_
	.byte zz_XX_X__X
	.byte zz__X_X___
;	.byte zz________
ToWinGraphicE
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz____X__X
	.byte zzX__X__XX
	.byte zzX__X___X
	.byte zzX__X___X
	.byte zzX__X___X
	.byte zzX__X___X
	.byte zzX_____X_
	.byte zzX__X____
	.byte zzX_______
	.byte zz________
	.byte zzX_______
;	.byte zz________
ToWinGraphicF
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz__X_____
	.byte zzXXXX____
	.byte zz__X_____
	.byte zz__X_____
	.byte zz__X_____
	.byte zz_XX_____
	.byte zzXX______
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz________
	.byte zz________


 echo "------",($FFEE - *) , "bytes of BANK 6f ROM left"

        ORG $DFEE
        RORG $FFEE
MMEE
        cmp SelectBank4
        jmp MMEEcode
        BANKS_AND_VECTORS


;--------------------------------------------------------------------
; bank 7 - Game Overscan
;--------------------------------------------------------------------

        ORG $E000
        JUMP_TABLE
GetBank6SequenceData
        cmp SelectBank6
        jmp GetBank6SequenceDataCode
GetBank7SequenceData
        cmp SelectBank7
        jmp GetBank7SequenceDataCode
ReturnData
        cmp SelectBank5
        jmp ReturnDataCode



OverscanGameCode SUBROUTINE
        lda #2
        sta VBLANK        ;turn off video output
        ldx #OVERSCAN_DELAY
        stx TIM64T

        ldx #$ff          ; init stack pointer so we can use JSR
        txs

        ldx Paddles2Read  ; adjust the paddle readings to a 0-74 range
        sec
        lda Paddle1,x
        sbc #$0d
        sta Paddle1,x
        sec
        lda Paddle3,x
        sbc #$0d
        sta Paddle3,x

        lda #0                   ; 0 used to reset WALL temp storage
        sta ScreenColor          ; set background to black
;        ldx #2    2    unrolled to save 16 cycles
;.loop
        sta Wall1L               ; blank out king areas so castle
        sta Wall4L             ; collision routines work correctly
        sta Wall2R
        sta Wall3R
        sta Wall1L+1
        sta Wall4L+1
        sta Wall2R+1
        sta Wall3R+1
        sta Wall1L+2
        sta Wall4L+2
        sta Wall2R+2
        sta Wall3R+2
;        dex           2 * 3 = 6
;        bpl .loop     2 * 3 + 2 = 8



ProcessFirebuttons
;        lda #0              ; a = 0 from wall inits
        sta PaddleButtons
        lda SWCHA            ; 12--34-- ; bits holding firebuttons
        eor #$FF             ; make so 1 = pressed instead of 0 = pressed
        lsr                  ; -12--34-
        lsr                  ; --12--34
        lsr                  ; ---12--3 C=4
        rol PaddleButtons    ; -------4
        lsr                  ; ----12-- C=3
        rol PaddleButtons    ; ------43
        lsr                  ; -----12-
        lsr                  ; ------12
        lsr                  ; -------1 C=2
        rol PaddleButtons    ; -----432
        lsr                  ; -------- C=1
        rol PaddleButtons    ; ----4321

; randomly change state of AI catch buttons
        lda Frame
        and #%00001111 ; was %00011111  changed to reduce long catches
        bne AssignPaddles
	lda Frame
	and #%11000000
	beq .ai1
	cmp #%01000000
	beq .ai2
	cmp #%10000000
	beq .ai3
.ai4	lda #%00001000
	.byte $2c
.ai3	lda #%00000100
	.byte $2c
.ai2    lda #%00000010
	.byte $2c
.ai1	lda #%00000001
        ldy rand
        cpy #192             ; carry will be set 1/4th the time
	bcc ClearAIbutton
	ora AIcatch
	bne StoreAIcatch
ClearAIbutton
	eor #$ff
	and AIcatch
StoreAIcatch
	sta AIcatch

AssignPaddles
        bit GameOptions
        bpl APnotDemoMode
        lda PaddleButtons
        and #1
        beq APskip2
        lda GameOptions
        and #%10111111    ; flag that button1 was pressed
        sta GameOptions
        bne APnotDemoMode
APskip2 bit GameOptions   ; was button 1 pressed then released?
        bvs APnotDemoMode
        lda #ATTRACT_DELAY
        sta ExtraFireball
        jmp OverscanMenu2
APnotDemoMode
        lda HumanPlayers
        bpl NotDoubles
        lda Paddle1
        sta Paddle4
        lda Paddle2
        sta Paddle3
        lda PaddleButtons
        and #%11
        tay
        lda DoublesButtons,y
        sta PaddleButtons
        jmp MergeHumanAIcatch
DoublesButtons
        .byte %0000
        .byte %1001
        .byte %0110
        .byte %1111
NotDoubles
        and #%1111
        cmp #%0010
        bne NotOneBR
        lda Paddle1
        sta Paddle2
;        lda PaddleButtons     3
;        and #%0001            2   not needed
;        asl                   2
;        sta PaddleButtons     3
        asl PaddleButtons     ;5 - saves 3 cycles w/out lda-sta
        jmp MergeHumanAIcatch
NotOneBR
        cmp #%0100
        bne NotOneTR
        lda Paddle1
        sta Paddle3
        lda PaddleButtons
;        and #%0001          ; not needed - saves 2 cycles
        asl               ;  2
        asl               ;  2
        sta PaddleButtons ;  3
        jmp MergeHumanAIcatch
NotOneTR
        cmp #%1000
        bne MergeHumanAIcatch
        lda Paddle1
        sta Paddle4
        lda PaddleButtons
;        and #%0001         ; not needed - saves 2 cycles
        asl
        asl
        asl
        sta PaddleButtons

MergeHumanAIcatch
        ; lda DeadPlayers
        ; eor #%1111
        ; and PaddleButtons        ; turn off dead-player buttons
        ; and HumanPlayers         ; turn off non-player buttons
        ; sta PaddleButtons
        ; lda HumanPlayers
        ; eor #%1111               ; get computer players
        ; and AIcatch              ; get computer player catch state
        ; ora PaddleButtons        ; merge button state for AI and Human
        ; and #%1111               ; make sure upper bits are 0 for release test
        ; sta PaddleButtons
        bit GameOptions
        bpl MHskip
        lda AIcatch                ; don't merge if in demo mode
        jmp MHcheckDead
MHskip
        lda PaddleButtons
	and HumanPlayers          ; don't allow humans to "catch" for AI
	sta PaddleButtons
	lda HumanPlayers
	eor #%1111
	and AIcatch                ; don't allow AI to catch for humans
	ora PaddleButtons
	and #%1111
MHcheckDead
	sta PaddleButtons
        lda DeadPlayers            ; filter out dead players
	eor #%1111
	and PaddleButtons
	sta PaddleButtons

; Process fireball collision and movement
        ldx #2
.fireballLoop
 IF DEBUG = 1
        lda INTIM        ; only store time remaining when debugging
        sta DragonG0,x   ; as it screws up the end-of-round/game trophy
 ENDIF
        lda M0yPosHigh,x ; is ball off-screen?
        bmi NotInPlay

        lda M0State,x ; is ball caught?
        bpl .notCaught
        and PaddleButtons       ; firebutton still on?
;        bne NotInPlay
        bne NoTimeCheck ; go ahead and process collsions
        cpx #2
        beq NoTimeCheck ; don't release BL, it's positioned for Flare Ups
        lda #0
        sta M0State,x
;        jsr ReleaseSound
;ReleaseSound
        lda M0xPosHigh,x
        cmp #80
        bcc LeftReleaseSound
        SOUND_RIGHT SoundShield
        jmp .notCaught
LeftReleaseSound
        SOUND_LEFT SoundShield
;        rts
.notCaught
        cpx #1
        bcc TimeCheckM0
        beq TimeCheckM1
        bcs NoTimeCheck
TimeCheckM1
        bit CXM1FB
        bmi M1HitSomething
        bit CXM1P
        bmi M1HitSomething
        bvc NoTimeCheck
M1HitSomething
        lda INTIM        ; if we hit something and are on the last fireball
        cmp #$10         ; then don't process it if there's not enough time
        bcs NoTimeCheck
        bcc NotInPlay

TimeCheckM0
        bit CXM0FB
        bmi M0HitSomething
        bit CXM0P
        bmi M0HitSomething
        bvc NoTimeCheck
M0HitSomething
        lda INTIM        ; if we hit something and are on the last fireball
        cmp #$0d          ; then don't process it if there's not enough time
        bcs NoTimeCheck
        bcc NotInPlay
NoTimeCheck
        jsr Collision
        lda M0State,x ; is ball caught?
        bpl MoveIt
        and PaddleButtons       ; firebutton still on?
        bne NotInPlay
MoveIt
        jmp MoveFireball        ; changed from JSR to save cycles
SkipM0
        lda M0State,x                     ;4   takes 9 or 20
        and #%01110000  ; debounce?       ;2
        beq NotInPlay                     ;2 3
        sec                               ;2
        lda M0State,x                     ;4
        sbc #%00010000                    ;2
        sta M0State,x                     ;4
NotInPlay
        dex
        bmi OS2 ; change to OverscanWait when done
        jmp .fireballLoop

OS2
; start of fireball swap routines, used to flicker colors so a fireball
; drawn by a dead king's missile won't be invisible
        lda M0xPosHigh
        ldx M1xPosHigh
        ldy BLxPosHigh

        stx M0xPosHigh
        sty M1xPosHigh
        sta BLxPosHigh


        lda M0xPosLow
        ldx M1xPosLow
        ldy BLxPosLow

        stx M0xPosLow
        sty M1xPosLow
        sta BLxPosLow


        lda M0yPosHigh
        ldx M1yPosHigh
        ldy BLyPosHigh

        stx M0yPosHigh
        sty M1yPosHigh
        sta BLyPosHigh


        lda M0yPosLow
        ldx M1yPosLow
        ldy BLyPosLow

        stx M0yPosLow
        sty M1yPosLow
        sta BLyPosLow


        lda M0DirSpeed
        ldx M1DirSpeed
        ldy BLDirSpeed

        stx M0DirSpeed
        sty M1DirSpeed
        sta BLDirSpeed

        lda M0State
        ldx M1State
        ldy BLState

        stx M0State
        sty M1State
        sta BLState

        lda M0CatchTimer
        ldx M1CatchTimer
        ldy BLCatchTimer

        stx M0CatchTimer
        sty M1CatchTimer
        sta BLCatchTimer

 ; end swap fireballs

;Extra Fireball Routine
LaunchExtraFireball
        lda ExtraFireball  ; if ExtraFireball is 0 then we've
        beq TestEndOfRound ; already processed it for this round
        lda Frame
        and #%00111111      ; only dec every 64 frames (about 1 second NTSC)
        bne TestEndOfRound
        dec ExtraFireball
        bne TestEndOfRound
        bit GameOptions
        bpl .notAttractMode
ExitAttractMode
        lda #ATTRACT_DELAY
        sta ExtraFireball
        jmp OverscanMenu2
.notAttractMode
        lda #3
        sta FireBallsInPlay      ; # of used fireballs

        bit M0yPosHigh
        bpl .M0inPlay
        dec FireBallsInPlay      ; subtract 1 from used fireballs
        ldy #0            ; put new fireball in M0
.M0inPlay
        bit M1yPosHigh
        bpl .M1inPlay
        dec FireBallsInPlay      ; subtract 1 from used fireballs
        ldy #1            ; put new fireball in M1

.M1inPlay
        bit BLyPosHigh
        bpl .BLinPlay
        dec FireBallsInPlay      ; subtract 1 from used fireballs
        ldy #2            ; put new fireball in BL

.BLinPlay
        lda FireBallsInPlay
        cmp #1
        bne TestEndOfRound ; if already more than 1 then don't add another
        lda GameOptions
        and #%00000011
        cmp #1
        beq TestEndOfRound ; if only 1 for the game the don't add another
        lda #48
        sta.wy M0yPosHigh,y
        lda #79
        sta.wy M0xPosHigh,y
        lda M0xPosLow  ; a "random" number
        and #%00011111
        ora #%00100001 ; speed of 1 and not directly up/down/left/right
        sta.wy M0DirSpeed,y
        lda #SoundLaunch
        sta SoundLeft
        sta SoundRight

  ; test end of round/game
TestEndOfRound SUBROUTINE

;Count Fireballs

        ldx #3            ; # of fireballs
	lda #255          ; furthest distance
        bit M0yPosHigh
        bpl .M0inPlay
        dex
	sta Distance
.M0inPlay
        bit M1yPosHigh
        bpl .M1inPlay
        dex
	sta Distance+1
.M1inPlay
        bit BLyPosHigh
        bpl .BLinPlay
        dex
	sta Distance+2
.BLinPlay
        stx FireBallsInPlay ; stores fireballcount

CountNotCaughtAI
;        bit M0yPosHigh   may not need
;        bmi .M0notInPlay
        lda M0State
        bpl .M0notInPlay
        and #%00001111
        and HumanPlayers
        bne .M0notInPlay ; branch if human has fireball
        dex

.M0notInPlay
;        bit M1yPosHigh
;        bmi .M1notInPlay
        lda M1State
        bpl .M1notInPlay
        and #%00001111
        and HumanPlayers
        bne .M1notInPlay ; branch if human has fireball
        dex

.M1notInPlay
;        bit BLyPosHigh
;        bmi .BLnotInPlay
        lda BLState
        bpl .BLnotInPlay
        and #%00001111
        and HumanPlayers ; branch if human has fireball
        bne .BLnotInPlay
        dex

.BLnotInPlay
        stx AInotCaughtFB

        jmp OverscanGame2 ; ran out of ROM in BANK 7
                          ; so put rest of overscan in bank 4


; tables for LimitedCatch game variation
; test = [BallDirection + 8 - ShieldDrection] && 31
; if test > 0 and test < 16 then it was backhand

; simplify test
; test = [BallDirection + 7 - ShieldDrection] && 31
; if test < 15 then it was backhand

; simplify ASM math routine
; test = [BallDirection - (ShieldDirection - 7)] && 31
; if test < 15 then it was backhand
Facing1
        .byte 8-7    ; |
        .byte 0      ; \ invalid direction for shield 1
        .byte 16-7   ; -
        .byte 12-7   ; /
Facing2
        .byte 24-7   ; |
        .byte 0      ; \ invalid direction for shield 2
        .byte 0-7+32 ; -
        .byte 28-7   ; /
Facing3
        .byte 24-7   ; |
        .byte 20-7   ; \
        .byte 16-7   ; -
        .byte 0      ; / invalid direction for shield 3
Facing4
        .byte 8-7    ; |
        .byte 4-7+32 ; \
        .byte 0-7+32 ; -
        .byte 0      ; / invalid for shield 4

ClearRightBrickRowAdjust
        .byte 0,0,0,0,6,6

ClearRightBrick
        .byte %11111100
        .byte %11110011
        .byte %11001111
        .byte %00111111
        .byte %00111111
        .byte %11001111

ClearLeftBrickRowAdjust
        .byte 0,0,6,6,6,6

ClearLeftBrick
        .byte %11001111
        .byte %00111111
        .byte %00111111
        .byte %11001111
        .byte %11110011
        .byte %11111100


BallHitShield
        .byte 32, 24, 16, 8

MaxSpeed
        .byte %10000000 ; game speed 1 max is 4
        .byte %10100000 ; game speed 2 max is 5
        .byte %11000000 ; game speed 3 max is 6
        .byte %11100000 ; game speed 4 max is 7


GetBank7SequenceDataCode
        lda DragonFrame
        tay
        lda (Dragonptr),y
        sta TempFrame
        iny
        lda (Dragonptr),y
        sta TempDuration
        jmp ReturnData

; put bank 7 dragon sequences here
;              128  64   32
;             flip flap launch frame    speed  duration



DragonSequence14   ; chase off - launch up starts at x=150
                   ; note: Speed1 is treated as Speed2 on Seq 14 & 15
                   ;       SpeedQuarter is treated as Speed1
        .byte      FlapSound + F1s1 ,    Speed1 + Dur5       ;     10 140
        .byte                  F2s1 ,    Speed1 + Dur3       ;      6 134
        .byte                  F3s1 ,    Speed1 + Dur3       ;      6 128
        .byte                  F4s1 ,    Speed1 + Dur3       ;      6 122
        .byte                  F1s2,     Speed1 + Dur3       ;      6 116
        .byte                  F2s2,     Speed1 + Dur3       ;      6 110
        .byte                  F3s2,     Speed1 + Dur3       ;      6 104
        .byte                  F4s2,     Speed1 + Dur3       ;      6  98
        .byte                  F5s2,     Speed1 + Dur3       ;      6  92
        .byte                  F3dd,     SpeedQuarter + Dur3 ;      3  89
        .byte     FlipImage +  F5s2,     SpeedQuarter + Dur3 ;      3  86
        .byte     FlipImage +  F1s4,     SpeedQuarter + Dur3 ;      3  83
        .byte                  F4dd,     SpeedQuarter + Dur3 ;      3  80
        .byte                  F2dd,     SpeedQuarter + Dur5 ;      5  75
        .byte                  F2dd,     SpeedHalf + Dur8    ;      4  71
        .byte                  F1dd,     Speed0 + Dur18      ;
        .byte                  F5dd,     Speed0 + Dur18      ;
        .byte                  F2dd,     Speed0 + Dur6       ;
        .byte                  F2s2,     Speed0 + Dur6       ;
        .byte                  F3s2,     Speed0 + Dur6       ;
        .byte                  F4s2,     Speed0 + Dur6       ;
        .byte                  F6s2,     Speed0 + Dur6       ;
        .byte                  F7s2 ,    Speed0 + Dur6       ;
        .byte                  F1s3 ,    Speed0 + Dur6       ;
        .byte                  F2s3 ,    Speed0 + Dur6       ;
        .byte                  F3s3 ,    Speed0 + Dur6       ;
        .byte                  F4s3 ,    Speed0 + Dur18      ;
        .byte                  F5s3 ,    Speed0 + Dur6       ;
        .byte                  F4s3 ,    Speed0 + Dur18      ;
        .byte                  F5s3 ,    Speed0 + Dur6       ;
        .byte                  F6s3 ,    Speed0 + Dur6       ;
        .byte                  F1s3 ,    Speed0 + Dur6       ;
        .byte                  F7s2 ,    Speed0 + Dur6       ;



        .byte                  F7s2 , EndSeq
DragonSequence15   ; chase off - launch down starts at x=150
                   ; note: Dur1 is treated as Dur2 on Seq 14 & 15
                   ;       SpeedQuarter is treated as Speed1
        .byte      FlapSound + F1s1 ,    Speed1 + Dur5       ;     10 140
        .byte                  F2s1 ,    Speed1 + Dur3       ;      6 134
        .byte                  F3s1 ,    Speed1 + Dur3       ;      6 128
        .byte                  F4s1 ,    Speed1 + Dur3       ;      6 122
        .byte                  F1s2,     Speed1 + Dur3       ;      6 116
        .byte                  F2s2,     Speed1 + Dur3       ;      6 110
        .byte                  F3s2,     Speed1 + Dur3       ;      6 104
        .byte                  F4s2,     Speed1 + Dur3       ;      6  98
        .byte                  F5s2,     Speed1 + Dur3       ;      6  92
        .byte                  F3dd,     SpeedQuarter + Dur3 ;      3  89
        .byte     FlipImage +  F5s2,     SpeedQuarter + Dur3 ;      3  86
        .byte     FlipImage +  F1s4,     SpeedQuarter + Dur3 ;      3  83
        .byte                  F4dd,     SpeedQuarter + Dur3 ;      3  80
        .byte                  F2dd,     SpeedQuarter + Dur5 ;      5  75
        .byte                  F2dd,     SpeedHalf + Dur8     ;     4  71
        .byte                  F1dd,     Speed0 + Dur18      ;
        .byte                  F5dd,     Speed0 + Dur18      ;
        .byte                  F2dd,     Speed0 + Dur6       ;
        .byte                  F2s2,     Speed0 + Dur6       ;
        .byte                  F3s2,     Speed0 + Dur6       ;
        .byte                  F4s2,     Speed0 + Dur6       ;
        .byte                  F6s2,     Speed0 + Dur6       ;
        .byte                  F1s4,     Speed0 + Dur6       ;

        .byte                  F2s4 ,    Speed0 + Dur6       ;
        .byte                  F3s4 ,    Speed0 + Dur6       ;
        .byte                  F4s4 ,    Speed0 + Dur6       ;
        .byte                  F5s4 ,    Speed0 + Dur18      ;
        .byte                  F4s4 ,    Speed0 + Dur6       ;
        .byte                  F3s4 ,    Speed0 + Dur6       ;
        .byte                  F2s4 ,    Speed0 + Dur6       ;

        .byte     FlipImage +  F3s4 ,    Speed0 + Dur6       ;
        .byte     FlipImage +  F4s4 ,    Speed0 + Dur6       ;
        .byte     FlipImage +  F5s4 ,    Speed0 + Dur18      ;
        .byte     FlipImage +  F4s4 ,    Speed0 + Dur6       ;
        .byte     FlipImage +  F3s4 ,    Speed0 + Dur6       ;
        .byte     FlipImage +  F2s4 ,    Speed0 + Dur6       ;


        .byte                  F2s4 , EndSeq


HitShield1
	lda #%00010000
	and GameOptions3  ; is catch on for this player?
        beq .noButton1
        and GameOptions2 ; is limited catch on for this player?
        beq .notLimited1
        lda M0State,x
        and #%01110000
        bne .noButton1   ; no Limited catch if debounce active
        lda ShieldDir
        and #%00000011
        tay
        sec
        lda M0DirSpeed,x
        sbc Facing1,y
        and #%00011111
        cmp #15
        bcc .noButton1 ; carry clear if < 15
.notLimited1
        lda #%0001
        and PaddleButtons
        beq .noButton1
        ; lda #%00000001
        ; and M0State
        ; bne .noButton1 ; already holding fireball
        ; lda #%00000001
        ; and M1State
        ; bne .noButton1 ; already holding fireball
        ; lda #%00000001
        ; and BLState
        ; bne .noButton1 ; already holding fireball
        lda M0State
        ora M1State
        ora BLState
        and #%00000001
        bne .noButton1
        lda #%10000001
        sta M0State,x
        lda #0
        sta M0CatchTimer,x ; reset catch timer for this fireball
        jmp SpeedupFireball
.noButton1
        lda M0State,x
        and #%01110000
        beq HS1Bounce
        rts
HS1Bounce
        lda #%01110000
        sta M0State,x
;       lda #SoundShield
;       sta SoundLeft
        SOUND_LEFT SoundShield
        lda M0DirSpeed,x
        and #%11111
        tay ; ball direction in Y
        lda ShieldDir
        and #%00000011
        beq .hs1_00
        cmp #%11
        beq .hs1_11
.hs1_10 lda Shield13Bounce10,y
        jmp ChangeBallDirShield
.hs1_11 lda Shield1Bounce11,y
        jmp ChangeBallDirShield
.hs1_00 lda Shield14Bounce00,y
        jmp ChangeBallDirShield

HitShield2
        lda #%00100000
        and GameOptions3  ; is catch on for this player?
        beq .noButton2
        and GameOptions2  ; is limited catch on for this player?
        beq .notLimited2
        lda M0State,x
        and #%01110000
        bne .noButton2    ; no Limited Catch if debounce active
        lda ShieldDir
        and #%00001100
        lsr
        lsr
        tay
        sec
        lda M0DirSpeed,x
        sbc Facing2,y
        and #%00011111
        cmp #15
        bcc .noButton2
.notLimited2
        lda #%0010
        and PaddleButtons
        beq .noButton2
        ; lda #%00000010
        ; and M0State
        ; bne .noButton2 ; already holding fireball
        ; lda #%00000010
        ; and M1State
        ; bne .noButton2 ; already holding fireball
        ; lda #%00000010
        ; and BLState
        ; bne .noButton2 ; already holding fireball
        lda M0State
        ora M1State
        ora BLState
        and #%00000010
        bne .noButton2
        lda #%10000010
        sta M0State,x
        lda #0
        sta M0CatchTimer,x ; reset catch timer for this fireball
        jmp SpeedupFireball
.noButton2
        lda M0State,x
        and #%01110000
        beq HS2Bounce
        rts
HS2Bounce
        lda #%01110000
        sta M0State,x
;       lda #SoundShield
;       sta SoundRight
        SOUND_RIGHT SoundShield
        lda M0DirSpeed,x
        and #%11111
        tay ; ball direction in Y
        lda ShieldDir
        lsr
        lsr
        and #%00000011
        beq .hs2_00
        cmp #%11
        beq .hs2_11
.hs2_10 lda Shield24Bounce10,y
        jmp ChangeBallDirShield
.hs2_11 lda Shield2Bounce11,y
        jmp ChangeBallDirShield
.hs2_00 lda Shield23Bounce00,y
        jmp ChangeBallDirShield

HitShield3
        lda #%01000000
	and GameOptions3  ; is catch on for this player?
        beq .noButton3
        and GameOptions2  ; is limited catch on for this player?
        beq .notLimited3
        lda M0State,x
        and #%01110000
        bne .noButton3    ; no Limited Catch if debounce active
        lda ShieldDir
        and #%00110000
        lsr
        lsr
        lsr
        lsr
        tay
        sec
        lda M0DirSpeed,x
        sbc Facing3,y
        and #%00011111
        cmp #15
        bcc .noButton3
.notLimited3
        lda #%0100
        and PaddleButtons
        beq .noButton3
        ; lda #%00000100
        ; and M0State
        ; bne .noButton3 ; already holding fireball
        ; lda #%00000100
        ; and M1State
        ; bne .noButton3 ; already holding fireball
        ; lda #%00000100
        ; and BLState
        ; bne .noButton3 ; already holding fireball
        lda M0State
        ora M1State
        ora BLState
        and #%00000100
        bne .noButton3
        lda #%10000100
        sta M0State,x
        lda #0
        sta M0CatchTimer,x ; reset catch timer for this fireball
        jmp SpeedupFireball
.noButton3
        lda M0State,x
        and #%01110000
        beq HS3Bounce
        rts
HS3Bounce
        lda #%01110000
        sta M0State,x
;       lda #SoundShield
;       sta SoundRight
        SOUND_RIGHT SoundShield
        lda M0DirSpeed,x
        and #%11111
        tay ; ball direction in Y
        lda ShieldDir
        lsr
        lsr
        lsr
        lsr
        and #%00000011
        beq .hs3_00
        cmp #%01
        beq .hs3_01
.hs3_10 lda Shield13Bounce10,y
        jmp ChangeBallDirShield
.hs3_01 lda Shield3Bounce01,y
        jmp ChangeBallDirShield
.hs3_00 lda Shield23Bounce00,y
        jmp ChangeBallDirShield

HitShield4
        lda #%10000000
	and GameOptions3   ; is catch on for this player?
        beq .noButton4
        and GameOptions2   ; is limited catch on for this player?
        beq .notLimited4
        lda M0State,x
        and #%01110000
        bne .noButton4    ; no LImited Catch if debounce active
        lda ShieldDir
        and #%11000000
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        tay
        sec
        lda M0DirSpeed,x
        sbc Facing4,y
        and #%00011111
        cmp #15
        bcc .noButton4
.notLimited4
        lda #%1000
        and PaddleButtons
        beq .noButton4
        ; lda #%00001000
        ; and M0State
        ; bne .noButton4 ; already holding fireball
        ; lda #%00001000
        ; and M1State
        ; bne .noButton4 ; already holding fireball
        ; lda #%00001000
        ; and BLState
        ; bne .noButton4 ; already holding fireball
        lda M0State
        ora M1State
        ora BLState
        and #%00001000
        bne .noButton4
        lda #%10001000
        sta M0State,x
        lda #0
        sta M0CatchTimer,x ; reset catch timer for this fireball
        jmp SpeedupFireball
.noButton4
        lda M0State,x
        and #%01110000
        beq HS4Bounce
        rts
HS4Bounce
        lda #%01110000
        sta M0State,x
;       lda #SoundShield
;       sta SoundLeft
        SOUND_LEFT SoundShield
        lda M0DirSpeed,x
        and #%11111
        tay ; ball direction in Y
        lda ShieldDir
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        beq .hs4_00
        cmp #%01
        beq .hs4_01
.hs4_10 lda Shield24Bounce10,y
        jmp ChangeBallDirShield
.hs4_01 lda Shield4Bounce01,y
        jmp ChangeBallDirShield
.hs4_00 lda Shield14Bounce00,y
        jmp ChangeBallDirShield

HitP0
        lda M0yPosHigh,x
        cmp #36
        bcs .nextTestP0
        jmp HitShield4
.nextTestP0
        cmp #$40
        bcc .exitP0
        jmp HitShield1
.exitP0 lda #1            ; hit dragon so bail
        rts
HitP1
        lda M0yPosHigh,x
        cmp #37
        bcs .nextTestP1
        jmp HitShield2
.nextTestP1
        cmp #$40
        bcc .exitP1
        jmp HitShield3
.exitP1 lda #1            ; hit dragon so bail
        rts



; process the fireball collisions
; 1) test X to see which object's collisions we're checking
; 2) test if playfield was hit - this denotes a brick or a king
; 3) test if P0 was hit - this denotes a player on the left
; 4) test if P1 was hit - this denotes a player on the right
Collision
        cpx #1
        bcc ColTestM0    ; < 1
        beq ColTestM1    ; = 1
ColTestBL                ; > 1
        bit CXBLPF        ; test playfield collision in bit 7 -> N
        bmi HitPF
        bit BLState
        bmi BallCaught    ; if ball is caught, ignore player collisions
        bit CXP0FB        ; test P0 collision in bit 6 -> V
        bvs HitP0
        bit CXP1FB        ; test P1 collision in bit 6 -> V
        bvs HitP1
        rts               ; nothing hit, so return
ColTestM0
        bit CXM0FB        ; test playfield collision in bit 7 -> N
        bmi HitPF
        bit M0State
        bmi BallCaught    ; if ball is caught, ignore player collisions
        bit CXM0P         ; test P1 col in bit 7 -> N, P0 in bit 6 -> V
        bmi HitP1
        bvs HitP0
BallCaught
        rts               ; nothing hit, so return
ColTestM1
        bit CXM1FB        ; test playfield collision in bit 7 -> N
        bmi HitPF
        bit M1State
        bmi BallCaught    ; ball is caught, ignore player collisions
        bit CXM1P         ; test P0 col in bit 7 -> N, P1 in bit 6 -> V
        bmi HitP0
        bvs HitP1
        rts               ; nothing hit, so return


; process the playfield collisions
; 1) test if the collision was on the left or the right
; 2) test if the collision was on the top or the bottom
; 3) test if king was hit
; 4) if not then test the four corners of the ball
HitPF
        ldy M0yPosHigh,x
        cpy #48
        bcs HitTopPF
        jmp HitBottomPF
HitTopPF
        lda M0xPosHigh,x
        cmp #80
        bcc HitTopLeftPF
HitTopRightPF SUBROUTINE
        cmp #137          ; A holds X, test if king hit
        bcc NotKingTR
        cpy #85           ; Y holds Y, test if king hit
        bcc NotKingTR
        lda #%0100
        jmp KingKilled
NotKingTR                 ; check the fireball's 4 corners TR, TL, BR, BL
        sec               ; check TR
        sbc #111
        tay               ; Y holds Right X position of fireball
        sec
        lda #95
        sbc M0yPosHigh,x  ; A holds Top Y position of fireball
        jsr ClearBrickTR
        bne TweekTRbounce

        sec               ; check TL
        lda M0xPosHigh,x
        sbc #112
        bmi .skip1
        tay               ; Y holds Right X position of fireball
        sec
        lda #95
        sbc M0yPosHigh,x  ; A holds Top Y position of fireball
        jsr ClearBrickTR
        bne TweekTRbounce

.skip1  sec               ; check BR
        lda M0xPosHigh,x
        sbc #111
        tay               ; Y holds Right X position of fireball
        sec
        lda #96
        sbc M0yPosHigh,x ; A holds Bottom Y position of fireball
        cmp #$18          ; Y pos >= $18 means we're out of the castle area
        bcs .skip2
        jsr ClearBrickTR
        bne TweekTRbounce

.skip2  sec               ; check BL
        lda M0xPosHigh,x
        sbc #112
        bmi doneTR
        tay               ; Y holds Right X position of fireball
        sec
        lda #96
        sbc M0yPosHigh,x ; A holds Bottom Y position of fireball
        cmp #$18          ; Y pos >= $18 means we're out of the castle area
        bcs doneTR
        jsr ClearBrickTR
        bne TweekTRbounce
doneTR  rts
TweekTRbounce
        lda M0DirSpeed,x ; directions 1-7 are towards king and
        and #%11111      ; will be redirected
        beq doneTR
        cmp #8
        bcs doneTR
        jmp TweekBounce

HitTopLeftPF  SUBROUTINE
        cmp #22          ; A holds X, test if king hit
        bcs NotKingTL
        cpy #85          ; Y holds Y, test if king hit
        bcc NotKingTL
        lda #%0001
        jmp KingKilled
NotKingTL                ; check the fireball's 4 corners TL, TR, BL, BR
                         ; check TL
        tay              ; Y holds the Left X position of fireball
        sec
        lda #95
        sbc M0yPosHigh,x ; A holds the Top Y position of fireball
        jsr ClearBrickTL ; checking TL
        bne TweekTLbounce

        ldy M0xPosHigh,x   ; check TR
        iny                ; Y holds the Right X position of the fireball
        cpy #$30
        bcs .skip1       ; X pos >= $30 means we're out of the castle area
        sec
        lda #95
        sbc M0yPosHigh,x ; A holds the Top Y position of fireball
        jsr ClearBrickTL ; checking TL
        bne TweekTLbounce

.skip1  ldy M0xPosHigh,x   ; check BL
        sec
        lda #96
        sbc M0yPosHigh,x ; A holds Bottom Y position of fireball
        cmp #$18           ; Y pos >= $18 means we're out of the castle area
        bcs .skip2         ; so don't process or we'll get false hits
        jsr ClearBrickTL   ; checking BR
        bne TweekTLbounce

.skip2
        ldy M0xPosHigh,x   ; check BR
        iny                ; Y holds the Right X position of the fireball
        cpy #$30
        bcs doneTL         ; X pos >= $30 means we're out of the castle area
        sec
        lda #96
        sbc M0yPosHigh,x ; A holds Bottom Y position of fireball
        cmp #$18           ; Y pos >= $18 means we're out of the castle area
        bcs doneTL         ; so don't process or we'll get false hits
        jsr ClearBrickTL   ; checking BR
        bne TweekTLbounce
doneTL
        rts
TweekTLbounce
        lda M0DirSpeed,x   ; directions 25-31 are towards king and will
        and #%11111        ; be redirected
        cmp #25
        bcc doneTL


TweekBounce                ; the "arkanoid bounce" routines can cause the
        lda BounceBackDir  ; fireball to bounce off castle walls and take out
        cmp #%01           ; whole sections of the castle wall with one attack.
        beq BounceY        ; This attempts to reduce this by redirecting
        cmp #%10           ; fireballs that bounce towards the king
        bne doneTL
        lda #16
        .byte $2c
BounceY
        lda #32
        sbc M0DirSpeed,x
        and #%11111
        tay
        lda #%11100000
        and M0DirSpeed,x
        sta M0DirSpeed,x
        tya
        ora M0DirSpeed,x
        sta M0DirSpeed,x
        rts

HitBottomPF
        lda M0xPosHigh,x
        cmp #80
        bcc HitBottomLeftPF
HitBottomRightPF SUBROUTINE
        cmp #137          ; A holds X, test if king hit
        bcc NotKingBR
        cpy #10           ; Y holds Y, test if king hit
        bcs NotKingBR
        lda #%0010
        jmp KingKilled
NotKingBR                 ; check fireball's corners BR, BL, TR, TL
        sec               ; check BR
;        lda M0xPosHigh,x  A already holds X when it gets here
        sbc #111
        tay               ; Y holds the Right X position of fireball
        sec
        lda M0yPosHigh,x
        sbc #1            ; A holds the Bottom Y Position of fireball
        jsr ClearBrickBR
        bne TweekBRbounce

        sec               ; check BL
        sbc #112
        bmi .skip1
        tay               ; Y holds the Left X position of fireball
        sec
        lda M0yPosHigh,x
        sbc #1            ; A holds the Bottom Y Position of fireball
        jsr ClearBrickBR
        bne TweekBRbounce

.skip1  sec               ; check TR
        lda M0xPosHigh,x  ; A already holds X when it gets here
        sbc #111
        tay               ; Y holds the Right X position of fireball
        lda M0yPosHigh,x  ; A holds the Top Y position of Fireball
        cmp #$18          ; Y pos >= $18 means we're out of the castle area
        bcs .skip2
        jsr ClearBrickBR  ; was jsr when testing all 4 corners
        bne TweekBRbounce

.skip2  sec              ; check TL
        sbc #112
        bmi doneBR
        tay               ; Y holds the Left X position of fireball
        lda M0yPosHigh,x  ; A holds the Top Y position of Fireball
        cmp #$18          ; Y pos >= $18 means we're out of the castle area
        bcs doneBR
        jsr ClearBrickBR
        bne TweekBRbounce
doneBR  rts
TweekBRbounce
        lda M0DirSpeed,x ; directions 9-15 are towards king and
        and #%11111      ; will be redirected
        cmp #9
        bcc doneBR
        cmp #16
        bcs doneBR
        jmp TweekBounce

HitBottomLeftPF SUBROUTINE
        cmp #22           ; A holds X, test if king hit
        bcs NotKingBL
        cpy #10           ; Y holds Y, test if king hit
        bcs NotKingBL
        lda #%1000
        jmp KingKilled
NotKingBL                 ; check fireball's corners BL, BR, TL, TR
        tay               ; Y holds the Left X position of fireball
        sec
        lda M0yPosHigh,x   ; A holds the Bottom Y Position of fireball
        sbc #1
        jsr ClearBrickBL
        bne TweekBLbounce

        ldy M0xPosHigh,x  ; check BR
        iny               ; Y holds the Right X position of fireball
        cpy #$30
        bcs .skip1
        sec
        lda M0yPosHigh,x   ; A holds the Bottom Y Position of fireball
        sbc #1
        jsr ClearBrickBL
        bne TweekBLbounce

.skip1  ldy M0xPosHigh,x  ; check TL
        lda M0yPosHigh,x   ; A holds the Top Y position of Fireball
        cmp #$18
        bcs .skip2
        jsr ClearBrickBL  ; was jsr when testing all 4 corners
        bne TweekBLbounce

.skip2  ldy M0xPosHigh,x  ; check TR
        iny               ; Y holds the Right X position of fireball
        cpy #$30
        bcs doneBL
        lda M0yPosHigh,x   ; A holds the Top Y position of Fireball
        cmp #$18
        bcs doneBL
        jsr ClearBrickBL
        bne TweekBLbounce
doneBL  rts
TweekBLbounce
        lda M0DirSpeed,x ; directions 17-23 are towards king and
        and #%11111      ; will be redirected
        cmp #17
        bcc doneBR
        cmp #24
        bcs doneBR
        jmp TweekBounce


ClearBrickBR ; Clear Brick Bottom Right Castle
             ; call with Y holding X and A holding Y position to test
             ; returns with Z =0 if brick was cleared out
        lsr               ; divide Y position by 4 for row hit (2LK)
        lsr
        sta RowHit      ; row hit
        tya
        lsr               ; divide X position by 8 for column hit
        lsr
        lsr
        tay               ; Y holds adjusted X position
        sta ColHit      ; column hit
        clc
        lda RowHit
        adc ClearRightBrickRowAdjust,y
        sta RowHit      ; adjusted row hit
        lda ClearRightBrick,y
        eor #$ff          ; test if already cleared
        ldy RowHit
        and Wall2L,y
        bne NeedToClearBR
        rts
NeedToClearBR
        ldy ColHit
        lda ClearRightBrick,y
        ldy RowHit
        and Wall2L,y
        sta Wall2L,y
;       lda #SoundBrick
;       sta SoundRight
        SOUND_RIGHT SoundBrick
        jmp ChangeBallDirCastle


ClearBrickBL ; Clear Brick Bottom Left Castle
             ; call with Y holding X and A holding Y position to test
             ; returns with Z =0 if brick was cleared out
        lsr               ; divide Y position by 4 for row hit (2LK)
        lsr
        sta RowHit      ; row hit
        tya
        lsr               ; divide X position by 8 for column hit
        lsr
        lsr
        tay               ; Y holds adjusted X position
        sta ColHit      ; column hit
        clc
        lda RowHit
        adc ClearLeftBrickRowAdjust,y
        sta RowHit      ; adjusted row hit
        lda ClearLeftBrick,y
        eor #$ff          ; test if already cleared
        ldy RowHit
        and Wall4L,y
        bne NeedToClearBL
        rts
NeedToClearBL
        ldy ColHit
        lda ClearLeftBrick,y
        ldy RowHit
        and Wall4L,y
        sta Wall4L,y
;       lda #SoundBrick
;       sta SoundLeft
        SOUND_LEFT SoundBrick
;       rts



ChangeBallDirCastle
        lda GameOptions
        and #%00100000
        beq NoBrickFlash
        lda #$0e
        sta ScreenColor
NoBrickFlash
        lda #0
        sta BounceBackDir       ; which direction to bounce
        ldy M0DirSpeed,x
        lda BALLyHigh,y
        bmi yvel_negative
        sec
        lda M0yPosLow,x
        sbc BALLyLow,y
        lda M0yPosHigh,x
        sbc BALLyHigh,y    ; A now holds prior Y value
        eor M0yPosHigh,x
        and #4
        beq no_cross_y
        bne cross_y
yvel_negative
        sec
        lda M0yPosLow,x
        sbc BALLyLow,y
        lda M0yPosHigh,x
        sbc BALLyHigh,y    ; A now holds prior Y value
        sbc #0             ; subtract 1 (carry is cleared)
        dec M0yPosHigh,x
        eor M0yPosHigh,x
        inc M0yPosHigh,x
        and #4
        beq no_cross_y
cross_y
        lda #%01
        sta BounceBackDir
no_cross_y
        lda BALLxHigh,y
        bpl xvel_positive
        sec
        lda M0xPosLow,x
        sbc BALLxLow,y
        lda M0xPosHigh,x
        sbc BALLxHigh,y    ; A now holds prior X value
        eor M0xPosHigh,x
        and #8
        beq no_cross_x
        bne cross_x
xvel_positive
        sec
        lda M0xPosLow,x
        sbc BALLxLow,y
        lda M0xPosHigh,x
        sbc BALLxHigh,y    ; A now holds prior X value
        adc #0             ; add 1 (carry is set)
        inc M0xPosHigh,x
        eor M0xPosHigh,x
        dec M0xPosHigh,x
        and #8
        beq no_cross_x
        bne cross_x
cross_x
        lda #%10
        ora BounceBackDir
        sta BounceBackDir
no_cross_x
        lda BounceBackDir
        cmp #%01
        beq CBDCbounceTB
        cmp #%10
        bne CBDCbounceBack
        sec
        lda #32
        bne .skip
CBDCbounceTB
        sec
        lda #16
.skip   sbc M0DirSpeed,x
        bne CBDCnewSpeed

CBDCbounceBack
;       lda Frame
;       and #%11
;       sta BounceBackDir
;       txa
;       clc
;       adc BounceBackDir
;       tay
        sec
        lda M0DirSpeed,x
;       sbc BallEnglish,y
        sbc #16
CBDCnewSpeed
        and #%11111
        tay
        lda #%11100000
        and M0DirSpeed,x
        sta M0DirSpeed,x
        tya
        ora M0DirSpeed,x
        sta M0DirSpeed,x
;       lda #1 ; not needed - dir/speed should be non-zero
        cmp #%01000000
        bcc atSlowest
        sbc #%00100000
        sta M0DirSpeed,x
atSlowest
;       lda #1
        rts

;BounceDir .byte 16; return

ChangeBallDirShield
        tay
        lda Frame
        cmp #35 ; anything >= 35 will set the carry
;        sec
        lda BallHitShield,y
        sbc M0DirSpeed,x
        and #%11111
        tay
        lda #%11100000
        and M0DirSpeed,x
        sta M0DirSpeed,x
        tya
        ora M0DirSpeed,x
        sta M0DirSpeed,x
SpeedupFireball
        lda GameOptions    ; make fireball faster after shield hit
        lsr                ; but only if we're not already at max speed
        lsr
        and #%11
        tay
        lda M0DirSpeed,x
        cmp MaxSpeed,y
        bcs atFastest
        lda #%00100000
        adc M0DirSpeed,x
        sta M0DirSpeed,x
atFastest
;       lda #1
        rts

ClearBrickTL ; Clear Brick Top Left Castle
             ; call with Y holding X and A holding Y position to test
             ; returns with Z =0 if brick was cleared out
        lsr               ; divide Y position by 4 for row hit (2LK)
        lsr
        sta RowHit      ; row hit
        tya
        lsr               ; divide X position by 8 for column hit
        lsr
        lsr
        tay               ; Y holds adjusted X position
        sta ColHit      ; column hit
        clc
        lda RowHit
        adc ClearLeftBrickRowAdjust,y
        sta RowHit      ; adjusted row hit
        lda ClearLeftBrick,y
        eor #$ff          ; test if already cleared
        ldy RowHit
        and Wall1L,y
        bne NeedToClearTL
        rts
NeedToClearTL
        ldy ColHit
        lda ClearLeftBrick,y
        ldy RowHit
        and Wall1L,y
        sta Wall1L,y
;       lda #SoundBrick
;       sta SoundLeft
        SOUND_LEFT SoundBrick
        jmp ChangeBallDirCastle

ClearBrickTR ; Clear Brick Top Right Castle
             ; call with Y holding X and A holding Y position to test
             ; returns with Z =0 if brick was cleared out
        lsr               ; divide Y position by 4 for row hit (2LK)
        lsr
        sta RowHit      ; row hit
        tya
        lsr               ; divide X position by 8 for column hit
        lsr
        lsr
        tay               ; Y holds adjusted X position
        sta ColHit      ; column hit
        clc
        lda RowHit
        adc ClearRightBrickRowAdjust,y
        sta RowHit      ; adjusted row hit
        lda ClearRightBrick,y
        eor #$ff          ; test if already cleared
        ldy RowHit
        and Wall3L,y
        bne NeedToClearTR
        rts
NeedToClearTR
        ldy ColHit
        lda ClearRightBrick,y
        ldy RowHit
        and Wall3L,y
        sta Wall3L,y
;       lda #SoundBrick
;       sta SoundRight
        SOUND_RIGHT SoundBrick
        jmp ChangeBallDirCastle

KingKilled
        tay
        and DeadPlayers   ;is king already dead?
        bne AlreadyDead   ; could have hit blacked out king
        tya
        ora DeadPlayers   ; mark king as dead
        sta DeadPlayers
        bit GameOptions
        bmi .skipRK       ; no sound effects during demo game
        tya
        and #%1001
        beq RightKing
        lda #SoundKing
        sta SoundLeft
        bne .skipRK
RightKing
        lda #SoundKing
        sta SoundRight
.skipRK
        lda #3
        sta FireBallsInPlay      ; # of used fireballs

        bit M0yPosHigh
        bpl .M0inPlay
        dec FireBallsInPlay      ; subtract 1 from used fireballs
        ldy #0            ; put new fireball in M0
.M0inPlay
        bit M1yPosHigh
        bpl .M1inPlay
        dec FireBallsInPlay      ; subtract 1 from used fireballs
        ldy #1            ; put new fireball in M1

.M1inPlay
        bit BLyPosHigh
        bpl .BLinPlay
        dec FireBallsInPlay      ; subtract 1 from used fireballs
        ldy #2            ; put new fireball in BL

.BLinPlay
        lda GameOptions
        and #%00000011
        cmp FireBallsInPlay
        beq AlreadyDead ; no more fireballs

        lda M0yPosHigh,x
        sta.wy M0yPosHigh,y

        lda M0xPosHigh,x
        sta.wy M0xPosHigh,y

        lda M0DirSpeed,x
        eor #%00011111 ; alter direction of new fireball
        sta.wy M0DirSpeed,y
        ; add fireball 2 & 3 logic goes here
AlreadyDead
        rts







MoveFireball ; call with X holding fireball to move
        clc
        ldy M0DirSpeed,x
        lda M0yPosLow,x
        adc BALLyLow,y
        sta M0yPosLow,x
        lda M0yPosHigh,x
        adc BALLyHigh,y
        beq .hitBottom
        cmp #200          ; wrap from zero?
        bcc .testTop
.hitBottom
        lda M0DirSpeed,x ; only do english if going straight down
        and #%00011111
        cmp #16
        bne .normalSBC4
        lda Frame
        and #%10000001
        bne .normalSBC4
        clc               ; english to prevent ball being stuck
        bcc .englishSBC4
.normalSBC4
        sec
.englishSBC4
        lda #16
        sbc M0DirSpeed,x
        and #%11111
        tay
        lda #%11100000
        and M0DirSpeed,x
        sta M0DirSpeed,x
        tya
        ora M0DirSpeed,x
        sta M0DirSpeed,x
        lda #1
        beq .storeY
.testTop
        cmp #96 ; #95 funny bounce??  ; top of screen
        bcc .storeY
        lda M0DirSpeed,x ; only do english if going straight up
        and #%00011111
        bne .normalSBC3
        lda Frame
        and #%10000001
        bne .normalSBC3
        clc               ; english to prevent ball being stuck
        bcc .englishSBC3
.normalSBC3
        sec
.englishSBC3
        lda #16
        sbc M0DirSpeed,x
        and #%11111
        tay
        lda #%11100000
        and M0DirSpeed,x
        sta M0DirSpeed,x
        tya
        ora M0DirSpeed,x
        sta M0DirSpeed,x
        lda #95
.storeY
        sta M0yPosHigh,x
        sta M0yEvenRow,x
        sta M0yOddRow,x
        and #1
        beq .decOdd
        dec M0yEvenRow,x
        .byte $2c ; skip dec odd
.decOdd
        dec M0yOddRow,x
        ldy M0DirSpeed,x
        clc
        lda M0xPosLow,x
        adc BALLxLow,y
        sta M0xPosLow,x
        lda M0xPosHigh,x
        adc BALLxHigh,y
        cmp #200          ; wrap from zero?
        bcc .testRight
.resetToFakeZero
        lda M0DirSpeed,x ; only do english if going straight left
        and #%00011111
        cmp #24
        bne .normalSBC
        lda Frame
        and #%10000001
        bne .normalSBC
        clc               ; english to prevent ball being stuck
        bcc .englishSBC
.normalSBC
        sec
.englishSBC
        lda #32
        sbc M0DirSpeed,x
        and #%11111
        tay
        lda #%11100000
        and M0DirSpeed,x
        sta M0DirSpeed,x
        tya
        ora M0DirSpeed,x
        sta M0DirSpeed,x
        lda #0
        beq .storeX
.testRight
        cmp #159           ; right of screen
        bcc .storeX
        lda M0DirSpeed,x ; only do english if going straight right
        and #%00011111
        cmp #8
        bne .normalSBC2
        lda Frame
        and #%10000001
        bne .normalSBC2
        clc               ; english to prevent ball being stuck
        bcc .englishSBC2
.normalSBC2
        sec
.englishSBC2
        lda #32
        sbc M0DirSpeed,x
        and #%11111
        tay
        lda #%11100000
        and M0DirSpeed,x
        sta M0DirSpeed,x
        tya
        ora M0DirSpeed,x
        sta M0DirSpeed,x
        lda #158
.storeX
        sta M0xPosHigh,x
        jmp SkipM0         ; changed from RTS to save cycles








 echo "----",($FB00 - *) , "bytes of BANK 7 ROM left"

        ORG $EB00
        RORG $FB00
 IF COMPILE_VERSION = NTSC

BALLxHigh
        .byte #>    0; speed: 0 direction: 0
        .byte #>    0; speed: 0 direction: 1
        .byte #>    0; speed: 0 direction: 2
        .byte #>    0; speed: 0 direction: 3
        .byte #>    0; speed: 0 direction: 4
        .byte #>    0; speed: 0 direction: 5
        .byte #>    0; speed: 0 direction: 6
        .byte #>    0; speed: 0 direction: 7
        .byte #>    0; speed: 0 direction: 8
        .byte #>    0; speed: 0 direction: 9
        .byte #>    0; speed: 0 direction: 10
        .byte #>    0; speed: 0 direction: 11
        .byte #>    0; speed: 0 direction: 12
        .byte #>    0; speed: 0 direction: 13
        .byte #>    0; speed: 0 direction: 14
        .byte #>    0; speed: 0 direction: 15
        .byte #>    0; speed: 0 direction: 16
        .byte #>    0; speed: 0 direction: 17
        .byte #>    0; speed: 0 direction: 18
        .byte #>    0; speed: 0 direction: 19
        .byte #>    0; speed: 0 direction: 20
        .byte #>    0; speed: 0 direction: 21
        .byte #>    0; speed: 0 direction: 22
        .byte #>    0; speed: 0 direction: 23
        .byte #>    0; speed: 0 direction: 24
        .byte #>    0; speed: 0 direction: 25
        .byte #>    0; speed: 0 direction: 26
        .byte #>    0; speed: 0 direction: 27
        .byte #>    0; speed: 0 direction: 28
        .byte #>    0; speed: 0 direction: 29
        .byte #>    0; speed: 0 direction: 30
        .byte #>    0; speed: 0 direction: 31
        .byte #>    0; speed: 0.5 direction: 0
        .byte #>   32; speed: 0.5 direction: 1
        .byte #>   64; speed: 0.5 direction: 2
        .byte #>   92; speed: 0.5 direction: 3
        .byte #>  118; speed: 0.5 direction: 4
        .byte #>  138; speed: 0.5 direction: 5
        .byte #>  154; speed: 0.5 direction: 6
        .byte #>  163; speed: 0.5 direction: 7
        .byte #>  166; speed: 0.5 direction: 8
        .byte #>  163; speed: 0.5 direction: 9
        .byte #>  154; speed: 0.5 direction: 10
        .byte #>  138; speed: 0.5 direction: 11
        .byte #>  118; speed: 0.5 direction: 12
        .byte #>   92; speed: 0.5 direction: 13
        .byte #>   64; speed: 0.5 direction: 14
        .byte #>   32; speed: 0.5 direction: 15
        .byte #>    0; speed: 0.5 direction: 16
        .byte #>  -32; speed: 0.5 direction: 17
        .byte #>  -64; speed: 0.5 direction: 18
        .byte #>  -92; speed: 0.5 direction: 19
        .byte #> -118; speed: 0.5 direction: 20
        .byte #> -138; speed: 0.5 direction: 21
        .byte #> -154; speed: 0.5 direction: 22
        .byte #> -163; speed: 0.5 direction: 23
        .byte #> -166; speed: 0.5 direction: 24
        .byte #> -163; speed: 0.5 direction: 25
        .byte #> -154; speed: 0.5 direction: 26
        .byte #> -138; speed: 0.5 direction: 27
        .byte #> -118; speed: 0.5 direction: 28
        .byte #>  -92; speed: 0.5 direction: 29
        .byte #>  -64; speed: 0.5 direction: 30
        .byte #>  -32; speed: 0.5 direction: 31
        .byte #>    0; speed: 1 direction: 0
        .byte #>   64; speed: 1 direction: 1
        .byte #>  127; speed: 1 direction: 2
        .byte #>  184; speed: 1 direction: 3
        .byte #>  235; speed: 1 direction: 4
        .byte #>  276; speed: 1 direction: 5
        .byte #>  307; speed: 1 direction: 6
        .byte #>  326; speed: 1 direction: 7
        .byte #>  332; speed: 1 direction: 8
        .byte #>  326; speed: 1 direction: 9
        .byte #>  307; speed: 1 direction: 10
        .byte #>  276; speed: 1 direction: 11
        .byte #>  235; speed: 1 direction: 12
        .byte #>  184; speed: 1 direction: 13
        .byte #>  127; speed: 1 direction: 14
        .byte #>   64; speed: 1 direction: 15
        .byte #>    0; speed: 1 direction: 16
        .byte #>  -64; speed: 1 direction: 17
        .byte #> -127; speed: 1 direction: 18
        .byte #> -184; speed: 1 direction: 19
        .byte #> -235; speed: 1 direction: 20
        .byte #> -276; speed: 1 direction: 21
        .byte #> -307; speed: 1 direction: 22
        .byte #> -326; speed: 1 direction: 23
        .byte #> -332; speed: 1 direction: 24
        .byte #> -326; speed: 1 direction: 25
        .byte #> -307; speed: 1 direction: 26
        .byte #> -276; speed: 1 direction: 27
        .byte #> -235; speed: 1 direction: 28
        .byte #> -184; speed: 1 direction: 29
        .byte #> -127; speed: 1 direction: 30
        .byte #>  -64; speed: 1 direction: 31
        .byte #>    0; speed: 1.5 direction: 0
        .byte #>   96; speed: 1.5 direction: 1
        .byte #>  190; speed: 1.5 direction: 2
        .byte #>  276; speed: 1.5 direction: 3
        .byte #>  352; speed: 1.5 direction: 4
        .byte #>  414; speed: 1.5 direction: 5
        .byte #>  460; speed: 1.5 direction: 6
        .byte #>  489; speed: 1.5 direction: 7
        .byte #>  498; speed: 1.5 direction: 8
        .byte #>  489; speed: 1.5 direction: 9
        .byte #>  460; speed: 1.5 direction: 10
        .byte #>  414; speed: 1.5 direction: 11
        .byte #>  352; speed: 1.5 direction: 12
        .byte #>  276; speed: 1.5 direction: 13
        .byte #>  190; speed: 1.5 direction: 14
        .byte #>   96; speed: 1.5 direction: 15
        .byte #>    0; speed: 1.5 direction: 16
        .byte #>  -96; speed: 1.5 direction: 17
        .byte #> -190; speed: 1.5 direction: 18
        .byte #> -276; speed: 1.5 direction: 19
        .byte #> -352; speed: 1.5 direction: 20
        .byte #> -414; speed: 1.5 direction: 21
        .byte #> -460; speed: 1.5 direction: 22
        .byte #> -489; speed: 1.5 direction: 23
        .byte #> -498; speed: 1.5 direction: 24
        .byte #> -489; speed: 1.5 direction: 25
        .byte #> -460; speed: 1.5 direction: 26
        .byte #> -414; speed: 1.5 direction: 27
        .byte #> -352; speed: 1.5 direction: 28
        .byte #> -276; speed: 1.5 direction: 29
        .byte #> -190; speed: 1.5 direction: 30
        .byte #>  -96; speed: 1.5 direction: 31
        .byte #>    0; speed: 2 direction: 0
        .byte #>  128; speed: 2 direction: 1
        .byte #>  254; speed: 2 direction: 2
        .byte #>  368; speed: 2 direction: 3
        .byte #>  470; speed: 2 direction: 4
        .byte #>  552; speed: 2 direction: 5
        .byte #>  614; speed: 2 direction: 6
        .byte #>  652; speed: 2 direction: 7
        .byte #>  664; speed: 2 direction: 8
        .byte #>  652; speed: 2 direction: 9
        .byte #>  614; speed: 2 direction: 10
        .byte #>  552; speed: 2 direction: 11
        .byte #>  470; speed: 2 direction: 12
        .byte #>  368; speed: 2 direction: 13
        .byte #>  254; speed: 2 direction: 14
        .byte #>  128; speed: 2 direction: 15
        .byte #>    0; speed: 2 direction: 16
        .byte #> -128; speed: 2 direction: 17
        .byte #> -254; speed: 2 direction: 18
        .byte #> -368; speed: 2 direction: 19
        .byte #> -470; speed: 2 direction: 20
        .byte #> -552; speed: 2 direction: 21
        .byte #> -614; speed: 2 direction: 22
        .byte #> -652; speed: 2 direction: 23
        .byte #> -664; speed: 2 direction: 24
        .byte #> -652; speed: 2 direction: 25
        .byte #> -614; speed: 2 direction: 26
        .byte #> -552; speed: 2 direction: 27
        .byte #> -470; speed: 2 direction: 28
        .byte #> -368; speed: 2 direction: 29
        .byte #> -254; speed: 2 direction: 30
        .byte #> -128; speed: 2 direction: 31
        .byte #>    0; speed: 2.5 direction: 0
        .byte #>  160; speed: 2.5 direction: 1
        .byte #>  318; speed: 2.5 direction: 2
        .byte #>  460; speed: 2.5 direction: 3
        .byte #>  588; speed: 2.5 direction: 4
        .byte #>  690; speed: 2.5 direction: 5
        .byte #>  768; speed: 2.5 direction: 6
        .byte #>  815; speed: 2.5 direction: 7
        .byte #>  830; speed: 2.5 direction: 8
        .byte #>  815; speed: 2.5 direction: 9
        .byte #>  768; speed: 2.5 direction: 10
        .byte #>  690; speed: 2.5 direction: 11
        .byte #>  588; speed: 2.5 direction: 12
        .byte #>  460; speed: 2.5 direction: 13
        .byte #>  318; speed: 2.5 direction: 14
        .byte #>  160; speed: 2.5 direction: 15
        .byte #>    0; speed: 2.5 direction: 16
        .byte #> -160; speed: 2.5 direction: 17
        .byte #> -318; speed: 2.5 direction: 18
        .byte #> -460; speed: 2.5 direction: 19
        .byte #> -588; speed: 2.5 direction: 20
        .byte #> -690; speed: 2.5 direction: 21
        .byte #> -768; speed: 2.5 direction: 22
        .byte #> -815; speed: 2.5 direction: 23
        .byte #> -830; speed: 2.5 direction: 24
        .byte #> -815; speed: 2.5 direction: 25
        .byte #> -768; speed: 2.5 direction: 26
        .byte #> -690; speed: 2.5 direction: 27
        .byte #> -588; speed: 2.5 direction: 28
        .byte #> -460; speed: 2.5 direction: 29
        .byte #> -318; speed: 2.5 direction: 30
        .byte #> -160; speed: 2.5 direction: 31
        .byte #>    0; speed: 3 direction: 0
        .byte #>  192; speed: 3 direction: 1
        .byte #>  381; speed: 3 direction: 2
        .byte #>  552; speed: 3 direction: 3
        .byte #>  705; speed: 3 direction: 4
        .byte #>  828; speed: 3 direction: 5
        .byte #>  921; speed: 3 direction: 6
        .byte #>  978; speed: 3 direction: 7
        .byte #>  996; speed: 3 direction: 8
        .byte #>  978; speed: 3 direction: 9
        .byte #>  921; speed: 3 direction: 10
        .byte #>  828; speed: 3 direction: 11
        .byte #>  705; speed: 3 direction: 12
        .byte #>  552; speed: 3 direction: 13
        .byte #>  381; speed: 3 direction: 14
        .byte #>  192; speed: 3 direction: 15
        .byte #>    0; speed: 3 direction: 16
        .byte #> -192; speed: 3 direction: 17
        .byte #> -381; speed: 3 direction: 18
        .byte #> -552; speed: 3 direction: 19
        .byte #> -705; speed: 3 direction: 20
        .byte #> -828; speed: 3 direction: 21
        .byte #> -921; speed: 3 direction: 22
        .byte #> -978; speed: 3 direction: 23
        .byte #> -996; speed: 3 direction: 24
        .byte #> -978; speed: 3 direction: 25
        .byte #> -921; speed: 3 direction: 26
        .byte #> -828; speed: 3 direction: 27
        .byte #> -705; speed: 3 direction: 28
        .byte #> -552; speed: 3 direction: 29
        .byte #> -381; speed: 3 direction: 30
        .byte #> -192; speed: 3 direction: 31
        .byte #>    0; speed: 3.5 direction: 0
        .byte #>  224; speed: 3.5 direction: 1
        .byte #>  444; speed: 3.5 direction: 2
        .byte #>  644; speed: 3.5 direction: 3
        .byte #>  822; speed: 3.5 direction: 4
        .byte #>  966; speed: 3.5 direction: 5
        .byte #> 1074; speed: 3.5 direction: 6
        .byte #> 1141; speed: 3.5 direction: 7
        .byte #> 1162; speed: 3.5 direction: 8
        .byte #> 1141; speed: 3.5 direction: 9
        .byte #> 1074; speed: 3.5 direction: 10
        .byte #>  966; speed: 3.5 direction: 11
        .byte #>  822; speed: 3.5 direction: 12
        .byte #>  644; speed: 3.5 direction: 13
        .byte #>  444; speed: 3.5 direction: 14
        .byte #>  224; speed: 3.5 direction: 15
        .byte #>    0; speed: 3.5 direction: 16
        .byte #> -224; speed: 3.5 direction: 17
        .byte #> -444; speed: 3.5 direction: 18
        .byte #> -644; speed: 3.5 direction: 19
        .byte #> -822; speed: 3.5 direction: 20
        .byte #> -966; speed: 3.5 direction: 21
        .byte #>-1074; speed: 3.5 direction: 22
        .byte #>-1141; speed: 3.5 direction: 23
        .byte #>-1162; speed: 3.5 direction: 24
        .byte #>-1141; speed: 3.5 direction: 25
        .byte #>-1074; speed: 3.5 direction: 26
        .byte #> -966; speed: 3.5 direction: 27
        .byte #> -822; speed: 3.5 direction: 28
        .byte #> -644; speed: 3.5 direction: 29
        .byte #> -444; speed: 3.5 direction: 30
        .byte #> -224; speed: 3.5 direction: 31

BALLxLow
        .byte #<    0; speed: 0 direction: 0
        .byte #<    0; speed: 0 direction: 1
        .byte #<    0; speed: 0 direction: 2
        .byte #<    0; speed: 0 direction: 3
        .byte #<    0; speed: 0 direction: 4
        .byte #<    0; speed: 0 direction: 5
        .byte #<    0; speed: 0 direction: 6
        .byte #<    0; speed: 0 direction: 7
        .byte #<    0; speed: 0 direction: 8
        .byte #<    0; speed: 0 direction: 9
        .byte #<    0; speed: 0 direction: 10
        .byte #<    0; speed: 0 direction: 11
        .byte #<    0; speed: 0 direction: 12
        .byte #<    0; speed: 0 direction: 13
        .byte #<    0; speed: 0 direction: 14
        .byte #<    0; speed: 0 direction: 15
        .byte #<    0; speed: 0 direction: 16
        .byte #<    0; speed: 0 direction: 17
        .byte #<    0; speed: 0 direction: 18
        .byte #<    0; speed: 0 direction: 19
        .byte #<    0; speed: 0 direction: 20
        .byte #<    0; speed: 0 direction: 21
        .byte #<    0; speed: 0 direction: 22
        .byte #<    0; speed: 0 direction: 23
        .byte #<    0; speed: 0 direction: 24
        .byte #<    0; speed: 0 direction: 25
        .byte #<    0; speed: 0 direction: 26
        .byte #<    0; speed: 0 direction: 27
        .byte #<    0; speed: 0 direction: 28
        .byte #<    0; speed: 0 direction: 29
        .byte #<    0; speed: 0 direction: 30
        .byte #<    0; speed: 0 direction: 31
        .byte #<    0; speed: 0.5 direction: 0
        .byte #<   32; speed: 0.5 direction: 1
        .byte #<   64; speed: 0.5 direction: 2
        .byte #<   92; speed: 0.5 direction: 3
        .byte #<  118; speed: 0.5 direction: 4
        .byte #<  138; speed: 0.5 direction: 5
        .byte #<  154; speed: 0.5 direction: 6
        .byte #<  163; speed: 0.5 direction: 7
        .byte #<  166; speed: 0.5 direction: 8
        .byte #<  163; speed: 0.5 direction: 9
        .byte #<  154; speed: 0.5 direction: 10
        .byte #<  138; speed: 0.5 direction: 11
        .byte #<  118; speed: 0.5 direction: 12
        .byte #<   92; speed: 0.5 direction: 13
        .byte #<   64; speed: 0.5 direction: 14
        .byte #<   32; speed: 0.5 direction: 15
        .byte #<    0; speed: 0.5 direction: 16
        .byte #<  -32; speed: 0.5 direction: 17
        .byte #<  -64; speed: 0.5 direction: 18
        .byte #<  -92; speed: 0.5 direction: 19
        .byte #< -118; speed: 0.5 direction: 20
        .byte #< -138; speed: 0.5 direction: 21
        .byte #< -154; speed: 0.5 direction: 22
        .byte #< -163; speed: 0.5 direction: 23
        .byte #< -166; speed: 0.5 direction: 24
        .byte #< -163; speed: 0.5 direction: 25
        .byte #< -154; speed: 0.5 direction: 26
        .byte #< -138; speed: 0.5 direction: 27
        .byte #< -118; speed: 0.5 direction: 28
        .byte #<  -92; speed: 0.5 direction: 29
        .byte #<  -64; speed: 0.5 direction: 30
        .byte #<  -32; speed: 0.5 direction: 31
        .byte #<    0; speed: 1 direction: 0
        .byte #<   64; speed: 1 direction: 1
        .byte #<  127; speed: 1 direction: 2
        .byte #<  184; speed: 1 direction: 3
        .byte #<  235; speed: 1 direction: 4
        .byte #<  276; speed: 1 direction: 5
        .byte #<  307; speed: 1 direction: 6
        .byte #<  326; speed: 1 direction: 7
        .byte #<  332; speed: 1 direction: 8
        .byte #<  326; speed: 1 direction: 9
        .byte #<  307; speed: 1 direction: 10
        .byte #<  276; speed: 1 direction: 11
        .byte #<  235; speed: 1 direction: 12
        .byte #<  184; speed: 1 direction: 13
        .byte #<  127; speed: 1 direction: 14
        .byte #<   64; speed: 1 direction: 15
        .byte #<    0; speed: 1 direction: 16
        .byte #<  -64; speed: 1 direction: 17
        .byte #< -127; speed: 1 direction: 18
        .byte #< -184; speed: 1 direction: 19
        .byte #< -235; speed: 1 direction: 20
        .byte #< -276; speed: 1 direction: 21
        .byte #< -307; speed: 1 direction: 22
        .byte #< -326; speed: 1 direction: 23
        .byte #< -332; speed: 1 direction: 24
        .byte #< -326; speed: 1 direction: 25
        .byte #< -307; speed: 1 direction: 26
        .byte #< -276; speed: 1 direction: 27
        .byte #< -235; speed: 1 direction: 28
        .byte #< -184; speed: 1 direction: 29
        .byte #< -127; speed: 1 direction: 30
        .byte #<  -64; speed: 1 direction: 31
        .byte #<    0; speed: 1.5 direction: 0
        .byte #<   96; speed: 1.5 direction: 1
        .byte #<  190; speed: 1.5 direction: 2
        .byte #<  276; speed: 1.5 direction: 3
        .byte #<  352; speed: 1.5 direction: 4
        .byte #<  414; speed: 1.5 direction: 5
        .byte #<  460; speed: 1.5 direction: 6
        .byte #<  489; speed: 1.5 direction: 7
        .byte #<  498; speed: 1.5 direction: 8
        .byte #<  489; speed: 1.5 direction: 9
        .byte #<  460; speed: 1.5 direction: 10
        .byte #<  414; speed: 1.5 direction: 11
        .byte #<  352; speed: 1.5 direction: 12
        .byte #<  276; speed: 1.5 direction: 13
        .byte #<  190; speed: 1.5 direction: 14
        .byte #<   96; speed: 1.5 direction: 15
        .byte #<    0; speed: 1.5 direction: 16
        .byte #<  -96; speed: 1.5 direction: 17
        .byte #< -190; speed: 1.5 direction: 18
        .byte #< -276; speed: 1.5 direction: 19
        .byte #< -352; speed: 1.5 direction: 20
        .byte #< -414; speed: 1.5 direction: 21
        .byte #< -460; speed: 1.5 direction: 22
        .byte #< -489; speed: 1.5 direction: 23
        .byte #< -498; speed: 1.5 direction: 24
        .byte #< -489; speed: 1.5 direction: 25
        .byte #< -460; speed: 1.5 direction: 26
        .byte #< -414; speed: 1.5 direction: 27
        .byte #< -352; speed: 1.5 direction: 28
        .byte #< -276; speed: 1.5 direction: 29
        .byte #< -190; speed: 1.5 direction: 30
        .byte #<  -96; speed: 1.5 direction: 31
        .byte #<    0; speed: 2 direction: 0
        .byte #<  128; speed: 2 direction: 1
        .byte #<  254; speed: 2 direction: 2
        .byte #<  368; speed: 2 direction: 3
        .byte #<  470; speed: 2 direction: 4
        .byte #<  552; speed: 2 direction: 5
        .byte #<  614; speed: 2 direction: 6
        .byte #<  652; speed: 2 direction: 7
        .byte #<  664; speed: 2 direction: 8
        .byte #<  652; speed: 2 direction: 9
        .byte #<  614; speed: 2 direction: 10
        .byte #<  552; speed: 2 direction: 11
        .byte #<  470; speed: 2 direction: 12
        .byte #<  368; speed: 2 direction: 13
        .byte #<  254; speed: 2 direction: 14
        .byte #<  128; speed: 2 direction: 15
        .byte #<    0; speed: 2 direction: 16
        .byte #< -128; speed: 2 direction: 17
        .byte #< -254; speed: 2 direction: 18
        .byte #< -368; speed: 2 direction: 19
        .byte #< -470; speed: 2 direction: 20
        .byte #< -552; speed: 2 direction: 21
        .byte #< -614; speed: 2 direction: 22
        .byte #< -652; speed: 2 direction: 23
        .byte #< -664; speed: 2 direction: 24
        .byte #< -652; speed: 2 direction: 25
        .byte #< -614; speed: 2 direction: 26
        .byte #< -552; speed: 2 direction: 27
        .byte #< -470; speed: 2 direction: 28
        .byte #< -368; speed: 2 direction: 29
        .byte #< -254; speed: 2 direction: 30
        .byte #< -128; speed: 2 direction: 31
        .byte #<    0; speed: 2.5 direction: 0
        .byte #<  160; speed: 2.5 direction: 1
        .byte #<  318; speed: 2.5 direction: 2
        .byte #<  460; speed: 2.5 direction: 3
        .byte #<  588; speed: 2.5 direction: 4
        .byte #<  690; speed: 2.5 direction: 5
        .byte #<  768; speed: 2.5 direction: 6
        .byte #<  815; speed: 2.5 direction: 7
        .byte #<  830; speed: 2.5 direction: 8
        .byte #<  815; speed: 2.5 direction: 9
        .byte #<  768; speed: 2.5 direction: 10
        .byte #<  690; speed: 2.5 direction: 11
        .byte #<  588; speed: 2.5 direction: 12
        .byte #<  460; speed: 2.5 direction: 13
        .byte #<  318; speed: 2.5 direction: 14
        .byte #<  160; speed: 2.5 direction: 15
        .byte #<    0; speed: 2.5 direction: 16
        .byte #< -160; speed: 2.5 direction: 17
        .byte #< -318; speed: 2.5 direction: 18
        .byte #< -460; speed: 2.5 direction: 19
        .byte #< -588; speed: 2.5 direction: 20
        .byte #< -690; speed: 2.5 direction: 21
        .byte #< -768; speed: 2.5 direction: 22
        .byte #< -815; speed: 2.5 direction: 23
        .byte #< -830; speed: 2.5 direction: 24
        .byte #< -815; speed: 2.5 direction: 25
        .byte #< -768; speed: 2.5 direction: 26
        .byte #< -690; speed: 2.5 direction: 27
        .byte #< -588; speed: 2.5 direction: 28
        .byte #< -460; speed: 2.5 direction: 29
        .byte #< -318; speed: 2.5 direction: 30
        .byte #< -160; speed: 2.5 direction: 31
        .byte #<    0; speed: 3 direction: 0
        .byte #<  192; speed: 3 direction: 1
        .byte #<  381; speed: 3 direction: 2
        .byte #<  552; speed: 3 direction: 3
        .byte #<  705; speed: 3 direction: 4
        .byte #<  828; speed: 3 direction: 5
        .byte #<  921; speed: 3 direction: 6
        .byte #<  978; speed: 3 direction: 7
        .byte #<  996; speed: 3 direction: 8
        .byte #<  978; speed: 3 direction: 9
        .byte #<  921; speed: 3 direction: 10
        .byte #<  828; speed: 3 direction: 11
        .byte #<  705; speed: 3 direction: 12
        .byte #<  552; speed: 3 direction: 13
        .byte #<  381; speed: 3 direction: 14
        .byte #<  192; speed: 3 direction: 15
        .byte #<    0; speed: 3 direction: 16
        .byte #< -192; speed: 3 direction: 17
        .byte #< -381; speed: 3 direction: 18
        .byte #< -552; speed: 3 direction: 19
        .byte #< -705; speed: 3 direction: 20
        .byte #< -828; speed: 3 direction: 21
        .byte #< -921; speed: 3 direction: 22
        .byte #< -978; speed: 3 direction: 23
        .byte #< -996; speed: 3 direction: 24
        .byte #< -978; speed: 3 direction: 25
        .byte #< -921; speed: 3 direction: 26
        .byte #< -828; speed: 3 direction: 27
        .byte #< -705; speed: 3 direction: 28
        .byte #< -552; speed: 3 direction: 29
        .byte #< -381; speed: 3 direction: 30
        .byte #< -192; speed: 3 direction: 31
        .byte #<    0; speed: 3.5 direction: 0
        .byte #<  224; speed: 3.5 direction: 1
        .byte #<  444; speed: 3.5 direction: 2
        .byte #<  644; speed: 3.5 direction: 3
        .byte #<  822; speed: 3.5 direction: 4
        .byte #<  966; speed: 3.5 direction: 5
        .byte #< 1074; speed: 3.5 direction: 6
        .byte #< 1141; speed: 3.5 direction: 7
        .byte #< 1162; speed: 3.5 direction: 8
        .byte #< 1141; speed: 3.5 direction: 9
        .byte #< 1074; speed: 3.5 direction: 10
        .byte #<  966; speed: 3.5 direction: 11
        .byte #<  822; speed: 3.5 direction: 12
        .byte #<  644; speed: 3.5 direction: 13
        .byte #<  444; speed: 3.5 direction: 14
        .byte #<  224; speed: 3.5 direction: 15
        .byte #<    0; speed: 3.5 direction: 16
        .byte #< -224; speed: 3.5 direction: 17
        .byte #< -444; speed: 3.5 direction: 18
        .byte #< -644; speed: 3.5 direction: 19
        .byte #< -822; speed: 3.5 direction: 20
        .byte #< -966; speed: 3.5 direction: 21
        .byte #<-1074; speed: 3.5 direction: 22
        .byte #<-1141; speed: 3.5 direction: 23
        .byte #<-1162; speed: 3.5 direction: 24
        .byte #<-1141; speed: 3.5 direction: 25
        .byte #<-1074; speed: 3.5 direction: 26
        .byte #< -966; speed: 3.5 direction: 27
        .byte #< -822; speed: 3.5 direction: 28
        .byte #< -644; speed: 3.5 direction: 29
        .byte #< -444; speed: 3.5 direction: 30
        .byte #< -224; speed: 3.5 direction: 31

BALLyHigh
        .byte #>    0; speed: 0 direction: 0
        .byte #>    0; speed: 0 direction: 1
        .byte #>    0; speed: 0 direction: 2
        .byte #>    0; speed: 0 direction: 3
        .byte #>    0; speed: 0 direction: 4
        .byte #>    0; speed: 0 direction: 5
        .byte #>    0; speed: 0 direction: 6
        .byte #>    0; speed: 0 direction: 7
        .byte #>    0; speed: 0 direction: 8
        .byte #>    0; speed: 0 direction: 9
        .byte #>    0; speed: 0 direction: 10
        .byte #>    0; speed: 0 direction: 11
        .byte #>    0; speed: 0 direction: 12
        .byte #>    0; speed: 0 direction: 13
        .byte #>    0; speed: 0 direction: 14
        .byte #>    0; speed: 0 direction: 15
        .byte #>    0; speed: 0 direction: 16
        .byte #>    0; speed: 0 direction: 17
        .byte #>    0; speed: 0 direction: 18
        .byte #>    0; speed: 0 direction: 19
        .byte #>    0; speed: 0 direction: 20
        .byte #>    0; speed: 0 direction: 21
        .byte #>    0; speed: 0 direction: 22
        .byte #>    0; speed: 0 direction: 23
        .byte #>    0; speed: 0 direction: 24
        .byte #>    0; speed: 0 direction: 25
        .byte #>    0; speed: 0 direction: 26
        .byte #>    0; speed: 0 direction: 27
        .byte #>    0; speed: 0 direction: 28
        .byte #>    0; speed: 0 direction: 29
        .byte #>    0; speed: 0 direction: 30
        .byte #>    0; speed: 0 direction: 31
        .byte #>  128; speed: 0.5 direction: 0
        .byte #>  126; speed: 0.5 direction: 1
        .byte #>  118; speed: 0.5 direction: 2
        .byte #>  106; speed: 0.5 direction: 3
        .byte #>   90; speed: 0.5 direction: 4
        .byte #>   71; speed: 0.5 direction: 5
        .byte #>   48; speed: 0.5 direction: 6
        .byte #>   24; speed: 0.5 direction: 7
        .byte #>    0; speed: 0.5 direction: 8
        .byte #>  -24; speed: 0.5 direction: 9
        .byte #>  -48; speed: 0.5 direction: 10
        .byte #>  -71; speed: 0.5 direction: 11
        .byte #>  -90; speed: 0.5 direction: 12
        .byte #> -106; speed: 0.5 direction: 13
        .byte #> -118; speed: 0.5 direction: 14
        .byte #> -126; speed: 0.5 direction: 15
        .byte #> -128; speed: 0.5 direction: 16
        .byte #> -126; speed: 0.5 direction: 17
        .byte #> -118; speed: 0.5 direction: 18
        .byte #> -106; speed: 0.5 direction: 19
        .byte #>  -90; speed: 0.5 direction: 20
        .byte #>  -71; speed: 0.5 direction: 21
        .byte #>  -48; speed: 0.5 direction: 22
        .byte #>  -24; speed: 0.5 direction: 23
        .byte #>    0; speed: 0.5 direction: 24
        .byte #>   24; speed: 0.5 direction: 25
        .byte #>   48; speed: 0.5 direction: 26
        .byte #>   71; speed: 0.5 direction: 27
        .byte #>   90; speed: 0.5 direction: 28
        .byte #>  106; speed: 0.5 direction: 29
        .byte #>  118; speed: 0.5 direction: 30
        .byte #>  126; speed: 0.5 direction: 31
        .byte #>  256; speed: 1 direction: 0
        .byte #>  251; speed: 1 direction: 1
        .byte #>  236; speed: 1 direction: 2
        .byte #>  212; speed: 1 direction: 3
        .byte #>  181; speed: 1 direction: 4
        .byte #>  142; speed: 1 direction: 5
        .byte #>   97; speed: 1 direction: 6
        .byte #>   49; speed: 1 direction: 7
        .byte #>    0; speed: 1 direction: 8
        .byte #>  -49; speed: 1 direction: 9
        .byte #>  -97; speed: 1 direction: 10
        .byte #> -142; speed: 1 direction: 11
        .byte #> -181; speed: 1 direction: 12
        .byte #> -212; speed: 1 direction: 13
        .byte #> -236; speed: 1 direction: 14
        .byte #> -251; speed: 1 direction: 15
        .byte #> -256; speed: 1 direction: 16
        .byte #> -251; speed: 1 direction: 17
        .byte #> -236; speed: 1 direction: 18
        .byte #> -212; speed: 1 direction: 19
        .byte #> -181; speed: 1 direction: 20
        .byte #> -142; speed: 1 direction: 21
        .byte #>  -97; speed: 1 direction: 22
        .byte #>  -49; speed: 1 direction: 23
        .byte #>    0; speed: 1 direction: 24
        .byte #>   49; speed: 1 direction: 25
        .byte #>   97; speed: 1 direction: 26
        .byte #>  142; speed: 1 direction: 27
        .byte #>  181; speed: 1 direction: 28
        .byte #>  212; speed: 1 direction: 29
        .byte #>  236; speed: 1 direction: 30
        .byte #>  251; speed: 1 direction: 31
        .byte #>  384; speed: 1.5 direction: 0
        .byte #>  376; speed: 1.5 direction: 1
        .byte #>  354; speed: 1.5 direction: 2
        .byte #>  318; speed: 1.5 direction: 3
        .byte #>  272; speed: 1.5 direction: 4
        .byte #>  213; speed: 1.5 direction: 5
        .byte #>  146; speed: 1.5 direction: 6
        .byte #>   74; speed: 1.5 direction: 7
        .byte #>    0; speed: 1.5 direction: 8
        .byte #>  -74; speed: 1.5 direction: 9
        .byte #> -146; speed: 1.5 direction: 10
        .byte #> -213; speed: 1.5 direction: 11
        .byte #> -272; speed: 1.5 direction: 12
        .byte #> -318; speed: 1.5 direction: 13
        .byte #> -354; speed: 1.5 direction: 14
        .byte #> -376; speed: 1.5 direction: 15
        .byte #> -384; speed: 1.5 direction: 16
        .byte #> -376; speed: 1.5 direction: 17
        .byte #> -354; speed: 1.5 direction: 18
        .byte #> -318; speed: 1.5 direction: 19
        .byte #> -272; speed: 1.5 direction: 20
        .byte #> -213; speed: 1.5 direction: 21
        .byte #> -146; speed: 1.5 direction: 22
        .byte #>  -74; speed: 1.5 direction: 23
        .byte #>    0; speed: 1.5 direction: 24
        .byte #>   74; speed: 1.5 direction: 25
        .byte #>  146; speed: 1.5 direction: 26
        .byte #>  213; speed: 1.5 direction: 27
        .byte #>  272; speed: 1.5 direction: 28
        .byte #>  318; speed: 1.5 direction: 29
        .byte #>  354; speed: 1.5 direction: 30
        .byte #>  376; speed: 1.5 direction: 31
        .byte #>  512; speed: 2 direction: 0
        .byte #>  502; speed: 2 direction: 1
        .byte #>  472; speed: 2 direction: 2
        .byte #>  424; speed: 2 direction: 3
        .byte #>  362; speed: 2 direction: 4
        .byte #>  284; speed: 2 direction: 5
        .byte #>  194; speed: 2 direction: 6
        .byte #>   98; speed: 2 direction: 7
        .byte #>    0; speed: 2 direction: 8
        .byte #>  -98; speed: 2 direction: 9
        .byte #> -194; speed: 2 direction: 10
        .byte #> -284; speed: 2 direction: 11
        .byte #> -362; speed: 2 direction: 12
        .byte #> -424; speed: 2 direction: 13
        .byte #> -472; speed: 2 direction: 14
        .byte #> -502; speed: 2 direction: 15
        .byte #> -512; speed: 2 direction: 16
        .byte #> -502; speed: 2 direction: 17
        .byte #> -472; speed: 2 direction: 18
        .byte #> -424; speed: 2 direction: 19
        .byte #> -362; speed: 2 direction: 20
        .byte #> -284; speed: 2 direction: 21
        .byte #> -194; speed: 2 direction: 22
        .byte #>  -98; speed: 2 direction: 23
        .byte #>    0; speed: 2 direction: 24
        .byte #>   98; speed: 2 direction: 25
        .byte #>  194; speed: 2 direction: 26
        .byte #>  284; speed: 2 direction: 27
        .byte #>  362; speed: 2 direction: 28
        .byte #>  424; speed: 2 direction: 29
        .byte #>  472; speed: 2 direction: 30
        .byte #>  502; speed: 2 direction: 31
        .byte #>  640; speed: 2.5 direction: 0
        .byte #>  628; speed: 2.5 direction: 1
        .byte #>  590; speed: 2.5 direction: 2
        .byte #>  530; speed: 2.5 direction: 3
        .byte #>  452; speed: 2.5 direction: 4
        .byte #>  355; speed: 2.5 direction: 5
        .byte #>  242; speed: 2.5 direction: 6
        .byte #>  122; speed: 2.5 direction: 7
        .byte #>    0; speed: 2.5 direction: 8
        .byte #> -122; speed: 2.5 direction: 9
        .byte #> -242; speed: 2.5 direction: 10
        .byte #> -355; speed: 2.5 direction: 11
        .byte #> -452; speed: 2.5 direction: 12
        .byte #> -530; speed: 2.5 direction: 13
        .byte #> -590; speed: 2.5 direction: 14
        .byte #> -628; speed: 2.5 direction: 15
        .byte #> -640; speed: 2.5 direction: 16
        .byte #> -628; speed: 2.5 direction: 17
        .byte #> -590; speed: 2.5 direction: 18
        .byte #> -530; speed: 2.5 direction: 19
        .byte #> -452; speed: 2.5 direction: 20
        .byte #> -355; speed: 2.5 direction: 21
        .byte #> -242; speed: 2.5 direction: 22
        .byte #> -122; speed: 2.5 direction: 23
        .byte #>    0; speed: 2.5 direction: 24
        .byte #>  122; speed: 2.5 direction: 25
        .byte #>  242; speed: 2.5 direction: 26
        .byte #>  355; speed: 2.5 direction: 27
        .byte #>  452; speed: 2.5 direction: 28
        .byte #>  530; speed: 2.5 direction: 29
        .byte #>  590; speed: 2.5 direction: 30
        .byte #>  628; speed: 2.5 direction: 31
        .byte #>  768; speed: 3 direction: 0
        .byte #>  753; speed: 3 direction: 1
        .byte #>  708; speed: 3 direction: 2
        .byte #>  636; speed: 3 direction: 3
        .byte #>  543; speed: 3 direction: 4
        .byte #>  426; speed: 3 direction: 5
        .byte #>  291; speed: 3 direction: 6
        .byte #>  147; speed: 3 direction: 7
        .byte #>    0; speed: 3 direction: 8
        .byte #> -147; speed: 3 direction: 9
        .byte #> -291; speed: 3 direction: 10
        .byte #> -426; speed: 3 direction: 11
        .byte #> -543; speed: 3 direction: 12
        .byte #> -636; speed: 3 direction: 13
        .byte #> -708; speed: 3 direction: 14
        .byte #> -753; speed: 3 direction: 15
        .byte #> -768; speed: 3 direction: 16
        .byte #> -753; speed: 3 direction: 17
        .byte #> -708; speed: 3 direction: 18
        .byte #> -636; speed: 3 direction: 19
        .byte #> -543; speed: 3 direction: 20
        .byte #> -426; speed: 3 direction: 21
        .byte #> -291; speed: 3 direction: 22
        .byte #> -147; speed: 3 direction: 23
        .byte #>    0; speed: 3 direction: 24
        .byte #>  147; speed: 3 direction: 25
        .byte #>  291; speed: 3 direction: 26
        .byte #>  426; speed: 3 direction: 27
        .byte #>  543; speed: 3 direction: 28
        .byte #>  636; speed: 3 direction: 29
        .byte #>  708; speed: 3 direction: 30
        .byte #>  753; speed: 3 direction: 31
        .byte #>  896; speed: 3.5 direction: 0
        .byte #>  878; speed: 3.5 direction: 1
        .byte #>  826; speed: 3.5 direction: 2
        .byte #>  742; speed: 3.5 direction: 3
        .byte #>  634; speed: 3.5 direction: 4
        .byte #>  497; speed: 3.5 direction: 5
        .byte #>  340; speed: 3.5 direction: 6
        .byte #>  172; speed: 3.5 direction: 7
        .byte #>    0; speed: 3.5 direction: 8
        .byte #> -172; speed: 3.5 direction: 9
        .byte #> -340; speed: 3.5 direction: 10
        .byte #> -497; speed: 3.5 direction: 11
        .byte #> -634; speed: 3.5 direction: 12
        .byte #> -742; speed: 3.5 direction: 13
        .byte #> -826; speed: 3.5 direction: 14
        .byte #> -878; speed: 3.5 direction: 15
        .byte #> -896; speed: 3.5 direction: 16
        .byte #> -878; speed: 3.5 direction: 17
        .byte #> -826; speed: 3.5 direction: 18
        .byte #> -742; speed: 3.5 direction: 19
        .byte #> -634; speed: 3.5 direction: 20
        .byte #> -497; speed: 3.5 direction: 21
        .byte #> -340; speed: 3.5 direction: 22
        .byte #> -172; speed: 3.5 direction: 23
        .byte #>    0; speed: 3.5 direction: 24
        .byte #>  172; speed: 3.5 direction: 25
        .byte #>  340; speed: 3.5 direction: 26
        .byte #>  497; speed: 3.5 direction: 27
        .byte #>  634; speed: 3.5 direction: 28
        .byte #>  742; speed: 3.5 direction: 29
        .byte #>  826; speed: 3.5 direction: 30
        .byte #>  878; speed: 3.5 direction: 31

BALLyLow
        .byte #<    0; speed: 0 direction: 0
        .byte #<    0; speed: 0 direction: 1
        .byte #<    0; speed: 0 direction: 2
        .byte #<    0; speed: 0 direction: 3
        .byte #<    0; speed: 0 direction: 4
        .byte #<    0; speed: 0 direction: 5
        .byte #<    0; speed: 0 direction: 6
        .byte #<    0; speed: 0 direction: 7
        .byte #<    0; speed: 0 direction: 8
        .byte #<    0; speed: 0 direction: 9
        .byte #<    0; speed: 0 direction: 10
        .byte #<    0; speed: 0 direction: 11
        .byte #<    0; speed: 0 direction: 12
        .byte #<    0; speed: 0 direction: 13
        .byte #<    0; speed: 0 direction: 14
        .byte #<    0; speed: 0 direction: 15
        .byte #<    0; speed: 0 direction: 16
        .byte #<    0; speed: 0 direction: 17
        .byte #<    0; speed: 0 direction: 18
        .byte #<    0; speed: 0 direction: 19
        .byte #<    0; speed: 0 direction: 20
        .byte #<    0; speed: 0 direction: 21
        .byte #<    0; speed: 0 direction: 22
        .byte #<    0; speed: 0 direction: 23
        .byte #<    0; speed: 0 direction: 24
        .byte #<    0; speed: 0 direction: 25
        .byte #<    0; speed: 0 direction: 26
        .byte #<    0; speed: 0 direction: 27
        .byte #<    0; speed: 0 direction: 28
        .byte #<    0; speed: 0 direction: 29
        .byte #<    0; speed: 0 direction: 30
        .byte #<    0; speed: 0 direction: 31
        .byte #<  128; speed: 0.5 direction: 0
        .byte #<  126; speed: 0.5 direction: 1
        .byte #<  118; speed: 0.5 direction: 2
        .byte #<  106; speed: 0.5 direction: 3
        .byte #<   90; speed: 0.5 direction: 4
        .byte #<   71; speed: 0.5 direction: 5
        .byte #<   48; speed: 0.5 direction: 6
        .byte #<   24; speed: 0.5 direction: 7
        .byte #<    0; speed: 0.5 direction: 8
        .byte #<  -24; speed: 0.5 direction: 9
        .byte #<  -48; speed: 0.5 direction: 10
        .byte #<  -71; speed: 0.5 direction: 11
        .byte #<  -90; speed: 0.5 direction: 12
        .byte #< -106; speed: 0.5 direction: 13
        .byte #< -118; speed: 0.5 direction: 14
        .byte #< -126; speed: 0.5 direction: 15
        .byte #< -128; speed: 0.5 direction: 16
        .byte #< -126; speed: 0.5 direction: 17
        .byte #< -118; speed: 0.5 direction: 18
        .byte #< -106; speed: 0.5 direction: 19
        .byte #<  -90; speed: 0.5 direction: 20
        .byte #<  -71; speed: 0.5 direction: 21
        .byte #<  -48; speed: 0.5 direction: 22
        .byte #<  -24; speed: 0.5 direction: 23
        .byte #<    0; speed: 0.5 direction: 24
        .byte #<   24; speed: 0.5 direction: 25
        .byte #<   48; speed: 0.5 direction: 26
        .byte #<   71; speed: 0.5 direction: 27
        .byte #<   90; speed: 0.5 direction: 28
        .byte #<  106; speed: 0.5 direction: 29
        .byte #<  118; speed: 0.5 direction: 30
        .byte #<  126; speed: 0.5 direction: 31
        .byte #<  256; speed: 1 direction: 0
        .byte #<  251; speed: 1 direction: 1
        .byte #<  236; speed: 1 direction: 2
        .byte #<  212; speed: 1 direction: 3
        .byte #<  181; speed: 1 direction: 4
        .byte #<  142; speed: 1 direction: 5
        .byte #<   97; speed: 1 direction: 6
        .byte #<   49; speed: 1 direction: 7
        .byte #<    0; speed: 1 direction: 8
        .byte #<  -49; speed: 1 direction: 9
        .byte #<  -97; speed: 1 direction: 10
        .byte #< -142; speed: 1 direction: 11
        .byte #< -181; speed: 1 direction: 12
        .byte #< -212; speed: 1 direction: 13
        .byte #< -236; speed: 1 direction: 14
        .byte #< -251; speed: 1 direction: 15
        .byte #< -256; speed: 1 direction: 16
        .byte #< -251; speed: 1 direction: 17
        .byte #< -236; speed: 1 direction: 18
        .byte #< -212; speed: 1 direction: 19
        .byte #< -181; speed: 1 direction: 20
        .byte #< -142; speed: 1 direction: 21
        .byte #<  -97; speed: 1 direction: 22
        .byte #<  -49; speed: 1 direction: 23
        .byte #<    0; speed: 1 direction: 24
        .byte #<   49; speed: 1 direction: 25
        .byte #<   97; speed: 1 direction: 26
        .byte #<  142; speed: 1 direction: 27
        .byte #<  181; speed: 1 direction: 28
        .byte #<  212; speed: 1 direction: 29
        .byte #<  236; speed: 1 direction: 30
        .byte #<  251; speed: 1 direction: 31
        .byte #<  384; speed: 1.5 direction: 0
        .byte #<  376; speed: 1.5 direction: 1
        .byte #<  354; speed: 1.5 direction: 2
        .byte #<  318; speed: 1.5 direction: 3
        .byte #<  272; speed: 1.5 direction: 4
        .byte #<  213; speed: 1.5 direction: 5
        .byte #<  146; speed: 1.5 direction: 6
        .byte #<   74; speed: 1.5 direction: 7
        .byte #<    0; speed: 1.5 direction: 8
        .byte #<  -74; speed: 1.5 direction: 9
        .byte #< -146; speed: 1.5 direction: 10
        .byte #< -213; speed: 1.5 direction: 11
        .byte #< -272; speed: 1.5 direction: 12
        .byte #< -318; speed: 1.5 direction: 13
        .byte #< -354; speed: 1.5 direction: 14
        .byte #< -376; speed: 1.5 direction: 15
        .byte #< -384; speed: 1.5 direction: 16
        .byte #< -376; speed: 1.5 direction: 17
        .byte #< -354; speed: 1.5 direction: 18
        .byte #< -318; speed: 1.5 direction: 19
        .byte #< -272; speed: 1.5 direction: 20
        .byte #< -213; speed: 1.5 direction: 21
        .byte #< -146; speed: 1.5 direction: 22
        .byte #<  -74; speed: 1.5 direction: 23
        .byte #<    0; speed: 1.5 direction: 24
        .byte #<   74; speed: 1.5 direction: 25
        .byte #<  146; speed: 1.5 direction: 26
        .byte #<  213; speed: 1.5 direction: 27
        .byte #<  272; speed: 1.5 direction: 28
        .byte #<  318; speed: 1.5 direction: 29
        .byte #<  354; speed: 1.5 direction: 30
        .byte #<  376; speed: 1.5 direction: 31
        .byte #<  512; speed: 2 direction: 0
        .byte #<  502; speed: 2 direction: 1
        .byte #<  472; speed: 2 direction: 2
        .byte #<  424; speed: 2 direction: 3
        .byte #<  362; speed: 2 direction: 4
        .byte #<  284; speed: 2 direction: 5
        .byte #<  194; speed: 2 direction: 6
        .byte #<   98; speed: 2 direction: 7
        .byte #<    0; speed: 2 direction: 8
        .byte #<  -98; speed: 2 direction: 9
        .byte #< -194; speed: 2 direction: 10
        .byte #< -284; speed: 2 direction: 11
        .byte #< -362; speed: 2 direction: 12
        .byte #< -424; speed: 2 direction: 13
        .byte #< -472; speed: 2 direction: 14
        .byte #< -502; speed: 2 direction: 15
        .byte #< -512; speed: 2 direction: 16
        .byte #< -502; speed: 2 direction: 17
        .byte #< -472; speed: 2 direction: 18
        .byte #< -424; speed: 2 direction: 19
        .byte #< -362; speed: 2 direction: 20
        .byte #< -284; speed: 2 direction: 21
        .byte #< -194; speed: 2 direction: 22
        .byte #<  -98; speed: 2 direction: 23
        .byte #<    0; speed: 2 direction: 24
        .byte #<   98; speed: 2 direction: 25
        .byte #<  194; speed: 2 direction: 26
        .byte #<  284; speed: 2 direction: 27
        .byte #<  362; speed: 2 direction: 28
        .byte #<  424; speed: 2 direction: 29
        .byte #<  472; speed: 2 direction: 30
        .byte #<  502; speed: 2 direction: 31
        .byte #<  640; speed: 2.5 direction: 0
        .byte #<  628; speed: 2.5 direction: 1
        .byte #<  590; speed: 2.5 direction: 2
        .byte #<  530; speed: 2.5 direction: 3
        .byte #<  452; speed: 2.5 direction: 4
        .byte #<  355; speed: 2.5 direction: 5
        .byte #<  242; speed: 2.5 direction: 6
        .byte #<  122; speed: 2.5 direction: 7
        .byte #<    0; speed: 2.5 direction: 8
        .byte #< -122; speed: 2.5 direction: 9
        .byte #< -242; speed: 2.5 direction: 10
        .byte #< -355; speed: 2.5 direction: 11
        .byte #< -452; speed: 2.5 direction: 12
        .byte #< -530; speed: 2.5 direction: 13
        .byte #< -590; speed: 2.5 direction: 14
        .byte #< -628; speed: 2.5 direction: 15
        .byte #< -640; speed: 2.5 direction: 16
        .byte #< -628; speed: 2.5 direction: 17
        .byte #< -590; speed: 2.5 direction: 18
        .byte #< -530; speed: 2.5 direction: 19
        .byte #< -452; speed: 2.5 direction: 20
        .byte #< -355; speed: 2.5 direction: 21
        .byte #< -242; speed: 2.5 direction: 22
        .byte #< -122; speed: 2.5 direction: 23
        .byte #<    0; speed: 2.5 direction: 24
        .byte #<  122; speed: 2.5 direction: 25
        .byte #<  242; speed: 2.5 direction: 26
        .byte #<  355; speed: 2.5 direction: 27
        .byte #<  452; speed: 2.5 direction: 28
        .byte #<  530; speed: 2.5 direction: 29
        .byte #<  590; speed: 2.5 direction: 30
        .byte #<  628; speed: 2.5 direction: 31
        .byte #<  768; speed: 3 direction: 0
        .byte #<  753; speed: 3 direction: 1
        .byte #<  708; speed: 3 direction: 2
        .byte #<  636; speed: 3 direction: 3
        .byte #<  543; speed: 3 direction: 4
        .byte #<  426; speed: 3 direction: 5
        .byte #<  291; speed: 3 direction: 6
        .byte #<  147; speed: 3 direction: 7
        .byte #<    0; speed: 3 direction: 8
        .byte #< -147; speed: 3 direction: 9
        .byte #< -291; speed: 3 direction: 10
        .byte #< -426; speed: 3 direction: 11
        .byte #< -543; speed: 3 direction: 12
        .byte #< -636; speed: 3 direction: 13
        .byte #< -708; speed: 3 direction: 14
        .byte #< -753; speed: 3 direction: 15
        .byte #< -768; speed: 3 direction: 16
        .byte #< -753; speed: 3 direction: 17
        .byte #< -708; speed: 3 direction: 18
        .byte #< -636; speed: 3 direction: 19
        .byte #< -543; speed: 3 direction: 20
        .byte #< -426; speed: 3 direction: 21
        .byte #< -291; speed: 3 direction: 22
        .byte #< -147; speed: 3 direction: 23
        .byte #<    0; speed: 3 direction: 24
        .byte #<  147; speed: 3 direction: 25
        .byte #<  291; speed: 3 direction: 26
        .byte #<  426; speed: 3 direction: 27
        .byte #<  543; speed: 3 direction: 28
        .byte #<  636; speed: 3 direction: 29
        .byte #<  708; speed: 3 direction: 30
        .byte #<  753; speed: 3 direction: 31
        .byte #<  896; speed: 3.5 direction: 0
        .byte #<  878; speed: 3.5 direction: 1
        .byte #<  826; speed: 3.5 direction: 2
        .byte #<  742; speed: 3.5 direction: 3
        .byte #<  634; speed: 3.5 direction: 4
        .byte #<  497; speed: 3.5 direction: 5
        .byte #<  340; speed: 3.5 direction: 6
        .byte #<  172; speed: 3.5 direction: 7
        .byte #<    0; speed: 3.5 direction: 8
        .byte #< -172; speed: 3.5 direction: 9
        .byte #< -340; speed: 3.5 direction: 10
        .byte #< -497; speed: 3.5 direction: 11
        .byte #< -634; speed: 3.5 direction: 12
        .byte #< -742; speed: 3.5 direction: 13
        .byte #< -826; speed: 3.5 direction: 14
        .byte #< -878; speed: 3.5 direction: 15
        .byte #< -896; speed: 3.5 direction: 16
        .byte #< -878; speed: 3.5 direction: 17
        .byte #< -826; speed: 3.5 direction: 18
        .byte #< -742; speed: 3.5 direction: 19
        .byte #< -634; speed: 3.5 direction: 20
        .byte #< -497; speed: 3.5 direction: 21
        .byte #< -340; speed: 3.5 direction: 22
        .byte #< -172; speed: 3.5 direction: 23
        .byte #<    0; speed: 3.5 direction: 24
        .byte #<  172; speed: 3.5 direction: 25
        .byte #<  340; speed: 3.5 direction: 26
        .byte #<  497; speed: 3.5 direction: 27
        .byte #<  634; speed: 3.5 direction: 28
        .byte #<  742; speed: 3.5 direction: 29
        .byte #<  826; speed: 3.5 direction: 30
        .byte #<  878; speed: 3.5 direction: 31
 ELSE
 ; PAL speed/direction tables

BALLxHigh
        .byte #>    0; speed: 0 direction: 0
        .byte #>    0; speed: 0 direction: 1
        .byte #>    0; speed: 0 direction: 2
        .byte #>    0; speed: 0 direction: 3
        .byte #>    0; speed: 0 direction: 4
        .byte #>    0; speed: 0 direction: 5
        .byte #>    0; speed: 0 direction: 6
        .byte #>    0; speed: 0 direction: 7
        .byte #>    0; speed: 0 direction: 8
        .byte #>    0; speed: 0 direction: 9
        .byte #>    0; speed: 0 direction: 10
        .byte #>    0; speed: 0 direction: 11
        .byte #>    0; speed: 0 direction: 12
        .byte #>    0; speed: 0 direction: 13
        .byte #>    0; speed: 0 direction: 14
        .byte #>    0; speed: 0 direction: 15
        .byte #>    0; speed: 0 direction: 16
        .byte #>    0; speed: 0 direction: 17
        .byte #>    0; speed: 0 direction: 18
        .byte #>    0; speed: 0 direction: 19
        .byte #>    0; speed: 0 direction: 20
        .byte #>    0; speed: 0 direction: 21
        .byte #>    0; speed: 0 direction: 22
        .byte #>    0; speed: 0 direction: 23
        .byte #>    0; speed: 0 direction: 24
        .byte #>    0; speed: 0 direction: 25
        .byte #>    0; speed: 0 direction: 26
        .byte #>    0; speed: 0 direction: 27
        .byte #>    0; speed: 0 direction: 28
        .byte #>    0; speed: 0 direction: 29
        .byte #>    0; speed: 0 direction: 30
        .byte #>    0; speed: 0 direction: 31
        .byte #>    0; speed: 0.5 direction: 0
        .byte #>   38; speed: 0.5 direction: 1
        .byte #>   76; speed: 0.5 direction: 2
        .byte #>  110; speed: 0.5 direction: 3
        .byte #>  141; speed: 0.5 direction: 4
        .byte #>  166; speed: 0.5 direction: 5
        .byte #>  184; speed: 0.5 direction: 6
        .byte #>  196; speed: 0.5 direction: 7
        .byte #>  199; speed: 0.5 direction: 8
        .byte #>  196; speed: 0.5 direction: 9
        .byte #>  184; speed: 0.5 direction: 10
        .byte #>  166; speed: 0.5 direction: 11
        .byte #>  141; speed: 0.5 direction: 12
        .byte #>  110; speed: 0.5 direction: 13
        .byte #>   76; speed: 0.5 direction: 14
        .byte #>   38; speed: 0.5 direction: 15
        .byte #>    0; speed: 0.5 direction: 16
        .byte #>  -38; speed: 0.5 direction: 17
        .byte #>  -76; speed: 0.5 direction: 18
        .byte #> -110; speed: 0.5 direction: 19
        .byte #> -141; speed: 0.5 direction: 20
        .byte #> -166; speed: 0.5 direction: 21
        .byte #> -184; speed: 0.5 direction: 22
        .byte #> -196; speed: 0.5 direction: 23
        .byte #> -199; speed: 0.5 direction: 24
        .byte #> -196; speed: 0.5 direction: 25
        .byte #> -184; speed: 0.5 direction: 26
        .byte #> -166; speed: 0.5 direction: 27
        .byte #> -141; speed: 0.5 direction: 28
        .byte #> -110; speed: 0.5 direction: 29
        .byte #>  -76; speed: 0.5 direction: 30
        .byte #>  -38; speed: 0.5 direction: 31
        .byte #>    0; speed: 1 direction: 0
        .byte #>   77; speed: 1 direction: 1
        .byte #>  152; speed: 1 direction: 2
        .byte #>  221; speed: 1 direction: 3
        .byte #>  282; speed: 1 direction: 4
        .byte #>  331; speed: 1 direction: 5
        .byte #>  368; speed: 1 direction: 6
        .byte #>  391; speed: 1 direction: 7
        .byte #>  398; speed: 1 direction: 8
        .byte #>  391; speed: 1 direction: 9
        .byte #>  368; speed: 1 direction: 10
        .byte #>  331; speed: 1 direction: 11
        .byte #>  282; speed: 1 direction: 12
        .byte #>  221; speed: 1 direction: 13
        .byte #>  152; speed: 1 direction: 14
        .byte #>   77; speed: 1 direction: 15
        .byte #>    0; speed: 1 direction: 16
        .byte #>  -77; speed: 1 direction: 17
        .byte #> -152; speed: 1 direction: 18
        .byte #> -221; speed: 1 direction: 19
        .byte #> -282; speed: 1 direction: 20
        .byte #> -331; speed: 1 direction: 21
        .byte #> -368; speed: 1 direction: 22
        .byte #> -391; speed: 1 direction: 23
        .byte #> -398; speed: 1 direction: 24
        .byte #> -391; speed: 1 direction: 25
        .byte #> -368; speed: 1 direction: 26
        .byte #> -331; speed: 1 direction: 27
        .byte #> -282; speed: 1 direction: 28
        .byte #> -221; speed: 1 direction: 29
        .byte #> -152; speed: 1 direction: 30
        .byte #>  -77; speed: 1 direction: 31
        .byte #>    0; speed: 1.5 direction: 0
        .byte #>  115; speed: 1.5 direction: 1
        .byte #>  229; speed: 1.5 direction: 2
        .byte #>  331; speed: 1.5 direction: 3
        .byte #>  423; speed: 1.5 direction: 4
        .byte #>  497; speed: 1.5 direction: 5
        .byte #>  553; speed: 1.5 direction: 6
        .byte #>  587; speed: 1.5 direction: 7
        .byte #>  598; speed: 1.5 direction: 8
        .byte #>  587; speed: 1.5 direction: 9
        .byte #>  553; speed: 1.5 direction: 10
        .byte #>  497; speed: 1.5 direction: 11
        .byte #>  423; speed: 1.5 direction: 12
        .byte #>  331; speed: 1.5 direction: 13
        .byte #>  229; speed: 1.5 direction: 14
        .byte #>  115; speed: 1.5 direction: 15
        .byte #>    0; speed: 1.5 direction: 16
        .byte #> -115; speed: 1.5 direction: 17
        .byte #> -229; speed: 1.5 direction: 18
        .byte #> -331; speed: 1.5 direction: 19
        .byte #> -423; speed: 1.5 direction: 20
        .byte #> -497; speed: 1.5 direction: 21
        .byte #> -553; speed: 1.5 direction: 22
        .byte #> -587; speed: 1.5 direction: 23
        .byte #> -598; speed: 1.5 direction: 24
        .byte #> -587; speed: 1.5 direction: 25
        .byte #> -553; speed: 1.5 direction: 26
        .byte #> -497; speed: 1.5 direction: 27
        .byte #> -423; speed: 1.5 direction: 28
        .byte #> -331; speed: 1.5 direction: 29
        .byte #> -229; speed: 1.5 direction: 30
        .byte #> -115; speed: 1.5 direction: 31
        .byte #>    0; speed: 2 direction: 0
        .byte #>  154; speed: 2 direction: 1
        .byte #>  305; speed: 2 direction: 2
        .byte #>  442; speed: 2 direction: 3
        .byte #>  564; speed: 2 direction: 4
        .byte #>  662; speed: 2 direction: 5
        .byte #>  737; speed: 2 direction: 6
        .byte #>  782; speed: 2 direction: 7
        .byte #>  797; speed: 2 direction: 8
        .byte #>  782; speed: 2 direction: 9
        .byte #>  737; speed: 2 direction: 10
        .byte #>  662; speed: 2 direction: 11
        .byte #>  564; speed: 2 direction: 12
        .byte #>  442; speed: 2 direction: 13
        .byte #>  305; speed: 2 direction: 14
        .byte #>  154; speed: 2 direction: 15
        .byte #>    0; speed: 2 direction: 16
        .byte #> -154; speed: 2 direction: 17
        .byte #> -305; speed: 2 direction: 18
        .byte #> -442; speed: 2 direction: 19
        .byte #> -564; speed: 2 direction: 20
        .byte #> -662; speed: 2 direction: 21
        .byte #> -737; speed: 2 direction: 22
        .byte #> -782; speed: 2 direction: 23
        .byte #> -797; speed: 2 direction: 24
        .byte #> -782; speed: 2 direction: 25
        .byte #> -737; speed: 2 direction: 26
        .byte #> -662; speed: 2 direction: 27
        .byte #> -564; speed: 2 direction: 28
        .byte #> -442; speed: 2 direction: 29
        .byte #> -305; speed: 2 direction: 30
        .byte #> -154; speed: 2 direction: 31
        .byte #>    0; speed: 2.5 direction: 0
        .byte #>  192; speed: 2.5 direction: 1
        .byte #>  381; speed: 2.5 direction: 2
        .byte #>  552; speed: 2.5 direction: 3
        .byte #>  705; speed: 2.5 direction: 4
        .byte #>  828; speed: 2.5 direction: 5
        .byte #>  921; speed: 2.5 direction: 6
        .byte #>  978; speed: 2.5 direction: 7
        .byte #>  996; speed: 2.5 direction: 8
        .byte #>  978; speed: 2.5 direction: 9
        .byte #>  921; speed: 2.5 direction: 10
        .byte #>  828; speed: 2.5 direction: 11
        .byte #>  705; speed: 2.5 direction: 12
        .byte #>  552; speed: 2.5 direction: 13
        .byte #>  381; speed: 2.5 direction: 14
        .byte #>  192; speed: 2.5 direction: 15
        .byte #>    0; speed: 2.5 direction: 16
        .byte #> -192; speed: 2.5 direction: 17
        .byte #> -381; speed: 2.5 direction: 18
        .byte #> -552; speed: 2.5 direction: 19
        .byte #> -705; speed: 2.5 direction: 20
        .byte #> -828; speed: 2.5 direction: 21
        .byte #> -921; speed: 2.5 direction: 22
        .byte #> -978; speed: 2.5 direction: 23
        .byte #> -996; speed: 2.5 direction: 24
        .byte #> -978; speed: 2.5 direction: 25
        .byte #> -921; speed: 2.5 direction: 26
        .byte #> -828; speed: 2.5 direction: 27
        .byte #> -705; speed: 2.5 direction: 28
        .byte #> -552; speed: 2.5 direction: 29
        .byte #> -381; speed: 2.5 direction: 30
        .byte #> -192; speed: 2.5 direction: 31
        .byte #>    0; speed: 3 direction: 0
        .byte #>  230; speed: 3 direction: 1
        .byte #>  457; speed: 3 direction: 2
        .byte #>  662; speed: 3 direction: 3
        .byte #>  846; speed: 3 direction: 4
        .byte #>  994; speed: 3 direction: 5
        .byte #> 1105; speed: 3 direction: 6
        .byte #> 1174; speed: 3 direction: 7
        .byte #> 1195; speed: 3 direction: 8
        .byte #> 1174; speed: 3 direction: 9
        .byte #> 1105; speed: 3 direction: 10
        .byte #>  994; speed: 3 direction: 11
        .byte #>  846; speed: 3 direction: 12
        .byte #>  662; speed: 3 direction: 13
        .byte #>  457; speed: 3 direction: 14
        .byte #>  230; speed: 3 direction: 15
        .byte #>    0; speed: 3 direction: 16
        .byte #> -230; speed: 3 direction: 17
        .byte #> -457; speed: 3 direction: 18
        .byte #> -662; speed: 3 direction: 19
        .byte #> -846; speed: 3 direction: 20
        .byte #> -994; speed: 3 direction: 21
        .byte #>-1105; speed: 3 direction: 22
        .byte #>-1174; speed: 3 direction: 23
        .byte #>-1195; speed: 3 direction: 24
        .byte #>-1174; speed: 3 direction: 25
        .byte #>-1105; speed: 3 direction: 26
        .byte #> -994; speed: 3 direction: 27
        .byte #> -846; speed: 3 direction: 28
        .byte #> -662; speed: 3 direction: 29
        .byte #> -457; speed: 3 direction: 30
        .byte #> -230; speed: 3 direction: 31
        .byte #>    0; speed: 3.5 direction: 0
        .byte #>  269; speed: 3.5 direction: 1
        .byte #>  533; speed: 3.5 direction: 2
        .byte #>  773; speed: 3.5 direction: 3
        .byte #>  987; speed: 3.5 direction: 4
        .byte #> 1159; speed: 3.5 direction: 5
        .byte #> 1289; speed: 3.5 direction: 6
        .byte #> 1369; speed: 3.5 direction: 7
        .byte #> 1394; speed: 3.5 direction: 8
        .byte #> 1369; speed: 3.5 direction: 9
        .byte #> 1289; speed: 3.5 direction: 10
        .byte #> 1159; speed: 3.5 direction: 11
        .byte #>  987; speed: 3.5 direction: 12
        .byte #>  773; speed: 3.5 direction: 13
        .byte #>  533; speed: 3.5 direction: 14
        .byte #>  269; speed: 3.5 direction: 15
        .byte #>    0; speed: 3.5 direction: 16
        .byte #> -269; speed: 3.5 direction: 17
        .byte #> -533; speed: 3.5 direction: 18
        .byte #> -773; speed: 3.5 direction: 19
        .byte #> -987; speed: 3.5 direction: 20
        .byte #>-1159; speed: 3.5 direction: 21
        .byte #>-1289; speed: 3.5 direction: 22
        .byte #>-1369; speed: 3.5 direction: 23
        .byte #>-1394; speed: 3.5 direction: 24
        .byte #>-1369; speed: 3.5 direction: 25
        .byte #>-1289; speed: 3.5 direction: 26
        .byte #>-1159; speed: 3.5 direction: 27
        .byte #> -987; speed: 3.5 direction: 28
        .byte #> -773; speed: 3.5 direction: 29
        .byte #> -533; speed: 3.5 direction: 30
        .byte #> -269; speed: 3.5 direction: 31

BALLxLow
        .byte #<    0; speed: 0 direction: 0
        .byte #<    0; speed: 0 direction: 1
        .byte #<    0; speed: 0 direction: 2
        .byte #<    0; speed: 0 direction: 3
        .byte #<    0; speed: 0 direction: 4
        .byte #<    0; speed: 0 direction: 5
        .byte #<    0; speed: 0 direction: 6
        .byte #<    0; speed: 0 direction: 7
        .byte #<    0; speed: 0 direction: 8
        .byte #<    0; speed: 0 direction: 9
        .byte #<    0; speed: 0 direction: 10
        .byte #<    0; speed: 0 direction: 11
        .byte #<    0; speed: 0 direction: 12
        .byte #<    0; speed: 0 direction: 13
        .byte #<    0; speed: 0 direction: 14
        .byte #<    0; speed: 0 direction: 15
        .byte #<    0; speed: 0 direction: 16
        .byte #<    0; speed: 0 direction: 17
        .byte #<    0; speed: 0 direction: 18
        .byte #<    0; speed: 0 direction: 19
        .byte #<    0; speed: 0 direction: 20
        .byte #<    0; speed: 0 direction: 21
        .byte #<    0; speed: 0 direction: 22
        .byte #<    0; speed: 0 direction: 23
        .byte #<    0; speed: 0 direction: 24
        .byte #<    0; speed: 0 direction: 25
        .byte #<    0; speed: 0 direction: 26
        .byte #<    0; speed: 0 direction: 27
        .byte #<    0; speed: 0 direction: 28
        .byte #<    0; speed: 0 direction: 29
        .byte #<    0; speed: 0 direction: 30
        .byte #<    0; speed: 0 direction: 31
        .byte #<    0; speed: 0.5 direction: 0
        .byte #<   38; speed: 0.5 direction: 1
        .byte #<   76; speed: 0.5 direction: 2
        .byte #<  110; speed: 0.5 direction: 3
        .byte #<  141; speed: 0.5 direction: 4
        .byte #<  166; speed: 0.5 direction: 5
        .byte #<  184; speed: 0.5 direction: 6
        .byte #<  196; speed: 0.5 direction: 7
        .byte #<  199; speed: 0.5 direction: 8
        .byte #<  196; speed: 0.5 direction: 9
        .byte #<  184; speed: 0.5 direction: 10
        .byte #<  166; speed: 0.5 direction: 11
        .byte #<  141; speed: 0.5 direction: 12
        .byte #<  110; speed: 0.5 direction: 13
        .byte #<   76; speed: 0.5 direction: 14
        .byte #<   38; speed: 0.5 direction: 15
        .byte #<    0; speed: 0.5 direction: 16
        .byte #<  -38; speed: 0.5 direction: 17
        .byte #<  -76; speed: 0.5 direction: 18
        .byte #< -110; speed: 0.5 direction: 19
        .byte #< -141; speed: 0.5 direction: 20
        .byte #< -166; speed: 0.5 direction: 21
        .byte #< -184; speed: 0.5 direction: 22
        .byte #< -196; speed: 0.5 direction: 23
        .byte #< -199; speed: 0.5 direction: 24
        .byte #< -196; speed: 0.5 direction: 25
        .byte #< -184; speed: 0.5 direction: 26
        .byte #< -166; speed: 0.5 direction: 27
        .byte #< -141; speed: 0.5 direction: 28
        .byte #< -110; speed: 0.5 direction: 29
        .byte #<  -76; speed: 0.5 direction: 30
        .byte #<  -38; speed: 0.5 direction: 31
        .byte #<    0; speed: 1 direction: 0
        .byte #<   77; speed: 1 direction: 1
        .byte #<  152; speed: 1 direction: 2
        .byte #<  221; speed: 1 direction: 3
        .byte #<  282; speed: 1 direction: 4
        .byte #<  331; speed: 1 direction: 5
        .byte #<  368; speed: 1 direction: 6
        .byte #<  391; speed: 1 direction: 7
        .byte #<  398; speed: 1 direction: 8
        .byte #<  391; speed: 1 direction: 9
        .byte #<  368; speed: 1 direction: 10
        .byte #<  331; speed: 1 direction: 11
        .byte #<  282; speed: 1 direction: 12
        .byte #<  221; speed: 1 direction: 13
        .byte #<  152; speed: 1 direction: 14
        .byte #<   77; speed: 1 direction: 15
        .byte #<    0; speed: 1 direction: 16
        .byte #<  -77; speed: 1 direction: 17
        .byte #< -152; speed: 1 direction: 18
        .byte #< -221; speed: 1 direction: 19
        .byte #< -282; speed: 1 direction: 20
        .byte #< -331; speed: 1 direction: 21
        .byte #< -368; speed: 1 direction: 22
        .byte #< -391; speed: 1 direction: 23
        .byte #< -398; speed: 1 direction: 24
        .byte #< -391; speed: 1 direction: 25
        .byte #< -368; speed: 1 direction: 26
        .byte #< -331; speed: 1 direction: 27
        .byte #< -282; speed: 1 direction: 28
        .byte #< -221; speed: 1 direction: 29
        .byte #< -152; speed: 1 direction: 30
        .byte #<  -77; speed: 1 direction: 31
        .byte #<    0; speed: 1.5 direction: 0
        .byte #<  115; speed: 1.5 direction: 1
        .byte #<  229; speed: 1.5 direction: 2
        .byte #<  331; speed: 1.5 direction: 3
        .byte #<  423; speed: 1.5 direction: 4
        .byte #<  497; speed: 1.5 direction: 5
        .byte #<  553; speed: 1.5 direction: 6
        .byte #<  587; speed: 1.5 direction: 7
        .byte #<  598; speed: 1.5 direction: 8
        .byte #<  587; speed: 1.5 direction: 9
        .byte #<  553; speed: 1.5 direction: 10
        .byte #<  497; speed: 1.5 direction: 11
        .byte #<  423; speed: 1.5 direction: 12
        .byte #<  331; speed: 1.5 direction: 13
        .byte #<  229; speed: 1.5 direction: 14
        .byte #<  115; speed: 1.5 direction: 15
        .byte #<    0; speed: 1.5 direction: 16
        .byte #< -115; speed: 1.5 direction: 17
        .byte #< -229; speed: 1.5 direction: 18
        .byte #< -331; speed: 1.5 direction: 19
        .byte #< -423; speed: 1.5 direction: 20
        .byte #< -497; speed: 1.5 direction: 21
        .byte #< -553; speed: 1.5 direction: 22
        .byte #< -587; speed: 1.5 direction: 23
        .byte #< -598; speed: 1.5 direction: 24
        .byte #< -587; speed: 1.5 direction: 25
        .byte #< -553; speed: 1.5 direction: 26
        .byte #< -497; speed: 1.5 direction: 27
        .byte #< -423; speed: 1.5 direction: 28
        .byte #< -331; speed: 1.5 direction: 29
        .byte #< -229; speed: 1.5 direction: 30
        .byte #< -115; speed: 1.5 direction: 31
        .byte #<    0; speed: 2 direction: 0
        .byte #<  154; speed: 2 direction: 1
        .byte #<  305; speed: 2 direction: 2
        .byte #<  442; speed: 2 direction: 3
        .byte #<  564; speed: 2 direction: 4
        .byte #<  662; speed: 2 direction: 5
        .byte #<  737; speed: 2 direction: 6
        .byte #<  782; speed: 2 direction: 7
        .byte #<  797; speed: 2 direction: 8
        .byte #<  782; speed: 2 direction: 9
        .byte #<  737; speed: 2 direction: 10
        .byte #<  662; speed: 2 direction: 11
        .byte #<  564; speed: 2 direction: 12
        .byte #<  442; speed: 2 direction: 13
        .byte #<  305; speed: 2 direction: 14
        .byte #<  154; speed: 2 direction: 15
        .byte #<    0; speed: 2 direction: 16
        .byte #< -154; speed: 2 direction: 17
        .byte #< -305; speed: 2 direction: 18
        .byte #< -442; speed: 2 direction: 19
        .byte #< -564; speed: 2 direction: 20
        .byte #< -662; speed: 2 direction: 21
        .byte #< -737; speed: 2 direction: 22
        .byte #< -782; speed: 2 direction: 23
        .byte #< -797; speed: 2 direction: 24
        .byte #< -782; speed: 2 direction: 25
        .byte #< -737; speed: 2 direction: 26
        .byte #< -662; speed: 2 direction: 27
        .byte #< -564; speed: 2 direction: 28
        .byte #< -442; speed: 2 direction: 29
        .byte #< -305; speed: 2 direction: 30
        .byte #< -154; speed: 2 direction: 31
        .byte #<    0; speed: 2.5 direction: 0
        .byte #<  192; speed: 2.5 direction: 1
        .byte #<  381; speed: 2.5 direction: 2
        .byte #<  552; speed: 2.5 direction: 3
        .byte #<  705; speed: 2.5 direction: 4
        .byte #<  828; speed: 2.5 direction: 5
        .byte #<  921; speed: 2.5 direction: 6
        .byte #<  978; speed: 2.5 direction: 7
        .byte #<  996; speed: 2.5 direction: 8
        .byte #<  978; speed: 2.5 direction: 9
        .byte #<  921; speed: 2.5 direction: 10
        .byte #<  828; speed: 2.5 direction: 11
        .byte #<  705; speed: 2.5 direction: 12
        .byte #<  552; speed: 2.5 direction: 13
        .byte #<  381; speed: 2.5 direction: 14
        .byte #<  192; speed: 2.5 direction: 15
        .byte #<    0; speed: 2.5 direction: 16
        .byte #< -192; speed: 2.5 direction: 17
        .byte #< -381; speed: 2.5 direction: 18
        .byte #< -552; speed: 2.5 direction: 19
        .byte #< -705; speed: 2.5 direction: 20
        .byte #< -828; speed: 2.5 direction: 21
        .byte #< -921; speed: 2.5 direction: 22
        .byte #< -978; speed: 2.5 direction: 23
        .byte #< -996; speed: 2.5 direction: 24
        .byte #< -978; speed: 2.5 direction: 25
        .byte #< -921; speed: 2.5 direction: 26
        .byte #< -828; speed: 2.5 direction: 27
        .byte #< -705; speed: 2.5 direction: 28
        .byte #< -552; speed: 2.5 direction: 29
        .byte #< -381; speed: 2.5 direction: 30
        .byte #< -192; speed: 2.5 direction: 31
        .byte #<    0; speed: 3 direction: 0
        .byte #<  230; speed: 3 direction: 1
        .byte #<  457; speed: 3 direction: 2
        .byte #<  662; speed: 3 direction: 3
        .byte #<  846; speed: 3 direction: 4
        .byte #<  994; speed: 3 direction: 5
        .byte #< 1105; speed: 3 direction: 6
        .byte #< 1174; speed: 3 direction: 7
        .byte #< 1195; speed: 3 direction: 8
        .byte #< 1174; speed: 3 direction: 9
        .byte #< 1105; speed: 3 direction: 10
        .byte #<  994; speed: 3 direction: 11
        .byte #<  846; speed: 3 direction: 12
        .byte #<  662; speed: 3 direction: 13
        .byte #<  457; speed: 3 direction: 14
        .byte #<  230; speed: 3 direction: 15
        .byte #<    0; speed: 3 direction: 16
        .byte #< -230; speed: 3 direction: 17
        .byte #< -457; speed: 3 direction: 18
        .byte #< -662; speed: 3 direction: 19
        .byte #< -846; speed: 3 direction: 20
        .byte #< -994; speed: 3 direction: 21
        .byte #<-1105; speed: 3 direction: 22
        .byte #<-1174; speed: 3 direction: 23
        .byte #<-1195; speed: 3 direction: 24
        .byte #<-1174; speed: 3 direction: 25
        .byte #<-1105; speed: 3 direction: 26
        .byte #< -994; speed: 3 direction: 27
        .byte #< -846; speed: 3 direction: 28
        .byte #< -662; speed: 3 direction: 29
        .byte #< -457; speed: 3 direction: 30
        .byte #< -230; speed: 3 direction: 31
        .byte #<    0; speed: 3.5 direction: 0
        .byte #<  269; speed: 3.5 direction: 1
        .byte #<  533; speed: 3.5 direction: 2
        .byte #<  773; speed: 3.5 direction: 3
        .byte #<  987; speed: 3.5 direction: 4
        .byte #< 1159; speed: 3.5 direction: 5
        .byte #< 1289; speed: 3.5 direction: 6
        .byte #< 1369; speed: 3.5 direction: 7
        .byte #< 1394; speed: 3.5 direction: 8
        .byte #< 1369; speed: 3.5 direction: 9
        .byte #< 1289; speed: 3.5 direction: 10
        .byte #< 1159; speed: 3.5 direction: 11
        .byte #<  987; speed: 3.5 direction: 12
        .byte #<  773; speed: 3.5 direction: 13
        .byte #<  533; speed: 3.5 direction: 14
        .byte #<  269; speed: 3.5 direction: 15
        .byte #<    0; speed: 3.5 direction: 16
        .byte #< -269; speed: 3.5 direction: 17
        .byte #< -533; speed: 3.5 direction: 18
        .byte #< -773; speed: 3.5 direction: 19
        .byte #< -987; speed: 3.5 direction: 20
        .byte #<-1159; speed: 3.5 direction: 21
        .byte #<-1289; speed: 3.5 direction: 22
        .byte #<-1369; speed: 3.5 direction: 23
        .byte #<-1394; speed: 3.5 direction: 24
        .byte #<-1369; speed: 3.5 direction: 25
        .byte #<-1289; speed: 3.5 direction: 26
        .byte #<-1159; speed: 3.5 direction: 27
        .byte #< -987; speed: 3.5 direction: 28
        .byte #< -773; speed: 3.5 direction: 29
        .byte #< -533; speed: 3.5 direction: 30
        .byte #< -269; speed: 3.5 direction: 31

BALLyHigh
        .byte #>    0; speed: 0 direction: 0
        .byte #>    0; speed: 0 direction: 1
        .byte #>    0; speed: 0 direction: 2
        .byte #>    0; speed: 0 direction: 3
        .byte #>    0; speed: 0 direction: 4
        .byte #>    0; speed: 0 direction: 5
        .byte #>    0; speed: 0 direction: 6
        .byte #>    0; speed: 0 direction: 7
        .byte #>    0; speed: 0 direction: 8
        .byte #>    0; speed: 0 direction: 9
        .byte #>    0; speed: 0 direction: 10
        .byte #>    0; speed: 0 direction: 11
        .byte #>    0; speed: 0 direction: 12
        .byte #>    0; speed: 0 direction: 13
        .byte #>    0; speed: 0 direction: 14
        .byte #>    0; speed: 0 direction: 15
        .byte #>    0; speed: 0 direction: 16
        .byte #>    0; speed: 0 direction: 17
        .byte #>    0; speed: 0 direction: 18
        .byte #>    0; speed: 0 direction: 19
        .byte #>    0; speed: 0 direction: 20
        .byte #>    0; speed: 0 direction: 21
        .byte #>    0; speed: 0 direction: 22
        .byte #>    0; speed: 0 direction: 23
        .byte #>    0; speed: 0 direction: 24
        .byte #>    0; speed: 0 direction: 25
        .byte #>    0; speed: 0 direction: 26
        .byte #>    0; speed: 0 direction: 27
        .byte #>    0; speed: 0 direction: 28
        .byte #>    0; speed: 0 direction: 29
        .byte #>    0; speed: 0 direction: 30
        .byte #>    0; speed: 0 direction: 31
        .byte #>  154; speed: 0.5 direction: 0
        .byte #>  151; speed: 0.5 direction: 1
        .byte #>  142; speed: 0.5 direction: 2
        .byte #>  127; speed: 0.5 direction: 3
        .byte #>  109; speed: 0.5 direction: 4
        .byte #>   85; speed: 0.5 direction: 5
        .byte #>   58; speed: 0.5 direction: 6
        .byte #>   29; speed: 0.5 direction: 7
        .byte #>    0; speed: 0.5 direction: 8
        .byte #>  -29; speed: 0.5 direction: 9
        .byte #>  -58; speed: 0.5 direction: 10
        .byte #>  -85; speed: 0.5 direction: 11
        .byte #> -109; speed: 0.5 direction: 12
        .byte #> -127; speed: 0.5 direction: 13
        .byte #> -142; speed: 0.5 direction: 14
        .byte #> -151; speed: 0.5 direction: 15
        .byte #> -154; speed: 0.5 direction: 16
        .byte #> -151; speed: 0.5 direction: 17
        .byte #> -142; speed: 0.5 direction: 18
        .byte #> -127; speed: 0.5 direction: 19
        .byte #> -109; speed: 0.5 direction: 20
        .byte #>  -85; speed: 0.5 direction: 21
        .byte #>  -58; speed: 0.5 direction: 22
        .byte #>  -29; speed: 0.5 direction: 23
        .byte #>    0; speed: 0.5 direction: 24
        .byte #>   29; speed: 0.5 direction: 25
        .byte #>   58; speed: 0.5 direction: 26
        .byte #>   85; speed: 0.5 direction: 27
        .byte #>  109; speed: 0.5 direction: 28
        .byte #>  127; speed: 0.5 direction: 29
        .byte #>  142; speed: 0.5 direction: 30
        .byte #>  151; speed: 0.5 direction: 31
        .byte #>  307; speed: 1 direction: 0
        .byte #>  301; speed: 1 direction: 1
        .byte #>  283; speed: 1 direction: 2
        .byte #>  254; speed: 1 direction: 3
        .byte #>  217; speed: 1 direction: 4
        .byte #>  170; speed: 1 direction: 5
        .byte #>  116; speed: 1 direction: 6
        .byte #>   59; speed: 1 direction: 7
        .byte #>    0; speed: 1 direction: 8
        .byte #>  -59; speed: 1 direction: 9
        .byte #> -116; speed: 1 direction: 10
        .byte #> -170; speed: 1 direction: 11
        .byte #> -217; speed: 1 direction: 12
        .byte #> -254; speed: 1 direction: 13
        .byte #> -283; speed: 1 direction: 14
        .byte #> -301; speed: 1 direction: 15
        .byte #> -307; speed: 1 direction: 16
        .byte #> -301; speed: 1 direction: 17
        .byte #> -283; speed: 1 direction: 18
        .byte #> -254; speed: 1 direction: 19
        .byte #> -217; speed: 1 direction: 20
        .byte #> -170; speed: 1 direction: 21
        .byte #> -116; speed: 1 direction: 22
        .byte #>  -59; speed: 1 direction: 23
        .byte #>    0; speed: 1 direction: 24
        .byte #>   59; speed: 1 direction: 25
        .byte #>  116; speed: 1 direction: 26
        .byte #>  170; speed: 1 direction: 27
        .byte #>  217; speed: 1 direction: 28
        .byte #>  254; speed: 1 direction: 29
        .byte #>  283; speed: 1 direction: 30
        .byte #>  301; speed: 1 direction: 31
        .byte #>  461; speed: 1.5 direction: 0
        .byte #>  452; speed: 1.5 direction: 1
        .byte #>  425; speed: 1.5 direction: 2
        .byte #>  382; speed: 1.5 direction: 3
        .byte #>  326; speed: 1.5 direction: 4
        .byte #>  256; speed: 1.5 direction: 5
        .byte #>  175; speed: 1.5 direction: 6
        .byte #>   88; speed: 1.5 direction: 7
        .byte #>    0; speed: 1.5 direction: 8
        .byte #>  -88; speed: 1.5 direction: 9
        .byte #> -175; speed: 1.5 direction: 10
        .byte #> -256; speed: 1.5 direction: 11
        .byte #> -326; speed: 1.5 direction: 12
        .byte #> -382; speed: 1.5 direction: 13
        .byte #> -425; speed: 1.5 direction: 14
        .byte #> -452; speed: 1.5 direction: 15
        .byte #> -461; speed: 1.5 direction: 16
        .byte #> -452; speed: 1.5 direction: 17
        .byte #> -425; speed: 1.5 direction: 18
        .byte #> -382; speed: 1.5 direction: 19
        .byte #> -326; speed: 1.5 direction: 20
        .byte #> -256; speed: 1.5 direction: 21
        .byte #> -175; speed: 1.5 direction: 22
        .byte #>  -88; speed: 1.5 direction: 23
        .byte #>    0; speed: 1.5 direction: 24
        .byte #>   88; speed: 1.5 direction: 25
        .byte #>  175; speed: 1.5 direction: 26
        .byte #>  256; speed: 1.5 direction: 27
        .byte #>  326; speed: 1.5 direction: 28
        .byte #>  382; speed: 1.5 direction: 29
        .byte #>  425; speed: 1.5 direction: 30
        .byte #>  452; speed: 1.5 direction: 31
        .byte #>  614; speed: 2 direction: 0
        .byte #>  602; speed: 2 direction: 1
        .byte #>  566; speed: 2 direction: 2
        .byte #>  509; speed: 2 direction: 3
        .byte #>  434; speed: 2 direction: 4
        .byte #>  341; speed: 2 direction: 5
        .byte #>  233; speed: 2 direction: 6
        .byte #>  118; speed: 2 direction: 7
        .byte #>    0; speed: 2 direction: 8
        .byte #> -118; speed: 2 direction: 9
        .byte #> -233; speed: 2 direction: 10
        .byte #> -341; speed: 2 direction: 11
        .byte #> -434; speed: 2 direction: 12
        .byte #> -509; speed: 2 direction: 13
        .byte #> -566; speed: 2 direction: 14
        .byte #> -602; speed: 2 direction: 15
        .byte #> -614; speed: 2 direction: 16
        .byte #> -602; speed: 2 direction: 17
        .byte #> -566; speed: 2 direction: 18
        .byte #> -509; speed: 2 direction: 19
        .byte #> -434; speed: 2 direction: 20
        .byte #> -341; speed: 2 direction: 21
        .byte #> -233; speed: 2 direction: 22
        .byte #> -118; speed: 2 direction: 23
        .byte #>    0; speed: 2 direction: 24
        .byte #>  118; speed: 2 direction: 25
        .byte #>  233; speed: 2 direction: 26
        .byte #>  341; speed: 2 direction: 27
        .byte #>  434; speed: 2 direction: 28
        .byte #>  509; speed: 2 direction: 29
        .byte #>  566; speed: 2 direction: 30
        .byte #>  602; speed: 2 direction: 31
        .byte #>  768; speed: 2.5 direction: 0
        .byte #>  753; speed: 2.5 direction: 1
        .byte #>  708; speed: 2.5 direction: 2
        .byte #>  636; speed: 2.5 direction: 3
        .byte #>  543; speed: 2.5 direction: 4
        .byte #>  426; speed: 2.5 direction: 5
        .byte #>  291; speed: 2.5 direction: 6
        .byte #>  147; speed: 2.5 direction: 7
        .byte #>    0; speed: 2.5 direction: 8
        .byte #> -147; speed: 2.5 direction: 9
        .byte #> -291; speed: 2.5 direction: 10
        .byte #> -426; speed: 2.5 direction: 11
        .byte #> -543; speed: 2.5 direction: 12
        .byte #> -636; speed: 2.5 direction: 13
        .byte #> -708; speed: 2.5 direction: 14
        .byte #> -753; speed: 2.5 direction: 15
        .byte #> -768; speed: 2.5 direction: 16
        .byte #> -753; speed: 2.5 direction: 17
        .byte #> -708; speed: 2.5 direction: 18
        .byte #> -636; speed: 2.5 direction: 19
        .byte #> -543; speed: 2.5 direction: 20
        .byte #> -426; speed: 2.5 direction: 21
        .byte #> -291; speed: 2.5 direction: 22
        .byte #> -147; speed: 2.5 direction: 23
        .byte #>    0; speed: 2.5 direction: 24
        .byte #>  147; speed: 2.5 direction: 25
        .byte #>  291; speed: 2.5 direction: 26
        .byte #>  426; speed: 2.5 direction: 27
        .byte #>  543; speed: 2.5 direction: 28
        .byte #>  636; speed: 2.5 direction: 29
        .byte #>  708; speed: 2.5 direction: 30
        .byte #>  753; speed: 2.5 direction: 31
        .byte #>  922; speed: 3 direction: 0
        .byte #>  904; speed: 3 direction: 1
        .byte #>  850; speed: 3 direction: 2
        .byte #>  763; speed: 3 direction: 3
        .byte #>  652; speed: 3 direction: 4
        .byte #>  511; speed: 3 direction: 5
        .byte #>  349; speed: 3 direction: 6
        .byte #>  176; speed: 3 direction: 7
        .byte #>    0; speed: 3 direction: 8
        .byte #> -176; speed: 3 direction: 9
        .byte #> -349; speed: 3 direction: 10
        .byte #> -511; speed: 3 direction: 11
        .byte #> -652; speed: 3 direction: 12
        .byte #> -763; speed: 3 direction: 13
        .byte #> -850; speed: 3 direction: 14
        .byte #> -904; speed: 3 direction: 15
        .byte #> -922; speed: 3 direction: 16
        .byte #> -904; speed: 3 direction: 17
        .byte #> -850; speed: 3 direction: 18
        .byte #> -763; speed: 3 direction: 19
        .byte #> -652; speed: 3 direction: 20
        .byte #> -511; speed: 3 direction: 21
        .byte #> -349; speed: 3 direction: 22
        .byte #> -176; speed: 3 direction: 23
        .byte #>    0; speed: 3 direction: 24
        .byte #>  176; speed: 3 direction: 25
        .byte #>  349; speed: 3 direction: 26
        .byte #>  511; speed: 3 direction: 27
        .byte #>  652; speed: 3 direction: 28
        .byte #>  763; speed: 3 direction: 29
        .byte #>  850; speed: 3 direction: 30
        .byte #>  904; speed: 3 direction: 31
        .byte #> 1075; speed: 3.5 direction: 0
        .byte #> 1054; speed: 3.5 direction: 1
        .byte #>  991; speed: 3.5 direction: 2
        .byte #>  890; speed: 3.5 direction: 3
        .byte #>  760; speed: 3.5 direction: 4
        .byte #>  596; speed: 3.5 direction: 5
        .byte #>  407; speed: 3.5 direction: 6
        .byte #>  206; speed: 3.5 direction: 7
        .byte #>    0; speed: 3.5 direction: 8
        .byte #> -206; speed: 3.5 direction: 9
        .byte #> -407; speed: 3.5 direction: 10
        .byte #> -596; speed: 3.5 direction: 11
        .byte #> -760; speed: 3.5 direction: 12
        .byte #> -890; speed: 3.5 direction: 13
        .byte #> -991; speed: 3.5 direction: 14
        .byte #>-1054; speed: 3.5 direction: 15
        .byte #>-1075; speed: 3.5 direction: 16
        .byte #>-1054; speed: 3.5 direction: 17
        .byte #> -991; speed: 3.5 direction: 18
        .byte #> -890; speed: 3.5 direction: 19
        .byte #> -760; speed: 3.5 direction: 20
        .byte #> -596; speed: 3.5 direction: 21
        .byte #> -407; speed: 3.5 direction: 22
        .byte #> -206; speed: 3.5 direction: 23
        .byte #>    0; speed: 3.5 direction: 24
        .byte #>  206; speed: 3.5 direction: 25
        .byte #>  407; speed: 3.5 direction: 26
        .byte #>  596; speed: 3.5 direction: 27
        .byte #>  760; speed: 3.5 direction: 28
        .byte #>  890; speed: 3.5 direction: 29
        .byte #>  991; speed: 3.5 direction: 30
        .byte #> 1054; speed: 3.5 direction: 31

BALLyLow
        .byte #<    0; speed: 0 direction: 0
        .byte #<    0; speed: 0 direction: 1
        .byte #<    0; speed: 0 direction: 2
        .byte #<    0; speed: 0 direction: 3
        .byte #<    0; speed: 0 direction: 4
        .byte #<    0; speed: 0 direction: 5
        .byte #<    0; speed: 0 direction: 6
        .byte #<    0; speed: 0 direction: 7
        .byte #<    0; speed: 0 direction: 8
        .byte #<    0; speed: 0 direction: 9
        .byte #<    0; speed: 0 direction: 10
        .byte #<    0; speed: 0 direction: 11
        .byte #<    0; speed: 0 direction: 12
        .byte #<    0; speed: 0 direction: 13
        .byte #<    0; speed: 0 direction: 14
        .byte #<    0; speed: 0 direction: 15
        .byte #<    0; speed: 0 direction: 16
        .byte #<    0; speed: 0 direction: 17
        .byte #<    0; speed: 0 direction: 18
        .byte #<    0; speed: 0 direction: 19
        .byte #<    0; speed: 0 direction: 20
        .byte #<    0; speed: 0 direction: 21
        .byte #<    0; speed: 0 direction: 22
        .byte #<    0; speed: 0 direction: 23
        .byte #<    0; speed: 0 direction: 24
        .byte #<    0; speed: 0 direction: 25
        .byte #<    0; speed: 0 direction: 26
        .byte #<    0; speed: 0 direction: 27
        .byte #<    0; speed: 0 direction: 28
        .byte #<    0; speed: 0 direction: 29
        .byte #<    0; speed: 0 direction: 30
        .byte #<    0; speed: 0 direction: 31
        .byte #<  154; speed: 0.5 direction: 0
        .byte #<  151; speed: 0.5 direction: 1
        .byte #<  142; speed: 0.5 direction: 2
        .byte #<  127; speed: 0.5 direction: 3
        .byte #<  109; speed: 0.5 direction: 4
        .byte #<   85; speed: 0.5 direction: 5
        .byte #<   58; speed: 0.5 direction: 6
        .byte #<   29; speed: 0.5 direction: 7
        .byte #<    0; speed: 0.5 direction: 8
        .byte #<  -29; speed: 0.5 direction: 9
        .byte #<  -58; speed: 0.5 direction: 10
        .byte #<  -85; speed: 0.5 direction: 11
        .byte #< -109; speed: 0.5 direction: 12
        .byte #< -127; speed: 0.5 direction: 13
        .byte #< -142; speed: 0.5 direction: 14
        .byte #< -151; speed: 0.5 direction: 15
        .byte #< -154; speed: 0.5 direction: 16
        .byte #< -151; speed: 0.5 direction: 17
        .byte #< -142; speed: 0.5 direction: 18
        .byte #< -127; speed: 0.5 direction: 19
        .byte #< -109; speed: 0.5 direction: 20
        .byte #<  -85; speed: 0.5 direction: 21
        .byte #<  -58; speed: 0.5 direction: 22
        .byte #<  -29; speed: 0.5 direction: 23
        .byte #<    0; speed: 0.5 direction: 24
        .byte #<   29; speed: 0.5 direction: 25
        .byte #<   58; speed: 0.5 direction: 26
        .byte #<   85; speed: 0.5 direction: 27
        .byte #<  109; speed: 0.5 direction: 28
        .byte #<  127; speed: 0.5 direction: 29
        .byte #<  142; speed: 0.5 direction: 30
        .byte #<  151; speed: 0.5 direction: 31
        .byte #<  307; speed: 1 direction: 0
        .byte #<  301; speed: 1 direction: 1
        .byte #<  283; speed: 1 direction: 2
        .byte #<  254; speed: 1 direction: 3
        .byte #<  217; speed: 1 direction: 4
        .byte #<  170; speed: 1 direction: 5
        .byte #<  116; speed: 1 direction: 6
        .byte #<   59; speed: 1 direction: 7
        .byte #<    0; speed: 1 direction: 8
        .byte #<  -59; speed: 1 direction: 9
        .byte #< -116; speed: 1 direction: 10
        .byte #< -170; speed: 1 direction: 11
        .byte #< -217; speed: 1 direction: 12
        .byte #< -254; speed: 1 direction: 13
        .byte #< -283; speed: 1 direction: 14
        .byte #< -301; speed: 1 direction: 15
        .byte #< -307; speed: 1 direction: 16
        .byte #< -301; speed: 1 direction: 17
        .byte #< -283; speed: 1 direction: 18
        .byte #< -254; speed: 1 direction: 19
        .byte #< -217; speed: 1 direction: 20
        .byte #< -170; speed: 1 direction: 21
        .byte #< -116; speed: 1 direction: 22
        .byte #<  -59; speed: 1 direction: 23
        .byte #<    0; speed: 1 direction: 24
        .byte #<   59; speed: 1 direction: 25
        .byte #<  116; speed: 1 direction: 26
        .byte #<  170; speed: 1 direction: 27
        .byte #<  217; speed: 1 direction: 28
        .byte #<  254; speed: 1 direction: 29
        .byte #<  283; speed: 1 direction: 30
        .byte #<  301; speed: 1 direction: 31
        .byte #<  461; speed: 1.5 direction: 0
        .byte #<  452; speed: 1.5 direction: 1
        .byte #<  425; speed: 1.5 direction: 2
        .byte #<  382; speed: 1.5 direction: 3
        .byte #<  326; speed: 1.5 direction: 4
        .byte #<  256; speed: 1.5 direction: 5
        .byte #<  175; speed: 1.5 direction: 6
        .byte #<   88; speed: 1.5 direction: 7
        .byte #<    0; speed: 1.5 direction: 8
        .byte #<  -88; speed: 1.5 direction: 9
        .byte #< -175; speed: 1.5 direction: 10
        .byte #< -256; speed: 1.5 direction: 11
        .byte #< -326; speed: 1.5 direction: 12
        .byte #< -382; speed: 1.5 direction: 13
        .byte #< -425; speed: 1.5 direction: 14
        .byte #< -452; speed: 1.5 direction: 15
        .byte #< -461; speed: 1.5 direction: 16
        .byte #< -452; speed: 1.5 direction: 17
        .byte #< -425; speed: 1.5 direction: 18
        .byte #< -382; speed: 1.5 direction: 19
        .byte #< -326; speed: 1.5 direction: 20
        .byte #< -256; speed: 1.5 direction: 21
        .byte #< -175; speed: 1.5 direction: 22
        .byte #<  -88; speed: 1.5 direction: 23
        .byte #<    0; speed: 1.5 direction: 24
        .byte #<   88; speed: 1.5 direction: 25
        .byte #<  175; speed: 1.5 direction: 26
        .byte #<  256; speed: 1.5 direction: 27
        .byte #<  326; speed: 1.5 direction: 28
        .byte #<  382; speed: 1.5 direction: 29
        .byte #<  425; speed: 1.5 direction: 30
        .byte #<  452; speed: 1.5 direction: 31
        .byte #<  614; speed: 2 direction: 0
        .byte #<  602; speed: 2 direction: 1
        .byte #<  566; speed: 2 direction: 2
        .byte #<  509; speed: 2 direction: 3
        .byte #<  434; speed: 2 direction: 4
        .byte #<  341; speed: 2 direction: 5
        .byte #<  233; speed: 2 direction: 6
        .byte #<  118; speed: 2 direction: 7
        .byte #<    0; speed: 2 direction: 8
        .byte #< -118; speed: 2 direction: 9
        .byte #< -233; speed: 2 direction: 10
        .byte #< -341; speed: 2 direction: 11
        .byte #< -434; speed: 2 direction: 12
        .byte #< -509; speed: 2 direction: 13
        .byte #< -566; speed: 2 direction: 14
        .byte #< -602; speed: 2 direction: 15
        .byte #< -614; speed: 2 direction: 16
        .byte #< -602; speed: 2 direction: 17
        .byte #< -566; speed: 2 direction: 18
        .byte #< -509; speed: 2 direction: 19
        .byte #< -434; speed: 2 direction: 20
        .byte #< -341; speed: 2 direction: 21
        .byte #< -233; speed: 2 direction: 22
        .byte #< -118; speed: 2 direction: 23
        .byte #<    0; speed: 2 direction: 24
        .byte #<  118; speed: 2 direction: 25
        .byte #<  233; speed: 2 direction: 26
        .byte #<  341; speed: 2 direction: 27
        .byte #<  434; speed: 2 direction: 28
        .byte #<  509; speed: 2 direction: 29
        .byte #<  566; speed: 2 direction: 30
        .byte #<  602; speed: 2 direction: 31
        .byte #<  768; speed: 2.5 direction: 0
        .byte #<  753; speed: 2.5 direction: 1
        .byte #<  708; speed: 2.5 direction: 2
        .byte #<  636; speed: 2.5 direction: 3
        .byte #<  543; speed: 2.5 direction: 4
        .byte #<  426; speed: 2.5 direction: 5
        .byte #<  291; speed: 2.5 direction: 6
        .byte #<  147; speed: 2.5 direction: 7
        .byte #<    0; speed: 2.5 direction: 8
        .byte #< -147; speed: 2.5 direction: 9
        .byte #< -291; speed: 2.5 direction: 10
        .byte #< -426; speed: 2.5 direction: 11
        .byte #< -543; speed: 2.5 direction: 12
        .byte #< -636; speed: 2.5 direction: 13
        .byte #< -708; speed: 2.5 direction: 14
        .byte #< -753; speed: 2.5 direction: 15
        .byte #< -768; speed: 2.5 direction: 16
        .byte #< -753; speed: 2.5 direction: 17
        .byte #< -708; speed: 2.5 direction: 18
        .byte #< -636; speed: 2.5 direction: 19
        .byte #< -543; speed: 2.5 direction: 20
        .byte #< -426; speed: 2.5 direction: 21
        .byte #< -291; speed: 2.5 direction: 22
        .byte #< -147; speed: 2.5 direction: 23
        .byte #<    0; speed: 2.5 direction: 24
        .byte #<  147; speed: 2.5 direction: 25
        .byte #<  291; speed: 2.5 direction: 26
        .byte #<  426; speed: 2.5 direction: 27
        .byte #<  543; speed: 2.5 direction: 28
        .byte #<  636; speed: 2.5 direction: 29
        .byte #<  708; speed: 2.5 direction: 30
        .byte #<  753; speed: 2.5 direction: 31
        .byte #<  922; speed: 3 direction: 0
        .byte #<  904; speed: 3 direction: 1
        .byte #<  850; speed: 3 direction: 2
        .byte #<  763; speed: 3 direction: 3
        .byte #<  652; speed: 3 direction: 4
        .byte #<  511; speed: 3 direction: 5
        .byte #<  349; speed: 3 direction: 6
        .byte #<  176; speed: 3 direction: 7
        .byte #<    0; speed: 3 direction: 8
        .byte #< -176; speed: 3 direction: 9
        .byte #< -349; speed: 3 direction: 10
        .byte #< -511; speed: 3 direction: 11
        .byte #< -652; speed: 3 direction: 12
        .byte #< -763; speed: 3 direction: 13
        .byte #< -850; speed: 3 direction: 14
        .byte #< -904; speed: 3 direction: 15
        .byte #< -922; speed: 3 direction: 16
        .byte #< -904; speed: 3 direction: 17
        .byte #< -850; speed: 3 direction: 18
        .byte #< -763; speed: 3 direction: 19
        .byte #< -652; speed: 3 direction: 20
        .byte #< -511; speed: 3 direction: 21
        .byte #< -349; speed: 3 direction: 22
        .byte #< -176; speed: 3 direction: 23
        .byte #<    0; speed: 3 direction: 24
        .byte #<  176; speed: 3 direction: 25
        .byte #<  349; speed: 3 direction: 26
        .byte #<  511; speed: 3 direction: 27
        .byte #<  652; speed: 3 direction: 28
        .byte #<  763; speed: 3 direction: 29
        .byte #<  850; speed: 3 direction: 30
        .byte #<  904; speed: 3 direction: 31
        .byte #< 1075; speed: 3.5 direction: 0
        .byte #< 1054; speed: 3.5 direction: 1
        .byte #<  991; speed: 3.5 direction: 2
        .byte #<  890; speed: 3.5 direction: 3
        .byte #<  760; speed: 3.5 direction: 4
        .byte #<  596; speed: 3.5 direction: 5
        .byte #<  407; speed: 3.5 direction: 6
        .byte #<  206; speed: 3.5 direction: 7
        .byte #<    0; speed: 3.5 direction: 8
        .byte #< -206; speed: 3.5 direction: 9
        .byte #< -407; speed: 3.5 direction: 10
        .byte #< -596; speed: 3.5 direction: 11
        .byte #< -760; speed: 3.5 direction: 12
        .byte #< -890; speed: 3.5 direction: 13
        .byte #< -991; speed: 3.5 direction: 14
        .byte #<-1054; speed: 3.5 direction: 15
        .byte #<-1075; speed: 3.5 direction: 16
        .byte #<-1054; speed: 3.5 direction: 17
        .byte #< -991; speed: 3.5 direction: 18
        .byte #< -890; speed: 3.5 direction: 19
        .byte #< -760; speed: 3.5 direction: 20
        .byte #< -596; speed: 3.5 direction: 21
        .byte #< -407; speed: 3.5 direction: 22
        .byte #< -206; speed: 3.5 direction: 23
        .byte #<    0; speed: 3.5 direction: 24
        .byte #<  206; speed: 3.5 direction: 25
        .byte #<  407; speed: 3.5 direction: 26
        .byte #<  596; speed: 3.5 direction: 27
        .byte #<  760; speed: 3.5 direction: 28
        .byte #<  890; speed: 3.5 direction: 29
        .byte #<  991; speed: 3.5 direction: 30
        .byte #< 1054; speed: 3.5 direction: 31
 ENDIF

Shield1Bounce11 ; shield in / direction
        .byte %11 ; 0
        .byte %11 ; 1
        .byte %10 ; 2 change to -
        .byte %10 ; 3 change to -
        .byte %10 ; 4 change to -
        .byte %10 ; 5 change to -
        .byte %10 ; 6 change to -
        .byte %11 ; 7
        .byte %11 ; 8
        .byte %11 ; 9
        .byte %11 ; 10
        .byte %11 ; 11
        .byte %11 ; 12
        .byte %11 ; 13
        .byte %11 ; 14
        .byte %11 ; 15
        .byte %11 ; 16
        .byte %11 ; 17
        .byte %00 ; 18 change to |
        .byte %00 ; 19 change to |
        .byte %00 ; 20 change to |
        .byte %00 ; 21 change to |
        .byte %00 ; 22 change to |
        .byte %11 ; 23
        .byte %11 ; 24
        .byte %11 ; 25
        .byte %11 ; 26
        .byte %11 ; 27
        .byte %11 ; 28
;        .byte %11 ; 29   overlap tables
;        .byte %11 ; 30   overlap tables
;        .byte %11 ; 31   overlap tables


Shield14Bounce00 ; shield in | direction
        .byte %11 ; 0 change to /
        .byte %11 ; 1 change to /
        .byte %11 ; 2 change to /
        .byte %00 ; 3
        .byte %00 ; 4
        .byte %00 ; 5
        .byte %00 ; 6
        .byte %00 ; 7
        .byte %00 ; 8
        .byte %00 ; 9
        .byte %00 ; 10
        .byte %00 ; 11
        .byte %00 ; 12
        .byte %00 ; 13
        .byte %01 ; 14 change to \
        .byte %01 ; 15 change to \
        .byte %01 ; 16 change to \
        .byte %01 ; 17 change to \
        .byte %01 ; 18 change to \
        .byte %00 ; 19
        .byte %00 ; 20
        .byte %00 ; 21
        .byte %00 ; 22
        .byte %00 ; 23
        .byte %00 ; 24
        .byte %00 ; 25
        .byte %00 ; 26
        .byte %00 ; 27
        .byte %00 ; 28
        .byte %00 ; 29
;        .byte %11 ; 30 change to /    overlap tables
;        .byte %11 ; 31 change to /    overlap tables

Shield2Bounce11 ; shield in / direction
        .byte %11 ; 0
        .byte %11 ; 1
        .byte %00 ; 2 change to |
        .byte %00 ; 3 change to |
        .byte %00 ; 4 change to |
        .byte %00 ; 5 change to |
        .byte %00 ; 6 change to |
        .byte %11 ; 7
        .byte %11 ; 8
        .byte %11 ; 9
        .byte %11 ; 10
        .byte %11 ; 11
        .byte %11 ; 12
        .byte %11 ; 13
        .byte %11 ; 14
        .byte %11 ; 15
        .byte %11 ; 16
        .byte %11 ; 17
        .byte %10 ; 18 change to -
        .byte %10 ; 19 change to -
        .byte %10 ; 20 change to -
        .byte %10 ; 21 change to -
        .byte %10 ; 22 change to -
        .byte %11 ; 23
        .byte %11 ; 24
        .byte %11 ; 25
        .byte %11 ; 26
        .byte %11 ; 27
        .byte %11 ; 28
        .byte %11 ; 29
        .byte %11 ; 30
        .byte %11 ; 31





Shield23Bounce00 ; shield in | direction
        .byte %01 ; 0 change to \
        .byte %01 ; 1 change to \
        .byte %01 ; 2 change to \
        .byte %00 ; 3
        .byte %00 ; 4
        .byte %00 ; 5
        .byte %00 ; 6
        .byte %00 ; 7
        .byte %00 ; 8
        .byte %00 ; 9
        .byte %00 ; 10
        .byte %00 ; 11
        .byte %00 ; 12
        .byte %00 ; 13
        .byte %11 ; 14 change to /
        .byte %11 ; 15 change to /
        .byte %11 ; 16 change to /
        .byte %11 ; 17 change to /
        .byte %11 ; 18 change to /
        .byte %00 ; 19
        .byte %00 ; 20
        .byte %00 ; 21
        .byte %00 ; 22
        .byte %00 ; 23
        .byte %00 ; 24
        .byte %00 ; 25
        .byte %00 ; 26
        .byte %00 ; 27
        .byte %00 ; 28
        .byte %00 ; 29
;        .byte %01 ; 30 change to \   overlap tables
;        .byte %01 ; 31 change to \   overlap tables

Shield3Bounce01 ; shield in \ direction
        .byte %01 ; 0
        .byte %01 ; 1
        .byte %01 ; 2
        .byte %01 ; 3
        .byte %01 ; 4
        .byte %01 ; 5
        .byte %01 ; 6
        .byte %01 ; 7
        .byte %01 ; 8
        .byte %01 ; 9
        .byte %00 ; 10 change to |
        .byte %00 ; 11 change to |
        .byte %00 ; 12 change to |
        .byte %00 ; 13 change to |
        .byte %00 ; 14 change to |
        .byte %01 ; 15
        .byte %01 ; 16
        .byte %01 ; 17
        .byte %01 ; 18
        .byte %01 ; 19
        .byte %01 ; 20
        .byte %01 ; 21
        .byte %01 ; 22
        .byte %01 ; 23
        .byte %01 ; 24
        .byte %01 ; 25
        .byte %10 ; 26 change to -
        .byte %10 ; 27 change to -
        .byte %10 ; 28 change to -
        .byte %10 ; 29 change to -
        .byte %10 ; 30 change to -
;        .byte %01 ; 31       overlap tables

Shield4Bounce01 ; shield in \ direction
        .byte %01 ; 0
        .byte %01 ; 1
        .byte %01 ; 2
        .byte %01 ; 3
        .byte %01 ; 4
        .byte %01 ; 5
        .byte %01 ; 6
        .byte %01 ; 7
        .byte %01 ; 8
        .byte %01 ; 9
        .byte %10 ; 10 change to -
        .byte %10 ; 11 change to -
        .byte %10 ; 12 change to -
        .byte %10 ; 13 change to -
        .byte %10 ; 14 change to -
        .byte %01 ; 15
        .byte %01 ; 16
        .byte %01 ; 17
        .byte %01 ; 18
        .byte %01 ; 19
        .byte %01 ; 20
        .byte %01 ; 21
        .byte %01 ; 22
        .byte %01 ; 23
        .byte %01 ; 24
        .byte %01 ; 25
        .byte %00 ; 26 change to |
        .byte %00 ; 27 change to |
        .byte %00 ; 28 change to |
        .byte %00 ; 29 change to |
        .byte %00 ; 30 change to |
        .byte %01 ; 31






Shield13Bounce10 ; shield in - direction
        .byte %10 ; 0
        .byte %10 ; 1
        .byte %10 ; 2
        .byte %10 ; 3
        .byte %10 ; 4
        .byte %10 ; 5
        .byte %01 ; 6 change to \
        .byte %01 ; 7 change to \
        .byte %01 ; 8 change to \
        .byte %01 ; 9 change to \
        .byte %01 ; 10 change to \
        .byte %10 ; 11
        .byte %10 ; 12
        .byte %10 ; 13
        .byte %10 ; 14
        .byte %10 ; 15
        .byte %10 ; 16
        .byte %10 ; 17
        .byte %10 ; 18
        .byte %10 ; 19
        .byte %10 ; 20
        .byte %10 ; 21
        .byte %11 ; 22 change to /
        .byte %11 ; 23 change to /
        .byte %11 ; 24 change to /
        .byte %11 ; 25 change to /
        .byte %11 ; 26 change to /
;        .byte %10 ; 27    overlap tables
;        .byte %10 ; 28    overlap tables
;        .byte %10 ; 29    overlap tables
;        .byte %10 ; 30    overlap tables
;        .byte %10 ; 31    overlap tables


Shield24Bounce10 ; shield in - direction
        .byte %10 ; 0
        .byte %10 ; 1
        .byte %10 ; 2
        .byte %10 ; 3
        .byte %10 ; 4
        .byte %10 ; 5
        .byte %11 ; 6 change to /
        .byte %11 ; 7 change to /
        .byte %11 ; 8 change to /
        .byte %11 ; 9 change to /
        .byte %11 ; 10 change to /
        .byte %10 ; 11
        .byte %10 ; 12
        .byte %10 ; 13
        .byte %10 ; 14
        .byte %10 ; 15
        .byte %10 ; 16
        .byte %10 ; 17
        .byte %10 ; 18
        .byte %10 ; 19
        .byte %10 ; 20
        .byte %10 ; 21
        .byte %01 ; 22 change to \
        .byte %01 ; 23 change to \
        .byte %01 ; 24 change to \
        .byte %01 ; 25 change to \
        .byte %01 ; 26 change to \
        .byte %10 ; 27
        .byte %10 ; 28
        .byte %10 ; 29
        .byte %10 ; 30
        .byte %10 ; 31









        ORG $EFF4
        BANKS_AND_VECTORS


;--------------------------------------------------------------------
; bank 8 - Game Display Kernel
;--------------------------------------------------------------------
        ORG $F000
        JUMP_TABLE
        MUSIC_JUMP_TABLE

KernelGameCode SUBROUTINE

        lda BLState
        bmi FireballFlareUp
        jmp PositionObjects   ; nobody holding the BL fireball
FireballFlareUp
        and #%1111 ; limit data to who has the fireball
        cmp #%0010
        bcc P1HasFireball
        beq P2HasFireball
        cmp #%1000
        bcc P3HasFireball
P4HasFireball
        lda #%01000000
        .byte $2c
P3HasFireball
        lda #%00010000
        .byte $2c
P2HasFireball
        lda #%00000100
        .byte $2c
P1HasFireball
        lda #%00000001
TestShield
        and ShieldDir
        beq StraightShield
AngledShield
        inc BLCatchTimer
        lda BLCatchTimer
        and #%11
        beq SFBUL
        cmp #%10
        beq SFBDR
        bcs SFBDL

SFBUR   jsr ShiftFireballUp
        jsr ShiftFireballRight
        jmp OffscreenTest
SFBUL   jsr ShiftFireballUp
        jsr ShiftFireballLeft
        jmp OffscreenTest
SFBDR   jsr ShiftFireballDown
        jsr ShiftFireballRight
        jmp OffscreenTest
SFBDL   jsr ShiftFireballDown
        jsr ShiftFireballLeft
        jmp OffscreenTest

StraightShield
        inc BLCatchTimer
        lda BLCatchTimer
        and #%11
        beq SFBU
        cmp #%10
        beq SFBD
        bcs SFBL

SFBR    jsr ShiftFireballRight
        jmp OffscreenTest
SFBL    jsr ShiftFireballLeft
        jmp OffscreenTest
SFBU    jsr ShiftFireballUp
        jmp OffscreenTest
SFBD    jsr ShiftFireballDown
        jmp OffscreenTest


ShiftFireballRight
        lda BLCatchTimer
        lsr
        lsr
        lsr
        sec ; add at least 1
        adc BLxPosHigh
        sta BLxPosHigh
        rts
        ;jmp PositionObjects
ShiftFireballLeft
        lda BLCatchTimer
        lsr
        lsr
        lsr
        sta TempAdjust
        clc
        lda BLxPosHigh
        sbc TempAdjust
        sta BLxPosHigh
        rts
        ;jmp PositionObjects

ShiftFireballUp
        lda BLCatchTimer
        lsr
        lsr
        lsr
        lsr
        sec ; add at least 1
        adc BLyPosHigh
        sta BLyPosHigh
        rts
        ;jmp PositionObjects
ShiftFireballDown
        lda BLCatchTimer
        lsr
        lsr
        lsr
        lsr
        sta TempAdjust
        clc
        lda BLyPosHigh
        sbc TempAdjust
        sta BLyPosHigh
        rts

OffscreenTest
        lda BLxPosHigh
        cmp #158
        bcc PositionObjects
        lda #100
        sta BLyPosHigh

PositionObjects
         inc M0xPosHigh
         inc M1xPosHigh
         inc BLxPosHigh
         ldx #4
PosObjectLoop
         lda Player1X,X   ;+4    9
         sta WSYNC
DivideLoop
         sbc #15
         bcs DivideLoop   ;+4   13
         eor #7
         asl
         asl
         asl
         asl
         sta.wx HMP0,X  ;+4   17
         sta RESP0,X      ;+4   23
         dex              ;+2    2
         bpl PosObjectLoop;+3    5
;
         dec M0xPosHigh
         dec M1xPosHigh
         dec BLxPosHigh

;FixBallRows
        ldx #2
FixFireBallRowsLoop
        lda M0yPosHigh,x
        sta M0yEvenRow,x
        sta M0yOddRow,x
        and #1
        beq .decOdd
        dec M0yEvenRow,x
        .byte $2c ; skip dec odd
.decOdd dec M0yOddRow,x
        dex
        bpl FixFireBallRowsLoop


        lda #8
        sta REFP1
        ldy #$10
        sty NUSIZ0        ; set missle 0 to double-wide
        sty NUSIZ1        ; set missle 1 to double-wide
        ldy #0
        sty GRP0
        sty GRP1
        lda #ShieldColor1
        sta COLUP0
        lda #ShieldColor3
        sta COLUP1

        lda #7
        ldx ScreenColor
        sta KingIndex      ; store king shape
        lda DeadPlayers
        and #%101
        cmp #%101         ; if both are dead then we'll leave the color
        beq .noKings      ; alone to prevent flicker and just not draw the kings
        lsr
        bcc .notDead1
        stx COLUP0       ; player 1 is dead, set color the same as screen
.notDead1
        lsr
        lsr
        bcc .notDead2
        stx COLUP1
        bcs .notDead2
.noKings
        lda #15
        sta KingIndex      ; store "no kings" in paddle reading

.notDead2
        lda #%00000001
        and Frame
        sta Paddles2Read  ; update which pair of paddles to read
        tay
        lda #$57
;        ldy Paddles2Read
        sta Paddle1,y     ; reset 1st paddle to read
        sta Paddle3,y     ; reset 2nd paddle to read
        lda ScreenColor
        sta COLUBK
        lda #WallColor0
        sta COLUPF
        ; ldx #%00
        ; stx PF0
        ; stx PF1
        ; stx PF2
;        stx HMM0          ; 3 32 clear so HMOVE for dragon
;        stx HMM1          ; 3 35        and lower players
;        stx HMBL          ; 3 38        doesn't shift the fireballs

        lda #$13          ; 2 40 double size ball,reflective playfield & score mode
        sta CTRLPF        ; 3 43
        ; ldx #ENABL        ; 2 45
        ; txs               ; 2 47
        sta CXCLR         ; 3 50 reset collision latches
        lda INTIM
        sta DebugVB




.VblankWait
        lda INTIM
        bpl .VblankWait

        lda #0
        sta VBLANK        ; turn on video output & remove paddle dump to ground
        ldy #95           ; 2 52 Y holds the scan line counter (times 2)

; prep work for next scanline starts here
        ;nop   ; delay before updating shield1 so the
        ;nop   ; sprite doesn't get an extra row on occasion
        ldx #ENABL        ; 2 45
        txs               ; 2 47

        nop
        nop
        lda (Shield1ptr),y    ; 5 57 load Player 1's shield
        sta GRP0          ; 3 60 draw Player 1's shield
        lda Wall1R        ; 3 63
        cpy BLyOddRow     ; 3 66 preset ball php display trick
        sta WSYNC         ; 3 69
        sta HMOVE

        REPEAT 1           ; Top player's 1st wall first 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        lda #$15           ; 2 20 double size ball & reflective playfield
        ldx KingIndex       ; 3 23 load king pointer
; nop                ; 2 25
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 28
                           ; updating kingshape here gives us more time at the
                           ; start of the scanline with the tradeoff of the
                           ; right kings being shifted down by 1 scanline
        lda KingShape,x    ; 4 32
        sta PF0            ; 3 35
        lda (Shield3ptr),y     ; 5 40 load Player 3's shield
        sta GRP1           ; 3 43 draw Player 3's shield
        lda KingShape5thBit,x ; 4 47
        ora Wall3L         ; 3 50
        sta PF1            ; 3 53
    lda #0             ; 2
    sta HMM0           ; 3
    sta HMM1           ; 3
    sta HMBL           ; 3
;   nop                ; 2 55
;   nop                ; 2 57
;   nop                ; 2 59
;   nop                ; 2 61
;   nop                ; 2 63
        lda #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        sta CTRLPF         ; 3 68
        sta WSYNC          ; 3 71 end of line

        lda KingShape5thBit,x ; 4
        ora Wall1R         ; 3 7
        sta PF1            ; 3 10
        ldx #ENABL         ; 2 12
        txs                ; 2 14
        ldx KingIndex       ; 3 17
        dec KingIndex       ; 5 22
        nop 0              ; 3 25
        lda #$15           ; 2 27 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
        nop                ; 2 32
        nop                ; 2 34
        lda KingShape5thBit,x ; 4 38
        ora Wall3L         ; 3 41
        sta PF1            ; 3 44
        dey                ; 2 46
        lda (Shield1ptr),y     ; 5 51 load Player 1's shield
        sta GRP0           ; 3 54 draw Player 1's shield
        nop                ; 2 56
        lda KingShape5thBit,x ; 4 60
        ora Wall1R         ; 3 63
        ldx #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        stx CTRLPF         ; 3 69
        cpy BLyEvenRow     ; 3 72
        sta WSYNC          ; 3 75 end of line
        REPEND

        REPEAT 1           ; Top player's 1st wall second 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        lda #$15           ; 2 20 double size ball & reflective playfield
        ldx KingIndex       ; 3 23 load king pointer
        nop                ; 2 25
        nop                ; 2 27
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
                           ; updating kingshape here gives us more time at the
                           ; start of the scanline with the tradeoff of the
                           ; right kings being shifted down by 1 scanline
        lda KingShape,x    ; 4 34
        sta PF0            ; 3 37
        lda (Shield3ptr),y     ; 5 42 load Player 3's shield
        sta GRP1           ; 3 45 draw Player 3's shield
        lda KingShape5thBit,x ; 4 49
        ora Wall3L         ; 3 52
        sta PF1            ; 3 55
        nop                ; 2 57
        nop                ; 2 59
        nop                ; 2 61
        nop                ; 2 63
        lda #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        sta CTRLPF         ; 3 68
        sta WSYNC          ; 3 71 end of line

        lda.w Wall1R       ; 4
        and #T1            ; 2 6
        ora KingShape5thBit,x ; 4 10
        sta PF1            ; 3 13
        ldx #ENABL         ; 2 15
        txs                ; 2 17
        ldx KingIndex      ; 3 20
        dec KingIndex      ; 5 25
        lda #$15           ; 2 27 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
        nop                ; 2 32
        lda Wall3L         ; 3 35
        and #T1            ; 2 37
        ora KingShape5thBit,x ; 4 41
        sta PF1            ; 3 44
        dey                ; 2 46
        lda (Shield1ptr),y ; 5 51 load Player 1's shield
        sta GRP0           ; 3 54 draw Player 1's shield
        nop                ; 2 56
        lda KingShape5thBit,x ; 4 60
        ora Wall1R         ; 3 63
        ldx #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        stx CTRLPF         ; 3 68
        cpy BLyOddRow      ; 3 71
        sta WSYNC          ; 3 74 end of line
        REPEND

        REPEAT 1           ; Top player's 1st wall third 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        lda #$15           ; 2 20 double size ball & reflective playfield
        ldx KingIndex       ; 3 23 load king pointer
        nop                ; 2 25
        nop                ; 2 27
                           ; sta needs to start at at 27 for color change
        sta CTRLPF         ; 3 30
                           ; updating kingshape here gives us more time at the
                           ; start of the scanline with the tradeoff of the
                           ; right kings being shifted down by 1 scanline
        lda KingShape,x    ; 4 34
        sta PF0            ; 3 37
        lda (Shield3ptr),y     ; 5 42 load Player 3's shield
        sta GRP1           ; 3 45 draw Player 3's shield
        lda KingShape5thBit,x ; 4 49
        ora Wall3L         ; 3 52
        sta PF1            ; 3 55
        nop                ; 2 57
        nop                ; 2 59
        nop                ; 2 61
        nop                ; 2 63
        lda #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        sta CTRLPF         ; 3 68
        sta WSYNC          ; 3 71 end of line

        lda KingShape5thBit,x ; 4
        ora Wall1R         ; 3 7
        sta PF1            ; 3 10
        ldx #ENABL         ; 2 12
        txs                ; 2 14
        ldx KingIndex       ; 3 17
        dec KingIndex       ; 5 22
        nop 0              ; 3 25
        lda #$15           ; 2 27 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
        nop                ; 2 32
        nop                ; 2 34
        lda KingShape5thBit,x ; 4 38
        ora Wall3L         ; 3 41
        sta PF1            ; 3 44
        dey                ; 2 46
        lda (Shield1ptr),y     ; 5 51 load Player 1's shield
        sta GRP0           ; 3 54 draw Player 1's shield
        nop                ; 2 56
        lda KingShape5thBit,x ; 4 60
        ora Wall1R         ; 3 63
        ldx #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        stx CTRLPF         ; 3 69
        cpy BLyEvenRow     ; 3 72
        sta WSYNC          ; 3 75 end of line
        REPEND



        REPEAT 1           ; last 2LK of 1st wall
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        lda #$15           ; 2 20 double size ball & reflective playfield
        ldx KingIndex       ; 3 23 load king pointer
                           ; sta needs to start at 27 for color change
        nop                ; 2 25
        nop                ; 2 27
        sta CTRLPF         ; 3 30
                           ; updating kingshape here gives us more time at the
                           ; start of the scanline with the tradeoff of the
                           ; right kings being shifted down by 1 scanline
        lda KingShape,x    ; 4 34
        sta PF0            ; 3 37
        lda (Shield3ptr),y     ; 5 42 load Player 3's shield
        sta GRP1           ; 3 45 draw Player 3's shield
        lda KingShape5thBit,x ; 4 49
        ora Wall3L         ; 3 52
        sta PF1            ; 3 55
        nop                ; 2 57
        nop                ; 2 59
        nop                ; 2 61
        nop                ; 2 63
        lda #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        sta CTRLPF         ; 3 68
        sta WSYNC          ; 3 71 end of line

        lda Wall1R         ; 3
        and #T2            ; 2 5
        ora KingShape5thBit,x ; 4 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        ldx KingIndex      ; 3 19
        dec KingIndex      ; 5 24
        lda #$15           ; 2 26 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 29
        nop                ; 2 31
        lda Wall3L         ; 3 34
        and #T2            ; 2 36
        ora KingShape5thBit,x ; 4 40
        sta PF1            ; 3 43
        dey                ; 2 45
        lda (Shield1ptr),y ; 5 50
        sta GRP0           ; 3 53
        nop 0              ; 3 56
        lda KingShape5thBit,x ; 4 60
        ora Wall1R+1       ; 3 63
        ldx #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        stx CTRLPF         ; 3 69
        ldx #WallColor1    ; 2 71
        cpy BLyOddRow      ; 3 74
        stx COLUPF         ; 3 77 shifts 1st row of 2nd wall 1 cycles
;       sta WSYNC          ;      which is in spec for the timing of the
                           ;      color changes
        REPEND
; end 1st line

; start 2nd line
        REPEAT 1           ; top players' 2nd wall first 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        lda #$15           ; 2 20 double size ball & reflective playfield
        ldx KingIndex       ; 3 23 load king pointer
                           ; sta needs to start at 27 for color change
        nop                ; 2 25
        nop                ; 2 27
        sta CTRLPF         ; 3 30
                           ; updating kingshape here gives us more time at the
                           ; start of the scanline with the tradeoff of the
                           ; right kings being shifted down by 1 scanline
        lda KingShape,x    ; 4 34
        sta PF0            ; 3 37
        lda (Shield3ptr),y     ; 5 42 load Player 3's shield
        sta GRP1           ; 3 45 draw Player 3's shield
        lda KingShape5thBit,x ; 4 49
        ora Wall3L+1       ; 3 52
        sta PF1            ; 3 55
        nop                ; 2 57
        nop                ; 2 59
        nop                ; 2 61
        nop                ; 2 63
        lda #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        sta CTRLPF         ; 3 68
        sta WSYNC          ; 3 71 end of line

        lda KingShape5thBit,x ; 4
        ora Wall1R+1       ; 3 7
        sta PF1            ; 3 10
        ldx #ENABL         ; 2 12
        txs                ; 2 14
        ldx KingIndex       ; 3 17
        dec KingIndex       ; 5 22
        nop 0              ; 3 25
        lda #$15           ; 2 27 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
        nop                ; 2 32
        nop                ; 2 34
        lda KingShape5thBit,x ; 4 38
        ora Wall3L+1       ; 3 41
        sta PF1            ; 3 44
        dey                ; 2 46
        lda (Shield1ptr),y     ; 5 51
        sta GRP0           ; 3 54
        nop                ; 2 56
        lda KingShape5thBit,x ; 4 60
        ora Wall1R+1       ; 3 63
        ldx #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        stx CTRLPF         ; 3 69
        cpy BLyEvenRow     ; 3 72
        sta WSYNC          ; 3 75 end of line
        REPEND

        REPEAT 1           ; top players' 2nd wall second 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        lda #$15           ; 2 20 double size ball & reflective playfield
        ldx KingIndex       ; 3 23 load king pointer
                           ; sta needs to start at 27 for color change
        nop                ; 2 25
        nop                ; 2 27
        sta CTRLPF         ; 3 30
                           ; updating kingshape here gives us more time at the
                           ; start of the scanline with the tradeoff of the
                           ; right kings being shifted down by 1 scanline
        lda KingShape,x    ; 4 34
        sta PF0            ; 3 37
        lda (Shield3ptr),y     ; 5 42 load Player 3's shield
        sta GRP1           ; 3 45 draw Player 3's shield
        lda KingShape5thBit,x ; 4 49
        ora Wall3L+1       ; 3 52
        sta PF1            ; 3 55
        nop                ; 2 57
        nop                ; 2 59
        nop                ; 2 61
        nop                ; 2 63
        lda #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        sta CTRLPF         ; 3 68
        sta WSYNC          ; 3 71 end of line

        lda Wall1R+1       ; 3
        and #T1            ; 2 5
        ora KingShape5thBit,x ; 4 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        ldx KingIndex      ; 3 19
        dec KingIndex      ; 5 24
        lda #$15           ; 2 26 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 29
        nop                ; 2 31
        lda Wall3L+1       ; 3 34
        and #T1            ; 2 36
        ora KingShape5thBit,x ; 4 40
        sta PF1            ; 3 43
        dey                ; 2 45
        lda (Shield1ptr),y ; 5 50
        sta GRP0           ; 3 53
        nop                ; 2 55
        nop                ; 2 57
        lda Wall1R+1       ; 3 60
        ora KingShape5thBit,x ; 4 64
        ldx #$13           ; 2 66 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        stx CTRLPF         ; 3 69
        cpy BLyOddRow      ; 3 72
        sta WSYNC          ; 3 75 end of line
        REPEND

        REPEAT 1           ; top players' 2nd wall third 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        lda #$15           ; 2 20 double size ball & reflective playfield
        ldx KingIndex       ; 3 23 load king pointer
                           ; sta needs to start at 27 for color change
        nop                ; 2 25
        nop                ; 2 27
        sta CTRLPF         ; 3 30
                           ; updating kingshape here gives us more time at the
                           ; start of the scanline with the tradeoff of the
                           ; right kings being shifted down by 1 scanline
        lda KingShape,x    ; 4 34
        sta PF0            ; 3 37
        lda (Shield3ptr),y     ; 5 42 load Player 3's shield
        sta GRP1           ; 3 45 draw Player 3's shield
        lda KingShape5thBit,x ; 4 49
        ora Wall3L+1       ; 3 52
        sta PF1            ; 3 55
        nop                ; 2 57
        nop                ; 2 59
        nop                ; 2 61
        nop                ; 2 63
        lda #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        sta CTRLPF         ; 3 68
        sta WSYNC          ; 3 71 end of line

        lda KingShape5thBit,x ; 4
        ora Wall1R+1       ; 3 7
        sta PF1            ; 3 10
        ldx #ENABL         ; 2 12
        txs                ; 2 14
        ldx KingIndex       ; 3 17
        dec KingIndex       ; 5 22
        nop 0              ; 3 25
        lda #$15           ; 2 27 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
        nop                ; 2 32
        nop                ; 2 34
        lda KingShape5thBit,x ; 4 38
        ora Wall3L+1       ; 3 41
        sta PF1            ; 3 44
        dey                ; 2 46
        lda (Shield1ptr),y     ; 5 51
        sta GRP0           ; 3 54
        nop                ; 2 56
        lda KingShape5thBit,x ; 4 60
        ora Wall1R+1       ; 3 63
        ldx #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        stx CTRLPF         ; 3 69
        cpy BLyEvenRow     ; 3 72
        sta WSYNC          ; 3 75 end of line
        REPEND



        REPEAT 1           ; last 2LK of 2nd wall
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        lda #$15           ; 2 20 double size ball & reflective playfield
        ldx KingIndex       ; 3 23 load king pointer
        nop                ; 2 25
        nop                ; 2 27
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
                           ; updating kingshape here gives us more time at the
                           ; start of the scanline with the tradeoff of the
                           ; right kings being shifted down by 1 scanline
        lda KingShape,x    ; 4 34
        sta PF0            ; 3 37
        lda (Shield3ptr),y     ; 5 42 load Player 3's shield
        sta GRP1           ; 3 45 draw Player 3's shield
        lda KingShape5thBit,x ; 4 49
        ora Wall3L+1       ; 3 52
        sta PF1            ; 3 55
        nop                ; 2 57
        nop                ; 2 59
        nop                ; 2 61
        nop                ; 2 63
        lda #$13           ; 2 65 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        sta CTRLPF         ; 3 68
        sta WSYNC          ; 3 71 end of line

        lda Wall1R+1       ; 3
        and #T2            ; 2 5
        ora KingShape5thBit,x ; 4 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14 set stack for ball & Missile php trick
        txs                ; 2 16
        ldx KingIndex      ; 3 19
        dec KingIndex      ; 5 24
        lda #$15           ; 2 26 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 29
        nop                ; 2 31
        lda Wall3L+1       ; 3 34
        and #T2            ; 2 36
        ora KingShape5thBit,x ; 4 40
        sta PF1            ; 3 43
        dey                ; 2 45
        lda (Shield1ptr),y ; 5 50
        sta GRP0           ; 3 53
        nop                ; 2 55
        nop                ; 2 57
        lda KingShape5thBit,x ; 4 61
        ora Wall1R+2       ; 3 64
        ldx #$13           ; 2 66 double size ball,reflective playfield & score mode
                           ; sta needs to start 65-67 for color change
        stx CTRLPF         ; 3 69
        cpy BLyOddRow      ; 3 72
        sta WSYNC          ; 3 75 end of line
        REPEND
; end 2nd line


;start 3rd line
        REPEAT 1           ; top players' 3rd wall first 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        ldx #WallColor2    ; 2 17
        stx COLUPF         ; 3 20
        nop                ; 2 22
        sta PF1            ; 3 25
        lda #$15           ; 2 27 double size ball & reflective playfield
                           ; sta needs to start at 27 for color change
        sta CTRLPF         ; 3 30
        lda #0             ; 2 32 done drawing king
        sta PF0            ; 3 35
        lda (Shield3ptr),y     ; 5 40 load Player 3's shield
        sta GRP1           ; 3 43 draw Player 3's shield
        nop                ; 2 45
        nop                ; 2 47
        lda Wall3L+2       ; 3 50
        sta PF1            ; 3 53
        sta WSYNC          ; 3 56 end of line

        lda Wall1R+2       ; 3
        sta PF1            ; 3 6
        ldx #ENABL         ; 2 8
        txs                ; 2 10
        inc KingIndex       ;10 20 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        inc KingIndex       ;10 30 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        inc KingIndex       ;10 40 inc/dec is a pair for 10 cycles
        dec KingIndex       ;

        lda Wall3L+2       ; 3 43
        sta PF1            ; 3 46
        dey                ; 2 48
        lda (Shield1ptr),y     ; 5 53
        sta GRP0           ; 3 56
        lda Wall1R+2       ; 3 59
        cpy BLyEvenRow     ; 3 62
        sta WSYNC          ; 3 65 end of line
        REPEND

        REPEAT 1           ; top players' 3rd wall second 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        inc KingIndex       ;10 35 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        lda (Shield3ptr),y     ; 5 40 load Player 3's shield
        sta GRP1           ; 3 43 draw Player 3's shield
        nop                ; 2 45
        nop                ; 2 47
        lda Wall3L+2       ; 3 50
        sta PF1            ; 3 53
        sta WSYNC          ; 3 56 end of line

        lda Wall1R+2       ; 3
        and #T1            ; 2 5
        sta PF1            ; 3 8
        dec KingIndex      ; 5 13
        ldx #ENABL         ; 2 15
        txs                ; 2 17
        READ_TWO_PADDLES   ;23 40
        lda Wall3L+2       ; 3 43
        and #T1            ; 2 45
        sta PF1            ; 3 48
        dey                ; 2 50
        lda (Shield1ptr),y ; 5 55
        sta GRP0           ; 3 58
        lda Wall1R+2       ; 3 61
        cpy BLyOddRow      ; 3 64
        sta WSYNC          ; 3 67 end of line
        REPEND

        REPEAT 1           ; top players' 3rd wall third 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        inc KingIndex       ;10 35 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        lda (Shield3ptr),y     ; 5 40 load Player 3's shield
        sta GRP1           ; 3 43 draw Player 3's shield
        nop                ; 2 45
        nop                ; 2 47
        lda Wall3L+2       ; 3 50
        sta PF1            ; 3 53
        sta WSYNC          ; 3 56 end of line

        lda Wall1R+2       ; 3
        sta PF1            ; 3 6
        dec KingIndex       ; 5 11
        ldx #ENABL         ; 2 13
        txs                ; 2 15
        READ_TWO_PADDLES   ;23 38
        lda Wall3L+2       ; 3 41
        sta PF1            ; 3 44
        dey                ; 2 46
        lda (Shield1ptr),y     ; 5 51
        sta GRP0           ; 3 54
        lda Wall1R+2       ; 3 57
        cpy BLyEvenRow     ; 3 60
        sta WSYNC          ; 3 63 end of line
        REPEND


        REPEAT 1           ; top players' 3rd wall last 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF1            ; 3 18
        inc KingIndex       ;10 28 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        inc KingIndex       ;10 38 inc/dec is a pair for 10 cycles
        dec KingIndex       ;
        lda (Shield3ptr),y     ; 5 43 load Player 3's shield
        sta GRP1           ; 3 46 draw Player 3's shield
        lda Wall3L+2       ; 3 49
        sta PF1            ; 3 52
        lda Wall1R+2       ; 3 55
        and #T2            ; 2 57
        sta WSYNC          ; 3 60 end of line

        sta PF1            ; 3
        dec KingIndex      ; 5 8
        ldx #ENABL         ; 2 10
        txs                ; 2 12
        READ_TWO_PADDLES   ;23 35
        lda Wall3L+2       ; 3 38
        and #T2            ; 2 40
        sta PF1            ; 3 43
        dey                ; 2 45
        lda (Shield1ptr),y ; 5 50 load Player 1's shield
        sta GRP0           ; 3 53 draw Player 1's shield
        ldx #WallColor3    ; 2 55
        lda Wall1L+3       ; 3 58
        cpy BLyOddRow      ; 3 61
        sta WSYNC          ; 3 64 end of line
        REPEND
; end 3rd line

; start 4th line
        REPEAT 1           ; top players' 4th wall first 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        stx COLUPF         ; 3 21
        lda Wall1R+3       ; 3 24
        sta PF1            ; 3 27

        lda (Shield3ptr),y     ; 5 32 load Player 3's shield
        sta GRP1           ; 3 35 draw Player 3's shield
        nop                ; 2 37
        nop                ; 2 39
        lda Wall3L+3       ; 3 42
        sta PF1            ; 3 45
        lda Wall3R+3       ; 3 48
        sta PF0            ; 3 51
        sta WSYNC          ; 3 54 end of line

        lda Wall1L+3       ; 3
        sta PF0            ; 3 6
        lda Wall1R+3       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall3L+3       ; 3 42
        sta PF1            ; 3 45
        lda Wall3R+3       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield1ptr),y     ; 5 58 load Player 1's shield
        sta GRP0           ; 3 61 draw Player 1's shield
        lda Wall1L+3       ; 3 64
        cpy BLyEvenRow     ; 3 67
        sta WSYNC          ; 3 70 end of line
        REPEND

        REPEAT 1           ; top players' 4th wall second 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda Wall1R+3       ; 3 21
        sta PF1            ; 3 24

        lda (Shield3ptr),y     ; 5 29 load Player 3's shield
        sta GRP1           ; 3 32 draw Player 3's shield
        nop                ; 2 34
        lda Wall3L+3       ; 3 37
        sta PF1            ; 3 40
        lda Wall3R+3       ; 3 43
        sta PF0            ; 3 46
        lda Wall1L+3       ; 3 49
        and #T2            ; 2 51
        sta WSYNC          ; 3 54 end of line

        sta PF0            ; 3
        lda Wall1R+3       ; 3 6
        and #T1            ; 2 8
        sta PF1            ; 3 11
        ldx #ENABL         ; 2 13
        txs                ; 2 15
        READ_TWO_PADDLES   ;23 38
        lda Wall3L+3       ; 3 41
        and #T1            ; 2 43
        sta PF1            ; 3 46
        lda Wall3R+3       ; 3 49
        and #T2            ; 2 51
        sta PF0            ; 3 54
        dey                ; 2 56
        lda (Shield1ptr),y ; 5 61
        sta GRP0           ; 3 64
        lda Wall1L+3       ; 3 67
        cpy BLyOddRow      ; 3 70
        sta WSYNC          ; 3 73 end of line
        REPEND

        REPEAT 1           ; top players' 4th wall third 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda Wall1R+3       ; 3 21
        sta PF1            ; 3 24

        lda (Shield3ptr),y     ; 5 29 load Player 3's shield
        sta GRP1           ; 3 32 draw Player 3's shield
        nop                ; 2 34
        lda Wall3L+3       ; 3 37
        sta PF1            ; 3 40
        lda Wall3R+3       ; 3 43
        sta PF0            ; 3 46
        sta WSYNC          ; 3 49 end of line

        lda Wall1L+3       ; 3
        sta PF0            ; 3 6
        lda Wall1R+3       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall3L+3       ; 3 42
        sta PF1            ; 3 45
        lda Wall3R+3       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield1ptr),y     ; 5 58
        sta GRP0           ; 3 61 draw Player 1's shield
        lda Wall1L+3       ; 3 64
        cpy BLyEvenRow     ; 3 67
        sta WSYNC          ; 3 70 end of line
        REPEND


        REPEAT 1           ; top players' 4th wall last 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda Wall1R+3       ; 3 21
        sta PF1            ; 3 24

        lda (Shield3ptr),y     ; 5 29 load Player 3's shield
        sta GRP1           ; 3 32 draw Player 3's shield
        nop                ; 2 34
        lda Wall3L+3       ; 3 37
        sta PF1            ; 3 40
        lda Wall3R+3       ; 3 43
        sta PF0            ; 3 46
        lda Wall1R+3       ; 3 49
        and #T2            ; 2 51
        sta CT1            ; 3 54
        lda Wall1L+3       ; 3 57
        and #T1            ; 2 59
        sta WSYNC          ; 3 62 end of line

        sta PF0            ; 3
        lda CT1            ; 3 6
        sta PF1            ; 3 9
        ldx #ENABL         ; 2 11
        txs                ; 2 13
        READ_TWO_PADDLES   ;23 36
        lda Wall3L+3       ; 3 39
        and #T2            ; 2 41
        sta PF1            ; 3 44
        lda Wall3R+3       ; 3 47
        and #T1            ; 2 49
        sta PF0            ; 3 52
        dey                ; 2 54
        lda (Shield1ptr),y ; 5 59
        sta GRP0           ; 3 62
        ldx #WallColor4    ; 2 64
        lda Wall1L+4       ; 3 67
        cpy BLyOddRow      ; 3 70
        sta WSYNC          ; 3 73 end of line
        REPEND
; end 4th line


; start 5th line
        REPEAT 1           ; top players' 5th wall first 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        stx COLUPF         ; 3 21
        lda Wall1R+4       ; 3 24
        sta PF1            ; 3 27

        lda (Shield3ptr),y     ; 5 32 load Player 3's shield
        sta GRP1           ; 3 35 draw Player 3's shield
        nop                ; 2 37 ;
        nop                ; 2 39
        lda Wall3L+4       ; 3 42
        sta PF1            ; 3 45
        lda Wall3R+4       ; 3 48
        sta PF0            ; 3 51
        sta WSYNC          ; 3 54 end of line

        lda Wall1L+4       ; 3
        sta PF0            ; 3 6
        lda Wall1R+4       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall3L+4       ; 3 42
        sta PF1            ; 3 45
        lda Wall3R+4       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield1ptr),y     ; 5 58
        sta GRP0           ; 3 61 draw Player 1's shield
        lda Wall1L+4       ; 3 64
        cpy BLyEvenRow     ; 3 67
        sta WSYNC          ; 3 70 end of line
        REPEND

        REPEAT 1           ; top players' 5th wall second 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda Wall1R+4       ; 3 21
        sta PF1            ; 3 24

        lda (Shield3ptr),y     ; 5 29 load Player 3's shield
        sta GRP1           ; 3 32 draw Player 3's shield
        nop                ; 2 34
        lda Wall3L+4       ; 3 37
        sta PF1            ; 3 40
        lda Wall3R+4       ; 3 43
        sta PF0            ; 3 46
        lda Wall1L+4       ; 3 49
        and #T2            ; 2 51
        sta WSYNC          ; 3 54 end of line

        sta PF0            ; 3
        lda Wall1R+4       ; 3 6
        and #T1            ; 2 8
        sta PF1            ; 3 11
        ldx #ENABL         ; 2 13
        txs                ; 2 15
        READ_TWO_PADDLES   ;23 38
        lda Wall3L+4       ; 3 41
        and #T1            ; 2 43
        sta PF1            ; 3 46
        lda Wall3R+4       ; 3 49
        and #T2            ; 2 51
        sta PF0            ; 3 54
        dey                ; 2 56
        lda (Shield1ptr),y ; 5 61
        sta GRP0           ; 3 64 draw Player 1's shield
        lda Wall1L+4       ; 3 67
        cpy BLyOddRow      ; 3 70
        sta WSYNC          ; 3 73 end of line
        REPEND

        REPEAT 1           ; top players' 5th wall third 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda Wall1R+4       ; 3 21
        sta PF1            ; 3 24

        lda (Shield3ptr),y     ; 5 29 load Player 3's shield
        sta GRP1           ; 3 32 draw Player 3's shield
        nop                ; 2 34
        lda Wall3L+4       ; 3 37
        sta PF1            ; 3 40
        lda Wall3R+4       ; 3 43
        sta PF0            ; 3 46
        sta WSYNC          ; 3 49 end of line

        lda Wall1L+4       ; 3
        sta PF0            ; 3 6
        lda Wall1R+4       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall3L+4       ; 3 42
        sta PF1            ; 3 45
        lda Wall3R+4       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield1ptr),y     ; 5 58
        sta GRP0           ; 3 61
        lda Wall1L+4       ; 3 64
        cpy BLyEvenRow     ; 3 67
        sta WSYNC          ; 3 70 end of line
        REPEND

        REPEAT 1           ; top players' 5th wall last 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda Wall1R+4       ; 3 21
        sta PF1            ; 3 24

        lda (Shield3ptr),y     ; 5 29 load Player 3's shield
        sta GRP1           ; 3 32 draw Player 3's shield
        nop                ; 2 34
        lda Wall3L+4       ; 3 37
        sta PF1            ; 3 40
        lda Wall3R+4       ; 3 43
        sta PF0            ; 3 46
        lda Wall1R+4       ; 3 49
        and #T2            ; 2 51
        sta CT1            ; 3 54
        lda Wall1L+4       ; 3 57
        and #T1            ; 2 59
        sta WSYNC          ; 3 62 end of line

        sta PF0            ; 3
        lda CT1            ; 3 6
        sta PF1            ; 3 9
        ldx #ENABL         ; 2 11
        txs                ; 2 13
        READ_TWO_PADDLES   ;23 36
        lda Wall3L+4       ; 3 39
        and #T2            ; 2 41
        sta PF1            ; 3 44
        lda Wall3R+4       ; 3 47
        and #T1            ; 2 49
        sta PF0            ; 3 52
        dey                ; 2 54
        lda (Shield1ptr),y ; 5 59
        sta GRP0           ; 3 62
        ldx #WallColor5    ; 2 64
        lda Wall1L+5       ; 3 67
        cpy BLyOddRow      ; 3 70
        sta WSYNC          ; 3 73 end of line
        REPEND
; end 5th line

; start 6th line
        REPEAT 1           ; top players' 6th wall first 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        stx COLUPF         ; 3 21
        lda Wall1R+5       ; 3 24
        sta PF1            ; 3 27

        lda (Shield3ptr),y     ; 5 32 load Player 3's shield
        sta GRP1           ; 3 35 draw Player 3's shield
        nop                ; 2 37
        nop                ; 2 39
        lda Wall3L+5       ; 3 42
        sta PF1            ; 3 45
        lda Wall3R+5       ; 3 47
        sta PF0            ; 3 50
        sta WSYNC          ; 3 53 end of line

        lda Wall1L+5       ; 3
        sta PF0            ; 3 6
        lda Wall1R+5       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall3L+5       ; 3 42
        sta PF1            ; 3 45
        lda Wall3R+5       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield1ptr),y     ; 5 58
        sta GRP0           ; 3 61
        lda Wall1L+5       ; 3 64
        cpy BLyEvenRow     ; 3 67
        sta WSYNC          ; 3 70 end of line
        REPEND

        REPEAT 1           ; top players' 6th wall second 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda Wall1R+5       ; 3 21
        sta PF1            ; 3 24

        lda (Shield3ptr),y     ; 5 29 load Player 3's shield
        sta GRP1           ; 3 32 draw Player 3's shield
        nop                ; 2 34
        lda Wall3L+5       ; 3 37
        sta PF1            ; 3 40
        lda Wall3R+5       ; 3 43
        sta PF0            ; 3 46
        lda Wall1L+5       ; 3 49
        and #T2            ; 2 51
        sta WSYNC          ; 3 54 end of line

        sta PF0            ; 3
        lda Wall1R+5       ; 3 6
        and #T1            ; 2 8
        sta PF1            ; 3 11
        ldx #ENABL         ; 2 13
        txs                ; 2 15
        READ_TWO_PADDLES   ;23 38
        lda Wall3L+5       ; 3 41
        and #T1            ; 2 43
        sta PF1            ; 3 46
        lda Wall3R+5       ; 3 49
        and #T2            ; 2 51
        sta PF0            ; 3 54
        dey                ; 2 56
        lda (Shield1ptr),y ; 5 61
        sta GRP0           ; 3 64 draw Player 1's shield
        lda Wall1L+5       ; 3 67
        cpy BLyOddRow      ; 3 70
        sta WSYNC          ; 3 73 end of line
        REPEND

        REPEAT 1           ; top players' 6th wall third 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yOddRow      ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yOddRow      ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda Wall1R+5       ; 3 21
        sta PF1            ; 3 24

        lda (Shield3ptr),y     ; 5 29 load Player 3's shield
        sta GRP1           ; 3 32 draw Player 3's shield
        nop                ; 2 34
        lda Wall3L+5       ; 3 37
        sta PF1            ; 3 40
        lda Wall3R+5       ; 3 43
        sta PF0            ; 3 46
        sta WSYNC          ; 3 49 end of line

        lda Wall1L+5       ; 3
        sta PF0            ; 3 6
        lda Wall1R+5       ; 3 9
        sta PF1            ; 3 12
        ldx #ENABL         ; 2 14
        txs                ; 2 16
        READ_TWO_PADDLES   ;23 39
        lda Wall3L+5       ; 3 42
        sta PF1            ; 3 45
        lda Wall3R+5       ; 3 48
        sta PF0            ; 3 51
        dey                ; 2 53
        lda (Shield1ptr),y     ; 5 58
        sta GRP0           ; 3 61 draw player 1's shield
        lda Wall1L+5       ; 3 64
        cpy BLyEvenRow     ; 3 67
        sta WSYNC          ; 3 70 end of line
        REPEND

        REPEAT 1           ; top players' 6th wall last 2LK
        php                ; 3    draws ball if Ball BLY = scanline
        cpy M1yEvenRow     ; 3  6
        php                ; 3  9 draws missile 1 if M1Y = scanline
        cpy M0yEvenRow     ; 3 12
        php                ; 3 15 draws missile 0 if M0Y = scanline
        sta PF0            ; 3 18
        lda Wall1R+5       ; 3 21
        sta PF1            ; 3 24

        lda (Shield3ptr),y     ; 5 29 load Player 3's shield
        sta GRP1           ; 3 32 draw Player 3's shield
        nop                ; 2 34
        lda Wall3L+5       ; 3 37
        sta PF1            ; 3 40
        lda Wall3R+5       ; 3 43
        sta PF0            ; 3 46
        lda Wall1L+5       ; 3 49
        and #T1            ; 2 51
        sta WSYNC          ; 3 54 end of line

        sta PF0            ; 3
        lda Wall1R+5       ; 3 6
        and #T2            ; 2 8
        sta PF1            ; 3 11
        ldx #ENABL         ; 2 13
        txs                ; 2 15
        READ_TWO_PADDLES   ;23 38
        lda Wall3L+5       ; 3 41
        and #T2            ; 2 43
        sta PF1            ; 3 46
        lda Wall3R+5       ; 3 49
        and #T1            ; 2 51
        sta PF0            ; 3 54
        dey                ; 2 56
        lda (Shield1ptr),y ; 5 61
        sta GRP0           ; 3 64
        REPEND
; end 6th line


        ldx #ENABL         ; 2 66
        txs                ; 2 68
        lda #$00           ; 2 70
        nop                ; 2 72
        sta PF1            ; 3 75 wait to clear these until after
        sta PF0            ; 3 78   last castle bricks are drawn
.topshieldloop SUBROUTINE
        cpy BLyOddRow     ; 3
        php               ; 3
        cpy M1yOddRow     ; 3
        php               ; 3
        cpy M0yOddRow     ; 3
        php               ; 3
        lda (Shield3ptr),y    ; 5
        sta GRP1          ; 3 draw Player 3's shield
        READ_TWO_PADDLES  ;23
        sta WSYNC
        ldx #ENABL        ; 2
        txs               ; 2  4
        dey               ; 2  6
        inc KingIndex      ;10 16 inc/dec is a pair for 10 cycles
        dec KingIndex
        inc KingIndex      ;10 26 inc/dec is a pair for 10 cycles
        dec KingIndex
        inc KingIndex      ;10 36 inc/dec is a pair for 10 cycles
        dec KingIndex
        lda (Shield1ptr),y    ; 5 41
        sta GRP0          ; 3 44
        sta WSYNC

        cpy BLyEvenRow     ; 3
        php               ; 3
        cpy M1yEvenRow     ; 3
        php               ; 3
        cpy M0yEvenRow     ; 3
        php               ; 3
        lda (Shield3ptr),y    ; 5
        sta GRP1          ; 3 draw Player 3's shield
        READ_TWO_PADDLES ; 23
        sta WSYNC
        ldx #ENABL        ; 2
        txs               ; 2  4
        dey               ; 2  6
        inc KingIndex      ;10 16 inc/dec is a pair for 10 cycles
        dec KingIndex
        inc KingIndex      ;10 26 inc/dec is a pair for 10 cycles
        dec KingIndex
        inc KingIndex      ;10 36 inc/dec is a pair for 10 cycles
        dec KingIndex
        lda (Shield1ptr),y    ; 5 41
        sta GRP0          ; 3 44
        cpy #$3f ;41          ; 2 46
        beq DragonArea    ; 2 48
        sta WSYNC
        bne .topshieldloop



DragonArea

        lda DragonColor1  ; 3 52
        sta COLUP0        ; 3 55
        lda #0            ; 2 57
        sta GRP0          ; 3 60 turn off Player 1's shield
        cpy BLyOddRow     ; 3 63
        sta WSYNC         ; 3 66

PositionDragon SUBROUTINE
        php               ; 3  6
        cpy M1yOddRow     ; 3  9
        php               ; 3 12
        cpy M0yOddRow     ; 3 15
        php               ; 3 18
        ldx #ENABL        ; 2 20
        txs               ; 2 22
        READ_TWO_PADDLES  ;23 45
        dey               ; 2 47
        ldx #0            ; 2 49
        stx GRP1          ; 3 52 turn off Player 3's shield
        stx DragonIndex      ; 3 55 Dragon Index, counting up
        lda DragonControl ; 3 58 ; reverse in bit 5
        lsr               ; 2 60 ; shift to bit 4
        lsr               ; 2 62 ; shift to bit 3
        sta REFP0         ; 3 65
        sta REFP1         ; 3 68
        lda DragonX       ; 3 71
        sec               ; 2 73
        sta WSYNC         ; 3 76 must have as READ_TWO_PADDLES
                          ;      could take from 21-23 cycles
;PosObject
DivideLoop1
        sbc #15           ;
        bcs DivideLoop1 ;+4    4
        eor #7
        asl
        asl
        asl
        asl            ;+10  14
        sta.wx HMP0,X  ;+5   19
        sta RESP0,X    ;+4   23
        sta WSYNC

        cpy BLyEvenRow    ; 3
        php               ; 3  6
        cpy M1yEvenRow    ; 3  9
        php               ; 3 12
        cpy M0yEvenRow    ; 3 15
        php               ; 3 18
        ldx #ENABL        ; 2 20
        txs               ; 2 22
        READ_TWO_PADDLES  ;23
        dey
        ldx DragonColor2
        stx COLUP1
        ldx #1
        lda DragonX
        sec
        sta WSYNC
;PosObject
DivideLoop2
        sbc #15           ;
        bcs DivideLoop2 ;+4    4
        eor #7
        asl
        asl
        asl
        asl            ;+10  14
        sta.wx HMP0,X  ;+5   19
        sta RESP0,X    ;+4   23
        sta WSYNC
        sta HMOVE         ; 3
        cpy BLyOddRow     ; 3  6
        php               ; 3  9
        cpy M1yOddRow     ; 3 12
        php               ; 3 15
        cpy M0yOddRow     ; 3 18
        php               ; 3 21
        ldx #ENABL        ; 2 24
        txs               ; 2 27
        READ_TWO_PADDLES  ;23 50
        bit DragonPass
        bvc dspm
        lda #$10          ; double size missile, normal size player
        .byte $2c
dspm
        lda #$15          ; 2 52 double size player & missile
        sta NUSIZ0        ; 3 55
        sta NUSIZ1        ; 3 58
        sta WSYNC
        dey
        cpy BLyEvenRow    ; 3
        sta WSYNC
        php                  ; 3
        cpy M1yEvenRow       ; 3  6
        php                  ; 3  9
        cpy M0yEvenRow       ; 3 12
        php                  ; 3 15
        ldx #ENAM0           ; 2 17 only drawing M0 in the dragon area
        txs                  ; 2 19
        READ_TWO_PADDLES     ;23 42
        sty SavedLineCounter ; 3 45 hold line counter during Dragon routines
        bit DragonControl    ; 3 48
        bpl NoDragon         ; 2 50
	bvs KGD2             ; 2 52 if V is set then frames are in 2nd bank
        jmp KernelGameDragon ;10 62
KGD2
        jmp KernelGameDragon2

NoDragon
        bit DeadPlayers
        bpl NoMessage
        jmp KernelGameDragon
NoMessage
        ldx #ENABL        ; 2 51
        txs               ; 2 53
        dey
        sta WSYNC
NDloop
        sta WSYNC
        cpy BLyOddRow     ; 3  4
        php               ; 3  7
        cpy M1yOddRow     ; 3 10
        php               ; 3 13
        cpy M0yOddRow     ; 3 16
        php               ; 3 19
        ldx #ENABL        ; 2 21
        txs               ; 2 22
        READ_TWO_PADDLES  ;23 45
        dey               ; 2 49
        sta WSYNC         ; 3 57
        sta WSYNC
        cpy BLyEvenRow    ; 3  4
        php               ; 3  7
        cpy M1yEvenRow    ; 3 10
        php               ; 3 13
        cpy M0yEvenRow    ; 3 16
        php               ; 3 19
        ldx #ENABL        ; 2 21
        txs               ; 2 22
        READ_TWO_PADDLES  ;23 45
        dey               ; 2 49
        sta WSYNC
        cpy #35
        bne NDloop
        jmp KernelGameBottom

StartRoundCode
        jsr InitRound
        lda #8
        sta REFP1
        lda GameOptions3  ; test for 2nd easter egg
        and #%00001000
        beq .OverscanWaitThenStartGame
        bit GameOptions
        bmi .OverscanWaitThenStartGame ; no blank walls for demo mode
        lda #0
        ldx #5+6
.loop
       sta Wall1L,x   ; uncomment this to blank left castles
       sta Wall2L,x   ; uncomment this to blank right castles
       sta Wall3L,x   ; uncomment this to blank right castles
       sta Wall4L,x   ; uncomment this to blank left castles
       dex
       bpl .loop


.OverscanWaitThenStartGame
        ldx    INTIM
        bpl    .OverscanWaitThenStartGame
        jmp    VerticalBlankGame


InitRound SUBROUTINE
        ldx #5
.loop
        lda WallInitA,x
        sta Wall1R,x
        sta Wall2L,x
        sta Wall3L,x
        sta Wall4R,x
        lda WallInitB,x
        sta Wall1L,x
        sta Wall2R,x
        sta Wall3R,x
        sta Wall4L,x
        lda #0
        bit GameOptions
        bmi irskip     ; don't reset sound registers in demo mode
        sta AUDC0,x    ;resets all 6 sound registers
irskip
        dex
        bpl .loop
;        lda #0
        sta SoundLeft
        sta SoundRight
        sta M0xPosHigh ; make sure off-screen fireballs
        sta M1xPosHigh ; take the least amount of CPU time
        sta BLxPosHigh ; to position
        ; sta AUDV0
        ; sta AUDF0
        ; sta AUDC0
        ; sta AUDV1
        ; sta AUDF1
        ; sta AUDC1
;        sta AIcatch
        sta M0State
        sta M1State
        sta BLState
        sta DeadPlayers
        sta M0DirSpeed ; speed = 0, not moving
        sta M1DirSpeed ; speed = 0, not moving
        sta BLDirSpeed ; speed = 0, not moving
        sta FireBallsInPlay

        lda #254
        sta DragonFrame
        lda #128
        sta M0yPosHigh ; off screen
        sta M1yPosHigh ; off screen
        sta BLyPosHigh ; off screen

        sta DragonControl ; turn on dragon

        lda #<Wings1TL1
        sta DragonG0
        lda #>Wings1TL1
        sta DragonG0+1
        lda #<Body1TL1
        sta DragonG1
        lda #>Body1TL1
        sta DragonG1+1
        lda #<Shift1LtoR
        sta DragonShift
        lda #>Shift1LtoR
        sta DragonShift+1

        lda ChaseSequence
        and #%00000010
        beq NormalLaunch

ChaseLaunch
        lda #<Shift1RtoL
        sta DragonShift
        lda #>Shift1RtoL
        sta DragonShift+1

        lda ChaseSequence  ; turn off chase sequence for next round
        and #%11111101
        sta ChaseSequence

        lda rand
        and #%00010000     ; select up or down
        ora #%11100000     ; chase off can be either sequence 14 or 15
        sta DragonAnim

        lda DragonDirection
        ora #%00000001
        sta DragonDirection ; direction = right-to-left
        lda DragonControl
        ora #%00100000
        sta DragonControl

        lda #150
        sta DragonX    ; starts on right edge instead of left
        lda #0
        sta DragonPass ; launch on first pass
        beq InitSkip

NormalLaunch
        lda rand
        asl
        asl
        and #%00110000 ; 1-4 passes before dragon launches fireball
        sta DragonPass
        bne irCrossScreen
        lda rand
        and #%00010000
        ora #%01000000  ;makes it seq 4 or 5 for a midway stop for launch
        bne irStoreAnim
irCrossScreen
        lda rand
        and #%00010000 ; picks 0 or 1 (fly across)
        ora #%01100000 ; this makes it seqeunce 6 or 7 for cross-screen
irStoreAnim
        sta DragonAnim
        lda DragonDirection
        and #%11111110     ; set direction left-to-right
        sta DragonDirection

        lda #0
        sta DragonX
InitSkip
        lda #FIREBALL_DELAY
        sta ExtraFireball

        rts

VerticalBlankMenuCode SUBROUTINE
        lda #$82
        sta WSYNC
        sta VSYNC         ; 3    start vertical sync, D1=1
        sta VBLANK        ; 3  6 start vertical blank and dump paddles to ground
        lda #$2C          ; 2  8 set timer for end of Vertical Blank
        sta TIM64T        ; 4 12
        sta WSYNC         ; 1st scan line of VSYNC
        inc Frame         ; bump frame count
; start of don't change section - it's timed for positioning of objects
        sta WSYNC         ; 2nd scan line of VSYNC
        lda #0         ; don't change from here to
        sta PF0
        sta PF1
        sta PF2
        sta REFP0
        sta REFP1
        sta COLUBK
        sta HMP1
        lda #$70          ; position ball for right SW extender
        sta HMBL
        sta WSYNC         ; 3rd scan line of VSYNC

        sta VSYNC         ; 3    stop vertical sync, D1=0
        inc MMcolor       ; 5  8 Medieval Mayhem logo color
        lda #3            ; 2 10
        sta NUSIZ0        ; 3 13 set triple copies of P0
        sta NUSIZ1        ; 3 16 set triple copies of P1
        sta VDELP0        ; 3 19 turn on vertical delay for P0
        sta VDELP1        ; 3 22 turn on vertical delay for P1
        lda #$F0          ; 2 24
        sta HMP0          ; 3 27 x adjust for P0
        nop  0            ; 3 30
        nop               ; 2 32
        nop               ; 2 34
        nop               ; 2 36
        sta RESP0         ; 3 39 set x for P0
        sta RESP1         ; 3 42 set x for P1
        nop
        nop
        nop
        nop
        nop
        nop 0
        sta RESBL         ; set ball
;end of don't change section
        sta WSYNC
        sta HMOVE         ; fine adjust for P0
        lda #%110001
        sta CTRLPF
        jmp CallMusicFromMainMenu
MusicReturnMainMenu
        ldx #0

        ldy TopOption   ; make sure TopOption is a valid (0-6)
        cpy #7          ; could be incorrect when returning from a game
        bcc CheckPlayersDisplayed
        ldy #0
        sty TopOption
        sty SelectedOption

CheckPlayersDisplayed
        cpy #0+1
        bcc ShowPlayers
        jmp CheckSpeedDisplayed
ShowPlayers
        lda SelectedOption
        bne SetPlayersGraphics
        stx HiLiteOption
SetPlayersGraphics
        lda #<OptionPlayerGrfx
        sta Option1,x
        inx
        lda #>OptionPlayerGrfx
        sta Option1,x
        inx

Check4Humans
        lda HumanPlayers
        cmp #%00001111
        bne Check3Humans
        lda #<Value4Grfx
        sta Option1,x
        inx
        lda #>Value4Grfx
        sta Option1,x
        inx
        jmp CheckSpeedDisplayed

Check3Humans
        cmp #%00000111
        bne Check2Humans
        lda #<Value3Grfx
        sta Option1,x
        inx
        lda #>Value3Grfx
        sta Option1,x
        inx
        jmp CheckSpeedDisplayed

Check2Humans
        cmp #%00000011
        bne Check1TLHuman
        lda #<Value2Grfx
        sta Option1,x
        inx
        lda #>Value2Grfx
        sta Option1,x
        inx
        jmp CheckSpeedDisplayed

Check1TLHuman
        cmp #%00000001
        bne Check1BRHuman
        lda #<Value1TopLeftGrfx
        sta Option1,x
        inx
        lda #>Value1TopLeftGrfx
        sta Option1,x
        inx
        jmp CheckSpeedDisplayed

Check1BRHuman
        cmp #%00000010
        bne Check1TRHuman
        lda #<Value1BottomRightGrfx
        sta Option1,x
        inx
        lda #>Value1BottomRightGrfx
        sta Option1,x
        inx
        jmp CheckSpeedDisplayed

Check1TRHuman
        cmp #%00000100
        bne Check1BLHuman
        lda #<Value1TopRightGrfx
        sta Option1,x
        inx
        lda #>Value1TopRightGrfx
        sta Option1,x
        inx
        jmp CheckSpeedDisplayed

Check1BLHuman
        cmp #%00001000
        bne CheckDoubleHumans
        lda #<Value1BottomLeftGrfx
        sta Option1,x
        inx
        lda #>Value1BottomLeftGrfx
        sta Option1,x
        inx
        jmp CheckSpeedDisplayed

CheckDoubleHumans
        cmp #%10001111
        bne SomethingsWrong
        lda #<ValueDoubles
        sta Option1,x
        inx
        lda #>ValueDoubles
        sta Option1,x
        inx
        jmp CheckSpeedDisplayed

SomethingsWrong
        lda #%00001111    ; we shouldn't get here, but if we do
        sta HumanPlayers  ; reset to 4 players
        jmp Check4Humans

CheckSpeedDisplayed
        cpy #1+1
        bcs CheckFireballsDisplayed
        lda SelectedOption
        cmp #1
        bne SetSpeedGraphics
        stx HiLiteOption
SetSpeedGraphics
        lda #<OptionSpeedGrfx
        sta Option1,x
        inx
        lda #>OptionSpeedGrfx
        sta Option1,x
        inx
        lda GameOptions
        and #%00001100
        lsr
        lsr
        bne NotSpeed1
        lda #<ValueKidsGrfx
        sta Option1,x
        inx
        lda #>ValueKidsGrfx
        sta Option1,x
        inx
        bne CheckFireballsDisplayed
NotSpeed1
        cmp #2-1       ; speed stored -1
        bne NotSpeed2
        lda #<ValueSlowGrfx
        sta Option1,x
        inx
        lda #>ValueSlowGrfx
        sta Option1,x
        inx
        .bne CheckFireballsDisplayed
NotSpeed2
        cmp #3-1      ; speed stored -1
        bne NotSpeed3
        lda #<ValueFastGrfx
        sta Option1,x
        inx
        lda #>ValueFastGrfx
        sta Option1,x
        inx
        .bne CheckFireballsDisplayed
NotSpeed3
        lda #<ValueMedievalGrfx
        sta Option1,x
        inx
        lda #>ValueMedievalGrfx
        sta Option1,x
        inx
        .bne CheckFireballsDisplayed


CheckFireballsDisplayed
        cpy #2+1
        bcs CheckCatch1Displayed
        lda SelectedOption
        cmp #2
        bne SetFireballsGraphics
        stx HiLiteOption
SetFireballsGraphics
        lda #<OptionFireballsGrfx
        sta Option1,x
        inx
        lda #>OptionFireballsGrfx
        sta Option1,x
        inx
	lda GameOptions
	and #%00000011
	cmp #1
	bne Not1Fireball

        lda #<Value1Grfx
        sta Option1,x
        inx
        lda #>Value1Grfx
        sta Option1,x
        inx
	bne CheckCatch1Displayed
Not1Fireball
	cmp #2
	bne Not2Fireballs
        lda #<Value2Grfx
        sta Option1,x
        inx
        lda #>Value2Grfx
        sta Option1,x
        inx
	bne CheckCatch1Displayed
Not2Fireballs
        lda #<Value3Grfx
        sta Option1,x
        inx
        lda #>Value3Grfx
        sta Option1,x
        inx

CheckCatch1Displayed
        cpy #3+1
        bcs CheckCatch2Displayed
        lda SelectedOption
        cmp #3
        bne SetCatch1Graphics
        stx HiLiteOption
SetCatch1Graphics
        lda #<OptionCatch1Grfx
        sta Option1,x
        inx
        lda #>OptionCatch1Grfx
        sta Option1,x
        inx
	lda #%00010000
	jsr ChangeCatchValue

CheckCatch2Displayed
        cpy #4+1
        bcs CheckCatch3Displayed
        cpx #16
        bne TestHiLiteCatch2
        jmp PrepLogo
TestHiLiteCatch2
        lda SelectedOption
        cmp #4
        bne SetCatch2Graphics
        stx HiLiteOption
SetCatch2Graphics
        lda #<OptionCatch2Grfx
        sta Option1,x
        inx
        lda #>OptionCatch2Grfx
        sta Option1,x
        inx
	lda #%00100000
	jsr ChangeCatchValue

CheckCatch3Displayed
        cpy #5+1
        bcs CheckCatch4Displayed
        cpx #16
        bne TestHiLiteCatch3
        jmp PrepLogo
TestHiLiteCatch3
        lda SelectedOption
        cmp #5
        bne SetCatch3Graphics
        stx HiLiteOption
SetCatch3Graphics
        lda #<OptionCatch3Grfx
        sta Option1,x
        inx
        lda #>OptionCatch3Grfx
        sta Option1,x
        inx
	lda #%01000000
	jsr ChangeCatchValue

CheckCatch4Displayed
        cpy #6+1
        bcs CheckFlashDisplayed
        cpx #16
        bne TestHiLiteCatch4
        jmp PrepLogo
TestHiLiteCatch4
        lda SelectedOption
        cmp #6
        bne SetCatch4Graphics
        stx HiLiteOption
SetCatch4Graphics
        lda #<OptionCatch4Grfx
        sta Option1,x
        inx
        lda #>OptionCatch4Grfx
        sta Option1,x
        inx
	lda #%10000000
	jsr ChangeCatchValue

CheckFlashDisplayed
        cpy #7+1
        bcs CheckNeedToWinDisplayed
        cpx #16
        bne TestHiLiteFlash
        jmp PrepLogo
TestHiLiteFlash
        lda SelectedOption
        cmp #7
        bne SetFlashGraphics
        stx HiLiteOption
SetFlashGraphics
        lda #<OptionFlashGrfx
        sta Option1,x
        inx
        lda #>OptionFlashGrfx
        sta Option1,x
        inx
	lda GameOptions
	and #%00110000
	bne .notNoFlash
        lda #<ValueNoGrfx
        sta Option1,x
        inx
        lda #>ValueNoGrfx
        sta Option1,x
        inx
	bne CheckNeedToWinDisplayed
.notNoFlash
	cmp #%00010000
	bne .notKingFlash
        lda #<ValueKingGrfx
        sta Option1,x
        inx
        lda #>ValueKingGrfx
        sta Option1,x
        inx
	bne CheckNeedToWinDisplayed
.notKingFlash
	cmp #%00100000
	bne .notCastleFlash
        lda #<ValueCastleGrfx
        sta Option1,x
        inx
        lda #>ValueCastleGrfx
        sta Option1,x
        inx
	bne CheckNeedToWinDisplayed
.notCastleFlash
        lda #<ValueYesGrfx
        sta Option1,x
        inx
        lda #>ValueYesGrfx
        sta Option1,x
        inx

CheckNeedToWinDisplayed
        cpy #8+1
        bcs CheckStartDisplayed
        cpx #16
        bne TestHiLiteNeedToWin
        jmp PrepLogo
TestHiLiteNeedToWin
        lda SelectedOption
        cmp #8
        bne SetNeedToWinGraphics
        stx HiLiteOption
SetNeedToWinGraphics
        lda #<OptionToWinGrfx
        sta Option1,x
        inx
        lda #>OptionToWinGrfx
        sta Option1,x
        inx
	lda GameOptions2
	and #%00001111
	cmp #1
	bne .not1
        lda #<Value1Grfx
        sta Option1,x
        inx
        lda #>Value1Grfx
        sta Option1,x
        inx
	bne CheckStartDisplayed
.not1
	cmp #3
	bne .not3
        lda #<Value3Grfx
        sta Option1,x
        inx
        lda #>Value3Grfx
        sta Option1,x
        inx
	bne CheckStartDisplayed

.not3
	cmp #5
	bne .not5
        lda #<Value5Grfx
        sta Option1,x
        inx
        lda #>Value5Grfx
        sta Option1,x
        inx
	bne CheckStartDisplayed

.not5
	cmp #7
	bne .not7
        lda #<Value7Grfx
        sta Option1,x
        inx
        lda #>Value7Grfx
        sta Option1,x
        inx
	bne CheckStartDisplayed
.not7
        lda #<Value9Grfx
        sta Option1,x
        inx
        lda #>Value9Grfx
        sta Option1,x
        inx

CheckStartDisplayed
        cpy #9+1
        bcs PrepLogo
        cpx #16
        bne TestHiLiteStart
        jmp PrepLogo
TestHiLiteStart
        lda SelectedOption
        cmp #9
        bne SetStartGraphics
        stx HiLiteOption
SetStartGraphics
        lda #<OptionStartGrfx
        sta Option1,x
        inx
        lda #>OptionStartGrfx
        sta Option1,x
        inx
        lda #<BlankGrfx
        sta Option1,x
        inx
        lda #>BlankGrfx
        sta Option1,x
        inx

PrepLogo ; moved to start of KernelMenu
        ; lda #<MMlogoA
        ; sta G48
        ; lda #>MMlogoA
        ; sta G48+1
        ; lda #<MMlogoB
        ; sta G48+2
        ; lda #>MMlogoB
        ; sta G48+3
        ; lda #<MMlogoC
        ; sta G48+4
        ; lda #>MMlogoC
        ; sta G48+5
        ; lda #<MMlogoD
        ; sta G48+6
        ; lda #>MMlogoD
        ; sta G48+7
        ; lda #<MMlogoE
        ; sta G48+8
        ; lda #>MMlogoE
        ; sta G48+9
        ; lda #<MMlogoF
        ; sta G48+10
        ; lda #>MMlogoF
        ; sta G48+11
        ; RANDOM
        ;
        ; lsr HiLiteOption
        ; lsr HiLiteOption
        ;
        ; ldy #9
        ; sty Paddle1

	jmp KernelMenu











ChangeCatchValue
	and GameOptions3     ; is catch on?
	beq Catch1No
	and GameOptions2     ; is limited on?
	beq Catch1Yes

        lda #<ValueLimitedGrfx
        sta Option1,x
        inx
        lda #>ValueLimitedGrfx
        sta Option1,x
        inx
	rts
Catch1Yes
        lda #<ValueYesGrfx
        sta Option1,x
        inx
        lda #>ValueYesGrfx
        sta Option1,x
        inx
	rts
Catch1No
        lda #<ValueNoGrfx
        sta Option1,x
        inx
        lda #>ValueNoGrfx
        sta Option1,x
        inx
	rts

WallInitA
        .byte %00111111, %00111111, %00111111; share with WIB, $ff, $ff, $ff
WallInitB
        .byte $FF, $FF, $FF, $F0, $F0, $F0

KingShape
        .byte zzXXX_____
        .byte zzXXX_____
        .byte zz________
        .byte zzXXXX____
        .byte zzX_X_____
        .byte zz___X____
        .byte zz_X_X____
        .byte zz_X______
        .byte 0,0,0,0,0,0,0,0 ; shape for 2 dead kings
KingShape5thBit
        .byte zz________
        .byte zz________
        .byte zz________
        .byte zzX_______
        .byte zz________
        .byte zzX_______
        .byte zzX_______
        .byte zz________
        .byte 0,0,0,0,0,0,0,0 ; shape for 2 dead kings

        echo "----",($FF80 - *) , "bytes of BANK 8 ROM left"

       ORG $FF80
       RORG $FF80

TopShieldFacingDown
        .byte zz________
        .byte zz__XXXX__
        .byte zz_XXXXXX_
        .byte zzXXXXXXXX
        .byte zzXXXXXXXX
        .byte zzXX____XX
        .byte zzX______X
        .byte zz________

        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows

TopShieldFacingSideways
        .byte zz________
        .byte zzXXXXX___
        .byte zz_XXXXX__
        .byte zz__XXXXX_
        .byte zz__XXXXX_
        .byte zz__XXXXX_
        .byte zz_XXXXX__
        .byte zzXXXXX___

        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows

TopShieldFacingDiagonal
        .byte zz___XXX__
        .byte zz__XXXXX_
        .byte zz_XXXXXXX
        .byte zzXXXXXXXX
        .byte zz___XXXXX
        .byte zz____XXX_
        .byte zz____XX__
        .byte zz____X___
TopShieldDead
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows
        .byte 0,0,0,0,0,0,0,0 ; 2 brick rows
        .byte 0,0,0,0,0,0,0,0 ; for "dead" shape
        ORG $FFF4
        BANKS_AND_VECTORS
