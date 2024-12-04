
; Space Treat - Sprites shapes and colors
;
; NTSC

EnemyShapes
Rock1Shape
	.byte %00111000, $40
	.byte %01001110, $42
	.byte %10111111, $44
	.byte %11111110, $44
	.byte %01111111, $44
	.byte %01111110, $42
	.byte %00011000, $40
	.byte %00000000, $00

Mine1Shape
	.byte %00011000, $24
	.byte %10111101, $26
	.byte %01111110, $28
	.byte %10101011, $28
	.byte %11010101, $28
	.byte %01111110, $28
	.byte %10111101, $26
	.byte %00011000, $24

Ufo1Shape
	.byte %00000000, $00
	.byte %01000010, $60
	.byte %00111100, $62
	.byte %11100111, $66
	.byte %11100111, $66
	.byte %00111100, $62
	.byte %01000010, $60
	.byte %00000000, $00

Ship1Shape
	.byte %10000001, $74
	.byte %11000011, $76
	.byte %11011011, $78
	.byte %11111111, $7a
	.byte %11111111, $7a
	.byte %11011011, $78
	.byte %11000011, $76
	.byte %10000001, $74

Cube1Shape
	.byte %00111111, $98
	.byte %01100011, $9a
	.byte %11111101, $9c
	.byte %10100101, $9e
	.byte %10100101, $9e
	.byte %10111111, $9c
	.byte %11000110, $9a
	.byte %11111100, $98

Ball1Shape
	.byte %00011000, $52
	.byte %00101100, $54
	.byte %01011110, $56
	.byte %10111111, $58
	.byte %11111111, $58
	.byte %01111110, $56
	.byte %00111100, $54
	.byte %00011000, $52

Circle1Shape
	.byte %00111100, $b2
	.byte %01000010, $b4
	.byte %10011001, $b6
	.byte %10100101, $b8
	.byte %10100101, $b8
	.byte %10011001, $b6
	.byte %01000010, $b4
	.byte %00111100, $b2

Vertical1Shape
	.byte %00011000, $82
	.byte %00011000, $84
	.byte %00111100, $86
	.byte %11111111, $88
	.byte %11111111, $88
	.byte %00111100, $86
	.byte %00011000, $84
	.byte %00011000, $82

Star1Shape
	.byte %00011000, $32
	.byte %01011010, $34
	.byte %00111100, $36
	.byte %11111111, $38
	.byte %11111111, $38
	.byte %00111100, $36
	.byte %01011010, $34
	.byte %00011000, $32

Ship2Shape
	.byte %00100100, $42
	.byte %01100110, $44
	.byte %11111111, $46
	.byte %11100111, $48
	.byte %11100111, $48
	.byte %11111111, $46
	.byte %01100110, $44
	.byte %00100100, $42

Spike1Shape
	.byte %10000001, $42
	.byte %01100110, $44
	.byte %01011010, $46
	.byte %00100100, $48
	.byte %00100100, $48
	.byte %01011010, $46
	.byte %01100110, $44
	.byte %10000001, $42

Spike2Shape	; n. 12
	.byte %10011001, $62
	.byte %01100110, $64
	.byte %01111110, $66
	.byte %10111101, $68
	.byte %10111101, $68
	.byte %01111110, $66
	.byte %01100110, $64
	.byte %10011001, $62

Ship3Shape	; n. 13
	.byte %00011000, $d2
	.byte %01100110, $d4
	.byte %11111111, $d6
	.byte %00011000, $d8
	.byte %00011000, $d8
	.byte %11111111, $d6
	.byte %01100110, $d4
	.byte %00011000, $d2

;Ship3Shape	; n. 14
	.byte %00100100, $72
	.byte %00111100, $74
	.byte %11111111, $76
	.byte %01100110, $78
	.byte %01100110, $78
	.byte %11111111, $76
	.byte %00111100, $74
	.byte %00100100, $72

;Ship3Shape	; n. 15
	.byte %11111111, $62
	.byte %00111100, $64
	.byte %01100110, $66
	.byte %11111111, $68
	.byte %11111111, $68
	.byte %01100110, $66
	.byte %00111100, $64
	.byte %11111111, $62

