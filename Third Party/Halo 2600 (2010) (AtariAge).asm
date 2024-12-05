; Retro-Halo by Eddy Fries - edf@halcyon.com 
	processor 6502
	include vcs.h
	org $F000

; Compile switches
NTSC            = 0
PAL             = 1
PAL60           = 2

COMPILE_VERSION = PAL      ; Compile PAL colors 50Hz
;COMPILE_VERSION = PAL60    ; Compile PAL colors 60Hz
;COMPILE_VERSION = NTSC     ; Compile NTSC colors 60Hz

FALSE           = 0
TRUE            = 1

BOSSROOMFIX = TRUE          ; Force 262/312 scanlines
;BOSSROOMFIX = FALSE         ; Keep  259/309 scanlines

;STARTATBOSS = TRUE          ; Testmode for boss battle
STARTATBOSS = FALSE         ; Regular deploy


ButtonPressed = $80		; these are only used during title screen
StackSave = $81			
PF2Left = $82
PF2Right = $84
StarLast = $85
NoteIndex = $87
StarLimit = $88

YP0 = $80
PF0RightAndCorners = $81
M1Nusiz = $82
ScanLine = $83
YP0Adjusted = $83    ; overlap with ScanLine
EliteColor = $84
EliteColor2 = $85
r_seed = $86
Facing = $87
XM0 = $88
XP0 = $89
Alive = $8A
M0Pos = $8B
M1Pos = $8C
Clock = $8D
EliteData = $8E
EliteData2 = $8F
WhichElite = $90
Level = $91
P0Data = $92
P0Data2 = $93
ElitePos = $94
YBoss = $94	; must share with ElitePos
ElitePos2 = $95
ElitePos3 = $96
SoundClock = $97
SoundClock2 = $98
OldLevel = $99
Lives = $9a

XM1 = $9B
XM12 = $9C
XM13 = $9D
DeltaX = $9E
DeltaX2 = $9F
DeltaX3 = $A0

WhichMissile = $A1
LastLevel = $A2

P1DataL = $A3
P1Data2L = $A4
P1Data3L = $A5
PF0Left = $A6
PF0Right = $A7	; must follow PF0Left
PF0Top = $A8
PF0Bottom = $A9
Temp2 = $AA
M1PosAdjusted = $AA ; overlap with Temp2
PF0LeftAndCorners = $AB
P1State = $AC
P1State2 = $AD
P1State3 = $AE
P1ColorL = $AF
P1Color2L = $B0
P1Color3L = $B1
WhichSound = $B2
WhichSound2 = $B3
SwchaSave = $B4
P1Facing = $B5
P1Facing2 = $B6
P1Facing3 = $B7
SpriteLineMax = $B8
SpriteLine = $B9
SpriteLine2 = $BA
SpriteLineMin = $BB
P1Type = $BC
P1Type2 = $BD
P1Type3 = $BE
XP1 = $BF
XP12 = $C0
XP13 = $C1
Temp = $C2
M0PosAdjusted = $C2 ; overlap with Temp
P1Frame2L = $C3
P1Frame2L2 = $C4
P1Frame2L3 = $C5
YM1 = $C6
YM12 = $C7
YM13 = $C8
M1Flags = $C9
M1Flags2 = $CA
M1Flags3 = $CB
XP0Old = $CC
YP0Old = $CD
U9 = $CE
Flags = $CF
MasterChiefColor = $D0
MasterChiefColorH = $D1
Row = $D2
XP1Adjusted = $D3
XP1Adj2 = $D4
XP1Adj3 = $D5
P1Flags = $D6
P1Flags2 = $D7
P1Flags3 = $D8
M0Facing = $D9
FNoIce = $DA
PlayerDying = $DB
P1Nusiz = $DC
P1Nusiz2 = $DD
P1Nusiz3 = $DE
MapTop = $DF
BossFacing = $E0
Adjustment = $E1
DeltaXH = $E2
DeltaXH2 = $E3
DeltaXH3 = $E4
DeltaYH = $E5
DeltaYH2 = $E6
DeltaYH3 = $E7
BkColor = $E8

DeltaY = $E9
DeltaY2 = $EA
DeltaY3 = $EB
XCur = $EC
XCur2 = $ED
XCur3 = $EE
YCur = $EF
YCur2 = $F0
YCur3 = $F1
Legendary = $F2

; constants

BossLevel = 63

    IF STARTATBOSS = TRUE
FirstRoom = 62
StartFlags = GunFlag | ShieldFlag | SawShieldFlag | Key3Flag | BigGunFlag | ShoesFlag
    ELSE
FirstRoom = 8
StartFlags = 0      ;ShieldFlag
    ENDIF

    IF COMPILE_VERSION > NTSC

;;;;;;;;;; PAL Colors ;;;;;;;;;;
Green = $54
LtGreen = $56
LtrGreen = $58
LtstGreen = $5a
Black  = $00
LtBlue = $Bf
DkBlue = $B4
Orange = $4C
DkOrange = $48
Yellow = $2C
Red = $64
Silver = $0a
DkGray = $02
DkGold = $22
Gold = $28
BossBkColor = $06
Turquoise = $92
EarthGreen = $56
Pink = $82

    ELSE

;;;;;;;;;; NTSC Colors ;;;;;;;;;;
Green = $c4
LtGreen = $c6
LtrGreen = $c8
LtstGreen = $ca
Black  = $00
LtBlue = $9f
DkBlue = $94
Orange = $2C
DkOrange = $28
Yellow = $1e
Red = $44
Silver = $0a
DkGray = $02
Gold = $F8
DkGold = $F2
BossBkColor = $06
Turquoise = $A2
EarthGreen = $D6
Pink = $52

    ENDIF

XLeftEdge = 1
XRightEdge = 152
XP1Adjustment = 35
LeftP1Limit = XP1Adjustment
RightP1Limit = $74
MapWidth = 8
MaxScans = 96
MinScans = 8
SpriteHeight = 12

; Inventory flags
ShoesFlag =  	%00000001
Key3Flag =    	%00000010
KeyFlag =     	%00000100
GunFlag =     	%00001000
BigGunFlag =  	%00010000		; must be this bit
Key2Flag =    	%00100000
SawShieldFlag = %01000000
ShieldFlag =  	%10000000

; Enemy Option Flags
BigBulletFlag =  %00010000	; must be this bit (lines up with Nusiz values)
FastBulletFlag = %00000010	; must be this bit!
SeekBulletFlag = %00000100
TurretFlag =     %00000001


M1RightFlag = %00000001
M1UpFlag = %00010000

 MAC SLEEP
    IF {1} = 1
      ECHO "ERROR: SLEEP 1 not allowed !"
      END
    ENDIF
    IF {1} & 1
      bit $00
      REPEAT ({1}-3)/2
        nop
      REPEND
    ELSE
      REPEAT ({1})/2
        nop
      REPEND
    ENDIF
  ENDM

 MAC ROOM
	.byte (({1}-{7})<<4) | ({2}-{7})
	.byte ((({4}<<3)|({5}<<2)|{6})<<4) | ({3}-{7})
 ENDM

; put data accessed by kernel up front so we know where the page boundaries are

; enemy data must all fit in one page
Elite1
	.byte #%11100111
	.byte #%01100011
	.byte #%00100001
	.byte #%00110110
	.byte #%10011101
	.byte #%11011111
	.byte #%01111110
	.byte #%00001110
	.byte #%11111100
	.byte #%11110000
	.byte #%11111100
	.byte #%00111110
Elite2
        .byte #%01111110;$02
        .byte #%00110110;$02
        .byte #%00010010;$02
        .byte #%00010110;$02
        .byte #%10011101;$02
        .byte #%11011111;$14
        .byte #%01111110;$02
        .byte #%00001110;$02
        .byte #%11111100;$02
        .byte #%11110000;$16
        .byte #%11111100;$16
	.byte #%00111110

Grunt1
        .byte #%11001100;--
        .byte #%01001000;--
        .byte #%10110110;$02
        .byte #%10110110;$02
        .byte #%01111101;$2A
        .byte #%00111011;$28
        .byte #%01110111;$04
        .byte #%00101110;$04
        .byte #%00001100;$02
        .byte #%00001000;$02
        .byte #%00000000;$C4
        .byte #%00000000;$C6
Grunt2
        .byte #%01111000;--
        .byte #%00110000;--
        .byte #%10110110;$02
        .byte #%10110110;$02
        .byte #%01111101;$2A
        .byte #%00111011;$28
        .byte #%01110111;$04
        .byte #%00101110;$04
        .byte #%00001100;$02
        .byte #%00001000;$02
        .byte #%00000000;$C4
        .byte #%00000000;$C6
Brute1
        .byte #%11100111;$02
        .byte #%01100110;$F2
        .byte #%11000110;$A2
        .byte #%11101100;$A2
        .byte #%01111100;$F4
        .byte #%00111101;$F4
        .byte #%11111011;$F2
        .byte #%01111011;$F2
        .byte #%00111110;$A2
        .byte #%01111100;$F4
        .byte #%01111000;$F2
        .byte #%01110000;$A2

Brute2
        .byte #%01111110;--
        .byte #%00111100;--
        .byte #%01101100;--
        .byte #%01101100;--
        .byte #%01111100;$F4
        .byte #%00111101;$F4
        .byte #%11111011;$F2
        .byte #%01111011;$F2
        .byte #%00111110;$A2
        .byte #%01111100;$F4
        .byte #%01111000;$F2
        .byte #%01110000;$A2

Tree1
        .byte #%00111000;$F2
        .byte #%00111000;$F0
        .byte #%11111110;$D6
        .byte #%01111100;$D0
        .byte #%11111110;$D4
        .byte #%11111110;$D6
        .byte #%01111100;$D4
        .byte #%00111000;$D0
        .byte #%01111100;$D4
        .byte #%00111000;$D2
        .byte #%00111000;$C4
        .byte #%00010000;$C6
Shield1
        .byte #%00000000;$1E
        .byte #%00000000;$1E
        .byte #%00111000;$1E
        .byte #%01001100;$1E
        .byte #%11110110;$1E
        .byte #%11101110;$1E
        .byte #%11011110;$1E
        .byte #%11100110;$1E
        .byte #%11111110;$1E	; shield and rock overlap by 3
Rock1
        .byte #%00000000;$F2
        .byte #%00000000;$F0
        .byte #%00000000;$02
        .byte #%11110111;$02
        .byte #%11110111;$06
        .byte #%11110111;$08
        .byte #%11111000;$08
        .byte #%11111110;$06
        .byte #%01111100;$04
        .byte #%00111000;$02
        .byte #%00000000;$C4
        .byte #%00000000;$C6
; key and gun overlap 6 bytes
Key1
        .byte #%11100101;$1E
        .byte #%10111111;$1E
        .byte #%11100000;$1E
        .byte #%00000000;$1E
        .byte #%00000000;$1E
        .byte #%00000000;$1E

Gun1
        .byte #%00000000;$00
        .byte #%00000000;$00
        .byte #%00000000;$00
        .byte #%00000000;$00
        .byte #%00000000;$00
        .byte #%00000000;$00
        .byte #%11100000;$00
        .byte #%11110000;$00
        .byte #%11101000;$00
        .byte #%01111111;$00
        .byte #%01111111;$00
	.byte #%11111111;$00
