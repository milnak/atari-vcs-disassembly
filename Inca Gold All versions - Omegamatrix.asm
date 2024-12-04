; Disassembly of spimznts.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line:    C:\DISTELLA.EXE -pasfcspimznts.cfg spimznts.bin
;
; spimznts.cfg contents:
;
;      ORG 7000
;      CODE 7000 7BEB
;      GFX 7BEC 7D9B
;      CODE 7D9C 7DF6
;      GFX 7DF7 7E9B
;      DATA 7E9C 7EE1
;      GFX 7EE2 7FBB
;      CODE 7FBC 7FE3
;      GFX 7FE4 7FFF

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
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

;==================================================================================================
;        SWITCHES
;==================================================================================================
; only one on at a time!
; 0 = off, 1 = on

ZELLERS         = 1
K_TEL_NTSC      = 0
K_TEL_PAL       = 0
SUNTEK          = 0
RAINBOW_VISION  = 0
STAR_GAME       = 0
NTSC_UNKNOWN    = 0
TWO_ZERO_EIGHT  = 0  ; Spider Kong (Unknown) PAL [a].bin
FUNV_TO_GOLTH   = 0
FUNVISION_PAL   = 0
PAL_UNKNOWN     = 0  ; Spider Kong (Unknown) PAL.bin
GOLIATH         = 0

;==================================================================================================
;        USER CONSTANTS
;==================================================================================================

  IF ZELLERS
PATH_ONE        = 0
PATH_TWO        = 0
FILLED_ONE      = 1
FILLED_TWO      = 0
INCA_GOLD       = 1
ERASED_LOGO     = 1
FUNVISION_LOGO  = 0
CROSSOVER_LOGO  = 0
GOLIATH_LOGO    = 0
COMMON_KONG     = 0
COMMON_INCA     = 1
COMMON_DATA     = 1
TIME_ONE        = $1C
TIME_TWO        = $16
TIME_THREE      = $1C
TIME_FOUR       = $20
COL_01          = $1C
COL_02          = $48
COL_03          = $1C
COL_04          = $1C
COL_05          = $48
UNK_05          = $98
UNK_06          = $78
UNK_07          = $1A
UNK_08          = $1C
UNK_09          = $99
UNK_10          = $F8
  ENDIF

  IF K_TEL_NTSC
PATH_ONE        = 0
PATH_TWO        = 0
FILLED_ONE      = 1
FILLED_TWO      = 0
INCA_GOLD       = 1
ERASED_LOGO     = 0
FUNVISION_LOGO  = 1
CROSSOVER_LOGO  = 0
GOLIATH_LOGO    = 0
COMMON_KONG     = 0
COMMON_INCA     = 1
COMMON_DATA     = 1
TIME_ONE        = $1C
TIME_TWO        = $16
TIME_THREE      = $1C
TIME_FOUR       = $20
COL_01          = $1C
COL_02          = $48
COL_03          = $1C
COL_04          = $1C
COL_05          = $48
UNK_05          = $98
UNK_06          = $78
UNK_07          = $1A
UNK_08          = $1C
UNK_09          = $99
UNK_10          = $F8
  ENDIF

  IF K_TEL_PAL
PATH_ONE        = 1
PATH_TWO        = 1
FILLED_ONE      = 0
FILLED_TWO      = 0
INCA_GOLD       = 1
ERASED_LOGO     = 0
FUNVISION_LOGO  = 1
CROSSOVER_LOGO  = 0
GOLIATH_LOGO    = 0
COMMON_KONG     = 0
COMMON_INCA     = 1
COMMON_DATA     = 1
TIME_ONE        = $30
TIME_TWO        = $09
TIME_THREE      = $30
TIME_FOUR       = $3D
COL_01          = $2C
COL_02          = $88
COL_03          = $2C
COL_04          = $2C
COL_05          = $88
UNK_05          = $71
UNK_06          = $98
UNK_07          = $2A
UNK_08          = $2C
UNK_09          = $90
UNK_10          = $46
  ENDIF

  IF SUNTEK
PATH_ONE        = 0
PATH_TWO        = 0
FILLED_ONE      = 1
FILLED_TWO      = 0
INCA_GOLD       = 0
PAC_KONG        = 1
TIME_ONE        = $1C
TIME_TWO        = $16
TIME_THREE      = $30
TIME_FOUR       = $3D
COL_04          = $1C
COL_05          = $48
UNK_05          = $98
UNK_06          = $78
UNK_07          = $1A
UNK_08          = $1C
UNK_09          = $99
UNK_10          = $F8
  ENDIF

  IF RAINBOW_VISION
PATH_ONE        = 0
PATH_TWO        = 0
FILLED_ONE      = 1
FILLED_TWO      = 0
INCA_GOLD       = 0
PAC_KONG        = 1
TIME_ONE        = $1C
TIME_TWO        = $16
TIME_THREE      = $30
TIME_FOUR       = $3D
COL_04          = $1C
COL_05          = $48
UNK_05          = $98
UNK_06          = $78
UNK_07          = $1A
UNK_08          = $1C
UNK_09          = $99
UNK_10          = $F8
  ENDIF

  IF STAR_GAME
PATH_ONE        = 0
PATH_TWO        = 0
FILLED_ONE      = 1
FILLED_TWO      = 0
INCA_GOLD       = 0
PAC_KONG        = 1
TIME_ONE        = $1C
TIME_TWO        = $16
TIME_THREE      = $1C
TIME_FOUR       = $20
COL_04          = $1C
COL_05          = $48
UNK_05          = $98
UNK_06          = $78
UNK_07          = $1A
UNK_08          = $1C
UNK_09          = $99
UNK_10          = $F8

  ENDIF

  IF NTSC_UNKNOWN
PATH_ONE        = 0
PATH_TWO        = 0
FILLED_ONE      = 1
FILLED_TWO      = 0
INCA_GOLD       = 0
PAC_KONG        = 1
TIME_ONE        = $1C
TIME_TWO        = $16
TIME_THREE      = $30
TIME_FOUR       = $1D
COL_04          = $1C
COL_05          = $48
UNK_05          = $98
UNK_06          = $78
UNK_07          = $1A
UNK_08          = $1C
UNK_09          = $99
UNK_10          = $F8
  ENDIF

  IF TWO_ZERO_EIGHT
PATH_ONE        = 1
PATH_TWO        = 1
FILLED_ONE      = 0
FILLED_TWO      = 0
INCA_GOLD       = 1
ERASED_LOGO     = 1
FUNVISION_LOGO  = 0
CROSSOVER_LOGO  = 0
GOLIATH_LOGO    = 0
COMMON_KONG     = 0
COMMON_INCA     = 1
COMMON_DATA     = 1
TIME_ONE        = $30
TIME_TWO        = $09
TIME_THREE      = $30
TIME_FOUR       = $3D
COL_01          = $2C
COL_02          = $88
COL_03          = $2C
COL_04          = $2C
COL_05          = $88
UNK_05          = $71
UNK_06          = $98
UNK_07          = $2A
UNK_08          = $2C
UNK_09          = $90
UNK_10          = $46
  ENDIF

  IF FUNV_TO_GOLTH
PATH_ONE        = 1
PATH_TWO        = 1
FILLED_ONE      = 0
FILLED_TWO      = 0
INCA_GOLD       = 1
ERASED_LOGO     = 0
FUNVISION_LOGO  = 0
CROSSOVER_LOGO  = 1
GOLIATH_LOGO    = 0
COMMON_KONG     = 0
COMMON_INCA     = 1
COMMON_DATA     = 1
TIME_ONE        = $30
TIME_TWO        = $09
TIME_THREE      = $30
TIME_FOUR       = $3D
COL_01          = $2C
COL_02          = $88
COL_03          = $2C
COL_04          = $2C
COL_05          = $88
UNK_05          = $71
UNK_06          = $98
UNK_07          = $2A
UNK_08          = $2C
UNK_09          = $90
UNK_10          = $46
  ENDIF

  IF FUNVISION_PAL
PATH_ONE        = 1
PATH_TWO        = 0
FILLED_ONE      = 0
FILLED_TWO      = 1
INCA_GOLD       = 1
ERASED_LOGO     = 0
FUNVISION_LOGO  = 1
CROSSOVER_LOGO  = 0
GOLIATH_LOGO    = 0
COMMON_KONG     = 0
COMMON_INCA     = 1
COMMON_DATA     = 1
TIME_ONE        = $30
TIME_TWO        = $09
TIME_THREE      = $30
TIME_FOUR       = $3D
COL_01          = $2C
COL_02          = $88
COL_03          = $2C
COL_04          = $2C
COL_05          = $88
UNK_05          = $71
UNK_06          = $98
UNK_07          = $2A
UNK_08          = $2C
UNK_09          = $99
UNK_10          = $46
  ENDIF

  IF PAL_UNKNOWN
PATH_ONE        = 1
PATH_TWO        = 0
FILLED_ONE      = 0
FILLED_TWO      = 1
INCA_GOLD       = 1
ERASED_LOGO     = 1
FUNVISION_LOGO  = 0
CROSSOVER_LOGO  = 0
GOLIATH_LOGO    = 0
COMMON_KONG     = 0
COMMON_INCA     = 1
COMMON_DATA     = 1
TIME_ONE        = $30
TIME_TWO        = $09
TIME_THREE      = $30
TIME_FOUR       = $3D
COL_01          = $2C
COL_02          = $88
COL_03          = $2C
COL_04          = $2C
COL_05          = $88
UNK_05          = $71
UNK_06          = $98
UNK_07          = $2A
UNK_08          = $2C
UNK_09          = $99
UNK_10          = $46
  ENDIF

  IF GOLIATH
PATH_ONE        = 1
PATH_TWO        = 0
FILLED_ONE      = 0
FILLED_TWO      = 1
INCA_GOLD       = 1
ERASED_LOGO     = 0
FUNVISION_LOGO  = 0
CROSSOVER_LOGO  = 0
GOLIATH_LOGO    = 1
COMMON_KONG     = 1
COMMON_INCA     = 0
COMMON_DATA     = 0
TIME_ONE        = $30
TIME_TWO        = $09
TIME_THREE      = $30
TIME_FOUR       = $3D
COL_01          = $30
COL_02          = $88
COL_03          = $2C
COL_04          = $2C
COL_05          = $88
UNK_05          = $71
UNK_06          = $8A
UNK_07          = $2A
UNK_08          = $2C
UNK_09          = $99
UNK_10          = $46
SHAPE_02        = $90
SHAPE_03        = $88
SHAPE_04        = $F8
  ELSE
SHAPE_02        = $00
SHAPE_03        = $00
SHAPE_04        = $70
  ENDIF

;-------------------------------
  IF INCA_GOLD
PAC_KONG        = 0
PAC_KONG_LOGO   = 0
UNK_01          = $0F
UNK_02          = $0C
UNK_03          = $0B
UNK_04          = $15
SHAPE_01        = $F8
COL_LOGO        = $0C
VOL_01          = $04
  ENDIF
;-------------------------------
  IF PAC_KONG
ERASED_LOGO     = 0
FUNVISION_LOGO  = 0
CROSSOVER_LOGO  = 0
GOLIATH_LOGO    = 0
PAC_KONG_LOGO   = 1
COMMON_KONG     = 1
COMMON_INCA     = 0
COMMON_DATA     = 0

UNK_01          = $10
UNK_02          = $FF
UNK_03          = $0D
UNK_04          = $00
SHAPE_01        = $20
COL_01          = $1E
COL_02          = $29
COL_03          = $0F
COL_LOGO        = $FF
VOL_01          = $00
  ENDIF

;==================================================================================================
;      SPIDER KONG (UNKNOWN) PAL.BIN     VS    SPIDER KONG (UNKNOWN) PAL [A].BIN
;==================================================================================================

;     TWO_ZERO_EIGHT
; PATH_TWO        = 1
; FILLED_TWO      = 0
; UNK_09          = $90

;    IF PAL_UNKNOWN
; PATH_TWO        = 0
; FILLED_TWO      = 1
; UNK_09          = $99

;==================================================================================================
;        MAIN PROGRAM
;==================================================================================================

  IF GOLIATH
    ORG $3000
  ELSE
    ORG $7000
  ENDIF

    CLD                    ; 2
    LDX    #0              ; 2
    LDA    #0              ; 2
L7005:
    STA    0,X             ; 4
    TXS                    ; 2
    INX                    ; 2
    BNE    L7005           ; 2³
    LDA    #TIME_ONE       ; 2
    STA    TIM64T          ; 4
    JSR    L7D9C           ; 6
    LDA    #$30            ; 2
    STA    $C5             ; 3
    LDA    #$C1            ; 2
    STA    $C6             ; 3
    JSR    L79FB           ; 6
    LDA    #1              ; 2
    STA    $AB             ; 3
    STA    $D9             ; 3
    STA    $E3             ; 3
    LDA    #$20            ; 2
    STA    $D0             ; 3
    LDA    #$14            ; 2
    STA    $C3             ; 3
L702E:
    JSR    L7DD6           ; 6
    LDA    #0              ; 2
    LDX    $D8             ; 3
    CPX    #1              ; 2
    BEQ    L703B           ; 2³
    LDA    #$4E            ; 2
L703B:
    STA    $DB             ; 3
    STA    $DD             ; 3
    STA    $DF             ; 3
    LDA    $B2             ; 3
    CMP    #7              ; 2
    BEQ    L7057           ; 2³
    INC    $C7             ; 5
    BNE    L7057           ; 2³
    INC    $D8             ; 5
    LDA    $D8             ; 3
    CMP    #3              ; 2
    BCC    L7057           ; 2³
    LDA    #1              ; 2
    STA    $D8             ; 3
L7057:
    LDA    SWCHB           ; 4
    AND    #$02            ; 2
    BNE    L708D           ; 2³
    LDA    $D0             ; 3
    CMP    #$88            ; 2
    BCS    L707D           ; 2³
    LDX    $AB             ; 3
    INX                    ; 2
    CPX    #3              ; 2
    BCC    L706D           ; 2³
    LDX    #1              ; 2
L706D:
    STX    $AB             ; 3
L706F:
    LDA    #0              ; 2
    STA    $B2             ; 3
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    LDA    #$88            ; 2
    STA    $D0             ; 3
  IF PATH_ONE
    JMP    L70BB           ; 3
  ELSE
    BNE    L70BB           ; 2³
  ENDIF
L707D:
    LDA    $AB             ; 3
    STA    $83             ; 3
    LDA    #0              ; 2
    STA    $81             ; 3
    STA    $82             ; 3
    JSR    L7B33           ; 6
    JMP    L706F           ; 3
L708D:
    LDA    $D0             ; 3
    BEQ    L7098           ; 2³
    AND    #$7F            ; 2
    STA    $D0             ; 3
    JMP    L70BB           ; 3
L7098:
    LDA    $D8             ; 3
    CMP    #1              ; 2
    BNE    L70A6           ; 2³
    LDA    $C2             ; 3
    AND    #$07            ; 2
    CMP    #7              ; 2
    BEQ    L70BB           ; 2³
L70A6:
    LDA    $C2             ; 3
    AND    #$01            ; 2
    BEQ    L70B2           ; 2³
    JSR    L74C4           ; 6
    JMP    L70BB           ; 3
L70B2:
    LDA    $C2             ; 3
    AND    #$07            ; 2
    BEQ    L70BB           ; 2³
    JSR    L76AA           ; 6
L70BB:
    LDA    #$4D            ; 2
    STA    $80             ; 3
    STA    CXCLR           ; 3
    LDA    #0              ; 2
    STA    $B9             ; 3
    STA    $B6             ; 3
    LDA    $BC             ; 3
    STA    $B4             ; 3
    LDA    $C6             ; 3
    STA    $E1             ; 3
    LDA    #$FC            ; 2
    STA    $E2             ; 3
    JSR    L7BDB           ; 6
L70D6:
    LDA    INTIM           ; 4
    BNE    L70D6           ; 2³
;===============================
  IF PATH_ONE
    JSR    L7ADB           ; 6
    LDA    #TIME_TWO       ; 2
    STA    TIM64T          ; 4
  ELSE
    LDA    #TIME_TWO       ; 2
    STA    TIM64T          ; 4
    JSR    L7ADB           ; 6
  ENDIF
;===============================
    LDA    $C5             ; 3
    LDX    #1              ; 2
    JSR    L7BB1           ; 6
    LDA    $BA             ; 3
    LDX    #0              ; 2
    JSR    L7BB1           ; 6

L70F1:
    LDA    INTIM           ; 4
    BNE    L70F1           ; 2³
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
  IF GOLIATH
    STA    PF0             ; 3
    STA    PF2             ; 3
    STA    $E4             ; 3
    LDY    #$09            ; 2
    STY    $B9             ; 3
    LDA    #$08            ; 2
    STA    COLUPF          ; 3
    LDA    #$FF            ; 2
  ELSE
    LDY    #9              ; 2
    STY    $B9             ; 3
    LDA    #0              ; 2
    STA    COLUPF          ; 3
    STA    PF0             ; 3
    STA    PF2             ; 3
    STA    $E4             ; 3
    LDA    #$20            ; 2
  ENDIF
    STA    PF1             ; 3
  IF PAC_KONG
    LDX    #$4C            ; 2
  ELSE
    LDX    $EC             ; 3
  ENDIF
    STX    COLUP1          ; 3
    LDX    #UNK_05         ; 2
    LDA    $D8             ; 3
    CMP    #1              ; 2
    BNE    L711A           ; 2³
    LDX    #UNK_06         ; 2
L711A:
    STX    $F0             ; 3
    LDA    #5              ; 2
    STA    NUSIZ1          ; 3
L7120:
    CPY    #6              ; 2
    BEQ    L7128           ; 2³
    CPY    #4              ; 2
    BNE    L712C           ; 2³
L7128:
    LDA    #SHAPE_02       ; 2
    STA    PF1             ; 3
L712C:
    LDY    $B9             ; 3
    BNE    L7134           ; 2³
    LDA    #SHAPE_03       ; 2
    STA    PF1             ; 3
L7134:
    STA    WSYNC           ; 3
    LDA    ($E1),Y         ; 5   monster on top
    STA    GRP1            ; 3
    STA    HMCLR           ; 3
    CPY    #3              ; 2
    BNE    L7144           ; 2³
    LDA    #SHAPE_01       ; 2
    STA    PF1             ; 3
L7144:
    CPY    #5              ; 2
    BNE    L714C           ; 2³
    LDA    #SHAPE_04       ; 2
    STA    PF1             ; 3
