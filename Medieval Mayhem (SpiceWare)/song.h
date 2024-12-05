; Variations on a theme from Druid - chip version
; (Last updated 3rd of September, 2005)
;
; Adapted for the Atari 2600 by Erik Ehrling (Sweden)
; email: "erik_ehrling 'at' hotmail 'dot' com"
;
; This is a little tune loosly based on the Druid 
; main theme by David M. Hanlon for the Commodore 64.
;
; This song uses a music driver by Paul Slocum (from Music 
; Kit v2.0). The music driver is used here with a minor 
; modification in songplay.h to allow for more than 32
; patterns. Also, small mod for tempo adjustment added.
;
; Most comments have been retained for increased readability.
;
; Run in Z26 at fixed 60 fps for true NTSC speed, e.g.:
;
; z26 -r60 -d2 -s4600 druid.bin
;
; (You might have to play with different sound buffer sizes
;  to suit your setup).
;
;-------------------------------------------------------------
; SONG DATA FILE
;-------------------------------------------------------------
;
; This file contains all the data that makes up a song for
; the song player.  By editing this file, you can write your
; own music on the 2600.  The process involves writing short 
; note patterns. arranging them
; by fours into full patterns, then sequencing those patterns
; into a song.  After you write a pattern, you'll add it to the
; pattern arrays, and then can use it in one or both of the song
; pattern lists.  There are also other parameters you can adjust
; like the auto high hat and tempo.  
; 
; This file contains data for a short demo song and I've
; explained everything that I've done.
;
; To learn how the song file works, I suggest that
; you scroll down to the bottom of this file and 
; look at the patterns first, then work your way up
; to the pattern arrays and then the song pattern
; lists.
;
; This file explains the mechanics of how to create a song,
; but for note tables and lots of tips and tricks you'll
; want to get my 2600 music programming guide off my
; website.
;



;-------------------------------------------------------------
; Tempo
;-------------------------------------------------------------
; TEMPODELAY sets the song tempo.  Higher values mean a slower
; song.  1 is extremely fast and 10 is very slow.  The tempo 
; is currently only adjustable in very large increments.
; Future versions of the software will allow more precise tempo
; settings.  Typically I use a TEMPODELAY or 3 or 4.

TEMPODELAY equ 2

;-------------------------------------------------------------
; Sound Attenuation Array
;-------------------------------------------------------------
; This section allows you to change the volume
; of each sound type globally.  Many times you'll
; have a certain sound that ends up being too loud,
; You can fix that here.  Note that a larger value
; makes the sound quieter.  Set all 8 values to zero
; if you want all sounds at full volume.  10 is probably 
; about the highest amount of attenuation you'll want.
;
; 000=square  001=bass  010=pitfall (free) 011=noise
; 100=buzz    101=lead  110=saw      111=lowbass (free)
soundTurnArray
	byte 0, 2, 5, 7
	byte 2, 3, 7, 0


;-------------------------------------------------------------
; Sound Type Array
;-------------------------------------------------------------
; This array allows you to change the sound types
; that are encoded into the first three bits of
; notes (discusses later.)  I'd suggest leaving
; this array alone until you are pretty comfortable
; writing music for the 2600.  I rarely change these
; settings.
;
; There are only 10 unique sound types on the Atari.
; I've selected the 8 sound types that
; I think are the most useful.  The two that I have not 
; included in the default setup are 2 and 14.  2 is a 
; low rumble engine sound and 14 is a very low bass 
; sound.  In addition to replacing a default sound
; with 2 or 14, you could also use this array to gain
; more precise volume control over a sound.  Say
; you want more control over the Square sound:  Just
; replace a sound you aren't using with another
; Square (4) and then using the Sound Attenuation
; Array, you can have a loud Square sound and a 
; quieter Square. 
;
;
; Default Sound Type Setup:
; 000 0 Square  = 4
; 001 1 Bass    = 6
; 010 2 Pitfall = 7
; 011 3 Noise   = 8
;
; 100 4 Buzz    = 15
; 101 5 Lead    = 12
; 110 6 Saw     = 1
; 111 7 Engine  = 3
;
soundTypeArray
    byte 4,6,7,8
    byte 15,12,1,6


