; Disassembly of Solar Fox
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: distella -pasfcSolFox1.cfg SolFox.1 > SolarFox(re)1.asm
;
; SolFox1.cfg contents:
;
;      ORG D000
;      CODE D000 D89C
;      GFX D89D DFF1
;      CODE DFF2 DFF7
;      GFX DFF8 DFFF
;
;
; Command Line: distella -pasfcSolFox2.cfg SolFox.2 > SolarFox(re)2.asm
;
; SolFox2.cfg contents:
;
;      ORG F000
;      CODE F000 F596
;      GFX F597 F5B0
;      CODE F5B1 FA06
;      GFX FA07 FA2A
;      CODE FA2B FDCA
;      GFX FDCB FFF1
;      CODE FFF2 FFF7
;      GFX FFF8 FFFF

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
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
HMP0    =  $20
HMP1    =  $21
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
CXCLR   =  $2C
CXPPMM  =  $37
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SWITCHES
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ORIGINAL = 1   ; original game
OPTIMAL  = 0   ; version that saves bytes, cycles, or both

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      USER CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

COL_CBS_PRESENTS      =  $DC
COL_SOLAR_FOX         =  $48
COL_COPYRIGHT         =  $DC  ; color for Bally, Midway, and the copyright years
COL_SCORE_SHIP_DEMO1  =  $2C
COL_RACK_LIVES_DEMO1  =  $2C
COL_BLUE_SCORE_DEMO2  =  $88
COL_RACK_LIVES_DEMO2  =  $88
COL_TOP_SENTINEL      =  $36
COL_BOTTOM_SENTINEL   =  $36
COL_FIREBALL          =  $36

BANK_0                =  $FFF8
BANK_1                =  $DFF9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

colSolarCellLine_1_5   =  $83
colSolarCellLine_2_6   =  $84
colSolarCellLine_3     =  $85
colSolarCellLine_4     =  $86

scoreBCD               =  $A4
scoreHiBCD             =  $A4
scoreMidBCD            =  $A5

frameCounter           =  $E6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      FIRST BANK
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $D000

START:
    cmp    BANK_1                ; 4   bankswitch, clear ram and TIA registers
    
LD003:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $8A                   ; 3
    and    #$10                  ; 2
    beq    LD011                 ; 2³
    lda    $8A                   ; 3   choose color
    bpl    LD01D                 ; 2³
    bmi    LD024                 ; 3   always branch

LD011:
    lda    $E3                   ; 3
    and    #$08                  ; 2
    beq    LD01D                 ; 2³
    lda    $8A                   ; 3
    and    #$20                  ; 2
    bne    LD024                 ; 2³
LD01D:
    ldx    #COL_SCORE_SHIP_DEMO1 ; 2
    jsr    DrawScore             ; 6
    beq    LD029                 ; 3   always branch

LD024:
    ldx    #COL_RACK_LIVES_DEMO2 ; 2
    jsr    LD615                 ; 6
LD029:
    lda    $8A                   ; 3
    and    #$10                  ; 2
    beq    LD033                 ; 2³
    bit    $8A                   ; 3
    bvc    .doTitleScreenText    ; 2³
LD033:
    jmp    LD0AF                 ; 3

.doTitleScreenText:
    ldx    #49                   ; 2
.loopDrawBlankTop:
    sta    WSYNC                 ; 3   fourty-nine blank scanlines until text starts
;---------------------------------------
    dex                          ; 2
    bne    .loopDrawBlankTop     ; 2³

    lda    #3                    ; 2   3 copies close
    sta    NUSIZ0                ; 3
    lsr                          ; 2   2 copies close
    sta    NUSIZ1                ; 3
    lda    #$D0                  ; 2   fine position right 3
    sta    HMP0                  ; 3
    lda    #$E0                  ; 2   fine position right 2
    sta    HMP1                  ; 3
    lda    #COL_CBS_PRESENTS     ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldy    #$F0                  ; 2               #$F0 value will be subracted by 5 each loop, and then compared
    sty    $82                   ;+3 = @37         to the value in $83 to determine when to exit the loop
    sta    RESP0                 ; 3   rough position @39 cycles
    sta    RESP1                 ; 3   rough position @42 cycles
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3   P0 = $3C, P1 = $44
    lda    TitleScreenText+4,Y   ; 4
    sta    $81                   ; 3
    lda    #$D2                  ; 2   ($F0-$D2)/5 = six scanlines of height for "CBS"
    sta    $83                   ; 3
    jsr    DrawTitleScreenText   ; 6   draw "CBS"
    lda    #$B9                  ; 2   ($D2-$B9)/5 = five scanlines of height for "Presents"
    sta    $83                   ; 3
    jsr    DrawTitleScreenText   ; 6   draw "Presents"
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3   three extra blank scanlines of seperation
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #COL_SOLAR_FOX        ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$A0                  ; 2   ($B9-$A0)/5 = five scanlines of height for "Solar"
    sta    $83                   ; 3
    jsr    DrawTitleScreenText   ; 6   draw "Solar"
    lda    #$87                  ; 2   ($A0-$87)/5 = five scanlines of height for "Fox"
    sta    $83                   ; 3
    jsr    DrawTitleScreenText   ; 6   draw "Fox"
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3   three extra blank scanlines of seperation
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #COL_COPYRIGHT        ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$23                  ; 2   ($87-$23)/5 = twenty scanlines of height for "Bally", and "Midway Mfg"
    sta    $83                   ; 3
    jsr    DrawTitleScreenText   ; 6   draw "Bally", and "Midway Mfg"
    lda    #$FB                  ; 2   ($123-$FB)/5 = eight scanlines of height for "(C) 1981,1983"
    sta    $83                   ; 3
    jsr    DrawTitleScreenText   ; 6   draw "(C) 1981,1983"

    ldx    #49                   ; 2
LD0A7:
    sta    WSYNC                 ; 3   fourty-nine blank scanlines after text
;---------------------------------------
    dex                          ; 2
    bne    LD0A7                 ; 2³
    jmp    LD52C                 ; 3

LD0AF:
    sta    WSYNC                 ; 3
;---------------------------------------
    bit    $8C                   ; 3
    bvc    LD0B9                 ; 2³
    lda    #8                    ; 2
    sta    REFP0                 ; 3
LD0B9:
    lda    $DC                   ; 3
    and    #$7F                  ; 2
    jsr    CalcHorizPositon      ; 6
    sta    HMP1                  ; 3
LD0C2:
    dex                          ; 2
    bne    LD0C2                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    $80                   ; 3   zero
    stx    $88                   ; 3   zero
    lda    #COL_TOP_SENTINEL     ; 2
    sta    COLUP1                ; 3
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcs    LD0DC                 ; 2³
    ldx    #0                    ; 2
    ldy    #4                    ; 2
    bne    LD0E0                 ; 3   always branch

LD0DC:
    ldx    #4                    ; 2
    ldy    #0                    ; 2
LD0E0:
    stx    $81                   ; 3
    sty    $82                   ; 3
    lda    $AA                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    LDFEE,X               ; 4
    sta    $83                   ; 3
    lda    $8F                   ; 3
    jsr    CalcHorizPositon      ; 6
    sta    HMP0                  ; 3
LD0F5:
    dex                          ; 2
    bne    LD0F5                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    $AA                   ; 3
    and    #$18                  ; 2
    lsr                          ; 2
    tay                          ; 2   max value is 12
    lda    frameCounter          ; 3
    and    $83                   ; 3
    bne    LD12B                 ; 2³
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcs    LD11B                 ; 2³
    lda    SolarCellColTab,Y     ; 4
    sta    $83                   ; 3
    lda    SolarCellColTab+1,Y   ; 4
    sta    $84                   ; 3
    bne    LD125                 ; 3   always branch

LD11B:
    lda    SolarCellColTab+1,Y   ; 4
    sta    $83                   ; 3
    lda    SolarCellColTab,Y     ; 4
    sta    $84                   ; 3
LD125:
    lda    SolarCellColTab+2,Y   ; 4
    tax                          ; 2
    bne    LD145                 ; 3   always branch

LD12B:
    lda    SolarCellColTab+3,Y   ; 4
    sta    $83                   ; 3
    sta    $84                   ; 3
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcs    LD13F                 ; 2³
    lda    SolarCellColTab,Y     ; 4
    ldx    SolarCellColTab+1,Y   ; 4
    bne    LD145                 ; 3   always branch

LD13F:
    lda    SolarCellColTab+1,Y   ; 4
    ldx    SolarCellColTab,Y     ; 4
LD145:
    sta    $85                   ; 3
    stx    $86                   ; 3
    lda    #0                    ; 2
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $DC                   ; 3
    and    #$7F                  ; 2
    sec                          ; 2
LD154:
    sbc    #$0C                  ; 2
    bcs    LD154                 ; 2³
    adc    #$0C                  ; 2
    tay                          ; 2   result will always be between 0-11
    sta    WSYNC                 ; 3
;---------------------------------------
    tax                          ; 2
    lda    $DC                   ; 3
    bpl    LD168                 ; 2³
    lda    LD92A,X               ; 4
    jmp    LD16B                 ; 3

LD168:
    lda    LD936,X               ; 4
LD16B:
    sta    $87                   ; 3
    lda    $DC                   ; 3
    and    #$7F                  ; 2
    cmp    #$24                  ; 2
    bcs    LD17A                 ; 2³
    tya                          ; 2   Y holds value between 0-11
    adc    #4                    ; 2
    bne    LD17F                 ; 3   always branch

LD17A:
    cmp    #$78                  ; 2
    bcc    LD185                 ; 2³
    tya                          ; 2
LD17F:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $87                   ; 3
LD185:
    ldy    #5                    ; 2
LD187:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $8A                   ; 3
    and    #$02                  ; 2
    bne    LD194                 ; 2³
    lda    SentinelGfx,Y         ; 4
    sta    GRP1                  ; 3
LD194:
    dey                          ; 2
    bpl    LD187                 ; 2³
    lda    #5                    ; 2
    sta    NUSIZ1                ; 3
    lda    #COL_FIREBALL         ; 2
    sta    COLUP1                ; 3
    ldy    #$96                  ; 2
    lda    $8A                   ; 3
    and    #$08                  ; 2
    beq    LD1F0                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    REFP0                 ; 3
    lda    $8A                   ; 3
    and    #$20                  ; 2
    beq    LD1BB                 ; 2³
    lda    $89                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bpl    LD1BF                 ; 3   always branch

LD1BB:
    lda    $89                   ; 3
    and    #$0F                  ; 2
LD1BF:
    sta    $81                   ; 3
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    $81                   ; 3
    tax                          ; 2
    dex                          ; 2
    lda    #5                    ; 2
    sta    $81                   ; 3
LD1CC:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($EB),Y               ; 5
    bne    LD1D5                 ; 2³
    dey                          ; 2
    bne    LD1CC                 ; 2³
LD1D5:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    HeliosGfx,X           ; 4
    sta    GRP0                  ; 3
    dex                          ; 2
    dey                          ; 2
    dec    $81                   ; 5
    bne    LD1D5                 ; 2³
LD1E2:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    dey                          ; 2
    bne    LD1E2                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    LD4F1                 ; 3

LD1F0:
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcc    LD218                 ; 2³+1
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $DC                   ; 3
    and    #$7F                  ; 2
    sec                          ; 2
    sbc    #$1E                  ; 2
    tax                          ; 2
    lda    $DC                   ; 3
    bmi    LD208                 ; 2³
    lda    LD9A2,X               ; 4
    bne    LD20B                 ; 2³   might always branch

LD208:
    lda    LD942,X               ; 4
LD20B:
    jsr    CalcHorizPositon      ; 6
    sta    HMP1                  ; 3
LD210:
    dex                          ; 2
    bne    LD210                 ; 2³
    sta    RESP1                 ; 3
    jmp    LD23A                 ; 3

LD218:
    lda    #$50                  ; 2
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jsr    Waste12Cycles         ;
    jsr    Waste12Cycles         ;
    lda    #$60                  ; 2
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jsr    Waste12Cycles         ;
    jsr    Waste12Cycles         ;
    lda    $87                   ; 3
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
LD23A:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    $80                   ; 3
    lda    $B0,X                 ; 4
    asl                          ; 2
    lda    #3                    ; 2
    adc    #0                    ; 2
    and    #$04                  ; 2
    ldx    $81                   ; 3
    sta    $D4,X                 ; 4
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD25A                 ; 2³
    inc    $88                   ; 5
LD25A:
    ldx    $88                   ; 3
    and    $91,X                 ; 4
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    dey                          ; 2
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    $80                   ; 3
    lda    $B0,X                 ; 4
    and    #$7E                  ; 2
    tax                          ; 2
    lda    LDF5A,X               ; 4
    ldx    $81                   ; 3
    sta    $D5,X                 ; 4
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD284                 ; 2³
    inc    $88                   ; 5
LD284:
    ldx    $88                   ; 3
    and    $91,X                 ; 4
    nop                          ; 2
    nop                          ; 2
    ldx    $80                   ; 3
    dey                          ; 2
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    $B0,X                 ; 4
    and    #$7E                  ; 2
    tax                          ; 2
    inx                          ; 2
    lda    LDF5A,X               ; 4
    ldx    $81                   ; 3
    sta    $D6,X                 ; 4
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD2AD                 ; 2³
    inc    $88                   ; 5
LD2AD:
    ldx    $88                   ; 3
    and    $91,X                 ; 4
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    dey                          ; 2
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    nop                          ; 2
    ldx    $80                   ; 3
    lda    $B0,X                 ; 4
    and    #$01                  ; 2
    asl                          ; 2
    asl                          ; 2
    ldx    $81                   ; 3
    sta    $D7,X                 ; 4
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD2D6                 ; 2³
    inc    $88                   ; 5
LD2D6:
    ldx    $88                   ; 3
    and    $91,X                 ; 4
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    dey                          ; 2
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    $80                   ; 3
    lda    $B9,X                 ; 4
    asl                          ; 2
    lda    #3                    ; 2
    adc    #0                    ; 2
    and    #$04                  ; 2
    ldx    $82                   ; 3
    sta    $D4,X                 ; 4
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD301                 ; 2³+1
    inc    $88                   ; 5
LD301:
    ldx    $88                   ; 3
    and    $91,X                 ; 4
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    dey                          ; 2
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    $80                   ; 3
    lda    $B9,X                 ; 4
    and    #$7E                  ; 2
    tax                          ; 2
    lda    LDF5A,X               ; 4
    ldx    $82                   ; 3
    sta    $D5,X                 ; 4
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD32B                 ; 2³
    inc    $88                   ; 5
LD32B:
    ldx    $88                   ; 3
    and    $91,X                 ; 4
    nop                          ; 2
    nop                          ; 2
    ldx    $80                   ; 3
    dey                          ; 2
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    $B9,X                 ; 4
    and    #$7E                  ; 2
    tax                          ; 2
    inx                          ; 2
    lda    LDF5A,X               ; 4
    ldx    $82                   ; 3
    sta    $D6,X                 ; 4
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD354                 ; 2³
    inc    $88                   ; 5
LD354:
    ldx    $88                   ; 3
    and    $91,X                 ; 4
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    dey                          ; 2
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    nop                          ; 2
    ldx    $80                   ; 3
    lda    $B9,X                 ; 4
    and    #$01                  ; 2
    asl                          ; 2
    asl                          ; 2
    ldx    $82                   ; 3
    sta    $D7,X                 ; 4
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD37D                 ; 2³
    inc    $88                   ; 5
LD37D:
    ldx    $88                   ; 3
    and    $91,X                 ; 4
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    colSolarCellLine_1_5  ; 3   load color for 1st line of solar cells
    sta    COLUPF                ; 3
    lda    $D4                   ; 3
    sta    PF1                   ; 3
    lda    $D5                   ; 3
    sta    PF2                   ; 3
    dey                          ; 2
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    $D7                   ; 3
    sta    PF1                   ; 3
    nop                          ; 2
    lda    $D6                   ; 3
    lda    $D6                   ; 3
    sta    PF2                   ; 3
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD3B0                 ; 2³
    inx                          ; 2
LD3B0:
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    and    $91,X                 ; 4
    sta    GRP1                  ; 3
    lda    colSolarCellLine_2_6  ; 3   load color for 2nd line of solar cells
    sta    COLUPF                ; 3
    lda    $D8                   ; 3
    sta    PF1                   ; 3
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    $D9                   ; 3
    sta    PF2                   ; 3
    lda    $DB                   ; 3
    sta    PF1                   ; 3
    lda    $DA                   ; 3
    sta    PF2                   ; 3
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD3D9                 ; 2³
    inx                          ; 2
LD3D9:
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    and    $91,X                 ; 4
    sta    GRP1                  ; 3
    lda    colSolarCellLine_3    ; 3   load color for 3rd line of solar cells
    sta    COLUPF                ; 3
    lda    $D4                   ; 3
    sta    PF1                   ; 3
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    $D5                   ; 3
    sta    PF2                   ; 3
    lda    $D7                   ; 3
    sta    PF1                   ; 3
    lda    $D6                   ; 3
    sta    PF2                   ; 3
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD402                 ; 2³
    inx                          ; 2
LD402:
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    and    $91,X                 ; 4
    sta    GRP1                  ; 3
    lda    colSolarCellLine_4    ; 3   load color for 4th line of solar cells
    sta    COLUPF                ; 3
    lda    $D8                   ; 3
    sta    PF1                   ; 3
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    $D9                   ; 3
    sta    PF2                   ; 3
    lda    $DB                   ; 3
    sta    PF1                   ; 3
    lda    $DA                   ; 3
    sta    PF2                   ; 3
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD42B                 ; 2³
    inx                          ; 2
LD42B:
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    and    $91,X                 ; 4
    sta    GRP1                  ; 3
    lda    colSolarCellLine_1_5  ; 3   load color for 5th line of solar cells
    sta    COLUPF                ; 3
    lda    $D4                   ; 3
    sta    PF1                   ; 3
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    $D5                   ; 3
    sta    PF2                   ; 3
    lda    $D7                   ; 3
    sta    PF1                   ; 3
    lda    $D6                   ; 3
    sta    PF2                   ; 3
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD454                 ; 2³
    inx                          ; 2
LD454:
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    and    $91,X                 ; 4
    sta    GRP1                  ; 3
    lda    colSolarCellLine_2_6  ; 3   load color for 6th line of solar cells
    sta    COLUPF                ; 3
    lda    $D8                   ; 3
    sta    PF1                   ; 3
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    $D9                   ; 3
    sta    PF2                   ; 3
    lda    $DB                   ; 3
    sta    PF1                   ; 3
    lda    $DA                   ; 3
    sta    PF2                   ; 3
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD47D                 ; 2³
    inx                          ; 2
LD47D:
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    and    $91,X                 ; 4
    sta    GRP1                  ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    jsr    Waste12Cycles         ;
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD49D                 ; 2³
    inx                          ; 2
LD49D:
    and    $91,X                 ; 4
    dey                          ; 2
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jsr    Waste12Cycles         ;
    nop                          ; 2
    nop                          ; 2
    inc    $80                   ; 5
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD4B9                 ; 2³
    inx                          ; 2
LD4B9:
    stx    $88                   ; 3
    and    $91,X                 ; 4
    ldx    $80                   ; 3
    dey                          ; 2
    cpx    #9                    ; 2
    beq    LD4C9                 ; 2³
    sta    GRP1                  ; 3
    jmp    LD23A                 ; 3

LD4C9:
    sta    GRP1                  ; 3
LD4CB:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    nop                          ; 2
    inc    $80                   ; 5
    dec    $80                   ; 5
    inc    $80                   ; 5
    dec    $80                   ; 5
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($E7),Y               ; 5
    sta    HMP1                  ; 3
    lsr                          ; 2
    bcc    LD4E5                 ; 2³
    inc    $88                   ; 5
LD4E5:
    ldx    $88                   ; 3
    and    $91,X                 ; 4
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    dey                          ; 2
    sta    GRP1                  ; 3
    bne    LD4CB                 ; 2³
LD4F1:
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    NUSIZ1                ; 3
    sty    REFP0                 ; 3
    lda    $DC                   ; 3
    and    #$7F                  ; 2
    sta    $83                   ; 3
    lda    #$9C                  ; 2
    sec                          ; 2
    sbc    $83                   ; 3
    jsr    CalcHorizPositon      ; 6
    sta    HMP1                  ; 3
LD50B:
    dex                          ; 2
    bne    LD50B                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #COL_BOTTOM_SENTINEL  ; 2
    sta    COLUP1                ; 3
    ldy    #1                    ; 2
LD51A:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $8A                   ; 3
    and    #$02                  ; 2
    bne    LD527                 ; 2³
    lda    SentinelGfx,Y         ; 4
    sta    GRP1                  ; 3
LD527:
    iny                          ; 2
    cpy    #7                    ; 2
    bne    LD51A                 ; 2³
LD52C:
    lda    $8A                   ; 3
    and    #$10                  ; 2
    beq    LD538                 ; 2³
    lda    $8A                   ; 3
    bpl    LD544                 ; 2³
    bmi    LD54B                 ; 3   always branch

LD538:
    lda    $E3                   ; 3
    and    #$08                  ; 2
    beq    LD544                 ; 2³
    lda    $8A                   ; 3
    and    #$20                  ; 2
    bne    LD54B                 ; 2³
LD544:
    ldx    #COL_RACK_LIVES_DEMO1 ; 2
    jsr    LD615                 ; 6
    beq    LD550                 ; 2³   might always branch

LD54B:
    ldx    #COL_BLUE_SCORE_DEMO2 ; 2
    jsr    DrawScore             ; 6
LD550:
    ldx    #$11                  ; 2
LD552:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LD552                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcc    LD56E                 ; 2³
    lda    $E7                   ; 3
    ldx    $E9                   ; 3
    sta    $E9                   ; 3
    stx    $E7                   ; 3
    lda    $E8                   ; 3
    ldx    $EA                   ; 3
    sta    $EA                   ; 3
    stx    $E8                   ; 3
LD56E:
    sta    WSYNC                 ; 3
;---------------------------------------
    inc    frameCounter          ; 5
    lda    #<LF3FE               ; 2   load indirect jump address
    sta    $80                   ; 3
    lda    #>LF3FE               ; 2
    sta    $81                   ; 3
    jmp    LDFF2                 ; 3   bankswitch, do indirect jump

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DrawScore SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$FF                  ; 2   start with $FF, so that Y correctly changes to 0 in the loop
    stx    COLUP0                ; 3
    stx    COLUP1                ; 3
    ldx    #6                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LD589:
    txa                          ; 2
    and    #$02                  ; 2
    beq    LD598                 ; 2³
    iny                          ; 2
    lda.wy scoreBCD,Y            ; 4   bits 7-5 get shifted into bits 3-1, all the other bits become zeros
    lsr                          ; 2
    lsr                          ; 2   i.e. [7654 3210] to [xxxx 765x], where all the x's represent zeros
    lsr                          ; 2    
    lsr                          ; 2
    bpl    LD59D                 ; 3   always branch

LD598:
    lda.wy scoreBCD,Y            ; 4   bits 3-0 get shifted into bits 4-1, all the other bits become zeros
    and    #$0F                  ; 2   i.e. [7654 3210] to [xxx3 210x], where all the x's represent zeros
LD59D:
    asl                          ; 2
    cpy    #1                    ; 2
    tay                          ; 2
    lda    NumberPtrsTab,Y       ; 4
    sta    $80,X                 ; 4
    lda    NumberPtrsTab+1,Y     ; 4
    sta    $81,X                 ; 4
    ldy    #0                    ; 2
    bcc    LD5B0                 ; 2³
    iny                          ; 2
LD5B0:
    dex                          ; 2
    dex                          ; 2
    bpl    LD589                 ; 2³
    
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$90                  ; 2
    sta    HMP0                  ; 3
    lda    #$A0                  ; 2
    sta    HMP1                  ; 3
    nop                          ; 2
    nop                          ; 2
    inc    $80                   ; 5
    dec    $80                   ; 5
    inc    $80                   ; 5
    dec    $80                   ; 5
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    ldx    #8                    ; 2
LD5D8:
    dex                          ; 2
    bne    LD5D8                 ; 2³
    inx                          ; 2
    stx    VDELP0                ; 3
    stx    VDELP1                ; 3
    ldy    #6                    ; 2
LD5E2:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($86),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($84),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($82),Y               ; 5
    sta    GRP0                  ; 3
    lda    Zero,Y                ; 4
    tax                          ; 2
    lda    ($80),Y               ; 5
    lda    ($80),Y               ; 5
    nop                          ; 2
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    LD5E2                 ; 2³+1
LD604:
    sta    WSYNC                 ; 3   jumped to from $D847
;---------------------------------------
LD606:
    lda    #0                    ; 2   jumped to from 4 different places
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD615 SUBROUTINE
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    COLUP0                ; 3
    stx    COLUP1                ; 3
    stx    COLUPF                ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    #$B0                  ; 2
    sta    HMP0                  ; 3
    lda    #$C0                  ; 2
    sta    HMP1                  ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    $8A                   ; 3
    and    #$10                  ; 2
    bne    LD641                 ; 2³
    lda    $E3                   ; 3
    and    #$08                  ; 2
    bne    LD641                 ; 2³
    jmp    LD7F7                 ; 3

LD641:
    lda    $8A                   ; 3
    and    #$20                  ; 2
    beq    LD64F                 ; 2³
    lda    $E4                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bpl    LD653                 ; 3   always branch

LD64F:
    lda    $E4                   ; 3
    and    #$0F                  ; 2
LD653:
    tax                          ; 2
    beq    LD657                 ; 2³
    dex                          ; 2
LD657:
    cpx    #5                    ; 2
    bcc    LD65D                 ; 2³
    ldx    #4                    ; 2
LD65D:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LD900,X               ; 4
    sta    $80                   ; 3
    lda    $8A                   ; 3
    and    #$10                  ; 2
    beq    LD66D                 ; 2³
    jmp    LD774                 ; 3

LD66D:
    lda    $8A                   ; 3
    and    #$04                  ; 2
    beq    LD676                 ; 2³
    jmp    LD774                 ; 3

LD676:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $E3                   ; 3
    and    #$20                  ; 2
    beq    LD6B5                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
LD680:
    lda    #0                    ; 2
    ldx    #$DB                  ; 2
LD684:
    sta    $86                   ; 3
    stx    $87                   ; 3
    ldy    #$24                  ; 2
    sty    $82                   ; 3
    sec                          ; 2
LD68D:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($86),Y               ; 5
    sta    GRP0                  ; 3
    ldx    #5                    ; 2
LD695:
    dex                          ; 2
    bne    LD695                 ; 2³
    lda    $80                   ; 3
    sta    PF1                   ; 3
    ldx    #2                    ; 2
LD69E:
    dex                          ; 2
    bne    LD69E                 ; 2³
    lda    $82                   ; 3
    sbc    #6                    ; 2
    sta    $82                   ; 3
    sta    $82                   ; 3
    tay                          ; 2
    lda    #0                    ; 2
    sta    PF1                   ; 3
    bcs    LD68D                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    LD606                 ; 3

LD6B5:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $AE                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    beq    LD680                 ; 2³
    cpx    #1                    ; 2
    bne    LD6D7                 ; 2³
    lda    $8A                   ; 3
    and    #$02                  ; 2
    beq    LD6D1                 ; 2³
    lda    #$C6                  ; 2
    ldx    #$DE                  ; 2
    bne    LD684                 ; 3   always branch

LD6D1:
    lda    #$9C                  ; 2
    ldx    #$DE                  ; 2
    bne    LD684                 ; 3   always branch