L714C:
    CPY    #7              ; 2
    BNE    L7154           ; 2³
    LDA    #COL_01         ; 2
    STA    COLUPF          ; 3
L7154:
    DEC    $B9             ; 5
    STA    WSYNC           ; 3
    BPL    L7120           ; 2³
    LDY    #$4D            ; 2
    LDA    ($DB),Y         ; 5
    STA    PF0             ; 3
    LDA    $F0             ; 3
    STA    COLUPF          ; 3
    LDA    ($DD),Y         ; 5
    STA    PF1             ; 3
    LDA    ($DF),Y         ; 5
    STA    PF2             ; 3
    INC    $B9             ; 5
    LDA    #$24            ; 2
    STA    TIM8T           ; 4
    LDA    #0              ; 2
    STA    GRP1            ; 3
    STA    NUSIZ1          ; 3
    LDA    $BE             ; 3
    LDX    #1              ; 2
    JSR    L7BB1           ; 6
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
  IF PAC_KONG
    LDA    #0              ; 2
  ELSE
    LDA    $D9             ; 3
  ENDIF
    STA    COLUBK          ; 3
    LDX    #$73            ; 2
L718A:
    LDA    INTIM           ; 4
    BNE    L718A           ; 2³
    JMP    L71AE           ; 3
L7192:
    LDY    $B6             ; 3
    LDA    ($B4),Y         ; 5
    DEY                    ; 2
    STA    WSYNC           ; 3
    BMI    L719D           ; 2³
    STY    $B6             ; 3
L719D:
    STA    GRP0            ; 3
    LDY    $80             ; 3
    LDA    ($DB),Y         ; 5
    STA    PF0             ; 3
    LDA    ($DD),Y         ; 5
    STA    PF1             ; 3
    LDA    ($DF),Y         ; 5
    STA    PF2             ; 3
    DEX                    ; 2
L71AE:
    CPX    $BB             ; 3
    BNE    L71B6           ; 2³
    LDY    #$10            ; 2
    STY    $B6             ; 3
L71B6:
    LDY    $B6             ; 3
    CPY    #UNK_01         ; 2
    BCS    L71C6           ; 2³
    LDA    #UNK_02         ; 2
    CPY    #UNK_03         ; 2
    BCS    L71C4           ; 2³
    LDA    #COL_02         ; 2
L71C4:
    STA    COLUP0          ; 3
L71C6:
    LDA    ($B4),Y         ; 5
    DEY                    ; 2
    BMI    L71CD           ; 2³
    STY    $B6             ; 3
L71CD:
    LDY    $B9             ; 3
    DEC    $E4             ; 5
    STA    GRP0            ; 3
    LDA    $E4             ; 3
    BPL    L71DB           ; 2³
    LDA    #UNK_04         ; 2
    STA    $E4             ; 3
L71DB:
    LDA    $E4             ; 3
    CLC                    ; 2
    ADC    $F0             ; 3
    ORA    #$04            ; 2
    STA    COLUPF          ; 3
    LDA    ($B7),Y         ; 5
    DEY                    ; 2
    BMI    L71ED           ; 2³
    STY    $B9             ; 3
    STA    GRP1            ; 3
L71ED:
    CPX    $BF             ; 3
    BNE    L71F5           ; 2³
    LDY    #$0A            ; 2
    STY    $B9             ; 3
L71F5:
    STA    HMCLR           ; 3
    DEC    $80             ; 5
    BPL    L7192           ; 2³
    LDA    #0              ; 2
    STA    REFP0           ; 3
    STA    REFP1           ; 3
    LDY    $B6             ; 3
    LDA    ($B4),Y         ; 5
    STA    WSYNC           ; 3
    STA    GRP0            ; 3
    LDA    #$CF            ; 2
    STA    PF0             ; 3
    LDA    #$FF            ; 2
    STA    PF1             ; 3
    STA    PF2             ; 3
    LDX    #UNK_07         ; 2
;=============================
  IF PAC_KONG
    LDX    $F0             ; 3
  ELSE
    LDA    $D8             ; 3
  ENDIF
;=============================
    CMP    #1              ; 2
    BNE    L721D           ; 2³
    LDX    $F0             ; 3
L721D:
    STX    COLUPF          ; 3
    LDA    #0              ; 2
    STA    COLUBK          ; 3
    LDA    $B2             ; 3
    CMP    #7              ; 2
    BNE    L722F           ; 2³
    JSR    L7A5E           ; 6
    JMP    L7284           ; 3
L722F:
    LDY    $B6             ; 3
    LDA    ($B4),Y         ; 5
    STA    GRP0            ; 3
    LDA    #$20            ; 2
    LDX    #0              ; 2
    JSR    L7BB1           ; 6
    LDA    #0              ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    LDA    #$28            ; 2
    LDX    #1              ; 2
    JSR    L7BB1           ; 6
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #0              ; 2
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    LDA    #1              ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDA    #COL_LOGO       ; 2
    STA    COLUP1          ; 3
    STA    COLUP0          ; 3
    LDX    #7              ; 2
;=============================
  IF PATH_ONE
       NOP            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       STA    HMCLR   ;3
  ENDIF
;=============================
L7263:
    STA    WSYNC           ; 3
    LDA    LogoOne,X       ; 4
    STA    GRP0            ; 3
    LDA    LogoTwo,X       ; 4
    STA    GRP1            ; 3
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    LDA    LogoFour,X      ; 4
    TAY                    ; 2
    LDA    LogoThree,X     ; 4
    STA    GRP0            ; 3
    STY    GRP1            ; 3
    STA    HMCLR           ; 3
    DEX                    ; 2
    BPL    L7263           ; 2³
L7284:
    LDA    #TIME_THREE     ; 2
    STA    TIM64T          ; 4
    INC    $C2             ; 5
    LDA    $C2             ; 3
    AND    #$07            ; 2
    BEQ    L7295           ; 2³
    CMP    #4              ; 2
    BNE    L7295           ; 2³
L7295:
    LDA    SWCHB           ; 4
    AND    #$01            ; 2
    BEQ    L72A3           ; 2³
    LDA    $D0             ; 3
    BEQ    L72A6           ; 2³
    JMP    L7328           ; 3
L72A3:
    JMP    L7321           ; 3
L72A6:
    JSR    L79C4           ; 6
  IF PATH_TWO
    JSR    L73FB           ; 6
  ENDIF
    LDA    $C2             ; 3
    AND    #$07            ; 2
    BEQ    L72C4           ; 2³
    CMP    #3              ; 2
    BEQ    L72C4           ; 2³
    CMP    #1              ; 2
    BEQ    L72CD           ; 2³
    CMP    #4              ; 2
    BEQ    L72EF           ; 2³
    JSR    L7A97           ; 6
    JSR    L776B           ; 6
    JMP    L702E           ; 3
L72C4:
  IF PATH_TWO
  ELSE
    JSR    L73FB           ; 6
  ENDIF
    JSR    L747C           ; 6
    JMP    L702E           ; 3
L72CD:
    LDA    $ED             ; 3
    CMP    #$58            ; 2
    BEQ    L72EF           ; 2³
    LDX    $B3             ; 3
    BNE    L72D9           ; 2³
    LDX    #$46            ; 2
L72D9:
    DEX                    ; 2
    LDA    #VOL_01         ; 2
    STA    AUDV1           ; 3
    LDA    #$0C            ; 2
    STA    AUDC1           ; 3
    LDA    L7E9C,X         ; 4
    STA    AUDF1           ; 3
    BNE    L72ED           ; 2³
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
L72ED:
    STX    $B3             ; 3
L72EF:
    JMP    L702E           ; 3
L72F2:
    LDX    #$0A            ; 2
L72F4:
    INC    $DA             ; 5
    BEQ    L72FE           ; 2³
    DEX                    ; 2
    BNE    L72F4           ; 2³
    JMP    L702E           ; 3
L72FE:
    LDA    #1              ; 2
    STA    $D0             ; 3
    JSR    L73EE           ; 6
    JMP    L702E           ; 3
L7308:
    LDA    $C2             ; 3
    AND    #$01            ; 2
    BEQ    L7312           ; 2³
    INC    $DA             ; 5
    BEQ    L7315           ; 2³
L7312:
    JMP    L702E           ; 3
L7315:
    LDA    #0              ; 2
    STA    $D0             ; 3
    STA    $BF             ; 3
    JSR    L73EE           ; 6
    JMP    L702E           ; 3
L7321:
    LDA    #$48            ; 2
    STA    $D0             ; 3
    JMP    L702E           ; 3
L7328:
    CMP    #1              ; 2
    BEQ    L734F           ; 2³
    CMP    #$49            ; 2
    BEQ    L7349           ; 2³
    CMP    #$48            ; 2
    BEQ    L733F           ; 2³
    CMP    #$28            ; 2
    BEQ    L72F2           ; 2³+1
    CMP    #$18            ; 2
    BEQ    L7308           ; 2³
    JMP    L702E           ; 3
L733F:
    JSR    L73A0           ; 6
    LDA    #$49            ; 2
    STA    $D0             ; 3
    JMP    L702E           ; 3
L7349:
    JSR    L73C7           ; 6
    JMP    L702E           ; 3
L734F:
    LDA    #0              ; 2
    STA    $D0             ; 3
    STA    AUDV1           ; 3
    LDA    $D1             ; 3
    CMP    #2              ; 2
    BCS    L737A           ; 2³
    LDA    $D8             ; 3
    STA    $D4             ; 3
    LDA    $D3             ; 3
    BNE    L736A           ; 2³
    LDA    $D2             ; 3
    BEQ    L7399           ; 2³
    JMP    L7389           ; 3
L736A:
    LDA    $D6             ; 3
    STA    $D8             ; 3
    DEC    $D3             ; 5
    LDA    #2              ; 2
    STA    $D1             ; 3
    JSR    L79FB           ; 6
    JMP    L702E           ; 3
L737A:
    LDA    $D8             ; 3
    STA    $D6             ; 3
    LDA    $D2             ; 3
    BNE    L7389           ; 2³
    LDA    $D3             ; 3
    BEQ    L7399           ; 2³
    JMP    L736A           ; 3
L7389:
    LDA    $D4             ; 3
    STA    $D8             ; 3
    DEC    $D2             ; 5
    LDA    #1              ; 2
    STA    $D1             ; 3
    JSR    L79FB           ; 6
    JMP    L702E           ; 3
L7399:
    LDA    #$40            ; 2
    STA    $D0             ; 3
    JMP    L702E           ; 3
L73A0:
    LDA    #7              ; 2
    STA    $B2             ; 3
    LDA    #1              ; 2
    STA    $D4             ; 3
    STA    $D6             ; 3
    STA    $D8             ; 3
    STA    $D1             ; 3
    LDA    #0              ; 2
    STA    $C7             ; 3
    STA    $D3             ; 3
    LDA    $AB             ; 3
    AND    #$01            ; 2
    BNE    L73BE           ; 2³
    LDA    #5              ; 2
    STA    $D3             ; 3
L73BE:
    LDA    #4              ; 2
    STA    $D2             ; 3
    LDA    #$71            ; 2
    STA    $D9             ; 3
    RTS                    ; 6

L73C7:
    LDA    #0              ; 2
    STA    $D0             ; 3
    STA    $AE             ; 3
    STA    $AF             ; 3
    STA    $83             ; 3
    STA    $81             ; 3
    STA    $82             ; 3
    STA    $DA             ; 3
    STA    $9F             ; 3
    STA    $A1             ; 3
    STA    $A5             ; 3
    STA    $A7             ; 3
    STA    $B3             ; 3
    JSR    L73EE           ; 6
    LDA    #8              ; 2
    STA    $A3             ; 3
    STA    $A9             ; 3
    JSR    L79FB           ; 6
    RTS                    ; 6

L73EE:
    LDA    #0              ; 2
    STA    $87             ; 3
    STA    $8C             ; 3
    STA    $91             ; 3
    STA    $96             ; 3
    STA    $BF             ; 3
    RTS                    ; 6

L73FB:
    LDA    $ED             ; 3
    CMP    #$58            ; 2
;=============================
  IF PATH_TWO
    BNE    L7409           ; 2³
    RTS                    ; 6
L7409:
    LDA    $C2             ; 3
    AND    #$03            ; 2
    BEQ    L7402           ; 2
    RTS                    ; 6

  ELSE
    BNE    L7402           ; 2³
    RTS                    ; 6
  ENDIF
;=============================

L7402:
    LDA    $BC             ; 3
    CMP    #$9C            ; 2
    BEQ    L7430           ; 2³
    CMP    #$8A            ; 2
    BEQ    L7430           ; 2³
    LDY    #0              ; 2
    LDX    #$0F            ; 2
L7410:
    LDA    $87,X           ; 4
    BEQ    L7415           ; 2³
    INY                    ; 2
L7415:
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    BPL    L7410           ; 2³
    CPY    #4              ; 2
    BCS    L7430           ; 2³
L7420:
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    LDA    $87,X           ; 4
    BNE    L7420           ; 2³
    LDA    #$76            ; 2
    STA    $87,X           ; 4
    JMP    L7431           ; 3
L7430:
    RTS                    ; 6

L7431:
    LDA    #$B8            ; 2
    STA    $88,X           ; 4
;=============================
 IF PATH_TWO
       LDA    $E8          ; 3
       AND    #$01         ; 2
       BEQ    LF450        ; 2
       LDA    $C5          ; 3
       AND    #$F8         ; 2
       JMP    $7454        ; 3
LF450: LDA    $C5          ; 3
       ORA    #$08         ; 2
LF454:

  ELSE
    LDA    $C5             ; 3
  ENDIF
;=============================
    STA    $86,X           ; 4
    LDA    $E8             ; 3
    AND    #$03            ; 2
    STA    $89,X           ; 4
    BEQ    L7443           ; 2³
    INC    $89,X           ; 6
L7443:
    BNE    L7449           ; 2³
    LDA    #$B0            ; 2
    STA    $88,X           ; 4
L7449:
    INC    $E3             ; 5
    LDA    $E3             ; 3
    AND    #$01            ; 2
    BNE    L7459           ; 2³
    SEC                    ; 2
    LDA    #0              ; 2
  IF GOLIATH
    SBC    $89,X           ; 4
    NOP                    ; 2
  ELSE
    SBC.wx $89,X           ; 4
  ENDIF
    STA    $89,X           ; 4
L7459:
    CPX    #0              ; 2
    BEQ    L7469           ; 2³
    CPX    #5              ; 2
    BEQ    L746D           ; 2³
    CPX    #$0F            ; 2
    BEQ    L7471           ; 2³
    LDA    $D8             ; 3
    BNE    L7479           ; 2³
L7469:
    LDA    #1              ; 2
    BNE    L7479           ; 2³
L746D:
    LDA    #2              ; 2
    BNE    L7479           ; 2³
L7471:
    LDA    $E8             ; 3
    AND    #$01            ; 2
    BNE    L7479           ; 2³
    LDA    #2              ; 2
L7479:
    STA    $8A,X           ; 4
    RTS                    ; 6

L747C:
    LDA    $DA             ; 3
    CMP    #7              ; 2
    BNE    L7483           ; 2³
    RTS                    ; 6

L7483:
    LDA    $ED             ; 3
    CMP    #$58            ; 2
    BNE    L748A           ; 2³
    RTS                    ; 6

L748A:
    CLC                    ; 2
    LDA    $EB             ; 3
    ADC    $C5             ; 3
    STA    $C5             ; 3
    CMP    #$17            ; 2
    BCS    L749E           ; 2³
    LDA    $D8             ; 3
    STA    $EB             ; 3
    LDA    #$17            ; 2
    JMP    L74AB           ; 3
L749E:
    CMP    #$76            ; 2
    BCC    L74AD           ; 2³
    LDA    #0              ; 2
    SEC                    ; 2
    SBC    $D8             ; 3
    STA    $EB             ; 3
    LDA    #$76            ; 2
L74AB:
    STA    $C5             ; 3
L74AD:
    LDA    $E8             ; 3
    AND    #$03            ; 2
    BEQ    L74B4           ; 2³
    RTS                    ; 6

L74B4:
    LDA    $C6             ; 3
    CMP    #$C1            ; 2
    BEQ    L74BF           ; 2³
    LDA    #$C1            ; 2
    JMP    L74C1           ; 3
L74BF:
    LDA    #$CC            ; 2
L74C1:
    STA    $C6             ; 3
    RTS                    ; 6

L74C4:
    LDA    $ED             ; 3
    CMP    #$58            ; 2
    BNE    L74CB           ; 2³
    RTS                    ; 6

L74CB:
    LDA    $C3             ; 3
    SEC                    ; 2
    SBC    #5              ; 2
    BCS    L74D4           ; 2³
    LDA    #$0F            ; 2
L74D4:
    STA    $C3             ; 3
    TAX                    ; 2
    LDA    $8A,X           ; 4
    BEQ    L751B           ; 2³+1
    LDA    $89,X           ; 4
    BEQ    L74EE           ; 2³
    CLC                    ; 2
    ADC    $86,X           ; 4
    STA    $86,X           ; 4
    LDA    $87,X           ; 4
    SEC                    ; 2
    SBC    $8A,X           ; 4
    STA    $87,X           ; 4
L74EB:
    JMP    L7557           ; 3
L74EE:
    DEC    $87,X           ; 6
    LDA    $86,X           ; 4
    STA    $EF             ; 3
    LDA    $87,X           ; 4
    SEC                    ; 2
    SBC    #7              ; 2
    JSR    L7833           ; 6
    LDA    $C8             ; 3
    CMP    #1              ; 2
    BEQ    L74EB           ; 2³+1
    LDA    $85             ; 3
    AND    #$01            ; 2
    BEQ    L7510           ; 2³
    LDA    #2              ; 2
    JMP    L7512           ; 3
L750D:
    JMP    L75A7           ; 3
L7510:
    LDA    #$FE            ; 2
L7512:
    STA    $89,X           ; 4
    LDA    #0              ; 2
    STA    $8A,X           ; 4
    JMP    L7557           ; 3
L751B:
    LDA    $89,X           ; 4
    CLC                    ; 2
    ADC    $86,X           ; 4
    STA    $86,X           ; 4
    STA    $EF             ; 3
    LDA    $87,X           ; 4
    SEC                    ; 2
    SBC    #7              ; 2
    JSR    L7833           ; 6
    LDA    $85             ; 3
    AND    #$01            ; 2
    BNE    L7543           ; 2³
    LDA    $87,X           ; 4
  IF GOLIATH
    CMP    $BB             ; 3
    NOP                    ; 2
  ELSE
    CMP.w  $BB             ; 4
  ENDIF
    BCS    L7543           ; 2³
    SEC                    ; 2
    LDA    $BB             ; 3
  IF GOLIATH
       SBC    $87,X        ; 4
       NOP                 ; 2
  ELSE
    SBC.wx $87,X           ; 4
  ENDIF
    CMP    #$10            ; 2
    BCS    L750D           ; 2³
