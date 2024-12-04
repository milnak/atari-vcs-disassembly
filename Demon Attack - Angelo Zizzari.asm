; Disassembly of demonatk.bin by Angelo Zizzari
; 
; Using DiStella v3.0
;
; Command Line: C:\DISTELLA.EXE -pafscdemonatk.cfg demonatk.bin 
;
; demonatk.cfg contents:
;
;      CODE 1000 12A0
;      GFX 12A1 12A6
;      CODE 12A7 12EE
;      GFX 12EF 12F6
;      CODE 12F7 1ACD
;      GFX 1ACE 1AD1
;      CODE 1AD2 1B9E
;      GFX 1B9F 1BAE
;      CODE 1BAF 1CB1
;      GFX 1CB2 1CC1
;      CODE 1CC2 1D87
;      GFX 1D88 1FFF


      processor 6502


TIA_BASE_READ_ADDRESS = $30         ; set the read address base so this runs on
                                    ; the real VCS and compiles to the exact
                                    ; ROM image

   include vcs.h
   include macro.h

   LIST ON


;===============================================================================
; A S S E M B L E R - S W I T C H E S
;===============================================================================

NTSC            = 1             ; compiling for NTSC of PAL mode

;===============================================================================


;hardware register equates

VSYNC   =  $00 ;Vertical Sync Set-Clear
VBLANK  =  $01 ;Vertical Blank Set-Clear
WSYNC   =  $02 ;Wait for Horizontal Blank
RSYNC   =  $03 ;Reset Horizontal Sync Counter
NUSIZ0  =  $04 ;Number-Size player/missle 0
NUSIZ1  =  $05 ;Number-Size player/missle 1
COLUP0  =  $06 ;Color-Luminance Player 0
COLUP1  =  $07 ;Color-Luminance Player 1
COLUPF  =  $08 ;Color-Luminance Playfield
COLUBK  =  $09 ;Color-Luminance Background
CTRLPF  =  $0A ;Control Playfield, Ball, Collisions
REFP0   =  $0B ;Reflection Player 0
REFP1   =  $0C ;Reflection Player 1
PF0     =  $0D ;Playfield Register Byte 0 (upper nybble used only)
PF1     =  $0E ;Playfield Register Byte 1
PF2     =  $0F ;Playfield Register Byte 2
RESP0   =  $10 ;Reset Player 0
RESP1   =  $11 ;Reset Player 1
RESM0   =  $12 ;Reset Missle 0
RESM1   =  $13 ;Reset Missle 1
RESBL   =  $14 ;Reset Ball

;Audio registers

AUDC0   =  $15 ;Audio Control - Voice 0 (distortion)
AUDC1   =  $16 ;Audio Control - Voice 1 (distortion)
AUDF0   =  $17 ;Audio Frequency - Voice 0
AUDF1   =  $18 ;Audio Frequency - Voice 1
AUDV0   =  $19 ;Audio Volume - Voice 0
AUDV1   =  $1A ;Audio Volume - Voice 1

;Sprite registers

GRP0    =  $1B ;Graphics Register Player 0
GRP1    =  $1C ;Graphics Register Player 1
ENAM0   =  $1D ;Graphics Enable Missle 0
ENAM1   =  $1E ;Graphics Enable Missle 1
ENABL   =  $1F ;Graphics Enable Ball
HMP0    =  $20 ;Horizontal Motion Player 0
HMP1    =  $21 ;Horizontal Motion Player 1
HMM0    =  $22 ;Horizontal Motion Missle 0
HMM1    =  $23 ;Horizontal Motion Missle 1
HMBL    =  $24 ;Horizontal Motion Ball
VDELP0  =  $25 ;Vertical Delay Player 0
VDELP1  =  $26 ;Vertical Delay Player 1
VDEL01  =  $26 ;Vertical Delay Player 1
VDELBL  =  $27 ;Vertical Delay Ball
RESMP0  =  $28 ;Reset Missle 0 to Player 0
RESMP1  =  $29 ;Reset Missle 1 to Player 1
HMOVE   =  $2A ;Apply Horizontal Motion
HMCLR   =  $2B ;Clear Horizontal Move Registers
CXCLR   =  $2C ;Clear Collision Latches
Waste1  =  $2D ;Unused
Waste2  =  $2E ;Unused
Waste3  =  $2F ;Unused

;collisions                     (bit 7) (bit 6)

CXM0P   =  $30 ;Read Collision - M0-P1   M0-P0
CXM1P   =  $31 ;Read Collision - M1-P0   M1-P1
CXP0FB  =  $32 ;Read Collision - P0-PF   P0-BL
CXP1FB  =  $33 ;Read Collision - P1-PF   P1-BL
CXM0FB  =  $34 ;Read Collision - M0-PF   M0-BL
CXM1FB  =  $35 ;Read Collision - M1-PF   M1-BL
CXBLPF  =  $36 ;Read Collision - BL-PF   -----
CXPPMM  =  $37 ;Read Collision - P0-P1   M0-M1
INPT0   =  $38 ;Read Pot Port 0
INPT1   =  $39 ;Read Pot Port 1
INPT2   =  $3A ;Read Pot Port 2
INPT3   =  $3B ;Read Pot Port 3
INPT4   =  $3C ;Read Input - Trigger 0 (bit 7)
INPT5   =  $3D ;Read Input - Trigger 1 (bit 7)

;RIOT registers

SWCHA  = $0280 ;Port A data register for joysticks (High nybble:player0,low nybble:player1)
SWACNT = $0281 ;Port A data direction register (DDR)
SWCHB  = $0282 ;Port B data (console switches) bit pattern LR--B-SR
SWBCNT = $0283 ;Port B data direction register (DDR)
INTIM  = $0284 ;Timer output
TIMINT = $0285 ;

TIM1T  = $0294 ;set 1 clock interval
TIM8T  = $0295 ;set 8 clock interval
TIM64T = $0296 ;set 64 clock interval
T1024T = $0297 ;set 1024 clock interval




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


; SWCHA joystick bits:
MOVE_RIGHT        = %1000
MOVE_LEFT         = %0100
MOVE_DOWN         = %0010
MOVE_UP           = %0001
NO_MOVE           = %0000

; mask for SWCHB
BW_MASK           = %1000         ; black and white 
SELECT_MASK       = %10
RESET_MASK        = %01

  
;============================================================================
; Z P - V A R I A B L E S
;============================================================================


INIT_NUM_LIVES          = 3

MAX_GAME_SELECTION      = $11
ENEMIES_V_MIN_DISTANCE  = $0C


;color values:

BLACK           		= $00
WHITE          		= $0E

  IF NTSC
PINK            		= $4C
BLUE				= $8C
  ELSE
PINK            		= $6E
BLUE				= $BC
  ENDIF

ENEMY_ROUND			= $80

SCORE1_P1               = $81    ; Player1 Score $81 - $83 - $85  (BCD)
SCORE2_P1               = $83
SCORE3_P1               = $85

SCORE1_P2               = $82    ; Player2 Score $82 - $84 - $86  (BCD)
SCORE2_P2               = $84
SCORE3_P2               = $86



;-----------------------------------------------------------------------------------
;
; $87 - $BD variables related to a single level
;

EnemyLeftHParameters	= $87
Enemy2LeftHParameters	= $88
Enemy3LeftHParameters	= $89

EnemyRightHParameters	= $8A
Enemy2RightHParameters	= $8B
Enemy3RightHParameters	= $8C

			      ; Enemy Position : x7 x6 x5 x4 ---- fine position +7/-8
			      ;                              x3 x2 x1 x0 ----- gross position no. of 15 cycles loops

EnemyLeftHPosition	= $8D ; horizontal position ENEMY1 (enemy left side)
EnemyLeftHPosition2	= $8E ; horizontal position ENEMY2 (enemy left side)
EnemyLeftHPosition3	= $8F ; horizontal position ENEMY3 (enemy left side)

playerX			= $90 ; horizontal position PLAYER'S SHIP
EnemyRightHPosition	= $91 ; horizontal position ENEMY1 (enemy right side)
EnemyRightHPosition2	= $92 ; horizontal position ENEMY2 (enemy right side)
EnemyRightHPosition3	= $93 ; horizontal position ENEMY3 (enemy right side)

SmallDemonHPosition	= $94 ; horizontal position SINGLE SMALL ATTACKING DEMON
ShotVerticalPosition    = $95 ; shot vertical position (BALL)

HPosShift		= $96 ; ball horizontal position shift / syncronization delay
			      ; x7 x6 x5 x4 / x3 x2 x1 x0  = (used in trace shot !!!!)

TeleTransport		= $97 ; teletransport in progress ? #$FF = no !
			      ; #$00 = enemy 1 ; #$01 = enemy 2 ; #$02 = enemy 3

NewEnemyVShift		= $98 ; = 44 - 2*LEVEL (44, 42, 40,...,22)

ShipExplosion		= $99 ; #$00 = no explosion ; [3F --> 0] otherwise

ActionCounter		= $9A ; Enemy Shot Action Speed: level 1 [0..7], level 12 [0..4]

AppearedEnemies		= $9B ; Number of Appeared Enemies for each wave

StatusInProgress	= $9C ; x6=0 (no shot), x6=1 (shot in progress)
			      ; N.B. use of bit x0, x7 is still not clear !!!! save console switch status ?
			      ; x0 = reset pressed 

;-----------------------------------------------------------------------------------------------------------
;
; variables cleaned after reset: $9D - $BD


EnemyAnimationIndex0	= $9D ; ENEMY1 animation index (left wing) 	4 <--> 6
Enemy2AnimationIndex0	= $9E ; ENEMY2 animation index (left wing)	4 <--> 6 
Enemy3AnimationIndex0	= $9F ; ENEMY3 animation index (left wing) 	4 <--> 6


EnemyAnimationIndex1    = $A1 ; ENEMY1 animation index (right wing)	4 <--> 6
Enemy2AnimationIndex1   = $A2 ; ENEMY2 animation index (right wing)	4 <--> 6
Enemy3AnimationIndex1   = $A3 ; ENEMY3 animation index (right wing)	4 <--> 6

EnemyShotGraphics	= $A5 ; ENEMY shot graphics
EnemyShotGraphics2	= $A6 ; ENEMY shot graphics
EnemyShotGraphics3	= $A7 ; ENEMY shot graphics
EnemyShotGraphics4	= $A8 ; ENEMY shot graphics
EnemyShotGraphics5	= $A9 ; ENEMY shot graphics
EnemyShotGraphics6	= $AA ; ENEMY shot graphics
EnemyShotGraphics7	= $AB ; ENEMY shot graphics
EnemyShotGraphics8	= $AC ; ENEMY shot graphics
EnemyShotGraphics9	= $AD ; ENEMY shot graphics
EnemyShotGraphics10	= $AE ; ENEMY shot graphics

EnemyRegister		= $AF ; bit7 bit6 bit5 bit4 bit3 bit2 bit1 bit0 
			      ;	 1     0    ------------------------------> existing enemy
			      ;	 	    	1 ------------------------> enemy moving right - left								
			      ;	 		      1 ------------------> enemy moving  up   - down
			      ;	 		           x    x    x ---> address to table $1EF0
			      ;             1  ---------------------------> direction of animation index (enemy wings: up-down)
			      ;        1 ---------------------------------> enemy destroyed ???


Enemy2Register		= $B0 ;
Enemy3Register		= $B1 ;
SmallDemonRegister	= $B2 ;

SmallDemonAnimationIndex = $B3

;                         $B4  UNKNOWN
SoundIndex              = $B5 ;     0 0 0 0 0 0 0 0 = 0 
			      	;	0 0 0 0 0 0 0 1 = 1 TeleTransport  sound
			     	 	;	0 0 0 0 0 0 1 0 = 2 ship explosion sound



EnemyStatus			= $B6; flags - they change if enemy divided in two small demons
Enemy2Status		= $B7;
Enemy3Status		= $B8;

Temp3			= $B9; 

ExtraLifeCnt		= $BA; 

TeleTCountDown		= $BB
BackgroundColor		= $BC    ; color background

FrameCounter            = $BD

; END OF VARIABLES UPDATED AFTER A SINGLE LEVEL

;-----------------------------------------------------------------------------------

LEVEL                   = $BE
Temp				= $BF ;

Sprite0Ptr              = $C0
Sprite0PtrH			= $C1
Sprite1Ptr              = $C2
Sprite1PtrH			= $C3

CurrentEnemyVPosition   = $C4 ; current enemy vertical position

;--------------------------------------------------------------------------

EnemyVPosition		= $C5 ; vertical position ENEMY1 (enemy right side)
EnemyVPosition2		= $C6 ; vertical position ENEMY2 (enemy right side)
EnemyVPosition3		= $C7 ; vertical position ENEMY3 (enemy right side)
SmallDemonVPosition     = $C8 ; vertical position SMALL DEMON

;--------------------------------------------------------------------------

EnemyVParameters	= $C9
Enemy2VParameters	= $CA
Enemy3VParameters	= $CB

game_mode2              = $CC ; 0 (game mode); #$FF (demo mode); #$40 (game over)

ColorPtr                = $CD
ColorPtrH			= $CE

ShotSound 			= $CF ; increasing sound of shot

CurrEnGraphPtr		= $D0 ; Current Enemy Graphics Pointer

ColorFilter			= $D1 ; flag #$FF or #$F3

ShotColor			= $D2 ; color shot
ShipColor			= $D3 ; color ship 
LivesColor			= $D4 ; color lives

Random			= $D5 ; random number


AccEnLeftHPar		= $D6 ; Enemy Left Acceleration 
AccEnRightHPar		= $D7 ; Enemy Right Acceleration  

; IncrEnemyVPar		= $D8 ; ?

IncrEnLeftHPar		= $D9 ; Enemy Left velocity

; AccEnemyVPar		= $DA ; ?

IncrEnRightHPar		= $DB ; Enemy Right velocity

Temp2				= $DC ; Temp - ScoreHeight, Player Missile Collision

ScoreGraphics0 		= $DD ; pointer to Score0 (blank space)
ScoreGraphics0High	= $DE ; MSB
ScoreGraphics1 		= $DF ; pointer to SCORE1_P1 Graphics (Copyright0)
ScoreGraphics1High	= $E0 ; MSB
ScoreGraphics2 		= $E1 ; pointer to SCORE2_P1 Graphics (Copyright1)
ScoreGraphics2High 	= $E2 ; MSB
ScoreGraphics3 		= $E3 ; pointer to SCORE3_P1 Graphics (Copyright2)
ScoreGraphics3High	= $E4 ; MSB
ScoreGraphics4 		= $E5 ; pointer to Score4 Graphics (Copyright3)
ScoreGraphics4High	= $E6 ; MSB
ScoreGraphics5 		= $E7 ; pointer to Score5 Graphics (blank space)
ScoreGraphics5High      = $E8 ; MSB

selectDelay			= $E9;

GAME_SELECTION          = $EA
ENEMY_WAVE			= $EB

				; $EB 		LEVEL
				;
				; X    		0,  1
				; XX   		2,  3
				; X X  		4,  5
				; XXX  		6,  7
				; X XX 		8,  9
				; XXXX 		10, 11

ENEMY_SHOTS_LENGTH	= $EC

CurrenPlayer		= $ED    ; 0 (player 1) ; 1 (player 2)  
ShotSpeed			= $EE

SmallDemonHPos          = $EF

levelmod12			= $F0
gameState               = $F1    ; 0 (game mode); #$FF (demo mode)

numberOfLives_player1   = $F2
numberOfLives_player2   = $F3

ExtraLife			= $F4    ; 0 (no extra life) ; #$1C (extra life) ; ...

numberOfPlayers         = $F5    ; 0 (1 player) ; 1 (2 players)  
TypeofShot              = $F6    ; 0 (standard shot) ; #$FF (trace shot)
BaseColor			= $F7

CoopVersion             = $F8    ; #$FF (2 alternate players); 0 (no alternate players) 
input_memory		= $F9




       ORG $1000

L1000: LDY    #$00    			;2
       STA    WSYNC   			;3                scanline syncronism

;----------------------------------------------

       LDA    HPosShift,Y 		;4		  prepare ball horizontal position
       STA    HMBL    			;3
       AND    #$0F    			;2
       TAY            			;2
       NOP            			;2
       NOP            			;2

L100E: DEY            			;2
       BPL    L100E   			;2

       LDA    FrameCounter,X   		;4
       STA    RESBL   			;3                 RESET BALL
       LDA    ShotColor     		;3                 color info
       AND    ColorFilter     		;3

       STA    COLUP0  			;3                 COLOR PLAYER 0
       STA    COLUP1  			;3                 COLOR PLAYER 1

       LDA    #$03    			;2         
       STA    NUSIZ0  			;3                 THREE_COPIES OF PLAYER 0
       STA    NUSIZ1  			;3                 THREE_COPIES OF PLAYER 1

       LDY    #$07    			;2
       STA    WSYNC   			;3                 scanline syncronism

;----------------------------------------------


L1027: DEY            			;2                 30 cycles
       BNE    L1027   			;2
       NOP            			;2                
       STA    RESP0   			;3                 RESET PLAYER 0
       STA    RESP1   			;3                 RESET PLAYER 1
       LDA    #$F0    			;2
       STA    HMP0    			;3                 HORIZONTAL MOTION PLAYER 0
       STY    HMP1    			;3                 HORIZONTAL MOTION PLAYER 1
       LDA    #$01    			;2
       STA    VDELP0  			;3                 VERTICAL DELAY PLAYER 0
       STA    VDELP1  			;3                 VERTICAL DELAY PLAYER 1
       STA    WSYNC   			;3                 scanline syncronism

;----------------------------------------------


       STA    HMOVE   			;3                 HORIZONTAL MOTION 
       LDA    BackgroundColor     	;3                 $BC = color background
       STA    COLUBK  			;3
       LDA    #$1E    			;2
       STA    Sprite0PtrH     		;3                 $C1 : ENEMY LEFT GRAPHICS ADDRESS  (MSByte)
       STA    Sprite1PtrH     		;3                 $C3 : ENEMY RIGHT GRAPHICS ADDRESS (MSByte)

L1049: LDA    INTIM   			;4
       BNE    L1049   			;2                 wait for a fixed amount of time

       STA    WSYNC   			;3

;----------------------------------------------

       STA    VBLANK  			;3                stop vertical blank
       STA    HMCLR   			;3                clear horizontal motion
       STA    CXCLR   			;3                clear all collisions
       LDA    #$09    			;2
       STA    Temp2    			;3                Temp2 = height of score graphics


;----------------------------------------------

