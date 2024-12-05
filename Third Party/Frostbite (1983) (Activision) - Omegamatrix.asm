; Disassembly of Frostbite
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: distella -pasfcFrost.cfg frost.bin > Frostbite(re).asm
;
; Frost.cfg contents:
;
;      ORG F000
;      CODE F000 FBFF
;      GFX FC00 FCE9
;      CODE FCEA FCFB
;      GFX FCFC FDEF
;      CODE FDF0 FEE6
;      GFX FEE7 FEFE
;      CODE FEFF FEFF
;      GFX FF00 FF5A
;      CODE FF5B FF67
;      GFX FF68 FFCF
;      CODE FFD0 FFE8
;      GFX FFE9 FFFA
;      CODE FFFB FFFB
;      GFX FFFC FFFF

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
CTRLPF  =  $0A
REFP0   =  $0B
REFP1   =  $0C
PF1     =  $0E
RESP0   =  $10
RESP1   =  $11
RESBL   =  $14
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM1    =  $23
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
RESMP1  =  $29
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C

; Read TIA Baseline = $00
CXM1P   =  $01
CXPPMM  =  $07
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      USER CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TIME_VBLANK           = $30
TIME_OVERSCAN         = $1F

STARTING_LIVES        = 3
;scanlines tall
HEIGHT_OF_FB          = 18
HEIGHT_IGLOO_ENTRANCE = 11

JUMP_OFF_SCREEN       = 0

;colors
BLACK                 = $00
BLUE                  = $98
BROWN                 = $26
DIRTY_YELLOW          = $16
GREEN                 = $D6
GREY                  = $06
PINK                  = $36
RED                   = $44
WHITE                 = $0E
YELLOW                = $1A

COL_BEAR_NORM         = GREY-2
COL_BEAR_ADV          = WHITE-2
COL_IGLOO             = GREY
COL_IGLOO_ENT_FLICKER = PINK+2
COL_ICEFLOW           = WHITE-2
COL_ICEFLOW_TOUCHED   = BLUE
COL_WATER             = BLUE-8
COL_LOGO              = WHITE-2
COL_TOPSCREEN_NORM    = BLUE-20  ; background color, top of screen, normal difficulty
COL_MIDSCREEN_NORM    = GREY+4
COL_TOPSCREEN_ADV     = BLUE-24  ; background color, top of screen, advanced difficulty
COL_MIDSCREEN_ADV     = GREY-4

;REFPx
REFLECT               = $08
NO_REFLECT            = $00


;HMPx
LEFT_7                = $70
LEFT_6                = $60
LEFT_5                = $50
LEFT_4                = $40
LEFT_3                = $30
LEFT_2                = $20
LEFT_1                = $10
NO_MOTION             = $00
RIGHT_1               = $F0
RIGHT_2               = $E0
RIGHT_3               = $D0
RIGHT_4               = $C0
RIGHT_5               = $B0
RIGHT_6               = $A0
RIGHT_7               = $90
RIGHT_8               = $80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;                                   bit 1, difficulty (0 = norm, 1 = advanced)
;                                     | bit 0, player (0 = P0, 1 = P1)
;                                     | /
gameSelect            = $80  ; %xxxxxxXX     all other bits free
framecounter          = $81
colForScroll          = $82
volume                = $83
joystickDir           = $84  ; directions currently pressed, but not firebutton
;-------------------------------------------------
tempGfxPtrs           = $85            ; $85 - $90  used for score, temp, logo, player gfx, etc...
scorePtrs             = tempGfxPtrs    ; $85 - $90
polarBearPtr          = tempGfxPtrs+2  ; $87 - $88
frostBaileyPtr        = tempGfxPtrs+4  ; $89 - $8A
;$8B - $8C
;$8D - $8E
;$8F - $90
;-------------------------------------------------
rowEnemyType          = $91  ; $91 bottom - $94 top row  *** not true, something else
;-------------------------------------------------
;$95
;$96
;$97
;$98
;$99 ice flow speed?
;$9A enemy speed?
;$9B
;$9C nusiz for ice flows?
;$9D nusiz for ice flows?
;$9E nusiz for ice flows?
;-------------------------------------------------
hPosIceFlows          = $9F  ; $9F bottom - $A2 top row
enemyLoPtr            = $A3  ; $A3 bottom - $A6 top row
colRowEnemy           = $A7  ; $A7 bottom - $AA top row
colIceFlows           = $AB  ; $AB bottom - $AE top row
;-------------------------------------------------
fireButton            = $AF

;$B0 collisions?
;$B1
;$B2
;$B3
;$B4
;$B5
;$B6  $Xxxx xxxx on top ice flow
;$B7

;$B8

iceFlowFB_IsOn         = $B9

;$BA
colBackground          = $BB
;$BC
colBear                = $BD
colIglooEntrance       = $BE
;$BF



iglooShape             = $C0  ; $C0 - $C4
;$C5 demo mode?
;$C6 clock or flag? game just freezes
playerFlag             = $C7  ; P0 = 0, P1 = 1
;-------------------------------------------------
scoreBCD               = $C8  ; $C8 - $CA
;$C8  (10's and 1's digit)
;$C9  (1,000's and 100's digit)
;$CA  (100,000's and 10,000's digit)
;-------------------------------------------------
screenNumP0            = $CB
numOfLives             = $CC
iglooBlocks            = $CD  ; goes from $FF (no blocks) to $0F (all blocks)
;-------------------------------------------------
scoreBCD_P1            = $CE  ; $CE - $D0
;$CE  (10's and 1's digit)
;$CF  (1,000's and 100's digit)
;$D0  (100,000's and 10,000's digit)
;-------------------------------------------------
screenNumP1            = $D1
numOfLivesP1           = $D2
iglooBlocksP1          = $D3
;-------------------------------------------------
hPosEnemies            = $D4  ; $D4 bottom - $D7 top row
;-------------------------------------------------
enemyNusiz              = $D8
;$D8 number of bottom row enemies?
;$D9 number of row enemies?
;$DA number of row enemies?
;$DB number of top row enemies?
;-------------------------------------------------
;$DC something to do with bottom row enemies?
;$DD something to do with row enemies?
;$DE something to do with row enemies?
;$DF something to do with top row enemies?

;$E0 make enemies appear on bottom row?
;$E1 make enemies appear on row?
;$E2 make enemies appear on row?
;$E3 make enemies appear on top row?
;-------------------------------------------------
vPos_FB               = $E4
tempBCD               = $E5
hPos_FB               = $E6
;$E7 timer for drowning / igloo block removal?
hPos_PolarBear        = $E8
;$E9 hPos_FB??
;$EA frame animation for FB?
addSinkingFB          = $EB  ; adjusts pointer to draw some blank lines above FB
reflectFB             = $EC ; faces left or right. combined with something else
;$ED polar bear chases FB off of screen?
;$EE sinking FB?
polarBearFrame        = $EF
addFreezeColFB        = $F0
;$F1 sinking FB flag?
;$F2
;$F3
;$F4
;$F5 return flows to white color after all are blue?
;$F6 return one row ice flow to white color after blue?
;$F7
tempOne               = $F8 ;seems to be used for scanlines to/remaining of various things?
tempTwo               = $F9
;$FA


;                             bit 7, flag (0 = norm, 1 = reverse flows)
;                               |
reverseFlowsFlag      = $FB  ; %Xxxxxxxx     all other bits free

;$FC - $FF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $F000

START:
    sei
    cld
    ldx    #0
DoReset:
    lda    #0
.loopClear:
    sta    0,X
    txs                             ; end result: SP = $FF, A = 0, X = 0
    inx                             ; ram clear and TIA registers cleared
    bne    .loopClear

    jsr    Initialization
    ldx    colForScroll
    bne    LoadScorePtrs
    inx                         
    stx    colForScroll
    jmp    CheckGameSelect

LoadScorePtrs:
    ldx    #2
.loopGetScoreLoPtrs:
    txa
    asl
    asl
    tay                             ; Y = 8, 4, or 0
    lda    scoreBCD,X
    and    #$F0                     ; select either 100,000's, 1,000's, or 10's digit
    lsr                             ; divide by 2, result is the low gfx pointer for digit
    sta.wy scorePtrs,Y              ; store in either $8D, $89, or $85
    lda    scoreBCD,X
    and    #$0F                     ; select either 10,000's, 100's, or 1's digit
    asl
    asl
    asl                             ; times by 8 to get low gfx pointer for the digit
    sta.wy scorePtrs+2,Y            ; store in either $8F, $8B, or $87
    dex
    bpl    .loopGetScoreLoPtrs
    inx                             ; X=0
    ldy    #<BlankDigit
.loopBlankPrecedingZeros:
    lda    scorePtrs,X              ; test highest digit for a zero (ie preceding zeros)
    bne    LF043                    ; if non-zero, break the loop...
    sty    scorePtrs,X              ; blank all the preceding zeros,
    inx                             ; except the far right zero
    inx
    cpx    #10                      ; do 5 digits * 2 (length of pointers is 2 bytes)
    bcc    .loopBlankPrecedingZeros
LF043:
    jsr    LFAEA                 ; 6
    
    lda    colBackground
    sta    COLUBK                ; 3
    ldx    playerFlag
    lda    ColScoreTab,X            ; player zero gets a different color for the score then player one
    sta    COLUP0
    sta    COLUP1
LF053:
    lda    INTIM                 ; 4
    bne    LF053                 ; 2³
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    $BF                   ; 3
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    and    #$02                  ; 2
    sta    VBLANK                ; 3
    jsr    LFE05                 ; 6
    lda    #<BlankDigit          ; 2   blank spaces between temperature display, and lives display
    sta    $85                   ; 3
    sta    $8B                   ; 3
    sta    $8D                   ; 3
    sta    $8F                   ; 3
    lda    #<DegreeSymbol        ; 2
    sta    $89                   ; 3
    lda    numOfLives
    beq    LF081                 ; 2³
    asl                             ; low nibble gfx pointer
    asl
    asl
    sta    $8F                   ; 3
LF081:
    lda    tempBCD
    and    #$F0                     ; take only the Most Significant Digit (MSD) for temperature
    beq    .getLoPtrForTempLSD      ; - if it's zero, move on to the (LSD) for the temperature
    lsr
    sta    $85                      ; low nibble gfx pointer, temperature (MSD)
.getLoPtrForTempLSD:
    lda    tempBCD
    and    #$0F                     ; get (LSD) for temperature
    sta    HMCLR
    sta    WSYNC
;---------------------------------------
    sta    HMOVE
    asl                             ; convert (LSD) into low nibble gfx pointer
    asl
    asl
    sta    $87                   ; 3
    lda    $85                   ; 3
    cmp    #<BlankDigit          ; 2
    bne    LF0AF                 ; 2³
    lda    $F1                   ; 3
    bne    LF0AF                 ; 2³
    lda    framecounter
    and    #$08                  ; 2
    bne    LF0AF                 ; 2³
    lda    colBackground         ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
LF0AF:
    lda    screenNumP0
    cmp    #$14                  ; 2
    bcc    LF0BD                 ; 2³
    lda    #$6D                  ; 2
    sta    $8B                   ; 3
    lda    #$FD                  ; 2
    sta    $8C                   ; 3
LF0BD:
    jsr    LFE05                 ; 6
    ldx    $EE                   ; 3
    lda    FB_LoPtrTab,X
    clc
    adc    addSinkingFB             ; offsets the low pointer to blank space above FB gfx, causing sinking effect
    sta    frostBaileyPtr           ; low nibble for Frosbite Bailey
    lda    FB_LoPtrColorTab,X
    clc
    adc    addSinkingFB             ; keeps the color table aligned to a sinking FB sprite
    adc    addFreezeColFB           ; if freezing, the offset here creates the freezing "head to toe" effect
    sta    $8B                      ; low nibble, color pointer
    ldx    #>FB_one                 ; ($FB page)
    stx    $8A                      ; - high nibble for Frostbite Bailey
    stx    $8C                      ; - high nibble, color table for Frostbite Bailey
    inx                             ; ($FC page)
    stx    polarBearPtr+1           ; - high nibble for Polar Bear
    stx    $86                      ; - high nibble for creatures...
    sta    WSYNC
;---------------------------------------
    sta    HMOVE                 ;3  @3
    ldx    polarBearFrame        ;3  @6
    lda    PolarBearLoPtrTab,X   ;4  @10
    sta    polarBearPtr          ;3  @13
    sta    WSYNC                 ;3  @16
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    #0                    ;2  @5
    sta    NUSIZ0                ;3  @8    one copy
    sta    NUSIZ1                ;3  @11
    sta    VDELP0                ;3  @14   no delay
    lda    #COL_IGLOO            ;2  @16
    sta    COLUPF                ;3  @19
    lda    colIglooEntrance      ;3  @22   color igloo entrance the same as the background, to hide it
    sta    COLUP1                ;3  @25
    lda    colForScroll          ;3  @28
    sta    tempTwo               ;3  @31
    and    #$02                  ;2  @33
    eor    LFCB6+9               ;4  @37   $FCBF, #$78
    sta    HMCLR                 ;3  @40
    sta    WSYNC                 ;3  @43
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    COLUBK                ;3  @6    scrolling background colors, Northern Lights?
    lda    hPos_FB               ;3  @9    position Frostbite Bailey
    cmp    #$0F                  ;2  @11   stop FB on left side of screen
    bcs    LF122                 ;2³ @13/14
;if the ice flows are moving FB off the
;left side of screen, then slide him back
    sec                          ;2  @15   
    sbc    #$0F                  ;2  @17
    ldx    #LEFT_6               ;2  @19
    nop                          ;2  @21
    sta.w  RESP0                 ;4  @25
    stx    HMP0                  ;3  @28
    bne    LF129                 ;3  @31   always branch

LF122:
    nop                          ;2  @16
LF123:
    sbc    #$0F                  ; 2
    bcs    LF123                 ; 2³
    sta    RESP0                 ; 3
LF129:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    tempOne               ;3  @6
    lda    tempTwo               ;3  @9
    cmp    #$80                  ;2  @11
    rol                          ;2  @13
    sta    tempTwo               ;3  @16
    and    #$02                  ;2  @18
    eor    LFCB6+8               ;4  @22   $FCBE, #$68
    sta    COLUBK                ;3  @25
    lda    tempOne               ;3  @28
    asl                          ;2  @30
    asl                          ;2  @32
    asl                          ;2  @34
    asl                          ;2  @36
    eor    #$70                  ;2  @38
    sta    HMP0                  ;3  @41
    lda    reflectFB             ;3  @44
    sta    REFP0                 ;3  @47   face left or right
    lsr                          ;2  @49
    sta    REFP1                 ;3  @52
    lda    iglooBlocks           ;3  @55
    cmp    #$0F                  ;2  @57
    bne    LF156                 ;2³ @59/60
    sta    RESP1                 ;3  @62
