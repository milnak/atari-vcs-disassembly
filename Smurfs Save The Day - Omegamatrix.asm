; Disassembly of Smurfs Save The Day
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcsstd1.cfg sstd.1
;
; sstd1.cfg contents:
;
;      ORG 5000
;      CODE 5000 52DF
;      GFX 52E0 530C
;      CODE 530D 5C31
;      GFX 5C32 5FDC
;      CODE 5FDD 5FFB
;      GFX 5FFC 5FFF
;
; Command Line: newdistella -pasfcsstd2.cfg sstd.2
;
; sstd2.cfg contents:
;
;      ORG 5000
;      CODE 5000 5EDE
;      GFX 5EDF 5FE1
;      CODE 5FE2 5FF6
;      GFX 5FF7 5FFF

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
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
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
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

; Read TIA Baseline = $00
INPT4   =  $0C

SWCHA   =  $0280
SWACNT  =  $0281
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      USER CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      FIRST BANK
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $5000

L5000:
    ldx    $82                   ; 3
    inx                          ; 2
    lda    $B3                   ; 3
    bne    L5011                 ; 2³
    lda    $85                   ; 3
    cmp    #7                    ; 2
    beq    L5018                 ; 2³
    cmp    #$0B                  ; 2
    beq    L5034                 ; 2³
L5011:
    lda    #0                    ; 2
    sta    $8C                   ; 3
    jmp    L5051                 ; 3


L5018:
    lda    $8A                   ; 3
    bpl    L504F                 ; 2³
    lda    #1                    ; 2
    sta    $8A                   ; 3
    lda    #0                    ; 2
    sta    $8B                   ; 3
    sta    $A4                   ; 3
    lda    $83                   ; 3
    cmp    L5D7C,X               ; 4
    beq    L5011                 ; 2³
    inc    $83                   ; 5
    sta    $8C                   ; 3
    jmp    L504F                 ; 3

L5034:
    lda    $8A                   ; 3
    bpl    L504F                 ; 2³
    lda    #1                    ; 2
    sta    $8A                   ; 3
    lda    #8                    ; 2
    sta    $8B                   ; 3
    lda    #2                    ; 2
    sta    $A4                   ; 3
    lda    $83                   ; 3
    cmp    L5D80,X               ; 4
    beq    L5011                 ; 2³
    dec    $83                   ; 5
    sta    $8C                   ; 3
L504F:
    dec    $8A                   ; 5
L5051:
    lda    $8C                   ; 3
    beq    L506A                 ; 2³
    dec    $8D                   ; 5
    bpl    L505F                 ; 2³
    lda    #3                    ; 2
    sta    $8D                   ; 3
    dec    $8E                   ; 5
L505F:
    lda    $8E                   ; 3
    bpl    L506C                 ; 2³
    lda    #2                    ; 2
    sta    $8E                   ; 3
    jmp    L506C                 ; 3

L506A:
    lda    #3                    ; 2
L506C:
    asl                          ; 2
    tax                          ; 2
    lda    L5D74,X               ; 4
    sta    $8F                   ; 3
    lda    L5D75,X               ; 4
    sta    $90                   ; 3
    lda    $FF                   ; 3
    cmp    #$B5                  ; 2
    bne    L50A9                 ; 2³
    ldy    #0                    ; 2
    lda    $AA                   ; 3
    and    #$C0                  ; 2
    cmp    #$C0                  ; 2
    beq    L50A7                 ; 2³
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    beq    L50A5                 ; 2³
    lda    $99                   ; 3
    beq    L50A9                 ; 2³
    lda    $AE                   ; 3
    bne    L509B                 ; 2³
    lda    #$5A                  ; 2
    sta    $AE                   ; 3
L509B:
    dec    $AE                   ; 5
    bne    L50A9                 ; 2³
    lda    #0                    ; 2
    sta    $99                   ; 3
    sta    $9C                   ; 3
L50A5:
    ldy    #$C0                  ; 2
L50A7:
    sty    $AA                   ; 3
L50A9:
    lda    $81                   ; 3
    bmi    L50B8                 ; 2³
    dec    $81                   ; 5
    bpl    L50B8                 ; 2³
    sta    SWCHA                 ; 4
    sta    $99                   ; 3
    sta    $9C                   ; 3
L50B8:
    lda    $FF                   ; 3
    cmp    #$B5                  ; 2
    beq    L50E3                 ; 2³
    ldy    $82                   ; 3
    bpl    L50E3                 ; 2³
    lda    SWCHA                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    SWCHB                 ; 4
    and    #$0B                  ; 2
    cpx    #$0D                  ; 2
    bne    L50D9                 ; 2³
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $FF                   ; 3
L50D9:
    cpx    #$0E                  ; 2
    bne    L50E3                 ; 2³
    ora    #$04                  ; 2
    ora    $FF                   ; 3
    sta    $FF                   ; 3
L50E3:
    lda    $B1                   ; 3
    bne    L5113                 ; 2³+1
    lda    $AF                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    sta    $AF                   ; 3
    lda    $B0                   ; 3
    adc    #0                    ; 2
    cmp    #$8D                  ; 2
    bcs    L50FB                 ; 2³
    sta    $B0                   ; 3
    jmp    L511B                 ; 3


L50FB:
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
L5101:
    lda    SWCHA                 ; 4
    and    #$F0                  ; 2
    cmp    #$F0                  ; 2
    bne    L5113                 ; 2³
    lda    SWCHB                 ; 4
    and    #$03                  ; 2
    cmp    #3                    ; 2
    beq    L5101                 ; 2³
L5113:
    lda    #0                    ; 2
    sta    $AF                   ; 3
    sta    $B0                   ; 3
    sta    $B1                   ; 3
L511B:
    lda    INTIM                 ; 4
    bne    L511B                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2   already at zero
    sta    VBLANK                ; 3
    lda    $82                   ; 3
    bmi    L512D                 ; 2³
    jmp    L5340                 ; 3

L512D:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$EE                  ; 2
    sta    TIM64T                ; 4
    lda    #0                    ; 2
    sta    PF0                   ; 3
    lda    $9B                   ; 3
    beq    L5148                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
L5140:
    lda    INTIM                 ; 4
    bne    L5140                 ; 2³
    jmp    L5FEF                 ; 3

L5148:
    lda    #0                    ; 2
    sta    COLUBK                ; 3
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    lda    #$38                  ; 2
    jsr    L530D                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    L530A                 ; 4
    sta    COLUBK                ; 3
    ldx    #$17                  ; 2
L515E:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    L515E                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    REFP0                 ; 3
    stx    REFP1                 ; 3
    inx                          ; 2
    stx    VDELP0                ; 3
    stx    VDELP1                ; 3
    ldx    #3                    ; 2
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    ldx    #0                    ; 2
    stx    ENAM0                 ; 3
    stx    ENAM1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    $B8                   ; 3   holds color for flashing letters
    stx    COLUPF                ; 3
    ldx    #$34                  ; 2   color of border surrounding "COLECO"
    stx    COLUP0                ; 3
    stx    COLUP1                ; 3
    ldy    #7                    ; 2   loop uses BPL, number of times through loop = (7 + 1), logo sprites are 8 lines tall
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$FF                  ; 2   top line of border, creates the indentation effect
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$FC                  ; 2   playfield is drawn behind the logo letters,
    sta    PF2                   ; 3   changing the playfield colors makes the logo flash

.loopDrawLogo:
    lda    Logo_O,Y              ; 4
    sta    $88                   ; 3
    lda    Logo_C,Y              ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3   C
    lda    Logo_O,Y              ; 4
    sta    GRP1                  ; 3   O
    lda    $80                   ; 3
    nop                          ; 2
    lda    Logo_L,Y              ; 4
    sta.w  GRP0                  ; 4   L
    lda    Logo_E,Y              ; 4
    tax                          ; 2
    lda    Logo_C,Y              ; 4
    sty    $89                   ; 3
    ldy    $88                   ; 3
    nop                          ; 2
    stx    GRP1                  ; 3   E
    sta    GRP0                  ; 3   C
    sty    GRP1                  ; 3   O
    sty    GRP0                  ; 3
    ldy    $89                   ; 3
    dey                          ; 2
    bpl    .loopDrawLogo         ; 2³

    sty    WSYNC                 ; 3
;---------------------------------------
    ldy    #$FF                  ; 2   bottom line of border
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sty    WSYNC                 ; 3
    sty    WSYNC                 ; 3
;---------------------------------------
    iny                          ; 2   Y=0
    sty    PF2                   ; 3   clear all
    sty    ENAM0                 ; 3
    sty    ENAM1                 ; 3
    sty    WSYNC                 ; 3
;---------------------------------------
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$E8                  ; 2   time until middle section (yellow part) of title screen
    sta    TIM8T                 ; 4
    lda    $8C                   ; 3
    bne    L5203                 ; 2³+1
    lda    #7                    ; 2
    cmp    $85                   ; 3
    bne    L5201                 ; 2³+1
    lda    #$0B                  ; 2
L5201:
    sta    $85                   ; 3
L5203:
    lda    $83                   ; 3
    ldx    #0                    ; 2
    jsr    HorizPosition_B       ; 6   position walking smurf

.waitForMidSection:
    lda    INTIM                 ; 4   make sure the right amount of scanlines are taken
    bne    .waitForMidSection    ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #0                    ; 2   already at zero
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$89                  ; 2   time until bottom section (orange part) of title screen
    sta    TIM8T                 ; 4
    lda    L530A+1               ; 4   middle of title screen (yellow) color
    sta    COLUBK                ; 3
    dec    $BA                   ; 5
    bne    L5233                 ; 2³
    lda    #1                    ; 2
    sta    $BA                   ; 3
    lda    $BB                   ; 3
    cmp    #$22                  ; 2
    bmi    L5233                 ; 2³
    dec    $BB                   ; 5
L5233:
    inc    $B7                   ; 5
    lda    #3                    ; 2
    and    $B7                   ; 3
    sta    $B7                   ; 3
    bne    L525E                 ; 2³
    lda    $B5                   ; 3
L523F:
    clc                          ; 2
    adc    $B6                   ; 3
    sta    $B5                   ; 3
    and    #$08                  ; 2
    bne    L5257                 ; 2³
    sec                          ; 2
    sbc    $B6                   ; 3
    sta    $B6                   ; 3
    lda    $B5                   ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    $B5                   ; 3
    jmp    L523F                 ; 3

L5257:
    lda    $B5                   ; 3
    clc                          ; 2
    adc    #0                    ; 2
    sta    $B8                   ; 3
L525E:
    lda    INTIM                 ; 4
    bne    L525E                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    sta    VDELP0                ; 3
    lda    $8B                   ; 3
    sta    REFP0                 ; 3
    ldy    #$2E                  ; 2
L5271:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($8F),Y               ; 5
    sta    GRP0                  ; 3
    lda    L5C43,Y               ; 4
    sta    COLUP0                ; 3
    dey                          ; 2
    cpy    #$0F                  ; 2
    bcs    L5271                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #0                    ; 2
    sty    GRP0                  ; 3
    ldy    #6                    ; 2
L5289:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bpl    L5289                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$48                  ; 2
    jsr    L530D                 ; 6
    lda    #0                    ; 2
    sta    COLUBK                ; 3
    ldx    #$0C                  ; 2
    stx    COLUP0                ; 3
    stx    COLUP1                ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    REFP0                 ; 3
    sta    VDELP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    L530A+2               ; 4
    sta    COLUBK                ; 3
    ldy    $BB                   ; 3
    ldx    #$3E                  ; 2
L52B2:
    dey                          ; 2
    bpl    L52BB                 ; 2³
    jsr    L5331                 ; 6
    jmp    L52D1                 ; 3

L52BB:
    cpy    #5                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    bcs    L52D1                 ; 2³
    lda    L5300,Y               ; 4
    sta    GRP0                  ; 3
    lda    #2                    ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    lda    L5305,Y               ; 4
    sta    GRP1                  ; 3
L52D1:
    dex                          ; 2
    bpl    L52B2                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    COLUBK                ; 3
    jsr    L5333                 ; 6
    jmp    L5FEF                 ; 3

;logo letters are drawn by their outlines, therefore the letters are see-through
;the playfield is drawn behind the letters, and changes in the playfield color
;makes the logo flash

Logo_C:
;used twice
    .byte $C3 ; |XX    XX| $52E0
    .byte $81 ; |X      X| $52E1
    .byte $99 ; |X  XX  X| $52E2
    .byte $9F ; |X  XXXXX| $52E3
    .byte $9F ; |X  XXXXX| $52E4
    .byte $99 ; |X  XX  X| $52E5
    .byte $81 ; |X      X| $52E6
    .byte $C3 ; |XX    XX| $52E7
Logo_O:
;used twice
    .byte $C3 ; |XX    XX| $52E8
    .byte $81 ; |X      X| $52E9
    .byte $99 ; |X  XX  X| $52EA
    .byte $99 ; |X  XX  X| $52EB
    .byte $99 ; |X  XX  X| $52EC
    .byte $99 ; |X  XX  X| $52ED
    .byte $81 ; |X      X| $52EE
    .byte $C3 ; |XX    XX| $52EF
Logo_L:
    .byte $81 ; |X      X| $52F0
    .byte $81 ; |X      X| $52F1
    .byte $9F ; |X  XXXXX| $52F2
    .byte $9F ; |X  XXXXX| $52F3
    .byte $9F ; |X  XXXXX| $52F4
    .byte $9F ; |X  XXXXX| $52F5
    .byte $9F ; |X  XXXXX| $52F6
    .byte $9F ; |X  XXXXX| $52F7
Logo_E:
    .byte $81 ; |X      X| $52F8
    .byte $81 ; |X      X| $52F9
    .byte $9F ; |X  XXXXX| $52FA
    .byte $81 ; |X      X| $52FB
    .byte $81 ; |X      X| $52FC
    .byte $9F ; |X  XXXXX| $52FD
    .byte $81 ; |X      X| $52FE
    .byte $81 ; |X      X| $52FF

L5300:
    .byte $E8 ; |XXX X   | $5300
    .byte $28 ; |  X X   | $5301
    .byte $6B ; | XX X XX| $5302
    .byte $2A ; |  X X X | $5303
    .byte $EB ; |XXX X XX| $5304
L5305:
    .byte $BB ; |X XXX XX| $5305
    .byte $A8 ; |X X X   | $5306
    .byte $B9 ; |X XXX  X| $5307
    .byte $A8 ; |X X X   | $5308
    .byte $BB ; |X XXX XX| $5309

;title screen background colors
L530A:
    .byte $74 ; title screen top
    .byte $18 ; title screen middle
    .byte $34 ; title screen bottom

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L530D SUBROUTINE
    sta    $89                   ; 3
    ldx    #0                    ; 2
    jsr    HorizPosition_A       ; 6
    lda    $89                   ; 3
    clc                          ; 2
    adc    #8                    ; 2
    inx                          ; 2
    jsr    HorizPosition_A       ; 6
    lda    $89                   ; 3
    inx                          ; 2
    jsr    HorizPosition_A       ; 6
    lda    $89                   ; 3
    clc                          ; 2
    adc    #$11                  ; 2
    inx                          ; 2
    jsr    HorizPosition_A       ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L5331 SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
L5333 SUBROUTINE
    ldy    #0                    ; 2
    sty    ENAM0                 ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sty    ENAM1                 ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L5340:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$1D                  ; 2
    ldx    #2                    ; 2
    jsr    HorizPosition_B       ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$43                  ; 2
    ldx    #4                    ; 2
    jsr    HorizPosition_B       ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$89                  ; 2
    sta    TIM8T                 ; 4
    sta    HMCLR                 ; 3
    ldx    $82                   ; 3
    lda    L5D53,X               ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #0                    ; 2
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    sta    NUSIZ1                ; 3
    lda    #1                    ; 2
    sta    NUSIZ0                ; 3
    lda    $92                   ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    adc    #$D2                  ; 2
    sta    $93                   ; 3
    lda    #0                    ; 2
    adc    #$5C                  ; 2
    sta    $94                   ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $92                   ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$D2                  ; 2
    sta    $95                   ; 3
    lda    #0                    ; 2
    adc    #$5C                  ; 2
    sta    $96                   ; 3
    lda    $82                   ; 3
    asl                          ; 2
    tax                          ; 2
    lda    L5D6E,X               ; 4
    sta    $A6                   ; 3
    lda    L5D6E+1,X             ; 4
    sta    $A7                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    $82                   ; 3
    lda    L5D50,X               ; 4
    sta    COLUBK                ; 3
    sta    $B4                   ; 3
    lda    $A5                   ; 3
    bmi    L53D8                 ; 2³
    ldx    #1                    ; 2
L53B9:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    L53B9                 ; 2³
    ldy    #7                    ; 2
L53C0:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($A6),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($93),Y               ; 5
    sta    GRP1                  ; 3
    ldx    #7                    ; 2
L53CC:
    dex                          ; 2
    bpl    L53CC                 ; 2³
    lda    ($95),Y               ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    L53C0                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
L53D8:
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    NUSIZ0                ; 3
    sta    COLUP1                ; 3
    sta    HMBL                  ; 3
L53E4:
    lda    INTIM                 ; 4
    bpl    L53E4                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $82                   ; 3
    cmp    #0                    ; 2
    beq    L53F4                 ; 2³
    jmp    L56C4                 ; 3

L53F4:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$E2                  ; 2
    sta    TIM64T                ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #3                    ; 2
    nop                          ; 2
L5400:
    dex                          ; 2
    bpl    L5400                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #3                    ; 2
    nop                          ; 2
    nop                          ; 2
L540B:
    dex                          ; 2
    bpl    L540B                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$1F                  ; 2
    lda    SmurfColorTab,Y       ; 4
    sta    COLUP0                ; 3
L5419:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    L5DD7,Y               ; 4
    sta    GRP0                  ; 3
    dey                          ; 2
    cpy    #$18                  ; 2
    bcs    L5419                 ; 2³
L5425:
    tya                          ; 2
    lsr                          ; 2
    bcs    L5431                 ; 2³
    lsr                          ; 2
    bcs    L5432                 ; 2³
    ldx    #0                    ; 2
    jmp    L5435                 ; 3

L5431:
    lsr                          ; 2
L5432:
    ldx    L5DE4                 ; 4
L5435:
    stx    $88                   ; 3
    tax                          ; 2
    lda    L5DB2,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    lda    $88                   ; 3
    sta    COLUPF                ; 3
    lda    L5C32,Y               ; 4
    sta    GRP0                  ; 3
    lda    L5DF7,Y               ; 4
    sta    GRP1                  ; 3
    lda    L5DD4,X               ; 4
    sta    PF2                   ; 3
    lda    SmurfColorTab-1,Y     ; 4
    sta    COLUP0                ; 3
    dey                          ; 2
    bpl    L5425                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    lda    L5DE4                 ; 4
    sta    COLUPF                ; 3
    lda    L5DB1                 ; 4
    sta    PF0                   ; 3
    lda    L5DC2                 ; 4
    sta    PF1                   ; 3
    lda    L5DD3                 ; 4
    sta    PF2                   ; 3
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    sta    COLUP0                ; 3
    lda    #2                    ; 2
    sta    ENAM0                 ; 3
    lda    #5                    ; 2
    sta    NUSIZ1                ; 3
    lda    $E1                   ; 3
    cmp    #$2C                  ; 2
    bcc    L548D                 ; 2³
    lda    $E2                   ; 3
    jmp    L548F                 ; 3

L548D:
    lda    #6                    ; 2
L548F:
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$18                  ; 2
    ldx    #1                    ; 2
    jsr    HorizPosition_B       ; 6
    ldx    #$28                  ; 2
L549C:
    txa                          ; 2
    lsr                          ; 2
    bcs    L54C8                 ; 2³
    lsr                          ; 2
    bcs    L54C9                 ; 2³
    tay                          ; 2
    lda    L5D8E,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP1                  ; 3
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    lda    L5DA6,Y               ; 4
    sta    PF0                   ; 3
    lda    L5DB7,Y               ; 4
    sta    PF1                   ; 3
    lda    L5DC8,Y               ; 4
    sta    PF2                   ; 3
    lda    L5D98,Y               ; 4
    sta    HMP1                  ; 3
    jmp    L54DD                 ; 3

L54C8:
    lsr                          ; 2
L54C9:
    sta    WSYNC                 ; 3
;---------------------------------------
    tay                          ; 2
    lda    L5DDA,Y               ; 4
    sta    COLUPF                ; 3
    cpx    $E1                   ; 3
    bcs    L54DD                 ; 2³
    lda    $E2                   ; 3
    sta    COLUP1                ; 3
    lda    #0                    ; 2
    sta    ENAM0                 ; 3
L54DD:
    dex                          ; 2
    bne    L549C                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    lda    #$C4                  ; 2
    sta    COLUBK                ; 3
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    sta    PF2                   ; 3
    sta    NUSIZ0                ; 3
    lda    $8B                   ; 3
    sta    REFP0                 ; 3
    lda    L5DDA                 ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUPF                ; 3
    lda    $83                   ; 3
    ldx    #0                    ; 2
    jsr    HorizPosition_B       ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    sta    PF0                   ; 3
    sta    GRP1                  ; 3
    sta    ENAM0                 ; 3
    sta    NUSIZ1                ; 3
    ldy    #8                    ; 2
    sty    REFP1                 ; 3
    ldx    #1                    ; 2
L551A:
    ldy    #$2D                  ; 2
    dex                          ; 2
    bpl    L551A                 ; 2³
    sta    RESP1                 ; 3
    sta    COLUP1                ; 3
    ldx    L5DC0,Y               ; 4
    lda    #$C4                  ; 2
L5528:
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP0                  ; 3
    sta    COLUBK                ; 3
    lda    L5C44,Y               ; 4
    sta    COLUP0                ; 3
    lda    $97                   ; 3
    bpl    L553C                 ; 2³
    lda    L5DE9,Y               ; 4
    sta    GRP1                  ; 3
L553C:
    cpy    #$26                  ; 2
    bcc    L5546                 ; 2³
    ldx    L5DBF,Y               ; 4
    jmp    L5549                 ; 3

L5546:
    lda    ($8F),Y               ; 5
    tax                          ; 2