L7543:
    LDA    $C8             ; 3
    CMP    #3              ; 2
    BNE    L7557           ; 2³
    LDA    $E8             ; 3
    AND    #$07            ; 2
    BEQ    L7557           ; 2³
    LDA    #7              ; 2
    STA    $8A,X           ; 4
    LDA    #0              ; 2
    STA    $89,X           ; 4
L7557:
    LDA    $87,X           ; 4
    CMP    #$20            ; 2
    BCC    L75A6           ; 2³
    CMP    #$31            ; 2
    BCC    L75A0           ; 2³
    LDA    $86,X           ; 4
    CMP    #$0B            ; 2
    BCC    L756F           ; 2³
    CMP    #$8E            ; 2
    BCC    L757B           ; 2³
    LDA    #$8E            ; 2
    BNE    L7571           ; 2³
L756F:
    LDA    #$0B            ; 2
L7571:
    STA    $86,X           ; 4
    LDA    #0              ; 2
    SEC                    ; 2
  IF GOLIATH
    SBC    $89,X           ; 4
    NOP                    ; 2
  ELSE
    SBC.wx $89,X           ; 4
  ENDIF
    STA    $89,X           ; 4
L757B:
    LDA    $86,X           ; 4
    STA    $BE             ; 3
    LDA    $87,X           ; 4
    STA    $BF             ; 3
    LDA    $88,X           ; 4
    CMP    #$B0            ; 2
    BEQ    L7591           ; 2³
    CMP    #$B8            ; 2
    BEQ    L7591           ; 2³
    LDA    #$B8            ; 2
    STA    $88,X           ; 4
L7591:
    STA    $C0             ; 3
L7593:
    CPX    #$0A            ; 2
    BCS    L759B           ; 2³
    LDA    #$0F            ; 2
    BNE    L759D           ; 2³
L759B:
    LDA    #UNK_08         ; 2
L759D:
    STA    $EC             ; 3
    RTS                    ; 6

L75A0:
    LDA    #0              ; 2
    STA    $87,X           ; 4
    STA    $BF             ; 3
L75A6:
    RTS                    ; 6

L75A7:
    LDA    $8A             ; 3
    BNE    L75AD           ; 2³
    LDA    $8F             ; 3
L75AD:
    STA    $8A,X           ; 4
    LDA    $89             ; 3
    BNE    L75B9           ; 2³
    LDA    $8E             ; 3
    BNE    L75B9           ; 2³
    LDA    $93             ; 3
L75B9:
    STA    $89,X           ; 4
    JMP    L7557           ; 3
;=============================
  IF PATH_ONE
L75BE:
    LDA    $D1             ; 3
    CMP    #2              ; 2
    BNE    L75D0           ; 2
    LDA    $C9             ; 3
    STA    $AC             ; 3
    LDA    #0              ; 2
    STA    $AD             ; 3
    BEQ    L75D4           ; 2
L75D0:
    LDA    $C9             ; 3
    STA    $AD             ; 3
    LDA    #0              ; 2
    STA    $AC             ; 3

  ELSE
L75BE:
    LDA    #0              ; 2
    STA    $AD             ; 3
    STA    $AC             ; 3
    LDA    $D1             ; 3
    CMP    #2              ; 2
    BNE    L75D0           ; 2³
    LDA    $C9             ; 3
    STA    $AC             ; 3
    BNE    L75D4           ; 2³
L75D0:
    LDA    $C9             ; 3
    STA    $AD             ; 3
  ENDIF
;=============================
L75D4:
    JSR    L7B79           ; 6
    RTS                    ; 6

L75D8:
    INC    $E8             ; 5
    JSR    L7FBC           ; 6
    LDX    $BA             ; 3
    STX    $EF             ; 3
    LDY    $BB             ; 3
    SEC                    ; 2
    LDA    $BB             ; 3
    SBC    #9              ; 2
    JSR    L7833           ; 6
    LDA    $E6             ; 3
    CMP    #1              ; 2
    BNE    L75FE           ; 2³
    LDA    $C8             ; 3
    CMP    #1              ; 2
    BEQ    L75FE           ; 2³
    LDA    #$58            ; 2
    STA    $BC             ; 3
    JMP    L76A1           ; 3
L75FE:
    LDA    $D1             ; 3
    CMP    #2              ; 2
    BNE    L760E           ; 2³
    LDA    SWCHA           ; 4
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    JMP    L7611           ; 3
L760E:
    LDA    SWCHA           ; 4
L7611:
    ASL                    ; 2
    STA    $EF             ; 3
    BCS    L764B           ; 2³
    LDA    $C8             ; 3
    CMP    #1              ; 2
    BEQ    L764B           ; 2³
    LDA    #0              ; 2
    STA    $E5             ; 3
    INX                    ; 2
L7621:
    LDA    $E8             ; 3
    AND    #$01            ; 2
    BNE    L7645           ; 2³
    LDA    $BC             ; 3
    CMP    #$69            ; 2
    BNE    L7641           ; 2³
    LDA    $E7             ; 3
    BNE    L7639           ; 2³
    LDA    #1              ; 2
    STA    $E7             ; 3
    LDA    #$58            ; 2
    BNE    L7643           ; 2³
L7639:
    LDA    #0              ; 2
    STA    $E7             ; 3
    LDA    #$8B            ; 2
    BNE    L7643           ; 2³
L7641:
    LDA    #$69            ; 2
L7643:
    STA    $BC             ; 3
L7645:
    JSR    L789B           ; 6
    JMP    L76A1           ; 3
L764B:
    LDA    $EF             ; 3
    ASL                    ; 2
    STA    $EF             ; 3
    BCS    L7660           ; 2³
    LDA    $C8             ; 3
    CMP    #1              ; 2
    BEQ    L7660           ; 2³
    DEX                    ; 2
    LDA    #8              ; 2
    STA    $E5             ; 3
    JMP    L7621           ; 3
L7660:
    LDA    $EF             ; 3
    ASL                    ; 2
    STA    $EF             ; 3
    BCS    L768E           ; 2³
    LDA    $C8             ; 3
    CMP    #1              ; 2
    BEQ    L7671           ; 2³
    CMP    #3              ; 2
    BNE    L768E           ; 2³
L7671:
    DEY                    ; 2
L7672:
    LDA    $BC             ; 3
    CMP    #$D8            ; 2
    BEQ    L767C           ; 2³
    LDA    #$D8            ; 2
    BNE    L767E           ; 2³
L767C:
    LDA    #$E9            ; 2
L767E:
    STA    $BC             ; 3
    LDA    $E8             ; 3
    AND    #$03            ; 2
    BNE    L7689           ; 2³
    JSR    L78B3           ; 6
L7689:
    DEC    $E9             ; 5
    JMP    L76A1           ; 3
L768E:
    LDA    $EF             ; 3
    ASL                    ; 2
    BCS    L76A1           ; 2³
    LDA    $C8             ; 3
    CMP    #1              ; 2
    BEQ    L769D           ; 2³
    CMP    #2              ; 2
    BNE    L76A1           ; 2³
L769D:
    INY                    ; 2
    JMP    L7672           ; 3
L76A1:
    STX    $BA             ; 3
    STY    $BB             ; 3
    LDA    $C8             ; 3
    STA    $E6             ; 3
    RTS                    ; 6

L76AA:
    LDA    $DA             ; 3
    CMP    #7              ; 2
    BNE    L76B1           ; 2³
    RTS                    ; 6

L76B1:
    LDA    $ED             ; 3
    CMP    #$58            ; 2
    BNE    L76BA           ; 2³
    JMP    L77B5           ; 3
L76BA:
    LDA    $BC             ; 3
    CMP    #$9C            ; 2
    BEQ    L76C7           ; 2³
    CMP    #$8A            ; 2
    BEQ    L76C7           ; 2³
    JMP    L7742           ; 3
L76C7:
    DEC    $BB             ; 5
    DEC    $BB             ; 5
    LDA    $BB             ; 3
    CMP    #$2B            ; 2
    BCS    L7710           ; 2³+1
    LDA    #$2B            ; 2
    STA    $BB             ; 3
    LDA    $CA             ; 3
    CMP    #$17            ; 2
    BNE    L76FC           ; 2³
    DEC    $E9             ; 5
    DEC    $E9             ; 5
    LDA    $E9             ; 3
    CMP    #$80            ; 2
    BCC    L76E7           ; 2³
    LDA    #0              ; 2
L76E7:
    STA    AUDF0           ; 3
    DEC    $EA             ; 5
    DEC    $EA             ; 5
    DEC    $EA             ; 5
    LDA    $EA             ; 3
    CMP    #$80            ; 2
    BCC    L76F7           ; 2³
    LDA    #0              ; 2
L76F7:
    STA    AUDV0           ; 3
    JMP    L7710           ; 3
L76FC:
    LDA    #8              ; 2
    STA    AUDC0           ; 3
    LDA    #$16            ; 2
    STA    AUDF0           ; 3
    STA    $E9             ; 3
    LDA    #$0B            ; 2
    STA    $EA             ; 3
    STA    AUDV0           ; 3
    LDA    #$17            ; 2
    STA    $CA             ; 3
L7710:
    JSR    L78C2           ; 6
    LDA    $84             ; 3
    ORA    #$01            ; 2
    STA    $D9             ; 3
    INC    $E9             ; 5
    INC    $E9             ; 5
    LDA    $E9             ; 3
    CMP    #$20            ; 2
    BCC    L7727           ; 2³
    LDA    #0              ; 2
    STA    AUDV0           ; 3
L7727:
    STA    AUDF0           ; 3
    DEC    $BD             ; 5
    BEQ    L772E           ; 2³
    RTS                    ; 6

L772E:
    LDA    #1              ; 2
    STA    $D9             ; 3
    LDA    #0              ; 2
    STA    $BA             ; 3
    STA    $BB             ; 3
    STA    $BC             ; 3
    LDA    #1              ; 2
    STA    $D0             ; 3
    JSR    L78A8           ; 6
    RTS                    ; 6

L7742:
  IF GOLIATH
    LDA    WSYNC           ; 3
    NOP                    ; 2
  ELSE
    LDA.w  WSYNC           ; 4   WSYNC??
  ENDIF
    AND    #$80            ; 2
    BNE    L7752           ; 2³
    LDA    $C7             ; 3
    BNE    L7752           ; 2³
    LDA    #$8A            ; 2
    JMP    L79CC           ; 3
L7752:
    LDA    $C7             ; 3
    BNE    L7767           ; 2³
    JSR    L75D8           ; 6
    LDA    $BA             ; 3
    CMP    #8              ; 2
    BCC    L7766           ; 2³
    CMP    #$8B            ; 2
    BCS    L7766           ; 2³
    JSR    L78D4           ; 6
L7766:
    RTS                    ; 6

L7767:
    JSR    L7923           ; 6
    RTS                    ; 6

L776B:
    LDA    $BB             ; 3
    CMP    #$74            ; 2
    BCS    L7772           ; 2³
    RTS                    ; 6

L7772:
    LDA    #$27            ; 2
    STA    $D9             ; 3
    LDA    $ED             ; 3
    CMP    #$58            ; 2
    BEQ    L77B5           ; 2³
    JSR    L78A8           ; 6
    JSR    L78C2           ; 6
;=============================
  IF PATH_TWO
  ELSE
    LDA    $CF             ; 3
    CMP    #$60            ; 2
    BCS    L778F           ; 2³
    SED                    ; 2
    CLC                    ; 2
    ADC    #$40            ; 2
    CLD                    ; 2
    BNE    L7791           ; 2³
  ENDIF
;=============================
L778F:
    LDA    #UNK_09         ; 2
L7791:
    STA    $C9             ; 3
    JSR    L75BE           ; 6
    LDA    #$58            ; 2
    STA    $ED             ; 3
    LDA    #$C0            ; 2
    STA    $EE             ; 3
    LDA    #$CC            ; 2
    STA    $C6             ; 3
    LDA    #$15            ; 2
    STA    AUDF0           ; 3
    STA    $EA             ; 3
    LDA    #6              ; 2
    STA    AUDC0           ; 3
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
    STA    $E9             ; 3
    INC    $E9             ; 5
    RTS                    ; 6

L77B5:
    LDA    $C3             ; 3
    SEC                    ; 2
    SBC    #5              ; 2
    BCS    L77BE           ; 2³
    LDA    #$0F            ; 2
L77BE:
    STA    $C3             ; 3
    TAX                    ; 2
    JSR    L7593           ; 6
    DEC    $EE             ; 5
    BEQ    L7808           ; 2³+1
    LDA    $EE             ; 3
    AND    #$03            ; 2
    BNE    L77F3           ; 2³
    INC    $E9             ; 5
    JSR    L7FBC           ; 6
    LDA    $E9             ; 3
    BNE    L77F3           ; 2³
    LDA    $EE             ; 3
    CMP    #$70            ; 2
    BCS    L77E5           ; 2³
    CMP    #$30            ; 2
    BCS    L77E9           ; 2³
    LDA    #0              ; 2
    BEQ    L77EB           ; 2³
L77E5:
    LDA    #$0C            ; 2
    BNE    L77EB           ; 2³
L77E9:
    LDA    #$0A            ; 2
L77EB:
    STA    $E9             ; 3
    STA    AUDV0           ; 3
    LDA    #0              ; 2
    STA    AUDV1           ; 3
L77F3:
    DEC    $EA             ; 5
    BNE    L7807           ; 2³+1
    LDA    $EE             ; 3
    CMP    #$70            ; 2
    BCC    L7801           ; 2³+1
    LDA    #$0A            ; 2
    BNE    L7803           ; 2³
L7801:
    LDA    #8              ; 2
L7803:
    STA    $EA             ; 3
    STA    AUDF0           ; 3
L7807:
    RTS                    ; 6

L7808:
    LDA    #1              ; 2
    STA    $D9             ; 3
    JSR    L78A8           ; 6
    LDA    #$C1            ; 2
    STA    $C6             ; 3
    LDA    #0              ; 2
    STA    $ED             ; 3
    INC    $D8             ; 5
    LDA    $D8             ; 3
    CMP    #3              ; 2
    BNE    L7823           ; 2³
    LDA    #1              ; 2
    STA    $D8             ; 3
L7823:
    LDA    $D1             ; 3
    CMP    #2              ; 2
    BEQ    L782D           ; 2³
    INC    $D2             ; 5
    BNE    L782F           ; 2³
L782D:
    INC    $D3             ; 5
L782F:
    JSR    L79FB           ; 6
    RTS                    ; 6

L7833:
    CMP    #$24            ; 2
    BEQ    L784C           ; 2³
    CMP    #$34            ; 2
    BEQ    L7875           ; 2³
    CMP    #$44            ; 2
    BEQ    L788C           ; 2³
    CMP    #$54            ; 2
    BEQ    L7875           ; 2³
    CMP    #$64            ; 2
    BEQ    L788C           ; 2³
    LDA    #1              ; 2
    STA    $C8             ; 3
    RTS                    ; 6

L784C:
    LDA    $EF             ; 3
    CMP    #$12            ; 2
    BCC    L785E           ; 2³
    CMP    #$18            ; 2
    BCC    L7863           ; 2³
    CMP    #$80            ; 2
    BCC    L785E           ; 2³
    CMP    #$87            ; 2
    BCC    L7863           ; 2³
L785E:
    LDA    #0              ; 2
    STA    $C8             ; 3
    RTS                    ; 6

L7863:
    LDA    #2              ; 2
    STA    $C8             ; 3
    RTS                    ; 6

L7868:
    LDA    $EF             ; 3
    CMP    #$49            ; 2
    BCC    L785E           ; 2³
    CMP    #$4F            ; 2
    BCC    L7863           ; 2³
    JMP    L785E           ; 3
L7875:
    JSR    L7868           ; 6
    LDA    $C8             ; 3
    CMP    #0              ; 2
    BNE    L788B           ; 2³
    JSR    L784C           ; 6
L7881:
    LDA    $C8             ; 3
    CMP    #0              ; 2
    BEQ    L788B           ; 2³
    LDA    #3              ; 2
    STA    $C8             ; 3
L788B:
    RTS                    ; 6

L788C:
    JSR    L784C           ; 6
    LDA    $C8             ; 3
    CMP    #0              ; 2
    BNE    L788B           ; 2³
    JSR    L7868           ; 6
    JMP    L7881           ; 3
L789B:
    LDA    $E8             ; 3
    AND    #$07            ; 2
    CMP    #2              ; 2
    BEQ    L78AD           ; 2³
    CMP    #6              ; 2
    BEQ    L78B3           ; 2³
    RTS                    ; 6

L78A8:
    LDA    #0              ; 2
    STA    AUDV0           ; 3
    RTS                    ; 6

L78AD:
    LDA    #$1A            ; 2
    STA    AUDF0           ; 3
    BNE    L78B7           ; 2³
L78B3:
    LDA    #$1B            ; 2
    STA    AUDF0           ; 3
L78B7:
    LDA    #4              ; 2
    STA    AUDC0           ; 3
    LDA    #7              ; 2
    STA    AUDV0           ; 3
    STA    $E9             ; 3
    RTS                    ; 6

L78C2:
    LDX    #0              ; 2
    LDA    #0              ; 2
L78C6:
    STA    $86,X           ; 4
    DEC    $84             ; 5
    INX                    ; 2
    CPX    #$14            ; 2
    BNE    L78C6           ; 2³
    STA    $C7             ; 3
    STA    $BF             ; 3
    RTS                    ; 6

L78D4:
    LDA    $C8             ; 3
    CMP    #1              ; 2
    BNE    L78DB           ; 2³
    RTS                    ; 6

L78DB:
    LDA    $D1             ; 3
    CMP    #2              ; 2
    BNE    L78EB           ; 2³
  IF GOLIATH
    LDA    PF0             ; 3
    NOP                    ; 2
  ELSE
    LDA.w  PF0             ; 4
  ENDIF
    AND    #$80            ; 2
    BNE    L78FD           ; 2³
    JMP    L78F2           ; 3
L78EB:
  IF GOLIATH
    LDA    REFP1           ; 3
    NOP                    ; 2
  ELSE
    LDA.w  REFP1           ; 4
  ENDIF
    AND    #$80            ; 2
    BNE    L78FD           ; 2³
