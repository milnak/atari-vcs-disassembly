.list

#include   ../vcs.inc

; ****************************
; *** Define RAM variables ***
; ****************************
           org    $80
spritehi   ds     5                    ; sprite storage for high digits of score
spritelo   ds     5                    ; sprite storage for low digits of score
spritetm   ds     5                    ; sprite storage for charges remaining
scorehi    ds     1                    ; high BCD value of score
scorelo    ds     1                    ; low BCD value of score
timer      ds     1                    ; depth charges remaining
temp       ds     1                    ; temporary storage
address    ds     2
shipx      ds     1                    ; X position of player ship
shipdelay  ds     1                    ; Delay count for moving ship
shipdir    ds     1                    ; direction player is sailing
sub1x      ds     1                    ; Submarine 1 X
sub2x      ds     1                    ; Submarine 2 X
sub3x      ds     1                    ; Submarine 3 X
sub4x      ds     1                    ; Submarine 4 X
sub1y      ds     1                    ; Submarine 1 Y
sub2y      ds     1                    ; Submarine 2 Y
sub3y      ds     1                    ; Submarine 3 Y
sub4y      ds     1                    ; Submarine 4 Y
subsprite  ds     1                    ; holds next row of sprite date for sub
sub1delay  ds     1                    ; delay count for moving sub 1
sub1speed  ds     1                    ; speed of sub 1
sub2delay  ds     1                    ; delay count for moving sub 2
sub2speed  ds     1                    ; speed of sub 2
sub3delay  ds     1                    ; delay count for moving sub 3
sub3speed  ds     1                    ; speed of sub 3
sub4delay  ds     1                    ; delay count for moving sub 4
sub4speed  ds     1                    ; speed of sub 4
depthy     ds     1                    ; position of depth charge
showdepth  ds     1                    ; missile enabled for depth charge
scanline   ds     1                    ; scanline counter
cx1        ds     1                    ; collision in zone 1
cx2        ds     1                    ; collision in zone 2
cx3        ds     1                    ; collision in zone 3
cx4        ds     1                    ; collision in zone 4
lfsr       ds     1                    ; randome
sub1size   ds     1                    ; size of submarine 1
sub2size   ds     1                    ; size of submarine 2
sub3size   ds     1                    ; size of submarine 3
sub4size   ds     1                    ; size of submarine 4

; *****************
; *** Constants ***
; *****************
colorsco   equ    $4a
colors1    equ    $ca
colorsbg   equ    $00
colortm    equ    $ca
colorsky   equ    $ae
colorship  equ    $04
colorsea1  equ    $86
colorsea2  equ    $84
colorsea3  equ    $82
colorsea4  equ    $80
shipheight equ    5
shipspeed  equ    5
subheight  equ    6
dcheight   equ    5

; *********************************
; *** Standard program start up ***
; *********************************
           org    $f000
start      sei
           ldx    #$ff
           txs
           inx
           txa
clear      sta    0,x
           dex
           bne    clear

           lda    intim                ; get timer value
           ora    #1                   ; make sure at least 1 bit is set
           sta    lfsr                 ; lfsr seed

; ********************************
; *** Initialize TIA registers ***
; ********************************
newgame    ldy    #$82
           sty    colubk
           lda    #2                   ; lock missile 0 to player
           sta    resmp0

; ****************************
; *** Initialize variables ***
; ****************************
           lda    #$00                 ; Set initial score to 0000
           sta    scorehi
           sta    scorelo
           sta    subsprite            ; Clear sub sprite
           sta    depthy               ; clear depth charge
           sta    showdepth            ; indicate depth charge not fired
           sta    cx1                  ; clear collision variables
           sta    cx2
           sta    cx3
           sta    cx4
           lda    #$30                 ; Set number of depth charges
           sta    timer
           lda    #shipspeed           ; get speed for ship
           sta    shipdelay            ; and setup ship movement delay
           lda    #40                  ; Set sub starting X positions
           sta    sub1x
           sta    sub2x
           sta    sub3x
           sta    sub4x
           lda    #20                  ; Set sub starting Y positions
           sta    sub1y
           sta    sub2y
           sta    sub3y
           sta    sub4y
           lda    #3
           sta    sub1delay
           sta    sub1speed
           lda    #1
           sta    sub2delay
           sta    sub2speed
           lda    #2
           sta    sub3delay
           sta    sub3speed
           sta    sub4delay
           sta    sub4speed
           lda    #$5                  ; set sub sizes
           sta    sub1size
           sta    sub2size
           sta    sub3size
           sta    sub4size
           lda    #0                   ; player sails left to right
           sta    shipdir
           lda    #72                  ; starting position for ship
           sta    shipx
           lda    #(pf_reflect | pf_pripf)
           sta    ctrlpf

