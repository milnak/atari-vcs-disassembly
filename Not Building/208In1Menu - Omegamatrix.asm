;
; ======  208 in 1  ======
;   Multicart Menuscreen
;
; designer: unknown
; company: unknown
; origin: "Made In Taiwan" is printed on the cart shell
;
; Disassembly and comments by Omegamatrix
; last updated June 28, 2008
;
;
; This menuscreen rom comes from a 208 in 1 multicart. The player uses the joystick to select
; a game number and presses the fire button to start that game.
;
; === bugs ===
; On real NTSC 2600 hardware the 208 in 1 cartridge itself is problematic. The menuscreen is often
; skipped at power up, and you jump into a random game. On a 7800 the menuscreen always appears at
; power up, but I have observed digit numbers suddenly moving on their own, or not been set to zero
; at power up. This happens rarely, and probably is a constraint of the timing inside the cartridge
; itself. I was unable to replicate the bug with the rom loaded into a Krokodile Cartridge on
; either a 2600 or 7800 which suggests the fault is with the PAL cartridge on a NTSC system rather
; then the rom.
;
; In emulation Z26 captures the digit bug from time to time, and you can see the digits taking off
; on their own. Stella however never displays this bug. Finally there is also an audio bug of some
; "popping" sounds between the music finishing and starting up again.
;
;
; 208in1menu.cfg contents:
;
;      ORG F800
;      DATA F800 F8FF
;      GFX F900 F9CE
;      DATA F9CF F9E2
;      GFX F9E3 FA75
;      CODE FA76 FAAB
;      DATA FAAC FADB
;      CODE FADC FB25
;      DATA FB26 FB28
;      CODE FB29 FB67
;      DATA FB68 FB6A
;      CODE FB6B FB87
;      DATA FB88 FB8D
;      CODE FB8E FBAA
;      GFX FBAB FBAD
;      CODE FBAE FBF8
;      GFX FBF9 FC07
;      CODE FC08 FC7A
;      DATA FC7B FD2F
;      CODE FD30 FF8E
;      GFX FF8F FFFF

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
RESP0   =  $10
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
HMP0    =  $20
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
SWCHA   =  $0280
INTIM   =  $0284
TIM64T  =  $0296

INPT4   =  $0C

;==================================================================================================
;              USER CONSTANTS
;==================================================================================================

; screen positioning blank scanlines
SCANLINES_TOP          = 55
SCANLINES_MID_A        = 5
SCANLINES_MID_B        = 5
SCANLINES_MID_C        = 16
SCANLINES_MID_D        = 5
SCANLINES_BOTTOM       = 57

COLOR_INST_ONE         = RED
COLOR_INST_TWO         = RED
COLOR_INST_THREE       = RED
COLOR_BACKGROUND       = BLACK  ; lower background
COLOR_CURSOR           = YELLOW
COLOR_DIGITS           = BLUE

; colors
BLACK                  = $00
BLUE                   = $9A
GREEN                  = $5A
RED                    = $4A
YELLOW                 = $2A

;==================================================================================================
;              RAM LOCATIONS
;==================================================================================================

tempStorageA           = $80
tempBCD                = tempStorageA  ; $80 - $81
tempDigitPtr           = tempStorageA  ; $80 - $81
tempPosVar             = tempStorageA
;-------------------------------------------
tempStorageB           = $81
tempAudioVar           = tempStorageB
spriteLineCount        = tempStorageB
;-------------------------------------------
tempGfxPointer         = $82    ; $82 - $83
;-------------------------------------------
notUsed                = $84    ; $84 - $85
;-------------------------------------------
instOnePtr             = $86    ; $86 - $91
instTwoPtr             = $92    ; $92 - $9D
instThreePtr           = $9E    ; $9E - $A9
gfxNumOfPtr            = $AA    ; $AA - $AF
leftDigitPtr           = $B0    ; $B0 - $B1  -  100's digit
middleDigitPtr         = $B2    ; $B2 - $B3  -  10's digit
rightDigitPtr          = $B4    ; $B4 - $B5  -  1's digit
cursorHorizVar         = $B6
joystickMotion         = $B7    ;  $FF no motion, $00 joystick is being pushed
cursorDigitPos         = $B8    ;  0 = left, 1 = middle, 2 = right
;-------------------------------------------
digitsBCD              = $B9
leftBCD                = digitsBCD    ; $B9
middleBCD              = digitsBCD+1  ; $BA
rightBCD               = digitsBCD+2  ; $BB
;-------------------------------------------
twelveCount            = $BC    ; $BC - $BD  -  counts down 12 to 1, repeats, used for music
multipyCount           = $BE    ; $BE - $BF  -  multiplies "twelveCount"
volumeCount            = $C0    ; $C0 - $C1
volume                 = $C2    ; $C2 - $C3
audioTabPos            = $C4    ; $C4 - $C5

;==================================================================================================
;              MAIN PROGRAM
;==================================================================================================

     ORG $F800

; this table is never looked up, it is likely used for addressing
; the location of a game, and might be read by a seperate chip

     .byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F    ; $00 - $0F
     .byte $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F    ; $10 - $1F
     .byte $20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F    ; $20 - $2F
     .byte $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3A,$3B,$3C,$3D,$3E,$3F    ; $30 - $3F
     .byte $40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F    ; $40 - $4F
     .byte $50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5A,$5B,$5C,$5D,$5E,$5F    ; $50 - $5F
     .byte $60,$61,$62,$63,$64,$65,$66,$67,$68,$69,$6A,$6B,$6C,$6D,$6E,$6F    ; $60 - $6F
     .byte $70,$71,$72,$73,$74,$75,$76,$77,$78,$79,$7A,$7B,$7C,$7D,$7E,$7F    ; $70 - $7F
     .byte $80,$81,$82,$83,$84,$85,$86,$87,$88,$89,$8A,$8B,$8C,$8D,$8E,$8F    ; $80 - $8F
     .byte $90,$91,$92,$93,$94,$95,$96,$97,$98,$99,$9A,$9B,$9C,$9D,$9E,$9F    ; $90 - $9F
     .byte $A0,$A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$AE,$AF    ; $A0 - $AF
     .byte $B0,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE,$BF    ; $B0 - $BF
     .byte $C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF    ; $C0 - $CF
     .byte $D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF    ; $D0 - $DF
     .byte $E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF    ; $E0 - $EF
     .byte $F0,$F1,$F2,$F3,$F4,$F5,$F6,$F7,$F8,$F9,$FA,$FB                    ; $F0 - $FB
     .byte $FF,$FF,$FF,$FF                                                    ; $FF x 4

;--------------------------------------------------------------------------------------------------