;-------------------------------------------------------------
; Auto High Hat
;-------------------------------------------------------------
; The latest driver has built-in support to
; play a high-hat sound.  This allows you to have
; a high hat rhythm playing without having to add it to
; your pattern data.  The driver plays the high-hat
; click very short, so often you will barely notice
; any interference with your song.  It plays on
; the same oscillator as the "song2" list of patterns.
; If it is interfering with your music too much,
; just swap song1 and song2.
;
; You specify the high hat pattern in hatPattern.  Each
; bit corresponds to one 32nd note.  Set the bit to one
; to have it play on that beat, or zero to mute the high
; hat on that beat.  The pattern repeats each measure.
;
; You can also specify the measure that the high hat
; starts playing with HATSTART.  You may want to have
; and intro part without the high hat then have it
; come in later.  Or if you don't want to use it at all,
; then set HATSTART to 255.
;
; Finally, you can specify the high hat volume (0-15), the
; pitch (0-31), and the high hat sound type.  Refer to the
; table above for sound type values.  I typically use
; sound type 8 (Noise) and pitch 0 which sounds like a pretty
; good high hat.  But you may find other interesting settings.
;

hatPattern
	byte %10000000
	byte %10000000
	byte %10000000
	byte %10000000


; HATSTART equ 0
HATSTART equ 12

; HATVOLUME equ 8
HATVOLUME equ 3

; HATPITCH equ 0
HATPITCH equ 0

;HATSOUND equ 8
HATSOUND equ 8


;-------------------------------------------------------------
; Song Data
;-------------------------------------------------------------
; song1 and song2 are lists of four pattern sets to be
; played out of patternArrayH and patternArrayL.
; Both song1 and song2 will be played simlutaneously 
; by the software, one on each of the two oscillators,
; so each song should be exactly the same length or you
; may have some problems!  
;
; Each number (after "byte") refers
; to a four pattern set in the patternArrayH (loud
; patterns) or patternArrayL (softer patterns).  
;
; "song1" and "song2" must be against the left
; edge, and each "byte" statement must have at
; least one space or tab to the left of it.  I
; have only put two pattern numbers on each line
; but you can put as many as you want (each number
; separated by a comma).  A song cannot
; exceed 255 patterns.
;
; You must put a 255 at the end of the pattern list
; to let the driver know that it has reached the end.
; The player will automatically loop back to the beginning
; of the song when it reaches the end.
;
; I suggest that you comment your songs so you can
; remember what's going on where.  (Use a semicolon
; to indicate a comment)

song1

	byte 15,16	; main song bass
	byte 17,18
	byte 19,20
	byte 21,0

	byte 0,0
	byte 0,0

	byte 128, 128 	; background scale
	byte 129,129
	byte 130,130
	byte 131,132

	byte 128, 128	; background scale
	byte 129,129
	byte 130,130
	byte 131,132

	byte 8,9	; main song saw
	byte 10,11
	byte 12,13
	byte 14,132

	byte 8,9	; main song saw
	byte 10,11
	byte 12,13
	byte 14,132

	byte 8,9	; main song saw
	byte 10,11
	byte 12,13
	byte 14,0

;	byte 8,9	; main song saw
;	byte 10,11
;	byte 12,13
;	byte 14,0

	byte 0,0        ; mute
	byte 0,0
	byte 0,0
	byte 0,0

	byte 0,0        ; mute (half) + glide
	byte 0,35

	byte 22,23      ; alt theme pitfall
	byte 24,25
	byte 26,27
	byte 28,36

	byte 22,23      ; alt theme pitfall
	byte 24,25
	byte 26,27
	byte 28,36

	byte 8,9	; main song saw
	byte 10,11
	byte 12,13
	byte 14,132

	byte 8,9	; main song saw
	byte 10,11
	byte 12,13
	byte 14,132

	byte 128, 128 	; background scale
	byte 129,129
	byte 130,130
	byte 131,132

	byte 128, 128	; background scale
	byte 129,129
	byte 130,130
	byte 131,132


	; End of song marker
	byte 255