; **********************************************************
; ***                Begin video frame                   ***
; **********************************************************

; +++++++++++++++++++++++++++++
; +++ 3 scan lines of vsync +++
; +++++++++++++++++++++++++++++
frame      lda    #$02
           sta    vsync
           sta    vblank
           sta    wsync
           sta    wsync
           sta    wsync
           lda    #0
           sta    vsync

; ++++++++++++++++++++++++++++++++++++++++
; +++ 37 scan lines of blanking period +++
; ++++++++++++++++++++++++++++++++++++++++
           ldx    #(36*76+13)/64       ; Set up PIA timer for blanking period
           sta    wsync                ; Wait until next scan line
           stx    tim64t               ; Then start timer

; ---------------------------------------
; --- Position players for scoreboard ---
; ---------------------------------------
           sec                         ; Standard horizontal placement routine
           lda    #80                  ; To set player 0 in correct position
           sta    wsync                ; to show high 2 digits of score
           sta    hmclr
loop1      sbc    #15
           bcs    loop1
           eor    #7
           asl    a
           asl    a
           asl    a
           asl    a
           sta    hmp0
           sta    resp0
           sta    wsync

           lda    #112                 ; Standard horizontal placement routine
           sec                         ; to set player 1 in correct position
           sta    wsync                ; to show low 2 digits of score
           sta    $ff
loop2      sbc    #15
           bcs    loop2
           eor    #7
           asl    a
           asl    a
           asl    a
           asl    a
           sta    hmp1
           sta    resp1
           sta    wsync
           sta    hmove                ; fix final player positions

           lda    #0                   ; make sure reflect is off for player 1
           sta    refp1
           sta    refp0                ; player 0 as well

; -----------------------------
; --- Get bitmaps for score ---
; -----------------------------
           lda    scorehi              ; get high byte of score
           and    #$f0                 ; keep only high byte
           jsr    numhiofs             ; get offset
           ldy    #0                   ; sprite offset
sc1loop    lda    numbers,x            ; get byte from sprite
           and    #$f0                 ; keep only high byte
           sta    spritehi,y           ; write to sprite storage
           inx                         ; point to next byte of sprite
           iny                         ; increment y
           cpy    #5                   ; see if done
           bne    sc1loop              ; loop back if not
           
           lda    scorehi              ; get low byte of score
           and    #$0f                 ; keep only low byte
           jsr    numloofs             ; get offset
           ldy    #0                   ; sprte offset
sc2loop    lda    numbers,x            ; get byte from sprite
           and    #$0f                 ; keep only low nybble
           ora    spritehi,y           ; combine with high graphic
           sta    spritehi,y           ; and store
           inx                         ; increment pointers
           iny
           cpy    #5                   ; see if done
           bne    sc2loop              ; loop back if not

           lda    scorelo              ; get high byte of score
           and    #$f0                 ; keep only high byte
           jsr    numhiofs             ; get offset
           ldy    #0                   ; sprite offset
sc3loop    lda    numbers,x            ; get byte from sprite
           and    #$f0                 ; keep only high byte
           sta    spritelo,y           ; write to sprite storage
           inx                         ; point to next byte of sprite
           iny                         ; increment y
           cpy    #5                   ; see if done
           bne    sc3loop              ; loop back if not
           
           lda    scorelo              ; get low byte of score
           and    #$0f                 ; keep only low byte
           jsr    numloofs             ; get offset
           ldy    #0                   ; sprte offset
sc4loop    lda    numbers,x            ; get byte from sprite
           and    #$0f                 ; keep only low nybble
           ora    spritelo,y           ; combine with high graphic
           sta    spritelo,y           ; and store
           inx                         ; increment pointers
           iny
           cpy    #5                   ; see if done
           bne    sc4loop              ; loop back if not

; ----------------------------
; --- Get bitmap for timer ---
; ----------------------------
           lda    timer                ; get high byte of timer
           and    #$f0                 ; keep only high byte
           jsr    numhiofs             ; get offset
           ldy    #0                   ; sprite offset