InstTwoA:
     .byte %10101110 ; |X X XXX |       XXX       X X XXX XXX     X      XXX    XXX XXX
     .byte %10101010 ; |X X X X |         X       X X X   X      XXX     XXX     X  X X
     .byte %11101010 ; |XXX X X |       XX        X X XXX XXX   XXXXX   XXXXX    X  X X
     .byte %11101010 ; |XXX X X |       X   X     X X   X X      XXX  X  XXX     X  X X
     .byte %10101010 ; |X X X X |       XXX X     XXX XXX XXX    XXX  X   X      X  XXX
     .byte %00000000 ; |        |
     .byte %11101010 ; |XXX X X |       XXX X X XXX XXX XXX XXX   XXX  X  X X XXX
     .byte %10001010 ; |X   X X |       X   X X X X X X X   X     X   X X XXX X
     .byte %10001110 ; |X   XXX |       X   XXX X X X X XXX XXX   XXX XXX XXX XXX
     .byte %10001010 ; |X   X X |       X   X X X X X X   X X     X X X X X X X
     .byte %11101010 ; |XXX X X |       XXX X X XXX XXX XXX XXX   XXX X X X X XXX
     .byte %00000000 ; |        |
     .byte %11101000 ; |XXX X   |       X X X X X X XX  XXX XXX
     .byte %10001000 ; |X   X   |       XXX X X XXX X X X   X X
     .byte %11000000 ; |XX      |       XXX X X XXX XX  XXX XX
     .byte %00100000 ; |  X     |       X X X X X X X X X   X X X
     .byte %11100000 ; |XXX     |       X X XXX X X XX  XXX X X X
InstTwoB:
     .byte %10101100 ; |X X XX  |
     .byte %10101010 ; |X X X X |
     .byte %11101100 ; |XXX XX  |
     .byte %11101010 ; |XXX X X |
     .byte %10101100 ; |X X XX  |
     .byte %00000000 ; |        |
     .byte %11101110 ; |XXX XXX |
     .byte %10101010 ; |X X X X |
     .byte %10101010 ; |X X X X |
     .byte %10101010 ; |X X X X |
     .byte %11101110 ; |XXX XXX |
     .byte %00000000 ; |        |
     .byte %00111011 ; |  XXX XX|
     .byte %00101000 ; |  X X   |
     .byte %00101011 ; |  X X XX|
     .byte %00101010 ; |  X X X |
     .byte %00101011 ; |  X X XX|
InstTwoC:
     .byte %11101010 ; |XXX X X |
     .byte %10001010 ; |X   X X |
     .byte %11101100 ; |XXX XX  |
     .byte %10001010 ; |X   X X |
     .byte %11101110 ; |XXX XXX |
     .byte %00000000 ; |        |
     .byte %11101110 ; |XXX XXX |
     .byte %00101000 ; |  X X   |
     .byte %11101110 ; |XXX XXX |
     .byte %10001000 ; |X   X   |
     .byte %11101110 ; |XXX XXX |
     .byte %00000000 ; |        |
     .byte %10111000 ; |X XXX   |
     .byte %10100000 ; |X X     |
     .byte %10111000 ; |X XXX   |
     .byte %00100000 ; |  X     |
     .byte %10111000 ; |X XXX   |
InstTwoD:
     .byte %10000000 ; |X       |
     .byte %10000000 ; |X       |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00111010 ; |  XXX X |
     .byte %00101010 ; |  X X X |
     .byte %00111011 ; |  XXX XX|
     .byte %00100010 ; |  X   X |
     .byte %00111001 ; |  XXX  X|
     .byte %00000000 ; |        |
     .byte %01110010 ; | XXX  X |
     .byte %01110010 ; | XXX  X |
     .byte %11111000 ; |XXXXX   |
     .byte %01110000 ; | XXX    |
     .byte %00100000 ; |  X     |
InstTwoE:
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %10101011 ; |X X X XX|
     .byte %10101010 ; |X X X X |
     .byte %10111011 ; |X XXX XX|
     .byte %10111010 ; |X XXX X |
     .byte %00101011 ; |  X X XX|
     .byte %00000000 ; |        |
     .byte %00100000 ; |  X     |
     .byte %01110000 ; | XXX    |
     .byte %11111000 ; |XXXXX   |
     .byte %01110000 ; | XXX    |
     .byte %01110000 ; | XXX    |
InstTwoF:
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %10000000 ; |X       |
     .byte %00000000 ; |        |
     .byte %10000000 ; |X       |
     .byte %00000000 ; |        |
     .byte %10000000 ; |X       |
     .byte %00000000 ; |        |
     .byte %01001110 ; | X  XXX |
     .byte %01001010 ; | X  X X |
     .byte %01001010 ; | X  X X |
     .byte %01001010 ; | X  X X |
     .byte %11101110 ; |XXX XXX |

;--------------------------------------------------------------------------------------------------

InstThreeA:
     .byte %10001110 ; |X   XXX |       XX        XXX X X XXX X X   XXX X X XXX XXX XXX
     .byte %10001000 ; |X   X   |         X       X X X X X   X X   X   X X X X X X  X
     .byte %11101000 ; |XXX X   |       XX        XXX X X XXX XXX   XXX XXX X X X X  X
     .byte %10101000 ; |X X X   |         X X     X   X X   X X X     X X X X X X X  X
     .byte %11101000 ; |XXX X   |       XX  X     X   XXX XXX X X   XXX X X XXX XXX  X
     .byte %00000000 ; |        |
     .byte %11001110 ; |XX  XXX |       XX  X X XXX XXX XXX X X   XXX XXX
     .byte %10101010 ; |X X X X |       X X X X  X   X  X X XXX    X  X X
     .byte %11001010 ; |XX  X X |       XX  X X  X   X  X X XXX    X  X X
     .byte %10101010 ; |X X X X |       X X X X  X   X  X X X X    X  X X
     .byte %11001010 ; |XX  X X |       XX  XXX  X   X  XXX X X    X  XXX
     .byte %00000000 ; |        |
     .byte %11001000 ; |XX  X   |       XXX X    X  X X   XXX  X  X X XXX
     .byte %00101000 ; |  X X   |       X X X   X X X X   X   X X XXX X
     .byte %11000000 ; |XX      |       XXX X   XXX  X    XXX XXX XXX XXX
     .byte %00100000 ; |  X     |       X   X   X X  X    X X X X X X X   X
     .byte %11000000 ; |XX      |       X   XXX X X  X    XXX X X X X XXX X
InstThreeB:
     .byte %10100100 ; |X X  X  |
     .byte %10100100 ; |X X  X  |
     .byte %11100100 ; |XXX  X  |
     .byte %10101010 ; |X X X X |
     .byte %01001010 ; | X  X X |
     .byte %00000000 ; |        |
     .byte %01000100 ; | X   X  |
     .byte %01000100 ; | X   X  |
     .byte %01000100 ; | X   X  |
     .byte %01000100 ; | X   X  |
     .byte %11101110 ; |XXX XXX |
     .byte %00000000 ; |        |
     .byte %00100011 ; |  X   XX|
     .byte %00100010 ; |  X   X |
     .byte %00111010 ; |  XXX X |
     .byte %00101010 ; |  X X X |
     .byte %00111010 ; |  XXX X |
InstThreeC:
     .byte %00111010 ; |  XXX X |
     .byte %00101010 ; |  X X X |
     .byte %00111011 ; |  XXX XX|
     .byte %00100010 ; |  X   X |
     .byte %00111001 ; |  XXX  X|
     .byte %00000000 ; |        |
     .byte %11101010 ; |XXX X X |
     .byte %10101010 ; |X X X X |
     .byte %10101110 ; |X X XXX |
     .byte %10101110 ; |X X XXX |
     .byte %11101010 ; |XXX X X |
     .byte %00000000 ; |        |
     .byte %10111010 ; |X XXX X |
     .byte %10001010 ; |X   X X |
     .byte %10111011 ; |X XXX XX|
     .byte %10100010 ; |X X   X |
     .byte %10111010 ; |X XXX X |
