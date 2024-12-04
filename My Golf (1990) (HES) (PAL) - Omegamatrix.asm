; Rough Disassembly of My Golf
; Disassembled by Omegamatrix
;
; Golf1.cfg contents:
;
;      ORG D000
;      CODE D000 D5CD
;      GFX D5CE DBF3
;      CODE DBF4 DC02
;      GFX DC03 DEFF
;      CODE DF00 DF2D
;      GFX DF2E DFDF
;      CODE DFE0 DFEB
;      GFX DFEC DFFF
;
; Golf2.cfg contents:
;      ORG F000
;      CODE F000 FA9D
;      GFX FA9E FADD
;      CODE FADE FC2C
;      GFX FC2D FFDF
;      CODE FFE0 FFEB
;      GFX FFEC FFFF

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
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
RESM1   =  $13
RESBL   =  $14
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
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
CXP0FB  =  $32
CXPPMM  =  $37
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SWITCHES
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;one on at a time!
ORIGINAL   = 1
ALTERNATE  = 0

  IF ORIGINAL
UNK_01     = $0E

  ELSE ALTERNATE
UNK_01     = $0C

  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      USER CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;clubs
ONE_WOOD        = $00
PITCHING_WEDGE  = $0E
SAND_WEDGE      = $0F
PUTTER          = $10
VIEW_AHEAD      = $11

;lower screen
SHOW_SCORE      = $00
SHOW_CLUB       = $01
SHOW_VIEW       = $02
REMOVE_HILIGHT  = $7F
ADD_HILIGHT     = $80
HILIGHT_CLUBS   = $81
HILIGHT_VIEW    = $82
SHOW_GOLFER     = $FF

;time
TIME_OVERSCAN       = $44
TIME_VBLANK         = $45

;screens
CYCLES_23  = %00000000
CYCLES_29  = %00100000
CYCLES_35  = %01000000
CYCLES_41  = %01100000
CYCLES_47  = %10000000
CYCLES_53  = %10100000
CYCLES_59  = %11000000
CYCLES_65  = %11100000

EMPTY_GND_A     = %00000
TEE_BOX         = %00001
TREE_1          = %00010
TREE_2_CLOSE    = %00011
TREE_2_MED      = %00100
TREE_3_CLOSE    = %00101
TREE_2_WIDE     = %00110
TREE_3_MED      = %00111
WATER_1         = %01000
WATER_2_CLOSE   = %01001
WATER_2_MED     = %01010
WATER_3_CLOSE   = %01011
WATER_2_WIDE    = %01100
WATER_3_MED     = %01101
SAND_1          = %01110
SAND_2_CLOSE    = %01111
SAND_2_MED      = %10000
SAND_3_CLOSE    = %10001
SAND_2_WIDE     = %10010
SAND_3_MED      = %10011
LARGE_TREE      = %10100
LARGE_WATER     = %10101
LARGE_SAND      = %10110
ROUGH_AREA      = %10111
GREEN_AREA      = %11000
STREAM          = %11001
TINY_FIELD      = %11010
WIDE_RIVER      = %11011
SHORT_FIELD     = %11100
MEDIUM_FIELD    = %11101
LONG_FIELD      = %11110
RIVERS_EDGE     = %11111

;flip direction arrow gfx
HORIZ_FLIP      = %01
VERT_FLIP       = %10
NO_HORIZ_FLIP   = %00
NO_VERT_FLIP    = %00

;ENAxx
ENABLE          = %10
DISABLE         = %00

;VDELPx
DELAY           = 1
NO_DELAY        = 0

;flags
DO_TITLE_SCREEN = $FF
DO_GAME_SCREEN  = $00

EVEN_PAR        = 0
UNDER_PAR       = 1
OVER_PAR        = 2
;---------------------------------------------------------
;      COLOR CONSTANTS
;---------------------------------------------------------

COL_TEXT_TITLE      = WHITE       ; text color on title screen
COL_GRASS           = GREEN       ; putting screen only
COL_GOLF_BALL       = LIGHT_GREY  ; putting screen only
COL_BALL_N_ARROW    = LIGHT_GREY  ; golf ball and direction arrow
COL_PB_SIDES_TOP    = WHITE       ; top and side borders of power bar
COL_PB_DOTS         = LIGHT_GREY  ; dot markers inside power bar
COL_PB_BOTTOM       = WHITE       ; bottom border of power bar
COL_LETTERS         = WHITE       ; hole number, handicap, wind direction, etc...
COL_CLUB            = RED+4       ; the word "club" and your golf club number
COL_CLUB_HILITE     = YELLOW      ; when you select a club highlight "club" and number
COL_STROKES_N_WIND  = WHITE       ; the "st" for strokes plus wind arrow and numbers

;PAL color palette
BLUE          = $C8
BROWN         = $42
LIGHT_GREY    = $0C
LIGHT_RED     = $6C
LIGHT_TAN     = $4E
GREEN         = $54
GREY1         = $04
GREY2         = $14  ; same color as GREY1
RED           = $64
YELLOW        = $28
PURPLE        = $C4
WHITE         = $0F

;---------------------------------------------------------
;      MOTION AND SIZE CONSTANTS
;---------------------------------------------------------

;HMPx
LEFT_7        = $70
LEFT_6        = $60
LEFT_5        = $50
LEFT_4        = $40
LEFT_3        = $30
LEFT_2        = $20
LEFT_1        = $10
NO_MOTION     = $00
RIGHT_1       = $F0
RIGHT_2       = $E0
RIGHT_3       = $D0
RIGHT_4       = $C0
RIGHT_5       = $B0
RIGHT_6       = $A0
RIGHT_7       = $90
RIGHT_8       = $80

;SIZx
ONE_COPY              = %000
DOUBLE_SIZE_PLAYER    = %101
QUAD_SIZE_PLAYER      = %111
TWO_COPIES_CLOSE      = %001
TWO_COPIES_MED        = %010
TWO_COPIES_WIDE       = %100
THREE_COPIES_CLOSE    = %011
THREE_COPIES_MED      = %110

;ball size
BALL_1_CLOCK_WIDE     = %000000
BALL_2_CLOCKS    = %010000
BALL_4_CLOCKS    = %100000
BALL_8_CLOCKS    = %110000

REFLECT        = 1
NO_REFLECT     = 0

;---------------------------------------------------------
;      AUDIO CONSTANTS
;---------------------------------------------------------

FREQ_1   = %00000   ;     30 KHz  reference frequency
FREQ_2   = %00001   ;     15 KHz
FREQ_3   = %00010   ;     10 KHz
FREQ_4   = %00011   ;    7.5 KHz
FREQ_5   = %00100   ;      6 KHz
FREQ_6   = %00101   ;      5 KHz
FREQ_7   = %00110   ; ~ 4.29 KHz  (30 KHz / 7)
FREQ_8   = %00111   ;   3.75 KHz
FREQ_9   = %01000   ; ~ 3.33 KHz  (30 KHz / 9)
FREQ_10  = %01001   ;      3 KHz
FREQ_11  = %01010   ; ~ 2.73 KHz  (30 KHz / 11)
FREQ_12  = %01011   ;    2.5 KHz
FREQ_13  = %01100   ; ~ 2.31 KHz  (30 KHz / 13)
FREQ_14  = %01101   ; ~ 2.14 KHz  (30 KHz / 14)
FREQ_15  = %01110   ;      2 KHZ
FREQ_16  = %01111   ; ~ 1.88 KHz  (30 KHz / 16)

;FREQ_0   = 0   ;     30 kHz  reference frequency
;FREQ_1   = 1   ;     15 kHz
;FREQ_2   = 2   ;     10 kHz
;FREQ_3   = 3   ;    7.5 kHz
;FREQ_4   = 4   ;      6 kHz
;FREQ_5   = 5   ;      5 kHz
;FREQ_6   = 6   ; ~ 4.29 kHz  (30 kHz / 7)
;FREQ_7   = 7   ;   3.75 kHz
;FREQ_8   = 8   ; ~ 3.33 kHz  (30 kHz / 9)
;FREQ_9   = 9   ;      3 kHz
;FREQ_10  = 10  ; ~ 2.73 kHz  (30 kHz / 11)
;FREQ_11  = 11  ;    2.5 kHz
;FREQ_12  = 12  ; ~ 2.31 kHz  (30 kHz / 13)
;FREQ_13  = 13  ; ~ 2.14 kHz  (30 kHz / 14)
;FREQ_14  = 14  ;      2 kHz
;FREQ_15  = 15  ; ~ 1.88 kHz  (30 kHz / 16)
;FREQ_16  = 16  ; ~ 1.76 kHz  (30 kHz / 17)
;FREQ_17  = 17  ; ~ 1.67 kHz  (30 kHz / 18)
;FREQ_18  = 18  ; ~ 1.58 kHz  (30 kHz / 19)
;FREQ_19  = 19  ;    1.5 kHz
;FREQ_20  = 20  ; ~ 1.43 kHz  (30 kHz / 21)
;FREQ_21  = 21  ; ~ 1.36 kHz  (30 kHz / 22)
;FREQ_22  = 22  ; ~ 1.30 kHz  (30 kHz / 23)
;FREQ_23  = 23  ;   1.25 kHz
;FREQ_24  = 24  ;    1.2 kHz
;FREQ_25  = 25  ; ~ 1.15 kHz  (30 kHz / 26)
;FREQ_26  = 26  ; ~ 1.11 kHz  (30 kHz / 27)
;FREQ_27  = 27  ; ~ 1.07 kHz  (30 kHz / 28)
;FREQ_28  = 28  ; ~ 1.03 kHz  (30 kHz / 29)
;FREQ_29  = 29  ;      1 kHz
;FREQ_30  = 30  ; ~ 0.97 kHz  (30 kHz / 31)
;FREQ_31  = 31  ; ~ 0.94 kHz  (30 kHz / 32)


TONE_1    = %0000   ; set to 1
TONE_2    = %0001   ; 4 bit poly
TONE_3    = %0010   ; div 15 -> 4 bit poly
TONE_4    = %0011   ; 5 bit poly -> 4 bit poly
TONE_5    = %0100   ; div 2 : pure tone
TONE_6    = %0101   ; div 2 : pure tone
TONE_7    = %0110   ; div 31 : pure tone
TONE_8    = %0111   ; 5 bit poly -> div 2
TONE_9    = %1000   ; 9 bit poly (white noise)
TONE_10   = %1001   ; 5 bit poly
TONE_11   = %1010   ; div 31 : pure tone
TONE_12   = %1011   ; set last 4 bits to 1
TONE_13   = %1100   ; div 6 : pure tone
TONE_14   = %1101   ; div 6 : pure tone
TONE_15   = %1110   ; div 93 : pure tone
TONE_16   = %1111   ; 5 bit poly div 6

;volume control
;AUDV0 uses the low nybble only,
;these will get right shifted 4 times, and then loaded into AUDV0
NO_VOL     = $00
VOL_1      = $10
VOL_2      = $20
VOL_3      = $30
VOL_4      = $40
VOL_5      = $50
VOL_6      = $60
VOL_7      = $70
VOL_8      = $80
VOL_9      = $90
VOL_10     = $A0
VOL_11     = $B0
VOL_12     = $C0
VOL_13     = $D0
VOL_14     = $E0
VOL_15     = $F0

;number of frames for audio
;only high nybble is used
END_FRAME  = $00
FRAMES_1   = $10
FRAMES_2   = $20
FRAMES_3   = $30
FRAMES_4   = $40
FRAMES_5   = $50
FRAMES_6   = $60
FRAMES_7   = $70
FRAMES_8   = $80
FRAMES_9   = $90
FRAMES_10  = $A0
FRAMES_11  = $B0
FRAMES_12  = $C0
FRAMES_13  = $D0
FRAMES_14  = $E0
FRAMES_15  = $F0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


resetSelectFlag     = $80
numOfPlayers        = $81  ; 0 = one player, 1 = two players
notUsed             = $82  ; seems not used
waste3cycles        = $83
numOfZones          = $83
temp1               = $83  ; $83 to $86 used for adding/subtracting
temp2               = $84
displayLine         = $84
temp2_RESP1         = $84
;84 - 86
;87
;--------------------------
playerScoreLo       = $88
scoreLoP1           = playerScoreLo  ; $88 for player 1, $89 for player 2
playerScoreHi       = $8A
scoreHiP1           = playerScoreHi  ; $8A for player 1, $8B for player 2
;--------------------------
frameCounter        = $8C
;--------------------------
displayPtrs         = $8D             ; $8D - $98   for logo's, scores, titles, colors etc...

golferLeftSide      = displayPtrs     ; $8D - $8E  left side of the golfer gfx
golferRightSide     = displayPtrs+2   ; $8F - $90  right side of the golfer gfx
golferColPtr        = displayPtrs+4   ; $91 - $92  color pointers for the golfer gfx

dispSix             = displayPtrs     ; $8D - $8E  the last byte to appear in a six byte wide display
dispFive            = displayPtrs+2   ; $8F - $90  2nd last byte in the six byte display
dispFour            = displayPtrs+4   ; $91 - $92  4th byte from left
dispThree           = displayPtrs+6   ; $93 - $94
dispTwo             = displayPtrs+8   ; $95 - $96
dispOne             = displayPtrs+10  ; $97 - $98
;--------------------------
oneOrZero           = $99  ; used to index between player 1 and player 2
holeNumber          = $9A  ; hole one = 0, hole two = 1, hole three = 2, etc..
holeNumberSeed      = $9B  ; used to find low pointers for the number gfx of the current hole
parForHole          = $9C
notUsed2            = $9D  ; seems not used
yardsLoBCD          = $9E  ; 10's and 1's digit
yardsHiBCD          = $9F  ; 100's digit, no hole uses the 1000's digit
plusMinusFlag       = $A0  ; 0 = even par "+", 1 = under par "-" , 2 = over par "+"
                           ; $A0 - $A1, player 1 uses $A0, player 2 uses $A1