L5549:
    lda    L5D1B,Y               ; 4
    eor    #$0F                  ; 2
    clc                          ; 2
    adc    #$6F                  ; 2
    dey                          ; 2
    cpy    #$0E                  ; 2
    bcs    L5528                 ; 2³
    lda    $97                   ; 3
    bpl    L555E                 ; 2³
    lda    #2                    ; 2
    sta    ENABL                 ; 3
L555E:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    lda    L5DA6                 ; 4
    sta    PF0                   ; 3
    lda    #$10                  ; 2
    sta    COLUBK                ; 3
    ldx    #$34                  ; 2
    cpx    $B8                   ; 3
    bcs    L557A                 ; 2³
    ldx    #0                    ; 2
    stx    $D6                   ; 3
    jmp    L5582                 ; 3

L557A:
    cpx    $B7                   ; 3
    bcs    L5582                 ; 2³
    ldx    #2                    ; 2
    stx    $D6                   ; 3
L5582:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $97                   ; 3
    bpl    L5593                 ; 2³
    lda    #$43                  ; 2
    jmp    L5598                 ; 3

    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
L5593:
    lda    $B6                   ; 3
    clc                          ; 2
    adc    #9                    ; 2
L5598:
    ldx    #2                    ; 2
    jsr    HorizPosition_B       ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #4                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #0                    ; 2
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    #$30                  ; 2
    sta    HMP0                  ; 3
    lda    #$40                  ; 2
    sta    HMP1                  ; 3
    ldx    #2                    ; 2
    sta    RESP0                 ; 3
    lda    #0                    ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    RESP1                 ; 3
    lda    #$30                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    PF0                   ; 3
    lda    #$0A                  ; 2
    sta    COLUBK                ; 3
L55CB:
    lda    L5D88,X               ; 4
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    HMM0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    L55CB                 ; 2³
    ldx    #3                    ; 2
L55DF:
    lda    #$74                  ; 2
    sta    COLUP0                ; 3
    lda    #$34                  ; 2
    sta    COLUP1                ; 3
    ldy    #3                    ; 2
L55E9:
    dey                          ; 2
    bpl    L55E9                 ; 2³
    lda    #$18                  ; 2
    sta    COLUP0                ; 3
    nop                          ; 2
    nop                          ; 2
    lda    #$0E                  ; 2
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    L55DF                 ; 2³
    lda    #0                    ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    #2                    ; 2
L5603:
    lda    L5D8B,X               ; 4
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    L5603                 ; 2³
    lda    $97                   ; 3
    bpl    L561B                 ; 2³
    ldy    #0                    ; 2
    tya                          ; 2
    jmp    L5622                 ; 3

L561B:
    ldy    #$10                  ; 2
    ldx    $C9                   ; 3
    lda    L5D84,X               ; 4
L5622:
    ldx    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    ENABL                 ; 3
    sta    COLUP0                ; 3
    sty    NUSIZ0                ; 3
    lda    $D6                   ; 3
    sta    ENAM0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $B6                   ; 3
    ldx    #1                    ; 2
    jsr    HorizPosition_B       ; 6
    ldx    #$31                  ; 2
L563F:
    sta    WSYNC                 ; 3
;---------------------------------------
    cpx    $B8                   ; 3
    bcs    L564A                 ; 2³
    lda    #0                    ; 2
    jmp    L5650                 ; 3

L564A:
    cpx    $B7                   ; 3
    bcs    L5652                 ; 2³
    lda    #2                    ; 2
L5650:
    sta    ENAM0                 ; 3
L5652:
    dex                          ; 2
    cpx    #$2D                  ; 2
    bne    L563F                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #6                    ; 2
    sta    COLUP1                ; 3
    lda    #0                    ; 2
    sta    REFP1                 ; 3
    lda    #5                    ; 2
    sta    NUSIZ1                ; 3
    inc    $CC                   ; 5
    ldx    #$2C                  ; 2
L566B:
    cpx    $B8                   ; 3
    bcs    L5676                 ; 2³
    lda    #0                    ; 2
    sta    $D6                   ; 3
    jmp    L567E                 ; 3

L5676:
    cpx    $B7                   ; 3
    bcs    L567E                 ; 2³
    lda    #2                    ; 2
    sta    $D6                   ; 3
L567E:
    txa                          ; 2
    lsr                          ; 2
    bcs    L5697                 ; 2³
    lsr                          ; 2
    bcs    L5698                 ; 2³
    tay                          ; 2
    lda    L5D98,Y               ; 4
    sta    HMP1                  ; 3
    lda    L5D8D,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP1                  ; 3
    jmp    L56A2                 ; 3

L5697:
    lsr                          ; 2
L5698:
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L5DA4,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
L56A2:
    cpx    $CC                   ; 3
    bcs    L56AE                 ; 2³
    lda    $CB                   ; 3
    sta    COLUP1                ; 3
    lda    #0                    ; 2
    sta    $D6                   ; 3
L56AE:
    lda    $D6                   ; 3
    sta    ENAM0                 ; 3
    dex                          ; 2
    bne    L566B                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP1                  ; 3
    lda    #4                    ; 2
    sta    COLUBK                ; 3
    stx    ENAM0                 ; 3
L56BF:
    lda    INTIM                 ; 4
    bne    L56BF                 ; 2³
L56C4:
    lda    $82                   ; 3
    cmp    #1                    ; 2
    beq    L56CD                 ; 2³
    jmp    L58FB                 ; 3

L56CD:
    ldx    #$11                  ; 2
L56CF:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    L56CF                 ; 2³
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    stx    CTRLPF                ; 3
    lda    #$0E                  ; 2
    sta    COLUPF                ; 3
    ldy    #$1E                  ; 2
L56E0:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    L5E17,Y               ; 4
    sta    PF1                   ; 3
    dey                          ; 2
    bne    L56E0                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    PF1                   ; 3
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    COLUPF                ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    REFP0                 ; 3
    sty    REFP1                 ; 3
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #0                    ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $BC                   ; 3
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #7                    ; 2
L5718:
    stx    $C9                   ; 3
    lda    $BE,X                 ; 4
    sta    $CA                   ; 3
    and    #$7F                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $CB                   ; 3
    tax                          ; 2
    lda    L5E93,X               ; 4
    sta    NUSIZ0                ; 3
    lda    $CA                   ; 3
    and    #$07                  ; 2
    sta    $CC                   ; 3
    tax                          ; 2
    lda    L5E93,X               ; 4
    sta    NUSIZ1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    ldx    #2                    ; 2
L573C:
    dex                          ; 2
    bpl    L573C                 ; 2³
    lda    $CA                   ; 3
    asl                          ; 2
    bcs    L574A                 ; 2³
    asl                          ; 2
L5745:
    asl                          ; 2
    bcc    L5745                 ; 2³
    sta    RESP0                 ; 3
L574A:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #1                    ; 2
L574E:
    dex                          ; 2
    bpl    L574E                 ; 2³
    lda    $CA                   ; 3
    and    #$07                  ; 2
    beq    L575C                 ; 2³
L5757:
    asl                          ; 2
    bcc    L5757                 ; 2³
    sta    RESP1                 ; 3
L575C:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    $CB                   ; 3
    lda    L5E9B,X               ; 4
    sta    GRP0                  ; 3
    sta    $88                   ; 3
    ldx    $CC                   ; 3
    lda    L5E9B,X               ; 4
    sta    GRP1                  ; 3
    sta    $89                   ; 3
    ldx    $CB                   ; 3
    lda    L5EA3,X               ; 4
    ldx    $CC                   ; 3
    ldy    L5EA3,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $C9                   ; 3
    and    #$01                  ; 2
    bne    L578E                 ; 2³
    lda    #0                    ; 2
    sta    COLUPF                ; 3
L578E:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    $C9                   ; 3
    lda    $B4,X                 ; 4
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $88                   ; 3
    sta    GRP0                  ; 3
    lda    $89                   ; 3
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    ldx    $C9                   ; 3
    dex                          ; 2
    bmi    L57B2                 ; 2³
    jmp    L5718                 ; 3

L57B2:
    lda    #$47                  ; 2
    sta    TIM8T                 ; 4
    ldx    #0                    ; 2
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    lda    #5                    ; 2
    sta    CTRLPF                ; 3
    lda    $83                   ; 3
    jsr    HorizPosition_B       ; 6
    inx                          ; 2
    lda    $8B                   ; 3
    beq    L57D4                 ; 2³
    lda    #$FA                  ; 2
    jmp    L57D6                 ; 3

L57D4:
    lda    #6                    ; 2
L57D6:
    clc                          ; 2
    adc    $83                   ; 3
    jsr    HorizPosition_B       ; 6
    lda    $8B                   ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    $A3                   ; 3
    beq    L57EF                 ; 2³
    lda    #$CA                  ; 2
    sta    $E7                   ; 3
    lda    #$5E                  ; 2
    jmp    L57F5                 ; 3

L57EF:
    lda    #$EA                  ; 2
    sta    $E7                   ; 3
    lda    #$5E                  ; 2
L57F5:
    sta    $E8                   ; 3
L57F7:
    lda    INTIM                 ; 4
    bpl    L57F7                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$30                  ; 2
    sta    PF0                   ; 3
    lda    #$2C                  ; 2
    sta    COLUP1                ; 3
    lda    #$D6                  ; 2
    sta    COLUPF                ; 3
    ldy    #$2D                  ; 2
