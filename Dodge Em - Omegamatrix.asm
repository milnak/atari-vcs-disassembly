; Disassembly of dod.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfdcdodem.cfg dod.bin
;
; dodem.cfg contents:
;
;      ORG F000
;      CODE F000 FD55
;      GFX FD56 FFFF

      processor 6502

;------------------------------------------
;collisions...
;P=player,M=missile,BL=ball,PF=playfield
;(WRITE ADDR)(READ ADDR)(Bit7)(Bit6)
;$00 VSYNC   CXM0P  $30  M0-P1 M0-P0
;$01 VBLANK  CXM1P  $31  M1-P0 M1-P1
;$02 WSYNC   CXP0FB $32  P0-PF P0-BL
;$03 RSYNC   CXP1FB $33  P1-PF P1-BL
;$04 NUSIZ0  CXM0FB $34  M0-PF M0-BL
;$05 NUSIZ1  CXM1FB $35  M1-PF M1-BL
;$06 COLUP0  CXBLPF $36  BL-PF -----
;$07 COLUP1  CXPPMM $37  P0-P1 M0-M1

;game controllers...
;(WRITE ADDR)(READ ADDR)
;$08 COLUPF  INPT0  $38  PADDLE0
;$09 COLUBK  INPT1  $39  PADDLE1
;$0A CTRLPF  INPT2  $3A  PADDLE2
;$0B REFP0   INPT3  $3B  PADDLE3
;$0C REFP1   INPT4  $3C  TRIGGER0
;$0D PF0     INPT5  $3D  TRIGGER1
;------------------------------------------

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
COLUP0  =  $06
COLUP1  =  $07
COLUBK  =  $09
CTRLPF  =  $0A
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
HMP0    =  $20
HMP1    =  $21
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXP0FB  =  $02    ; read TIA base line = $00
CXPPMM  =  $37
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;==================================================================================================
;              SWITCHES
;==================================================================================================
; only one on at a time!
; 0 = off, 1 = on

NTSC_ORG        = 1
NTSC_ALT        = 0
PAL_ORG         = 0
PAL_ALT         = 0


;-------------------------------

  IF NTSC_ORG || PAL_ORG
ORIGINAL        = 1
ALTERNATE       = 0
  ELSE
ORIGINAL        = 0
ALTERNATE       = 1
  ENDIF

  IF NTSC_ORG || NTSC_ALT
NTSC            = 1
PAL             = 0
  ELSE
NTSC            = 0
PAL             = 1
  ENDIF

;==================================================================================================
;              USER CONSTANTS
;==================================================================================================

  IF NTSC
UNK_01          = $24 ; value is linked to table LFEEE
UNK_02          = $4C
UNK_03          = $12
UNK_04          = $43
UNK_05          = $06
UNK_07          = $20
UNK_08          = $22
TIME_VBLANK     = $28
TIME_OVERSCAN   = $24
BLANK_LINES     = $18
COL_01          = $C8
SUB_VALUE_ONE   = $19
SUB_VALUE_TWO   = $25
  ELSE PAL
UNK_01          = $2A ; value is linked to table LFEEE
UNK_02          = $56
UNK_03          = $14
UNK_04          = $4D
UNK_05          = $07
UNK_07          = $24
UNK_08          = $26
TIME_VBLANK     = $38
TIME_OVERSCAN   = $34
BLANK_LINES     = $1C
COL_01          = $58
SUB_VALUE_ONE   = $1E
SUB_VALUE_TWO   = $2B
  ENDIF


BLACK           = $00
WHITE           = $0E
DARK_GREY       = $02
GREY            = $04
LIGHT_GREY      = $08

  IF NTSC
BLUE            = $7A
BROWN           = $26
GREEN           = $C8
RED             = $44
  ELSE PAL
BLUE            = $B6
BROWN           = $46
GREEN           = $58
RED             = $66
  ENDIF

;==================================================================================================
;              RAM LOCATIONS
;==================================================================================================
    SEG.U   Variables
    ORG     $80

ram_80           ds 1    ; 80
ram_81           ds 1    ; 81
ram_82           ds 1    ; 82
ram_83           ds 1    ; 83
ram_84           ds 1    ; 84
  IF ALTERNATE
oldRamByte    = ram_83
newRamByte       ds 1    ; 85
  ElSE
oldRamByte    = ram_84
newRamByte    = ram_84
  ENDIF
ram_85           ds 1    ; 85
ram_86           ds 1    ; 86
ram_87           ds 1    ; 87
ram_88           ds 1    ; 88
ram_89           ds 1    ; 89
ram_8A           ds 1    ; 8A
ram_8B           ds 1    ; 8B
ram_8C           ds 1    ; 8C
ram_8D           ds 1    ; 8D
ram_8E           ds 1    ; 8E
ram_8F           ds 1    ; 8F
ram_90           ds 1    ; 90
ram_91           ds 1    ; 91
ram_92           ds 1    ; 92
ram_93           ds 1    ; 93
ram_94           ds 1    ; 94
ram_95           ds 1    ; 95
ram_96           ds 1    ; 96
ram_97           ds 1    ; 97
ram_98           ds 1    ; 98
ram_99           ds 1    ; 99
leftCarXpos      ds 1    ; 9A
ram_9B           ds 1    ; 9B
ram_9C           ds 1    ; 9C
ram_9D           ds 1    ; 9D
ram_9E           ds 1    ; 9E
ram_9F           ds 1    ; 9F
ram_A0           ds 1    ; A0
rightCarXpos     ds 1    ; A1
ram_A2           ds 1    ; A2
ram_A3           ds 1    ; A3
ram_A4           ds 1    ; A4
ram_A5           ds 1    ; A5
ram_A6           ds 1    ; A6
ram_A7           ds 1    ; A7
ram_A8           ds 1    ; A8
ram_A9           ds 1    ; A9
ram_AA           ds 1    ; AA
ram_AB           ds 1    ; AB
                 ds 1    ; AC
                 ds 1    ; AD
                 ds 1    ; AE
                 ds 1    ; AF
                 ds 1    ; B0
                 ds 1    ; B1
                 ds 1    ; B2
                 ds 1    ; B3
ram_B4           ds 1    ; B4
ram_B5           ds 1    ; B5
ram_B6           ds 1    ; B6
ram_B7           ds 1    ; B7
ram_B8           ds 1    ; B8
ram_B9           ds 1    ; B9
ram_BA           ds 1    ; BA
ram_BB           ds 1    ; BB
                 ds 1    ; BC
                 ds 1    ; BD
                 ds 1    ; BE
                 ds 1    ; BF
                 ds 1    ; C0
                 ds 1    ; C1

;dot graphics
Dot_Column_A     ds 9    ; C2 - CA
Dot_ColumnsB_C   ds 9    ; CB - D3
Dot_Column_D     ds 9    ; D4 - DC
Dot_Column_E     ds 9    ; DD - E5
Dot_ColumnsF_G   ds 9    ; E6 - EE
Dot_Column_H     ds 9    ; EF - F7

;remaining ram
  IF ORIGINAL
notUsed          ds 8
  ELSE
notUsed          ds 7
  ENDIF


;==================================================================================================
;              MAIN PROGRAM
;==================================================================================================

       SEG  CODE
       ORG $F000

START:
    JMP    LF0CA             ; 3

LF003:
    CLC                      ; 2
    ADC    #$36              ; 2
    PHA                      ; 3
    LSR                      ; 2
    LSR                      ; 2
    LSR                      ; 2
    LSR                      ; 2
    TAY                      ; 2
    PLA                      ; 4
    AND    #$0F              ; 2
    STY    ram_98            ; 3
    CLC                      ; 2
    ADC    ram_98            ; 3
    CMP    #$0F              ; 2
    BCC    LF01B             ; 2³
    SBC    #$0F              ; 2
    INY                      ; 2
LF01B:
    CMP    #8                ; 2
    EOR    #$0F              ; 2
    BCS    LF024             ; 2³
    ADC    #1                ; 2
    DEY                      ; 2
LF024:
    ASL                      ; 2
    ASL                      ; 2
    ASL                      ; 2
    ASL                      ; 2
    STY    WSYNC             ; 3
LF02A:
    DEY                      ; 2
    BPL    LF02A             ; 2³
    STA    RESP0,X           ; 4
    STA    HMP0,X            ; 4
    RTS                      ; 6

LF032:
    LDX    #8                ; 2
.loopDotPattern:
    LDA    GfxDotsOne,X      ; 4
    STA    Dot_Column_A,X    ; 4
    LDA    GfxDotsTwo,X      ; 4
    STA    Dot_ColumnsB_C,X  ; 4
    LDA    GfxDotsThree,X    ; 4
    STA    Dot_Column_D,X    ; 4
    LDA    GfxDotsFour,X     ; 4
    STA    Dot_Column_E,X    ; 4
    LDA    GfxDotsFive,X     ; 4
    STA    Dot_ColumnsF_G,X  ; 4
    LDA    GfxDotsSix,X      ; 4
    STA    Dot_Column_H,X    ; 4
    LDA    #$FF              ; 2
    STA    ram_AB,X          ; 4
    DEX                      ; 2
    BPL    .loopDotPattern ; 2³

    JSR    LF55E             ; 6
    LDA    SWCHB             ; 4
    BPL    LF08D             ; 2³
    LDA    ram_82            ; 3
    AND    #$03              ; 2
    TAX                      ; 2
    LDA    LFEEE,X           ; 4
    STA    ram_9B            ; 3
    CMP    #UNK_01           ; 2
    BEQ    LF074             ; 2³
    JSR    LF505             ; 6
    BNE    LF07C             ; 2³
LF074:
    LDA    #<CarVertGfx      ; 2
    STA    ram_9F            ; 3
    LDA    #>CarVertGfx      ; 2
    STA    ram_A0            ; 3
LF07C:
    LDA    LFEF2,X           ; 4
    STA    leftCarXpos       ; 3
    LDA    LFEF6,X           ; 4
    STA    ram_9C            ; 3
    LDA    LFEFA,X           ; 4
    STA    ram_9D            ; 3
    BPL    LF09F             ; 2³
LF08D:
    LDA    LeftXposStart     ; 4
    STA    leftCarXpos       ; 3
    JSR    LF505             ; 6
    LDA    #$10              ; 2
    STA    ram_9C            ; 3
    LDA    #0                ; 2
    STA    ram_9B            ; 3
    STA    ram_9D            ; 3
LF09F:
    LDA    RightXposStart    ; 4
    STA    rightCarXpos      ; 3
    STA    ram_B4            ; 3
    JSR    LF4FC             ; 6
    BIT    ram_94            ; 3
    BMI    LF0B0             ; 2³
    JSR    LF53A             ; 6
LF0B0:
    LDA    #$40              ; 2
    STA    ram_81            ; 3
    STA    ram_A3            ; 3
    STA    ram_B6            ; 3
;===============================
  IF PAL
    LDA    #$4A              ; 2
  ENDIF
;===============================
    STA    ram_B5            ; 3
    LDA    #$30              ; 2
    ORA    ram_93            ; 3
    STA    ram_93            ; 3
    LDA    ram_95            ; 3
    AND    #$F8              ; 2
    STA    ram_95            ; 3
    JSR    LF50E             ; 6
    RTS                      ; 6

LF0CA:
    SEI                      ; 2
    CLD                      ; 2
    LDX    #$FF              ; 2
    TXS                      ; 2
    INX                      ; 2
    TXA                      ; 2
.loopClear:
    STA    0,X               ; 4
    INX                      ; 2
    BNE    .loopClear        ; 2³

    JSR    LF032             ; 6
    JSR    LFC31             ; 6
    LDA    #$58              ; 2
    STA    ram_95            ; 3
    LDA    #$1E              ; 2
    STA    ram_85            ; 3
LF0E4:
    LDA    #2                ; 2
    STA    VBLANK            ; 3
    STA    VSYNC             ; 3
    STA    WSYNC             ; 3
    BIT    ram_94            ; 3
    BMI    LF0F5             ; 2³
;===============================
  IF PAL
    STA    WSYNC             ; 3   PAL versions use 1 more line of Wsync
  ENDIF
;===============================
    STA    WSYNC             ; 3
    JMP    LF11B             ; 3

LF0F5:
    LDA    SWCHB             ; 4
    LDX    #7                ; 2
    LDY    #7                ; 2
    AND    #$08              ; 2
    BEQ    LF104             ; 2³
    LDX    #$F7              ; 2
    LDY    #3                ; 2
LF104:
    LDA    ram_96            ; 3
    STA    ram_A5            ; 3
    STX    ram_9E            ; 3
    LDX    #3                ; 2
    STA    WSYNC             ; 3
LF10E:
    LDA    ColorTab,Y        ; 4
    EOR    ram_A5            ; 3
    AND    ram_9E            ; 3
    STA    COLUP0,X          ; 4
    DEY                      ; 2
    DEX                      ; 2
    BPL    LF10E             ; 2³

;===============================

  IF ORIGINAL
LF11B:
    STA    WSYNC             ; 3
    STA    WSYNC             ; 3
  ENDIF


  IF NTSC_ALT
    STA    WSYNC             ; 3
    LDA    #BROWN            ; 2
    BIT    ram_97            ; 3
    BPL    .updateColor      ; 2³
    LDA    #GREEN            ; 2
.updateColor:
    STA    COLUP1            ; 3
    LDA    ram_9D            ; 3
    CMP    #2                ; 2
    BNE    .twoLines         ; 2³
    LDA    ram_82            ; 3
    BNE    .twoLines         ; 2³
    JSR    LF4CF             ; 6
    BEQ    .twoLines         ; 2³
LF11B:
    STA    WSYNC             ; 3
.twoLines:
    STA    WSYNC             ; 3
    STA    WSYNC             ; 3   NTSC alternate uses 1 more line then PAL alternate
  ENDIF


  IF PAL_ALT
    STA    WSYNC             ; 3
    LDA    SWCHB             ; 4   load console switches
    AND    #$08              ; 2   is switch set to color or b&w?
    BEQ    .use_B_W_Color    ; 2³  - b&w take branch, else do color
    LDA    #BROWN            ; 2   color for single player (or first of two players)
    BIT    ram_97            ; 3   is the second player playing?
    BPL    .updateColor      ; 2³  - if no, take branch
    LDA    #GREEN            ; 2   - if yes, color is changed for second player
    BNE    .updateColor      ; 3   always branch
.use_B_W_Color
    LDA    #GREY+2           ; 2
    BIT    ram_97            ; 3
    BPL    .updateColor      ; 2³
    LDA    #BLACK            ; 2
.updateColor:
    STA    COLUP1            ; 3
    LDA    ram_9D            ; 3
    CMP    #2                ; 2
    BNE    .oneLine          ; 2³
    LDA    ram_82            ; 3
    BNE    .oneLine          ; 2³
    JSR    LF4CF             ; 6
    BEQ    .oneLine          ; 2³
LF11B:
    STA    WSYNC             ; 3
.oneLine:
    STA    WSYNC             ; 3
  ENDIF

;===============================

    LDA    #0                ; 2
    STA    VSYNC             ; 3
    LDA    #TIME_VBLANK      ; 2
    STA    TIM64T            ; 4
    LDA    #0                ; 2
    STA    AUDV1             ; 3
    LDA    CXP0FB            ; 3
    STA    CTRLPF            ; 3
    LDA    ram_85            ; 3
    AND    #$3F              ; 2
    BEQ    LF139             ; 2³
    JMP    LF20C             ; 3
LF139:
    LDA    SWCHB             ; 4
    ROR                      ; 2
    BCS    LF145             ; 2³
    JSR    LF54F             ; 6
    JMP    LF20C             ; 3