Star1
        .byte #%00000000;$00
        .byte #%00000000;$00
        .byte #%00000000;$00
        .byte #%11111111;$00
        .byte #%01111110;$C2
        .byte #%00111100;$C2
        .byte #%01111110;$00
        .byte #%00111100;$C2
        .byte #%01111110;$00
        .byte #%00011000;$C2
Shoe1				; shoes and turret overlap
        .byte #%00000000;$00
        .byte #%00000000;$00
        .byte #%00000000;--
        .byte #%00001111;$00
        .byte #%00001110;$00
	.byte #%11111110
	.byte #%11101110
	.byte #%11100000
        .byte #%11100000;--
        .byte #%00000000;--
        .byte #%00000000;--
        .byte #%00000000;--

Thing1
        .byte #%01111110;$52
        .byte #%00111100;$52
        .byte #%00011000;$52
        .byte #%00111100;$42
        .byte #%01111110;$56
        .byte #%00111100;$42
        .byte #%00011000;$52
        .byte #%00111100;$54
        .byte #%01111110;$42
        .byte #%00111100;$56
        .byte #%00011000;$52
        .byte #%00000000;$52
Thing2
        .byte #%01111110;$52
        .byte #%00111100;$52
        .byte #%00011000;$52
        .byte #%10111101;$42
        .byte #%01111110;$56
        .byte #%00111100;$42
        .byte #%00011000;$52
        .byte #%10111101;$54
        .byte #%01111110;$42
        .byte #%00111100;$56
        .byte #%00011000;$52
        .byte #%00000000;$52

MasterChief1
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%00111100
	.byte #%00111000
	.byte #%01011011
	.byte #%01111110
	.byte #%00111100
	.byte #%00011110
	.byte #%00010000
	.byte #%00111000
	.byte #%00111110

MasterChief2
        .byte #%00111110;$02
        .byte #%00111100;$02
        .byte #%00111100;$02
        .byte #%00111100;$02
        .byte #%00111000;$02
        .byte #%01011011;$14
        .byte #%01111110;$02
        .byte #%00111100;$02
        .byte #%00011110;$02
        .byte #%00010000;$16
        .byte #%00111000;$16
        .byte #%00111110;$16


; Dead Elite and MasterChiefHelmet overlap
DeadElite
	.byte 0
	.byte 0
	.byte 0
MasterChief1Helmet
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
HelmOn
	.byte 0
	.byte 0
	.byte 2
	.byte 2
	.byte 0

DyingElite
;***************
; Sound handling routines
; this code lives here because it is also the death sprite images!


ShotSound = 0
PickupSound = 1
DeathSound = 2
GameOverSound = 3
ShieldSound = 4

UpdateSounds
	LDX #1
USLoop
	LDY WhichSound,X
	LDA SoundClock,X
	CMP ClockStop,Y
	BEQ DoneSound

	STA AUDF0,X
	
	EOR #%11111111
	AND #%00011111
	LSR
	STA AUDV0,X
	
	LDA SoundClock,X
	CLC
	ADC SoundDelta,Y
	STA SoundClock,X
USContinue
	DEX
	BPL USLoop
	RTS

DoneSound
	LDA #0
	STA AUDC0,X
	STA AUDF0,X
	BEQ USContinue		; bra

NusizTab
	.byte %00
	.byte %00
	.byte %01

StateType
	.byte #Standing | 7
	.byte #Shooting | 2
	.byte #MovingToward | 7
	.byte #MovingToward | 7
RoomForMoreBytesHere

	org $F100

ShieldOn = 4
MasterChief2Color
	.byte Green+ShieldOn
	.byte Black+ShieldOn
	.byte Green+ShieldOn
	.byte Black+ShieldOn
	.byte Green+ShieldOn
	.byte Black+ShieldOn
	.byte Green+ShieldOn
	.byte Black+ShieldOn
	.byte Green+ShieldOn
Shoe1Color
	.byte Green+ShieldOn
	.byte Green+ShieldOn
	.byte Green+ShieldOn

MasterChief1Color
	.byte Green
	.byte Black
	.byte Green
	.byte Black
	.byte Green
	.byte Black
	.byte Green
	.byte Black
	.byte Green
	.byte Green
	.byte Green
	.byte Green


MasterColorTable
	.byte <MasterChief1Color
	.byte <MasterChief2Color

GunColor	; black... 
	.byte 0
	.byte 0
	.byte 0
	.byte 0
Key3Color
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0

YellowEliteColor
	.byte Black
	.byte Yellow
	.byte Yellow
	.byte Yellow
	.byte Black
	.byte Yellow
	.byte Yellow
	.byte Black
	.byte Yellow
	.byte Black
	.byte Yellow
	.byte Yellow
RedEliteColor
	.byte Black
	.byte Red
	.byte Red
	.byte Red
	.byte Black
	.byte Red
	.byte Red
	.byte Black
	.byte Red
	.byte Black
	.byte Red
	.byte Red
SilverEliteColor
	.byte Black
	.byte Silver
	.byte Silver
	.byte Silver
	.byte Black
	.byte Silver
	.byte Silver
	.byte Black
	.byte Silver
	.byte Black
	.byte Silver
	.byte Silver
InvisEliteColor
	.byte Black
	.byte BossBkColor
	.byte BossBkColor
	.byte BossBkColor
	.byte Black
	.byte BossBkColor
	.byte BossBkColor
	.byte Black
	.byte BossBkColor
	.byte Black
	.byte BossBkColor
	.byte BossBkColor

SilverGruntColor
        .byte DkGray+2
        .byte DkGray
        .byte DkGray
        .byte DkGray
        .byte DkOrange+2
        .byte DkOrange
        .byte DkGray+2
        .byte DkGray+2
        .byte DkGray
        .byte DkGray
        .byte DkGray+2
        .byte BossBkColor

RedGruntColor       ; bug this color map is wrong
        .byte DkGray+2
        .byte DkGray
        .byte DkGray
        .byte DkGray
        .byte Red
        .byte Red-2
        .byte DkGray+2
        .byte DkGray+2
        .byte DkGray
        .byte DkGray
        .byte DkGray+2
        .byte BossBkColor

SilverBruteColor
        .byte DkGray
        .byte DkGold
        .byte Turquoise
        .byte Turquoise
        .byte DkGold+2
        .byte DkGold+2
        .byte DkGold
        .byte DkGold
        .byte Turquoise
        .byte DkGold+2
        .byte DkGold
        .byte Turquoise

TreeColor
        .byte DkGold
        .byte Gold-8
        .byte EarthGreen
        .byte EarthGreen-6
        .byte EarthGreen-2
        .byte EarthGreen
        .byte EarthGreen-2
        .byte EarthGreen-6
        .byte EarthGreen-2
        .byte EarthGreen-4
        .byte Green
        .byte LtGreen

ShieldColor
KeyColor
        .byte Yellow
        .byte Yellow
        .byte Yellow
        .byte Yellow
        .byte Yellow
        .byte Yellow
        .byte Yellow
        .byte Yellow
        .byte Yellow
        .byte Yellow
        .byte Yellow
        .byte Yellow

StarColor
        .byte #$00;
        .byte #$00;
        .byte #$00;
        .byte Green-2
        .byte Green-2
        .byte #$00;
        .byte Green-2
        .byte #$00;
        .byte Green-2
        .byte #$00;
        .byte #$00;
        .byte #$00;

RockColor
        .byte DkGold
        .byte Gold-8
        .byte DkGray
        .byte DkGray
        .byte BossBkColor
        .byte Silver-2
        .byte Silver-2
        .byte BossBkColor
        .byte DkGray+2
        .byte DkGray
        .byte Green
        .byte LtGreen

SniperColor
Key2Color
        .byte Red
        .byte Red
        .byte Red
        .byte Red
        .byte Red
        .byte Red
        .byte Red
        .byte Red
        .byte Red
        .byte Red
        .byte Red
        .byte Red

ThingColor
        .byte Pink
        .byte Pink
        .byte Pink
        .byte Red-2
        .byte Pink+4
        .byte Red-2
        .byte Pink
        .byte Pink+2
        .byte Red-2
        .byte Pink+4
        .byte Pink
        .byte Pink

BossColor
        .byte Gold+6
        .byte Silver-2
        .byte DkGray+2
        .byte DkGray
        .byte Silver+4
        .byte Silver+2
        .byte Silver-2
        .byte BossBkColor

        .byte DkGray
        .byte DkOrange-8
        .byte DkOrange-8
        .byte DkOrange-8
        .byte DkOrange-8
        .byte DkOrange-8
        .byte Gold-8
        .byte Gold-8

        .byte Gold-8
        .byte Gold-8
        .byte Gold-8
        .byte Gold
        .byte Gold+2
        .byte Gold+6
        .byte Gold+6
        .byte Gold+6

MainKernel
WaitForVblankEnd
	LDA INTIM	
	BNE WaitForVblankEnd
	
	LDA #MaxScans
	STA ScanLine

	LDY #0
	STY WSYNC
	STY HMOVE

	LDX #ENAM1
	TXS

	LDA PF0Top
	STA PF1
	STA PF2
	ORA PF0LeftAndCorners
	TAX
	STY HMCLR
	STY WSYNC
	STY VBLANK
	STX PF0
;*****************************KERNEL*********************************
TopWallLoop
	DEC $2D		; SLEEP 10
	DEC $2D
	LDA PF0Top
	ORA PF0RightAndCorners
	STA PF0
	LDA ScanLine
	SEC
	SBC YP0
	ADC #SpriteHeight
	BCC NoPlayerTop
	TAY
	LDA (P0Data),Y
	STA WSYNC 
;----------------------------------------------------------------------------
	STA GRP0			;3
	LDA (MasterChiefColor),Y	;5
	STA COLUP0			;3
	STX PF0				;3
	LDA MasterChief1Helmet,Y	;4
	STA ENABL			;3 (21)
PlayerTop
	LDA ScanLine	; 3
	CMP M1Pos	; 3
	PHP		; 3
	CMP M0Pos	; 3
	PHP		; 3
	PLA		; 4
	PLA		; 4

	DEC ScanLine
	LDA PF0Top
	ORA PF0RightAndCorners
	STA PF0
	LDA ScanLine			;3
	STA WSYNC
	STX PF0				;3
	CMP #MaxScans-#8		;2
	BNE TopWallLoop			;2
TopWallExit
	LDX PF0Left
	STX PF0
	LDX #0
	STX PF1
	STX PF2
	SEC			; needed for kernel entry
	JMP KernelEntry2

NoPlayerTop
	STA WSYNC
	LDA #0
	STA GRP0
	STX PF0
	BEQ PlayerTop		; BRA

;main scanline loop...

ScanLoop 
; setup P0

; see if ScanLine is betwen YP0 and YP0+12
	LDA ScanLine
	SEC
	SBC YP0
	ADC #SpriteHeight
	BCC NoPlayer

