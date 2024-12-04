   LIST OFF
; ***  Y A R ' S  R E V E N G E  ***
; Copyright 1982 Atari, Inc.
; Designer: Howard Scott Warshaw

; Analyzed, labeled and commented
;  by Dennis Debro
; Last Update: Sept. 21, 2005
;
; - This was HSW first game published by Atari.
; - The shield flickers. It's sort of hard to tell but it's drawn ~ every
;   other frame. The neutral zone is shown on the alternate frames.
; - This game uses a lot of state flags.
; - It seems RAM locations $A1, $B9 - $BC, $F3 - $FD are not used (17 bytes
;   free). RAM locations $FE - $FF are used to RTS to the kernel that should
;   be used for display.
; - The Qotile missile is the only object that has it's game speeds adjusted
;   for PAL.
; - The game colors and kernel heights are adjusted for PAL.

   processor 6502

;
; NOTE: You must compile this with vcs.h version 105 or greater.
;
TIA_BASE_READ_ADDRESS = $30         ; set the read address base so this runs on
                                    ; the real VCS and compiles to the exact
                                    ; ROM image

   include vcs.h
   include macro.h
   
;==============================================================================
; T I A - C O N S T A N T S
;==============================================================================

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

; values for RESMPx
LOCK_MISSILE      = %10
UNLOCK_MISSILE    = %00

; values for REFPx:
NO_REFLECT        = %0000
REFLECT           = %1000

; values for NUSIZx:
ONE_COPY          = %000
TWO_COPIES        = %001
TWO_MED_COPIES    = %010
THREE_COPIES      = %011
TWO_WIDE_COPIES   = %100
DOUBLE_SIZE       = %101
THREE_MED_COPIES  = %110
QUAD_SIZE         = %111
MSBL_SIZE1        = %000000
MSBL_SIZE2        = %010000
MSBL_SIZE4        = %100000
MSBL_SIZE8        = %110000

; values for CTRLPF:
PF_PRIORITY       = %100
PF_REFLECT        = %01
PF_NO_REFLECT     = %00

; values for SWCHB
P1_DIFF_MASK      = %10000000
P0_DIFF_MASK      = %01000000
BW_MASK           = %00001000
SELECT_MASK       = %00000010
RESET_MASK        = %00000001

VERTICAL_DELAY    = 1

; SWCHA joystick bits:
MOVE_RIGHT        = %01111111
MOVE_LEFT         = %10111111
MOVE_DOWN         = %11011111
MOVE_UP           = %11101111
NO_MOVE           = %11111111

   LIST ON

;============================================================================
; A S S E M B L E R - S W I T C H E S
;============================================================================

NTSC                    = 0
PAL                     = 1

COMPILE_VERSION         = NTSC      ; change this to compile for different
                                    ; regions

;============================================================================
; U S E R - C O N S T A N T S
;============================================================================

ROMTOP                  = $F000

NTSC_OVERSCAN_TIME      = 34
NTSC_VBLANK_TIME        = 42
PAL_VBLANK_TIME         = 54
PAL_OVERSCAN_TIME       = 43

   IF COMPILE_VERSION = NTSC

VBLANK_TIME             = NTSC_VBLANK_TIME
OVERSCAN_TIME           = NTSC_OVERSCAN_TIME

H_KERNEL                = 192

YAR_YMIN                = 4
YAR_YMAX                = 174
SHIELD_YMAX             = 63

YAR_XMIN                = 5

NUM_TOP_BLANK_SCANLINES = 39
NUM_BOTTOM_SCANLINES    = 113
LINES_BETWEEN_SCORES    = 35
BOTTOM_STATUS_LINES     = 41

; frame delay values   
FRAME_DELAY_0           = 255       ; move every frame
FRAME_DELAY_HALF        = 127       ; move 1 out of 2 frames
FRAME_DELAY_THIRD       = 85        ; move 1 out of 3 frames
FRAME_DELAY_FOURTH      = 63        ; move 1 out of 4 frames
FRAME_DELAY_FIFTH       = 51        ; move 1 out of 5 frames

; NTSC color constants

BLACK                   = $00
WHITE                   = $0E
RED                     = $30
ORANGE                  = $40
DK_PINK                 = $50
DK_BLUE                 = $70
BLUE                    = $80
DK_GREEN                = $D0
BROWN                   = $F0

   ELSE
   
VBLANK_TIME             = PAL_VBLANK_TIME
OVERSCAN_TIME           = PAL_OVERSCAN_TIME

H_KERNEL                = 227

YAR_YMIN                = 6
YAR_YMAX                = 206
SHIELD_YMAX             = 99

YAR_XMIN                = 6

NUM_TOP_BLANK_SCANLINES = 48
NUM_BOTTOM_SCANLINES    = 139
LINES_BETWEEN_SCORES    = 51
BOTTOM_STATUS_LINES     = 51

; frame delay values   
FRAME_DELAY_0           = 255       ; move every frame
FRAME_DELAY_HALF        = 148       ; move 1 out of 2 frames
FRAME_DELAY_THIRD       = 99        ; move 1 out of 3 frames
FRAME_DELAY_FOURTH      = 74        ; move 1 out of 4 frames
FRAME_DELAY_FIFTH       = 60        ; move 1 out of 5 frames

; PAL color constants

BLACK                   = $00
WHITE                   = $0E
BROWN                   = $20
RED                     = $40
DK_PINK                 = $60
BLUE                    = $90
DK_BLUE                 = BLUE
DK_GREEN                = $E0

   ENDIF
   
ZORLON_CANNON_XMIN      = 6
XMAX                    = 160

SHIELD_YMIN             = 2

H_FONT                  = 7
H_YAR                   = 9
H_SWIRL                 = 9
H_QOTILE                = 10
H_SHIELD_CELL           = 7

NUM_SHIELD_BYTES        = 15        ; number of bytes used for the shield

INIT_NUM_LIVES          = 4
MAX_LIVES               = 9

NUM_DEATH_SPRITES       = 5

SELECT_DELAY            = 31

INIT_QOTILE_X           = 150

INIT_YAR_Y              = 100

NEUTRAL_ZONE_MASK       = %11111110

; point values (BCD)
DESTROY_CELL_POINT_VALUE   = $69
DESTROY_QOTILE_POINT_VALUE = $10

; game state values
GAME_OVER               = %10000000
SHOW_SELECT_SCREEN      = %01000000
SWIRL_TRIPLE_FREQ       = %00100000
SWIRL_SEEK_YAR          = %00010000
SHOW_COPYRIGHT          = %00001000
GAME_SELECTION_MASK     = %00000111
ULTIMATE_YARS_GAME      = 6

; Qotile status values
SWIRL_ACTIVE            = %10000000
SWIRL_TRAVELING         = %01000000
SUPPRESS_YAR_SHOT       = %00100000
SOLID_SHIELD            = %00010000

; playfield control status values
QOTILE_MISSILE_ACTIVE   = %10000000
YAR_HIT_PLAYFIELD       = %01000000

; Zorlon Cannon status values
CANNON_NOT_MOVING       = %10000000
ZORLON_CANNON_ACTIVE    = %01000000
ZORLON_CANNON_FIRED     = %00100000
YAR_MISSILE_FIRED       = %00010000

; game board status values
ZORLON_CANNON_BOUNCED   = %10000000
TWO_PLAYER_GAME         = %01000000
SWIRL_VERT_LOCK         = %00100000
SWIRL_HORIZ_LOCK        = %00010000
RESTART_LEVEL           = %00001000
ONE_PLAYER_GAME         = %00000100
PLAYER_TWO_SHIELD_RESTORED = %00000010
ACTIVE_PLAYER_MASK      = %00000001

; Yar status values
LOSING_LIFE             = %10000000
IMPLODING_ANIMATION     = %01000000
EXPLODING_ANIMATION     = %00100000

; kernel status values
YAR_FLAP_UP             = %01000000
RESET_QOTILE_POSITION   = %00100000
RESET_YAR_POSITION      = %00010000
SHIELD_TRAVEL_UP        = %00001000
KERNEL_ID_MASK          = %00000111

; explosion status values
EXPLOSION_ACTIVE        = %10000000
REDUCE_EXPLOSION_ZONE   = %00100000
EXPLOSION_TIMER         = %00011111

; Yar sound flag values
MISSILE_HIT_SHIELD_SND  = %10000000
YAR_BOUNCE_SOUND        = %01000000
EATING_SHIELD_SOUND     = %00000001

ID_SHIELD_KERNEL        = 0
ID_NEUTRAL_ZONE_KERNEL  = 2
ID_EXPLOSION_KERNEL     = 4
ID_STATUS_KERNEL        = 6

;============================================================================
; Z P - V A R I A B L E S
;============================================================================

gameState               = $80
currentShieldGraphics   = $81       ; $81 - $90
neutralZoneMask         = $91
qotileMissileSpeedIndex = $92
yarColor                = $93
qotileStatus            = $94
kernelStatus            = $95
zorlonCannonStatus      = $96
yarStatus               = $97
zorlonCannonVertPos     = $98
zorlonCannonHorizPos    = $99
shieldVertPos           = $9A
shieldSectionHeight     = $9B
shieldGraphicIndex      = $9C
yarGraphicIndex         = $9D
lives                   = $9E
yarVertPos              = $9F
yarHorizPos             = $A0
yarMoving               = $A2       ; 0 = Yar not moving
yarGraphicPtrs          = $A3       ; $A3 - $A4
yarMissileVertPos       = $A5
yarMissileHorizPos      = $A6
yarSoundFlags           = $A7
explosionStatus         = $A8
qotileGraphicIndex      = $A9
qotileVertPos           = $AA
qotileHorizPos          = $AB
qotileGraphicPtrs       = $AC       ; $AC - $AD
qotileMissileVertPos    = $AE
qotileMissileHorizPos   = $AF
travelingSwirlSound     = $B0
explosionFrequency      = $B1
tempCharHolder          = $B2
;--------------------------------------
yarRotationValue        = tempCharHolder
;--------------------------------------
saveY                   = yarRotationValue
;--------------------------------------
dividedBy8              = saveY
tempHorizPos            = $B3
tempVertPos             = $B4
playfieldControlStatus  = $B5
qotileMissileFrameDelay = $B6
statusLoopCount         = $B7
;--------------------------------------
explosionUpperLimit     = statusLoopCount
explosionLowerLimit     = $B8
graphicPointers         = $BD       ; $BD - $C8
tempShieldGraphics      = $C9       ; $C9 - $D8
reserveNeutralZoneMask  = $D9
reserveQotileMissileIdx = $DA
reservedYarColor        = $DB
reservedQotileStatus    = $DC
attractModeColors       = $DD
swirlMissedYar          = $DE
yarLeftBounces          = $DF
playerScores            = $E0       ; $E0 - $E7
;--------------------------------------
player1Score            = playerScores
player2Score            = player1Score+4
qotileColor             = $E8
gameTimer               = $E9
loopCount               = $EA
;--------------------------------------
swirlMotion             = loopCount
;--------------------------------------
joystickValue           = swirlMotion
;--------------------------------------
saveX                   = joystickValue
;--------------------------------------
neutralZonePtr          = gameTimer ; $E9 - $EA
;--------------------------------------
explosionGraphicPtr     = neutralZonePtr
gameBoardStatus         = $EB
scoreDataPtr            = $EC       ; $EC - $ED    $ED always 0 -- used for kernel
playerScorePtr          = $EE       ; $EE - $EF    $EF always 0
trons                   = $F0
easterEggTrigger        = $F1
colorMask               = $F2

;============================================================================
; R O M - C O D E (Part 1)
;============================================================================

   SEG Bank0
   org ROMTOP
   
ShieldKernel SUBROUTINE
   inx                        ; 2         increment scan line
   ldy yarGraphicIndex        ; 3
   cpx yarVertPos             ; 3
   sta WSYNC
;--------------------------------------
   bcc .drawYarSprite         ; 2³
   dey                        ; 2
   beq .drawYarSprite         ; 2³
   sty yarGraphicIndex        ; 3
.drawYarSprite
   lda (yarGraphicPtrs),y     ; 5
   sta GRP1                   ; 3 = @17
   lda #0                     ; 2
   sta PF2                    ; 3 = @22
   cpx shieldVertPos          ; 3
   bit shieldVertPos          ; 3
   bcs .prepareShieldDraw     ; 2³
   bpl SkipShieldDraw         ; 2
.prepareShieldDraw
   ldy shieldSectionHeight    ; 3
   dey                        ; 2
   bpl .skipShieldIdxReduction; 2³
   ldy #H_SHIELD_CELL         ; 2
   dec shieldGraphicIndex     ; 5
.skipShieldIdxReduction
   sty shieldSectionHeight    ; 3
   ldy shieldGraphicIndex     ; 3
   bmi SkipShieldDraw         ; 2³
   lda currentShieldGraphics,y; 4
   sta PF2                    ; 3 = @61
SkipShieldDraw
   inx                        ; 2
   lda #0                     ; 2
   ldy qotileGraphicIndex     ; 3
   cpx qotileVertPos          ; 3
   sta WSYNC
;--------------------------------------
   sta PF2                    ; 3 = @03
   bcc .drawQotileSprite      ; 2³
   dey                        ; 2
   beq .drawQotileSprite      ; 2³
   sty qotileGraphicIndex     ; 3
.drawQotileSprite
   lda (qotileGraphicPtrs),y  ; 5
   sta GRP0                   ; 3 = @20
   cpx shieldVertPos          ; 3
   bcc .skipShieldDraw2       ; 2³
   ldy shieldSectionHeight    ; 3
   dey                        ; 2
   bmi .prepareShieldDraw2    ; 2³
   nop                        ; 2
   lda #0                     ; 2
   beq .skipShieldIdxReduction2; 3         unconditional branch
   
.prepareShieldDraw2
   ldy #H_SHIELD_CELL         ; 2
   dec shieldGraphicIndex     ; 5
.skipShieldIdxReduction2
   sty shieldSectionHeight    ; 3
   ldy shieldGraphicIndex     ; 3
   bmi .skipShieldDraw2       ; 2³
   lda currentShieldGraphics,y; 4
   sta PF2                    ; 3
.skipShieldDraw2
   cpx #H_KERNEL              ; 2
   bcc ShieldKernel           ; 2³
   jmp Overscan               ; 3
   
NeutralZoneKernel SUBROUTINE
   inx                        ; 2
   ldy yarGraphicIndex        ; 3
   cpx yarVertPos             ; 3
   sta WSYNC
;--------------------------------------
   bcc .drawYarSprite         ; 2³
   dey                        ; 2
   beq .drawYarSprite         ; 2³
   sty yarGraphicIndex        ; 3
.drawYarSprite
   lda (yarGraphicPtrs),y     ; 5
   sta GRP1                   ; 3 = @17
   txa                        ; 2
   ldx #ENABL                 ; 2
   txs                        ; 2         point stack to ENABL
   tax                        ; 2
   tay                        ; 2
   eor (neutralZonePtr),y     ; 5
   and neutralZoneMask        ; 3
   sta PF2                    ; 3 = @38
   and #$F7                   ; 2
   sta COLUPF                 ; 3 = @43
   ldy #0                     ; 2
   txa                        ; 2
   sbc zorlonCannonVertPos    ; 3
   bmi .drawZorlonCannon      ; 2³
   cmp #6                     ; 2
   bcs .drawZorlonCannon      ; 2³
   tya                        ; 2