LF145:
    LDA    SWCHB             ; 4
    AND    #$02              ; 2
    BNE    LF183             ; 2³
    JSR    LFC31             ; 6
    JSR    LF032             ; 6
    JSR    LF4ED             ; 6
    BIT    ram_93            ; 3
    BPL    LF161             ; 2³
    BVC    LF165             ; 2³
    LDA    #$3F              ; 2
    AND    ram_93            ; 3
    BPL    LF169             ; 2³
LF161:
    LDA    #$80              ; 2
    BNE    LF167             ; 2³
LF165:
    LDA    #$40              ; 2
LF167:
    ORA    ram_93            ; 3
LF169:
    STA    ram_93            ; 3
    LDX    #$1E              ; 2
    STX    ram_85            ; 3
    LDA    ram_95            ; 3
    AND    #$F8              ; 2
    CMP    #$B8              ; 2
    BNE    LF17B             ; 2³
    LDA    #$58              ; 2
    BNE    LF17E             ; 2³
LF17B:
    CLC                      ; 2
    ADC    #$30              ; 2
LF17E:
    STA    ram_95            ; 3
    JMP    LF20C             ; 3
LF183:
    LDA    ram_93            ; 3
    AND    #$3F              ; 2
    BEQ    LF18C             ; 2³
    JMP    LF20C             ; 3
LF18C:
    LDA    ram_A3            ; 3
    AND    #$0F              ; 2
    BNE    LF20C             ; 2³+1
    LDA    ram_94            ; 3
    AND    #$7F              ; 2
    TAY                      ; 2
    BNE    LF1A0             ; 2³
    LDA    ram_81            ; 3
    ASL                      ; 2
    BNE    LF209             ; 2³+1
    LDY    #$20              ; 2
LF1A0:
    TYA                      ; 2
    AND    #$03              ; 2
    BEQ    LF1B5             ; 2³
    LDX    #1                ; 2
    STX    AUDF0             ; 3
    LDX    #$0A              ; 2
    STX    AUDC0             ; 3
    LDX    #6                ; 2
    STX    AUDV0             ; 3
    LDX    #$0C              ; 2
    BNE    LF1C8             ; 2³
LF1B5:
    LDX    #3                ; 2
    STX    AUDF0             ; 3
    LDX    #0                ; 2
    BIT    ram_97            ; 3
    BPL    LF1C5             ; 2³
    JSR    LFC65             ; 6
    JMP    LF1C8             ; 3
LF1C5:
    JSR    LFCA7             ; 6
LF1C8:
    STX    COLUBK            ; 3
    DEY                      ; 2
    STY    ram_94            ; 3
    BNE    LF20C             ; 2³+1
    BIT    ram_97            ; 3
    BPL    LF1EB             ; 2³   (2³+1 if ntsc alternate)
    LDA    ram_84            ; 3
    AND    #$0F              ; 2
    BNE    LF1E0             ; 2³
    STA    ram_84            ; 3
    JSR    LF4CF             ; 6
;===============================
  IF ORIGINAL
    BEQ    LF20C             ; 2³+1
  ELSE
    JMP    LF201             ; 3
  ENDIF
;===============================
LF1E0:
    DEC    ram_84            ; 5
    LDX    #1                ; 2
    BIT    ram_84            ; 3
    JSR    LF517             ; 6
    BNE    LF201             ; 2³   (2³+1 if original)
LF1EB:
    LDA    ram_83            ; 3
    AND    #$0F              ; 2
    BNE    LF1F8             ; 2³
    STA    ram_83            ; 3
    JSR    LF4CF             ; 6
;===============================
  IF ORIGINAL
    BEQ    LF20C             ; 2³+1
  ELSE
    JMP    LF201             ; 3
  ENDIF
;===============================
LF1F8:
    DEC    ram_83            ; 5
    LDX    #0                ; 2
    BIT    ram_83            ; 3
    JSR    LF517             ; 6
LF201:
    JSR    LF032             ; 6
    JSR    LF4ED             ; 6
    BEQ    LF20C             ; 2³
LF209:
    JSR    LF844             ; 6
LF20C:
    LDX    #0                ; 2
    STX    GRP0              ; 3
    STX    GRP1              ; 3
    LDA    leftCarXpos       ; 3
    JSR    LF003             ; 6
    INX                      ; 2
    LDA    rightCarXpos      ; 3
    JSR    LF003             ; 6
    STA    WSYNC             ; 3
    STA    HMOVE             ; 3
    LDA    #UNK_02           ; 2
    STA    ram_99            ; 3
LF225:
    LDA    INTIM             ; 4
    BNE    LF225             ; 2³
    STA    CXCLR             ; 3
    STA    WSYNC             ; 3
    LDX    #8                ; 2
    STX    ram_A8            ; 3
    LDA    #0                ; 2
    STA    VBLANK            ; 3
    LDX    #UNK_03           ; 2
    LDA    ram_85            ; 3
    AND    #$3F              ; 2
    BEQ    LF289             ; 2³
    LDA    ram_95            ; 3
    LSR                      ; 2
    LSR                      ; 2
    LSR                      ; 2
    TAY                      ; 2
LF244:
    STA    WSYNC             ; 3
    LDA    #0                ; 2
    STA    PF0               ; 3
    STA    PF2               ; 3
    CPX    #6                ; 2
    BPL    LF255             ; 2³
    LDA    NumberGfx,Y       ; 4
    AND    #$F0              ; 2
LF255:
    STA    PF1               ; 3
    PHP                      ; 3
    PLP                      ; 4
    PHP                      ; 3
    PLP                      ; 4
    LDA    #0                ; 2
    STA    PF0               ; 3
    STA    PF1               ; 3
    STA    PF2               ; 3
    STA    WSYNC             ; 3
    LDA    #0                ; 2
    STA    PF0               ; 3
    STA    PF2               ; 3
    CPX    #6                ; 2
    BPL    LF275             ; 2³
    LDA    NumberGfx,Y       ; 4
    AND    #$F0              ; 2
    DEY                      ; 2
LF275:
    STA    PF1               ; 3
    PHP                      ; 3
    PLP                      ; 4
    PHP                      ; 3
    PLP                      ; 4
    LDA    #0                ; 2
    STA    PF0               ; 3
    STA    PF1               ; 3
    STA    PF2               ; 3
    DEX                      ; 2
    BPL    LF244             ; 2³
    JMP    LF35A             ; 3
LF289:
    LDX    #BLANK_LINES      ; 2
LF28B:
    STA    WSYNC             ; 3
    LDA    #0                ; 2
    STA    PF0               ; 3
    STA    PF1               ; 3
    STA    PF2               ; 3
    DEX                      ; 2
    BPL    LF28B             ; 2³
    BIT    ram_97            ; 3
    BPL    LF29E             ; 2³
    BMI    LF301             ; 2³+1
LF29E:
    LDA    ram_97            ; 3
    AND    #$7F              ; 2
    TAX                      ; 2
    LDY    #5                ; 2
LF2A5:
    STA    WSYNC             ; 3
    LDA    #0                ; 2
    STA    PF0               ; 3
    STA    PF1               ; 3
    LDA    NumberGfx,X       ; 4
    AND    #$0F              ; 2
    STA    PF2               ; 3
    LDA    #0                ; 2
    STA    PF0               ; 3
    LDA    (ram_8B),Y        ; 5
    AND    #$F0              ; 2
    STA    ram_86            ; 3
    LDA    (ram_89),Y        ; 5
    AND    #$F0              ; 2
    LSR                      ; 2
    LSR                      ; 2
    LSR                      ; 2
    LSR                      ; 2
    ORA    ram_86            ; 3
    STA    PF1               ; 3
    LDA    (ram_87),Y        ; 5
    AND    #$0F              ; 2
    STA    PF2               ; 3
    STA    WSYNC             ; 3
    LDA    #0                ; 2
    STA    PF0               ; 3
    STA    PF1               ; 3
    LDA    NumberGfx,X       ; 4
    AND    #$0F              ; 2
    STA    PF2               ; 3
    LDA    #0                ; 2
    STA    PF0               ; 3
    LDA    (ram_8B),Y        ; 5
    AND    #$F0              ; 2
    STA    ram_86            ; 3
    LDA    (ram_89),Y        ; 5
    AND    #$F0              ; 2
    LSR                      ; 2
    LSR                      ; 2
    LSR                      ; 2
    LSR                      ; 2
    ORA    ram_86            ; 3
    STA    PF1               ; 3
    LDA    (ram_87),Y        ; 5
    AND    #$0F              ; 2
    STA    PF2               ; 3
    DEX                      ; 2
    DEY                      ; 2
    BPL    LF2A5             ; 2³+1 (2³ if ntsc original)
    BMI    LF35A             ; 2³
LF301:
    LDA    ram_97            ; 3
    AND    #$7F              ; 2
    TAX                      ; 2
    LDY    #5                ; 2
LF308:
    STA    WSYNC             ; 3
    LDA    #0                ; 2
    STA    PF0               ; 3
    STA    PF1               ; 3
    LDA    NumberGfx,X       ; 4
    AND    #$0F              ; 2
    STA    PF2               ; 3
    LDA    (ram_91),Y        ; 5
    AND    #$F0              ; 2
    STA    ram_86            ; 3
    LDA    (ram_8F),Y        ; 5
    AND    #$F0              ; 2
    LSR                      ; 2
    LSR                      ; 2
    LSR                      ; 2
    LSR                      ; 2
    ORA    ram_86            ; 3
    STA    PF1               ; 3
    LDA    (ram_8D),Y        ; 5
    AND    #$0F              ; 2
    STA    PF2               ; 3
    STA    WSYNC             ; 3
    LDA    #0                ; 2
    STA    PF0               ; 3
    STA    PF1               ; 3
    LDA    NumberGfx,X       ; 4
    AND    #$0F              ; 2
    STA    PF2               ; 3
    LDA    (ram_91),Y        ; 5
    AND    #$F0              ; 2
    STA    ram_86            ; 3
    LDA    (ram_8F),Y        ; 5
    AND    #$F0              ; 2
    LSR                      ; 2
    LSR                      ; 2
    LSR                      ; 2
    LSR                      ; 2
    ORA    ram_86            ; 3
    STA    PF1               ; 3
    LDA    (ram_8D),Y        ; 5
    AND    #$0F              ; 2
    STA    PF2               ; 3
    DEX                      ; 2
    DEY                      ; 2
    BPL    LF308             ; 2³
LF35A:
    LDA    #1                ; 2
    STA    CTRLPF            ; 3
    LDA    #UNK_04           ; 2
    STA    ram_80            ; 3
LF362:
    LDX    #UNK_05           ; 2
    STX    ram_A9            ; 3
    LDX    ram_80            ; 3
LF368:
    STA    WSYNC             ; 3
    LDA    LFD56,X           ; 4
    STA    PF0               ; 3
    LDA    LFD9A,X           ; 4
    STA    PF1               ; 3
    LDA    LFDDE,X           ; 4
    STA    PF2               ; 3
    LDA    ram_99            ; 3
    SEC                      ; 2
    SBC    ram_9B            ; 3
    TAY                      ; 2
    AND    #$F8              ; 2
    BNE    LF387             ; 2³
    LDA    (ram_9F),Y        ; 5
    STA    GRP0              ; 3
LF387:
    STA    WSYNC             ; 3
    LDA    ram_99            ; 3
    SEC                      ; 2
    SBC    ram_A2            ; 3
    TAY                      ; 2
    AND    #$F8              ; 2
    BNE    LF397             ; 2³
    LDA    (ram_A6),Y        ; 5
    STA    GRP1              ; 3
LF397:
    DEX                      ; 2
    BMI    LF401             ; 2³+1
    DEC    ram_99            ; 5
    DEC    ram_A9            ; 5
    BPL    LF368             ; 2³
    STX    ram_80            ; 3
    LDA    ram_99            ; 3
    SEC                      ; 2
    SBC    ram_A2            ; 3
    TAY                      ; 2
    AND    #$F8              ; 2
    BEQ    LF3AE             ; 2³
    LDY    #0                ; 2
LF3AE:
    LDX    ram_A8            ; 3
    STA    WSYNC             ; 3
    LDA    Dot_Column_A,X    ; 4
    STA    PF0               ; 3
    LDA    Dot_ColumnsB_C,X  ; 4
    STA    PF1               ; 3
    LDA    Dot_Column_D,X    ; 4
    STA    PF2               ; 3
    LDA    (ram_A6),Y        ; 5
    STA    GRP1              ; 3
    LDA    Dot_Column_E,X    ; 4
    STA    PF0               ; 3
    LDA    Dot_ColumnsF_G,X  ; 4
    STA    PF1               ; 3
    LDA    Dot_Column_H,X    ; 4
    STA    PF2               ; 3
    LDA    ram_99            ; 3
    SEC                      ; 2
    SBC    ram_9B            ; 3
    TAY                      ; 2
    AND    #$F8              ; 2
    BEQ    LF3DA             ; 2³
    LDY    #0                ; 2
LF3DA:
    STA    WSYNC             ; 3
    LDA    Dot_Column_A,X    ; 4
    STA    PF0               ; 3
    LDA    Dot_ColumnsB_C,X  ; 4
    STA    PF1               ; 3
    LDA    Dot_Column_D,X    ; 4
    STA    PF2               ; 3
    LDA    (ram_9F),Y        ; 5
    STA    GRP0              ; 3
    NOP                      ; 2
    LDA    Dot_Column_E,X    ; 4
    STA    PF0               ; 3
    LDA    Dot_ColumnsF_G,X  ; 4
    STA    PF1               ; 3
    LDA    Dot_Column_H,X    ; 4
    STA    PF2               ; 3
    DEX                      ; 2
    STX    ram_A8            ; 3
    DEC    ram_99            ; 5
    JMP    LF362             ; 3

LF401:
;===============================
  IF PAL_ALT
    STA    WSYNC             ; 3
    LDA    #2                ; 2
    STA    VBLANK            ; 3
  ELSE
    LDA    #2                ; 2
    STA    VBLANK            ; 3
    STA    WSYNC             ; 3
  ENDIF
;===============================

    LDA    #TIME_OVERSCAN    ; 2
    STA    TIM64T            ; 4
    JSR    LF55E             ; 6
    LDA    ram_85            ; 3
    AND    #$3F              ; 2
    BEQ    LF41A             ; 2³
    DEC    ram_85            ; 5
    JMP    LF4C7             ; 3

LF41A:
    LDA    ram_93            ; 3
    AND    #$3F              ; 2
    BEQ    LF425             ; 2³
    DEC    ram_93            ; 5
    JMP    LF4BD             ; 3

LF425:
    LDA    ram_95            ; 3
    AND    #$07              ; 2
    TAX                      ; 2
    BNE    LF462             ; 2³
    LDA    ram_A3            ; 3
    AND    #$0F              ; 2
    BNE    LF485             ; 2³
    LDA    CXPPMM            ; 3
    BPL    LF4A3             ; 2³

;===============================
  IF ORIGINAL

    LDY    #$0E              ; 2
    STY    ram_A3            ; 3
    STY    newRamByte        ; 3
    LDY    #8                ; 2
    STY    AUDC0             ; 3
    LDA    #$0E              ; 2
    STA    COLUP1            ; 3
    STA    COLUP0            ; 3
    LDA    #<CarVertGfx      ; 2
  ENDIF

  IF NTSC_ALT

    LDY    #$0E              ; 2
    STY    ram_A3            ; 3
    STY    newRamByte        ; 3
    STY    COLUP1            ; 3
    STY    COLUP0            ; 3
    LDY    #8                ; 2
    STY    AUDC0             ; 3
    LDA    #<CarVertGfx      ; 2
  ENDIF

  IF PAL_ALT

    LDA    #$0E              ; 2
    STA    COLUP1            ; 3
    STA    COLUP0            ; 3
    STA    ram_A3            ; 3
    STA    newRamByte        ; 3
    LDY    #8                ; 2
    STY    AUDC0             ; 3
    LDA    #<CarVertGfx      ; 2
  ENDIF
