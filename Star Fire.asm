    processor  6502
    include    vcs.h
    include    macro.h

;----------------------------------------------------------
; 4K GAME
;----------------------------------------------------------

; Compile switches

NTSC                    = 0
PAL                     = 1 
COMPILE_VERSION         = NTSC

MAXOBJECTS      = $09   ; if changed, change radar shifttab as well!!!!
LINES           = $3F
NUM_STARS       = $06

    SEG.U vars
    ORG $80

; Both Banks:
gameState       ds 1                ; X/X/X/X/X/X/X/INTRO
bcdScore        ds 3                ; Last/Current score
bcdWave         ds 1                ; desired/current wave
bcdWaveBak      ds 1                ; desired/current wave
waveCounter     ds 1                ; desired/current wave
shieldState     ds 1                ; 0-5
frameCounter    ds 1                ; Incremented every frame
rnd             ds 1                ; Random #
tempVar1        ds 1
tempVar2        ds 1
tempVar3        ds 1
tempVar4        ds 1

; This Bank:
radarX          ds #MAXOBJECTS-1    ; horizontal position of radar
radarY          ds #MAXOBJECTS-1    ; vertical position of radar
xpos            ds #MAXOBJECTS      ; horizontal position of sprites
ypos            ds #MAXOBJECTS      ; vertical position of sprites
xymov           ds #MAXOBJECTS      ; horizontal motion for sprite
zmov            ds #MAXOBJECTS      ; horizontal motion for sprite
sprtsizetype    ds #MAXOBJECTS      ; list of sprite colors
vline           ds 1                ; current vertical line being drawn
p0count         ds 1                ; number of lines left to draw for player 0
tieshapeptr     ds 2                ; 
tieshapeptr2    ds 2                ;
laserCounter    ds 1                ; Decremented every frame
expCounter      ds 1                ; Decremented every frame
crashCounter    ds 1                ; Decremented every frame
warpCounter     ds 1                ; Decremented every frame
shotCounter     ds 1                ; Decremented every frame
motherCounter   ds 1                ; Decremented everytime the mothership is hit
shotcountinit   ds 1                ; Start value for shotCounter
shotspeedinit   ds 1                ; Start value for shot speed
specialon       ds 1                ; 00: ready to launch FF: already on
shipCounter     ds 1                ; Current # of ships
StarPosY        ds NUM_STARS        ; Y-positions of the stars
StarPosX        ds NUM_STARS        ; X-positions of the stars
bVoidHandled    ds 1                ; Flag if void obj was handled
waveTimer       ds 1                ; indicating the length of the wave
laserHeat       ds 1                ; Laser heat 0-F
audioVolume     ds 1                ; For SFX
audioFreq       ds 1                ; For SFX
yposBackup      ds 3                ; Starfield info for kernel
tempPtr         ds 2                ; temp pointer

    SEG     Bank0
    ORG     $1000
    RORG    $D000

ShowCrash 
    STA HMOVE
    LDA rnd              ; Set Crash Pointer:
    STA tempVar1         ; 1. Random Lo-byte
    EOR frameCounter     ;
    AND #$07             ;
    ORA #$D0             ;
    STA tempVar1+1       ; 2. Random Hi-byte between D0-D7
    LDA (tempVar1),Y     ;
    TAX
    DEY
    LDA (tempVar1),Y     ;
    STA WSYNC
    STA HMOVE
    STA GRP0             ;
    STA COLUP0           ; Random Shape & Color for Player 0
    STA ENAM0            ; Enable Missile 0 or don't :-)
    STA HMP0             ; Random movement for player 0
    STA NUSIZ0           ; Random size/# for player/missle 0
    STX GRP1             ;
    STX COLUP1           ; Random Shape & Color for Player 1
    STX ENAM1            ; Enable Missile 1 or don't :-)
    STX HMP1             ;
    STX NUSIZ1           ; Random size/# for player/missle 0
    DEY                  ; new Pointer to random values
    LDA (tempVar1),Y     ;
    STA HMM0             ; Random movement for player 1, missile 0
    DEY
    LDA (tempVar1),Y     ;
    STA HMM1             ; Random movement for player 1, missile 0
    LDY #$7F             ; Yet another $7F lines to do!
    STX AUDF0            ; Do some funny crash sound
    STX AUDF1
    STY AUDV0
    STY AUDV1


FinishScreen
    STA WSYNC            ;
    STA HMOVE            ; Proceed black/crash display...
    DEY                  ;
    BPL FinishScreen     ; ...until Y expires.
    JMP PostCrash        ;

MainScreen
;-----------------------------------------------------------
;SPACE DISPLAY KERNEL TOP
;-----------------------------------------------------------

    STA WSYNC
    STA HMOVE

    JSR AnyRTS      ; Waster block
    JSR AnyRTS
    PHA
    PLA
    LDX #%10000000  ; Prepare for warp waste if no warp
    LDY #$00        ; Prepare for warp waste if no warp

    LDA warpCounter
    BEQ NoWarp
    JMP ShowWarp
NoWarp

    LDX tempVar1
    LDA #LINES+1          ; number of lines to draw on screen
    STA vline
    LDY #$00
    STY COLUBK
    STY PF2
    LDA #%10000000
    STA tempVar1    ; Init p0count
    STA PF1

    LDA crashCounter     ; In crashing mode?
    BNE ShowCrash

;-----------------------------------------------------------
;SPACE DISPLAY KERNEL
;-----------------------------------------------------------

NextLine
    STA WSYNC           ; Wait for horizontal sync
    STA HMOVE           ; Horizontal Movement

; Reset stack to RESBL
    TXA                 
    LDX #$1F
    TXS
    TAX                 

; Draw starfield
    LDY vline
    CPY yposBackup+2
    PHP
    CPY yposBackup+1
    PHP
    CPY yposBackup
    PHP
    LDA crosshair,Y
    STA PF2

; To reposition or not to reposition?
    LDY tempVar1        ; Are we to reposition a sprite?
    BMI Notstart        ; N: Skip first kernel part

    LDA #$FF
    STA tempVar1    ; Clear Draw Flag

    DEC vline           ; A line *wasted* with repositioning...

; Set new ships size
    LDY sprtsizetype,X
    LDA shapeheight,Y
    STA p0count         ; Set object size

; Prepare Positioning ship
    LDA xpos,X      ; A = desired X-position!
    CLC
    ADC #$02        ;
    STA WSYNC
    STA HMOVE       ; Begin repositioning scannline

.wait
    SBC #$0F        ; Battlezone calculate/wait
    BCS .wait       ; 2 in 1 magic !
    AND #$0F        ; Manuels "forget about EOR/ASL
    TAY             ; nonsense" magic :-)
    LDA hmovetab,Y  ;
    STA HMP1        ; Fine Position sprite 1
    SBC #$0F        ; carry is clear, so subtract $0F instead of $10
    STA HMP0            ; Fine Position 1 pixel corrected sprite 2
    STA RESP0       ;
    STA RESP1       ;
    JMP NextLine    ; Immediate WSYNC/HMOVE follows!

.NoMothership3
    STA HMOVE           ; Horizontal Movement
    JMP .NoMothership2

SkipDraw
    LDA shapeclrtab,Y   ; Get sprite color
    CPY #$07
    BCS .NoMothership3
    STA WSYNC
    STA HMOVE           ; Horizontal Movement
    CPY #$03
    BMI .NoMothership2
    SBC motherCounter
.NoMothership2
    STA COLUP0
    STA COLUP1
    LDA #$00
    STA GRP0
    BEQ NotDraw

Notstart
    LDA #$00
    STA HMP0
    STA HMP1

    LDY sprtsizetype,X
    DEC p0count
    BMI SkipDraw
; Set shapes
    LDA shapeptrtab2,Y
    STA tieshapeptr2     ; Set space object pointer
    STA WSYNC
    STA HMOVE           ; Horizontal Movement
    LDA shapeptrtab,Y
    STA tieshapeptr     ; Set space object pointer
    LDY p0count
    LDA (tieshapeptr),y
    STA GRP0
    LDA (tieshapeptr2),y

NotDraw
    STA GRP1

    LDY vline
; Ok, the miraculous skipping code 
; I'm trying to comment that as good as possible... :-)

    CPY #$02            ; Y: Are we already to close to the bottom?
    BCC Continue        ; Y: -> Bail out
    LDA xpos,X          ; Next sprite invisible?
    BMI ContinueInv     ; -> Skip to next sprite
    LDA p0count         ; If we are already drawing a sprite
    BPL Continue        ; -> bail out completely
    TYA
    CMP ypos,X          ; Check if sprite starts now
    BNE CheckDoable     ; N: Check if we already passed it's line
    LDA #$00            ;
    STA tempVar1        ; N: Set reposition flag
    BEQ Continue        ; Bail out

CheckDoable
    BPL Continue        ; We've to wait some more for this sprite...

Continue2
    DEX                 ; Oh, we're too late for this one, try next
    BPL Continue        ;
    LDX #$00            ; We should never have an index < 0

Continue
    DEY                 ; Decrease scannline by one
    STY vline           ; Store it away...
    BMI Radar
    JMP NextLine

; We eventually manage to skip away two invisible sprites in a row
ContinueInv
    DEX                 ; Oh, we're too late for this one, try next
    BPL ContinueInv2    ;
    LDX #$00            ; We should never have an index < 0
ContinueInv2
    LDA xpos,X          ; Next sprite invisible?
    BMI Continue2       ; -> Skip to next sprite
    BPL Continue

;-----------------------------------------------------------
; RADAR DISPLAY KERNEL
;-----------------------------------------------------------

PostCrash
Radar
    STA WSYNC
    STA HMOVE
    STY PF1
    STY PF2
    INY
    STY GRP0
    STY GRP1
    STY ENABL
    STY ENAM0
    STY ENAM1

    LDY #$04
LaserHeatLoop    
    STA WSYNC
    STA HMOVE
    LDX laserHeat
    LDA laserHeattab1,X
    STA PF1
    LDA laserHeattab2,X
    STA PF2
    NOP
    LDA VSYNC   ; Waste 5 cycles
    LDA #$42
    STA COLUPF
    LDX #$FF
    TXS
    JSR AnyRTS
    NOP
    NOP
    NOP
    NOP
    NOP
    LDX shieldState
    INX
    LDA shieldcolortab,X
    STA COLUPF
    DEY
    BPL LaserHeatLoop

    STA WSYNC
    STA HMOVE
    STY PF1
    STY PF2
    INY             ; Unnecessary, but I left them 
    STY GRP0        ;
    STY GRP1        ; 
    STY ENABL       ; to keep the timing intact
    LDA #$1F
    STA vline
    LDA #$05
    STA NUSIZ1

    IF COMPILE_VERSION = PAL
        LDA #$2A
    ELSE
        LDA #$1A
    ENDIF

    STA COLUP1
    LDA #$B0
    STA HMP1  ; Waste a cycle
    STA RESP1
    LDA #$44
    STA COLUP0
    STY ENAM0            ;
    STY ENAM1            ; prevent post-crash object bleeding :-)
    STA WSYNC           ; Wait for horizontal sync
    STA HMOVE           ; Horizontal Movement

    IF COMPILE_VERSION = PAL
        LDY #$BA            ;
    ELSE
        LDY #$8A
    ENDIF

    LDA shieldState
    BPL RadarColorsOk
    LDY #$00
    STY COLUP0
    STY COLUP1
RadarColorsOk
    STY COLUBK

    LDA shieldState
    CMP #$01
    BCS .RadarOk
    LDA rnd
    STA NUSIZ0

.RadarOk
    STA HMCLR

    STA WSYNC           ; Wait for horizontal sync
    STA HMOVE           ; Horizontal Movement
    LDX #MAXOBJECTS-2
GetStartingIndex
    LDA radarY,X

    BPL GetIndexDone
    DEX
    CPX #$04
    BNE GetStartingIndex

GetIndexDone
    LDA vline
    JMP NextLine2

laserHeattab1
    .byte %10000000
    .byte %10000000
    .byte %10000000
    .byte %10000000
    .byte %10000000
    .byte %10000000
    .byte %10000000
    .byte %10000000
    .byte %10000000
    .byte %10000001
    .byte %10000011
    .byte %10000111
    .byte %10001111
    .byte %10011111
    .byte %10111111

laserHeattab2
    .byte %00000000
    .byte %10000000
    .byte %11000000
    .byte %11100000
    .byte %11110000
    .byte %11111000
    .byte %11111100
    .byte %11111110
    .byte %11111111
    .byte %11111111
    .byte %11111111
    .byte %11111111
    .byte %11111111
    .byte %11111111
    .byte %11111111
    .byte %11111111

    ORG     $1200
    RORG    $D200

