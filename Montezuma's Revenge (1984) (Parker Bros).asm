; *** Montezuma's Revenge ***
; Copyright 1983 Parker Brothers
; Designer:
; Notes: Original game by Robert Jaeger 

; Analyzed, labeled and commented
;  by ???
; 

; 10.10.2004 - Updated for DASM and vcs.h by David Galloway
;

	processor 6502

	LIST	OFF
	include vcs.h
	LIST	ON

; ------------ RAM area ------------

	seg.u	zpage
	ORG	$0080

Z0080	DS	1 ; incremented once per screen?
Z0081	DS	1 ; screen saver timer?
Z0082	DS	1 ; game state (0=reset, 5=game over)
Z0083	DS	1 ; room number (0-23)
Z0084	DS	1
Z0085	DS	1
Z0086	DS	1
Z0087	DS	2 ; pointer to first  byte of score/inventory graphics -> GRP0
Z0089	DS	2 ; pointer to second byte of score/inventory graphics -> GRP1
Z008B	DS	2 ; pointer to third  byte of score/inventory graphics -> GRP0
Z008D	DS	2 ; pointer to fourth byte of score/inventory graphics -> GRP1
Z008F	DS	2 ; pointer to fifth  byte of score/inventory graphics -> GRP0

Z0091	DS	2 ; pointer to sixth  byte of score/inventory graphics -> GRP1/GRP0
Z0093	DS	1 ; high byte of score (BCD, x10000)
Z0094	DS	1 ; middle byte of score (BCD, x100)
Z0095	DS	1 ; low byte of score (BCD, x1)
Z0096	DS	2 ; -> GRP1 pointer to item sprite data
Z0098	DS	2 ; -> GRP1 pointer to skull sprite data
Z009A	DS	2 ; -> PF1/PF2 left side or both sides
Z009C	DS	2 ; -> PF1/PF2 right side only
Z009E	DS	2 ; -> GRP0

Z00A0	DS	2 ; -> COLUP0
Z00A2	DS	2 ; pointer to bridge graphics -> PF1 in fire pit, PF0 in step pit
Z00A4	DS	2 ; pointer to bridge graphics -> PF2 in fire pit
Z00A6	DS	2 ; pointer to fire pit colors -> COLUPF
Z00A8	DS	2 ; -> PF2 data
Z00AA	DS	1 ; P0 horizontal positon, 01=left, 4D=middle, 98=right?
Z00AB	DS	1 ; P0 vertical position, FF=top, EB=top floor, 86=bottom?
Z00AC	DS	1 ; P1 horizontal position
Z00AD	DS	1 ; P1 vertical position
Z00AE	DS	1 ; vertical skull position
Z00AF	DS	1 ; horizontal skull position

Z00B0	DS	1
Z00B1	DS	1 ; P1 sprite ID (either treasure or monster)
Z00B2	DS	1 ; P1 sprite color index (DFDF4 table)
Z00B3	DS	1
Z00B4	DS	1 ; D3 = P0 sprite reflect, plus some other flags
Z00B5	DS	1 ; P0 sprite ID (index into D93AB table)
Z00B6	DS	1 ; P0 sprite height adjustment
Z00B7	DS	1 ; counter in Z0082 state = 6
Z00B8	DS	1 ; fire button state
Z00B9	DS	1 ; level number (-1 = new game, 0 = level 1, 1 = level 2, 2 = level 3)
Z00BA	DS	1 ; life counter
Z00BB	DS	1
Z00BC	DS	1
Z00BD	DS	1 ; skull reflect flag -> REFP1
Z00BE	DS	1 ; skull sprite index
Z00BF	DS	1

Z00C0	DS	1
Z00C1	DS	1 ; items possessed D7=torch D6=spare D5=sword D4/D3/D2/D1=key D0=amulet
Z00C2	DS	1 ; state of current room (from Z00C3 array)
Z00C3	DS	12 ; room state: even rooms in high nibbles, odd rooms in low nibbles
Z00CF	DS	1 ; starting position in room, 0=top, 1=bottom, 2=left, 3=center, 4=right

Z00D0	DS	1
Z00D1	DS	1 ; -> COLUPF/COLUBK (room color 1?)
Z00D2	DS	1 ; -> COLUPF (room color 2?)
Z00D3	DS	1
Z00D4	DS	1 ; -> NUSIZ1
Z00D5	DS	1 ; fire pit bridge and room 17 doors color -> COLUPF/COLUBK
Z00D6	DS	1
Z00D7	DS	1
Z00D8	DS	1
Z00D9	DS	1 ; temp
Z00DA	DS	1 ; temp and P0 line counter
Z00DB	DS	1 ; temp and P1 line counter
Z00DC	DS	1 ; -> GRP0/GRP1
Z00DD	DS	1
Z00DE	DS	1
Z00DF	DS	1 ; temp

Z00E0	DS	1
Z00E1	DS	2 ; -> PF2
Z00E3	DS	1 ; -> CTRLPF
Z00E4	DS	1 ; next state in Z0082 state = 6
Z00E5	DS	1
Z00E6	DS	1 ; saved joystick input (0 = pressed)
Z00E7	DS	1
Z00E8	DS	1 ; amulet timer
Z00E9	DS	1 ; bonus room timer
Z00EA	DS	1
Z00EB	DS	2 ; sound data pointers (offset from D9310)
Z00ED	DS	2 ; sound duration counters
Z00EF	DS	2 ; sound playing flags

; stack at $F1-$FF

; ------------ PAGE 0, 1, 2 ------------

	seg	rom

	ORG	$1000
	RORG	$b000

LB000	LDA	Z0082		; get game state
	ASL			; mulitply by 2
	TAY			; get address from table
	LDA	DB00D+1,Y
	PHA			; save address on stack
	LDA	DB00D,Y
	PHA
	RTS			; go to code address

DB00D	.word	LB01F-1		; Z0082 = 0 (reset)
	.word	LB035-1		; Z0082 = 1
	.word	LB06D-1		; Z0082 = 2
	.word	LB0C8-1		; Z0082 = 3
	.word	LB159-1		; Z0082 = 4
	.word	LB75E-1		; Z0082 = 5 (game over)
	.word	LB767-1		; Z0082 = 6
	.word	LB5BD-1		; Z0082 = 7
	.word	LB6EB-1		; Z0082 = 8 (falling at end of bonus room)

; Z0082 = 0 (reset)
LB01F	LDX	#D9310-D9310	; X = $00, startup music?
	JSR	LFD18		; play sound
	LDX	#$FF		; X = $FF
	STX	Z00B9		; initialize level to -1
	INX			; X = $00
	STX	Z0093		; clear high byte of score
	STX	Z0094		; clear middle byte of score
	STX	Z0095		; clear low byte of score (always = $00)
	LDA	#$05		; start with 6 lives (sixth life added later?)
	STA	Z00BA
	INC	Z0082		; increment Z0082 state = 1
; Z0082 = 1
LB035	LDA	Z00B9		; get level number
	BMI	LB042		; branch if negative (fresh start of game)
	CMP	#$02		; check for level 3
	BEQ	LB044		; don't increment level number past level 3
	LDA	#$99		; add 0 points to score (?)
	JSR	LBA17
LB042	INC	Z00B9		; increment level number
LB044	LDY	Z00B9		; get level number
	LDA	DBB58,Y		; multiply by 24
	LSR			; divide by 2
	CLC
	ADC	#$0B		; add 11 (offset to end of 12 byte block)
	TAY			; save offset in Y
	LDX	#$0B		; X = 11 (count for 12 byte block)
LB050	LDA	DFFBB,Y		; copy room flags from DFFBB to Z00C3
	STA	Z00C3,X
	DEY
	DEX
	BPL	LB050		; loop until copy done
	STX	Z00E8		; X = $FF, clear amulet timer
	STX	Z00E9		; clear bonus room timer
	INX			; X = $00
	STX	Z00E5
	STX	Z00D0
	STX	Z00C1		; clear inventory
	INX			; X = $01
	STX	Z0083		; set starting room number
	LDA	#$03
	STA	Z00CF		; starting vertical pos = middle
	INC	Z0082		; increment Z0082 state = 2
; Z0082 = 2
LB06D	LDX	#$FF
	STX	Z00D6
	INX			; X = $00
	STX	Z00BF
	STX	Z00B0
	STX	Z00D3
	STX	Z00D8
	LDX	Z00CF		; get starting position
	LDA	DFF8A,X		; (FE 86 EB EB EB = top, bottom, middle, middle, middle)
	STA	Z00AB		; set P0 vertical position
	LDA	DBBA3,X		; (4D 4D 01 4D 98 = middle, middle, left, middle, right)
	STA	Z00AA		; set P0 horizontal position
	LDA	DBAC5,X		; (00 00 00 08 08 = no, no, no, yes, yes)
	STA	Z00B4		; set P0 sprite reflect
	LDA	DBBA8,X		; (0A 0A 08 08 08 = climb, climb, walk, walk, walk)
	STA	Z00B5		; set P0 sprite ID
	JSR	LBA5B		; Y = level*24 + room
	LDA	DFECD,Y
	STA	Z00B1		; set P1 sprite type for this room
	STA	Z00B2		; set P1 sprite color index for this room
	LDA	DBACA,Y
	STA	Z00AC		; set P1 horizontal position
	LDA	DBB5B,Y
	STA	Z00AD		; set P1 vertical position
	LDX	Z0083		; get room number
	CPX	#$15		; seventh room fourth level?
	BEQ	LB0AE
	CPX	#$03		; first room second level?
	BNE	LB0B2
LB0AE	LDA	#$08
	STA	Z00B0
LB0B2	LDY	DFDD3,X		; get room type
	LDA	DFFA5,Y
	STA	Z00AE
	CPX	#$0F		; is it the bonus room?
	BNE	LB0C2		; branch if not
	LDA	#$4F		; initialize bonus room timer
	STA	Z00E9
LB0C2	LDA	#$3A
	STA	Z00AF		; set horizontal skull position
	INC	Z0082		; increment Z0082 state = 3
; Z0082 = 3
LB0C8	LDA	Z0083		; get room number
	CMP	#$0F		; is it the bonus room?
	BEQ	LB0D1		; branch if bonus room
	JSR	LBA65		; turn off low 2 bits of Z00B4
LB0D1	LDA	#<DFD75 ; blank
	LDY	#>DFD75
	LDX	#$06
LB0D7	STA	Z0096,X		; set Z0096, Z0098, Z009A to point to blank
	STY	Z0096+1,X
	DEX
	DEX
	BPL	LB0D7
	JSR	LFC2D
	LDA	Z00C2
	LDX	#<DD217		; get address of upright skull
	LDY	#>DD217
	LSR
	LSR
	BCC	LB0F0
	STX	Z0098		; save skull sprite data pointer
	STY	Z0098+1
LB0F0	LDX	#<DD17C
	LDY	#>DD17C
	LSR
	BCC	LB0FB
	STX	Z009C
	STY	Z009C+1
LB0FB	LSR
	BCC	LB102
	STX	Z009A
	STY	Z009A+1
LB102	LDY	Z0083		; get room number
	LDA	DFF14,Y
	TAX
	AND	#$01
	STA	Z00E3
	TXA			; Y = room type * 2
	ASL
	TAY
	LDA	DFE5B,Y		; point PF2 to non-ladder data
	STA	Z00E1
	LDA	DFE5B+1,Y
	STA	Z00E1+1
	LDA	#$00
	STA	Z00D4		; NUSIZ1 = 1 clock, 1 copy
	JSR	LBA4F		; Y = level * 6 + 5
	LDX	#$05
LB122	LDA	Z0083		; get room number
	CMP	DFF6E,Y
	BEQ	LB12F
	DEY
	DEX
	BPL	LB122
	BMI	LB156

LB12F	STY	Z00D9
	TYA			; Y = Y * 4 + DFDEB,X
	ASL
	ASL
	LDX	Z00C2
	ADC	DFDEB,X
	TAY
	LDA	DFEC3,X
	STA	Z00D4
	LDA	Z00B1		; get P1 sprite type
	CMP	#$05
	BNE	LB151
	CPX	#$01
	BEQ	LB156
	LDA	Z00AC		; get P1 horizontal position
	CLC
	ADC	#$10
	JMP	LB154

LB151	LDA	DBB11,Y
LB154	STA	Z00AC		; set P1 horizontal position
LB156	JMP	LB77D

; Z0082 = 4
LB159	LDA	Z00E9		; get bonus room timer
	BMI	LB162		; branch if not active
	LDX	#D936E-D9310	; bonus room music?
	JSR	LFD18		; play sound
LB162	LDY	Z0083		; get room number
	LDA	DFDD3,Y		; get room type
	STA	Z00D9
	ASL
	STA	Z00DD
	TAY
	LDX	#$00
LB16F	LDA	Z00AB		; get P0 vertical position
	CMP	#$E6
	BCS	LB180		; branch if >= $E6
	INX
	CMP	DFF8D,Y		; compare vertical position?
	BCS	LB180
	INY
	CPX	#$02
	BCC	LB16F
LB180	STX	Z00DE
	TXA
	BNE	LB18B
	STX	Z00DD
	STX	Z00E0
	BEQ	LB195
LB18B	LDA	Z00DD
	CLC
	ADC	Z00DE
	SBC	#$00
	TAY
	STY	Z00E0
LB195	LDA	Z00D6
	BMI	LB19C
	JMP	LB1FE	; (could be BPL)

LB19C	LDA	Z00B5		; get P0 sprite ID
	CMP	#$00		; joe_climb1 sprite?
	BEQ	LB1FB		; go to sound/score code if climbing
	CMP	#$0A		; joe_climb1 sprite?
	BEQ	LB1FB		; go to sound/score code if climbing
	JSR	LBA6C		; check fire button
	BEQ	LB1FB		; go to sound/score code if button not pressed
	JSR	LBA48		; read joystick
	BEQ	LB1CE		; go to sound/score code if joystick not pressed
	AND	#$C0		; check if either P0 left or P0 right
	CMP	#$C0
	BEQ	LB1C8		; branch if neither P0 left nor P0 right
	LDY	#$00
	AND	#$40
	BNE	LB1BD
	INY
LB1BD	JSR	LFC1A
	ORA	#$04
	STA	Z00B4
	LDY	#$02
	BNE	LB1EC	; (branch always taken)

LB1C8	LDA	Z00E6		; read joystick
	AND	#$10		; check P0 up
	BNE	LB1FB		; branch if not P0 up
LB1CE	LDA	Z0083		; get room number
	CMP	#$08		; row 3 room 1?
	BNE	LB1E5
	JSR	LFCE0		; compare P0 vertical position with $EB
	BCS	LB1E5		; branch if >= (higher than) $EB
	LDA	Z00AA
	SBC	#$09
	CMP	#$87
	BCC	LB1E5		; branch if < $87
	LDY	#$01
	BNE	LB1EC	; (branch always taken)

LB1E5	JSR	LFCB2
	BNE	LB1FB
	LDY	#$00
LB1EC	STY	Z00D7
	LDA	#$13
	STA	Z00D6
	LDX	#$06		; joe_jump sprite
	STX	Z00B5		; set P0 sprite ID
	LDX	#D9341-D9310	; jump sound?
	JSR	LFD18		; play sound
LB1FB	JMP	LB259

LB1FE	LDX	Z00D6
	LDA	Z00AB		; get P0 vertical position
	CLC
	ADC	DFE47,X
	STA	Z00AB		; update P0 vertical position
	DEC	Z00D6
	BMI	LB21F
	LDX	Z00D7
	BEQ	LB259
	DEX
	BNE	LB228
	LDA	Z00D6
	CMP	#$03
	BNE	LB259
	DEC	Z00AB		; decrement P0 vertical position
	LDA	#$FF
	STA	Z00D6
LB21F	JSR	LBA65		; turn off low 2 bits of Z00B4
	JSR	LFCD2
	JMP	LB446

LB228	LDX	Z00AA
	LDA	Z00B4
	BMI	LB23B
	JSR	LB6F6
	BNE	LB24A
	JSR	LFC76
	BCC	LB245
	DEX
	BNE	LB251
LB23B	JSR	LB6F6
	BNE	LB24A
	JSR	LFC76
	BCS	LB250
LB245	JSR	LFCE0		; compare P0 vertical position with $EB
	BCS	LB24D		; branch if >= (higher than) $EB
LB24A	JMP	LB47F

LB24D	JMP	LB581

LB250	INX
LB251	STX	Z00AA
	LDA	Z00B4
	AND	#$C0
	STA	Z00E7
LB259	LDY	#$03
LB25B	LDA	Z0083		; get room number
	CMP	DFF80,Y		; is it a special room?
	BEQ	LB268		; branch if so
	DEY
	BPL	LB25B
LB265	JMP	LB305		; not a special room

LB268	STY	Z00DB
	LDA	Z00D6
	BMI	LB272
	CMP	#$0C
	BCS	LB265
LB272	JSR	LFCB2
	BNE	LB2AD
	LDA	Z00B5		; get P0 sprite ID
	CMP	#$04		; joe_dance1 sprite?
	BEQ	LB2A8
	CMP	#$0E		; joe_dance1 sprite?
	BEQ	LB2A8
	SEC
	LDA	Z00AA
	SBC	#$20
	CMP	#$5C
	BCS	LB265
	LDY	Z00DB
	JSR	LFCE0		; compare P0 vertical position with $EB
	BCS	LB265
	TYA
	ASL
	TAY
	INY
	CMP	DFF8F,Y
	BEQ	LB265
	BCC	LB265
	LDA	Z00B5		; get P0 sprite ID
	CMP	#$06		; joe_jump sprite?
	BEQ	LB265
	LDA	Z0083		; get room number
	CMP	#$05		; second row, third room? (skull room)
	BEQ	LB265
LB2A8	LDA	#$07
	JMP	LB773		; set Z0082 state = 7

LB2AD	JSR	LFCA4
	LDX	#$04		; joe_dance1 sprite?
	STX	Z00B5		; set P0 sprite ID
	LDX	DFF84,Y
	STX	Z00AA
	JSR	LBA48		; read joystick
	BEQ	LB302		; branch if no direction pressed
	AND	#$C0		; check if either P0 left or P0 right
	CMP	#$C0
	BNE	LB302		; branch if either P0 left or P0 right
	LDX	#$0E		; joe_dance1 sprite?
	STX	Z00B5		; set P0 sprite ID
	LDX	Z00AB		; get P0 vertical position
	LDY	#$02
	LDA	Z00E6		; read joystick
	AND	#$10		; check P0 up
	BNE	LB2FC		; branch if not P0 up
	INY
	JSR	LFC1A
	LDA	Z0083		; get room number
	CMP	#$01		; first row, second room? (start room)
	BEQ	LB2E6
	CMP	#$05		; second row, third room? (skull room)
	BNE	LB2EC
	LDA	Z00AA
	CMP	#$26
	BEQ	LB2EC
LB2E6	CPX	#$D4
	BCC	LB2F9
	BCS	LB302

LB2EC	CPX	#$DB
	BCC	LB2F9
	LDA	#$EB
	STA	Z00AB		; update P0 vertical position
	JSR	LFCD2
	BCS	LB302	; (branch always taken)

LB2F9	INX			; move P0 up one pixel
	BNE	LB300	; (branch always taken)

LB2FC	JSR	LFC1A
	DEX			; move P0 down one pixel
LB300	STX	Z00AB		; update P0 vertical position
LB302	JMP	LB47F

LB305	JSR	LBA48		; read joystick
	BNE	LB317		; branch if something pressed
	LDA	Z00B5		; get P0 sprite ID
	CMP	#$0A
	BCC	LB312		; branch if one of first five P0 sprites
	SBC	#$0A
LB312	STA	Z00B5		; set P0 sprite ID
	JMP	LB446

LB317	LDA	Z00D6
	BPL	LB38E
	LDA	Z00E6		; read joystick
	AND	#$C0		; check for either P0 left or P0 right
	CMP	#$C0
	BEQ	LB398		; branch if neither P0 left nor P0 right
	LDX	#$01
	LDY	Z00DD
LB327	SEC
	LDA	Z00AB		; get P0 vertical position
	SBC	DFF99,Y
	CMP	#$0A
	BCC	LB337
	INY
	DEX
	BPL	LB327
	BMI	LB38E