;===============================

LF448:
    CLC                      ; 2
    ADC    #8                ; 2
    STA    ram_9F            ; 3
    STA    ram_A6            ; 3
    LDA    #0                ; 2
    ADC    #$FE              ; 2
    STA    ram_A0            ; 3
    STA    ram_A7            ; 3
    LDX    #7                ; 2
    TXA                      ; 2
    ORA    ram_95            ; 3
    STA    ram_95            ; 3
    INC    rightCarXpos      ; 5
    DEC    leftCarXpos       ; 5
LF462:
    LDY    newRamByte        ; 3
    CPX    #4                ; 2
    BNE    LF46A             ; 2³
    DEC    newRamByte        ; 5
LF46A:
    BIT    ram_94            ; 3
    BPL    LF470             ; 2³
    LDY    #0                ; 2
LF470:
    STY    AUDV0             ; 3
    TYA                      ; 2
    LSR                      ; 2
    TAY                      ; 2
    LDA    LFEC4,Y           ; 4
    STA    AUDF0             ; 3
    DEC    ram_95            ; 5
    DEX                      ; 2
    BNE    LF4BD             ; 2³
    LDA    ram_9F            ; 3
    CMP    #<CrashFour       ; 2
    BNE    LF448             ; 2³
LF485:
    LDA    #0                ; 2
    STA    AUDV0             ; 3
    DEC    ram_A3            ; 5
    BNE    LF4BD             ; 2³
    JSR    LF4CF             ; 6
;===============================
  IF ALTERNATE
    JSR    LF032             ; 6
    JSR    LF4ED             ; 6
  ENDIF
;===============================
    LDA    SWCHB             ; 4
    ASL                      ; 2
    BMI    LF4A0             ; 2³
    ROL    ram_84            ; 5
    CLC                      ; 2
    ROR    ram_84            ; 5
    ROL    ram_83            ; 5
    CLC                      ; 2
    ROR    ram_83            ; 5
LF4A0:
    JMP    LF4C7             ; 3
LF4A3:
    LDA    ram_81            ; 3
    AND    #$7F              ; 2
    BEQ    LF4BD             ; 2³
    JSR    LF5AA             ; 6
    BIT    ram_97            ; 3
    BPL    LF4B6             ; 2³
    BIT    ram_84            ; 3
    BVC    LF4BD             ; 2³
    BVS    LF4BA             ; 2³
LF4B6:
    BIT    ram_83            ; 3
    BVC    LF4BD             ; 2³
LF4BA:
    JSR    LF58B             ; 6
LF4BD:
    INC    ram_82            ; 5
    BNE    LF4C7             ; 2³
    BIT    ram_94            ; 3
    BPL    LF4C7             ; 2³
    INC    ram_96            ; 5
LF4C7:
    LDX    INTIM             ; 4
    BNE    LF4C7             ; 2³   (2³+1 if pal alternate)
    JMP    LF0E4             ; 3
LF4CF:
    BIT    ram_93            ; 3
    BPL    LF4DF             ; 2³

;===============================
  IF ORIGINAL

    ROL    ram_97            ; 5
    BCS    LF4DC             ; 2³
    SEC                      ; 2
    ROR    ram_97            ; 5
    BNE    LF4E6             ; 2³
LF4DC:
    CLC                      ; 2
    ROR    ram_97            ; 5
LF4DF:
    BIT    ram_94            ; 3
    BMI    LF4E6             ; 2³
    JSR    LFB67             ; 6
LF4E6:
    JSR    LF032             ; 6
    JSR    LF4ED             ; 6
    RTS                      ; 6
  ENDIF



  IF ALTERNATE

    LDA    ram_97            ; 3
    EOR    #$80              ; 2
    STA    ram_97            ; 3
    BMI    LF4E6             ; 2³   (2³+1 if ntsc alternate)
LF4DF:
    BIT    ram_94            ; 3
    BMI    LF4E6             ; 2³
    JSR    LFB67             ; 6
LF4E6:
    RTS                      ; 6
  ENDIF
;===============================

LF4ED:
    LDA    #0                ; 2
    STA    ram_85            ; 3
    STA    HMCLR             ; 3
    STA    ram_A4            ; 3
    STA    ram_B7            ; 3
    STA    ram_B8            ; 3
    STA    ram_A2            ; 3
    RTS                      ; 6

LF4FC:
    LDA    #<CarHorizGfx     ; 2
    STA    ram_B9            ; 3
    LDA    #>CarHorizGfx     ; 2
    STA    ram_BA            ; 3
    RTS                      ; 6

LF505:
    LDA    #<CarHorizGfx     ; 2
    STA    ram_9F            ; 3
    LDA    #>CarHorizGfx     ; 2
    STA    ram_A0            ; 3
    RTS                      ; 6

LF50E:
    LDA    #<CarHorizGfx     ; 2
    STA    ram_A6            ; 3
    LDA    #>CarHorizGfx     ; 2
    STA    ram_A7            ; 3
    RTS                      ; 6

LF517:
    BVS    LF527             ; 2³
    LDA    ram_83,X          ; 4
    AND    #$20              ; 2
    BEQ    LF527             ; 2³
    LDA    ram_83,X          ; 4
    AND    #$0F              ; 2
    ORA    #$40              ; 2
    BNE    LF537             ; 2³
LF527:
    LDA    SWCHB             ; 4
    ASL                      ; 2
    BPL    LF533             ; 2³
    LDA    #$80              ; 2
    ORA    ram_83,X          ; 4
    STA    ram_83,X          ; 4
LF533:
    LDA    ram_83,X          ; 4
    ORA    #$20              ; 2
LF537:
    STA    ram_83,X          ; 4
    RTS                      ; 6

LF53A:
    LDX    #$0E              ; 2
    STX    AUDF0             ; 3
    STX    AUDC0             ; 3
    LDA    #2                ; 2
    STA    AUDV0             ; 3
    LDA    #0                ; 2
    STA    ram_82            ; 3
    STA    ram_94            ; 3
    STA    ram_A5            ; 3
    STA    ram_9E            ; 3
    RTS                      ; 6

LF54F:
    JSR    LFC31             ; 6
    ROL    ram_94            ; 5
    CLC                      ; 2
    ROR    ram_94            ; 5
    JSR    LF032             ; 6
    JSR    LF4ED             ; 6
    RTS                      ; 6

LF55E:
    BIT    ram_94            ; 3
    BMI    LF58A             ; 2³
    LDA    ram_A3            ; 3
    AND    #$0F              ; 2
    BNE    LF58A             ; 2³
    LDX    #3                ; 2
    LDY    #7                ; 2
    LDA    SWCHB             ; 4
    AND    #$08              ; 2
    BEQ    LF575             ; 2³
    LDY    #3                ; 2
LF575:
    LDA    ColorTab,Y        ; 4
    STA    COLUP0,X          ; 4
    DEY                      ; 2
    DEX                      ; 2
    BPL    LF575             ; 2³
;===============================

  IF ORIGINAL
    CPY    #3                ; 2
    BEQ    LF58A             ; 2³
  ENDIF


    BIT    ram_97            ; 3
    BPL    LF58A             ; 2³


  IF PAL_ALT
    LDA    SWCHB             ; 4
    AND    #$08              ; 2
    BNE    LF5B9             ; 2³
    LDA    #0                ; 2
    BEQ    LF5BB             ; 2³
  ENDIF

;==============================
LF5B9:
    LDA    #COL_01           ; 2
LF5BB:
    STA    COLUP1            ; 3
LF58A:
    RTS                      ; 6

LF58B:
    LDX    #6                ; 2
    LDA    ram_82            ; 3   flag
    ROR                      ; 2
    BCC    LF59E             ; 2³
LF592:
    LDA    leftCarXpos,X     ; 4   swapping between player one and two?
    STA    ram_B4,X          ; 4
    LDA    ram_BB,X          ; 4
    STA    leftCarXpos,X     ; 4
    DEX                      ; 2
    BPL    LF592             ; 2³
    RTS                      ; 6

LF59E:
    LDA    leftCarXpos,X     ; 4
    STA    ram_BB,X          ; 4
    LDA    ram_B4,X          ; 4
    STA    leftCarXpos,X     ; 4
    DEX                      ; 2
    BPL    LF59E             ; 2³
    RTS                      ; 6

LF5AA:
    LDA    ram_9C            ; 3
    BMI    LF5BE             ; 2³
    ASL                      ; 2
    BPL    LF5B4             ; 2³
    JMP    LF669             ; 3
LF5B4:
    ASL                      ; 2
    BPL    LF5BA             ; 2³
    JMP    LF701             ; 3
LF5BA:
    ASL                      ; 2
    JMP    LF7AC             ; 3
LF5BE:
    LDX    ram_9D            ; 3
    LDA    ram_9B            ; 3
    SEC                      ; 2
    SBC    LFEDE,X           ; 4
    AND    #$FE              ; 2
    BNE    LF5D4             ; 2³   (2³+1 if pal alternate)
    JSR    LF505             ; 6
    LDA    #$40              ; 2
    STA    ram_9C            ; 3
    JMP    LF669             ; 3
LF5D4:
;===============================
  IF NTSC || PAL_ORG
    LDY    #0                ; 2
    STY    HMP0              ; 3
  ENDIF
;===============================
    BIT    ram_94            ; 3
    BPL    LF5DF             ; 2³
    JMP    LF657             ; 3
LF5DF:
    LDX    ram_9E            ; 3
    BNE    LF641             ; 2³+1 (2³ if pal alternate)
    LDA    ram_9B            ; 3
    CMP    #UNK_07           ; 2
    BNE    LF657             ; 2³+1 (2³ if pal alternate)
    LDX    #8                ; 2
    BIT    ram_93            ; 3
    BVC    LF61C             ; 2³   (2³+1 if original)
    BIT    ram_97            ; 3
    BMI    LF612             ; 2³   (2³+1 if original)
    LDA    SWCHA             ; 4
    LSR                      ; 2
    LSR                      ; 2
    LSR                      ; 2
    BCC    LF609             ; 2³   (2³+1 if original)
    LSR                      ; 2
    BCS    LF657             ; 2³   (2³+1 if ntsc original)
LF5FE:
    LDA    ram_9D            ; 3
    CMP    #3                ; 2
    BEQ    LF657             ; 2³
    JSR    LFB51             ; 6
    BNE    LF63E             ; 2³
LF609:
    LDA    ram_9D            ; 3
    BEQ    LF657             ; 2³
    JSR    LFB57             ; 6
    BNE    LF63E             ; 2³
LF612:
    LDA    SWCHA             ; 4
    BPL    LF5FE             ; 2³   (2³+1 if ntsc original)
    ASL                      ; 2
    BMI    LF657             ; 2³
    BPL    LF609             ; 2³
LF61C:
    LDA    SWCHB             ; 4
    ASL                      ; 2
    BMI    LF634             ; 2³
    BIT    ram_97            ; 3
    BPL    LF62E             ; 2³
    LDA    ram_84            ; 3
    AND    #$F0              ; 2
    BEQ    LF657             ; 2³
    BNE    LF612             ; 2³
LF62E:
    LDA    ram_83            ; 3
    AND    #$F0              ; 2
    BEQ    LF657             ; 2³
LF634:
    SEC                      ; 2
    LDA    ram_A4            ; 3
    SBC    ram_9D            ; 3
    BEQ    LF657             ; 2³
    JSR    LFB5D             ; 6
LF63E:
    JSR    LFC04             ; 6
LF641:
    LDA    ram_81            ; 3
    BPL    LF64E             ; 2³
    JSR    LFBF6             ; 6
    JSR    LFC1C             ; 6
    JMP    LF654             ; 3
LF64E:
    JSR    LFBE4             ; 6
    JSR    LFC2B             ; 6
LF654:
    STX    ram_9E            ; 3
    RTS                      ; 6

LF657:
    INC    ram_9B            ; 5
    BIT    ram_97            ; 3
    BPL    LF662             ; 2³
    LDA    ram_84            ; 3
    BMI    LF666             ; 2³
    RTS                      ; 6

LF662:
    LDA    ram_83            ; 3
    BPL    LF668             ; 2³
LF666:
    INC    ram_9B            ; 5
LF668:
    RTS                      ; 6

LF669:
    LDX    ram_9D            ; 3
    LDA    leftCarXpos       ; 3
    SEC                      ; 2
    SBC    LFEE6,X           ; 4
    AND    #$FE              ; 2
    BNE    LF684             ; 2³
    LDA    #<CarVertGfx      ; 2
    STA    ram_9F            ; 3
    LDA    #>CarVertGfx      ; 2
    STA    ram_A0            ; 3
    LDA    #$20              ; 2
    STA    ram_9C            ; 3
    JMP    LF701             ; 3
LF684:
    BIT    ram_94            ; 3
    BMI    LF6E8             ; 2³   (2³+1 if pal alternate)
    LDX    ram_9E            ; 3
    BNE    LF6D2             ; 2³   (2³+1 if pal alternate)
    LDA    leftCarXpos       ; 3
    CMP    #$50              ; 2
    BNE    LF6E8             ; 2³   (2³+1 if pal alternate)
    LDX    #4                ; 2
    BIT    ram_93            ; 3
    BVC    LF6C5             ; 2³
    BIT    ram_97            ; 3
    BMI    LF6B9             ; 2³
    LDA    SWCHA             ; 4
    LSR                      ; 2
    BCC    LF6B0             ; 2³
    LSR                      ; 2
    BCS    LF6E8             ; 2³   (2³+1 if pal alternate)
LF6A5:
    LDA    ram_9D            ; 3
    CMP    #3                ; 2
    BEQ    LF6E8             ; 2³   (2³+1 if pal alternate)
    JSR    LFB51             ; 6
    BNE    LF6CF             ; 2³
LF6B0:
    LDA    ram_9D            ; 3
    BEQ    LF6E8             ; 2³   (2³+1 if pal alternate)
    JSR    LFB57             ; 6
    BNE    LF6CF             ; 2³
LF6B9:
    LDA    SWCHA             ; 4
    ASL                      ; 2
    ASL                      ; 2
    BPL    LF6A5             ; 2³
    ASL                      ; 2
    BMI    LF6E8             ; 2³   (2³+1 if pal alternate)
    BPL    LF6B0             ; 2³
LF6C5:
    SEC                      ; 2
    LDA    ram_A4            ; 3
    SBC    ram_9D            ; 3
    BEQ    LF6E8             ; 2³   (2³+1 if pal alternate)
    JSR    LFB5D             ; 6
LF6CF:
    JSR    LFBE4             ; 6
LF6D2:
    LDA    ram_81            ; 3
    BPL    LF6DF             ; 2³
    JSR    LFC04             ; 6
    JSR    LFC1C             ; 6
    JMP    LF6E5             ; 3
LF6DF:
    JSR    LFC0E             ; 6
    JSR    LFC2B             ; 6
LF6E5:
    STX    ram_9E            ; 3
    RTS                      ; 6

;===============================
  IF PAL_ALT

LF6E8:
    INC    leftCarXpos       ; 5
    BIT    ram_97            ; 3
    BPL    LF6F6             ; 2³
    LDA    ram_84            ; 3
    BMI    LF6FA             ; 2³
    BPL    LF6FE             ; 2³
LF6F6:
    LDA    ram_83            ; 3
    BPL    LF6FE             ; 2³
LF6FA:
    INC    leftCarXpos       ; 5
LF6FE:
    RTS                      ; 6



  ELSE