NextLine2
    STA WSYNC           ; Wait for horizontal sync
    STA HMOVE           ; Horizontal Movement
    STY ENAM0

; To reposition or not to reposition?
    CMP radarY,X
    BNE Notstart2        ; N: Skip first kernel part
    
    TAY
    LDA radarsprite,Y
    STA GRP1
    NOP

    LDY radarX,X
    LDA movetab,Y
    STA HMM0
    AND #$0F
    TAY
; Go! Position it!  
PosLoop3
    DEY
    BPL PosLoop3
    STA RESM0
    DEC vline
    LDA #$0F
    STA PF2
    LDA vline
    BPL NextLine2
    BMI RadarDone

Notstart2
    BCS RadarOk
    DEX
    BPL RadarOk
    LDX #$00
RadarOk
    TAY
    LDA radarsprite,Y
    STA GRP1
    LDY #$00
    STY HMM0
    JSR AnyRTS
    NOP
    DEC vline           ; Store it away...
    LDA #$0F
    STA PF2
    LDA vline
    BPL NextLine2

RadarDone
    STA WSYNC
    STA HMOVE           ; Horizontal Movement
    LDA #$00
    STA NUSIZ1
    STA NUSIZ0
    STA ENAM0
    LDA #$FF
    STA PF2
    LDY #$03
    JSR CockpitFrame

    LDA #$02            ;
    STA VBLANK          ;   start vertical blanking

    IF COMPILE_VERSION = PAL
        LDA #$41            ;
    ELSE
        LDA #$23
    ENDIF

    STA TIM64T          ; 30 lines overscan

;-----------------------------------------------------------
; BANKSWITCH 
;-----------------------------------------------------------

    LDY #$01            ; Game Over!
    LDA SWCHB
    LSR
    BCS .Continue3
    BCC GameOver

.Continue3
    LDA crashCounter
    BEQ .Continue2
    DEC crashCounter
    BNE .Continue2
    LDA #$00
    STA AUDV0
    STA AUDV1
    LDA gameState
    BEQ .Continue2
    BNE GameOver

.Continue2
    LDA warpCounter
    BEQ .Continue4
    DEC warpCounter
    BNE .Continue4
    LDY #$00             ; Game still running!
GameOver
    STY gameState
    JMP SwitchToBank1

.Continue4
    JSR Joy
    JMP OverscanLoop

;-----------------------------------------------------------
; CARTRIDGE MAIN ENTRY & INIT
;-----------------------------------------------------------

MainGame
    LDA #$00
    STA VDELP1
    STA AUDV0
    STA AUDV1           ; Minimal reset
    STA NUSIZ0
    STA NUSIZ1
    STA radarX          ; Important!!!
    STA gameState       ; Game on!
    STA crashCounter    ; No Crash!
    STA warpCounter     ; No Warp!
    STA shipCounter     
    STA specialon
    STA audioVolume
    STA expCounter
    STA laserHeat       ; Cool down laser
    LDX #MAXOBJECTS-1
ClearRadar
    STA radarX,X          ; Important!!!
    DEX
    BPL ClearRadar

    LDA #$0A
    STA waveTimer

    LDA #%00100000
    STA laserCounter

    LDA #$08            ; reflect spaceships
    STA REFP1

    LDA #$05
    STA CTRLPF          ; Refleceted high priority PF

; Init correct GFX page    
    LDX #>tieshape08
    LDA waveCounter
    AND #%00000010
    BEQ SpriteTableOk
    LDX #>advshape08

SpriteTableOk
    STX tieshapeptr+1
    STX tieshapeptr2+1

; Init Objects

    LDX #MAXOBJECTS-1

; 1. Init Shots
    LDA #$C0
    STA xpos,X
    LDA #$00
    STA sprtsizetype,X
    DEX

; 2. Init void objects
    LDA #$07
InitVoids
    STA sprtsizetype,X
    DEX
    BPL InitVoids

; Init shotcountinit
    LDA waveCounter
    CMP #19
    BCC DifficultyFine
    LDA #19
DifficultyFine
    TAY
    LDA shotcounttab,Y
    STA shotcountinit
    STA shotCounter
    LDA shotspeedtab,Y
    STA shotspeedinit

; Inc shields by one
    LDA shieldState         ; Repair shield
    CMP #$05
    BEQ .ShieldIsFull2
    INC shieldState
.ShieldIsFull2

OverscanLoop
    LDA INTIM
    BNE OverscanLoop

;-----------------------------------------------------------
; SCREEN MAIN LOOP START WITH VSYNC
;-----------------------------------------------------------

    VERTICAL_SYNC

;-----------------------------------------------------------
; HANDLE COUNTERS/TIMERS
;-----------------------------------------------------------

    IF COMPILE_VERSION = PAL
        LDA #$4A
    ELSE
        LDA #$2C
    ENDIF

    STA TIM64T  ; set timer for next wait

    LDX shieldState
    INX
    LDA shieldcolortab,X
    STA COLUPF          ; PF color

    LDA #$3F             ; difficulty A
    BIT SWCHB
    BVS SlowLaserRecover
    LDA #$1F             ; difficulty B
SlowLaserRecover
    AND frameCounter
    BNE LaserHeatOk
    DEC laserHeat
    BPL LaserHeatOk
    LDA #$00
    STA laserHeat
LaserHeatOk    

    INC frameCounter
    BNE .WaveTimerOk
    DEC waveTimer
    BPL .WaveTimerOk
    INC waveTimer
.WaveTimerOk
    LDA shotCounter
    BEQ .shotCounterOk
    DEC shotCounter

.shotCounterOk
    LDA expCounter
    BEQ .expCounterOk
    DEC expCounter

.expCounterOk
    JSR Random

    JSR FlickerSort

    JSR Starfield

;-----------------------------------------------------------
; SOUNDFX
;-----------------------------------------------------------

; 1. Do explosion sound
       LDA expCounter
       BEQ .ExplosionDone
       LSR
       LSR
       CMP #$04
       BCS explosionSFXOk
       LDA #$04
explosionSFXOk
       STA    AUDV0
       LDA    Random
       ORA    #$18
       STA    AUDF0
       BNE .Channel0FXDone

; 2. Do laser sound
.ExplosionDone
       LDA laserCounter
       LSR
       LSR
       LSR
       LDY INPT4
       BMI .DoneLaser
       CMP #$04
       BCC .DoneLaser
       STA AUDF0
       LDA #$0F
       STA AUDC0
       LDA #$06
       STA AUDV0
       BNE .Channel0FXDone

; 3. Do Engine sound
.DoneLaser
       LDA #$08
       STA AUDC0
       LDA #$03
       STA AUDV0
       LDA #$FF
       STA AUDF0

.Channel0FXDone
    LDA frameCounter    ;
    LSR
    BCC ChannelDone     ; N: channel done
    LDA audioVolume     ; Y: A -> current volume > 0?
    BEQ ChannelDone     ; N: channel done
    DEC audioVolume     ; Y: turn the volume down...
    LDA audioVolume     ;
    STA AUDV1           ;
    INC audioFreq       ; ...and increment the frequency
    LDA audioFreq       ;
    STA AUDF1           ;
ChannelDone



;-----------------------------------------------------------
; HANDLE HALFSPRITE
;-----------------------------------------------------------

    LDY #$00
    STY p0count ; Assume no half-sprite

; Loop over all space objects, try finding the top 
; half-sprite, if it exists

    LDX #MAXOBJECTS-1   ; all objects

SearchHalfSprite
    LDA xpos,x
    BMI TryNext         ; Sprite invisible, bail out
    LDY sprtsizetype,X  ; Preload Y with type
    LDA ypos,X          ; Sprite start already below screen start
    CMP #$42            ; Sprite starts on top of screen 
    BCC Loop2           ; Bail out!
    SBC shapeheight,Y   ; ypos-height
    STA tempVar1        ; Store temporary
    CMP #$42            ;
    BCC DoHalfSprite    ; Sprite not done before screen starts? Gotcha!

TryNext
    DEX                 ;
    BPL SearchHalfSprite; continue search

    LDX #MAXOBJECTS-1   ; we didn't find any half-sprite, set X

Loop2
    LDY INTIM
    BNE Loop2       ;   waste time
    STX tempVar1

    STA HMCLR       ; Half-sprite!
    STA WSYNC
    STA HMOVE
    STY VBLANK          ; End vertical blanking
    STY COLUBK
    DEY
    STY PF0
    STY PF1
    STY PF2

    LDY #$02
    JSR CockpitFrame

    LDA #$42
    LDY shieldState
    BPL BackgroundFine
    LDA #$00                    ; Shield color black
BackgroundFine
    STA tempVar3
    INY
    LDA shieldtab,Y
    STA tempVar2

    LDY #$0C
    
    JSR AnyRTS
    NOP
    NOP

    LDA #%11100111
    STA PF2

ShieldLine

    IF COMPILE_VERSION = PAL    ; Shield dot color
        LDA #$52
    ELSE
        LDA #$C2
    ENDIF

    STA WSYNC
    STA HMOVE
    STA.w COLUBK
    LDX #%10011100
    STX PF1
    NOP
    LDX tempVar2
    BMI SkipoWait

ShieldLoop    
    DEX
    BNE ShieldLoop

    LDA tempVar3
    STA COLUBK

SkipoWait
    DEY
    BNE ShieldLine

    STA WSYNC
    STA HMOVE
    LDA #$FF
    STA PF0
    STA PF1
    STA PF2

    LDY #$01
    JSR CockpitFrame

    JMP MainScreen

DoHalfSprite
    LDA #$42            ; Calculate drawable size of the half-sprite
    SBC tempVar1
FullSprite
    STA p0count         ; Store the remaing sprite lines
    LDA shapeclrtab,Y   
    CPY #$07
    BCS .NoMothership4
    CPY #$03
    BMI .NoMothership4
    SBC motherCounter
.NoMothership4
    STA COLUP0
    STA COLUP1          ; Set half-sprite color
    LDA xpos,X      ; A = desired X-position!
    ADC #$01
    STA WSYNC       ;
    STA HMOVE       ; Same timing as in kernel!

.wait2
    SBC #$0F        ; Battlezone calculate/wait
    BCS .wait2       ; 2 in 1 magic !
    AND #$0F        ; Manuels "forget about EOR/ASL
    TAY             ; nonsense" magic :-)
    LDA hmovetab,Y  ;
    STA HMP1        ; Fine Position sprite 1
    SBC #$0F        ; carry is clear, so subtract $0F instead of $10
    STA HMP0        ; Fine Position 1 pixel corrected sprite 2
    STA RESP0       ;
    STA RESP1       ;
    STA WSYNC       ;
    STA HMOVE       ; Begin repositioning scannline
    JMP Loop2           ; Kick into display kernel

;-----------------------------------------------------------
;FLICKER SORT SUB
;-----------------------------------------------------------
   
FlickerSort:
    LDX #MAXOBJECTS-2
SortLoop:
    LDY sprtsizetype+1,X    ; A-> 1st sprite type and size
    LDA ypos+1,X            ; A-> 1st sprite ypos
    SBC shapeheight,Y       ; A-> 1st sprite ypos - size
    SBC #$03                ; Fix skipping problem
    CMP ypos,X              ; 2nd Sprite drawable?
    BPL DontSwap            ; Y: All right!
SwapThis
    LDA xpos,X              ; N: Swap horizontal position
    LDY xpos+1,X
    STA xpos+1,X
    STY xpos,X
    LDA ypos,X                ; Swap vertical position
    LDY ypos+1,X
    STA ypos+1,X
    STY ypos,X
    LDA xymov,X             ; Swap horizontal movement
    LDY xymov+1,X
    STA xymov+1,X
    STY xymov,X
    LDA zmov,X             ; Swap horizontal movement
    LDY zmov+1,X
    STA zmov+1,X
    STY zmov,X
    LDA sprtsizetype,X             ; Swap size & type
    LDY sprtsizetype+1,X
    STA sprtsizetype+1,X
    STY sprtsizetype,X
DontSwap:
    DEX
    BPL SortLoop

; Search border Y value
    LDX #MAXOBJECTS-1
RadarFind
    LDA ypos,X
    CLC 
    ADC #$20
    BPL YValueFound
    DEX
    BNE RadarFind
YValueFound

; Prepare Radar
    LDY #MAXOBJECTS-2
RadarSort
    LDA sprtsizetype,X
    CMP #$03
    BCC NextRadarElem
    CMP #$20
    BCC SkipShip
    LDA warpCounter         ; No Radar when warping
    BNE SkipShip
    LDA xpos,X
    CLC 
    ADC #$40
    LSR
    LSR
    LSR
    STA radarX,Y
    LDA ypos,X
    CLC 
    ADC #$20
    AND #%01111111
    LSR
    LSR
