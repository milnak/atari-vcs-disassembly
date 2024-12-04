; Disassembly of Stone Age (CCE)
; By Omegamatrix
; Last update Jan 19, 2013
;
;
;
; See this thread for more information:
; http://atariage.com/forums/topic/67442-stone-age-cce/
;
;
; The Stone Age rom came from the pirate company CCE. It is believed that CCE "acquired" the rom somehow from TechnoVision,
; and then did a poor job converting it to 60Hz. This assembly can compile a much better version of the NTSC rom, and can create
; a PAL or PAL60 rom. Numerous changes are in place, and a brief list of what was done for the new versions are as follows:
;
; 1) Changed colors from PAL to NTSC (for NTSC version).
; 2) Fixed scanline count (from 246) to 262.
;      - reduced some of the blank, unused screen from below the score bar to the first row of stones
;      - centered the screen better
; 3) Added the TechnoVision logo. The logo color was also changed to black.
; 4) Swapped the players around. The CCE rom had the first player using the right joystick port, which is backwards.
;      - switched joysticks and firebuttons
;      - switched difficulty settings, so the first player uses the left difficultly switch
;      - switched the lives display so that the first players lives is displayed on the left
; 5) Swapped the hard and easy setting around. The CCE rom had the "B" setting as hard, which is backwards.
; 6) Fixed a direction bug. If two directions were pressed at once, then the Caveman would always throw a stone to the right.
; 7) Enabled some dinosaur graphics that were in the rom, but never used. Now the dinosaurs are more animated.
; 8) Reduced the volume of the main music theme. The original blasted it out at full volume, and it hurt.
; 9) Fixed positioning bug for columns 5 and 10. The dinosaur and caveman would be off by 1 pixel in these columns.
;
;
; I'm not sure if the disassembly is 100% correct about the dinosaur movement logic, but I'm out of steam on this project. The
; disassembly is good in all the other places that I can see.
;
;
; In general the programmer reused their code a lot. The same logic for checking the stones and updating pointers appears all
; over the rom. There were very slight changes to the re-used code such as different branch condition, other times a variable
; might get updated. If a person were to hack the rom further then I would suggest to start by writing a subroutine that handled
; all of the stone/enemy/boundary checks. It would be a real good idea to make that routine check the stone bits using tables
; instead of shifting each time. There is a ton of ram not used, and a ton more that can be reclaimed. A lot of ram is only using
; 1 bit out of 8. I think the game could easily check all dinosaurs and the caveman for movement options and collisions each frame.
; It would be better to do some and get rid of some the bugs which are probably resulting from tasks spread over many frames.
; The caveman row/column ram bytes should be combined into one like the dinosaur ones are. The graphic pointers should be loaded
; through an index table. All of these things would greatly simplify the code making it shorter, faster, less error prone, and
; easier to troubleshoot. After that the kernel could be looked at, with the idea of multiplexing the sprites so the flicker goes
; down.
;
;
;
;
; NOTES:
; - Colors in the CCE rom were PAL, when changed to NTSC the caveman changed to having a pink skin color instead of blue.
; - Level 1's stone data appears in another place in the rom, and is unused. It looks like it was put there while the
;   StoneHorzPosTab or StoneShapesTab's were being constructed, and then forgotten or ignored.
; - There is some garbage bytes at the end of the rom. It might be code... but more likely data from something else. Be interesting
;   to match it to other roms. I took a look and the other Technovision roms don't have these bytes.
; - Joystick and difficulty settings were reversed from normal. Perhaps a pirate console was used?
; - Some dinosaur graphics were never used. I have restored these to animate them.
; - There is no way of increasing lives. The GAME_OVER_FLAG depends on P0 dieing before P1,
;   otherwise it would get screwed up and end game when P1 lost their final life even if P0 still had some lives left.
; - The translated manual says dinosaurs can escape through the stones. I haven't seen this, but did notice one time
;   that I was able to pushing right above the dinosaur, and then the dinosaur moved on top of the stone and out.
;   Looks like a glitch in the programming (probably frame sequencing).
; - Dinosaurs and Caveman freeze in place while a stone is in motion.
; - The scores toggle after the game is over, if it was a two player game.
; - Hardware collisions, muliplexing dinosaurs, and sequencing things on different frames all leads to the cavemna walking through dinosaurs sometimes.
; - Channel zero's audio registers control the main theme, everything else including the starting theme is done channel one.
; - The music is very irritating. The melody should be kept, but the tone is just to sharp, and volume to loud.
; - The stone throwing logic is wrong, if you press 2 directions at once then the stone to the right will get thrown (if there is one).
;   It doesn't matter which directions are pressed either, pressing two at once will always default to a right throw.
; - The above direction mistake is also repeated in the logic to move the stone.
; - And again, the direction logic error is repeated in the caveman movement...
; - The dinosaurs being able to jump out of "traps" might be caused by using 2 different indexes.
; - both column 5 and 10 had a shift value off by one pixel. I've included a fix so the positioning in every column is the same.



      processor 6502

      LIST OFF
      include vcs.h
      include macro107.h
      include stoneAge.h
      include colors.h
      LIST ON

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      USER CONSTANTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ORIGINAL               = 0 ; 1 = CCE version
PAL                    = 0 ; 0 = NTSC
PAL_60                 = 0 ; 0 = NTSC

  IF ORIGINAL
CCE_LOGO               = 1
TECHNOVISION_LOGO      = 0
REVERSED_CONTROLS      = 1
BAD_DIRECTIONS         = 1
OFF_CENTER_POSITION    = 1
TIME_VBLANK            = 32
COL_NTSC               = 0
COL_LOGO               = COL_D6

TONE_MAIN_THEME        = $04
FREQ_START_MAIN_THEME  = $12
VOL_MAIN_THEME         = $0F

  ELSE
;---------------------------------------
CCE_LOGO               = 0
TECHNOVISION_LOGO      = 1
REVERSED_CONTROLS      = 0
BAD_DIRECTIONS         = 0
OFF_CENTER_POSITION    = 0
ANIMATE_DINO           = 1   ; animate the dinosaur with graphics previously not called

    IF PAL
TIME_VBLANK            = 55
COL_NTSC               = 0
OVERSCAN_DELAY         = 54  ; scanlines
    ELSE
TIME_VBLANK            = 39
      IF PAL_60
COL_NTSC               = 0
      ELSE
COL_NTSC               = 1
      ENDIF
OVERSCAN_DELAY         = 17  ; scanlines
    ENDIF

TONE_MAIN_THEME        = $04
FREQ_START_MAIN_THEME  = $12  ; this quickly changes to a different value
VOL_MAIN_THEME         = $08  ; lower the volume

COL_LOGO               = COL_00
;---------------------------------------
  ENDIF


;colors
COL_P0                 = COL_42
COL_P1                 = COL_94

COL_SCORE              = COL_2A
COL_SCORE_BAR_P0       = COL_P0
COL_SCORE_BAR_P1       = COL_P1
COL_LOGO_BAR           = COL_DA
COL_PF_STONES          = COL_2A
COL_PF_STONES_BLUE     = COL_B8  ; time almost done!

COL_DINO1              = COL_36
COL_DINO2              = COL_56
COL_DINO3              = COL_BA
COL_DINO4              = COL_16

  IF REVERSED_CONTROLS
COL_LIVES_LEFT_PF      = COL_P1
COL_LIVES_RIGHT_PF     = COL_P0
  ELSE
COL_LIVES_LEFT_PF      = COL_P0
COL_LIVES_RIGHT_PF     = COL_P1
  ENDIF

;stone graphics
STONE_PAT_1  = %0111
STONE_PAT_2  = %0101

;flip the graphics for PF0, and PF2
STONE_PAT_1_FLIPPED = ((STONE_PAT_1 & %0001) << 3) | ((STONE_PAT_1 & %0010) << 1) | ((STONE_PAT_1 & %0100) >> 1) | ((STONE_PAT_1 & %1000) >> 3)
STONE_PAT_2_FLIPPED = ((STONE_PAT_2 & %0001) << 3) | ((STONE_PAT_2 & %0010) << 1) | ((STONE_PAT_2 & %0100) >> 1) | ((STONE_PAT_2 & %1000) >> 3)

RESET_SWITCH           = (1 << 0)
SELECT_SWITCH          = (1 << 1)
DIFFICULTY_SWITCH_P1   = (1 << 6)

START_LIVES            = 3    ; lives display is not set up to handle any more than 3 lives...
SELECT_GAME_MODE       = 1    ; toggles between 1 and 2 player games by EOR'ing the player number
NUM_OF_DINOSAURS       = 4    ; the game is not set up to handle more
NUM_OF_DINO_MASK       = $03  ; dinosaurs are zero-based (0, 1, 2, and 3)

;flags
CAVEMAN_MOVEMENT_FLAG  = 1
CLEAR_CAVEMAN_FLAG     = 0    ; (~CAVEMAN_MOVEMENT_FLAG & CAVEMAN_MOVEMENT_FLAG)
ALLOW_JOYSTICK_FLAG    = (1 << 7)
GAME_OVER_FLAG         = -1 & $FF
DEAD_DINOSAUR_FLAG     = 0
STONE_CRUSHED_FLAG     = 1
STONE_NOT_CRUSHED_FLAG = 0
;both of these flags are not essential to the routines that use them,
;they could easily be written out.
STONE_MOVING_FLAG      = (1 << 7)
STONE_NOT_SLIDING_FLAG = 0    ; (~STONE_MOVING_FLAG & STONE_MOVING_FLAG)


TIME_LIMIT             = 75   ; total frames before you die (out of time)
TIME_WARNING           = 15   ; the stones change color when the time warning occurs


;masks
ODD_EVEN_PTRS_MASK     = $01
PF0_INDEX_MASK         = $10
PF1_INDEX_MASK         = $0C
PF2_INDEX_MASK         = $03
LEVEL_MASK             = $0F
DELAY_POS_MASK         = $0F  ; separate the delay loop value from HMPx value in the positioning routines.
RIGHTSIDE_PF_MASK      = $01  ; the index is an odd number when indexing the stone data for the rightside of the PF

EIGHT_FRAME_MASK       = $07
SIXTEEN_FRAME_MASK     = $0F
THIRTY_TWO_FRAME_MASK  = $1F
SIXTY_FOUR_FRAME_MASK  = $3F


MUSIC_MASK             = EIGHT_FRAME_MASK
HARD_SETTING_MASK      = EIGHT_FRAME_MASK       ; AND'd with framecounter, dinosaurs move twice as fast
EASY_SETTING_MASK      = SIXTEEN_FRAME_MASK     ; AND'd with framecounter, slow dinosaur movement...
DEATH_FRAMES_MASK      = SIXTEEN_FRAME_MASK
CRUSHED_STONE_MASK     = THIRTY_TWO_FRAME_MASK
SECONDS_MASK           = SIXTY_FOUR_FRAME_MASK  ; 64 is ~60fps, close to 1 second, but not so close if doing 50fps

;- frameCounter is incremented right before VSYNC starts
;- frameCounter is decremented once every 16 frames if the joystick is being pressed.
;- frameCounter is set to zero when a new level starts, or the death sequence starts.

;masked zero frame events
;1) SECONDS_MASK & frameCounter == 0, secondsCounter is increased. secondsCounter is checked on a masked subframe 1
;2) MUSIC_MASK & frameCounter == 0, starting tune or main music theme is updated.
;3) DEATH_FRAMES_MASK & frameCounter == 0, move to next animation in death sequence.
;4) frameCounter == 0, the player number gets toggled to show each score after both players are dead
;5) frameCounter == 0, the following code is executed before overscan ends, but seems to have no effect?
;     ldx    dinoDrawIndex
;     lda    dinoDirection,X
;     ora    #DIRECTION_MASK
;     sta    dinoDirection,X

;other masked frame events
TIME_LEFT_SUBFRAME     = 1  ; masked by EIGHT_FRAME_MASK
DINO_MOVE_CHOICES_SUBFRAME  = 1 ; masked by EIGHT_FRAME_MASK (hard setting) or SIXTEEN_FRAME_MASK (easy setting)
DINO_DO_MOVEMENT_SUBFRAME   = 2  ; masked by EIGHT_FRAME_MASK (hard setting) or SIXTEEN_FRAME_MASK (easy setting)
STONE_UPDATE_SUBFRAME  = 6  ; masked by EIGHT_FRAME_MASK
CHECK_THROW_SUBFRAME   = 6  ; masked by EIGHT_FRAME_MASK
CRUSHED_STONE_SUBFRAME = 6  ; masked by THIRTY_TWO_FRAME_MASK
LEVEL_DONE_SUBFRAME    = 7  ; masked by EIGHT_FRAME_MASK
SCORE_UPDATE_SUBFRAME  = 7  ; masked by EIGHT_FRAME_MASK
DINO_POINTS_SUBFRAME   = 7  ; masked by EIGHT_FRAME_MASK


EIGHT_BITS             = 8

;caveman
UP_DIRECTION           = (1 << 0)
DOWN_DIRECTION         = (1 << 1)
LEFT_DIRECTION         = (1 << 2)
RIGHT_DIRECTION        = (1 << 3)
DIRECTION_MASK         = (RIGHT_DIRECTION | LEFT_DIRECTION | DOWN_DIRECTION | UP_DIRECTION)
CURRENT_DIR_MASK       = (DIRECTION_MASK << 4)
JOY_NOT_PRESSED        = -1 & $FF ; (~DIRECTION_MASK | DIRECTION_MASK)  ; used by CheckForStoneThrow SUBROUTINE, as joystick needs to be pressed to throw a stone

;dinosaurs, direction they are moving
TRAVEL_UP              = (UP_DIRECTION << 4)
TRAVEL_DOWN            = (DOWN_DIRECTION << 4)
TRAVEL_LEFT            = (LEFT_DIRECTION << 4)
TRAVEL_RIGHT           = (RIGHT_DIRECTION << 4)

;dinosaurs, suppress the direction opposite to current travel
UP_NOT_ALLOWED_MASK    = (~UP_DIRECTION & DIRECTION_MASK)
DOWN_NOT_ALLOWED_MASK  = (~DOWN_DIRECTION & DIRECTION_MASK)
LEFT_NOT_ALLOWED_MASK  = (~LEFT_DIRECTION & DIRECTION_MASK)
RIGHT_NOT_ALLOWED_MASK = (~RIGHT_DIRECTION & DIRECTION_MASK)

;dinosaurs, direction clear of stones or boundaries
UP_IS_CLEAR            = CURRENT_DIR_MASK | UP_DIRECTION
DOWN_IS_CLEAR          = CURRENT_DIR_MASK | DOWN_DIRECTION
LEFT_IS_CLEAR          = CURRENT_DIR_MASK | LEFT_DIRECTION
RIGHT_IS_CLEAR         = CURRENT_DIR_MASK | RIGHT_DIRECTION

;stones, when thrown
STONE_UP_DIR           = (STONE_MOVING_FLAG | ~UP_DIRECTION) & $FF
STONE_DOWN_DIR         = (STONE_MOVING_FLAG | ~DOWN_DIRECTION) & $FF
STONE_LEFT_DIR         = (STONE_MOVING_FLAG | ~LEFT_DIRECTION) & $FF
STONE_RIGHT_DIR        = (STONE_MOVING_FLAG | ~RIGHT_DIRECTION) & $FF


NUM_OF_COLUMNS         = 10
NUM_OF_ROWS            = 8
TOP_ROW                = 1            ; the game uses 1 as top row to 8 as bottom row, but the macros I constructed flip it around
BOTTOM_ROW             = NUM_OF_ROWS  ; because it is more natural to to me to think of going up as "increasing" values...

ZERO_INDEX_CORRECTION  = 1
TWO_BYTES              = 2
ONE_ROW_OF_BYTES       = TWO_BYTES
TOP_ROW_BYTE_INDEX     = TOP_ROW * TWO_BYTES
BOTTOM_ROW_BYTE_INDEX  = (BOTTOM_ROW * TWO_BYTES) - ONE_ROW_OF_BYTES

HEIGHT_LOGO_NUM        = 8
HEIGHT_LIVES_DISPLAY   = 5
HORIZ_POSITION_DISPLAY = 8            ; delay value for positioning score, logo. If value is changed then the loop which draws
                                      ; the score/logo must also be changed so the digit graphics are updated at the correct time.

CRUSHED_ROCK_POINTS    = ($10 >> 4) ; BCD, one's digit is hardcoded as zero