tm1loop    lda    numbers,x            ; get byte from sprite
           and    #$f0                 ; keep only high byte
           sta    spritetm,y           ; write to sprite storage
           inx                         ; point to next byte of sprite
           iny                         ; increment y
           cpy    #5                   ; see if done
           bne    tm1loop              ; loop back if not
           
           lda    timer                ; get low byte of timer
           and    #$0f                 ; keep only low byte
           jsr    numloofs             ; get offset
           ldy    #0                   ; sprte offset
tm2loop    lda    numbers,x            ; get byte from sprite
           and    #$0f                 ; keep only low nybble
           ora    spritetm,y           ; combine with high graphic
           sta    spritetm,y           ; and store
           inx                         ; increment pointers
           iny
           cpy    #5                   ; see if done
           bne    tm2loop              ; loop back if not

           lda    #0                   ; clear playfield registers
           sta    pf0
           sta    pf1
           sta    pf2
           lda    #colorsco            ; color for score
           sta    colup0
           sta    colup1
           lda    #colorsbg            ; get scoreboard background color
           sta    colubk
           lda    #$07                 ; set player size to quad so that each
           sta    nusiz0               ; bit is 4 pixels, to match playfield
           sta    nusiz1               ; pixels used in depth charage counter
           lda    #colortm             ; get color of timer
           sta    colupf               ; and write to playfield color

; -----------------
; --- Move ship ---
; -----------------
           dec    shipdelay            ; decrement movement count
           bne    shipgo               ; if not time, do not move ship
           lda    #shipspeed           ; reset counter
           sta    shipdelay
           lda    shipdir              ; which direction is ship going
           beq    shipright            ; jump if travelling right
           dec    shipx                ; decrement ship position
           lda    shipx                ; get current position
           cmp    #8                  ; is it far left
           bne    shipgo               ; jump if not
           lda    #136                 ; reset ship to right
           sta    shipx
           jmp    shipgo               ; then continue

shipright  inc    shipx                ; move ship
           lda    shipx                ; get ship position
           cmp    #136                 ; hit right edge
           bne    shipgo               ; jump if not
           lda    #8                   ; reset ship to left
           sta    shipx
shipgo

; ------------------
; --- Move sub 1 ---
; ------------------
           dec    sub1delay            ; decrement delay counter
           bne    sub1go               ; jump if no need to move yet
           lda    sub1speed            ; reset counter
           sta    sub1delay
           dec    sub1x                ; decrement sub1 position
           lda    sub1x
           cmp    #1
           bne    sub1go               ; jump if no need to reset
           lda    #142                 ; move sub to right side of screen
           sta    sub1x
sub1go

; ------------------
; --- Move sub 2 ---
; ------------------
           dec    sub2delay            ; decrement delay counter
           bne    sub2go               ; jump if no need to move yet
           lda    sub2speed            ; reset counter
           sta    sub2delay
           inc    sub2x                ; increment sub1 position
           lda    sub2x
           cmp    #142
           bne    sub2go               ; jump if no need to reset
           lda    #1                   ; move sub to left side of screen
           sta    sub2x
sub2go

; ------------------
; --- Move sub 3 ---
; ------------------
           dec    sub3delay            ; decrement delay counter
           bne    sub3go               ; jump if no need to move yet
           lda    sub3speed            ; reset counter
           sta    sub3delay
           dec    sub3x                ; decrement sub1 position
           lda    sub3x
           cmp    #1
           bne    sub3go               ; jump if no need to reset
           lda    #142                 ; move sub to right side of screen
           sta    sub3x
sub3go

; ------------------
; --- Move sub 4 ---
; ------------------
           dec    sub4delay            ; decrement delay counter
           bne    sub4go               ; jump if no need to move yet
           lda    sub4speed            ; reset counter
           sta    sub4delay
           inc    sub4x                ; increment sub1 position
           lda    sub4x
           cmp    #142
           bne    sub4go               ; jump if no need to reset
           lda    #1                   ; move sub to left side of screen
           sta    sub4x
sub4go

; ----------------------
; --- Check joystick ---
; ----------------------
           lda    swcha                ; read joystick
           bpl    joyright             ; jump if to the right
           asl    a                    ; shift over
           bmi    nojoy                ; jump if no left
           lda    #8                   ; set ship direction towards left
           sta    shipdir
           jmp    nojoy                ; then done
joyright   lda    #0                   ; set ship direction towards right
           sta    shipdir
nojoy      lda    timer                ; see if more depth charages
           beq    nodepth              ; jump if no more
           lda    depthy               ; is depth charge already fired
           bne    nodepth              ; cannot fire if so
           lda    inpt4                ; see if fire is pressed
           bmi    nodepth              ; jump if fire is not pressed
           sed
           lda    timer
           sec
           sbc    #1
           sta    timer
           cld
           lda    #1                   ; set depth charge
           sta    depthy