.Continue
    STA radarY,Y
NextRadarElem
    LDA radarshifttab,X
    TAX
    DEY
    BPL RadarSort
AnyRTS
    RTS

SkipShip
    LDA #$FF
    BMI .Continue

;-----------------------------------------------------------
;JOYSTICK READING
;-----------------------------------------------------------

; Reading the joystick

Joy     
    LDA warpCounter     
    BNE AnyRTS      ; Don't do anything when warping
        
        LDX #$00
        LDA SWCHA

        BIT SWCHB       ; Swap Y-Axxis according to switch
        BPL .NoYSwap
        EOR #%00110000

.NoYSwap
        ASL
        BCS RightDone
        DEX             ; X = FF!

RightDone
        ASL
        BCS LeftDone
        INX             ; X = 1!

LeftDone
        STX tempVar1
        LDX #$00        ; X = 0!
        ASL
        BCS DownDone
        DEX             ; X = FF!
DownDone
        ASL
        BCS UpDone
        INX             ; X = 1!
UpDone
        STX tempVar2

;-----------------------------------------------------------
;INTELLIGENT MOVE AND HANDLE ALL SPACE OBJECTS 
;-----------------------------------------------------------

    LDA #$00
    STA bVoidHandled

    LDX #MAXOBJECTS-1

MoveNextSprite
    JSR GeneralMovement     ; General Movement

; Handle enemy ships
    LDA sprtsizetype,X
    CMP #$28
    BMI NoShipSprite
    DEC shipCounter         ; Silly trick pt.1...
    JSR HandleCollision     ; Handle Collision
    INC shipCounter         ; Silly trick pt.2...
    LDA #%01111110
    STA tempVar4            ; Ships are slow on z axxis
    JSR ZMovement           ; Move along the z axxis

    TYA                     ; Special ship handling
    BEQ .Spritedone2
    LDA zmov,X
    ASL
    BCS .Incoming2
    DEC shipCounter

    LDA #$07
    STA sprtsizetype,X      ; Remove Object
    BNE .Spritedone2
    
.Incoming2
    LDA sprtsizetype,x
    ADC #$06
    STA sprtsizetype,x      ; Special ship handling

.Spritedone2
    JMP Spritedone          ; Done

; Handle gates
NoShipSprite
    CMP #$20
    BMI NoGateSprite
    CPY #$00
    BNE .GateCollisionDone
    DEY
    STY warpCounter         ; Init Warp Sequence!

    TAY
    LDA scoretab,y       ; difficulty A
    BIT SWCHB
    BVS HigherScores2
    LDA scoretab2,y      ; difficulty B
HigherScores2
    JSR AddScore
    
.GateCollisionDone
    LDA #%00000110
    STA tempVar4            ; gates are very quick on z axxis
    JSR ZMovement           ; Move along the z axxis

    TYA                     ; Special gate handling
    BEQ .Spritedone2
    LDA #$20
    STA sprtsizetype,X      ; Special gate handling

; Handle diamonds
NoGateSprite
    CMP #$18
    BMI NodiamondSprite
    CPY #$00
    BNE .DiamondCollisionDone
    STY specialon
    LDY shieldState         ; Repair shield
    CPY #$05
    BEQ .ShieldIsFull
    INC shieldState

.ShieldIsFull
    JSR HandleCollision2    ; Handle Collision

.DiamondCollisionDone
    LDA #%01111110
    STA tempVar4            ; diamonds are slow on z axxis
    JSR ZMovement           ; Move along the z axxis

    TYA                     ; Special diamond handling
    BEQ .Spritedone2
    LDA #$00                ; remove a special object!
    STA specialon
    LDA #$07
    STA sprtsizetype,X      ; Special diamond handling
    BNE .Spritedone2

; Handle shots
NodiamondSprite
    CMP #$10
    BMI NoShotSprite
    JSR HandleCollision     ; Handle Collision
    LDA shotspeedinit
    STA tempVar4            ; Shots are quick on z axxis
    JSR ZMovement           ; Move along the z axxis

    LDA xpos,X              ; Special shot handling
    BMI .RemoveShot
    LDA ypos,X
    CMP #$3F
    BCS .RemoveShot
    TYA
    BEQ .Spritedone3

    LDA crashCounter        ; Only one hit at a time!
    BNE .RemoveShot

    LDA #$08
    STA AUDC1
    STA AUDC0
    DEC shieldState         ; Shield damage!
    BPL .ShieldDone

    LDA #$01                ; Game Over!
    STA gameState       
    LDA #$80
    STA crashCounter
    BNE .RemoveShot
    
.ShieldDone
    LDA #$10                 ; We're hit!
    STA crashCounter

.RemoveShot
    LDA #$07
    STA sprtsizetype,X
    BNE .Spritedone3

; Handle Explosions
NoShotSprite
    CMP #$08
    BMI NoExplosionSprite
    LDA #%01111110
    STA tempVar4            ; explosions are slow on z axxis
    JSR ZMovement           ; Move along the z axxis

    TYA                     ; Special Explosion Handling
    BNE .RemoveShot
    LDA expCounter
    BEQ .RemoveShot
    AND #%00000111
    BNE .Spritedone3
    LDA sprtsizetype,X
    EOR #%00000001
    STA sprtsizetype,X      ; Special Explosion Handling
.Spritedone3
    JMP Spritedone          ; Done

; Handle void object
NoExplosionSprite
    CMP #$07
    BMI NoVoidObject
    LDA xpos,X
    ORA #%10000000
    STA xpos,X
    LDA bVoidHandled
    BMI .Spritedone3
    DEC bVoidHandled

    LDA waveTimer   ; Spawn a Warp Gate?
    BNE NoWarpSpawn
    JMP AddGate     ; Spawn a Gate!

NoWarpSpawn         ; Spawn a Ship?
    LDA waveCounter
    AND #$03
    TAY
    LDA shiptab,Y
    CMP shipCounter
    BCC NoShipSpawn
    JMP AddShip     ; Spawn a Ship!

NoShipSpawn
    LDA frameCounter    ; Spawn a Mothership?
    CMP #$40
    BNE NoMotherSpawn
    JMP AddMotherShip   ; Spawn a Mothership!

NoMotherSpawn
    CMP #$C0            ; Spawn a Diamond?
    BNE NoDiamondSpawn
    JMP AddDiamond      ; Spawn a Diamond!
    
NoDiamondSpawn
    LDA shotCounter     ; Spawn a Shot?
    BNE .NoSpawn
    JMP AddShot         ; Spawn a Shot!
.NoSpawn
    BNE .Spritedone3


; Handle mother ship
NoVoidObject
    CMP #$03
    BMI NoMothership

    STA tempPtr         ; Remember A

    LDA frameCounter
    AND #$03
    BNE NoSlaveI2

    LDA waveCounter     ; Move 1.5 pixels
    AND #%00000011
    BNE NoStarDestroyer2
    INC xpos,X
NoStarDestroyer2
    CMP #$03
    BNE NoSlaveI2
    INC ypos,X
NoSlaveI2

    TYA     
    BNE .Spritedone3    ; Mothership was hit?

    LDA #$01            ; Shot sound
    STA AUDC1
    LDA #$10            ; Volume 10
    STA audioVolume     ; Set volume
    LDA #$10            ; Start with pitch 5...
    STA audioFreq       ; ...It's increased from there

    LDA waveCounter     ; Begin evasive maneuvers
    AND #%00000011
    BNE NoStarDestroyer
    LDA xymov,X
    AND #%11110011
    STA xymov,X
    LDA frameCounter
    AND #%00001100
    ORA xymov,X
    STA xymov,X

NoStarDestroyer
    CMP #$03
    BNE NoSlaveI
    LDA xymov,X
    AND #%11111100
    STA xymov,X
    LDA frameCounter
    AND #%00000011
    ORA xymov,X
    STA xymov,X

NoSlaveI
    DEC motherCounter   ; Mothership dead?
    BPL Spritedone      ;

    LDA #$00
    STA specialon       ; Clear special!

    LDA tempPtr
    JSR HandleCollision2; Handle Collision

; Handle laser
NoMothership
    LDA frameCounter
    LSR                 ; Preset carry!
    LDA laserCounter
    BMI .CheckFire       
    BCC .DontCount
    SBC #$04
    STA laserCounter
    BMI .CheckFire       
.DontCount
    TAY
    LDA laserxpos,Y
    STA xpos,X
    LDA laserypos,Y
    STA ypos,X
    TYA
    LSR
    LSR
    TAY
    LDA lasertype,Y
    STA sprtsizetype,X
    JMP Spritedone

.CheckFire
    LDY #$D0
    STY xpos,X
    STY ypos,X
    LDY INPT4
    BMI Spritedone

    CLC
    ADC #$01
    AND #%00000011
    ORA #%00100000
    TAY

    LDA laserHeat
    CMP #$0E
    BNE LaserOk
    LDY #$FF
    DEC laserHeat       ; Laser heat not up!
LaserOk
    STY laserCounter
    INC laserHeat       ; Laser heat up!

Spritedone
    DEX
    BMI Handlerdone
    JMP MoveNextSprite
Handlerdone
    RTS

;-----------------------------------------------------------
;ADD NEW SHIP
;-----------------------------------------------------------

AddShip
    JSR Random
    STA zmov,x
    ORA #%10000000       
    STA xpos,X
    AND #$0F
    STA xymov,x
    AND #%00001010
    BNE .XYMovementFine
    LDA xymov,x
    ORA #%00001010
    STA xymov,x

.XYMovementFine
    LDA waveCounter
    AND #$03        ;(0-3)
    TAY
    JSR Random
    AND #$7F
    STA ypos,X
    AND #$07
    ORA wavecolortbl,Y
    STA sprtsizetype,X
    INC shipCounter
    JMP Spritedone

;-----------------------------------------------------------
;ADD NEW MOTHERSHIP
;-----------------------------------------------------------

AddMotherShip
    LDA specialon
    BNE .ShipDone
    JSR Random
    ORA #%10000000
    STA specialon
    STA xpos,X
    LDA waveCounter
    AND #$03        ;(0-3)
    TAY
    JSR Random
    AND #$7F
    STA ypos,X
    LDA wavecolortbl2,Y
    STA sprtsizetype,X
    LDA mothermovetbl,Y
    STA xymov,x
    LDA #$0D            ; Make this tabled?
    STA motherCounter
.ShipDone
    JMP Spritedone

;-----------------------------------------------------------
;ADD NEW SHOT
;-----------------------------------------------------------

AddShot
    LDY #MAXOBJECTS/2   ; Only check half the objects...

.SearchAttacker
    LDA sprtsizetype,Y
    CMP #$28
    BMI .CheckNext
    AND #$07
    STA tempVar3
    LDA xpos,Y
    BMI .CheckNext
    LDA ypos,Y
    CMP #$3F
    BCS .CheckNext
    SBC tempVar3
    STA ypos,X
    LDA xpos,Y
    STA xpos,X
    LDA #%10000110
    STA zmov,X
    LDA #$00
    STA xymov,X
    LDA tempVar3
    LSR 
    ORA #$10            ; Shotsize depends on enemy size!
    STA sprtsizetype,X
    LDA #$08            ; Shot sound
    STA AUDC1
    LDA #$10            ; Volume 10
    STA audioVolume     ; Set volume
    LDA #$05            ; Start with pitch 5...
    STA audioFreq       ; ...It's increased from there

    LDA waveCounter     ; Tie Advance behaviour!
    AND #%00000010
    BEQ SpriteMoveOk
    LDA rnd
    AND #$0F
    STA xymov,Y
    AND #%00001010
    BNE SpriteMoveOk
    LDA xymov,Y
    ORA #%00001010
    STA xymov,Y

SpriteMoveOk
    LDA shotcountinit
    STA shotCounter
    JMP Spritedone

.CheckNext
    DEY
    BPL .SearchAttacker
    JMP Spritedone

;-----------------------------------------------------------
; DO Y BLANK DISPLAY LINES
;-----------------------------------------------------------

CockpitFrame
    STA WSYNC
    STA HMOVE
    DEY
    BNE CockpitFrame
    RTS

;-----------------------------------------------------------
;ITERATE A RANDOM VALUE
;-----------------------------------------------------------

Random
    LDA rnd
    BNE .skipInit
    LDA #$FF
.skipInit:
    ASL
    ASL
    ASL
    EOR rnd
    ASL
    ROL rnd
    RTS