LEFTMOST_COLUMN        = 1
RIGHTMOST_COLUMN       = NUM_OF_COLUMNS
DINO_COLUMN_MASK       = $0F
ONE_COLUMN             = 1            ; for incrementing/decrementing columns
ONE_ROW                = (1 << 4)     ; for incrementing/decrementing rows
COLUMN_INDEX_START     = (LEFTMOST_COLUMN + EIGHT_BITS-(NUM_OF_COLUMNS/2))
COLUMN_INDEX_END       = EIGHT_BITS
SHIFT_STONE_5          = EIGHT_BITS
SHIFT_STONE_6          = EIGHT_BITS-(NUM_OF_COLUMNS/2)
SHIFT_UNUSED_BITS      = EIGHT_BITS-(NUM_OF_COLUMNS/2)
ONE_STONE              = (1 << 7)     ; shifts until in postion

DEAD_DINO_POS          = 1    ; set row to zero, column to 1

DEATH_GFX_INDEX        = ((EndDeathPtrs - DeathGfxPtrs)/2 -1)



;audio
STARTING_TUNE_LENGTH   = (FinishLevelBeginFreqTab - LevelBeginFreqTab)
MAIN_THEME_LENGTH      = (ThemeSongFinish - ThemeSongFreqTab)

TONE_START_TUNE        = $04
VOL_START_TUNE         = $0F

FREQ_CRUSHED_STONE     = $05
VOL_CRUSHED_STONE      = $0B

TONE_DEATH             = $06
FREQ_DEATH             = $03
VOL_DEATH              = $0D

FREQ_DEAD_DINO         = $01

FREQ_STONE_SLIDING     = $07

;found in "DO_STONE_THROW" macro
TONE_SLIDING_STONE     = $03
FREQ_SLIDING_STONE     = $07
VOL_SLIDING_STONE      = $0D




;REFPx
NO_REFLECT             = 0
REFLECT_GFX            = (1 << 3)

;CTRLPF
REFLECT_PF             = 1

;HMxx
LEFT_7                 = ( 7 << 4)
LEFT_6                 = ( 6 << 4)
LEFT_5                 = ( 5 << 4)
LEFT_4                 = ( 4 << 4)
LEFT_3                 = ( 3 << 4)
LEFT_2                 = ( 2 << 4)
LEFT_1                 = ( 1 << 4)
NO_MOTION              = ( 0 << 4)
RIGHT_1                = (-1 << 4) & $FF
RIGHT_2                = (-2 << 4) & $FF
RIGHT_3                = (-3 << 4) & $FF
RIGHT_4                = (-4 << 4) & $FF
RIGHT_5                = (-5 << 4) & $FF
RIGHT_6                = (-6 << 4) & $FF
RIGHT_7                = (-7 << 4) & $FF
RIGHT_8                = (-8 << 4) & $FF

;NUSIZx
ONE_COPY               = 0
TWO_COPIES_CLOSE       = 1
TWO_COPIES_MED         = 2
THREE_COPIES_CLOSE     = 3
TWO_COPIES_WIDE        = 4
DOUBLE_SIZE            = 5
THREE_COPIES_MED       = 6
QUAD_SIZE              = 7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      RIOT RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

gameMode              ds 1  ; $80  0 = one player game, 1 = two player game
frameCounter          ds 1  ; $81
secondsCounter        ds 1  ; $82  Not precisely 1 second, increments every 64 frames
rowCounter            ds 1  ; $83
rowCaveman            ds 1  ; $84
rowCurrentDino        ds 1  ; $85
cavemanPtr            ds 2  ; $86-$87
;---------------------------------------
tempPtr               ds 2  ; $88-$89
dinosaurPtr           equ tempPtr
;---------------------------------------
scorePtrs             ds 8  ; $8A-$91
stoneOrder            ds 16 ; $92-A1
stoneGfxA_Pf0Left     ds 1  ; $A2  stone PF shapes, solid lines
stoneGfxA_Pf1Left     ds 1  ; $A3
stoneGfxA_Pf2Left     ds 1  ; $A4
stoneGfxA_Pf0Right    ds 1  ; $A5
stoneGfxA_Pf1Right    ds 1  ; $A6
stoneGfxA_Pf2Right    ds 1  ; $A7
indexGraphics         ds 1  ; $A8
indexStoneBytes       ds 1  ; $A9
cavemanColPtr         ds 2  ; $AA-$AB
indexFreq             ds 1  ; $AC
;---------------------------------------
tempOne               ds 1  ; $AD
t1_digitFour          equ tempOne
t1_dinoDirection      equ tempOne
t1_dinoMoveChoices    equ tempOne
t1_singleStone        equ tempOne
t1_dinoColumn         equ tempOne
t1_dinoRow            equ tempOne
t1_defaultDino        equ tempOne
;---------------------------------------
tempTwo               ds 1  ; $AE
t2_loopCount          equ tempTwo
t2_attractDirection   equ tempTwo
t2_dinoCurrentDir     equ tempTwo
;---------------------------------------
columnCaveman         ds 1  ; $AF
reflectCaveman        ds 1  ; $B0
columnCurrentDino     ds 1  ; $B1
;---------------------------------------
ram_B2                ds 1  ; $B2
currentDinoRow        equ ram_B2
indexStoneByteDino    equ ram_B2
indexStoneByteCaveman equ ram_B2
indexStoneByteThrow   equ ram_B2
;---------------------------------------
ram_B3                ds 1  ; $B3
currentDinoColumn     equ ram_B3
stoneBitDinoIsOn      equ ram_B3
stoneBitCavemanIsOn   equ ram_B3
stoneColumnThrowIsOn  equ ram_B3
;---------------------------------------
obstacleFreeDir       ds 1  ; $B4
reflectDinoGfx        ds 4  ; $B5-$B8
dinoLoPtr             ds 4  ; $B9-$BC
dinoColors            ds 4  ; $BD-$C0   color is cleared to 0 when dinosaur is dead, used as a marker to skip over to next dinosaur
dinoDrawIndex         ds 1  ; $C1       selects which dinosaur to draw, 1-4. incremented every frame
dinoPosition          ds 4  ; $C2-$C5
dinoMoveIndex         ds 1  ; $C6       incremented every 16 or 8 frames, depending on difficulty settings mask
movingStone           ds 1  ; $C7       direction stone is moving
stoneThrowFlag        ds 1  ; $C8
;---------------------------------------
;ScoreBcdLow to deathCounter are cleared in a loop when a level is started.

scoreBcdLow           ds 2  ; $C9-$CA
scoreBcdMid           ds 2  ; $CB-$CC
levelNum              ds 2  ; $CD-$CE   P0=$CD P1=$CE  ; no more then 16 levels. Level is stored minus 1, running 0-15.
playerNum             ds 1  ; $CF       P0=0,  P1=1
startTuneCount        ds 1  ; $D0
deathCounter          ds 1  ; $D1
;---------------------------------------
numOfLivesP0          ds 1  ; $D2
numOfLivesP1          ds 1  ; $D3
  IF REVERSED_CONTROLS
numOfLivesLeftPf      equ numOfLivesP1
numOfLivesRightPF     equ numOfLivesP0
  ELSE
numOfLivesLeftPf      equ numOfLivesP0
numOfLivesRightPF     equ numOfLivesP1
  ENDIF
;---------------------------------------
currentJoystick       ds 1  ; $D4  P0 or P1
currentFirebutton     ds 1  ; $D5  INPT4 or INPT5
difficultyP0          ds 1  ; $D6
difficultyP1          ds 1  ; $D7
dinoDirection         ds 4  ; $D8-$DB
colStones             ds 1  ; $DC
pointsMultiplier      ds 1  ; $DD  each dino killed in 1 shot increases multiplier
switchesEor           ds 1  ; $DE
joystickDelay         ds 1  ; $DF
StoneGfxB_Pf0Left     ds 1  ; $E0  stone PF shapes, dashed lines
StoneGfxB_Pf1Left     ds 1  ; $E1
StoneGfxB_Pf2Left     ds 1  ; $E2
StoneGfxB_Pf0Right    ds 1  ; $E3
StoneGfxB_Pf1Right    ds 1  ; $E4
StoneGfxB_Pf2Right    ds 1  ; $E5
moveCavemanFlag       ds 1  ; $E6

freeRam               ds 25 ; $E7-$FF   free except for return address being pushed on the stack

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      MAIN PROGRAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE
       ORG $F000,0

START:
    ldx    #$FF
    txs
    cld
    ldx    #0
    lda    #0
.loopClear:
    sta    0,X
    dex
    bne    .loopClear


    jsr    NewScreenPrep
    lda    #TONE_MAIN_THEME
    sta    AUDC0                 ; this is the only place AUDC0 gets written to, in the whole game
    lda    #FREQ_START_MAIN_THEME
    sta    AUDF0
    lda    #>Zero
    sta    scorePtrs+1
    sta    scorePtrs+3
    sta    scorePtrs+5
    sta    scorePtrs+7
    lda    #GAME_OVER_FLAG
    sta    deathCounter          ; Mark the game as over. Reset or select will clear the flag.
    sta    switchesEor           ; #$FF, to toggle the active low switches to active high, followed with AND'd the switch bit
LoopMain:
    jsr    FinishOverscanVsync
    jsr    CheckSwitches
    jsr    CheckForDeath
    jsr    CheckIfLevelDone      ; if no stone thrown
    jsr    CheckTimeRemaing
    jsr    MoveCavemanUpdateGfx  ; if no stone thrown
    jsr    CheckWhereDinoCanMove ; if no stone thrown
    jsr    MoveDinosaur          ; if no stone thrown
    jsr    CheckForStoneThrow    ; if no stone thrown
    jsr    UpdateStones          ; when stone is thrown
    jsr    AddSquishedDinoScore  ; when stone is thrown
DoScorePrep:
    jsr    GetScorePtrs
    jsr    DrawScreen
    jmp    LoopMain

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  IF ORIGINAL

DrawScreen SUBROUTINE ;x1
    lda    #0
    sta    rowCounter
    lda    #THREE_COPIES_CLOSE
    sta    NUSIZ0
    lda    #TWO_COPIES_CLOSE
    sta    NUSIZ1

.loopWaitVblank:
    lda    INTIM
    bne    .loopWaitVblank

    sta    WSYNC
;---------------------------------------
    sta    VBLANK
    ldx    #HORIZ_POSITION_DISPLAY
    sta    WSYNC
;---------------------------------------
loopPositionScore:
    dex
   sbne    loopPositionScore
    sta    RESP0
    sta    RESP1
    lda    #LEFT_1
    sta    HMP1
    sta    WSYNC
;---------------------------------------
    sta    HMOVE
    lda    #COL_SCORE_BAR_P0
    ldy    playerNum
    beq    .doScoreColors
    lda    #COL_SCORE_BAR_P1
.doScoreColors:
    sta    WSYNC
;---------------------------------------
    sta    COLUBK
    lda    #COL_SCORE
    sta    COLUP0
    sta    COLUP1
    ldy    #0
    sta    WSYNC
    sta    WSYNC
.loopDrawScore:
    sta    WSYNC
;---------------------------------------
    lda    (scorePtrs),Y         ;5  @5
    sta    GRP0                  ;3  @8
    lda    (scorePtrs+2),Y       ;5  @13
    sta    GRP1                  ;3  @16
    lda    (scorePtrs+4),Y       ;5  @21
    tax                          ;2  @23
    lda    (scorePtrs+6),Y       ;5  @28
    sta    t1_digitFour          ;3  @31
    sty    t2_loopCount          ;3  @34
    lda    Zero,Y                ;4  @38     Always zero
    ldy    t1_digitFour          ;3  @41
    nop                          ;2  @43
    nop                          ;2  @45
    stx    GRP0                  ;3  @48
    sty    GRP1                  ;3  @51
    sta    GRP0                  ;3  @54
    ldy    t2_loopCount          ;3  @57
    iny                          ;2  @59
    cpy    #HEIGHT_LOGO_NUM      ;2  @61
    bne    .loopDrawScore        ;2³ @63/64

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; prep for playscreen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    sta    WSYNC
;---------------------------------------
    lda    #0
    sta    GRP0
    sta    GRP1
    sta    WSYNC
    sta    WSYNC
;---------------------------------------
    sta    COLUBK                ; black
    lda    #DOUBLE_SIZE
    sta    NUSIZ0
    sta    NUSIZ1
    ldx    #-ONE_ROW_OF_BYTES    ; each loop starts by incrementing the stone byte index for the next row, so offset it for the start
    stx    indexStoneBytes
    lda    reflectCaveman
    sta    REFP0
    ldx    columnCaveman
    dex
    lda    StoneHorzPosTab,X
    sta    WSYNC
;---------------------------------------
    tax
    sta    HMCLR
    sta    HMP0
    and    #DELAY_POS_MASK
    tax
loopPosCaveman:
    dex
   sbne    loopPosCaveman
    sta    RESP0
    sta    WSYNC
;---------------------------------------
    sta    HMOVE
    sta    WSYNC
;---------------------------------------
    lda    #NO_MOTION
    sta    HMP0
    sta    HMP0
    ldx    dinoDrawIndex
    lda    reflectDinoGfx,X
    sta    REFP1
    lda    dinoLoPtr,X
    sta    dinosaurPtr
    ldx    columnCurrentDino
    dex
    lda    StoneHorzPosTab,X
    sta    WSYNC
;---------------------------------------
    tax
    sta    HMCLR
    sta    HMP1
    and    #DELAY_POS_MASK
    tax
loopPosDino:
    dex
   sbne    loopPosDino
    sta    RESP1
    sta    WSYNC
;---------------------------------------
    sta    HMOVE
    sta    WSYNC
;---------------------------------------
    lda    #NO_MOTION
    sta    HMP1
    ldy    colStones
    sty    COLUPF
    ldx    dinoDrawIndex
    lda    dinoColors,X
    sta    COLUP1
    ldx    #0

   ELSE

DrawScreen SUBROUTINE ;x1
    lda    #0
    sta    rowCounter
    lda    #THREE_COPIES_CLOSE | (LEFT_1 << 1)
    sta    NUSIZ0
    lsr                          ; A=$11, TWO_COPIES_CLOSE, missiles not used...
    sta    NUSIZ1

.loopWaitVblank:
    ldx    INTIM
    bne    .loopWaitVblank

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; prep for score
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    sta    WSYNC
;---------------------------------------
    sta    HMP1
    ldx    #HORIZ_POSITION_DISPLAY-1
loopPositionScore:
    dex
   sbne    loopPositionScore
    sta    RESP0
    sta    RESP1
    sta    WSYNC
;---------------------------------------
    sta    HMOVE

    sta    WSYNC
;---------------------------------------
    sta    VBLANK
    lda    #COL_SCORE_BAR_P0
    ldy    playerNum
    beq    .doScoreColors
    lda    #COL_SCORE_BAR_P1
.doScoreColors:
    sta    COLUBK
    lda    #COL_SCORE
    sta    COLUP0
    sta    COLUP1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; draw the score
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ldy    #0
.loopDrawScore:
    sta    WSYNC                 ;3
;---------------------------------------
    lda    (scorePtrs),Y         ;5  @5
    sta    GRP0                  ;3  @8
    lda    (scorePtrs+2),Y       ;5  @13
    sta    GRP1                  ;3  @16
    lda    (scorePtrs+4),Y       ;5  @21
    tax                          ;2  @23
    lda    (scorePtrs+6),Y       ;5  @28
    sta    t1_digitFour          ;3  @31
    sty    t2_loopCount          ;3  @34
    lda    Zero,Y                ;4  @38     Always zero
    ldy    t1_digitFour          ;3  @41
    nop                          ;2  @43
    nop                          ;2  @45
    stx    GRP0                  ;3  @48
    sty    GRP1                  ;3  @51
    sta    GRP0                  ;3  @54
    ldy    t2_loopCount          ;3  @57
    iny                          ;2  @59
    cpy    #HEIGHT_LOGO_NUM      ;2  @61
    bne    .loopDrawScore        ;2³ @63/64

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; prep for playscreen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    sta    WSYNC                 ; 3
;---------------------------------------
;     lda    #0
;     sta    GRP0
;     sta    GRP1
    sta    COLUBK                ; black
    lda    #DOUBLE_SIZE
    sta    NUSIZ0
    sta    NUSIZ1
    ldx    #-ONE_ROW_OF_BYTES    ; each loop starts by incrementing the stone byte index for the next row, so offset it for the start
    stx    indexStoneBytes
    lda    reflectCaveman
    sta    REFP0
    ldx    columnCaveman
    dex
    lda    StoneHorzPosTab,X

    sta    WSYNC