.DisplayScore

       LDY    Temp2     		;3  ScoreHeight
       LDA    (ScoreGraphics0),Y 	;5                $DD = pointer to Score0 (blank space)
       STA    GRP0    			;3                      		Player 0 Graphics
       STA    WSYNC   			;3

       LDA    (ScoreGraphics1),Y 	;5                $DF = pointer to SCORE1 Graphics (Copyright0)
       STA    GRP1    			;3
       LDA    (ScoreGraphics2),Y 	;5                $E1 = pointer to SCORE2 Graphics (Copyright1)
       STA    GRP0    			;3
       LDA    (ScoreGraphics3),Y 	;5                $E3 = pointer to SCORE3 Graphics (Copyright2)
       STA    Temp    			;3
       LDA    (ScoreGraphics4),Y 	;5                $E5 = pointer to SCORE4 Graphics (Copyright3)
       TAX            			;2
       LDA    (ScoreGraphics5),Y 	;5                $E7 = pointer to SCORE5 Graphics (blank space)
       TAY            			;2
       LDA    Temp    			;3                	   $BF : pointer to temporary graphic data
       STA    GRP1    			;3
       STX    GRP0    			;3
       STY    GRP1    			;3
       STY    GRP0    			;3
       DEC    Temp2     		;5        ScoreHeight        next score line
       BPL    .DisplayScore   		;2

       LDY    #$00    			;2                clear graphics
       STY    GRP0    			;3
       STY    GRP1    			;3
       STY    VDELP0  			;3
       STY    VDELP1  			;3

       LDA    #$08    			;2
       STA    REFP1   			;3                reflect player 1


  IF NTSC
       LDX    #$A5   			; 2             number of kernel lines
  ELSE
       LDX    #$CC   			; 2            
  ENDIF
		
       DEY            			;2                X = 165 (visible scan lines counter) 
       STY    Temp    			;3                Y = #$FF
L1095: INC    Temp    			;5                
       STA    WSYNC   			;3

;----------------------------------------------

       LDY.w  Temp    			;4	       DISPLAY CURRENT ENEMY: LEFT SIDE AND RIGHT SIDE

       LDA    EnemyLeftHPosition,Y 	;4               horizontal position P0 (enemy left side)
       STA    HMP0    			;3
       AND    #$0F    			;2
       TAY            			;2
L10A4: DEY            			;2               positioning loop
       BPL    L10A4   			;2
       LDY    Temp    			;3
       STA    RESP0   			;3               display player0
       STA    WSYNC   			;3

       LDA    EnemyRightHPosition,Y 	;4               horizontal position P1 (enemy right side)
       STA    HMP1    			;3
       AND    #$0F    			;2
       TAY            			;2
       NOP            			;2
       NOP            			;2
L10B7: DEY           			;2
       BPL    L10B7   			;2               positioning loop
       LDY    Temp    			;3
       STA    RESP1   			;3               display player1
       STA    WSYNC   			;3

;----------------------------------------------

       STA    HMOVE   			;3
       CPY    #$03    			;2
       BEQ    L1117   			;2


       LDA    EnemyAnimationIndex0,Y 	;4               animation index 4 <--> 6 (multiply by 8)
       ASL            			;2                     (enemy left side)
       ASL            			;2
       ASL            			;2
       STA    Sprite0Ptr     		;3
       LDA    EnemyAnimationIndex1,Y 	;4               $A1 = animation index 4 <--> 6 (multiply by 8)
       ASL            			;2                     (enemy right side)
       ASL            			;2
       ASL            			;2
       STA    Sprite1Ptr     		;3

       LDA    EnemyVPosition,Y 		;4
       STA    CurrentEnemyVPosition     ;3

       LDA    #$00    			;2
       CPY    TeleTransport     	;3		 teletranportation in progress ?
       BNE    L10E3   			;2 

       LDA    #$07    			;2               enemy teletransportation large size 
L10E3: STA    NUSIZ0  			;3
       STA    NUSIZ1  			;3
       DEX            			;2
       DEX            			;2
       DEX            			;2
L10EA: STA    WSYNC   			;3

;----------------------------------------------
       TXA            			;2
       SEC            			;2
       SBC    CurrentEnemyVPosition     ;3               enemy vertical position
       TAY            			;2
       AND    #$F8    			;2
       BNE    L1103   			;2	  	enemy in the current scanline ? 

       LDA    (Sprite0Ptr),Y 		;5         visualize left side enemy
       STA    GRP0    			;3

       LDA    (Sprite1Ptr),Y 		;5		visualize right side enemy
       STA    GRP1    			;3

       LDA    (ColorPtr),Y 		;5           enemy color pointer

       STA    COLUP0  			;3
       STA    COLUP1  			;3


L1103: TXA            			;2
       SEC            			;2
       SBC    ShotVerticalPosition      ;3              shot vertical position 

       LDY    #$01    			;2
       AND    #$F8    			;2
       BNE    L110E   			;2 	      shot in the current scanline ? 


       INY            			;2              value for enable shot visualization
L110E: STY    ENABL   			;3              
       DEX            			;2
       CPX    CurrentEnemyVPosition     ;3
       BCC    L1095   			;2
       BCS    L10EA   			;2

;-----------------------------------------------

L1117: LDA    ShipColor     		;3        ship color  
       AND    ColorFilter     		;3              color filter
       STA    COLUP0  			;3              P0 ship

       LDA    CXPPMM  			;3
       STA    Temp2     		;3              Temp2 save player-missile collisions 
       LDA    ShipExplosion     	;3              $99 : EXPLOSION ?
       BNE    ShipExplosionAnimation	;2		--> ship explosion animation

       STA    REFP1   			;3              stop player1 reflection
	 STA    NUSIZ0  			;3              ONE COPY player0
       STA    NUSIZ1  			;3              ONE COPY player1

       BIT    ENEMY_WAVE     		;3       if enemy wave includes the small demons --> $1132
       BPL    L1132   			;2

       JMP    L11B2   			;3

L1132: LDA    SmallDemonAnimationIndex  ;3       SmallDemonAnimationIndex = 1a if enemy = 2 separate birds
       ASL            			;2
       ASL            			;2
       ASL            			;2
       STA    Sprite0Ptr     		;3       Sprite0Ptr = D0; graphic pointer to single bird $1ED0
L1139: STA    WSYNC   			;3

;----------------------------------------------

       CPX    #$0C    			;2              player's ship in current scanline ?
       BCS    L1144   			;2              $1D88 address of graphic data for standard player's ship
       LDA    PlayerShipGraphics,X 	;4              
       STA    GRP0    			;3              player's ship graphics --> P0

L1144: TXA            			;2
       SEC            			;2
       SBC    SmallDemonVPosition     	;3              Y coordinates of small attacking bird
       TAY            			;2
       AND    #$F8    			;2
       BNE    L1155   			;2

       LDA    (Sprite0Ptr),Y 		;5       visualize small attacking bird
       STA    GRP1    			;3
       LDA    (ColorPtr),Y 		;5
       STA    COLUP1  			;3

L1155: TXA            			;2
       SEC            			;2
       SBC    ShotVerticalPosition      ;3              shot vertical position
       LDY    #$01    			;2
       AND    #$F8    			;2

       BNE    L1160   			;2	      shot in the current scanline ? 
       INY            			;2	      value for enable shot visualization
L1160: STY    ENABL   			;3
       DEX            			;2
       BPL    L1139   			;2
       JMP    L11F0   			;3

;----------------------------------------------

ShipExplosionAnimation:

       AND    #$38    			;2		animation of explosion from $99 [ 3E --> 0 ] 
       LSR            			;2                divide by 8 and obtain [7 --> 0] from bits x6 x5 x4 
       LSR            			;2
       LSR            			;2
       TAY            			;2

       LDA    ShipExplosionGraphics,Y 	;4                GRAPHIC TABLE for ship explosion 
       STA    Sprite0Ptr     		;3
       LDA    #$1D    			;2                $c1 = 1d graphic address (MSByte)
       STA    Sprite0PtrH     		;3

       LDA    #$00    			;2		1 occurrence on graphics
       STA    NUSIZ0  			;3                copy on P0 and P1
       STA    NUSIZ1  			;3
L117D: STA    WSYNC   			;3

;----------------------------------------------

       STA    GRP0    			;3		clear P0 and P1 graphics 
       STA    GRP1    			;3

       TXA            			;2
       LDY    #$01    			;2
       SEC            			;2
       SBC    ShotVerticalPosition      ;3 
       AND    #$F8    			;2
       BNE    L118E   			;2		shot in the current scanline ? 
       INY            			;2
L118E: STY    ENABL   			;3		value for enable shot visualization

       TXA            			;2
       LSR            			;2
       LSR            			;2
       BCS    L11A8   			;2
       LSR           			;2
       TAY            			;2
       BCS    L11A8   			;2

       CPY    #$05    			;2
       BCS    L11A8   			;2

       LDA    ShipExplosionColor,Y 	;4              GRAPHICS COLORS EXPLOSION 
       STA    COLUP0  			;3             
       STA    COLUP1  			;3

       LDA    (Sprite0Ptr),Y 		;5
       BCC    L11AA   			;2

L11A8: LDA    #$00    			;2

L11AA: DEX            			;2
       BPL    L117D   			;2

       INX            			;2
       STX    REFP1   			;3              REFLECT P1          
       BEQ    L11F0   			;2

L11B2:

  IF NTSC
       LDA    #$4E    			;2              COLOR OF ENEMY SHOTS              
  ELSE
       LDA    #$6E   			;2            
  ENDIF

       STA    COLUP1  			;3

       LDA    CXP1FB  			;3              read collision player1 - ball
       STA    Temp    			;3		Temp <-- collision player1 - ball

L11BA: STA    WSYNC   			;3

;----------------------------------------------

       CPX    #$0C    			;2              player's ship in current scanline ?
       BCS    L11C5   			;2              address of graphic data for standard player's ship

       LDA    PlayerShipGraphics,X 	;4              
       STA    GRP0    			;3              player's ship graphics --> P0

L11C5: TXA            			;2
       SEC            			;2
       SBC    ShotVerticalPosition      ;3
       LDY    #$01    			;2
       AND    #$F8    			;2
       BNE    L11D0   			;2		player's shot in the current scanline ?
       INY            			;2
L11D0: STY    ENABL   			;3		value for enable shot visualization
       TXA            			;2
       CMP    #$50    			;2

       BCS    L11ED   			;2
       LSR            			;2		A, Y <-- x/8    [0..10]   A <-- x (current scanline) 
       LSR            			;2
       LSR            			;2
       TAY            			;2
       TXA            			;2

       EOR    #$FF    			;2     		Invert all bits --> XOR with FrameCounter --> Mask by $EC
       EOR    FrameCounter    		;3     		(FRAMECOUNTER - current scanline = const. ? i.e. = 4)
       AND    ENEMY_SHOTS_LENGTH     	;3		time to draw enemy shots ?

       BEQ    L11E8   			;2

       LDA    #$00    			;2
       BEQ    L11EB   			;2

L11E8: LDA.wy EnemyShotGraphics,Y 	;4               ENEMY SHOTS INDEX ? EnemyShotGraphics pointer to --> EnemyShotGraphicsTable

L11EB: STA    GRP1    			;3
L11ED: DEX            			;2
       BPL    L11BA   			;2

L11F0: LDX    #$00    			;2		END of visible screenplay
       STA    WSYNC   			;3

;----------------------------------------------


       STX    GRP0    			;3		clear graphic variables and motion register
       STX    GRP1    			;3
       STX    HMP0    			;3
       LDA    #$10    			;2		set horizontal position for P1 graphics
       STA    HMP1    			;3
       LDA    BaseColor    		;3
       AND    ColorFilter     		;3
       STA    ScoreGraphics5    	;3		Temporary variable for graphics
       STA    RESP0   			;3
       STA    RESP1   			;3
       STA    WSYNC   			;3

;----------------------------------------------
       STA    HMOVE   			;3

       BIT    CoopVersion	     	;3
       BMI    L1212   			;2

       LDX    CurrenPlayer	    	;3
L1212: LDY    numberOfLives_player1,X   ;4

       LDA    ReplicationTable1,Y	;4
       STA    NUSIZ0  			;3
       LDA    ReplicationTable2,Y 	;4
       STA    NUSIZ1  			;3

       LDX    LivesColor		;3
       STX    COLUP0  			;3
       STX    COLUP1  			;3
       LDX    #$06    			;2
       LDA    ScoreGraphics5  		;3
L1228: STA    WSYNC   			;3
       STA    COLUBK  			;3

;----------------------------------------------
       DEX            			;2
       BMI    L1247   			;2
       LDA    TableLivesGraphics,X 	;4      table graphic lives
       CPY    #$00    			;2
       BEQ    L123E   			;2
       STA    GRP0    			;3
       CPY    #$02    			;2
       BCC    L123E   			;2
       STA    GRP1    			;3

L123E: DEC    ScoreGraphics5     	;5      variation of ground color effect
       DEC    ScoreGraphics5     	;5
       LDA    ScoreGraphics5     	;3
       JMP    L1228   			;3


L1247: JMP    L187A   			;3  	end of screen display - check collisions

;-------------------------------------------------------

START:                			; GAME STARTS HERE

       SEI            			; set interrupt
       CLD            			; clear decimal mode
       LDX    #$FF    			; init stack
       TXS            			;
       INX            			; X=0
       TXA            			; A=0

ClearRAM
.clearLoop
       sta VSYNC,x
       inx
       bne .clearLoop


       INX            		 	; 
       STX    GAME_SELECTION    	; GAME_SELECTION = 1
       JSR    InitGAME    

       LDA    #$AB               	; 
       STA    SCORE1_P1          	; Init Score $81 $83 $85
       LDA    #$CD               	;             AB  CD  EA 
       STA    SCORE2_P1          	;
       LDA    #$EA               	;
       STA    SCORE3_P1          	;


  IF NTSC
       STA    Random   			;3  Init   Random = #$EA 
       LDX    #$0A    			;2 
  ELSE
       LDX    #$0A    			;2  Init   Random = #$0A 
       STX    Random     		;3       
  ENDIF

       LDA    #$1F    			;2         Initialize the most significant bytes of copyright graphics
L126E: STA    $DE,X   			;4         $E8, $E6, $E4, $E2, $E0, $DE = #$1F
       DEX            			;2
       DEX            			;2
       BPL    L126E   			;2
       JMP    L145A   			;3

;-------------------------------------------------------

L1277: LDA    #$02    			;2       START VERTICAL BLANK
       STA    VBLANK  			;3       disable TIA (D1 = 1)

       LDX    #$19    			;2
       STA    WSYNC   			;3

;----------------------------------------------

       STX    TIM8T   			;4

       STA    VSYNC   			;3

       LDX    #$00    			;2

       BIT    gameState    		;3
       BMI    L128E  			;2

       STX    SoundIndex     		;3
       BPL    L1292   			;2

L128E: LDA    ShipExplosion    		;3		CHECK IF there is ShipExplosion (= not equal zero)
       BNE    L12A7   			;2

;----------------------------------------------

; AUDIO SUBROUTINES

;----------------------------------------------
; no explosion
;


L1292: LDA    SoundIndex    		;3		if SoundIndex = 0 ---> save $12D1 on stack (SUB1)
       AND    #$0F    			;2
       ASL            			;2		if SoundIndex = 1 ---> save $12CB on stack (SUB2)
       TAY            			;2
       LDA    L12A2,Y 			;4		if SoundIndex = 2 ---> save $12B1 on stack (SUB3)
       PHA            			;3
       LDA    L12A1,Y 			;4
       PHA            			;3
       RTS            			;6

;----------------------------------------------

L12A1: .byte $D1 ; |XX X   X| $12A1 		$12D1

L12A2: .byte $12 ; |   X  X | $12A2
       .byte $CB ; |XX  X XX| $12A3		$12CB
       .byte $12 ; |   X  X | $12A4
       .byte $B1 ; |X XX   X| $12A5
       .byte $12 ; |   X  X | $12A6		$12B1

;----------------------------------------------
; explosion
;

L12A7: LSR            		;2			divide by 4 --> 0..15
       LSR            		;2
       TAX            		;2
       LDA    ShipExplosion    	;3		ShipExplosion --> 0 0 0 x x x x x	
       AND    #$1F    		;2
       LDY    #$08    		;2 ----------------------	(SUB3)
       BNE    L12D2   		;2

       LDA    ShotSound		;3			if ShipExplosion --> 0 0 0 x x x x x equal zero
       ASL            		;2
       TAX            		;2			ShotSound = $CF multiply by 2 --> X
       LDA    ShotSound 	;3
       EOR    #$FF    		;2			$CF ---> 0 0 0 0 inv inv inv
       AND    #$07    		;2
       LDY    #$0F    		;2			#$0F --> Y
       DEC    ShotSound		;5
       BPL    L12D2   		;2			ShotSound = ShotSound - 1   (ShotSound counter ?)

       LDA    SoundIndex	;3			SoundIndex <-- x x x x 0 0 0 0 
       AND    #$F0    		;2
       STA    SoundIndex	;3

       LDX    #$00    		;2
       BEQ    L12D2   		;2

       LDX    #$0C    		;2

       LDA    TeleTCountDown    ;3 -----------	(SUB2)
       LDY    #$08    		;2
	
L12D2: STX    AUDV0   		;3  Volume --------------	(SUB1)		
       STY    AUDC0   		;3  Distorsion
       STA    AUDF0   		;3  Frequency
       LDX    #$00    		;2
       LDA    ExtraLife		;3			$F4 = 0 ? no, goto --> $131d
       BNE    L131D   		;2

       LDA    SoundIndex	;3		if SoundIndex = 0 0 0 0 x x x x ---> save $1387 on stack (SUB4)
       AND    #$F0    		;2
       LSR            		;2		if SoundIndex = 0 0 0 1 x x x x ---> save $135B on stack (SUB5)
       LSR           		;2
       LSR            		;2		if SoundIndex = 0 0 1 0 x x x x ---> save $134E on stack (SUB6)
       TAY            		;2
       LDA    L12F0,Y 		;4		if SoundIndex = 0 1 0 0 x x x x ---> save $12F6 on stack (SUB7)
       PHA            		;3
       LDA    L12EF,Y 		;4
       PHA            		;3
       RTS            		;6

;----------------------------------------------

L12EF: .byte $87 ; |X    XXX| $12EF 		$1387
L12F0: .byte $13 ; |   X  XX| $12F0
       .byte $5B ; | X XX XX| $12F1 		$135B
       .byte $13 ; |   X  XX| $12F2
       .byte $4E ; | X  XXX | $12F3 		$134E
       .byte $13 ; |   X  XX| $12F4
       .byte $F6 ; |XXXX XX | $12F5 		$12F6
       .byte $12 ; |   X  X | $12F6

;--------------------------------------------

       DEC    CurrEnGraphPtr    ;5 -----------	(SUB7)
       LDA    CurrEnGraphPtr    ;3
       BNE    L1305   		;2
       STA    SoundIndex	;3

  IF NTSC
       LDA    #$4C    		;2
  ELSE
       LDA    #$6C    		;2  
  ENDIF

       STA    BaseColor     	;3
       BNE    L1317   		;2
L1305: TAY            		;2
       LSR            		;2
       LSR            		;2
       LSR            		;2
       TAX            		;2
       INC    BaseColor     	;5
       LDA    L1E00,Y 		;4
       AND    #$07    		;2
       STA    AUDF0   		;3
       ADC    #$05    		;2
       STX    AUDV0   		;3
L1317: LDY    #$0C    		;2
       STY    AUDC0   		;3
       BNE    L1388   		;2

L131D: DEC    ExtraLife		;5
       LDA    ExtraLife		;3
       BNE    L1330   		;2

       LDX    CurrenPlayer     	;3
       BIT    CoopVersion      	;3
       BPL    L132B   		;2
       LDX    #$00    		;2