LF6E8:
    LDY    #$F0              ; 2
    INC    leftCarXpos       ; 5
    BIT    ram_97            ; 3
    BPL    LF6F6             ; 2³
    LDA    ram_84            ; 3
    BMI    LF6FA             ; 2³
    BPL    LF6FE             ; 2³   (2³+1 if pal original)
LF6F6:
    LDA    ram_83            ; 3
    BPL    LF6FE             ; 2³   (2³+1 if pal original)
LF6FA:
    LDY    #$E0              ; 2
    INC    leftCarXpos       ; 5
LF6FE:
    STY    HMP0              ; 3
    RTS                      ; 6
  ENDIF
;===============================

LF701:
    LDX    ram_9D            ; 3
    LDA    LFEE2,X           ; 4
    SEC                      ; 2
    SBC    ram_9B            ; 3
    AND    #$FE              ; 2
    BNE    LF717             ; 2³
    JSR    LF505             ; 6
    LDA    #$10              ; 2
    STA    ram_9C            ; 3
    JMP    LF7AC             ; 3
LF717:
;===============================
  IF NTSC || PAL_ORG
    LDY    #0                ; 2
    STY    HMP0              ; 3
  ENDIF
;===============================
    BIT    ram_94            ; 3
    BPL    LF722             ; 2³
    JMP    LF79A             ; 3
LF722:
    LDX    ram_9E            ; 3
    BNE    LF784             ; 2³
    LDA    ram_9B            ; 3
    CMP    #UNK_08           ; 2
    BNE    LF79A             ; 2³
    LDX    #8                ; 2
    BIT    ram_93            ; 3
    BVC    LF75F             ; 2³
    BIT    ram_97            ; 3
    BMI    LF755             ; 2³
    LDA    SWCHA             ; 4
    LSR                      ; 2
    LSR                      ; 2
    LSR                      ; 2
    BCC    LF74A             ; 2³
    LSR                      ; 2
    BCS    LF79A             ; 2³
LF741:
    LDA    ram_9D            ; 3
    BEQ    LF79A             ; 2³
    JSR    LFB57             ; 6
    BNE    LF781             ; 2³
LF74A:
    LDA    ram_9D            ; 3
    CMP    #3                ; 2
    BEQ    LF79A             ; 2³
    JSR    LFB51             ; 6
    BNE    LF781             ; 2³
LF755:
    LDA    SWCHA             ; 4
    BPL    LF741             ; 2³
    ASL                      ; 2
    BMI    LF79A             ; 2³
    BPL    LF74A             ; 2³
LF75F:
    LDA    SWCHB             ; 4
    ASL                      ; 2
    BMI    LF777             ; 2³
    BIT    ram_97            ; 3
    BPL    LF771             ; 2³
    LDA    ram_84            ; 3
    AND    #$F0              ; 2
    BEQ    LF79A             ; 2³
    BNE    LF755             ; 2³
LF771:
    LDA    ram_83            ; 3
    AND    #$F0              ; 2
    BEQ    LF79A             ; 2³
LF777:
    SEC                      ; 2
    LDA    ram_A4            ; 3
    SBC    ram_9D            ; 3
    BEQ    LF79A             ; 2³
    JSR    LFB5D             ; 6
LF781:
    JSR    LFC0E             ; 6
LF784:
    LDA    ram_81            ; 3
    BPL    LF791             ; 2³
    JSR    LFBE4             ; 6
    JSR    LFC1C             ; 6
    JMP    LF797             ; 3
LF791:
    JSR    LFBF6             ; 6
    JSR    LFC2B             ; 6
LF797:
    STX    ram_9E            ; 3
    RTS                      ; 6

LF79A:
    DEC    ram_9B            ; 5
    BIT    ram_97            ; 3
    BPL    LF7A5             ; 2³
    LDA    ram_84            ; 3
    BMI    LF7A9             ; 2³
    RTS                      ; 6

LF7A5:
    LDA    ram_83            ; 3
    BPL    LF7AB             ; 2³
LF7A9:
    DEC    ram_9B            ; 5
LF7AB:
    RTS                      ; 6

LF7AC:
    LDX    ram_9D            ; 3
    LDA    LFEEA,X           ; 4
    SEC                      ; 2
    SBC    leftCarXpos       ; 3
    AND    #$FE              ; 2
    BNE    LF7C7             ; 2³
    LDA    #<CarVertGfx      ; 2
    STA    ram_9F            ; 3
    LDA    #>CarVertGfx      ; 2
    STA    ram_A0            ; 3
    LDA    #$80              ; 2
    STA    ram_9C            ; 3
    JMP    LF5BE             ; 3
LF7C7:
    BIT    ram_94            ; 3
    BMI    LF82B             ; 2³+1
    LDX    ram_9E            ; 3
    BNE    LF815             ; 2³+1
    LDA    leftCarXpos       ; 3
    CMP    #$48              ; 2
    BNE    LF82B             ; 2³+1
    LDX    #4                ; 2
    BIT    ram_93            ; 3
    BVC    LF808             ; 2³+1 (2³ if pal alternate)
    BIT    ram_97            ; 3
    BMI    LF7FC             ; 2³   (2³+1 if ntsc alternate or pal original)
    LDA    SWCHA             ; 4
    LSR                      ; 2
    BCC    LF7F1             ; 2³   (2³+1 if ntsc alternate)
    LSR                      ; 2
    BCS    LF82B             ; 2³+1 (2³ if pal alternate)
LF7E8:
    LDA    ram_9D            ; 3
    BEQ    LF82B             ; 2³   (2³+1 if original)
    JSR    LFB57             ; 6
    BNE    LF812             ; 2³   (2³+1 if original)
LF7F1:
    LDA    ram_9D            ; 3
    CMP    #3                ; 2
    BEQ    LF82B             ; 2³   (2³+1 if original)
    JSR    LFB51             ; 6
    BNE    LF812             ; 2³   (2³+1 if ntsc original)
LF7FC:
    LDA    SWCHA             ; 4
    ASL                      ; 2
    ASL                      ; 2
    BPL    LF7E8             ; 2³+1 (2³ if pal alternate)
    ASL                      ; 2
    BMI    LF82B             ; 2³
    BPL    LF7F1             ; 2³   (2³+1 if original)
LF808:
    SEC                      ; 2
    LDA    ram_A4            ; 3
    SBC    ram_9D            ; 3
    BEQ    LF82B             ; 2³
    JSR    LFB5D             ; 6
LF812:
    JSR    LFBF6             ; 6
LF815:
    LDA    ram_81            ; 3
    BPL    LF822             ; 2³
    JSR    LFC0E             ; 6
    JSR    LFC1C             ; 6
    JMP    LF828             ; 3
LF822:
    JSR    LFC04             ; 6
    JSR    LFC2B             ; 6
LF828:
    STX    ram_9E            ; 3
    RTS                      ; 6

LF82B:
;===============================
  IF NTSC || PAL_ORG
    LDY    #$10              ; 2
  ENDIF
;===============================
    DEC    leftCarXpos       ; 5
    BIT    ram_97            ; 3
    BPL    LF839             ; 2³
    LDA    ram_84            ; 3
    BMI    LF83D             ; 2³
    BPL    LF841             ; 2³
LF839:
    LDA    ram_83            ; 3
    BPL    LF841             ; 2³
LF83D:
;===============================
  IF PAL_ALT
    DEC    leftCarXpos       ; 5
LF841:
    RTS                      ; 6

  ELSE

    LDY    #$20              ; 2
    DEC    leftCarXpos       ; 5
LF841:
    STY    HMP0              ; 3
    RTS                      ; 6
  ENDIF
;===============================
LF844:
    LDA    #$80              ; 2
    STA    ram_AA            ; 3
    LDA    ram_A3            ; 3
    BMI    LF859             ; 2³
    ASL                      ; 2
    BPL    LF852             ; 2³
    JMP    LF934             ; 3
LF852:
    ASL                      ; 2
    BMI    LF8A1             ; 2³
    ASL                      ; 2
    JMP    LF8EC             ; 3
LF859:
    BIT    ram_94            ; 3
    BMI    LF861             ; 2³
    LDA    ram_A5            ; 3
    BNE    LF894             ; 2³
LF861:
    LDX    ram_A4            ; 3
    LDA    ram_A2            ; 3
    SEC                      ; 2
    SBC    LFEDE,X           ; 4
    AND    #$FE              ; 2
    BEQ    LF897             ; 2³
    LDY    ram_A4            ; 3
LF86F:
    BEQ    LF876             ; 2³
    LSR    ram_AA            ; 5
    DEY                      ; 2
    BPL    LF86F             ; 2³
LF876:
    LDX    #8                ; 2
LF878:
    LDA    ram_A2            ; 3
    SEC                      ; 2
    SBC    LFF0E,X           ; 4
    AND    #$FE              ; 2
    BNE    LF891             ; 2³
    LDA    ram_AB,X          ; 4
    AND    ram_AA            ; 3
    BEQ    LF891             ; 2³
    EOR    ram_AB,X          ; 4
    STA    ram_AB,X          ; 4
    JSR    LFCE9             ; 6
    BNE    LF894             ; 2³
LF891:
    DEX                      ; 2
    BPL    LF878             ; 2³
LF894:
    JMP    LF976             ; 3
LF897:
    JSR    LF50E             ; 6
    LDA    #$10              ; 2
    STA    ram_A3            ; 3
    JMP    LFAB1             ; 3
LF8A1:
    BIT    ram_94            ; 3
    BMI    LF8A9             ; 2³
    LDA    ram_A5            ; 3
    BNE    LF8DF             ; 2³
LF8A9:
    LDX    ram_A4            ; 3
    LDA    LFEE2,X           ; 4
    SEC                      ; 2
    SBC    ram_A2            ; 3
    AND    #$FE              ; 2
    BEQ    LF8E2             ; 2³   (2³+1 if pal alternate)
    LDA    #1                ; 2
    LDY    ram_A4            ; 3
LF8B9:
    BEQ    LF8BF             ; 2³
    ASL                      ; 2
    DEY                      ; 2
    BPL    LF8B9             ; 2³
LF8BF:
    STA    ram_AA            ; 3
    LDX    #8                ; 2
LF8C3:
    LDA    ram_A2            ; 3
    SEC                      ; 2
    SBC    LFF17,X           ; 4
    AND    #$FE              ; 2
    BNE    LF8DC             ; 2³
    LDA    ram_AB,X          ; 4
    AND    ram_AA            ; 3
    BEQ    LF8DC             ; 2³
    EOR    ram_AB,X          ; 4
    STA    ram_AB,X          ; 4
    JSR    LFCE9             ; 6
    BNE    LF8DF             ; 2³
LF8DC:
    DEX                      ; 2
    BPL    LF8C3             ; 2³
LF8DF:
    JMP    LF9DE             ; 3
LF8E2:
    JSR    LF50E             ; 6
    LDA    #$40              ; 2
    STA    ram_A3            ; 3
    JMP    LFA44             ; 3
LF8EC:
    BIT    ram_94            ; 3
    BMI    LF8F4             ; 2³
    LDA    ram_A5            ; 3
    BNE    LF91F             ; 2³   (2³+1 if original)
LF8F4:
    LDX    ram_A4            ; 3
    LDA    rightCarXpos      ; 3
    SEC                      ; 2
    SBC    LFEEA,X           ; 4
    AND    #$FE              ; 2
    BEQ    LF92A             ; 2³
    LDA    #8                ; 2
    SEC                      ; 2
    SBC    ram_A4            ; 3
    TAX                      ; 2
    LDY    #7                ; 2
LF908:
    LDA    rightCarXpos      ; 3
    SEC                      ; 2
    SBC    LFEFE,Y           ; 4
    AND    #$FE              ; 2
    BNE    LF922             ; 2³
    LDA    ram_AB,X          ; 4
    AND    ram_AA            ; 3
    BEQ    LF922             ; 2³
    EOR    ram_AB,X          ; 4
    STA    ram_AB,X          ; 4
    JSR    LFCE9             ; 6
LF91F:
    JMP    LFAB1             ; 3
LF922:
    LSR    ram_AA            ; 5
    DEY                      ; 2
    BPL    LF908             ; 2³
    JMP    LFAB1             ; 3
LF92A:
    JSR    LFB48             ; 6
    LDA    #$20              ; 2
    STA    ram_A3            ; 3
    JMP    LF9DE             ; 3
LF934:
    BIT    ram_94            ; 3
    BMI    LF93C             ; 2³
    LDA    ram_A5            ; 3
    BNE    LF964             ; 2³
LF93C:
    LDX    ram_A4            ; 3
    LDA    LFEE6,X           ; 4
    CMP    rightCarXpos      ; 3
    BEQ    LF96F             ; 2³
    TAY                      ; 2
    INY                      ; 2
    CPY    rightCarXpos      ; 3
    BEQ    LF96F             ; 2³
    LDY    #7                ; 2
LF94D:
    LDA    rightCarXpos      ; 3
    SEC                      ; 2
    SBC    LFF06,Y           ; 4
    AND    #$FE              ; 2
    BNE    LF967             ; 2³
    LDA    ram_AB,X          ; 4
    AND    ram_AA            ; 3
    BEQ    LF967             ; 2³
    EOR    ram_AB,X          ; 4
    STA    ram_AB,X          ; 4
    JSR    LFCE9             ; 6
LF964:
    JMP    LFA44             ; 3
LF967:
    LSR    ram_AA            ; 5
    DEY                      ; 2
    BPL    LF94D             ; 2³
    JMP    LFA44             ; 3
LF96F:
    JSR    LFB48             ; 6
    LDA    #$80              ; 2
    STA    ram_A3            ; 3
LF976:
;===============================
  IF NTSC || PAL_ORG
    LDY    #0                ; 2
    STY    HMP1              ; 3
  ENDIF
;===============================
    BIT    ram_94            ; 3
    BMI    LF9CD             ; 2³
    LDX    ram_A5            ; 3
    BNE    LF9D0             ; 2³
    BIT    ram_85            ; 3
    BVS    LF995             ; 2³
    JSR    LFB98             ; 6
    SEC                      ; 2
    LDA    ram_A2            ; 3
    SBC    #SUB_VALUE_ONE    ; 2
    AND    #$FC              ; 2
    BNE    LF9C3             ; 2³
    JSR    LFB28             ; 6
LF995:
    LDX    #8                ; 2
LF997:
    BIT    ram_96            ; 3
    BPL    LF9AC             ; 2³
    BVS    LF9C3             ; 2³
    LDA    ram_A4            ; 3
    CMP    #3                ; 2
    BEQ    LF9D7             ; 2³
    JSR    LFBED             ; 6
    JSR    LFC22             ; 6
    JMP    LF9B8             ; 3
LF9AC:
    LDA    ram_A4            ; 3
    AND    #$03              ; 2
    BEQ    LF9D7             ; 2³
    JSR    LFBDB             ; 6
    JSR    LFC13             ; 6
LF9B8:
    JSR    LFBAE             ; 6
    STX    ram_A5            ; 3
    LDA    ram_82            ; 3
    AND    #$03              ; 2
    BNE    LF9CF             ; 2³
LF9C3:
    JSR    LFB1E             ; 6
    BMI    LF9CD             ; 2³
    JSR    LFBA5             ; 6
    INC    ram_A2            ; 5
LF9CD:
    INC    ram_A2            ; 5
LF9CF:
    RTS                      ; 6

LF9D0:
    LDA    ram_82            ; 3
    ROR                      ; 2
    BCC    LF997             ; 2³
    BCS    LF9CF             ; 2³
LF9D7:
    LDX    #0                ; 2
    STX    ram_85            ; 3
    JMP    LF9B8             ; 3
LF9DE:
;===============================
  IF NTSC || PAL_ORG
    LDY    #0                ; 2
    STY    HMP1              ; 3
  ENDIF