.drawZorlonCannon
   php                        ; 3 = @61   enable/disable ball
   sty PF2                    ; 3 = @64
PrepareNextNeutralZoneLine
   inx                        ; 2
   ldy qotileGraphicIndex     ; 3
   cpx qotileVertPos          ; 3
   sta WSYNC
;--------------------------------------
   bcc .drawQotileSprite      ; 2³
   dey                        ; 2
   beq .drawQotileSprite      ; 2³
   sty qotileGraphicIndex     ; 3
.drawQotileSprite
   lda (qotileGraphicPtrs),y  ; 5
   sta GRP0                   ; 3 = @17
   txa                        ; 2
   eor #$FF                   ; 2
   tay                        ; 2
   eor (neutralZonePtr),y     ; 5
   and neutralZoneMask        ; 3
   beq .skipNeutralZoneDraw   ; 2³
   sta PF2                    ; 3 = @36
   jmp .drawMissiles          ; 3
   
.skipNeutralZoneDraw
   lda #$5A                   ; 2
   sta COLUPF                 ; 3 = @39
.drawMissiles
   cpx yarMissileVertPos      ; 3
   php                        ; 3 = @45   enable/disable missile 1
   cpx qotileMissileVertPos   ; 3
   php                        ; 3 = @51   enable/disable missile 0
   lda #0                     ; 2
   sta PF2                    ; 3 = @56
   cpx #H_KERNEL              ; 2
   bcc NeutralZoneKernel      ; 2³
   ldx #$FF                   ; 2
   txs                        ; 2         restore stack to point to beginning
   jmp Overscan               ; 3
   
ExplosionKernel SUBROUTINE
   sta WSYNC
;--------------------------------------
   inx                        ; 2         increment scan line
   lda #1                     ; 2
   sta GRP0                   ; 3 = @07
   sta COLUP0                 ; 3 = @10
   cpx explosionUpperLimit    ; 3
   bcc .skipPlayfieldDraw     ; 2³
   cpx explosionLowerLimit    ; 3
   bcc .drawExplosion         ; 2³
.skipPlayfieldDraw
   lda #0                     ; 2
   sta PF0                    ; 3 = @25
   sta PF1                    ; 3 = @28
   sta PF2                    ; 3 = @31
   sta COLUBK                 ; 3 = @34
   beq PrepareToDrawYar       ; 3+1       unconditional branch
   
.drawExplosion
   txa                        ; 2
   tay                        ; 2
   lda (explosionGraphicPtr),y; 5
   sta PF0                    ; 3 = @33
   sta PF1                    ; 3 = @36
   sta PF2                    ; 3 = @39
   sta COLUPF                 ; 3 = @42
   lda gameTimer              ; 3
   sta COLUBK                 ; 3 = @48
PrepareToDrawYar
   inx                        ; 2         increment scan line
   ldy yarGraphicIndex        ; 3
   cpx yarVertPos             ; 3
   sta WSYNC
;--------------------------------------
   bcc .drawYar               ; 2³
   dey                        ; 2
   beq .drawYar               ; 2³
   sty yarGraphicIndex        ; 3
.drawYar
   lda (yarGraphicPtrs),y     ; 5
   sta GRP1                   ; 3 = @17
   cpx #H_KERNEL              ; 2
   bne ExplosionKernel        ; 2³+1
   jmp Overscan               ; 3
   
StatusKernel
   ldx #6                     ; 2
   sta WSYNC
;--------------------------------------
.coarseMovePlayers
   dex                        ; 2
   bpl .coarseMovePlayers     ; 2³
   nop                        ; 2
   sta RESP0                  ; 3 = @39   coarse move GRP0 to pixel 117
   sta RESP1                  ; 3 = @42   coarse move GRP1 to pixel 126
   lda #HMOVE_R1              ; 2
   sta HMP0                   ; 3 = @47   place GRP0 to pixel 118
   lda gameTimer              ; 3
   bne .skipColorMaskSet      ; 2³        branch if cycling colors
   lda #$F7                   ; 2
   sta colorMask              ; 3
.skipColorMaskSet
   sta WSYNC
;--------------------------------------
   sta HMOVE                  ; 3
   lda #NO_REFLECT            ; 2
   sta REFP0                  ; 3 = @08
   sta REFP1                  ; 3 = @11
   sta statusLoopCount        ; 3
   lda #DK_BLUE+12            ; 2
   and colorMask              ; 3
   sta COLUP0                 ; 3 = @22
   sta COLUP1                 ; 3 = @25
   ldx #10                    ; 2
   lda #>NumberFonts          ; 2
.setGraphicPointersMSB
   sta graphicPointers+1,x    ; 4
   dex                        ; 2
   dex                        ; 2
   bpl .setGraphicPointersMSB ; 2³
   lda #<player1Score         ; 2
   sta scoreDataPtr           ; 3
   ldx #NUM_TOP_BLANK_SCANLINES; 2
.skipTopScanlines
   dex                        ; 2
   sta WSYNC
;--------------------------------------
   bne .skipTopScanlines      ; 2³
   stx GRP0                   ; 3 = @05   x = #$00
   stx GRP1                   ; 3 = @08
   lda #THREE_COPIES          ; 2
   sta NUSIZ0                 ; 3 = @13
   sta NUSIZ1                 ; 3 = @16
   sta VDELP0                 ; 3 = @19
   sta VDELP1                 ; 3 = @22
   lda statusLoopCount        ; 3
   ror                        ; 2
   bcs DisplayNumberOfLives   ; 2³
   lda #SHOW_COPYRIGHT        ; 2
   bit gameState              ; 3
   bvs .checkToShowEasterEgg  ; 2³        branch if showing select screen
   beq BCDToDigits            ; 2³        branch if not showing copyright info
   bpl BCDToDigits            ; 2³        branch if game in progress
   
   IF COMPILE_VERSION = PAL
   
      sta WSYNC
      
   ENDIF
   
.checkToShowEasterEgg
   lda easterEggTrigger       ; 3
   beq .displaySelectLiteral  ; 2³        branch if not showing Easter Egg
   ldy #11                    ; 2
   bne DisplayLiterals        ; 3         unconditional branch
   
.displaySelectLiteral
   ldy #5                     ; 2
DisplayLiterals
   ldx #10                    ; 2
.displayLiteralsLoop
   lda #SHOW_COPYRIGHT        ; 2
   bit gameState              ; 3
   beq DisplayStatusLiteral   ; 2³        branch if not showing copyright info
   lda CopyrightLSBTable,y    ; 4
   bne .setGraphicPointers    ; 3         unconditional branch
   
DisplayStatusLiteral
   lda StatusLiteralLSBTable,y; 4
.setGraphicPointers
   sta graphicPointers,x      ; 4
   dex                        ; 2
   dey                        ; 2
   dex                        ; 2
   bpl .displayLiteralsLoop   ; 2³
   bmi SixDigitKernel         ; 3         unconditional branch
   
BCDToDigits
   ldx #0                     ; 2
   ldy #0                     ; 2
.bcdToDigitsLoop
   lda (scoreDataPtr),y       ; 5
   and #$F0                   ; 2
   lsr                        ; 2
   sta graphicPointers,x      ; 4
   lda (scoreDataPtr),y       ; 5
   and #$0F                   ; 2
   asl                        ; 2
   asl                        ; 2
   asl                        ; 2
   inx                        ; 2
   inx                        ; 2
   sta graphicPointers,x      ; 4
   iny                        ; 2
   inx                        ; 2
   inx                        ; 2
   cpy #3                     ; 2
   bne .bcdToDigitsLoop       ; 2³
   ldy #0                     ; 2
   ldx #<Blank                ; 2
.suppressZeroLoop
   lda graphicPointers,y      ; 4
   bne .jmpToSixDigitKernel   ; 2³
   stx graphicPointers,y      ; 4
   iny                        ; 2
   iny                        ; 2
   cpy #9                     ; 2
   bcc .suppressZeroLoop      ; 2³
.jmpToSixDigitKernel
   bne SixDigitKernel         ; 3
   
DisplayNumberOfLives
   lda #<Blank                ; 2 = @32
   sta graphicPointers        ; 3         point graphic pointers to draw blank
   sta graphicPointers+2      ; 3
   sta graphicPointers+4      ; 3
   sta graphicPointers+6      ; 3
   sta graphicPointers+8      ; 3
   ldy #3                     ; 2         set index to read number of lives
   lda (scoreDataPtr),y       ; 5         read number of lives
   and #$F0                   ; 2
   bne .setLivesPointer       ; 2³
   bit gameState              ; 3 = @61
   bvs .setLivesPointer       ; 2³        branch if showing select screen
   lda #<Blank * 2            ; 2 = @65   set to point to Blank character
.setLivesPointer
   lsr                        ; 2
   sta graphicPointers+10     ; 3
   sta WSYNC
;--------------------------------------
SixDigitKernel
   lda #H_FONT-1              ; 2
   sta loopCount              ; 3
.sixDigitLoop
   ldy loopCount              ; 3
   lda (graphicPointers),y    ; 5
   sta GRP0                   ; 3
   sta WSYNC
;--------------------------------------
   lda (graphicPointers+2),y  ; 5
   sta GRP1                   ; 3 = @08
   lda (graphicPointers+4),y  ; 5
   sta GRP0                   ; 3 = @16
   lda (graphicPointers+6),y  ; 5
   sta tempCharHolder         ; 3
   lda (graphicPointers+8),y  ; 5
   tax                        ; 2
   lda (graphicPointers+10),y ; 5
   tay                        ; 2
   lda tempCharHolder         ; 3
   sta GRP1                   ; 3 = @34
   stx GRP0                   ; 3 = @37
   sty GRP1                   ; 3 = @40
   sty GRP0                   ; 3 = @43
   dec loopCount              ; 5
   bpl .sixDigitLoop          ; 2³
   lda #0                     ; 2
   sta GRP0                   ; 3 = @55
   sta GRP1                   ; 3 = @58
   sta VDELP0                 ; 3 = @61
   sta VDELP1                 ; 3 = @64
   sta NUSIZ0                 ; 3 = @67
   sta NUSIZ1                 ; 3 = @70
   inc statusLoopCount        ; 5
;--------------------------------------
   lda #~3                    ; 2
   bit statusLoopCount        ; 3
   bne DoneStatusKernel       ; 2³
   ldx #17                    ; 2
   lda #2                     ; 2
   cmp statusLoopCount        ; 3
   bne .jmpSkipTopScanlines   ; 2³
   ldx #NUM_BOTTOM_SCANLINES  ; 2
   lsr                        ; 2
   bit gameState              ; 3
   beq .skipBottomScanlines   ; 2³
   bvs .skipBottomScanlines   ; 2³        branch if showing select screen
   lda #<player2Score         ; 2
   sta scoreDataPtr           ; 3
   lda #BROWN+14              ; 2
   and colorMask              ; 3
   sta COLUP0                 ; 3
   sta COLUP1                 ; 3
   ldx #LINES_BETWEEN_SCORES  ; 2
.jmpSkipTopScanlines
   jmp .skipTopScanlines      ; 3
   
DoneStatusKernel
   ldx #BOTTOM_STATUS_LINES   ; 2
.skipBottomScanlines
   sta WSYNC
;--------------------------------------
   dex                        ; 2
   bne .skipBottomScanlines   ; 2³
Overscan
   sta WSYNC                        ; wait for next scan line
   lda #%00000010
   sta VBLANK                       ; disable TIA (D1 = 1)
   ldx #0                           ; not needed -- x already 0
   stx PF0                          ; clear the playfield registers
   stx PF1
   stx PF2
   lda #OVERSCAN_TIME
   sta TIM64T                       ; set timer for overscan period
   lda kernelStatus
   and #KERNEL_ID_MASK              ; mask value to get current kernel id
   cmp #ID_STATUS_KERNEL            ; see if status kernel is being displayed
   bne CheckPlayerCollisions        ; branch if not showing status kernel
   bit gameState                    ; check the current game state
   bvs CheckPlayerCollisions        ; branch if showing select screen
   lda gameBoardStatus              ; get current game board status
   and #ACTIVE_PLAYER_MASK          ; mask to get current active player
   tax                              ; move player number to x
   lda INPT4,x                      ; see if player has pressed fire button
   bmi CheckPlayerCollisions        ; branch if fire button not pressed
   lda #SUPPRESS_YAR_SHOT
   ora qotileStatus                 ; set status to not suppress Yar's
   sta qotileStatus                 ; missile from firing at startup
   lda #0
   tay
   jsr IncrementScore
   lda yarColor                     ; get color for Yar
   sta COLUP1                       ; color Yar sprite
   lda kernelStatus
   and #~KERNEL_ID_MASK
   ora #RESET_QOTILE_POSITION | RESET_YAR_POSITION
   sta kernelStatus
   lda gameBoardStatus
   and #~ONE_PLAYER_GAME
   sta gameBoardStatus              ; set new game board status
   ror                              ; shift current player number to carry
   bcc .jmpToVerticalSync           ; branch if player 1 active
   ror                              ; rotate player 2 shield restored to carry
   bcs .jmpToVerticalSync           ; branch if player 2 shield restored
   lda #PLAYER_TWO_SHIELD_RESTORED
   ora gameBoardStatus              ; set flag to show player 2 shield restored
   sta gameBoardStatus
   jmp RestoreShieldGraphics
   
.jmpToVerticalSync
   jmp VerticalSync
   
CheckPlayerCollisions
   lda #ONE_PLAYER_GAME
   bit gameBoardStatus
   bne .jmpToVerticalSync           ; branch if one player game
   lda gameTimer                    ; get current game timer value
   ror                              ; shift D0 to carry
   bcs CheckDestroyerMissileCollision; check missile collision if an odd frame
   bit explosionStatus              ; check the explosion status
   bmi .checkMissilesHittingShield  ; branch if explosion is active
   bit yarStatus                    ; check Yar status
   bmi CheckForYarAndQotileCollision; branch if losing life
   bit CXP1FB                       ; check if Yar collided with PF
   bpl CheckForYarAndQotileCollision; branch if Yar did not hit PF
   lda yarVertPos                   ; get Yar's vertical position
   adc #H_SHIELD_CELL
   sta tempVertPos
   lda yarHorizPos                  ; get Yar's horizontal position
   sec
   sbc #7                           ; bounce Yar backwards 7 pixels
   sta yarHorizPos
   adc #11
   sta tempHorizPos
   jsr DetermineShieldCellRemoved
   bcc .skipShieldPoints            ; branch if not "eating" shield
   inc trons                        ; increment trons for "eating" shield
   lda #EATING_SHIELD_SOUND
   ora yarSoundFlags
   sta yarSoundFlags
   jsr CheckToActivateZorlonCannon
   lda #1
   tay
   jsr IncrementScore
.skipShieldPoints
   lda #HMOVE_L7                    ; HMOVE Yar sprite left 7 pixels
   sta HMP1                         ; set Yar's fine motion value
   lda #YAR_BOUNCE_SOUND
   ora yarSoundFlags
   sta yarSoundFlags
CheckForYarAndQotileCollision
   bit CXPPMM                       ; check player/missile collisions
   bpl .checkMissilesHittingShield  ; branch if the players didn't collide
   bit qotileStatus                 ; check Qotile status
   bmi .turnOffSwirl                ; branch if Swirl active
   lda swirlMissedYar               ; see if Swirl missed Yar
   bne .turnOffSwirl                ; branch if Swirl missed Yar this frame
   jsr CheckToActivateZorlonCannon
   inc trons                        ; increment tron count by 2 for touching
   inc trons                        ; Qotile