L132B: INC    numberOfLives_player1,X   ;6
       INX            		;2
       STX    ExtraLifeCnt     	;3

L1330: CMP    #$3D    		;2
       BCS    L1388   		;2
       EOR    #$FF    		;2
       STA    LivesColor     	;3
       EOR    #$FF    		;2
       LSR            		;2
       LSR            		;2
       TAY            		;2
       LDA    ExtraLifeSound,Y 	;4	 load note
       BEQ    L1388   		;2	 branch when no note needed
       TAY            		;2
       LDA    ExtraLife		;3
       AND    #$03    		;2
       ASL            		;2 ---------------------- (SUB6)
       ASL            		;2 50
       TAX            		;2
       TYA            		;2
       LDY    #$04    		;2
       BNE    L1388   		;2
       LDX    #$08    		;2 5A
       LDY    CurrEnGraphPtr     ;3 -----------	(SUB5)
       INC    CurrEnGraphPtr     ;5
       LDA    L1E00,Y 		;4   demon hit explosion
       AND    #$07    		;2
       BPL    L137F   		;2
       LDA    FrameCounter     	;3
       EOR    #$FF    		;2
       AND    #$0F    		;2
       SEC            		;2
       SBC    #$04    		;2
       BCC    L1388  		;2
       TAX            		;2
       BIT    SmallDemonRegister;3  branch when small demon is falling
       BMI    L1383   		;2
       LDA    FrameCounter     	;3
       AND    #$10    		;2
       BEQ    L1376   		;2
       LDX    #$00    		;2
       BEQ    L1388   		;2
L1376: LDA    #$14    		;2
       SEC            		;2
       SBC    AppearedEnemies	;3
       CLC            		;2
       ADC    L1FA2,X 		;4
L137F: LDY    #$0C    		;2
       BNE    L1388   		;2
L1383: LDA    L1F96,X 		;4 	bird chirp
       LDY    #$04    		;2
L1388: STX    AUDV1   		;3 ----------------------	(SUB4)
       STY    AUDC1   		;3
       STA    AUDF1   		;3

L138E: LDA    INTIM   		;4
       BNE    L138E   		;2
       STA    VSYNC   		;3
       STA    WSYNC   		;3

;----------------------------------------------

;---------------------------------------
; FRAME limit
;---------------------------------------

  IF NTSC
       LDA    #$2D    				;2      prepare internal timer #$2D
  ELSE
       LDA    #$36    				;2      prepare internal timer #$36
  ENDIF

       STA    TIM64T  				;4

       INC    FrameCounter     			;5	start a new FRAME	
       BNE    .skip_SS 				;2		skip screen saver

       INC    Temp3				;5	INCREMENT Temp3
       BIT    game_mode2     			;3
       BMI    L13B2   				;2	check demo mode

       LDA    Temp3				;3	Temp3 = 0 ??? then skip screen saver
       BNE    L13AE   				;2

       LDA    #$F3    				;2	ColorFilter = #$F3 (activate screen saver)
       STA    ColorFilter     			;3

L13AE: LDA    numberOfPlayers     		;3	check number of players
       BNE    L13B6   				;2

L13B2: BIT    CoopVersion	     		;3	check 2 simulateneus players game
       BPL    .skip_SS 				;2

L13B6: LDA    CurrenPlayer	    		;3	Change CurrenPlayer
       EOR    #$01    				;2
       STA    CurrenPlayer	    		;3

.skip_SS: 
       LDA    Random   				;3	generate next random number 
       ASL            				;2
       EOR    Random   				;3
       ASL            				;2
       ASL            				;2
       ROL    Random   				;5

;----------------------------------------------------------------------------------------------

; read console switches

       LDA    SWCHB   				; 	
       ROR    StatusInProgress		;5	reset pressed before ??? (bit 0)
       BCS    .noOldReset			;2	if there is input from console switches 
							;	then .CheckSelection
       LSR            				;2
       BCS    .CheckSelection   		;2	reset pressed
       ROL            				;2

.noOldReset:
       LSR            				;2
       ROL    StatusInProgress		;5	StatusInProgress (bit 0 = RESET)
       LSR            				;2

       BIT    selectDelay			;3      SELECT pressed ?	
       BCC    .select  				;2             yes, start a new game
       ROL    selectDelay			;5              no, debounce delay (very clever)
       BNE    .skipSwitches			;2

.select:
       BPL    .skipSelect			;2

.endDelay: 
       LDA    FrameCounter    		;3
       AND    #$1F    				;2	32 frames counter
       STA    selectDelay			;3
       JSR    InitGAME   			;6


       JSR    L1AD2   				;6      clean game variables
       SED            				;2

       LDA    GAME_SELECTION     		; 	GAME_SELECTION = GAME_SELECTION + 1
       CLC                       		;
       ADC    #$01               		;
       CLD                       		;
       STA    GAME_SELECTION     		; 	GAME_SELECTION = MAX_GAME_SELECTION ?
       CMP    #MAX_GAME_SELECTION		;
       BNE    .skipSwitches            	; 	no,  THEN go to .skipSwitches
       LDA    #$01               		; 	yes, THEN GAME_SELECTION = 1
       STA    GAME_SELECTION     		;
       BNE   .skipSwitches              	;

.skipSelect: 
       LDA    selectDelay			;3	32 frames since last valid SELECT?
       EOR    FrameCounter    		;3
       AND    #$1F    				;2
       BEQ    .endDelay				;2

.skipSwitches: 
       BIT    game_mode2     			;3
       BMI    L1419   				;2

       LDA    SoundIndex			;3
       CMP    #$30    				;2
       BEQ    L1419   				;2

       LDA    INPT4   				;3         check for fire button pressed
       BPL    L1417   				;2
       BIT    input_memory     		;3
       BPL    .CheckSelection   		;2

L1417: STA    input_memory     		;3
L1419: JMP    L14DC   				;3

; ------------------------------------------------------------------------------------------


.CheckSelection 

       LDX    #$FF                  ;             game State = DEMO_MODE - 0 (game mode); #$FF (demo mode)
       STX    gameState           
       STX    game_mode2            ;             game_mode2 = #$FF  0 (game mode); #$FF (demo mode); #$40 (game over)
       STX    LEVEL                 ;             LEVEL = -1
       INX                          ;             x = 0
       LDY    GAME_SELECTION  
       DEY                          ;
       TYA                          ;             A = GAME_SELECTION - 1
       LDY    #$00                  ;
       STY    CoopVersion           ;             CoopVersion = 0 (no cooperative players)
       CMP    #$08                  ;                 GAME_SELECTION >= 9 ?
       BCS    .TwoAlternatePlayers
                                    ;             yes -> 2 simultaneous players game
       LSR                          ;             
       BCC    .OnePlayerGame
                                    ;             one player game ? 
       INY                          ;             Y = 1 (2 players not simultaneous)

.OnePlayerGame
       LSR                          ;             1 player game !     (GAME_SELECTION = 1,3,5,7)
       BCC    .CheckSelection1
                                    ;	          standard shot       (GAME_SELECTION = 1,5)
       DEX                          ;             x=#$FF - trace shot (GAME_SELECTION = 3,7)

