; Rough Disassembly of Alpha Beam With Ernie (PAL), and PAL proto of David Williams
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
;
;
; Command Line: distella -pasfcAlpha1.cfg AlphaPAL.1 > Alpha(re1).asm
;
; Alpha1.cfg contents:
;
;      ORG B000
;      CODE B000 B4C5
;      GFX B4C6 B4DB
;      CODE B4DC BA29
;      GFX BA2A BFEF
;      CODE BFF0 BFF5
;      GFX BFF6 BFFF
;
; Command Line: distella -pasfcAlpha2.cfg AlphaPAL.2 > Alpha(re2).asm
;
; Alpha2.cfg contents:
;
;      ORG F000
;      CODE F000 FDBD
;      GFX FDBE FFEF
;      CODE FFF0 FFF5
;      GFX FFF6 FFFF

      processor 6502

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
NUSIZ0  =  $04
NUSIZ1  =  $05
COLUP0  =  $06
COLUP1  =  $07
COLUPF  =  $08
CTRLPF  =  $0A
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
RESM0   =  $12
RESM1   =  $13
RESBL   =  $14
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
HMM1    =  $23
HMBL    =  $24
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXP0FB  =  $32
CXP1FB  =  $33
INPT0   =  $38     ; lots of inputs checked, due to the kids controller...
INPT1   =  $39
INPT2   =  $3A
INPT3   =  $3B
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWACNT  =  $0281
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

BANK_0        =  $FFF8
BANK_1        =  $BFF9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SWITCHES & USER CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0 = off, 1 = on

PAL_PROTO           = 0

  IF PAL_PROTO
TIME_PARTIAL_TRIP   = $69   ; amount of time for planet screen, other planets then earth...
TIME_AFTER_WAVING   = $38   ; amount of time after music stops, when ernie waves
TIME_UNTIL_NO_VOL   = $30   ; checkpoint to cut volume, for a partial trip (or no fuel cells)
COL_TITLE_LOGO      = $38   ; slightly brighter in proto
COL_LEG_ERNIE       = $58   ; green color in proto as opposed to blue

COL_SATURN          = $AC   ; darker in proto
COL_EARTH           = $BA   ; darker in proto