;--------------------------
clubsOrView         = $A2  ; $00 - $04 woods, $05 - $0D irons, $0E pitching wedge, $0F sand wedge, $10 putter, $11 "view"
windSpeedDir        = $A3  ;
numOfStrokes        = $A4
strokesP1           = numOfStrokes      ; $A4
strokesP2           = numOfStrokes+1    ; $A5
;--------------------------
displayFlag         = $A6  ; $FF draw golfer
ParOverUnder        = $A7  ; player 1 uses $A7, player 2 uses $A8
;A9
powerBarHpos        = $AA  ; low nybble used to reposition ball (2600's ball, not the golf ball)
;AB
screenNumber        = $AC             ; number of fairway screens before the green, 0 is 1 screen, 1 is 2 screens, etc..
screenNumber_P1     = screenNumber
screenNumber_P2     = screenNumber+1
;--------------------------
objectPtr           = $AE
colorPtr            = objectPtr+2     ; $B0
numSizPtr           = objectPtr+4     ; $B2
groundColorPtr      = objectPtr+6     ; $B4
;--------------------------
arrowDirection      = $B6
playerGfxIndex      = $B7
ball_Horz           = $B8  ; check
ball_Horz_P1        = ball_Horz     ; $B8  check
ball_Horz_P2        = ball_Horz+1   ; $B9  check
;BA
ball_Vert           = $BB
ball_Vert_P1        = ball_Vert     ; $BC
ball_Vert_P2        = ball_Vert+1   ; $BC
;BD - C8
ballAndDirection    = $C9  ; $C9 - $D0    golf ball and direction arrow
scanlinesToBall     = $D1
;D2
blankTopLines       = $D3  ; blank lines top of screen, changes with different objects used
zoneObjects         = $D4  ; $D4 - $DA
;DB - DC
delayPlayer         = $DD
delayP2             = $DE  ; ??
;DF - E1
golferGfxSeed       = $E1
onTheGreenFlag      = $E2             ; $FF on the green screen, $00 not on the green
onTheGreenFlag_P1   = onTheGreenFlag
onTheGreenFlag_P2   = onTheGreenFlag+1
collisionFlag       = $E4  ;bit 7 AND #$80 (collision P0 with P1), bit 6 AND #$40 (collison P0 with playfield)
;E5 - E6
copyBallHpos        = $E7
copyBallVpos        = $E8
copyScreenNum       = $E9
;EA - EB
audioCount          = $ED
audioTabIndex       = $EE
playerClubs         = $EF
clubsP1             = playerClubs
clubsP2             = playerClubs+1
screenFlag          = $F1  ; $00 = main game, $FF = title screen
upDownAudioFlag     = $F2  ; up or down directions on the joystick trigger this sound
arrowFlag           = $F3
;F4 - F5
;F6 - FF not used



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      FIRST BANK
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


       org $D000

    cli                          ; 2
    bit    LFFF9                 ; 4   bank switch, start game in the other bank with the clear loop

LD004:
    lda    screenFlag            ; 3
    beq    .gameScreens          ; 2³
    ldx    #$50                  ; 2   do vertical positioning of text...
    jsr    Delay                 ; 6   finish this scanline, then wait 81 more scanlines

    ldx    #11                   ; 2   index table and ram
.loopTitlePtrs:
    lda    TitlePtrs_Tab,X       ; 4
    sta    displayPtrs,X         ; 4   load the title pointers
    dex                          ; 2
    bpl    .loopTitlePtrs        ; 2³
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    #DELAY                ; 2
    ldx    #$13                  ; 2   left 1, three close copies
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    lda    #COL_TEXT_TITLE       ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    stx    HMP1                  ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta.w  RESP0                 ; @36 +4 = 40
    sta    RESP1                 ; 3
LD037:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    jsr    Waste12cycles_A       ; 6
    jsr    Waste12cycles_A       ; 6
    sta    HMCLR                 ; 3
    jsr    Waste12cycles_A       ; 6
    lda    waste3cycles          ; 3
    lda    waste3cycles          ; 3
    lda    waste3cycles          ; 3
    jsr    Draw_6_Byte_Display   ; 6  @57 draw text on title screen

    ldx    #11                   ; 2
.loopCopyrightPtrs:
    lda    CopyrightPtrs_Tab,X   ; 4
    sta    displayPtrs,X         ; 4
    dex                          ; 2
    bpl    .loopCopyrightPtrs    ; 2³   loop 11+1 times
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    jsr    Waste12cycles_A       ; 6
    jsr    Waste12cycles_A       ; 6
    jsr    Waste12cycles_A       ; 6
    jsr    Waste12cycles_A       ; 6
    jsr    Draw_6_Byte_Display   ; 6  @57
    ldx    #$58                  ; 2   finish this scanline, then wait 89 more scanlines
    jsr    Delay                 ; 6   vertical positon bottom of title screen
    jmp    ClearScreen           ; 3

;-------------------------------------

Delay ;SUBROUTINE
.delayOneLine
    sta    WSYNC                 ; 3
    dex                          ; 2
    bpl    .delayOneLine         ; 2³
Waste12cycles_A:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      GAME SCREENS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.gameScreens:
    ldx    oneOrZero             ; 3
    lda    onTheGreenFlag,X      ; 4
    beq    .holeStageScreen      ; 2³
    jmp    PuttingScreen         ; 3

.holeStageScreen:
    lda    #DELAY                ; 2
    sta    VDELP1                ; 3
    lda    #7                    ; 2   the top part of the kernal is seven "zones"
    sta    numOfZones            ; 3   top of screen, plus six object zomes
    lda    #0                    ; 2
    sta    COLUPF                ; 3   black
    sta    NUSIZ0                ; 3
    lda    #$30                  ; 2   right border on screen
    sta    PF0                   ; 3
    ldx    scanlinesToBall       ; 3   height until we reach the golf ball
    lda    #<Blank_and_Shared    ; 2
    sta    objectPtr             ; 3   low pointers, in this case to drawing nothing
    sta    numSizPtr             ; 3
    sta    colorPtr              ; 3
    lda    #>Blank_and_Shared    ; 2
    sta    objectPtr+1           ; 3   high pointers, in this case to drawing nothing
    sta    numSizPtr+1           ; 3
    sta    colorPtr+1            ; 3
    lda    #<Grass_Col_Tab       ; 2
    sta    groundColorPtr        ; 3
    lda    #>Grass_Col_Tab       ; 2
    sta    groundColorPtr+1      ; 3
    ldy    blankTopLines         ; 3   this is the variable height, intial lines of blank background at the top
    jmp    LD12B                 ; 3

LD0B4:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    cpx    #8                    ; 2   is it time to draw the ball?
    bcs    .noBall1              ; 2³  - no, take branch
    lda    $C9,X                 ; 4   - yes, draw ball
    sta    GRP0                  ; 3
.noBall1:
    dex                          ; 2
    ldy    numOfZones            ; 3
    lda.wy zoneObjects,Y         ; 4
    sta    temp2_RESP1           ; 3
    and    #$1F                  ; 2
    tay                          ; 2
    sta    $85                   ; 3
    lda    ObjPtrsLoTab,Y        ; 4
    sta    objectPtr             ; 3
    lda    ObjPtrsHiTab,Y        ; 4
    sta    objectPtr+1           ; 3
    lda    ColObjPtrsLoTab,Y     ; 4
    sta    colorPtr              ; 3
    lda    ColObjPtrsHiTab,Y     ; 4
    sta    colorPtr+1            ; 3
    lda    NumSizPtrsLoTab,Y     ; 4
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    sta    numSizPtr             ; 3
    cpx    #8                    ; 2 
    bcs    .noBall2              ; 2³
    lda    $C9,X                 ; 4   
    sta    GRP0                  ; 3
.noBall2:
    dex                          ; 2
    lda    temp2_RESP1           ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    #0                    ; 2
    cpx    #8                    ; 2  
    bcs    .noBall3              ; 2³ 
    lda    $C9,X                 ; 4   
.noBall3:
    dex                          ; 2
    jsr    CalcRoughPosP1        ; 6   calculate the cycles
    sta    RESP1                 ; 3   and reposition
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    cpx    #8                    ; 2
    bcs    .noBall4              ; 2³
    lda    $C9,X                 ; 4
    sta    GRP0                  ; 3
.noBall4:
    dex                          ; 2
    ldy    $85                   ; 3
    lda    NumSizHiPtrs_Tab,Y    ; 4
    sta    numSizPtr+1           ; 3
    lda    ColGroundLoPts_Tab,Y  ; 4
    sta    groundColorPtr        ; 3
    lda    ColGroundHiPts_Tab,Y  ; 4
    sta    groundColorPtr+1      ; 3
    lda    ObjectHeight_Tab,Y    ; 4
    tay                          ; 2
    
LD12B:
    lda    (objectPtr),Y         ; 5
    sta    GRP1                  ; 3
    lda    #0                    ; 2
    cpx    #8                    ; 2
    bcs    .noBall5              ; 2³
    lda    $C9,X                 ; 4
.noBall5:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    (groundColorPtr),Y    ; 5
    sta    COLUBK                ; 3
    lda    (colorPtr),Y          ; 5
    sta    COLUP1                ; 3
    lda    (numSizPtr),Y         ; 5
    sta    NUSIZ1                ; 3
    sta    HMP1                  ; 3
    dex                          ; 2
    dey                          ; 2
    bpl    LD12B                 ; 2³
    dec    numOfZones            ; 5
    bmi    LD156                 ; 2³
    jmp    LD0B4                 ; 3

LD156:
    ldy    #7                    ; 2
LD158:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    cpx    #8                    ; 2
    bcs    .noBall6              ; 2³
    lda    $C9,X                 ; 4
    sta    GRP0                  ; 3
.noBall6:
    dex                          ; 2
    dey                          ; 2
    bpl    LD158                 ; 2³
    sta    HMCLR                 ; 3
    jmp    DisplayPowerBar       ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      PUTTING SCREEN
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PuttingScreen:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    sta    COLUBK                ; 3   black background
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    COLUP1                ; 3   and a black color for the hole
    lda    #COL_GOLF_BALL        ; 2
    sta    COLUP0                ; 3
    ldx    scanlinesToBall       ; 3
    ldy    #$0F                  ; 2   height for the first loop
    lda    #COL_GRASS            ; 2
    sta    COLUPF                ; 3   the "green" part of the putting screen is built with the playfield
    lda    waste3cycles          ; 3
    sta    RESP1                 ; 3
.loopPuttOne:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    cpx    #8                    ; 2
    bcs    .noBallp1             ; 2³
    lda    $C9,X                 ; 4
    sta    GRP0                  ; 3
.noBallp1:
    dex                          ; 2
    lda    PlayField2Tab,Y       ; 4
    sta    PF2                   ; 3
    dey                          ; 2
    bpl    .loopPuttOne          ; 2³
    ldy    #$0F                  ; 2   height loop 2
.loopPuttTwo:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    cpx    #8                    ; 2
    bcs    .noBallp2             ; 2³
    lda    $C9,X                 ; 4
    sta    GRP0                  ; 3
.noBallp2:
    dex                          ; 2
    lda    PlayField1Tab,Y       ; 4
    sta    PF1                   ; 3
    dey                          ; 2
    bpl    .loopPuttTwo          ; 2³
    ldy    #$0F                  ; 2   height for loop 3
.loopPuttThree:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    cpx    #8                    ; 2
    bcs    .noBallp3             ; 2³
    lda    $C9,X                 ; 4
    sta    GRP0                  ; 3
.noBallp3:
    dex                          ; 2
    lda    PlayField0Tab,Y       ; 4   except table is empty,
    sta    PF0                   ; 3   so nothing is drawn...
    dey                          ; 2
    bpl    .loopPuttThree        ; 2³
    ldy    #$2B                  ; 2   height for loop 4
.loopPuttFour:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    cpx    #8                    ; 2
    bcs    .noBallp4             ; 2³
    lda    $C9,X                 ; 4
    sta    GRP0                  ; 3
.noBallp4:
    dex                          ; 2
    cpy    #$13                  ; 2    bottom of golf hole gfx
    bcc    .skipGolfHole         ; 2³
    cpy    #$1A                  ; 2    top of golf hole gfx
    bcs    .skipGolfHole         ; 2³
    lda    GolfHole-19,Y         ; 4    get the golf hole gfx
    sta    GRP1                  ; 3
.skipGolfHole:
    dey                          ; 2
    bpl    .loopPuttFour         ; 2³
    ldy    #0                    ; 2
.loopPuttFive:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    cpx    #8                    ; 2
    bcs    .noBallp5             ; 2³
    lda    $C9,X                 ; 4
    sta    GRP0                  ; 3
.noBallp5:
    dex                          ; 2
    lda    PlayField0Tab,Y       ; 4    table is empty
    sta    PF0                   ; 3
    iny                          ; 2    reflect the screen vertically by incrementing the tables
    cpy    #$10                  ; 2    height of loop 5
    bcc    .loopPuttFive         ; 2³
    ldy    #0                    ; 2
.loopPuttSix:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    cpx    #8                    ; 2
    bcs    .noBallp6             ; 2³
    lda    $C9,X                 ; 4
    sta    GRP0                  ; 3
.noBallp6:
    dex                          ; 2
    lda    PlayField1Tab,Y       ; 4
    sta    PF1                   ; 3
    iny                          ; 2
    cpy    #$10                  ; 2    height of loop 6
    bcc    .loopPuttSix          ; 2³
    ldy    #0                    ; 2
.loopPuttSeven:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    cpx    #8                    ; 2
    bcs    .noBallp7             ; 2³
    lda    $C9,X                 ; 4
    sta    GRP0                  ; 3
.noBallp7:
    dex                          ; 2
    lda    PlayField2Tab,Y       ; 4
    sta    PF2                   ; 3
    iny                          ; 2
    cpy    #$10                  ; 2
    bcc    .loopPuttSeven        ; 2³

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      POWER BAR
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
DisplayPowerBar:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    sta    COLUBK                ; 3   black
    sta    NUSIZ0                ; 3   1 copy, missile 1 clock wide
    sta    NUSIZ1                ; 3   1 copy, missile 1 clock wide
    sta    PF0                   ; 3
    lda    #$21                  ; 2   ball is 4 clocks, reflect playfield
    sta    CTRLPF                ; 3
    sta    $83                   ; 3
    nop                          ; 2
    nop                          ; 2
    lda    CXP0FB                ; 3   read collision P0 and playfield	
    asl                          ; 2
    ror    collisionFlag         ; 5
    lda    CXPPMM                ; 3   read collision P0 and P1
    asl                          ; 2
    ror    collisionFlag         ; 5   $E4 bit 7 AND #$80 (collision P0 with P1), bit 6 AND #$40 (collison P0 with playfield)
    sta    RESP0                 ; 3
    lda    #0                    ; 2
    sta    VDELP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    #$2A                  ; 2
    sta    COLUP0                ; 3
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    jsr    Waste12cycles_B       ; 6
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    $A9                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2   X is used to index the power bar gfx tables
    sta    RESM1                 ; 3   left edge of power bar box is M1
    lda    waste3cycles          ; 3
    lda    #LEFT_1               ; 2
    sta    HMM1                  ; 3
    lda    $AA                   ; 3   low nybble is used to reset position of the ball
    sta    RESP1                 ; 3   right edge of power bar box is P1
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    tay                          ; 2
    lda    #0                    ; 2
    sta    GRP0                  ; 3
LD29B:
    dey                          ; 2
    bpl    LD29B                 ; 2³
    sta    RESBL                 ; 3
    lda    #0                    ; 2
    sta    HMM1                  ; 3
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    jsr    Waste12cycles_B       ; 6
    lda    #COL_PB_SIDES_TOP     ; 2   color of top and sides of border
    sta    COLUP1                ; 3
    sta    COLUPF                ; 3
    lda    #COL_PB_DOTS          ; 2   color for dot markers inside power bar
    sta    COLUP0                ; 3
    sta    HMCLR                 ; 3
    lda    waste3cycles          ; 3
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    #$FC                  ; 2   top border
    sta    PF2                   ; 3
    lda    #ENABLE               ; 2
    sta    ENAM1                 ; 3   draw left side of power bar box
    lda    #$08                  ; 2
    sta    GRP1                  ; 3   draw right side of power bar box
    ldy    #4                    ; 2
LD2D1:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    Left_PB_Gfx,X         ; 4
    sta    PF2                   ; 3
    lda    PowerBar_Dots,Y       ; 4
    sta    GRP0                  ; 3
    lda    PowerBar_Col_Tab,Y    ; 4
    sta    COLUPF                ; 3
    lda    waste3cycles          ; 3
    lda    waste3cycles          ; 3
    lda    #ENABLE               ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    ENABL                 ; 3   the ball is used to smooth the movement of the power bar
    lda    Right_PB_Gfx,X        ; 4
    sta    PF2                   ; 3
    jsr    Waste12cycles_B       ; 6
    lda    #DISABLE              ; 2
    sta    ENABL                 ; 3
    dey                          ; 2
    bpl    LD2D1                 ; 2³
    sta    ENAM0                 ; 3
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    #$FC                  ; 2   bottom border
    sta    PF2                   ; 3
    lda    #COL_PB_BOTTOM        ; 2   power bar bottom border color
    sta    COLUPF                ; 3
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    jsr    Waste12cycles_B       ; 6
    jsr    Waste12cycles_B       ; 6
    jsr    Waste12cycles_B       ; 6
    sta    ENABL                 ; 3
    sta    ENAM1                 ; 3   stop drawing the power bar box
    sta    PF2                   ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    displayFlag           ; 3
    cmp    #$FF                  ; 2
    beq    .displayGolfer        ; 2³
    jmp    DisplayText           ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      GOLFER
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.displayGolfer:
    lda    #ONE_COPY             ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #RIGHT_1              ; 2
    sta    HMP0                  ; 3
    lda    golferGfxSeed         ; 3
    asl                          ; 2
    tax                          ; 2
    lda    LeftGfxPtrs_Tab,X     ; 4   load the low nybble pointers
    sta    golferLeftSide        ; 3
    lda    RightGfxPtrs_Tab,X    ; 4
    sta    RESP0                 ; 3  @45
    sta    RESP1                 ; 3  @48
    sta    golferRightSide       ; 3
    inx                          ; 2
    lda    LeftGfxPtrs_Tab,X     ; 4   load the high nybble pointers
    sta    golferLeftSide+1      ; 3
    lda    RightGfxPtrs_Tab,X    ; 4
    sta    golferRightSide+1     ; 3
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    cpx    #20                   ; 2   are we using the putter?
    bcc    .useDriveColors       ; 2³  - no, we are not putting, use the color table for the "driving" gfx
    lda    #>PuttGfxP1_Col_Tab   ; 2   - yes, the golfer putting gfx use a different table
    ldx    #<PuttGfxP1_Col_Tab   ; 2
    jmp    StoreColorPtrs        ; 3
.useDriveColors:
    lda    #>DriveGfxP1_Col_Tab  ; 2
    ldx    #<DriveGfxP1_Col_Tab  ; 2
StoreColorPtrs:
    sta    golferColPtr+1        ; 3
    stx    golferColPtr          ; 3
    lda    oneOrZero             ; 3   It looks like original idea was to use different colors for
    asl                          ; 2   each player. Different tables are used to color player 2, but
    asl                          ; 2   they hold the same colors values as player 1. You don't
    asl                          ; 2   see any difference as it is.
    asl                          ; 2
    asl                          ; 2   if it player 2 is playing then "A" register now holds 32
    adc    golferColPtr          ; 3   +32 = 2nd players color table, 0 = 1st players color table
    sta    golferColPtr          ; 3
    bcc    .waitToDrawGolfer     ; 3   always branch
    inc    golferColPtr+1        ; 5   this is impossible to reach, might just be left over...
.waitToDrawGolfer:
    sta    HMCLR                 ; 3
    ldy    #3                    ; 2
.loopBlankLines:
    sta    WSYNC                 ; 3   draw some blank scanlines between power bar and golfer
;-------------------------------------
    sta    HMOVE                 ; 3
    dey                          ; 2
    bpl    .loopBlankLines       ; 2³

    ldy    #$1F                  ; 2   height for golfer gfx
.loopDrawGolfer:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    (golferLeftSide),Y    ; 5
    sta    GRP0                  ; 3
    lda    (golferRightSide),Y   ; 5
    sta    GRP1                  ; 3
    lda    (golferColPtr),Y      ; 5
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    dey                          ; 2
    bpl    .loopDrawGolfer       ; 2³  draw the golfer line by line
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    sta    GRP0                  ; 3   clear the graphics
    sta    GRP1                  ; 3
    ldy    #3                    ; 2
.waitAfterGolfer:
    sta    WSYNC                 ; 3   and draw a few more blanklines
;-------------------------------------
    sta    HMOVE                 ; 3
    dey                          ; 2
    bpl    .waitAfterGolfer      ; 2³
    jmp    ClearScreen           ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      HOLE, PAR, YARDS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DisplayText:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    ldx    #$23                  ; 2   left 2, three close copies
    ldy    #$DE                  ; 2   high nybble for letters
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    #DELAY                ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    lda    #COL_LETTERS          ; 2   white letters
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sty    dispSix+1             ; 3   high nybble pointers
    sty    dispFive+1            ; 3
    stx    HMP1                  ; 3
    ldx    #LEFT_1               ; 2
    sta.w  RESP0                 ; 4  @40
    sta    RESP1                 ; 3  @43
    stx    HMP0                  ; 3
    sty    dispFour+1            ; 3   more high nybble pointers
    sty    dispThree+1           ; 3
    sty    dispTwo+1             ; 3
    sty    dispOne+1             ; 3
    lda    #<Hole_1              ; 2
    sta    dispOne               ; 3
    lda    #<Hole_2              ; 2
    sta    dispTwo               ; 3
    lda    #<Par                 ; 2
    sta    dispFive              ; 3
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    parForHole            ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2   times by eight
    sta    dispSix               ; 3
    lda    holeNumberSeed        ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2   times by eight
    sta    dispFour              ; 3
    lda    holeNumberSeed        ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    sta    dispThree             ; 3
    sta    HMCLR                 ; 3
    lda    waste3cycles          ; 3
    lda    waste3cycles          ; 3
    lda    waste3cycles          ; 3
    jsr    Draw_6_Byte_Display   ; 6
    nop                          ; 2
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    #<Blank_Digit         ; 2
    sta    dispThree             ; 3
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    #<Yards_1             ; 2
    sta    dispOne               ; 3
    lda    #<Yards_2             ; 2
    sta    dispTwo               ; 3
    lda    yardsHiBCD            ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    dispFour              ; 3
    lda    yardsLoBCD            ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    sta    dispFive              ; 3
    lda    yardsLoBCD            ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    dispSix               ; 3
    nop                          ; 2
    jsr    Draw_6_Byte_Display   ; 6
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    displayFlag           ; 3
    beq    .displayScore         ; 2³
    jmp    DisplayClub           ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SCORE, PLAYER NUMBER, PAR OVER/UNDER
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.displayScore:
    ldy    oneOrZero             ; 3
    ldx    #0                    ; 2
    lda.wy playerScoreHi,Y       ; 4
    bne    .score1stDigitPtr     ; 2³
    inx                          ; 2
    lda    #$0A                  ; 2   #$50 when left shifted 3 times, for $DE50 (blank digit)
.score1stDigitPtr:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    dispFour              ; 3
    lda.wy playerScoreLo,Y       ; 4
    and    #$F0                  ; 2
    bne    LD472                 ; 2³
    dex                          ; 2
    bne    LD472                 ; 2³
    lda    #$A0                  ; 2   #$50 when right shifted, for $DE50 (blank digit)
LD472:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lsr                          ; 2
    sta    dispFive              ; 3
    lda.wy playerScoreLo,Y       ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta.w  dispSix               ; 4
    lda    #<Score_1             ; 2
    sta    dispOne               ; 3
    lda    #<Score_2             ; 2
    sta    dispTwo               ; 3
    lda    #<Score_3             ; 2
    sta    dispThree             ; 3
    jsr    Waste12cycles_B       ; 6
    jsr    Draw_6_Byte_Display   ; 6
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    $87                   ; 3
    lsr                          ; 2
    bcc    LD4C5                 ; 2³
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    #<Blank_Digit         ; 2
    sta    dispSix               ; 3
    sta    dispFive              ; 3
    sta    dispTwo               ; 3
    sta    dispOne               ; 3
    lda    #<Letter_P            ; 2
    sta    dispFour              ; 3
    lda    numOfPlayers          ; 3   find low pointer for the player number gfx
    clc                          ; 2
    adc    #1                    ; 2   player one = 1, player two = 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2   times by eight, the height of the sprite
    sta.w  dispThree             ; 4   player one = $08 ($DE08), player two = $10 ($DE10)
    jsr    Waste12cycles_B       ; 6
    jsr    Draw_6_Byte_Display   ; 6
    jmp    ClearScreen           ; 3

LD4C5:
    ldy    oneOrZero             ; 3
    lda.wy ParOverUnder,Y        ; 4
    and    #$F0                  ; 2
    bne    LD4D0                 ; 2³
    lda    #$A0                  ; 2   #$50 when right shifted, for $DE50 (blank digit)
LD4D0:
    lsr                          ; 2
    sta    dispFive              ; 3
    lda.wy ParOverUnder,Y        ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    asl                          ; 2
    sta    dispSix               ; 3
    ldx    plusMinusFlag,Y       ; 4
    lda    SignPtr_Tab,X         ; 4
    sta    dispFour              ; 3
    lda    #<Blank_Digit         ; 2
    sta    dispThree             ; 3
    lda    #$DD                  ; 2   high nybble plus or minus sign
    sta    dispFour+1            ; 3
    lda    #<Letter_P            ; 2
    sta    dispOne               ; 3
    lda    oneOrZero             ; 3
    clc                          ; 2
    adc    #1                    ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta.w  dispTwo               ; 4
    jsr    Draw_6_Byte_Display   ; 6
    jmp    ClearScreen           ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      CLUB OR VIEW
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DisplayClub:
    ldx    #COL_CLUB_HILITE      ; 2   the word "club" and the golf club selected
    lda    displayFlag           ; 3
    bmi    LD50D                 ; 2³
    ldx    #COL_CLUB             ; 2   normal color when not selected
LD50D:
    stx    COLUP0                ; 3
    stx    COLUP1                ; 3
    lsr                          ; 2
    bcs    LD53B                 ; 2³
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    #$DD                  ; 2
    sta    dispThree+1           ; 3
    sta    dispFour+1            ; 3
    lda    #<View_1              ; 2
    sta    dispThree             ; 3
    lda    #<View_2              ; 2
    sta    dispFour              ; 3
    lda    #<Blank_Digit         ; 2
    sta    dispOne               ; 3
    sta    dispTwo               ; 3
    sta    dispFive              ; 3
    sta    dispSix               ; 3
    jsr    Waste12cycles_B       ; 6
    nop                          ; 2
    nop                          ; 2
    jsr    Draw_6_Byte_Display   ; 6
    jmp    DisplayStrokes        ; 3

LD53B:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    #<Club_1              ; 2
    sta    dispOne               ; 3
    lda    #<Club_2              ; 2
    sta    dispTwo               ; 3
    lda    #<Blank_Digit         ; 2
    sta    dispThree             ; 3
    sta    dispFour              ; 3
    ldx    clubsOrView           ; 3
    lda    ClubLeftPtrs_Tab,X    ; 4
    sta    dispFive              ; 3
    lda    ClubRightPtrs_Tab,X   ; 4
    sta.w  dispSix               ; 4
    jsr    Waste12cycles_B       ; 6
    jsr    Draw_6_Byte_Display   ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      STROKES AND WIND
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DisplayStrokes:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    ldy    oneOrZero             ; 3
    lda    #$DE                  ; 2   high nybble
    sta    dispThree+1           ; 3
    sta    dispFour+1            ; 3
    lda    #COL_STROKES_N_WIND   ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda.wy numOfStrokes,Y        ; 4
    sta    temp1                 ; 3
    and    #$F0                  ; 2   test if strokes are over 9 (it's BCD)
    bne    .overNine             ; 2³  - yes, it's over nine, so display two digits
    ldy    #$0A                  ; 2   - no, it's below ten, so "blank" the second digit
    lda    temp1                 ; 3   reload the strokes
    sty    temp1                 ; 3   and put away $0A for now...
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2   and find the "low nybble" pointer to the number gfx
    bcc    .displayDigits        ; 3   always branch

.overNine:
    lsr                          ; 2   divide by 8 to find the upper digit
.displayDigits:
    sta    dispTwo               ; 3   store first pointer
    lda    temp1                 ; 3   reload, this will either be $0A or strokes between $10 - $99 BCD
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    and    #$0F                  ; 2   keep the low digit
    asl                          ; 2   times by 8, as the sprites are 8 lines high
    asl                          ; 2
    asl                          ; 2   $0A becomes = $50, which is the low nybble pointer to the blank digit
    sta    dispThree             ; 3   store the pointer
    lda    #<Strokes             ; 2
    sta    dispOne               ; 3
    lda    #<Blank_Digit         ; 2   get more pointers
    sta    dispFour              ; 3
    lda    windSpeedDir          ; 3
    and    #$03                  ; 2   test the wind for 4 possible directions
    tax                          ; 2
    lda    WindDirGfx_Tab,X      ; 4
    sta    dispFive              ; 3   and point the arrow in that direction
    lda    windSpeedDir          ; 3
    and    #$F0                  ; 2
    lsr                          ; 2   now find the wind speed
    sta    dispSix               ; 3   and store that pointer too...
    lda    waste3cycles          ; 3
    jsr    Draw_6_Byte_Display   ; 6   time to draw it all

ClearScreen:
    lda    #0                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    #TIME_OVERSCAN        ; 2
    ldx    #$82                  ; 2
    sta    WSYNC                 ; 3
    sta    TIM64T                ; 4
    stx    VBLANK                ; 3   turn electron beam off
    jmp    LDFE6                 ; 3   and bankswitch

ObjectHeight_Tab:
    .byte   0 ;   EMPTY_GND_A
    .byte   2 ;   TEE_BOX
    .byte  12 ;   TREE_1
    .byte  12 ;   TREE_2_CLOSE
    .byte  12 ;   TREE_2_MED
    .byte  12 ;   TREE_3_CLOSE
    .byte  12 ;   TREE_2_WIDE
    .byte  12 ;   TREE_3_MED
    .byte  11 ;   WATER_1
    .byte  11 ;   WATER_2_CLOSE
    .byte  11 ;   WATER_2_MED
    .byte  11 ;   WATER_3_CLOSE
    .byte  11 ;   WATER_2_WIDE
    .byte  11 ;   WATER_3_MED
    .byte  10 ;   SAND_1
    .byte  10 ;   SAND_2_CLOSE
    .byte  10 ;   SAND_2_MED
    .byte  10 ;   SAND_3_CLOSE
    .byte  10 ;   SAND_2_WIDE
    .byte  10 ;   SAND_3_MED
    .byte  21 ;   LARGE_TREE
    .byte  18 ;   LARGE_WATER
    .byte  16 ;   LARGE_SAND
    .byte  16 ;   ROUGH_AREA
    .byte  25 ;   GREEN_AREA
    .byte  20 ;   STREAM
    .byte   1 ;   TINY_FIELD
    .byte  16 ;   WIDE_RIVER
    .byte   4 ;   SHORT_FIELD
    .byte   8 ;   MEDIUM_FIELD
    .byte  16 ;   LONG_FIELD
    .byte  16 ;   RIVERS_EDGE



    .byte $00 ; |        | $D5EE   probably free bytes until next page begins...
    .byte $00 ; |        | $D5EF
    .byte $00 ; |        | $D5F0
    .byte $00 ; |        | $D5F1
    .byte $00 ; |        | $D5F2
    .byte $00 ; |        | $D5F3
    .byte $00 ; |        | $D5F4
    .byte $00 ; |        | $D5F5
    .byte $00 ; |        | $D5F6
    .byte $00 ; |        | $D5F7
    .byte $00 ; |        | $D5F8
    .byte $00 ; |        | $D5F9
    .byte $00 ; |        | $D5FA
    .byte $00 ; |        | $D5FB
    .byte $00 ; |        | $D5FC
    .byte $00 ; |        | $D5FD
    .byte $00 ; |        | $D5FE
    .byte $00 ; |        | $D5FF

PlayField2Tab:
    .byte $FF ; |XXXXXXXX| $D600   green ground for the putting screen
    .byte $FE ; |XXXXXXX | $D601
    .byte $FE ; |XXXXXXX | $D602
    .byte $FC ; |XXXXXX  | $D603
    .byte $F8 ; |XXXXX   | $D604
    .byte $F0 ; |XXXX    | $D605
    .byte $E0 ; |XXX     | $D606
    .byte $C0 ; |XX      | $D607
    .byte $00 ; |        | $D608
    .byte $00 ; |        | $D609
    .byte $00 ; |        | $D60A
    .byte $00 ; |        | $D60B
    .byte $00 ; |        | $D60C
    .byte $00 ; |        | $D60D
    .byte $00 ; |        | $D60E
    .byte $00 ; |        | $D60F

PlayField1Tab:
    .byte $FF ; |XXXXXXXX| $D610   green ground for the putting screen
    .byte $7F ; | XXXXXXX| $D611
    .byte $7F ; | XXXXXXX| $D612
    .byte $3F ; |  XXXXXX| $D613
    .byte $3F ; |  XXXXXX| $D614
    .byte $1F ; |   XXXXX| $D615
    .byte $1F ; |   XXXXX| $D616
    .byte $0F ; |    XXXX| $D617
    .byte $0F ; |    XXXX| $D618
    .byte $07 ; |     XXX| $D619
    .byte $07 ; |     XXX| $D61A
    .byte $03 ; |      XX| $D61B
    .byte $03 ; |      XX| $D61C
    .byte $01 ; |       X| $D61D
    .byte $01 ; |       X| $D61E
    .byte $00 ; |        | $D61F

PlayField0Tab:
    .byte $00 ; |        | $D620   no data, nothing is drawn
    .byte $00 ; |        | $D621
    .byte $00 ; |        | $D622
    .byte $00 ; |        | $D623
    .byte $00 ; |        | $D624
    .byte $00 ; |        | $D625
    .byte $00 ; |        | $D626
    .byte $00 ; |        | $D627
    .byte $00 ; |        | $D628
    .byte $00 ; |        | $D629
    .byte $00 ; |        | $D62A
    .byte $00 ; |        | $D62B
    .byte $00 ; |        | $D62C
    .byte $00 ; |        | $D62D
    .byte $00 ; |        | $D62E
    .byte $00 ; |        | $D62F
    
    .byte $C0 ; |XX      | $D630    is this ever used?
    .byte $C0 ; |XX      | $D631
    .byte $C0 ; |XX      | $D632
    .byte $C0 ; |XX      | $D633
    .byte $C0 ; |XX      | $D634
    .byte $C0 ; |XX      | $D635 
    .byte $C0 ; |XX      | $D636  
    .byte $C0 ; |XX      | $D637  
    .byte $C0 ; |XX      | $D638  
    .byte $C0 ; |XX      | $D639  
    .byte $C0 ; |XX      | $D63A  
    .byte $C0 ; |XX      | $D63B  
    .byte $80 ; |X       | $D63C
    .byte $80 ; |X       | $D63D
    .byte $80 ; |X       | $D63E
    .byte $00 ; |        | $D63F
    .byte $0C ; |    XX  | $D640
    .byte $0C ; |    XX  | $D641
    .byte $0C ; |    XX  | $D642
    .byte $0C ; |    XX  | $D643
    .byte $0C ; |    XX  | $D644
    .byte $0C ; |    XX  | $D645
    .byte $0C ; |    XX  | $D646
    .byte $0C ; |    XX  | $D647

GolfHole:
    .byte $00 ; |        | $D648
    .byte $30 ; |  XX    | $D649  golf cup hole on the putting screen
    .byte $78 ; | XXXX   | $D64A
    .byte $FC ; |XXXXXX  | $D64B
    .byte $FC ; |XXXXXX  | $D64C
    .byte $78 ; | XXXX   | $D64D
    .byte $30 ; |  XX    | $D64E

Grass_Col_Tab:
    .byte  GREEN+4       ; $D64F  color background
    .byte  GREEN+4       ; $D650
    .byte  GREEN+4       ; $D651
    .byte  GREEN+4       ; $D652
    .byte  GREEN+4       ; $D653
    .byte  GREEN+4       ; $D654
    .byte  GREEN+4       ; $D655
    .byte  GREEN+4       ; $D656
    .byte  GREEN+4       ; $D657
    .byte  GREEN+4       ; $D658
    .byte  GREEN+4       ; $D659
    .byte  GREEN+4       ; $D65A
    .byte  GREEN+4       ; $D65B
    .byte  GREEN+4       ; $D65C
    .byte  GREEN+4       ; $D65D
    .byte  GREEN+4       ; $D65E
    .byte  GREEN+4       ; $D65F
    .byte  GREEN+4       ; $D660
    .byte  GREEN+4       ; $D661
    .byte  GREEN+4       ; $D662
    .byte  GREEN+4       ; $D663
    .byte  GREEN+4       ; $D664
    .byte  GREEN+4       ; $D665
    .byte  GREEN+4       ; $D666
    .byte  GREEN+4       ; $D667
    .byte  GREEN+4       ; $D668
    .byte  GREEN+4       ; $D669
    .byte  GREEN+4       ; $D66A
    .byte  GREEN+4       ; $D66B
    .byte  GREEN+4       ; $D66C
    .byte  GREEN+4       ; $D66D
    .byte  GREEN+4       ; $D66E
    .byte  GREEN+4       ; $D66F
    .byte  GREEN+4       ; $D670
    .byte  GREEN+4       ; $D671
    .byte  GREEN+4       ; $D672
    .byte  GREEN+4       ; $D673
    .byte  GREEN+4       ; $D674
    .byte  GREEN+4       ; $D675
    .byte  GREEN+4       ; $D676

ColGroundHiPts_Tab:
    .byte >Grass_Col_Tab      ; $D677
    .byte >Grass_Col_Tab      ; $D678
    .byte >Grass_Col_Tab      ; $D679
    .byte >Grass_Col_Tab      ; $D67A
    .byte >Grass_Col_Tab      ; $D67B
    .byte >Grass_Col_Tab      ; $D67C
    .byte >Grass_Col_Tab      ; $D67D
    .byte >Grass_Col_Tab      ; $D67E
    .byte >Grass_Col_Tab      ; $D67F
    .byte >Grass_Col_Tab      ; $D680
    .byte >Grass_Col_Tab      ; $D681
    .byte >Grass_Col_Tab      ; $D682
    .byte >Grass_Col_Tab      ; $D683
    .byte >Grass_Col_Tab      ; $D684
    .byte >Grass_Col_Tab      ; $D685
    .byte >Grass_Col_Tab      ; $D686
    .byte >Grass_Col_Tab      ; $D687
    .byte >Grass_Col_Tab      ; $D688
    .byte >Grass_Col_Tab      ; $D689
    .byte >Grass_Col_Tab      ; $D68A
    .byte >Grass_Col_Tab      ; $D68B
    .byte >Grass_Col_Tab      ; $D68C
    .byte >Grass_Col_Tab      ; $D68D
    .byte >Grass_Col_Tab      ; $D68E
    .byte >Grass_Col_Tab      ; $D68F
    .byte >Stream_Col_Tab     ; $D690
    .byte >Grass_Col_Tab      ; $D691
    .byte >WideRiver_Col_Tab  ; $D692
    .byte >Grass_Col_Tab      ; $D693
    .byte >Grass_Col_Tab      ; $D694
    .byte >Grass_Col_Tab      ; $D695
    .byte >RiverEnd_Col_Tab   ; $D696

RiverEnd_Col_Tab:
    .byte  GREEN+4       ; $D697  return to main green background

WideRiver_Col_Tab:
    .byte  BLUE          ; $D698
    .byte  BLUE          ; $D699
    .byte  BLUE          ; $D69A
    .byte  BLUE          ; $D69B
    .byte  BLUE          ; $D69C
    .byte  BLUE          ; $D69D
    .byte  BLUE          ; $D69E
    .byte  BLUE          ; $D69F
    .byte  BLUE          ; $D6A0
    .byte  BLUE          ; $D6A1
    .byte  BLUE          ; $D6A2
    .byte  BLUE          ; $D6A3
    .byte  BLUE          ; $D6A4
    .byte  BLUE          ; $D6A5
    .byte  BLUE          ; $D6A6
    .byte  BLUE          ; $D6A7
    .byte  BLUE          ; $D6A8

    .byte $00 ; |        | $D6A9   probably free bytes until next page begins...
    .byte $00 ; |        | $D6AA
    .byte $00 ; |        | $D6AB
    .byte $00 ; |        | $D6AC
    .byte $00 ; |        | $D6AD
    .byte $00 ; |        | $D6AE
    .byte $00 ; |        | $D6AF
    .byte $00 ; |        | $D6B0
    .byte $00 ; |        | $D6B1
    .byte $00 ; |        | $D6B2
    .byte $00 ; |        | $D6B3
    .byte $00 ; |        | $D6B4
    .byte $00 ; |        | $D6B5
    .byte $00 ; |        | $D6B6
    .byte $00 ; |        | $D6B7
    .byte $00 ; |        | $D6B8
    .byte $00 ; |        | $D6B9
    .byte $00 ; |        | $D6BA
    .byte $00 ; |        | $D6BB
    .byte $00 ; |        | $D6BC
    .byte $00 ; |        | $D6BD
    .byte $00 ; |        | $D6BE
    .byte $00 ; |        | $D6BF
    .byte $00 ; |        | $D6C0
    .byte $00 ; |        | $D6C1
    .byte $00 ; |        | $D6C2
    .byte $00 ; |        | $D6C3
    .byte $00 ; |        | $D6C4
    .byte $00 ; |        | $D6C5
    .byte $00 ; |        | $D6C6
    .byte $00 ; |        | $D6C7
    .byte $00 ; |        | $D6C8
    .byte $00 ; |        | $D6C9
    .byte $00 ; |        | $D6CA
    .byte $00 ; |        | $D6CB
    .byte $00 ; |        | $D6CC
    .byte $00 ; |        | $D6CD
    .byte $00 ; |        | $D6CE
    .byte $00 ; |        | $D6CF
    .byte $00 ; |        | $D6D0
    .byte $00 ; |        | $D6D1
    .byte $00 ; |        | $D6D2
    .byte $00 ; |        | $D6D3
    .byte $00 ; |        | $D6D4
    .byte $00 ; |        | $D6D5
    .byte $00 ; |        | $D6D6
    .byte $00 ; |        | $D6D7
    .byte $00 ; |        | $D6D8
    .byte $00 ; |        | $D6D9
    .byte $00 ; |        | $D6DA
    .byte $00 ; |        | $D6DB
    .byte $00 ; |        | $D6DC
    .byte $00 ; |        | $D6DD
    .byte $00 ; |        | $D6DE
    .byte $00 ; |        | $D6DF
    .byte $00 ; |        | $D6E0
    .byte $00 ; |        | $D6E1
    .byte $00 ; |        | $D6E2
    .byte $00 ; |        | $D6E3
    .byte $00 ; |        | $D6E4
    .byte $00 ; |        | $D6E5
    .byte $00 ; |        | $D6E6
    .byte $00 ; |        | $D6E7
    .byte $00 ; |        | $D6E8
    .byte $00 ; |        | $D6E9
    .byte $00 ; |        | $D6EA
    .byte $00 ; |        | $D6EB
    .byte $00 ; |        | $D6EC
    .byte $00 ; |        | $D6ED
    .byte $00 ; |        | $D6EE
    .byte $00 ; |        | $D6EF
    .byte $00 ; |        | $D6F0
    .byte $00 ; |        | $D6F1
    .byte $00 ; |        | $D6F2
    .byte $00 ; |        | $D6F3
    .byte $00 ; |        | $D6F4
    .byte $00 ; |        | $D6F5
    .byte $00 ; |        | $D6F6
    .byte $00 ; |        | $D6F7
    .byte $00 ; |        | $D6F8
    .byte $00 ; |        | $D6F9
    .byte $00 ; |        | $D6FA
    .byte $00 ; |        | $D6FB
    .byte $00 ; |        | $D6FC
    .byte $00 ; |        | $D6FD
    .byte $00 ; |        | $D6FE
    .byte $00 ; |        | $D6FF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;|                |  |                |  |                |  |                |  |                |  |                |  |                |  |                |  |  X             |  |                |
;|                |  |                |  |                |  |                |  |                |  |XX              |  |                |  |                |  | XXXXXXXXXX     |  |                |
;|                |  |                |  |                |  |      XX        |  |                |  |XX              |  | XXXX           |  |                |  | XX       X     |  |                |
;|                |  |                |  |       X        |  |     XXXX       |  |      XX        |  | X              |  | X  X           |  |      X         |  | X X      X     |  |                |
;|       X        |  |       X        |  |      XXX       |  |     XX X       |  |     XXXX       |  | X    XX        |  | X  X XX        |  |     XXX        |  | X X   X        |  |      X         |
;|      XXX       |  |      XXX       |  |     XXXX       |  |     X X        |  |     XX X       |  |  X  XXXX       |  |XX   XXXX       |  |     XXX        |  | X X  XXX       |  |    XXX X       |
;|     XXXX       |  |     XXXX       |  |     XXXX       |  |    X XXX       |  |     X X        |  |  X  XX X       |  |X X  XX X       |  |  X  XXX        |  | XX X XXX       |  |   XXXXXX       |
;|     XXXX       |  |     XXXX       |  |     XXXX       |  |   XXX X        |  |      XXX       |  |  X  X X        |  |X X  X X        |  |  X X XX        |  | XX X XXX       |  |   XX XXXX      |
;|    XXXXX       |  |    XXXXX       |  |    XXXX        |  |   XXX          |  |    XX X        |  |   X  XXX       |  |X XX  XXX       |  |   XXXX         |  |  XXXXXX        |  |   XXX XXX      |
;|   XXXXX        |  |   XXXXX        |  |   XXX X        |  |  XXX           |  |   XX X         |  |   XXX X        |  |XXXXXX X        |  |   XXX          |  |  XXXXXX        |  |    XXXXXX      |
;|   XXX X        |  |   XXX X        |  |   XXX          |  |  XXXX          |  |   XXXX         |  |  XXXXX         |  |XXXXXXX         |  |   XXXX         |  |   XXXX         |  |    XXXXX       |
;|  XXXX          |  |  XXXX          |  |  XXXX          |  |  XXXX          |  |   XXXX         |  | XXXXXXX        |  | XXXXXXX        |  |  XXXXX         |  |   XXXX         |  |    XXXX        |
;|  XXXX          |  |  XXXX          |  |  XXXX          |  |  XXXX          |  |  XXXXXX        |  | XXXXXXX        |  |   XXXXX        |  |  XXXXX         |  |   XXXX         |  |   XXXXXX       |
;| XXXXX          |  | XXXXX          |  | XXXXX          |  | XXXXX          |  |  XXXX X        |  |   XXXXX        |  |  XXXXXX        |  |  XXXX          |  |   XXXX         |  |   XXXX X       |
;| XXXX           |  | XXXX           |  | XXXX           |  | XXX X          |  |  XXXX X        |  |  XXXXXX        |  |  XXXXX         |  |  XXXX          |  |   XXX          |  |   XXXX X       |
;| XXXXX          |  | XXXXX          |  | XXXXX          |  | XXX X          |  | XXX X X        |  |  XXXXX         |  | XXXXX          |  |  XXXX          |  |   XXX          |  |  XXXX   X      |
;| XXX X          |  | XXX X          |  | XXX X          |  | XX  XX         |  | XXX X X        |  | XXX XX         |  | XXXX           |  | XXXX           |  |  XXX           |  |  XXX    X      |
;| XXXXX          |  | XXXXX          |  | XXXXX          |  | XXX  X         |  | XXXX X         |  | XXXX           |  | XXXX           |  | XXXX           |  |  XXXX          |  |  XXX    X      |
;| XXXXX          |  | XXXXX          |  | XXXXX          |  | XXX  X         |  | XXXX X         |  | XXXX           |  | XXXXX          |  | XXXX           |  |  XXXX          |  |  XXXX   X      |
;| XXX X          |  | XXX X          |  | XXX X          |  | XXX  XX        |  |  XXX  X        |  | XXXX           |  |  XXXX          |  | XXXXX          |  |  XXXX          |  |  XXXX    X     |
;|  XX XX         |  |  XX X          |  |  XX XX         |  | XXX   X        |  |  XXXX X        |  |  XXXX          |  |  XXXXX         |  |  XXXX          |  |  XXXX          |  |  XXXX    X     |
;|  XXX X         |  |  XXXX          |  |  XXX X         |  |  XX   X        |  |  XXXX  X       |  |  XXXX          |  |  XXXXX         |  |  XXXX          |  |  XXX           |  |  XXXX    X     |
;|  XXX X         |  |  XXXX          |  |  XXX X         |  |  XXX   X       |  |  XX X  X       |  |  XX XX         |  |   XX X         |  |  XXXXX         |  |  XXX           |  |  XXX    XX     |
;|   XX X         |  |   XXX          |  |   XX X         |  |   XX    X      |  |  XXXX   XX     |  |  XXXXX         |  |   XXXX         |  |  XX XX         |  |  X XX          |  |  X XX   X      |
;|  XXX X         |  |  XXXX          |  |  XXX  X        |  |   XX    X      |  |  XXXX   XX     |  |  XXXXX         |  |   XXXX         |  |  XXXX          |  |  XXXX          |  |  XXXX          |
;|  XX  X         |  |  XX X          |  |  XX   X        |  |   XX     X     |  |   XX           |  |   XXX          |  |   XXXX         |  |  XXXX          |  |  XX X          |  |  XX X          |
;|  XX   X        |  |  XX X          |  |  XX   X        |  |   XX      X    |  |   XX           |  |   XXX          |  |   XXX          |  |  XXXX          |  |  XX XX         |  |  XX XX         |
;|  XX   X        |  |  XX X          |  |  XX   X        |  |   XX       X   |  |   XX           |  |   XXX          |  |   XXX          |  |  XXXX          |  |  XX XX         |  |  XX XX         |
;|  XX   X        |  |  XX XX         |  |  XX   XX       |  |   XX X     X   |  |   XX X         |  |   XX           |  |   XXX          |  |  XXX           |  |  XX XX         |  |  XX  X         |
;|       X        |  |                |  |                |  |      X      X  |  |      X         |  |      X         |  |      X         |  |    XX          |  |      X         |  |      XX        |
;|  XXX  X        |  |  XXX           |  |  XXX           |  |   XXX       XXX|  |   XXX         X|  |   XXXXX       X|  |   XXXXX       X|  |  XX XX         |  |  XX  X         |  |  XX   X        |
;|  XXX  XX       |  |  XXX           |  |  XXX           |  |   XXX        XX|  |   XXX         X|  |   XXX X       X|  |   XXX X       X|  |  XX XX         |  |  XX  X         |  |  XX   X        |
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Putt_1a:
    .byte $39 ; |  XXX  X| $D700
    .byte $39 ; |  XXX  X| $D701
    .byte $01 ; |       X| $D702
    .byte $31 ; |  XX   X| $D703
    .byte $31 ; |  XX   X| $D704
    .byte $31 ; |  XX   X| $D705
    .byte $32 ; |  XX  X | $D706
    .byte $3A ; |  XXX X | $D707
    .byte $1A ; |   XX X | $D708
    .byte $3A ; |  XXX X | $D709
    .byte $3A ; |  XXX X | $D70A
    .byte $36 ; |  XX XX | $D70B
    .byte $74 ; | XXX X  | $D70C
    .byte $7C ; | XXXXX  | $D70D
    .byte $7C ; | XXXXX  | $D70E
    .byte $74 ; | XXX X  | $D70F
    .byte $7C ; | XXXXX  | $D710
    .byte $78 ; | XXXX   | $D711
    .byte $7C ; | XXXXX  | $D712
    .byte $3C ; |  XXXX  | $D713
    .byte $3C ; |  XXXX  | $D714
    .byte $1D ; |   XXX X| $D715
    .byte $1F ; |   XXXXX| $D716
    .byte $0F ; |    XXXX| $D717
    .byte $07 ; |     XXX| $D718
    .byte $07 ; |     XXX| $D719
    .byte $03 ; |      XX| $D71A
    .byte $01 ; |       X| $D71B
    .byte $00 ; |        | $D71C
    .byte $00 ; |        | $D71D
    .byte $00 ; |        | $D71E
    .byte $00 ; |        | $D71F
Putt_2a:
    .byte $38 ; |  XXX   | $D720
    .byte $38 ; |  XXX   | $D721
    .byte $00 ; |        | $D722
    .byte $36 ; |  XX XX | $D723
    .byte $34 ; |  XX X  | $D724
    .byte $34 ; |  XX X  | $D725
    .byte $34 ; |  XX X  | $D726
    .byte $3C ; |  XXXX  | $D727
    .byte $1C ; |   XXX  | $D728
    .byte $3C ; |  XXXX  | $D729
    .byte $3C ; |  XXXX  | $D72A
    .byte $34 ; |  XX X  | $D72B
    .byte $74 ; | XXX X  | $D72C
    .byte $7C ; | XXXXX  | $D72D
    .byte $7C ; | XXXXX  | $D72E
    .byte $74 ; | XXX X  | $D72F
    .byte $7C ; | XXXXX  | $D730
    .byte $78 ; | XXXX   | $D731
    .byte $7C ; | XXXXX  | $D732
    .byte $3C ; |  XXXX  | $D733
    .byte $3C ; |  XXXX  | $D734
    .byte $1D ; |   XXX X| $D735
    .byte $1F ; |   XXXXX| $D736
    .byte $0F ; |    XXXX| $D737
    .byte $07 ; |     XXX| $D738
    .byte $07 ; |     XXX| $D739
    .byte $03 ; |      XX| $D73A
    .byte $01 ; |       X| $D73B
    .byte $00 ; |        | $D73C
    .byte $00 ; |        | $D73D
    .byte $00 ; |        | $D73E
    .byte $00 ; |        | $D73F
Putt_3a:
    .byte $38 ; |  XXX   | $D740
    .byte $38 ; |  XXX   | $D741
    .byte $00 ; |        | $D742
    .byte $31 ; |  XX   X| $D743
    .byte $31 ; |  XX   X| $D744
    .byte $31 ; |  XX   X| $D745
    .byte $31 ; |  XX   X| $D746
    .byte $39 ; |  XXX  X| $D747
    .byte $1A ; |   XX X | $D748
    .byte $3A ; |  XXX X | $D749
    .byte $3A ; |  XXX X | $D74A
    .byte $36 ; |  XX XX | $D74B
    .byte $74 ; | XXX X  | $D74C
    .byte $7C ; | XXXXX  | $D74D
    .byte $7C ; | XXXXX  | $D74E
    .byte $74 ; | XXX X  | $D74F
    .byte $7C ; | XXXXX  | $D750
    .byte $78 ; | XXXX   | $D751
    .byte $7C ; | XXXXX  | $D752
    .byte $3C ; |  XXXX  | $D753
    .byte $3C ; |  XXXX  | $D754
    .byte $1C ; |   XXX  | $D755
    .byte $1D ; |   XXX X| $D756
    .byte $0F ; |    XXXX| $D757
    .byte $07 ; |     XXX| $D758
    .byte $07 ; |     XXX| $D759
    .byte $07 ; |     XXX| $D75A
    .byte $03 ; |      XX| $D75B
    .byte $01 ; |       X| $D75C
    .byte $00 ; |        | $D75D
    .byte $00 ; |        | $D75E
    .byte $00 ; |        | $D75F
Putt_1b:
    .byte $80 ; |X       | $D760
Blank_and_Shared:
    .byte $00 ; |        | $D761  shared  used to blank GRP1 gfx, Nusiz1, Color P1,
    .byte $00 ; |        | $D762  shared  when drawing green background
    .byte $00 ; |        | $D763  shared
    .byte $00 ; |        | $D764  shared
    .byte $00 ; |        | $D765  shared
    .byte $00 ; |        | $D766  shared
    .byte $00 ; |        | $D767  shared
    .byte $00 ; |        | $D768  shared
    .byte $00 ; |        | $D769  shared
    .byte $00 ; |        | $D76A  shared
    .byte $00 ; |        | $D76B  shared
    .byte $00 ; |        | $D76C  shared
    .byte $00 ; |        | $D76D  shared
    .byte $00 ; |        | $D76E  shared
    .byte $00 ; |        | $D76F  shared
    .byte $00 ; |        | $D770  shared
    .byte $00 ; |        | $D771  shared
    .byte $00 ; |        | $D772  shared
    .byte $00 ; |        | $D773  shared
    .byte $00 ; |        | $D774  shared
    .byte $00 ; |        | $D775  shared
    .byte $00 ; |        | $D776  shared
    .byte $80 ; |X       | $D777
    .byte $80 ; |X       | $D778
    .byte $80 ; |X       | $D779
    .byte $80 ; |X       | $D77A
    .byte $00 ; |        | $D77B
    .byte $00 ; |        | $D77C
    .byte $00 ; |        | $D77D
    .byte $00 ; |        | $D77E
    .byte $00 ; |        | $D77F
Putt_2b:
    .byte $00 ; |        | $D780
    .byte $00 ; |        | $D781
    .byte $00 ; |        | $D782
    .byte $00 ; |        | $D783
    .byte $00 ; |        | $D784
    .byte $00 ; |        | $D785
    .byte $00 ; |        | $D786
    .byte $00 ; |        | $D787
    .byte $00 ; |        | $D788
    .byte $00 ; |        | $D789
    .byte $00 ; |        | $D78A
    .byte $00 ; |        | $D78B
    .byte $00 ; |        | $D78C
    .byte $00 ; |        | $D78D
    .byte $00 ; |        | $D78E
    .byte $00 ; |        | $D78F
    .byte $00 ; |        | $D790
    .byte $00 ; |        | $D791
    .byte $00 ; |        | $D792
    .byte $00 ; |        | $D793
    .byte $00 ; |        | $D794
    .byte $00 ; |        | $D795
    .byte $00 ; |        | $D796
    .byte $80 ; |X       | $D797
    .byte $80 ; |X       | $D798
    .byte $80 ; |X       | $D799
    .byte $80 ; |X       | $D79A
    .byte $00 ; |        | $D79B
    .byte $00 ; |        | $D79C
    .byte $00 ; |        | $D79D
    .byte $00 ; |        | $D79E
    .byte $00 ; |        | $D79F
Putt_3b:
    .byte $00 ; |        | $D7A0
    .byte $00 ; |        | $D7A1
    .byte $00 ; |        | $D7A2
    .byte $80 ; |X       | $D7A3
    .byte $00 ; |        | $D7A4
    .byte $00 ; |        | $D7A5
    .byte $00 ; |        | $D7A6
    .byte $00 ; |        | $D7A7
    .byte $00 ; |        | $D7A8
    .byte $00 ; |        | $D7A9
    .byte $00 ; |        | $D7AA
    .byte $00 ; |        | $D7AB
    .byte $00 ; |        | $D7AC
    .byte $00 ; |        | $D7AD
    .byte $00 ; |        | $D7AE
    .byte $00 ; |        | $D7AF
    .byte $00 ; |        | $D7B0
    .byte $00 ; |        | $D7B1
    .byte $00 ; |        | $D7B2
    .byte $00 ; |        | $D7B3
    .byte $00 ; |        | $D7B4
    .byte $00 ; |        | $D7B5
    .byte $00 ; |        | $D7B6
    .byte $00 ; |        | $D7B7
    .byte $80 ; |X       | $D7B8
    .byte $80 ; |X       | $D7B9
    .byte $80 ; |X       | $D7BA
    .byte $80 ; |X       | $D7BB
    .byte $00 ; |        | $D7BC
    .byte $00 ; |        | $D7BD
    .byte $00 ; |        | $D7BE
    .byte $00 ; |        | $D7BF
Drive_1a:
    .byte $1C ; |   XXX  | $D7C0
    .byte $1C ; |   XXX  | $D7C1
    .byte $02 ; |      X | $D7C2
    .byte $1A ; |   XX X | $D7C3
    .byte $18 ; |   XX   | $D7C4
    .byte $18 ; |   XX   | $D7C5
    .byte $18 ; |   XX   | $D7C6
    .byte $18 ; |   XX   | $D7C7
    .byte $18 ; |   XX   | $D7C8
    .byte $38 ; |  XXX   | $D7C9
    .byte $31 ; |  XX   X| $D7CA
    .byte $71 ; | XXX   X| $D7CB
    .byte $73 ; | XXX  XX| $D7CC
    .byte $72 ; | XXX  X | $D7CD
    .byte $72 ; | XXX  X | $D7CE
    .byte $66 ; | XX  XX | $D7CF
    .byte $74 ; | XXX X  | $D7D0
    .byte $74 ; | XXX X  | $D7D1
    .byte $7C ; | XXXXX  | $D7D2
    .byte $3C ; |  XXXX  | $D7D3
    .byte $3C ; |  XXXX  | $D7D4
    .byte $3C ; |  XXXX  | $D7D5
    .byte $38 ; |  XXX   | $D7D6
    .byte $1C ; |   XXX  | $D7D7
    .byte $1D ; |   XXX X| $D7D8
    .byte $0B ; |    X XX| $D7D9
    .byte $05 ; |     X X| $D7DA
    .byte $06 ; |     XX | $D7DB
    .byte $07 ; |     XXX| $D7DC
    .byte $03 ; |      XX| $D7DD
    .byte $00 ; |        | $D7DE
    .byte $00 ; |        | $D7DF
Drive_2a:
    .byte $1C ; |   XXX  | $D7E0
    .byte $1C ; |   XXX  | $D7E1
    .byte $02 ; |      X | $D7E2
    .byte $1A ; |   XX X | $D7E3
    .byte $18 ; |   XX   | $D7E4
    .byte $18 ; |   XX   | $D7E5
    .byte $18 ; |   XX   | $D7E6
    .byte $3C ; |  XXXX  | $D7E7
    .byte $3C ; |  XXXX  | $D7E8
    .byte $34 ; |  XX X  | $D7E9
    .byte $3C ; |  XXXX  | $D7EA
    .byte $3D ; |  XXXX X| $D7EB
    .byte $39 ; |  XXX  X| $D7EC
    .byte $7A ; | XXXX X | $D7ED
    .byte $7A ; | XXXX X | $D7EE
    .byte $75 ; | XXX X X| $D7EF
    .byte $75 ; | XXX X X| $D7F0
    .byte $3D ; |  XXXX X| $D7F1
    .byte $3D ; |  XXXX X| $D7F2
    .byte $3F ; |  XXXXXX| $D7F3
    .byte $1E ; |   XXXX | $D7F4
    .byte $1E ; |   XXXX | $D7F5
    .byte $1A ; |   XX X | $D7F6
    .byte $0D ; |    XX X| $D7F7
    .byte $03 ; |      XX| $D7F8
    .byte $05 ; |     X X| $D7F9
    .byte $06 ; |     XX | $D7FA
    .byte $07 ; |     XXX| $D7FB
    .byte $03 ; |      XX| $D7FC
    .byte $00 ; |        | $D7FD
    .byte $00 ; |        | $D7FE
    .byte $00 ; |        | $D7FF
Drive_3a:
    .byte $1D ; |   XXX X| $D800
    .byte $1F ; |   XXXXX| $D801
    .byte $02 ; |      X | $D802
    .byte $18 ; |   XX   | $D803
    .byte $1C ; |   XXX  | $D804
    .byte $1C ; |   XXX  | $D805
    .byte $1C ; |   XXX  | $D806
    .byte $3E ; |  XXXXX | $D807
    .byte $3E ; |  XXXXX | $D808
    .byte $36 ; |  XX XX | $D809
    .byte $3C ; |  XXXX  | $D80A
    .byte $3C ; |  XXXX  | $D80B
    .byte $78 ; | XXXX   | $D80C
    .byte $78 ; | XXXX   | $D80D
    .byte $78 ; | XXXX   | $D80E
    .byte $76 ; | XXX XX | $D80F
    .byte $3E ; |  XXXXX | $D810
    .byte $3F ; |  XXXXXX| $D811
    .byte $1F ; |   XXXXX| $D812
    .byte $7F ; | XXXXXXX| $D813
    .byte $7F ; | XXXXXXX| $D814
    .byte $3E ; |  XXXXX | $D815
    .byte $1D ; |   XXX X| $D816
    .byte $13 ; |   X  XX| $D817
    .byte $25 ; |  X  X X| $D818
    .byte $26 ; |  X  XX | $D819
    .byte $27 ; |  X  XXX| $D81A
    .byte $43 ; | X    XX| $D81B
    .byte $40 ; | X      | $D81C
    .byte $C0 ; |XX      | $D81D
    .byte $C0 ; |XX      | $D81E
    .byte $00 ; |        | $D81F
Drive_4a:
    .byte $1D ; |   XXX X| $D820
    .byte $1F ; |   XXXXX| $D821
    .byte $02 ; |      X | $D822
    .byte $1C ; |   XXX  | $D823
    .byte $1C ; |   XXX  | $D824
    .byte $1C ; |   XXX  | $D825
    .byte $1E ; |   XXXX | $D826
    .byte $1E ; |   XXXX | $D827
    .byte $1E ; |   XXXX | $D828
    .byte $1A ; |   XX X | $D829
    .byte $3E ; |  XXXXX | $D82A
    .byte $3E ; |  XXXXX | $D82B
    .byte $3C ; |  XXXX  | $D82C
    .byte $7C ; | XXXXX  | $D82D
    .byte $78 ; | XXXX   | $D82E
    .byte $78 ; | XXXX   | $D82F
    .byte $7C ; | XXXXX  | $D830
    .byte $3E ; |  XXXXX | $D831
    .byte $3F ; |  XXXXXX| $D832
    .byte $1F ; |   XXXXX| $D833
    .byte $7F ; | XXXXXXX| $D834
    .byte $FE ; |XXXXXXX | $D835
    .byte $FD ; |XXXXXX X| $D836
    .byte $B3 ; |X XX  XX| $D837
    .byte $A5 ; |X X  X X| $D838
    .byte $A6 ; |X X  XX | $D839
    .byte $C7 ; |XX   XXX| $D83A
    .byte $4B ; | X  X XX| $D83B
    .byte $48 ; | X  X   | $D83C
    .byte $78 ; | XXXX   | $D83D
    .byte $00 ; |        | $D83E
    .byte $00 ; |        | $D83F
Drive_5a:
    .byte $36 ; |  XX XX | $D840
    .byte $36 ; |  XX XX | $D841
    .byte $0C ; |    XX  | $D842
    .byte $38 ; |  XXX   | $D843
    .byte $3C ; |  XXXX  | $D844
    .byte $3C ; |  XXXX  | $D845
    .byte $3C ; |  XXXX  | $D846
    .byte $3C ; |  XXXX  | $D847
    .byte $36 ; |  XX XX | $D848
    .byte $3E ; |  XXXXX | $D849
    .byte $3C ; |  XXXX  | $D84A
    .byte $3C ; |  XXXX  | $D84B
    .byte $7C ; | XXXXX  | $D84C
    .byte $78 ; | XXXX   | $D84D
    .byte $78 ; | XXXX   | $D84E
    .byte $78 ; | XXXX   | $D84F
    .byte $3C ; |  XXXX  | $D850
    .byte $3C ; |  XXXX  | $D851
    .byte $3C ; |  XXXX  | $D852
    .byte $3E ; |  XXXXX | $D853
    .byte $3E ; |  XXXXX | $D854
    .byte $1E ; |   XXXX | $D855
    .byte $1C ; |   XXX  | $D856
    .byte $1E ; |   XXXX | $D857
    .byte $2B ; |  X X XX| $D858
    .byte $27 ; |  X  XXX| $D859
    .byte $07 ; |     XXX| $D85A
    .byte $07 ; |     XXX| $D85B
    .byte $02 ; |      X | $D85C
    .byte $00 ; |        | $D85D
    .byte $00 ; |        | $D85E
    .byte $00 ; |        | $D85F
Drive_6a:
    .byte $32 ; |  XX  X | $D860
    .byte $32 ; |  XX  X | $D861
    .byte $02 ; |      X | $D862
    .byte $36 ; |  XX XX | $D863
    .byte $36 ; |  XX XX | $D864
    .byte $36 ; |  XX XX | $D865
    .byte $34 ; |  XX X  | $D866
    .byte $3C ; |  XXXX  | $D867
    .byte $2C ; |  X XX  | $D868
    .byte $38 ; |  XXX   | $D869
    .byte $38 ; |  XXX   | $D86A
    .byte $3C ; |  XXXX  | $D86B
    .byte $3C ; |  XXXX  | $D86C
    .byte $3C ; |  XXXX  | $D86D
    .byte $3C ; |  XXXX  | $D86E
    .byte $38 ; |  XXX   | $D86F
    .byte $1C ; |   XXX  | $D870
    .byte $1C ; |   XXX  | $D871
    .byte $1E ; |   XXXX | $D872
    .byte $1E ; |   XXXX | $D873
    .byte $1E ; |   XXXX | $D874
    .byte $1E ; |   XXXX | $D875
    .byte $3F ; |  XXXXXX| $D876
    .byte $3F ; |  XXXXXX| $D877
    .byte $6B ; | XX X XX| $D878
    .byte $6B ; | XX X XX| $D879
    .byte $53 ; | X X  XX| $D87A
    .byte $51 ; | X X   X| $D87B
    .byte $50 ; | X X    | $D87C
    .byte $60 ; | XX     | $D87D
    .byte $7F ; | XXXXXXX| $D87E
    .byte $20 ; |  X     | $D87F
Drive_7a:
    .byte $31 ; |  XX   X| $D880
    .byte $31 ; |  XX   X| $D881
    .byte $03 ; |      XX| $D882
    .byte $32 ; |  XX  X | $D883
    .byte $36 ; |  XX XX | $D884
    .byte $36 ; |  XX XX | $D885
    .byte $34 ; |  XX X  | $D886
    .byte $3C ; |  XXXX  | $D887
    .byte $2C ; |  X XX  | $D888
    .byte $38 ; |  XXX   | $D889
    .byte $3C ; |  XXXX  | $D88A
    .byte $3C ; |  XXXX  | $D88B
    .byte $3C ; |  XXXX  | $D88C
    .byte $3C ; |  XXXX  | $D88D
    .byte $38 ; |  XXX   | $D88E
    .byte $38 ; |  XXX   | $D88F
    .byte $3C ; |  XXXX  | $D890
    .byte $1E ; |   XXXX | $D891
    .byte $1E ; |   XXXX | $D892
    .byte $1F ; |   XXXXX| $D893
    .byte $0F ; |    XXXX| $D894
    .byte $0F ; |    XXXX| $D895
    .byte $0F ; |    XXXX| $D896
    .byte $1D ; |   XXX X| $D897
    .byte $1B ; |   XX XX| $D898
    .byte $1F ; |   XXXXX| $D899
    .byte $0E ; |    XXX | $D89A
    .byte $02 ; |      X | $D89B
    .byte $00 ; |        | $D89C
    .byte $00 ; |        | $D89D
    .byte $00 ; |        | $D89E
    .byte $00 ; |        | $D89F
Drive_1b:
    .byte $03 ; |      XX| $D8A0
    .byte $07 ; |     XXX| $D8A1
    .byte $04 ; |     X  | $D8A2
    .byte $08 ; |    X   | $D8A3
    .byte $08 ; |    X   | $D8A4
    .byte $10 ; |   X    | $D8A5
    .byte $20 ; |  X     | $D8A6
    .byte $40 ; | X      | $D8A7
    .byte $40 ; | X      | $D8A8
    .byte $80 ; |X       | $D8A9
    .byte $00 ; |        | $D8AA
    .byte $00 ; |        | $D8AB
    .byte $00 ; |        | $D8AC
    .byte $00 ; |        | $D8AD
    .byte $00 ; |        | $D8AE
    .byte $00 ; |        | $D8AF
    .byte $00 ; |        | $D8B0
    .byte $00 ; |        | $D8B1
    .byte $00 ; |        | $D8B2
    .byte $00 ; |        | $D8B3
    .byte $00 ; |        | $D8B4
    .byte $00 ; |        | $D8B5
    .byte $00 ; |        | $D8B6
    .byte $00 ; |        | $D8B7
    .byte $00 ; |        | $D8B8
    .byte $80 ; |X       | $D8B9
    .byte $00 ; |        | $D8BA
    .byte $80 ; |X       | $D8BB
    .byte $80 ; |X       | $D8BC
    .byte $00 ; |        | $D8BD
    .byte $00 ; |        | $D8BE
    .byte $00 ; |        | $D8BF
Drive_2b:
    .byte $01 ; |       X| $D8C0
    .byte $01 ; |       X| $D8C1
    .byte $00 ; |        | $D8C2
    .byte $00 ; |        | $D8C3
    .byte $00 ; |        | $D8C4
    .byte $00 ; |        | $D8C5
    .byte $00 ; |        | $D8C6
    .byte $60 ; | XX     | $D8C7
    .byte $60 ; | XX     | $D8C8
    .byte $80 ; |X       | $D8C9
    .byte $80 ; |X       | $D8CA
    .byte $00 ; |        | $D8CB
    .byte $00 ; |        | $D8CC
    .byte $00 ; |        | $D8CD
    .byte $00 ; |        | $D8CE
    .byte $00 ; |        | $D8CF
    .byte $00 ; |        | $D8D0
    .byte $00 ; |        | $D8D1
    .byte $00 ; |        | $D8D2
    .byte $00 ; |        | $D8D3
    .byte $00 ; |        | $D8D4
    .byte $00 ; |        | $D8D5
    .byte $00 ; |        | $D8D6
    .byte $00 ; |        | $D8D7
    .byte $80 ; |X       | $D8D8
    .byte $00 ; |        | $D8D9
    .byte $80 ; |X       | $D8DA
    .byte $80 ; |X       | $D8DB
    .byte $00 ; |        | $D8DC
    .byte $00 ; |        | $D8DD
    .byte $00 ; |        | $D8DE
    .byte $00 ; |        | $D8DF
Drive_3b:
    .byte $01 ; |       X| $D8E0
    .byte $01 ; |       X| $D8E1
    .byte $00 ; |        | $D8E2
    .byte $00 ; |        | $D8E3
    .byte $00 ; |        | $D8E4
    .byte $00 ; |        | $D8E5
    .byte $00 ; |        | $D8E6
    .byte $00 ; |        | $D8E7
    .byte $00 ; |        | $D8E8
    .byte $00 ; |        | $D8E9
    .byte $00 ; |        | $D8EA
    .byte $00 ; |        | $D8EB
    .byte $00 ; |        | $D8EC
    .byte $00 ; |        | $D8ED
    .byte $00 ; |        | $D8EE
    .byte $00 ; |        | $D8EF
    .byte $00 ; |        | $D8F0
    .byte $00 ; |        | $D8F1
    .byte $00 ; |        | $D8F2
    .byte $00 ; |        | $D8F3
    .byte $00 ; |        | $D8F4
    .byte $00 ; |        | $D8F5
    .byte $00 ; |        | $D8F6
    .byte $80 ; |X       | $D8F7
    .byte $00 ; |        | $D8F8
    .byte $80 ; |X       | $D8F9
    .byte $80 ; |X       | $D8FA
    .byte $00 ; |        | $D8FB
    .byte $00 ; |        | $D8FC
    .byte $00 ; |        | $D8FD
    .byte $00 ; |        | $D8FE
    .byte $00 ; |        | $D8FF
Drive_4b:
    .byte $01 ; |       X| $D900
    .byte $01 ; |       X| $D901
    .byte $00 ; |        | $D902
    .byte $00 ; |        | $D903
    .byte $00 ; |        | $D904
    .byte $00 ; |        | $D905
    .byte $00 ; |        | $D906
    .byte $00 ; |        | $D907
    .byte $00 ; |        | $D908
    .byte $00 ; |        | $D909
    .byte $00 ; |        | $D90A
    .byte $00 ; |        | $D90B
    .byte $00 ; |        | $D90C
    .byte $00 ; |        | $D90D
    .byte $00 ; |        | $D90E
    .byte $00 ; |        | $D90F
    .byte $00 ; |        | $D910
    .byte $00 ; |        | $D911
    .byte $00 ; |        | $D912
    .byte $00 ; |        | $D913
    .byte $00 ; |        | $D914
    .byte $00 ; |        | $D915
    .byte $00 ; |        | $D916
    .byte $80 ; |X       | $D917
    .byte $00 ; |        | $D918
    .byte $80 ; |X       | $D919
    .byte $80 ; |X       | $D91A
    .byte $00 ; |        | $D91B
    .byte $00 ; |        | $D91C
    .byte $00 ; |        | $D91D
    .byte $00 ; |        | $D91E
    .byte $00 ; |        | $D91F
Drive_5b:
    .byte $00 ; |        | $D920
    .byte $00 ; |        | $D921
    .byte $00 ; |        | $D922
    .byte $00 ; |        | $D923
    .byte $00 ; |        | $D924
    .byte $00 ; |        | $D925
    .byte $00 ; |        | $D926
    .byte $00 ; |        | $D927
    .byte $00 ; |        | $D928
    .byte $00 ; |        | $D929
    .byte $00 ; |        | $D92A
    .byte $00 ; |        | $D92B
    .byte $00 ; |        | $D92C
    .byte $00 ; |        | $D92D
    .byte $00 ; |        | $D92E
    .byte $00 ; |        | $D92F
    .byte $00 ; |        | $D930
    .byte $00 ; |        | $D931
    .byte $00 ; |        | $D932
    .byte $00 ; |        | $D933
    .byte $00 ; |        | $D934
    .byte $00 ; |        | $D935
    .byte $00 ; |        | $D936
    .byte $00 ; |        | $D937
    .byte $00 ; |        | $D938
    .byte $00 ; |        | $D939
    .byte $00 ; |        | $D93A
    .byte $00 ; |        | $D93B
    .byte $00 ; |        | $D93C
    .byte $00 ; |        | $D93D
    .byte $00 ; |        | $D93E
    .byte $00 ; |        | $D93F
TeeOffBox:
    .byte $00 ; |        | $D940
    .byte $82 ; |X     X | $D941
    .byte $82 ; |X     X | $D942
Drive_6b:
    .byte $00 ; |        | $D943
    .byte $00 ; |        | $D944
    .byte $00 ; |        | $D945
    .byte $00 ; |        | $D946
    .byte $00 ; |        | $D947
    .byte $00 ; |        | $D948
    .byte $00 ; |        | $D949
    .byte $00 ; |        | $D94A
    .byte $00 ; |        | $D94B
    .byte $00 ; |        | $D94C
    .byte $00 ; |        | $D94D
    .byte $00 ; |        | $D94E
    .byte $00 ; |        | $D94F
    .byte $00 ; |        | $D950
    .byte $00 ; |        | $D951
    .byte $00 ; |        | $D952
    .byte $00 ; |        | $D953
    .byte $00 ; |        | $D954
    .byte $00 ; |        | $D955
    .byte $00 ; |        | $D956
    .byte $00 ; |        | $D957
    .byte $00 ; |        | $D958
    .byte $00 ; |        | $D959
    .byte $00 ; |        | $D95A
    .byte $80 ; |X       | $D95B
    .byte $80 ; |X       | $D95C
    .byte $80 ; |X       | $D95D
    .byte $00 ; |        | $D95E
    .byte $20 ; |  X     | $D95F
    .byte $20 ; |  X     | $D960
    .byte $E0 ; |XXX     | $D961
    .byte $00 ; |        | $D962
Drive_7b:
    .byte $00 ; |        | $D963
    .byte $00 ; |        | $D964
    .byte $00 ; |        | $D965
    .byte $00 ; |        | $D966
    .byte $00 ; |        | $D967
    .byte $00 ; |        | $D968
    .byte $00 ; |        | $D969
    .byte $00 ; |        | $D96A
    .byte $40 ; | X      | $D96B
    .byte $60 ; | XX     | $D96C
    .byte $20 ; |  X     | $D96D
    .byte $20 ; |  X     | $D96E
    .byte $20 ; |  X     | $D96F
    .byte $40 ; | X      | $D970
    .byte $40 ; | X      | $D971
    .byte $40 ; | X      | $D972
    .byte $40 ; | X      | $D973
    .byte $80 ; |X       | $D974
    .byte $80 ; |X       | $D975
    .byte $80 ; |X       | $D976
    .byte $00 ; |        | $D977
    .byte $80 ; |X       | $D978
    .byte $C0 ; |XX      | $D979
    .byte $C0 ; |XX      | $D97A
    .byte $C0 ; |XX      | $D97B
    .byte $80 ; |X       | $D97C
    .byte $80 ; |X       | $D97D
    .byte $00 ; |        | $D97E
    .byte $00 ; |        | $D97F
    .byte $00 ; |        | $D980
    .byte $00 ; |        | $D981
    .byte $00 ; |        | $D982

DriveGfxP1_Col_Tab:
    .byte  GREY1         ; $D983
    .byte  GREY2         ; $D984
    .byte  GREY2         ; $D985
    .byte  GREY1         ; $D986
    .byte  GREY1         ; $D987
    .byte  GREY1         ; $D988
    .byte  GREY1         ; $D989
    .byte  GREY1         ; $D98A
    .byte  GREY1         ; $D98B
    .byte  GREY1         ; $D98C
    .byte  GREY1         ; $D98D
    .byte  GREY1         ; $D98E
    .byte  GREY1         ; $D98F
    .byte  GREY1         ; $D990
    .byte  GREY1         ; $D991
    .byte  RED           ; $D992
    .byte  GREY1         ; $D993
    .byte  RED           ; $D994
    .byte  RED           ; $D995
    .byte  RED           ; $D996
    .byte  RED           ; $D997
    .byte  RED           ; $D998
    .byte  RED           ; $D999
    .byte  RED           ; $D99A
    .byte  RED           ; $D99B
    .byte  LIGHT_RED     ; $D99C
    .byte  LIGHT_RED     ; $D99D
    .byte  GREY2         ; $D99E
    .byte  GREY2         ; $D99F
    .byte  GREY2         ; $D9A0
    .byte  GREY2         ; $D9A1
    .byte  GREY2         ; $D9A2

DriveGfxP2_Col_Tab:
    .byte  GREY1         ; $D9A3
    .byte  GREY2         ; $D9A4
    .byte  GREY2         ; $D9A5
    .byte  GREY1         ; $D9A6
    .byte  GREY1         ; $D9A7
    .byte  GREY1         ; $D9A8
    .byte  GREY1         ; $D9A9
    .byte  GREY1         ; $D9AA
    .byte  GREY1         ; $D9AB
    .byte  GREY1         ; $D9AC
    .byte  GREY1         ; $D9AD
    .byte  GREY1         ; $D9AE
    .byte  GREY1         ; $D9AF
    .byte  GREY1         ; $D9B0
    .byte  GREY1         ; $D9B1
    .byte  RED           ; $D9B2
    .byte  GREY1         ; $D9B3
    .byte  RED           ; $D9B4
    .byte  RED           ; $D9B5
    .byte  RED           ; $D9B6
    .byte  RED           ; $D9B7
    .byte  RED           ; $D9B8
    .byte  RED           ; $D9B9
    .byte  RED           ; $D9BA
    .byte  RED           ; $D9BB
    .byte  LIGHT_RED     ; $D9BC
    .byte  LIGHT_RED     ; $D9BD
    .byte  GREY2         ; $D9BE
    .byte  GREY2         ; $D9BF
    .byte  GREY2         ; $D9C0
    .byte  GREY2         ; $D9C1
    .byte  GREY2         ; $D9C2

TreeSm:
    .byte $00 ;            $D9C3
    .byte $00 ; |        | $D9C4
    .byte $08 ; |    X   | $D9C5
    .byte $08 ; |    X   | $D9C6
    .byte $1C ; |   XXX  | $D9C7
    .byte $1C ; |   XXX  | $D9C8
    .byte $3E ; |  XXXXX | $D9C9
    .byte $3E ; |  XXXXX | $D9CA
    .byte $1E ; |   XXXX | $D9CB
    .byte $3C ; |  XXXX  | $D9CC
    .byte $1E ; |   XXXX | $D9CD
    .byte $1C ; |   XXX  | $D9CE
    .byte $08 ; |    X   | $D9CF

TreeSm_Col_Tab:
    .byte  $00           ; $D9D0
    .byte  BROWN+2       ; $D9D1
    .byte  BROWN+2       ; $D9D2
    .byte  BROWN+2       ; $D9D3
    .byte  GREEN         ; $D9D4
    .byte  GREEN         ; $D9D5
    .byte  GREEN         ; $D9D6
    .byte  GREEN         ; $D9D7
    .byte  GREEN         ; $D9D8
    .byte  GREEN         ; $D9D9
    .byte  GREEN         ; $D9DA
    .byte  GREEN         ; $D9DB
    .byte  GREEN         ; $D9DC

WaterTrapSm:
    .byte $00 ;            $D9DD
    .byte $06 ; |     XX | $D9DE
    .byte $0E ; |    XXX | $D9DF
    .byte $1F ; |   XXXXX| $D9E0
    .byte $1F ; |   XXXXX| $D9E1
    .byte $7F ; | XXXXXXX| $D9E2
    .byte $FF ; |XXXXXXXX| $D9E3
    .byte $FF ; |XXXXXXXX| $D9E4
    .byte $FE ; |XXXXXXX | $D9E5
    .byte $FE ; |XXXXXXX | $D9E6
    .byte $7C ; | XXXXX  | $D9E7
    .byte $18 ; |   XX   | $D9E8

WaterTrapSm_Col_Tab:
    .byte  $00           ; $D9E9
    .byte  BLUE          ; $D9EA
    .byte  BLUE          ; $D9EB
    .byte  BLUE          ; $D9EC
    .byte  BLUE          ; $D9ED
    .byte  BLUE          ; $D9EE
    .byte  BLUE          ; $D9EF
    .byte  BLUE          ; $D9F0
    .byte  BLUE          ; $D9F1
    .byte  BLUE          ; $D9F2
    .byte  BLUE          ; $D9F3
    .byte  BLUE          ; $D9F4

SandTrapSm:
    .byte $00 ;            $D9F5
    .byte $00 ; |        | $D9F6
    .byte $70 ; | XXX    | $D9F7
    .byte $F0 ; |XXXX    | $D9F8
    .byte $F8 ; |XXXXX   | $D9F9
    .byte $FC ; |XXXXXX  | $D9FA
    .byte $FE ; |XXXXXXX | $D9FB
    .byte $FF ; |XXXXXXXX| $D9FC
    .byte $7F ; | XXXXXXX| $D9FD
    .byte $3F ; |  XXXXXX| $D9FE
    .byte $1E ; |   XXXX | $D9FF

SandTrapSm_Col_Tab:
    .byte  $00           ; $DA00
    .byte  LIGHT_TAN     ; $DA01
    .byte  LIGHT_TAN     ; $DA02
    .byte  LIGHT_TAN     ; $DA03
    .byte  LIGHT_TAN     ; $DA04
    .byte  LIGHT_TAN     ; $DA05
    .byte  LIGHT_TAN     ; $DA06
    .byte  LIGHT_TAN     ; $DA07
    .byte  LIGHT_TAN     ; $DA08
    .byte  LIGHT_TAN     ; $DA09
    .byte  LIGHT_TAN     ; $DA0A

TreeLg:
    .byte $00 ;            $DA0B
    .byte $03 ; |      XX| $DA0C
    .byte $03 ; |      XX| $DA0D
    .byte $03 ; |      XX| $DA0E
    .byte $1C ; |   XXX  | $DA0F
    .byte $3E ; |  XXXXX | $DA10
    .byte $3E ; |  XXXXX | $DA11
    .byte $3E ; |  XXXXX | $DA12
    .byte $FF ; |XXXXXXXX| $DA13
    .byte $FF ; |XXXXXXXX| $DA14
    .byte $FE ; |XXXXXXX | $DA15
    .byte $7F ; | XXXXXXX| $DA16
    .byte $3F ; |  XXXXXX| $DA17
    .byte $7F ; | XXXXXXX| $DA18
    .byte $3E ; |  XXXXX | $DA19
    .byte $3E ; |  XXXXX | $DA1A
    .byte $3C ; |  XXXX  | $DA1B
    .byte $1E ; |   XXXX | $DA1C
    .byte $3C ; |  XXXX  | $DA1D
    .byte $1C ; |   XXX  | $DA1E
    .byte $0C ; |    XX  | $DA1F
    .byte $08 ; |    X   | $DA20

TreeLg_Col_Tab:
    .byte $00            ; $DA21
    .byte  BROWN+2       ; $DA22
    .byte  BROWN+2       ; $DA23
    .byte  BROWN+2       ; $DA24
    .byte  GREEN         ; $DA25
    .byte  GREEN         ; $DA26
    .byte  GREEN         ; $DA27
    .byte  GREEN         ; $DA28
    .byte  GREEN         ; $DA29
    .byte  GREEN         ; $DA2A
    .byte  GREEN         ; $DA2B
    .byte  GREEN         ; $DA2C
    .byte  GREEN         ; $DA2D
    .byte  GREEN         ; $DA2E
    .byte  GREEN         ; $DA2F
    .byte  GREEN         ; $DA30
    .byte  GREEN         ; $DA31
    .byte  GREEN         ; $DA32
    .byte  GREEN         ; $DA33
    .byte  GREEN         ; $DA34
    .byte  GREEN         ; $DA35
    .byte  GREEN         ; $DA36

TreeLg_HmSz_Tab:
    .byte $00                               ; $DA37
    .byte  NO_MOTION | ONE_COPY             ; $DA38
    .byte  NO_MOTION | ONE_COPY             ; $DA39
    .byte  NO_MOTION | ONE_COPY             ; $DA3A
    .byte    RIGHT_3 | DOUBLE_SIZE_PLAYER   ; $DA3B
    .byte  NO_MOTION | DOUBLE_SIZE_PLAYER   ; $DA3C
    .byte  NO_MOTION | DOUBLE_SIZE_PLAYER   ; $DA3D
    .byte  NO_MOTION | DOUBLE_SIZE_PLAYER   ; $DA3E
    .byte     LEFT_5 | ONE_COPY             ; $DA3F
    .byte     LEFT_1 | ONE_COPY             ; $DA40
    .byte  NO_MOTION | ONE_COPY             ; $DA41
    .byte    RIGHT_1 | ONE_COPY             ; $DA42
    .byte  NO_MOTION | ONE_COPY             ; $DA43
    .byte  NO_MOTION | ONE_COPY             ; $DA44
    .byte  NO_MOTION | ONE_COPY             ; $DA45
    .byte  NO_MOTION | ONE_COPY             ; $DA46
    .byte  NO_MOTION | ONE_COPY             ; $DA47
    .byte  NO_MOTION | ONE_COPY             ; $DA48
    .byte  NO_MOTION | ONE_COPY             ; $DA49
    .byte  NO_MOTION | ONE_COPY             ; $DA4A
    .byte  NO_MOTION | ONE_COPY             ; $DA4B
    .byte  NO_MOTION | ONE_COPY             ; $DA4C

WaterTrapLg:
    .byte $00 ;            $DA4D
    .byte $02 ; |      X | $DA4E
    .byte $0F ; |    XXXX| $DA4F
    .byte $3F ; |  XXXXXX| $DA50
    .byte $7F ; | XXXXXXX| $DA51
    .byte $FE ; |XXXXXXX | $DA52
    .byte $FC ; |XXXXXX  | $DA53
    .byte $F0 ; |XXXX    | $DA54
    .byte $F0 ; |XXXX    | $DA55
    .byte $7C ; | XXXXX  | $DA56
    .byte $FC ; |XXXXXX  | $DA57
    .byte $FC ; |XXXXXX  | $DA58
    .byte $FC ; |XXXXXX  | $DA59
    .byte $FC ; |XXXXXX  | $DA5A
    .byte $FC ; |XXXXXX  | $DA5B
    .byte $FC ; |XXXXXX  | $DA5C
    .byte $FC ; |XXXXXX  | $DA5D
    .byte $3C ; |  XXXX  | $DA5E
    .byte $18 ; |   XX   | $DA5F

WaterTrapLg_Col_Tab:
    .byte  $00           ; $DA60
    .byte  BLUE          ; $DA61
    .byte  BLUE          ; $DA62
    .byte  BLUE          ; $DA63
    .byte  BLUE          ; $DA64
    .byte  BLUE          ; $DA65
    .byte  BLUE          ; $DA66
    .byte  BLUE          ; $DA67
    .byte  BLUE          ; $DA68
    .byte  BLUE          ; $DA69
    .byte  BLUE          ; $DA6A
    .byte  BLUE          ; $DA6B
    .byte  BLUE          ; $DA6C
    .byte  BLUE          ; $DA6D
    .byte  BLUE          ; $DA6E
    .byte  BLUE          ; $DA6F
    .byte  BLUE          ; $DA70
    .byte  BLUE          ; $DA71
    .byte  BLUE          ; $DA72

WaterTrapLg_HmSz_Tab:
    .byte  $00                              ; $DA73
    .byte  NO_MOTION | ONE_COPY             ; $DA74
    .byte  NO_MOTION | ONE_COPY             ; $DA75
    .byte  NO_MOTION | ONE_COPY             ; $DA76
    .byte  NO_MOTION | ONE_COPY             ; $DA77
    .byte  NO_MOTION | ONE_COPY             ; $DA78
    .byte  NO_MOTION | ONE_COPY             ; $DA79
    .byte    RIGHT_3 | DOUBLE_SIZE_PLAYER   ; $DA7A
    .byte  NO_MOTION | DOUBLE_SIZE_PLAYER   ; $DA7B
    .byte    RIGHT_4 | DOUBLE_SIZE_PLAYER   ; $DA7C
    .byte     LEFT_1 | DOUBLE_SIZE_PLAYER   ; $DA7D
    .byte  NO_MOTION | DOUBLE_SIZE_PLAYER   ; $DA7E
    .byte     LEFT_1 | DOUBLE_SIZE_PLAYER   ; $DA7F
    .byte  NO_MOTION | DOUBLE_SIZE_PLAYER   ; $DA80
    .byte    RIGHT_1 | DOUBLE_SIZE_PLAYER   ; $DA81
    .byte    RIGHT_1 | DOUBLE_SIZE_PLAYER   ; $DA82
    .byte  NO_MOTION | DOUBLE_SIZE_PLAYER   ; $DA83
    .byte    RIGHT_3 | DOUBLE_SIZE_PLAYER   ; $DA84
    .byte     LEFT_1 | DOUBLE_SIZE_PLAYER   ; $DA85

SandTrapLg:
    .byte $00 ;            $DA86
    .byte $0F ; |    XXXX| $DA87
    .byte $7E ; | XXXXXX | $DA88
    .byte $7F ; | XXXXXXX| $DA89
    .byte $7F ; | XXXXXXX| $DA8A
    .byte $7F ; | XXXXXXX| $DA8B
    .byte $FE ; |XXXXXXX | $DA8C
    .byte $FC ; |XXXXXX  | $DA8D
    .byte $F8 ; |XXXXX   | $DA8E
    .byte $F0 ; |XXXX    | $DA8F
    .byte $E0 ; |XXX     | $DA90
    .byte $E0 ; |XXX     | $DA91
    .byte $7E ; | XXXXXX | $DA92
    .byte $3E ; |  XXXXX | $DA93
    .byte $70 ; | XXX    | $DA94
    .byte $30 ; |  XX    | $DA95
    .byte $10 ; |   X    | $DA96

SandTrapLg_Col_Tab:
    .byte  $00           ; $DA97
    .byte  LIGHT_TAN     ; $DA98
    .byte  LIGHT_TAN     ; $DA99
    .byte  LIGHT_TAN     ; $DA9A
    .byte  LIGHT_TAN     ; $DA9B
    .byte  LIGHT_TAN     ; $DA9C
    .byte  LIGHT_TAN     ; $DA9D
    .byte  LIGHT_TAN     ; $DA9E
    .byte  LIGHT_TAN     ; $DA9F
    .byte  LIGHT_TAN     ; $DAA0
    .byte  LIGHT_TAN     ; $DAA1
    .byte  LIGHT_TAN     ; $DAA2
    .byte  LIGHT_TAN     ; $DAA3
    .byte  LIGHT_TAN     ; $DAA4
    .byte  LIGHT_TAN     ; $DAA5
    .byte  LIGHT_TAN     ; $DAA6
    .byte  LIGHT_TAN     ; $DAA7

SandTrapLg_HmSz_Tab:
    .byte  $00                              ; $DAA8
    .byte  NO_MOTION | DOUBLE_SIZE_PLAYER   ; $DAA9
    .byte     LEFT_4 | DOUBLE_SIZE_PLAYER   ; $DAAA
    .byte    RIGHT_3 | DOUBLE_SIZE_PLAYER   ; $DAAB
    .byte    RIGHT_2 | DOUBLE_SIZE_PLAYER   ; $DAAC
    .byte    RIGHT_1 | DOUBLE_SIZE_PLAYER   ; $DAAD
    .byte     LEFT_1 | DOUBLE_SIZE_PLAYER   ; $DAAE
    .byte    RIGHT_1 | DOUBLE_SIZE_PLAYER   ; $DAAF
    .byte  NO_MOTION | DOUBLE_SIZE_PLAYER   ; $DAB0
    .byte  NO_MOTION | DOUBLE_SIZE_PLAYER   ; $DAB1
    .byte     LEFT_1 | DOUBLE_SIZE_PLAYER   ; $DAB2
    .byte  NO_MOTION | DOUBLE_SIZE_PLAYER   ; $DAB3
    .byte  NO_MOTION | ONE_COPY             ; $DAB4
    .byte  NO_MOTION | ONE_COPY             ; $DAB5
    .byte    RIGHT_1 | DOUBLE_SIZE_PLAYER   ; $DAB6
    .byte  NO_MOTION | DOUBLE_SIZE_PLAYER   ; $DAB7
    .byte    RIGHT_1 | DOUBLE_SIZE_PLAYER   ; $DAB8

RoughGfx:
    .byte $00 ;            $DAB9
    .byte $60 ; | XX     | $DABA
    .byte $F0 ; |XXXX    | $DABB
    .byte $F0 ; |XXXX    | $DABC
    .byte $F8 ; |XXXXX   | $DABD
    .byte $F8 ; |XXXXX   | $DABE
    .byte $7C ; | XXXXX  | $DABF
    .byte $7E ; | XXXXXX | $DAC0
    .byte $3E ; |  XXXXX | $DAC1
    .byte $3E ; |  XXXXX | $DAC2
    .byte $3E ; |  XXXXX | $DAC3
    .byte $3E ; |  XXXXX | $DAC4
    .byte $3E ; |  XXXXX | $DAC5
    .byte $1E ; |   XXXX | $DAC6
    .byte $1E ; |   XXXX | $DAC7
    .byte $0E ; |    XXX | $DAC8
    .byte $06 ; |     XX | $DAC9

RoughGfx_Col_Tab:
    .byte $00            ; $DACA
    .byte BROWN          ; $DACB
    .byte BROWN          ; $DACC
    .byte BROWN          ; $DACD
    .byte BROWN          ; $DACE
    .byte BROWN          ; $DACF
    .byte BROWN          ; $DAD0
    .byte BROWN          ; $DAD1
    .byte BROWN          ; $DAD2
    .byte BROWN          ; $DAD3
    .byte BROWN          ; $DAD4
    .byte BROWN          ; $DAD5
    .byte BROWN          ; $DAD6
    .byte BROWN          ; $DAD7
    .byte BROWN          ; $DAD8
    .byte BROWN          ; $DAD9
    .byte BROWN          ; $DADA

RoughGfx_HmSz_Tab:
    .byte $00                             ; $DADB
    .byte  NO_MOTION | QUAD_SIZE_PLAYER   ; $Dadc
    .byte     LEFT_2 | QUAD_SIZE_PLAYER   ; $DADD
    .byte     LEFT_1 | QUAD_SIZE_PLAYER   ; $DADE
    .byte  NO_MOTION | QUAD_SIZE_PLAYER   ; $DADF
    .byte  NO_MOTION | QUAD_SIZE_PLAYER   ; $DAE0
    .byte    RIGHT_2 | QUAD_SIZE_PLAYER   ; $DAE1
    .byte     LEFT_1 | QUAD_SIZE_PLAYER   ; $DAE2
    .byte    RIGHT_1 | QUAD_SIZE_PLAYER   ; $DAE3
    .byte     LEFT_3 | QUAD_SIZE_PLAYER   ; $DAE4
    .byte     LEFT_2 | QUAD_SIZE_PLAYER   ; $DAE5
    .byte     LEFT_1 | QUAD_SIZE_PLAYER   ; $DAE6
    .byte     LEFT_2 | QUAD_SIZE_PLAYER   ; $DAE7
    .byte    RIGHT_1 | QUAD_SIZE_PLAYER   ; $DAE8
    .byte     LEFT_2 | QUAD_SIZE_PLAYER   ; $DAE9
    .byte     LEFT_1 | QUAD_SIZE_PLAYER   ; $DAEA
    .byte  NO_MOTION | QUAD_SIZE_PLAYER   ; $DAEB

    .byte $00 ; |        | $DAEC   probably free bytes until next page begins...
    .byte $00 ; |        | $DAED
    .byte $00 ; |        | $DAEE
    .byte $00 ; |        | $DAEF
    .byte $00 ; |        | $DAF0
    .byte $00 ; |        | $DAF1
    .byte $00 ; |        | $DAF2
    .byte $00 ; |        | $DAF3
    .byte $00 ; |        | $DAF4
    .byte $00 ; |        | $DAF5
    .byte $00 ; |        | $DAF6
    .byte $00 ; |        | $DAF7
    .byte $00 ; |        | $DAF8
    .byte $00 ; |        | $DAF9
    .byte $00 ; |        | $DAFA
    .byte $00 ; |        | $DAFB
    .byte $00 ; |        | $DAFC
    .byte $00 ; |        | $DAFD
    .byte $00 ; |        | $DAFE
    .byte $00 ; |        | $DAFF

GreenGfx:
    .byte $00 ;            $DB00
    .byte $F0 ; |XXXX    | $DB01
    .byte $F8 ; |XXXXX   | $DB02
    .byte $F8 ; |XXXXX   | $DB03
    .byte $F8 ; |XXXXX   | $DB04
    .byte $FC ; |XXXXXX  | $DB05
    .byte $FC ; |XXXXXX  | $DB06
    .byte $FC ; |XXXXXX  | $DB07
    .byte $FC ; |XXXXXX  | $DB08
    .byte $FC ; |XXXXXX  | $DB09
    .byte $FC ; |XXXXXX  | $DB0A
    .byte $FC ; |XXXXXX  | $DB0B
    .byte $FE ; |XXXXXXX | $DB0C
    .byte $FE ; |XXXXXXX | $DB0D
    .byte $FE ; |XXXXXXX | $DB0E
    .byte $EE ; |XXX XXX | $DB0F
    .byte $EE ; |XXX XXX | $DB10
    .byte $FE ; |XXXXXXX | $DB11
    .byte $7F ; | XXXXXXX| $DB12
    .byte $7F ; | XXXXXXX| $DB13
    .byte $7F ; | XXXXXXX| $DB14
    .byte $7F ; | XXXXXXX| $DB15
    .byte $3F ; |  XXXXXX| $DB16
    .byte $3F ; |  XXXXXX| $DB17
    .byte $3E ; |  XXXXX | $DB18
    .byte $1E ; |   XXXX | $DB19

TeeOffBox_Col_Tab:
    .byte  $00           ; $DB1A
    .byte  WHITE         ; $DB1B
    .byte  WHITE         ; $DB1C

GreenGfx_Col_Tab:
    .byte  $00           ; $DB1D
    .byte  GREEN         ; $DB1E
    .byte  GREEN         ; $DB1F
    .byte  GREEN         ; $DB20
    .byte  GREEN         ; $DB21
    .byte  GREEN         ; $DB22
    .byte  GREEN         ; $DB23
    .byte  GREEN         ; $DB24
    .byte  GREEN         ; $DB25
    .byte  GREEN         ; $DB26
    .byte  GREEN         ; $DB27
    .byte  GREEN         ; $DB28
    .byte  GREEN         ; $DB29
    .byte  GREEN         ; $DB2A
    .byte  GREEN         ; $DB2B
    .byte  GREEN         ; $DB2C
    .byte  GREEN         ; $DB2D
    .byte  GREEN         ; $DB2E
    .byte  GREEN         ; $DB2F
    .byte  GREEN         ; $DB30
    .byte  GREEN         ; $DB31
    .byte  GREEN         ; $DB32
    .byte  GREEN         ; $DB33
    .byte  GREEN         ; $DB34
    .byte  GREEN         ; $DB35
    .byte  GREEN         ; $DB36

GreenGfx_HmSz_Tab:
    .byte  $00                            ; $DB37
    .byte  NO_MOTION | QUAD_SIZE_PLAYER   ; $DB38
    .byte    RIGHT_3 | QUAD_SIZE_PLAYER   ; $DB39
    .byte  NO_MOTION | QUAD_SIZE_PLAYER   ; $DB3A
    .byte    RIGHT_1 | QUAD_SIZE_PLAYER   ; $DB3B
    .byte    RIGHT_2 | QUAD_SIZE_PLAYER   ; $DB3C
    .byte  NO_MOTION | QUAD_SIZE_PLAYER   ; $DB3D
    .byte  NO_MOTION | QUAD_SIZE_PLAYER   ; $DB3E
    .byte    RIGHT_1 | QUAD_SIZE_PLAYER   ; $DB3F
    .byte  NO_MOTION | QUAD_SIZE_PLAYER   ; $DB40
    .byte  NO_MOTION | QUAD_SIZE_PLAYER   ; $DB41
    .byte    RIGHT_1 | QUAD_SIZE_PLAYER   ; $DB42
    .byte    RIGHT_2 | QUAD_SIZE_PLAYER   ; $DB43
    .byte    RIGHT_1 | QUAD_SIZE_PLAYER   ; $DB44
    .byte  NO_MOTION | QUAD_SIZE_PLAYER   ; $DB45
    .byte    RIGHT_1 | QUAD_SIZE_PLAYER   ; $DB46
    .byte    RIGHT_1 | QUAD_SIZE_PLAYER   ; $DB47
    .byte    RIGHT_1 | QUAD_SIZE_PLAYER   ; $DB48
    .byte    RIGHT_4 | QUAD_SIZE_PLAYER   ; $DB49
    .byte    RIGHT_1 | QUAD_SIZE_PLAYER   ; $DB4A
    .byte  NO_MOTION | QUAD_SIZE_PLAYER   ; $DB4B
    .byte    RIGHT_1 | QUAD_SIZE_PLAYER   ; $DB4C
    .byte    RIGHT_3 | QUAD_SIZE_PLAYER   ; $DB4D
    .byte  NO_MOTION | QUAD_SIZE_PLAYER   ; $DB4E
    .byte     LEFT_2 | QUAD_SIZE_PLAYER   ; $DB4F
    .byte    RIGHT_3 | QUAD_SIZE_PLAYER   ; $DB50

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

NuSz_2_Close_Tab:
  REPEAT 13
    .byte  TWO_COPIES_CLOSE
  REPEND

NuSz_2_Med_Tab:
  REPEAT 13
    .byte  TWO_COPIES_MED
  REPEND

NuSz_3_Close_Tab:
  REPEAT 13
    .byte  THREE_COPIES_CLOSE
  REPEND

NuSz_2_Wide_Tab:
  REPEAT 13
    .byte  TWO_COPIES_WIDE
  REPEND

NuSz_3_Med_Tab:
  REPEAT 13
    .byte  THREE_COPIES_MED
  REPEND

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Stream_Col_Tab:
    .byte  GREEN+4       ; $DB92
    .byte  GREEN+4       ; $DB93
    .byte  GREEN+4       ; $DB94
    .byte  GREEN+4       ; $DB95
    .byte  GREEN+2       ; $DB96   grass along stream
    .byte  GREEN         ; $DB97
    .byte  GREEN-2       ; $DB98
    .byte  BLUE-4        ; $DB99
    .byte  BLUE-2        ; $DB9A
    .byte  BLUE          ; $DB9B
    .byte  BLUE          ; $DB9C
    .byte  BLUE          ; $DB9D    water
    .byte  BLUE          ; $DB9E
    .byte  BLUE          ; $DB9F
    .byte  BLUE          ; $DBA0
    .byte  BLUE-2        ; $DBA1
    .byte  BLUE-4        ; $DBA2
    .byte  GREEN-2       ; $DBA3
    .byte  GREEN         ; $DBA4
    .byte  GREEN+2       ; $DBA5   grass along stream
    .byte  GREEN+4       ; $DBA6
    .byte  GREEN+4       ; $DBA7

PuttGfxP1_Col_Tab:
    .byte  GREY1         ; $DBA8
    .byte  GREY2         ; $DBA9
    .byte  GREY2         ; $DBAA
    .byte  GREY1         ; $DBAB
    .byte  GREY1         ; $DBAC
    .byte  GREY1         ; $DBAD
    .byte  GREY1         ; $DBAE
    .byte  GREY1         ; $DBAF
    .byte  GREY1         ; $DBB0
    .byte  GREY1         ; $DBB1
    .byte  GREY1         ; $DBB2
    .byte  GREY1         ; $DBB3
    .byte  GREY1         ; $DBB4
    .byte  GREY1         ; $DBB5
    .byte  RED           ; $DBB6
    .byte  RED           ; $DBB7
    .byte  RED           ; $DBB8
    .byte  RED           ; $DBB9
    .byte  RED           ; $DBBA
    .byte  RED           ; $DBBB
    .byte  RED           ; $DBBC
    .byte  RED           ; $DBBD
    .byte  RED           ; $DBBE
    .byte  LIGHT_RED     ; $DBBF
    .byte  GREY2         ; $DBC0
    .byte  GREY2         ; $DBC1
    .byte  GREY2         ; $DBC2
    .byte  GREY2         ; $DBC3
    .byte  GREY2         ; $DBC4
    .byte  GREY2         ; $DBC5
    .byte  GREY2         ; $DBC6
    .byte  GREY2         ; $DBC7

PuttGfxP2_Col_Tab:
    .byte  GREY1         ; $DBC8
    .byte  GREY2         ; $DBC9
    .byte  GREY2         ; $DBCA
    .byte  GREY1         ; $DBCB
    .byte  GREY1         ; $Dbcc
    .byte  GREY1         ; $DBCD
    .byte  GREY1         ; $DBCE
    .byte  GREY1         ; $DBCF
    .byte  GREY1         ; $DBD0
    .byte  GREY1         ; $DBD1
    .byte  GREY1         ; $DBD2
    .byte  GREY1         ; $DBD3
    .byte  GREY1         ; $DBD4
    .byte  GREY1         ; $DBD5
    .byte  RED           ; $DBD6
    .byte  RED           ; $DBD7
    .byte  RED           ; $DBD8
    .byte  RED           ; $DBD9
    .byte  RED           ; $DBDA
    .byte  RED           ; $DBDB
    .byte  RED           ; $DBDC
    .byte  RED           ; $DBDD
    .byte  RED           ; $DBDE
    .byte  LIGHT_RED     ; $DBDF
    .byte  GREY2         ; $DBE0
    .byte  GREY2         ; $DBE1
    .byte  GREY2         ; $DBE2
    .byte  GREY2         ; $DBE3
    .byte  GREY2         ; $DBE4
    .byte  GREY2         ; $DBE5
    .byte  GREY2         ; $DBE6
    .byte  GREY2         ; $DBE7

    .byte $00 ; |        | $DBE8   probably free bytes as the subroutine below is
    .byte $00 ; |        | $DBE9   intentionally placed across a page boundary...
    .byte $00 ; |        | $DBEA
    .byte $00 ; |        | $DBEB
    .byte $00 ; |        | $DBEC
    .byte $00 ; |        | $DBED
    .byte $00 ; |        | $DBEE
    .byte $00 ; |        | $DBEF
    .byte $00 ; |        | $DBF0
    .byte $00 ; |        | $DBF1
    .byte $00 ; |        | $DBF2
    .byte $00 ; |        | $DBF3

CalcRoughPosP1 SUBROUTINE
    sta    WSYNC              ; 3
;----------------------------------
    sta    HMOVE              ; 3
    sta    GRP0               ; 3
    lda    $86                ; 3
    sta.w  $86                ; 4     @13
LDBFF:
    dey                       ; 2
    bpl    LDBFF              ; 2³+1
    rts                       ; 6     @23 min, +6 each branch taken

ObjPtrsLoTab:
    .byte <Blank_and_Shared      ; $DC03
    .byte <TeeOffBox             ; $DC04
    .byte <TreeSm                ; $DC05
    .byte <TreeSm                ; $DC06
    .byte <TreeSm                ; $DC07
    .byte <TreeSm                ; $DC08
    .byte <TreeSm                ; $DC09
    .byte <TreeSm                ; $DC0A
    .byte <WaterTrapSm           ; $DC0B
    .byte <WaterTrapSm           ; $DC0C
    .byte <WaterTrapSm           ; $DC0D
    .byte <WaterTrapSm           ; $DC0E
    .byte <WaterTrapSm           ; $DC0F
    .byte <WaterTrapSm           ; $DC10
    .byte <SandTrapSm            ; $DC11
    .byte <SandTrapSm            ; $DC12
    .byte <SandTrapSm            ; $DC13
    .byte <SandTrapSm            ; $DC14
    .byte <SandTrapSm            ; $DC15
    .byte <SandTrapSm            ; $DC16
    .byte <TreeLg                ; $DC17
    .byte <WaterTrapLg           ; $DC18
    .byte <SandTrapLg            ; $DC19
    .byte <RoughGfx              ; $DC1A
    .byte <GreenGfx              ; $DC1B
    .byte <Blank_and_Shared      ; $DC1C
    .byte <Blank_and_Shared      ; $DC1D
    .byte <Blank_and_Shared      ; $DC1E
    .byte <Blank_and_Shared      ; $DC1F
    .byte <Blank_and_Shared      ; $DC20
    .byte <Blank_and_Shared      ; $DC21
    .byte <Blank_and_Shared      ; $DC22

ObjPtrsHiTab:
    .byte >Blank_and_Shared      ; $DC23
    .byte >TeeOffBox             ; $DC24
    .byte >TreeSm                ; $DC25
    .byte >TreeSm                ; $DC26
    .byte >TreeSm                ; $DC27
    .byte >TreeSm                ; $DC28
    .byte >TreeSm                ; $DC29
    .byte >TreeSm                ; $DC2A
    .byte >WaterTrapSm           ; $DC2B
    .byte >WaterTrapSm           ; $DC2C
    .byte >WaterTrapSm           ; $DC2D
    .byte >WaterTrapSm           ; $DC2E
    .byte >WaterTrapSm           ; $DC2F
    .byte >WaterTrapSm           ; $DC30
    .byte >SandTrapSm            ; $DC31
    .byte >SandTrapSm            ; $DC32
    .byte >SandTrapSm            ; $DC33
    .byte >SandTrapSm            ; $DC34
    .byte >SandTrapSm            ; $DC35
    .byte >SandTrapSm            ; $DC36
    .byte >TreeLg                ; $DC37
    .byte >WaterTrapLg           ; $DC38
    .byte >SandTrapLg            ; $DC39
    .byte >RoughGfx              ; $DC3A
    .byte >GreenGfx              ; $DC3B
    .byte >Blank_and_Shared      ; $DC3C
    .byte >Blank_and_Shared      ; $DC3D
    .byte >Blank_and_Shared      ; $DC3E
    .byte >Blank_and_Shared      ; $DC3F
    .byte >Blank_and_Shared      ; $DC40
    .byte >Blank_and_Shared      ; $DC41
    .byte >Blank_and_Shared      ; $DC42

ColObjPtrsLoTab:
    .byte <Blank_and_Shared      ; $DC43
    .byte <TeeOffBox_Col_Tab     ; $DC44
    .byte <TreeSm_Col_Tab        ; $DC45
    .byte <TreeSm_Col_Tab        ; $DC46
    .byte <TreeSm_Col_Tab        ; $DC47
    .byte <TreeSm_Col_Tab        ; $DC48
    .byte <TreeSm_Col_Tab        ; $DC49
    .byte <TreeSm_Col_Tab        ; $DC4A
    .byte <WaterTrapSm_Col_Tab   ; $DC4B
    .byte <WaterTrapSm_Col_Tab   ; $DC4C
    .byte <WaterTrapSm_Col_Tab   ; $DC4D
    .byte <WaterTrapSm_Col_Tab   ; $DC4E
    .byte <WaterTrapSm_Col_Tab   ; $DC4F
    .byte <WaterTrapSm_Col_Tab   ; $DC50
    .byte <SandTrapSm_Col_Tab    ; $DC51
    .byte <SandTrapSm_Col_Tab    ; $DC52
    .byte <SandTrapSm_Col_Tab    ; $DC53
    .byte <SandTrapSm_Col_Tab    ; $DC54
    .byte <SandTrapSm_Col_Tab    ; $DC55
    .byte <SandTrapSm_Col_Tab    ; $DC56
    .byte <TreeLg_Col_Tab        ; $DC57
    .byte <WaterTrapLg_Col_Tab   ; $DC58
    .byte <SandTrapLg_Col_Tab    ; $DC59
    .byte <RoughGfx_Col_Tab      ; $DC5A
    .byte <GreenGfx_Col_Tab      ; $DC5B
    .byte <Blank_and_Shared      ; $DC5C
    .byte <Blank_and_Shared      ; $DC5D
    .byte <Blank_and_Shared      ; $DC5E
    .byte <Blank_and_Shared      ; $DC5F
    .byte <Blank_and_Shared      ; $DC60
    .byte <Blank_and_Shared      ; $DC61
    .byte <Blank_and_Shared      ; $DC62

ColObjPtrsHiTab:
    .byte >Blank_and_Shared      ; $DC63
    .byte >TeeOffBox_Col_Tab     ; $DC64
    .byte >TreeSm_Col_Tab        ; $DC65
    .byte >TreeSm_Col_Tab        ; $DC66
    .byte >TreeSm_Col_Tab        ; $DC67
    .byte >TreeSm_Col_Tab        ; $DC68
    .byte >TreeSm_Col_Tab        ; $DC69
    .byte >TreeSm_Col_Tab        ; $DC6A
    .byte >WaterTrapSm_Col_Tab   ; $DC6B
    .byte >WaterTrapSm_Col_Tab   ; $DC6C
    .byte >WaterTrapSm_Col_Tab   ; $DC6D
    .byte >WaterTrapSm_Col_Tab   ; $DC6E
    .byte >WaterTrapSm_Col_Tab   ; $DC6F
    .byte >WaterTrapSm_Col_Tab   ; $DC70
    .byte >SandTrapSm_Col_Tab    ; $DC71
    .byte >SandTrapSm_Col_Tab    ; $DC72
    .byte >SandTrapSm_Col_Tab    ; $DC73
    .byte >SandTrapSm_Col_Tab    ; $DC74
    .byte >SandTrapSm_Col_Tab    ; $DC75
    .byte >SandTrapSm_Col_Tab    ; $DC76
    .byte >TreeLg_Col_Tab        ; $DC77
    .byte >WaterTrapLg_Col_Tab   ; $DC78
    .byte >SandTrapLg_Col_Tab    ; $DC79
    .byte >RoughGfx_Col_Tab      ; $DC7A
    .byte >GreenGfx_Col_Tab      ; $DC7B
    .byte >Blank_and_Shared      ; $DC7C
    .byte >Blank_and_Shared      ; $DC7D
    .byte >Blank_and_Shared      ; $DC7E
    .byte >Blank_and_Shared      ; $DC7F
    .byte >Blank_and_Shared      ; $DC80
    .byte >Blank_and_Shared      ; $DC81
    .byte >Blank_and_Shared      ; $DC82

NumSizPtrsLoTab:
    .byte <Blank_and_Shared      ; $DC83
    .byte <Blank_and_Shared      ; $DC84
    .byte <Blank_and_Shared      ; $DC85
    .byte <NuSz_2_Close_Tab      ; $DC86
    .byte <NuSz_2_Med_Tab        ; $DC87
    .byte <NuSz_3_Close_Tab      ; $DC88
    .byte <NuSz_2_Wide_Tab       ; $DC89
    .byte <NuSz_3_Med_Tab        ; $DC8A
    .byte <Blank_and_Shared      ; $DC8B
    .byte <NuSz_2_Close_Tab      ; $DC8C
    .byte <NuSz_2_Med_Tab        ; $DC8D
    .byte <NuSz_3_Close_Tab      ; $DC8E
    .byte <NuSz_2_Wide_Tab       ; $DC8F
    .byte <NuSz_3_Med_Tab        ; $DC90
    .byte <Blank_and_Shared      ; $DC91
    .byte <NuSz_2_Close_Tab      ; $DC92
    .byte <NuSz_2_Med_Tab        ; $DC93
    .byte <NuSz_3_Close_Tab      ; $DC94
    .byte <NuSz_2_Wide_Tab       ; $DC95
    .byte <NuSz_3_Med_Tab        ; $DC96
    .byte <TreeLg_HmSz_Tab       ; $DC97
    .byte <WaterTrapLg_HmSz_Tab  ; $DC98
    .byte <SandTrapLg_HmSz_Tab   ; $DC99
    .byte <RoughGfx_HmSz_Tab     ; $DC9A
    .byte <GreenGfx_HmSz_Tab     ; $DC9B
    .byte <Blank_and_Shared      ; $DC9C
    .byte <Blank_and_Shared      ; $DC9D
    .byte <Blank_and_Shared      ; $DC9E
    .byte <Blank_and_Shared      ; $DC9F
    .byte <Blank_and_Shared      ; $DCA0
    .byte <Blank_and_Shared      ; $DCA1
    .byte <Blank_and_Shared      ; $DCA2

NumSizHiPtrs_Tab:
    .byte >Blank_and_Shared      ; $DCA3
    .byte >Blank_and_Shared      ; $DCA4
    .byte >Blank_and_Shared      ; $DCA5
    .byte >NuSz_2_Close_Tab      ; $DCA6
    .byte >NuSz_2_Med_Tab        ; $DCA7
    .byte >NuSz_3_Close_Tab      ; $DCA8
    .byte >NuSz_2_Wide_Tab       ; $DCA9
    .byte >NuSz_3_Med_Tab        ; $DCAA
    .byte >Blank_and_Shared      ; $DCAB
    .byte >NuSz_2_Close_Tab      ; $DCAC
    .byte >NuSz_2_Med_Tab        ; $DCAD
    .byte >NuSz_3_Close_Tab      ; $DCAE
    .byte >NuSz_2_Wide_Tab       ; $DCAF
    .byte >NuSz_3_Med_Tab        ; $DCB0
    .byte >Blank_and_Shared      ; $DCB1
    .byte >NuSz_2_Close_Tab      ; $DCB2
    .byte >NuSz_2_Med_Tab        ; $DCB3
    .byte >NuSz_3_Close_Tab      ; $DCB4
    .byte >NuSz_2_Wide_Tab       ; $DCB5
    .byte >NuSz_3_Med_Tab        ; $DCB6
    .byte >TreeLg_HmSz_Tab       ; $DCB7
    .byte >WaterTrapLg_HmSz_Tab  ; $DCB8
    .byte >SandTrapLg_HmSz_Tab   ; $DCB9
    .byte >RoughGfx_HmSz_Tab     ; $DCBA
    .byte >GreenGfx_HmSz_Tab     ; $DCBB
    .byte >Blank_and_Shared      ; $DCBC
    .byte >Blank_and_Shared      ; $DCBD
    .byte >Blank_and_Shared      ; $DCBE
    .byte >Blank_and_Shared      ; $DCBF
    .byte >Blank_and_Shared      ; $DCC0
    .byte >Blank_and_Shared      ; $DCC1
    .byte >Blank_and_Shared      ; $DCC2

ColGroundLoPts_Tab:
    .byte <Grass_Col_Tab         ; $DCC3   0
    .byte <Grass_Col_Tab         ; $DCC4   1
    .byte <Grass_Col_Tab         ; $DCC5   2
    .byte <Grass_Col_Tab         ; $DCC6   3
    .byte <Grass_Col_Tab         ; $DCC7   4
    .byte <Grass_Col_Tab         ; $DCC8   5
    .byte <Grass_Col_Tab         ; $DCC9   6
    .byte <Grass_Col_Tab         ; $DCCA   7
    .byte <Grass_Col_Tab         ; $DCCB   8
    .byte <Grass_Col_Tab         ; $DCCC   9
    .byte <Grass_Col_Tab         ; $DCCD  10
    .byte <Grass_Col_Tab         ; $DCCE  11
    .byte <Grass_Col_Tab         ; $DCCF  12
    .byte <Grass_Col_Tab         ; $DCD0  13
    .byte <Grass_Col_Tab         ; $DCD1  14
    .byte <Grass_Col_Tab         ; $DCD2  15
    .byte <Grass_Col_Tab         ; $DCD3  16
    .byte <Grass_Col_Tab         ; $DCD4  17
    .byte <Grass_Col_Tab         ; $DCD5  18
    .byte <Grass_Col_Tab         ; $DCD6  19
    .byte <Grass_Col_Tab         ; $DCD7  20
    .byte <Grass_Col_Tab         ; $DCD8  21
    .byte <Grass_Col_Tab         ; $DCD9  22
    .byte <Grass_Col_Tab         ; $DCDA  23
    .byte <Grass_Col_Tab         ; $DCDB  24
    .byte <Stream_Col_Tab        ; $DCDC  25
    .byte <Grass_Col_Tab         ; $DCDD  26
    .byte <WideRiver_Col_Tab     ; $DCDE  27
    .byte <Grass_Col_Tab         ; $DCDF  28
    .byte <Grass_Col_Tab         ; $DCE0  29
    .byte <Grass_Col_Tab         ; $DCE1  30
    .byte <RiverEnd_Col_Tab      ; $DCE2  31

    .byte $00 ; |        | $DCE3   probably free bytes until next page begins...
    .byte $00 ; |        | $DCE4
    .byte $00 ; |        | $DCE5
    .byte $00 ; |        | $DCE6
    .byte $00 ; |        | $DCE7
    .byte $00 ; |        | $DCE8
    .byte $00 ; |        | $DCE9
    .byte $00 ; |        | $DCEA
    .byte $00 ; |        | $DCEB
    .byte $00 ; |        | $DCEC
    .byte $00 ; |        | $DCED
    .byte $00 ; |        | $DCEE
    .byte $00 ; |        | $DCEF
    .byte $00 ; |        | $DCF0
    .byte $00 ; |        | $DCF1
    .byte $00 ; |        | $DCF2
    .byte $00 ; |        | $DCF3
    .byte $00 ; |        | $DCF4
    .byte $00 ; |        | $DCF5
    .byte $00 ; |        | $DCF6
    .byte $00 ; |        | $DCF7
    .byte $00 ; |        | $DCF8
    .byte $00 ; |        | $DCF9
    .byte $00 ; |        | $DCFA
    .byte $00 ; |        | $DCFB
    .byte $00 ; |        | $DCFC
    .byte $00 ; |        | $DCFD
    .byte $00 ; |        | $DCFE
    .byte $00 ; |        | $DCFF

Plus_Sign:
    .byte $00 ; |        | $DD00
    .byte $18 ; |   XX   | $DD01
    .byte $18 ; |   XX   | $DD02
    .byte $18 ; |   XX   | $DD03
    .byte $7E ; | XXXXXX | $DD04
    .byte $18 ; |   XX   | $DD05
    .byte $18 ; |   XX   | $DD06
    .byte $18 ; |   XX   | $DD07
Minus_Sign:
    .byte $00 ; |        | $DD08
    .byte $00 ; |        | $DD09
    .byte $00 ; |        | $DD0A
    .byte $00 ; |        | $DD0B
    .byte $7E ; | XXXXXX | $DD0C
    .byte $00 ; |        | $DD0D
    .byte $00 ; |        | $DD0E
    .byte $00 ; |        | $DD0F

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      X  X X XXX X   X
;      X  X X X   X   X
;      X  X X X   X   X
;      X  X X XX  X X X
;      X  X X X   XXXXX
;       XX  X X   XX XX
;       XX  X XXX X   X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

View_1:
    .byte $00 ; |        | $DD10
    .byte $65 ; | XX  X X| $DD11
    .byte $65 ; | XX  X X| $DD12
    .byte $95 ; |X  X X X| $DD13
    .byte $95 ; |X  X X X| $DD14
    .byte $95 ; |X  X X X| $DD15
    .byte $95 ; |X  X X X| $DD16
    .byte $95 ; |X  X X X| $DD17
View_2:
    .byte $00 ; |        | $DD18
    .byte $D1 ; |XX X   X| $DD19
    .byte $1B ; |   XX XX| $DD1A
    .byte $1F ; |   XXXXX| $DD1B
    .byte $95 ; |X  X X X| $DD1C
    .byte $11 ; |   X   X| $DD1D
    .byte $11 ; |   X   X| $DD1E
    .byte $D1 ; |XX X   X| $DD1F

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SignPtr_Tab:
    .byte <Plus_Sign     ;  even par
    .byte <Minus_Sign    ;  under par
    .byte <Plus_Sign     ;  over par

WindDirGfx_Tab:
    .byte <Right_Arrow
    .byte <Left_Arrow
    .byte <Up_Arrow
    .byte <Down_Arrow

ClubLeftPtrs_Tab:
    .byte <One           ;  1 Wood
    .byte <Two           ;  2 Wood
    .byte <Three         ;  3 Wood
    .byte <Four          ;  4 Wood
    .byte <Five          ;  5 Wood
    .byte <One           ;  1 Iron
    .byte <Two           ;  2 Iron
    .byte <Three         ;  3 Iron
    .byte <Four          ;  4 Iron
    .byte <Five          ;  5 Iron
    .byte <Six           ;  6 Iron
    .byte <Seven         ;  7 Iron
    .byte <Eight         ;  8 Iron
    .byte <Nine          ;  9 Iron
    .byte <Letter_P      ;  Pitching Wedge
    .byte <Letter_S      ;  Sand Wedge
    .byte <Letter_P      ;  Putter

ClubRightPtrs_Tab:
    .byte <Letter_W      ;  1 Wood
    .byte <Letter_W      ;  2 Wood
    .byte <Letter_W      ;  3 Wood
    .byte <Letter_W      ;  4 Wood
    .byte <Letter_W      ;  5 Wood
    .byte <Letter_I      ;  1 Iron
    .byte <Letter_I      ;  2 Iron
    .byte <Letter_I      ;  3 Iron
    .byte <Letter_I      ;  4 Iron
    .byte <Letter_I      ;  5 Iron
    .byte <Letter_I      ;  6 Iron
    .byte <Letter_I      ;  7 Iron
    .byte <Letter_I      ;  8 Iron
    .byte <Letter_I      ;  9 Iron
    .byte <Letter_W      ;  Pitching Wedge
    .byte <Letter_W      ;  Sand Wedge
    .byte <Letter_T      ;  Putter

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      X   X X X     XX   XX  X    XXXX
;      XX XX X X    XXXX XXXX X    XXXX
;      XXXXX X X    X    X  X X    X
;      X X X  X     X XX X  X X    XXX
;      X   X  X     X  X X  X X    X
;      X   X  X     XXXX XXXX XXXX X
;      X   X  X      XX   XX  XXXX X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Title_1:
    .byte $00 ; |        | $DD49
    .byte $00 ; |        | $DD4A
    .byte $00 ; |        | $DD4B
    .byte $00 ; |        | $DD4C
    .byte $00 ; |        | $DD4D
    .byte $00 ; |        | $DD4E
    .byte $00 ; |        | $DD4F
    .byte $00 ; |        | $DD50
Title_2:
    .byte $00 ; |        | $DD51
    .byte $89 ; |X   X  X| $DD52
    .byte $89 ; |X   X  X| $DD53
    .byte $89 ; |X   X  X| $DD54
    .byte $A9 ; |X X X  X| $DD55
    .byte $FA ; |XXXXX X | $DD56
    .byte $DA ; |XX XX X | $DD57
    .byte $8A ; |X   X X | $DD58
Title_3:
    .byte $00 ; |        | $DD59
    .byte $03 ; |      XX| $DD5A
    .byte $07 ; |     XXX| $DD5B
    .byte $04 ; |     X  | $DD5C
    .byte $05 ; |     X X| $DD5D
    .byte $84 ; |X    X  | $DD5E
    .byte $87 ; |X    XXX| $DD5F
    .byte $83 ; |X     XX| $DD60
Title_4:
    .byte $00 ; |        | $DD61
    .byte $19 ; |   XX  X| $DD62
    .byte $BD ; |X XXXX X| $DD63
    .byte $A5 ; |X X  X X| $DD64
    .byte $A5 ; |X X  X X| $DD65
    .byte $25 ; |  X  X X| $DD66
    .byte $BD ; |X XXXX X| $DD67
    .byte $19 ; |   XX  X| $DD68
Title_5:
    .byte $00 ; |        | $DD69
    .byte $E8 ; |XXX X   | $DD6A
    .byte $E8 ; |XXX X   | $DD6B
    .byte $08 ; |    X   | $DD6C
    .byte $0E ; |    XXX | $DD6D
    .byte $08 ; |    X   | $DD6E
    .byte $0F ; |    XXXX| $DD6F
    .byte $0F ; |    XXXX| $DD70
Title_6:
    .byte $00 ; |        | $DD71
    .byte $00 ; |        | $DD72
    .byte $00 ; |        | $DD73
    .byte $00 ; |        | $DD74
    .byte $00 ; |        | $DD75
    .byte $00 ; |        | $DD76
    .byte $00 ; |        | $DD77
    .byte $00 ; |        | $DD78

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;        XX     X XXX XXX XXX   X X XXX XXX
;       X  X    X X X X X X X   X X X   X
;      X XX X   X X X X X X X   X X X   X
;      X X  X   X XXX XXX X X   XXX XX  XXX
;      X XX X   X   X   X X X   X X X     X
;       X  X    X   X   X X X   X X X     X
;        XX     X   X   X XXX   X X XXX XXX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Copyright_1:
    .byte $00 ; |        | $DD79
    .byte $00 ; |        | $DD7A
    .byte $01 ; |       X| $DD7B
    .byte $02 ; |      X | $DD7C
    .byte $02 ; |      X | $DD7D
    .byte $02 ; |      X | $DD7E
    .byte $01 ; |       X| $DD7F
    .byte $00 ; |        | $DD80
Copyright_2:
    .byte $00 ; |        | $DD81
    .byte $C1 ; |XX     X| $DD82
    .byte $21 ; |  X    X| $DD83
    .byte $D1 ; |XX X   X| $DD84
    .byte $91 ; |X  X   X| $DD85
    .byte $D1 ; |XX X   X| $DD86
    .byte $21 ; |  X    X| $DD87
    .byte $C1 ; |XX     X| $DD88
Copyright_3:
    .byte $00 ; |        | $DD89
    .byte $11 ; |   X   X| $DD8A
    .byte $11 ; |   X   X| $DD8B
    .byte $11 ; |   X   X| $DD8C
    .byte $77 ; | XXX XXX| $DD8D
    .byte $55 ; | X X X X| $DD8E
    .byte $55 ; | X X X X| $DD8F
    .byte $77 ; | XXX XXX| $DD90
Copyright_4:
    .byte $00 ; |        | $DD91
    .byte $71 ; | XXX   X| $DD92
    .byte $51 ; | X X   X| $DD93
    .byte $51 ; | X X   X| $DD94
    .byte $51 ; | X X   X| $DD95
    .byte $51 ; | X X   X| $DD96
    .byte $51 ; | X X   X| $DD97
    .byte $71 ; | XXX   X| $DD98
Copyright_5:
    .byte $00 ; |        | $DD99
    .byte $5D ; | X XXX X| $DD9A
    .byte $50 ; | X X    | $DD9B
    .byte $50 ; | X X    | $DD9C
    .byte $D9 ; |XX XX  X| $DD9D
    .byte $51 ; | X X   X| $DD9E
    .byte $51 ; | X X   X| $DD9F
    .byte $5D ; | X XXX X| $DDA0
Copyright_6:
    .byte $00 ; |        | $DDA1
    .byte $C0 ; |XX      | $DDA2
    .byte $40 ; | X      | $DDA3
    .byte $40 ; | X      | $DDA4
    .byte $C0 ; |XX      | $DDA5
    .byte $00 ; |        | $DDA6
    .byte $00 ; |        | $DDA7
    .byte $C0 ; |XX      | $DDA8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TitlePtrs_Tab:
    .word  Title_6       ; $DDA9
    .word  Title_5       ; $DDAB
    .word  Title_4       ; $DDAD
    .word  Title_3       ; $DDAF
    .word  Title_2       ; $DDB1
    .word  Title_1       ; $DDB3

CopyrightPtrs_Tab:
    .word  Copyright_6   ; $DDB5
    .word  Copyright_5   ; $DDB7
    .word  Copyright_4   ; $DDB9
    .word  Copyright_3   ; $DDBB
    .word  Copyright_2   ; $DDBD
    .word  Copyright_1   ; $DDBF

    .byte $00 ; |        | $DDC1   probably free bytes until next page begins...
    .byte $00 ; |        | $DDC2
    .byte $00 ; |        | $DDC3
    .byte $00 ; |        | $DDC4
    .byte $00 ; |        | $DDC5
    .byte $00 ; |        | $DDC6
    .byte $00 ; |        | $DDC7
    .byte $00 ; |        | $DDC8
    .byte $00 ; |        | $DDC9
    .byte $00 ; |        | $DDCA
    .byte $00 ; |        | $DDCB
    .byte $00 ; |        | $DDCC
    .byte $00 ; |        | $DDCD
    .byte $00 ; |        | $DDCE
    .byte $00 ; |        | $DDCF
    .byte $00 ; |        | $DDD0
    .byte $00 ; |        | $DDD1
    .byte $00 ; |        | $DDD2
    .byte $00 ; |        | $DDD3
    .byte $00 ; |        | $DDD4
    .byte $00 ; |        | $DDD5
    .byte $00 ; |        | $DDD6
    .byte $00 ; |        | $DDD7
    .byte $00 ; |        | $DDD8
    .byte $00 ; |        | $DDD9
    .byte $00 ; |        | $DDDA
    .byte $00 ; |        | $DDDB
    .byte $00 ; |        | $DDDC
    .byte $00 ; |        | $DDDD
    .byte $00 ; |        | $DDDE
    .byte $00 ; |        | $DDDF
    .byte $00 ; |        | $DDE0
    .byte $00 ; |        | $DDE1
    .byte $00 ; |        | $DDE2
    .byte $00 ; |        | $DDE3
    .byte $00 ; |        | $DDE4
    .byte $00 ; |        | $DDE5
    .byte $00 ; |        | $DDE6
    .byte $00 ; |        | $DDE7
    .byte $00 ; |        | $DDE8
    .byte $00 ; |        | $DDE9
    .byte $00 ; |        | $DDEA
    .byte $00 ; |        | $DDEB
    .byte $00 ; |        | $DDEC
    .byte $00 ; |        | $DDED
    .byte $00 ; |        | $DDEE
    .byte $00 ; |        | $DDEF
    .byte $00 ; |        | $DDF0
    .byte $00 ; |        | $DDF1
    .byte $00 ; |        | $DDF2
    .byte $00 ; |        | $DDF3
    .byte $00 ; |        | $DDF4
    .byte $00 ; |        | $DDF5
    .byte $00 ; |        | $DDF6
    .byte $00 ; |        | $DDF7
    .byte $00 ; |        | $DDF8
    .byte $00 ; |        | $DDF9
    .byte $00 ; |        | $DDFA
    .byte $00 ; |        | $DDFB
    .byte $00 ; |        | $DDFC
    .byte $00 ; |        | $DDFD
    .byte $00 ; |        | $DDFE
    .byte $00 ; |        | $DDFF
Zero:
    .byte $00 ; |        | $DE00
    .byte $3C ; |  XXXX  | $DE01
    .byte $66 ; | XX  XX | $DE02
    .byte $66 ; | XX  XX | $DE03
    .byte $66 ; | XX  XX | $DE04
    .byte $66 ; | XX  XX | $DE05
    .byte $66 ; | XX  XX | $DE06
    .byte $3C ; |  XXXX  | $DE07
One:
    .byte $00 ; |        | $DE08
    .byte $3C ; |  XXXX  | $DE09
    .byte $18 ; |   XX   | $DE0A
    .byte $18 ; |   XX   | $DE0B
    .byte $18 ; |   XX   | $DE0C
    .byte $18 ; |   XX   | $DE0D
    .byte $38 ; |  XXX   | $DE0E
    .byte $18 ; |   XX   | $DE0F
Two:
    .byte $00 ; |        | $DE10
    .byte $7E ; | XXXXXX | $DE11
    .byte $60 ; | XX     | $DE12
    .byte $60 ; | XX     | $DE13
    .byte $3C ; |  XXXX  | $DE14
    .byte $06 ; |     XX | $DE15
    .byte $46 ; | X   XX | $DE16
    .byte $3C ; |  XXXX  | $DE17
Three:
    .byte $00 ; |        | $DE18
    .byte $3C ; |  XXXX  | $DE19
    .byte $46 ; | X   XX | $DE1A
    .byte $06 ; |     XX | $DE1B
    .byte $0C ; |    XX  | $DE1C
    .byte $06 ; |     XX | $DE1D
    .byte $46 ; | X   XX | $DE1E
    .byte $3C ; |  XXXX  | $DE1F
Four:
    .byte $00 ; |        | $DE20
    .byte $0C ; |    XX  | $DE21
    .byte $0C ; |    XX  | $DE22
    .byte $7E ; | XXXXXX | $DE23
    .byte $4C ; | X  XX  | $DE24
    .byte $2C ; |  X XX  | $DE25
    .byte $1C ; |   XXX  | $DE26
    .byte $0C ; |    XX  | $DE27
Five:
    .byte $00 ; |        | $DE28
    .byte $7C ; | XXXXX  | $DE29
    .byte $46 ; | X   XX | $DE2A
    .byte $06 ; |     XX | $DE2B
    .byte $7C ; | XXXXX  | $DE2C
    .byte $60 ; | XX     | $DE2D
    .byte $60 ; | XX     | $DE2E
    .byte $7E ; | XXXXXX | $DE2F
Six:
    .byte $00 ; |        | $DE30
    .byte $3C ; |  XXXX  | $DE31
    .byte $66 ; | XX  XX | $DE32
    .byte $66 ; | XX  XX | $DE33
    .byte $7C ; | XXXXX  | $DE34
    .byte $60 ; | XX     | $DE35
    .byte $62 ; | XX   X | $DE36
    .byte $3C ; |  XXXX  | $DE37
Seven:
    .byte $00 ; |        | $DE38
    .byte $18 ; |   XX   | $DE39
    .byte $18 ; |   XX   | $DE3A
    .byte $18 ; |   XX   | $DE3B
    .byte $0C ; |    XX  | $DE3C
    .byte $06 ; |     XX | $DE3D
    .byte $42 ; | X    X | $DE3E
    .byte $7E ; | XXXXXX | $DE3F
Eight:
    .byte $00 ; |        | $DE40
    .byte $3C ; |  XXXX  | $DE41
    .byte $66 ; | XX  XX | $DE42
    .byte $66 ; | XX  XX | $DE43
    .byte $3C ; |  XXXX  | $DE44
    .byte $66 ; | XX  XX | $DE45
    .byte $66 ; | XX  XX | $DE46
    .byte $3C ; |  XXXX  | $DE47
Nine:
    .byte $00 ; |        | $DE48
    .byte $3C ; |  XXXX  | $DE49
    .byte $46 ; | X   XX | $DE4A
    .byte $06 ; |     XX | $DE4B
    .byte $3E ; |  XXXXX | $DE4C
    .byte $66 ; | XX  XX | $DE4D
    .byte $66 ; | XX  XX | $DE4E
    .byte $3C ; |  XXXX  | $DE4F
Blank_Digit:
    .byte $00 ; |        | $DE50
    .byte $00 ; |        | $DE51
    .byte $00 ; |        | $DE52
    .byte $00 ; |        | $DE53
    .byte $00 ; |        | $DE54
    .byte $00 ; |        | $DE55
    .byte $00 ; |        | $DE56
    .byte $00 ; |        | $DE57

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      X X     X
;      X X     X
;      X X  X  X  X
;      XXX X X X X X
;      X X X X X XXX
;      X X X X X X
;      X X  X  X  XX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Hole_1:
    .byte $00 ; |        | $DE58
    .byte $A4 ; |X X  X  | $DE59
    .byte $AA ; |X X X X | $DE5A
    .byte $AA ; |X X X X | $DE5B
    .byte $EA ; |XXX X X | $DE5C
    .byte $A4 ; |X X  X  | $DE5D
    .byte $A0 ; |X X     | $DE5E
    .byte $A0 ; |X X     | $DE5F
Hole_2:
    .byte $00 ; |        | $DE60
    .byte $98 ; |X  XX   | $DE61
    .byte $A0 ; |X X     | $DE62
    .byte $B8 ; |X XXX   | $DE63
    .byte $A8 ; |X X X   | $DE64
    .byte $90 ; |X  X    | $DE65
    .byte $80 ; |X       | $DE66
    .byte $80 ; |X       | $DE67

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      XX
;      X X
;      X X
;      XX X   X
;      X X X X
;      X XXX X
;      X X X X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Par:
    .byte $00 ; |        | $DE68
    .byte $AA ; |X X X X | $DE69
    .byte $BA ; |X XXX X | $DE6A
    .byte $AA ; |X X X X | $DE6B
    .byte $D1 ; |XX X   X| $DE6C
    .byte $A0 ; |X X     | $DE6D
    .byte $A0 ; |X X     | $DE6E
    .byte $C0 ; |XX      | $DE6F

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      X X       X
;      X X       X
;      X X X X  XX  XX
;       X  XX  X X X
;       X  X   X X  X
;       X  X   X X   X
;       X  X    XX XX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Yards_1:
    .byte $00 ; |        | $DE70
    .byte $48 ; | X  X   | $DE71
    .byte $48 ; | X  X   | $DE72
    .byte $48 ; | X  X   | $DE73
    .byte $4C ; | X  XX  | $DE74
    .byte $AA ; |X X X X | $DE75
    .byte $A0 ; |X X     | $DE76
    .byte $A0 ; |X X     | $DE77
Yards_2:
    .byte $00 ; |        | $DE78
    .byte $6C ; | XX XX  | $DE79
    .byte $A2 ; |X X   X | $DE7A
    .byte $A4 ; |X X  X  | $DE7B
    .byte $A8 ; |X X X   | $DE7C
    .byte $66 ; | XX  XX | $DE7D
    .byte $20 ; |  X     | $DE7E
    .byte $20 ; |  X     | $DE7F

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;       X  X     X
;      X X X     X
;      X   X X X XX
;      X   X X X X X
;      X   X X X X X
;      X X X X X X X
;       X  X  X  XX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Club_1:
    .byte $00 ; |        | $DE80
    .byte $49 ; | X  X  X| $DE81
    .byte $AA ; |X X X X | $DE82
    .byte $8A ; |X   X X | $DE83
    .byte $8A ; |X   X X | $DE84
    .byte $8A ; |X   X X | $DE85
    .byte $A8 ; |X X X   | $DE86
    .byte $48 ; | X  X   | $DE87
Club_2:
    .byte $00 ; |        | $DE88
    .byte $30 ; |  XX    | $DE89
    .byte $A8 ; |X X X   | $DE8A
    .byte $A8 ; |X X X   | $DE8B
    .byte $A8 ; |X X X   | $DE8C
    .byte $B0 ; |X XX    | $DE8D
    .byte $20 ; |  X     | $DE8E
    .byte $20 ; |  X     | $DE8F

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;       X
;      X X
;      X    X   X  X X  X
;       X  X X X X XX  X X
;        X X   X X X   XXX
;      X X X X X X X   X
;       X   X   X  X    XX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Score_1:
    .byte $00 ; |        | $DE90
    .byte $44 ; | X   X  | $DE91
    .byte $AA ; |X X X X | $DE92
    .byte $28 ; |  X X   | $DE93
    .byte $4A ; | X  X X | $DE94
    .byte $84 ; |X    X  | $DE95
    .byte $A0 ; |X X     | $DE96
    .byte $40 ; | X      | $DE97
Score_2:
    .byte $00 ; |        | $DE98
    .byte $48 ; | X  X   | $DE99
    .byte $A8 ; |X X X   | $DE9A
    .byte $A8 ; |X X X   | $DE9B
    .byte $AC ; |X X XX  | $DE9C
    .byte $4A ; | X  X X | $DE9D
    .byte $00 ; |        | $DE9E
    .byte $00 ; |        | $DE9F
Score_3:
    .byte $00 ; |        | $DEA0
    .byte $60 ; | XX     | $DEA1
    .byte $80 ; |X       | $DEA2
    .byte $E0 ; |XXX     | $DEA3
    .byte $A0 ; |X X     | $DEA4
    .byte $40 ; | X      | $DEA5
    .byte $00 ; |        | $DEA6
    .byte $00 ; |        | $DEA7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;       X   X
;      X X  X
;      X   XXX
;       X   X
;        X  X
;      X X  X
;       X    X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Strokes:
    .byte $00 ; |        | $DEA8
    .byte $42 ; | X    X | $DEA9
    .byte $A4 ; |X X  X  | $DEAA
    .byte $24 ; |  X  X  | $DEAB
    .byte $44 ; | X   X  | $DEAC
    .byte $8E ; |X   XXX | $DEAD
    .byte $A4 ; |X X  X  | $DEAE
    .byte $44 ; | X   X  | $DEAF

Right_Arrow:
    .byte $00 ; |        | $DEB0
    .byte $00 ; |        | $DEB1
    .byte $08 ; |    X   | $DEB2
    .byte $04 ; |     X  | $DEB3
    .byte $7E ; | XXXXXX | $DEB4
    .byte $04 ; |     X  | $DEB5
    .byte $08 ; |    X   | $DEB6
    .byte $00 ; |        | $DEB7
Left_Arrow:
    .byte $00 ; |        | $DEB8
    .byte $00 ; |        | $DEB9
    .byte $10 ; |   X    | $DEBA
    .byte $20 ; |  X     | $DEBB
    .byte $7E ; | XXXXXX | $DEBC
    .byte $20 ; |  X     | $DEBD
    .byte $10 ; |   X    | $DEBE
    .byte $00 ; |        | $DEBF
Up_Arrow:
    .byte $00 ; |        | $DEC0
    .byte $08 ; |    X   | $DEC1
    .byte $08 ; |    X   | $DEC2
    .byte $08 ; |    X   | $DEC3
    .byte $2A ; |  X X X | $DEC4
    .byte $1C ; |   XXX  | $DEC5
    .byte $08 ; |    X   | $DEC6
    .byte $00 ; |        | $DEC7
Down_Arrow:
    .byte $00 ; |        | $DEC8
    .byte $08 ; |    X   | $DEC9
    .byte $1C ; |   XXX  | $DECA
    .byte $2A ; |  X X X | $DECB
    .byte $08 ; |    X   | $DECC
    .byte $08 ; |    X   | $DECD
    .byte $08 ; |    X   | $DECE
    .byte $00 ; |        | $DECF
Letter_I:
    .byte $00 ; |        | $DED0
    .byte $3C ; |  XXXX  | $DED1
    .byte $18 ; |   XX   | $DED2
    .byte $18 ; |   XX   | $DED3
    .byte $18 ; |   XX   | $DED4
    .byte $18 ; |   XX   | $DED5
    .byte $18 ; |   XX   | $DED6
    .byte $3C ; |  XXXX  | $DED7
Letter_W:
    .byte $00 ; |        | $DED8
    .byte $C6 ; |XX   XX | $DED9
    .byte $EE ; |XXX XXX | $DEDA
    .byte $FE ; |XXXXXXX | $DEDB
    .byte $D6 ; |XX X XX | $DEDC
    .byte $C6 ; |XX   XX | $DEDD
    .byte $C6 ; |XX   XX | $DEDE
    .byte $C6 ; |XX   XX | $DEDF
Letter_P:
    .byte $00 ; |        | $DEE0
    .byte $60 ; | XX     | $DEE1
    .byte $60 ; | XX     | $DEE2
    .byte $7C ; | XXXXX  | $DEE3
    .byte $66 ; | XX  XX | $DEE4
    .byte $66 ; | XX  XX | $DEE5
    .byte $66 ; | XX  XX | $DEE6
    .byte $7C ; | XXXXX  | $DEE7
Letter_T:
    .byte $00 ; |        | $DEE8
    .byte $18 ; |   XX   | $DEE9
    .byte $18 ; |   XX   | $DEEA
    .byte $18 ; |   XX   | $DEEB
    .byte $18 ; |   XX   | $DEEC
    .byte $18 ; |   XX   | $DEED
    .byte $18 ; |   XX   | $DEEE
    .byte $7E ; | XXXXXX | $DEEF
Letter_S:
    .byte $00 ; |        | $DEF0
    .byte $78 ; | XXXX   | $DEF1
    .byte $8C ; |X   XX  | $DEF2
    .byte $0C ; |    XX  | $DEF3
    .byte $78 ; | XXXX   | $DEF4
    .byte $C0 ; |XX      | $DEF5
    .byte $C4 ; |XX   X  | $DEF6
    .byte $78 ; | XXXX   | $DEF7

    .byte $00 ; |        | $DEF8   probably free bytes until next page begins...
    .byte $00 ; |        | $DEF9
    .byte $00 ; |        | $DEFA
    .byte $00 ; |        | $DEFB
    .byte $00 ; |        | $DEFC
    .byte $00 ; |        | $DEFD
    .byte $00 ; |        | $DEFE
    .byte $00 ; |        | $DEFF

;-------------------------------------

Draw_6_Byte_Display  SUBROUTINE
    lda    #7                    ; 2   height for display
    sta    displayLine           ; 3
.loopDisplay:
    ldy    displayLine           ; 3
    lda    (dispOne),Y           ; 5
    sta    GRP0                  ; 3  @16
    lda    waste3cycles          ; 3
    sta    HMOVE                 ; 3  @22
    lda    (dispFive),Y          ; 5
    sta    temp1                 ; 3
    lda    (dispFour),Y          ; 5
    tax                          ; 2
    lda    (dispTwo),Y           ; 5
    sta    GRP1                  ; 3  @44
    lda    (dispThree),Y         ; 5
    sta    GRP0                  ; 3  @52
    lda    (dispSix),Y           ; 5
    ldy    temp1                 ; 3
    stx    GRP1                  ; 3  @63
    sty    GRP0                  ; 3  @66
    sta    GRP1                  ; 3  @69
    sta    GRP0                  ; 3  @72
    dec    displayLine           ; 5
    bpl    .loopDisplay          ; 2³
Waste12cycles_B:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      POWER BAR GRAPHICS AND COLORS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Left_PB_Gfx:
    .byte $00 ; |        | $DF2E
    .byte $04 ; |     X  | $DF2F
    .byte $0C ; |    XX  | $DF30
    .byte $1C ; |   XXX  | $DF31
    .byte $3C ; |  XXXX  | $DF32
    .byte $7C ; | XXXXX  | $DF33
    .byte $FC ; |XXXXXX  | $DF34
    .byte $FC ; |XXXXXX  | $DF35
    .byte $FC ; |XXXXXX  | $DF36
    .byte $FC ; |XXXXXX  | $DF37
    .byte $FC ; |XXXXXX  | $DF38
    .byte $FC ; |XXXXXX  | $DF39
    .byte $FC ; |XXXXXX  | $DF3A

Right_PB_Gfx:
    .byte $00 ; |        | $DF3B
    .byte $00 ; |        | $DF3C
    .byte $00 ; |        | $DF3D
    .byte $00 ; |        | $DF3E
    .byte $00 ; |        | $DF3F
    .byte $00 ; |        | $DF40
    .byte $00 ; |        | $DF41
    .byte $80 ; |X       | $DF42
    .byte $C0 ; |XX      | $DF43
    .byte $E0 ; |XXX     | $DF44
    .byte $F0 ; |XXXX    | $DF45
    .byte $F8 ; |XXXXX   | $DF46
    .byte $FC ; |XXXXXX  | $DF47

PowerBar_Dots:
    .byte $40 ; | X      | $DF48
    .byte $00 ; |        | $DF49
    .byte $00 ; |        | $DF4A
    .byte $00 ; |        | $DF4B
    .byte $40 ; | X      | $DF4C

PowerBar_Col_Tab:
    .byte PURPLE
    .byte PURPLE+2
    .byte PURPLE+2
    .byte PURPLE+2
    .byte PURPLE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LeftGfxPtrs_Tab:
;these pointers are used to sequence the Golfer's gfx.
    .word  Drive_1a      ;  - start position for driving -
    .word  Drive_2a      ;  move club away from the ball
    .word  Drive_3a      ;  move club farther away...
    .word  Drive_4a      ;  get to this position, pause and wait for the fire button
    .word  Drive_3a      ;  then move back towards ball
    .word  Drive_2a      ;  move closer
    .word  Drive_1a      ;  touch the ball
    .word  Drive_5a      ;  here starts the new sequence for the follow through
    .word  Drive_6a      ;  follow through
    .word  Drive_7a      ;  complete the follow through
    .word  Putt_1a       ;  - start postion for putting -
    .word  Putt_2a       ;  move putter away from the ball, pause and wait for the fire button
    .word  Putt_1a       ;  move putter towards the ball
    .word  Putt_3a       ;  follow through

RightGfxPtrs_Tab:
;these pointers align with their "a" counterparts,
;to draw the 2nd half of the golfer (the right side).
    .word  Drive_1b
    .word  Drive_2b
    .word  Drive_3b
    .word  Drive_4b
    .word  Drive_3b
    .word  Drive_2b
    .word  Drive_1b
    .word  Drive_5b
    .word  Drive_6b
    .word  Drive_7b
    .word  Putt_1b
    .word  Putt_2b
    .word  Putt_1b
    .word  Putt_3b

    .byte $00 ; |        | $DF8A   probably free bytes until $DFE0...
    .byte $00 ; |        | $DF8B
    .byte $00 ; |        | $DF8C
    .byte $00 ; |        | $DF8D
    .byte $00 ; |        | $DF8E
    .byte $00 ; |        | $DF8F
    .byte $00 ; |        | $DF90
    .byte $00 ; |        | $DF91
    .byte $00 ; |        | $DF92
    .byte $00 ; |        | $DF93
    .byte $00 ; |        | $DF94
    .byte $00 ; |        | $DF95
    .byte $00 ; |        | $DF96
    .byte $00 ; |        | $DF97
    .byte $00 ; |        | $DF98
    .byte $00 ; |        | $DF99
    .byte $00 ; |        | $DF9A
    .byte $00 ; |        | $DF9B
    .byte $00 ; |        | $DF9C
    .byte $00 ; |        | $DF9D
    .byte $00 ; |        | $DF9E
    .byte $00 ; |        | $DF9F
    .byte $00 ; |        | $DFA0
    .byte $00 ; |        | $DFA1
    .byte $00 ; |        | $DFA2
    .byte $00 ; |        | $DFA3
    .byte $00 ; |        | $DFA4
    .byte $00 ; |        | $DFA5
    .byte $00 ; |        | $DFA6
    .byte $00 ; |        | $DFA7
    .byte $00 ; |        | $DFA8
    .byte $00 ; |        | $DFA9
    .byte $00 ; |        | $DFAA
    .byte $00 ; |        | $DFAB
    .byte $00 ; |        | $DFAC
    .byte $00 ; |        | $DFAD
    .byte $00 ; |        | $DFAE
    .byte $00 ; |        | $DFAF
    .byte $00 ; |        | $DFB0
    .byte $00 ; |        | $DFB1
    .byte $00 ; |        | $DFB2
    .byte $00 ; |        | $DFB3
    .byte $00 ; |        | $DFB4
    .byte $00 ; |        | $DFB5
    .byte $00 ; |        | $DFB6
    .byte $00 ; |        | $DFB7
    .byte $00 ; |        | $DFB8
    .byte $00 ; |        | $DFB9
    .byte $00 ; |        | $DFBA
    .byte $00 ; |        | $DFBB
    .byte $00 ; |        | $DFBC
    .byte $00 ; |        | $DFBD
    .byte $00 ; |        | $DFBE
    .byte $00 ; |        | $DFBF
    .byte $00 ; |        | $DFC0
    .byte $00 ; |        | $DFC1
    .byte $00 ; |        | $DFC2
    .byte $00 ; |        | $DFC3
    .byte $00 ; |        | $DFC4
    .byte $00 ; |        | $DFC5
    .byte $00 ; |        | $DFC6
    .byte $00 ; |        | $DFC7
    .byte $00 ; |        | $DFC8
    .byte $00 ; |        | $DFC9
    .byte $00 ; |        | $DFCA
    .byte $00 ; |        | $DFCB
    .byte $00 ; |        | $DFCC
    .byte $00 ; |        | $DFCD
    .byte $00 ; |        | $DFCE
    .byte $00 ; |        | $DFCF
    .byte $00 ; |        | $DFD0
    .byte $00 ; |        | $DFD1
    .byte $00 ; |        | $DFD2
    .byte $00 ; |        | $DFD3
    .byte $00 ; |        | $DFD4
    .byte $00 ; |        | $DFD5
    .byte $00 ; |        | $DFD6
    .byte $00 ; |        | $DFD7
    .byte $00 ; |        | $DFD8
    .byte $00 ; |        | $DFD9
    .byte $00 ; |        | $DFDA
    .byte $00 ; |        | $DFDB
    .byte $00 ; |        | $DFDC
    .byte $00 ; |        | $DFDD
    .byte $00 ; |        | $DFDE
    .byte $00 ; |        | $DFDF

LDFE0:
    bit    LFFF8                 ; 4
    jmp    LD004                 ; 3
LDFE6:
    bit    LFFF9                 ; 4
    jmp    LF037                 ; 3

    .byte $00 ; |        | $DFEC
    .byte $00 ; |        | $DFED
    .byte $00 ; |        | $DFEE
    .byte $00 ; |        | $DFEF
    .byte $00 ; |        | $DFF0
    .byte $00 ; |        | $DFF1
    .byte $00 ; |        | $DFF2
    .byte $00 ; |        | $DFF3
    .byte $00 ; |        | $DFF4
    .byte $00 ; |        | $DFF5
    .byte $00 ; |        | $DFF6
    .byte $00 ; |        | $DFF7
LDFF8:
    .byte $00 ; |        | $DFF8


LDFF9:
  IF ORIGINAL
    .byte $FF ; |XXXXXXXX| $DFF9
  ELSE ALTERNATE
    .byte $00 ; |        | $DFF9
 ENDIF


       org $DFFA

    .word START,START,START

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SECOND BANK
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


       rorg $F000

START:
    cli                          ; 2
    bit    LFFF9                 ; 4

LF004:
    cld                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    inx                          ; 2
    txa                          ; 2
.loopClear:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    .loopClear            ; 2³

;=====================================

  IF ORIGINAL
    lda    #BALL_4_CLOCKS | REFLECT
    sta    CTRLPF
    lda    #DO_TITLE_SCREEN
    sta    screenFlag

  ELSE ALTERNATE
    lda    #DO_TITLE_SCREEN
    sta    screenFlag
    lda    #BALL_4_CLOCKS | REFLECT
    sta    CTRLPF
 ENDIF

;=====================================
    lda    #$C1                  ; 2
    sta    $87                   ; 3
    lda    #3                    ; 2   comparision for reset and select not being used...
    sta    resetSelectFlag       ; 3
    lda    #0                    ; 2
    sta    holeNumber            ; 3
    jsr    LF8B2                 ; 6
    jmp    LF037                 ; 3


.clearUserRam:
    lda    #0                    ; 2
    ldx    #$83                  ; 2   number of players, reset/select flag left untouched
.loopClear2:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    .loopClear2           ; 2³

    jsr    LF8B2                 ; 6
    dec    $DB                   ; 5
LF037:
    lda    $87                   ; 3
    and    #$40                  ; 2
    beq    LF043                 ; 2³
    lda    INPT4                 ; 3
    and    INPT5                 ; 3
    bpl    .clearUserRam         ; 2³  - if either fire button is pressed
LF043:
    lda    SWCHB                 ; 4
    and    #$03                  ; 2   check select and reset switches
    cmp    resetSelectFlag       ; 3
    sta    resetSelectFlag       ; 3   save current state (what switch is being used/unused)
    beq    .waitOverscan         ; 2³  - if no change
    lsr                          ; 2
    bcc    .clearUserRam         ; 2³  - if reset switch been used
    lsr                          ; 2
    bcs    .waitOverscan         ; 2³  - if select switch NOT being used
;when select is hit
    lda    #DO_GAME_SCREEN       ; 2
    sta    screenFlag            ; 3
    lda    $87                   ; 3
    and    #$01                  ; 2
    ora    #$C0                  ; 2
    sta    $87                   ; 3   $C1 OR $C0
    lsr                          ; 2   test bit 0
    bcs    LF06D                 ; 2³  if it is set toggle the players
    lda    #$C1                  ; 2
    sta    $87                   ; 3
    lda    numOfPlayers          ; 3
    eor    #$01                  ; 2   toggle number of players
    sta    numOfPlayers          ; 3
LF06D:
    lda    #0                    ; 2
    sta    displayFlag           ; 3
    lda    numOfPlayers          ; 3
    eor    #$01                  ; 2
    sta    numOfPlayers          ; 3
    bpl    .waitOverscan         ; 2³
.waitOverscan:
    ldy    INTIM                 ; 4   wait for overscan to end
    bne    .waitOverscan         ; 2³

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      VERTICAL BLANK TIME
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    lda    #$82                  ; 2
    sta    WSYNC                 ; 3
    sta    VSYNC                 ; 3   start vertical sync
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    VSYNC                 ; 3
    lda    #TIME_VBLANK          ; 2
    sta    WSYNC                 ; 3
    sta    TIM64T                ; 4
    inc    frameCounter          ; 5
    bne    LF0AE                 ; 2³
    lda    $87                   ; 3
    and    #$20                  ; 2
    beq    LF0AE                 ; 2³
    lda    $87                   ; 3
    ora    #$C0                  ; 2
    sta    $87                   ; 3
    lda    oneOrZero             ; 3
    clc                          ; 2
    adc    numOfPlayers          ; 3
    and    #$01                  ; 2
    sta    oneOrZero             ; 3   never more then 1
LF0AE:
    ldx    oneOrZero             ; 3   
    lda    onTheGreenFlag,X      ; 4   are we on the green?
    beq    LF0D2                 ; 2³  - no, take branch
    lda    collisionFlag         ; 3   - yes, check if we hit the edge
    and    #$40                  ; 2
    bne    LF0D2                 ; 2³
    lda    ball_Horz,X           ; 4
    cmp    #$48                  ; 2
    bcs    LF0C4                 ; 2³
    inc    ball_Horz,X           ; 6
    inc    ball_Horz,X           ; 6
LF0C4:
    dec    ball_Horz,X           ; 6
    lda    ball_Vert,X           ; 4
    cmp    #$40                  ; 2
    bcs    LF0D0                 ; 2³
    inc    ball_Vert,X           ; 6
    inc    ball_Vert,X           ; 6
LF0D0:
    dec    ball_Vert,X           ; 6
LF0D2:
    lda    #0                    ; 2
    sta    upDownAudioFlag       ; 3
    lda    $87                   ; 3
    and    #$C0                  ; 2
    cmp    #$80                  ; 2
    bne    LF0E1                 ; 2³
LF0DE:
    jmp    LF174                 ; 3

LF0E1:
    ldy    oneOrZero             ; 3
    lda.wy INPT4,Y               ; 4
    bpl    LF0EE                 ; 2³
    lda    #0                    ; 2
    sta    $DB                   ; 3
    beq    LF0DE                 ; 3   always branch

LF0EE:
    lda    $DB                   ; 3
    bne    LF0DE                 ; 2³
    dec    $DB                   ; 5
    lda    displayFlag           ; 3
    bne    LF109                 ; 2³
    lda.wy playerClubs,Y         ; 4
    ldx    onTheGreenFlag,Y      ; 4   are we on the green?
    beq    LF101                 ; 2³  - no, take branch
    lda    #PUTTER               ; 2   - yes, so use the putter
LF101:
    sta    clubsOrView           ; 3
    inc    upDownAudioFlag       ; 5
    inc    displayFlag           ; 5
    bne    LF174                 ; 2³

LF109:
    cmp    #3                    ; 2
    bcs    LF11C                 ; 2³
    inc    upDownAudioFlag       ; 5
    lda.wy screenNumber,Y        ; 4
    sta    $C8                   ; 3
    lda    displayFlag           ; 3
    ora    #ADD_HILIGHT          ; 2
    sta    displayFlag           ; 3
    bne    LF174                 ; 2³
LF11C:
    cmp    #HILIGHT_CLUBS        ; 2
    bne    LF130                 ; 2³
    inc    upDownAudioFlag       ; 5
    lda    #SHOW_GOLFER          ; 2
    sta    displayFlag           ; 3
    lda    #0                    ; 2
    sta    playerGfxIndex        ; 3
    sta    delayPlayer           ; 3
    sta    delayP2               ; 3
    beq    LF174                 ; 2³
LF130:
    cmp    #HILIGHT_VIEW         ; 2
    bne    LF13F                 ; 2³
    and    #REMOVE_HILIGHT       ; 2
    sta    displayFlag           ; 3
    inc    upDownAudioFlag       ; 5
    lda    $C8                   ; 3
    sta.wy screenNumber,Y        ; 5
LF13F:
    cmp    #$FF                  ; 2
    bne    LF174                 ; 2³
    lda    delayPlayer           ; 3
    bne    LF14F                 ; 2³
    inc    upDownAudioFlag       ; 5
    jsr    LF89C                 ; 6
    jmp    LF174                 ; 3
LF14F:
    cmp    #1                    ; 2
    bne    LF15E                 ; 2³
    inc    upDownAudioFlag       ; 5
    jsr    LF89C                 ; 6
    jsr    LF8A5                 ; 6
    jmp    LF174                 ; 3
LF15E:
    cmp    #2                    ; 2
    bne    LF16E                 ; 2³
    inc    upDownAudioFlag       ; 5
    lda    delayP2               ; 3
    bne    LF16E                 ; 2³
    jsr    LF8A5                 ; 6
    jmp    LF174                 ; 3

LF16E:
    jsr    LF89C                 ; 6
    jsr    LF8A5                 ; 6

LF174:
    lda    upDownAudioFlag       ; 3
    beq    LF17D                 ; 2³
    ldx    #6                    ; 2
    jsr    Start_New_Audio       ; 6
LF17D:
    lda    #0                    ; 2
    sta    upDownAudioFlag       ; 3
    lda    frameCounter          ; 3
    and    #$0F                  ; 2
    beq    .checkJoystick        ; 2³   every 15th frame
    jmp    LF226                 ; 3

.checkJoystick:
    lda    SWCHA                 ; 4
    ldx    oneOrZero             ; 3
    bne    LF195                 ; 2³   - if player two
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2    else get player one
LF195:
    sta    $DC                   ; 3    either both players or player one
    and    #$0F                  ; 2
    cmp    #$0F                  ; 2
    beq    .exit1                ; 2³  - if no direction pressed
    ldy    displayFlag           ; 3
    beq    .exit1                ; 2³
    cpy    #$FF                  ; 2
    beq    .exit1                ; 2³
    cpy    #$82                  ; 2
    bne    LF1D3                 ; 2³
    lsr                          ; 2
    bcs    .checkDown            ; 2³  - if not pressing up
    ldx    oneOrZero             ; 3
    inc    screenNumber,X        ; 6
    inc    upDownAudioFlag       ; 5
    lda    screenNumber,X        ; 4
    ldx    holeNumber            ; 3
    cmp    ScreensPerHole_Tab,X  ; 4
    bcc    .exit1                ; 2³
    beq    .exit1                ; 2³
    dec    upDownAudioFlag       ; 5
    ldx    oneOrZero             ; 3
    dec    screenNumber,X        ; 6   don't view above the last screen
.exit1:
    jmp    LF226                 ; 3

.checkDown:
    lsr                          ; 2
    bcs    LF226                 ; 2³  - if not pressing down
    ldx    oneOrZero             ; 3
    lda    screenNumber,X        ; 4
    beq    LF226                 ; 2³   don't view below first screen
    dec    screenNumber,X        ; 6
    inc    upDownAudioFlag       ; 5
LF1D3:
    cpy    #$81                  ; 2
    bne    LF1E7                 ; 2³
    tya                          ; 2
    and    #$03                  ; 2
    cmp    #3                    ; 2
    beq    LF226                 ; 2³
    lda    displayFlag           ; 3
    and    #$7F                  ; 2
    sta    displayFlag           ; 3
    jmp    LF226                 ; 3
LF1E7:
    cpy    #3                    ; 2
    bcs    LF226                 ; 2³
    lsr                          ; 2
    bcs    LF1F3                 ; 2³
    inc    clubsOrView           ; 5
    jmp    LF1F8                 ; 3

LF1F3:
    lsr                          ; 2
    bcs    LF226                 ; 2³
    dec    clubsOrView           ; 5
LF1F8:
    inc    upDownAudioFlag       ; 5
    lda    clubsOrView           ; 3
    bpl    LF202                 ; 2³
    lda    #VIEW_AHEAD           ; 2
    sta    clubsOrView           ; 3
LF202:
    cmp    #VIEW_AHEAD+1         ; 2
    bne    LF20A                 ; 2³
    lda    #ONE_WOOD             ; 2    scrolling up past the VIEW option, and it resets back to the 1 wood
    sta    clubsOrView           ; 3
LF20A:
    ldy    oneOrZero             ; 3
    ldx    onTheGreenFlag,Y      ; 4
    beq    LF218                 ; 2³
    lda    #PUTTER               ; 2
    sta    clubsOrView           ; 3
    lda    #0                    ; 2
    sta    upDownAudioFlag       ; 3
LF218:
    lda    clubsOrView           ; 3
    sta.wy playerClubs,Y         ; 5
    ldx    #1                    ; 2
    cmp    #VIEW_AHEAD           ; 2
    bne    LF224                 ; 2³
    inx                          ; 2
LF224:
    stx    displayFlag           ; 3


LF226:
    lda    displayFlag           ; 3
    cmp    #$FF                  ; 2
    bne    LF255                 ; 2³
    lda    delayPlayer           ; 3
    bne    LF255                 ; 2³
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    bne    LF255                 ; 2³
    lda    SWCHA                 ; 4
    ldx    oneOrZero             ; 3
    beq    LF241                 ; 2³
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
LF241:
    asl                          ; 2
    bcs    LF248                 ; 2³
    inc    upDownAudioFlag       ; 5
    inc    arrowDirection        ; 5
LF248:
    asl                          ; 2
    bcs    LF24F                 ; 2³
    inc    upDownAudioFlag       ; 5
    dec    arrowDirection        ; 5
LF24F:
    lda    arrowDirection        ; 3
    and    #$1F                  ; 2
    sta    arrowDirection        ; 3
LF255:
    lda    upDownAudioFlag       ; 3
    beq    LF25E                 ; 2³
    ldx    #5                    ; 2
    jsr    Start_New_Audio       ; 6
LF25E:
    ldy    oneOrZero             ; 3
    lda.wy onTheGreenFlag,Y      ; 4
    beq    LF269                 ; 2³
    lda    frameCounter          ; 3
    and    #$01                  ; 2
LF269:
    bne    LF2A3                 ; 2³
    lda    delayPlayer           ; 3
    beq    LF2A3                 ; 2³
    cmp    #3                    ; 2
    bcs    LF2A3                 ; 2³
    cmp    #1                    ; 2
    bne    LF286                 ; 2³
    inc    $A9                   ; 5
    lda    $A9                   ; 3
    cmp    #$30                  ; 2
    bcc    LF2A3                 ; 2³
    jsr    LF89C                 ; 6
    dec    $A9                   ; 5
    bne    LF2A3                 ; 2³
LF286:
    cmp    #2                    ; 2
    bne    LF2A3                 ; 2³
    dec    $A9                   ; 5
    bne    LF2A3                 ; 2³
    jsr    LF89C                 ; 6
    lda    delayP2               ; 3
    cmp    #2                    ; 2
    beq    LF2A3                 ; 2³
    lda    #$FF                  ; 2
    sta    displayFlag           ; 3
    lda    #0                    ; 2
    sta    playerGfxIndex        ; 3
    sta    delayPlayer           ; 3
    sta    delayP2               ; 3
LF2A3:
    lda    $A9                   ; 3
    clc                          ; 2
    adc    #$48                  ; 2
    jsr    LF87A                 ; 6
    sta    $AA                   ; 3
    lda    delayPlayer           ; 3
    bne    LF2B4                 ; 2³
LF2B1:
    jmp    LF6BB                 ; 3
LF2B4:
    cmp    #1                    ; 2
    bne    LF2C7                 ; 2³
    lda    $A9                   ; 3
    lsr                          ; 2
    cmp    #8                    ; 2
    bcc    LF2C1                 ; 2³   less then 8
    lda    #7                    ; 2    and shift to get 3
LF2C1:
    lsr                          ; 2
    sta    playerGfxIndex        ; 3
    jmp    LF6BB                 ; 3
LF2C7:
    cmp    #2                    ; 2
    beq    LF2B1                 ; 2³
    cmp    #3                    ; 2
    bne    LF2E3                 ; 2³
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    LF2B1                 ; 2³
    inc    playerGfxIndex        ; 5
    lda    playerGfxIndex        ; 3
    cmp    #8                    ; 2
    bne    LF2B1                 ; 2³
    inc    delayPlayer           ; 5
    bne    LF2B1                 ; 2³
    dec    playerGfxIndex        ; 5
LF2E3:
    cmp    #4                    ; 2
    beq    LF2EA                 ; 2³
    jmp    LF379                 ; 3
LF2EA:
    jsr    Update_Score          ; 6
    ldx    #0                    ; 2
    jsr    Start_New_Audio       ; 6
    lda    #0                    ; 2
    sta    $BA                   ; 3
    sta    $BD                   ; 3
    sta    $BE                   ; 3
    ldy    oneOrZero             ; 3
    lda.wy onTheGreenFlag,Y      ; 4
    beq    LF30F                 ; 2³
    lda    #0                    ; 2
    sta    $C0                   ; 3
    lda    #5                    ; 2
    sta    $83                   ; 3
    lda    #$C0                  ; 2
    sta    $C1                   ; 3
    bne    LF337                 ; 3   always branch

LF30F:
    ldy    oneOrZero             ; 3
    lda.wy $E5,Y                 ; 4
    tay                          ; 2
    ldx    clubsOrView           ; 3
    lda    LFC72,X               ; 4
    cpy    #$7F                  ; 2
    beq    LF329                 ; 2³
    cpy    #$80                  ; 2
    bcc    LF32A                 ; 2³
    cpx    #$0F                  ; 2
    beq    LF328                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
LF328:
    lsr                          ; 2
LF329:
    lsr                          ; 2
LF32A:
    sta    $C1                   ; 3
    lsr                          ; 2
    sta    $BF                   ; 3
    lsr                          ; 2
    sta    $C0                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $83                   ; 3
LF337:
    lda    $DF                   ; 3
    cmp    #$2F                  ; 2
    beq    LF355                 ; 2³
    lda    #$30                  ; 2
    sec                          ; 2
    sbc    $DF                   ; 3
    tax                          ; 2
LF343:
    lda    $C1                   ; 3
    sec                          ; 2
    sbc    $83                   ; 3
    bcc    LF34F                 ; 2³
    sta    $C1                   ; 3
    dex                          ; 2
    bpl    LF343                 ; 2³
LF34F:
    lda    $C1                   ; 3
    bne    LF355                 ; 2³
    inc    $C1                   ; 5
LF355:
    ldy    oneOrZero             ; 3
    lda    $C1                   ; 3
    lsr                          ; 2
    ldx    onTheGreenFlag,Y      ; 4
    bmi    LF360                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
LF360:
    sta    $EA                   ; 3
    lda.wy ball_Horz,Y           ; 4
    sta    $C6                   ; 3
    lda.wy ball_Vert,Y           ; 4
    sta    $C7                   ; 3
    lda.wy screenNumber,Y        ; 4
    sta    $C8                   ; 3
    inc    delayPlayer           ; 5
    lda    #0                    ; 2
    sta    $BA                   ; 3
    sta    $BD                   ; 3
LF379:
    lda    delayPlayer           ; 3
    cmp    #5                    ; 2
    beq    LF382                 ; 2³
    jmp    LF5B1                 ; 3
LF382:
    lda    clubsOrView           ; 3
    cmp    #$10                  ; 2
    beq    LF3A6                 ; 2³
    dec    $BF                   ; 5
    lda    $BF                   ; 3
    and    #$1F                  ; 2
    bne    LF3A6                 ; 2³
    lda    $C1                   ; 3
    cmp    #3                    ; 2
    bcc    LF39A                 ; 2³
    bit    $BF                   ; 3
    bpl    LF39E                 ; 2³
LF39A:
    dec    $BE                   ; 5
    bpl    LF3A6                 ; 2³
LF39E:
    inc    $BE                   ; 5
    lda    $BE                   ; 3
    cmp    #4                    ; 2
    bcs    LF39A                 ; 2³
LF3A6:
    lda    $C1                   ; 3
    cmp    #3                    ; 2
    bne    LF3BA                 ; 2³
    lda    clubsOrView           ; 3
    cmp    #$10                  ; 2
    beq    LF3DC                 ; 2³
    ldx    #8                    ; 2
    jsr    Start_New_Audio       ; 6
    jmp    LF3DC                 ; 3
LF3BA:
    cmp    #2                    ; 2
    bne    LF3DC                 ; 2³
    lda    $EA                   ; 3
    beq    LF3DC                 ; 2³
    lda    frameCounter          ; 3
    and    #$0F                  ; 2
    ldy    oneOrZero             ; 3
    ldx    onTheGreenFlag,Y      ; 4
    bpl    LF3CD                 ; 2³
    lsr                          ; 2
LF3CD:
    cmp    $EA                   ; 3
    bcs    LF3D9                 ; 2³
    dec    $EA                   ; 5
    lda    $EA                   ; 3
    and    #$01                  ; 2
    beq    LF3DC                 ; 2³
LF3D9:
    jmp    LF6BB                 ; 3
LF3DC:
    ldx    arrowDirection        ; 3
    lda    $C1                   ; 3
    cmp    #1                    ; 2
    bne    LF3E7                 ; 2³
    jmp    LF4DB                 ; 3
LF3E7:
    cmp    $C0                   ; 3
    bcs    LF420                 ; 2³
    ldy    oneOrZero             ; 3
    lda.wy onTheGreenFlag,Y      ; 4
    bne    LF420                 ; 2³
    lda    $E0                   ; 3
    cmp    #8                    ; 2
    beq    LF420                 ; 2³
    bcc    LF410                 ; 2³
    sec                          ; 2
    sbc    #9                    ; 2
    cmp    #8                    ; 2
    bcc    LF403                 ; 2³
    lda    #7                    ; 2
LF403:
    tay                          ; 2
    lda    LFD6E,Y               ; 4
    and    frameCounter          ; 3
    bne    LF420                 ; 2³
    inx                          ; 2
    inx                          ; 2
    jmp    LF41C                 ; 3
LF410:
    eor    #$07                  ; 2
    tay                          ; 2
    lda    LFD6E,Y               ; 4
    and    frameCounter          ; 3
    bne    LF420                 ; 2³
    dex                          ; 2
    dex                          ; 2
LF41C:
    txa                          ; 2
    and    #$1F                  ; 2
    tax                          ; 2
LF420:
    lda    LFCCC,X               ; 4
    sta    $C3                   ; 3
    lda    LFD45,X               ; 4
    sta    $C5                   ; 3
    lda    LFCEC,X               ; 4
    sta    $C2                   ; 3
    lda    LFCF4,X               ; 4
    sta    $C4                   ; 3
    ldy    oneOrZero             ; 3
    lda.wy onTheGreenFlag,Y      ; 4    are we on the green?
    bne    LF470                 ; 2³   - yes, take branch
    lda    windSpeedDir          ; 3    - no, lets test the wind
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    beq    LF470                 ; 2³
    tay                          ; 2
    lda    windSpeedDir          ; 3
    lsr                          ; 2
    bcc    LF455                 ; 2³
    lda    #0                    ; 2
    sec                          ; 2
    sbc    LFD65,Y               ; 4
    sta    $83                   ; 3
    lda    #$FF                  ; 2
    bmi    LF45C                 ; 2³   always branch, I think

LF455:
    lda    LFD65,Y               ; 4
    sta    $83                   ; 3
    lda    #0                    ; 2
LF45C:
    sta    $84                   ; 3   $00 or $FF
    lda    windSpeedDir          ; 3
    and    #$02                  ; 2
    tax                          ; 2
    lda    $C3,X                 ; 4
    clc                          ; 2
    adc    $83                   ; 3
    sta    $C3,X                 ; 4
    lda    $C2,X                 ; 4
    adc    $84                   ; 3
    sta    $C2,X                 ; 4
LF470:
    ldx    oneOrZero             ; 3
    lda    $BA                   ; 3
    clc                          ; 2
    adc    $C3                   ; 3
    sta    $BA                   ; 3
    lda    ball_Horz,X           ; 4
    adc    $C2                   ; 3
    sta    ball_Horz,X           ; 4
    lda    ball_Horz,X           ; 4
    cmp    #$90                  ; 2
    bcc    LF488                 ; 2³
    jmp    LF4C2                 ; 3
LF488:
    lda    $BD                   ; 3
    clc                          ; 2
    adc    $C5                   ; 3
    sta    $BD                   ; 3
    lda    ball_Vert,X           ; 4
    adc    $C4                   ; 3
    sta    ball_Vert,X           ; 4
    lda    ball_Vert,X           ; 4
    cmp    #$F0                  ; 2
    bcc    LF4AB                 ; 2³
    lda    onTheGreenFlag,X      ; 4
    bne    LF4BC                 ; 2³
    lda    screenNumber,X        ; 4
    beq    LF4C2                 ; 2³
    lda    #$7F                  ; 2
    sta    ball_Vert,X           ; 4
    dec    screenNumber,X        ; 6
    bpl    LF4DB                 ; 2³
LF4AB:
    lda    ball_Vert,X           ; 4
    bpl    LF4DB                 ; 2³
    inc    screenNumber,X        ; 6
    lda    screenNumber,X        ; 4
    ldy    holeNumber            ; 3   Y is no longer 1 or 0
    cmp    ScreensPerHole_Tab,Y  ; 4
    beq    LF4BC                 ; 2³
    bcs    LF4C2                 ; 2³
LF4BC:
    lda    #0                    ; 2
    sta    ball_Vert,X           ; 4
    beq    LF4DB                 ; 3   always branch

LF4C2:
    lda    $C6                   ; 3
    sta    ball_Horz,X           ; 4
    lda    $C7                   ; 3
    sta    ball_Vert,X           ; 4
    lda    $C8                   ; 3
    sta    screenNumber,X        ; 4
    ldx    #4                    ; 2
    jsr    Start_New_Audio       ; 6   Y never used here
    lda    #1                    ; 2
    sta    $C1                   ; 3
    lda    #0                    ; 2
    sta    $BE                   ; 3
LF4DB:
    ldx    oneOrZero             ; 3
    lda    onTheGreenFlag,X      ; 4
    beq    LF506                 ; 2³
    lda    collisionFlag         ; 3
    and    #$40                  ; 2
    bne    LF506                 ; 2³
    lda    ball_Horz,X           ; 4
    cmp    #$50                  ; 2
    bcc    LF4F1                 ; 2³
    dec    ball_Horz,X           ; 6
    dec    ball_Horz,X           ; 6
LF4F1:
    inc    ball_Horz,X           ; 6
    lda    ball_Vert,X           ; 4
    cmp    #$50                  ; 2
    bcc    LF4FD                 ; 2³
    dec    ball_Vert,X           ; 6
    dec    ball_Vert,X           ; 6
LF4FD:
    inc    ball_Vert,X           ; 6
    lda    #1                    ; 2
    sta    $C1                   ; 3
    jmp    LF54F                 ; 3
LF506:
;=====================================
  IF ALTERNATE
    ldy    oneOrZero             ; 3
  ENDIF
;=====================================
    lda    $C1                   ; 3
    cmp    #1                    ; 2
    bne    LF52C                 ; 2³
;=====================================
  IF ORIGINAL
    ldy    oneOrZero             ; 3
  ENDIF
;=====================================
    ldx    holeNumber            ; 3
    lda.wy screenNumber,Y        ; 4
    cmp    ScreensPerHole_Tab,X  ; 4
    bne    LF52C                 ; 2³
    lda.wy ball_Horz,Y           ; 4
    cmp    Hole_Hpos_Tab,X       ; 4
    bne    LF52C                 ; 2³
    lda.wy ball_Vert,Y           ; 4
    cmp    Hole_Vpos_Tab,X       ; 4
    bne    LF52C                 ; 2³
    ldx    #2                    ; 2
    bne    LF53B                 ; 3    always branch

LF52C:
    lda.wy onTheGreenFlag,Y      ; 4
    and    collisionFlag         ; 3
    bpl    LF54F                 ; 2³   on the green, and P0 collision with playfield, then take branch
    lda    $C1                   ; 3    you get here when you sink the ball in the hole
    cmp    #UNK_01               ; 2    $0E in original, $0C in alternate, these are comparisions of when to stop shot
    bcs    LF54F                 ; 2³
    ldx    #1                    ; 2
LF53B:
    lda    #1                    ; 2
    sta    $C1                   ; 3
    lda    #$FF                  ; 2
    sta    $D2                   ; 3
    jsr    Start_New_Audio       ; 6
    lda    oneOrZero             ; 3
    clc                          ; 2
    adc    #1                    ; 2
    ora    $EC                   ; 3
    sta    $EC                   ; 3
LF54F:
    lda    $C1                   ; 3
    cmp    #2                    ; 2
    bne    LF55C                 ; 2³
    lda    $EA                   ; 3
    beq    LF55C                 ; 2³
    jmp    LF560                 ; 3
LF55C:
    dec    $C1                   ; 5
    beq    LF5A3                 ; 2³
LF560:
    jsr    LFADE                 ; 6
    ldx    oneOrZero             ; 3
    lda    onTheGreenFlag,X      ; 4
    bne    LF57F                 ; 2³
    lda    collisionFlag         ; 3
    bpl    LF57F                 ; 2³
    lda    $C1                   ; 3
    cmp    $C0                   ; 3
    bcs    LF57F                 ; 2³
    cpy    #2                    ; 2
    bcc    LF57F                 ; 2³
    cpy    #8                    ; 2
    bcc    LF5A3                 ; 2³
    cpy    #$14                  ; 2
    beq    LF5A3                 ; 2³
LF57F:
    cpy    #$19                  ; 2
    beq    LF58B                 ; 2³
    cpy    #$1F                  ; 2
    beq    LF58B                 ; 2³
    cpy    #$1B                  ; 2
    bne    LF592                 ; 2³
LF58B:
    jsr    LFB08                 ; 6
    bcc    LF592                 ; 2³
    bcs    LF5A0                 ; 2³
LF592:
    ldx    oneOrZero             ; 3
    lda    ball_Horz,X           ; 4
    sta    copyBallHpos          ; 3   copy registers are only used once, to return
    lda    ball_Vert,X           ; 4   the vaules back...
    sta    copyBallVpos          ; 3
    lda    screenNumber,X        ; 4
    sta    copyScreenNum         ; 3
LF5A0:
    jmp    LF6BB                 ; 3

LF5A3:
    lda    #0                    ; 2
    sta    $BE                   ; 3
    sta    $C1                   ; 3
    inc    delayPlayer           ; 5
LF5AB:
    jmp    LF6BB                 ; 3
LF5AE:
    jmp    LF6AA                 ; 3
LF5B1:
    inc    delayPlayer           ; 5
    beq    LF5AE                 ; 2³
    cmp    #$80                  ; 2
    bne    LF5AB                 ; 2³
    ldy    oneOrZero             ; 3
    lda    #0                    ; 2
    sta.wy $E5,Y                 ; 5
    lda    $EC                   ; 3
    and    #$03                  ; 2
    cmp    #3                    ; 2
    beq    LF5CF                 ; 2³
    lsr                          ; 2
    bcc    LF5E9                 ; 2³
    lda    numOfPlayers          ; 3
    bne    LF5E9                 ; 2³
LF5CF:
    inc    holeNumber            ; 5   move to next hole
    lda    holeNumber            ; 3
    cmp    #$12                  ; 2   check if the last hole has been played
    bne    LF5E3                 ; 2³
    lda    #0                    ; 2   if so then start over...
    sta    holeNumber            ; 3
    sta    frameCounter          ; 3
    lda    $87                   ; 3
    ora    #$A0                  ; 2
    sta    $87                   ; 3
LF5E3:
    jsr    LF8B2                 ; 6
    jmp    LF6AA                 ; 3
LF5E9:
    lda    collisionFlag         ; 3
    bpl    LF618                 ; 2³
    jsr    LFADE                 ; 6
    cpy    #2                    ; 2
    bcc    LF5AE                 ; 2³
    cpy    #8                    ; 2
    bcc    LF66F                 ; 2³
    cpy    #$0E                  ; 2
    bcc    LF64C                 ; 2³
    cpy    #$14                  ; 2
    bcc    LF615                 ; 2³
    beq    LF66F                 ; 2³
    cpy    #$15                  ; 2
    beq    LF64C                 ; 2³
    cpy    #$16                  ; 2
    beq    LF615                 ; 2³
    cpy    #$17                  ; 2
    beq    LF665                 ; 2³
    cpy    #$18                  ; 2
    beq    LF68C                 ; 2³
    jmp    LF6AA                 ; 3
LF615:
    jmp    LF69E                 ; 3
LF618:
    ldy    oneOrZero             ; 3
    lda.wy onTheGreenFlag,Y      ; 4
    bne    LF649                 ; 2³
    jsr    LFADE                 ; 6   Y is updated here
    cpy    #$19                  ; 2
    beq    LF62E                 ; 2³
    cpy    #$1F                  ; 2
    beq    LF62E                 ; 2³
    cpy    #$1B                  ; 2
    bne    LF6AA                 ; 2³
LF62E:
    jsr    LFB08                 ; 6
    bcc    LF6AA                 ; 2³
    ldx    #3                    ; 2
    jsr    Start_New_Audio       ; 6
    jsr    Update_Score          ; 6
    ldx    oneOrZero             ; 3
    lda    copyBallHpos          ; 3   if we hit water return the ball
    sta    ball_Horz,X           ; 4
    lda    copyBallVpos          ; 3
    sta    ball_Vert,X           ; 4
    lda    copyScreenNum         ; 3
    sta    screenNumber,X        ; 4
LF649:
    jmp    LF6AA                 ; 3
LF64C:
    ldx    #3                    ; 2
    jsr    Start_New_Audio       ; 6
    jsr    Update_Score          ; 6
    lda    $84                   ; 3
    sec                          ; 2
    sbc    ZoneHeight_Tab,Y      ; 4
    bcs    LF65E                 ; 2³
    lda    #0                    ; 2
LF65E:
    ldx    oneOrZero             ; 3
    sta    ball_Vert,X           ; 4
    jmp    LF6AA                 ; 3
LF665:
    ldy    oneOrZero             ; 3
    lda    #$7F                  ; 2
    sta.wy $E5,Y                 ; 5
    jmp    LF6AA                 ; 3
LF66F:
    lda    $84                   ; 3
    sec                          ; 2
    sbc    ZoneHeight_Tab,Y      ; 4
    bcs    LF679                 ; 2³
    lda    #0                    ; 2
LF679:
    sec                          ; 2
    sbc    #5                    ; 2
    bcs    LF680                 ; 2³
    lda    #0                    ; 2
LF680:
    ldx    oneOrZero             ; 3
    sta    ball_Vert,X           ; 4
    ldx    #4                    ; 2
    jsr    Start_New_Audio       ; 6
    jmp    LF6AA                 ; 3
LF68C:
    ldx    #7                    ; 2
    jsr    Start_New_Audio       ; 6   putting screen intro
    jsr    LFBA4                 ; 6
    lda    #$FF                  ; 2
    ldy    oneOrZero             ; 3
    sta.wy onTheGreenFlag,Y      ; 5
    jmp    LF6AA                 ; 3
LF69E:
    lda    #$FF                  ; 2
    ldy    oneOrZero             ; 3
    sta.wy $E5,Y                 ; 5
    ldx    #4                    ; 2
    jsr    Start_New_Audio       ; 6
LF6AA:
    lda    #0                    ; 2
    sta    displayFlag           ; 3
    sta    $A9                   ; 3
    sta    delayPlayer           ; 3
    jsr    LF81E                 ; 6
    jsr    LF949                 ; 6
    jsr    LFA89                 ; 6
LF6BB:
    ldx    playerGfxIndex        ; 3
    stx    golferGfxSeed         ; 3
    lda    clubsOrView           ; 3
    cmp    #PUTTER               ; 2
    bne    LF6CA                 ; 2³
    lda    PlayerPutting_Tab,X   ; 4
    sta    golferGfxSeed         ; 3
LF6CA:
    ldx    oneOrZero             ; 3
    ldy    screenNumber,X        ; 4
    ldx    holeNumber            ; 3
    lda    HoleStartLoPtrs,X     ; 4
    clc                          ; 2
    adc    ScreenIndex,Y         ; 4
    sta    $8D                   ; 3
    lda    HoleStartHiPtrs,X     ; 4
    adc    #0                    ; 2
    sta    $8E                   ; 3
    ldy    #6                    ; 2
LF6E2:
    lda    ($8D),Y               ; 5
    sta.wy zoneObjects,Y         ; 5   $D4 - $DA
    dey                          ; 2
    bpl    LF6E2                 ; 2³
    ldy    oneOrZero             ; 3
    lda    #0                    ; 2
    sta    $83                   ; 3
    sta    $84                   ; 3
    lda    displayFlag           ; 3
    cmp    #$FF                  ; 2
    bne    LF70D                 ; 2³
    lda    delayPlayer           ; 3
    bne    LF70D                 ; 2³
    lda    #$FE                  ; 2
    ldx    arrowDirection        ; 3
    cpx    #$11                  ; 2
    bcc    LF706                 ; 2³
    lda    #$F9                  ; 2
LF706:
    sta    $83                   ; 3
    lda    LFD0C,X               ; 4
    sta    $84                   ; 3
LF70D:
    lda.wy ball_Horz,Y           ; 4
    clc                          ; 2
    adc    $83                   ; 3
    adc    #2                    ; 2
    jsr    LF87A                 ; 6
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    waste3cycles          ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
LF729:
    dey                          ; 2
    bpl    LF729                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    jsr    Waste12cycles_C       ; 6
    jsr    Waste12cycles_C       ; 6
    ldx    oneOrZero             ; 3
    sta    HMCLR                 ; 3
    lda    #$84                  ; 2
    sec                          ; 2
    sbc    ball_Vert,X           ; 4
    sec                          ; 2
    sbc    $84                   ; 3
    sta    scanlinesToBall       ; 3
    lda    displayFlag           ; 3
    cmp    #$FF                  ; 2
    bne    LF7AF                 ; 2³
    lda    delayPlayer           ; 3
    bne    LF7AF                 ; 2³
    lda    arrowDirection        ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    ArrowDir_Tab,X        ; 4
    tay                          ; 2
    ldx    #7                    ; 2
LF75B:
    lda    Direction_Arrow_Gfx,Y ; 4
    sta    $C9,X                 ; 4
    dey                          ; 2
    dex                          ; 2
    bpl    LF75B                 ; 2³

    ldx    arrowDirection        ; 3
    lda    SwitchDirection_Tab,X ; 4
    lsr                          ; 2
    bcc    LF784                 ; 2³
    lda    $CA                   ; 3   reflect gfx vertically by swapping registers
    ldx    $D0                   ; 3
    sta    $D0                   ; 3
    stx    $CA                   ; 3
    lda    $CB                   ; 3
    ldx    $CF                   ; 3
    sta    $CF                   ; 3
    stx    $CB                   ; 3
    lda    $CC                   ; 3
    ldx    $CE                   ; 3
    sta    $CE                   ; 3
    stx    $CC                   ; 3
LF784:
    ldx    arrowDirection        ; 3
    lda    SwitchDirection_Tab,X ; 4
    and    #$02                  ; 2
    beq    LF7CC                 ; 2³
    ldx    #7                    ; 2
LF78F:
    lda    $C9,X                 ; 4
    lsr                          ; 2
    rol    $C9,X                 ; 6   reflect gfx horizontally by rotating registers
    lsr                          ; 2
    rol    $C9,X                 ; 6
    lsr                          ; 2
    rol    $C9,X                 ; 6
    lsr                          ; 2
    rol    $C9,X                 ; 6
    lsr                          ; 2
    rol    $C9,X                 ; 6
    lsr                          ; 2
    rol    $C9,X                 ; 6
    lsr                          ; 2
    rol    $C9,X                 ; 6
    lsr                          ; 2
    rol    $C9,X                 ; 6
    dex                          ; 2
    bne    LF78F                 ; 2³
    jmp    LF7CC                 ; 3
LF7AF:
    lda    $BE                   ; 3
    asl                          ; 2
    asl                          ; 2
    ora    #$03                  ; 2
    tax                          ; 2
    ldy    #3                    ; 2
LF7B8:
    lda    LFF7D,X               ; 4   ball gfx
    sta.wy $C9,Y                 ; 5
    dex                          ; 2
    dey                          ; 2
    bpl    LF7B8                 ; 2³
    lda    #0                    ; 2
    sta    $CD                   ; 3
    sta    $CE                   ; 3
    sta    $CF                   ; 3
    sta    $D0                   ; 3
LF7CC:
    lda    $D2                   ; 3
    bne    LF7DE                 ; 2³
    lda    displayFlag           ; 3
    cmp    #$82                  ; 2
    bne    LF7E6                 ; 2³
    ldx    oneOrZero             ; 3
    lda    screenNumber,X        ; 4
    cmp    $C8                   ; 3
    beq    LF7E6                 ; 2³
LF7DE:
    lda    #0                    ; 2
    sta    $CA                   ; 3
    sta    $CB                   ; 3
    sta    $CC                   ; 3
LF7E6:
    lda    #0                    ; 2
    sta    $83                   ; 3
    ldx    #6                    ; 2
LF7EC:
    lda    zoneObjects,X         ; 4
    and    #$1F                  ; 2   0 - 31
    tay                          ; 2
    lda    ZoneHeight_Tab,Y      ; 4
    clc                          ; 2
    adc    $83                   ; 3
    sta    $83                   ; 3
    dex                          ; 2
    bpl    LF7EC                 ; 2³
    lda    #$60                  ; 2
    sec                          ; 2
    sbc    $83                   ; 3
    sta    blankTopLines         ; 3
    sta    CXCLR                 ; 3
    lda    #COL_BALL_N_ARROW     ; 2
    sta    COLUP0                ; 3
    jsr    Check_Audio           ; 6

LF80C:
    ldy    INTIM                 ; 4
    bne    LF80C                 ; 2³
    sta    WSYNC                 ; 3
    sty    COLUBK                ; 3   black
    sty    VBLANK                ; 3   stop VBLANK
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    jmp    LDFE0                 ; 3   bank switch

;-------------------------------------

LF81E SUBROUTINE
    lda    #0                    ; 2
    sta    $D2                   ; 3
    lda    numOfPlayers          ; 3
    beq    .switchToZero         ; 2³
    lda    strokesP1             ; 3
    ora    strokesP2             ; 3
    beq    LF874                 ; 2³
    lda    strokesP1             ; 3
    beq    .switchToZero         ; 2³
    lda    strokesP2             ; 3
    beq    .switchToOne          ; 2³
    lda    $EC                   ; 3
    lsr                          ; 2
    bcs    .switchToOne          ; 2³
    lsr                          ; 2
    bcs    .switchToZero         ; 2³
    lda    onTheGreenFlag_P1     ; 3
    cmp    onTheGreenFlag_P2     ; 3
    beq    LF848                 ; 2³
    cmp    #$FF                  ; 2
    beq    .switchToOne          ; 2³
    bne    .switchToZero         ; 3   always branch

LF848:
    lda    #0                    ; 2
    sta    oneOrZero             ; 3   zero is for player one
    jsr    LF949                 ; 6
    lda    yardsLoBCD            ; 3
    sta    $91                   ; 3   dispFour
    lda    yardsHiBCD            ; 3
    sta    $92                   ; 3   dispFour+1
    inc    oneOrZero             ; 5   player two
    jsr    LF949                 ; 6
    lda    yardsHiBCD            ; 3
    cmp    $92                   ; 3   dispFour+1
    bcc    .switchToZero         ; 2³
    bne    .switchToOne          ; 2³
    lda    yardsLoBCD            ; 3
    cmp    $91                   ; 3   dispFour
    bcc    .switchToZero         ; 2³
    bne    .switchToOne          ; 2³
.switchToZero:
    ldx    #0                    ; 2
    beq    LF872                 ; 3   always branch

.switchToOne:
    ldx    #1                    ; 2
LF872:
    stx    oneOrZero             ; 3   player one or player two
LF874:
    jsr    LF949                 ; 6
    jmp    LFA89                 ; 3

;-------------------------------------

LF87A SUBROUTINE
    tay                          ; 2
    iny                          ; 2
    tya                          ; 2
    and    #$0F                  ; 2
    sta    $83                   ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc    $83                   ; 3
    cmp    #$0F                  ; 2
    bcc    LF891                 ; 2³
    sbc    #$0F                  ; 2
    iny                          ; 2
LF891:
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sty    $83                   ; 3
    ora    $83                   ; 3
Waste12cycles_C:
    rts                          ; 6

;-------------------------------------

LF89C SUBROUTINE
    ldx    delayPlayer           ; 3
    cpx    #3                    ; 2
    bcs    LF8A4                 ; 2³
    inc    delayPlayer           ; 5
LF8A4:
    rts                          ; 6

;-------------------------------------

LF8A5 SUBROUTINE
    ldx    delayP2               ; 3
    cpx    #2                    ; 2
    bcs    LF8B1                 ; 2³
    lda    $A9                   ; 3
    sta    $DF,X                 ; 4
    inc    delayP2               ; 5
LF8B1:
    rts                          ; 6

;-------------------------------------

LF8B2 SUBROUTINE
    lda    numOfPlayers          ; 3
    beq    LF8C3                 ; 2³   - if player 1
    lda    strokesP1             ; 3
    cmp    strokesP2             ; 3
    beq    LF8C3                 ; 2³
    ldx    #0                    ; 2
    bcc    LF8C1                 ; 2³   - if player 1's turn
    inx                          ; 2    player 2
LF8C1:
    stx    $EB                   ; 3    EB can only ever be 1 or 0...
LF8C3:
    lda    $EB                   ; 3
    sta    oneOrZero             ; 3    therefore oneOrZero can only ever be 1 or 0
    ldx    holeNumber            ; 3
    lda    Par_Tab,X             ; 4
    sta    parForHole            ; 3
    lda    HoleNum_Display_Tab,X ; 4
    sta    holeNumberSeed        ; 3
    lda    #0                    ; 2
    sta    ball_Vert_P1          ; 3
    sta    ball_Vert_P2          ; 3
    sta    screenNumber_P1       ; 3
    sta    screenNumber_P2       ; 3
    sta    strokesP1             ; 3
    sta    strokesP2             ; 3
    sta    onTheGreenFlag_P1     ; 3
    sta    onTheGreenFlag_P2     ; 3
    sta    $D2                   ; 3
    sta    $EC                   ; 3
    sta    clubsP1               ; 3
    sta    clubsP2               ; 3
    lda    ball_Horz_Tab,X       ; 4
    sta    ball_Horz_P1          ; 3
    sta    ball_Horz_P2          ; 3
    ldy    #1                    ; 2    do player 2 first, and then player 1


.loopUpdatePar:
    ldx    holeNumber            ; 3
;=====================================
; this is a fix to show the correct over/under par
; after you complete all 18 holes, or your score goes above 100
; to check starting a few lines before in Stella:
; breakif { pc==f8f2 && _bank==1 }

  IF ALTERNATE
    bne    .exit                 ; 2    exit except when on hole 1.
    lda    scoreLoP1             ; 3    only compare player ones score, because they have to play no matter what
    ora    scoreHiP1             ; 3    
    beq    .exit                 ; 2³   - is the score zero?
    ldx    #$12                  ; 2    if no, then we will compare it with the course par, which is 72.
.exit:

  ENDIF

;=====================================
    lda.wy playerScoreHi,Y       ; 4    player 1 or player 2
    bne    LF919                 ; 2³   - is the score more then 99?
    lda.wy playerScoreLo,Y       ; 4    no, check the players score to the course par.
    cmp    ParTotals_Tab,X       ; 4
    bcc    LF90C                 ; 2³   - is the players score less than par?
    bne    LF919                 ; 2³   - is the players score more than par?
    lda    #0                    ; 2    player has a score even with par.
    tax                          ; 2    X gets stored in the plusMinusFlag, 0 = even par.
    beq    .updatePar            ; 3    always branch

LF90C:
    lda    ParTotals_Tab,X       ; 4
    sed                          ; 2
    sec                          ; 2
    sbc.wy playerScoreLo,Y       ; 4
    cld                          ; 2
    ldx    #UNDER_PAR            ; 2
    bne    .updatePar            ; 3    always branch

LF919:
    lda    ParTotals_Tab,X       ; 4
    sta    temp1                 ; 3
    ldx    #OVER_PAR             ; 2
    sed                          ; 2
    lda.wy playerScoreLo,Y       ; 4
    sec                          ; 2
    sbc    temp1                 ; 3
    cld                          ; 2
    bcs    .updatePar            ; 2³
    lda    #$99                  ; 2   seems to limit you from going 99 over par for screen?

.updatePar:
    sta.wy ParOverUnder,Y        ; 5
    stx    plusMinusFlag,Y       ; 4
    dey                          ; 2   do for both players
    bpl    .loopUpdatePar        ; 2³


    lda    frameCounter          ; 3   randomly select a wind speed
    and    #$F0                  ; 2   only the high nybble is used for the wind speed
    cmp    #$A0                  ; 2   compare with the top of the number gfx,  $A0 / 2 = $50 (low nybble of "blank digit")
    bcc    .updateSpeed          ; 2³  if it's less then that branch, as it's already good
    sec                          ; 2
    sbc    #$A0                  ; 2   but if not, then cut down that random number
.updateSpeed:
    sta    windSpeedDir          ; 3
    lda    frameCounter          ; 3   randomly select a wind directon
    and    #$03                  ; 2
    ora    windSpeedDir          ; 3
    sta    windSpeedDir          ; 3   now we got wind speed and direction

LF949 SUBROUTINE
    lda    #1                    ; 2
    sta    arrowFlag             ; 3
    ldy    oneOrZero             ; 3
    ldx    screenNumber,Y        ; 4
    lda.wy onTheGreenFlag,Y      ; 4
    beq    LF958                 ; 2³
    ldx    #0                    ; 2
LF958:
    lda.wy ball_Vert,Y           ; 4
    clc                          ; 2
    adc    LFA9E,X               ; 4
    sta    $83                   ; 3
    lda    LFAA2,X               ; 4
    adc    #0                    ; 2
    sta    $84                   ; 3
    ldx    holeNumber            ; 3
    lda.wy onTheGreenFlag,Y      ; 4
    beq    LF971                 ; 2³
    ldx    #$12                  ; 2
LF971:
    ldy    ScreensPerHole_Tab,X  ; 4
    lda    Hole_Vpos_Tab,X       ; 4
    clc                          ; 2
    adc    LFA9E,Y               ; 4
    sta    $8D                   ; 3
    lda    LFAA2,Y               ; 4
    adc    #0                    ; 2
    sta    $8E                   ; 3
    ldy    oneOrZero             ; 3
    lda    $8D                   ; 3
    sec                          ; 2
    sbc    $83                   ; 3
    sta    $83                   ; 3
    lda    $8E                   ; 3
    sbc    $84                   ; 3
    sta    $84                   ; 3
    bcs    LF9A6                 ; 2³
    lda    #3                    ; 2
    sta    arrowFlag             ; 3
    lda    #0                    ; 2
    sec                          ; 2
    sbc    $83                   ; 3
    sta    $83                   ; 3
    lda    #0                    ; 2
    sbc    $84                   ; 3
    sta    $84                   ; 3
LF9A6:
    lda.wy ball_Horz,Y           ; 4
    sec                          ; 2
    sbc    Hole_Hpos_Tab,X       ; 4
    bcs    LF9B8                 ; 2³
    sta    $85                   ; 3
    lda    #0                    ; 2
    sec                          ; 2
    sbc    $85                   ; 3
    dec    arrowFlag             ; 5
LF9B8:
    sta    $85                   ; 3
    sta    $F4                   ; 3
    lda    $84                   ; 3
    lsr                          ; 2
    lda    $83                   ; 3
    ror                          ; 2
    sta    $F5                   ; 3
    cmp    $85                   ; 3
    bcc    LFA00                 ; 2³
    ldx    $F5                   ; 3
    lda    $F4                   ; 3
    sta    $F5                   ; 3
    stx    $F4                   ; 3
    jsr    LFB54                 ; 6
    lda    #8                    ; 2
    sec                          ; 2
    sbc    arrowDirection        ; 3
    sta    arrowDirection        ; 3
    jsr    LFB84                 ; 6
    lda    $84                   ; 3
    lsr                          ; 2
    sta    $8E                   ; 3
    lda    $83                   ; 3
    ror                          ; 2
    clc                          ; 2
    adc    $83                   ; 3
    sta    $83                   ; 3
    lda    $84                   ; 3
    adc    $8E                   ; 3
    sta    $84                   ; 3
    lda    $83                   ; 3
    clc                          ; 2
    adc    $85                   ; 3
    sta    $83                   ; 3
    lda    $84                   ; 3
    adc    #0                    ; 2
    sta    $84                   ; 3
    jmp    LFA23                 ; 3

LFA00:
    sta    $83                   ; 3
    jsr    LFB54                 ; 6
    jsr    LFB84                 ; 6
    lda    $83                   ; 3
    ldx    #0                    ; 2
    stx    $84                   ; 3
    clc                          ; 2
    adc    $85                   ; 3
    bcc    LFA15                 ; 2³
    inc    $84                   ; 5
LFA15:
    adc    $85                   ; 3
    bcc    LFA1B                 ; 2³
    inc    $84                   ; 5
LFA1B:
    adc    $85                   ; 3
    bcc    LFA21                 ; 2³
    inc    $84                   ; 5
LFA21:
    sta    $83                   ; 3
LFA23:
    lda.wy onTheGreenFlag,Y      ; 4
    beq    LFA33                 ; 2³
LFA28:
    lsr    $84                   ; 5
    ror    $83                   ; 5
    lsr    $84                   ; 5
    ror    $83                   ; 5
    jmp    LFA4A                 ; 3
LFA33:
    lda    $84                   ; 3
    bne    LFA4A                 ; 2³
    lda    $83                   ; 3
    cmp    #$10                  ; 2
    bcs    LFA4A                 ; 2³
    lda    #$FF                  ; 2
    sta.wy onTheGreenFlag,Y      ; 5
    ldx    #7                    ; 2
    jsr    Start_New_Audio       ; 6   putting screen intro
    jmp    LFA28                 ; 3
LFA4A:
    ldx    $84                   ; 3   find BCD yards to the hole
    lda    StartYrds_LoTab,X     ; 4
    sta    yardsLoBCD            ; 3
    lda    StartYrds_HiTab,X     ; 4
    sta    yardsHiBCD            ; 3
    lda    $83                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    AdjustYrds_LoTab,X    ; 4
    sta    $8D                   ; 3
    lda    AdjustYrds_HiTab,X    ; 4
    sta    $8E                   ; 3
    lda    $83                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    BCD_Tab,X             ; 4   load 0 - 15
    sed                          ; 2
    clc                          ; 2
    adc    yardsLoBCD            ; 3   and add to the low BCD byte of yards to hole
    sta    yardsLoBCD            ; 3
    lda    yardsHiBCD            ; 3
    adc    #0                    ; 2   if over 99 yards increase high BCD byte
    sta    yardsHiBCD            ; 3
    lda    yardsLoBCD            ; 3
    adc    $8D                   ; 3
    sta    yardsLoBCD            ; 3
    lda    yardsHiBCD            ; 3
    adc    $8E                   ; 3
    sta    yardsHiBCD            ; 3
    cld                          ; 2
    rts                          ; 6

;-------------------------------------

LFA89 SUBROUTINE
    lda    yardsHiBCD            ; 3
    bne    LFA9D                 ; 2³
    lda    #$0A                  ; 2   this is not BCD??
    sta    yardsHiBCD            ; 3
    lda    yardsLoBCD            ; 3
    and    #$F0                  ; 2
    bne    LFA9D                 ; 2³
    lda    yardsLoBCD            ; 3
    ora    #$A0                  ; 2
    sta    yardsLoBCD            ; 3
LFA9D:
    rts                          ; 6

;-------------------------------------

LFA9E:
    .byte $00 ; |        | $FA9E
    .byte $80 ; |X       | $FA9F
    .byte $00 ; |        | $FAA0
    .byte $80 ; |X       | $FAA1
LFAA2:
    .byte $00 ; |        | $FAA2
    .byte $00 ; |        | $FAA3
    .byte $01 ; |       X| $FAA4
    .byte $01 ; |       X| $FAA5

StartYrds_LoTab:
    .byte  $00   ; 00|00    adding 256 in BCD,
    .byte  $56   ; 02|56    this table is for the last two numbers
    .byte  $12   ; 05|12
    .byte  $68   ; 07|68
StartYrds_HiTab:
    .byte  $00   ; 00|00    adding 256 in BCD,
    .byte  $02   ; 02|56    this table is for the first two numbers
    .byte  $05   ; 05|12
    .byte  $07   ; 07|68

AdjustYrds_LoTab:
    .byte  $00   ; 00|00    adding 16 in BCD,
    .byte  $16   ; 00|16    this table is for the last two numbers
    .byte  $32   ; 00|32
    .byte  $48   ; 00|48
    .byte  $64   ; 00|64
    .byte  $80   ; 00|80
    .byte  $96   ; 00|96
    .byte  $12   ; 01|12
    .byte  $28   ; 01|28
    .byte  $44   ; 01|44
    .byte  $60   ; 01|60
    .byte  $76   ; 01|76
    .byte  $92   ; 01|92
    .byte  $08   ; 02|08
    .byte  $24   ; 02|24
    .byte  $40   ; 02|40

AdjustYrds_HiTab:
    .byte  $00   ; 00|00    adding 16 in BCD,
    .byte  $00   ; 00|16    this table is for the first two numbers
    .byte  $00   ; 00|32
    .byte  $00   ; 00|48
    .byte  $00   ; 00|64
    .byte  $00   ; 00|80
    .byte  $00   ; 00|96
    .byte  $01   ; 01|12
    .byte  $01   ; 01|28
    .byte  $01   ; 01|44
    .byte  $01   ; 01|60
    .byte  $01   ; 01|76
    .byte  $01   ; 01|92
    .byte  $02   ; 02|08
    .byte  $02   ; 02|24
    .byte  $02   ; 02|40

BCD_Tab:
;BCD table 0 - 15
    .byte  $00
    .byte  $01
    .byte  $02
    .byte  $03
    .byte  $04
    .byte  $05
    .byte  $06
    .byte  $07
    .byte  $08
    .byte  $09
    .byte  $10
    .byte  $11
    .byte  $12
    .byte  $13
    .byte  $14
    .byte  $15

;-------------------------------------

LFADE SUBROUTINE
    ldx    oneOrZero             ; 3
    lda    ball_Vert,X           ; 4    get the ball vertical
    sta    $86                   ; 3
    ldx    #0                    ; 2
    stx    $84                   ; 3
.loopGetBallZone:
    lda    zoneObjects,X         ; 4    start with $D4
    and    #$1F                  ; 2
    tay                          ; 2
    lda    $84                   ; 3
    clc                          ; 2
    adc    ZoneHeight_Tab,Y      ; 4    add up height from table
    adc    #5                    ; 2    plus 5
    sta    $84                   ; 3
    cmp    $86                   ; 3    and compare it to the ball vertical postion
    bcs    LFB00                 ; 2³   leave if we are higher then the ball
    inx                          ; 2
    cpx    #7                    ; 2    otherwise go the next zone
    bne    .loopGetBallZone      ; 2³
LFB00:
    stx    $83                   ; 3    zone number
    sec                          ; 2
    sbc    $86                   ; 3    zone height
    sta    $85                   ; 3    zone height - ball vert = hazard height?
    rts                          ; 6

;-------------------------------------

LFB08 SUBROUTINE
    cpy    #$19                  ; 2
    bne    LFB1A                 ; 2³
    lda    $85                   ; 3
    cmp    #9                    ; 2
    bcc    LFB17                 ; 2³
    cmp    #$13                  ; 2
    bcc    .setCarry             ; 2³
.clearCarry:
    clc                          ; 2
LFB17:
    rts                          ; 6

.setCarry:
    sec                          ; 2
    rts                          ; 6

LFB1A:
    cpy    #$1B                  ; 2
    beq    LFB26                 ; 2³
    lda    $85                   ; 3
    cmp    #$15                  ; 2
    bcc    .setCarry             ; 2³
    bcs    .clearCarry           ; 3   always branch
LFB26:
    lda    $85                   ; 3
    cmp    #5                    ; 2
    bcc    LFB2E                 ; 2³
    sec                          ; 2
    rts                          ; 6

LFB2E:
    ldx    $83                   ; 3
    inx                          ; 2
    lda    zoneObjects,X         ; 4
    and    #$1F                  ; 2
    cmp    #$1B                  ; 2
    beq    .setCarry             ; 2³
    bne    .clearCarry           ; 3   always branch

;-------------------------------------

Update_Score SUBROUTINE
    ldx    oneOrZero             ; 3
    sed                          ; 2
    lda    playerScoreLo,X       ; 4
    clc                          ; 2
    adc    #1                    ; 2
    sta    playerScoreLo,X       ; 4
    lda    playerScoreHi,X       ; 4
    adc    #0                    ; 2
    sta    playerScoreHi,X       ; 4
    lda    numOfStrokes,X        ; 4
    clc                          ; 2
    adc    #1                    ; 2
    sta    numOfStrokes,X        ; 4   update strokes as well
    cld                          ; 2
    rts                          ; 6

;-------------------------------------

LFB54 SUBROUTINE
    lda    #4                    ; 2
    sta    arrowDirection        ; 3
    lda    $F4                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    $86                   ; 3
    lda    $F4                   ; 3
    sec                          ; 2
    sbc    $86                   ; 3
    cmp    $F5                   ; 3
    bcc    LFB83                 ; 2³
    inc    arrowDirection        ; 5
    lda    $F4                   ; 3
    lsr                          ; 2
    cmp    $F5                   ; 3
    bcc    LFB83                 ; 2³
    inc    arrowDirection        ; 5
    lda    $F4                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    cmp    $F5                   ; 3
    bcc    LFB83                 ; 2³
    inc    arrowDirection        ; 5
    lsr                          ; 2
    cmp    $F5                   ; 3
    bcc    LFB83                 ; 2³
    inc    arrowDirection        ; 5
LFB83:
    rts                          ; 6

;-------------------------------------

LFB84 SUBROUTINE
    lda    arrowFlag             ; 3
    beq    LFB83                 ; 2³   this return is shared with the previous subroutine
    cmp    #1                    ; 2
    beq    LFB9C                 ; 2³
    cmp    #2                    ; 2
    beq    LFB98                 ; 2³
    lda    arrowDirection        ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    arrowDirection        ; 3
    rts                          ; 6

LFB98:
    lda    #$10                  ; 2
    bne    LFB9E                 ; 3  always branch

LFB9C:
    lda    #$20                  ; 2
LFB9E:
    sec                          ; 2
    sbc    arrowDirection        ; 3
    sta    arrowDirection        ; 3
    rts                          ; 6

;-------------------------------------

LFBA4 SUBROUTINE
    ldy    oneOrZero             ; 3
    ldx    holeNumber            ; 3
    lda.wy ball_Horz,Y           ; 4
    sec                          ; 2
    sbc    Hole_Hpos_Tab,X       ; 4
    bcc    LFBBC                 ; 2³
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    #$48                  ; 2
    sta.wy ball_Horz,Y           ; 5
    jmp    LFBCF                 ; 3

LFBBC:
    lda    Hole_Hpos_Tab,X       ; 4
    sec                          ; 2
    sbc.wy ball_Horz,Y           ; 4
    asl                          ; 2
    asl                          ; 2
    sta    $83                   ; 3
    lda    #$48                  ; 2
    sec                          ; 2
    sbc    $83                   ; 3
    sta.wy ball_Horz,Y           ; 5
LFBCF:
    lda.wy ball_Vert,Y           ; 4
    sec                          ; 2
    sbc    Hole_Vpos_Tab,X       ; 4
    bcc    LFBE3                 ; 2³
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    #$40                  ; 2
    sta.wy ball_Vert,Y           ; 5
    jmp    LFBF6                 ; 3
LFBE3:
    lda    Hole_Vpos_Tab,X       ; 4
    sec                          ; 2
    sbc.wy ball_Vert,Y           ; 4
    asl                          ; 2
    asl                          ; 2
    sta    $83                   ; 3
    lda    #$40                  ; 2
    sec                          ; 2
    sbc    $83                   ; 3
    sta.wy ball_Vert,Y           ; 5
LFBF6:
    rts                          ; 6

;-------------------------------------

    lda    audioCount            ; 3   $FBF7 has no label... maybe unused or indirect jumped
    bne    LFBF6                 ; 2³

Start_New_Audio SUBROUTINE

    lda    Audio_Index_Tab,X     ; 4   X is 0 - 8
    sta    audioTabIndex         ; 3
    lda    #1                    ; 2
    sta    audioCount            ; 3   don't exit before we even begin...
Check_Audio SUBROUTINE
    lda    audioCount            ; 3   holds a count for audio time
    beq    .exitAudio            ; 2³
    dec    audioCount            ; 5
    bne    .exitAudio            ; 2³
    ldx    audioTabIndex         ; 3
    inc    audioTabIndex         ; 5
    lda    Frame_Freq_Tab,X      ; 4
    pha                          ; 3
    and    #$0F                  ; 2   Stella's lowest 16 frequencies are not used in this game
    sta    AUDF0                 ; 3
    pla                          ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    audioCount            ; 3
    lda    Vol_Tone_Tab,X        ; 4
    pha                          ; 3
    sta    AUDC0                 ; 3
    pla                          ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDV0                 ; 3
.exitAudio:
    rts                          ; 6

;-------------------------------------

Audio_Index_Tab:
;X offsets used to lookup audio tables
    .byte   0 ;    (0)
    .byte   2 ;    (1)
    .byte   5 ;    (2)
    .byte  10 ;    (3)  remove ball frome water
    .byte  13 ;    (4)  remove ball from tree, landed in a sand trap
    .byte  16 ;    (5)  up or down
    .byte  18 ;    (6)  firebutton
    .byte  20 ;    (7)  putting screen intro
    .byte  25 ;    (8)

;-------------------------------------

Vol_Tone_Tab:
    .byte      VOL_5 | TONE_9       ; (0)
    .byte     NO_VOL | TONE_1

    .byte      VOL_7 | TONE_13      ; (1)
    .byte      VOL_6 | TONE_15
    .byte     NO_VOL | TONE_1

    .byte      VOL_8 | TONE_5       ; (2)
    .byte     VOL_10 | TONE_5
    .byte     VOL_12 | TONE_5
    .byte     VOL_14 | TONE_5
    .byte     NO_VOL | TONE_1
;remove ball from water
    .byte     VOL_15 | TONE_15      ; (3)
    .byte      VOL_8 | TONE_10
    .byte     NO_VOL | TONE_1
;remove ball from tree, landed in a sand trap
    .byte      VOL_8 | TONE_7       ; (4)
    .byte     VOL_12 | TONE_16
    .byte     NO_VOL | TONE_1
;up or down
    .byte      VOL_4 | TONE_11      ; (5)
    .byte     NO_VOL | TONE_1
;firebutton
    .byte      VOL_2 | TONE_13      ; (6)
    .byte     NO_VOL | TONE_1
;putting screen intro
    .byte      VOL_6 | TONE_13      ; (7)
    .byte      VOL_6 | TONE_13
    .byte      VOL_6 | TONE_13
    .byte      VOL_6 | TONE_13
    .byte     NO_VOL | TONE_1

    .byte      VOL_6 | TONE_9       ; (8)
    .byte      VOL_2 | TONE_16
    .byte     NO_VOL | TONE_1

;-------------------------------------

Frame_Freq_Tab:
    .byte   FRAMES_7 | FREQ_7       ; (0)
    .byte  END_FRAME | FREQ_1

    .byte  FRAMES_10 | FREQ_9       ; (1)
    .byte   FRAMES_8 | FREQ_9
    .byte  END_FRAME | FREQ_1

    .byte   FRAMES_8 | FREQ_3       ; (2)
    .byte  FRAMES_10 | FREQ_5
    .byte  FRAMES_12 | FREQ_7
    .byte  FRAMES_14 | FREQ_9
    .byte  END_FRAME | FREQ_1
;remove ball from water
    .byte   FRAMES_6 | FREQ_15      ; (3)
    .byte   FRAMES_8 | FREQ_5
    .byte  END_FRAME | FREQ_1
;remove ball from tree, landed in a sand trap
    .byte   FRAMES_6 | FREQ_7       ; (4)
    .byte   FRAMES_6 | FREQ_13
    .byte  END_FRAME | FREQ_1
;up or down
    .byte   FRAMES_4 | FREQ_9       ; (5)
    .byte  END_FRAME | FREQ_1
;firebutton
    .byte   FRAMES_6 | FREQ_16      ; (6)
    .byte  END_FRAME | FREQ_1
;putting screen intro
    .byte   FRAMES_6 | FREQ_13      ; (7)
    .byte   FRAMES_6 | FREQ_9
    .byte   FRAMES_6 | FREQ_5
    .byte   FRAMES_6 | FREQ_1
    .byte  END_FRAME | FREQ_1

    .byte   FRAMES_4 | FREQ_13      ; (8)
    .byte   FRAMES_2 | FREQ_7
    .byte  END_FRAME | FREQ_1

;-------------------------------------



ScreenIndex:
;used to lookup the zones for each hole screen.
    .byte   0 ;  screen 1
    .byte   7 ;  screen 2           7 object "zones" are on each fairway screen
    .byte  14 ;  screen 3
    .byte  21 ;  screen 4

LFC72:
    .byte $F5 ; |XXXX X X| $FC72
    .byte $EB ; |XXX X XX| $FC73
    .byte $D2 ; |XX X  X | $FC74
    .byte $C8 ; |XX  X   | $FC75
    .byte $B9 ; |X XXX  X| $FC76
    .byte $BE ; |X XXXXX | $FC77
    .byte $B4 ; |X XX X  | $FC78
    .byte $AF ; |X X XXXX| $FC79
    .byte $A5 ; |X X  X X| $FC7A
    .byte $9B ; |X  XX XX| $FC7B
    .byte $91 ; |X  X   X| $FC7C
    .byte $87 ; |X    XXX| $FC7D
    .byte $78 ; | XXXX   | $FC7E
    .byte $69 ; | XX X  X| $FC7F
    .byte $5A ; | X XX X | $FC80
    .byte $50 ; | X X    | $FC81
    .byte $1E ; |   XXXX | $FC82


HoleNum_Display_Tab:
; used to find low nybble "pointers" to number gfx,
; i.e. the "hole number" that is displayed on screen.
    .byte     (<One * 2) | (<Blank_Digit / 8)    ; hole 1
    .byte     (<Two * 2) | (<Blank_Digit / 8)    ; hole 2      "2" is displayed, followed by a blank space...
    .byte   (<Three * 2) | (<Blank_Digit / 8)    ; hole 3
    .byte    (<Four * 2) | (<Blank_Digit / 8)    ; hole 4
    .byte    (<Five * 2) | (<Blank_Digit / 8)    ; hole 5
    .byte     (<Six * 2) | (<Blank_Digit / 8)    ; hole 6
    .byte   (<Seven * 2) | (<Blank_Digit / 8)    ; hole 7
    .byte   (<Eight * 2) | (<Blank_Digit / 8)    ; hole 8
    .byte    (<Nine * 2) | (<Blank_Digit / 8)    ; hole 9
    .byte     (<One * 2) | (<Zero / 8)           ; hole 10     after "9" a second digit needs to be shown, such as a zero in "10".
    .byte     (<One * 2) | (<One / 8)            ; hole 11
    .byte     (<One * 2) | (<Two / 8)            ; hole 12
    .byte     (<One * 2) | (<Three / 8)          ; hole 13
    .byte     (<One * 2) | (<Four / 8)           ; hole 14
    .byte     (<One * 2) | (<Five / 8)           ; hole 15
    .byte     (<One * 2) | (<Six / 8)            ; hole 16
    .byte     (<One * 2) | (<Seven / 8)          ; hole 17
    .byte     (<One * 2) | (<Eight / 8)          ; hole 18


Par_Tab:
; hole number  1  2  3  4  5  6  7  8  9  10  11  12  13  14  15  16  17  18
    .byte      4, 4, 5, 4, 3, 4, 4, 3, 5,  4,  4,  3,  4,  4,  5,  3,  5,  4


ParTotals_Tab:
;BCD table used to find if your par is under/over/even after each hole
    .byte  0
    .byte  $04 ;    par hole 1
    .byte  $08 ;    par hole 1 + par hole 2
    .byte  $13 ;    par hole 1 + par hole 2 + par hole 3
    .byte  $17 ;    etc...
    .byte  $20 ;
    .byte  $24 ;
    .byte  $28 ;
    .byte  $31 ;
    .byte  $36 ;
    .byte  $40 ;
    .byte  $44 ;
    .byte  $47 ;
    .byte  $51 ;
    .byte  $55 ;
    .byte  $60 ;
    .byte  $63 ;
    .byte  $68 ;
    .byte  $72 ;    72 par for a 18 hole golf course

ball_Horz_Tab:
    .byte  $52 ;   hole 1        golf ball intial H position
    .byte  $52 ;   hole 2
    .byte  $52 ;   hole 3
    .byte  $1C ;   hole 4
    .byte  $52 ;   hole 5
    .byte  $88 ;   hole 6
    .byte  $52 ;   hole 7
    .byte  $40 ;   hole 8
    .byte  $1C ;   hole 9
    .byte  $52 ;   hole 10
    .byte  $64 ;   hole 11
    .byte  $52 ;   hole 12
    .byte  $40 ;   hole 13
    .byte  $52 ;   hole 14
    .byte  $2E ;   hole 15
    .byte  $76 ;   hole 16
    .byte  $64 ;   hole 17
    .byte  $52 ;   hole 18

LFCCC:
    .byte $00 ; |        | $FCCC   $C3 table
    .byte $1E ; |   XXXX | $FCCD
    .byte $3C ; |  XXXX  | $FCCE
    .byte $44 ; | X   X  | $FCCF
    .byte $4C ; | X  XX  | $FCD0
    .byte $4F ; | X  XXXX| $FCD1
    .byte $52 ; | X X  X | $FCD2
    .byte $54 ; | X X X  | $FCD3
    .byte $56 ; | X X XX | $FCD4
    .byte $54 ; | X X X  | $FCD5
    .byte $52 ; | X X  X | $FCD6
    .byte $4F ; | X  XXXX| $FCD7
    .byte $4C ; | X  XX  | $FCD8
    .byte $44 ; | X   X  | $FCD9
    .byte $3C ; |  XXXX  | $FCDA
    .byte $1E ; |   XXXX | $FCDB
    .byte $00 ; |        | $FCDC
    .byte $E2 ; |XXX   X | $FCDD
    .byte $C4 ; |XX   X  | $FCDE
    .byte $BC ; |X XXXX  | $FCDF
    .byte $B4 ; |X XX X  | $FCE0
    .byte $B1 ; |X XX   X| $FCE1
    .byte $AE ; |X X XXX | $FCE2
    .byte $AC ; |X X XX  | $FCE3
    .byte $AA ; |X X X X | $FCE4
    .byte $AC ; |X X XX  | $FCE5
    .byte $AE ; |X X XXX | $FCE6
    .byte $B1 ; |X XX   X| $FCE7
    .byte $B4 ; |X XX X  | $FCE8
    .byte $BC ; |X XXXX  | $FCE9
    .byte $C4 ; |XX   X  | $FCEA
    .byte $E2 ; |XXX   X | $FCEB
LFCEC:
    .byte $00 ; |        | $FCEC   $C2 table
    .byte $00 ; |        | $FCED
    .byte $00 ; |        | $FCEE
    .byte $00 ; |        | $FCEF
    .byte $00 ; |        | $FCF0
    .byte $00 ; |        | $FCF1
    .byte $00 ; |        | $FCF2
    .byte $00 ; |        | $FCF3
LFCF4:
    .byte $00 ; |        | $FCF4   $C4 table
    .byte $00 ; |        | $FCF5
    .byte $00 ; |        | $FCF6
    .byte $00 ; |        | $FCF7
    .byte $00 ; |        | $FCF8
    .byte $00 ; |        | $FCF9
    .byte $00 ; |        | $FCFA
    .byte $00 ; |        | $FCFB
    .byte $00 ; |        | $FCFC
    .byte $FF ; |XXXXXXXX| $FCFD
    .byte $FF ; |XXXXXXXX| $FCFE
    .byte $FF ; |XXXXXXXX| $FCFF
    .byte $FF ; |XXXXXXXX| $FD00
    .byte $FF ; |XXXXXXXX| $FD01
    .byte $FF ; |XXXXXXXX| $FD02
    .byte $FF ; |XXXXXXXX| $FD03
    .byte $FF ; |XXXXXXXX| $FD04
    .byte $FF ; |XXXXXXXX| $FD05
    .byte $FF ; |XXXXXXXX| $FD06
    .byte $FF ; |XXXXXXXX| $FD07
    .byte $FF ; |XXXXXXXX| $FD08
    .byte $FF ; |XXXXXXXX| $FD09
    .byte $FF ; |XXXXXXXX| $FD0A
    .byte $FF ; |XXXXXXXX| $FD0B
LFD0C:
    .byte $00 ; |        | $FD0C
    .byte $00 ; |        | $FD0D
    .byte $00 ; |        | $FD0E
    .byte $00 ; |        | $FD0F
    .byte $00 ; |        | $FD10
    .byte $00 ; |        | $FD11
    .byte $00 ; |        | $FD12
    .byte $00 ; |        | $FD13
    .byte $FF ; |XXXXXXXX| $FD14
    .byte $FA ; |XXXXX X | $FD15
    .byte $FA ; |XXXXX X | $FD16
    .byte $FA ; |XXXXX X | $FD17
    .byte $FA ; |XXXXX X | $FD18
    .byte $FA ; |XXXXX X | $FD19
    .byte $FA ; |XXXXX X | $FD1A
    .byte $FA ; |XXXXX X | $FD1B
    .byte $FA ; |XXXXX X | $FD1C
    .byte $FA ; |XXXXX X | $FD1D
    .byte $FA ; |XXXXX X | $FD1E
    .byte $FA ; |XXXXX X | $FD1F
    .byte $FA ; |XXXXX X | $FD20
    .byte $FA ; |XXXXX X | $FD21
    .byte $FA ; |XXXXX X | $FD22
    .byte $FA ; |XXXXX X | $FD23
    .byte $FB ; |XXXXX XX| $FD24

SwitchDirection_Tab:
    .byte  NO_HORIZ_FLIP | NO_VERT_FLIP   ; $FD25
    .byte  NO_HORIZ_FLIP | NO_VERT_FLIP   ; $FD26
    .byte  NO_HORIZ_FLIP | NO_VERT_FLIP   ; $FD27
    .byte  NO_HORIZ_FLIP | NO_VERT_FLIP   ; $FD28
    .byte  NO_HORIZ_FLIP | NO_VERT_FLIP   ; $FD29
    .byte  NO_HORIZ_FLIP | NO_VERT_FLIP   ; $FD2A
    .byte  NO_HORIZ_FLIP | NO_VERT_FLIP   ; $FD2B
    .byte  NO_HORIZ_FLIP | NO_VERT_FLIP   ; $FD2C
    .byte  NO_HORIZ_FLIP | NO_VERT_FLIP   ; $FD2D
    .byte     HORIZ_FLIP | NO_VERT_FLIP   ; $FD2E
    .byte     HORIZ_FLIP | NO_VERT_FLIP   ; $FD2F
    .byte     HORIZ_FLIP | NO_VERT_FLIP   ; $FD30
    .byte     HORIZ_FLIP | NO_VERT_FLIP   ; $FD31
    .byte     HORIZ_FLIP | NO_VERT_FLIP   ; $FD32
    .byte     HORIZ_FLIP | NO_VERT_FLIP   ; $FD33
    .byte     HORIZ_FLIP | NO_VERT_FLIP   ; $FD34
    .byte     HORIZ_FLIP | NO_VERT_FLIP   ; $FD35
    .byte     HORIZ_FLIP | VERT_FLIP      ; $FD36
    .byte     HORIZ_FLIP | VERT_FLIP      ; $FD37
    .byte     HORIZ_FLIP | VERT_FLIP      ; $FD38
    .byte     HORIZ_FLIP | VERT_FLIP      ; $FD39
    .byte     HORIZ_FLIP | VERT_FLIP      ; $FD3A
    .byte     HORIZ_FLIP | VERT_FLIP      ; $FD3B
    .byte     HORIZ_FLIP | VERT_FLIP      ; $FD3C
    .byte     HORIZ_FLIP | VERT_FLIP      ; $FD3D
    .byte  NO_HORIZ_FLIP | VERT_FLIP      ; $FD3E
    .byte  NO_HORIZ_FLIP | VERT_FLIP      ; $FD3F
    .byte  NO_HORIZ_FLIP | VERT_FLIP      ; $FD40
    .byte  NO_HORIZ_FLIP | VERT_FLIP      ; $FD41
    .byte  NO_HORIZ_FLIP | VERT_FLIP      ; $FD42
    .byte  NO_HORIZ_FLIP | VERT_FLIP      ; $FD43
    .byte  NO_HORIZ_FLIP | VERT_FLIP      ; $FD44

LFD45:
    .byte $AA ; |X X X X | $FD45   $C5 table
    .byte $91 ; |X  X   X| $FD46
    .byte $78 ; | XXXX   | $FD47
    .byte $62 ; | XX   X | $FD48
    .byte $4C ; | X  XX  | $FD49
    .byte $3A ; |  XXX X | $FD4A
    .byte $29 ; |  X X  X| $FD4B
    .byte $14 ; |   X X  | $FD4C
    .byte $00 ; |        | $FD4D
    .byte $EC ; |XXX XX  | $FD4E
    .byte $D7 ; |XX X XXX| $FD4F
    .byte $C5 ; |XX   X X| $FD50
    .byte $B4 ; |X XX X  | $FD51
    .byte $9E ; |X  XXXX | $FD52
    .byte $88 ; |X   X   | $FD53
    .byte $6F ; | XX XXXX| $FD54
    .byte $56 ; | X X XX | $FD55
    .byte $6F ; | XX XXXX| $FD56
    .byte $88 ; |X   X   | $FD57
    .byte $9E ; |X  XXXX | $FD58
    .byte $B4 ; |X XX X  | $FD59
    .byte $C5 ; |XX   X X| $FD5A
    .byte $D7 ; |XX X XXX| $FD5B
    .byte $EC ; |XXX XX  | $FD5C
    .byte $00 ; |        | $FD5D
    .byte $14 ; |   X X  | $FD5E
    .byte $29 ; |  X X  X| $FD5F
    .byte $3A ; |  XXX X | $FD60
    .byte $4C ; | X  XX  | $FD61
    .byte $62 ; | XX   X | $FD62
    .byte $78 ; | XXXX   | $FD63
    .byte $91 ; |X  X   X| $FD64

LFD65:
    .byte $00 ;   $FD65   this table affects how
    .byte $02 ;   $FD66   the wind moves the ball
    .byte $04 ;   $FD67
    .byte $08 ;   $FD68
    .byte $0C ;   $FD69
    .byte $10 ;   $FD6A
    .byte $18 ;   $FD6B
    .byte $20 ;   $FD6C
    .byte $30 ;   $FD6D

LFD6E:
    .byte $0F ; |    XXXX| $FD6E
    .byte $07 ; |     XXX| $FD6F
    .byte $03 ; |      XX| $FD70
    .byte $01 ; |       X| $FD71
    .byte $01 ; |       X| $FD72
    .byte $01 ; |       X| $FD73
    .byte $01 ; |       X| $FD74
    .byte $01 ; |       X| $FD75

HoleStartLoPtrs:
    .byte <Hole_1_One
    .byte <Hole_2_One
    .byte <Hole_3_One
    .byte <Hole_4_One
    .byte <Hole_5_One
    .byte <Hole_6_One
    .byte <Hole_7_One
    .byte <Hole_8_One
    .byte <Hole_9_One
    .byte <Hole_10_One
    .byte <Hole_11_One
    .byte <Hole_12_One
    .byte <Hole_13_One
    .byte <Hole_14_One
    .byte <Hole_15_One
    .byte <Hole_16_One
    .byte <Hole_17_One
    .byte <Hole_18_One

HoleStartHiPtrs:
    .byte >Hole_1_One
    .byte >Hole_2_One
    .byte >Hole_3_One
    .byte >Hole_4_One
    .byte >Hole_5_One
    .byte >Hole_6_One
    .byte >Hole_7_One
    .byte >Hole_8_One
    .byte >Hole_9_One
    .byte >Hole_10_One
    .byte >Hole_11_One
    .byte >Hole_12_One
    .byte >Hole_13_One
    .byte >Hole_14_One
    .byte >Hole_15_One
    .byte >Hole_16_One
    .byte >Hole_17_One
    .byte >Hole_18_One

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      HOLE SCREENS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Hole_1_One:
    .byte  CYCLES_47 | TEE_BOX        ;  +2
    .byte  CYCLES_35 | TREE_2_CLOSE   ; +12
    .byte  CYCLES_29 | TREE_3_MED     ; +12
    .byte  CYCLES_53 | TREE_2_CLOSE   ; +12
    .byte  CYCLES_23 | STREAM         ; +20
    .byte  CYCLES_35 | ROUGH_AREA     ; +16
    .byte  CYCLES_65 | SAND_2_MED     ; +10    height = 84 ($54)
Hole_1_Two:
    .byte  CYCLES_29 | LARGE_WATER    ; +18
    .byte  CYCLES_53 | LARGE_WATER    ; +18
    .byte  CYCLES_23 | TINY_FIELD     ;  +1
    .byte  CYCLES_47 | LARGE_SAND     ; +16
    .byte  CYCLES_29 | WATER_1        ; +11
    .byte  CYCLES_35 | WATER_2_WIDE   ; +11
    .byte  CYCLES_59 | SAND_2_CLOSE   ; +10    height = 85 ($55)
Hole_1_Three:
    .byte  CYCLES_29 | TREE_3_MED     ; +12
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_47 | LARGE_SAND     ; +16
    .byte  CYCLES_47 | GREEN_AREA     ; +25
    .byte  CYCLES_47 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_47 | ROUGH_AREA     ; +16
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8    height = 93 ($5D)

Hole_2_One:
    .byte  CYCLES_47 | TEE_BOX        ;  +2
    .byte  CYCLES_29 | LARGE_TREE     ; +21
    .byte  CYCLES_53 | LARGE_TREE     ; +21
    .byte  CYCLES_47 | WATER_1        ; +11
    .byte  CYCLES_65 | TREE_2_MED     ; +12
    .byte  CYCLES_41 | SAND_2_MED     ; +10
    .byte  CYCLES_29 | SAND_1         ; +10    height = 87 ($57)
Hole_2_Two:
    .byte  CYCLES_65 | TREE_2_MED     ; +12
    .byte  CYCLES_29 | TREE_1         ; +12
    .byte  CYCLES_35 | TREE_2_CLOSE   ; +12
    .byte  CYCLES_41 | TREE_2_MED     ; +12
    .byte  CYCLES_47 | WATER_1        ; +11
    .byte  CYCLES_53 | TREE_1         ; +12
    .byte  CYCLES_59 | TREE_2_CLOSE   ; +12    height = 83 ($53)
Hole_2_Three:
    .byte  CYCLES_23 | STREAM         ; +20
    .byte  CYCLES_35 | GREEN_AREA     ; +25
    .byte  CYCLES_23 | STREAM         ; +20
    .byte  CYCLES_41 | ROUGH_AREA     ; +16
    .byte  CYCLES_23 | TINY_FIELD     ;  +1
    .byte  CYCLES_23 | TINY_FIELD     ;  +1
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8    height = 91 ($5B)

Hole_3_One:
    .byte  CYCLES_47 | TEE_BOX        ;  +2
    .byte  CYCLES_29 | LARGE_TREE     ; +21
    .byte  CYCLES_35 | LARGE_TREE     ; +21
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_41 | LARGE_TREE     ; +21
    .byte  CYCLES_53 | TREE_3_CLOSE   ; +12
    .byte  CYCLES_29 | TREE_2_MED     ; +12    height = 93 ($5D)
Hole_3_Two:
    .byte  CYCLES_29 | SAND_3_CLOSE   ; +10
    .byte  CYCLES_53 | WATER_3_CLOSE  ; +11
    .byte  CYCLES_35 | SAND_3_CLOSE   ; +10
    .byte  CYCLES_23 | STREAM         ; +20
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_65 | WATER_1        ; +11
    .byte  CYCLES_35 | TREE_2_CLOSE   ; +12    height = 78 ($4E)
Hole_3_Three:
    .byte  CYCLES_35 | ROUGH_AREA     ; +16
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_47 | LARGE_SAND     ; +16
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_29 | LARGE_SAND     ; +16
    .byte  CYCLES_53 | TREE_2_WIDE    ; +12
    .byte  CYCLES_23 | TINY_FIELD     ;  +1    height = 77 ($4D)
Hole_3_Four:
    .byte  CYCLES_41 | ROUGH_AREA     ; +16
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_35 | LARGE_SAND     ; +16
    .byte  CYCLES_35 | GREEN_AREA     ; +25
    .byte  CYCLES_29 | LARGE_TREE     ; +21
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | TINY_FIELD     ;  +1    height = 95 ($5F)

Hole_4_One:
    .byte  CYCLES_29 | TEE_BOX        ;  +2
    .byte  CYCLES_23 | LONG_FIELD     ; +16
    .byte  CYCLES_41 | TREE_3_CLOSE   ; +12
    .byte  CYCLES_23 | RIVERS_EDGE    ; +16
    .byte  CYCLES_23 | WIDE_RIVER     ; +16
    .byte  CYCLES_23 | WIDE_RIVER     ; +16
    .byte  CYCLES_29 | LARGE_SAND     ; +16    height = 94 ($5E)
Hole_4_Two:
    .byte  CYCLES_53 | LARGE_SAND     ; +16
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | RIVERS_EDGE    ; +16
    .byte  CYCLES_23 | WIDE_RIVER     ; +16
    .byte  CYCLES_23 | WIDE_RIVER     ; +16
    .byte  CYCLES_35 | LARGE_SAND     ; +16
    .byte  CYCLES_23 | TINY_FIELD     ;  +1    height = 89 ($59)
Hole_4_Three:
    .byte  CYCLES_23 | TINY_FIELD     ;  +1
    .byte  CYCLES_23 | RIVERS_EDGE    ; +16
    .byte  CYCLES_23 | WIDE_RIVER     ; +16
    .byte  CYCLES_29 | GREEN_AREA     ; +25
    .byte  CYCLES_23 | RIVERS_EDGE    ; +16
    .byte  CYCLES_35 | TREE_1         ; +12
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4    height = 90 ($5A)

Hole_5_One:
    .byte  CYCLES_47 | TEE_BOX        ;  +2
    .byte  CYCLES_29 | ROUGH_AREA     ; +16
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_35 | ROUGH_AREA     ; +16
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_59 | TREE_2_WIDE    ; +12
    .byte  CYCLES_29 | ROUGH_AREA     ; +16    height = 78 ($4E)
Hole_5_Two:
    .byte  CYCLES_59 | LARGE_TREE     ; +21
    .byte  CYCLES_35 | LARGE_SAND     ; +16
    .byte  CYCLES_29 | GREEN_AREA     ; +25
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8    height = 94 ($5E)

Hole_6_One:
    .byte  CYCLES_65 | TEE_BOX        ;  +2
    .byte  CYCLES_23 | LONG_FIELD     ; +16
    .byte  CYCLES_47 | LARGE_WATER    ; +18
    .byte  CYCLES_29 | WATER_2_WIDE   ; +11
    .byte  CYCLES_35 | WATER_2_MED    ; +11
    .byte  CYCLES_41 | TREE_2_WIDE    ; +12
    .byte  CYCLES_65 | TREE_3_MED     ; +12    height = 82 ($52)
Hole_6_Two:
    .byte  CYCLES_59 | TREE_2_WIDE    ; +12
    .byte  CYCLES_35 | TREE_2_WIDE    ; +12
    .byte  CYCLES_41 | WATER_2_WIDE   ; +11
    .byte  CYCLES_23 | STREAM         ; +20
    .byte  CYCLES_23 | WATER_2_WIDE   ; +11
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_35 | TREE_3_CLOSE   ; +12    height = 86 ($56)
Hole_6_Three:
    .byte  CYCLES_29 | WATER_3_MED    ; +11
    .byte  CYCLES_65 | SAND_3_MED     ; +10
    .byte  CYCLES_23 | TINY_FIELD     ;  +1
    .byte  CYCLES_35 | GREEN_AREA     ; +25
    .byte  CYCLES_29 | TREE_2_MED     ; +12
    .byte  CYCLES_35 | TREE_2_MED     ; +12
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4    height = 75 ($4B)

Hole_7_One:
    .byte  CYCLES_47 | TEE_BOX        ;  +2
    .byte  CYCLES_35 | SAND_1         ; +10
    .byte  CYCLES_41 | SAND_1         ; +10
    .byte  CYCLES_29 | SAND_2_CLOSE   ; +10
    .byte  CYCLES_23 | STREAM         ; +20
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_41 | LARGE_SAND     ; +16    height = 76 ($4C)
Hole_7_Two:
    .byte  CYCLES_41 | TREE_3_CLOSE   ; +12
    .byte  CYCLES_23 | RIVERS_EDGE    ; +16
    .byte  CYCLES_23 | WIDE_RIVER     ; +16
    .byte  CYCLES_23 | WIDE_RIVER     ; +16
    .byte  CYCLES_23 | WIDE_RIVER     ; +16
    .byte  CYCLES_23 | TINY_FIELD     ;  +1
    .byte  CYCLES_47 | TREE_1         ; +12    height = 89 ($59)
Hole_7_Three:
    .byte  CYCLES_35 | SAND_3_MED     ; +10
    .byte  CYCLES_23 | RIVERS_EDGE    ; +16
    .byte  CYCLES_23 | WIDE_RIVER     ; +16
    .byte  CYCLES_23 | WIDE_RIVER     ; +16
    .byte  CYCLES_23 | TINY_FIELD     ;  +1
    .byte  CYCLES_53 | GREEN_AREA     ; +25
    .byte  CYCLES_23 | TINY_FIELD     ;  +1    height = 85 ($55)

Hole_8_One:
    .byte  CYCLES_41 | TEE_BOX        ;  +2
    .byte  CYCLES_23 | TINY_FIELD     ;  +1
    .byte  CYCLES_23 | TINY_FIELD     ;  +1
    .byte  CYCLES_29 | LARGE_TREE     ; +21
    .byte  CYCLES_53 | LARGE_SAND     ; +16
    .byte  CYCLES_47 | LARGE_SAND     ; +16
    .byte  CYCLES_47 | GREEN_AREA     ; +25    height = 82 ($52)

Hole_9_One:
    .byte  CYCLES_29 | TEE_BOX        ;  +2
    .byte  CYCLES_23 | LONG_FIELD     ; +16
    .byte  CYCLES_23 | LONG_FIELD     ; +16
    .byte  CYCLES_35 | ROUGH_AREA     ; +16
    .byte  CYCLES_23 | LONG_FIELD     ; +16
    .byte  CYCLES_23 | LONG_FIELD     ; +16
    .byte  CYCLES_23 | TINY_FIELD     ;  +1    height = 83 ($53)
Hole_9_Two:
    .byte  CYCLES_59 | LARGE_TREE     ; +21
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_53 | LARGE_TREE     ; +21
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_47 | LARGE_TREE     ; +21
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_41 | LARGE_TREE     ; +21    height = 96 ($60)
Hole_9_Three:
    .byte  CYCLES_41 | LARGE_TREE     ; +21
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_47 | LARGE_TREE     ; +21
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_53 | LARGE_TREE     ; +21
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_59 | LARGE_TREE     ; +21    height = 96 ($60)
Hole_9_Four:
    .byte  CYCLES_35 | LARGE_TREE     ; +21
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_29 | LARGE_TREE     ; +21
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_35 | GREEN_AREA     ; +25
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8    height = 91 ($5B)

Hole_10_One:
    .byte  CYCLES_47 | TEE_BOX        ;  +2
    .byte  CYCLES_59 | TREE_1         ; +12
    .byte  CYCLES_47 | LARGE_WATER    ; +18
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_53 | LARGE_WATER    ; +18
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_47 | TREE_1         ; +12    height = 78 ($4E)
Hole_10_Two:
    .byte  CYCLES_59 | TREE_2_WIDE    ; +12
    .byte  CYCLES_29 | SAND_2_MED     ; +10
    .byte  CYCLES_23 | STREAM         ; +20
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_35 | WATER_2_MED    ; +11
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8    height = 77 ($4D)
Hole_10_Three:
    .byte  CYCLES_35 | TREE_1         ; +12
    .byte  CYCLES_41 | TREE_1         ; +12
    .byte  CYCLES_35 | GREEN_AREA     ; +25
    .byte  CYCLES_47 | TREE_1         ; +12
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8    height = 85 ($55)

Hole_11_One:
    .byte  CYCLES_53 | TEE_BOX        ;  +2
    .byte  CYCLES_23 | RIVERS_EDGE    ; +16
    .byte  CYCLES_23 | WIDE_RIVER     ; +16
    .byte  CYCLES_23 | WIDE_RIVER     ; +16
    .byte  CYCLES_23 | WIDE_RIVER     ; +16
    .byte  CYCLES_41 | GREEN_AREA     ; +25
    .byte  CYCLES_23 | TINY_FIELD     ;  +1    height = 92 ($5C)

Hole_12_One:
    .byte  CYCLES_47 | TEE_BOX        ;  +2
    .byte  CYCLES_23 | LONG_FIELD     ; +16
    .byte  CYCLES_23 | LONG_FIELD     ; +16
    .byte  CYCLES_35 | ROUGH_AREA     ; +16
    .byte  CYCLES_23 | LONG_FIELD     ; +16
    .byte  CYCLES_23 | LONG_FIELD     ; +16
    .byte  CYCLES_23 | TINY_FIELD     ;  +1    height = 83 ($53)
Hole_12_Two:
    .byte  CYCLES_23 | LONG_FIELD     ; +16
    .byte  CYCLES_29 | ROUGH_AREA     ; +16
    .byte  CYCLES_23 | LONG_FIELD     ; +16
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_47 | LARGE_TREE     ; +21
    .byte  CYCLES_23 | TINY_FIELD     ;  +1
    .byte  CYCLES_23 | TINY_FIELD     ;  +1    height = 75 ($4B)
Hole_12_Three:
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | LONG_FIELD     ; +16
    .byte  CYCLES_35 | GREEN_AREA     ; +25
    .byte  CYCLES_41 | ROUGH_AREA     ; +16
    .byte  CYCLES_23 | TINY_FIELD     ;  +1
    .byte  CYCLES_23 | TINY_FIELD     ;  +1    height = 75 ($4B)

Hole_13_One:
    .byte  CYCLES_41 | TEE_BOX        ;  +2
    .byte  CYCLES_23 | TREE_2_CLOSE   ; +12
    .byte  CYCLES_35 | TREE_2_WIDE    ; +12
    .byte  CYCLES_47 | WATER_2_CLOSE  ; +11
    .byte  CYCLES_41 | WATER_3_CLOSE  ; +11
    .byte  CYCLES_35 | ROUGH_AREA     ; +16
    .byte  CYCLES_59 | WATER_2_CLOSE  ; +11    height = 75 ($4B)
Hole_13_Two:
    .byte  CYCLES_29 | TREE_2_WIDE    ; +12
    .byte  CYCLES_23 | RIVERS_EDGE    ; +16
    .byte  CYCLES_23 | WIDE_RIVER     ; +16
    .byte  CYCLES_23 | WIDE_RIVER     ; +16
    .byte  CYCLES_35 | WATER_3_CLOSE  ; +11
    .byte  CYCLES_53 | SAND_2_WIDE    ; +10
    .byte  CYCLES_23 | TINY_FIELD     ;  +1    height = 82 ($52)
Hole_13_Three:
    .byte  CYCLES_41 | SAND_2_CLOSE   ; +10
    .byte  CYCLES_47 | SAND_2_CLOSE   ; +10
    .byte  CYCLES_53 | SAND_2_CLOSE   ; +10
    .byte  CYCLES_47 | GREEN_AREA     ; +25
    .byte  CYCLES_23 | STREAM         ; +20
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8    height = 91 ($5B)

Hole_14_One:
    .byte  CYCLES_47 | TEE_BOX        ;  +2
    .byte  CYCLES_23 | LONG_FIELD     ; +16
    .byte  CYCLES_35 | ROUGH_AREA     ; +16
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_41 | ROUGH_AREA     ; +16
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_29 | TREE_1         ; +12    height = 78 ($4E)
Hole_14_Two:
    .byte  CYCLES_29 | LARGE_SAND     ; +16
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_35 | LARGE_WATER    ; +18
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_41 | ROUGH_AREA     ; +16
    .byte  CYCLES_23 | TINY_FIELD     ;  +1
    .byte  CYCLES_47 | ROUGH_AREA     ; +16    height = 75 ($4B)
Hole_14_Three:
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_35 | LARGE_SAND     ; +16
    .byte  CYCLES_41 | LARGE_SAND     ; +16
    .byte  CYCLES_47 | LARGE_SAND     ; +16
    .byte  CYCLES_41 | GREEN_AREA     ; +25
    .byte  CYCLES_35 | LARGE_SAND     ; +16
    .byte  CYCLES_23 | TINY_FIELD     ;  +1    height = 94 ($5E)

Hole_15_One:
    .byte  CYCLES_35 | TEE_BOX        ;  +2
    .byte  CYCLES_23 | STREAM         ; +20
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_23 | STREAM         ; +20
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | STREAM         ; +20    height = 82 ($52)
Hole_15_Two:
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | STREAM         ; +20
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | STREAM         ; +20
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8    height = 80 ($50)
Hole_15_Three:
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_23 | STREAM         ; +20
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_23 | STREAM         ; +20
    .byte  CYCLES_47 | GREEN_AREA     ; +25
    .byte  CYCLES_23 | STREAM         ; +20
    .byte  CYCLES_23 | TINY_FIELD     ;  +1    height = 94 ($5E)

Hole_16_One:
    .byte  CYCLES_59 | TEE_BOX        ;  +2
    .byte  CYCLES_23 | LONG_FIELD     ; +16
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_35 | LARGE_TREE     ; +21
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_47 | LARGE_TREE     ; +21
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8    height = 84 ($54)
Hole_16_Two:
    .byte  CYCLES_23 | TINY_FIELD     ;  +1
    .byte  CYCLES_41 | LARGE_TREE     ; +21
    .byte  CYCLES_23 | TINY_FIELD     ;  +1
    .byte  CYCLES_47 | LARGE_TREE     ; +21
    .byte  CYCLES_53 | GREEN_AREA     ; +25
    .byte  CYCLES_59 | LARGE_TREE     ; +21
    .byte  CYCLES_23 | TINY_FIELD     ;  +1    height = 91 ($5B)

Hole_17_One:
    .byte  CYCLES_53 | TEE_BOX        ;  +2
    .byte  CYCLES_29 | TREE_1         ; +12
    .byte  CYCLES_35 | TREE_3_CLOSE   ; +12
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_53 | ROUGH_AREA     ; +16
    .byte  CYCLES_35 | ROUGH_AREA     ; +16
    .byte  CYCLES_35 | LARGE_SAND     ; +16    height = 82 ($52)
Hole_17_Two:
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_29 | ROUGH_AREA     ; +16
    .byte  CYCLES_35 | ROUGH_AREA     ; +16
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_35 | TREE_2_WIDE    ; +12
    .byte  CYCLES_41 | TREE_2_MED     ; +12    height = 80 ($50)
Hole_17_Three:
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_35 | LARGE_SAND     ; +16
    .byte  CYCLES_41 | LARGE_SAND     ; +16
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_41 | TREE_2_WIDE    ; +12
    .byte  CYCLES_47 | TREE_2_MED     ; +12    height = 80 ($50)
Hole_17_Four:
    .byte  CYCLES_35 | LARGE_SAND     ; +16
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_47 | LARGE_SAND     ; +16
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_29 | GREEN_AREA     ; +25
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8    height = 81 ($51)

Hole_18_One:
    .byte  CYCLES_47 | TEE_BOX        ;  +2
    .byte  CYCLES_29 | TREE_2_WIDE    ; +12
    .byte  CYCLES_41 | WATER_3_CLOSE  ; +11
    .byte  CYCLES_35 | SAND_3_CLOSE   ; +10
    .byte  CYCLES_23 | STREAM         ; +20
    .byte  CYCLES_53 | TREE_3_CLOSE   ; +12
    .byte  CYCLES_59 | SAND_2_CLOSE   ; +10    height = 77 ($4D)
Hole_18_Two:
    .byte  CYCLES_29 | LARGE_TREE     ; +21
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_35 | LARGE_SAND     ; +16
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_41 | ROUGH_AREA     ; +16
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4
    .byte  CYCLES_23 | STREAM         ; +20    height = 85 ($55)
Hole_18_Three:
    .byte  CYCLES_35 | SAND_3_CLOSE   ; +10
    .byte  CYCLES_41 | SAND_2_WIDE    ; +10
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_35 | GREEN_AREA     ; +25
    .byte  CYCLES_41 | TREE_2_WIDE    ; +12
    .byte  CYCLES_23 | MEDIUM_FIELD   ;  +8
    .byte  CYCLES_23 | SHORT_FIELD    ;  +4    height = 77 ($4D)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Hole_Hpos_Tab:
    .byte  $6A ; hole 1      hole H position
    .byte  $46 ; hole 2
    .byte  $46 ; hole 3
    .byte  $34 ; hole 4
    .byte  $34 ; hole 5
    .byte  $46 ; hole 6
    .byte  $7C ; hole 7
    .byte  $6A ; hole 8
    .byte  $46 ; hole 9
    .byte  $46 ; hole 10
    .byte  $58 ; hole 11
    .byte  $46 ; hole 12
    .byte  $6A ; hole 13
    .byte  $58 ; hole 14
    .byte  $6A ; hole 15
    .byte  $7C ; hole 16
    .byte  $34 ; hole 17
    .byte  $46 ; hole 18
    .byte  $48 ; on the green

Hole_Vpos_Tab:
    .byte  $42 ; hole 1      hole V position
    .byte  $28 ; hole 2
    .byte  $46 ; hole 3
    .byte  $3F ; hole 4
    .byte  $3E ; hole 5
    .byte  $34 ; hole 6
    .byte  $63 ; hole 7
    .byte  $66 ; hole 8
    .byte  $55 ; hole 9
    .byte  $31 ; hole 10
    .byte  $6A ; hole 11
    .byte  $3E ; hole 12
    .byte  $3C ; hole 13
    .byte  $57 ; hole 14
    .byte  $53 ; hole 15
    .byte  $4F ; hole 16
    .byte  $4B ; hole 17
    .byte  $3A ; hole 18
    .byte  $3F ; on the green

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Direction_Arrow_Gfx:
Arrow_1:
    .byte $00 ; |        | $FF25
    .byte $40 ; | X      | $FF26
    .byte $00 ; |        | $FF27
    .byte $00 ; |        | $FF28
    .byte $00 ; |        | $FF29
    .byte $00 ; |        | $FF2A
    .byte $A0 ; |X X     | $FF2B
    .byte $40 ; | X      | $FF2C
Arrow_2:
    .byte $00 ; |        | $FF2D
    .byte $40 ; | X      | $FF2E
    .byte $00 ; |        | $FF2F
    .byte $00 ; |        | $FF30
    .byte $00 ; |        | $FF31
    .byte $00 ; |        | $FF32
    .byte $50 ; | X X    | $FF33
    .byte $20 ; |  X     | $FF34
Arrow_3:
    .byte $00 ; |        | $FF35
    .byte $40 ; | X      | $FF36
    .byte $00 ; |        | $FF37
    .byte $00 ; |        | $FF38
    .byte $00 ; |        | $FF39
    .byte $00 ; |        | $FF3A
    .byte $14 ; |   X X  | $FF3B
    .byte $08 ; |    X   | $FF3C
Arrow_4:
    .byte $00 ; |        | $FF3D
    .byte $40 ; | X      | $FF3E
    .byte $00 ; |        | $FF3F
    .byte $00 ; |        | $FF40
    .byte $04 ; |     X  | $FF41
    .byte $04 ; |     X  | $FF42
    .byte $1C ; |   XXX  | $FF43
    .byte $00 ; |        | $FF44
Arrow_5:
    .byte $00 ; |        | $FF45
    .byte $40 ; | X      | $FF46
    .byte $00 ; |        | $FF47
    .byte $00 ; |        | $FF48
    .byte $02 ; |      X | $FF49
    .byte $02 ; |      X | $FF4A
    .byte $0E ; |    XXX | $FF4B
    .byte $00 ; |        | $FF4C
Arrow_6:
    .byte $00 ; |        | $FF4D
    .byte $40 ; | X      | $FF4E
    .byte $00 ; |        | $FF4F
    .byte $02 ; |      X | $FF50
    .byte $02 ; |      X | $FF51
    .byte $0E ; |    XXX | $FF52
    .byte $00 ; |        | $FF53
    .byte $00 ; |        | $FF54
Arrow_7:
    .byte $00 ; |        | $FF55
    .byte $40 ; | X      | $FF56
    .byte $01 ; |       X| $FF57
    .byte $01 ; |       X| $FF58
    .byte $07 ; |     XXX| $FF59
    .byte $00 ; |        | $FF5A
    .byte $00 ; |        | $FF5B
    .byte $00 ; |        | $FF5C
Arrow_8:
    .byte $00 ; |        | $FF5D
    .byte $42 ; | X    X | $FF5E
    .byte $01 ; |       X| $FF5F
    .byte $02 ; |      X | $FF60
    .byte $00 ; |        | $FF61
    .byte $00 ; |        | $FF62
    .byte $00 ; |        | $FF63
    .byte $00 ; |        | $FF64
Arrow_9:
    .byte $00 ; |        | $FF65
    .byte $02 ; |      X | $FF66
    .byte $41 ; | X     X| $FF67
    .byte $02 ; |      X | $FF68
    .byte $00 ; |        | $FF69
    .byte $00 ; |        | $FF6A
    .byte $00 ; |        | $FF6B
    .byte $00 ; |        | $FF6C


ArrowDir_Tab:
;Y offsets used to index $FF25
    .byte $07 ;    + 7  = Arrow 1
    .byte $0F ;    + 15 = Arrow 2
    .byte $17 ;    + 23 = Arrow 3
    .byte $1F ;    + 31 = Arrow 4
    .byte $27 ;    + 39 = Arrow 5
    .byte $2F ;    + 47 = Arrow 6
    .byte $37 ;    + 55 = Arrow 7
    .byte $3F ;    + 63 = Arrow 8
    .byte $47 ;    + 71 = Arrow 9
    .byte $3F ;    + 63 = Arrow 8
    .byte $37 ;    + 55 = Arrow 7
    .byte $2F ;    + 47 = Arrow 6
    .byte $27 ;    + 39 = Arrow 5
    .byte $1F ;    + 31 = Arrow 4
    .byte $17 ;    + 23 = Arrow 3
    .byte $0F ;    + 15 = Arrow 2

LFF7D:
    .byte $00 ; |        | $FF7D   ball gfx
    .byte $80 ; |X       | $FF7E
    .byte $00 ; |        | $FF7F
    .byte $00 ; |        | $FF80
    .byte $00 ; |        | $FF81
    .byte $80 ; |X       | $FF82
    .byte $80 ; |X       | $FF83
    .byte $00 ; |        | $FF84
    .byte $00 ; |        | $FF85
    .byte $C0 ; |XX      | $FF86
    .byte $C0 ; |XX      | $FF87
    .byte $00 ; |        | $FF88
    .byte $00 ; |        | $FF89
    .byte $C0 ; |XX      | $FF8A
    .byte $C0 ; |XX      | $FF8B
    .byte $C0 ; |XX      | $FF8C


ScreensPerHole_Tab:
;number of screens for each hole excluding the putting screen
    .byte  2 ;     3 screens, hole 1
    .byte  2 ;     3 screens, hole 2
    .byte  3 ;     4 screens, hole 3
    .byte  2 ;     3 screens, hole 4
    .byte  1 ;     2 screens, hole 5
    .byte  2 ;     3 screens, hole 6
    .byte  2 ;     3 screens, hole 7
    .byte  0 ;     1 screen,  hole 8
    .byte  3 ;     4 screens, hole 9
    .byte  2 ;     3 screens, hole 10
    .byte  0 ;     1 screen,  hole 11
    .byte  2 ;     3 screens, hole 12
    .byte  2 ;     3 screens, hole 13
    .byte  2 ;     3 screens, hole 14
    .byte  2 ;     3 screens, hole 15
    .byte  1 ;     2 screens, hole 16
    .byte  3 ;     4 screens, hole 17
    .byte  2 ;     3 screens, hole 18
    .byte  0 ;     1 screen,  (probably the green)

PlayerPutting_Tab:
    .byte (20 / 2) ;    Putt 1
    .byte (22 / 2) ;    Putt 2
    .byte (22 / 2) ;    Putt 2
    .byte (22 / 2) ;    Putt 2
    .byte (22 / 2) ;    Putt 2
    .byte (22 / 2) ;    Putt 2
    .byte (22 / 2) ;    Putt 2
    .byte (20 / 2) ;    Putt 1
    .byte (26 / 2) ;    Putt 3
    .byte (26 / 2) ;    Putt 3
    .byte (20 / 2) ;    Putt 1
    .byte (22 / 2) ;    Putt 2
    .byte (24 / 2) ;    Putt 1
    .byte (26 / 2) ;    Putt 3

ZoneHeight_Tab:
    .byte  $00 ;  0
    .byte  $02 ;  1
    .byte  $0C ;  2
    .byte  $0C ;  3
    .byte  $0C ;  4
    .byte  $0C ;  5
    .byte  $0C ;  6
    .byte  $0C ;  7
    .byte  $0B ;  8
    .byte  $0B ;  9
    .byte  $0B ;  10  $0A
    .byte  $0B ;  11  $0B
    .byte  $0B ;  12  $0C
    .byte  $0B ;  13  $0D
    .byte  $0A ;  14  $0E
    .byte  $0A ;  15  $0F
    .byte  $0A ;  16  $10
    .byte  $0A ;  17  $11
    .byte  $0A ;  18  $12
    .byte  $0A ;  19  $13
    .byte  $15 ;  20  $14
    .byte  $12 ;  21  $15
    .byte  $10 ;  22  $16
    .byte  $10 ;  23  $17
    .byte  $19 ;  24  $18
    .byte  $14 ;  25  $19
    .byte  $01 ;  26  $1A
    .byte  $10 ;  27  $1B
    .byte  $04 ;  28  $1C
    .byte  $08 ;  29  $1D
    .byte  $10 ;  30  $1E
    .byte  $10 ;  31  $1F

  IF ORIGINAL
    .byte $00 ; |        | $FFCE   probably free bytes until bit instruction begins...
    .byte $00 ; |        | $FFCF
    .byte $00 ; |        | $FFD0
    .byte $00 ; |        | $FFD1   the original has a few less instructions then the alternate,
    .byte $00 ; |        | $FFD2   the extra space are made up here.
    .byte $00 ; |        | $FFD3
    .byte $00 ; |        | $FFD4
    .byte $00 ; |        | $FFD5
    .byte $00 ; |        | $FFD6
    .byte $00 ; |        | $FFD7
  ENDIF
    .byte $00 ; |        | $FFD8
    .byte $00 ; |        | $FFD9
    .byte $00 ; |        | $FFDA
    .byte $00 ; |        | $FFDB
    .byte $00 ; |        | $FFDC
    .byte $00 ; |        | $FFDD
    .byte $00 ; |        | $FFDE
    .byte $00 ; |        | $FFDF

LFFE0:
    bit    LFFF8                 ; 4
    jmp    LD004                 ; 3
    bit    LFFF9                 ; 4
    jmp    LF037                 ; 3

    .byte $00 ; |        | $FFEC
    .byte $00 ; |        | $FFED
    .byte $00 ; |        | $FFEE
    .byte $00 ; |        | $FFEF
    .byte $00 ; |        | $FFF0
    .byte $00 ; |        | $FFF1
    .byte $00 ; |        | $FFF2
    .byte $00 ; |        | $FFF3
    .byte $00 ; |        | $FFF4
    .byte $00 ; |        | $FFF5
    .byte $00 ; |        | $FFF6
    .byte $00 ; |        | $FFF7


LFFF8:

  IF ORIGINAL
    .byte $FF
  ELSE ALTERNATE
    .byte $00
  ENDIF


LFFF9:
    .byte $00 ; |        | $FFF9

       rorg $FFFA

    .word START,START,START