;===============================
    BIT    ram_94            ; 3
    BMI    LFA33             ; 2³+1 (2³ if pal alternate)
    LDX    ram_A5            ; 3
    BNE    LFA36             ; 2³+1 (2³ if pal alternate)
    BIT    ram_85            ; 3
    BVS    LF9FD             ; 2³   (2³+1 if pal original)
    JSR    LFB98             ; 6
    SEC                      ; 2
    LDA    ram_A2            ; 3
    SBC    #SUB_VALUE_TWO    ; 2
    AND    #$FC              ; 2
    BNE    LFA29             ; 2³   (2³+1 if original)
    JSR    LFB28             ; 6
LF9FD:
    LDX    #8                ; 2
LF9FF:
    BIT    ram_96            ; 3
    BPL    LFA12             ; 2³
    BVS    LFA29             ; 2³
    LDA    ram_A4            ; 3
    BEQ    LFA3D             ; 2³
    JSR    LFBED             ; 6
    JSR    LFC13             ; 6
    JMP    LFA1E             ; 3
LFA12:
    LDA    ram_A4            ; 3
    CMP    #3                ; 2
    BEQ    LFA3D             ; 2³
    JSR    LFBDB             ; 6
    JSR    LFC22             ; 6
LFA1E:
    JSR    LFBAE             ; 6
    STX    ram_A5            ; 3
    LDA    ram_82            ; 3
    AND    #$03              ; 2
    BNE    LFA35             ; 2³
LFA29:
    JSR    LFB1E             ; 6
    BMI    LFA33             ; 2³
    JSR    LFBA5             ; 6
    DEC    ram_A2            ; 5
LFA33:
    DEC    ram_A2            ; 5
LFA35:
    RTS                      ; 6

LFA36:
    LDA    ram_82            ; 3
    ROR                      ; 2
    BCC    LF9FF             ; 2³   (2³+1 if ntsc original)
    BCS    LFA35             ; 2³
LFA3D:
    LDX    #0                ; 2
    STX    ram_85            ; 3
    JMP    LFA1E             ; 3
LFA44:
    BIT    ram_94            ; 3
    BMI    LFA9D             ; 2³   (2³+1 if pal alternate)
    LDX    ram_A5            ; 3
    BNE    LFAA2             ; 2³
    BIT    ram_85            ; 3
    BVS    LFA63             ; 2³
    JSR    LFB98             ; 6
    SEC                      ; 2
    LDA    rightCarXpos      ; 3
    SBC    #$44              ; 2
    AND    #$FC              ; 2
    BNE    LFA8F             ; 2³
    JSR    LFB28             ; 6
    ASL    ram_96            ; 5
    ASL    ram_96            ; 5
LFA63:
    LDX    #4                ; 2
LFA65:
    BIT    ram_96            ; 3
    BPL    LFA7A             ; 2³
    BVS    LFA8F             ; 2³
    LDA    ram_A4            ; 3
    CMP    #3                ; 2
    BEQ    LFAAA             ; 2³
    JSR    LFBFF             ; 6
    JSR    LFC22             ; 6
    JMP    LFA84             ; 3
LFA7A:
    LDA    ram_A4            ; 3
    BEQ    LFAAA             ; 2³
    JSR    LFC09             ; 6
    JSR    LFC13             ; 6
LFA84:
    JSR    LFBAE             ; 6
    STX    ram_A5            ; 3
    LDA    ram_82            ; 3
    AND    #$03              ; 2
    BNE    LFAA1             ; 2³

;===============================
  IF PAL_ALT

LFA8F:
    JSR    LFB1E             ; 6
    BMI    LFA9D             ; 2³
    JSR    LFBA5             ; 6
    INC    rightCarXpos      ; 5
LFA9D:
    INC    rightCarXpos      ; 5
LFAA1:
    RTS                      ; 6



  ELSE

LFA8F:
    LDX    #$F0              ; 2
    JSR    LFB1E             ; 6
    BMI    LFA9D             ; 2³
    JSR    LFBA5             ; 6
    LDX    #$E0              ; 2
    INC    rightCarXpos      ; 5
LFA9D:
    STX    HMP1              ; 3
    INC    rightCarXpos      ; 5
LFAA1:
    RTS                      ; 6
  ENDIF
;===============================

LFAA2:
    LDA    ram_82            ; 3
    AND    #$03              ; 2
    BEQ    LFA65             ; 2³
    BNE    LFAA1             ; 2³
LFAAA:
    LDX    #0                ; 2
    STX    ram_85            ; 3
    JMP    LFA84             ; 3
LFAB1:
    BIT    ram_94            ; 3
    BMI    LFB0A             ; 2³+1
    LDX    ram_A5            ; 3
    BNE    LFB0F             ; 2³+1
    BIT    ram_85            ; 3
    BVS    LFAD0             ; 2³
    JSR    LFB98             ; 6
    SEC                      ; 2
    LDA    rightCarXpos      ; 3
    SBC    #$53              ; 2
    AND    #$FC              ; 2
    BNE    LFAFC             ; 2³+1 (2³ if ntsc original)
    JSR    LFB28             ; 6
    ASL    ram_96            ; 5
    ASL    ram_96            ; 5
LFAD0:
    LDX    #4                ; 2
LFAD2:
    BIT    ram_96            ; 3
    BPL    LFAE5             ; 2³
    BVS    LFAFC             ; 2³+1 (2³ if ntsc original)
    LDA    ram_A4            ; 3
    BEQ    LFB17             ; 2³+1
    JSR    LFBFF             ; 6
    JSR    LFC13             ; 6
    JMP    LFAF1             ; 3
LFAE5:
    LDA    ram_A4            ; 3
    CMP    #3                ; 2
    BEQ    LFB17             ; 2³+1 (2³ if ntsc alternate)
    JSR    LFC09             ; 6
    JSR    LFC22             ; 6
LFAF1:
    JSR    LFBAE             ; 6
    STX    ram_A5            ; 3
    LDA    ram_82            ; 3
    AND    #$03              ; 2
    BNE    LFB0E             ; 2³   (2³+1 if ntsc original)

;===============================
  IF PAL_ALT

LFAFC:
    JSR    LFB1E             ; 6
    BMI    LFB0A             ; 2³
    JSR    LFBA5             ; 6
    DEC    rightCarXpos      ; 5
LFB0A:
    DEC    rightCarXpos      ; 5
LFB0E:
    RTS                      ; 6



  ELSE

LFAFC:
    LDX    #$10              ; 2
    JSR    LFB1E             ; 6
    BMI    LFB0A             ; 2³
    JSR    LFBA5             ; 6
    LDX    #$20              ; 2
    DEC    rightCarXpos      ; 5
LFB0A:
    STX    HMP1              ; 3
    DEC    rightCarXpos      ; 5
LFB0E:
    RTS                      ; 6
  ENDIF
;===============================

LFB0F:
    LDA    ram_82            ; 3
    AND    #$03              ; 2
    BEQ    LFAD2             ; 2³+1
    BNE    LFB0E             ; 2³
LFB17:
    LDX    #0                ; 2
    STX    ram_85            ; 3
    JMP    LFAF1             ; 3
LFB1E:
    BIT    ram_97            ; 3
    BPL    LFB25             ; 2³
    LDA    INPT5             ; 3
    RTS                      ; 6

LFB25:
    LDA    INPT4             ; 3
    RTS                      ; 6

LFB28:
    BIT    ram_97            ; 3
    BPL    LFB3C             ; 2³
    LDA    SWCHA             ; 4
    ASL                      ; 2
    ASL                      ; 2
    ASL                      ; 2
    ASL                      ; 2
    STA    ram_96            ; 3
    LDA    INPT5             ; 3
    AND    #$80              ; 2
    STA    ram_85            ; 3
    RTS                      ; 6

LFB3C:
    LDA    SWCHA             ; 4
    STA    ram_96            ; 3
    LDA    INPT4             ; 3
    AND    #$80              ; 2
    STA    ram_85            ; 3
    RTS                      ; 6

LFB48:
    LDA    #<CarVertGfx      ; 2
    STA    ram_A6            ; 3
    LDA    #>CarVertGfx      ; 2
    STA    ram_A7            ; 3
    RTS                      ; 6

LFB51:
    ROL    ram_81            ; 5
    CLC                      ; 2
    ROR    ram_81            ; 5
    RTS                      ; 6

LFB57:
    ROL    ram_81            ; 5
    SEC                      ; 2
    ROR    ram_81            ; 5
    RTS                      ; 6

LFB5D:
    BPL    LFB63             ; 2³
    JSR    LFB57             ; 6
    RTS                      ; 6

LFB63:
    JSR    LFB51             ; 6
    RTS                      ; 6

LFB67:
    LDA    ram_97            ; 3
    AND    #$7F              ; 2
    CMP    #$0B              ; 2
    BEQ    LFB8A             ; 2³
    SEC                      ; 2
    SBC    #6                ; 2
    STA    ram_97            ; 3

;===============================
  IF ALTERNATE
    LDA    ram_84            ; 3
    AND    #$F0              ; 2
    ORA    #$04              ; 2
    STA    ram_84            ; 3
  ELSE
    BIT    ram_97            ; 3
    BPL    LFB81             ; 2³
  ENDIF



    LDA    oldRamByte        ; 3
    AND    #$F0              ; 2
    ORA    #$04              ; 2
    STA    oldRamByte        ; 3
    RTS                      ; 6



  IF ORIGINAL
LFB81:
    LDA    ram_83            ; 3
    AND    #$F0              ; 2
    ORA    #$04              ; 2
    STA    ram_83            ; 3
    RTS                      ; 6
  ENDIF
;===============================

LFB8A:
    LDA    #5                ; 2
    STA    ram_97            ; 3
    LDA    #0                ; 2
    STA    AUDV0             ; 3
    ROL    ram_94            ; 5
    SEC                      ; 2
    ROR    ram_94            ; 5
    RTS                      ; 6

LFB98:
    BIT    ram_94            ; 3
    BMI    LFBA4             ; 2³
    LDX    CXP0FB            ; 3
    STX    AUDC0             ; 3
    STX    AUDV0             ; 3
    STX    AUDF0             ; 3
LFBA4:
    RTS                      ; 6

LFBA5:
    LDA    #0                ; 2
    STA    AUDF0             ; 3
    LDA    #3                ; 2
    STA    AUDV0             ; 3
    RTS                      ; 6

LFBAE:
    LDA    LFECC,X           ; 4
    STA    AUDF0             ; 3
    LDA    #3                ; 2
    STA    AUDC1             ; 3
    LDA    LFED4,X           ; 4
    STA    AUDC0             ; 3
    LDA    #1                ; 2
    STA    AUDF1             ; 3
    LDA    #6                ; 2
    STA    AUDV0             ; 3
    STA    AUDV1             ; 3
    RTS                      ; 6

LFBC7:
    LDA    ram_85            ; 3
    BPL    LFBD7             ; 2³
    LDA    SWCHA             ; 4
    CMP    #$FF              ; 2
    BEQ    LFBD7             ; 2³
    LDA    #$40              ; 2
LFBD4:
    STA    ram_85            ; 3
    RTS                      ; 6

LFBD7:
    LDA    #0                ; 2
    BEQ    LFBD4             ; 2³
LFBDB:
    LDA    #$E0              ; 2
    STA    HMP1              ; 3
    INC    rightCarXpos      ; 5
    INC    rightCarXpos      ; 5
    RTS                      ; 6

LFBE4:
    LDA    #$E0              ; 2
    STA    HMP0              ; 3
    INC    leftCarXpos       ; 5
    INC    leftCarXpos       ; 5
    RTS                      ; 6

LFBED:
    LDA    #$20              ; 2
    STA    HMP1              ; 3
    DEC    rightCarXpos      ; 5
    DEC    rightCarXpos      ; 5
    RTS                      ; 6

LFBF6:
    LDA    #$20              ; 2
    STA    HMP0              ; 3
    DEC    leftCarXpos       ; 5
    DEC    leftCarXpos       ; 5
    RTS                      ; 6

LFBFF:
    INC    ram_A2            ; 5
    INC    ram_A2            ; 5
    RTS                      ; 6

LFC04:
    INC    ram_9B            ; 5
    INC    ram_9B            ; 5
    RTS                      ; 6

LFC09:
    DEC    ram_A2            ; 5
    DEC    ram_A2            ; 5
    RTS                      ; 6

LFC0E:
    DEC    ram_9B            ; 5
    DEC    ram_9B            ; 5
    RTS                      ; 6

LFC13:
    DEX                      ; 2
    BNE    LFC1B             ; 2³
    DEC    ram_A4            ; 5
    JSR    LFBC7             ; 6
LFC1B:
    RTS                      ; 6

LFC1C:
    DEX                      ; 2
    BNE    LFC21             ; 2³
    DEC    ram_9D            ; 5
LFC21:
    RTS                      ; 6

LFC22:
    DEX                      ; 2
    BNE    LFC2A             ; 2³
    INC    ram_A4            ; 5
    JSR    LFBC7             ; 6
LFC2A:
    RTS                      ; 6

LFC2B:
    DEX                      ; 2
    BNE    LFC30             ; 2³
    INC    ram_9D            ; 5
LFC30:
    RTS                      ; 6

LFC31:
    LDA    #<Zero            ; 2
    STA    ram_89            ; 3
    STA    ram_87            ; 3
    STA    ram_8B            ; 3
    STA    ram_8F            ; 3
    STA    ram_8D            ; 3
    STA    ram_91            ; 3
    LDA    #>Zero            ; 2
    STA    ram_8A            ; 3
    STA    ram_88            ; 3
    STA    ram_8C            ; 3
    STA    ram_90            ; 3
    STA    ram_8E            ; 3
    STA    ram_92            ; 3
    ROL    ram_94            ; 5
    SEC                      ; 2
    ROR    ram_94            ; 5
    LDA    #0                ; 2
    STA    AUDV0             ; 3
;===============================
  IF ORIGINAL
    STA    ram_83            ; 3
    STA    ram_84            ; 3
  ENDIF
;===============================
    LDA    #$17              ; 2
    STA    ram_97            ; 3
    LDA    #4                ; 2
    STA    ram_84            ; 3
    STA    ram_83            ; 3
    RTS                      ; 6

LFC65:
    LDA    ram_8D            ; 3
    CMP    #<Nine            ; 2
    BNE    LFC9B             ; 2³
    LDA    #>Zero            ; 2
    STA    ram_8E            ; 3
    LDA    #<Zero            ; 2
    STA    ram_8D            ; 3
    LDA    ram_8F            ; 3
    CMP    #<Nine            ; 2
    BNE    LFC8F             ; 2³
    LDA    #<Zero            ; 2
    STA    ram_8F            ; 3
    LDA    #>Zero            ; 2
    STA    ram_90            ; 3
    LDA    ram_91            ; 3
    CLC                      ; 2
    ADC    #6                ; 2
    STA    ram_91            ; 3
    LDA    #0                ; 2
    ADC    ram_92            ; 3
    STA    ram_92            ; 3
    RTS                      ; 6

LFC8F:
    CLC                      ; 2
    ADC    #6                ; 2
    STA    ram_8F            ; 3
    LDA    #0                ; 2
    ADC    ram_90            ; 3
    STA    ram_90            ; 3
    RTS                      ; 6

LFC9B:
    CLC                      ; 2
    ADC    #6                ; 2
    STA    ram_8D            ; 3
    LDA    #0                ; 2
    ADC    ram_8E            ; 3
    STA    ram_8E            ; 3
    RTS                      ; 6