; if so wait until new line then draw sprite0 with the correct color
	TAY
	LDA (P0Data),Y
	LDX PF0Left
	STA WSYNC 
;----------------------------------------------------------------------------
	STX PF0				;3
	STA GRP0			;3
	LDA (MasterChiefColor),Y	;5
	STA COLUP0			;3
	LDA MasterChief1Helmet,Y	;4
	STA ENABL			;3 (21)
Player
	LDY WhichElite		; 3
	LDA P1Nusiz,Y		; 4
	ORA M1Nusiz		; 2
	STA NUSIZ1		; 3 (12)

; draw player missle 0
	LDA ScanLine	; 3
	LDX #ENAM1	; 2
	TXS		; 2
	CMP M1Pos	; 3
	PHP		; 3
	CMP M0Pos	; 3
	PHP		; 3 (19)

	LDX PF0Right	; 3
	STX PF0		; 3 (6)

; draw elite if ScanLine is between ElitePos and ElitePos+SpriteHeight
; A = ScanLine
	LDY WhichElite		; 3
	SEC			; 2
	SBC ElitePos,Y		; 4
	ADC #SpriteHeight	; 2
	BCC NoElite		; 2

; wait for sync then draw elite appropriate color
	STA WSYNC		; 3 (16) (74)
;--------------------------------------------------------------------
	LDX PF0Left		; 3
	STX PF0
	TAY
	LDA (EliteData),Y
	STA GRP1
	LDA (EliteColor),Y
	STA COLUP1
Elite
PlayerReentry

; need to do this eventually so do it here to kill time
	DEC ScanLine
	LDA PF0Right
	STA PF0

	LDA #MinScans
	CMP ScanLine
	BNE ScanLoop
DrawBottom
	LDA PF0Bottom
	ORA PF0LeftAndCorners
	TAX
	LDA ScanLine
	; SEC  ; carry is set from compare above
	JMP DrawBottomEntry

NoPlayer
	LDX PF0Left
	STA WSYNC
	STX PF0
	LDA #0		
	STA GRP0
	; might want to burn a few more cycles here to sync up with the player case
	BEQ Player	; BRA

NoPlayer2
	LDA #0	
	STA WSYNC
;----------------------------------------------------------------------------	
	STA GRP0
	LDA PF0Left
	STA PF0
	JMP Player2

NoElite
	STA WSYNC	; (76)
;-------------------------------------------------------------------
	LDA #0
	STA GRP1
	LDA PF0Left
	STA PF0
; Y = WhichElite
	LDA ScanLine
	CMP SpriteLine,Y
	BNE Elite

; Fall through into the second part of the kernel.
; if we are here we need to move sprite 1 to a new horizontal position but first we have to draw sprite 0 and the missiles.
; We can take advantage of 2 facts we will force to be true. We don't have to redraw the playfield because we won't do this on a line where ScanLine&0x07==0 and
; we don't have to draw sprite 1 because we won't have one on these scan lines.

;	SEC		; set by compare above
	SBC #01
	STA ScanLine	; don't have to test for zero because we won't do this near the end

; Duplicate sprite 0 and missile drawing code
	INC WhichElite

KernelEntry2		; needs Carry Set and A=ScanLine
	LDX PF0Right
	STX PF0
	LDX #ENAM1
	TXS		; stack hack for missles


; see if ScanLine is betwen YP0 and YP0+12
;	SEC	; still set from above
	SBC YP0
	ADC #SpriteHeight
	BCC NoPlayer2
	TAY
	LDA (MasterChiefColor),Y
	TAX
	LDA MasterChief1Helmet,Y
	STA Temp
	LDA (P0Data),Y
	LDY Temp
	STA WSYNC 
;----------------------------------------------------------------------------
	STA GRP0	; 3
	STX COLUP0	; 3
	STY ENABL	; 3
	LDX PF0Left	; 3
	STX PF0		; 3 (15)
Player2
; draw player missle 0
; moved stack init above to save time on this line
;	LDX #ENAM1
;	TXS		; stack hack for missles
	LDY ScanLine	;3
	CPY M1Pos	;3
	PHP		;3 Z flag will set D1 bit (enable missle 1)
	CPY M0Pos	;3
	PHP		;3 (15) Z flag will set D1 bit (enable missle 0)

; finally we can work on moving sprite 1
	LDX WhichElite	;3
	LDA P1DataL,X	;4
	STA EliteData	;3
	LDA P1ColorL,X	;4
	STA EliteColor	;3
	LDA P1Facing,X	;4
	STA REFP1	;3 (24)

	LDA PF0Right	;3
	STA PF0		;3

	DEY		;2 moved up from below
	STY ScanLine	;3

	TYA		;2
	SEC		;2

	LDY PF0Left	;3

	STA WSYNC	;3 (21) (75)

;---------------------------------------------------------------------------
; The challenge in this block is we want to be able to position enemies near 
; the right edge of the screen but if we put them too close we run out of time 
; and don't get to the WSYNC before it's too late
	STY PF0
	SBC YP0
	ADC #SpriteHeight
	BCC ShiftAndNoDraw
	TAY
	
	LDA XP1Adjusted,X
Delay	SBC #$0F    ;2 
	BCS Delay   ;2 ->5 cycles per iteration
	AND #$0F
	TAX
	LDA HMPTable-1,X
	STA.a HMP1	; extra cycle to sync with branch above
	LDA PF0Right
	STA RESP1
	STA PF0
	LDX PF0Left
	STA WSYNC
;----------------------------------------------------------------------------
	LDA (P0Data),Y			;5
	STA GRP0			;3
	STX PF0				;3
	LDA (MasterChiefColor),Y	;5
	STA COLUP0			;3
	LDA MasterChief1Helmet,Y	;4
	STA ENABL			;3 (26)
PlayerReentry2
; draw player missle 0
	LDA ScanLine			;3
	LDX #ENAM1			;2
	TXS				;2
	CMP M1Pos			;3
	PHP				;3
	CMP M0Pos			;3
	PHP				;3 (19) (45)

	LDA PF0Right			;3
	STA PF0				;3 (6) (51)
	
	LDA #$80			;2	prevent other things from moving on early hmove
	STA HMP0			;3
	STA HMM0			;3
	STA HMM1			;3
	STA HMBL			;3 (14) (65)

	NOP				;2        kill 6 cycles
	PLA				;4 (6) (71)

	STA HMOVE			;3 (74)   early hmove to avoid black line
;	NOP				;2 (76)
;------------------------
	LDA PF0Left
	STA PF0
	PLA				; stalling
	PLA
	JMP PlayerReentry

ShiftAndNoDraw
	SEC
	LDA XP1Adjusted,X
Delay2	SBC #$0F    ;2 
	BCS Delay2   ;2 ->5 cycles per iteration
	AND #$0F
	TAX
	LDA HMPTable-1,X
	STA HMP1
	LDA PF0Right
	STA RESP1	;3
	STA PF0

	STA WSYNC
;----------------------------------------------------------------------------
	LDA #0			;2	
	STA GRP0		;3
	LDA PF0Left		;3
	STA PF0			;3 (11)

	PLA			;4	waste 12 cycles
	PLA			;4
	PLA			;4
	JMP PlayerReentry2	;3 (26)

BottomWallLoop
	SEC
DrawBottomEntry
	SBC YP0
	ADC #SpriteHeight
	BCC NoPlayerBottom
	TAY
	LDA (P0Data),Y
	STA WSYNC 
;----------------------------------------------------------------------------
	STA GRP0			;3
	LDA (MasterChiefColor),Y	;5
	STA COLUP0			;3
	LDA MasterChief1Helmet,Y	;4
	STA ENABL			;3 
	STX PF0
PlayerBottom
	DEC ScanLine
	LDA PF0Bottom
	STA PF1
	STA PF2
	ORA PF0RightAndCorners
	STA PF0
	STA WSYNC
	STX PF0

	TXA
	LDX #ENAM1
	TXS
	LDY ScanLine	; 3
	CPY M1Pos	; 3
	PHP		; 3
	CPY M0Pos
	PHP
	TAX
	
	LDA PF0Bottom
	ORA PF0RightAndCorners
	STA PF0
	LDA ScanLine
	BNE BottomWallLoop
	JMP DoneKernel

NoPlayerBottom
	STA WSYNC
	LDA #0
	STA GRP0
	STX PF0
	BEQ PlayerBottom	; BRA

M0SpeedData 
	.byte #$F0
	.byte #$10
	.byte #$E0
	.byte #$20
M0DirData
	.byte #$01
	.byte #$FF
	.byte #$02
	.byte #$FE

EdFLife
        .byte #%00111000;$C4
        .byte #%00111110;$C4
        .byte #%00100000;$C4
        .byte #%01110000;$C4
        .byte #%01111110;$C4

;        .byte #%00011000;$C2
;        .byte #%00100100;$C2
;        .byte #%00101100;$C2
;        .byte #%00101100;$C2
;        .byte #%00011000;$C2
EdFSprite
        .byte #%01111100;--
        .byte #%01010100;--
        .byte #%11111110;--
        .byte #%01000100;--
        .byte #%01100110;--

;***************************************************************
; Title Screen Kernel
;
TitleKernel
	LDA ScanLine
	AND #$0F
	BNE TitleSkipSpin
	INC Temp2
TitleSkipSpin

	LDX #25
	STX Temp

TitleWaitForVblankEnd
	lda INTIM	
	bne TitleWaitForVblankEnd	
	sta VBLANK
	LDY #192
	BNE TitleEntry		; BRA

TitleLoop
	DEX			; 2 (+11)
	BPL TitleSkip		; 2 
	DEC Temp		; 5 (20)
TitleEntry
	LDA Temp		; 3
	SEC			; 2
	SBC Temp2		; 3
	AND #$03		; 2
	TAX			; 2
	LDA TitleColorTable2,X	; 4
	STA COLUP1		; 3 (19) (39)
	LDA Temp		; 3
	LDX PF2Right		; 3
	STX PF2			; 3 (9) (48) want to do on cycle 48
	CLC			; 2
	ADC Temp2		; 3
	AND #$03		; 2
	TAX			; 2
	LDA TitleColorTable,X	; 4
	STA COLUP0		; 3 (19) (64)
	LDA #$F0		; 2
	STA HMP0		; 3
	LDA #$10		; 2
	STA HMP1		; 3 (10) (74)
;	STA WSYNC		; too much...
	NOP 			; 2 wsync (76)
	STA HMOVE		; 3
	LDX Temp		; 3 (6)
TitleNoMove
	DEY			; 2
	DEX			; 2
	TXS			; 2
	TYA			; 2
	LSR			; 2
	LSR			; 2
	LSR			; 2
	TAX			; 2
	LDA HaloTitle,X		; 4 (20) (26)
	STA PF2			; 3
	STA PF2Left		; 3
	LDA HaloTitle2,X	; 4
	STA PF2Right		; 3 (13) (39)
	LDX #0			; 2 
	STX.a HMP0		; 4 
	STA PF2			; 3 (9) (48)	must be 48!
	STX HMP1		; 3
	TSX			; 2
	DEX			; 2
	DEX			; 2 (9) (57)
	STY COLUPF		; 3
	LDA #0			; 2
	STA ENAM1		; 3
	LDA PF2Left		; 2
	STA WSYNC		; 3 (13) (70)
	STA HMOVE		;3
	STA PF2			;3
	DEY			;2
	BNE TitleLoop		;3 (11) must be 11!
	JMP TitleExitKernel