nodepth
           lda    #0                   ; clear scanline
           sta    scanline
           sta    showdepth            ; and showdepth
           sta    enam0                ; disable missile

blanklp    lda    intim                ; now wait until end of vblank period
           bne    blanklp
           sta    wsync
           lda    #0
           sta    vblank

; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; +++                           192 visible scan lines                       +++
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

; --------------------------------------
; --- 12 scan lines to display score ---
; --------------------------------------
           sta    wsync                ; one blank line

           ldy    #0                   ; first line of sprte
scorelpo   ldx    #2                   ; each score line uses 2 scan lines
scorelp    lda    spritetm,y           ; get sprite for timer
           sta    pf1                  ; and write to playfield
           lda    spritehi,y           ; get sprite info
           sta    grp0
           lda    spritelo,y
           sta    grp1
           jsr    delay12              ; need a little time
           lda    #0                   ; prevent timer on right side
           sta    pf1
           sta    wsync                ; finish scan line

           dex
           bne    scorelp              ; loop back if more to display 

           iny                         ; next line of sprite
           cpy    #5                   ; has full score been displayed
           bne    scorelpo             ; loop until full score displayed

           lda    #0
           sta    grp0
           sta    grp1


           sta    wsync                ; let final scanline of score to display

           lda    #%0011_0000          ; set playfield
           sta    pf0
           lda    #0
           sta    pf1
           sta    pf2
           lda    #00
           sta    colupf

           sta    pf1
           sta    wsync
           lda    #colorsky
           sta    colubk
           lda    shipdir              ; get ship direction
           sta    refp0                ; and set in TIA


; ---------------------------------------
; --- Render sky band (20 scan lines) ---
; ---------------------------------------
           sec
           lda    shipx                ; get position of ship
           sta    wsync                ; will position ship during first 2 scan lines of sky
           sta    hmclr
skyposlp   sbc    #15
           bcs    skyposlp
           eor    #7
           asl    a
           asl    a
           asl    a
           asl    a
           sta    hmp0
           sta    resp0
           sta    wsync

           sec                         ; during next 2 scanlines position first sub
           lda    sub1x
           sta    wsync
           sta    temp
skyposlp2  sbc    #15
           bcs    skyposlp2
           eor    #7
           asl    a
           asl    a
           asl    a
           asl    a
           sta    hmp1
           sta    resp1
           sta    wsync
           sta    hmove

           ldx    #15-shipheight       ; sky above ship
           ldy    #0                   ; set this for later
           lda    #(pl_double | $10)   ; set double width player
           sta    nusiz0
           lda    #colorship           ; get color for ship
           sta    colup0               ; and set it
skylp      sta    wsync
           dex
           bne    skylp

           ldx    #shipheight          ; height of ship sprite
shiplp     lda    ship,y               ; get sprite from ship
           sta    grp0                 ; place into player graphic
           iny                         ; point to next line
           dex                         ; decrement x
           sta    wsync                ; wait until next scanline
           bne    shiplp               ; draw rest of ship

           lda    #0                   ; clear player graphic
           sta    grp0

; ------------------
; --- Sea band 1 ---
; ------------------
           lda    sub1size             ; get size of sub 1
           sta    nusiz1               ; and set it
           lda    #colorsea1           ; use first scanline to setup band
           sta    colubk
           lda    #0                   ; need offset to sub in band
           sta    subsprite            ; set initial sprite to blank
           sec                         ; set carry for subtract
           sbc    sub1y                ; y now how number of scanlines until sub
           tay
;          lda    #0                   ; set sub color
           lda    #$1e                 ; set sub color
           sta    colup1
           ldx    #37
           lda    #0                   ; face left
           sta    refp1
           lda    depthy               ; is depth charge fired
           beq    nom0clr              ; jump if not
           lda    #0                   ; unlock missile
           sta    resmp0
nom0clr    sta    cxclr                ; clear collision latches
           sta    wsync

sea1loop   lda    subsprite            ; get sub sprite
           sta    grp1                 ; store into player
           lda    showdepth            ; get depth charge state
           sta    enam0                ; write to missile enabled
           iny                         ; increment sprite pointer
           bmi    sea1no               ; jump if not in sprite
           cpy    #subheight           ; has full sprite been shown
           beq    sea1clr              ; ndone with sub
           lda    sub,y                ; get sprite for sub
           sta    subsprite            ; store for next scanline
           jmp    sea1no