.CheckSelection1
       LSR                          ;
       BCC    .SaveSelectionState
                                    ;             standard game
       LDA    #$0B                  ;	            advanced game       (GAME_SELECTION = 5,7)
       STA    LEVEL                 ;             start from level 11 (#$0B)
       BNE    .SaveSelectionState
                                    ;

.TwoAlternatePlayers
       DEX                          ;             GAME_SELECTION >= 9 (2 players alternate - standard shot)
       STX    CoopVersion     
                                    ;             CoopVersion = #$FF (2 simultaneous players); 0 (not simultaneous players) 
       CMP    #$08                  ;
       BNE    .SaveSelectionState
                                    ;
       INX                          ;             X = 0

.SaveSelectionState
       STX    TypeofShot            ;             TypeofShot = 0 (standard shot) ; #$FF (trace shot)
       STY    numberOfPlayers       ;             numberOfPlayers, CurrenPlayer = 0 (1 player) ; 1 (2 players - not simultaneously)  
       STY    CurrenPlayer	   ;
       LDA    #INIT_NUM_LIVES	    ;             Init Lives
       STA    numberOfLives_player1
       STA    numberOfLives_player2
       LDX    #$81                  ;              if lives = 0 --> clear variables related to score ($81-$86)
       BNE    L145C                 ;


; ---------------------------------------------------------------------------------------------

; END OF LEVEL: CHECKING VARIABLES ETC.
; 

L145A: LDX    #$87    				;2
L145C: LDA    #$00    				;2       Clear variables $87 - $BD
L145E: STA    VSYNC,X 				;4
       INX            				;2
       CPX    #$BD    				;2
       BNE    L145E   				;2

;-------------------------------------------------------

       BIT    CoopVersion       		;3
       BMI    .SinglePlayer            		;2

       LDA    numberOfPlayers     		;3
       BEQ    .SinglePlayer            		;2

;-------------------------------------------------------

       LDA    CurrenPlayer	    		;3	  two not simultaneous players game
       EOR    #$01    				;2        exchange current player
       TAX            				;2
       LDA    numberOfLives_player1,X   	;4        get information about current player
       BMI    .SinglePlayer			;2            lives left

       STX    CurrenPlayer	    		;3        update CurrentPlayer information
       CPX    #$00    				;2        if first player again continue on the same level
       BNE    .ContinueOnTheSameLevel		;2           else 

.SinglePlayer: 
       INC    LEVEL   				;5           LEVEL = LEVEL +1

.ContinueOnTheSameLevel: 
       LDA    LEVEL   				;3
       CMP    #$54    				;2           LEVEL = 84 ?

.NeverEndingLoop: 

  IF NTSC
       BEQ    .NeverEndingLoop		; 	     after 84 levels game crashes (if NTSC)
  ELSE
       NOP
       NOP           
  ENDIF

       STA    ENEMY_ROUND			;3        ENEMY_ROUND <- absolute LEVEL from begin of game
       CMP    #$0C    				;2        
       BCC    .LevelBetween0and11		;2        LEVEL < 12 ? 

Subtract12: 
       SBC    #$0C    				;2        after LEVEL 12 alternate goes from LEVEL 8 to 11 
       CMP    #$0C    				;2
       BCS    Subtract12			;2

       STA    ENEMY_ROUND			;3
       AND    #$03    				;2
       ADC    #$08    				;2
							; 	  LEVEL < 12 

.LevelBetween0and11: 
       STA    levelmod12     			;3          levelmod12 <- LEVEL (between 0 and 11)
       LSR            				;2          
       TAX            				;2          X = levelmod12 / 2  (between 0 and 5)

       LDA    #$2C    				;2
       SEC            				;2
       SBC    levelmod12			;3
       SBC    levelmod12			;3
       STA    NewEnemyVShift			;3          NewEnemyVShift = 44 - 2*LevelMod12 (44, 42, 40,...,22)

       LDA    EnemyWaveTable,X			;4          access table EnemyWaveTable (table of enemy speeds, graphics ?)

       STA    ENEMY_WAVE			;3          $EB = ENEMY_WAVE ($80,$C0,$A0,$E0,$B0,$F0) 

       LDY    #$01    				;2         Y = 1     (the first 4 levels)
       AND    #$20    				;2          check bit 5:   00x0 0000  of ENEMY_WAVE
       BEQ    L14B0   				;2

       LDY    #$81    				;2         Y = 129   (after the first 4 levels)

L14B0: TYA            				;2
       ORA    StatusInProgress			;3         $9C : set bit x0 if "first 4 levels"
       STA    StatusInProgress			;3             : set bit x0 and x7 if other levels

       LDA    #$04    				;2
       BIT    ENEMY_WAVE     			;3         check ENEMY_WAVE (in the first two levels)
       BVC    L14BD   				;2

       LDA    #$00    				;2

L14BD: STA    ENEMY_SHOTS_LENGTH    		;3         ENEMY_SHOTS_LENGTH = 4 (for first WAVE)

       LDA    PlayerShotSpeedTable,X 		;4         access to table of Player's ShotSpeed
       STA    ShotSpeed     			;3                as a function of ENEMY_WAVE  


;set up enemy color pointer

       LDA    LEVEL   				;3
       SEC            				;2

L14C7: SBC    #$07    				;2         MOD7 (LEVEL) (extract a value between 0..6)
       BCS    L14C7   				;2

       ADC    #$07    				;2         
       ASL            				;2
       ASL            				;2
       ASL            				;2
       CLC            				;2
       ADC    #$AE    				;2
       STA    ColorPtr     			;3        ColorPtr = MOD7 (LEVEL) * 8 + #$AE

       LDA    #$1F    				;2
       STA    ColorPtrH				;3        access to $1FAE ENEMY COLOR TABLE as function of LEVEL

       JSR    InitGAME   			;6


L14DC: BIT    gameState     			;3	  attract mode ?
       BPL    L14E7   				;2
       BIT    game_mode2     			;3	  game over ?
       BMI    L14E7   				;2
       JMP    L1822   				;3        
;----------------------------------------------------------------------------------------------------------------

L14E7: LDA    FrameCounter			;3	no, then continue with normal game
       AND    #$07    				;2      syncronize with frames --> extract [0..7]
       TAY            				;2

       LDX    ObjectsControl,Y 			;4       access table $1d94 (as function of framecounter)
       BMI    L1535   				;2	   Dispatcher ($00,$80,$01,$03,$02,$80,$03,$80) 

       CPX    #$03    				;2
       BNE    L14FF   				;2       X = #$80 ? then --> L1535

       LDA    SmallDemonAnimationIndex    	;3	 X <> #$03 ? then --> L14FF
       JSR    L1B28   				;6	      Update Enemy Register and Animation Index
       STA    SmallDemonAnimationIndex    	;3
       JMP    L1533   				;3

L14FF: LDA    EnemyStatus,X   			;4      EnemyStatus >=0 ? then --> L152C
       BPL    L152C   				;2

       LDA    EnemyAnimationIndex0,X   		;4	check that left and right part of enemy are syncronized
       CMP    EnemyAnimationIndex1,X   		;4
       BNE    L1515   				;2

       CMP    #$05    				;2
       BCC    L1515   				;2
       JSR    L1B03   				;6	subroutine ---> $1B03
       STA    EnemyAnimationIndex0,X   		;4		Update Enemy Animation Index
       JMP    L1533   				;3

L1515: LDA    #$BF    				;2
       STA    Temp    				;3

       LDA    EnemyAnimationIndex0,X   		;4
       JSR    L1B03   				;6	subroutine ---> $1B03
       STA    EnemyAnimationIndex0,X   		;4		Update Enemy Animation Index

       LDA    #$DF    				;2
       STA    Temp    				;3

       LDA    EnemyAnimationIndex1,X   		;4
       JSR    L1B03   				;6	subroutine ---> $1B03
       JMP    L1533   				;3

L152C: LDA    EnemyAnimationIndex0,X   		;4     	
       JSR    L1B28   				;6	      Update Enemy Register and Animation Index

       STA    EnemyAnimationIndex0,X   		;4
L1533: STA    EnemyAnimationIndex1,X   		;4

L1535: LDA    ShipExplosion     		;3
       BNE    L15AB   				;2

       BIT    SmallDemonRegister		;3
       BMI    L154F   				;2

       LDA    Enemy3Status     			;3
       AND    #$60    				;2
       BEQ    L154F   				;2

       CMP    #$60    				;2
       BEQ    L154F   				;2

       JSR    L1D31   				;6
       BCS    L154F   				;2

       JSR    .StartSmallAttackingDemon		;6

L154F: BIT    gameState     			;3
       BMI    L155D   				;2
       LDX    #$06    				;2
       BIT    FrameCounter     			;3
       BVC    L156B   				;2
       LDX    #$0A    				;2
       BNE    L156B   				;2

L155D: LDA    SWCHA   				;4      		read joystick
       LDX    CurrenPlayer	     		;3
       BNE    L1568   				;2

       LSR            				;2      		Player0 data
       LSR            				;2
       LSR            				;2
       LSR            				;2

L1568: AND    #$0F  				;2      		Player1 data
       TAX            				;2

L156B: LDY    #$01    				;2
       BIT    TypeofShot      		;3
       BPL    L1572   				;2

       INY            				;2

L1572: LDA    playerX     			;3      
       CPX    #$08				;2      		move right ?
       BCC    L158B   				;2
       BEQ    L15AB   				;2

       CPX    #$0C    				;2      		player not moving
       BCS    L15AB   				;2

       CMP    #$31    				;2			playerX = 49 ? 
       BEQ    L15AB   				;2

       CMP    #$21    				;2			playerX = 33 ?
       BEQ    L15AB   				;2			

       JSR    AddHPos  				;6			move right update A
       BEQ    L159A   				;2

L158B: CPX    #$05    				;2			move left
       BCC    L15AB   				;2

       CMP    #$C8    				;2			playerX = 97 ? 
       BEQ    L15AB   				;2

       CMP    #$D8    				;2			playerX = 104 ? 
       BEQ    L15AB   				;2

       JSR    SubHPos				;6			move left update A

L159A: STA    playerX     			;3			update playerX 
       BIT    TypeofShot     			;3
       BMI    L15A4   				;2

       BIT    StatusInProgress			;3			check StatusInProgress (console switches)
       BVS    L15AB   				;2

L15A4: LDY    #$01    				;2
       JSR    SubHPos			   	;6
       STA    HPosShift				;3

L15AB: BIT    StatusInProgress     		;3			check StatusInProgress
       BVS    L15D5   				;2

       LDA    ShipExplosion     		;3		explosion ???
       BNE    L15E3   				;2

       BIT    gameState     			;3		yes, continue
       BPL    L15BD   				;2

       LDX    CurrenPlayer	    		;3
       LDA    INPT4,X 				;4         		check for fire button pressed
       BMI    L15E3   				;2

L15BD: LDA    StatusInProgress		;3      ok FIRE BUTTON PRESSED
       ORA    #$40    				;2
       STA    StatusInProgress		;3      StatusInProgress : x6 <-- 1  shot in progress !

       LDA    TeleTransport     		;3
       BPL    L15E3   				;2

       LDA    SoundIndex			;3       SoundIndex --> x x x x 0 0 1 0
       AND    #$F0    				;2 
       ORA    #$02    				;2
       STA    SoundIndex			;3

       LDA    #$07    				;2       ShotSound <--- 07
       STA    ShotSound				;3
       BNE    L15E3   				;2

L15D5: LDA    ShotVerticalPosition      	;3        increase Shot Vertical Position
       CLC            				;2        of ShotSpeed amount
       ADC    ShotSpeed     			;3
       STA    ShotVerticalPosition      	;3


  IF NTSC
       CMP    #$A0    				;2        shot out of screen ?
  ELSE
       CMP    #$C0    				;2
  ENDIF


       BCC    L15E3   				;2
       JSR    L1CED   				;6

;----------------------------------------------------------------------------------

L15E3: LDY    TeleTCountDown			;3	  no, continue     check End of TeleTransport 
       BNE    L1635   				;2

       LDX    #$02    				;2	for all the three enemies (X = Number of Enemies)

CheckExistingEnemy: 

       LDA    EnemyRegister,X   		;4	check if there is the current enemy (x7,x6)
       AND    #$C0    				;2
       BEQ    NoExistingEnemy			;2      if not --> go to NoExistingEnemy
       INY            				;2

L15F0: DEX            				;2
       BPL    CheckExistingEnemy		;2

       CPY    #$00    				;2
       BNE    L1633   				;2

       BIT    SmallDemonRegister     		;3	check if there is the small demon
       BMI    L1633   				;2

       LDA    ShipExplosion    			;3	check if there is a Ship Explosion
       ORA    ExtraLife				;3
       BNE    L1635   				;2

       LDX    CurrenPlayer	     		;3	Check if there is one player or two players
       BIT    CoopVersion	     		;3
       BPL    L1609   				;2

       LDX    #$00    				;2

L1609: LDA    ExtraLifeCnt			;3
       BNE    L1619   				;2

       LDA    numberOfLives_player1,X   	;4
       CMP    #$06    				;2
       BCS    L1619   				;2
	
       LDA    #$48    				;2
       STA    ExtraLife				;3	$F4 is a pointer to music clip ?
       BNE    L1633   				;2

L1619: JMP    L145A   				;3

NoExistingEnemy: 
       BIT    gameState     			;3
       BPL    L1626   				;2

       LDA    AppearedEnemies			;3	check number of Appeared Enemies = 8 ?
       CMP    #$08    				;2
       BEQ    L15F0   				;2	then, no new teletransport

L1626: LDA    Random   				;3      otherwise enable teletransport
       AND    #$1F    				;2
       ORA    #$01    				;2
       STA    TeleTCountDown			;3	TeleTCountDown <-- Random number between 1 and 31 ($01-$1F)

       JSR    NewEnemyVPosition		;6	A <--- NewEnemyVPosition
       STA    EnemyVPosition,X   		;4

L1633: STX    TeleTransport     		;3 	Update Teletransport Register with the current Enemy (X)

L1635: LDA    FrameCounter     			;3      each 3 of 4 Frames, continue otherwise exit $166B
       AND    #$03    				;2
       BEQ    L166B   				;2
       TAX            				;2	A <-- FrameCounter (between 0-3)
       DEX            				;2      X >-- NextEnemy
       JSR    NewEnemyVPosition		;6	                       calculate new EnemyVPosition in A
 
       CMP    EnemyVPosition,X   		;4      If EnemyVPosition > AverageEnemyVPosition 
       BCS    L1648   				;2	then

       DEC    EnemyVPosition,X   		;6	DEC    EnemyVPosition
       BNE    L164A   				;2	else

L1648: INC    EnemyVPosition,X   		;6	INC    EnemyVPosition

L164A: LDA    Random   				;3	A <-- Random
       CPX    #$02    				;2
       BNE    L1661   				;2

       LDA    EnemyLeftHPosition,X   	;4
       JSR    L1D3D   				;6

       BIT    StatusInProgress		;3
       BVC    L166B   				;2

       LDA    ShotVerticalPosition      	;3
       CMP    EnemyVPosition3     		;3
       BCC    L1665   				;2
       BCS    L166B   				;2

L1661: AND    #$07    				;2      A = Random between 0-7
       BNE    L166B   				;2

L1665: LDA    EnemyRegister,X   		;4      Invert Enemy Direction
       EOR    #$10    				;2             (1 chance of 8 to change Enemy Direction)
       STA    EnemyRegister,X   		;4

L166B: JSR    L1C33   				;6
       BIT    StatusInProgress    		;3
       BPL    L16BA   				;2

;-----------------------------------------------------------------------------


; LOOP

       LDX    #$02    				;2		when an enemy splits in two small demons,
							; 		this subroutine controls the horizontal oscillation
L1674: LDA    EnemyStatus,X   		;4    		of the two small demons          
       AND    #$20    				;2
       BEQ    L16B7   				;2             bit x5 = 0 ?  yes ---> go to $16b7

       LDA    EnemyStatus,X   		;4             bit x3 = 0 ?  yes ---> go to $16b7
       AND    #$08   				;2
       BEQ    L16B7   				;2

       LDY    #$01    				;2		Y=1 for subroutines L1CCF and $1CDE

       LDA    EnemyStatus,X   		;4
       AND    #$10    				;2             bit x4 = 0 ?  yes ---> go to $16a6
       BEQ    L16A6   				;2

       LDA    EnemyRightHPosition,X   	;4

       CMP    #$C9    				;2            if EnemyRightHPosition = #$C9 then ---> go to $1696
       BEQ    L1696   				;2

       JSR    SubHPos				;6		L1CCF

       STA    EnemyRightHPosition,X   	;4        Update Enemy Right H Position
       JMP    L16B1   				;3

L1696: LDA    EnemyStatus,X   		;4             EnemyStatus 1,2,3
       EOR    #$10    				;2		invert bit x4 (horizontal motion direction ?) 
       STA    EnemyStatus,X   		;4             

       LDA    EnemyRegister,X   		;4	       EnemyRegister
       AND    #$F0    				;2
       ORA    #$01    				;2		update EnemyRegister ptr to 01
       STA    EnemyRegister,X   		;4

       BNE    L16B1   				;2

L16A6: LDA    EnemyRightHPosition,X   	;4
       CMP    #$71    				;2            if EnemyRightHPosition = #$71 then ---> go to $1696
       BEQ    L1696   				;2

       JSR    AddHPos  				;6
       STA    EnemyRightHPosition,X   	;4      update enemy Right H Position

L16B1: LDA    EnemyStatus,X   		;4
       AND    #$F7    				;2            set x0 = 0 
       STA    EnemyStatus,X   		;4

L16B7: DEX            				;2		do again for the other enemies (1-3)
       BPL    L1674   				;2

;-----------------------------------------------------------------------------
;
; this routine keeps the vertical distance of enemies at least 12 pixels high
;


L16BA: LDA    NewEnemyVShift		;3         $98 = 44 - 2*level (mod12)

       BIT    SmallDemonRegister     	;3
       BPL    L16C5   			;2

       LDA    SmallDemonVPosition     	;3		Temp2 <-- SmallDemonVPosition + 12	
       CLC            			;2
       ADC    #ENEMIES_V_MIN_DISTANCE	;2
L16C5: STA    Temp2     		;3

       LDA    EnemyVPosition     	;3
       CMP    #$97    			;2
       BCC    L16CF   			;2

       LDA    #$97    			;2        if EnemyVPosition>#$97 then EnemyVPosition=#$97

L16CF: CMP    #$48    			;2        if EnemyVPosition<#$48 then EnemyVPosition=#$48
       BCS    L16D5   			;2
       LDA    #$48    			;2

L16D5: STA    EnemyVPosition     	;3

       SEC            			;2		EnemyVPosition - 12
       SBC    #ENEMIES_V_MIN_DISTANCE	;2
       CMP    EnemyVPosition2     	;3		EnemyVPosition - 12 >= EnemyVPosition2 ?

       BCS    L16E0   			;2
       STA    EnemyVPosition2     	;3		EnemyVPosition2 <-- EnemyVPosition - 12

L16E0: LDA    EnemyVPosition2     	;3
       SEC            			;2
       SBC    #ENEMIES_V_MIN_DISTANCE	;2
       CMP    EnemyVPosition3     	;3		EnemyVPosition2 - 12 >= EnemyVPosition3 ?
       BCS    L16EB   			;2
       STA    EnemyVPosition3     	;3		EnemyVPosition3 <-- EnemyVPosition2 - 12

L16EB: LDA    EnemyVPosition3     	;3
       CMP    Temp2    			;3
       BCS    L16F5   			;2		EnemyVPosition3 <-- SmallDemonVPosition + 12

       LDA    Temp2     		;3
       STA    EnemyVPosition3     	;3

L16F5: LDA    ENEMY_WAVE     		;3              if level 8,9,10,11 then --> $1712
       AND    #$10    			;2
       BEQ    L1712   			;2

       LDA    ShipExplosion     	;3              if ship is exploding then --> $1712
       BNE    L1712   			;2

       LDA    TeleTransport     	;3		if ENEMY3 is in teletransport mode then --> $1712 
       CMP    #$02    			;2
       BEQ    L1712   			;2

       BIT    SmallDemonRegister    	;3		IF small demon exists then --> $1712
       BMI    L1712   			;2

       LDA    EnemyLeftHPosition3     	;3
       LDY    #$04    			;2	

       JSR    SubHPos			;6

       STA    SmallDemonHPosition     	;3

L1712: LDX    TeleTransport     	;3		if teletransport mode then --> $1744 
       BMI    L1744   			;2

       LDA    TeleTCountDown     	;3		TeleTCountDown = 0 or TeleTCountDown <> 1 ? then --> $1744
       BEQ    L1783   			;2

       DEC    TeleTCountDown		;5
       BNE    L1783   			;2

       LDA    EnemyRegister,X   	;4		No Enemy ? then --> $1744
       AND    #$C0    			;2

       BEQ    L1747   			;2

       LDA    #$90    			;2		update Current Enemy Register: bit x4 = move right - left 
       STA    EnemyRegister,X   	;4

       LDA    #PINK   			;2		update LivesColor pink

       STA    LivesColor    		;3

       LDA    #$10    			;2
       STA    SoundIndex		;3		SoundIndex <-- #$10

       LDA    ENEMY_ROUND		;3                $80 / 2 ---> [0 - 4]
       LSR            			;2
       TAY            			;2

       LDA    EnemyGraphicPointersTable,Y 	;4		  Enemy Graphics Address Table access

       STA    EnemyAnimationIndex0,X   	;4
       STA    EnemyAnimationIndex1,X   	;4


       LDA    EnemyLeftHPosition,X   	;4
       LDY    #$08    			;2
       JSR    SubHPos			;6		L1CCF = SubHPos

       STA    EnemyRightHPosition,X   	;4

L1744: JMP    L17CF   			;3

L1747: INC    AppearedEnemies		;5    AppearedEnemies = AppearedEnemies +1 (one more dead enemy)
       LDA    EnemyRegister,X   	;4
       ORA    #$40    			;2    set bit6 of Enemy register (enemy has been destroyed)
       STA    EnemyRegister,X   	;4

       LDA    Random   			;3    Random --> clear x0 and x1
       AND    #$7C    			;2

       CLC            			;2	Random = Random +16 --> Temp2
       ADC    #$10    			;2
       STA    Temp2     		;3

       LSR            			;2	Random +16 /2 --> AccEnLeftHPar
       STA    AccEnLeftHPar		;3

       LDA    #$A0    			;2	(160 - Temp2) / 2 --> AccEnRightHPar
       SEC            			;2
       SBC    Temp2     		;3
       LSR            			;2
       STA    AccEnRightHPar		;3

       LDY    #$00    			;2	AccEnemyVPar=0, IncrEnLeftHPar=0, $DA=0, IncrEnRightHPar=0, EnemyStatus = 0 

       STY    $D8     			;3
       STY    IncrEnLeftHPar		;3
       STY    $DA     			;3
       STY    IncrEnRightHPar		;3
       STY    EnemyStatus,X   		;4

       LDA    #$70    			;2
       STA    EnemyLeftHPosition,X   	;4	EnemyLeftHPosition = #$70

       LDA    #$A9    			;2
       STA    EnemyRightHPosition,X   	;4	EnemyRightHPosition = #$A9

       LDA    #$20    			;2
       STA    TeleTCountDown		;3	TeleTCountDown <-- #$20    start teletransport of a new enemy

       LDA    SoundIndex		;3
       AND    #$F0    			;2	SoundIndex = x x x x 0 0 0 1 ; teletransport sound 
       ORA    #$01    			;2	
       STA    SoundIndex		;3

L1783: LDA    EnemyRegister,X   	;4      x7=0 and x6=1 in EnemyRegister ?
       AND    #$C0    			;2
       CMP    #$40    			;2
       BNE    L17CF   			;2	if no, then --> go to $17CF

       LDY    $D8     			;3	Y <-- $D8

       LDA    EnemyLeftHParameters,X   	;4	EnemyLeftHParameters = EnemyLeftHParameters + IncrEnLeftHPar
       CLC            			;2
       ADC    IncrEnLeftHPar		;3
       STA    EnemyLeftHParameters,X   	;4

       BCC    L1797   			;2	if EnemyLeftHParameters < 0 then --> go to $1797 

       INY            			;2	Y = Y + 1
L1797: CPY    #$00    			;2
       BEQ    L17A2   			;2	if Y not zero then continue

       LDA    EnemyLeftHPosition,X   	;4
       JSR    SubHPos			;6

       STA    EnemyLeftHPosition,X   	;4	update EnemyLeftHPosition

L17A2: LDY    $DA     			;3	Y <-- $DA

       LDA    EnemyRightHParameters,X  	;4	EnemyRightHParameters = EnemyRightHParameters + IncrEnRightHPar
       CLC            			;2
       ADC    IncrEnRightHPar		;3
       STA    EnemyRightHParameters,X   ;4

       BCC    L17AE   			;2	if EnemyRightHParameters < 0 then --> go to $1797 
       INY            			;2
L17AE: CPY    #$00    			;2	if Y not zero then continue
       BEQ    L17B9   			;2

       LDA    EnemyRightHPosition,X   	;4
       JSR    AddHPos  			;6	

       STA    EnemyRightHPosition,X   	;4

L17B9: LDA    IncrEnLeftHPar		;3

       CLC            			;2	IncrEnLeftHPar = IncrEnLeftHPar + AccEnLeftHPar
       ADC    AccEnLeftHPar		;3
       STA    IncrEnLeftHPar		;3
       BCC    L17C4   			;2	if A not zero then inc $D8  

       INC    $D8     			;5
L17C4: LDA    IncrEnRightHPar		;3	IncrEnRightHPar= IncrEnRightHPar+ AccEnRightHPar
       CLC            			;2
       ADC    AccEnRightHPar		;3
       STA    IncrEnRightHPar		;3
       BCC    L17CF   			;2	if A not zero then inc $DA 

       INC    $DA     			;5
L17CF: BIT    ENEMY_WAVE     		;3      check ENEMY_WAVE
       BPL    L1822   			;2

       LDY    levelmod12     		;3
       INC    ActionCounter		;5	ActionCounter = ActionCounter + 1
       LDA    ActionCounter		;3

       CMP    L1DA2,Y 			;4	compare with table $1DA2 that is associated to level
       BNE    L1822   			;2

       JSR    L1AE6   			;6

       LDX    #$00    			;2
       STX    ActionCounter		;3	ActionCounter <-- #$00

L17E5: LDA    EnemyShotGraphics+1,X 	;4	translate shot graphics $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE 
       STA    EnemyShotGraphics,X  	;4				--> $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD 

       INX            			;2
       CPX    #$09    			;2
       BNE    L17E5   			;2

       LDA    EnemyVPosition3     	;3 		EnemyVPosition3 / 8
       LSR            			;2
       LSR            			;2
       LSR            			;2

       TAX            			;2
       CPX    #$0A    			;2		EnemyVPosition3 / 8 < than #$0A ?
       BCC    L17FA   			;2

       LDX    #$09    			;2		X = [0..9]

L17FA: LDA    $B4     			;3	if $B4 equal zero then --> X=09  
       BNE    L1802   			;2

       LDX    #$09    			;2
       BNE    L1820   			;2

L1802: DEC    $B4     			;5	$B4 = $B4 - 1
       BIT    ENEMY_WAVE     		;3
       BVC    L1812   			;2	check ENEMY_WAVE

       LDA    #$81    			;2
       BIT    Enemy3Status     		;3      check Enemy3Status with A=#$81 
       BPL    L1820   			;2
	
       LDA    #$80    			;2
       BNE    L1820   			;2

L1812: LDA    #$0F    			;2      A=#$81, #$80, #$0F, #$03 
       BIT    Enemy3Status     		;3
       BPL    L181A   			;2

       LDA    #$03    			;2
L181A: AND    Random     		;3      Random = MASK
       TAY            			;2

       LDA    EnemyShotGraphicsTable,Y	;4        enemy shots table !
L1820: STA    EnemyShotGraphics,X   	;4


;-------------------------------------------------------------------------------
;
; game over or attract (demo) mode
;
;

L1822:
       LDX    #$00                    	;
       TXA                            	;
       BIT    gameState               	; 
       BPL    .setCopyRightPtr         	; branch if not zero (demo mode)
       BIT    game_mode2                ; 
       BVS    .setCopyRightPtr         	; branch if not zero (demo mode or game over)

;print game select

       JSR    SetDigitLowPtr           	; clear first 2 digits
       LDA    GAME_SELECTION          	; game selection
       JSR    SetDigitLowPtr           	;               ...use as next 2 digits

       LDA    #$AA                    	; show trailing blanks #$AA
       JSR    SetDigitLowPtr           	;
       JMP    L1851                   	;

.setCopyRightPtr:			;  
       LDY    CurrenPlayer      	;   PRINT COPYRIGHT LOGO
       LDA    SCORE1_P1,Y 		;   SCORE1_P1
       JSR    SetDigitLowPtr		;
       LDA    SCORE2_P1,Y 		;   SCORE2_P1
       JSR    SetDigitLowPtr		;
       LDA    SCORE3_P1,Y 		;   SCORE3_P1
       JSR    SetDigitLowPtr		;


L1851: LDX    #$00    			;2

L1853: LDA    ScoreGraphics0,X   	;4  select game variation ?
       BNE    L1861   			;2

       LDA    #$64    			;2
       STA    ScoreGraphics0,X   	;4
       INX            			;2
       INX            			;2
       CPX    #$0A    			;2
       BNE    L1853   			;2

L1861: LDX    SoundIndex		;3
       CPX    #$30    			;2
       BNE    L186B   			;2
       LDA    BackgroundColor     	;3
       BCS    L1870   			;2

L186B: LDY    CurrenPlayer	   	;3

       LDA    ShipColorTable,Y 		;4
L1870: STA    ShipColor     		;3

       LDA    ShotColorTable,Y 		;4
       STA    ShotColor     		;3

       JMP    L1000         		;3         jump to Kernel ?

;---------------------------------------------------------------------------------------

L187A: 

  IF NTSC
       LDA    #$26    			;2   check collisions
  ELSE
       LDA    #$2B   			;2
  ENDIF

       STA    TIM64T  			;4   set timer with #$26 clock cycles of 64

       BIT    ENEMY_WAVE     		;3
       BMI    L1887   			;2

       LDA    CXP1FB  			;3	Temp <-- COLLISION P1 - PF and P1 - BL
       STA    Temp    			;3

L1887: LDA    CXPPMM  			;3
       BPL    L18B5   			;2

       BIT    Temp2     		;3	Temp2 <-- previous collision P1 - P2 and M1 - M2
       BMI    L18B5   			;2

       LDA    #$40    			;2	ShipExplosion = #$40
       STA    ShipExplosion     	;3
       STA    ExtraLifeCnt		;3	ExtraLifeCnt <-- ShipExplosion = #$40

       LDA    playerX     		;3	update ship position --> AddHPos (increased of Y=4)
       LDY    #$04    			;2
       JSR    AddHPos  			;6
       STA    playerX     		;3

       LDY    #$08    			;2	update SmallDemon position --> (decreased of Y=4)
       JSR    SubHPos			;6

       STA    SmallDemonHPosition     	;3

       STY    $B4     			;3	CLEAR $B4 and SmallDemonRegister
       STY    SmallDemonRegister     	;3

       LDA    ENEMY_WAVE     		;3
       ORA    #$80    			;2	ENEMY_WAVE set x7 = 1
       STA    ENEMY_WAVE     		;3

       BIT    StatusInProgress		;3	check FLAG StatusInProgress

       BVS    L18B5   			;2

       STY    COLUPF  			;3	explosion !!! background = WHITE 

L18B5: LDA    ShipExplosion    		;3
       BEQ    L191F   			;2	NO EXPLOSION ? then go to --> $191F

       DEC    ShipExplosion    		;5	
       BNE    L1915  			;2	ShipExplosion = ShipExplosion - 1

  IF NTSC
       LDA    #$6E    			;2 ---------------------------------------------
  ELSE
       LDA    #$AE   			;2
  ENDIF

       STA    COLUPF  			;3

       LDA    #$05    			;2
       STA    playerX     		;3	update ship position --> 1CED
       JSR    L1CED   			;6

       BIT    gameState     		;3   is demo mode or game mode ?
       BPL    L1915   			;2

       LDX    CurrenPlayer	    	;3	game mode

       BIT    CoopVersion	     	;3
       BPL    L18DF   			;2	2 simultaneous players ?

       TXA            			;2
       EOR    #$01    			;2
       TAY            			;2

       LDX    #$05    			;2	increment score of the other player
       LDA    #$00    			;2
       JSR    .IncrementScore   	;6	

       LDX    #$00    			;2

L18DF: DEC    numberOfLives_player1,X   ;6    	decrement number of lives
       BPL    L1915   			;2		it was the last life ? no, go to --> $1915

       LDA    numberOfPlayers     	;3	2 players game ?
       BEQ    L18FF   			;2
       TXA            			;2
       EOR    #$01    			;2
       TAX            			;2
       LDA    numberOfLives_player1,X   ;4      check number of lives of player 2
       BMI    L18FF   			;2				 no lives, go to --> $1915

       LDA    #$08    			;2	PLAYER 2 has still lives
       STA    AppearedEnemies		;3				 AppearedEnemies <-- #$08

       STY    EnemyRegister     	;3	update enemy registers
       STY    Enemy2Register    	;3
       STY    Enemy3Register     	;3

       STY    TeleTCountDown		;3	update TeleTCountDown
       STY    SmallDemonRegister     	;3	update small demon registers

       BPL    L1915   			;2


L18FF: STX    COLUPF  			;3	GAME OVER
       STX    ShipColor     		;3

       JSR    L1AD2   			;6      subroutine cleaning a lot of RAM variables and game_state

       LDA    #$40    			;2
       STA    game_mode2     		;3	game_mode2 <-- "game over" = #$40 

       LDA    #$30    			;2
       STA    SoundIndex     		;3	SoundIndex <-- #$30

       LDA    #$78    			;2
       STA    CurrEnGraphPtr		;3	CurrEnGraphPtr <-- #$78

       JMP    L1A7D   			;3


L1915: LDA    ShipExplosion     	;3	background lighting effect of explosion 
       CMP    #$30    			;2
       BCC    L191F   			;2

       AND    #$0F    			;2	change background color
       STA    BackgroundColor    	;3

L191F: BIT    StatusInProgress     	;3      check StatusInProgress
       BVS    L1926   			;2

L1923: JMP    L19D6   			;3      goto motion control


;------------------------------------------------------------------------------------------------


L1926: LDA    CXP0FB  			;3	check collisions
       ORA    Temp    			;3
       AND    #$40    			;2
       BEQ    L1942   			;2

       LDX    #$00    			;2	check vertical position of player's shot
       LDA    ShotVerticalPosition     	;3
       CMP    #$0D    			;2	equal to #$0D ?
       BCC    L1923   			;2

       CLC            			;2
       ADC    #$08    			;2      ShotVerticalPosition + 8
L1939: CMP    EnemyVPosition,X   	;4	check Enemy position with shotposition + 8
       BCS    L1944   			;2

       INX            			;2
       CPX    #$04    			;2
       BNE    L1939   			;2      check for all the enemies



L1942: BEQ    L1923   			;2

L1944: CPX    TeleTransport     	;3      check if current enemy is in teletransport process
       BEQ    L1923   			;2      

       LDA    #$03    			;2      if not, continue
       CPX    #$03    			;2
       BNE    L195E   			;2

       BIT    ENEMY_WAVE     		;3	if it is the third enemy (lower on screen) and enemy wave is not the first one
       BMI    L1923   			;2

       CMP    SmallDemonAnimationIndex  ;3	check if there is the small demon
       BCS    L1923   			;2

       STA    SmallDemonAnimationIndex  ;3	update SmallDemonAnimationIndex <-- #$03

       LDY    #$04    			;2
       STY    Temp2    			;3	Temp2 <-- #$04
       BCC    L1998   			;2

L195E: LDY    EnemyStatus,X   		;4	get EnemyStatus of current enemy
       BPL    L197E   			;2

       LDY    #$02    			;2
       STY    Temp2     		;3	Temp2 <-- #$02

       BIT    CXP0FB  			;3	check collisions
       BVS    L1976   			;2

       BIT    Temp    			;3	check Temp
       BVC    L19D6   			;2

       CMP    EnemyAnimationIndex1,X   	;4
       BCS    L19D6   			;2

       STA    EnemyAnimationIndex1,X   	;4
       BVS    L19A0   			;2

L1976: CMP    EnemyAnimationIndex0,X   	;4
       BCS    L19D6   			;2

       STA    EnemyAnimationIndex0,X   	;4
       BVS    L19A0   			;2

L197E: LDY    #$01    			;2
       STY    Temp2     		;3	Temp2 <-- #$01

       BIT    StatusInProgress     	;3
       BMI    L198C   			;2

       CMP    EnemyAnimationIndex0,X   	;4

       BCS    L19D6   			;2
       BCC    L1994   			;2

L198C: LDA    #$18    			;2

       LDY    EnemyAnimationIndex0,X   	;4
       CPY    #$16    			;2
       BCS    L19D6   			;2

L1994: STA    EnemyAnimationIndex0,X   	;4
       STA    EnemyAnimationIndex1,X   	;4

L1998: LDA    EnemyRegister,X   	;4	EnemyRegister: set bits x6 and x7
       AND    #$3F    			;2			
       ORA    #$C0    			;2
       STA    EnemyRegister,X   	;4

L19A0: JSR    L1CED   			;6

       BIT    gameState     		;3	DEMO MODE ?
       BPL    L19D6   			;2	YES, then jump to $19d6

       LDX    #$00    			;2      x=0
       LDA    levelmod12     		;3
       LSR            			;2	level/2 [0..5]
       TAY            			;2
       TXA            			;2
       SED            			;2
L19AF: CLC            			;2
       ADC    ScoreTable,Y 		;4      add value from ScoreTable
       BCC    L19B6   			;2
       INX            			;2      x= x + 1

L19B6: DEC    Temp2     		;5	Temp2 = Temp2 - 1
       BNE    L19AF   			;2

       CLD            			;2
       LDY    CurrenPlayer	     	;3

       JSR    .IncrementScore   	;6      increment score : score = score + A

       LDA    #$00    			;2
       STA    $B4     			;3	$B4 <--- 0

       LDY    ENEMY_ROUND		;3	Y  <-- $80  [between 0..7]

       LDA    EnemyGraphicPointersTable,Y 	;4        content of EnemyGraphicPointersTable,Y

       ASL            			;2 	multiply by 8
       ASL            			;2
       ASL            			;2

       STA    CurrEnGraphPtr		;3        pointer to enemy graphics

       LDA    SoundIndex		;3
       AND    #$0F    			;2	SoundIndex : 0 0 1 0 x x x x
       ORA    #$20    			;2	     
       STA    SoundIndex		;3

L19D6: LDA    FrameCounter     		;3      get Mod4 (FrameCounter) ---> [0..3] --> X
       AND    #$03    			;2
       TAX            			;2      		|<--------  as function of X
					;			|
       LDA    EnemyRegister,X   	;4      EnemyRegister
       AND    #$F0    			;2
       STA    Temp2     		;3      clear bits x3, x2, x1, x0

       INC    EnemyRegister,X   	;6      increment EnemyRegister

       LDA    EnemyRegister,X   	;4      clear EnemyRegister bits x7, x6, x5, x4 	
       AND    #$0F   			;2
       ORA    Temp2     		;3      set bits Temp2   
       STA    EnemyRegister,X   	;4

       LDX    #$02    			;2     X = 2

;--------------------------------------- 	            CALCULATION OF MOTION FOR ENEMY 1-3

L19ED: LDA    EnemyRegister,X   	;4     EnemyRegister
       AND    #$C0    			;2     	     x7 = 1 and x6 = 0 ?        
       CMP    #$80    			;2
       BEQ    L19F8   			;2           no --> go to next enemy

       JMP    L1A77   			;3

L19F8: LDA    $B4     			;3     $B4 = 0 ?
       BEQ    L1A00   			;2     yes --> $1A00

       CPX    #$02    			;2     X=2 ?   (third enemy)
       BEQ    L1A1B   			;2     yes --> $1A1B  

L1A00: LDA    EnemyRegister,X   	;4     EnemyRegister as function of X (frame mod4)
       AND    #$07    			;2 
       TAY            			;2     get Mod8 ---> [0..7] --> Y   bits x2,x1,x0 are address 

       LDA    EnemyVParameters,X   	;4	EnemyVParameters
       CLC            			;2
       ADC    VerticalMotionTable,Y 	;4     add content of Table $1EF0+Y (vertical motion table ?) 
       STA    EnemyVParameters,X   	;4

       BCC    L1A1B   			;2     if the result is zero jump to $1A1B (no V Motion)

       LDA    EnemyRegister,X   	;4     EnemyRegister as function of X (frame mod4)
       AND    #$08    			;2     get x3:
       BEQ    L1A19   			;2		if zero then jump to $1A19

       INC    EnemyVPosition,X   	;6     increment VPosition of Enemy No.(1-3)
       BNE    L1A1B   			;2

L1A19: DEC    EnemyVPosition,X   	;6     decrement VPosition of Enemy No.(1-3)

L1A1B: LDA    EnemyStatus,X   		;4     EnemyStatus as function of X (frame mod4) 
       STA    Temp2     		;3     Temp2 <--- EnemyStatus (enemy divided in two small demons?) 

       LDA    EnemyLeftHParameters,X   	;4     EnemyLeftHParameters
       CLC            			;2
       ADC    HorizontalMotionTable,Y 	;4    add content of Table $1EF8+Y (horizontal motion table ?)
       STA    EnemyLeftHParameters,X   	;4 

       BCC    L1A77   			;2     if the result is zero jump to $1A77 (no H Motion)

       BIT    Temp2     		;3     check flag Temp2
       BPL    L1A35   			;2     if not zero jump to $1A35

       LDA    EnemyStatus,X   		;4	EnemyStatus as function of X (frame mod4) 
       ORA    #$08    			;2     set x3=1
       STA    EnemyStatus,X   		;4

       BVC    L1A77   			;2

L1A35: CPX    #$02    			;2     is it the third enemy ? third frame ?
       BNE    L1A3D   			;2     if no --> jump to $1A3D

       LDA    $B4     			;3     check $B4 flag
       BNE    L1A77   			;2

L1A3D: LDY    #$01    			;2     Y=1

       LDA    EnemyRegister,X   	;4      EnemyRegister as function of X (frame mod4)
       AND    #$10    			;2	get x4
       BEQ    L1A61   			;2 

       LDA    EnemyLeftHPosition,X      ;4      get Left HPosition of Enemy No. (1-3)
       CMP    #$49    			;2          = #$49 ?
       BEQ    L1A53   			;2 

       JSR    SubHPos			;6      if no go to subroutine --> SubHPos (Y=number of pixels)

       STA    EnemyLeftHPosition,X   	;4      save new HPosition of Enemy No. (1-3)

       JMP    L1A6C   			;3

L1A53: LDA    EnemyRegister,X   	;4     HPosition of Enemy No. (1-4) =  #$49 !
       EOR    #$10    			;2      EnemyRegister as function of X (frame mod4)
       AND    #$F0    			;2      invert x4, 
       ORA    #$01    			;2		   x(0-3)=%0001
       STA    EnemyRegister,X   	;4

       LDA    EnemyLeftHPosition,X   	;4      get HPosition of Enemy No. (1-3)
       BNE    L1A6C   			;2		= #$00 ? no ---> $1A6C

L1A61: LDA    EnemyLeftHPosition,X   	;4      get HPosition of Enemy No. (1-3)
       CMP    #$71    			;2          	= #$71 ? yes ---> $1A53
       BEQ    L1A53   			;2 

       JSR    AddHPos 			;6      if no go to subroutine --> AddHPos

       STA    EnemyLeftHPosition,X   	;4      save new HPosition of Enemy No. (1-3)

L1A6C: LDY    EnemyStatus,X   		;4     EnemyStatus as function of X (frame mod4) 
       BNE    L1A77   			;2		= #$00 ? yes ---> $1A77

       LDY    #$08    			;2     Y=8
       JSR    SubHPos			;6      if no go subroutine --> SubHPos (Y=number of pixels)

       STA    EnemyRightHPosition,X   	;4      save new RightHPosition of Enemy No. (1-3)

L1A77: DEX            			;2	NEXT FRAME MOD8 (NEXT ENEMY)

       BMI    L1A7D   			;2

       JMP    L19ED   			;3


;-----------------------------------------------------------------------

L1A7D: LDA    INTIM   			;4	WAIT FOR TIMER
       BNE    L1A7D   			;2

       JMP    L1277   			;3

;-----------------------------------------------------------------------

.IncrementScore 

       SED            			;2     addition Y to current score $85 - $83 - $81
       CLC            			;2
       ADC.wy $0085,Y 			;4
       STA.wy $0085,Y 			;5
       TXA            			;2
       BCC    L1A92   			;2
       ADC    #$00    			;2
L1A92: CLC            			;2
       ADC.wy $0083,Y 			;4
       STA.wy $0083,Y 			;5
       LDA    #$00    			;2
       BCC    L1A9F   			;2
       ADC    #$00    			;2
L1A9F: ADC.wy $0081,Y 			;4
       STA.wy $0081,Y 			;5
       CLD            			;2
       RTS            			;6

;-----------------------------------------------------------------------


InitGAME: 
       LDA    #$05    			;2    init game variables subroutine
       STA    playerX			;3   playerX = #$05   initial ship HPosition ?!? sì !

       LDA    #$F5    			;2   
       STA    HPosShift			;3   HPosShift, $F9 = #$F5  (-1; 0101)
       STA    input_memory		;3

       LDA    #$03    			;   Player Shot InitialVPosition = #$03
       STA    ShotVerticalPosition      ;   

       LDA    #$96    			;   initial vertical position of ENEMY1 = #$96  
       STA    EnemyVPosition		;
       LDA    #$87    			;   initial vertical position of ENEMY2 = #$87  
       STA    EnemyVPosition2     	;
       LDA    #$78   			;   initial vertical position of ENEMY3 = #$78 
       STA    EnemyVPosition3     	;

  IF NTSC
       LDA    #$6E   			;   initial color of player's shot/PF-BL (#$6E)
       STA    COLUPF  			;
  ELSE
       LDA    #$AE   			;2
       STA    COLUPF  			;
  ENDIF

       LDA    #BLUE    			;2
       STA    BaseColor 		;3  BaseColor = #BLUE 

       LDA    #$FF    			;2
       STA    ColorFilter     		;3  ColorFilter = #$FF  color filter

       RTS            			;6

;-----------------------------------------------------------------------

ShipColorTable: 

  IF NTSC
       .byte $56 ; | X X XX | $1ACE  SHIP COLOR P0 
       .byte $F8 ; |XXXXX   | $1ACF  SHIP COLOR P1
  ELSE
       .byte $88 ; |X   X   | $1ACE  SHIP COLOR P0 
       .byte $2A ; |  X X X | $1ACF  SHIP COLOR P1
  ENDIF


ShotColorTable: 

  IF NTSC
       .byte $2C ; |  X XX  | $1AD0  SHOT COLOR P0 
       .byte $7A ; | XXXX X | $1AD1  SHOT COLOR P1
  ELSE
       .byte $4E ; | X  XXX | $1AD0  SHOT COLOR P0 
       .byte $BC ; |X XXXX  | $1AD1  SHOT COLOR P1
  ENDIF



;-----------------------------------------------------------------------


L1AD2: LDA    #$00    			;2
       STA    game_mode2     		;3              game_mode2 = 0

       LDX    #$9D    			;2
L1AD8: STA    VSYNC,X 			;4 		clear $9D - $BD RAM variables = 0
       INX            			;2
       CPX    #$BD    			;2
       BNE    L1AD8   			;2

       STX    gameState     		;3              gameState <-- #$BD
       STA    numberOfLives_player1     ;3
       STA    numberOfLives_player2     ;3
       RTS            			;6

;-----------------------------------------------------------------------

L1AE6: LDA    Random   			;3
       STA    Temp2   			;3		Temp2 <-- Random

       LDX    #$07    			;2

L1AEC: LDA    EnemyShotGraphics,X   	;4
       BEQ    L1AFF   			;2

       CLC            			;2
       BIT    Temp2   			;3		check Random
       BPL    L1AF8   			;2

L1AF5: ROR            			;2		left motion of shot
       BCC    L1AFB   			;2

L1AF8: ROL            			;2		right motion of shot
       BCS    L1AF5   			;2

L1AFB: STA    EnemyShotGraphics,X   	;4
       ASL    Temp2     		;5

L1AFF: DEX            			;2
       BPL    L1AEC   			;2
       RTS            			;6

;-----------------------------------------------------------------------

L1B03: CMP    #$00    			;2     		A NOT EQUAL 0 ?
       BNE    L1B08   			;2     			yes, then continue
L1B07: RTS            			;6       

L1B08: LDY    EnemyRegister,X   	;4     
       STY    Temp2    			;3		Temp2 <-- EnemyRegister
       CMP    #$04    			;2
       BCS    L1B21   			;2

       SEC            			;2
       SBC    #$01    			;2
       BNE    L1B07   			;2

       LDA    EnemyStatus,X   		;4
       AND    Temp    			;3
       STA    EnemyStatus,X   		;4

       AND    #$60    			;2

       BEQ    L1B52   			;2
       BNE    L1B5F   			;2

L1B21: TAY            			;2
       LDA    #$07    			;2
       STA    Temp    			;3
       BNE    L1B7D   			;2

;-----------------------------------------------------------------------

L1B28: LDY    EnemyRegister,X   	;4      
       STY    Temp2     		;3       Temp2 <-- save EnemyRegister

       BIT    Temp2     		;3
       BMI    L1B33   			;2       x7 = 1 ? yes ---> $1b33

       BVS    L1B65   			;2       x6 = 1 ? yes ---> $1b65

       RTS            			;6

;-----------------------------------------------------------------------

L1B33: BVC    L1B6F   			;2       x6 = 0 ? yes ---> $1b6f	
					;
					;		EnemyRegister = 1 1 x x x x x x
					;
       SEC            			;2      DemonAnimationIndex = DemonAnimationIndex-1
       SBC    #$01    			;2
       BEQ    L1B52   			;2	if DemonAnimationIndex = 0 then --> $1B52

       CMP    #$15    			;2	if DemonAnimationIndex = #$15  then --> $1B64 
       BNE    L1B64   			;2

       LDA    Temp2     		;3  	
       AND    #$0F    			;2  		EnemyRegister = 1 0 0 0 x x x x
       ORA    #$80    			;2    		
       STA    EnemyRegister,X   	;4 	

       LDA    EnemyStatus,X   		;4	
       ORA    #$F0    			;2		EnemyStatus = 1 1 1 1 x x x x
       STA    EnemyStatus,X   		;4	
       JSR    L1BAF   			;6		SoundIndex  = 0 0 0 1 x x x x
       LDA    #$19    			;2
       RTS            			;6		DemonAnimationIndex = #$19

;-----------------------------------------------------------------------

L1B52: LDA    Temp2     		;3
       AND    #$3F    			;2
       STA    EnemyRegister,X   	;4     EnemyRegister = 0 0 x x x x x x

       CPX    #$03    			;2     is enemy = small demon ?
       BNE    L1B5F   			;2
       JSR    L1CC2   			;6	reset small demon values = 00 EnemyRegister = 1 x x x x x x x

L1B5F: JSR    L1BAF   			;6		SoundIndex  = 0 0 0 1 x x x x
       LDA    #$00    			;2	DemonAnimationIndex = 0
L1B64: RTS            			;6

;-----------------------------------------------------------------------

L1B65: CLC            			;2           DemonAnimationIndex = 3 ?
					;
					;		EnemyRegister = 0 1 x x x x x x
					;
       ADC    #$01    			;2
       CMP    #$04    			;2

       BNE    L1B64   			;2		no  --> return
       LDA    #$01    			;2		yes --> DemonAnimationIndex = 1 
       RTS            			;6

;-----------------------------------------------------------------------

L1B6F: TAY            			;2 		DemonAnimationIndex --> Y
					;
					;		EnemyRegister = 1 0 x x x x x x
					;
       LDA    ENEMY_ROUND     		;3           ENEMY_ROUND /2 -- > Temp
       LSR            			;2
       STA    Temp    			;3

       CPX    #$03    			;2	  x = 3 is for small demon processing time
       BNE    L1B7D   			;2

       LDA    #$07    			;2          if small demon, then #$07 --> Temp
       STA    Temp    			;3

L1B7D: LDA    Temp2   			;3
       AND    #$20    			;2	  check bit x5 of Temp2 (EnemyRegister) (0 = wings animation index going up)
       BNE    L1B95   			;2						(1 = wings animation index going down)

       INY            			;2	  if bit x5=0 then (A <-- DemonAnimationIndex = DemonAnimationIndex +1)
       TYA            			;2

       LDY    Temp    			;3		Y <-- DemonAnimationIndex 
       CMP    EnemyGraphicPointersTable2,Y 	;4	to EnemyGraphicPointersTable2  (Max Index Table)

       BNE    L1B64   			;2        is it limit of Animation Index ?

L1B8C: TAY            			;2

       LDA    Temp2   			;3	Temp2 --> invert bit5 --> Current Enemy Register
       EOR    #$20    			;2			 bit5 is direction of animation index
       STA    EnemyRegister,X   	;4
       TYA            			;2

       RTS            			;6
;-----------------------------------------------------------------------

L1B95: DEY            				;2 	A <-- DemonAnimationIndex = DemonAnimationIndex -1
       TYA            				;2
       LDY    Temp    				;3	Y <-- DemonAnimationIndex 
       CMP    EnemyGraphicPointersTable,Y 	;4	to EnemyGraphicPointersTable  (Min Index Table)
       BEQ    L1B8C   				;2
       RTS            				;6

;-----------------------------------------------------------------------

; Enemy Graphic Pointers Table

EnemyGraphicPointersTable:
       .byte $04 ; |     X  | $1B9F      ENEMY 1 : LOW POINTER --> $1E20  
       .byte $07 ; |     XXX| $1BA0      ENEMY 2 : LOW POINTER --> $1E38
       .byte $0A ; |    X X | $1BA1      ENEMY 3 : LOW POINTER --> $1E50
       .byte $0D ; |    XX X| $1BA2      ENEMY 4 : LOW POINTER --> $1E68
       .byte $10 ; |   X    | $1BA3      ENEMY 5 : LOW POINTER --> $1E80
       .byte $13 ; |   X  XX| $1BA4      ENEMY 6 : LOW POINTER --> $1E98
       .byte $16 ; |   X XX | $1BA5      ENEMY 7 : LOW POINTER --> $1EB0 teletransport 
       .byte $19 ; |   XX  X| $1BA6      SMALL DEMON : LOW POINTER 

EnemyGraphicPointersTable2:
       .byte $06 ; |     XX | $1BA7      ENEMY 1 : HIGH POINTER
       .byte $09 ; |    X  X| $1BA8      ENEMY 2 : HIGH POINTER
       .byte $0C ; |    XX  | $1BA9      ENEMY 3 : HIGH POINTER
       .byte $0F ; |    XXXX| $1BAA      ENEMY 4 : HIGH POINTER
       .byte $12 ; |   X  X | $1BAB      ENEMY 5 : HIGH POINTER
       .byte $15 ; |   X X X| $1BAC      ENEMY 6 : HIGH POINTER
       .byte $18 ; |   XX   | $1BAD      ENEMY 7 : HIGH POINTER teletransport 
       .byte $1B ; |   XX XX| $1BAE      SMALL DEMON : HIGH POINTER 

;-----------------------------------------------------------------------

L1BAF: LDA    SoundIndex      		;3       $B5 = 0 0 0 1 x x x x
       AND    #$0F    			;2
       ORA    #$10    			;2		
       STA    $B5     			;3
       RTS            			;6

;-----------------------------------------------------------------------

.StartSmallAttackingDemon

       LDY    EnemyLeftHPosition3     	;3              Single Small Attacking Demon 
       LDX    Enemy3AnimationIndex0	;3
       CPX    #$05    			;2              if  Enemy3AnimationIndex0<05 animation index left =  4
					;		and
       BCS    L1BC8   			;2		

       LDX    Enemy3AnimationIndex1	;3		    Enemy3AnimationIndex0<05 animation index right = 4

       LDY    EnemyRightHPosition3     	;3
       CPX    #$05    			;2		then return
       BCC    .Exit_StartSmallAttackingDemon

L1BC8: STY    SmallDemonHPosition     	;3		Enemy Left/Right HPosition  -> SmallDemonHPosition 
       STX    SmallDemonAnimationIndex  ;3		Enemy AnimationIndex 0/1    -> SmallDemonAnimationIndex

       LDA    ENEMY_WAVE     		;3
       AND    #$7F    			;2              clear bit7 of ENEMY_WAVE
       STA    ENEMY_WAVE     		;3   
              
       LDA    EnemyVPosition3    	;3              copy V coordinate to demon V coordinate 
       STA    SmallDemonVPosition     	;3

       LDA    Enemy3Register     	;3		Enemy3Register = x x x x 0 0 0 0
       AND    #$F0    			;2						--> SmallDemonRegister
       STA    SmallDemonRegister	;3


       LDX    #$01    			;2  copy information:   ENEMY 3 --> SMALL DEMON
					;			ENEMY 2 --> ENEMY 3
								
.CopyEnemyInformation

       LDA    EnemyRegister,X   	;4		EnemyRegister -> Enemy2Register
       STA    Enemy2Register,X   	;4

       LDA    EnemyLeftHPosition,X   	;4		copy enemy0 position to enemy2
       STA    EnemyLeftHPosition2,X  	;4
       LDA    EnemyRightHPosition,X   	;4		
       STA    EnemyRightHPosition2,X   	;4

       LDA    EnemyAnimationIndex0,X 	;4		EnemyAnimationIndex0 -> Enemy2AnimationIndex0   pointer to enemy graphic
       STA    Enemy2AnimationIndex0,X 	;4
       LDA    EnemyAnimationIndex1,X   	;4		EnemyAnimationIndex1 -> Enemy2AnimationIndex1 
       STA    Enemy2AnimationIndex1,X 	;4

       LDA    EnemyVPosition,X		;4		
       STA    EnemyVPosition2,X   	;4

       LDA    EnemyStatus,X   		;4		EnemyStatus -> Enemy2Status   enemy split in two small demons ?
       STA    Enemy2Status,X   		;4
       DEX            			;2
       BPL    .CopyEnemyInformation	;2

       LDA    TeleTransport     	;3
       BMI    .InitInformationEnemy1	;2
       INC    TeleTransport     	;5

.InitInformationEnemy1

       INX            			;2              Init information of ENEMY 1
       STX    EnemyRegister     	;3
       STX    EnemyAnimationIndex0    	;3
       STX    EnemyAnimationIndex1     	;3
       STX    EnemyStatus     		;3
       LDA    #$96    			;2		standard initial position of ENEMY 1
       STA    EnemyVPosition     	;3

.Exit_StartSmallAttackingDemon

       RTS            			;6

;-----------------------------------------------------------------------

SetDigitLowPtr: 

       STA    Temp2     		;3  CONVERT HEX TO DECIMAL 
       LSR            			;2   
       LSR            			;2
       LSR            			;2  divide BY 16
       LSR            			;2
       JSR    Mult10   			;6  multiply by 10
       STA    ScoreGraphics0,X   	;4  and put in Graphics for Score 
       INX            			;2
       INX            			;2
       LDA    Temp2     		;3
       AND    #$0F    			;2
       JSR    Mult10   			;6
       STA    ScoreGraphics0,X   	;4
       INX            			;2
       INX            			;2
       RTS            			;6

;-----------------------------------------------------------------------

Mult10: 
       ASL            			;2     MULTIPLY BY 10 
       STA    Temp    			;3
       ASL            			;2
       ASL            			;2
       CLC            			;2
       ADC    Temp    			;3
       RTS            			;6

;-----------------------------------------------------------------------

L1C33: LDA    ShipExplosion     	;3
       BNE    L1C6D   			;2

       BIT    SmallDemonRegister	;3
       BMI    L1C6E   			;2

       LDA    Enemy3AnimationIndex0	;3
       CMP    #$04    			;2
       BCC    L1C6D   			;2

       LDY    Random   			;3
       CPY    #$B0    			;2
       BCC    L1C6D   			;2

       LDA    EnemyLeftHPosition3     	;3
       LDY    #$04    			;2
       JSR    SubHPos  			;6

       JSR    L1D31   			;6
       BCS    L1C6D   			;2

       LDY    EnemyVPosition3     	;3
       CPY    #$50    			;2
       BCS    L1C6D   			;2

       STA    SmallDemonHPosition     	;3
       BIT    ENEMY_WAVE     		;3
       BVC    L1C63   			;2

       LDA    #$04    			;2
       BNE    L1C67   			;2

L1C63: LDA    Random   			;3
       AND    #$07    			;2

L1C67: STA    $B4     			;3

       LDA    #$00    			;2
       STA    ActionCounter		;3

L1C6D: RTS            			;6

;-----------------------------------------------------------------------


L1C6E: BIT    SmallDemonRegister     	;3
       BVS    L1CCE   			;2
       LDA    SmallDemonRegister     	;3
       AND    #$07    			;2
       BNE    L1C81   			;2
       LDX    #$03    			;2
       LDA    EnemyRightHPosition,X 	;4
       JSR    L1D3D   			;6

       LDA    #$00    			;2
L1C81: TAY            			;2

       LDA    SmallDemonVPosition     	;3
       CLC            			;2
       ADC    IncVPositionTable,Y	;4
       STA    SmallDemonVPosition     	;3
       BEQ    L1CC2   			;2

       LDA    SmallDemonHPos		;3
       CLC            			;2
       ADC    IncHPositionTable,Y	;4
       STA    SmallDemonHPos		;3
       BCC    L1CCE   			;2

       LDY    #$01    			;2

       LDA    SmallDemonRegister     	;3
       AND    #$10    			;2    bit x4 of SmallDemonRegister
       BEQ    L1CA6   			;2

       LDA    SmallDemonHPosition     	;3
       JSR    SubHPos  			;6
       JMP    L1CAF   			;3

L1CA6: LDA    SmallDemonHPosition     	;3
       CMP    #$71    			;2
       BEQ    L1CAF   			;2
       JSR    AddHPos  			;6

L1CAF: STA    SmallDemonHPosition    	;3
       RTS            			;6

;-----------------------------------------------------------------------

; motion increment table 

IncVPositionTable:

       .byte $FF ; |XXXXXXXX| $1CB2
       .byte $FF ; |XXXXXXXX| $1CB3
       .byte $FF ; |XXXXXXXX| $1CB4
       .byte $FF ; |XXXXXXXX| $1CB5
       .byte $FF ; |XXXXXXXX| $1CB6
       .byte $01 ; |       X| $1CB7
       .byte $01 ; |       X| $1CB8
       .byte $01 ; |       X| $1CB9

IncHPositionTable:

       .byte $40 ; | X      | $1CBA
       .byte $80 ; |X       | $1CBB
       .byte $C0 ; |XX      | $1CBC
       .byte $FF ; |XXXXXXXX| $1CBD
       .byte $FF ; |XXXXXXXX| $1CBE
       .byte $C0 ; |XX      | $1CBF
       .byte $80 ; |X       | $1CC0
       .byte $40 ; | X      | $1CC1

;-----------------------------------------------------------------------



L1CC2: LDA    #$00    			;2
       STA    SmallDemonRegister     	;3  	SmallDemonRegister <-- 00
       STA    SmallDemonAnimationIndex  ;3	SmallDemonAnimationIndex <-- 00

       LDA    ENEMY_WAVE     		;3	
       ORA    #$80    			;2	set bit x7 of ENEMY_WAVE
       STA    ENEMY_WAVE     		;3

L1CCE: RTS            			;6

;-----------------------------------------------------------------------

; FINE HORIZONTAL POSITIONING on screen (decrease H position of Y pixels)

SubHPos: 

       SEC            				;2 SEC
       SBC    #$10    				;2   subtract 0 0 0 1 0 0 0 0
       BMI    L1CDA   				;2  
       CMP    #$70    				;2    
       BCC    L1CDA   				;2 repeat a number of Y times
       ADC    #$F0    				;2
L1CDA: DEY            				;2
       BNE    SubHPos				;2
       RTS            				;6

;-----------------------------------------------------------------------

; FINE HORIZONTAL POSITIONING on screen increase H position of Y pixels) 