L78F2:
    LDX    $BA             ; 3
    LDY    $BB             ; 3
    LDA    $E5             ; 3
    BNE    L790A           ; 2³+1
    JMP    L78FE           ; 3
L78FD:
    RTS                    ; 6

L78FE:
    LDA    #1              ; 2
    STA    $C1             ; 3
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    BNE    L7912           ; 2³
L790A:
    LDA    #0              ; 2
    STA    $C1             ; 3
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
L7912:
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    STX    $BA             ; 3
    STY    $BB             ; 3
    LDA    #$7A            ; 2
    STA    $BC             ; 3
    LDA    #1              ; 2
    STA    $C7             ; 3
    RTS                    ; 6

L7923:
    LDA    $C7             ; 3
    CMP    #1              ; 2
    BNE    L793C           ; 2³
    LDA    #5              ; 2
    STA    AUDC0           ; 3
    LDA    #$1F            ; 2
    STA    AUDF0           ; 3
    STA    $E9             ; 3
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
    STA    $EA             ; 3
    JMP    L7960           ; 3
L793C:
    DEC    $E9             ; 5
    DEC    $E9             ; 5
    DEC    $E9             ; 5
    LDA    $E9             ; 3
    CMP    #$80            ; 2
    BCC    L794C           ; 2³
    LDA    #$1B            ; 2
    STA    $E9             ; 3
L794C:
    STA    AUDF0           ; 3
    DEC    $EA             ; 5
    DEC    $EA             ; 5
    DEC    $EA             ; 5
    LDA    $EA             ; 3
    CMP    #$80            ; 2
    BCC    L795E           ; 2³
    LDA    #$0F            ; 2
    STA    $EA             ; 3
L795E:
    STA    AUDV0           ; 3
L7960:
    LDA    $C2             ; 3
    AND    #$03            ; 2
    BEQ    L7967           ; 2³
    RTS                    ; 6

L7967:
    LDA    $C7             ; 3
    CMP    #5              ; 2
    BCC    L7994           ; 2³
    LDA    #$69            ; 2
    STA    $BC             ; 3
    INC    $C7             ; 5
    LDA    $C7             ; 3
    CMP    #6              ; 2
    BEQ    L797E           ; 2³
    CMP    #7              ; 2
    BCS    L7983           ; 2³
    RTS                    ; 6

L797E:
    DEC    $BB             ; 5
    DEC    $BB             ; 5
    RTS                    ; 6

L7983:
    LDA    #0              ; 2
    STA    $C7             ; 3
    JSR    L78A8           ; 6
    LDA    $C1             ; 3
    BEQ    L7991           ; 2³
    INC    $BA             ; 5
    RTS                    ; 6

L7991:
    DEC    $BA             ; 5
    RTS                    ; 6

L7994:
    LDX    $BA             ; 3
    LDY    $BB             ; 3
    LDA    $C1             ; 3
    CMP    #1              ; 2
    BEQ    L79A3           ; 2³
    DEX                    ; 2
    DEX                    ; 2
    JMP    L79A5           ; 3
L79A3:
    INX                    ; 2
    INX                    ; 2
L79A5:
    LDA    $C7             ; 3
    CMP    #1              ; 2
    BEQ    L79B7           ; 2³
    CMP    #2              ; 2
    BEQ    L79BB           ; 2³
    LDA    #5              ; 2
    STA    $C7             ; 3
    DEY                    ; 2
    DEY                    ; 2
    BNE    L79BF           ; 2³
L79B7:
    INY                    ; 2
    INY                    ; 2
    BNE    L79BD           ; 2³
L79BB:
    DEY                    ; 2
    DEY                    ; 2
L79BD:
    INC    $C7             ; 5
L79BF:
    STX    $BA             ; 3
    STY    $BB             ; 3
    RTS                    ; 6

L79C4:
    LDA    COLUP1          ; 3
    AND    #$80            ; 2
    BEQ    L79FA           ; 2³
    LDA    #$9C            ; 2
L79CC:
    STA    $BC             ; 3
    LDA    #$0C            ; 2
    STA    AUDC0           ; 3
    LDA    #3              ; 2
    STA    AUDF0           ; 3
    STA    $E9             ; 3
    LDA    #$0C            ; 2
    STA    AUDV0           ; 3
    STA    $CA             ; 3
    LDA    $BB             ; 3
;=============================
  IF PATH_TWO
  ELSE
    CMP    #$74            ; 2
    BCS    L79F2           ; 2³
  ENDIF
;=============================
    CMP    #$44            ; 2
    BCC    L79F2           ; 2³
    SEC                    ; 2
    SBC    #$10            ; 2
    AND    #$70            ; 2
    STA    $C9             ; 3
    JSR    L75BE           ; 6
L79F2:
    LDA    #$23            ; 2
    STA    $BD             ; 3
    LDA    #$E0            ; 2
    STA    $84             ; 3
L79FA:
    RTS                    ; 6

L79FB:
    LDA    #0              ; 2
    STA    $E9             ; 3
    STA    $EA             ; 3
    LDA    #$4C            ; 2
    STA    $BA             ; 3
    LDA    #$2D            ; 2
    STA    $BB             ; 3
    LDA    #$69            ; 2
    STA    $BC             ; 3
    JSR    L73EE           ; 6
    JSR    L7A30           ; 6
    LDA    $D8             ; 3
    CMP    #2              ; 2
    BEQ    L7A1D           ; 2³
    LDA    #1              ; 2
    BNE    L7A21           ; 2³
L7A1D:
    LDA    #1              ; 2
    BNE    L7A21           ; 2³
L7A21:
    STA    $D9             ; 3
    LDA    #$99            ; 2
    STA    $CF             ; 3
    LDA    #$28            ; 2
    STA    $85             ; 3
    LDA    $D8             ; 3
    STA    $EB             ; 3
    RTS                    ; 6

L7A30:
    LDA    $D1             ; 3
    CMP    #2              ; 2
    BEQ    L7A3B           ; 2³
    LDA    $D2             ; 3
    JMP    L7A3D           ; 3
L7A3B:
    LDA    $D3             ; 3
L7A3D:
    CMP    #9              ; 2
    BCC    L7A43           ; 2³
    LDA    #9              ; 2
L7A43:
    JSR    L7AD4           ; 6
    CLC                    ; 2
    ADC    #8              ; 2
    STA    $CD             ; 3
    LDA    #8              ; 2
    STA    $CB             ; 3
    LDA    #$18            ; 2
    STA    $D0             ; 3
    LDA    #$E0            ; 2
    STA    $DA             ; 3
    LDA    #0              ; 2
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    RTS                    ; 6

L7A5E:
    LDA    #$48            ; 2
    LDX    #0              ; 2
    JSR    L7BB1           ; 6
    STX    GRP0            ; 3
    STX    GRP1            ; 3
    LDA    #$50            ; 2
    LDX    #1              ; 2
    JSR    L7BB1           ; 6
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #0              ; 2
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    JSR    L7FD3           ; 6
    LDA    #COL_03         ; 2
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDY    #7              ; 2
L7A87:
    STA    WSYNC           ; 3
    LDA    ($CB),Y         ; 5   time left digit
    STA    GRP0            ; 3
    LDA    ($CD),Y         ; 5   time right digit
    STA    GRP1            ; 3
    STA    HMCLR           ; 3
    DEY                    ; 2
    BPL    L7A87           ; 2³
    RTS                    ; 6

L7A97:
    LDA    $ED             ; 3
    CMP    #$58            ; 2
    BEQ    L7ACC           ; 2³
    LDA    $B2             ; 3
    CMP    #7              ; 2
    BNE    L7ACC           ; 2³
    DEC    $85             ; 5
    BNE    L7AB8           ; 2³
    LDA    #$1E            ; 2
    STA    $85             ; 3
    SEC                    ; 2
    SED                    ; 2
    LDA    $CF             ; 3
    SBC    #1              ; 2

  IF PATH_ONE
    BCC    .next           ; 2³
  ELSE
    BCC    L7ACC           ; 2³
  ENDIF

    STA    $CF             ; 3
    BEQ    L7ACE           ; 2³
    CLD                    ; 2
L7AB8:
    LDA    $CF             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    JSR    L7AD4           ; 6
    STA    $CB             ; 3
    LDA    $CF             ; 3
    AND    #$0F            ; 2
    JSR    L7AD4           ; 6
    STA    $CD             ; 3
L7ACC:
;===============================
  IF PATH_ONE
    RTS                    ; 6
  ENDIF
;===============================
.next:
    CLD                    ; 2
    RTS                    ; 6

L7ACE:
    CLD                    ; 2
    LDA    #$8A            ; 2
    JMP    L79CC           ; 3
L7AD4:
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    CLC                    ; 2
    ADC    #8              ; 2
    RTS                    ; 6

L7ADB:
    LDA    #$10            ; 2
    LDX    #0              ; 2
    JSR    L7BB1           ; 6
    LDA    #COL_04         ; 2
    STA    COLUP1          ; 3
    LDA    #$50            ; 2
    LDX    #1              ; 2
    JSR    L7BB1           ; 6
    STX    CTRLPF          ; 3
    LDA    #COL_05         ; 2
    STA    COLUP0          ; 3
    LDA    #3              ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDY    #7              ; 2
L7AFB:
    STA    WSYNC           ; 3
    LDA    ($9F),Y         ; 5
  IF GOLIATH
  ELSE
    NOP                    ; 2
  ENDIF
    STA    GRP0            ; 3
    LDA    ($A5),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($A1),Y         ; 5
    LDX    $EF             ; 3
    LDX    $EF             ; 3
    STA    GRP0            ; 3
    LDA    ($A3),Y         ; 5
    STA    GRP0            ; 3
  IF GOLIATH
    LDX    $EF             ; 3
  ELSE
    LDX.w  $EF             ; 4
  ENDIF
    LDA    ($A7),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($A9),Y         ; 5
    STA    GRP1            ; 3
    DEY                    ; 2
    BNE    L7AFB           ; 2³
    LDA    #0              ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    LDA    #$10            ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDA    $E5             ; 3
    STA    REFP0           ; 3
    STA    REFP1           ; 3
    RTS                    ; 6

  IF GOLIATH
    .byte $EA,$EA
  ENDIF

L7B33:
    LDX    #2              ; 2
    LDY    #8              ; 2
L7B37:
    LDA    $81,X           ; 4
    AND    #$F0            ; 2
    LSR                    ; 2
    ADC    #8              ; 2
    STA.wy $9F,Y           ; 5
    LDA    $81,X           ; 4
    AND    #$0F            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ADC    #8              ; 2
    STA.wy $A1,Y           ; 5
    LDA    #$FC            ; 2
    STA.wy $A0,Y           ; 5
    STA.wy $A2,Y           ; 5
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEX                    ; 2
    BPL    L7B37           ; 2³
    LDX    #0              ; 2
    LDA    #8              ; 2
    CMP    $9F             ; 3
    BNE    L7B6C           ; 2³
    STX    $9F             ; 3
    CMP    $A1             ; 3
    BNE    L7B6C           ; 2³
    STX    $A1             ; 3
L7B6C:
    CMP    $A5             ; 3
    BNE    L7B78           ; 2³
    STX    $A5             ; 3
    CMP    $A7             ; 3
    BNE    L7B78           ; 2³
    STX    $A7             ; 3
L7B78:
    RTS                    ; 6

L7B79:
    LDA    $AC             ; 3
    CLC                    ; 2
;===============================
  IF PATH_TWO
    LDX    #2              ; 2
    SED                    ; 2
L7B8E:
    ADC.wx $81,X           ; 4
    STA    $81,X           ; 4
    LDA    #0              ; 2
    DEX                    ; 2
    BNE    L7B8E           ; 2
    CLD                    ; 2
    LDA    $AD             ; 3
    CLC                    ; 2
    LDX    #1              ; 2
    SED                    ; 2
L7B9F:
    ADC    $AE,X           ; 4
    STA    $AE,X           ; 4
    STA    $B0,X           ; 4
    LDA    #0              ; 2
    DEX                    ; 2
    BPL    L7B9F           ; 2
    CLD                    ; 2
    LDX    #4              ; 2
L7BAD:
    CLC                    ; 2
    ASL    $B1             ; 5
    ROL    $B0             ; 5
    DEX                    ; 2
    BNE    L7BAD           ; 2
    LDA    $B0             ; 3
    STA    $81             ; 3
    LDA    $82             ; 3
    AND    #$0F            ; 2
    ORA    $B1             ; 3
    STA    $82             ; 3
    JSR    L7B33           ; 6
    RTS                    ; 6
  ELSE
;===============================
    SED                    ; 2
    ADC    $83             ; 3
    STA    $83             ; 3
    LDA    $82             ; 3
  IF GOLIATH
    AND    $F0             ; 3
    NOP                    ; 2
  ELSE
    AND.w  $F0             ; 4
  ENDIF
    STA    $B0             ; 3
    LDA    #0              ; 2
    ADC    $82             ; 3
    AND    #$0F            ; 2
    ORA    $B0             ; 3
    STA    $82             ; 3
    LDA    $AD             ; 3
    LSR    $AD             ; 5
    LSR    $AD             ; 5
    LSR    $AD             ; 5
    LSR    $AD             ; 5
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    CLC                    ; 2
  IF GOLIATH
    ADC    $82             ; 3
    NOP                    ; 2
  ELSE
    ADC.w  $82             ; 4
  ENDIF
    STA    $82             ; 3
    LDA    $AD             ; 3
    ADC    $81             ; 3
    STA    $81             ; 3
    CLD                    ; 2
    JSR    L7B33           ; 6
    RTS                    ; 6
  ENDIF
;===============================

L7BB1:
    CLC                    ; 2
    ADC    #$2E            ; 2
    TAY                    ; 2
    AND    #$0F            ; 2
  IF GOLIATH
    STA    $EF             ; 3
    NOP                    ; 2
  ELSE
    STA.w  $EF             ; 4
  ENDIF
    TYA                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    CLC                    ; 2
  IF GOLIATH
    ADC    $EF             ; 3
    NOP                    ; 2
  ELSE
    ADC.w  $EF             ; 4
  ENDIF
    CMP    #$0F            ; 2
    BCC    L7BCB           ; 2³
    SBC    #$0F            ; 2
    INY                    ; 2
L7BCB:
    EOR    #$07            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    HMP0,X          ; 4
    STA    WSYNC           ; 3
L7BD5:
    DEY                    ; 2
    BPL    L7BD5           ; 2³
    STA    RESP0,X         ; 4
    RTS                    ; 6

L7BDB:
    LDA    $C0             ; 3
    CMP    #$B0            ; 2
    BNE    L7BE7           ; 2³
    LDA    #UNK_10         ; 2
    STA    $EC             ; 3
    LDA    $E1             ; 3
L7BE7:
    INC    $E1             ; 5
    STA    $B7             ; 3
    RTS                    ; 6
;===============================
  IF FILLED_ONE
    .byte $FF ; |XXXXXXXX| $7BEC
    .byte $FF ; |XXXXXXXX| $7BED
    .byte $FF ; |XXXXXXXX| $7BEE
    .byte $FF ; |XXXXXXXX| $7BEF
    .byte $FF ; |XXXXXXXX| $7BF0
    .byte $FF ; |XXXXXXXX| $7BF1
    .byte $FF ; |XXXXXXXX| $7BF2
    .byte $FF ; |XXXXXXXX| $7BF3
    .byte $FF ; |XXXXXXXX| $7BF4
    .byte $FF ; |XXXXXXXX| $7BF5
    .byte $FF ; |XXXXXXXX| $7BF6
    .byte $FF ; |XXXXXXXX| $7BF7
    .byte $FF ; |XXXXXXXX| $7BF8
    .byte $FF ; |XXXXXXXX| $7BF9
    .byte $FF ; |XXXXXXXX| $7BFA
    .byte $FF ; |XXXXXXXX| $7BFB
    .byte $FF ; |XXXXXXXX| $7BFC
    .byte $FF ; |XXXXXXXX| $7BFD
    .byte $FF ; |XXXXXXXX| $7BFE
    .byte $FF ; |XXXXXXXX| $7BFF
  ENDIF
  IF FILLED_TWO
    .byte $FF ; |XXXXXXXX| $7BF6
    .byte $FF ; |XXXXXXXX| $7BF7
    .byte $FF ; |XXXXXXXX| $7BF8
    .byte $FF ; |XXXXXXXX| $7BF9
    .byte $FF ; |XXXXXXXX| $7BFA
    .byte $FF ; |XXXXXXXX| $7BFB
    .byte $FF ; |XXXXXXXX| $7BFC
    .byte $FF ; |XXXXXXXX| $7BFD
    .byte $FF ; |XXXXXXXX| $7BFE
    .byte $FF ; |XXXXXXXX| $7BFF
  ENDIF