TitleSkip
;	SLEEP 26
	PLA	;4
	PLA
	PLA
	PLA
	PLA
	PLA
	NOP
; end sleep
	LDA PF2Right
	STA PF2
	LDA Temp
	CMP StarLast
	BEQ TitleOffStars
	STA StarLast
	LDA #2
	.byte $2C		; eat next 2 bytes
TitleOffStars
	LDA #0
TitleOnStars
	STA ENAM1
	STA WSYNC
	STA HMOVE		; 3
	JMP TitleNoMove		; 3 (6)

BossHmove
	.byte $10
	.byte $F0

BossSpeed
	.byte $00,$01,$03

YouWin
	LDA PlayerDying
	BNE YWSkip
	STA Lives	; A=0
	LDA #$FF
	STA PlayerDying
	LDA #2
	STA Legendary
YWSkip
	LDA Clock
	STA COLUPF
	CLC
	ADC #$88
	STA COLUBK
	EOR #$FF
	STA AUDF0
	CLC
	ADC #$04
	STA AUDF1
	LDA #Dead | 1
	STA P1State
	LDA #$0C
	STA AUDC0
	STA AUDC1
	STA AUDV0
	STA AUDV1
	BNE SkipBossMove	; BRA

BossKernel
	LDA #$FF
	STA PF0
	STA PF1
	STA PF2

	LDX Alive
	BEQ YouWin
	DEX
	LDA BossSpeed,X
	AND Clock
	BNE SkipBossMove

; Boss AI
	LDA BossFacing
	BNE BossDown
	INC YBoss
	INC YBoss
	LDA #180
	CMP YBoss
	BNE BossMoveDone
	STA BossFacing		; A!=0
BossDown
	DEC YBoss
	DEC YBoss
	LDA #38
	EOR YBoss
	BNE BossMoveDone
	STA BossFacing		; A=0
BossMoveDone
	LDA Clock
	AND #%100000
	LSR
	LSR
	LSR
	LSR
	LSR
	TAX
	LDA BossHmove,X
	STA HMP1
SkipBossMove
	
	LDA YBoss
	SEC
	SBC #BossSpriteHeight
	STA Adjustment
	
	LDA YP0
	SEC
	SBC Adjustment
	STA YP0Adjusted
	LDA M0Pos
	SEC
	SBC Adjustment
	STA M0PosAdjusted
	LDA M1Pos
	SEC
	SBC Adjustment
	STA M1PosAdjusted

	LDA #NusizQuad | Nusiz8Missile
	STA NUSIZ1

BossWaitForVblankEnd
	LDA INTIM	
	BNE BossWaitForVblankEnd

	LDA #0
	STA WSYNC
	STA HMOVE
	STA WSYNC

	STA HMCLR
	STA WSYNC
	STA VBLANK

	LDX #12
BossTopWallLoop
	STA WSYNC
	DEX
	BPL BossTopWallLoop

	LDA #0
	STA PF2
	STA PF1
	LDA #$30
	STA PF0

	IF BOSSROOMFIX = TRUE
		LDX #192-9
	ELSE
		LDX #192-12
	ENDIF

	SEC
BossScanLoop0
	TXA				;2
;	SEC				;0
	SBC YP0				;3
	ADC #SpriteHeight		;2
	BCC NoPlayerBoss0		;2
	TAY				;2
	LDA (P0Data),Y		;5
	STA WSYNC			;3 (19)
;-------------------------------------------------------------------
	STA GRP0			;3
	LDA (MasterChiefColor),Y	;5
	STA COLUP0			;3
	LDA MasterChief1Helmet,Y	;4
	STA ENABL			;3 (18) (37)
	
PlayerBoss0
	TXA		; 2
	LDX #ENAM1	; 2
	TXS		; 2
	CMP M1Pos	; 3
	PHP		; 3
	CMP M0Pos	; 3
	PHP		; 3
	TAX		; 2 (20) (57)

	DEX			; 2
	CPX YBoss		; 2
	BNE BossScanLoop0	; 3 (7) ()	
	JMP BossMain

NoPlayerBoss0
	STA WSYNC
	LDA #0
	STA GRP0
	BEQ PlayerBoss0		; BRA

NoPlayerBoss
	STA WSYNC
	LDA #0
	STA GRP0
	BEQ PlayerBoss		; BRA

BossMain
	LDX #BossSpriteHeight
	TXA
	DEX
BossScanLoop
	SEC				;2
	SBC YP0Adjusted			;3
	ADC #SpriteHeight		;2
	BCC NoPlayerBoss		;2 (9)

; if so wait until new line then draw sprite0 with the correct color
	TAY				;2
	LDA (P0Data),Y		;5
	STA WSYNC			;3 (10) (19)
;----------------------------------------------------------------------------
	STA GRP0			;3
	LDA (MasterChiefColor),Y	;5
	STA COLUP0			;3
	LDA MasterChief1Helmet,Y	;4
	STA ENABL			;3 (18) (37)
PlayerBoss
	LDA BossData,X		;4  (animate boss with 2 versions of kernel?)
	STA GRP1		;3
	LDA BossColor,X		;4
	STA COLUP1		;3 (14) (51)

	TXA		; 2
	LDX #ENAM1	; 2
	TXS		; 2
	CMP M1PosAdjusted	; 3
	PHP		; 3
	CMP M0PosAdjusted	; 3
	PHP		; 3
	TAX		; 2 (20) (71)

	DEX			; 2
	BPL BossScanLoop	; 3 (5) (76!)

BossSecond
	LDX Adjustment
	SEC

BossScanLoop2
	TXA				;2
;	SEC				;0
	SBC YP0				;3
	ADC #SpriteHeight		;2
	BCC NoPlayerBoss2		;2
	TAY				;2
	STA WSYNC			;3 (19)
;-------------------------------------------------------------------
	LDA (P0Data),Y		;5
	STA GRP0			;3
	LDA (MasterChiefColor),Y	;5
	STA COLUP0			;3
	LDA MasterChief1Helmet,Y	;4
	STA ENABL			;3 (18) (37)	
PlayerBoss2
	TXA		; 2
	LDX #ENAM1	; 2
	TXS		; 2
	CMP M1Pos	; 3
	PHP		; 3
	CMP M0Pos	; 3
	PHP		; 3
	TAX		; 2 (20) (57)

	DEX			; 2
	CPX #12		; 2
	BNE BossScanLoop2	; 3 (7) ()
	BEQ BossBottom		; BRA

NoPlayerBoss2
	STA WSYNC
	LDA #0
	STA GRP0
	BEQ PlayerBoss2		; BRA

BossBottom
BossBottomWallLoop
	STA WSYNC
	LDA #$FF
	STA PF0
	STA PF1
	STA PF2
	DEX
	BPL BossBottomWallLoop

	STA WSYNC
	JMP DoneBossKernel

BossSpriteHeight = 24
BossData
        .byte #%00000000;$FE
        .byte #%00011000;$08
        .byte #%00011000;$04
        .byte #%00011000;$02
        .byte #%00011000;$0E
        .byte #%00111100;$0C
        .byte #%01111110;$08
        .byte #%01111110;$06

        .byte #%01111110;$02
        .byte #%00000000;$20
        .byte #%01111000;$20
        .byte #%00011000;$20
        .byte #%00011000;$20
        .byte #%00011000;$20
        .byte #%00000000;$F0
        .byte #%00011000;$F0

        .byte #%00111000;$F0
        .byte #%00110000;$F0
        .byte #%00110100;$F0
        .byte #%00001100;$F8
        .byte #%00011100;$FA
        .byte #%00011000;$FE
        .byte #%00011000;$FE
        .byte #%00010000;$FE
;---End Graphics Data---



;******************************************************
; Start!

Start
	SEI
	CLD
	LDA #0
	STA Legendary
StartAgain
	LDX #$FF	
	TXS	
	LDX #$F0
ClearMem 
	STA 0,X		
	DEX		
	BNE ClearMem
	JSR TitleScreen

	LDA ScanLine ; random depending on how long we stayed on title screen
	BNE DoSeed
	LDA #42		; seed can't be zero
DoSeed
	STA r_seed

RestartMain
; setup background
	LDA #$21
	STA CTRLPF	; set ball size
	LDA #2
	STA Lives

	LDA #FirstRoom
	STA Level
	STA LastLevel

	LDA #<MasterChief1
	STA P0Data
	LDA #>MasterChief1
	STA P0Data2
	LDA #<MasterChief1Color
	STA MasterChiefColor
	LDA #>MasterChief1Color
	STA MasterChiefColorH
	LDA #StartFlags
	STA Flags

; Initialize enemy data
; all enemy data fits in the same page so this only has to be done once
	LDA #>Elite1
	STA EliteData2
	LDA #>GunColor
	STA EliteColor2

; Initialize Sound System
	LDA #32
	STA SoundClock
	STA SoundClock2

NextLife
	LDA #24
	STA XP0
	LDA #50
	STA YP0
	LDA #0
	STA Facing
	STA REFP0
	JSR NewPlayfield

;VSYNC time
MainLoop
	LDA SWCHB
	AND #$01
	BEQ Start
	JSR SetupVsync
	JSR TestBounds
	
	INC Clock

	JSR CollideAndMove

; handle enemy "AI"
	LDA Clock
	AND #$03
	BEQ SkipAI
	TAX
	DEX
	JSR MoveEnemy
SkipAI
	
	LDA Clock
	AND #$01
	BNE SkipSounds
	JSR UpdateSounds
SkipSounds

	JSR AdjustXP1
	JSR AnimateWalls
	JSR PositionPlayer
	JSR MultiplexMissiles

; init scanloop variables
	LDA #0
	STA WhichElite

	LDA Level
	CMP #BossLevel
	BNE NoBossKernel
	JMP BossKernel
NoBossKernel
	JMP MainKernel

HelmValue
	.byte 0
	.byte %00100000
	.byte %00100010

DoneKernel
	STA WSYNC
;	LDA #0		; A=0 already
	STA COLUBK
	STA REFP1
	STA PF0
	STA PF1
	STA PF2
	STA HMCLR	; otherwise hmove will move player missile
	LDX Lives
	LDA NusizTab,X
	STA RESP1
	STA NUSIZ1
	LDA HelmValue,X
	STA Temp
	STA WSYNC
	STA HMOVE
	LDA #Green
	STA COLUP1
	LDX #5
EdFLoop
	LDA Lives
	BEQ NoHelm
	LDA EdFLife-1,X
	STA GRP1
	LDA HelmOn-1,X
	BEQ NoHelm
	LDA Temp
	STA PF1
	PLA
	PLA
	PLA
	PLA
	LDA #0
	STA PF1
NoHelm
	STA WSYNC
	DEX
	BNE EdFLoop
	STX GRP1	; X=0
	STX NUSIZ1
	