InstThreeD:
     .byte %10101011 ; |X X X XX|
     .byte %10101010 ; |X X X X |
     .byte %10111011 ; |X XXX XX|
     .byte %10111010 ; |X XXX X |
     .byte %00101011 ; |  X X XX|
     .byte %00000000 ; |        |
     .byte %00010011 ; |   X  XX|
     .byte %00010010 ; |   X  X |
     .byte %00010010 ; |   X  X |
     .byte %00010010 ; |   X  X |
     .byte %00111011 ; |  XXX XX|
     .byte %00000000 ; |        |
     .byte %10001110 ; |X   XXX |
     .byte %10000010 ; |X     X |
     .byte %10001110 ; |X   XXX |
     .byte %10001000 ; |X   X   |
     .byte %10001110 ; |X   XXX |
InstThreeE:
     .byte %10100000 ; |X X     |
     .byte %00100000 ; |  X     |
     .byte %10000000 ; |X       |
     .byte %00000000 ; |        |
     .byte %10000000 ; |X       |
     .byte %00000000 ; |        |
     .byte %10000000 ; |X       |
     .byte %10000000 ; |X       |
     .byte %10000000 ; |X       |
     .byte %10000000 ; |X       |
     .byte %10000000 ; |X       |
     .byte %00000000 ; |        |
     .byte %10101110 ; |X X XXX |
     .byte %10101010 ; |X X X X |
     .byte %11101010 ; |XXX X X |
     .byte %10101010 ; |X X X X |
     .byte %10101110 ; |X X XXX |
InstThreeF:
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %11100100 ; |XXX  X  |
     .byte %10100100 ; |X X  X  |
     .byte %10100100 ; |X X  X  |
     .byte %10100100 ; |X X  X  |
     .byte %11101110 ; |XXX XXX |

     .byte $AE ; |X X XXX | $F9CC
     .byte $AE ; |X X XXX | $F9CD
     .byte $90 ; |X  X    | $F9CE

;-----------------------------------------
numGfxLoPtrTab:
     .byte Zero,One,Two,Three,Four,Five,Six,Seven,Eight,Nine

numGfxHiPtrTab:
     .byte >Zero,>One,>Two,>Three,>Four,>Five,>Six,>Seven,>Eight,>Nine
;-----------------------------------------


Zero:
     .byte %00111000 ; |  XXX   |
     .byte %01000100 ; | X   X  |
     .byte %11000110 ; |XX   XX |
     .byte %11000110 ; |XX   XX |
     .byte %11000110 ; |XX   XX |
     .byte %11000110 ; |XX   XX |
     .byte %11000110 ; |XX   XX |
     .byte %01000100 ; | X   X  |
     .byte %00111000 ; |  XXX   |
     .byte %00000000 ; |        |
One:
     .byte %01111110 ; | XXXXXX |
     .byte %00011100 ; |   XXX  |
     .byte %00011100 ; |   XXX  |
     .byte %00011100 ; |   XXX  |
     .byte %00011100 ; |   XXX  |
     .byte %01111100 ; | XXXXX  |
     .byte %00111100 ; |  XXXX  |
     .byte %00011100 ; |   XXX  |
     .byte %00001100 ; |    XX  |
     .byte %00000000 ; |        |
Two:
     .byte %11111110 ; |XXXXXXX |
     .byte %11100000 ; |XXX     |
     .byte %11100000 ; |XXX     |
     .byte %01100000 ; | XX     |
     .byte %00111100 ; |  XXXX  |
     .byte %00001110 ; |    XXX |
     .byte %00001110 ; |    XXX |
     .byte %10001110 ; |X   XXX |
     .byte %01111100 ; | XXXXX  |
     .byte %00000000 ; |        |
Three:
     .byte %01111100 ; | XXXXX  |
     .byte %10001110 ; |X   XXX |
     .byte %00001110 ; |    XXX |
     .byte %00001110 ; |    XXX |
     .byte %01111100 ; | XXXXX  |
     .byte %00001110 ; |    XXX |
     .byte %00001110 ; |    XXX |
     .byte %10001110 ; |X   XXX |
     .byte %01111100 ; | XXXXX  |
     .byte %00000000 ; |        |
Four:
     .byte %00011100 ; |   XXX  |
     .byte %00011100 ; |   XXX  |
     .byte %11111110 ; |XXXXXXX |
     .byte %10011100 ; |X  XXX  |
     .byte %01011100 ; | X XXX  |
     .byte %00111100 ; |  XXXX  |
     .byte %00011100 ; |   XXX  |
     .byte %00001100 ; |    XX  |
     .byte %00000100 ; |     X  |
     .byte %00000000 ; |        |
Five:
     .byte %01111100 ; | XXXXX  |
     .byte %10001110 ; |X   XXX |
     .byte %00001110 ; |    XXX |
     .byte %00001110 ; |    XXX |
     .byte %00001110 ; |    XXX |
     .byte %01111100 ; | XXXXX  |
     .byte %11100000 ; |XXX     |
     .byte %11100000 ; |XXX     |
     .byte %01111110 ; | XXXXXX |
     .byte %00000000 ; |        |
Six:
     .byte %00111000 ; |  XXX   |
     .byte %01000100 ; | X   X  |
     .byte %11000110 ; |XX   XX |
     .byte %11000110 ; |XX   XX |
     .byte %11000110 ; |XX   XX |
     .byte %10111100 ; |X XXXX  |
     .byte %10000000 ; |X       |
     .byte %01000010 ; | X    X |
     .byte %00111100 ; |  XXXX  |
     .byte %00000000 ; |        |
Seven:
     .byte %00110000 ; |  XX    |
     .byte %00110000 ; |  XX    |
     .byte %00110000 ; |  XX    |
     .byte %00010000 ; |   X    |
     .byte %00001000 ; |    X   |
     .byte %00000100 ; |     X  |
     .byte %11000110 ; |XX   XX |
     .byte %11000110 ; |XX   XX |
     .byte %01111100 ; | XXXXX  |
     .byte %00000000 ; |        |
Eight:
     .byte %01111100 ; | XXXXX  |
     .byte %11000110 ; |XX   XX |
     .byte %11000110 ; |XX   XX |
     .byte %11000110 ; |XX   XX |
     .byte %01111100 ; | XXXXX  |
     .byte %11000110 ; |XX   XX |
     .byte %11000110 ; |XX   XX |
     .byte %11000110 ; |XX   XX |
     .byte %01111100 ; | XXXXX  |
     .byte %00000000 ; |        |
Nine:
     .byte %01111100 ; | XXXXX  |
     .byte %10000110 ; |X    XX |
     .byte %10000110 ; |X    XX |
     .byte %00000110 ; |     XX |
     .byte %01111110 ; | XXXXXX |
     .byte %11000110 ; |XX   XX |
     .byte %11000110 ; |XX   XX |
     .byte %11000110 ; |XX   XX |
     .byte %01111100 ; | XXXXX  |
     .byte %00000000 ; |        |