;-----------------------------------------------------------
;HANDLE THE LASER SPRITE
;-----------------------------------------------------------

HandleLaser
    RTS

;-----------------------------------------------------------
;HANDLE GENERAL XY MOVEMENT
;-----------------------------------------------------------

GeneralMovement
    LDY xymov,X
    LDA frameCounter
    LSR
    BCC .EvenFrame
    LDY #$00

.EvenFrame
    TYA
    LSR
    AND #$01
    BCC .MoveRight
    EOR #$FF            ; Carry is set! Excellent!

.MoveRight
    ADC xpos,X          ; Carry is clear! Fine!
    CLC
    ADC tempVar1
    STA xpos,X
    TYA
    LSR
    LSR
    LSR
    BCC .MoveUp
    EOR #$FF            ; Carry is set! Excellent!

.MoveUp
    ADC ypos,X          ; Carry is clear! Fine!
    CLC
    ADC tempVar2
    AND #$7F
    STA ypos,X

;-----------------------------------------------------------
;COLLISION DETECTION
;-----------------------------------------------------------

    LDY sprtsizetype,X
    LDA #$46
    SBC xpos,X
    BMI .NoHit
    SBC #$10
    BPL .NoHit
    LDA #$22
    ADC shapeheight,Y
    SBC ypos,X
    BMI .NoHit
    SBC shapeheight,Y
    BPL .NoHit
    LDA laserCounter
    AND #%11111000 ; Shot expired this or next frame?
    BNE .NoHit
    LDY #$00
    RTS

.NoHit
    LDY #$FF
    RTS

;-----------------------------------------------------------
;HANDLE COLLISION
;-----------------------------------------------------------

HandleCollision
    CPY #$00
    BEQ HandleCollision2
    RTS
HandleCollision2
    TAY

    LDA scoretab,y       ; difficulty A
    BIT SWCHB
    BVS HigherScores
    LDA scoretab2,y      ; difficulty B
HigherScores

    JSR AddScore

    LDA #$00
    STA xymov,X         ; Clear movement
  
    LDY #$03
    LDA sprtsizetype,X  ; SoundFX
    CMP #$07
    BCC SpecialSFX
    LDY #$08
SpecialSFX
    STY AUDC0

    LDA #$40
    STA expCounter
  
    LDA sprtsizetype,X
    AND #%00000110
    ORA #%00001000
    STA sprtsizetype,X
    PLA
    PLA
    JMP Spritedone

;-----------------------------------------------------------
;ADD NEW GATE
;-----------------------------------------------------------

AddGate
    LDA specialon
    BNE .GateDone3
    JSR Random
    ORA #%10000000
    STA xpos,X          ; Gate starts out of sight
    AND #$3F
    STA ypos,X          ; Random y pos
    LDA #%10000111
    STA zmov,x          ; Init gate speed
    LDA #$00
    STA xymov,X         ; No movement
    LDA #$20
    STA sprtsizetype,x  ; Gate type
    STA specialon
    LDA #$20            ; More ferociuos attackers when gate is on
    STA shotcountinit

    LDA #4            ; Shot sound
    STA AUDC1
    LDA #$0F            ; Volume 10
    STA audioVolume     ; Set volume
    LDA #$5            ; Start with pitch 5...
    STA audioFreq       ; ...It's increased from there

    JMP Spritedone
.GateDone3    
    JMP NoDiamondSpawn

AddDiamond
    LDA specialon
    BNE .DiamondDone
    JSR Random
    AND #$7F
    STA xpos,X
    LDA #%10011111
    STA zmov,x
    LDA rnd
    AND #$1F
    ADC #$14
    STA ypos,X
    CMP #$20            ; 2
    LDA diamondxmov,Y    ; 4
    BCS .Movedown       ; 2
    ORA #%00001100      ; 2

.Movedown
    ORA #%00001000      ; 2
    STA xymov,X         ; 4
    LDA #$18
    STA sprtsizetype,x
    STA specialon
.DiamondDone
    JMP Spritedone

;-----------------------------------------------------------
;Z MOVEMENT 
;-----------------------------------------------------------

ZMovement
    LDY #$00            ; NoOverflow
    DEC zmov,X
    LDA zmov,X
    ASL
    BNE .NoZMovement
    LDA sprtsizetype,x
    AND #%11111000
    STA tempVar3
    BCS .Incoming
    DEC sprtsizetype,x
    LDA sprtsizetype,x
    AND #$07
    CMP #$07
    BNE .MoveDone
    LDY #$FF
    JMP .MoveDone

.Incoming
    INC sprtsizetype,x
    LDA sprtsizetype,x
    AND #$07
    BNE .MoveDone
    LDY #$FF

.MoveDone
    ORA tempVar3
    STA sprtsizetype,x
    LDA zmov,X
    ORA tempVar4      ; 11111110 slow - 00011110 fast
    STA zmov,X

.NoZMovement
    RTS

AddScore
    SED
    CLC
    ADC bcdScore+2
    STA bcdScore+2
    LDA bcdScore+1
    ADC #$00
    STA bcdScore+1
    LDA bcdScore
    ADC #$00
    STA bcdScore
    CLD
    RTS

Starfield
    LDA #$00
    STA tempVar2        ; Clear *once* flag

; Read joystick
    LDA SWCHA
    LSR
    LSR
    LSR
    LSR
    EOR #$0F

    BIT SWCHB       ; Swap Y-Axxis according to switch
    BPL .NoYSwap2

    EOR #%00000011
    CMP #$

.NoYSwap2
    STA tempVar1

; Move Stars
    LDA frameCounter
    LSR
    BCS SkipStarsMove

    AND #$01
    ADC #NUM_STARS-2
    TAX
    
.MoveStars
    LDA    StarPosY,X
    LSR
    LSR
    LSR                      ;       a = y-pos/8
    LDY    tempVar1              ;       y = joystick direction
    CLC
    ADC    StarDirYTab,Y     ;       y-pos/8 (0-10) + 0v2v4 (down/-/up)
    TAY
    LDA    StarMoveYTab,Y    ;
    ADC    StarPosY,X
    STA    StarPosY,X
    LDA    StarPosX,X
    LSR
    LSR
    LSR
    LSR                      ;       a = x-pos/16
    TAY
    LDA    StarMoveXTab,Y    ;       -5..+5
    LDY    tempVar1              ;
    CLC
    ADC    StarDirXTab,Y
    CLC
    ADC    StarPosX,X
    STA    StarPosX,X
    DEX
    DEX
    BPL .MoveStars

SkipStarsMove
    LDY #$02
    LDX #NUM_STARS-1
    LDA frameCounter
    LSR
    BCS .LoopStars
    LDX #NUM_STARS-4

.LoopStars
    LDA StarPosX,X
    BMI .ReplaceStar
    LDA StarPosY,X
    BMI .ReplaceStar
    CMP #LINES
    BCC .PosStar

.ReplaceStar
    LDA tempVar2            ; Execute this only once per frame!
    BNE .PosStar
    LDA rnd
    AND #$3F              ;       a = 0..63
    ADC #$1F
    STA StarPosX,X
    LDA rnd
    AND #$0F              ;       a = 0..15
    ADC #$18
    STA StarPosY,X
    STA tempVar2

.PosStar
    LDA StarPosY,X
    STA yposBackup,Y
    LDA StarPosX,X
    CLC
    ADC #$10
    STA WSYNC                ;

.wait1
    SBC #$0F                 ;
    BCS .wait1               ; RESP loop
    EOR #$07                 ;
    ASL                      ;
    ASL                      ;
    ASL                      ;
    ASL                      ;
    STA HMM0,Y
    STA RESM0,Y           ; Position it!
    DEX
    DEY
    BPL .LoopStars
    STA WSYNC             ;
    STA HMOVE             ;
    STA WSYNC
    STA HMCLR
    RTS       


      
;-----------------------------------------------------------
;DATA BLOCK
;-----------------------------------------------------------

    ORG     $1A00       
    RORG    $DA00
;---------------------------------------------------------------------------
; Warp sequence kernel, written by Paul Slocum!
;---------------------------------------------------------------------------

warplines
    ; The warp effect is an 8 frame animation.  The animation
    ; data was generated by a simple C program using a polynomial function.

    ; First frame.  
    ; (Each bit corresponds to a line on the screen.
    ; The data is read forwards for the top half of the display and
    ; backwards for the bottom.)
    byte %00000000, %00000000
   byte %00001100, %00000000, %00001000, %00000001, %10000001, %00001011

    ; Second Frame
    byte %00000000, %00000000
   byte %01100000, %00000000, %00110000, %00000011, %00000011, %00011011

    ; Third Frame
    byte %00000000, %00000001
   byte %10000000, %00000000, %11000000, %00000100, %00000010, %00010011

    ; Fourth Frame
    byte %00000000, %00001100
   byte %00000000, %00000011, %00000000, %00001000, %00000100, %00110011

    ; Fifth Frame
    byte %00000000, %00110000
   byte %00000000, %00001100, %00000000, %00110000, %00001000, %00100111

    ; Sixth Frame
    byte %00000001, %10000000
   byte %00000000, %00110000, %00000000, %01000000, %00010000, %01100101

    ; Seventh Frame
    byte %00001100, %00000000
   byte %00000000, %11000000, %00000001, %10000000, %00100000, %01000101

    ; Eighth Frame
    byte %01100000, %00000000
   byte %00000011, %00000000, %00000110, %00000000, %01000000, %10001101

; Had to move it up here to fit some audio code

ShowWarp
    STA WSYNC
    STA HMOVE
    STY PF2
    STY COLUBK
    STX PF1

    ; Let there be sound
    lda #15
    sta AUDC1
    lda warpCounter
    lsr
    lsr
    lsr
    lsr
    sta AUDF1

    lda #4
    sta AUDV0

    ; Set up line data pointer
    lda #>warplines
    sta tempPtr+1

    lda frameCounter
    asl
    sta tempVar1

    lda frameCounter
    lsr
    and #%111
    sta AUDV1
    tax
    lda Offsets,x
    sta tempPtr

    ; top half
    ldy #0
ScanLoop2   
;---------------------------------------------------------------------------
    ldx #128
InnerLoop2
    sta WSYNC
    STA HMOVE
    txa
    and (tempPtr),y
    beq NoLine2
    tya
    eor #$0F
    ora tempVar1
NoLine2
    sta COLUBK
    txa
    lsr
    tax
    bcc InnerLoop2
    iny
    sty AUDC0
    cpy #8
    bne ScanLoop2


    ; bottom half
    ldy #7
    sty AUDF0
ScanLoop    
;---------------------------------------------------------------------------
    ldx #1
InnerLoop
    sta WSYNC
    STA HMOVE
    txa
    and (tempPtr),y
    beq NoLine
    tya
    eor #$6F
    ora tempVar1

NoLine
    sta COLUBK
    txa
    asl
    tax
    bcc InnerLoop
    dey
    cpy #255
    bne ScanLoop
    sta WSYNC
    STA HMOVE
    JMP PostCrash

shapeheight
    .byte $05,$04,$03,$07,$0E,$0F,$0E,$00
    .byte $03,$03,$06,$06,$0A,$0A,$0D,$0D
    .byte $01,$02,$03,$04,$06,$08,$0C,$0C
    .byte $05,$05,$05,$05,$05,$05,$05,$05
    .byte $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
    .byte $01,$03,$05,$07,$09,$0B,$0D,$0F
    .byte $01,$03,$05,$07,$09,$0B,$0D,$0F
    .byte $01,$03,$05,$07,$09,$09,$0D,$0D
    .byte $01,$03,$05,$07,$09,$09,$0D,$0D

lasertype
    .byte $02,$02,$02,$01,$01,$01,$00,$00,$00

radarsprite
    .byte #$00
    .byte #$00
    .byte #$00
    .byte #$00
    .byte #$00
    .byte #$00
    .byte #$00
    .byte #$00
    .byte #$FF
    .byte #$FF
    .byte #$FF
    .byte #$FF
    .byte #$FF
    .byte #$FF
    .byte #$FF
    .byte #$FF
    .byte #$FF
    .byte #$FF
    .byte #$FF
    .byte #$FF
    .byte #$FF
    .byte #$FF
    .byte #$FF
    .byte #$FF
    .byte #$00
    .byte #$00
    .byte #$00
    .byte #$00
    .byte #$00
    .byte #$00
    .byte #$00
    .byte #$00