;---------------------------------------
    tax
    sta    HMCLR
    sta    HMP0
    and    #DELAY_POS_MASK
    tax
loopPosCaveman:
    dex
   sbne    loopPosCaveman
    sta    RESP0
    sta    WSYNC
;---------------------------------------
    sta    HMOVE
    ldx    dinoDrawIndex
    lda    reflectDinoGfx,X
    sta    REFP1

  IF ANIMATE_DINO
    lda    frameCounter          ; this routine will animate the dinoaurs continually,
    asl                          ; and shows the graphics that were never used before.
    asl
    asl
    lda    dinoLoPtr,X
    ldx    #>DinoGfx_A
    bcs    .updateDinoPtrs
    inx
    adc    #16
.updateDinoPtrs:
    sta    dinosaurPtr
    stx    dinosaurPtr+1
  ELSE
    jmp    RejoinCode

    nop                          ; free bytes
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
  ENDIF

RejoinCode:
    nop                          ; free byte
    ldx    columnCurrentDino
    dex
    lda    StoneHorzPosTab,X
    sta    WSYNC
;---------------------------------------
    tax
    sta    HMCLR
    sta    HMP1
    and    #DELAY_POS_MASK
    tax
loopPosDino:
    dex
   sbne    loopPosDino
    sta    RESP1
    sta    WSYNC
;---------------------------------------
    sta    HMOVE
    ldy    colStones
    sty    COLUPF
    ldx    dinoDrawIndex
    lda    dinoColors,X
    sta    COLUP1
    ldx    #0                    ; clear caveman gfx
    beq    LoopStoneRow          ; always branch

IncreaseOverscan:
    ldx    #OVERSCAN_DELAY
.loopDelayOverscan:
    sta    WSYNC
;---------------------------------------
    dex
    bne    .loopDelayOverscan

    lda    #2
    sta    WSYNC
;---------------------------------------
    sta    VSYNC                 ; vsync starts
    jmp    ContVsync


  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; prep for new stone row
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LoopStoneRow:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ;2  @2
    sta    PF0                   ;3  @5
    sta    PF1                   ;3  @8
    stx    GRP0                  ;3  @11
    sta    PF2                   ;3  @14
    sta    indexGraphics         ;3  @17
    inc    indexStoneBytes       ;5  @22
    inc    indexStoneBytes       ;5  @27
    ldx    indexStoneBytes       ;3  @30
    lda    stoneOrder,X          ;4  @34
    and    #PF2_INDEX_MASK       ;2  @36
    tay                          ;2  @38
    lda    StoneShapesTab_A,Y    ;4  @42
    sta    stoneGfxA_Pf2Left     ;3  @45
    lda    StoneShapesTab_B,Y    ;4  @49
    sta    StoneGfxB_Pf2Left     ;3  @52
    lda    stoneOrder,X          ;4  @56
    and    #PF1_INDEX_MASK       ;2  @58
    tay                          ;2  @60
    sta    WSYNC                 ;3
;---------------------------------------
    lda    #0                    ;2  @2
    sta    GRP1                  ;3  @5
    lda    StoneShapesTab_A,Y    ;4  @9
    sta    stoneGfxA_Pf1Left     ;3  @12
    lda    StoneShapesTab_B,Y    ;4  @16
    sta    StoneGfxB_Pf1Left     ;3  @19
    lda    stoneOrder,X          ;4  @23
    and    #PF0_INDEX_MASK       ;2  @25
    tay                          ;2  @27
    lda    StoneShapesTab_A,Y    ;4  @31
    sta    stoneGfxA_Pf0Left     ;3  @34
    lda    StoneShapesTab_B,Y    ;4  @38
    sta    StoneGfxB_Pf0Left     ;3  @41
    lda    stoneOrder+1,X        ;4  @45
    and    #PF2_INDEX_MASK       ;2  @47
    tay                          ;2  @49
    lda    StoneShapesTab_A,Y    ;4  @53
    sta    stoneGfxA_Pf2Right    ;3  @56
    lda    StoneShapesTab_B,Y    ;4  @60
    sta    StoneGfxB_Pf2Right    ;3  @63
    lda    stoneOrder+1,X        ;4  @67
    and    #PF1_INDEX_MASK       ;2  @69
    tay                          ;2  @71
    lda    StoneShapesTab_A,Y    ;4  @75
    sta    WSYNC                 ;3     <---- adds 1 more scanline!
;---------------------------------------
    sta    stoneGfxA_Pf1Right    ;3  @3
    lda    StoneShapesTab_B,Y    ;4  @7
    sta    StoneGfxB_Pf1Right    ;3  @10
    lda    stoneOrder+1,X        ;4  @14
    and    #PF0_INDEX_MASK       ;2  @16
    tay                          ;2  @18
    lda    StoneShapesTab_A,Y    ;4  @22
    sta    stoneGfxA_Pf0Right    ;3  @25
    lda    StoneShapesTab_B,Y    ;4  @29
    sta    StoneGfxB_Pf0Right    ;3  @32
    ldx    #0                    ;2  @34
    inc    rowCounter            ;5  @39
    lda    rowCounter            ;3  @42
    cmp    #NUM_OF_ROWS+1        ;2  @44
    bne    .drawStoneRow         ;2³ @46/47
    jmp    SetUpForLogo          ;3  @49

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; draw a stone row
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.drawStoneRow:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    stoneGfxA_Pf0Left     ;3  @3
    sta    PF0                   ;3  @6
    lda    stoneGfxA_Pf1Left     ;3  @9
    sta    PF1                   ;3  @12
    lda    stoneGfxA_Pf2Left     ;3  @15
    sta    PF2                   ;3  @18
    stx    GRP1                  ;3  @21
    ldy    indexGraphics         ;3  @24
    lda    stoneGfxA_Pf0Right    ;3  @27
    sta    PF0                   ;3  @30
    lda    (cavemanPtr),Y        ;5  @35
    tax                          ;2  @37
    lda    stoneGfxA_Pf1Right    ;3  @40
    sta    PF1                   ;3  @43
    lda    (cavemanColPtr),Y     ;5  @48
    ldy    stoneGfxA_Pf2Right    ;3  @51
    sty    PF2                   ;3  @54
    ldy    rowCounter            ;3  @57
    cpy    rowCaveman            ;3  @60
    beq    .drawCaveman          ;2³ @62/63
    ldx    #0                    ;2  @64   blank caveman graphics
.drawCaveman:
    tay                          ;2  @66
    lda    StoneGfxB_Pf0Left     ;3  @69   worse case
    sta    WSYNC                 ;3
;---------------------------------------
    sta    PF0                   ;3  @3
    lda    StoneGfxB_Pf1Left     ;3  @6
    sta    PF1                   ;3  @9
    lda    StoneGfxB_Pf2Left     ;3  @12
    sta    PF2                   ;3  @15
    stx    GRP0                  ;3  @18
    sty    COLUP0                ;3  @21
    lda    StoneGfxB_Pf0Right    ;3  @24
    sta    PF0                   ;3  @27
    ldy    indexGraphics         ;3  @30
    inc    indexGraphics         ;5  @35
    lda    StoneGfxB_Pf1Right    ;3  @38
    sta    PF1                   ;3  @41
    lda    (dinosaurPtr),Y       ;5  @46
    tax                          ;2  @48
    lda    StoneGfxB_Pf2Right    ;3  @51
    sta    PF2                   ;3  @54
    lda    rowCounter            ;3  @57
    cmp    rowCurrentDino        ;3  @60
    beq    .drawDinosaur         ;2³ @62/63
    ldx    #0                    ;2  @64   blank dinosaur graphics
.drawDinosaur:
    lda    indexGraphics         ;3  @67
    cmp    #NUM_OF_ROWS          ;2  @69
    bne    .drawStoneRow         ;2³+1 @71/73
    sta    WSYNC                 ;3
;---------------------------------------
    lda    stoneGfxA_Pf0Left     ;3  @3
    sta    PF0                   ;3  @6
    lda    stoneGfxA_Pf1Left     ;3  @9
    sta    PF1                   ;3  @12
    lda    stoneGfxA_Pf2Left     ;3  @15
    sta    PF2                   ;3  @18
    stx    GRP1                  ;3  @21
    ldx    #0                    ;2  @23
    lda    stoneGfxA_Pf0Right    ;3  @26
    sta    PF0                   ;3  @29
    ldy    indexGraphics         ;3  @32
    lda    stoneGfxA_Pf1Right    ;3  @35
    sta    PF1                   ;3  @38
    ldy    indexGraphics         ;3  @41
    ldy    indexGraphics         ;3  @44
    lda    stoneGfxA_Pf2Right    ;3  @47
    sta    PF2                   ;3  @50
    jmp    LoopStoneRow          ;3  @53

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; prep for logo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SetUpForLogo:
    sta    WSYNC
;---------------------------------------
    lda    #COL_LOGO
    sta    COLUP0
    sta    COLUP1
    lda    #NO_MOTION
    sta    HMP0
    sta    HMP1
    sta    REFP0                 ; no reflect
    sta    REFP1
    ldx    #HORIZ_POSITION_DISPLAY
    sta    WSYNC
;---------------------------------------
loopPosLogo:
    dex
   sbne    loopPosLogo
    sta    RESP0
    sta    RESP1
    lda    #LEFT_1
    sta    HMP1
    sta    WSYNC
;---------------------------------------
    sta    HMOVE

    lda    #THREE_COPIES_CLOSE
    sta    NUSIZ0
    lda    #TWO_COPIES_CLOSE
    sta    NUSIZ1
    ldy    #0
    lda    #COL_LOGO_BAR
    sta    WSYNC
;---------------------------------------
    sta    COLUBK                ;3  @3
    lda    t1_digitFour          ;3  @6  waste time
    nop                          ;2  @8  waste time
.loopDrawLogo:
    lda    Logo_A,Y              ;4  @12
    sta    GRP0                  ;3  @15
    lda    Logo_B,Y              ;4  @19
    sta    GRP1                  ;3  @22
    lda    Logo_C,Y              ;4  @26
    sta    t1_digitFour          ;3  @29
    ldx    Logo_D,Y              ;4  @33
    lda    Logo_E,Y              ;4  @37
    sty    t2_loopCount          ;3  @40
    ldy    t1_digitFour          ;3  @43
    sty    GRP0                  ;3  @46
    stx    GRP1                  ;3  @49
    sta    GRP0                  ;3  @52
    inc    t2_loopCount          ;5  @57
    sta    WSYNC                 ;3
;---------------------------------------
    ldy    t2_loopCount          ;3  @3
    cpy    #HEIGHT_LOGO_NUM      ;2  @5
    bne    .loopDrawLogo         ;2³ @7/8
    lda    #0
    sta    GRP0
    sta    GRP1
    sta    COLUBK                ; black
    sta    HMP0                  ; no motion
    sta    HMP1
    sta    WSYNC
;---------------------------------------
    lda    #REFLECT_PF
    sta    CTRLPF
    ldy    #HEIGHT_LIVES_DISPLAY

.loopLivesDisplay:
    lda    #COL_LIVES_LEFT_PF    ;2  @49
    sta    WSYNC                 ;3
;---------------------------------------
    sta    COLUPF                ;3  @3
    ldx    numOfLivesLeftPf      ;3  @6
    lda    LivesDisplayTab,X     ;4  @10
    sta    PF1                   ;3  @13
    ldx    numOfLivesRightPF     ;3  @16
    lda    LivesDisplayTab,X     ;4  @20
    ldx    #COL_LIVES_RIGHT_PF   ;2  @22
    nop                          ;2  @24
    nop                          ;2  @26
    nop                          ;2  @28
    nop                          ;2  @30
    nop                          ;2  @32
    nop                          ;2  @34
    nop                          ;2  @36
    stx    COLUPF                ;3  @39
    sta    PF1                   ;3  @42
    dey                          ;2  @44
    bne    .loopLivesDisplay     ;2³ @46/47
    sta    WSYNC                 ;3
;---------------------------------------
    lda    #0
    sta    COLUPF                ; black
    sta    PF1
    sta    CTRLPF
    rts

LivesDisplayTab:
    .byte $00 ; |        | PF1
    .byte $80 ; |X       |
    .byte $A0 ; |X X     |
    .byte $A8 ; |X X X   |

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

FinishOverscanVsync SUBROUTINE ;x1
    inc    frameCounter
    lda    frameCounter
    and    #SECONDS_MASK
    bne    .skipTimeIncrement
    inc    secondsCounter
.skipTimeIncrement:
    lda    #2
    sta    WSYNC
;---------------------------------------
    sta    VBLANK                ; turn vblank on
    lda    frameCounter
    bne    .contVblank

    ldx    dinoDrawIndex         ; this bit of code seems to be redundant...
    lda    dinoDirection,X
    ora    #DIRECTION_MASK
    sta    dinoDirection,X

.contVblank:
    sta    WSYNC
;---------------------------------------
    lda    frameCounter
    and    #MUSIC_MASK
    bne    .finishMusic
    lda    moveCavemanFlag
    bne    .finishMusic
    ldx    indexFreq
    lda    ThemeSongFreqTab,X
    sta    AUDF0
    inc    indexFreq
    lda    indexFreq
    cmp    #MAIN_THEME_LENGTH
    bne    .finishMusic
    lda    #0                    ; restart song
    sta    indexFreq
.finishMusic:


  IF ORIGINAL
    lda    #2
    sta    WSYNC
;---------------------------------------
    sta    VSYNC                 ; vsync starts
    lda    playerNum
    bne    .checkOtherJoystick

  ELSE
    jmp    IncreaseOverscan      ; add lines to overscan, and start VSYNC
    nop                          ; space filler, keeping code as closely aligned to original as possible just to be a little neater...
    nop
    nop
ContVsync:
    lda    playerNum
    bne    .checkOtherJoystick
  ENDIF



  IF REVERSED_CONTROLS
    lda    SWCHA                 ; original joysticks were reversed between P0 and P1
    and    #DIRECTION_MASK
    sta    currentJoystick
    lda    INPT5 | $30
    sta    currentFirebutton
    jmp    FindDinoToDraw

.checkOtherJoystick:
    lda    SWCHA
    lsr
    lsr
    lsr
    lsr
    sta    currentJoystick
    lda    INPT4 | $30
    sta    currentFirebutton

  ELSE
    lda    SWCHA                 ; this changes the joysticks back, and firebuttons too
    lsr
    lsr
    lsr
    lsr
    sta    currentJoystick
    lda    INPT4
    sta    currentFirebutton
    jmp    FindDinoToDraw

.checkOtherJoystick:
    lda    SWCHA
    and    #DIRECTION_MASK
    sta    currentJoystick
    lda    INPT5
    sta    currentFirebutton
  ENDIF



FindDinoToDraw:
    lda    dinoDrawIndex
    sta    t1_defaultDino        ; default, if no other dinosaurs are alive...
    ldy    #NUM_OF_DINOSAURS-1
    sta    WSYNC
;---------------------------------------
.loopFindNextAliveDino:
    inc    dinoDrawIndex
    lda    #NUM_OF_DINO_MASK     ; no more then 4 dinosaurs
    and    dinoDrawIndex
    tax
    lda    dinoColors,X          ; is this dino dead?
    bne    .dinoFound            ; - no, use him
    dey                          ; - yes, keep looking
    bne    .loopFindNextAliveDino
    ldx    t1_defaultDino        ; the other three dinosaurs are dead, so default to the last selected one.
.dinoFound:
    sta    WSYNC
;---------------------------------------
    stx    dinoDrawIndex
    lda    dinoPosition,X
    lsr
    lsr
    lsr
    lsr
    sta    rowCurrentDino
    lda    #DINO_COLUMN_MASK
    and    dinoPosition,X
    sta    columnCurrentDino
    lda    #0
    sta    WSYNC