.checkMissilesHittingShield
   jmp CheckForMissileHittingShield
   
.turnOffSwirl
   lda #~(SWIRL_ACTIVE | SWIRL_TRAVELING)
   and qotileStatus
   sta qotileStatus
   inc qotileColor
   inc qotileColor
   lda #RESET_QOTILE_POSITION
   ora kernelStatus                 ; set RESET_QOTILE_POSITION flag
   sta kernelStatus
   rol yarStatus                    ; rotate losing life flag to carry
   sec                              ; set carry bit
   ror yarStatus                    ; to set that Yar is losing life
   bne .checkMissilesHittingShield  ; unconditional branch
   
CheckDestroyerMissileCollision
   bit CXM0P                        ; check if missile0 player collisions
   bpl .checkMissileHitCannon       ; branch if missile0 didn't hit Yar
   bit playfieldControlStatus       ; check playfield control status
   bvs .checkMissileHitCannon       ; branch if Yar in Neutral Zone
   rol yarStatus                    ; rotate losing life flag to carry
   sec                              ; set carry bit
   ror yarStatus                    ; to set that Yar is losing life
   rol playfieldControlStatus       ; rotate Destroyer Missile status to carry
   clc                              ; clear carry
   ror playfieldControlStatus       ; to clear Destroyer Missile status
.checkMissileHitCannon
   bit CXM0FB                       ; check missile0 PF/BALL collisions
   bvc CheckYarPlayfieldCollision   ; branch if missile0 didn't hit BALL
   jsr CheckGameDifficultyValue
   bcc CheckYarPlayfieldCollision   ; branch if difficulty set to AMATEUR
   lda #ZORLON_CANNON_FIRED
   bit zorlonCannonStatus
   beq CheckYarPlayfieldCollision   ; branch if Zorlon Cannon not fired
   lda zorlonCannonStatus
   and #$1F
   ora #CANNON_NOT_MOVING
   sta zorlonCannonStatus
   rol playfieldControlStatus       ; rotate Destroyer Missile status to carry
   clc                              ; clear carry
   ror playfieldControlStatus       ; to clear Destroyer Missile status
CheckYarPlayfieldCollision
   bit CXP1FB                       ; check Yar for colliding with PF/BALL
   bpl .clearPlayfieldHitStatus     ; branch if Yar not hitting PF
   lda #YAR_HIT_PLAYFIELD
   ora playfieldControlStatus
   bne CheckYarCannonCollision      ; unconditional branch
   
.clearPlayfieldHitStatus
   lda #~YAR_HIT_PLAYFIELD
   and playfieldControlStatus
CheckYarCannonCollision
   sta playfieldControlStatus
   bit CXP1FB                       ; check Yar for colliding with PF/BALL
   bvc CheckForQotileDestroyed      ; branch if Yar didn't hit BALL
   lda zorlonCannonStatus
   and #ZORLON_CANNON_FIRED
   beq CheckForQotileDestroyed      ; branch if Zorlon Cannon not fired
   lda #ULTIMATE_YARS_GAME
   and gameState                    ; mask to find game selection
   cmp #ULTIMATE_YARS_GAME          ; compare with Ultimate Yars option
   bne .setYarStatusToLosingLife    ; branch if not playing option
   bit gameBoardStatus
   bpl .setYarStatusToLosingLife    ; branch if Zorlon Cannon not moving left
   lda trons                        ; get current number of trons
   adc #4-1                         ; increment for catching cannon -- carry set
   sta trons
   jmp .turnOffZorlonCannon
   
.setYarStatusToLosingLife
   rol yarStatus                    ; rotate losing life flag to carry
   sec                              ; set carry bit
   ror yarStatus                    ; to set that Yar is losing life
.turnOffZorlonCannon
   lda #$1F
   and zorlonCannonStatus           ; remove zorlon cannon flag values
   ora #CANNON_NOT_MOVING
   sta zorlonCannonStatus           ; set cannon to not moving
CheckForQotileDestroyed SUBROUTINE
   bit CXP0FB                       ; check Qotile for colliding with PF/BALL
   bvc .checkForYarQotileCollision  ; branch if Qotile didn't hit BALL
   lda #ZORLON_CANNON_FIRED
   and zorlonCannonStatus
   beq .checkForYarQotileCollision  ; branch if Zorlon Cannon not fired
   ldy #1
   lda #DESTROY_QOTILE_POINT_VALUE  ; load with default Qotile destroyed value
   bit qotileStatus                 ; check Qotile status
   bpl .addInQotileDestroyedPoints  ; branch if Swirl not active
   asl                              ; multiply point value by 2
   bvc .addInQotileDestroyedPoints  ; add in score if Swirl not in flight
   ora #$40                         ; increase point value for Swirl in flight
   inc easterEggTrigger             ; set to show Easter Egg
   pha                              ; push points to stack
   lda lives                        ; get the number of lives
   clc
   adc #1 * 16                      ; increment number of lives (BCD)
   cmp #(MAX_LIVES * 16) + 16
   bcs .pullPointsFromStack         ; branch if reached max number of lives
   sta lives
.pullPointsFromStack
   pla
.addInQotileDestroyedPoints
   jsr IncrementScore
   lda lives                        ; get the number of lives
   ldy #3
   sta (playerScorePtr),y           ; set it to MSB of last score byte
   lda #~(SWIRL_ACTIVE  | SWIRL_TRAVELING)
   and qotileStatus                 ; turn off Swirl
   sta qotileStatus
   inc qotileColor
   inc qotileColor
   lda #$1F
   and zorlonCannonStatus           ; remove zorlon cannon flag values
   ora #CANNON_NOT_MOVING           ; show Zorlon Cannon not moving
   sta zorlonCannonStatus
   lda #SOLID_SHIELD
   bit qotileStatus                 ; check Qotile status
   beq .flipShieldBehavior          ; branch if not showing solid shield
   ldx qotileMissileSpeedIndex      ; get Qotile missile speed index
   beq .flipNeutralZoneMask         ; branch if moving every frame
   dec qotileMissileSpeedIndex      ; reduce speed index
   jmp .flipShieldBehavior          ; could use bpl to save a byte
   
.flipNeutralZoneMask
   tay                              ; move Qotile status to y
   lda #NEUTRAL_ZONE_MASK
   eor neutralZoneMask              ; flip the bits of the neutral zone mask
   sta neutralZoneMask
   tya                              ; move Qotile status to accumulator
.flipShieldBehavior
   eor qotileStatus                 ; flip SOLID_SHIELD status bit
   sta qotileStatus
   lda #%11000000
   ora explosionStatus
   sta explosionStatus
   lda #0
   sta explosionUpperLimit
   lda #H_KERNEL+1
   sta explosionLowerLimit
.checkForYarQotileCollision
   jmp CheckForYarAndQotileCollision
   
CopyrightLSBTable
   .byte <Blank,<Copyright0,<Copyright1,<Copyright2,<Copyright3,<Copyright4

StatusLiteralLSBTable
   .byte <Select_S,<Select_E,<Select_L,<Select_E,<Select_C,<Select_T
   .byte <Howard_H,<Select_S,<Howard_W,<Howard_W,<Select_S,<Howard_H
   
CheckForMissileHittingShield
   lda #YAR_MISSILE_FIRED
   and zorlonCannonStatus
   beq CheckCannonForHittingShield  ; branch if missile not fired
   lda yarMissileHorizPos           ; get Yar's missile horizontal position
   sta tempHorizPos                 ; save value to compute cell removed
   lda yarMissileVertPos            ; get Yar's missile vertical position
   sta tempVertPos                  ; save value to compute cell removed
   jsr DetermineShieldCellRemoved
   
   IF COMPILE_VERSION = PAL
   
      bcs .disableYarMissile
      dec tempHorizPos
      jsr DetermineShieldCellRemoved
      
   ENDIF

   bcc CheckCannonForHittingShield  ; branch if cell not hit by missile   
.disableYarMissile
   lda #~YAR_MISSILE_FIRED
   sta RESMP1                       ; lock Yar missile to Yar
   and zorlonCannonStatus           ; clear the YAR_MISSILE_FIRED bit
   sta zorlonCannonStatus
   ror yarSoundFlags
   sec
   rol yarSoundFlags
   inx                              ; increment cell bit masking index
   cpx #8                           ; see if index is out of range
   bcs CheckCannonForHittingShield
   dey                              ; reduce Shield RAM index pointer
   bmi .skipCellRemoval             ; branch if less than 0
   jsr RemoveShieldCell             ; remove cell from shield
.skipCellRemoval
   iny                              ; increment Shield RAM index pointer
   cpy #NUM_SHIELD_BYTES + 1
   bcs CheckCannonForHittingShield  ; branch if reached edge of RAM
   jsr RemoveShieldCell             ; remove cell from shield
   iny                              ; increment Shield RAM index pointer
   cpy #NUM_SHIELD_BYTES + 1
   bcs CheckCannonForHittingShield  ; branch if reached edge of RAM
   jsr RemoveShieldCell             ; remove cell from shield
   dey                              ; reduce shield RAM index pointer
   inx                              ; increment cell bit masking index
   cpx #8                           ; see if index is our of range
   bcs CheckCannonForHittingShield
   jsr RemoveShieldCell             ; remove cell from shield
CheckCannonForHittingShield
   lda #ZORLON_CANNON_FIRED
   and zorlonCannonStatus
   beq .doneCheckForCannonAndShield ; branch if Zorlon Cannon not fired
   lda zorlonCannonHorizPos         ; get Zorlon Cannon horizontal position
   sta tempHorizPos                 ; save to compute cell removed
   lda zorlonCannonVertPos          ; get Zorlon Cannon vertical position
   adc #3                           ; increment value by 3
   sta tempVertPos                  ; save to compute cell removed
   jsr DetermineShieldCellRemoved
   bcc .doneCheckForCannonAndShield ; branch if cell not removed
   lda #4                           ; see if the game option is for a bouncing
   and gameState                    ; Zorlon Cannon
   beq .turnOffZorlonCannon         ; turn off cannon if not a bouncing cannon
   rol gameBoardStatus              ; rotate Zorlon Cannon bounce flag to carry
   sec                              ; set carry
   ror gameBoardStatus              ; to set Zorlon Cannon bounced flag
   bne .doneCheckForCannonAndShield ; unconditional branch
   
.turnOffZorlonCannon
   lda zorlonCannonStatus           ; get zorlon cannon status
   and #$1F                         ; remove zorlon cannon flag values
   ora #CANNON_NOT_MOVING
   sta zorlonCannonStatus           ; set cannon to not moving
.doneCheckForCannonAndShield
   lda #RESTART_LEVEL
   bit gameBoardStatus
   bne .clearGameStateFlags         ; branch if restarting level
   lda SWCHB                        ; read console switches
   ror                              ; RESET now in carry
   bcs CheckToRotateSolidShield     ; branch if RESET not pressed
   ror                              ; SELECT now in carry
   bcc CheckToRotateSolidShield     ; branch if RESET and SELECT pressed
.clearGameStateFlags
   lda #GAME_SELECTION_MASK
   and gameState                    ; clear game state flags
   sta gameState                    ; (i.e. keep game selection)
ClearRAM
   ldx #$FF
   txs                              ; set stack to the beginning
   lda #0
.clearLoop
   sta VSYNC,x
   dex
   cpx #<reservedYarColor
   bcs .clearLoop
   sta qotileStatus                 ; clear Qotile status
   sta AUDV1                        ; turn off sounds by reducing volume
   sta AUDV0                        ; to 0
   sta SWACNT                       ; set port A for input
   lda #%10010110                   ; reset Yar and show status kernel
   ora kernelStatus
   sta kernelStatus
   lda gameState
   bmi .setYarColorValues           ; branch if game not in progress
   ror                              ; rotate D0 into carry
   lda #ONE_PLAYER_GAME
   bcc .setGameBoardStatus          ; branch if this a one player game
   ora #TWO_PLAYER_GAME
.setGameBoardStatus
   sta gameBoardStatus
   lda #INIT_NUM_LIVES * 16
   sta lives
   sta player1Score+3               ; set number of lives
   sta player2Score+3
.setYarColorValues
   lda #DK_BLUE+12
   sta yarColor                     ; save color for Yar
   sta COLUP1                       ; set color for Yar sprite
   lda #BROWN+14
   sta reservedYarColor
   lda #<player1Score
   sta playerScorePtr
   lda #<Qotile
   sta qotileGraphicPtrs
   lda #>Qotile
   sta qotileGraphicPtrs+1
   lda #NEUTRAL_ZONE_MASK
   sta neutralZoneMask
   sta reserveNeutralZoneMask
   ldx #4                           ; assume Qotile missile moves 1/5 of time
   jsr CheckGameDifficultyValue
   beq .setQotileMissileSpeed       ; branch if playing Ultimate Yars
   dex                              ; reduce so missile moves 1/4 of the time
.setQotileMissileSpeed
   stx qotileMissileSpeedIndex      ; set Qotile missile speed index
   stx reserveQotileMissileIdx      ; set reserved missile speed index
   jmp RestoreShieldGraphics
   
CheckToRotateSolidShield
   lda #SOLID_SHIELD
   bit qotileStatus                 ; check Qotile status
   beq .skipShieldRotation          ; branch if not showing solid shield
   lda #3
   and gameTimer                    ; see if game timer value divisible by 4
   bne .skipShieldRotation          ; branch if not time to rotate shield
   ldx #NUM_SHIELD_BYTES-1
   clc
.rotateSolidShield
   rol currentShieldGraphics+1,x
   ror currentShieldGraphics,x
   dex
   dex
   bpl .rotateSolidShield
   lda currentShieldGraphics+NUM_SHIELD_BYTES
   adc #0
   sta currentShieldGraphics+NUM_SHIELD_BYTES
.skipShieldRotation
   bit gameState
   bvs .turnOffSounds               ; branch if showing select screen
   bpl PlayAudioChannel0Sounds      ; branch if game in progress
.turnOffSounds
   lda #0
   sta AUDV0
   sta AUDV1
   jmp .donePlayingAudioSounds
   
PlayAudioChannel0Sounds
   bit explosionStatus              ; check explosion status
   bmi CheckToReduceExplosionZone   ; branch if explosion kernel taking place
   lda yarSoundFlags                ; get Yar sound flag value
   ror                              ; shift D0 to carry
   bcc .playYarBuzzingSound
   lda #3
   sta AUDF0
   lda #10
   sta AUDV0
   bne .jmpToSetAudioChannel0       ; unconditional branch
   
.playYarBuzzingSound
   bit qotileStatus
   bmi PlaySwirlSounds              ; branch if Swirl active
   lda #14
   sta AUDC0
   and qotileColor
   sta AUDV0
   lda #7
   sta AUDF0
   bne PlayAudioChannel1Sounds      ; unconditional branch
   
PlaySwirlSounds
   bvc .playSwirlActiveSound        ; branch if Swirl not traveling
   lda gameTimer                    ; get current game timer value
   ror                              ; shift D0 into carry
   bcs PlayAudioChannel1Sounds      ; branch if this is an odd frame
   ldx travelingSwirlSound
   beq PlayAudioChannel1Sounds
   inx
   stx AUDF0
   stx travelingSwirlSound
   lda #12
   sta AUDV0
   lda #8
.jmpToSetAudioChannel0
   bne .setAudioChannel0            ; unconditional branch
   