song2
	byte 8,9	; main song saw
	byte 10,11
	byte 12,13
	byte 14,132

	byte 1,1
	byte 1,1

	byte 7,7	; intro stomp_b
	byte 7,2
	byte 4,3
	byte 5,6

	byte 7,7	; intro stomp_a
	byte 7,2
	byte 3,4
	byte 5,6


	byte 7,7	; intro stomp_a
	byte 7,2
	byte 3,4
	byte 5,6

	byte 7,7	; intro stomp_a
	byte 7,2
	byte 3,4
	byte 5,6

	byte 128, 128   ; main scale 
	byte 129,129
	byte 130,130
	byte 131,132

;	byte 128, 128   ; main scale 
;	byte 129,129
;	byte 130,130
;	byte 131,132

	byte 4,30 	; main song stomp hihat
	byte 31,29
	byte 4,32
	byte 5,33

	byte 4,30 	; main song stomp hihat (half)
	byte 31,34

	byte 34,34      ; double hihat
	byte 34,34
	byte 34,34
	byte 34,34

	byte 34,34      ; double hihat_b
	byte 34,34
	byte 34,34
	byte 34,35

	byte 4,30 	; main song stomp hihat
	byte 31,29
	byte 4,32
	byte 5,33

	byte 4,30 	; main song stomp hihat
	byte 31,29
	byte 4,32
	byte 5,33


	byte 7,7	; intro stomp_b
	byte 7,2
	byte 4,3
	byte 5,6

	byte 7,7	; intro stomp_a
	byte 7,2
	byte 3,4
	byte 5,6

	; End of song marker
	byte 255



;-------------------------------------------------------------
; Pattern Arrays
;-------------------------------------------------------------
; The pattern arrays contains sets of four patterns. The
; numbers in the song1 and song2 lists reference
; the pattern arrays.
;
; There are two pattern arrays.  Patterns in 
; patternArrayH will play louder, while patterns 
; in patternArrayL will play softer.  This gives you
; a bit more control over volume.  You can even have
; a soft and loud version of the same pattern.
;
; In my original driver, patterns were a full measure
; long.  The reason I've divided the patterns into
; fours is because it results in a lot more reuse of
; pattern data.  You can reuse patterns as much as
; you want.  For example, you may have a drum beat
; and want to add a fill.  You can reuse the first
; three patterns, and create a new fill pattern
; for the end of the measure.  This ends up saving
; a lot of space.
;
; I always put a comment
; to the right with the pattern number so when I'm 
; writing the song (above) I can easily see the number
; of the pattern.  
;
; You'll find data for each of these patterns below.
; Make sure the name in the patternArray matches the
; name below or you'll get an error.  patternArrayL
; and patternArrayH may have a maximum of 64 sets of
; 4 patterns each.
;
; Note that pattern sets in patternArrayH start at
; zero, while pattern sets in patternArrayL start at
; 128.
;


	; Higher volume patterns
