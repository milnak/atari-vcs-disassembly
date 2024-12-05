; Rough disassembly of Bobby is Going Home (Ample Ace sample copy) PAL
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
;
;
; Notes:
; This disassembly is still very rough, and will have some errors in it. The sample copy
; was disassembled first, and then the released version merged in. The address labels will
; therefore match to the sample copy.
;
; Differences between the 2 roms include changes in the logo graphics, the color used for
; the score/time display, the sprite graphics used for the jumping animation, and some shuffling
; around inside the rom.
;
; There is a bug that occurs in the sample copy as when Bobby jumps he sinks down to his waste
; before bouncing back up. I noticed this occurs when Bobby is on a screen with a retracting
; bridge. I found and area of the rom where the sample copy reloaded a value for the Y register
; where the released version didn't. The Y register was currently holding Bobby's vertical postion
; so I NOP'd it out and the bug no longer reoccured.
;
;
; Command Line: distella -pasfcBob.cfg Bob.bin > Bobby(re)Sample.asm
;
; Bob.cfg contents:
;
;      ORG F000
;      CODE F000 F328
;      GFX F329 F32E
;      CODE F32F F557
;      GFX F558 F590
;      CODE F591 F79C
;      GFX F79D F857
;      CODE F858 F8B2
;      GFX F8B3 F933
;      CODE F934 F9FF
;      GFX FA00 FA6F
;      CODE FA70 FA7C
;      GFX FA7D FADF
;      CODE FAE0 FB7D
;      GFX FB7E FBA9
;      CODE FBAA FC3A
;      GFX FC3B FCD6
;      CODE FCD7 FD57
;      GFX FD58 FDD8
;      CODE FDD9 FDFD
;      GFX FDFE FFD7
;      CODE FFD8 FFF6
;      GFX FFF7 FFFF

      processor 6502

;Read TIA Baseline = $00
CXP0FB  =  $02
CXPPMM  =  $07
INPT4   =  $0C

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
NUSIZ0  =  $04
NUSIZ1  =  $05
COLUP0  =  $06
COLUP1  =  $07
COLUPF  =  $08
COLUBK  =  $09
CTRLPF  =  $0A
REFP0   =  $0B
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM1   =  $1E
HMP0    =  $20
HMM1    =  $23
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296
T1024T  =  $0297


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SWITCHES
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; only one on at a time!
; 0 = off, 1 = on

SAMPLE_COPY        = 0
RELEASED_VERSION   = 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;colors
BLACK        =  $00
BLUE         =  $D5
CYAN         =  $74
GREEN        =  $58
GREEN_BLUE   =  $96
GREY         =  $0A
LIGHT_GREEN  =  $5F
LIGHT_PURPLE =  $AA
LIGHT_RED    =  $6A
LIGHT_TAN    =  $2C  ; flesh color
MAROON       =  $88
PURPLE       =  $A3
PURPLE_BLUE  =  $CE
RED          =  $66
RED_GREEN    =  $42
STEEL_BLUE   =  $B5
TAN          =  $28
TEAL         =  $73
WHITE        =  $0F

  IF SAMPLE_COPY
VPOS_01   =  $0B
VPOS_02   =  $0B
COL_TIME_DISPLAY   =  RED-3        ; darker in sample copy
  ELSE RELEASED_VERSION
VPOS_01   =  $18
VPOS_02   =  $0F
COL_TIME_DISPLAY   =  LIGHT_RED+1  ; brighter in the released version
  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

scoreBCD           =  $80  ; $80 - $81
hPosMidSkyObj      =  $82
vPosBobby          =  $83
hPosBobby          =  $84

vPosTopSkyObj      =  $88

digitPtrs          =  $8A  ; $8A - $91 (4 digits only), far right digit of score is drawn with $97

;general purpose object pointers
gpObjPtr1          =  $92  ; $92 - $93
gpObjPtr2          =  $94  ; $94 - $95

;gpObjPtr3          =  $96  ;
;gpObjPtr4          =  $98  ;
temp5              =  $9A  ; $9A - $9B
upLimitTopSkyObj   =  temp5
sceneNumPtr        =  temp5
framecounter       =  $9C
bobbyGfxPtr        =  $9D  ; $9D - $9E

reflectBobby       =  $A0

screenCounter      =  $A2  ; keeps on incrementing after 0-7
bridgeGfxPtr       =  $A3  ; $A3 - $A4

numOfLives         =  $A9

;these low pointers get copied into general purpose registers
highSkyObjLoPtr    =  $AA  ; big bird, high cloud, ufo, condor
middleSkyObjLoPtr  =  $AB  ; sailboat, straight moving cloud
lowSkyObjLoPtr     =  $AC  ; these swoop down to attack Bobby (small bird, bat, butterfly, etc...)
groundObjLoPtr     =  $AD  ; these objects appear directly in Bobby's way
topStackedObjLoPtr =  $AE  ;
botStackedObjLoPtr =  $AF  ;

;colors for the pointers above
colHighSkyObj      =  $B0  ;
colMidSkyObj       =  $B1  ;
colLowSkyObj       =  $B2  ;
colGroundObj       =  $B3  ;
colTopObj          =  $B4  ;
colBotObj          =  $B5  ;

sceneNumber        =  $C1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


       ORG $F000

START:
    cld                          ; 2
    ldx    #0                    ; 2
    lda    #0                    ; 2
.loopClear:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    .loopClear            ; 2³

GameReset:
;do prep for a new game
    jsr    KillAudio             ; 6   stop the old music,
    lda    #6                    ; 2   set lives to (6-1) = 5 lives
    sta    numOfLives            ; 3
    lda    #2                    ; 2   set score to 2,000 points here, it gets bumped by 1,000
    sta    scoreBCD              ; 3   elsewhere to start the game with a 3,000 score...
    lda    #1                    ; 2   start the game on scene 1
    sta    sceneNumber           ; 3
    jsr    LFA70                 ; 6   clear
    jsr    StoreHighPtrs         ; 6
    jsr    LF722                 ; 6
    jsr    LFBCE                 ; 6

MainLoop:
.loopWaitVblank
    lda    INTIM                 ; 4   finish off the Vblank period
    bne    .loopWaitVblank       ; 2³

    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    HMCLR                 ; 3
    lda    #$15                  ; 2
    sta    T1024T                ; 4
    lda    $C5                   ; 3
    beq    LF058                 ; 2³
    lda    #0                    ; 2   black
    sta    COLUBK                ; 3
    jsr    LF858                 ; 6
    lda    hPosBobby             ; 3
    ldx    #0                    ; 2   X = 0, position player 0
    jsr    HorizReposition       ; 6   reset Bobby's position
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #6                    ; 2
    sta    CTRLPF                ; 3
    sta    NUSIZ1                ; 3
    jsr    LF934                 ; 6
    jmp    LF23B                 ; 3

LF058:
    ldy    screenCounter         ; 3
    lda    LF558,Y               ; 4
    sta    COLUBK                ; 3
    jsr    LF858                 ; 6
    ldx    #0                    ; 2
    lda    hPosMidSkyObj         ; 3
    jsr    HorizReposition       ; 6   reposition the object on the horizon (sailboat, or straight moving cloud)
;move low nibbles into GP registers
    lda    highSkyObjLoPtr       ; 3   big bird, high cloud, ufo, or condor
    sta    gpObjPtr1             ; 3
    lda    middleSkyObjLoPtr     ; 3   sailboat, straight moving cloud
    sta    gpObjPtr2             ; 3
    ldy    screenCounter         ; 3
    lda    LF560,Y               ; 4
    sta    $97                   ; 3
    ldx    #1                    ; 2
    lda    $86                   ; 3
    jsr    HorizReposition       ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #5                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    colHighSkyObj         ; 3
    sta    COLUP1                ; 3
    lda    colMidSkyObj          ; 3
    sta    COLUP0                ; 3
    ldy    screenCounter         ; 3
    lda    LF568,Y               ; 4
    sta    temp5                 ; 3
    lda    LF570,Y               ; 4
    sta    temp5+1               ; 3
    sta    HMCLR                 ; 3
    jsr    DrawSkyUntilHillTops  ; 6
    lda    screenCounter         ; 3
    and    #$01                  ; 2
    beq    LF0AE                 ; 2³
    jsr    LFC04                 ; 6
    jmp    LF118                 ; 3

LF0AE:
    ldx    #0                    ; 2
    ldy    #$1C                  ; 2
LF0B2:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    temp5                 ; 3
    sta    CTRLPF                ; 3
    sta    COLUPF                ; 3
    lda    HillsOne,X            ; 4
    sta    PF0                   ; 3
    lda    HillsTwo,X            ; 4
    sta    PF1                   ; 3
    lda    HillsThree,X          ; 4
    sta    PF2                   ; 3
    lda    HillsFour,X           ; 4
    sta    PF1                   ; 3
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    lda    temp5+1               ; 3
    sta    COLUPF                ; 3
    dey                          ; 2
    cpy    #$0C                  ; 2
    bcc    LF0E2                 ; 2³
    tya                          ; 2
    lsr                          ; 2
    bcc    LF0B2                 ; 2³
    inx                          ; 2
    bne    LF0B2                 ; 3   always branch

LF0E2:
    lda    $97                   ; 3
    sta    COLUBK                ; 3
LF0E6:
    lda    temp5                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    CTRLPF                ; 3
    sta    COLUPF                ; 3
    lda    HillsOne,X            ; 4
    sta    PF0                   ; 3
    lda    HillsTwo,X            ; 4
    sta    PF1                   ; 3
    lda    HillsThree,X          ; 4
    sta    PF2                   ; 3
    lda    (gpObjPtr2),Y         ; 5
    sta    GRP0                  ; 3
    lda    HillsFour,X           ; 4
    sta    PF1                   ; 3
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    lda    temp5+1               ; 3
    sta    COLUPF                ; 3
    dey                          ; 2
    tya                          ; 2
    lsr                          ; 2
    bcc    LF0E6                 ; 2³+1
    inx                          ; 2
    cpx    #$0E                  ; 2
    bcc    LF0E6                 ; 2³+1
LF118:
    ldx    #0                    ; 2
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    hPosBobby             ; 3
    jsr    HorizReposition       ; 6
    ldy    screenCounter         ; 3
    lda    $C3                   ; 3
    sta    COLUPF                ; 3
    sta    temp5+1               ; 3
    lda    MidScreenEdgeTab,Y    ; 4
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    $87                   ; 3
    ldx    #1                    ; 2
    jsr    HorizReposition       ; 6
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    reflectBobby          ; 3
    sta    REFP0                 ; 3
    lda    lowSkyObjLoPtr        ; 3
    sta    gpObjPtr1             ; 3
    lda    colLowSkyObj          ; 3
    sta    COLUP1                ; 3
    ldy    #$0F                  ; 2   height of Bobby sprite
    lda    BobbyColorTab,Y       ; 4
    sta    COLUP0                ; 3
    ldx    #$0A                  ; 2
    lda    temp5+1               ; 3
    sta    COLUBK                ; 3
    ldy    screenCounter         ; 3
    sta    HMCLR                 ; 3
    lda    #0                    ; 2
    sta    $96                   ; 3
    sta    temp5                 ; 3
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    CXCLR                 ; 3
    ldy    screenCounter         ; 3
    lda    GroundColTab,Y        ; 4
    sta    COLUPF                ; 3
    lda    #$44                  ; 2
    sta    $9F                   ; 3
LF181:
    sta    WSYNC                 ; 3
;---------------------------------------
    cmp    $89                   ; 3
    bne    LF189                 ; 2³
    stx    temp5                 ; 3
LF189:
    cmp    vPosBobby             ; 3
    bne    LF194                 ; 2³
    ldy    #$0E                  ; 2
    sty    $96                   ; 3
    iny                          ; 2
    bne    LF1A0                 ; 3   always branch

LF194:
    ldy    $96                   ; 3
    dec    $96                   ; 5
    bpl    LF1A0                 ; 2³
    lda    #0                    ; 2
    sta    $96                   ; 3
    beq    LF1A7                 ; 3   always branch

LF1A0:
    lda    BobbyColorTab,Y       ; 4
    sta    COLUP0                ; 3
    lda    (bobbyGfxPtr),Y       ; 5
LF1A7:
    sta    GRP0                  ; 3
    ldy    temp5                 ; 3
    lda    (gpObjPtr1),Y         ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    bmi    LF1B4                 ; 2³
    dec    temp5                 ; 5
LF1B4:
    dec    $9F                   ; 5
    lda    $9F                   ; 3
    cmp    #$0B                  ; 2
    bne    LF181                 ; 2³
    lda    $85                   ; 3
    ldx    #1                    ; 2
    jsr    HorizReposition       ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    $B6                   ; 3
    sta    NUSIZ1                ; 3
    ldy    $96                   ; 3
    lda    groundObjLoPtr        ; 3
    sta    gpObjPtr2             ; 3
    lda    colGroundObj          ; 3
    sta    COLUP1                ; 3
    ldx    #$FF                  ; 2   store in PF0 and PF1 to make solid ground for Bobby to stand on
    lda    $9F                   ; 3
    sta    HMCLR                 ; 3
LF1DB:
    sta    WSYNC                 ; 3
;---------------------------------------
    cmp    vPosBobby             ; 3
    bne    LF1E8                 ; 2³
    ldy    #$0E                  ; 2
    sty    $96                   ; 3
    iny                          ; 2
    bne    LF1F4                 ; 3   always branch

LF1E8:
    ldy    $96                   ; 3
    dec    $96                   ; 5
    bpl    LF1F4                 ; 2³
    lda    #0                    ; 2
    sta    $96                   ; 3
    beq    LF1FB                 ; 3   always branch

LF1F4:
    lda    BobbyColorTab,Y       ; 4
    sta    COLUP0                ; 3
    lda    (bobbyGfxPtr),Y       ; 5
LF1FB:
    sta    GRP0                  ; 3
    ldy    $9F                   ; 3
    lda    (gpObjPtr2),Y         ; 5
    sta    GRP1                  ; 3
    cpy    #3                    ; 2
    bcs    LF215                 ; 2³
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    ldy    #0                    ; 2
    lda    (bridgeGfxPtr),Y      ; 5
    sta    PF2                   ; 3
    lda    temp5+1               ; 3
    sta    COLUBK                ; 3
LF215:
    dec    $9F                   ; 5
    lda    $9F                   ; 3
    bpl    LF1DB                 ; 2³+1
    ldy    #0                    ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    REFP0                 ; 3
    sty    $9F                   ; 3
LF225:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (bridgeGfxPtr),Y      ; 5
    sta    PF2                   ; 3
    inc    $9F                   ; 5
    ldy    $9F                   ; 3
    cpy    #8                    ; 2
    beq    LF237                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    bne    LF225                 ; 3   always branch

LF237:
    lda    CXP0FB                ; 3
    sta    $A8                   ; 3
LF23B:
    lda    #$0F                  ; 2
    ldx    #0                    ; 2
    jsr    HorizReposition       ; 6
    lda    #$6F                  ; 2
    ldx    #1                    ; 2
    jsr    HorizReposition       ; 6
    lda    sceneNumber           ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #8                    ; 2
    sta    temp5+1               ; 3
    lda    sceneNumber           ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    beq    LF25D                 ; 2³
    adc    #8                    ; 2
LF25D:
    sta    temp5                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #3                    ; 2   have 3 copies (closely spaced) on each side of the bridge
    sta    NUSIZ0                ; 3   left side objects
    sta    NUSIZ1                ; 3   right side objects
;top objects
    lda    topStackedObjLoPtr    ; 3   get the low nibble pointer, and offset the indexing,
    sec                          ; 2   as the "loop count" includes the height of the bottom object too...
    sbc    #11                   ; 2
    sta    gpObjPtr1             ; 3   place that pointer into "general purpose" register one
;bottom objects
    lda    botStackedObjLoPtr    ; 3   get the low nibble pointer,
    sta    gpObjPtr2             ; 3   and place that pointer into "general purpose" register two
    ldy    #18                   ; 2   loop count = height of (top obj + bottom obj) + 1
    sta    HMCLR                 ; 3

.loopDrawObjectsAboveLogo:
    sta    WSYNC                 ; 3
;---------------------------------------
    cpy    #11                   ; 2   check loop count, is it time to draw the bottom object?
    bcc    .drawBottomObj        ; 2³  - yes, branch
    lda    (gpObjPtr1),Y         ; 5   - no, draw the top objects instead
    sta    GRP1                  ; 3   right side
    sta    GRP0                  ; 3   left side
    lda    colTopObj             ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    bne    .skipBottomObj        ; 3   always branch

.drawBottomObj:
    lda    (gpObjPtr2),Y         ; 5
    sta    GRP0                  ; 3   left side
    sta    GRP1                  ; 3   right side
    lda    colBotObj             ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
.skipBottomObj:
    dey                          ; 2   decrease the loop count by 1
    bpl    .loopDrawObjectsAboveLogo  ; 2³

  IF SAMPLE_COPY
    jsr    DrawLivesLogo         ; 6
    sta    WSYNC                 ; 3

  ELSE RELEASED_VERSION
    lda    #$40                  ; 2
    ldx    #0                    ; 2
    jsr    DrawLivesLogo         ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$2A                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
  ENDIF

;do some prep for drawing the scene number, the scene number
;comes right after the lives display and Bit Corp logo

