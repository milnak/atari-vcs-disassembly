; Dissasembly of Karate
; Disassembled By Omegamatrix
; Using DiStella v3.0
;
;
; .cfg contents:
;
;      ORG F000
;      CODE F000 FB2C
;      GFX FB2D FBF2
;      CODE FBF3 FC2F
;      GFX FC30 FC9F
;      CODE FCA0 FCC4
;      GFX FCC5 FD7B
;      CODE FD7C FDFE
;      DATA FDFF FDFF
;      CODE FE00 FE83
;      GFX FE84 FEA3
;      CODE FEA4 FFF0
;      GFX FFF1 FFFF

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
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
HMP0    =  $20
HMP1    =  $21
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;==================================================================================================
;              SWITCHES
;==================================================================================================
; only one on at a time!
; 0 = off, 1 = on

FUNVISION       = 0
FROGGO          = 1
PAL_UNKNOWN     = 0

;==================================================================================================
;              USER CONSTANTS
;==================================================================================================

  IF FUNVISION
TIME_ONE        = $3D
TIME_TWO        = $30
TIME_THREE      = $38
UNK_01          = $20
UNK_02          = $A6
UNK_03          = $32
UNK_04          = $B2
GREEN           = $78
RED             = $86  ; looks maroon
COL_01          = $D8
COL_02          = $A8
COL_03          = $2C
COL_04          = $AC
LFE84           = $FE84

  ELSE

TIME_THREE      = $1D
UNK_01          = $22
UNK_02          = $FC
UNK_03          = $B8
UNK_04          = $69
GREEN           = $CA
RED             = $36  ; looks tan
COL_01          = $35
COL_02          = $2C
COL_03          = $1C
COL_04          = $4C
LogoOne         = $FE7C  ; logo is blank though
LogoTwo         = $FE84  ; logo is blank though
LogoThree       = $FE8C  ; logo is blank though
LogoFour        = $FE94  ; logo is blank though
  ENDIF

  IF FROGGO
TIME_ONE        = $1D
TIME_TWO        = $1B
  ENDIF

  IF PAL_UNKNOWN
TIME_ONE        = $51
TIME_TWO        = $43
  ENDIF

WHITE           = $0E
BLACK           = $00
ORANGE          = $2C


;==================================================================================================
;              MAIN PROGRAM
;==================================================================================================

    ORG $F000

START:
    CLD                    ;
    LDX    #0              ;
    LDA    #0              ;
.loopClear:
    STA    VSYNC,X         ;
    TXS                    ;
    INX                    ;
    BNE    .loopClear      ;
    JSR    StartMusic      ;
LF00E:
    LDA    #0              ; 2
    STA    $C3             ; 3
LF012:
    LDA    #TIME_ONE       ; 2
    STA    TIM64T          ; 4
    LDA    #$0E            ; 2
    STA    $CC             ; 3
    STA    $CD             ; 3
    LDA    #0              ; 2
    STA    VSYNC           ; 3
    STA    $C8             ; 3
    STA    $C2             ; 3
    STA    $C5             ; 3
    LDA    #$30            ; 2
    STA    $84             ; 3
    STA    $86             ; 3
    LDA    #$FC            ; 2
    STA    $85             ; 3
    STA    $87             ; 3
    LDA    #UNK_01         ; 2
    STA    $D6             ; 3
    LDA    #$60            ; 2
    STA    $B4             ; 3
    LDA    #4              ; 2
    STA    $CB             ; 3
LF03F:
    LDA    #0              ; 2
    STA    $A2             ; 3
    STA    $A4             ; 3
    STA    $A5             ; 3
    STA    $A3             ; 3
    STA    $A6             ; 3
    STA    $AB             ; 3
    STA    $AC             ; 3
    STA    $91             ; 3
    STA    $92             ; 3
    STA    $93             ; 3
    STA    $AE             ; 3
    STA    $AF             ; 3
    STA    $B0             ; 3
    STA    $B1             ; 3
    STA    $A7             ; 3
    LDA    #$FD            ; 2
    STA    $B8             ; 3
    STA    $BA             ; 3
    STA    $BC             ; 3
    LDA    #2              ; 2
    STA    $BE             ; 3
    LDA    #6              ; 2
    STA    $C1             ; 3
    LDA    #1              ; 2
    STA    $BF             ; 3
    LDA    #$60            ; 2
    STA    $C9             ; 3
    LDA    #$FC            ; 2
    STA    $CA             ; 3
    LDA    #$FF            ; 2
    STA    $81             ; 3
    LDA    #$12            ; 2
    STA    $8F             ; 3
    LDA    #$48            ; 2
    STA    $88             ; 3
    LDA    #$9C            ; 2
    STA    $89             ; 3
    LDA    #$31            ; 2
    STA    $8C             ; 3
    LDA    #$9E            ; 2
    STA    $8D             ; 3
    LDA    #0              ; 2
    JSR    LF865           ; 6
LF098:
    JSR    LF59B           ; 6
    LDA    #0              ; 2
    STA    REFP0           ; 3
    STA    REFP1           ; 3
    JSR    LF5BA           ; 6
    LDA.w  $CB             ; 4
    CMP    #4              ; 2
    BEQ    LF0B1           ; 2³
    JSR    LFA3B           ; 6
    JMP    LF0B4           ; 3

LF0B1:
    JSR    LFAB4           ; 6
LF0B4:
    LDA    #$25            ; 2
    STA    NUSIZ1          ; 3
    LDA    #$25            ; 2
    STA    NUSIZ0          ; 3
    LDA    #$C7            ; 2
    AND    $81             ; 3
    STA    COLUPF          ; 3
    LDA    #$62            ; 2
    STA    COLUP0          ; 3
    LDA    #$35            ; 2
    STA    COLUP1          ; 3
    LDA    $88             ; 3
    LDX    #0              ; 2
    JSR    LFE00           ; 6
    LDA    $8C             ; 3
    LDX    #1              ; 2
    JSR    LFE00           ; 6
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    $A7             ; 3
    STA    REFP0           ; 3
    EOR    #$08            ; 2
    STA    REFP1           ; 3
    LDA    #1              ; 2
    STA    CTRLPF          ; 3
    LDA    #0              ; 2
    STA    $83             ; 3
    LDA.w  $CB             ; 4
    CMP    #4              ; 2
    BEQ    LF0F3           ; 2³
LF0F3:
    LDX    #0              ; 2
    STX    $8A             ; 3
    STX    $8B             ; 3
    LDA    #1              ; 2
    STA    CTRLPF          ; 3
    LDA    #$78            ; 2
    STA    COLUPF          ; 3
    STA    HMCLR           ; 3
    LDX    #$17            ; 2
LF105:
    LDA    $82             ; 3
    CMP    $89             ; 3
    BNE    LF10D           ; 2³
    STX    $8A             ; 3
LF10D:
    LDY    $8A             ; 3
    BEQ    LF113           ; 2³
    DEC    $8A             ; 5
LF113:
    LDA    ($84),Y         ; 5
    STA    GRP0            ; 3
    LDA    $82             ; 3
    CMP    #$A0            ; 2
    BCC    LF128           ; 2³
    LDA    #1              ; 2
    STA    $A8             ; 3
    LDA    #4              ; 2
    STA    $A9             ; 3
    JMP    LF14D           ; 3
LF128:
    LDA    #UNK_02         ; 2
    STA    COLUPF          ; 3
    DEC.w  $A8             ; 6
    BNE    LF14D           ; 2³
    LDA    #0              ; 2
    STA    PF0             ; 3
    LDY.w  $A9             ; 4
    BEQ    LF13F           ; 2³
    LDA    #$FF            ; 2
    JMP    LF141           ; 3
LF13F:
    INC    $A9             ; 5
LF141:
    STA    PF1             ; 3
    STA    PF2             ; 3
    DEC    $A9             ; 5
    STA    WSYNC           ; 3
    LDA    #6              ; 2
    STA    $A8             ; 3
LF14D:
    DEC    $82             ; 5
    LDA    $8B             ; 3
    CMP    #$0C            ; 2
    BEQ    LF15A           ; 2³
    LDA    #UNK_03         ; 2
    JMP    LF15C           ; 3
LF15A:
    LDA    $CD             ; 3
LF15C:
    STA    COLUP1          ; 3
    STA    WSYNC           ; 3
    DEC    $82             ; 5
    LDA    $82             ; 3
    CMP    $8D             ; 3
    BNE    LF16A           ; 2³
    STX    $8B             ; 3
LF16A:
    LDY    $8B             ; 3
    BEQ    LF170           ; 2³
    DEC    $8B             ; 5
LF170:
    LDA    ($86),Y         ; 5
    STA    GRP1            ; 3
    STA    WSYNC           ; 3
    LDA    #$B4            ; 2
    CMP.w  $82             ; 4
    BCC    LF181           ; 2³
    LDA    $D6             ; 3
    STA    COLUBK          ; 3
LF181:
    LDA    $8A             ; 3
    CMP    #$0C            ; 2
    BEQ    LF18C           ; 2³
    LDA    #UNK_04         ; 2
    JMP    LF18E           ; 3
LF18C:
    LDA    $CC             ; 3
LF18E:
    STA    COLUP0          ; 3
    STA    WSYNC           ; 3
    DEC    $82             ; 5
    DEC    $82             ; 5
    LDA    $82             ; 3
    CMP    #$35            ; 2
    BCC    LF19F           ; 2³
    JMP    LF105           ; 3
LF19F:
    JSR    LFE2A           ; 6
    LDA    #0              ; 2
    STA    COLUBK          ; 3
    LDA    #TIME_TWO       ; 2
    STA    TIM64T          ; 4
    LDA    $B4             ; 3
    BEQ    LF22A           ; 2³+1
    JSR    LFCA0           ; 6
    JSR    LFBF3           ; 6
    JSR    LFC16           ; 6
    DEC    $B4             ; 5
    BEQ    LF22D           ; 2³+1
    LDA    $B4             ; 3
    AND    #$08            ; 2
    CMP    #8              ; 2
    BNE    LF211           ; 2³+1
    LDA    $C8             ; 3
    CMP    #6              ; 2
    BNE    LF211           ; 2³+1
    LDA    $B4             ; 3
    STA    $D6             ; 3
    LDA    $D5             ; 3
    CMP    #0              ; 2
    BNE    LF1F4           ; 2³
    INC    $D4             ; 5
    LDA    $D4             ; 3
    AND    #$01            ; 2
    CMP    #0              ; 2
    BEQ    LF1E9           ; 2³
    DEC    $8D             ; 5
    DEC    $8D             ; 5
    DEC    $8D             ; 5
    DEC    $8D             ; 5
    JMP    LF211           ; 3
LF1E9:
    INC    $8D             ; 5
    INC    $8D             ; 5
    INC    $8D             ; 5
    INC    $8D             ; 5
    JMP    LF211           ; 3
LF1F4:
    INC    $D5             ; 5
    LDA    $D5             ; 3
    AND    #$01            ; 2
    CMP    #0              ; 2
    BEQ    LF209           ; 2³
    DEC    $89             ; 5
    DEC    $89             ; 5
    DEC    $89             ; 5
    DEC    $89             ; 5
    JMP    LF211           ; 3
LF209:
    INC    $89             ; 5
    INC    $89             ; 5
    INC    $89             ; 5
    INC    $89             ; 5
LF211:
    LDA.w  $CE             ; 4
    BNE    LF21A           ; 2³
    LDA    #5              ; 2
    STA    $CE             ; 3
LF21A:
    DEC    $CE             ; 5
    LDA.w  $CE             ; 4
    CMP    #4              ; 2
    BEQ    LF230           ; 2³
    CMP    #2              ; 2
    BEQ    LF263           ; 2³
    JMP    LF098           ; 3
LF22A:
    JMP    LF291           ; 3
LF22D:
    JMP    LF27A           ; 3
LF230:
    LDA.w  $D1             ; 4
    CMP    #5              ; 2
    BEQ    LF24D           ; 2³
    LDA.w  $D0             ; 4
    CMP    #4              ; 2
    BCS    LF244           ; 2³
    LDA    #5              ; 2
    STA    $D0             ; 3
    STA    $D1             ; 3
