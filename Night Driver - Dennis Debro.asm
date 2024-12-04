   LIST OFF
; ***  N I G H T  D R I V E R  ***
; Copyright 1980 Atari, Inc
; Programmer: Rob Fulop

; Analyzed, labeled and commented
;  by Dennis Debro
; Last Update: June 14, 2004

   processor 6502
      
;
; NOTE: You must compile this with vcs.h version 105 or greater.
;
TIA_BASE_READ_ADDRESS = $30         ; set the read address base so this runs on
                                    ; the real VCS and compiles to the exact
                                    ; ROM image

   include vcs.h
   include macro.h

   LIST ON

;===============================================================================
; A S S E M B L E R - S W I T C H E S
;===============================================================================

NTSC                    = 0
PAL                     = 1

COMPILE_VERSION         = NTSC      ; change this to compile for different
                                    ; regions
                                    
;============================================================================
; T I A - C O N S T A N T S
;============================================================================

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

; values for ENAMx and ENABL
DISABLE_BM        = %00
ENABLE_BM         = %10

; values for NUSIZx:
ONE_COPY          = %000
TWO_COPIES        = %001
TWO_WIDE_COPIES   = %010
THREE_COPIES      = %011
DOUBLE_SIZE       = %101
THREE_MED_COPIES  = %110
QUAD_SIZE         = %111
MSBL_SIZE1        = %000000
MSBL_SIZE2        = %010000
MSBL_SIZE4        = %100000
MSBL_SIZE8        = %110000

VERTICAL_DELAY          = 1

; values for REFPx:
NO_REFLECT        = %0000
REFLECT           = %1000

; mask for SWCHB
BW_MASK           = %1000         ; black and white bit
SELECT_MASK       = %10
RESET_MASK        = %01

;============================================================================
; U S E R - C O N S T A N T S
;============================================================================

ROMTOP                  = $F000

VBLANK_TIME             = $30
OVERSCAN_TIME           = $1C

; color constants
BLACK          =  $00
WHITE          =  $0E

; NTSC color constants
YELLOW         = $10
ORANGE         = $20
BRICK_RED      = $30
RED            = $40
BLUE_PURPLE    = $60
BLUE           = $80
BRIGHT_GREEN   = $C0
GREEN          = $D0
GREEN_BROWN    = $E0
BROWN          = $F0

H_FONT                  = 5
H_OBSTACLE              = 8

SELECT_DELAY            = 18

INIT_PYLON_DISTANCE     = 4         ; initial distance between left/right pylon
XMIN                    = 0
XMAX                    = 158

START_LEFT_PYLON_XPOS   = 78
START_RIGHT_PLYON_XPOS  = START_LEFT_PYLON_XPOS + INIT_PYLON_DISTANCE

MIN_VELOCITY            = 0
MAX_VELOCITY            = 6

MAX_PYLON_GROUPS        = 8

MAX_GAME_SELECTION      = 9

STARTING_GAME_TIME      = $90       ; BCD

; track difficulty values
RANDOM_TRACK            = 0
NOVICE_TRACK            = 1
PRO_TRACK               = 2
EXPERT_TRACK            = 3

;============================================================================
; Z P - V A R I A B L E S
;============================================================================

temp                    = $81
;--------------------------------------
tempObstacleHeight      = temp      ; used in kernel to draw the obstacle
;--------------------------------------
pylonVertSpace          = temp      ; used in kernel -- space between pylons
pylonHeight             = $82       ; used in kernel to vary height of pylons
scoreGraphic1           = $83
;--------------------------------------
tempPylonGroupNumber    = scoreGraphic1
scoreGraphic2           = $84
;--------------------------------------
tempKernelScanline      = scoreGraphic2

obstacleStatus          = $86       ; status flags for obstacle
scanlineHolder          = $87       ; scan line number before drawing obstacle
obstacleDataPointer     = $88       ; $88 - $89
trackSettingDataPointer = $8A       ; $8A - $8B
trackDifficulty         = $8C       ; see track difficulty values
carColor                = $8D

player0HorizPos         = $90
obstacleVertSize        = $91       ; used in kernel for repeating scan lines

randomSeed              = $93
carVelocity             = $94       ; velocity of player's car
initLeftPylonXPos       = $95       ; top pylon XPos

frameCount              = $99       ; updated each frame

sound0Volume            = $9C
selectDelayRate         = $9D       ; controls game selections if SELECT held
fireButtonValue         = $9F
colorMode               = $A0       ; D7 = 1 for COLOR D7 = 0 for B/W

trackCheckPoint         = $A2       ; score increases when checkpoint passed
trackDiffTableIndex     = $A3       ; used to read the track difficulty table
pylonColor              = $AA
maximumVelocity         = $AB       ; velocity ceiling (controlled by right
                                    ; difficulty switch)

sound1Volume            = $AE

gameSelection           = $B0       ; game selection in BCD
selectDebounce          = $B1
gameState               = $B2
gameTimer               = $B3
playerScore             = $B4
paddleValue             = $B5
gameTimerMask           = $B6

gameBCDValues           = $B8       ; $B8 - $B9
;--------------------------------------
playerScoreBCD          = gameBCDValues
gameTimerBCD            = playerScoreBCD+1
playerScoreLSBOffset    = $BA
playerTimerLSBOffset    = $BB
playerScoreMSBOffset    = $BC
playerTimerMSBOffset    = $BD
leftPylonHorizPos       = $BE       ; $BE - $C5

rightPylonHorizPos      = $C7       ; $C7 - $CE


;============================================================================
; R O M - C O D E
;============================================================================

   SEG Bank0
   org ROMTOP

Start
;
; Set up everything so the power up state is known.
;
   sei                              ; disable interrupts
   cld                              ; clear decimal mode
   ldx #$FF
   txs                              ; point stack to the beginning
   inx                              ; x = 0
   txa