LFCA7:
    LDA    ram_87            ; 3
    CMP    #<Nine            ; 2
    BNE    LFCDD             ; 2³
    LDA    #>Zero            ; 2
    STA    ram_88            ; 3
    LDA    #<Zero            ; 2
    STA    ram_87            ; 3
    LDA    ram_89            ; 3
    CMP    #<Nine            ; 2
    BNE    LFCD1             ; 2³
    LDA    #<Zero            ; 2
    STA    ram_89            ; 3
    LDA    #>Zero            ; 2
    STA    ram_8A            ; 3
    LDA    ram_8B            ; 3
    CLC                      ; 2
    ADC    #6                ; 2
    STA    ram_8B            ; 3
    LDA    #0                ; 2
    ADC    ram_8C            ; 3
    STA    ram_8C            ; 3
    RTS                      ; 6

LFCD1:
    CLC                      ; 2
    ADC    #6                ; 2
    STA    ram_89            ; 3
    LDA    #0                ; 2
    ADC    ram_8A            ; 3
    STA    ram_8A            ; 3
    RTS                      ; 6

LFCDD:
    CLC                      ; 2
    ADC    #6                ; 2
    STA    ram_87            ; 3
    LDA    #0                ; 2
    ADC    ram_88            ; 3
    STA    ram_88            ; 3
    RTS                      ; 6

LFCE9:
    BIT    ram_94            ; 3
    BMI    LFD08             ; 2³+1
    DEC    ram_81            ; 5
    BIT    ram_97            ; 3
    BPL    LFCF9             ; 2³   (2³+1 if ntsc alternate)
    JSR    LFC65             ; 6
    JMP    LFCFC             ; 3
LFCF9:
    JSR    LFCA7             ; 6
LFCFC:
    LDA    #6                ; 2
    STA    AUDV1             ; 3
    LDA    #1                ; 2
    STA    AUDC1             ; 3
    LDA    #4                ; 2
    STA    AUDF1             ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; 8 dots by 8 dots = 64 dots to be collected on screen
; each row is 8 dots across, each column 8 dots deep
; row = left to right
; column = top to bottom (columns marked as A,B,C, etc..)
;
;
;                A     B     C     D             H     G     F     E
; left side     ---   ---   ---   ---           ---   ---   ---   ---      right side
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD08:
    LDA    ram_AA            ; 3   copy ram_AA into accumulator
    BPL    .check_F          ; 2³  is bit 7 of ram_AA zero? yes, take branch; no, update column "E"
    LDA    Dot_Column_E,X    ; 4   0101 0000  bit 6 = dot, bit 4 = wall
    AND    #$BF              ; 2   1011 1111  clear dot in column "E", X register determines for which row
    STA    Dot_Column_E,X    ; 4   save new dot pattern in ram
    RTS                      ; 6   and return

.check_F:
    ASL                      ; 2   shift to test bit 6 now
    BPL    .check_G          ; 2³
    LDA    Dot_ColumnsF_G,X  ; 4   x010 x010  bit 5 & 1 = dots, bit 7 & 3 = walls
    AND    #$DF              ; 2   1101 1111  clear dot "F"
    STA    Dot_ColumnsF_G,X  ; 4
    RTS                      ; 6

.check_G:
    ASL                      ; 2   shift to test bit 5...
    BPL    .check_H          ; 2³
    LDA    Dot_ColumnsF_G,X  ; 4   x010 x010  bit 5 & 1 = dots, bit 7 & 3 = walls
    AND    #$FD              ; 2   1111 1101  clear dot "G"
    STA    Dot_ColumnsF_G,X  ; 4
    RTS                      ; 6

.check_H:
    ASL                      ; 2
    BPL    .check_D          ; 2³
    LDA    Dot_Column_H,X    ; 4   0000 010x  bit 2 = dot, bit 0 = wall
    AND    #$FB              ; 2   1111 1011  clear dot "H"
    STA    Dot_Column_H,X    ; 4
    RTS                      ; 6

.check_D:
    ASL                      ; 2
    BPL    .check_C          ; 2³
    LDA    Dot_Column_D,X    ; 4   0000 010x  bit 2 = dot, bit 0 = wall
    AND    #$FB              ; 2   1111 1011  clear dot "D"
    STA    Dot_Column_D,X    ; 4
    RTS                      ; 6

.check_C:
    ASL                      ; 2
    BPL    .check_B          ; 2³
    LDA    Dot_ColumnsB_C,X  ; 4   x010 x010  bit 5 & 1 = dots, bit 7 & 3 = walls
    AND    #$FD              ; 2   1111 1101  clear dot "C"
    STA    Dot_ColumnsB_C,X  ; 4
    RTS                      ; 6

.check_B:
    ASL                      ; 2
    BPL    .check_A          ; 2³
    LDA    Dot_ColumnsB_C,X  ; 4   x010 x010  bit 5 & 1 = dots, bit 7 & 3 = walls
    AND    #$DF              ; 2   1101 1111  clear dot "B"
    STA    Dot_ColumnsB_C,X  ; 4
    RTS                      ; 6

.check_A:
    LDA    Dot_Column_A,X    ; 4   0101 0000  bit 6 = dot, bit 4 = wall
    AND    #$BF              ; 2   1011 1111  clear dot "A"
    STA    Dot_Column_A,X    ; 4
    RTS                      ; 6

LFD56:
;===============================
  IF NTSC

    .byte $00 ; |        | $FD56  NTSC
    .byte $F0 ; |XXXX    | $FD57  NTSC
    .byte $10 ; |   X    | $FD58  NTSC
    .byte $10 ; |   X    | $FD59  NTSC
    .byte $10 ; |   X    | $FD5A  NTSC
    .byte $10 ; |   X    | $FD5B  NTSC
    .byte $10 ; |   X    | $FD5C  NTSC
    .byte $10 ; |   X    | $FD5D  NTSC
    .byte $10 ; |   X    | $FD5E  NTSC
    .byte $10 ; |   X    | $FD5F  NTSC
    .byte $10 ; |   X    | $FD60  NTSC
    .byte $10 ; |   X    | $FD61  NTSC
    .byte $10 ; |   X    | $FD62  NTSC
    .byte $10 ; |   X    | $FD63  NTSC
    .byte $10 ; |   X    | $FD64  NTSC
    .byte $10 ; |   X    | $FD65  NTSC
    .byte $10 ; |   X    | $FD66  NTSC
    .byte $10 ; |   X    | $FD67  NTSC
    .byte $10 ; |   X    | $FD68  NTSC
    .byte $10 ; |   X    | $FD69  NTSC
    .byte $10 ; |   X    | $FD6A  NTSC
    .byte $10 ; |   X    | $FD6B  NTSC
    .byte $10 ; |   X    | $FD6C  NTSC
    .byte $10 ; |   X    | $FD6D  NTSC
    .byte $10 ; |   X    | $FD6E  NTSC
    .byte $10 ; |   X    | $FD6F  NTSC
    .byte $00 ; |        | $FD70  NTSC
    .byte $00 ; |        | $FD71  NTSC
    .byte $00 ; |        | $FD72  NTSC
    .byte $00 ; |        | $FD73  NTSC
    .byte $00 ; |        | $FD74  NTSC
    .byte $00 ; |        | $FD75  NTSC
    .byte $00 ; |        | $FD76  NTSC
    .byte $00 ; |        | $FD77  NTSC
    .byte $00 ; |        | $FD78  NTSC
    .byte $00 ; |        | $FD79  NTSC
    .byte $00 ; |        | $FD7A  NTSC
    .byte $00 ; |        | $FD7B  NTSC
    .byte $00 ; |        | $FD7C  NTSC
    .byte $00 ; |        | $FD7D  NTSC
    .byte $10 ; |   X    | $FD7E  NTSC
    .byte $10 ; |   X    | $FD7F  NTSC
    .byte $10 ; |   X    | $FD80  NTSC
    .byte $10 ; |   X    | $FD81  NTSC
    .byte $10 ; |   X    | $FD82  NTSC
    .byte $10 ; |   X    | $FD83  NTSC
    .byte $10 ; |   X    | $FD84  NTSC
    .byte $10 ; |   X    | $FD85  NTSC
    .byte $10 ; |   X    | $FD86  NTSC
    .byte $10 ; |   X    | $FD87  NTSC
    .byte $10 ; |   X    | $FD88  NTSC
    .byte $10 ; |   X    | $FD89  NTSC
    .byte $10 ; |   X    | $FD8A  NTSC
    .byte $10 ; |   X    | $FD8B  NTSC
    .byte $10 ; |   X    | $FD8C  NTSC
    .byte $10 ; |   X    | $FD8D  NTSC
    .byte $10 ; |   X    | $FD8E  NTSC
    .byte $10 ; |   X    | $FD8F  NTSC
    .byte $10 ; |   X    | $FD90  NTSC
    .byte $10 ; |   X    | $FD91  NTSC
    .byte $10 ; |   X    | $FD92  NTSC
    .byte $10 ; |   X    | $FD93  NTSC
    .byte $10 ; |   X    | $FD94  NTSC
    .byte $10 ; |   X    | $FD95  NTSC
    .byte $F0 ; |XXXX    | $FD96  NTSC
    .byte $00 ; |        | $FD97  NTSC
    .byte $00 ; |        | $FD98  NTSC
    .byte $00 ; |        | $FD99  NTSC
LFD9A:
    .byte $00 ; |        | $FD9A  NTSC
    .byte $FF ; |XXXXXXXX| $FD9B  NTSC
    .byte $00 ; |        | $FD9C  NTSC
    .byte $00 ; |        | $FD9D  NTSC
    .byte $00 ; |        | $FD9E  NTSC
    .byte $00 ; |        | $FD9F  NTSC
    .byte $00 ; |        | $FDA0  NTSC
    .byte $00 ; |        | $FDA1  NTSC
    .byte $FF ; |XXXXXXXX| $FDA2  NTSC
    .byte $80 ; |X       | $FDA3  NTSC
    .byte $80 ; |X       | $FDA4  NTSC
    .byte $80 ; |X       | $FDA5  NTSC
    .byte $80 ; |X       | $FDA6  NTSC
    .byte $80 ; |X       | $FDA7  NTSC
    .byte $80 ; |X       | $FDA8  NTSC
    .byte $8F ; |X   XXXX| $FDA9  NTSC
    .byte $88 ; |X   X   | $FDAA  NTSC
    .byte $88 ; |X   X   | $FDAB  NTSC
    .byte $88 ; |X   X   | $FDAC  NTSC
    .byte $88 ; |X   X   | $FDAD  NTSC
    .byte $88 ; |X   X   | $FDAE  NTSC
    .byte $88 ; |X   X   | $FDAF  NTSC
    .byte $88 ; |X   X   | $FDB0  NTSC
    .byte $88 ; |X   X   | $FDB1  NTSC
    .byte $88 ; |X   X   | $FDB2  NTSC
    .byte $88 ; |X   X   | $FDB3  NTSC
    .byte $00 ; |        | $FDB4  NTSC
    .byte $00 ; |        | $FDB5  NTSC
    .byte $00 ; |        | $FDB6  NTSC
    .byte $00 ; |        | $FDB7  NTSC
    .byte $00 ; |        | $FDB8  NTSC
    .byte $00 ; |        | $FDB9  NTSC
    .byte $00 ; |        | $FDBA  NTSC
    .byte $00 ; |        | $FDBB  NTSC
    .byte $00 ; |        | $FDBC  NTSC
    .byte $00 ; |        | $FDBD  NTSC
    .byte $00 ; |        | $FDBE  NTSC
    .byte $00 ; |        | $FDBF  NTSC
    .byte $00 ; |        | $FDC0  NTSC
    .byte $00 ; |        | $FDC1  NTSC
    .byte $88 ; |X   X   | $FDC2  NTSC
    .byte $88 ; |X   X   | $FDC3  NTSC
    .byte $88 ; |X   X   | $FDC4  NTSC
    .byte $88 ; |X   X   | $FDC5  NTSC
    .byte $88 ; |X   X   | $FDC6  NTSC
    .byte $88 ; |X   X   | $FDC7  NTSC
    .byte $88 ; |X   X   | $FDC8  NTSC
    .byte $88 ; |X   X   | $FDC9  NTSC
    .byte $88 ; |X   X   | $FDCA  NTSC
    .byte $88 ; |X   X   | $FDCB  NTSC
    .byte $8F ; |X   XXXX| $FDCC  NTSC
    .byte $80 ; |X       | $FDCD  NTSC
    .byte $80 ; |X       | $FDCE  NTSC
    .byte $80 ; |X       | $FDCF  NTSC
    .byte $80 ; |X       | $FDD0  NTSC
    .byte $80 ; |X       | $FDD1  NTSC
    .byte $80 ; |X       | $FDD2  NTSC
    .byte $FF ; |XXXXXXXX| $FDD3  NTSC
    .byte $00 ; |        | $FDD4  NTSC
    .byte $00 ; |        | $FDD5  NTSC
    .byte $00 ; |        | $FDD6  NTSC
    .byte $00 ; |        | $FDD7  NTSC
    .byte $00 ; |        | $FDD8  NTSC
    .byte $00 ; |        | $FDD9  NTSC
    .byte $FF ; |XXXXXXXX| $FDDA  NTSC
    .byte $00 ; |        | $FDDB  NTSC
    .byte $00 ; |        | $FDDC  NTSC
    .byte $00 ; |        | $FDDD  NTSC