;beam flashing colors (get OR'd with $40)
;top beam
COL_BEAM_1          = $0C
COL_BEAM_2          = $0A
COL_BEAM_3          = $08
COL_BEAM_4          = $06   ; both top and bottom beams use the
COL_BEAM_5          = $04   ; same values in the proto version,
COL_BEAM_6          = $06   ; the proto version has a brighter beam too..
COL_BEAM_7          = $08
COL_BEAM_8          = $0A

;bottom beam
COL_BEAM_9          = $0C
COL_BEAM_10         = $0A
COL_BEAM_11         = $08
COL_BEAM_12         = $06
COL_BEAM_13         = $04
COL_BEAM_14         = $06
COL_BEAM_15         = $08
COL_BEAM_16         = $0A
;values at bankswitching hotspots can't be read by the Atari
HOTSPOT             = $00

  ELSE
TIME_PARTIAL_TRIP   = $63
TIME_AFTER_WAVING   = $34
TIME_UNTIL_NO_VOL   = $27
COL_TITLE_LOGO      = $36
COL_LEG_ERNIE       = $C8

COL_SATURN          = $AA
COL_EARTH           = $BC

;top beam
COL_BEAM_1          = $0A
COL_BEAM_2          = $08
COL_BEAM_3          = $06
COL_BEAM_4          = $04
COL_BEAM_5          = $02
COL_BEAM_6          = $04
COL_BEAM_7          = $06
COL_BEAM_8          = $08
;bottom beam
COL_BEAM_9          = $08
COL_BEAM_10         = $06
COL_BEAM_11         = $04
COL_BEAM_12         = $02
COL_BEAM_13         = $00
COL_BEAM_14         = $02
COL_BEAM_15         = $04
COL_BEAM_16         = $06

HOTSPOT             = $FF

  ENDIF


;HMPx
LEFT_7              = $70
LEFT_6              = $60
LEFT_5              = $50
LEFT_4              = $40
LEFT_3              = $30
LEFT_2              = $20
LEFT_1              = $10
NO_MOTION           = $00
RIGHT_1             = $F0
RIGHT_2             = $E0
RIGHT_3             = $D0
RIGHT_4             = $C0
RIGHT_5             = $B0
RIGHT_6             = $A0
RIGHT_7             = $90
RIGHT_8             = $80

BALL_1CLK           = $00
BALL_2CLKS          = $10
BALL_4CLKS          = $20
BALL_8CLKS          = $30
ENABLE_BALL         = $02
DISABLE_BALL        = $00

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
frameCounter        = $97

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $B000


    jmp    (LBFFC)               ; 5

START_BANK0:
    lda    #<START_BANK1         ; 2
    sta    $F3                   ; 3
    lda    #>START_BANK1         ; 2
    sta    $F4                   ; 3
    jmp    LBFF0                 ; 3   bankswitch, goto clear loop

LB00E:  ; indirect jump
    ldy    #$E3                  ; 2   # of scanlines to iterate...
LB010:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    LB010                 ; 2³
    jmp    LBA1D                 ; 3

LB018:  ; indirect jump
    ldy    #$57                  ; 2
    jsr    Position_And_Enable_Ball ; 6
    ldx    #7                    ; 2
LB01F:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LB01F                 ; 2³
    jsr    LB18E                 ; 6
    lda    #RIGHT_1              ; 2
    sta    HMM0                  ; 3
    lda    #2                    ; 2
    sta    ENAM0                 ; 3
    ldx    #6                    ; 2
LB031:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    dex                          ; 2
    bne    LB031                 ; 2³
    ldy    #$13                  ; 2   # of scanlines mid ship
    lda    #$44                  ; 2
    sta    COLUP1                ; 3
    lda    #$25                  ; 2
    sta    CTRLPF                ; 3
    lda    #RIGHT_2              ; 2
    sta    HMP0                  ; 3
    lda    #LEFT_3               ; 2
    sta    HMBL                  ; 3
    lda    #NO_MOTION            ; 2
    sta.w  RESP1                 ; 4
    sta    RESP0                 ; 3
    sta    HMM0                  ; 3
    lda    #$30                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #RIGHT_4              ; 2
    sta    HMP1                  ; 3
    sta    RESBL                 ; 3
    lda    #$FE                  ; 2
    sta    PF2                   ; 3
    sta    ENABL                 ; 3
    lda    #$46                  ; 2
    sta    COLUP0                ; 3
    dey                          ; 2
LB06A:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ColSmlRocketTab-1,Y   ; 4
    sta    COLUPF                ; 3
    lda    ($BE),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($BC),Y               ; 5
    sta    GRP0                  ; 3
    lda    LBA42-1,Y             ; 4
    sta    HMBL                  ; 3
    beq    LB08A                 ; 2³
    bpl    LB088                 ; 2³
    lda    #LEFT_2               ; 2
    bne    LB08A                 ; 3   always branch

LB088:
    lda    #RIGHT_2              ; 2
LB08A:
    sta    HMP1                  ; 3
    sta    HMP0                  ; 3
    dey                          ; 2
    bne    LB06A                 ; 2³
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    lda    #$2C                  ; 2
    sta    COLUP0                ; 3
    lda    $CC                   ; 3
    sta    ENAM1                 ; 3
    stx    PF2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    ENABL                 ; 3
    sta    HMOVE                 ; 3
    ldx    #6                    ; 2
    lda    $D3                   ; 3
    sta    COLUP1                ; 3
    ldy    #3                    ; 2
LB0AD:
    dey                          ; 2
    bne    LB0AD                 ; 2³
    lda    #LEFT_1               ; 2
    sta    HMM0                  ; 3
    dex                          ; 2
LB0B5:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    #6                    ; 2
LB0BB:
    dey                          ; 2
    bne    LB0BB                 ; 2³
    dex                          ; 2
    bne    LB0B5                 ; 2³
    stx    ENAM0                 ; 3
    jsr    LB18E                 ; 6
    stx    HMP0                  ; 3  X=0, NO_MOTION
    stx    HMP1                  ; 3
    lda    #$0F                  ; 2
    sta    COLUPF                ; 3
    lda    #5                    ; 2
    sta    CTRLPF                ; 3
    ldx    #6                    ; 2
LB0D4:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LB0D4                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #8                    ; 2
LB0DD:
    dex                          ; 2
    bne    LB0DD                 ; 2³
    nop                          ; 2
    sta.w  RESP0                 ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #8                    ; 2
LB0E8:
    dex                          ; 2
    bne    LB0E8                 ; 2³
    nop                          ; 2
    sta.w  RESP1                 ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    $DC                   ; 3
    jsr    Position_And_Enable_Ball ; 6
    lda    #0                    ; 2
    sta    ENABL                 ; 3
    sta    ENAM1                 ; 3
    ldy    $DE                   ; 3
LB0FE:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bmi    LB116                 ; 2³
    lda    ($C0),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($C2),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($D8),Y               ; 5
    sta    COLUP0                ; 3
    lda    ($DA),Y               ; 5
    sta    COLUP1                ; 3
    jmp    LB0FE                 ; 3

LB116:
    iny                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    ldy    $DD                   ; 3
    lda    $CE                   ; 3
    sta    COLUPF                ; 3
    ldx    #$0C                  ; 2
LB123:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bmi    LB13C                 ; 2³
    lda    PlanetOne,X           ; 4
    sta    PF0                   ; 3
    lda    PlanetTwo,X           ; 4
    sta    PF1                   ; 3
    lda    PlanetThree,X         ; 4
    sta    PF2                   ; 3
    dex                          ; 2
    bne    LB123                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
LB13C:
    lda    #0                    ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$82                  ; 2
    sta    VBLANK                ; 3
    jmp    LBA1D                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Position_And_Enable_Ball SUBROUTINE
    ldx    #$11                  ; 2
LB14F:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    LB155                 ; 2³
    rts                          ; 6

LB155:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    LB15B                 ; 2³
    rts                          ; 6

LB15B:
    lda    $A7,X                 ; 4
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    stx    $F3                   ; 3
    tax                          ; 2
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    LB16C                 ; 2³
    rts                          ; 6

LB16C:
    pha                          ; 3
    pla                          ; 4
    nop                          ; 2
    nop                          ; 2
LB170:
    dex                          ; 2
    bpl    LB170                 ; 2³
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    dey                          ; 2
    bne    LB17D                 ; 2³
    rts                          ; 6

LB17D:
    sta    ENABL                 ; 3
    lda    #0                    ; 2
    ldx    $F3                   ; 3
    dex                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    LB18A                 ; 2³
    rts                          ; 6

LB18A:
    sta    ENABL                 ; 3
    bne    LB14F                 ; 3   always branch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LB18E SUBROUTINE
    ldx    #2                    ; 2
LB190:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #1                    ; 2
    sta    PF1                   ; 3
    lda    #7                    ; 2
    sta    PF2                   ; 3
    lda    #$D6                  ; 2
    sta    COLUPF                ; 3
    ldy    #4                    ; 2
LB1A0:
    dey                          ; 2
    bne    LB1A0                 ; 2³
    nop                          ; 2
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    dex                          ; 2
    bne    LB190                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LB1AC:  ;indirect jump
    lda    $F7                   ; 3
    and    #$7F                  ; 2
    tax                          ; 2
    lda    LBBF3,X               ; 4
    sta    $F3                   ; 3
    lda    LBBFA,X               ; 4
    sta    $F4                   ; 3
    jmp.ind ($00F3)              ; 5

LB1BE:  ; indirect jump
    dec    $CF                   ; 5
    bne    LB231                 ; 2³+1
    lda    $D0                   ; 3
    bne    LB1CA                 ; 2³
    ldy    $D1                   ; 3
    bmi    LB1D8                 ; 2³
LB1CA:
    ldy    $CD                   ; 3
    cmp    LB4D7,Y               ; 4
    bne    LB1D5                 ; 2³
    ldy    #$FF                  ; 2
    sty    $D1                   ; 3
LB1D5:
    jmp    LB228                 ; 3

LB1D8:
    lda    #0                    ; 2
    sta    $D2                   ; 3
    lda    #6                    ; 2
    sta    $CF                   ; 3
    ldx    $CD                   ; 3
    bne    LB1EF                 ; 2³
    lda    #$84                  ; 2
    sta    $F7                   ; 3
    lda    #1                    ; 2
    sta    $DF                   ; 3
    jmp    LB389                 ; 3

LB1EF:
    ldy    LBD07-1,X             ; 4
    sty    $CE                   ; 3
    ldy    #0                    ; 2
    cpx    #4                    ; 2
    beq    LB200                 ; 2³+1
    inx                          ; 2
    inx                          ; 2
    stx    $D2                   ; 3
    ldy    #1                    ; 2
LB200:
    sty    $F3                   ; 3
    ldx    #2                    ; 2
LB204:
    ldy    $F3                   ; 3
    txa                          ; 2
    ror                          ; 2
    ror                          ; 2
    tya                          ; 2
    rol                          ; 2
    tay                          ; 2
    lda    LBCFF,Y               ; 4
    sta    $D8,X                 ; 4
    lda    LBD03,Y               ; 4
    sta    $D9,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LB204                 ; 2³
    lda    #$0C                  ; 2
    ldy    #$1C                  ; 2
    jsr    LB497                 ; 6
    lda    #$81                  ; 2
    sta    $F7                   ; 3
    jmp    LB389                 ; 3

LB228:
    clc                          ; 2
    adc    $D1                   ; 3
    sta    $D0                   ; 3
    lda    #$13                  ; 2
    sta    $CF                   ; 3
LB231:
    jsr    LB4A6                 ; 6
    lda    $D0                   ; 3
    cmp    #2                    ; 2
    bcs    LB24A                 ; 2³
    lda    $D1                   ; 3
    bpl    LB24A                 ; 2³
    ldx    #0                    ; 2
    stx    AUDV0                 ; 3
    jsr    LB4BD                 ; 6
    ldx    #2                    ; 2
    jsr    LB4BD                 ; 6
LB24A:
    jmp    LB389                 ; 3

LB24D:  ; indirect jump
    dec    $CF                   ; 5
    bne    LB2B2                 ; 2³
    lda    $DD                   ; 3
    cmp    #$0C                  ; 2
    bne    LB2AA                 ; 2³
    lda    $E0                   ; 3
    cmp    #$0E                  ; 2
    bne    LB263                 ; 2³
    lda    $E2                   ; 3
    cmp    #1                    ; 2
    beq    LB26A                 ; 2³
LB263:
    lda    #1                    ; 2
    sta    $CF                   ; 3
    jmp    LB389                 ; 3

LB26A:
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    $E0                   ; 3
    sta    $E1                   ; 3
    ldx    $CD                   ; 3
    cpx    #4                    ; 2
    beq    LB289                 ; 2³
    lda    #6                    ; 2
    sta    $DE                   ; 3
    lda    #TIME_PARTIAL_TRIP               ; 2  $69 PAL_PROTO, $63 otherwise
    sta    $DF                   ; 3
    lda    #$84                  ; 2
    sta    $F7                   ; 3
    jmp    LB389                 ; 3

LB289:
    lda    #$82                  ; 2
    sta    $F7                   ; 3
    lda    #9                    ; 2
    sta    $D4                   ; 3
    sta    $CF                   ; 3
    lda    #2                    ; 2
    sta    $CC                   ; 3
    ldx    #8                    ; 2
    stx    $E4                   ; 3
    ldx    #$1D                  ; 2
    stx    AUDF0                 ; 3
    stx    $E5                   ; 3
    ldx    #4                    ; 2
    stx    AUDC0                 ; 3
    stx    AUDV0                 ; 3
    jmp    LB389                 ; 3

LB2AA:
    adc    #1                    ; 2
    sta    $DD                   ; 3
    lda    #6                    ; 2
    sta    $CF                   ; 3
LB2B2:
    jmp    LB389                 ; 3

LB2B5:  ; indirect jump
    dec    $CF                   ; 5
    bne    LB2DD                 ; 2³
    lda    $DE                   ; 3
    cmp    #$0E                  ; 2
    bne    LB2D5                 ; 2³
    lda    #0                    ; 2
    sta    $CC                   ; 3
    lda    #4                    ; 2
    ldy    #$0E                  ; 2
    jsr    LB497                 ; 6
    lda    #$83                  ; 2
    sta    $F7                   ; 3
    lda    #TIME_AFTER_WAVING    ; 2  longer time in the PAL proto...
    sta    $CF                   ; 3
    jmp    LB389                 ; 3

LB2D5:
    adc    #1                    ; 2
    sta    $DE                   ; 3
    lda    $D4                   ; 3
    sta    $CF                   ; 3
LB2DD:
    dec    $E4                   ; 5
    lda    $E4                   ; 3
    tax                          ; 2
    sta    $F3                   ; 3
    sec                          ; 2
    sbc    $E5                   ; 3
    tay                          ; 2
    txa                          ; 2
    and    #$07                  ; 2
    bne    LB2F5                 ; 2³
    lda    #8                    ; 2
    sta    $E4                   ; 3
    dec    $E5                   ; 5
    ldy    $E5                   ; 3
LB2F5:
    sty    AUDF0                 ; 3
    jmp    LB389                 ; 3

LB2FA:  ; indirect jump
    lda    $E0                   ; 3
    bne    LB30A                 ; 2³+1
    dec    $CF                   ; 5
    bne    LB30A                 ; 2³
    lda    #$84                  ; 2
    sta    $F7                   ; 3
    lda    #1                    ; 2
    sta    $DF                   ; 3
LB30A:
    lda    frameCounter          ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$01                  ; 2
    sta    $D2                   ; 3
    jmp    LB389                 ; 3

LB317:  ; indirect jump
    dec    $DF                   ; 5
    lda    $DF                   ; 3
    bne    LB32B                 ; 2³
    lda    #5                    ; 2
    sta    $F7                   ; 3
    lda    #3                    ; 2
    sta    $F6                   ; 3
    lda    $A3                   ; 3
    ora    #$03                  ; 2
    sta    $A3                   ; 3
LB32B:
    cmp    #TIME_UNTIL_NO_VOL               ; 2  $30 PAL_PROTO, $27 otherwise
    bne    LB333                 ; 2³
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
LB333:
    jmp    LB389                 ; 3

LB336:  ; indirect jump
    lda    $CF                   ; 3
    cmp    #$35                  ; 2
    beq    LB345                 ; 2³
    lda    frameCounter          ; 3
    and    #$01                  ; 2
    bne    LB36E                 ; 2³
    jsr    LB4A6                 ; 6
LB345:
    dec    $CF                   ; 5
    bne    LB35C                 ; 2³
    lda    #$0A                  ; 2
    sta    AUDF0                 ; 3
    lda    #5                    ; 2
    sta    AUDV0                 ; 3
    lda    #$80                  ; 2
    sta    $F7                   ; 3
    lda    #$13                  ; 2
    sta    $CF                   ; 3
    jmp    LB389                 ; 3

LB35C:
    lda    $CF                   ; 3
    sta    AUDF0                 ; 3
    cmp    #$1F                  ; 2
    bcc    LB369                 ; 2³
    ldx    #0                    ; 2
    jsr    LB4BD                 ; 6
LB369:
    ldx    #2                    ; 2
    jsr    LB4BD                 ; 6
LB36E:
    jmp    LB389                 ; 3

LB371:  ; indirect jump
    dec    $CF                   ; 5
    bne    LB380                 ; 2³
    lda    #$84                  ; 2
    sta    $F7                   ; 3
    lda    #$6A                  ; 2
    sta    $DF                   ; 3
    jmp    LB389                 ; 3

LB380:
    lda    $CF                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$FF                  ; 2
    sta    AUDF0                 ; 3
LB389:
    lda    #$57                  ; 2
    sec                          ; 2
    sbc    $DD                   ; 3
    sbc    $DE                   ; 3
    sta    $DC                   ; 3
    ldx    #1                    ; 2
LB394:
    lda    $E0,X                 ; 4
    beq    LB3D2                 ; 2³
    dec    $E2,X                 ; 6
    bne    LB3D2                 ; 2³
    dec    $E0,X                 ; 6
    bne    LB3A7                 ; 2³
    lda    #0                    ; 2
    sta    AUDV0,X               ; 4
    jmp    LB3D2                 ; 3

LB3A7:
    txa                          ; 2
    lsr                          ; 2
    lda    $E0,X                 ; 4
    rol                          ; 2
    tay                          ; 2
    lda    LBCBA-2,Y             ; 4
    sta    $F3                   ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LBCF7,Y               ; 4
    sta    $E2,X                 ; 4
    lda    $F3                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    #$0E                  ; 2
    bne    LB3C8                 ; 2³
    lda    #0                    ; 2
    beq    LB3D0                 ; 3   always branch

LB3C8:
    tay                          ; 2
    lda    LBCF0,Y               ; 4
    sta    AUDF0,X               ; 4
    lda    #5                    ; 2
LB3D0:
    sta    AUDV0,X               ; 4
LB3D2:
    dex                          ; 2
    bpl    LB394                 ; 2³
    ldy    $D2                   ; 3
    sty    $F3                   ; 3
    ldx    #2                    ; 2
LB3DB:
    ldy    $F3                   ; 3
    txa                          ; 2
    ror                          ; 2
    ror                          ; 2
    tya                          ; 2
    rol                          ; 2
    tay                          ; 2
    lda    LBDF8,Y               ; 4
    sta    $C0,X                 ; 4
    lda    LBE04,Y               ; 4
    sta    $C1,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LB3DB                 ; 2³
    lda    frameCounter          ; 3
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    LB4C6,X               ; 4
    ora    #$80                  ; 2
    sta    $D3                   ; 3
    lda    #0                    ; 2
    sta    $F3                   ; 3
    lda    frameCounter          ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LBC07,Y               ; 4
    ldx    $D0                   ; 3
    and    LB4CE,X               ; 4
    beq    LB414                 ; 2³
    inc    $F3                   ; 5
LB414:
    lda    LB4CE,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    $F3                   ; 3
    sta    $F3                   ; 3
    ldx    #$11                  ; 2
LB422:
    lda    $7F,X                 ; 4
    sec                          ; 2
    sbc    $F3                   ; 3
    cmp    #$0A                  ; 2
    bcs    LB42D                 ; 2³
    adc    #$90                  ; 2
LB42D:
    sta    $7F,X                 ; 4
    dex                          ; 2
    bne    LB422                 ; 2³
    ldx    #$11                  ; 2
LB434:
    lda    $7F,X                 ; 4
    ldy    #$FF                  ; 2
    cmp    #$52                  ; 2
    bcc    LB440                 ; 2³
    sbc    #$4B                  ; 2
    ldy    #4                    ; 2
LB440:
    cpx    #2                    ; 2
    adc    #2                    ; 2
LB444:
    iny                          ; 2
    sbc    #$0F                  ; 2
    bcs    LB444                 ; 2³
    eor    #$FF                  ; 2
    sbc    #6                    ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $F3                   ; 3
    tya                          ; 2
    and    #$0F                  ; 2
    ora    $F3                   ; 3
    sta    $A7,X                 ; 4
    dex                          ; 2
    bne    LB434                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #6                    ; 2
LB461:
    dex                          ; 2
    bne    LB461                 ; 2³
    pha                          ; 3
    sta    RESM0                 ; 3
    pla                          ; 4
    lda    #LEFT_1               ; 2
    ldy    #LEFT_2               ; 2  check y is reloaded
    sta    RESM1                 ; 3
    sta    HMM0                  ; 3
    sty    HMM1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$2C                  ; 2
    sta    COLUP0                ; 3
    lda    #$30                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$0F                  ; 2
    sta    COLUPF                ; 3
    lda    #RIGHT_2              ; 2
    sta    HMP0                  ; 3
    stx    HMM0                  ; 3   X=0, NO_MOTION
    stx    HMM1                  ; 3
    lda    #<LF55D               ; 2
    sta    $F3                   ; 3
    lda    #>LF55D               ; 2
    sta    $F4                   ; 3
    jmp    LBFF0                 ; 3   bankswitch, goto LF55D

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LB497 SUBROUTINE
    sta    AUDC0                 ; 3
    sta    AUDC1                 ; 3
    sty    $E0                   ; 3
    sty    $E1                   ; 3
    lda    #1                    ; 2
    sta    $E2                   ; 3
    sta    $E3                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LB4A6  SUBROUTINE
    lda    #$B2                  ; 2
    sta    $BD                   ; 3
    sta    $BF                   ; 3
    lda    frameCounter          ; 3
    sta    $F3                   ; 3
    ror                          ; 2
    ror                          ; 2
    eor    $F3                   ; 3
    adc    #$4D                  ; 2
    sta    $BC                   ; 3
    eor    frameCounter          ; 3
    sta    $BE                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LB4BD SUBROUTINE
    lda    #<BlankSpace          ; 2
    sta    $BC,X                 ; 4
    lda    #>BlankSpace          ; 2
    sta    $BD,X                 ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LB4C6:
    .byte $02 ; |      X | $B4C6
    .byte $04 ; |     X  | $B4C7
    .byte $06 ; |     XX | $B4C8
    .byte $08 ; |    X   | $B4C9
    .byte $0A ; |    X X | $B4CA
    .byte $08 ; |    X   | $B4CB
    .byte $06 ; |     XX | $B4CC
    .byte $04 ; |     X  | $B4CD
LB4CE:
    .byte $00 ; |        | $B4CE
    .byte $08 ; |    X   | $B4CF
    .byte $10 ; |   X    | $B4D0
    .byte $18 ; |   XX   | $B4D1
    .byte $20 ; |  X     | $B4D2
    .byte $28 ; |  X X   | $B4D3
    .byte $30 ; |  XX    | $B4D4
    .byte $38 ; |  XXX   | $B4D5
    .byte $40 ; | X      | $B4D6
LB4D7:
    .byte $48 ; | X  X   | $B4D7
    .byte $03 ; |      XX| $B4D8
    .byte $05 ; |     X X| $B4D9
    .byte $07 ; |     XXX| $B4DA
    .byte $09 ; |    X  X| $B4DB

LB4DC:  ; indirect jump
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #0                    ; 2
    stx    NUSIZ1                ; 3
    inx                          ; 2
    stx    CTRLPF                ; 3
;load color for "Alpha Beam"
    lda    #COL_TITLE_LOGO       ; 2  $38 PAL_PROTO, $36 otherwise
    eor    $90                   ; 3
    and    $92                   ; 3
    sta    COLUPF                ; 3
    ldx    #6                    ; 2
    lda    frameCounter          ; 3
    bmi    LB502                 ; 2³+1
LB4F3:
    lda    AtariOne,X            ; 4
    sta    $80,X                 ; 4
    lda    AtariTwo,X            ; 4
    sta    $88,X                 ; 4
    dex                          ; 2
    bpl    LB4F3                 ; 2³
    bmi    LB50F                 ; 3   always branch

LB502:
    lda    CCWOne,X              ; 4
    sta    $80,X                 ; 4
    lda    CCWTwo,X              ; 4
    sta    $88,X                 ; 4
    dex                          ; 2
    bpl    LB502                 ; 2³
LB50F:
    ldx    #$1A                  ; 2
LB511:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LB511                 ; 2³
    ldx    #$10                  ; 2
LB518:
    lda    #5                    ; 2
    sta    $F3                   ; 3
LB51C:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    AlphaBeamOne,X        ; 4
    sta    PF1                   ; 3
    lda    AlphaBeamTwo,X        ; 4
    sta    PF2                   ; 3
    ldy    #4                    ; 2
LB52A:
    dey                          ; 2
    bpl    LB52A                 ; 2³  delay 19 cycles
    lda    AlphaBeamThree,X      ; 4
    sta.w  PF2                   ; 4
    lda    AlphaBeamFour,X       ; 4
    sta    PF1                   ; 3
    dec    $F3                   ; 5
    bne    LB51C                 ; 2³
    dex                          ; 2
    bpl    LB518                 ; 2³
    ldx    #$27                  ; 2   # of scanlines to UFO dragging letter...
LB541:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LB541                 ; 2³
    sta    HMCLR                 ; 3
    txa                          ; 2   A=0
    ldy    #$0A                  ; 2
LB54B:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    ENABL                 ; 3
    sta    CTRLPF                ; 3
    stx    COLUPF                ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    ($C4),Y               ; 5
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    ora    #$40                  ; 2
    tax                          ; 2
    lda    ($C7),Y               ; 5
    dey                          ; 2
    bne    LB54B                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    ENABL                 ; 3
    sta    CTRLPF                ; 3
    stx    COLUPF                ; 3
    ldx    #$2C                  ; 2
    stx    COLUP1                ; 3
    ldy    #$0C                  ; 2
    nop                          ; 2
    sta    HMCLR                 ; 3
LB57A:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ($C0),Y               ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    bne    LB57A                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    GRP1                  ; 3
    ldx    #$27                  ; 2
LB58B:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LB58B                 ; 2³
    stx    HMP0                  ; 3  X=$FF, RIGHT_1
    inx                          ; 2
    stx    HMP1                  ; 3  X=0, NO_MOTION
    inx                          ; 2
    stx    NUSIZ1                ; 3
    inx                          ; 2
    inx                          ; 2
    stx    NUSIZ0                ; 3
;load color for "(c) Atari 1983" or "(c) CCW 1983"
    lda    #COL_TITLE_LOGO       ; 2  $38 PAL_PROTO, $36 otherwise
    eor    $90                   ; 3
    and    $92                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    #7                    ; 2
LB5B0:
    stx    $F4                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #2                    ; 2
LB5B6:
    dey                          ; 2
    bne    LB5B6                 ; 2³
    lda    Copyright-1,X         ; 4
    sta    GRP0                  ; 3
    lda    $7F,X                 ; 4
    sta    GRP1                  ; 3
    ldy    $87,X                 ; 4
    lda    YearOne-1,X           ; 4
    sta    $F3                   ; 3
    lda    YearTwo-1,X           ; 4
    ldx    $F3                   ; 3
    sty    GRP0                  ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    ldx    $F4                   ; 3
    dex                          ; 2
    bne    LB5B0                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    jmp    LBA1D                 ; 3

LB5E2:  ; indirect jump
    ldy    #$23                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #6                    ; 2
LB5E8:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LB5E8                 ; 2³
LB5ED:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($80),Y               ; 5
    and    ($94),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($84),Y               ; 5
    and    ($98),Y               ; 5
    tax                          ; 2
    lda    ($88),Y               ; 5
    stx    GRP1                  ; 3
    and    ($9C),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($8C),Y               ; 5
    and    ($A0),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($90),Y               ; 5
    and    ($A4),Y               ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bne    LB5ED                 ; 2³+1
    sty    GRP0                  ; 3  @74
;---------------------------------------
    sty    GRP1                  ; 3  @1
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    pla                          ; 4
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
LB61F:
    dex                          ; 2
    bpl    LB61F                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $D2                   ; 3
    bit    CXP0FB                ; 3
    bvc    LB63C                 ; 2³
    ldx    #4                    ; 2
    cmp    #$57                  ; 2
    bcc    LB648                 ; 2³
    inx                          ; 2
    inx                          ; 2
    cmp    #$77                  ; 2
    bcc    LB648                 ; 2³
    inx                          ; 2
    inx                          ; 2
    bcs    LB648                 ; 3   always branch

LB63C:
    bit    CXP1FB                ; 3
    bvc    LB64E                 ; 2³
    ldx    #0                    ; 2
    cmp    #$17                  ; 2
    bcc    LB648                 ; 2³
    inx                          ; 2
    inx                          ; 2
LB648:
    lda    $D8,X                 ; 4
    ora    #$80                  ; 2
    sta    $D8,X                 ; 4
LB64E:
    sta    CXCLR                 ; 3
    ldy    #$0A                  ; 2
    ldx    #$0A                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
LB658:
    dex                          ; 2
    bne    LB658                 ; 2³
    sta    HMCLR                 ; 3
    lda    #RIGHT_8              ; 2
    sta    HMP0                  ; 3
    sta    RESP0                 ; 3
LB663:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LBC09,Y               ; 4
    and    #$04                  ; 2
    sta    GRP0                  ; 3
    lda    frameCounter          ; 3
    eor.wy $D8,Y                 ; 4
    sta    COLUP0                ; 3
    dey                          ; 2
    bne    LB663                 ; 2³
    ldy    #$0A                  ; 2
    lda    ($C4),Y               ; 5
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    ora    #$40                  ; 2
    stx    GRP0                  ; 3
    tax                          ; 2
    lda    ($C7),Y               ; 5
    dey                          ; 2
LB688:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    ENABL                 ; 3
    sta    CTRLPF                ; 3
    stx    COLUPF                ; 3
    ldx    #3                    ; 2
LB694:
    dex                          ; 2
    bne    LB694                 ; 2³
    lda    ($C4),Y               ; 5
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    ora    #$40                  ; 2
    tax                          ; 2
    lda    ($C7),Y               ; 5
    dey                          ; 2
    bne    LB688                 ; 2³
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    CTRLPF                ; 3
    sta    ENABL                 ; 3
    stx    COLUPF                ; 3
    lda    #8                    ; 2
    sta    GRP0                  ; 3
    eor    frameCounter          ; 3
    lsr                          ; 2
    sta    COLUP0                ; 3
    ldx    #8                    ; 2
LB6BD:
    dex                          ; 2
    bne    LB6BD                 ; 2³
    ldy    #$0C                  ; 2
    stx    GRP0                  ; 3
LB6C4:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ($C0),Y               ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    bne    LB6C4                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    GRP1                  ; 3
    iny                          ; 2
    sty    GRP0                  ; 3
    eor    frameCounter          ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    COLUP0                ; 3
    ldx    #5                    ; 2
LB6DE:
    dex                          ; 2
    bne    LB6DE                 ; 2³
    lda    #$31                  ; 2
    sta    NUSIZ1                ; 3
    sta    NUSIZ0                ; 3
    iny                          ; 2
    sty    ENAM0                 ; 3
    sty    ENAM1                 ; 3
    stx    GRP0                  ; 3
    lda    #$D6                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldy    #$10                  ; 2
LB6F6:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    #6                    ; 2
LB6FC:
    dex                          ; 2
    bne    LB6FC                 ; 2³
    cpy    #$0C                  ; 2
    bne    LB70F                 ; 2³
    lda    #$2C                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$30                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
LB70F:
    lda    LBA4D-1,Y             ; 4
    sta    HMM0                  ; 3
    sta    HMM1                  ; 3
    dey                          ; 2
    bne    LB6F6                 ; 2³+1
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    ENABL                 ; 3
    sty    HMBL                  ; 3   Y=0, NO_MOTION
    pha                          ; 3
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    ldx    #$35                  ; 2
    stx    CTRLPF                ; 3
    sta    RESP0                 ; 3
    lda    #LEFT_1               ; 2
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    ldy    #$D6                  ; 2
    ldx    #6                    ; 2
    sta.w  RESP1                 ; 4
    sty.w  COLUPF                ; 4
    ldy    #$0C                  ; 2
    stx.w  NUSIZ0                ; 4
    lda    ($E8),Y               ; 5
    nop                          ; 2
    sta    RESBL                 ; 3
    sta    PF2                   ; 3
    nop                          ; 2
    lda    #$1F                  ; 2
    sta    PF1                   ; 3
    ldx    #2                    ; 2
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    ENAM1                 ; 3
    stx    NUSIZ1                ; 3
    lda    BoosterRockets-1,Y    ; 4
    sta    GRP0                  ; 3
    lda    ($AC),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($A8),Y               ; 5
    sta    GRP0                  ; 3
    stx    ENABL                 ; 3
    ldx    #$F0                  ; 2
    lda    ($B0),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($B4),Y               ; 5
    sta    GRP1                  ; 3
    sta    HMCLR                 ; 3
    stx    HMBL                  ; 3   X=$02, NO_MOTION
    dey                          ; 2
    lda    ColStripesTop-1,Y     ; 4
    nop                          ; 2
    sta    COLUPF                ; 3
LB776:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    BoosterRockets-1,Y    ; 4
    sta    GRP0                  ; 3
    lda    ($E8),Y               ; 5
    sta    PF2                   ; 3
    lda    ($AC),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($A8),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($B0),Y               ; 5
    lda    ($B0),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($B4),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($B4),Y               ; 5
    lda    ColStripesTop-1,Y     ; 4
    dey                          ; 2
    sta    COLUPF                ; 3
    bne    LB776                 ; 2³
    sty    GRP0                  ; 3
    nop                          ; 2
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$1F                  ; 2
    sta    PF1                   ; 3
    lda    #$FF                  ; 2
    sta    PF2                   ; 3
    lda    #6                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$DA                  ; 2
    sta    COLUP0                ; 3
    sta    HMCLR                 ; 3
    pha                          ; 3
    pla                          ; 4
    lda    #$7F                  ; 2
    sta    PF1                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$1F                  ; 2
    sta    PF1                   ; 3
    lda    #$FF                  ; 2
    sta    PF2                   ; 3
    ldx    #8                    ; 2
LB7CA:
    dex                          ; 2
    bne    LB7CA                 ; 2³
    nop                          ; 2
    lda    #$7F                  ; 2
    sta    PF1                   ; 3
    ldy    #8                    ; 2
    lda    #$99                  ; 2
    sta    PF2                   ; 3
    lda    #$1F                  ; 2
    sta    PF1                   ; 3
LB7DC:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    lda    ($BA),Y               ; 5
    sta    GRP1                  ; 3
    ldx    #$DA                  ; 2
    stx    COLUP1                ; 3
    lda    ($BC),Y               ; 5
    tax                          ; 2
    lda    ($B8),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($BE),Y               ; 5
    lda    ($BE),Y               ; 5
    stx    GRP0                  ; 3
    ldx    #$2C                  ; 2
    sta    GRP1                  ; 3
    lda    ($EB),Y               ; 5
    sta    GRP1                  ; 3
    stx    COLUP1                ; 3
    dey                          ; 2
    bne    LB7DC                 ; 2³+1
    sta    WSYNC                 ; 3
;---------------------------------------
;this scanline is directly below the letter windows on the rocket
    sty    GRP0                  ; 3
    lda    #$1F                  ; 2   back of rocket
    sta    PF1                   ; 3
    lda    #$FF                  ; 2   midddle of rocket
    sta    PF2                   ; 3
;swapping registers
    lda    $E8                   ; 3   $E8 > $EA
    ldx    $EA                   ; 3   $EA > $E8
    stx    $E8                   ; 3
    sta    $EA                   ; 3
    lda    $C4                   ; 3   $C4 > $C6
    ldy    $C6                   ; 3   $C6 > $C4
    sty    $C4                   ; 3
    sta    $C6                   ; 3
    lda    #$7F                  ; 2   front of rocket
    sta    PF1                   ; 3
    lda    $C7                   ; 3   $C7 > $C9
    ldy    $C9                   ; 3   $C9 > $C7
    sty    $C7                   ; 3
    sta    $C9                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$1F                  ; 2   back of rocket
    sta    PF1                   ; 3
    lda    #$FF                  ; 2   midddle of rocket
    sta    PF2                   ; 3
    lda    #2                    ; 2
    sta    NUSIZ1                ; 3
    ldx    #LEFT_1               ; 2
    stx    HMBL                  ; 3
    ldx    #6                    ; 2
LB840:
    dex                          ; 2
    bne    LB840                 ; 2³  delay 29 cycles
    lda    #$7F                  ; 2   @53
    sta    PF1                   ; 3
    lda    #$2C                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldy    #$0C                  ; 2
    lda    #$1F                  ; 2
    sta    PF1                   ; 3
LB853:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    BoosterRockets-1,Y    ; 4
    sta    GRP0                  ; 3
    lda    ($E8),Y               ; 5
    sta    PF2                   ; 3
    lda    ($AE),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($AA),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($B2),Y               ; 5
    lda    ($B2),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($B6),Y               ; 5
    sta    GRP1                  ; 3
    nop                          ; 2
    lda    ColStripesBottom-1,Y  ; 4
    dey                          ; 2
    cpy    #1                    ; 2
    sta    COLUPF                ; 3
    bne    LB853                 ; 2³
    lda    BoosterRockets-1,Y    ; 4   Y=1
    nop                          ; 2
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    ($E8),Y               ; 5
    sta    PF2                   ; 3
    lda    ($AE),Y               ; 5
    sta    GRP1                  ; 3
    nop                          ; 2
    lda    ($AA),Y               ; 5
    sta    GRP0                  ; 3
    ldx    #$32                  ; 2
    lda    ($B2),Y               ; 5
    sta.w  GRP0                  ; 4
    lda    ($B6),Y               ; 5
    sta    GRP1                  ; 3
    lda    #$30                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    stx    ENAM1                 ; 3
    dey                          ; 2
    sty    GRP0                  ; 3   Y=0
    sty    GRP1                  ; 3
    sty    ENABL                 ; 3
    sty    PF2                   ; 3
;---------------------------------------
    sty    PF1                   ; 3
    pla                          ; 4
    sta.w  HMBL                  ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    lda    $D7                   ; 3
LB8B9:
    dex                          ; 2
    bpl    LB8B9                 ; 2³
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    ENABL                 ; 3
    iny                          ; 2   Y=1
    lda    ($C4),Y               ; 5
    and    #$0F                  ; 2
    ora    #$30                  ; 2
    sta    COLUPF                ; 3
    lda    #$12                  ; 2
    sta    CTRLPF                ; 3
    lda    #LEFT_1               ; 2
    sta    HMM0                  ; 3
    sta    HMM1                  ; 3
    sta    RESP0                 ; 3
    dey                          ; 2   Y=0
    sty    HMBL                  ; 3   NO_MOTION
    ldy    #$0F                  ; 2
LB8DE:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    cpy    #5                    ; 2
    bne    LB8F2                 ; 2³
    lda    #$31                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$D6                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
LB8F2:
    ldx    #5                    ; 2
LB8F4:
    dex                          ; 2
    bne    LB8F4                 ; 2³
    lda    LBA5D-1,Y             ; 4
    sta    HMM0                  ; 3
    sta    HMM1                  ; 3
    dey                          ; 2
    bne    LB8DE                 ; 2³
    sty    ENAM0                 ; 3
    sty    ENAM1                 ; 3
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    iny                          ; 2
    sty    GRP0                  ; 3
    lda    frameCounter          ; 3
    sta    COLUP0                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    pla                          ; 4
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    ldy    #$0C                  ; 2
    lda    ($C2),Y               ; 5
LB91C:
    dex                          ; 2
    bpl    LB91C                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP1                  ; 3
    lda    #$2C                  ; 2
    sta    COLUP1                ; 3
    inx                          ; 2
    stx    GRP0                  ; 3
    dey                          ; 2
    lda    #RIGHT_8              ; 2
    sta    HMP0                  ; 3
LB933:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($C2),Y               ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    bne    LB933                 ; 2³
    ldx    #7                    ; 2
LB93E:
    dex                          ; 2
    bne    LB93E                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    GRP1                  ; 3
    iny                          ; 2
    sty    GRP0                  ; 3
    lda    frameCounter          ; 3
    asl                          ; 2
    sta    COLUP0                ; 3
    ldy    #$0A                  ; 2
    lda    ($C4),Y               ; 5
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    ora    #$30                  ; 2
    tax                          ; 2
    lda    ($C7),Y               ; 5
    dey                          ; 2
LB95D:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    CTRLPF                ; 3
    sta    ENABL                 ; 3
    stx    COLUPF                ; 3
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    pha                          ; 3
    pla                          ; 4
    lda    ($C4),Y               ; 5
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    ora    #$30                  ; 2
    tax                          ; 2
    lda    ($C7),Y               ; 5
    dey                          ; 2
    bne    LB95D                 ; 2³
    pha                          ; 3
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    ENABL                 ; 3
    stx    COLUPF                ; 3
    ldy    #$0A                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LB98B:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LBC07,Y               ; 4
    and    #$04                  ; 2
    sta    GRP0                  ; 3
    lda    frameCounter          ; 3
    eor.wy $D8,Y                 ; 4
    sta    COLUP0                ; 3
    dey                          ; 2
    bne    LB98B                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    CXCLR                 ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    pla                          ; 4
    sta    HMP1                  ; 3
    pla                          ; 4
    sta    HMP0                  ; 3
    sta    RESP1                 ; 3
    ldx    $94                   ; 3
    lda    $96                   ; 3
    sta    $94                   ; 3
    stx    $96                   ; 3
    ldy    #6                    ; 2
    sty    NUSIZ0                ; 3
    ldy    #2                    ; 2
    sta    RESP0                 ; 3
    sty    NUSIZ1                ; 3
    ldx    $98                   ; 3
    lda    $9A                   ; 3
    sta    $98                   ; 3
    stx    $9A                   ; 3
    lda    #$2C                  ; 2
    sta    COLUP0                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    $9C                   ; 3
    lda    $9E                   ; 3
    sta    $9C                   ; 3
    stx    $9E                   ; 3
    ldx    $A0                   ; 3
    lda    $A2                   ; 3
    sta    $A0                   ; 3
    stx    $A2                   ; 3
    ldx    $A4                   ; 3
    lda    $A6                   ; 3
    sta    $A4                   ; 3
    stx    $A6                   ; 3
    ldy    #$23                  ; 2
LB9EC:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($82),Y               ; 5
    and    ($94),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($86),Y               ; 5
    and    ($98),Y               ; 5
    tax                          ; 2
    lda    ($8A),Y               ; 5
    stx    GRP1                  ; 3
    and    ($9C),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($8E),Y               ; 5
    and    ($A0),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($92),Y               ; 5
    and    ($A4),Y               ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bne    LB9EC                 ; 2³+1
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    ldx    #6                    ; 2
LBA18:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LBA18                 ; 2³
LBA1D:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #<LF003               ; 2
    sta    $F3                   ; 3
    lda    #>LF003               ; 2
    sta    $F4                   ; 3
    jmp    LBFF0                 ; 3   bankswitch, goto LF003

    .byte $00 ; |        | $BA2A
    .byte $00 ; |        | $BA2B
    .byte $00 ; |        | $BA2C
    .byte $00 ; |        | $BA2D
ColStripesBottom:
    .byte $00 ; |        | $BA2E
    .byte $D6 ; |XX X XX | $BA2F  very bottom stripe
    .byte $D2 ; |XX X  X | $BA30
    .byte $D4 ; |XX X X  | $BA31
    .byte $D4 ; |XX X X  | $BA32
    .byte $D6 ; |XX X XX | $BA33
    .byte $D6 ; |XX X XX | $BA34
    .byte $D8 ; |XX XX   | $BA35
    .byte $D8 ; |XX XX   | $BA36
ColStripesTop:
    .byte $BA ; |X XXX X | $BA37
    .byte $BA ; |X XXX X | $BA38  mid section
    .byte $BA ; |X XXX X | $BA39

    .byte $BA ; |X XXX X | $BA3A
    .byte $B8 ; |X XXX   | $BA3B
    .byte $B8 ; |X XXX   | $BA3C
    .byte $B6 ; |X XX XX | $BA3D
    .byte $B6 ; |X XX XX | $BA3E
    .byte $B4 ; |X XX X  | $BA3F
    .byte $B4 ; |X XX X  | $BA40
    .byte $B2 ; |X XX  X | $BA41  2nd stripe from top
LBA42:
    .byte $10 ; |   X    | $BA42   HMOVE table ball
    .byte $10 ; |   X    | $BA43
    .byte $10 ; |   X    | $BA44
    .byte $10 ; |   X    | $BA45
    .byte $10 ; |   X    | $BA46
    .byte $10 ; |   X    | $BA47
    .byte $10 ; |   X    | $BA48
    .byte $00 ; |        | $BA49
    .byte $00 ; |        | $BA4A
    .byte $00 ; |        | $BA4B
    .byte $00 ; |        | $BA4C
LBA4D:
    .byte $00 ; |        | $BA4D   HMOVE table missiles
    .byte $F0 ; |XXXX    | $BA4E
    .byte $F0 ; |XXXX    | $BA4F
    .byte $F0 ; |XXXX    | $BA50
    .byte $F0 ; |XXXX    | $BA51
    .byte $F0 ; |XXXX    | $BA52
    .byte $F0 ; |XXXX    | $BA53
    .byte $F0 ; |XXXX    | $BA54
    .byte $F0 ; |XXXX    | $BA55
    .byte $F0 ; |XXXX    | $BA56
    .byte $F0 ; |XXXX    | $BA57
    .byte $90 ; |X  X    | $BA58
    .byte $10 ; |   X    | $BA59
    .byte $10 ; |   X    | $BA5A
    .byte $F0 ; |XXXX    | $BA5B
    .byte $F0 ; |XXXX    | $BA5C
LBA5D:
    .byte $10 ; |   X    | $BA5D   HMOVE table missiles
    .byte $10 ; |   X    | $BA5E
    .byte $10 ; |   X    | $BA5F
    .byte $F0 ; |XXXX    | $BA60
    .byte $F0 ; |XXXX    | $BA61
    .byte $70 ; | XXX    | $BA62
    .byte $10 ; |   X    | $BA63
    .byte $10 ; |   X    | $BA64
    .byte $10 ; |   X    | $BA65
    .byte $10 ; |   X    | $BA66
    .byte $10 ; |   X    | $BA67
    .byte $10 ; |   X    | $BA68
    .byte $10 ; |   X    | $BA69
    .byte $10 ; |   X    | $BA6A
    .byte $10 ; |   X    | $BA6B
BoosterRockets:
    .byte $18 ; |   XX   | $BA6C   GFX
    .byte $1C ; |   XXX  | $BA6D
    .byte $1E ; |   XXXX | $BA6E
    .byte $1F ; |   XXXXX| $BA6F
    .byte $1F ; |   XXXXX| $BA70
    .byte $1F ; |   XXXXX| $BA71
    .byte $1F ; |   XXXXX| $BA72
    .byte $1F ; |   XXXXX| $BA73
    .byte $1F ; |   XXXXX| $BA74
    .byte $1E ; |   XXXX | $BA75
    .byte $1C ; |   XXX  | $BA76
    .byte $18 ; |   XX   | $BA77
Transport_1:
    .byte $3C ; |  XXXX  | $BA78
    .byte $66 ; | XX  XX | $BA79
    .byte $FF ; |XXXXXXXX| $BA7A
    .byte $A5 ; |X X  X X| $BA7B
    .byte $FF ; |XXXXXXXX| $BA7C
    .byte $BD ; |X XXXX X| $BA7D
    .byte $E7 ; |XXX  XXX| $BA7E
    .byte $BD ; |X XXXX X| $BA7F
    .byte $FF ; |XXXXXXXX| $BA80
    .byte $A5 ; |X X  X X| $BA81
    .byte $7E ; | XXXXXX | $BA82
    .byte $3C ; |  XXXX  | $BA83
Transport_2:
    .byte $18 ; |   XX   | $BA84
    .byte $66 ; | XX  XX | $BA85
    .byte $DB ; |XX XX XX| $BA86
    .byte $A5 ; |X X  X X| $BA87
    .byte $7E ; | XXXXXX | $BA88
    .byte $B5 ; |X XX X X| $BA89
    .byte $E7 ; |XXX  XXX| $BA8A
    .byte $AD ; |X X XX X| $BA8B
    .byte $7E ; | XXXXXX | $BA8C
    .byte $A5 ; |X X  X X| $BA8D
    .byte $5A ; | X XX X | $BA8E
    .byte $60 ; | XX     | $BA8F
Transport_3:
    .byte $18 ; |   XX   | $BA90
    .byte $24 ; |  X  X  | $BA91
    .byte $5A ; | X XX X | $BA92
    .byte $A5 ; |X X  X X| $BA93
    .byte $6E ; | XX XXX | $BA94
    .byte $B5 ; |X XX X X| $BA95
    .byte $66 ; | XX  XX | $BA96
    .byte $AD ; |X X XX X| $BA97
    .byte $76 ; | XXX XX | $BA98
    .byte $A5 ; |X X  X X| $BA99
    .byte $5A ; | X XX X | $BA9A
    .byte $24 ; |  X  X  | $BA9B
Transport_4:
    .byte $08 ; |    X   | $BA9C
    .byte $24 ; |  X  X  | $BA9D
    .byte $1A ; |   XX X | $BA9E
    .byte $A5 ; |X X  X X| $BA9F
    .byte $6A ; | XX X X | $BAA0
    .byte $94 ; |X  X X  | $BAA1
    .byte $66 ; | XX  XX | $BAA2
    .byte $29 ; |  X X  X| $BAA3
    .byte $56 ; | X X XX | $BAA4
    .byte $A5 ; |X X  X X| $BAA5
    .byte $58 ; | X XX   | $BAA6
    .byte $24 ; |  X  X  | $BAA7
Transport_5:
    .byte $08 ; |    X   | $BAA8
    .byte $20 ; |  X     | $BAA9
    .byte $12 ; |   X  X | $BAAA
    .byte $A5 ; |X X  X X| $BAAB
    .byte $4A ; | X  X X | $BAAC
    .byte $94 ; |X  X X  | $BAAD
    .byte $66 ; | XX  XX | $BAAE
    .byte $29 ; |  X X  X| $BAAF
    .byte $52 ; | X X  X | $BAB0
    .byte $A5 ; |X X  X X| $BAB1
    .byte $08 ; |    X   | $BAB2
    .byte $24 ; |  X  X  | $BAB3
Transport_6:
    .byte $08 ; |    X   | $BAB4
    .byte $20 ; |  X     | $BAB5
    .byte $12 ; |   X  X | $BAB6
    .byte $25 ; |  X  X X| $BAB7
    .byte $08 ; |    X   | $BAB8
    .byte $94 ; |X  X X  | $BAB9
    .byte $42 ; | X    X | $BABA
    .byte $29 ; |  X X  X| $BABB
    .byte $10 ; |   X    | $BABC
    .byte $A5 ; |X X  X X| $BABD
    .byte $08 ; |    X   | $BABE
    .byte $24 ; |  X  X  | $BABF
Transport_7:
    .byte $08 ; |    X   | $BAC0
    .byte $20 ; |  X     | $BAC1
    .byte $02 ; |      X | $BAC2
    .byte $21 ; |  X    X| $BAC3
    .byte $08 ; |    X   | $BAC4
    .byte $94 ; |X  X X  | $BAC5
    .byte $00 ; |        | $BAC6
    .byte $29 ; |  X X  X| $BAC7
    .byte $00 ; |        | $BAC8
    .byte $25 ; |  X  X X| $BAC9
    .byte $00 ; |        | $BACA
    .byte $20 ; |  X     | $BACB
Transport_8:
    .byte $08 ; |    X   | $BACC
    .byte $00 ; |        | $BACD
    .byte $00 ; |        | $BACE
    .byte $00 ; |        | $BACF
    .byte $00 ; |        | $BAD0
    .byte $84 ; |X    X  | $BAD1
    .byte $00 ; |        | $BAD2
    .byte $20 ; |  X     | $BAD3
    .byte $00 ; |        | $BAD4
    .byte $05 ; |     X X| $BAD5
    .byte $00 ; |        | $BAD6
    .byte $20 ; |  X     | $BAD7
ErnieOne:
    .byte $14 ; |   X X  | $BAD8
    .byte $1C ; |   XXX  | $BAD9
    .byte $1C ; |   XXX  | $BADA
    .byte $1C ; |   XXX  | $BADB
    .byte $1C ; |   XXX  | $BADC
    .byte $1E ; |   XXXX | $BADD
    .byte $1C ; |   XXX  | $BADE
    .byte $7E ; | XXXXXX | $BADF
    .byte $1C ; |   XXX  | $BAE0
    .byte $1C ; |   XXX  | $BAE1
    .byte $00 ; |        | $BAE2
    .byte $08 ; |    X   | $BAE3
    .byte $00 ; |        | $BAE4
    .byte $14 ; |   X X  | $BAE5
ErnieTwo:
    .byte $22 ; |  X   X | $BAE6
    .byte $00 ; |        | $BAE7
    .byte $00 ; |        | $BAE8
    .byte $00 ; |        | $BAE9
    .byte $03 ; |      XX| $BAEA
    .byte $03 ; |      XX| $BAEB
    .byte $22 ; |  X   X | $BAEC
    .byte $00 ; |        | $BAED
    .byte $60 ; | XX     | $BAEE
    .byte $60 ; | XX     | $BAEF
    .byte $1C ; |   XXX  | $BAF0
    .byte $36 ; |  XX XX | $BAF1
    .byte $1C ; |   XXX  | $BAF2
    .byte $08 ; |    X   | $BAF3
ErnieThree:
    .byte $14 ; |   X X  | $BAF4
    .byte $1C ; |   XXX  | $BAF5
    .byte $1C ; |   XXX  | $BAF6
    .byte $1C ; |   XXX  | $BAF7
    .byte $1C ; |   XXX  | $BAF8
    .byte $1E ; |   XXXX | $BAF9
    .byte $1C ; |   XXX  | $BAFA
    .byte $7E ; | XXXXXX | $BAFB
    .byte $1C ; |   XXX  | $BAFC
    .byte $1C ; |   XXX  | $BAFD
    .byte $00 ; |        | $BAFE
    .byte $08 ; |    X   | $BAFF
    .byte $00 ; |        | $BB00
    .byte $14 ; |   X X  | $BB01
ErnieFour:
    .byte $22 ; |  X   X | $BB02
    .byte $00 ; |        | $BB03
    .byte $00 ; |        | $BB04
    .byte $00 ; |        | $BB05
    .byte $03 ; |      XX| $BB06
    .byte $03 ; |      XX| $BB07
    .byte $22 ; |  X   X | $BB08
    .byte $00 ; |        | $BB09
    .byte $C0 ; |XX      | $BB0A
    .byte $C0 ; |XX      | $BB0B
    .byte $1C ; |   XXX  | $BB0C
    .byte $36 ; |  XX XX | $BB0D
    .byte $1C ; |   XXX  | $BB0E
    .byte $08 ; |    X   | $BB0F

ColErnieTabOne:
    .byte $EC ; |XXX XX  | $BB10
    .byte COL_LEG_ERNIE  ; $BB11
    .byte COL_LEG_ERNIE  ; $BB12
    .byte COL_LEG_ERNIE  ; $BB13
    .byte COL_LEG_ERNIE  ; $BB14
    .byte $44 ; | X   X  | $BB15
    .byte $66 ; | XX  XX | $BB16
    .byte $44 ; | X   X  | $BB17
    .byte $66 ; | XX  XX | $BB18
    .byte $44 ; | X   X  | $BB19
    .byte $00 ; |        | $BB1A
    .byte $44 ; | X   X  | $BB1B
    .byte $00 ; |        | $BB1C
    .byte $E2 ; |XXX   X | $BB1D
ColErnieTabTwo:
    .byte $EC ; |XXX XX  | $BB1E
    .byte $00 ; |        | $BB1F
    .byte $00 ; |        | $BB20
    .byte $00 ; |        | $BB21
    .byte $2C ; |  X XX  | $BB22
    .byte $44 ; | X   X  | $BB23
    .byte $66 ; | XX  XX | $BB24
    .byte $00 ; |        | $BB25
    .byte $44 ; | X   X  | $BB26
    .byte $2C ; |  X XX  | $BB27
    .byte $2C ; |  X XX  | $BB28
    .byte $2C ; |  X XX  | $BB29
    .byte $2C ; |  X XX  | $BB2A
    .byte $2C ; |  X XX  | $BB2B

    .byte $00 ; |        | $BB2C
    .byte $00 ; |        | $BB2D
    .byte $00 ; |        | $BB2E
    .byte $00 ; |        | $BB2F
    .byte $00 ; |        | $BB30
    .byte $00 ; |        | $BB31
    .byte $00 ; |        | $BB32
    .byte $00 ; |        | $BB33
    .byte $00 ; |        | $BB34
    .byte $00 ; |        | $BB35
    .byte $00 ; |        | $BB36
    .byte $00 ; |        | $BB37
    .byte $00 ; |        | $BB38
    .byte $00 ; |        | $BB39
    .byte $00 ; |        | $BB3A
    .byte $00 ; |        | $BB3B
    .byte $00 ; |        | $BB3C
    .byte $00 ; |        | $BB3D
    .byte $00 ; |        | $BB3E
    .byte $00 ; |        | $BB3F
    .byte $00 ; |        | $BB40
    .byte $00 ; |        | $BB41
    .byte $00 ; |        | $BB42
    .byte $00 ; |        | $BB43
BlankBall:
    .byte $3C ; |  XXXX  | $BB44
    .byte $7E ; | XXXXXX | $BB45
    .byte $FF ; |XXXXXXXX| $BB46
    .byte $FF ; |XXXXXXXX| $BB47
    .byte $FF ; |XXXXXXXX| $BB48
    .byte $FF ; |XXXXXXXX| $BB49
    .byte $FF ; |XXXXXXXX| $BB4A
    .byte $FF ; |XXXXXXXX| $BB4B
    .byte $FF ; |XXXXXXXX| $BB4C
    .byte $FF ; |XXXXXXXX| $BB4D
    .byte $7E ; | XXXXXX | $BB4E
    .byte $3C ; |  XXXX  | $BB4F
BlankSpace:
    .byte $00 ; |        | $BB50
    .byte $00 ; |        | $BB51
    .byte $00 ; |        | $BB52
    .byte $00 ; |        | $BB53
    .byte $00 ; |        | $BB54
    .byte $00 ; |        | $BB55
    .byte $00 ; |        | $BB56
    .byte $00 ; |        | $BB57
    .byte $00 ; |        | $BB58
    .byte $00 ; |        | $BB59
    .byte $00 ; |        | $BB5A
    .byte $00 ; |        | $BB5B
    .byte $00 ; |        | $BB5C
    .byte $00 ; |        | $BB5D
    .byte $00 ; |        | $BB5E
    .byte $00 ; |        | $BB5F
    .byte $00 ; |        | $BB60
    .byte $00 ; |        | $BB61
    .byte $00 ; |        | $BB62
    .byte $00 ; |        | $BB63
    .byte $00 ; |        | $BB64
    .byte $00 ; |        | $BB65
    .byte $00 ; |        | $BB66
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The small UFO shuttles are drawn with the ball. The difference
;between these two sets of gfx is that "ShuttleGfxTwo" leaves
;the ball enabled after drawing the ufo, which creates the downward
;transport beam.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ShuttleGfxOne:
    .byte  BALL_1CLK  | DISABLE_BALL ; $BB67   no down beam firing, as ball is diabled...
    .byte  BALL_2CLKS | ENABLE_BALL  ; $BB68
    .byte  BALL_4CLKS | ENABLE_BALL  ; $BB69
    .byte  BALL_8CLKS | ENABLE_BALL  ; $BB6A
    .byte  BALL_8CLKS | ENABLE_BALL  ; $BB6B
    .byte  BALL_1CLK  | ENABLE_BALL  ; $BB6C
    .byte  BALL_8CLKS | ENABLE_BALL  ; $BB6D
    .byte  BALL_8CLKS | ENABLE_BALL  ; $BB6E
    .byte  BALL_4CLKS | ENABLE_BALL  ; $BB6F
    .byte  BALL_2CLKS | ENABLE_BALL  ; $BB70
ShuttleGfxTwo:
    .byte  BALL_2CLKS | ENABLE_BALL  ; $BB71   this byte creates a downward beam
    .byte  BALL_2CLKS | ENABLE_BALL  ; $BB72
    .byte  BALL_4CLKS | ENABLE_BALL  ; $BB73
    .byte  BALL_8CLKS | ENABLE_BALL  ; $BB74
    .byte  BALL_8CLKS | ENABLE_BALL  ; $BB75
    .byte  BALL_1CLK  | ENABLE_BALL  ; $BB76
    .byte  BALL_8CLKS | ENABLE_BALL  ; $BB77
    .byte  BALL_8CLKS | ENABLE_BALL  ; $BB78
    .byte  BALL_4CLKS | ENABLE_BALL  ; $BB79
    .byte  BALL_2CLKS | ENABLE_BALL  ; $BB7A
Hi_Gfx:
    .byte $00 ; |        | $BB7B   spells Hi!
    .byte $00 ; |        | $BB7C   Easter egg or High Score? Maybe just saying Hi?
    .byte $00 ; |        | $BB7D
    .byte $AA ; |X X X X | $BB7E
    .byte $A8 ; |X X X   | $BB7F
    .byte $EA ; |XXX X X | $BB80
    .byte $AA ; |X X X X | $BB81
    .byte $AA ; |X X X X | $BB82
    .byte $00 ; |        | $BB83
One:
    .byte $00 ; |        | $BB84
    .byte $00 ; |        | $BB85
    .byte $00 ; |        | $BB86
    .byte $3C ; |  XXXX  | $BB87
    .byte $18 ; |   XX   | $BB88
    .byte $18 ; |   XX   | $BB89
    .byte $18 ; |   XX   | $BB8A
    .byte $38 ; |  XXX   | $BB8B
    .byte $18 ; |   XX   | $BB8C
Two:
    .byte $00 ; |        | $BB8D
    .byte $00 ; |        | $BB8E
    .byte $00 ; |        | $BB8F
    .byte $7E ; | XXXXXX | $BB90
    .byte $30 ; |  XX    | $BB91
    .byte $18 ; |   XX   | $BB92
    .byte $0C ; |    XX  | $BB93
    .byte $66 ; | XX  XX | $BB94
    .byte $3C ; |  XXXX  | $BB95
Three:
    .byte $00 ; |        | $BB96
    .byte $00 ; |        | $BB97
    .byte $00 ; |        | $BB98
    .byte $3C ; |  XXXX  | $BB99
    .byte $66 ; | XX  XX | $BB9A
    .byte $0C ; |    XX  | $BB9B
    .byte $18 ; |   XX   | $BB9C
    .byte $0C ; |    XX  | $BB9D
    .byte $7E ; | XXXXXX | $BB9E
Four:
    .byte $00 ; |        | $BB9F
    .byte $00 ; |        | $BBA0
    .byte $00 ; |        | $BBA1
    .byte $06 ; |     XX | $BBA2
    .byte $06 ; |     XX | $BBA3
    .byte $7E ; | XXXXXX | $BBA4
    .byte $66 ; | XX  XX | $BBA5
    .byte $66 ; | XX  XX | $BBA6
    .byte $66 ; | XX  XX | $BBA7
Five:
    .byte $00 ; |        | $BBA8
    .byte $00 ; |        | $BBA9
    .byte $00 ; |        | $BBAA
    .byte $3C ; |  XXXX  | $BBAB
    .byte $66 ; | XX  XX | $BBAC
    .byte $06 ; |     XX | $BBAD
    .byte $7C ; | XXXXX  | $BBAE
    .byte $60 ; | XX     | $BBAF
    .byte $7E ; | XXXXXX | $BBB0
Six:
    .byte $00 ; |        | $BBB1
    .byte $00 ; |        | $BBB2
    .byte $00 ; |        | $BBB3
    .byte $3C ; |  XXXX  | $BBB4
    .byte $66 ; | XX  XX | $BBB5
    .byte $66 ; | XX  XX | $BBB6
    .byte $7C ; | XXXXX  | $BBB7
    .byte $60 ; | XX     | $BBB8
    .byte $3C ; |  XXXX  | $BBB9
Seven:
    .byte $00 ; |        | $BBBA
    .byte $00 ; |        | $BBBB
    .byte $00 ; |        | $BBBC
    .byte $30 ; |  XX    | $BBBD
    .byte $30 ; |  XX    | $BBBE
    .byte $18 ; |   XX   | $BBBF
    .byte $0C ; |    XX  | $BBC0
    .byte $06 ; |     XX | $BBC1
    .byte $7E ; | XXXXXX | $BBC2
Eight:
    .byte $00 ; |        | $BBC3
    .byte $00 ; |        | $BBC4
    .byte $00 ; |        | $BBC5
    .byte $3C ; |  XXXX  | $BBC6
    .byte $66 ; | XX  XX | $BBC7
    .byte $66 ; | XX  XX | $BBC8
    .byte $3C ; |  XXXX  | $BBC9
    .byte $66 ; | XX  XX | $BBCA
    .byte $3C ; |  XXXX  | $BBCB
Nine:
    .byte $00 ; |        | $BBCC
    .byte $00 ; |        | $BBCD
    .byte $00 ; |        | $BBCE
    .byte $38 ; |  XXX   | $BBCF
    .byte $0C ; |    XX  | $BBD0
    .byte $06 ; |     XX | $BBD1
    .byte $3E ; |  XXXXX | $BBD2
    .byte $66 ; | XX  XX | $BBD3
    .byte $3C ; |  XXXX  | $BBD4
Ten:
    .byte $00 ; |        | $BBD5
    .byte $00 ; |        | $BBD6
    .byte $00 ; |        | $BBD7
    .byte $E6 ; |XXX  XX | $BBD8
    .byte $49 ; | X  X  X| $BBD9
    .byte $49 ; | X  X  X| $BBDA
    .byte $49 ; | X  X  X| $BBDB
    .byte $C9 ; |XX  X  X| $BBDC
    .byte $46 ; | X   XX | $BBDD
Eleven:
    .byte $00 ; |        | $BBDE
    .byte $00 ; |        | $BBDF
    .byte $00 ; |        | $BBE0
    .byte $77 ; | XXX XXX| $BBE1
    .byte $22 ; |  X   X | $BBE2
    .byte $22 ; |  X   X | $BBE3
    .byte $22 ; |  X   X | $BBE4
    .byte $66 ; | XX  XX | $BBE5
    .byte $22 ; |  X   X | $BBE6
Twelve:
    .byte $00 ; |        | $BBE7
    .byte $00 ; |        | $BBE8
    .byte $00 ; |        | $BBE9
    .byte $EF ; |XXX XXXX| $BBEA
    .byte $44 ; | X   X  | $BBEB
    .byte $42 ; | X    X | $BBEC
    .byte $41 ; | X     X| $BBED
    .byte $C9 ; |XX  X  X| $BBEE
    .byte $46 ; | X   XX | $BBEF
    .byte $00 ; |        | $BBF0
    .byte $00 ; |        | $BBF1
    .byte $00 ; |        | $BBF2
LBBF3:
    .byte <LB1BE         ; $BBF3
    .byte <LB24D         ; $BBF4
    .byte <LB2B5         ; $BBF5
    .byte <LB2FA         ; $BBF6
    .byte <LB317         ; $BBF7
    .byte <LB336         ; $BBF8
    .byte <LB371         ; $BBF9
LBBFA:
    .byte >LB1BE         ; $BBFA
    .byte >LB24D         ; $BBFB
    .byte >LB2B5         ; $BBFC
    .byte >LB2FA         ; $BBFD
    .byte >LB317         ; $BBFE
    .byte >LB336         ; $BBFF
    .byte >LB371         ; $BC00

LBC01:
    .byte $2C ; |  X XX  | $BC01
    .byte $2C ; |  X XX  | $BC02
    .byte $2C ; |  X XX  | $BC03
    .byte $2C ; |  X XX  | $BC04
    .byte $2C ; |  X XX  | $BC05
    .byte $2C ; |  X XX  | $BC06
LBC07:
    .byte $01 ; |       X| $BC07
    .byte $08 ; |    X   | $BC08
LBC09:
    .byte $04 ; |     X  | $BC09
    .byte $08 ; |    X   | $BC0A
    .byte $02 ; |      X | $BC0B
    .byte $08 ; |    X   | $BC0C
    .byte $04 ; |     X  | $BC0D
    .byte $08 ; |    X   | $BC0E
    .byte $00 ; |        | $BC0F
    .byte $08 ; |    X   | $BC10
    .byte $04 ; |     X  | $BC11
    .byte $08 ; |    X   | $BC12
    .byte $02 ; |      X | $BC13
    .byte $08 ; |    X   | $BC14
    .byte $04 ; |     X  | $BC15
    .byte $08 ; |    X   | $BC16
    .byte $00 ; |        | $BC17
UpperCase_A:
    .byte $3C ; |  XXXX  | $BC18
    .byte $7E ; | XXXXXX | $BC19
    .byte $FF ; |XXXXXXXX| $BC1A
    .byte $BD ; |X XXXX X| $BC1B        XX
    .byte $BD ; |X XXXX X| $BC1C       X  X
    .byte $81 ; |X      X| $BC1D      X    X
    .byte $BD ; |X XXXX X| $BC1E      XXXXXX
    .byte $DB ; |XX XX XX| $BC1F      X    X
    .byte $E7 ; |XXX  XXX| $BC20      X    X
    .byte $FF ; |XXXXXXXX| $BC21
    .byte $7E ; | XXXXXX | $BC22
UpperCase_B:
    .byte $3C ; |  XXXX  | $BC23  shared byte
    .byte $7E ; | XXXXXX | $BC24
    .byte $FF ; |XXXXXXXX| $BC25
    .byte $83 ; |X     XX| $BC26      XXXXX
    .byte $BD ; |X XXXX X| $BC27      X    X
    .byte $BD ; |X XXXX X| $BC28      XXXXX
    .byte $83 ; |X     XX| $BC29      X    X
    .byte $BD ; |X XXXX X| $BC2A      X    X
    .byte $83 ; |X     XX| $BC2B      XXXXX
    .byte $FF ; |XXXXXXXX| $BC2C
    .byte $7E ; | XXXXXX | $BC2D
UpperCase_C:
    .byte $3C ; |  XXXX  | $BC2E  shared byte
    .byte $7E ; | XXXXXX | $BC2F
    .byte $FF ; |XXXXXXXX| $BC30
    .byte $C3 ; |XX    XX| $BC31       XXXX
    .byte $BF ; |X XXXXXX| $BC32      X
    .byte $BF ; |X XXXXXX| $BC33      X
    .byte $BF ; |X XXXXXX| $BC34      X
    .byte $BF ; |X XXXXXX| $BC35      X
    .byte $C3 ; |XX    XX| $BC36       XXXX
    .byte $FF ; |XXXXXXXX| $BC37
    .byte $7E ; | XXXXXX | $BC38
UpperCase_D:
    .byte $3C ; |  XXXX  | $BC39  shared byte
    .byte $7E ; | XXXXXX | $BC3A
    .byte $FF ; |XXXXXXXX| $BC3B
    .byte $87 ; |X    XXX| $BC3C      XXXX
    .byte $BB ; |X XXX XX| $BC3D      X   X
    .byte $BD ; |X XXXX X| $BC3E      X    X
    .byte $BD ; |X XXXX X| $BC3F      X    X
    .byte $BB ; |X XXX XX| $BC40      X   X
    .byte $87 ; |X    XXX| $BC41      XXXX
    .byte $FF ; |XXXXXXXX| $BC42
    .byte $7E ; | XXXXXX | $BC43
UpperCase_E:
    .byte $3C ; |  XXXX  | $BC44  shared byte
    .byte $7E ; | XXXXXX | $BC45
    .byte $FF ; |XXXXXXXX| $BC46
    .byte $81 ; |X      X| $BC47      XXXXXX
    .byte $BF ; |X XXXXXX| $BC48      X
    .byte $BF ; |X XXXXXX| $BC49      XXXX
    .byte $87 ; |X    XXX| $BC4A      X
    .byte $BF ; |X XXXXXX| $BC4B      X
    .byte $81 ; |X      X| $BC4C      XXXXXX
    .byte $FF ; |XXXXXXXX| $BC4D
    .byte $7E ; | XXXXXX | $BC4E
UpperCase_F:
    .byte $3C ; |  XXXX  | $BC4F  shared byte
    .byte $7E ; | XXXXXX | $BC50
    .byte $FF ; |XXXXXXXX| $BC51
    .byte $DF ; |XX XXXXX| $BC52       XXXXX
    .byte $DF ; |XX XXXXX| $BC53       X
    .byte $DF ; |XX XXXXX| $BC54       XXX
    .byte $C7 ; |XX   XXX| $BC55       X
    .byte $DF ; |XX XXXXX| $BC56       X
    .byte $C1 ; |XX     X| $BC57       X
    .byte $FF ; |XXXXXXXX| $BC58
    .byte $7E ; | XXXXXX | $BC59
UpperCase_G:
    .byte $3C ; |  XXXX  | $BC5A  shared byte
    .byte $7E ; | XXXXXX | $BC5B
    .byte $FF ; |XXXXXXXX| $BC5C
    .byte $C1 ; |XX     X| $BC5D       XXXX
    .byte $BD ; |X XXXX X| $BC5E      X    X
    .byte $B1 ; |X XX   X| $BC5F      X
    .byte $BF ; |X XXXXXX| $BC60      X  XXX
    .byte $BD ; |X XXXX X| $BC61      X    X
    .byte $C3 ; |XX    XX| $BC62       XXXXX
    .byte $FF ; |XXXXXXXX| $BC63
    .byte $7E ; | XXXXXX | $BC64
UpperCase_H:
    .byte $3C ; |  XXXX  | $BC65  shared byte
    .byte $7E ; | XXXXXX | $BC66
    .byte $FF ; |XXXXXXXX| $BC67
    .byte $BD ; |X XXXX X| $BC68      X    X
    .byte $BD ; |X XXXX X| $BC69      X    X
    .byte $BD ; |X XXXX X| $BC6A      XXXXXX
    .byte $81 ; |X      X| $BC6B      X    X
    .byte $BD ; |X XXXX X| $BC6C      X    X
    .byte $BD ; |X XXXX X| $BC6D      X    X
    .byte $FF ; |XXXXXXXX| $BC6E
    .byte $7E ; | XXXXXX | $BC6F
UpperCase_I:
    .byte $3C ; |  XXXX  | $BC70  shared byte
    .byte $7E ; | XXXXXX | $BC71
    .byte $FF ; |XXXXXXXX| $BC72
    .byte $E3 ; |XXX   XX| $BC73        XXX
    .byte $F7 ; |XXXX XXX| $BC74         X
    .byte $F7 ; |XXXX XXX| $BC75         X
    .byte $F7 ; |XXXX XXX| $BC76         X
    .byte $F7 ; |XXXX XXX| $BC77         X
    .byte $E3 ; |XXX   XX| $BC78        XXX
    .byte $FF ; |XXXXXXXX| $BC79
    .byte $7E ; | XXXXXX | $BC7A
UpperCase_J:
    .byte $3C ; |  XXXX  | $BC7B  shared byte
    .byte $7E ; | XXXXXX | $BC7C
    .byte $FF ; |XXXXXXXX| $BC7D
    .byte $C7 ; |XX   XXX| $BC7E          X
    .byte $BB ; |X XXX XX| $BC7F          X
    .byte $FB ; |XXXXX XX| $BC80          X
    .byte $FB ; |XXXXX XX| $BC81          X
    .byte $FB ; |XXXXX XX| $BC82      X   X
    .byte $FB ; |XXXXX XX| $BC83       XXX
    .byte $FF ; |XXXXXXXX| $BC84
    .byte $7E ; | XXXXXX | $BC85
UpperCase_K:
    .byte $3C ; |  XXXX  | $BC86  shared byte
    .byte $7E ; | XXXXXX | $BC87
    .byte $FF ; |XXXXXXXX| $BC88
    .byte $BD ; |X XXXX X| $BC89      X   X
    .byte $BB ; |X XXX XX| $BC8A      X  X
    .byte $B7 ; |X XX XXX| $BC8B      XXX
    .byte $8F ; |X   XXXX| $BC8C      X  X
    .byte $B7 ; |X XX XXX| $BC8D      X   X
    .byte $BB ; |X XXX XX| $BC8E      X    X
    .byte $FF ; |XXXXXXXX| $BC8F
    .byte $7E ; | XXXXXX | $BC90
UpperCase_L:
    .byte $3C ; |  XXXX  | $BC91  shared byte
    .byte $7E ; | XXXXXX | $BC92
    .byte $FF ; |XXXXXXXX| $BC93
    .byte $C3 ; |XX    XX| $BC94       X
    .byte $DF ; |XX XXXXX| $BC95       X
    .byte $DF ; |XX XXXXX| $BC96       X
    .byte $DF ; |XX XXXXX| $BC97       X
    .byte $DF ; |XX XXXXX| $BC98       X
    .byte $DF ; |XX XXXXX| $BC99       XXXX
    .byte $FF ; |XXXXXXXX| $BC9A
    .byte $7E ; | XXXXXX | $BC9B
UpperCase_M:
    .byte $3C ; |  XXXX  | $BC9C  shared byte
    .byte $7E ; | XXXXXX | $BC9D
    .byte $FF ; |XXXXXXXX| $BC9E
    .byte $BB ; |X XXX XX| $BC9F      XX XX
    .byte $BB ; |X XXX XX| $BCA0      X X X
    .byte $BB ; |X XXX XX| $BCA1      X   X
    .byte $AB ; |X X X XX| $BCA2      X   X
    .byte $93 ; |X  X  XX| $BCA3      X   X
    .byte $BB ; |X XXX XX| $BCA4      X   X
    .byte $FF ; |XXXXXXXX| $BCA5
    .byte $7E ; | XXXXXX | $BCA6
    .byte $3C ; |  XXXX  | $BCA7
ColSmlRocketTab:
    .byte $D6 ; |XX X XX | $BCA8
    .byte $D2 ; |XX X  X | $BCA9
    .byte $D4 ; |XX X X  | $BCAA
    .byte $D6 ; |XX X XX | $BCAB
    .byte $D8 ; |XX XX   | $BCAC
    .byte $DA ; |XX XX X | $BCAD
    .byte $DA ; |XX XX X | $BCAE
    .byte $DA ; |XX XX X | $BCAF
    .byte $DA ; |XX XX X | $BCB0
    .byte $DA ; |XX XX X | $BCB1
    .byte $DA ; |XX XX X | $BCB2
    .byte $DA ; |XX XX X | $BCB3
    .byte $DA ; |XX XX X | $BCB4
    .byte $D8 ; |XX XX   | $BCB5
    .byte $D6 ; |XX X XX | $BCB6
    .byte $D4 ; |XX X X  | $BCB7
    .byte $D2 ; |XX X  X | $BCB8
    .byte $D6 ; |XX X XX | $BCB9
LBCBA:
    .byte $07 ; |     XXX| $BCBA
    .byte $57 ; | X X XXX| $BCBB
    .byte $12 ; |   X  X | $BCBC
    .byte $42 ; | X    X | $BCBD
    .byte $12 ; |   X  X | $BCBE
    .byte $52 ; | X X  X | $BCBF
    .byte $22 ; |  X   X | $BCC0
    .byte $42 ; | X    X | $BCC1
    .byte $E0 ; |XXX     | $BCC2
    .byte $E0 ; |XXX     | $BCC3
    .byte $10 ; |   X    | $BCC4
    .byte $30 ; |  XX    | $BCC5
    .byte $E0 ; |XXX     | $BCC6
    .byte $E0 ; |XXX     | $BCC7
    .byte $10 ; |   X    | $BCC8
    .byte $30 ; |  XX    | $BCC9
    .byte $E2 ; |XXX   X | $BCCA
    .byte $E2 ; |XXX   X | $BCCB
    .byte $15 ; |   X X X| $BCCC
    .byte $35 ; |  XX X X| $BCCD
    .byte $32 ; |  XX  X | $BCCE
    .byte $02 ; |      X | $BCCF
    .byte $52 ; | X X  X | $BCD0
    .byte $12 ; |   X  X | $BCD1
    .byte $62 ; | XX   X | $BCD2
    .byte $32 ; |  XX  X | $BCD3
    .byte $E4 ; |XXX  X  | $BCD4
    .byte $E4 ; |XXX  X  | $BCD5
    .byte $15 ; |   X X X| $BCD6
    .byte $35 ; |  XX X X| $BCD7
    .byte $22 ; |  X   X | $BCD8
    .byte $42 ; | X    X | $BCD9
    .byte $32 ; |  XX  X | $BCDA
    .byte $52 ; | X X  X | $BCDB
    .byte $22 ; |  X   X | $BCDC
    .byte $42 ; | X    X | $BCDD
    .byte $E0 ; |XXX     | $BCDE
    .byte $E0 ; |XXX     | $BCDF
    .byte $10 ; |   X    | $BCE0
    .byte $30 ; |  XX    | $BCE1
    .byte $E0 ; |XXX     | $BCE2
    .byte $E0 ; |XXX     | $BCE3
    .byte $10 ; |   X    | $BCE4
    .byte $30 ; |  XX    | $BCE5
    .byte $E2 ; |XXX   X | $BCE6
    .byte $E2 ; |XXX   X | $BCE7
    .byte $15 ; |   X X X| $BCE8
    .byte $35 ; |  XX X X| $BCE9
    .byte $32 ; |  XX  X | $BCEA
    .byte $02 ; |      X | $BCEB
    .byte $52 ; | X X  X | $BCEC
    .byte $12 ; |   X  X | $BCED
    .byte $62 ; | XX   X | $BCEE
    .byte $32 ; |  XX  X | $BCEF
LBCF0:
    .byte $0B ; |    X XX| $BCF0
    .byte $0F ; |    XXXX| $BCF1
    .byte $11 ; |   X   X| $BCF2
    .byte $12 ; |   X  X | $BCF3
    .byte $14 ; |   X X  | $BCF4
    .byte $17 ; |   X XXX| $BCF5
    .byte $1F ; |   XXXXX| $BCF6
LBCF7:
    .byte $03 ; |      XX| $BCF7
    .byte $06 ; |     XX | $BCF8
    .byte $0C ; |    XX  | $BCF9
    .byte $12 ; |   X  X | $BCFA
    .byte $18 ; |   XX   | $BCFB
    .byte $24 ; |  X  X  | $BCFC
    .byte $30 ; |  XX    | $BCFD
    .byte $35 ; |  XX X X| $BCFE
LBCFF:
    .byte <ColErnieTabOne; $BCFF
    .byte <ColErnieTabTwo; $BD00
    .byte <LBC01         ; $BD01
    .byte <LBC01         ; $BD02
LBD03:
    .byte >ColErnieTabOne; $BD03
    .byte >ColErnieTabTwo; $BD04
    .byte >LBC01         ; $BD05
    .byte >LBC01         ; $BD06

;bytes are stored in $CE...
LBD07:
    .byte COL_SATURN     ; $BD07   Saturn
    .byte $58 ; | X XX   | $BD08   Jupiter
    .byte $44 ; | X   X  | $BD09   Mars
    .byte COL_EARTH      ; $BD0A   Earth

    .byte <ErnieOne      ; $BD0B
    .byte <ErnieThree    ; $BD0C
    .byte <BlankSpace    ; $BD0D
    .byte >ErnieOne      ; $BD0E
    .byte >ErnieThree    ; $BD0F
    .byte >BlankSpace    ; $BD10

    .byte <ErnieTwo      ; $BD11
    .byte <ErnieFour     ; $BD12
    .byte <BlankSpace    ; $BD13
    .byte >ErnieTwo      ; $BD14
    .byte >ErnieFour     ; $BD15
    .byte >BlankSpace    ; $BD16

    .byte $00 ; |        | $BD17   dummy
UpperCase_N:
    .byte $3C ; |  XXXX  | $BD18
    .byte $7E ; | XXXXXX | $BD19
    .byte $FF ; |XXXXXXXX| $BD1A
    .byte $BD ; |X XXXX X| $BD1B      X    X
    .byte $B9 ; |X XXX  X| $BD1C      XX   X
    .byte $B5 ; |X XX X X| $BD1D      X X  X
    .byte $AD ; |X X XX X| $BD1E      X  X X
    .byte $9D ; |X  XXX X| $BD1F      X   XX
    .byte $BD ; |X XXXX X| $BD20      X    X
    .byte $FF ; |XXXXXXXX| $BD21
    .byte $7E ; | XXXXXX | $BD22
UpperCase_O:
    .byte $3C ; |  XXXX  | $BD23  shared byte
    .byte $7E ; | XXXXXX | $BD24
    .byte $FF ; |XXXXXXXX| $BD25
    .byte $C3 ; |XX    XX| $BD26       XXXX
    .byte $BD ; |X XXXX X| $BD27      X    X
    .byte $BD ; |X XXXX X| $BD28      X    X
    .byte $BD ; |X XXXX X| $BD29      X    X
    .byte $BD ; |X XXXX X| $BD2A      X    X
    .byte $C3 ; |XX    XX| $BD2B       XXXX
    .byte $FF ; |XXXXXXXX| $BD2C
    .byte $7E ; | XXXXXX | $BD2D
UpperCase_P:
    .byte $3C ; |  XXXX  | $BD2E  shared byte
    .byte $7E ; | XXXXXX | $BD2F
    .byte $FF ; |XXXXXXXX| $BD30
    .byte $DF ; |XX XXXXX| $BD31       XXXX
    .byte $DF ; |XX XXXXX| $BD32       X   X
    .byte $C3 ; |XX    XX| $BD33       X   X
    .byte $DD ; |XX XXX X| $BD34       XXXX
    .byte $DD ; |XX XXX X| $BD35       X
    .byte $C3 ; |XX    XX| $BD36       X
    .byte $FF ; |XXXXXXXX| $BD37
    .byte $7E ; | XXXXXX | $BD38
UpperCase_Q:
    .byte $3C ; |  XXXX  | $BD39  shared byte
    .byte $7E ; | XXXXXX | $BD3A
    .byte $FF ; |XXXXXXXX| $BD3B
    .byte $C5 ; |XX   X X| $BD3C       XXXX
    .byte $BB ; |X XXX XX| $BD3D      X    X
    .byte $B5 ; |X XX X X| $BD3E      X    X
    .byte $BD ; |X XXXX X| $BD3F      X  X X
    .byte $BD ; |X XXXX X| $BD40      X   X
    .byte $C3 ; |XX    XX| $BD41       XXX X
    .byte $FF ; |XXXXXXXX| $BD42
    .byte $7E ; | XXXXXX | $BD43
UpperCase_R:
    .byte $3C ; |  XXXX  | $BD44  shared byte
    .byte $7E ; | XXXXXX | $BD45
    .byte $FF ; |XXXXXXXX| $BD46
    .byte $BD ; |X XXXX X| $BD47      XXXXX
    .byte $BB ; |X XXX XX| $BD48      X    X
    .byte $B7 ; |X XX XXX| $BD49      XXXXX
    .byte $83 ; |X     XX| $BD4A      X  X
    .byte $BD ; |X XXXX X| $BD4B      X   X
    .byte $83 ; |X     XX| $BD4C      X    X
    .byte $FF ; |XXXXXXXX| $BD4D
    .byte $7E ; | XXXXXX | $BD4E
UpperCase_S:
    .byte $3C ; |  XXXX  | $BD4F  shared byte
    .byte $7E ; | XXXXXX | $BD50
    .byte $FF ; |XXXXXXXX| $BD51
    .byte $C3 ; |XX    XX| $BD52       XXXX
    .byte $FD ; |XXXXXX X| $BD53      X
    .byte $FD ; |XXXXXX X| $BD54       XXXX
    .byte $C3 ; |XX    XX| $BD55           X
    .byte $BF ; |X XXXXXX| $BD56           X
    .byte $C3 ; |XX    XX| $BD57       XXXX
    .byte $FF ; |XXXXXXXX| $BD58
    .byte $7E ; | XXXXXX | $BD59
UpperCase_T:
    .byte $3C ; |  XXXX  | $BD5A  shared byte
    .byte $7E ; | XXXXXX | $BD5B
    .byte $FF ; |XXXXXXXX| $BD5C
    .byte $EF ; |XXX XXXX| $BD5D      XXXXX
    .byte $EF ; |XXX XXXX| $BD5E        X
    .byte $EF ; |XXX XXXX| $BD5F        X
    .byte $EF ; |XXX XXXX| $BD60        X
    .byte $EF ; |XXX XXXX| $BD61        X
    .byte $83 ; |X     XX| $BD62        X
    .byte $FF ; |XXXXXXXX| $BD63
    .byte $7E ; | XXXXXX | $BD64
UpperCase_U:
    .byte $3C ; |  XXXX  | $BD65  shared byte
    .byte $7E ; | XXXXXX | $BD66
    .byte $FF ; |XXXXXXXX| $BD67
    .byte $C3 ; |XX    XX| $BD68      X    X
    .byte $BD ; |X XXXX X| $BD69      X    X
    .byte $BD ; |X XXXX X| $BD6A      X    X
    .byte $BD ; |X XXXX X| $BD6B      X    X
    .byte $BD ; |X XXXX X| $BD6C      X    X
    .byte $BD ; |X XXXX X| $BD6D       XXXX
    .byte $FF ; |XXXXXXXX| $BD6E
    .byte $7E ; | XXXXXX | $BD6F
UpperCase_V:
    .byte $3C ; |  XXXX  | $BD70  shared byte
    .byte $7E ; | XXXXXX | $BD71
    .byte $FF ; |XXXXXXXX| $BD72
    .byte $EF ; |XXX XXXX| $BD73      X   X
    .byte $D7 ; |XX X XXX| $BD74      X   X
    .byte $BB ; |X XXX XX| $BD75      X   X
    .byte $BB ; |X XXX XX| $BD76      X   X
    .byte $BB ; |X XXX XX| $BD77       X X
    .byte $BB ; |X XXX XX| $BD78        X
    .byte $FF ; |XXXXXXXX| $BD79
    .byte $7E ; | XXXXXX | $BD7A
UpperCase_W:
    .byte $3C ; |  XXXX  | $BD7B  shared byte
    .byte $7E ; | XXXXXX | $BD7C
    .byte $FF ; |XXXXXXXX| $BD7D
    .byte $BB ; |X XXX XX| $BD7E      X   X
    .byte $93 ; |X  X  XX| $BD7F      X   X
    .byte $AB ; |X X X XX| $BD80      X   X
    .byte $BB ; |X XXX XX| $BD81      X X X
    .byte $BB ; |X XXX XX| $BD82      XX XX
    .byte $BB ; |X XXX XX| $BD83      X   X
    .byte $FF ; |XXXXXXXX| $BD84
    .byte $7E ; | XXXXXX | $BD85
UpperCase_X:
    .byte $3C ; |  XXXX  | $BD86  shared byte
    .byte $7E ; | XXXXXX | $BD87
    .byte $FF ; |XXXXXXXX| $BD88
    .byte $BD ; |X XXXX X| $BD89      X    X
    .byte $BD ; |X XXXX X| $BD8A       X  X
    .byte $DB ; |XX XX XX| $BD8B        XX
    .byte $E7 ; |XXX  XXX| $BD8C       X  X
    .byte $DB ; |XX XX XX| $BD8D      X    X
    .byte $BD ; |X XXXX X| $BD8E      X    X
    .byte $FF ; |XXXXXXXX| $BD8F
    .byte $7E ; | XXXXXX | $BD90
UpperCase_Y:
    .byte $3C ; |  XXXX  | $BD91  shared byte
    .byte $7E ; | XXXXXX | $BD92
    .byte $FF ; |XXXXXXXX| $BD93
    .byte $EF ; |XXX XXXX| $BD94      X   X
    .byte $EF ; |XXX XXXX| $BD95       X X
    .byte $EF ; |XXX XXXX| $BD96        X
    .byte $EF ; |XXX XXXX| $BD97        X
    .byte $D7 ; |XX X XXX| $BD98        X
    .byte $BB ; |X XXX XX| $BD99        X
    .byte $FF ; |XXXXXXXX| $BD9A
    .byte $7E ; | XXXXXX | $BD9B
UpperCase_Z:
    .byte $3C ; |  XXXX  | $BD9C  shared byte
    .byte $7E ; | XXXXXX | $BD9D
    .byte $FF ; |XXXXXXXX| $BD9E
    .byte $81 ; |X      X| $BD9F      XXXXXX
    .byte $DF ; |XX XXXXX| $BDA0          X
    .byte $EF ; |XXX XXXX| $BDA1         X
    .byte $F7 ; |XXXX XXX| $BDA2        X
    .byte $FB ; |XXXXX XX| $BDA3       X
    .byte $81 ; |X      X| $BDA4      XXXXXX
    .byte $FF ; |XXXXXXXX| $BDA5
    .byte $7E ; | XXXXXX | $BDA6
    .byte $3C ; |  XXXX  | $BDA7

UFO_One:
    .byte COL_BEAM_1     ; $BDA8   bottom beam
    .byte $F6 ; |XXXX XX | $BDA9
    .byte $E6 ; |XXX  XX | $BDAA
    .byte $06 ; |     XX | $BDAB
    .byte $06 ; |     XX | $BDAC
    .byte $0E ; |    XXX | $BDAD
    .byte $06 ; |     XX | $BDAE
    .byte $26 ; |  X  XX | $BDAF
    .byte $16 ; |   X XX | $BDB0
    .byte $06 ; |     XX | $BDB1
UFO_Two:
    .byte COL_BEAM_2     ; $BDB2   bottom beam
    .byte $F6 ; |XXXX XX | $BDB3
    .byte $E6 ; |XXX  XX | $BDB4
    .byte $06 ; |     XX | $BDB5
    .byte $16 ; |   X XX | $BDB6
    .byte $FE ; |XXXXXXX | $BDB7
    .byte $06 ; |     XX | $BDB8
    .byte $26 ; |  X  XX | $BDB9
    .byte $16 ; |   X XX | $BDBA
    .byte $06 ; |     XX | $BDBB
UFO_Three:
    .byte COL_BEAM_3     ; $BDBC   bottom beam
    .byte $F6 ; |XXXX XX | $BDBD
    .byte $E6 ; |XXX  XX | $BDBE
    .byte $06 ; |     XX | $BDBF
    .byte $26 ; |  X  XX | $BDC0
    .byte $EE ; |XXX XXX | $BDC1
    .byte $06 ; |     XX | $BDC2
    .byte $26 ; |  X  XX | $BDC3
    .byte $16 ; |   X XX | $BDC4
    .byte $06 ; |     XX | $BDC5
UFO_Four:
    .byte COL_BEAM_4     ; $BDC6   bottom beam
    .byte $F6 ; |XXXX XX | $BDC7
    .byte $E6 ; |XXX  XX | $BDC8
    .byte $06 ; |     XX | $BDC9
    .byte $36 ; |  XX XX | $BDCA
    .byte $DE ; |XX XXXX | $BDCB
    .byte $06 ; |     XX | $BDCC
    .byte $26 ; |  X  XX | $BDCD
    .byte $16 ; |   X XX | $BDCE
    .byte $06 ; |     XX | $BDCF
UFO_Five:
    .byte COL_BEAM_5     ; $BDD0   bottom beam
    .byte $F6 ; |XXXX XX | $BDD1
    .byte $E6 ; |XXX  XX | $BDD2
    .byte $06 ; |     XX | $BDD3
    .byte $46 ; | X   XX | $BDD4
    .byte $CE ; |XX  XXX | $BDD5
    .byte $06 ; |     XX | $BDD6
    .byte $26 ; |  X  XX | $BDD7
    .byte $16 ; |   X XX | $BDD8
    .byte $06 ; |     XX | $BDD9
UFO_Six:
    .byte COL_BEAM_6     ; $BDDA   bottom beam
    .byte $F6 ; |XXXX XX | $BDDB
    .byte $E6 ; |XXX  XX | $BDDC
    .byte $06 ; |     XX | $BDDD
    .byte $56 ; | X X XX | $BDDE
    .byte $BE ; |X XXXXX | $BDDF
    .byte $06 ; |     XX | $BDE0
    .byte $26 ; |  X  XX | $BDE1
    .byte $16 ; |   X XX | $BDE2
    .byte $06 ; |     XX | $BDE3
UFO_Seven:
    .byte COL_BEAM_7     ; $BDE4   bottom beam
    .byte $F6 ; |XXXX XX | $BDE5
    .byte $E6 ; |XXX  XX | $BDE6
    .byte $06 ; |     XX | $BDE7
    .byte $66 ; | XX  XX | $BDE8
    .byte $AE ; |X X XXX | $BDE9
    .byte $06 ; |     XX | $BDEA
    .byte $26 ; |  X  XX | $BDEB
    .byte $16 ; |   X XX | $BDEC
    .byte $06 ; |     XX | $BDED
UFO_Eight:
    .byte COL_BEAM_8     ; $BDEE   bottom beam
    .byte $F6 ; |XXXX XX | $BDEF
    .byte $E6 ; |XXX  XX | $BDF0
    .byte $06 ; |     XX | $BDF1
    .byte $76 ; | XXX XX | $BDF2
    .byte $9E ; |X  XXXX | $BDF3
    .byte $06 ; |     XX | $BDF4
    .byte $26 ; |  X  XX | $BDF5
    .byte $16 ; |   X XX | $BDF6
    .byte $06 ; |     XX | $BDF7

LBDF8:
    .byte <ErnieOne      ; $BDF8
    .byte <ErnieTwo      ; $BDF9
    .byte <ErnieThree    ; $BDFA
    .byte <ErnieFour     ; $BDFB
    .byte <BlankSpace    ; $BDFC
    .byte <BlankSpace    ; $BDFD
    .byte <One+3         ; $BDFE
    .byte <One+3         ; $BDFF
    .byte <Two+3         ; $BE00
    .byte <Two+3         ; $BE01
    .byte <Three+3       ; $BE02
    .byte <Three+3       ; $BE03
LBE04:
    .byte >ErnieOne      ; $BE04
    .byte >ErnieTwo      ; $BE05
    .byte >ErnieThree    ; $BE06
    .byte >ErnieFour     ; $BE07
    .byte >BlankSpace    ; $BE08
    .byte >BlankSpace    ; $BE09
    .byte >One           ; $BE0A
    .byte >One           ; $BE0B
    .byte >Two           ; $BE0C
    .byte >Two           ; $BE0D
    .byte >Three         ; $BE0E
    .byte >Three         ; $BE0F

    .byte $00 ; |        | $BE10
    .byte $00 ; |        | $BE11
    .byte $00 ; |        | $BE12
    .byte $00 ; |        | $BE13
    .byte $00 ; |        | $BE14
    .byte $00 ; |        | $BE15
    .byte $00 ; |        | $BE16
    .byte $00 ; |        | $BE17

LowerCase_a:
    .byte $3C ; |  XXXX  | $BE18
    .byte $7E ; | XXXXXX | $BE19
    .byte $FF ; |XXXXXXXX| $BE1A
    .byte $CB ; |XX  X XX| $BE1B       XX X
    .byte $B3 ; |X XX  XX| $BE1C      X  XX
    .byte $BB ; |X XXX XX| $BE1D      X   X
    .byte $B3 ; |X XX  XX| $BE1E      X  XX
    .byte $CB ; |XX  X XX| $BE1F       XX X
    .byte $FF ; |XXXXXXXX| $BE20
    .byte $FF ; |XXXXXXXX| $BE21
    .byte $7E ; | XXXXXX | $BE22
LowerCase_b:
    .byte $3C ; |  XXXX  | $BE23  shared byte
    .byte $7E ; | XXXXXX | $BE24
    .byte $FF ; |XXXXXXXX| $BE25
    .byte $D3 ; |XX X  XX| $BE26       X
    .byte $CD ; |XX  XX X| $BE27       X
    .byte $DD ; |XX XXX X| $BE28       X XX
    .byte $CD ; |XX  XX X| $BE29       XX  X
    .byte $D3 ; |XX X  XX| $BE2A       X   X
    .byte $DF ; |XX XXXXX| $BE2B       XX  X
    .byte $DF ; |XX XXXXX| $BE2C       X XX
    .byte $7E ; | XXXXXX | $BE2D
LowerCase_c:
    .byte $3C ; |  XXXX  | $BE2E  shared byte
    .byte $7E ; | XXXXXX | $BE2F
    .byte $FF ; |XXXXXXXX| $BE30
    .byte $E3 ; |XXX   XX| $BE31        XXX
    .byte $DF ; |XX XXXXX| $BE32       X
    .byte $DF ; |XX XXXXX| $BE33       X
    .byte $DF ; |XX XXXXX| $BE34       X
    .byte $E3 ; |XXX   XX| $BE35        XXX
    .byte $FF ; |XXXXXXXX| $BE36
    .byte $FF ; |XXXXXXXX| $BE37
    .byte $7E ; | XXXXXX | $BE38
LowerCase_d:
    .byte $3C ; |  XXXX  | $BE39  shared byte
    .byte $7E ; | XXXXXX | $BE3A
    .byte $FF ; |XXXXXXXX| $BE3B
    .byte $CB ; |XX  X XX| $BE3C          X
    .byte $B3 ; |X XX  XX| $BE3D          X
    .byte $BB ; |X XXX XX| $BE3E       XX X
    .byte $B3 ; |X XX  XX| $BE3F      X  XX
    .byte $CB ; |XX  X XX| $BE40      X   X
    .byte $FB ; |XXXXX XX| $BE41      X  XX
    .byte $FB ; |XXXXX XX| $BE42       XX X
    .byte $7E ; | XXXXXX | $BE43
LowerCase_e:
    .byte $3C ; |  XXXX  | $BE44  shared byte
    .byte $7E ; | XXXXXX | $BE45
    .byte $FF ; |XXXXXXXX| $BE46
    .byte $E1 ; |XXX    X| $BE47        XXX
    .byte $DF ; |XX XXXXX| $BE48       X   X
    .byte $C3 ; |XX    XX| $BE49       XXXX
    .byte $DD ; |XX XXX X| $BE4A       X
    .byte $E3 ; |XXX   XX| $BE4B        XXXX
    .byte $FF ; |XXXXXXXX| $BE4C
    .byte $FF ; |XXXXXXXX| $BE4D
    .byte $7E ; | XXXXXX | $BE4E
LowerCase_f:
    .byte $3C ; |  XXXX  | $BE4F  shared byte
    .byte $7E ; | XXXXXX | $BE50
    .byte $FF ; |XXXXXXXX| $BE51
    .byte $EF ; |XXX XXXX| $BE52         XX
    .byte $EF ; |XXX XXXX| $BE53        X
    .byte $EF ; |XXX XXXX| $BE54       XXXX
    .byte $C3 ; |XX    XX| $BE55        X
    .byte $EF ; |XXX XXXX| $BE56        X
    .byte $F3 ; |XXXX  XX| $BE57        X
    .byte $FF ; |XXXXXXXX| $BE58
    .byte $7E ; | XXXXXX | $BE59
LowerCase_g:
    .byte $3C ; |  XXXX  | $BE5A  shared byte
    .byte $7E ; | XXXXXX | $BE5B
    .byte $C3 ; |XX    XX| $BE5C        XX X
    .byte $FD ; |XXXXXX X| $BE5D       X  XX
    .byte $E5 ; |XXX  X X| $BE5E       X   X
    .byte $D9 ; |XX XX  X| $BE5F       X  XX
    .byte $DD ; |XX XXX X| $BE60        XX X
    .byte $D9 ; |XX XX  X| $BE61           X
    .byte $E5 ; |XXX  X X| $BE62       XXXX
    .byte $FF ; |XXXXXXXX| $BE63
    .byte $7E ; | XXXXXX | $BE64
LowerCase_h:
    .byte $3C ; |  XXXX  | $BE65  shared byte
    .byte $7E ; | XXXXXX | $BE66
    .byte $FF ; |XXXXXXXX| $BE67
    .byte $DD ; |XX XXX X| $BE68       X
    .byte $DD ; |XX XXX X| $BE69       X
    .byte $CD ; |XX  XX X| $BE6A       X XX
    .byte $D3 ; |XX X  XX| $BE6B       XX  X
    .byte $DF ; |XX XXXXX| $BE6C       X   X
    .byte $DF ; |XX XXXXX| $BE6D       X   X
    .byte $FF ; |XXXXXXXX| $BE6E
    .byte $7E ; | XXXXXX | $BE6F
LowerCase_i:
    .byte $3C ; |  XXXX  | $BE70  shared byte
    .byte $7E ; | XXXXXX | $BE71
    .byte $FF ; |XXXXXXXX| $BE72
    .byte $F7 ; |XXXX XXX| $BE73         X
    .byte $F7 ; |XXXX XXX| $BE74
    .byte $F7 ; |XXXX XXX| $BE75         X
    .byte $F7 ; |XXXX XXX| $BE76         X
    .byte $FF ; |XXXXXXXX| $BE77         X
    .byte $F7 ; |XXXX XXX| $BE78         X
    .byte $FF ; |XXXXXXXX| $BE79
    .byte $7E ; | XXXXXX | $BE7A
LowerCase_j:
    .byte $3C ; |  XXXX  | $BE7B  shared byte
    .byte $7E ; | XXXXXX | $BE7C
    .byte $E7 ; |XXX  XXX| $BE7D          X
    .byte $DB ; |XX XX XX| $BE7E
    .byte $FB ; |XXXXX XX| $BE7F          X
    .byte $FB ; |XXXXX XX| $BE80          X
    .byte $FB ; |XXXXX XX| $BE81          X
    .byte $FF ; |XXXXXXXX| $BE82       X  X
    .byte $FB ; |XXXXX XX| $BE83        XX
    .byte $FF ; |XXXXXXXX| $BE84
    .byte $7E ; | XXXXXX | $BE85
LowerCase_k:
    .byte $3C ; |  XXXX  | $BE86  shared byte
    .byte $7E ; | XXXXXX | $BE87
    .byte $FF ; |XXXXXXXX| $BE88
    .byte $DD ; |XX XXX X| $BE89       X
    .byte $CB ; |XX  X XX| $BE8A       X
    .byte $D7 ; |XX X XXX| $BE8B       X  X
    .byte $DB ; |XX XX XX| $BE8C       X X
    .byte $DF ; |XX XXXXX| $BE8D       XX X
    .byte $DF ; |XX XXXXX| $BE8E       X   X
    .byte $FF ; |XXXXXXXX| $BE8F
    .byte $7E ; | XXXXXX | $BE90
LowerCase_l:
    .byte $3C ; |  XXXX  | $BE91  shared byte
    .byte $7E ; | XXXXXX | $BE92
    .byte $FF ; |XXXXXXXX| $BE93
    .byte $F7 ; |XXXX XXX| $BE94         X
    .byte $F7 ; |XXXX XXX| $BE95         X
    .byte $F7 ; |XXXX XXX| $BE96         X
    .byte $F7 ; |XXXX XXX| $BE97         X
    .byte $F7 ; |XXXX XXX| $BE98         X
    .byte $F7 ; |XXXX XXX| $BE99         X
    .byte $F7 ; |XXXX XXX| $BE9A         X
    .byte $7E ; | XXXXXX | $BE9B
LowerCase_m:
    .byte $3C ; |  XXXX  | $BE9C  shared byte
    .byte $7E ; | XXXXXX | $BE9D
    .byte $FF ; |XXXXXXXX| $BE9E
    .byte $DD ; |XX XXX X| $BE9F        X X
    .byte $D5 ; |XX X X X| $BEA0       XXXXX
    .byte $D5 ; |XX X X X| $BEA1       X X X
    .byte $C1 ; |XX     X| $BEA2       X X X
    .byte $EB ; |XXX X XX| $BEA3       X   X
    .byte $FF ; |XXXXXXXX| $BEA4
    .byte $FF ; |XXXXXXXX| $BEA5
    .byte $7E ; | XXXXXX | $BEA6
    .byte $3C ; |  XXXX  | $BEA7
Copyright:
    .byte $78 ; | XXXX   | $BEA8       XXXX
    .byte $84 ; |X    X  | $BEA9      X    X
    .byte $B4 ; |X XX X  | $BEAA      X XX X
    .byte $A4 ; |X X  X  | $BEAB      X X  X
    .byte $B4 ; |X XX X  | $BEAC      X XX X
    .byte $84 ; |X    X  | $BEAD      X    X
    .byte $78 ; | XXXX   | $BEAE       XXXX
AtariOne:
    .byte $55 ; | X X X X| $BEAF       X XXX X  XX  X
    .byte $55 ; | X X X X| $BEB0      X X X X X X X X
    .byte $55 ; | X X X X| $BEB1      X X X X X X X X
    .byte $75 ; | XXX X X| $BEB2      XXX X XXX XX  X
    .byte $55 ; | X X X X| $BEB3      X X X X X X X X
    .byte $55 ; | X X X X| $BEB4      X X X X X X X X
    .byte $2E ; |  X XXX | $BEB5      X X X X X X X X
AtariTwo:
    .byte $55 ; | X X X X| $BEB6
    .byte $55 ; | X X X X| $BEB7
    .byte $55 ; | X X X X| $BEB8
    .byte $D9 ; |XX XX  X| $BEB9
    .byte $55 ; | X X X X| $BEBA
    .byte $55 ; | X X X X| $BEBB
    .byte $99 ; |X  XX  X| $BEBC
CCWOne:
    .byte $31 ; |  XX   X| $BEBD       XX   XX  X   X
    .byte $4A ; | X  X X | $BEBE      X  X X  X X   X
    .byte $42 ; | X    X | $BEBF      X    X    X   X
    .byte $42 ; | X    X | $BEC0      X    X    X X X
    .byte $42 ; | X    X | $BEC1      X    X    X X X
    .byte $4A ; | X  X X | $BEC2      X  X X  X X X X
    .byte $31 ; |  XX   X| $BEC3       XX   XX   X X
CCWTwo:
    .byte $8A ; |X   X X | $BEC4
    .byte $55 ; | X X X X| $BEC5
    .byte $15 ; |   X X X| $BEC6
    .byte $15 ; |   X X X| $BEC7
    .byte $11 ; |   X   X| $BEC8
    .byte $51 ; | X X   X| $BEC9
    .byte $91 ; |X  X   X| $BECA
YearOne:
    .byte $12 ; |   X  X | $BECB        X  X   X   X
    .byte $15 ; |   X X X| $BECC       XX X X X X X X
    .byte $11 ; |   X   X| $BECD        X X X X X   X
    .byte $13 ; |   X  XX| $BECE        X  XX  X   X
    .byte $15 ; |   X X X| $BECF        X   X X X   X
    .byte $35 ; |  XX X X| $BED0        X X X X X X X
    .byte $12 ; |   X  X | $BED1        X  X   X   X
YearTwo:
    .byte $22 ; |  X   X | $BED2
    .byte $55 ; | X X X X| $BED3
    .byte $51 ; | X X   X| $BED4
    .byte $22 ; |  X   X | $BED5
    .byte $51 ; | X X   X| $BED6
    .byte $55 ; | X X X X| $BED7
    .byte $22 ; |  X   X | $BED8
MidShipBody:
    .byte $FF ; |XXXXXXXX| $BED9
    .byte $FF ; |XXXXXXXX| $BEDA
    .byte $FF ; |XXXXXXXX| $BEDB
    .byte $FF ; |XXXXXXXX| $BEDC
    .byte $FF ; |XXXXXXXX| $BEDD
    .byte $FF ; |XXXXXXXX| $BEDE
    .byte $FF ; |XXXXXXXX| $BEDF
    .byte $FF ; |XXXXXXXX| $BEE0
    .byte $FF ; |XXXXXXXX| $BEE1
    .byte $FF ; |XXXXXXXX| $BEE2
    .byte $FF ; |XXXXXXXX| $BEE3
    .byte $FF ; |XXXXXXXX| $BEE4
ShuttleDoors:
    .byte $99 ; |X  XX  X| $BEE5
    .byte $99 ; |X  XX  X| $BEE6
    .byte $99 ; |X  XX  X| $BEE7
    .byte $99 ; |X  XX  X| $BEE8
    .byte $99 ; |X  XX  X| $BEE9
    .byte $99 ; |X  XX  X| $BEEA
    .byte $99 ; |X  XX  X| $BEEB
    .byte $99 ; |X  XX  X| $BEEC
    .byte $99 ; |X  XX  X| $BEED
    .byte $99 ; |X  XX  X| $BEEE
    .byte $99 ; |X  XX  X| $BEEF
    .byte $99 ; |X  XX  X| $BEF0
PlanetThree:
    .byte $FF ; |XXXXXXXX| $BEF1   PF2
    .byte $FF ; |XXXXXXXX| $BEF2
    .byte $FF ; |XXXXXXXX| $BEF3
    .byte $FF ; |XXXXXXXX| $BEF4
    .byte $FF ; |XXXXXXXX| $BEF5
    .byte $FF ; |XXXXXXXX| $BEF6
    .byte $FF ; |XXXXXXXX| $BEF7
    .byte $FF ; |XXXXXXXX| $BEF8
    .byte $FF ; |XXXXXXXX| $BEF9
    .byte $FF ; |XXXXXXXX| $BEFA
    .byte $FF ; |XXXXXXXX| $BEFB
    .byte $FF ; |XXXXXXXX| $BEFC
PlanetOne:
    .byte $F0 ; |XXXX    | $BEFD   PF0
    .byte $FF ; |XXXXXXXX| $BEFE
    .byte $FF ; |XXXXXXXX| $BEFF
    .byte $FF ; |XXXXXXXX| $BF00
    .byte $FF ; |XXXXXXXX| $BF01
    .byte $FF ; |XXXXXXXX| $BF02
    .byte $F0 ; |XXXX    | $BF03
    .byte $E0 ; |XXX     | $BF04
    .byte $80 ; |X       | $BF05
    .byte $00 ; |        | $BF06
    .byte $00 ; |        | $BF07
    .byte $00 ; |        | $BF08
PlanetTwo:
    .byte $00 ; |        | $BF09   PF1
    .byte $FF ; |XXXXXXXX| $BF0A
    .byte $FF ; |XXXXXXXX| $BF0B
    .byte $FF ; |XXXXXXXX| $BF0C
    .byte $FF ; |XXXXXXXX| $BF0D
    .byte $FF ; |XXXXXXXX| $BF0E
    .byte $FF ; |XXXXXXXX| $BF0F
    .byte $FF ; |XXXXXXXX| $BF10
    .byte $FF ; |XXXXXXXX| $BF11
    .byte $3F ; |  XXXXXX| $BF12
    .byte $07 ; |     XXX| $BF13
    .byte $00 ; |        | $BF14
    .byte $00 ; |        | $BF15
    .byte $00 ; |        | $BF16
    .byte $00 ; |        | $BF17
LowerCase_n:
    .byte $3C ; |  XXXX  | $BF18
    .byte $7E ; | XXXXXX | $BF19
    .byte $FF ; |XXXXXXXX| $BF1A
    .byte $DB ; |XX XX XX| $BF1B
    .byte $DB ; |XX XX XX| $BF1C        XX
    .byte $DB ; |XX XX XX| $BF1D       XXXX
    .byte $C3 ; |XX    XX| $BF1E       X  X
    .byte $E7 ; |XXX  XXX| $BF1F       X  X
    .byte $FF ; |XXXXXXXX| $BF20       X  X
    .byte $FF ; |XXXXXXXX| $BF21
    .byte $7E ; | XXXXXX | $BF22
LowerCase_o:
    .byte $3C ; |  XXXX  | $BF23  shared byte
    .byte $7E ; | XXXXXX | $BF24
    .byte $FF ; |XXXXXXXX| $BF25
    .byte $E7 ; |XXX  XXX| $BF2         XX
    .byte $DB ; |XX XX XX| $BF27       X  X
    .byte $DB ; |XX XX XX| $BF28       X  X
    .byte $DB ; |XX XX XX| $BF29       X  X
    .byte $E7 ; |XXX  XXX| $BF2A        XX
    .byte $FF ; |XXXXXXXX| $BF2B
    .byte $FF ; |XXXXXXXX| $BF2C
    .byte $7E ; | XXXXXX | $BF2D
LowerCase_p:
    .byte $3C ; |  XXXX  | $BF2E  shared byte
    .byte $7E ; | XXXXXX | $BF2F
    .byte $DF ; |XX XXXXX| $BF30       X XX
    .byte $DF ; |XX XXXXX| $BF31       XX  X
    .byte $D3 ; |XX X  XX| $BF32       X   X
    .byte $CD ; |XX  XX X| $BF33       XX  X
    .byte $DD ; |XX XXX X| $BF34       X XX
    .byte $CD ; |XX  XX X| $BF35       X
    .byte $D3 ; |XX X  XX| $BF36       X
    .byte $FF ; |XXXXXXXX| $BF37
    .byte $7E ; | XXXXXX | $BF38
LowerCase_q:
    .byte $3C ; |  XXXX  | $BF39  shared byte
    .byte $7E ; | XXXXXX | $BF3A
    .byte $FD ; |XXXXXX X| $BF3B       XX X
    .byte $FB ; |XXXXX XX| $BF3C      X  XX
    .byte $FB ; |XXXXX XX| $BF3D      X   X
    .byte $CB ; |XX  X XX| $BF3E      X  XX
    .byte $B3 ; |X XX  XX| $BF3F       XX X
    .byte $BB ; |X XXX XX| $BF40          X
    .byte $B3 ; |X XX  XX| $BF41          X
    .byte $CB ; |XX  X XX| $BF42           X
    .byte $7E ; | XXXXXX | $BF43
LowerCase_r:
    .byte $3C ; |  XXXX  | $BF44  shared byte
    .byte $7E ; | XXXXXX | $BF45
    .byte $FF ; |XXXXXXXX| $BF46
    .byte $DF ; |XX XXXXX| $BF47       X XX
    .byte $DF ; |XX XXXXX| $BF48       XX  X
    .byte $DF ; |XX XXXXX| $BF49       X
    .byte $CD ; |XX  XX X| $BF4A       X
    .byte $D3 ; |XX X  XX| $BF4B       X
    .byte $FF ; |XXXXXXXX| $BF4C
    .byte $FF ; |XXXXXXXX| $BF4D
    .byte $7E ; | XXXXXX | $BF4E
LowerCase_s:
    .byte $3C ; |  XXXX  | $BF4F  shared byte
    .byte $7E ; | XXXXXX | $BF50
    .byte $FF ; |XXXXXXXX| $BF51
    .byte $C3 ; |XX    XX| $BF52        XXX
    .byte $FD ; |XXXXXX X| $BF53       X
    .byte $E3 ; |XXX   XX| $BF54        XXX
    .byte $DF ; |XX XXXXX| $BF55           X
    .byte $E3 ; |XXX   XX| $BF56       XXXX
    .byte $FF ; |XXXXXXXX| $BF57
    .byte $FF ; |XXXXXXXX| $BF58
    .byte $7E ; | XXXXXX | $BF59
LowerCase_t:
    .byte $3C ; |  XXXX  | $BF5A  shared byte
    .byte $7E ; | XXXXXX | $BF5B
    .byte $FF ; |XXXXXXXX| $BF5C
    .byte $F3 ; |XXXX  XX| $BF5D        X
    .byte $EF ; |XXX XXXX| $BF5E        X
    .byte $EF ; |XXX XXXX| $BF5F       XXXX
    .byte $C3 ; |XX    XX| $BF60        X
    .byte $EF ; |XXX XXXX| $BF61        X
    .byte $EF ; |XXX XXXX| $BF62         XX
    .byte $FF ; |XXXXXXXX| $BF63
    .byte $7E ; | XXXXXX | $BF64
LowerCase_u:
    .byte $3C ; |  XXXX  | $BF65  shared byte
    .byte $7E ; | XXXXXX | $BF66
    .byte $FF ; |XXXXXXXX| $BF67
    .byte $E5 ; |XXX  X X| $BF68       X   X
    .byte $D9 ; |XX XX  X| $BF69       X   X
    .byte $DD ; |XX XXX X| $BF6A       X   X
    .byte $DD ; |XX XXX X| $BF6B       X  XX
    .byte $DD ; |XX XXX X| $BF6C        XX X
    .byte $FF ; |XXXXXXXX| $BF6D
    .byte $FF ; |XXXXXXXX| $BF6E
    .byte $7E ; | XXXXXX | $BF6F
LowerCase_v:
    .byte $3C ; |  XXXX  | $BF70  shared byte
    .byte $7E ; | XXXXXX | $BF71
    .byte $FF ; |XXXXXXXX| $BF72
    .byte $F7 ; |XXXX XXX| $BF73       X   X
    .byte $EB ; |XXX X XX| $BF74       X   X
    .byte $DD ; |XX XXX X| $BF75       X   X
    .byte $DD ; |XX XXX X| $BF76        X X
    .byte $DD ; |XX XXX X| $BF77         X
    .byte $FF ; |XXXXXXXX| $BF78
    .byte $FF ; |XXXXXXXX| $BF79
    .byte $7E ; | XXXXXX | $BF7A
LowerCase_w:
    .byte $3C ; |  XXXX  | $BF7B  shared byte
    .byte $7E ; | XXXXXX | $BF7C
    .byte $FF ; |XXXXXXXX| $BF7D
    .byte $EB ; |XXX X XX| $BF7E       X   X
    .byte $C1 ; |XX     X| $BF7F       X X X
    .byte $D5 ; |XX X X X| $BF80       X X X
    .byte $D5 ; |XX X X X| $BF81       XXXXX
    .byte $DD ; |XX XXX X| $BF82        X X
    .byte $FF ; |XXXXXXXX| $BF83
    .byte $FF ; |XXXXXXXX| $BF84
    .byte $7E ; | XXXXXX | $BF85
LowerCase_x:
    .byte $3C ; |  XXXX  | $BF86  shared byte
    .byte $7E ; | XXXXXX | $BF87
    .byte $FF ; |XXXXXXXX| $BF88
    .byte $DD ; |XX XXX X| $BF89       X   X
    .byte $EB ; |XXX X XX| $BF8A        X X
    .byte $F7 ; |XXXX XXX| $BF8B         X
    .byte $EB ; |XXX X XX| $BF8C        X X
    .byte $DD ; |XX XXX X| $BF8D       X   X
    .byte $FF ; |XXXXXXXX| $BF8E
    .byte $FF ; |XXXXXXXX| $BF8F
    .byte $7E ; | XXXXXX | $BF90
LowerCase_y:
    .byte $3C ; |  XXXX  | $BF91  shared byte
    .byte $7E ; | XXXXXX | $BF92
    .byte $DF ; |XX XXXXX| $BF93       X   X
    .byte $EF ; |XXX XXXX| $BF94       X   X
    .byte $F7 ; |XXXX XXX| $BF95        X X
    .byte $EB ; |XXX X XX| $BF96         X
    .byte $DD ; |XX XXX X| $BF97        X
    .byte $DD ; |XX XXX X| $BF98       X
    .byte $FF ; |XXXXXXXX| $BF99
    .byte $FF ; |XXXXXXXX| $BF9A
    .byte $7E ; | XXXXXX | $BF9B
LowerCase_z:
    .byte $3C ; |  XXXX  | $BF9C  shared byte
    .byte $7E ; | XXXXXX | $BF9D
    .byte $FF ; |XXXXXXXX| $BF9E
    .byte $C1 ; |XX     X| $BF9F       XXXXX
    .byte $EF ; |XXX XXXX| $BFA0          X
    .byte $F7 ; |XXXX XXX| $BFA1         X
    .byte $FB ; |XXXXX XX| $BFA2        X
    .byte $C1 ; |XX     X| $BFA3       XXXXX
    .byte $FF ; |XXXXXXXX| $BFA4
    .byte $FF ; |XXXXXXXX| $BFA5
    .byte $7E ; | XXXXXX | $BFA6
    .byte $3C ; |  XXXX  | $BFA7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;     XXXXX X    XXXXX X   X XXXXX
;     X   X X    X   X X   X X   X
;     X   X X    X   X X   X X   X
;     XXXXX X    XXXXX XXXXX XXXXX
;     X   X X    X     X   X X   X
;     X   X X    X     X   X X   X
;     X   X XXXX X     X   X X   X
;
;
;        XXXX  XXXX XXXXX XXXXX
;        X  X  X    X   X X X X
;        X  X  X    X   X X X X
;        XXXXX XXX  XXXXX X X X
;        X   X X    X   X X   X
;        X   X X    X   X X   X
;        XXXXX XXXX X   X X   X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AlphaBeamOne:
    .byte $00 ; |        | $BFA8   PF1
    .byte $07 ; |     XXX| $BFA9
    .byte $04 ; |     X  | $BFAA
    .byte $04 ; |     X  | $BFAB
    .byte $07 ; |     XXX| $BFAC
    .byte $04 ; |     X  | $BFAD
    .byte $04 ; |     X  | $BFAE
    .byte $07 ; |     XXX| $BFAF
    .byte $00 ; |        | $BFB0
    .byte $00 ; |        | $BFB1
    .byte $22 ; |  X   X | $BFB2
    .byte $22 ; |  X   X | $BFB3
    .byte $22 ; |  X   X | $BFB4
    .byte $3E ; |  XXXXX | $BFB5
    .byte $22 ; |  X   X | $BFB6
    .byte $22 ; |  X   X | $BFB7
    .byte $3E ; |  XXXXX | $BFB8
AlphaBeamTwo:
    .byte $00 ; |        | $BFB9   PF2 (reversed)
    .byte $7B ; | XXXX XX| $BFBA
    .byte $0A ; |    X X | $BFBB
    .byte $0A ; |    X X | $BFBC
    .byte $3B ; |  XXX XX| $BFBD
    .byte $09 ; |    X  X| $BFBE
    .byte $09 ; |    X  X| $BFBF
    .byte $79 ; | XXXX  X| $BFC0
    .byte $00 ; |        | $BFC1
    .byte $00 ; |        | $BFC2
    .byte $2F ; |  X XXXX| $BFC3
    .byte $21 ; |  X    X| $BFC4
    .byte $21 ; |  X    X| $BFC5
    .byte $E1 ; |XXX    X| $BFC6
    .byte $21 ; |  X    X| $BFC7
    .byte $21 ; |  X    X| $BFC8
    .byte $E1 ; |XXX    X| $BFC9
AlphaBeamThree:
    .byte $00 ; |        | $BFCA   PF2
    .byte $8A ; |X   X X | $BFCB
    .byte $8A ; |X   X X | $BFCC
    .byte $8A ; |X   X X | $BFCD
    .byte $FA ; |XXXXX X | $BFCE
    .byte $8A ; |X   X X | $BFCF
    .byte $8A ; |X   X X | $BFD0
    .byte $FB ; |XXXXX XX| $BFD1
    .byte $00 ; |        | $BFD2
    .byte $00 ; |        | $BFD3
    .byte $11 ; |   X   X| $BFD4
    .byte $11 ; |   X   X| $BFD5
    .byte $11 ; |   X   X| $BFD6
    .byte $DF ; |XX XXXXX| $BFD7
    .byte $51 ; | X X   X| $BFD8
    .byte $51 ; | X X   X| $BFD9
    .byte $D1 ; |XX X   X| $BFDA
AlphaBeamFour:
    .byte $00 ; |        | $BFDB   PF1 (reversed)
    .byte $04 ; |     X  | $BFDC
    .byte $04 ; |     X  | $BFDD
    .byte $04 ; |     X  | $BFDE
    .byte $05 ; |     X X| $BFDF
    .byte $05 ; |     X X| $BFE0
    .byte $05 ; |     X X| $BFE1
    .byte $07 ; |     XXX| $BFE2
    .byte $00 ; |        | $BFE3
    .byte $00 ; |        | $BFE4
    .byte $22 ; |  X   X | $BFE5
    .byte $22 ; |  X   X | $BFE6
    .byte $22 ; |  X   X | $BFE7
    .byte $3E ; |  XXXXX | $BFE8
    .byte $22 ; |  X   X | $BFE9
    .byte $22 ; |  X   X | $BFEA
    .byte $3E ; |  XXXXX | $BFEB

    .byte $01 ; |       X| $BFEC
    .byte $00 ; |        | $BFED
    .byte $00 ; |        | $BFEE
    .byte $80 ; |X       | $BFEF

LBFF0:
    bit    BANK_1                ; 4
;coming from bank 1
    jmp.ind ($00F3)              ; 5

    .byte $00 ; |        | $BFF6
    .byte $00 ; |        | $BFF7

    .byte $00 ; |        | $BFF8
    .byte HOTSPOT        ; $BFF9  $00 PAL_PROTO, $FF otherwise

       ORG $1FFA
      RORG $BFFA

    .word START_BANK0
LBFFC:
    .word START_BANK0   ; reset vector
    .word START_BANK0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $2000
      RORG $F000

    jmp    (LFFFC)               ; 5

LF003:
    lda    #$2B                  ; 2
    sta    TIM64T                ; 4
    lda    $A3                   ; 3
    and    #$03                  ; 2
    bne    LF038                 ; 2³
    ldy    #$10                  ; 2
LF010:
    ldx    $94,Y                 ; 4
    lda.wy $96,Y                 ; 4
    sta.wy $94,Y                 ; 5
    stx    $96,Y                 ; 4
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    bpl    LF010                 ; 2³
    lda    $E8                   ; 3
    ldx    $EA                   ; 3
    stx    $E8                   ; 3
    sta    $EA                   ; 3
    lda    $C4                   ; 3
    ldy    $C6                   ; 3
    sty    $C4                   ; 3
    sta    $C6                   ; 3
    lda    $C7                   ; 3
    ldy    $C9                   ; 3
    sty    $C7                   ; 3
    sta    $C9                   ; 3
LF038:
    lda    $A7                   ; 3
    cmp    #3                    ; 2
    bcs    LF050                 ; 2³
    lda    $A3                   ; 3
    and    #$10                  ; 2
    beq    LF04A                 ; 2³
    jsr    LF755                 ; 6
    jmp    LF519                 ; 3

LF04A:
    jsr    LF7C5                 ; 6
    jmp    LF519                 ; 3

LF050:
    jsr    LF746                 ; 6
    bcs    LF058                 ; 2³
    jmp    LF519                 ; 3

LF058:
    inc    frameCounter          ; 5
    bne    LF081                 ; 2³
    inc    $9B                   ; 5
    bne    LF081                 ; 2³
    lda    $A3                   ; 3
    and    #$40                  ; 2
    beq    LF06C                 ; 2³
    lda    $A3                   ; 3
    ora    #$20                  ; 2
    sta    $A3                   ; 3
LF06C:
    lda    $A3                   ; 3
    and    #$FC                  ; 2
    ora    #$42                  ; 2
    sta    $A3                   ; 3
    ldx    #$FF                  ; 2
    stx    $92                   ; 3
    inx                          ; 2   X=0
    stx    $90                   ; 3
    stx    $D2                   ; 3
    stx    AUDV0                 ; 3
    stx    AUDV1                 ; 3
LF081:
    lda    frameCounter          ; 3
    and    #$01                  ; 2
    sta    $F8                   ; 3
    lda    $A3                   ; 3
    and    #$60                  ; 2
    beq    LF09C                 ; 2³
    cmp    #$40                  ; 2
    beq    LF099                 ; 2³
    lda    #$F7                  ; 2
    sta    $92                   ; 3
    lda    $9B                   ; 3
    sta    $90                   ; 3
LF099:
    jmp    LF4C1                 ; 3

LF09C:
    ldx    $F7                   ; 3
    bpl    LF0A3                 ; 2³
    jmp    LF519                 ; 3

LF0A3:
    lda    LFEF0,X               ; 4
    sta    $F3                   ; 3
    lda    LFEF7,X               ; 4
    sta    $F4                   ; 3
    jmp.ind ($00F3)              ; 5

LF0B0:  ; indirect jump
    dec    $F6                   ; 5
    beq    LF0D6                 ; 2³
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    LF0D3                 ; 2³
    lda    $E8                   ; 3
    sec                          ; 2
    sbc    #$0C                  ; 2
    cmp    LFF96+1               ; 4
    beq    LF0D3                 ; 2³
    inc    $E8                   ; 5
    ldx    #0                    ; 2
    lda    #8                    ; 2
    jsr    LFD63                 ; 6
    bit    $A3                   ; 3
    bpl    LF0D3                 ; 2³
    dec    $EA                   ; 5
LF0D3:
    jmp    LF264                 ; 3

LF0D6:
    lda    #0                    ; 2
    sta    $F7                   ; 3
    jmp    LF264                 ; 3

LF0DD:  ; indirect jump
    dec    $F6                   ; 5
    beq    LF100                 ; 2³+1
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    LF0FD                 ; 2³
    lda    $E8                   ; 3
    cmp    LFF96+1               ; 4
    beq    LF0FD                 ; 2³
    dec    $E8                   ; 5
    ldx    #0                    ; 2
    lda    #8                    ; 2
    jsr    LFD63                 ; 6
    bit    $A3                   ; 3
    bpl    LF0FD                 ; 2³
    inc    $EA                   ; 5
LF0FD:
    jmp    LF264                 ; 3

LF100:
    ldx    #1                    ; 2
    stx    $E2                   ; 3
    stx    $E3                   ; 3
    stx    $D1                   ; 3
    dex                          ; 2   X=0
    stx    $E0                   ; 3
    stx    $E1                   ; 3
    stx    $D0                   ; 3
    stx    $CC                   ; 3
    stx    $DD                   ; 3
    stx    $DE                   ; 3
    stx    AUDV1                 ; 3
    ldy    #4                    ; 2
    lda    $D6                   ; 3
    and    $D7                   ; 3
    and    #$F0                  ; 2
LF11F:
    rol                          ; 2
    bcc    LF123                 ; 2³
    inx                          ; 2
LF123:
    dey                          ; 2
    bne    LF11F                 ; 2³
    stx    $CD                   ; 3
    ldx    #$11                  ; 2
LF12A:
    jsr    LFC93                 ; 6
    cmp    #$93                  ; 2
    bcc    LF133                 ; 2³
    and    #$7F                  ; 2
LF133:
    cmp    #$0A                  ; 2
    bcs    LF139                 ; 2³
    ora    #$12                  ; 2
LF139:
    sta    $7F,X                 ; 4
    dex                          ; 2
    bne    LF12A                 ; 2³
    ldx    $CD                   ; 3   X=0
    bne    LF168                 ; 2³
    ldx    LFF4B                 ; 4
    inx                          ; 2
    stx    $BC                   ; 3
    stx    $BE                   ; 3
    ldx    LFF00                 ; 4
    stx    $BD                   ; 3
    stx    $BF                   ; 3
    lda    #$0F                  ; 2
    sta    AUDF0                 ; 3
    lda    #1                    ; 2
    sta    AUDC0                 ; 3
    lda    #5                    ; 2
    sta    AUDV0                 ; 3
    lda    #$6A                  ; 2
    sta    $CF                   ; 3
    lda    #$86                  ; 2
    sta    $F7                   ; 3
    jmp    LF17C                 ; 3

LF168:
    lda    #$35                  ; 2
    sta    $CF                   ; 3
    lda    #8                    ; 2
    sta    AUDC0                 ; 3
    lda    #$0A                  ; 2
    sta    AUDF0                 ; 3
    lda    #5                    ; 2
    sta    AUDV0                 ; 3
    lda    #$85                  ; 2
    sta    $F7                   ; 3
LF17C:
    lda    $A3                   ; 3
    and    #$FC                  ; 2
    ora    #$01                  ; 2
    sta    $A3                   ; 3
    jmp    LF519                 ; 3

LF187:  ; indirect jump
    dec    $F6                   ; 5
    lda    $F6                   ; 3
    beq    LF197                 ; 2³
    cmp    #2                    ; 2
    beq    LF1B4                 ; 2³
    jsr    LFA76                 ; 6
    jmp    LF519                 ; 3

LF197:
    jsr    LFAB6                 ; 6
    lda    #$80                  ; 2
    sta    VBLANK                ; 3
    lda    #0                    ; 2
    sta    VBLANK                ; 3
    lda    #$EE                  ; 2
    sta    SWCHA                 ; 4
    lda    #6                    ; 2
    sta    $F7                   ; 3
    lda    #$36                  ; 2
    sta    $F6                   ; 3
    sta    CXCLR                 ; 3
    jmp    LF519                 ; 3

LF1B4:
    jsr    LF95A                 ; 6
    jmp    LF519                 ; 3

LF1BA:  ; indirect jump
    lda    $D6                   ; 3
    and    $D7                   ; 3
    cmp    #$F0                  ; 2
    bcc    LF1D5                 ; 2³
    ldx    $9F                   ; 3
    ldy    #2                    ; 2
    lda    LFEC0,X               ; 4
    and    #$3C                  ; 2
    beq    LF1D3                 ; 2³
    ldy    #4                    ; 2
    lda    #2                    ; 2
    sta    $EE                   ; 3
LF1D3:
    sty    $F7                   ; 3
LF1D5:  ; indirect jump (also)
    lda    $A3                   ; 3
    and    #$10                  ; 2
    bne    LF231                 ; 2³+1
    ldx    $9F                   ; 3
    lda    LFEC0,X               ; 4
    and    #$3C                  ; 2
    beq    LF231                 ; 2³+1
    lsr                          ; 2
    lsr                          ; 2
    ldy    $F7                   ; 3
    cpy    #4                    ; 2
    bne    LF1EE                 ; 2³
    lda    #1                    ; 2
LF1EE:
    sta    $FA                   ; 3
    dec    $ED                   ; 5
    bne    LF231                 ; 2³+1
    dec    $EE                   ; 5
    bne    LF22D                 ; 2³+1
    ldx    $EB                   ; 3
    dex                          ; 2
    dex                          ; 2
    stx    $F3                   ; 3
    lda    $EC                   ; 3
    sta    $F4                   ; 3
    jsr    LFBA2                 ; 6
    bne    LF20F                 ; 2³
    ldy    $F7                   ; 3
    cpy    #4                    ; 2
    bne    LF22D                 ; 2³
    beq    LF213                 ; 3   always branch

LF20F:
    cmp    #$37                  ; 2
    bne    LF219                 ; 2³
LF213:
    lda    #2                    ; 2
    sta    $F7                   ; 3
    lda    #1                    ; 2
LF219:
    sec                          ; 2
    sbc    #1                    ; 2
    jsr    LF866                 ; 6
    ldx    $F3                   ; 3
    inx                          ; 2
    inx                          ; 2
    stx    $EB                   ; 3
    ldx    $F4                   ; 3
    stx    $EC                   ; 3
    ldx    $FA                   ; 3
    stx    $EE                   ; 3
LF22D:
    ldx    #$43                  ; 2
    stx    $ED                   ; 3
LF231:
    lda    $E6                   ; 3
    ora    $E7                   ; 3
    bne    LF264                 ; 2³
    ldy    $F7                   ; 3
    cpy    #2                    ; 2
    bne    LF262                 ; 2³
    ldy    #2                    ; 2
LF23F:
    tya                          ; 2
    asl                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    $A8,X                 ; 4
    cmp    LFFDD,Y               ; 4
    bne    LF25C                 ; 2³
    lda    $A9,X                 ; 4
    cmp    LFFE0,Y               ; 4
    bne    LF25C                 ; 2³
    dey                          ; 2
    bpl    LF23F                 ; 2³
    lda    #<Hi_Gfx+1            ; 2
    sta    $EB                   ; 3
    lda    #>Hi_Gfx              ; 2
    sta    $EC                   ; 3
LF25C:
    ldy    #3                    ; 2
    lda    #$78                  ; 2
    sta    $F6                   ; 3
LF262:
    sty    $F7                   ; 3
LF264:
    lda    $D3                   ; 3
    bit    CXP0FB                ; 3
    bvc    LF27A                 ; 2³
    ldx    #4                    ; 2
    cmp    #$57                  ; 2
    bcc    LF286                 ; 2³
    inx                          ; 2
    inx                          ; 2
    cmp    #$77                  ; 2
    bcc    LF286                 ; 2³
    inx                          ; 2
    inx                          ; 2
    bcs    LF286                 ; 3   always branch

LF27A:
    bit    CXP1FB                ; 3
    bvc    LF28C                 ; 2³
    ldx    #0                    ; 2
    cmp    #$17                  ; 2
    bcc    LF286                 ; 2³
    inx                          ; 2
    inx                          ; 2
LF286:
    lda    $D9,X                 ; 4
    ora    #$80                  ; 2
    sta    $D9,X                 ; 4
LF28C:
    sta    CXCLR                 ; 3
    ldx    $F8                   ; 3
    lda    $E6,X                 ; 4
    bne    LF297                 ; 2³
    jmp    LF315                 ; 3

LF297:
    lda    $D6,X                 ; 4
    and    #$01                  ; 2
    bne    LF2A0                 ; 2³
    jmp    LF359                 ; 3

LF2A0:
    dec    $E6,X                 ; 6
    beq    LF2CC                 ; 2³
    jsr    LF856                 ; 6
    clc                          ; 2
    adc    #$43                  ; 2
    jsr    LF866                 ; 6
    jsr    LF881                 ; 6
    jsr    LFDB0                 ; 6
    clc                          ; 2
    adc    $F3                   ; 3
    sta    $F3                   ; 3
    jsr    LFD73                 ; 6
    jsr    LF856                 ; 6
    eor    #$07                  ; 2
    clc                          ; 2
    adc    #$43                  ; 2
    jsr    LF866                 ; 6
    jsr    LFD8A                 ; 6
    jmp    LF478                 ; 3

LF2CC:
    jsr    LF881                 ; 6
    stx    $F3                   ; 3
    sta    $F4                   ; 3
    ldx    $F3                   ; 3
    ldy    $9F                   ; 3
    lda    LFFB1-1,Y             ; 4
    and    #$40                  ; 2
    beq    LF2EB                 ; 2³
    lda    $F4                   ; 3
    jsr    LFB6C                 ; 6
    ldx    $F3                   ; 3
    jsr    LFD55                 ; 6
    jmp    LF2F2                 ; 3

LF2EB:
    lda    $F4                   ; 3
    jsr    LFD55                 ; 6
    lda    #0                    ; 2
LF2F2:
    jsr    LF866                 ; 6
    jsr    LFDB0                 ; 6
    clc                          ; 2
    adc    $F3                   ; 3
    sta    $F3                   ; 3
    jsr    LFD73                 ; 6
    ldx    $F8                   ; 3
    lda    $D4,X                 ; 4
    jsr    LF866                 ; 6
    jsr    LFD8A                 ; 6
    ldx    $F8                   ; 3
    lda    $D6,X                 ; 4
    and    #$F0                  ; 2
    sta    $D6,X                 ; 4
    jmp    LF478                 ; 3

LF315:
    jsr    LF881                 ; 6
    bcs    LF31D                 ; 2³
    jmp    LF3A2                 ; 3

LF31D:
    lda    frameCounter          ; 3
    ror                          ; 2
    txa                          ; 2
    rol                          ; 2
    rol                          ; 2
    tax                          ; 2
    lda    $80,X                 ; 4
    sta    $F3                   ; 3
    lda    $81,X                 ; 4
    sta    $F4                   ; 3
    txa                          ; 2
    ror                          ; 2
    ror                          ; 2
    tax                          ; 2
    lda    #0                    ; 2
    rol                          ; 2
    jsr    LFDB0                 ; 6
    eor    #$FF                  ; 2
    sec                          ; 2
    adc    $F3                   ; 3
    sta    $F3                   ; 3
    jsr    LFBA2                 ; 6
    tay                          ; 2
    ldx    $F8                   ; 3
    sty    $D4,X                 ; 4
    lda    #$38                  ; 2
    sta    $E6,X                 ; 4
    lda    $D6,X                 ; 4
    and    #$F0                  ; 2
    ora    #$01                  ; 2
    sta    $D6,X                 ; 4
    lda    #7                    ; 2
    jsr    LFD63                 ; 6
    jmp    LF478                 ; 3

LF359:
    dec    $E6,X                 ; 6
    beq    LF37D                 ; 2³
    jsr    LF856                 ; 6
    eor    #$07                  ; 2
    clc                          ; 2
    adc    #$43                  ; 2
    jsr    LF866                 ; 6
    jsr    LFB89                 ; 6
    jsr    LFD99                 ; 6
    jsr    LF856                 ; 6
    clc                          ; 2
    adc    #$43                  ; 2
    jsr    LF866                 ; 6
    jsr    LFD8A                 ; 6
    jmp    LF478                 ; 3

LF37D:
    ldx    $F8                   ; 3
    lda    $D4,X                 ; 4
    jsr    LF866                 ; 6
    jsr    LFB89                 ; 6
    jsr    LFD99                 ; 6
    ldy    #0                    ; 2
    ldx    $F8                   ; 3
    sty    $D4,X                 ; 4
    tya                          ; 2
    jsr    LF866                 ; 6
    jsr    LFD8A                 ; 6
    ldx    $F8                   ; 3
    lda    $D6,X                 ; 4
    and    #$F0                  ; 2
    sta    $D6,X                 ; 4
    jmp    LF478                 ; 3

LF3A2:
    ldx    $F8                   ; 3
    lda    $D6,X                 ; 4
    and    #$02                  ; 2
    bne    LF3AD                 ; 2³
    jmp    LF478                 ; 3

LF3AD:
    lda    $D4,X                 ; 4
    bne    LF3B4                 ; 2³
    jmp    LF478                 ; 3

LF3B4:
    jsr    LFB89                 ; 6
    bcs    LF3BC                 ; 2³
    jmp    LF478                 ; 3

LF3BC:
    stx    $F4                   ; 3
    jsr    LF7FB                 ; 6
    bcc    LF3C6                 ; 2³
    jmp    LF478                 ; 3

LF3C6:
    lda    $E2,X                 ; 4
    cmp    #$35                  ; 2
    beq    LF3D4                 ; 2³
    jsr    LF83F                 ; 6
    bcs    LF3D4                 ; 2³
    jmp    LF478                 ; 3

LF3D4:
    bit    $A3                   ; 3
    bmi    LF3DB                 ; 2³
    jmp    LF45A                 ; 3

LF3DB:
    tya                          ; 2
    eor    #$01                  ; 2
    ldx    $F4                   ; 3
    jsr    LF7FD                 ; 6
    bcc    LF404                 ; 2³+1
    jsr    LF873                 ; 6
    jsr    LFBA2                 ; 6
    cmp    #$43                  ; 2
    bcc    LF44F                 ; 2³+1
    lda    $D4                   ; 3
    cmp    $D5                   ; 3
    beq    LF45A                 ; 2³+1
    clc                          ; 2
    adc    #$1A                  ; 2
    cmp    #$35                  ; 2
    bcc    LF3FE                 ; 2³
    sbc    #$34                  ; 2
LF3FE:
    cmp    $D5                   ; 3
    beq    LF45A                 ; 2³
    bne    LF478                 ; 3   always branch

LF404:
    ldy    $9F                   ; 3
    cpy    #9                    ; 2
    bcc    LF45A                 ; 2³
    cpy    #$0C                  ; 2
    bcs    LF45A                 ; 2³
    sta    $FC                   ; 3
    eor    #$01                  ; 2
    sta    $FD                   ; 3
    stx    $FA                   ; 3
    ldx    #3                    ; 2
    stx    $FB                   ; 3
LF41A:
    ldx    $FB                   ; 3
    cpx    $FA                   ; 3
    beq    LF448                 ; 2³
    lda    $FC                   ; 3
    jsr    LF873                 ; 6
    jsr    LFBA2                 ; 6
    cmp    #$43                  ; 2
    bcs    LF435                 ; 2³
    ldy    $FD                   ; 3
    jsr    LF83F                 ; 6
    bcc    LF448                 ; 2³
    bcs    LF478                 ; 3   always branch

LF435:
    lda    $D4                   ; 3
    cmp    $D5                   ; 3
    beq    LF478                 ; 2³
    clc                          ; 2
    adc    #$1A                  ; 2
    cmp    #$35                  ; 2
    bcc    LF444                 ; 2³
    sbc    #$34                  ; 2
LF444:
    cmp    $D5                   ; 3
    beq    LF478                 ; 2³
LF448:
    dec    $FB                   ; 5
    bpl    LF41A                 ; 2³
    jmp    LF45A                 ; 3

LF44F:
    tax                          ; 2
    ldy    $F8                   ; 3
    txa                          ; 2
    jsr    LF83F                 ; 6
    bcs    LF45A                 ; 2³
    bcc    LF478                 ; 3   always branch

LF45A:
    jsr    LFB89                 ; 6
    ldy    $F8                   ; 3
    lda    #$38                  ; 2
    sta.wy $E6,Y                 ; 5
    lda.wy $D6,Y                 ; 4
    and    #$F0                  ; 2
    ora    #$02                  ; 2
    ora    LFE5B,X               ; 4
    sta.wy $D6,Y                 ; 5
    ldx    $F8                   ; 3
    lda    #7                    ; 2
    jsr    LFD63                 ; 6
LF478:
    jsr    LF93A                 ; 6
    ldx    $F8                   ; 3
    jsr    LFCAA                 ; 6
    ldx    $F8                   ; 3
    lda    $E6,X                 ; 4
    bne    LF4BE                 ; 2³
    lda    $9F                   ; 3
    cmp    #3                    ; 2
    bcs    LF4AC                 ; 2³
    lda    $D4,X                 ; 4
    bne    LF49E                 ; 2³
    ldy    #7                    ; 2
LF492:
    lda    LFED2,Y               ; 4
    cmp    $D2,X                 ; 4
    beq    LF4AC                 ; 2³
    dey                          ; 2
    bne    LF492                 ; 2³
    beq    LF4B8                 ; 3   always branch

LF49E:
    ldy    #6                    ; 2
LF4A0:
    lda    LFED9,Y               ; 4
    cmp    $D2,X                 ; 4
    beq    LF4AC                 ; 2³
    dey                          ; 2
    bne    LF4A0                 ; 2³
    beq    LF4B8                 ; 3   always branch

LF4AC:
    lda    $D6,X                 ; 4
    and    #$F0                  ; 2
    sta    $D6,X                 ; 4
    lda    $D0,X                 ; 4
    and    #$DF                  ; 2
    sta    $D0,X                 ; 4
LF4B8:
    lda    $D6,X                 ; 4
    and    #$FC                  ; 2
    sta    $D6,X                 ; 4
LF4BE:
    jmp    LF519                 ; 3

LF4C1:
    ldx    $D2                   ; 3
    inx                          ; 2
    stx    $D2                   ; 3
    bne    LF4D3                 ; 2³
    ldy    $D4                   ; 3
    iny                          ; 2
    cpy    #$35                  ; 2
    bcc    LF4D1                 ; 2³
    ldy    #1                    ; 2
LF4D1:
    sty    $D4                   ; 3
LF4D3:
    cpx    #$A6                  ; 2
    bcs    LF505                 ; 2³+1
    cpx    #8                    ; 2
    bcc    LF505                 ; 2³+1
    ldx    #0                    ; 2
    lda    $D6                   ; 3
    ora    #$08                  ; 2
    sta    $D6                   ; 3
    jsr    LFCF0                 ; 6
    ldx    #1                    ; 2
    lda    $D2                   ; 3
    sec                          ; 2
    sbc    #6                    ; 2
    jsr    LF80A                 ; 6
    jsr    LF82D                 ; 6
    ldx    #4                    ; 2
    lda    $D2                   ; 3
    sec                          ; 2
    sbc    #3                    ; 2
    jsr    LF80A                 ; 6
    jsr    LF82D                 ; 6
    ldx    $D4                   ; 3
    jmp    LF50F                 ; 3

LF505:
    lda    #$4F                  ; 2
    sta    $C7                   ; 3
    lda    #$BB                  ; 2
    sta    $C8                   ; 3
    ldx    #0                    ; 2
LF50F:
    lda    LFF4B,X               ; 4
    sta    $C0                   ; 3
    lda    LFF00,X               ; 4
    sta    $C1                   ; 3
LF519:
    lda    INTIM                 ; 4
    bne    LF519                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #2                    ; 2
    sta    VSYNC                 ; 3
    lda    #$22                  ; 2
    sta    TIM8T                 ; 4
    ldx    #1                    ; 2
    jsr    LFBF5                 ; 6
LF530:
    lda    INTIM                 ; 4
    bne    LF530                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    VSYNC                 ; 3
    lda    #$35                  ; 2
    sta    TIM64T                ; 4
    lda    $A3                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    LFDE0,X               ; 4
    sta    $F3                   ; 3
    lda    LFDE4,X               ; 4
    sta    $F4                   ; 3
    jmp.ind ($00F3)              ; 5

LF552:  ; indirect jump
    lda    #<LB1AC               ; 2
    sta    $F3                   ; 3
    lda    #>LB1AC               ; 2
    sta    $F4                   ; 3
    jmp    LFFF0                 ; 3   bankswitch, goto LB1AC

LF55D:  ; indirect jump
    jmp    LF6ED                 ; 3

LF560:  ; indirect jump
    lda    $9F                   ; 3
    cmp    #3                    ; 2
    bcc    LF58A                 ; 2³
    ldx    $F8                   ; 3
    beq    LF570                 ; 2³
    lda    $A3                   ; 3
    and    #$10                  ; 2
    bne    LF58A                 ; 2³
LF570:
    lda    $E6,X                 ; 4
    beq    LF57A                 ; 2³
    lda    $D6,X                 ; 4
    and    #$01                  ; 2
    bne    LF58A                 ; 2³
LF57A:
    jsr    LF8DE                 ; 6
    lda    $E6,X                 ; 4
    beq    LF587                 ; 2³
    lda    $D6,X                 ; 4
    and    #$01                  ; 2
    bne    LF58A                 ; 2³
LF587:
    jsr    LF89D                 ; 6
LF58A:
    lda    INTIM                 ; 4
    cmp    #$24                  ; 2
    beq    LF593                 ; 2³
    bcs    LF58A                 ; 2³
LF593:
    ldx    #2                    ; 2
    jsr    LFBF5                 ; 6
    lda    INTIM                 ; 4
    sec                          ; 2
    sbc    #8                    ; 2
    sta    $F4                   ; 3
    lda    #0                    ; 2
    sta    ENABL                 ; 3
    ldx    #0                    ; 2
    lda    $CC                   ; 3
    jsr    LF80A                 ; 6
    jsr    LF82D                 ; 6
    ldx    #1                    ; 2
    lda    $CE                   ; 3
    jsr    LF80A                 ; 6
    jsr    LF82D                 ; 6
    ldx    #2                    ; 2
    lda    #$0B                  ; 2
    jsr    LF80A                 ; 6
    jsr    LF82D                 ; 6
    ldx    #3                    ; 2
    lda    #$13                  ; 2
    jsr    LF80A                 ; 6
    jsr    LF82D                 ; 6
    ldx    #4                    ; 2
    lda    $D2                   ; 3
    clc                          ; 2
    adc    #3                    ; 2
    jsr    LF80A                 ; 6
    jsr    LF82D                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
LF5DD:
    lda    INTIM                 ; 4
    cmp    $F4                   ; 3
    beq    LF5E6                 ; 2³
    bcs    LF5DD                 ; 2³
LF5E6:
    ldx    #3                    ; 2
    jsr    LFBF5                 ; 6
    lda    INTIM                 ; 4
    sec                          ; 2
    sbc    #8                    ; 2
    bpl    LF5F4                 ; 2³
    brk                          ; 7

LF5F4:
    sta    $F4                   ; 3
    ldx    #1                    ; 2
LF5F8:
    lda    $F1,X                 ; 4
    bne    LF600                 ; 2³+1
    sta    AUDV0,X               ; 4
    beq    LF66B                 ; 3   always branch

LF600:
    cmp    #8                    ; 2
    bne    LF608                 ; 2³
    lda    $F8                   ; 3
    bne    LF66B                 ; 2³
LF608:
    dec    $EF,X                 ; 6
    ldy    $F1,X                 ; 4
    cpy    #7                    ; 2
    bne    LF62A                 ; 2³
    lda    LFDFA,X               ; 4
    sta    AUDC0,X               ; 4
    jsr    LFC93                 ; 6
    and    #$0F                  ; 2
    sta    AUDF0,X               ; 4
    lda    $EF,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LFDD0,Y               ; 4
    sta    AUDV0,X               ; 4
    bne    LF665                 ; 2³  always branch?
LF62A:
    cpy    #6                    ; 2
    bne    LF633                 ; 2³
    lda    LFDFA,X               ; 4
    sta    AUDC0,X               ; 4
LF633:
    lda    LFDFC-1,Y             ; 4
    sta    $F3                   ; 3
    lda    LFE06-1,Y             ; 4
    sta    $F4                   ; 3
    ldy    $EF,X                 ; 4
    lda    ($F3),Y               ; 5
    and    #$7F                  ; 2
    cmp    #$20                  ; 2
    bcs    LF64D                 ; 2³
    and    #$1F                  ; 2
    sta    AUDV0,X               ; 4
    bpl    LF661                 ; 2³
LF64D:
    cmp    #$40                  ; 2
    bcs    LF657                 ; 2³
    and    #$1F                  ; 2
    sta    AUDF0,X               ; 4
    bpl    LF661                 ; 2³
LF657:
    cmp    #$60                  ; 2
    bcs    LF661                 ; 2³
    and    #$1F                  ; 2
    sta    AUDC0,X               ; 4
    bpl    LF661                 ; 2³
LF661:
    lda    ($F3),Y               ; 5
    bpl    LF608                 ; 2³
LF665:
    lda    $EF,X                 ; 4
    bne    LF66B                 ; 2³
    sta    $F1,X                 ; 4
LF66B:
    dex                          ; 2
    bpl    LF5F8                 ; 2³+1
    jsr    LF93A                 ; 6
    ldx    #0                    ; 2
    lda    $CD                   ; 3
    jsr    LF80A                 ; 6
    pha                          ; 3  here
    lda    $CF                   ; 3
    clc                          ; 2
    adc    #6                    ; 2
    jsr    LF80A                 ; 6
    pha                          ; 3
    lda    $D3                   ; 3
    sec                          ; 2
    sbc    #6                    ; 2
    jsr    LF80A                 ; 6
    pha                          ; 3
    ldx    #4                    ; 2
    lda    $D3                   ; 3
    sec                          ; 2
    sbc    #3                    ; 2
    jsr    LF80A                 ; 6
    pha                          ; 3
    ldx    #0                    ; 2
    lda    $D2                   ; 3
    sec                          ; 2
    sbc    #6                    ; 2
    jsr    LF80A                 ; 6
    pha                          ; 3
    bit    INPT0                 ; 3
    bmi    LF6AB                 ; 2³
    lda    $D6                   ; 3
    and    #$F0                  ; 2
    sta    $D6                   ; 3
LF6AB:
    bit    INPT2                 ; 3
    bmi    LF6B5                 ; 2³
    lda    $D7                   ; 3
    and    #$F0                  ; 2
    sta    $D7                   ; 3
LF6B5:
    lda    #$80                  ; 2
    sta    VBLANK                ; 3
    lda    #0                    ; 2
    sta    VBLANK                ; 3
    lda    #$EE                  ; 2
    sta    SWCHA                 ; 4
    sta    HMCLR                 ; 3
    lda    #$12                  ; 2
    sta    CTRLPF                ; 3
    lda    frameCounter          ; 3
    and    #$1C                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    ColTopBeamTab,X       ; 4
    ora    #$40                  ; 2
    sta    COLUPF                ; 3   top beam
    ldx    #0                    ; 2
    lda    $D6                   ; 3
    and    #$01                  ; 2
    beq    LF6E0                 ; 2³
    ldx    #2                    ; 2
LF6E0:
    stx    ENABL                 ; 3
    lda    $D7                   ; 3
    and    #$01                  ; 2
    beq    LF6ED                 ; 2³
    lda    LFE6B+1               ; 4
    sta    $C9                   ; 3
LF6ED:  ;indirect jump (also)
    lda    $A3                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    LFDD8,X               ; 4   indirect low table
    sta    $F3                   ; 3
    lda    LFDDC,X               ; 4   indirect high table
    sta    $F4                   ; 3
LF6FC:
    lda    INTIM                 ; 4
    bne    LF6FC                 ; 2³
    jmp    LFFF0                 ; 3   bankswitch


START_BANK1:
    cli                          ; 2
    cld                          ; 2
    lda    #0                    ; 2
    tax                          ; 2
.loopClear:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    .loopClear            ; 2³
    dex                          ; 2   X=$FF
    txs                          ; 2   reset stack pointer
    stx    SWACNT                ; 4
    stx    $92                   ; 3
    inx                          ; 2   X=0
    stx    frameCounter          ; 3   this is not necessary, as all this ram is already
    stx    $9B                   ; 3   at zero from the clear loop...
    stx    $90                   ; 3
    stx    $D2                   ; 3
    inx                          ; 2   X=1
    stx    $9F                   ; 3
    stx    $D4                   ; 3
    lda    #3                    ; 2
    sta    $A7                   ; 3
    lda    LFE6B+2               ; 4   >ShuttleGfxOne
    sta    $C8                   ; 3
    lda    LFE6B                 ; 4   <ShuttleGfxOne-1
    sta    $C7                   ; 3
    sta    $C9                   ; 3
    lda    LFE76                 ; 4   >UFO_One
    sta    $C5                   ; 3
    lda    LFE6E                 ; 4   <UFO_One-1
    sta    $C4                   ; 3
    sta    $C6                   ; 3
    lda    #$42                  ; 2
    sta    $A3                   ; 3
    jmp    LF003                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF746 SUBROUTINE
    lda    SWCHB                 ; 4
    ror                          ; 2
    bcc    LF7C5                 ; 2³
    ror                          ; 2
    bcc    LF755                 ; 2³
    ldx    #3                    ; 2
    stx    $A7                   ; 3
LF753:
    sec                          ; 2
    rts                          ; 6

LF755 SUBROUTINE
    dec    $A7                   ; 5
    lda    $A7                   ; 3
    cmp    #3                    ; 2
    bcs    LF753                 ; 2³
    cmp    #2                    ; 2
    beq    LF776                 ; 2³
    cmp    #1                    ; 2
    beq    LF79D                 ; 2³
    jsr    LFAB6                 ; 6
    ldx    $9F                   ; 3
    lda    LFE7E-1,X             ; 4
    sta    $F5                   ; 3
    lda    #$1E                  ; 2
    sta    $A7                   ; 3
    jmp    LF7BF                 ; 3

LF776:
    ldx    $9F                   ; 3
    lda    $A3                   ; 3
    and    #$10                  ; 2
    beq    LF785                 ; 2³
    inx                          ; 2
    cpx    #$13                  ; 2
    bne    LF785                 ; 2³
    ldx    #1                    ; 2
LF785:
    stx    $9F                   ; 3
    lda    LFFB1-1,X             ; 4
    and    #$80                  ; 2
    ora    #$10                  ; 2
    sta    $A3                   ; 3
    ldx    $9F                   ; 3
    lda    LFE7E-1,X             ; 4
    sta    $F5                   ; 3
    jsr    LF95A                 ; 6
    jmp    LF7BF                 ; 3

LF79D:
    jsr    LFA76                 ; 6
    clc                          ; 2
    ldx    #0                    ; 2
    stx    $DB                   ; 3
    stx    $DD                   ; 3
    stx    $DF                   ; 3
    ldy    $9F                   ; 3
    lda    LFFB1-1,Y             ; 4
    tay                          ; 2
    and    #$0F                  ; 2
    adc    #$36                  ; 2
    sta    $D9                   ; 3
    tya                          ; 2
    bpl    LF7B9                 ; 2³
    inx                          ; 2
LF7B9:
    inx                          ; 2
    txa                          ; 2
    adc    #$36                  ; 2
    sta    $E1                   ; 3
LF7BF:
    lda    #0                    ; 2
    sta    $F7                   ; 3
    beq    LF7F5                 ; 3   always branch

LF7C5 SUBROUTINE
    dec    $A7                   ; 5
    lda    $A7                   ; 3
    cmp    #3                    ; 2
    bcs    LF753                 ; 2³
    cmp    #2                    ; 2
    beq    LF7E2                 ; 2³
    cmp    #1                    ; 2
    beq    LF7EE                 ; 2³
    jsr    LFAB6                 ; 6
    ldx    #$1E                  ; 2
    stx    $A7                   ; 3
    lda    #$36                  ; 2
    sta    $F6                   ; 3
    bne    LF7F1                 ; 3   always branch

LF7E2:
    jsr    LF95A                 ; 6
    lda    $A3                   ; 3
    and    #$8F                  ; 2
    sta    $A3                   ; 3
    jmp    LF7F1                 ; 3

LF7EE:
    jsr    LFA76                 ; 6
LF7F1:
    lda    #6                    ; 2
    sta    $F7                   ; 3
LF7F5:
    lda    #0                    ; 2
    sta    $9B                   ; 3
    clc                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF7FB SUBROUTINE
    lda    $F8                   ; 3
LF7FD SUBROUTINE
    tay                          ; 2
    clc                          ; 2
    lda.wy $D6,Y                 ; 4
    and    LFE5B,X               ; 4
    beq    LF808                 ; 2³
    sec                          ; 2
LF808:
    tya                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF80A SUBROUTINE
    ldy    #$FF                  ; 2
    cmp    #$52                  ; 2
    bcc    LF814                 ; 2³
    sbc    #$4B                  ; 2
    ldy    #4                    ; 2
LF814:
    cpx    #2                    ; 2
    adc    #2                    ; 2
LF818:
    iny                          ; 2
    sbc    #$0F                  ; 2
    bcs    LF818                 ; 2³
    eor    #$FF                  ; 2
    sbc    #6                    ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $F3                   ; 3
    tya                          ; 2
    and    #$0F                  ; 2
    ora    $F3                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF82D SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMP0,X                ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    jmp    LF837                 ; 3

LF837:
    nop                          ; 2
    nop                          ; 2
LF839:
    dey                          ; 2
    bpl    LF839                 ; 2³
    sta    RESP0,X               ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF83F SUBROUTINE
    cmp.wy $D4,Y                 ; 4
    beq    LF854                 ; 2³
    clc                          ; 2
    adc    #$1A                  ; 2
    cmp    #$35                  ; 2
    bcc    LF84D                 ; 2³
    sbc    #$34                  ; 2
LF84D:
    cmp.wy $D4,Y                 ; 4
    beq    LF854                 ; 2³
    clc                          ; 2
    rts                          ; 6

LF854:
    sec                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF856 SUBROUTINE
    ldy    $F8                   ; 3
    lda.wy $E6,Y                 ; 4
    tay                          ; 2
    lsr                          ; 2
    tya                          ; 2
    and    #$F8                  ; 2
    adc    #7                    ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF866 SUBROUTINE
    tay                          ; 2
    lda    LFF4B,Y               ; 4
    sta    $F3                   ; 3
    lda    LFF00,Y               ; 4
    sta    $F4                   ; 3
    tya                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF873 SUBROUTINE
    ror                          ; 2
    txa                          ; 2
    rol                          ; 2
    rol                          ; 2
    tax                          ; 2
    lda    $A8,X                 ; 4
    sta    $F3                   ; 3
    lda    $A9,X                 ; 4
    sta    $F4                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF881 SUBROUTINE
    lda    frameCounter          ; 3
    ror                          ; 2
    lda    #4                    ; 2
    rol                          ; 2
    tax                          ; 2
LF888:
    lda    $D8,X                 ; 4
    cmp    #$80                  ; 2
    bcs    LF894                 ; 2³
    dex                          ; 2
    dex                          ; 2
    bpl    LF888                 ; 2³
    clc                          ; 2
    rts                          ; 6

LF894:
    and    #$7F                  ; 2
    tay                          ; 2
    txa                          ; 2
    lsr                          ; 2
    tax                          ; 2
    tya                          ; 2
    sec                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF89D SUBROUTINE
    lda    frameCounter          ; 3
    ror                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFF99,Y               ; 4
    and    #$04                  ; 2
    bne    LF8AB                 ; 2³
    rts                          ; 6

LF8AB:
    lda    #1                    ; 2
    rol                          ; 2
    tax                          ; 2
    and    #$01                  ; 2
    tay                          ; 2
LF8B2:
    lda    $CC,X                 ; 4
    cmp    LFE5F,X               ; 4
    beq    LF8C1                 ; 2³
    cmp    LFE63,X               ; 4
    beq    LF8C1                 ; 2³
    jmp    LF8CA                 ; 3

LF8C1:
    lda.wy $D0,Y                 ; 4
    eor    LFE4F,X               ; 4
    sta.wy $D0,Y                 ; 5
LF8CA:
    lda.wy $D0,Y                 ; 4
    and    LFE4F,X               ; 4
    bne    LF8D7                 ; 2³
    dec    $CC,X                 ; 6
    jmp    LF8D9                 ; 3

LF8D7:
    inc    $CC,X                 ; 6
LF8D9:
    dex                          ; 2
    dex                          ; 2
    bpl    LF8B2                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF8DE SUBROUTINE
    lda    frameCounter          ; 3
    lsr                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFF99,Y               ; 4
    and    #$08                  ; 2
    bne    LF8EC                 ; 2³
    rts                          ; 6

LF8EC:
    txa                          ; 2
    clc                          ; 2
    adc    #8                    ; 2
    tax                          ; 2
LF8F1:
    txa                          ; 2
    lsr                          ; 2
    tay                          ; 2
    txa                          ; 2
    asl                          ; 2
    tax                          ; 2
    lsr                          ; 2
    and    #$01                  ; 2
    sta    $F3                   ; 3
    lda    $94,X                 ; 4
    cmp    #$2C                  ; 2
    beq    LF90E                 ; 2³
    cmp    #$43                  ; 2
    beq    LF90E                 ; 2³
    lda    $F3                   ; 3
    stx    $F3                   ; 3
    tax                          ; 2
    jmp    LF91A                 ; 3

LF90E:
    lda    $F3                   ; 3
    stx    $F3                   ; 3
    tax                          ; 2
    lda    $D0,X                 ; 4
    eor    LFE53,Y               ; 4
    sta    $D0,X                 ; 4
LF91A:
    lda    $D0,X                 ; 4
    and    LFE53,Y               ; 4
    bne    LF92A                 ; 2³
    ldx    $F3                   ; 3
    dec    $80,X                 ; 6
    dec    $94,X                 ; 6
    jmp    LF930                 ; 3

LF92A:
    ldx    $F3                   ; 3
    inc    $80,X                 ; 6
    inc    $94,X                 ; 6
LF930:
    txa                          ; 2
    lsr                          ; 2
    tax                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    LF8F1                 ; 2³+1
    inx                          ; 2
    inx                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF93A SUBROUTINE
    ldx    $F8                   ; 3
    lda    $9F                   ; 3
    cmp    #$0E                  ; 2
    bcs    LF959                 ; 2³
    lda    $E6,X                 ; 4
    bne    LF959                 ; 2³
    lda    $D4,X                 ; 4
    beq    LF959                 ; 2³
    lda    $D6,X                 ; 4
    ror                          ; 2
    bcc    LF959                 ; 2³
    rol                          ; 2
    and    #$FE                  ; 2
    sta    $D6,X                 ; 4
    lda    #4                    ; 2
    jsr    LFD63                 ; 6
LF959:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF95A SUBROUTINE
    ldy    $9F                   ; 3
    lda    LFEC0,Y               ; 4
    sta    $ED                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    LFEE8,Y               ; 4
    sta    $F3                   ; 3
    lda    LFEEC,Y               ; 4
    sta    $F4                   ; 3
    jmp.ind ($00F3)              ; 5   continues elsewhere

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF971:  ; indirect jump
    ldx    #3                    ; 2
    lda    #$35                  ; 2
LF975:
    sta    $E2,X                 ; 4
    dex                          ; 2
    bpl    LF975                 ; 2³
    jmp    LF9B8                 ; 3

LF97D:  ; indirect jump
    lda    $F5                   ; 3
    jsr    LFB6C                 ; 6
    ldx    #3                    ; 2
LF984:
    sta    $E2,X                 ; 4
    dex                          ; 2
    bpl    LF984                 ; 2³
    sta    $F5                   ; 3
    jmp    LF9B8                 ; 3

LF98E:  ; indirect jump
    ldx    #0                    ; 2
    lda    $F5                   ; 3
LF992:
    jsr    LFB6C                 ; 6
    sta    $E2,X                 ; 4
    inx                          ; 2
    cpx    #4                    ; 2
    bne    LF992                 ; 2³
    sta    $F5                   ; 3
    jmp    LF9B8                 ; 3

LF9A1:  ; indirect jump
    ldx    #3                    ; 2
LF9A3:
    jsr    LFC93                 ; 6
    jsr    LFC82                 ; 6
    bit    $ED                   ; 3
    bmi    LF9B0                 ; 2³
    clc                          ; 2
    adc    #$1A                  ; 2
LF9B0:
    sta    $E2,X                 ; 4
    dex                          ; 2
    bpl    LF9A3                 ; 2³
    jmp    LF9B8                 ; 3

LF9B8:
    lda    #1                    ; 2
    sta    $EE                   ; 3
LF9BC:
    lda    $EE                   ; 3
    ror                          ; 2
    lda    $9F                   ; 3
    rol                          ; 2
    tay                          ; 2
    lda    LFE9B,Y               ; 4
    sta    $ED                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    LFEE0,Y               ; 4
    sta    $F3                   ; 3
    lda    LFEE4,Y               ; 4
    sta    $F4                   ; 3
    jmp.ind ($00F3)              ; 5

LF9D8:  ; indirect jump
    ldx    #4                    ; 2
LF9DA:
    lda    $EE                   ; 3
    ldy    #0                    ; 2
    jsr    LFD58                 ; 6
    dex                          ; 2
    bpl    LF9DA                 ; 2³
    jmp    LFA52                 ; 3

LF9E7:  ; indirect jump
    ldx    #3                    ; 2
LF9E9:
    lda    $EE                   ; 3
    ldy    $E2                   ; 3
    jsr    LFD58                 ; 6
    dex                          ; 2
    bpl    LF9E9                 ; 2³
    ldx    #4                    ; 2
    lda    $EE                   ; 3
    ldy    #0                    ; 2
    jsr    LFD58                 ; 6
    jmp    LFA52                 ; 3

LF9FF:  ; indirect jump
    jsr    LFC93                 ; 6
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFFCD,Y               ; 4
    sta    $F3                   ; 3
    ldx    #3                    ; 2
LFA0C:
    lda    $F3                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda.wy $E2,Y                 ; 4
    bit    $ED                   ; 3
    bpl    LFA1E                 ; 2³
    cmp    #$1B                  ; 2
    bcc    LFA1E                 ; 2³
    sbc    #$1A                  ; 2
LFA1E:
    tay                          ; 2
    lda    $EE                   ; 3
    jsr    LFD58                 ; 6
    lsr    $F3                   ; 5
    lsr    $F3                   ; 5
    dex                          ; 2
    bpl    LFA0C                 ; 2³
    ldx    #4                    ; 2
    lda    $EE                   ; 3
    ldy    #0                    ; 2
    jsr    LFD58                 ; 6
    jmp    LFA52                 ; 3

LFA37:  ; indirect jump
    ldx    #4                    ; 2
LFA39:
    jsr    LFC93                 ; 6
    jsr    LFC82                 ; 6
    bit    $ED                   ; 3
    bmi    LFA46                 ; 2³
    clc                          ; 2
    adc    #$1A                  ; 2
LFA46:
    tay                          ; 2
    lda    $EE                   ; 3
    jsr    LFD58                 ; 6
    dex                          ; 2
    bpl    LFA39                 ; 2³
    jmp    LFA52                 ; 3

LFA52:
    dec    $EE                   ; 5
    bmi    LFA59                 ; 2³
    jmp    LF9BC                 ; 3

LFA59:
    ldy    $9F                   ; 3
    lda    LFEC0,Y               ; 4
    and    #$40                  ; 2
    beq    LFA6B                 ; 2³
    ldx    #3                    ; 2
    lda    #$35                  ; 2
LFA66:
    sta    $E2,X                 ; 4
    dex                          ; 2
    bpl    LFA66                 ; 2³
LFA6B:
    lda    #0                    ; 2
    sta    ENABL                 ; 3
    lda    $A3                   ; 3
    ora    #$03                  ; 2
    sta    $A3                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFA76 SUBROUTINE
    lda    #$4E                  ; 2
    sta    $D2                   ; 3
    sta    $D3                   ; 3
    ldx    #3                    ; 2
LFA7E:
    lda    $E2,X                 ; 4
    jsr    LF866                 ; 6
    txa                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    $F3                   ; 3
    clc                          ; 2
    adc    #2                    ; 2
    sta    $B8,X                 ; 4
    lda    $F4                   ; 3
    sta    $B9,X                 ; 4
    txa                          ; 2
    lsr                          ; 2
    tax                          ; 2
    dex                          ; 2
    bpl    LFA7E                 ; 2³
    inx                          ; 2
    txa                          ; 2
    inx                          ; 2
LFA9A:
    sta    $F1,X                 ; 4
    sta    AUDV0,X               ; 4
    sta    $E6,X                 ; 4
    dex                          ; 2
    bpl    LFA9A                 ; 2³
    lda    LFF96                 ; 4
    sta    $E9                   ; 3
    lda    LFF96+1               ; 4
    sta    $E8                   ; 3
    lda    LFF96+2               ; 4
    clc                          ; 2
    adc    #$0C                  ; 2
    sta    $EA                   ; 3   $F0
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFAB6 SUBROUTINE
    ldx    #$0E                  ; 2
    lda    LFF4B                 ; 4
    ldy    LFF00                 ; 4
LFABE:
    sta    $A8,X                 ; 4
    sty    $A9,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LFABE                 ; 2³
    ldx    #9                    ; 2
LFAC8:
    lda    $D8,X                 ; 4
    jsr    LF866                 ; 6
    cmp    #$36                  ; 2
    bcc    LFAD5                 ; 2³
    lda    #$F8                  ; 2
    bne    LFADA                 ; 3   always branch

LFAD5:
    jsr    LFC93                 ; 6
    ora    #$F0                  ; 2
LFADA:
    tay                          ; 2
    clc                          ; 2
    adc    $F3                   ; 3
    sta    $F3                   ; 3
    txa                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    $F3                   ; 3
    sta    $80,X                 ; 4
    lda    $F4                   ; 3
    sta    $81,X                 ; 4
    tya                          ; 2
    clc                          ; 2
    adc    #$43                  ; 2
    sta    $F3                   ; 3
    lda    $F3                   ; 3
    sta    $94,X                 ; 4
    txa                          ; 2
    lsr                          ; 2
    tax                          ; 2
    dex                          ; 2
    bpl    LFAC8                 ; 2³
    lda    #$55                  ; 2
    sta    $D0                   ; 3
    lda    #$95                  ; 2
    sta    $D1                   ; 3
    lda    #$4E                  ; 2
    sta    $CC                   ; 3
    lda    #$0E                  ; 2
    sta    $CE                   ; 3
    lda    #$4F                  ; 2
    sta    $CD                   ; 3
    lda    #$0B                  ; 2
    sta    $CF                   ; 3
    ldx    #0                    ; 2
    stx    $D6                   ; 3
    bit    $A3                   ; 3
    bmi    LFB1D                 ; 2³
    ldx    #$F0                  ; 2
LFB1D:
    stx    $D7                   ; 3
    lda    #$4F                  ; 2
    sta    $C9                   ; 3
    lda    #$BB                  ; 2
    sta    $95                   ; 3
    sta    $99                   ; 3
    sta    $9D                   ; 3
    sta    $A1                   ; 3
    sta    $A5                   ; 3
    ldx    #1                    ; 2
LFB31:
    lda    #0                    ; 2
    sta    $D4,X                 ; 4
    jsr    LF866                 ; 6
    txa                          ; 2
    jsr    LFD8C                 ; 6
    tax                          ; 2
    dex                          ; 2
    bpl    LFB31                 ; 2³
    ldy    #0                    ; 2
    ldx    $9F                   ; 3
    lda    LFEC0,X               ; 4
    and    #$3C                  ; 2
    beq    LFB55                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    sta    $EE                   ; 3
    lda    #$43                  ; 2
    sta    $ED                   ; 3
    lda    #$3F                  ; 2
LFB55:
    tay                          ; 2
    lda    LFF4B,Y               ; 4
    clc                          ; 2
    adc    #2                    ; 2
    sta    $EB                   ; 3
    lda    LFF00,Y               ; 4
    sta    $EC                   ; 3
    sta    CXCLR                 ; 3
    lda    $A3                   ; 3
    and    #$FC                  ; 2
    sta    $A3                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFB6C SUBROUTINE
    clc                          ; 2
    adc    #1                    ; 2
    cmp    #$1B                  ; 2
    beq    LFB85                 ; 2³
    cmp    #$35                  ; 2
    beq    LFB85                 ; 2³
    cmp    #$FF                  ; 2
    bne    LFB7E                 ; 2³
    lda    #1                    ; 2
    rts                          ; 6

LFB7E:
    cmp    #$FE                  ; 2
    bne    LFB84                 ; 2³
    lda    #$1B                  ; 2
LFB84:
    rts                          ; 6

LFB85:
    sec                          ; 2
    sbc    #$1A                  ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFB89 SUBROUTINE
    ldx    $F8                   ; 3
    lda    $D2,X                 ; 4
    ldx    #0                    ; 2
LFB8F:
    cmp    LFFA9,X               ; 4
    bcc    LFB9E                 ; 2³
    cmp    LFFAD,X               ; 4
    bcc    LFBA0                 ; 2³
    inx                          ; 2
    cpx    #4                    ; 2
    bcc    LFB8F                 ; 2³
LFB9E:
    clc                          ; 2
    rts                          ; 6

LFBA0:
    sec                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBA2 SUBROUTINE
    ldy    #3                    ; 2
LFBA4:
    ldx    LFFC3,Y               ; 4
    lda    LFF00,X               ; 4
    cmp    $F4                   ; 3
    beq    LFBD7                 ; 2³
    dey                          ; 2
    bpl    LFBA4                 ; 2³
    ldx    #0                    ; 2
    lda    LFF00,X               ; 4
    cmp    $F4                   ; 3
    bne    LFBC1                 ; 2³
    lda    LFF4B,X               ; 4
    cmp    $F3                   ; 3
    beq    LFBF3                 ; 2³
LFBC1:
    ldx    #$4A                  ; 2
LFBC3:
    lda    LFF00,X               ; 4
    cmp    $F4                   ; 3
    bne    LFBD1                 ; 2³
    lda    LFF4B,X               ; 4
    cmp    $F3                   ; 3
    beq    LFBF3                 ; 2³
LFBD1:
    dex                          ; 2
    cpx    #$34                  ; 2
    bpl    LFBC3                 ; 2³
    brk                          ; 7

LFBD7:
    lda    LFF4B,X               ; 4
    cmp    $F3                   ; 3
    beq    LFBF3                 ; 2³
    bcs    LFBE4                 ; 2³
    txa                          ; 2
    adc    #7                    ; 2
    tax                          ; 2
LFBE4:
    dex                          ; 2
    ldy    #6                    ; 2
LFBE7:
    lda    LFF4B,X               ; 4
    cmp    $F3                   ; 3
    beq    LFBF3                 ; 2³
    dex                          ; 2
    dey                          ; 2
    bne    LFBE7                 ; 2³
    brk                          ; 7

LFBF3:
    txa                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBF5 SUBROUTINE
    lda    $A3                   ; 3
    and    #$13                  ; 2
    bne    LFC73                 ; 2³+1
    lda    $F7                   ; 3
    bne    LFC73                 ; 2³+1
    ldy    $F8                   ; 3
    lda.wy $D0,Y                 ; 4
    and    #$20                  ; 2
    bne    LFC73                 ; 2³
    lda    $F8                   ; 3
    bne    LFC3F                 ; 2³
    lda    $E6                   ; 3
    bne    LFC73                 ; 2³
    ldy    LFE3B,X               ; 4
    bit    INPT0                 ; 3
    bmi    LFC20                 ; 2³
    lda    $D6                   ; 3
    and    #$F0                  ; 2
    ora    LFE42,Y               ; 4
    sta    $D6                   ; 3
LFC20:
    iny                          ; 2
    bit    INPT1                 ; 3
    bmi    LFC2E                 ; 2³
    lda    $D6                   ; 3
    and    #$F0                  ; 2
    ora    LFE42,Y               ; 4
    sta    $D6                   ; 3
LFC2E:
    iny                          ; 2
    bit    INPT4                 ; 3
    bmi    LFC73                 ; 2³
    lda    $D6                   ; 3
    and    #$F0                  ; 2
    ora    LFE42,Y               ; 4
    sta    $D6                   ; 3
    jmp    LFC73                 ; 3

LFC3F:
    bit    $A3                   ; 3
    bpl    LFC73                 ; 2³
    lda    $E7                   ; 3
    bne    LFC73                 ; 2³
    ldy    LFE3B,X               ; 4
    bit    INPT2                 ; 3
    bmi    LFC57                 ; 2³
    lda    $D7                   ; 3
    and    #$F0                  ; 2
    ora    LFE90,Y               ; 4
    sta    $D7                   ; 3
LFC57:
    iny                          ; 2
    bit    INPT3                 ; 3
    bmi    LFC65                 ; 2³
    lda    $D7                   ; 3
    and    #$F0                  ; 2
    ora    LFE90,Y               ; 4
    sta    $D7                   ; 3
LFC65:
    iny                          ; 2
    bit    INPT5                 ; 3
    bmi    LFC73                 ; 2³
    lda    $D7                   ; 3
    and    #$F0                  ; 2
    ora    LFE90,Y               ; 4
    sta    $D7                   ; 3
LFC73:
    ldy    #$80                  ; 2
    sty    VBLANK                ; 3
    ldy    #0                    ; 2
    sty    VBLANK                ; 3
    ldy    LFE3F,X               ; 4
    sty    SWCHA                 ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFC82 SUBROUTINE
    lsr                          ; 2
    and    #$1F                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
    cmp    #$1B                  ; 2
    bcc    LFC92                 ; 2³
    sbc    #$1A                  ; 2
    tay                          ; 2
    lda    LFFC6,Y               ; 4
LFC92:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFC93 SUBROUTINE
    lda    $CA                   ; 3
    ldy    $CB                   ; 3
    eor    LF003,Y               ; 4
    eor    LF746,Y               ; 4   address is a subroutine
    asl                          ; 2
    adc    #0                    ; 2
    iny                          ; 2
    sty    $CB                   ; 3
    eor    $9B                   ; 3
    eor    frameCounter          ; 3
    sta    $CA                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFCAA SUBROUTINE
    lda    $E6,X                 ; 4
    bne    LFCF0                 ; 2³
    lda    $D6,X                 ; 4
    and    #$0C                  ; 2
    beq    LFCF0                 ; 2³
    ldy    #0                    ; 2
    sty    $9B                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    $D2,X                 ; 4
    cmp    LFE66,Y               ; 4
    bne    LFCCB                 ; 2³
    lda    $D6,X                 ; 4
    and    #$F3                  ; 2
    sta    $D6,X                 ; 4
    jmp    LFCF0                 ; 3

LFCCB:
    lda    $D0,X                 ; 4
    ora    #$20                  ; 2
    sta    $D0,X                 ; 4
    lda    LFE68,Y               ; 4
    sta    $F3                   ; 3
    lda    frameCounter          ; 3
    lsr                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFF99,Y               ; 4
    and    #$08                  ; 2
    bne    LFCE6                 ; 2³
    jmp    LFCF0                 ; 3

LFCE6:
    lda    $D2,X                 ; 4
    clc                          ; 2
    adc    $F3                   ; 3
    sta    $D2,X                 ; 4
    jmp    LFCF0                 ; 3

LFCF0 SUBROUTINE
    lda    $D6,X                 ; 4
    and    #$0C                  ; 2
    beq    LFD04                 ; 2³+1
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    sta    $F3                   ; 3
    lda    #6                    ; 2
    jsr    LFD63                 ; 6
    jmp    LFD0C                 ; 3

LFD04:
    lda    frameCounter          ; 3
    and    #$1C                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $F3                   ; 3
LFD0C:
    txa                          ; 2
    tay                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda.wy $D6,Y                 ; 4
    and    #$03                  ; 2
    beq    LFD3B                 ; 2³
    cmp    LFE53,Y               ; 4
    beq    LFD24                 ; 2³
    lda    LFE6B+1               ; 4
    sta    $C7,X                 ; 4
    jmp    LFD29                 ; 3

LFD24:
    lda    LFE6B                 ; 4   <ShuttleGfxOne-1
    sta    $C7,X                 ; 4
LFD29:
    lda    #0                    ; 2
    sta    $9B                   ; 3
    stx    $F4                   ; 3
    tya                          ; 2
    tax                          ; 2
    lda    #4                    ; 2
    jsr    LFD63                 ; 6
    ldx    $F4                   ; 3
    jmp    LFD40                 ; 3

LFD3B:
    lda    LFE6B                 ; 4   <ShuttleGfxOne-1
    sta    $C7,X                 ; 4
LFD40:
    bit    $A3                   ; 3
    bmi    LFD4D                 ; 2³
    lda    $F8                   ; 3
    beq    LFD4D                 ; 2³
    lda    #$4F                  ; 2
    sta    $C9                   ; 3
    rts                          ; 6

LFD4D:
    ldy    $F3                   ; 3
    lda    LFE6E,Y               ; 4
    sta    $C4,X                 ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD55 SUBROUTINE
    tay                          ; 2
    lda    frameCounter          ; 3
LFD58 SUBROUTINE
    ror                          ; 2
    txa                          ; 2
    rol                          ; 2
    tax                          ; 2
    sty    $D8,X                 ; 4
    txa                          ; 2
    ror                          ; 2
    tax                          ; 2
    tya                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD63 SUBROUTINE
    cmp    $F1,X                 ; 4
    bcc    LFD72                 ; 2³
    beq    LFD72                 ; 2³
    sta    $F1,X                 ; 4
    tay                          ; 2
    lda    LFDF0-1,Y             ; 4
    sta    $EF,X                 ; 4
    tya                          ; 2
LFD72:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD73 SUBROUTINE
    lda    frameCounter          ; 3
    ror                          ; 2
    txa                          ; 2
    rol                          ; 2
    rol                          ; 2
    tax                          ; 2
    lda    $F3                   ; 3
    sta    $80,X                 ; 4
    lda    $F4                   ; 3
    sta    $81,X                 ; 4
    txa                          ; 2
    ror                          ; 2
    ror                          ; 2
    tax                          ; 2
    lda    #0                    ; 2
    rol                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD8A SUBROUTINE
    lda    $F8                   ; 3
LFD8C SUBROUTINE
    asl                          ; 2
    tax                          ; 2
    lda    $F3                   ; 3
    sta    $C0,X                 ; 4
    lda    $F4                   ; 3
    sta    $C1,X                 ; 4
    txa                          ; 2
    ror                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD99 SUBROUTINE
    lda    frameCounter          ; 3
    ror                          ; 2
    txa                          ; 2
    rol                          ; 2
    rol                          ; 2
    tax                          ; 2
    lda    $F3                   ; 3
    sta    $A8,X                 ; 4
    lda    $F4                   ; 3
    sta    $A9,X                 ; 4
    txa                          ; 2
    ror                          ; 2
    ror                          ; 2
    tax                          ; 2
    lda    #0                    ; 2
    rol                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFDB0 SUBROUTINE
    lda    frameCounter          ; 3
    ror                          ; 2
    txa                          ; 2
    rol                          ; 2
    rol                          ; 2
    tay                          ; 2
    lda.wy $94,Y                 ; 4
    sec                          ; 2
    sbc    #$43                  ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $00 ; |        | $FDBE
    .byte $00 ; |        | $FDBF
    .byte $00 ; |        | $FDC0
    .byte $00 ; |        | $FDC1
    .byte $00 ; |        | $FDC2
    .byte $00 ; |        | $FDC3
    .byte $00 ; |        | $FDC4
    .byte $00 ; |        | $FDC5
    .byte $00 ; |        | $FDC6
    .byte $00 ; |        | $FDC7
    .byte $00 ; |        | $FDC8
    .byte $00 ; |        | $FDC9
    .byte $00 ; |        | $FDCA
    .byte $00 ; |        | $FDCB
    .byte $00 ; |        | $FDCC
    .byte $00 ; |        | $FDCD
    .byte $00 ; |        | $FDCE
    .byte $00 ; |        | $FDCF
LFDD0:
    .byte $01 ; |       X| $FDD0   audio volume
    .byte $02 ; |      X | $FDD1
    .byte $03 ; |      XX| $FDD2
    .byte $04 ; |     X  | $FDD3
    .byte $05 ; |     X X| $FDD4
    .byte $04 ; |     X  | $FDD5
    .byte $03 ; |      XX| $FDD6
    .byte $02 ; |      X | $FDD7
LFDD8:
    .byte <LB5E2         ; $FDD8   indirect low
    .byte <LB018         ; $FDD9
    .byte <LB4DC         ; $FDDA
    .byte <LB00E         ; $FDDB
LFDDC:
    .byte >LB5E2         ; $FDDC   indirect high
    .byte >LB018         ; $FDDD
    .byte >LB4DC         ; $FDDE
    .byte >LB00E         ; $FDDF
LFDE0:
    .byte <LF560         ; $FDE0   indirect low
    .byte <LF552         ; $FDE1
    .byte <LF6ED         ; $FDE2
    .byte <LF6ED         ; $FDE3
LFDE4:
    .byte >LF560         ; $FDE4   indirect high
    .byte >LF552         ; $FDE5
    .byte >LF6ED         ; $FDE6
    .byte >LF6ED         ; $FDE7

ColTopBeamTab:
    .byte COL_BEAM_9     ; $FDE8
    .byte COL_BEAM_10    ; $FDE9   the PAL proto has a brighter beam
    .byte COL_BEAM_11    ; $FDEA
    .byte COL_BEAM_12    ; $FDEB
    .byte COL_BEAM_13    ; $FDEC
    .byte COL_BEAM_14    ; $FDED
    .byte COL_BEAM_15    ; $FDEE
    .byte COL_BEAM_16    ; $FDEF

LFDF0:
    .byte $00 ; |        | $FDF0
    .byte $00 ; |        | $FDF1
    .byte $04 ; |     X  | $FDF2
    .byte $04 ; |     X  | $FDF3
    .byte $0A ; |    X X | $FDF4
    .byte $09 ; |    X  X| $FDF5
    .byte $71 ; | XXX   X| $FDF6
    .byte $1B ; |   XX XX| $FDF7
    .byte $00 ; |        | $FDF8
    .byte $00 ; |        | $FDF9
LFDFA:
    .byte $04 ; |     X  | $FDFA
    .byte $0C ; |    XX  | $FDFB
LFDFC:
    .byte <LFE10         ; $FDFC
    .byte <LFE10         ; $FDFD
    .byte <LFE10         ; $FDFE
    .byte <LFE14         ; $FDFF
    .byte <LFE18         ; $FE00
    .byte <LFE18         ; $FE01
    .byte <LFE21         ; $FE02
    .byte <LFE21         ; $FE03
    .byte <LFE21         ; $FE04
    .byte <LFE21         ; $FE05
LFE06:
    .byte >LFE10         ; $FE06
    .byte >LFE10         ; $FE07
    .byte >LFE10         ; $FE08
    .byte >LFE14         ; $FE09
    .byte >LFE18         ; $FE0A
    .byte >LFE18         ; $FE0B
    .byte >LFE21         ; $FE0C
    .byte >LFE21         ; $FE0D
    .byte >LFE21         ; $FE0E
    .byte >LFE21         ; $FE0F

LFE10:
    .byte $E0 ; |XXX     | $FE10
    .byte $AF ; |X X XXXX| $FE11
    .byte $04 ; |     X  | $FE12
    .byte $41 ; | X     X| $FE13
LFE14:
    .byte $E0 ; |XXX     | $FE14
    .byte $AF ; |X X XXXX| $FE15
    .byte $04 ; |     X  | $FE16
    .byte $41 ; | X     X| $FE17
LFE18:
    .byte $B5 ; |X XX X X| $FE18
    .byte $B4 ; |X XX X  | $FE19
    .byte $B3 ; |X XX  XX| $FE1A
    .byte $B2 ; |X XX  X | $FE1B
    .byte $B1 ; |X XX   X| $FE1C
    .byte $B2 ; |X XX  X | $FE1D
    .byte $B3 ; |X XX  XX| $FE1E

    .byte $84 ; |X    X  | $FE1F
    .byte $34 ; |  XX X  | $FE20
LFE21:
    .byte $BF ; |X XXXXXX| $FE21
    .byte $BB ; |X XXX XX| $FE22
    .byte $B7 ; |X XX XXX| $FE23
    .byte $B3 ; |X XX  XX| $FE24
    .byte $AF ; |X X XXXX| $FE25
    .byte $AB ; |X X X XX| $FE26
    .byte $A9 ; |X X X  X| $FE27
    .byte $A9 ; |X X X  X| $FE28
    .byte $A9 ; |X X X  X| $FE29
    .byte $A9 ; |X X X  X| $FE2A
    .byte $A9 ; |X X X  X| $FE2B
    .byte $A9 ; |X X X  X| $FE2C
    .byte $A9 ; |X X X  X| $FE2D
    .byte $A9 ; |X X X  X| $FE2E
    .byte $A9 ; |X X X  X| $FE2F
    .byte $A9 ; |X X X  X| $FE30
    .byte $A9 ; |X X X  X| $FE31
    .byte $A9 ; |X X X  X| $FE32
    .byte $A9 ; |X X X  X| $FE33
    .byte $AB ; |X X X XX| $FE34
    .byte $AF ; |X X XXXX| $FE35
    .byte $B3 ; |X XX  XX| $FE36
    .byte $B7 ; |X XX XXX| $FE37
    .byte $BB ; |X XXX XX| $FE38
    .byte $BF ; |X XXXXXX| $FE39
    .byte $05 ; |     X X| $FE3A
LFE3B:
    .byte $4F ; | X  XXXX| $FE3B
    .byte $01 ; |       X| $FE3C
    .byte $04 ; |     X  | $FE3D
    .byte $07 ; |     XXX| $FE3E
LFE3F:
    .byte $0A ; |    X X | $FE3F
    .byte $DD ; |XX XXX X| $FE40
    .byte $BB ; |X XXX XX| $FE41
LFE42:
    .byte $FF ; |XXXXXXXX| $FE42
    .byte $00 ; |        | $FE43
    .byte $01 ; |       X| $FE44
    .byte $00 ; |        | $FE45
    .byte $08 ; |    X   | $FE46
    .byte $00 ; |        | $FE47
    .byte $04 ; |     X  | $FE48
    .byte $00 ; |        | $FE49
    .byte $02 ; |      X | $FE4A
    .byte $00 ; |        | $FE4B
    .byte $00 ; |        | $FE4C
    .byte $00 ; |        | $FE4D
    .byte $00 ; |        | $FE4E
LFE4F:
    .byte $40 ; | X      | $FE4F
    .byte $40 ; | X      | $FE50
    .byte $80 ; |X       | $FE51
    .byte $80 ; |X       | $FE52
LFE53:
    .byte $01 ; |       X| $FE53
    .byte $02 ; |      X | $FE54
    .byte $04 ; |     X  | $FE55
    .byte $08 ; |    X   | $FE56
    .byte $10 ; |   X    | $FE57
    .byte $20 ; |  X     | $FE58
    .byte $40 ; | X      | $FE59
    .byte $80 ; |X       | $FE5A
LFE5B:
    .byte $80 ; |X       | $FE5B
    .byte $40 ; | X      | $FE5C
    .byte $20 ; |  X     | $FE5D
    .byte $10 ; |   X    | $FE5E
LFE5F:
    .byte $4A ; | X  X X | $FE5F
    .byte $4A ; | X  X X | $FE60
    .byte $0A ; |    X X | $FE61
    .byte $0A ; |    X X | $FE62
LFE63:
    .byte $52 ; | X X  X | $FE63
    .byte $52 ; | X X  X | $FE64
    .byte $12 ; |   X  X | $FE65
LFE66:
    .byte $12 ; |   X  X | $FE66
    .byte $92 ; |X  X  X | $FE67
LFE68:
    .byte $0A ; |    X X | $FE68
    .byte $01 ; |       X| $FE69
    .byte $FF ; |XXXXXXXX| $FE6A

LFE6B:
    .byte <ShuttleGfxOne-1 ; $FE6B
    .byte <ShuttleGfxTwo-1 ; $FE6C
    .byte >ShuttleGfxOne   ; $FE6D   high nibble for both

LFE6E:
    .byte <UFO_One-1     ; $FE6E   low nibble
    .byte <UFO_Two-1     ; $FE6F
    .byte <UFO_Three-1   ; $FE70
    .byte <UFO_Four-1    ; $FE71
    .byte <UFO_Five-1    ; $FE72
    .byte <UFO_Six-1     ; $FE73
    .byte <UFO_Seven-1   ; $FE74
    .byte <UFO_Eight-1   ; $FE75
LFE76:
    .byte >UFO_One       ; $FE76   high nibble
    .byte >UFO_Two       ; $FE77
    .byte >UFO_Three     ; $FE78
    .byte >UFO_Four      ; $FE79
    .byte >UFO_Five      ; $FE7A
    .byte >UFO_Six       ; $FE7B
    .byte >UFO_Seven     ; $FE7C
    .byte >UFO_Eight     ; $FE7D

LFE7E:
    .byte $00 ; |        | $FE7E
    .byte $FD ; |XXXXXX X| $FE7F
    .byte $00 ; |        | $FE80
    .byte $00 ; |        | $FE81
    .byte $FD ; |XXXXXX X| $FE82
    .byte $FD ; |XXXXXX X| $FE83
    .byte $FD ; |XXXXXX X| $FE84
    .byte $FD ; |XXXXXX X| $FE85
    .byte $FD ; |XXXXXX X| $FE86
    .byte $FD ; |XXXXXX X| $FE87
    .byte $FD ; |XXXXXX X| $FE88
    .byte $FD ; |XXXXXX X| $FE89
    .byte $FD ; |XXXXXX X| $FE8A
    .byte $02 ; |      X | $FE8B
    .byte $03 ; |      XX| $FE8C
    .byte $00 ; |        | $FE8D
    .byte $00 ; |        | $FE8E
    .byte $02 ; |      X | $FE8F
LFE90:
    .byte $00 ; |        | $FE90
    .byte $00 ; |        | $FE91
    .byte $02 ; |      X | $FE92
    .byte $00 ; |        | $FE93
    .byte $08 ; |    X   | $FE94
    .byte $00 ; |        | $FE95
    .byte $04 ; |     X  | $FE96
    .byte $00 ; |        | $FE97
    .byte $01 ; |       X| $FE98
    .byte $00 ; |        | $FE99
    .byte $00 ; |        | $FE9A
LFE9B:
    .byte $00 ; |        | $FE9B
    .byte $00 ; |        | $FE9C
    .byte $81 ; |X      X| $FE9D
    .byte $00 ; |        | $FE9E
    .byte $81 ; |X      X| $FE9F
    .byte $00 ; |        | $FEA0
    .byte $82 ; |X     X | $FEA1
    .byte $00 ; |        | $FEA2
    .byte $82 ; |X     X | $FEA3
    .byte $82 ; |X     X | $FEA4
    .byte $02 ; |      X | $FEA5
    .byte $00 ; |        | $FEA6
    .byte $02 ; |      X | $FEA7
    .byte $02 ; |      X | $FEA8
    .byte $82 ; |X     X | $FEA9
    .byte $00 ; |        | $FEAA
    .byte $82 ; |X     X | $FEAB
    .byte $82 ; |X     X | $FEAC
    .byte $82 ; |X     X | $FEAD
    .byte $82 ; |X     X | $FEAE
    .byte $02 ; |      X | $FEAF
    .byte $02 ; |      X | $FEB0
    .byte $82 ; |X     X | $FEB1
    .byte $02 ; |      X | $FEB2
    .byte $82 ; |X     X | $FEB3
    .byte $00 ; |        | $FEB4
    .byte $82 ; |X     X | $FEB5
    .byte $82 ; |X     X | $FEB6
    .byte $C3 ; |XX    XX| $FEB7
    .byte $00 ; |        | $FEB8
    .byte $C3 ; |XX    XX| $FEB9
    .byte $C3 ; |XX    XX| $FEBA
    .byte $43 ; | X    XX| $FEBB
    .byte $00 ; |        | $FEBC
    .byte $43 ; | X    XX| $FEBD
    .byte $43 ; | X    XX| $FEBE
    .byte $C3 ; |XX    XX| $FEBF
LFEC0:
    .byte $43 ; | X    XX| $FEC0
    .byte $81 ; |X      X| $FEC1
    .byte $01 ; |       X| $FEC2
    .byte $82 ; |X     X | $FEC3
    .byte $82 ; |X     X | $FEC4
    .byte $02 ; |      X | $FEC5
    .byte $02 ; |      X | $FEC6
    .byte $02 ; |      X | $FEC7
    .byte $02 ; |      X | $FEC8
    .byte $42 ; | X    X | $FEC9
    .byte $42 ; | X    X | $FECA
    .byte $42 ; | X    X | $FECB
    .byte $22 ; |  X   X | $FECC
    .byte $22 ; |  X   X | $FECD
    .byte $B3 ; |X XX  XX| $FECE
    .byte $B3 ; |X XX  XX| $FECF
    .byte $27 ; |  X  XXX| $FED0
    .byte $27 ; |  X  XXX| $FED1
LFED2:
    .byte $18 ; |   XX   | $FED2
    .byte $0A ; |    X X | $FED3
    .byte $0E ; |    XXX | $FED4
    .byte $2E ; |  X XXX | $FED5
    .byte $4E ; | X  XXX | $FED6
    .byte $6E ; | XX XXX | $FED7
    .byte $8E ; |X   XXX | $FED8
LFED9:
    .byte $92 ; |X  X  X | $FED9
    .byte $0A ; |    X X | $FEDA
    .byte $34 ; |  XX X  | $FEDB
    .byte $44 ; | X   X  | $FEDC
    .byte $54 ; | X X X  | $FEDD
    .byte $64 ; | XX  X  | $FEDE
    .byte $92 ; |X  X  X | $FEDF
LFEE0:
    .byte <LF9D8         ; $FEE0   indirect low
    .byte <LF9E7         ; $FEE1
    .byte <LF9FF         ; $FEE2
    .byte <LFA37         ; $FEE3
LFEE4:
    .byte >LF9D8         ; $FEE4   indirect high
    .byte >LF9E7         ; $FEE5
    .byte >LF9FF         ; $FEE6
    .byte >LFA37         ; $FEE7
LFEE8:
    .byte <LF971         ; $FEE8   indirect low
    .byte <LF97D         ; $FEE9
    .byte <LF98E         ; $FEEA
    .byte <LF9A1         ; $FEEB
LFEEC:
    .byte >LF971         ; $FEEC   indirect high
    .byte >LF97D         ; $FEED
    .byte >LF98E         ; $FEEE
    .byte >LF9A1         ; $FEEF
LFEF0:
    .byte <LF1BA         ; $FEF0   indirect low
    .byte <LF1D5         ; $FEF1
    .byte <LF1BA         ; $FEF2
    .byte <LF0DD         ; $FEF3
    .byte <LF1D5         ; $FEF4
    .byte <LF187         ; $FEF5
    .byte <LF0B0         ; $FEF6
LFEF7:
    .byte >LF1BA         ; $FEF7   indirect high
    .byte >LF1D5         ; $FEF8
    .byte >LF1BA         ; $FEF9
    .byte >LF0DD         ; $FEFA
    .byte >LF1D5         ; $FEFB
    .byte >LF187         ; $FEFC
    .byte >LF0B0         ; $FEFD

    .byte $00 ; |        | $FEFE   free bytes until next page
    .byte $00 ; |        | $FEFF

LFF00:
    .byte >BlankSpace    ; $FF00
    .byte >UpperCase_A   ; $FF01
    .byte >UpperCase_B   ; $FF02
    .byte >UpperCase_C   ; $FF03
    .byte >UpperCase_D   ; $FF04
    .byte >UpperCase_E   ; $FF05
    .byte >UpperCase_F   ; $FF06
    .byte >UpperCase_G   ; $FF07
    .byte >UpperCase_H   ; $FF08
    .byte >UpperCase_I   ; $FF09
    .byte >UpperCase_J   ; $FF0A
    .byte >UpperCase_K   ; $FF0B
    .byte >UpperCase_L   ; $FF0C
    .byte >UpperCase_M   ; $FF0D
    .byte >UpperCase_N   ; $FF0E
    .byte >UpperCase_O   ; $FF0F
    .byte >UpperCase_P   ; $FF10
    .byte >UpperCase_Q   ; $FF11
    .byte >UpperCase_R   ; $FF12
    .byte >UpperCase_S   ; $FF13
    .byte >UpperCase_T   ; $FF14
    .byte >UpperCase_U   ; $FF15
    .byte >UpperCase_V   ; $FF16
    .byte >UpperCase_W   ; $FF17
    .byte >UpperCase_X   ; $FF18
    .byte >UpperCase_Y   ; $FF19
    .byte >UpperCase_Z   ; $FF1A
    .byte >LowerCase_a   ; $FF1B
    .byte >LowerCase_b   ; $FF1C
    .byte >LowerCase_c   ; $FF1D
    .byte >LowerCase_d   ; $FF1E
    .byte >LowerCase_e   ; $FF1F
    .byte >LowerCase_f   ; $FF20
    .byte >LowerCase_g   ; $FF21
    .byte >LowerCase_h   ; $FF22
    .byte >LowerCase_i   ; $FF23
    .byte >LowerCase_j   ; $FF24
    .byte >LowerCase_k   ; $FF25
    .byte >LowerCase_l   ; $FF26
    .byte >LowerCase_m   ; $FF27
    .byte >LowerCase_n   ; $FF28
    .byte >LowerCase_o   ; $FF29
    .byte >LowerCase_p   ; $FF2A
    .byte >LowerCase_q   ; $FF2B
    .byte >LowerCase_r   ; $FF2C
    .byte >LowerCase_s   ; $FF2D
    .byte >LowerCase_t   ; $FF2E
    .byte >LowerCase_u   ; $FF2F
    .byte >LowerCase_v   ; $FF30
    .byte >LowerCase_w   ; $FF31
    .byte >LowerCase_x   ; $FF32
    .byte >LowerCase_y   ; $FF33
    .byte >LowerCase_z   ; $FF34
    .byte >BlankBall     ; $FF35
    .byte >Hi_Gfx        ; $FF36
    .byte >One           ; $FF37
    .byte >Two           ; $FF38
    .byte >Three         ; $FF39
    .byte >Four          ; $FF3A
    .byte >Five          ; $FF3B
    .byte >Six           ; $FF3C
    .byte >Seven         ; $FF3D
    .byte >Eight         ; $FF3E
    .byte >Nine          ; $FF3F
    .byte >Ten           ; $FF40
    .byte >Eleven        ; $FF41
    .byte >Twelve        ; $FF42
    .byte >Transport_8   ; $FF43
    .byte >Transport_7   ; $FF44
    .byte >Transport_6   ; $FF45
    .byte >Transport_5   ; $FF46
    .byte >Transport_4   ; $FF47
    .byte >Transport_3   ; $FF48
    .byte >Transport_2   ; $FF49
    .byte >Transport_1   ; $FF4A
LFF4B:
    .byte <BlankSpace-1  ; $FF4B
    .byte <UpperCase_A-1 ; $FF4C
    .byte <UpperCase_B-1 ; $FF4D
    .byte <UpperCase_C-1 ; $FF4E
    .byte <UpperCase_D-1 ; $FF4F
    .byte <UpperCase_E-1 ; $FF50
    .byte <UpperCase_F-1 ; $FF51
    .byte <UpperCase_G-1 ; $FF52
    .byte <UpperCase_H-1 ; $FF53
    .byte <UpperCase_I-1 ; $FF54
    .byte <UpperCase_J-1 ; $FF55
    .byte <UpperCase_K-1 ; $FF56
    .byte <UpperCase_L-1 ; $FF57
    .byte <UpperCase_M-1 ; $FF58
    .byte <UpperCase_N-1 ; $FF59
    .byte <UpperCase_O-1 ; $FF5A
    .byte <UpperCase_P-1 ; $FF5B
    .byte <UpperCase_Q-1 ; $FF5C
    .byte <UpperCase_R-1 ; $FF5D
    .byte <UpperCase_S-1 ; $FF5E
    .byte <UpperCase_T-1 ; $FF5F
    .byte <UpperCase_U-1 ; $FF60
    .byte <UpperCase_V-1 ; $FF61
    .byte <UpperCase_W-1 ; $FF62
    .byte <UpperCase_X-1 ; $FF63
    .byte <UpperCase_Y-1 ; $FF64
    .byte <UpperCase_Z-1 ; $FF65
    .byte <LowerCase_a-1 ; $FF66
    .byte <LowerCase_b-1 ; $FF67
    .byte <LowerCase_c-1 ; $FF68
    .byte <LowerCase_d-1 ; $FF69
    .byte <LowerCase_e-1 ; $FF6A
    .byte <LowerCase_f-1 ; $FF6B
    .byte <LowerCase_g-1 ; $FF6C
    .byte <LowerCase_h-1 ; $FF6D
    .byte <LowerCase_i-1 ; $FF6E
    .byte <LowerCase_j-1 ; $FF6F
    .byte <LowerCase_k-1 ; $FF70
    .byte <LowerCase_l-1 ; $FF71
    .byte <LowerCase_m-1 ; $FF72
    .byte <LowerCase_n-1 ; $FF73
    .byte <LowerCase_o-1 ; $FF74
    .byte <LowerCase_p-1 ; $FF75
    .byte <LowerCase_q-1 ; $FF76
    .byte <LowerCase_r-1 ; $FF77
    .byte <LowerCase_s-1 ; $FF78
    .byte <LowerCase_t-1 ; $FF79
    .byte <LowerCase_u-1 ; $FF7A
    .byte <LowerCase_v-1 ; $FF7B
    .byte <LowerCase_w-1 ; $FF7C
    .byte <LowerCase_x-1 ; $FF7D
    .byte <LowerCase_y-1 ; $FF7E
    .byte <LowerCase_z-1 ; $FF7F
    .byte <BlankBall-1   ; $FF80
    .byte <Hi_Gfx-1      ; $FF81
    .byte <One-1         ; $FF82
    .byte <Two-1         ; $FF83
    .byte <Three-1       ; $FF84
    .byte <Four-1        ; $FF85
    .byte <Five-1        ; $FF86
    .byte <Six-1         ; $FF87
    .byte <Seven-1       ; $FF88
    .byte <Eight-1       ; $FF89
    .byte <Nine-1        ; $FF8A
    .byte <Ten-1         ; $FF8B
    .byte <Eleven-1      ; $FF8C
    .byte <Twelve-1      ; $FF8D
    .byte <Transport_8-1 ; $FF8E
    .byte <Transport_7-1 ; $FF8F
    .byte <Transport_6-1 ; $FF90
    .byte <Transport_5-1 ; $FF91
    .byte <Transport_4-1 ; $FF92
    .byte <Transport_3-1 ; $FF93
    .byte <Transport_2-1 ; $FF94
    .byte <Transport_1-1 ; $FF95

LFF96:
    .byte >MidShipBody   ; $FF96   high nibble    Planet gfx, Mid Ship gfx
    .byte <MidShipBody-1 ; $FF97
    .byte <ShuttleDoors-1; $FF98

LFF99:
    .byte $01 ; |       X| $FF99
    .byte $08 ; |    X   | $FF9A
    .byte $04 ; |     X  | $FF9B
    .byte $08 ; |    X   | $FF9C
    .byte $02 ; |      X | $FF9D
    .byte $08 ; |    X   | $FF9E
    .byte $04 ; |     X  | $FF9F
    .byte $08 ; |    X   | $FFA0
    .byte $00 ; |        | $FFA1
    .byte $08 ; |    X   | $FFA2
    .byte $04 ; |     X  | $FFA3
    .byte $08 ; |    X   | $FFA4
    .byte $02 ; |      X | $FFA5
    .byte $08 ; |    X   | $FFA6
    .byte $04 ; |     X  | $FFA7
    .byte $08 ; |    X   | $FFA8
LFFA9:
    .byte $31 ; |  XX   X| $FFA9
    .byte $41 ; | X     X| $FFAA
    .byte $51 ; | X X   X| $FFAB
    .byte $61 ; | XX    X| $FFAC
LFFAD:
    .byte $38 ; |  XXX   | $FFAD
    .byte $48 ; | X  X   | $FFAE
    .byte $58 ; | X XX   | $FFAF
    .byte $68 ; | XX X   | $FFB0
LFFB1:
    .byte $01 ; |       X| $FFB1
    .byte $02 ; |      X | $FFB2
    .byte $03 ; |      XX| $FFB3
    .byte $83 ; |X     XX| $FFB4
    .byte $04 ; |     X  | $FFB5
    .byte $84 ; |X    X  | $FFB6
    .byte $05 ; |     X X| $FFB7
    .byte $85 ; |X    X X| $FFB8
    .byte $86 ; |X    XX | $FFB9
    .byte $87 ; |X    XXX| $FFBA
    .byte $88 ; |X   X   | $FFBB
    .byte $29 ; |  X X  X| $FFBC
    .byte $A9 ; |X X X  X| $FFBD
    .byte $6A ; | XX X X | $FFBE
    .byte $EA ; |XXX X X | $FFBF
    .byte $6B ; | XX X XX| $FFC0
    .byte $EB ; |XXX X XX| $FFC1
    .byte $EC ; |XXX XX  | $FFC2
LFFC3:
    .byte $07 ; |     XXX| $FFC3
    .byte $14 ; |   X X  | $FFC4
    .byte $21 ; |  X    X| $FFC5
LFFC6:
    .byte $2E ; |  X XXX | $FFC6
    .byte $01 ; |       X| $FFC7
    .byte $05 ; |     X X| $FFC8
    .byte $09 ; |    X  X| $FFC9
    .byte $0F ; |    XXXX| $FFCA
    .byte $15 ; |   X X X| $FFCB
    .byte $19 ; |   XX  X| $FFCC
LFFCD:
    .byte $6C ; | XX XX  | $FFCD
    .byte $78 ; | XXXX   | $FFCE
    .byte $72 ; | XXX  X | $FFCF
    .byte $4B ; | X  X XX| $FFD0
    .byte $9C ; |X  XXX  | $FFD1
    .byte $B4 ; |X XX X  | $FFD2
    .byte $B1 ; |X XX   X| $FFD3
    .byte $87 ; |X    XXX| $FFD4
    .byte $D8 ; |XX XX   | $FFD5
    .byte $E4 ; |XXX  X  | $FFD6
    .byte $E1 ; |XXX    X| $FFD7
    .byte $C6 ; |XX   XX | $FFD8
    .byte $1B ; |   XX XX| $FFD9
    .byte $27 ; |  X  XXX| $FFDA
    .byte $2D ; |  X XX X| $FFDB
    .byte $36 ; |  XX XX | $FFDC

LFFDD:
    .byte <UpperCase_M-1 ; $FFDD
    .byte <UpperCase_V-1 ; $FFDE
    .byte <UpperCase_C-1 ; $FFDF
LFFE0:
    .byte >UpperCase_M   ; $FFE0
    .byte >UpperCase_V   ; $FFE1
    .byte >UpperCase_C   ; $FFE2

    .byte $00 ; |        | $FFE3
    .byte $00 ; |        | $FFE4
    .byte $00 ; |        | $FFE5
    .byte $00 ; |        | $FFE6
    .byte $00 ; |        | $FFE7
    .byte $00 ; |        | $FFE8
    .byte $00 ; |        | $FFE9
    .byte $00 ; |        | $FFEA
    .byte $00 ; |        | $FFEB
    .byte $00 ; |        | $FFEC
    .byte $00 ; |        | $FFED
    .byte $00 ; |        | $FFEE
    .byte $00 ; |        | $FFEF

LFFF0:
    bit    BANK_0                ; 4
;coming from bank 0
    jmp.ind ($00F3)              ; 5

    .byte $00 ; |        | $FFF6
    .byte $00 ; |        | $FFF7

    .byte HOTSPOT        ; $BFF9  $00 PAL_PROTO, $FF otherwise
    .byte $00 ; |        | $FFF9

       ORG $2FFA
      RORG $FFFA

    .word START_BANK1
LFFFC:
    .word START_BANK1   ; reset vector
    .word START_BANK1