shapeclrtab
    IF COMPILE_VERSION = PAL
        .byte $B8,$BA,$BC,$4F,$5F,$DF,$0F,$0F
        .byte $60,$2E,$40,$2E,$60,$2E,$40,$2E
        .byte $60,$60,$62,$62,$64,$64,$66,$66
        .byte $0F,$8E,$0F,$8E,$0F,$8E,$0F,$8E
        .byte $0F,$8E,$0F,$8E,$0F,$8E,$0F,$8E
        .byte $50,$50,$52,$52,$54,$54,$56,$56
        .byte $D0,$D0,$D2,$D2,$D4,$D4,$D6,$D6
        .byte $50,$50,$52,$52,$54,$54,$56,$56
        .byte $D0,$D0,$D2,$D2,$D4,$D4,$D6,$D6
    ELSE
        .byte $98,$9A,$9C,$3F,$CF,$8F,$0F,$0F
        .byte $40,$2E,$30,$2E,$34,$2E,$40,$2E
        .byte $40,$40,$42,$42,$44,$44,$46,$46
        .byte $0F,$5E,$0F,$5E,$0F,$5E,$0F,$5E
        .byte $0F,$5E,$0F,$5E,$0F,$5E,$0F,$5E
        .byte $C0,$C0,$C2,$C2,$C4,$C4,$C6,$C6
        .byte $80,$80,$82,$82,$84,$84,$86,$86
        .byte $C0,$C0,$C2,$C2,$C4,$C4,$C6,$C6
        .byte $80,$80,$82,$82,$84,$84,$86,$86
    ENDIF

shapeptrtab
    .byte #<laser03,#<laser02,#<laser01,#<mothership01,#<mothership03,#<mothership05,#<mothership07,00
    .byte #<explosion02,#<explosion02,#<explosion04,#<explosion04,#<explosion06,#<explosion06,#<explosion08,#<explosion08
    .byte #<shot01,#<shot02,#<shot03,#<shot04,#<shot05,#<shot06,#<shot07,#<shot08
    .byte #<diamond01,#<diamond01,#<diamond01,#<diamond01,#<diamond01,#<diamond01,#<diamond01,#<diamond01
    .byte #<gate01,#<gate02,#<gate01,#<gate02,#<gate01,#<gate02,#<gate01,#<gate02
    .byte #<tieshape01,#<tieshape02,#<tieshape03,#<tieshape04,#<tieshape05,#<tieshape06,#<tieshape07,#<tieshape08
    .byte #<tieshape01,#<tieshape02,#<tieshape03,#<tieshape04,#<tieshape05,#<tieshape06,#<tieshape07,#<tieshape08
    .byte #<advshape01,#<advshape02,#<advshape03,#<advshape04,#<advshape05,#<advshape06,#<advshape07,#<advshape08
    .byte #<advshape01,#<advshape02,#<advshape03,#<advshape04,#<advshape05,#<advshape06,#<advshape07,#<advshape08

shapeptrtab2
    .byte #<laser03,#<laser02,#<laser01,#<mothership02,#<mothership04,#<mothership06,#<mothership08,00
    .byte #<explosion202,#<explosion202,#<explosion204,#<explosion204,#<explosion206,#<explosion206,#<explosion208,#<explosion208
    .byte #<shot01,#<shot02,#<shot03,#<shot04,#<shot05,#<shot06,#<shot07,#<shot08
    .byte #<diamond02,#<diamond02,#<diamond02,#<diamond02,#<diamond02,#<diamond02,#<diamond02,#<diamond02
    .byte #<gate01,#<gate02,#<gate01,#<gate02,#<gate01,#<gate02,#<gate01,#<gate02
    .byte #<tieshape01,#<tieshape02,#<tieshape03,#<tieshape04,#<tieshape05,#<tieshape06,#<tieshape07,#<tieshape08
    .byte #<tieshape01,#<tieshape02,#<tieshape03,#<tieshape04,#<tieshape05,#<tieshape06,#<tieshape07,#<tieshape08
    .byte #<advshape01,#<advshape02,#<advshape03,#<advshape04,#<advshape05,#<advshape06,#<advshape07,#<advshape08
    .byte #<advshape01,#<advshape02,#<advshape03,#<advshape04,#<advshape05,#<advshape06,#<advshape07,#<advshape08

; Page with Space objects

shot04
laser02
       .byte $01 ; |       X| $FE64
       .byte $03 ; |      XX| $FE65
       .byte $03 ; |      XX| $FE66
shot03
laser01
       .byte $01 ; |       X| $FE67
       .byte $03 ; |      XX| $FE5C
shot02
       .byte $01 ; |       X| $FE5D
shot01
tieshape01
advshape01
       .byte $01 ; |       X| $FE4A

shot08:
       .byte $03 ; |      XX| $FEC1
       .byte $0F ; |    XXXX| $FEC2
       .byte $0F ; |    XXXX| $FEC4
       .byte $1F ; |   XXXXX| $FEC5
       .byte $1F ; |   XXXXX| $FEC7
       .byte $3F ; |  XXXXXX| $FEC8
       .byte $3F ; |  XXXXXX| $FEC9
       .byte $1F ; |   XXXXX| $FECB
       .byte $1F ; |   XXXXX| $FECC
       .byte $0F ; |    XXXX| $FECD
       .byte $0F ; |    XXXX| $FECF
       .byte $03 ; |      XX| $FED0

shot07:
       .byte $01 ; |       X| $FED7
       .byte $07 ; |     XXX| $FED8
       .byte $07 ; |     XXX| $FED9
       .byte $0F ; |    XXXX| $FEDA
       .byte $0F ; |    XXXX| $FEDB
       .byte $1F ; |   XXXXX| $FEDC
       .byte $1F ; |   XXXXX| $FEDD
       .byte $0F ; |    XXXX| $FEDE
       .byte $0F ; |    XXXX| $FEDF
       .byte $07 ; |     XXX| $FEE0
       .byte $07 ; |     XXX| $FEE1
       .byte $01 ; |       X| $FEE2

shot06:
       .byte $01 ; |       X| $FE7A
       .byte $07 ; |     XXX| $FE7C
       .byte $07 ; |     XXX| $FE7C
       .byte $0F ; |    XXXX| $FE7D
       .byte $0F ; |    XXXX| $FE7E
       .byte $07 ; |     XXX| $FE7F
       .byte $07 ; |     XXX| $FE7C
       .byte $01 ; |       X| $FE81

shot05:
       .byte $01 ; |       X| $FE6E
       .byte $03 ; |      XX| $FE6F
       .byte $07 ; |     XXX| $FE70
       .byte $07 ; |     XXX| $FE71
       .byte $03 ; |      XX| $FE72
       .byte $01 ; |       X| $FE73

laser03:
       .byte %00000011
       .byte %00000111
       .byte %00000111
       .byte %00000111
       .byte %00000011

explosion08
       .byte %00000001
       .byte %00010000
       .byte %00100100
       .byte %11000010
       .byte %01001111
       .byte %10111101
       .byte %00001010
       .byte %10010010
       .byte %00001010
       .byte %00010001
       .byte %00000011
       .byte %00100000
       .byte %00001001

explosion06
       .byte %00000110
       .byte %00001001
       .byte %00010000
       .byte %00000111
       .byte %00100000
       .byte %00001010
       .byte %00010100
       .byte %00010101
       .byte %00001001
       .byte %00000001

explosion04
       .byte %00000010
       .byte %00000100
       .byte %00001101
       .byte %00000101
       .byte %00000010
       .byte %00000001

explosion02
       .byte %00000001
       .byte %00000010
       .byte %00000001

explosion208
       .byte %00000001
       .byte %00000100
       .byte %00010010
       .byte %00110100
       .byte %00101100
       .byte %00000010
       .byte %00010110
       .byte %00001001
       .byte %00000100
       .byte %01010111
       .byte %00010000
       .byte %00010011
       .byte %00001101

explosion206
       .byte %00000101
       .byte %00000011
       .byte %00001001
       .byte %00100101
       .byte %00100110
       .byte %00100010
       .byte %00001010
       .byte %00010100
       .byte %00000011
       .byte %00000101

explosion204
       .byte %00000010
       .byte %00000101
       .byte %00000110
       .byte %00001100
       .byte %00000101
       .byte %00000010

explosion202
       .byte %00000000
       .byte %00000011
       .byte %00000001

diamond01
       .byte %00000001
       .byte %00000011
       .byte %00000111
       .byte %00000011
       .byte %00000001

diamond02
       .byte %00000000
       .byte %00000001
       .byte %00000011
       .byte %00000001
       .byte %00000000

gate01
       .byte %01111111
       .byte %01000000
       .byte %01011111
       .byte %01010000
       .byte %01010111
       .byte %01010100
       .byte %01010101
       .byte %01010100
       .byte %01010111
       .byte %01010000
       .byte %01011111
       .byte %01000000
       .byte %01111111

gate02
       .byte %00000000
       .byte %00111111
       .byte %00100000
       .byte %00101111
       .byte %00101000
       .byte %00101011
       .byte %00101010
       .byte %00101011
       .byte %00101000
       .byte %00101111
       .byte %00100000
       .byte %00111111
       .byte %00000000

mothership01:
       .byte %00011111
       .byte %11111111
       .byte %11111111
       .byte %01111111
       .byte %01111000
       .byte %01110000
       .byte %00100000

mothership02:
       .byte %00000000
       .byte %00001111
       .byte %01111111
       .byte %00000111
       .byte %00000000
       .byte %00000000
       .byte %00000000
       .byte %00000000
       .byte %00000000

mothership03:
       .byte %00000111
       .byte %00001000
       .byte %00010011
       .byte %00100000
       .byte %00101010
       .byte %01000000
       .byte %01111111
       .byte %01000000
       .byte %01001000
       .byte %00101001
       .byte %00100101
       .byte %00010000
       .byte %00001000

mothership04:
       .byte %00000111
       .byte %00001000
       .byte %00010010
       .byte %00100100
       .byte %00101000
       .byte %01000000
       .byte %01111111
       .byte %01000000
       .byte %01000011
       .byte %00100100
       .byte %00100100
       .byte %00010011
       .byte %00001000
       .byte %00000111

tieshape08
       .byte %10000000
       .byte %11000000
       .byte %11000000
       .byte %11000000
       .byte %11000000
       .byte %11000011
       .byte %11111111
       .byte %11111110
       .byte %11111111
       .byte %11000011
       .byte %11000000
       .byte %11000000
       .byte %11000000
       .byte %11000000
       .byte %10000000

tieshape07
       .byte %01000000
       .byte %01000000
       .byte %01000000
       .byte %01000000
       .byte %01100011
       .byte %01111111
       .byte %01111110
       .byte %01111111
       .byte %01100011
       .byte %01000000
       .byte %01000000
       .byte %01000000
       .byte %01000000

tieshape06
       .byte %00100000
       .byte %00100000
       .byte %00100000
       .byte %00100000
       .byte %00110011
       .byte %00111111
       .byte %00110011
       .byte %00100000
       .byte %00100000
       .byte %00100000
       .byte %00100000

tieshape05
       .byte %00010000
       .byte %00010000
       .byte %00010000
       .byte %00010001
       .byte %00011111
       .byte %00010001
       .byte %00010000
       .byte %00010000
       .byte %00010000

tieshape04
       .byte %00001000
       .byte %00001000
       .byte %00001001
       .byte %00001111
       .byte %00001001
       .byte %00001000
       .byte %00001000

tieshape03
       .byte %00000100
       .byte %00000101
       .byte %00000111
       .byte %00000101
       .byte %00000100

tieshape02
       .byte %00000010
       .byte %00000011
       .byte %00000010