CapitalN:
     .byte %11000110 ; |XX   XX |
     .byte %11000110 ; |XX   XX |
     .byte %11001110 ; |XX  XXX |
     .byte %11001110 ; |XX  XXX |
     .byte %11010110 ; |XX X XX |
     .byte %11010110 ; |XX X XX |
     .byte %11100110 ; |XXX  XX |
     .byte %11100110 ; |XXX  XX |
     .byte %11000110 ; |XX   XX |
     .byte %00000000 ; |        |
LowerCaseO:
     .byte %11111100 ; |XXXXXX  |
     .byte %11001100 ; |XX  XX  |
     .byte %11001100 ; |XX  XX  |
     .byte %11001100 ; |XX  XX  |
     .byte %11001100 ; |XX  XX  |
     .byte %11111100 ; |XXXXXX  |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
Period:
     .byte %11000000 ; |XX      |
     .byte %11000000 ; |XX      |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
Cursor:
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %11111111 ; |XXXXXXXX|
     .byte %11111111 ; |XXXXXXXX|

     .byte $00 ; |        | $FA6C    not used
     .byte $FF ; |XXXXXXXX| $FA6D
     .byte $FF ; |XXXXXXXX| $FA6E
     .byte $FF ; |XXXXXXXX| $FA6F
     .byte $FF ; |XXXXXXXX| $FA70
     .byte $FF ; |XXXXXXXX| $FA71
     .byte $FF ; |XXXXXXXX| $FA72
     .byte $FF ; |XXXXXXXX| $FA73
     .byte $FF ; |XXXXXXXX| $FA74
     .byte $FF ; |XXXXXXXX| $FA75

;--------------------------------------------------------------------------------------------------
; this subroutine stores into ram the graphic pointers, and initial states of some other variables

OneTimeRamWrite SUBROUTINE
     LDY    #47
.writeToRam:
     LDA    ScreenPatTab,Y
     STA.wy $86,Y                 ; pointers to the screen graphics, digits
     DEY                          ; are intially set to zero, zero, zero
     BPL    .writeToRam
     LDA    #81
     STA    cursorHorizVar        ; used to calculate where to draw the cursor
     LDA    #$FF
     STA    joystickMotion        ; joystick is not being moved
     LDA    #0
     STA    cursorDigitPos        ; cursor is in left postion
     LDA    #COLOR_BACKGROUND     ; background is black
     STA    COLUBK
     LDA    #$0F
     STA    COLUP1                ; playfield is never drawn though, and the color
     STA    COLUPF                ; is switched before player one is drawn too
     LDA    EndOfAudioTab
     STA    audioTabPos           ; audio is intially set to the ending of the music tune
     LDA    EndOfAudioTab+1
     STA    audioTabPos+1
     LDX    #0
     JSR    UpdateAudio           ; then audio is started
     LDX    #1
     JSR    UpdateAudio
     RTS


;-----------------------------------------
; this table is for placing pointers to the onscreen graphics in ram
; ram locations are $86 - $B5

ScreenPatTab:

      .word InstOneA, InstOneB, InstOneC, InstOneD, InstOneE, InstOneF
      .word InstTwoA, InstTwoB, InstTwoC, InstTwoD, InstTwoE, InstTwoF
      .word InstThreeA, InstThreeB, InstThreeC, InstThreeD, InstThreeE, InstThreeF
      .word CapitalN, LowerCaseO, Period, Zero, Zero, Zero

;-----------------------------------------

; this subroutine checks the joystick, but not the firebutton, then updates the number graphics

ReadJoystick SUBROUTINE

     LDA    SWCHA
     CMP    #$FF                  ; %11111111 nothing is grounded, joystick is not being used
     BNE    .motionDetected
     LDA    #$FF
     STA    joystickMotion        ; this variable is used to tell if the joystick has just
     RTS                          ; started to be pushed, or is already held in a direction

.motionDetected:
     LDA    joystickMotion        ; if joystick is being held in a direction then the branch
     BNE    .findDirection        ; is not taken
     RTS

.findDirection:
     LDA    #$00                  ; zero is the marker that tells us we dealt with the
     STA    joystickMotion        ; joystick in a previous frame, once the player stops
     JSR    CheckRight            ; pressing the joystick then the marker is reset to $FF
     JSR    CheckDown
     RTS

CheckRight:
     LDA    SWCHA
     AND    #$88
     CMP    #$88
     BEQ    .checkLeft
     JSR    MoveRight
     RTS

.checkLeft:
     LDA    SWCHA
     AND    #$44
     CMP    #$44
     BEQ    .exitCheckLeft
     JSR    MoveLeft
.exitCheckLeft:
     RTS

MoveRight:
     LDA    cursorDigitPos
     CMP    #2                    ; compare cursor position to the rightmost position
     BEQ    .exitMoveRight        ; if the cursor is at the far right position then exit,
     INC    cursorDigitPos        ; otherwise move the cursor right one place
     JSR    ChangeCursorPos
.exitMoveRight:
     RTS

ChangeCursorPos:
     LDY    cursorDigitPos        ; left, middle, or right
     LDA    CursorPosTab,Y        ; find the digit positioning variable, to be used later
     STA    cursorHorizVar        ; for calculating the HMPx and RESPx values
     RTS


;-----------------------------------------
; values used in calculating the cursor positions

CursorPosTab:
     .byte #81, #89, #97          ; left, middle, right
;-----------------------------------------


MoveLeft:
     LDA    cursorDigitPos
     BEQ    .exitMoveLeft
     DEC    cursorDigitPos        ; move the cursor left one place
     JSR    ChangeCursorPos
.exitMoveLeft:
     RTS

CheckDown:
     LDA    SWCHA
     AND    #$22
     CMP    #$22
     BEQ    .checkUp
     JSR    MoveDown
     RTS

.checkUp:
     LDA    SWCHA
     AND    #$11
     CMP    #$11
     BEQ    .exitCheckUp
     JSR    MoveUp
.exitCheckUp:
     RTS

MoveDown:
     LDY    cursorDigitPos
     LDA.wy digitsBCD,Y
     BEQ    .moveBelowZero        ; joystick is being pushed down, while digit is at zero
     SEC
     SBC    #1
     STA.wy digitsBCD,Y           ; decrement the digit number, if not at the lowest number
     JSR    UpdateDigitGfx
     RTS

.moveBelowZero:
     LDA    ScrollDownTab,Y       ; find the next digit below zero (might not be nine)
     STA.wy digitsBCD,Y
     JSR    UpdateDigitGfx
     RTS


;-----------------------------------------
; these are the first numbers reached below zero, scrolling downward

ScrollDownTab:
     .byte 2,9,9                  ; 1st digit, 2nd digit, 3rd digit
;-----------------------------------------


; this subroutine is used to change the onscreen graphics for each of the three digit numbers

; graphics for each number (0 - 9) are located in the rom, each digit (left, middle, right)
; holds the address for the graphic to be displayed in ram, changing the digits onscreen is done
; by changing the address held in ram so that it points to the correct number graphic