LFDDE:
    .byte $00 ; |        | $FDDE  NTSC
    .byte $1F ; |   XXXXX| $FDDF  NTSC
    .byte $00 ; |        | $FDE0  NTSC
    .byte $00 ; |        | $FDE1  NTSC
    .byte $00 ; |        | $FDE2  NTSC
    .byte $00 ; |        | $FDE3  NTSC
    .byte $00 ; |        | $FDE4  NTSC
    .byte $00 ; |        | $FDE5  NTSC
    .byte $1F ; |   XXXXX| $FDE6  NTSC
    .byte $00 ; |        | $FDE7  NTSC
    .byte $00 ; |        | $FDE8  NTSC
    .byte $00 ; |        | $FDE9  NTSC
    .byte $00 ; |        | $FDEA  NTSC
    .byte $00 ; |        | $FDEB  NTSC
    .byte $00 ; |        | $FDEC  NTSC
    .byte $1F ; |   XXXXX| $FDED  NTSC
    .byte $00 ; |        | $FDEE  NTSC
    .byte $00 ; |        | $FDEF  NTSC
    .byte $00 ; |        | $FDF0  NTSC
    .byte $00 ; |        | $FDF1  NTSC
    .byte $00 ; |        | $FDF2  NTSC
    .byte $00 ; |        | $FDF3  NTSC
    .byte $1F ; |   XXXXX| $FDF4  NTSC
    .byte $01 ; |       X| $FDF5  NTSC
    .byte $01 ; |       X| $FDF6  NTSC
    .byte $01 ; |       X| $FDF7  NTSC
    .byte $00 ; |        | $FDF8  NTSC
    .byte $00 ; |        | $FDF9  NTSC
    .byte $00 ; |        | $FDFA  NTSC
    .byte $F0 ; |XXXX    | $FDFB  NTSC
    .byte $10 ; |   X    | $FDFC  NTSC
    .byte $10 ; |   X    | $FDFD  NTSC
    .byte $10 ; |   X    | $FDFE  NTSC
    .byte $10 ; |   X    | $FDFF  NTSC
    .byte $10 ; |   X    | $FE00  NTSC
    .byte $10 ; |   X    | $FE01  NTSC
    .byte $F0 ; |XXXX    | $FE02  NTSC
    .byte $00 ; |        | $FE03  NTSC
    .byte $00 ; |        | $FE04  NTSC
    .byte $00 ; |        | $FE05  NTSC
    .byte $01 ; |       X| $FE06  NTSC
    .byte $01 ; |       X| $FE07  NTSC
    .byte $01 ; |       X| $FE08  NTSC
    .byte $1F ; |   XXXXX| $FE09  NTSC
    .byte $00 ; |        | $FE0A  NTSC
    .byte $00 ; |        | $FE0B  NTSC
    .byte $00 ; |        | $FE0C  NTSC
    .byte $00 ; |        | $FE0D  NTSC
    .byte $00 ; |        | $FE0E  NTSC
    .byte $00 ; |        | $FE0F  NTSC
    .byte $1F ; |   XXXXX| $FE10  NTSC
    .byte $00 ; |        | $FE11  NTSC
    .byte $00 ; |        | $FE12  NTSC
    .byte $00 ; |        | $FE13  NTSC
    .byte $00 ; |        | $FE14  NTSC
    .byte $00 ; |        | $FE15  NTSC
    .byte $00 ; |        | $FE16  NTSC
    .byte $1F ; |   XXXXX| $FE17  NTSC
    .byte $00 ; |        | $FE18  NTSC
    .byte $00 ; |        | $FE19  NTSC
    .byte $00 ; |        | $FE1A  NTSC
    .byte $00 ; |        | $FE1B  NTSC
    .byte $00 ; |        | $FE1C  NTSC
    .byte $00 ; |        | $FE1D  NTSC
    .byte $1F ; |   XXXXX| $FE1E  NTSC
    .byte $00 ; |        | $FE1F  NTSC
    .byte $00 ; |        | $FE20  NTSC
    .byte $00 ; |        | $FE21  NTSC

  ELSE

    .byte $00 ; |        | $FD5A  PAL
    .byte $F0 ; |XXXX    | $FD5B  PAL
    .byte $10 ; |   X    | $FD5C  PAL
    .byte $10 ; |   X    | $FD5D  PAL
    .byte $10 ; |   X    | $FD5E  PAL
    .byte $10 ; |   X    | $FD5F  PAL
    .byte $10 ; |   X    | $FD60  PAL
    .byte $10 ; |   X    | $FD61  PAL
    .byte $10 ; |   X    | $FD62  PAL
    .byte $10 ; |   X    | $FD63  PAL
    .byte $10 ; |   X    | $FD64  PAL
    .byte $10 ; |   X    | $FD65  PAL
    .byte $10 ; |   X    | $FD66  PAL
    .byte $10 ; |   X    | $FD67  PAL
    .byte $10 ; |   X    | $FD68  PAL
    .byte $10 ; |   X    | $FD69  PAL
    .byte $10 ; |   X    | $FD6A  PAL
    .byte $10 ; |   X    | $FD6B  PAL
    .byte $10 ; |   X    | $FD6C  PAL
    .byte $10 ; |   X    | $FD6D  PAL
    .byte $10 ; |   X    | $FD6E  PAL
    .byte $10 ; |   X    | $FD6F  PAL
    .byte $10 ; |   X    | $FD70  PAL
    .byte $10 ; |   X    | $FD71  PAL
    .byte $10 ; |   X    | $FD72  PAL
    .byte $10 ; |   X    | $FD73  PAL
    .byte $10 ; |   X    | $FD74  PAL
    .byte $10 ; |   X    | $FD75  PAL
    .byte $10 ; |   X    | $FD76  PAL
    .byte $10 ; |   X    | $FD77  PAL
    .byte $00 ; |        | $FD78  PAL
    .byte $00 ; |        | $FD79  PAL
    .byte $00 ; |        | $FD7A  PAL
    .byte $00 ; |        | $FD7B  PAL
    .byte $00 ; |        | $FD7C  PAL
    .byte $00 ; |        | $FD7D  PAL
    .byte $00 ; |        | $FD7E  PAL
    .byte $00 ; |        | $FD7F  PAL
    .byte $00 ; |        | $FD80  PAL
    .byte $00 ; |        | $FD81  PAL
    .byte $00 ; |        | $FD82  PAL
    .byte $00 ; |        | $FD83  PAL
    .byte $00 ; |        | $FD84  PAL
    .byte $00 ; |        | $FD85  PAL
    .byte $00 ; |        | $FD86  PAL
    .byte $00 ; |        | $FD87  PAL
    .byte $10 ; |   X    | $FD88  PAL
    .byte $10 ; |   X    | $FD89  PAL
    .byte $10 ; |   X    | $FD8A  PAL
    .byte $10 ; |   X    | $FD8B  PAL
    .byte $10 ; |   X    | $FD8C  PAL
    .byte $10 ; |   X    | $FD8D  PAL
    .byte $10 ; |   X    | $FD8E  PAL
    .byte $10 ; |   X    | $FD8F  PAL
    .byte $10 ; |   X    | $FD90  PAL
    .byte $10 ; |   X    | $FD91  PAL
    .byte $10 ; |   X    | $FD92  PAL
    .byte $10 ; |   X    | $FD93  PAL
    .byte $10 ; |   X    | $FD94  PAL
    .byte $10 ; |   X    | $FD95  PAL
    .byte $10 ; |   X    | $FD96  PAL
    .byte $10 ; |   X    | $FD97  PAL
    .byte $10 ; |   X    | $FD98  PAL
    .byte $10 ; |   X    | $FD99  PAL
    .byte $10 ; |   X    | $FD9A  PAL
    .byte $10 ; |   X    | $FD9B  PAL
    .byte $10 ; |   X    | $FD9C  PAL
    .byte $10 ; |   X    | $FD9D  PAL
    .byte $10 ; |   X    | $FD9E  PAL
    .byte $10 ; |   X    | $FD9F  PAL
    .byte $10 ; |   X    | $FDA0  PAL
    .byte $10 ; |   X    | $FDA1  PAL
    .byte $10 ; |   X    | $FDA2  PAL
    .byte $F0 ; |XXXX    | $FDA3  PAL
    .byte $00 ; |        | $FDA4  PAL
    .byte $00 ; |        | $FDA5  PAL
    .byte $00 ; |        | $FDA6  PAL
    .byte $00 ; |        | $FDA7  PAL
LFD9A:
    .byte $00 ; |        | $FDA8  PAL
    .byte $FF ; |XXXXXXXX| $FDA9  PAL
    .byte $00 ; |        | $FDAA  PAL
    .byte $00 ; |        | $FDAB  PAL
    .byte $00 ; |        | $FDAC  PAL
    .byte $00 ; |        | $FDAD  PAL
    .byte $00 ; |        | $FDAE  PAL
    .byte $00 ; |        | $FDAF  PAL
    .byte $00 ; |        | $FDB0  PAL
    .byte $FF ; |XXXXXXXX| $FDB1  PAL
    .byte $80 ; |X       | $FDB2  PAL
    .byte $80 ; |X       | $FDB3  PAL
    .byte $80 ; |X       | $FDB4  PAL
    .byte $80 ; |X       | $FDB5  PAL
    .byte $80 ; |X       | $FDB6  PAL
    .byte $80 ; |X       | $FDB7  PAL
    .byte $80 ; |X       | $FDB8  PAL
    .byte $8F ; |X   XXXX| $FDB9  PAL
    .byte $88 ; |X   X   | $FDBA  PAL
    .byte $88 ; |X   X   | $FDBB  PAL
    .byte $88 ; |X   X   | $FDBC  PAL
    .byte $88 ; |X   X   | $FDBD  PAL
    .byte $88 ; |X   X   | $FDBE  PAL
    .byte $88 ; |X   X   | $FDBF  PAL
    .byte $88 ; |X   X   | $FDC0  PAL
    .byte $88 ; |X   X   | $FDC1  PAL
    .byte $88 ; |X   X   | $FDC2  PAL
    .byte $88 ; |X   X   | $FDC3  PAL
    .byte $88 ; |X   X   | $FDC4  PAL
    .byte $88 ; |X   X   | $FDC5  PAL
    .byte $00 ; |        | $FDC6  PAL
    .byte $00 ; |        | $FDC7  PAL
    .byte $00 ; |        | $FDC8  PAL
    .byte $00 ; |        | $FDC9  PAL
    .byte $00 ; |        | $FDCA  PAL
    .byte $00 ; |        | $FDCB  PAL
    .byte $00 ; |        | $FDCC  PAL
    .byte $00 ; |        | $FDCD  PAL
    .byte $00 ; |        | $FDCE  PAL
    .byte $00 ; |        | $FDCF  PAL
    .byte $00 ; |        | $FDD0  PAL
    .byte $00 ; |        | $FDD1  PAL
    .byte $00 ; |        | $FDD2  PAL
    .byte $00 ; |        | $FDD3  PAL
    .byte $00 ; |        | $FDD4  PAL
    .byte $00 ; |        | $FDD5  PAL
    .byte $88 ; |X   X   | $FDD6  PAL
    .byte $88 ; |X   X   | $FDD7  PAL
    .byte $88 ; |X   X   | $FDD8  PAL
    .byte $88 ; |X   X   | $FDD9  PAL
    .byte $88 ; |X   X   | $FDDA  PAL
    .byte $88 ; |X   X   | $FDDB  PAL
    .byte $88 ; |X   X   | $FDDC  PAL
    .byte $88 ; |X   X   | $FDDD  PAL
    .byte $88 ; |X   X   | $FDDE  PAL
    .byte $88 ; |X   X   | $FDDF  PAL
    .byte $88 ; |X   X   | $FDE0  PAL
    .byte $8F ; |X   XXXX| $FDE1  PAL
    .byte $80 ; |X       | $FDE2  PAL
    .byte $80 ; |X       | $FDE3  PAL
    .byte $80 ; |X       | $FDE4  PAL
    .byte $80 ; |X       | $FDE5  PAL
    .byte $80 ; |X       | $FDE6  PAL
    .byte $80 ; |X       | $FDE7  PAL
    .byte $80 ; |X       | $FDE8  PAL
    .byte $FF ; |XXXXXXXX| $FDE9  PAL
    .byte $00 ; |        | $FDEA  PAL
    .byte $00 ; |        | $FDEB  PAL
    .byte $00 ; |        | $FDEC  PAL
    .byte $00 ; |        | $FDED  PAL
    .byte $00 ; |        | $FDEE  PAL
    .byte $00 ; |        | $FDEF  PAL
    .byte $00 ; |        | $FDF0  PAL
    .byte $FF ; |XXXXXXXX| $FDF1  PAL
    .byte $00 ; |        | $FDF2  PAL
    .byte $00 ; |        | $FDF3  PAL
    .byte $00 ; |        | $FDF4  PAL
    .byte $00 ; |        | $FDF5  PAL
LFDDE:
    .byte $00 ; |        | $FDF6  PAL
    .byte $1F ; |   XXXXX| $FDF7  PAL
    .byte $00 ; |        | $FDF8  PAL
    .byte $00 ; |        | $FDF9  PAL
    .byte $00 ; |        | $FDFA  PAL
    .byte $00 ; |        | $FDFB  PAL
    .byte $00 ; |        | $FDFC  PAL
    .byte $00 ; |        | $FDFD  PAL
    .byte $00 ; |        | $FDFE  PAL
    .byte $1F ; |   XXXXX| $FDFF  PAL
    .byte $00 ; |        | $FE00  PAL
    .byte $00 ; |        | $FE01  PAL
    .byte $00 ; |        | $FE02  PAL
    .byte $00 ; |        | $FE03  PAL
    .byte $00 ; |        | $FE04  PAL
    .byte $00 ; |        | $FE05  PAL
    .byte $00 ; |        | $FE06  PAL
    .byte $1F ; |   XXXXX| $FE07  PAL
    .byte $00 ; |        | $FE08  PAL
    .byte $00 ; |        | $FE09  PAL
    .byte $00 ; |        | $FE0A  PAL
    .byte $00 ; |        | $FE0B  PAL
    .byte $00 ; |        | $FE0C  PAL
    .byte $00 ; |        | $FE0D  PAL
    .byte $00 ; |        | $FE0E  PAL
    .byte $1F ; |   XXXXX| $FE0F  PAL
    .byte $01 ; |       X| $FE10  PAL
    .byte $01 ; |       X| $FE11  PAL
    .byte $01 ; |       X| $FE12  PAL
    .byte $01 ; |       X| $FE13  PAL
    .byte $00 ; |        | $FE14  PAL
    .byte $00 ; |        | $FE15  PAL
    .byte $00 ; |        | $FE16  PAL
    .byte $F0 ; |XXXX    | $FE17  PAL
    .byte $10 ; |   X    | $FE18  PAL
    .byte $10 ; |   X    | $FE19  PAL
    .byte $10 ; |   X    | $FE1A  PAL
    .byte $10 ; |   X    | $FE1B  PAL
    .byte $10 ; |   X    | $FE1C  PAL
    .byte $10 ; |   X    | $FE1D  PAL
    .byte $10 ; |   X    | $FE1E  PAL
    .byte $F0 ; |XXXX    | $FE1F  PAL
    .byte $00 ; |        | $FE20  PAL
    .byte $00 ; |        | $FE21  PAL
    .byte $00 ; |        | $FE22  PAL
    .byte $00 ; |        | $FE23  PAL
    .byte $01 ; |       X| $FE24  PAL
    .byte $01 ; |       X| $FE25  PAL
    .byte $01 ; |       X| $FE26  PAL
    .byte $1F ; |   XXXXX| $FE27  PAL
    .byte $00 ; |        | $FE28  PAL
    .byte $00 ; |        | $FE29  PAL
    .byte $00 ; |        | $FE2A  PAL
    .byte $00 ; |        | $FE2B  PAL
    .byte $00 ; |        | $FE2C  PAL
    .byte $00 ; |        | $FE2D  PAL
    .byte $00 ; |        | $FE2E  PAL
    .byte $1F ; |   XXXXX| $FE2F  PAL
    .byte $00 ; |        | $FE30  PAL
    .byte $00 ; |        | $FE31  PAL
    .byte $00 ; |        | $FE32  PAL
    .byte $00 ; |        | $FE33  PAL
    .byte $00 ; |        | $FE34  PAL
    .byte $00 ; |        | $FE35  PAL
    .byte $00 ; |        | $FE36  PAL
    .byte $1F ; |   XXXXX| $FE37  PAL
    .byte $00 ; |        | $FE38  PAL
    .byte $00 ; |        | $FE39  PAL
    .byte $00 ; |        | $FE3A  PAL
    .byte $00 ; |        | $FE3B  PAL
    .byte $00 ; |        | $FE3C  PAL
    .byte $00 ; |        | $FE3D  PAL
    .byte $00 ; |        | $FE3E  PAL
    .byte $1F ; |   XXXXX| $FE3F  PAL
    .byte $00 ; |        | $FE40  PAL
    .byte $00 ; |        | $FE41  PAL
    .byte $00 ; |        | $FE42  PAL
    .byte $00 ; |        | $FE43  PAL
  ENDIF

;===============================
;               DOTS
;===============================

GfxDotsOne:
    .byte $50 ; | X X    | $FE22  bottom
    .byte $50 ; | X X    | $FE23
    .byte $50 ; | X X    | $FE24
    .byte $50 ; | X X    | $FE25
    .byte $00 ; |        | $FE26       column A
    .byte $50 ; | X X    | $FE27
    .byte $50 ; | X X    | $FE28
    .byte $50 ; | X X    | $FE29
    .byte $50 ; | X X    | $FE2A  top
GfxDotsTwo:
    .byte $22 ; |  X   X | $FE2B
    .byte $A2 ; |X X   X | $FE2C
    .byte $AA ; |X X X X | $FE2D
    .byte $AA ; |X X X X | $FE2E
    .byte $00 ; |        | $FE2F       column B, column C
    .byte $AA ; |X X X X | $FE30
    .byte $AA ; |X X X X | $FE31
    .byte $A2 ; |X X   X | $FE32
    .byte $22 ; |  X   X | $FE33