;set up scene number gfx pointers
    lda    sceneNumPtr           ; 3   100's and 10's digit of "Scene" number
    sta    digitPtrs+2           ; 3
    lda    sceneNumPtr+1         ; 3   1's digit of "Scene" number
    sta    digitPtrs+4           ; 3
    lda    #0                    ; 2   low nybble for "BlankDigit" gfx, plus used to clear reserve lives display
    sta    digitPtrs             ; 3   blank the far left digit (of 4 digits)
    sta    digitPtrs+6           ; 3   blank the far right digit (of 4 digits)
    sta    $96                   ; 3   stop drawing the reserve lives display
    lda    #>BlankDigit          ; 2
    ldy    #7                    ; 2   loop 7+1 times (height of a sprite)
    jsr    DrawSceneNumber       ; 6

;now clear gfx and check the audio
    lda    #0                    ; 2
    sta    GRP0                  ; 3   clear graphics
    sta    GRP1                  ; 3
    lda    numOfLives            ; 3   is Bobby dead?
    bne    LF2C7                 ; 2³  - yes, so update the audio registers
    jsr    KillAudio             ; 6   - no, turn music off and continue with overscan
    jmp    LF403                 ; 3

LF2C7:
    lda    $99                   ; 3
    beq    LF2F2                 ; 2³
    cmp    #$40                  ; 2
    bcs    LF2D5                 ; 2³
    lda    #0                    ; 2
    sta    AUDV1                 ; 3   kill volume
    beq    LF2F2                 ; 3   always branch

LF2D5:
    ldy    $99                   ; 3

  IF SAMPLE_COPY
    lda    LF300,Y               ; 4
  ELSE RELEASED_VERSION
    lda    LF300-10,Y            ; 4
  ENDIF

    sta    AUDF1                 ; 3
    inc    $BD                   ; 5
    ldy    #$0C                  ; 2
    sty    AUDC1                 ; 3
    ldx    $BE                   ; 3
    stx    AUDV1                 ; 3
    lda    $BD                   ; 3
    cmp    #7                    ; 2
    bcc    LF2F2                 ; 2³
    ldy    #0                    ; 2
    sty    $BD                   ; 3
    dec    $BE                   ; 5
LF2F2:
    lda    $A1                   ; 3
    beq    LF32F                 ; 2³+1
    inc    $BF                   ; 5
    lda    $BF                   ; 3
    cmp    #7                    ; 2
    bcc    LF304                 ; 2³+1
    lda    #0                    ; 2
LF300:
    sta    $BF                   ; 3
    inc    $C0                   ; 5
LF304:
    ldy.w  $C0                   ; 4
    lda    LF329,Y               ; 4
    tax                          ; 2
    lda    $BF                   ; 3
    eor    #$0F                  ; 2
    cpy    #6                    ; 2
    bcc    LF31F                 ; 2³
    ldx    #$11                  ; 2
    lda    #0                    ; 2
    cpy    #8                    ; 2
    bcs    LF31F                 ; 2³
    tya                          ; 2
    eor    #$0F                  ; 2
    lsr                          ; 2
LF31F:
    sta    AUDV1                 ; 3
    stx    AUDF1                 ; 3
    lda    #4                    ; 2
    sta    AUDC1                 ; 3
    bne    LF32F                 ; 3   always branch

LF329:
    .byte $1D ; |   XXX X| $F329   frequency table
    .byte $15 ; |   X X X| $F32A
    .byte $11 ; |   X   X| $F32B
    .byte $0E ; |    XXX | $F32C
    .byte $0E ; |    XXX | $F32D
    .byte $11 ; |   X   X| $F32E

LF32F:
    lda    $98                   ; 3
    beq    LF345                 ; 2³
    ldy    #0                    ; 2
    cmp    #$48                  ; 2
    bcc    LF343                 ; 2³
    lda    #2                    ; 2
    sta    AUDC1                 ; 3
    lda    #3                    ; 2
    sta    AUDF1                 ; 3
    ldy    #$0F                  ; 2
LF343:
    sty    AUDV1                 ; 3
LF345:
    lda    $99                   ; 3
    ora    $98                   ; 3
    beq    LF356                 ; 2³
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    $BC                   ; 3
    sta    $BB                   ; 3
    jmp    LF403                 ; 3

LF356:
    lda    screenCounter         ; 3
    lsr                          ; 2
    and    #$03                  ; 2
    tay                          ; 2
    lda    LFEF6,Y               ; 4
    sta    $96                   ; 3
    ldy    $BB                   ; 3
    bne    LF371                 ; 2³
    lda    #$80                  ; 2
    ldx    $C4                   ; 3
    beq    LF36D                 ; 2³
    lda    #$40                  ; 2
LF36D:
    sta    $BB                   ; 3
    bne    LF37F                 ; 2³
LF371:
    inc    $BC                   ; 5
    lda    $BC                   ; 3
    cmp    $96                   ; 3
    bne    LF395                 ; 2³
    lda    #0                    ; 2
    sta    $BC                   ; 3
    dec    $BB                   ; 5
LF37F:
    ldy    $BB                   ; 3
    lda    #4                    ; 2
    sta    AUDC0                 ; 3
    lda    LF8B3,Y               ; 4
    ldx    $C4                   ; 3
    beq    LF393                 ; 2³
    lda    #$0C                  ; 2
    sta    AUDC0                 ; 3
    lda    LF79D,Y               ; 4
LF393:
    sta    AUDF0                 ; 3
LF395:
    ldy    $BB                   ; 3
    lda    LF8B3,Y               ; 4
    ldx    $C4                   ; 3
    beq    LF3A5                 ; 2³
    lda    LF79D,Y               ; 4
    ldy    #8                    ; 2
    bne    LF3A7                 ; 3   always branch

LF3A5:
    ldy    #6                    ; 2
LF3A7:
    cmp    #$80                  ; 2
    bcs    LF3C1                 ; 2³
    ldy    #0                    ; 2
    cmp    #$20                  ; 2
    bcs    LF3C1                 ; 2³
    ldy    #1                    ; 2
    lda    $BC                   ; 3
    lsr                          ; 2
    eor    #$0F                  ; 2
    lsr                          ; 2
    and    #$0E                  ; 2
    sec                          ; 2
    sbc    #2                    ; 2
    bcc    LF3C1                 ; 2³
    tay                          ; 2
LF3C1:
    sty    AUDV0                 ; 3
    lda    $A1                   ; 3
    bne    LF403                 ; 2³+1
    ldy    $BB                   ; 3
    lda    #$0C                  ; 2
    sta    AUDC1                 ; 3
    lda    LFD58,Y               ; 4
    ldx    $C4                   ; 3
    beq    LF3D7                 ; 2³
    lda    LFF24,Y               ; 4
LF3D7:
    sta    AUDF1                 ; 3
    ldy    $BB                   ; 3
    lda    LFD58,Y               ; 4
    ldx    $C4                   ; 3
    beq    LF3E5                 ; 2³
    lda    LFF24,Y               ; 4
LF3E5:
    ldy    #5                    ; 2
    cmp    #$80                  ; 2
    bcs    LF401                 ; 2³+1
    ldy    #0                    ; 2
    cmp    #$20                  ; 2
    bcs    LF401                 ; 2³+1
    ldy    #1                    ; 2
    lda    $BC                   ; 3
    lsr                          ; 2
    eor    #$0F                  ; 2
    lsr                          ; 2
    and    #$0E                  ; 2
    sec                          ; 2
    sbc    #2                    ; 2
    bcc    LF401                 ; 2³
    tay                          ; 2
LF401:
    sty    AUDV1                 ; 3
LF403:
    lda    INTIM                 ; 4
    bne    LF403                 ; 2³
    sta    COLUBK                ; 3
    sta    COLUPF                ; 3
    jsr    DoVsyncPeriod         ; 6
    lda    #$28                  ; 2
    sta    TIM64T                ; 4
    inc    framecounter          ; 5
    lda    numOfLives            ; 3   is Bobby dead?
    bne    LF41D                 ; 2³
    jmp    LF6E0                 ; 3

LF41D:
    lda    $99                   ; 3
    bne    LF440                 ; 2³
    lda    framecounter          ; 3
    and    #$1F                  ; 2
    bne    LF440                 ; 2³
    lda    screenCounter         ; 3
    beq    LF440                 ; 2³
    and    #$03                  ; 2
    bne    LF440                 ; 2³
    lda    bridgeGfxPtr          ; 3
    clc                          ; 2
    adc    #8                    ; 2
    cmp    #$B0                  ; 2
    bne    LF43A                 ; 2³
    lda    #$80                  ; 2
LF43A:
    sta    bridgeGfxPtr          ; 3
    lda    #0                    ; 2
    sta    lowSkyObjLoPtr        ; 3
LF440:
    lda    framecounter          ; 3
    and    #$0F                  ; 2
    bne    LF462                 ; 2³
    lda    $C4                   ; 3
    beq    LF451                 ; 2³
    dec    $C4                   ; 5
    bne    LF451                 ; 2³
    jmp    LF4CF                 ; 3

LF451:
    ldy    hPosMidSkyObj         ; 3
    iny                          ; 2
    cpy    #$A0                  ; 2   middle sky object right boundary
    bcc    .skipLeftEdgeReset    ; 2³
    ldy    #8                    ; 2
.skipLeftEdgeReset:
    cpy    #8                    ; 2   middle sky object left boundary
    bcs    LF460                 ; 2³
    ldy    #8                    ; 2
LF460:
    sty    hPosMidSkyObj         ; 3
LF462:
    lda    $98                   ; 3
    ora    $99                   ; 3
    ora    $C4                   ; 3
    beq    LF46D                 ; 2³
    jmp    LF4EA                 ; 3

LF46D:
    inc    $A5                   ; 5
    lda    $A5                   ; 3
    ldy    $A1                   ; 3
    bne    LF479                 ; 2³
    cmp    #4                    ; 2
    bcs    LF47D                 ; 2³
LF479:
    cmp    #4                    ; 2
    bcc    LF4CC                 ; 2³
LF47D:
    lda    #0                    ; 2
    sta    $A5                   ; 3
    ldy.w  hPosBobby             ; 4   get Bobby's current position,
    lda    SWCHA                 ; 4   and check if the joystick1 is being pushed to the left...
    asl                          ; 2
    asl                          ; 2
    bcs    .checkRightDirection  ; 2³  - branch when left direction is not pressed
    lda    reflectBobby          ; 3
    ora    #$08                  ; 2   otherwise turn Bobby to the left, by reflecting the sprite GFX
    sta    reflectBobby          ; 3
    cpy    #8                    ; 2   have we reached the left side boundary?
    bcc    .updateBobbyHpos      ; 2³  - yes, move leftwards no more
    dey                          ; 2   - no, move left by one pixel
    bne    .updateBobbyHpos      ; 3   always branch

.checkRightDirection:
    lda    SWCHA                 ; 4
    asl                          ; 2
    bcs    LF4CC                 ; 2³  - branch when right direction is not pressed
    lda    reflectBobby          ; 3
    and    #$F7                  ; 2   cancelling the reflect mode turns Bobby to the right
    sta    reflectBobby          ; 3
    cpy    #152                  ; 2   have we reached the right boundary?
    bcs    LF4CF                 ; 2³  - yes, go no further
    iny                          ; 2   - no, move right by one pixel
.updateBobbyHpos:
    sty    hPosBobby             ; 3   store Bobby's horizontal position
    lda    $C5                   ; 3
    beq    LF4BB                 ; 2³
    cpy    #$84                  ; 2
    bne    LF4BB                 ; 2³
    lda    #$3C                  ; 2
    sta    $C4                   ; 3
    lda    #0                    ; 2
    sta    $BB                   ; 3
LF4BB:
    lda    $A1                   ; 3
    bne    LF4CC                 ; 2³
    lda    bobbyGfxPtr           ; 3   find the current walking animation,
    clc                          ; 2
    adc    #$10                  ; 2   and then get the next one in line...
    cmp    #<BobbyJumping        ; 2   after the last one is reached it overflows into the jumping animation,
    bcc    .storeWalkingPointer  ; 2³
    lda    #<BobbyWalk1          ; 2   so re-start the walking sequence with the first animation
.storeWalkingPointer:
    sta    bobbyGfxPtr           ; 3
LF4CC:
    jmp    LF4EA                 ; 3

LF4CF:
    lda    $C5                   ; 3
    beq    LF4DC                 ; 2³
    sed                          ; 2
    lda    sceneNumber           ; 3
    clc                          ; 2
    adc    #1                    ; 2
    sta    sceneNumber           ; 3
    cld                          ; 2
LF4DC:
    inc    screenCounter         ; 5
    sed                          ; 2
    lda    scoreBCD              ; 3
    clc                          ; 2
    adc    #1                    ; 2   add 1,000 points for clearing a screen
    sta    scoreBCD              ; 3
    cld                          ; 2
    jsr    LF722                 ; 6

LF4EA:
  IF RELEASED_VERSION
    lda    #$39                  ; 2

  ELSE SAMPLE_COPY
    lda    screenCounter         ; 3
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    cpy    #5                    ; 2
    bcc    LF4F5                 ; 2³
    ldy    #5                    ; 2
LF4F5:
    lda    LFFD1,Y               ; 4
  ENDIF

    sta    $97                   ; 3
    lda    $99                   ; 3
    bne    LF555                 ; 2³+1
    lda    $A1                   ; 3
    bne    LF521                 ; 2³
    lda    $98                   ; 3
    bne    LF555                 ; 2³
    lda    $C5                   ; 3
    bne    LF555                 ; 2³
    lda    INPT4                 ; 3
    asl                          ; 2
    bcs    LF555                 ; 2³
    lda    #$66                  ; 2
    sta    $A1                   ; 3
    lda    #0                    ; 2
    sta    $C0                   ; 3
    sta    $BF                   ; 3
    lda    #<BobbyJumping        ; 2
    sta    bobbyGfxPtr           ; 3
    lda    #$19                  ; 2
    sta    vPosBobby             ; 3
LF521:
    ldy    vPosBobby             ; 3
    lda    $A1                   ; 3
    and    #$01                  ; 2
    bne    LF535                 ; 2³
    lda    $A1                   ; 3
    cmp    $97                   ; 3
    bcc    LF532                 ; 2³
    iny                          ; 2
    bne    LF533                 ; 2³
LF532:
    dey                          ; 2
LF533:
    sty    vPosBobby             ; 3
LF535:
  IF SAMPLE_COPY
    ldy    $98                   ; 3   this causes a bug where Bobby will sink halfway through the ground when
    beq    LF543                 ; 2³  he's jumping on a screen with the retracting bridges
  ENDIF
    lda    vPosBobby             ; 3
    cmp    #VPOS_01              ; 2
    bcs    LF543                 ; 2³
    lda    #VPOS_02              ; 2
    sta    vPosBobby             ; 3
LF543:
    dec    $A1                   ; 5
    bne    LF555                 ; 2³
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
    ldy    $98                   ; 3
    bne    LF555                 ; 2³
    sta    bobbyGfxPtr           ; 3   walking animation one
    lda    #$0F                  ; 2
    sta    vPosBobby             ; 3
LF555:
    jmp    LF591                 ; 3

LF558:
    .byte  GREEN_BLUE+9  ; $F558   background color
    .byte  STEEL_BLUE    ; $F559
    .byte  GREEN_BLUE+9  ; $F55A
    .byte  RED_GREEN+12  ; $F55B
    .byte  GREEN_BLUE+6  ; $F55C
    .byte  BLACK+2       ; $F55D
    .byte  BLACK         ; $F55E
    .byte  RED_GREEN+10  ; $F55F
LF560:
    .byte $D3 ; |XX X  XX| $F560   sta $97
    .byte $D3 ; |XX X  XX| $F561
    .byte $D3 ; |XX X  XX| $F562
    .byte $5A ; | X XX X | $F563
    .byte $9C ; |X  XXX  | $F564
    .byte $0C ; |    XX  | $F565
    .byte $0F ; |    XXXX| $F566
    .byte $00 ; |        | $F567
LF568:
    .byte $68 ; | XX X   | $F568   sta $9A
    .byte $38 ; |  XXX   | $F569
    .byte $2F ; |  X XXXX| $F56A
    .byte $D3 ; |XX X  XX| $F56B
    .byte $75 ; | XXX X X| $F56C
    .byte $2F ; |  X XXXX| $F56D   control PF table?
    .byte $76 ; | XXX XX | $F56E
    .byte $86 ; |X    XX | $F56F
LF570:
    .byte $B5 ; |X XX X X| $F570   sta $9B
    .byte $94 ; |X  X X  | $F571
    .byte $75 ; | XXX X X| $F572
    .byte $95 ; |X  X X X| $F573
    .byte $9C ; |X  XXX  | $F574
    .byte $00 ; |        | $F575
    .byte $25 ; |  X  X X| $F576
    .byte $00 ; |        | $F577
LF578:
    .byte $3A ; |  XXX X | $F578   decide what to store in $C3
    .byte $9B ; |X  XX XX| $F579
    .byte $B5 ; |X XX X X| $F57A
    .byte $9A ; |X  XX X | $F57B
    .byte $9C ; |X  XXX  | $F57C
    .byte $0A ; |    X X | $F57D
    .byte $B7 ; |X XX XXX| $F57E
    .byte $07 ; |     XXX| $F57F
    .byte $07 ; |     XXX| $F580