LF156:
    ldx    #7                    ;2  @62/64
LF158:
    lda    tempTwo               ;3  @51..67
    cmp    #$80                  ;2  @53..69
    rol                          ;2  @55..71
    sta    WSYNC                 ;3  @58..74
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    tempTwo               ;3  @6
    and    #$02                  ;2  @8
    eor    LFCB6,X               ;4  @12
    cpx    #0                    ;2  @14
    bne    LF16E                 ;2³ @16/17
    lda    $BC                   ;3  @19
LF16E:
    sta    COLUBK                ;3  @20/22
    lda    #0                    ;2  @22/24
    sta    PF1                   ;3  @25/27
    txa                          ;2  @27/29
    lsr                          ;2  @29/31
    lsr                          ;2  @31/33
    tay                          ;2  @33/35
    lda.wy iglooShape+3,Y        ;4  @37/39
    dex                          ;2  @39/41
    sta    PF1                   ;3  @42/44
    sta    HMCLR                 ;3  @45/47
    bpl    LF158                 ;2³ @47..50
    ldy    vPos_FB               ;3  @50/52
    ldx    #HEIGHT_IGLOO_ENTRANCE;2  @52/54
    stx    VDELP1                ;3  @55/57   #$0B, use delay
LF188:
    stx    tempOne               ;3  @50..60
    cpx    #8                    ;2  @52..62   is it time to draw FB?
    lda    IglooEntrance,X       ;4  @56..66
    sta    GRP1                  ;3  @59..69
    lda    #0                    ;2  @61..71
    sta    WSYNC                 ;3  @64..74
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    PF1                   ;3  @6
    bcs    LF1B8                 ;2³ @8/9
    dey                          ;2  @10
    cpy    #$13                  ;2  @12
    bcs    LF1B8                 ;2³ @14/15
    lda    ($8B),Y               ;5  @19
    sta    COLUP0                ;3  @22
    lda    (frostBaileyPtr),Y    ;5  @27      section 1, igloo level
LF1A6:
    sta    GRP0                  ;3  @23..30
    lda    tempOne               ;3  @26..33
    lsr                          ;2  @28..35
    lsr                          ;2  @30..37
    tax                          ;2  @32..39
    lda    iglooShape,X          ;4  @36..43
    ldx    tempOne               ;3  @39..46
    dex                          ;2  @41..48
    sta    PF1                   ;3  @44..51
    bpl    LF188                 ;2³ @46..54
    bmi    LF1BF                 ;3  @49..56   always branch

LF1B8:
    nop                          ;2  @11/17
    nop                          ;2  @13/19
    nop                          ;2  @15/21
    nop                          ;2  @17/23
    jmp    LF1A6                 ;3  @20/26

LF1BF:
    inx                          ;2  @51..58
    txa                          ;2  @53..60
    dey                          ;2  @55..62
    cpy    #$13                  ;2  @57..64
    sta    WSYNC                 ;3  @60..67
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    GRP1                  ;3  @6
    bcs    LF1D2                 ;2³ @8/9
    lda    ($8B),Y               ;5  @13
    sta    COLUP0                ;3  @16
    lda    (frostBaileyPtr),Y    ;5  @21    section 1, igloo level

LF1D2:
    sta    GRP0                  ;3  @12/24
    stx    PF1                   ;3  @15/27
    lda    colBear               ;3  @18/30
    sta    COLUP1                ;3  @21/33
    lda    #5                    ;2  @23/35
    sta    NUSIZ1                ;3  @26/38
    txa                          ;2  @28/40
    dey                          ;2  @30/42
    cpy    #$13                  ;2  @32/44
    bcs    LF1E9                 ;2³ @34..47
    lda    (frostBaileyPtr),Y    ;5  @39/51       section 1, igloo level
    tax                          ;2  @41/53
    lda    ($8B),Y               ;5  @46/58
LF1E9:
    sec                          ;2  @37..60
    sta    WSYNC                 ;3  @40..63
;---------------------------------------
    sta    HMOVE                 ;3  @3
    stx    GRP0                  ;3  @6
    sta    COLUP0                ;3  @9
    lda    hPos_PolarBear        ;3  @12
    nop                          ;2  @14
    nop                          ;2  @16
LF1F6:
    sbc    #$0F                  ; 2
    bcs    LF1F6                 ; 2³
    sta    RESP1                 ; 3
    sta    CXCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    tempOne               ;3  @6
    dey                          ;2  @8
    cpy    #$13                  ;2  @10
    bcs    LF211                 ;2³ @12/13
    lda    (frostBaileyPtr),Y    ;5  @17        section 2, below igloo
    sta    GRP0                  ;3  @20
    lda    ($8B),Y               ;5  @25
    sta    COLUP0                ;3  @28
LF211:
    lda    tempOne               ;3  @16/31
    asl                          ;2  @18/33
    asl                          ;2  @20/35
    asl                          ;2  @22/37
    asl                          ;2  @24/39
    eor    #$70                  ;2  @26/41
    sta    HMP1                  ;3  @29/44
    ldx    #$12                  ;2  @31/46
LF21D:
    dey                          ;2  @33..48
    sty    tempOne               ;3  @36..51
    txa                          ;2  @38..53
    tay                          ;2  @40..55
    lda    (polarBearPtr),Y      ;5  @45..60
    sta    GRP1                  ;3  @48..63
    lda    #0                    ;2  @50..65
    ldy    tempOne               ;3  @53..68
    cpy    #$13                  ;2  @55..70
    sta    WSYNC                 ;3  @58..73
;---------------------------------------
    sta    HMOVE                 ;3  @3
    bcs    LF238                 ;2³ @5/6
    lda    ($8B),Y               ;5  @10
    sta    COLUP0                ;3  @13
    lda    (frostBaileyPtr),Y    ;5  @18   section 2, below igloo
LF238:
    sta    GRP0                  ;3  @9/21
    jsr    Delay14cycles         ;14 @23/35
    sta    HMCLR                 ;3  @26/38
    ldy    tempOne               ;3  @29/41
    dex                          ;2  @31/43
    bpl    LF21D                 ;2³ @33..46
    lda    CXPPMM                ;3  @36/48
    bpl    LF24A                 ;2³ @38..51
    sta    $ED                   ;3  @41/53
LF24A:
    dey                          ;2  @41..55
    cpy    #$13                  ;2  @43..57
    sta    WSYNC                 ;3  @46..60
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    #0                    ;2  @5
    sta    COLUBK                ;3  @8         black, color for water border
    bcs    LF25D                 ;2³ @10/11
    lda    ($8B),Y               ;5  @15
    sta    COLUP0                ;3  @18
    lda    ($89),Y               ;5  @23
LF25D:
    sta    GRP0                  ;3  @14/26
    sta    CXCLR                 ;3  @17/29
    ldx    #7                    ;2  @19/31
LF263:
    stx    $BA                   ;3  @22..43
    lda    #0                    ;2  @24..45
    sta    GRP1                  ;3  @27..48
    dey                          ;2  @29..50
    cpy    #$13                  ;2  @31..52
    bcs    LF274                 ;2³ @33..54
    lda    ($8B),Y               ;5  @38..59
    sta    COLUP0                ;3  @41..62
    lda    (frostBaileyPtr),Y    ;5  @46..67   neck and head area, all ice flows
LF274:
    sta    WSYNC                 ;3  @37..70
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    GRP0                  ;3  @6
    lda    #COL_WATER            ;2  @8
    sta    COLUBK                ;3  @11
    txa                          ;2  @13
    lsr                          ;2  @15
    tax                          ;2  @17
    lda    hPosIceFlows,X        ;4  @21
    bcc    LF287                 ;2³ @23/24
    lda    hPosEnemies,X                 ;4  @27
LF287:
    sta    tempOne               ;3  @27/30
    lda    enemyNusiz,X          ;4  @31/34
    sta    NUSIZ1                ;3  @34/37
    sta    HMCLR                 ;3  @37/40
    lda    #0                    ;2  @39/42   no delay
    sta    VDELP1                ;3  @42/45   no reflect
    sta    REFP1                 ;3  @45/48
    dey                          ;2  @47/50
    cpy    #$13                  ;2  @49/52
    bcs    LF2A0                 ;2³ @51..55
    lda    ($8B),Y               ;5  @56/59
    sta    COLUP0                ;3  @59/62
    lda    (frostBaileyPtr),Y    ;5  @64/67   neck area, all ice flows
LF2A0:
    sta    WSYNC                 ;3  @55..70
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    GRP0                  ;3  @6
    lda    tempOne               ;3  @9
    cmp    #$0F                  ;2  @11
    dey                          ;2  @13
    bcs    LF2B9                 ;2³ @15/16
    sec                          ;2  @17
    sbc    #$0F                  ;2  @19
    ldx    #LEFT_6               ;2  @21
    sta.w  RESP1                 ;4  @25
    stx    HMP1                  ;3  @28
    bne    LF2BF                 ;3  @31   always branch

LF2B9:
    sbc    #$0F                  ; 2
    bcs    LF2B9                 ; 2³
    sta    RESP1                 ; 3
LF2BF:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    tax                          ;2  @5
    cpy    #$13                  ;2  @7
    bcs    LF2D0                 ;2³ @9/10
    lda    ($8B),Y               ;5  @14
    sta    COLUP0                ;3  @17
    lda    (frostBaileyPtr),Y    ;5  @22   neck and head area, all ice flows
    sta    GRP0                  ;3  @25
LF2D0:
    txa                          ;2  @12/27
    asl                          ;2  @14/29
    asl                          ;2  @16/31
    asl                          ;2  @18/33
    asl                          ;2  @20/35
    eor    #$70                  ;2  @22/37
    sta    HMP1                  ;3  @25/40
    lda    $BA                   ;3  @28/43
    lsr                          ;2  @30/45
    tax                          ;2  @32/47
    lda    enemyLoPtr,X          ;4  @36/51
    sta    $85                   ;3  @39/54
    lda    colRowEnemy,X         ;4  @43/58
    sta    COLUP1                ;3  @46/61
    lda    rowEnemyType,X        ;4  @50/65
    bpl    LF2ED                 ;2³ @52..68
    lda    #8                    ;2  @54/69
    sta    REFP1                 ;3  @57/72
LF2ED:
    sta    WSYNC                 ;3  @56..75
;---------------------------------------
    sta    HMOVE                 ;3  @3
    dey                          ;2  @5
    cpy    #$13                  ;2  @7
    bcs    LF2FE                 ;2³ @9/10
    lda    ($8B),Y               ;5  @14
    sta    COLUP0                ;3  @17
    lda    (frostBaileyPtr),Y    ;5  @22      arm area, all ice flows
    sta    GRP0                  ;3  @25
LF2FE:
    lda    #3                    ;2  @12/27
    sta    RESMP1                ;3  @15/30
    sta    VDELP1                ;3  @18/33
    lda    $BA                   ;3  @21/36
    lsr                          ;2  @23/38
    sta    CXCLR                 ;3  @26/41
    sta    HMCLR                 ;3  @29/44
    bcc    LF339                 ;2³ @31..47
    ldx    #7                    ;2  @33/48
LF30F:
    dey                          ;2  @16..50
    sty    tempOne               ;3  @19..53
    txa                          ;2  @21..55
    tay                          ;2  @23..57
    lda    ($85),Y               ;5  @28..62
    sta    GRP1                  ;3  @31..65
    ldy    tempOne               ;3  @34..68
    cpy    #$13                  ;2  @36..70
    lda    #0                    ;2  @38..72
    sta    WSYNC                 ;3  @41..75
;---------------------------------------
    sta    HMOVE                 ;3  @3
    bcs    LF32A                 ;2³ @5/6
    lda    ($8B),Y               ;5  @10
    sta    COLUP0                ;3  @13
    lda    (frostBaileyPtr),Y    ;5  @18      head area, all ice flows
LF32A:
    sta    GRP0                  ;3  @9/21
    dex                          ;2  @11/23
    bpl    LF30F                 ;2³ @13..26
    ldx    $BA                   ;3  @16/28
    lda    CXPPMM                ;3  @19/31
    sta    $B0,X                 ;4  @23/35
    dex                          ;2  @25/37
    jmp    LF263                 ;3  @28/40

LF339:
    tax                          ;2  @34/49
    lda    colIceFlows,X         ;4  @38/53
    sta    COLUP1                ;3  @41/56
    lda    #0                    ;2  @43/58
    sta    GRP1                  ;3  @46/61
    dey                          ;2  @48/63
    cpy    #$13                  ;2  @50/65
    sta    WSYNC                 ;3  @53/68
;---------------------------------------
    sta    HMOVE                 ;3  @3
    bcs    LF351                 ;2³ @5/6
    lda    ($8B),Y               ;5  @10
    sta    COLUP0                ;3  @13
    lda    (frostBaileyPtr),Y    ;5  @18     arm area, all ice flows
LF351:
    sta    GRP0                  ;3  @9/21
    lda    #$36                  ;2  @11/23
    sta    NUSIZ1                ;3  @14/26
    lda    #0                    ;2  @16/28
    sta    GRP1                  ;3  @19/31
    dey                          ;2  @21/33
    cpy    #$13                  ;2  @23/35
    sta    WSYNC                 ;3  @26/38
;---------------------------------------
    sta    HMOVE                 ;3  @3
    bcs    LF36A                 ;2³ @5/6
    lda    ($8B),Y               ;5  @10
    sta    COLUP0                ;3  @13
    lda    (frostBaileyPtr),Y    ;5  @18     hand area, all ice flows
LF36A:
    sta    GRP0                  ;3  @9/21
    jsr    Delay12cycles         ;12 @21/33
    lda    $9D                   ;3  @24/36
    sta    RESMP1                ;3  @27/39
    sta    HMM1                  ;3  @30/42
    lda    $9C                   ;3  @33/45
    sta    HMP1                  ;3  @36/48
    ldx    #6                    ;2  @38/50
    stx    tempOne               ;3  @41/53
LF37D:
    dey                          ;2  @35/55
    ldx    #$FF                  ;2  @37/57
    stx    GRP1                  ;3  @40/60
    cpy    #$13                  ;2  @42/62
    lda    #0                    ;2  @44/64
    sta    WSYNC                 ;3  @47/67
;---------------------------------------
    sta    HMOVE                 ;3  @3
    bcs    LF392                 ;2³ @5/6
    lda    ($8B),Y               ;5  @10
    sta    COLUP0                ;3  @13
    lda    (frostBaileyPtr),Y    ;5  @18      leg area, all ice flows