UpdateDigitGfx SUBROUTINE

     LDX    cursorDigitPos        ; find what digit the cursor is on (left, middle, right)
     LDA    DigitPointersTab,X
     STA    tempDigitPtr          ; build an indirect address to that ram location
     LDA    ZerosTable,X
     STA    tempDigitPtr+1
     LDA    digitsBCD,X           ; the actual decimal number of the digit
     TAX
     LDA    numGfxLoPtrTab,X      ; low part of address for that number graphic
     LDY    #0
     STA    (tempDigitPtr),Y
     INY
     LDA    numGfxHiPtrTab,X      ; high part of address for that number graphic
     STA    (tempDigitPtr),Y      ; pointer is now updated
     RTS


;-----------------------------------------
DigitPointersTab:
     .byte leftDigitPtr, middleDigitPtr, rightDigitPtr

ZerosTable:
     .byte 0,0,0
;-----------------------------------------


MoveUp:
     LDY    cursorDigitPos
     LDA.wy digitsBCD,Y
     CMP    ScrollUpTab,Y
     BEQ    .digitRollsToZero
     CLC
     ADC    #1                    ; increase the digit by one if not at the highest number
     STA.wy digitsBCD,Y
     JSR    UpdateDigitGfx
     RTS

.digitRollsToZero:
     LDA    #0
     STA.wy digitsBCD,Y
     JSR    UpdateDigitGfx
     RTS


;-----------------------------------------
; these are the last numbers reached following zero, scrolling upward

ScrollUpTab:
     .byte 2,9,9                  ; 1st digit, 2nd digit, 3rd digit
;-----------------------------------------

; once the fire button is pushed then the selected game selected begins

ReadFireButton SUBROUTINE
     LDA    INPT4
     AND    $0D                   ; INPUT5 ??
     BMI    .exitReadFB
     JSR    AreDigitsAllZero
     BCS    .exitReadFB
     JMP    ExecuteGame
.exitReadFB:
     RTS

AreDigitsAllZero SUBROUTINE
     LDY    #2
.checkEachDigit:
     LDA.wy digitsBCD,Y           ; each digit is checked to see if the game number is greater
     BNE    .moreThanZero         ; then zero, if all digits are zero than exit the subroutine,
     DEY                          ; if not convert the game number from BCD to hex
     BPL    .checkEachDigit
     SEC
     RTS

.moreThanZero:
     LDA    leftBCD
     STA    tempBCD
     LDA    middleBCD
     JSR    ConvertToHex
     BCS    .exitMoreThanZero
     LDA    rightBCD
     JSR    ConvertToHex
.exitMoreThanZero:
     RTS

ConvertToHex SUBROUTINE
     STA    tempBCD+1
     LDA    tempBCD
     ASL
     ASL
     ADC    tempBCD
     ASL
     BCS    .overflowed           ; more than 255
     CLC
     ADC    tempBCD+1
     STA    tempBCD
.overflowed:
     RTS

ExecuteGame:
     LDY    #14
.loopCodeInRam:
     LDA    RamCodeTab,Y
     STA.wy $86,Y                 ; $86 - $94
     DEY
     BPL    .loopCodeInRam
     JMP.w  $0086


;--------------------------------------
; these bytes are actually instructions loaded into ram $86 - $94, followed by an absolute jump

RamCodeTab:
;           86  87  88  89  8A  8B  8C  8D  8E  8F  90  91  92  93  94
     .byte $A9,$F8,$85,$83,$A5,$80,$85,$82,$A0,$00,$91,$82,$6C,$FC,$FF

;     LDA    #$F8
;     STA    $83
;     LDA    $80                  ; this is the selected game number in hex
;     STA    $82
;     LDY    #0
;     STA    ($82),Y              ; store xx at $F8xx, xx is the game number in hex ($01 - $FF)
;     JMP    (LFFFC)              ; interupt vector points to START ($FD7A)
;--------------------------------------

; both audio channels are used, audio zero being louder and playing in the
; foreground while audio one is quieter and carries the tune in the background

; the tone and frequency are updated at the same time, but each channel does this independent
; of the other, and at varying frame counts of either 12, 24, 36, 48, 72, 84, 96 frames

DoMusic SUBROUTINE

     LDX    #1
.loopAudioTimers:
     DEC    twelveCount,X
     BNE    .stepDownVolume
     LDA    #12
     STA    twelveCount,X         ; twelve frames times the multiplier gives a count
     DEC    multipyCount,X        ; of either 12, 24, 36, 48, 60, 72, 84, 96 frames
     BNE    .stepDownVolume
     JSR    UpdateAudio
.stepDownVolume:
     DEC    volumeCount,X         ; volume decrements every five frames, and sometimes gets
     BNE    .checkOtherAudio      ; reset before it reaches zero (in a preceding subroutine)
     LDA    #5
     STA    volumeCount,X
     LDA    volume,X
     BEQ    .checkOtherAudio
     SEC
     SBC    #1
     STA    volume,X
     STA    AUDV0,X
.checkOtherAudio:
     DEX
     BPL    .loopAudioTimers
     RTS

;---------------------------------

UpdateAudio SUBROUTINE
; there are two audio tables

     LDA    audioTabPos,X
     CMP    EndOfAudioTab,X       ; checks to see if the end of the audio table has been reached
     BNE    .incAudioTabPos
     LDA    #0                    ; at the end of the audio table restart position at zero
     JMP    CalcMusicPos
.incAudioTabPos:
     CLC
     ADC    #1
CalcMusicPos:
     STA    audioTabPos,X
     LDY    audioTabPos,X
     CPX    #0                    ; X = 0, audio table zero
     BNE    .setAudioOne          ; X = 1, audio table one
     LDA    AudioZeroTab,Y
     JMP    SetAudioRegisters
.setAudioOne:
     LDA    AudioOneTab,Y
SetAudioRegisters:
     STA    tempAudioVar
     AND    #$0F
     TAY
     LDA    ToneTab,Y             ; use value of low nybble to look up tone and frequency from table
     STA    AUDC0,X
     LDA    FrequencyTab,Y
     STA    AUDF0,X
     LDA    tempAudioVar
     LSR
     LSR
     LSR
     LSR
     TAY
     LDA    MultiplierTab,Y       ; use value of high nybble to look up a value to times 12 frames with
     STA    multipyCount,X
     LDA    #12
     STA    twelveCount,X
     LDA    VolumeTab,X           ; 10 or 5
     STA    volume,X
     STA    AUDV0,X
     LDA    #5
     STA    volumeCount,X
     RTS

;--------------------------------------------------------------------------------------------------

EndOfAudioTab:
; these values are literally the number of bytes in each of the audio tables,
; they are used for comparision to know when the end of the audio table is reached
;
     .byte $41,$4E     ;  AudioZeroTab, AudioOneTab


ToneTab:
; values for AUDC0 and AUDC1
;            0   1   2   3   4   5   6   7   8   9   A   B
     .byte $0C,$0C,$0C,$04,$04,$04,$04,$04,$04,$04,$04,$00

FrequencyTab:
; values for AUDF0 and AUDF1
;            0   1   2   3   4   5   6   7   8   9   A   B
     .byte $0D,$0C,$0B,$1E,$1B,$18,$16,$14,$12,$10,$0F,$00

VolumeTab:
     .byte $0A,$05