; Second page with Space objects
       .byte $01 ; |       X| $FE64
       .byte $03 ; |      XX| $FE65
       .byte $03 ; |      XX| $FE66
       .byte $01 ; |       X| $FE67
       .byte $03 ; |      XX| $FE5C
       .byte $01 ; |       X| $FE5D
       .byte $01 ; |       X| $FE4A
       .byte $03 ; |      XX| $FEC1
       .byte $0F ; |    XXXX| $FEC2
       .byte $0F ; |    XXXX| $FEC4
       .byte $1F ; |   XXXXX| $FEC5
       .byte $1F ; |   XXXXX| $FEC7
       .byte $3F ; |  XXXXXX| $FEC8
       .byte $3F ; |  XXXXXX| $FEC9
       .byte $1F ; |   XXXXX| $FECB
       .byte $1F ; |   XXXXX| $FECC
       .byte $0F ; |    XXXX| $FECD
       .byte $0F ; |    XXXX| $FECF
       .byte $03 ; |      XX| $FED0
       .byte $01 ; |       X| $FED7
       .byte $07 ; |     XXX| $FED8
       .byte $07 ; |     XXX| $FED9
       .byte $0F ; |    XXXX| $FEDA
       .byte $0F ; |    XXXX| $FEDB
       .byte $1F ; |   XXXXX| $FEDC
       .byte $1F ; |   XXXXX| $FEDD
       .byte $0F ; |    XXXX| $FEDE
       .byte $0F ; |    XXXX| $FEDF
       .byte $07 ; |     XXX| $FEE0
       .byte $07 ; |     XXX| $FEE1
       .byte $01 ; |       X| $FEE2
       .byte $01 ; |       X| $FE7A
       .byte $07 ; |     XXX| $FE7C
       .byte $07 ; |     XXX| $FE7C
       .byte $0F ; |    XXXX| $FE7D
       .byte $0F ; |    XXXX| $FE7E
       .byte $07 ; |     XXX| $FE7F
       .byte $07 ; |     XXX| $FE7C
       .byte $01 ; |       X| $FE81
       .byte $01 ; |       X| $FE6E
       .byte $03 ; |      XX| $FE6F
       .byte $07 ; |     XXX| $FE70
       .byte $07 ; |     XXX| $FE71
       .byte $03 ; |      XX| $FE72
       .byte $01 ; |       X| $FE73
       .byte %00000011
       .byte %00000111
       .byte %00000111
       .byte %00000111
       .byte %00000011
       .byte %00000001
       .byte %00010000
       .byte %00100100
       .byte %11000010
       .byte %01001111
       .byte %10111101
       .byte %00001010
       .byte %10010010
       .byte %00001010
       .byte %00010001
       .byte %00000011
       .byte %00100000
       .byte %00001001
       .byte %00000110
       .byte %00001001
       .byte %00010000
       .byte %00000111
       .byte %00100000
       .byte %00001010
       .byte %00010100
       .byte %00010101
       .byte %00001001
       .byte %00000001
       .byte %00000010
       .byte %00000100
       .byte %00001101
       .byte %00000101
       .byte %00000010
       .byte %00000001
       .byte %00000001
       .byte %00000010
       .byte %00000001
       .byte %00000001
       .byte %00000100
       .byte %00010010
       .byte %00110100
       .byte %00101100
       .byte %00000010
       .byte %00010110
       .byte %00001001
       .byte %00000100
       .byte %01010111
       .byte %00010000
       .byte %00010011
       .byte %00001101
       .byte %00000101
       .byte %00000011
       .byte %00001001
       .byte %00100101
       .byte %00100110
       .byte %00100010
       .byte %00001010
       .byte %00010100
       .byte %00000011
       .byte %00000101
       .byte %00000010
       .byte %00000101
       .byte %00000110
       .byte %00001100
       .byte %00000101
       .byte %00000010
       .byte %00000000
       .byte %00000011
       .byte %00000001
       .byte %00000001
       .byte %00000011
       .byte %00000111
       .byte %00000011
       .byte %00000001
       .byte %00000000
       .byte %00000001
       .byte %00000011
       .byte %00000001
       .byte %00000000
       .byte %01111111
       .byte %01000000
       .byte %01011111
       .byte %01010000
       .byte %01010111
       .byte %01010100
       .byte %01010101
       .byte %01010100
       .byte %01010111
       .byte %01010000
       .byte %01011111
       .byte %01000000
       .byte %01111111
       .byte %00000000
       .byte %00111111
       .byte %00100000
       .byte %00101111
       .byte %00101000
       .byte %00101011
       .byte %00101010
       .byte %00101011
       .byte %00101000
       .byte %00101111
       .byte %00100000
       .byte %00111111
       .byte %00000000

mothership05:
       .byte %00111111
       .byte %00011000
       .byte %00011110
       .byte %00011110
       .byte %00011110
       .byte %00011111
       .byte %00011000
       .byte %00011110
       .byte %00011110
       .byte %00011110
       .byte %00011111
       .byte %00011010
       .byte %00111111
       .byte %00000111
       .byte %00000001

mothership06:
       .byte %01111111
       .byte %00110001
       .byte %00110111
       .byte %00110111
       .byte %00110111
       .byte %00111111
       .byte %00110001
       .byte %00110111
       .byte %00110111
       .byte %00110111
       .byte %00111111
       .byte %00110101
       .byte %01111111
       .byte %00001111
       .byte %00000011

mothership07:
mothership08:
       .byte %00000001
       .byte %00000001
       .byte %00000011
       .byte %00000111
       .byte %00000111
       .byte %00000111
       .byte %00001111
       .byte %00001111
       .byte %00001111
       .byte %11111110
       .byte %00001110
       .byte %00001110
       .byte %00000110
       .byte %00000011

advshape08
       .byte %00011000
       .byte %00110000
       .byte %01100000
       .byte %01000000
       .byte %11000011
       .byte %11111111
       .byte %11111110
       .byte %11111111
       .byte %11000011
       .byte %01000000
       .byte %01100000
       .byte %00110000
       .byte %00011000

advshape07
       .byte %00001000
       .byte %00010000
       .byte %00100000
       .byte %01000000
       .byte %01100011
       .byte %01111111
       .byte %01111110
       .byte %01111111
       .byte %01100011
       .byte %01000000
       .byte %00100000
       .byte %00010000

advshape06
       .byte %00001000
       .byte %00010000
       .byte %00100000
       .byte %00110011
       .byte %00111111
       .byte %00110011
       .byte %00100000
       .byte %00010000
       .byte %00001000

advshape05
       .byte %00000100
       .byte %00001000
       .byte %00010000
       .byte %00010001
       .byte %00011111
       .byte %00010001
       .byte %00010000
       .byte %00001000

advshape03
       .byte %00000100
       .byte %00001001
       .byte %00001111
       .byte %00001001
       .byte %00000100

advshape04
       .byte %00000010
       .byte %00000100
       .byte %00001001
       .byte %00001111
       .byte %00001001
       .byte %00000100

advshape02
       .byte %00000010
       .byte %00000111
       .byte %00000010

diamondxmov
    .byte %00000011,%00000011,%00000011,%00000011,%00000011,%00000011,%00000011,%00000001
    .byte %00000000,%00000010,%00000010,%00000010,%00000010,%00000010,%00000010,%00000010

laserxpos
    .byte $3E,$3E,$3E,$3E
    .byte $38,$44,$44,$38
    .byte $32,$4A,$4A,$32
    .byte $2C,$50,$50,$2C
    .byte $26,$56,$56,$26
    .byte $20,$5C,$5C,$20
    .byte $1A,$62,$62,$1A
    .byte $14,$68,$68,$14
    .byte $0E,$6E,$6E,$0E

movetab
    .byte $70,$60,$50,$40,$30,$20,$10,$00,$F0,$E0,$D0,$C0,$B0,$A0,$90
    .byte $71,$61,$51,$41,$31,$21,$11,$01,$F1,$E1,$D1,$C1,$B1,$A1,$91
    .byte $72,$62

crosshair
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

hmovetab
    .byte $80,$70,$60,$50,$40,$30,$20,$10,$00
    .byte $F0,$E0,$D0,$C0,$B0,$A0,$90

laserypos
    .byte $23,$23,$23,$23
    .byte $26,$26,$20,$20
    .byte $29,$29,$1A,$1A
    .byte $2C,$2C,$17,$17
    .byte $2F,$2F,$14,$14
    .byte $32,$32,$11,$11
    .byte $35,$35,$0E,$0E
    .byte $38,$38,$0B,$0B
    .byte $3B,$3B,$08,$08

radarshifttab
    .byte #$08,#$00,#$01,#$02,#$03,#$04,#$05,#$06,#$07

wavecolortbl
    .byte %00101000,%00110000,%00111000,%01000000

wavecolortbl2
    .byte $03,$04,$05,$06

mothermovetbl
    .byte %00000010,%00000000,%00000000,%00001000

StarDirYTab:
        .byte 2     ; nomove
        .byte 4     ; up
        .byte 0     ; down
        .byte 2     ; nomove
        .byte 2     ; left
        .byte 4     ; leftup
        .byte 0     ; leftdown
        .byte 2     ; left
        .byte 2     ; right
        .byte 4     ; rightup
        .byte 0     ; rightdown

StarDirXTab:
        .byte 0     ; nomove
        .byte 0     ; up
        .byte 0     ; down
        .byte 0     ; nomove
        .byte 3     ; left
        .byte 3     ; leftup
        .byte 3     ; leftdown
        .byte 3     ; left
        .byte -3    ; right
        .byte -3    ; rightup
        .byte -3    ; rightdown

StarMoveYTab:
       .byte -4,-4,-4,-2,-2,-2,2, 2, 2, 4, 4, 4

StarMoveXTab:
       .byte -4,-3,-2,-1, 1, 2, 3, 4

scoretab
    .byte $00,$00,$00,$40,$50,$60,$80,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00
    .byte $02,$02,$02,$02,$02,$02,$02,$02
    .byte $10,$10,$10,$10,$10,$10,$10,$10
    .byte $90,$90,$90,$90,$90,$90,$90,$90
    .byte $10,$10,$10,$10,$10,$10,$10,$10
    .byte $15,$15,$15,$15,$15,$15,$15,$15
    .byte $20,$20,$20,$20,$20,$20,$20,$20
    .byte $25,$25,$25,$25,$25,$25,$25,$25

scoretab2
    .byte $00,$00,$00,$20,$30,$40,$60,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    .byte $06,$06,$06,$06,$06,$06,$06,$06
    .byte $60,$60,$60,$60,$60,$60,$60,$60
    .byte $05,$05,$05,$05,$05,$05,$05,$05
    .byte $10,$10,$10,$10,$10,$10,$10,$10
    .byte $15,$15,$15,$15,$15,$15,$15,$15
    .byte $20,$20,$20,$20,$20,$20,$20,$20

shiptab
    .byte 2
    .byte 3
    .byte 3 
    .byte 4

shotcounttab
    .byte 140, 100, 80, 68, 64, 60, 56, 52, 48, 44
    .byte 40, 38, 36, 34, 32, 30, 28, 26, 24, 22

shotspeedtab
    .byte 25, 23, 21, 19, 17, 15, 13, 11, 9, 7
    .byte 7,7,7,7,7,7,7,7,7,7

shieldcolortab
    IF COMPILE_VERSION = PAL
        .byte $6C,$6C,$8C,$9C,$5C,$3C,$0C
    ELSE
        .byte $5C,$5C,$1C,$9C,$DC,$BC,$0C
    ENDIF

shieldtab
    .byte $01,$02,$03,$05,$07,$08,$FF

Offsets
    byte 0,8,16,24,32,40,48,56

explosiontype
    .byte $03, $00, $08, $08, $00, $08, $08, $08, $08

    ORG     $1FEC
    RORG    $DFEC

FirstInit
    BIT $1FF9
    NOP             ; dummy

SwitchToBank1:
    BIT $1FF9
    JMP MainGame

    .word $FFFF, $FFFF  ; bank-switching hotspots
    .word FirstInit
    .word FirstInit
    .word FirstInit

;----------------------------------------------------------
; 4K INTRO
;----------------------------------------------------------

INTROLINES  = 10
STARLETTERS =  5
NUMLETTERS  =  9

;===============================================================================
; Z P - V A R I A B L E S
;===============================================================================

    SEG.U   variables
    ORG     $80

; Both Banks:
gameState       ds 1                ; X/X/X/X/X/X/X/INTRO
bcdScore        ds 3                ; Last/Current score
bcdWave         ds 1                ; desired/current wave
bcdWaveBak      ds 1                ; desired/current wave
waveCounter     ds 1                ; desired/current wave
shieldState     ds 1                ; 0-5
frameCounter    ds 1                ; Incremented every frame
rnd             ds 1                ; Random #
tempVar1        ds 1
tempVar2        ds 1
tempVar3        ds 1
tempVar4        ds 1

; This Bank:

temp            ds 1
temp16L         ds 1
temp16H         ds 1
atten           ds 1
lines           ds 1
logoPtr         ds 2
curRow          ds 1                ; 0..9
curCol          ds 1                ; 0..5
curDir          ds 1                ; 0..7
curBit          ds 1                ; 0..7
curLetter       ds 1                ; 0..9
logoCol         ds 1
charPtr         ds.w 6
beat            ds 1 
tempoCount      ds 1
measure         ds 1
logo            ds 6*INTROLINES
delayTimer      ds 1

;===============================================================================
; R O M - C O D E
;===============================================================================

    SEG     Bank1
    ORG     $2000
    RORG    $F000

Pot2Tab:
    .byte   $80, $40, $20, $10, $08, $04, $02, $01

MainLoop:

    IF COMPILE_VERSION = PAL
        LDA #$4A
    ELSE
        LDA     #44
    ENDIF

    STA     TIM64T
    jsr     GameCalc
    jsr     DrawScreen
    JMP     OverScanIntro