LF392:
    sta    GRP0                  ;3  @9/21
    stx    ENAM1                 ;3  @12/24
    ldx    tempOne               ;3  @15/27
    lda    HmoveIceFlowTab,X     ;4  @19/31    X = 6,5,4,3,2,1,0
    sta    HMM1                  ;3  @22/34
    sta    HMP1                  ;3  @25/37
    dec    tempOne               ;5  @30/42
    bpl    LF37D                 ;2³ @32..45
    sta    HMCLR                 ;3  @35/47
    dey                          ;2  @37/49
    cpy    #$13                  ;2  @39/51
    lda    #0                    ;2  @41/53
    sta    GRP1                  ;3  @44/56
    sta    WSYNC                 ;3  @47/59

;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    ENAM1                 ;3  @6
    bcs    LF3BA                 ;2³ @8/9
    lda    ($8B),Y               ;5  @13
    sta    COLUP0                ;3  @16
    lda    (frostBaileyPtr),Y    ;5  @21      head area, all ice flows
LF3BA:
    sta    GRP0                  ;3  @12
    ldx    $BA                   ;3  @15
    lda    CXPPMM                ;3  @18
    ora    CXM1P                 ;3  @21
    sta    $B0,X                 ;4  @25
    dex                          ;2  @27
    bmi    LF3CA                 ;2³ @29/30
    jmp    LF263                 ;3  @32

LF3CA:
    stx    $B8                   ;3  @33
    stx    iceFlowFB_IsOn        ;3  @36
    inx                          ;2  @38
    sta    WSYNC                 ;3  @41
;---------------------------------------
    sta    HMOVE                 ;3  @3
    stx    GRP0                  ;3  @6
    stx    GRP1                  ;3  @9
    stx    REFP0                 ;3  @12
    stx    REFP1                 ;3  @15
    sta    HMCLR                 ;3  @18
    stx    VDELP1                ;3  @21
    sta    WSYNC                 ;3  @24
;---------------------------------------
    sta    HMOVE                 ;3  @3
    ldy    #7                    ;2  @5
    lda    $C6                   ;3  @8
    and    #$1F                  ;2  @10
    cmp    #$14                  ;2  @12
    bcs    LF3F6                 ;2³ @14/15
    ldy    #0                    ;2  @16
    cmp    #$0C                  ;2  @18
    bcc    LF3F6                 ;2³ @20/21
    sbc    #$0C                  ;2  @22
    tay                          ;2  @24
LF3F6:
    sty    tempTwo               ;3  @18/27
    tya                          ;2  @20/29
    eor    #$07                  ;2  @22/31
    sta    $FA                   ;3  @25/34
    lda    #$B8                  ;2  @27/36
    ldx    #8                    ;2  @29/38
    sec                          ;2  @31/40
    sta    WSYNC                 ;3  @34/43
;---------------------------------------
    sta    HMOVE                 ;3  @3
.loop68cycles:
    sta    $87,X                 ; 4
    sbc    #8                    ; 2
    sta    $85,X                 ; 4
    sbc    #8                    ; 2
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    .loop68cycles         ; 2³
    sta    WSYNC                 ;3  @74
;---------------------------------------
    sta    HMOVE                 ;3  @3
    ldx    #BLACK                ;2  @5    black background around the logo
    stx    COLUBK                ;3  @8
    stx    COLUPF                ;3  @11
    lda    #COL_LOGO             ;2  @13
    sta    COLUP0                ;3  @16
    sta    COLUP1                ;3  @19
    ldx    #$0B                  ;2  @21
    lda    #$FF                  ;2  @23
.loop65cycles:
    sta    $85,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    .loop65cycles         ; 2³
;---------------------------------------
    jsr    LFE09                 ;6  @26   a few scanlines pass
    lda    #$78                  ;2  @28
    sta    PF1                   ;3  @31
    lda    #$31                  ;2  @33
    sta    CTRLPF                ;3  @36
    sta    NUSIZ1                ;3  @39
    sta    HMCLR                 ;3  @42
    lda    #$10                  ;2  @44
    sta    HMBL                  ;3  @47
    ldy    #7                    ;2  @49
    sty    ENABL                 ;3  @52
LF445:
    lda    LogoFive,Y            ;4  @56/61
    tax                          ;2  @58/63
    lda    LogoOne,Y             ;4  @62/67
    sta    GRP0                  ;3  @65/70
    sta    WSYNC                 ;3  @68/73
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    LogoBarColorsTab,Y    ;4  @7
    sta    COLUPF                ;3  @10
    lda    LogoTwo,Y             ;4  @14
    sta    GRP1                  ;3  @17
    lda    LogoThree,Y           ;4  @21
    sta    GRP0                  ;3  @24
    lda    tempOne               ;3  @27
    nop                          ;2  @29
    lda    LogoFour,Y            ;4  @33
    sta    GRP1                  ;3  @36
    stx    GRP0                  ;3  @39
    sta    GRP1                  ;3  @42
    lda    #BLACK                ;2  @44   hide a piece of playfield to the far right
    sta    COLUPF                ;3  @47
    dey                          ;2  @49
    dec    $FA                   ;5  @54
    bpl    LF445                 ;2³ @56/57
    lda    #TIME_OVERSCAN        ;2  @58
    ldx    #$82                  ;2  @60
    sta    WSYNC                 ;3  @63
;---------------------------------------
    sta    TIM64T
    stx    VBLANK                   ; electron beam turned off,
    lda    #0
    sta    GRP0                     ; clear the gfx registers
    sta    GRP1
    sta    GRP0
    sta    PF1
    sta    ENABL                    ; disable
    lda    $C6                   ; 3
    beq    .clearIgloo
    lda    scoreBCD+2
    and    #$0F                  ; 2
    ora    $F1                   ; 3
    bne    .clearIgloo
    lda    framecounter
    and    #$7F                  ; 2
    bne    .clearIgloo
    lda    gameSelect               ; check if P0 or P1
    lsr
    bcc    .clearIgloo              ; - branch if one player game,
    jsr    SwitchPlayers            ; else move P1 registers into P0
.clearIgloo:
    ldx    #5-1                     ; number of igloo rows
    lda    #0                       ; use for row clear
.loopClearIgloo:
    sta    iglooShape,X             ; erase each row of igloo blocks
    dex
    bpl    .loopClearIgloo
    bit    $C5                   ; 3
    bpl    LF4B7                 ; 2³
    jmp    LF566                 ; 3

LF4B7:
    lda    addFreezeColFB
    ora    addSinkingFB
    beq    LF4DB                 ; 2³
    clc                          ; 2
    tax                          ; 2
    adc    #8                    ; 2
    sta    AUDF0                 ; 3
    sta    AUDF1                 ; 3
    lda    #$0C                  ; 2
    sta    AUDC1                 ; 3
    lda    #1                    ; 2
    sta    AUDC0                 ; 3
    lda    #4                    ; 2
    cpx    #$12                  ; 2
    bne    LF4D7                 ; 2³
    lda    #0                    ; 2
    sta    $F4                   ; 3
LF4D7:
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
LF4DB:
    bit    $F4                   ; 3
    bvc    LF4FE                 ; 2³
    dec    $F4                   ; 5
    lda    $F4                   ; 3
    and    #$1F                  ; 2
    bne    LF4E9                 ; 2³
    sta    $F4                   ; 3
LF4E9:
    sta    AUDF1                 ; 3
    ldx    #$0C                  ; 2
    stx    AUDC1                 ; 3
    ldx    #0                    ; 2
    and    #$03                  ; 2
    beq    LF4FC                 ; 2³
    lda    #$10                  ; 2
    jsr    AdjustScore
    ldx    #5                    ; 2
LF4FC:
    stx    AUDV1                 ; 3
LF4FE:
    bit    $F3                   ; 3
    bpl    LF51A                 ; 2³
    dec    $F3                   ; 5
    lda    $F3                   ; 3
    and    #$1F                  ; 2
    bne    LF50C                 ; 2³
    sta    $F3                   ; 3
LF50C:
    sta    AUDV0                 ; 3
    cmp    #7                    ; 2
    bcs    LF514                 ; 2³
    lda    #7                    ; 2
LF514:
    sta    AUDF0                 ; 3
    lda    #$0C                  ; 2
    sta    AUDC0                 ; 3
LF51A:
    bit    $F4                   ; 3
    bpl    LF533                 ; 2³
    dec    $F4                   ; 5
    lda    $F4                   ; 3
    and    #$1F                  ; 2
    bne    LF528                 ; 2³
    sta    $F4                   ; 3
LF528:
    lsr                          ; 2
    sta    AUDV1                 ; 3
    lda    #8                    ; 2
    sta    AUDC1                 ; 3
    lda    #2                    ; 2
    sta    AUDF1                 ; 3
LF533:
    bit    $F3                   ; 3
    bvc    LF566                 ; 2³
    lda    $F3                   ; 3
    and    #$1F                  ; 2
    lsr                          ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    lda    #$0C                  ; 2
    sta    AUDC0                 ; 3
    sta    AUDC1                 ; 3
    lda    $F3                   ; 3
    bit    iglooBlocks
    bmi    LF555                 ; 2³
    sec                          ; 2
    sbc    #2                    ; 2
    ldx    #$0C                  ; 2
    ldy    #$0F                  ; 2
    bne    LF55A                 ; 3   always branch

LF555:
    lsr                          ; 2
    ldx    #5                    ; 2
    ldy    #1                    ; 2
LF55A:
    stx    AUDF0                 ; 3
    sty    AUDF1                 ; 3
    and    #$1F                  ; 2
    beq    LF564                 ; 2³
    ora    #$40                  ; 2
LF564:
    sta    $F3                   ; 3
LF566:
    ldx    #7                    ; 2
LF568:
    dex                          ; 2
    lda    $B1,X                 ; 4
    bpl    LF571                 ; 2³
    txa                          ; 2
    lsr                          ; 2
    sta    $B8                   ; 3
LF571:
    lda    $B0,X                 ; 4
    bpl    LF579                 ; 2³
    txa                          ; 2
    lsr                          ; 2
    sta    iceFlowFB_IsOn
LF579:
    dex                          ; 2
    bpl    LF568                 ; 2³
    lda    #3                    ; 2
    bit    $C5                   ; 3
    bmi    LF584                 ; 2³
    lda    screenNumP0
LF584:
    clc                          ; 2
    adc    #4                    ; 2
    tay                          ; 2
    sec                          ; 2
    sbc    #$0F                  ; 2
    bcc    LF594                 ; 2³
LF58D:
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    sbc    #7                    ; 2
    bcs    LF58D                 ; 2³
LF594:
    tya                          ; 2
    ldx    #0                    ; 2
    lsr                          ; 2
    jsr    LFFD0                 ; 6   X=0
    inx                          ; 2
    dey                          ; 2
    tya                          ; 2
    jsr    LFFD0                 ; 6   X=1
    inx                          ; 2
    iny                          ; 2
    tya                          ; 2
    jsr    LFFD0                 ; 6   X=2
    lda    #0                       ; clear
    sta    reverseFlowsFlag
    ldx    playerFlag               ; determine player,
    lda    INPT4,X                  ; and read firebutton for that player
    tay
    and    fireButton               ; pressed (first detection, or being held down) %0xxxxxxx, else %1xxxxxxx
;do action for firebutton only once
    eor    fireButton               ; pressed (first detection) %1xxxxxxx, everytime else %0xxxxxxx
    sty    fireButton               ; save current state of firebutton...
    bpl    LF5C0                    ; branch, if firebutton not being pressed
    lda    $EA                      ; is Frosbite Bailey jumping though?
    bne    LF5C0                    ; - yes, ignore firebutton as he's not on a ice flow anymore
    lda    #$FF                     ; - no, set reverse flow flag
    sta    reverseFlowsFlag
LF5C0:
    ldx    $9E                   ; 3
    lda    LFDE0,X               ; 4
    tay                          ; 2
    and    #$F0                  ; 2
    sta    $9D                   ; 3
    tya                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $9C                   ; 3
    ldx    screenNumP0
    cpx    #8                    ; 2
    bcc    LF5D9                 ; 2³
    ldx    #8                    ; 2
LF5D9:
    lda    LFDD7,X               ; 4
    and    #$F0                  ; 2
    sta    $95                   ; 3
    ldx    iglooBlocks
    bmi    LF5F6                 ; 2³
    ldx    #0                    ; 2
LF5E6:
    ldy    LFD4E,X               ; 4
    lda    iglooShapeTab,X
    sta.wy iglooShape,Y
    cpx    iglooBlocks
    bcs    LF5F6                 ; 2³
    inx                          ; 2
    bpl    LF5E6                 ; 2³
LF5F6:
    lda    framecounter
    and    #$07                  ; 2
    bne    .waitOverscan
    jsr    LFE8B                 ; 6
.waitOverscan:
    lda    INTIM
    bne    .waitOverscan
    ldy    #$82                     ; this value looks like it was once meant for Vblank as well...
    sty    WSYNC
;---------------------------------------
    sty    VSYNC                    ; Vsync starts
    sty    WSYNC                    ; three scanlines
    sty    WSYNC
    sty    WSYNC
;---------------------------------------
    sta    VSYNC                    ; vsync ends
    inc    framecounter
    bne    LF629
    inc    $C5                      ; once every 256 frames
    lda    $C5                   ; 3
    and    #$C7                  ; 2
    sta    $C5                   ; 3
    and    #$07                  ; 2
    bne    LF629                 ; 2³
    inc    $BF                      ; every 2,048 frames
    bne    LF629                 ; 2³
    sec                          ; 2
    ror    $BF                   ; 5
LF629:
    lda    #TIME_VBLANK
    sta    WSYNC
;---------------------------------------
    sta    TIM64T
    ldy    SWCHA                 ; 4
    lda    framecounter
    and    #$07                  ; 2
    bne    .storeDirections
    lda    $C6                   ; 3
    beq    .storeDirections
    ldy    #$FF                  ; 2
    dec    $C6                   ; 5
    bne    .storeDirections
    dec    $C6                   ; 5
    lda    $C5                   ; 3
    bmi    .storeDirections
    ora    #$80                  ; 2
    sta    $C5                   ; 3
    ldx    #$D4                     ; for clearing registers $D5 and up
    bne    LF66D                    ; always branch

.storeDirections:
    lda    playerFlag               ; determine current player (P0 or P1)
    lsr
    tya                             ; accumulator has either #$FF (no change) or SWCHA
    bcs    .keepCurrentPlayer       ; branch if P1, or else shift right 4 times,
    jsr    ShiftHiNibbleToLo        ; so that P0 can have their directions stored
.keepCurrentPlayer:
    and    #$0F                     ; keep joy directions of current player
    sta    joystickDir
    iny                             ; Y=0, if no direction pressed
    beq    LF665                    ; branch if no direction is pressed, by either player
    lda    #0                    ; 2
    sta    $BF                   ; 3
LF665:
    lda    SWCHB                    ; test reset switch
    lsr
    bcs    noReset                  ; - not pressed
    ldx    #$BF                     ; for clearing registers $C0 and up
LF66D:
    jmp    DoReset