;---------------------------------------
    sta    VSYNC                 ; vsync ends
    lda    #TIME_VBLANK
    sta    TIM64T
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; FREQ_00  = $00   ;      30 kHz  reference frequency
; FREQ_01  = $01   ;      15 kHz
; FREQ_02  = $02   ;      10 kHz
; FREQ_03  = $03   ;     7.5 kHz
; FREQ_04  = $04   ;       6 kHz
; FREQ_05  = $05   ;       5 kHz
; FREQ_06  = $06   ;  ~ 4.29 kHz
; FREQ_07  = $07   ;    3.75 kHz
; FREQ_08  = $08   ;  ~ 3.33 kHz
; FREQ_09  = $09   ;       3 kHz
; FREQ_0A  = $0A   ;  ~ 2.73 kHz
; FREQ_0B  = $0B   ;     2.5 kHz
; FREQ_0C  = $0C   ;  ~ 2.31 kHz
; FREQ_0D  = $0D   ;  ~ 2.14 kHz
; FREQ_0E  = $0E   ;       2 kHz
; FREQ_0F  = $0F   ; ~ 1.875 kHz
; FREQ_10  = $10   ;  ~ 1.76 kHz
; FREQ_11  = $11   ;  ~ 1.67 kHz
; FREQ_12  = $12   ;  ~ 1.58 kHz
; FREQ_13  = $13   ;     1.5 kHz
; FREQ_14  = $14   ;  ~ 1.43 kHz
; FREQ_15  = $15   ;  ~ 1.36 kHz
; FREQ_16  = $16   ;  ~ 1.30 kHz
; FREQ_17  = $17   ;    1.25 kHz
; FREQ_18  = $18   ;     1.2 kHz
; FREQ_19  = $19   ;  ~ 1.15 kHz
; FREQ_1A  = $1A   ;  ~ 1.11 kHz
; FREQ_1B  = $1B   ;  ~ 1.07 kHz
; FREQ_1C  = $1C   ;  ~ 1.03 kHz
; FREQ_1D  = $1D   ;       1 kHz
; FREQ_1E  = $1E   ;  ~ 0.97 kHz
; FREQ_1F  = $1F   ;  ~ 0.94 kHz

ThemeSongFreqTab:
    .byte $1F,$1F
    .byte $15,$15
    .byte $1F,$1F
    .byte $15,$15
    .byte $1C,$1C
    .byte $15,$15
    .byte $1C,$1C
    .byte $15,$15
    .byte $1F,$1F
    .byte $15,$15
    .byte $1F,$1F
    .byte $15,$15
    .byte $1C,$1C
    .byte $15,$15
    .byte $1C,$1C
    .byte $15,$15
    .byte $1F,$1F
    .byte $15,$15
    .byte $1C,$1C
    .byte $15,$15
    .byte $1F,$1F
    .byte $1C,$1C
    .byte $19,$19
    .byte $1C,$1C
    .byte $1F
    .byte $1C
    .byte $19
    .byte $1C
    .byte $19,$19
    .byte $1C
    .byte $1F
ThemeSongFinish:

CaveMan_LR_Even:
    .byte $3C ; |  XXXX  |
    .byte $14 ; |   X X  |
    .byte $34 ; |  XX X  |
    .byte $1C ; |   XXX  |
    .byte $38 ; |  XXX   |
    .byte $5C ; | X XXX  |
    .byte $16 ; |   X XX |
    .byte $32 ; |  XX  X |
CaveMan_Up_Odd:
    .byte $3C ; |  XXXX  |
    .byte $3C ; |  XXXX  |
    .byte $3C ; |  XXXX  |
    .byte $2C ; |  X XX  |
    .byte $5A ; | X XX X |
    .byte $3C ; |  XXXX  |
    .byte $16 ; |   X XX |
    .byte $30 ; |  XX    |
CaveMan_Down_Odd:
    .byte $3C ; |  XXXX  |
    .byte $3C ; |  XXXX  |
    .byte $3C ; |  XXXX  |
    .byte $18 ; |   XX   |
    .byte $7E ; | XXXXXX |
    .byte $3C ; |  XXXX  |
    .byte $16 ; |   X XX |
    .byte $30 ; |  XX    |
CaveMan_LR_Odd:
    .byte $3C ; |  XXXX  |
    .byte $14 ; |   X X  |
    .byte $34 ; |  XX X  |
    .byte $5C ; | X XXX  |
    .byte $38 ; |  XXX   |
    .byte $1C ; |   XXX  |
    .byte $16 ; |   X XX |
    .byte $30 ; |  XX    |
CaveMan_Up_Even:
    .byte $3C ; |  XXXX  |
    .byte $3C ; |  XXXX  |
    .byte $3C ; |  XXXX  |
    .byte $2C ; |  X XX  |
    .byte $7E ; | XXXXXX |
    .byte $3C ; |  XXXX  |
    .byte $68 ; | XX X   |
    .byte $0C ; |    XX  |
CaveMan_Down_Even:
    .byte $3C ; |  XXXX  |
    .byte $3C ; |  XXXX  |
    .byte $3C ; |  XXXX  |
    .byte $5A ; | X XX X |
    .byte $3C ; |  XXXX  |
    .byte $3C ; |  XXXX  |
    .byte $68 ; | XX X   |
    .byte $0C ; |    XX  |

CaveMan_Push_LR:
    .byte $3C ; |  XXXX  |
    .byte $14 ; |   X X  |
    .byte $34 ; |  XX X  |
    .byte $58 ; | X XX   |
    .byte $7C ; | XXXXX  |
    .byte $1E ; |   XXXX |
    .byte $04 ; |     X  |
    .byte $0C ; |    XX  |
CaveMan_Push_Up:
    .byte $3C ; |  XXXX  |
    .byte $3C ; |  XXXX  |
    .byte $2C ; |  X XX  |
    .byte $5A ; | X XX X |
    .byte $3C ; |  XXXX  |
    .byte $18 ; |   XX   |
    .byte $3C ; |  XXXX  |
    .byte $00 ; |        |
CaveMan_Push_Down:
    .byte $00 ; |        |
    .byte $3C ; |  XXXX  |
    .byte $3C ; |  XXXX  |
    .byte $3C ; |  XXXX  |
    .byte $5A ; | X XX X |
    .byte $3C ; |  XXXX  |
    .byte $18 ; |   XX   |
    .byte $3C ; |  XXXX  |

DinoGfx_A:
    .byte $1C ; |   XXX  |
    .byte $36 ; |  XX XX |
    .byte $26 ; |  X  XX |
    .byte $1C ; |   XXX  |
    .byte $7C ; | XXXXX  |
    .byte $3C ; |  XXXX  |
    .byte $16 ; |   X XX |
    .byte $32 ; |  XX  X |
DinoGfx_B:
    .byte $1C ; |   XXX  |
    .byte $2A ; |  X X X |
    .byte $2A ; |  X X X |
    .byte $1C ; |   XXX  |
    .byte $08 ; |    X   |
    .byte $3E ; |  XXXXX |
    .byte $1C ; |   XXX  |
    .byte $32 ; |  XX  X |
DinoGfx_C:
    .byte $1C ; |   XXX  |  previously never used, restored in the new conversion
    .byte $36 ; |  XX XX |
    .byte $26 ; |  X  XX |
    .byte $1C ; |   XXX  |
    .byte $3E ; |  XXXXX |
    .byte $7E ; | XXXXXX |
    .byte $14 ; |   X X  |
    .byte $34 ; |  XX X  |
DinoGfx_D:
    .byte $1C ; |   XXX  |  previously never used, restored in the new conversion
    .byte $2A ; |  X X X |
    .byte $2A ; |  X X X |
    .byte $1C ; |   XXX  |
    .byte $08 ; |    X   |
    .byte $3E ; |  XXXXX |
    .byte $1C ; |   XXX  |
    .byte $26 ; |  X  XX |

ColCaveMan_LR_Even:
    .byte COL_42 ; |  XXXX  |
    .byte COL_48 ; |   X X  |
    .byte COL_48 ; |  XX X  |
    .byte COL_48 ; |   XXX  |
    .byte COL_48 ; |  XXX   |
    .byte COL_16 ; | X XXX  |
    .byte COL_48 ; |   X XX |
    .byte COL_48 ; |  XX  X |
ColCaveMan_Up_Odd:
    .byte COL_42 ; |  XXXX  |
    .byte COL_42 ; |  XXXX  |
    .byte COL_42 ; |  XXXX  |
    .byte COL_42 ; |  X XX  |
    .byte COL_48 ; | X XX X |
    .byte COL_16 ; |  XXXX  |
    .byte COL_48 ; |   X XX |
    .byte COL_48 ; |  XX    |
ColCaveMan_Down_Odd:
    .byte COL_42 ; |  XXXX  |
    .byte COL_48 ; |  XXXX  |
    .byte COL_48 ; |  XXXX  |
    .byte COL_48 ; |   XX   |
    .byte COL_48 ; | XXXXXX |
    .byte COL_16 ; |  XXXX  |
    .byte COL_48 ; |   X XX |
    .byte COL_48 ; |  XX    |
ColCaveMan_LR_Odd:
    .byte COL_42 ; |  XXXX  |
    .byte COL_48 ; |   X X  |
    .byte COL_48 ; |  XX X  |
    .byte COL_48 ; | X XXX  |
    .byte COL_48 ; |  XXX   |
    .byte COL_16 ; |   XXX  |
    .byte COL_48 ; |   X XX |
    .byte COL_48 ; |  XX    |
ColCaveMan_Up_Even:
    .byte COL_42 ; |  XXXX  |
    .byte COL_42 ; |  XXXX  |
    .byte COL_42 ; |  XXXX  |
    .byte COL_42 ; |  X XX  |
    .byte COL_48 ; | XXXXXX |
    .byte COL_16 ; |  XXXX  |
    .byte COL_48 ; | XX X   |
    .byte COL_48 ; |    XX  |
ColCaveMan_Down_Even:
    .byte COL_42 ; |  XXXX  |
    .byte COL_48 ; |  XXXX  |
    .byte COL_48 ; |  XXXX  |
    .byte COL_48 ; | X XX X |
    .byte COL_48 ; |  XXXX  |
    .byte COL_16 ; |  XXXX  |
    .byte COL_48 ; | XX X   |
    .byte COL_48 ; |    XX  |

ColCaveMan_Push_LR:
    .byte COL_42 ; |  XXXX  |
    .byte COL_48 ; |   X X  |
    .byte COL_48 ; |  XX X  |
    .byte COL_48 ; | X XX   |
    .byte COL_48 ; | XXXXX  |
    .byte COL_16 ; |   XXXX |
    .byte COL_48 ; |     X  |
    .byte COL_48 ; |    XX  |
ColCaveMan_Push_Up:
    .byte COL_42 ; |  XXXX  |
    .byte COL_42 ; |  XXXX  |
    .byte COL_42 ; |  X XX  |
    .byte COL_48 ; | X XX X |
    .byte COL_16 ; |  XXXX  |
    .byte COL_48 ; |   XX   |
    .byte COL_48 ; |  XXXX  |
    .byte COL_00 ; |        |
ColCaveMan_Push_Down:
    .byte COL_00 ; |        |
    .byte COL_42 ; |  XXXX  |
    .byte COL_48 ; |  XXXX  |
    .byte COL_48 ; |  XXXX  |
    .byte COL_48 ; | X XX X |
    .byte COL_16 ; |  XXXX  |
    .byte COL_48 ; |   XX   |
    .byte COL_48 ; |  XXXX  |

StoneShapesTab_A:
    .byte 0                                                  ; |        | 0   PF0,PF1,PF2
    .byte (STONE_PAT_1_FLIPPED << 4)                         ; |XXX     | 1   PF2
    .byte (STONE_PAT_1_FLIPPED)                              ; |    XXX | 2   PF2
    .byte (STONE_PAT_1_FLIPPED << 4) | (STONE_PAT_1_FLIPPED) ; |XXX XXX | 3   PF2
    .byte (STONE_PAT_1)                                      ; |     XXX| 4   PF1
    .byte 0,0,0  ; not used
    .byte (STONE_PAT_1 << 4)                                 ; | XXX    | 8   PF1
    .byte 0,0,0  ; not used
    .byte (STONE_PAT_1 << 4) | (STONE_PAT_1)                 ; | XXX XXX| 12  PF1
    .byte 0,0,0  ; not used
    .byte (STONE_PAT_1_FLIPPED << 4)                         ; |XXX     | 16  PF0

StoneShapesTab_B:
    .byte 0                                                  ; |        | 0   PF0,PF1,PF2
    .byte (STONE_PAT_2_FLIPPED << 4)                         ; |X X     | 1   PF2
    .byte (STONE_PAT_2_FLIPPED)                              ; |    X X | 2   PF2
    .byte (STONE_PAT_2_FLIPPED << 4) | (STONE_PAT_2_FLIPPED) ; |X X X X | 3   PF2
    .byte (STONE_PAT_2)                                      ; |     X X| 4   PF1
    .byte 0,0,0  ; not used
    .byte (STONE_PAT_2 << 4)                                 ; | X X    | 8   PF1
    .byte 0,0,0  ; not used
    .byte (STONE_PAT_2 << 4) | (STONE_PAT_2)                 ; | X X X X| 12  PF1
    .byte 0,0,0  ; not used
    .byte (STONE_PAT_2_FLIPPED << 4)                         ; |X X     | 16  PF0

;---------------------------------------------------------------------
; For some reason level 1's data also appears here, and is never used.
; Maybe it was put here to help develop the PFx tables above, or the
; position table below. Either way it got left behind.

    stones ___X_X____
    stones XX_X_XXXX_
    stones ___X______
    stones _XXX_XX_X_
    stones ______X_X_
    stones XX_X__X_X_
    stones _X_XX_X_XX
    stones ___X__X___

;---------------------------------------------------------------------

StoneHorzPosTab:
  IF OFF_CENTER_POSITION
;                          column
;                          number
    .byte     LEFT_2 | 1   ; 1        HMPx | delay count
    .byte     LEFT_7 | 3   ; 2
    .byte     LEFT_6 | 4   ; 3
    .byte     LEFT_5 | 5   ; 4
    .byte     LEFT_3 | 6   ; 5
    .byte     LEFT_3 | 7   ; 6
    .byte     LEFT_2 | 8   ; 7
    .byte     LEFT_1 | 9   ; 8
    .byte  NO_MOTION | 10  ; 9
    .byte  NO_MOTION | 11  ; 10
  ELSE
;                          column
;                          number
    .byte     LEFT_2 | 1   ; 1        HMPx | delay count
    .byte     LEFT_7 | 3   ; 2
    .byte     LEFT_6 | 4   ; 3
    .byte     LEFT_5 | 5   ; 4
    .byte     LEFT_4 | 6   ; 5  <--- fixed center column by shifting left 1 more spot
    .byte     LEFT_3 | 7   ; 6
    .byte     LEFT_2 | 8   ; 7
    .byte     LEFT_1 | 9   ; 8
    .byte  NO_MOTION | 10  ; 9
    .byte    RIGHT_1 | 11  ; 10 <--- fixed far right column by shifting right 1 more spot
  ENDIF

Zero:
    .byte $3C ; |  XXXX  |
    .byte $62 ; | XX   X |
    .byte $66 ; | XX  XX |
    .byte $6A ; | XX X X |
    .byte $72 ; | XXX  X |
    .byte $62 ; | XX   X |
    .byte $3C ; |  XXXX  |
    .byte $00 ; |        |
One:
    .byte $38 ; |  XXX   |
    .byte $18 ; |   XX   |
    .byte $18 ; |   XX   |
    .byte $18 ; |   XX   |
    .byte $18 ; |   XX   |
    .byte $18 ; |   XX   |
    .byte $3C ; |  XXXX  |
    .byte $00 ; |        |
Two:
    .byte $3C ; |  XXXX  |
    .byte $62 ; | XX   X |
    .byte $02 ; |      X |
    .byte $06 ; |     XX |
    .byte $18 ; |   XX   |
    .byte $60 ; | XX     |
    .byte $7E ; | XXXXXX |
    .byte $00 ; |        |
Three:
    .byte $3C ; |  XXXX  |
    .byte $62 ; | XX   X |
    .byte $02 ; |      X |
    .byte $04 ; |     X  |
    .byte $02 ; |      X |
    .byte $62 ; | XX   X |
    .byte $3C ; |  XXXX  |
    .byte $00 ; |        |
Four:
    .byte $0C ; |    XX  |
    .byte $1C ; |   XXX  |
    .byte $34 ; |  XX X  |
    .byte $64 ; | XX  X  |
    .byte $7E ; | XXXXXX |
    .byte $04 ; |     X  |
    .byte $04 ; |     X  |
    .byte $00 ; |        |
Five:
    .byte $7E ; | XXXXXX |
    .byte $60 ; | XX     |
    .byte $7C ; | XXXXX  |
    .byte $02 ; |      X |
    .byte $02 ; |      X |
    .byte $62 ; | XX   X |
    .byte $3C ; |  XXXX  |
    .byte $00 ; |        |
Six:
    .byte $1E ; |   XXXX |
    .byte $30 ; |  XX    |
    .byte $60 ; | XX     |
    .byte $7C ; | XXXXX  |
    .byte $62 ; | XX   X |
    .byte $62 ; | XX   X |
    .byte $3C ; |  XXXX  |
    .byte $00 ; |        |