.playSwirlActiveSound
   lda gameTimer                    ; get current game timer value
   sta AUDF0
   lda #5
   sta AUDV0
   bne .setAudioChannel0            ; unconditional branch
   
CheckToReduceExplosionZone
   lda explosionStatus              ; get the explosion status
   and #REDUCE_EXPLOSION_ZONE       ; mask to see if time to reduce zone
   beq .skipReduceExplosionZone     ; branch if not time to shrink zone
   lda gameTimer                    ; get game timer value
   ror                              ; shift D0 into carry
   bcc PlayAudioChannel1Sounds      ; branch if this is an even frame
   lda gameTimer                    ; get game timer value
   sta AUDF0                        ; set audio freq for explosion
   lda #8
   sta AUDC0                        ; set audio channel for explosion
   lda explosionLowerLimit          ; get lower limit for explosion graphics
   lsr                              ; divide the value by 4
   lsr
   sta AUDV0                        ; to set volume of explosion
   inc explosionUpperLimit          ; gradually shink the explosion zone
   dec explosionLowerLimit
   ldx explosionUpperLimit          ; check to see if the explosion sequence
   cpx explosionLowerLimit          ; is done
   bcc PlayAudioChannel1Sounds
   lda kernelStatus
   ora #RESET_QOTILE_POSITION | RESET_YAR_POSITION | ID_STATUS_KERNEL
   sta kernelStatus
   ldy #0
   bit CXPPMM                       ; check player/missile collisions
   bpl .dontShowEasterEgg           ; branch if the players didn't collide
   lda #32
   bit yarVertPos                   ; don't show Easter Egg if Yar's vertical
   bpl .dontShowEasterEgg           ; position is less than 128
   bne .dontShowEasterEgg
   lda easterEggTrigger             ; get Easter Egg trigger value
   beq .dontShowEasterEgg           ; branch if Easter Egg not found
   jmp .jmpIntoVerticalSync
   
.dontShowEasterEgg
   sty easterEggTrigger             ; reset Easter Egg trigger (i.e. y = 0)
   sty explosionStatus              ; clear explosion status
   jmp RestoreShieldGraphics
   
.skipReduceExplosionZone
   lda gameTimer                    ; get current game timer
   asl                              ; multiply the value by 4
   asl
   sta AUDF0                        ; set the frequency for explosion sound
   lda #13
   sta AUDV0                        ; set volume for explosion sound
.setAudioChannel0
   sta AUDC0
PlayAudioChannel1Sounds
   bit yarStatus                    ; check Yar's status
   bmi PlayYarDeathSounds           ; branch if Yar losing life
   bit yarSoundFlags                ; check Yar sound flags
   bmi .playShieldCellDestroyedSound; branch if missile hit shield
   bvc CheckToPlayCannonSound       ; branch if not playing Yar "bounce" sound
   lda #4
   sta AUDV1
   sta AUDF1
   bne .setAudioChannel1            ; unconditional branch
   
.playShieldCellDestroyedSound
   lda #12
   sta AUDV1
   sta AUDF1
   bne .setAudioChannel1            ; unconditional branch
   
CheckToPlayCannonSound
   lda #ZORLON_CANNON_FIRED
   bit zorlonCannonStatus
   beq PlayYarMovingSound           ; branch if Zorlon Cannon not fired
   lda zorlonCannonHorizPos         ; set volume based on Zorlon Cannon
   sta AUDV1                        ; horizontal position
   lda #13
   sta AUDF1
   bne .setAudioChannel1            ; unconditional branch
   
PlayYarMovingSound
   ldy #12                          ; default frequency for non moving Yar
   ldx yarMoving                    ; see if Yar is moving
   beq .checkToPlayNeutralZoneSound ; branch if Yar not moving
   ldy #10                          ; frequency for moving Yar
.checkToPlayNeutralZoneSound
   bit playfieldControlStatus
   bvc .setFrequencyForYar          ; branch if Yar not hitting playfield
   ldy #4                           ; frequency for Yar in neutral zone
.setFrequencyForYar
   sty AUDF1
   lda #3
   sta AUDV1
   bne .setAudioChannel1            ; unconditional branch
   
PlayYarDeathSounds
   bvs .playYarExplodingSound       ; branch if Yar is exploding
   lda #13
   sta AUDV1
   lda gameTimer                    ; get current game timer value
   ora #$1C
   sta AUDF1
   lda #5
   bne .setAudioChannel1            ; unconditional branch
   
.playYarExplodingSound
   lda #EXPLODING_ANIMATION
   bit yarStatus                    ; check Yar's status
   bne .setExplosionFrequency
   lda #$0F
   bit gameTimer
   beq .setImplosionFrequency
   lda #5
.setImplosionFrequency
   sta AUDV1
   lda #3
   sta AUDF1
   lda #13
   bne .setAudioChannel1            ; unconditional branch
   
.setExplosionFrequency
   lda gameTimer                    ; get the current game timer value
   ora #$0C
   sta AUDV1                        ; set volume for explosion
   ldx explosionFrequency           ; get explosion frequency value
   inx                              ; increment frequency value
   stx AUDF1                        ; set explosion frequency
   stx explosionFrequency
   lda #8
.setAudioChannel1
   sta AUDC1
.donePlayingAudioSounds
   bit yarStatus                    ; check Yar's status
   bmi DoYarDeathAnimation          ; branch if Yar is losing life
   jmp VerticalSync
   
DoYarDeathAnimation
   lda #$FF
   sta zorlonCannonVertPos
   sta colorMask
   lda #~(CANNON_NOT_MOVING | ZORLON_CANNON_ACTIVE | ZORLON_CANNON_FIRED)
   sta RESMP1                       ; lock Yar missile to Yar
   and zorlonCannonStatus
   ora #CANNON_NOT_MOVING
   sta zorlonCannonStatus
   lda #LOCK_MISSILE
   sta RESMP0                       ; lock Qotile missile to Qotile
   lda #HMOVE_0
   sta yarMoving                    ; set to Yar not moving
   sta HMP1                         ; do not move Yar
   sta yarLeftBounces               ; clear left bounce number
   bvc VerticalSync                 ; branch if not showing implosion animation
   lda yarStatus
   and #EXPLODING_ANIMATION
   bne CheckToDoYarExplosionAnimation
   lda gameTimer
   and #$0F
   beq .doYarExplosionAnimation
   bne VerticalSync
   
CheckToDoYarExplosionAnimation
   lda gameTimer                    ; get current game timer
   and #3                           ; update Yar death sprites every 4 frames
   bne VerticalSync
.doYarExplosionAnimation
   lda yarGraphicPtrs               ; get current LSB for Yar graphic pointer
   clc
   adc #H_YAR                       ; increment value by Yar height to get
   sta yarGraphicPtrs               ; next animation frame
   cmp #<YarDeath_2
   bne .checkForDeathAnimationDone
   lda #EXPLODING_ANIMATION
   ora yarStatus
   sta yarStatus
.checkForDeathAnimationDone
   lda yarGraphicPtrs               ; get the LSB of Yar graphic pointer
   cmp #<YarDeath_4+H_YAR           ; see if last death sprite is shown
   bne VerticalSync                 ; restart new frame if not
   rol playfieldControlStatus       ; rotate Destroyer Missile status to carry
   clc                              ; clear carry
   ror playfieldControlStatus       ; to clear Destroyer Missile status
   inc qotileColor
   inc qotileColor
   lda #~(SWIRL_ACTIVE  | SWIRL_TRAVELING)
   and qotileStatus
   sta qotileStatus
   lda #0
   sta yarStatus                    ; clear Yar status flags
   sta trons                        ; clear number of trons collected
   lda #$F0
   and lives
   beq .skipLivesReduction          ; branch if lives equal zero
   sec
   sbc #1 * 16                      ; reduce number of lives (BCD)
   sta lives
   jsr SwapPlayerData
   lda lives                        ; get number of lives
   and #$F0
   bne .skipGameOver                ; branch if lives remaining
   jsr SwapPlayerData
   lda lives                        ; get number of lives
   and #$F0
   bne .skipGameOver                ; branch if lives remaining
   rol gameState                    ; rotate game over state to carry
   sec                              ; set carry
   ror gameState                    ; to set game over state
.skipLivesReduction
.skipGameOver
   lda #<YarSprites
   sta yarGraphicPtrs
   lda #>YarSprites
   sta yarGraphicPtrs+1
   lda kernelStatus
   and #~KERNEL_ID_MASK
   ora #YAR_FLAP_UP | ID_STATUS_KERNEL
   sta kernelStatus
   lda #1
   sta gameTimer
   lda #14
   sta explosionFrequency
VerticalSync
.waitTime
   lda INTIM
   bne .waitTime
   sta WSYNC                        ; wait for next scan line
   sta CXCLR                        ; clear collision register
   lda #0
   sta yarSoundFlags                ; clear sound flags each frame
   sta swirlMissedYar               ; reset value for this frame
   lda #RESET_YAR_POSITION
   bit kernelStatus
   beq StartNewFrame                ; branch if not resetting Yar's position
   lda #INIT_YAR_Y
   sta yarVertPos
   lda #~YAR_HIT_PLAYFIELD
   and playfieldControlStatus       ; clear the Yar hit playfield status
   sta playfieldControlStatus
StartNewFrame
   lda #%00000010
   sta WSYNC                        ; wait for next scan line
   sta VSYNC                        ; start vertical sync (D1 = 1)
   sta VBLANK                       ; disable TIA (D1 = 1)
   lda #RESET_YAR_POSITION
   bit kernelStatus
   beq .skipSetYarFineMotion        ; branch if not resetting Yar's position
   lda #HMOVE_L1
   sta HMP1
   lda #5
   sta yarHorizPos
.skipSetYarFineMotion
   bit zorlonCannonStatus           ; check Zorlon Cannon status
   bpl .skipSetCannonFineMotion     ; branch if Zorlon Cannon in flight
   lda #HMOVE_0
   sta HMBL
   lda #1
   sta zorlonCannonHorizPos
.skipSetCannonFineMotion
   lda #RESET_QOTILE_POSITION
   and kernelStatus
   beq .coarseMoveZorlonCannon      ; branch if not resetting Qotile position
   lda shieldVertPos                ; get the shield's vertical position
   clc
   adc #53                          ; add in Qotile offset from the shield
   sta qotileVertPos                ; set Qotile vertical position
   lda #INIT_QOTILE_X
   sta qotileHorizPos               ; set Qotile horizontal position
   
   IF COMPILE_VERSION = NTSC
   
      lda #>Qotile                  ; set Qotile graphic pointers to point to
      sta qotileGraphicPtrs+1       ; Qotile sprite
      
   ENDIF
   
   lda #<Qotile
   sta qotileGraphicPtrs
.coarseMoveZorlonCannon
   sta WSYNC                        ; first line of VSYNC
   bit zorlonCannonStatus           ; check Zorlon Cannon status
   bpl .skipZorlonCannonXPos        ; branch if Zorlon Cannon in flight
   sta RESBL                        ; coarse move Cannon to pixel 24
   nop
   bmi .checkToResetYarPosition     ; unconditional branch
   
.skipZorlonCannonXPos
   pha                              ; wait 7 cycles for constanct cycle count
   pla
.checkToResetYarPosition
   lda #RESET_YAR_POSITION
   and kernelStatus
   beq .skipYarXPos                 ; branch if not resetting Yar's position
   sta RESP1                        ; set Yar's coarse position to pixel 69
   eor #$FF                         ; flip RESET_YAR_POSITION value
   and kernelStatus                 ; to clear RESET_YAR_POSITION flag
   sta kernelStatus
   bne .incrementGameTimer          ; unconditional branch
   
.skipYarXPos
   sta tempVertPos                  ; waste 13 cycles for constant cycle
   sta tempVertPos                  ; count
   sta tempVertPos
   nop
   nop
.incrementGameTimer
   inc gameTimer
   lda #H_YAR
   sta yarGraphicIndex
   lda #H_QOTILE
   sta qotileGraphicIndex
   lda #RESET_QOTILE_POSITION
   and kernelStatus
   beq .secondLineOfVSYNC           ; branch if not resetting Qotile position
   eor #$FF                         ; flip RESET_QOTILE_POSITION value
   and kernelStatus                 ; to clear RESET_QOTILE_POSITION flag
   sta kernelStatus
   lda #HMOVE_L3
   sta HMP0                         ; move Qotile left 3 pixels
   sta RESP0                        ; set Qotile position to pixel 216
.secondLineOfVSYNC
   sta WSYNC                        ; second line of VSYNC
   sta HMOVE                        ; horizotnally move objects
   lda #~CANNON_NOT_MOVING
   and zorlonCannonStatus
   sta zorlonCannonStatus
   bit gameState
   bvs VerticalBlank                ; branch if showing select screen
   lda #SELECT_MASK
   bit SWCHB
   bne VerticalBlank                ; branch if SELECT not pressed
   lsr
.jmpIntoVerticalSync
   sta COLUBK
   sta gameTimer
   lda #$FF
   sta colorMask
   lda #GAME_SELECTION_MASK
   and gameState
   ora #(GAME_OVER | SHOW_SELECT_SCREEN | SWIRL_TRIPLE_FREQ)
   sta gameState
   lda kernelStatus
   ora #ID_STATUS_KERNEL
   sta kernelStatus
   lda #(EXPLOSION_ACTIVE | REDUCE_EXPLOSION_ZONE)
   sta explosionStatus
   sta gameBoardStatus
VerticalBlank
   ldx #VBLANK_TIME
   lda #0
   sta WSYNC                        ; third (final) line of VSYNC
   stx TIM64T                       ; set timer for vertical blank period
   sta VSYNC                        ; end vertical sync (D1 = 0)
   sta HMCLR                        ; clear horizontal motions
   bit gameState
   bvs .checkForSelectPressed       ; branch if showing select screen
   bpl GameCalculations             ; branch if game in progress
   bit INPT4                        ; check player one fire button
   bmi AttractModeColorCycling      ; branch if fire button not pressed
   lda #RESTART_LEVEL
   ora gameBoardStatus              ; set game state flag to show level
   sta gameBoardStatus              ; restarted
   bne GameCalculations             ; unconditional branch
   
AttractModeColorCycling
   lda gameTimer                    ; get current game timer value
   bne GameCalculations             ; branch if not rolled over
   lda #~KERNEL_ID_MASK
   and kernelStatus                 ; reset kernel id value (i.e. ShieldKernel)
   ora #RESET_QOTILE_POSITION | RESET_YAR_POSITION
   sta kernelStatus                 ; reset player positions
   lda attractModeColors            ; get current attract mode colors
   adc #180
   ldx #COLUBK - COLUP1
   stx qotileMissileSpeedIndex      ; set to move missile 1/5 of the time
.colorPlayersForAttractMode
   sta COLUP1,x                     ; set object colors for attract mode
   adc #85                          ; increase color value
   and #$F7                         ; mask color values
   dex
   bpl .colorPlayersForAttractMode
   sta attractModeColors
   bmi GameCalculations             ; unconditional branch
   
.checkForSelectPressed
   lda #SELECT_MASK
   bit SWCHB
   beq .selectSwitchDown            ; branch if SELECT pressed
   lda #~(SWIRL_TRIPLE_FREQ | SWIRL_SEEK_YAR)
   and gameState                    ; turn off Swirl activity
   sta gameState
   bne .setGameSelectionForDisplay  ; unconditional branch
   