noReset:
    ldy    #0                       ; used to kill volume...
    lsr                             ; test select switch
    bcs    LF6A9                    ; - branch if not pressed
    lda    volume                   ; - else get the volume,
    beq    LF67D                    ; and decrease it if it's not already at zero
    dec    volume
    bpl    LF6AB                 ; 2³

LF67D:
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    addSinkingFB             ; clear
    sta    addFreezeColFB
    sta    $F4                   ; 3
    lda    #$8F                  ; 2
    sta    $F3                   ; 3
    inc    gameSelect
CheckGameSelect:
    lda    gameSelect
    and    #$03                     ; game modes are 0 to 3, "AND" operation also cycles mode back around (ie from 3 to 0)
    sta    gameSelect
    sta    $BF                   ; 3
    sta    $C5                   ; 3
    ora    #$A0                  ; 2
    tay                          ; 2
    iny                          ; 2
    sty    scoreBCD
    lda    #(<BlankDigit*2) | (<BlankDigit/8)
    sta    scoreBCD+1
    sta    scoreBCD+2
    lda    #$FF                  ; 2
    sta    $C6                   ; 3
    ldy    #$1E                  ; 2
LF6A9:
    sty    volume
LF6AB:
    lda    $E7                   ; 3   $E7 only tested here
    beq    LF6B3                 ; 2³
    dec    $E7                   ; 5
    bpl    LF6DA                 ; 2³
LF6B3:
    bit    $C5                   ; 3
    bmi    LF6BB                 ; 2³
    lda    $C6                   ; 3
    bne    LF6DA                 ; 2³
LF6BB:
    lda    $F1                   ; 3
    ora    hPos_FB
    bne    LF6C5                 ; 2³
    lda    #$80                  ; 2
    sta    $F1                   ; 3
LF6C5:
    lda    $F5                   ; 3
    beq    LF6CB                 ; 2³
    dec    $F5                   ; 5
LF6CB:
    bit    $F1                   ; 3
    bpl    LF6E7                 ; 2³
    lda    addSinkingFB
    cmp    #HEIGHT_OF_FB            ; is FB completely under water?
    bcs    LF6DD                    ; - yes, branch
    jsr    LFDF0                 ; 6
    inc    addSinkingFB             ; make FB sink a little lower
LF6DA:
    jmp    LFAE7                 ; 3

LF6DD:
    lda    #$20                  ; 2
    sta    $F1                   ; 3
    lda    #$70                  ; 2
    sta    $E7                   ; 3
    bne    LF6DA                 ; 3   always branch

LF6E7:
    bvc    LF715                 ; 2³+1
    bit    iglooBlocks
    bmi    LF6F3                 ; 2³
    dec    iglooBlocks
    lda    #6                    ; 2
    bne    LF6FC                 ; 3   always branch

LF6F3:
    lda    tempBCD                  ; is the temperature at zero?
    beq    tempAtZeroDegrees        ; - yes..
    jsr    LowerTheTemperature      ; - no, so lower it by one degree
    lda    #2                    ; 2
LF6FC:
    sta    $E7                   ; 3
    lda    $95                   ; 3
    jsr    AdjustScore
    lda    #$55                  ; 2
    sta    $F3                   ; 3
    bne    LF6DA                 ; 3+1   always branch

tempAtZeroDegrees:
    sta    $F7                      ; clear
    lda    #8                    ; 2
    sta    $F1                   ; 3
    lda    #$30                  ; 2
    sta    $E7                   ; 3
    bne    LF6DA                 ; 3+1   always branch

LF715:
    lda    $F1                   ; 3
    and    #$20                  ; 2
    beq    LF73D                 ; 2³
    bit    $C5                   ; 3
    bmi    LF737                 ; 2³
    lda    numOfLives
    ora    numOfLivesP1
    bne    LF72B                    ; at least one player still alive
    sta    $F1                   ; 3
    dec    $C6                   ; 5
    bmi    LF6DA                 ; 2³+1
LF72B:
    jsr    SwitchPlayers
    lda    numOfLives
    bne    decreaseOneLife          ; choose which player to decrement lives
    jsr    SwitchPlayers
decreaseOneLife:
    dec    numOfLives
LF737:
    jsr    LFB57                 ; 6
    jmp    LF6DA                 ; 3

LF73D:
    lda    $F1                   ; 3
    and    #$10                  ; 2
    beq    LF754                 ; 2³
    jsr    LFDF0                 ; 6
    inc    addFreezeColFB           ; freeze FB one line lower
    lda    addFreezeColFB
    cmp    #HEIGHT_OF_FB            ; is FB completely frozen?
    bne    LF751                    ; -no, branch
    jmp    LF6DD                 ; 3

LF751:
    jmp    LFAE7                 ; 3

LF754:
    lda    $F1                   ; 3
    and    #$08                  ; 2
    beq    LF763                 ; 2³
    bit    $C5                   ; 3
    bmi    LF737                 ; 2³
    inc    screenNumP0
    jmp    LF737                 ; 3

LF763:
    bit    $C5                   ; 3
    bpl    LF7BB                 ; 2³
    lda    #7                    ; 2
    cmp    screenNumP0
    bcc    LF76F                 ; 2³
    sta    screenNumP0
LF76F:
    lda    #0                       ; clear all
    sta    addFreezeColFB
    sta    addSinkingFB
    sta    $F3                   ; 3
    sta    $F4                   ; 3
    sta    $ED                   ; 3
    lda    vPos_FB
    cmp    #$1B                  ; 2
    bne    LF78D                 ; 2³
    lda    #$0A                  ; 2   left | up
    ldx    framecounter
    cpx    #$50                  ; 2
    bcc    LF78B                 ; 2³
    lda    #6                    ; 2   right | up
LF78B:
    sta    joystickDir
LF78D:
    ldx    iceFlowFB_IsOn
    dex                          ; 2
    bpl    LF794                 ; 2³
    ldx    #3                    ; 2
LF794:
    lda    hPos_FB
    cmp    hPosIceFlows,X
    bcs    LF79C                 ; 2³
    adc    #$A0                  ; 2   RIGHT_6 = $A0?
LF79C:
    adc    #1                    ; 2
    sec                          ; 2
    sbc    hPosIceFlows,X
    cmp    #$4B                  ; 2
    bcs    LF7B3                 ; 2³
    lda    #$FF                  ; 2
    sta    $F2                   ; 3
    lda    #9                    ; 2   left | down
    bit    framecounter
    bpl    LF7B9                 ; 2³
    lda    #6                    ; 2   right | up
    bne    LF7B9                 ; 3   always branch

LF7B3:
    cpx    #2                    ; 2
    bne    LF7BB                 ; 2³
    lda    #$0A                  ; 2   left | up
LF7B9:
    sta    joystickDir
LF7BB:
    bit    $ED                   ; 3
    bpl    LF801                 ; 2³+1
    lda    $EA                   ; 3
    bne    LF801                 ; 2³+1
    lda    screenNumP0
    cmp    #3                    ; 2
    bcc    LF801                 ; 2³+1
    lda    #REFLECT
    sta    reflectFB
    lda    framecounter
    and    #$03                  ; 2
    sta    polarBearFrame
    beq    LF7DD                 ; 2³
    lda    hPos_PolarBear
    cmp    #$10                  ; 2
    bcc    LF7DD                 ; 2³
    dec    hPos_PolarBear
LF7DD:
    lda    framecounter
    lsr                          ; 2
    and    #$03                  ; 2
    sta    $EE                   ; 3
    dec    hPos_FB
    lda    #1                    ; 2
    sta    AUDC0                 ; 3
    lda    #8                    ; 2
    sta    AUDC1                 ; 3
    lda    #4                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    lda    framecounter
    asl                          ; 2
    asl                          ; 2
    and    #$1F                  ; 2
    sta    AUDF0                 ; 3
    sta    AUDF1                 ; 3
    jmp    LFAE7                 ; 3

LF801:
    lda    screenNumP0
    lsr                          ; 2
    bcc    LF818                 ; 2³
    cmp    #2                    ; 2
    bcc    LF818                 ; 2³
    lda    framecounter
    and    #$0F                  ; 2
    bne    LF818                 ; 2³
    dec    $9E                   ; 5
    bpl    LF818                 ; 2³
    lda    #$0F                  ; 2
    sta    $9E                   ; 3
LF818:
    ldx    #3                    ; 2
LF81A:
    lda    screenNumP0
    cmp    #5                    ; 2
    bcc    LF835                 ; 2³
    lda    rowEnemyType,X
    and    #$03                  ; 2
    tay                          ; 2
    lda    framecounter
    and    #$40                  ; 2
    bne    LF831                 ; 2³
    cpy    #3                    ; 2
    beq    LF872                 ; 2³
    bne    LF835                 ; 3   always branch

LF831:
    cpy    #2                    ; 2
    beq    LF872                 ; 2³
LF835:
    lda    rowEnemyType,X
    asl                          ; 2
    lda    $E0,X                 ; 4
    bcs    LF841                 ; 2³
    adc    $97                   ; 3
    jmp    LF843                 ; 3

LF841:
    sbc    $97                   ; 3
LF843:
    sta    $E0,X                 ; 4
    and    #$F8                  ; 2
    cmp    #$C8                  ; 2
    beq    LF853                 ; 2³
    lda    $E0,X                 ; 4   don't need, it's reloaded again with same value
    jsr    LFEB8                 ; 6
    jmp    LF859                 ; 3

LF853:
    jsr    LFE8B                 ; 6
    jsr    LFBCB                 ; 6
LF859:
    cpx    $F2                   ; 3
    bne    LF872                 ; 2³
    lda    rowEnemyType,X
    asl                          ; 2
    lda    hPos_FB
    bcs    LF868                 ; 2³
    adc    $97                   ; 3
    bcc    LF86A                 ; 2³
LF868:
    sbc    $97                   ; 3
LF86A:
    cmp    #$A0                  ; 2
    bcc    LF870                 ; 2³
    lda    #0                    ; 2
LF870:
    sta    hPos_FB
LF872:
    dex                          ; 2
    bpl    LF81A                 ; 2³
    ldx    #3                    ; 2
LF877:
    lda    rowEnemyType,X
    and    #$03                  ; 2
    tay                          ; 2
    lda    RowEnemyColTab,Y
    sta    colRowEnemy,X
    tya                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    #8                    ; 2
    cpy    #6                    ; 2
    bne    LF88B                 ; 2³
    asl                          ; 2
LF88B:
    and    framecounter
    bne    LF890                 ; 2³
    iny                          ; 2
LF890:
    lda    enemyLoPtrTab,Y
    sta    enemyLoPtr,X
    cpy    #2                    ; 2
    bcc    LF8AF                 ; 2³
    lda    framecounter
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$1F                  ; 2
    cmp    #$10                  ; 2
    bcc    LF8A6                 ; 2³
    eor    #$1F                  ; 2
LF8A6:
    tay                          ; 2
    lda    enemyLoPtr,X
    clc                          ; 2
    adc    LFDC2,Y               ; 4
    sta    enemyLoPtr,X
LF8AF:
    dex                          ; 2
    bpl    LF877                 ; 2³
    ldx    $EA                   ; 3
    beq    LF8B9                 ; 2³
    jmp    LF9BC                 ; 3

LF8B9:
    ldx    iceFlowFB_IsOn
    bpl    LF8CD                 ; 2³
    lda    vPos_FB
    cmp    #$1B                  ; 2
    bne    LF8C6                 ; 2³
    jmp    LF982                 ; 3

LF8C6:
    lda    #$80                  ; 2
    sta    $F1                   ; 3
    jmp    LFAE7                 ; 3

LF8CD:
    bit    $F6                   ; 3
    bpl    LF8FB                 ; 2³
    lda    colIceFlows,X
    cmp    #COL_ICEFLOW
    bne    LF8FB                 ; 2³
    lda    $F4                   ; 3
    bne    LF8DD                 ; 2³
    lda    #$8F                  ; 2
LF8DD:
    sta    $F4                   ; 3
    lda    #COL_ICEFLOW_TOUCHED
    sta    colIceFlows,X
    lda    #$10                  ; 2   ice flow touched
    sta    $F5                   ; 3
    lda    #0                    ; 2
    sta    $F6                   ; 3
    lda    $95                   ; 3
    jsr    AdjustScore
    lda    iglooBlocks
    cmp    #$0F                  ; 2
    beq    LF8FB                 ; 2³
    inc    iglooBlocks
    jmp    LF91D                 ; 3

LF8FB:
    bit    iglooBlocks
    bmi    LF91D                 ; 2³+1
    bit    $F2                   ; 3
    bpl    LF91D                 ; 2³
    bit    reverseFlowsFlag
    bpl    LF91D                    ; branch when firebutton not pressed
    ldx    iceFlowFB_IsOn           ; is FB is on the ground?
    bmi    LF91D                    ; - yes, ignore firebuttion too...
    lda    rowEnemyType,X
    eor    #$40                  ; 2
    sta    rowEnemyType,X
    lda    iglooBlocks
    cmp    #$0F                     ; is the igloo completely built?
    beq    .skipIceBlockRemoval     ; - yes, so don't take a block away
    dec    iglooBlocks              ; - no, so lose an ice block for reveserving the flow
.skipIceBlockRemoval:
    lda    #$8F                  ; 2
    sta    $F4                   ; 3
LF91D:
    ldx    iceFlowFB_IsOn
    lda    $B8                   ; 3
    bmi    LF961                 ; 2³
    tax                          ; 2
    lda    rowEnemyType,X
    and    #$03                  ; 2
    cmp    #1                    ; 2
    bne    LF94E                 ; 2³
    inc    $F7                   ; 5
    lda    hPos_FB
    clc                          ; 2
    adc    #8                    ; 2
    sec                          ; 2
    sbc    $E0,X                 ; 4
    jsr    ShiftHiNibbleToLo
    tay                          ; 2
    lda    $DC,X                 ; 4
    and    LFCDF,Y               ; 4
    sta    $DC,X                 ; 4
    jsr    LFEB8                 ; 6
    lda    #$5B                  ; 2
    sta    $F4                   ; 3
    lda    #$10                  ; 2
    sta    $E7                   ; 3
    bpl    LF961                 ; 3   always branch

LF94E:
    stx    $F2                   ; 3
    lda    rowEnemyType,X
    lsr                          ; 2
    and    #$40                  ; 2
    eor    #$40                  ; 2
    sta    tempOne
    lda    rowEnemyType,X
    and    #$8F                  ; 2
    ora    tempOne
    sta    rowEnemyType,X
LF961:
    bit    $F2                   ; 3
    bpl    LF9DB                 ; 2³
    lda    hPos_FB
    sta    tempOne
    lda    $96                   ; 3
    sta    tempTwo
    lda    rowEnemyType,X
    asl                          ; 2
    asl                          ; 2
    jsr    LFCEA                 ; 6
    cmp    #9                    ; 2
    bcs    LF97A                 ; 2³
    lda    #9                    ; 2