MultiplierTab:
; values from this table are multiplied by 12 frames, used as
; a time reference for updating tone and frequency values
;            0   1   2   3   4   5   6   7
     .byte $01,$02,$03,$04,$05,$06,$07,$08


AudioZeroTab:
; low nybble used to lookup values for AUDC0 and AUDF0, high nybble is used to
; lookup values in multiplier table, current place in table is stored in $C4
;
;            0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
     .byte $10,$05,$04,$33,$03,$04,$05,$06,$37,$18,$08,$0A,$37,$15,$05,$07  ; 0
     .byte $34,$10,$05,$04,$33,$03,$04,$05,$06,$37,$18,$08,$0A,$37,$15,$04  ; 1
     .byte $05,$33,$24,$07,$16,$15,$34,$33,$27,$0A,$19,$18,$77,$10,$05,$04  ; 2
     .byte $33,$03,$04,$05,$06,$37,$18,$08,$0A,$37,$15,$04,$05,$33,$7B,$7B  ; 3
     .byte $7B,$7B                                                          ; 4


AudioOneTab:
; low nybble used to lookup values for AUDC1 and AUDF1, high nybble is used to
; lookup values in multiplier table, current place in table is stored in $C5
;
;            0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
     .byte $13,$17,$15,$04,$05,$13,$17,$15,$04,$05,$15,$18,$15,$04,$05,$13  ; 0
     .byte $27,$06,$05,$04,$13,$17,$15,$04,$05,$13,$17,$15,$04,$05,$15,$18  ; 1
     .byte $15,$04,$05,$13,$27,$05,$04,$03,$14,$17,$14,$17,$14,$17,$13,$17  ; 2
     .byte $14,$17,$14,$17,$24,$04,$17,$14,$13,$17,$15,$04,$05,$13,$17,$15  ; 3
     .byte $04,$05,$15,$18,$15,$04,$05,$17,$06,$07,$35,$7B,$7B,$7B,$7B      ; 4


;--------------------------------------------------------------------------------------------------

CalcHorizPos SUBROUTINE
     SEC                        ; 2
     STA    WSYNC               ; 3
;--------------------------------------
.loopDivide:
     SBC    #15                 ; 2
     BCS    .loopDivide         ; 2³
     EOR    #7                  ; 2
     ASL                        ; 2
     ASL                        ; 2
     ASL                        ; 2
     ASL                        ; 2
     STA    HMP0,X              ; 4
     STA    RESP0,X             ; 4
     RTS                        ; 6

Positioning SUBROUTINE
     STA    WSYNC               ; 3
;--------------------------------------
     LDX    #0                  ; 2
     STX    VDELP0              ; 3
     STX    VDELP1              ; 3
     STX    GRP0                ; 3
     STX    GRP1                ; 3
     STA    tempPosVar          ; 3    56 for inst or 57 for digit
     JSR    CalcHorizPos        ; 6
     LDX    #1                  ; 2
     LDA    tempPosVar          ; 3
     CLC                        ; 2
     ADC    #8                  ; 2
     JSR    CalcHorizPos        ; 6
     LDA    #0                  ; 2
     STA    VBLANK              ; 3    stop VBLANK
     LDA    #3                  ; 2
     STA    NUSIZ0              ; 3
     STA    NUSIZ1              ; 3
     STY    COLUP0              ; 3
     STY    COLUP1              ; 3
     STA    WSYNC               ; 3
     STA    HMOVE               ; 3
     LDA    #10                 ; 2    this value is never used, spriteLineCount is
     STA    spriteLineCount     ; 3    written over upon returning from subroutine
     LDA    #7                  ; 2
     STA    VDELP0              ; 3
     STA    VDELP1              ; 3
     RTS                        ; 6


START:
     LDA    #$1D
     STA    VBLANK
     SEI
     CLD
     LDX    #0
     LDA    #0
.loopClear:
     STA    $80,X
     TXS
     INX
     BNE    .loopClear          ; stack pointer is left at $FF, all ram and registers clear
     JSR    OneTimeRamWrite


MainLoop:
     LDA    INTIM               ; 4
     BNE    MainLoop            ; 2³

     LDY    #SCANLINES_TOP      ; 2    scanlines from the top of screen to instruction ones gfx

.loopTopLines:
     STA    WSYNC               ; 3
;--------------------------------------
     DEY                        ; 2
     BPL    .loopTopLines       ; 2³

     LDA    #48                 ; 2
     LDY    #21                 ; 2    Y is never used though, Y is reloaded with COLOR_INST_ONE
     LDX    #0                  ; 2
     JSR    CalcHorizPos        ; 6
     STA    WSYNC               ; 3
;--------------------------------------
     STA    HMOVE               ; 3
     LDA    #0                  ; 2
     STA    NUSIZ0              ; 3
     STA    NUSIZ1              ; 3
     STA    VBLANK              ; 3    VBLANK stops here...
     LDA    #GREEN              ; 2
     STA    COLUP0              ; 3    color is switched to red before player zero is drawn though
     NOP                        ; 2
     NOP                        ; 2
     NOP                        ; 2
     NOP                        ; 2
     NOP                        ; 2
     NOP                        ; 2
     STA    WSYNC               ; 3
;--------------------------------------
     LDA    #56                 ; 2
     LDY    #COLOR_INST_ONE     ; 2
     JSR    Positioning         ; 6
     LDA    #16                 ; 2
     STA    spriteLineCount     ; 3

.loopDrawInstOne:
     LDY    spriteLineCount     ; 3
     LDA    (instOnePtr+10),Y   ; 5
     STA    tempGfxPointer      ; 3
     STA    WSYNC               ; 3
;--------------------------------------
     LDA    (instOnePtr+8),Y    ; 5
     TAX                        ; 2
     LDA    (instOnePtr),Y      ; 5
     NOP                        ; 2
     STA    GRP0                ; 3
     LDA    (instOnePtr+2),Y    ; 5
     STA    GRP1                ; 3
     LDA    (instOnePtr+4),Y    ; 5
     STA    GRP0                ; 3
     LDA    (instOnePtr+6),Y    ; 5
     LDY    tempGfxPointer      ; 3
     STA    GRP1                ; 3
     STX    GRP0                ; 3
     STY    GRP1                ; 3
     STA    GRP0                ; 3
     DEC    spriteLineCount     ; 5
     BPL    .loopDrawInstOne    ; 2³

     LDY    #SCANLINES_MID_A    ; 2    scanlines between instructions one and two

.loopSixLinesA
     STA    WSYNC               ; 3
;--------------------------------------
     LDA    #0                  ; 2
     STA    VDELP0              ; 3
     STA    VDELP1              ; 3
     STA    GRP0                ; 3
     STA    GRP1                ; 3
     STA    NUSIZ0              ; 3
     STA    NUSIZ1              ; 3
     DEY                        ; 2
     BPL    .loopSixLinesA      ; 2³

     LDA    #48                 ; 2
     LDY    #21                 ; 2    Y is never used though, Y is reloaded with COLOR_INST_TWO
     LDX    #0                  ; 2
     JSR    CalcHorizPos        ; 6
     STA    WSYNC               ; 3