.selectSwitchDown
   lda #SWIRL_TRIPLE_FREQ
   bit gameState
   bne .checkSelectDebounce         ; branch if SELECT down on previous frame
   ora gameState                    ; or value to show SELECT switch down
   sta gameState                    ; this frame
   lda #0
   sta gameTimer                    ; reset game timer
   beq .incrementGameSelection      ; unconditional branch
   
.checkSelectDebounce
   lda gameTimer                    ; get current game timer value
   and #SELECT_DELAY                ; and with select delay value
   bne .setGameSelectionForDisplay
.incrementGameSelection
   inc gameState                    ; increment game selection
   lda #~(SWIRL_SEEK_YAR | SHOW_COPYRIGHT)
   and gameState
   sta gameState
.setGameSelectionForDisplay
   lda gameState                    ; get current game state value
   asl                              ; shift game selection to upper nybbles
   asl
   asl
   asl
   sta playerScores+3               ; store in player score for diplaying
GameCalculations
   lda kernelStatus                 ; get current kernel status
   and #KERNEL_ID_MASK              ; mask to get kernel id
   cmp #ID_STATUS_KERNEL            ; see if status kernel is shown
   bne .performGameCalculations     ; branch if not showing status kernel
   jmp DisplayKernel
   
.performGameCalculations
   bit yarStatus                    ; check Yar's status
   bpl CheckForJoystickMovement     ; branch if not losing life
   bvc CheckToDoYarExplosion        ; branch if Yar not doing explosion
.jmpToSetYarAnimationState
   jmp SetYarAnimationState

CheckToDoYarExplosion
   lda lives                        ; get number of lives/Yar rotation value
   and #$0F                         ; mask to keep rotation values
   cmp #8
   bne .rotateYarForDeathAnimation
   lda gameTimer                    ; get current game timer
   and #$3F                         ; update death animation ~ every second
   bne .jmpToSetYarAnimationState
   lda #2
   ora gameTimer
   sta gameTimer
   lda yarStatus                    ; get current Yar status
   ora #IMPLODING_ANIMATION         ; set status to show imploding animation
   sta yarStatus                    ; animation started
   lda #<YarDeath_0                 ; point Yar graphic pointers to start of
   sta yarGraphicPtrs               ; explosion animation
   lda #>YarDeathSprites
   sta yarGraphicPtrs+1
   bne .jmpToSetYarAnimationState   ; unconditional branch
   
.rotateYarForDeathAnimation
   lda #~NO_MOVE
   sta joystickValue                ; set joystick value to not moving
   beq RotateYarForDeath            ; unconditional branch
   
CheckForJoystickMovement
   bit gameState
   bmi .jmpToSetYarAnimationState   ; branch if game not in progress
   bvs .jmpToSetYarAnimationState   ; branch is showing select screen
   lda SWCHA                        ; read joystick values
   eor #$FF                         ; flip the bits
   tax                              ; move joystick values to x
   bne .determineRotationValue      ; branch if player moving joystick
   sta joystickValue
.jmpDetermineToFireYarMissile
   jmp DetermineToFireYarMissile
   
.determineRotationValue
   lda gameBoardStatus              ; get current game board status
   ror                              ; shift active player flag to carry
   txa                              ; move joystick values to accumulator
   bcs .maskJoystickValues          ; branch if player2 is active
   lsr                              ; shift player 1 joystick values to lower
   lsr                              ; nybbles
   lsr
   lsr
.maskJoystickValues
   and #$0F
   sta joystickValue
   beq .jmpDetermineToFireYarMissile; branch if joystick not moved
   tax                              ; move joystick values to x
   lda YarRotationIndexTable,x      ; get Yar rotation index
   tay                              ; move rotation index to y
   jmp SetYarRotationAnimation      ; could used bpl to save a byte
   
RotateYarForDeath
   lda gameTimer                    ; get current game timer
   and #3                           ; see if value divisible by 4
   bne DetermineToFireYarMissile
   lda lives                        ; get lives/Yar rotation values
   and #$0F                         ; mask to keep rotation values
   tay                              ; move rotation value to y
   dey
   dey
SetYarRotationAnimation
   tya
   and #$0F
   sta yarRotationValue
   lsr
   tay
   lda lives                        ; get number of lives
   and #$F0                         ; mask out old rotation value
   ora yarRotationValue             ; or in new rotation value
   sta lives                        ; and set them
   lda YarRotationPointers,y
   clc
   adc #<YarSprites
   sta yarGraphicPtrs
   lda #>YarSprites
   adc #0
   sta yarGraphicPtrs+1
   lda kernelStatus
   ora #YAR_FLAP_UP
   sta kernelStatus
   tya
   asl
   
   IF COMPILE_VERSION = NTSC
   
      and #8
      
   ENDIF
   
   eor #8
   sta REFP1
DetermineToFireYarMissile
   ldx #0
   lda joystickValue                ; get current joystick value
   beq .setYarMovingState           ; branch if joystick not moved
   ldx #3                           ; any non-zero value would do
.setYarMovingState
   stx yarMoving                    ; set joystick not moved
   lda #YAR_MISSILE_FIRED
   bit zorlonCannonStatus
   bne UpdateYarMissilePosition     ; branch if missile fired
   lda yarHorizPos                  ; get Yar's horizontal position
   clc
   adc #4                           ; add in offset to set missile new
   sta yarMissileHorizPos           ; horizontal position
   jmp UpdateYarPosition
   
UpdateYarMissilePosition
   lda zorlonCannonStatus           ; get Zorlon Cannon status
   and #$0F                         ; mask upper nybbles
   tay                              ; move to y to look up movement value
   lda ObjectMotionTable,y
   sta HMM1                         ; set fine motion of Yar's missile
   and #$0F                         ; mask upper nybbles
   cmp #8
   bmi .changeYarMissileVertPos
   ora #$F0                         ; make the value negative (i.e move up)
.changeYarMissileVertPos
   clc
   adc yarMissileVertPos
   tax                              ; move missile vertical position to x
   beq .turnOffYarMissile
   
   IF COMPILE_VERSION = NTSC
   
      cpx #H_KERNEL
      
   ELSE
   
      cpx #H_KERNEL + 1
      
   ENDIF
   
   bcc .setYarMissileVerticalPosition
.turnOffYarMissile
   lda #~YAR_MISSILE_FIRED
   sta RESMP1
   and zorlonCannonStatus
   sta zorlonCannonStatus
   sec
   bcs UpdateYarPosition            ; unconditional branch
   
.setYarMissileVerticalPosition
   stx yarMissileVertPos
   lda ObjectMotionTable,y
   jsr DetermineHorizontalOffset
   adc yarMissileHorizPos
   tax
   beq .turnOffYarMissile
   cpx #XMAX+1
   bcs .turnOffYarMissile
   stx yarMissileHorizPos
UpdateYarPosition
   lda gameTimer                    ; get current game timer
   ror                              ; shift D0 into carry
   bcc SetYarAnimationState         ; branch if this is an even frame
   ldx yarMoving                    ; see if joystick was moved
   beq SetYarAnimationState         ; branch if Yar not moving
   lda lives                        ; get lives/Yar rotation values
   and #$0F                         ; keep rotation values
   tay                              ; move rotation values to y
   lda ObjectMotionTable,y
   sta tempHorizPos
   sta HMP1                         ; set Yar fine motion
   and #$0F                         ; mask to get vertical motion value
   cmp #8
   bmi .updateYarVerticalPosition
   ora #$F0                         ; negate value so Yar moves down
.updateYarVerticalPosition
   clc
   adc yarVertPos
   tax                              ; move Yar's vertical position to x
   cpx #YAR_YMIN                    ; see if Yar has reached the top of screen
   bcs .checkToWrapYarToTop         ; branch if not at top of screen
   ldx #YAR_YMAX                    ; wrap Yar to bottom of the screen
   bne .setYarVerticalPosition      ; unconditional branch
   
.checkToWrapYarToTop
   cpx #YAR_YMAX                    ; see if Yar reached the bottom of screen
   bcc .setYarVerticalPosition      ; branch if not at the bottom
   ldx #YAR_YMIN                    ; wrap Yar to top of the screen
.setYarVerticalPosition
   stx yarVertPos
   
   IF COMPILE_VERSION = NTSC

      stx VDELP1                    ; VDEL Yar if on an odd scan line
      
   ELSE
   
      txa                           ; move Yar vertical position to accumulator
      eor #1                        ; flip D0
      sta VDELP1                    ; to set vertical delay bit
      
   ENDIF

   lda tempHorizPos
   jsr DetermineHorizontalOffset
   adc yarHorizPos
   tax                              ; move Yar horizontal position to x
   cpx #XMAX - 8                    ; see if Yar at the right screen border
   bcc .checkYarLeftBorderBoundary
.dontMoveYar
   lda #HMOVE_0
   sta HMP1
   beq SetYarAnimationState         ; unconditional branch
   
.checkYarLeftBorderBoundary
   cpx #YAR_XMIN                    ; compare with horizontal min
   bcs .setYarHorizontalPosition    ; branch if Yar not at left screen border
   lda #4
   cmp trons                        ; see if Yar has more than 3 trons
   bcs .dontMoveYar
   inc yarLeftBounces               ; increment times Yar bounces left
   jsr CheckToActivateZorlonCannon
   dec yarLeftBounces               ; reduce times Yar bounces left
   beq .dontMoveYar
.setYarHorizontalPosition
   stx yarHorizPos
SetYarAnimationState
   bit yarStatus                    ; check Yar's status
   bmi CheckToActivateSwirl         ; branch if losing life
   lda #3
   and gameTimer                    ; see if game timer is divisible by 4
   beq FlapYarWings                 ; flap Yar's wings every 4th frame
   ldx yarMoving                    ; check to see if Yar moving
   beq CheckToActivateSwirl         ; branch if Yar not moving
   cmp #2
   bne CheckToActivateSwirl
FlapYarWings
   lda yarGraphicPtrs               ; get LSB pointer to Yar graphics
   bit kernelStatus                 ; check Yar wing flapping state
   bvc .flapYarWingsDown            ; branch if Yar wings down
   clc
   adc #5 * H_YAR
   bne .setYarFlapAnimation         ; unconditional branch
   
.flapYarWingsDown
   sec
   sbc #5 * H_YAR
.setYarFlapAnimation
   sta yarGraphicPtrs               ; set new Yar sprite pointer
   lda kernelStatus
   eor #YAR_FLAP_UP                 ; flip yar's wing flapping state
   sta kernelStatus
CheckToActivateSwirl
   bit explosionStatus              ; check explosion status
   bvs .jmpToCheckUpdateQotileMissile; branch if reducing explosion zone
   lda qotileStatus                 ; get Qotile status
   bmi AnimateSwirl                 ; branch if Swirl active
   tay                              ; move Qotile status to y
   lda gameState                    ; get current game state
   bmi .jmpToCheckUpdateQotileMissile; branch if game not in progress
   ldx qotileColor
   cpx #RED+4
   beq .activateSwirl
   lda #SWIRL_TRIPLE_FREQ
   bit gameState
   beq .jmpToCheckUpdateQotileMissile; branch if Swirl not firing at triple freq
   cpx #BLUE+6
   beq .activateSwirl
   cpx #DK_GREEN+8   
   bne .jmpToCheckUpdateQotileMissile
.activateSwirl
   tya                              ; move Qotile status to accumulator
   ora #SWIRL_ACTIVE
   sta qotileStatus                 ; set flag to show Swirl activated
StartSwirlAnimation

   IF COMPILE_VERSION = NTSC
   
      lda #>SwirlSprites
      sta qotileGraphicPtrs+1
      
   ENDIF
   
   lda #<SwirlSprites
   sta qotileGraphicPtrs
   lda #SWIRL_TRIPLE_FREQ
   bit gameState
   beq .jmpToCheckUpdateQotileMissile; branch if Swirl not firing at triple freq
   lda gameTimer                    ; get current game timer
   ror                              ; shift D0 to carry
   bcc .jmpToCheckUpdateQotileMissile; branch if this is an even frame
   ror
   bcs CheckToLaunchSwirl           ; branch if D1 of game timer set
.jmpToCheckUpdateQotileMissile
   jmp .checkToUpdateQotileMissile
   
AnimateSwirl
   lda gameTimer                    ; get current game timer
   ror                              ; shift D0 into carry
   bcs .skipSwirlAnimation          ; branch if this is an odd frame
   lda #H_SWIRL                     ; get the Swirl height
   clc                              ; increment Qotile graphic pointer to
   adc qotileGraphicPtrs            ; animate Swirl
   cmp #<Swirl_2 + H_SWIRL          ; if reached last Swirl animation then
   beq StartSwirlAnimation          ; restart Swirl animation
   sta qotileGraphicPtrs            ; set new Swirl animation LSB
.skipSwirlAnimation
   bit yarStatus                    ; check Yar's status
   bmi .jmpToCheckUpdateQotileMissile; branch if losing life
   bit qotileStatus                 ; check Qotile status
   bvs MoveSwirl                    ; branch if Swirl traveling
   ldx gameTimer                    ; get current game timer value
   beq CheckToLaunchSwirl
   cpx #128
   bne .jmpToCheckUpdateQotileMissile
CheckToLaunchSwirl
   lda yarVertPos                   ; get Yar's vertical position
   
   IF COMPILE_VERSION = NTSC
   
      cmp #10
      
   ELSE
   
      cmp #35
      
   ENDIF
   
   bmi LF9E7                        ; branch if vertical position less than 10
   
   IF COMPILE_VERSION = NTSC
   
      sbc #9
      
   ELSE
   
      sbc #34
      
   ENDIF
   
LF9E7:
   lsr                              ; divide Yar's vertical position by 32
   lsr
   lsr
   lsr
   lsr
   cmp #5
   bmi LF9F2                        ; branch if value less than 5
   and #4
LF9F2:
   clc
   adc #10
   tay
   ldx yarHorizPos                  ; get Yar's horizontal position
   cpx #INIT_QOTILE_X - 5
   bcc LFA0A                        ; branch if Yar to the left of Qotile
   ldx yarVertPos                   ; get Yar's vertical position
   
   IF COMPILE_VERSION = NTSC

      cpx #95
      
   ELSE

      cpx #114

   ENDIF
   
   bcc .setSwirlToMoveDown
   ldy #0                           ; table index to only move Swirl up
   beq .setNewSwirlMotion           ; unconditional branch
   
.setSwirlToMoveDown
   ldy #8                           ; table index to only move Swirl down
   bne .setNewSwirlMotion           ; unconditional branch
   
LFA0A:
   cpx #48                          ; check Yar horiz pos with neutral zone
   bcs LFA1E                        ; branch if Yar right of neutral zone
   ldx yarVertPos                   ; get Yar's vertical position
   cpx #66
   bcs LFA17
   iny
   bne .setNewSwirlMotion           ; unconditional branch
   
LFA17:
   cpx #124                         ; check Yar's vertical position with 124
   bcc .setNewSwirlMotion
   dey
   bne .setNewSwirlMotion           ; unconditional branch
   
LFA1E:
   cpx #XMAX-53
   bcc .setNewSwirlMotion
   ldx yarVertPos                   ; get Yar's vertical position
   cpx #[(H_KERNEL * 10) / 23] + COMPILE_VERSION; (H_KERNEL / 2.3)
   bcs LFA2B
   dey
   bne .setNewSwirlMotion