patternArrayH 						; starts at 0

	; Muted pattern
	word mute,mute,mute,mute			;0

	word KickDrum1b,mute,KickDrum1b,mute		;1 -- start scrap sound
	word KickDrum1a,mute,KickDrum1a,KickDrum1a	;2
	word KickDrum1a,mute,Snare1a,mute		;3
	word KickDrum1a,mute,Snare1a,KickDrum1a   	;4
	word KickDrum1a,mute,Snare1a,mute   		;5
	word KickDrum1a,KickDrum1a,Snare1a,mute  	;6
	word KickDrum1a,mute,KickDrum1a,mute		;7

	word saw_c3, mute, saw_c3, mute			; 8
	word saw_c3, saw_a_2, saw_c3, saw_g2		; 9
        word mute,saw_g2,mute,saw_g2			; 10
        word saw_g2, mute, saw_a2, saw_a_2		; 11
        word saw_c3, mute, saw_f2, mute			; 12
        word saw_f2, saw_d_2, saw_d2, saw_c2		; 13
        word saw_c2,mute,mute,mute			; 14

	word bass_c3, mute, bass_c3, mute		; 15
	word bass_c3, bass_a_2, bass_c3, bass_g2	; 16
        word mute,bass_g2,mute,bass_g2			; 17
        word bass_g2, mute, bass_a2, bass_a_2		; 18
        word bass_c3, mute, bass_f2, mute		; 19
        word bass_f2, bass_d_2, bass_d2, bass_c2	; 20
        word bass_c2,mute,mute,mute			; 21

	word mel_d4_d3, mel_a3_mute, mel_mute_d3, mute		; 22
	word mel_d3_d3, mel_mute_d4, mel_a3_d3, mel_g3_d4 	; 23
	word mel_mute_a3, mute, mel_c4_a3,mel_b3_mute		; 24
	word mel_mute_a3, mel_c4_a4, mel_d3_a3, mel_mute_a4	; 25
	word mel_d4_g3, mute, mel_c4_g3, mel_d4_mute		; 26
	word mel_e4_g3, mel_d4_g4, mel_d4_g3, mel_c4_g4		; 27
	word mel_d4_d3, mute, mel_mute_d4, mute			; 28

	word KickDrum1a,KickDrum1a,Snare1a,KickDrum1a  		; 29 
	word KickDrum1a,KickDrum1a,Hihat,Snare1a  		; 30
	word KickDrum1a,mute,Snare1a,Hihat  			; 31
	word KickDrum1a,Hihat,Snare1a,Hihat  			; 32
	word KickDrum1a,KickDrum1a,Snare1a,Hihat  		; 33
	
	word mute, mute, SilentHihat, SilentHihat		; 34
	word mute, mute, Glide, Glide2				; 35
	word mel_mute_d4, mel_mute_d3, mute, mel_mute_d3 	; 36

	; Lower volume patterns

patternArrayL 						; start at 128

	word saw_c3,saw_c3,saw_c3,saw_c3		;128
	word saw_g2,saw_g2,saw_g2,saw_g2		;129
	word saw_f2,saw_f2,saw_f2,saw_f2		;130
	word saw_c2,saw_c2,saw_c2,saw_c2		;131
	word saw_c3,saw_c2,saw_c3,saw_c2		;132
	


;-------------------------------------------------------------
; Pattern Data
;-------------------------------------------------------------
; This is where the note patterns are defined.  Each pattern
; is a quarter note long and is divided into 8 steps (32nd
; notes).  Each step in the pattern specifies the pitch
; and sound type for that pitch.  These patterns are
; arranged by fours into full measure patterns in the
; pattern arrays above.
;
; Way below you'll find data for the patterns listed in the
; pattern arrays above.  Each one has a name and is followed
; by 9 bytes (numbers) of data.  Each of
; the first 8 numbers in the data set represents 
; a 32nd note step.  The byte after that determines
; which 32nd notes are accented (louder).
;
; It is very helpful if you reuse patterns you've written.
; Find one that's similar to what you need, copy it, 
; and modify it.
; 
; Note that the percent sign means that you
; are entering a binary number.
;
;
; Note Encoding
; ----------------------------------------------------------
;
; The 8 note numbers are encoded with sound type and pitch.
; I put two 32nd notes per line like this:
;
;	byte %00111000, %00111000
;
; The first three bits (1's and  0's) determine the 
; sound type according to the following table:
;
; 000 Square  (high square wave)
; 001 square    (fat square sound)
; 010 Pitfall (sound of hitting a lot in pitfall)
; 011 Noise   (white noise)
; 100 Buzz    (hard buzzy sound)
; 101 Lead    (lower square wave)
; 110 Saw     (sounds kind of like a sawtooth wave)
; 111 Engine  (engine sound)
;
;
; The remaining 5 bits determine the pitch.
;
; 11111 is a very low pitch
; 00001 us a very high pitch
; 00100 is somewhere in between
;
; (!) Note that 255 or %11111111 means no sound (a rest)
;
; Some examples:
;
; %00111100 = square with a low pitch
; %10000010 = buzz sound with a high pitch
; %11100101 = engine sound with a medium pitch
; %11111111 = no sound
;
;
; The pitch on the Atari is not all on a musical scale,
; so you'll end up with some really out-of-tune stuff
; if you aren't careful.  Refer to my 2600 music 
; programming guide for some sets of in-tune notes.
;
;
; Accent Encoding
; ----------------------------------------------------------
;
; There will be ninth number at the end of each pattern like:
;  
;	byte %10001000
;
; This determines which notes are accented.  Good accents can 
; really make a pattern a lot better.  Notice there are 
; 8 bits, and conveniently they correspond to each of the 8
; notes in the pattern!  The way I have it set up above, 
; accents fall on each 8th note.  
;
; 1 = accent (loud), 0 = no accent (no as loud)
; 
; To just make the whole beat quieter, use all zeros:
;
; byte %00000000
;
; To make the whole beat louder:
;
; byte %11111111
;
; Here's an accent pattern I use often:
;
; byte %10001000
;
;
;
; Patterns:
; ----------------------------------------------------------
;
; Here are the patterns for my example song.  
; I try to name them
; meaningful names so I'll remember what they are.  
; You can name then whatever you want, just
; make sure your names start with a letter.