LF97A:
    cmp    #$97                  ; 2
    bcc    LF980                 ; 2³
    lda    #$97                  ; 2
LF980:
    sta    hPos_FB

LF982:
    lda    joystickDir
    and    #%0011                   ; check up and down directions
    cmp    #%0011
    beq    LF9DB                    ; - branch if neither up nor down are being pressed,
    lsr                             ; else check up direction...
    bcs    LF9AE                    ; - branch if "up" is not being pressed
    lda    vPos_FB
    cmp    #$1B                  ; 2  upper limit?
    bne    LF9A6                 ; 2³
    lda    #$7F                  ; 2
    sec                          ; 2
    sbc    hPos_FB
    cmp    #8                    ; 2
    bcs    LF9DB                 ; 2³
    lda    iglooBlocks
    cmp    #$0F                  ; 2
    bne    LF9DB                 ; 2³
    lda    #$80                  ; 2
    sta    $E9                   ; 3
LF9A6:
    ldx    #$1F                  ; 2
    lda    #$8F                  ; 2
    sta    $F3                   ; 3
    bne    LF9BA                 ; 3   always branch

LF9AE:
    lda    vPos_FB
  IF JUMP_OFF_SCREEN
    cmp    #$90                  ; 2
  ENDIF
    cmp    #$70                  ; 2   lower limit?
    bcs    LF9DB                 ; 2³
    ldx    #$0F                  ; 2
    lda    #$8F                  ; 2
    sta    $F3                   ; 3
LF9BA:
    stx    $EA                   ; 3
LF9BC:
    lda    framecounter
    lsr                          ; 2
    bcs    LF9DB                 ; 2³
    dex                          ; 2
    lda    LFCC0,X               ; 4
    clc                          ; 2
    adc    vPos_FB
    sta    vPos_FB
    cpx    #$10                  ; 2
    bne    LF9D0                 ; 2³
    ldx    #0                    ; 2
LF9D0:
    stx    $EA                   ; 3
    cpx    #0                    ; 2
    bne    LF9DB                 ; 2³
    stx    $ED                   ; 3
    dex                          ; 2
    stx    $F6                   ; 3
LF9DB:
    lda    vPos_FB
    cmp    #6                    ; 2
    bcs    LF9ED                 ; 2³
    lda    #0                    ; 2
    sta    vPos_FB
    sta    $E9                   ; 3
    lda    #$40                  ; 2
    sta    $F1                   ; 3
    sta    $E7                   ; 3
LF9ED:
    lda    $F5                   ; 3
    bne    LFA09                 ; 2³+1
    lda    iglooBlocks
    cmp    #$0F                     ; is the igloo completely built?
    beq    LFA09                    ; - yes, so don't change ice flows back to white color anymore
    ldx    #4-1                     ; - no, check if all rows of ice flows are blue (i.e. all rows touched)
.checkIfIceFlowsAreDone:
    lda    #COL_ICEFLOW
    cmp    colIceFlows,X
    beq    LFA09                    ; if any of the ice flows are still white, break routine
    dex
    bpl    .checkIfIceFlowsAreDone  ; checking all four rows...
    ldx    #4-1                     ; - all ice flows have been touched, but igloo not finished
.revertIceFlowsToWhite:
    sta    colIceFlows,X
    dex                             ; color the ice flows white again
    bpl    .revertIceFlowsToWhite
LFA09:
    ldx    #4-1                  ; 2
LFA0B:
    lda    hPosIceFlows,X
    sta    tempOne
    lda    $96                   ; 3
    sta    tempTwo
    lda    rowEnemyType,X
    asl                          ; 2
    asl                          ; 2
    jsr    LFCEA                 ; 6
    sta    hPosIceFlows,X
    dex                          ; 2
    bpl    LFA0B                 ; 2³
    bit    $F2                   ; 3
    bpl    LFA78                 ; 2³
    bit    $E9                   ; 3
    bpl    LFA2D                 ; 2³
    lda    #$7B                  ; 2
    sta    hPos_FB
    bne    LFA78                    ; always branch

LFA2D:
    lda    $98                   ; 3
    ldy    $EA                   ; 3
    bne    LFA37                 ; 2³
    lda    framecounter
    and    #$01                  ; 2
LFA37:
    sta    tempOne
    lda    joystickDir
    and    #$0C                     ; keep only the left & right directions
    sta    tempTwo
    lda    #$0A                  ; 2
    ldy    vPos_FB
    cpy    #$1B                  ; 2
    bne    LFA49                 ; 2³
    lda    #$11                  ; 2
LFA49:
    sta    $FA                   ; 3
    lda    hPos_FB
    lsr    tempTwo                  ; check if left direction pressed
    lsr    tempTwo
    lsr    tempTwo
    bcs    LFA60                    ; branch, if left direction is not pressed
    ldy    #8                    ; 2
    cmp    $FA                   ; 3
    bcc    LFA6C                 ; 2³
    sbc    tempOne
    jmp    LFA6C                 ; 3

LFA60:
    lsr    tempTwo
    bcs    LFA78                 ; 2³
    ldy    #0                    ; 2
    cmp    #$96                  ; 2
    bcs    LFA6C                 ; 2³
    adc    tempOne
LFA6C:
    sta    hPos_FB
    sty    tempOne
    lda    reflectFB
    and    #$10                  ; 2
    ora    tempOne
    sta    reflectFB
LFA78:
    ldx    #2                    ; 2
    lda    $EA                   ; 3
    and    #$0F                  ; 2
    cmp    #7                    ; 2
    bcs    LFA93                 ; 2³
    ldx    #0                    ; 2
    lda    joystickDir
    and    #$0C                     ; keep only the left & right directions
    cmp    #$0C                     ; is either left or right being pressed?
    beq    LFA93                    ; - no, branch
    lda    framecounter
    and    #$04
    lsr
    lsr
    tax
LFA93:
    stx    $EE                      ; X = 0,1, or 2
    ldx    reflectFB
    lda    framecounter
    and    #$3F                  ; 2
    bne    LFAB0                 ; 2³
    jsr    LowerTheTemperature
    bne    LFAA6                 ; 2³
    lda    #$10                  ; 2
    sta    $F1                   ; 3
LFAA6:
    ldx    #$10                  ; 2
    lda    hPos_FB
    cmp    hPos_PolarBear
    bcs    LFAB0                 ; 2³
    ldx    #0                    ; 2
LFAB0:
    stx    tempOne
    lda    screenNumP0
    cmp    #3                    ; 2
    bcc    LFAE7                 ; 2³
    lda    reflectFB
    and    #REFLECT
    ora    tempOne
    sta    reflectFB
    and    #$10                  ; 2
    tax                          ; 2
    lda    hPos_PolarBear
    cpx    #0                    ; 2
    bne    LFAD2                 ; 2³
    cmp    #$10                  ; 2
    bcc    LFAE7                 ; 2³
    sbc    $97                   ; 3
    jmp    LFAD8                 ; 3

LFAD2:
    cmp    #$8C                  ; 2
    bcs    LFAE7                 ; 2³
    adc    $97                   ; 3
LFAD8:
    sta    hPos_PolarBear
    ldy    polarBearFrame
    lda    $97                   ; 3
    beq    LFAE7                 ; 2³
    dey                             ; decrease bear animation frame
    bpl    .updateBearFrame         ; branch, unless the last frame is done...
    ldy    #8-1                     ; restart bear animation cycle (8 frames per cycle)
.updateBearFrame:
    sty    polarBearFrame
LFAE7:
    jmp    LoadScorePtrs

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFAEA SUBROUTINE
    bit    $C5                   ; 3
    bpl    LFAF8                 ; 2³
    lda    iglooBlocks
    sta    iglooBlocksP1
    lda    #0                    ; 2
    sta    $9E                   ; 3
    beq    LFB05                    ; always branch

LFAF8:
    lda    screenNumP0
    lsr                             ; test bit 2 (%xxxxxXxx), if clear then use normal colors
    lsr
    lsr
;normal difficulty settings
    lda    #COL_TOPSCREEN_NORM      ; background color, top most portion of screen
    ldx    #COL_MIDSCREEN_NORM      ; background color, igloo section
    ldy    #COL_BEAR_NORM
    bcc    LFB0B                    ; branch, if bit 2 was clear...
LFB05:
    lda    #COL_TOPSCREEN_ADV       ; background color, for top of screen advanced difficulty
    ldx    #COL_MIDSCREEN_ADV
    ldy    #COL_BEAR_ADV
LFB0B:
    sta    colBackground
    stx    $BC                   ; 3
    sty    colBear
    lda    iglooBlocks
    cmp    #$0F                     ; is igloo completed?
    bne    LFB2E                    ; - no, branch
    ldx    #0                    ; 2
    bit    $C5                   ; 3
    bmi    LFB24                 ; 2³
    lda    screenNumP0
    lsr                             ; test bit 2 (%xxxxxXxx)
    lsr
    lsr
    bcc    LFB2E                 ; 2³
LFB24:
    lda    framecounter
    eor    colForScroll
    and    #$08                  ; 2
    bne    LFB2E                 ; 2³
    ldx    #COL_IGLOO_ENT_FLICKER
LFB2E:
    stx    colIglooEntrance
    ldx    $BC                   ; 3
    lda    screenNumP0
    cmp    #3                    ; 2
    bcs    LFB3A                 ; 2³
    stx    colBear
LFB3A:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;called from only one spot, place in-line to save bytes

Initialization SUBROUTINE
    ldx    #$FF                     ; use DEX or TSX and save a byte
    stx    iglooBlocks
    stx    iglooBlocksP1
    ldx    #STARTING_LIVES          ; 3 lives
    stx    numOfLives
    lda    gameSelect
    lsr                             ; P0 or P1?
    bcc    LFB4D                    
    inx                             ; X=4
    stx    numOfLivesP1
LFB4D:
    bit    $C5                   ; 3
    bmi    LFB57                 ; 2³
    asl                          ; 2
    asl                          ; 2
    sta    screenNumP0
    sta    screenNumP1           ; 3
LFB57 SUBROUTINE
    ldx    #3                    ; 2
LFB59:
    lda    #COL_ICEFLOW
    sta    colIceFlows,X
    ldy    #8                    ; 2
    lda    screenNumP0
    lsr                          ; 2
    lda    HorizPosIceFlowsTab,X
    and    #$F0                  ; 2
    bcc    LFB6B                 ; 2³
    ldy    #0                    ; 2
LFB6B:
    sta    hPosIceFlows,X
    sta    rowEnemyType,X
    sty    $9E                   ; 3
    lda    HorizPosIceFlowsTab,X
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    jsr    LFEA6                 ; 6
    dex                          ; 2
    bpl    LFB59                 ; 2³
    ldx    #$0D                  ; 2
LFB80:
    lda    #0
    sta    AUDV0                    ; kill audio
    sta    AUDV1
    cpx    #5                    ; 2
    bcs    LFB8D                 ; 2³
    lda    NewScreenTab,X
LFB8D:
    sta    $E4,X                 ; 4
    dex                          ; 2
    bpl    LFB80                 ; 2³
    stx    $F2                   ; 3
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AdjustScore SUBROUTINE
    sed
    bit    $C5                   ; 3
    bmi    .exitAdjustScore
    clc
    adc    scoreBCD+2               ; add new points to the lowest register
    sta    scoreBCD+2
    bcc    .exitAdjustScore         ; if no overflow, then exit
    lda    scoreBCD+1               ; else add the overflow to the next register
    adc    #0                       ; (ie when you go from 99 to 100, there is an overflow)
    sta    scoreBCD+1
    lda    scoreBCD
    adc    #0                       ; handles overflow into 10,000's digit
    sta    scoreBCD
    lda    scoreBCD+1
    and    #$FF                     ; this is redundant, zero flag is already set/cleared by LDA instruction

;every 5000 points, increase a life, unless
;maximum lives allowed is reached...

    beq    .checkToIncreaseLives    ; has the transition from xx5,000 to xx0,000 points has occured?
    cmp    #$50                     ; if not, then check for transition from xx0,000 points to xx5,000 points as well
    bne    .exitAdjustScore         ; when neither conditions have occured, exit
.checkToIncreaseLives:
    lda    numOfLives
    cmp    #9                       ; both cats and Frosbite Bailey have a maximum of 9 lives
    bcs    .exitAdjustScore
    inc    numOfLives
.exitAdjustScore:
    cld
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LowerTheTemperature SUBROUTINE
    lda    tempBCD
    sed
    sec
    sbc    #1                       ; drop one degree less
    sta    tempBCD
    cld
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBCB SUBROUTINE
    lda    colForScroll
    and    #$07                  ; 2
    sta    tempOne
LFBD1:
    lda    screenNumP0
    cmp    #7                    ; 2
    bcc    LFBD9                 ; 2³
    lda    #7                    ; 2
LFBD9:
    cmp    tempOne
    bcs    LFBE1                 ; 2³
    dec    tempOne
    bpl    LFBD1                 ; 2³
LFBE1:
    lda    $F7                   ; 3
    cmp    #$0C                  ; 2
    bcc    LFBF1                 ; 2³
    lda    tempOne
    and    #$03                  ; 2
    cmp    #1                    ; 2
    bne    LFBF1                 ; 2³
    inc    tempOne
LFBF1:
    lda    rowEnemyType,X
    and    #$C0                  ; 2
    ora    tempOne
    sta    tempOne
    lda    colForScroll
    and    #$80                  ; 2
    jmp    LFE9B                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

FB_one:
    .byte $FF ; |XXXXXXXX| $FC00
    .byte $36 ; |  XX XX | $FC01
    .byte $36 ; |  XX XX | $FC02
    .byte $7E ; | XXXXXX | $FC03
    .byte $76 ; | XXX XX | $FC04
    .byte $6E ; | XX XXX | $FC05
    .byte $5E ; | X XXXX | $FC06
    .byte $5E ; | X XXXX | $FC07
    .byte $7C ; | XXXXX  | $FC08
    .byte $3C ; |  XXXX  | $FC09
    .byte $7E ; | XXXXXX | $FC0A
    .byte $7C ; | XXXXX  | $FC0B
    .byte $FE ; |XXXXXXX | $FC0C
    .byte $FE ; |XXXXXXX | $FC0D
    .byte $FE ; |XXXXXXX | $FC0E
    .byte $F8 ; |XXXXX   | $FC0F
    .byte $78 ; | XXXX   | $FC10
    .byte $70 ; | XXX    | $FC11
    .byte $00 ; |        | $FC12