;===============================
    .byte $00 ; |        | $7C00
    .byte $00 ; |        | $7C01
    .byte $00 ; |        | $7C02
    .byte $00 ; |        | $7C03
    .byte $00 ; |        | $7C04
    .byte $00 ; |        | $7C05
    .byte $00 ; |        | $7C06
    .byte $00 ; |        | $7C07
    .byte $00 ; |        | $7C08
    .byte $3C ; |  XXXX  | $7C09
    .byte $66 ; | XX  XX | $7C0A
    .byte $66 ; | XX  XX | $7C0B
    .byte $66 ; | XX  XX | $7C0C
    .byte $66 ; | XX  XX | $7C0D
    .byte $66 ; | XX  XX | $7C0E
    .byte $3C ; |  XXXX  | $7C0F
    .byte $00 ; |        | $7C10
    .byte $3C ; |  XXXX  | $7C11
    .byte $18 ; |   XX   | $7C12
    .byte $18 ; |   XX   | $7C13
    .byte $18 ; |   XX   | $7C14
    .byte $18 ; |   XX   | $7C15
    .byte $38 ; |  XXX   | $7C16
    .byte $18 ; |   XX   | $7C17
    .byte $00 ; |        | $7C18
    .byte $7E ; | XXXXXX | $7C19
    .byte $60 ; | XX     | $7C1A
    .byte $60 ; | XX     | $7C1B
    .byte $3C ; |  XXXX  | $7C1C
    .byte $06 ; |     XX | $7C1D
    .byte $46 ; | X   XX | $7C1E
    .byte $3C ; |  XXXX  | $7C1F
    .byte $00 ; |        | $7C20
    .byte $3C ; |  XXXX  | $7C21
    .byte $46 ; | X   XX | $7C22
    .byte $06 ; |     XX | $7C23
    .byte $1C ; |   XXX  | $7C24
    .byte $06 ; |     XX | $7C25
    .byte $46 ; | X   XX | $7C26
    .byte $3C ; |  XXXX  | $7C27
    .byte $00 ; |        | $7C28
    .byte $0C ; |    XX  | $7C29
    .byte $0C ; |    XX  | $7C2A
    .byte $7E ; | XXXXXX | $7C2B
    .byte $6C ; | XX XX  | $7C2C
    .byte $3C ; |  XXXX  | $7C2D
    .byte $1C ; |   XXX  | $7C2E
    .byte $0C ; |    XX  | $7C2F
    .byte $00 ; |        | $7C30
    .byte $7C ; | XXXXX  | $7C31
    .byte $06 ; |     XX | $7C32
    .byte $06 ; |     XX | $7C33
    .byte $7C ; | XXXXX  | $7C34
    .byte $60 ; | XX     | $7C35
    .byte $60 ; | XX     | $7C36
    .byte $7E ; | XXXXXX | $7C37
    .byte $00 ; |        | $7C38
    .byte $3C ; |  XXXX  | $7C39
    .byte $66 ; | XX  XX | $7C3A
    .byte $66 ; | XX  XX | $7C3B
    .byte $7C ; | XXXXX  | $7C3C
    .byte $60 ; | XX     | $7C3D
    .byte $62 ; | XX   X | $7C3E
    .byte $3C ; |  XXXX  | $7C3F
    .byte $00 ; |        | $7C40
    .byte $18 ; |   XX   | $7C41
    .byte $18 ; |   XX   | $7C42
    .byte $18 ; |   XX   | $7C43
    .byte $0C ; |    XX  | $7C44
    .byte $06 ; |     XX | $7C45
    .byte $66 ; | XX  XX | $7C46
    .byte $7E ; | XXXXXX | $7C47
    .byte $00 ; |        | $7C48
    .byte $3C ; |  XXXX  | $7C49
    .byte $66 ; | XX  XX | $7C4A
    .byte $66 ; | XX  XX | $7C4B
    .byte $3C ; |  XXXX  | $7C4C
    .byte $66 ; | XX  XX | $7C4D
    .byte $66 ; | XX  XX | $7C4E
    .byte $3C ; |  XXXX  | $7C4F
    .byte $00 ; |        | $7C50
    .byte $3C ; |  XXXX  | $7C51
    .byte $46 ; | X   XX | $7C52
    .byte $06 ; |     XX | $7C53
    .byte $3E ; |  XXXXX | $7C54
    .byte $66 ; | XX  XX | $7C55
    .byte $66 ; | XX  XX | $7C56
    .byte $3C ; |  XXXX  | $7C57
    .byte $00 ; |        | $7C58
  IF PAC_KONG
    .byte $0C ; |    XX  | $7C59
    .byte $88 ; |X   X   | $7C5A
    .byte $E8 ; |XXX X   | $7C5B
    .byte $28 ; |  X X   | $7C5C
    .byte $38 ; |  XXX   | $7C5D
    .byte $38 ; |  XXX   | $7C5E
    .byte $38 ; |  XXX   | $7C5F
    .byte $78 ; | XXXX   | $7C60
    .byte $FE ; |XXXXXXX | $7C61
    .byte $FE ; |XXXXXXX | $7C62
    .byte $7A ; | XXXX X | $7C63
    .byte $10 ; |   X    | $7C64
    .byte $38 ; |  XXX   | $7C65
    .byte $3C ; |  XXXX  | $7C66
    .byte $38 ; |  XXX   | $7C67
    .byte $38 ; |  XXX   | $7C68
    .byte $00 ; |        | $7C69
    .byte $30 ; |  XX    | $7C6A
    .byte $2C ; |  X XX  | $7C6B
    .byte $28 ; |  X X   | $7C6C
    .byte $28 ; |  X X   | $7C6D
    .byte $28 ; |  X X   | $7C6E
    .byte $38 ; |  XXX   | $7C6F
    .byte $7C ; | XXXXX  | $7C70
    .byte $7C ; | XXXXX  | $7C71
    .byte $78 ; | XXXX   | $7C72
    .byte $78 ; | XXXX   | $7C73
    .byte $38 ; |  XXX   | $7C74
    .byte $10 ; |   X    | $7C75
    .byte $38 ; |  XXX   | $7C76
    .byte $3C ; |  XXXX  | $7C77
    .byte $38 ; |  XXX   | $7C78
    .byte $38 ; |  XXX   | $7C79
    .byte $00 ; |        | $7C7A
    .byte $00 ; |        | $7C7B
    .byte $00 ; |        | $7C7C
    .byte $E1 ; |XXX    X| $7C7D
    .byte $3E ; |  XXXXX | $7C7E
    .byte $3C ; |  XXXX  | $7C7F
    .byte $B8 ; |X XXX   | $7C80
    .byte $F8 ; |XXXXX   | $7C81
    .byte $78 ; | XXXX   | $7C82
    .byte $3E ; |  XXXXX | $7C83
    .byte $10 ; |   X    | $7C84
    .byte $38 ; |  XXX   | $7C85
    .byte $3C ; |  XXXX  | $7C86
    .byte $38 ; |  XXX   | $7C87
    .byte $38 ; |  XXX   | $7C88
    .byte $00 ; |        | $7C89
    .byte $00 ; |        | $7C8A
    .byte $00 ; |        | $7C8B
    .byte $18 ; |   XX   | $7C8C
    .byte $50 ; | X X    | $7C8D
    .byte $7C ; | XXXXX  | $7C8E
    .byte $14 ; |   X X  | $7C8F
    .byte $14 ; |   X X  | $7C90
    .byte $38 ; |  XXX   | $7C91
    .byte $7C ; | XXXXX  | $7C92
    .byte $7C ; | XXXXX  | $7C93
    .byte $78 ; | XXXX   | $7C94
    .byte $78 ; | XXXX   | $7C95
    .byte $38 ; |  XXX   | $7C96
    .byte $10 ; |   X    | $7C97
    .byte $38 ; |  XXX   | $7C98
    .byte $3C ; |  XXXX  | $7C99
    .byte $38 ; |  XXX   | $7C9A
    .byte $38 ; |  XXX   | $7C9B
    .byte $00 ; |        | $7C9C
    .byte $00 ; |        | $7C9D
    .byte $00 ; |        | $7C9E
    .byte $82 ; |X     X | $7C9F
    .byte $7C ; | XXXXX  | $7CA0
    .byte $44 ; | X   X  | $7CA1
    .byte $82 ; |X     X | $7CA2
    .byte $28 ; |  X X   | $7CA3
    .byte $38 ; |  XXX   | $7CA4
    .byte $FC ; |XXXXXX  | $7CA5
    .byte $D6 ; |XX X XX | $7CA6
    .byte $D6 ; |XX X XX | $7CA7
    .byte $7C ; | XXXXX  | $7CA8
    .byte $38 ; |  XXX   | $7CA9
    .byte $00 ; |        | $7CAA
    .byte $00 ; |        | $7CAB
    .byte $00 ; |        | $7CAC
    .byte $00 ; |        | $7CAD
    .byte $00 ; |        | $7CAE
    .byte $00 ; |        | $7CAF
    .byte $00 ; |        | $7CB0
    .byte $00 ; |        | $7CB1
    .byte $00 ; |        | $7CB2
    .byte $10 ; |   X    | $7CB3
    .byte $7C ; | XXXXX  | $7CB4
    .byte $10 ; |   X    | $7CB5
    .byte $00 ; |        | $7CB6
    .byte $00 ; |        | $7CB7
    .byte $00 ; |        | $7CB8
    .byte $00 ; |        | $7CB9
    .byte $00 ; |        | $7CBA
    .byte $00 ; |        | $7CBB
    .byte $F0 ; |XXXX    | $7CBC
    .byte $38 ; |  XXX   | $7CBD
    .byte $1C ; |   XXX  | $7CBE
    .byte $0C ; |    XX  | $7CBF
    .byte $02 ; |      X | $7CC0
    .byte $02 ; |      X | $7CC1
    .byte $00 ; |        | $7CC2
    .byte $00 ; |        | $7CC3
    .byte $08 ; |    X   | $7CC4
    .byte $18 ; |   XX   | $7CC5
    .byte $7A ; | XXXX X | $7CC6
    .byte $D6 ; |XX X XX | $7CC7
    .byte $83 ; |X     XX| $7CC8
    .byte $01 ; |       X| $7CC9
    .byte $00 ; |        | $7CCA
    .byte $00 ; |        | $7CCB
    .byte $00 ; |        | $7CCC
    .byte $00 ; |        | $7CCD
    .byte $00 ; |        | $7CCE
    .byte $00 ; |        | $7CCF
    .byte $81 ; |X      X| $7CD0
    .byte $4A ; | X  X X | $7CD1
    .byte $7E ; | XXXXXX | $7CD2
    .byte $3C ; |  XXXX  | $7CD3
    .byte $10 ; |   X    | $7CD4
    .byte $00 ; |        | $7CD5
    .byte $00 ; |        | $7CD6
    .byte $00 ; |        | $7CD7
    .byte $00 ; |        | $7CD8
    .byte $04 ; |     X  | $7CD9
    .byte $0C ; |    XX  | $7CDA
    .byte $4C ; | X  XX  | $7CDB
    .byte $6C ; | XX XX  | $7CDC
    .byte $78 ; | XXXX   | $7CDD
    .byte $78 ; | XXXX   | $7CDE
    .byte $3E ; |  XXXXX | $7CDF
    .byte $3C ; |  XXXX  | $7CE0
    .byte $78 ; | XXXX   | $7CE1
    .byte $70 ; | XXX    | $7CE2
    .byte $90 ; |X  X    | $7CE3
    .byte $38 ; |  XXX   | $7CE4
    .byte $38 ; |  XXX   | $7CE5
    .byte $38 ; |  XXX   | $7CE6
    .byte $38 ; |  XXX   | $7CE7
    .byte $00 ; |        | $7CE8
    .byte $00 ; |        | $7CE9
    .byte $40 ; | X      | $7CEA
    .byte $60 ; | XX     | $7CEB
    .byte $64 ; | XX  X  | $7CEC
    .byte $6C ; | XX XX  | $7CED
    .byte $3C ; |  XXXX  | $7CEE
    .byte $3C ; |  XXXX  | $7CEF
    .byte $F8 ; |XXXXX   | $7CF0
    .byte $F8 ; |XXXXX   | $7CF1
    .byte $3C ; |  XXXX  | $7CF2
    .byte $1C ; |   XXX  | $7CF3
    .byte $12 ; |   X  X | $7CF4
    .byte $38 ; |  XXX   | $7CF5
    .byte $38 ; |  XXX   | $7CF6
    .byte $38 ; |  XXX   | $7CF7
    .byte $38 ; |  XXX   | $7CF8
    .byte $00 ; |        | $7CF9
  ELSE
    .byte $60 ; | XX     | $7C59
    .byte $40 ; | X      | $7C5A
    .byte $67 ; | XX  XXX| $7C5B
    .byte $25 ; |  X  X X| $7C5C
    .byte $3C ; |  XXXX  | $7C5D
    .byte $3C ; |  XXXX  | $7C5E
    .byte $3C ; |  XXXX  | $7C5F
    .byte $BC ; |X XXXX  | $7C60
    .byte $FE ; |XXXXXXX | $7C61
    .byte $E6 ; |XXX  XX | $7C62
    .byte $3B ; |  XXX XX| $7C63
    .byte $70 ; | XXX    | $7C64
    .byte $5F ; | X XXXXX| $7C65
    .byte $4E ; | X  XXX | $7C66
    .byte $FF ; |XXXXXXXX| $7C67
    .byte $7E ; | XXXXXX | $7C68
    .byte $00 ; |        | $7C69
    .byte $FC ; |XXXXXX  | $7C6A
    .byte $D8 ; |XX XX   | $7C6B
    .byte $D8 ; |XX XX   | $7C6C
    .byte $FE ; |XXXXXXX | $7C6D
    .byte $EF ; |XXX XXXX| $7C6E
    .byte $97 ; |X  X XXX| $7C6F
    .byte $77 ; | XXX XXX| $7C70
    .byte $CF ; |XX  XXXX| $7C71
    .byte $FE ; |XXXXXXX | $7C72
    .byte $FC ; |XXXXXX  | $7C73
    .byte $3E ; |  XXXXX | $7C74
    .byte $7C ; | XXXXX  | $7C75
    .byte $4F ; | X  XXXX| $7C76
    .byte $5C ; | X XXX  | $7C77
    .byte $FF ; |XXXXXXXX| $7C78
    .byte $7E ; | XXXXXX | $7C79
    .byte $00 ; |        | $7C7A
    .byte $00 ; |        | $7C7B
    .byte $00 ; |        | $7C7C
    .byte $80 ; |X       | $7C7D
    .byte $FF ; |XXXXXXXX| $7C7E
    .byte $FF ; |XXXXXXXX| $7C7F
    .byte $3D ; |  XXXX X| $7C80
    .byte $BC ; |X XXXX  | $7C81
    .byte $7F ; | XXXXXXX| $7C82
    .byte $1C ; |   XXX  | $7C83
    .byte $70 ; | XXX    | $7C84
    .byte $5F ; | X XXXXX| $7C85
    .byte $4E ; | X  XXX | $7C86
    .byte $FF ; |XXXXXXXX| $7C87
    .byte $7E ; | XXXXXX | $7C88
    .byte $00 ; |        | $7C89
    .byte $00 ; |        | $7C8A
    .byte $00 ; |        | $7C8B
    .byte $1C ; |   XXX  | $7C8C
    .byte $18 ; |   XX   | $7C8D
    .byte $18 ; |   XX   | $7C8E
    .byte $FC ; |XXXXXX  | $7C8F
    .byte $FC ; |XXXXXX  | $7C90
    .byte $38 ; |  XXX   | $7C91
    .byte $38 ; |  XXX   | $7C92
    .byte $39 ; |  XXX  X| $7C93
    .byte $3F ; |  XXXXXX| $7C94
    .byte $3E ; |  XXXXX | $7C95
    .byte $1C ; |   XXX  | $7C96
    .byte $78 ; | XXXX   | $7C97
    .byte $4F ; | X  XXXX| $7C98
    .byte $5C ; | X XXX  | $7C99
    .byte $FF ; |XXXXXXXX| $7C9A
    .byte $7E ; | XXXXXX | $7C9B
    .byte $00 ; |        | $7C9C
    .byte $00 ; |        | $7C9D
    .byte $00 ; |        | $7C9E
    .byte $38 ; |  XXX   | $7C9F
    .byte $7F ; | XXXXXXX| $7CA0
    .byte $E7 ; |XXX  XXX| $7CA1
    .byte $82 ; |X     X | $7CA2
    .byte $80 ; |X       | $7CA3
    .byte $80 ; |X       | $7CA4
    .byte $C0 ; |XX      | $7CA5
    .byte $00 ; |        | $7CA6
    .byte $7F ; | XXXXXXX| $7CA7
    .byte $3E ; |  XXXXX | $7CA8
    .byte $1C ; |   XXX  | $7CA9
    .byte $3C ; |  XXXX  | $7CAA
    .byte $78 ; | XXXX   | $7CAB
    .byte $F0 ; |XXXX    | $7CAC
    .byte $50 ; | X X    | $7CAD
    .byte $70 ; | XXX    | $7CAE
    .byte $C0 ; |XX      | $7CAF
    .byte $00 ; |        | $7CB0
    .byte $00 ; |        | $7CB1
    .byte $00 ; |        | $7CB2
    .byte $10 ; |   X    | $7CB3
    .byte $7C ; | XXXXX  | $7CB4
    .byte $10 ; |   X    | $7CB5
    .byte $00 ; |        | $7CB6
    .byte $00 ; |        | $7CB7
    .byte $00 ; |        | $7CB8
    .byte $00 ; |        | $7CB9
    .byte $00 ; |        | $7CBA
  ENDIF
  IF COMMON_INCA
    .byte $00 ; |        | $7CBB
    .byte $08 ; |    X   | $7CBC
    .byte $1C ; |   XXX  | $7CBD
    .byte $3E ; |  XXXXX | $7CBE
    .byte $7F ; | XXXXXXX| $7CBF
    .byte $7F ; | XXXXXXX| $7CC0
    .byte $3E ; |  XXXXX | $7CC1
    .byte $00 ; |        | $7CC2
    .byte $81 ; |X      X| $7CC3
    .byte $42 ; | X    X | $7CC4
    .byte $24 ; |  X  X  | $7CC5
    .byte $42 ; | X    X | $7CC6
    .byte $BD ; |X XXXX X| $7CC7
    .byte $7E ; | XXXXXX | $7CC8
    .byte $3C ; |  XXXX  | $7CC9
    .byte $18 ; |   XX   | $7CCA
    .byte $A5 ; |X X  X X| $7CCB
    .byte $42 ; | X    X | $7CCC
    .byte $00 ; |        | $7CCD
    .byte $66 ; | XX  XX | $7CCE
    .byte $81 ; |X      X| $7CCF
    .byte $BD ; |X XXXX X| $7CD0
    .byte $7E ; | XXXXXX | $7CD1
    .byte $3C ; |  XXXX  | $7CD2
    .byte $18 ; |   XX   | $7CD3
    .byte $24 ; |  X  X  | $7CD4
    .byte $24 ; |  X  X  | $7CD5
    .byte $42 ; | X    X | $7CD6
    .byte $81 ; |X      X| $7CD7
  ENDIF
  IF GOLIATH
    .byte $10 ; |   X    | $7CBB
    .byte $1E ; |   XXXX | $7CBC
    .byte $12 ; |   X  X | $7CBD
    .byte $10 ; |   X    | $7CBE
    .byte $3C ; |  XXXX  | $7CBF
    .byte $24 ; |  X  X  | $7CC0
    .byte $3C ; |  XXXX  | $7CC1
    .byte $00 ; |        | $7CC2
    .byte $55 ; | X X X X| $7CC3
    .byte $15 ; |   X X X| $7CC4
    .byte $63 ; | XX   XX| $7CC5
    .byte $46 ; | X   XX | $7CC6
    .byte $7E ; | XXXXXX | $7CC7
    .byte $FF ; |XXXXXXXX| $7CC8
    .byte $9B ; |X  XX XX| $7CC9
    .byte $FF ; |XXXXXXXX| $7CCA
    .byte $7E ; | XXXXXX | $7CCB
    .byte $3C ; |  XXXX  | $7CCC
    .byte $00 ; |        | $7CCD
    .byte $91 ; |X  X   X| $7CCE
    .byte $2A ; |  X X X | $7CCF
    .byte $66 ; | XX  XX | $7CD0
    .byte $24 ; |  X  X  | $7CD1
    .byte $7E ; | XXXXXX | $7CD2
    .byte $FF ; |XXXXXXXX| $7CD3
    .byte $D9 ; |XX XX  X| $7CD4
    .byte $FF ; |XXXXXXXX| $7CD5
    .byte $7E ; | XXXXXX | $7CD6
    .byte $3C ; |  XXXX  | $7CD7
  ENDIF
  IF INCA_GOLD
    .byte $00 ; |        | $7CD8
    .byte $38 ; |  XXX   | $7CD9
    .byte $30 ; |  XX    | $7CDA
    .byte $70 ; | XXX    | $7CDB
    .byte $7E ; | XXXXXX | $7CDC
    .byte $7F ; | XXXXXXX| $7CDD
    .byte $7F ; | XXXXXXX| $7CDE
    .byte $7F ; | XXXXXXX| $7CDF
    .byte $FE ; |XXXXXXX | $7CE0
    .byte $FE ; |XXXXXXX | $7CE1
    .byte $FF ; |XXXXXXXX| $7CE2
    .byte $7F ; | XXXXXXX| $7CE3
    .byte $7F ; | XXXXXXX| $7CE4
    .byte $6E ; | XX XXX | $7CE5
    .byte $6E ; | XX XXX | $7CE6
    .byte $02 ; |      X | $7CE7
    .byte $02 ; |      X | $7CE8
    .byte $00 ; |        | $7CE9
    .byte $1C ; |   XXX  | $7CEA
    .byte $0C ; |    XX  | $7CEB
    .byte $0E ; |    XXX | $7CEC
    .byte $7E ; | XXXXXX | $7CED
    .byte $FE ; |XXXXXXX | $7CEE
    .byte $FE ; |XXXXXXX | $7CEF
    .byte $FE ; |XXXXXXX | $7CF0
    .byte $7F ; | XXXXXXX| $7CF1
    .byte $7F ; | XXXXXXX| $7CF2
    .byte $FF ; |XXXXXXXX| $7CF3
    .byte $FE ; |XXXXXXX | $7CF4
    .byte $FE ; |XXXXXXX | $7CF5
    .byte $7C ; | XXXXX  | $7CF6
    .byte $7C ; | XXXXX  | $7CF7
    .byte $40 ; | X      | $7CF8
    .byte $40 ; | X      | $7CF9
  ENDIF
    .byte $FF ; |XXXXXXXX| $7CFA
    .byte $FF ; |XXXXXXXX| $7CFB
    .byte $FF ; |XXXXXXXX| $7CFC
    .byte $FF ; |XXXXXXXX| $7CFD
    .byte $FF ; |XXXXXXXX| $7CFE
    .byte $FF ; |XXXXXXXX| $7CFF
  IF COMMON_KONG
    .byte $00 ; |        | $7D00
    .byte $00 ; |        | $7D01
    .byte $00 ; |        | $7D02
    .byte $00 ; |        | $7D03
    .byte $00 ; |        | $7D04
    .byte $00 ; |        | $7D05
    .byte $00 ; |        | $7D06
    .byte $00 ; |        | $7D07
    .byte $00 ; |        | $7D08
    .byte $00 ; |        | $7D09
    .byte $00 ; |        | $7D0A
    .byte $00 ; |        | $7D0B
    .byte $00 ; |        | $7D0C
    .byte $00 ; |        | $7D0D
    .byte $C0 ; |XX      | $7D0E
    .byte $C0 ; |XX      | $7D0F
    .byte $00 ; |        | $7D10
    .byte $00 ; |        | $7D11
    .byte $00 ; |        | $7D12
    .byte $00 ; |        | $7D13
    .byte $00 ; |        | $7D14
    .byte $00 ; |        | $7D15
    .byte $00 ; |        | $7D16
    .byte $00 ; |        | $7D17
    .byte $00 ; |        | $7D18
    .byte $00 ; |        | $7D19
    .byte $00 ; |        | $7D1A
    .byte $00 ; |        | $7D1B
    .byte $00 ; |        | $7D1C
    .byte $00 ; |        | $7D1D
    .byte $C0 ; |XX      | $7D1E
    .byte $C0 ; |XX      | $7D1F
    .byte $00 ; |        | $7D20
    .byte $00 ; |        | $7D21
    .byte $00 ; |        | $7D22
    .byte $00 ; |        | $7D23
    .byte $00 ; |        | $7D24
    .byte $00 ; |        | $7D25
    .byte $00 ; |        | $7D26
    .byte $00 ; |        | $7D27
    .byte $00 ; |        | $7D28
    .byte $00 ; |        | $7D29
    .byte $00 ; |        | $7D2A
    .byte $00 ; |        | $7D2B
    .byte $00 ; |        | $7D2C
    .byte $00 ; |        | $7D2D
    .byte $C0 ; |XX      | $7D2E
    .byte $C0 ; |XX      | $7D2F
    .byte $00 ; |        | $7D30
    .byte $00 ; |        | $7D31
    .byte $00 ; |        | $7D32
    .byte $00 ; |        | $7D33
    .byte $00 ; |        | $7D34
    .byte $00 ; |        | $7D35
    .byte $00 ; |        | $7D36
    .byte $00 ; |        | $7D37
    .byte $00 ; |        | $7D38
    .byte $00 ; |        | $7D39
    .byte $00 ; |        | $7D3A
    .byte $00 ; |        | $7D3B
    .byte $00 ; |        | $7D3C
    .byte $00 ; |        | $7D3D
    .byte $C0 ; |XX      | $7D3E
    .byte $C0 ; |XX      | $7D3F
    .byte $00 ; |        | $7D40
    .byte $00 ; |        | $7D41
    .byte $00 ; |        | $7D42
    .byte $00 ; |        | $7D43
    .byte $00 ; |        | $7D44
    .byte $00 ; |        | $7D45
    .byte $00 ; |        | $7D46
    .byte $00 ; |        | $7D47
    .byte $00 ; |        | $7D48
    .byte $00 ; |        | $7D49
    .byte $00 ; |        | $7D4A
    .byte $00 ; |        | $7D4B
  IF GOLIATH
    .byte $40 ; | X      | $7D4C
    .byte $C0 ; |XX      | $7D4D
  ELSE
    .byte $00 ; |        | $7D4C
    .byte $80 ; |X       | $7D4D
  ENDIF
    .byte $00 ; |        | $7D4E
    .byte $00 ; |        | $7D4F
    .byte $00 ; |        | $7D50
    .byte $00 ; |        | $7D51
    .byte $00 ; |        | $7D52
    .byte $00 ; |        | $7D53
    .byte $00 ; |        | $7D54
    .byte $00 ; |        | $7D55
    .byte $00 ; |        | $7D56
    .byte $00 ; |        | $7D57
    .byte $00 ; |        | $7D58
    .byte $00 ; |        | $7D59
    .byte $00 ; |        | $7D5A
  IF GOLIATH
    .byte $C0 ; |XX      | $7D5B
    .byte $80 ; |X       | $7D5C
    .byte $CC ; |XX  XX  | $7D5D
  ELSE
    .byte $00 ; |        | $7D5B
    .byte $C0 ; |XX      | $7D5C
    .byte $C0 ; |XX      | $7D5D
  ENDIF
    .byte $00 ; |        | $7D5E
    .byte $00 ; |        | $7D5F
    .byte $00 ; |        | $7D60
    .byte $00 ; |        | $7D61
    .byte $00 ; |        | $7D62
    .byte $00 ; |        | $7D63
    .byte $00 ; |        | $7D64
    .byte $00 ; |        | $7D65
    .byte $00 ; |        | $7D66
    .byte $00 ; |        | $7D67
    .byte $00 ; |        | $7D68
    .byte $00 ; |        | $7D69
    .byte $00 ; |        | $7D6A
  IF GOLIATH
    .byte $80 ; |X       | $7D6B
    .byte $00 ; |        | $7D6C
    .byte $80 ; |X       | $7D6D
  ELSE
    .byte $00 ; |        | $7D6B
    .byte $80 ; |X       | $7D6C
    .byte $80 ; |X       | $7D6D
  ENDIF
  ELSE
    .byte $40 ; | X      | $7D00
    .byte $40 ; | X      | $7D01
    .byte $40 ; | X      | $7D02
    .byte $40 ; | X      | $7D03
    .byte $40 ; | X      | $7D04
    .byte $40 ; | X      | $7D05
    .byte $40 ; | X      | $7D06
    .byte $40 ; | X      | $7D07
    .byte $40 ; | X      | $7D08
    .byte $40 ; | X      | $7D09
    .byte $40 ; | X      | $7D0A
    .byte $40 ; | X      | $7D0B
    .byte $40 ; | X      | $7D0C
    .byte $40 ; | X      | $7D0D
    .byte $C0 ; |XX      | $7D0E
    .byte $C0 ; |XX      | $7D0F
    .byte $40 ; | X      | $7D10
    .byte $40 ; | X      | $7D11
    .byte $40 ; | X      | $7D12
    .byte $40 ; | X      | $7D13
    .byte $40 ; | X      | $7D14
    .byte $40 ; | X      | $7D15
    .byte $40 ; | X      | $7D16
    .byte $40 ; | X      | $7D17
    .byte $40 ; | X      | $7D18
    .byte $40 ; | X      | $7D19
    .byte $40 ; | X      | $7D1A
    .byte $40 ; | X      | $7D1B
    .byte $40 ; | X      | $7D1C
    .byte $40 ; | X      | $7D1D
    .byte $C0 ; |XX      | $7D1E
    .byte $C0 ; |XX      | $7D1F
    .byte $40 ; | X      | $7D20
    .byte $40 ; | X      | $7D21
    .byte $40 ; | X      | $7D22
    .byte $40 ; | X      | $7D23
    .byte $40 ; | X      | $7D24
    .byte $40 ; | X      | $7D25
    .byte $40 ; | X      | $7D26
    .byte $40 ; | X      | $7D27
    .byte $40 ; | X      | $7D28
    .byte $40 ; | X      | $7D29
    .byte $40 ; | X      | $7D2A
    .byte $40 ; | X      | $7D2B
    .byte $40 ; | X      | $7D2C
    .byte $40 ; | X      | $7D2D
    .byte $C0 ; |XX      | $7D2E
    .byte $C0 ; |XX      | $7D2F
    .byte $40 ; | X      | $7D30
    .byte $40 ; | X      | $7D31
    .byte $40 ; | X      | $7D32
    .byte $40 ; | X      | $7D33
    .byte $40 ; | X      | $7D34
    .byte $40 ; | X      | $7D35
    .byte $40 ; | X      | $7D36
    .byte $40 ; | X      | $7D37
    .byte $40 ; | X      | $7D38
    .byte $40 ; | X      | $7D39
    .byte $40 ; | X      | $7D3A
    .byte $40 ; | X      | $7D3B
    .byte $40 ; | X      | $7D3C
    .byte $40 ; | X      | $7D3D
    .byte $C0 ; |XX      | $7D3E
    .byte $C0 ; |XX      | $7D3F
    .byte $40 ; | X      | $7D40
    .byte $40 ; | X      | $7D41
    .byte $40 ; | X      | $7D42
    .byte $40 ; | X      | $7D43
    .byte $40 ; | X      | $7D44
    .byte $40 ; | X      | $7D45
    .byte $40 ; | X      | $7D46
    .byte $40 ; | X      | $7D47
    .byte $40 ; | X      | $7D48
    .byte $40 ; | X      | $7D49
    .byte $40 ; | X      | $7D4A
    .byte $40 ; | X      | $7D4B
    .byte $40 ; | X      | $7D4C
    .byte $C0 ; |XX      | $7D4D
    .byte $00 ; |        | $7D4E
    .byte $00 ; |        | $7D4F
    .byte $00 ; |        | $7D50
    .byte $00 ; |        | $7D51
    .byte $00 ; |        | $7D52
    .byte $00 ; |        | $7D53
    .byte $00 ; |        | $7D54
    .byte $00 ; |        | $7D55
    .byte $00 ; |        | $7D56
    .byte $00 ; |        | $7D57
    .byte $00 ; |        | $7D58
    .byte $00 ; |        | $7D59
    .byte $00 ; |        | $7D5A
    .byte $C0 ; |XX      | $7D5B
    .byte $80 ; |X       | $7D5C
    .byte $C0 ; |XX      | $7D5D
    .byte $00 ; |        | $7D5E
    .byte $00 ; |        | $7D5F
    .byte $00 ; |        | $7D60
    .byte $00 ; |        | $7D61
    .byte $00 ; |        | $7D62
    .byte $00 ; |        | $7D63
    .byte $00 ; |        | $7D64
    .byte $00 ; |        | $7D65
    .byte $00 ; |        | $7D66
    .byte $00 ; |        | $7D67
    .byte $00 ; |        | $7D68
    .byte $00 ; |        | $7D69
    .byte $00 ; |        | $7D6A
    .byte $80 ; |X       | $7D6B
    .byte $00 ; |        | $7D6C
    .byte $80 ; |X       | $7D6D
  ENDIF
    .byte $00 ; |        | $7D6E
    .byte $00 ; |        | $7D6F
    .byte $00 ; |        | $7D70
    .byte $00 ; |        | $7D71
    .byte $00 ; |        | $7D72
    .byte $00 ; |        | $7D73
    .byte $00 ; |        | $7D74
    .byte $00 ; |        | $7D75
    .byte $00 ; |        | $7D76
    .byte $00 ; |        | $7D77
    .byte $00 ; |        | $7D78
    .byte $00 ; |        | $7D79
    .byte $00 ; |        | $7D7A
    .byte $00 ; |        | $7D7B
    .byte $00 ; |        | $7D7C
    .byte $00 ; |        | $7D7D
    .byte $00 ; |        | $7D7E
    .byte $00 ; |        | $7D7F
    .byte $00 ; |        | $7D80
    .byte $00 ; |        | $7D81
    .byte $00 ; |        | $7D82
    .byte $00 ; |        | $7D83
    .byte $00 ; |        | $7D84
    .byte $00 ; |        | $7D85
    .byte $00 ; |        | $7D86
    .byte $00 ; |        | $7D87
    .byte $00 ; |        | $7D88
    .byte $00 ; |        | $7D89
    .byte $00 ; |        | $7D8A
    .byte $00 ; |        | $7D8B
    .byte $00 ; |        | $7D8C
    .byte $00 ; |        | $7D8D
    .byte $00 ; |        | $7D8E
    .byte $00 ; |        | $7D8F
    .byte $00 ; |        | $7D90
    .byte $00 ; |        | $7D91
    .byte $00 ; |        | $7D92
    .byte $00 ; |        | $7D93
    .byte $00 ; |        | $7D94
    .byte $00 ; |        | $7D95
    .byte $00 ; |        | $7D96
    .byte $00 ; |        | $7D97
    .byte $00 ; |        | $7D98
    .byte $00 ; |        | $7D99
    .byte $00 ; |        | $7D9A
    .byte $00 ; |        | $7D9B