.clearLoop
   sta VSYNC,x
   inx
   bne .clearLoop
   jsr SystemPowerup
MainLoop
VerticalSync
   lda #%00000010
   sta WSYNC                        ; wait for next scan line
   sta VBLANK                       ; disable TIA (D1 = 1)
   sta WSYNC                        ; wait 3 scan lines before starting new
   sta WSYNC                        ; frame
   sta WSYNC
   sta VSYNC                        ; start vertical sync (D1 = 1)
   sta WSYNC                        ; first line of VSYNC
   sta WSYNC                        ; second line of VSYNC
   lda #VBLANK_TIME
   sta WSYNC                        ; third line of VSYNC
   sta VSYNC                        ; end vertical sync (D1 = 0)
   sta TIM64T                       ; set timer for vertical blanking period
   inc $96
   bne .incrementFrameCount
   inc $9E
   bne .incrementFrameCount
   stx gameState
.incrementFrameCount
   inc frameCount                   ; increment frame count each new frame
   lda $AF
   sec
   sbc carVelocity
   sta $AF
   lda $96
   lsr
   bcc LF045
   jmp ReadConsoleSwitches
       
LF045:
   ldx #0
   lda $A1
   bmi LF04C
   txa
LF04C:
   and #$07
   tay
   lda LF712,y
   sta $AC
   tya
   asl
   asl
   asl
   tay
   lda $9B
   bne LF0A2
   stx $A7
   stx $A8
   lda #1
   sta $A4
LF065:
   jsr DeterminePylonXOffset
   clc
   adc leftPylonHorizPos,x
   sta leftPylonHorizPos,x
   sty $AD
   ldy $AC
   jsr DeterminePylonXOffset
   eor #$FF                         ; make the value negative
   clc
   adc #1
   clc
   adc rightPylonHorizPos,x
   sta rightPylonHorizPos,x
   lda leftPylonHorizPos,x
   cmp #XMAX
   bcc LF08A
   lda $A7
   ora $A4
   sta $A7
LF08A:
   lda rightPylonHorizPos,x
   cmp #XMAX
   bcc LF096
   lda $A8
   ora $A4
   sta $A8
LF096:
   asl $A4
   inx
   inc $AC
   ldy $AD
   iny
   cpx #MAX_PYLON_GROUPS
   bne LF065
LF0A2:
   jmp LF2A4
   
ReadConsoleSwitches
   lda SWCHB                        ; read console switches
   ror                              ; RESET value now in carry
   bcs .readColorAndSelectButtons
   jsr InitPylonVariables
   sty gameState
   sty $A5
   sty $92
   iny                              ; y = 0
   sty playerScore                  ; clear the player's score
   sty $B7
   sty trackDiffTableIndex          ; reset the track difficulty table index
   sty COLUBK                       ; set background color to BLACK
   sty carVelocity                  ; reset car velocity (car at rest)
   iny                              ; y = 1
   sty $A1
   lda gameSelection                ; get current game selection
   tay                              ; move to y for later
   and #3                           ; get the track difficulty setting
   sta trackDifficulty              ; and set it for the current game
   lda #$0F                         ; assume this is a timed game selection
   cpy #5                           ; determine if this is a timed game
   bcs .skipSettingGameTimerMask
   sta gameTimerMask                ; set game timer mask to show timer
.skipSettingGameTimerMask
   sta trackCheckPoint
   lda #STARTING_GAME_TIME
   sta gameTimer
   lda #BLUE+3
   sta carColor
   sta obstacleStatus
   lda #MAX_VELOCITY                ; assume EXPERT velocity setting
   bit SWCHB                        ; read the right difficulty switch
   bmi .setMaximumVelocity
   lda #MAX_VELOCITY-2              ; set to AMATUEUR velocity setting
.setMaximumVelocity
   sta maximumVelocity
.readColorAndSelectButtons
   ldx #0
   lda SWCHB                        ; read the console switch value
   and #BW_MASK                     ; get the B/W switch value
   bne .setColorMode                ; set color mode to B/W
   ldx #128                         ; set color mode to COLOR
.setColorMode
   stx colorMode
   lda SWCHB                        ; read the console switches
   and #SELECT_MASK                 ; mask to find SELECT value
   beq .selectSwitchPressed
   lda #0
   sta selectDebounce               ; show SELECT not pressed this frame
   sta selectDelayRate              ; reset select button delay rate
   beq LF137                        ; unconditional branch
       
.selectSwitchPressed
   lda selectDebounce               ; get the select debounce flag
   bne .delayGameSelectionIncrement ; branch if SELECT held from last frame
IncrementGameSelection
   sed                              ; set to decimal mode
   lda gameSelection                ; get current game selection
   clc
   adc #1                           ; increment game selection by 1
   sta gameSelection
   cld                              ; clear decimal mode
   cmp #MAX_GAME_SELECTION          ; make sure it doesn't go over the max
   bne .skipGameSelectionWrap
   lda #1                           ; wrap game selection back around to 1
   sta gameSelection
.skipGameSelectionWrap
   lda #$FF
   sta selectDebounce               ; show SELECT button was held this frame
   lda gameState                    ; get the current game state
   beq LF124
   jsr InitPylonVariables
LF124:
   lda #0
   sta selectDelayRate              ; reset select button delay rate
   sta gameState
   jsr ResetGameVariables
   bne LF137                        ; unconditional branch
   
.delayGameSelectionIncrement
   inc selectDelayRate              ; increment select delay rate
   lda selectDelayRate              ; get select delay rate to see if
   cmp #SELECT_DELAY                ; game selection should be incremented
   beq IncrementGameSelection
LF137:
   lda $AF
   cmp #158
   bcc LF140
   jmp LF1C4
       
LF140:
   inc $92
   ldx #MAX_PYLON_GROUPS-1