LF581:
    .byte  BLUE-2        ; $F581   background color
    .byte  BLACK         ; $F582
    .byte  BLUE          ; $F583
    .byte  BLACK         ; $F584
    .byte  BLACK         ; $F585
    .byte  BLUE-2        ; $F586
    .byte  PURPLE-3      ; $F587
    .byte  BLACK         ; $F588
GroundColTab:
    .byte  GREEN-4       ; $F589   screen 1
    .byte  BLACK+5       ; $F58A   screen 2
    .byte  GREY          ; $F58B   screen 3
    .byte  CYAN          ; $F58C   screen 4
    .byte  PURPLE+3      ; $F58D   screen 5
    .byte  RED_GREEN     ; $F58E   screen 6
    .byte  TAN           ; $F58F   screen 7
    .byte  BLUE+4        ; $F590   screen 8

;after the first scene, the Y register keeps incrementing, and the code below is actually used
;for the ground color! the first instruction "lda framecounter" is opcode $A5 and operand $9C,
;so for scene 2 the ground color is $A4 for screen 1, and $9C for screen 2. Note that the color
;registers can only store even numbers so that's how $A5 turns into $A4...

LF591:
    lda    framecounter          ; 3
    and    #$3F                  ; 2
    bne    LF5B0                 ; 2³
    ldy    $A6                   ; 3
    iny                          ; 2
    cmp    #$29                  ; 2
    bne    LF5A0                 ; 2³
    ldy    #0                    ; 2
LF5A0:
    sty    $A6                   ; 3
    ldy    $A7                   ; 3
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    bpl    LF5AE                 ; 2³
    tya                          ; 2
    clc                          ; 2
    adc    #$40                  ; 2
    tay                          ; 2
LF5AE:
    sty    $A7                   ; 3
LF5B0:
    lda    framecounter          ; 3
    lsr                          ; 2
    bcc    LF5BB                 ; 2³
    and    #$01                  ; 2
    tax                          ; 2
    jsr    LFB3C                 ; 6
LF5BB:
    ldx    screenCounter         ; 3
    txa                          ; 2
    and    #$03                  ; 2
    cmp    #2                    ; 2
    bne    LF612                 ; 2³+1
    lda    framecounter          ; 3
    and    #$03                  ; 2
    bne    LF612                 ; 2³+1
    ldy    $85                   ; 3
    dey                          ; 2
    cpy    #$7C                  ; 2
    bne    LF5DD                 ; 2³
    lda    $B6                   ; 3
    cmp    LF7DE,X               ; 4
    clc                          ; 2
    adc    #2                    ; 2
    sta    $B6                   ; 3
    beq    LF610                 ; 2³+1
LF5DD:
    cpy    #$5C                  ; 2
    bne    LF5ED                 ; 2³
    lda    $B6                   ; 3
    cmp    LF7DE,X               ; 4
    beq    LF610                 ; 2³+1
    clc                          ; 2
    adc    #4                    ; 2
    sta    $B6                   ; 3
LF5ED:
    cpy    #4                    ; 2
    bcs    LF610                 ; 2³+1
    lda    $B6                   ; 3
    cmp    #0                    ; 2
    beq    LF60A                 ; 2³+1
    sec                          ; 2
    sbc    #2                    ; 2
    cmp    #3                    ; 2
    bcc    LF601                 ; 2³+1
    sec                          ; 2
    sbc    #2                    ; 2
LF601:
    sta    $B6                   ; 3
    tya                          ; 2
    clc                          ; 2
    adc    #$20                  ; 2
    tay                          ; 2
    bne    LF610                 ; 2³
LF60A:
    lda    #0                    ; 2
    sta    $B6                   ; 3
    ldy    #$98                  ; 2
LF610:
    sty    $85                   ; 3
LF612:
    nop                          ; 2
    lda    $98                   ; 3
    nop                          ; 2
    ora    $99                   ; 3
    bne    LF645                 ; 2³
    lda    CXPPMM                ; 3
    asl                          ; 2
    bcs    LF636                 ; 2³
    lda    $A1                   ; 3
    bne    LF645                 ; 2³
    lda    $A8                   ; 3
    asl                          ; 2
    bcs    LF645                 ; 2³
    ldx    #$0E                  ; 2
    stx    $BE                   ; 3
    lda    #$94                  ; 2
    sta    $99                   ; 3
    lda    #<BobbySinking        ; 2
    sta    bobbyGfxPtr           ; 3
    bne    LF645                 ; 3   always branch

LF636:
    lda    #$50                  ; 2
    sta    $98                   ; 3
    lda    vPosBobby             ; 3
    sec                          ; 2
    sbc    #4                    ; 2
    sta    vPosBobby             ; 3
    ldx    #<BobbyDead           ; 2
    stx    bobbyGfxPtr           ; 3
LF645:
    ldy    $98                   ; 3
    beq    LF654                 ; 2³
    dec    $98                   ; 5
    bne    LF654                 ; 2³
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
    jsr    LFBCE                 ; 6
LF654:
    ldy    $99                   ; 3
    beq    LF675                 ; 2³
    lda    $99                   ; 3
    sec                          ; 2
    sbc    #$40                  ; 2
    bcc    LF664                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    vPosBobby             ; 3
LF664:
    dec    $99                   ; 5
    bne    LF675                 ; 2³
    lda    #0                    ; 2
    sta    $BE                   ; 3
    sta    AUDV1                 ; 3
    sta    $BD                   ; 3
    sta    $BC                   ; 3
    jsr    LFBCE                 ; 6
LF675:
    ldy    $B7                   ; 3
    lda    framecounter          ; 3
    and    #$10                  ; 2
    sta    $96                   ; 3
    bne    LF680                 ; 2³
    iny                          ; 2
LF680:
    lda    HighSkyObjLoPtrTab,Y  ; 4
    sta    highSkyObjLoPtr       ; 3   big bird, high cloud, ufo, condor
    ldy    $B8                   ; 3
    lda    $96                   ; 3
    bne    LF68C                 ; 2³
    iny                          ; 2
LF68C:
    lda    LowSkyObjLoPtrTab,Y   ; 4
    sta    lowSkyObjLoPtr        ; 3
    ldy    $B9                   ; 3
    lda    $96                   ; 3
    bne    LF698                 ; 2³
    iny                          ; 2
LF698:
    lda    GroundObjLoPtrTab,Y   ; 4
    sta    groundObjLoPtr        ; 3
    ldy    $BA                   ; 3
    lda    $96                   ; 3
    bne    LF6A4                 ; 2³
    iny                          ; 2
LF6A4:
    lda    TopStackedObjLoPtrTab,Y  ; 4
    sta    topStackedObjLoPtr    ; 3
    lda    framecounter          ; 3
    and    #$0F                  ; 2
    bne    LF6E0                 ; 2³   every 15 frames,
    lda    scoreBCD              ; 3    check if the score is at zero
    ora    scoreBCD+1            ; 3
    bne    .someScoreRemains     ; 2³   no - there still are points left
    lda    #1                    ; 2    yes - the score out...
    sta    scoreBCD+1            ; 3
    lda    #$60                  ; 2
    sta    vPosBobby             ; 3
    jsr    LFBCE                 ; 6
.someScoreRemains:
    sed                          ; 2
    ldy    #0                    ; 2
    lda    $98                   ; 3
    ora    $99                   ; 3
    ora    $C4                   ; 3
    bne    LF6CD                 ; 2³
    ldy    #1                    ; 2
LF6CD:
    sty    $96                   ; 3
    ldx    #1                    ; 2
    sec                          ; 2
LF6D2:
    lda    $80,X                 ; 4
    sbc    $96                   ; 3
    sta    $80,X                 ; 4
    lda    #0                    ; 2
    sta    $96                   ; 3
    dex                          ; 2
    bpl    LF6D2                 ; 2³
    cld                          ; 2
LF6E0:
    jsr    GetScorePointers      ; 6
    ldy    screenCounter         ; 3
    lda    LF578,Y               ; 4
    tax                          ; 2
    and    #$0F                  ; 2
    cmp    #6                    ; 2
    bcs    LF6F3                 ; 2³
    txa                          ; 2
    ora    #$06                  ; 2
    tax                          ; 2
LF6F3:
    txa                          ; 2
    cmp    GroundColTab,Y        ; 4
    bne    LF703                 ; 2³+1
    cmp    #6                    ; 2
    beq    LF701                 ; 2³+1
    lda    #6                    ; 2
    bne    LF703                 ; 3   always branch

LF701:
    lda    #$C8                  ; 2
LF703:
    sta    $C3                   ; 3
    ldy    #0                    ; 2
    lda    screenCounter         ; 3
    and    #$07                  ; 2
    cmp    #7                    ; 2
    bne    LF711                 ; 2³
    ldy    #1                    ; 2
LF711:
    sty    $C5                   ; 3
    lda    SWCHB                 ; 4
    lsr                          ; 2   test if reset switch is pressed
    bcc    .reset                ; 2³
    lsr                          ; 2   test if select switch is pressed
    bcs    .no_select            ; 2³

.reset:
    jmp    GameReset             ; 3   go if either reset or select switched are pressed,
.no_select:
    jmp    MainLoop              ; 3   or else end the Vblank period...

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;called from 2 places

LF722 SUBROUTINE
    lda    #8                    ; 2   after a screen is crossed, restart Bobby on the left
    sta    hPosBobby             ; 3
    lda    #0                    ; 2
    sta    $BC                   ; 3
    lda    screenCounter         ; 3   find which screen Bobby is on, and look up the low gfx pointer
    and    #$0F                  ; 2   to the appropiate bridge for to that screen...
    tay                          ; 2   there are a rotation of 16 bridges (Y = 0-15)
    lda    BridgePtrTab,Y        ; 4   after 16 screens (2 complete stages) the rotation restarts
    sta    bridgeGfxPtr          ; 3
    lda    LF7DE,Y               ; 4
    tax                          ; 2
    cmp    #$10                  ; 2
    bcs    LF740                 ; 2³
    lda    #$98                  ; 2
    ldx    #0                    ; 2
LF740:
    sta    $85                   ; 3
    stx    $B6                   ; 3
    lda    screenCounter         ; 3
    and    #$07                  ; 2
    tay                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    ColHighSkyObjTab,Y    ; 4
    sta    colHighSkyObj         ; 3
    lda    ColMidSkyObjTab,Y     ; 4
    sta    colMidSkyObj          ; 3
    lda    ColLowSkyObjTab,Y     ; 4
    sta    colLowSkyObj          ; 3
    lda    middleSkyObjLoPtrTab,Y ; 4  load & store the "low nibble" pointers from a table, for the graphics of the
    sta    middleSkyObjLoPtr     ; 3   horizontal edge objects, like the sailboat, or the straight moving cloud...
    stx    $B7                   ; 3
    stx    $B8                   ; 3
    lda    screenCounter         ; 3
    and    #$03                  ; 2
    cmp    #2                    ; 2
    bne    LF774                 ; 2³
    lda    scoreBCD+1            ; 3
    and    #$01                  ; 2
    clc                          ; 2
    adc    #4                    ; 2
    bne    LF77A                 ; 2³
LF774:
    lda    scoreBCD+1            ; 3
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
LF77A:
    tay                          ; 2
    asl                          ; 2
    sta    $B9                   ; 3
    lda    ColGroundObjTab,Y     ; 4
    sta    colGroundObj          ; 3
    lda    framecounter          ; 3
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    tay                          ; 2
    asl                          ; 2
    sta    $BA                   ; 3
    lda    BotStackedObjLoPtrTab,Y  ; 4
    sta    botStackedObjLoPtr    ; 3
    lda    TopObjectColTab,Y     ; 4
    sta    colTopObj             ; 3
    lda    BottomObjectColTab,Y  ; 4
    sta    colBotObj             ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF79D:
    .byte $4E ; | X  XXX | $F79D   frequency, volume
    .byte $4E ; | X  XXX | $F79E
    .byte $4E ; | X  XXX | $F79F
    .byte $0E ; |    XXX | $F7A0
    .byte $8E ; |X   XXX | $F7A1
    .byte $8E ; |X   XXX | $F7A2
    .byte $0C ; |    XX  | $F7A3
    .byte $4A ; | X  X X | $F7A4
    .byte $0A ; |    X X | $F7A5
    .byte $8A ; |X   X X | $F7A6
    .byte $0B ; |    X XX| $F7A7
    .byte $4A ; | X  X X | $F7A8
    .byte $0A ; |    X X | $F7A9
    .byte $8A ; |X   X X | $F7AA
    .byte $49 ; | X  X  X| $F7AB
    .byte $09 ; |    X  X| $F7AC
    .byte $4B ; | X  X XX| $F7AD
    .byte $0B ; |    X XX| $F7AE
    .byte $49 ; | X  X  X| $F7AF
    .byte $49 ; | X  X  X| $F7B0
    .byte $09 ; |    X  X| $F7B1
    .byte $89 ; |X   X  X| $F7B2
    .byte $09 ; |    X  X| $F7B3
    .byte $4A ; | X  X X | $F7B4
    .byte $0A ; |    X X | $F7B5
    .byte $8A ; |X   X X | $F7B6
    .byte $0A ; |    X X | $F7B7
    .byte $4B ; | X  X XX| $F7B8
    .byte $0B ; |    X XX| $F7B9
    .byte $8B ; |X   X XX| $F7BA
    .byte $0C ; |    XX  | $F7BB
    .byte $0E ; |    XXX | $F7BC
    .byte $4B ; | X  X XX| $F7BD
    .byte $4B ; | X  X XX| $F7BE
    .byte $4B ; | X  X XX| $F7BF
    .byte $0B ; |    X XX| $F7C0
    .byte $8B ; |X   X XX| $F7C1
    .byte $8B ; |X   X XX| $F7C2
    .byte $0C ; |    XX  | $F7C3
    .byte $4A ; | X  X X | $F7C4
    .byte $0A ; |    X X | $F7C5
    .byte $8A ; |X   X X | $F7C6
    .byte $0B ; |    X XX| $F7C7
    .byte $4A ; | X  X X | $F7C8
    .byte $0A ; |    X X | $F7C9
    .byte $8A ; |X   X X | $F7CA
    .byte $49 ; | X  X  X| $F7CB
    .byte $09 ; |    X  X| $F7CC
    .byte $4B ; | X  X XX| $F7CD
    .byte $0B ; |    X XX| $F7CE
    .byte $49 ; | X  X  X| $F7CF
    .byte $49 ; | X  X  X| $F7D0
    .byte $09 ; |    X  X| $F7D1
    .byte $89 ; |X   X  X| $F7D2
    .byte $09 ; |    X  X| $F7D3
    .byte $4A ; | X  X X | $F7D4
    .byte $0A ; |    X X | $F7D5
    .byte $8A ; |X   X X | $F7D6
    .byte $0A ; |    X X | $F7D7
    .byte $4B ; | X  X XX| $F7D8
    .byte $0B ; |    X XX| $F7D9
    .byte $8B ; |X   X XX| $F7DA
    .byte $0C ; |    XX  | $F7DB
    .byte $0E ; |    XXX | $F7DC
    .byte $4E ; | X  XXX | $F7DD
LF7DE:
    .byte $20 ; |  X     | $F7DE  used with $B6
    .byte $80 ; |X       | $F7DF
    .byte $02 ; |      X | $F7E0
    .byte $28 ; |  X X   | $F7E1
    .byte $78 ; | XXXX   | $F7E2
    .byte $18 ; |   XX   | $F7E3
    .byte $06 ; |     XX | $F7E4
    .byte $80 ; |X       | $F7E5
    .byte $28 ; |  X X   | $F7E6
    .byte $88 ; |X   X   | $F7E7
    .byte $06 ; |     XX | $F7E8
    .byte $20 ; |  X     | $F7E9
    .byte $78 ; | XXXX   | $F7EA
    .byte $18 ; |   XX   | $F7EB
    .byte $06 ; |     XX | $F7EC
    .byte $80 ; |X       | $F7ED
BridgePtrTab:
    .byte  <BridgeTwo    ; Y=0
    .byte  <BridgeSeven  ; Y=1
    .byte  <BridgeNine   ; Y=2
    .byte  <BridgeEight  ; Y=3
    .byte  <BridgeOne    ; Y=4
    .byte  <BridgeEleven ; Y=5
    .byte  <BridgeTen    ; Y=6
    .byte  <BridgeTwelve ; Y=7
    .byte  <BridgeOne    ; Y=8
    .byte  <BridgeEight  ; Y=9
    .byte  <BridgeNine   ; Y=10  $0A
    .byte  <BridgeEleven ; Y=11  $0B
    .byte  <BridgeOne    ; Y=12  $0C
    .byte  <BridgeTwelve ; Y=13  $0D
    .byte  <BridgeTen    ; Y=14  $0E
    .byte  <BridgeSeven  ; Y=15  $0F

  IF RELEASED_VERSION
UpperLimitTab:
    .byte $30 ; |  XX    | top sky object   sta $9A
    .byte $44 ; | X   X  | low sky object
LowerLimitTab:
    .byte $0C ; |    XX  | top sky object   sta $9B
    .byte $17 ; |   X XXX| low sky object
  ENDIF

