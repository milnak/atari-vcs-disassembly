


bitMaskArray
    byte #%10000000
    byte #%01000000
    byte #%00100000
    byte #%00010000
    byte #%00001000
    byte #%00000100
    byte #%00000010
    byte #%00000001


;--------------------------------------------------------------------------
; playPattern
;--------------------------------------------------------------------------
; Plays a pattern
;
; - ACC should contain the offset in the patternArray of the pattern to play
; - X should contain the oscillator to be used (0 or 1)
;
;--------------------------------------------------------------------------
playPattern

    ; save unaltered patternArray offset
    sta SPtemp16L

    ; save patternArray offset
    asl
    asl
    asl
    sta SPtemp

    ; custom code to allow 1 quarter note per measure (Thrust):
    ; use beat to determine extra offset within patternArray
    lda SPbeat
    and #%00011000
    lsr
    lsr

    ; add in original offset
    adc SPtemp

    ; save osc number
    stx SPtemp

    tax

    ; *** Start Modification by Erik Ehrling to allow for more than 32 patterns ***
    lda SPtemp16L
    and #%00100000
    bne PlayPattern32
    ; *** End Modification by Erik Ehrling to allow for more than 32 patterns ***

    ; This mod allows for high and low volume patterns.
    ; Patterns of offset greater than 128 read from a different
    ; array and play lower.
    
PlayPattern0    
    lda SPtemp16L
    bmi lowPattern

    ; Loud version
    ; Get address of selected pattern
    lda patternArrayH,x
    ldy patternArrayH+1,x

    ; Set 0 attenuation
    ldx #0
    beq endGetPattern

lowPattern
    ; Soft version
    ; Get address of selected pattern
    lda patternArrayL,x
    ldy patternArrayL+1,x

    ; Set -6 attenuation
    ldx #4
    jmp endGetPattern
    
    ; *** Start Modification by Erik Ehrling to allow for more than 32 patterns ***
PlayPattern32
    lda SPtemp16L
    bmi lowPattern32

    ; Loud version
    ; Get address of selected pattern
    lda patternArrayH+256,x
    ldy patternArrayH+257,x

    ; Set 0 attenuation
    ldx #0
    beq endGetPattern

lowPattern32
    ; Soft version
    ; Get address of selected pattern
    lda patternArrayL,x
    ldy patternArrayL+1,x

    ; Set -6 attenuation
    ldx #4
    jmp endGetPattern
    ; *** End Modification by Erik Ehrling to allow for more than 32 patterns ***
    

endGetPattern
    sta SPtemp16L
    sty SPtemp16H
    stx SPatten

    ; The variable, beat, contains the 32nd note
    ; that the beat is currently on.
    lda SPbeat

    ; modification for 1 quarter per measure (Thrust)
    and #%00000111
    tay

    ; Get sound/note data
    lda (SPtemp16L),y
    eor #255
    beq muteNote
    eor #255

;--------------------------------------------------------------------------
; Extract Pattern Data
;--------------------------------------------------------------------------
; Each byte of pattern data contains the frequency and
; sound type data.  This function separates and decodes them.
;
; The encoding is: the 3 high bits contain the encoded sound
; type and the lower 5 bits contain the freq data.
;
; - ACC must contain pattern byte
;
; = ACC will return the freq
; = X will return the sound type
;
; changes ACC,X
;--------------------------------------------------------------------------
    tax

    ; Extract freq data and push it
    and #%00011111
    pha

    txa
    lsr
    lsr
    lsr
    lsr
    lsr
    tax

;-----------------------
    lda SPatten
    clc
    adc soundTurnArray,x
    sta SPatten
;-----------------------

    lda soundTypeArray,x
;--------------------------------------------------------------------------

    ; Get the osc number again
    ldx SPtemp
;	bne noPhase

;	sta AUDF0
;	nop
;	nop
;	nop
;	nop


noPhase


;    ; REMOVE IN FINAL VERSION
;    sta sound1,x

    sta AUDC0,x
    pla
    sta AUDF0,x


;    ; REMOVE IN FINAL VERSION
;    sta note1,x

    ; restore beat & #%111
    tya
    tax

;--------------------------------------------------------------------------
; Accent Reader
;--------------------------------------------------------------------------
; Each set of pattern data is followed by 4 accept bytes.
; Each bit in order represents the accent (on or off)
; of its corresponding 32nd note.  This function
; returns the attenuation of a note in a pattern.
;
; - SPtemp16 must contain an indirect pointer to the pattern data
; - X must contain the beat && %00000111
;
; = will return the volume in ACC
;
; changes X,Y,ACC
;--------------------------------------------------------------------------
    ; Accent offset is always 8 for Thrust mod
    ldy #8

    lda (SPtemp16L),y
    and bitMaskArray,x
    beq noAccent

    ; It's an Accent, so don't attenuate
    lda #15