Seven:
    .byte $7E ; | XXXXXX |
    .byte $06 ; |     XX |
    .byte $0C ; |    XX  |
    .byte $18 ; |   XX   |
    .byte $30 ; |  XX    |
    .byte $30 ; |  XX    |
    .byte $30 ; |  XX    |
    .byte $00 ; |        |
Eight:
    .byte $3C ; |  XXXX  |
    .byte $62 ; | XX   X |
    .byte $62 ; | XX   X |
    .byte $3C ; |  XXXX  |
    .byte $62 ; | XX   X |
    .byte $62 ; | XX   X |
    .byte $3C ; |  XXXX  |
    .byte $00 ; |        |
Nine:
    .byte $3C ; |  XXXX  |
    .byte $62 ; | XX   X |
    .byte $62 ; | XX   X |
    .byte $3E ; |  XXXXX |
    .byte $02 ; |      X |
    .byte $04 ; |     X  |
    .byte $78 ; | XXXX   |
    .byte $00 ; |        |
BlankDigit:
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |

  IF CCE_LOGO

;----------------------------------------------
;         XXXXX   XXXXX   XXXXX
;        XXXXXXX XXXXXXX XXXXXXX
;     X  XX  XXX XX  XXX XX  XXX  X
;    X X XX      XX      XXXXXXX X X
;     X  XX  XXX XX  XXX XX       X
;        XXXXXXX XXXXXXX XXXXXXX
;         XXXXX   XXXXX   XXXXX
;


Logo_A:
    .byte $07 ; |     XXX|
    .byte $0F ; |    XXXX|
    .byte $4C ; | X  XX  |
    .byte $AC ; |X X XX  |
    .byte $4C ; | X  XX  |
    .byte $0F ; |    XXXX|
    .byte $07 ; |     XXX|
    .byte $00 ; |        |
Logo_B:
    .byte $C7 ; |XX   XXX|
    .byte $EF ; |XXX XXXX|
    .byte $EC ; |XXX XX  |
    .byte $0C ; |    XX  |
    .byte $EC ; |XXX XX  |
    .byte $EF ; |XXX XXXX|
    .byte $C7 ; |XX   XXX|
    .byte $00 ; |        |
Logo_C:
    .byte $C7 ; |XX   XXX|
    .byte $EF ; |XXX XXXX|
    .byte $EC ; |XXX XX  |
    .byte $0F ; |    XXXX|
    .byte $EC ; |XXX XX  |
    .byte $EF ; |XXX XXXX|
    .byte $C7 ; |XX   XXX|
    .byte $00 ; |        |
Logo_D:
    .byte $C0 ; |XX      |
    .byte $E0 ; |XXX     |
    .byte $E4 ; |XXX  X  |
    .byte $EA ; |XXX X X |
    .byte $04 ; |     X  |
    .byte $E0 ; |XXX     |
    .byte $C0 ; |XX      |
    .byte $00 ; |        |
Logo_E:
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |

  ENDIF

  IF TECHNOVISION_LOGO

;----------------------------------------------
;                        XX   XX
;                         X   X
;    XXXXXX XX X X  X   X XX XX  XX    X   X
;     X X  X   X X X X X X X X X X  X X X X X
;     X XX X   XXX X X X X X X X X  X X X X X
;     X X  X   X X X X X X XXX X  X X X X X X
;     X XXX XX X X X X  X   X  X XX X  X  X X
;                           X

Logo_A:
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $FD ; |XXXXXX X|
    .byte $52 ; | X X  X |
    .byte $5A ; | X XX X |
    .byte $52 ; | X X  X |
    .byte $5D ; | X XXX X|
    .byte $00 ; |        |
Logo_B:
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $A9 ; |X X X  X|
    .byte $2A ; |  X X X |
    .byte $3A ; |  XXX X |
    .byte $2A ; |  X X X |
    .byte $AA ; |X X X X |
    .byte $00 ; |        |
Logo_C:
    .byte $0C ; |    XX  |
    .byte $04 ; |     X  |
    .byte $16 ; |   X XX |
    .byte $AA ; |X X X X |
    .byte $AA ; |X X X X |
    .byte $AB ; |X X X XX|
    .byte $91 ; |X  X   X|
    .byte $01 ; |       X|
Logo_D:
    .byte $60 ; | XX     |
    .byte $40 ; | X      |
    .byte $CC ; |XX  XX  |
    .byte $A9 ; |X X X  X|
    .byte $A9 ; |X X X  X|
    .byte $A5 ; |X X  X X|
    .byte $2D ; |  X XX X|
    .byte $00 ; |        |
Logo_E:
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $22 ; |  X   X |
    .byte $55 ; | X X X X|
    .byte $55 ; | X X X X|
    .byte $55 ; | X X X X|
    .byte $25 ; |  X  X X|
    .byte $00 ; |        |

  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MoveDinoUp:
    ldx    dinoMoveIndex
    lda    dinoPosition,X
    sec
    sbc    #ONE_ROW
    sta    dinoPosition,X
    lda    #<DinoGfx_B
    sta    dinoLoPtr,X
    lda    dinoDirection,X
    and    #DOWN_NOT_ALLOWED_MASK
    ora    #TRAVEL_UP
    sta    dinoDirection,X
    rts

MoveDinoDown:
    ldx    dinoMoveIndex
    lda    dinoPosition,X
    clc
    adc    #ONE_ROW
    sta    dinoPosition,X
    lda    #<DinoGfx_B
    sta    dinoLoPtr,X
    lda    dinoDirection,X
    and    #UP_NOT_ALLOWED_MASK
    ora    #TRAVEL_DOWN
    sta    dinoDirection,X
    rts

MoveDinoLeft:
    ldx    dinoMoveIndex
    lda    dinoPosition,X
    sec
    sbc    #ONE_COLUMN
    sta    dinoPosition,X
    lda    #NO_REFLECT
    sta    reflectDinoGfx,X
    lda    #<DinoGfx_A
    sta    dinoLoPtr,X
    lda    dinoDirection,X
    and    #RIGHT_NOT_ALLOWED_MASK
    ora    #TRAVEL_LEFT
    sta    dinoDirection,X
    rts

MoveDinoRight:
    ldx    dinoMoveIndex
    lda    dinoPosition,X
    clc
    adc    #ONE_COLUMN
    sta    dinoPosition,X
    lda    #REFLECT_GFX
    sta    reflectDinoGfx,X
    lda    #<DinoGfx_A
    sta    dinoLoPtr,X
    lda    dinoDirection,X
    and    #LEFT_NOT_ALLOWED_MASK
    ora    #TRAVEL_RIGHT
    sta    dinoDirection,X
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                            BuildDinoStoneIndexes SUBROUTINE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; 10 bits are used for the stones in each row, as shown below:
;
;                1st byte    2nd byte
;                 left PF    right PF
;
;                 76543210   76543210
; one row ----->  ...XXXXX   ...XXXXX
;                    |   |      |   |
;                    |   |      |   stone bit for column 10
;                    |   |      |
;                    |   |      stone bit for column 6
;                    |   |
;                    |   stone bit for column 5
;                    |
;                    stone bit for column 1
;
; - The index covers 8 rows times 2 (2 bytes of stone data).
; - If the dinosaur is on the rightside of the playfield, then the 2nd byte of data would have to be checked.
; - Special cases when the dinosaur is in column 5 or 6 are handled in the stone checking routine. If, for example, the
;   dinosaur is column 6 then the leftside PF stone byte would have to be checked for a stone in column 5, while the
;   rightside stone bytes are checked for stones above, below, and to the right of the dinosaur.
; - The row index is also converted to a zero based index (DEX is used twice since the multiplication by 2 bytes is done before the adjustment).
;
; row index, which now indexes leftside/rightside stone bytes for that row:
; 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15
;  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
;  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  bottom row, use right side PF stone bits
;  |  |  |  |  |  |  |  |  |  |  |  |  |  |  bottom row, use left side PF stone bits
;  |  |  |  |  |  |  |  |  |  |  |  |  |  |
;  |  |   .................................
;  |  |
;  |  top row, use right side PF stone bits
;  top row, use left side PF stone bits




BuildDinoStoneIndexes SUBROUTINE ;x1
    lda    currentDinoRow        ; currentDinoRow, 1 to 8
    asl                          ; time by two bytes of data, index is now 2 to 16 (but only even numbers)
    tax
    dex
    dex                          ; decrease one row, value is now 0,2,4,6,8,10,12, or 14 (zero based index)
    lda    currentDinoColumn     ; load currentDinoColumn, 1 to 10
    cmp    #(NUM_OF_COLUMNS/2)+1 ; is Dino on the left side playfield?
    bcc    .makeDinoColumnIndex  ; - yes, on left side (columns 1 to 5)
    inx                          ; - no, dino is on right side, increase row index in order to load the 2nd byte.
                                 ;   Index becomes an odd number ---> 1,3,5,7,9,11,13, or 15
    sec
    sbc    #(NUM_OF_COLUMNS/2)   ; subtract five columns, to make columns 6 to 10 -----> 1 to 5 as well
.makeDinoColumnIndex:

;   ****  at this point the column index is now always 1 to 5, which will be used index the five stone bits in the left or right PF stone byte.




; ASL will ultimately be used to parse all the stone bits (probably because the leftmost stone is also the lowest column number).
;
;      76543210
;      ...XXXXX   <-------- ASL this byte 3 times to get the leftmost stone into the carry, to be checked with BCS
;         |
;         leftmost stone, column 1 for leftside of PF or column 6 for rightside PF
;
; The addition below factors in these extra number of shifts...

    clc
    adc    #SHIFT_UNUSED_BITS              ; add 3 bits, index goes 1 to 5 ------> 4 to 8
    stx    indexStoneByteDino              ; store as an index for the PF stone byte, 0 to 15
    sta    stoneBitDinoIsOn                ; store as an left shift index for the stone bit, 4 to 8
    rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This is essentially the same subroutine as "BuildDinoStoneIndexes" right above here,
; except it is for the caveman and the X register ends up holding the byte index, and Y the bit shift index

BuildCavemanStoneIndexes SUBROUTINE ;x5
    lda    rowCaveman
    asl
    tax
    dex
    dex
    lda    columnCaveman
    cmp    #(NUM_OF_COLUMNS/2)+1
    bcc    .makeCavemanColumnIndex
    inx
    sec
    sbc    #(NUM_OF_COLUMNS/2)
.makeCavemanColumnIndex:
    clc
    adc    #SHIFT_UNUSED_BITS
    tay
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CheckTimeRemaing SUBROUTINE ;x1
    lda    frameCounter
    and    #EIGHT_FRAME_MASK
    EXIT_UNLESS_SUBFRAME   TIME_LEFT_SUBFRAME

    lda    #TIME_LIMIT
    sec
    sbc    secondsCounter
    bne    .checkForTimeWarning
    jmp    StartDeathSequence    ; times up!

.checkForTimeWarning:
    cmp    #TIME_WARNING
    beq    .issueTimeWarning
    rts

.issueTimeWarning:
    lda    #COL_PF_STONES_BLUE
    sta    colStones
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MoveCavemanUpdateGfx SUBROUTINE ;x1
    EXIT_IF_STONE_SLIDING
    lda    joystickDelay
    bpl    .doOnceEvery16frames  ; - if ALLOW_JOYSTICK_FLAG not set
    lda    frameCounter
    and    #SIXTEEN_FRAME_MASK
    sta    joystickDelay
.doOnceEvery16frames:
    eor    frameCounter
    and    #SIXTEEN_FRAME_MASK
    beq    .isCavemanMoving
    rts

.isCavemanMoving:
    lda    moveCavemanFlag       ; was caveman being moved (previous frame)
    beq    .joyNotPressed        ; - no
    lda    #CLEAR_CAVEMAN_FLAG   ; - yes, and frameCounter was decremented so that this is reached.
    sta    moveCavemanFlag
    rts

.joyNotPressed:
    lda    currentJoystick
    cmp    #DIRECTION_MASK       ; is nothing pressed?
    bne    .directionIsPressed   ; - no
    lda    #ALLOW_JOYSTICK_FLAG  ; - yes, start checking movement, but not this frame
    sta    joystickDelay
    rts

.directionIsPressed:
    lda    #CAVEMAN_MOVEMENT_FLAG; happens every 16 frames when joystick held, and gets cleared next frame
    sta    moveCavemanFlag
    dec    frameCounter          ; this might cause bad timings, but doing this allows moveCavemanFlag to be cleared the following frame
    jsr    BuildCavemanStoneIndexes

    lda    currentJoystick
  IF BAD_DIRECTIONS
    cmp    #(~UP_DIRECTION & DIRECTION_MASK)
    bne    .isCavemanOnBottomRow
  ELSE
    nop                          ; free byte, just using the NOP to keep new code aligned with old...
    lsr
    bcs    .isCavemanOnBottomRow
  ENDIF
    cpx    #TOP_ROW_BYTE_INDEX
    bcs    .checkAboveCaveman
    jmp    GotoScorePrep

.checkAboveCaveman:
    MOVE_INDEX_UP_ONE_ROW
    TEST_STONE_BIT
    bcc    .moveCavemanUp
    jmp    GotoScorePrep

.moveCavemanUp:
    dec    rowCaveman
    lda    rowCaveman
    and    #ODD_EVEN_PTRS_MASK
    beq    .evenCavemanUp
    SET_CAVEMAN_PTRS  CaveMan_Up_Odd, ColCaveMan_Up_Odd
    jmp    GotoScorePrep

.evenCavemanUp:
    SET_CAVEMAN_PTRS  CaveMan_Up_Even, ColCaveMan_Up_Even
    jmp    GotoScorePrep



.isCavemanOnBottomRow:
  IF BAD_DIRECTIONS
    cmp    #(~DOWN_DIRECTION & DIRECTION_MASK)
    bne    .isCavemanOnLeftColumn
  ELSE
    nop                          ; free byte, just using the NOP to keep new code aligned with old...
    lsr
    bcs    .isCavemanOnLeftColumn
  ENDIF
    cpx    #BOTTOM_ROW_BYTE_INDEX
    bcc    .checkBelowCaveman
    jmp    GotoScorePrep

.checkBelowCaveman:
    MOVE_INDEX_DOWN_ONE_ROW
    TEST_STONE_BIT
    bcc    .moveCavemanDown
    jmp    GotoScorePrep

.moveCavemanDown:
    inc    rowCaveman
    lda    rowCaveman
    and    #ODD_EVEN_PTRS_MASK
    beq    .evenCavemanDown
    SET_CAVEMAN_PTRS  CaveMan_Down_Odd, ColCaveMan_Down_Odd
    jmp    GotoScorePrep

.evenCavemanDown:
    SET_CAVEMAN_PTRS  CaveMan_Down_Even, ColCaveMan_Down_Even
    jmp    GotoScorePrep



.isCavemanOnLeftColumn:
  IF BAD_DIRECTIONS
    cmp    #(~LEFT_DIRECTION & DIRECTION_MASK)
    bne    .tryMoveRightCaveman
  ELSE
    nop                          ; free byte, just using the NOP to keep new code aligned with old...
    lsr
    bcs    .tryMoveRightCaveman
  ENDIF
    cpy    #COLUMN_INDEX_START+1 ; is caveman in column 1 or column 6?
    bcs    .checkLeftOfCaveman   ; - neither...
    txa                          ; - yes, caveman is in one of them, determine if it is column 6.
    and    #RIGHTSIDE_PF_MASK
    bne    .checkColumnFiveCaveman ; - caveman is in column 6, so we will need to check for a stone in column 5
    jmp    GotoScorePrep         ; - column 1

.checkColumnFiveCaveman:
    dex                          ; switch index to load left side playfield stones instead
    lda    #SHIFT_STONE_5 +1     ; shift until column five's stone is in the carry, +1 is for handling the very first DEY
    tay
.checkLeftOfCaveman:
    dey                          ; decrease by 1 initially, to stop on the stone column to the left of the Caveman
    TEST_STONE_BIT
    bcc    .moveCavemanLeft
    jmp    GotoScorePrep

.moveCavemanLeft:
    dec    columnCaveman
    lda    #NO_REFLECT
    sta    reflectCaveman
    lda    columnCaveman
    and    #ODD_EVEN_PTRS_MASK
    bne    .oddCavemanLeft
    SET_CAVEMAN_PTRS  CaveMan_LR_Even, ColCaveMan_LR_Even
    jmp    GotoScorePrep