L7D9C:
    LDA    #0              ; 2
    STA    $AC             ; 3
    STA    $AD             ; 3
    STA    $82             ; 3
    STA    $81             ; 3
    STA    $AE             ; 3
    STA    $AF             ; 3
    STA    $B0             ; 3
    STA    $B1             ; 3
    LDA    #1              ; 2
    STA    $83             ; 3
    JSR    L7B79           ; 6
    LDA    #$FC            ; 2
    STA    $B5             ; 3
    STA    $B8             ; 3
    LDA    #$10            ; 2
    STA    $C3             ; 3
    LDA    #$FD            ; 2
    STA    $DC             ; 3
    LDA    #$FE            ; 2
    STA    $DE             ; 3
    LDA    #$FF            ; 2
    STA    $E0             ; 3
    LDA    #$FC            ; 2
    STA    $CC             ; 3
    STA    $CE             ; 3
    LDA    #$68            ; 2
    STA    $EC             ; 3
    RTS                    ; 6

L7DD6:
    LDA    INTIM           ; 4
    BNE    L7DD6           ; 2³
    LDA    #$82            ; 2
    STA    WSYNC           ; 3
    STA    VBLANK          ; 3
;===============================
  IF PATH_ONE
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
  ENDIF
;===============================
    STA    VSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    LDA    #0              ; 2
    STA    VSYNC           ; 3
    STA    VBLANK          ; 3
    STA    COLUPF          ; 3
    LDA    #TIME_FOUR      ; 2
    STA    TIM64T          ; 4
    RTS                    ; 6
;===============================
  IF PATH_ONE
  ELSE
    .byte $FF ; |XXXXXXXX| $7DF7
    .byte $FF ; |XXXXXXXX| $7DF8
    .byte $FF ; |XXXXXXXX| $7DF9
    .byte $FF ; |XXXXXXXX| $7DFA
    .byte $FF ; |XXXXXXXX| $7DFB
    .byte $FF ; |XXXXXXXX| $7DFC
  ENDIF
;===============================

    .byte $FF ; |XXXXXXXX| $7DFD
    .byte $FF ; |XXXXXXXX| $7DFE
    .byte $FF ; |XXXXXXXX| $7DFF