LB337	LDX	#$12		; joe_walk1
	STX	Z00B5		; set P0 sprite ID
	LDA	DFF8D,Y
	CMP	Z00AB		; compare P0 vertical position
	BEQ	LB346
	STA	Z00AB		; update P0 vertical position
	BNE	LB38E	; (branch always taken)

LB346	LDX	#D9327-D9310	; walk sound?
	JSR	LFD18		; play sound
	LDX	Z00AA
	LDY	#$00
	LDA	Z00E6		; read joystick
	AND	#$40		; check for P0 left
	BNE	LB36B		; branch if not P0 left
	INY
	JSR	LFC1A
	JSR	LB6F6
	BEQ	LB363
	JSR	LB391
	BEQ	LB38E
LB363	JSR	LFC76
	BCC	LB37D
	DEX
	BNE	LB386	; (branch always taken)

LB36B	JSR	LFC1A
	JSR	LB6F6
	BEQ	LB378
	JSR	LB391
	BEQ	LB38E
LB378	JSR	LFC76
	BCS	LB385
LB37D	JSR	LFCE0		; compare P0 vertical position with $EB
	BCC	LB38E
	JMP	LB581

LB385	INX
LB386	STX	Z00AA
	LDA	Z00B4
	AND	#$C0
	STA	Z00E7
LB38E	JMP	LB446

LB391	LDA	Z00B4
	AND	#$C0
	CMP	Z00E7
	RTS

LB398	LDY	Z00E0
	LDA	Z00AB		; get P0 vertical position
	CMP	DFF8D,Y		; compare P0 vertical position
	BNE	LB41A
	LDA	Z00D9
	ASL
	ASL
	ASL
	ADC	Z00D9
	STA	Z00DD
	LDA	Z00DE
	STA	Z00D9
	ASL
	ADC	Z00D9
	ADC	Z00DD
	STA	Z00DF
	LDX	#$02
	LDY	Z00DF
	CPY	#$2D
	BCC	LB3BF
	LDY	#$00
LB3BF	SEC
	LDA	Z00AA
	SBC	DFE5F,Y
	CMP	#$0A
	BCC	LB3CF
	INY
	DEX
	BPL	LB3BF
	BMI	LB446

LB3CF	LDX	Z0083		; get room number
	CPY	#$09
	BCS	LB3F0
	LDA	DBBE2,X
	CMP	#$30
	BEQ	LB3E8
	LDA	Z00E6		; read joystick
	AND	DBBE2,X
	BNE	LB3F9
	LDA	DBBE2,X
	BNE	LB401	; branch always taken

LB3E8	AND	Z00E6		; read joystick
	AND	#$10		; check for P0 up
	BEQ	LB40C		; branch if P0 up
	BNE	LB405		; branch if not P0 up

LB3F0	TYA			; copy Y to X
	TAX
	LDA	Z00E6		; read joystick
	AND	DFE95,X
	BEQ	LB3FE
LB3F9	JSR	LFCD2
	BNE	LB446
LB3FE	LDA	DFE95,X
LB401	AND	#$10
	BNE	LB40C
LB405	LDA	Z00AB		; get P0 vertical position
	SEC
	SBC	#$08		; down 8
	BNE	LB410		; branch if not zero
LB40C	LDA	Z00AB		; get P0 vertical position
	ADC	#$04		; up 4
LB410	STA	Z00AB		; update P0 vertical position
	LDA	DFE5F,Y
	CLC
	ADC	#$04
	STA	Z00AA
LB41A	LDA	Z0083		; get room number
	CMP	#$08		; is it third row, first room? (wide pit)
	BEQ	LB446
	LDA	#$0A		; joe_climb1
	STA	Z00B5		; set P0 sprite ID
	LDX	Z00AB		; get P0 vertical position
	LDY	#$02
	LDA	Z00E6		; read joystick
	AND	#$10		; check for P0 up
	BNE	LB439		; branch if not P0 up
	INY
	JSR	LFC1A
	CPX	#$FE
	BCS	LB440		; branch if P0 vertical position = $FE or $FF
	INX			; move P0 up one pixel
	BNE	LB444	; (branch always taken)

LB439	JSR	LFC1A
	CPX	#$87
	BCS	LB443
LB440	JMP	LB581

LB443	DEX			; move P0 down one pixel
LB444	STX	Z00AB		; update P0 vertical position
LB446	JMP	LFD22		; -> LDA6B

LB449	TXA
	BEQ	LB454
	BMI	LB451
	JMP	LB5DA

LB451	JMP	LB2A8

LB454	LDA	Z0083		; get room number
	CMP	#$0F		; is it the bonus room?
	BNE	LB47F
	LDA	Z00E9		; get bonus room timer
	BNE	LB466		; branch if not about to expire
	JSR	LFCD2
	LDA	#$08
	JMP	LB773		; set Z0082 state = 8

LB466	JSR	LFC2D
	BNE	LB47F
	LDA	Z0085
	CMP	#$10
	BCC	LB47F
	CMP	#$88
	BCS	LB47F
	STA	Z00AC		; set P1 horizontal position
	LDA	#$01
	STA	Z00B1		; set P1 sprite type = gem?
	ORA	Z00C3+7		; set low bit of bonus room flags?
	STA	Z00C3+7
LB47F	LDA	Z00B4
	AND	#$03
	BNE	LB489
	LDA	CXPPMM+$50
	BMI	LB48C		; branch if P0 x P1 collision
LB489	JMP	LB57E		; jump if no collision

LB48C	LDA	Z00B4
	ORA	#$02
	STA	Z00B4
	LDA	Z0083		; get room number
	CMP	#$12		; is it fourth row, fourth room? (skull pit)
	BEQ	LB4DD
	CMP	#$05		; is it second row, third room? (skull room)
	BNE	LB4D3
	JSR	LFCE0		; compare P0 vertical position with $EB
	BCC	LB4DD
LB4A1	LDA	Z00E5
	CMP	#$04
	BCC	LB4B1
	LDA	Z00B1		; get P1 sprite type
	CMP	#$05		; < 5 = treasure
	BCC	LB489		; branch if treasure
	CMP	#$06		; torch
	BEQ	LB489		; branch if torch
LB4B1	LDA	Z00B1		; get P1 sprite type
	CMP	#$02
	BCC	LB4C1		; branch if gem or nothing
	CMP	#$05
	BEQ	LB4C1		; branch if skull
	CMP	#$08
	BCS	LB4C1		; branch if snake or spider
	INC	Z00E5
LB4C1	JSR	LBA4F		; Y = level * 6 + 5
	LDX	#$05
LB4C6	LDA	Z0083		; get room number
	CMP	DFF6E,Y
	BEQ	LB4EE
	DEY
	DEX
	BPL	LB4C6
	BMI	LB505

LB4D3	CMP	#$01		; is it first row, second room? (skull room)
	BNE	LB4A1
	LDA	Z00AB		; get P0 vertical position
	CMP	#$C0
	BCS	LB4A1		; branch if >= $C0
LB4DD	LDA	Z00E8		; check amulet timer
	BMI	LB4E4		; branch if amulet not active
	JMP	LB57E

LB4E4	LDA	Z00B4
	ORA	#$01
	STA	Z00B4
	LDX	#$01
	BNE	LB506
LB4EE	LDA	Z00B1		; get P1 sprite type
	CMP	#$05
	BNE	LB559		; branch if not skull
	LDX	#$00
	LDA	Z00C2
	CMP	#$02
	BEQ	LB505
	LDA	Z00AC		; get P1 horizontal position
	CLC
	ADC	#$08
	CMP	Z00AA
	BCS	LB506
LB505	INX
LB506	LDY	#$05
	LDA	Z00B4
	AND	#$01
	BNE	LB51F
	LDY	Z00B1		; get P1 sprite type
	CPY	#$05
	BEQ	LB51F		; branch if skull
	CPY	#$08
	BEQ	LB529		; branch if snake
	CPY	#$0A
	BEQ	LB51F		; branch if spider
	JMP	LB6AE

LB51F	LDA	Z00E8		; get amulet timer
	BPL	LB52D		; branch if amulet active
	LDA	Z00C1		; get inventory
	AND	#$20		; check for sword
	BNE	LB53E
LB529	LDA	Z00E8		; get amulet timer
	BMI	LB533		; branch if amulet not active
LB52D	JSR	LBA65		; turn off low 2 bits of Z00B4
	JMP	LB77F

LB533	JSR	LFCC4
	JSR	LFC47
	LDA	#$1E
	JMP	LB5D8

LB53E	STY	Z00DB
	JSR	LFCC4
	JSR	LFC47
	DEC	Z00E5
	LDX	#D934B-D9310	; kill monster sound?
	JSR	LFD18		; play sound
	LDY	Z00DB
	JSR	LBA14		; add score for sprite type
	LDA	Z00C1		; get inventory
	AND	#$DF		; remove sword
	JMP	LB6E2		; update inventory

LB559	TYA			; Y = Y * 4
	ASL
	ASL
	TAY
	STY	Z00DA		; save Y
	LDX	#$00
LB561	STX	Z00D9		; save X
	LDA	Z00DA		; Y = old Y * 4 + X
	CLC
	ADC	Z00D9		; (add X)
	TAY
	LDA	DBB11,Y
	SBC	#$07
	STA	Z00DB
	LDA	Z00AA
	SEC
	SBC	Z00DB
	CMP	#$10
	BCC	LB506
	INX
	CPX	#$04
	BCC	LB561
LB57E	JMP	LB77F

LB581	LDY	Z0083		; get room number
	LDA	Z00B4
	LSR
	LSR
	LSR
	LSR
	STA	Z00DA
	AND	DBBCA,Y
	BNE	LB593
	JMP	LB47F

; change rooms
LB593	LDA	Z00DA
	LSR
	TAY
	ASL			; Z00D9=0 if up, Z00D9=4 if down
	ASL
	STA	Z00D9
	LDA	DFE2B,Y
	STA	Z00CF		; set starting vertical position
	LDA	Z00D0		; (Z00D0 + Z00D9 becomes room up/down offset)
	ADC	Z00D9
	TAX
	LDA	Z00D0
	ADC	DFEC1,Y
	STA	Z00D0
	LDA	Z0083		; get room number
	CLC
	ADC	DBBAD,X		; get offset (X 0-3 = level, +0 if up, +4 if down)
	STA	Z0083		; update room number
	LDA	#$02
	STA	Z0084
	LDA	#$02		; set Z0082 state = 2
LB5BA	JMP	LB773

; Z0082 = 7
LB5BD	LDY	#$03
LB5BF	LDA	Z0083		; get room number
	CMP	DFF80,Y		; is it a special room?
	BEQ	LB5F7		; branch if so
	DEY
	BPL	LB5BF
	LDA	Z00AB		; get P0 vertical position (not a special room)
	CMP	#$D0
	BCC	LB5D2		; branch if < $D0
	JMP	LB678

LB5D2	LDA	#$D4
	STA	Z00AB		; update P0 vertical position
	LDA	#$1A		; smoke1
LB5D8	STA	Z00B5		; set P0 sprite ID
LB5DA	LDX	#D932D-D9310	; burntjoe sound?
	JSR	LFD18		; play sound
LB5DF	LDX	#$0C
	DEC	Z00BA		; decrement number of lives
	LDA	Z00BA	; redundant load?
	BPL	LB5ED		; branch if lives left
	INC	Z00BA		; keep number of lives positive?
	LDA	#$05		; next Z0082 state = 5 (game over)
	BNE	LB5EF	; <-- CHANGE SECOND BYTE ($05EC) TO $00 FOR IMMORTALITY MODE

LB5ED	LDA	#$02		; next Z0082 state = 2
LB5EF	STA	Z00E4
	STX	Z00B7
	LDA	#$06		; set Z0082 state = 6
	BNE	LB5BA	; branch always taken

LB5F7	TYA
	ASL
	STA	Z00DB
	JSR	LFCB2
	BEQ	LB610
	LDA	#$00
	STA	Z00D8
	JSR	LFCAB
	LDA	DFF84,Y
	STA	Z00AA
	LDA	#$04
	BNE	LB665
LB610	LDX	#$01
	LDY	Z00DB
	CPY	#$04
	BEQ	LB63A
	BCS	LB642
	CPY	#$02
	BEQ	LB630
	SEC
	LDA	Z00AA
	SBC	#$24
	CMP	#$18
	BCC	LB642
	LDA	Z00AA
	SBC	#$64
	CMP	#$18
	JMP	LB640

LB630	LDA	Z00AA
	SBC	#$30
	CMP	#$38
	BCC	LB644
	BCS	LB642

LB63A	LDA	Z00AA
	SBC	#$11
	CMP	#$79
LB640	BCS	LB644
LB642	INY
	DEX
LB644	SEC
	LDA	Z00AB		; get P0 vertical position
	SBC	DFF8F,Y
	CMP	#$05
	BCC	LB654
	INY
	DEX
	BPL	LB644
	BMI	LB678

LB654	LDA	DFF8F,Y
	STA	Z00AB		; update P0 vertical position
	LDX	#$00
	LDA	Z00D8
	STX	Z00D8
	CMP	#$08
	BCS	LB66C
	LDA	#$08		; joe_walk1
LB665	STA	Z00B5		; set P0 sprite ID
	LDA	#$04
	JMP	LB773		; set Z0082 state = 4

LB66C	LDA	#$16		; deadjoe1
	STA	Z00B5		; set P0 sprite ID
	LDX	#D9365-D9310	; deadjoe sound?
	JSR	LFD18		; play sound
	JMP	LB5DF

LB678	LDY	Z00E0
	JSR	LFCD2
	LDA	Z00B4
	AND	#$04
	BEQ	LB6A5
	LDA	#$06		; joe_jump
	STA	Z00B5		; set P0 sprite ID
	LDA	Z0080		; get frame count
	AND	#$01		; test low bit (every 2nd frame)
	BNE	LB6A5		; branch if odd
	LDA	Z00B4
	BMI	LB69C
	LDA	Z00AA
	CMP	DFF56,Y
	BCC	LB6A5
	DEC	Z00AA
	BNE	LB6A5
LB69C	LDA	Z00AA
	CMP	DFF62,Y
	BCS	LB6A5
	INC	Z00AA
LB6A5	INC	Z00D8
LB6A7	DEC	Z00AB		; decrement P0 vertical position by 2
	DEC	Z00AB
	JMP	LB77F

LB6AE	JSR	LFC47
	LDX	#D9310-D9310	; start/score sound
	JSR	LFD18		; play sound
	LDY	Z00B1		; get P1 sprite type
	JSR	LBA14		; add score for sprite type
	CPY	#$04		; key?
	BEQ	LB6CF
	CPY	#$03		; amulet?
	BNE	LB6C7
	LDA	#$4F		; initialize amulet timer
	STA	Z00E8
LB6C7	LDA	Z00C1		; get inventory
	ORA	DFF2B,Y		; add item
	JMP	LB6E2		; update inventory

; add a key to inventory
LB6CF	LDX	DFF2B,Y		; get key item flag to X
	LDY	#$03		; four tries to put a key
LB6D4	TXA			; put flag in A
	AND	Z00C1		; mask with inventory
	BEQ	LB6DF		; branch if bit not set in inventory
	TXA			; put flag in A
	ASL			; shift to next position
	TAX			; put flag back in X
	DEY			; count this try
	BPL	LB6D4		; loop until all 4 positions tried
LB6DF	TXA			; put flag in A
	ORA	Z00C1		; add key
LB6E2	STA	Z00C1		; update inventory
LB6E4	LDX	#$00
	LDA	#$03		; next Z0082 state = 3
	JMP	LB5EF

; Z0082 = 8
; falling at end of bonus room
LB6EB	LDA	Z00AB		; get P0 vertical position
	CMP	#$89
	BCS	LB6A7		; branch if >= $89
	LDA	#$01
	JMP	LB773		; set Z0082 state = 1

LB6F6	STX	Z00D9
	LDY	Z0083		; get room number
	CPY	#$01		; is it first row, second room? (skull room)
	BEQ	LB709
	CPY	#$11		; is it fourth row, third room?
	BEQ	LB709
	CPY	#$05		; is it second row, third room? (skull room)
	BEQ	LB709
LB706	LDA	#$00
	RTS

LB709	LDA	CXP0FB+$50	; (above three rooms have two doors)
	BPL	LB706
	JSR	LFCE0		; compare P0 vertical position with $EB
	BCC	LB71B
	CPY	#$05		; is it second row, third room? (skull room)
	BNE	LB725
LB716	LDX	Z00D9
	LDA	#$01
	RTS

LB71B	CPY	#$05
	BNE	LB706
	SBC	#$9D
	CMP	#$14
	BCS	LB706
LB725	LDY	#$03
	LDX	#$02
LB729	TXA
	AND	Z00C1		; mask with inventory
	BNE	LB736
	TXA
	ASL
	TAX
	DEY
	BPL	LB729
	BMI	LB716

LB736	TXA
	EOR	#$FF
	AND	Z00C1		; mask with inventory
	STA	Z00C1		; update inventory
	DEC	Z00E5
	LDX	#$02
	LDA	Z00AA
	CMP	#$58
	BCS	LB74C
	CMP	#$41
	BCS	LB706
	INX
LB74C	JSR	LFC47
	LDX	#D9337-D9310	; opening door sound
	JSR	LFD18		; play sound
	LDA	#$02		; add 300 points (for opening a door?)
	JSR	LBA17
	PLA
	PLA
	JMP	LB6E4

; Z0082 = 5 (game over)
LB75E	JSR	LBA6C		; check fire button
	BEQ	LB77A		; branch if not pressed
	LDA	#$00		; set Z0082 state = 0 (reset game)
	BEQ	LB773	; branch always taken

; Z0082 = 6
LB767	LDA	Z0080		; get frame count
	AND	#$03		; test low two bits (every 4th frame)
	BNE	LB77A		; branch if either bit set
	LDA	Z00B7
	BNE	LB778
	LDA	Z00E4		; get next Z0082 state
LB773	STA	Z0082		; set Z0082 state
	JMP	LB77F

LB778	DEC	Z00B7
LB77A	JMP	LB77F

LB77D	INC	Z0082		; increment Z0082 game state (3 -> 4)
; top of screen, do score first
LB77F	LDA	INTIM
	BNE	LB77F
	LDA	#$02
	STA	WSYNC
	STA	VBLANK		; 02 = start vertical blank
	STA	WSYNC
	STA	WSYNC
	STA	WSYNC
	STA	VSYNC		; 02 = start vertical sync
	LDA	#$21
	STA	TIM8T		; start vertical sync timer
	LDX	Z0086
	LDY	Z0085
	ROL	Z0085
	ROL	Z0086
	LDA	Z0085
	ADC	#$C3
	STY	Z0085
	EOR	Z0085
	STA	Z0085
	TXA
	EOR	Z0086
	STA	Z0086
LB7AE	LDA	INTIM		; wait for end of vertical sync
	BNE	LB7AE
	STA	WSYNC
	STA	VSYNC		; 00 = stop vertical sync
	LDA	#$19
	STA	TIM64T		; set vertical blank timer
	LDX	#$02		; counter for 3 pairs of digits
	LDY	#$0A
LB7C0	LDA	Z0093,X		; get one byte of score (low byte first)
	AND	#$0F		; get low nibble
	ASL			; put nibble in D6-D3
	ASL
	ASL
	ADC	#D9008-D9000	; add offset $08 to digit table
	STA	Z0087,Y		; Store digit (Y = 10, 6, 2)
	DEY
	DEY
	LDA	Z0093,X		; get one byte of score
	AND	#$F0		; get high nibble
	LSR			; put nibble in D6-D3
	ADC	#D9008-D9000	; add offset $08 to digit table
	STA	Z0087,Y		; Store digit (Y = 8, 4, 0)
	DEY
	DEY
	DEX
	BPL	LB7C0
	LDY	#D9000-D9000	; Y = $00 (blank offset)
	INX			; X = $00, start with first digit
LB7E0	LDA	#D9008-D9000	; is it a zero?
	CMP	Z0087,X
	BEQ	LB7E9		; branch if zero
	TAY			; not zero, so set Y = $08 (zero offset)
	BNE	LB7EB	; branch always taken

LB7E9	STY	Z0087,X		; store blank (or zero) in position
LB7EB	INX			; point to second byte of pointer
	LDA	#>D9000		; store high byte of pointer = $90 for digit
	STA	Z0087,X
	INX			; point to next digit's pointer
	CPX	#$0A		; have we reached the last digit?
	BNE	LB7E0		; loop if not
	STA	Z0091+1		; store high byte of pointer = $90 for last digit
	LDA	#$39
	JSR	LFC00		; set up P0 position
	LDA	#$41
	JSR	LFC02		; set up P1 position
	INX			; X refers to M1 now
	LDY	#$03