; Here are my kick drum patterns:

KickDrum1a
	byte %10011111, %01111111
	byte %01111101, %01111100
	byte %01111011,255
	byte 255,255

	byte %11010000


KickDrum1b
	byte %01111111, %01111101
	byte %01111100, %01111011
	byte 255,255
	byte 255,255

	byte %11100000

; I always have a muted pattern.
; You'll pretty much always need this.

Snare1a
	byte %10001010, %10010000
	byte %10010111, %01110110
	byte %01110101, 255
	byte 255, 255
	
	byte %11110000

Snare1b
	byte %10000100, %01100100
	byte %01100101, %01100101
	byte %10011110, 255
	byte 255, 255
	
	byte %11000000

Snare1c
	byte %10000100, %01100100
	byte %01100101, %01100101
	byte %10000100, %01100100
	byte %10000100, %01100101
	
	byte %11000000

Hihat
	byte %01100000, %01100001
	byte %01100010, %01100011
	byte 255,255
	byte 255,255

	byte %11100000
	
SilentHihat	
	byte 255,255
	byte 255,255
	byte %01100000, 255
	byte 255,255
	
	byte %00000000

Glide 
	byte %01111111, %01111110
	byte %01111101, %01111100
	byte %01111011, %01111010
	byte %01111001, %01111000

	byte %00000000

Glide2
	byte %01110111, %01110110
	byte %01110101, %01110100
	byte %01110011, %01110010
	byte %01110001, %01110000

	byte %00000000


saw_c3
	byte %11001111, %11001111
	byte %11001111, %11001111
	byte %11001111, %11001111
	byte 255, 255
	
	byte %11000000

saw_d2
	byte %11011011,%11011011
	byte %11011011,%11011011
	byte %11011011,%11011011
	byte 255, 255
	
	byte %11000000

saw_d_2
        byte %11011010, %11011010
        byte %11011010, %11011010
        byte %11011010, %11011010
	byte 255, 255
	
	byte %11000000


saw_a2
	byte %11010010, %11010010
	byte %11010010, %11010010
	byte %11010010, %11010010
	byte 255, 255
	
	byte %11000000


saw_a_2
        byte %11010001, %11010001
        byte %11010001, %11010001
        byte %11010001, %11010001
	byte 255, 255
	
	byte %11000000

saw_g2
        byte %11010100, %11010100
        byte %11010100, %11010100
        byte %11010100, %11010100
	byte 255, 255
	
	byte %11000000

saw_f2	
	byte %11010111, %11010111
	byte %11010111, %11010111
	byte %11010111, %11010111
	byte 255, 255
	
	byte %11000000

saw_c2
	byte %11011111, %11011111
	byte %11011111, %11011111
	byte %11011111, %11011111
	byte 255, 255
	
	byte %11000000




bass_c3
	byte %00101111, %00101111
	byte %00101111, %00101111
	byte %00101111, %00101111
	byte 255, 255
	
	byte %11000000

bass_d2
	byte %00111011,%00111011
	byte %00111011,%00111011
	byte %00111011,%00111011
	byte 255, 255
	
	byte %11000000