LFA2B:
   cpx #[(H_KERNEL * 100) / 179] + COMPILE_VERSION; (H_KERNEL / 1.79)
   bcc .setNewSwirlMotion
   iny
.setNewSwirlMotion
   lda #$F0
   and qotileStatus                 ; clear Swirl motion values
   sta qotileStatus
   tya
   ora qotileStatus
   ora #SWIRL_TRAVELING
   sta qotileStatus
   lda #~(SWIRL_VERT_LOCK | SWIRL_HORIZ_LOCK)
   and gameBoardStatus
   sta gameBoardStatus
   inc travelingSwirlSound
   jmp .checkToUpdateQotileMissile
   
MoveSwirl
   lda qotileStatus                 ; get Qotile status
   and #$0F                         ; mask to get motion values
   tay                              ; move motion values to y
   jsr CheckGameDifficultyValue
   beq .getSwirlMotionValue         ; branch if playing Ultimate Yars
   bcs .moveSwirlAggresively        ; branch if difficulty set to PRO
.getSwirlMotionValue
   lda ObjectMotionTable,y
   bne .setSwirlMotion              ; unconditional branch
   
.moveSwirlAggresively
   tya            
   eor #8
   tay
   lda SwirlMotionTable,y
.setSwirlMotion
   sta swirlMotion
   sta HMP0                         ; set Swirl fine motion
   and #$0F                         ; mask upper nybbles (i.e. fine motion)
   cmp #8
   bmi .changeSwirlVertPos
   ora #$F0                         ; make the value negative
.changeSwirlVertPos
   clc
   adc qotileVertPos
   tax
   cpx #YAR_YMAX
   bcc .setSwirlVerticalPosition
.turnSwirlOff
   lda #~(SWIRL_ACTIVE | SWIRL_TRAVELING)
   and qotileStatus
   sta qotileStatus
   lda #RESET_QOTILE_POSITION
   ora kernelStatus                 ; set to reset Qotile position
   sta kernelStatus
   inc swirlMissedYar               ; make non-zero to show Swirl missed Yar
   inc qotileColor
   inc qotileColor
   lda #0
   sta travelingSwirlSound
   sta AUDV0
   beq .checkToUpdateQotileMissile  ; unconditional branch
   
.setSwirlVerticalPosition
   stx qotileVertPos
   lda swirlMotion                  ; get motion value for Swirl
   jsr DetermineHorizontalOffset
   adc qotileHorizPos               ; increment by Qotile horizontal position
   tax                              ; move new horizontal position to x
   beq .turnSwirlOff
   cpx #XMAX+1
   bcs .turnSwirlOff
   stx qotileHorizPos               ; set new horizontal position of Swirl
   lda #SWIRL_SEEK_YAR
   bit gameState
   beq .checkToUpdateQotileMissile  ; branch if Swirl not seeking Yar
   lda #SWIRL_HORIZ_LOCK
   bit gameBoardStatus
   bne .checkToMoveSwirlVertically
   lda yarHorizPos                  ; get Yar's horizontal position
   sbc qotileHorizPos               ; reduce value by Swirl horizontal position
   bpl .skipNegateHorizontalValue   ; branch if Yar is below Swirl
   eor #$FF                         ; negate value
.skipNegateHorizontalValue
   cmp #7
   bpl .checkToMoveSwirlVertically
   lda qotileStatus                 ; get the Qotile status
   and #$F0                         ; clear Swirl motion value
   ldx yarVertPos                   ; get Yar's vertical position
   cpx qotileVertPos                ; compare with Qotile vertical position
   bcs .setSwirlMotionValue         ; branch if Yar is under Qotile
   ora #8
.setSwirlMotionValue
   sta qotileStatus
   lda #SWIRL_HORIZ_LOCK
   bne .setSwirlLocationLockStatus
   
.checkToMoveSwirlVertically
   lda #SWIRL_VERT_LOCK
   bit gameBoardStatus
   bne .checkToUpdateQotileMissile
   lda yarVertPos                   ; get Yar's vertical position
   sbc qotileVertPos                ; subtract Qotile vertical position
   bpl .skipNegateVerticalValue     ; branch if Yar is under Qotile
   eor #$FF                         ; make the value positive
.skipNegateVerticalValue
   cmp #7
   bpl .checkToUpdateQotileMissile
   ldx qotileHorizPos               ; get Qotile horizontal position
   cpx yarHorizPos                  ; compare with Yar's horizontal position
   bcc .checkToUpdateQotileMissile  ; branch if Qotile is to the left of Yar
   lda qotileStatus
   and #$F0
   ora #12
   sta qotileStatus
   lda #SWIRL_VERT_LOCK
.setSwirlLocationLockStatus
   ora gameBoardStatus
   sta gameBoardStatus
.checkToUpdateQotileMissile
   lda gameTimer                    ; get current game timer value
   ror                              ; shift D0 into carry
   bcc UpdateDestroyerMissilePosition; branch if this is an even frame
   jmp SetupForNeutralZoneKernel    ; do neutral zone on odd frames
   
UpdateDestroyerMissilePosition
   bit yarStatus                    ; check Yar's status
   bpl .checkToActivateMissile      ; branch if not losing life
   jmp SetupForShieldKernel
   
.checkToActivateMissile
   lda playfieldControlStatus       ; get the current playfield status
   bmi MoveQotileMissile            ; branch if Destroyer Missile active
   ldx #LOCK_MISSILE
   stx RESMP0                       ; disable Destroyer Missile (M0)
   bit qotileStatus                 ; check Qotile status
   bmi MoveShield                   ; branch if Swirl active
   lda #RESET_QOTILE_POSITION
   and kernelStatus
   bne MoveShield                   ; branch if resetting Qotile position
   rol playfieldControlStatus       ; rotate Destroyer Missile status to carry
   sec                              ; set carry
   ror playfieldControlStatus       ; to activate Destroyer Missile
   lda qotileVertPos                ; get Qotile vertical position
   adc #5                           ; increment by 5 -- carry clear
   
   IF COMPILE_VERSION = NTSC
   
      and #$FE
      
   ELSE
   
      ora #1
      
   ENDIF
   
   sta qotileMissileVertPos         ; set Destroyer Missile vertical position
   lda #INIT_QOTILE_X+4
   sta qotileMissileHorizPos        ; set Destroyer Missile horizontal position
   bne MoveShield                   ; unconditional branch
   
MoveQotileMissile
   lda #MSBL_SIZE4
   sta RESMP0                       ; unlock Destroyer Missile from Qotile
   sta NUSIZ0                       ; set quad size missile
   lda qotileMissileFrameDelay      ; get fractional delay value
   ldy qotileMissileSpeedIndex
   clc
   adc FractionalDelayValues,y
   sta qotileMissileFrameDelay      ; set new delay value
   bcc MoveShield
   lda yarVertPos                   ; get Yar's vertical position
   clc
   adc #H_YAR-1
   tax
   lda qotileMissileVertPos         ; get destroyer missile vertical position
   cpx qotileMissileVertPos         ; compare with target vertical value
   beq .determineDroneNewHorizPos
   bcc .moveDroneDown
   adc #1                           ; move drone down 2 pixel -- carry set here
   bne .setDroneNewVerticalPosition ; unconditional branch
   
.moveDroneDown
   sbc #1                           ; move drone up 2 pixels -- carry clear here
.setDroneNewVerticalPosition
   sta qotileMissileVertPos
.determineDroneNewHorizPos
   lda yarHorizPos                  ; get Yar's horizontal position
   adc #2
   tax
   lda qotileMissileHorizPos        ; get destoryer missile horiz position
   cpx qotileMissileHorizPos        ; compare with target horizontal value
   beq MoveShield
   bcc .moveDroneLeft
   adc #0                           ; move drone right 1 pixel -- carry set here
   ldy #HMOVE_R1                    ; set HMOVE value for drone
   bne .setDroneNewHorizontalPosition; unconditional branch
   
.moveDroneLeft
   sbc #0                           ; move drone left 1 pixel -- carry clear here
   ldy #HMOVE_L1                    ; set HMOVE value for drone
.setDroneNewHorizontalPosition
   sta qotileMissileHorizPos
   sty HMM0
MoveShield
   ldx shieldVertPos                ; get shield's vertical position
   lda #SHIELD_TRAVEL_UP
   and kernelStatus
   bne .moveShieldUp
   inx                              ; increment to move shield down
   bit qotileStatus                 ; check Qotile status
   bvs .skipMoveQotileDown          ; branch if Swirl traveling
   inc qotileVertPos                ; move Qotile down with shield
.skipMoveQotileDown
   cpx #SHIELD_YMAX
   bmi .setShieldVerticalPosition
   lda #SHIELD_TRAVEL_UP            ; set status to make shield move up
   ora kernelStatus
   sta kernelStatus
   bne .setShieldVerticalPosition   ; unconditional branch
   
.moveShieldUp
   dex                              ; decrement to move shield up
   bit qotileStatus                 ; check Qotile status
   bvs .skipMoveQotileUp            ; branch if Swirl traveling
   dec qotileVertPos                ; move Qotile up
.skipMoveQotileUp
   cpx #SHIELD_YMIN
   bpl .setShieldVerticalPosition
   lda #~SHIELD_TRAVEL_UP           ; set status to make shield move down
   and kernelStatus
   sta kernelStatus
.setShieldVerticalPosition
   stx shieldVertPos
SetupForShieldKernel
   lda #NUM_SHIELD_BYTES
   sta shieldGraphicIndex           ; set shield graphic index for kernel
   lda #H_SHIELD_CELL
   sta shieldSectionHeight          ; set cell height for kernel
   lda kernelStatus                 ; get the current kernel status
   and #~KERNEL_ID_MASK             ; mask to clear kernel id value
   ora #ID_SHIELD_KERNEL            ; or in ShieldKernel value -- not needed
   sta kernelStatus                 ; set new kernel id
   lda playfieldControlStatus
   and #~PF_PRIORITY
   sta playfieldControlStatus       ; turn off PF_PRIORITY
   sta CTRLPF
   lda #7
   and gameTimer                    ; update Qotile color every 8 frames
   bne SetShieldColor
SetQotileColor
   bit qotileStatus                 ; check Qotile status
   bmi SetShieldColor               ; branch if Swirl active
   lda qotileColor                  ; get current color of Qotile
   clc
   adc #2                           ; increment value by 2
   tax
   stx qotileColor
   and #WHITE
   beq SetQotileColor
   stx COLUP0
SetShieldColor
   lda gameState                    ; get the current game state
   lsr                              ; move upper nybbles to lower nybbles
   lsr
   lsr
   lsr
   and #3
   tax
   ldy ShieldColors,x
   sty COLUPF
   jmp DisplayKernel
   
SetupForNeutralZoneKernel
   lda playfieldControlStatus       ; get current playfield control status
   ora #PF_PRIORITY                 ; set PF_PRIORITY
   sta playfieldControlStatus
   sta CTRLPF
   lda kernelStatus                 ; get current kernel status
   and #~KERNEL_ID_MASK             ; clear kernel id
   ora #ID_NEUTRAL_ZONE_KERNEL      ; set kernel id for neutral zone
   sta kernelStatus
   bit gameState
   bmi DoneGameCalculations         ; branch if game not in progress
   bvs DoneGameCalculations         ; branch if showing select screen
   bit yarStatus                    ; check Yar's status
   bmi .suppressYarMissile          ; branch if losing life
   bit playfieldControlStatus
   bvs DoneGameCalculations         ; branch if Yar collided with neutral zone
   lda zorlonCannonStatus           ; get Zorlon Cannon status
   tay                              ; move status to y for now
   lda gameBoardStatus              ; get current game board status
   and #ACTIVE_PLAYER_MASK          ; mask to get current active player
   tax                              ; move player number to x
   lda INPT4,x                      ; read player's fire button
   bmi .suppressYarMissile          ; branch if fire button not pressed
   lda #SUPPRESS_YAR_SHOT           ; check status bit to see if Yar is able
   bit qotileStatus                 ; to fire a shot
   bne DoneGameCalculations         ; branch if Yar cannot fire shot
   tya                              ; move Zorlon Cannon status to accumulator
   and #(ZORLON_CANNON_ACTIVE | ZORLON_CANNON_FIRED | YAR_MISSILE_FIRED)
   bne CheckToFireZorlonCannon
CheckToFireYarMissile
   lda lives                        ; get lives/Yar rotation values
   and #$0F                         ; keep rotation value
   tax                              ; move rotation value to x
   lda yarVertPos                   ; get Yar's vertical position
   adc #5                           ; increment the value by 5 for offset
   
   IF COMPILE_VERSION = NTSC
   
      and #$FE                         ; make it active on even scan lines
      
   ELSE
   
      ora #1
      
   ENDIF
   
   sta yarMissileVertPos            ; set missile new vertical position
   lda zorlonCannonStatus
   and #$F0                         ; clear Yar's missile motion values
   sta zorlonCannonStatus
   sta RESMP1                       ; unlock Yar missile
   lda #MISSILE_HIT_SHIELD_SND
   ora yarSoundFlags                ; set sound flag for shield shot
   sta yarSoundFlags
   txa                              ; move rotation values to accumulator
   ora #YAR_MISSILE_FIRED
   ora zorlonCannonStatus           ; set status to show missile fired
   bne .suppressYarMissileShot      ; unconditional branch
   
CheckToFireZorlonCannon
   cmp #ZORLON_CANNON_ACTIVE | ZORLON_CANNON_FIRED
   beq CheckToFireYarMissile
   cmp #ZORLON_CANNON_ACTIVE | YAR_MISSILE_FIRED
   beq .activateZorlonCannon
   cmp #ZORLON_CANNON_ACTIVE
   bne DoneGameCalculations
.activateZorlonCannon
   lda yarVertPos                   ; get Yar's vertical position
   adc #2                           ; increment value by 2 for offset
   sta zorlonCannonVertPos          ; set Zorlon Cannon new vertical position
   lda #ZORLON_CANNON_FIRED
   ora zorlonCannonStatus           ; set status to show Zorlon Cannon fired
.suppressYarMissileShot
   sta zorlonCannonStatus
   lda #SUPPRESS_YAR_SHOT
   ora qotileStatus                 ; set status so Yar cannot fire a missile
   sta qotileStatus
   bne DoneGameCalculations         ; unconditional branch
   
.suppressYarMissile
   lda #~SUPPRESS_YAR_SHOT
   and qotileStatus                 ; clear suppress Yar missile flag so Yar
   sta qotileStatus                 ; is able to fire a missile
DoneGameCalculations
   lda #ZORLON_CANNON_ACTIVE | ZORLON_CANNON_FIRED
   bit zorlonCannonStatus
   bne ResizeZorlonCannon
   ldx #$F0
   stx zorlonCannonVertPos
   jmp DisplayKernel
   
ResizeZorlonCannon SUBROUTINE
   lda #7
   and gameTimer
   cmp #1
   bne .skipZorlonCannonResize
   lda playfieldControlStatus       ; get the playfield control status
   eor #MSBL_SIZE2                  ; alternate BALL size from size 1 and 2
   sta playfieldControlStatus
   sta CTRLPF
.skipZorlonCannonResize
   lda #ZORLON_CANNON_FIRED
   and zorlonCannonStatus
   bne MoveZorlonCannon             ; branch if Zorlon Cannon fired
   lda yarVertPos                   ; get Yar's vertical position
   adc #2                           ; increment value by 2 for offset
   sta zorlonCannonVertPos          ; set Zorlon Cannon new vertical position