LF244:
    DEC    $D0             ; 5
    LDA    $D0             ; 3
    STA    AUDF0           ; 3
    JMP    LF098           ; 3
LF24D:
    LDA.w  $D0             ; 4
    CMP    #8              ; 2
    BCC    LF25A           ; 2³
    LDA    #7              ; 2
    STA    $D0             ; 3
    STA    $D1             ; 3
LF25A:
    INC    $D0             ; 5
    LDA    $D0             ; 3
    STA    AUDF0           ; 3
    JMP    LF098           ; 3
LF263:
    LDA.w  $CF             ; 4
    CMP    #$0C            ; 2
    BCS    .decreaseVolume ; 2³
    LDA    #$0F            ; 2
    STA    $CF             ; 3
    STA    AUDV1           ; 3
.decreaseVolume:
    DEC    $CF             ; 5
    LDA.w  $CF             ; 4
    STA    AUDV1           ; 3
    JMP    LF098           ; 3
LF27A:
    LDA    #$FB            ; 2
    STA    $85             ; 3
    STA    $86             ; 3
    LDA    #$48            ; 2
    STA    $84             ; 3
    STA    $86             ; 3
    LDA    #0              ; 2
    STA    $CB             ; 3
    STA    AUDC0           ; 3
    STA    AUDC1           ; 3
LF28E:
    JMP    LF098           ; 3
LF291:
    LDA    $C8             ; 3
    CMP    #6              ; 2
    BNE    LF29A           ; 2³
    JMP    START           ; 3
LF29A:
    LDA    $A6             ; 3
    BEQ    LF2C3           ; 2³
    DEC    $A6             ; 5
    BEQ    LF2C0           ; 2³
    LDA    $A6             ; 3
    CMP    #6              ; 2
    BNE    LF2B1           ; 2³
    JSR    LF939           ; 6
    JSR    LFAF7           ; 6
    JMP    LF2BA           ; 3
LF2B1:
    LDA    $A6             ; 3
    CMP    #5              ; 2
    BNE    LF2BA           ; 2³
    JSR    LFA8F           ; 6
LF2BA:
    JSR    LFCA0           ; 6
    JMP    LF57C           ; 3
LF2C0:
    JMP    LF668           ; 3
LF2C3:
    LDA    #7              ; 2
    STA    $A6             ; 3
    LDA    $C3             ; 3
    CMP    #7              ; 2
    BEQ    LF2D3           ; 2³
    JSR    LFCA0           ; 6
    JMP    LF28E           ; 3
LF2D3:
    LDA.w  $84             ; 4
    CMP    #$30            ; 2
    BEQ    LF2E1           ; 2³
    CMP    #$48            ; 2
    BEQ    LF2E1           ; 2³
    JMP    LF2E8           ; 3
LF2E1:
    LDA.w  $0C             ; 4
    AND    #$80            ; 2
    BNE    LF2EE           ; 2³
LF2E8:
    JSR    LF49B           ; 6
    JMP    LF2F1           ; 3
LF2EE:
    JSR    LF436           ; 6
LF2F1:
    JSR    LFCA0           ; 6
    LDA    $C4             ; 3
    CMP    #2              ; 2
    BNE    LF31B           ; 2³+1
    LDA.w  $86             ; 4
    CMP    #$30            ; 2
    BEQ    LF308           ; 2³
    CMP    #$48            ; 2
    BEQ    LF308           ; 2³
    JMP    LF30F           ; 3
LF308:
    LDA.w  $0D             ; 4
    AND    #$80            ; 2
    BNE    LF315           ; 2³
LF30F:
    JSR    LF4A3           ; 6
    JMP    LF57C           ; 3
LF315:
    JSR    LF453           ; 6
    JMP    LF57C           ; 3
LF31B:
    LDA    $86             ; 3
    CMP    #$30            ; 2
    BEQ    LF33B           ; 2³
    CMP    #$48            ; 2
    BEQ    LF33B           ; 2³
    LDA    $A3             ; 3
    STA    $A2             ; 3
    STA    $A5             ; 3
    BEQ    LF331           ; 2³
    DEC    $A3             ; 5
    BEQ    LF338           ; 2³
LF331:
    LDA    $86             ; 3
    JSR    LF528           ; 6
    STA    $86             ; 3
LF338:
    JMP    LF57C           ; 3
LF33B:
    LDA    $D2             ; 3
    CMP    #2              ; 2
    BCC    LF34C           ; 2³
    CMP    #4              ; 2
    BCC    LF354           ; 2³
    LDA    #0              ; 2
    STA    $D2             ; 3
    JMP    LF3EE           ; 3
LF34C:
    JSR    LF846           ; 6
    CMP    #$0B            ; 2
    JMP    LF359           ; 3
LF354:
    JSR    LF846           ; 6
    CMP    #$0E            ; 2
LF359:
    BCC    LF391           ; 2³
    JSR    LF3D6           ; 6
    BCS    LF378           ; 2³
    JMP    LF3C0           ; 3
LF363:
    JSR    LF37B           ; 6
    BCS    LF370           ; 2³
LF368:
    LDA    #$FF            ; 2
    JSR    LF487           ; 6
    JMP    LF3CF           ; 3
LF370:
    LDA    #$FF            ; 2
    JSR    LF492           ; 6
    JMP    LF3CF           ; 3
LF378:
    JMP    LF3C9           ; 3

LF37B SUBROUTINE
    LDA    $86             ; 3
    JSR    LF4AB           ; 6
    STA    $86             ; 3
    JSR    LF38A           ; 6
    LDX    $8C             ; 3
    LDY    $8D             ; 3
    RTS                    ; 6

LF38A SUBROUTINE
    SEC                    ; 2
    LDA    $89             ; 3
    SBC.w  $8D             ; 4
    RTS                    ; 6

LF391:
    LDA    $D3             ; 3
    BNE    LF3A7           ; 2³
    JSR    LF38A           ; 6
    BCS    LF3A0           ; 2³
    SEC                    ; 2
    LDA    $8D             ; 3
    SBC.w  $89             ; 4
LF3A0:
    CMP    #$0A            ; 2
    BCC    LF3F9           ; 2³
    JMP    LF363           ; 3
LF3A7:
    INC    $D2             ; 5
    JSR    LF38A           ; 6
    BCS    LF3B4           ; 2³
    SEC                    ; 2
    LDA    $8D             ; 3
    SBC.w  $89             ; 4
LF3B4:
    CMP    #$0B            ; 2
    BCS    LF3BB           ; 2³
    JMP    LF363           ; 3
LF3BB:
    JSR    LF3D6           ; 6
    BCC    LF3C9           ; 2³
LF3C0:
    JSR    LF3E1           ; 6
    JSR    LF47D           ; 6
    JMP    LF3CF           ; 3
LF3C9:
    JSR    LF3E1           ; 6
    JSR    LF473           ; 6
LF3CF:
    STX    $8C             ; 3
    STY    $8D             ; 3
    JMP    LF57C           ; 3

LF3D6 SUBROUTINE
    SEC                    ; 2
    LDA    $88             ; 3
    SBC.w  $8C             ; 4
    LDX    $8C             ; 3
    LDY    $8D             ; 3
    RTS                    ; 6

LF3E1 SUBROUTINE
    LDA    $86             ; 3
    JSR    LF4AB           ; 6
    STA    $86             ; 3
    JSR    LF922           ; 6
    LDA    #$FF            ; 2
    RTS                    ; 6

LF3EE:
    JSR    LF37B           ; 6
    BCC    LF3F6           ; 2³
    JMP    LF368           ; 3
LF3F6:
    JMP    LF370           ; 3
LF3F9:
    JSR    LF846           ; 6
    CMP    #7              ; 2
    BEQ    LF424           ; 2³
    CMP    #6              ; 2
    BCC    LF424           ; 2³
    LDA    $BF             ; 3
    CMP    #8              ; 2
    BEQ    LF42A           ; 2³
    AND    #$03            ; 2
    CMP    #1              ; 2
    BEQ    LF42A           ; 2³
    CMP    #0              ; 2
    BEQ    LF424           ; 2³
    CMP    #2              ; 2
    BEQ    LF41E           ; 2³
    JSR    LF521           ; 6
    JMP    LF42D           ; 3
LF41E:
    JSR    LF518           ; 6
    JMP    LF42D           ; 3
LF424:
    JSR    LF50C           ; 6
    JMP    LF42D           ; 3
LF42A:
    JSR    LF500           ; 6
LF42D:
    STA    $86             ; 3
    LDA    $A2             ; 3
    STA    $A3             ; 3
    JMP    LF57C           ; 3

LF436 SUBROUTINE
    LDA    $84             ; 3
    JSR    LF4AB           ; 6
    STA    $84             ; 3
    LDX    $88             ; 3
    LDY    $89             ; 3
    LDA    $89             ; 3
    STA    $AD             ; 3
    JSR    LF864           ; 6
    LDA    SWCHA           ; 4
    JSR    LF470           ; 6
    STX    $88             ; 3
    STY    $89             ; 3
    RTS                    ; 6

LF453 SUBROUTINE
    LDA    $86             ; 3
    JSR    LF4AB           ; 6
    STA    $86             ; 3
    LDX    $8C             ; 3
    LDY    $8D             ; 3
    JSR    LF922           ; 6
    LDA    SWCHA           ; 4
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    JSR    LF470           ; 6
    STX    $8C             ; 3
    STY    $8D             ; 3
    RTS                    ; 6

LF470 SUBROUTINE
    ASL                    ; 2
    BCS    LF47A           ; 2³

LF473 SUBROUTINE
    CPX    #$80            ; 2
    BCC    LF479           ; 2³
    LDX    #$7F            ; 2
LF479:
    INX                    ; 2
LF47A:
    ASL                    ; 2
    BCS    LF484           ; 2³

LF47D SUBROUTINE
    CPX    #$14            ; 2
    BCS    LF483           ; 2³
    LDX    #$15            ; 2
LF483:
    DEX                    ; 2
LF484:
    ASL                    ; 2
    BCS    LF48F           ; 2³

LF487 SUBROUTINE
    CPY    #$9C            ; 2
    BCC    LF48F           ; 2³
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
LF48F:
    ASL                    ; 2
    BCS    LF49A           ; 2³

LF492 SUBROUTINE
    CPY    #$DC            ; 2
    BCS    LF49A           ; 2³
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
LF49A:
    RTS                    ; 6

LF49B SUBROUTINE
    LDA    $84             ; 3
    JSR    LF4B5           ; 6
    STA    $84             ; 3
    RTS                    ; 6

LF4A3 SUBROUTINE
    LDA    $86             ; 3
    JSR    LF4D7           ; 6
    STA    $86             ; 3
    RTS                    ; 6

LF4AB SUBROUTINE
    CMP    #$30            ; 2
    BEQ    LF4B2           ; 2³
    LDA    #$30            ; 2
    RTS                    ; 6

LF4B2:
    LDA    #$48            ; 2
    RTS                    ; 6

LF4B5 SUBROUTINE
    CMP    #$48            ; 2
    BEQ    LF4C8           ; 2³
    LDA    $A4             ; 3
    STA    $A2             ; 3
    BEQ    LF4C3           ; 2³
    DEC    $A4             ; 5
    BEQ    LF4D4           ; 2³
LF4C3:
    LDA    $84             ; 3
    JMP    LF528           ; 3   JUMPS TO A SUBROUTINE
LF4C8:
    LDA    SWCHA           ; 4
    JSR    LF4FD           ; 6
    STA    $84             ; 3
    LDA    $A2             ; 3
    STA    $A4             ; 3
LF4D4:
    LDA    $84             ; 3
    RTS                    ; 6

LF4D7 SUBROUTINE
    CMP    #$48            ; 2
    BEQ    LF4EA           ; 2³
    LDA    $A5             ; 3
    STA    $A2             ; 3
    BEQ    LF4E5           ; 2³
    DEC    $A5             ; 5
    BEQ    LF4FA           ; 2³
LF4E5:
    LDA    $86             ; 3
    JMP    LF528           ; 3   JUMPS TO A SUBROUTINE