GfxDotsThree:
    .byte $04 ; |     X  | $FE34
    .byte $04 ; |     X  | $FE35
    .byte $04 ; |     X  | $FE36
    .byte $05 ; |     X X| $FE37
    .byte $00 ; |        | $FE38       column D
    .byte $05 ; |     X X| $FE39
    .byte $04 ; |     X  | $FE3A
    .byte $04 ; |     X  | $FE3B
    .byte $04 ; |     X  | $FE3C
GfxDotsFour:
    .byte $50 ; | X X    | $FE3D
    .byte $50 ; | X X    | $FE3E
    .byte $50 ; | X X    | $FE3F
    .byte $50 ; | X X    | $FE40
    .byte $00 ; |        | $FE41       column E
    .byte $50 ; | X X    | $FE42
    .byte $50 ; | X X    | $FE43
    .byte $50 ; | X X    | $FE44
    .byte $50 ; | X X    | $FE45
GfxDotsFive:
    .byte $22 ; |  X   X | $FE46
    .byte $A2 ; |X X   X | $FE47
    .byte $AA ; |X X X X | $FE48
    .byte $AA ; |X X X X | $FE49
    .byte $00 ; |        | $FE4A       column F, column G
    .byte $AA ; |X X X X | $FE4B
    .byte $AA ; |X X X X | $FE4C
    .byte $A2 ; |X X   X | $FE4D
    .byte $22 ; |  X   X | $FE4E
GfxDotsSix:
    .byte $04 ; |     X  | $FE4F
    .byte $04 ; |     X  | $FE50
    .byte $04 ; |     X  | $FE51
    .byte $05 ; |     X X| $FE52
    .byte $00 ; |        | $FE53       column H
    .byte $05 ; |     X X| $FE54
    .byte $04 ; |     X  | $FE55
    .byte $04 ; |     X  | $FE56
    .byte $04 ; |     X  | $FE57



CarHorizGfx:
    .byte $00 ; |        | $FE58
    .byte $00 ; |        | $FE59
    .byte $00 ; |        | $FE5A
    .byte $C3 ; |XX    XX| $FE5B
    .byte $3C ; |  XXXX  | $FE5C
    .byte $FF ; |XXXXXXXX| $FE5D
    .byte $3C ; |  XXXX  | $FE5E
    .byte $C3 ; |XX    XX| $FE5F
CarVertGfx:
    .byte $00 ; |        | $FE60
    .byte $5A ; | X XX X | $FE61
    .byte $5A ; | X XX X | $FE62
    .byte $3C ; |  XXXX  | $FE63
    .byte $3C ; |  XXXX  | $FE64
    .byte $3C ; |  XXXX  | $FE65
    .byte $5A ; | X XX X | $FE66
    .byte $5A ; | X XX X | $FE67
CrashOne:
    .byte $00 ; |        | $FE68
    .byte $00 ; |        | $FE69
    .byte $10 ; |   X    | $FE6A
    .byte $1A ; |   XX X | $FE6B
    .byte $1F ; |   XXXXX| $FE6C
    .byte $1B ; |   XX XX| $FE6D
    .byte $17 ; |   X XXX| $FE6E
    .byte $03 ; |      XX| $FE6F
CrashTwo:
    .byte $00 ; |        | $FE70
    .byte $00 ; |        | $FE71
    .byte $0A ; |    X X | $FE72
    .byte $0D ; |    XX X| $FE73
    .byte $1F ; |   XXXXX| $FE74
    .byte $1D ; |   XXX X| $FE75
    .byte $1A ; |   XX X | $FE76
    .byte $0C ; |    XX  | $FE77
CrashThree:
    .byte $00 ; |        | $FE78
    .byte $00 ; |        | $FE79
    .byte $34 ; |  XX X  | $FE7A
    .byte $16 ; |   X XX | $FE7B
    .byte $7F ; | XXXXXXX| $FE7C
    .byte $7E ; | XXXXXX | $FE7D
    .byte $79 ; | XXXX  X| $FE7E
    .byte $20 ; |  X     | $FE7F
CrashFour:
    .byte $00 ; |        | $FE80
    .byte $00 ; |        | $FE81
    .byte $00 ; |        | $FE82
    .byte $20 ; |  X     | $FE83
    .byte $F8 ; |XXXXX   | $FE84
    .byte $F3 ; |XXXX  XX| $FE85
    .byte $72 ; | XXX  X | $FE86
    .byte $40 ; | X      | $FE87

;===============================

NumberGfx:

Zero:
    .byte $00 ; |        | $FE88
    .byte $E7 ; |XXX  XXX| $FE89
    .byte $A5 ; |X X  X X| $FE8A
    .byte $A5 ; |X X  X X| $FE8B
    .byte $A5 ; |X X  X X| $FE8C
    .byte $E7 ; |XXX  XXX| $FE8D
One:
    .byte $00 ; |        | $FE8E
    .byte $E7 ; |XXX  XXX| $FE8F
    .byte $42 ; | X    X | $FE90
    .byte $42 ; | X    X | $FE91
    .byte $C3 ; |XX    XX| $FE92
    .byte $42 ; | X    X | $FE93
Two:
    .byte $00 ; |        | $FE94
    .byte $E7 ; |XXX  XXX| $FE95
    .byte $81 ; |X      X| $FE96
    .byte $E7 ; |XXX  XXX| $FE97
    .byte $24 ; |  X  X  | $FE98
    .byte $E7 ; |XXX  XXX| $FE99
Three:
    .byte $00 ; |        | $FE9A
    .byte $E7 ; |XXX  XXX| $FE9B
    .byte $24 ; |  X  X  | $FE9C
    .byte $66 ; | XX  XX | $FE9D
    .byte $24 ; |  X  X  | $FE9E
    .byte $E7 ; |XXX  XXX| $FE9F
Four:
    .byte $00 ; |        | $FEA0
    .byte $24 ; |  X  X  | $FEA1
    .byte $24 ; |  X  X  | $FEA2
    .byte $E7 ; |XXX  XXX| $FEA3
    .byte $A5 ; |X X  X X| $FEA4
    .byte $A5 ; |X X  X X| $FEA5
Five:
    .byte $00 ; |        | $FEA6
    .byte $E7 ; |XXX  XXX| $FEA7
    .byte $24 ; |  X  X  | $FEA8
    .byte $E7 ; |XXX  XXX| $FEA9
    .byte $81 ; |X      X| $FEAA
    .byte $E7 ; |XXX  XXX| $FEAB
Six:
    .byte $00 ; |        | $FEAC
    .byte $E7 ; |XXX  XXX| $FEAD
    .byte $A5 ; |X X  X X| $FEAE
    .byte $E7 ; |XXX  XXX| $FEAF
    .byte $81 ; |X      X| $FEB0
    .byte $E7 ; |XXX  XXX| $FEB1
Seven:
    .byte $00 ; |        | $FEB2
    .byte $81 ; |X      X| $FEB3
    .byte $81 ; |X      X| $FEB4
    .byte $42 ; | X    X | $FEB5
    .byte $24 ; |  X  X  | $FEB6
    .byte $E7 ; |XXX  XXX| $FEB7
Eight:
    .byte $00 ; |        | $FEB8
    .byte $E7 ; |XXX  XXX| $FEB9
    .byte $A5 ; |X X  X X| $FEBA
    .byte $E7 ; |XXX  XXX| $FEBB
    .byte $A5 ; |X X  X X| $FEBC
    .byte $E7 ; |XXX  XXX| $FEBD
Nine:
    .byte $00 ; |        | $FEBE
    .byte $E7 ; |XXX  XXX| $FEBF
    .byte $24 ; |  X  X  | $FEC0
    .byte $E7 ; |XXX  XXX| $FEC1
    .byte $A5 ; |X X  X X| $FEC2
    .byte $E7 ; |XXX  XXX| $FEC3

LFEC4:
    .byte $0F ; |    XXXX| $FEC4
    .byte $0A ; |    X X | $FEC5
    .byte $0A ; |    X X | $FEC6
    .byte $08 ; |    X   | $FEC7
    .byte $08 ; |    X   | $FEC8
    .byte $06 ; |     XX | $FEC9
    .byte $04 ; |     X  | $FECA
    .byte $01 ; |       X| $FECB
LFECC:
    .byte $01 ; |       X| $FECC
    .byte $01 ; |       X| $FECD
    .byte $00 ; |        | $FECE
    .byte $00 ; |        | $FECF
    .byte $00 ; |        | $FED0
    .byte $02 ; |      X | $FED1
    .byte $02 ; |      X | $FED2
    .byte $08 ; |    X   | $FED3
LFED4:
    .byte $08 ; |    X   | $FED4
    .byte $08 ; |    X   | $FED5
    .byte $05 ; |     X X| $FED6
    .byte $05 ; |     X X| $FED7
    .byte $05 ; |     X X| $FED8
    .byte $03 ; |      XX| $FED9
    .byte $08 ; |    X   | $FEDA
    .byte $08 ; |    X   | $FEDB

LeftXposStart:
    .byte $40 ; $FEDC
RightXposStart:
    .byte $5A ; $FEDD
;===============================
  IF NTSC

LFEDE:
    .byte $40 ; | X      | $FEDE  NTSC
    .byte $38 ; |  XXX   | $FEDF  NTSC
    .byte $30 ; |  XX    | $FEE0  NTSC
    .byte $28 ; |  X X   | $FEE1  NTSC
LFEE2:
    .byte $00 ; |        | $FEE2  NTSC
    .byte $08 ; |    X   | $FEE3  NTSC
    .byte $10 ; |   X    | $FEE4  NTSC
    .byte $18 ; |   XX   | $FEE5  NTSC

  ELSE PAL

LFEDE:
    .byte $4A ; | X  X X | $FF00  PAL
    .byte $40 ; | X      | $FF01  PAL
    .byte $37 ; |  XX XXX| $FF02  PAL
    .byte $2E ; |  X XXX | $FF03  PAL
LFEE2:
    .byte $01 ; |       X| $FF04  PAL
    .byte $0A ; |    X X | $FF05  PAL
    .byte $13 ; |   X  XX| $FF06  PAL
    .byte $1C ; |   XXX  | $FF07  PAL

  ENDIF
;===============================
LFEE6:
    .byte $92 ; |X  X  X | $FEE6
    .byte $82 ; |X     X | $FEE7
    .byte $72 ; | XXX  X | $FEE8
    .byte $62 ; | XX   X | $FEE9
LFEEA:
    .byte $04 ; |     X  | $FEEA
    .byte $14 ; |   X X  | $FEEB
    .byte $24 ; |  X  X  | $FEEC
    .byte $34 ; |  XX X  | $FEED
;===============================
  IF NTSC
LFEEE:
    .byte $00 ; |        | $FEEE  NTSC
    .byte $10 ; |   X    | $FEEF  NTSC
    .byte $24 ; |  X  X  | $FEF0  NTSC
    .byte $24 ; |  X  X  | $FEF1  NTSC

  ELSE PAL

LFEEE:
    .byte $00 ; |        | $FF10  PAL
    .byte $12 ; |   X  X | $FF11  PAL
    .byte $2A ; |  X X X | $FF12  PAL
    .byte $2A ; |  X X X | $FF13  PAL
  ENDIF
;===============================
LFEF2:
    .byte $40 ; | X      | $FEF2
    .byte $40 ; | X      | $FEF3
    .byte $04 ; |     X  | $FEF4
    .byte $24 ; |  X  X  | $FEF5
LFEF6:
    .byte $10 ; |   X    | $FEF6
    .byte $10 ; |   X    | $FEF7
    .byte $80 ; |X       | $FEF8
    .byte $80 ; |X       | $FEF9
LFEFA:
    .byte $00 ; |        | $FEFA
    .byte $02 ; |      X | $FEFB
    .byte $00 ; |        | $FEFC
    .byte $02 ; |      X | $FEFD
LFEFE:
    .byte $0B ; |    X XX| $FEFE
    .byte $1B ; |   XX XX| $FEFF
    .byte $2B ; |  X X XX| $FF00
    .byte $3B ; |  XXX XX| $FF01
    .byte $68 ; | XX X   | $FF02
    .byte $78 ; | XXXX   | $FF03
    .byte $88 ; |X   X   | $FF04
    .byte $98 ; |X  XX   | $FF05
LFF06:
    .byte $01 ; |       X| $FF06
    .byte $11 ; |   X   X| $FF07
    .byte $21 ; |  X    X| $FF08
    .byte $31 ; |  XX   X| $FF09
    .byte $5D ; | X XXX X| $FF0A
    .byte $6D ; | XX XX X| $FF0B
    .byte $7D ; | XXXXX X| $FF0C
    .byte $8D ; |X   XX X| $FF0D
;===============================
  IF NTSC
LFF0E:
    .byte $FE ; |XXXXXXX | $FF0E  NTSC
    .byte $06 ; |     XX | $FF0F  NTSC
    .byte $0E ; |    XXX | $FF10  NTSC
    .byte $16 ; |   X XX | $FF11  NTSC
    .byte $FE ; |XXXXXXX | $FF12  NTSC
    .byte $26 ; |  X  XX | $FF13  NTSC
    .byte $2E ; |  X XXX | $FF14  NTSC
    .byte $36 ; |  XX XX | $FF15  NTSC
    .byte $3E ; |  XXXXX | $FF16  NTSC
LFF17:
    .byte $04 ; |     X  | $FF17  NTSC
    .byte $0B ; |    X XX| $FF18  NTSC
    .byte $13 ; |   X  XX| $FF19  NTSC
    .byte $1B ; |   XX XX| $FF1A  NTSC
    .byte $FF ; |XXXXXXXX| $FF1B  NTSC
    .byte $2B ; |  X X XX| $FF1C  NTSC
    .byte $33 ; |  XX  XX| $FF1D  NTSC
    .byte $3B ; |  XXX XX| $FF1E  NTSC
    .byte $44 ; | X   X  | $FF1F  NTSC

  ELSE PAL

LFF0E:
    .byte $FE ; |XXXXXXX | $FF30  PAL
    .byte $08 ; |    X   | $FF31  PAL
    .byte $11 ; |   X   X| $FF32  PAL
    .byte $1A ; |   XX X | $FF33  PAL
    .byte $FE ; |XXXXXXX | $FF34  PAL
    .byte $2C ; |  X XX  | $FF35  PAL
    .byte $35 ; |  XX X X| $FF36  PAL
    .byte $3D ; |  XXXX X| $FF37  PAL
    .byte $47 ; | X   XXX| $FF38  PAL
LFF17:
    .byte $06 ; |     XX | $FF39  PAL
    .byte $0E ; |    XXX | $FF3A  PAL
    .byte $17 ; |   X XXX| $FF3B  PAL
    .byte $20 ; |  X     | $FF3C  PAL
    .byte $FF ; |XXXXXXXX| $FF3D  PAL
    .byte $32 ; |  XX  X | $FF3E  PAL
    .byte $3B ; |  XXX XX| $FF3F  PAL
    .byte $44 ; | X   X  | $FF40  PAL
    .byte $4E ; | X  XXX | $FF41  PAL
  ENDIF
;===============================

ColorTab:
    .byte   BLUE             ; left car, left score
    .byte   BROWN            ; right car, right score
    .byte   RED              ; grid and dots
    .byte   BLACK            ; background
;b&w switch
  IF NTSC || PAL_ORG
    .byte   DARK_GREY        ; left car, left score
    .byte   WHITE            ; right car, right score
    .byte   GREY             ; grid and dots
    .byte   LIGHT_GREY       ; background
  ELSE PAL_ALT
    .byte   GREY             ; left car, left score           lighter than original...
    .byte   WHITE            ; right car, right score
    .byte   DARK_GREY        ; grid and dots                  darker than original...
    .byte   LIGHT_GREY       ; background
  ENDIF


  REPEAT ($FFFC - *)
    .byte 0
  REPEND

    ORG $FFFC
    .word START,0