LD6D7:
    lda    LDFDA-2,X             ; 4   X > 1
    sta    NUSIZ0                ; 3
    lda    LDFDF-2,X             ; 4
    sta    NUSIZ1                ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    ldx    #1                    ; 2
    stx    VDELP0                ; 3
    stx    VDELP1                ; 3
    ldx    #$24                  ; 2
    stx    $82                   ; 3
    sec                          ; 2
    lda    $8A                   ; 3
    and    #$02                  ; 2
    bne    LD734                 ; 2³+1
    lda    Skip_A_Rack+5,X       ; 4
    sta    $81                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
LD6FC:
    lda    Skip_A_Rack,X         ; 4
    sta    GRP0                  ; 3
    lda    Skip_A_Rack+1,X       ; 4
    sta    GRP1                  ; 3
    lda    Skip_A_Rack+2,X       ; 4
    sta    GRP0                  ; 3
    lda    Skip_A_Rack+3,X       ; 4
    ldy    Skip_A_Rack+4,X       ; 4
    ldx    $81                   ; 3
    sta    GRP1                  ; 3
    sty    GRP0                  ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    $80                   ; 3
    sta    PF1                   ; 3
    lda    $82                   ; 3
    sbc    #6                    ; 2
    sta    $82                   ; 3
    tax                          ; 2
    lda    Skip_A_Rack+5,X       ; 4
    sta    $81                   ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    bcs    LD6FC                 ; 2³+1
    jmp    LD606                 ; 3

LD734:
    lda    Challenge+5,X         ; 4
    sta    $81                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
LD73B:
    lda    Challenge,X           ; 4
    sta    GRP0                  ; 3
    lda    Challenge+1,X         ; 4
    sta    GRP1                  ; 3
    lda    Challenge+2,X         ; 4
    sta    GRP0                  ; 3
    lda    Challenge+3,X         ; 4
    ldy    Challenge+4,X         ; 4
    ldx    $81                   ; 3
    sta    GRP1                  ; 3
    sty    GRP0                  ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    $80                   ; 3
    sta    PF1                   ; 3
    lda    $82                   ; 3
    sbc    #6                    ; 2
    sta    $82                   ; 3
    ldx    $82                   ; 3
    lda    Challenge+5,X         ; 4
    sta    $81                   ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    bcs    LD73B                 ; 2³
    jmp    LD606                 ; 3

LD774:
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    lda    #1                    ; 2
    sta    NUSIZ1                ; 3
    lda    $AA                   ; 3
    sec                          ; 2
LD77F:
    sbc    #$64                  ; 2
    bcs    LD77F                 ; 2³
    adc    #$64                  ; 2
    sta    $81                   ; 3
    ldx    #$FF                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LD78B:
    sbc    #$0A                  ; 2
    inx                          ; 2
    bcs    LD78B                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $81                   ; 3
    adc    LDFE4,X               ; 4
    tax                          ; 2
    and    #$F0                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    bne    LD7A2                 ; 2³
    sty    NUSIZ1                ; 3
LD7A2:
    lda    NumberPtrsTab,Y       ; 4
    sta    $86                   ; 3
    lda    NumberPtrsTab+1,Y     ; 4
    sta    $87                   ; 3
    txa                          ; 2
    and    #$0F                  ; 2
    asl                          ; 2
    tay                          ; 2
    lda    NumberPtrsTab,Y       ; 4
    sta    $84                   ; 3
    lda    NumberPtrsTab+1,Y     ; 4
    sta    $85                   ; 3
    ldy    #6                    ; 2
    sty    $82                   ; 3
    lda    ($84),Y               ; 5
    sta    $81                   ; 3
LD7C3:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    RackGfxOne,Y          ; 4
    sta    GRP0                  ; 3
    lda    RackGfxTwo,Y          ; 4
    sta    GRP1                  ; 3
    ldx    RackGfxThree,Y        ; 4
    lda    ($86),Y               ; 5
    ldy    $81                   ; 3
    dec    $83                   ; 5
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    sty    GRP0                  ; 3
    lda    $80                   ; 3
    sta    PF1                   ; 3
    dec    $82                   ; 5
    ldy    $82                   ; 3
    lda    ($84),Y               ; 5
    sta    $81                   ; 3
    lda    #0                    ; 2
    cpy    #$FF                  ; 2
    sta    PF1                   ; 3
    bne    LD7C3                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    LD606                 ; 3

LD7F7:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #1                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    $E3                   ; 3
    and    #$24                  ; 2
    beq    LD811                 ; 2³
    cmp    #4                    ; 2
    beq    LD815                 ; 2³
    cmp    #$20                  ; 2
    beq    LD819                 ; 2³
    ldy    #8                    ; 2
    bne    LD81B                 ; 3   always branch

LD811:
    ldy    #2                    ; 2
    bne    LD81B                 ; 3   always branch

LD815:
    ldy    #4                    ; 2
    bne    LD81B                 ; 3   always branch

LD819:
    ldy    #6                    ; 2
LD81B:
    lda    NumberPtrsTab,Y       ; 4
    sta    $86                   ; 3
    lda    NumberPtrsTab+1,Y     ; 4
    sta    $87                   ; 3
    ldy    #6                    ; 2
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
LD82B:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    GameGfxOne,Y          ; 4
    sta    GRP0                  ; 3
    lda    GameGfxTwo,Y          ; 4
    sta    GRP1                  ; 3
    lda    GameGfxThree,Y        ; 4
    tax                          ; 2
    lda    ($86),Y               ; 5
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    dey                          ; 2
    bpl    LD82B                 ; 2³
    jmp    LD604                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DrawTitleScreenText SUBROUTINE

.loopDrawText
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    TitleScreenText,Y     ; 4
    sta    GRP0                  ; 3
    lda    TitleScreenText+1,Y   ; 4
    sta    GRP1                  ; 3
    lda    TitleScreenText+2,Y   ; 4
    ldx    TitleScreenText+3,Y   ; 4
    ldy    $82                   ; 3
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    sty    $82                   ; 3
    ldy    $81                   ; 3
    nop                          ; 2
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    sty    GRP0                  ; 3
    ldy    $82                   ; 3
    ldx    TitleScreenText+4,Y   ; 4
    stx    $81                   ; 3
    cpy    $83                   ;+3 = @65
    bne    .loopDrawText         ; 2³

    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3   three blank scanlines for text seperation
    sta    WSYNC                 ; 3
;---------------------------------------
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CalcHorizPositon SUBROUTINE

    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$FF                  ; 2   starting X below 0 correctly balances the count 
    sec                          ; 2
    
.loopDivideFifteen:
    sbc    #$0F                  ; 2   divide the position by 15
    inx                          ; 2   X counts number of times through loop, used for rough positioning
    bcs    .loopDivideFifteen    ; 2³
    
    sta    WSYNC                 ; 3
;---------------------------------------
    adc    #$0F                  ; 2   now do the fine positioning calculation
    eor    #$07                  ; 2   
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
Waste12Cycles SUBROUTINE
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $E1 ; |XXX    X| $D89D
    .byte $40 ; | X      | $D89E
    .byte $85 ; |X    X X| $D89F
    .byte $7E ; | XXXXXX | $D8A0
    .byte $C4 ; |XX   X  | $D8A1
    .byte $BE ; |X XXXXX | $D8A2
    .byte $F0 ; |XXXX    | $D8A3
    .byte $10 ; |   X    | $D8A4
    .byte $B2 ; |X XX  X | $D8A5
    .byte $6C ; | XX XX  | $D8A6
    .byte $0F ; |    XXXX| $D8A7
    .byte $21 ; |  X    X| $D8A8
    .byte $30 ; |  XX    | $D8A9
    .byte $0A ; |    X X | $D8AA
    .byte $36 ; |  XX XX | $D8AB
    .byte $B8 ; |X XXX   | $D8AC
    .byte $A3 ; |X X   XX| $D8AD
    .byte $C3 ; |XX    XX| $D8AE
    .byte $B1 ; |X XX   X| $D8AF
    .byte $50 ; | X X    | $D8B0
    .byte $F4 ; |XXXX X  | $D8B1
    .byte $D2 ; |XX X  X | $D8B2
    .byte $65 ; | XX  X X| $D8B3
    .byte $74 ; | XXX X  | $D8B4
    .byte $E0 ; |XXX     | $D8B5
    .byte $42 ; | X    X | $D8B6
    .byte $E0 ; |XXX     | $D8B7
    .byte $16 ; |   X XX | $D8B8
    .byte $00 ; |        | $D8B9
    .byte $00 ; |        | $D8BA
    .byte $E4 ; |XXX  X  | $D8BB
    .byte $39 ; |  XXX  X| $D8BC
    .byte $53 ; | X X  XX| $D8BD
    .byte $CB ; |XX  X XX| $D8BE
    .byte $20 ; |  X     | $D8BF
    .byte $79 ; | XXXX  X| $D8C0
    .byte $D9 ; |XX XX  X| $D8C1
    .byte $29 ; |  X X  X| $D8C2
    .byte $21 ; |  X    X| $D8C3
    .byte $1A ; |   XX X | $D8C4
    .byte $42 ; | X    X | $D8C5
    .byte $78 ; | XXXX   | $D8C6
    .byte $C0 ; |XX      | $D8C7
    .byte $26 ; |  X  XX | $D8C8
    .byte $43 ; | X    XX| $D8C9
    .byte $92 ; |X  X  X | $D8CA
    .byte $47 ; | X   XXX| $D8CB
    .byte $0B ; |    X XX| $D8CC
    .byte $D5 ; |XX X X X| $D8CD
    .byte $5D ; | X XXX X| $D8CE
    .byte $05 ; |     X X| $D8CF
    .byte $00 ; |        | $D8D0
    .byte $20 ; |  X     | $D8D1
    .byte $20 ; |  X     | $D8D2
    .byte $95 ; |X  X X X| $D8D3
    .byte $0E ; |    XXX | $D8D4
    .byte $80 ; |X       | $D8D5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      XXX   XXX  X   X XXXXX
;     X   X X   X XX XX X
;     X     X   X X X X X
;     X     XXXXX X   X XXXX
;     X XXX X   X X   X X
;     X   X X   X X   X X
;      XXX  X   X X   X XXXXX

GameGfxOne:
    .byte $72 ; | XXX  X | $D8D6
    .byte $8A ; |X   X X | $D8D7
    .byte $BA ; |X XXX X | $D8D8
    .byte $83 ; |X     XX| $D8D9
    .byte $82 ; |X     X | $D8DA
    .byte $8A ; |X   X X | $D8DB
    .byte $71 ; | XXX   X| $D8DC
GameGfxTwo:
    .byte $28 ; |  X X   | $D8DD
    .byte $28 ; |  X X   | $D8DE
    .byte $28 ; |  X X   | $D8DF
    .byte $E8 ; |XXX X   | $D8E0
    .byte $2A ; |  X X X | $D8E1
    .byte $2D ; |  X XX X| $D8E2
    .byte $C8 ; |XX  X   | $D8E3
GameGfxThree:
    .byte $BE ; |X XXXXX | $D8E4
    .byte $A0 ; |X X     | $D8E5
    .byte $A0 ; |X X     | $D8E6
    .byte $BC ; |X XXXX  | $D8E7
    .byte $A0 ; |X X     | $D8E8
    .byte $A0 ; |X X     | $D8E9
    .byte $BE ; |X XXXXX | $D8EA

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;     XXXX   XXX   XXX  X   X
;     X   X X   X X   X X  X
;     X   X X   X X     X X
;     XXXX  XXXXX X     XX
;     X X   X   X X     X X
;     X  X  X   X X   X X  X
;     X   X X   X  XXX  X   X

RackGfxOne:
    .byte $8A ; |X   X X | $D8EB
    .byte $92 ; |X  X  X | $D8EC
    .byte $A2 ; |X X   X | $D8ED
    .byte $F3 ; |XXXX  XX| $D8EE
    .byte $8A ; |X   X X | $D8EF
    .byte $8A ; |X   X X | $D8F0
    .byte $F1 ; |XXXX   X| $D8F1
RackGfxTwo:
    .byte $27 ; |  X  XXX| $D8F2
    .byte $28 ; |  X X   | $D8F3
    .byte $28 ; |  X X   | $D8F4
    .byte $E8 ; |XXX X   | $D8F5
    .byte $28 ; |  X X   | $D8F6
    .byte $28 ; |  X X   | $D8F7
    .byte $C7 ; |XX   XXX| $D8F8
RackGfxThree:
    .byte $22 ; |  X   X | $D8F9
    .byte $A4 ; |X X  X  | $D8FA
    .byte $28 ; |  X X   | $D8FB
    .byte $30 ; |  XX    | $D8FC
    .byte $28 ; |  X X   | $D8FD
    .byte $A4 ; |X X  X  | $D8FE
    .byte $22 ; |  X   X | $D8FF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD900:
    .byte $00 ; |        | $D900
    .byte $01 ; |       X| $D901
    .byte $05 ; |     X X| $D902
    .byte $15 ; |   X X X| $D903
    .byte $55 ; | X X X X| $D904

SentinelGfx:
    .byte $00 ; |        | $D905
    .byte $42 ; | X    X | $D906
    .byte $DB ; |XX XX XX| $D907
    .byte $99 ; |X  XX  X| $D908
    .byte $FF ; |XXXXXXXX| $D909
    .byte $FF ; |XXXXXXXX| $D90A
    .byte $00 ; |        | $D90B

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;     X  X    XXXX    X       XXX      XX     XXXX
;     X  X    X       X        X      X  X    X
;     XXXX    XXX     X        X      X  X    XXXX
;     X  X    X       X        X      X  X       X
;     X  X    XXXX    XXXX    XXX      XX     XXXX

HeliosGfx:
    .byte $24 ; |  X  X  | $D90C   Mystery word programmed in cartridge,
    .byte $24 ; |  X  X  | $D90D   CBS advertised this keyword was needed
    .byte $3C ; |  XXXX  | $D90E   to win some prizes from them.
    .byte $24 ; |  X  X  | $D90F   Helios is the Greek word for "sun", and sun
    .byte $24 ; |  X  X  | $D910   certainly relates to "solar".

    .byte $3C ; |  XXXX  | $D911
    .byte $20 ; |  X     | $D912
    .byte $38 ; |  XXX   | $D913
    .byte $20 ; |  X     | $D914
    .byte $3C ; |  XXXX  | $D915

    .byte $3C ; |  XXXX  | $D916
    .byte $20 ; |  X     | $D917
    .byte $20 ; |  X     | $D918
    .byte $20 ; |  X     | $D919
    .byte $20 ; |  X     | $D91A

    .byte $38 ; |  XXX   | $D91B
    .byte $10 ; |   X    | $D91C
    .byte $10 ; |   X    | $D91D
    .byte $10 ; |   X    | $D91E
    .byte $38 ; |  XXX   | $D91F

    .byte $18 ; |   XX   | $D920
    .byte $24 ; |  X  X  | $D921
    .byte $24 ; |  X  X  | $D922
    .byte $24 ; |  X  X  | $D923
    .byte $18 ; |   XX   | $D924

    .byte $3C ; |  XXXX  | $D925
    .byte $04 ; |     X  | $D926
    .byte $3C ; |  XXXX  | $D927
    .byte $20 ; |  X     | $D928
    .byte $3C ; |  XXXX  | $D929

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD92A:
    .byte $00 ; |        | $D92A
    .byte $F0 ; |XXXX    | $D92B
    .byte $E0 ; |XXX     | $D92C
    .byte $D0 ; |XX X    | $D92D
    .byte $C0 ; |XX      | $D92E
    .byte $B0 ; |X XX    | $D92F
    .byte $A0 ; |X X     | $D930
    .byte $B0 ; |X XX    | $D931
    .byte $C0 ; |XX      | $D932
    .byte $D0 ; |XX X    | $D933
    .byte $E0 ; |XXX     | $D934
    .byte $F0 ; |XXXX    | $D935
LD936:
    .byte $00 ; |        | $D936
    .byte $10 ; |   X    | $D937
    .byte $20 ; |  X     | $D938
    .byte $30 ; |  XX    | $D939
    .byte $40 ; | X      | $D93A
    .byte $50 ; | X X    | $D93B
    .byte $60 ; | XX     | $D93C
    .byte $50 ; | X X    | $D93D
    .byte $40 ; | X      | $D93E
    .byte $30 ; |  XX    | $D93F
    .byte $20 ; |  X     | $D940
    .byte $10 ; |   X    | $D941
LD942:
    .byte $49 ; | X  X  X| $D942   positioning values
    .byte $47 ; | X   XXX| $D943
    .byte $45 ; | X   X X| $D944
    .byte $43 ; | X    XX| $D945
    .byte $41 ; | X     X| $D946
    .byte $3F ; |  XXXXXX| $D947
    .byte $3D ; |  XXXX X| $D948
    .byte $3D ; |  XXXX X| $D949
    .byte $3D ; |  XXXX X| $D94A
    .byte $3D ; |  XXXX X| $D94B
    .byte $3D ; |  XXXX X| $D94C
    .byte $3D ; |  XXXX X| $D94D
    .byte $3D ; |  XXXX X| $D94E
    .byte $3B ; |  XXX XX| $D94F
    .byte $39 ; |  XXX  X| $D950
    .byte $37 ; |  XX XXX| $D951
    .byte $35 ; |  XX X X| $D952
    .byte $33 ; |  XX  XX| $D953
    .byte $31 ; |  XX   X| $D954
    .byte $31 ; |  XX   X| $D955
    .byte $31 ; |  XX   X| $D956
    .byte $31 ; |  XX   X| $D957
    .byte $31 ; |  XX   X| $D958
    .byte $31 ; |  XX   X| $D959
    .byte $31 ; |  XX   X| $D95A
    .byte $2F ; |  X XXXX| $D95B
    .byte $2D ; |  X XX X| $D95C
    .byte $2B ; |  X X XX| $D95D
    .byte $29 ; |  X X  X| $D95E
    .byte $27 ; |  X  XXX| $D95F
    .byte $25 ; |  X  X X| $D960
    .byte $25 ; |  X  X X| $D961
    .byte $25 ; |  X  X X| $D962
    .byte $25 ; |  X  X X| $D963
    .byte $25 ; |  X  X X| $D964
    .byte $25 ; |  X  X X| $D965
    .byte $25 ; |  X  X X| $D966
    .byte $23 ; |  X   XX| $D967
    .byte $21 ; |  X    X| $D968
    .byte $1F ; |   XXXXX| $D969
    .byte $1D ; |   XXX X| $D96A
    .byte $1B ; |   XX XX| $D96B
    .byte $19 ; |   XX  X| $D96C
    .byte $19 ; |   XX  X| $D96D
    .byte $19 ; |   XX  X| $D96E
    .byte $19 ; |   XX  X| $D96F
    .byte $19 ; |   XX  X| $D970
    .byte $19 ; |   XX  X| $D971
    .byte $19 ; |   XX  X| $D972
    .byte $19 ; |   XX  X| $D973
    .byte $19 ; |   XX  X| $D974
    .byte $19 ; |   XX  X| $D975
    .byte $19 ; |   XX  X| $D976
    .byte $19 ; |   XX  X| $D977
    .byte $19 ; |   XX  X| $D978
    .byte $19 ; |   XX  X| $D979
    .byte $19 ; |   XX  X| $D97A
    .byte $19 ; |   XX  X| $D97B
    .byte $19 ; |   XX  X| $D97C
    .byte $19 ; |   XX  X| $D97D
    .byte $19 ; |   XX  X| $D97E
    .byte $1B ; |   XX XX| $D97F
    .byte $1D ; |   XXX X| $D980
    .byte $1F ; |   XXXXX| $D981
    .byte $21 ; |  X    X| $D982
    .byte $23 ; |  X   XX| $D983
    .byte $25 ; |  X  X X| $D984
    .byte $25 ; |  X  X X| $D985
    .byte $25 ; |  X  X X| $D986
    .byte $25 ; |  X  X X| $D987
    .byte $25 ; |  X  X X| $D988
    .byte $25 ; |  X  X X| $D989
    .byte $25 ; |  X  X X| $D98A
    .byte $27 ; |  X  XXX| $D98B
    .byte $29 ; |  X X  X| $D98C
    .byte $2B ; |  X X XX| $D98D
    .byte $2D ; |  X XX X| $D98E
    .byte $2F ; |  X XXXX| $D98F
    .byte $31 ; |  XX   X| $D990
    .byte $31 ; |  XX   X| $D991
    .byte $31 ; |  XX   X| $D992
    .byte $31 ; |  XX   X| $D993
    .byte $31 ; |  XX   X| $D994
    .byte $31 ; |  XX   X| $D995
    .byte $31 ; |  XX   X| $D996
    .byte $33 ; |  XX  XX| $D997
    .byte $35 ; |  XX X X| $D998
    .byte $37 ; |  XX XXX| $D999
    .byte $39 ; |  XXX  X| $D99A
    .byte $3B ; |  XXX XX| $D99B
    .byte $3D ; |  XXXX X| $D99C
    .byte $3D ; |  XXXX X| $D99D
    .byte $3D ; |  XXXX X| $D99E
    .byte $3D ; |  XXXX X| $D99F
    .byte $3D ; |  XXXX X| $D9A0
    .byte $3D ; |  XXXX X| $D9A1
LD9A2:
    .byte $00 ; |        | $D9A2   positioning values
    .byte $49 ; | X  X  X| $D9A3
    .byte $49 ; | X  X  X| $D9A4
    .byte $49 ; | X  X  X| $D9A5
    .byte $49 ; | X  X  X| $D9A6
    .byte $49 ; | X  X  X| $D9A7
    .byte $49 ; | X  X  X| $D9A8
    .byte $4B ; | X  X XX| $D9A9
    .byte $4D ; | X  XX X| $D9AA
    .byte $4F ; | X  XXXX| $D9AB
    .byte $51 ; | X X   X| $D9AC
    .byte $53 ; | X X  XX| $D9AD
    .byte $55 ; | X X X X| $D9AE
    .byte $55 ; | X X X X| $D9AF
    .byte $55 ; | X X X X| $D9B0
    .byte $55 ; | X X X X| $D9B1
    .byte $55 ; | X X X X| $D9B2
    .byte $55 ; | X X X X| $D9B3
    .byte $55 ; | X X X X| $D9B4
    .byte $57 ; | X X XXX| $D9B5
    .byte $59 ; | X XX  X| $D9B6
    .byte $5B ; | X XX XX| $D9B7
    .byte $5D ; | X XXX X| $D9B8
    .byte $5F ; | X XXXXX| $D9B9
    .byte $61 ; | XX    X| $D9BA
    .byte $61 ; | XX    X| $D9BB
    .byte $61 ; | XX    X| $D9BC
    .byte $61 ; | XX    X| $D9BD
    .byte $61 ; | XX    X| $D9BE
    .byte $61 ; | XX    X| $D9BF
    .byte $61 ; | XX    X| $D9C0
    .byte $63 ; | XX   XX| $D9C1
    .byte $65 ; | XX  X X| $D9C2
    .byte $67 ; | XX  XXX| $D9C3
    .byte $69 ; | XX X  X| $D9C4
    .byte $6B ; | XX X XX| $D9C5
    .byte $6D ; | XX XX X| $D9C6
    .byte $6D ; | XX XX X| $D9C7
    .byte $6D ; | XX XX X| $D9C8
    .byte $6D ; | XX XX X| $D9C9
    .byte $6D ; | XX XX X| $D9CA
    .byte $6D ; | XX XX X| $D9CB
    .byte $6D ; | XX XX X| $D9CC
    .byte $6D ; | XX XX X| $D9CD
    .byte $6D ; | XX XX X| $D9CE
    .byte $6D ; | XX XX X| $D9CF
    .byte $6D ; | XX XX X| $D9D0
    .byte $6D ; | XX XX X| $D9D1
    .byte $6D ; | XX XX X| $D9D2
    .byte $6D ; | XX XX X| $D9D3
    .byte $6D ; | XX XX X| $D9D4
    .byte $6D ; | XX XX X| $D9D5
    .byte $6D ; | XX XX X| $D9D6
    .byte $6D ; | XX XX X| $D9D7
    .byte $6D ; | XX XX X| $D9D8
    .byte $6B ; | XX X XX| $D9D9
    .byte $69 ; | XX X  X| $D9DA
    .byte $67 ; | XX  XXX| $D9DB
    .byte $65 ; | XX  X X| $D9DC
    .byte $63 ; | XX   XX| $D9DD
    .byte $61 ; | XX    X| $D9DE
    .byte $61 ; | XX    X| $D9DF
    .byte $61 ; | XX    X| $D9E0
    .byte $61 ; | XX    X| $D9E1
    .byte $61 ; | XX    X| $D9E2
    .byte $61 ; | XX    X| $D9E3
    .byte $61 ; | XX    X| $D9E4
    .byte $5F ; | X XXXXX| $D9E5
    .byte $5D ; | X XXX X| $D9E6
    .byte $5B ; | X XX XX| $D9E7
    .byte $59 ; | X XX  X| $D9E8
    .byte $57 ; | X X XXX| $D9E9
    .byte $55 ; | X X X X| $D9EA
    .byte $55 ; | X X X X| $D9EB
    .byte $55 ; | X X X X| $D9EC
    .byte $55 ; | X X X X| $D9ED
    .byte $55 ; | X X X X| $D9EE
    .byte $55 ; | X X X X| $D9EF
    .byte $55 ; | X X X X| $D9F0
    .byte $53 ; | X X  XX| $D9F1
    .byte $51 ; | X X   X| $D9F2
    .byte $4F ; | X  XXXX| $D9F3
    .byte $4D ; | X  XX X| $D9F4
    .byte $4B ; | X  X XX| $D9F5
    .byte $49 ; | X  X  X| $D9F6
    .byte $49 ; | X  X  X| $D9F7
    .byte $49 ; | X  X  X| $D9F8
    .byte $49 ; | X  X  X| $D9F9
    .byte $49 ; | X  X  X| $D9FA
    .byte $49 ; | X  X  X| $D9FB
    .byte $49 ; | X  X  X| $D9FC
    .byte $47 ; | X   XXX| $D9FD
    .byte $45 ; | X   X X| $D9FE
    .byte $43 ; | X    XX| $D9FF
    .byte $41 ; | X     X| $DA00
    .byte $3F ; |  XXXXXX| $DA01
    .byte $3D ; |  XXXX X| $DA02

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TitleScreenText:


;    XXXX                                     | DA26 | DA27 | DA28 | DA29 | DA2A |
;   X    X    X XXX XXX X   X XXX XXX XXX     | DA21 | DA22 | DA23 | DA24 | DA25 |
;  X  XX  X   X X X X X X   X X X X X   X     | DA1C | DA1D | DA1E | DA1F | DA20 |
;  X X    X   X XXX XXX X   X XXX XXX  XX     | DA17 | DA18 | DA19 | DA1A | DA1B |
;  X X    X   X   X X X X   X   X X X   X     | DA12 | DA13 | DA14 | DA15 | DA16 |
;  X  XX  X   X XXX XXX X X X XXX XXX XXX     | DA0D | DA0E | DA0F | DA10 | DA11 |
;   X    X                X                   | DA08 | DA09 | DA0A | DA0B | DA0C |
;    XXXX                                     | DA03 | DA04 | DA05 | DA06 | DA07 |


    .byte $1E,$00,$00,$00,$00   ; $DA03 - $DA07   bottom
    .byte $21,$00,$00,$80,$00   ; $DA08 - $DA0C
    .byte $4C,$8B,$BA,$AE,$EE   ; $DA0D - $DA11
    .byte $50,$88,$AA,$22,$A2   ; $DA12 - $DA16
    .byte $50,$8B,$BA,$2E,$E6   ; $DA17 - $DA1B
    .byte $4C,$8A,$AA,$2A,$A2   ; $DA1C - $DA20
    .byte $21,$0B,$BA,$2E,$EE   ; $DA21 - $DA25
    .byte $1E,$00,$00,$00,$00   ; $DA26 - $DA2A   top