AddHPos:

       CLC            				;2 CLC    
       ADC    #$10    				;2   add 0 0 0 1 0 0 0 0
       BPL    L1CE9   				;2 
       CMP    #$90    				;2  
       BCS    L1CE9   				;2     
       SBC    #$F0    				;2
L1CE9: DEY            				;2 repeat a number of Y times
       BNE    AddHPos  				;2
       RTS            				;6

;-----------------------------------------------------------------------

L1CED: LDA    ShipExplosion     	;3
       BEQ    L1CF5   			;2

       LDA    #$00    			;2   #$00
       STA    COLUPF  			;3

L1CF5: LDA    #$03    			;2
       STA    ShotVerticalPosition      ;3   Init Shot vertical Position
       LDA    StatusInProgress		;3
       AND    #$BF    			;2   StatusInProgress : bit x6 <-- 0
       STA    StatusInProgress		;3

       LDA    playerX     		;3   HPosShift = playerX - 1
 
       LDY    #$01    			;2
       JSR    SubHPos  			;6
       STA    HPosShift			;3   

       RTS            			;6

;-----------------------------------------------------------------------

NewEnemyVPosition: 

       CPX    #$00   			;2      calculate V position for new enemy 
       BNE    L1D15   			;2

       LDA    #$97    			;2	if X = 0 then,

       CLC            			;2
       ADC    EnemyVPosition2     	;3	A= (EnemyVPosition2 + 151)/2
       JMP    L1D2F   			;3