LF4EA:
    LDA    SWCHA           ; 4
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    JSR    LF4FD           ; 6
    STA    $86             ; 3
    LDA    $A2             ; 3
    STA    $A5             ; 3
LF4FA:
    LDA    $86             ; 3
    RTS                    ; 6

LF4FD SUBROUTINE
    ASL                    ; 2
    BCS    LF509           ; 2³

LF500 SUBROUTINE
    LDA    #2              ; 2
    STA    $A2             ; 3
    LDA    #$90            ; 2
    JMP    LF527           ; 3
LF509:
    ASL                    ; 2
    BCS    LF515           ; 2³

LF50C SUBROUTINE
    LDA    #2              ; 2
    STA    $A2             ; 3
    LDA    #$60            ; 2
    JMP    LF527           ; 3
LF515:
    ASL                    ; 2
    BCS    LF521           ; 2³  BRANCH TO SUBROUTINE

LF518 SUBROUTINE
    LDA    #1              ; 2
    STA    $A2             ; 3
    LDA    #$D8            ; 2
    JMP    LF527           ; 3

LF521 SUBROUTINE
    LDA    #1              ; 2
    STA    $A2             ; 3
    LDA    #$C0            ; 2
LF527:
    RTS                    ; 6

LF528 SUBROUTINE
    CMP    #$A8            ; 2
    BNE    LF531           ; 2³
    LDA    #$90            ; 2
    JMP    LF57B           ; 3
LF531:
    CMP    #$C0            ; 2
    BNE    LF53A           ; 2³
LF535:
    LDA    #$30            ; 2
    JMP    LF57B           ; 3
LF53A:
    CMP    #$D8            ; 2
    BNE    LF541           ; 2³
    JMP    LF535           ; 3
LF541:
    CMP    #$78            ; 2
    BNE    LF54A           ; 2³
    LDA    #$60            ; 2
    JMP    LF57B           ; 3
LF54A:
    CMP    #$90            ; 2
    BNE    LF55E           ; 2³
    LDA    $A2             ; 3
    CMP    #0              ; 2
    BNE    LF559           ; 2³
    LDA    #$30            ; 2
    JMP    LF57B           ; 3
LF559:
    LDA    #$A8            ; 2
    JMP    LF57B           ; 3
LF55E:
    CMP    #$60            ; 2
    BNE    LF572           ; 2³
    LDA    $A2             ; 3
    CMP    #0              ; 2
    BNE    LF56D           ; 2³
    LDA    #$48            ; 2
    JMP    LF57B           ; 3
LF56D:
    LDA    #$78            ; 2
    JMP    LF57B           ; 3
LF572:
    CMP    #$48            ; 2
    BNE    LF579           ; 2³
    JMP    LF535           ; 3
LF579:
    LDA    #$48            ; 2
LF57B:
    RTS                    ; 6

LF57C:
    JSR    LFBF3           ; 6
    JSR    LFC16           ; 6
    LDA    #$FB            ; 2
    STA    $85             ; 3
    STA    $87             ; 3
    LDA    $88             ; 3
    CMP.w  $8C             ; 4
    BCS    LF594           ; 2³
    LDA    #8              ; 2
    JMP    LF596           ; 3
LF594:
    LDA    #0              ; 2
LF596:
    STA    $A7             ; 3
    JMP    LF098           ; 3

LF59B SUBROUTINE
    LDA    INTIM           ; 4
    BNE    LF59B           ; 2³
    STA    WSYNC           ; 3
    STA    VBLANK          ; 3
    STA    CXCLR           ; 3
    STA    HMCLR           ; 3
    STA    COLUBK          ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    RTS                    ; 6
    RTS                    ; 6

LF5BA SUBROUTINE
    LDA    #0              ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    LDA    #$10            ; 2
    LDX    #0              ; 2
    JSR    LFE00           ; 6
    LDA    #COL_01         ; 2
    STA    COLUP0          ; 3
    LDA    #$50            ; 2
    LDX    #1              ; 2
    JSR    LFE00           ; 6
    LDA    #3              ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDA    #COL_02         ; 2
    STA    COLUP1          ; 3
    STA    COLUP1          ; 3
    LDY    #7              ; 2
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
LF5E4:
    STA    WSYNC           ; 3
    NOP                    ; 2
    LDA    ($94),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($9A),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($96),Y         ; 5
    LDX    $A0             ; 3
    LDX    $A0             ; 3
    STA    GRP0            ; 3
    LDA    ($98),Y         ; 5
    STA    GRP0            ; 3
    LDX.w  $A0             ; 4
    LDA    ($9C),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($9E),Y         ; 5
    STA    GRP1            ; 3
    STA    GRP0            ; 3
    DEY                    ; 2
    BPL    LF5E4           ; 2³+1
    LDA    #0              ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    RTS                    ; 6

LF61A SUBROUTINE
    LDX    #2              ; 2
    LDY    #8              ; 2
LF61E:
    LDA    $91,X           ; 4
    AND    #$F0            ; 2
    LSR                    ; 2
    ADC    #8              ; 2
    STA.wy $94,Y           ; 5
    LDA    $91,X           ; 4
    AND    #$0F            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ADC    #8              ; 2
    STA.wy $96,Y           ; 5
    LDA    #$FD            ; 2
    STA.wy $95,Y           ; 5
    STA.wy $97,Y           ; 5
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEX                    ; 2
    BPL    LF61E           ; 2³
    RTS                    ; 6

LF644 SUBROUTINE
    CMP    #$A8            ; 2
    BEQ    LF65E           ; 2³
    CMP    #$C0            ; 2
    BEQ    LF659           ; 2³
    CMP    #$D8            ; 2
    BEQ    LF659           ; 2³
    CMP    #$78            ; 2
    BEQ    LF663           ; 2³
    LDA    #0              ; 2
LF656:
    STA    $AA             ; 3
    RTS                    ; 6

LF659:
    LDA    #$10            ; 2
    JMP    LF656           ; 3
LF65E:
    LDA    #$15            ; 2
    JMP    LF656           ; 3
LF663:
    LDA    #$20            ; 2
    JMP    LF656           ; 3
LF668:
    LDA.w  $07             ; 4
    ASL                    ; 2
    BCS    LF674           ; 2³
LF66E:
    JSR    LF7CC           ; 6
    JMP    LF7E4           ; 3
LF674:
    LDA    $A4             ; 3
    CMP    #1              ; 2
    BEQ    LF683           ; 2³
    LDA    $84             ; 3
    JSR    LF644           ; 6
    LDA    $AA             ; 3
    STA    $AB             ; 3
LF683:
    LDA    $A5             ; 3
    CMP    #1              ; 2
    BEQ    LF692           ; 2³
    LDA    $86             ; 3
    JSR    LF644           ; 6
    LDA    $AA             ; 3
    STA    $AC             ; 3
LF692:
    LDA    $AB             ; 3
    BEQ    LF6FD           ; 2³
LF696:
    JSR    LF846           ; 6
    CMP    #2              ; 2
    BCC    LF66E           ; 2³
    CMP    #7              ; 2
    BEQ    LF6D3           ; 2³
    BCC    LF704           ; 2³+1
    CMP    #$0E            ; 2
    BCS    LF66E           ; 2³
    CMP    #9              ; 2
    BCC    LF6BB           ; 2³
    LDA    $84             ; 3
    CMP    #$A8            ; 2
    BEQ    LF6B8           ; 2³
    CMP    #$D8            ; 2
    BEQ    LF6B8           ; 2³
    JMP    LF6BB           ; 3
LF6B8:
    JMP    LF66E           ; 3
LF6BB:
    SEC                    ; 2
    LDA    $AB             ; 3
    SBC.w  $AC             ; 4
    BEQ    LF704           ; 2³+1
    BCC    LF6CC           ; 2³
LF6C5:
    LDA    #0              ; 2
    STA    $AC             ; 3
    JMP    LF704           ; 3
LF6CC:
    LDA    #0              ; 2
    STA    $AB             ; 3
    JMP    LF704           ; 3
LF6D3:
    JSR    LF855           ; 6
    CMP    #4              ; 2
    BCS    LF704           ; 2³+1
    LDA    $AB             ; 3
    CMP    #$20            ; 2
    BEQ    LF6ED           ; 2³
    LDA    $AC             ; 3
    CMP    #$20            ; 2
    BNE    LF704           ; 2³+1
    LDA    #$60            ; 2
    STA    $AC             ; 3
    JMP    LF6CC           ; 3
LF6ED:
    LDA    $AC             ; 3
    CMP    #$20            ; 2
    BEQ    LF6FA           ; 2³
    LDA    #$60            ; 2
    STA    $AB             ; 3
    JMP    LF6C5           ; 3
LF6FA:
    JMP    LF704           ; 3
LF6FD:
    LDA    $AC             ; 3
    BEQ    LF707           ; 2³
    JMP    LF696           ; 3
LF704:
    JSR    LF865           ; 6
LF707:
    JSR    LF7CC           ; 6
    LDA    $AB             ; 3
    CMP    #0              ; 2
    BEQ    LF738           ; 2³
    CMP.w  $AC             ; 4
    BCC    LF73E           ; 2³
    CMP    #$10            ; 2
    BEQ    LF763           ; 2³
    CMP    #$15            ; 2
    BEQ    LF772           ; 2³
    CMP    #$20            ; 2
    BEQ    LF781           ; 2³
    LDA    #$48            ; 2
    STA    $86             ; 3
    LDA    #$FC            ; 2
    STA    $87             ; 3
    LDA    #$30            ; 2
    STA    $84             ; 3
    LDA    #$FB            ; 2
    STA    $85             ; 3
    LDA    #$40            ; 2
    STA    $B4             ; 3
    JMP    LF7BD           ; 3
LF738:
    LDA    $AC             ; 3
    CMP    #0              ; 2
    BEQ    LF76F           ; 2³
LF73E:
    LDA    $AC             ; 3
    CMP    #$10            ; 2
    BEQ    LF790           ; 2³
    CMP    #$15            ; 2
    BEQ    LF79F           ; 2³
    CMP    #$20            ; 2
    BEQ    LF7AE           ; 2³
    LDA    #$48            ; 2
    STA    $84             ; 3
    LDA    #$FC            ; 2
    STA    $85             ; 3
    LDA    #$30            ; 2
    STA    $86             ; 3
    LDA    #$FB            ; 2
    STA    $87             ; 3
    LDA    #$40            ; 2
    STA    $B4             ; 3
    JMP    LF7BD           ; 3
LF763:
    LDA    #2              ; 2
    STA    AUDC0           ; 3
    LDA    #$B2            ; 2
    STA    AUDF0           ; 3
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
LF76F:
    JMP    LF7DB           ; 3
LF772:
    LDA    #8              ; 2
    STA    AUDC0           ; 3
    LDA    #$F5            ; 2
    STA    AUDF0           ; 3
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
    JMP    LF7DB           ; 3
LF781:
    LDA    #8              ; 2
    STA    AUDC0           ; 3
    LDA    #$D4            ; 2
    STA    AUDF0           ; 3
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
    JMP    LF7DB           ; 3
LF790:
    LDA    #2              ; 2
    STA    AUDC1           ; 3
    LDA    #$A8            ; 2
    STA    AUDF1           ; 3
    LDA    #$0F            ; 2
    STA    AUDV1           ; 3
    JMP    LF7DB           ; 3
LF79F:
    LDA    #8              ; 2
    STA    AUDC1           ; 3
    LDA    #$B4            ; 2
    STA    AUDF1           ; 3
    LDA    #$0E            ; 2
    STA    AUDV1           ; 3
    JMP    LF7DB           ; 3
LF7AE:
    LDA    #8              ; 2
    STA    AUDC1           ; 3
    LDA    #$B6            ; 2
    STA    AUDF1           ; 3
    LDA    #$0F            ; 2
    STA    AUDV1           ; 3
    JMP    LF7DB           ; 3
LF7BD:
    LDA    #$0F            ; 2
    STA    AUDC1           ; 3
    LDA    #$38            ; 2
    STA    AUDF1           ; 3
    LDA    #$0F            ; 2
    STA    AUDV1           ; 3
    JMP    LF7DB           ; 3