;---------------------------------
;
; XX XX X XX  X   X XXX X X   XX XX XX        | DA49 | DA4A | DA4B | DA4C | DA4D |
; X X X X X X X   X X X X X   X X X X         | DA44 | DA45 | DA46 | DA47 | DA48 |
; X X X X X X X X X XXX  X    X X X XX XXX    | DA3F | DA40 | DA41 | DA42 | DA43 |
; X   X X X X X X X X X  X    X   X X  X X    | DA3A | DA3B | DA3C | DA3D | DA3E |
; X   X X XX   XXX  X X  X    X   X X  XXX    | DA35 | DA36 | DA37 | DA38 | DA39 |
;                                        X    | DA30 | DA31 | DA32 | DA33 | DA34 |
;                                       XX    | DA2B | DA2C | DA2D | DA2E | DA2F |


    .byte $00,$00,$00,$00,$03   ; $DA2B - $DA2F   bottom
    .byte $00,$00,$00,$00,$01   ; $DA30 - $DA34
    .byte $8A,$C7,$29,$08,$A7   ; $DA35 - $DA39
    .byte $8A,$AA,$A9,$08,$A5   ; $DA3A - $DA3E
    .byte $AA,$AA,$B9,$0A,$B7   ; $DA3F - $DA43
    .byte $AA,$A8,$AA,$8A,$A0   ; $DA44 - $DA48
    .byte $DA,$C8,$BA,$8D,$B0   ; $DA49 - $DA4D   top

;---------------------------------
;
;           XXX         XX                    | DA8A | DA8B | DA8C | DA8D | DA8E |
;         XX   X       X  X  XX               | DA85 | DA86 | DA87 | DA88 | DA89 |
;        X     X       X  X X  X              | DA80 | DA81 | DA82 | DA83 | DA84 |
;        X X  X       X  X  X  X              | DA7B | DA7C | DA7D | DA7E | DA7F |
;        X X X     XX X  X X  X               | DA76 | DA77 | DA78 | DA79 | DA7A |
;       X  X  X   X   X X  X  X  X  X         | DA71 | DA72 | DA73 | DA74 | DA75 |
;       X  X   X X  X XX   X X  XX  X         | DA6C | DA6D | DA6E | DA6F | DA70 |
;       X X X  X X  X XXX  XX   X  XX         | DA67 | DA68 | DA69 | DA6A | DA6B |
;       XXX  XX   XX X  XXX XXXXXXXX          | DA62 | DA63 | DA64 | DA65 | DA66 |
;                                  X          | DA5D | DA5E | DA5F | DA60 | DA61 |
;                                 X           | DA58 | DA59 | DA5A | DA5B | DA5C |
;                                X            | DA53 | DA54 | DA55 | DA56 | DA57 |
;                                             | DA4E | DA4F | DA50 | DA51 | DA52 |


    .byte $00,$00,$00,$00,$00   ; $DA4E - $DA52   bottom
    .byte $00,$00,$00,$01,$00   ; $DA53 - $DA57
    .byte $00,$00,$00,$00,$80   ; $DA58 - $DA5C
    .byte $00,$00,$00,$00,$40   ; $DA5D - $DA61
    .byte $03,$98,$D3,$BF,$C0   ; $DA62 - $DA66
    .byte $02,$A5,$2E,$62,$60   ; $DA67 - $DA6B
    .byte $02,$45,$2C,$53,$20   ; $DA6C - $DA70
    .byte $02,$48,$8A,$49,$20   ; $DA71 - $DA75
    .byte $01,$50,$69,$48,$00   ; $DA76 - $DA7A
    .byte $01,$48,$09,$24,$00   ; $DA7B - $DA7F
    .byte $01,$04,$04,$A4,$00   ; $DA80 - $DA84
    .byte $00,$C4,$04,$98,$00   ; $DA85 - $DA89
    .byte $00,$38,$03,$00,$00   ; $DA8A - $DA8E   top

;---------------------------------
;
; XXXXXXX XXXXXXX X          XX    XXXXXX     | DABC | DABD | DABE | DABF | DAC0 |
; X       X     X X         X  X   X    X     | DAB7 | DAB8 | DAB9 | DABA | DABB |
; XXXXXXX X     X X         X  X   X    X     | DAB2 | DAB3 | DAB4 | DAB5 | DAB6 |
;       X X     X X        XXXXXX  XXXXX      | DAAD | DAAE | DAAF | DAB0 | DAB1 |
; XXXXXXX XXXXXXX XXXXXXX XX    XX X    XX    | DAA8 | DAA9 | DAAA | DAAB | DAAC |
;         XXXXXXX XXXXXXX X      X            | DAA3 | DAA4 | DAA5 | DAA6 | DAA7 |
;         X       X     X  XX  XX             | DA9E | DA9F | DAA0 | DAA1 | DAA2 |
;         XXXXX   X     X    XX               | DA99 | DA9A | DA9B | DA9C | DA9D |
;         X       X     X  XX  XX             | DA94 | DA95 | DA96 | DA97 | DA98 |
;         X       XXXXXXX X      X            | DA8F | DA90 | DA91 | DA92 | DA93 |


    .byte $00,$80,$FE,$81,$00   ; $DA8F - $DA93   bottom
    .byte $00,$80,$82,$66,$00   ; $DA94 - $DA98
    .byte $00,$F8,$82,$18,$00   ; $DA99 - $DA9D
    .byte $00,$80,$82,$66,$00   ; $DA9E - $DAA2
    .byte $00,$FE,$FE,$81,$00   ; $DAA3 - $DAA7
    .byte $FE,$FE,$FE,$C3,$43   ; $DAA8 - $DAAC
    .byte $02,$82,$80,$7E,$7C   ; $DAAD - $DAB1
    .byte $FE,$82,$80,$24,$42   ; $DAB2 - $DAB6
    .byte $80,$82,$80,$24,$42   ; $DAB7 - $DABB
    .byte $FE,$FE,$80,$18,$7E   ; $DABC - $DAC0   top