FB_two:
    .byte $FF ; |XXXXXXXX| $FC13
    .byte $1C ; |   XXX  | $FC14
    .byte $1C ; |   XXX  | $FC15
    .byte $1C ; |   XXX  | $FC16
    .byte $7E ; | XXXXXX | $FC17
    .byte $7E ; | XXXXXX | $FC18
    .byte $76 ; | XXX XX | $FC19
    .byte $4E ; | X  XXX | $FC1A
    .byte $5E ; | X XXXX | $FC1B
    .byte $7C ; | XXXXX  | $FC1C
    .byte $3C ; |  XXXX  | $FC1D
    .byte $7E ; | XXXXXX | $FC1E
    .byte $7C ; | XXXXX  | $FC1F
    .byte $FE ; |XXXXXXX | $FC20
    .byte $FE ; |XXXXXXX | $FC21
    .byte $FE ; |XXXXXXX | $FC22
    .byte $F8 ; |XXXXX   | $FC23
    .byte $78 ; | XXXX   | $FC24
    .byte $70 ; | XXX    | $FC25
FB_three:
    .byte $00 ; |        | $FC26
    .byte $00 ; |        | $FC27
    .byte $7E ; | XXXXXX | $FC28
    .byte $14 ; |   X X  | $FC29
    .byte $7E ; | XXXXXX | $FC2A
    .byte $7E ; | XXXXXX | $FC2B
    .byte $42 ; | X    X | $FC2C
    .byte $5E ; | X XXXX | $FC2D
    .byte $7C ; | XXXXX  | $FC2E
    .byte $3C ; |  XXXX  | $FC2F
    .byte $7E ; | XXXXXX | $FC30
    .byte $FE ; |XXXXXXX | $FC31
    .byte $FE ; |XXXXXXX | $FC32
    .byte $FE ; |XXXXXXX | $FC33
    .byte $F8 ; |XXXXX   | $FC34
    .byte $78 ; | XXXX   | $FC35
    .byte $70 ; | XXX    | $FC36
    .byte $00 ; |        | $FC37
    .byte $00 ; |        | $FC38

Color_FB_Tab:
    .byte  DIRTY_YELLOW  ; $FC39   legs
    .byte  DIRTY_YELLOW  ; $FC3A
    .byte  DIRTY_YELLOW  ; $FC3B
    .byte  DIRTY_YELLOW  ; $FC3C
    .byte  GREY          ; $FC3D   upper torso
    .byte  GREY          ; $FC3E
    .byte  GREY          ; $FC3F
    .byte  GREY          ; $FC40
    .byte  GREY          ; $FC41
    .byte  GREY          ; $FC42
    .byte  PINK          ; $FC43   face
    .byte  PINK          ; $FC44
    .byte  PINK          ; $FC45
    .byte  BROWN-2       ; $FC46   hat
    .byte  BROWN-2       ; $FC47
    .byte  BROWN-2       ; $FC48
    .byte  BROWN-2       ; $FC49
    .byte  BROWN-2       ; $FC4A
    .byte  BROWN-2       ; $FC4B

ColorFreezingFB:
    .byte  BLUE-6        ; $FC4C   bottom
    .byte  BLUE-6        ; $FC4D
    .byte  BLUE-4        ; $FC4E
    .byte  BLUE-4        ; $FC4F
    .byte  BLUE-2        ; $FC50
    .byte  BLUE-2        ; $FC51
    .byte  BLUE          ; $FC52
    .byte  BLUE          ; $FC53
    .byte  BLUE          ; $FC54
    .byte  BLUE          ; $FC55
    .byte  BLUE          ; $FC56
    .byte  BLUE          ; $FC57
    .byte  BLUE          ; $FC58
    .byte  BLUE          ; $FC59
    .byte  BLUE          ; $FC5A
    .byte  BLUE          ; $FC5B
    .byte  BLUE          ; $FC5C
    .byte  BLUE          ; $FC5D
    .byte  BLUE          ; $FC5E
    .byte  BLUE          ; $FC5F   top

FB_SinkingOne:
    .byte $7E ; | XXXXXX | $FC60
    .byte $24 ; |  X  X  | $FC61
    .byte $3C ; |  XXXX  | $FC62
    .byte $7D ; | XXXXX X| $FC63
    .byte $75 ; | XXX X X| $FC64
    .byte $FF ; |XXXXXXXX| $FC65
    .byte $F7 ; |XXXX XXX| $FC66
    .byte $BE ; |X XXXXX | $FC67
    .byte $BC ; |X XXXX  | $FC68
    .byte $7E ; | XXXXXX | $FC69
    .byte $66 ; | XX  XX | $FC6A
    .byte $7E ; | XXXXXX | $FC6B
    .byte $FF ; |XXXXXXXX| $FC6C
    .byte $FF ; |XXXXXXXX| $FC6D
    .byte $FF ; |XXXXXXXX| $FC6E
    .byte $3C ; |  XXXX  | $FC6F
    .byte $3C ; |  XXXX  | $FC70
    .byte $18 ; |   XX   | $FC71
    .byte $00 ; |        | $FC72
    .byte $00 ; |        | $FC73
    .byte $00 ; |        | $FC74
    .byte $00 ; |        | $FC75
    .byte $00 ; |        | $FC76
    .byte $00 ; |        | $FC77
    .byte $00 ; |        | $FC78
    .byte $00 ; |        | $FC79
    .byte $00 ; |        | $FC7A
    .byte $00 ; |        | $FC7B
    .byte $00 ; |        | $FC7C
    .byte $00 ; |        | $FC7D
    .byte $00 ; |        | $FC7E
    .byte $00 ; |        | $FC7F
    .byte $00 ; |        | $FC80
    .byte $00 ; |        | $FC81
    .byte $00 ; |        | $FC82
    .byte $00 ; |        | $FC83
    .byte $00 ; |        | $FC84
FB_SinkingTwo:
    .byte $7E ; | XXXXXX | $FC85
    .byte $24 ; |  X  X  | $FC86
    .byte $3C ; |  XXXX  | $FC87
    .byte $BE ; |X XXXXX | $FC88
    .byte $B6 ; |X XX XX | $FC89
    .byte $FF ; |XXXXXXXX| $FC8A
    .byte $F7 ; |XXXX XXX| $FC8B
    .byte $7D ; | XXXXX X| $FC8C
    .byte $3D ; |  XXXX X| $FC8D
    .byte $66 ; | XX  XX | $FC8E
    .byte $66 ; | XX  XX | $FC8F
    .byte $7E ; | XXXXXX | $FC90
    .byte $FF ; |XXXXXXXX| $FC91
    .byte $FF ; |XXXXXXXX| $FC92
    .byte $FF ; |XXXXXXXX| $FC93
    .byte $3C ; |  XXXX  | $FC94
    .byte $3C ; |  XXXX  | $FC95
    .byte $18 ; |   XX   | $FC96
    .byte $00 ; |        | $FC97
    .byte $00 ; |        | $FC98
    .byte $00 ; |        | $FC99
    .byte $00 ; |        | $FC9A
    .byte $00 ; |        | $FC9B
    .byte $00 ; |        | $FC9C
    .byte $00 ; |        | $FC9D
    .byte $00 ; |        | $FC9E
    .byte $00 ; |        | $FC9F
    .byte $00 ; |        | $FCA0
    .byte $00 ; |        | $FCA1
    .byte $00 ; |        | $FCA2
    .byte $00 ; |        | $FCA3
    .byte $00 ; |        | $FCA4
    .byte $00 ; |        | $FCA5
    .byte $00 ; |        | $FCA6
    .byte $00 ; |        | $FCA7
    .byte $00 ; |        | $FCA8
    .byte $00 ; |        | $FCA9
FB_LoPtrTab:
    .byte <FB_one        ; $FCAA
    .byte <FB_two        ; $FCAB
    .byte <FB_three      ; $FCAC
    .byte <FB_three      ; $FCAD
    .byte <FB_SinkingOne ; $FCAE
    .byte <FB_SinkingTwo ; $FCAF
FB_LoPtrColorTab:
    .byte <Color_FB_Tab+1 ; $FCB0
    .byte <Color_FB_Tab   ; $FCB1
    .byte <Color_FB_Tab+1 ; $FCB2
    .byte <Color_FB_Tab+1 ; $FCB3
    .byte <Color_FB_Tab+1 ; $FCB4
    .byte <Color_FB_Tab+1 ; $FCB5
LFCB6:
    .byte $18 ; |   XX   | $FCB6
    .byte $18 ; |   XX   | $FCB7
    .byte $28 ; |  X X   | $FCB8
    .byte $28 ; |  X X   | $FCB9
    .byte $38 ; |  XXX   | $FCBA
    .byte $38 ; |  XXX   | $FCBB
    .byte $48 ; | X  X   | $FCBC
    .byte $58 ; | X XX   | $FCBD
    .byte $68 ; | XX X   | $FCBE
    .byte $78 ; | XXXX   | $FCBF
LFCC0:
    .byte $06 ; |     XX | $FCC0   jump table?
    .byte $05 ; |     X X| $FCC1
    .byte $05 ; |     X X| $FCC2
    .byte $05 ; |     X X| $FCC3
    .byte $04 ; |     X  | $FCC4
    .byte $03 ; |      XX| $FCC5
    .byte $02 ; |      X | $FCC6
    .byte $01 ; |       X| $FCC7
    .byte $00 ; |        | $FCC8
    .byte $00 ; |        | $FCC9
    .byte $00 ; |        | $FCCA
    .byte $00 ; |        | $FCCB
    .byte $FF ; |XXXXXXXX| $FCCC
    .byte $FE ; |XXXXXXX | $FCCD
    .byte $FE ; |XXXXXXX | $FCCE
    .byte $03 ; |      XX| $FCCF
    .byte $02 ; |      X | $FCD0
    .byte $02 ; |      X | $FCD1
    .byte $01 ; |       X| $FCD2
    .byte $00 ; |        | $FCD3
    .byte $00 ; |        | $FCD4
    .byte $00 ; |        | $FCD5
    .byte $00 ; |        | $FCD6
    .byte $FF ; |XXXXXXXX| $FCD7  affects jumping up
    .byte $FE ; |XXXXXXX | $FCD8
    .byte $FD ; |XXXXXX X| $FCD9
    .byte $FC ; |XXXXXX  | $FCDA
    .byte $FB ; |XXXXX XX| $FCDB
    .byte $FB ; |XXXXX XX| $FCDC
    .byte $FB ; |XXXXX XX| $FCDD
    .byte $FA ; |XXXXX X | $FCDE
LFCDF:
    .byte $03 ; |      XX| $FCDF   AND table
    .byte $05 ; |     X X| $FCE0
    .byte $06 ; |     XX | $FCE1
    .byte $03 ; |      XX| $FCE2
    .byte $03 ; |      XX| $FCE3
    .byte $01 ; |       X| $FCE4
    .byte $05 ; |     X X| $FCE5
    .byte $04 ; |     X  | $FCE6
    .byte $06 ; |     XX | $FCE7
    .byte $06 ; |     XX | $FCE8
    .byte $04 ; |     X  | $FCE9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFCEA SUBROUTINE
    bcs    LFCF3                 ; 2³
    lda    tempOne                  ; move ice flows right
    adc    tempTwo
    jmp    LFCF7                 ; 3

LFCF3:
    lda    tempOne                  ; move ice flows left
    sbc    tempTwo
LFCF7:
    jsr    LFF5B                 ; 6
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    nop                             ; free byte

enemyCopiesTabOne:
    .byte $01 ; |       X| $FCFC
    .byte $05 ; |     X X| $FCFD
    .byte $05 ; |     X X| $FCFE
    .byte $07 ; |     XXX| $FCFF
RowEnemyColTab:
    .byte BLUE-9         ; $FD00  geese
    .byte GREEN-12       ; $FD01  fish
    .byte PINK+2         ; $FD02  crab
    .byte YELLOW         ; $FD03  clam
NewScreenTab:
    .byte $1B            ; $FD04   $E4 - vPos_FB
    .byte $45            ; $FD05   $E5 - tempBCD
    .byte $40            ; $FD06   $E6 - hPos_FB
    .byte $40 ; | X      | $FD07   $E7 -
    .byte $8C            ; $FD08   $E8 - hPos_PolarBear
    .byte $00 ; |        | $FD09   $E9 -
enemyLoPtrTab:
    .byte <SnowGeeseOne  ; $FD0A
    .byte <SnowGeeseTwo  ; $FD0B
    .byte <FishOne       ; $FD0C
    .byte <FishTwo       ; $FD0D
    .byte <KingCrabTwo   ; $FD0E
    .byte <KingCrabOne   ; $FD0F
    .byte <KillerClamOne ; $FD10
    .byte <KillerClamTwo ; $FD11
SnowGeeseOne:
    .byte $00 ; |        | $FD12
    .byte $C0 ; |XX      | $FD13
    .byte $60 ; | XX     | $FD14
    .byte $30 ; |  XX    | $FD15
    .byte $78 ; | XXXX   | $FD16
    .byte $FC ; |XXXXXX  | $FD17
    .byte $07 ; |     XXX| $FD18
    .byte $02 ; |      X | $FD19
SnowGeeseTwo:
    .byte $00 ; |        | $FD1A
    .byte $00 ; |        | $FD1B
    .byte $40 ; | X      | $FD1C
    .byte $30 ; |  XX    | $FD1D
    .byte $78 ; | XXXX   | $FD1E
    .byte $FC ; |XXXXXX  | $FD1F
    .byte $36 ; |  XX XX | $FD20
    .byte $E4 ; |XXX  X  | $FD21
KingCrabOne:
    .byte $FF ; |XXXXXXXX| $FD22
    .byte $EB ; |XXX X XX| $FD23
    .byte $6A ; | XX X X | $FD24
    .byte $BD ; |X XXXX X| $FD25
    .byte $81 ; |X      X| $FD26
    .byte $C3 ; |XX    XX| $FD27
    .byte $E7 ; |XXX  XXX| $FD28
    .byte $42 ; | X    X | $FD29
    .byte $00 ; |        | $FD2A
    .byte $00 ; |        | $FD2B
    .byte $00 ; |        | $FD2C
    .byte $00 ; |        | $FD2D
    .byte $00 ; |        | $FD2E
    .byte $00 ; |        | $FD2F
    .byte $00 ; |        | $FD30
    .byte $00 ; |        | $FD31
KingCrabTwo:
    .byte $FF ; |XXXXXXXX| $FD32
    .byte $EB ; |XXX X XX| $FD33
    .byte $6A ; | XX X X | $FD34
    .byte $BD ; |X XXXX X| $FD35
    .byte $81 ; |X      X| $FD36
    .byte $C3 ; |XX    XX| $FD37
    .byte $A5 ; |X X  X X| $FD38
    .byte $81 ; |X      X| $FD39
    .byte $00 ; |        | $FD3A
    .byte $00 ; |        | $FD3B
    .byte $00 ; |        | $FD3C
    .byte $00 ; |        | $FD3D
    .byte $00 ; |        | $FD3E
    .byte $00 ; |        | $FD3F
    .byte $00 ; |        | $FD40
    .byte $00 ; |        | $FD41