LB804	LDA	Z0083		; get room number
	CMP	DFF80,Y		; is it a special room?
	BEQ	LB810		; branch if so
	DEY
	BPL	LB804		; loop until all room numbers checked
	BMI	LB818		; not a special room (branch always taken)

LB810	LDA	DFF84,Y
	ADC	#$04
	JSR	LFC02		; set up M1 position
LB818	LDX	#$04
	LDY	Z0083		; get room number
	LDA	DFE2F,Y
	JSR	LFC02		; set up ball position
	STA	WSYNC		; wait for next line
	STA	HMOVE		; apply sprite offsets
	STA	WSYNC		; wait another line
	STA	HMCLR		; clear horizontal movement registers
LB82A	LDA	INTIM		; wait for end of vertical blank
	BNE	LB82A
	STA	WSYNC
	STA	VBLANK		; end vertical blank
	LDA	#$15
	STA	TIM64T
LB838	LDA	SWCHA		; read joystick
	STA	Z00E6		; save joystick state
	EOR	#$FF
	BEQ	LB845		; branch if both (!) joysticks at rest
	LDA	#$00
	STA	Z0081		; clear screen saver timer
LB845	LDA	Z0081		; get screen saver timer
	BMI	LB838		; tight loop to read joystick if timer >127 (8 hours?)
	INC	Z0080		; increment screen count?
	BNE	LB851		; branch if non-zero
	INC	Z0081		; increment screen saver timer (every 4 minutes)
	INC	Z00EA
LB851	LDY	#$01
	LDA	Z00EA
	AND	#$3F
	BNE	LB86D
	CPY	Z0083		; get room number
	BEQ	LB86D		; is it first row, first room?
	LDA	Z00C1		; get inventory
	AND	#$1E		; check for keys
	BNE	LB86D
	TYA
	AND	Z0085
	BNE	LB86D
	TYA
	ORA	Z00C3
	STA	Z00C3
LB86D	LDA	Z00D3
	BEQ	LB873
	DEC	Z00D3
LB873	LDA	Z0084
	BEQ	LB879
	DEC	Z0084
LB879	LDA	Z0080		; get screen count
	AND	#$07		; test low three bits (every 8th frame)
	BNE	LB898		; branch if any bit set
	LDA	Z00E8		; get amulet timer
	BMI	LB892		; branch if amulet not active
	BNE	LB890		; branch if amulet not about to expire
	DEC	Z00E5
	LDA	Z00C1		; get inventory
	AND	#$FE		; remove amulet
	STA	Z00C1		; update inventory
	JSR	LBA65		; turn off low 2 bits of Z00B4
LB890	DEC	Z00E8		; decrement amulet timer
LB892	LDA	Z00E9		; get bonus room timer
	BMI	LB898		; branch if timer not active
	DEC	Z00E9		; decrement bonus room timer
LB898	LDA	Z0082
	CMP	#$04
	BEQ	LB8A5
	CMP	#$07
	BEQ	LB8A5
	JMP	LB9F3

LB8A5	LDX	Z0083		; get room number
	BEQ	LB8B1		; is it first row, first room? (6 gates)
	CPX	#$07		; is it second row, fifth room? (6 gates)
	BEQ	LB8B1
	CPX	#$0C		; is it third row, fifth room? (8 games)
	BNE	LB8D4
LB8B1	LDA	Z0080		; get screen count
	AND	#$7F		; test low 7 bits (every 128th frame)
	BNE	LB8BB		; branch if any bit set
	LDA	#$30
	STA	Z00D3
LB8BB	LDA	Z00D3
	BEQ	LB8C5
	LDX	#<DFD75 ; blank
	LDA	#>DFD75
	BNE	LB8D0
LB8C5	LDA	Z0080		; get screen count
	AND	#$06		; get 2nd and 3rd bits (4 counts, every 2nd frame)
	TAY
	LDX	DFE0B,Y
	LDA	DFE0B+1,Y
LB8D0	STX	Z009A
	STA	Z009A+1
LB8D4	JSR	LFC2D		; get room flags to Z00C2
	STA	Z00D9		; save room flags in Z00D9
	JSR	LBA5B		; Y = level*24 + room
	LDA	Z00D9		; restore room flags to A
	AND	DBA7B,Y
	BNE	LB8E5
	STA	Z00B1		; set P1 sprite type
LB8E5	LDA	Z00B1		; get P1 sprite type
	ASL
	STA	Z00D9
	CMP	#$0C
	BCC	LB8F1
	JSR	LFCD7
LB8F1	TAY			; Y = sprite index * 2
	LDA	DFF3A,Y		; store sprite data pointer at Z0096
	STA	Z0096
	LDA	DFF3A+1,Y
	STA	Z0096+1
	LDY	Z00B9		; get level number
	LDA	Z0080		; get frame count
	AND	DBAC3,Y		; test low bits (03, 01, 00)
	BNE	LB970		; branch if any bit set
	LDA	Z00B1		; get P1 sprite type
	CMP	#$0A
	BEQ	LB949		; branch if spider
	CMP	#$05
	BNE	LB970		; branch if not skull
	INC	Z00BF
	LDA	Z00B0
	BPL	LB919
	DEC	Z00BF
	DEC	Z00BF
LB919	LDY	Z00AD		; get P1 vertical position
	LDA	Z00BF
	AND	#$0F
	TAX
	LDA	DBBBA,X
	STA	Z00D9		; save ???
	LDA	Z00B0
	BPL	LB936
	CPX	#$00
	BNE	LB943
LB92D	LDA	Z00B0
	EOR	#$80
	STA	Z00B0
	JMP	LB949

LB936	CPX	#$0F
	BEQ	LB92D
	LDA	Z00D9		; get ???
	EOR	#$FF
	CLC
	ADC	#$01
	STA	Z00D9		; save ???
LB943	TYA			; add ??? to P1 vertical position
	CLC
	ADC	Z00D9
	STA	Z00AD		; set P1 vertical position
LB949	LDX	Z00AC		; get P1 horizontal position
	LDA	Z00B0
	AND	#$08
	BNE	LB958
	CPX	#$06
	BEQ	LB96A
	DEX
	BNE	LB966
LB958	LDA	Z00D4
	BNE	LB961
	CPX	#$94
	JMP	LB963

LB961	CPX	#$84
LB963	BEQ	LB96A
	INX
LB966	STX	Z00AC		; set P1 horizontal position
	BNE	LB970
LB96A	LDA	Z00B0
	EOR	#$08
	STA	Z00B0
LB970	JSR	LFC2D
	AND	#$02
	BNE	LB97A
	JMP	LB9F3

LB97A	LDY	Z00B9		; get level number
	LDA	Z0080		; get frame count
	AND	DBAC3,Y		; test low bits (03, 01, 00)
	BNE	LB9BD		; branch if any bit set
	LDX	Z00AF		; get horizontal skull position
	LDA	Z00B3
	AND	#$08
	BNE	LB9AB
	LDY	Z0083		; get room number
	CPY	#$06		; is it second row, fourth room or greater?
	BCC	LB996		; branch if room number is >= 6
	CPX	#$22
	JMP	LB998

LB996	CPX	#$16
LB998	BEQ	LB99D
	DEX
	BNE	LB9BB
LB99D	LDA	Z00B3
	EOR	#$08
	STA	Z00B3
	LDA	Z00BE		; get skull sprite index
	EOR	#$0F		; flip it around?
	STA	Z00BE		; update skull sprite index
	BPL	LB9BD
LB9AB	LDY	Z0083		; get room number
	CPY	#$06		; is it second row, fourth room or greater?
	BCC	LB9B6		; branch if room number is >= 6
	CPX	#$7A
	JMP	LB9B8

LB9B6	CPX	#$48
LB9B8	BEQ	LB99D
	INX
LB9BB	STX	Z00AF		; set horizontal skull position
LB9BD	LDY	Z00B9		; get level number
	LDA	Z0080		; get frame count
	AND	DBAC2,Y		; test low bits (07, 03, 01)
	BNE	LB9E5		; branch if any bit set
	INC	Z00BE		; increment skull sprite index
	LDA	Z00BE		; get skull sprite index
	AND	#$0F		; make sure it's 0-15
	STA	Z00BE		; update skull sprite index
	TAX
	LDY	#$00		; P1 not reflected for skull
	LDA	Z00B3
	AND	#$08
	BEQ	LB9DD
	CPX	#$09
	BCC	LB9E3		; branch if x < 9
	BCS	LB9E1		; branch if x >= 9

LB9DD	CPX	#$08
	BCS	LB9E3		; branch if X >= 8
LB9E1	LDY	#$08		; P1 reflected for skull
LB9E3	STY	Z00BD		; save skull reflect flag
LB9E5	LDA	Z00BE		; get skull sprite index
	ASL
	TAY
	LDA	DFDA3,Y		; rotating skull table
	STA	Z0098		; save address of skull sprite
	LDA	DFDA3+1,Y
	STA	Z0098+1
LB9F3	LDA	Z00D0
	CLC
	ADC	Z00B9		; add level number
	TAY
	LDA	DFDFF,Y		; get color
	STA	Z00D1
	LDA	DFE05,Y		; get color
	STA	Z00D2
	LDA	SWCHB
	AND	#$01		; reset switch
	BNE	LBA0C		; branch if no reset
	STA	Z0082		; A = 0, so this sets Z0082 state = 0
LBA0C	LDA	INTIM
	BNE	LBA0C
	JMP	LFD07		; -> L90B3 (display number of lives left)

; add score according to DBA3D table
LBA14	LDA	DBA3D,Y		; get score from DBA3D table
; add score (A+1)*100 points
LBA17	STY	Z00DD		; save Y register for return
	SED			; turn on decimal mode
	SEC			; add 100 points more than requested score
	ADC	Z0094		; add to middle byte of score
	STA	Z0094		; upade middle byte of score
	BCC	LBA39		; branch if didn't cross a 10000 boundary
	LDA	Z0094		; redundant?
	BCC	LBA32		; redundant?
	LDA	Z00BA		; get life counter
	CMP	#$06		; already 6 lives?
	BEQ	LBA32		; branch if already six lives
	INC	Z00BA		; increment number of lives
	LDX	#D9386-D9310	; extra life music
	JSR	LFD18		; play sound
LBA32	LDA	Z0093		; get high byte of score
	SEC			; add 1 to high byte
	ADC	#$00
	STA	Z0093		; update high byte of score
LBA39	CLD
	LDY	Z00DD		; restore Y register
	RTS

; Score table - (n+1)*100
; 300 = opening doors
DBA3D	.byte	$00,$09,$00,$01	; null=100,    gem=1000,    sword=100,  amulet=200
	.byte	$00,$19,$29,$00	; key=100,     skull=2000,  torch=3000, (torch2=100)
	.byte	$00,$00,$29	; (snake=100), (snake=100), spider=3000

LBA48	LDA	Z00E6		; get joystick state
	AND	#$F0		; mask out P0 bits
	CMP	#$F0		; return Z flag set if not pressed
	RTS

; Y = level * 6 + 5
LBA4F	LDY	Z00B9		; get level number
	LDA	DBB58,Y		; mulitply by 24
	LSR			; divide by 4
	LSR
	CLC
	ADC	#$05		; add 5
	TAY			; return level*24/6 + 5 in Y
	RTS

; Y = level*24 + room
LBA5B	LDY	Z00B9		; get level number
	LDA	DBB58,Y		; mulitply by 24
	CLC
	ADC	Z0083		; add room number
	TAY			; return level*24 + room in Y
	RTS

LBA65	LDA	Z00B4		; turn off low 2 bits of Z00B4
	AND	#$FC
	STA	Z00B4
	RTS

; check fire button, returns A=$FF and Z flag clear (BNE) if fire button newly pressed
LBA6C	LDY	#$00		; Y = 0, no fire button pressed
	LDA	INPT4+$60	; read fire button
	BMI	LBA77		; branch if fire button not pressed
	LDA	Z00B8		; was fire button already pressed?
	BNE	LBA79		; return zero if already pressed
	DEY			; Y = $FF, fire button pressed
LBA77	STY	Z00B8		; save fire button state
LBA79	TYA			; set flags and save state in A reg
	RTS

DBA7B	.byte	            $01,$01,$03
	.byte	        $03,$01,$01,$01,$01
	.byte	    $01,$05,$01,$09,$00,$01,$01
	.byte	$01,$00,$00,$00,$01,$09,$01,$01,$07
	.byte	            $01,$01,$01
	.byte	        $03,$01,$01,$01,$01
	.byte	    $05,$01,$01,$01,$00,$09,$01
	.byte	$01,$00,$00,$00,$03,$07,$01,$01,$03
	.byte	            $01,$01,$05
	.byte	        $09,$05,$01,$01,$01
	.byte	    $01,$01,$01,$03,$00,$01,$01
	.byte	$01,$00,$00,$00,$01,$01,$01,$03;$07

DBAC2	.byte	$07
DBAC3	.byte	$03,$01
DBAC5	.byte	$00,$00,$00,$08,$08 ; P0 sprite reflect (5 bytes) -> Z00B4

DBACA	.byte	            $19,$0E,$64		; P1 horizontal position -> Z00AC
	.byte	        $2C,$5A,$4E,$0C,$82
	.byte	    $4E,$12,$10,$2C,$50,$64,$4D
	.byte	$14,$50,$50,$3C,$10,$4C,$3C,$1E,$64
	.byte	            $19,$0E,$84
	.byte	        $0C,$1E,$4E,$0C,$82
	.byte	    $3D,$28,$10,$10,$50,$2C,$4D
	.byte	$14,$50,$50,$3C,$1E,$3D,$10,$1E,$74
	.byte	            $46,$0E,$12
	.byte	        $2C,$12,$4E,$82,$82
	.byte	    $14,$32,$10,$78,$50,$78,$4D
	.byte	$14,$50,$50,$3C,$1E,$8A,$64,$18;$64

DBB11	.byte	$64,$74,$00,$00, $2C,$3C,$00,$00 ; P1 horizontal position? -> Z00AC/Z00DB
	.byte	$12,$00,$32,$00, $2C,$00,$00,$6C
	.byte	$4C,$00,$00,$8C, $64,$74,$84,$00

	.byte	$0C,$1C,$00,$00, $3D,$00,$5D,$00
	.byte	$2C,$00,$00,$6C, $10,$20,$00,$00
	.byte	$3D,$4D,$5D,$00, $74,$84,$00,$00

	.byte	$12,$00,$32,$00, $2C,$00,$00,$6C
	.byte	$12,$00,$32,$00, $78,$88,$00,$00
	.byte	$18,$28,$00,$00, $64,$74,$84;$00

DBB58	.byte	$00,$18,$30	; multiply by 24 table for levels

DBB5B	.byte	            $FE,$FE,$FE		; P1 vertical position -> Z00AD
	.byte	        $FE,$E2,$FE,$FE,$FE
	.byte	    $FE,$E4,$FE,$E4,$FE,$E2,$C9
	.byte	$FE,$FE,$FE,$E4,$FE,$FE,$E2,$E4,$FE
	.byte	            $FE,$FE,$FE
	.byte	        $FE,$E4,$FE,$FE,$FE
	.byte	    $FE,$E2,$FE,$FE,$FE,$E4,$FE
	.byte	$FE,$FE,$FE,$E4,$FE,$FE,$FE,$E2,$FE
	.byte	            $FE,$FE,$E4
	.byte	        $FE,$E4,$FE,$E2,$FE
	.byte	    $FE,$E2,$FE,$FE,$FE,$FE,$C9
	.byte	$FE,$FE,$FE,$E4,$E2,$FE,$E4,$FE,$FE

DBBA3	.byte	$4D,$4D,$01,$4D,$98	; P0 starting horiz pos (5 bytes) -> Z00AA
DBBA8	.byte	$0A,$0A,$08,$08,$08	; P0 starting sprite (5 bytes) -> Z00B5

DBBAD	.byte	$00,$FC,$FA,$F8		; room up offsets
	.byte	$04,$06,$08,$00		; room down offsets
	.byte	$FF,$FF,$FF,$FF,$00	; possible start of room left/right offsets
DBBBA	.byte	$00,$00,$00,$01,$01,$01,$01,$02	; -> Z00D9
	.byte	$02,$02,$02,$03,$03,$03,$04,$04	; P1 vertical adjustment by Z00BF

DBBCA	.byte	            $0A,$0C,$06
	.byte	        $0A,$0F,$0E,$0D,$06
	.byte	    $08,$05,$09,$0F,$0C,$0F,$06
	.byte	$00,$0C,$0C,$0C,$0D,$04,$09,$0D,$04

DBBE2	.byte	            $20,$20,$20
	.byte	        $20,$30,$FF,$10,$20
	.byte	    $20,$10,$10,$30,$FF,$30,$FF
	.byte	$FF,$FF,$FF,$FF,$10,$FF,$10,$10,$FF

	.byte	$FF,$FF,$00,$0D,$E9,$00

; ------------ PAGE 3 ------------

	ORG	$1C00
	RORG	$9000

; score digit data
D9000	.byte	$00	; . . . . . . . .
	.byte	$00	; . . . . . . . .
	.byte	$00	; . . . . . . . .
	.byte	$00	; . . . . . . . .
	.byte	$00	; . . . . . . . .
	.byte	$00	; . . . . . . . .
	.byte	$00	; . . . . . . . .
	.byte	$00	; . . . . . . . .

D9008	.byte	$38	; . . # # # . . .
	.byte	$6C	; . # # . # # . .
	.byte	$6C	; . # # . # # . .
	.byte	$6C	; . # # . # # . .
	.byte	$6C	; . # # . # # . .
	.byte	$6C	; . # # . # # . .
	.byte	$7C	; . # # # # # . .
	.byte	$38	; . . # # # . . .

	.byte	$18	; . . . # # . . .
	.byte	$38	; . . # # # . . .
	.byte	$18	; . . . # # . . .
	.byte	$18	; . . . # # . . .
	.byte	$18	; . . . # # . . .
	.byte	$18	; . . . # # . . .
	.byte	$3C	; . . # # # # . .
	.byte	$3C	; . . # # # # . .

	.byte	$38	; . . # # # . . .
	.byte	$6C	; . # # . # # . .
	.byte	$0C	; . . . . # # . .
	.byte	$18	; . . . # # . . .
	.byte	$30	; . . # # . . . .
	.byte	$6C	; . # # . # # . .
	.byte	$7C	; . # # # # # . .
	.byte	$7C	; . # # # # # . .

	.byte	$38	; . . # # # . . .
	.byte	$6C	; . # # . # # . .
	.byte	$0C	; . . . . # # . .
	.byte	$18	; . . . # # . . .
	.byte	$0C	; . . . . # # . .
	.byte	$6C	; . # # . # # . .
	.byte	$7C	; . # # # # # . .
	.byte	$38	; . . # # # . . .

	.byte	$18	; . . . # # . . .
	.byte	$18	; . . . # # . . .
	.byte	$38	; . . # # # . . .
	.byte	$28	; . . # . # . . .
	.byte	$68	; . # # . # . . .
	.byte	$7C	; . # # # # # . .
	.byte	$FC	; # # # # # # . .
	.byte	$18	; . . . # # . . .

	.byte	$7C	; . # # # # # . .
	.byte	$60	; . # # . . . . .
	.byte	$60	; . # # . . . . .
	.byte	$78	; . # # # # . . .
	.byte	$0C	; . . . . # # . .
	.byte	$6C	; . # # . # # . .
	.byte	$7C	; . # # # # # . .
	.byte	$38	; . . # # # . . .

	.byte	$38	; . . # # # . . .
	.byte	$6C	; . # # . # # . .
	.byte	$60	; . # # . . . . .
	.byte	$78	; . # # # # . . .
	.byte	$6C	; . # # . # # . .
	.byte	$6C	; . # # . # # . .
	.byte	$7C	; . # # # # # . .
	.byte	$38	; . . # # # . . .

	.byte	$7C	; . # # # # # . .
	.byte	$0C	; . . . . # # . .
	.byte	$0C	; . . . . # # . .
	.byte	$18	; . . . # # . . .
	.byte	$18	; . . . # # . . .
	.byte	$30	; . . # # . . . .
	.byte	$30	; . . # # . . . .
	.byte	$30	; . . # # . . . .

	.byte	$38	; . . # # # . . .
	.byte	$6C	; . # # . # # . .
	.byte	$6C	; . # # . # # . .
	.byte	$38	; . . # # # . . .
	.byte	$6C	; . # # . # # . .
	.byte	$6C	; . # # . # # . .
	.byte	$7C	; . # # # # # . .
	.byte	$38	; . . # # # . . .

	.byte	$38	; . . # # # . . .
	.byte	$6C	; . # # . # # . .
	.byte	$6C	; . # # . # # . .
	.byte	$3C	; . . # # # # . .
	.byte	$0C	; . . . . # # . .
	.byte	$6C	; . # # . # # . .
	.byte	$7C	; . # # # # # . .
	.byte	$38	; . . # # # . . .