;---------------------------------
;
;              XXX  XXX   XXXX                | DAF3 | DAF4 | DAF5 | DAF6 | DAF7 |
;             X     X X   X                   | DAEE | DAEF | DAF0 | DAF1 | DAF2 |
;             X     XXX   XX                  | DAE9 | DAEA | DAEB | DAEC | DAED |
;             X     X  X    XX                | DAE4 | DAE5 | DAE6 | DAE7 | DAE8 |
;             X     X  X     X                | DADF | DAE0 | DAE1 | DAE2 | DAE3 |
;              XXX  XXXX  XXXX                | DADA | DADB | DADC | DADD | DADE |
;     XXX XXX XXX XXX XXX X  X XXX XXX        | DAD5 | DAD6 | DAD7 | DAD8 | DAD9 |
;     X X X X X   X   X   XX X  X  X          | DAD0 | DAD1 | DAD2 | DAD3 | DAD4 |
;     XXX XX  XX  XXX XX  X XX  X  XXX        | DACB | DACC | DACD | DACE | DACF |
;     X   X X X     X X   X  X  X    X        | DAC6 | DAC7 | DAC8 | DAC9 | DACA |
;     X   X X XXX XX  XXX X  X  X  XXX        | DAC1 | DAC2 | DAC3 | DAC4 | DAC5 |


    .byte $08,$AE,$CE,$92,$70   ; $DAC1 - $DAC5   bottom
    .byte $08,$A8,$28,$92,$10   ; $DAC6 - $DACA
    .byte $0E,$CC,$EC,$B2,$70   ; $DACB - $DACF
    .byte $0A,$A8,$88,$D2,$40   ; $DAD0 - $DAD4
    .byte $0E,$EE,$EE,$97,$70   ; $DAD5 - $DAD9
    .byte $00,$07,$3C,$F0,$00   ; $DADA - $DADE
    .byte $00,$08,$24,$10,$00   ; $DADF - $DAE3
    .byte $00,$08,$24,$30,$00   ; $DAE4 - $DAE8
    .byte $00,$08,$38,$C0,$00   ; $DAE9 - $DAED
    .byte $00,$08,$28,$80,$00   ; $DAEE - $DAF2
    .byte $00,$07,$38,$F0,$00   ; $DAF3 - $DAF7   top

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $9B ; |X  XX XX| $DAF8
    .byte $ED ; |XXX XX X| $DAF9
    .byte $C3 ; |XX    XX| $DAFA
    .byte $5C ; | X XXX  | $DAFB
    .byte $29 ; |  X X  X| $DAFC
    .byte $80 ; |X       | $DAFD
    .byte $31 ; |  XX   X| $DAFE
    .byte $D3 ; |XX X  XX| $DAFF


    .byte $00 ; |        | $DB00
    .byte $00 ; |        | $DB01
    .byte $00 ; |        | $DB02
    .byte $00 ; |        | $DB03
    .byte $00 ; |        | $DB04
    .byte $00 ; |        | $DB05
    .byte $00 ; |        | $DB06
    .byte $00 ; |        | $DB07
    .byte $00 ; |        | $DB08
    .byte $00 ; |        | $DB09
    .byte $00 ; |        | $DB0A
    .byte $00 ; |        | $DB0B
    .byte $00 ; |        | $DB0C
    .byte $00 ; |        | $DB0D
    .byte $00 ; |        | $DB0E
    .byte $00 ; |        | $DB0F
    .byte $00 ; |        | $DB10
    .byte $00 ; |        | $DB11
    .byte $00 ; |        | $DB12
    .byte $00 ; |        | $DB13
    .byte $00 ; |        | $DB14
    .byte $00 ; |        | $DB15
    .byte $00 ; |        | $DB16
    .byte $00 ; |        | $DB17
    .byte $00 ; |        | $DB18
    .byte $00 ; |        | $DB19
    .byte $00 ; |        | $DB1A
    .byte $00 ; |        | $DB1B
    .byte $00 ; |        | $DB1C
    .byte $00 ; |        | $DB1D
    .byte $00 ; |        | $DB1E
    .byte $00 ; |        | $DB1F
    .byte $00 ; |        | $DB20
    .byte $00 ; |        | $DB21
    .byte $00 ; |        | $DB22
    .byte $00 ; |        | $DB23
    .byte $00 ; |        | $DB24
    .byte $00 ; |        | $DB25
    .byte $00 ; |        | $DB26
    .byte $00 ; |        | $DB27
    .byte $00 ; |        | $DB28
    .byte $00 ; |        | $DB29
    .byte $00 ; |        | $DB2A
    .byte $00 ; |        | $DB2B
    .byte $00 ; |        | $DB2C
    .byte $00 ; |        | $DB2D
    .byte $00 ; |        | $DB2E
    .byte $00 ; |        | $DB2F
    .byte $00 ; |        | $DB30
    .byte $00 ; |        | $DB31
    .byte $00 ; |        | $DB32
    .byte $00 ; |        | $DB33
    .byte $00 ; |        | $DB34
    .byte $00 ; |        | $DB35
    .byte $00 ; |        | $DB36
    .byte $00 ; |        | $DB37
    .byte $00 ; |        | $DB38
    .byte $00 ; |        | $DB39
    .byte $00 ; |        | $DB3A
    .byte $00 ; |        | $DB3B
    .byte $00 ; |        | $DB3C
    .byte $00 ; |        | $DB3D
    .byte $00 ; |        | $DB3E
    .byte $00 ; |        | $DB3F
    .byte $00 ; |        | $DB40
    .byte $00 ; |        | $DB41
    .byte $00 ; |        | $DB42
    .byte $00 ; |        | $DB43
    .byte $00 ; |        | $DB44
    .byte $00 ; |        | $DB45
    .byte $00 ; |        | $DB46
    .byte $00 ; |        | $DB47
    .byte $00 ; |        | $DB48
    .byte $00 ; |        | $DB49
    .byte $00 ; |        | $DB4A
    .byte $00 ; |        | $DB4B
    .byte $00 ; |        | $DB4C
    .byte $00 ; |        | $DB4D
    .byte $00 ; |        | $DB4E
    .byte $00 ; |        | $DB4F
    .byte $00 ; |        | $DB50
    .byte $00 ; |        | $DB51
    .byte $00 ; |        | $DB52
    .byte $00 ; |        | $DB53
    .byte $00 ; |        | $DB54
    .byte $00 ; |        | $DB55
    .byte $00 ; |        | $DB56
    .byte $00 ; |        | $DB57
    .byte $00 ; |        | $DB58
    .byte $00 ; |        | $DB59
    .byte $00 ; |        | $DB5A
    .byte $00 ; |        | $DB5B
    .byte $00 ; |        | $DB5C
    .byte $00 ; |        | $DB5D
    .byte $00 ; |        | $DB5E
    .byte $00 ; |        | $DB5F
    .byte $00 ; |        | $DB60
    .byte $00 ; |        | $DB61
    .byte $00 ; |        | $DB62
    .byte $00 ; |        | $DB63
    .byte $00 ; |        | $DB64
    .byte $00 ; |        | $DB65
    .byte $00 ; |        | $DB66
    .byte $00 ; |        | $DB67
    .byte $00 ; |        | $DB68
    .byte $00 ; |        | $DB69
    .byte $00 ; |        | $DB6A
    .byte $00 ; |        | $DB6B
    .byte $00 ; |        | $DB6C
    .byte $00 ; |        | $DB6D
    .byte $00 ; |        | $DB6E
    .byte $00 ; |        | $DB6F
    .byte $00 ; |        | $DB70
    .byte $00 ; |        | $DB71
    .byte $00 ; |        | $DB72
    .byte $00 ; |        | $DB73
    .byte $00 ; |        | $DB74
    .byte $00 ; |        | $DB75
    .byte $00 ; |        | $DB76
    .byte $00 ; |        | $DB77
    .byte $00 ; |        | $DB78
    .byte $00 ; |        | $DB79
    .byte $00 ; |        | $DB7A
    .byte $00 ; |        | $DB7B
    .byte $00 ; |        | $DB7C
    .byte $00 ; |        | $DB7D
    .byte $00 ; |        | $DB7E
    .byte $00 ; |        | $DB7F
    .byte $00 ; |        | $DB80
    .byte $00 ; |        | $DB81
    .byte $00 ; |        | $DB82
    .byte $00 ; |        | $DB83
    .byte $00 ; |        | $DB84
    .byte $00 ; |        | $DB85
    .byte $81 ; |X      X| $DB86
    .byte $DB ; |XX XX XX| $DB87
    .byte $FF ; |XXXXXXXX| $DB88
    .byte $7E ; | XXXXXX | $DB89
    .byte $3C ; |  XXXX  | $DB8A
    .byte $18 ; |   XX   | $DB8B
    .byte $18 ; |   XX   | $DB8C
    .byte $18 ; |   XX   | $DB8D
    .byte $18 ; |   XX   | $DB8E
    .byte $18 ; |   XX   | $DB8F
    .byte $18 ; |   XX   | $DB90
    .byte $18 ; |   XX   | $DB91
    .byte $00 ; |        | $DB92
    .byte $00 ; |        | $DB93
    .byte $00 ; |        | $DB94
    .byte $00 ; |        | $DB95
    .byte $00 ; |        | $DB96
    .byte $00 ; |        | $DB97
    .byte $00 ; |        | $DB98
    .byte $00 ; |        | $DB99
    .byte $00 ; |        | $DB9A
    .byte $00 ; |        | $DB9B
    .byte $00 ; |        | $DB9C
    .byte $00 ; |        | $DB9D
    .byte $00 ; |        | $DB9E
    .byte $00 ; |        | $DB9F
    .byte $00 ; |        | $DBA0
    .byte $00 ; |        | $DBA1
    .byte $00 ; |        | $DBA2
    .byte $00 ; |        | $DBA3
    .byte $00 ; |        | $DBA4
    .byte $00 ; |        | $DBA5
    .byte $00 ; |        | $DBA6
    .byte $00 ; |        | $DBA7
    .byte $00 ; |        | $DBA8
    .byte $00 ; |        | $DBA9
    .byte $00 ; |        | $DBAA
    .byte $00 ; |        | $DBAB
    .byte $00 ; |        | $DBAC
    .byte $00 ; |        | $DBAD
    .byte $00 ; |        | $DBAE
    .byte $00 ; |        | $DBAF
    .byte $00 ; |        | $DBB0
    .byte $00 ; |        | $DBB1
    .byte $00 ; |        | $DBB2
    .byte $00 ; |        | $DBB3
    .byte $00 ; |        | $DBB4
    .byte $00 ; |        | $DBB5
    .byte $00 ; |        | $DBB6
    .byte $00 ; |        | $DBB7
    .byte $00 ; |        | $DBB8
    .byte $00 ; |        | $DBB9
    .byte $00 ; |        | $DBBA
    .byte $00 ; |        | $DBBB
    .byte $00 ; |        | $DBBC
    .byte $00 ; |        | $DBBD
    .byte $00 ; |        | $DBBE
    .byte $00 ; |        | $DBBF
    .byte $00 ; |        | $DBC0
    .byte $00 ; |        | $DBC1
    .byte $00 ; |        | $DBC2
    .byte $00 ; |        | $DBC3
    .byte $00 ; |        | $DBC4
    .byte $00 ; |        | $DBC5
    .byte $00 ; |        | $DBC6
    .byte $00 ; |        | $DBC7
    .byte $00 ; |        | $DBC8
    .byte $00 ; |        | $DBC9
    .byte $00 ; |        | $DBCA
    .byte $00 ; |        | $DBCB
    .byte $00 ; |        | $DBCC
    .byte $00 ; |        | $DBCD
    .byte $00 ; |        | $DBCE
    .byte $00 ; |        | $DBCF
    .byte $00 ; |        | $DBD0
    .byte $00 ; |        | $DBD1
    .byte $00 ; |        | $DBD2
    .byte $00 ; |        | $DBD3
    .byte $00 ; |        | $DBD4
    .byte $00 ; |        | $DBD5
    .byte $00 ; |        | $DBD6
    .byte $00 ; |        | $DBD7
    .byte $00 ; |        | $DBD8
    .byte $00 ; |        | $DBD9
    .byte $00 ; |        | $DBDA
    .byte $00 ; |        | $DBDB
    .byte $00 ; |        | $DBDC
    .byte $00 ; |        | $DBDD
    .byte $00 ; |        | $DBDE
    .byte $00 ; |        | $DBDF
    .byte $00 ; |        | $DBE0
    .byte $00 ; |        | $DBE1
    .byte $00 ; |        | $DBE2
    .byte $00 ; |        | $DBE3
    .byte $00 ; |        | $DBE4
    .byte $00 ; |        | $DBE5
    .byte $00 ; |        | $DBE6
    .byte $00 ; |        | $DBE7
    .byte $00 ; |        | $DBE8
    .byte $00 ; |        | $DBE9
    .byte $00 ; |        | $DBEA
    .byte $00 ; |        | $DBEB
    .byte $00 ; |        | $DBEC
    .byte $00 ; |        | $DBED
    .byte $00 ; |        | $DBEE
    .byte $00 ; |        | $DBEF
    .byte $00 ; |        | $DBF0
    .byte $00 ; |        | $DBF1
    .byte $00 ; |        | $DBF2
    .byte $00 ; |        | $DBF3
    .byte $00 ; |        | $DBF4
    .byte $00 ; |        | $DBF5
    .byte $00 ; |        | $DBF6
    .byte $00 ; |        | $DBF7
    .byte $00 ; |        | $DBF8
    .byte $00 ; |        | $DBF9
    .byte $00 ; |        | $DBFA
    .byte $00 ; |        | $DBFB
    .byte $00 ; |        | $DBFC
    .byte $00 ; |        | $DBFD
    .byte $00 ; |        | $DBFE
    .byte $00 ; |        | $DBFF
    .byte $00 ; |        | $DC00
    .byte $00 ; |        | $DC01
    .byte $00 ; |        | $DC02
    .byte $00 ; |        | $DC03
    .byte $00 ; |        | $DC04
    .byte $00 ; |        | $DC05
    .byte $00 ; |        | $DC06
    .byte $00 ; |        | $DC07
    .byte $00 ; |        | $DC08
    .byte $00 ; |        | $DC09
    .byte $00 ; |        | $DC0A
    .byte $00 ; |        | $DC0B
    .byte $00 ; |        | $DC0C
    .byte $00 ; |        | $DC0D
    .byte $00 ; |        | $DC0E
    .byte $00 ; |        | $DC0F
    .byte $00 ; |        | $DC10
    .byte $00 ; |        | $DC11
    .byte $00 ; |        | $DC12
    .byte $00 ; |        | $DC13
    .byte $00 ; |        | $DC14
    .byte $00 ; |        | $DC15
    .byte $00 ; |        | $DC16
    .byte $00 ; |        | $DC17
    .byte $18 ; |   XX   | $DC18
    .byte $18 ; |   XX   | $DC19
    .byte $18 ; |   XX   | $DC1A
    .byte $18 ; |   XX   | $DC1B
    .byte $18 ; |   XX   | $DC1C
    .byte $18 ; |   XX   | $DC1D
    .byte $18 ; |   XX   | $DC1E
    .byte $3C ; |  XXXX  | $DC1F
    .byte $7E ; | XXXXXX | $DC20
    .byte $FF ; |XXXXXXXX| $DC21
    .byte $DB ; |XX XX XX| $DC22
    .byte $81 ; |X      X| $DC23
    .byte $00 ; |        | $DC24
    .byte $00 ; |        | $DC25
    .byte $00 ; |        | $DC26
    .byte $00 ; |        | $DC27
    .byte $00 ; |        | $DC28
    .byte $00 ; |        | $DC29
    .byte $00 ; |        | $DC2A
    .byte $00 ; |        | $DC2B
    .byte $00 ; |        | $DC2C
    .byte $00 ; |        | $DC2D
    .byte $00 ; |        | $DC2E
    .byte $00 ; |        | $DC2F
    .byte $00 ; |        | $DC30
    .byte $00 ; |        | $DC31
    .byte $00 ; |        | $DC32
    .byte $00 ; |        | $DC33
    .byte $00 ; |        | $DC34
    .byte $00 ; |        | $DC35
    .byte $00 ; |        | $DC36
    .byte $00 ; |        | $DC37
    .byte $00 ; |        | $DC38
    .byte $00 ; |        | $DC39
    .byte $00 ; |        | $DC3A
    .byte $00 ; |        | $DC3B
    .byte $00 ; |        | $DC3C
    .byte $00 ; |        | $DC3D
    .byte $00 ; |        | $DC3E
    .byte $00 ; |        | $DC3F
    .byte $00 ; |        | $DC40
    .byte $00 ; |        | $DC41
    .byte $00 ; |        | $DC42
    .byte $00 ; |        | $DC43
    .byte $00 ; |        | $DC44
    .byte $00 ; |        | $DC45
    .byte $00 ; |        | $DC46
    .byte $00 ; |        | $DC47
    .byte $00 ; |        | $DC48
    .byte $00 ; |        | $DC49
    .byte $00 ; |        | $DC4A
    .byte $00 ; |        | $DC4B
    .byte $00 ; |        | $DC4C
    .byte $00 ; |        | $DC4D
    .byte $00 ; |        | $DC4E
    .byte $00 ; |        | $DC4F
    .byte $00 ; |        | $DC50
    .byte $00 ; |        | $DC51
    .byte $00 ; |        | $DC52
    .byte $00 ; |        | $DC53
    .byte $00 ; |        | $DC54
    .byte $00 ; |        | $DC55
    .byte $00 ; |        | $DC56
    .byte $00 ; |        | $DC57
    .byte $00 ; |        | $DC58
    .byte $00 ; |        | $DC59
    .byte $00 ; |        | $DC5A
    .byte $00 ; |        | $DC5B
    .byte $00 ; |        | $DC5C
    .byte $00 ; |        | $DC5D
    .byte $00 ; |        | $DC5E
    .byte $00 ; |        | $DC5F
    .byte $00 ; |        | $DC60
    .byte $00 ; |        | $DC61
    .byte $00 ; |        | $DC62
    .byte $00 ; |        | $DC63
    .byte $00 ; |        | $DC64
    .byte $00 ; |        | $DC65
    .byte $00 ; |        | $DC66
    .byte $00 ; |        | $DC67
    .byte $00 ; |        | $DC68
    .byte $00 ; |        | $DC69
    .byte $00 ; |        | $DC6A
    .byte $00 ; |        | $DC6B
    .byte $00 ; |        | $DC6C
    .byte $00 ; |        | $DC6D
    .byte $00 ; |        | $DC6E
    .byte $00 ; |        | $DC6F
    .byte $00 ; |        | $DC70
    .byte $00 ; |        | $DC71
    .byte $00 ; |        | $DC72
    .byte $00 ; |        | $DC73
    .byte $00 ; |        | $DC74
    .byte $00 ; |        | $DC75
    .byte $00 ; |        | $DC76
    .byte $00 ; |        | $DC77
    .byte $00 ; |        | $DC78
    .byte $00 ; |        | $DC79
    .byte $00 ; |        | $DC7A
    .byte $00 ; |        | $DC7B
    .byte $00 ; |        | $DC7C
    .byte $00 ; |        | $DC7D
    .byte $00 ; |        | $DC7E
    .byte $00 ; |        | $DC7F
    .byte $00 ; |        | $DC80
    .byte $00 ; |        | $DC81
    .byte $00 ; |        | $DC82
    .byte $00 ; |        | $DC83
    .byte $00 ; |        | $DC84
    .byte $00 ; |        | $DC85
    .byte $00 ; |        | $DC86
    .byte $00 ; |        | $DC87
    .byte $00 ; |        | $DC88
    .byte $00 ; |        | $DC89
    .byte $00 ; |        | $DC8A
    .byte $00 ; |        | $DC8B
    .byte $00 ; |        | $DC8C
    .byte $00 ; |        | $DC8D
    .byte $00 ; |        | $DC8E
    .byte $00 ; |        | $DC8F
    .byte $00 ; |        | $DC90
    .byte $00 ; |        | $DC91
    .byte $00 ; |        | $DC92
    .byte $00 ; |        | $DC93
    .byte $00 ; |        | $DC94
    .byte $00 ; |        | $DC95
    .byte $00 ; |        | $DC96
    .byte $00 ; |        | $DC97
    .byte $00 ; |        | $DC98
    .byte $00 ; |        | $DC99
    .byte $00 ; |        | $DC9A
    .byte $00 ; |        | $DC9B
    .byte $00 ; |        | $DC9C
    .byte $00 ; |        | $DC9D
    .byte $00 ; |        | $DC9E
    .byte $00 ; |        | $DC9F
    .byte $00 ; |        | $DCA0
    .byte $00 ; |        | $DCA1
    .byte $00 ; |        | $DCA2
    .byte $00 ; |        | $DCA3
    .byte $00 ; |        | $DCA4
    .byte $00 ; |        | $DCA5
    .byte $00 ; |        | $DCA6
    .byte $00 ; |        | $DCA7
    .byte $00 ; |        | $DCA8
    .byte $00 ; |        | $DCA9
    .byte $00 ; |        | $DCAA
    .byte $00 ; |        | $DCAB
    .byte $00 ; |        | $DCAC
    .byte $00 ; |        | $DCAD
    .byte $C0 ; |XX      | $DCAE
    .byte $E0 ; |XXX     | $DCAF
    .byte $70 ; | XXX    | $DCB0
    .byte $FF ; |XXXXXXXX| $DCB1
    .byte $FF ; |XXXXXXXX| $DCB2
    .byte $70 ; | XXX    | $DCB3
    .byte $E0 ; |XXX     | $DCB4
    .byte $C0 ; |XX      | $DCB5
    .byte $00 ; |        | $DCB6
    .byte $00 ; |        | $DCB7
    .byte $00 ; |        | $DCB8
    .byte $00 ; |        | $DCB9
    .byte $00 ; |        | $DCBA
    .byte $00 ; |        | $DCBB
    .byte $00 ; |        | $DCBC
    .byte $00 ; |        | $DCBD
    .byte $00 ; |        | $DCBE
    .byte $00 ; |        | $DCBF
    .byte $00 ; |        | $DCC0
    .byte $00 ; |        | $DCC1
    .byte $00 ; |        | $DCC2
    .byte $00 ; |        | $DCC3
    .byte $00 ; |        | $DCC4
    .byte $00 ; |        | $DCC5
    .byte $00 ; |        | $DCC6
    .byte $00 ; |        | $DCC7
    .byte $00 ; |        | $DCC8
    .byte $00 ; |        | $DCC9
    .byte $00 ; |        | $DCCA
    .byte $00 ; |        | $DCCB
    .byte $00 ; |        | $DCCC
    .byte $00 ; |        | $DCCD
    .byte $00 ; |        | $DCCE
    .byte $00 ; |        | $DCCF
    .byte $00 ; |        | $DCD0
    .byte $00 ; |        | $DCD1
    .byte $00 ; |        | $DCD2
    .byte $00 ; |        | $DCD3
    .byte $00 ; |        | $DCD4
    .byte $00 ; |        | $DCD5
    .byte $00 ; |        | $DCD6
    .byte $00 ; |        | $DCD7
    .byte $00 ; |        | $DCD8
    .byte $00 ; |        | $DCD9
    .byte $00 ; |        | $DCDA
    .byte $00 ; |        | $DCDB
    .byte $00 ; |        | $DCDC
    .byte $00 ; |        | $DCDD
    .byte $00 ; |        | $DCDE
    .byte $00 ; |        | $DCDF
    .byte $00 ; |        | $DCE0
    .byte $00 ; |        | $DCE1
    .byte $00 ; |        | $DCE2
    .byte $00 ; |        | $DCE3
    .byte $00 ; |        | $DCE4
    .byte $00 ; |        | $DCE5
    .byte $00 ; |        | $DCE6
    .byte $00 ; |        | $DCE7
    .byte $00 ; |        | $DCE8
    .byte $00 ; |        | $DCE9
    .byte $00 ; |        | $DCEA
    .byte $00 ; |        | $DCEB
    .byte $00 ; |        | $DCEC
    .byte $00 ; |        | $DCED
    .byte $00 ; |        | $DCEE
    .byte $00 ; |        | $DCEF
    .byte $00 ; |        | $DCF0
    .byte $00 ; |        | $DCF1
    .byte $00 ; |        | $DCF2
    .byte $00 ; |        | $DCF3
    .byte $00 ; |        | $DCF4
    .byte $00 ; |        | $DCF5
    .byte $00 ; |        | $DCF6
    .byte $00 ; |        | $DCF7
    .byte $00 ; |        | $DCF8
    .byte $00 ; |        | $DCF9
    .byte $00 ; |        | $DCFA
    .byte $00 ; |        | $DCFB
    .byte $00 ; |        | $DCFC
    .byte $00 ; |        | $DCFD
    .byte $00 ; |        | $DCFE
    .byte $00 ; |        | $DCFF
    .byte $00 ; |        | $DD00
    .byte $00 ; |        | $DD01
    .byte $00 ; |        | $DD02
    .byte $00 ; |        | $DD03
    .byte $00 ; |        | $DD04
    .byte $00 ; |        | $DD05
    .byte $00 ; |        | $DD06
    .byte $00 ; |        | $DD07
    .byte $00 ; |        | $DD08
    .byte $00 ; |        | $DD09
    .byte $00 ; |        | $DD0A
    .byte $00 ; |        | $DD0B
    .byte $00 ; |        | $DD0C
    .byte $00 ; |        | $DD0D
    .byte $00 ; |        | $DD0E
    .byte $00 ; |        | $DD0F
    .byte $00 ; |        | $DD10
    .byte $00 ; |        | $DD11
    .byte $00 ; |        | $DD12
    .byte $00 ; |        | $DD13
    .byte $00 ; |        | $DD14
    .byte $00 ; |        | $DD15
    .byte $00 ; |        | $DD16
    .byte $00 ; |        | $DD17
    .byte $00 ; |        | $DD18
    .byte $00 ; |        | $DD19
    .byte $00 ; |        | $DD1A
    .byte $00 ; |        | $DD1B
    .byte $00 ; |        | $DD1C
    .byte $00 ; |        | $DD1D
    .byte $00 ; |        | $DD1E
    .byte $00 ; |        | $DD1F
    .byte $00 ; |        | $DD20
    .byte $00 ; |        | $DD21
    .byte $00 ; |        | $DD22
    .byte $00 ; |        | $DD23
    .byte $00 ; |        | $DD24
    .byte $00 ; |        | $DD25
    .byte $00 ; |        | $DD26
    .byte $00 ; |        | $DD27
    .byte $00 ; |        | $DD28
    .byte $00 ; |        | $DD29
    .byte $00 ; |        | $DD2A
    .byte $00 ; |        | $DD2B
    .byte $00 ; |        | $DD2C
    .byte $00 ; |        | $DD2D
    .byte $00 ; |        | $DD2E
    .byte $00 ; |        | $DD2F
    .byte $00 ; |        | $DD30
    .byte $00 ; |        | $DD31
    .byte $00 ; |        | $DD32
    .byte $00 ; |        | $DD33
    .byte $00 ; |        | $DD34
    .byte $00 ; |        | $DD35
    .byte $00 ; |        | $DD36
    .byte $00 ; |        | $DD37
    .byte $00 ; |        | $DD38
    .byte $00 ; |        | $DD39
    .byte $00 ; |        | $DD3A
    .byte $00 ; |        | $DD3B
    .byte $00 ; |        | $DD3C
    .byte $00 ; |        | $DD3D
    .byte $00 ; |        | $DD3E
    .byte $00 ; |        | $DD3F
    .byte $E1 ; |XXX    X| $DD40
    .byte $E0 ; |XXX     | $DD41
    .byte $E0 ; |XXX     | $DD42
    .byte $E0 ; |XXX     | $DD43
    .byte $E0 ; |XXX     | $DD44
    .byte $E0 ; |XXX     | $DD45
    .byte $04 ; |     X  | $DD46
    .byte $0E ; |    XXX | $DD47
    .byte $0A ; |    X X | $DD48
    .byte $0A ; |    X X | $DD49
    .byte $0E ; |    XXX | $DD4A
    .byte $04 ; |     X  | $DD4B
    .byte $E1 ; |XXX    X| $DD4C
    .byte $E0 ; |XXX     | $DD4D
    .byte $E0 ; |XXX     | $DD4E
    .byte $E0 ; |XXX     | $DD4F
    .byte $E0 ; |XXX     | $DD50
    .byte $E0 ; |XXX     | $DD51
    .byte $04 ; |     X  | $DD52
    .byte $0E ; |    XXX | $DD53
    .byte $0A ; |    X X | $DD54
    .byte $0A ; |    X X | $DD55
    .byte $0E ; |    XXX | $DD56
    .byte $04 ; |     X  | $DD57
    .byte $E1 ; |XXX    X| $DD58
    .byte $E0 ; |XXX     | $DD59
    .byte $E0 ; |XXX     | $DD5A
    .byte $E0 ; |XXX     | $DD5B
    .byte $E0 ; |XXX     | $DD5C
    .byte $E0 ; |XXX     | $DD5D
    .byte $04 ; |     X  | $DD5E
    .byte $0E ; |    XXX | $DD5F
    .byte $0A ; |    X X | $DD60
    .byte $0A ; |    X X | $DD61
    .byte $0E ; |    XXX | $DD62
    .byte $04 ; |     X  | $DD63
    .byte $E1 ; |XXX    X| $DD64
    .byte $E0 ; |XXX     | $DD65
    .byte $E0 ; |XXX     | $DD66
    .byte $E0 ; |XXX     | $DD67
    .byte $E0 ; |XXX     | $DD68
    .byte $E0 ; |XXX     | $DD69
    .byte $04 ; |     X  | $DD6A
    .byte $0E ; |    XXX | $DD6B
    .byte $0A ; |    X X | $DD6C
    .byte $0A ; |    X X | $DD6D
    .byte $0E ; |    XXX | $DD6E
    .byte $04 ; |     X  | $DD6F
    .byte $E1 ; |XXX    X| $DD70
    .byte $E0 ; |XXX     | $DD71
    .byte $E0 ; |XXX     | $DD72
    .byte $E0 ; |XXX     | $DD73
    .byte $E0 ; |XXX     | $DD74
    .byte $E0 ; |XXX     | $DD75
    .byte $04 ; |     X  | $DD76
    .byte $0E ; |    XXX | $DD77
    .byte $0A ; |    X X | $DD78
    .byte $0A ; |    X X | $DD79
    .byte $0E ; |    XXX | $DD7A
    .byte $04 ; |     X  | $DD7B
    .byte $E1 ; |XXX    X| $DD7C
    .byte $E0 ; |XXX     | $DD7D
    .byte $E0 ; |XXX     | $DD7E
    .byte $E0 ; |XXX     | $DD7F
    .byte $E0 ; |XXX     | $DD80
    .byte $E0 ; |XXX     | $DD81
    .byte $04 ; |     X  | $DD82
    .byte $0E ; |    XXX | $DD83
    .byte $0A ; |    X X | $DD84
    .byte $0A ; |    X X | $DD85
    .byte $0E ; |    XXX | $DD86
    .byte $04 ; |     X  | $DD87
    .byte $E1 ; |XXX    X| $DD88
    .byte $E0 ; |XXX     | $DD89
    .byte $E0 ; |XXX     | $DD8A
    .byte $E0 ; |XXX     | $DD8B
    .byte $E0 ; |XXX     | $DD8C
    .byte $E0 ; |XXX     | $DD8D
    .byte $04 ; |     X  | $DD8E
    .byte $0E ; |    XXX | $DD8F
    .byte $0A ; |    X X | $DD90
    .byte $0A ; |    X X | $DD91
    .byte $0E ; |    XXX | $DD92
    .byte $04 ; |     X  | $DD93
    .byte $01 ; |       X| $DD94
    .byte $00 ; |        | $DD95
    .byte $00 ; |        | $DD96
    .byte $00 ; |        | $DD97
    .byte $00 ; |        | $DD98
    .byte $00 ; |        | $DD99
    .byte $04 ; |     X  | $DD9A
    .byte $0E ; |    XXX | $DD9B
    .byte $0A ; |    X X | $DD9C
    .byte $0A ; |    X X | $DD9D
    .byte $0E ; |    XXX | $DD9E
    .byte $04 ; |     X  | $DD9F
    .byte $21 ; |  X    X| $DDA0
    .byte $20 ; |  X     | $DDA1
    .byte $20 ; |  X     | $DDA2
    .byte $20 ; |  X     | $DDA3
    .byte $20 ; |  X     | $DDA4
    .byte $20 ; |  X     | $DDA5
    .byte $04 ; |     X  | $DDA6
    .byte $0E ; |    XXX | $DDA7
    .byte $0A ; |    X X | $DDA8
    .byte $0A ; |    X X | $DDA9
    .byte $0E ; |    XXX | $DDAA
    .byte $04 ; |     X  | $DDAB
    .byte $21 ; |  X    X| $DDAC
    .byte $20 ; |  X     | $DDAD
    .byte $20 ; |  X     | $DDAE
    .byte $20 ; |  X     | $DDAF
    .byte $20 ; |  X     | $DDB0
    .byte $20 ; |  X     | $DDB1
    .byte $04 ; |     X  | $DDB2
    .byte $0E ; |    XXX | $DDB3
    .byte $0A ; |    X X | $DDB4
    .byte $0A ; |    X X | $DDB5
    .byte $0E ; |    XXX | $DDB6
    .byte $04 ; |     X  | $DDB7
    .byte $21 ; |  X    X| $DDB8
    .byte $20 ; |  X     | $DDB9
    .byte $20 ; |  X     | $DDBA
    .byte $20 ; |  X     | $DDBB
    .byte $20 ; |  X     | $DDBC
    .byte $20 ; |  X     | $DDBD
    .byte $04 ; |     X  | $DDBE
    .byte $0E ; |    XXX | $DDBF
    .byte $0A ; |    X X | $DDC0
    .byte $0A ; |    X X | $DDC1
    .byte $0E ; |    XXX | $DDC2
    .byte $04 ; |     X  | $DDC3
    .byte $21 ; |  X    X| $DDC4
    .byte $20 ; |  X     | $DDC5
    .byte $20 ; |  X     | $DDC6
    .byte $20 ; |  X     | $DDC7
    .byte $20 ; |  X     | $DDC8
    .byte $20 ; |  X     | $DDC9
    .byte $04 ; |     X  | $DDCA
    .byte $0E ; |    XXX | $DDCB
    .byte $0A ; |    X X | $DDCC
    .byte $0A ; |    X X | $DDCD
    .byte $0E ; |    XXX | $DDCE
    .byte $04 ; |     X  | $DDCF
    .byte $21 ; |  X    X| $DDD0
    .byte $20 ; |  X     | $DDD1
    .byte $20 ; |  X     | $DDD2
    .byte $20 ; |  X     | $DDD3
    .byte $20 ; |  X     | $DDD4
    .byte $20 ; |  X     | $DDD5
    .byte $04 ; |     X  | $DDD6
    .byte $0E ; |    XXX | $DDD7
    .byte $0A ; |    X X | $DDD8
    .byte $0A ; |    X X | $DDD9
    .byte $0E ; |    XXX | $DDDA
    .byte $04 ; |     X  | $DDDB
    .byte $21 ; |  X    X| $DDDC
    .byte $20 ; |  X     | $DDDD
    .byte $20 ; |  X     | $DDDE
    .byte $20 ; |  X     | $DDDF
    .byte $20 ; |  X     | $DDE0
    .byte $20 ; |  X     | $DDE1
    .byte $04 ; |     X  | $DDE2
    .byte $0E ; |    XXX | $DDE3
    .byte $0A ; |    X X | $DDE4
    .byte $0A ; |    X X | $DDE5
    .byte $0E ; |    XXX | $DDE6
    .byte $04 ; |     X  | $DDE7
    .byte $21 ; |  X    X| $DDE8
    .byte $20 ; |  X     | $DDE9
    .byte $20 ; |  X     | $DDEA
    .byte $20 ; |  X     | $DDEB
    .byte $20 ; |  X     | $DDEC
    .byte $20 ; |  X     | $DDED
    .byte $04 ; |     X  | $DDEE
    .byte $0E ; |    XXX | $DDEF
    .byte $0A ; |    X X | $DDF0
    .byte $0A ; |    X X | $DDF1
    .byte $0E ; |    XXX | $DDF2
    .byte $04 ; |     X  | $DDF3
    .byte $01 ; |       X| $DDF4
    .byte $00 ; |        | $DDF5
    .byte $00 ; |        | $DDF6
    .byte $00 ; |        | $DDF7
    .byte $00 ; |        | $DDF8
    .byte $00 ; |        | $DDF9
    .byte $04 ; |     X  | $DDFA
    .byte $0E ; |    XXX | $DDFB
    .byte $0A ; |    X X | $DDFC
    .byte $0A ; |    X X | $DDFD
    .byte $0E ; |    XXX | $DDFE
    .byte $04 ; |     X  | $DDFF
    .byte $E1 ; |XXX    X| $DE00
    .byte $E0 ; |XXX     | $DE01
    .byte $E0 ; |XXX     | $DE02
    .byte $E0 ; |XXX     | $DE03
    .byte $E0 ; |XXX     | $DE04
    .byte $E0 ; |XXX     | $DE05
    .byte $04 ; |     X  | $DE06
    .byte $0E ; |    XXX | $DE07
    .byte $0A ; |    X X | $DE08
    .byte $0A ; |    X X | $DE09
    .byte $0E ; |    XXX | $DE0A
    .byte $04 ; |     X  | $DE0B
    .byte $E1 ; |XXX    X| $DE0C
    .byte $E0 ; |XXX     | $DE0D
    .byte $E0 ; |XXX     | $DE0E
    .byte $E0 ; |XXX     | $DE0F
    .byte $E0 ; |XXX     | $DE10
    .byte $E0 ; |XXX     | $DE11
    .byte $04 ; |     X  | $DE12
    .byte $0E ; |    XXX | $DE13
    .byte $0A ; |    X X | $DE14
    .byte $0A ; |    X X | $DE15
    .byte $0E ; |    XXX | $DE16
    .byte $04 ; |     X  | $DE17
    .byte $E1 ; |XXX    X| $DE18
    .byte $E0 ; |XXX     | $DE19
    .byte $E0 ; |XXX     | $DE1A
    .byte $E0 ; |XXX     | $DE1B
    .byte $E0 ; |XXX     | $DE1C
    .byte $E0 ; |XXX     | $DE1D
    .byte $04 ; |     X  | $DE1E
    .byte $0E ; |    XXX | $DE1F
    .byte $0A ; |    X X | $DE20
    .byte $0A ; |    X X | $DE21
    .byte $0E ; |    XXX | $DE22
    .byte $04 ; |     X  | $DE23
    .byte $E1 ; |XXX    X| $DE24
    .byte $E0 ; |XXX     | $DE25
    .byte $E0 ; |XXX     | $DE26
    .byte $E0 ; |XXX     | $DE27
    .byte $E0 ; |XXX     | $DE28
    .byte $E0 ; |XXX     | $DE29
    .byte $04 ; |     X  | $DE2A
    .byte $0E ; |    XXX | $DE2B
    .byte $0A ; |    X X | $DE2C
    .byte $0A ; |    X X | $DE2D
    .byte $0E ; |    XXX | $DE2E
    .byte $04 ; |     X  | $DE2F
    .byte $E1 ; |XXX    X| $DE30
    .byte $E0 ; |XXX     | $DE31
    .byte $E0 ; |XXX     | $DE32
    .byte $E0 ; |XXX     | $DE33
    .byte $E0 ; |XXX     | $DE34
    .byte $E0 ; |XXX     | $DE35
    .byte $04 ; |     X  | $DE36
    .byte $0E ; |    XXX | $DE37
    .byte $0A ; |    X X | $DE38
    .byte $0A ; |    X X | $DE39
    .byte $0E ; |    XXX | $DE3A
    .byte $04 ; |     X  | $DE3B
    .byte $E1 ; |XXX    X| $DE3C
    .byte $E0 ; |XXX     | $DE3D
    .byte $E0 ; |XXX     | $DE3E
    .byte $E0 ; |XXX     | $DE3F
    .byte $E0 ; |XXX     | $DE40
    .byte $E0 ; |XXX     | $DE41
    .byte $04 ; |     X  | $DE42
    .byte $0E ; |    XXX | $DE43
    .byte $0A ; |    X X | $DE44
    .byte $0A ; |    X X | $DE45
    .byte $0E ; |    XXX | $DE46
    .byte $04 ; |     X  | $DE47
    .byte $E1 ; |XXX    X| $DE48
    .byte $E0 ; |XXX     | $DE49
    .byte $E0 ; |XXX     | $DE4A
    .byte $E0 ; |XXX     | $DE4B
    .byte $E0 ; |XXX     | $DE4C
    .byte $E0 ; |XXX     | $DE4D
    .byte $04 ; |     X  | $DE4E
    .byte $0E ; |    XXX | $DE4F
    .byte $0A ; |    X X | $DE50
    .byte $0A ; |    X X | $DE51
    .byte $0E ; |    XXX | $DE52
    .byte $04 ; |     X  | $DE53
    .byte $01 ; |       X| $DE54
    .byte $00 ; |        | $DE55
    .byte $00 ; |        | $DE56
    .byte $00 ; |        | $DE57
    .byte $00 ; |        | $DE58
    .byte $00 ; |        | $DE59
    .byte $04 ; |     X  | $DE5A
    .byte $0E ; |    XXX | $DE5B
    .byte $0A ; |    X X | $DE5C
    .byte $0A ; |    X X | $DE5D
    .byte $0E ; |    XXX | $DE5E
    .byte $04 ; |     X  | $DE5F
    .byte $21 ; |  X    X| $DE60
    .byte $20 ; |  X     | $DE61
    .byte $20 ; |  X     | $DE62
    .byte $20 ; |  X     | $DE63
    .byte $20 ; |  X     | $DE64
    .byte $20 ; |  X     | $DE65
    .byte $04 ; |     X  | $DE66
    .byte $0E ; |    XXX | $DE67
    .byte $0A ; |    X X | $DE68
    .byte $0A ; |    X X | $DE69
    .byte $0E ; |    XXX | $DE6A
    .byte $04 ; |     X  | $DE6B
    .byte $21 ; |  X    X| $DE6C
    .byte $20 ; |  X     | $DE6D
    .byte $20 ; |  X     | $DE6E
    .byte $20 ; |  X     | $DE6F
    .byte $20 ; |  X     | $DE70
    .byte $20 ; |  X     | $DE71
    .byte $04 ; |     X  | $DE72
    .byte $0E ; |    XXX | $DE73
    .byte $0A ; |    X X | $DE74
    .byte $0A ; |    X X | $DE75
    .byte $0E ; |    XXX | $DE76
    .byte $04 ; |     X  | $DE77
    .byte $21 ; |  X    X| $DE78
    .byte $20 ; |  X     | $DE79
    .byte $20 ; |  X     | $DE7A
    .byte $20 ; |  X     | $DE7B
    .byte $20 ; |  X     | $DE7C
    .byte $20 ; |  X     | $DE7D
    .byte $04 ; |     X  | $DE7E
    .byte $0E ; |    XXX | $DE7F
    .byte $0A ; |    X X | $DE80
    .byte $0A ; |    X X | $DE81
    .byte $0E ; |    XXX | $DE82
    .byte $04 ; |     X  | $DE83
    .byte $21 ; |  X    X| $DE84
    .byte $20 ; |  X     | $DE85
    .byte $20 ; |  X     | $DE86
    .byte $20 ; |  X     | $DE87
    .byte $20 ; |  X     | $DE88
    .byte $20 ; |  X     | $DE89
    .byte $04 ; |     X  | $DE8A
    .byte $0E ; |    XXX | $DE8B
    .byte $0A ; |    X X | $DE8C
    .byte $0A ; |    X X | $DE8D
    .byte $0E ; |    XXX | $DE8E
    .byte $04 ; |     X  | $DE8F
    .byte $21 ; |  X    X| $DE90
    .byte $20 ; |  X     | $DE91
    .byte $20 ; |  X     | $DE92
    .byte $20 ; |  X     | $DE93
    .byte $20 ; |  X     | $DE94
    .byte $20 ; |  X     | $DE95
    .byte $04 ; |     X  | $DE96
    .byte $0E ; |    XXX | $DE97
    .byte $0A ; |    X X | $DE98
    .byte $0A ; |    X X | $DE99
    .byte $0E ; |    XXX | $DE9A
    .byte $04 ; |     X  | $DE9B

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;                  regular
; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX   | DEC0 | DEC1 | DEC2 | DEC3 | DEC4 | DEC5 |
; XX   X X X   X   XXXXX   XXXXX   X   X   X X XXX   | DEBA | DEBB | DEBC | DEBD | DEBE | DEBF |
; XX XXX X XX XX X XXXXX X XXXXX X X X X XXX X XXX   | DEB4 | DEB5 | DEB6 | DEB7 | DEB8 | DEB9 |
; XX   X  XXX XX   X   X   X   X  XX   X XXX  XXXX   | DEAE | DEAF | DEB0 | DEB1 | DEB2 | DEB3 |
; XXXX X X XX XX XXXXXXX X XXXXX X X X X XXX X XXX   | DEA8 | DEA9 | DEAA | DEAB | DEAC | DEAD |
; XX   X X X   X XXXXXXX X XXXXX X X X X   X X XXX   | DEA2 | DEA3 | DEA4 | DEA5 | DEA6 | DEA7 |
; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX   | DE9C | DE9D | DE9E | DE9F | DEA0 | DEA1 |
;
;                  inverted
;                                                    | DEC0 | DEC1 | DEC2 | DEC3 | DEC4 | DEC5 |
;   XXX X X XXX XXX     XXX     XXX XXX XXX X X      | DEBA | DEBB | DEBC | DEBD | DEBE | DEBF |
;   X   X X  X  X X     X X     X X X X X   X X      | DEB4 | DEB5 | DEB6 | DEB7 | DEB8 | DEB9 |
;   XXX XX   X  XXX XXX XXX XXX XX  XXX X   XX       | DEAE | DEAF | DEB0 | DEB1 | DEB2 | DEB3 |
;     X X X  X  X       X X     X X X X X   X X      | DEA8 | DEA9 | DEAA | DEAB | DEAC | DEAD |
;   XXX X X XXX X       X X     X X X X XXX X X      | DEA2 | DEA3 | DEA4 | DEA5 | DEA6 | DEA7 |
;                                                    | DE9C | DE9D | DE9E | DE9F | DEA0 | DEA1 |


Skip_A_Rack:
    .byte $FF,$FF,$FF,$FF,$FF,$FF   ; $DE9C - $DEA1   bottom
    .byte $C5,$45,$FD,$7D,$54,$57   ; $DEA2 - $DEA7
    .byte $F5,$6D,$FD,$7D,$55,$D7   ; $DEA8 - $DEAD
    .byte $C4,$EC,$44,$44,$C5,$CF   ; $DEAE - $DEB3
    .byte $DD,$6D,$7D,$7D,$55,$D7   ; $DEB4 - $DEB9
    .byte $C5,$44,$7C,$7C,$44,$57   ; $DEBA - $DEBF
    .byte $FF,$FF,$FF,$FF,$FF,$FF   ; $DEC0 - $DEC5   top

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;                  regular
; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX   | DEEA | DEEB | DEEC | DEED | DEEE | DEEF |
; XX   X XX XX  XX XXXX XXXX    X XX XX   X    X X   | DEE4 | DEE5 | DEE6 | DEE7 | DEE8 | DEE9 |
; X XXXX XX X XX X XXXX XXXX XXXX  X X XXXX XXXX X   | DEDE | DEDF | DEE0 | DEE1 | DEE2 | DEE3 |
; X XXXX    X    X XXXX XXXX   XX X  X XXXX   XX X   | DED8 | DED9 | DEDA | DEDB | DEDC | DEDD |
; X XXXX XX X XX X XXXX XXXX XXXX XX X XX X XXXXXX   | DED2 | DED3 | DED4 | DED5 | DED6 | DED7 |
; XX   X XX X XX X    X    X    X XX XX   X    X X   | DECC | DECD | DECE | DECF | DED0 | DED1 |
; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX   | DEC6 | DEC7 | DEC8 | DEC9 | DECA | DECB |
;
;                  inverted
;                                                    | DEEA | DEEB | DEEC | DEED | DEEE | DEEF |
;   XXX X  X  XX  X    X    XXXX X  X  XXX XXXX X    | DEE4 | DEE5 | DEE6 | DEE7 | DEE8 | DEE9 |
;  X    X  X X  X X    X    X    XX X X    X    X    | DEDE | DEDF | DEE0 | DEE1 | DEE2 | DEE3 |
;  X    XXXX XXXX X    X    XXX  X XX X    XXX  X    | DED8 | DED9 | DEDA | DEDB | DEDC | DEDD |
;  X    X  X X  X X    X    X    X  X X  X X         | DED2 | DED3 | DED4 | DED5 | DED6 | DED7 |
;   XXX X  X X  X XXXX XXXX XXXX X  X  XXX XXXX X    | DECC | DECD | DECE | DECF | DED0 | DED1 |
;                                                    | DEC6 | DEC7 | DEC8 | DEC9 | DECA | DECB |