;free bytes until $F8 page
  REPEAT ($F800 - *)
    .byte $FF
  REPEND

       ORG $F800

Numbers:

BlankDigit:
    .byte $00 ; |        | $F800
    .byte $00 ; |        | $F801
    .byte $00 ; |        | $F802
    .byte $00 ; |        | $F803
    .byte $00 ; |        | $F804
    .byte $00 ; |        | $F805
    .byte $00 ; |        | $F806
    .byte $00 ; |        | $F807
Zero:
    .byte $3C ; |  XXXX  | $F808
    .byte $66 ; | XX  XX | $F809
    .byte $66 ; | XX  XX | $F80A
    .byte $66 ; | XX  XX | $F80B
    .byte $66 ; | XX  XX | $F80C
    .byte $66 ; | XX  XX | $F80D
    .byte $66 ; | XX  XX | $F80E
    .byte $3C ; |  XXXX  | $F80F
One:
    .byte $3C ; |  XXXX  | $F810
    .byte $18 ; |   XX   | $F811
    .byte $18 ; |   XX   | $F812
    .byte $18 ; |   XX   | $F813
    .byte $18 ; |   XX   | $F814
    .byte $18 ; |   XX   | $F815
    .byte $38 ; |  XXX   | $F816
    .byte $18 ; |   XX   | $F817
Two:
    .byte $7E ; | XXXXXX | $F818
    .byte $60 ; | XX     | $F819
    .byte $60 ; | XX     | $F81A
    .byte $3C ; |  XXXX  | $F81B
    .byte $06 ; |     XX | $F81C
    .byte $06 ; |     XX | $F81D
    .byte $46 ; | X   XX | $F81E
    .byte $3C ; |  XXXX  | $F81F
Three:
    .byte $3C ; |  XXXX  | $F820
    .byte $46 ; | X   XX | $F821
    .byte $06 ; |     XX | $F822
    .byte $0C ; |    XX  | $F823
    .byte $0C ; |    XX  | $F824
    .byte $06 ; |     XX | $F825
    .byte $46 ; | X   XX | $F826
    .byte $3C ; |  XXXX  | $F827
Four:
    .byte $0C ; |    XX  | $F828
    .byte $0C ; |    XX  | $F829
    .byte $0C ; |    XX  | $F82A
    .byte $7E ; | XXXXXX | $F82B
    .byte $4C ; | X  XX  | $F82C
    .byte $2C ; |  X XX  | $F82D
    .byte $1C ; |   XXX  | $F82E
    .byte $0C ; |    XX  | $F82F
Five:
    .byte $7C ; | XXXXX  | $F830
    .byte $46 ; | X   XX | $F831
    .byte $06 ; |     XX | $F832
    .byte $06 ; |     XX | $F833
    .byte $7C ; | XXXXX  | $F834
    .byte $60 ; | XX     | $F835
    .byte $60 ; | XX     | $F836
    .byte $7E ; | XXXXXX | $F837
Six:
    .byte $3C ; |  XXXX  | $F838
    .byte $66 ; | XX  XX | $F839
    .byte $66 ; | XX  XX | $F83A
    .byte $66 ; | XX  XX | $F83B
    .byte $7C ; | XXXXX  | $F83C
    .byte $60 ; | XX     | $F83D
    .byte $62 ; | XX   X | $F83E
    .byte $3C ; |  XXXX  | $F83F
Seven:
    .byte $18 ; |   XX   | $F840
    .byte $18 ; |   XX   | $F841
    .byte $18 ; |   XX   | $F842
    .byte $18 ; |   XX   | $F843
    .byte $0C ; |    XX  | $F844
    .byte $06 ; |     XX | $F845
    .byte $42 ; | X    X | $F846
    .byte $7E ; | XXXXXX | $F847
Eight:
    .byte $3C ; |  XXXX  | $F848
    .byte $66 ; | XX  XX | $F849
    .byte $66 ; | XX  XX | $F84A
    .byte $3C ; |  XXXX  | $F84B
    .byte $3C ; |  XXXX  | $F84C
    .byte $66 ; | XX  XX | $F84D
    .byte $66 ; | XX  XX | $F84E
    .byte $3C ; |  XXXX  | $F84F
Nine:
    .byte $3C ; |  XXXX  | $F850
    .byte $46 ; | X   XX | $F851
    .byte $06 ; |     XX | $F852
    .byte $3E ; |  XXXXX | $F853
    .byte $66 ; | XX  XX | $F854
    .byte $66 ; | XX  XX | $F855
    .byte $66 ; | XX  XX | $F856
    .byte $3C ; |  XXXX  | $F857

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;called from 2 places

LF858 SUBROUTINE
    ldx    #6                    ; 2
LF85A:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LF85A                 ; 2³
    lda    #$20                  ; 2
    jsr    HorizReposition       ; 6
    lda    #$28                  ; 2
    ldx    #1                    ; 2
    jsr    HorizReposition       ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #3                    ; 2   three copies (close)
    sta    NUSIZ0                ; 3
    lda    #1                    ; 2   two copies (close)
    sta    NUSIZ1                ; 3
    lda    #COL_TIME_DISPLAY     ; 2   #$63 in sample copy, #$6B in released version
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    ldy    #7                    ; 2   loop 7+1 times (height of a sprite)
    sty    $96                   ; 3   loop counter
    nop                          ;+2 = @28
    sta    HMCLR                 ; 3

.loopDrawScore:
    ldy    $96                   ; 3
    lda    Zero,Y                ; 4   1's digit, it never changes from a zero
    sta    $97                   ; 3
    sta.w  WSYNC                 ; 4
;---------------------------------------
    nop                          ; 2
    lda    (digitPtrs),Y         ; 5   10,000's digit, blank until you get a 10,000+ score
    sta    GRP0                  ; 3
    lda    (digitPtrs+2),Y       ; 5   1,000's digit
    sta    GRP1                  ; 3
    lda    (digitPtrs+6),Y       ; 5   10's digit
    tax                          ; 2
    lda    (digitPtrs+4),Y       ; 5   100's digit
    ldy    $97                   ; 3
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    sty    GRP0                  ; 3
    ldy    $96                   ; 3
    dec    $96                   ; 5
    bpl    .loopDrawScore        ; 2³

    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF8B3:
    .byte $55 ; | X X X X| $F8B3  frequency, volume
    .byte $55 ; | X X X X| $F8B4
    .byte $55 ; | X X X X| $F8B5
    .byte $55 ; | X X X X| $F8B6
    .byte $55 ; | X X X X| $F8B7
    .byte $55 ; | X X X X| $F8B8
    .byte $15 ; |   X X X| $F8B9
    .byte $95 ; |X  X X X| $F8BA
    .byte $95 ; |X  X X X| $F8BB
    .byte $17 ; |   X XXX| $F8BC
    .byte $15 ; |   X X X| $F8BD
    .byte $13 ; |   X  XX| $F8BE
    .byte $11 ; |   X   X| $F8BF
    .byte $15 ; |   X X X| $F8C0
    .byte $5D ; | X XXX X| $F8C1
    .byte $1D ; |   XXX X| $F8C2
    .byte $9D ; |X  XXX X| $F8C3
    .byte $59 ; | X XX  X| $F8C4
    .byte $59 ; | X XX  X| $F8C5
    .byte $19 ; |   XX  X| $F8C6
    .byte $99 ; |X  XX  X| $F8C7
    .byte $19 ; |   XX  X| $F8C8
    .byte $55 ; | X X X X| $F8C9
    .byte $15 ; |   X X X| $F8CA
    .byte $95 ; |X  X X X| $F8CB
    .byte $15 ; |   X X X| $F8CC
    .byte $11 ; |   X   X| $F8CD
    .byte $0E ; |    XXX | $F8CE
    .byte $0C ; |    XX  | $F8CF
    .byte $0E ; |    XXX | $F8D0
    .byte $4E ; | X  XXX | $F8D1
    .byte $0E ; |    XXX | $F8D2
    .byte $8E ; |X   XXX | $F8D3
    .byte $53 ; | X X  XX| $F8D4
    .byte $53 ; | X X  XX| $F8D5
    .byte $53 ; | X X  XX| $F8D6
    .byte $53 ; | X X  XX| $F8D7
    .byte $53 ; | X X  XX| $F8D8
    .byte $13 ; |   X  XX| $F8D9
    .byte $93 ; |X  X  XX| $F8DA
    .byte $93 ; |X  X  XX| $F8DB
    .byte $11 ; |   X   X| $F8DC
    .byte $0F ; |    XXXX| $F8DD
    .byte $11 ; |   X   X| $F8DE
    .byte $0E ; |    XXX | $F8DF
    .byte $0C ; |    XX  | $F8E0
    .byte $4C ; | X  XX  | $F8E1
    .byte $0C ; |    XX  | $F8E2
    .byte $8C ; |X   XX  | $F8E3
    .byte $4E ; | X  XXX | $F8E4
    .byte $4E ; | X  XXX | $F8E5
    .byte $0E ; |    XXX | $F8E6
    .byte $8E ; |X   XXX | $F8E7
    .byte $51 ; | X X   X| $F8E8
    .byte $51 ; | X X   X| $F8E9
    .byte $11 ; |   X   X| $F8EA
    .byte $91 ; |X  X   X| $F8EB
    .byte $13 ; |   X  XX| $F8EC
    .byte $0F ; |    XXXX| $F8ED
    .byte $11 ; |   X   X| $F8EE
    .byte $13 ; |   X  XX| $F8EF
    .byte $13 ; |   X  XX| $F8F0
    .byte $53 ; | X X  XX| $F8F1
    .byte $13 ; |   X  XX| $F8F2
    .byte $93 ; |X  X  XX| $F8F3
    .byte $55 ; | X X X X| $F8F4
    .byte $55 ; | X X X X| $F8F5
    .byte $55 ; | X X X X| $F8F6
    .byte $55 ; | X X X X| $F8F7
    .byte $55 ; | X X X X| $F8F8
    .byte $15 ; |   X X X| $F8F9
    .byte $95 ; |X  X X X| $F8FA
    .byte $95 ; |X  X X X| $F8FB
    .byte $17 ; |   X XXX| $F8FC
    .byte $15 ; |   X X X| $F8FD
    .byte $13 ; |   X  XX| $F8FE
    .byte $11 ; |   X   X| $F8FF
    .byte $15 ; |   X X X| $F900
    .byte $5D ; | X XXX X| $F901
    .byte $1D ; |   XXX X| $F902
    .byte $9D ; |X  XXX X| $F903
    .byte $59 ; | X XX  X| $F904
    .byte $59 ; | X XX  X| $F905
    .byte $19 ; |   XX  X| $F906
    .byte $99 ; |X  XX  X| $F907
    .byte $19 ; |   XX  X| $F908
    .byte $55 ; | X X X X| $F909
    .byte $15 ; |   X X X| $F90A
    .byte $95 ; |X  X X X| $F90B
    .byte $15 ; |   X X X| $F90C
    .byte $11 ; |   X   X| $F90D
    .byte $0E ; |    XXX | $F90E
    .byte $0C ; |    XX  | $F90F
    .byte $0E ; |    XXX | $F910
    .byte $4E ; | X  XXX | $F911
    .byte $0E ; |    XXX | $F912
    .byte $8E ; |X   XXX | $F913
    .byte $53 ; | X X  XX| $F914
    .byte $53 ; | X X  XX| $F915
    .byte $53 ; | X X  XX| $F916
    .byte $53 ; | X X  XX| $F917
    .byte $53 ; | X X  XX| $F918
    .byte $13 ; |   X  XX| $F919
    .byte $93 ; |X  X  XX| $F91A
    .byte $93 ; |X  X  XX| $F91B
    .byte $11 ; |   X   X| $F91C
    .byte $0E ; |    XXX | $F91D
    .byte $15 ; |   X X X| $F91E
    .byte $11 ; |   X   X| $F91F
    .byte $15 ; |   X X X| $F920
    .byte $5D ; | X XXX X| $F921
    .byte $1D ; |   XXX X| $F922
    .byte $9D ; |X  XXX X| $F923
    .byte $59 ; | X XX  X| $F924
    .byte $59 ; | X XX  X| $F925
    .byte $19 ; |   XX  X| $F926
    .byte $99 ; |X  XX  X| $F927
    .byte $19 ; |   XX  X| $F928
    .byte $55 ; | X X X X| $F929
    .byte $15 ; |   X X X| $F92A
    .byte $95 ; |X  X X X| $F92B
    .byte $15 ; |   X X X| $F92C
    .byte $11 ; |   X   X| $F92D
    .byte $0E ; |    XXX | $F92E
    .byte $0C ; |    XX  | $F92F
    .byte $0E ; |    XXX | $F930
    .byte $4E ; | X  XXX | $F931
    .byte $0E ; |    XXX | $F932
    .byte $8E ; |X   XXX | $F933

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;called from 1 place

LF934 SUBROUTINE
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    sta    $9F                   ; 3
    lda    #$C0                  ; 2
    sta    bridgeGfxPtr          ; 3
    lda    #$98                  ; 2
    ldx    #3                    ; 2
    sta    HMCLR                 ; 3
    jsr    HorizReposition       ; 6
    ldy    #$70                  ; 2
    lda    #$0F                  ; 2
    sta    $96                   ; 3
    sta    ENAM1                 ; 3
LF94F:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$60                  ; 2
    sta    HMM1                  ; 3
    lda    #0                    ; 2
    sta    COLUP1                ; 3
    lda    $C2                   ; 3
    adc    #$12                  ; 2
    sta    $C2                   ; 3
    bcc    LF968                 ; 2³
    lda    LFE72,Y               ; 4
    sta    COLUP1                ; 3
LF968:
    lda    (digitPtrs+6),Y       ; 5
    sta    PF2                   ; 3
    sta    PF1                   ; 3
    sta    PF0                   ; 3
    dey                          ; 2
    bpl    LF94F                 ; 2³
    ldy    #0                    ; 2
    sty    PF0                   ; 3
LF977:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    ENAM1                 ; 3
    lda    $9F                   ; 3
    cmp    #$14                  ; 2
    bcs    LF989                 ; 2³
    bcc    LF98D                 ; 3   always branch

LF989:
    ldy    #$CA                  ; 2
    sty    COLUBK                ; 3
LF98D:
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LFCC9,Y               ; 4
    sta    COLUPF                ; 3
    lda    LFCAD,Y               ; 4
    sta    PF1                   ; 3
    lda    LFCBB,Y               ; 4
    sta    PF2                   ; 3
    lda    $9F                   ; 3
    cmp    #$1C                  ; 2
    beq    LF9A9                 ; 2³
    inc    $9F                   ; 5
    bne    LF977                 ; 2³
LF9A9:
    sta    HMCLR                 ; 3
LF9AB:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    $9F                   ; 3
    cmp    #$2C                  ; 2
    beq    LF9DA                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    ldy    $96                   ; 3
    lda    BobbyColorTab,Y       ; 4
    sta    COLUP0                ; 3
    lda    (bobbyGfxPtr),Y       ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bmi    LF9CC                 ; 2³
    dec    $96                   ; 5
LF9CC:
    lda    LFCAD,X               ; 4
    sta    PF1                   ; 3
    lda    LFCBB,X               ; 4
    sta    PF2                   ; 3
    inc    $9F                   ; 5
    bne    LF9AB                 ; 2³
LF9DA:
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #7                    ; 2
    sta    CTRLPF                ; 3
    sta    COLUPF                ; 3
    ldy    #0                    ; 2
LF9E6:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (bridgeGfxPtr),Y      ; 5
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$B6                  ; 2
    sta    COLUBK                ; 3
    iny                          ; 2
    cpy    #8                    ; 2
    bne    LF9E6                 ; 2³
    lda    #$80                  ; 2
    sta    $A8                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $FA00

BobbyWalk1:
    .byte $00 ; |        | $FA00
    .byte $77 ; | XXX XXX| $FA01
    .byte $6E ; | XX XXX | $FA02
    .byte $7C ; | XXXXX  | $FA03
    .byte $FF ; |XXXXXXXX| $FA04
    .byte $CF ; |XX  XXXX| $FA05
    .byte $76 ; | XXX XX | $FA06
    .byte $3C ; |  XXXX  | $FA07
    .byte $18 ; |   XX   | $FA08
    .byte $3C ; |  XXXX  | $FA09
    .byte $7E ; | XXXXXX | $FA0A
    .byte $77 ; | XXX XXX| $FA0B
    .byte $3E ; |  XXXXX | $FA0C
    .byte $78 ; | XXXX   | $FA0D
    .byte $60 ; | XX     | $FA0E
    .byte $80 ; |X       | $FA0F
BobbyWalk2:
    .byte $00 ; |        | $FA10
    .byte $1C ; |   XXX  | $FA11
    .byte $38 ; |  XXX   | $FA12
    .byte $3C ; |  XXXX  | $FA13
    .byte $7E ; | XXXXXX | $FA14
    .byte $E7 ; |XXX  XXX| $FA15
    .byte $6E ; | XX XXX | $FA16
    .byte $3C ; |  XXXX  | $FA17
    .byte $18 ; |   XX   | $FA18
    .byte $3C ; |  XXXX  | $FA19
    .byte $7E ; | XXXXXX | $FA1A
    .byte $77 ; | XXX XXX| $FA1B
    .byte $3E ; |  XXXXX | $FA1C
    .byte $78 ; | XXXX   | $FA1D
    .byte $60 ; | XX     | $FA1E
    .byte $80 ; |X       | $FA1F