D9058	.byte	$00	; . . . . . . . .	; number of lives hats
	.byte	$FE	; # # # # # # # .	; (upside-down)
	.byte	$FE	; # # # # # # # .
	.byte	$38	; . . # # # . . .
	.byte	$38	; . . # # # . . .
	.byte	$38	; . . # # # . . .

D905E	.byte	$00,$46,$FA,$46,$FA,$FA		; colors for hat

; display score/inventory data from Z0087-Z0091 pointers
L9064	STX	COLUP0		; set P0 and P1 color = X
	STX	COLUP1
	STA	Z00DB		; save number of lines in Z00DB
	LDY	#$00		; clear player graphics, line count
	STY	GRP0
	STY	GRP1
	STY	REFP0		; don't reflect P0
	LDX	#$03
	STX	VDELP0		; set vertical delay P0
	STX	VDELP1		; set vertical delay P1
	STX	NUSIZ0		; 1 clock, 3 copies close
	STX	NUSIZ1		; 1 clock, 3 copies close
L907C	LDA	(Z0091),Y	; get sixth byte
	STA	Z00D9		; save sixth byte in Z00D9
	STA	WSYNC		; wait for start of line
	LDA	(Z0087),Y	; put first byte in GRP0
	STA	GRP0		;   from Z0087 table
	LDA	(Z0089),Y	; put second byte in GRP1
	STA	GRP1		;   from Z0089 table
	LDA	(Z008B),Y	; put third byte in GrP2
	STA	GRP0		;   from Z008B table
	LDA	(Z008D),Y	; save fourth byte in X reg
	TAX
	LDA	(Z008F),Y	; get fifth byte
	STY	Z00DA		; save line count in Z00DA
	LDY	Z00D9		; get sixth byte from Z00D9
	STX	GRP1		; put fourth byte in GRP1, from (Z008D) table
	STA	GRP0		; put fifth byte in GRP0, from (Z008F) table
	STY	GRP1		; put sixth byte in GRP1, from (Z0091) table
	STY	GRP0		; put sixth byte in GRP0, from (Z0091) table
	LDY	Z00DA		; restore line count from Z00DA
	INY			; count this line
	CPY	Z00DB		; compare with number of lines in Z00DB
	BCC	L907C		; loop while lines left
	LDY	#$00
	STA	WSYNC		; wait for next line
	STY	VDELP0		; don't vertical delay P0
	STY	VDELP1		; don't vertical delay P1
	STY	GRP0		; clear P0 graphics
	STY	GRP1		; clear P1 graphics
	RTS

; display score and hats
L90B3	LDX	#$00		; don't reflect P1
	STX	REFP1
	STA	WSYNC		; wait for next line
	LDX	#$0E		; $0E = white
	LDA	#$08		; 8 lines
	JSR	L9064		; display score
	LDX	Z00BA		; get life counter
	LDA	DFF33,X		; get player size
	STA	NUSIZ1		; high nibble to P1 size
	LSR
	LSR
	LSR
	LSR
	STA	NUSIZ0		; low nibble to P0 size
	LDA	#D9058-D9000	; Y = low byte of hat image
	TAY			;   to both Z0087 and Z0089 images
	CPX	#$02
	BCS	L90DA		; branch if >= 2 lives left
	LDA	#D9000-D9000	; blank Z0089 image
	DEX
	BEQ	L90DA		; branch if 1 life left
	TAY			; blank Z0087 image
L90DA	STA	Z0089
	STY	Z0087
	LDY	#$05		; 6 lines in hat image
L90E0	LDA	(Z0087),Y	; get P0 image
	STA	WSYNC		; wait a line
	STA	GRP0		; put P0 image
	LDA	(Z0089),Y	; get P1 image
	STA	GRP1		; put P1 image
	LDA	D905E,Y		; get hat color
	STA	COLUP0
	STA	COLUP1
	DEY
	BPL	L90E0		; loop for hat image

; clear Z0087-Z0091 to point to blanks
	LDY	#$0A
	LDX	#>DFD75 ; blank
	LDA	#<DFD75
L90FA	STX	Z0087+1,Y
	STA	Z0087,Y
	DEY
	DEY
	BPL	L90FA

; set up inventory sprites
	LDX	#$00		; X = $00 (pointer to sprite slot)
	INY			; Y = $00 (offset in DFDC3 inventory sprite table)
	LDA	Z00C1		; get inventory
L9108	INY			; increment loop count
	CPY	#$08
	BCS	L9134		; branch if Y >= 8
	ASL			; shift out high bit of A reg
	STA	Z00D9		; save A reg in Z00D9
	BCS	L9120		; branch if high bit of A was set
	JSR	LFC8D	; RTS	; delay a bit
	JSR	LFC8D	; RTS
	LDA	(Z00A2),Y	; redundant load (for delay?)
	NOP			; delay
	LDA	Z00D9		; restore A reg
	JMP	L9108		; loop

L9120	INC	Z00C0
	STY	Z00DB		; save Y reg in Z00DB
	TYA
	ASL			; multiply by 2
	TAY
	LDA	DFDC3,Y		; get pointer to inventory graphics
	STA	Z0087,X		; save in sprite slot
	INX			; increment sprite slot pointer
	INX
	LDA	Z00D9		; restore A reg from Z00D9
	LDY	Z00DB		; restore Y reg from Z00DB
	BPL	L9108	; (branch always taken)

L9134	LDX	#$FC		; $FC = light brown
	LDA	#$10		; 16 lines
	JSR	L9064		; display inventory
	STY	NUSIZ0		; Y=0, P0 1 clock, 1 copy
	LDA	Z00D4		; set P1 number and size
	STA	NUSIZ1
	LDA	Z00B4		; set P0 reflect
	STA	REFP0
	LDA	#$11		; CTRLPF = ball 2 clocks, reflect playfield
	LDY	Z0083		; get room number
	CPY	#$0E		; third row, seventh room? (wide pit and ladder)
	BEQ	L9153
	CPY	#$05		; second row, third room? (skull room)
	BEQ	L9153
	LDA	#$21		; CTRLPF = ball 4 clocks, reflect playfield
L9153	STA	CTRLPF
	LDY	#$00		; $00 = black
	LDA	Z0083		; get room number
	CMP	#$0F		; is it the bonus room?
	BNE	L9165
	LDA	Z0080		; get frame count
	AND	#$01		; test low bit (every 2nd frame)
	BNE	L917C		; branch if any bit set
	BEQ	L9177

L9165	CMP	#$13
	BCC	L9177		; branch if room number < 4th row middle room
	LDA	Z00B1		; get P1 sprite type
	CMP	#$05
	BEQ	L9177		; branch if skull
	CMP	#$0A
	BEQ	L9177		; branch if spider
	LDA	Z00C1		; get inventory
	BPL	L917C		; branch if no torch
L9177	LDX	Z00B2		; get P1 sprite color index
	LDY	DFDF4,X		; get P1 sprite color
L917C	STY	COLUP1		; set P1 sprite color (or black if dark)
	LDX	#$00
	LDY	Z0083		; get room number
	CPY	#$0F		; is it the bonus room?
	BCC	L91A6
	BNE	L918C
	LDA	#$90		; COLUPF = $90 = dark blue
	BNE	L91A0	; (branch always taken)

L918C	LDA	Z00C1		; get inventory
	BPL	L9198		; branch if no torch
	CPY	#$11		; is it forth row third room? (two doors)
	BNE	L91A6
	LDX	#$FC		; set doors color = brown
	BNE	L91A6	; (branch always taken)

L9198	CPY	#$11		; is it forth row third room? (two doors)
	BEQ	L919E
	LDX	Z00D1		; get first room color for fire pit bridge
L919E	LDA	#$00		; COLUPF = $00 = black
L91A0	STA	COLUPF		; set playfield and both room colors identically
	STA	Z00D1
	STA	Z00D2
L91A6	STX	Z00D5		; set doors/fire pit bridge color
	LDA	Z00AA
	JSR	LFC00		; set up P0 position
	LDY	Z00D1
	STY	COLUBK
	LDA	Z00AC		; get horizontal P1 position
	LDY	Z0083		; get room number
	CPY	#$12		; is it fourth row, fourth room? (skull and fire pit)
	BNE	L91BB
	LDA	Z00AF		; get horizontal skull position
L91BB	JSR	LFC02		; set up P1 position
	STA	WSYNC		; wait for next line
	STA	HMOVE		; apply sprite offsets
	LDA	#$00		; $00 = black
	CPY	#$0F		; is it the bonus room?
	BEQ	L91CA		; don't set background black if so
	STA	COLUBK		; set background = black
L91CA	STA	CXCLR		; clear collision latches
	STA	WSYNC		; wait another line
	STA	HMCLR		; clear horizontal movement registers
	JMP	LFCFB		; -> LD31C

; start sound playing, index in X reg
L91D3	LDY	#$00		; audio channel 0
	LDA	D9310,X		; get next sound byte
	AND	#$10
	BNE	L91E1		; branch if $10 bit set
	LDA	Z00EF,Y		; exit if sound already playing
	BNE	L91F3
L91E1	LDA	#$00		; initialize duration counter to zero
	STA	Z00ED,Y
	LDA	D9310,X		; get sound byte again
	STA	AUDC0,Y		; store low nibble in AudC0/1
	STA	Z00EF,Y		; save byte in Z00EF
	BMI	L91F6		; branch if $80 bit set
	STX	Z00EB,Y		; save channel sound index in Z00EB
L91F3	JMP	LFD1E		; -> RTS to Bxxx

L91F6	INX			; get next sound byte
	LDA	D9310,X
	STX	Z00EB,Y		; save channel 0 sound index in Z00EB
	TAX			; get channel 1 sound index
	LDY	#$01		; audio channel 1
	BNE	L91E1	; (branch always taken)

; play sound, once per screen
L9201	LDX	#$01	; <- LFD0D	; start with audio channel 1
L9203	LDA	Z00ED,X		; check duration counter
	BEQ	L920E		; branch if zero
	DEC	Z00ED,X		; decrement duration counter
L9209	DEX			; decrement audio channel counter
	BPL	L9203		; branch if channel=0 needs to be done
	BMI	L9243		; branch if both channels done

L920E	LDY	Z00EB,X		; get channel sound index
	INY			; get next byte
	LDA	D9310,Y
	BNE	L921C		; branch if not zero (not end of sound)
	STA	AUDV0,X		; store zero in AudV0/1
	STA	Z00EF,X		; store zero in Z00EF
	BEQ	L9209	; branch always taken

L921C	STA	AUDF0,X		; store low 5 bits in AudF0/1
	LDA	#$0F		; set volume to maximum
	STA	AUDV0,X
	LDA	D9310,Y		; get sound byte again
	STY	Z00EB,X		; save sound index
	CMP	#$F0
	BCC	L9236		; branch if sound byte < $F0
	LDA	#$00		; set volume to zero (rest?)
	STA	AUDV0,X
	LDA	D9310,Y		; get sound byte again
	AND	#$0F		; mask out low 4 bits
	BPL	L923B	; branch always taken	; set duration

L9236	LSR			; take high 3 bits
	LSR
	LSR
	LSR
	LSR
L923B	TAY			; get duration from D9307 table
	LDA	D9307,Y
	STA	Z00ED,X		; save duration
	BPL	L9209		; go back for next sound channel

; set up P0 sprite data
L9243	LDY	#$00
	LDX	Z00B5		; get P0 sprite ID
	CPX	#$0A
	BCC	L9251		; branch if one of first five redundant sprites
	LDA	Z0080		; get frame count
	AND	#$04		; test bit 2 (change every 4th frame)
	LSR
	TAY
L9251	STY	Z00D9
	TXA
	CLC
	ADC	Z00D9
	TAY
	LSR			; X = Y / 2
	TAX
	LDA	D93AB,Y		; set up P0 sprite data pointer
	STA	Z009E
	LDA	D93AB+1,Y
	STA	Z009E+1
	LDA	D93CD,Y		; set up P0 sprite color pointer
	STA	Z00A0
	LDA	D93CD+1,Y
	STA	Z00A0+1
	LDA	D93EF,X		; set P0 sprite height adjustment
	STA	Z00B6
	LDX	#$08
	LDY	#$02
	LDA	Z0083		; get room number
	CMP	#$05		; second row, third room? (skull room)
	BEQ	L9289
	LDY	#$04
	LDX	#$0C
	CMP	#$08		; third row first room? (wide pit room)
	BEQ	L9289
	LDX	#$00
	LDY	#$00
L9289	STX	Z00D9
	LDA	Z0080		; get frame count
	AND	#$7F		; test low bits (every 128th frame)
	BNE	L9295		; branch if any bit set
	LDA	#$24
	STA	Z00D3
L9295	LDA	Z00D3
	BEQ	L92C1
	LDA	Z0083		; get room number
	CMP	#$0F		; is it the fourth level?
	BCC	L92AF		; branch if not fourth level
	LDA	Z00C1		; get inventory
	BMI	L92AF		; branch if torch posessed
	LDA	#<DD1D6		; DD1D6 = 6x $FF
	STA	Z00A2
	STA	Z00A4
	LDA	#>DD1D6
	STA	Z00A2+1
	BNE	L92D7	; (branch always taken)

L92AF	LDA	D939D,Y
	STA	Z00A2
	LDA	D939D+1,Y
	STA	Z00A2+1
	LDA	#<DFD75 ; blank
	STA	Z00A4
	LDA	#>DFD75
	BNE	L92D7	; (branch always taken)

L92C1	JSR	LFCD7
	TAY
	LDA	DFE13,Y
	STA	Z00A2
	LDA	DFE13+1,Y
	STA	Z00A2+1
	LDA	DFE17,Y
	STA	Z00A4
	LDA	DFE17+1,Y
L92D7	STA	Z00A4+1
	LDA	Z0080		; get frame count
	AND	#$18		; mask out middle 2 bits (4 counts, every 8th frame)
	LSR			; move to 0x06 bits as fire pit index
	LSR
	TAY
	LDA	DFE23,Y		; get pointer to fire pit color for this cycle
	STA	Z00A6
	LDA	DFE23+1,Y
	STA	Z00A6+1
	LDX	#$00
	LDA	Z0083		; get room number
	CMP	#$01		; is it first row, second room? (start room)
	BEQ	L92F4
	LDX	#$04
L92F4	STX	Z00D9
	JSR	LFCD7
	TAY
	LDA	D93A3,Y		; get pointer to conveyor belt data
	STA	Z00A8
	LDA	D93A3+1,Y
	STA	Z00A8+1
	JMP	LFCEF		; -> LB000

; sound duration data (last two only usable in a rest)
D9307	.byte	$02,$03,$0C,$00,$01,$07,$0A,$1A,$13

; sound data
; First byte:	D7 = second byte points to second channel
;		D4 = override any currently playing sound
;		D3-D0 = AudC0/1
;
; Other bytes:	zero = end of sound data
;		D7-D4 = 1111, D3-D0 = rest (use D9307 table for duration)
;		D7-D5 = duration (use D9307 table), D4-D0 = AudF0/1

; startup/score music?
D9310	.byte	$F4,D931C-D9310
	.byte	    $1F,$F1,$1F,$F1,$1F,$F1,$17
	.byte	$F2,$12,$00

D931C	.byte	$0C,$14,$F1,$14,$F1,$14,$F1,$14
	.byte	$F2,$0F,$00

; walk sound?
D9327	.byte	$0E,$62,$F4,$63,$F0,$00

; burntjoe sound?
D932D	.byte	$F2,D9332-D9310
	.byte	    $A7,$51,$00

D9332	.byte	$08,$F5,$1F,$20,$00

; opening door sound?
D9337	.byte	$14,$64,$61,$6E,$62,$61,$6E,$62
	.byte	$64,$00

; jump sound?
D9341	.byte	$1C,$7F,$79,$76,$73,$70,$6F,$6E
	.byte	$6D,$00

; kill monster sound?
D934B	.byte	$9C,D935F-D9310
	.byte	    $60,$62,$64,$6C,$6E,$70,$72
	.byte	$74,$75,$76,$77,$78,$79,$7A,$7B
	.byte	$7C,$7E,$00

D935F	.byte	$04,$64,$66,$6F,$7F,$00

; deadjoe sound?
D9365	.byte	$F1,D936A-D9310
	.byte	    $62,$7F,$00

D936A	.byte	$0F,$61,$8F,$00

; bonus room music?
D936E	.byte	$8A,D937B-D9310
	.byte	    $BF,$F1,$BF,$F1,$BF,$F1,$B7
	.byte	$F7,$B2,$F2,$00

D937B	.byte	$04,$F6,$F3,$2E,$F8,$36,$F8,$28
	.byte	$F8,$33,$00

; extra life music?
D9386	.byte	$F4,D9392-D9310
	.byte	    $B8,$35,$B8,$35,$38,$F6,$2E
	.byte	$F6,$32,$00

D9392	.byte	$0C,$B3,$32,$B3,$32,$33,$F6,$30
	.byte	$F6,$33,$00

; -> Z00A2 -> PF0/PF1
D939D	.word	DD1E8
	.word	DFD75 ; blank
	.word	DFE90

; conveyor belt pointer table -> Z00A8 -> PF2
D93A3	.word	DFD98 ; blank?
	.word	DFD5D ; blank?
	.word	DFD9E ; conveyor belt
	.word	DFD63 ; conveyor belt

; -> Z009E -> GRP0
D93AB	.word	DD03E ; 00 joe_climb1
	.word	DFD75 ; 02 blank
	.word	DD07B ; 04 joe_dance1
	.word	DD0A5 ; 06 joe_jump
	.word	DD000 ; 08 joe_walk1
	.word	DD03E ; 0A joe_climb1
	.word	DD052 ; 0C joe_climb2
	.word	DD07B ; 0E joe_dance1
	.word	DD090 ; 10 joe_dance2
	.word	DD000 ; 12 joe_walk1
	.word	DD02A ; 14 joe_walk2
	.word	DD0BA ; 16 deadjoe1
	.word	DD0C9 ; 18 deadjoe2
	.word	DD0E7 ; 1A smoke1
	.word	DD0FD ; 1C smoke2
	.word	DD2C8 ; 1E dust1
	.word	DD2DD ; 20 dust2

; -> Z00A0 -> COLUP0
D93CD	.word	DD066 ; color joe_climb1
	.word	DFD75 ; blank
	.word	DD066 ; color joe_dance1
	.word	DD015 ; color joe_jump
	.word	DD015 ; color joe_walk
	.word	DD066 ; color joe_climb1
	.word	DD066 ; color joe_climb2
	.word	DD066 ; color joe_dance
	.word	DD066 ; color joe_dance2
	.word	DD015 ; color joe_walk1
	.word	DD015 ; color joe_walk2
	.word	DD0D8 ; color deadjoe1
	.word	DD0D8 ; color deadjoe2
	.word	DD118 ; color smoke1
	.word	DD118 ; color smoke2
	.word	DD015 ; color dust1
	.word	DD015 ; color dust2

; P0 sprite height adjustment -> Z00B6
D93EF	.byte	$01,$00,$00,$00,$00,$01,$01,$00
	.byte	$00,$00,$01,$06,$06,$04,$00,$00
	.byte	$00

; ------------ PAGE 4, 5, 6 ------------

	ORG	$2000
	RORG	$D000