.jmpToDisplayKernel
   jmp DisplayKernel
   
MoveZorlonCannon
   bit gameBoardStatus              ; check game board state
   bmi .moveZorlonCannonLeft        ; branch if Zorlon Cannon bounced
   lda #HMOVE_R4                    ; shift Zorlon Cannon fine motion right
   sta HMBL                         ; 4 pixels
   lda #4
   clc
   adc zorlonCannonHorizPos         ; update Zorlon Cannon horizontal position
   sta zorlonCannonHorizPos
   tax                              ; move Zorlon Cannon horiz position to x
   cpx #XMAX+1
   bcc .jmpToDisplayKernel
   bcs .turnOffZorlonCannon         ; unconditional branch
   
.moveZorlonCannonLeft
   lda #HMOVE_L6                    ; shift Zorlon Cannon fine motion left
   sta HMBL                         ; 6 pixels
   lda zorlonCannonHorizPos
   sec
   sbc #6                           ; update Zorlon Cannon horizontal position
   sta zorlonCannonHorizPos
   tax                              ; move Zorlon Cannon horiz position to x
   cpx #ZORLON_CANNON_XMIN
   bcs .jmpToDisplayKernel
.turnOffZorlonCannon
   lda zorlonCannonStatus           ; get zorlon cannon status
   and #$1F                         ; remove zorlon cannon flag values
   ora #CANNON_NOT_MOVING
   sta zorlonCannonStatus           ; set cannon to not moving
   jmp DoneGameCalculations
   
DisplayKernel SUBROUTINE
.waitTime
   lda INTIM
   bne .waitTime
   lda qotileVertPos                ; get Qotile vertical position
   
   IF COMPILE_VERSION = NTSC
   
      eor #1
      
   ENDIF
   
   sta VDELP0                       ; VDEL Qotile if on an even scan line
   bit explosionStatus              ; check the explosion status
   bvc .setupForKernelIdKernel      ; branch if not reducing explosion zone
   ldx #PF_PRIORITY                 ; set x to point to ExplosionKernel
   stx CTRLPF                       ; lets Yar move behind the playfield
   inc explosionStatus              ; increment explosion timer
   lda explosionStatus
   and #EXPLOSION_TIMER
   cmp #EXPLOSION_TIMER
   bne .setJumpKernelSubroutine     ; show the ExplosionKernel
   lda #~EXPLOSION_TIMER
   and explosionStatus              ; clear timer value
   ora #REDUCE_EXPLOSION_ZONE       ; set status to reduce explosion zone
   sta explosionStatus
   bne .setJumpKernelSubroutine     ; unconditional branch -- ExplosionKernel
   
.setupForKernelIdKernel
   lda kernelStatus
   and #KERNEL_ID_MASK              ; mask to get kernel id
   tax                              ; move kernel id to x for lookup
.setJumpKernelSubroutine
   lda KernelJumpTable+1,x
   pha
   lda KernelJumpTable,x
   pha
   lda #$F0
   sta neutralZonePtr+1             ; set neutral zone MSB to top of ROM
   ldx #0
   lda #RESET_QOTILE_POSITION
   and kernelStatus
   bne .reduceQotileGraphicIndex    ; branch if resetting Qotile position
   bit qotileStatus                 ; check Qotile status
   bpl .jmpToKernelSubroutine       ; branch if Swirl not active
.reduceQotileGraphicIndex
   dec qotileGraphicIndex
.jmpToKernelSubroutine
   sta WSYNC                        ; wait for next scan line
   stx VBLANK                       ; enable TIA (D1 = 0)
   rts                              ; jump to appropriate kernel subroutine

Start
;
; Set up everything so the power up state is known.
;
   lda #GAME_OVER | SHOW_COPYRIGHT | 2
   sta gameState
   sei                              ; disable interrupts
   cld                              ; clear decimal mode
   lda #NTSC_OVERSCAN_TIME
   sta TIM64T
   jmp ClearRAM
   
RestoreShieldGraphics
   ldx #NUM_SHIELD_BYTES
.restoreSheildLoop
   lda #SOLID_SHIELD
   bit qotileStatus                 ; check Qotile status
   bne .setSolidShield              ; branch if showing solid shield
   lda Shield,x
   bne .setCurrentShieldGraphics    ; unconditional branch
   
.setSolidShield
   lda #$FF
.setCurrentShieldGraphics
   sta currentShieldGraphics,x
   dex
   bpl .restoreSheildLoop
   stx colorMask                    ; x = #$FF
   stx yarMissileVertPos
   stx qotileMissileVertPos
   stx zorlonCannonVertPos
   lda #MSBL_SIZE4
   sta playfieldControlStatus       ; set initial size of Zorlon Cannon
   lda #CANNON_NOT_MOVING
   sta zorlonCannonStatus
   lda #$F0
   and lives                        ; clear Yar rotation values
   sta lives
   lda #<YarSprites
   sta yarGraphicPtrs
   lda #>YarSprites
   sta yarGraphicPtrs+1
   lda #%11110000
   ora kernelStatus
   sta kernelStatus
   lda #SUPPRESS_YAR_SHOT | SOLID_SHIELD
   and qotileStatus
   sta qotileStatus
   lda #$E2
   sta COLUPF
   sta RESMP1                       ; lock Yar missile to Yar sprite
   lda #0
   sta explosionStatus              ; clear explosion status bits
   sta yarStatus                    ; clear Yar status bits
   sta COLUBK                       ; color background BLACK
   lda #5
   sta shieldVertPos
   sta gameTimer
   clc
   adc #53
   sta qotileVertPos
   jmp VerticalSync
   
DetermineShieldCellRemoved
   lda tempHorizPos
   sec
   sbc #XMAX-32                     ; Shield is last PF2 of non-reflective PF
   bcc .notRemovingShieldCell
   lsr                              ; divide value by 4 for bit masking index
   lsr                              ; (i.e. PF is 4 pixel res)
   tax                              ; set bit masking index
   lda tempVertPos                  ; get vertical position of item
   sec
   sbc shieldVertPos                ; subtract the shield's vertical position
   bcc .notRemovingShieldCell       ; don't remove cell if out of range
   lsr                              ; divide the value by 8 (i.e. height of
   lsr                              ; shield cell)
   lsr
   cmp #16
   bpl .notRemovingShieldCell
   sta dividedBy8                   ; save value
   lda #NUM_SHIELD_BYTES
   sec
   sbc dividedBy8
   tay
RemoveShieldCell
   lda currentShieldGraphics,y      ; get the shield graphic value
   and ShieldCellMasking,x
   beq .notRemovingShieldCell       ; branch if cell already removed
   eor #$FF                         ; flip the bits
   and currentShieldGraphics,y      ; and value to remove cell from shield
   sta currentShieldGraphics,y
   stx saveX                        ; save off x and y register values
   sty saveY
   lda #DESTROY_CELL_POINT_VALUE
   ldy #2
   jsr IncrementScore               ; increment score for removing sheild cell
   ldx saveX                        ; restore x and y values
   ldy saveY
   sec
   rts

.notRemovingShieldCell
   clc                              ; clear carry to show cell wasn't removed
   rts

CheckToActivateZorlonCannon
   lda gameState                    ; get current game state
   and #GAME_SELECTION_MASK         ; mask values to keep game selection
   lsr                              ; divide game selection by 4
   lsr
   adc #0
   ror
   eor yarLeftBounces
   ror
   bcs .doneZorlonCannonActivation
   bit zorlonCannonStatus
   bvs .doneZorlonCannonActivation  ; branch if Zorlon Cannon active
   lda #ZORLON_CANNON_ACTIVE        ; set flag to activate Zorlon Cannon
   ora zorlonCannonStatus
   sta zorlonCannonStatus
   lda #~ZORLON_CANNON_BOUNCED
   and gameBoardStatus              ; clear Zorlon Cannon bounced state
   sta gameBoardStatus
   lda trons                        ; get number of trons
   clc                              ; huh???
   sbc #5-1                         ; reduce tron count by 5 -- carry clear
   sta trons
.doneZorlonCannonActivation
   rts

SwapPlayerData
   lda lives                        ; get number of lives
   ldy #3                           ; set index to point to nubmer of lives
   sta (playerScorePtr),y           ; store lives in MSB of last score byte
   bit gameBoardStatus
   bvc .doneSwapPlayerData          ; branch if not a two player game
   lda #<player1Score               ; get LSB for player 1 score
   cmp playerScorePtr               ; compare with the current score pointer
   bne .swapPlayerLives             ; get player 1 lives if not the same
   lda #<player2Score               ; get LSB for player 2 score
.swapPlayerLives
   sta playerScorePtr
   lda (playerScorePtr),y           ; get number of lives for current player
   sta lives                        ; set to number of lives
   ldy #NUM_SHIELD_BYTES + 4
.swapGameData
   ldx currentShieldGraphics,y
   lda tempShieldGraphics,y
   sta currentShieldGraphics,y
   stx tempShieldGraphics,y
   dey
   bpl .swapGameData
   lda #ACTIVE_PLAYER_MASK
   eor gameBoardStatus              ; flip the active player state
   sta gameBoardStatus              ; to alternate players
   lda #~(SWIRL_TRIPLE_FREQ | SWIRL_SEEK_YAR)
   and gameState
   sta gameState
.doneSwapPlayerData
   rts

   BOUNDARY 0
   
NumberFonts
zero
   .byte $FE ; |XXXXXXX.|
   .byte $86 ; |X....XX.|
   .byte $86 ; |X....XX.|
   .byte $86 ; |X....XX.|
   .byte $82 ; |X.....X.|
   .byte $82 ; |X.....X.|
   .byte $FE ; |XXXXXXX.|
   .byte $00 ; |........|
one
   .byte $18 ; |...XX...|
   .byte $18 ; |...XX...|
   .byte $18 ; |...XX...|
   .byte $18 ; |...XX...|
   .byte $08 ; |....X...|
   .byte $08 ; |....X...|
   .byte $08 ; |....X...|
   .byte $00 ; |........|
two
   .byte $FE ; |XXXXXXX.|
   .byte $C0 ; |XX......|
   .byte $C0 ; |XX......|
   .byte $FE ; |XXXXXXX.|
   .byte $02 ; |......X.|
   .byte $82 ; |X.....X.|
   .byte $FE ; |XXXXXXX.|
   .byte $00 ; |........|
three
   .byte $FE ; |XXXXXXX.|
   .byte $86 ; |X....XX.|
   .byte $06 ; |.....XX.|
   .byte $7E ; |.XXXXXX.|
   .byte $02 ; |......X.|
   .byte $82 ; |X.....X.|
   .byte $FE ; |XXXXXXX.|
   .byte $00 ; |........|
four
   .byte $06 ; |.....XX.|
   .byte $06 ; |.....XX.|
   .byte $FE ; |XXXXXXX.|
   .byte $82 ; |X.....X.|
   .byte $82 ; |X.....X.|
   .byte $80 ; |X.......|
   .byte $80 ; |X.......|
   .byte $00 ; |........|
five
Select_S
   .byte $FE ; |XXXXXXX.|
   .byte $86 ; |X....XX.|
   .byte $06 ; |.....XX.|
   .byte $FE ; |XXXXXXX.|
   .byte $80 ; |X.......|
   .byte $82 ; |X.....X.|
   .byte $FE ; |XXXXXXX.|
   .byte $00 ; |........|
six
   .byte $FE ; |XXXXXXX.|
   .byte $86 ; |X....XX.|
   .byte $86 ; |X....XX.|
   .byte $FE ; |XXXXXXX.|
   .byte $80 ; |X.......|
   .byte $88 ; |X...X...|
   .byte $F8 ; |XXXXX...|
   .byte $00 ; |........|
seven
   .byte $06 ; |.....XX.|
   .byte $06 ; |.....XX.|
   .byte $06 ; |.....XX.|
   .byte $06 ; |.....XX.|
   .byte $02 ; |......X.|
   .byte $02 ; |......X.|
   .byte $FE ; |XXXXXXX.|
   .byte $00 ; |........|
eight
   .byte $FE ; |XXXXXXX.|
   .byte $82 ; |X.....X.|
   .byte $82 ; |X.....X.|
   .byte $FE ; |XXXXXXX.|
   .byte $44 ; |.X...X..|
   .byte $44 ; |.X...X..|
   .byte $7C ; |.XXXXX..|
   .byte $00 ; |........|
nine
   .byte $06 ; |.....XX.|
   .byte $06 ; |.....XX.|
   .byte $06 ; |.....XX.|
   .byte $FE ; |XXXXXXX.|
   .byte $82 ; |X.....X.|
   .byte $82 ; |X.....X.|
   .byte $FE ; |XXXXXXX.|
   .byte $00 ; |........|
   
Blank
   .byte $00 ; |........|
   .byte $00 ; |........|
   .byte $00 ; |........|
   .byte $00 ; |........|
   .byte $00 ; |........|
   .byte $00 ; |........|
   .byte $00 ; |........|
   .byte $00 ; |........|
   
YarRotationIndexTable
   .byte 0*2, 4*2, 0*2, 0*2, 6*2, 5*2, 7*2, 0*2, 2*2, 3*2, 1*2

Select_E
   .byte $FC ; |XXXXXX..|
   .byte $C0 ; |XX......|
   .byte $C0 ; |XX......|
   .byte $F0 ; |XXXX....|
   .byte $80 ; |X.......|
   .byte $80 ; |X.......|
   .byte $FC ; |XXXXXX..|
Select_L   
   .byte $FC ; |XXXXXX..|
   .byte $C0 ; |XX......|
   .byte $C0 ; |XX......|
   .byte $C0 ; |XX......|
   .byte $80 ; |X.......|
   .byte $80 ; |X.......|
   .byte $80 ; |X.......|
Select_C   
   .byte $FE ; |XXXXXXX.|
   .byte $F2 ; |XXXX..X.|
   .byte $80 ; |X.......|
   .byte $80 ; |X.......|
   .byte $80 ; |X.......|
   .byte $82 ; |X.....X.|
   .byte $FE ; |XXXXXXX.|
Select_T   
   .byte $18 ; |...XX...|
   .byte $18 ; |...XX...|
   .byte $18 ; |...XX...|
   .byte $18 ; |...XX...|
   .byte $10 ; |...X....|
   .byte $10 ; |...X....|
   .byte $FE ; |XXXXXXX.|
   
Copyright0
   .byte $79 ; |.XXXX..X|
   .byte $85 ; |X....X.X|
   .byte $B5 ; |X.XX.X.X|
   .byte $A5 ; |X.X..X.X|
   .byte $B5 ; |X.XX.X.X|
   .byte $85 ; |X....X.X|
   .byte $79 ; |.XXXX..X|
Copyright1
   .byte $17 ; |...X.XXX|
   .byte $15 ; |...X.X.X|
   .byte $15 ; |...X.X.X|
   .byte $77 ; |.XXX.XXX|
   .byte $55 ; |.X.X.X.X|
   .byte $55 ; |.X.X.X.X|
   .byte $77 ; |.XXX.XXX|
Copyright2
   .byte $21 ; |..X....X|
   .byte $21 ; |..X....X|
   .byte $21 ; |..X....X|
   .byte $21 ; |..X....X|
   .byte $21 ; |..X....X|
   .byte $21 ; |..X....X|
   .byte $20 ; |..X.....|