BobbyWalk3:
    .byte $00 ; |        | $FA20
    .byte $3B ; |  XXX XX| $FA21
    .byte $37 ; |  XX XXX| $FA22
    .byte $7E ; | XXXXXX | $FA23
    .byte $7E ; | XXXXXX | $FA24
    .byte $F3 ; |XXXX  XX| $FA25
    .byte $6E ; | XX XXX | $FA26
    .byte $3C ; |  XXXX  | $FA27
    .byte $18 ; |   XX   | $FA28
    .byte $3C ; |  XXXX  | $FA29
    .byte $7E ; | XXXXXX | $FA2A
    .byte $77 ; | XXX XXX| $FA2B
    .byte $3E ; |  XXXXX | $FA2C
    .byte $78 ; | XXXX   | $FA2D
    .byte $60 ; | XX     | $FA2E
    .byte $80 ; |X       | $FA2F
BobbyWalk4:
    .byte $00 ; |        | $FA30
    .byte $C7 ; |XX   XXX| $FA31
    .byte $EE ; |XXX XXX | $FA32
    .byte $7E ; | XXXXXX | $FA33
    .byte $7E ; | XXXXXX | $FA34
    .byte $E7 ; |XXX  XXX| $FA35
    .byte $76 ; | XXX XX | $FA36
    .byte $3C ; |  XXXX  | $FA37
    .byte $18 ; |   XX   | $FA38
    .byte $3C ; |  XXXX  | $FA39
    .byte $7E ; | XXXXXX | $FA3A
    .byte $77 ; | XXX XXX| $FA3B
    .byte $3E ; |  XXXXX | $FA3C
    .byte $78 ; | XXXX   | $FA3D
    .byte $60 ; | XX     | $FA3E
    .byte $80 ; |X       | $FA3F

  IF SAMPLE_COPY

BobbyJumping:
    .byte $00 ; |        | $FA40
    .byte $80 ; |X       | $FA41
    .byte $C7 ; |XX   XXX| $FA42
    .byte $66 ; | XX  XX | $FA43
    .byte $7E ; | XXXXXX | $FA44
    .byte $FF ; |XXXXXXXX| $FA45  different here
    .byte $66 ; | XX  XX | $FA46  different here
    .byte $3C ; |  XXXX  | $FA47
    .byte $18 ; |   XX   | $FA48
    .byte $3C ; |  XXXX  | $FA49
    .byte $7E ; | XXXXXX | $FA4A
    .byte $77 ; | XXX XXX| $FA4B
    .byte $3E ; |  XXXXX | $FA4C
    .byte $7E ; | XXXXXX | $FA4D
    .byte $7E ; | XXXXXX | $FA4E  different here
    .byte $C0 ; |XX      | $FA4F

  ELSE RELEASED_VERSION

BobbyJumping:
    .byte $00 ; |        | $FA40
    .byte $80 ; |X       | $FA41
    .byte $C7 ; |XX   XXX| $FA42
    .byte $66 ; | XX  XX | $FA43
    .byte $7E ; | XXXXXX | $FA44
    .byte $0F ; |    XXXX| $FA45  different here
    .byte $76 ; | XXX XX | $FA46  different here
    .byte $3C ; |  XXXX  | $FA47
    .byte $18 ; |   XX   | $FA48
    .byte $3C ; |  XXXX  | $FA49
    .byte $7E ; | XXXXXX | $FA4A
    .byte $77 ; | XXX XXX| $FA4B
    .byte $3E ; |  XXXXX | $FA4C
    .byte $7E ; | XXXXXX | $FA4D
    .byte $7C ; | XXXXX  | $FA4E  different here
    .byte $C0 ; |XX      | $FA4F
  ENDIF

BobbyDead:
    .byte $00 ; |        | $FA50
    .byte $07 ; |     XXX| $FA51
    .byte $1E ; |   XXXX | $FA52
    .byte $38 ; |  XXX   | $FA53
    .byte $7E ; | XXXXXX | $FA54
    .byte $FF ; |XXXXXXXX| $FA55
    .byte $79 ; | XXXX  X| $FA56
    .byte $38 ; |  XXX   | $FA57
    .byte $18 ; |   XX   | $FA58
    .byte $7C ; | XXXXX  | $FA59
    .byte $FE ; |XXXXXXX | $FA5A
    .byte $F7 ; |XXXX XXX| $FA5B
    .byte $7E ; | XXXXXX | $FA5C
    .byte $7E ; | XXXXXX | $FA5D
    .byte $7C ; | XXXXX  | $FA5E
    .byte $C0 ; |XX      | $FA5F
BobbySinking:
    .byte $00 ; |        | $FA60
    .byte $7C ; | XXXXX  | $FA61
    .byte $7C ; | XXXXX  | $FA62
    .byte $7C ; | XXXXX  | $FA63
    .byte $7C ; | XXXXX  | $FA64
    .byte $7C ; | XXXXX  | $FA65
    .byte $7C ; | XXXXX  | $FA66
    .byte $7C ; | XXXXX  | $FA67
    .byte $7C ; | XXXXX  | $FA68
    .byte $7E ; | XXXXXX | $FA69
    .byte $B1 ; |X XX   X| $FA6A
    .byte $7C ; | XXXXX  | $FA6B
    .byte $6E ; | XX XXX | $FA6C
    .byte $3C ; |  XXXX  | $FA6D
    .byte $30 ; |  XX    | $FA6E
    .byte $40 ; | X      | $FA6F

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;called from 1 place

LFA70 SUBROUTINE
    lda    #0                    ; 2   clear...
    sta    screenCounter         ; 3   - reset to first screen
    sta    scoreBCD+1            ; 3   - blank the 10's digit of BCD score
    sta    $BB                   ; 3
    sta    $C4                   ; 3
    sta    $C5                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $FF ; |XXXXXXXX| $FA7D
    .byte $FF ; |XXXXXXXX| $FA7E
    .byte $FF ; |XXXXXXXX| $FA7F
BridgeOne:
    .byte $FF ; |XXXXXXXX| $FA80
    .byte $FF ; |XXXXXXXX| $FA81
    .byte $1F ; |   XXXXX| $FA82
    .byte $0F ; |    XXXX| $FA83
    .byte $07 ; |     XXX| $FA84
    .byte $07 ; |     XXX| $FA85
    .byte $03 ; |      XX| $FA86
    .byte $03 ; |      XX| $FA87
BridgeTwo:
    .byte $3F ; |  XXXXXX| $FA88
    .byte $1F ; |   XXXXX| $FA89
    .byte $1F ; |   XXXXX| $FA8A
    .byte $07 ; |     XXX| $FA8B
    .byte $07 ; |     XXX| $FA8C
    .byte $03 ; |      XX| $FA8D
    .byte $03 ; |      XX| $FA8E
    .byte $03 ; |      XX| $FA8F
BridgeThree:
    .byte $1F ; |   XXXXX| $FA90
    .byte $0F ; |    XXXX| $FA91
    .byte $07 ; |     XXX| $FA92
    .byte $07 ; |     XXX| $FA93
    .byte $03 ; |      XX| $FA94
    .byte $03 ; |      XX| $FA95
    .byte $03 ; |      XX| $FA96
    .byte $03 ; |      XX| $FA97
BridgeFour:
    .byte $0F ; |    XXXX| $FA98
    .byte $0F ; |    XXXX| $FA99
    .byte $07 ; |     XXX| $FA9A
    .byte $03 ; |      XX| $FA9B
    .byte $03 ; |      XX| $FA9C
    .byte $03 ; |      XX| $FA9D
    .byte $03 ; |      XX| $FA9E
    .byte $03 ; |      XX| $FA9F
BridgeFive:
    .byte $07 ; |     XXX| $FAA0
    .byte $07 ; |     XXX| $FAA1
    .byte $07 ; |     XXX| $FAA2
    .byte $03 ; |      XX| $FAA3
    .byte $03 ; |      XX| $FAA4
    .byte $03 ; |      XX| $FAA5
    .byte $03 ; |      XX| $FAA6
    .byte $03 ; |      XX| $FAA7
BridgeSix:
    .byte $1F ; |   XXXXX| $FAA8
    .byte $0F ; |    XXXX| $FAA9
    .byte $07 ; |     XXX| $FAAA
    .byte $07 ; |     XXX| $FAAB
    .byte $03 ; |      XX| $FAAC
    .byte $03 ; |      XX| $FAAD
    .byte $03 ; |      XX| $FAAE
    .byte $03 ; |      XX| $FAAF
BridgeSeven:
    .byte $E3 ; |XXX   XX| $FAB0
    .byte $E3 ; |XXX   XX| $FAB1
    .byte $C1 ; |XX     X| $FAB2
    .byte $FF ; |XXXXXXXX| $FAB3
    .byte $FF ; |XXXXXXXX| $FAB4
    .byte $7F ; | XXXXXXX| $FAB5
    .byte $3F ; |  XXXXXX| $FAB6
    .byte $0F ; |    XXXX| $FAB7
BridgeEight:
    .byte $C7 ; |XX   XXX| $FAB8
    .byte $C7 ; |XX   XXX| $FAB9
    .byte $73 ; | XXX  XX| $FABA
    .byte $3F ; |  XXXXXX| $FABB
    .byte $9F ; |X  XXXXX| $FABC
    .byte $3F ; |  XXXXXX| $FABD
    .byte $63 ; | XX   XX| $FABE
    .byte $E3 ; |XXX   XX| $FABF
BridgeNine:
    .byte $FF ; |XXXXXXXX| $FAC0
    .byte $FF ; |XXXXXXXX| $FAC1
    .byte $EF ; |XXX XXXX| $FAC2
    .byte $C7 ; |XX   XXX| $FAC3
    .byte $83 ; |X     XX| $FAC4
    .byte $83 ; |X     XX| $FAC5
    .byte $83 ; |X     XX| $FAC6
    .byte $83 ; |X     XX| $FAC7
BridgeTen:
    .byte $FF ; |XXXXXXXX| $FAC8
    .byte $E7 ; |XXX  XXX| $FAC9
    .byte $01 ; |       X| $FACA
    .byte $E7 ; |XXX  XXX| $FACB
    .byte $81 ; |X      X| $FACC
    .byte $99 ; |X  XX  X| $FACD
    .byte $81 ; |X      X| $FACE
    .byte $C3 ; |XX    XX| $FACF
BridgeEleven:
    .byte $3C ; |  XXXX  | $FAD0
    .byte $3C ; |  XXXX  | $FAD1
    .byte $1C ; |   XXX  | $FAD2
    .byte $0F ; |    XXXX| $FAD3
    .byte $87 ; |X    XXX| $FAD4
    .byte $C7 ; |XX   XXX| $FAD5
    .byte $E7 ; |XXX  XXX| $FAD6
    .byte $FF ; |XXXXXXXX| $FAD7
BridgeTwelve:
    .byte $31 ; |  XX   X| $FAD8
    .byte $31 ; |  XX   X| $FAD9
    .byte $3F ; |  XXXXXX| $FADA
    .byte $FF ; |XXXXXXXX| $FADB
    .byte $DD ; |XX XXX X| $FADC
    .byte $AA ; |X X X X | $FADD
    .byte $DD ; |XX XXX X| $FADE
    .byte $AA ; |X X X X | $FADF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DoVsyncPeriod SUBROUTINE
    lda    #$82                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3   start Vblank
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3   3 buffer lines before Vsync
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3   3 lines of Vsync
;---------------------------------------
    lda    #0                    ; 2
    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3   4 buffer lines after Vsync
;---------------------------------------
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;a typical score:   1 6 5 4 0
;                   | | | | |
;                   | | | | 1's digit always remains zero, so it's not calculated
;                   | | | |
;                   | | | 10's digit
;                   | | |
;                   | | 100's digit
;                   | |
;                   | 1,000's digit
;                   |
;                   10,000's digit


GetScorePointers SUBROUTINE
    ldx    #1                    ; 2   loop 1+1 times, to do top 4 numbers
    ldy    #4                    ; 2   this offset skips over the top 2 numbers on the first loop
.loopGetScorePtrs
    lda    $80,X                 ; 4   do for the $81 and $80 registers...
    and    #$F0                  ; 2   keep only the high nibble,
    lsr                          ; 2   then divide by 2 and add 8,
    adc    #8                    ; 2   to and get low pointers (100's digit and 10,000's digit)
    sta.wy digitPtrs,Y           ; 5
    lda    $80,X                 ; 4
    and    #$0F                  ; 2   keep only the low nibble,
    asl                          ; 2
    asl                          ; 2   then multiply by 8 and add 8,
    asl                          ; 2
    adc    #8                    ; 2
    sta.wy digitPtrs+2,Y         ; 5   to get low pointers (10's digit and 1,000's digit)
    lda    #>Numbers             ; 2   high nibble for number pointers
    sta.wy digitPtrs+1,Y         ; 5
    sta.wy digitPtrs+3,Y         ; 5
    dey                          ; 2   get rid of offset for the second loop
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    dex                          ; 2
    bpl    .loopGetScorePtrs     ; 2³

;this bit of code blanks preceding zeros of the score,
;i.e. "00540" would be displayed as only "540"

    ldx    #0                    ; 2   the offset starts with the left most number
.loopBlankPrecedingZeros:
    lda.wx digitPtrs,X           ; 4   get the low pointer, and subtract 8 (height of a sprite), if it is a zero then
    eor    #$08                  ; 2   it becomes the blank digit, because the "blank digit" is right above "zero" in the gfx table
    bne    LFB3B                 ; 2³  as soon as a number other then zero appears, then the loop is exited...
    sta    digitPtrs,X           ; 4   only blank digits are stored
    inx                          ; 2   jump two registers to the next 2 byte pointer
    inx                          ; 2
    cpx    #8                    ; 2   blank up to all 4 top digits, but the 1's digit always remains as zero
    bcc    .loopBlankPrecedingZeros ; 2³
LFB3B:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;called from 1 place

LFB3C SUBROUTINE
    stx    $97                   ; 3
    ldy    $A6,X                 ; 4
    lda    LFB82,Y               ; 4
    sta    $96                   ; 3
    ldy    $86,X                 ; 4
    cpy    $96                   ; 3
    bcs    LFB52                 ; 2³
    cpy    #$88                  ; 2
    bcs    LFB57                 ; 2³
    iny                          ; 2
    bne    LFB57                 ; 3   always branch

LFB52:
    cpy    #8                    ; 2
    bcc    LFB57                 ; 2³
    dey                          ; 2
LFB57:
    sty    $86,X                 ; 4
    lda    UpperLimitTab,X       ; 4
    sta    temp5                 ; 3
    lda    LowerLimitTab,X       ; 4
    sta    temp5+1               ; 3
    lda    $96                   ; 3
    and    #$3F                  ; 2
    sta    $96                   ; 3
    ldy    $88,X                 ; 4
    cpy    $96                   ; 3
    bcs    LFB76                 ; 2³
    cpy    temp5                 ; 3
    bcs    LFB7B                 ; 2³
    iny                          ; 2   move up
    bne    LFB7B                 ; 2³
LFB76:
    cpy    temp5+1               ; 3
    bcc    LFB7B                 ; 2³
    dey                          ; 2   move down
LFB7B:
    sty    $88,X                 ; 4
    rts                          ; 6

;these tables are moved to a different location in the released version

  IF SAMPLE_COPY
UpperLimitTab:
    .byte $30 ; |  XX    | top sky object      sta $9A
    .byte $44 ; | X   X  | low sky object
LowerLimitTab:
    .byte $0C ; |    XX  | top sky object       sta $9B
    .byte $17 ; |   X XXX| low sky object
  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFB82:
    .byte $3C ; |  XXXX  | $FB82  sta $96
    .byte $2F ; |  X XXXX| $FB83
    .byte $26 ; |  X  XX | $FB84
    .byte $12 ; |   X  X | $FB85
    .byte $20 ; |  X     | $FB86
    .byte $3C ; |  XXXX  | $FB87
    .byte $24 ; |  X  X  | $FB88
    .byte $4F ; | X  XXXX| $FB89
    .byte $36 ; |  XX XX | $FB8A
    .byte $20 ; |  X     | $FB8B
    .byte $3F ; |  XXXXXX| $FB8C
    .byte $4F ; | X  XXXX| $FB8D
    .byte $59 ; | X XX  X| $FB8E
    .byte $65 ; | XX  X X| $FB8F
    .byte $78 ; | XXXX   | $FB90
    .byte $63 ; | XX   XX| $FB91
    .byte $57 ; | X X XXX| $FB92
    .byte $68 ; | XX X   | $FB93
    .byte $7C ; | XXXXX  | $FB94
    .byte $8F ; |X   XXXX| $FB95
    .byte $78 ; | XXXX   | $FB96
    .byte $6A ; | XX X X | $FB97
    .byte $5F ; | X XXXXX| $FB98
    .byte $51 ; | X X   X| $FB99
    .byte $61 ; | XX    X| $FB9A
    .byte $58 ; | X XX   | $FB9B
    .byte $4F ; | X  XXXX| $FB9C
    .byte $38 ; |  XXX   | $FB9D
    .byte $3F ; |  XXXXXX| $FB9E
    .byte $26 ; |  X  XX | $FB9F
    .byte $2F ; |  X XXXX| $FBA0
    .byte $49 ; | X  X  X| $FBA1
    .byte $28 ; |  X X   | $FBA2
    .byte $1F ; |   XXXXX| $FBA3
    .byte $28 ; |  X X   | $FBA4
    .byte $0F ; |    XXXX| $FBA5
    .byte $77 ; | XXX XXX| $FBA6
    .byte $2F ; |  X XXXX| $FBA7
    .byte $77 ; | XXX XXX| $FBA8
    .byte $1F ; |   XXXXX| $FBA9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;called from 1 place