LF7CC SUBROUTINE
    LDA    #0              ; 2
    STA    AUDC1           ; 3
    STA    AUDF0           ; 3
    STA    AUDF1           ; 3
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    STA    AUDC0           ; 3
    RTS                    ; 6

LF7DB:
    LDA    $AB             ; 3
    BEQ    LF7E4           ; 2³
    LDA    #1              ; 2
    JMP    LF7E6           ; 3
LF7E4:
    LDA    #0              ; 2
LF7E6:
    STA    $D3             ; 3
    JSR    LFCA0           ; 6
    JSR    LF846           ; 6
    CMP    #$0C            ; 2
    BCS    LF83D           ; 2³+1
    LDA    #$80            ; 2
    STA    $B2             ; 3
    JSR    LF92A           ; 6
    CMP    #7              ; 2
    BCC    LF821           ; 2³+1
    LDA    #$14            ; 2
    STA    $B2             ; 3
    JSR    LF92A           ; 6
    CMP    #7              ; 2
    BCC    LF821           ; 2³
    LDA    #0              ; 2
    STA    $B3             ; 3
    JSR    LF846           ; 6
    CMP    #3              ; 2
    BCS    LF81A           ; 2³
    INC    $B6             ; 5
    LDA    $B6             ; 3
    JMP    LF825           ; 3
LF81A:
    LDA    #0              ; 2
    STA    $B6             ; 3
    JMP    LF83D           ; 3
LF821:
    INC    $B3             ; 5
    LDA    $B3             ; 3
LF825:
    CMP    #$0E            ; 2
    BNE    LF83D           ; 2³
    LDA    #$48            ; 2
    STA    $84             ; 3
    LDA    #$30            ; 2
    STA    $86             ; 3
    LDA    #$48            ; 2
    STA    $88             ; 3
    LDA    #$31            ; 2
    STA    $8C             ; 3
    LDA    #0              ; 2
    STA    $A7             ; 3
LF83D:
    LDA    #0              ; 2
    STA    $AB             ; 3
    STA    $AC             ; 3
    JMP    LF098           ; 3

LF846 SUBROUTINE
    SEC                    ; 2
    LDA    $88             ; 3
    SBC.w  $8C             ; 4
    BCS    LF854           ; 2³
    SEC                    ; 2
    LDA    $8C             ; 3
    SBC.w  $88             ; 4
LF854:
    RTS                    ; 6

LF855 SUBROUTINE
    SEC                    ; 2
    LDA    $89             ; 3
    SBC.w  $8D             ; 4
    BCS    LF863           ; 2³
    SEC                    ; 2
    LDA    $8D             ; 3
    SBC.w  $89             ; 4
LF863:
    RTS                    ; 6

LF864 SUBROUTINE
    RTS                    ; 6

LF865 SUBROUTINE
    LDA    $AB             ; 3
    CLC                    ; 2
    LDX    #2              ; 2
    SED                    ; 2
LF86B:
    ADC.wx $91,X           ; 4
    STA    $91,X           ; 4
    LDA    #0              ; 2
    DEX                    ; 2
    BNE    LF86B           ; 2³
    CLD                    ; 2
    LDA    $AC             ; 3
    CLC                    ; 2
    LDX    #1              ; 2
    SED                    ; 2
LF87C:
    ADC.wx $AE,X           ; 4
    STA    $AE,X           ; 4
    STA    $B0,X           ; 4
    LDA    #0              ; 2
    DEX                    ; 2
    BPL    LF87C           ; 2³
    CLD                    ; 2
    LDX    #4              ; 2
LF88B:
    CLC                    ; 2
    ASL.w  $B1             ; 6
    ROL.w  $B0             ; 6
    DEX                    ; 2
    BNE    LF88B           ; 2³
    LDA    $B0             ; 3
    STA    $91             ; 3
    LDA    $92             ; 3
    AND    #$0F            ; 2
    ORA.w  $B1             ; 4
    STA    $92             ; 3
    LDA    $C3             ; 3
    CMP    #7              ; 2
    BEQ    LF8AC           ; 2³
    LDA    $C4             ; 3
    STA    $93             ; 3
LF8AC:
    JSR    LF61A           ; 6
    LDA    $AB             ; 3
    SBC.w  $AC             ; 4
    BEQ    LF8EC           ; 2³
    BCC    LF8ED           ; 2³
    LDA    $88             ; 3
    SBC.w  $8C             ; 4
    BCC    LF8D6           ; 2³
    DEC    $8C             ; 5
    DEC    $8C             ; 5
    DEC    $8C             ; 5
    DEC    $8C             ; 5
    DEC    $8C             ; 5
    DEC    $8C             ; 5
    LDA    $8C             ; 3
    CMP    #$14            ; 2
    BCS    LF8EC           ; 2³
    LDA    #$14            ; 2
    STA    $8C             ; 3
    RTS                    ; 6

LF8D6:
    INC    $8C             ; 5
    INC    $8C             ; 5
    INC    $8C             ; 5
    INC    $8C             ; 5
    INC    $8C             ; 5
    INC    $8C             ; 5
    LDA    $8C             ; 3
    CMP    #$80            ; 2
    BCC    LF8EC           ; 2³
    LDA    #$80            ; 2
    STA    $8C             ; 3
LF8EC:
    RTS                    ; 6

LF8ED:
    LDA    $8C             ; 3
    SBC.w  $88             ; 4
    BCC    LF90B           ; 2³+1
    DEC    $88             ; 5
    DEC    $88             ; 5
    DEC    $88             ; 5
    DEC    $88             ; 5
    DEC    $88             ; 5
    DEC    $88             ; 5
    LDA    $88             ; 3
    CMP    #$14            ; 2
    BCS    LF8EC           ; 2³+1
    LDA    #$14            ; 2
    STA    $88             ; 3
    RTS                    ; 6

LF90B:
    INC    $88             ; 5
    INC    $88             ; 5
    INC    $88             ; 5
    INC    $88             ; 5
    INC    $88             ; 5
    INC    $88             ; 5
    LDA    $88             ; 3
    CMP    #$80            ; 2
    BCC    LF8EC           ; 2³+1
    LDA    #$80            ; 2
    STA    $88             ; 3
    RTS                    ; 6

LF922 SUBROUTINE
    LDA    $8D             ; 3
    STA    $AD             ; 3
    JSR    LF864           ; 6
    RTS                    ; 6

LF92A SUBROUTINE
    SEC                    ; 2
    LDA    $88             ; 3
    SBC.w  $B2             ; 4
    BCS    LF938           ; 2³
    SEC                    ; 2
    LDA    $B2             ; 3
    SBC.w  $88             ; 4
LF938:
    RTS                    ; 6

LF939 SUBROUTINE
    LDA    $BE             ; 3
    ORA    $BF             ; 3
    BEQ    LF977           ; 2³
    DEC.w  $C1             ; 6
    BNE    LF976           ; 2³
    SEC                    ; 2
    SED                    ; 2
    LDA.w  $BF             ; 4
    SBC    #1              ; 2
    STA    $BF             ; 3
    BCS    LF956           ; 2³
    DEC.w  $BE             ; 6
    LDA    #$59            ; 2
    STA    $BF             ; 3
LF956:
    CLD                    ; 2
    LDA    $BE             ; 3
    JSR    LFA34           ; 6
    STA    $B7             ; 3
    LDA    $BF             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    JSR    LFA34           ; 6
    STA    $B9             ; 3
    LDA    $BF             ; 3
    AND    #$0F            ; 2
    JSR    LFA34           ; 6
    STA    $BB             ; 3
    LDA    #5              ; 2
    STA    $C1             ; 3
LF976:
    RTS                    ; 6

LF977:
    JSR    LFA04           ; 6
    JSR    LFA0F           ; 6
    LDA    $C6             ; 3
    CMP.w  $C7             ; 4
    BEQ    LF989           ; 2³
    BCS    LF9AB           ; 2³
    JMP    LF9A0           ; 3
LF989:
    LDA    $93             ; 3
    AND    #$F0            ; 2
    STA    $C6             ; 3
    LDA    $91             ; 3
    AND    #$0F            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    $C7             ; 3
    LDA    $C6             ; 3
    CMP.w  $C7             ; 4
    BCS    LF9AB           ; 2³
LF9A0:
    LDA    #$78            ; 2
    STA    $84             ; 3
    LDA    #$FC            ; 2
    STA    $85             ; 3
    JMP    LF9C6           ; 3
LF9AB:
    LDA    #$78            ; 2
    STA    $86             ; 3
    LDA    #$FC            ; 2
    STA    $87             ; 3
LF9B3:
    LDA    #$60            ; 2
    STA    $84             ; 3
    LDA    #$FC            ; 2
    STA    $85             ; 3
    INC    $C2             ; 5
    LDA    $C2             ; 3
    CMP    #5              ; 2
    BEQ    LFA16           ; 2³+1
    JMP    LF9D6           ; 3
LF9C6:
    LDA    #$60            ; 2
    STA    $86             ; 3
    LDA    #$FC            ; 2
    STA    $87             ; 3
    INC    $C5             ; 5
    LDA    $C5             ; 3
    CMP    #5              ; 2
    BEQ    LFA25           ; 2³+1
LF9D6:
    JSR    LFCA0           ; 6
    LDA    #$80            ; 2
    STA    $B4             ; 3
    LDA    #$10            ; 2
    STA    $CE             ; 3
    JSR    StartMusic      ; 6
    JMP    LF03F           ; 3

StartMusic SUBROUTINE
    LDA    #8              ; 2
    STA    AUDC1           ; 3
    LDA    #$0E            ; 2
    STA    AUDF1           ; 3
    LDA    #8              ; 2
    STA    AUDV1           ; 3
    STA    $CF             ; 3
    LDA    #4              ; 2
    STA    AUDC0           ; 3
    LDA    #8              ; 2
    STA    AUDF0           ; 3
    STA    $D0             ; 3
    LDA    #9              ; 2
    STA    AUDV0           ; 3
    RTS                    ; 6

LFA04 SUBROUTINE
    LDA    $92             ; 3
    AND    #$0F            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    $C6             ; 3
    RTS                    ; 6

LFA0F SUBROUTINE
    LDA    $91             ; 3
    AND    #$F0            ; 2
    STA    $C7             ; 3
    RTS                    ; 6

LFA16:
    LDA    #6              ; 2
    STA    $C8             ; 3
    LDA    #1              ; 2
    STA    $D5             ; 3
    LDA    #0              ; 2
    STA    $D4             ; 3
    JMP    LF9D6           ; 3
LFA25:
    LDA    #6              ; 2
    STA    $C8             ; 3
    LDA    #1              ; 2
    STA    $D4             ; 3
    LDA    #0              ; 2
    STA    $D5             ; 3
    JMP    LF9D6           ; 3

LFA34 SUBROUTINE
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    CLC                    ; 2
    ADC    #8              ; 2
    RTS                    ; 6

LFA3B SUBROUTINE
    LDA    #0              ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    LDA    #$3C            ; 2
    LDX.w  $00             ; 4
    JSR    LFE00           ; 6
    LDA    #$44            ; 2
    LDX    #1              ; 2
    JSR    LFE00           ; 6
    LDA    #1              ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDA    #COL_03         ; 2
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDY    #7              ; 2
LFA5E:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    ($B7),Y         ; 5
    STA    GRP0            ; 3
    LDA    Colon,Y         ; 4
    STA    GRP1            ; 3
    LDA    ($BB),Y         ; 5
    STA    $C0             ; 3
    LDX    $C0             ; 3
    DEC    $82             ; 5
    NOP                    ; 2
    NOP                    ; 2
    LDA    ($B9),Y         ; 5
    STA    GRP0            ; 3
    STX    GRP1            ; 3
    STA    HMCLR           ; 3
    DEY                    ; 2
    BPL    LFA5E           ; 2³
    LDA    #$E0            ; 2
    STA    $82             ; 3
    LDA    #0              ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    RTS                    ; 6