DD000	.byte	$38 ; . . # # # . . . joe_walk1 (19 lines) -> GRP0
	.byte	$38 ; . . # # # . . .
	.byte	$38 ; . . # # # . . .
	.byte	$FF ; # # # # # # # #
	.byte	$FF ; # # # # # # # #
	.byte	$34 ; . . # # . # . .
	.byte	$3C ; . . # # # # . .
	.byte	$38 ; . . # # # . . .
	.byte	$7C ; . # # # # # . .
	.byte	$F4 ; # # # # . # . .
	.byte	$FE ; # # # # # # # .
	.byte	$F6 ; # # # # . # # .
	.byte	$3C ; . . # # # # . .
	.byte	$F4 ; # # # # . # . .
	.byte	$FC ; # # # # # # . .
	.byte	$CC ; # # . . # # . .
	.byte	$CC ; # # . . # # . .
	.byte	$CC ; # # . . # # . .
	.byte	$EE ; # # # . # # # .
	.byte	$6E ; . # # . # # # .
	.byte	$00

; colors for joe_walk1, joe_walk2, joe_jump, dust1, dust2
DD015	.byte	$FA,$FA,$46,$FA,$46,$4A,$4A,$4A
	.byte	$46,$46,$46,$46,$46,$46,$46,$46
	.byte	$FA,$FA,$FA,$FA,$00

DD02A	.byte	$38 ; . . # # # . . . joe_walk2 (19 lines) -> GRP0
	.byte	$38 ; . . # # # . . .
	.byte	$38 ; . . # # # . . .
	.byte	$FF ; # # # # # # # #
	.byte	$FF ; # # # # # # # #
	.byte	$34 ; . . # # . # . .
	.byte	$3C ; . . # # # # . .
	.byte	$38 ; . . # # # . . .
	.byte	$7C ; . # # # # # . .
	.byte	$74 ; . # # # . # . .
	.byte	$FC ; # # # # # # . .
	.byte	$F6 ; # # # # . # # .
	.byte	$FE ; # # # # # # # .
	.byte	$34 ; . . # # . # . .
	.byte	$FC ; # # # # # # . .
	.byte	$78 ; . # # # # . . .
	.byte	$30 ; . . # # . . . .
	.byte	$38 ; . . # # # . . .
	.byte	$38 ; . . # # # . . .
	.byte	$00

DD03E	.byte	$38 ; . . # # # . . . joe_climb1 (19 lines) -> GRP0
	.byte	$38 ; . . # # # . . .
	.byte	$38 ; . . # # # . . .
	.byte	$FE ; # # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$7C ; . # # # # # . .
	.byte	$3A ; . . # # # . # .
	.byte	$7E ; . # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$FC ; # # # # # # . .
	.byte	$FC ; # # # # # # . .
	.byte	$7C ; . # # # # # . .
	.byte	$7C ; . # # # # # . .
	.byte	$6C ; . # # . # # . .
	.byte	$6E ; . # # . # # # .
	.byte	$6E ; . # # . # # # .
	.byte	$E0 ; # # # . . . . .
	.byte	$E0 ; # # # . . . . .
	.byte	$00

DD052	.byte	$38 ; . . # # # . . . joe_climb2 (19 lines) -> GRP0
	.byte	$38 ; . . # # # . . .
	.byte	$38 ; . . # # # . . .
	.byte	$FE ; # # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$7C ; . # # # # # . .
	.byte	$B8 ; # . # # # . . .
	.byte	$FC ; # # # # # # . .
	.byte	$FE ; # # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$7E ; . # # # # # # .
	.byte	$7E ; . # # # # # # .
	.byte	$7C ; . # # # # # . .
	.byte	$7C ; . # # # # # . .
	.byte	$6C ; . # # . # # . .
	.byte	$EC ; # # # . # # . .
	.byte	$EC ; # # # . # # . .
	.byte	$0E ; . . . . # # # .
	.byte	$0E ; . . . . # # # .
	.byte	$00

; colors for joe_climb1, joe_dance1, joe_climb1, joe_climb2,
;		joe_dance1, joe_dance2
DD066	.byte	$FA,$FA,$46,$FA,$FA,$46,$4A,$46
	.byte	$46,$46,$46,$46,$46,$46,$46,$FA
	.byte	$FA,$FA,$FA,$FA,$00

DD07B	.byte	$38 ; . . # # # . . . joe_dance1 (19 lines) -> GRP0
	.byte	$38 ; . . # # # . . .
	.byte	$38 ; . . # # # . . .
	.byte	$FE ; # # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$7C ; . # # # # # . .
	.byte	$38 ; . . # # # . . .
	.byte	$7C ; . # # # # # . .
	.byte	$FC ; # # # # # # . .
	.byte	$FE ; # # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$7E ; . # # # # # # .
	.byte	$7C ; . # # # # # . .
	.byte	$7C ; . # # # # # . .
	.byte	$CC ; # # . . # # . .
	.byte	$EC ; # # # . # # . .
	.byte	$78 ; . # # # # . . .
	.byte	$18 ; . . . # # . . .
	.byte	$18 ; . . . # # . . .
	.byte	$00

DD090	.byte	$38 ; . . # # # . . . joe_dance2 (19 lines) -> GRP0
	.byte	$38 ; . . # # # . . .
	.byte	$38 ; . . # # # . . .
	.byte	$FE ; # # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$7C ; . # # # # # . .
	.byte	$38 ; . . # # # . . .
	.byte	$7C ; . # # # # # . .
	.byte	$7E ; . # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$FC ; # # # # # # . .
	.byte	$7C ; . # # # # # . .
	.byte	$7C ; . # # # # # . .
	.byte	$66 ; . # # . . # # .
	.byte	$6E ; . # # . # # # .
	.byte	$3C ; . . # # # # . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$00

DD0A5	.byte	$38 ; . . # # # . . . joe_jump (19 lines) -> GRP0
	.byte	$38 ; . . # # # . . .
	.byte	$38 ; . . # # # . . .
	.byte	$FF ; # # # # # # # #
	.byte	$FF ; # # # # # # # #
	.byte	$34 ; . . # # . # . .
	.byte	$3C ; . . # # # # . .
	.byte	$38 ; . . # # # . . .
	.byte	$7C ; . # # # # # . .
	.byte	$F4 ; # # # # . # . .
	.byte	$FE ; # # # # # # # .
	.byte	$F6 ; # # # # . # # .
	.byte	$3C ; . . # # # # . .
	.byte	$F6 ; # # # # . # # .
	.byte	$7E ; . # # # # # # .
	.byte	$36 ; . . # # . # # .
	.byte	$37 ; . . # # . # # #
	.byte	$37 ; . . # # . # # # 
	.byte	$38 ; . . # # # . . .
	.byte	$38 ; . . # # # . . .
	.byte	$00

DD0BA	.byte	$07 ; . . . . . # # # deadjoe1 (13 lines)
	.byte	$07 ; . . . . . # # #
	.byte	$44 ; . # . . . # . .
	.byte	$E4 ; # # # . . # . .
	.byte	$C4 ; # # . . . # . .
	.byte	$84 ; # . . . . # . .
	.byte	$F4 ; # # # # . # . .
	.byte	$7E ; . # # # # # # .
	.byte	$7F ; . # # # # # # #
	.byte	$7F ; . # # # # # # #
	.byte	$56 ; . # . # . # # .
	.byte	$FF ; # # # # # # # #
	.byte	$FF ; # # # # # # # #
	.byte	$3C ; . . # # # # . .
	.byte	$00

DD0C9	.byte	$C0 ; # # . . . . . . deadjoe2 (14 lines)
	.byte	$C0 ; # # . . . . . .
	.byte	$C3 ; # # . . . . # #
	.byte	$43 ; . # . . . . # #
	.byte	$47 ; . # . . . # # #
	.byte	$44 ; . # . . . # . .
	.byte	$74 ; . # # # . # . .
	.byte	$7E ; . # # # # # # .
	.byte	$7F ; . # # # # # # #
	.byte	$7F ; . # # # # # # #
	.byte	$56 ; . # . # . # # .
	.byte	$FF ; # # # # # # # #
	.byte	$FF ; # # # # # # # #
	.byte	$3C ; . . # # # # . .
	.byte	$00

; colors for deadjoe1, deadjoe2
DD0D8	.byte	$FA,$FA,$FA,$FA,$FA,$FA,$FA,$46
	.byte	$46,$46,$4C,$46,$FA,$46,$00

DD0E7	.byte	$30 ; . . # # . . . . smoke1 (21 lines)
	.byte	$38 ; . . # # # . . .
	.byte	$7C ; . # # # # # . .
	.byte	$7C ; . # # # # # . .
	.byte	$7C ; . # # # # # . .
	.byte	$7E ; . # # # # # # .
	.byte	$7E ; . # # # # # # .
	.byte	$7E ; . # # # # # # .
	.byte	$3E ; . . # # # # # .
	.byte	$3C ; . . # # # # . .
	.byte	$0C ; . . . . # # . .
	.byte	$1C ; . . . # # # . .
	.byte	$38 ; . . # # # . . .
	.byte	$38 ; . . # # # . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$18 ; . . . # # . . .
	.byte	$1C ; . . . # # # . .
	.byte	$04 ; . . . . . # . .
	.byte	$0C ; . . . . # # . .
	.byte	$08 ; . . . . # . . .
	.byte	$00

DD0FD	.byte	$30 ; . . # # . . . . smoke2 (26 lines)
	.byte	$78 ; . # # # # . . .
	.byte	$7C ; . # # # # # . .
	.byte	$7C ; . # # # # # . .
	.byte	$FE ; # # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$FF ; # # # # # # # #
	.byte	$FF ; # # # # # # # #
	.byte	$FF ; # # # # # # # #
	.byte	$7F ; . # # # # # # #
	.byte	$7E ; . # # # # # # .
	.byte	$1E ; . . . # # # # .
	.byte	$3C ; . . # # # # . .
	.byte	$78 ; . # # # # . . .
	.byte	$78 ; . # # # # . . .
	.byte	$70 ; . # # # . . . .
	.byte	$74 ; . # # # . # . .
	.byte	$3C ; . . # # # # . .
	.byte	$3E ; . . # # # # # .
	.byte	$1A ; . . . # # . # .
	.byte	$02 ; . . . . . . # .
	.byte	$02 ; . . . . . . # .
	.byte	$06 ; . . . . . # # .
	.byte	$04 ; . . . . . # . .
	.byte	$04 ; . . . . . # . .
	.byte	$00