DrawSkyUntilHillTops SUBROUTINE
    lda    #0                    ; 2
    sta    $96                   ; 3
    lda    #$30                  ; 2   48+1 scanlines
    sta    $9F                   ; 3

.loopDrawTopSky:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $9F                   ; 3
    cmp    vPosTopSkyObj         ; 3   is it time to draw the Top Sky Object?
    bne    .skipSpriteStart      ; 2³  - no, branch
    lda    #$0A                  ; 2   - yes, load the height of the sprite,
    sta    $96                   ; 3   and use it to index the graphics for the sprite
.skipSpriteStart:
    ldy    $96                   ; 3   when this is at zero the bottom BLANK line of the sprite is drawn to "show nothing"
    lda    (gpObjPtr1),Y         ; 5   draw the top sky object (big bird, high cloud, etc...)
    sta    GRP1                  ; 3
    dey                          ; 2   did the sprite gfx index roll over from 0 to 255?
    bmi    .indexRemainsAtZero   ; 2³  - yes, so don't save it
    dec    $96                   ; 5   - no, object is really being drawn, so the index decreases by one
.indexRemainsAtZero:
    dec    $9F                   ; 5
    bpl    .loopDrawTopSky       ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;called from 4 places

LFBCE SUBROUTINE
    lda    #0                    ; 2   clear...
    sta    $A1                   ; 3
    sta    $98                   ; 3
    sta    $99                   ; 3
    lda    screenCounter         ; 3
    and    #$03                  ; 2
    cmp    #2                    ; 2
    bne    LFBE6                 ; 2³
    lda    #0                    ; 2
    sta    $B6                   ; 3
    lda    #$98                  ; 2
    sta    $85                   ; 3
LFBE6:
    lda    numOfLives            ; 3
    beq    LFBEE                 ; 2³
    dec    numOfLives            ; 5
    beq    LFC03                 ; 2³+1
LFBEE:
    lda    #$0F                  ; 2
    sta    vPosBobby             ; 3
    lda    #8                    ; 2
    sta    hPosBobby             ; 3
    lda    #<BobbyWalk1          ; 2
    sta    bobbyGfxPtr           ; 3
    sed                          ; 2
    lda    scoreBCD              ; 3
    clc                          ; 2
    adc    #1                    ; 2   add 1,000 points for "encouragement" when you die
    sta    scoreBCD              ; 3
    cld                          ; 2
LFC03:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;called from 1 place

LFC04 SUBROUTINE
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    ldy    #0                    ; 2
LFC0A:
    tya                          ; 2
    lsr                          ; 2
    tax                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    temp5                 ; 3
    sta    COLUPF                ; 3
    lda    LFC83,X               ; 4
    sta    PF0                   ; 3
    lda    Train,X               ; 4
    sta    PF1                   ; 3
    lda    LFC9F,X               ; 4
    sta    PF2                   ; 3
    lda    LFCBB,X               ; 4
    sta    $97                   ; 3
    lda    LFCC9,X               ; 4
    sta    COLUPF                ; 3
    lda    LFCAD,X               ; 4
    sta    PF2                   ; 3
    lda    $97                   ; 3
    sta    PF1                   ; 3
    iny                          ; 2
    cpy    #$1D                  ; 2
    bcc    LFC0A                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

HillsOne:
    .byte $00 ; |        | $FC3B  PF0
    .byte $00 ; |        | $FC3C
    .byte $00 ; |        | $FC3D
    .byte $00 ; |        | $FC3E
    .byte $00 ; |        | $FC3F
    .byte $80 ; |X       | $FC40
    .byte $C0 ; |XX      | $FC41
    .byte $E0 ; |XXX     | $FC42
    .byte $F0 ; |XXXX    | $FC43
    .byte $F0 ; |XXXX    | $FC44
    .byte $F0 ; |XXXX    | $FC45
    .byte $F0 ; |XXXX    | $FC46
    .byte $F0 ; |XXXX    | $FC47
    .byte $F0 ; |XXXX    | $FC48
HillsTwo:
    .byte $00 ; |        | $FC49  PF1
    .byte $00 ; |        | $FC4A
    .byte $00 ; |        | $FC4B
    .byte $00 ; |        | $FC4C
    .byte $10 ; |   X    | $FC4D
    .byte $38 ; |  XXX   | $FC4E
    .byte $7C ; | XXXXX  | $FC4F
    .byte $FE ; |XXXXXXX | $FC50
    .byte $FF ; |XXXXXXXX| $FC51
    .byte $FF ; |XXXXXXXX| $FC52
    .byte $FF ; |XXXXXXXX| $FC53
    .byte $E7 ; |XXX  XXX| $FC54
    .byte $F2 ; |XXXX  X | $FC55
    .byte $00 ; |        | $FC56
HillsThree:
    .byte $00 ; |        | $FC57  PF2
    .byte $00 ; |        | $FC58
    .byte $00 ; |        | $FC59
    .byte $00 ; |        | $FC5A
    .byte $00 ; |        | $FC5B
    .byte $00 ; |        | $FC5C
    .byte $00 ; |        | $FC5D
    .byte $03 ; |      XX| $FC5E
    .byte $0F ; |    XXXX| $FC5F
    .byte $1F ; |   XXXXX| $FC60
    .byte $3F ; |  XXXXXX| $FC61
    .byte $7F ; | XXXXXXX| $FC62
    .byte $FF ; |XXXXXXXX| $FC63
    .byte $00 ; |        | $FC64
HillsFour:
    .byte $00 ; |        | $FC65  PF1
    .byte $20 ; |  X     | $FC66
    .byte $70 ; | XXX    | $FC67
    .byte $F8 ; |XXXXX   | $FC68
    .byte $FE ; |XXXXXXX | $FC69
    .byte $FF ; |XXXXXXXX| $FC6A
    .byte $FF ; |XXXXXXXX| $FC6B
    .byte $FF ; |XXXXXXXX| $FC6C
    .byte $FF ; |XXXXXXXX| $FC6D
    .byte $FF ; |XXXXXXXX| $FC6E
    .byte $F9 ; |XXXXX  X| $FC6F
    .byte $80 ; |X       | $FC70
    .byte $00 ; |        | $FC71
    .byte $00 ; |        | $FC72

BobbyColorTab:
    .byte  LIGHT_TAN     ; $FC73
    .byte  LIGHT_TAN     ; $FC74
    .byte  LIGHT_TAN     ; $FC75
    .byte  LIGHT_TAN     ; $FC76   legs
    .byte  BLACK         ; $FC77
    .byte  BLACK         ; $FC78
    .byte  BLACK         ; $FC79
    .byte  BLACK         ; $FC7A   chest
    .byte  LIGHT_TAN     ; $FC7B
    .byte  LIGHT_TAN     ; $FC7C
    .byte  LIGHT_TAN     ; $FC7D
    .byte  LIGHT_TAN     ; $FC7E   head
    .byte  BLACK         ; $FC7F
    .byte  BLACK         ; $FC80
    .byte  BLACK         ; $FC81
    .byte  BLACK         ; $FC82   top of hat
LFC83:
    .byte $00 ; |        | $FC83  PF0
    .byte $00 ; |        | $FC84
    .byte $00 ; |        | $FC85
    .byte $00 ; |        | $FC86
    .byte $00 ; |        | $FC87
    .byte $00 ; |        | $FC88
    .byte $00 ; |        | $FC89
    .byte $00 ; |        | $FC8A
    .byte $70 ; | XXX    | $FC8B
    .byte $70 ; | XXX    | $FC8C
    .byte $70 ; | XXX    | $FC8D
    .byte $F0 ; |XXXX    | $FC8E
    .byte $70 ; | XXX    | $FC8F
    .byte $20 ; |  X     | $FC90
Train:
    .byte $00 ; |        | $FC91  PF1
    .byte $00 ; |        | $FC92
    .byte $30 ; |  XX    | $FC93
    .byte $03 ; |      XX| $FC94
    .byte $01 ; |       X| $FC95
    .byte $00 ; |        | $FC96
    .byte $01 ; |       X| $FC97
    .byte $01 ; |       X| $FC98
    .byte $FF ; |XXXXXXXX| $FC99
    .byte $AA ; |X X X X | $FC9A
    .byte $FF ; |XXXXXXXX| $FC9B
    .byte $FF ; |XXXXXXXX| $FC9C
    .byte $FF ; |XXXXXXXX| $FC9D
    .byte $49 ; | X  X  X| $FC9E
LFC9F:
    .byte $00 ; |        | $FC9F  PF2
    .byte $00 ; |        | $FCA0
    .byte $00 ; |        | $FCA1
    .byte $00 ; |        | $FCA2
    .byte $01 ; |       X| $FCA3
    .byte $00 ; |        | $FCA4
    .byte $01 ; |       X| $FCA5
    .byte $01 ; |       X| $FCA6
    .byte $03 ; |      XX| $FCA7
    .byte $03 ; |      XX| $FCA8
    .byte $03 ; |      XX| $FCA9
    .byte $03 ; |      XX| $FCAA
    .byte $01 ; |       X| $FCAB
    .byte $FC ; |XXXXXX  | $FCAC
LFCAD:
    .byte $00 ; |        | $FCAD  PF1, PF2
    .byte $00 ; |        | $FCAE
    .byte $05 ; |     X X| $FCAF
    .byte $0F ; |    XXXX| $FCB0
    .byte $07 ; |     XXX| $FCB1
    .byte $07 ; |     XXX| $FCB2
    .byte $07 ; |     XXX| $FCB3
    .byte $07 ; |     XXX| $FCB4
    .byte $07 ; |     XXX| $FCB5
    .byte $07 ; |     XXX| $FCB6
    .byte $07 ; |     XXX| $FCB7
    .byte $0D ; |    XX X| $FCB8
    .byte $0E ; |    XXX | $FCB9
    .byte $FF ; |XXXXXXXX| $FCBA
LFCBB:
    .byte $06 ; |     XX | $FCBB  PF2, sta $97
    .byte $0F ; |    XXXX| $FCBC
    .byte $5F ; | X XXXXX| $FCBD
    .byte $FF ; |XXXXXXXX| $FCBE
    .byte $74 ; | XXX X  | $FCBF
    .byte $74 ; | XXX X  | $FCC0
    .byte $7F ; | XXXXXXX| $FCC1
    .byte $74 ; | XXX X  | $FCC2
    .byte $74 ; | XXX X  | $FCC3
    .byte $74 ; | XXX X  | $FCC4
    .byte $7F ; | XXXXXXX| $FCC5
    .byte $EA ; |XXX X X | $FCC6
    .byte $F7 ; |XXXX XXX| $FCC7
    .byte $FF ; |XXXXXXXX| $FCC8
LFCC9:
    .byte $65 ; | XX  X X| $FCC9  COLUPF
    .byte $65 ; | XX  X X| $FCCA
    .byte $65 ; | XX  X X| $FCCB
    .byte $65 ; | XX  X X| $FCCC
    .byte $00 ; |        | $FCCD
    .byte $00 ; |        | $FCCE
    .byte $00 ; |        | $FCCF
    .byte $00 ; |        | $FCD0
    .byte $00 ; |        | $FCD1
    .byte $00 ; |        | $FCD2
    .byte $00 ; |        | $FCD3
    .byte $D3 ; |XX X  XX| $FCD4
    .byte $D3 ; |XX X  XX| $FCD5
    .byte $D3 ; |XX X  XX| $FCD6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;called from 1 place

DrawLivesLogo SUBROUTINE

  IF SAMPLE_COPY
    lda    #$40                  ; 2
    ldx    #0                    ; 2
    jsr    HorizReposition       ; 6
    ldy    screenCounter         ; 3
    lda    LF581,Y               ; 4  get color
    sta    COLUBK                ; 3
    lda    #0                    ; 2
    sta    PF0                   ; 3  clear shapes
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #0                    ; 2
    sta    $96                   ; 3
    lda    #$48                  ; 2
    ldx    #1                    ; 2
    jsr    HorizReposition       ; 6
    clc                          ; 2
    lda    $96                   ; 3
    ldx    #0                    ; 2
LFCFD:
    sta    digitPtrs,X           ; 4  F800, F809, F812
    adc    #9                    ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #8                    ; 2
    bne    LFCFD                 ; 2³+1

    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #1                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$2A                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    sta    COLUPF                ; 3
    ldy    #8                    ; 2

  ELSE RELEASED_VERSION
    jsr    HorizReposition       ; 6
    ldy    screenCounter         ; 3
    lda    LF581,Y               ; 4
    sta    COLUBK                ; 3
    sta    $C3                   ; 3
    ldx    #0                    ; 2
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    stx    $96                   ; 3
    lda    #$48                  ; 2
    inx                          ; 2
    jsr    HorizReposition       ; 6
    clc                          ; 2
    lda    $96                   ; 3
    dex                          ; 2
LFCF3:
    sta    digitPtrs,X           ; 4
    adc    #9                    ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #8                    ; 2
    bne    LFCF3                 ; 2³
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    #1                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$2A                  ; 2
    sta    COLUPF                ; 3
    ldy    #8                    ; 2
    ldx    screenCounter         ; 3
    beq    LFD17                 ; 2³
    ldx    numOfLives            ; 3
    beq    LFD17                 ; 2³
    lda    $C3                   ; 3
LFD17:
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
  ENDIF

    ldx    numOfLives            ; 3
    lda    ReserveLivesDispTab,X ; 4   get the gfx for the lives display
    sta    $96                   ; 3
    sta    HMCLR                 ; 3
    lda    #>LogoOne             ; 2   high pointer for logo


DrawSceneNumber SUBROUTINE
;nested inside the lives/logo subroutine, this code is reused to draw
;the scene number (which appears underneath the reserve lives and logo)

    sta    digitPtrs+1           ; 3   store high pointers for logo, or numbers/blank digit
    sta    digitPtrs+3           ; 3
    sta    digitPtrs+5           ; 3
    sta    digitPtrs+7           ; 3

.loopDrawLivesLogoScene:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $96                   ; 3
    sta    PF1                   ; 3   draw the reserve lives (a square block for each life)
    lda    (digitPtrs),Y         ; 5
    sta    GRP0                  ; 3
    lda    (digitPtrs+2),Y       ; 5
    sta    GRP1                  ; 3
    lda    (digitPtrs+6),Y       ; 5   waste time
    nop                          ; 2   waste time
    nop                          ; 2   waste time
    lda    (digitPtrs+6),Y       ; 5
    tax                          ; 2
    lda    (digitPtrs+4),Y       ; 5
    sta.w  GRP0                  ; 4
    stx    GRP1                  ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3   clear reserve lives display for right half of playfield, and the loop exit
    cpy    #3                    ; 2
    bcs    LFD54                 ; 2³
    sta    $96                   ; 3