Challenge:
    .byte $FF,$FF,$FF,$FF,$FF,$FF   ; $DEC6 - $DECB   bottom
    .byte $C5,$AD,$08,$42,$D8,$85   ; $DECC - $DED1
    .byte $BD,$AD,$7B,$DE,$D6,$BF   ; $DED2 - $DED7
    .byte $BC,$21,$7B,$C6,$97,$8D   ; $DED8 - $DEDD
    .byte $BD,$AD,$7B,$DE,$57,$BD   ; $DEDE - $DEE3
    .byte $C5,$B3,$7B,$C2,$D8,$85   ; $DEE4 - $DEE9
    .byte $FF,$FF,$FF,$FF,$FF,$FF   ; $DEEA - $DEEF   top

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SolarCellColTab:
    .byte $96  ; $DEF0
    .byte $D6  ; $DEF1
    .byte $38  ; $DEF2
    .byte $38  ; $DEF3
    .byte $78  ; $DEF4
    .byte $1A  ; $DEF5
    .byte $42  ; $DEF6
    .byte $32  ; $DEF7
    .byte $48  ; $DEF8
    .byte $C8  ; $DEF9
    .byte $44  ; $DEFA
    .byte $30  ; $DEFB
    .byte $1C  ; $DEFC
    .byte $42  ; $DEFD
    .byte $74  ; $DEFE
    .byte $C4  ; $DEFF

NumberPtrsTab:
    .word  Zero          ; $DF00
    .word  One           ; $DF02
    .word  Two           ; $DF04
    .word  Three         ; $DF06
    .word  Four          ; $DF08
    .word  Five          ; $DF0A
    .word  Six           ; $DF0C
    .word  Seven         ; $DF0E
    .word  Eight         ; $DF10
    .word  Nine          ; $DF12

Zero:
    .byte $3E ; |  XXXXX | $DF14
    .byte $63 ; | XX   XX| $DF15
    .byte $63 ; | XX   XX| $DF16
    .byte $63 ; | XX   XX| $DF17
    .byte $63 ; | XX   XX| $DF18
    .byte $63 ; | XX   XX| $DF19
    .byte $3E ; |  XXXXX | $DF1A
One:
    .byte $7E ; | XXXXXX | $DF1B
    .byte $18 ; |   XX   | $DF1C
    .byte $18 ; |   XX   | $DF1D
    .byte $18 ; |   XX   | $DF1E
    .byte $18 ; |   XX   | $DF1F
    .byte $38 ; |  XXX   | $DF20
    .byte $18 ; |   XX   | $DF21
Two:
    .byte $7F ; | XXXXXXX| $DF22
    .byte $70 ; | XXX    | $DF23
    .byte $3C ; |  XXXX  | $DF24
    .byte $1E ; |   XXXX | $DF25
    .byte $07 ; |     XXX| $DF26
    .byte $63 ; | XX   XX| $DF27
    .byte $3E ; |  XXXXX | $DF28
Three:
    .byte $3E ; |  XXXXX | $DF29
    .byte $63 ; | XX   XX| $DF2A
    .byte $03 ; |      XX| $DF2B
    .byte $1E ; |   XXXX | $DF2C
    .byte $0C ; |    XX  | $DF2D
    .byte $06 ; |     XX | $DF2E
    .byte $3F ; |  XXXXXX| $DF2F
Four:
    .byte $06 ; |     XX | $DF30
    .byte $06 ; |     XX | $DF31
    .byte $7E ; | XXXXXX | $DF32
    .byte $66 ; | XX  XX | $DF33
    .byte $36 ; |  XX XX | $DF34
    .byte $1E ; |   XXXX | $DF35
    .byte $0E ; |    XXX | $DF36
Five:
    .byte $3E ; |  XXXXX | $DF37
    .byte $63 ; | XX   XX| $DF38
    .byte $03 ; |      XX| $DF39
    .byte $03 ; |      XX| $DF3A
    .byte $7E ; | XXXXXX | $DF3B
    .byte $60 ; | XX     | $DF3C
    .byte $7F ; | XXXXXXX| $DF3D
Six:
    .byte $3E ; |  XXXXX | $DF3E
    .byte $63 ; | XX   XX| $DF3F
    .byte $63 ; | XX   XX| $DF40
    .byte $7E ; | XXXXXX | $DF41
    .byte $60 ; | XX     | $DF42
    .byte $30 ; |  XX    | $DF43
    .byte $1E ; |   XXXX | $DF44
Seven:
    .byte $18 ; |   XX   | $DF45
    .byte $18 ; |   XX   | $DF46
    .byte $18 ; |   XX   | $DF47
    .byte $0C ; |    XX  | $DF48
    .byte $06 ; |     XX | $DF49
    .byte $63 ; | XX   XX| $DF4A
    .byte $7E ; | XXXXXX | $DF4B
Eight:
    .byte $3E ; |  XXXXX | $DF4C
    .byte $63 ; | XX   XX| $DF4D
    .byte $63 ; | XX   XX| $DF4E
    .byte $3E ; |  XXXXX | $DF4F
    .byte $63 ; | XX   XX| $DF50
    .byte $63 ; | XX   XX| $DF51
    .byte $3E ; |  XXXXX | $DF52
Nine:
    .byte $3C ; |  XXXX  | $DF53
    .byte $06 ; |     XX | $DF54
    .byte $03 ; |      XX| $DF55
    .byte $3F ; |  XXXXXX| $DF56
    .byte $63 ; | XX   XX| $DF57
    .byte $63 ; | XX   XX| $DF58
    .byte $3E ; |  XXXXX | $DF59
LDF5A:
    .byte $00 ; |        | $DF5A    $00
    .byte $00 ; |        | $DF5B    $01
    .byte $00 ; |        | $DF5C    $02
    .byte $01 ; |       X| $DF5D    $03
    .byte $00 ; |        | $DF5E    $04
    .byte $08 ; |    X   | $DF5F    $05
    .byte $00 ; |        | $DF60    $06
    .byte $09 ; |    X  X| $DF61    $07
    .byte $00 ; |        | $DF62    $08
    .byte $40 ; | X      | $DF63    $09
    .byte $00 ; |        | $DF64    $0A
    .byte $41 ; | X     X| $DF65    $0B
    .byte $00 ; |        | $DF66    $0C
    .byte $48 ; | X  X   | $DF67    $0D
    .byte $00 ; |        | $DF68    $0E
    .byte $49 ; | X  X  X| $DF69    $0F
    .byte $40 ; | X      | $DF6A    $10
    .byte $00 ; |        | $DF6B    $11
    .byte $40 ; | X      | $DF6C    $12
    .byte $01 ; |       X| $DF6D    $13
    .byte $40 ; | X      | $DF6E    $14
    .byte $08 ; |    X   | $DF6F    $15
    .byte $40 ; | X      | $DF70    $16
    .byte $09 ; |    X  X| $DF71    $17
    .byte $40 ; | X      | $DF72    $18
    .byte $40 ; | X      | $DF73    $19
    .byte $40 ; | X      | $DF74    $1A
    .byte $41 ; | X     X| $DF75    $1B
    .byte $40 ; | X      | $DF76    $1C
    .byte $48 ; | X  X   | $DF77    $1D
    .byte $40 ; | X      | $DF78    $1E
    .byte $49 ; | X  X  X| $DF79    $1F
    .byte $08 ; |    X   | $DF7A    $20
    .byte $00 ; |        | $DF7B    $21
    .byte $08 ; |    X   | $DF7C    $22
    .byte $01 ; |       X| $DF7D    $23
    .byte $08 ; |    X   | $DF7E    $24
    .byte $08 ; |    X   | $DF7F    $25
    .byte $08 ; |    X   | $DF80    $26
    .byte $09 ; |    X  X| $DF81    $27
    .byte $08 ; |    X   | $DF82    $28
    .byte $40 ; | X      | $DF83    $29
    .byte $08 ; |    X   | $DF84    $2A
    .byte $41 ; | X     X| $DF85    $2B
    .byte $08 ; |    X   | $DF86    $2C
    .byte $48 ; | X  X   | $DF87    $2D
    .byte $08 ; |    X   | $DF88    $2E
    .byte $49 ; | X  X  X| $DF89    $2F
    .byte $48 ; | X  X   | $DF8A    $30
    .byte $00 ; |        | $DF8B    $31
    .byte $48 ; | X  X   | $DF8C    $32
    .byte $01 ; |       X| $DF8D    $33
    .byte $48 ; | X  X   | $DF8E    $34
    .byte $08 ; |    X   | $DF8F    $35
    .byte $48 ; | X  X   | $DF90    $36
    .byte $09 ; |    X  X| $DF91    $37
    .byte $48 ; | X  X   | $DF92    $38
    .byte $40 ; | X      | $DF93    $39
    .byte $48 ; | X  X   | $DF94    $3A
    .byte $41 ; | X     X| $DF95    $3B
    .byte $48 ; | X  X   | $DF96    $3C
    .byte $48 ; | X  X   | $DF97    $3D
    .byte $48 ; | X  X   | $DF98    $3E
    .byte $49 ; | X  X  X| $DF99    $3F
    .byte $01 ; |       X| $DF9A    $40
    .byte $00 ; |        | $DF9B    $41
    .byte $01 ; |       X| $DF9C    $42
    .byte $01 ; |       X| $DF9D    $43
    .byte $01 ; |       X| $DF9E    $44
    .byte $08 ; |    X   | $DF9F    $45
    .byte $01 ; |       X| $DFA0    $46
    .byte $09 ; |    X  X| $DFA1    $47
    .byte $01 ; |       X| $DFA2    $48
    .byte $40 ; | X      | $DFA3    $49
    .byte $01 ; |       X| $DFA4    $4A
    .byte $41 ; | X     X| $DFA5    $4B
    .byte $01 ; |       X| $DFA6    $4C
    .byte $48 ; | X  X   | $DFA7    $4D
    .byte $01 ; |       X| $DFA8    $4E
    .byte $49 ; | X  X  X| $DFA9    $4F
    .byte $41 ; | X     X| $DFAA    $50
    .byte $00 ; |        | $DFAB    $51
    .byte $41 ; | X     X| $DFAC    $52
    .byte $01 ; |       X| $DFAD    $53
    .byte $41 ; | X     X| $DFAE    $54
    .byte $08 ; |    X   | $DFAF    $55
    .byte $41 ; | X     X| $DFB0    $56
    .byte $09 ; |    X  X| $DFB1    $57
    .byte $41 ; | X     X| $DFB2    $58
    .byte $40 ; | X      | $DFB3    $59
    .byte $41 ; | X     X| $DFB4    $5A
    .byte $41 ; | X     X| $DFB5    $5B
    .byte $41 ; | X     X| $DFB6    $5C
    .byte $48 ; | X  X   | $DFB7    $5D
    .byte $41 ; | X     X| $DFB8    $5E
    .byte $49 ; | X  X  X| $DFB9    $5F
    .byte $09 ; |    X  X| $DFBA    $60
    .byte $00 ; |        | $DFBB    $61
    .byte $09 ; |    X  X| $DFBC    $62
    .byte $01 ; |       X| $DFBD    $63
    .byte $09 ; |    X  X| $DFBE    $64
    .byte $08 ; |    X   | $DFBF    $65
    .byte $09 ; |    X  X| $DFC0    $66
    .byte $09 ; |    X  X| $DFC1    $67
    .byte $09 ; |    X  X| $DFC2    $68
    .byte $40 ; | X      | $DFC3    $69
    .byte $09 ; |    X  X| $DFC4    $6A
    .byte $41 ; | X     X| $DFC5    $6B
    .byte $09 ; |    X  X| $DFC6    $6C
    .byte $48 ; | X  X   | $DFC7    $6D
    .byte $09 ; |    X  X| $DFC8    $6E
    .byte $49 ; | X  X  X| $DFC9    $6F
    .byte $49 ; | X  X  X| $DFCA    $70
    .byte $00 ; |        | $DFCB    $71
    .byte $49 ; | X  X  X| $DFCC    $72
    .byte $01 ; |       X| $DFCD    $73
    .byte $49 ; | X  X  X| $DFCE    $74
    .byte $08 ; |    X   | $DFCF    $75
    .byte $49 ; | X  X  X| $DFD0    $76
    .byte $09 ; |    X  X| $DFD1    $77
    .byte $49 ; | X  X  X| $DFD2    $78
    .byte $40 ; | X      | $DFD3    $79
    .byte $49 ; | X  X  X| $DFD4    $7A
    .byte $41 ; | X     X| $DFD5    $7B
    .byte $49 ; | X  X  X| $DFD6    $7C
    .byte $48 ; | X  X   | $DFD7    $7D
    .byte $49 ; | X  X  X| $DFD8    $7E
    .byte $49 ; | X  X  X| $DFD9    $7F
    
LDFDA:
    .byte $00 ; |        | $DFDA    NUSIZ0 table
    .byte $01 ; |       X| $DFDB
    .byte $01 ; |       X| $DFDC
    .byte $03 ; |      XX| $DFDD
    .byte $03 ; |      XX| $DFDE
LDFDF:
    .byte $00 ; |        | $DFDF    NUSIZ1 table
    .byte $00 ; |        | $DFE0
    .byte $01 ; |       X| $DFE1
    .byte $01 ; |       X| $DFE2
    .byte $03 ; |      XX| $DFE3
    
LDFE4:
    .byte  0,6,12,18,24,30,36,42,48,54  ; adding by six table
    
LDFEE:
    .byte $40 ; | X      | $DFEE
    .byte $20 ; |  X     | $DFEF
    .byte $10 ; |   X    | $DFF0
    .byte $08 ; |    X   | $DFF1

LDFF2:
    cmp    BANK_1                ; 4   bankswitch, goto LF3FE
;coming from bank 1
    jmp.ind ($0080)              ; 5

    .byte $00 ; |        | $DFF8
    .byte $22 ; |  X   X | $DFF9
    .byte $00 ; |        | $DFFA
    .byte $00 ; |        | $DFFB

       ORG $1FFC
      RORG $DFFC

    .word START_2nd,0



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SECOND BANK
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ORG $2000
       RORG $F000

START_2nd:
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    
ClearRamTIA:
    sei                          ; 2
    cld                          ; 2
    lda    #0                    ; 2
    tax                          ; 2
.loopClear:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    .loopClear            ; 2³
    
    dex                          ; 2
    txs                          ; 2
    stx    $A8                   ; 3
    stx    $A9                   ; 3
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    jsr    LF1AE                 ; 6
    jsr    LF1C2                 ; 6
    jmp    LF08E                 ; 3

LF020:
    jsr    LF1AE                 ; 6
    jsr    LF1C2                 ; 6
    jsr    LF3D7                 ; 6
    lda    $E3                   ; 3
    and    #$10                  ; 2
    beq    LF038                 ; 2³
    lda    $E3                   ; 3
    and    #$2C                  ; 2
    sta    $E3                   ; 3
    jmp    LF115                 ; 3

LF038:
    lda    #$40                  ; 2
    jsr    LF4BD                 ; 6
    lda    $E5                   ; 3
    and    #$08                  ; 2
    bne    LF050                 ; 2³
    lda    $E5                   ; 3
    and    #$E7                  ; 2
    sta    $E5                   ; 3
LF049:
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    bne    LF071                 ; 2³
LF050:
    lda    $E3                   ; 3
    and    #$24                  ; 2
    ora    #$02                  ; 2
    sta    $E3                   ; 3
    ldy    #0                    ; 2
    sty    $8A                   ; 3
    sty    $E5                   ; 3
LF05E:
    jsr    LF3D7                 ; 6
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    beq    LF05E                 ; 2³
    lda    $E5                   ; 3
    and    #$E7                  ; 2
    sta    $E5                   ; 3
    jmp    LF020                 ; 3

LF071:
    lda    $E3                   ; 3
    and    #$24                  ; 2
    sta    $E3                   ; 3
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    bne    LF08E                 ; 2³
    lda    $E3                   ; 3
    and    #$24                  ; 2
    ora    #$08                  ; 2
    sta    $E3                   ; 3
    ldy    #0                    ; 2
    sty    $8A                   ; 3
    sty    $E5                   ; 3
    beq    LF109                 ; 3+1   always branch

LF08E:
    lda    #$10                  ; 2
    bit    $8A                   ; 3
    bne    LF0AA                 ; 2³
    lda    $8A                   ; 3
    ora    #$10                  ; 2
    sta    $8A                   ; 3
    ldy    #0                    ; 2
    sty    $EF                   ; 3
    lda    #$24                  ; 2
    sta    $8F                   ; 3
    lda    #4                    ; 2
    sta    $8D                   ; 3
    lda    #$50                  ; 2
    sta    $8C                   ; 3
LF0AA:
    inc    $EE                   ; 5
    bne    LF100                 ; 2³+1
    inc    $EF                   ; 5
    lda    #1                    ; 2
    cmp    $EF                   ; 3
    bne    LF100                 ; 2³+1
    lda    $8A                   ; 3
    clc                          ; 2
    adc    #$40                  ; 2
    sta    $8A                   ; 3
    and    #$C0                  ; 2
    bne    LF0DC                 ; 2³
    lda    $8A                   ; 3
    and    #$01                  ; 2
    beq    LF0CD                 ; 2³
    jsr    SwapRegisters         ; 6
    jmp    LF0DC                 ; 3

LF0CD:
    lda    $AA                   ; 3
    cmp    #4                    ; 2
    bcc    LF0D9                 ; 2³
    lda    #0                    ; 2
    sta    $AA                   ; 3
    sta    $AB                   ; 3
LF0D9:
    jsr    LF1C2                 ; 6
LF0DC:
    ldy    #0                    ; 2
    sty    $EF                   ; 3
    lda    $8A                   ; 3
    and    #$C0                  ; 2
    cmp    #$80                  ; 2
    bne    LF0F4                 ; 2³
    lda    $8A                   ; 3
    and    #$01                  ; 2
    beq    LF0F4                 ; 2³
    jsr    SwapRegisters         ; 6
    jmp    LF100                 ; 3

LF0F4:
    lda    $8A                   ; 3
    and    #$C0                  ; 2
    cmp    #$40                  ; 2
    bne    LF100                 ; 2³+1
    ldy    #1                    ; 2
    sty    $DD                   ; 3
LF100:
    jsr    LF615                 ; 6
    jsr    LF3D7                 ; 6
    jmp    LF049                 ; 3

LF109:
    jsr    LF3D7                 ; 6
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    beq    LF109                 ; 2³
    bne    LF157                 ; 3   always branch

LF115:
    lda    #1                    ; 2
    sta    $DD                   ; 3
    lda    $8A                   ; 3
    and    #$02                  ; 2
    bne    LF125                 ; 2³
    lda    $8A                   ; 3
    ora    #$04                  ; 2
    sta    $8A                   ; 3
LF125:
    lda    #$20                  ; 2
    jsr    LF4BD                 ; 6
    lda    $E5                   ; 3
    and    #$08                  ; 2
    bne    LF16C                 ; 2³
    lda    $E5                   ; 3
    and    #$10                  ; 2
    bne    LF157                 ; 2³
    lda    $8A                   ; 3
    and    #$22                  ; 2
    sta    $8A                   ; 3
    lda    #0                    ; 2
    sta    $EE                   ; 3
    lda    $E5                   ; 3
    ora    #$04                  ; 2
    sta    $E5                   ; 3
    lda    #0                    ; 2
    sta    frameCounter          ; 3
LF14A:
    jsr    LF3D7                 ; 6
    jsr    LF4EA                 ; 6
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    bne    LF165                 ; 2³
LF157:
    lda    $E5                   ; 3
    and    #$67                  ; 2
    sta    $E5                   ; 3
    lda    $E3                   ; 3
    ora    #$10                  ; 2
    sta    $E3                   ; 3
    bne    LF16C                 ; 3   always branch

LF165:
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    bne    LF18B                 ; 2³
LF16C:
    lda    #0                    ; 2
    sta    $8A                   ; 3
    sta    $AA                   ; 3
    sta    $AB                   ; 3
    sta    $89                   ; 3
    sta    $AF                   ; 3
    lda    $E5                   ; 3
    and    #$F7                  ; 2
    sta    $E5                   ; 3
LF17E:
    jsr    LF3D7                 ; 6
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    beq    LF17E                 ; 2³
    jmp    LF020                 ; 3

LF18B:
    lda    $8A                   ; 3
    and    #$01                  ; 2
    beq    LF14A                 ; 2³
    lda    #$20                  ; 2
    jsr    LF4BD                 ; 6
    lda    $E5                   ; 3
    and    #$E7                  ; 2
    sta    $E5                   ; 3
    lda    $8A                   ; 3
    and    #$20                  ; 2
    beq    LF1A5                 ; 2³
    jsr    SwapRegisters         ; 6
LF1A5:
    jmp    LF049                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ShiftRight5Times SUBROUTINE
    lsr                          ; 2
ShiftRight4Times SUBROUTINE
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF1AE SUBROUTINE
    lda    #0                    ; 2
    sta    $89                   ; 3
    sta    $AF                   ; 3
    ldx    #3                    ; 2
    lda    #0                    ; 2   score at the beginning of the game
LF1B8:
    sta    scoreBCD,X            ; 4   initial score is 000000
    dex                          ; 2
    bpl    LF1B8                 ; 2³
    lda    #$33                  ; 2
    sta    $E4                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF1C2 SUBROUTINE
    lda    $E3                   ; 3
    and    #$02                  ; 2
    beq    LF1E8                 ; 2³
    lda    $8A                   ; 3
    and    #$FE                  ; 2
    sta    $8A                   ; 3
    lda    $E3                   ; 3
    and    #$04                  ; 2
    bne    LF1DC                 ; 2³
    lda    $E3                   ; 3
    ora    #$04                  ; 2
    sta    $E3                   ; 3
    bne    LF1E8                 ; 3   always branch

LF1DC:
    lda    $E3                   ; 3
    eor    #$20                  ; 2
    sta    $E3                   ; 3
    lda    $E3                   ; 3
    and    #$22                  ; 2
    sta    $E3                   ; 3
LF1E8:
    lda    $E5                   ; 3
    and    #$01                  ; 2
    bne    LF200                 ; 2³+1
    lda    $E3                   ; 3
    ora    #$01                  ; 2
    sta    $E3                   ; 3
    lda    $8A                   ; 3
    and    #$10                  ; 2
    bne    LF200                 ; 2³+1
    lda    #0                    ; 2
    sta    $AA                   ; 3
    sta    $AB                   ; 3
LF200:
    lda    $8A                   ; 3
    and    #$02                  ; 2
    bne    LF211                 ; 2³
    inc    $AA                   ; 5
    lda    $E3                   ; 3
    and    #$20                  ; 2
    beq    LF211                 ; 2³
    jmp    LF2B7                 ; 3

LF211:
    lda    $AA                   ; 3
LF213:
    cmp    #$15                  ; 2   is it less then #$15?
    bcc    LF21B                 ; 2³  - yes, branch
    sbc    #$14                  ; 2   - no, subtract #$14
    bne    LF213                 ; 3   value will be greater then 0, so always branch

LF21B:
    sta    $82                   ; 3
    lda    $8A                   ; 3
    and    #$10                  ; 2
    beq    LF228                 ; 2³
    lda    $82                   ; 3
    jmp    LF2C1                 ; 3

LF228:
    lda    $8A                   ; 3
    and    #$02                  ; 2
    beq    LF239                 ; 2³
    lda    $8A                   ; 3
    and    #$FD                  ; 2
    sta    $8A                   ; 3
    lda    $82                   ; 3
    jmp    LF2C1                 ; 3

LF239:
    lda    $AA                   ; 3
    cmp    #1                    ; 2
    beq    LF25A                 ; 2³
    lda    $82                   ; 3
    cmp    #$0B                  ; 2
    beq    LF249                 ; 2³
    cmp    #1                    ; 2
    bne    LF25A                 ; 2³   might always branch

LF249:
    lda    $8A                   ; 3
    and    #$20                  ; 2
    beq    LF258                 ; 2³
    lda    $E4                   ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    $E4                   ; 3
    bne    LF25A                 ; 2³
LF258:
    inc    $E4                   ; 5
LF25A:
    lda    $AF                   ; 3
    and    #$0F                  ; 2
    cmp    #5                    ; 2
    bcs    LF267                 ; 2³
    lda    $82                   ; 3
    jmp    LF2C1                 ; 3

LF267:
    lda    $AF                   ; 3
    and    #$F0                  ; 2
    sta    $AF                   ; 3
    lda    $E5                   ; 3
    and    #$BF                  ; 2
    sta    $E5                   ; 3
    lda    $8A                   ; 3
    and    #$20                  ; 2
    bne    LF28F                 ; 2³
    inc    $89                   ; 5
    lda    $89                   ; 3
    and    #$0F                  ; 2
    cmp    #7                    ; 2
    bmi    LF2AA                 ; 2³
    lda    $89                   ; 3
    and    #$F0                  ; 2
    ora    #$01                  ; 2
    sta    $89                   ; 3
    and    #$0F                  ; 2
    bne    LF2AA                 ; 3   always branch

LF28F:
    lda    $89                   ; 3
    and    #$F0                  ; 2
    clc                          ; 2
    adc    #$10                  ; 2
    cmp    #$60                  ; 2
    bmi    LF29C                 ; 2³
    lda    #$10                  ; 2
LF29C:
    sta    $83                   ; 3
    lda    $89                   ; 3
    and    #$0F                  ; 2
    ora    $83                   ; 3
    sta    $89                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
LF2AA:
    tay                          ; 2
    lda    $8A                   ; 3
    ora    #$02                  ; 2
    sta    $8A                   ; 3
    tya                          ; 2
    clc                          ; 2
    adc    #$14                  ; 2
    bne    LF2C1                 ; 2³   might always branch

LF2B7:
    lda    $AA                   ; 3
    cmp    #7                    ; 2
    bne    LF2C1                 ; 2³
    lda    #1                    ; 2
    sta    $AA                   ; 3
LF2C1:
    tay                          ; 2
    sta    $81                   ; 3
    lda    #0                    ; 2
    clc                          ; 2
    jmp    LF2CC                 ; 3

LF2CA:
    adc    #9                    ; 2
LF2CC:
    dey                          ; 2
    bne    LF2CA                 ; 2³
    tay                          ; 2
    ldx    #8                    ; 2
LF2D2:
    lda    LevelGfx,Y            ; 4
    sta    $B0,X                 ; 4
    sta    $B9,X                 ; 4
    iny                          ; 2
    dex                          ; 2
    bpl    LF2D2                 ; 2³
    ldx    $81                   ; 3
    lda    LFEC7-1,X             ; 4
    sta    $AC                   ; 3
    lda    #2                    ; 2
    bit    $E3                   ; 3
    bne    LF2F2                 ; 2³
    lda    $AE                   ; 3
    and    #$0F                  ; 2
    ora    #$C0                  ; 2
    sta    $AE                   ; 3
LF2F2:
    jsr    LF319                 ; 6
    lda    $E5                   ; 3
    and    #$01                  ; 2
    bne    LF318                 ; 2³+1
    lda    $E3                   ; 3
    and    #$01                  ; 2
    bne    LF305                 ; 2³
    jsr    SwapRegisters         ; 6
    rts                          ; 6

LF305:
    lda    $E3                   ; 3
    eor    #$01                  ; 2
    sta    $E3                   ; 3
    jsr    SwapRegisters         ; 6
    jsr    LF3D7                 ; 6
    lda    #1                    ; 2
    sta    $AA                   ; 3
    jmp    LF2C1                 ; 3