.movePylonsDownLoop
   lda leftPylonHorizPos,x
   ldy rightPylonHorizPos,x
   sta leftPylonHorizPos+1,x
   sty rightPylonHorizPos+1,x
   dex
   bpl .movePylonsDownLoop
   lda initLeftPylonXPos            ; get the initial pylon's horiz position
   sta leftPylonHorizPos            ; set top left pylon's horiz position
   clc
   adc #INIT_PYLON_DISTANCE
   sta rightPylonHorizPos           ; set top right pylon's horiz position
   lda #176
   sta $AF
   dec trackCheckPoint
   bpl LF1B5
   bit gameState
   bpl SetGameTrackVariables
   lda trackDifficulty
   bne SetGameTrackVariables
   lda randomSeed
   bpl LF170
   ldx #1
   bne LF177                        ; unconditional branch
   
LF170:
   ldx #$81
   ror
   bcc LF177
   ldx #$C2
LF177:
   stx $A1
   lda randomSeed                   ; get the random number
   and #$0F                         ; make sure value is 0 <= a <= 15
   ora #$08                         ; make sure the value is 8 <= a <= 15
   sta trackCheckPoint
   bne IncrementScore               ; unconditional branch
   
SetGameTrackVariables
   lda trackDifficulty              ; get the track difficulty
   asl                              ; multiply by 2 for table read
   tay
   lda TrackDifficultyDataPointers,y
   sta trackSettingDataPointer
   lda TrackDifficultyDataPointers+1,y
   sta trackSettingDataPointer+1
   ldy trackDiffTableIndex
LF193:
   lda (trackSettingDataPointer),y
   bne LF19A
   tay                              ; reset the track difficulty table index
   beq LF193                        ; unconditional branch
       
LF19A:
   sta $A1
   iny                              ; increment index to read check point
   lda (trackSettingDataPointer),y
   sta trackCheckPoint              ; set new check point value
   iny                              ; increment for next table read
   sty trackDiffTableIndex          ; save for next table read
   bit gameState
   bpl LF1B1
IncrementScore
   sed
   lda playerScore                  ; get the player's score
   clc
   adc #1                           ; increment player's score by 1
   sta playerScore
   cld
LF1B1:
   lda #0
   sta $A5
LF1B5:
   lda $A1
   bpl LF1C4
   and #$07
   tax
   lda initLeftPylonXPos
   clc
   adc LF6F5,x
   sta initLeftPylonXPos
LF1C4:
   ldy obstacleStatus
   bpl LF1CC
   ldx $92
   bpl LF1CF
LF1CC:
   jmp LF26A

LF1CF:
   tya                              ; move obstacle status to the accumulator
   and #$0F                         ; keep only obstacle type
   tay
   lda obstacleStatus
   and #%00010000
   beq LF1E1
   lda rightPylonHorizPos,x         ; get the right pylon's horiz position
   clc
   adc #16
   jmp .setObstaclesHorizPos
       
LF1E1:
   lda leftPylonHorizPos,x          ; get the left pylon's horiz position
   cpy #0                           ; check to see if obstacle is a car
   bne .positionObstacleOffTrack    ; if not then place obstacle off the track
   clc
   adc #2
   jmp .setObstaclesHorizPos
       
.positionObstacleOffTrack
   sec
   sbc #24
.setObstaclesHorizPos
   sta player0HorizPos
   txa
   cmp #6
   bne LF23C
   lda initLeftPylonXPos
   cmp #START_LEFT_PYLON_XPOS+2
   bcc LF204
   lda obstacleStatus
   and #%11101111
   jmp LF208
       
LF204:
   lda obstacleStatus
   ora #%00010000
LF208:
   sta obstacleStatus
   lda #172
   sta $8F
   lda #$FF
   sta $92
   lda randomSeed                   ; get the random number
   and #$03                         ; make number 0 <= a <= 3
   bne LF230
   lda leftPylonHorizPos
   clc
   adc #2
   sta player0HorizPos
   bit SWCHB
   bvs LF228
   lda #$40
   sta sound1Volume
LF228:
   lda obstacleStatus
   and #%11101111
   sta obstacleStatus
   lda #0
LF230:
   sta $81
   lda obstacleStatus
   and #%11110000
   ora $81
   sta obstacleStatus
   bne LF26A
LF23C:
   lsr
   sta $84
   tax
   lda #16
   sta $81
   lda obstacleStatus
   and #%00001111
   bne LF24C
   sta $81
LF24C:
   lda obstacleStatus
   and #%00010000
   eor $81
   beq LF25C
   lda player0HorizPos
   sec
   sbc LF75D,x
   sta player0HorizPos
LF25C:
   lda player0HorizPos
   bpl LF273
   clc
   adc LF75D,x
   bcs LF26A
   cmp #160
   bcc LF273
LF26A:
   lda obstacleStatus
   and #%10111111
   sta obstacleStatus
   jmp LF2A4
       
LF273:
   lda obstacleStatus
   ora #%01000000
   sta obstacleStatus
   lda obstacleStatus
   bpl LF2A4
   and #$0F                         ; make sure value is 15 <= a <= 0
   asl                              ; multiply by 2 -- table has word address
   tax
   lda ObstacleDataPointers,x
   sta obstacleDataPointer
   lda ObstacleDataPointers+1,x
   sta obstacleDataPointer+1
   ldx $84
   lda ObstacleVertSizeTable,x
   sta obstacleVertSize
   lda ObstacleSizeTable,x
   sta NUSIZ0
   ldx #0
   lda player0HorizPos              ; get player0's horizontal position
   jsr CalculateHorizPosition       ; coarse move player and
   sta HMP0                         ; calculate fine motion
   sta WSYNC                        ; wait for next scan line
   sta HMOVE                        ; horizontally more sprites