KillerClamOne:
    .byte $3C ; |  XXXX  | $FD42
    .byte $7E ; | XXXXXX | $FD43
    .byte $D5 ; |XX X X X| $FD44
    .byte $80 ; |X       | $FD45
    .byte $80 ; |X       | $FD46
    .byte $AB ; |X X X XX| $FD47
    .byte $7E ; | XXXXXX | $FD48
    .byte $3C ; |  XXXX  | $FD49
    .byte $00 ; |        | $FD4A
    .byte $00 ; |        | $FD4B
    .byte $00 ; |        | $FD4C
    .byte $00 ; |        | $FD4D
LFD4E:
    .byte $00 ; |        | $FD4E
    .byte $00 ; |        | $FD4F
    .byte $00 ; |        | $FD50
    .byte $00 ; |        | $FD51
    .byte $01 ; |       X| $FD52
    .byte $01 ; |       X| $FD53
    .byte $01 ; |       X| $FD54
    .byte $01 ; |       X| $FD55
    .byte $02 ; |      X | $FD56
    .byte $02 ; |      X | $FD57
    .byte $02 ; |      X | $FD58
    .byte $02 ; |      X | $FD59
    .byte $03 ; |      XX| $FD5A
    .byte $03 ; |      XX| $FD5B
    .byte $04 ; |     X  | $FD5C
    .byte $04 ; |     X  | $FD5D
KillerClamTwo:
    .byte $3C ; |  XXXX  | $FD5E
    .byte $7E ; | XXXXXX | $FD5F
    .byte $FF ; |XXXXXXXX| $FD60
    .byte $D5 ; |XX X X X| $FD61
    .byte $AB ; |X X X XX| $FD62
    .byte $FF ; |XXXXXXXX| $FD63
    .byte $7E ; | XXXXXX | $FD64
    .byte $3C ; |  XXXX  | $FD65
    .byte $00 ; |        | $FD66
    .byte $00 ; |        | $FD67
    .byte $00 ; |        | $FD68
    .byte $00 ; |        | $FD69
    .byte $00 ; |        | $FD6A
    .byte $00 ; |        | $FD6B
    .byte $00 ; |        | $FD6C
FishOne:
    .byte $00 ; |        | $FD6D
    .byte $9C ; |X  XXX  | $FD6E
    .byte $CF ; |XX  XXXX| $FD6F
    .byte $7E ; | XXXXXX | $FD70
    .byte $3F ; |  XXXXXX| $FD71
    .byte $7D ; | XXXXX X| $FD72
    .byte $CE ; |XX  XXX | $FD73
    .byte $9C ; |X  XXX  | $FD74
    .byte $00 ; |        | $FD75
    .byte $00 ; |        | $FD76
    .byte $00 ; |        | $FD77
    .byte $00 ; |        | $FD78
    .byte $00 ; |        | $FD79
    .byte $00 ; |        | $FD7A
    .byte $00 ; |        | $FD7B
FishTwo:
    .byte $00 ; |        | $FD7C
    .byte $0C ; |    XX  | $FD7D
    .byte $DE ; |XX XXXX | $FD7E
    .byte $FF ; |XXXXXXXX| $FD7F
    .byte $3F ; |  XXXXXX| $FD80
    .byte $FD ; |XXXXXX X| $FD81
    .byte $DE ; |XX XXXX | $FD82
    .byte $0C ; |    XX  | $FD83
    .byte $00 ; |        | $FD84
    .byte $00 ; |        | $FD85
    .byte $00 ; |        | $FD86
    .byte $00 ; |        | $FD87
    .byte $00 ; |        | $FD88
PolarBearOne:
    .byte $00 ; |        | $FD89
    .byte $00 ; |        | $FD8A
    .byte $00 ; |        | $FD8B
    .byte $1B ; |   XX XX| $FD8C
    .byte $09 ; |    X  X| $FD8D
    .byte $3F ; |  XXXXXX| $FD8E
    .byte $1B ; |   XX XX| $FD8F
    .byte $1B ; |   XX XX| $FD90
    .byte $1F ; |   XXXXX| $FD91
    .byte $1F ; |   XXXXX| $FD92
    .byte $5F ; | X XXXXX| $FD93
    .byte $3F ; |  XXXXXX| $FD94
    .byte $7F ; | XXXXXXX| $FD95
    .byte $7F ; | XXXXXXX| $FD96
    .byte $3F ; |  XXXXXX| $FD97
    .byte $3E ; |  XXXXX | $FD98
    .byte $3C ; |  XXXX  | $FD99
    .byte $10 ; |   X    | $FD9A
    .byte $10 ; |   X    | $FD9B
PolarBearTwo:
    .byte $00 ; |        | $FD9C
    .byte $00 ; |        | $FD9D
    .byte $00 ; |        | $FD9E
    .byte $3F ; |  XXXXXX| $FD9F
    .byte $1B ; |   XX XX| $FDA0
    .byte $1B ; |   XX XX| $FDA1
    .byte $1B ; |   XX XX| $FDA2
    .byte $1F ; |   XXXXX| $FDA3
    .byte $1F ; |   XXXXX| $FDA4
    .byte $1F ; |   XXXXX| $FDA5
    .byte $7F ; | XXXXXXX| $FDA6
    .byte $7F ; | XXXXXXX| $FDA7
    .byte $7F ; | XXXXXXX| $FDA8
    .byte $3F ; |  XXXXXX| $FDA9
    .byte $3E ; |  XXXXX | $FDAA
    .byte $3C ; |  XXXX  | $FDAB
    .byte $10 ; |   X    | $FDAC
    .byte $10 ; |   X    | $FDAD
    .byte $00 ; |        | $FDAE
PolarBearThree:
    .byte $00 ; |        | $FDAF
    .byte $00 ; |        | $FDB0
    .byte $00 ; |        | $FDB1
    .byte $36 ; |  XX XX | $FDB2
    .byte $12 ; |   X  X | $FDB3
    .byte $1B ; |   XX XX| $FDB4
    .byte $1B ; |   XX XX| $FDB5
    .byte $1B ; |   XX XX| $FDB6
    .byte $1F ; |   XXXXX| $FDB7
    .byte $1F ; |   XXXXX| $FDB8
    .byte $5F ; | X XXXXX| $FDB9
    .byte $3F ; |  XXXXXX| $FDBA
    .byte $7F ; | XXXXXXX| $FDBB
    .byte $7F ; | XXXXXXX| $FDBC
    .byte $3F ; |  XXXXXX| $FDBD
    .byte $3E ; |  XXXXX | $FDBE
    .byte $3C ; |  XXXX  | $FDBF
    .byte $10 ; |   X    | $FDC0
    .byte $10 ; |   X    | $FDC1
LFDC2:
    .byte $04 ; |     X  | $FDC2  ADD to enemy lo pointer
    .byte $03 ; |      XX| $FDC3
    .byte $02 ; |      X | $FDC4
    .byte $01 ; |       X| $FDC5
    .byte $00 ; |        | $FDC6
    .byte $00 ; |        | $FDC7
    .byte $00 ; |        | $FDC8
    .byte $01 ; |       X| $FDC9
    .byte $02 ; |      X | $FDCA
    .byte $03 ; |      XX| $FDCB
    .byte $04 ; |     X  | $FDCC
    .byte $03 ; |      XX| $FDCD
    .byte $02 ; |      X | $FDCE
    .byte $01 ; |       X| $FDCF
    .byte $00 ; |        | $FDD0
    .byte $00 ; |        | $FDD1
HmoveIceFlowTab:
    .byte  LEFT_3        ; $FDD2   bottom
    .byte  LEFT_2        ; $FDD3
    .byte  LEFT_2        ; $FDD4
    .byte  RIGHT_1       ; $FDD5
    .byte  LEFT_2        ; $FDD6
LFDD7:
    .byte  LEFT_1 | 6    ; $FDD7   shared?
    .byte  LEFT_2 | 4    ; $FDD8   shared?   top
    .byte $30 ; |  XX    | $FDD9
    .byte $40 ; | X      | $FDDA
    .byte $50 ; | X X    | $FDDB
    .byte $60 ; | XX     | $FDDC
    .byte $71 ; | XXX   X| $FDDD
    .byte $83 ; |X     XX| $FDDE
    .byte $97 ; |X  X XXX| $FDDF
LFDE0:
    .byte $84 ; |X    X  | $FDE0
    .byte $83 ; |X     XX| $FDE1
    .byte $82 ; |X     X | $FDE2
    .byte $81 ; |X      X| $FDE3
    .byte $80 ; |X       | $FDE4
    .byte $90 ; |X  X    | $FDE5
    .byte $A0 ; |X X     | $FDE6
    .byte $B0 ; |X XX    | $FDE7
    .byte $C0 ; |XX      | $FDE8
    .byte $B0 ; |X XX    | $FDE9
    .byte $A0 ; |X X     | $FDEA
    .byte $90 ; |X  X    | $FDEB
    .byte $80 ; |X       | $FDEC
    .byte $81 ; |X      X| $FDED
    .byte $82 ; |X     X | $FDEE
    .byte $83 ; |X     XX| $FDEF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFDF0 SUBROUTINE
    ldx    #4                    ; 2
    lda    framecounter
    and    #$08                  ; 2
    bne    LFDF9                 ; 2³
    inx                          ; 2
LFDF9:
    stx    $EE                   ; 3
    ldx    #4                    ; 2
    stx    $E7                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ShiftHiNibbleToLo SUBROUTINE
    lsr                             ; shift high nibble into low nibble position
    lsr
    lsr
Delay14cycles SUBROUTINE
    lsr
Delay12cycles SUBROUTINE
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFE05 SUBROUTINE
    lda    #7                    ; 2
    sta    tempTwo
LFE09 SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    nop                          ;2  @5
    nop                          ;2  @7
    nop                          ;2  @9
    nop                          ;2  @11
    ldx    #$F3                  ;2  @13
    stx    NUSIZ0                ;3  @16
    stx    NUSIZ1                ;3  @19
    ldy    #1                    ;2  @21
    lda    #$40                  ;2  @23
    nop                          ;2  @25
    sta    RESP0                 ;3  @28
    sta    RESP1                 ;3  @31
    sta    RESBL                 ;3  @34
    sty    CTRLPF                ;3  @37    reflect
    sta    HMBL                  ;3  @40
    stx    HMP0                  ;3  @43
    sta    WSYNC                 ;3  @46
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sty    VDELP0                ;3  @6
    sty    VDELP1                ;3  @9
    dey                          ;2  @11
    sty    GRP0                  ;3  @14
    sty    GRP1                  ;3  @17
    sty    GRP0                  ;3  @20
    sta    tempOne               ;3  @23
    sta    HMCLR                 ;3  @26
LFE3B:
    ldy    tempTwo               ;3  @29/53
    lda    ($8F),Y               ;5  @34/58
    sta    tempOne               ;3  @37/61
    lda    ($8D),Y               ;5  @42/66
    tax                          ;2  @44/68
    lda    ($85),Y               ;5  @49/73
    sta    WSYNC                 ;3  @52/76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    GRP0                  ;3  @6
    lda    ($87),Y               ;5  @11
    sta    GRP1                  ;3  @14
    lda    ($89),Y               ;5  @19
    sta    GRP0                  ;3  @22
    lda    ($8B),Y               ;5  @27
    ldy    tempOne               ;3  @30
    sta    GRP1                  ;3  @33
    stx    GRP0                  ;3  @36
    sty    GRP1                  ;3  @39
    sta    GRP0                  ;3  @42
    dec    tempTwo               ;5  @47
    bpl    LFE3B                 ;2³ @49/50
    lda    #$80                  ;2  @51
    sta    HMP0                  ;3  @54
    sta    HMP1                  ;3  @57
    sta    WSYNC                 ;3  @60
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    #0                    ;2  @5
    sta    GRP0                  ;3  @8
    sta    GRP1                  ;3  @11
    sta    GRP0                  ;3  @14
    rts                          ;6  @20

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SwitchPlayers SUBROUTINE
    lda    #1
    eor    playerFlag               ; switch players
    sta    playerFlag
    ldx    #5
.loopSwapRegisters:
    lda    scoreBCD,X               ; swap registers:
    ldy    scoreBCD_P1,X            ;  $CD-$D3  (number of igloo blocks)
    sty    scoreBCD,X               ;  $CC-$D2  (number of lives)
    sta    scoreBCD_P1,X            ;  $CB-$D1  (screen number)
    dex                             ;  $CA-$D0  (100,000's and 10,000's)
    bpl    .loopSwapRegisters       ;  $C9-$CF  (1,000's and 100's)
    rts                             ;  $C8-$CE  (10's and 1's)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFE8B SUBROUTINE
    ldy    #2                    
.loopScrollColor:
    lda    colForScroll
    asl                          
    asl                          
    asl                             ; times by 8
    eor    colForScroll
    asl                          ; 2
    rol    colForScroll
    dey                          ; 2
    bpl    .loopScrollColor               
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;jumped to from LFBCB SUBROUTINE

LFE9B:
    eor    tempOne
    sta    rowEnemyType,X
    asl                          ; 2
    lda    #$A8                  ; 2
    bcs    LFEA6                 ; 2³
    lda    #$D8                  ; 2
LFEA6 SUBROUTINE
    sta    $E0,X                 ; 4
    lda    screenNumP0
    cmp    #3                    ; 2
    bne    LFEB0                 ; 2³
    lda    #0                    ; 2
LFEB0:
    and    #$03                  ; 2
    tay                          ; 2
    lda    enemyCopiesTabOne,Y
    sta    $DC,X                 ; 4
LFEB8 SUBROUTINE
    lda    $E0,X                 ; 4
    ldy    #8                    ; 2
    cmp    #$80                  ; 2
    bcc    LFEC6                 ; 2³
    sbc    #$80                  ; 2
    jsr    ShiftHiNibbleToLo
    tay                          ; 2
LFEC6:
    lda    $DC,X                 ; 4
    and    LFDD7,Y               ; 4
    tay                          ; 2
    lda    EnemyNusizTab,Y
    and    #$0F                     ; keep only size & copy portion
    sta    enemyNusiz,X
    tya                          ; 2
    beq    LFEE4                 ; 2³
    lda    EnemyNusizTab,Y
    and    #$F0                  ; 2
    clc                          ; 2
    adc    $E0,X                 ; 4
    cmp    #$A0                  ; 2
    bcc    LFEE4                 ; 2³
    sbc    #$60                  ; 2