DoneBossKernel
; restore hacked stack
	LDX #$FF
	TXS

	LDA #0
	STA ENAM0
	STA ENAM1

	JSR DoOverscan
	LDA BkColor
	STA COLUBK
	JMP MainLoop
	
;***********************
; MoveEnemy
; handle enemy AI
MoveEnemy
	LDA P1State,X
	AND #$0F
	BNE MEStayInState
; pick a new state
	JSR rand_8
	AND #$03
	TAY
	LDA StateType,Y
	STA P1State,X
MEStayInState
	DEC P1State,X
	LDA P1State,X	
	AND #$F0
	LSR
	LSR
	LSR
	TAY
	LDA MEJumpTable+1,Y
	PHA
	LDA MEJumpTable,Y
	PHA
	RTS		; indirect jump

MEDead
	INC P1State,X
	RTS
MEDying
	LDA P1State,X
	AND #$0F
	BEQ MEDoDead
; XX00 * 12
	AND #$0C	; *4
	STA Temp
	ASL		; *8
	CLC
	ADC Temp	; *12
	ADC #<DyingElite
	STA P1DataL,X	; change dying sprite
MEExit
	RTS
MEDoDead
; random chance to drop a shield
	LDA #ItemType
	CMP P1Type,X
	BEQ MEReallyDead	; items can't drop more items
	JSR rand_8
	AND #$0F		; 1/16 chance
	BNE MEReallyDead
	LDA #<Shield1
	STA P1DataL,X
	STA P1Frame2L,X
	LDA #<ShieldColor
	STA P1ColorL,X
	LDA #ItemType
	STA P1Type,X
	LDA #NusizNormal
	STA P1Nusiz,X
	LDA #ShieldFlag | SawShieldFlag
	STA P1Flags,X
	LDA #Standing | 1
	STA P1State,X
	LDA #$0
	STA P1Facing,X
	RTS
MEReallyDead
	LDA #Dead | 1
	STA P1State,X
	LDA #<DeadElite
	STA P1DataL,X

; coallesce spritelines
	LDX #Dead | 1
	CPX P1State
	BNE METry2
	LDA #MaxScans - 12
	STA SpriteLine
METry2
	CPX P1State2
	BNE METry3
	CPX P1State
	BNE METry2B
	LDA #MaxScans - 20
	STA SpriteLine2
	BNE METry3	; BRA
METry2B
	CPX P1State3
	BNE METry2C
	LDA #8
	STA SpriteLine
	BNE METry3	; BRA
METry2C
	LDA #44
	STA SpriteLine
	LDA #40
	STA SpriteLine2
METry3
	CPX P1State3
	BNE MEDoneDead
	LDA #4
	STA SpriteLine2
MEDoneDead
	RTS

MEStanding
	; prevent plants and items from moving and shooting (except for turrets...)
	LDA P1Type,X
	CMP #PlantType
	BMI MEJustStanding
	JSR SwapAnimationFrames
	INC P1State,X
MEJustStanding
	RTS

MEShooting
	LDA P1State,X
	AND #$0F
	BNE MEJustStanding

; keep turrets in shooting state
	LDA P1Flags,X
	AND #TurretFlag
	BEQ MENoTurret
	INC P1State,X
MENoTurret

; try to shoot
	LDA YM1,X
	BNE MEBulletMoving
; setup new bullet
	STX WhichElite
	LDX #1
	LDY #ShotSound
	JSR StartSound
	LDX WhichElite

	LDA YP0
	PHA
MESprayLoop
	LDA P1Flags,X
	STA M1Flags,X
MENoBigBullets
;  set vertical position
	LDA ElitePos,X
	STA YM1,X
; set horizontal position
	LDA XP1,X
	STA XM1,X
	JSR ComputeDeltas

	; adjust bullet position to center of sprite (should also adjust to center of target)
	LDA YM1,X
	SEC
	SBC #SpriteHeight/2
	STA YM1,X

	LDA P1Type
	CMP #BossType
	BNE MEDoneShot

	; boss bullet handling
	LDA YP0
	CLC
	ADC SprayTable,X
	STA YP0
	LDA M1Flags
	STA M1Flags,X
	INX
	CPX #3
	BEQ MEDoneShot
	LDA ElitePos	; YBoss
	STA ElitePos,X
	LDA XP1
	STA XP1,X
	BNE MESprayLoop		; BRA
MEDoneShot
	PLA
	STA YP0
MEBulletMoving	
	RTS

SprayTable
	.byte (SpriteHeight+4)
	.byte -2*(SpriteHeight+4)

MEMovingToward
	LDA P1Type,X
	CMP #BossType
	BEQ MEBulletMoving	; boss movement handled elsewhere
; Animate
	JSR SwapAnimationFrames
; move toward the player
	LDA ElitePos,X
	CMP YP0
	BCS MEMoveDown
	LDA SpriteLine-1,X
	SEC
	SBC #2	; don't get too close to spriteline
	CMP ElitePos,X
	BEQ MENoVert
	INC ElitePos,X
	BNE MENoVert		; BRA
MEMoveDown
	LDA SpriteLine,X
	CLC
	ADC #4+#SpriteHeight	; don't get too close to spriteline
	CMP ElitePos,X
	BEQ MENoVert
	LDA #MinScans+#SpriteHeight+2
	CMP ElitePos,X
	BEQ MENoVert
	DEC ElitePos,X
MENoVert
	LDA P1Type,X
	CMP #GruntType
	BNE MENoGrunt
	LDA M0Pos
	BEQ MENoGrunt
; Grunts run away if player is shooting
	LDA XP1,X
	CMP XP0
	BCC MEMoveLeft
	BCS MEMoveRight	; BRA
MENoGrunt
	LDA XP1,X
	CMP XP0
	BCC MEMoveRight
; move left
MEMoveLeft
	CMP #LeftP1Limit
	BEQ MENoMoveLeft
	DEC XP1,X
MENoMoveLeft
	LDA #0
	BEQ MERExit	; BRA

MEMoveRight
	CMP #RightP1Limit
	BEQ MENoMoveRight
	INC XP1,X
MENoMoveRight
	LDA #$08
MERExit
	STA P1Facing,X
	RTS

;**************
; ComputeDeltas
; calculate angle between enemy and player as two 16 bit relative offsets
; X=WhichElite
ComputeDeltas Subroutine
	LDA YP0
	SEC
	SBC YM1,X
	STA DeltaY,X
	LDA #0
	SBC #0
	STA DeltaYH,X

	LDA XP0
	SEC
	SBC XM1,X
	STA DeltaX,X
	LDA #0
	STA XCur,X
	STA YCur,X
	SBC #0
	STA DeltaXH,X

	LDA DeltaX,X
	ORA DeltaY,X
	BNE CDBugFix	; if both are zero here we will hang in the loop below
	INC DeltaX,X
CDBugFix

; shift deltas until just before we wrap into the high byte
	LDA DeltaYH,X
	STA Temp
	LDA DeltaXH,X
	STA Temp2
CDShiftLoop
	ASL DeltaY,X
	ROL Temp
	ASL DeltaX,X
	ROL Temp2

; shifted too far?
	LDA Temp
	CMP DeltaYH,X
	BNE CDShifted
CDTryX
	LDA Temp2
	CMP DeltaXH,X
	BEQ CDShiftLoop
	
CDShifted
; go back one
	LSR Temp
	ROR DeltaY,X
	LSR Temp2
	ROR DeltaX,X
	RTS
	
	
;**************
; Just a quick subroutine to turn off the player's bullet
TurnOffM0
	LDA #0
	STA M0Pos
	LDA #02
	STA RESMP0
	RTS


; *********** CollideAndMove
; handle collisions, movement, etc
CollideAndMove

;  ****** Collisions **********
; test for collisions
	BIT CXP0FB	; P0 hit Playfield
	BPL NoPlayfield
; player hit playfield
	LDA SWCHB
	AND #%01000000	; P0 Difficulty
	ORA Legendary
	BEQ MoveBack	; Deadly Walls
	JMP PlayerHit
MoveBack2
	STA CXCLR
MoveBack
	LDA YP0Old
	STA YP0
	LDA XP0Old
	STA XP0
NoPlayfield
	BIT CXPPMM	; P0 hit P1
	BPL TestMissiles

; P0 hit P1. Figure out which sprite it hit.
	LDX #0
	LDA YP0
	SEC
	SBC #SpriteHeight/2
	CMP SpriteLine,X
	BCS HitEnemy
	INX
	CMP SpriteLine,X
	BCS HitEnemy
	INX
HitEnemy
	LDA P1State,X
	AND #$F0
	CMP #Dying	; explosions don't kill you
	BEQ DidntHit
	LDA P1DataL,X
	CMP #<Tree1	; trees don't kill you
	BEQ MoveBack2
	LDA P1Type,X
	CMP #ItemType
	BNE PlayerHit

	; got an item!
	LDA #Dying | 1
	STA P1State,X
	LDA P1Flags,X
	ORA Flags
	STA Flags

	LDY #PickupSound
	LDX #0
	JSR StartSound
DidntHit

TestMissiles
	BIT CXM0FB
	BMI M0Collision
	BIT CXM0P	; test for M0 P1 collision
	BPL NoM0Collision
; M0 hit P1, but which one?
	LDX #0
	LDA M0Pos
	CMP SpriteLine,X
	BCS HitSprite
	INX
	CMP SpriteLine,X
	BCS HitSprite
	INX
HitSprite
	LDY P1Type,X
	CPY #PlantType
	BPL M0Collision
; hit enemy
	LDA P1State,X
	AND #$F0
	CMP #Dying
	BEQ M0Collision	; already dying
	DEC Alive
	CPY #BossType
	BEQ JustSound
	LDA #Dying | $0F
	STA P1State,X
	LDA #<DyingElite	; just use some random code for death explosion. Old School!
	STA P1DataL,X
JustSound
	LDY #DeathSound
	LDX #1
	JSR StartSound
M0Collision
	JSR TurnOffM0

NoM0Collision
	BIT CXM1FB
	BMI M1Collision
	BIT CXM1P
;	BVS M1Collision		; this doesn't work because bullets hit the shooter
	BPL NoM1Collision
	; P0 hit by M1
PlayerHit
	LDA #ShieldFlag
	BIT Flags
	BEQ PlayerReallyHit
	EOR Flags
	STA Flags
	LDY #ShieldSound
	LDX #1
	JSR StartSound
	LDA #<MasterChief1Color
	STA MasterChiefColor
	BNE M1Collision		; BRA

PlayerReallyHit
	LDA #Green
	STA COLUBK
	STA BkColor
	LDA PlayerDying
	BNE AlreadyDying
	LDA #$7F
	STA PlayerDying
	LDY #GameOverSound
	LDX #0
	JSR StartSound
AlreadyDying
	
M1Collision
	LDX WhichMissile
	LDA #0
	STA YM1,X

NoM1Collision
	STA CXCLR

; Player Dying
	LDA PlayerDying
	BEQ NotDying
	DEC PlayerDying
	BEQ Restart
	JMP DonePlayerMove