LF318:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF319 SUBROUTINE
    lda    #$40                  ; 2   also jumped to by $FDC8
    sta    $8D                   ; 3
    lda    #$54                  ; 2
    sta    $8F                   ; 3
    lda    #$55                  ; 2
    sta    $90                   ; 3
    lda    #$DB                  ; 2
    sta    $EC                   ; 3
    lda    #0                    ; 2
    clc                          ; 2
    adc    $8D                   ; 3
    bcc    LF332                 ; 2³
    inc    $EC                   ; 5
LF332:
    sta    $EB                   ; 3
    lda    $E5                   ; 3
    ora    #$20                  ; 2
    sta    $E5                   ; 3
    lda    #0                    ; 2   shared
    sta    $8B                   ; 3
    sta    $8C                   ; 3
    ldx    #3                    ; 2
    sta    COLUBK                ; 3   black - main background color
LF344:
    sta    $9F,X                 ; 4
    dex                          ; 2
    bpl    LF344                 ; 2³
    ldx    #$0D                  ; 2
LF34B:
    sta    $91,X                 ; 4
    dex                          ; 2
    bpl    LF34B                 ; 2³
    lda    #$6C                  ; 2
    sta    $EF                   ; 3
    sta    frameCounter          ; 3
    lda    #$DD                  ; 2
    sta    $E8                   ; 3
    lda    #$C9                  ; 2
    sta    $E7                   ; 3
    lda    #$DD                  ; 2
    sta    $EA                   ; 3
    lda    #$ED                  ; 2
    sta    $E9                   ; 3
    lda    #$A4                  ; 2
    sta    $DC                   ; 3
    lda    $AA                   ; 3
LF36C:
    cmp    #$15                  ; 2
    bcc    LF374                 ; 2³
    sbc    #$14                  ; 2
    bne    LF36C                 ; 3   always branch

LF374:
    sec                          ; 2
    sbc    #1                    ; 2
    ldx    #0                    ; 2
LF379:
    inx                          ; 2
    sbc    #5                    ; 2
    bcs    LF379                 ; 2³
    stx    $A3                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SwapRegisters SUBROUTINE
    lda    scoreHiBCD            ; 3
    ldx    $A6                   ; 3
    sta    $A6                   ; 3   swap $A4 and $A6
    stx    scoreHiBCD            ; 3
    
    lda    scoreMidBCD           ; 3
    ldx    $A7                   ; 3
    stx    scoreMidBCD           ; 3   swap $A5 and $A7
    sta    $A7                   ; 3
    
    lda    $AC                   ; 3
    ldx    $AD                   ; 3
    stx    $AC                   ; 3   swap $AC and $AD
    sta    $AD                   ; 3
    
    ldx    #$11                  ; 2
LF39B:
    lda    $B0,X                 ; 4
    ldy    $C2,X                 ; 4
    sty    $B0,X                 ; 4   swap registers ($B0-$C1) and ($C2-$D3)
    sta    $C2,X                 ; 4
    dex                          ; 2
    bpl    LF39B                 ; 2³
    
    lda    $AA                   ; 3
    ldx    $AB                   ; 3
    sta    $AB                   ; 3   swap $AA and $AB
    stx    $AA                   ; 3
    
  IF ORIGINAL
    
    lda    $AF                   ; 3   swap the nybbles in $AF
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $AF                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $AF                   ; 3
    txa                          ; 2
    ora    $AF                   ; 3
    sta    $AF                   ; 3
    lda    $AE                   ; 3   swap the nybbles in $AE
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $AE                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $AE                   ; 3
    txa                          ; 2
    ora    $AE                   ; 3
    sta    $AE                   ; 3
    rts                          ; 6
    
  ELSE OPTIMAL

;save 34 cycles, 16 bytes, and X register
    lda    $AF                    ; 3   swap the nybbles in $AF
    asl                           ; 2
    adc    #$80                   ; 2
    rol                           ; 2
    asl                           ; 2
    adc    #$80                   ; 2
    rol                           ; 2
    sta    $AF                    ; 3
    lda    $AE                    ; 3   swap the nybbles in $AE
    asl                           ; 2
    adc    #$80                   ; 2
    rol                           ; 2
    asl                           ; 2
    adc    #$80                   ; 2
    rol                           ; 2
    sta    $AE                    ; 3
    rts                           ; 6
    
;filler
    NOP  ; free byte
    NOP  ; free byte
    NOP  ; free byte
    NOP  ; free byte
    NOP  ; free byte
    NOP  ; free byte
    NOP  ; free byte
    NOP  ; free byte
    NOP  ; free byte
    NOP  ; free byte
    NOP  ; free byte
    NOP  ; free byte
    NOP  ; free byte
    NOP  ; free byte
    NOP  ; free byte
    NOP  ; free byte
    
  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF3D7 SUBROUTINE
    jsr    LF423                 ; 6
    sta    CXCLR                 ; 3
    lda    frameCounter          ; 3
    and    #$01                  ; 2
    beq    LF3F2                 ; 2³
    lda    $E7                   ; 3
    ldx    $E9                   ; 3
    sta    $E9                   ; 3
    stx    $E7                   ; 3
    lda    $E8                   ; 3
    ldx    $EA                   ; 3
    sta    $EA                   ; 3
    stx    $E8                   ; 3
LF3F2:
    lda    INTIM                 ; 4
    bne    LF3F2                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    jmp    LF418                 ; 3

LF3FE:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$2A                  ; 2
    sta    VBLANK                ; 3
    sta    VSYNC                 ; 3
    sta    TIM8T                 ; 4
LF409:
    lda    INTIM                 ; 4
    bne    LF409                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #$24                  ; 2
    sta    TIM64T                ; 4
    rts                          ; 6

LF418:
    lda    #>LD003               ; 2   load indirect jump address
    sta    $81                   ; 3
    lda    #<LD003               ; 2
    sta    $80                   ; 3
    jmp    LFFF2                 ; 3   bankswitch, do indirect jump

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF423 SUBROUTINE
    lda    $DD                   ; 3
    beq    LF435                 ; 2³
    cmp    #$34                  ; 2
    beq    LF45C                 ; 2³
    bne    LF45C                 ; 3   always branch

MF42D:
    cmp    #$45                  ; 2   find indirect jump to here
    beq    LF45C                 ; 2³
    ldx    $DE                   ; 3
    beq    LF45C                 ; 2³   might always branch

LF435:
    ldx    $DE                   ; 3
    beq    LF492                 ; 2³
    lda    $E0                   ; 3
    beq    LF440                 ; 2³
    dec    $E0                   ; 5
    rts                          ; 6

LF440:
    lda    LFF55,X               ; 4
    jsr    ShiftRight5Times      ; 6
    sta    $E0                   ; 3
    lda    $E0                   ; 3
    beq    LF44E                 ; 2³
    inc    $E0                   ; 5
LF44E:
    dec    $DF                   ; 5
    lda    $DF                   ; 3
    bne    LF499                 ; 2³
    lda    $DE                   ; 3
    clc                          ; 2
    adc    #4                    ; 2
    jmp    LF460                 ; 3

LF45C:
    ldx    #0                    ; 2
    stx    $DD                   ; 3
LF460:
    sta    $DE                   ; 3
    tax                          ; 2
    lda    LFF54,X               ; 4
    beq    LF492                 ; 2³
    sta    $DF                   ; 3
    lda    LFF55,X               ; 4
    and    #$1F                  ; 2
    sta    AUDC0                 ; 3
    lda    LFF55,X               ; 4
    jsr    ShiftRight5Times      ; 6
    sta    $E0                   ; 3
    cmp    #0                    ; 2
    beq    LF47F                 ; 2³
    inc    $E0                   ; 5
LF47F:
    lda    LFF57,X               ; 4
    and    #$1F                  ; 2
    sta    AUDF0                 ; 3
    sta    $E2                   ; 3
    lda    LFF56,X               ; 4
    and    #$0F                  ; 2
    sta    AUDV0                 ; 3
    sta    $E1                   ; 3
    rts                          ; 6

LF492:
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    $DE                   ; 3
    rts                          ; 6

LF499:
    lda    LFF56,X               ; 4
    jsr    ShiftRight4Times      ; 6
    sec                          ; 2
    sbc    #8                    ; 2
    clc                          ; 2
    adc    $E1                   ; 3
    and    #$0F                  ; 2
    sta    $E1                   ; 3
    sta    AUDV0                 ; 3
    lda    LFF57,X               ; 4
    jsr    ShiftRight5Times      ; 6
    sec                          ; 2
    sbc    #4                    ; 2
    adc    $E2                   ; 3
    and    #$1F                  ; 2
    sta    $E2                   ; 3
    sta    AUDF0                 ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF4BD SUBROUTINE
    asl                          ; 2
    asl                          ; 2
LF4BF:
    pha                          ; 3
    jsr    LF3D7                 ; 6
    pla                          ; 4
    sta    $80                   ; 3
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    bne    LF4D4                 ; 2³
    lda    $E5                   ; 3
    ora    #$08                  ; 2
    sta    $E5                   ; 3
    rts                          ; 6

LF4D4:
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    bne    LF4E2                 ; 2³
    lda    $E5                   ; 3
    ora    #$10                  ; 2
    sta    $E5                   ; 3
    rts                          ; 6

LF4E2:
    lda    $80                   ; 3
    sec                          ; 2
    sbc    #1                    ; 2
    bne    LF4BF                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF4EA SUBROUTINE
    jsr    LF5B1                 ; 6
    jsr    LF615                 ; 6
    jsr    LFA2B                 ; 6
    jsr    LFAC8                 ; 6
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcc    LF4FC                 ; 2³
    rts                          ; 6

LF4FC:
    jsr    LF844                 ; 6
    lda    $E3                   ; 3
    and    #$20                  ; 2
    beq    LF508                 ; 2³
    jmp    LF596                 ; 3

LF508:
    lda    $E5                   ; 3
    and    #$04                  ; 2
    beq    LF517                 ; 2³
    lda    $E5                   ; 3
    and    #$FB                  ; 2
    sta    $E5                   ; 3
    jmp    LF52F                 ; 3

LF517:
    lda    $AE                   ; 3
    and    #$F0                  ; 2
    bne    LF520                 ; 2³
    jmp    LF596                 ; 3

LF520:
    dec    $EE                   ; 5
    bne    LF596                 ; 2³
    sec                          ; 2
    lda    $AE                   ; 3
    sbc    #$20                  ; 2
    sta    $AE                   ; 3
    and    #$F0                  ; 2
    beq    LF565                 ; 2³
LF52F:
    lda    $8A                   ; 3
    and    #$02                  ; 2
    bne    LF549                 ; 2³
    lda    $AA                   ; 3
LF537:
    cmp    #$15                  ; 2
    bcc    LF53F                 ; 2³
    sbc    #$14                  ; 2
    bne    LF537                 ; 3   always branch

LF53F:
    tax                          ; 2
    dex                          ; 2
    lda    LF597,X               ; 4
    sta    $EE                   ; 3
    jmp    LF596                 ; 3

LF549:
    lda    $8A                   ; 3
    and    #$20                  ; 2
    beq    LF557                 ; 2³
    lda    $89                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bpl    LF55B                 ; 3   always branch

LF557:
    lda    $89                   ; 3
    and    #$0F                  ; 2
LF55B:
    tax                          ; 2
    dex                          ; 2
    lda    LF5AB,X               ; 4
    sta    $EE                   ; 3
    jmp    LF596                 ; 3

LF565:
    lda    $8A                   ; 3
    and    #$02                  ; 2
    bne    LF578                 ; 2³
    lda    #0                    ; 2
    sta    $EE                   ; 3
    lda    $AE                   ; 3
    and    #$0F                  ; 2
    sta    $AE                   ; 3
    jmp    LF596                 ; 3

LF578:
    lda    $E3                   ; 3
    ora    #$40                  ; 2
    sta    $E3                   ; 3
    lda    $8A                   ; 3
    and    #$20                  ; 2
    beq    LF58E                 ; 2³
    lda    $89                   ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    $89                   ; 3
    jmp    LF590                 ; 3

LF58E:
    dec    $89                   ; 5
LF590:
    lda    #0                    ; 2
    sta    $EE                   ; 3
    sta    $AE                   ; 3
LF596:
    rts                          ; 6

LF597:
    .byte $32 ; |  XX  X | $F597
    .byte $32 ; |  XX  X | $F598
    .byte $37 ; |  XX XXX| $F599
    .byte $32 ; |  XX  X | $F59A
    .byte $46 ; | X   XX | $F59B
    .byte $4B ; | X  X XX| $F59C
    .byte $78 ; | XXXX   | $F59D
    .byte $6E ; | XX XXX | $F59E
    .byte $73 ; | XXX  XX| $F59F
    .byte $96 ; |X  X XX | $F5A0
    .byte $64 ; | XX  X  | $F5A1
    .byte $73 ; | XXX  XX| $F5A2
    .byte $5F ; | X XXXXX| $F5A3
    .byte $73 ; | XXX  XX| $F5A4
    .byte $A0 ; |X X     | $F5A5
    .byte $7D ; | XXXXX X| $F5A6
    .byte $69 ; | XX X  X| $F5A7
    .byte $87 ; |X    XXX| $F5A8
    .byte $87 ; |X    XXX| $F5A9
    .byte $82 ; |X     X | $F5AA
LF5AB:
    .byte $23 ; |  X   XX| $F5AB
    .byte $17 ; |   X XXX| $F5AC
    .byte $28 ; |  X X   | $F5AD
    .byte $20 ; |  X     | $F5AE
    .byte $23 ; |  X   XX| $F5AF
    .byte $24 ; |  X  X  | $F5B0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF5B1 SUBROUTINE
    lda    $8A                   ; 3
    and    #$20                  ; 2
    bne    LF5BF                 ; 2³
    lda    SWCHA                 ; 4
    jsr    ShiftRight4Times      ; 6
    bne    LF5C4                 ; 2³
LF5BF:
    lda    SWCHA                 ; 4
    and    #$0F                  ; 2
LF5C4:
    cmp    $8B                   ; 3
    bne    LF5C9                 ; 2³
    rts                          ; 6

LF5C9:
    sta    $8B                   ; 3
    lda    $8C                   ; 3
    and    #$60                  ; 2
    lsr                          ; 2
    ora    $8B                   ; 3
    tax                          ; 2
    ldy    LFF15,X               ; 4
    tya                          ; 2
    bne    LF5DA                 ; 2³
    rts                          ; 6

LF5DA:
    lda    $E5                   ; 3
    and    #$DF                  ; 2
    sta    $E5                   ; 3
    tya                          ; 2
    and    #$F0                  ; 2
    bne    LF5E8                 ; 2³
    tya                          ; 2     LF5DA is branched to when Y is not equal to zero, and Y's value hasn't changed.
    bne    LF608                 ; 3+1   always branch

LF5E8:
    lda    $8C                   ; 3
    and    #$0F                  ; 2
    sta    $83                   ; 3
    lda    $8F                   ; 3
    cmp    #$1E                  ; 2
    bne    LF5F9                 ; 2³
LF5F4:
    tya                          ; 2
    and    #$0F                  ; 2
    bne    LF608                 ; 2³+1
LF5F9:
    cmp    #$78                  ; 2
    beq    LF5F4                 ; 2³
    tya                          ; 2
    jsr    ShiftRight4Times      ; 6
    cmp    $83                   ; 3
    bne    LF608                 ; 2³
    tya                          ; 2
    and    #$0F                  ; 2
LF608:
    sta    $83                   ; 3
    sta    $83                   ; 3
    lda    $8C                   ; 3
    and    #$F0                  ; 2
    ora    $83                   ; 3
    sta    $8C                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF615 SUBROUTINE
    lda    $8A                   ; 3
    and    #$10                  ; 2
    bne    LF622                 ; 2³
    lda    $E5                   ; 3
    and    #$20                  ; 2
    beq    LF622                 ; 2³
    rts                          ; 6

LF622:
    lda    $8C                   ; 3
    and    #$0F                  ; 2
    sta    $83                   ; 3
    bne    LF633                 ; 2³
    lda    $8C                   ; 3
    and    #$F0                  ; 2
    jsr    ShiftRight4Times      ; 6
    sta    $83                   ; 3
LF633:
    cmp    #1                    ; 2
    beq    LF63E                 ; 2³
    cmp    #5                    ; 2
    beq    LF63E                 ; 2³
    jmp    LF70B                 ; 3

LF63E:
    clc                          ; 2
    lda    #$24                  ; 2
LF641:
    cmp    $8F                   ; 3
    beq    LF664                 ; 2³
    adc    #1                    ; 2
    cmp    $8F                   ; 3
    bne    LF650                 ; 2³
    dec    $8F                   ; 5
    jmp    LF664                 ; 3

LF650:
    adc    #$0B                  ; 2
    cmp    #$79                  ; 2
    bcc    LF641                 ; 2³
    lda    $8C                   ; 3
    and    #$F0                  ; 2
    cmp    #$70                  ; 2
    bne    LF661                 ; 2³
    jmp    LF798                 ; 3

LF661:
    jmp    LF737                 ; 3

LF664:
    lda    $83                   ; 3
    cmp    #1                    ; 2
    beq    LF6BB                 ; 2³
LF66A:
    lda    $8C                   ; 3
    and    #$0F                  ; 2
    ora    #$50                  ; 2
    sta    $8C                   ; 3
    lda    #$DB                  ; 2
    sta    $EC                   ; 3
    lda    #$92                  ; 2
    sta    $EB                   ; 3
    lda    #$10                  ; 2
    bit    $8A                   ; 3
    beq    LF691                 ; 2³
    lda    #$84                  ; 2
    cmp    $8D                   ; 3
    bne    LF697                 ; 2³
    lda    $8C                   ; 3
    and    #$0F                  ; 2
    ora    #$30                  ; 2
    sta    $8C                   ; 3
    jmp    LF708                 ; 3

LF691:
    lda    #$84                  ; 2
    cmp    $8D                   ; 3
    bcc    LF708                 ; 2³+1
LF697:
    jsr    LF7FE                 ; 6
    beq    LF6A3                 ; 2³
    clc                          ; 2
    lda    $8D                   ; 3
    adc    #2                    ; 2
    bne    LF6AE                 ; 2³
LF6A3:
    lda    $8E                   ; 3
    clc                          ; 2
    adc    #$C0                  ; 2
    sta    $8E                   ; 3
    lda    $8D                   ; 3
    adc    #0                    ; 2
LF6AE:
    sta    $8D                   ; 3
    lda    #$84                  ; 2
    cmp    $8D                   ; 3
    bcs    LF708                 ; 2³+1
    sta    $8D                   ; 3
    jmp    LF7EF                 ; 3

LF6BB:
    lda    $8C                   ; 3
    and    #$0F                  ; 2
    ora    #$10                  ; 2
    sta    $8C                   ; 3
    lda    #$DB                  ; 2
    sta    $EC                   ; 3
    lda    #0                    ; 2
    sta    $EB                   ; 3
    lda    #$10                  ; 2
    bit    $8A                   ; 3
    beq    LF6E1                 ; 2³
    lda    #4                    ; 2
    cmp    $8D                   ; 3
    bne    LF6E7                 ; 2³
    lda    $8C                   ; 3
    and    #$0F                  ; 2
    ora    #$70                  ; 2
    sta    $8C                   ; 3
    bne    LF708                 ; 3+1   always branch

LF6E1:
    lda    #4                    ; 2
    cmp    $8D                   ; 3
    bcs    LF708                 ; 2³+1
LF6E7:
    jsr    LF7FE                 ; 6
    beq    LF6F3                 ; 2³
    sec                          ; 2
    lda    $8D                   ; 3
    sbc    #2                    ; 2
    bne    LF6FE                 ; 2³
LF6F3:
    lda    $8E                   ; 3
    sec                          ; 2
    sbc    #$C0                  ; 2
    sta    $8E                   ; 3
    lda    $8D                   ; 3
    sbc    #0                    ; 2
LF6FE:
    sta    $8D                   ; 3
    lda    #4                    ; 2
    cmp    $8D                   ; 3
    bcc    LF708                 ; 2³
    sta    $8D                   ; 3
LF708:
    jmp    LF7EF                 ; 3

LF70B:
    lda    $8D                   ; 3
    and    #$0F                  ; 2
    cmp    #4                    ; 2
    beq    LF729                 ; 2³
    cmp    #5                    ; 2
    beq    LF729                 ; 2³
    cmp    #6                    ; 2
    beq    LF729                 ; 2³
    lda    $8C                   ; 3
    and    #$F0                  ; 2
    cmp    #$10                  ; 2
    bne    LF726                 ; 2³
    jmp    LF6BB                 ; 3

LF726:
    jmp    LF66A                 ; 3

LF729:
    lda    $8D                   ; 3
    and    #$F0                  ; 2
    ora    #$05                  ; 2
    sta    $8D                   ; 3
    lda    $83                   ; 3
    cmp    #7                    ; 2
    beq    LF798                 ; 2³
LF737:
    lda    $8C                   ; 3
    and    #$0F                  ; 2
    ora    #$30                  ; 2
    sta    $8C                   ; 3
    lda    #$DC                  ; 2
    sta    $EC                   ; 3
    lda    #$26                  ; 2
    sta    $EB                   ; 3
    lda    #$10                  ; 2
    bit    $8A                   ; 3
    beq    LF75E                 ; 2³
    lda    #$78                  ; 2
    cmp    $8F                   ; 3
    bne    LF767                 ; 2³
    lda    $8C                   ; 3
    and    #$0F                  ; 2
    ora    #$10                  ; 2
    sta    $8C                   ; 3
    jmp    LF7EF                 ; 3

LF75E:
    lda    #$78                  ; 2
    cmp    $8F                   ; 3
    bcs    LF767                 ; 2³
    jmp    LF7EF                 ; 3

LF767:
    jsr    LF7FE                 ; 6
    beq    LF77D                 ; 2³
    lda    $90                   ; 3
    clc                          ; 2
    adc    #$55                  ; 2
    php                          ; 3
    adc    #0                    ; 2
    sta    $90                   ; 3
    plp                          ; 4
    lda    $8F                   ; 3
    adc    #1                    ; 2
    bne    LF788                 ; 2³   might always branch

LF77D:
    lda    $90                   ; 3
    clc                          ; 2
    adc    #$80                  ; 2
    sta    $90                   ; 3
    lda    $8F                   ; 3
    adc    #0                    ; 2
LF788:
    sta    $8F                   ; 3
    lda    #$78                  ; 2
    cmp    $8F                   ; 3
    bcs    LF7EF                 ; 2³
    sta    $8F                   ; 3
    lda    #0                    ; 2
    sta    $90                   ; 3
    bcc    LF7EF                 ; 3   always branch

LF798:
    lda    $8C                   ; 3
    and    #$0F                  ; 2
    ora    #$70                  ; 2
    sta    $8C                   ; 3
    lda    #$DC                  ; 2
    sta    $EC                   ; 3
    lda    #$26                  ; 2
    sta    $EB                   ; 3
    lda    #$10                  ; 2
    bit    $8A                   ; 3
    beq    LF7BE                 ; 2³
    lda    #$24                  ; 2
    cmp    $8F                   ; 3
    bne    LF7C4                 ; 2³
    lda    $8C                   ; 3
    and    #$0F                  ; 2
    ora    #$50                  ; 2
    sta    $8C                   ; 3
    bne    LF7EF                 ; 3   always branch

LF7BE:
    lda    #$24                  ; 2
    cmp    $8F                   ; 3
    bcs    LF7EF                 ; 2³
LF7C4:
    jsr    LF7FE                 ; 6
    beq    LF7DA                 ; 2³
    lda    $90                   ; 3
    sec                          ; 2
    sbc    #$55                  ; 2
    php                          ; 3
    sbc    #0                    ; 2
    sta    $90                   ; 3
    plp                          ; 4
    lda    $8F                   ; 3
    sbc    #1                    ; 2
    bne    LF7E5                 ; 2³   might always branch

LF7DA:
    lda    $90                   ; 3
    sec                          ; 2
    sbc    #$80                  ; 2
    sta    $90                   ; 3
    lda    $8F                   ; 3
    sbc    #0                    ; 2
LF7E5:
    sta    $8F                   ; 3
    lda    #$24                  ; 2
    cmp    $8F                   ; 3
    bcc    LF7EF                 ; 2³
    sta    $8F                   ; 3
LF7EF:
    lda    $8D                   ; 3
    sec                          ; 2
    sbc    #4                    ; 2
    clc                          ; 2
    adc    $EB                   ; 3
    bcc    LF7FB                 ; 2³
    inc    $EC                   ; 5
LF7FB:
    sta    $EB                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF7FE SUBROUTINE
    lda    #$10                  ; 2
    bit    $8A                   ; 3
    bne    LF823                 ; 2³
    ldy    SWCHB                 ; 4
    lda    $8A                   ; 3
    and    #$20                  ; 2
    beq    LF812                 ; 2³
    lda    INPT5                 ; 3
    jmp    LF814                 ; 3

LF812:
    lda    INPT4                 ; 3
LF814:
    and    #$80                  ; 2
    beq    LF830                 ; 2³
    lda    $8A                   ; 3
    and    #$20                  ; 2
    beq    LF829                 ; 2³
    tya                          ; 2
    and    #$80                  ; 2
    beq    LF826                 ; 2³
LF823:
    ldx    #1                    ; 2
    rts                          ; 6

LF826:
    ldx    #0                    ; 2
    rts                          ; 6

LF829:
    tya                          ; 2
    and    #$40                  ; 2
    beq    LF826                 ; 2³
    bne    LF823                 ; 3   always branch

LF830:
    lda    $8A                   ; 3
    and    #$20                  ; 2
    beq    LF83D                 ; 2³
    tya                          ; 2
    and    #$80                  ; 2
    beq    LF823                 ; 2³
    bne    LF826                 ; 3   always branch

LF83D:
    tya                          ; 2
    and    #$40                  ; 2
    beq    LF823                 ; 2³
    bne    LF826                 ; 3   always branch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF844 SUBROUTINE
    lda    $8A                   ; 3
    and    #$02                  ; 2
    bne    LF8B6                 ; 2³
    lda    $DC                   ; 3
    and    #$7F                  ; 2
    sta    $83                   ; 3
    ldx    #7                    ; 2
LF852:
    lda    LFDCB,X               ; 4
    cmp    $83                   ; 3
    beq    LF85D                 ; 2³
    dex                          ; 2
    bpl    LF852                 ; 2³
    rts                          ; 6

LF85D:
    lda    $E3                   ; 3
    and    #$20                  ; 2
    beq    LF86B                 ; 2³
    lda    $EF                   ; 3
    and    #$80                  ; 2
    bne    LF894                 ; 2³
    beq    LF871                 ; 3   always branch

LF86B:
    lda    $A8                   ; 3
    cmp    #$80                  ; 2
    bcc    LF894                 ; 2³
LF871:
    lda    #0                    ; 2
    jsr    LF8DF                 ; 6
    bcc    LF885                 ; 2³
    lda    #$10                  ; 2
    sta    $83                   ; 3
    jsr    LF8B7                 ; 6
    lda    #$2F                  ; 2
    sta    $DD                   ; 3
    bne    LF88C                 ; 3   always branch

LF885:
    lda    #0                    ; 2
    sta    $83                   ; 3
    jsr    LF8B7                 ; 6
LF88C:
    lda    #$0F                  ; 2
    sta    $83                   ; 3
    jsr    LF8B7                 ; 6
    rts                          ; 6

LF894:
    lda    #1                    ; 2
    jsr    LF8DF                 ; 6
    bcc    LF8A8                 ; 2³
    lda    #$1F                  ; 2
    sta    $83                   ; 3
    jsr    LF8B7                 ; 6
    lda    #$2F                  ; 2
    sta    $DD                   ; 3
    bne    LF8AF                 ; 3   always branch