Draw48Pixel SUBROUTINE
    stx     lines

    ldx     #11
.loopSet:
    lda     PatternTab,y
    sta     charPtr,x
    dey
    dex
    bpl     .loopSet

Draw48Pixel2

; slightly modified 48 pixel version:
loop2
    lda     lines           ;+3  63  189
    lsr                     ; 2
    tay                     ; 2
    lda     (charPtr),y     ;+5  68  204
    sta     WSYNC           ;go
    sta.w   GRP0            ;+3  71  213      D1     --      --     --
    lda     (charPtr+$2),y  ;+5   5   15
    sta     GRP1            ;+3   8   24      D1     D1      D2     --
    lda     (charPtr+$4),y  ;+5  13   39
    sta     GRP0            ;+3  16   48      D3     D1      D2     D2
    lda     (charPtr+$6),y  ;+5  21   63
    sta     tempVar2         ;+3  24   72
    LAX     (charPtr+$8),y  ;+5  29   87
    lda     (charPtr+$A),y  ;+5  36  108
    ldy     tempVar2         ;+3  41  123              !
    sty     GRP1            ;+3  44  132      D3     D3      D4     D2!
    stx     GRP0            ;+3  47  141      D5     D3!     D4     D4
    sta     GRP1            ;+3  50  150      D5     D5      D6     D4!
    sta     GRP0            ;+3  53  159      D4*    D5!     D6     D6
    dec     lines           ;+5  58  174                             !
    bpl     loop2           ;+2  60  180

    ldy     #0
    sty     GRP0
    sty     GRP1
    sty     GRP0
    rts


NextLetter SUBROUTINE
    ldy     curLetter
    iny
    cpy     #NUMLETTERS+1
    bcc     .skipRestart
    ldy     #0
StartLetter:
    lda     #$42
    sta     logoCol
    lda     #<Star0
    beq     .setPtr

.skipRestart:
    cpy     #STARLETTERS
    bne     .skipFire
    lda     #<Fire0
.setPtr:
    sta     logoPtr
    ldx     #INTROLINES*6-1
.loopClear:
    lda     #0
    sta     logo,x
    dex
    bpl     .loopClear
.skipFire:
    sty     curLetter
    lda     ColTab,y
    sta     curCol
    lda     RowTab,y
    sta     curRow
    lda     BitTab,y
    sta     curBit
    lda     #0
    sta     curDir
RTS:
    rts

GameCalc SUBROUTINE

    SED
    LDA gameState
    BEQ WaveOk
    LDA frameCounter
    AND #$0F
    BNE WaveOk

    LDA SWCHB
    LSR                 ; Reset?
    LSR                 ; Select?
    BCS NoSwitch        ; N:

    LDA bcdWave
    CMP #$08
    BCS RollVariant
    ADC #$01
    STA bcdWave
    STA bcdWaveBak
    INC waveCounter
    JMP NoSwitch

RollVariant
    LDA #$00
    STA bcdWave
    STA bcdWaveBak
    STA waveCounter

NoSwitch
    LDA SWCHA
    ASL
    TAY
    BCS .RightDone
    LDA bcdWave
    CMP #$08
    BCS .RightDone
    ADC #$01
    STA bcdWave
    INC waveCounter

.RightDone
    TYA
    ASL
    BCS WaveOk
    LDA bcdWave
    BEQ WaveOk
    SEC
    SBC #$01
    STA bcdWave
    DEC waveCounter

WaveOk
    CLD

    DEC frameCounter
    lda frameCounter
    and #$01
    bne RTS

    lda     frameCounter
    ldy     curLetter
    cpy     #NUMLETTERS
    bne     .cont
    ldx     #$44
    stx     logoCol
    tax
    bne     RTS
    lda     #$00
    sta     frameCounter
    jmp     NextLetter

.cont:
    ldy     curCol
    lda     MultTab,y
    clc
    adc     curRow
    tax
    lda     logo,x
    ldy     curBit
    ora     Pot2Tab,y
    sta     logo,x

scanRow     = tempVar1
scanCol     = tempVar1+1
scanIdx     = lines

    ldx     #0
    lda     curDir
    lsr                         ;       odd or even old direction?
    bcc     .even
    ldx     #ScanTabOdd-ScanTab
.even:
    stx     scanIdx

.loopScan:
    ldy     scanIdx
    inc     scanIdx
    lda     curDir
    clc
    adc     ScanTab,y
    and     #$07
    sta     curDir
    tay

    lda     curRow
    clc
    adc     DirYTab,y
    cmp     #INTROLINES
    bcs     .loopScan
    sta     scanRow

    lda     curBit
    clc
    adc     DirXTab,y
    ldy     curCol
    tax
    cmp     #8
    bcc     .sameByte
    beq     .addLines
    lda     #-2
    .byte $2c    ;       skips lda #0
.addLines:
    lda     #0
    adc     curCol
    cmp     #6
    bcs     .loopScan
    tay
    txa
    and     #$07
    tax
.sameByte:
    sty     scanCol
    lda     MultTab,y
    clc
    adc     scanRow
    tay
    lda     (logoPtr),y
    and     Pot2Tab,x
    beq     .loopScan
    stx     curBit
    lda     scanRow
    sta     curRow
    lda     scanCol
    sta     curCol
    ldy     curLetter
    lda     curCol
    cmp     ColTab,y
    bne     .skipNext
    txa
    cmp     BitTab,y
    bne     .skipNext
    lda     curRow
    cmp     RowTab,y
    bne     .skipNext
    jsr     NextLetter
.skipNext:
    rts

DrawScreen SUBROUTINE
    tsx
    stx     tempVar1

    ldx     #227
.waitTim:
    lda     INTIM
    bne     .waitTim

    sta     WSYNC
    sta     VBLANK
    stx     TIM64T
;---------------------------------------------------------------

    LDX #14
    JSR BurnXLines

    LDA gameState
    BNE ContinueIntro2
    JMP DrawScore

ContinueIntro2

    IF COMPILE_VERSION = PAL
        LDX #$64
    ELSE
        LDX #$44
    ENDIF

    stx     COLUP0
    stx     COLUP1

    ldx     #7*2-1
    ldy     #12*3-1
    jsr     Draw48Pixel     ;   Xype

    lda     #8
    ldx     curLetter
    cpx     #1
    bcs     .colorOk

    lda     frameCounter
    eor     #$FF
    lsr
    lsr
    and     #$0f
    cmp     #$08
    bcc     .colorOk
    eor     #$0f
.colorOk:
    sta     COLUP0
    sta     COLUP1

    LDX #4
    JSR BurnXLines

    ldx     #7*2-1
    ldy     #12*4-1
    jsr     Draw48Pixel     ;   presents

    LDX #12
    JSR BurnXLines

    lda     logoCol
    sta     COLUP0
    sta     COLUP1

    LDA #45
    STA tempVar3

    ldy     curLetter
    cpy     #STARLETTERS
    bcc     .skipStar

    LDA #21
    STA tempVar3
    ldx     #INTROLINES*2-1
    ldy     #12*1-1
    jsr     Draw48Pixel

.skipStar:
    sta     WSYNC
;---------------------------------------------------------------

    ldx     #INTROLINES*2-1
    ldy     #12*5-1
    jsr     Draw48Pixel

    LDX tempVar3
    JSR BurnXLines

ContinueScore

    LDA #$0A
    STA COLUP0
    STA COLUP1

    SED
    LDA bcdWave
    CLC 
    ADC #$01
    STA tempVar2
    CLD
    
    LDX #11
    LDA tempVar2         ; load low/high values of states
    AND #$0F            ; select lower nibble
    TAY                 ; X-> shape of value
    LDA #>zero          ; Load pointer to desired value
    STA charPtr,X       ; Store sprite pointer
    STA charPtr-2,X       ; Store sprite pointer
    DEX
    LDA digittab,Y      ; Load pointer to desired value
    STA charPtr,X       ; Store sprite pointer
    DEX
    DEX 
    LDA tempVar2         ; load low/high values of states
    LSR                 ; select higher nibble... 
    LSR                 ; ...of status value (bcd!)
    LSR                 ; (numbers 0-9)
    LSR                 ;
    TAY                 ; X-> shape of value
    LDA digittab,Y      ; Load pointer to desired value
    STA charPtr,X       ; Store sprite pointer
    DEX
    LDY #12*7-5

.loopSet:
    lda     PatternTab,y
    sta     charPtr,x
    dey
    dex
    bpl     .loopSet

    LDX #7*2-1
    STX lines
    jsr Draw48Pixel2    ; Wave:

    ldx     #7*2-1
    ldy     #12*6-1
    jsr     Draw48Pixel     ;   Score:

    LDX #11
NextDigit
    TXA
    LSR
    LSR
    TAY
    LDA bcdScore,Y      ; load low/high values of states
    STA tempVar3
    AND #$0F            ; select lower nibble
    TAY                 ; X-> shape of value
    LDA #>zero          ; Load pointer to desired value
    STA charPtr,X       ; Store sprite pointer
    STA charPtr-2,X       ; Store sprite pointer
    DEX
    LDA digittab,Y      ; Load pointer to desired value
    STA charPtr,X       ; Store sprite pointer
    DEX
    DEX 
    LDA tempVar3         ; load low/high values of states
    LSR                 ; select higher nibble... 
    LSR                 ; ...of status value (bcd!)
    LSR                 ; (numbers 0-9)
    LSR                 ;
    TAY                 ; X-> shape of value
    LDA digittab,Y      ; Load pointer to desired value
    STA charPtr,X       ; Store sprite pointer
    DEX
    BPL NextDigit
    LDX #7*2-1
    STX lines
    jsr Draw48Pixel2    ;   Score

WaitScreen
    ldx     #2
    lda     INTIM
    bne     WaitScreen
    sta     WSYNC
    stx     VBLANK
    ldx     tempVar1
    txs
    rts

DrawScore
    IF COMPILE_VERSION = PAL
        LDA #$64
    ELSE
        LDA #$44
    ENDIF
    STA COLUP0
    STA COLUP1
    ldx #INTROLINES*2-1
    ldy #12*1-1
    jsr Draw48Pixel         ; Star

    sta WSYNC
    ldx #INTROLINES*2-1
    ldy #12*2-1
    jsr Draw48Pixel         ; Fire

    LDX #20
    JSR BurnXLines

    JMP ContinueScore

OverScanIntro SUBROUTINE

    IF COMPILE_VERSION = PAL
        LDA #$42            ;
    ELSE
        LDA #$25
    ENDIF

    STA TIM64T          ; 30 lines overscan

;-----------------------------------------------------------
; BANKSWITCH 
;-----------------------------------------------------------

    LDA delayTimer
    BPL ContinueIntro
    INC delayTimer

    LDA INPT4
    BMI ContinueIntro

    LDA gameState
    LSR
    BCC DontResetScores
    LDX #$00
    STX bcdScore
    STX bcdScore+1
    STX bcdScore+2
    LDA bcdWave
    STA bcdWaveBak      ; Save selected wave

DontResetScores
    JMP SwitchToBank0

ContinueIntro
    DEC delayTimer
    LSR SWCHB
    BCS ContinueIntro3
    JMP StartReset

ContinueIntro3
    LDA gameState
    LSR
    BCC NoMusicNow
    JSR songPlayer

NoMusicNow
    JMP OverscanLoop2

start
    CLD
    LDA #$00
    TAX

ZeroZero    ;...Ufo... lala... Ramones rule!
    STA VSYNC,X
    TXS
    INX
    BNE ZeroZero

    LDA #$30        ; No timer is set on first start
    STA TIM64T

StartReset
    LDX #$00
    STX beat
    STX tempoCount
    STX measure
    INX
    STX gameState   
    LDX #$05
    STX shieldState
    LDX bcdWaveBak
    STX bcdWave
    STX waveCounter
    JMP .Continue

StartScore
    LDA gameState
    BNE StartReset

    ; Increment Wave
    SED                 
    LDA bcdWave
    CLC
    ADC #$01
    STA bcdWave
    INC waveCounter
    CLD

.Continue
    LDY #$00        ; minimal reset
    STY COLUPF
    STY CTRLPF
    STY REFP1
    STY GRP0
    STY AUDV0
    STY AUDV1
    
    LDA #$40
    STA delayTimer

    jsr StartLetter

    lda     #$00
    sta     frameCounter

    lda     #>Star0
    sta     logoPtr+1

    lda     #%01011
    sta     NUSIZ0
    sta     NUSIZ1
    sta     VDELP0
    sta     VDELP1

    sta     WSYNC
    ldx     #7