;Ship3Shape	; n. 16
	.byte %00111100, $52
	.byte %01111110, $54
	.byte %00011000, $56
	.byte %11111111, $58
	.byte %11111111, $58
	.byte %00011000, $56
	.byte %01111110, $54
	.byte %00111100, $52


TreatShapes
Strawberry1Shape
	.byte %00110100, $34
	.byte %00011000, $34
	.byte %00101100, $64
	.byte %01111010, $64
	.byte %01011110, $64
	.byte %00101100, $64
	.byte %00011000, $62
	.byte %11111111, $00

Cherry1Shape
	.byte %01100000, $34
	.byte %00010000, $34
	.byte %00001000, $34
	.byte %00001000, $34
	.byte %00011000, $64
	.byte %00111100, $64
	.byte %00011000, $64
	.byte %11111111, $00

Banana1Shape
	.byte %00011000, $24
	.byte %00001100, $28
	.byte %00001110, $28
	.byte %00001110, $28
	.byte %00001110, $28
	.byte %00011100, $28
	.byte %00110000, $28
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

	.byte %00110000, $22
	.byte %00011000, $22
	.byte %00111000, $32
	.byte %01111100, $32
	.byte %11111110, $32
	.byte %11111110, $32
	.byte %01101100, $32
	.byte %11111111, $00

CandyBar1Shape	; n. 5
	.byte %01111000, $0f
	.byte %11001100, $62
	.byte %11001100, $0f
	.byte %00001100, $62
	.byte %00001100, $0f
	.byte %00001100, $62
	.byte %00001100, $0f
	.byte %11111111, $00


WaterMelon1Shape
	.byte %00000000, $00
	.byte %00000000, $00
	.byte %00000000, $00
	.byte %11111011, $62
	.byte %10111111, $60
	.byte %01110110, $60
	.byte %00111100, $30
	.byte %11111111, $00

;Candy1Shape	; n. 7
	.byte %00000000, $00
	.byte %10000001, $62
	.byte %11011011, $64
	.byte %11111111, $66
	.byte %11011011, $64
	.byte %10000001, $62
	.byte %00000000, $00
	.byte %11111111, $00

;CandyBar1Shape	; n. 8
	.byte %01111100, $9e
	.byte %11111110, $9e
	.byte %11111110, $9e
	.byte %11111110, $22
	.byte %01111100, $22
	.byte %00111000, $22
	.byte %00010000, $20
	.byte %11111111, $00

Player1Shape
;	.byte 2, 4	; Numero frames animazione, velocita' animazione (delay in frames)
; Frame 1
	.byte %01011010, $d2
	.byte %10111101, $d6
	.byte %01111110, $da
	.byte %11011011, $da
	.byte %11011011, $da
	.byte %01111110, $da
	.byte %10111101, $d6
	.byte %01011010, $d2
; Frame 2
	.byte %01011010, $d2
	.byte %10111101, $d6
	.byte %01111110, $da
	.byte %11100111, $da
	.byte %11100111, $da
	.byte %01111110, $da
	.byte %10111101, $d6
	.byte %01011010, $d2

PlayerExplosion1Shape	; Deve essere consecutivo a Player1Shape
	.byte %01011010, $d2
	.byte %10111101, $d6
	.byte %01100110, $da
	.byte %11000011, $da
	.byte %11000011, $da
	.byte %01100110, $da
	.byte %10111101, $d6
	.byte %01011010, $d2

	.byte %10011001, $d2
	.byte %00100100, $d6
	.byte %01000010, $da
	.byte %10011001, $da
	.byte %10011001, $da
	.byte %01000010, $da
	.byte %00100100, $d6
	.byte %10011001, $d2

	.byte %00011000, $d2
	.byte %00000000, $d6
	.byte %00011000, $da
	.byte %10100101, $da
	.byte %10100101, $da
	.byte %00011000, $da
	.byte %00000000, $d6
	.byte %00011000, $d2

	.byte %00011000, $d2
	.byte %00000000, $d6
	.byte %00000000, $da
	.byte %10000001, $da
	.byte %10000001, $da
	.byte %00000000, $da
	.byte %00000000, $d6
	.byte %00011000, $d2

PlayerGround1Shape
	.byte %01011010, $d2
	.byte %10111101, $d6
	.byte %01111110, $da
	.byte %11100111, $da
	.byte %11100111, $da
	.byte %01111110, $da
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