L1D15: CPX    #$01    			;2
       BNE    L1D21   			;2	if X = 1 then,
       LDA    EnemyVPosition     	;3	A = (EnemyVPosition + EnemyVPosition3)/2
       CLC            			;2
       ADC    EnemyVPosition3     	;3
       JMP    L1D2F   			;3

L1D21: LDA    EnemyVPosition2     	;3	if X = 2 then,

       CLC            			;2	A = (EnemyVPosition2 + SmallDemonVPosition)/2

       BIT    SmallDemonRegister     	;3
       BPL    L1D2D   			;2
       ADC    SmallDemonVPosition     	;3
       JMP    L1D2F   			;3	

L1D2D: ADC    NewEnemyVShift		;3      A = A + [44 - 2*LEVEL (MOD12)]

L1D2F: ROR            			;2	divide by 2
       RTS            			;6

;-----------------------------------------------------------------------

L1D31: LDX    #$09    			;2
       SEC            			;2
L1D34: LDY    EnemyShotGraphics,X   	;4		
       BNE    L1D3C   			;2
       DEX            			;2
       BPL    L1D34   			;2
       CLC            			;2
L1D3C: RTS            			;6

;-----------------------------------------------------------------------

L1D3D: LDY    #$04    			;2
       JSR    SubHPos  			;6

       STA    Temp    			;3
       AND    #$0F    			;2

       STA    Temp2     		;3
 
       LDA    playerX     	;3
       AND    #$0F    			;2
       CMP    Temp2     		;3
       BNE    L1D7B   			;2

       LDA    SWCHB   			;4  JOYSTICK
       ASL            			;2
       LDY    CurrenPlayer	     	;3
       BNE    L1D59   			;2
       ASL            			;2
L1D59: LDY    #$FF    			;2
       BCC    L1D5F   			;2
       LDY    #$0F    			;2
L1D5F: STY    Sprite0Ptr     		;3
       LDA    Temp    			;3
       LSR            			;2  DIVIDE BY 16
       LSR            			;2
       LSR            			;2
       LSR            			;2
       CLC            			;2
       ADC    #$08    			;2
       EOR    Sprite0Ptr     		;3
       STA    Temp2     		;3
       LDA    playerX     	;3
       LSR            			;2  DIVIDE BY 16
       LSR            			;2
       LSR            			;2
       LSR            			;2
       CLC            			;2
       ADC    #$08    			;2
       EOR    Sprite0Ptr     		;3
       CMP    Temp2     		;3
L1D7B: LDA    EnemyRegister,X   	;4
       BCC    L1D83   			;2
       ORA    #$10    			;2
       BNE    L1D85   			;2
L1D83: AND    #$EF    			;2
L1D85: STA    EnemyRegister,X   	;4
       RTS            			;6


;===============================================================================
; R O M - T A B L E S
;===============================================================================

PlayerShipGraphics:

       .byte $C6 ; |XX   XX | $1D88
       .byte $C6 ; |XX   XX | $1D89
       .byte $C6 ; |XX   XX | $1D8A
       .byte $C6 ; |XX   XX | $1D8B
       .byte $EE ; |XXX XXX | $1D8C
       .byte $EE ; |XXX XXX | $1D8D
       .byte $6C ; | XX XX  | $1D8E
       .byte $6C ; | XX XX  | $1D8F
       .byte $28 ; |  X X   | $1D90
       .byte $28 ; |  X X   | $1D91
       .byte $28 ; |  X X   | $1D92
       .byte $28 ; |  X X   | $1D93