LFD54:
    dey                          ; 2
    bpl    .loopDrawLivesLogoScene ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD58:
    .byte $4E ; | X  XXX | $FD58  frequency, volume
    .byte $4E ; | X  XXX | $FD59
    .byte $4E ; | X  XXX | $FD5A
    .byte $4E ; | X  XXX | $FD5B
    .byte $4E ; | X  XXX | $FD5C
    .byte $4E ; | X  XXX | $FD5D
    .byte $0E ; |    XXX | $FD5E
    .byte $8E ; |X   XXX | $FD5F
    .byte $8E ; |X   XXX | $FD60
    .byte $0F ; |    XXXX| $FD61
    .byte $11 ; |   X   X| $FD62
    .byte $13 ; |   X  XX| $FD63
    .byte $0C ; |    XX  | $FD64
    .byte $53 ; | X X  XX| $FD65
    .byte $13 ; |   X  XX| $FD66
    .byte $4C ; | X  XX  | $FD67
    .byte $0C ; |    XX  | $FD68
    .byte $57 ; | X X XXX| $FD69
    .byte $17 ; |   X XXX| $FD6A
    .byte $51 ; | X X   X| $FD6B
    .byte $11 ; |   X   X| $FD6C
    .byte $57 ; | X X XXX| $FD6D
    .byte $17 ; |   X XXX| $FD6E
    .byte $51 ; | X X   X| $FD6F
    .byte $11 ; |   X   X| $FD70
    .byte $53 ; | X X  XX| $FD71
    .byte $13 ; |   X  XX| $FD72
    .byte $4E ; | X  XXX | $FD73
    .byte $0E ; |    XXX | $FD74
    .byte $53 ; | X X  XX| $FD75
    .byte $13 ; |   X  XX| $FD76
    .byte $4E ; | X  XXX | $FD77
    .byte $0E ; |    XXX | $FD78
    .byte $53 ; | X X  XX| $FD79
    .byte $13 ; |   X  XX| $FD7A
    .byte $4F ; | X  XXXX| $FD7B
    .byte $0F ; |    XXXX| $FD7C
    .byte $53 ; | X X  XX| $FD7D
    .byte $13 ; |   X  XX| $FD7E
    .byte $4F ; | X  XXXX| $FD7F
    .byte $0F ; |    XXXX| $FD80
    .byte $51 ; | X X   X| $FD81
    .byte $11 ; |   X   X| $FD82
    .byte $4C ; | X  XX  | $FD83
    .byte $0C ; |    XX  | $FD84
    .byte $51 ; | X X   X| $FD85
    .byte $11 ; |   X   X| $FD86
    .byte $4C ; | X  XX  | $FD87
    .byte $0C ; |    XX  | $FD88
    .byte $53 ; | X X  XX| $FD89
    .byte $13 ; |   X  XX| $FD8A
    .byte $4E ; | X  XXX | $FD8B
    .byte $0E ; |    XXX | $FD8C
    .byte $53 ; | X X  XX| $FD8D
    .byte $13 ; |   X  XX| $FD8E
    .byte $4E ; | X  XXX | $FD8F
    .byte $0E ; |    XXX | $FD90
    .byte $53 ; | X X  XX| $FD91
    .byte $13 ; |   X  XX| $FD92
    .byte $4C ; | X  XX  | $FD93
    .byte $0C ; |    XX  | $FD94
    .byte $53 ; | X X  XX| $FD95
    .byte $13 ; |   X  XX| $FD96
    .byte $4C ; | X  XX  | $FD97
    .byte $0C ; |    XX  | $FD98
    .byte $4E ; | X  XXX | $FD99
    .byte $4E ; | X  XXX | $FD9A
    .byte $4E ; | X  XXX | $FD9B
    .byte $4E ; | X  XXX | $FD9C
    .byte $4E ; | X  XXX | $FD9D
    .byte $0E ; |    XXX | $FD9E
    .byte $8E ; |X   XXX | $FD9F
    .byte $8E ; |X   XXX | $FDA0
    .byte $0F ; |    XXXX| $FDA1
    .byte $11 ; |   X   X| $FDA2
    .byte $13 ; |   X  XX| $FDA3
    .byte $0C ; |    XX  | $FDA4
    .byte $53 ; | X X  XX| $FDA5
    .byte $13 ; |   X  XX| $FDA6
    .byte $4C ; | X  XX  | $FDA7
    .byte $0C ; |    XX  | $FDA8
    .byte $56 ; | X X XX | $FDA9
    .byte $16 ; |   X XX | $FDAA
    .byte $4E ; | X  XXX | $FDAB
    .byte $0E ; |    XXX | $FDAC
    .byte $56 ; | X X XX | $FDAD
    .byte $16 ; |   X XX | $FDAE
    .byte $4E ; | X  XXX | $FDAF
    .byte $0E ; |    XXX | $FDB0
    .byte $53 ; | X X  XX| $FDB1
    .byte $13 ; |   X  XX| $FDB2
    .byte $4E ; | X  XXX | $FDB3
    .byte $0E ; |    XXX | $FDB4
    .byte $53 ; | X X  XX| $FDB5
    .byte $13 ; |   X  XX| $FDB6
    .byte $4E ; | X  XXX | $FDB7
    .byte $0E ; |    XXX | $FDB8
    .byte $53 ; | X X  XX| $FDB9
    .byte $13 ; |   X  XX| $FDBA
    .byte $4F ; | X  XXXX| $FDBB
    .byte $0F ; |    XXXX| $FDBC
    .byte $53 ; | X X  XX| $FDBD
    .byte $13 ; |   X  XX| $FDBE
    .byte $4C ; | X  XX  | $FDBF
    .byte $0C ; |    XX  | $FDC0
    .byte $53 ; | X X  XX| $FDC1
    .byte $13 ; |   X  XX| $FDC2
    .byte $4E ; | X  XXX | $FDC3
    .byte $0E ; |    XXX | $FDC4
    .byte $53 ; | X X  XX| $FDC5
    .byte $13 ; |   X  XX| $FDC6
    .byte $4E ; | X  XXX | $FDC7
    .byte $0E ; |    XXX | $FDC8
    .byte $57 ; | X X XXX| $FDC9
    .byte $17 ; |   X XXX| $FDCA
    .byte $51 ; | X X   X| $FDCB
    .byte $11 ; |   X   X| $FDCC
    .byte $57 ; | X X XXX| $FDCD
    .byte $17 ; |   X XXX| $FDCE
    .byte $51 ; | X X   X| $FDCF
    .byte $11 ; |   X   X| $FDD0
    .byte $53 ; | X X  XX| $FDD1
    .byte $13 ; |   X  XX| $FDD2
    .byte $4E ; | X  XXX | $FDD3
    .byte $0E ; |    XXX | $FDD4
    .byte $53 ; | X X  XX| $FDD5
    .byte $13 ; |   X  XX| $FDD6
    .byte $4E ; | X  XXX | $FDD7
    .byte $0E ; |    XXX | $FDD8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;called from 13 places

HorizReposition SUBROUTINE
    sec                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
.loopDivideBy15:
    sbc    #$0F                  ; 2
    bcs    .loopDivideBy15       ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0,X                ; 4
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;called from 1 place

LFDED SUBROUTINE
    lda    #$0F                  ; 2
    sta    vPosTopSkyObj         ; 3
    lda    #$60                  ; 2   big bird start position
    sta    $87                   ; 3
    sta    $86                   ; 3
    lda    #$1E                  ; 2
    sta    $A7                   ; 3
    sta    $89                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $FF ; |XXXXXXXX| $FDFE
    .byte $FF ; |XXXXXXXX| $FDFF

       ORG $FE00

BlankSprite:
    .byte $00 ; |        | $FE00
    .byte $00 ; |        | $FE01
    .byte $00 ; |        | $FE02
    .byte $00 ; |        | $FE03
    .byte $00 ; |        | $FE04
    .byte $00 ; |        | $FE05
    .byte $00 ; |        | $FE06
    .byte $00 ; |        | $FE07
    .byte $00 ; |        | $FE08
    .byte $00 ; |        | $FE09
    .byte $00 ; |        | $FE0A
    .byte $00 ; |        | $FE0B
Sailboat:
    .byte $00 ; |        | $FE0C
    .byte $00 ; |        | $FE0D
    .byte $1C ; |   XXX  | $FE0E
    .byte $7E ; | XXXXXX | $FE0F
    .byte $0B ; |    X XX| $FE10
    .byte $F8 ; |XXXXX   | $FE11
    .byte $D8 ; |XX XX   | $FE12
    .byte $68 ; | XX X   | $FE13
    .byte $38 ; |  XXX   | $FE14
    .byte $18 ; |   XX   | $FE15
    .byte $08 ; |    X   | $FE16
    .byte $00 ; |        | $FE17
Cloud:
    .byte $00 ; |        | $FE18
    .byte $10 ; |   X    | $FE19
    .byte $36 ; |  XX XX | $FE1A
    .byte $7F ; | XXXXXXX| $FE1B
    .byte $FF ; |XXXXXXXX| $FE1C
    .byte $FF ; |XXXXXXXX| $FE1D
    .byte $7B ; | XXXX XX| $FE1E
    .byte $7A ; | XXXX X | $FE1F
    .byte $20 ; |  X     | $FE20
    .byte $00 ; |        | $FE21
    .byte $00 ; |        | $FE22
    .byte $00 ; |        | $FE23
ChickenOne:
    .byte $00 ; |        | $FE24
    .byte $18 ; |   XX   | $FE25
    .byte $0C ; |    XX  | $FE26
    .byte $3C ; |  XXXX  | $FE27
    .byte $7E ; | XXXXXX | $FE28
    .byte $FC ; |XXXXXX  | $FE29
    .byte $F6 ; |XXXX XX | $FE2A
    .byte $37 ; |  XX XXX| $FE2B
    .byte $22 ; |  X   X | $FE2C
    .byte $21 ; |  X    X| $FE2D
    .byte $60 ; | XX     | $FE2E
    .byte $E0 ; |XXX     | $FE2F
ChickenTwo:
    .byte $00 ; |        | $FE30
    .byte $84 ; |X    X  | $FE31
    .byte $48 ; | X  X   | $FE32
    .byte $30 ; |  XX    | $FE33
    .byte $7C ; | XXXXX  | $FE34
    .byte $FE ; |XXXXXXX | $FE35
    .byte $F4 ; |XXXX X  | $FE36
    .byte $66 ; | XX  XX | $FE37
    .byte $32 ; |  XX  X | $FE38
    .byte $11 ; |   X   X| $FE39
    .byte $30 ; |  XX    | $FE3A
    .byte $70 ; | XXX    | $FE3B
RoseBush:
    .byte $00 ; |        | $FE3C
    .byte $7E ; | XXXXXX | $FE3D
    .byte $4C ; | X  XX  | $FE3E
    .byte $08 ; |    X   | $FE3F
    .byte $C4 ; |XX   X  | $FE40
    .byte $F7 ; |XXXX XXX| $FE41
    .byte $FF ; |XXXXXXXX| $FE42
    .byte $6E ; | XX XXX | $FE43
    .byte $6C ; | XX XX  | $FE44
    .byte $FE ; |XXXXXXX | $FE45
    .byte $6A ; | XX X X | $FE46
    .byte $4E ; | X  XXX | $FE47
FlowerLeaves:
    .byte $00 ; |        | $FE48
    .byte $3C ; |  XXXX  | $FE49
    .byte $2C ; |  X XX  | $FE4A
    .byte $7E ; | XXXXXX | $FE4B
    .byte $DE ; |XX XXXX | $FE4C
    .byte $1E ; |   XXXX | $FE4D
    .byte $1A ; |   XX X | $FE4E
    .byte $3A ; |  XXX X | $FE4F
    .byte $6F ; | XX XXXX| $FE50
    .byte $EB ; |XXX X XX| $FE51
    .byte $08 ; |    X   | $FE52
    .byte $00 ; |        | $FE53
TeaKettle:
    .byte $00 ; |        | $FE54
    .byte $7F ; | XXXXXXX| $FE55
    .byte $3E ; |  XXXXX | $FE56
    .byte $1C ; |   XXX  | $FE57
    .byte $3E ; |  XXXXX | $FE58
    .byte $3F ; |  XXXXXX| $FE59
    .byte $7D ; | XXXXX X| $FE5A
    .byte $FF ; |XXXXXXXX| $FE5B
    .byte $9C ; |X  XXX  | $FE5C
    .byte $3E ; |  XXXXX | $FE5D
    .byte $1C ; |   XXX  | $FE5E
    .byte $08 ; |    X   | $FE5F
StonesOne:
    .byte $00 ; |        | $FE60
    .byte $7E ; | XXXXXX | $FE61
    .byte $18 ; |   XX   | $FE62
    .byte $7E ; | XXXXXX | $FE63
    .byte $5A ; | X XX X | $FE64
    .byte $DB ; |XX XX XX| $FE65
    .byte $DB ; |XX XX XX| $FE66
    .byte $DB ; |XX XX XX| $FE67
    .byte $5A ; | X XX X | $FE68
    .byte $7E ; | XXXXXX | $FE69
    .byte $18 ; |   XX   | $FE6A
    .byte $7E ; | XXXXXX | $FE6B
StonesTwo:
    .byte $00 ; |        | $FE6C
    .byte $18 ; |   XX   | $FE6D
    .byte $18 ; |   XX   | $FE6E
    .byte $7E ; | XXXXXX | $FE6F
    .byte $66 ; | XX  XX | $FE70
    .byte $66 ; | XX  XX | $FE71
LFE72:
    .byte $66 ; | XX  XX | $FE72
    .byte $66 ; | XX  XX | $FE73
    .byte $66 ; | XX  XX | $FE74
    .byte $7E ; | XXXXXX | $FE75
    .byte $18 ; |   XX   | $FE76
    .byte $18 ; |   XX   | $FE77
FountainOne:
    .byte $00 ; |        | $FE78
    .byte $3C ; |  XXXX  | $FE79
    .byte $7E ; | XXXXXX | $FE7A
    .byte $28 ; |  X X   | $FE7B
    .byte $08 ; |    X   | $FE7C
    .byte $08 ; |    X   | $FE7D
    .byte $18 ; |   XX   | $FE7E
    .byte $88 ; |X   X   | $FE7F
    .byte $88 ; |X   X   | $FE80
    .byte $54 ; | X X X  | $FE81
    .byte $52 ; | X X  X | $FE82
    .byte $20 ; |  X     | $FE83
FountainTwo:
    .byte $00 ; |        | $FE84
    .byte $3C ; |  XXXX  | $FE85
    .byte $7E ; | XXXXXX | $FE86
    .byte $08 ; |    X   | $FE87
    .byte $08 ; |    X   | $FE88
    .byte $08 ; |    X   | $FE89
    .byte $08 ; |    X   | $FE8A
    .byte $08 ; |    X   | $FE8B
    .byte $4A ; | X  X X | $FE8C
    .byte $54 ; | X X X  | $FE8D
    .byte $20 ; |  X     | $FE8E
    .byte $00 ; |        | $FE8F
BigBirdOne:
    .byte $00 ; |        | $FE90
    .byte $E0 ; |XXX     | $FE91
    .byte $79 ; | XXXX  X| $FE92
    .byte $7F ; | XXXXXXX| $FE93
    .byte $3C ; |  XXXX  | $FE94
    .byte $7C ; | XXXXX  | $FE95
    .byte $70 ; | XXX    | $FE96
    .byte $40 ; | X      | $FE97
    .byte $40 ; | X      | $FE98
    .byte $C0 ; |XX      | $FE99
BigBirdTwo:
    .byte $00 ; |        | $FE9A
    .byte $00 ; |        | $FE9B
    .byte $02 ; |      X | $FE9C
    .byte $1E ; |   XXXX | $FE9D
    .byte $3E ; |  XXXXX | $FE9E
    .byte $38 ; |  XXX   | $FE9F
    .byte $7C ; | XXXXX  | $FEA0
    .byte $5E ; | X XXXX | $FEA1
    .byte $46 ; | X   XX | $FEA2
    .byte $C7 ; |XX   XXX| $FEA3
BatOne:
    .byte $00 ; |        | $FEA4
    .byte $00 ; |        | $FEA5
    .byte $00 ; |        | $FEA6
    .byte $14 ; |   X X  | $FEA7
    .byte $3E ; |  XXXXX | $FEA8
    .byte $2A ; |  X X X | $FEA9
    .byte $49 ; | X  X  X| $FEAA
    .byte $55 ; | X X X X| $FEAB
    .byte $41 ; | X     X| $FEAC
    .byte $22 ; |  X   X | $FEAD
BatTwo:
    .byte $00 ; |        | $FEAE
    .byte $00 ; |        | $FEAF
    .byte $22 ; |  X   X | $FEB0
    .byte $41 ; | X     X| $FEB1
    .byte $2A ; |  X X X | $FEB2
    .byte $1C ; |   XXX  | $FEB3
    .byte $08 ; |    X   | $FEB4
    .byte $14 ; |   X X  | $FEB5
    .byte $00 ; |        | $FEB6
    .byte $00 ; |        | $FEB7
ButterflyOne:
    .byte $00 ; |        | $FEB8
    .byte $03 ; |      XX| $FEB9
    .byte $06 ; |     XX | $FEBA
    .byte $3C ; |  XXXX  | $FEBB
    .byte $FC ; |XXXXXX  | $FEBC
    .byte $5E ; | X XXXX | $FEBD
    .byte $17 ; |   X XXX| $FEBE
    .byte $3B ; |  XXX XX| $FEBF
    .byte $2E ; |  X XXX | $FEC0
    .byte $14 ; |   X X  | $FEC1
ButterflyTwo:
    .byte $00 ; |        | $FEC2
    .byte $03 ; |      XX| $FEC3
    .byte $06 ; |     XX | $FEC4
    .byte $3C ; |  XXXX  | $FEC5
    .byte $F0 ; |XXXX    | $FEC6
    .byte $40 ; | X      | $FEC7
    .byte $80 ; |X       | $FEC8
    .byte $00 ; |        | $FEC9
    .byte $00 ; |        | $FECA
    .byte $00 ; |        | $FECB
UfoOne:
    .byte $00 ; |        | $FECC
    .byte $10 ; |   X    | $FECD
    .byte $44 ; | X   X  | $FECE
    .byte $10 ; |   X    | $FECF
    .byte $BA ; |X XXX X | $FED0
    .byte $38 ; |  XXX   | $FED1
    .byte $BA ; |X XXX X | $FED2
    .byte $10 ; |   X    | $FED3
    .byte $44 ; | X   X  | $FED4
    .byte $10 ; |   X    | $FED5
UfoTwo:
    .byte $00 ; |        | $FED6
    .byte $00 ; |        | $FED7
    .byte $00 ; |        | $FED8
    .byte $10 ; |   X    | $FED9
    .byte $38 ; |  XXX   | $FEDA
    .byte $38 ; |  XXX   | $FEDB
    .byte $38 ; |  XXX   | $FEDC
    .byte $10 ; |   X    | $FEDD
    .byte $00 ; |        | $FEDE
    .byte $00 ; |        | $FEDF