LF8A8:
    lda    #$0F                  ; 2
    sta    $83                   ; 3
    jsr    LF8B7                 ; 6
LF8AF:
    lda    #0                    ; 2
    sta    $83                   ; 3
    jsr    LF8B7                 ; 6
LF8B6:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF8B7 SUBROUTINE
    lda    $83                   ; 3
    and    #$0F                  ; 2
    bne    LF8D2                 ; 2³
    lda    $83                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ora    $9F                   ; 3
    cmp    #$FF                  ; 2
    bne    LF8CB                 ; 2³
    and    #$FE                  ; 2
LF8CB:
    sta    $9F                   ; 3
    asl    $9F                   ; 5
    rol    $A0                   ; 5
    rts                          ; 6

LF8D2:
    asl    $83                   ; 5
    asl    $83                   ; 5
    asl    $83                   ; 5
    asl    $83                   ; 5
    rol    $A1                   ; 5
    rol    $A2                   ; 5
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF8DF SUBROUTINE
    sta    $87                   ; 3
    lda    $E3                   ; 3
    and    #$20                  ; 2
    bne    LF938                 ; 2³+1
    lda    $81                   ; 3
    bne    LF906                 ; 2³+1
    ldx    #0                    ; 2
    lda    $8D                   ; 3
    cmp    #$40                  ; 2
    bcc    LF8F4                 ; 2³
    inx                          ; 2
LF8F4:
    lda    $8F                   ; 3
    sec                          ; 2
    sbc    $DC                   ; 3
    bcs    LF8FD                 ; 2³
    eor    #$FF                  ; 2
LF8FD:
    cmp    #$2A                  ; 2
    bcc    LF903                 ; 2³
    inx                          ; 2
    inx                          ; 2
LF903:
    jmp    LF921                 ; 3

LF906:
    ldx    #0                    ; 2
    lda    $8D                   ; 3
    cmp    #$40                  ; 2
    bcs    LF90F                 ; 2³
    inx                          ; 2
LF90F:
    lda    #$9C                  ; 2
    sec                          ; 2
    sbc    $DC                   ; 3
    sec                          ; 2
    sbc    $8F                   ; 3
    bcs    LF91B                 ; 2³
    eor    #$FF                  ; 2
LF91B:
    cmp    #$2A                  ; 2
    bcc    LF921                 ; 2³
    inx                          ; 2
    inx                          ; 2
LF921:
    lda    LFA27,X               ; 4
    sta    $80                   ; 3
    lda    $AA                   ; 3
    cmp    #$20                  ; 2
    bcc    LF92E                 ; 2³
    lda    #$20                  ; 2
LF92E:
    tax                          ; 2
    dex                          ; 2
    lda    LFA07,X               ; 4
    clc                          ; 2
    adc    $80                   ; 3
    sta    $84                   ; 3
LF938:
    lda    $A8                   ; 3
    sta    $80                   ; 3
    lda    $A9                   ; 3
    sta    $81                   ; 3
    
    asl    $80                   ; 5
    rol    $81                   ; 5
    asl    $80                   ; 5
    rol    $81                   ; 5
    asl    $80                   ; 5
    rol    $81                   ; 5
    asl    $80                   ; 5
    rol    $81                   ; 5
    
    lda    $80                   ; 3
    sta    $82                   ; 3
    lda    $81                   ; 3
    sta    $83                   ; 3
    
    eor    $A9                   ; 3
    sta    $81                   ; 3
    lda    $A8                   ; 3
    eor    $80                   ; 3
    sta    $80                   ; 3
    
    lda    $82                   ; 3
    ldx    $83                   ; 3
    sta    $83                   ; 3
    stx    $82                   ; 3
    asl    $82                   ; 5
    rol    $83                   ; 5
    lda    $80                   ; 3
    eor    $82                   ; 3
    sta    $80                   ; 3
    lda    $81                   ; 3
    eor    $83                   ; 3
    sta    $81                   ; 3
    asl    $82                   ; 5
    rol    $83                   ; 5
    asl    $82                   ; 5
    rol    $83                   ; 5
    lda    $80                   ; 3
    eor    $82                   ; 3
    sta    $80                   ; 3
    lda    $81                   ; 3
    eor    $83                   ; 3
    sta    $81                   ; 3
    asl    $80                   ; 5
    rol    $81                   ; 5
    rol    $A8                   ; 5
    rol    $A9                   ; 5
    lda    $E3                   ; 3
    and    #$20                  ; 2
    bne    LF9A1                 ; 2³
    lda    $84                   ; 3
    cmp    $A8                   ; 3
    rts                          ; 6

LF9A1:
    lda    $87                   ; 3
    bne    LF9E4                 ; 2³
    lda    $DC                   ; 3
    bmi    LF9AB                 ; 2³
    clc                          ; 2
    rts                          ; 6

LF9AB:
    lda    $DC                   ; 3
    and    #$7F                  ; 2
    sta    $82                   ; 3
    lda    $EF                   ; 3
    and    #$7F                  ; 2
    cmp    $82                   ; 3
    beq    LF9BB                 ; 2³
LF9B9:
    clc                          ; 2
    rts                          ; 6

LF9BB:
    ldx    #7                    ; 2
LF9BD:
    lda    LFDCB,X               ; 4
    cmp    $82                   ; 3
    beq    LF9C7                 ; 2³
    dex                          ; 2
    bpl    LF9BD                 ; 2³
LF9C7:
    tay                          ; 2
    lda    $EE                   ; 3
    eor    #$01                  ; 2
    sta    $EE                   ; 3
    bne    LF9B9                 ; 2³
    tya                          ; 2
    cpx    #7                    ; 2
    bne    LF9DA                 ; 2³
    lda    LFDCB                 ; 4
    bne    LF9DE                 ; 3   always branch

LF9DA:
    inx                          ; 2
    lda    LFDCB,X               ; 4
LF9DE:
    ora    #$80                  ; 2
    sta    $EF                   ; 3
    sec                          ; 2
    rts                          ; 6

LF9E4:
    lda    $DC                   ; 3
    bmi    LF9EA                 ; 2³
    clc                          ; 2
    rts                          ; 6

LF9EA:
    lda    $DC                   ; 3
    and    #$7F                  ; 2
    sta    $82                   ; 3
    lda    $EF                   ; 3
    and    #$7F                  ; 2
    cmp    $82                   ; 3
    beq    LF9FA                 ; 2³
LF9F8:
    clc                          ; 2
    rts                          ; 6

LF9FA:
    tay                          ; 2
    lda    $EE                   ; 3
    eor    #$01                  ; 2
    sta    $EE                   ; 3
    bne    LF9F8                 ; 2³+1
    sty    $EF                   ; 3
    sec                          ; 2
    rts                          ; 6

LFA07:
    .byte $20 ; |  X     | $FA07
    .byte $32 ; |  XX  X | $FA08
    .byte $3F ; |  XXXXXX| $FA09
    .byte $4C ; | X  XX  | $FA0A
    .byte $55 ; | X X X X| $FA0B
    .byte $5C ; | X XXX  | $FA0C
    .byte $62 ; | XX   X | $FA0D
    .byte $66 ; | XX  XX | $FA0E
    .byte $69 ; | XX X  X| $FA0F
    .byte $6B ; | XX X XX| $FA10
    .byte $6D ; | XX XX X| $FA11
    .byte $6F ; | XX XXXX| $FA12
    .byte $71 ; | XXX   X| $FA13
    .byte $73 ; | XXX  XX| $FA14
    .byte $74 ; | XXX X  | $FA15
    .byte $75 ; | XXX X X| $FA16
    .byte $75 ; | XXX X X| $FA17
    .byte $76 ; | XXX XX | $FA18
    .byte $76 ; | XXX XX | $FA19
    .byte $77 ; | XXX XXX| $FA1A
    .byte $77 ; | XXX XXX| $FA1B
    .byte $77 ; | XXX XXX| $FA1C
    .byte $78 ; | XXXX   | $FA1D
    .byte $78 ; | XXXX   | $FA1E
    .byte $78 ; | XXXX   | $FA1F
    .byte $79 ; | XXXX  X| $FA20
    .byte $79 ; | XXXX  X| $FA21
    .byte $7A ; | XXXX X | $FA22
    .byte $7A ; | XXXX X | $FA23
    .byte $7B ; | XXXX XX| $FA24
    .byte $7C ; | XXXXX  | $FA25
    .byte $7D ; | XXXXX X| $FA26
LFA27:
    .byte $20 ; |  X     | $FA27
    .byte $10 ; |   X    | $FA28
    .byte $08 ; |    X   | $FA29
    .byte $04 ; |     X  | $FA2A

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFA2B SUBROUTINE
    lda    #2                    ; 2
    bit    $8A                   ; 3
    beq    LFA34                 ; 2³
    jmp    LFAC7                 ; 3

LFA34:
    lda    $DC                   ; 3
    bmi    LFA43                 ; 2³
    sec                          ; 2
    sbc    #1                    ; 2
    cmp    #$1E                  ; 2
    bne    LFA4C                 ; 2³
    ora    #$80                  ; 2
    bne    LFA4C                 ; 3   always branch

LFA43:
    clc                          ; 2
    adc    #1                    ; 2
    cmp    #$FE                  ; 2
    bne    LFA4C                 ; 2³
    and    #$7F                  ; 2
LFA4C:
    sta    $DC                   ; 3
    ldy    #0                    ; 2
    ldx    #$0C                  ; 2
    lda    frameCounter          ; 3
    and    #$01                  ; 2
    bne    LFA5D                 ; 2³
    lda    $9F                   ; 3
    jmp    LFA5F                 ; 3

LFA5D:
    lda    $A1                   ; 3
LFA5F:
    sta    $82                   ; 3
LFA61:
    lda    $82                   ; 3
    lsr                          ; 2
    bcc    LFA6C                 ; 2³
    sta    $82                   ; 3
    lda    #7                    ; 2
    bne    LFA70                 ; 3   always branch

LFA6C:
    sta    $82                   ; 3
    lda    #0                    ; 2
LFA70:
    sta    $83                   ; 3
    lda    frameCounter          ; 3
    and    #$01                  ; 2
    bne    LFA80                 ; 2³
    lda    $83                   ; 3
    sta.wy $91,Y                 ; 5
    jmp    LFA84                 ; 3

LFA80:
    lda    $83                   ; 3
    sta    $91,X                 ; 4
LFA84:
    iny                          ; 2
    cpy    #8                    ; 2
    bne    LFA98                 ; 2³
    lda    frameCounter          ; 3
    and    #$01                  ; 2
    bne    LFA94                 ; 2³
    lda    $A0                   ; 3
    jmp    LFA96                 ; 3

LFA94:
    lda    $A2                   ; 3
LFA96:
    sta    $82                   ; 3
LFA98:
    dex                          ; 2
    bpl    LFA61                 ; 2³
    inc    $E7                   ; 5
    bne    LFAA1                 ; 2³
    inc    $E8                   ; 5
LFAA1:
    lda    $E7                   ; 3
    cmp    #5                    ; 2
    bne    LFAAF                 ; 2³
    lda    #$DD                  ; 2
    sta    $E8                   ; 3
    lda    #$45                  ; 2
    sta    $E7                   ; 3
LFAAF:
    dec    $E9                   ; 5
    lda    #$FF                  ; 2
    cmp    $E9                   ; 3
    bne    LFAB9                 ; 2³
    dec    $EA                   ; 5
LFAB9:
    lda    $E9                   ; 3
    cmp    #$45                  ; 2
    bne    LFAC7                 ; 2³
    lda    #$DE                  ; 2
    sta    $EA                   ; 3
    lda    #5                    ; 2
    sta    $E9                   ; 3
LFAC7:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFAC8 SUBROUTINE
    lda    #$40                  ; 2
    bit    $E3                   ; 3
    beq    LFAD1                 ; 2³
    jmp    LFB60                 ; 3

LFAD1:
    lda    CXPPMM                ; 3
    bmi    LFADE                 ; 2³
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcc    LFADD                 ; 2³
    jsr    LFBA0                 ; 6
LFADD:
    rts                          ; 6

LFADE:
    ldx    #$0D                  ; 2
    lda    #0                    ; 2
    sta    $9F                   ; 3
    sta    $A0                   ; 3
    sta    $A1                   ; 3
    sta    $A2                   ; 3
LFAEA:
    sta    $91,X                 ; 4
    dex                          ; 2
    bpl    LFAEA                 ; 2³
    lda    #$34                  ; 2
    sta    $DD                   ; 3
    jsr    LFD86                 ; 6
    lda    $8A                   ; 3
    and    #$20                  ; 2
    bne    LFB01                 ; 2³+1
    dec    $E4                   ; 5
    jmp    LFB08                 ; 3

LFB01:
    lda    $E4                   ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    $E4                   ; 3
LFB08:
    lda    $AE                   ; 3
    and    #$0F                  ; 2
    sta    $AE                   ; 3
    lda    #0                    ; 2
    sta    $EE                   ; 3
    sta    $EF                   ; 3
    lda    $E3                   ; 3
    and    #$04                  ; 2
    beq    LFB3C                 ; 2³
    lda    $8A                   ; 3
    and    #$20                  ; 2
    bne    LFB2E                 ; 2³
    lda    #$F0                  ; 2
    bit    $E4                   ; 3
    bne    LFB49                 ; 2³
    lda    #$0F                  ; 2
    bit    $E4                   ; 3
    bne    LFB60                 ; 2³
    beq    LFB42                 ; 3   always branch

LFB2E:
    lda    #$0F                  ; 2
    bit    $E4                   ; 3
    bne    LFB49                 ; 2³
    lda    #$F0                  ; 2
    bit    $E4                   ; 3
    bne    LFB60                 ; 2³
    beq    LFB42                 ; 3   always branch

LFB3C:
    lda    #$0F                  ; 2
    bit    $E4                   ; 3
    bne    LFB60                 ; 2³
LFB42:
    lda    $8A                   ; 3
    ora    #$01                  ; 2
    sta    $8A                   ; 3
    rts                          ; 6

LFB49:
    lda    $8A                   ; 3
    eor    #$20                  ; 2
    sta    $8A                   ; 3
    jsr    SwapRegisters         ; 6
    lda    $AA                   ; 3
    cmp    #1                    ; 2
    bne    LFB60                 ; 2³
    lda    $E5                   ; 3
    ora    #$04                  ; 2
    sta    $E5                   ; 3
    bne    LFB7B                 ; 3   always branch

LFB60:
    lda    $E3                   ; 3
    and    #$40                  ; 2
    beq    LFB7B                 ; 2³
    lda    $E5                   ; 3
    ora    #$01                  ; 2
    sta    $E5                   ; 3
    jsr    LF1C2                 ; 6
    lda    $E3                   ; 3
    and    #$2C                  ; 2
    sta    $E3                   ; 3
    lda    $E5                   ; 3
    ora    #$04                  ; 2
    sta    $E5                   ; 3
LFB7B:
    lda    #0                    ; 2   unknown
    sta    COLUBK                ; 3
    jsr    LF319                 ; 6
    lda    $8A                   ; 3
    and    #$02                  ; 2
    bne    LFB9F                 ; 2³
    lda    $8A                   ; 3
    ora    #$04                  ; 2
    sta    $8A                   ; 3
    lda    #$30                  ; 2
    jsr    LF4BD                 ; 6
    lda    $E5                   ; 3
    and    #$E7                  ; 2
    sta    $E5                   ; 3
    lda    $8A                   ; 3
    and    #$20                  ; 2
    sta    $8A                   ; 3
LFB9F:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBA0 SUBROUTINE
    lda    $8D                   ; 3
    and    #$0F                  ; 2
    cmp    #3                    ; 2
    beq    LFBC3                 ; 2³
    cmp    #4                    ; 2
    beq    LFBC3                 ; 2³
    cmp    #5                    ; 2
    beq    LFBC3                 ; 2³
    cmp    #6                    ; 2
    beq    LFBC3                 ; 2³
    cmp    #7                    ; 2
    beq    LFBC3                 ; 2³
    cmp    #8                    ; 2
    beq    LFBC3                 ; 2³
    lda    $E5                   ; 3
    and    #$FD                  ; 2
    sta    $E5                   ; 3
    rts                          ; 6

LFBC3:
    ldx    #1                    ; 2
    clc                          ; 2
    lda    #$23                  ; 2
LFBC8:
    cmp    $8F                   ; 3
    beq    LFBEC                 ; 2³
    adc    #1                    ; 2
    cmp    $8F                   ; 3
    beq    LFBEC                 ; 2³
    adc    #1                    ; 2
    cmp    $8F                   ; 3
    beq    LFBEC                 ; 2³
    adc    #1                    ; 2
    cmp    $8F                   ; 3
    beq    LFBEC                 ; 2³
    inx                          ; 2
    adc    #9                    ; 2
    cmp    #$79                  ; 2
    bcc    LFBC8                 ; 2³
    lda    $E5                   ; 3
    and    #$FD                  ; 2
    sta    $E5                   ; 3
    rts                          ; 6

LFBEC:
    lda    $8D                   ; 3
    and    #$F0                  ; 2
    jsr    ShiftRight4Times      ; 6
    tay                          ; 2
    stx    $81                   ; 3
    jsr    LFCD7                 ; 6
    bcc    LFC18                 ; 2³+1
    jsr    LFCDF                 ; 6
    lda    $8A                   ; 3
    and    #$02                  ; 2
    bne    LFC32                 ; 2³
    lda    $AA                   ; 3
LFC06:
    cmp    #$15                  ; 2
    bcc    LFC0E                 ; 2³
    sbc    #$14                  ; 2
    bne    LFC06                 ; 3   always branch

LFC0E:
    cmp    #7                    ; 2
    bcc    LFC21                 ; 2³
    jsr    LFD0B                 ; 6
    jmp    LFC32                 ; 3

LFC18:
    lda    $E5                   ; 3
    and    #$02                  ; 2
    beq    LFC21                 ; 2³
    jmp    LFCD6                 ; 3

LFC21:
    ldx    $81                   ; 3
    tya                          ; 2
    adc    #9                    ; 2
    tay                          ; 2
    jsr    LFCD7                 ; 6
    bcc    LFC32                 ; 2³
    jsr    LFCDF                 ; 6
    jsr    LFD0B                 ; 6
LFC32:
    lda    $AC                   ; 3
    beq    LFC37                 ; 2³
    rts                          ; 6

LFC37:
    lda    #0                    ; 2
    sta    $9F                   ; 3
    sta    $A0                   ; 3
    sta    $A1                   ; 3
    sta    $A2                   ; 3
    ldx    #$0D                  ; 2
LFC43:
    sta    $91,X                 ; 4
    dex                          ; 2
    bpl    LFC43                 ; 2³
    lda    #8                    ; 2
    jsr    LF4BD                 ; 6
    lda    $E5                   ; 3
    and    #$7F                  ; 2
    sta    $E5                   ; 3
    lda    #$20                  ; 2
    bit    $E3                   ; 3
    bne    LFC88                 ; 2³
    lda    $AE                   ; 3
    and    #$E0                  ; 2
    beq    LFC88                 ; 2³
    lda    #0                    ; 2
    sta    $EE                   ; 3
    sta    $EF                   ; 3
    lda    $E3                   ; 3
    ora    #$80                  ; 2
    sta    $E3                   ; 3
    jsr    LFD0B                 ; 6
    lda    #2                    ; 2
    bit    $8A                   ; 3
    bne    LFC78                 ; 2³
    inc    $AA                   ; 5
    inc    $AF                   ; 5
LFC78:
    lda    #$45                  ; 2
    sta    $DD                   ; 3
    lda    #2                    ; 2
    bit    $8A                   ; 3
    beq    LFC88                 ; 2³
    lda    $8A                   ; 3
    ora    #$08                  ; 2
    sta    $8A                   ; 3
LFC88:
    lda    #$20                  ; 2
    jsr    LF4BD                 ; 6
    lda    $E5                   ; 3
    and    #$18                  ; 2
    bne    LFCD6                 ; 2³
    lda    #$20                  ; 2
    bit    $E3                   ; 3
    bne    LFCA1                 ; 2³
    lda    #2                    ; 2
    bit    $8A                   ; 3
    bne    LFCA1                 ; 2³
    inc    $AF                   ; 5
LFCA1:
    lda    $8A                   ; 3
    and    #$22                  ; 2
    sta    $8A                   ; 3
    lda    $E5                   ; 3
    ora    #$01                  ; 2
    sta    $E5                   ; 3
    jsr    LF1C2                 ; 6
    lda    $E5                   ; 3
    eor    #$01                  ; 2
    sta    $E5                   ; 3
    jsr    LF319                 ; 6
    lda    $8A                   ; 3
    and    #$02                  ; 2
    bne    LFCC5                 ; 2³
    lda    $8A                   ; 3
    ora    #$04                  ; 2
    sta    $8A                   ; 3
LFCC5:
    lda    #$20                  ; 2
    jsr    LF4BD                 ; 6
    lda    $8A                   ; 3
    and    #$22                  ; 2
    sta    $8A                   ; 3
    lda    $E5                   ; 3
    ora    #$04                  ; 2
    sta    $E5                   ; 3
LFCD6:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFCD7 SUBROUTINE
    lda.wy $B0,Y                 ; 4
.loopShiftLeft:
    asl                          ; 2
    dex                          ; 2
    bne    .loopShiftLeft        ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFCDF SUBROUTINE
    ldx    $81                   ; 3
    lda    #$FF                  ; 2
    clc                          ; 2
LFCE4:
    ror                          ; 2
    dex                          ; 2
    bne    LFCE4                 ; 2³
    and.wy $B0,Y                 ; 4
    sta.wy $B0,Y                 ; 5
    dec    $AC                   ; 5
    tax                          ; 2
    lda    $8A                   ; 3
    and    #$02                  ; 2
    beq    LFD00                 ; 2³+1
    txa                          ; 2
    and.wy $B9,Y                 ; 4
    sta.wy $B9,Y                 ; 5
    dec    $AC                   ; 5
LFD00:
    lda    $E5                   ; 3
    ora    #$02                  ; 2
    sta    $E5                   ; 3
    lda    #$2A                  ; 2
    sta    $DD                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD0B SUBROUTINE
    lda    #0                    ; 2
    sta    $81                   ; 3
    lda    $E3                   ; 3
    and    #$80                  ; 2
    beq    LFD76                 ; 2³
    lda    $8A                   ; 3
    and    #$02                  ; 2
    bne    LFD50                 ; 2³
    inc    $AA                   ; 5
    lda    $AA                   ; 3
LFD1F:
    cmp    #$15                  ; 2
    bcc    LFD27                 ; 2³
    sbc    #$14                  ; 2
    bne    LFD1F                 ; 3   always branch

LFD27:
    sbc    #0                    ; 2
    asl                          ; 2
    tax                          ; 2
    beq    LFD31                 ; 2³
    cpx    #$14                  ; 2
    bne    LFD42                 ; 2³
LFD31:
    lda    $8A                   ; 3
    and    #$20                  ; 2
    beq    LFD40                 ; 2³
    lda    $E4                   ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    $E4                   ; 3
    bne    LFD42                 ; 2³
LFD40:
    inc    $E4                   ; 5
LFD42:
    lda    LFEE1,X               ; 4
    sta    $A3                   ; 3
    lda    LFEE2,X               ; 4
    sta    $81                   ; 3
    dec    $AA                   ; 5
    bne    LFD70                 ; 2³
LFD50:
    lda    $8A                   ; 3
    and    #$20                  ; 2
    beq    LFD5D                 ; 2³
    lda    $89                   ; 3
    jsr    ShiftRight4Times      ; 6
    bne    LFD61                 ; 2³
LFD5D:
    lda    $89                   ; 3
    and    #$0F                  ; 2
LFD61:
    sec                          ; 2
    sbc    #1                    ; 2
    asl                          ; 2
    tax                          ; 2
    lda    LFF09,X               ; 4
    sta    $A3                   ; 3
    lda    LFF0A,X               ; 4
    sta    $81                   ; 3
LFD70:
    lda    $E3                   ; 3
    eor    #$80                  ; 2
    sta    $E3                   ; 3
LFD76:
    sed                          ; 2
    clc                          ; 2
    lda    scoreMidBCD           ; 3
    adc    $A3                   ; 3
    sta    scoreMidBCD           ; 3
    lda    scoreHiBCD            ; 3
    adc    $81                   ; 3
    sta    scoreHiBCD            ; 3
    cld                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD86 SUBROUTINE
    lda    #$99                  ; 2
    sta    $ED                   ; 3
    ldx    #9                    ; 2
LFD8C:
    lda    FlashScreenColTab,X   ; 4   when you get hit the backround flashes
    sta    COLUBK                ; 3
    jsr    LF3D7                 ; 6
    lda    $ED                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    dex                          ; 2
    bmi    LFDA0                 ; 2³
    dec    $ED                   ; 5
    bne    LFD8C                 ; 2³
LFDA0:
    lda    $ED                   ; 3
    jsr    ShiftRight4Times      ; 6
    tay                          ; 2
    dey                          ; 2
    beq    LFDB9                 ; 2³
    lda    #9                    ; 2
    sta    $ED                   ; 3
    tax                          ; 2
    tya                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    $ED                   ; 3
    sta    $ED                   ; 3
    bne    LFD8C                 ; 3   always branch

LFDB9:
    lda    #0                    ; 2   unknown
    sta    COLUBK                ; 3
    lda    #$20                  ; 2
    jsr    LF4BD                 ; 6
    lda    $E5                   ; 3
    and    #$E7                  ; 2
    sta    $E5                   ; 3
    jmp    LF319                 ; 3   other half of subroutine

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFDCB:
    .byte $24 ; |  X  X  | $FDCB
    .byte $30 ; |  XX    | $FDCC
    .byte $3C ; |  XXXX  | $FDCD
    .byte $48 ; | X  X   | $FDCE
    .byte $54 ; | X X X  | $FDCF
    .byte $60 ; | XX     | $FDD0
    .byte $6C ; | XX XX  | $FDD1
    .byte $78 ; | XXXX   | $FDD2

FlashScreenColTab:
    .byte $34  ; $FDD3   when you get hit the backround flashes
    .byte $32  ; $FDD4
    .byte $34  ; $FDD5
    .byte $38  ; $FDD6
    .byte $34  ; $FDD7
    .byte $38  ; $FDD8
    .byte $3E  ; $FDD9
    .byte $34  ; $FDDA
    .byte $38  ; $FDDB
    .byte $3E  ; $FDDC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LevelGfx:

LevelOne:
    .byte $00 ; |        | $FDDD
    .byte $3C ; |  XXXX  | $FDDE
    .byte $7E ; | XXXXXX | $FDDF
    .byte $66 ; | XX  XX | $FDE0
    .byte $66 ; | XX  XX | $FDE1
    .byte $66 ; | XX  XX | $FDE2
    .byte $7E ; | XXXXXX | $FDE3
    .byte $3C ; |  XXXX  | $FDE4
    .byte $00 ; |        | $FDE5
LevelTwo:
    .byte $18 ; |   XX   | $FDE6
    .byte $3C ; |  XXXX  | $FDE7
    .byte $7E ; | XXXXXX | $FDE8
    .byte $18 ; |   XX   | $FDE9
    .byte $18 ; |   XX   | $FDEA
    .byte $18 ; |   XX   | $FDEB
    .byte $7E ; | XXXXXX | $FDEC
    .byte $3C ; |  XXXX  | $FDED
    .byte $18 ; |   XX   | $FDEE