noAccent
    ; No accent, so use a lower volume
    ora #13
;--------------------------------------------------------------------------

    sbc SPatten                   ; carry flag???
muteNote
    ldy SPtemp                    ; Get the osc number again
    sta AUDV0,y

;	; REMOVE IN FINAL VERSION
;	sta vol1,y


	;--------------------------------------------------------------------------
	; Super High Hat (TM)
	;--------------------------------------------------------------------------
	; This plays the high hat sound on the first frame of each beat indicated
	; in hatPattern
	;--------------------------------------------------------------------------
	ldy SPtemp
	beq noHat

	; Reat high hat pattern
	lda SPmeasure
	cmp #HATSTART
	bmi noHat

	lda SPbeat
	and #%00000111
	tax
	lda SPbeat
	lsr
	lsr
	lsr
	tay
	lda hatPattern,y
	and bitMaskArray,x
	beq noHat

	; Only play had on first frame
	lda SPtempoCount
	bne noHat

	; Play hat
	lda #HATPITCH
	sta AUDF1
	lda #HATSOUND
	sta AUDC1
	lda #HATVOLUME
	sta AUDV1
noHat
	;--------------------------------------------------------------------------

	;--------------------------------------------------------------------------
	; Percussion cutter
	;--------------------------------------------------------------------------
	; This code cuts off the sound for better percussive sounds.  You
	; can set it to start working at a certain measure.
	;--------------------------------------------------------------------------
;	lda SPmeasure
;	cmp #111	; start measure
;	bmi noCut

;	lda SPtempoCount
;	and #%11111110
;	beq noCut

;	lda #0
;	sta AUDV0

noCut



    rts ; playPattern OTHER RTS IN FUNCTION



;--------------------------------------------------------------------------
; songPlayer
;--------------------------------------------------------------------------
; Plays up to two pre-programmed patterns simlutaneously.
;
; Call this once per screen-draw.
;--------------------------------------------------------------------------
songPlayer

;--------------------------------------------------------------------------
; Generates tempo based on TEMPODELAY
;--------------------------------------------------------------------------
 IF COMPILE_VERSION = NTSC
    lda SPbeat			; Start small mod for finer speed adjustment /Erik Ehrling
    and #7
    cmp #7
    bne normalIncTempo
    
   inc SPtempoCount

normalIncTempo                  ; End small mod for finer speed adjustment /Erik Ehrling

    inc SPtempoCount
    lda SPtempoCount
    eor #TEMPODELAY
    bne quitTempo
    sta SPtempoCount

normalBeatInc

    inc SPbeat
    lda SPbeat
    eor #32
    bne quitTempo
    sta SPbeat

    inc SPmeasure
	
 ELSE
    inc SPtempoCount
    lda SPtempoCount
    eor #TEMPODELAY
    bne quitTempo
    sta SPtempoCount

normalBeatInc

    inc SPbeat              ; Start small mod for finer speed adjustment /Erik Ehrling
    lda SPbeat
    and #3
    cmp #3
   
    bne normalBeatInc2
    inc SPbeat

normalBeatInc2            ; End small mod for finer speed adjustment /Erik Ehrling
    
    lda SPbeat
    eor #32
    bne quitTempo
    sta SPbeat

    inc SPmeasure
 
 ENDIF

quitTempo
;--------------------------------------------------------------------------

; tweek for Medieval Mayhem
  bit DragonPass
  bvs yesKnight
noKnight    
; end Medieval Mayhem tweek

    ; set the volume to zero
    ldx #0
;    stx vol1
;    stx vol2

    ldy SPmeasure
    lda song1,y

    ; Check to see if the end of the song was reached
    cmp #255
    bne notEndOfSong

    ; Go back to the first measure
    stx SPmeasure
    lda song1,x

notEndOfSong
    jsr playPattern

    ldy SPmeasure
    lda song2,y

    ldx #1
    jmp playPattern
	
yesKnight  
  bit DeadPlayers
  bvc roundKnight
  lda #$2b
  .byte $2c
roundKnight  
  lda #$23
  cmp SPmeasure
  bcs noKnight
  
  lda #0
  sta AUDV0
  sta AUDF0
  sta AUDC0
  sta AUDV1
  sta AUDF1
  sta AUDC1
  rts
	

    ; songPlayer
;--------------------------------------------------------------------------