CondorOne:
    .byte $00 ; |        | $FEE0
    .byte $24 ; |  X  X  | $FEE1
    .byte $99 ; |X  XX  X| $FEE2
    .byte $5A ; | X XX X | $FEE3
    .byte $24 ; |  X  X  | $FEE4
    .byte $00 ; |        | $FEE5
    .byte $00 ; |        | $FEE6
    .byte $00 ; |        | $FEE7
    .byte $00 ; |        | $FEE8
    .byte $00 ; |        | $FEE9
CondorTwo:
    .byte $00 ; |        | $FEEA
    .byte $24 ; |  X  X  | $FEEB
    .byte $18 ; |   XX   | $FEEC
    .byte $18 ; |   XX   | $FEED
    .byte $24 ; |  X  X  | $FEEE
    .byte $24 ; |  X  X  | $FEEF
    .byte $42 ; | X    X | $FEF0
    .byte $81 ; |X      X| $FEF1
    .byte $00 ; |        | $FEF2
    .byte $00 ; |        | $FEF3

    .byte $00 ; |        | $FEF4
    .byte $00 ; |        | $FEF5
LFEF6:
    .byte $0C ; |    XX  | $FEF6  sta $96
    .byte $0A ; |    X X | $FEF7
    .byte $0D ; |    XX X| $FEF8
    .byte $0F ; |    XXXX| $FEF9

MidScreenEdgeTab:
;note screen 7 is shared with the Bit Corp Logo
    .byte $99 ; |X  XX  X| $FEFA   screen 1
    .byte $EE ; |XXX XXX | $FEFB   screen 2
    .byte $FF ; |XXXXXXXX| $FEFC   screen 3
    .byte $FF ; |XXXXXXXX| $FEFD   screen 4
    .byte $FF ; |XXXXXXXX| $FEFE   screen 5
    .byte $FF ; |XXXXXXXX| $FEFF   screen 6

;the sample copy has a lower case "i" and a lower case 't", and
;the "C" is also strecthed a bit longer... All the other Bit Corp
;logos look EXACTLY like the released copy with an upper case "I",
;upper case "T", and short a "C"
;
;one exception however is the incomplete Bit Corp logo found inside NTSC Karate,
;it has a lower case "i" and "t" as well, but the font is very fat. It should
;also be noted that this Bit Corp logo hidden inside of Karate might be there entirely
;by accident, as it appears to be garbage code...


;             sample copy                                 released copy
;
;      XX   XXX X X   XXX XXX XXX XXX              XX   XXX X XXX  XX XXX XXX XXX
;     X  X  X X X X   XXX XXX X X X X             X  X  X X X XXX  XX XXX X X X X
;    X XX X XXX  XXX  X   X X X X X X            X XX X XXX X  X   X  X X X X X X
;    X X  X XX  X X   X   X X XXX XXX            X X  X XX  X  X   X  X X XXX XXX
;    X X  X XXX X X   X   X X XXX XXX            X X  X XXX X  X   X  X X XXX XXX
;    X XX X X X X X   XXX XXX XX  X              X XX X X X X  X   XX XXX XX  X
;     X  X  XXX X XX  XXX XXX X X X               X  X  XXX X  X   XX XXX X X X
;      XX   XXX X XX  XXX XXX X X X                XX   XXX X  X   XX XXX X X X

;


  IF SAMPLE_COPY

LogoOne:
    .byte $00 ; |        | $FF00  shared byte (mid screen edge, of screen 7)
    .byte $31 ; |  XX   X| $FF01
    .byte $49 ; | X  X  X| $FF02
    .byte $B5 ; |X XX X X| $FF03
    .byte $A5 ; |X X  X X| $FF04
    .byte $A5 ; |X X  X X| $FF05
    .byte $B5 ; |X XX X X| $FF06
    .byte $49 ; | X  X  X| $FF07
    .byte $31 ; |  XX   X| $FF08
LogoTwo:
    .byte $00 ; |        | $FF09
    .byte $D6 ; |XX X XX | $FF0A
    .byte $D6 ; |XX X XX | $FF0B
    .byte $54 ; | X X X  | $FF0C
    .byte $D4 ; |XX X X  | $FF0D
    .byte $94 ; |X  X X  | $FF0E
    .byte $CE ; |XX  XXX | $FF0F
    .byte $54 ; | X X X  | $FF10
    .byte $D4 ; |XX X X  | $FF11
LogoThree:
    .byte $00 ; |        | $FF12
    .byte $77 ; | XXX XXX| $FF13
    .byte $77 ; | XXX XXX| $FF14
    .byte $77 ; | XXX XXX| $FF15
    .byte $45 ; | X   X X| $FF16
    .byte $45 ; | X   X X| $FF17
    .byte $45 ; | X   X X| $FF18
    .byte $77 ; | XXX XXX| $FF19
    .byte $77 ; | XXX XXX| $FF1A
LogoFour:
    .byte $00 ; |        | $FF1B
    .byte $54 ; | X X X  | $FF1C
    .byte $54 ; | X X X  | $FF1D
    .byte $64 ; | XX  X  | $FF1E
    .byte $77 ; | XXX XXX| $FF1F
    .byte $77 ; | XXX XXX| $FF20
    .byte $55 ; | X X X X| $FF21
    .byte $55 ; | X X X X| $FF22
    .byte $77 ; | XXX XXX| $FF23

  ELSE RELEASED_VERSION

LogoOne:
    .byte $00 ; |        | $FF00  shared byte (mid screen edge, of screen 7)
    .byte $31 ; |  XX   X| $FF01
    .byte $49 ; | X  X  X| $FF02
    .byte $B5 ; |X XX X X| $FF03
    .byte $A5 ; |X X  X X| $FF04
    .byte $A5 ; |X X  X X| $FF05
    .byte $B5 ; |X XX X X| $FF06
    .byte $49 ; | X  X  X| $FF07
    .byte $31 ; |  XX   X| $FF08
LogoTwo:
    .byte $00 ; |        | $FF09
    .byte $D2 ; |XX X  X | $FF0A
    .byte $D2 ; |XX X  X | $FF0B
    .byte $52 ; | X X  X | $FF0C
    .byte $D2 ; |XX X  X | $FF0D
    .byte $92 ; |X  X  X | $FF0E
    .byte $D2 ; |XX X  X | $FF0F
    .byte $57 ; | X X XXX| $FF10
    .byte $D7 ; |XX X XXX| $FF11
LogoThree:
    .byte $00 ; |        | $FF12
    .byte $37 ; |  XX XXX| $FF13
    .byte $37 ; |  XX XXX| $FF14
    .byte $37 ; |  XX XXX| $FF15
    .byte $25 ; |  X  X X| $FF16
    .byte $25 ; |  X  X X| $FF17
    .byte $25 ; |  X  X X| $FF18
    .byte $37 ; |  XX XXX| $FF19
    .byte $37 ; |  XX XXX| $FF1A
LogoFour:
    .byte $00 ; |        | $FF1B
    .byte $54 ; | X X X  | $FF1C
    .byte $54 ; | X X X  | $FF1D
    .byte $64 ; | XX  X  | $FF1E
    .byte $77 ; | XXX XXX| $FF1F
    .byte $77 ; | XXX XXX| $FF20
    .byte $55 ; | X X X X| $FF21
    .byte $55 ; | X X X X| $FF22
    .byte $77 ; | XXX XXX| $FF23
  ENDIF

LFF24:
    .byte $4E ; | X  XXX | $FF24  frequency, volume
    .byte $4E ; | X  XXX | $FF25
    .byte $4E ; | X  XXX | $FF26
    .byte $0E ; |    XXX | $FF27
    .byte $8E ; |X   XXX | $FF28
    .byte $8E ; |X   XXX | $FF29
    .byte $4F ; | X  XXXX| $FF2A
    .byte $0F ; |    XXXX| $FF2B
    .byte $4C ; | X  XX  | $FF2C
    .byte $0C ; |    XX  | $FF2D
    .byte $0E ; |    XXX | $FF2E
    .byte $4C ; | X  XX  | $FF2F
    .byte $0C ; |    XX  | $FF30
    .byte $8C ; |X   XX  | $FF31
    .byte $4B ; | X  X XX| $FF32
    .byte $0B ; |    X XX| $FF33
    .byte $4E ; | X  XXX | $FF34
    .byte $0E ; |    XXX | $FF35
    .byte $4B ; | X  X XX| $FF36
    .byte $4B ; | X  X XX| $FF37
    .byte $0B ; |    X XX| $FF38
    .byte $8B ; |X   X XX| $FF39
    .byte $0B ; |    X XX| $FF3A
    .byte $4C ; | X  XX  | $FF3B
    .byte $0C ; |    XX  | $FF3C
    .byte $8C ; |X   XX  | $FF3D
    .byte $0C ; |    XX  | $FF3E
    .byte $4E ; | X  XXX | $FF3F
    .byte $0E ; |    XXX | $FF40
    .byte $8E ; |X   XXX | $FF41
    .byte $0C ; |    XX  | $FF42
    .byte $0E ; |    XXX | $FF43
    .byte $4E ; | X  XXX | $FF44
    .byte $4E ; | X  XXX | $FF45
    .byte $4E ; | X  XXX | $FF46
    .byte $0E ; |    XXX | $FF47
    .byte $8E ; |X   XXX | $FF48
    .byte $8E ; |X   XXX | $FF49
    .byte $4F ; | X  XXXX| $FF4A
    .byte $0F ; |    XXXX| $FF4B
    .byte $4C ; | X  XX  | $FF4C
    .byte $0C ; |    XX  | $FF4D
    .byte $0E ; |    XXX | $FF4E
    .byte $4C ; | X  XX  | $FF4F
    .byte $0C ; |    XX  | $FF50
    .byte $8C ; |X   XX  | $FF51
    .byte $4B ; | X  X XX| $FF52
    .byte $0B ; |    X XX| $FF53
    .byte $4E ; | X  XXX | $FF54
    .byte $0E ; |    XXX | $FF55
    .byte $4B ; | X  X XX| $FF56
    .byte $4B ; | X  X XX| $FF57
    .byte $0B ; |    X XX| $FF58
    .byte $8B ; |X   X XX| $FF59
    .byte $0B ; |    X XX| $FF5A
    .byte $4C ; | X  XX  | $FF5B
    .byte $0C ; |    XX  | $FF5C
    .byte $8C ; |X   XX  | $FF5D
    .byte $0C ; |    XX  | $FF5E
    .byte $4E ; | X  XXX | $FF5F
    .byte $0E ; |    XXX | $FF60
    .byte $8E ; |X   XXX | $FF61
    .byte $0C ; |    XX  | $FF62
    .byte $0E ; |    XXX | $FF63
    .byte $4E ; | X  XXX | $FF64

HighSkyObjLoPtrTab:
    .byte  <BigBirdOne   ; screen 1
    .byte  <BigBirdTwo   ;
    .byte  <Cloud        ; screen 2
    .byte  <Cloud        ;
    .byte  <UfoOne       ; screen 3
    .byte  <UfoTwo       ;
    .byte  <CondorOne    ; screen 4
    .byte  <CondorTwo    ;
    .byte  <Cloud        ; screen 5
    .byte  <Cloud        ;
    .byte  <BigBirdOne   ; screen 6
    .byte  <BigBirdTwo   ;
    .byte  <CondorOne    ; screen 7
    .byte  <CondorTwo    ;
    .byte  <UfoOne       ; screen 8
    .byte  <UfoTwo       ;
ColHighSkyObjTab:
    .byte  GREEN_BLUE    ;
    .byte  LIGHT_GREEN   ;
    .byte  LIGHT_RED     ;
    .byte  GREEN_BLUE+6  ;
    .byte  WHITE         ;
    .byte  GREEN_BLUE-2  ;
    .byte  MAROON-2      ;
    .byte  TEAL          ;

middleSkyObjLoPtrTab:
    .byte  <Sailboat     ; screen 1
    .byte  <BlankSprite  ; screen 2
    .byte  <Cloud        ; screen 3
    .byte  <BlankSprite  ; screen 4
    .byte  <Sailboat     ; screen 5
    .byte  <BlankSprite  ; screen 6
    .byte  <Cloud        ; screen 7
    .byte  <BlankSprite  ; screen 8
ColMidSkyObjTab:
    .byte  MAROON+7      ;
    .byte  BLACK         ;
    .byte  WHITE         ;
    .byte  BLACK         ;
    .byte  RED           ;
    .byte  BLACK         ;
    .byte  PURPLE_BLUE   ;
    .byte  BLACK         ;

LowSkyObjLoPtrTab:
    .byte  <BlankSprite  ; screen 1
    .byte  <BlankSprite  ;
    .byte  <BigBirdOne   ; screen 2
    .byte  <BigBirdTwo   ;
    .byte  <ButterflyOne ; screen 3
    .byte  <ButterflyTwo ;
    .byte  <BatOne       ; screen 4
    .byte  <BatTwo       ;
    .byte  <BlankSprite  ; screen 5
    .byte  <BlankSprite  ;
    .byte  <ButterflyOne ; screen 6
    .byte  <ButterflyTwo ;
    .byte  <BigBirdOne   ; screen 7
    .byte  <BigBirdTwo   ;
    .byte  <BatOne       ; screen 8
    .byte  <BatTwo       ;
ColLowSkyObjTab:
    .byte  BLACK         ;
    .byte  RED-3         ;
    .byte  MAROON+2      ;
    .byte  GREEN_BLUE-3  ;
    .byte  BLACK         ;
    .byte  PURPLE        ;
    .byte  BLACK         ;
    .byte  GREEN_BLUE+9  ;

GroundObjLoPtrTab:
    .byte  <TeaKettle    ; screen 1
    .byte  <TeaKettle    ;
    .byte  <RoseBush     ; screen 2
    .byte  <RoseBush     ;
    .byte  <FountainOne  ; screen 3
    .byte  <FountainTwo  ;
    .byte  <FlowerLeaves ; screen 4
    .byte  <FlowerLeaves ;
    .byte  <ChickenOne   ; screen 5
    .byte  <ChickenTwo   ;
    .byte  <StonesOne    ; screen 6
    .byte  <StonesTwo    ;
ColGroundObjTab:
    .byte  LIGHT_PURPLE  ;
    .byte  MAROON+7      ;
    .byte  PURPLE_BLUE+1 ;
    .byte  GREEN_BLUE-3  ;
    .byte  LIGHT_GREEN   ;
    .byte  BLACK         ;

TopStackedObjLoPtrTab:
    .byte  <ButterflyOne+2 ; $FFB7  double check
    .byte  <ButterflyTwo+3 ; $FFB8
    .byte  <BatOne+3       ; $FFB9
    .byte  <BatTwo+3       ; $FFBA
    .byte  <FountainOne+5  ; $FFBB
    .byte  <FountainTwo+5  ; $FFBC
    .byte  <RoseBush+3     ; $FFBD
    .byte  <RoseBush+3     ; $FFBE
TopObjectColTab:
    .byte  LIGHT_RED     ;
    .byte  LIGHT_GREEN   ;
    .byte  PURPLE_BLUE   ;
    .byte  MAROON        ;

BotStackedObjLoPtrTab:
    .byte  <FlowerLeaves ; $FFC3
    .byte  <TeaKettle    ; $FFC4
    .byte  <StonesOne    ; $FFC5
    .byte  <FlowerLeaves ; $FFC6
BottomObjectColTab:
    .byte $9F            ; $FFC7
    .byte $68            ; $FFC8
    .byte  BLACK         ; $FFC9
    .byte $58            ; $FFCA


ReserveLivesDispTab:
    .byte $00 ; |        | $FFCB  dead
    .byte $00 ; |        | $FFCC  one life
    .byte $80 ; |X       | $FFCD  two lives
    .byte $A0 ; |X X     | $FFCE  three lives
    .byte $A8 ; |X X X   | $FFCF  four lives
    .byte $AA ; |X X X X | $FFD0  five lives

  IF SAMPLE_COPY
LFFD1:
    .byte $41 ; | X     X| $FFD1  sta $97
    .byte $43 ; | X    XX| $FFD2
    .byte $45 ; | X   X X| $FFD3
    .byte $46 ; | X   XX | $FFD4
    .byte $47 ; | X   XXX| $FFD5
    .byte $48 ; | X  X   | $FFD6
    .byte $48 ; | X  X   | $FFD7
  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;called from 2 places

KillAudio SUBROUTINE
    lda    #0                    ; 2
    sta    AUDC0                 ; 3
    sta    AUDF0                 ; 3
    sta    AUDV0                 ; 3
    sta    AUDC1                 ; 3
    sta    AUDF1                 ; 3
    sta    AUDV1                 ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;called from 1 place

StoreHighPtrs SUBROUTINE
    lda    #$FE                  ; 2   high nybble
    sta    gpObjPtr1+1           ; 3
    sta    gpObjPtr2+1           ; 3
    lda    #$FA                  ; 2   high nybble
    sta    bobbyGfxPtr+1         ; 3
    sta    bridgeGfxPtr+1        ; 3
    jsr    LFDED                 ; 6
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    REPEAT ($FFFC - *)
      .byte $FF
    REPEND

       ORG $FFFC

    .word START,START