.oddCavemanLeft:
    SET_CAVEMAN_PTRS  CaveMan_LR_Odd, ColCaveMan_LR_Odd
    jmp    GotoScorePrep



.tryMoveRightCaveman:
  IF BAD_DIRECTIONS
    cmp    #(~RIGHT_DIRECTION & DIRECTION_MASK)
    beq    .isCavemanOnRightColumn
  ELSE
    nop                          ; free byte, just using the NOP to keep new code aligned with old...
    lsr
    bcc    .isCavemanOnRightColumn
  ENDIF
    rts

.isCavemanOnRightColumn:
    cpy    #COLUMN_INDEX_END     ; is caveman on column 5 or 10?
    bcc    .checkRightOfCaveman  ; neither...
    txa                          ; - yes, was it is column 5 or 10, find out which
    and    #RIGHTSIDE_PF_MASK
    beq    .checkColumnSixCaveman; - column 5
    jmp    GotoScorePrep         ; - column 10, caveman is at the right edge, and can't go any further right

.checkColumnSixCaveman:
    inx                          ; change index to use right side playfield stones, to look at column 6
    lda    #SHIFT_STONE_6        ; get column six's shift value for the routine
    tay
.checkRightOfCaveman:
    iny                          ; increase by 1 initially, to stop on the stone column to the right of the caveman
    TEST_STONE_BIT
    bcc    .moveCavemanRight
    jmp    GotoScorePrep

.moveCavemanRight:
    inc    columnCaveman
    lda    #REFLECT_GFX
    sta    reflectCaveman
    lda    columnCaveman
    and    #ODD_EVEN_PTRS_MASK
    bne    .oddCavemanRight
    SET_CAVEMAN_PTRS  CaveMan_LR_Even, ColCaveMan_LR_Even
    jmp    GotoScorePrep

.oddCavemanRight:
    SET_CAVEMAN_PTRS  CaveMan_LR_Odd, ColCaveMan_LR_Odd
    jmp    GotoScorePrep

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CheckWhereDinoCanMove SUBROUTINE ;x1
    EXIT_IF_STONE_SLIDING
    lda    frameCounter
    ldx    playerNum
    and    difficultyP0,X        ; HARD_SETTING_MASK allows dinoaur movement to occur twice as fast
    EXIT_UNLESS_SUBFRAME   DINO_MOVE_CHOICES_SUBFRAME
    ldy    #NUM_OF_DINOSAURS
.loopTryToFindAliveDino:
    inc    dinoMoveIndex
    lda    dinoMoveIndex
    and    #NUM_OF_DINO_MASK     ; no more then 4 dinosaurs
    tax
    lda    dinoColors,X
    bne    .updateDinoSelection
    dey
    bne    .loopTryToFindAliveDino

.updateDinoSelection:
    stx    dinoMoveIndex         ; if no dinosaours are alive, the default is to use the last dino selected by "dinoMoveIndex"
    jsr    SeparateDinoRowColumn
    jsr    BuildDinoStoneIndexes
    lda    #CURRENT_DIR_MASK     ; for saving current direction
    sta    obstacleFreeDir
    ldx    indexStoneByteDino
    ldy    stoneBitDinoIsOn
    cpx    #TOP_ROW_BYTE_INDEX
    bcs    .checkForStoneAbove   ; - if dino is below top row
    bcc    .isDinoOnBottomRow    ; always branch, dino is on top row and can't go any higher

.checkForStoneAbove:
    MOVE_INDEX_UP_ONE_ROW
    TEST_STONE_BIT
    bcs    .isDinoOnBottomRow    ; - a stone is directly above, so dino can't go there...
    lda    #UP_IS_CLEAR
    ora    obstacleFreeDir       ; - no stone above, so up is possible
    sta    obstacleFreeDir

.isDinoOnBottomRow:
    ldx    indexStoneByteDino
    ldy    stoneBitDinoIsOn
    cpx    #BOTTOM_ROW_BYTE_INDEX
    bcc    .checkForStoneBelow   ; - if dino is above bottom row
    bcs    .isDinoOnLeftColumn   ; always branch

.checkForStoneBelow:
    MOVE_INDEX_DOWN_ONE_ROW
    TEST_STONE_BIT
    bcs    .isDinoOnLeftColumn   ; - stone is directly below
    lda    #DOWN_IS_CLEAR
    ora    obstacleFreeDir       ; - no stone below, down direction is possible
    sta    obstacleFreeDir

.isDinoOnLeftColumn:
    ldx    indexStoneByteDino
    ldy    stoneBitDinoIsOn
    cpy    #COLUMN_INDEX_START+1 ; is dino in column 1 or column 6?
    bcs    .checkForStoneToLeft  ; - neither...
    txa                          ; - yes, dino is in one of them, determine if it is column 6.
    and    #RIGHTSIDE_PF_MASK    ; if it is column 6 (right side of playfield), then "indexStoneByteDino" will be an odd number to index the 2nd byte
    bne    .checkStoneColumnFive ; branch, if dino is on column 6
    beq    .isDinoOnRightColumn  ; always branch, dino is in column 1 so no stones can be to left of him.

.checkStoneColumnFive:
    dex                          ; switch index to load left side playfield stones instead
    lda    #SHIFT_STONE_5 +1     ; shift until column five's stone is in the carry, +1 is for handling the very first DEY
    tay
.checkForStoneToLeft:
    dey                          ; decrease by 1 initially, to stop on the stone column to the left of the dinosaur
    TEST_STONE_BIT
    bcs    .isDinoOnRightColumn  ; branch if the left direction is not clear
    lda    #LEFT_IS_CLEAR
    ora    obstacleFreeDir
    sta    obstacleFreeDir

.isDinoOnRightColumn:
    ldx    indexStoneByteDino
    ldy    stoneBitDinoIsOn
    cpy    #COLUMN_INDEX_END     ; is dino on column 5 or 10?
    bcc    .checkForStoneToRight ; - neither...
    txa                          ; - yes, determine if it is column 10.
    and    #RIGHTSIDE_PF_MASK
    beq    .checkStoneColumnSix  ; - branch, if it was column 5
    bne    .finishDinoStoneCheck ; always branch, column 10 is the last column, so we are done here

.checkStoneColumnSix:
    inx                          ; change index to use right side playfield stones, to look at column 6
    lda    #SHIFT_STONE_6        ; get column six's shift value for the routine
    tay
.checkForStoneToRight:
    iny                          ; increase by 1 initially, to stop on the stone column to the right of the dinosaur
    TEST_STONE_BIT
    bcs    .finishDinoStoneCheck
    lda    #RIGHT_IS_CLEAR
    ora    obstacleFreeDir
    sta    obstacleFreeDir

.finishDinoStoneCheck:
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SeparateDinoRowColumn SUBROUTINE ;x2
    ldx    dinoMoveIndex
    lda    dinoPosition,X
    lsr
    lsr
    lsr
    lsr
    sta    currentDinoRow
    lda    #DINO_COLUMN_MASK
    and    dinoPosition,X
    sta    currentDinoColumn
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CheckForStoneThrow SUBROUTINE ;x1
    lda    frameCounter
    and    #SIXTEEN_FRAME_MASK
    EXIT_UNLESS_SUBFRAME   CHECK_THROW_SUBFRAME
    EXIT_IF_STONE_SLIDING

    lda    #STONE_CRUSHED_FLAG   ; set rock being crushed to powder as a default, if the stone can be moved (and won't be crushed) then this flag will be cleared...
    sta    stoneThrowFlag
    lda    currentFirebutton     ; is firebutton pressed?
    bpl    .firebuttonPressed    ; - yes
    lda    #0
    sta    AUDV1
    rts

.firebuttonPressed:
    lda    currentJoystick
    ora    #~DIRECTION_MASK      ; fill the unused joystick bits, 7-4, but this is not essential to the routines goal
    cmp    #JOY_NOT_PRESSED      ; is joystick direction pressed?
    bne    .joystickPressed      ; - yes, we can check for stones to throw
    lda    #0                    ; - no
    sta    AUDV1
    rts

.joystickPressed:
    ldy    #0                    ; no matter what, the volume gets killed
    sty    AUDV1
    sty    pointsMultiplier      ; clear multiplier
    and    #~STONE_MOVING_FLAG   ; clear bit 7, but it was useless to have to filled it anyhow!
    sta    movingStone


  IF BAD_DIRECTIONS
    cmp    #~(STONE_MOVING_FLAG | UP_DIRECTION)   ; we could have skipped the whole OR'ing of the upper nibble, and just checked the direction by itself.
    bne    .seeIfStoneCanSlideDown
    jmp    TryToSlideUp

.seeIfStoneCanSlideDown:
    cmp    #~(STONE_MOVING_FLAG | DOWN_DIRECTION)
    bne    .seeIfStoneCanSlideLeft
    jmp    TryToSlideDown

.seeIfStoneCanSlideLeft:
    cmp    #~(STONE_MOVING_FLAG | LEFT_DIRECTION)
    bne    .defaultTryToSlideStoneRight
    jmp    TryToSlideLeft
                                 ; This routine has a logic error.... it only considers single direction presses as valid.
                                 ; If two directions are pressed at the same time it will jump to the default of trying to
                                 ; throw the stone to the right. It doesn't matter which two directions are pressed either!
.defaultTryToSlideStoneRight:
    jmp    TryToSlideRight



  ELSE                           ; fixing the logic error for stone throw
    nop                          ; free byte, just using NOP's to keep new code aligned with old...
    lsr
    bcs    .seeIfStoneCanSlideDown
    jmp    TryToSlideUp

.seeIfStoneCanSlideDown:
    nop                          ; free byte
    lsr
    bcs    .seeIfStoneCanSlideLeft
    jmp    TryToSlideDown

.seeIfStoneCanSlideLeft:
    nop                          ; free byte
    lsr
    bcs    .defaultTryToSlideStoneRight
    jmp    TryToSlideLeft

.defaultTryToSlideStoneRight:
    jmp    TryToSlideRight

  ENDIF



TryToSlideUp:
    lda    rowCaveman
    cmp    #TOP_ROW
    bne    .lookForStoneAboveCaveman
    rts

.lookForStoneAboveCaveman:
    jsr    BuildCavemanStoneIndexes
    MOVE_INDEX_UP_ONE_ROW
    stx    indexStoneByteCaveman
    sty    stoneBitCavemanIsOn
    TEST_STONE_BIT
    bcs    .pushStoneUp
    rts

.pushStoneUp:
    SET_CAVEMAN_PTRS  CaveMan_Push_Up, ColCaveMan_Push_Up
    DO_STONE_THROW
    rts

TryToSlideDown:
    lda    rowCaveman
    cmp    #BOTTOM_ROW
    bne    .lookForStoneBelowCaveman
    rts

.lookForStoneBelowCaveman:
    jsr    BuildCavemanStoneIndexes
    MOVE_INDEX_DOWN_ONE_ROW
    stx    indexStoneByteCaveman
    sty    stoneBitCavemanIsOn
    TEST_STONE_BIT
    bcs    .pushStoneDown
    rts

.pushStoneDown:
    SET_CAVEMAN_PTRS  CaveMan_Push_Down, ColCaveMan_Push_Down
    DO_STONE_THROW
    rts

TryToSlideRight:
    lda    columnCaveman
    cmp    #RIGHTMOST_COLUMN
    bne    .lookForStoneToRightOfCaveman
    rts

.lookForStoneToRightOfCaveman:
    inc    columnCaveman         ; temporarily increase, to build correct indexes
    jsr    BuildCavemanStoneIndexes
    dec    columnCaveman         ; restore the column
    stx    indexStoneByteCaveman
    sty    stoneBitCavemanIsOn
    TEST_STONE_BIT
    bcs    .pushStoneRight
    rts

.pushStoneRight:
    SET_CAVEMAN_PTRS  CaveMan_Push_LR, ColCaveMan_Push_LR
    lda    #REFLECT_GFX
    sta    reflectCaveman
    DO_STONE_THROW
    rts

TryToSlideLeft:
    lda    columnCaveman
    cmp    #LEFTMOST_COLUMN
    bne    .lookForStoneToLeftOfCaveman
    rts

.lookForStoneToLeftOfCaveman:
    dec    columnCaveman         ; temporarily decrease, to build correct indexes
    jsr    BuildCavemanStoneIndexes
    inc    columnCaveman         ; restore the column
    stx    indexStoneByteCaveman
    sty    stoneBitCavemanIsOn
    TEST_STONE_BIT
    bcs    .pushStoneLeft
    rts

.pushStoneLeft:
    SET_CAVEMAN_PTRS  CaveMan_Push_LR, ColCaveMan_Push_LR
    lda    #NO_REFLECT
    sta    reflectCaveman
    DO_STONE_THROW
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

UpdateStones SUBROUTINE ;x1
    lda    frameCounter
    and    #EIGHT_FRAME_MASK
    EXIT_UNLESS_SUBFRAME   STONE_UPDATE_SUBFRAME
    CONTINUE_IF_STONE_SLIDING

    ldy    #FREQ_STONE_SLIDING
    sty    AUDF1



  IF BAD_DIRECTIONS
    cmp    #STONE_UP_DIR
    bne    .isStoneMovingDown
    jmp    .tryMoveStoneUp

.isStoneMovingDown:
    cmp    #STONE_DOWN_DIR
    bne    .isStoneMovingLeft
    jmp    .tryMoveStoneDown

.isStoneMovingLeft:
    cmp    #STONE_LEFT_DIR
    bne    stoneIsMovingRight
    jmp    .tryMoveStoneLeft

stoneIsMovingRight:
    jmp    .tryMoveStoneRight


  ELSE                           ; fixing the logic error for stone throw
    nop                          ; free byte, just using NOP's to keep new code aligned with old...
    lsr
    bcs    .isStoneMovingDown
    jmp    .tryMoveStoneUp

.isStoneMovingDown:
    nop                          ; free byte
    lsr
    bcs    .isStoneMovingLeft
    jmp    .tryMoveStoneDown

.isStoneMovingLeft:
    nop                          ; free byte
    lsr
    bcs    stoneIsMovingRight
    jmp    .tryMoveStoneLeft

stoneIsMovingRight:
    jmp    .tryMoveStoneRight

  ENDIF


.tryMoveStoneUp:
    ldx    indexStoneByteThrow
    ldy    stoneColumnThrowIsOn
    cpx    #TOP_ROW_BYTE_INDEX
    bcs    .checkStoneUp
    jmp    StoneCanNoLongerMove

.checkStoneUp:
    MOVE_INDEX_UP_ONE_ROW
    TEST_STONE_BIT
    bcc    .moveStoneUp
    jmp    StoneCanNoLongerMove

.moveStoneUp:
    ldx    indexStoneByteThrow
    ldy    stoneColumnThrowIsOn
    GET_STONE_BIT_POSITION
    sta    t1_singleStone
    REMOVE_STONE
    MOVE_INDEX_UP_ONE_ROW
    stx    indexStoneByteThrow
    lda    t1_singleStone
    ADD_STONE
    lda    #STONE_NOT_CRUSHED_FLAG
    sta    stoneThrowFlag
    rts


.tryMoveStoneDown:
    ldx    indexStoneByteThrow
    ldy    stoneColumnThrowIsOn
    cpx    #BOTTOM_ROW_BYTE_INDEX
    bcc    .checkStoneBelow
    jmp    StoneCanNoLongerMove

.checkStoneBelow:
    MOVE_INDEX_DOWN_ONE_ROW
    TEST_STONE_BIT
    bcc    .moveStoneDown
    jmp    StoneCanNoLongerMove

.moveStoneDown:
    ldx    indexStoneByteThrow
    ldy    stoneColumnThrowIsOn
    GET_STONE_BIT_POSITION
    sta    t1_singleStone
    REMOVE_STONE
    MOVE_INDEX_DOWN_ONE_ROW
    stx    indexStoneByteThrow
    lda    t1_singleStone
    ADD_STONE
    lda    #STONE_NOT_CRUSHED_FLAG
    sta    stoneThrowFlag
    rts


.tryMoveStoneLeft:
    ldx    indexStoneByteThrow
    ldy    stoneColumnThrowIsOn
    cpy    #COLUMN_INDEX_START   ; is the stone to be moved in column 1 or 6?
    bne    .lookStoneToLeft      ; - neither...
    lda    indexStoneByteThrow   ; - yes, but is it column 6?
    and    #RIGHTSIDE_PF_MASK
    bne    .lookAtStoneColumnFive; - branch, if it is column 6.
    jmp    StoneCanNoLongerMove  ; - column 1, so we can't go any farther left