L580E:
    lda    L5C43,Y               ; 4
    tax                          ; 2
    lda    ($8F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    stx    COLUP0                ; 3
    lda    ($E7),Y               ; 5
    sta    GRP1                  ; 3
    lda    L5D22,Y               ; 4
    sta    COLUBK                ; 3
    nop                          ; 2
    nop                          ; 2
    lda    L5E37,Y               ; 4
    sta    PF0                   ; 3
    lda    L5E65,Y               ; 4
    sta    PF1                   ; 3
    dey                          ; 2
    cpy    #$0F                  ; 2
    bcs    L580E                 ; 2³
    lda    L5D22,Y               ; 4
    ldx    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    stx    GRP0                  ; 3
    nop                          ; 2
    nop                          ; 2
    lda    #0                    ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    $BD                   ; 3
    asl                          ; 2
    bcs    L5852                 ; 2³
    asl                          ; 2
L584D:
    asl                          ; 2
    bcc    L584D                 ; 2³
    sta    RESP0                 ; 3
L5852:
    lda    #0                    ; 2
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    dey                          ; 2
    ldx    L5E65,Y               ; 4
    lda    L5D22,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    stx.w  PF1                   ; 4
    nop                          ; 2
    nop                          ; 2
    lda    $BD                   ; 3
    and    #$07                  ; 2
    beq    L5873                 ; 2³
L586E:
    asl                          ; 2
    bcc    L586E                 ; 2³
    sta    RESP1                 ; 3
L5873:
    dey                          ; 2
    ldx    L5E65,Y               ; 4
    lda    L5D22,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    stx    PF1                   ; 3
    lda    $BD                   ; 3
    and    #$7F                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $CB                   ; 3
    tax                          ; 2
    lda    L5E93,X               ; 4
    sta    NUSIZ0                ; 3
    txa                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    L5EAB,X               ; 4
    sta    $CD                   ; 3
    lda    L5EAB+1,X             ; 4
    sta    $CE                   ; 3
    dey                          ; 2
    lda    L5D22,Y               ; 4
    ldx    L5E65,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    stx    PF1                   ; 3
    lda    $BD                   ; 3
    and    #$07                  ; 2
    sta    $CC                   ; 3
    tax                          ; 2
    lda    L5E93,X               ; 4
    sta    NUSIZ1                ; 3
    txa                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    L5EAB,X               ; 4
    sta    $CF                   ; 3
    lda    L5EAB+1,X             ; 4
    sta    $D0                   ; 3
    dey                          ; 2
    ldx    L5E65,Y               ; 4
    lda    L5D22,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    stx    PF1                   ; 3
    dey                          ; 2
L58D0:
    lda    $CB                   ; 3
    beq    L58D6                 ; 2³
    lda    ($CD),Y               ; 5
L58D6:
    pha                          ; 3
    lda    $CC                   ; 3
    beq    L58DD                 ; 2³
    lda    ($CF),Y               ; 5
L58DD:
    ldx    L5E65,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    pla                          ; 4
    sta    GRP0                  ; 3
    lda    L5D22,Y               ; 4
    sta    COLUBK                ; 3
    stx    PF1                   ; 3
    dey                          ; 2
    bpl    L58D0                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    COLUBK                ; 3
L58FB:
    lda    $82                   ; 3
    cmp    #2                    ; 2
    beq    L5904                 ; 2³
    jmp    L5C05                 ; 3

L5904:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$2A                  ; 2
    sta    TIM8T                 ; 4
    lda    $B9                   ; 3
    ldx    #0                    ; 2
    jsr    HorizPosition_B       ; 6
    lda    $B9                   ; 3
    clc                          ; 2
    adc    #8                    ; 2
    cmp    #$A0                  ; 2
    bcc    L591D                 ; 2³
    sbc    #$A0                  ; 2
L591D:
    inx                          ; 2
    jsr    HorizPosition_B       ; 6
L5921:
    lda    INTIM                 ; 4
    bpl    L5921                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    REFP0                 ; 3
    lda    $D3                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #5                    ; 2
    sta    CTRLPF                ; 3
    lda    #8                    ; 2
    sta    REFP1                 ; 3
    lda    #2                    ; 2
    sta    $CA                   ; 3
L5944:
    ldx    #$30                  ; 2
    lda    #0                    ; 2
    dec    $D1                   ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    bmi    L5956                 ; 2³
    ldy    $D1                   ; 3
    cpy    $D2                   ; 3
    bcs    L5956                 ; 2³
    lda    ($F2),Y               ; 5
L5956:
    stx    PF0                   ; 3
    sta    GRP0                  ; 3
    ldx    #0                    ; 2
    stx    PF1                   ; 3
    sta    GRP1                  ; 3
    stx    PF2                   ; 3
    ldx    #$1A                  ; 2
L5964:
    lda    #0                    ; 2
    dec    $D1                   ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    bmi    L5974                 ; 2³
    ldy    $D1                   ; 3
    cpy    $D2                   ; 3
    bcs    L5974                 ; 2³
    lda    ($F2),Y               ; 5
L5974:
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    dex                          ; 2
    bpl    L5964                 ; 2³
    lda    #3                    ; 2
    sta    $89                   ; 3
    ldx    $CA                   ; 3
    bne    L59C1                 ; 2³
L5989:
    dec    $D1                   ; 5
    bmi    L59BA                 ; 2³
    ldy    $D1                   ; 3
    cpy    $D2                   ; 3
    bcs    L59BA                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($F2),Y               ; 5
L5997:
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$FF                  ; 2
    sta    PF0                   ; 3
    lda    $B5                   ; 3
    sta    PF1                   ; 3
    lda    $B6                   ; 3
    sta    PF2                   ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    #$87                  ; 2
    sta    PF1                   ; 3
    lda    $B7                   ; 3
    sta    PF2                   ; 3
    dec    $89                   ; 5
    bpl    L5989                 ; 2³
    jmp    L59F1                 ; 3

L59BA:
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    L5997                 ; 3

L59C1:
    dec    $D1                   ; 5
    bpl    L59CC                 ; 2³
L59C5:
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    L59D6                 ; 3

L59CC:
    ldy    $D1                   ; 3
    cpy    $D2                   ; 3
    bcs    L59C5                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($F2),Y               ; 5
L59D6:
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$FF                  ; 2
    sta    PF0                   ; 3
    sta    PF2                   ; 3
    lda    $BD,X                 ; 4
    sta    PF1                   ; 3
    ldy    #1                    ; 2
L59E6:
    dey                          ; 2
    bpl    L59E6                 ; 2³
    lda    $BF,X                 ; 4
    sta    PF1                   ; 3
    dec    $89                   ; 5
    bpl    L59C1                 ; 2³
L59F1:
    dec    $CA                   ; 5
    bmi    L5A18                 ; 2³+1
    jmp    L5944                 ; 3


    lda    $D8                   ; 3
    clc                          ; 2
    adc    #8                    ; 2
    ldx    #1                    ; 2
    ldy    $D7                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    COLUP0                ; 3
    sty    COLUP1                ; 3
    ldy    #$FF                  ; 2
    sty    PF0                   ; 3
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    jsr    HorizPosition_B       ; 6
    lda    $D8                   ; 3
    dex                          ; 2
    jsr    HorizPosition_B       ; 6
L5A18:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$FF                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #$31                  ; 2
    sta    CTRLPF                ; 3
    ldx    $DE                   ; 3
    bne    L5A40                 ; 2³
    sta    RESP0                 ; 3
    lda    #6                    ; 2
    sta    NUSIZ0                ; 3
    lda    #$50                  ; 2
    sta    HMP0                  ; 3
    lda    #$0C                  ; 2
    sta    COLUP0                ; 3
    ldx    #1                    ; 2
L5A40:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$FF                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    nop                          ; 2
    ldx    #8                    ; 2
L5A4D:
    dex                          ; 2
    bpl    L5A4D                 ; 2³
    lda    #$10                  ; 2
    sta    HMBL                  ; 3
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #2                    ; 2
    sta    ENABL                 ; 3
    ldy    $DE                   ; 3
    beq    L5A6B                 ; 2³
    dey                          ; 2
    beq    L5A68                 ; 2³
    jmp    L5AF5                 ; 3

L5A68:
    jmp    L5B29                 ; 3

L5A6B:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$3C                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    HMCLR                 ; 3
    ldy    #5                    ; 2
L5A79:
    sta    WSYNC                 ; 3
;---------------------------------------
    cpy    #4                    ; 2
    bcs    L5A91                 ; 2³
    ldx    #2                    ; 2
L5A81:
    dex                          ; 2
    bpl    L5A81                 ; 2³
    nop                          ; 2
    lda    #$C6                  ; 2
    sta    COLUPF                ; 3
    nop                          ; 2
    ldx    #5                    ; 2
L5A8C:
    dex                          ; 2
    bne    L5A8C                 ; 2³
    stx    COLUPF                ; 3
L5A91:
    dey                          ; 2
    bpl    L5A79                 ; 2³
    ldy    #$0B                  ; 2
L5A96:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    L5F46,Y               ; 4
    lda    L5FA5,X               ; 4
    sta    GRP0                  ; 3
    nop                          ; 2
    ldx    #1                    ; 2
L5AA3:
    dex                          ; 2
    bpl    L5AA3                 ; 2³
    lda    #$C6                  ; 2
    sta    COLUPF                ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    #$FF                  ; 2
    sta    GRP0                  ; 3
    ldx    L5F60,Y               ; 4
    lda    L5FA5,X               ; 4
    sta    GRP0                  ; 3
    nop                          ; 2
    nop                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    dey                          ; 2
    bpl    L5A96                 ; 2³
    ldy    #3                    ; 2
L5AC4:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    ldx    #2                    ; 2
L5ACC:
    dex                          ; 2
    bpl    L5ACC                 ; 2³
    lda    #$C6                  ; 2
    sta    COLUPF                ; 3
    ldx    #6                    ; 2
L5AD5:
    dex                          ; 2
    bne    L5AD5                 ; 2³
    stx    COLUPF                ; 3
    dey                          ; 2
    bpl    L5AC4                 ; 2³
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $D7                   ; 3
    sta    COLUP0                ; 3
    lda    $D8                   ; 3
    ldx    #0                    ; 2
    jsr    HorizPosition_B       ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    L5B63                 ; 3

L5AF5:
    ldy    #$19                  ; 2
L5AF7:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$3C                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    cpy    #$17                  ; 2
    bcs    L5B23                 ; 2³
    cpy    #3                    ; 2
    bcc    L5B23                 ; 2³
    nop                          ; 2
    lda    #$34                  ; 2
    sta    $0108                 ; 4
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    #$18                  ; 2
    sta    COLUPF                ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    #$74                  ; 2
    sta    COLUPF                ; 3
    nop                          ; 2
    nop                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
L5B23:
    dey                          ; 2
    bpl    L5AF7                 ; 2³+1
    jmp    L5B63                 ; 3

L5B29:
    ldy    #$19                  ; 2
L5B2B:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$30                  ; 2
    sta    PF0                   ; 3
    sta    $010E                 ; 4
    nop                          ; 2
    nop                          ; 2
    cpy    #$17                  ; 2
    bcs    L5B45                 ; 2³
    cpy    #3                    ; 2
    bcc    L5B47                 ; 2³
    lda    #$C6                  ; 2
    sta    COLUPF                ; 3
    jmp    L5B4B                 ; 3

L5B45:
    nop                          ; 2
    nop                          ; 2
L5B47:
    nop                          ; 2
    nop                          ; 2
    lda    $88                   ; 3
L5B4B:
    lda    #$1C                  ; 2
    sta    PF2                   ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    #$3C                  ; 2
    sta    PF2                   ; 3
    lda    #$3C                  ; 2
    sta    PF1                   ; 3
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    dey                          ; 2
    bpl    L5B2B                 ; 2³
L5B63:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #7                    ; 2
    sta    NUSIZ0                ; 3
    ldx    #5                    ; 2
L5B73:
    dex                          ; 2
    bpl    L5B73                 ; 2³
    sta    HMCLR                 ; 3
    lda    #$70                  ; 2
    sta    HMP0                  ; 3
    lda    #$3C                  ; 2
    sta    PF1                   ; 3
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$F8                  ; 2
    sta    GRP0                  ; 3
    lda    #0                    ; 2
    sta    COLUP0                ; 3
    sta    PF1                   ; 3
    ldx    #$0A                  ; 2
L5B92:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    L5B92                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$34                  ; 2
    sta    TIM8T                 ; 4
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    sta    HMCLR                 ; 3
    lda    $83                   ; 3
    ldy    $8B                   ; 3
    sty    REFP1                 ; 3
    ldx    #1                    ; 2
    jsr    HorizPosition_B       ; 6
L5BAF:
    lda    INTIM                 ; 4
    bpl    L5BAF                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    #$2C                  ; 2
L5BBA:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    L5F8F,Y               ; 4
    sta    GRP1                  ; 3
    lda    SmurfColorTab         ; 4
    sta    COLUP1                ; 3
    dey                          ; 2
    cpy    #$26                  ; 2
    bcs    L5BBA                 ; 2³
L5BCB:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($8F),Y               ; 5
    sta    GRP1                  ; 3
    lda    L5D22,Y               ; 4
    adc    #$50                  ; 2
    sta    COLUBK                ; 3
    lda    L5C43,Y               ; 4
    sta    COLUP1                ; 3
    dey                          ; 2
    cpy    #$0F                  ; 2
    bcs    L5BCB                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #0                    ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    ENABL                 ; 3
    lda    L5D30                 ; 4
    adc    #$50                  ; 2
    sta    COLUBK                ; 3
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    ldx    #$0C                  ; 2
L5BF9:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    L5D25,X               ; 4
    adc    #$50                  ; 2
    sta    COLUBK                ; 3
    dex                          ; 2
    bpl    L5BF9                 ; 2³+1
L5C05:
    jmp    L5FEF                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

HorizPosition_A SUBROUTINE
    sta    WSYNC                 ; 3   add an extra scanline
;---------------------------------------
HorizPosition_B SUBROUTINE
    clc                          ; 2
    adc    #$2E                  ; 2
    tay                          ; 2
    and    #$0F                  ; 2
    sta    $88                   ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc    $88                   ; 3
    cmp    #$0F                  ; 2
    bcc    L5C22                 ; 2³
    sbc    #$0F                  ; 2
    iny                          ; 2
L5C22:
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0,X                ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
L5C2C:
    dey                          ; 2
    bpl    L5C2C                 ; 2³
    sta    RESP0,X               ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L5C32:
    .byte $3E ; |  XXXXX | $5C32
    .byte $3E ; |  XXXXX | $5C33
    .byte $1A ; |   XX X | $5C34
    .byte $18 ; |   XX   | $5C35
    .byte $38 ; |  XXX   | $5C36
    .byte $78 ; | XXXX   | $5C37
    .byte $78 ; | XXXX   | $5C38
    .byte $78 ; | XXXX   | $5C39
    .byte $78 ; | XXXX   | $5C3A
    .byte $78 ; | XXXX   | $5C3B
    .byte $78 ; | XXXX   | $5C3C
    .byte $38 ; |  XXX   | $5C3D
    .byte $38 ; |  XXX   | $5C3E
    .byte $3F ; |  XXXXXX| $5C3F
    .byte $3F ; |  XXXXXX| $5C40
    .byte $11 ; |   X   X| $5C41
    .byte $3C ; |  XXXX  | $5C42
L5C43:
    .byte $7E ; | XXXXXX | $5C43
L5C44:
    .byte $FE ; |XXXXXXX | $5C44
    .byte $BF ; |X XXXXXX| $5C45
    .byte $FB ; |XXXXX XX| $5C46
    .byte $FB ; |XXXXX XX| $5C47
    .byte $7E ; | XXXXXX | $5C48
    .byte $7E ; | XXXXXX | $5C49
    .byte $FE ; |XXXXXXX | $5C4A
    .byte $FC ; |XXXXXX  | $5C4B
    .byte $F8 ; |XXXXX   | $5C4C
    .byte $F9 ; |XXXXX  X| $5C4D
    .byte $FF ; |XXXXXXXX| $5C4E
    .byte $7F ; | XXXXXXX| $5C4F
    .byte $3E ; |  XXXXX | $5C50
    .byte $0C ; |    XX  | $5C51

SmurfColorTab:
    .byte $0E ; |    XXX | $5C52   white - pants and shoes
    .byte $0E ; |    XXX | $5C53
    .byte $0E ; |    XXX | $5C54
    .byte $0E ; |    XXX | $5C55
    .byte $0E ; |    XXX | $5C56
    .byte $0E ; |    XXX | $5C57
    .byte $0E ; |    XXX | $5C58
    .byte $0E ; |    XXX | $5C59
    .byte $74 ; | XXX X  | $5C5A   blue - upper body
    .byte $74 ; | XXX X  | $5C5B
    .byte $74 ; | XXX X  | $5C5C
    .byte $74 ; | XXX X  | $5C5D
    .byte $74 ; | XXX X  | $5C5E
    .byte $74 ; | XXX X  | $5C5F
    .byte $74 ; | XXX X  | $5C60
    .byte $74 ; | XXX X  | $5C61
    .byte $74 ; | XXX X  | $5C62
    .byte $74 ; | XXX X  | $5C63
    .byte $74 ; | XXX X  | $5C64
    .byte $74 ; | XXX X  | $5C65
    .byte $74 ; | XXX X  | $5C66
    .byte $74 ; | XXX X  | $5C67
    .byte $74 ; | XXX X  | $5C68
    .byte $0E ; |    XXX | $5C69   white - hat
    .byte $0E ; |    XXX | $5C6A
    .byte $0E ; |    XXX | $5C6B
    .byte $0E ; |    XXX | $5C6C
    .byte $0E ; |    XXX | $5C6D
    .byte $0E ; |    XXX | $5C6E
    .byte $0E ; |    XXX | $5C6F
    .byte $0E ; |    XXX | $5C70
    .byte $0E ; |    XXX | $5C71
    
WalkingSmurfOne:
    .byte $78 ; | XXXX   | $5C72
    .byte $60 ; | XX     | $5C73
    .byte $23 ; |  X   XX| $5C74
    .byte $37 ; |  XX XXX| $5C75
    .byte $36 ; |  XX XX | $5C76
    .byte $12 ; |   X  X | $5C77
    .byte $3E ; |  XXXXX | $5C78
    .byte $7E ; | XXXXXX | $5C79
    .byte $7C ; | XXXXX  | $5C7A
    .byte $78 ; | XXXX   | $5C7B
    .byte $78 ; | XXXX   | $5C7C
    .byte $38 ; |  XXX   | $5C7D
    .byte $38 ; |  XXX   | $5C7E
    .byte $3F ; |  XXXXXX| $5C7F
    .byte $3F ; |  XXXXXX| $5C80
    .byte $11 ; |   X   X| $5C81
    .byte $3C ; |  XXXX  | $5C82
    .byte $7E ; | XXXXXX | $5C83
    .byte $FE ; |XXXXXXX | $5C84
    .byte $BF ; |X XXXXXX| $5C85
    .byte $FB ; |XXXXX XX| $5C86
    .byte $FB ; |XXXXX XX| $5C87
    .byte $7E ; | XXXXXX | $5C88
    .byte $7E ; | XXXXXX | $5C89
    .byte $FE ; |XXXXXXX | $5C8A
    .byte $FC ; |XXXXXX  | $5C8B
    .byte $F8 ; |XXXXX   | $5C8C
    .byte $F9 ; |XXXXX  X| $5C8D
    .byte $FF ; |XXXXXXXX| $5C8E
    .byte $7F ; | XXXXXXX| $5C8F
    .byte $3E ; |  XXXXX | $5C90
    .byte $0C ; |    XX  | $5C91
WalkingSmurfTwo:
    .byte $6E ; | XX XXX | $5C92
    .byte $CE ; |XX  XXX | $5C93
    .byte $EA ; |XXX X X | $5C94
    .byte $A8 ; |X X X   | $5C95
    .byte $38 ; |  XXX   | $5C96
    .byte $18 ; |   XX   | $5C97
    .byte $78 ; | XXXX   | $5C98
    .byte $78 ; | XXXX   | $5C99
    .byte $78 ; | XXXX   | $5C9A
    .byte $78 ; | XXXX   | $5C9B
    .byte $78 ; | XXXX   | $5C9C
    .byte $38 ; |  XXX   | $5C9D
    .byte $38 ; |  XXX   | $5C9E
    .byte $3F ; |  XXXXXX| $5C9F
    .byte $3F ; |  XXXXXX| $5CA0
    .byte $11 ; |   X   X| $5CA1
    .byte $3C ; |  XXXX  | $5CA2
    .byte $7E ; | XXXXXX | $5CA3
    .byte $FE ; |XXXXXXX | $5CA4
    .byte $BF ; |X XXXXXX| $5CA5
    .byte $FB ; |XXXXX XX| $5CA6
    .byte $FB ; |XXXXX XX| $5CA7
    .byte $7E ; | XXXXXX | $5CA8
    .byte $7E ; | XXXXXX | $5CA9
    .byte $FE ; |XXXXXXX | $5CAA
    .byte $FC ; |XXXXXX  | $5CAB
    .byte $F8 ; |XXXXX   | $5CAC
    .byte $F9 ; |XXXXX  X| $5CAD
    .byte $FF ; |XXXXXXXX| $5CAE
    .byte $7F ; | XXXXXXX| $5CAF
    .byte $3E ; |  XXXXX | $5CB0
    .byte $0C ; |    XX  | $5CB1
WalkingSmurfThree:
    .byte $5C ; | X XXX  | $5CB2
    .byte $58 ; | X XX   | $5CB3
    .byte $50 ; | X X    | $5CB4
    .byte $7C ; | XXXXX  | $5CB5
    .byte $54 ; | X X X  | $5CB6
    .byte $1C ; |   XXX  | $5CB7
    .byte $7C ; | XXXXX  | $5CB8
    .byte $78 ; | XXXX   | $5CB9
    .byte $78 ; | XXXX   | $5CBA
    .byte $78 ; | XXXX   | $5CBB
    .byte $78 ; | XXXX   | $5CBC
    .byte $38 ; |  XXX   | $5CBD
    .byte $38 ; |  XXX   | $5CBE
    .byte $3F ; |  XXXXXX| $5CBF
    .byte $3F ; |  XXXXXX| $5CC0
    .byte $11 ; |   X   X| $5CC1
    .byte $3C ; |  XXXX  | $5CC2
    .byte $7E ; | XXXXXX | $5CC3
    .byte $FE ; |XXXXXXX | $5CC4
    .byte $BF ; |X XXXXXX| $5CC5
    .byte $FB ; |XXXXX XX| $5CC6
    .byte $FB ; |XXXXX XX| $5CC7
    .byte $7E ; | XXXXXX | $5CC8
    .byte $7E ; | XXXXXX | $5CC9
    .byte $FE ; |XXXXXXX | $5CCA
    .byte $FC ; |XXXXXX  | $5CCB
    .byte $F8 ; |XXXXX   | $5CCC
    .byte $F9 ; |XXXXX  X| $5CCD
    .byte $FF ; |XXXXXXXX| $5CCE
    .byte $7F ; | XXXXXXX| $5CCF
    .byte $3E ; |  XXXXX | $5CD0
    .byte $0C ; |    XX  | $5CD1

    .byte $1E ; |   XXXX | $5CD2
    .byte $33 ; |  XX  XX| $5CD3
    .byte $33 ; |  XX  XX| $5CD4
    .byte $33 ; |  XX  XX| $5CD5
    .byte $33 ; |  XX  XX| $5CD6
    .byte $33 ; |  XX  XX| $5CD7
    .byte $1E ; |   XXXX | $5CD8
    .byte $00 ; |        | $5CD9
    .byte $3F ; |  XXXXXX| $5CDA
    .byte $0C ; |    XX  | $5CDB
    .byte $0C ; |    XX  | $5CDC
    .byte $0C ; |    XX  | $5CDD
    .byte $1C ; |   XXX  | $5CDE
    .byte $0C ; |    XX  | $5CDF
    .byte $04 ; |     X  | $5CE0
    .byte $00 ; |        | $5CE1
    .byte $3F ; |  XXXXXX| $5CE2
    .byte $31 ; |  XX   X| $5CE3
    .byte $30 ; |  XX    | $5CE4
    .byte $1E ; |   XXXX | $5CE5
    .byte $03 ; |      XX| $5CE6
    .byte $23 ; |  X   XX| $5CE7
    .byte $1E ; |   XXXX | $5CE8
    .byte $00 ; |        | $5CE9
    .byte $1E ; |   XXXX | $5CEA
    .byte $23 ; |  X   XX| $5CEB
    .byte $03 ; |      XX| $5CEC
    .byte $0E ; |    XXX | $5CED
    .byte $03 ; |      XX| $5CEE
    .byte $23 ; |  X   XX| $5CEF
    .byte $1E ; |   XXXX | $5CF0
    .byte $00 ; |        | $5CF1
    .byte $06 ; |     XX | $5CF2
    .byte $06 ; |     XX | $5CF3
    .byte $3F ; |  XXXXXX| $5CF4
    .byte $26 ; |  X  XX | $5CF5
    .byte $16 ; |   X XX | $5CF6
    .byte $0E ; |    XXX | $5CF7
    .byte $06 ; |     XX | $5CF8
    .byte $00 ; |        | $5CF9
    .byte $1E ; |   XXXX | $5CFA
    .byte $23 ; |  X   XX| $5CFB
    .byte $03 ; |      XX| $5CFC
    .byte $3E ; |  XXXXX | $5CFD
    .byte $30 ; |  XX    | $5CFE
    .byte $30 ; |  XX    | $5CFF
    .byte $3F ; |  XXXXXX| $5D00
    .byte $00 ; |        | $5D01
    .byte $1E ; |   XXXX | $5D02
    .byte $33 ; |  XX  XX| $5D03
    .byte $33 ; |  XX  XX| $5D04
    .byte $3E ; |  XXXXX | $5D05
    .byte $30 ; |  XX    | $5D06
    .byte $31 ; |  XX   X| $5D07
    .byte $1E ; |   XXXX | $5D08
    .byte $00 ; |        | $5D09
    .byte $18 ; |   XX   | $5D0A
    .byte $18 ; |   XX   | $5D0B
    .byte $0C ; |    XX  | $5D0C
    .byte $06 ; |     XX | $5D0D
    .byte $03 ; |      XX| $5D0E
    .byte $21 ; |  X    X| $5D0F
    .byte $3F ; |  XXXXXX| $5D10
    .byte $00 ; |        | $5D11
    .byte $1E ; |   XXXX | $5D12
    .byte $33 ; |  XX  XX| $5D13
    .byte $33 ; |  XX  XX| $5D14
    .byte $1E ; |   XXXX | $5D15
    .byte $33 ; |  XX  XX| $5D16
    .byte $33 ; |  XX  XX| $5D17
    .byte $1E ; |   XXXX | $5D18
    .byte $00 ; |        | $5D19
    .byte $1E ; |   XXXX | $5D1A
L5D1B:
    .byte $23 ; |  X   XX| $5D1B
    .byte $03 ; |      XX| $5D1C
    .byte $1F ; |   XXXXX| $5D1D
    .byte $33 ; |  XX  XX| $5D1E
    .byte $33 ; |  XX  XX| $5D1F
    .byte $1E ; |   XXXX | $5D20
    .byte $00 ; |        | $5D21
L5D22:
    .byte $54 ; | X X X  | $5D22
    .byte $56 ; | X X XX | $5D23
    .byte $54 ; | X X X  | $5D24
L5D25:
    .byte $56 ; | X X XX | $5D25
    .byte $54 ; | X X X  | $5D26
    .byte $56 ; | X X XX | $5D27
    .byte $54 ; | X X X  | $5D28
    .byte $56 ; | X X XX | $5D29
    .byte $54 ; | X X X  | $5D2A
    .byte $56 ; | X X XX | $5D2B
    .byte $54 ; | X X X  | $5D2C
    .byte $56 ; | X X XX | $5D2D
    .byte $54 ; | X X X  | $5D2E
    .byte $56 ; | X X XX | $5D2F
L5D30:
    .byte $54 ; | X X X  | $5D30
    .byte $56 ; | X X XX | $5D31
    .byte $54 ; | X X X  | $5D32
    .byte $56 ; | X X XX | $5D33
    .byte $54 ; | X X X  | $5D34
    .byte $56 ; | X X XX | $5D35
    .byte $58 ; | X XX   | $5D36
    .byte $56 ; | X X XX | $5D37
    .byte $58 ; | X XX   | $5D38
    .byte $56 ; | X X XX | $5D39
    .byte $58 ; | X XX   | $5D3A
    .byte $56 ; | X X XX | $5D3B
    .byte $58 ; | X XX   | $5D3C
    .byte $56 ; | X X XX | $5D3D
    .byte $58 ; | X XX   | $5D3E
    .byte $56 ; | X X XX | $5D3F
    .byte $58 ; | X XX   | $5D40
    .byte $56 ; | X X XX | $5D41
    .byte $58 ; | X XX   | $5D42
    .byte $56 ; | X X XX | $5D43
    .byte $58 ; | X XX   | $5D44
    .byte $5A ; | X XX X | $5D45
    .byte $58 ; | X XX   | $5D46
    .byte $5A ; | X XX X | $5D47
    .byte $58 ; | X XX   | $5D48
    .byte $5A ; | X XX X | $5D49
    .byte $8C ; |X   XX  | $5D4A
    .byte $8C ; |X   XX  | $5D4B
    .byte $8C ; |X   XX  | $5D4C
    .byte $8C ; |X   XX  | $5D4D
    .byte $8C ; |X   XX  | $5D4E
    .byte $8C ; |X   XX  | $5D4F
L5D50:
    .byte $0A ; |    X X | $5D50
    .byte $8C ; |X   XX  | $5D51
    .byte $A8 ; |X X X   | $5D52
L5D53:
    .byte $00 ; |        | $5D53
    .byte $B6 ; |X XX XX | $5D54
    .byte $00 ; |        | $5D55
L5D56:
    .byte $18 ; |   XX   | $5D56
    .byte $18 ; |   XX   | $5D57
    .byte $18 ; |   XX   | $5D58
    .byte $3C ; |  XXXX  | $5D59
    .byte $3C ; |  XXXX  | $5D5A
    .byte $3C ; |  XXXX  | $5D5B
    .byte $3C ; |  XXXX  | $5D5C
    .byte $3C ; |  XXXX  | $5D5D
L5D5E:
    .byte $20 ; |  X     | $5D5E
    .byte $70 ; | XXX    | $5D5F
    .byte $70 ; | XXX    | $5D60
    .byte $30 ; |  XX    | $5D61
    .byte $10 ; |   X    | $5D62
    .byte $18 ; |   XX   | $5D63
    .byte $10 ; |   X    | $5D64
    .byte $1C ; |   XXX  | $5D65
L5D66:
    .byte $F8 ; |XXXXX   | $5D66
    .byte $F8 ; |XXXXX   | $5D67
    .byte $F8 ; |XXXXX   | $5D68
    .byte $70 ; | XXX    | $5D69
    .byte $70 ; | XXX    | $5D6A
    .byte $70 ; | XXX    | $5D6B
    .byte $20 ; |  X     | $5D6C
    .byte $20 ; |  X     | $5D6D

L5D6E:
    .word  L5D56         ; $5D6E
    .word  L5D5E         ; $5D70
    .word  L5D66         ; $5D72

L5D74:
    .byte $A3 ; |X X   XX| $5D74
L5D75:
    .byte $5C ; | X XXX  | $5D75
    .byte $83 ; |X     XX| $5D76
    .byte $5C ; | X XXX  | $5D77
    .byte $63 ; | XX   XX| $5D78
    .byte $5C ; | X XXX  | $5D79
    .byte $23 ; |  X   XX| $5D7A
    .byte $5C ; | X XXX  | $5D7B

L5D7C:
    .byte $8C ; |X   XX  | $5D7C
    .byte $83 ; |X     XX| $5D7D
    .byte $77 ; | XXX XXX| $5D7E
    .byte $62 ; | XX   X | $5D7F
L5D80:
    .byte $0C ; |    XX  | $5D80
    .byte $14 ; |   X X  | $5D81
    .byte $26 ; |  X  XX | $5D82
    .byte $16 ; |   X XX | $5D83
L5D84:
    .byte $74 ; | XXX X  | $5D84
    .byte $34 ; |  XX X  | $5D85
    .byte $18 ; |   XX   | $5D86
    .byte $0E ; |    XXX | $5D87
L5D88:
    .byte $7E ; | XXXXXX | $5D88
    .byte $FF ; |XXXXXXXX| $5D89
    .byte $7E ; | XXXXXX | $5D8A
L5D8B:
    .byte $3C ; |  XXXX  | $5D8B
    .byte $3C ; |  XXXX  | $5D8C
L5D8D:
    .byte $7E ; | XXXXXX | $5D8D
L5D8E:
    .byte $F0 ; |XXXX    | $5D8E
    .byte $F0 ; |XXXX    | $5D8F
    .byte $F8 ; |XXXXX   | $5D90
    .byte $F8 ; |XXXXX   | $5D91
    .byte $FC ; |XXXXXX  | $5D92
    .byte $FC ; |XXXXXX  | $5D93
    .byte $FE ; |XXXXXXX | $5D94
    .byte $FF ; |XXXXXXXX| $5D95
    .byte $FF ; |XXXXXXXX| $5D96
    .byte $FF ; |XXXXXXXX| $5D97
L5D98:
    .byte $FE ; |XXXXXXX | $5D98
    .byte $00 ; |        | $5D99
    .byte $F0 ; |XXXX    | $5D9A
    .byte $00 ; |        | $5D9B
    .byte $F0 ; |XXXX    | $5D9C
    .byte $00 ; |        | $5D9D
    .byte $F0 ; |XXXX    | $5D9E
    .byte $F0 ; |XXXX    | $5D9F
    .byte $00 ; |        | $5DA0
    .byte $00 ; |        | $5DA1
    .byte $10 ; |   X    | $5DA2
    .byte $F0 ; |XXXX    | $5DA3
L5DA4:
    .byte $F0 ; |XXXX    | $5DA4
    .byte $70 ; | XXX    | $5DA5
L5DA6:
    .byte $30 ; |  XX    | $5DA6
    .byte $30 ; |  XX    | $5DA7
    .byte $30 ; |  XX    | $5DA8
    .byte $30 ; |  XX    | $5DA9
    .byte $30 ; |  XX    | $5DAA
    .byte $30 ; |  XX    | $5DAB
    .byte $30 ; |  XX    | $5DAC
    .byte $F0 ; |XXXX    | $5DAD
    .byte $F0 ; |XXXX    | $5DAE
    .byte $F0 ; |XXXX    | $5DAF
    .byte $F0 ; |XXXX    | $5DB0
L5DB1:
    .byte $B0 ; |X XX    | $5DB1
L5DB2:
    .byte $F0 ; |XXXX    | $5DB2
    .byte $70 ; | XXX    | $5DB3
    .byte $30 ; |  XX    | $5DB4
    .byte $00 ; |        | $5DB5
    .byte $00 ; |        | $5DB6
L5DB7:
    .byte $00 ; |        | $5DB7
    .byte $00 ; |        | $5DB8
    .byte $00 ; |        | $5DB9
    .byte $00 ; |        | $5DBA
    .byte $00 ; |        | $5DBB
    .byte $00 ; |        | $5DBC
    .byte $00 ; |        | $5DBD
    .byte $C0 ; |XX      | $5DBE
L5DBF:
    .byte $C0 ; |XX      | $5DBF
L5DC0:
    .byte $40 ; | X      | $5DC0
    .byte $C0 ; |XX      | $5DC1
L5DC2:
    .byte $80 ; |X       | $5DC2
    .byte $00 ; |        | $5DC3
    .byte $00 ; |        | $5DC4
    .byte $00 ; |        | $5DC5
    .byte $00 ; |        | $5DC6
    .byte $00 ; |        | $5DC7
L5DC8:
    .byte $00 ; |        | $5DC8
    .byte $C0 ; |XX      | $5DC9
    .byte $C0 ; |XX      | $5DCA
    .byte $C0 ; |XX      | $5DCB
    .byte $C0 ; |XX      | $5DCC
    .byte $C0 ; |XX      | $5DCD
    .byte $C0 ; |XX      | $5DCE
    .byte $F8 ; |XXXXX   | $5DCF
    .byte $F8 ; |XXXXX   | $5DD0
    .byte $F8 ; |XXXXX   | $5DD1
    .byte $58 ; | X XX   | $5DD2
L5DD3:
    .byte $F0 ; |XXXX    | $5DD3
L5DD4:
    .byte $B0 ; |X XX    | $5DD4
    .byte $E0 ; |XXX     | $5DD5
    .byte $80 ; |X       | $5DD6
L5DD7:
    .byte $00 ; |        | $5DD7
    .byte $00 ; |        | $5DD8
    .byte $00 ; |        | $5DD9
L5DDA:
    .byte $54 ; | X X X  | $5DDA
    .byte $54 ; | X X X  | $5DDB
    .byte $54 ; | X X X  | $5DDC
    .byte $54 ; | X X X  | $5DDD
    .byte $54 ; | X X X  | $5DDE
    .byte $54 ; | X X X  | $5DDF
    .byte $52 ; | X X  X | $5DE0
    .byte $56 ; | X X XX | $5DE1
    .byte $56 ; | X X XX | $5DE2
    .byte $56 ; | X X XX | $5DE3
L5DE4:
    .byte $56 ; | X X XX | $5DE4
    .byte $FE ; |XXXXXXX | $5DE5
    .byte $FC ; |XXXXXX  | $5DE6
    .byte $78 ; | XXXX   | $5DE7
    .byte $78 ; | XXXX   | $5DE8
L5DE9:
    .byte $7E ; | XXXXXX | $5DE9
    .byte $FF ; |XXXXXXXX| $5DEA
    .byte $FF ; |XXXXXXXX| $5DEB
    .byte $FE ; |XXXXXXX | $5DEC
    .byte $7C ; | XXXXX  | $5DED
    .byte $FE ; |XXXXXXX | $5DEE
    .byte $FF ; |XXXXXXXX| $5DEF
    .byte $7F ; | XXXXXXX| $5DF0
    .byte $3F ; |  XXXXXX| $5DF1
    .byte $1E ; |   XXXX | $5DF2
    .byte $9E ; |X  XXXX | $5DF3
    .byte $DE ; |XX XXXX | $5DF4
    .byte $FC ; |XXXXXX  | $5DF5
    .byte $78 ; | XXXX   | $5DF6
L5DF7:
    .byte $01 ; |       X| $5DF7
    .byte $01 ; |       X| $5DF8
    .byte $01 ; |       X| $5DF9
    .byte $01 ; |       X| $5DFA
    .byte $01 ; |       X| $5DFB
    .byte $01 ; |       X| $5DFC
    .byte $01 ; |       X| $5DFD
    .byte $01 ; |       X| $5DFE
    .byte $01 ; |       X| $5DFF
    .byte $01 ; |       X| $5E00
    .byte $01 ; |       X| $5E01
    .byte $01 ; |       X| $5E02
    .byte $01 ; |       X| $5E03
    .byte $01 ; |       X| $5E04
    .byte $03 ; |      XX| $5E05
    .byte $06 ; |     XX | $5E06
    .byte $FC ; |XXXXXX  | $5E07
    .byte $F8 ; |XXXXX   | $5E08
    .byte $00 ; |        | $5E09
    .byte $00 ; |        | $5E0A
    .byte $00 ; |        | $5E0B
    .byte $00 ; |        | $5E0C
    .byte $00 ; |        | $5E0D
    .byte $00 ; |        | $5E0E
    .byte $00 ; |        | $5E0F
    .byte $00 ; |        | $5E10
    .byte $00 ; |        | $5E11
    .byte $00 ; |        | $5E12
    .byte $00 ; |        | $5E13
    .byte $00 ; |        | $5E14
    .byte $00 ; |        | $5E15
    .byte $00 ; |        | $5E16
L5E17:
    .byte $00 ; |        | $5E17
    .byte $00 ; |        | $5E18
    .byte $00 ; |        | $5E19
    .byte $00 ; |        | $5E1A
    .byte $00 ; |        | $5E1B
    .byte $00 ; |        | $5E1C
    .byte $00 ; |        | $5E1D
    .byte $00 ; |        | $5E1E
    .byte $00 ; |        | $5E1F
    .byte $00 ; |        | $5E20
    .byte $00 ; |        | $5E21
    .byte $00 ; |        | $5E22
    .byte $00 ; |        | $5E23
    .byte $00 ; |        | $5E24
    .byte $00 ; |        | $5E25
    .byte $00 ; |        | $5E26
    .byte $00 ; |        | $5E27
    .byte $00 ; |        | $5E28
    .byte $00 ; |        | $5E29
    .byte $00 ; |        | $5E2A
    .byte $00 ; |        | $5E2B
    .byte $00 ; |        | $5E2C
    .byte $10 ; |   X    | $5E2D
    .byte $34 ; |  XX X  | $5E2E
    .byte $7E ; | XXXXXX | $5E2F
    .byte $FE ; |XXXXXXX | $5E30
    .byte $FE ; |XXXXXXX | $5E31
    .byte $7C ; | XXXXX  | $5E32
    .byte $7C ; | XXXXX  | $5E33
    .byte $38 ; |  XXX   | $5E34
    .byte $30 ; |  XX    | $5E35
    .byte $10 ; |   X    | $5E36
L5E37:
    .byte $FF ; |XXXXXXXX| $5E37
    .byte $FF ; |XXXXXXXX| $5E38
    .byte $FF ; |XXXXXXXX| $5E39
    .byte $FF ; |XXXXXXXX| $5E3A
    .byte $FF ; |XXXXXXXX| $5E3B
    .byte $FF ; |XXXXXXXX| $5E3C
    .byte $FF ; |XXXXXXXX| $5E3D
    .byte $FF ; |XXXXXXXX| $5E3E
    .byte $FF ; |XXXXXXXX| $5E3F
    .byte $FF ; |XXXXXXXX| $5E40
    .byte $FF ; |XXXXXXXX| $5E41
    .byte $FF ; |XXXXXXXX| $5E42
    .byte $FF ; |XXXXXXXX| $5E43
    .byte $FF ; |XXXXXXXX| $5E44
    .byte $FF ; |XXXXXXXX| $5E45
    .byte $FF ; |XXXXXXXX| $5E46
    .byte $FF ; |XXXXXXXX| $5E47
    .byte $F0 ; |XXXX    | $5E48
    .byte $F0 ; |XXXX    | $5E49
    .byte $F0 ; |XXXX    | $5E4A
    .byte $F0 ; |XXXX    | $5E4B
    .byte $F0 ; |XXXX    | $5E4C
    .byte $F0 ; |XXXX    | $5E4D
    .byte $F0 ; |XXXX    | $5E4E
    .byte $F0 ; |XXXX    | $5E4F
    .byte $F0 ; |XXXX    | $5E50
    .byte $F0 ; |XXXX    | $5E51
    .byte $F0 ; |XXXX    | $5E52
    .byte $F0 ; |XXXX    | $5E53
    .byte $F0 ; |XXXX    | $5E54
    .byte $F0 ; |XXXX    | $5E55
    .byte $F0 ; |XXXX    | $5E56
    .byte $F0 ; |XXXX    | $5E57
    .byte $F0 ; |XXXX    | $5E58
    .byte $70 ; | XXX    | $5E59
    .byte $F0 ; |XXXX    | $5E5A
    .byte $F0 ; |XXXX    | $5E5B
    .byte $F0 ; |XXXX    | $5E5C
    .byte $F0 ; |XXXX    | $5E5D
    .byte $D0 ; |XX X    | $5E5E
    .byte $50 ; | X X    | $5E5F
    .byte $10 ; |   X    | $5E60
    .byte $10 ; |   X    | $5E61
    .byte $30 ; |  XX    | $5E62
    .byte $30 ; |  XX    | $5E63
    .byte $30 ; |  XX    | $5E64
L5E65:
    .byte $FE ; |XXXXXXX | $5E65
    .byte $FE ; |XXXXXXX | $5E66
    .byte $FC ; |XXXXXX  | $5E67
    .byte $FC ; |XXXXXX  | $5E68
    .byte $FC ; |XXXXXX  | $5E69
    .byte $F8 ; |XXXXX   | $5E6A
    .byte $F8 ; |XXXXX   | $5E6B
    .byte $F8 ; |XXXXX   | $5E6C
    .byte $E0 ; |XXX     | $5E6D
    .byte $E0 ; |XXX     | $5E6E
    .byte $F0 ; |XXXX    | $5E6F
    .byte $F0 ; |XXXX    | $5E70
    .byte $D0 ; |XX X    | $5E71
    .byte $D0 ; |XX X    | $5E72
    .byte $C0 ; |XX      | $5E73
    .byte $C0 ; |XX      | $5E74
    .byte $E0 ; |XXX     | $5E75
    .byte $E0 ; |XXX     | $5E76
    .byte $E0 ; |XXX     | $5E77
    .byte $E0 ; |XXX     | $5E78
    .byte $E0 ; |XXX     | $5E79
    .byte $E0 ; |XXX     | $5E7A
    .byte $E0 ; |XXX     | $5E7B
    .byte $E0 ; |XXX     | $5E7C
    .byte $60 ; | XX     | $5E7D
    .byte $40 ; | X      | $5E7E
    .byte $40 ; | X      | $5E7F
    .byte $80 ; |X       | $5E80
    .byte $80 ; |X       | $5E81
    .byte $80 ; |X       | $5E82
    .byte $80 ; |X       | $5E83
    .byte $80 ; |X       | $5E84
    .byte $00 ; |        | $5E85
    .byte $00 ; |        | $5E86
    .byte $00 ; |        | $5E87
    .byte $00 ; |        | $5E88
    .byte $00 ; |        | $5E89
    .byte $00 ; |        | $5E8A
    .byte $00 ; |        | $5E8B
    .byte $00 ; |        | $5E8C
    .byte $00 ; |        | $5E8D
    .byte $00 ; |        | $5E8E
    .byte $00 ; |        | $5E8F
    .byte $00 ; |        | $5E90
    .byte $00 ; |        | $5E91
    .byte $00 ; |        | $5E92
L5E93:
    .byte $00 ; |        | $5E93
    .byte $00 ; |        | $5E94
    .byte $00 ; |        | $5E95
    .byte $01 ; |       X| $5E96
    .byte $00 ; |        | $5E97
    .byte $02 ; |      X | $5E98
    .byte $01 ; |       X| $5E99
    .byte $03 ; |      XX| $5E9A
L5E9B:
    .byte $00 ; |        | $5E9B
    .byte $1E ; |   XXXX | $5E9C
    .byte $3C ; |  XXXX  | $5E9D
    .byte $3C ; |  XXXX  | $5E9E
    .byte $78 ; | XXXX   | $5E9F
    .byte $78 ; | XXXX   | $5EA0
    .byte $78 ; | XXXX   | $5EA1
    .byte $78 ; | XXXX   | $5EA2
L5EA3:
    .byte $00 ; |        | $5EA3
    .byte $3F ; |  XXXXXX| $5EA4
    .byte $7E ; | XXXXXX | $5EA5
    .byte $7E ; | XXXXXX | $5EA6
    .byte $FC ; |XXXXXX  | $5EA7
    .byte $FC ; |XXXXXX  | $5EA8
    .byte $FC ; |XXXXXX  | $5EA9
    .byte $FC ; |XXXXXX  | $5EAA

L5EAB:
    .word L5EBB          ; $5EAB
    .word L5ECF          ; $5EAD
    .word L5EC5          ; $5EAF
    .word L5EC5          ; $5EB1
    .word L5EBB          ; $5EB3
    .word L5EBB          ; $5EB5
    .word L5EBB          ; $5EB7
    .word L5EBB          ; $5EB9

L5EBB:
    .byte $00 ; |        | $5EBB
    .byte $00 ; |        | $5EBC
    .byte $00 ; |        | $5EBD
    .byte $00 ; |        | $5EBE
    .byte $00 ; |        | $5EBF
    .byte $00 ; |        | $5EC0
    .byte $FC ; |XXXXXX  | $5EC1
    .byte $FC ; |XXXXXX  | $5EC2
    .byte $FC ; |XXXXXX  | $5EC3
    .byte $78 ; | XXXX   | $5EC4
L5EC5:
    .byte $00 ; |        | $5EC5
    .byte $00 ; |        | $5EC6
    .byte $00 ; |        | $5EC7
    .byte $00 ; |        | $5EC8
    .byte $00 ; |        | $5EC9
    .byte $00 ; |        | $5ECA
    .byte $7E ; | XXXXXX | $5ECB
    .byte $7E ; | XXXXXX | $5ECC
    .byte $7E ; | XXXXXX | $5ECD
    .byte $3C ; |  XXXX  | $5ECE
L5ECF:
    .byte $00 ; |        | $5ECF
    .byte $00 ; |        | $5ED0
    .byte $00 ; |        | $5ED1
    .byte $00 ; |        | $5ED2
    .byte $00 ; |        | $5ED3
    .byte $00 ; |        | $5ED4
    .byte $3F ; |  XXXXXX| $5ED5
    .byte $3F ; |  XXXXXX| $5ED6
    .byte $3F ; |  XXXXXX| $5ED7
    .byte $1E ; |   XXXX | $5ED8

    .byte $00 ; |        | $5ED9
    .byte $00 ; |        | $5EDA
    .byte $00 ; |        | $5EDB
    .byte $00 ; |        | $5EDC
    .byte $00 ; |        | $5EDD
    .byte $00 ; |        | $5EDE
    .byte $00 ; |        | $5EDF
    .byte $00 ; |        | $5EE0
    .byte $00 ; |        | $5EE1
    .byte $00 ; |        | $5EE2
    .byte $00 ; |        | $5EE3
    .byte $00 ; |        | $5EE4
    .byte $79 ; | XXXX  X| $5EE5
    .byte $49 ; | X  X  X| $5EE6
    .byte $4B ; | X  X XX| $5EE7
    .byte $7F ; | XXXXXXX| $5EE8
    .byte $FF ; |XXXXXXXX| $5EE9
    .byte $2B ; |  X X XX| $5EEA
    .byte $29 ; |  X X  X| $5EEB
    .byte $01 ; |       X| $5EEC
    .byte $00 ; |        | $5EED
    .byte $00 ; |        | $5EEE
    .byte $00 ; |        | $5EEF
    .byte $00 ; |        | $5EF0
    .byte $00 ; |        | $5EF1
    .byte $00 ; |        | $5EF2
    .byte $00 ; |        | $5EF3
    .byte $00 ; |        | $5EF4
    .byte $00 ; |        | $5EF5
    .byte $00 ; |        | $5EF6
    .byte $00 ; |        | $5EF7
    .byte $00 ; |        | $5EF8
    .byte $00 ; |        | $5EF9
    .byte $00 ; |        | $5EFA
    .byte $00 ; |        | $5EFB
    .byte $00 ; |        | $5EFC
    .byte $00 ; |        | $5EFD
    .byte $00 ; |        | $5EFE
    .byte $7C ; | XXXXX  | $5EFF
    .byte $7C ; | XXXXX  | $5F00
    .byte $38 ; |  XXX   | $5F01
    .byte $10 ; |   X    | $5F02
    .byte $10 ; |   X    | $5F03
    .byte $78 ; | XXXX   | $5F04
    .byte $78 ; | XXXX   | $5F05
    .byte $50 ; | X X    | $5F06
    .byte $58 ; | X XX   | $5F07
    .byte $78 ; | XXXX   | $5F08
    .byte $70 ; | XXX    | $5F09
    .byte $10 ; |   X    | $5F0A
    .byte $10 ; |   X    | $5F0B
    .byte $00 ; |        | $5F0C
    .byte $00 ; |        | $5F0D
    .byte $00 ; |        | $5F0E
    .byte $00 ; |        | $5F0F
    .byte $00 ; |        | $5F10
    .byte $00 ; |        | $5F11
    .byte $00 ; |        | $5F12
    .byte $00 ; |        | $5F13
    .byte $00 ; |        | $5F14
    .byte $00 ; |        | $5F15
    .byte $00 ; |        | $5F16
    .byte $00 ; |        | $5F17
    .byte $00 ; |        | $5F18
    .byte $03 ; |      XX| $5F19
    .byte $0F ; |    XXXX| $5F1A
    .byte $1F ; |   XXXXX| $5F1B
    .byte $1F ; |   XXXXX| $5F1C
    .byte $3F ; |  XXXXXX| $5F1D
    .byte $3F ; |  XXXXXX| $5F1E
    .byte $7F ; | XXXXXXX| $5F1F
    .byte $7F ; | XXXXXXX| $5F20
    .byte $7F ; | XXXXXXX| $5F21
    .byte $FF ; |XXXXXXXX| $5F22
    .byte $FF ; |XXXXXXXX| $5F23
    .byte $FF ; |XXXXXXXX| $5F24
    .byte $FF ; |XXXXXXXX| $5F25
    .byte $FF ; |XXXXXXXX| $5F26
    .byte $FF ; |XXXXXXXX| $5F27
    .byte $FF ; |XXXXXXXX| $5F28
    .byte $FF ; |XXXXXXXX| $5F29
    .byte $7F ; | XXXXXXX| $5F2A
    .byte $7F ; | XXXXXXX| $5F2B
    .byte $7F ; | XXXXXXX| $5F2C
    .byte $3F ; |  XXXXXX| $5F2D
    .byte $3F ; |  XXXXXX| $5F2E
    .byte $1F ; |   XXXXX| $5F2F
    .byte $1F ; |   XXXXX| $5F30
    .byte $0F ; |    XXXX| $5F31
    .byte $03 ; |      XX| $5F32
    .byte $03 ; |      XX| $5F33
    .byte $0F ; |    XXXX| $5F34
    .byte $0F ; |    XXXX| $5F35
    .byte $1F ; |   XXXXX| $5F36
    .byte $1F ; |   XXXXX| $5F37
    .byte $3F ; |  XXXXXX| $5F38
    .byte $3F ; |  XXXXXX| $5F39
    .byte $3F ; |  XXXXXX| $5F3A
    .byte $3F ; |  XXXXXX| $5F3B
    .byte $3F ; |  XXXXXX| $5F3C
    .byte $3F ; |  XXXXXX| $5F3D
    .byte $3F ; |  XXXXXX| $5F3E
    .byte $3F ; |  XXXXXX| $5F3F
    .byte $3F ; |  XXXXXX| $5F40
    .byte $1F ; |   XXXXX| $5F41
    .byte $1F ; |   XXXXX| $5F42
    .byte $0F ; |    XXXX| $5F43
    .byte $0F ; |    XXXX| $5F44
    .byte $03 ; |      XX| $5F45
L5F46:
    .byte $03 ; |      XX| $5F46
    .byte $07 ; |     XXX| $5F47
    .byte $07 ; |     XXX| $5F48
    .byte $0F ; |    XXXX| $5F49
    .byte $0F ; |    XXXX| $5F4A
    .byte $0F ; |    XXXX| $5F4B
    .byte $0F ; |    XXXX| $5F4C
    .byte $0F ; |    XXXX| $5F4D
    .byte $0F ; |    XXXX| $5F4E
    .byte $07 ; |     XXX| $5F4F
    .byte $07 ; |     XXX| $5F50
    .byte $03 ; |      XX| $5F51
    .byte $FF ; |XXXXXXXX| $5F52
    .byte $FF ; |XXXXXXXX| $5F53
    .byte $7F ; | XXXXXXX| $5F54
    .byte $7F ; | XXXXXXX| $5F55
    .byte $7F ; | XXXXXXX| $5F56
    .byte $3F ; |  XXXXXX| $5F57
    .byte $3F ; |  XXXXXX| $5F58
    .byte $3F ; |  XXXXXX| $5F59
    .byte $3F ; |  XXXXXX| $5F5A
    .byte $1F ; |   XXXXX| $5F5B
    .byte $1F ; |   XXXXX| $5F5C
    .byte $1F ; |   XXXXX| $5F5D
    .byte $0F ; |    XXXX| $5F5E
    .byte $0F ; |    XXXX| $5F5F
L5F60:
    .byte $0F ; |    XXXX| $5F60
    .byte $0F ; |    XXXX| $5F61
    .byte $07 ; |     XXX| $5F62
    .byte $07 ; |     XXX| $5F63
    .byte $07 ; |     XXX| $5F64
    .byte $03 ; |      XX| $5F65
    .byte $03 ; |      XX| $5F66
    .byte $03 ; |      XX| $5F67
    .byte $03 ; |      XX| $5F68
    .byte $01 ; |       X| $5F69
    .byte $01 ; |       X| $5F6A
    .byte $01 ; |       X| $5F6B
    .byte $FF ; |XXXXXXXX| $5F6C
    .byte $FF ; |XXXXXXXX| $5F6D
    .byte $FF ; |XXXXXXXX| $5F6E
    .byte $FF ; |XXXXXXXX| $5F6F
    .byte $FF ; |XXXXXXXX| $5F70
    .byte $FF ; |XXXXXXXX| $5F71
    .byte $FF ; |XXXXXXXX| $5F72
    .byte $FF ; |XXXXXXXX| $5F73
    .byte $FF ; |XXXXXXXX| $5F74
    .byte $FF ; |XXXXXXXX| $5F75
    .byte $FF ; |XXXXXXXX| $5F76
    .byte $FF ; |XXXXXXXX| $5F77
    .byte $FF ; |XXXXXXXX| $5F78
    .byte $FF ; |XXXXXXXX| $5F79
    .byte $FF ; |XXXXXXXX| $5F7A
    .byte $FF ; |XXXXXXXX| $5F7B
    .byte $FF ; |XXXXXXXX| $5F7C
    .byte $FF ; |XXXXXXXX| $5F7D
    .byte $FF ; |XXXXXXXX| $5F7E
    .byte $FF ; |XXXXXXXX| $5F7F
    .byte $FF ; |XXXXXXXX| $5F80
    .byte $FF ; |XXXXXXXX| $5F81
    .byte $FF ; |XXXXXXXX| $5F82
    .byte $FF ; |XXXXXXXX| $5F83
    .byte $FF ; |XXXXXXXX| $5F84
    .byte $FF ; |XXXXXXXX| $5F85
    .byte $3F ; |  XXXXXX| $5F86
    .byte $3F ; |  XXXXXX| $5F87
    .byte $3F ; |  XXXXXX| $5F88
    .byte $3F ; |  XXXXXX| $5F89
    .byte $3F ; |  XXXXXX| $5F8A
    .byte $3F ; |  XXXXXX| $5F8B
    .byte $3F ; |  XXXXXX| $5F8C
    .byte $3F ; |  XXXXXX| $5F8D
    .byte $3F ; |  XXXXXX| $5F8E
L5F8F:
    .byte $3F ; |  XXXXXX| $5F8F
    .byte $3F ; |  XXXXXX| $5F90
    .byte $3F ; |  XXXXXX| $5F91
    .byte $3F ; |  XXXXXX| $5F92
    .byte $3F ; |  XXXXXX| $5F93
    .byte $3F ; |  XXXXXX| $5F94
    .byte $3F ; |  XXXXXX| $5F95
    .byte $3F ; |  XXXXXX| $5F96
    .byte $3F ; |  XXXXXX| $5F97
    .byte $3F ; |  XXXXXX| $5F98
    .byte $0F ; |    XXXX| $5F99
    .byte $0F ; |    XXXX| $5F9A
    .byte $0F ; |    XXXX| $5F9B
    .byte $0F ; |    XXXX| $5F9C
    .byte $0F ; |    XXXX| $5F9D
    .byte $0F ; |    XXXX| $5F9E
    .byte $0F ; |    XXXX| $5F9F
    .byte $0F ; |    XXXX| $5FA0
    .byte $0F ; |    XXXX| $5FA1
    .byte $0F ; |    XXXX| $5FA2
    .byte $0F ; |    XXXX| $5FA3
    .byte $0F ; |    XXXX| $5FA4
L5FA5:
    .byte $00 ; |        | $5FA5
    .byte $18 ; |   XX   | $5FA6
    .byte $00 ; |        | $5FA7
    .byte $3C ; |  XXXX  | $5FA8
    .byte $00 ; |        | $5FA9
    .byte $00 ; |        | $5FAA
    .byte $00 ; |        | $5FAB
    .byte $7E ; | XXXXXX | $5FAC
    .byte $00 ; |        | $5FAD
    .byte $00 ; |        | $5FAE
    .byte $00 ; |        | $5FAF
    .byte $00 ; |        | $5FB0
    .byte $00 ; |        | $5FB1
    .byte $00 ; |        | $5FB2
    .byte $00 ; |        | $5FB3
    .byte $FF ; |XXXXXXXX| $5FB4
    .byte $7F ; | XXXXXXX| $5FB5
    .byte $FE ; |XXXXXXX | $5FB6
    .byte $FC ; |XXXXXX  | $5FB7
    .byte $FE ; |XXXXXXX | $5FB8
    .byte $FE ; |XXXXXXX | $5FB9
    .byte $FE ; |XXXXXXX | $5FBA
    .byte $6C ; | XX XX  | $5FBB
    .byte $FF ; |XXXXXXXX| $5FBC
    .byte $FF ; |XXXXXXXX| $5FBD
    .byte $FF ; |XXXXXXXX| $5FBE
    .byte $FF ; |XXXXXXXX| $5FBF
    .byte $FF ; |XXXXXXXX| $5FC0
    .byte $FF ; |XXXXXXXX| $5FC1
    .byte $FF ; |XXXXXXXX| $5FC2
    .byte $FF ; |XXXXXXXX| $5FC3
    .byte $FF ; |XXXXXXXX| $5FC4
    .byte $FF ; |XXXXXXXX| $5FC5
    .byte $FF ; |XXXXXXXX| $5FC6
    .byte $FF ; |XXXXXXXX| $5FC7
    .byte $FF ; |XXXXXXXX| $5FC8
    .byte $FF ; |XXXXXXXX| $5FC9
    .byte $FF ; |XXXXXXXX| $5FCA
    .byte $FF ; |XXXXXXXX| $5FCB
    .byte $FF ; |XXXXXXXX| $5FCC
    .byte $FF ; |XXXXXXXX| $5FCD
    .byte $FF ; |XXXXXXXX| $5FCE
    .byte $FF ; |XXXXXXXX| $5FCF
    .byte $FF ; |XXXXXXXX| $5FD0
    .byte $FF ; |XXXXXXXX| $5FD1
    .byte $FF ; |XXXXXXXX| $5FD2
    .byte $FF ; |XXXXXXXX| $5FD3
    .byte $FF ; |XXXXXXXX| $5FD4
    .byte $FF ; |XXXXXXXX| $5FD5
    .byte $FF ; |XXXXXXXX| $5FD6
    .byte $FF ; |XXXXXXXX| $5FD7
    .byte $FF ; |XXXXXXXX| $5FD8
    .byte $FF ; |XXXXXXXX| $5FD9
    .byte $FF ; |XXXXXXXX| $5FDA
    .byte $FF ; |XXXXXXXX| $5FDB
    .byte $FF ; |XXXXXXXX| $5FDC

START:
    lda    #0                    ; 2
    sta    $FFF9                 ; 4
    tay                          ; 2
    and    #$0F                  ; 2
    sta    $88                   ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    jmp    L5000                 ; 3
    nop                          ; 2
L5FEF:
    lda    #0                    ; 2
    sta    $FFF9                 ; 4
    sbc    #$0F                  ; 2
    iny                          ; 2
    eor    #$A0                  ; 2
L5FF9:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2

       ORG $1FFC
      RORG $5FFC

    .word START
    .byte $FF ; |XXXXXXXX| $5FFE
    .byte $FF ; |XXXXXXXX| $5FFF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SECOND BANK
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $2000
      RORG $5000

;labels changed from L5xxx to LFxxx to avoid repeat labels,
;both banks actually use $5xxx for addressing

START_2ND:
    ldx    #$FF                  ; 2
    txs                          ; 2
    ldx    #$29                  ; 2
    lda    #0                    ; 2
LF007:
    sta    0,X                   ; 4
    dex                          ; 2
    bpl    LF007                 ; 2³

    jsr    LFE18                 ; 6
    lda    #$46                  ; 2
    sta    $BB                   ; 3
    lda    #2                    ; 2
    sta    $B6                   ; 3
    lda    #8                    ; 2
    sta    $B5                   ; 3
    lda    #$82                  ; 2
    sta    $83                   ; 3
LF01F:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #2                    ; 2
    sta    VBLANK                ; 3
    lda    #$E8                  ; 2
    sta    TIM8T                 ; 4
    jsr    LFDC3                 ; 6
    lda    $FF                   ; 3
    cmp    #$B5                  ; 2
    bne    LF042                 ; 2³
    lda    SWCHB                 ; 4
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    and    #$03                  ; 2
    cmp    #3                    ; 2
    beq    LF042                 ; 2³
    jmp    LF15C                 ; 3

LF042:
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    beq    START_2ND             ; 2³
    lda    $B2                   ; 3
    and    #$08                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $88                   ; 3
    lda    $AC                   ; 3
    bpl    LF05C                 ; 2³
    lda    $88                   ; 3
    bne    LF0AE                 ; 2³
    beq    LF06C                 ; 3   always branch

LF05C:
    lda    $AA                   ; 3
    bpl    LF066                 ; 2³
    lda    #0                    ; 2
    sta    $AA                   ; 3
    sta    $AB                   ; 3
LF066:
    lda    $AC                   ; 3
    bne    LF06E                 ; 2³
    lda    $88                   ; 3
LF06C:
    beq    LF0E7                 ; 2³
LF06E:
    inc    $AC                   ; 5
    lda    $AC                   ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    cpy    #4                    ; 2
    bne    LF07F                 ; 2³
    lda    $88                   ; 3
    ora    $AC                   ; 3
    sta    $AC                   ; 3
LF07F:
    lda    $88                   ; 3
    bne    LF0CD                 ; 2³
    cpy    #2                    ; 2
    bcc    LF0E5                 ; 2³
    cpy    #9                    ; 2
    bcs    LF0B1                 ; 2³
    lda    #$10                  ; 2
    ora    $AC                   ; 3
    sta    $AC                   ; 3
    lda    $AA                   ; 3
    cmp    #8                    ; 2
    bne    LF0EF                 ; 2³
LF097:
    lda    $AC                   ; 3
    and    #$40                  ; 2
    cmp    #$40                  ; 2
    ldx    $AA                   ; 3
    rol    $AB                   ; 5
    rol    $AA                   ; 5
    inx                          ; 2
    cpx    #9                    ; 2
    beq    LF0C8                 ; 2³
    stx    $AA                   ; 3
    lda    #1                    ; 2
    sta    $AC                   ; 3
LF0AE:
    jmp    LF0EF                 ; 3

LF0B1:
    cpy    #$0F                  ; 2
    beq    LF0E5                 ; 2³
    lda    $AC                   ; 3
    and    #$10                  ; 2
    bne    LF0E5                 ; 2³
    lda    #$40                  ; 2
LF0BD:
    ora    #$80                  ; 2
    sta    $AA                   ; 3
    lda    #0                    ; 2
    sta    $AC                   ; 3
    jmp    LF0EF                 ; 3

LF0C8:
    lda    $AA                   ; 3
    jmp    LF0BD                 ; 3

LF0CD:
    lda    $AC                   ; 3
    and    #$10                  ; 2
    beq    LF0D9                 ; 2³
    cpy    #5                    ; 2
    bcc    LF0E5                 ; 2³
    bcs    LF097                 ; 3   always branch

LF0D9:
    cpy    #$0F                  ; 2
    beq    LF0E5                 ; 2³
    cpy    #8                    ; 2
    bne    LF0EF                 ; 2³
    lda    $AA                   ; 3
    beq    LF0EF                 ; 2³
LF0E5:
    lda    #$80                  ; 2
LF0E7:
    sta    $AC                   ; 3
    lda    #0                    ; 2
    sta    $AA                   ; 3
    sta    $AB                   ; 3
LF0EF:
    lda    $AA                   ; 3
    and    #$C0                  ; 2
    beq    LF159                 ; 2³+1
    cmp    #$C0                  ; 2
    bne    LF104                 ; 2³+1
    lda    $82                   ; 3
    bmi    LF159                 ; 2³+1
    lda    #$1E                  ; 2
    sta    $81                   ; 3
    jmp    LF159                 ; 3

LF104:
    lda    $AB                   ; 3
    and    #$3F                  ; 2
    tax                          ; 2
    lda    $AB                   ; 3
    and    #$C0                  ; 2
    cmp    #$40                  ; 2
    bne    LF11C                 ; 2³
    ldy    #$66                  ; 2
    cpx    #4                    ; 2
    bne    LF149                 ; 2³
    stx    $98                   ; 3
    jmp    LF159                 ; 3

LF11C:
    cmp    #0                    ; 2
    bne    LF147                 ; 2³
    lda    $98                   ; 3
    beq    LF147                 ; 2³
    ldy    #$66                  ; 2
    txa                          ; 2
    bmi    LF149                 ; 2³
    cmp    #3                    ; 2
    bcs    LF149                 ; 2³
    tay                          ; 2
LF12E:
    jsr    LFE18                 ; 6
    sty    $82                   ; 3
    lda    LFF33,Y               ; 4
    sta    $84                   ; 3
    lda    LFF36,Y               ; 4
    sta    $83                   ; 3
    lda    #1                    ; 2
    sta    $A8                   ; 3
    sta    SWCHA                 ; 4
    jmp    LF159                 ; 3

LF147:
    ldy    #$14                  ; 2
LF149:
    jsr    LFE18                 ; 6
    sty    $9B                   ; 3
    lda    #0                    ; 2
    sta    AUDC0                 ; 3
    sta    AUDC1                 ; 3
    lda    #3                    ; 2
    sta    SWCHA                 ; 4
LF159:
    jmp    LF168                 ; 3

LF15C:
    tay                          ; 2
    lda    $82                   ; 3
    bpl    LF168                 ; 2³
    lda    #4                    ; 2
    sta    $98                   ; 3
    jmp    LF12E                 ; 3

LF168:
    lda    $82                   ; 3
    bpl    LF16F                 ; 2³
    jmp    LF85B                 ; 3

LF16F:
    lda    $97                   ; 3
    beq    LF178                 ; 2³
    lda    #$0F                  ; 2
    jmp    LF19C                 ; 3

LF178:
    lda    SWCHA                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    #$0F                  ; 2
    beq    LF19C                 ; 2³
    cmp    $85                   ; 3
    beq    LF1A0                 ; 2³
    cmp    $86                   ; 3
    beq    LF198                 ; 2³
    sta    $86                   ; 3
    inc    $FE                   ; 5
    lda    #2                    ; 2
    sta    $87                   ; 3
    sta    $B1                   ; 3
    jmp    LF1A0                 ; 3

LF198:
    dec    $87                   ; 5
    bne    LF1A0                 ; 2³
LF19C:
    sta    $85                   ; 3
    sta    $86                   ; 3
LF1A0:
    ldx    $82                   ; 3
    cpx    #1                    ; 2
    beq    LF1AA                 ; 2³
    lda    #0                    ; 2
    sta    $A4                   ; 3
LF1AA:
    lda    $83                   ; 3
    sec                          ; 2
    sbc    $A4                   ; 3
    sec                          ; 2
    sbc    $84                   ; 3
    bcc    LF1C6                 ; 2³
    cmp    LFEE2,X               ; 4
    bcc    LF1D2                 ; 2³
    lsr    $80                   ; 5
    inc    $91                   ; 5
    lda    $84                   ; 3
    clc                          ; 2
    adc    LFEE2,X               ; 4
    jmp    LF1D0                 ; 3

LF1C6:
    asl    $80                   ; 5
    dec    $91                   ; 5
    lda    $84                   ; 3
    sec                          ; 2
    sbc    LFEE2,X               ; 4
LF1D0:
    sta    $84                   ; 3
LF1D2:
    lda    $82                   ; 3
    cmp    #0                    ; 2
    beq    LF1DB                 ; 2³
    jmp    LF4B2                 ; 3

LF1DB:
    lda    $A8                   ; 3
    beq    LF1EB                 ; 2³
    ldx    #4                    ; 2
LF1E1:
    lda    LFF38,X               ; 4
    sta    $B4,X                 ; 4
    dex                          ; 2
    bne    LF1E1                 ; 2³
    stx    $A8                   ; 3
LF1EB:
    lda    #3                    ; 2
    sta    $A0                   ; 3
    lda    $97                   ; 3
    beq    LF262                 ; 2³+1
    bmi    LF239                 ; 2³+1
    lda    $83                   ; 3
    cmp    #$48                  ; 2
    beq    LF208                 ; 2³+1
    bcs    LF201                 ; 2³+1
    lda    #7                    ; 2
    bne    LF203                 ; 3   always branch

LF201:
    lda    #$0B                  ; 2
LF203:
    sta    $85                   ; 3
    jmp    LF262                 ; 3

LF208:
    lda    $B6                   ; 3
    cmp    #$36                  ; 2
    bne    LF262                 ; 2³
    lda    #2                    ; 2
    sta    $B8                   ; 3
    lda    #$FF                  ; 2
    sta    $97                   ; 3
    ldx    #0                    ; 2
    jsr    LFD95                 ; 6
    lda    #8                    ; 2
    jsr    LFD9E                 ; 6
    lda    #$0A                  ; 2
    ldx    #2                    ; 2
    jsr    LFD9E                 ; 6
    lda    #3                    ; 2
    ldx    #4                    ; 2
    jsr    LFD9E                 ; 6
    lda    #8                    ; 2
    sta    $8B                   ; 3
    lda    $CC                   ; 3
    sta    $DB                   ; 3
    jmp    LF262                 ; 3

LF239:
    lda    $DB                   ; 3
    beq    LF241                 ; 2³
    sta    $E1                   ; 3
    bne    LF262                 ; 2³
LF241:
    sta    $97                   ; 3
    lda    #$35                  ; 2
    sta    $B8                   ; 3
    ldx    #0                    ; 2
    jsr    LFDB0                 ; 6
    lda    $A5                   ; 3
    bmi    LF262                 ; 2³
    lda    #1                    ; 2
    sta    SWCHA                 ; 4
    sta    $99                   ; 3
    sta    $9C                   ; 3
    sed                          ; 2
    lda    $92                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    sta    $92                   ; 3
    cld                          ; 2
LF262:
    lda    $97                   ; 3
    ora    $99                   ; 3
    bne    LF2CB                 ; 2³
    lda    #$2C                  ; 2
    cmp    $E1                   ; 3
    beq    LF2CB                 ; 2³
    sta    $E1                   ; 3
    lda    $A5                   ; 3
    bmi    LF285                 ; 2³
    ldx    $E3                   ; 3
    cpx    #$13                  ; 2
    beq    LF27D                 ; 2³
    inx                          ; 2
    stx    $E3                   ; 3
LF27D:
    ldy    LFF5E,X               ; 4
    beq    LF285                 ; 2³
    iny                          ; 2
    bne    LF2BC                 ; 2³
LF285:
    ldx    #$0C                  ; 2
    jsr    LFDDA                 ; 6
    cpy    $E4                   ; 3
    bne    LF295                 ; 2³
    iny                          ; 2
    cpy    #$0C                  ; 2
    bne    LF295                 ; 2³
    ldy    #0                    ; 2
LF295:
    sty    $E4                   ; 3
    lda    $A5                   ; 3
    bmi    LF2A2                 ; 2³
    ldx    $E3                   ; 3
    lda    LFF5E,X               ; 4
    beq    LF2AF                 ; 2³
LF2A2:
    jsr    LFDC3                 ; 6
    jsr    LFDC3                 ; 6
    ldx    #4                    ; 2
    jsr    LFDDA                 ; 6
    tya                          ; 2
    asl                          ; 2
LF2AF:
    ldy    $E4                   ; 3
    clc                          ; 2
    adc    LFF45,Y               ; 4
    tay                          ; 2
    and    #$0F                  ; 2
    bne    LF2BC                 ; 2³
    ldy    #$0E                  ; 2
LF2BC:
    sty    $E2                   ; 3
    lda    $A5                   ; 3
    bmi    LF2CB                 ; 2³
    lda    #1                    ; 2
    sta    SWCHA                 ; 4
    sta    $99                   ; 3
    sta    $9C                   ; 3
LF2CB:
    lda    $83                   ; 3
    sec                          ; 2
    sbc    $84                   ; 3
    bcc    LF2E0                 ; 2³
    cmp    #$20                  ; 2
    bcc    LF2E8                 ; 2³
    inc    $91                   ; 5
    lda    $84                   ; 3
    clc                          ; 2
    adc    #$20                  ; 2
    jmp    LF2E6                 ; 3

LF2E0:
    dec    $91                   ; 5
    lda    $84                   ; 3
    sbc    #$1F                  ; 2
LF2E6:
    sta    $84                   ; 3
LF2E8:
    lda    $D7                   ; 3
    bne    LF309                 ; 2³+1
    ldx    $91                   ; 3
    lda    LFF41,X               ; 4
    cmp    $B6                   ; 3
    beq    LF2FE                 ; 2³
    sta    $DC                   ; 3
    bmi    LF305                 ; 2³+1
    inc    $B6                   ; 5
    jmp    LF307                 ; 3

LF2FE:
    lda    #0                    ; 2
    sta    $DC                   ; 3
    jmp    LF307                 ; 3

LF305:
    dec    $B6                   ; 5
LF307:
    stx    $C9                   ; 3
LF309:
    ldx    #2                    ; 2
    lda    #0                    ; 2
    clc                          ; 2
LF30E:
    adc    $D1,X                 ; 4
    dex                          ; 2
    bpl    LF30E                 ; 2³
    sta    $CC                   ; 3
    clc                          ; 2
    lda    $D4                   ; 3
    adc    $CC                   ; 3
    cmp    #$2D                  ; 2
    bcc    LF325                 ; 2³
    lda    #0                    ; 2
    sta    $CB                   ; 3
    jmp    LF3BB                 ; 3

LF325:
    lda    $D2                   ; 3
    beq    LF335                 ; 2³
    lda    $D1                   ; 3
    beq    LF34B                 ; 2³
    lda    $D3                   ; 3
    beq    LF35D                 ; 2³
    ldx    #$12                  ; 2
    bne    LF387                 ; 3   always branch

LF335:
    lda    $D3                   ; 3
    beq    LF36D                 ; 2³
    lda    $D1                   ; 3
    beq    LF375                 ; 2³
    cmp    $D3                   ; 3
    bcc    LF345                 ; 2³
    ldx    #4                    ; 2
    bne    LF38B                 ; 3   always branch

LF345:
    lda    $D3                   ; 3
    ldx    #$10                  ; 2
    bne    LF38B                 ; 3   always branch

LF34B:
    lda    $D3                   ; 3
    beq    LF379                 ; 2³
    cmp    $D2                   ; 3
    bcc    LF357                 ; 2³
    ldx    #8                    ; 2
    bne    LF38B                 ; 3   always branch

LF357:
    lda    $D2                   ; 3
    ldx    #$0C                  ; 2
    bne    LF38B                 ; 3   always branch

LF35D:
    lda    $D2                   ; 3
    cmp    $D1                   ; 3
    bcc    LF367                 ; 2³
    ldx    #0                    ; 2
    bne    LF38B                 ; 2³   never branches...mistake?
LF367:
    lda    $D1                   ; 3
    ldx    #$14                  ; 2
    bne    LF38B                 ; 3   always branch

LF36D:
    lda    $D1                   ; 3
    beq    LF37D                 ; 2³
    ldx    #$74                  ; 2
    bne    LF387                 ; 3   always branch

LF375:
    ldx    #$18                  ; 2
    bne    LF387                 ; 3   always branch

LF379:
    ldx    #$34                  ; 2
    bne    LF387                 ; 3   always branch

LF37D:
    lda    $D4                   ; 3
    beq    LF385                 ; 2³
    ldx    #$0E                  ; 2
    bne    LF387                 ; 3   always branch

LF385:
    ldx    #6                    ; 2
LF387:
    stx    $CB                   ; 3
    bne    LF394                 ; 3   always branch

LF38B:
    jsr    LFE4A                 ; 6
    lda    LFF45,X               ; 4
    sta    $CB                   ; 3
    tax                          ; 2
LF394:
    lda    $D4                   ; 3
    beq    LF3BB                 ; 2³
    clc                          ; 2
    adc    $CC                   ; 3
    sta    $CC                   ; 3
    cpx    #$0E                  ; 2
    beq    LF3BB                 ; 2³
    lda    $D4                   ; 3
    ldx    #0                    ; 2
    jsr    LFE4A                 ; 6
    stx    $88                   ; 3
    lda    #4                    ; 2
    sec                          ; 2
    sbc    $88                   ; 3
    asl                          ; 2
    adc    $CB                   ; 3
    tay                          ; 2
    and    #$0F                  ; 2
    bne    LF3B9                 ; 2³
    ldy    #$0E                  ; 2
LF3B9:
    sty    $CB                   ; 3
LF3BB:
    lda    #2                    ; 2
    sta    $A0                   ; 3
    lda    $DA                   ; 3
    ora    $99                   ; 3
    ora    $DB                   ; 3
    ora    $DC                   ; 3
    bne    LF423                 ; 2³+1
    lda    $85                   ; 3
    cmp    #$0D                  ; 2
    bne    LF412                 ; 2³+1
    lda    $D7                   ; 3
    bmi    LF423                 ; 2³+1
    bne    LF3FD                 ; 2³
    lda    $CC                   ; 3
    cmp    #$2C                  ; 2
    beq    LF423                 ; 2³+1
    lda    #6                    ; 2
    sta    $D8                   ; 3
    inc    $D9                   ; 5
    inc    $D7                   ; 5
    ldx    #0                    ; 2
    jsr    LFD95                 ; 6
    lda    #8                    ; 2
    ldx    #0                    ; 2
    jsr    LFD9E                 ; 6
    lda    #$1F                  ; 2
    ldx    #2                    ; 2
    jsr    LFD9E                 ; 6
    lda    #2                    ; 2
    ldx    #4                    ; 2
    jsr    LFD9E                 ; 6
LF3FD:
    dec    $D8                   ; 5
    bpl    LF423                 ; 2³
    inc    $D9                   ; 5
    lda    #6                    ; 2
    sta    $D8                   ; 3
    ldx    #$2C                  ; 2
    cpx    $D9                   ; 3
    bcs    LF423                 ; 2³
    inc    $DA                   ; 5
    jmp    LF41A                 ; 3

LF412:
    lda    $D7                   ; 3
    beq    LF423                 ; 2³
    lda    $D8                   ; 3
    bne    LF3FD                 ; 2³+1
LF41A:
    lda    #$FF                  ; 2
    sta    $D7                   ; 3
    ldx    #0                    ; 2
    jsr    LFDB0                 ; 6
LF423:
    lda    $D7                   ; 3
    beq    LF460                 ; 2³
    bpl    LF432                 ; 2³
    ldx    $CC                   ; 3
    inx                          ; 2
    cpx    $B7                   ; 3
    bcs    LF454                 ; 2³
    dec    $B7                   ; 5
LF432:
    ldx    $CC                   ; 3
    inx                          ; 2
    dec    $B8                   ; 5
    cpx    $B8                   ; 3
    bcc    LF460                 ; 2³
    stx    $B8                   ; 3
    lda    $DD                   ; 3
    bne    LF443                 ; 2³
    dec    $DD                   ; 5
LF443:
    dec    $CA                   ; 5
    bpl    LF460                 ; 2³
    lda    #5                    ; 2
    sta    $CA                   ; 3
    inc    $B8                   ; 5
    ldx    $C9                   ; 3
    inc    $D1,X                 ; 6
    jmp    LF460                 ; 3

LF454:
    lda    #$35                  ; 2
    sta    $B7                   ; 3
    sta    $B8                   ; 3
    lda    #0                    ; 2
    sta    $D7                   ; 3
    sta    $CA                   ; 3
LF460:
    lda    $D7                   ; 3
    ora    $97                   ; 3
    bne    LF476                 ; 2³
    lda    $CC                   ; 3
    cmp    #$2C                  ; 2
    bne    LF476                 ; 2³
    lda    $E2                   ; 3
    and    #$FE                  ; 2
    cmp    $CB                   ; 3
    bne    LF476                 ; 2³
    inc    $97                   ; 5
LF476:
    ldx    $DB                   ; 3
    bne    LF48A                 ; 2³
    lda    $D7                   ; 3
    bne    LF4B2                 ; 2³
    lda    INPT4                 ; 3
    and    #$80                  ; 2
    ora    $97                   ; 3
    bne    LF4B2                 ; 2³
    ldx    $CC                   ; 3
    beq    LF4B2                 ; 2³
LF48A:
    dec    $B5                   ; 5
    bne    LF493                 ; 2³
    lda    #3                    ; 2
    sta    $B5                   ; 3
    dex                          ; 2
LF493:
    stx    $DB                   ; 3
    stx    $CC                   ; 3
    bne    LF4B2                 ; 2³
    lda    #0                    ; 2
    sta    $D2                   ; 3
    sta    $D1                   ; 3
    sta    $D4                   ; 3
    sta    $D3                   ; 3
    sta    $DA                   ; 3
    sta    $D9                   ; 3
    sta    $DD                   ; 3
    lda    #1                    ; 2
    sta    $A0                   ; 3
    ldx    #1                    ; 2
    jsr    LFDB0                 ; 6
LF4B2:
    lda    $82                   ; 3
    cmp    #1                    ; 2
    beq    LF4BB                 ; 2³
    jmp    LF775                 ; 3

LF4BB:
    lda    $A8                   ; 3
    beq    LF4CB                 ; 2³
    ldx    #$15                  ; 2
LF4C1:
    lda    LFF72,X               ; 4
    sta    $B3,X                 ; 4
    dex                          ; 2
    bne    LF4C1                 ; 2³
    stx    $A8                   ; 3
LF4CB:
    ldy    $D1                   ; 3
    bne    LF4DD                 ; 2³
    ldy    $D2                   ; 3
    bne    LF4DD                 ; 2³
    lda    $85                   ; 3
    cmp    #$0E                  ; 2
    beq    LF4E0                 ; 2³
    cmp    #$0D                  ; 2
    beq    LF500                 ; 2³+1
LF4DD:
    jmp    LF534                 ; 3

LF4E0:
    lda    $D3                   ; 3
    beq    LF539                 ; 2³+1
    ldx    #7                    ; 2
LF4E6:
    lda    $BD,X                 ; 4
    and    $80                   ; 3
    bne    LF4F2                 ; 2³
    dex                          ; 2
    bpl    LF4E6                 ; 2³
    jmp    LF539                 ; 3

LF4F2:
    tay                          ; 2
    ora    $BE,X                 ; 4
    sta    $BE,X                 ; 4
    tya                          ; 2
    eor    $BD,X                 ; 4
    sta    $BD,X                 ; 4
    inx                          ; 2
    jmp    LF51D                 ; 3

LF500:
    lda    $D3                   ; 3
    beq    LF539                 ; 2³
    ldx    #8                    ; 2
LF506:
    lda    $BD,X                 ; 4
    and    $80                   ; 3
    bne    LF512                 ; 2³
    dex                          ; 2
    bne    LF506                 ; 2³
    jmp    LF539                 ; 3

LF512:
    tay                          ; 2
    ora    $BC,X                 ; 4
    sta    $BC,X                 ; 4
    tya                          ; 2
    eor    $BD,X                 ; 4
    sta    $BD,X                 ; 4
    dex                          ; 2
LF51D:
    cpx    #0                    ; 2
    beq    LF52D                 ; 2³
    txa                          ; 2
    ora    #$80                  ; 2
    sta    $D4                   ; 3
    lda    #0                    ; 2
    sta    $D3                   ; 3
    jmp    LF539                 ; 3

LF52D:
    lda    #1                    ; 2
    sta    $D5                   ; 3
    jmp    LF539                 ; 3

LF534:
    sta    $D3                   ; 3
    jmp    LF53D                 ; 3

LF539:
    lda    #0                    ; 2
    sta    $8C                   ; 3
LF53D:
    lda    $A3                   ; 3
    bne    LF549                 ; 2³
    lda    $D2                   ; 3
    beq    LF549                 ; 2³
    dec    $D2                   ; 5
    beq    LF55D                 ; 2³
LF549:
    lda    $D7                   ; 3
    bne    LF565                 ; 2³
    lda    $D1                   ; 3
    bne    LF577                 ; 2³
    lda    $A5                   ; 3
    bpl    LF574                 ; 2³
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    jmp    LF574                 ; 3

LF55D:
    lda    #7                    ; 2
    sta    $D8                   ; 3
    lda    #$20                  ; 2
    sta    $D7                   ; 3
LF565:
    sta    $D1                   ; 3
    jsr    LFE66                 ; 6
    bpl    LF574                 ; 2³
    lda    #7                    ; 2
    sta    $D8                   ; 3
    lsr    $D7                   ; 5
    lsr    $D1                   ; 5
LF574:
    jmp    LF580                 ; 3

LF577:
    jsr    LFE66                 ; 6
    bpl    LF580                 ; 2³
    lda    #0                    ; 2
    sta    $D1                   ; 3
LF580:
    lda    $C8                   ; 3
    beq    LF594                 ; 2³
    ldx    #5                    ; 2
LF586:
    lda    $E8,X                 ; 4
    sta    $E9,X                 ; 4
    dex                          ; 2
    bne    LF586                 ; 2³
    ldx    #8                    ; 2
    jsr    LFDDA                 ; 6
    sty    $E9                   ; 3
LF594:
    lda    $A3                   ; 3
    bne    LF5DC                 ; 2³
    ldy    #0                    ; 2
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    bne    LF5DF                 ; 2³
    iny                          ; 2
    lda    $AD                   ; 3
    ora    $99                   ; 3
    bne    LF5DF                 ; 2³
    sty    $AD                   ; 3
    lda    $A5                   ; 3
    bpl    LF5D2                 ; 2³
    inc    $A5                   ; 5
    lda    $C6                   ; 3
    bpl    LF5C0                 ; 2³
    ldx    #8                    ; 2
    lda    #0                    ; 2
LF5B8:
    sta    $BD,X                 ; 4
    dex                          ; 2
    bpl    LF5B8                 ; 2³
    jmp    LF5E1                 ; 3

LF5C0:
    lda    $C8                   ; 3
    beq    LF5CF                 ; 2³
    lda    $C7                   ; 3
    sec                          ; 2
    sbc    #6                    ; 2
    sta    $C7                   ; 3
    bcs    LF5CF                 ; 2³
    dec    $C8                   ; 5
LF5CF:
    jmp    LF604                 ; 3

LF5D2:
    lda    $A3                   ; 3
    bne    LF5E1                 ; 2³
    dec    $A5                   ; 5
    lda    #1                    ; 2
    sta    $D2                   ; 3
LF5DC:
    jmp    LF677                 ; 3

LF5DF:
    sty    $AD                   ; 3
LF5E1:
    lda    $A5                   ; 3
    bmi    LF5DC                 ; 2³
    lda    $9A                   ; 3
    cmp    #$78                  ; 2
    beq    LF5DC                 ; 2³
    lda    $AA                   ; 3
    and    #$C0                  ; 2
    cmp    #$C0                  ; 2
    bne    LF5DC                 ; 2³
    lda    $C8                   ; 3
    bne    LF604                 ; 2³+1
    lda    $EF                   ; 3
    sec                          ; 2
    sbc    #5                    ; 2
    sta    $C7                   ; 3
    lda    $F0                   ; 3
    sbc    #0                    ; 2
    sta    $C8                   ; 3
LF604:
    lda    #$1E                  ; 2
    sta    $81                   ; 3
    ldx    #8                    ; 2
    lda    #0                    ; 2
LF60C:
    sta    $BD,X                 ; 4
    dex                          ; 2
    bpl    LF60C                 ; 2³
    lda    $C8                   ; 3
    beq    LF624                 ; 2³
    lda    #0                    ; 2
    sta    $D6                   ; 3
    lda    $C7                   ; 3
    clc                          ; 2
    adc    #6                    ; 2
    sta    $C7                   ; 3
    bcc    LF624                 ; 2³
    inc    $C8                   ; 5
LF624:
    ldy    #1                    ; 2
    lda    ($C7),Y               ; 5
    bpl    LF663                 ; 2³
    cmp    #$80                  ; 2
    bne    LF63D                 ; 2³
    lda    #$FF                  ; 2
    sta    $81                   ; 3
    sta    $DA                   ; 3
    inc    $C7                   ; 5
    bne    LF663                 ; 2³
    inc    $C8                   ; 5
    jmp    LF663                 ; 3

LF63D:
    cmp    #$9F                  ; 2
    bcs    LF645                 ; 2³
    ldy    #1                    ; 2
    sty    $D6                   ; 3
LF645:
    cmp    #$AF                  ; 2
    bcs    LF660                 ; 2³
    and    #$0F                  ; 2
    sta    $F1                   ; 3
    lda    $C7                   ; 3
    sta    $EF                   ; 3
    lda    $C8                   ; 3
    sta    $F0                   ; 3
    lda    #$E8                  ; 2
    sta    $C7                   ; 3
    lda    #0                    ; 2
    sta    $C8                   ; 3
    jmp    LF663                 ; 3

LF660:
    jmp    LF147                 ; 3

LF663:
    lda    #6                    ; 2
    sta    $C6                   ; 3
    lda    $D6                   ; 3
    beq    LF670                 ; 2³
    lda    #1                    ; 2
    jmp    LF672                 ; 3

LF670:
    lda    #$78                  ; 2
LF672:
    sta    $D2                   ; 3
    jmp    LF6A0                 ; 3

LF677:
    lda    $C8                   ; 3
    bne    LF68B                 ; 2³
    lda    $F1                   ; 3
    cmp    #6                    ; 2
    beq    LF68B                 ; 2³
    ldy    #0                    ; 2
    sty    $E9                   ; 3
    cmp    #5                    ; 2
    beq    LF68B                 ; 2³
    sty    $EA                   ; 3
LF68B:
    lda    $A3                   ; 3
    bne    LF6BB                 ; 2³
    lda    $D2                   ; 3
    bne    LF69D                 ; 2³
    lda    $9C                   ; 3
    bne    LF69D                 ; 2³
    lda    INPT4                 ; 3
    and    #$80                  ; 2
    beq    LF6A0                 ; 2³
LF69D:
    jmp    LF762                 ; 3

LF6A0:
    lda    #$40                  ; 2
    sta    $A3                   ; 3
    lda    #6                    ; 2
    sta    $DB                   ; 3
    lda    #0                    ; 2
    sta    $DC                   ; 3
    sta    $A9                   ; 3
    lda    #$FF                  ; 2
    sta    $A0                   ; 3
    ldx    #0                    ; 2
    jsr    LFDB0                 ; 6
    inx                          ; 2
    jsr    LFDB0                 ; 6
LF6BB:
    dec    $DC                   ; 5
    bpl    LF6C3                 ; 2³
    lsr    $A3                   ; 5
    bne    LF6C6                 ; 2³
LF6C3:
    jmp    LF762                 ; 3

LF6C6:
    ldy    $C6                   ; 3
    bmi    LF6ED                 ; 2³
    beq    LF6ED                 ; 2³
    lda    ($C7),Y               ; 5
    dec    $C6                   ; 5
    tax                          ; 2
    beq    LF71F                 ; 2³+1
    lda    $D6                   ; 3
    beq    LF6E0                 ; 2³
    lda    $BD                   ; 3
    ora    $A3                   ; 3
    sta    $BD                   ; 3
    jmp    LF6E6                 ; 3

LF6E0:
    lda    $BD,X                 ; 4
    ora    $A3                   ; 3
    sta    $BD,X                 ; 4
LF6E6:
    lda    #1                    ; 2
    sta    $A9                   ; 3
    jmp    LF71A                 ; 3

LF6ED:
    ldx    #8                    ; 2
LF6EF:
    lda    $BD,X                 ; 4
    and    $A3                   ; 3
    bne    LF703                 ; 2³+1
    dex                          ; 2
    bne    LF6EF                 ; 2³
    ldy    $DB                   ; 3
    lda    ($C7),Y               ; 5
    beq    LF71F                 ; 2³+1
    sta    $A9                   ; 3
    jmp    LF71F                 ; 3

LF703:
    lda    $A5                   ; 3
    bmi    LF71A                 ; 2³
    ldy    $DB                   ; 3
    txa                          ; 2
    cmp    ($C7),Y               ; 5
    beq    LF71A                 ; 2³
    lda    #7                    ; 2
    sta    $D8                   ; 3
    lda    $A3                   ; 3
    sta    $D1                   ; 3
    lda    #1                    ; 2
    sta    $A9                   ; 3
LF71A:
    txa                          ; 2
    ora    #$80                  ; 2
    sta    $DD                   ; 3
LF71F:
    lda    #$28                  ; 2
    sta    $DC                   ; 3
    dec    $DB                   ; 5
    beq    LF748                 ; 2³
    lda    $D2                   ; 3
    bne    LF762                 ; 2³
    ldy    $DB                   ; 3
LF72D:
    ldx    #7                    ; 2
LF72F:
    lda    LFF97,Y               ; 4
    and    $BE,X                 ; 4
    bne    LF762                 ; 2³
    dex                          ; 2
    bpl    LF72F                 ; 2³
    lda    ($C7),Y               ; 5
    beq    LF73F                 ; 2³
    sta    $A9                   ; 3
LF73F:
    dey                          ; 2
    bne    LF72D                 ; 2³
    sty    $DB                   ; 3
    lda    #1                    ; 2
    sta    $A3                   ; 3
LF748:
    lda    $A5                   ; 3
    bmi    LF762                 ; 2³
    lda    $A9                   ; 3
    bne    LF762                 ; 2³
    lda    #1                    ; 2
    sta    SWCHA                 ; 4
    sta    $99                   ; 3
    sta    $9C                   ; 3
    sed                          ; 2
    lda    $92                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    sta    $92                   ; 3
    cld                          ; 2
LF762:
    ldx    #0                    ; 2
    lda    $A3                   ; 3
    ora    $DD                   ; 3
    beq    LF76F                 ; 2³
    stx    $D4                   ; 3
    jmp    LF773                 ; 3

LF76F:
    lda    $D4                   ; 3
    beq    LF775                 ; 2³
LF773:
    stx    $9D                   ; 3
LF775:
    lda    $82                   ; 3
    cmp    #2                    ; 2
    beq    LF77E                 ; 2³
    jmp    LF85B                 ; 3

LF77E:
    lda    $A8                   ; 3
    beq    LF78E                 ; 2³
    ldx    #$0D                  ; 2
LF784:
    lda    LFF9D,X               ; 4
    sta    $B4,X                 ; 4
    dex                          ; 2
    bne    LF784                 ; 2³
    stx    $A8                   ; 3
LF78E:
    lda    $E6                   ; 3
    beq    LF7C9                 ; 2³
    ldy    #3                    ; 2
    sty    $A0                   ; 3
    cmp    #$15                  ; 2
    bne    LF7AE                 ; 2³
    ldx    #1                    ; 2
    jsr    LFD95                 ; 6
    lda    #4                    ; 2
    jsr    LFD9E                 ; 6
    lda    #7                    ; 2
    ldx    #5                    ; 2
    jsr    LFD9E                 ; 6
    jmp    LF7B2                 ; 3

LF7AE:
    dec    $E7                   ; 5
    bpl    LF7C9                 ; 2³
LF7B2:
    lda    #$1E                  ; 2
    sec                          ; 2
    sbc    $E6                   ; 3
    ldx    #3                    ; 2
    jsr    LFD9E                 ; 6
    lda    #1                    ; 2
    sta    $E7                   ; 3
    dec    $E6                   ; 5
    bne    LF7C9                 ; 2³
    ldx    #1                    ; 2
    jsr    LFDB0                 ; 6
LF7C9:
    lda    $E8                   ; 3
    beq    LF7F2                 ; 2³
    ldx    #1                    ; 2
    stx    $A0                   ; 3
    ldx    #1                    ; 2
    jsr    LFD95                 ; 6
    lda    #1                    ; 2
    jsr    LFD9E                 ; 6
    lda    #0                    ; 2
    ldx    #3                    ; 2
    jsr    LFD9E                 ; 6
    lda    #8                    ; 2
    ldx    #5                    ; 2
    jsr    LFD9E                 ; 6
    dec    $E8                   ; 5
    bne    LF7F2                 ; 2³
    ldx    #1                    ; 2
    jsr    LFDB0                 ; 6
LF7F2:
    lda    $E9                   ; 3
    beq    LF82D                 ; 2³+1
    ldx    #4                    ; 2
    stx    $A0                   ; 3
    cmp    #5                    ; 2
    bne    LF812                 ; 2³+1
    ldx    #0                    ; 2
    jsr    LFD95                 ; 6
    lda    #4                    ; 2
    jsr    LFD9E                 ; 6
    lda    #$0B                  ; 2
    ldx    #4                    ; 2
    jsr    LFD9E                 ; 6
    jmp    LF816                 ; 3

LF812:
    dec    $EA                   ; 5
    bpl    LF82D                 ; 2³
LF816:
    ldx    $E9                   ; 3
    lda    LFFDC,X               ; 4
    ldx    #2                    ; 2
    jsr    LFD9E                 ; 6
    lda    #7                    ; 2
    sta    $EA                   ; 3
    dec    $E9                   ; 5
    bne    LF82D                 ; 2³
    ldx    #0                    ; 2
    jsr    LFDB0                 ; 6
LF82D:
    lda    $EB                   ; 3
    beq    LF85B                 ; 2³
    ldy    #1                    ; 2
    sty    $A0                   ; 3
    ldx    #1                    ; 2
    and    #$0F                  ; 2
    bne    LF854                 ; 2³
    jsr    LFD95                 ; 6
    lda    #1                    ; 2
    jsr    LFD9E                 ; 6
    lda    #0                    ; 2
    ldx    #3                    ; 2
    jsr    LFD9E                 ; 6
    lda    #8                    ; 2
    ldx    #5                    ; 2
    jsr    LFD9E                 ; 6
    jmp    LF85B                 ; 3

LF854:
    cmp    #$0F                  ; 2
    bne    LF85B                 ; 2³
    jsr    LFDB0                 ; 6
LF85B:
    lda    INTIM                 ; 4
    bne    LF85B                 ; 2³
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #$E8                  ; 2
    sta    TIM8T                 ; 4
    lda    #0                    ; 2
    sta    COLUBK                ; 3
    sta    PF0                   ; 3
    lda    SWCHA                 ; 4
    sta    $B2                   ; 3
    lda    #1                    ; 2
    sta    $A0                   ; 3
    lda    $A3                   ; 3
    bne    LF8DA                 ; 2³
    lda    $9D                   ; 3
    bne    LF89C                 ; 2³
    lda    $8C                   ; 3
    beq    LF8DA                 ; 2³
    lda    #$84                  ; 2
    cmp    $9E                   ; 3
    bne    LF898                 ; 2³
    lda    #$88                  ; 2
LF898:
    sta    $9E                   ; 3
    sta    $9D                   ; 3
LF89C:
    lda    $9D                   ; 3
    beq    LF8DA                 ; 2³
    bpl    LF8C3                 ; 2³
    and    #$7F                  ; 2
    sta    $9D                   ; 3
    ldx    #0                    ; 2
    jsr    LFD95                 ; 6
    lda    #1                    ; 2
    jsr    LFD9E                 ; 6
    lda    #$0F                  ; 2
    ldx    #2                    ; 2
    jsr    LFD9E                 ; 6
    lda    #4                    ; 2
    ldx    #4                    ; 2
    sta    $9F                   ; 3
    jsr    LFD9E                 ; 6
    jmp    LF8DA                 ; 3

LF8C3:
    dec    $9D                   ; 5
    bne    LF8CF                 ; 2³
    ldx    #0                    ; 2
    jsr    LFDB0                 ; 6
    jmp    LF8DA                 ; 3

LF8CF:
    lda    $9F                   ; 3
    bmi    LF8DA                 ; 2³
    ldx    #4                    ; 2
    jsr    LFD9E                 ; 6
    dec    $9F                   ; 5
LF8DA:
    lda    $82                   ; 3
    bpl    LF8E1                 ; 2³
    jmp    LFD92                 ; 3

LF8E1:
    lda    $82                   ; 3
    cmp    #0                    ; 2
    beq    LF8EA                 ; 2³
    jmp    LF98A                 ; 3

LF8EA:
    ldy    #0                    ; 2
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    bne    LF905                 ; 2³+1
    iny                          ; 2
    lda    $99                   ; 3
    ora    $AD                   ; 3
    bne    LF905                 ; 2³+1
    lda    $A5                   ; 3
    bmi    LF903                 ; 2³+1
    dec    $A5                   ; 5
    jmp    LF905                 ; 3

LF903:
    inc    $A5                   ; 5
LF905:
    sty    $AD                   ; 3
    lda    #1                    ; 2
    sta    $A0                   ; 3
    lda    $DB                   ; 3
    beq    LF913                 ; 2³
    lda    $DD                   ; 3
    beq    LF91D                 ; 2³
LF913:
    lda    $DD                   ; 3
    beq    LF984                 ; 2³
    bpl    LF944                 ; 2³
    lda    $DB                   ; 3
    beq    LF922                 ; 2³
LF91D:
    lda    #6                    ; 2
    jmp    LF924                 ; 3

LF922:
    lda    #5                    ; 2
LF924:
    sta    $DD                   ; 3
    ldx    #1                    ; 2
    jsr    LFD95                 ; 6
    lda    $CC                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$15                  ; 2
    sta    $DF                   ; 3
    lda    #$0C                  ; 2
    ldx    #1                    ; 2
    jsr    LFD9E                 ; 6
    lda    #$0A                  ; 2
    sta    $E0                   ; 3
    jmp    LF948                 ; 3

LF944:
    dec    $DE                   ; 5
    bpl    LF984                 ; 2³
LF948:
    lda    #1                    ; 2
    sta    $DE                   ; 3
    dec    $DD                   ; 5
    beq    LF96E                 ; 2³
    lda    $DF                   ; 3
    ldx    #3                    ; 2
    jsr    LFD9E                 ; 6
    lda    $DB                   ; 3
    beq    LF960                 ; 2³
    inc    $DF                   ; 5
    jmp    LF962                 ; 3

LF960:
    dec    $DF                   ; 5
LF962:
    dec    $E0                   ; 5
    lda    $E0                   ; 3
LF966:
    ldx    #5                    ; 2
    jsr    LFD9E                 ; 6
    jmp    LF984                 ; 3

LF96E:
    lda    $E0                   ; 3
    beq    LF97F                 ; 2³
    inc    $DD                   ; 5
    lda    #3                    ; 2
    sta    $DE                   ; 3
    lda    #0                    ; 2
    sta    $E0                   ; 3
    jmp    LF966                 ; 3

LF97F:
    ldx    #1                    ; 2
    jsr    LFDB0                 ; 6
LF984:
    lda    #0                    ; 2
    sta    CTRLPF                ; 3
    sta    PF0                   ; 3
LF98A:
    lda    $82                   ; 3
    cmp    #1                    ; 2
    beq    LF993                 ; 2³
    jmp    LFB0C                 ; 3

LF993:
    lda    $DA                   ; 3
    beq    LF99F                 ; 2³
    lda    $C6                   ; 3
    sta    $DA                   ; 3
    lda    #0                    ; 2
    sta    $DD                   ; 3
LF99F:
    lda    #3                    ; 2
    sta    $A0                   ; 3
    lda    $DD                   ; 3
    bne    LF9AA                 ; 2³
    jmp    LFA3C                 ; 3

LF9AA:
    bpl    LF9F5                 ; 2³
    and    #$7F                  ; 2
    sta    $DD                   ; 3
    tax                          ; 2
    dex                          ; 2
    inc    $B5,X                 ; 6
    inc    $B4,X                 ; 6
    stx    $89                   ; 3
    ldx    #0                    ; 2
    jsr    LFD95                 ; 6
    inx                          ; 2
    jsr    LFD95                 ; 6
    ldx    $89                   ; 3
    lda    LFF88,X               ; 4
    ldx    #2                    ; 2
    jsr    LFD9E                 ; 6
    inx                          ; 2
    jsr    LFD9E                 ; 6
    lda    #4                    ; 2
    ldx    #1                    ; 2
    jsr    LFD9E                 ; 6
    lda    #2                    ; 2
    ldx    #5                    ; 2
    jsr    LFD9E                 ; 6
    lda    #$0C                  ; 2
    ldx    #0                    ; 2
    jsr    LFD9E                 ; 6
    lda    #$0D                  ; 2
    sta    $DE                   ; 3
    ldx    #4                    ; 2
    jsr    LFD9E                 ; 6
    lda    #3                    ; 2
    sta    $DF                   ; 3
    lda    #0                    ; 2
    sta    $E0                   ; 3
LF9F5:
    dec    $DF                   ; 5
    bpl    LFA39                 ; 2³+1
    lda    $E0                   ; 3
    bne    LFA0F                 ; 2³+1
    lda    #$19                  ; 2
    sta    $DF                   ; 3
    sta    $E0                   ; 3
    lda    #$0B                  ; 2
    sta    $DE                   ; 3
    ldx    #4                    ; 2
    jsr    LFD9E                 ; 6
    jmp    LFAA7                 ; 3

LFA0F:
    bmi    LFA1C                 ; 2³
    lda    #$FF                  ; 2
    sta    $E0                   ; 3
    ldx    $DD                   ; 3
    dex                          ; 2
    dec    $B4,X                 ; 6
    dec    $B5,X                 ; 6
LFA1C:
    dec    $DE                   ; 5
    lda    $DE                   ; 3
    ldx    #4                    ; 2
    jsr    LFD9E                 ; 6
    bne    LFA35                 ; 2³
    ldx    #0                    ; 2
    stx    $DD                   ; 3
    jsr    LFDB0                 ; 6
    inx                          ; 2
    jsr    LFDB0                 ; 6
    jmp    LFAA7                 ; 3

LFA35:
    lda    #3                    ; 2
    sta    $DF                   ; 3
LFA39:
    jmp    LFAA7                 ; 3

LFA3C:
    lda    #2                    ; 2
    sta    $A0                   ; 3
    lda    $D4                   ; 3
    beq    LFAA7                 ; 2³
    bpl    LFA7D                 ; 2³
    and    #$7F                  ; 2
    sta    $D4                   ; 3
    ldx    #0                    ; 2
    jsr    LFD95                 ; 6
    inx                          ; 2
    jsr    LFD95                 ; 6
    ldx    $D4                   ; 3
    dex                          ; 2
    lda    LFF88,X               ; 4
    ldx    #2                    ; 2
    jsr    LFD9E                 ; 6
    inx                          ; 2
    jsr    LFD9E                 ; 6
    lda    #$0C                  ; 2
    ldx    #0                    ; 2
    jsr    LFD9E                 ; 6
    lda    #4                    ; 2
    inx                          ; 2
    jsr    LFD9E                 ; 6
    lda    #7                    ; 2
    sta    $E1                   ; 3
    lda    #5                    ; 2
    sta    $E2                   ; 3
    lda    #0                    ; 2
    sta    $E3                   ; 3
    sta    $E4                   ; 3
LFA7D:
    dec    $E3                   ; 5
    bpl    LFA90                 ; 2³
    lda    #2                    ; 2
    sta    $E3                   ; 3
    dec    $E1                   ; 5
    bmi    LFA90                 ; 2³
    lda    $E1                   ; 3
    ldx    #4                    ; 2
    jsr    LFD9E                 ; 6
LFA90:
    dec    $E4                   ; 5
    bpl    LFAA7                 ; 2³
    lda    #4                    ; 2
    sta    $E4                   ; 3
    dec    $E2                   ; 5
    bpl    LFAA7                 ; 2³
    ldx    #0                    ; 2
    stx    $D4                   ; 3
    jsr    LFDB0                 ; 6
    inx                          ; 2
    jsr    LFDB0                 ; 6
LFAA7:
    lda    #4                    ; 2
    sta    $A0                   ; 3
    lda    $D5                   ; 3
    beq    LFAF5                 ; 2³
    bmi    LFAC8                 ; 2³
    lda    #3                    ; 2
    sta    $E5                   ; 3
    ldx    #1                    ; 2
    jsr    LFD95                 ; 6
    lda    #$0B                  ; 2
    ldx    #5                    ; 2
    jsr    LFD9E                 ; 6
    lda    #$FF                  ; 2
    sta    $D5                   ; 3
    jmp    LFACC                 ; 3

LFAC8:
    dec    $E6                   ; 5
    bpl    LFAF5                 ; 2³
LFACC:
    lda    #3                    ; 2
    sta    $E6                   ; 3
    ldx    $E5                   ; 3
    bmi    LFAED                 ; 2³
    stx    $89                   ; 3
    lda    LFF90,X               ; 4
    ldx    #1                    ; 2
    jsr    LFD9E                 ; 6
    ldx    $89                   ; 3
    lda    LFF94,X               ; 4
    ldx    #3                    ; 2
    jsr    LFD9E                 ; 6
    dec    $E5                   ; 5
    jmp    LFAF5                 ; 3

LFAED:
    ldx    #0                    ; 2
    stx    $D5                   ; 3
    inx                          ; 2
    jsr    LFDB0                 ; 6
LFAF5:
    ldx    #8                    ; 2
LFAF7:
    lda    $BD,X                 ; 4
    and    #$3F                  ; 2
    tay                          ; 2
    and    #$38                  ; 2
    beq    LFB04                 ; 2³
    tya                          ; 2
    jmp    LFB07                 ; 3

LFB04:
    tya                          ; 2
    ora    #$80                  ; 2
LFB07:
    sta    $BD,X                 ; 4
    dex                          ; 2
    bpl    LFAF7                 ; 2³+1
LFB0C:
    lda    $82                   ; 3
    cmp    #2                    ; 2
    beq    LFB15                 ; 2³
    jmp    LFD92                 ; 3

LFB15:
    lda    #$30                  ; 2
    sta    PF0                   ; 3
    lda    INPT4                 ; 3
    bmi    LFB27                 ; 2³
    ldx    $B8                   ; 3
    cpx    #$3D                  ; 2
    bcc    LFB27                 ; 2³
    cpx    #$57                  ; 2
    bcc    LFB62                 ; 2³
LFB27:
    tay                          ; 2
    bmi    LFB32                 ; 2³
    lda    $E5                   ; 3
    bpl    LFB3F                 ; 2³
    lda    #0                    ; 2
    beq    LFB38                 ; 3   always branch

LFB32:
    lda    $E5                   ; 3
    bmi    LFB3F                 ; 2³
    lda    #$80                  ; 2
LFB38:
    sta    $E5                   ; 3
    inc    $FE                   ; 5
    jmp    LFB62                 ; 3

LFB3F:
    and    #$0F                  ; 2
    cmp    #4                    ; 2
    bcs    LFB62                 ; 2³
    cmp    #3                    ; 2
    bne    LFB60                 ; 2³
    tya                          ; 2
    bmi    LFB62                 ; 2³
    lda    $BE                   ; 3
    eor    #$F0                  ; 2
    sta    $BE                   ; 3
    lda    $C0                   ; 3
    eor    #$78                  ; 2
    sta    $C0                   ; 3
    lda    #6                    ; 2
    sta    $E8                   ; 3
    lda    #$40                  ; 2
    sta    $EB                   ; 3
LFB60:
    inc    $E5                   ; 5
LFB62:
    lda    $EB                   ; 3
    beq    LFB6A                 ; 2³
    dec    $EB                   ; 5
    bne    LFB8E                 ; 2³
LFB6A:
    lda    #$87                  ; 2
    ldx    #$0F                  ; 2
    ldy    $B8                   ; 3
    cpy    #$3C                  ; 2
    bne    LFB82                 ; 2³
    ldy    $C0                   ; 3
    iny                          ; 2
    beq    LFB8E                 ; 2³
    ldy    $B9                   ; 3
    cpy    #$7C                  ; 2
    beq    LFB82                 ; 2³
    lda    #$FF                  ; 2
    tax                          ; 2
LFB82:
    sta    $C0                   ; 3
    cpx    $BE                   ; 3
    beq    LFB8E                 ; 2³
    lda    #6                    ; 2
    sta    $E8                   ; 3
    stx    $BE                   ; 3
LFB8E:
    ldx    #2                    ; 2
    lda    $83                   ; 3
LFB92:
    ldy    #$FF                  ; 2
    cmp    LFFCE,X               ; 4
    bcc    LFBAB                 ; 2³
    cmp    LFFD1,X               ; 4
    bcs    LFBAB                 ; 2³
    ldy    $DE                   ; 3
    dey                          ; 2
    bne    LFBA9                 ; 2³
    ldy    LFFD7,X               ; 4
    jmp    LFBAB                 ; 3

LFBA9:
    ldy    #$C3                  ; 2
LFBAB:
    sty    $B5,X                 ; 4
    dex                          ; 2
    bpl    LFB92                 ; 2³
    ldy    #0                    ; 2
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    bne    LFBD2                 ; 2³
    iny                          ; 2
    lda    $99                   ; 3
    ora    $AD                   ; 3
    bne    LFBD2                 ; 2³
    lda    $A5                   ; 3
    bmi    LFBC9                 ; 2³
    dec    $A5                   ; 5
    jmp    LFBD2                 ; 3

LFBC9:
    inc    $A5                   ; 5
    jsr    LFEC6                 ; 6
    sta    $DE                   ; 3
    ldy    #1                    ; 2
LFBD2:
    sty    $AD                   ; 3
    lda    $A5                   ; 3
    bmi    LFBEE                 ; 2³
    jsr    LFEC6                 ; 6
    cmp    $DE                   ; 3
    beq    LFBEE                 ; 2³
    ldy    $99                   ; 3
    bne    LFBEE                 ; 2³
    ldy    #1                    ; 2
    sty    SWCHA                 ; 4
    sty    $99                   ; 3
    sty    $9C                   ; 3
    sta    $DE                   ; 3
LFBEE:
    ldy    $B9                   ; 3
    lda    $B8                   ; 3
    cmp    #$1C                  ; 2
    bne    LFBFF                 ; 2³
    cpy    #$7C                  ; 2
    beq    LFC15                 ; 2³+1
    lda    #1                    ; 2
    jmp    LFC45                 ; 3

LFBFF:
    cmp    #$3C                  ; 2
    bne    LFC1C                 ; 2³
    cpy    #$98                  ; 2
    bne    LFC0A                 ; 2³
    jmp    LFCF3                 ; 3

LFC0A:
    ldx    $C0                   ; 3
    inx                          ; 2
    beq    LFC17                 ; 2³
    cpy    #$10                  ; 2
    beq    LFC5D                 ; 2³
    cpy    #$7C                  ; 2
LFC15:
    beq    LFC5D                 ; 2³
LFC17:
    lda    #$FF                  ; 2
    jmp    LFC45                 ; 3

LFC1C:
    cmp    #$5C                  ; 2
    bne    LFC5D                 ; 2³
    cpy    #$98                  ; 2
    beq    LFC71                 ; 2³
    cpy    #$7C                  ; 2
    beq    LFC59                 ; 2³
    ldx    #2                    ; 2
    tya                          ; 2
LFC2B:
    ldy    $DE                   ; 3
    dey                          ; 2
    bne    LFC36                 ; 2³
    cmp    LFFDA,X               ; 4
    jmp    LFC39                 ; 3

LFC36:
    cmp    LFFD4,X               ; 4
LFC39:
    bne    LFC40                 ; 2³
    ldy    $B5,X                 ; 4
    iny                          ; 2
    bne    LFC5D                 ; 2³
LFC40:
    dex                          ; 2
    bpl    LFC2B                 ; 2³
    lda    #1                    ; 2
LFC45:
    clc                          ; 2
    adc    $B9                   ; 3
    cmp    #$FF                  ; 2
    bne    LFC4E                 ; 2³
    lda    #$9F                  ; 2
LFC4E:
    cmp    #$A0                  ; 2
    bcc    LFC54                 ; 2³
    sbc    #$A0                  ; 2
LFC54:
    sta    $B9                   ; 3
    jmp    LFD16                 ; 3

LFC59:
    lda    #$15                  ; 2
    sta    $E6                   ; 3
LFC5D:
    inc    $B8                   ; 5
    inc    $B8                   ; 5
    lda    $B8                   ; 3
    cmp    #$3C                  ; 2
    bne    LFC74                 ; 2³
    ldx    $C0                   ; 3
    inx                          ; 2
    bne    LFC71                 ; 2³
    ldx    #2                    ; 2
    jsr    LFEA0                 ; 6
LFC71:
    jmp    LFD16                 ; 3

LFC74:
    cmp    #$5C                  ; 2
    bne    LFC8D                 ; 2³
    lda    $B9                   ; 3
    cmp    #$7C                  ; 2
    bne    LFC85                 ; 2³
    lda    #$15                  ; 2
    sta    $E6                   ; 3
    jmp    LFD16                 ; 3

LFC85:
    ldx    #1                    ; 2
    jsr    LFEA0                 ; 6
    jmp    LFD16                 ; 3

LFC8D:
    cmp    #$60                  ; 2
    bne    LFCB5                 ; 2³
    lda    $B9                   ; 3
    cmp    #$7C                  ; 2
    bcs    LFC71                 ; 2³
    lda    $DC                   ; 3
    ldx    $DE                   ; 3
    beq    LFCA2                 ; 2³
LFC9D:
    lsr                          ; 2
    lsr                          ; 2
    dex                          ; 2
    bne    LFC9D                 ; 2³
LFCA2:
    and    #$03                  ; 2
    ldy    #1                    ; 2
    cmp    $91                   ; 3
    beq    LFD16                 ; 2³+1
    lda    #8                    ; 2
    sta    $E1                   ; 3
    lda    #$28                  ; 2
    sta    $B3                   ; 3
    jmp    LFD16                 ; 3

LFCB5:
    cmp    #$7A                  ; 2
    bne    LFD16                 ; 2³+1
    lda    $B9                   ; 3
    cmp    #$7C                  ; 2
    beq    LFCF3                 ; 2³
    lda    #5                    ; 2
    sta    $E9                   ; 3
    lda    $A5                   ; 3
    bpl    LFCDA                 ; 2³
    ldx    #3                    ; 2
    jsr    LFDDA                 ; 6
    cpy    $DE                   ; 3
    bne    LFCD5                 ; 2³
    dey                          ; 2
    bpl    LFCD5                 ; 2³
    ldy    #2                    ; 2
LFCD5:
    sty    $DE                   ; 3
    jmp    LFCF3                 ; 3

LFCDA:
    sed                          ; 2
    lda    $92                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    sta    $92                   ; 3
    cld                          ; 2
    jsr    LFEC6                 ; 6
    cmp    $DE                   ; 3
    beq    LFCF3                 ; 2³
    lda    #1                    ; 2
    sta    SWCHA                 ; 4
    sta    $99                   ; 3
    sta    $9C                   ; 3
LFCF3:
    lda    #$98                  ; 2
    sta    $B9                   ; 3
    lda    #$5C                  ; 2
    sta    $B8                   ; 3
    lda    $BC                   ; 3
    bne    LFD16                 ; 2³+1
    jsr    LFDC3                 ; 6
    lsr                          ; 2
    lsr                          ; 2
    ldy    $A5                   ; 3
    bmi    LFD12                 ; 2³
    ldy    $92                   ; 3
    cpy    #$45                  ; 2
    bcs    LFD12                 ; 2³
    adc    #$45                  ; 2
    sbc    $92                   ; 3
LFD12:
    adc    #1                    ; 2
    sta    $BC                   ; 3
LFD16:
    lda    $99                   ; 3
    bne    LFD35                 ; 2³
    lda    $BC                   ; 3
    beq    LFD35                 ; 2³
    lda    $B9                   ; 3
    cmp    #$98                  ; 2
    bne    LFD35                 ; 2³
    dec    $BC                   ; 5
    bne    LFD35                 ; 2³
    jsr    LFDEB                 ; 6
    sta    $DC                   ; 3
    lda    #$1C                  ; 2
    sta    $B8                   ; 3
    lda    #$98                  ; 2
    sta    $B9                   ; 3
LFD35:
    lda    $B8                   ; 3
    sta    $D1                   ; 3
    lda    $DC                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFFCB,X               ; 4
    sta    $D3                   ; 3
    lda    $DC                   ; 3
    tay                          ; 2
    and    #$0F                  ; 2
    asl                          ; 2
    tax                          ; 2
    lda    LFFAB,X               ; 4
    sta    $88                   ; 3
    tya                          ; 2
    ldy    LFFAC,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    tax                          ; 2
    lda    LFFC5,X               ; 4
    ldx    $88                   ; 3
    stx    $F2                   ; 3
    sty    $F3                   ; 3
    sta    $D2                   ; 3
    lda    #2                    ; 2
    sta    $A0                   ; 3
    lda    $E3                   ; 3
    beq    LFD7C                 ; 2³
    lsr                          ; 2
    ldx    #4                    ; 2
    jsr    LFD9E                 ; 6
    dec    $E3                   ; 5
    bne    LFD7C                 ; 2³
    ldx    #0                    ; 2
    jsr    LFDB0                 ; 6
LFD7C:
    lda    $E1                   ; 3
    beq    LFD8C                 ; 2³
    dec    $E1                   ; 5
    bne    LFD86                 ; 2³
    inc    $B9                   ; 5
LFD86:
    dec    $B8                   ; 5
    dec    $B8                   ; 5
    dec    $B8                   ; 5
LFD8C:
    lda    $B3                   ; 3
    beq    LFD92                 ; 2³
    dec    $B3                   ; 5
LFD92:
    jmp    LFFE6                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD95 SUBROUTINE
    lda    $A0                   ; 3
    cmp    $A1,X                 ; 4
    bcc    LFD9D                 ; 2³
    sta    $A1,X                 ; 4
LFD9D:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD9E SUBROUTINE
    sta    $88                   ; 3
    txa                          ; 2
    and    #$01                  ; 2
    tay                          ; 2
    lda.wy $A1,Y                 ; 4
    cmp    $A0                   ; 3
    bne    LFDAF                 ; 2³
    lda    $88                   ; 3
    sta    AUDC0,X               ; 4
LFDAF:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFDB0 SUBROUTINE
    lda    $A0                   ; 3
    bmi    LFDB8                 ; 2³
    cmp    $A1,X                 ; 4
    bne    LFDC2                 ; 2³
LFDB8:
    lda    #0                    ; 2
    sta    AUDV0,X               ; 4
    sta    AUDC0,X               ; 4
    sta    AUDF0,X               ; 4
    sta    $A1,X                 ; 4
LFDC2:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFDC3 SUBROUTINE
    lda    $FE                   ; 3
    bne    LFDCC                 ; 2³
LFDC7:
    lda    LFDC7                 ; 4
    sta    $FE                   ; 3
LFDCC:
    and    #$10                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    $FE                   ; 3
    asl                          ; 2
    lda    $FE                   ; 3
    rol                          ; 2
    sta    $FE                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFDDA SUBROUTINE
    jsr    LFDC3                 ; 6
    ldy    #0                    ; 2
    clc                          ; 2
    dex                          ; 2
LFDE1:
    adc    $FE                   ; 3
    bcc    LFDE7                 ; 2³
    iny                          ; 2
    clc                          ; 2
LFDE7:
    dex                          ; 2
    bne    LFDE1                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFDEB SUBROUTINE
    ldx    #3                    ; 2
    jsr    LFDDA                 ; 6
    sty    $88                   ; 3
    ldx    #3                    ; 2
    jsr    LFDC3                 ; 6
    jsr    LFDC3                 ; 6
    jsr    LFDDA                 ; 6
    tya                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    $88                   ; 3
    sta    $88                   ; 3
    ldx    #3                    ; 2
    jsr    LFDC3                 ; 6
    jsr    LFDC3                 ; 6
    jsr    LFDDA                 ; 6
    lda    $88                   ; 3
    sty    $88                   ; 3
    asl                          ; 2
    asl                          ; 2
    ora    $88                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFE18 SUBROUTINE
    sei                          ; 2
    cld                          ; 2
    pla                          ; 4
    tax                          ; 2
    pla                          ; 4
    sta    $FD                   ; 3
    stx    $FC                   ; 3
    ldx    #$FB                  ; 2
    txs                          ; 2
    lda    #0                    ; 2
LFE26:
    sta    0,X                   ; 4
    dex                          ; 2
    cpx    #$80                  ; 2
    bcs    LFE26                 ; 2³

    sta    AUDC0                 ; 3
    sta    AUDC1                 ; 3
    ldx    #2                    ; 2
LFE33:
    lda    LFEDF,X               ; 4
    sta    $80,X                 ; 4
    dex                          ; 2
    bpl    LFE33                 ; 2³
    lda    #3                    ; 2
    sta    SWACNT                ; 4
    lda    #1                    ; 2
    sta    SWCHA                 ; 4
    sta    $99                   ; 3
    sta    $9C                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFE4A SUBROUTINE
    ldy    #7                    ; 2
LFE4C:
    cmp    $CC                   ; 3
    bcc    LFE52                 ; 2³
    sbc    $CC                   ; 3
LFE52:
    rol    $D5                   ; 5
    asl                          ; 2
    dey                          ; 2
    bpl    LFE4C                 ; 2³
    lda    $D5                   ; 3
    ldy    #3                    ; 2
LFE5C:
    cmp    LFF3D,Y               ; 4
    bcs    LFE65                 ; 2³
    inx                          ; 2
    dey                          ; 2
    bpl    LFE5C                 ; 2³
LFE65:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFE66 SUBROUTINE
    dec    $D9                   ; 5
    bpl    LFE9F                 ; 2³
    ldy    #2                    ; 2
    sty    $D9                   ; 3
LFE6E:
    lda    $D1                   ; 3
    ldx    $D8                   ; 3
    and    $BE,X                 ; 4
    bne    LFE89                 ; 2³
    dec    $D8                   ; 5
    bpl    LFE6E                 ; 2³
    ldy    $A5                   ; 3
    bpl    LFE84                 ; 2³
    lda    $D1                   ; 3
    and    $BD                   ; 3
    beq    LFE8F                 ; 2³
LFE84:
    lda    #$FF                  ; 2
    jmp    LFE9F                 ; 3

LFE89:
    eor    #$FF                  ; 2
    and    $BE,X                 ; 4
    sta    $BE,X                 ; 4
LFE8F:
    lda    $D1                   ; 3
    ora    $BD,X                 ; 4
    sta    $BD,X                 ; 4
    cpx    #0                    ; 2
    bne    LFE9D                 ; 2³
    ldx    #1                    ; 2
    stx    $D5                   ; 3
LFE9D:
    dec    $D8                   ; 5
LFE9F:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFEA0 SUBROUTINE
    stx    $89                   ; 3
    lda    #2                    ; 2
    sta    $A0                   ; 3
    ldx    #0                    ; 2
    jsr    LFD95                 ; 6
    lda    #7                    ; 2
    jsr    LFD9E                 ; 6
    ldx    $89                   ; 3
    lda    LFFC8,X               ; 4
    ldx    #2                    ; 2
    jsr    LFD9E                 ; 6
    lda    #9                    ; 2
    ldx    #4                    ; 2
    jsr    LFD9E                 ; 6
    lda    #$12                  ; 2
    sta    $E3                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFEC6 SUBROUTINE
    lda    $92                   ; 3
    and    #$0F                  ; 2
    cmp    #5                    ; 2
    php                          ; 3
    lda    $92                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    plp                          ; 4
    rol                          ; 2
LFED5:
    cmp    #3                    ; 2
    bcc    LFEDE                 ; 2³
    sbc    #3                    ; 2
    jmp    LFED5                 ; 3

LFEDE:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFEDF:
    .byte $20 ; |  X     | $FEDF
    .byte $FF ; |XXXXXXXX| $FEE0
    .byte $FF ; |XXXXXXXX| $FEE1
LFEE2:
    .byte $20 ; |  X     | $FEE2
    .byte $10 ; |   X    | $FEE3
    .byte $20 ; |  X     | $FEE4
    .byte $80 ; |X       | $FEE5
    .byte $00 ; |        | $FEE6
    .byte $00 ; |        | $FEE7
    .byte $06 ; |     XX | $FEE8
    .byte $05 ; |     X X| $FEE9
    .byte $04 ; |     X  | $FEEA
    .byte $03 ; |      XX| $FEEB
    .byte $00 ; |        | $FEEC
    .byte $00 ; |        | $FEED
    .byte $06 ; |     XX | $FEEE
    .byte $05 ; |     X X| $FEEF
    .byte $04 ; |     X  | $FEF0
    .byte $03 ; |      XX| $FEF1
    .byte $A4 ; |X X  X  | $FEF2
    .byte $00 ; |        | $FEF3
    .byte $00 ; |        | $FEF4
    .byte $03 ; |      XX| $FEF5
    .byte $04 ; |     X  | $FEF6
    .byte $02 ; |      X | $FEF7
    .byte $01 ; |       X| $FEF8
    .byte $A4 ; |X X  X  | $FEF9
    .byte $00 ; |        | $FEFA
    .byte $00 ; |        | $FEFB
    .byte $03 ; |      XX| $FEFC
    .byte $07 ; |     XXX| $FEFD
    .byte $06 ; |     XX | $FEFE
    .byte $08 ; |    X   | $FEFF
    .byte $A4 ; |X X  X  | $FF00
    .byte $00 ; |        | $FF01
    .byte $00 ; |        | $FF02
    .byte $06 ; |     XX | $FF03
    .byte $08 ; |    X   | $FF04
    .byte $07 ; |     XXX| $FF05
    .byte $03 ; |      XX| $FF06
    .byte $A5 ; |X X  X X| $FF07
    .byte $00 ; |        | $FF08
    .byte $02 ; |      X | $FF09
    .byte $04 ; |     X  | $FF0A
    .byte $06 ; |     XX | $FF0B
    .byte $04 ; |     X  | $FF0C
    .byte $02 ; |      X | $FF0D
    .byte $A5 ; |X X  X X| $FF0E
    .byte $00 ; |        | $FF0F
    .byte $03 ; |      XX| $FF10
    .byte $07 ; |     XXX| $FF11
    .byte $05 ; |     X X| $FF12
    .byte $07 ; |     XXX| $FF13
    .byte $03 ; |      XX| $FF14
    .byte $A5 ; |X X  X X| $FF15
    .byte $04 ; |     X  | $FF16
    .byte $05 ; |     X X| $FF17
    .byte $00 ; |        | $FF18
    .byte $06 ; |     XX | $FF19
    .byte $05 ; |     X X| $FF1A
    .byte $04 ; |     X  | $FF1B
    .byte $A6 ; |X X  XX | $FF1C
    .byte $06 ; |     XX | $FF1D
    .byte $07 ; |     XXX| $FF1E
    .byte $08 ; |    X   | $FF1F
    .byte $06 ; |     XX | $FF20
    .byte $07 ; |     XXX| $FF21
    .byte $08 ; |    X   | $FF22
    .byte $A6 ; |X X  XX | $FF23
    .byte $03 ; |      XX| $FF24
    .byte $05 ; |     X X| $FF25
    .byte $07 ; |     XXX| $FF26
    .byte $04 ; |     X  | $FF27
    .byte $06 ; |     XX | $FF28
    .byte $08 ; |    X   | $FF29
    .byte $A6 ; |X X  XX | $FF2A
    .byte $06 ; |     XX | $FF2B
    .byte $03 ; |      XX| $FF2C
    .byte $05 ; |     X X| $FF2D
    .byte $03 ; |      XX| $FF2E
    .byte $04 ; |     X  | $FF2F
    .byte $03 ; |      XX| $FF30
    .byte $96 ; |X  X XX | $FF31
    .byte $FF ; |XXXXXXXX| $FF32
LFF33:
    .byte $0C ; |    XX  | $FF33
    .byte $1E ; |   XXXX | $FF34
    .byte $08 ; |    X   | $FF35
LFF36:
    .byte $28 ; |  X X   | $FF36
    .byte $28 ; |  X X   | $FF37
LFF38:
    .byte $23 ; |  X   XX| $FF38
    .byte $01 ; |       X| $FF39
    .byte $16 ; |   X XX | $FF3A
    .byte $35 ; |  XX X X| $FF3B
    .byte $35 ; |  XX X X| $FF3C
LFF3D:
    .byte $1E ; |   XXXX | $FF3D
    .byte $3C ; |  XXXX  | $FF3E
    .byte $5A ; | X XX X | $FF3F
    .byte $77 ; | XXX XXX| $FF40
LFF41:
    .byte $16 ; |   X XX | $FF41
    .byte $36 ; |  XX XX | $FF42
    .byte $56 ; | X X XX | $FF43
    .byte $76 ; | XXX XX | $FF44
LFF45:
    .byte $34 ; |  XX X  | $FF45
    .byte $54 ; | X X X  | $FF46
    .byte $52 ; | X X  X | $FF47
    .byte $64 ; | XX  X  | $FF48
    .byte $74 ; | XXX X  | $FF49
    .byte $A4 ; |X X  X  | $FF4A
    .byte $C4 ; |XX   X  | $FF4B
    .byte $D6 ; |XX X XX | $FF4C
    .byte $18 ; |   XX   | $FF4D
    .byte $28 ; |  X X   | $FF4E
    .byte $26 ; |  X  XX | $FF4F
    .byte $24 ; |  X  X  | $FF50
    .byte $34 ; |  XX X  | $FF51
    .byte $24 ; |  X  X  | $FF52
    .byte $26 ; |  X  XX | $FF53
    .byte $28 ; |  X X   | $FF54
    .byte $18 ; |   XX   | $FF55
    .byte $D6 ; |XX X XX | $FF56
    .byte $C4 ; |XX   X  | $FF57
    .byte $A4 ; |X X  X  | $FF58
    .byte $74 ; | XXX X  | $FF59
    .byte $64 ; | XX  X  | $FF5A
    .byte $52 ; | X X  X | $FF5B
    .byte $54 ; | X X X  | $FF5C
    .byte $34 ; |  XX X  | $FF5D
LFF5E:
    .byte $FF ; |XXXXXXXX| $FF5E
    .byte $34 ; |  XX X  | $FF5F
    .byte $18 ; |   XX   | $FF60
    .byte $26 ; |  X  XX | $FF61
    .byte $74 ; | XXX X  | $FF62
    .byte $C4 ; |XX   X  | $FF63
    .byte $52 ; | X X  X | $FF64
    .byte $0E ; |    XXX | $FF65
    .byte $1C ; |   XXX  | $FF66
    .byte $78 ; | XXXX   | $FF67
    .byte $A4 ; |X X  X  | $FF68
    .byte $24 ; |  X  X  | $FF69
    .byte $00 ; |        | $FF6A
    .byte $00 ; |        | $FF6B
    .byte $D6 ; |XX X XX | $FF6C
    .byte $28 ; |  X X   | $FF6D
    .byte $C8 ; |XX  X   | $FF6E
    .byte $FF ; |XXXXXXXX| $FF6F
    .byte $FF ; |XXXXXXXX| $FF70
    .byte $FF ; |XXXXXXXX| $FF71
LFF72:
    .byte $FF ; |XXXXXXXX| $FF72
    .byte $8C ; |X   XX  | $FF73
    .byte $19 ; |   XX  X| $FF74
    .byte $19 ; |   XX  X| $FF75
    .byte $35 ; |  XX X X| $FF76
    .byte $35 ; |  XX X X| $FF77
    .byte $55 ; | X X X X| $FF78
    .byte $55 ; | X X X X| $FF79
    .byte $C7 ; |XX   XXX| $FF7A
    .byte $C7 ; |XX   XXX| $FF7B
    .byte $80 ; |X       | $FF7C
    .byte $80 ; |X       | $FF7D
    .byte $80 ; |X       | $FF7E
    .byte $80 ; |X       | $FF7F
    .byte $80 ; |X       | $FF80
    .byte $80 ; |X       | $FF81
    .byte $80 ; |X       | $FF82
    .byte $80 ; |X       | $FF83
    .byte $80 ; |X       | $FF84
    .byte $FF ; |XXXXXXXX| $FF85
    .byte $DE ; |XX XXXX | $FF86
    .byte $5E ; | X XXXX | $FF87
LFF88:
    .byte $1F ; |   XXXXX| $FF88
    .byte $1D ; |   XXX X| $FF89
    .byte $1A ; |   XX X | $FF8A
    .byte $17 ; |   X XXX| $FF8B
    .byte $14 ; |   X X  | $FF8C
    .byte $13 ; |   X  XX| $FF8D
    .byte $11 ; |   X   X| $FF8E
    .byte $0F ; |    XXXX| $FF8F
LFF90:
    .byte $0E ; |    XXX | $FF90
    .byte $07 ; |     XXX| $FF91
    .byte $01 ; |       X| $FF92
    .byte $08 ; |    X   | $FF93
LFF94:
    .byte $04 ; |     X  | $FF94
    .byte $0E ; |    XXX | $FF95
    .byte $1F ; |   XXXXX| $FF96
LFF97:
    .byte $00 ; |        | $FF97
    .byte $01 ; |       X| $FF98
    .byte $02 ; |      X | $FF99
    .byte $04 ; |     X  | $FF9A
    .byte $08 ; |    X   | $FF9B
    .byte $10 ; |   X    | $FF9C
LFF9D:
    .byte $20 ; |  X     | $FF9D
    .byte $FF ; |XXXXXXXX| $FF9E
    .byte $FF ; |XXXXXXXX| $FF9F
    .byte $FF ; |XXXXXXXX| $FFA0
    .byte $59 ; | X XX  X| $FFA1
    .byte $98 ; |X  XX   | $FFA2
    .byte $FF ; |XXXXXXXX| $FFA3
    .byte $01 ; |       X| $FFA4
    .byte $0A ; |    X X | $FFA5
    .byte $84 ; |X    X  | $FFA6
    .byte $0F ; |    XXXX| $FFA7
    .byte $FF ; |XXXXXXXX| $FFA8
    .byte $87 ; |X    XXX| $FFA9
    .byte $87 ; |X    XXX| $FFAA

LFFAB:
    .byte $46 ; | X   XX | $FFAB
LFFAC:
    .byte $5F ; | X XXXXX| $FFAC
    .byte $99 ; |X  XX  X| $FFAD
    .byte $5F ; | X XXXXX| $FFAE
    .byte $60 ; | XX     | $FFAF
    .byte $5F ; | X XXXXX| $FFB0
    .byte $DA ; |XX XX X | $FFB1
    .byte $F0 ; |XXXX    | $FFB2
    .byte $33 ; |  XX  XX| $FFB3
    .byte $5F ; | X XXXXX| $FFB4
    .byte $86 ; |X    XX | $FFB5
    .byte $5F ; | X XXXXX| $FFB6
    .byte $59 ; | X XX  X| $FFB7
    .byte $5F ; | X XXXXX| $FFB8

    .byte $00 ; |        | $FFB9
    .byte $85 ; |X    X X| $FFBA
    .byte $19 ; |   XX  X| $FFBB
    .byte $5F ; | X XXXXX| $FFBC
    .byte $6C ; | XX XX  | $FFBD
    .byte $5F ; | X XXXXX| $FFBE
    .byte $52 ; | X X  X | $FFBF
    .byte $5F ; | X XXXXX| $FFC0
    .byte $76 ; | XXX XX | $FFC1
    .byte $59 ; | X XX  X| $FFC2
    .byte $3A ; |  XXX X | $FFC3
    .byte $1B ; |   XX XX| $FFC4
LFFC5:
    .byte $0C ; |    XX  | $FFC5
    .byte $13 ; |   X  XX| $FFC6
    .byte $1A ; |   XX X | $FFC7
LFFC8:
    .byte $0E ; |    XXX | $FFC8
    .byte $0F ; |    XXXX| $FFC9
    .byte $11 ; |   X   X| $FFCA
LFFCB:
    .byte $34 ; |  XX X  | $FFCB
    .byte $18 ; |   XX   | $FFCC
    .byte $74 ; | XXX X  | $FFCD
LFFCE:
    .byte $11 ; |   X   X| $FFCE
    .byte $31 ; |  XX   X| $FFCF
    .byte $51 ; | X X   X| $FFD0
LFFD1:
    .byte $28 ; |  X X   | $FFD1
    .byte $48 ; | X  X   | $FFD2
    .byte $68 ; | XX X   | $FFD3
LFFD4:
    .byte $18 ; |   XX   | $FFD4
    .byte $38 ; |  XXX   | $FFD5
    .byte $58 ; | X XX   | $FFD6
LFFD7:
    .byte $CF ; |XX  XXXX| $FFD7
    .byte $E3 ; |XXX   XX| $FFD8
    .byte $C3 ; |XX    XX| $FFD9
LFFDA:
    .byte $14 ; |   X X  | $FFDA
    .byte $36 ; |  XX XX | $FFDB
LFFDC:
    .byte $58 ; | X XX   | $FFDC
    .byte $0B ; |    X XX| $FFDD
    .byte $0B ; |    X XX| $FFDE
    .byte $0E ; |    XXX | $FFDF
    .byte $13 ; |   X  XX| $FFE0
    .byte $1D ; |   XXX X| $FFE1

    jmp    START_2ND             ; 3
    nop                          ; 2
LFFE6:
    lda    #4                    ; 2
    sta    $FFF8                 ; 4
    sta    $A1,X                 ; 4
    rts                          ; 6

    sta    $88                   ; 3
    txa                          ; 2
    and    #$01                  ; 2
    tay                          ; 2
    jmp    LF01F                 ; 3

    .byte $49 ; | X  X  X| $FFF7
    .byte $A0 ; |X X     | $FFF8
    .byte $0A ; |    X X | $FFF9
    .byte $04 ; |     X  | $FFFA
    .byte $4C ; | X  XX  | $FFFB   jmp   START_2ND

       ORG $2FFC
      RORG $5FFC

    .word START_2ND
    .byte $FF ; |XXXXXXXX| $FFFE
    .byte $FF ; |XXXXXXXX| $FFFF