LF2A4:
   lda playerScore
   sta playerScoreBCD
   bit gameState
   bpl LF2E3
   bit $A5
   bmi LF2D8
   lda frameCount
   cmp #60
   bne LF2D8
   sed                              ; set to decimal mode
   lda gameTimer                    ; get the game timer
   sec
   sbc #1                           ; reduce game timer by 1
   sta gameTimer
   cld
   cmp #0
   bne LF2D4
   lda gameTimerMask
   beq LF2D4
   jsr ResetGameVariables
   lda #$40
   sta gameState
   jsr InitPylonVariables
   jmp DisplayKernel
       
LF2D4:
   lda #0
   sta frameCount
LF2D8:
   lda gameTimerMask
   beq .setGameTimerBCDValue
   lda gameTimer                    ; get the game timer
.setGameTimerBCDValue
   sta gameTimerBCD
   jmp CalculateDigitOffsets
       
LF2E3:
   lda $96
   bne LF2F7
   lda $A9
   and #$07
   tay
   lda LF7ED,y
   sta carColor                     ; set the car color
   ora #$08
   sta pylonColor                   ; set the pylon colors
   inc $A9
LF2F7:
   bvs LF2D8
   lda gameSelection
   sta playerScoreBCD
CalculateDigitOffsets
   ldx #1
.digitOffsetLoop
   lda gameBCDValues,x              ; get the game BCD value (score or timer)
   and #$0F                         ; mask off the upper nybbles
   sta temp                         ; save the value for later
   asl                              ; shift the value left to multiply by 4
   asl
   clc                              ; add in original so it's multiplied by 5
   adc temp                         ; [i.e. x * 5 = (x * 4) + x]
   sta playerScoreLSBOffset,x
   lda gameBCDValues,x
   and #$F0                         ; mask off the lower nybbles
   lsr                              ; divide the value by 4
   lsr
   sta temp                         ; save the value for later
   lsr                              ; divide the value by 16
   lsr
   clc                              ; add in original so it's multiplied by
   adc temp                         ; 5/16 [i.e. 5x/16 = (x / 16) + (x / 4)]
   sta playerScoreMSBOffset,x
   dex
   bpl .digitOffsetLoop
DisplayKernel SUBROUTINE
.waitTime
   ldx INTIM
   bne .waitTime
   stx WSYNC                        ; wait for next scan line
   stx HMP0
   stx VBLANK                       ; enable TIA (D1 = 0)
   lda #$E5
   sta TIM64T
   stx CTRLPF
   stx scoreGraphic1                ; clear score graphics for score kernel
   stx scoreGraphic2
   inx                              ; x = 1
   stx $A4
   ldx #H_FONT+1
ScoreKernel
   sta WSYNC
;--------------------------------------
   lda scoreGraphic1          ; 3         get the score graphic for display
   sta PF1                    ; 3 = @06
   ldy playerScoreMSBOffset   ; 3
   lda NumberFonts,y          ; 4         read the number fonts
   and #$F0                   ; 2         mask the lower nybble
   sta scoreGraphic1          ; 3         save it in the score graphic
   ldy playerScoreLSBOffset   ; 3
   lda NumberFonts,y          ; 4         read the number fonts
   and #$0F                   ; 2         mask the upper nybble
   ora scoreGraphic1          ; 3         or with score graphic to get LSB
   sta scoreGraphic1          ; 3         value
   lda scoreGraphic2          ; 3         get the score graphic for display
   sta PF1                    ; 3 = @39
   ldy playerTimerMSBOffset   ; 3
   lda NumberFonts,y          ; 4         read the number fonts
   and #$F0                   ; 2         mask the lower nybble
   sta scoreGraphic2          ; 3         save it in the score graphic
   ldy playerTimerLSBOffset   ; 3
   lda NumberFonts,y          ; 4         read the number fonts
   and gameTimerMask          ; 3         gameTimerMask turns on/off right digits
   sta WSYNC                  ; 3 = @64
;--------------------------------------
   ora scoreGraphic2          ; 3         or with score graphic to get LSB
   sta scoreGraphic2          ; 3         value
   lda scoreGraphic1          ; 3
   sta PF1                    ; 3 = @12
   dex                        ; 2
   beq LF383                  ; 2³
   inc playerScoreLSBOffset   ; 5
   inc playerScoreMSBOffset   ; 5
   inc playerTimerLSBOffset   ; 5
   inc playerTimerMSBOffset   ; 5
   lda scoreGraphic2          ; 3
   sta PF1                    ; 3
   jmp ScoreKernel            ; 3
       
LF383:
   stx PF1                    ; 3 = @20   clear PF1 register (x = 0)
   ldy #$B0                   ; 2
   lda #%00000001             ; 2
   sta CTRLPF                 ; 3 = @27
   lda $96                    ; 3
   lsr                        ; 2
   bcs LF393                  ; 2³
   jmp PylonKernel            ; 3
       
LF393:
   sta WSYNC
;--------------------------------------
LF395:
   sta WSYNC
;--------------------------------------
   cpy $8F                    ; 3
   beq LF3A4                  ; 2³
   bit INPT0                  ; 3         read the paddle controller
   bmi LF3A1                  ; 2³        check if capacitor charged
   inc paddleValue            ; 5
LF3A1:
   dey                        ; 2
   bne LF395                  ; 2³
LF3A4:
   sty scanlineHolder         ; 3         save scan line until done with
                              ;           obstacle
   lda #$29                   ; 2
   sta TIM64T                 ; 4
   ldy #0                     ; 2
DrawObstacleKernel
   lda obstacleVertSize       ; 3
   sta tempObstacleHeight     ; 3
   cpy #H_OBSTACLE*2          ; 2         doubled to include color data too
   beq .doneObstacleKernel    ; 2³
   sta WSYNC
;--------------------------------------
   lda (obstacleDataPointer),y; 5
   bit obstacleStatus         ; 3
   bvc .skipObstacleDraw      ; 2³
   sta GRP0                   ; 3 = @13   draw the obstacle