LFA8F SUBROUTINE
    JSR    LFA04           ; 6
    CMP    #$90            ; 2
    BEQ    LFA9E           ; 2³
    JSR    LFA0F           ; 6
    CMP    #$90            ; 2
    BEQ    LFAA9           ; 2³
    RTS                    ; 6

LFA9E:
    LDA    #$48            ; 2
    STA    $86             ; 3
    LDA    #$FC            ; 2
    STA    $87             ; 3
    JMP    LF9B3           ; 3
LFAA9:
    LDA    #$48            ; 2
    STA    $84             ; 3
    LDA    #$FC            ; 2
    STA    $85             ; 3
    JMP    LF9C6           ; 3

LFAB4 SUBROUTINE
    LDA    #0              ; 2
    STA    GRP0            ; 3
    LDA    #COL_04         ; 2
    STA    COLUP0          ; 3
    LDA    #$40            ; 2
    LDX    #0              ; 2
    JSR    LFE00           ; 6
    STA    HMOVE           ; 3
    LDA    #5              ; 2
    STA    NUSIZ0          ; 3
    STA    HMCLR           ; 3
    LDY    #$18            ; 2
LFACD:
    STA    WSYNC           ; 3
    LDA    ($C9),Y         ; 5
    STA    GRP0            ; 3
    DEC    $82             ; 5
    STA    WSYNC           ; 3
    CPY    #5              ; 2
    BCS    LFADF           ; 2³
    LDA    #$22            ; 2
    STA    COLUBK          ; 3
LFADF:
    DEC    $82             ; 5
    STA    WSYNC           ; 3
    DEC    $82             ; 5
    DEY                    ; 2
    BPL    LFACD           ; 2³
    LDA    #0              ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDA    #$A0            ; 2
    STA    $82             ; 3
    RTS                    ; 6

LFAF7 SUBROUTINE
    LDA    $C2             ; 3
    JSR    GetBeltColor    ; 6
    STA    $CC             ; 3
    LDA    $C5             ; 3
    JSR    GetBeltColor    ; 6
    STA    $CD             ; 3
    RTS                    ; 6

GetBeltColor SUBROUTINE
    CMP    #0              ; 2
    BEQ    .whiteBelt      ; 2³
    CMP    #1              ; 2
    BEQ    .redBelt        ; 2³
    CMP    #2              ; 2
    BEQ    .greenBelt      ; 2³
    CMP    #3              ; 2
    BEQ    .orangeBelt     ; 2³
    LDA    #BLACK          ; 2
    JMP    .exitBeltColor  ; 3
.whiteBelt:
    LDA    #WHITE          ; 2
    JMP    .exitBeltColor  ; 3
.greenBelt:
    LDA    #GREEN          ; 2
    JMP    .exitBeltColor  ; 3
.orangeBelt:
    LDA    #ORANGE         ; 2
    JMP    .exitBeltColor  ; 3
.redBelt:
    LDA    #RED            ; 2
.exitBeltColor:
    RTS                    ; 6

    .byte $FF ; |XXXXXXXX| $FB2D
    .byte $FF ; |XXXXXXXX| $FB2E
    .byte $FF ; |XXXXXXXX| $FB2F
FistDown:
    .byte $00 ; |        | $FB30
    .byte $30 ; |  XX    | $FB31
    .byte $13 ; |   X  XX| $FB32
    .byte $11 ; |   X   X| $FB33
    .byte $11 ; |   X   X| $FB34
    .byte $13 ; |   X  XX| $FB35
    .byte $12 ; |   X  X | $FB36
    .byte $12 ; |   X  X | $FB37
    .byte $1B ; |   XX XX| $FB38
    .byte $09 ; |    X  X| $FB39
    .byte $09 ; |    X  X| $FB3A
    .byte $0F ; |    XXXX| $FB3B
    .byte $06 ; |     XX | $FB3C
    .byte $06 ; |     XX | $FB3D
    .byte $34 ; |  XX X  | $FB3E
    .byte $37 ; |  XX XXX| $FB3F
    .byte $15 ; |   X X X| $FB40
    .byte $1F ; |   XXXXX| $FB41
    .byte $1F ; |   XXXXX| $FB42
    .byte $0E ; |    XXX | $FB43
    .byte $04 ; |     X  | $FB44
    .byte $0C ; |    XX  | $FB45
    .byte $0C ; |    XX  | $FB46
    .byte $0C ; |    XX  | $FB47
FistUp:
    .byte $00 ; |        | $FB48
    .byte $03 ; |      XX| $FB49
    .byte $19 ; |   XX  X| $FB4A
    .byte $09 ; |    X  X| $FB4B
    .byte $09 ; |    X  X| $FB4C
    .byte $09 ; |    X  X| $FB4D
    .byte $19 ; |   XX  X| $FB4E
    .byte $11 ; |   X   X| $FB4F
    .byte $11 ; |   X   X| $FB50
    .byte $19 ; |   XX  X| $FB51
    .byte $0B ; |    X XX| $FB52
    .byte $0F ; |    XXXX| $FB53
    .byte $06 ; |     XX | $FB54
    .byte $06 ; |     XX | $FB55
    .byte $07 ; |     XXX| $FB56
    .byte $05 ; |     X X| $FB57
    .byte $07 ; |     XXX| $FB58
    .byte $3F ; |  XXXXXX| $FB59
    .byte $2F ; |  X XXXX| $FB5A
    .byte $0E ; |    XXX | $FB5B
    .byte $04 ; |     X  | $FB5C
    .byte $0C ; |    XX  | $FB5D
    .byte $0C ; |    XX  | $FB5E
    .byte $0C ; |    XX  | $FB5F
MidUpKick:
    .byte $00 ; |        | $FB60
    .byte $06 ; |     XX | $FB61
    .byte $04 ; |     X  | $FB62
    .byte $06 ; |     XX | $FB63
    .byte $06 ; |     XX | $FB64
    .byte $62 ; | XX   X | $FB65
    .byte $23 ; |  X   XX| $FB66
    .byte $21 ; |  X    X| $FB67
    .byte $21 ; |  X    X| $FB68
    .byte $21 ; |  X    X| $FB69
    .byte $3D ; |  XXXX X| $FB6A
    .byte $1F ; |   XXXXX| $FB6B
    .byte $06 ; |     XX | $FB6C
    .byte $06 ; |     XX | $FB6D
    .byte $07 ; |     XXX| $FB6E
    .byte $0F ; |    XXXX| $FB6F
    .byte $1F ; |   XXXXX| $FB70
    .byte $17 ; |   X XXX| $FB71
    .byte $17 ; |   X XXX| $FB72
    .byte $06 ; |     XX | $FB73
    .byte $02 ; |      X | $FB74
    .byte $06 ; |     XX | $FB75
    .byte $06 ; |     XX | $FB76
    .byte $06 ; |     XX | $FB77
UpKick:
    .byte $00 ; |        | $FB78
    .byte $06 ; |     XX | $FB79
    .byte $04 ; |     X  | $FB7A
    .byte $06 ; |     XX | $FB7B
    .byte $02 ; |      X | $FB7C
    .byte $03 ; |      XX| $FB7D
    .byte $01 ; |       X| $FB7E
    .byte $03 ; |      XX| $FB7F
    .byte $02 ; |      X | $FB80
    .byte $06 ; |     XX | $FB81
    .byte $0C ; |    XX  | $FB82
    .byte $0C ; |    XX  | $FB83
    .byte $0C ; |    XX  | $FB84
    .byte $0C ; |    XX  | $FB85
    .byte $0E ; |    XXX | $FB86
    .byte $1F ; |   XXXXX| $FB87
    .byte $17 ; |   X XXX| $FB88
    .byte $33 ; |  XX  XX| $FB89
    .byte $25 ; |  X  X X| $FB8A
    .byte $6B ; | XX X XX| $FB8B
    .byte $43 ; | X    XX| $FB8C
    .byte $C3 ; |XX    XX| $FB8D
    .byte $80 ; |X       | $FB8E
    .byte $80 ; |X       | $FB8F
MidStraightKick:
    .byte $00 ; |        | $FB90
    .byte $06 ; |     XX | $FB91
    .byte $04 ; |     X  | $FB92
    .byte $06 ; |     XX | $FB93
    .byte $06 ; |     XX | $FB94
    .byte $62 ; | XX   X | $FB95
    .byte $23 ; |  X   XX| $FB96
    .byte $21 ; |  X    X| $FB97
    .byte $21 ; |  X    X| $FB98
    .byte $21 ; |  X    X| $FB99
    .byte $3D ; |  XXXX X| $FB9A
    .byte $1F ; |   XXXXX| $FB9B
    .byte $06 ; |     XX | $FB9C
    .byte $06 ; |     XX | $FB9D
    .byte $07 ; |     XXX| $FB9E
    .byte $0F ; |    XXXX| $FB9F
    .byte $1F ; |   XXXXX| $FBA0
    .byte $17 ; |   X XXX| $FBA1
    .byte $17 ; |   X XXX| $FBA2
    .byte $06 ; |     XX | $FBA3
    .byte $02 ; |      X | $FBA4
    .byte $06 ; |     XX | $FBA5
    .byte $06 ; |     XX | $FBA6
    .byte $06 ; |     XX | $FBA7
StraightKick:
    .byte $00 ; |        | $FBA8
    .byte $06 ; |     XX | $FBA9
    .byte $04 ; |     X  | $FBAA
    .byte $04 ; |     X  | $FBAB
    .byte $06 ; |     XX | $FBAC
    .byte $02 ; |      X | $FBAD
    .byte $03 ; |      XX| $FBAE
    .byte $01 ; |       X| $FBAF
    .byte $01 ; |       X| $FBB0
    .byte $03 ; |      XX| $FBB1
    .byte $02 ; |      X | $FBB2
    .byte $06 ; |     XX | $FBB3
    .byte $06 ; |     XX | $FBB4
    .byte $1E ; |   XXXX | $FBB5
    .byte $F6 ; |XXXX XX | $FBB6
    .byte $87 ; |X    XXX| $FBB7
    .byte $07 ; |     XXX| $FBB8
    .byte $03 ; |      XX| $FBB9
    .byte $05 ; |     X X| $FBBA
    .byte $09 ; |    X  X| $FBBB
    .byte $03 ; |      XX| $FBBC
    .byte $03 ; |      XX| $FBBD
    .byte $00 ; |        | $FBBE
    .byte $00 ; |        | $FBBF
UpPunch:
    .byte $00 ; |        | $FBC0
    .byte $1B ; |   XX XX| $FBC1
    .byte $09 ; |    X  X| $FBC2
    .byte $09 ; |    X  X| $FBC3
    .byte $19 ; |   XX  X| $FBC4
    .byte $11 ; |   X   X| $FBC5
    .byte $31 ; |  XX   X| $FBC6
    .byte $23 ; |  X   XX| $FBC7
    .byte $22 ; |  X   X | $FBC8
    .byte $32 ; |  XX  X | $FBC9
    .byte $1A ; |   XX X | $FBCA
    .byte $0E ; |    XXX | $FBCB
    .byte $06 ; |     XX | $FBCC
    .byte $06 ; |     XX | $FBCD
    .byte $04 ; |     X  | $FBCE
    .byte $0F ; |    XXXX| $FBCF
    .byte $07 ; |     XXX| $FBD0
    .byte $0F ; |    XXXX| $FBD1
    .byte $1E ; |   XXXX | $FBD2
    .byte $3E ; |  XXXXX | $FBD3
    .byte $64 ; | XX  X  | $FBD4
    .byte $CC ; |XX  XX  | $FBD5
    .byte $8C ; |X   XX  | $FBD6
    .byte $0C ; |    XX  | $FBD7