Restart
	DEC Lives
	BMI StartOver
	LDA LastLevel
	STA Level
	LDA Flags
	AND #SawShieldFlag
	ASL
	ORA Flags
	STA Flags
	JMP NextLife	; stack is messed up but probably okay
StartOver
	LDA #0
	JMP StartAgain	; stack is messed up but probably okay
NotDying

;******** Player Movement *********

; animate master chief shield colors
	BIT Flags
	BPL NoShield	; shield flag is $80
	LDA Clock
	AND #$08
	LSR
	LSR
	LSR
	TAX
	LDA MasterColorTable,X
	STA MasterChiefColor
NoShield

; master chief only moves every other turn (or 3 out 4 turns with shoes)
	LDA Flags
	AND #ShoesFlag
	ORA Legendary
	TAX
	LDA Clock
	AND MoveMask,X
	CMP MoveCmp,X
	BPL DonePlayerMove

; get joystick input
	LDA SWCHA
	AND #$F0
	EOR #$F0
	BNE Moving
	LDA FNoIce
	BEQ Sliding
	BNE NotMoving		; BRA


Moving
	LDA P0Data
	EOR #<MasterChief1	; animate master chief
	EOR #<MasterChief2
	STA P0Data
NotMoving
	LDA SWCHA
	STA SwchaSave
Sliding
	LDA XP0
	STA XP0Old
	LDA YP0
	STA YP0Old

; joystick handling
	LDA SwchaSave
	ASL
	BCS TryLeft
	INC XP0 	; Right
	LDX #0
	STX REFP0
	STX Facing
TryLeft
	ASL
	BCS TryUp
	DEC XP0
	LDX #%00001000   ;a 1 in D3 of REFP0 says make it mirror
	STX REFP0
	LDX #1
	STX Facing
TryUp 
	ASL
	BCS TryDown
	DEC YP0
TryDown
	ASL
	BCS DonePlayerMove
	INC YP0
DonePlayerMove

; handle trigger button and AI Bullets
	LDA M0Pos
	BNE BulletMoving
	LDA PlayerDying
	BNE NoFire
	BIT INPT4
	BMI NoFire
	LDA #GunFlag
	BIT Flags
	BEQ NoFire	; no gun, no shoot
	; LDA #0	; don't need this as long as bit 1 is zero...
	STA RESMP0	; turn on missile
	LDA YP0
	SEC
	SBC #07
	STA M0Pos
	LDA XP0
	STA XM0
	LDX #0
	LDY #ShotSound
	JSR StartSound
	LDA Flags
	AND #BigGunFlag
	STA NUSIZ0	; make bullet big
	LSR
	LSR
	LSR
	ORA Facing
	STA M0Facing

BulletMoving		; handle player bullet motion
	LDX M0Facing
	LDA M0SpeedData,X
	STA HMM0
	LDA XM0
	CLC
	ADC M0DirData,X
	STA XM0
	CMP #XLeftEdge
	BCC TurnOffMissile
	CMP #XRightEdge
	BCC NoFire
TurnOffMissile
	JSR TurnOffM0

NoFire			; handle AI bullet
	LDX #2
AIMissileLoop
	LDA #FastBulletFlag
	AND M1Flags,X
	STA Temp
DoubleSpeed
	LDA YM1,X
	BEQ MaybeExit
	ASL
	EOR XM1,X
	STA Temp2
TryAgain
	LDA DeltaX,X
	CLC
	ADC XCur,X
	STA XCur,X
	LDA DeltaXH,X
	ADC XM1,X
	STA XM1,X
	CMP #XLeftEdge
	BCC DoAITurnOff
	CMP #XRightEdge
	BCC ShootUpDown
DoAITurnOff
	LDA #0
	STA YM1,X
ShootUpDown
	LDA DeltaY,X
	CLC
	ADC YCur,X
	STA YCur,X
	LDA DeltaYH,X
	ADC YM1,X
	STA YM1,X
	CMP MapTop
	BNE MaybeRepeat
DoAITurnOff2
	LDA #0
	STA YM1,X
MaybeRepeat	; A=YM1,X
	ASL
	EOR XM1,X
	CMP Temp2
	BEQ TryAgain
	LDA Temp
	BEQ MaybeExit
	LDA #0
	STA Temp
	BEQ DoubleSpeed
MaybeExit
	DEX
	BPL AIMissileLoop
	RTS

;**************
; multiplex enemy missiles
MultiplexMissiles
	LDX WhichMissile
PlexLoop
	DEX
	BPL PlexSkip
	LDX #2
PlexSkip
	LDA YM1,X
	BNE PlexFound
	CPX WhichMissile
	BNE PlexLoop
PlexFound
	STX WhichMissile
	LDA YM1,X
	STA M1Pos
	BEQ NoPlex
	LDA M1Flags,X
	AND #BigBulletFlag
	STA M1Nusiz
;************
; reset the position of missile 1
; X = WhichElite
	;	LDA #0		; bit D1 is zero already...
	STA RESMP1
	LDY #8
	LDA XM1,X
	LDX #RESM1
	JSR SetRespx
	STA HMM1
	RTS
NoPlex
	LDA #02		; turn off missile
	STA RESMP1
	RTS

;***************
TestBounds
	LDA Level
	STA OldLevel
	LDA XP0
	CMP #XRightEdge
	BNE TestLeft
	INC Level
	LDA #XLeftEdge+8
	STA XP0
	BNE CallPlayfield	; BRA
TestLeft
	CMP #XLeftEdge
	BNE TestBottom
	DEC Level
	LDA #XRightEdge-8
	STA XP0
	BNE CallPlayfield	; BRA
TestBottom
	LDA YP0
	CMP #2+#SpriteHeight
	BNE TestTop
	LDA Level
	CLC
	ADC #MapWidth
	STA Level
	LDA #MaxScans-4
	STA YP0
	BNE CallPlayfield	; BRA
TestTop
	CMP MapTop
	BNE NoNewPlayfield
	LDA Level
	SEC
	SBC #MapWidth
	STA Level
	LDA #16
	STA YP0

CallPlayfield
	JSR NewPlayfield
	LDA Level
	CMP #BossLevel
	BNE NoNewPlayfield
; position boss
	STA WSYNC
	LDA #9
	SEC
BPosLoop
	SBC #1
	BPL BPosLoop
	STA RESP1
	LDA #120	; aligns bullets with boss
	STA XP1
	LDA #3
	STA Alive
	STA SpriteLine
	LDA #128	; must be an even number
	STA YBoss
NoNewPlayfield
	RTS


;***************
; Player has entered a new room so set it up
NewPlayfield
; initialize player position
	STA CXCLR
	LDA #$F0
	STA SwchaSave

; setup missles
	LDA #02
	STA RESMP0
	STA RESMP1

; Last level handling
	LDA #0
	STA M0Pos
	CMP Alive
	BEQ NPSave
	STA OldLevel
NPSave
	STA Alive

; Now create 3 enemies
	LDA #MaxScans-10
	STA SpriteLineMax
	LDA #0
	STA SpriteLineMin

	TAX		; LDX #0
	LDA Level
	LSR
	LSR
	LSR
	STA Row		; row (Level/8)
	LDA Level
	ASL
	TAY
	LDA Map,Y
	AND #$0F
	JSR NewEnemy
	LDA SpriteLineData,X	; only want to do this twice - Initialize SpriteLines
	STA SpriteLine,X
	INX
	LDA Map,Y
	LSR
	LSR
	LSR
	LSR
	JSR NewEnemy
	LDA SpriteLineData,X	; only want to do this twice - Initialize SpriteLines
	STA SpriteLine,X
	INX
	INY
	LDA Map,Y
	AND #$0F
	JSR NewEnemy

; more last level handling
	LDA OldLevel
	BEQ NotNewLast
	STA LastLevel
NotNewLast

; setup walls
	LDA #0
	STA PF0Left
	STA PF0Right
	STA PF0Top
	STA PF0Bottom

; TOP
	LDA Level
	SEC
	SBC #MapWidth	; look up one for top border
	BMI TopOn
	ASL
	TAX
	LDA Map+1,X
	ROL
	BCC Wall2
TopOn
	LDY #$FF
	STY PF0Top
Wall2
	LDA Level
	BEQ LeftOn	; off left edge
	ASL
	TAX
	LDA Map-1,X	; look back one for left border
	ROL
	ROL
	BCC Wall3
LeftOn
	LDY #$30
	STY PF0Left

Wall3
	LDA Map+1,X
	ROL
	BCC Wall4
	LDY #$FF
	STY PF0Bottom
Wall4
	ROL
	BCC Wall5
	LDY #$30
	STY PF0Right
Wall5
; Load Color Scheme
	ROL
	ROL
	ROL
	AND #$03
	TAX
	LDA PFColorScheme,X
	STA COLUPF
	LDA BKColorScheme,X
	STA COLUBK
	STA BkColor

; On Ice?
	TXA
	EOR #$02
	STA FNoIce

; turn on corners if necessary
	LDX #$30
	LDA Level
	CMP #43
	BPL BonusCorners
	AND #%111
	CMP #3
	BPL BonusCorners
	LDX #0
BonusCorners
	TXA
	ORA PF0Right
	STA PF0RightAndCorners
	TXA
	ORA PF0Left
	STA PF0LeftAndCorners

; Set MapTop
	LDA #MaxScans-1
	STA MapTop
	LDA Level
	CMP #BossLevel
	BNE DoneMapTop
	LDA #192-1
	STA MapTop
DoneMapTop
	RTS

; Color Schemes

PFColorScheme
    .byte Orange
    .byte Pink
    .byte Orange
    .byte Orange

BKColorScheme
    .byte LtBlue
    .byte Pink+10
    .byte Silver+2
    .byte BossBkColor

LockLevels
	.byte 10
	.byte 35
	.byte 60
LockKeys
	.byte KeyFlag
	.byte Key2Flag
	.byte Key3Flag
LockOffset
	.byte 1
	.byte 0
	.byte 1
LockPF0
	.byte %00010000
	.byte %00100000

AnimateWalls
	LDX #2
WallLoop	
	LDA Level
	CMP LockLevels,X
	BEQ GotWall
	DEX
	BPL WallLoop
	RTS
GotWall
	LDA LockKeys,X
	BIT Flags
	BNE AWGotKey
	LDA Clock
	AND #%0001000
	LSR
	LSR
	LSR
	TAY
	LDA LockPF0,Y
	.byte $2C	; skip next 2 bytes
AWGotKey
	LDA #0
	LDY LockOffset,X
	STA PF0Left,Y
	LDA #$30
	STA PF0RightAndCorners
	RTS

AdjustXP1
	LDX #2
AXLoop
	LDA XP1,X
	SEC
	SBC #XP1Adjustment		; this factor adjusts where the enemy is relative to the master chief
	STA XP1Adjusted,X
	DEX
	BPL AXLoop
	RTS

MoveMask
	.byte %01
	.byte %11
	.byte %11
MoveCmp
	.byte %01	; overlap one byte
	.byte 3
	.byte 1
	.byte 1

EnemyYOffsets
	.byte #81
	.byte #55
	.byte #30

SpriteLineData
	.byte #63
	.byte #37