.skipObstacleDraw
   iny                        ; 2
   lda (obstacleDataPointer),y; 5
   bit colorMode              ; 3
   bpl .colorObstacle         ; 2³
   and #$0F                   ; 2         mask the color hue for B/W
.colorObstacle
   sta COLUP0                 ; 3         color the obstacle
   bit INPT0                  ; 3         read the paddle controller
   bmi .incrementObstacleIndex; 2³        check if capacitor charged
   inc paddleValue            ; 5
.incrementObstacleIndex
   iny                        ; 2
   dec tempObstacleHeight     ; 5
   beq DrawObstacleKernel     ; 2³
.drawObstacleKernelLoop
   sta WSYNC
;--------------------------------------
   bit INPT0                  ; 3         read the paddle controller
   bmi .skipPaddleValue       ; 2³        check if capacitor charged
   inc paddleValue            ; 5
.skipPaddleValue
   dec tempObstacleHeight     ; 5
   bne .drawObstacleKernelLoop; 2³        continue until height is 0
   beq DrawObstacleKernel     ; 3         unconditional branch
       
.doneObstacleKernel
   sta WSYNC
;--------------------------------------
   lda #0                     ; 2
   sta GRP0                   ; 3 = @05   clear obstacle player register
   lda scanlineHolder         ; 3         get the scan line number before
   sec                        ; 2         drawing obstacle
   sbc #H_OBSTACLE*4          ; 2         decrement by 32
   tay                        ; 2         set to new scan line number
LF3EF:
   sta WSYNC
;--------------------------------------
   bit INPT0                  ; 3         read the paddle controller
   bmi LF3F7                  ; 2³        check if capacitor charged
   inc paddleValue            ; 5
LF3F7:
   lda INTIM                  ; 4
   bne LF3EF                  ; 2³
LF3FC:
   sta WSYNC
;--------------------------------------
   bit INPT0                  ; 3         read the paddle controller
   bmi LF404                  ; 2³        check if capacitor charged
   inc paddleValue            ; 5
LF404:
   dey                        ; 2
   cpy #31                    ; 2
   bne LF3FC                  ; 2³+1
   lda carColor               ; 3
   bit colorMode              ; 3
   bpl .colorPlayerCar        ; 2³
   and #$0F                   ; 2
.colorPlayerCar
   sta COLUPF                 ; 3
CarKernel
   sta WSYNC
;--------------------------------------
   tya                        ; 2
   lsr                        ; 2         divide value by 8 whic makes the car
   lsr                        ; 2         32 scan lines high
   lsr                        ; 2
   tax                        ; 2
   lda CarGraphics,x          ; 4
   sta PF2                    ; 3 = @17
   dey                        ; 2
   bne CarKernel              ; 2³
   jmp Overscan               ; 3
       
PylonKernel
   lda pylonColor             ; 3
   bit colorMode              ; 3
   bpl .colorPylons           ; 2³
   and #$0F                   ; 2         mask the color hue for B/W
.colorPylons
   sta COLUP0                 ; 3         color the pylons by setting the
   sta COLUP1                 ; 3         player colors (pylons are missiles)
LF431:
   sta WSYNC
;--------------------------------------
   cpy $AF                    ; 3
   beq .nextPylonGroup        ; 2³
   dey                        ; 2
   bne LF431                  ; 2³
.nextPylonGroup
   inx                        ; 2
   txa                        ; 2
   dex                        ; 2
   asl                        ; 2         multiply by 2
   sta pylonHeight            ; 3         set the pylon height for the section
   stx tempPylonGroupNumber   ; 3         save pylon group number for later
   sty tempKernelScanline     ; 3         save scan line number for later
   lda leftPylonHorizPos,x    ; 4
   ldx #2                     ; 2         set index to coarse move missile 0
   jsr CalculateHorizPosition ; 6
   sta HMM0                   ; 3         set fine motion for missile 0
   ldx tempPylonGroupNumber   ; 3         retrieve pylon group number
   lda rightPylonHorizPos,x   ; 4
   ldx #3                     ; 2         set index to coarse move missile 1
   jsr CalculateHorizPosition ; 6
   sta HMM1                   ; 3         set fine motion for missile 1
   ldx tempPylonGroupNumber   ; 3         retrieve pylon group number
   lda tempKernelScanline     ; 3         retrieve scan line number
   sec                        ; 2
   sbc #5                     ; 2         took 5 lines to compute position
   cpx $92                    ; 3
   bne LF469                  ; 2³
   bit gameState              ; 3
   bpl LF469                  ; 2³
   sta $8F                    ; 3
LF469:
   tay                        ; 2
   cpy #16                    ; 2
   bcc EndDisplayKernel       ; 2³
   sta WSYNC
;--------------------------------------
   sta HMOVE                  ; 3
   lda $A7                    ; 3
   and $A4                    ; 3
   bne LF47C                  ; 2³
   lda #ENABLE_BM             ; 2
   sta ENAM0                  ; 3 = @16
LF47C:
   lda $A8                    ; 3
   and $A4                    ; 3
   bne LF486                  ; 2³
   lda #ENABLE_BM             ; 2
   sta ENAM1                  ; 3
LF486:
   dey                        ; 2
.drawPylonLoop
   sta WSYNC
;--------------------------------------
   dey                        ; 2
   dec pylonHeight            ; 5
   bne .drawPylonLoop         ; 2³
   sta WSYNC
;--------------------------------------
   lda #DISABLE_BM            ; 2
   sta ENAM1                  ; 3 = @05
   sta ENAM0                  ; 3 = @08
   dey                        ; 2
   asl $A4                    ; 5
   inx                        ; 2
   cpx #MAX_PYLON_GROUPS      ; 2
   beq EndDisplayKernel       ; 2³
   lda PylonVertOffsetTable,x ; 4
   sta pylonVertSpace         ; 3
.pylonSpaceLoop
   sta WSYNC