LevelThree:
    .byte $18 ; |   XX   | $FDEF
    .byte $3C ; |  XXXX  | $FDF0
    .byte $3C ; |  XXXX  | $FDF1
    .byte $66 ; | XX  XX | $FDF2
    .byte $E7 ; |XXX  XXX| $FDF3
    .byte $66 ; | XX  XX | $FDF4
    .byte $3C ; |  XXXX  | $FDF5
    .byte $3C ; |  XXXX  | $FDF6
    .byte $18 ; |   XX   | $FDF7
LevelFour:
    .byte $00 ; |        | $FDF8
    .byte $00 ; |        | $FDF9
    .byte $FF ; |XXXXXXXX| $FDFA
    .byte $FF ; |XXXXXXXX| $FDFB
    .byte $7E ; | XXXXXX | $FDFC
    .byte $3C ; |  XXXX  | $FDFD
    .byte $18 ; |   XX   | $FDFE
    .byte $18 ; |   XX   | $FDFF
    .byte $00 ; |        | $FE00
LevelFive:
    .byte $18 ; |   XX   | $FE01
    .byte $18 ; |   XX   | $FE02
    .byte $18 ; |   XX   | $FE03
    .byte $18 ; |   XX   | $FE04
    .byte $3C ; |  XXXX  | $FE05
    .byte $3C ; |  XXXX  | $FE06
    .byte $3C ; |  XXXX  | $FE07
    .byte $7E ; | XXXXXX | $FE08
    .byte $FF ; |XXXXXXXX| $FE09
LevelSix:
    .byte $E7 ; |XXX  XXX| $FE0A
    .byte $A5 ; |X X  X X| $FE0B
    .byte $E7 ; |XXX  XXX| $FE0C
    .byte $3C ; |  XXXX  | $FE0D
    .byte $24 ; |  X  X  | $FE0E
    .byte $3C ; |  XXXX  | $FE0F
    .byte $E7 ; |XXX  XXX| $FE10
    .byte $A5 ; |X X  X X| $FE11
    .byte $E7 ; |XXX  XXX| $FE12
LevelSeven:
    .byte $E7 ; |XXX  XXX| $FE13
    .byte $C3 ; |XX    XX| $FE14
    .byte $81 ; |X      X| $FE15
    .byte $18 ; |   XX   | $FE16
    .byte $3C ; |  XXXX  | $FE17
    .byte $18 ; |   XX   | $FE18
    .byte $81 ; |X      X| $FE19
    .byte $C3 ; |XX    XX| $FE1A
    .byte $E7 ; |XXX  XXX| $FE1B
LevelEight:
    .byte $18 ; |   XX   | $FE1C
    .byte $3C ; |  XXXX  | $FE1D
    .byte $5A ; | X XX X | $FE1E
    .byte $5A ; | X XX X | $FE1F
    .byte $FF ; |XXXXXXXX| $FE20
    .byte $5A ; | X XX X | $FE21
    .byte $5A ; | X XX X | $FE22
    .byte $3C ; |  XXXX  | $FE23
    .byte $18 ; |   XX   | $FE24
LevelNine:
    .byte $C3 ; |XX    XX| $FE25
    .byte $C3 ; |XX    XX| $FE26
    .byte $24 ; |  X  X  | $FE27
    .byte $18 ; |   XX   | $FE28
    .byte $FF ; |XXXXXXXX| $FE29
    .byte $18 ; |   XX   | $FE2A
    .byte $24 ; |  X  X  | $FE2B
    .byte $C3 ; |XX    XX| $FE2C
    .byte $C3 ; |XX    XX| $FE2D
LevelTen:
    .byte $C3 ; |XX    XX| $FE2E
    .byte $C3 ; |XX    XX| $FE2F
    .byte $66 ; | XX  XX | $FE30
    .byte $3C ; |  XXXX  | $FE31
    .byte $18 ; |   XX   | $FE32
    .byte $3C ; |  XXXX  | $FE33
    .byte $66 ; | XX  XX | $FE34
    .byte $C3 ; |XX    XX| $FE35
    .byte $C3 ; |XX    XX| $FE36
LevelEleven:
    .byte $3C ; |  XXXX  | $FE37
    .byte $3C ; |  XXXX  | $FE38
    .byte $3C ; |  XXXX  | $FE39
    .byte $3C ; |  XXXX  | $FE3A
    .byte $3C ; |  XXXX  | $FE3B
    .byte $FF ; |XXXXXXXX| $FE3C
    .byte $7E ; | XXXXXX | $FE3D
    .byte $3C ; |  XXXX  | $FE3E
    .byte $18 ; |   XX   | $FE3F
LevelTwelve:
    .byte $3C ; |  XXXX  | $FE40
    .byte $3C ; |  XXXX  | $FE41
    .byte $3C ; |  XXXX  | $FE42
    .byte $FF ; |XXXXXXXX| $FE43
    .byte $FF ; |XXXXXXXX| $FE44
    .byte $FF ; |XXXXXXXX| $FE45
    .byte $3C ; |  XXXX  | $FE46
    .byte $3C ; |  XXXX  | $FE47
    .byte $3C ; |  XXXX  | $FE48
LevelThirteen:
    .byte $3C ; |  XXXX  | $FE49
    .byte $3C ; |  XXXX  | $FE4A
    .byte $66 ; | XX  XX | $FE4B
    .byte $C3 ; |XX    XX| $FE4C
    .byte $C3 ; |XX    XX| $FE4D
    .byte $C3 ; |XX    XX| $FE4E
    .byte $66 ; | XX  XX | $FE4F
    .byte $3C ; |  XXXX  | $FE50
    .byte $3C ; |  XXXX  | $FE51
LevelFourteen:
    .byte $18 ; |   XX   | $FE52
    .byte $3C ; |  XXXX  | $FE53
    .byte $7E ; | XXXXXX | $FE54
    .byte $FF ; |XXXXXXXX| $FE55
    .byte $3C ; |  XXXX  | $FE56
    .byte $FF ; |XXXXXXXX| $FE57
    .byte $7E ; | XXXXXX | $FE58
    .byte $3C ; |  XXXX  | $FE59
    .byte $18 ; |   XX   | $FE5A
LevelFiveteen:
    .byte $66 ; | XX  XX | $FE5B
    .byte $FF ; |XXXXXXXX| $FE5C
    .byte $FF ; |XXXXXXXX| $FE5D
    .byte $66 ; | XX  XX | $FE5E
    .byte $00 ; |        | $FE5F
    .byte $66 ; | XX  XX | $FE60
    .byte $FF ; |XXXXXXXX| $FE61
    .byte $FF ; |XXXXXXXX| $FE62
    .byte $66 ; | XX  XX | $FE63
LevelSixteen:
    .byte $E7 ; |XXX  XXX| $FE64
    .byte $A5 ; |X X  X X| $FE65
    .byte $E7 ; |XXX  XXX| $FE66
    .byte $FF ; |XXXXXXXX| $FE67
    .byte $A5 ; |X X  X X| $FE68
    .byte $FF ; |XXXXXXXX| $FE69
    .byte $E7 ; |XXX  XXX| $FE6A
    .byte $A5 ; |X X  X X| $FE6B
    .byte $E7 ; |XXX  XXX| $FE6C
LevelSeventeen:
    .byte $E0 ; |XXX     | $FE6D
    .byte $F0 ; |XXXX    | $FE6E
    .byte $F8 ; |XXXXX   | $FE6F
    .byte $FC ; |XXXXXX  | $FE70
    .byte $7E ; | XXXXXX | $FE71
    .byte $3F ; |  XXXXXX| $FE72
    .byte $1F ; |   XXXXX| $FE73
    .byte $0F ; |    XXXX| $FE74
    .byte $07 ; |     XXX| $FE75
LevelEighteen:
    .byte $7E ; | XXXXXX | $FE76
    .byte $FF ; |XXXXXXXX| $FE77
    .byte $C3 ; |XX    XX| $FE78
    .byte $7E ; | XXXXXX | $FE79
    .byte $7E ; | XXXXXX | $FE7A
    .byte $7E ; | XXXXXX | $FE7B
    .byte $C3 ; |XX    XX| $FE7C
    .byte $FF ; |XXXXXXXX| $FE7D
    .byte $7E ; | XXXXXX | $FE7E
LevelNineteen:
    .byte $E7 ; |XXX  XXX| $FE7F
    .byte $66 ; | XX  XX | $FE80
    .byte $24 ; |  X  X  | $FE81
    .byte $99 ; |X  XX  X| $FE82
    .byte $FF ; |XXXXXXXX| $FE83
    .byte $99 ; |X  XX  X| $FE84
    .byte $24 ; |  X  X  | $FE85
    .byte $66 ; | XX  XX | $FE86
    .byte $E7 ; |XXX  XXX| $FE87
LevelTwenty:
    .byte $C3 ; |XX    XX| $FE88
    .byte $E7 ; |XXX  XXX| $FE89
    .byte $7E ; | XXXXXX | $FE8A
    .byte $3C ; |  XXXX  | $FE8B
    .byte $3C ; |  XXXX  | $FE8C
    .byte $3C ; |  XXXX  | $FE8D
    .byte $7E ; | XXXXXX | $FE8E
    .byte $E7 ; |XXX  XXX| $FE8F
    .byte $C3 ; |XX    XX| $FE90

ChallengeL1:
    .byte $FF ; |XXXXXXXX| $FE91
    .byte $81 ; |X      X| $FE92
    .byte $81 ; |X      X| $FE93
    .byte $FF ; |XXXXXXXX| $FE94
    .byte $00 ; |        | $FE95
    .byte $FF ; |XXXXXXXX| $FE96
    .byte $81 ; |X      X| $FE97
    .byte $81 ; |X      X| $FE98
    .byte $FF ; |XXXXXXXX| $FE99
ChallengeL2:
    .byte $44 ; | X   X  | $FE9A
    .byte $44 ; | X   X  | $FE9B
    .byte $44 ; | X   X  | $FE9C
    .byte $74 ; | XXX X  | $FE9D
    .byte $14 ; |   X X  | $FE9E
    .byte $74 ; | XXX X  | $FE9F
    .byte $44 ; | X   X  | $FEA0
    .byte $44 ; | X   X  | $FEA1
    .byte $7C ; | XXXXX  | $FEA2
ChallengeL3:
    .byte $7E ; | XXXXXX | $FEA3
    .byte $42 ; | X    X | $FEA4
    .byte $42 ; | X    X | $FEA5
    .byte $7E ; | XXXXXX | $FEA6
    .byte $FF ; |XXXXXXXX| $FEA7
    .byte $7E ; | XXXXXX | $FEA8
    .byte $42 ; | X    X | $FEA9
    .byte $42 ; | X    X | $FEAA
    .byte $7E ; | XXXXXX | $FEAB
ChallengeL4:
    .byte $3C ; |  XXXX  | $FEAC
    .byte $24 ; |  X  X  | $FEAD
    .byte $E7 ; |XXX  XXX| $FEAE
    .byte $81 ; |X      X| $FEAF
    .byte $81 ; |X      X| $FEB0
    .byte $81 ; |X      X| $FEB1
    .byte $E7 ; |XXX  XXX| $FEB2
    .byte $24 ; |  X  X  | $FEB3
    .byte $24 ; |  X  X  | $FEB4
ChallengeL5:
    .byte $FB ; |XXXXX XX| $FEB5
    .byte $8A ; |X   X X | $FEB6
    .byte $EB ; |XXX X XX| $FEB7
    .byte $E1 ; |XXX    X| $FEB8
    .byte $81 ; |X      X| $FEB9
    .byte $F1 ; |XXXX   X| $FEBA
    .byte $13 ; |   X  XX| $FEBB
    .byte $F2 ; |XXXX  X | $FEBC
    .byte $FE ; |XXXXXXX | $FEBD
ChallengeL6:
    .byte $EF ; |XXX XXXX| $FEBE
    .byte $AB ; |X X X XX| $FEBF
    .byte $BB ; |X XXX XX| $FEC0
    .byte $83 ; |X     XX| $FEC1
    .byte $E7 ; |XXX  XXX| $FEC2
    .byte $05 ; |     X X| $FEC3
    .byte $7D ; | XXXXX X| $FEC4
    .byte $5D ; | X XXX X| $FEC5
    .byte $77 ; | XXX XXX| $FEC6

;amount of solar cells on the screen (times 2)
LFEC7:
    .byte (32*2)  ; $FEC7   level 1
    .byte (30*2)  ; $FEC8   level 2
    .byte (34*2)  ; $FEC9   level 3
    .byte (30*2)  ; $FECA   level 4
    .byte (34*2)  ; $FECB   level 5
    .byte (42*2)  ; $FECC   level 6
    .byte (32*2)  ; $FECD   level 7
    .byte (36*2)  ; $FECE   level 8
    .byte (32*2)  ; $FECF   level 9
    .byte (34*2)  ; $FED0   level 10
    .byte (40*2)  ; $FED1   level 11
    .byte (48*2)  ; $FED2   level 12
    .byte (36*2)  ; $FED3   level 13
    .byte (44*2)  ; $FED4   level 14
    .byte (48*2)  ; $FED5   level 15
    .byte (52*2)  ; $FED6   level 16
    .byte (42*2)  ; $FED7   level 17
    .byte (54*2)  ; $FED8   level 18
    .byte (40*2)  ; $FED9   level 19
    .byte (44*2)  ; $FEDA   level 20

    .byte (40*2)  ; $FEDB   challenge 1
    .byte (25*2)  ; $FEDC   challenge 2
    .byte (40*2)  ; $FEDD   challenge 3
    .byte (28*2)  ; $FEDE   challenge 4
    .byte (42*2)  ; $FEDF   challenge 5
    .byte (46*2)  ; $FEE0   challenge 6

LFEE1:
    .byte $32 ; |  XX  X | $FEE1
LFEE2:
    .byte $00 ; |        | $FEE2
    .byte $30 ; |  XX    | $FEE3
    .byte $00 ; |        | $FEE4
    .byte $34 ; |  XX X  | $FEE5
    .byte $00 ; |        | $FEE6
    .byte $30 ; |  XX    | $FEE7
    .byte $00 ; |        | $FEE8
    .byte $34 ; |  XX X  | $FEE9
    .byte $00 ; |        | $FEEA
    .byte $84 ; |X    X  | $FEEB
    .byte $00 ; |        | $FEEC
    .byte $28 ; |  X X   | $FEED
    .byte $01 ; |       X| $FEEE
    .byte $44 ; | X   X  | $FEEF
    .byte $01 ; |       X| $FEF0
    .byte $28 ; |  X X   | $FEF1
    .byte $01 ; |       X| $FEF2
    .byte $36 ; |  XX XX | $FEF3
    .byte $01 ; |       X| $FEF4
    .byte $40 ; | X      | $FEF5
    .byte $02 ; |      X | $FEF6
    .byte $88 ; |X   X   | $FEF7
    .byte $02 ; |      X | $FEF8
    .byte $16 ; |   X XX | $FEF9
    .byte $02 ; |      X | $FEFA
    .byte $64 ; | XX  X  | $FEFB
    .byte $02 ; |      X | $FEFC
    .byte $88 ; |X   X   | $FEFD
    .byte $02 ; |      X | $FEFE
    .byte $16 ; |   X XX | $FEFF
    .byte $04 ; |     X  | $FF00
    .byte $36 ; |  XX XX | $FF01
    .byte $03 ; |      XX| $FF02
    .byte $32 ; |  XX  X | $FF03
    .byte $04 ; |     X  | $FF04
    .byte $20 ; |  X     | $FF05
    .byte $03 ; |      XX| $FF06
    .byte $52 ; | X X  X | $FF07
    .byte $03 ; |      XX| $FF08
LFF09:
    .byte $40 ; | X      | $FF09
LFF0A:
    .byte $00 ; |        | $FF0A
    .byte $50 ; | X X    | $FF0B
    .byte $00 ; |        | $FF0C
    .byte $20 ; |  X     | $FF0D
    .byte $01 ; |       X| $FF0E
    .byte $12 ; |   X  X | $FF0F
    .byte $01 ; |       X| $FF10
    .byte $10 ; |   X    | $FF11
    .byte $02 ; |      X | $FF12
    .byte $76 ; | XXX XX | $FF13
    .byte $02 ; |      X | $FF14
LFF15:
    .byte $00 ; |        | $FF15
    .byte $00 ; |        | $FF16
    .byte $00 ; |        | $FF17
    .byte $00 ; |        | $FF18
    .byte $00 ; |        | $FF19
    .byte $05 ; |     X X| $FF1A
    .byte $03 ; |      XX| $FF1B
    .byte $03 ; |      XX| $FF1C
    .byte $00 ; |        | $FF1D
    .byte $05 ; |     X X| $FF1E
    .byte $07 ; |     XXX| $FF1F
    .byte $07 ; |     XXX| $FF20
    .byte $00 ; |        | $FF21
    .byte $05 ; |     X X| $FF22
    .byte $01 ; |       X| $FF23
    .byte $00 ; |        | $FF24
    .byte $00 ; |        | $FF25
    .byte $00 ; |        | $FF26
    .byte $00 ; |        | $FF27
    .byte $00 ; |        | $FF28
    .byte $00 ; |        | $FF29
    .byte $05 ; |     X X| $FF2A
    .byte $01 ; |       X| $FF2B
    .byte $03 ; |      XX| $FF2C
    .byte $00 ; |        | $FF2D
    .byte $07 ; |     XXX| $FF2E
    .byte $07 ; |     XXX| $FF2F
    .byte $07 ; |     XXX| $FF30
    .byte $00 ; |        | $FF31
    .byte $05 ; |     X X| $FF32
    .byte $01 ; |       X| $FF33
    .byte $00 ; |        | $FF34
    .byte $00 ; |        | $FF35
    .byte $00 ; |        | $FF36
    .byte $00 ; |        | $FF37
    .byte $00 ; |        | $FF38
    .byte $00 ; |        | $FF39
    .byte $03 ; |      XX| $FF3A
    .byte $01 ; |       X| $FF3B
    .byte $03 ; |      XX| $FF3C
    .byte $00 ; |        | $FF3D
    .byte $07 ; |     XXX| $FF3E
    .byte $01 ; |       X| $FF3F
    .byte $07 ; |     XXX| $FF40
    .byte $00 ; |        | $FF41
    .byte $05 ; |     X X| $FF42
    .byte $01 ; |       X| $FF43
    .byte $00 ; |        | $FF44
    .byte $00 ; |        | $FF45
    .byte $00 ; |        | $FF46
    .byte $00 ; |        | $FF47
    .byte $00 ; |        | $FF48
    .byte $00 ; |        | $FF49
    .byte $03 ; |      XX| $FF4A
    .byte $03 ; |      XX| $FF4B
    .byte $03 ; |      XX| $FF4C
    .byte $00 ; |        | $FF4D
    .byte $05 ; |     X X| $FF4E
    .byte $01 ; |       X| $FF4F
    .byte $07 ; |     XXX| $FF50
    .byte $00 ; |        | $FF51
    .byte $05 ; |     X X| $FF52
    .byte $01 ; |       X| $FF53

LFF54:
    .byte $00 ; |        | $FF54   audio
LFF55:
    .byte $06 ; |     XX | $FF55
LFF56:
    .byte $61 ; | XX    X| $FF56
LFF57:
    .byte $96 ; |X  X XX | $FF57
    .byte $5F ; | X XXXXX| $FF58
    .byte $06 ; |     XX | $FF59
    .byte $61 ; | XX    X| $FF5A
    .byte $97 ; |X  X XXX| $FF5B
    .byte $5C ; | X XXX  | $FF5C
    .byte $06 ; |     XX | $FF5D
    .byte $61 ; | XX    X| $FF5E
    .byte $98 ; |X  XX   | $FF5F
    .byte $59 ; | X XX  X| $FF60
    .byte $06 ; |     XX | $FF61
    .byte $61 ; | XX    X| $FF62
    .byte $99 ; |X  XX  X| $FF63
    .byte $57 ; | X X XXX| $FF64
    .byte $06 ; |     XX | $FF65
    .byte $61 ; | XX    X| $FF66
    .byte $7E ; | XXXXXX | $FF67
    .byte $AA ; |X X X X | $FF68
    .byte $06 ; |     XX | $FF69
    .byte $61 ; | XX    X| $FF6A
    .byte $7D ; | XXXXX X| $FF6B
    .byte $AB ; |X X X XX| $FF6C
    .byte $06 ; |     XX | $FF6D
    .byte $61 ; | XX    X| $FF6E
    .byte $94 ; |X  X X  | $FF6F
    .byte $7F ; | XXXXXXX| $FF70
    .byte $06 ; |     XX | $FF71
    .byte $61 ; | XX    X| $FF72
    .byte $A4 ; |X X  X  | $FF73
    .byte $6F ; | XX XXXX| $FF74
    .byte $01 ; |       X| $FF75
    .byte $E1 ; |XXX    X| $FF76
    .byte $8D ; |X   XX X| $FF77
    .byte $87 ; |X    XXX| $FF78
    .byte $02 ; |      X | $FF79
    .byte $C1 ; |XX     X| $FF7A
    .byte $8C ; |X   XX  | $FF7B
    .byte $61 ; | XX    X| $FF7C
    .byte $00 ; |        | $FF7D
    .byte $08 ; |    X   | $FF7E
    .byte $04 ; |     X  | $FF7F
    .byte $8C ; |X   XX  | $FF80
    .byte $94 ; |X  X X  | $FF81
    .byte $00 ; |        | $FF82
    .byte $0C ; |    XX  | $FF83
    .byte $28 ; |  X X   | $FF84
    .byte $7C ; | XXXXX  | $FF85
    .byte $C7 ; |XX   XXX| $FF86
    .byte $00 ; |        | $FF87
    .byte $0A ; |    X X | $FF88
    .byte $08 ; |    X   | $FF89
    .byte $8F ; |X   XXXX| $FF8A
    .byte $7F ; | XXXXXXX| $FF8B
    .byte $04 ; |     X  | $FF8C
    .byte $08 ; |    X   | $FF8D
    .byte $7F ; | XXXXXXX| $FF8E
    .byte $7F ; | XXXXXXX| $FF8F
    .byte $04 ; |     X  | $FF90
    .byte $08 ; |    X   | $FF91
    .byte $7F ; | XXXXXXX| $FF92
    .byte $7A ; | XXXX X | $FF93
    .byte $0F ; |    XXXX| $FF94
    .byte $28 ; |  X X   | $FF95
    .byte $7F ; | XXXXXXX| $FF96
    .byte $7F ; | XXXXXXX| $FF97
    .byte $00 ; |        | $FF98
    .byte $06 ; |     XX | $FF99
    .byte $61 ; | XX    X| $FF9A
    .byte $94 ; |X  X X  | $FF9B
    .byte $7F ; | XXXXXXX| $FF9C
    .byte $06 ; |     XX | $FF9D
    .byte $61 ; | XX    X| $FF9E
    .byte $A4 ; |X X  X  | $FF9F
    .byte $6F ; | XX XXXX| $FFA0
    .byte $06 ; |     XX | $FFA1
    .byte $61 ; | XX    X| $FFA2
    .byte $94 ; |X  X X  | $FFA3
    .byte $7F ; | XXXXXXX| $FFA4
    .byte $06 ; |     XX | $FFA5
    .byte $61 ; | XX    X| $FFA6
    .byte $A4 ; |X X  X  | $FFA7
    .byte $6F ; | XX XXXX| $FFA8
    .byte $06 ; |     XX | $FFA9
    .byte $61 ; | XX    X| $FFAA
    .byte $94 ; |X  X X  | $FFAB
    .byte $7F ; | XXXXXXX| $FFAC
    .byte $06 ; |     XX | $FFAD
    .byte $61 ; | XX    X| $FFAE
    .byte $A4 ; |X X  X  | $FFAF
    .byte $6F ; | XX XXXX| $FFB0
    .byte $01 ; |       X| $FFB1
    .byte $E1 ; |XXX    X| $FFB2
    .byte $8D ; |X   XX X| $FFB3
    .byte $87 ; |X    XXX| $FFB4
    .byte $02 ; |      X | $FFB5
    .byte $C1 ; |XX     X| $FFB6
    .byte $8C ; |X   XX  | $FFB7
    .byte $61 ; | XX    X| $FFB8
    .byte $00 ; |        | $FFB9
    .byte $0E ; |    XXX | $FFBA
    .byte $E4 ; |XXX  X  | $FFBB
    .byte $BF ; |X XXXXXX| $FFBC
    .byte $40 ; | X      | $FFBD
    .byte $04 ; |     X  | $FFBE
    .byte $22 ; |  X   X | $FFBF
    .byte $30 ; |  XX    | $FFC0
    .byte $14 ; |   X X  | $FFC1
    .byte $6E ; | XX XXX | $FFC2
    .byte $A4 ; |X X  X  | $FFC3
    .byte $10 ; |   X    | $FFC4
    .byte $71 ; | XXX   X| $FFC5
    .byte $00 ; |        | $FFC6
    .byte $0B ; |    X XX| $FFC7
    .byte $C5 ; |XX   X X| $FFC8
    .byte $91 ; |X  X   X| $FFC9
    .byte $52 ; | X X  X | $FFCA
    .byte $02 ; |      X | $FFCB
    .byte $74 ; | XXX X  | $FFCC
    .byte $E2 ; |XXX   X | $FFCD
    .byte $91 ; |X  X   X| $FFCE
    .byte $8D ; |X   XX X| $FFCF
    .byte $1F ; |   XXXXX| $FFD0
    .byte $60 ; | XX     | $FFD1
    .byte $18 ; |   XX   | $FFD2
    .byte $0D ; |    XX X| $FFD3
    .byte $91 ; |X  X   X| $FFD4
    .byte $A4 ; |X X  X  | $FFD5
    .byte $18 ; |   XX   | $FFD6
    .byte $25 ; |  X  X X| $FFD7
    .byte $8B ; |X   X XX| $FFD8
    .byte $72 ; | XXX  X | $FFD9
    .byte $E1 ; |XXX    X| $FFDA
    .byte $D5 ; |XX X X X| $FFDB
    .byte $8B ; |X   X XX| $FFDC
    .byte $DD ; |XX XXX X| $FFDD
    .byte $52 ; | X X  X | $FFDE
    .byte $20 ; |  X     | $FFDF
    .byte $93 ; |X  X  XX| $FFE0
    .byte $58 ; | X XX   | $FFE1
    .byte $A9 ; |X X X  X| $FFE2
    .byte $44 ; | X   X  | $FFE3
    .byte $2A ; |  X X X | $FFE4
    .byte $25 ; |  X  X X| $FFE5
    .byte $C0 ; |XX      | $FFE6
    .byte $01 ; |       X| $FFE7
    .byte $62 ; | XX   X | $FFE8
    .byte $12 ; |   X  X | $FFE9
    .byte $5D ; | X XXX X| $FFEA
    .byte $F0 ; |XXXX    | $FFEB
    .byte $2A ; |  X X X | $FFEC
    .byte $E7 ; |XXX  XXX| $FFED
    .byte $41 ; | X     X| $FFEE
    .byte $24 ; |  X  X  | $FFEF
    .byte $45 ; | X   X X| $FFF0
    .byte $99 ; |X  XX  X| $FFF1

LFFF2:
    cmp    BANK_0                ; 4   bankswitch, goto LD003
;coming from bank 0
    jmp.ind ($0080)              ; 5

LFFF8:
    .byte $00 ; |        | $FFF8
    .byte $22 ; |  X   X | $FFF9
    .byte $95 ; |X  X X X| $FFFA
    .byte $80 ; |X       | $FFFB

        ORG $2FFC
       RORG $FFFC

    .word START_2nd

    .byte $10 ; |   X    | $FFFE
    .byte $C2 ; |XX    X | $FFFF