; out
GunLv = 0
Key2Lv = 1
SniperLv = 2
Tree2Lv = 3
KeyLv = 4
Key3Lv = 5
ThingLv = 6
EliteGiantLv = 7
; constant
EliteLv = 8
EliteRedLv = 9
ShieldLv = 10
RockLv = 11
GruntLv = 12
BruteLv = 13
GruntRedLv = 14
TreeLv = 15
; in
Elite3Lv = 16
GruntGiantLv = 17
TreeGiantLv = 18
EliteInvisLv = 19
BossThingLv = 20
ShoesLv = 21
BossLv = 22

; color schemes
Outdoor	= 0
Indoor	= 1
Ice	= 2
Boss	= 3

Map
; row 1
	ROOM GunLv,Tree2Lv,Tree2Lv,0,0,Outdoor, 0
	ROOM TreeLv,GruntLv,TreeLv,0,0,Outdoor, 0
	ROOM ShieldLv,GruntLv,TreeLv,0,1,Outdoor, 0
	ROOM ThingLv,GruntLv,ThingLv,0,0,Indoor, 0
	ROOM EliteLv,ThingLv,ThingLv,1,0,Indoor, 0
	ROOM ThingLv,GruntLv,GruntLv,0,1,Indoor, 0
	ROOM GruntLv,EliteLv,EliteLv,0,0,Ice, 0
	ROOM RockLv,GruntLv,GruntLv,0,1,Ice, 0
; row 2
	ROOM TreeLv,Tree2Lv,Tree2Lv,0,0,Outdoor, 1
	ROOM GruntLv,TreeLv,TreeLv,0,0,Outdoor, 1
	ROOM EliteLv,TreeLv,GruntLv,0,0,Outdoor, 1
	ROOM ThingLv,ThingLv,ThingLv,1,1,Indoor, 1
	ROOM EliteLv,EliteLv,EliteLv,0,0,Indoor, 1
	ROOM GruntLv,GruntLv,GruntLv,1,1,Indoor, 1
	ROOM Key2Lv,GruntRedLv,EliteLv,1,1,Ice, 1
	ROOM RockLv,GruntLv,RockLv,0,1,Ice, 1
; row 3
	ROOM TreeLv,Tree2Lv,Tree2Lv,1,0,Outdoor, 2
	ROOM GruntLv,GruntLv,TreeLv,1,0,Outdoor, 2
	ROOM KeyLv,GruntLv,TreeLv,1,1,Outdoor, 2
	ROOM GruntRedLv,ThingLv,ThingLv,0,0,Indoor, 2
	ROOM ThingLv,ThingLv,ThingLv,1,0,Indoor, 2
	ROOM Elite3Lv,Elite3Lv,Elite3Lv,1,0,Indoor, 2
	ROOM EliteLv,SniperLv,EliteLv,1,1,Indoor, 2
	ROOM RockLv,RockLv,RockLv,0,1,Ice, 2
; row 4
	ROOM EliteGiantLv,Key3Lv,TreeGiantLv,0,0,Outdoor, 3
	ROOM EliteGiantLv,TreeGiantLv,EliteGiantLv,0,0,Outdoor, 3
	ROOM TreeGiantLv,EliteGiantLv,TreeGiantLv,0,1,Outdoor, 3
	ROOM ShieldLv,EliteLv,EliteLv,1,0,Indoor, 3
	ROOM ThingLv,GruntRedLv,GruntRedLv,1,0,Indoor, 3
	ROOM EliteLv,GruntLv,GruntLv,1,0,Indoor, 3
	ROOM EliteRedLv,ThingLv,ThingLv,1,0,Indoor, 3
	ROOM BruteLv,EliteLv,EliteLv,0,1,Indoor, 3
; row 5
	ROOM EliteGiantLv,TreeGiantLv,EliteGiantLv,0,0,Outdoor, 4
	ROOM GruntGiantLv,EliteGiantLv,GruntGiantLv,0,0,Outdoor, 4
	ROOM TreeGiantLv,TreeGiantLv,TreeGiantLv,0,0,Outdoor, 4
	ROOM EliteRedLv,EliteLv,EliteLv,1,0,Indoor, 4
	ROOM GruntRedLv,EliteLv,EliteLv,1,0,Indoor, 4
	ROOM ThingLv,GruntLv,GruntLv,1,0,Indoor, 4
	ROOM EliteLv,GruntLv,GruntLv,1,0,Indoor, 4
	ROOM GruntLv,GruntLv,GruntLv,1,1,Indoor, 4
; row 6
	ROOM EliteGiantLv,EliteGiantLv,TreeGiantLv,0,0,Outdoor, 5
	ROOM EliteGiantLv,TreeGiantLv,GruntGiantLv,1,0,Outdoor, 5
	ROOM TreeGiantLv,GruntGiantLv,ShieldLv,1,1,Outdoor, 5
	ROOM EliteRedLv,EliteRedLv,EliteRedLv,0,0,Boss, 5
	ROOM EliteRedLv,EliteInvisLv,BossThingLv,1,0,Boss, 5
	ROOM BossThingLv,EliteRedLv,EliteRedLv,1,0,Boss, 5
	ROOM Elite3Lv,Elite3Lv,Elite3Lv,1,0,Boss, 5
	ROOM BruteLv,EliteInvisLv,EliteInvisLv,0,1,Boss, 5
; row 7
	ROOM RockLv,RockLv,RockLv,1,0,Ice, 6
	ROOM GruntRedLv,RockLv,RockLv,1,0,Ice, 6
	ROOM RockLv,EliteRedLv,EliteRedLv,0,1,Ice, 6
	ROOM EliteInvisLv,BossThingLv,BossThingLv,1,0,Boss, 6
	ROOM BossThingLv,GruntRedLv,GruntRedLv,1,0,Boss, 6
	ROOM GruntRedLv,BossThingLv,BossThingLv,0,1,Boss, 6
	ROOM EliteInvisLv,EliteInvisLv,EliteInvisLv,0,0,Boss, 6
	ROOM GruntRedLv,GruntRedLv,GruntRedLv,1,1,Boss, 6
; row 8
	ROOM ShoesLv,TreeLv,TreeLv,1,0,Ice, 7
	ROOM Elite3Lv,Elite3Lv,Elite3Lv,1,0,Ice, 7
	ROOM EliteRedLv,GruntRedLv,GruntRedLv,1,0,Ice, 7
	ROOM GruntRedLv,GruntRedLv,GruntRedLv,1,0,Ice, 7
	ROOM EliteRedLv,EliteRedLv,EliteRedLv,1,0,Ice, 7
	ROOM BossThingLv,BossThingLv,BossThingLv,1,1,Boss, 7
	ROOM ShieldLv,BruteLv,BruteLv,1,0,Boss, 7
	ROOM TreeLv,BossLv,TreeLv,1,1,Boss, 7

EliteType = 1
GruntType = 2
BruteType = 3
BossType = 4
PlantType = 5
ItemType = 6


NusizNormal = 0
Nusiz2Close = 1
Nusiz2Med = 2
NusizWide = 5
NusizQuad = 7
Nusiz3Close = 3
Nusiz1Missile = 0
Nusiz2Missile = %010000
Nusiz4Missile = %100000
Nusiz8Missile = %110000

EnemyTypes
; Gun
	.byte #<Gun1
	.byte #<GunColor
	.byte NusizNormal
	.byte #ItemType
	.byte #<Gun1
	.byte #GunFlag
; Key2
	.byte #<Key1
	.byte #<Key2Color
	.byte NusizNormal
	.byte #ItemType
	.byte #<Key1
	.byte #Key2Flag
; Sniper
	.byte #<Gun1
	.byte #<SniperColor
	.byte NusizNormal
	.byte #ItemType
	.byte #<Gun1
	.byte #BigGunFlag
; Two Trees
	.byte #<Tree1
	.byte #<TreeColor
	.byte Nusiz2Med
	.byte #PlantType
	.byte #<Tree1
	.byte 0
; Key
	.byte #<Key1
	.byte #<KeyColor
	.byte NusizNormal
	.byte #ItemType
	.byte #<Key1
	.byte #KeyFlag
; Key3
	.byte #<Key1
	.byte #<Key3Color
	.byte NusizNormal
	.byte #ItemType
	.byte #<Key1
	.byte #Key3Flag
; Thing
	.byte #<Thing1
	.byte #<ThingColor
	.byte NusizWide
	.byte #PlantType
	.byte #<Thing2
	.byte 0
; Giant Elite
	.byte #<Elite1
	.byte #<YellowEliteColor
	.byte NusizWide
	.byte #EliteType
	.byte #<Elite2
	.byte #BigBulletFlag
; regular Elite
	.byte #<Elite1
	.byte #<SilverEliteColor
	.byte NusizNormal
	.byte #EliteType
	.byte #<Elite2
	.byte 0
; Red Elite
	.byte #<Elite1
	.byte #<RedEliteColor
	.byte NusizNormal
	.byte #EliteType
	.byte #<Elite2
	.byte #FastBulletFlag
; Shield
	.byte #<Shield1
	.byte #<ShieldColor
	.byte NusizNormal
	.byte #ItemType
	.byte #<Shield1
	.byte #ShieldFlag | SawShieldFlag
; Rock
	.byte #<Rock1
	.byte #<RockColor
	.byte NusizWide
	.byte #PlantType
	.byte #<Rock1
	.byte 0
; regular Grunt
	.byte #<Grunt1
	.byte #<SilverGruntColor
	.byte NusizNormal
	.byte #GruntType
	.byte #<Grunt2
	.byte 0
; regular Brute
	.byte #<Brute1
	.byte #<SilverBruteColor
	.byte NusizNormal
	.byte #BruteType
	.byte #<Brute2
	.byte #BigBulletFlag | FastBulletFlag
; RedGrunt
	.byte #<Grunt1
	.byte #<RedGruntColor
	.byte NusizNormal
	.byte #GruntType
	.byte #<Grunt2
	.byte #FastBulletFlag
; Tree
	.byte #<Tree1
	.byte #<TreeColor
	.byte NusizNormal
	.byte #PlantType
	.byte #<Tree1
	.byte 0
; 3 Elites
	.byte #<Elite1
	.byte #<SilverEliteColor
	.byte Nusiz3Close
	.byte #EliteType
	.byte #<Elite2
	.byte 0
; Giant Grunt
	.byte #<Grunt1
	.byte #<SilverGruntColor
	.byte NusizWide
	.byte #GruntType
	.byte #<Grunt2
	.byte #BigBulletFlag
; Giant Tree
	.byte #<Tree1
	.byte #<TreeColor
	.byte NusizWide
	.byte #PlantType
	.byte #<Tree1
	.byte 0
; InvisElite
	.byte #<Elite1
	.byte #<InvisEliteColor
	.byte NusizNormal
	.byte #EliteType
	.byte #<Elite2
	.byte #FastBulletFlag
; BossThing
	.byte #<Star1
	.byte #<StarColor
	.byte NusizNormal
	.byte #PlantType
	.byte #<Star1
	.byte TurretFlag