sea1clr    ldy    #$80                 ; make y very negative
           lda    #0                   ; clear subsprite
           sta    subsprite

sea1no     inc    scanline             ; increment scan line
           lda    depthy               ; get depth charge
           beq    sea1nodc             ; jump if depth charge is not fired
           sec                         ; set carry for subtract
           sbc    scanline             ; see if scanline reached
           bpl    sea1nodc             ; jump if not
           adc    dcheight             ; see if beyond depth charge
           bmi    sea1nodc             ; jump if beyond depth charge
           lda    cxm0p                ; check for missile collision
           bpl    nocx1                ; jump if no collision
           lda    #0                   ; clear depth charge
           sta    depthy
           inc    cx1                  ; mark hit in zone 1
           jmp    sea1yesdc
nocx1      lda    #2                   ; need to enable missile
           jmp    sea1yesdc
sea1nodc   lda    #0                   ; disable depth charge
sea1yesdc  sta    showdepth
sea1go
           sta    wsync
           dex
           bne    sea1loop

           sec
           lda    sub2x                ; get position of sub2
           sta    wsync                ; will position ship during last 2 scan lines of band
           sta    hmclr
sea1poslp  sbc    #15
           bcs    sea1poslp
           eor    #7
           asl    a
           asl    a
           asl    a
           asl    a
           sta    hmp1
           sta    resp1
           sta    wsync
           sta    hmove


; ------------------
; --- Sea band 2 ---
; ------------------
           lda    sub2size             ; get size of sub 1
           sta    nusiz1               ; and set it
           lda    #colorsea2           ; use first scanline to setup band
           sta    colubk
           lda    #0                   ; need offset to sub in band
           sta    subsprite            ; set initial sprite to blank
           sec                         ; set carry for subtract
           sbc    sub2y                ; y now how number of scanlines until sub
           tay
           lda    #0                   ; set sub color
           sta    colup1
           ldx    #37
           lda    pl_reverse           ; face right
           sta    refp1
           sta    cxclr                ; clear collision latches
           sta    wsync

sea2loop   lda    subsprite            ; get sub sprite
           sta    grp1                 ; store into player
           lda    showdepth            ; get depth charge state
           sta    enam0                ; write to missile enabled
           iny                         ; increment sprite pointer
           bmi    sea2no               ; jump if not in sprite
           cpy    #subheight           ; has full sprite been shown
           beq    sea2clr              ; ndone with sub
           lda    sub,y                ; get sprite for sub
           sta    subsprite            ; store for next scanline
           jmp    sea2no
sea2clr    ldy    #$80                 ; make y very negative
           lda    #0                   ; clear subsprite
           sta    subsprite
sea2no     inc    scanline             ; increment scan line
           lda    depthy               ; get depth charge
           beq    sea2nodc             ; jump if depth charge is not fired
           sec                         ; set carry for subtract
           sbc    scanline             ; see if scanline reached
           bpl    sea2nodc             ; jump if not
           adc    dcheight             ; see if beyond depth charge
           bmi    sea2nodc             ; jump if beyond depth charge
           lda    cxm0p                ; check for missile collision
           bpl    nocx2                ; jump if no collision
           lda    #0                   ; clear depth charge
           sta    depthy
           inc    cx2                  ; mark hit in zone 1
           jmp    sea2yesdc
nocx2      lda    #2                   ; need to enable missile
           jmp    sea2yesdc
sea2nodc   lda    #0                   ; disable depth charge
sea2yesdc  sta    showdepth
sea2go
           sta    wsync
           dex
           bne    sea2loop

           sec
           lda    sub3x                ; get position of sub3
           sta    wsync                ; will position ship during last 2 scan lines of band
           sta    hmclr
sea3poslp  sbc    #15
           bcs    sea3poslp
           eor    #7
           asl    a
           asl    a
           asl    a
           asl    a
           sta    hmp1
           sta    resp1
           sta    wsync
           sta    hmove

; ------------------
; --- Sea band 3 ---
; ------------------
           lda    sub3size             ; get size of sub 1
           sta    nusiz1               ; and set it
           lda    #colorsea3           ; use first scanline to setup band
           sta    colubk
           lda    #0                   ; need offset to sub in band
           sta    subsprite            ; set initial sprite to blank
           sec                         ; set carry for subtract
           sbc    sub3y                ; y now how number of scanlines until sub
           tay
           lda    #0                   ; set sub color
           sta    colup1
           ldx    #37
           lda    #0                   ; face left
           sta    refp1
           sta    cxclr                ; clear collision latches
           sta    wsync