Copyright3
   .byte $49 ; |.X..X..X|
   .byte $49 ; |.X..X..X|
   .byte $49 ; |.X..X..X|
   .byte $C9 ; |XX..X..X|
   .byte $49 ; |.X..X..X|
   .byte $49 ; |.X..X..X|
   .byte $BE ; |X.XXXXX.|
Copyright4
   .byte $55 ; |.X.X.X.X|
   .byte $55 ; |.X.X.X.X|
   .byte $55 ; |.X.X.X.X|
   .byte $D9 ; |XX.XX..X|
   .byte $55 ; |.X.X.X.X|
   .byte $55 ; |.X.X.X.X|
   .byte $99 ; |X..XX..X|
   
ProgrammerInitials
Howard_H
   .byte $82 ; |X.....X.|
   .byte $82 ; |X.....X.|
   .byte $82 ; |X.....X.|
   .byte $FE ; |XXXXXXX.|
   .byte $82 ; |X.....X.|
   .byte $82 ; |X.....X.|
   .byte $82 ; |X.....X.|
Howard_W
   .byte $82 ; |X.....X.|
   .byte $C6 ; |XX...XX.|
   .byte $AA ; |X.X.X.X.|
   .byte $92 ; |X..X..X.|
   .byte $82 ; |X.....X.|
   .byte $82 ; |X.....X.|
   .byte $82 ; |X.....X.|
   
DetermineHorizontalOffset
   lsr                              ; move fine motion value to lower
   lsr                              ; nybbles
   lsr
   lsr
   cmp #8
   bmi .flipBits
   ora #$F0                         ; make the value negative (i.e. move left)
.flipBits
   eor #$FF
   clc
   adc #1
   clc                              ; clear carry for addition on return
   rts

IncrementScore
   sed
   clc
.incrementScoreLoop
   adc (playerScorePtr),y
   sta (playerScorePtr),y
   dey
   bmi .checkToChangeGameState
   lda #$00
   beq .incrementScoreLoop          ; unconditional branch
   
.checkToChangeGameState
   cld
   cmp #$23                         ; see if player has reached 230,000 points
   bcc .checkFor150000Points        ; branch if score not reached
   lda #SWIRL_TRIPLE_FREQ | SWIRL_SEEK_YAR
   bne .setGameStateBits            ; unconditional branch
   
.checkFor150000Points
   cmp #$15                         ; see if player has reached 150,000 points
   bcc .checkFor7000Points          ; branch if score not reached
   lda #~(SWIRL_TRIPLE_FREQ | SWIRL_SEEK_YAR)
   and gameState                    ; remove current Swirl attack strategy
   ora #SWIRL_SEEK_YAR              ; set Swirl to seek Yar
   bne .setNewGameState             ; unconditional branch
   
.checkFor7000Points
   cmp #$07                         ; see if player has reached 7,000 points
   bcc .doneIncrementScore          ; branch if score not reached
   lda #SWIRL_TRIPLE_FREQ
.setGameStateBits
   ora gameState
.setNewGameState
   sta gameState
.doneIncrementScore
   rts

CheckGameDifficultyValue
   lda gameState                    ; get the current game state
   and gameBoardStatus
   ror                              ; rotate current player number to carry
   lda SWCHB                        ; read console switches
   bcs .checkForUltimateYars        ; branch if player 2 is active
   rol                              ; rotate player 1 difficutly to carry
.checkForUltimateYars
   rol                              ; rotate difficulty value to carry
   lda #ULTIMATE_YARS_GAME          ; and game selection to see if playing
   and gameState                    ; Ultimate Yars
   rts

   BOUNDARY 0
   
KernelJumpTable

   IF COMPILE_VERSION = NTSC
   
      .word ShieldKernel-1
      .word NeutralZoneKernel-1
      .word ExplosionKernel-1
      .word StatusKernel-1
      
   ELSE
   
      .word SkipShieldDraw-1
      .word PrepareNextNeutralZoneLine-1
      .word PrepareToDrawYar-1
      .word StatusKernel-1
      
   ENDIF
   
FractionalDelayValues
   .byte FRAME_DELAY_0,FRAME_DELAY_HALF,FRAME_DELAY_THIRD
   .byte FRAME_DELAY_FOURTH,FRAME_DELAY_FIFTH
   
Shield
   .byte $F0 ; |XXXX....|
   .byte $F8 ; |XXXXX...|
   .byte $FC ; |XXXXXX..|
   .byte $7E ; |.XXXXXX.|
   .byte $3F ; |..XXXXXX|
   .byte $1F ; |...XXXXX|
   .byte $0F ; |....XXXX|
   .byte $0F ; |....XXXX|
   .byte $0F ; |....XXXX|
   .byte $0F ; |....XXXX|
   .byte $1F ; |...XXXXX|
   .byte $3F ; |..XXXXXX|
   .byte $7E ; |.XXXXXX.|
   .byte $FC ; |XXXXXX..|
   .byte $F8 ; |XXXXX...|
   .byte $F0 ; |XXXX....|
   
ShieldCellMasking
   .byte $01,$02,$04,$08,$10,$20,$40,$80
   
ObjectMotionTable

   IF COMPILE_VERSION = NTSC
   
      .byte HMOVE_0  | 4
      .byte HMOVE_R1 | 3
      .byte HMOVE_R2 | 2
      .byte HMOVE_R3 | 1
      .byte HMOVE_R4 | 0
      .byte HMOVE_R3 | 15
      .byte HMOVE_R2 | 14
      .byte HMOVE_R1 | 13
      .byte HMOVE_0  | 12
      .byte HMOVE_L1 | 13
      .byte HMOVE_L2 | 14
      .byte HMOVE_L3 | 15
      .byte HMOVE_L4 | 0
      .byte HMOVE_L3 | 1
      .byte HMOVE_L2 | 2
      .byte HMOVE_L1 | 3
      
   ELSE

      .byte HMOVE_0  | 5
      .byte HMOVE_R1 | 4
      .byte HMOVE_R3 | 3
      .byte HMOVE_R4 | 1
      .byte HMOVE_R5 | 0
      .byte HMOVE_R4 | 15
      .byte HMOVE_R3 | 13
      .byte HMOVE_R1 | 12
      .byte HMOVE_0  | 11
      .byte HMOVE_L1 | 12
      .byte HMOVE_L3 | 13
      .byte HMOVE_L4 | 15
      .byte HMOVE_L5 | 0
      .byte HMOVE_L4 | 1
      .byte HMOVE_L3 | 3
      .byte HMOVE_L1 | 4
      
   ENDIF
   
YarDeathSprites
YarDeath_0
   .byte $00 ; |........|
   .byte $00 ; |........|
   .byte $00 ; |........|
   .byte $1C ; |...XXX..|
   .byte $2A ; |..X.X.X.|
   .byte $14 ; |...X.X..|
   .byte $08 ; |....X...|
   .byte $14 ; |...X.X..|
   .byte $00 ; |........|
YarDeath_1
   .byte $00 ; |........|
   .byte $00 ; |........|
   .byte $00 ; |........|
   .byte $18 ; |...XX...|
   .byte $18 ; |...XX...|
   .byte $18 ; |...XX...|
   .byte $00 ; |........|
   .byte $00 ; |........|
   .byte $00 ; |........|
YarDeath_2
   .byte $00 ; |........|
   .byte $00 ; |........|
   .byte $10 ; |...X....|
   .byte $28 ; |..X.X...|
   .byte $14 ; |...X.X..|
   .byte $2C ; |..X.XX..|
   .byte $2A ; |..X.X.X.|
   .byte $08 ; |....X...|
   .byte $00 ; |........|
YarDeath_3
   .byte $00 ; |........|
   .byte $42 ; |.X....X.|
   .byte $0C ; |....XX..|
   .byte $20 ; |..X.....|
   .byte $8A ; |X...X.X.|
   .byte $20 ; |..X.....|
   .byte $19 ; |...XX..X|
   .byte $44 ; |.X...X..|
   .byte $10 ; |...X....|
YarDeath_4
   .byte $00 ; |........|
   .byte $22 ; |..X...X.|
   .byte $51 ; |.X.X...X|
   .byte $00 ; |........|
   .byte $81 ; |X......X|
   .byte $42 ; |.X....X.|
   .byte $A3 ; |X.X...XX|
   .byte $94 ; |X..X.X..|
   .byte $62 ; |.XX...X.|
   
YarRotationPointers
   .byte <YarSprite_0-YarSprites
   .byte <YarSprite_1-YarSprites
   .byte <YarSprite_2-YarSprites
   .byte <YarSprite_3-YarSprites
   .byte <YarSprite_4-YarSprites
   .byte <YarSprite_3-YarSprites
   .byte <YarSprite_2-YarSprites
   .byte <YarSprite_1-YarSprites
   
YarSprites
YarSprite_0
   .byte $00 ; |........|
   .byte $24 ; |..X..X..|
   .byte $18 ; |...XX...|
   .byte $24 ; |..X..X..|
   .byte $24 ; |..X..X..|
   .byte $7E ; |.XXXXXX.|
   .byte $5A ; |.X.XX.X.|
   .byte $DB ; |XX.XX.XX|
   .byte $3C ; |..XXXX..|
YarSprite_1
   .byte $00 ; |........|
   .byte $20 ; |..X.....|
   .byte $30 ; |..XX....|
   .byte $ED ; |XXX.XX.X|
   .byte $47 ; |.X...XXX|
   .byte $2C ; |..X.XX..|
   .byte $3F ; |..XXXXXX|
   .byte $17 ; |...X.XXX|
   .byte $36 ; |..XX.XX.|
YarSprite_2
   .byte $00 ; |........|
   .byte $02 ; |......X.|
   .byte $0E ; |....XXX.|
   .byte $99 ; |X..XX..X|
   .byte $67 ; |.XX..XXX|
   .byte $67 ; |.XX..XXX|
   .byte $99 ; |X..XX..X|
   .byte $0E ; |....XXX.|
   .byte $02 ; |......X.|
YarSprite_3
   .byte $00 ; |........|
   .byte $36 ; |..XX.XX.|
   .byte $17 ; |...X.XXX|
   .byte $3F ; |..XXXXXX|
   .byte $2C ; |..X.XX..|
   .byte $47 ; |.X...XXX|
   .byte $ED ; |XXX.XX.X|
   .byte $30 ; |..XX....|
   .byte $20 ; |..X.....|
YarSprite_4
   .byte $00 ; |........|
   .byte $3C ; |..XXXX..|
   .byte $DB ; |XX.XX.XX|
   .byte $5A ; |.X.XX.X.|
   .byte $7E ; |.XXXXXX.|
   .byte $24 ; |..X..X..|
   .byte $24 ; |..X..X..|
   .byte $18 ; |...XX...|
   .byte $24 ; |..X..X..|
YarSprite_5
   .byte $00 ; |........|
   .byte $24 ; |..X..X..|
   .byte $99 ; |X..XX..X|
   .byte $A5 ; |X.X..X.X|
   .byte $E7 ; |XXX..XXX|
   .byte $18 ; |...XX...|
   .byte $18 ; |...XX...|
   .byte $18 ; |...XX...|
   .byte $3C ; |..XXXX..|
YarSprite_6
   .byte $00 ; |........|
   .byte $20 ; |..X.....|
   .byte $37 ; |..XX.XXX|
   .byte $EC ; |XXX.XX..|
   .byte $44 ; |.X...X..|
   .byte $2C ; |..X.XX..|
   .byte $FF ; |XXXXXXXX|
   .byte $87 ; |X....XXX|
   .byte $06 ; |.....XX.|
YarSprite_7
   .byte $00 ; |........|
   .byte $38 ; |..XXX...|
   .byte $08 ; |....X...|
   .byte $99 ; |X..XX..X|
   .byte $67 ; |.XX..XXX|
   .byte $67 ; |.XX..XXX|
   .byte $99 ; |X..XX..X|
   .byte $08 ; |....X...|
   .byte $38 ; |..XXX...|
YarSprite_8
   .byte $00 ; |........|
   .byte $06 ; |.....XX.|
   .byte $87 ; |X....XXX|
   .byte $FF ; |XXXXXXXX|
   .byte $2C ; |..X.XX..|
   .byte $44 ; |.X...X..|
   .byte $EC ; |XXX.XX..|
   .byte $37 ; |..XX.XXX|
   .byte $20 ; |..X.....|
YarSprite_9
   .byte $00 ; |........|
   .byte $3C ; |..XXXX..|
   .byte $18 ; |...XX...|
   .byte $18 ; |...XX...|
   .byte $18 ; |...XX...|
   .byte $E7 ; |XXX..XXX|
   .byte $A5 ; |X.X..X.X|
   .byte $99 ; |X..XX..X|
   .byte $24 ; |..X..X..|

SwirlSprites
Swirl_0   
   .byte $00 ; |........|
   .byte $60 ; |.XX.....|
   .byte $11 ; |...X...X|
   .byte $09 ; |....X..X|
   .byte $3A ; |..XXX.X.|
   .byte $5C ; |.X.XXX..|
   .byte $90 ; |X..X....|
   .byte $88 ; |X...X...|
   .byte $06 ; |.....XX.|
Swirl_1   
   .byte $00 ; |........|
   .byte $04 ; |.....X..|
   .byte $62 ; |.XX...X.|
   .byte $92 ; |X..X..X.|
   .byte $1C ; |...XXX..|
   .byte $38 ; |..XXX...|
   .byte $49 ; |.X..X..X|
   .byte $46 ; |.X...XX.|
   .byte $20 ; |..X.....|
Swirl_2   
   .byte $00 ; |........|
   .byte $18 ; |...XX...|
   .byte $06 ; |.....XX.|
   .byte $64 ; |.XX..X..|
   .byte $99 ; |X..XX..X|
   .byte $99 ; |X..XX..X|
   .byte $26 ; |..X..XX.|
   .byte $20 ; |..X.....|
   .byte $18 ; |...XX...|
   
Qotile   
   .byte $00 ; |........|
   .byte $0F ; |....XXXX|
   .byte $1B ; |...XX.XX|
   .byte $33 ; |..XX..XX|
   .byte $E3 ; |XXX...XX|
   .byte $FF ; |XXXXXXXX|
   .byte $E3 ; |XXX...XX|
   .byte $33 ; |..XX..XX|
   .byte $1B ; |...XX.XX|
   .byte $0F ; |....XXXX|
   .byte $00 ; |........|

SwirlMotionTable

   IF COMPILE_VERSION = NTSC
   
      .byte HMOVE_0  | 10
      .byte HMOVE_L2 | 11
      .byte HMOVE_L3 | 13
      .byte HMOVE_L5 | 14
      .byte HMOVE_L6 | 0
      .byte HMOVE_L5 | 2
      .byte HMOVE_L3 | 3
      .byte HMOVE_L2 | 5
      .byte HMOVE_0  | 6
      
   ELSE

      .byte HMOVE_0  | 9
      .byte HMOVE_L3 | 10
      .byte HMOVE_L4 | 12
      .byte HMOVE_L6 | 13
      .byte HMOVE_L7 | 0
      .byte HMOVE_L6 | 3
      .byte HMOVE_L4 | 4
      .byte HMOVE_L3 | 6
      .byte HMOVE_0  | 7
      
   ENDIF
   
ShieldColors
   .byte RED+2,BLACK+6,DK_BLUE+4,DK_PINK+8
       
   .org ROMTOP + 4096 - 6, 0        ; 4K ROM
   .word Start                      ; NMI vector
   .word Start                      ; RESET vector
   .word Start                      ; BRK vector