;--------------------------------------------------------------------------------------------------
  IF PAC_KONG
    .byte $40 ; | X      | $7E00
    .byte $20 ; |  X     | $7E01
    .byte $40 ; | X      | $7E02
    .byte $20 ; |  X     | $7E03
    .byte $40 ; | X      | $7E04
    .byte $20 ; |  X     | $7E05
    .byte $40 ; | X      | $7E06
    .byte $20 ; |  X     | $7E07
    .byte $40 ; | X      | $7E08
    .byte $20 ; |  X     | $7E09
    .byte $40 ; | X      | $7E0A
    .byte $20 ; |  X     | $7E0B
    .byte $40 ; | X      | $7E0C
    .byte $20 ; |  X     | $7E0D
    .byte $F9 ; |XXXXX  X| $7E0E
    .byte $F9 ; |XXXXX  X| $7E0F

    .word 0,0,0,0,0,0,0  ; 14 bytes of zeros

    .byte $FC ; |XXXXXX  | $7E1E
    .byte $FC ; |XXXXXX  | $7E1F
    .byte $40 ; | X      | $7E20
    .byte $20 ; |  X     | $7E21
    .byte $40 ; | X      | $7E22
    .byte $20 ; |  X     | $7E23
    .byte $40 ; | X      | $7E24
    .byte $20 ; |  X     | $7E25
    .byte $40 ; | X      | $7E26
    .byte $20 ; |  X     | $7E27
    .byte $40 ; | X      | $7E28
    .byte $20 ; |  X     | $7E29
    .byte $40 ; | X      | $7E2A
    .byte $20 ; |  X     | $7E2B
    .byte $40 ; | X      | $7E2C
    .byte $20 ; |  X     | $7E2D
    .byte $FC ; |XXXXXX  | $7E2E
    .byte $FC ; |XXXXXX  | $7E2F

    .word 0,0,0,0,0,0,0  ; 14 bytes of zeros

    .byte $F3 ; |XXXX  XX| $7E3E
    .byte $F3 ; |XXXX  XX| $7E3F
    .byte $40 ; | X      | $7E40
    .byte $20 ; |  X     | $7E41
    .byte $40 ; | X      | $7E42
    .byte $20 ; |  X     | $7E43
    .byte $40 ; | X      | $7E44
    .byte $20 ; |  X     | $7E45
    .byte $40 ; | X      | $7E46
    .byte $20 ; |  X     | $7E47
    .byte $40 ; | X      | $7E48
    .byte $20 ; |  X     | $7E49
    .byte $40 ; | X      | $7E4A
    .byte $20 ; |  X     | $7E4B
    .byte $40 ; | X      | $7E4C
    .byte $FF ; |XXXXXXXX| $7E4D
    .byte $40 ; | X      | $7E4E
    .byte $20 ; |  X     | $7E4F
    .byte $40 ; | X      | $7E50
    .byte $20 ; |  X     | $7E51
    .byte $40 ; | X      | $7E52
    .byte $20 ; |  X     | $7E53
    .byte $40 ; | X      | $7E54
    .byte $20 ; |  X     | $7E55
    .byte $40 ; | X      | $7E56
    .byte $20 ; |  X     | $7E57
    .byte $40 ; | X      | $7E58
    .byte $20 ; |  X     | $7E59
    .byte $40 ; | X      | $7E5A
    .byte $20 ; |  X     | $7E5B
    .byte $FF ; |XXXXXXXX| $7E5C
    .byte $FF ; |XXXXXXXX| $7E5D

    .word 0,0,0,0,0,0,0  ; 14 bytes of zeros

    .byte $F3 ; |XXXX  XX| $7E6C
    .byte $F3 ; |XXXX  XX| $7E6D
    .byte $40 ; | X      | $7E6E
    .byte $20 ; |  X     | $7E6F
    .byte $40 ; | X      | $7E70
    .byte $20 ; |  X     | $7E71
    .byte $40 ; | X      | $7E72
    .byte $20 ; |  X     | $7E73
    .byte $40 ; | X      | $7E74
    .byte $20 ; |  X     | $7E75
    .byte $40 ; | X      | $7E76
    .byte $20 ; |  X     | $7E77
    .byte $40 ; | X      | $7E78
    .byte $20 ; |  X     | $7E79
    .byte $40 ; | X      | $7E7A
    .byte $20 ; |  X     | $7E7B
    .byte $FE ; |XXXXXXX | $7E7C
    .byte $FE ; |XXXXXXX | $7E7D

    .word 0,0,0,0,0,0,0  ; 14 bytes of zeros

    .byte $71 ; | XXX   X| $7E8C
    .byte $71 ; | XXX   X| $7E8D
    .byte $40 ; | X      | $7E8E
    .byte $20 ; |  X     | $7E8F
    .byte $40 ; | X      | $7E90
    .byte $20 ; |  X     | $7E91
    .byte $40 ; | X      | $7E92
    .byte $20 ; |  X     | $7E93
    .byte $40 ; | X      | $7E94
    .byte $20 ; |  X     | $7E95
    .byte $40 ; | X      | $7E96
    .byte $20 ; |  X     | $7E97
    .byte $40 ; | X      | $7E98
    .byte $20 ; |  X     | $7E99
    .byte $40 ; | X      | $7E9A
    .byte $7F ; | XXXXXXX| $7E9B
  ENDIF
;--------------------------------------------------------------------------------------------------
  IF COMMON_INCA
    .byte $60 ; | XX     | $7E00
    .byte $00 ; |        | $7E01
    .byte $60 ; | XX     | $7E02
    .byte $00 ; |        | $7E03
    .byte $60 ; | XX     | $7E04
    .byte $00 ; |        | $7E05
    .byte $60 ; | XX     | $7E06
    .byte $00 ; |        | $7E07
    .byte $60 ; | XX     | $7E08
    .byte $00 ; |        | $7E09
    .byte $60 ; | XX     | $7E0A
    .byte $00 ; |        | $7E0B
    .byte $60 ; | XX     | $7E0C
    .byte $00 ; |        | $7E0D
    .byte $F9 ; |XXXXX  X| $7E0E
    .byte $F9 ; |XXXXX  X| $7E0F

    .word 0,0,0,0,0,0,0  ; 14 bytes of zeros

    .byte $FC ; |XXXXXX  | $7E1E
    .byte $FC ; |XXXXXX  | $7E1F
    .byte $60 ; | XX     | $7E20
    .byte $00 ; |        | $7E21
    .byte $60 ; | XX     | $7E22
    .byte $00 ; |        | $7E23
    .byte $60 ; | XX     | $7E24
    .byte $00 ; |        | $7E25
    .byte $60 ; | XX     | $7E26
    .byte $00 ; |        | $7E27
    .byte $60 ; | XX     | $7E28
    .byte $00 ; |        | $7E29
    .byte $60 ; | XX     | $7E2A
    .byte $00 ; |        | $7E2B
    .byte $60 ; | XX     | $7E2C
    .byte $00 ; |        | $7E2D
    .byte $FC ; |XXXXXX  | $7E2E
    .byte $FC ; |XXXXXX  | $7E2F

    .word 0,0,0,0,0,0,0  ; 14 bytes of zeros

    .byte $F3 ; |XXXX  XX| $7E3E
    .byte $F3 ; |XXXX  XX| $7E3F
    .byte $60 ; | XX     | $7E40
    .byte $00 ; |        | $7E41
    .byte $60 ; | XX     | $7E42
    .byte $00 ; |        | $7E43
    .byte $60 ; | XX     | $7E44
    .byte $00 ; |        | $7E45
    .byte $60 ; | XX     | $7E46
    .byte $00 ; |        | $7E47
    .byte $60 ; | XX     | $7E48
    .byte $00 ; |        | $7E49
    .byte $60 ; | XX     | $7E4A
    .byte $00 ; |        | $7E4B
    .byte $60 ; | XX     | $7E4C
    .byte $FF ; |XXXXXXXX| $7E4D
    .byte $00 ; |        | $7E4E
    .byte $60 ; | XX     | $7E4F
    .byte $00 ; |        | $7E50
    .byte $60 ; | XX     | $7E51
    .byte $00 ; |        | $7E52
    .byte $60 ; | XX     | $7E53
    .byte $00 ; |        | $7E54
    .byte $60 ; | XX     | $7E55
    .byte $00 ; |        | $7E56
    .byte $60 ; | XX     | $7E57
    .byte $00 ; |        | $7E58
    .byte $60 ; | XX     | $7E59
    .byte $00 ; |        | $7E5A
    .byte $FF ; |XXXXXXXX| $7E5B
    .byte $24 ; |  X  X  | $7E5C
    .byte $FF ; |XXXXXXXX| $7E5D

    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0 ; 13 bytes of zeros

    .byte $F3 ; |XXXX  XX| $7E6B
    .byte $92 ; |X  X  X | $7E6C
    .byte $F3 ; |XXXX  XX| $7E6D
    .byte $00 ; |        | $7E6E
    .byte $60 ; | XX     | $7E6F
    .byte $00 ; |        | $7E70
    .byte $60 ; | XX     | $7E71
    .byte $00 ; |        | $7E72
    .byte $60 ; | XX     | $7E73
    .byte $00 ; |        | $7E74
    .byte $60 ; | XX     | $7E75
    .byte $00 ; |        | $7E76
    .byte $60 ; | XX     | $7E77
    .byte $00 ; |        | $7E78
    .byte $60 ; | XX     | $7E79
    .byte $00 ; |        | $7E7A
    .byte $FE ; |XXXXXXX | $7E7B
    .byte $92 ; |X  X  X | $7E7C
    .byte $FE ; |XXXXXXX | $7E7D

    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0 ; 13 bytes of zeros

    .byte $71 ; | XXX   X| $7E8B
    .byte $11 ; |   X   X| $7E8C
    .byte $71 ; | XXX   X| $7E8D
    .byte $00 ; |        | $7E8E
    .byte $60 ; | XX     | $7E8F
    .byte $00 ; |        | $7E90
    .byte $60 ; | XX     | $7E91
    .byte $00 ; |        | $7E92
    .byte $60 ; | XX     | $7E93
    .byte $00 ; |        | $7E94
    .byte $60 ; | XX     | $7E95
    .byte $00 ; |        | $7E96
    .byte $60 ; | XX     | $7E97
    .byte $00 ; |        | $7E98
    .byte $60 ; | XX     | $7E99
    .byte $00 ; |        | $7E9A
    .byte $7F ; | XXXXXXX| $7E9B
  ENDIF
;--------------------------------------------------------------------------------------------------
  IF GOLIATH
    .byte $20 ; |  X     | $7E00
    .byte $00 ; |        | $7E01
    .byte $70 ; | XXX    | $7E02
    .byte $00 ; |        | $7E03
    .byte $20 ; |  X     | $7E04
    .byte $00 ; |        | $7E05
    .byte $70 ; | XXX    | $7E06
    .byte $00 ; |        | $7E07
    .byte $20 ; |  X     | $7E08
    .byte $00 ; |        | $7E09
    .byte $70 ; | XXX    | $7E0A
    .byte $00 ; |        | $7E0B
    .byte $20 ; |  X     | $7E0C
    .byte $00 ; |        | $7E0D
    .byte $F9 ; |XXXXX  X| $7E0E
    .byte $F9 ; |XXXXX  X| $7E0F

    .word 0,0,0,0,0,0,0  ; 14 bytes of zeros

    .byte $FC ; |XXXXXX  | $7E1E
    .byte $FC ; |XXXXXX  | $7E1F
    .byte $20 ; |  X     | $7E20
    .byte $00 ; |        | $7E21
    .byte $70 ; | XXX    | $7E22
    .byte $00 ; |        | $7E23
    .byte $20 ; |  X     | $7E24
    .byte $00 ; |        | $7E25
    .byte $70 ; | XXX    | $7E26
    .byte $00 ; |        | $7E27
    .byte $20 ; |  X     | $7E28
    .byte $00 ; |        | $7E29
    .byte $70 ; | XXX    | $7E2A
    .byte $00 ; |        | $7E2B
    .byte $20 ; |  X     | $7E2C
    .byte $00 ; |        | $7E2D
    .byte $FC ; |XXXXXX  | $7E2E
    .byte $FC ; |XXXXXX  | $7E2F

    .word 0,0,0,0,0,0,0  ; 14 bytes of zeros

    .byte $F3 ; |XXXX  XX| $7E3E
    .byte $F3 ; |XXXX  XX| $7E3F
    .byte $20 ; |  X     | $7E40
    .byte $00 ; |        | $7E41
    .byte $70 ; | XXX    | $7E42
    .byte $00 ; |        | $7E43
    .byte $20 ; |  X     | $7E44
    .byte $00 ; |        | $7E45
    .byte $70 ; | XXX    | $7E46
    .byte $00 ; |        | $7E47
    .byte $20 ; |  X     | $7E48
    .byte $00 ; |        | $7E49
    .byte $70 ; | XXX    | $7E4A
    .byte $00 ; |        | $7E4B
    .byte $20 ; |  X     | $7E4C
    .byte $FF ; |XXXXXXXX| $7E4D
    .byte $00 ; |        | $7E4E
    .byte $70 ; | XXX    | $7E4F
    .byte $00 ; |        | $7E50
    .byte $20 ; |  X     | $7E51
    .byte $00 ; |        | $7E52
    .byte $70 ; | XXX    | $7E53
    .byte $00 ; |        | $7E54
    .byte $20 ; |  X     | $7E55
    .byte $00 ; |        | $7E56
    .byte $70 ; | XXX    | $7E57
    .byte $00 ; |        | $7E58
    .byte $20 ; |  X     | $7E59
    .byte $00 ; |        | $7E5A
    .byte $FF ; |XXXXXXXX| $7E5B
    .byte $24 ; |  X  X  | $7E5C
    .byte $FF ; |XXXXXXXX| $7E5D

    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0 ; 13 bytes of zeros

    .byte $F3 ; |XXXX  XX| $7E6B
    .byte $92 ; |X  X  X | $7E6C
    .byte $F3 ; |XXXX  XX| $7E6D
    .byte $00 ; |        | $7E6E
    .byte $70 ; | XXX    | $7E6F
    .byte $00 ; |        | $7E70
    .byte $20 ; |  X     | $7E71
    .byte $00 ; |        | $7E72
    .byte $70 ; | XXX    | $7E73
    .byte $00 ; |        | $7E74
    .byte $20 ; |  X     | $7E75
    .byte $00 ; |        | $7E76
    .byte $70 ; | XXX    | $7E77
    .byte $00 ; |        | $7E78
    .byte $20 ; |  X     | $7E79
    .byte $00 ; |        | $7E7A
    .byte $FE ; |XXXXXXX | $7E7B
    .byte $92 ; |X  X  X | $7E7C
    .byte $FE ; |XXXXXXX | $7E7D

    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0 ; 13 bytes of zeros

    .byte $71 ; | XXX   X| $7E8B
    .byte $11 ; |   X   X| $7E8C
    .byte $71 ; | XXX   X| $7E8D
    .byte $00 ; |        | $7E8E
    .byte $70 ; | XXX    | $7E8F
    .byte $00 ; |        | $7E90
    .byte $20 ; |  X     | $7E91
    .byte $00 ; |        | $7E92
    .byte $70 ; | XXX    | $7E93
    .byte $00 ; |        | $7E94
    .byte $20 ; |  X     | $7E95
    .byte $00 ; |        | $7E96
    .byte $70 ; | XXX    | $7E97
    .byte $00 ; |        | $7E98
    .byte $20 ; |  X     | $7E99
    .byte $00 ; |        | $7E9A
    .byte $7F ; | XXXXXXX| $7E9B
  ENDIF
;===============================

  IF PAC_KONG
L7E9C:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$13,$13,$00,$0B,$00
    .byte $0B,$0F,$0F,$13,$13,$00,$00,$00,$11,$00,$11,$00,$0D,$00,$00,$00
    .byte $0F,$00,$0F,$00,$0B,$00,$00,$00,$0B,$0B,$00,$0B,$00,$0B,$0D,$0D
    .byte $0F,$0F,$11,$11,$13,$13,$00,$00,$00,$11,$00,$11,$00,$0D,$00,$00
    .byte $00,$0F,$00,$0F,$00,$0B
  ENDIF

  IF COMMON_DATA
L7E9C:
    .byte $00,$00,$13,$13,$13,$11,$00,$11,$00,$0F,$00,$0F,$11,$13,$0F,$0C
    .byte $0C,$0F,$11,$13,$1A,$1A,$17,$1A,$00,$1A,$1D,$1F,$13,$13,$00,$13
    .byte $00,$13,$11,$0F,$00,$11,$13,$11,$0F,$0F,$11,$13,$11,$0F,$00,$0F
    .byte $00,$0F,$00,$0F,$11,$13,$1A,$1A,$17,$1A,$00,$1A,$1D,$1F,$13,$13
    .byte $00,$13,$00,$13,$11,$0F
  ENDIF

  IF GOLIATH
    RORG $7E9C
L7E9C:
    .byte $00,$13,$13,$13,$0F,$0F,$11,$11,$00,$0F,$0F,$0F,$11,$13,$1B,$13
    .byte $13,$13,$0F,$0F,$0D,$0B,$09,$09,$09,$0D,$0D,$0D,$0F,$11,$13,$0F
    .byte $0F,$0F,$0F,$0F,$0D,$0B,$09,$09,$09,$0D,$0D,$0D,$0F,$11,$13,$13
    .byte $00,$13,$13,$00,$13,$13,$0F,$11,$0F,$0F,$00,$00,$0F,$0F,$00,$00
    .byte $0F,$0F,$11,$13,$1B,$1B
    RORG $3EE2
  ENDIF

    .byte $FF ; |XXXXXXXX| $7EE2
    .byte $FF ; |XXXXXXXX| $7EE3
    .byte $FF ; |XXXXXXXX| $7EE4
    .byte $FF ; |XXXXXXXX| $7EE5
    .byte $FF ; |XXXXXXXX| $7EE6
    .byte $FF ; |XXXXXXXX| $7EE7
    .byte $FF ; |XXXXXXXX| $7EE8
    .byte $FF ; |XXXXXXXX| $7EE9
    .byte $FF ; |XXXXXXXX| $7EEA
    .byte $FF ; |XXXXXXXX| $7EEB
    .byte $FF ; |XXXXXXXX| $7EEC
    .byte $FF ; |XXXXXXXX| $7EED
    .byte $FF ; |XXXXXXXX| $7EEE
    .byte $FF ; |XXXXXXXX| $7EEF
    .byte $FF ; |XXXXXXXX| $7EF0
    .byte $FF ; |XXXXXXXX| $7EF1
    .byte $FF ; |XXXXXXXX| $7EF2
    .byte $FF ; |XXXXXXXX| $7EF3
    .byte $FF ; |XXXXXXXX| $7EF4
    .byte $FF ; |XXXXXXXX| $7EF5
    .byte $FF ; |XXXXXXXX| $7EF6
    .byte $FF ; |XXXXXXXX| $7EF7
    .byte $FF ; |XXXXXXXX| $7EF8
    .byte $FF ; |XXXXXXXX| $7EF9
    .byte $FF ; |XXXXXXXX| $7EFA
    .byte $FF ; |XXXXXXXX| $7EFB
    .byte $FF ; |XXXXXXXX| $7EFC
    .byte $FF ; |XXXXXXXX| $7EFD
    .byte $FF ; |XXXXXXXX| $7EFE
    .byte $FF ; |XXXXXXXX| $7EFF
    .byte $00 ; |        | $7F00
    .byte $00 ; |        | $7F01
    .byte $00 ; |        | $7F02
    .byte $00 ; |        | $7F03
    .byte $00 ; |        | $7F04
    .byte $00 ; |        | $7F05
    .byte $00 ; |        | $7F06
    .byte $00 ; |        | $7F07
    .byte $00 ; |        | $7F08
    .byte $00 ; |        | $7F09
    .byte $00 ; |        | $7F0A
    .byte $00 ; |        | $7F0B
    .byte $00 ; |        | $7F0C
    .byte $00 ; |        | $7F0D
    .byte $FF ; |XXXXXXXX| $7F0E
    .byte $FF ; |XXXXXXXX| $7F0F
    .byte $80 ; |X       | $7F10
    .byte $00 ; |        | $7F11
    .byte $80 ; |X       | $7F12
    .byte $00 ; |        | $7F13
    .byte $80 ; |X       | $7F14
    .byte $00 ; |        | $7F15
    .byte $80 ; |X       | $7F16
    .byte $00 ; |        | $7F17
    .byte $80 ; |X       | $7F18
    .byte $00 ; |        | $7F19
    .byte $80 ; |X       | $7F1A
    .byte $00 ; |        | $7F1B
    .byte $80 ; |X       | $7F1C
    .byte $00 ; |        | $7F1D
    .byte $FE ; |XXXXXXX | $7F1E
    .byte $FE ; |XXXXXXX | $7F1F
    .byte $00 ; |        | $7F20
    .byte $00 ; |        | $7F21
    .byte $00 ; |        | $7F22
    .byte $00 ; |        | $7F23
    .byte $00 ; |        | $7F24
    .byte $00 ; |        | $7F25
    .byte $00 ; |        | $7F26
    .byte $00 ; |        | $7F27
    .byte $00 ; |        | $7F28
    .byte $00 ; |        | $7F29
    .byte $00 ; |        | $7F2A
    .byte $00 ; |        | $7F2B
    .byte $00 ; |        | $7F2C
    .byte $00 ; |        | $7F2D
    .byte $CF ; |XX  XXXX| $7F2E
    .byte $CF ; |XX  XXXX| $7F2F