;---------------------------------------------------

; sequence of objects control as a function of frame

ObjectsControl:
 
       .byte $00 ; |        | $1D94
       .byte $80 ; |X       | $1D95
       .byte $01 ; |       X| $1D96
       .byte $03 ; |      XX| $1D97
       .byte $02 ; |      X | $1D98
       .byte $80 ; |X       | $1D99
       .byte $03 ; |      XX| $1D9A
       .byte $80 ; |X       | $1D9B

;---------------------------------------------------

; graphics for lives

TableLivesGraphics:

       .byte $00 ; |        | $1D9C
       .byte $28 ; |  X X   | $1D9D
       .byte $28 ; |  X X   | $1D9E
       .byte $38 ; |  XXX   | $1D9F
       .byte $10 ; |   X    | $1DA0
       .byte $10 ; |   X    | $1DA1

;---------------------------------------------

; table associated to each level Mod12 (0-11)
;
; max value of ActionCounter defines
;
; enemy shot speed
;

L1DA2:

  IF NTSC
       .byte $08 ; |    X   | $1DA2
       .byte $06 ; |     XX | $1DA3
       .byte $06 ; |     XX | $1DA4
       .byte $03 ; |      XX| $1DA5
       .byte $05 ; |     X X| $1DA6
       .byte $04 ; |     X  | $1DA7
       .byte $05 ; |     X X| $1DA8
       .byte $04 ; |     X  | $1DA9
       .byte $05 ; |     X X| $1DAA
       .byte $04 ; |     X  | $1DAB
       .byte $05 ; |     X X| $1DAC
       .byte $04 ; |     X  | $1DAD
  ELSE
       .byte $07 ; |     XXX| $1DA2
       .byte $05 ; |     X X| $1DA3
       .byte $05 ; |     X X| $1DA4
       .byte $03 ; |      XX| $1DA5
       .byte $04 ; |     X  | $1DA6
       .byte $04 ; |     X  | $1DA7
       .byte $04 ; |     X  | $1DA8
       .byte $04 ; |     X  | $1DA9
       .byte $05 ; |     X X| $1DAA
       .byte $03 ; |      XX| $1DAB
       .byte $04 ; |     X  | $1DAC
       .byte $03 ; |      XX| $1DAD
  ENDIF




;---------------------------------------------
;
; Tables for replication of graphics for lives

ReplicationTable1:

L1DAE: .byte $00 ; |        | $1DAE
       .byte $00 ; |        | $1DAF
       .byte $00 ; |        | $1DB0
       .byte $01 ; |       X| $1DB1
       .byte $01 ; |       X| $1DB2
       .byte $03 ; |      XX| $1DB3
       .byte $03 ; |      XX| $1DB4

ReplicationTable2:

L1DB5: .byte $00 ; |        | $1DB5
       .byte $00 ; |        | $1DB6
       .byte $00 ; |        | $1DB7
       .byte $00 ; |        | $1DB8
       .byte $01 ; |       X| $1DB9
       .byte $01 ; |       X| $1DBA
       .byte $03 ; |      XX| $1DBB

;-------------------------------------------

; ADDRESS table for explosion graphics 

ShipExplosionGraphics:

       .byte $E7 ; $1DE7 .EXPLOSION_01
       .byte $E2 ; $1DE2 .EXPLOSION_02
       .byte $DD ; $1DDD .EXPLOSION_03
       .byte $D8 ; $1DD8 .EXPLOSION_04
       .byte $D3 ; $1DD3 .EXPLOSION_05
       .byte $CE ; $1DCE .EXPLOSION_06
       .byte $C9 ; $1DC9 .EXPLOSION_07
       .byte $C4 ; $1DC4 .EXPLOSION_08

;-------------------------------------------

.EXPLOSION_08
       .byte $06 ; |     XX | $1DC4
       .byte $03 ; |      XX| $1DC5
       .byte $01 ; |       X| $1DC6
       .byte $00 ; |        | $1DC7
       .byte $00 ; |        | $1DC8

.EXPLOSION_07
       .byte $06 ; |     XX | $1DC9
       .byte $01 ; |       X| $1DCA
       .byte $04 ; |     X  | $1DCB
       .byte $02 ; |      X | $1DCC
       .byte $00 ; |        | $1DCD

.EXPLOSION_06
       .byte $0A ; |    X X | $1DCE
       .byte $00 ; |        | $1DCF
       .byte $02 ; |      X | $1DD0
       .byte $10 ; |   X    | $1DD1
       .byte $04 ; |     X  | $1DD2

.EXPLOSION_05
       .byte $10 ; |   X    | $1DD3
       .byte $02 ; |      X | $1DD4
       .byte $04 ; |     X  | $1DD5
       .byte $40 ; | X      | $1DD6
       .byte $10 ; |   X    | $1DD7

.EXPLOSION_04
       .byte $00 ; |        | $1DD8
       .byte $10 ; |   X    | $1DD9
       .byte $82 ; |X     X | $1DDA
       .byte $44 ; | X   X  | $1DDB
       .byte $00 ; |        | $1DDC

.EXPLOSION_03
       .byte $00 ; |        | $1DDD
       .byte $40 ; | X      | $1DDE
       .byte $90 ; |X  X    | $1DDF
       .byte $02 ; |      X | $1DE0
       .byte $08 ; |    X   | $1DE1

.EXPLOSION_02
       .byte $40 ; | X      | $1DE2
       .byte $80 ; |X       | $1DE3
       .byte $08 ; |    X   | $1DE4
       .byte $00 ; |        | $1DE5
       .byte $24 ; |  X  X  | $1DE6

.EXPLOSION_01
       .byte $80 ; |X       | $1DE7
       .byte $00 ; |        | $1DE8
       .byte $00 ; |        | $1DE9
       .byte $00 ; |        | $1DEA
       .byte $84 ; |X    X  | $1DEB

;-----------------------------------------------------------------------

; TABLE FOR EXPLOSION COLOR GRAPHICS

ShipExplosionColor:

       .byte $8A ; |X   X X | $1DEC     COLOR TABLE
       .byte $6A ; | XX X X | $1DED	
       .byte $4A ; | X  X X | $1DEE
       .byte $7A ; | XXXX X | $1DEF
       .byte $9A ; |X  XX X | $1DF0

;-----------------------------------------------------------------------

; TABLE FOR ENEMY WAVES
;

EnemyWaveTable:
       .byte $80 ; |X       | $1DF1
       .byte $C0 ; |XX      | $1DF2
       .byte $A0 ; |X X     | $1DF3
       .byte $E0 ; |XXX     | $1DF4
       .byte $B0 ; |X XX    | $1DF5
       .byte $F0 ; |XXXX    | $1DF6

; TABLE FOR PLAYER'S SHOT SPEED 
;

PlayerShotSpeedTable:

  IF NTSC
       .byte $03 ; |      XX| $1DF7      shot speed as function of level 
       .byte $04 ; |     X  | $1DF8
       .byte $05 ; |     X X| $1DF9
       .byte $05 ; |     X X| $1DFA
       .byte $06 ; |     XX | $1DFB
       .byte $06 ; |     XX | $1DFC
  ELSE
       .byte $04 ; |     X  | $1DF7
       .byte $05 ; |     X X| $1DF8
       .byte $06 ; |     XX | $1DF9
       .byte $06 ; |     XX | $1DFA
       .byte $07 ; |     XXX| $1DFB
       .byte $07 ; |     XXX| $1DFC
  ENDIF



;-----------------------------------------------------------------------
       .byte $00 ; |        | $1DFD ??
       .byte $00 ; |        | $1DFE
       .byte $00 ; |        | $1DFF

;-----------------------------------------------------------------------

L1E00: .byte $00 ; |        | $1E00 ??
       .byte $00 ; |        | $1E01
       .byte $00 ; |        | $1E02
       .byte $00 ; |        | $1E03
       .byte $00 ; |        | $1E04
       .byte $00 ; |        | $1E05
       .byte $00 ; |        | $1E06
       .byte $00 ; |        | $1E07

;-----------------------------------------------------------------------

; teletransportation graphics

       .byte $00 ; |        | $1E08
       .byte $88 ; |X   X   | $1E09
       .byte $20 ; |  X     | $1E0A
       .byte $08 ; |    X   | $1E0B
       .byte $00 ; |        | $1E0C
       .byte $02 ; |      X | $1E0D
       .byte $40 ; | X      | $1E0E
       .byte $10 ; |   X    | $1E0F

       .byte $00 ; |        | $1E10
       .byte $40 ; | X      | $1E11
       .byte $08 ; |    X   | $1E12
       .byte $40 ; | X      | $1E13
       .byte $04 ; |     X  | $1E14
       .byte $00 ; |        | $1E15
       .byte $48 ; | X  X   | $1E16
       .byte $02 ; |      X | $1E17

       .byte $00 ; |        | $1E18
       .byte $44 ; | X   X  | $1E19
       .byte $00 ; |        | $1E1A
       .byte $40 ; | X      | $1E1B
       .byte $04 ; |     X  | $1E1C
       .byte $20 ; |  X     | $1E1D
       .byte $09 ; |    X  X| $1E1E
       .byte $00 ; |        | $1E1F

;-----------------------------------------------------------------------

       .byte $00 ; |        | $1E20 	ENEMY 1
       .byte $03 ; |      XX| $1E21
       .byte $07 ; |     XXX| $1E22
       .byte $0E ; |    XXX | $1E23
       .byte $19 ; |   XX  X| $1E24
       .byte $F0 ; |XXXX    | $1E25
       .byte $02 ; |      X | $1E26
       .byte $00 ; |        | $1E27

       .byte $00 ; |        | $1E28
       .byte $06 ; |     XX | $1E29
       .byte $03 ; |      XX| $1E2A
       .byte $CE ; |XX  XXX | $1E2B
       .byte $71 ; | XXX   X| $1E2C
       .byte $00 ; |        | $1E2D
       .byte $04 ; |     X  | $1E2E
       .byte $00 ; |        | $1E2F

       .byte $00 ; |        | $1E30
       .byte $4C ; | X  XX  | $1E31
       .byte $46 ; | X   XX | $1E32
       .byte $23 ; |  X   XX| $1E33
       .byte $1F ; |   XXXXX| $1E34
       .byte $02 ; |      X | $1E35
       .byte $01 ; |       X| $1E36
       .byte $08 ; |    X   | $1E37

;-----------------------------------------------------------------------

       .byte $00 ; |        | $1E38 	ENEMY 2
       .byte $10 ; |   X    | $1E39
       .byte $21 ; |  X    X| $1E3A
       .byte $22 ; |  X   X | $1E3B
       .byte $24 ; |  X  X  | $1E3C
       .byte $14 ; |   X X  | $1E3D
       .byte $0F ; |    XXXX| $1E3E
       .byte $0C ; |    XX  | $1E3F

       .byte $00 ; |        | $1E40
       .byte $40 ; | X      | $1E41
       .byte $82 ; |X     X | $1E42
       .byte $84 ; |X    X  | $1E43
       .byte $64 ; | XX  X  | $1E44
       .byte $1F ; |   XXXXX| $1E45
       .byte $06 ; |     XX | $1E46
       .byte $00 ; |        | $1E47

       .byte $00 ; |        | $1E48
       .byte $44 ; | X   X  | $1E49
       .byte $24 ; |  X  X  | $1E4A
       .byte $14 ; |   X X  | $1E4B
       .byte $0F ; |    XXXX| $1E4C
       .byte $03 ; |      XX| $1E4D
       .byte $00 ; |        | $1E4E
       .byte $00 ; |        | $1E4F

;-----------------------------------------------------------------------

       .byte $00 ; |        | $1E50 	ENEMY 3
       .byte $36 ; |  XX XX | $1E51
       .byte $1D ; |   XXX X| $1E52
       .byte $02 ; |      X | $1E53
       .byte $04 ; |     X  | $1E54
       .byte $0A ; |    X X | $1E55
       .byte $04 ; |     X  | $1E56
       .byte $00 ; |        | $1E57
       .byte $00 ; |        | $1E58

       .byte $09 ; |    X  X| $1E59
       .byte $1E ; |   XXXX | $1E5A
       .byte $32 ; |  XX  X | $1E5B
       .byte $24 ; |  X  X  | $1E5C
       .byte $08 ; |    X   | $1E5D
       .byte $0A ; |    X X | $1E5E
       .byte $00 ; |        | $1E5F

       .byte $00 ; |        | $1E60
       .byte $02 ; |      X | $1E61
       .byte $9F ; |X  XXXXX| $1E62
       .byte $B2 ; |X XX  X | $1E63
       .byte $E4 ; |XXX  X  | $1E64
       .byte $48 ; | X  X   | $1E65
       .byte $10 ; |   X    | $1E66
       .byte $24 ; |  X  X  | $1E67

;-----------------------------------------------------------------------

       .byte $00 ; |        | $1E68 	ENEMY 4
       .byte $9F ; |X  XXXXX| $1E69
       .byte $8F ; |X   XXXX| $1E6A
       .byte $87 ; |X    XXX| $1E6B
       .byte $88 ; |X   X   | $1E6C
       .byte $90 ; |X  X    | $1E6D
       .byte $64 ; | XX  X  | $1E6E
       .byte $00 ; |        | $1E6F

       .byte $00 ; |        | $1E70
       .byte $4F ; | X  XXXX| $1E71
       .byte $98 ; |X  XX   | $1E72
       .byte $8C ; |X   XX  | $1E73
       .byte $87 ; |X    XXX| $1E74
       .byte $88 ; |X   X   | $1E75
       .byte $70 ; | XXX    | $1E76
       .byte $04 ; |     X  | $1E77

       .byte $00 ; |        | $1E78
       .byte $27 ; |  X  XXX| $1E79
       .byte $4C ; | X  XX  | $1E7A
       .byte $98 ; |X  XX   | $1E7B
       .byte $8C ; |X   XX  | $1E7C
       .byte $87 ; |X    XXX| $1E7D
       .byte $48 ; | X  X   | $1E7E
       .byte $32 ; |  XX  X | $1E7F

;-----------------------------------------------------------------------

       .byte $00 ; |        | $1E80 	ENEMY 5
       .byte $04 ; |     X  | $1E81
       .byte $44 ; | X   X  | $1E82
       .byte $24 ; |  X  X  | $1E83
       .byte $23 ; |  X   XX| $1E84
       .byte $23 ; |  X   XX| $1E85
       .byte $14 ; |   X X  | $1E86
       .byte $08 ; |    X   | $1E87

       .byte $00 ; |        | $1E88
       .byte $20 ; |  X     | $1E89
       .byte $24 ; |  X  X  | $1E8A
       .byte $28 ; |  X X   | $1E8B
       .byte $24 ; |  X  X  | $1E8C
       .byte $23 ; |  X   XX| $1E8D
       .byte $27 ; |  X  XXX| $1E8E
       .byte $18 ; |   XX   | $1E8F

       .byte $00 ; |        | $1E90
       .byte $10 ; |   X    | $1E91
       .byte $20 ; |  X     | $1E92
       .byte $48 ; | X  X   | $1E93
       .byte $44 ; | X   X  | $1E94
       .byte $42 ; | X    X | $1E95
       .byte $47 ; | X   XXX| $1E96
       .byte $3F ; |  XXXXXX| $1E97

;-----------------------------------------------------------------------

       .byte $00 ; |        | $1E98 	ENEMY 6
       .byte $00 ; |        | $1E99
       .byte $00 ; |        | $1E9A
       .byte $00 ; |        | $1E9B
       .byte $01 ; |       X| $1E9C
       .byte $01 ; |       X| $1E9D
       .byte $00 ; |        | $1E9E
       .byte $00 ; |        | $1E9F

       .byte $00 ; |        | $1EA0
       .byte $00 ; |        | $1EA1
       .byte $00 ; |        | $1EA2
       .byte $03 ; |      XX| $1EA3
       .byte $05 ; |     X X| $1EA4
       .byte $03 ; |      XX| $1EA5
       .byte $00 ; |        | $1EA6
       .byte $00 ; |        | $1EA7

       .byte $00 ; |        | $1EA8
       .byte $00 ; |        | $1EA9
       .byte $06 ; |     XX | $1EAA
       .byte $09 ; |    X  X| $1EAB
       .byte $09 ; |    X  X| $1EAC
       .byte $09 ; |    X  X| $1EAD
       .byte $06 ; |     XX | $1EAE
       .byte $00 ; |        | $1EAF

;-----------------------------------------------------------------------

       .byte $00 ; |        | $1EB0
       .byte $20 ; |  X     | $1EB1
       .byte $04 ; |     X  | $1EB2
       .byte $11 ; |   X   X| $1EB3
       .byte $80 ; |X       | $1EB4
       .byte $14 ; |   X X  | $1EB5
       .byte $42 ; | X    X | $1EB6
       .byte $90 ; |X  X    | $1EB7

       .byte $00 ; |        | $1EB8
       .byte $40 ; | X      | $1EB9
       .byte $04 ; |     X  | $1EBA
       .byte $12 ; |   X  X | $1EBB
       .byte $A0 ; |X X     | $1EBC
       .byte $14 ; |   X X  | $1EBD
       .byte $40 ; | X      | $1EBE
       .byte $84 ; |X    X  | $1EBF

       .byte $00 ; |        | $1EC0
       .byte $00 ; |        | $1EC1
       .byte $20 ; |  X     | $1EC2
       .byte $14 ; |   X X  | $1EC3
       .byte $68 ; | XX X   | $1EC4
       .byte $08 ; |    X   | $1EC5
       .byte $14 ; |   X X  | $1EC6
       .byte $20 ; |  X     | $1EC7

;-----------------------------------------------------------------------

       .byte $00 ; |        | $1EC8	SMALL DEMON
       .byte $00 ; |        | $1EC9
       .byte $00 ; |        | $1ECA
       .byte $10 ; |   X    | $1ECB
       .byte $28 ; |  X X   | $1ECC
       .byte $6C ; | XX XX  | $1ECD
       .byte $C6 ; |XX   XX | $1ECE
       .byte $82 ; |X     X | $1ECF

       .byte $00 ; |        | $1ED0
       .byte $00 ; |        | $1ED1
       .byte $82 ; |X     X | $1ED2
       .byte $82 ; |X     X | $1ED3
       .byte $D6 ; |XX X XX | $1ED4
       .byte $6C ; | XX XX  | $1ED5
       .byte $00 ; |        | $1ED6
       .byte $00 ; |        | $1ED7

       .byte $00 ; |        | $1ED8
       .byte $00 ; |        | $1ED9
       .byte $44 ; | X   X  | $1EDA
       .byte $82 ; |X     X | $1EDB
       .byte $82 ; |X     X | $1EDC
       .byte $C6 ; |XX   XX | $1EDD
       .byte $7C ; | XXXXX  | $1EDE
       .byte $10 ; |   X    | $1EDF

;-----------------------------------------------------------------------