; colors for smoke1, smoke2
DD118	.byte	$08,$08,$08,$08,$08,$08,$08,$08	; gray, all gray
	.byte	$08,$08,$08,$08,$08,$08,$08,$08	; (it's smoke, what did you expect?)
	.byte	$08,$08,$08,$08,$08,$08,$08,$08
	.byte	$08,$08

DD132	.byte	$00,$80,$80,$80

DD136	.byte	$7C ; . # # # # # . . gem (12 lines)
	.byte	$BA ; # . # # # . # .
	.byte	$C6 ; # # . . . # # .
	.byte	$BA ; # . # # # . # .
	.byte	$BA ; # . # # # . # .
	.byte	$BA ; # . # # # . # .
	.byte	$BA ; # . # # # . # .
	.byte	$BA ; # . # # # . # .
	.byte	$BA ; # . # # # . # .
	.byte	$C6 ; # # . . . # # .
	.byte	$BA ; # . # # # . # .
	.byte	$7C ; . # # # # # . .

DD142	.byte	$00,$FE,$AA,$54,$FE

DD147	.byte	$02 ; . . . . . . # . spider1 (11 lines)
	.byte	$47 ; . # . . . # # #
	.byte	$ED ; # # # . # # . #
	.byte	$BA ; # . # # # . # .
	.byte	$5F ; . # . # # # # #
	.byte	$FD ; # # # # # # . #
	.byte	$BE ; # . # # # # # .
	.byte	$7F ; . # # # # # # #
	.byte	$FD ; # # # # # # . #
	.byte	$BD ; # . # # # # . #
	.byte	$98 ; # . . # # . . .

DD152	.byte	$00,$FE,$54,$AA,$FE

DD157	.byte	$40 ; . # . . . . . . spider2 (11 lines)
	.byte	$E2 ; # # # . . . # .
	.byte	$B7 ; # . # # . # # #
	.byte	$5D ; . # . # # # . #
	.byte	$FA ; # # # # # . # .
	.byte	$BF ; # . # # # # # #
	.byte	$7D ; . # # # # # . #
	.byte	$FE ; # # # # # # # .
	.byte	$BF ; # . # # # # # #
	.byte	$BD ; # . # # # # . #
	.byte	$19 ; . . . # # . . #
	.byte	$00

DD163	.byte	$30 ; . . # # . . . .	; 4 lines -> PF0
DD164	.byte	$FE ; # # # # # # # .	; fire pit -> PF1, step pit -> PF0
DD165	.byte	$F9 ; # # # # # . . #	; 6 lines, upside-down
	.byte	$FE ; # # # # # # # .
	.byte	$F9 ; # # # # # . . #
	.byte	$FE ; # # # # # # # .
	.byte	$F9 ; # # # # # . . #
	.byte	$FE ; # # # # # # # .
DD16B	.byte	$66 ; . # # . . # # .	; fire pit -> PF2
DD16C	.byte	$99 ; # . . # # . . #	; 6 lines, upside-down
	.byte	$66 ; . # # . . # # .
	.byte	$99 ; # . . # # . . #
	.byte	$66 ; . # # . . # # .
	.byte	$99 ; # . . # # . . #
	.byte	$66 ; . # # . . # # .

DD172	.byte	$10
	.byte	$F0,$B0,$50,$F0
DD177	.byte	$10,$F0,$50,$B0,$F0
DD17C	.byte	$00,$FF,$00,$FF,$00,$FF,$00,$FF ; -> PF1/PF2
	.byte	$00,$FF,$00,$FF,$00,$FF,$00,$FF
	.byte	$00,$FF,$00,$FF,$00,$FF,$00,$FF
	.byte	$00,$FF,$00,$FF,$00,$FF,$00,$FF
	.byte	$00,$FF,$00,$FF,$00,$FF,$00

DD1A3	.byte	$FF ; # # # # # # # #	; -> PF1/PF2
DD1A4	.byte	$00 ; . . . . . . . .
DD1A5	.byte	$00 ; . . . . . . . .
DD1A6	.byte	$00 ; . . . . . . . .
	.byte	$FF ; # # # # # # # #
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$FF ; # # # # # # # #
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$FF ; # # # # # # # #
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$FF ; # # # # # # # #
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$FF ; # # # # # # # #
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$FF ; # # # # # # # #
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$FF ; # # # # # # # #
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$FF ; # # # # # # # #
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$FF ; # # # # # # # #
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$00 ; . . . . . . . .
	.byte	$FF ; # # # # # # # #

DD1CC	.byte	$00 ; . . . . . . . .	; -> PF1 in fire pit bowl
	.byte	$00 ; . . . . . . . .	; (upside-down)
	.byte	$00 ; . . . . . . . .
	.byte	$03 ; . . . . . . # #
	.byte	$0F ; . . . . # # # #
	.byte	$1F ; . . . # # # # #
	.byte	$3F ; . . # # # # # #
	.byte	$3F ; . . # # # # # #

DD1D4	.byte	$C0 ; # # . . . . . .	; -> PF2 in fire pit bowl
	.byte	$F8 ; # # # # # . . .	; (upside-down)
DD1D6	.byte	$FF ; # # # # # # # #
	.byte	$FF ; # # # # # # # #
	.byte	$FF ; # # # # # # # #
	.byte	$FF ; # # # # # # # #
	.byte	$FF ; # # # # # # # #
	.byte	$FF ; # # # # # # # #

DD1DC	.byte	$90 ; # . . # . . . .	; start room ladder -> PF1
	.byte	$90 ; # . . # . . . .	; (upside-down, 7 lines)
	.byte	$90 ; # . . # . . . .
	.byte	$90 ; # . . # . . . .
DD1E0	.byte	$90 ; # . . # . . . .	; start room ladder -> PF1
	.byte	$F0 ; # # # # . . . .	; (upside-down, 11 bytes)
	.byte	$F0 ; # # # # . . . .
	.byte	$90 ; # . . # . . . .
	.byte	$90 ; # . . # . . . .
	.byte	$90 ; # . . # . . . .
	.byte	$90 ; # . . # . . . .
	.byte	$90 ; # . . # . . . .
DD1E8	.byte	$F8 ; # # # # # . . .	; -> PF0/PF1
	.byte	$F8 ; # # # # # . . .
	.byte	$F8 ; # # # # # . . .
	.byte	$F8 ; # # # # # . . .
	.byte	$F8 ; # # # # # . . .
	.byte	$F8 ; # # # # # . . .

DD1EE	.byte	$0C ; . . . . # # . . snake1 (13 lines)
	.byte	$1A ; . . . # # . # .
	.byte	$1E ; . . . # # # # .
	.byte	$12 ; . . . # . . # .
	.byte	$18 ; . . . # # . . .
	.byte	$0E ; . . . . # # # .
	.byte	$03 ; . . . . . . # #
	.byte	$01 ; . . . . . . . #
	.byte	$03 ; . . . . . . # #
	.byte	$42 ; . # . . . . # .
	.byte	$42 ; . # . . . . # .
	.byte	$66 ; . # # . . # # .
	.byte	$3C ; . . # # # # . .
	.byte	$00

DD1FC	.byte	$0C ; . . . . # # . . snake2 (13 lines)
	.byte	$1A ; . . . # # . # .
	.byte	$1E ; . . . # # # # .
	.byte	$10 ; . . . # . . . .
	.byte	$18 ; . . . # # . . .
	.byte	$0E ; . . . . # # # .
	.byte	$03 ; . . . . . . # #
	.byte	$01 ; . . . . . . . #
	.byte	$03 ; . . . . . . # #
	.byte	$22 ; . . # . . . # .
	.byte	$22 ; . . # . . . # .
	.byte	$66 ; . # # . . # # .
	.byte	$3C ; . . # # # # . .
	.byte	$00

DD20A	.byte	$20 ; . . # . . . . . small torch (8 lines)
	.byte	$70 ; . # # # . . . .
	.byte	$78 ; . # # # # . . .
	.byte	$78 ; . # # # # . . .
	.byte	$FC ; # # # # # # . .
	.byte	$78 ; . # # # # . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .

DD212	.byte	$00 ; . . . . . . . .	; room 1,5 ledge -> PF1/PF2 (5 lines)
DD213	.byte	$00 ; . . . . . . . .	; room 1,8 ledge -> PF1 (4 lines)
	.byte	$FF ; # # # # # # # #	; (all upside-down)
	.byte	$FF ; # # # # # # # #
	.byte	$FF ; # # # # # # # #

DD217	.byte	$38 ; . . # # # . . . skull (13 lines)
	.byte	$7C ; . # # # # # . .
	.byte	$FE ; # # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$D6 ; # # . # . # # .
	.byte	$92 ; # . . # . . # .
	.byte	$FE ; # # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$7C ; . # # # # # . .
	.byte	$54 ; . # . # . # . .
	.byte	$28 ; . . # . # . . .
	.byte	$7C ; . # # # # # . .
	.byte	$38 ; . . # # # . . .

DD224	.byte	$00 ; . . . . . . . . -> PF1
	.byte	$FC ; # # # # # # . .
	.byte	$FC ; # # # # # # . .
	.byte	$FC ; # # # # # # . .

DD228	.byte	$3C ; . . # # # # . . skull2 (12 lines)
	.byte	$7E ; . # # # # # # .
	.byte	$7F ; . # # # # # # #
	.byte	$4F ; . # . . # # # #
	.byte	$49 ; . # . . # . . #
	.byte	$F9 ; # # # # # . . #
	.byte	$FF ; # # # # # # # #
	.byte	$BE ; # . # # # # # .
	.byte	$54 ; . # . # . # . .
	.byte	$E8 ; # # # . # . . .
	.byte	$FC ; # # # # # # . .
	.byte	$78 ; . # # # # . . .

DD234	.byte	$00 ; . . . . . . . . -> PF2
	.byte	$E0 ; # # # . . . . .
	.byte	$E0 ; # # # . . . . .
	.byte	$E0 ; # # # . . . . .

DD238	.byte	$1C ; . . . # # # . . skull3 (11 lines)
	.byte	$3E ; . . # # # # # .
	.byte	$3E ; . . # # # # # .
	.byte	$4F ; . # . . # # # #
	.byte	$4F ; . # . . # # # #
	.byte	$79 ; . # # # # . . #
	.byte	$B9 ; # . # # # . . #
	.byte	$DE ; # # . # # # # .
	.byte	$EE ; # # # . # # # .
	.byte	$E0 ; # # # . . . . .
	.byte	$70 ; . # # # . . . .
	.byte	$00

DD244	.byte	$0C ; . . . . # # . . skull4 (11 lines)
	.byte	$1E ; . . . # # # # .
	.byte	$3F ; . . # # # # # #
	.byte	$27 ; . . # . . # # #
	.byte	$67 ; . # # . . # # #
	.byte	$BF ; # . # # # # # #
	.byte	$B9 ; # . # # # . . #
	.byte	$D9 ; # # . # # . . #
	.byte	$DF ; # # . # # # # #
	.byte	$6E ; . # # . # # # .
	.byte	$70 ; . # # # . . . .
	.byte	$00

DD250	.byte	$0C ; . . . . # # . . skull5 (11 lines)
	.byte	$3E ; . . # # # # # .
	.byte	$3E ; . . # # # # # .
	.byte	$D3 ; # # . # . . # #
	.byte	$B3 ; # . # # . . # #
	.byte	$DF ; # # . # # # # #
	.byte	$B3 ; # . # # . . # #
	.byte	$D3 ; # # . # . . # #
	.byte	$3E ; . . # # # # # .
	.byte	$3E ; . . # # # # # .
	.byte	$0C ; . . . . # # . .
	.byte	$00

DD25C	.byte	$70 ; . # # # . . . . skull6 (11 lines)
	.byte	$6E ; . # # . # # # .
	.byte	$DF ; # # . # # # # #
	.byte	$D9 ; # # . # # . . #
	.byte	$B9 ; # . # # # . . #
	.byte	$BF ; # . # # # # # #
	.byte	$67 ; . # # . . # # #
	.byte	$27 ; . . # . . # # #
	.byte	$3F ; . . # # # # # #
	.byte	$1E ; . . . # # # # .
	.byte	$0C ; . . . . # # . .
	.byte	$00

DD268	.byte	$70 ; . # # # . . . . skull7 (11 lines)
	.byte	$E0 ; # # # . . . . .
	.byte	$EE ; # # # . # # # .
	.byte	$DE ; # # . # # # # .
	.byte	$B9 ; # . # # # . . #
	.byte	$79 ; . # # # # . . #
	.byte	$7F ; . # # # # # # #
	.byte	$67 ; . # # . . # # #
	.byte	$26 ; . . # . . # # .
	.byte	$3E ; . . # # # # # .
	.byte	$1C ; . . . # # # . .
	.byte	$00

DD274	.byte	$78 ; . # # # # . . . skull8 (12 lines)
	.byte	$FC ; # # # # # # . .
	.byte	$E8 ; # # # . # . . .
	.byte	$54 ; . # . # . # . .
	.byte	$BE ; # . # # # # # .
	.byte	$FF ; # # # # # # # #
	.byte	$F9 ; # # # # # . . #
	.byte	$49 ; . # . . # . . #
	.byte	$4F ; . # # # # # # #
	.byte	$7F ; . # # # # # # #
	.byte	$7E ; . # # # # # # .
	.byte	$3C ; . . # # # # . .
	.byte	$00

DD281	.byte	$38 ; . . # # # . . . skull9 (13 lines)
	.byte	$7C ; . # # # # # . .
	.byte	$28 ; . . # . # . . .
	.byte	$54 ; . # . # . # . .
	.byte	$7C ; . # # # # # . .
	.byte	$FE ; # # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$92 ; # . . # . . # .
	.byte	$D6 ; # # . # . # # .
	.byte	$FE ; # # # # # # # .
	.byte	$FE ; # # # # # # # .
	.byte	$7C ; . # # # # # . .
	.byte	$38 ; . . # # # . . .

DD28E	.byte	$00 ; top side ladder data -> PF2 (upside-down)
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$C0 ; # # . . . . . .
	.byte	$C0 ; # # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$C0 ; # # . . . . . .
	.byte	$C0 ; # # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$C0 ; # # . . . . . .
	.byte	$C0 ; # # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$C0 ; # # . . . . . .
	.byte	$C0 ; # # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$C0 ; # # . . . . . .
	.byte	$C0 ; # # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$40 ; . # . . . . . .
DD2B5	.byte	$40 ; . # . . . . . .	; top floor PF2 in row 1, room 2 (start room)
	.byte	$E3 ; # # # . . . # #
	.byte	$E3 ; # # # . . . # #
	.byte	$E3 ; # # # . . . # #

DD2B9	.byte	$55 ; . # . # . # . # -> PF0
	.byte	$55 ; . # . # . # . #
	.byte	$55 ; . # . # . # . #
	.byte	$00 ; . . . . . . . .

DD2BD	.byte	$AA ; # . # . # . # . -> PF0/PF1
	.byte	$AA ; # . # . # . # .
	.byte	$AA ; # . # . # . # .
	.byte	$00 ; . . . . . . . .

DD2C1	.byte	$55 ; . # . # . # . # -> PF1
	.byte	$55 ; . # . # . # . #
	.byte	$55 ; . # . # . # . #
	.byte	$40,$4A,$CA,$CA

DD2C8	.byte	$10 ; . . . # . . . . dust1 (20 lines)
	.byte	$4A ; . # . . # . # .
	.byte	$10 ; . . . # . . . .
	.byte	$A4 ; # . # . . # . .
	.byte	$08 ; . . . . # . . .
	.byte	$10 ; . . . # . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$14 ; . . . # . # . .
	.byte	$40 ; . # . . . . . .
	.byte	$04 ; . . . . . # . .
	.byte	$90 ; # . . # . . . .
	.byte	$02 ; . . . . . . # .
	.byte	$08 ; . . . . # . . .
	.byte	$42 ; . # . . . . # .
	.byte	$90 ; # . . # . . . .
	.byte	$04 ; . . . . . # . .
	.byte	$50 ; . # . # . . . .
	.byte	$20 ; . . # . . . . .
	.byte	$82 ; # . . . . . # .
	.byte	$08 ; . . . . # . . .
	.byte	$00

DD2DD	.byte	$20 ; . . # . . . . . dust2 (20 lines)
	.byte	$04 ; . . . . . # . .
	.byte	$20 ; . . # . . . . .
	.byte	$02 ; . . . . . . # .
	.byte	$94 ; # . . # . # . .
	.byte	$0A ; . . . . # . # .
	.byte	$20 ; . . # . . . . .
	.byte	$40 ; . # . . . . . .
	.byte	$04 ; . . . . . # . .
	.byte	$80 ; # . . . . . . .
	.byte	$08 ; . . . . # . . .
	.byte	$54 ; . # . # . # . .
	.byte	$20 ; . . # . . . . .
	.byte	$08 ; . . . . # . . .
	.byte	$42 ; . # . . . . # .
	.byte	$08 ; . . . . # . . .
	.byte	$20 ; . . # . . . . .
	.byte	$08 ; . . . . # . . .
	.byte	$04 ; . . . . . # . .
	.byte	$40 ; . # . . . . . .

; skull top offsets
DD2F1	.byte	$00,$01,$02,$02,$02,$02,$02,$01
	.byte	$00,$01,$02,$02,$02,$02,$02,$01

; fire pit colors (rotating?)
DD301	.byte	$22
DD302	.byte	$24
DD303	.byte	$26
DD304	.byte	$24,$22,$24,$26,$24,$22,$24,$26
	.byte	$28,$26,$24,$26,$28,$26,$24,$26
	.byte	$28,$2A,$28,$26,$28,$2A,$28,$26

LD31C	LDA	Z0084
	BEQ	LD32E
	LDX	#$93		; 153 scan lines
LD322	LDA	#$00
	STA	WSYNC		; wait for next line
	STA	COLUBK		; set background = black
	DEX			; count line
	BNE	LD322		; loop until all lines done
	JMP	LFD0D		; start VR timer, go to retrace stuff

LD32E	LDA	Z00D2
	STA	COLUPF

	LDA	Z00AB		; get P0 vertical position
	SEC
	SBC	Z00B6		; adjust for sprite height
	STA	Z00DA		; set P0 line counter

	LDA	Z00AD		; get P1 vertical position
	LDY	Z0096		; get P1 sprite low address
	CPY	#<DD20A		; is it the small torch?
	BNE	LD343		; branch if not
	SBC	#$05		; subtract 5 lines to bottom-justify with large torch
LD343	STA	Z00DB		; set P1 line counter

	LDA	Z0083		; get room number
	ASL			; multiply by 2
	TAY			; get address from table
	LDA	DD352+1,Y
	PHA			; save address on stack
	LDA	DD352,Y
	PHA
	RTS			; go to code address of room kernal

; room top kernal list
DD352	.word	LD382-1	; room	0	6 gates, left wall, ladder at bottom
	.word	LD434-1	; room	1	start room, 2 doors, rope, belt, skull
	.word	LD591-1	; room	2	right wall, ladder at bottom
	.word	LD591-1	; room	3	left wall, ladder at bottom
	.word	LD528-1	; room	4	ladder at top, ladder at bottom
	.word	LD87F-1	; room	5	torch, 2 walls, belt, rope, skull, 2 doors, ladder bottom
	.word	LD528-1	; room	6	ladder at top
	.word	LD382-1	; room	7	6 gates, right wall, ladder at bottom
	.word	LD591-1	; room	8	left wall, 2 ropes, blinking steps
	.word	LD528-1	; room	9	ladder at top
	.word	LD528-1	; room 10	ladder at top, fire pit
	.word	LD528-1	; room 11	ladder at top, ladder at bottom
	.word	LD5DF-1	; room 12	8 gates
	.word	LD528-1	; room 13	ladder at top, ladder at bottom
	.word	LD591-1	; room 14	2 ropes, pit, half ladder at bottom
	.word	LD591-1	; room 15	bonus room
	.word	LD591-1	; room 16	nothing
	.word	LD610-1	; room 17	2 doors
	.word	LD661-1	; room 18	fire pit, skull
	.word	LD528-1	; room 19	ladder at top
	.word	LD591-1	; room 20	fire pit, right wall
	.word	LD528-1	; room 21	ladder at top, left wall
	.word	LD528-1	; room 22	ladder at top
	.word	LD591-1	; room 23	right wall

; kernal for rooms 0, 7 (6 gates)
LD382	LDA	#$8A		; blue color for gates
	STA	WSYNC		; wait for beginning of line
	STA	COLUPF		; set playfield color
	JSR	LDA4B
	LDX	#$26		; 39 scan lines

LD38D	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD398		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD39A		; branch if end of P0 data
LD398	STY	Z00DA		; else update P0 line counter
LD39A	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	TXA			; copy line counter to Y
	TAY
	LDA	(Z009A),Y	; get playfield data
	AND	#$85		; mask out three lines: # . . . . # . #
	STA	PF1		; store PF1 playfield data

	LDA	#$00		; default to no P1 data
	LDY	Z00DB		; get P1 line counter
	INY			; increment P1 line count
	BMI	LD3B5		; branch if not yet at P1 first line
	LDA	(Z0096),Y	; get P1 sprite data
	BEQ	LD3B7		; branch if end of P1 data
LD3B5	STY	Z00DB		; else update P1 line counter
LD3B7	STA	GRP1		; put P1 data

	DEX			; count line
	BPL	LD38D		; loop for rest of lines

	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD3C7		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD3C9		; branch if end of P0 data
LD3C7	STY	Z00DA		; else update P0 line counter
LD3C9	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	#$00		; default to no P1 data
	STA	PF1		; clear PF1
	LDY	Z00DB		; get P1 line counter
	INY			; increment P1 line count
	BMI	LD3DE		; branch if not yet at P1 first line
	LDA	(Z0096),Y	; get P1 sprite data
	BEQ	LD3E0		; branch if end of P1 data
LD3DE	STY	Z00DB		; else update P1 line counter
LD3E0	STA	GRP1		; put P1 data

; bottom half of most rooms
LD3E2	LDX	#$0E		; 14 groups of lines
LD3E4	STX	Z00BB		; initialize line counter
	LDX	#$00
	JSR	LD98D
LD3EB	LDX	#$02		; 3 scan lines for first group

LD3ED	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD3F8		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD3FA		; branch if end of P0 data
LD3F8	STY	Z00DA		; else update P0 line counter
LD3FA	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	DD2B9,X		; get PF0 data
	STA	PF0		; put PF0 data: . # . # . # . #
	LDA	DD2BD,X		; get PF1 data
	STA	PF1		; put PF1 data: # . # . # . # .
	TXA			; copy line counter to Y
	TAY
	LDA	(Z00E1),Y	; get ladder data
	STA	PF2		; put ladder data in PF2

	DEX			; count line
	BPL	LD3ED		; loop for rest of lines

	LDX	#$06		; 7 scan lines for next group

	DEC	Z00BB		; count group
	BPL	LD3ED		; loop for rest of groups

	LDA	#$00
	LDY	Z0083		; get room number
	LDX	DDA53,Y		; get extra scan lines
LD422	STA	WSYNC		; wait one scan line
	STA	COLUBK		; zero out graphics
	STA	GRP0
	STA	PF0
	STA	PF1
	STA	PF2
	DEX
	BPL	LD422		; loop until extra scanlines done
	JMP	LFD0D		; start VR timer, -> 9201

; kernal for room 1 (first room)
LD434	LDA	#$FC		; light brown (door color)
	STA	COLUPF
	JMP	LD616		; same as top of room 17 except gate color

LD43B	LDA	Z00D1
	STA	COLUPF

; do top floor
	LDX	#$03		; 4 scan lines

LD441	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD44C		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD44E		; branch if end of P0 data
LD44C	STY	Z00DA		; else update P0 line counter
LD44E	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	DD163,X
	STA	PF0
	LDA	DD213,X
	STA	PF1
	LDA	DD2B5,X
	STA	PF2
	LDA	DFE39,X
	STA	ENAM1

	DEX			; count line
	BPL	LD441		; loop for rest of lines

; do middle zone
	LDX	#$26		; 39 scan lines

LD46F	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD47A		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD47C		; branch if end of P0 data
LD47A	STY	Z00DA		; else update P0 line counter
LD47C	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	#$00		; default to no P1 data
	LDY	Z00DB		; get P1 line counter
	INY			; increment P1 line count
	BMI	LD48F		; branch if not yet at P1 first line
	LDA	(Z0096),Y	; get P1 sprite data
	BEQ	LD491		; branch if end of P1 data
LD48F	STY	Z00DB		; else update P1 line counter
LD491	STA	GRP1		; put P1 data

	LDA	DD28E,X		; get ladder data
	STA	PF2		; store PF2 playfield data

	DEX			; count line
	BPL	LD46F		; loop for rest of lines

; do conveyor belt zone
	LDX	#$0A		; 11 scan lines

LD49D	LDA	#$00		; default to no P0 data
	STA	ENAM1		; turn off white rope
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD4AA		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD4AC		; branch if end of P0 data
LD4AA	STY	Z00DA		; else update P0 line counter
LD4AC	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	#$F0		; PF0 = side walls
	STA	PF0
	LDA	DD1E0,X		; PF1 = ladder data
	STA	PF1
	TXA			; copy line counter to Y
	TAY
	LDA	(Z00A8),Y	; PF2 = conveyor belt data
	STA	PF2

	DEX			; count line
	BPL	LD49D		; loop for rest of lines

	JSR	LD9CC		; set up skull position (4 scan lines)

; do bottom zone (ladders and skull)
	LDX	#$03		; 4 groups
	STX	Z00BB		; save group counter

LD4CD	LDX	#$06		; 7 scan lines

LD4CF	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD4DA		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD4DC		; branch if end of P0 data
LD4DA	STY	Z00DA		; else update P0 line counter
LD4DC	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	DD1DC,X		; PF1 = ladder data
	STA	PF1

	LDA	#$00		; default to no P1 data
	LDY	Z00DB		; get P1 line counter
	INY			; increment P1 line count
	BMI	LD4F4		; branch if not yet at P1 first line
	LDA	(Z0098),Y	; get P1 sprite data (skull)
	BEQ	LD4F6		; branch if end of P1 data
LD4F4	STY	Z00DB		; else update P1 line counter
LD4F6	STA	GRP1		; put P1 data

	DEX			; count line
	BPL	LD4CF		; loop for rest of lines

	DEC	Z00BB		; count group
	BPL	LD4CD		; loop for rest of groups

	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD50A		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD50C		; branch if end of P0 data
LD50A	STY	Z00DA		; else update P0 line counter
LD50C	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	#$00		; default to no P1 data
	LDY	Z00DB		; get P1 line counter
	INY
	BMI	LD51F
	LDA	(Z0098),Y	; get P1 sprite data (skull)
	BEQ	LD521		; branch if end of P1 data
LD51F	STY	Z00DB		; else update P1 line counter
LD521	STA	GRP1		; put P1 data

	LDX	#$02		; 2 sets of lines
	JMP	LD3E4		; do bottom of room

; kernal for rooms 4, 6, 9, 10, 11, 13, 19, 21, 22 (ladder at top)
LD528	JSR	LDA47
	LDX	#$26		; 39 scan lines

LD52D	LDA	#$00		; default to no P1 data
	LDY	Z00DB		; get P1 line counter
	INY			; increment P1 line count
	BMI	LD538		; branch if not yet at P1 first line
	LDA	(Z0096),Y	; get P1 sprite data
	BEQ	LD53A		; branch if end of P1 data
LD538	STY	Z00DB		; else update P1 line counter
LD53A	STA	Z00DC		; save P1 data

	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD547		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD549		; branch if end of P0 data
LD547	STY	Z00DA		; else update P0 line counter
LD549	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	Z00DC		; get saved P1 data
	STA	GRP1		; put P1 data

	LDA	DD28E,X		; get ladder data
	STA	PF2		; store PF2 playfield data

	DEX			; count line
	BPL	LD52D		; loop for rest of lines

; do one more line with no ladder image
	LDA	#$00		; default to no P1 data
	LDY	Z00DB		; get P1 line counter
	INY			; increment P1 line count
	BMI	LD568		; branch if not yet at P1 first line
	LDA	(Z0096),Y	; get P1 sprite data
	BEQ	LD56A		; branch if end of P1 data
LD568	STY	Z00DB		; else update P1 line counter
LD56A	TAX			; save P1 data

	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD576		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD578		; branch if end of P0 data
LD576	STY	Z00DA		; else update P0 line counter
LD578	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	STX	GRP1		; set P1 data

	LDX	Z0083		; get room number
	LDA	DFDD3,X		; get room type
	CMP	#$05		; fire pit type?
	BNE	LD58E		; branch if not
	JMP	LD695		; do fire pit bottom half

LD58E	JMP	LD3E2		; do regular bottom half

; kernal for rooms 2, 3, 8, 14, 15, 16, 20, 23 (no ladder, door, or gates)
LD591	LDA	Z00D1		; set playfield color
	STA	COLUPF
	JSR	LDA47
	LDX	#$27		; 40 scan lines

LD59A	LDA	#$00		; default to no P1 data
	LDY	Z00DB		; get P1 line counter
	INY			; increment P1 line count
	BMI	LD5A5		; branch if not yet at P1 first line
	LDA	(Z0096),Y	; get P1 sprite data
	BEQ	LD5A7		; branch if end of P1 data
LD5A5	STY	Z00DB		; else update P1 line counter
LD5A7	STA	Z00DC		; save P1 data

	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD5B4		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD5B6		; branch if end of P0 data
LD5B4	STY	Z00DA		; else update P0 line counter
LD5B6	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	Z00DC		; get saved P1 data
	STA	GRP1		; put P1 data

	DEX			; count line
	BPL	LD59A		; loop for rest of lines

	LDX	Z0083		; get room number
	CPX	#$14		; is it fourth row, sixth room? (fire pit w/no ladder)
	BEQ	LD5D6		; if so, do fire pit bottom half
	CPX	#$08		; is it third row, first room? (wide pit w/steps)
	BEQ	LD5DC
	CPX	#$0E		; is it third row, seventh room? (wide pit w/2 ropes)
	BEQ	LD5D9
	JMP	LD3E2		; do regular bottom half

LD5D6	JMP	LD695		; do fire pit bottom half

LD5D9	JMP	LD760		; do room 14 bottom half

LD5DC	JMP	LD7EC		; do room 8 bottom half

; kernal for room 12 (8 gates)
LD5DF	LDA	#$8A		; light blue
	STA	COLUPF		; set playfield color
	STA	WSYNC
	LDX	#$27		; 40 scan lines

LD5E7	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD5F2		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD5F4		; branch if end of P0 data
LD5F2	STY	Z00DA		; else update P0 line counter
LD5F4	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	TXA			; copy line counter to Y
	TAY
	LDA	(Z009A),Y	; get playfield data
	AND	#$05		; mask out 2 lines: . . . . . # . #
	STA	PF1		; store PF1 playfield data
	LDA	(Z009A),Y	; get playfield data
	AND	#$28		; mask out 2 lines: . . # . # . . .
	STA	PF2		; store PF2 playfield data

	DEX			; count line
	BPL	LD5E7		; loop for rest of lines

	JMP	LD3E2		; do regular bottom half

; kernal for room 17 (2 doors)
LD610	LDA	Z00D5		; set playfield = doors color
	STA	COLUPF
	STA	WSYNC		; wait for next line

; room 1 enters here
LD616	LDX	#$26		; 39 scan lines

LD618	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD623		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD625		; branch if at end of P0 data
LD623	STY	Z00DA		; else update P0 line counter
LD625	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	TXA			; copy line counter to Y
	TAY
	LDA	(Z009A),Y	; get playfield data
	AND	#$40		; mask out one line: . # . . . . . .
	STA	PF1		; store left side PF1 playfield data
	LDA	(Z009C),Y	; get right side playfield data
	LDA	(Z009C),Y	; get it again (for delay, apparently)
	AND	#$40		; mask out one line: . # . . . . . .
	STA	PF1		; store right side PF1 playfield data

	DEX			; count line
	BPL	LD618		; loop for rest of lines

; do one more line with no door
	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD64B		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD64D		; branch if at end of P0 data
LD64B	STY	Z00DA		; else up date P0 line counter
LD64D	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	Z0083		; get room number
	CMP	#$01		; start room?
	BNE	LD65E		; branch if not
	JMP	LD43B		; do middle of start room

LD65E	JMP	LD3E2		; do regular bottom half

; kernal for room 18 (rolling skull)
LD661	JSR	LD9B9		; set up skull line number, reflect, and color
	LDA	#$05
	STA	Z00BC
	LDX	#$27		; 40 scan lines
	STX	Z00D9		; save scan line counter

LD66C	LDA	#$00		; default to no P1 data
	LDY	Z00DB		; get P1 line counter
	INY			; increment P1 line count
	BMI	LD677		; branch if not yet at P1 first line
	LDA	(Z0098),Y	; get P1 sprite data (skull)
	BEQ	LD679		; branch if end of P1 data
LD677	STY	Z00DB		; else update P1 line counter
LD679	TAX			; save P1 data

	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD685		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD687		; branch if end of P0 data
LD685	STY	Z00DA		; else update P0 line counter
LD687	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	STX	GRP1		; put P1 data

	DEC	Z00D9		; count line
	BPL	LD66C		; lop for rest of lines

; fire pit bottom half
LD695	LDA	Z00B5		; get P0 sprite ID
	CMP	#$1A		; smoke1?
	BNE	LD6A1
	LDA	#$0D
	STA	NUSIZ0		; P0 = 1 clock, double size (for smoke?)
	STA	REFP0		; reflect P0
LD6A1	LDX	#$FF

	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD6AE		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD6B0		; branch if end of P0 data
LD6AE	STY	Z00DA		; else update P0 line counter
LD6B0	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	Z00D1
	STA	COLUPF
	STX	PF0		; PF0 = # # # #
	LDA	#$F8
	STA	PF1		; PF1 = # # # # # . . .
	INX			; X = $00
	STX	GRP1		; clear P1 graphics
	STX	ENABL		; disable ball graphics

; fire pit bridge
	LDX	#$05		; 6 scan lines

LD6C9	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD6D4		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD6D6		; branch if end of P0 data
LD6D4	STY	Z00DA		; else update P0 line counter
LD6D6	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	TXA			; copy line counter to Y
	TAY
	LDA	(Z00A2),Y	; PF1 = bridge ends data
	STA	PF1
	LDA	Z00D5		; set background = bridge color
	STA	COLUBK
	LDA	(Z00A4),Y	; PF2 = bridge middle data
	STA	PF2

	DEX			; count line
	BPL	LD6C9		; loop for rest of lines

; do black part of fire pit
	LDX	#$15		; 22 scan lines
	STX	Z00BB		; save line count

LD6F3	LDX	#$00
	TXA			; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD6FF		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD701		; branch if end of P0 data
LD6FF	STY	Z00DA		; else update P0 line counter
LD701	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	Z00D1		; background color = room color
	STA	COLUBK
	STX	PF0		; PF0 = . . . .
	LDA	#$3F		; PF1 = . . # # # # # #
	STA	PF1
	STX	COLUPF		; playfield color = black
	DEX			; X = $FF
	STX	PF2		; PF2 = # # # # # # # #

	DEC	Z00BB		; count line
	BPL	LD6F3		; loop for rest of lines

	LDA	#$05		; ball = 1 clock, playfield priority, reflect PF
	STA	CTRLPF
	LDY	#$17		; fire pit color index (24 scan lines)

	LDX	#$07		; 8 groups
	STX	Z00BB		; save group counter

LD726	LDX	#$05		; 6 scan lines
	STX	Z00D9		; save line counter

LD72A	LDA	#$00
	STA	WSYNC		; wait for next line
	STA	GRP0		; clear P0 graphics
	LDA	(Z00A6),Y	; get fire pit color
	STA	COLUPF		; playfield color = fire pit color
	LDX	Z00BB		; get group counter
	LDA	DD1CC,X		; copy playfield data for this group
	STA	PF1
	LDA	DD1D4,X
	STA	PF2
	LDA	Z00D9		; get line count
	AND	#$01		; check low bit
	BNE	LD747		; branch if odd numbered line
	DEY			; decrement fire pit color index on even lines

LD747	DEC	Z00D9		; count this line
	BPL	LD72A		; loop for rest of lines

	DEC	Z00BB		; count this group
	BPL	LD726		; loop for rest of groups

	LDX	#$00
	LDA	Z00D1
	STA	WSYNC
	STA	COLUPF
	STX	PF2
	LDX	#$03
	STX	Z00BB
	JMP	LD3EB

; middle of room 14 (third row, seventh room, wide pit with ladder)
LD760	LDA	Z00D1
	STA	COLUPF
	LDX	#$03		; 4 scan lines

LD766	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD771		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD773		; branch if end of P0 data
LD771	STY	Z00DA		; else update P0 line counter
LD773	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	#$FC
	STA	PF0
	LDA	DD224,X
	STA	PF1
	LDA	DD234,X
	STA	PF2
	LDA	DFE39,X
	STA	ENAM1
	STA	ENABL

	DEX			; count line
	BPL	LD766		; loop for rest of lines

	LDX	#$46		; 71 scan lines

LD795	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD7A0		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD7A2		; branch if end of P0 data
LD7A0	STY	Z00DA		; else update P0 line counter
LD7A2	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	#$00		; default to no P1 data
	CPX	#$28
	BCS	LD7B2
	STA	ENABL
LD7B2	CPX	#$18
	BCS	LD7B8
	STA	ENAM1

LD7B8	LDY	Z00DB		; get P1 line counter
	INY			; increment P1 line count
	BMI	LD7C1		; branch if not yet at P1 first line
	LDA	(Z0096),Y	; get P1 sprite data
	BEQ	LD7C3		; branch if end of P1 data
LD7C1	STY	Z00DB		; else update P1 line counter
LD7C3	STA	GRP1		; put P1 data

	DEX			; count line
	BPL	LD795		; loop for rest of lines

LD7C8	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD7D3		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD7D5		; branch if end of P0 data
LD7D3	STY	Z00DA		; else update P0 line counter
LD7D5	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	Z00D1
	STA	COLUBK
	LDA	#$00
	STA	PF0
	STA	PF1
	LDX	#$03		; 3 sets of lines
	JMP	LD3E4		; do bottom of room

; middle of room 8 (third row, first room, wide pit with steps)
LD7EC	LDA	Z00D1
	STA	COLUPF
	LDX	#$03		; 4 scan lines

LD7F2	LDA	#$00		; default to no P0 data
	STA	ENABL		; turn off ball
	STA	NUSIZ1		; set P1 to one clock, one copy
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD801		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD803		; branch if end of P0 data
LD801	STY	Z00DA		; else update P0 line counter
LD803	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	DFE94,X
	STA	PF0
	LDA	DD213,X
	STA	PF1
	LDA	DD132,X
	STA	PF2

	DEX			; count line
	BPL	LD7F2		; loop for rest of lines

	LDX	#$02
	STX	ENAM1
	LDX	#$07
	STX	Z00BB
	LDX	#$05
	BNE	LD85E

LD829	LDX	#$04		; 5 scan lines
	STX	Z00D9		; save line counter

LD82D	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD83B		; branch if not yet at P0 first line
	LDA	(Z00A0),Y	; get P0 color
	TAX			; save P0 color
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD83D		; branch if end of P0 data
LD83B	STY	Z00DA		; else update P0 line counter
LD83D	LDY	Z00D9		; get line counter to Y
	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	STX	COLUP0		; put P0 color

	LDA	Z00BB
	CMP	#$02
	BNE	LD854
	LDA	DFE94,Y
	STA	PF0
	STA	ENAM1
	BNE	LD858
LD854	LDA	(Z00A2),Y
	STA	PF0

LD858	DEC	Z00D9		; count line
	BPL	LD82D		; loop for rest of lines

	LDX	#$04		; 5 scan lines

LD85E	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD869		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD86B		; branch if end of P0 data
LD869	STY	Z00DA		; else update P0 line counter
LD86B	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	DEX			; count line
	BPL	LD85E		; loop for rest of lines

	DEC	Z00BB
	BPL	LD829
	LDX	#$03		; 3 sets of lines
	JMP	LD3E4		; do bottom of room

; kernal for room 5 (second conveyor belt room)
LD87F	LDA	Z00D1
	STA	COLUPF
	LDX	#$27		; 40 scan lines

LD885	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD890		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD892		; branch if end of P0 data
LD890	STY	Z00DA		; else update P0 line counter
LD892	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	#$08		; store walls in PF1: . . . . # . . .
	STA	PF1

	LDA	#$00		; default to no P1 data
	LDY	Z00DB		; get P1 line counter
	INY			; increment P1 line count
	BMI	LD8A9		; branch if not yet at P1 firs tline
	LDA	(Z0096),Y	; get P1 sprite data
	BEQ	LD8AB		; branch if end of P1 data
LD8A9	STY	Z00DB		; else update P1 line counter
LD8AB	STA	GRP1		; put P1 data

	DEX			; count line
	BPL	LD885		; loop for rest of lines

; do conveyor belt zone
	LDA	#$0E		; P1 color = white (for skull)
	STA	COLUP1
	LDX	#$04		; 5 scan lines

LD8B6	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD8C1		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD8C3		; branch if end of P0 data
LD8C1	STY	Z00DA		; else update P0 line counter
LD8C3	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	DFE93,X		; copy PF0/PF1 data for ledge
	STA	PF0
	LDA	DD212,X
	STA	PF1

	TXA			; copy line counter to Y
	TAY
	LDA	(Z00A8),Y	; PF2 = conveyor belt data
	STA	PF2

	LDA	DFE38,X		; enable ball and M1 based on line number?
	STA	ENAM1
	STA	ENABL

	DEX			; count line
	BPL	LD8B6		; loop for rest of lines

; do one more line with just P0
	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD8F0		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD8F2		; branch if end of P0 data
LD8F0	STY	Z00DA		; else update P0 line counter
LD8F2	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	#$00		; remove conveyor belt graphics
	STA	PF2

	JSR	LD9CC		; set up skull position (4 scan lines)

; do rolling skull section of room 5
	LDX	#$1A		; 27 scan lines

LD903	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD90E		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD910		; branch if end of P0 data
LD90E	STY	Z00DA		; else update P0 line counter
LD910	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	#$00		; default to no P1 data
	LDY	Z00DB		; get P1 line counter
	INY			; increment P1 line count
	BMI	LD923		; branch if not yet at P0 first line
	LDA	(Z0098),Y	; get P1 sprite data (skull)
	BEQ	LD925		; branch if end of P0 data
LD923	STY	Z00DB		; else update P0 line counter
LD925	STA	GRP1		; put P1 data

	DEX			; count line
	BMI	LD934		; branch if end of lines

	CPX	#$08		; last 8 lines?
	BCS	LD903		; branch if not
	LDA	#$00		; turn off M1 graphics
	STA	ENAM1
	BEQ	LD903		; loop for rest of lines

LD934	LDX	#$04		; 5 scan lines (for platform under skull)

LD936	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD941		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD943		; branch if end of P0 data
LD941	STY	Z00DA		; else update P0 line counter
LD943	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	#$00		; clear P1 graphics
	STA	GRP1

	LDA	DD212,X
	STA	PF2

	DEX			; count line
	BPL	LD936		; loop for rest of lines

	LDX	#$23		; 36 scan lines

LD959	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD964		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD966		; branch if end of P0 data
LD964	STY	Z00DA		; else update P0 line counter
LD966	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	TXA			; copy line counter to Y
	TAY
	LDA	(Z009A),Y
	AND	#$04
	STA	PF2
	CPX	#$18
	BCS	LD97F
	STA	ENABL
	JMP	LD981	; (BCC would be better?)

LD97F	LDA	(Z009C),Y
LD981	LDA	(Z009C),Y
	AND	#$04
	STA	PF2

	DEX			; count line
	BPL	LD959		; loop for rest of lines

	JMP	LD7C8

LD98D	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD998		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD99A		; branch if end of P0 data
LD998	STY	Z00DA		; else update P0 line counter
LD99A	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	Z00D1
	STA	COLUBK
	STX	PF0
	STX	PF1
	STX	GRP1
	STX	PF2
	STX	ENABL
	LDA	Z00D2
	STA	COLUPF
	LDA	Z00E3
	STA	CTRLPF
	RTS

; set up skull line number, reflect, and color for rooms 1, 5, and 18
LD9B9	LDX	Z00BE		; get skull sprite index
	LDA	Z00AE		; get start scanline?
	SEC
	SBC	DD2F1,X		; subtract skull top offset
	STA	Z00DB		; set up P1 line counter = $AE - DD2F1,$BE
	LDA	Z00BD		; REFP1 = skull reflect flag
	STA	REFP1
	LDA	#$0E		; player 1 color = white
	STA	COLUP1
	RTS

; set up skull position (4 scan lines)
LD9CC	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD9D7		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD9D9		; branch if end of P0 data
LD9D7	STY	Z00DA		; else update P0 line counter
LD9D9	STA	WSYNC		; wait for next line
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD9EC		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LD9EE		; branch if end of P0 data
LD9EC	STY	Z00DA		; else update P0 line counter
LD9EE	TAX			; save P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	Z00DB		; save P0 color

	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LD9FE		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LDA00		; branch if end of P0 data
LD9FE	STY	Z00DA		; else update P0 line counter
LDA00	STA	Z00DC		; save P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	Z00DD		; save P0 color
	STA	WSYNC		; wait for next line
	STX	GRP0		; put P0 data
	LDA	Z00DB		; get P0 color
	STA	COLUP0		; put P0 color

	LDA	Z00AF		; get horizontal skull position
	SEC
LDA11	SBC	#$0F		; 5 cycles/15 pixels per loop
	BCS	LDA11
	EOR	#$0F		; negate remainder
	ASL			; shift for HMP1 offset
	ASL
	ASL
	ASL
	ADC	#$90		; adjust HMP1 offset
	STA	RESP1+$0100	; set rought sprite position
	STA	WSYNC		; wait for next line
	STA	HMP1		; set position offset

	LDA	Z00DC		; get P0 data
	STA	GRP0		; put P0 data
	LDA	Z00DD		; get P0 color
	STA	COLUP0		; put P0 color

	JSR	LD9B9		; set up skull line number, reflect, and color

	LDA	#$00		; default to no P0 data
	LDY	Z00DA		; get P0 line counter
	INY			; increment P0 line count
	BMI	LDA3A		; branch if not yet at P0 first line
	LDA	(Z009E),Y	; get P0 sprite data
	BEQ	LDA3C		; branch if end of P0 data
LDA3A	STY	Z00DA		; else update P0 line counter
LDA3C	STA	WSYNC		; wait for next line
	STA	HMOVE		; apply HMP1 offset
	STA	GRP0		; put P0 data
	LDA	(Z00A0),Y	; get P0 color
	STA	COLUP0		; put P0 color

	RTS

LDA47	LDA	#$05
	STA	Z00BC
LDA4B	LDY	Z0083		; get room number
	LDA	DFE2F,Y
	STA	ENABL
	RTS

; extra number of scan lines at end of kernal for each room (- 1?)
DDA53	.byte	            $02,$00,$03
	.byte	        $03,$03,$01,$03,$02
	.byte	    $00,$03,$03,$03,$02,$03,$04
	.byte	$03,$03,$02,$02,$03,$03,$03,$03,$03

LDA6B	LDY	Z0083
	LDA	DFDD3,Y		; get room type
	CMP	#$05		; fire pit type?
	BNE	LDA8B
	LDA	Z00AA
	SBC	#$22
	CMP	#$57
	BCS	LDA88
	LDA	Z00D3
	BEQ	LDA88
	JSR	LFCE0		; compare P0 vertical position with $EB
	BNE	LDA88
	JMP	LDBDD

LDA88	JMP	LDBD9

LDA8B	LDX	#$03
	LDY	#$00
	LDA	Z0083		; get room number
	BEQ	LDA9D		; is it first row, first room? (has gates)
	CMP	#$07		; is it second row, fifth room? (has gates)
	BEQ	LDA9D
	LDY	#$04
	CMP	#$0C		; is it third row, fifth room? (has gates)
	BNE	LDAC4
LDA9D	JSR	LFCE0		; compare P0 vertical position with $EB
	BCC	LDA88
	STY	Z00D9
LDAA4	TXA
	CLC
	ADC	Z00D9
	TAY
	SEC
	LDA	Z00AA
	SBC	DFFAB,Y
	CMP	DFE8C,Y
	BCC	LDAB9
	DEX
	BPL	LDAA4
	BMI	LDA88
LDAB9	LDA	Z00D3
	BNE	LDA88
	LDA	#$1E		; dust1
	STA	Z00B5		; set P0 sprite ID
	JMP	LDBE1

LDAC4	LDY	#$00
	LDA	Z0083		; get room number
	CMP	#$08		; is it third row, first room? (wide pit)
	BEQ	LDAD2
	LDY	#$02
	CMP	#$0E		; is it third row, seventh room? (wide pit)
	BNE	LDB26
LDAD2	JSR	LFCE0		; compare P0 vertical position with $EB
	BEQ	LDAE7
	BCS	LDB26
	CPY	#$02
	BNE	LDAFC
	INY
	CMP	DFF93,Y
	BEQ	LDB26
	BCS	LDB10
	BCC	LDB26

LDAE7	LDA	Z00AA
	SBC	DFFB3,Y
	CMP	#$1A
	BCC	LDAF9
	LDA	Z00AA
	SBC	DFFB4,Y
	CMP	#$1A
	BCS	LDAFC
LDAF9	JMP	LDBDD

LDAFC	LDA	Z0083		; get room number
	CMP	#$08		; is it third row, first room? (wide pit)
	BNE	LDB26
	LDA	Z00AB		; get P0 vertical position
	CMP	#$B9
	BEQ	LDB10		; branch if = $B9
	CMP	#$EB
	BCS	LDB26		; branch if >= $EB
	CMP	#$9C
	BCC	LDB26		; branch if < $9C
LDB10	LDA	Z00B5		; get P0 sprite ID
	CMP	#$08		; joe_walk1?
	BNE	LDB26
	LDA	Z00AA
	SBC	#$0A
	CMP	#$87
	BCC	LDAF9
	CPY	#$02
	BCS	LDB26
	LDA	Z00D3
	BNE	LDAF9
LDB26	LDA	Z0083		; get room number
	CMP	#$05		; is it second row, third room? (skull room)
	BNE	LDB83
	JSR	LFCE0		; compare P0 vertical position with $EB
	BEQ	LDB35
	BCS	LDB83
	BCC	LDB4E

LDB35	LDA	Z00AA
	SBC	#$39
	CMP	#$2C
	BCC	LDB73
	LDY	#$01
LDB3F	SEC
	LDA	Z00AA
	SBC	DFFB7,Y
	CMP	#$0B
	BCC	LDAF9
	DEY
	BPL	LDB3F
	BMI	LDB83
LDB4E	CMP	#$9D
	BEQ	LDB83
	SEC
	SBC	#$C1
	CMP	#$0A
	BCS	LDB61
	LDA	Z00AA
	SBC	#$2C
	CMP	#$41
	BCC	LDB7E
LDB61	LDA	Z00AA
	CMP	#$7C
	BEQ	LDB83
	LDA	Z00B5		; get P0 sprite ID
	CMP	#$08		; joe_walk1?
	BEQ	LDBAD
	CMP	#$12		; joe_walk1?
	BNE	LDB83
	BEQ	LDBAD
LDB73	LDA	Z0080		; get frame count
	AND	#$01		; test low bit (every 2nd frame)
	BNE	LDB7B		; branch if any bit set
	DEC	Z00AA
LDB7B	JMP	LDBD9

LDB7E	LDY	#$02
	JSR	LFC8E
LDB83	LDA	Z0083		; get room number
	CMP	#$01		; is it first row, second room? (skull room)
	BNE	LDBD9
	JSR	LFCE0		; compare P0 vertical position with $EB
	BEQ	LDB92
	BCS	LDBD9
	BCC	LDBB0

LDB92	LDX	#$01
LDB94	SEC
	LDA	Z00AA
	SBC	DFFB9,X
	CMP	#$0A
	BCC	LDBA3
	DEX
	BPL	LDB94
	BMI	LDBD9
LDBA3	LDA	Z00B5		; get P0 sprite ID
	CMP	#$08		; joe_walk1?
	BEQ	LDBAD
	CMP	#$12		; joe_walk1?
	BNE	LDBD9
LDBAD	JMP	LDBDD

LDBB0	CMP	#$94
	BEQ	LDBD9
	SEC
	SBC	#$BB
	CMP	#$0A
	BCS	LDBA3
	LDY	#$00
	LDA	Z00AA
	SBC	#$38
	CMP	#$2C
	BCC	LDBD3
	LDA	Z00AA
	SBC	#$22
	CMP	#$56
	BCC	LDBA3
	JSR	LFC8E
	JMP	LDBD9

LDBD3	JSR	LFC8E
	JMP	LDB73

LDBD9	LDX	#$00
	BEQ	LDBE3
LDBDD	LDX	#$FF
	BNE	LDBE3
LDBE1	LDX	#$01
LDBE3	JMP	LFD28		; -> B449

LDBE6	JMP	LFD28		; -> B449 (this code not referenced anywhere)

	.byte	$00,$B0,$CA,$CD,$D0,$D4,$C2,$4C
	.byte	$21,$0D,$B0,$D2,$C5,$D3,$C5,$54
	.byte	$21,$0D,$B0,$CE,$C5,$D7,$D2

; ------------ PAGE 7 ------------

	ORG	$2C00
	RORG	$FC00

; set up P0 horizontal position
LFC00	LDX	#$00		; start with RESP0/HMP0 register
; set up sprite X horizontal position
LFC02	STA	WSYNC		; wait for start of line
	SEC
LFC05	SBC	#$0F		; 5 clocks/15 pixels per loop
	BCS	LFC05
	EOR	#$0F		; negate remainder
	ASL			; shift for HMP0 offset
	ASL
	ASL
	ASL
	ADC	#$90		; adjust HMP0 offset
	STA	RESP0+$0100,X	; set rough sprite position
	STA	WSYNC		; wait for next line
	STA	HMP0,X		; set position offset
	INX			; increment X register for next sprite
	RTS

LFC1A	LDA	Z00B4
	AND	DFC25,Y
	ORA	DFC29,Y
	STA	Z00B4
	RTS

DFC25	.byte	$07,$0F,$0F,$0F
DFC29	.byte	$80,$48,$20,$10

; get room flags from Z00C3 table to Z00C2
LFC2D	LDA	Z0083		; get room number
	LSR
	TAY			; Y = room number / 2
	LDA	Z0083		; get room number (wouldn't ROLA have been better?)
	LDX	Z00C3,Y
	AND	#$01		; is room number odd?
	BEQ	LFC3D		; branch if even
	TXA			; odd room, use low nibble
	JMP	LFC42

LFC3D	TXA			; even room, use high nibble
	LSR
	LSR
	LSR
	LSR
LFC42	AND	#$0F		; mask off desired nibble
	STA	Z00C2		; save state of current room in Z00C2
	RTS

; save room flags from Z00C2 to Z00C3 table
LFC47	LDA	Z00C2		; get current room flags
	AND	DFF52,X		; mask out unwanted bit (X=0..3 -> FE FD FB F7)
	STA	Z00C2		; update current room flags
	LDA	Z00C2	; (redundant)
	STA	Z00D9		; save flags as temp in Z00D9
	LDA	Z0083		; get room number
	LSR			; X = room number / 2
	TAX
	LDY	Z00C3,X		; get existing room flag byte
	LDA	#$F0		; mask to keep high byte
	STA	Z00DA		; save mask in Z00DA
	LDA	Z0083		; get room number
	AND	#$01
	BNE	LFC6E		; branch if odd
	LDA	#$0F		; mask to keep low byte
	STA	Z00DA		; save mask in Z00DA
	ASL	Z00D9		; shift temp flags to high nibble
	ASL	Z00D9
	ASL	Z00D9
	ASL	Z00D9
LFC6E	TYA			; get existing room flag byte
	AND	Z00DA		; mask out this room's old bits
	ORA	Z00D9		; merge in this room's new bits
	STA	Z00C3,X		; save updated flags byte
	RTS

LFC76	LDY	Z00E0
	LDA	Z00B4
	BMI	LFC85
	LDA	Z00AA
	CMP	DFF56,Y
	BCC	LFC8C
LFC83	SEC
	RTS

LFC85	LDA	Z00AA
	CMP	DFF62,Y
	BCC	LFC83
LFC8C	CLC
LFC8D	RTS

LFC8E	LDA	Z00D6
	BPL	LFC9D
	LDX	DFF8F,Y
	CPX	Z00AB		; compare with P0 vertical position
	BEQ	LFCA4
	STX	Z00AB		; update P0 vertical position
	BNE	LFCA1
LFC9D	CMP	#$11
	BCS	LFCB1
LFCA1	JSR	LFCD2
LFCA4	LDX	#$FF
	STX	Z00D6
	INX
	STX	Z00D8
LFCAB	LDA	Z00B4
	AND	#$FB
	STA	Z00B4
LFCB1	RTS

LFCB2	LDA	CXM1P+$50
	BMI	LFCC3
	LDY	#$04
	LDA	Z0083		; get room number
	CMP	#$0E		; is it third row, seventh room? (wide pit)
	BEQ	LFCBF
	INY
LFCBF	LDA	CXP0FB+$50
	AND	#$40
LFCC3	RTS

LFCC4	LDA	Z00B5		; get P0 sprite ID
	CMP	#$12		; joe_walk1?
	BEQ	LFCD2
	CMP	#$0A		; joe_climb1?
	BNE	LFCD6
	LDA	#$00
	BEQ	LFCD4
LFCD2	LDA	#$08		; joe_walk1
LFCD4	STA	Z00B5		; set P0 sprite ID
LFCD6	RTS

LFCD7	LDA	Z0080		; get frame count
	AND	#$08		; test bit 3 (change every 8 frames)
	LSR			; shift to be 0 or 2
	LSR
	ADC	Z00D9		; add to ???
	RTS

LFCE0	LDA	Z00AB		; get P0 vertical position
	CMP	#$EB		; compare with $EB
	RTS

; ------------ MAIN ENTRY ------------

LFCE5	LDA	#$00
	TAX
LFCE8	STA	$00,X	; VSYNC
	TXS
	INX
	BNE	LFCE8
	CLD
LFCEF	LDA	$FFE0	; seg0 = B000
	LDA	$FFE9	; seg1 = B400
	LDA	$FFF2	; seg2 = B800
	JMP	LB000

LFCFB	LDA	$FFE4	; seg0 = D000
	LDA	$FFED	; seg1 = D400
	LDA	$FFF6	; seg2 = D800
	JMP	LD31C

LFD07	LDA	$FFE3	; seg0 = 9000
	JMP	L90B3

LFD0D	LDA	#$1B	; start vertical retrace timer
	STA	TIM64T
	LDA	$FFE3	; seg0 = 9000
	JMP	L9201

LFD18	LDA	$FFE3	; seg0 = 9000
	JMP	L91D3

LFD1E	LDA	$FFE0	; seg0 = B000
	RTS

LFD22	LDA	$FFF6	; seg2 = D800
	JMP	LDA6B

LFD28	LDA	$FFF2	; seg2 = B800
	JMP	LB449

DFD2E	.byte	$38 ; . . # # # . . . key (15 lines)
	.byte	$7C ; . # # # # # . .
	.byte	$D6 ; # # . # . # # .
	.byte	$82 ; # . . . . . # .
	.byte	$D6 ; # # . # . # # .
	.byte	$7C ; . # # # # # . .
	.byte	$38 ; . . # # # . . .
	.byte	$38 ; . . # # # . . .
	.byte	$10 ; . . . # . . . .
	.byte	$10 ; . . . # . . . .
	.byte	$10 ; . . . # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$10 ; . . . # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$10 ; . . . # . . . .
	.byte	$00

DFD3E	.byte	$20 ; . . # . . . . . sword (15 lines)
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$FC ; # # # # # # . .
	.byte	$FC ; # # # # # # . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$00

DFD4E	.byte	$30 ; . . # # . . . . amulet (15 lines)
	.byte	$30 ; . . # # . . . .
	.byte	$FC ; # # # # # # . .
	.byte	$FC ; # # # # # # . .
	.byte	$FC ; # # # # # # . .
	.byte	$FC ; # # # # # # . .
	.byte	$FC ; # # # # # # . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .

DFD5D	.byte	$00,$00,$00,$00,$00,$00 ; -> PF2
DFD63	.byte	$50 ; . # . # . . . .	; -> PF2
	.byte	$80 ; # . . . . . . .
	.byte	$F8 ; # # # # # . . .
	.byte	$80 ; # . . . . . . .
	.byte	$28 ; . . # . # . . .

DFD68	.byte	$08 ; . . . . # . . . torch (13 lines + 3 nulls for inventory)
	.byte	$18 ; . . . # # . . .
	.byte	$18 ; . . . # # . . .
	.byte	$3C ; . . # # # # . .
	.byte	$78 ; . # # # # . . .
	.byte	$70 ; . # # # . . . .
	.byte	$78 ; . # # # # . . .
	.byte	$78 ; . # # # # . . .
	.byte	$78 ; . # # # # . . .
	.byte	$FC ; # # # # # # . .
	.byte	$78 ; . # # # # . . .
	.byte	$30 ; . . # # . . . .
	.byte	$30 ; . . # # . . . .

; blank
DFD75	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00

DFD98	.byte	$00,$00,$00,$00,$00,$00 ; -> PF2
DFD9E	.byte	$28 ; . . # . # . . . 	; -> PF2
	.byte	$80 ; # . . . . . . .
	.byte	$F8 ; # # # # # . . .
	.byte	$80 ; # . . . . . . .
	.byte	$50 ; . # . # . . . .

DFDA3	.word	DD217 ; skull  (13 lines)
	.word	DD228 ; skull2 (12 lines)
	.word	DD238 ; skull3 (11 lines)
	.word	DD244 ; skull4 (11 lines)
	.word	DD250 ; skull5 (11 lines)
	.word	DD25C ; skull6 (11 lines)
	.word	DD268 ; skull7 (11 lines)
	.word	DD274 ; skull8 (12 lines)
	.word	DD281 ; skull9 (13 lines)
	.word	DD274 ; skull8 (12 lines)
	.word	DD268 ; skull7 (11 lines)
	.word	DD25C ; skull6 (11 lines)
	.word	DD250 ; skull5 (11 lines)
	.word	DD244 ; skull4 (11 lines)
	.word	DD238 ; skull3 (11 lines)
	.word	DD228 ; skull2 (12 lines)

; inventory images (all must have 16 lines!)
DFDC3	.word	DFD68	; torch
	.word	DFD3E	; sword (this item slot isn't used)
	.word	DFD3E	; sword
	.word	DFD2E	; key
	.word	DFD2E	; key
	.word	DFD2E	; key
	.word	DFD2E	; key
	.word	DFD4E	; amulet

; room type array
DFDD3	.byte	            $00,$01,$00
	.byte	        $00,$00,$02,$00,$00
	.byte	    $03,$00,$05,$00,$00,$00,$04
	.byte	$00,$00,$00,$05,$00,$05,$00,$05,$00

DFDEB	.byte	$00,$00,$01,$00,$02,$00,$01,$00
	.byte	$03

DFDF4	.byte	$00,$38,$0C,$FA,$FC,$0E,$EC,$00	; P1 sprite color table -> COLUP1
	.byte	$0A,$00,$C8

DFDFF	.byte	$B6,$62,$94,$82,$C6,$72 ; -> Z00D1 -> COLUPF/COLUBK = aqua, purple, blu, dkblu, grn, dk purple

DFE05	.byte	$92,$EC,$C8,$38,$82,$2C ; -> Z00D2 -> COLUPF = dkblu, ltbrn, grn, red, dkblu, orn

; gates? -> Z009A -> PF1/PF2
DFE0B	.word	DD1A6
	.word	DD1A5
	.word	DD1A4
	.word	DD1A3

; bridge data -> Z00A2 -> PF1 in fire pit, PF0 in step pit
DFE13	.word	DD164
	.word	DD165

; bridge data -> Z00A4 -> PF2 in fire pit
DFE17	.word	DD16B
	.word	DD16C
	.word	DD142
	.word	DD152
	.word	DD172
	.word	DD177

DFE23	.word	DD304,DD303,DD302,DD301		; pointers to rotating fire pit colors

DFE2B	.byte	$01,$00,$04,$00 ; -> Z00CF
DFE2F	.byte	$02,$00,$9E,$02 ; -> ENABL
	.byte	$00,$7F,$00,$9E,$02
DFE38	.byte	$9E
DFE39	.byte	$02,$00,$00,$00,$59,$00,$00,$00 ; -> ENAM1/ENABL
	.byte	$00,$00,$9E,$02,$00,$9E
DFE47	.byte	$FD,$FD,$FD,$FE,$FE,$FE,$FF,$FF
	.byte	$00,$00,$00,$00,$01,$01,$02,$02
	.byte	$02,$03,$03,$03

DFE5B	.word	DD2B9,DD2C1 ; -> Z00E1 -> PF2

DFE5F	.byte	$49,$49,$49,$49,$49,$49,$49,$49
	.byte	$49,$49,$68,$49,$11,$49,$81,$11
	.byte	$81,$49,$21,$21,$21,$21,$21,$21
	.byte	$49,$49,$49,$49,$49,$49,$49,$49
	.byte	$49,$49,$49,$49,$40,$51,$40,$49
	.byte	$49,$49,$49,$49,$49
DFE8C	.byte	$08,$10,$10,$08

DFE90	.byte	$10 ; . . . # . . . .	; -> PF0/PF1
	.byte	$10 ; . . . # . . . .
	.byte	$10 ; . . . # . . . .
DFE93	.byte	$10 ; . . . # . . . .	; PF0 ledge in room 1 (5 lines)
DFE94	.byte	$10 ; . . . # . . . .	; -> PF0
DFE95	.byte	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte	$FF,$20,$FF,$FF,$20,$10,$20,$10
	.byte	$10,$FF,$20,$FF,$FF,$20,$FF,$FF
	.byte	$20,$FF,$FF,$20,$FF,$FF,$20,$FF
	.byte	$FF,$FF,$FF,$FF,$20,$20,$FF,$20
	.byte	$FF,$FF,$20,$FF
DFEC1	.byte	$FF,$01 ; -> Z00D0 offset
DFEC3	.byte	$00,$00,$00,$01,$00,$02,$01,$03 ; -> Z00D4 -> NUSIZ1
	.byte	$00,$04				; (indexed by Z00C2 room flags)

DFECD	.byte	            $01,$04,$05		; sprite numbers -> Z00B1/Z00B2
	.byte	        $05,$0A,$06,$02,$04
	.byte	    $04,$08,$01,$08,$00,$0A,$04
	.byte	$01,$00,$00,$00,$03,$01,$0A,$08,$01
	.byte	            $02,$04,$01
	.byte	        $01,$08,$06,$05,$01
	.byte	    $01,$0A,$04,$03,$00,$08,$04
	.byte	$01,$00,$00,$00,$05,$01,$04,$0A,$01
	.byte	            $05,$04,$08
	.byte	        $01,$08,$06,$0A,$04
	.byte	    $04,$0A,$02,$05,$00,$05,$03
	.byte	$01,$00,$00,$00,$0A,$04,$08,$05;$01

DFF14	.byte	            $01,$00,$01		; low bit-> Z00E3 -> CTRLPF
	.byte	        $01,$01,$01,$00,$01
	.byte	    $00,$00,$01,$01,$00,$01,$01
	.byte	$01,$00,$00,$01,$00,$01,$00,$01;$00

DFF2B	.byte	$00,$00,$20,$01,$02,$00,$80,$00	; item flags: 0,0,sword,amulet,key,0,torch,0
DFF33	.byte	$00,$00,$00,$10,$11,$31,$33	; -> NUSIZ0/1 for # of lives

DFF3A	.word	DFD75 ; blank		; -> Z0096/Z0097 -> GRP1
	.word	DD136 ; gem (12 lines)
	.word	DFD3E ; sword (15 lines)
	.word	DFD4E ; amulet (15 lines)
	.word	DFD2E ; key (15 lines)
	.word	DD217 ; skull (13 lines)
	.word	DFD68 ; torch (13 lines)
	.word	DD20A ; small torch? (8 lines)
	.word	DD1EE ; snake1 (13 lines)
	.word	DD1FC ; snake2 (13 lines)
	.word	DD147 ; spider1 (11 lines)
	.word	DD157 ; spider2 (11 lines)

DFF52	.byte	$FE,$FD,$FB,$F7		; bit masks for Z00C2
DFF56	.byte	$06,$06,$0A,$15,$06,$06,$06,$06
	.byte	$12,$12,$18,$18
DFF62	.byte	$95,$95,$91,$85,$95,$95,$95,$95
	.byte	$89,$89,$81,$81

DFF6E	.byte	$02,$03,$09,$0B,$14,$17	; room numbers?
	.byte	$03,$08,$0D,$13,$14,$17
	.byte	$02,$03,$04,$0B,$16,$17

DFF80	.byte	$01,$05,$08,$0E		; special rooms
DFF84	.byte	$6D,$26,$4D,$44,$55,$7C
DFF8A	.byte	$FE,$86,$EB 		; P0 starting vert pos (5 bytes) -> Z00AB
; 2 bytes for each of the six room types
DFF8D	.byte	$EB,$EB
DFF8F	.byte	$C0,$94,$C6,$9D
DFF93	.byte	$B9,$9B,$A0,$A0,$B9,$B9

DFF99	.byte	$E6,$E6,$BB,$8F,$C1,$98
	.byte	$88,$96,$9B,$9B,$B4,$B4
DFFA5	.byte	$F0,$F0,$F2,$F2,$F2,$E4 ; line counts, indexed by DFDD3 room type -> Z00AE
DFFAB	.byte	$0B,$1F,$6B,$87,$1F,$37,$53,$6B
DFFB3	.byte	$2E
DFFB4	.byte	$52,$26,$5A
DFFB7	.byte	$2E,$62
DFFB9	.byte	$36,$59

; room flags initialization, even rooms in high nibble
DFFBB	.byte	$1F,$33,$1F,$11,$15,$19,$01,$11
	.byte	$0C,$21,$91,$17
	.byte	$1F,$13,$1F,$11,$51,$11,$09,$11
	.byte	$0C,$23,$71,$13
	.byte	$1F,$59,$5F,$11,$11,$13,$01,$11
	.byte	$0C,$21,$11,$37

	.byte	$11

	.byte	$37,$00,$C9,$A0,$80,$A0,$80,$A0
	.byte	$D2,$A0,$98,$C6,$A0,$C8,$A0,$D0
	.byte	$A0,$A0,$C9,$A0,$83,$A0,$A9,$AE
	.byte	$85,$A0,$A0,$84

	.word	LFCE5
	.word	LFCE5

	END