sea3loop   lda    subsprite            ; get sub sprite
           sta    grp1                 ; store into player
           lda    showdepth            ; get depth charge state
           sta    enam0                ; write to missile enabled
           iny                         ; increment sprite pointer
           bmi    sea3no               ; jump if not in sprite
           cpy    #subheight           ; has full sprite been shown
           beq    sea3clr              ; ndone with sub
           lda    sub,y                ; get sprite for sub
           sta    subsprite            ; store for next scanline
           jmp    sea3no
sea3clr    ldy    #$80                 ; make y very negative
           lda    #0                   ; clear subsprite
           sta    subsprite
sea3no     inc    scanline             ; increment scan line
           lda    depthy               ; get depth charge
           beq    sea3nodc             ; jump if depth charge is not fired
           sec                         ; set carry for subtract
           sbc    scanline             ; see if scanline reached
           bpl    sea3nodc             ; jump if not
           adc    dcheight             ; see if beyond depth charge
           bmi    sea3nodc             ; jump if beyond depth charge
           lda    cxm0p                ; check for missile collision
           bpl    nocx3                ; jump if no collision
           lda    #0                   ; clear depth charge
           sta    depthy
           inc    cx3                  ; mark hit in zone 1
           jmp    sea3yesdc
nocx3      lda    #2                   ; need to enable missile
           jmp    sea3yesdc
sea3nodc   lda    #0                   ; disable depth charge
sea3yesdc  sta    showdepth
sea3go
           sta    wsync
           dex
           bne    sea3loop

           sec
           lda    sub4x                ; get position of sub4
           sta    wsync                ; will position ship during last 2 scan lines of band
           sta    hmclr
sea4poslp  sbc    #15
           bcs    sea4poslp
           eor    #7
           asl    a
           asl    a
           asl    a
           asl    a
           sta    hmp1
           sta    resp1
           sta    wsync
           sta    hmove

; ------------------
; --- Sea band 4 ---
; ------------------
           lda    sub4size             ; get size of sub 1
           sta    nusiz1               ; and set it
           lda    #colorsea4           ; use first scanline to setup band
           sta    colubk
           lda    #0                   ; need offset to sub in band
           sta    subsprite            ; set initial sprite to blank
           sec                         ; set carry for subtract
           sbc    sub4y                ; y now how number of scanlines until sub
           tay
           lda    #0                   ; set sub color
           sta    colup1
           ldx    #39
           lda    pl_reverse           ; face right
           sta    refp1
           sta    cxclr                ; clear collision latches
           sta    wsync

sea4loop   lda    subsprite            ; get sub sprite
           sta    grp1                 ; store into player
           lda    showdepth            ; get depth charge state
           sta    enam0                ; write to missile enabled
           iny                         ; increment sprite pointer
           bmi    sea4no               ; jump if not in sprite
           cpy    #subheight           ; has full sprite been shown
           beq    sea4clr              ; ndone with sub
           lda    sub,y                ; get sprite for sub
           sta    subsprite            ; store for next scanline
           jmp    sea4no
sea4clr    ldy    #$80                 ; make y very negative
           lda    #0                   ; clear subsprite
           sta    subsprite
sea4no     inc    scanline             ; increment scan line
           lda    depthy               ; get depth charge
           beq    sea4nodc             ; jump if depth charge is not fired
           sec                         ; set carry for subtract
           sbc    scanline             ; see if scanline reached
           bpl    sea4nodc             ; jump if not
           adc    dcheight             ; see if beyond depth charge
           bmi    sea4nodc             ; jump if beyond depth charge
           lda    cxm0p                ; check for missile collision
           bpl    nocx4                ; jump if no collision
           lda    #0                   ; clear depth charge
           sta    depthy
           inc    cx4                  ; mark hit in zone 1
           jmp    sea4yesdc
nocx4      lda    #2                   ; need to enable missile
           jmp    sea4yesdc
sea4nodc   lda    #0                   ; disable depth charge
sea4yesdc  sta    showdepth
sea4go
           sta    wsync
           dex
           bne    sea4loop


; ++++++++++++++++++++++++++++++
; +++ 30 scan lines overscan +++
; ++++++++++++++++++++++++++++++
           lda    #2
           sta    vblank
           ldx    #(29*76+13)/64
           sta    wsync
           stx    tim64t