; ENEMY SHOT GRAPHICS TABLE


EnemyShotGraphicsTable: 

       .byte $80 ; |X       | $1EE0
       .byte $20 ; |  X     | $1EE1
       .byte $10 ; |   X    | $1EE2
       .byte $50 ; | X X    | $1EE3
       .byte $41 ; | X     X| $1EE4
       .byte $84 ; |X    X  | $1EE5
       .byte $88 ; |X   X   | $1EE6
       .byte $42 ; | X    X | $1EE7
       .byte $40 ; | X      | $1EE8
       .byte $08 ; |    X   | $1EE9
       .byte $04 ; |     X  | $1EEA
       .byte $01 ; |       X| $1EEB
       .byte $81 ; |X      X| $1EEC
       .byte $22 ; |  X   X | $1EED
       .byte $11 ; |   X   X| $1EEE
       .byte $44 ; | X   X  | $1EEF


;-----------------------------------------------------------------------

; motion table

; vertical motion table

VerticalMotionTable:

  IF NTSC
       .byte $40 ; | X      | $1EF0
       .byte $80 ; |X       | $1EF1
       .byte $C0 ; |XX      | $1EF2
       .byte $F0 ; |XXXX    | $1EF3
       .byte $F0 ; |XXXX    | $1EF4
       .byte $C0 ; |XX      | $1EF5
       .byte $80 ; |X       | $1EF6
       .byte $40 ; | X      | $1EF7
  ELSE
       .byte $60 ; | XX     | $1EF0
       .byte $A0 ; |X X     | $1EF1
       .byte $D0 ; |XX X    | $1EF2
       .byte $FF ; |XXXXXXXX| $1EF3
       .byte $FF ; |XXXXXXXX| $1EF4
       .byte $D0 ; |XX X    | $1EF5
       .byte $A0 ; |X X     | $1EF6
       .byte $60 ; | XX     | $1EF7
  ENDIF


; horizontal motion table

HorizontalMotionTable: 

  IF NTSC
       .byte $FF ; |XXXXXXXX| $1EF8    -1 ?
       .byte $C0 ; |XX      | $1EF9    -4
       .byte $A0 ; |X X     | $1EFA    -6
       .byte $80 ; |X       | $1EFB    -8
       .byte $80 ; |X       | $1EFC    -8
       .byte $A0 ; |X X     | $1EFD    -6 
       .byte $C0 ; |XX      | $1EFE    -4
       .byte $FF ; |XXXXXXXX| $1EFF    -1
  ELSE
       .byte $FF ; |XXXXXXXX| $1EF8
       .byte $F0 ; |XXXX    | $1EF9
       .byte $C0 ; |XX      | $1EFA
       .byte $A0 ; |X X     | $1EFB
       .byte $A0 ; |X X     | $1EFC
       .byte $C0 ; |XX      | $1EFD
       .byte $F0 ; |XXXX    | $1EFE
       .byte $FF ; |XXXXXXXX| $1EFF
  ENDIF


;-----------------------------------------------------------------------

; numbers

       .byte $7C ; | XXXXX  | $1F00
       .byte $64 ; | XX  X  | $1F01
       .byte $64 ; | XX  X  | $1F02
       .byte $64 ; | XX  X  | $1F03
       .byte $64 ; | XX  X  | $1F04
       .byte $64 ; | XX  X  | $1F05
       .byte $64 ; | XX  X  | $1F06
       .byte $64 ; | XX  X  | $1F07
       .byte $7C ; | XXXXX  | $1F08
       .byte $00 ; |        | $1F09

       .byte $18 ; |   XX   | $1F0A
       .byte $18 ; |   XX   | $1F0B
       .byte $18 ; |   XX   | $1F0C
       .byte $18 ; |   XX   | $1F0D
       .byte $18 ; |   XX   | $1F0E
       .byte $18 ; |   XX   | $1F0F
       .byte $18 ; |   XX   | $1F10
       .byte $18 ; |   XX   | $1F11
       .byte $38 ; |  XXX   | $1F12
       .byte $00 ; |        | $1F13

       .byte $7C ; | XXXXX  | $1F14
       .byte $4C ; | X  XX  | $1F15
       .byte $4C ; | X  XX  | $1F16
       .byte $40 ; | X      | $1F17
       .byte $3C ; |  XXXX  | $1F18
       .byte $0C ; |    XX  | $1F19
       .byte $4C ; | X  XX  | $1F1A
       .byte $4C ; | X  XX  | $1F1B
       .byte $7C ; | XXXXX  | $1F1C
       .byte $00 ; |        | $1F1D

       .byte $7C ; | XXXXX  | $1F1E
       .byte $4C ; | X  XX  | $1F1F
       .byte $4C ; | X  XX  | $1F20
       .byte $0C ; |    XX  | $1F21
       .byte $38 ; |  XXX   | $1F22
       .byte $0C ; |    XX  | $1F23
       .byte $4C ; | X  XX  | $1F24
       .byte $4C ; | X  XX  | $1F25
       .byte $7C ; | XXXXX  | $1F26
       .byte $00 ; |        | $1F27

       .byte $0C ; |    XX  | $1F28
       .byte $0C ; |    XX  | $1F29
       .byte $7E ; | XXXXXX | $1F2A
       .byte $4C ; | X  XX  | $1F2B
       .byte $4C ; | X  XX  | $1F2C
       .byte $4C ; | X  XX  | $1F2D
       .byte $4C ; | X  XX  | $1F2E
       .byte $4C ; | X  XX  | $1F2F
       .byte $4C ; | X  XX  | $1F30
       .byte $00 ; |        | $1F31

       .byte $7C ; | XXXXX  | $1F32
       .byte $4C ; | X  XX  | $1F33
       .byte $4C ; | X  XX  | $1F34
       .byte $0C ; |    XX  | $1F35
       .byte $0C ; |    XX  | $1F36
       .byte $7C ; | XXXXX  | $1F37
       .byte $40 ; | X      | $1F38
       .byte $4C ; | X  XX  | $1F39
       .byte $7C ; | XXXXX  | $1F3A
       .byte $00 ; |        | $1F3B

       .byte $7C ; | XXXXX  | $1F3C
       .byte $4C ; | X  XX  | $1F3D
       .byte $4C ; | X  XX  | $1F3E
       .byte $4C ; | X  XX  | $1F3F
       .byte $7C ; | XXXXX  | $1F40
       .byte $40 ; | X      | $1F41
       .byte $4C ; | X  XX  | $1F42
       .byte $4C ; | X  XX  | $1F43
       .byte $7C ; | XXXXX  | $1F44
       .byte $00 ; |        | $1F45

       .byte $30 ; |  XX    | $1F46
       .byte $30 ; |  XX    | $1F47
       .byte $30 ; |  XX    | $1F48
       .byte $18 ; |   XX   | $1F49
       .byte $18 ; |   XX   | $1F4A
       .byte $0C ; |    XX  | $1F4B
       .byte $4C ; | X  XX  | $1F4C
       .byte $4C ; | X  XX  | $1F4D
       .byte $7C ; | XXXXX  | $1F4E
       .byte $00 ; |        | $1F4F

       .byte $7C ; | XXXXX  | $1F50
       .byte $4C ; | X  XX  | $1F51
       .byte $4C ; | X  XX  | $1F52
       .byte $4C ; | X  XX  | $1F53
       .byte $7C ; | XXXXX  | $1F54
       .byte $64 ; | XX  X  | $1F55
       .byte $64 ; | XX  X  | $1F56
       .byte $64 ; | XX  X  | $1F57
       .byte $7C ; | XXXXX  | $1F58
       .byte $00 ; |        | $1F59

       .byte $7C ; | XXXXX  | $1F5A
       .byte $4C ; | X  XX  | $1F5B
       .byte $4C ; | X  XX  | $1F5C
       .byte $0C ; |    XX  | $1F5D
       .byte $7C ; | XXXXX  | $1F5E
       .byte $4C ; | X  XX  | $1F5F
       .byte $4C ; | X  XX  | $1F60
       .byte $4C ; | X  XX  | $1F61
       .byte $7C ; | XXXXX  | $1F62
       .byte $00 ; |        | $1F63

       .byte $00 ; |        | $1F64
       .byte $00 ; |        | $1F65
       .byte $00 ; |        | $1F66
       .byte $00 ; |        | $1F67
       .byte $00 ; |        | $1F68
       .byte $00 ; |        | $1F69
       .byte $00 ; |        | $1F6A
       .byte $00 ; |        | $1F6B
       .byte $00 ; |        | $1F6C
       .byte $00 ; |        | $1F6D

;-----------------------------------------------------------------------

; copyright

       .byte $3F ; |  XXXXXX| $1F6E
       .byte $40 ; | X      | $1F6F
       .byte $49 ; | X  X  X| $1F70
       .byte $89 ; |X   X  X| $1F71
       .byte $89 ; |X   X  X| $1F72
       .byte $89 ; |X   X  X| $1F73
       .byte $89 ; |X   X  X| $1F74
       .byte $48 ; | X  X   | $1F75
       .byte $40 ; | X      | $1F76
       .byte $3F ; |  XXXXXX| $1F77

       .byte $FF ; |XXXXXXXX| $1F78
       .byte $00 ; |        | $1F79
       .byte $54 ; | X X X  | $1F7A
       .byte $54 ; | X X X  | $1F7B
       .byte $57 ; | X X XXX| $1F7C
       .byte $54 ; | X X X  | $1F7D
       .byte $54 ; | X X X  | $1F7E
       .byte $A3 ; |X X   XX| $1F7F
       .byte $00 ; |        | $1F80
       .byte $FF ; |XXXXXXXX| $1F81

       .byte $FF ; |XXXXXXXX| $1F82
       .byte $00 ; |        | $1F83
       .byte $99 ; |X  XX  X| $1F84
       .byte $A5 ; |X X  X X| $1F85
       .byte $AD ; |X X XX X| $1F86
       .byte $A1 ; |X X    X| $1F87
       .byte $A5 ; |X X  X X| $1F88
       .byte $19 ; |   XX  X| $1F89
       .byte $00 ; |        | $1F8A
       .byte $FF ; |XXXXXXXX| $1F8B

       .byte $FC ; |XXXXXX  | $1F8C
       .byte $02 ; |      X | $1F8D
       .byte $32 ; |  XX  X | $1F8E
       .byte $49 ; | X  X  X| $1F8F
       .byte $41 ; | X     X| $1F90
       .byte $41 ; | X     X| $1F91
       .byte $49 ; | X  X  X| $1F92
       .byte $32 ; |  XX  X | $1F93
       .byte $02 ; |      X | $1F94
       .byte $FC ; |XXXXXX  | $1F95

;-----------------------------------------------------------------------

; audio tables 

L1F96: .byte $06 ; |     XX | $1F96    demon falling audio
       .byte $07 ; |     XXX| $1F97
       .byte $08 ; |    X   | $1F98
       .byte $07 ; |     XXX| $1F99
       .byte $06 ; |     XX | $1F9A
       .byte $07 ; |     XXX| $1F9B
       .byte $06 ; |     XX | $1F9C
       .byte $05 ; |     X X| $1F9D
       .byte $04 ; |     X  | $1F9E
       .byte $03 ; |      XX| $1F9F
       .byte $04 ; |     X  | $1FA0
       .byte $06 ; |     XX | $1FA1

L1FA2: .byte $01 ; |       X| $1FA2
       .byte $00 ; |        | $1FA3
       .byte $02 ; |      X | $1FA4
       .byte $00 ; |        | $1FA5
       .byte $03 ; |      XX| $1FA6
       .byte $00 ; |        | $1FA7
       .byte $04 ; |     X  | $1FA8
       .byte $00 ; |        | $1FA9
       .byte $05 ; |     X X| $1FAA
       .byte $00 ; |        | $1FAB
       .byte $06 ; |     XX | $1FAC
       .byte $00 ; |        | $1FAD

;-----------------------------------------------------------------------

;enemy colors as function of level
L1FAE:

  IF NTSC
       .byte $C8 ; |XX  X   | $1FAE
       .byte $C8 ; |XX  X   | $1FAF
       .byte $88 ; |X   X   | $1FB0
       .byte $48 ; | X  X   | $1FB1
       .byte $38 ; |  XXX   | $1FB2
       .byte $28 ; |  X X   | $1FB3
       .byte $76 ; | XXX XX | $1FB4
       .byte $78 ; | XXXX   | $1FB5

       .byte $0C ; |    XX  | $1FB6
       .byte $0C ; |    XX  | $1FB7
       .byte $8A ; |X   X X | $1FB8
       .byte $7A ; | XXXX X | $1FB9
       .byte $6A ; | XX X X | $1FBA
       .byte $5A ; | X XX X | $1FBB
       .byte $4A ; | X  X X | $1FBC
       .byte $3A ; |  XXX X | $1FBD

       .byte $48 ; | X  X   | $1FBE
       .byte $48 ; | X  X   | $1FBF
       .byte $48 ; | X  X   | $1FC0
       .byte $78 ; | XXXX   | $1FC1
       .byte $88 ; |X   X   | $1FC2
       .byte $98 ; |X  XX   | $1FC3
       .byte $A8 ; |X X X   | $1FC4
       .byte $B8 ; |X XXX   | $1FC5

       .byte $C6 ; |XX   XX | $1FC6
       .byte $C6 ; |XX   XX | $1FC7
       .byte $C6 ; |XX   XX | $1FC8
       .byte $C6 ; |XX   XX | $1FC9
       .byte $EE ; |XXX XXX | $1FCA
       .byte $EE ; |XXX XXX | $1FCB
       .byte $6C ; | XX XX  | $1FCC
       .byte $6C ; | XX XX  | $1FCD

       .byte $46 ; | X   XX | $1FCE
       .byte $46 ; | X   XX | $1FCF
       .byte $46 ; | X   XX | $1FD0
       .byte $46 ; | X   XX | $1FD1
       .byte $3E ; |  XXXXX | $1FD2
       .byte $3E ; |  XXXXX | $1FD3
       .byte $9C ; |X  XXX  | $1FD4
       .byte $9C ; |X  XXX  | $1FD5

       .byte $86 ; |X    XX | $1FD6
       .byte $86 ; |X    XX | $1FD7
       .byte $48 ; | X  X   | $1FD8
       .byte $48 ; | X  X   | $1FD9
       .byte $E4 ; |XXX  X  | $1FDA
       .byte $E4 ; |XXX  X  | $1FDB
       .byte $28 ; |  X X   | $1FDC
       .byte $28 ; |  X X   | $1FDD

       .byte $38 ; |  XXX   | $1FDE
       .byte $38 ; |  XXX   | $1FDF
       .byte $48 ; | X  X   | $1FE0
       .byte $48 ; | X  X   | $1FE1
       .byte $68 ; | XX X   | $1FE2
       .byte $68 ; | XX X   | $1FE3
       .byte $78 ; | XXXX   | $1FE4
       .byte $78 ; | XXXX   | $1FE5
  ELSE

       .byte $5C ; | X XXX  | $1FAE
       .byte $5C ; | X XXX  | $1FAF
       .byte $BC ; |X XXXX  | $1FB0
       .byte $6C ; | XX XX  | $1FB1
       .byte $4C ; | X  XX  | $1FB2
       .byte $4C ; | X  XX  | $1FB3
       .byte $B8 ; |X XXX   | $1FB4
       .byte $BC ; |X XXXX  | $1FB5

       .byte $0E ; |    XXX | $1FB6
       .byte $0E ; |    XXX | $1FB7
       .byte $BC ; |X XXXX  | $1FB8
       .byte $BC ; |X XXXX  | $1FB9
       .byte $AC ; |X X XX  | $1FBA
       .byte $8C ; |X   XX  | $1FBB
       .byte $6C ; | XX XX  | $1FBC
       .byte $4C ; | X  XX  | $1FBD

       .byte $4A ; | X  X X | $1FBE
       .byte $4A ; | X  X X | $1FBF
       .byte $4A ; | X  X X | $1FC0
       .byte $BC ; |X XXXX  | $1FC1
       .byte $BC ; |X XXXX  | $1FC2
       .byte $DC ; |XX XXX  | $1FC3
       .byte $9A ; |X  XX X | $1FC4
       .byte $7A ; | XXXX X | $1FC5

       .byte $58 ; | X XX   | $1FC6
       .byte $58 ; | X XX   | $1FC7
       .byte $5A ; | X XX X | $1FC8
       .byte $5A ; | X XX X | $1FC9
       .byte $3E ; |  XXXXX | $1FCA
       .byte $3E ; |  XXXXX | $1FCB
       .byte $AE ; |X X XXX | $1FCC
       .byte $AE ; |X X XXX | $1FCD

       .byte $4A ; | X  X X | $1FCE
       .byte $4A ; | X  X X | $1FCF
       .byte $4A ; | X  X X | $1FD0
       .byte $48 ; | X  X   | $1FD1
       .byte $BE ; |X XXXXX | $1FD2
       .byte $BE ; |X XXXXX | $1FD3
       .byte $DE ; |XX XXXX | $1FD4
       .byte $DE ; |XX XXXX | $1FD5

       .byte $BA ; |X XXX X | $1FD6
       .byte $BA ; |X XXX X | $1FD7
       .byte $4A ; | X  X X | $1FD8
       .byte $4C ; | X  XX  | $1FD9
       .byte $28 ; |  X X   | $1FDA
       .byte $28 ; |  X X   | $1FDB
       .byte $4C ; | X  XX  | $1FDC
       .byte $4A ; | X  X X | $1FDD

       .byte $4C ; | X  XX  | $1FDE
       .byte $4A ; | X  X X | $1FDF
       .byte $4C ; | X  XX  | $1FE0
       .byte $4A ; | X  X X | $1FE1
       .byte $AC ; |X X XX  | $1FE2
       .byte $AA ; |X X X X | $1FE3
       .byte $BC ; |X XXXX  | $1FE4
       .byte $BA ; |X XXX X | $1FE5

  ENDIF






;-----------------------------------------------------------------------

; score table 

ScoreTable

       .byte $10 ; |   X    | $1FE6
       .byte $15 ; |   X X X| $1FE7
       .byte $20 ; |  X     | $1FE8
       .byte $25 ; |  X  X X| $1FE9
       .byte $30 ; |  XX    | $1FEA
       .byte $35 ; |  XX X X| $1FEB

;-----------------------------------------------------------------------

ExtraLifeSound:

       .byte $15 ; |   X X X| $1FEC
       .byte $00 ; |        | $1FED
       .byte $00 ; |        | $1FEE
       .byte $1A ; |   XX X | $1FEF
       .byte $00 ; |        | $1FF0
       .byte $00 ; |        | $1FF1
       .byte $00 ; |        | $1FF2
       .byte $1C ; |   XXX  | $1FF3
       .byte $17 ; |   X XXX| $1FF4
       .byte $1A ; |   XX X | $1FF5
       .byte $15 ; |   X X X| $1FF6
       .byte $17 ; |   X XXX| $1FF7
       .byte $13 ; |   X  XX| $1FF8
       .byte $15 ; |   X X X| $1FF9
       .byte $11 ; |   X   X| $1FFA
       .byte $00 ; |        | $1FFB

       .word START,START