;--------------------------------------
     STA    HMOVE               ; 3
     LDA    #GREEN              ; 2
     STA    COLUP0              ; 3    color is switched to red before player zero is drawn though
     NOP                        ; 2
     NOP                        ; 2
     NOP                        ; 2
     NOP                        ; 2
     NOP                        ; 2
     NOP                        ; 2
     STA    WSYNC               ; 3
;--------------------------------------
     LDA    #56                 ; 2
     LDY    #COLOR_INST_TWO     ; 2
     JSR    Positioning         ; 6
     LDA    #16                 ; 2
     STA    spriteLineCount     ; 3

.loopDrawInstTwo:
     LDY    spriteLineCount     ; 3
     LDA    (instTwoPtr+10),Y   ; 5
     STA    tempGfxPointer      ; 3
     STA    WSYNC               ; 3
;--------------------------------------
     LDA    (instTwoPtr+8),Y    ; 5
     TAX                        ; 2
     LDA    (instTwoPtr),Y      ; 5
     NOP                        ; 2
     STA    GRP0                ; 3
     LDA    (instTwoPtr+2),Y    ; 5
     STA    GRP1                ; 3
     LDA    (instTwoPtr+4),Y    ; 5
     STA    GRP0                ; 3
     LDA    (instTwoPtr+6),Y    ; 5
     LDY    tempGfxPointer      ; 3
     STA    GRP1                ; 3
     STX    GRP0                ; 3
     STY    GRP1                ; 3
     STA    GRP0                ; 3
     DEC    spriteLineCount     ; 5
     BPL    .loopDrawInstTwo    ; 2³

     LDY    #SCANLINES_MID_B    ; 2    scanlines between instructions two and three

.loopSixLinesB
     STA    WSYNC               ; 3
;--------------------------------------
     LDA    #0                  ; 2
     STA    VDELP0              ; 3
     STA    VDELP1              ; 3
     STA    GRP0                ; 3
     STA    GRP1                ; 3
     STA    NUSIZ0              ; 3
     STA    NUSIZ1              ; 3
     DEY                        ; 2
     BPL    .loopSixLinesB      ; 2³

     LDA    #48                 ; 2
     LDY    #21                 ; 2    Y is never used though, Y is reloaded with COLOR_INST_THREE
     LDX    #0                  ; 2
     JSR    CalcHorizPos        ; 6
     STA    WSYNC               ; 3
;--------------------------------------
     STA    HMOVE               ; 3
     LDA    #GREEN              ; 2
     STA    COLUP0              ; 3    color is switched to red before player zero is drawn though
     NOP                        ; 2
     NOP                        ; 2
     NOP                        ; 2
     NOP                        ; 2
     NOP                        ; 2
     NOP                        ; 2
     STA    WSYNC               ; 3
;--------------------------------------
     LDA    #56                 ; 2
     LDY    #COLOR_INST_THREE   ; 2
     JSR    Positioning         ; 6
     LDA    #16                 ; 2
     STA    spriteLineCount     ; 3

.loopDrawInstThree:
     LDY    spriteLineCount     ; 3
     LDA    (instThreePtr+10),Y ;5
     STA    tempGfxPointer      ; 3
     STA    WSYNC               ; 3
;--------------------------------------
     LDA    (instThreePtr+8),Y  ; 5
     TAX                        ; 2
     LDA    (instThreePtr),Y    ; 5
     NOP                        ; 2
     STA    GRP0                ; 3
     LDA    (instThreePtr+2),Y  ; 5
     STA    GRP1                ; 3
     LDA    (instThreePtr+4),Y  ; 5
     STA    GRP0                ; 3
     LDA    (instThreePtr+6),Y  ; 5
     LDY    tempGfxPointer      ; 3
     STA    GRP1                ; 3
     STX    GRP0                ; 3
     STY    GRP1                ; 3
     STA    GRP0                ; 3
     DEC    spriteLineCount     ; 5
     BPL    .loopDrawInstThree  ; 2³

     LDY    #SCANLINES_MID_C    ; 2    scanlines between instruction three and the game selection

.loopSeventeenLines
     STA    WSYNC               ; 3
;--------------------------------------
     LDA    #0                  ; 2
     STA    VDELP0              ; 3
     STA    VDELP1              ; 3
     STA    GRP0                ; 3
     STA    GRP1                ; 3
     DEY                        ; 2
     BPL    .loopSeventeenLines ;2³

     LDY    #SCANLINES_MID_D    ; 2    more scanlines between instruction three and the game selection

.loopSixLinesC:
     STA    WSYNC               ; 3
;--------------------------------------
     LDA    #0                  ; 2
     STA    VDELP0              ; 3
     STA    VDELP1              ; 3
     STA    GRP0                ; 3
     STA    GRP1                ; 3
     STA    NUSIZ0              ; 3
     STA    NUSIZ1              ; 3
     DEY                        ; 2
     BPL    .loopSixLinesC      ; 2³

     LDA    #57                 ; 2
     LDY    #COLOR_DIGITS       ; 2
     JSR    Positioning         ; 6
     LDA    #8                  ; 2
     STA    spriteLineCount     ; 3
     STA    WSYNC               ; 3
;--------------------------------------
     LDY    #9                  ; 2
     LDA    (rightDigitPtr),Y   ; 5
     STA    tempGfxPointer      ; 3
     STA    WSYNC               ; 3
;--------------------------------------
     LDA    (middleDigitPtr),Y  ; 5
     TAX                        ; 2
     LDA    (gfxNumOfPtr),Y     ; 5
     NOP                        ; 2
     STA    GRP0                ; 3
     LDA    (gfxNumOfPtr+2),Y   ; 5
     STA    GRP1                ; 3
     LDA    (gfxNumOfPtr+4),Y   ; 5
     STA    GRP0                ; 3
     LDA    (leftDigitPtr),Y    ; 5
     LDY    tempGfxPointer      ; 3
     STA    GRP1                ; 3
     STX    GRP0                ; 3
     STY    GRP1                ; 3
     STA    GRP0                ; 3

.loopDrawNumOfDisp:
     LDY    spriteLineCount     ; 3
     LDA    (rightDigitPtr),Y   ; 5
     STA    tempGfxPointer      ; 3
     STA    WSYNC               ; 3
;--------------------------------------
     LDA    (middleDigitPtr),Y  ; 5
     TAX                        ; 2
     LDA    (gfxNumOfPtr),Y     ; 5
     NOP                        ; 2
     STA    GRP0                ; 3
     LDA    (gfxNumOfPtr+2),Y   ; 5
     STA    GRP1                ; 3
     LDA    (gfxNumOfPtr+4),Y   ; 5
     STA    GRP0                ; 3
     LDA    (leftDigitPtr),Y    ; 5
     LDY    tempGfxPointer      ; 3
     STA    GRP1                ; 3
     STX    GRP0                ; 3
     STY    GRP1                ; 3
     STA    GRP0                ; 3
     DEC    spriteLineCount     ; 5
     BPL    .loopDrawNumOfDisp  ; 2³

     STA    WSYNC               ; 3
;--------------------------------------
     LDA    #0                  ; 2
     STA    VDELP0              ; 3
     STA    VDELP1              ; 3
     STA    GRP0                ; 3
     STA    GRP1                ; 3
     STA    NUSIZ0              ; 3
     LDA    cursorHorizVar      ; 3
     LDX    #0                  ; 2
     JSR    CalcHorizPos        ; 6
     STA    WSYNC               ; 3
