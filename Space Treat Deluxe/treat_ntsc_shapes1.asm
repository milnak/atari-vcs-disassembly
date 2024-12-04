
; Space Treat - Sprites shapes and colors
;
; NTSC

EnemyShapes
Rock1Shape
	.byte %00111000, $20
	.byte %01001110, $22
	.byte %10111111, $24
	.byte %11111110, $24
	.byte %01111111, $24
	.byte %01111110, $22
	.byte %00011000, $20
	.byte %00000000, $00

Mine1Shape
	.byte %00011000, $14
	.byte %10111101, $16
	.byte %01111110, $18
	.byte %10101011, $18
	.byte %11010101, $18
	.byte %01111110, $18
	.byte %10111101, $16
	.byte %00011000, $14

Ufo1Shape
	.byte %00000000, $00
	.byte %01000010, $40
	.byte %00111100, $42
	.byte %11100111, $46
	.byte %11100111, $46
	.byte %00111100, $42
	.byte %01000010, $40
	.byte %00000000, $00

Ship1Shape
	.byte %10000001, $b4
	.byte %11000011, $b6
	.byte %11011011, $b8
	.byte %11111111, $ba
	.byte %11111111, $ba
	.byte %11011011, $b8
	.byte %11000011, $b6
	.byte %10000001, $b4

Cube1Shape
	.byte %00111111, $a8
	.byte %01100011, $aa
	.byte %11111101, $ac
	.byte %10100101, $ae
	.byte %10100101, $ae
	.byte %10111111, $ac
	.byte %11000110, $aa
	.byte %11111100, $a8

Ball1Shape
	.byte %00011000, $c2
	.byte %00101100, $c4
	.byte %01011110, $c6
	.byte %10111111, $c8
	.byte %11111111, $c8
	.byte %01111110, $c6
	.byte %00111100, $c4
	.byte %00011000, $c2

Circle1Shape
	.byte %00111100, $92
	.byte %01000010, $94
	.byte %10011001, $96
	.byte %10100101, $98
	.byte %10100101, $98
	.byte %10011001, $96
	.byte %01000010, $94
	.byte %00111100, $92

Vertical1Shape
	.byte %00011000, $52
	.byte %00011000, $54
	.byte %00111100, $56
	.byte %11111111, $58
	.byte %11111111, $58
	.byte %00111100, $56
	.byte %00011000, $54
	.byte %00011000, $52

Star1Shape
	.byte %00011000, $e2
	.byte %01011010, $e4
	.byte %00111100, $e6
	.byte %11111111, $e8
	.byte %11111111, $e8
	.byte %00111100, $e6
	.byte %01011010, $e4
	.byte %00011000, $e2

Ship2Shape
	.byte %00100100, $22
	.byte %01100110, $24
	.byte %11111111, $26
	.byte %11100111, $28
	.byte %11100111, $28
	.byte %11111111, $26
	.byte %01100110, $24
	.byte %00100100, $22

Spike1Shape
	.byte %10000001, $22
	.byte %01100110, $24
	.byte %01011010, $26
	.byte %00100100, $28
	.byte %00100100, $28
	.byte %01011010, $26
	.byte %01100110, $24
	.byte %10000001, $22

Spike2Shape	; n. 12
	.byte %10011001, $32
	.byte %01100110, $34
	.byte %01111110, $36
	.byte %10111101, $38
	.byte %10111101, $38
	.byte %01111110, $36
	.byte %01100110, $34
	.byte %10011001, $32

Ship3Shape	; n. 13
	.byte %00011000, $72
	.byte %01100110, $74
	.byte %11111111, $76
	.byte %00011000, $78
	.byte %00011000, $78
	.byte %11111111, $76
	.byte %01100110, $74
	.byte %00011000, $72

;Ship3Shape	; n. 14
	.byte %00100100, $b2
	.byte %00111100, $b4
	.byte %11111111, $b6
	.byte %01100110, $b8
	.byte %01100110, $b8
	.byte %11111111, $b6
	.byte %00111100, $b4
	.byte %00100100, $b2

;Ship3Shape	; n. 15
	.byte %11111111, $42
	.byte %00111100, $44
	.byte %01100110, $46
	.byte %11111111, $48
	.byte %11111111, $48
	.byte %01100110, $46
	.byte %00111100, $44
	.byte %11111111, $42

;Ship3Shape	; n. 16
	.byte %00111100, $c2
	.byte %01111110, $c4
	.byte %00011000, $c6
	.byte %11111111, $c8
	.byte %11111111, $c8
	.byte %00011000, $c6
	.byte %01111110, $c4
	.byte %00111100, $c2