; ---------------------------------------------------
; --- Check depth charge hitting bottom of screen ---
; ---------------------------------------------------
           lda    depthy               ; is a depth charge fired
           beq    nodepth2
           inc    depthy               ; increment y position
           lda    depthy               ; need to see if hit bottom
           cmp    #(159-dcheight)
           bne    nodepth2             ; jump if not
           lda    #0                   ; remove depth charge
           sta    depthy
           lda    #2                   ; lock missile
           sta    resmp0
nodepth2

; ---------------------------------
; --- Check collision in zone 1 ---
; ---------------------------------
           lda    cx1                  ; get collision flag
           beq    nohit1               ; jump if no hit in zone 1
           ldy    sub1speed            ; get original speed
           lda    #140                 ; reset sub position
           sta    sub1x
           jsr    random               ; get random number
           and    #$0f                 ; 0-15
           adc    #10                  ; offset from
           sta    sub1y                ; set new depth
           jsr    random               ; get random number
           and    #$03                 ; 0-3
           clc                         ; clear carry for add
           adc    #1                   ; make 1-4
           sta    sub1speed
           ldx    sub1size             ; get original size of sub
           jsr    subsize              ; get new sub size
           sta    sub1size             ; store new size
           lda    score1-1,y           ; get score for zone 1
           jmp    addscore             ; add to score

; ---------------------------------
; --- Check collision in zone 2 ---
; ---------------------------------
nohit1     lda    cx2                  ; get collision flag
           beq    nohit2               ; jump if no hit in zone 2
           ldy    sub2speed            ; get original speed
           lda    #1                   ; reset sub position
           sta    sub2x
           jsr    random               ; get random number
           and    #$0f                 ; 0-15
           adc    #10                  ; offset from
           sta    sub2y                ; set new depth
           jsr    random               ; get random number
           and    #$03                 ; 0-3
           clc                         ; clear carry for add
           adc    #1                   ; make 1-4
           sta    sub2speed
           ldx    sub2size             ; get original size of sub
           jsr    subsize              ; get new sub size
           sta    sub2size             ; store new size
           lda    score2-1,y           ; get score for zone 1
           jmp    addscore

; ---------------------------------
; --- Check collision in zone 3 ---
; ---------------------------------
nohit2     lda    cx3                  ; get collision flag
           beq    nohit3               ; jump if no hit in zone 2
           ldy    sub3speed            ; get original speed
           lda    #140                 ; reset sub position
           sta    sub3x
           jsr    random               ; get random number
           and    #$0f                 ; 0-15
           adc    #10                  ; offset from
           sta    sub3y                ; set new depth
           jsr    random               ; get random number
           and    #$03                 ; 0-3
           clc                         ; clear carry for add
           adc    #1                   ; make 1-4
           sta    sub3speed
           ldx    sub3size             ; get original size of sub
           jsr    subsize              ; get new sub size
           sta    sub3size             ; store new size
           lda    score3-1,y           ; get score for zone 1
           jmp    addscore

; ---------------------------------
; --- Check collision in zone 4 ---
; ---------------------------------
nohit3     lda    cx4                  ; get collision flag
           beq    nohit4               ; jump if no hit in zone 2
           ldy    sub4speed            ; get original speed
           lda    #140                 ; reset sub position
           sta    sub4x
           jsr    random               ; get random number
           and    #$0f                 ; 0-15
           adc    #10                  ; offset from
           sta    sub4y                ; set new depth
           jsr    random               ; get random number
           and    #$03                 ; 0-3
           clc                         ; clear carry for add
           adc    #1                   ; make 1-4
           sta    sub4speed
           ldx    sub4size             ; get original size of sub
           jsr    subsize              ; get new sub size
           sta    sub4size             ; store new size
           lda    score4-1,y           ; get score for zone 1
           jmp    addscore

nohit4
           jmp    noscore              ; nothing hit

addscore   sta    temp                 ; keep a copy
           sed                         ; set decimal mode
scoredbl   clc                         ; clear carry for add
           adc    scorelo              ; add in low score
           sta    scorelo              ; put it back
           lda    #0                   ; propagate carry
           adc    scorehi
           sta    scorehi
           cpx    #0                   ; was small sub?
           bne    scoredone            ; done if not
           ldx    #5                   ; clear flag
           lda    temp                 ; recover score
           jmp    scoredbl             ; and score it again
scoredone  cld                         ; clear decimal flag
           lda    #2                   ; lock missile
           sta    resmp0

noscore    lda    #0                   ; clear collisin variables
           sta    cx1
           sta    cx2
           sta    cx3
           sta    cx4

           lda    swchb                ; want to check for reset switch
           ror    a                    ; shift reset into carry
           bcs    oversclp             ; jump if reset not pressed
           jmp    newgame              ; otherwise new game