.lookAtStoneColumnFive:
    dex                          ; switch index to load left side playfield stones instead
    ldy    #SHIFT_STONE_5 +1     ; shift until column five's stone is in the carry, +1 is for handling the very first DEY
.lookStoneToLeft:
    dey                          ; decrease by 1 initially, to stop on the stone column to the left of the stone to be moved
    TEST_STONE_BIT
    bcc    .moveStoneLeft
    jmp    StoneCanNoLongerMove

.moveStoneLeft:
    ldx    indexStoneByteThrow
    ldy    stoneColumnThrowIsOn
    GET_STONE_BIT_POSITION
    REMOVE_STONE

    ldy    stoneColumnThrowIsOn  ; doing the same logic as before, except we know that we are not in column 1,
    ldx    indexStoneByteThrow   ; and now we are actually moving the stone
    cpy    #COLUMN_INDEX_START
    bne    .notOnColumn6
    dex
    stx    indexStoneByteThrow
    ldy    #SHIFT_STONE_5 +1
.notOnColumn6:
    dey
    sty    stoneColumnThrowIsOn
    GET_STONE_BIT_POSITION
    ADD_STONE
    lda    #STONE_NOT_CRUSHED_FLAG
    sta    stoneThrowFlag
    rts

.tryMoveStoneRight:
    ldx    indexStoneByteThrow
    ldy    stoneColumnThrowIsOn
    cpy    #COLUMN_INDEX_END     ; is stone in column 5 or 10?
    bne    .lookStoneToRight     ; - neither...
    lda    indexStoneByteThrow   ; - yes, determine if it is column 10.
    and    #RIGHTSIDE_PF_MASK
    beq    .lookAtStoneColumnSix ; - branch, if it was column 5
    jmp    StoneCanNoLongerMove  ; column 10 is the last column, so we are done here...

.lookAtStoneColumnSix:
    inx                          ; change index to use right side playfield stones, to look at column 6
    ldy    #SHIFT_STONE_6        ; get column six's shift value for the routine
.lookStoneToRight:
    iny                          ; increase by 1 initially, to stop on the stone column to the right of the stone to be moved
    TEST_STONE_BIT
    bcc    .moveStoneRight
    jmp    StoneCanNoLongerMove

.moveStoneRight:
    ldx    indexStoneByteThrow
    ldy    stoneColumnThrowIsOn
    GET_STONE_BIT_POSITION
    REMOVE_STONE

    ldy    stoneColumnThrowIsOn  ; doing the similar logic as before, and now actually updating stone
    ldx    indexStoneByteThrow
    cpy    #COLUMN_INDEX_END
    bne    .notOnColumn5
    inx
    stx    indexStoneByteThrow
    ldy    #SHIFT_STONE_6
.notOnColumn5:
    iny
    sty    stoneColumnThrowIsOn
    GET_STONE_BIT_POSITION
    ADD_STONE
    lda    #STONE_NOT_CRUSHED_FLAG
    sta    stoneThrowFlag
    rts


StoneCanNoLongerMove:
    lda    stoneThrowFlag        ; - has stone been crushed to powder?
    beq    .stopStoneAudio       ; - no
    lda    frameCounter          ; - yes!
    and    #CRUSHED_STONE_MASK
    cmp    #CRUSHED_STONE_SUBFRAME
    bne    .stopStoneAudio
    ldx    indexStoneByteThrow
    ldy    stoneColumnThrowIsOn
    GET_STONE_BIT_POSITION
    REMOVE_STONE
    jsr    AddCrushedRockPoints
    lda    #FREQ_CRUSHED_STONE
    sta    AUDF1
    lda    #VOL_CRUSHED_STONE
    sta    AUDV1
    bne    .updateStoneFlag      ; always branch

.stopStoneAudio:
    lda    #0                    ; kill special event audio
    sta    AUDV1
.updateStoneFlag:
    lda    #STONE_NOT_SLIDING_FLAG ; this flag is useless!
    sta    movingStone
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AddSquishedDinoScore SUBROUTINE ;x1
    lda    frameCounter
    and    #EIGHT_FRAME_MASK
    EXIT_UNLESS_SUBFRAME   DINO_POINTS_SUBFRAME
    CONTINUE_IF_STONE_SLIDING

    ldx    #NUM_OF_DINOSAURS-1
.loopIsDinoSquished:
    lda    dinoColors,X
    beq    .tryNextDino          ; this dinosaur was already eliminated..

;is dinosaur in the same column as the thrown stone?
    lda    dinoPosition,X
    and    #DINO_COLUMN_MASK
    sta    t1_dinoColumn
    lda    indexStoneByteThrow
    lsr                          ; right or left PF stone byte
    bcs    .useRightByte         ; - use right
    lda    #0                    ; - use left
    beq    .useLeftByte          ; always branch

.useRightByte:
    lda    #(NUM_OF_COLUMNS/2)   ; offset to reach the right playfield
.useLeftByte:
    clc
    adc    stoneColumnThrowIsOn
    sec
    sbc    #SHIFT_UNUSED_BITS
    cmp    t1_dinoColumn
    bne    .tryNextDino          ; dinosaur is not in the column of the thrown stone...

;is dinosaur in the same row as the thrown stone?
    lda    dinoPosition,X
    lsr
    lsr
    lsr
    lsr
    sta    t1_dinoRow
    dec    t1_dinoRow
    lda    indexStoneByteThrow
    lsr
    cmp    t1_dinoRow
    bne    .tryNextDino

;dinosaur has been squashed by the stone!
    lda    #DEAD_DINOSAUR_FLAG   ; a color of 0 (for BEQ/BNE) marks a dead dinosaur
    sta    dinoColors,X
    lda    #DEAD_DINO_POS        ; set row to zero, column to 1
    sta    dinoPosition,X
    lda    #FREQ_DEAD_DINO
    sta    AUDF1
    jsr    AddDinoKillPoints
.tryNextDino:
    dex                          ; move to next dinosaur
    bpl    .loopIsDinoSquished
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AddDinoKillPoints SUBROUTINE ;x1
    sed
    clc
    ldy    playerNum
    lda.wy scoreBcdLow,Y
    ldy    pointsMultiplier
    adc    PointsTabLow,Y
    ldy    playerNum
    sta.wy scoreBcdLow,Y
    lda.wy scoreBcdMid,Y
    ldy    pointsMultiplier
    adc    PointsTabHigh,Y
    ldy    playerNum
    sta.wy scoreBcdMid,Y
    cld
    inc    pointsMultiplier
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  10 --> 40 --> 160 --> 640
;  4x more points each time

PointsTabLow:
    .byte $10,$40,$60,$40
PointsTabHigh:
    .byte $00,$00,$01,$06

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AddCrushedRockPoints SUBROUTINE ;x1
    sed
    clc
    ldy    playerNum
    lda.wy scoreBcdLow,Y
    adc    #CRUSHED_ROCK_POINTS  ; 1's digit is hardcoded to zero, so just update the 10's value digit.
    sta.wy scoreBcdLow,Y
    lda.wy scoreBcdMid,Y
    adc    #0                    ; handled overflow
    sta.wy scoreBcdMid,Y
    cld
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GetScorePtrs SUBROUTINE ;x1
    lda    frameCounter
    and    #EIGHT_FRAME_MASK
    EXIT_UNLESS_SUBFRAME   SCORE_UPDATE_SUBFRAME

    ldy    playerNum
    lda.wy scoreBcdLow,Y
    and    #$0F
    asl
    asl
    asl
    adc    #<Zero
    sta    scorePtrs+6
    lda.wy scoreBcdLow,Y
    and    #$F0
    lsr
    adc    #<Zero
    sta    scorePtrs+4

    lda.wy scoreBcdMid,Y
    and    #$0F
    asl
    asl
    asl
    adc    #<Zero
    sta    scorePtrs+2
    lda.wy scoreBcdMid,Y
    and    #$F0
    lsr
    adc    #<Zero
    sta    scorePtrs

    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CheckIfLevelDone SUBROUTINE ;x1
    lda    startTuneCount
    bne    .contStartTune        ; if starting tune is playing, don't stop!
    lda    frameCounter
    and    #EIGHT_FRAME_MASK
    EXIT_UNLESS_SUBFRAME   LEVEL_DONE_SUBFRAME
    EXIT_IF_STONE_SLIDING

    ldy    #0
    ldx    #NUM_OF_DINOSAURS-1
.loopAnyDinosaursLeft:
    lda    dinoColors,X
    bne    .someDinosaursLive
    iny
.someDinosaursLive:
    dex
    bpl    .loopAnyDinosaursLeft
    cpy    #NUM_OF_DINOSAURS
    beq    LevelComplete        ; all dinosaurs are dead!
    rts

LevelComplete; also jumped to from "CheckForDeath" SUBROUTINE when it's done, so the next player can be set up
    lda    #STARTING_TUNE_LENGTH
    sta    startTuneCount
    ldx    playerNum
    inc    levelNum,X            ; goto next level!
    lda    levelNum,X
    and    #LEVEL_MASK           ; no more then 16 levels
    sta    levelNum,X
    jsr    NewScreenPrep
    lda    #0                    ; kill theme music
    sta    AUDV0
    sta    frameCounter
    jmp    GotoScorePrep

.contStartTune:
    lda    frameCounter
    and    #MUSIC_MASK
    bne    GotoScorePrep
    dec    startTuneCount
    ldx    startTuneCount
    lda    LevelBeginFreqTab,X
    sta    AUDF1
    lda    #TONE_START_TUNE
    sta    AUDC1
    lda    #VOL_START_TUNE
    sta    AUDV1
    dex
    bpl    GotoScorePrep

;start tune has finished!
    lda    #0
    sta    startTuneCount
    sta    indexFreq
    sta    secondsCounter
    sta    dinoMoveIndex
    sta    dinoDrawIndex         ; start at dinosaur 1
    sta    obstacleFreeDir       ; no direction possible (yet)
    sta    movingStone           ; stone can slide
    sta    stoneThrowFlag        ; allow stones to be thrown
    sta    AUDV1                 ; kill audio for the start tune,
    lda    #VOL_MAIN_THEME       ; and turn audio on for the main theme.
    sta    AUDV0

    lda    #TRAVEL_UP | DIRECTION_MASK
    sta    dinoDirection
    lda    #TRAVEL_DOWN | DIRECTION_MASK
    sta    dinoDirection+1
    lda    #TRAVEL_LEFT | DIRECTION_MASK
    sta    dinoDirection+2
    lda    #TRAVEL_RIGHT | DIRECTION_MASK
    sta    dinoDirection+3
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; could just use PLA-PLA-JMP

GotoScorePrep:
    pla
    pla
    lda    #>DoScorePrep
    pha
    lda    #<DoScorePrep
    sec
    sbc    #1
    pha
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; When a level begins this is annoying
; quick tune that plays. Writes to AUDF1.

LevelBeginFreqTab:
    .byte $00,$00                ; <-- end of jingle
    .byte $17,$17,$17,$17
    .byte $13
    .byte $15,$15
    .byte $13
    .byte $15,$15
    .byte $13                    ; <-- start
FinishLevelBeginFreqTab:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

NewScreenPrep SUBROUTINE ;x3
    ldy    playerNum
    lda.wy levelNum,Y
    asl                          ; times 2 for indexing two bytes (left and right sides of PF)
    tax
    lda    LevelConfigTab,X
    sta    tempPtr
    lda    LevelConfigTab+1,X
    sta    tempPtr+1

    ldy    #0
.loopGetStones:
    lda    (tempPtr),Y           ; get stones for current level
    sta.wy stoneOrder,Y
    iny
    cpy    #(End_Stones - Start_Stones) ; length of stone data
    bne    .loopGetStones

    ldx    #0
.loopGetDinoPosition:
    lda    (tempPtr),Y          ; place dinosaurs for current level
    sta    dinoPosition,X
    inx
    iny
    cpy    #(End_Dino_Positions - Start_Stones) ; length of dinosaur position data plus the stone data
    bne    .loopGetDinoPosition

    lda    (tempPtr),Y
    sta    rowCaveman            ; caveman position in terms of rows (1-8)
    iny
    lda    (tempPtr),Y
    sta    columnCaveman         ; caveman position in terms of columns (1-10)

    SET_CAVEMAN_PTRS  CaveMan_Down_Odd, ColCaveMan_Down_Odd

    lda    #>DinoGfx_A
    sta    dinosaurPtr+1
    lda    #<DinoGfx_A
    sta    dinoLoPtr
    sta    dinoLoPtr+1
    sta    dinoLoPtr+2
    sta    dinoLoPtr+3
    lda    #COL_PF_STONES
    sta    colStones

    lda    #COL_DINO1            ; Stored in ram, and when the dinosaur is dead the color is cleared to 0 as a marker.
    sta    dinoColors
    lda    #COL_DINO2
    sta    dinoColors+1
    lda    #COL_DINO3
    sta    dinoColors+2
    lda    #COL_DINO4
    sta    dinoColors+3
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CheckForDeath SUBROUTINE ;x1
    lda    deathCounter
    bne    .checkIfGameIsOver    ; branch, if game is over or a death sequenc is happening
    lda    CXPPMM | $30          ; else, check for collision between dinosaur and caveman
    bmi    StartDeathSequence    ; - branch, if they have collided
    rts

StartDeathSequence; also jumped to from "CheckTimeRemaing" SUBROUTINE, when time has run out.
    lda    #DEATH_GFX_INDEX
    sta    deathCounter
    lda    #0
    sta    frameCounter
    lda    #TONE_DEATH
    sta    AUDC1
    lda    #FREQ_DEATH
    sta    AUDF1
    lda    #VOL_DEATH
    sta    AUDV1
    jmp    GotoScorePrep

.checkIfGameIsOver:
    cmp    #GAME_OVER_FLAG
    bne    .deathStillHappening

    lda    frameCounter          ; the game is over,
    bne    .skipScoreToggle      ; toggle between players everytime the framecounter runs out to show both scores.
    lda    playerNum
    eor    gameMode
    sta    playerNum
.skipScoreToggle:
    jmp    GotoScorePrep

.deathStillHappening:
    ldx    #NUM_OF_DINOSAURS-1
    lda    frameCounter
    and    #DEATH_FRAMES_MASK
    beq    .doDeathSequence
    jmp    GotoScorePrep

.doDeathSequence:
.loopClearDinosaurs:
    sta    dinoColors,X          ; A=0
    dex
    bpl    .loopClearDinosaurs
    sta    CXCLR
    sta    AUDV0                 ; kill theme music
    lda    deathCounter
    asl                          ; times 2 to index WORD size pointers
    tax
    lda    DeathGfxPtrs,X
    sta    cavemanPtr
    lda    DeathGfxPtrs+1,X
    sta    cavemanPtr+1
    lda    #<DeathGfxColTab
    sta    cavemanColPtr
    lda    #>DeathGfxColTab
    sta    cavemanColPtr+1
    lda    DeathSoundFreqTab,X
    sta    AUDF1
    dec    deathCounter
    beq    .finishDeathSequence
    jmp    GotoScorePrep

.finishDeathSequence:
    lda    #0
    sta    AUDV1
    ldx    playerNum
    dec    numOfLivesP0,X        ; has player lost their final life?
    bne    .switchPlayers        ; - no, continue game, move to next player

                                 ; one of the players is completely dead, look for game over...
    cpx    gameMode              ; who died?
    bne    .switchPlayers        ; - branch, only if it was P0 on a two player game mode, because P1 has to lose their final life before the game is finally over
                                 ; ** Note - the game gets away with this logic because it awards no bonus lives, and P0 will always die before P1

;either P0 (on a one player game), or P1 (two player game) has finished their final life, and the game is over
    lda    #GAME_OVER_FLAG
    sta    deathCounter
    jmp    GotoScorePrep

.switchPlayers:
    lda    gameMode
    eor    playerNum
    sta    playerNum
    tax
    dec    levelNum,X            ; this is to compensate for the INC levelNum,X that is encounters in "LevelComplete",
    jmp    LevelComplete         ; so that you don't bump up a level when the other player dies.

DeathGfx_A:
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
DeathGfx_B:
    .byte $00 ; |        |
    .byte $52 ; | X X  X |
    .byte $00 ; |        |
    .byte $02 ; |      X |
    .byte $40 ; | X      |
    .byte $00 ; |        |
    .byte $4A ; | X  X X |
    .byte $00 ; |        |
DeathGfx_C:
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $24 ; |  X  X  |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $24 ; |  X  X  |
    .byte $00 ; |        |
    .byte $00 ; |        |