StraightPunch:
    .byte $00 ; |        | $FBD8
    .byte $63 ; | XX   XX| $FBD9
    .byte $21 ; |  X    X| $FBDA
    .byte $21 ; |  X    X| $FBDB
    .byte $21 ; |  X    X| $FBDC
    .byte $21 ; |  X    X| $FBDD
    .byte $21 ; |  X    X| $FBDE
    .byte $23 ; |  X   XX| $FBDF
    .byte $22 ; |  X   X | $FBE0
    .byte $32 ; |  XX  X | $FBE1
    .byte $1A ; |   XX X | $FBE2
    .byte $0E ; |    XXX | $FBE3
    .byte $06 ; |     XX | $FBE4
    .byte $06 ; |     XX | $FBE5
    .byte $04 ; |     X  | $FBE6
    .byte $0F ; |    XXXX| $FBE7
    .byte $07 ; |     XXX| $FBE8
    .byte $0F ; |    XXXX| $FBE9
    .byte $FE ; |XXXXXXX | $FBEA
    .byte $1C ; |   XXX  | $FBEB
    .byte $04 ; |     X  | $FBEC
    .byte $0C ; |    XX  | $FBED
    .byte $0C ; |    XX  | $FBEE
    .byte $0C ; |    XX  | $FBEF

    .byte $FF ; |XXXXXXXX| $FBF0
    .byte $FF ; |XXXXXXXX| $FBF1
    .byte $FF ; |XXXXXXXX| $FBF2

LFBF3 SUBROUTINE
    LDA    SWCHB           ; 4
    AND    #$02            ; 2
    BEQ    LFBFC           ; 2³
    BNE    LFC2F           ; 2³+1
LFBFC:
    LDA    SWCHB           ; 4
    AND    #$02            ; 2
    BEQ    LFBFC           ; 2³+1
    LDA    $C4             ; 3
    CMP    #1              ; 2
    BEQ    LFC0D           ; 2³
    LDA    #1              ; 2
    BNE    LFC0F           ; 2³
LFC0D:
    LDA    #2              ; 2
LFC0F:
    STA    $C4             ; 3
    PLA                    ; 4
    PLA                    ; 4
    JMP    LF00E           ; 3

LFC16 SUBROUTINE
    LDA    SWCHB           ; 4
    AND    #$01            ; 2
    BEQ    LFC1F           ; 2³
    BNE    LFC2F           ; 2³
LFC1F:
    LDA    SWCHB           ; 4
    AND    #$01            ; 2
    BEQ    LFC1F           ; 2³
    LDA    #7              ; 2
    STA    $C3             ; 3
    PLA                    ; 4
    PLA                    ; 4
    JMP    LF012           ; 3
LFC2F:
    RTS                    ; 6

Crouching:
    .byte $00 ; |        | $FC30
    .byte $66 ; | XX  XX | $FC31
    .byte $22 ; |  X   X | $FC32
    .byte $22 ; |  X   X | $FC33
    .byte $22 ; |  X   X | $FC34
    .byte $22 ; |  X   X | $FC35
    .byte $26 ; |  X  XX | $FC36
    .byte $34 ; |  XX X  | $FC37
    .byte $18 ; |   XX   | $FC38
    .byte $0C ; |    XX  | $FC39
    .byte $06 ; |     XX | $FC3A
    .byte $07 ; |     XXX| $FC3B
    .byte $03 ; |      XX| $FC3C
    .byte $03 ; |      XX| $FC3D
    .byte $07 ; |     XXX| $FC3E
    .byte $76 ; | XXX XX | $FC3F
    .byte $5E ; | X XXXX | $FC40
    .byte $5E ; | X XXXX | $FC41
    .byte $1C ; |   XXX  | $FC42
    .byte $08 ; |    X   | $FC43
    .byte $18 ; |   XX   | $FC44
    .byte $18 ; |   XX   | $FC45
    .byte $18 ; |   XX   | $FC46
    .byte $00 ; |        | $FC47
KnockDown:
    .byte $00 ; |        | $FC48
    .byte $00 ; |        | $FC49
    .byte $00 ; |        | $FC4A
    .byte $CD ; |XX  XX X| $FC4B
    .byte $4D ; | X  XX X| $FC4C
    .byte $5D ; | X XXX X| $FC4D
    .byte $59 ; | X XX  X| $FC4E
    .byte $7D ; | XXXXX X| $FC4F
    .byte $6D ; | XX XX X| $FC50
    .byte $6D ; | XX XX X| $FC51
    .byte $4D ; | X  XX X| $FC52
    .byte $4D ; | X  XX X| $FC53
    .byte $07 ; |     XXX| $FC54
    .byte $07 ; |     XXX| $FC55
    .byte $07 ; |     XXX| $FC56
    .byte $03 ; |      XX| $FC57
    .byte $02 ; |      X | $FC58
    .byte $06 ; |     XX | $FC59
    .byte $06 ; |     XX | $FC5A
    .byte $06 ; |     XX | $FC5B
    .byte $00 ; |        | $FC5C
    .byte $00 ; |        | $FC5D
    .byte $00 ; |        | $FC5E
    .byte $00 ; |        | $FC5F
Victory:
    .byte $00 ; |        | $FC60
    .byte $00 ; |        | $FC61
    .byte $66 ; | XX  XX | $FC62
    .byte $24 ; |  X  X  | $FC63
    .byte $24 ; |  X  X  | $FC64
    .byte $24 ; |  X  X  | $FC65
    .byte $24 ; |  X  X  | $FC66
    .byte $24 ; |  X  X  | $FC67
    .byte $24 ; |  X  X  | $FC68
    .byte $24 ; |  X  X  | $FC69
    .byte $3C ; |  XXXX  | $FC6A
    .byte $18 ; |   XX   | $FC6B
    .byte $18 ; |   XX   | $FC6C
    .byte $18 ; |   XX   | $FC6D
    .byte $18 ; |   XX   | $FC6E
    .byte $18 ; |   XX   | $FC6F
    .byte $18 ; |   XX   | $FC70
    .byte $24 ; |  X  X  | $FC71
    .byte $7E ; | XXXXXX | $FC72
    .byte $42 ; | X    X | $FC73
    .byte $DB ; |XX XX XX| $FC74
    .byte $99 ; |X  XX  X| $FC75
    .byte $99 ; |X  XX  X| $FC76
    .byte $81 ; |X      X| $FC77
Defeat:
    .byte $00 ; |        | $FC78
    .byte $00 ; |        | $FC79
    .byte $6C ; | XX XX  | $FC7A
    .byte $48 ; | X  X   | $FC7B
    .byte $48 ; | X  X   | $FC7C
    .byte $48 ; | X  X   | $FC7D
    .byte $68 ; | XX X   | $FC7E
    .byte $28 ; |  X X   | $FC7F
    .byte $28 ; |  X X   | $FC80
    .byte $18 ; |   XX   | $FC81
    .byte $10 ; |   X    | $FC82
    .byte $30 ; |  XX    | $FC83
    .byte $30 ; |  XX    | $FC84
    .byte $30 ; |  XX    | $FC85
    .byte $3C ; |  XXXX  | $FC86
    .byte $28 ; |  X X   | $FC87
    .byte $38 ; |  XXX   | $FC88
    .byte $30 ; |  XX    | $FC89
    .byte $30 ; |  XX    | $FC8A
    .byte $2C ; |  X XX  | $FC8B
    .byte $1C ; |   XXX  | $FC8C
    .byte $0C ; |    XX  | $FC8D
    .byte $00 ; |        | $FC8E
    .byte $00 ; |        | $FC8F

    .byte $FF ; |XXXXXXXX| $FC90
    .byte $FF ; |XXXXXXXX| $FC91
    .byte $FF ; |XXXXXXXX| $FC92
    .byte $FF ; |XXXXXXXX| $FC93
    .byte $FF ; |XXXXXXXX| $FC94
    .byte $FF ; |XXXXXXXX| $FC95
    .byte $FF ; |XXXXXXXX| $FC96
    .byte $FF ; |XXXXXXXX| $FC97
    .byte $FF ; |XXXXXXXX| $FC98
    .byte $FF ; |XXXXXXXX| $FC99
    .byte $FF ; |XXXXXXXX| $FC9A
    .byte $FF ; |XXXXXXXX| $FC9B
    .byte $FF ; |XXXXXXXX| $FC9C
    .byte $FF ; |XXXXXXXX| $FC9D
    .byte $FF ; |XXXXXXXX| $FC9E
    .byte $FF ; |XXXXXXXX| $FC9F

LFCA0 SUBROUTINE
    LDA    INTIM           ; 4
    BNE    LFCA0           ; 2³
    LDA    #$82            ; 2
    STA    WSYNC           ; 3
    STA    VBLANK          ; 3
;===============================
  IF FUNVISION
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    VSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    LDA    #0              ; 2
    STA    VSYNC           ; 3
    STA    WSYNC           ; 3
  ELSE
    STA    VSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    LDA    #0              ; 2
    STA    VSYNC           ; 3
  ENDIF
;===============================
    LDA    #TIME_THREE     ; 2
    STA    TIM64T          ; 4
    RTS                    ; 6

;filled bytes ($FCBB - $FCFF)
    REPEAT ($FD00-*)
    .byte $FF
    REPEND

    ORG $FD00
Blank:
    .byte $00 ; |        | $FD00
    .byte $00 ; |        | $FD01
    .byte $00 ; |        | $FD02
    .byte $00 ; |        | $FD03
    .byte $00 ; |        | $FD04
    .byte $00 ; |        | $FD05
    .byte $00 ; |        | $FD06
    .byte $00 ; |        | $FD07
Zero:
    .byte $3C ; |  XXXX  | $FD08
    .byte $66 ; | XX  XX | $FD09
    .byte $66 ; | XX  XX | $FD0A
    .byte $66 ; | XX  XX | $FD0B
    .byte $66 ; | XX  XX | $FD0C
    .byte $66 ; | XX  XX | $FD0D
    .byte $66 ; | XX  XX | $FD0E
    .byte $3C ; |  XXXX  | $FD0F
One:
    .byte $3C ; |  XXXX  | $FD10
    .byte $18 ; |   XX   | $FD11
    .byte $18 ; |   XX   | $FD12
    .byte $18 ; |   XX   | $FD13
    .byte $18 ; |   XX   | $FD14
    .byte $18 ; |   XX   | $FD15
    .byte $38 ; |  XXX   | $FD16
    .byte $18 ; |   XX   | $FD17
Two:
    .byte $7E ; | XXXXXX | $FD18
    .byte $60 ; | XX     | $FD19
    .byte $60 ; | XX     | $FD1A
    .byte $3C ; |  XXXX  | $FD1B
    .byte $06 ; |     XX | $FD1C
    .byte $06 ; |     XX | $FD1D
    .byte $46 ; | X   XX | $FD1E
    .byte $3C ; |  XXXX  | $FD1F
Three:
    .byte $3C ; |  XXXX  | $FD20
    .byte $46 ; | X   XX | $FD21
    .byte $06 ; |     XX | $FD22
    .byte $0C ; |    XX  | $FD23
    .byte $0C ; |    XX  | $FD24
    .byte $06 ; |     XX | $FD25
    .byte $46 ; | X   XX | $FD26
    .byte $3C ; |  XXXX  | $FD27
Four:
    .byte $0C ; |    XX  | $FD28
    .byte $0C ; |    XX  | $FD29
    .byte $0C ; |    XX  | $FD2A
    .byte $7E ; | XXXXXX | $FD2B
    .byte $4C ; | X  XX  | $FD2C
    .byte $2C ; |  X XX  | $FD2D
    .byte $1C ; |   XXX  | $FD2E
    .byte $0C ; |    XX  | $FD2F
Five:
    .byte $7C ; | XXXXX  | $FD30
    .byte $46 ; | X   XX | $FD31
    .byte $06 ; |     XX | $FD32
    .byte $06 ; |     XX | $FD33
    .byte $7C ; | XXXXX  | $FD34
    .byte $60 ; | XX     | $FD35
    .byte $60 ; | XX     | $FD36
    .byte $7E ; | XXXXXX | $FD37
Six:
    .byte $3C ; |  XXXX  | $FD38
    .byte $66 ; | XX  XX | $FD39
    .byte $66 ; | XX  XX | $FD3A
    .byte $66 ; | XX  XX | $FD3B
    .byte $7C ; | XXXXX  | $FD3C
    .byte $60 ; | XX     | $FD3D
    .byte $62 ; | XX   X | $FD3E
    .byte $3C ; |  XXXX  | $FD3F