;--------------------------------------
     STA    HMOVE               ; 3
     LDA    #COLOR_CURSOR       ; 2
     STA    COLUP0              ; 3
     LDY    #6                  ; 2    six sprite lines for cursor

.loopDrawCursor:
     STA    WSYNC               ; 3
;--------------------------------------
     LDA    Cursor,Y            ; 4
     STA    GRP0                ; 3
     DEY                        ; 2
     BPL    .loopDrawCursor     ; 2³

     LDY    #SCANLINES_BOTTOM   ; 2    scanlines underneath cursor to bottom of screen

.loopBottomLines:
     STA    WSYNC               ; 3
;--------------------------------------
     LDA    #0                  ; 2    graphics are blank
     STA    GRP0                ; 3
     STA    GRP1                ; 3
     DEY                        ; 2
     BPL    .loopBottomLines    ; 2³

     LDA    #26                 ; 2    1,664 machine clocks
     STA    TIM64T              ; 4
.waitForTimer:
     LDA    INTIM               ; 4
     BNE    .waitForTimer       ; 2³
     LDY    #$82                ; 2
     STY    WSYNC               ; 3
     STY    VBLANK              ; 3    1000 0010 = start VBLANK, dump I0 - I3 to ground
     STY    VSYNC               ; 3    start VSYNC
     STY    WSYNC               ; 3
     STY    WSYNC               ; 3
     STY    WSYNC               ; 3
     STA    VSYNC               ; 3    stop VSYNC
     LDA    #40                 ; 2
     STA    TIM64T              ; 4    2,560 machine clocks
     JSR    ReadJoystick        ; 6
     JSR    ReadFireButton      ; 6
     JSR    DoMusic             ; 6
     JMP    MainLoop            ; 3


;--------------------------------------------------------------------------------------------------

InstOneA:
     .byte %10001110 ; |X   XXX |        X        X X XXX XXX     X       X     XXX XXX
     .byte %10001010 ; |X   X X |       XX        X X X   X     XXXX     XXXX    X  X X
     .byte %11101010 ; |XXX X X |        X        X X XXX XXX   XXXXX   XXXXX    X  X X
     .byte %10101010 ; |X X X X |        X  X     X X   X X     XXXX  X  XXXX    X  X X
     .byte %11101110 ; |XXX XXX |       XXX X     XXX XXX XXX     X   X   X      X  XXX
     .byte %00000000 ; |        |
     .byte %11101110 ; |XXX XXX |       XXX XXX X   XXX XXX XXX   XX  X XXX X XXX
     .byte %00101000 ; |  X X   |       X   X   X   X   X    X    X X X X   X  X
     .byte %11101110 ; |XXX XXX |       XXX XXX X   XXX X    X    X X X XXX X  X
     .byte %10001000 ; |X   X   |         X X   X   X   X    X    X X X X X X  X
     .byte %11101110 ; |XXX XXX |       XXX XXX XXX XXX XXX  X    XX  X XXX X  X
     .byte %00000000 ; |        |
     .byte %11101000 ; |XXX X   |       XXX XXX XXX X XXX X XXX X X
     .byte %01001000 ; | X  X   |       X X X X X   X  X  X X X XXX
     .byte %01000000 ; | X      |       XXX X X XXX X  X  X X X XXX
     .byte %11000000 ; |XX      |       X   X X   X X  X  X X X X X X
     .byte %01000000 ; | X      |       X   XXX XXX X  X  X XXX X X X
InstOneB:
     .byte %11101001 ; |XXX X  X|
     .byte %00101001 ; |  X X  X|
     .byte %11101001 ; |XXX X  X|
     .byte %10001001 ; |X   X  X|
     .byte %11101011 ; |XXX X XX|
     .byte %00000000 ; |        |
     .byte %11101110 ; |XXX XXX |
     .byte %10001000 ; |X   X   |
     .byte %10001110 ; |X   XXX |
     .byte %10001000 ; |X   X   |
     .byte %10001110 ; |X   XXX |
     .byte %00000000 ; |        |
     .byte %00111011 ; |  XXX XX|
     .byte %00101000 ; |  X X   |
     .byte %00101011 ; |  X X XX|
     .byte %00101010 ; |  X X X |
     .byte %00101011 ; |  X X XX|
InstOneC:
     .byte %00101110 ; |  X XXX |
     .byte %00101010 ; |  X X X |
     .byte %00101010 ; |  X X X |
     .byte %00101010 ; |  X X X |
     .byte %10101110 ; |X X XXX |
     .byte %00000000 ; |        |
     .byte %11100100 ; |XXX  X  |
     .byte %10000100 ; |X    X  |
     .byte %10000100 ; |X    X  |
     .byte %10000100 ; |X    X  |
     .byte %11101110 ; |XXX XXX |
     .byte %00000000 ; |        |
     .byte %10111000 ; |X XXX   |
     .byte %10100000 ; |X X     |
     .byte %10111000 ; |X XXX   |
     .byte %00100000 ; |  X     |
     .byte %10111000 ; |X XXX   |
InstOneD:
     .byte %10101000 ; |X X X   |
     .byte %10101000 ; |X X X   |
     .byte %11100000 ; |XXX     |
     .byte %11100000 ; |XXX     |
     .byte %10100000 ; |X X     |
     .byte %00000000 ; |        |
     .byte %00110010 ; |  XX  X |
     .byte %00101010 ; |  X X X |
     .byte %00101010 ; |  X X X |
     .byte %00101010 ; |  X X X |
     .byte %00110010 ; |  XX  X |
     .byte %00000000 ; |        |
     .byte %00100010 ; |  X   X |
     .byte %11110010 ; |XXXX  X |
     .byte %11111000 ; |XXXXX   |
     .byte %11110000 ; |XXXX    |
     .byte %00100000 ; |  X     |
InstOneE:
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %11101001 ; |XXX X  X|
     .byte %10101001 ; |X X X  X|
     .byte %11101001 ; |XXX X  X|
     .byte %10001001 ; |X   X  X|
     .byte %11101011 ; |XXX X XX|
     .byte %00000000 ; |        |
     .byte %00100000 ; |  X     |
     .byte %01111000 ; | XXXX   |
     .byte %11111000 ; |XXXXX   |
     .byte %01111000 ; | XXXX   |
     .byte %00100000 ; |  X     |
InstOneF:
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %00000000 ; |        |
     .byte %10000000 ; |X       |
     .byte %00000000 ; |        |
     .byte %01001110 ; | X  XXX |
     .byte %01001010 ; | X  X X |
     .byte %01001010 ; | X  X X |
     .byte %01001010 ; | X  X X |
     .byte %11101110 ; |XXX XXX |

     .byte $00 ; |        | $FFF5    free bytes
     .byte $00 ; |        | $FFF6
     .byte $00 ; |        | $FFF7
     .byte $00 ; |        | $FFF8
     .byte $00 ; |        | $FFF9
     .byte $00 ; |        | $FFFA
     .byte $00 ; |        | $FFFB

     ORG $FFFC

     .word START
     .byte $B3,$FF