;--------------------------------------
   dey                        ; 2
   dec pylonVertSpace         ; 5
   bne .pylonSpaceLoop        ; 2³
   jmp .nextPylonGroup        ; 3
       
EndDisplayKernel
   sta WSYNC
;--------------------------------------
.kernelWaitTime
   ldx INTIM
   bne .kernelWaitTime
Overscan SUBROUTINE
   lda #OVERSCAN_TIME
   sta TIM64T
   stx PF2                          ; clear PF2 register (x = 0)
;
; random number generator...also used in Cosmic Ark
;
   lda randomSeed
   asl
   eor randomSeed
   asl
   asl
   rol randomSeed
   lda $96
   lsr
   bit gameState
   bmi LF4CE
   jmp .waitTime
       
LF4CE:
   bcs LF4D3
LF4D0:
   jmp LF555

LF4D3:
   lda $9B
   cmp #16
   bcs LF4D0
   lda paddleValue
   ldy #0
   sty paddleValue
LF4DF:
   sec
   sbc #10
   bcc LF4E8
   iny
   jmp LF4DF
       
LF4E8:
   ldx #0
   cpy #11
   bcc LF4F0
   ldy #10
LF4F0:
   sty $98
   bit $A5
   bmi LF51F
   lda $9B
   bne LF500
   lda carVelocity                  ; get the player's car velocity
   beq LF51F                        ; branch if not moving
   bne LF502                        ; unconditional branch
       
LF500:
   ldy $9A
LF502:
   lda leftPylonHorizPos,x
   clc
   adc LF7B0,y
   sta leftPylonHorizPos,x
   lda rightPylonHorizPos,x
   clc
   adc LF7B0,y
   sta rightPylonHorizPos,x
   inx
   cpx #MAX_PYLON_GROUPS
   bne LF502
   lda initLeftPylonXPos
   clc
   adc LF7B0,y
   sta initLeftPylonXPos
LF51F:
   lda $9B
   bne LF555
   inc $B7
   lda fireButtonValue
   eor SWCHA
   bpl LF532
   lda #0
   sta $B7
   sta $9E
LF532:
   lda SWCHA                        ; read paddle button (accelerator)
   sta fireButtonValue              ; save for later (D7 = 0 when pressed)
   lda $B7
   cmp #$05
   bne LF555
   lda carVelocity                  ; get the player's car velocity
   bit fireButtonValue              ; check if player accelerating car
   bpl .checkToIncrementVelocity    ; branch if car accelerating
   cmp #MIN_VELOCITY
   beq LF551                        ; branch if player car at rest
   dec carVelocity                  ; slow player's car (accelerator not pressed)
   bpl LF551                        ; unconditional branch
   
.checkToIncrementVelocity
   cmp maximumVelocity              ; compare current velocity to maximum
   beq LF551                        ; branch if maximum velocity reached
   inc carVelocity                  ; increase player's velocity
LF551:
   lda #0
   sta $B7
LF555:
   ldx $9B
   bne LF587
   lda $C5
   bmi LF565
   cmp #72
   bcc LF565
   stx $9A
   bcs LF573
LF565:
   lda $CE
   cmp #88
   bcs LF5B1
   cmp #32
   bcc LF5B1
   lda #10
   sta $9A
LF573:
   lda #$81
   sta $9B
   lda #$0F
   sta sound0Volume
   lda #$15
   sta AUDF0
   lda #$08
   sta AUDC0
   stx carVelocity
   stx $A9
LF587: DEC    $9B     ;5
       LDA    $9B     ;3
       BEQ    LF5A4   ;2
       AND    #$07    ;2
       BNE    LF5D5   ;2
       LDY    $A9     ;3
       LDA    LF7ED,Y ;4
       ORA    #$08    ;2
       BIT    colorMode     ;3
       BPL    LF59E   ;2
       AND    #$0F    ;2
LF59E: STA    COLUBK  ;3
       INC    $A9     ;5
       BNE    LF5D5   ;2
LF5A4: STA    $9B     ;3
       STA    $B7     ;3
       STA    COLUBK  ;3
       LDX    #$0E    ;2
       STX    AUDF0   ;3
       INX            ;2
       STX    AUDC0   ;3
LF5B1:
   lda obstacleStatus               ; get obstacle status flags
   and #$07                         ; keep the obstacle id
   bne LF5D5                        ; branch if not a car
   lda $8F
       CMP    #$50    ;2
       BCS    LF5D5   ;2
   lda player0HorizPos              ; get the car's horizontal position
   bmi LF5D5
   cmp #56
   bcc LF5D5
   lda #0
   sta $9A
   lda obstacleStatus
   ora #%00000100
   sta obstacleStatus
   lda #4
   sta $92
   bne LF573                        ; unconditional branch
       
LF5D5:
   lda #%10000000
   sta VBLANK                       ; enable TIA and discharge paddles
   sta WSYNC
   sta WSYNC
   sta WSYNC
   ldy #0
   sty VBLANK
   lda $9B
   bne LF5FC
   lda $96
   and #$03
   bne LF5F4
   ldx carVelocity
   lda LF7F5,x
   sta $8E
LF5F4: LSR    $8E     ;5
       BCC    LF5FA   ;2
       LDY    #$0C    ;2
LF5FA: STY    AUDV0   ;3
LF5FC: LDA    $96     ;3
       AND    #$07    ;2
       BNE    LF60D   ;2
       LDA    sound0Volume     ;3
       BEQ    LF60D   ;2
   sec
   sbc #1
   sta AUDV0
   sta sound0Volume
LF60D:
   lda sound1Volume
   beq LF625
   dec sound1Volume
   and #%00011000                   ; make sure value is 0, 8, 16, or 24
   beq LF619
   lda #$0F
LF619:
   sta AUDV1
       LDA    #$0F    ;2
       STA    AUDF1   ;3
       LDA    #$0C    ;2
       STA    AUDC1   ;3
       BNE    .waitTime   ;2