LFEE4:
    sta    hPosEnemies,X                 ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PolarBearLoPtrTab:
    .byte <PolarBearOne   ; $FEE7
    .byte <PolarBearOne   ; $FEE8
    .byte <PolarBearTwo   ; $FEE9
    .byte <PolarBearTwo   ; $FEEA
    .byte <PolarBearThree ; $FEEB
    .byte <PolarBearThree ; $FEEC
    .byte <PolarBearTwo   ; $FEED
    .byte <PolarBearTwo   ; $FEEE
HorizPosIceFlowsTab:
    .byte $1A ; |   XX X | $FEEF   bottom
    .byte $5C ; | X XXX  | $FEF0
    .byte $1B ; |   XX XX| $FEF1   hPos | something else
    .byte $5D ; | X XXX X| $FEF2   top
IglooEntrance:
    .byte $FF ; |XXXXXXXX| $FEF3
    .byte $FF ; |XXXXXXXX| $FEF4
    .byte $FF ; |XXXXXXXX| $FEF5
    .byte $FF ; |XXXXXXXX| $FEF6
    .byte $FF ; |XXXXXXXX| $FEF7
    .byte $FF ; |XXXXXXXX| $FEF8
    .byte $FF ; |XXXXXXXX| $FEF9
    .byte $7E ; | XXXXXX | $FEFA
    .byte $00 ; |        | $FEFB
    .byte $00 ; |        | $FEFC
    .byte $00 ; |        | $FEFD
    .byte $00 ; |        | $FEFE

    nop                             ; free byte before next page

Zero:
    .byte $3C ; |  XXXX  | $FF00
    .byte $66 ; | XX  XX | $FF01
    .byte $66 ; | XX  XX | $FF02
    .byte $66 ; | XX  XX | $FF03
    .byte $66 ; | XX  XX | $FF04
    .byte $66 ; | XX  XX | $FF05
    .byte $66 ; | XX  XX | $FF06
    .byte $3C ; |  XXXX  | $FF07
One:
    .byte $3C ; |  XXXX  | $FF08
    .byte $18 ; |   XX   | $FF09
    .byte $18 ; |   XX   | $FF0A
    .byte $18 ; |   XX   | $FF0B
    .byte $18 ; |   XX   | $FF0C
    .byte $18 ; |   XX   | $FF0D
    .byte $38 ; |  XXX   | $FF0E
    .byte $18 ; |   XX   | $FF0F
Two:
    .byte $7E ; | XXXXXX | $FF10
    .byte $60 ; | XX     | $FF11
    .byte $60 ; | XX     | $FF12
    .byte $3C ; |  XXXX  | $FF13
    .byte $06 ; |     XX | $FF14
    .byte $06 ; |     XX | $FF15
    .byte $46 ; | X   XX | $FF16
    .byte $3C ; |  XXXX  | $FF17
Three:
    .byte $3C ; |  XXXX  | $FF18
    .byte $46 ; | X   XX | $FF19
    .byte $06 ; |     XX | $FF1A
    .byte $0C ; |    XX  | $FF1B
    .byte $0C ; |    XX  | $FF1C
    .byte $06 ; |     XX | $FF1D
    .byte $46 ; | X   XX | $FF1E
    .byte $3C ; |  XXXX  | $FF1F
Four:
    .byte $0C ; |    XX  | $FF20
    .byte $0C ; |    XX  | $FF21
    .byte $0C ; |    XX  | $FF22
    .byte $7E ; | XXXXXX | $FF23
    .byte $4C ; | X  XX  | $FF24
    .byte $2C ; |  X XX  | $FF25
    .byte $1C ; |   XXX  | $FF26
    .byte $0C ; |    XX  | $FF27
Five:
    .byte $7C ; | XXXXX  | $FF28
    .byte $46 ; | X   XX | $FF29
    .byte $06 ; |     XX | $FF2A
    .byte $06 ; |     XX | $FF2B
    .byte $7C ; | XXXXX  | $FF2C
    .byte $60 ; | XX     | $FF2D
    .byte $60 ; | XX     | $FF2E
    .byte $7E ; | XXXXXX | $FF2F
Six:
    .byte $3C ; |  XXXX  | $FF30
    .byte $66 ; | XX  XX | $FF31
    .byte $66 ; | XX  XX | $FF32
    .byte $66 ; | XX  XX | $FF33
    .byte $7C ; | XXXXX  | $FF34
    .byte $60 ; | XX     | $FF35
    .byte $62 ; | XX   X | $FF36
    .byte $3C ; |  XXXX  | $FF37
Seven:
    .byte $18 ; |   XX   | $FF38
    .byte $18 ; |   XX   | $FF39
    .byte $18 ; |   XX   | $FF3A
    .byte $18 ; |   XX   | $FF3B
    .byte $0C ; |    XX  | $FF3C
    .byte $06 ; |     XX | $FF3D
    .byte $42 ; | X    X | $FF3E
    .byte $7E ; | XXXXXX | $FF3F
Eight:
    .byte $3C ; |  XXXX  | $FF40
    .byte $66 ; | XX  XX | $FF41
    .byte $66 ; | XX  XX | $FF42
    .byte $3C ; |  XXXX  | $FF43
    .byte $3C ; |  XXXX  | $FF44
    .byte $66 ; | XX  XX | $FF45
    .byte $66 ; | XX  XX | $FF46
    .byte $3C ; |  XXXX  | $FF47
Nine:
    .byte $3C ; |  XXXX  | $FF48
    .byte $46 ; | X   XX | $FF49
    .byte $06 ; |     XX | $FF4A
    .byte $3E ; |  XXXXX | $FF4B
    .byte $66 ; | XX  XX | $FF4C
    .byte $66 ; | XX  XX | $FF4D
    .byte $66 ; | XX  XX | $FF4E
    .byte $3C ; |  XXXX  | $FF4F
BlankDigit:
    .byte $00 ; |        | $FF50
    .byte $00 ; |        | $FF51
    .byte $00 ; |        | $FF52
DegreeSymbol:
    .byte $00 ; |        | $FF53   shared
    .byte $00 ; |        | $FF54   shared
    .byte $00 ; |        | $FF55   shared
    .byte $00 ; |        | $FF56   shared
    .byte $00 ; |        | $FF57   shared
    .byte $E0 ; |XXX     | $FF58
    .byte $A0 ; |X X     | $FF59
    .byte $E0 ; |XXX     | $FF5A

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFF5B SUBROUTINE
    cmp    #$F0                  ; 2   RIGHT_1  = $F0?
    bcc    LFF61                 ; 2³
    sbc    #$60                  ; 2   LEFT_6   = $60?
LFF61:
    cmp    #$A0                  ; 2   RIGHT_6  = $A0?
    bcc    LFF67                 ; 2³
    sbc    #$A0                  ; 2   RIGHT_6  = $A0?
LFF67:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;          X XXXXXXXX    XXXXXXX
;         XX    X   X   XX
;        XXX XX X X X  XX  XXX X XXX X  X
;       XX X X  X X X XX X X   X X X XX X
;      XXXXX X  X X XXX  X XXX X X X XXXX
;     XX   X X  X X XX   X   X X X X X XX
;    XX    X XX X X X    X XXX X XXX X  X

LogoOne:
    .byte $0C ; |    XX  | $FF68
    .byte $06 ; |     XX | $FF69
    .byte $03 ; |      XX| $FF6A
    .byte $01 ; |       X| $FF6B
    .byte $00 ; |        | $FF6C
    .byte $00 ; |        | $FF6D
    .byte $00 ; |        | $FF6E
    .byte $00 ; |        | $FF6F
LogoTwo:
    .byte $2D ; |  X XX X| $FF70
    .byte $29 ; |  X X  X| $FF71
    .byte $E9 ; |XXX X  X| $FF72
    .byte $A9 ; |X X X  X| $FF73
    .byte $ED ; |XXX XX X| $FF74
    .byte $61 ; | XX    X| $FF75
    .byte $2F ; |  X XXXX| $FF76
    .byte $00 ; |        | $FF77
LogoThree:
    .byte $50 ; | X X    | $FF78
    .byte $58 ; | X XX   | $FF79
    .byte $5C ; | X XXX  | $FF7A
    .byte $56 ; | X X XX | $FF7B
    .byte $53 ; | X X  XX| $FF7C
    .byte $11 ; |   X   X| $FF7D
    .byte $F0 ; |XXXX    | $FF7E
    .byte $00 ; |        | $FF7F
LogoFour:
    .byte $BA ; |X XXX X | $FF80
    .byte $8A ; |X   X X | $FF81
    .byte $BA ; |X XXX X | $FF82
    .byte $A2 ; |X X   X | $FF83
    .byte $3A ; |  XXX X | $FF84
    .byte $80 ; |X       | $FF85
    .byte $FE ; |XXXXXXX | $FF86
    .byte $00 ; |        | $FF87
LogoFive:
    .byte $E9 ; |XXX X  X| $FF88
    .byte $AB ; |X X X XX| $FF89
    .byte $AF ; |X X XXXX| $FF8A
    .byte $AD ; |X X XX X| $FF8B
    .byte $E9 ; |XXX X  X| $FF8C
    .byte $00 ; |        | $FF8D
    .byte $00 ; |        | $FF8E
    .byte $00 ; |        | $FF8F

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;    XXXX                X     X   X    X XXX XXX XXX
;    X  X                      X  XXX   X X X X X   X
;    X    XXX XXX X X XX X XXX XXX X    X XXX XXX  XX
;    X  X X X X X X X X  X X X X X X    X   X X X   X
;    XXXX XXX XXX XXX X  X XXX X X X    X   X XXX XXX
;             X     X        X
;             X   XXX      XXX

CopyrightOne:
    .byte $00 ; |        | $FF90
    .byte $00 ; |        | $FF91
    .byte $00 ; |        | $FF92
    .byte $F7 ; |XXXX XXX| $FF93
    .byte $95 ; |X  X X X| $FF94
    .byte $87 ; |X    XXX| $FF95
    .byte $90 ; |X  X    | $FF96
    .byte $F0 ; |XXXX    | $FF97
CopyrightTwo:
    .byte $00 ; |        | $FF98
    .byte $47 ; | X   XXX| $FF99
    .byte $41 ; | X     X| $FF9A
    .byte $77 ; | XXX XXX| $FF9B
    .byte $55 ; | X X X X| $FF9C
    .byte $75 ; | XXX X X| $FF9D
    .byte $00 ; |        | $FF9E
    .byte $00 ; |        | $FF9F
CopyrightThree:
    .byte $00 ; |        | $FFA0
    .byte $03 ; |      XX| $FFA1
    .byte $00 ; |        | $FFA2
    .byte $4B ; | X  X XX| $FFA3
    .byte $4A ; | X  X X | $FFA4
    .byte $6B ; | XX X XX| $FFA5
    .byte $00 ; |        | $FFA6
    .byte $08 ; |    X   | $FFA7
CopyrightFour:
    .byte $00 ; |        | $FFA8
    .byte $80 ; |X       | $FFA9
    .byte $80 ; |X       | $FFAA
    .byte $AA ; |X X X X | $FFAB
    .byte $AA ; |X X X X | $FFAC
    .byte $BA ; |X XXX X | $FFAD
    .byte $27 ; |  X  XXX| $FFAE
    .byte $22 ; |  X   X | $FFAF
CopyrightFive:
    .byte $00 ; |        | $FFB0
    .byte $00 ; |        | $FFB1
    .byte $00 ; |        | $FFB2
    .byte $11 ; |   X   X| $FFB3
    .byte $11 ; |   X   X| $FFB4
    .byte $17 ; |   X XXX| $FFB5
    .byte $15 ; |   X X X| $FFB6
    .byte $17 ; |   X XXX| $FFB7
CopyrightSix:
    .byte $00 ; |        | $FFB8
    .byte $00 ; |        | $FFB9
    .byte $00 ; |        | $FFBA
    .byte $77 ; | XXX XXX| $FFBB
    .byte $51 ; | X X   X| $FFBC
    .byte $73 ; | XXX  XX| $FFBD
    .byte $51 ; | X X   X| $FFBE
    .byte $77 ; | XXX XXX| $FFBF

LogoBarColorsTab:
    .byte  BLUE-20       ; $FFC0
    .byte  GREEN         ; $FFC1
    .byte  GREEN         ; $FFC2
    .byte  YELLOW        ; $FFC3
    .byte  BROWN         ; $FFC4
    .byte  BROWN         ; $FFC5
    .byte  RED           ; $FFC6
    .byte  BLACK         ; $FFC7
EnemyNusizTab:
    .byte $00 ; |        | $FFC8   missile 1 clock | one copy
    .byte $20 ; |  X     | $FFC9  missile 4 clocks | one copy
    .byte $10 ; |   X    | $FFCA  missile 2 clocks | one copy
    .byte $11 ; |   X   X| $FFCB  missile 2 clocks | two copies close
    .byte $00 ; |        | $FFCC   missile 1 clock | one copy
    .byte $02 ; |      X | $FFCD   missile 1 clock | two copies med
    .byte $01 ; |       X| $FFCE   missile 1 clock | two copies close
    .byte $03 ; |      XX| $FFCF   missile 1 clock | three copies close

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFFD0 SUBROUTINE
    sta    tempOne
    jsr    ShiftHiNibbleToLo
    sta    $96,X                 ; 4
    lda    tempOne
    and    #$0F                  ; 2
    clc                          ; 2
    adc    $99,X                 ; 4
    cmp    #$10                  ; 2
    bcc    LFFE4                 ; 2³
    inc    $96,X                 ; 6
LFFE4:
    and    #$0F                  ; 2
    sta    $99,X                 ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

iglooShapeTab:
    .byte $03 ; |      XX| $FFE9   bottom row, 1st ice block
    .byte $0F ; |    XXXX| $FFEA   2nd
    .byte $3F ; |  XXXXXX| $FFEB   3rd
    .byte $FF ; |XXXXXXXX| $FFEC   4th

    .byte $C0 ; |XX      | $FFED   second row, 1st block
    .byte $F0 ; |XXXX    | $FFEE   2nd
    .byte $FC ; |XXXXXX  | $FFEF   3rd
    .byte $FF ; |XXXXXXXX| $FFF0   4th

    .byte $03 ; |      XX| $FFF1   third row, 1st block
    .byte $0F ; |    XXXX| $FFF2   2nd
    .byte $3F ; |  XXXXXX| $FFF3   3rd
    .byte $FF ; |XXXXXXXX| $FFF4   4th

    .byte $70 ; | XXX    | $FFF5   fourth row, 1st block
    .byte $7E ; | XXXXXX | $FFF6   2nd

    .byte $3C ; |  XXXX  | $FFF7   top row, 1st block
    .byte $3C ; |  XXXX  | $FFF8   2nd, duplicate... but it's used

ColScoreTab:
    .byte $8E ; |X   XXX | $FFF9   P0 - color for number displays
    .byte $BA ; |X XXX X | $FFFA   P1 - color for number displays

    nop                             ; free byte

       ORG $FFFC

    .word START,START