Seven:
    .byte $18 ; |   XX   | $FD40
    .byte $18 ; |   XX   | $FD41
    .byte $18 ; |   XX   | $FD42
    .byte $18 ; |   XX   | $FD43
    .byte $0C ; |    XX  | $FD44
    .byte $06 ; |     XX | $FD45
    .byte $42 ; | X    X | $FD46
    .byte $7E ; | XXXXXX | $FD47
Eight:
    .byte $3C ; |  XXXX  | $FD48
    .byte $66 ; | XX  XX | $FD49
    .byte $66 ; | XX  XX | $FD4A
    .byte $3C ; |  XXXX  | $FD4B
    .byte $3C ; |  XXXX  | $FD4C
    .byte $66 ; | XX  XX | $FD4D
    .byte $66 ; | XX  XX | $FD4E
    .byte $3C ; |  XXXX  | $FD4F
Nine:
    .byte $3C ; |  XXXX  | $FD50
    .byte $46 ; | X   XX | $FD51
    .byte $06 ; |     XX | $FD52
    .byte $3E ; |  XXXXX | $FD53
    .byte $66 ; | XX  XX | $FD54
    .byte $66 ; | XX  XX | $FD55
    .byte $66 ; | XX  XX | $FD56
    .byte $3C ; |  XXXX  | $FD57

    .byte $00 ; |        | $FD58
    .byte $00 ; |        | $FD59
    .byte $80 ; |X       | $FD5A
    .byte $C0 ; |XX      | $FD5B
    .byte $00 ; |        | $FD5C
    .byte $00 ; |        | $FD5D
    .byte $00 ; |        | $FD5E
    .byte $00 ; |        | $FD5F
    .byte $00 ; |        | $FD60
    .byte $7F ; | XXXXXXX| $FD61
    .byte $FF ; |XXXXXXXX| $FD62
    .byte $FF ; |XXXXXXXX| $FD63
    .byte $FF ; |XXXXXXXX| $FD64
    .byte $00 ; |        | $FD65
    .byte $00 ; |        | $FD66
    .byte $00 ; |        | $FD67
    .byte $00 ; |        | $FD68
    .byte $00 ; |        | $FD69
    .byte $FF ; |XXXXXXXX| $FD6A
    .byte $FF ; |XXXXXXXX| $FD6B
    .byte $FF ; |XXXXXXXX| $FD6C
    .byte $FF ; |XXXXXXXX| $FD6D
    .byte $00 ; |        | $FD6E
    .byte $00 ; |        | $FD6F
    .byte $00 ; |        | $FD70
    .byte $00 ; |        | $FD71
    .byte $00 ; |        | $FD72
Colon:
    .byte $00 ; |        | $FD73
    .byte $18 ; |   XX   | $FD74
    .byte $18 ; |   XX   | $FD75
    .byte $00 ; |        | $FD76
    .byte $00 ; |        | $FD77
    .byte $18 ; |   XX   | $FD78
    .byte $18 ; |   XX   | $FD79
    .byte $00 ; |        | $FD7A
;===============================
  IF FUNVISION

;duplicate code, never used?
    .byte $08              ;
    LDA    #$FF            ; 2
    JSR    $F487           ; 6
    JMP    $F3CF           ; 3
    LDA    #$FF            ; 2
    JSR    $F492           ; 6
    JMP    $F3CF           ; 3
    JMP    $F3C9           ; 3
    LDA    $86             ; 3
    JSR    $F4AB           ; 6
    STA    $86             ; 3
    JSR    $F38A           ; 6
    LDX    $8C             ; 3
    LDY    $8D             ; 3
    RTS                    ; 6

    SEC                    ; 2
    LDA    $89             ; 3
    SBC.w  $8D             ; 4
    RTS                    ; 6

    LDA    $D3             ; 3
    BNE    .notUsedTwo     ; 2³
    JSR    $F38A           ; 6
    BCS    .notUsedOne     ; 2³
    SEC                    ; 2
    LDA    $8D             ; 3
    SBC.w  $89             ; 4
.notUsedOne:
    CMP    #$0A            ; 2
    BCC    LFE0D           ; 2³+1
    JMP    $F363           ; 3
.notUsedTwo:
    INC    $D2             ; 5
    JSR    $F38A           ; 6
    BCS    .notUsedThree   ; 2³
    SEC                    ; 2
    LDA    $8D             ; 3
    SBC.w  $89             ; 4
.notUsedThree:
    CMP    #$0B            ; 2
    BCS    .notUsedFour    ; 2³
    JMP    $F363           ; 3
.notUsedFour:
    JSR    $F3D6           ; 6
    BCC    .notUsedFive    ; 2³
    JSR    $F3E1           ; 6
    JSR    $F47D           ; 6
    JMP    $F3CF           ; 3
.notUsedFive:
    JSR    $F3E1           ; 6
    JSR    $F473           ; 6
    STX    $8C             ; 3
    STY    $8D             ; 3
    JMP    $F57C           ; 3
    SEC                    ; 2
    LDA    $88             ; 3
    SBC.w  $8C             ; 4
    LDX    $8C             ; 3
    LDY    $8D             ; 3
    RTS                    ; 6

    LDA    $86             ; 3
    JSR    $F4AB           ; 6
    STA    $86             ; 3
    JSR    $F922           ; 6
   .byte $A9               ;

  ELSE

    .byte $FF ; |XXXXXXXX| $FD7B
    .byte $FF ; |XXXXXXXX| $FD7C
    .byte $FF ; |XXXXXXXX| $FD7D
    .byte $FF ; |XXXXXXXX| $FD7E
    .byte $FF ; |XXXXXXXX| $FD7F
    .byte $FF ; |XXXXXXXX| $FD80
    .byte $00 ; |        | $FD81
    .byte $7D ; | XXXXX X| $FD82
    .byte $6D ; | XX XX X| $FD83
    .byte $6D ; | XX XX X| $FD84
    .byte $79 ; | XXXX  X| $FD85
    .byte $6C ; | XX XX  | $FD86
    .byte $6C ; | XX XX  | $FD87
    .byte $7D ; | XXXXX X| $FD88
    .byte $00 ; |        | $FD89
    .byte $9F ; |X  XXXXX| $FD8A
    .byte $9B ; |X  XX XX| $FD8B
    .byte $9A ; |X  XX X | $FD8C
    .byte $98 ; |X  XX   | $FD8D
    .byte $98 ; |X  XX   | $FD8E
    .byte $3E ; |  XXXXX | $FD8F
    .byte $98 ; |X  XX   | $FD90
    .byte $00 ; |        | $FD91
    .byte $3E ; |  XXXXX | $FD92
    .byte $36 ; |  XX XX | $FD93
    .byte $36 ; |  XX XX | $FD94
    .byte $30 ; |  XX    | $FD95
    .byte $30 ; |  XX    | $FD96
    .byte $36 ; |  XX XX | $FD97
    .byte $3E ; |  XXXXX | $FD98
    .byte $00 ; |        | $FD99
    .byte $F9 ; |XXXXX  X| $FD9A
    .byte $DB ; |XX XX XX| $FD9B
    .byte $DB ; |XX XX XX| $FD9C
    .byte $D8 ; |XX XX   | $FD9D
    .byte $DB ; |XX XX XX| $FD9E
    .byte $DB ; |XX XX XX| $FD9F
    .byte $F8 ; |XXXXX   | $FDA0

    LDA    COLUP1          ; 3
    AND    #$80            ; 2
    BEQ    LFDC1           ; 2³
    LDA    #$20            ; 2
    STA    $D9             ; 3
    LDA    #$98            ; 2
    STA    $BE             ; 3
    LDA    #$14            ; 2
    STA    $BF             ; 3
    LDA    #$E0            ; 2
    STA    $84             ; 3
    JSR    $FEA2           ; 6  jumps into a "filled" byte area (ie all are $FF)
    LDA    #$AA            ; 2
    ORA    $DE             ; 3
    STA    $DE             ; 3
LFDC0:
    RTS                    ; 6

LFDC1:
    LDA    VSYNC           ; 3
    AND    #$80            ; 2
    BEQ    LFDC0           ; 2³
LFDC7:
    LDX    $CA             ; 3
    LDA    $8D,X           ; 4
    CMP    #$98            ; 2
    BNE    LFDD0           ; 2³
    RTS                    ; 6

LFDD0:
    LDA    #$10            ; 2
    STA    $D9             ; 3
    JSR    $FEA2           ; 6  jumps into a "filled" byte area (ie all are $FF)
    RTS                    ; 6

;filled bytes ($FDD8 - $FDFF)
    REPEAT ($FE00-*)
    .byte $FF
    REPEND

  ENDIF
;===============================

    ORG $FE00

LFE00 SUBROUTINE
    CLC                    ; 2
    ADC    #$2E            ; 2
    TAY                    ; 2
    AND    #$0F            ; 2
    STA.w  $80             ; 4
    TYA                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
LFE0D:
    LSR                    ; 2
    TAY                    ; 2
    CLC                    ; 2
    ADC.w  $80             ; 4
    CMP    #$0F            ; 2
    BCC    LFE1A           ; 2³
    SBC    #$0F            ; 2
    INY                    ; 2
LFE1A:
    EOR    #$07            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    HMP0,X          ; 4
    STA    WSYNC           ; 3
LFE24:
    DEY                    ; 2
    BPL    LFE24           ; 2³
    STA    RESP0,X         ; 4
    RTS                    ; 6

LFE2A SUBROUTINE
    LDA    #0              ; 2
    STA    HMP0            ; 3
    STA    WSYNC           ; 3
;-------------------------------
;===============================
  IF FUNVISION
    STA    HMOVE           ; 3
  ENDIF
;===============================
    STA    RESBL           ; 3
    LDX    #0              ; 2
    STX    PF0             ; 3
    STX    PF1             ; 3
    STX    PF2             ; 3
    STX    COLUPF          ; 3
    INX                    ; 2
    STX    NUSIZ0          ; 3
    STA    RESP0           ; 3
    STA    RESP1           ; 3
    STX    NUSIZ1          ; 3
    LDA    #$30            ; 2
;===============================
  IF FUNVISION
    STA    HMCLR           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
  ELSE
    STA    WSYNC           ; 3
  ENDIF
;===============================
    STA    HMBL            ; 3
    LSR                    ; 2
    STA    HMP1            ; 3
    LDA    #$0C            ; 2
    STA    COLUP1          ; 3
    STA    COLUP0          ; 3
    LDX    #7              ; 2
    LDA    #0              ; 2
    STA    REFP0           ; 3
    STA    REFP1           ; 3
;===============================
  IF FUNVISION
    STA    HMCLR           ; 3
  ENDIF
;===============================
.loopDrawLogo:
    STA    WSYNC           ; 3
;-------------------------------
    NOP                    ; 2
    LDA    LogoOne,X       ; 4
    STA.w  $1B             ; 4
    LDA    LogoTwo,X       ; 4
    STA    GRP1            ; 3
    NOP                    ; 2
    LDA    LogoFour,X      ; 4
    TAY                    ; 2
    LDA    LogoThree,X     ; 4
    STA    GRP0            ; 3
    STY    GRP1            ; 3
    DEX                    ; 2
    BPL    .loopDrawLogo   ; 2³
    STA    WSYNC           ; 3
;-------------------------------
    RTS                    ; 6
;===============================
  IF FUNVISION
LogoOne:
    .byte $00 ; |        | $FE84
    .byte $9D ; |X  XXX X| $FE85
    .byte $95 ; |X  X X X| $FE86
    .byte $95 ; |X  X X X| $FE87
    .byte $F5 ; |XXXX X X| $FE88
    .byte $95 ; |X  X X X| $FE89
    .byte $80 ; |X       | $FE8A
    .byte $E0 ; |XXX     | $FE8B
LogoTwo:
    .byte $00 ; |        | $FE8C
    .byte $28 ; |  X X   | $FE8D
    .byte $6C ; | XX XX  | $FE8E
    .byte $EE ; |XXX XXX | $FE8F
    .byte $AA ; |X X X X | $FE90
    .byte $29 ; |  X X  X| $FE91
    .byte $00 ; |        | $FE92
    .byte $00 ; |        | $FE93