.wait:
    dex
    bne     .wait
    sta.w   RESP0       ;
    sta     RESP1
    lda     #$14
    sta     HMP1
    lsr
    sta     HMP0
    sta     WSYNC
    sta     HMOVE

OverscanLoop2
    lda     INTIM
    bne     OverscanLoop2

    VERTICAL_SYNC
    
    JMP MainLoop

BurnXLines
    STA WSYNC
    DEX
    BNE BurnXLines
    RTS

;===============================================================================
; Paul Slocum magic!
;===============================================================================

    include    song.h
    include    songplay.h

;===============================================================================
; R O M - T A B L E S (Bank 0)
;===============================================================================

    ORG     $2800
    RORG    $F800

Star0:
    .byte   %11111111
    .byte   %10000000
    .byte   %10000000
    .byte   %11111111
    .byte   %00000001
    .byte   %00000010
    .byte   %00000010
    .byte   %00000010
    .byte   %00000001
    .byte   %00000000
Star1:
    .byte   %11100001
    .byte   %00010001
    .byte   %00001001
    .byte   %00001001
    .byte   %00001001
    .byte   %00010001
    .byte   %00011111
    .byte   %00000000
    .byte   %00000000
    .byte   %11111111
Star2:
    .byte   %11100011
    .byte   %00100010
    .byte   %00100001
    .byte   %00100001
    .byte   %00100001
    .byte   %00100000
    .byte   %00111110
    .byte   %00000010
    .byte   %00000010
    .byte   %11111110
Star3:
    .byte   %11000111
    .byte   %01000100
    .byte   %01111101
    .byte   %00000001
    .byte   %00111001
    .byte   %10101010
    .byte   %10101010
    .byte   %10010010
    .byte   %01000100
    .byte   %01111100
Star4:
    .byte   %10111100
    .byte   %10100100
    .byte   %00100101
    .byte   %00100110
    .byte   %00100000
    .byte   %00100111
    .byte   %00100100
    .byte   %00100111
    .byte   %00100000
    .byte   %00111111
Star5:
    .byte   %01111111
    .byte   %10000001
    .byte   %00000001
    .byte   %00111111
    .byte   %00100000
    .byte   %10010000
    .byte   %01010000
    .byte   %10010000
    .byte   %00100000
    .byte   %11000000

Fire0:
    .byte   %00011110
    .byte   %00010010
    .byte   %00010010
    .byte   %00010010
    .byte   %00010011
    .byte   %00010011
    .byte   %00010010
    .byte   %00010011
    .byte   %00010000
    .byte   %00011111
Fire1:
    .byte   %00000111
    .byte   %00000100
    .byte   %00000100
    .byte   %00000111
    .byte   %10000001
    .byte   %10000001
    .byte   %00000001
    .byte   %11110111
    .byte   %00010100
    .byte   %11110111
Fire2:
    .byte   %11111011
    .byte   %00001010
    .byte   %00001010
    .byte   %00111010
    .byte   %00100010
    .byte   %00100010
    .byte   %00100010
    .byte   %00111010
    .byte   %00001010
    .byte   %11111011
Fire3:
    .byte   %11000111
    .byte   %01001000
    .byte   %01010000
    .byte   %01100011
    .byte   %00000010
    .byte   %01111001
    .byte   %01000101
    .byte   %01111001
    .byte   %00000010
    .byte   %11111100
Fire4:
    .byte   %11111111
    .byte   %00000000
    .byte   %00000000
    .byte   %11100111
    .byte   %00100100
    .byte   %00100111
    .byte   %00100100
    .byte   %00100111
    .byte   %00100000
    .byte   %00111111
Fire5:
    .byte   %11111000
    .byte   %00001000
    .byte   %00001000
    .byte   %11111000
    .byte   %00000000
    .byte   %00000000
    .byte   %00000000
    .byte   %11111000
    .byte   %00001000
    .byte   %11111000

Score0:
Score5:
Xype0:
Xype5:
    .byte   %00000000
    .byte   %00000000
    .byte   %00000000
    .byte   %00000000
    .byte   %00000000
    .byte   %00000000
    .byte   %00000000
Xype1:
    .byte   %00110011
    .byte   %00011011
    .byte   %00001110
    .byte   %00000110
    .byte   %00000111
    .byte   %00001101
    .byte   %00001100

Xype2:
    .byte   %00011001
    .byte   %00011001
    .byte   %00001100
    .byte   %00001100
    .byte   %00011110
    .byte   %10110011
    .byte   %11100011

Xype3:
    .byte   %10000011
    .byte   %10000011
    .byte   %11111001
    .byte   %11001101
    .byte   %11001101
    .byte   %01101100
    .byte   %01111000
Xype4:
    .byte   %11110000
    .byte   %00000000
    .byte   %10000000
    .byte   %11111000
    .byte   %10000000
    .byte   %11000000
    .byte   %11111100

presents0:
    .byte   %00001000
    .byte   %00001110
    .byte   %00001001
    .byte   %00001001
    .byte   %00001001
    .byte   %00001110
    .byte   %00000000
presents1:
    .byte   %00000000
    .byte   %01000011
    .byte   %01000100
    .byte   %01000111
    .byte   %01000100
    .byte   %00110011
    .byte   %00000000
presents2:
    .byte   %00000000
    .byte   %10011100
    .byte   %00000010
    .byte   %10001100
    .byte   %01010000
    .byte   %10001110
    .byte   %00000000
presents3:
    .byte   %00000000
    .byte   %01110010
    .byte   %10000010
    .byte   %11110010
    .byte   %10001010
    .byte   %01110011
    .byte   %00000000
presents4:
    .byte   %00000000
    .byte   %01000101
    .byte   %01001000
    .byte   %01001000
    .byte   %01001001
    .byte   %10011100
    .byte   %00001000
presents5:
    .byte   %00000000
    .byte   %11000000
    .byte   %00100000
    .byte   %11000000
    .byte   %00000000
    .byte   %11100000
    .byte   %00000000

Score1:
    .byte   %00111110
    .byte   %00000001
    .byte   %00000001
    .byte   %00011110
    .byte   %00100000
    .byte   %00100000
    .byte   %00011111

Score2:
    .byte   %00110011
    .byte   %01000100
    .byte   %01000100
    .byte   %01000100
    .byte   %00110011
    .byte   %00000000
    .byte   %00000000

Score3:
    .byte   %00100001
    .byte   %10100010
    .byte   %10100011
    .byte   %10100010
    .byte   %00011001 
    .byte   %00000000
    .byte   %00000000

Score4:
    .byte   %11000000
    .byte   %00000100
    .byte   %11000000
    .byte   %00100100
    .byte   %11000000
    .byte   %00000000
    .byte   %00000000

PatternTab:
    .word Star0, Star1, Star2, Star3, Star4, Star5
    .word Fire0, Fire1, Fire2, Fire3, Fire4, Fire5
    .word Xype0, Xype1, Xype2, Xype3, Xype4, Xype5
    .word presents0, presents1, presents2, presents3, presents4, presents5
    .word logo, logo+INTROLINES, logo+INTROLINES*2, logo+INTROLINES*3, logo+INTROLINES*4, logo+INTROLINES*5
    .word Score0, Score1, Score2, Score3, Score4, Score5
    .word Wave0, Wave1, Wave2, Wave3, Xype0, Xype0

zero
       .byte $38 ; |  XXX   | $F004
       .byte $44 ; | X   X  | $F005
       .byte $44 ; | X   X  | $F006
       .byte $44 ; | X   X  | $F007
       .byte $44 ; | X   X  | $F008
       .byte $44 ; | X   X  | $F009
       .byte $38 ; |  XXX   | $F00A

one
       .byte $38 ; |  XXX   | $F00C
       .byte $10 ; |   X    | $F00D
       .byte $10 ; |   X    | $F00E
       .byte $10 ; |   X    | $F00F
       .byte $10 ; |   X    | $F010
       .byte $30 ; |  XX    | $F011
       .byte $10 ; |   X    | $F012

two
       .byte $7C ; | XXXXX  | $F014
       .byte $40 ; | X      | $F015
       .byte $40 ; | X      | $F016
       .byte $38 ; |  XXX   | $F017
       .byte $04 ; |     X  | $F018
       .byte $44 ; | X   X  | $F019
       .byte $38 ; |  XXX   | $F01A

three
       .byte $38 ; |  XXX   | $F01C
       .byte $44 ; | X   X  | $F01D
       .byte $04 ; |     X  | $F01E
       .byte $18 ; |   XX   | $F01F
       .byte $04 ; |     X  | $F020
       .byte $44 ; | X   X  | $F021
       .byte $38 ; |  XXX   | $F022

four
       .byte $08 ; |    X   | $F024
       .byte $08 ; |    X   | $F025
       .byte $7C ; | XXXXX  | $F026
       .byte $48 ; | X  X   | $F027
       .byte $28 ; |  X X   | $F028
       .byte $18 ; |   XX   | $F029
       .byte $08 ; |    X   | $F02A

five
       .byte $38 ; |  XXX   | $F02C
       .byte $44 ; | X   X  | $F02D
       .byte $04 ; |     X  | $F02E
       .byte $04 ; |     X  | $F02F
       .byte $78 ; | XXXX   | $F030
       .byte $40 ; | X      | $F031
       .byte $7C ; | XXXXX  | $F032

six
       .byte $38 ; |  XXX   | $F034
       .byte $44 ; | X   X  | $F035
       .byte $44 ; | X   X  | $F036
       .byte $78 ; | XXXX   | $F037
       .byte $40 ; | X      | $F038
       .byte $20 ; |  X     | $F039
       .byte $1C ; |   XXX  | $F03A

seven
       .byte $20 ; |  X     | $F03C
       .byte $20 ; |  X     | $F03D
       .byte $20 ; |  X     | $F03E
       .byte $10 ; |   X    | $F03F
       .byte $08 ; |    X   | $F040
       .byte $04 ; |     X  | $F041
       .byte $7C ; | XXXXX  | $F042

eight
       .byte $38 ; |  XXX   | $F044
       .byte $44 ; | X   X  | $F045
       .byte $44 ; | X   X  | $F046
       .byte $38 ; |  XXX   | $F047
       .byte $44 ; | X   X  | $F048
       .byte $44 ; | X   X  | $F049
       .byte $38 ; |  XXX   | $F04A

nine
       .byte $70 ; | XXX    | $F04C
       .byte $08 ; |    X   | $F04D
       .byte $04 ; |     X  | $F04E
       .byte $3C ; |  XXXX  | $F04F
       .byte $44 ; | X   X  | $F050
       .byte $44 ; | X   X  | $F051
       .byte $38 ; |  XXX   | $F052

Wave0:
    .byte   %10000010
    .byte   %11000110
    .byte   %10101010
    .byte   %10010010
    .byte   %10000010
    .byte   %10000010
    .byte   %10000010

Wave1:
    .byte   %01110100
    .byte   %10001001
    .byte   %01111001
    .byte   %00001010
    .byte   %11110010
    .byte   %00000000
    .byte   %00000000

Wave2:
    .byte   %10000111
    .byte   %01001000
    .byte   %01001111
    .byte   %00101000
    .byte   %00100111
    .byte   %00000000
    .byte   %00000000

Wave3:
    .byte   %00000000
    .byte   %00010000
    .byte   %00000000
    .byte   %10010000
    .byte   %00000000
    .byte   %00000000
    .byte   %00000000

digittab
    .byte #<zero,#<one,#<two,#<three,#<four
    .byte #<five,#<six,#<seven,#<eight,#<nine

BitTab
    .byte   0, 6, 2, 2, 5
    .byte   3, 5, 6, 1
RowTab
    .byte   3, 0, 4, 0, 5
    .byte   0, 0, 0, 5
ColTab
    .byte   0, 2, 3, 4, 4
    .byte   0, 1, 2, 3

DirXTab:
    .byte    0, 1, 1, 1, 0,-1,-1,-1
DirYTab:
    .byte    1, 1, 0,-1,-1,-1, 0, 1

MultTab:
    .byte   0, INTROLINES*1, INTROLINES*2, INTROLINES*3, INTROLINES*4, INTROLINES*5
ScanTab:
    .byte   -2, 2,-1, 2, 1, 1, 1    ; even-direction (-2, 0,-1, 1, 2, 3)
ScanTabOdd:
    .byte   -1,-1, 2, 1, 1, 1, 1    ; odd -direction (-1,-2, 0, 1, 2, 3)

    ORG     $2FEF
    RORG    $FFEF

    BRK                     ; coming from the other bank

SwitchToBank0
    BIT $1FF8
    JMP StartScore

    .word $FFFF, $FFFF      ; bank-switching hotspots
    .word start
    .word start
    .word start