oversclp   lda    intim
           bne    oversclp
           sta    wsync

           jmp    frame


; **********************************************************
; ***                End of video frame                  ***
; **********************************************************

; *******************
; *** Subroutines ***
; *******************

numhiofs   lsr    a                    ; divide by 2
           lsr    a                    ; by 4
           sta    temp                 ; keep a copy of this one
           lsr    a                    ; by 8
           lsr    a                    ; by 16
           clc                         ; clear carry for add
           adc    temp                 ; now have number * 5
           tax                         ; x now has offset into number table
           rts                         ; return to caller
           
numloofs   sta    temp                 ; keep a copy
           asl    a                    ; multiply by 2
           asl    a                    ; by 4
           clc 
           adc    temp                 ; by 5
           tax                         ; transfer offset to x
           rts                         ; and return

delay12    rts                         ; return immediatedly

random     lda    lfsr
           asl    a
           eor    lfsr
           asl    a
           eor    lfsr
           asl    a
           asl    a
           eor    lfsr
           asl    a
           rol    lfsr
           rts

subsize    jsr    random                ; get random number
           and    #7                    ; 1 in 8 chance
           beq    small                 ; jump if small size
           lda    #5                    ; large size
small      rts                          ; return

; ***************
; *** Bitmaps ***
; ***************
numbers    db     %0111_0111    ; -###-###
           db     %0101_0101    ; -#-#-#-#
           db     %0101_0101    ; -#-#-#-#
           db     %0101_0101    ; -#-#-#-#
           db     %0111_0111    ; -###-###

           db     %0010_0010    ; --#---#-
           db     %0110_0110    ; -##--##-
           db     %0010_0010    ; --#---#-
           db     %0010_0010    ; --#---#-
           db     %0111_0111    ; -###-###

           db     %0111_0111    ; -###-###
           db     %0001_0001    ; ---#---#
           db     %0111_0111    ; -###-###
           db     %0100_0100    ; -#---#--
           db     %0111_0111    ; -###-###

           db     %0111_0111    ; -###-###
           db     %0001_0001    ; ---#---#
           db     %0111_0111    ; -###-###
           db     %0001_0001    ; ---#---#
           db     %0111_0111    ; -###-###

           db     %0101_0101    ; -#-#-#-#
           db     %0101_0101    ; -#-#-#-#
           db     %0111_0111    ; -###-###
           db     %0001_0001    ; ---#---#
           db     %0001_0001    ; ---#---#

           db     %0111_0111    ; -###-###
           db     %0100_0100    ; -#---#--
           db     %0111_0111    ; -###-###
           db     %0001_0001    ; ---#---#
           db     %0111_0111    ; -###-###

           db     %0100_0100    ; -#---#--
           db     %0100_0100    ; -#---#--
           db     %0111_0111    ; -###-###
           db     %0101_0101    ; -#-#-#-#
           db     %0111_0111    ; -###-###

           db     %0111_0111    ; -###-###
           db     %0001_0001    ; ---#---#
           db     %0001_0001    ; ---#---#
           db     %0001_0001    ; ---#---#
           db     %0001_0001    ; ---#---#

           db     %0111_0111    ; -###-###
           db     %0101_0101    ; -#-#-#-#
           db     %0111_0111    ; -###-###
           db     %0101_0101    ; -#-#-#-#
           db     %0111_0111    ; -###-###

           db     %0111_0111    ; -###-###
           db     %0101_0101    ; -#-#-#-#
           db     %0111_0111    ; -###-###
           db     %0001_0001    ; ---#---#
           db     %0001_0001    ; ---#---#

ship       db     %1101_1000    ; ## ##
           db     %1111_1100    ; ######
           db     %1111_1111    ; ########
           db     %1111_1110    ; #######
           db     %1111_1100    ; ######

sub        db     %0010_0000    ;    #    
           db     %0010_0000    ;    #    
           db     %0111_1101    ;  ##### #
           db     %1111_1111    ; ########
           db     %1111_1111    ; ########
           db     %0111_1101    ;  ##### #
      
score1     db     $04
           db     $03
           db     $02
           db     $01
      
score2     db     $12
           db     $09
           db     $06
           db     $03
      
score3     db     $50
           db     $40
           db     $30
           db     $20
      
score4     db     $90
           db     $70
           db     $50
           db     $40

           org    $fffc
           word   start
           word   start