TreatShapes
Strawberry1Shape
	.byte %00110100, $e6
	.byte %00011000, $e6
	.byte %00101100, $44
	.byte %01111010, $44
	.byte %01011110, $44
	.byte %00101100, $44
	.byte %00011000, $42
	.byte %11111111, $00

Cherry1Shape
	.byte %01100000, $e6
	.byte %00010000, $e6
	.byte %00001000, $e6
	.byte %00001000, $e6
	.byte %00011000, $44
	.byte %00111100, $44
	.byte %00011000, $44
	.byte %11111111, $00

Banana1Shape
	.byte %00011000, $f6
	.byte %00001100, $1a
	.byte %00001110, $1a
	.byte %00001110, $1a
	.byte %00001110, $1a
	.byte %00011100, $1a
	.byte %00110000, $1a
	.byte %11111111, $00

Drink1Shape
;	.byte %00000010, $0c
;	.byte %00000100, $0c
;	.byte %01111110, $ac
;	.byte %01001010, $ac
;	.byte %01010010, $ac
;	.byte %01111110, $ac
;	.byte %00111100, $ac
;	.byte %11111111, $00

	.byte %00110000, $f2
	.byte %00011000, $f2
	.byte %00111000, $e4
	.byte %01111100, $e4
	.byte %11111110, $e4
	.byte %11111110, $e4
	.byte %01101100, $e4
	.byte %11111111, $00

CandyBar1Shape	; n. 5
	.byte %01111000, $0f
	.byte %11001100, $42
	.byte %11001100, $0f
	.byte %00001100, $42
	.byte %00001100, $0f
	.byte %00001100, $42
	.byte %00001100, $0f
	.byte %11111111, $00


WaterMelon1Shape
	.byte %00000000, $00
	.byte %00000000, $00
	.byte %00000000, $00
	.byte %11111011, $42
	.byte %10111111, $40
	.byte %01110110, $40
	.byte %00111100, $c2
	.byte %11111111, $00

;Candy1Shape	; n. 7
	.byte %00000000, $00
	.byte %10000001, $42
	.byte %11011011, $44
	.byte %11111111, $46
	.byte %11011011, $44
	.byte %10000001, $42
	.byte %00000000, $00
	.byte %11111111, $00

;CandyBar1Shape	; n. 8
	.byte %01111100, $ae
	.byte %11111110, $ae
	.byte %11111110, $ae
	.byte %11111110, $f6
	.byte %01111100, $f6
	.byte %00111000, $f6
	.byte %00010000, $f4
	.byte %11111111, $00

Player1Shape
;	.byte 2, 4	; Numero frames animazione, velocita' animazione (delay in frames)
; Frame 1
	.byte %01011010, $82
	.byte %10111101, $86
	.byte %01111110, $8a
	.byte %11011011, $8a
	.byte %11011011, $8a
	.byte %01111110, $8a
	.byte %10111101, $86
	.byte %01011010, $82
; Frame 2
	.byte %01011010, $82
	.byte %10111101, $86
	.byte %01111110, $8a
	.byte %11100111, $8a
	.byte %11100111, $8a
	.byte %01111110, $8a
	.byte %10111101, $86
	.byte %01011010, $82

PlayerExplosion1Shape	; Deve essere consecutivo a Player1Shape
	.byte %01011010, $82
	.byte %10111101, $86
	.byte %01100110, $8a
	.byte %11000011, $8a
	.byte %11000011, $8a
	.byte %01100110, $8a
	.byte %10111101, $86
	.byte %01011010, $82

	.byte %10011001, $82
	.byte %00100100, $86
	.byte %01000010, $8a
	.byte %10011001, $8a
	.byte %10011001, $8a
	.byte %01000010, $8a
	.byte %00100100, $86
	.byte %10011001, $82

	.byte %00011000, $82
	.byte %00000000, $86
	.byte %00011000, $8a
	.byte %10100101, $8a
	.byte %10100101, $8a
	.byte %00011000, $8a
	.byte %00000000, $86
	.byte %00011000, $82

	.byte %00011000, $82
	.byte %00000000, $86
	.byte %00000000, $8a
	.byte %10000001, $8a
	.byte %10000001, $8a
	.byte %00000000, $8a
	.byte %00000000, $86
	.byte %00011000, $82

PlayerGround1Shape
	.byte %01011010, $82
	.byte %10111101, $86
	.byte %01111110, $8a
	.byte %11100111, $8a
	.byte %11100111, $8a
	.byte %01111110, $8a
	.byte %10000001, $0d
	.byte %01111110, $0d

	.byte %00000000, $00
	.byte %00000000, $00
	.byte %00000000, $00
	.byte %00000000, $00
	.byte %00000000, $00
	.byte %00000000, $00
	.byte %10000001, $0d
	.byte %01111110, $0d