LF625: LDA    #$08    ;2
       STA    AUDF1   ;3
       STA    AUDC1   ;3
       LDA    $9B     ;3
       BNE    LF641   ;2
   lda carVelocity
   cmp #MIN_VELOCITY+2
   bcc LF641
       LDA    $98     ;3
       BEQ    LF63D   ;2
       CMP    #$0A    ;2
       BNE    LF641   ;2
LF63D: LDA    #$08    ;2
       BNE    LF643   ;2
       
LF641: LDA    #$00    ;2
LF643: STA    AUDV1   ;3
.waitTime
   ldx INTIM
   bne .waitTime
   jmp MainLoop
       
SystemPowerup
   lda #MSBL_SIZE2                  ; set the size of the pylons and obstacles
   sta NUSIZ0
   sta NUSIZ1
   sta randomSeed                   ; initialize randomSeed
   lda #$0E
   sta AUDF0
   ldx #1
   stx gameSelection                ; initialize game selection
   stx obstacleVertSize
   stx $98
   lda #MAX_VELOCITY-1
   sta carVelocity                  ; set car's velocity
   lda #BLUE+7
   sta carColor
InitPylonVariables
   lda #RED+8
   sta pylonColor
   lda #176
   sta $AF
   lda #172
   sta $8F
   lda #START_LEFT_PYLON_XPOS
   sta initLeftPylonXPos
   sta leftPylonHorizPos
   lda #START_RIGHT_PLYON_XPOS
   sta rightPylonHorizPos
   ldx #1
   lda #XMAX+1
   sta AUDC0
   ldy #XMIN-1
.initPylonHorizPosLoop
   sta rightPylonHorizPos,x
   sty leftPylonHorizPos,x
   inx
   cpx #MAX_PYLON_GROUPS
   bne .initPylonHorizPosLoop
   rts

DeterminePylonXOffset
   lda carVelocity
   sta $81
   lda #0
LF697:
   dec $81
   bmi LF6A2
   clc
   adc LF6FA,y
   jmp LF697
       
LF6A2:
   rts

ResetGameVariables
   lda #0
   sta obstacleStatus
   sta COLUBK                       ; set background color to BLACK
   sta trackDiffTableIndex          ; reset the track difficulty table index
   sta trackCheckPoint              ; reset track check point
   sta $9B
   sta trackDifficulty
   sta AUDV0                        ; turn off game sounds by setting volume
   sta AUDV1                        ; registers to 0
   sta gameTimerBCD
   sta gameTimerMask
   lda #MAX_VELOCITY-1
   sta carVelocity                  ; set car's velocity
   sta $A1
   rts

CalculateHorizPosition
   clc
   adc #55
   pha                              ; push value to stack for later
   lsr                              ; shift top nybble to lower nybble
   lsr
   lsr
   lsr
   tay                              ; save the value
   pla                              ; get the object's x position
   and #$0F                         ; mask upper nybble
   sty temp                         ; save coarse value for later
   clc
   adc temp                         ; add in coarse value (A = C + F)
   cmp #15
   bcc .skipSubtractions
   sbc #15                          ; subtract 15
   iny                              ; and increment coarse value
.skipSubtractions
   cmp #8                           ; make sure hasn't gone pass min x value
   eor #$0F
   bcs .skipFineIncrement
   adc #1                           ; increment fine motion value
   dey                              ; reduce coarse value
.skipFineIncrement
   asl                              ; move fine motion value to upper nybble
   asl
   asl
   asl
   sty WSYNC                        ; wait for next scan line
.coarseMoveLoop
   dey
   bpl .coarseMoveLoop
   sta RESP0,x                      ; set object's coarse position
   rts

PylonVertOffsetTable
   .byte 0, 1, 1, 1, 2, 4, 8, 10

LF6F5:
   .byte 0, -4, 4, -7, 7

LF6FA:
   .byte -1,-1,-1,-1,-1,-1,-1,-1,1,1,1,0,-1,-1,-1,-1
   .byte -2,-2,-2,-1,-1,-1,-1,0
   
LF712: .byte $00,$10,$08

TrackDifficultyDataPointers
   .word RandomDifficultySettings   ; these values are never read
   .word NoviceDifficultySettings
   .word ProDifficultySettings
   .word ExpertDifficultySettings

RandomDifficultySettings
   .byte $01, 20
   .byte $81, 2
   .byte $C2, 4
   .byte $81, 1, 0
NoviceDifficultySettings
   .byte $01, 20
   .byte $81, 18
   .byte $01, 24
   .byte $C2, 10
   .byte $01, 10
   .byte $81, 16, 0
ProDifficultySettings
   .byte $01, 10
   .byte $C2, 10
   .byte $01, 6
   .byte $81, 8
   .byte $01, 8
   .byte $81, 18
   .byte $C2, 10
   .byte $01, 8
   .byte $81, 10, 0
ExpertDifficultySettings
   .byte $01, 10
   .byte $81, 8
   .byte $C2, 15
   .byte $01, 8
   .byte $C2, 10
   .byte $81, 10
   .byte $01, 10
   .byte $81, 20
   .byte $C2, 12, 0
       
CarGraphics
   .byte $A0 ; |X.X.....|
   .byte $E0 ; |XXX.....|
   .byte $A0 ; |X.X.....|
   .byte $80 ; |X.......|
   
LF75D: .byte $08 ; |    X   | $F75D
       .byte $10 ; |   X    | $F75E
       .byte $20 ; |  X     | $F75F
       
ObstacleVertSizeTable
   .byte 1, 2, 4
       
ObstacleSizeTable
   .byte MSBL_SIZE2 | ONE_COPY
   .byte MSBL_SIZE2 | DOUBLE_SIZE
   .byte MSBL_SIZE2 | QUAD_SIZE

ObstacleDataPointers
   .word CarData,TreeData,HouseData,TreeData,CrashedCarData