bass_d_2
        byte %00111010, %00111010
        byte %00111010, %00111010
        byte %00111010, %00111010
	byte 255, 255
	
	byte %11000000


bass_a2
	byte %00110010, %00110010
	byte %00110010, %00110010
	byte %00110010, %00110010
	byte 255, 255
	
	byte %11000000


bass_a_2
        byte %00110001, %00110001
        byte %00110001, %00110001
        byte %00110001, %00110001
	byte 255, 255
	
	byte %11000000

bass_g2
        byte %00110100, %00110100
        byte %00110100, %00110100
        byte %00110100, %00110100
	byte 255, 255
	
	byte %11000000

bass_f2	
	byte %00110111, %00110111
	byte %00110111, %00110111
	byte %00110111, %00110111
	byte 255, 255
	
	byte %11000000

bass_c2
	byte %00111111, %00111111
	byte %00111111, %00111111
	byte %00111111, %00111111
	byte 255, 255
	
	byte %11000000



mel_a3_d3
	byte %01001011, %00110001
	byte %11101011, 255
	byte 255, 255	
	byte 255, 255
	
	byte %11000000	
	
mel_a3_mute
	byte %01001011, %01001011
	byte %11101011, 255
	byte 255, 255	
	byte 255, 255
	
	byte %11000000	
	
mel_b3_mute
	byte %01001010, %01001010
	byte %11101010, 255
	byte 255, 255
	byte 255, 255
	
	byte %11000000	



mel_c4_a4
	byte %01001001, %00100101
	byte %11101001, 255
	byte 255, 255	
	byte 255, 255
	
	byte %11000000	

	
mel_c4_a3
	byte %01001001, %00101011
	byte %11101001, 255
	byte 255, 255	
	byte 255, 255
	
	byte %11000000	
	
mel_c4_g3
	byte %01001001, %00101100
	byte %11101001, 255
	byte 255, 255	
	byte 255, 255
	
	byte %11000000	
	
mel_c4_g4
	byte %01001001, %00100110
	byte %11101001, 255
	byte 255, 255
	byte 255, 255	
	
	byte %11000000	
	
mel_d3_a3
	byte %01010001, %00101011
	byte %11110001, 255
	byte 255, 255	
	byte 255, 255
	
	byte %11000000	
	
mel_d3_d3 
	byte %01010001, %00110001
	byte %11110001, 255
	byte 255, 255	
	byte 255, 255
	
	byte %11000000	
	
mel_d4_d3

	byte %01001000, %00110001
	byte %11101000, 255
	byte 255, 255	
	byte 255, 255
	
	byte %11000000	

mel_d4_g3

	byte %01001000, %00101100
	byte %11101000, 255
	byte 255, 255	
	byte 255, 255
	
	byte %11000000	


mel_d4_g4

	byte %01001000, %00100110
	byte %11101000, 255
	byte 255, 255	
	byte 255, 255
	
	byte %11000000	

mel_d4_mute
	byte %01001000, %01001000
	byte %11101000, 255
	byte 255, 255	
	byte 255, 255
	
	byte %11000000	

mel_e4_g3
	byte %01000111, %00101100
	byte %11100111, 255
	byte 255, 255	
	byte 255, 255
	
	byte %11000000	

mel_g3_d4 
	byte %01001100, %00101000 
	byte %11101100, 255
	byte 255, 255	
	byte 255, 255
	
	byte %11000000		
	
mel_mute_a3
	byte 255, %00101011
	byte 255, 255
	byte 255, 255
	byte 255, 255

	byte 255, 255
	byte 255, 255
	
	byte %11000000
	
mel_mute_a4
	byte 255, %00100101
	byte 255, 255
	byte 255, 255
	byte 255, 255
	
	byte %11000000

mel_mute_d3
	byte 255, %00110001
	byte 255, 255
	byte 255, 255
	byte 255, 255
	
	byte %11000000

mel_mute_d4 
	byte 255, %00101000
	byte 255, 255
	byte 255, 255
	byte 255, 255
	
	byte %11000000

mute
	byte 255,255,255,255
	byte 255,255,255,255

	byte 255