DeathGfx_D:
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $18 ; |   XX   |
    .byte $18 ; |   XX   |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
DeathGfxColTab:
    .byte COL_48
    .byte COL_48
    .byte COL_48
    .byte COL_48
    .byte COL_48
    .byte COL_48
    .byte COL_48
    .byte COL_48
DeathSoundFreqTab:
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $00 ; |        |
    .byte $09 ; |    X  X|
    .byte $09 ; |    X  X|
    .byte $07 ; |     XXX|
    .byte $07 ; |     XXX|
    .byte $05 ; |     X X|
    .byte $05 ; |     X X|

DeathGfxPtrs:
    .word DeathGfx_A
    .word DeathGfx_A
    .word DeathGfx_B
    .word DeathGfx_C
    .word DeathGfx_D
EndDeathPtrs:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                            MoveDinosaur  SUBROUTINE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MoveDinosaur SUBROUTINE ;x1
    lda    frameCounter
    ldx    playerNum
    and    difficultyP0,X
    EXIT_UNLESS_SUBFRAME   DINO_DO_MOVEMENT_SUBFRAME
    EXIT_IF_STONE_SLIDING

    jsr    SeparateDinoRowColumn
    ldx    dinoMoveIndex
    lda    obstacleFreeDir       ; Get all direction choices which are not blocked by stones or screen boundaries,
    and    dinoDirection,X       ; and eliminate whichever direction is opposite to the current one.

    sta    t1_dinoMoveChoices    ; ( direction of current travel  |  direction choices )

    lda    dinoDirection,X       ; if dinosaur changed direction, re-allow the old opposite direction,
    eor    #DIRECTION_MASK       ; while blocking the new opposite direction. Then get rid of all
    and    obstacleFreeDir       ; directions blocked by stones (for the next movement time). This keeps dino from changing
    eor    #DIRECTION_MASK       ; direction too much in a tight area, but freedom to move any which way in an open area.
    sta    dinoDirection,X

;---------------------------------------
; attract dinosaur to caveman
;---------------------------------------
    lda    #(DIRECTION_MASK << 4); not required, as only the low 4 bits ever get AND'd and checked...
    sta    t2_attractDirection
    lda    currentDinoRow
    cmp    rowCaveman
    beq    .doColumnCompare      ; dinosaur and caveman are on same row, no need to move dino up/down
    bcs    .tryMoveDinoUp        ; dino is below caveman (down and up are reversed)
    lda    #DOWN_DIRECTION       ; dino is above caveman
    ora    t2_attractDirection
    sta    t2_attractDirection
    bne    .doColumnCompare      ; always branch

.tryMoveDinoUp:
    lda    #UP_DIRECTION
    ora    t2_attractDirection
    sta    t2_attractDirection
.doColumnCompare:
    lda    currentDinoColumn
    cmp    columnCaveman
    beq    .testMovement         ; dinosaur and caveman are on same column
    bcs    .tryMoveDinoLeft      ; dino is to the right of caveman
    lda    #RIGHT_DIRECTION      ; dino is to the left of caveman
    ora    t2_attractDirection
    sta    t2_attractDirection
    bne    .testMovement         ; always branch

.tryMoveDinoLeft:
    lda    #LEFT_DIRECTION
    ora    t2_attractDirection
    sta    t2_attractDirection
.testMovement:
    lda    t2_attractDirection   ; get directions that bring dino closer to caveman
    and    t1_dinoMoveChoices
    and    #DIRECTION_MASK       ; can dino move towards caveman?
    beq    .tryOldDirection      ; - no, dino can't move towards the caveman
    sta    t1_dinoDirection      ; - yes, travel in one of those directions, UP/DOWN taking priority over LEFT/RIGHT
    jmp    DoDinosaurMovement

;---------------------------------------
; dino can't be attracted to caveman, so
; can dino continue in current direction?
;---------------------------------------
.tryOldDirection:
    lda    t1_dinoMoveChoices
    lsr
    lsr
    lsr
    lsr
    sta    t2_dinoCurrentDir
    and    t1_dinoMoveChoices    ; can the dinosaur continue his current direction?
    beq    .isCurrentDirClear    ; - no
    sta    t1_dinoDirection      ; - yes, travel in that direction
    jmp    DoDinosaurMovement

.isCurrentDirClear:
    lda    t2_dinoCurrentDir     ; is forward unblocked for dino?
    and    obstacleFreeDir
    bne    .canDino90degreeTurn  ; - yes

    lda    t2_dinoCurrentDir     ; - no, reverse directions
    cmp    #UP_DIRECTION
    bne    .seeDinoDown
    asl                          ; change to DOWN_DIRECTION
    bne    .storeOppositeDir     ; always branch

.seeDinoDown:
    cmp    #DOWN_DIRECTION
    bne    .seeDinoLeft
    lsr                          ; change to UP_DIRECTION
    bne    .storeOppositeDir     ; always branch

.seeDinoLeft:
    cmp    #LEFT_DIRECTION
    bne    .doDinoRight
    asl                          ; change to RIGHT_DIRECTION
    bne    .storeOppositeDir     ; always branch

.doDinoRight:
    lsr                          ; change to RIGHT_DIRECTION
.storeOppositeDir:
    sta    t2_dinoCurrentDir     ; updated to travel in opposite direction!
.canDino90degreeTurn:
    lda    t1_dinoMoveChoices
    and    #DIRECTION_MASK
    beq    .moveDinoFwdOrBack    ; - dino can not do a 90 degree turn, travel in current direction or do 180 turn
    sta    t1_dinoDirection
    jmp    DoDinosaurMovement

.moveDinoFwdOrBack:
    lda    t2_dinoCurrentDir
    and    obstacleFreeDir
    beq    .dinosaurCantMove
    sta    t1_dinoDirection
    jmp    DoDinosaurMovement

.dinosaurCantMove:
    rts

DoDinosaurMovement:
    lda    t1_dinoDirection
    lsr
    bcc    .checkDinoDown
    jmp    MoveDinoUp

.checkDinoDown:
    lsr
    bcc    .checkDinoLeft
    jmp    MoveDinoDown

.checkDinoLeft:
    lsr
    bcc    .defaultDinoRight
    jmp    MoveDinoLeft

.defaultDinoRight:
    jmp    MoveDinoRight

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CheckSwitches SUBROUTINE ;x1
    ldx    #HARD_SETTING_MASK    ; these masks AND with the frameCounter, controlling how fast the dinosaurs can move
    lda    #EASY_SETTING_MASK
    sta    difficultyP0
    sta    difficultyP1          ; default to easy setting
    lda    SWCHB

  IF REVERSED_CONTROLS
    bmi    .checkP0difficulty
    stx    difficultyP0
.checkP0difficulty:
    and    #DIFFICULTY_SWITCH_P1
    bne    .checkSelectSwitch
    stx    difficultyP1
.checkSelectSwitch:

  ELSE
    bpl    .checkP0difficulty
    stx    difficultyP1
.checkP0difficulty:
    and    #DIFFICULTY_SWITCH_P1
    beq    .checkSelectSwitch
    stx    difficultyP0
.checkSelectSwitch:
  ENDIF

    lda    SWCHB
    and    #SELECT_SWITCH
    eor    switchesEor
    and    #SELECT_SWITCH
    beq    .checkReset
    eor    switchesEor
    sta    switchesEor
    and    #SELECT_SWITCH
    bne    .checkReset
    lda    gameMode
    eor    #SELECT_GAME_MODE
    sta    gameMode
    jmp    DoReset

.checkReset:
    lda    SWCHB
    and    #RESET_SWITCH
    eor    switchesEor
    and    #RESET_SWITCH
    beq    .exitSwitchesCheck
    eor    switchesEor
    sta    switchesEor
    and    #RESET_SWITCH
    bne    .exitSwitchesCheck
    jmp    DoReset

.exitSwitchesCheck:
    rts

DoReset:
    lda    #0
    sta    AUDV0                 ; kill all music
    sta    AUDV1
    sta    CXCLR
    sta    moveCavemanFlag
    ldx    #0

;clear the following to 0:
;  scoreBcdLow        ds 2  ; $C9-$CA    P0,P1
;  scoreBcdMid        ds 2  ; $CB-$CC    P0,P1
;  levelNum           ds 2  ; $CD-$CE    P0,P1
;  playerNum          ds 1  ; $CF
;  startTuneCount     ds 1  ; $D0
;  deathCounter       ds 1  ; $D1

.loopClearForLevelStart:
    sta    scoreBcdLow,X
    inx
    cpx    #(deathCounter-scoreBcdLow)+1
    bne    .loopClearForLevelStart
    lda    #ALLOW_JOYSTICK_FLAG
    sta    joystickDelay
    lda    #START_LIVES
    sta    numOfLivesP0
    ldy    gameMode              ; Is it a 2 player game?
    bne    .setLivesDisplayP1    ; - yes
    lda    #0                    ; - no, set lives for P1 to zero, and they won't appear on screen
.setLivesDisplayP1:
    sta    numOfLivesP1
    jsr    NewScreenPrep
    lda    #STARTING_TUNE_LENGTH
    sta    startTuneCount
    jmp    GotoScorePrep

  IF SHOW_FREE_BYTES
    ECHO [$FE70-*]d, "free bytes"
  ENDIF
SHOW_FREE_BYTES = 1

       ORG $FE70, 0

LevelConfigTab:
    .word Level_01
    .word Level_02
    .word Level_03
    .word Level_04
    .word Level_05
    .word Level_06
    .word Level_07
    .word Level_08
    .word Level_09
    .word Level_10
    .word Level_11
    .word Level_12
    .word Level_13
    .word Level_14
    .word Level_15
    .word Level_16

Level_01:
Start_Stones:
    stones ___X_X____
    stones XX_X_XXXX_
    stones ___X______
    stones _XXX_XX_X_
    stones ______X_X_
    stones XX_X__X_X_
    stones _X_XX_X_XX
    stones ___X__X___
End_Stones:

Start_Dino_Positions:
    dino1PosXY   1,8
    dino2PosXY   10,8
    dino3PosXY   1,1
    dino4PosXY   10,1
End_Dino_Positions:
    cavemanPosXY 5,5

Level_03:
    stones ____X___X_
    stones _X_XX_XXX_
    stones _X__X_____
    stones _XX_XX_XX_
    stones _______X__
    stones _XXX___X__
    stones XX___XXX__
    stones __________

    dino1PosXY   3,8
    dino2PosXY   10,6
    dino3PosXY   1,4
    dino4PosXY   8,1
    cavemanPosXY 5,4

Level_02:
    stones __________
    stones _X_XXXXXX_
    stones _X____X___
    stones _X_X__X_X_
    stones _X_X__X_X_
    stones ___X____X_
    stones _XXXXXX_X_
    stones __________

    dino1PosXY   1,8
    dino2PosXY   10,8
    dino3PosXY   1,1
    dino4PosXY   10,1
    cavemanPosXY 5,5

Level_14:
    stones __________
    stones _XXX__XXX_
    stones _X______X_
    stones ____XX____
    stones ____XX____
    stones _X______X_
    stones _XXX__XXX_
    stones __________

    dino1PosXY   8,8
    dino2PosXY   1,6
    dino3PosXY   10,3
    dino4PosXY   3,1
    cavemanPosXY 7,5

Level_10:
    stones __________
    stones _XXX____X_
    stones __X_______
    stones __X_______
    stones _______X__
    stones _______X__
    stones _X____XXX_
    stones __________

    dino1PosXY   5,8
    dino2PosXY   10,5
    dino3PosXY   1,4
    dino4PosXY   6,1
    cavemanPosXY 7,4

Level_04:
    stones __________
    stones _X_XXXXXX_
    stones _X_X____X_
    stones _X_X__X_X_
    stones _X_XXXX_X_
    stones _X______X_
    stones _XXXXXXXX_
    stones __________

    dino1PosXY   5,6
    dino2PosXY   3,3
    dino3PosXY   1,1
    dino4PosXY   10,1
    cavemanPosXY 1,8

Level_08:
    stones __________
    stones _XXXXXXXX_
    stones _X______X_
    stones _X______X_
    stones _X______X_
    stones _X______X_
    stones _XXXXXXXX_
    stones __________

    dino1PosXY   3,6
    dino2PosXY   10,6
    dino3PosXY   1,3
    dino4PosXY   8,3
    cavemanPosXY 6,5

Level_06:
    stones __________
    stones _X_X_X_X__
    stones _X_X_X_X__
    stones __X_X_X_X_
    stones __X_X_X_X_
    stones _X_X_X_X__
    stones _X_X_X_X__
    stones __________

    dino1PosXY   1,8
    dino2PosXY   10,8
    dino3PosXY   1,1
    dino4PosXY   10,1
    cavemanPosXY 5,1

Level_12:
    stones ___X___X__
    stones _X___X___X
    stones ___X___X__
    stones _X___X___X
    stones ___X___X__
    stones _X___X___X
    stones ___X___X__
    stones _X___X___X

    dino1PosXY   1,8
    dino2PosXY   7,8
    dino3PosXY   5,5
    dino4PosXY   9,4
    cavemanPosXY 1,2

Level_15:
    stones __________
    stones _XXXXXXXX_
    stones __________
    stones _X_X__X_X_
    stones _X_X__X_X_
    stones __________
    stones _XXXXXXXX_
    stones __________

    dino1PosXY   1,6
    dino2PosXY   10,6
    dino3PosXY   1,3
    dino4PosXY   10,3
    cavemanPosXY 6,5

Level_16:
    stones X_________
    stones __X__X__X_
    stones _X__X__X__
    stones __________
    stones __X__X__X_
    stones _X__X__X__
    stones ___X__X___
    stones X________X

    dino1PosXY   7,8
    dino2PosXY   1,5
    dino3PosXY   10,5
    dino4PosXY   6,1
    cavemanPosXY 4,5

Level_11:
    stones __XXXX____
    stones _XXXXX_XXX
    stones _XX____XXX
    stones ____XX____
    stones X_XXXX_XX_
    stones X_XX___XX_
    stones X____X_XX_
    stones XXXXXX____

    dino1PosXY   1,5
    dino2PosXY   7,5
    dino3PosXY   2,2
    dino4PosXY   10,1
    cavemanPosXY 10,8

Level_09:
    stones ________X_
    stones _XXXXXXXX_
    stones _X___X____
    stones _X_X_X_X__
    stones _X_X_X_X__
    stones ___X___X__
    stones _XXXXXXX__
    stones _X_____X__

    dino1PosXY   2,8
    dino2PosXY   1,3
    dino3PosXY   5,3
    dino4PosXY   9,2
    cavemanPosXY 10,6

Level_13:
    stones __________
    stones _XX_XX_XX_
    stones _XX_XX_XX_
    stones _XX_XX____
    stones ____XX_XX_
    stones _XX_XX_XX_
    stones _XX_XX_XX_
    stones __________

    dino1PosXY   1,8
    dino2PosXY   10,5
    dino3PosXY   4,4
    dino4PosXY   9,1
    cavemanPosXY 1,4

Level_07:
    stones _____X_X__
    stones _XXX_X_X__
    stones __________
    stones _XX__XXX__
    stones _____X___X
    stones _XXXXX____
    stones _____X_X__
    stones __X__X_X__

    dino1PosXY   1,8
    dino2PosXY   10,8
    dino3PosXY   1,1
    dino4PosXY   10,1
    cavemanPosXY 5,4

Level_05:
    stones __________
    stones _X_XXXX_XX
    stones _X____X___
    stones _X____X___
    stones _X_X_XX_X_
    stones ___X____X_
    stones XX_XXX__X_
    stones ________X_

    dino1PosXY   1,8
    dino2PosXY   9,6
    dino3PosXY   3,3
    dino4PosXY   7,1
    cavemanPosXY 5,4


    .byte $C8 ; |XX  X   | $FFF0  garbage data
    .byte $0A ; |    X X | $FFF1
    .byte $F0 ; |XXXX    | $FFF2
    .byte $02 ; |      X | $FFF3
    .byte $68 ; | XX X   | $FFF4
    .byte $08 ; |    X   | $FFF5
    .byte $90 ; |X  X    | $FFF6
    .byte $F0 ; |XXXX    | $FFF7
    .byte $28 ; |  X X   | $FFF8
    .byte $F0 ; |XXXX    | $FFF9
    .byte $20 ; |  X     | $FFFA
    .byte $B9 ; |X XXX  X| $FFFB

       ORG $FFFC
    .word START

    .byte $D0 ; |XX X    | $FFFE  garbage data
    .byte $D6 ; |XX X XX | $FFFF