ObstacleSpriteData
TreeData
   .byte $18 ; |...XX...|
   .byte GREEN+4
   .byte $3C ; |..XXXX..|
   .byte GREEN+4
   .byte $7E ; |.XXXXXX.|
   .byte GREEN+4
   .byte $FF ; |XXXXXXXX|
   .byte GREEN+4
   .byte $FF ; |XXXXXXXX|
   .byte GREEN+4
   .byte $18 ; |...XX...|
   .byte ORANGE+4
   .byte $18 ; |...XX...|
   .byte ORANGE+4
   .byte $18 ; |...XX...|
   .byte ORANGE+4
HouseData       
   .byte $18 ; |...XX...|
   .byte RED+6
   .byte $3C ; |..XXXX..|
   .byte RED+6
   .byte $7E ; |.XXXXXX.|
   .byte RED+6
   .byte $FF ; |XXXXXXXX|
   .byte RED+6
   .byte $7A ; |.XXXX.X.|
   .byte BLACK+12
   .byte $6A ; |.XX.X.X.|
   .byte BLACK+12
   .byte $6E ; |.XX.XXX.|
   .byte BLACK+12
   .byte $6E ; |.XX.XXX.|
   .byte BLACK+12
CrashedCarData       
   .byte $78 ; |.XXXX...|
   .byte BLUE+6
   .byte $FC ; |XXXXXX..|
   .byte BLUE+4
   .byte $96 ; |X..X.XX.|
   .byte BLUE+4
   .byte $7A ; |.XXXX.X.|
   .byte BLUE+2
   .byte $3E ; |..XXXXX.|
   .byte BLUE+2
   .byte $33 ; |..XX..XX|
   .byte ORANGE+12
   .byte $1F ; |...XXXXX|
   .byte BLUE+2
   .byte $12 ; |...X..X.|
   .byte BLUE+2
CarData       
   .byte $3C ; |..XXXX..|
   .byte BLUE+8
   .byte $7E ; |.XXXXXX.|
   .byte BLUE+6
   .byte $CB ; |XX..X.XX|
   .byte BLUE+4
   .byte $9D ; |X..XXX.X|
   .byte BLUE+2
   .byte $FF ; |XXXXXXXX|
   .byte BLUE+2
   .byte $C3 ; |XX....XX|
   .byte ORANGE+12
   .byte $FF ; |XXXXXXXX|
   .byte BLUE+2
   .byte $42 ; |.X....X.|
   .byte BLUE+2
       
LF7B0:
   .byte -4
   .byte -3
   .byte -2
   .byte -1
   .byte 0
   .byte 0
   .byte 0
   .byte 1
   .byte 2
   .byte 3
   .byte 4
       
NumberFonts
zero
   .byte $0E ; |....XXX.|
   .byte $0A ; |....X.X.|
   .byte $0A ; |....X.X.|
   .byte $0A ; |....X.X.|
   .byte $0E ; |....XXX.|
one
   .byte $22 ; |..X...X.|
   .byte $22 ; |..X...X.|
   .byte $22 ; |..X...X.|
   .byte $22 ; |..X...X.|
   .byte $22 ; |..X...X.|
two
   .byte $EE ; |XXX.XXX.|
   .byte $22 ; |..X...X.|
   .byte $EE ; |XXX.XXX.|
   .byte $88 ; |X...X...|
   .byte $EE ; |XXX.XXX.|
three
   .byte $EE ; |XXX.XXX.|
   .byte $22 ; |..X...X.|
   .byte $66 ; |.XX..XX.|
   .byte $22 ; |..X...X.|
   .byte $EE ; |XXX.XXX.|
four
   .byte $AA ; |X.X.X.X.|
   .byte $AA ; |X.X.X.X.|
   .byte $EE ; |XXX.XXX.|
   .byte $22 ; |..X...X.|
   .byte $22 ; |..X...X.|
five
   .byte $EE ; |XXX.XXX.|
   .byte $88 ; |X...X...|
   .byte $EE ; |XXX.XXX.|
   .byte $22 ; |..X...X.|
   .byte $EE ; |XXX.XXX.|
six
   .byte $EE ; |XXX.XXX.|
   .byte $88 ; |X...X...|
   .byte $EE ; |XXX XXX.|
   .byte $AA ; |X.X.X.X.|
   .byte $EE ; |XXX.XXX.|
seven
   .byte $EE ; |XXX.XXX.|
   .byte $22 ; |..X...X.|
   .byte $22 ; |..X...X.|
   .byte $22 ; |..X...X.|
   .byte $22 ; |..X...X.|
eight
   .byte $EE ; |XXX.XXX.|
   .byte $AA ; |X.X.X.X.|
   .byte $EE ; |XXX.XXX.|
   .byte $AA ; |X.X.X.X.|
   .byte $EE ; |XXX.XXX.|
nine
   .byte $EE ; |XXX.XXX.|
   .byte $AA ; |X.X.X.X.|
   .byte $EE ; |XXX.XXX.|
   .byte $22 ; |..X...X.|
   .byte $EE ; |XXX.XXX.|
   
LF7ED
   .byte BROWN+2
   .byte ORANGE+4
   .byte BLUE_PURPLE+6
   .byte YELLOW+2
   .byte BRIGHT_GREEN+4
   .byte GREEN_BROWN+6
   .byte RED+2
   .byte BLUE+4
LF7F5: .byte $00 ; |        | $F7F5
       .byte $0C ; |    XX  | $F7F6
       .byte $0C ; |    XX  | $F7F7
       .byte $0A ; |    X X | $F7F8
       .byte $0E ; |    XXX | $F7F9
       .byte $0F ; |    XXXX| $F7FA
       .byte $0F ; |    XXXX| $F7FB
       
   .org ROMTOP+2048-4, 0            ; 2K ROM
   .word Start
   .word 0