; Shoes
	.byte #<Shoe1
	.byte #<Shoe1Color
	.byte NusizNormal
	.byte #ItemType
	.byte #<Shoe1
	.byte #ShoesFlag
; Boss
	.byte #<Elite1
	.byte #<RedEliteColor
	.byte NusizQuad
	.byte #BossType
	.byte #<Elite2
	.byte BigBulletFlag | SeekBulletFlag | FastBulletFlag


; ***************
; Initialize a new enemy
; X = WhichEnemy
; A = EnemyType
; preserves Y
NewEnemy
	STY Temp
	
	CLC
	ADC Row

	ASL	; *2
	STA Temp2
	ASL	; *4
	CLC
	ADC Temp2	; *6
	TAY

	LDA EnemyYOffsets,X
	STA ElitePos,X
	
	LDA EnemyTypes,Y
	STA P1DataL,X
	LDA EnemyTypes+1,Y
	STA P1ColorL,X
	LDA EnemyTypes+2,Y
	STA P1Nusiz,X
	LDA EnemyTypes+3,Y
	STA P1Type,X
	LDA EnemyTypes+4,Y
	STA P1Frame2L,X
	LDA EnemyTypes+5,Y
	STA P1Flags,X

	LDA P1Type,X
	CMP #PlantType
	BPL NENoKill	; not an enemy
	INC Alive
	LDA LastLevel	; kill off guys from last room
	CMP Level
	BEQ NEKill
NENoKill
	LDA P1Type,X	; kill off items we already have
	CMP #ItemType
	BNE NEState
	LDA P1Flags,X
	AND Flags
	AND #~(ShieldFlag|SawShieldFlag)
	BEQ NENoTurret
NEKill
	LDA #ItemType	; change type so a shield doesn't drop
	STA P1Type,X
	LDA #<DeadElite
	STA P1DataL,X
	LDA #Dying | 1
	BNE NEState2
NEState
	LDA P1Flags,X
	AND #TurretFlag
	BEQ NENoTurret
	LDA #Shooting | $0C
	BNE NEState2
NENoTurret
	LDA #Standing | $0C	; adjust this value for difficulty
NEState2
	STA P1State,X
	LDA #0
	STA P1Facing,X
	STA YM1,X	; turn off Missile

; calculate x position of enemy
	JSR rand_8
	AND #$7F
	CMP #(RightP1Limit-(LeftP1Limit+10))
	BCC NERandOk
	SEC
	SBC #(RightP1Limit-(LeftP1Limit+10))
NERandOk
	CLC
	ADC #LeftP1Limit+10
	STA XP1,X

; try again if player is too close
	LDY #40
	LDA P1Nusiz,X
	BEQ NENotWide
	LDY #60
NENotWide
	STY Temp2
	TYA
	CLC
	ADC XP1,X
	SEC
	SBC #20
	CMP XP0		
	BCC NEOkay	; greater than right edge
;	SEC		; carry already set...
	SBC Temp2
	CMP XP0
	BCC NEFixIt	; greater than left edge
NEOkay
	LDY Temp
	RTS
NEFixIt
	LDA #LeftP1Limit+10
	LDY #90
	CPY XP0
	BCC NEFixLeft
	LDA #RightP1Limit - 10
NEFixLeft
	STA XP1,X
	BNE NEOkay

;*******************************
; SwapAnimationFrames
; X = WhichElite
SwapAnimationFrames
	LDY P1DataL,X
	LDA P1Frame2L,X
	STY P1Frame2L,X
	STA P1DataL,X
	RTS

;********************
; returns pseudo random 8 bit number in A. Affects A. (r_seed) is the
; byte from which the number is generated and MUST be initialised to a
; non zero value or this function will always return zero. Also r_seed		
; must be in RAM, you can see why......

rand_8
	LDA	r_seed		; get seed
	ASL			; shift byte
	BCC	no_eor		; branch if no carry

	EOR	#$CF		; else EOR with $CF
no_eor
	STA	r_seed		; save number as next seed
	SEC
	SBC	#$01
	RTS			; done


;Title Screen Handling
ThemeNotes
;	E,F#,G,F#,A,G,F#,E,
	.byte 6,31,29,31,26,29,31,6,6,0
;	B,C#,D,-,C#,A,C#,B
	.byte 0,23,20,19,19,20,26,20,23,23
;	E,G,A,F#,-,E,G,F#,D,E
	.byte 0,6,29,26,31,31,6,29,31,7,6,6
ThemeLength = 32

TitleScreen
	TSX
	STX StackSave
	LDX Legendary
	LDA TitleBkColor,X
	sta COLUBK  ;black background
	lda #33    
	sta ScanLine
	LDA #%00000101	; reflected, PF on top
	STA CTRLPF
	LDA #$FF
	STA NoteIndex

TitleMainLoop
	JSR SetupVsync

	INC ScanLine

	LDA ScanLine
	AND #$1F
	BNE TitleSkipNote
	INC NoteIndex
	LDX NoteIndex
	CPX #ThemeLength
	BCC TitleLoadNote
	LDA #0
	BEQ TitleSetVolume	;BRA
TitleLoadNote
	LDA ThemeNotes,X
	STA AUDF0
	BEQ TitleSetVolume
	LDY #12
	CMP #8			; note 6 gets control value 6, others get 12
	BPL TitleControl
	LDY #6
TitleControl
	STY AUDC0
	LDA #2
TitleSetVolume
	STA AUDV0
TitleSkipNote

	LDA SWCHB
	AND #$01
	BEQ TitlePushed
	BIT INPT4
	BMI TestExit
TitlePushed
	LDA #$01
	STA ButtonPressed
	BNE TitleNoFire
TestExit
	LDA ButtonPressed
	BEQ TitleNoFire
	RTS
TitleNoFire

; align rings
	STA WSYNC
;	SLEEP 21
	LDA #$FF	;2
	STA GRP0	;3
	STA GRP1	;3
	LDA #$07	;2
	STA NUSIZ0	;3
	LDA #$05	;2
	STA.a NUSIZ1	;4
	LDA #$B0	;2
	STA RESP0	;0(21)
;	SLEEP 20
	STA HMM1	;3
	LDA ScanLine	;3
	AND #$04	;2
	ASL		;2
	TAY		;2
	PLA		;4
	PLA		;4 (20)
	STA RESP1
	STA WSYNC
StarLoop
	DEY
	BPL StarLoop
	STA RESM1
	JMP TitleKernel

SetupVsync
	LDA #2
	STA VSYNC	
	STA WSYNC	
	STA WSYNC 	
	STA WSYNC	

	IF COMPILE_VERSION = PAL
		LDA #81	; Only a few values (also #62) work here, since the
				; title kernel doesn't WSYNC after VBLANK sequence
	ELSE
		LDA #43
	ENDIF

	STA TIM64T	
	LDA #0
	STA VSYNC
	RTS

TitleExitKernel
	STA WSYNC
	LDA #0
	STA GRP1
	STA ENAM0
	STA NUSIZ0
	STA RESP0	; for EdFTitle
	LDA #DkGray+2
	STA COLUP0
	STA WSYNC
	LDX #5
TEdFLoop
	LDA EdFSprite-1,X
	STA GRP0
	STA WSYNC
	DEX
	BNE TEdFLoop
	STX GRP0

; repair stack
	LDX StackSave
	TXS
	STA WSYNC	; gets us to 262 scan lines
	JSR DoOverscan
	JMP TitleMainLoop  

DoOverscan
	STA WSYNC
	LDA #2		
	STA VBLANK 	

	IF COMPILE_VERSION = PAL
		LDX #40
	ELSE
		LDX #22
	ENDIF

OverScanWait
	STA WSYNC
	DEX
	BNE OverScanWait
	RTS

ClockStop
	.byte 32, 0, 24, 32, 32
ClockStart
	.byte 0, 16, 0, 0, 8
SoundDelta
	.byte 1, $FE, 1, 1, 2
ControlSound
	.byte $0f, $0C, $08, $06, $01

StartSound
; X = audio channel
; Y = sound selection
	STY WhichSound,X
	LDA ClockStart,Y
	STA SoundClock,X
	LDA ControlSound,Y
	STA AUDC0,X
	RTS

HaloTitle2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
        .byte #%00000000
        .byte #%00000000
H2600Part2
        .byte #%11101110
        .byte #%10101010
        .byte #%10101010
        .byte #%10101010
        .byte #%11101110
        .byte #%00000000
        .byte #%00000000
        .byte #%00000000
HaloPart2
        .byte #%11101110
        .byte #%10001010
        .byte #%10001010
        .byte #%10001010
        .byte #%10001110
HaloTitle
	.byte 0
	.byte 0
	.byte 0
	.byte 0
        .byte #%00000000
        .byte #%00000000
H2600Part1
        .byte #%01110111
        .byte #%01010001
        .byte #%01110111
        .byte #%00010100
        .byte #%01110111
        .byte #%00000000
	.byte #%00000000
        .byte #%00000000
HaloPart1
        .byte #%01010101
        .byte #%01010101
        .byte #%01110111
        .byte #%01010101
        .byte #%01110101
        .byte #%00000000
	.byte 0
	.byte 0

TitleBkColor                ; overlap 2 bytes
    .byte 0
    .byte 0
    .byte Red-4

TitleColorTable
    .byte DkBlue-2
    .byte DkBlue-2
    .byte DkBlue
    .byte DkBlue-2

TitleColorTable2
    .byte LtBlue-3
    .byte LtBlue-3
    .byte LtBlue
    .byte LtBlue-3

; AI States
Dead = $00
Dying = $10
MovingToward = $20
Standing = $30
Shooting = $40
MEJumpTable
	.byte <MEDead-1
	.byte >MEDead
	.byte <MEDying-1
	.byte >MEDying
	.byte <MEMovingToward-1
	.byte >MEMovingToward
	.byte <MEStanding-1
	.byte >MEStanding
	.byte <MEShooting-1
	.byte >MEShooting

; early hmove values
;      0   1   2   3   4   5   6   7   8   9   a   b   c   d   e   f     
; 74  -8  -9 -10 -11 -12 -13 -14 -15   0  -1  -2  -3  -4  -5  -6  -7  **
;
HMPTable
	.byte $60
	.byte $50
	.byte $40
	.byte $30
	.byte $20
	.byte $10
	.byte $00
	.byte $f0
	.byte $e0
	.byte $d0
	.byte $c0
	.byte $b0
	.byte $a0
	.byte $90
	.byte $80

PositionPlayer
	LDY #1
	LDX #RESP0
	LDA XP0
	JSR SetRespx
	STA HMP0

	LDA #5
	SEC
	SBC Facing
	SBC Facing
	TAY
	LDX #RESBL
	LDA XP0
	JSR SetRespx
	STA HMBL
	RTS

; SetRespx	
; A = x position
; X = #RESPx
; Y = fudge factor
SetRespx
	STY Temp
	STA WSYNC
	CLC
	ADC Temp
SRDelay
	SBC #$0F
	BCS SRDelay
	EOR #$07
	ASL
	ASL
	ASL
	ASL
	STA 0,X	; RESPx
	RTS	

EndOfHalo2600


ENDOFDATA
	org $FFFC
	.word Start
	.word Start