;===============================
  IF GOLIATH
    .byte $00 ; |        | $7F30
  ELSE
    .byte $80 ; |X       | $7F30
  ENDIF
;===============================
    .byte $00 ; |        | $7F31
    .byte $80 ; |X       | $7F32
    .byte $00 ; |        | $7F33
    .byte $80 ; |X       | $7F34
    .byte $00 ; |        | $7F35
    .byte $80 ; |X       | $7F36
    .byte $00 ; |        | $7F37
    .byte $80 ; |X       | $7F38
    .byte $00 ; |        | $7F39
    .byte $80 ; |X       | $7F3A
    .byte $00 ; |        | $7F3B
    .byte $80 ; |X       | $7F3C
    .byte $00 ; |        | $7F3D
    .byte $CC ; |XX  XX  | $7F3E
    .byte $CC ; |XX  XX  | $7F3F
    .byte $00 ; |        | $7F40
    .byte $00 ; |        | $7F41
    .byte $00 ; |        | $7F42
    .byte $00 ; |        | $7F43
    .byte $00 ; |        | $7F44
    .byte $00 ; |        | $7F45
    .byte $00 ; |        | $7F46
    .byte $00 ; |        | $7F47
    .byte $00 ; |        | $7F48
    .byte $00 ; |        | $7F49
    .byte $00 ; |        | $7F4A
    .byte $00 ; |        | $7F4B
    .byte $00 ; |        | $7F4C
    .byte $FF ; |XXXXXXXX| $7F4D
    .byte $00 ; |        | $7F4E
    .byte $00 ; |        | $7F4F
    .byte $00 ; |        | $7F50
    .byte $00 ; |        | $7F51
    .byte $00 ; |        | $7F52
    .byte $00 ; |        | $7F53
    .byte $00 ; |        | $7F54
    .byte $00 ; |        | $7F55
    .byte $00 ; |        | $7F56
    .byte $00 ; |        | $7F57
    .byte $00 ; |        | $7F58
    .byte $00 ; |        | $7F59
    .byte $00 ; |        | $7F5A
;===============================
  IF PAC_KONG
    .byte $00 ; |        | $7F5B
    .byte $F9 ; |XXXXX  X| $7F5C
    .byte $F9 ; |XXXXX  X| $7F5D
  ELSE
    .byte $F9 ; |XXXXX  X| $7F5B
    .byte $49 ; | X  X  X| $7F5C
    .byte $F9 ; |XXXXX  X| $7F5D
  ENDIF
;===============================
    .byte $00 ; |        | $7F5E
    .byte $80 ; |X       | $7F5F
    .byte $00 ; |        | $7F60
    .byte $80 ; |X       | $7F61
    .byte $00 ; |        | $7F62
    .byte $80 ; |X       | $7F63
    .byte $00 ; |        | $7F64
    .byte $80 ; |X       | $7F65
    .byte $00 ; |        | $7F66
    .byte $80 ; |X       | $7F67
    .byte $00 ; |        | $7F68
    .byte $80 ; |X       | $7F69
    .byte $00 ; |        | $7F6A
;===============================
  IF PAC_KONG
    .byte $00 ; |        | $7F6B
    .byte $F3 ; |XXXX  XX| $7F6C
    .byte $F3 ; |XXXX  XX| $7F6D
  ELSE
    .byte $F3 ; |XXXX  XX| $7F6B
    .byte $92 ; |X  X  X | $7F6C
    .byte $F3 ; |XXXX  XX| $7F6D
  ENDIF
;===============================
    .byte $00 ; |        | $7F6E
    .byte $00 ; |        | $7F6F
    .byte $00 ; |        | $7F70
    .byte $00 ; |        | $7F71
    .byte $00 ; |        | $7F72
    .byte $00 ; |        | $7F73
    .byte $00 ; |        | $7F74
    .byte $00 ; |        | $7F75
    .byte $00 ; |        | $7F76
    .byte $00 ; |        | $7F77
    .byte $00 ; |        | $7F78
    .byte $00 ; |        | $7F79
    .byte $00 ; |        | $7F7A
;===============================
  IF PAC_KONG
    .byte $00 ; |        | $7F7B
    .byte $CC ; |XX  XX  | $7F7C
    .byte $CC ; |XX  XX  | $7F7D
  ELSE
    .byte $CC ; |XX  XX  | $7F7B
    .byte $4C ; | X  XX  | $7F7C
    .byte $CC ; |XX  XX  | $7F7D
  ENDIF
;===============================
    .byte $00 ; |        | $7F7E
    .byte $80 ; |X       | $7F7F
    .byte $00 ; |        | $7F80
    .byte $80 ; |X       | $7F81
    .byte $00 ; |        | $7F82
    .byte $80 ; |X       | $7F83
    .byte $00 ; |        | $7F84
    .byte $80 ; |X       | $7F85
    .byte $00 ; |        | $7F86
    .byte $80 ; |X       | $7F87
    .byte $00 ; |        | $7F88
    .byte $80 ; |X       | $7F89
    .byte $00 ; |        | $7F8A
;===============================
  IF PAC_KONG
    .byte $00 ; |        | $7F8B
    .byte $C7 ; |XX   XXX| $7F8C
    .byte $C7 ; |XX   XXX| $7F8D
  ELSE
    .byte $C7 ; |XX   XXX| $7F8B
    .byte $44 ; | X   X  | $7F8C
    .byte $C7 ; |XX   XXX| $7F8D
  ENDIF
;===============================
    .byte $00 ; |        | $7F8E
    .byte $00 ; |        | $7F8F
    .byte $00 ; |        | $7F90
    .byte $00 ; |        | $7F91
    .byte $00 ; |        | $7F92
    .byte $00 ; |        | $7F93
    .byte $00 ; |        | $7F94
    .byte $00 ; |        | $7F95
    .byte $00 ; |        | $7F96
    .byte $00 ; |        | $7F97
    .byte $00 ; |        | $7F98
    .byte $00 ; |        | $7F99
    .byte $00 ; |        | $7F9A
    .byte $FF ; |XXXXXXXX| $7F9B
;==================================================================================================
;        LOGOS
;==================================================================================================
  IF FUNVISION_LOGO
LogoOne:
    .byte $00 ; |        | $7F9C
    .byte $9D ; |X  XXX X| $7F9D
    .byte $95 ; |X  X X X| $7F9E
    .byte $95 ; |X  X X X| $7F9F
    .byte $F5 ; |XXXX X X| $7FA0
    .byte $95 ; |X  X X X| $7FA1
    .byte $80 ; |X       | $7FA2
    .byte $E0 ; |XXX     | $7FA3
LogoTwo:
    .byte $00 ; |        | $7FA4
    .byte $28 ; |  X X   | $7FA5
    .byte $6C ; | XX XX  | $7FA6
    .byte $EE ; |XXX XXX | $7FA7
    .byte $AA ; |X X X X | $7FA8
    .byte $29 ; |  X X  X| $7FA9
    .byte $00 ; |        | $7FAA
    .byte $00 ; |        | $7FAB
LogoThree:
    .byte $00 ; |        | $7FAC
    .byte $BA ; |X XXX X | $7FAD
    .byte $8A ; |X   X X | $7FAE
    .byte $BA ; |X XXX X | $7FAF
    .byte $A2 ; |X X   X | $7FB0
    .byte $38 ; |  XXX   | $7FB1
    .byte $82 ; |X     X | $7FB2
    .byte $00 ; |        | $7FB3
LogoFour:
    .byte $00 ; |        | $7FB4
    .byte $E9 ; |XXX X  X| $7FB5
    .byte $AB ; |X X X XX| $7FB6
    .byte $AF ; |X X XXXX| $7FB7
    .byte $AD ; |X X XX X| $7FB8
    .byte $E9 ; |XXX X  X| $7FB9
    .byte $00 ; |        | $7FBA
    .byte $00 ; |        | $7FBB
  ENDIF

  IF CROSSOVER_LOGO
LogoOne:
    .byte $00 ; |        | $7F9C
    .byte $AE ; |X X XXX | $7F9D
    .byte $A0 ; |X X     | $7F9E
    .byte $BE ; |X XXXXX | $7F9F
    .byte $A0 ; |X X     | $7FA0
    .byte $BA ; |X XXX X | $7FA1
    .byte $8A ; |X   X X | $7FA2
    .byte $EA ; |XXX X X | $7FA3
LogoTwo:
    .byte $00 ; |        | $7FA4
    .byte $7B ; | XXXX XX| $7FA5
    .byte $4A ; | X  X X | $7FA6
    .byte $4A ; | X  X X | $7FA7
    .byte $5B ; | X XX XX| $7FA8
    .byte $40 ; | X      | $7FA9
    .byte $40 ; | X      | $7FAA
    .byte $78 ; | XXXX   | $7FAB
LogoThree:
    .byte $00 ; |        | $7FAC
    .byte $AB ; |X X X XX| $7FAD
    .byte $AA ; |X X X X | $7FAE
    .byte $A9 ; |X X X  X| $7FAF
    .byte $AB ; |X X X XX| $7FB0
    .byte $20 ; |  X     | $7FB1
    .byte $28 ; |  X X   | $7FB2
    .byte $20 ; |  X     | $7FB3
LogoFour:
    .byte $00 ; |        | $7FB4
    .byte $B5 ; |X XX X X| $7FB5
    .byte $A5 ; |X X  X X| $7FB6
    .byte $A5 ; |X X  X X| $7FB7
    .byte $A7 ; |X X  XXX| $7FB8
    .byte $24 ; |  X  X  | $7FB9
    .byte $74 ; | XXX X  | $7FBA
    .byte $24 ; |  X  X  | $7FBB
  ENDIF

  IF GOLIATH_LOGO
    RORG $7F9C
LogoOne:
    .byte $00 ; |        | $7F9C
    .byte $71 ; | XXX   X| $7F9D
    .byte $8A ; |X   X X | $7F9E
    .byte $8A ; |X   X X | $7F9F
    .byte $B2 ; |X XX  X | $7FA0
    .byte $82 ; |X     X | $7FA1
    .byte $82 ; |X     X | $7FA2
    .byte $71 ; | XXX   X| $7FA3
LogoTwo:
    .byte $00 ; |        | $7FA4
    .byte $9E ; |X  XXXX | $7FA5
    .byte $50 ; | X X    | $7FA6
    .byte $50 ; | X X    | $7FA7
    .byte $50 ; | X X    | $7FA8
    .byte $50 ; | X X    | $7FA9
    .byte $50 ; | X X    | $7FAA
    .byte $90 ; |X  X    | $7FAB
LogoThree:
    .byte $00 ; |        | $7FAC
    .byte $A4 ; |X X  X  | $7FAD
    .byte $A4 ; |X X  X  | $7FAE
    .byte $A4 ; |X X  X  | $7FAF
    .byte $BC ; |X XXXX  | $7FB0
    .byte $A4 ; |X X  X  | $7FB1
    .byte $A4 ; |X X  X  | $7FB2
    .byte $9B ; |X  XX XX| $7FB3
LogoFour:
    .byte $00 ; |        | $7FB4
    .byte $89 ; |X   X  X| $7FB5
    .byte $89 ; |X   X  X| $7FB6
    .byte $89 ; |X   X  X| $7FB7
    .byte $8F ; |X   XXXX| $7FB8
    .byte $89 ; |X   X  X| $7FB9
    .byte $89 ; |X   X  X| $7FBA
    .byte $E9 ; |XXX X  X| $7FBB
    RORG $3FBC
  ENDIF

  IF PAC_KONG_LOGO
LogoOne:
    .byte $00 ; |        | $7F9C
    .byte $00 ; |        | $7F9D
    .byte $8D ; |X   XX X| $7F9E
    .byte $8A ; |X   X X | $7F9F
    .byte $EA ; |XXX X X | $7FA0
    .byte $AE ; |X X XXX | $7FA1
    .byte $E0 ; |XXX     | $7FA2
    .byte $00 ; |        | $7FA3
LogoTwo:
    .byte $00 ; |        | $7FA4
    .byte $00 ; |        | $7FA5
    .byte $31 ; |  XX   X| $7FA6
    .byte $41 ; | X     X| $7FA7
    .byte $41 ; | X     X| $7FA8
    .byte $31 ; |  XX   X| $7FA9
    .byte $01 ; |       X| $7FAA
    .byte $00 ; |        | $7FAB
LogoThree:
    .byte $00 ; |        | $7FAC
    .byte $00 ; |        | $7FAD
    .byte $24 ; |  X  X  | $7FAE
    .byte $4A ; | X  X X | $7FAF
    .byte $8A ; |X   X X | $7FB0
    .byte $44 ; | X   X  | $7FB1
    .byte $20 ; |  X     | $7FB2
    .byte $00 ; |        | $7FB3
LogoFour:
    .byte $00 ; |        | $7FB4
    .byte $0E ; |    XXX | $7FB5
    .byte $A2 ; |X X   X | $7FB6
    .byte $AE ; |X X XXX | $7FB7
    .byte $AA ; |X X X X | $7FB8
    .byte $EE ; |XXX XXX | $7FB9
    .byte $00 ; |        | $7FBA
    .byte $00 ; |        | $7FBB
  ENDIF

  IF ERASED_LOGO
LogoOne:
    .byte $00 ; |        | $7F9C
    .byte $00 ; |        | $7F9D
    .byte $00 ; |        | $7F9E
    .byte $00 ; |        | $7F9F
    .byte $00 ; |        | $7FA0
    .byte $00 ; |        | $7FA1
    .byte $00 ; |        | $7FA2
    .byte $00 ; |        | $7FA3
LogoTwo:
    .byte $00 ; |        | $7FA4
    .byte $00 ; |        | $7FA5
    .byte $00 ; |        | $7FA6
    .byte $00 ; |        | $7FA7
    .byte $00 ; |        | $7FA8
    .byte $00 ; |        | $7FA9
    .byte $00 ; |        | $7FAA
    .byte $00 ; |        | $7FAB
LogoThree:
    .byte $00 ; |        | $7FAC
    .byte $00 ; |        | $7FAD
    .byte $00 ; |        | $7FAE
    .byte $00 ; |        | $7FAF
    .byte $00 ; |        | $7FB0
    .byte $00 ; |        | $7FB1
    .byte $00 ; |        | $7FB2
    .byte $00 ; |        | $7FB3
LogoFour:
    .byte $00 ; |        | $7FB4
    .byte $00 ; |        | $7FB5
    .byte $00 ; |        | $7FB6
    .byte $00 ; |        | $7FB7
    .byte $00 ; |        | $7FB8
    .byte $00 ; |        | $7FB9
    .byte $00 ; |        | $7FBA
    .byte $00 ; |        | $7FBB
  ENDIF
;==================================================================================================

L7FBC:
    DEC    $E9             ; 5
    DEC    $E9             ; 5
    DEC    $E9             ; 5
    DEC    $E9             ; 5
    DEC    $E9             ; 5
    LDA    $E9             ; 3
    CMP    #$80            ; 2
    BCC    L7FCE           ; 2³
    LDA    #0              ; 2
L7FCE:
    STA    AUDV0           ; 3
    STA    $E9             ; 3
    RTS                    ; 6



L7FD3:

    LDA    #0              ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    STA    ENABL           ; 3
    RTS                    ; 6

    .byte $FF ; |XXXXXXXX| $7FE4
    .byte $FF ; |XXXXXXXX| $7FE5
    .byte $FF ; |XXXXXXXX| $7FE6
    .byte $FF ; |XXXXXXXX| $7FE7
    .byte $FF ; |XXXXXXXX| $7FE8
    .byte $FF ; |XXXXXXXX| $7FE9
    .byte $FF ; |XXXXXXXX| $7FEA
    .byte $FF ; |XXXXXXXX| $7FEB
    .byte $FF ; |XXXXXXXX| $7FEC
    .byte $FF ; |XXXXXXXX| $7FED
    .byte $FF ; |XXXXXXXX| $7FEE
    .byte $FF ; |XXXXXXXX| $7FEF
    .byte $FF ; |XXXXXXXX| $7FF0
    .byte $FF ; |XXXXXXXX| $7FF1
    .byte $FF ; |XXXXXXXX| $7FF2
    .byte $FF ; |XXXXXXXX| $7FF3
    .byte $FF ; |XXXXXXXX| $7FF4
    .byte $FF ; |XXXXXXXX| $7FF5
    .byte $FF ; |XXXXXXXX| $7FF6
    .byte $FF ; |XXXXXXXX| $7FF7
    .byte $FF ; |XXXXXXXX| $7FF8
    .byte $FF ; |XXXXXXXX| $7FF9
    .byte $FF ; |XXXXXXXX| $7FFA
  IF GOLIATH
    ORG $3FFC
  ELSE
    ORG $7FFC
  ENDIF

    .byte $00,$F0,$00,$F0  ;