LogoThree:
    .byte $00 ; |        | $FE94
    .byte $BA ; |X XXX X | $FE95
    .byte $8A ; |X   X X | $FE96
    .byte $BA ; |X XXX X | $FE97
    .byte $A2 ; |X X   X | $FE98
    .byte $38 ; |  XXX   | $FE99
    .byte $82 ; |X     X | $FE9A
    .byte $00 ; |        | $FE9B
LogoFour:
    .byte $00 ; |        | $FE9C
    .byte $E9 ; |XXX X  X| $FE9D
    .byte $AB ; |X X X XX| $FE9E
    .byte $AF ; |X X XXXX| $FE9F
    .byte $AD ; |X X XX X| $FEA0
    .byte $E9 ; |XXX X  X| $FEA1
    .byte $00 ; |        | $FEA2
    .byte $00 ; |        | $FEA3

;never used?
    LDA    $AA             ; 3
    STA    $AC             ; 3
    LDA    $AB             ; 3
    BEQ    LFF13           ; 2³+1
    JSR    LF846           ; 6
    CMP    #2              ; 2
    BCC    LFE84           ; 2³
    CMP    #7              ; 2
    BEQ    LFEE9           ; 2³
    BCC    LFF1A           ; 2³+1
    CMP    #$0E            ; 2
    BCS    LFE84           ; 2³
    CMP    #9              ; 2
    BCC    LFED1           ; 2³
    LDA    $84             ; 3
    CMP    #$A8            ; 2
    BEQ    LFECE           ; 2³
    CMP    #$D8            ; 2
    BEQ    LFECE           ; 2³
    JMP    LF6BB           ; 3
LFECE:
    JMP    LF66E           ; 3
LFED1:
    SEC                    ; 2
    LDA    $AB             ; 3
    SBC.w  $AC             ; 4
    BEQ    LFF1A           ; 2³+1
    BCC    LFEE2           ; 2³
    LDA    #0              ; 2
    STA    $AC             ; 3
    JMP    LF704           ; 3
LFEE2:
    LDA    #0              ; 2
    STA    $AB             ; 3
    JMP    LF704           ; 3
LFEE9:
    JSR    LF855           ; 6
    CMP    #4              ; 2
    BCS    LFF1A           ; 2³+1
    LDA    $AB             ; 3
    CMP    #$20            ; 2
    BEQ    LFF03           ; 2³+1
    LDA    $AC             ; 3
    CMP    #$20            ; 2
    BNE    LFF1A           ; 2³+1
    LDA    #$60            ; 2
    STA    $AC             ; 3
    JMP    LF6CC           ; 3
LFF03:
    LDA    $AC             ; 3
    CMP    #$20            ; 2
    BEQ    LFF10           ; 2³
    LDA    #$60            ; 2
    STA    $AB             ; 3
    JMP    LF6C5           ; 3
LFF10:
    JMP    LF704           ; 3
LFF13:
    LDA    $AC             ; 3
    BEQ    LFF1D           ; 2³
    JMP    LF696           ; 3
LFF1A:
    JSR    LF865           ; 6
LFF1D:
    JSR    LF7CC           ; 6
    LDA    $AB             ; 3
    CMP    #0              ; 2
    BEQ    LFF4E           ; 2³
    CMP.w  $AC             ; 4
    BCC    LFF54           ; 2³
    CMP    #$10            ; 2
    BEQ    LFF79           ; 2³
    CMP    #$15            ; 2
    BEQ    LFF88           ; 2³
    CMP    #$20            ; 2
    BEQ    LFF97           ; 2³
    LDA    #$48            ; 2
    STA    $86             ; 3
    LDA    #$FC            ; 2
    STA    $87             ; 3
    LDA    #$30            ; 2
    STA    $84             ; 3
    LDA    #$FB            ; 2
    STA    $85             ; 3
    LDA    #$40            ; 2
    STA    $B4             ; 3
    JMP    LF7BD           ; 3
LFF4E:
    LDA    $AC             ; 3
    CMP    #0              ; 2
    BEQ    LFF85           ; 2³
LFF54:
    LDA    $AC             ; 3
    CMP    #$10            ; 2
    BEQ    LFFA6           ; 2³
    CMP    #$15            ; 2
    BEQ    LFFB5           ; 2³
    CMP    #$20            ; 2
    BEQ    LFFC4           ; 2³
    LDA    #$48            ; 2
    STA    $84             ; 3
    LDA    #$FC            ; 2
    STA    $85             ; 3
    LDA    #$30            ; 2
    STA    $86             ; 3
    LDA    #$FB            ; 2
    STA    $87             ; 3
    LDA    #$40            ; 2
    STA    $B4             ; 3
    JMP    LF7BD           ; 3
LFF79:
    LDA    #2              ; 2
    STA    AUDC0           ; 3
    LDA    #$B2            ; 2
    STA    AUDF0           ; 3
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
LFF85:
    JMP    LF7DB           ; 3
LFF88:
    LDA    #8              ; 2
    STA    AUDC0           ; 3
    LDA    #$F5            ; 2
    STA    AUDF0           ; 3
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
    JMP    LF7DB           ; 3
LFF97:
    LDA    #8              ; 2
    STA    AUDC0           ; 3
    LDA    #$D4            ; 2
    STA    AUDF0           ; 3
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
    JMP    LF7DB           ; 3
LFFA6:
    LDA    #2              ; 2
    STA    AUDC1           ; 3
    LDA    #$A8            ; 2
    STA    AUDF1           ; 3
    LDA    #$0F            ; 2
    STA    AUDV1           ; 3
    JMP    LF7DB           ; 3
LFFB5:
    LDA    #8              ; 2
    STA    AUDC1           ; 3
    LDA    #$B4            ; 2
    STA    AUDF1           ; 3
    LDA    #$0E            ; 2
    STA    AUDV1           ; 3
    JMP    LF7DB           ; 3
LFFC4:
    LDA    #8              ; 2
    STA    AUDC1           ; 3
    LDA    #$B6            ; 2
    STA    AUDF1           ; 3
    LDA    #$0F            ; 2
    STA    AUDV1           ; 3
    JMP    LF7DB           ; 3
    LDA    #$0F            ; 2
    STA    AUDC1           ; 3
    LDA    #$38            ; 2
    STA    AUDF1           ; 3
    LDA    #$0F            ; 2
    STA    AUDV1           ; 3
    JMP    LF7DB           ; 3
    LDA    #0              ; 2
    STA    AUDC1           ; 3
    STA    AUDF0           ; 3
    STA    AUDF1           ; 3
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    STA    AUDC0           ; 3
    RTS                    ; 6

    .byte $A5 ; |X X  X X| $FFF1
    .byte $AB ; |X X X XX| $FFF2
    .byte $F0 ; |XXXX    | $FFF3
    .byte $77 ; | XXX XXX| $FFF4
    .byte $77 ; | XXX XXX| $FFF5
    .byte $77 ; | XXX XXX| $FFF6
    .byte $60 ; | XX     | $FFF7
    .byte $09 ; |    X  X| $FFF8
    .byte $00 ; |        | $FFF9
    .byte $00 ; |        | $FFFA
    .byte $4A ; | X  X X | $FFFB

  ELSE

;empty bytes ($FE7C - $FE9B)
    REPEAT ($FE9C-*)
    .byte $00
    REPEND

;filled bytes ($FE9C - $FEFF)
    REPEAT ($FF00-*)
    .byte $FF
    REPEND

    ORG $FF00

;code from an earlier version or a different game?
    CLD                    ; 2
    LDX    #0              ; 2
    LDA    #0              ; 2
LFF05:
    STA    VSYNC,X         ; 4
    TXS                    ; 2
    INX                    ; 2
    BNE    LFF05           ; 2³
    LDA    #$20            ; 2
    STA    TIM64T          ; 4
    JSR    $FFA2           ; 6  jumps in between an instruction and its argument
    JSR    $FB11           ; 6  jumps in between an instruction and its argument
    LDA    #1              ; 2
    STA    $AB             ; 3
    LDA    #0              ; 2
    STA    $CB             ; 3
    JSR    $FCA0           ; 6  improbable
    LDA    #$20            ; 2
    STA    $E1             ; 3
    LDA    #1              ; 2
    STA    $EC             ; 3
    STA    $ED             ; 3
    JSR    $FF81           ; 6  jumps in between an instruction and its argument
    LDA    $D3             ; 3
    LDX    #3              ; 2
    JSR    $FED2           ; 6  jumps into a "filled" byte area (ie all are $FF)
    LDA    SWCHB           ; 4
    AND    #$02            ; 2
    BNE    LFF68           ; 2³
    LDA    $E1             ; 3
    CMP    #$88            ; 2
    BCS    LFF58           ; 2³
    LDX    $AB             ; 3
    INX                    ; 2
    CPX    #7              ; 2
    BCC    LFF4B           ; 2³
    LDX    #1              ; 2
LFF4B:
    STX    $AB             ; 3
    LDA    #0              ; 2
    STA    $B2             ; 3
    LDA    #$88            ; 2
    STA    $E1             ; 3
    JMP    $F076           ; 3  jumps in between an instruction and its argument
LFF58:
    LDA    $AB             ; 3
    STA    $83             ; 3
    LDA    #0              ; 2
    STA    $81             ; 3
    STA    $82             ; 3
    JSR    $FB8E           ; 6  jumps into the middle of some graphics
    JMP    $F04D           ; 3
LFF68:
    LDA    $E1             ; 3
    BEQ    LFF73           ; 2³
    AND    #$7F            ; 2
    STA    $E1             ; 3
    JMP    $F076           ; 3  jumps in between an instruction and its argument
LFF73:
    JSR    $F5B0           ; 6  improbable
LFF76:
    LDA    INTIM           ; 4
    BNE    LFF76           ; 2³
    LDA    $C6             ; 3
    LDX    #2              ; 2
    JSR    $FED2           ; 6  jumps into a "filled" byte area (ie all are $FF)
    STA    CXCLR           ; 3
    LDA    #0              ; 2
    STA    $BA             ; 3
    STA    $B7             ; 3
    LDA    $BE             ; 3
    STA    $B5             ; 3
    LDA    $C5             ; 3
    STA    $B8             ; 3
    JSR    $FB2C           ; 6  improbable
    LDA    $C3             ; 3
    LDX    #1              ; 2
    JSR    $FED2           ; 6  jumps into a "filled" byte area (ie all are $FF)
    LDA.w  $BC             ; 4
    LDX    #0              ; 2
    JSR    $FED2           ; 6  jumps into a "filled" byte area (ie all are $FF)
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    $EB             ; 3
    CMP    #2              ; 2
    BCC    LFFDE           ; 2³
    BEQ    LFFC7           ; 2³
    LDA    #1              ; 2
    STA    $F1             ; 3
    LDA    #$2C            ; 2
    STA    $F3             ; 3
    LDA    #$57            ; 2
    STA    $F5             ; 3
    LDA    #$FF            ; 2
    STA    $F2             ; 3
    STA    $F4             ; 3
    STA    $F6             ; 3
    JMP    $F0F2           ; 3  jumps in between an instruction and its argument
LFFC7:
    LDA    #1              ; 2
    STA    $F1             ; 3
    LDA    #$2C            ; 2
    STA    $F3             ; 3
    LDA    #$57            ; 2
    STA    $F5             ; 3
    LDA    #$FE            ; 2
    STA    $F2             ; 3
    STA    $F4             ; 3
    STA    $F6             ; 3
    JMP    $F0F2           ; 3  jumps in between an instruction and its argument
LFFDE:
    LDA    #1              ; 2
    STA    $F1             ; 3
    LDA    #$2C            ; 2
    STA    $F3             ; 3
    LDA    #$57            ; 2
    STA    $F5             ; 3
    LDA    #$FD            ; 2
    STA    $F2             ; 3
    STA    $F4             ; 3
    STA    $F6             ; 3
    LDY    #$29            ; 2
    STY    $80             ; 3
    LDX    #$7E            ; 2
    LDA    #$24            ; 2
    STA    $F0             ; 3

    ENDIF

    ORG $FFFC
    .word START,START