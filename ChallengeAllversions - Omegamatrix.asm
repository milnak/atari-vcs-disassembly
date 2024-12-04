; Disassembly of chall(z).bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line:    C:\DISTELLA.EXE -pafscchallZ.cfg chall(z).bin
;
; challZ.cfg contents:
;
;      ORG F000
;      CODE F000 F24B
;      DATA F24C F2FF
;      CODE F300 FA5D
;      DATA FA5E FA6D
;      CODE FA6E FB97
;      DATA FB98 FC03
;      GFX FC04 FC87
;      DATA FC88 FCFF
;      GFX FD00 FD67
;      DATA FD68 FDFF
;      GFX FE00 FE48
;      DATA FE49 FEFF
;      GFX FF00 FF7F
;      DATA FF80 FFFB
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
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
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
HMP1    =  $21
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;==================================================================================================
;        SWITCHES
;==================================================================================================
; only one on at a time!
; 0 = off, 1 = on

ZELLERS         = 1
HES             = 0
NTSC_UNKNOWN    = 0
QUELLE          = 0
TWO_ZERO_EIGHT  = 0

;==================================================================================================
;        USER CONSTANTS
;==================================================================================================
TIME_OVERSCAN   = $22

  IF ZELLERS
PAL             = 0
BIT_ROT         = 0
FUNVISION       = 1
TIME_ONE        = $1F
TIME_TWO        = $AA
TIME_THREE      = $1F
UNK_01          = $09
UNK_02          = $45
UNK_03          = $3C  ; someting to do with bars
UNK_04          = $46  ; some type of v postion for screen
UNK_05          = $41
UNK_06          = $43
VPOS_MOUSE_1    = $0E
VPOS_MOUSE_2    = $18
VPOS_MOUSE_3    = $22
VPOS_MOUSE_4    = $2C
VPOS_MOUSE_5    = $36
VPOS_MOUSE_6    = $40
  ELSE
TIME_TWO        = $C8
UNK_01          = $0A
UNK_02          = $4C
UNK_03          = $42
UNK_04          = $4D
UNK_05          = $48
UNK_06          = $4A
VPOS_MOUSE_1    = $10
VPOS_MOUSE_2    = $1B
VPOS_MOUSE_3    = $26
VPOS_MOUSE_4    = $31
VPOS_MOUSE_5    = $3C
VPOS_MOUSE_6    = $47
  ENDIF

  IF HES
PAL             = 1
BIT_ROT         = 0
FUNVISION       = 1
TIME_ONE        = $2C
TIME_THREE      = $2A
UNK_13          = $2C
UNK_14          = $4C
  ELSE
UNK_13          = $01
UNK_14          = $A9
  ENDIF

  IF NTSC_UNKNOWN
PAL             = 1
BIT_ROT         = 1
FUNVISION       = 0
TIME_ONE        = $16
TIME_THREE      = $16
  ENDIF
  
  IF QUELLE
PAL             = 1
BIT_ROT         = 1
FUNVISION       = 0
TIME_ONE        = $2C
TIME_THREE      = $2A
  ENDIF

  IF TWO_ZERO_EIGHT
PAL             = 1
BIT_ROT         = 1
FUNVISION       = 0
TIME_ONE        = $2C
TIME_THREE      = $2A
  ENDIF

;==================================================================================================
;        RAM LOCATIONS
;==================================================================================================

;==================================================================================================
;        MAIN PROGRAM
;==================================================================================================

    ORG $F000

START:
    CLD                    ;
;===============================
  IF BIT_ROT
    .byte $E2,$00          ;
  ELSE
    LDX    #0              ;
  ENDIF
;===============================
    LDA    #0              ;
.loopClear:
    STA    0,X             ;
    TXS                    ;
    INX                    ;
    BNE    .loopClear      ;

    LDA    #TIME_OVERSCAN  ; 2
    STA    TIM64T          ; 4
    JSR    LFA6E           ; 6
    LDA    #$76            ; 2
    STA    $B7             ; 3
Finish_Overscan:
.loopOverscan
    LDA    INTIM           ;
    BNE    .loopOverscan   ;
    LDA    #$82            ; 2
    STA    WSYNC           ; 3
    STA    VBLANK          ; 3   start Vblank
;===============================
  IF PAL
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
  ENDIF
;===============================
    STA    VSYNC           ; 3
    STA    WSYNC           ; 3
    INC    $CD             ; 5
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    LDA    #0              ; 2
    STA    VSYNC           ; 3
    STA    VBLANK          ; 3   stop Vblank
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    LDA    #TIME_ONE       ; 2
    STA    TIM64T          ; 4
;read select switch
    LDA    SWCHB           ; 4
    AND    #$02            ; 2
    BNE    .switchNotPressed ; 2³
    LDA    #$4C            ; 2
    STA    $B9             ; 3
    STA    $B7             ; 3
    JMP    LF073           ; 3
.switchNotPressed:
    LDA    $B7             ; 3
    BEQ    .checkResetSwitch ; 2³
    LDA    $B9             ; 3
    BEQ    LF073           ; 2³
    LDA    $B7             ; 3
    CMP    #$48            ; 2
    BEQ    LF073           ; 2³
    LDA    #0              ; 2
    STA    $B9             ; 3
    STA    $BD             ; 3
    STA    $BE             ; 3
    INC    $BF             ; 5
    LDA    $BF             ; 3
    CMP    #3              ; 2
    BCC    LF073           ; 2³
    LDA    #1              ; 2
    STA    $BF             ; 3
LF073:
    LDA    #6              ; 2
    STA    $E1             ; 3
    LDA    #1              ; 2
    STA    $B6             ; 3
    STA    $E3             ; 3
    STA    $80             ; 3
    LDA    #0              ; 2
    STA    $E2             ; 3
    LDA    $BF             ; 3
    CMP    #2              ; 2
    BNE    .checkResetSwitch ; 2³
    LDA    #6              ; 2
    STA    $E2             ; 3
    LDA    #1              ; 2
    STA    $E4             ; 3
.checkResetSwitch:
    LDA    SWCHB           ; 4
    AND    #$01            ; 2
    BNE    .ResetNotPressed ; 2³
    JSR    LFA6E           ; 6
.ResetNotPressed:
    LDA    $B7             ; 3
    BEQ    LF0A8           ; 2³
    LDA    REFP1           ; 3
    AND    #$80            ; 2
    BNE    LF0A8           ; 2³
    JSR    LFA6E           ; 6
LF0A8:
    LDA    #2              ; 2
    AND    $CD             ; 3
    BEQ    LF0DE           ; 2³
    LDA    #1              ; 2
    STA    $CB             ; 3
    LDA    #UNK_01         ; 2
    STA    $CC             ; 3
    LDA    #1              ; 2
    AND    $CD             ; 3
    BNE    LF0CD           ; 2³
    LDA    #$47            ; 2
    LDX    #2              ; 2
    JSR    LF653           ; 6
    LDA    #$73            ; 2
    LDX    #4              ; 2
    JSR    LF653           ; 6
    JMP    LF10B           ; 3
LF0CD:
    LDA    #$1B            ; 2
    LDX    #2              ; 2
    JSR    LF653           ; 6
    LDA    #$47            ; 2
    LDX    #4              ; 2
    JSR    LF653           ; 6
    JMP    LF10B           ; 3
LF0DE:
    LDA    #UNK_02         ; 2
    STA    $CC             ; 3
    LDA    #UNK_03         ; 2
    STA    $CB             ; 3
    LDA    #1              ; 2
    AND    $CD             ; 3
    BNE    LF0FD           ; 2³, if PAL 2³+1 (crosses page boundary)
    LDA    #$5D            ; 2
    LDX    #2              ; 2
    JSR    LF653           ; 6
    LDA    #$89            ; 2
    LDX    #4              ; 2
    JSR    LF653           ; 6
    JMP    LF10B           ; 3
LF0FD:
    LDA    #$31            ; 2
    LDX    #2              ; 2
    JSR    LF653           ; 6
    LDA    #$5D            ; 2
    LDX    #4              ; 2
    JSR    LF653           ; 6
LF10B:
    LDA    $92             ; 3
    ORA    $93             ; 3
    BNE    LF116           ; 2³
    STA    WSYNC           ; 3
    JMP    LF159           ; 3
LF116:
    LDA    $CE             ; 3
    BEQ    LF145           ; 2³
    DEC    $94             ; 5
    BNE    LF159           ; 2³
    LDX    $B6             ; 3
    CPX    #1              ; 2
    BEQ    LF128           ; 2³
    LDX    #3              ; 2
    BNE    LF12A           ; 2³
LF128:
    LDX    #0              ; 2
LF12A:
    CLC                    ; 2
    SED                    ; 2
    LDA    #$0A            ; 2
    ADC    $BF,X           ; 4
    STA    $BF,X           ; 4
    LDA    $BE,X           ; 4
    ADC    #0              ; 2
    STA    $BE,X           ; 4
    LDA    $BD,X           ; 4
    ADC    #0              ; 2
    STA    $BD,X           ; 4
    CLD                    ; 2
    LDA    #2              ; 2
    STA    $94             ; 3
    BNE    LF149           ; 2³
LF145:
    DEC    $94             ; 5
    BNE    LF159           ; 2³
LF149:
    SEC                    ; 2
    SED                    ; 2
    LDA    $93             ; 3
    SBC    #1              ; 2
    STA    $93             ; 3
    BCS    LF159           ; 2³
    DEC    $92             ; 5
    LDA    #$59            ; 2
    STA    $93             ; 3
LF159:
    CLD                    ; 2
    LDA    $92             ; 3
    JSR    LF64C           ; 6
    STA    $82             ; 3
    LDA    $93             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    JSR    LF64C           ; 6
    STA    $84             ; 3
    LDA    $93             ; 3
    AND    #$0F            ; 2
    JSR    LF64C           ; 6
    STA    $86             ; 3
    LDA    #0              ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    LDA    #$FF            ; 2
    STA    $83             ; 3
    STA    $85             ; 3
    STA    $87             ; 3
    LDA    $94             ; 3
    BNE    LF189           ; 2³
    LDA    #$28            ; 2
LF189:
    STA    $94             ; 3
    LDA    #$3C            ; 2
    LDX    #0              ; 2
    JSR    LF653           ; 6
    LDA    #$44            ; 2
    LDX    #1              ; 2
    JSR    LF653           ; 6
    LDA    #1              ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDA    #$1C            ; 2
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDY    #7              ; 2
LF1A7:
    LDA    INTIM           ; 4
    BNE    LF1A7           ; 2³
    LDA    #$32            ; 2
    STA    TIM64T          ; 4
LF1B1:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    ($82),Y         ; 5
    STA    GRP0            ; 3
    LDA    Colon,Y         ; 4
    STA    GRP1            ; 3
    LDA    ($86),Y         ; 5
    STA    $8C             ; 3
    LDX    $8C             ; 3
    DEC    $B5             ; 5
    NOP                    ; 2
    NOP                    ; 2
    LDA    ($84),Y         ; 5
    STA    GRP0            ; 3
    STX    GRP1            ; 3
    STA    HMCLR           ; 3
    DEY                    ; 2
    BPL    LF1B1           ; 2³
    LDA    #0              ; 2
    STA    GRP1            ; 3
    STA    GRP0            ; 3
    LDA    #$1A            ; 2
    LDX    #0              ; 2
    LDY    #$46            ; 2
    JSR    LF587           ; 6
    LDA    #$2A            ; 2
    LDX    #3              ; 2
    LDY    #$56            ; 2
    JSR    LF587           ; 6
    JSR    LFACB           ; 6
    LDA    $8E             ; 3
    LDX    #0              ; 2
    JSR    LF653           ; 6
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #$FD            ; 2
    STA    $C7             ; 3
    STA    $C9             ; 3
    LDA    $CF             ; 3
    STA    REFP0           ; 3
    LDA    #0              ; 2
    STA    $CA             ; 3
    LDA    #$1C            ; 2
    STA    COLUPF          ; 3
    LDA    #$C8            ; 2
    STA    COLUP0          ; 3
    LDA    $80             ; 3
    BEQ    LF21D           ; 2³
    CMP    #3              ; 2
    BEQ    LF225           ; 2³
    BCS    LF221           ; 2³
    LDA    #$58            ; 2
    BNE    LF227           ; 2³
LF21D:
    LDA    #$28            ; 2
    BNE    LF227           ; 2³
LF221:
    LDA    #$88            ; 2
    BNE    LF227           ; 2³
LF225:
    LDA    #$48            ; 2
LF227:
    STA    COLUP1          ; 3
    STA    CXCLR           ; 3
    LDA    #1              ; 2
    STA    CTRLPF          ; 3
    LDA    #0              ; 2
    STA    $C4             ; 3
    STA    $C5             ; 3
    LDX    #UNK_04         ; 2
    STA    HMCLR           ; 3
LF239:
    LDA    INTIM           ; 4
    BNE    LF239           ; 2³
    LDA    #$FF            ; 2
    STA    ENAM0           ; 3
    STA    ENABL           ; 3
    LDA    #TIME_TWO       ; 2
    STA    TIM64T          ; 4
    JMP    LF326           ; 3

;===============================
  IF ZELLERS
    .byte $AA,$8D,$5E,$AA,$60,$A9
  ENDIF
;===============================
    .byte $00,$8D,$B3,$AA,$A5,$44,$48,$20,$16,$A3,$68,$8D,$57,$AA,$4C,$D4
    .byte $A7,$A9,$05,$20,$AA,$A2,$20,$64,$A7,$A0,$00,$98,$91,$40,$60,$A9
    .byte $07,$D0,$02,$A9,$08,$20,$AA,$A2,$4C,$EA,$A2,$A9,$0C,$D0,$F6,$AD
    .byte $08,$9D,$8D,$BD,$B5,$AD,$09,$9D,$8D,$BE,$B5,$A9,$09,$8D,$63,$AA
    .byte $20,$C8,$A2,$4C,$EA,$A2,$20,$A3,$A2,$20,$8C,$A6,$D0,$FB,$4C,$71
    .byte $B6,$A9,$00,$4C,$D5,$A3,$A9,$01,$8D,$63,$AA,$AD,$6C,$AA,$D0,$0A
    .byte $AD,$6D,$AA,$D0,$05,$A9,$01,$8D,$6C,$AA,$AD,$6C,$AA,$8D,$BD,$B5
    .byte $AD,$6D,$AA,$8D,$BE,$B5,$20,$EA,$A2,$A5,$45,$D0,$03,$4C,$C8,$A6
    .byte $85,$41,$A5,$44,$85,$40,$20,$43,$A7,$20,$4E,$A7,$20,$1A,$A7,$AD
    .byte $63,$AA,$8D,$BB,$B5,$4C,$A8,$A6,$AD,$75,$AA,$C9,$A0,$F0,$25,$20
    .byte $64,$A7,$B0,$3A,$20,$FC,$A2,$4C,$EA,$A2,$20,$AF,$A7,$D0

LF300:
    LDY    $CA             ; 3
    LDA.wy $AF,Y           ; 4
    STA    REFP1           ; 3
    JMP    LF3AF           ; 3
LF30A:
    CPX    $8F             ; 3
    BNE    LF33D           ; 2³
    LDA    #$0F            ; 2
    STA    $C4             ; 3
    JMP    LF33D           ; 3
LF315:
    LDY    $C5             ; 3
    BMI    LF300           ; 2³
    LDA    ($C6),Y         ; 5
    DEC    $C5             ; 5
    STA    GRP1            ; 3
    STA    HMCLR           ; 3
    STA    WSYNC           ; 3
    JMP    LF3B1           ; 3
LF326:
    LDA    LFE00,X         ; 4
    STA    WSYNC           ; 3
LF32B:
    STA    PF1             ; 3
    STA    PF2             ; 3
    ORA    #$10            ; 2
    STA    PF0             ; 3
    LDY    $C4             ; 3
    BMI    LF30A           ; 2³
    LDA    ($C8),Y         ; 5
    STA    GRP0            ; 3
    DEC    $C4             ; 5
LF33D:
    LDY    $CA             ; 3
    TXA                    ; 2
    CMP.wy $9B,Y           ; 4
    BNE    LF315           ; 2³
    LDA    #8              ; 2
    STA    $C5             ; 3
    LDA.wy $A9,Y           ; 4
    STA    NUSIZ1          ; 3
    LDA.wy $95,Y           ; 4
    CMP    #$4B            ; 2
    BCC    LF386           ; 2³
    SEC                    ; 2
    SBC    #$4B            ; 2
    STA    WSYNC           ; 3
LF35A:
    SBC    #$0F            ; 2
    BCS    LF35A           ; 2³
    EOR    #$07            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA.w  HMP1            ; 4
    LDY    $C4             ; 3
    BMI    LF380           ; 2³
    LDA    ($C8),Y         ; 5
    STA    GRP0            ; 3
    DEC    $C4             ; 5
LF371:
    DEX                    ; 2
    INC    $CA             ; 5
    STA.w  RESP1           ; 4
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #0              ; 2
    JMP    LF32B           ; 3
LF380:
    PLA                    ; 4
    PHA                    ; 3
    SEC                    ; 2
    JMP    LF371           ; 3
LF386:
    SEC                    ; 2
    STA    WSYNC           ; 3
LF389:
    SBC    #$0F            ; 2
    BCS    LF389           ; 2³
    EOR    #$07            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA.w  HMP1            ; 4
    STA.w  RESP1           ; 4
    DEX                    ; 2
    LDY    $C4             ; 3
    BMI    LF3A4           ; 2³
    LDA    ($C8),Y         ; 5
    STA    GRP0            ; 3
    DEC    $C4             ; 5
LF3A4:
    INC    $CA             ; 5
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #0              ; 2
    JMP    LF32B           ; 3
LF3AF:
    STA    WSYNC           ; 3
LF3B1:
    LDY    $C4             ; 3
    BMI    LF3BB           ; 2³
    LDA    ($C8),Y         ; 5
    STA    GRP0            ; 3
    DEC    $C4             ; 5
LF3BB:
    CPX    $CB             ; 3
    BNE    LF3C4           ; 2³
    LDA    #$FF            ; 2
    JMP    LF3CA           ; 3
LF3C4:
    CPX    $CC             ; 3
    BNE    LF3CE           ; 2³
    LDA    #0              ; 2
LF3CA:
    STA    ENAM0           ; 3
    STA    ENABL           ; 3
LF3CE:
    LDY    $C5             ; 3
    BMI    LF3D8           ; 2³
    LDA    ($C6),Y         ; 5
    STA    GRP1            ; 3
    DEC    $C5             ; 5
LF3D8:
    DEX                    ; 2
    BMI    LF3DE           ; 2³
    JMP    LF326           ; 3
LF3DE:
    LDA    #0              ; 2
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    STA    ENABL           ; 3
    STA    REFP0           ; 3
    STA    REFP1           ; 3
    STA    WSYNC           ; 3
;-------------------------------
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
LF3F2:
    LDA    INTIM           ; 4
    BNE    LF3F2           ; 2³
    LDA    $B7             ; 3
    BEQ    LF44D           ; 2³+1
    LDA    #$20            ; 2
    LDX    #0              ; 2
    JSR    LF653           ; 6
    LDA    #$28            ; 2
    LDX    #1              ; 2
    JSR    LF653           ; 6
    STA    WSYNC           ; 3
;-------------------------------
    STA    HMOVE           ; 3
    LDA    #0              ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    PF2             ; 3
    LDA    #1              ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDA    #$0C            ; 2
    STA    COLUP1          ; 3
    STA    COLUP0          ; 3
    LDX    #7              ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    STA    HMCLR           ; 3
LF429:
    STA    WSYNC           ; 3
;-------------------------------
;===============================
  IF HES
    LDA    #0              ; 2
    NOP                    ; 2
    STA    GRP0            ; 3
    LDA    #0              ; 2
    NOP                    ; 2
    STA    GRP1            ; 3
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    LDA    #0              ; 2
    NOP                    ; 2
    TAY                    ; 2
    LDA    #0              ; 2
    NOP                    ; 2
  ELSE
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
  ENDIF

;===============================
    STA    GRP0            ; 3
    STY    GRP1            ; 3
    STA    HMCLR           ; 3
    DEX                    ; 2
    BPL    LF429           ; 2³
    JMP    LF4B0           ; 3
LF44D:
    LDA    #$78            ; 2
    STA    COLUPF          ; 3
    LDX    $B6             ; 3
    DEX                    ; 2
    LDA    $E1,X           ; 4
    STA    WSYNC           ; 3
    STA    $81             ; 3
    LDA    #0              ; 2
    LDY    #4              ; 2
    LDX    $81             ; 3
    BEQ    LF478           ; 2³
    CPX    #8              ; 2
    BCC    LF46A           ; 2³
    LDX    #8              ; 2
    STX    $81             ; 3
LF46A:
    SEC                    ; 2
    ROR                    ; 2
    ROR                    ; 2
    DEX                    ; 2
    BEQ    LF478           ; 2³
    DEY                    ; 2
    BNE    LF46A           ; 2³
    TAY                    ; 2
    LDA    #0              ; 2
    BEQ    LF47F           ; 2³
LF478:
    STA    WSYNC           ; 3
    TAY                    ; 2
    LDA    #0              ; 2
    BEQ    LF485           ; 2³
LF47F:
    SEC                    ; 2
    ROL                    ; 2
    ROL                    ; 2
    DEX                    ; 2
    BNE    LF47F           ; 2³
LF485:
    TAX                    ; 2
    LDA    #6              ; 2
    STA    $82             ; 3
LF48A:
    STA    WSYNC           ; 3
    DEC    $82             ; 5
    BEQ    LF4AA           ; 2³
    LDA    #0              ; 2
    STA    PF0             ; 3
    STY    PF1             ; 3
    STX    PF2             ; 3
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    STA    PF1             ; 3
    STA    PF2             ; 3
    JMP    LF48A           ; 3
LF4AA:
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
LF4B0:
    STA    WSYNC           ; 3
    LDA    #TIME_THREE     ; 2
    STA    TIM64T          ; 4
    LDA    $B7             ; 3
    BEQ    LF4C8           ; 2³
    LDA    #0              ; 2
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    LDA    #$52            ; 2
    STA    $BA             ; 3
    JMP    Finish_Overscan ; 3
LF4C8:
    INC    $B8             ; 5
    LDA    $CE             ; 3
    BEQ    LF51B           ; 2³+1
    LDA    $B8             ; 3
    AND    #$03            ; 2
    BNE    LF50F           ; 2³+1
    DEC    $CE             ; 5
    LDA    $CE             ; 3
    CMP    #2              ; 2
    BNE    LF50F           ; 2³+1
    DEC    $CE             ; 5
    LDX    $B6             ; 3
    DEX                    ; 2
    INC    $E3,X           ; 6
    LDA    $E3,X           ; 4
    CMP    #5              ; 2
    BNE    LF4EB           ; 2³
    LDA    #1              ; 2
LF4EB:
    STA    $E3,X           ; 4
    STA    $80             ; 3
    INC    $E1,X           ; 6
    LDA    $B6             ; 3
    CMP    #1              ; 2
    BEQ    LF4FB           ; 2³
    LDX    #3              ; 2
    BNE    LF4FD           ; 2³
LF4FB:
    LDX    #0              ; 2
LF4FD:
    LDA    #$0A            ; 2
    CLC                    ; 2
    SED                    ; 2
    ADC    $BE,X           ; 4
    STA    $BE,X           ; 4
    LDA    $BD,X           ; 4
    ADC    #0              ; 2
    STA    $BD,X           ; 4
    CLD                    ; 2
    JSR    LFA9A           ; 6
LF50F:
    LDA    $B8             ; 3
    AND    #$0F            ; 2
    BNE    LF536           ; 2³
    JSR    LF9FE           ; 6
    JMP    Finish_Overscan ; 3
LF51B:
    LDA    $E0             ; 3
    BEQ    LF544           ; 2³
    DEC    $E0             ; 5
    LDA    $E0             ; 3
    CMP    #1              ; 2
    BNE    LF52A           ; 2³
    JSR    LF9A7           ; 6
LF52A:
    LDA    $B8             ; 3
    AND    #$07            ; 2
    BNE    LF536           ; 2³
    JSR    LFA32           ; 6
    JMP    Finish_Overscan ; 3
LF536:
    LDA    $BB             ; 3
    BEQ    LF541           ; 2³
    SEC                    ; 2
    SBC    #$FE            ; 2
    STA    $BB             ; 3
    STA    AUDV1           ; 3
LF541:
    JMP    Finish_Overscan ; 3
LF544:
    JSR    LF954           ; 6
    LDA    $B8             ; 3
    AND    #$07            ; 2
    BNE    LF553           ; 2³
    JSR    LF9FE           ; 6
    JMP    LF55E           ; 3
LF553:
    LDA    $BB             ; 3
    BEQ    LF55E           ; 2³
    SEC                    ; 2
    SBC    #1              ; 2
    STA    $BB             ; 3
    STA    AUDV0           ; 3
LF55E:
    LDA    $B8             ; 3
    AND    #$07            ; 2
    BEQ    LF57B           ; 2³
    CMP    #2              ; 2
    BEQ    LF57B           ; 2³
    CMP    #6              ; 2
    BEQ    LF57B           ; 2³
    CMP    #4              ; 2
    BEQ    LF57B           ; 2³
    CMP    #1              ; 2
    BEQ    LF581           ; 2³
    CMP    #5              ; 2
    BEQ    LF581           ; 2³
    JMP    Finish_Overscan ; 3
LF57B:
    JSR    LF7D0           ; 6
    JMP    Finish_Overscan ; 3
LF581:
    JSR    LF665           ; 6
    JMP    Finish_Overscan ; 3

LF587 SUBROUTINE
    STA    WSYNC           ; 3
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDA    #$D0            ; 2
    STA    HMP0            ; 3
    LDA    #$A0            ; 2
    STA    HMP1            ; 3
    NOP                    ; 2
    LDA    #3              ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    STA    RESP0           ; 3
    LDA    $BD,X           ; 4
    AND    #$F0            ; 2
    LSR                    ; 2
    CLC                    ; 2
    ADC    #8              ; 2
    STA    RESP1           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    $82             ; 3
    LDA    $BD,X           ; 4
    AND    #$0F            ; 2
    JSR    LF64C           ; 6
    STA    $84             ; 3
    LDA    $BE,X           ; 4
    AND    #$F0            ; 2
    LSR                    ; 2
    CLC                    ; 2
    ADC    #8              ; 2
    STA    $86             ; 3
    LDA    $BE,X           ; 4
    AND    #$0F            ; 2
    JSR    LF64C           ; 6
    STA    $88             ; 3
    STY    COLUBK          ; 3
    LDA    $BF,X           ; 4
    AND    #$F0            ; 2
    LSR                    ; 2
    CLC                    ; 2
    ADC    #8              ; 2
    STA    $8A             ; 3
    STA    HMCLR           ; 3
    LDA    $BF,X           ; 4
    AND    #$0F            ; 2
    JSR    LF64C           ; 6
    STA    $8C             ; 3
    LDY    #7              ; 2
    LDA    #$FF            ; 2
    STA    $83             ; 3
    STA    $85             ; 3
    STA    $87             ; 3
    STA    $89             ; 3
    STA    $8B             ; 3
    STA    $8D             ; 3
    LDX    #0              ; 2
    LDA    $82             ; 3
    CMP    #8              ; 2
    BNE    LF61B           ; 2³+1
    STX    $82             ; 3
    LDA    $84             ; 3
    CMP    #8              ; 2
    BNE    LF61B           ; 2³
    STX    $84             ; 3
    LDA    $86             ; 3
    CMP    #8              ; 2
    BNE    LF61B           ; 2³
    STX    $86             ; 3
    LDA    $88             ; 3
    CMP    #8              ; 2
    BNE    LF61B           ; 2³
    STX    $88             ; 3
    LDA    $8A             ; 3
    CMP    #8              ; 2
    BNE    LF61B           ; 2³
    STX    $8A             ; 3
LF61B:
    STA    WSYNC           ; 3
    LDA    ($84),Y         ; 5
    TAX                    ; 2
    LDA    ($82),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($88),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($8C),Y         ; 5
    PHA                    ; 3
    STX    GRP0            ; 3
    LDA    ($86),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($8A),Y         ; 5
    STA    GRP1            ; 3
    PLA                    ; 4
    STA    GRP1            ; 3
    DEY                    ; 2
    BNE    LF61B           ; 2³
    LDA    #0              ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    STA    WSYNC           ; 3
    LDA    #0              ; 2
    STA    COLUBK          ; 3
    RTS                    ; 6

LF64C SUBROUTINE
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    CLC                    ; 2
    ADC    #8              ; 2
    RTS                    ; 6

LF653 SUBROUTINE
    SEC                    ; 2
    STA    WSYNC           ; 3
LF656:
    SBC    #$0F            ; 2
    BCS    LF656           ; 2³
    EOR    #$07            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    HMP0,X          ; 4
    STA    RESP0,X         ; 4
    RTS                    ; 6

LF665 SUBROUTINE
    LDA    $80             ; 3
    CMP    #2              ; 2
    BEQ    LF679           ; 2³
    BCC    LF67D           ; 2³
    CMP    #3              ; 2
    BEQ    LF675           ; 2³
    LDY    #$36            ; 2
    BNE    LF67F           ; 2³
LF675:
    LDY    #$24            ; 2
    BNE    LF67F           ; 2³
LF679:
    LDY    #$12            ; 2
    BNE    LF67F           ; 2³
LF67D:
    LDY    #0              ; 2
LF67F:
    LDX    #0              ; 2
LF681:
    LDA    $AF,X           ; 4
    BEQ    LF697           ; 2³
    SEC                    ; 2
    LDA    $95,X           ; 4
    SBC    $A3,X           ; 4
    CMP    #6              ; 2
    BCS    LF694           ; 2³
    LDA    #0              ; 2
    STA    $AF,X           ; 4
    LDA    #6              ; 2
LF694:
    JMP    LF6BA           ; 3
LF697:
    LDA    $A9,X           ; 4
    BEQ    LF6A7           ; 2³
    CMP    #1              ; 2
    BEQ    LF6A3           ; 2³
    LDA    #$74            ; 2
    BNE    LF6A9           ; 2³
LF6A3:
    LDA    #$84            ; 2
    BNE    LF6A9           ; 2³
LF6A7:
    LDA    #$94            ; 2
LF6A9:
    STA    $88             ; 3
    CLC                    ; 2
    LDA    $95,X           ; 4
    ADC    $A3,X           ; 4
    CMP    $88             ; 3
    BCC    LF6BA           ; 2³
    LDA    #8              ; 2
    STA    $AF,X           ; 4
    LDA    $88             ; 3
LF6BA:
    STA    $95,X           ; 4
    INX                    ; 2
    CPX    #6              ; 2
    BNE    LF681           ; 2³
    TYA                    ; 2
    CMP    $C6             ; 3
    BNE    LF6C9           ; 2³
    CLC                    ; 2
    ADC    #9              ; 2
LF6C9:
    STA    $C6             ; 3
    RTS                    ; 6
;-------------------------------
;-------------------------------
LF6CC:
    LDA    $80             ; 3
    CMP    #2              ; 2
    BEQ    LF6E6           ; 2³
    BCC    LF6EE           ; 2³
    CMP    #3              ; 2
    BEQ    LF6E0           ; 2³
    LDX    #$36            ; 2
    LDA    #4              ; 2
LF6DC:
    LDY    #3              ; 2
    BNE    LF6F4           ; 2³
LF6E0:
    LDA    #4              ; 2
    LDX    #$24            ; 2
    BNE    LF6DC           ; 2³
LF6E6:
    LDA    #4              ; 2
    LDX    #$12            ; 2
    LDY    #1              ; 2
    BNE    LF6F4           ; 2³
LF6EE:
    LDA    #5              ; 2
    LDX    #0              ; 2
    LDY    #0              ; 2
LF6F4:
    STA    $88             ; 3
    STY    $8A             ; 3
    STX    $8C             ; 3
    LDX    #0              ; 2
LF6FC:
    LDA    $82,X           ; 4
    AND    #$37            ; 2
    ORA    #$07            ; 2
    STA    $95,X           ; 4
    LDA    $83,X           ; 4
    AND    #$01            ; 2
    BEQ    LF70C           ; 2³
    LDA    #8              ; 2
LF70C:
    STA    $AF,X           ; 4
    LDA    $88             ; 3
    STA    $A3,X           ; 4
    LDA    $8A             ; 3
    STA    $A9,X           ; 4
    INX                    ; 2
    CPX    #6              ; 2
    BNE    LF6FC           ; 2³+1
    LDA    $BC             ; 3
    AND    #$03            ; 2
    BEQ    LF738           ; 2³
    CMP    #1              ; 2
    BEQ    LF747           ; 2³
    CMP    #2              ; 2
    BEQ    LF752           ; 2³
    DEC    $A3             ; 5
    DEC    $A3             ; 5
LF72D:
    DEC    $A7             ; 5
    DEC    $A5             ; 5
    DEC    $A8             ; 5
    DEC    $A8             ; 5
    JMP    LF759           ; 3
LF738:
    DEC    $A7             ; 5
    DEC    $A4             ; 5
    DEC    $A6             ; 5
    DEC    $A6             ; 5
LF740:
    DEC    $A4             ; 5
    DEC    $A5             ; 5
    JMP    LF759           ; 3
LF747:
    DEC    $A4             ; 5
    DEC    $A5             ; 5
    DEC    $A3             ; 5
    DEC    $A7             ; 5
    JMP    LF740           ; 3
LF752:
    DEC    $A7             ; 5
    DEC    $A4             ; 5
    JMP    LF72D           ; 3
LF759:
    LDA    $80             ; 3
    CMP    #2              ; 2
    BEQ    LF768           ; 2³
    CMP    #3              ; 2
    BEQ    LF784           ; 2³
    CMP    #4              ; 2
    BEQ    LF7AC           ; 2³
    RTS                    ; 6

LF768:
    LDA    $BC             ; 3
    AND    #$01            ; 2
    BEQ    LF77B           ; 2³
    LDA    #0              ; 2
    STA    $A9             ; 3
    STA    $AA             ; 3
LF774:
    STA    $AC             ; 3
    LDA    #2              ; 2
    STA    $AE             ; 3
    RTS                    ; 6

LF77B:
    LDA    #0              ; 2
    STA    $AB             ; 3
    STA    $A9             ; 3
    JMP    LF774           ; 3
LF784:
    LDA    $BC             ; 3
    AND    #$01            ; 2
    BEQ    LF79B           ; 2³
    LDA    #1              ; 2
    STA    $A9             ; 3
    LDA    #2              ; 2
    STA    $AC             ; 3
    LDA    #0              ; 2
    STA    $AE             ; 3
    STA    $AB             ; 3
    STA    $AA             ; 3
    RTS                    ; 6

LF79B:
    LDA    #1              ; 2
    STA    $AA             ; 3
    LDA    #2              ; 2
    STA    $AB             ; 3
    LDA    #0              ; 2
    STA    $AC             ; 3
    STA    $AE             ; 3
    STA    $A9             ; 3
    RTS                    ; 6

LF7AC:
    LDA    $BC             ; 3
    AND    #$01            ; 2
    BEQ    LF7C1           ; 2³
    LDA    #1              ; 2
    STA    $AC             ; 3
    STA    $AA             ; 3
    LDA    #2              ; 2
    STA    $AD             ; 3
    LDA    #0              ; 2
    STA    $AE             ; 3
    RTS                    ; 6

LF7C1:
    LDA    #1              ; 2
    STA    $A9             ; 3
    STA    $AB             ; 3
    LDA    #2              ; 2
    STA    $AA             ; 3
    LDA    #0              ; 2
    STA    $AD             ; 3
    RTS                    ; 6
;-------------------------------
;-------------------------------
LF7D0 SUBROUTINE
    LDA    #0              ; 2
    STA    $CF             ; 3
    LDA    $B8             ; 3
    AND    #$07            ; 2
    BNE    LF7E5           ; 2³
    LDA    #$48            ; 2
    CMP    $C8             ; 3
    BNE    LF7E3           ; 2³
    CLC                    ; 2
    ADC    #$10            ; 2
LF7E3:
    STA    $C8             ; 3
LF7E5:
    LDA    $B6             ; 3
    CMP    #2              ; 2
    BNE    LF7F5           ; 2³
    LDA    SWCHA           ; 4
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    JMP    LF7F8           ; 3
LF7F5:
    LDA    SWCHA           ; 4
LF7F8:
    TAX                    ; 2
    LDA    $8F             ; 3
    CMP    #$0B            ; 2
    BCC    LF80D           ; 2³+1
    CMP    #UNK_05         ; 2
    BCS    LF82E           ; 2³
    LDA    #0              ; 2
    STA    $C3             ; 3
    TXA                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    JMP    LF8BB           ; 3
LF80D:
    LDA    $8E             ; 3
    CMP    #$90            ; 2
    BEQ    LF84F           ; 2³
    CMP    #$7A            ; 2
    BEQ    LF84F           ; 2³
    CMP    #$64            ; 2
    BEQ    LF856           ; 2³
    CMP    #$4E            ; 2
    BEQ    LF84F           ; 2³
    CMP    #$38            ; 2
    BEQ    LF856           ; 2³
    CMP    #$22            ; 2
    BEQ    LF84F           ; 2³
    CMP    #$0C            ; 2
    BEQ    LF856           ; 2³
    JMP    LF85A           ; 3
LF82E:
    LDA    $8E             ; 3
    CMP    #$90            ; 2
    BEQ    LF84F           ; 2³
    CMP    #$7A            ; 2
    BEQ    LF856           ; 2³
    CMP    #$64            ; 2
    BEQ    LF84F           ; 2³
    CMP    #$4E            ; 2
    BEQ    LF856           ; 2³
    CMP    #$38            ; 2
    BEQ    LF84F           ; 2³
    CMP    #$22            ; 2
    BEQ    LF856           ; 2³
    CMP    #$0C            ; 2
    BNE    LF85A           ; 2³
    JMP    LF94B           ; 3
LF84F:
    LDA    #0              ; 2
LF851:
    STA    $C3             ; 3
    JMP    LF85A           ; 3
LF856:
    LDA    #$16            ; 2
    BNE    LF851           ; 2³
LF85A:
    TXA                    ; 2
    ASL                    ; 2
    BCS    LF886           ; 2³
    LDA    $C3             ; 3
    BEQ    LF883           ; 2³
    LDA    $8F             ; 3
    CMP    #$0B            ; 2
    BCS    LF86F           ; 2³
    LDA    #8              ; 2
    STA    $8F             ; 3
    JMP    LF873           ; 3
LF86F:
    LDA    #UNK_06         ; 2
    STA    $8F             ; 3
LF873:
    DEC    $C3             ; 5
    LDA    $C3             ; 3
    CMP    #4              ; 2
    BNE    LF87D           ; 2³
    INC    $8E             ; 5
LF87D:
    INC    $8E             ; 5
    LDA    #8              ; 2
    STA    $CF             ; 3
LF883:
    JMP    LF93A           ; 3
LF886:
    ASL                    ; 2
    BCS    LF8BB           ; 2³
    LDA    $C3             ; 3
    CMP    #$16            ; 2
    BEQ    LF883           ; 2³
    LDA    $8F             ; 3
    CMP    #$0B            ; 2
    BCS    LF89C           ; 2³
    LDA    #8              ; 2
    STA    $8F             ; 3
    JMP    LF8A0           ; 3
LF89C:
    LDA    #UNK_06         ; 2
    STA    $8F             ; 3
LF8A0:
    LDA    $8E             ; 3
    CMP    #$90            ; 2
    BNE    LF8AC           ; 2³
    LDA    $8F             ; 3
    CMP    #8              ; 2
    BEQ    LF8B8           ; 2³
LF8AC:
    INC    $C3             ; 5
    LDA    $C3             ; 3
    CMP    #4              ; 2
    BNE    LF8B6           ; 2³
    DEC    $8E             ; 5
LF8B6:
    DEC    $8E             ; 5
LF8B8:
    JMP    LF93A           ; 3
LF8BB:
    ASL                    ; 2
    BCS    LF909           ; 2³+1
    LDA    $C3             ; 3
    BEQ    LF8F5           ; 2³
    CMP    #1              ; 2
    BNE    LF8CD           ; 2³
LF8C6:
    INC    $8E             ; 5
    DEC    $C3             ; 5
    JMP    LF8F5           ; 3
LF8CD:
    CMP    #2              ; 2
    BNE    LF8D8           ; 2³
    INC    $8E             ; 5
    DEC    $C3             ; 5
    JMP    LF8C6           ; 3
LF8D8:
    CMP    #$16            ; 2
    BEQ    LF8F5           ; 2³
    CMP    #$15            ; 2
    BNE    LF8E7           ; 2³
LF8E0:
    INC    $C3             ; 5
    DEC    $8E             ; 5
    JMP    LF8F5           ; 3
LF8E7:
    CMP    #$14            ; 2
    BNE    LF8F2           ; 2³
    INC    $C3             ; 5
    DEC    $8E             ; 5
    JMP    LF8E0           ; 3
LF8F2:
    JMP    LF93A           ; 3
LF8F5:
    DEC    $8F             ; 5
    LDA    $8F             ; 3
    CMP    #8              ; 2
    BEQ    LF902           ; 2³+1
    BCC    LF902           ; 2³+1
    JMP    LF93A           ; 3
LF902:
    LDA    #8              ; 2
    STA    $8F             ; 3
    JMP    LF93A           ; 3
LF909:
    ASL                    ; 2
    BCS    LF93A           ; 2³
    LDA    $C3             ; 3
    BEQ    LF932           ; 2³
    CMP    #1              ; 2
    BNE    LF91B           ; 2³
LF914:
    INC    $8E             ; 5
    DEC    $C3             ; 5
    JMP    LF932           ; 3
LF91B:
    CMP    #2              ; 2
    BNE    LF926           ; 2³
    INC    $8E             ; 5
    DEC    $C3             ; 5
    JMP    LF914           ; 3
LF926:
    CMP    #$16            ; 2
    BEQ    LF932           ; 2³
    CMP    #$15            ; 2
    BNE    LF940           ; 2³
LF92E:
    INC    $C3             ; 5
    DEC    $8E             ; 5
LF932:
    INC    $8F             ; 5
    LDA    $8F             ; 3
    CMP    #UNK_06         ; 2
    BCS    LF93B           ; 2³
LF93A:
    RTS                    ; 6

LF93B:
    LDA    #UNK_06         ; 2
    STA    $8F             ; 3
    RTS                    ; 6

LF940:
    CMP    #$14            ; 2
    BNE    LF8E7           ; 2³+1
    INC    $C3             ; 5
    DEC    $8E             ; 5
    JMP    LF92E           ; 3
LF94B:
    LDA    #$FF            ; 2
    STA    $CE             ; 3
    LDA    #$42            ; 2
    STA    $BA             ; 3
    RTS                    ; 6

LF954 SUBROUTINE
    LDA    COLUP1          ; 3
    AND    #$80            ; 2
    BNE    LF95B           ; 2³
    RTS                    ; 6

LF95B:
    LDA    $8E             ; 3
    CMP    #$90            ; 2
    BEQ    LF9A4           ; 2³
    CMP    #$7A            ; 2
    BCC    LF969           ; 2³
    LDA    #2              ; 2
    BNE    LF98B           ; 2³
LF969:
    CMP    #$64            ; 2
    BCC    LF971           ; 2³
    LDA    #3              ; 2
    BNE    LF98B           ; 2³
LF971:
    CMP    #$4E            ; 2
    BCC    LF979           ; 2³
    LDA    #4              ; 2
    BNE    LF98B           ; 2³
LF979:
    CMP    #$38            ; 2
    BCC    LF981           ; 2³
    LDA    #5              ; 2
    BNE    LF98B           ; 2³
LF981:
    CMP    #$22            ; 2
    BCC    LF989           ; 2³
    LDA    #6              ; 2
    BNE    LF98B           ; 2³
LF989:
    LDA    #7              ; 2
LF98B:
    LDY    $B6             ; 3
    CPY    #1              ; 2
    BNE    LF995           ; 2³
    LDX    #0              ; 2
    BEQ    LF997           ; 2³
LF995:
    LDX    #3              ; 2
LF997:
    CLC                    ; 2
    SED                    ; 2
    ADC    $BE,X           ; 4
    STA    $BE,X           ; 4
    LDA    $BD,X           ; 4
    ADC    #0              ; 2
    STA    $BD,X           ; 4
    CLD                    ; 2
LF9A4:
    JMP    LF9ED           ; 3

LF9A7 SUBROUTINE
    LDA    $B6             ; 3
    CMP    #1              ; 2
    BNE    LF9B2           ; 2³
    DEC    $E1             ; 5
    JMP    LF9B7           ; 3
LF9B2:
    DEC    $E2             ; 5
    JMP    LF9C6           ; 3
LF9B7:
    LDA    $E2             ; 3
    BEQ    LF9D3           ; 2³
LF9BB:
    LDA    #2              ; 2
    STA    $B6             ; 3
    LDA    $E4             ; 3
LF9C1:
    STA    $80             ; 3
    JMP    LF9E9           ; 3
LF9C6:
    LDA    $E1             ; 3
    BEQ    LF9DA           ; 2³
LF9CA:
    LDA    #1              ; 2
    STA    $B6             ; 3
    LDA    $E3             ; 3
    JMP    LF9C1           ; 3
LF9D3:
    LDA    $E1             ; 3
    BEQ    LF9E1           ; 2³
    JMP    LF9CA           ; 3
LF9DA:
    LDA    $E2             ; 3
    BEQ    LF9E1           ; 2³
    JMP    LF9BB           ; 3
LF9E1:
    JSR    LFA8A           ; 6
    LDA    #$48            ; 2
    STA    $B7             ; 3
    RTS                    ; 6

LF9E9:
    JSR    LFA9A           ; 6
    RTS                    ; 6

LF9ED:
    LDA    #$D0            ; 2
    STA    $E0             ; 3
    LDA    #$10            ; 2
    STA    $EE             ; 3
    LDA    #0              ; 2
    STA    AUDV0           ; 3
    STA    $BB             ; 3
    STA    AUDV1           ; 3
    RTS                    ; 6

LF9FE SUBROUTINE
    LDX    $BA             ; 3
    BNE    LFA04           ; 2³
    LDX    #$42            ; 2
LFA04:
    DEX                    ; 2
    LDA    #9              ; 2
;===============================
  IF ZELLERS
    STA    AUDV1           ; 3
    STA    AUDV0           ; 3
  ENDIF
  IF PAL
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
  ENDIF
;===============================
    STA    $BB             ; 3
    LDA    $80             ; 3
    AND    #$01            ; 2
    BEQ    LFA17           ; 2³
    LDA    #$0C            ; 2
    BNE    LFA19           ; 2³
LFA17:
    LDA    #$0C            ; 2
LFA19:
    STA    AUDC1           ; 3
    STA    AUDC0           ; 3
;===============================
  IF PAL
       LDA    $CE          ; 3
       BEQ    LFA25        ; 2³
       LDA    #$0C         ; 2
       STA    AUDC0        ; 3
  ENDIF
LFA25:
;================================
    LDA    LFE49,X         ; 4
    STA    AUDF1           ; 3
    LDA    LFE8C,X         ; 4
    STA    AUDF0           ; 3
    BNE    LFA2F           ; 2³
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    STA    $BB             ; 3
LFA2F:
    STX    $BA             ; 3
    RTS                    ; 6

LFA32 SUBROUTINE
    LDX    $EE             ; 3
    BEQ    LFA55           ; 2³
    LDA    #0              ; 2
    STA    AUDV0           ; 3
    LDA    #9              ; 2
    STA    AUDV1           ; 3
    STA    $BB             ; 3
    LDA    #$0C            ; 2
    STA    AUDC1           ; 3
    LDA    LFA5E,X         ; 4
    STA    AUDF1           ; 3
    BNE    LFA51           ; 2³
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    STA    $BB             ; 3
LFA51:
    DEX                    ; 2
    STX    $EE             ; 3
    RTS                    ; 6

LFA55:
    LDA    #0              ; 2
    STA    $BB             ; 3
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    RTS                    ; 6

LFA5E:
    .byte $00,$09,$00,$13,$00,$09,$0A,$0B,$0C,$0E,$0F,$11,$13,$00,$00,$00

LFA6E SUBROUTINE
    LDA    #0              ; 2
    STA    $BD             ; 3
    STA    $BE             ; 3
    STA    $BF             ; 3
    STA    $C0             ; 3
    STA    $C1             ; 3
    STA    $C2             ; 3
    STA    $BA             ; 3
    LDA    #1              ; 2
    STA    $E3             ; 3
    STA    $E4             ; 3
    STA    $80             ; 3
    LDA    #6              ; 2
    STA    $E1             ; 3
LFA8A SUBROUTINE
    LDA    #0              ; 2
    STA    $93             ; 3
    STA    $CE             ; 3
    STA    $E0             ; 3
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    STA    $B7             ; 3
    STA    $C3             ; 3
LFA9A SUBROUTINE
    LDA    #$90            ; 2
    STA    $8E             ; 3
    LDA    #8              ; 2
    STA    $8F             ; 3
    LDA    #$48            ; 2
    STA    $C8             ; 3
    LDA    #VPOS_MOUSE_1   ; 2
    STA    $A0             ; 3
    LDA    #VPOS_MOUSE_2   ; 2
    STA    $9F             ; 3
    LDA    #VPOS_MOUSE_3   ; 2
    STA    $9E             ; 3
    LDA    #VPOS_MOUSE_4   ; 2
    STA    $9D             ; 3
    LDA    #VPOS_MOUSE_5   ; 2
    STA    $9C             ; 3
    LDA    #VPOS_MOUSE_6   ; 2
    STA    $9B             ; 3
    STA    $A1             ; 3
    LDA    #6              ; 2   six minutes
    STA    $92             ; 3
    LDA    #0              ; 2   zero seconds
    STA    $93             ; 3
    JMP    LF6CC           ; 3

LFACB SUBROUTINE
    LDA    #8              ; 2
    STA    $E5             ; 3
    STA    $E6             ; 3
    STA    $E7             ; 3
    STA    $E8             ; 3
    STA    $E9             ; 3
    STA    $EA             ; 3
    STA    $EB             ; 3
    STA    $EC             ; 3
    STA    $ED             ; 3
    SEC                    ; 2
    LDA    #4              ; 2
    SBC    $80             ; 3
    TAX                    ; 2
    LDA    LFC00,X         ; 4
    STA    $82             ; 3
    LDA    #$FC            ; 2
    STA    $83             ; 3
    STA    $85             ; 3
    STA    $87             ; 3
    STA    $89             ; 3
    STA    $8B             ; 3
    LDA    $8E             ; 3
    SEC                    ; 2
    SBC    #5              ; 2
    LDY    #8              ; 2
    SEC                    ; 2
LFAFE:
    SBC    #$10            ; 2
    BCC    LFB08           ; 2³
    DEY                    ; 2
    BPL    LFAFE           ; 2³+1, PAL = 2³ (no page crossing)
    JMP    LFB10           ; 3
LFB08:
    LDA    ($82),Y         ; 5
    STA.wy $E5,Y           ; 5
    DEY                    ; 2
    BPL    LFB08           ; 2³
LFB10:
    STA    WSYNC           ; 3
    LDA    #6              ; 2
    STA    NUSIZ0          ; 3
    LDA    #2              ; 2
    STA    NUSIZ1          ; 3
    LDA    $CD             ; 3
    AND    #$01            ; 2
    BEQ    LFB44           ; 2³
    LDA    $E6             ; 3
    STA    $82             ; 3
    LDA    $E8             ; 3
    STA    $84             ; 3
    LDA    $EA             ; 3
    STA    $86             ; 3
    LDA    $EC             ; 3
    STA    $88             ; 3
    LDA    #8              ; 2
    STA    $8A             ; 3
    LDA    #$34            ; 2
    LDX    #0              ; 2
    JSR    LF653           ; 6
    LDA    #$44            ; 2
    INX                    ; 2
    JSR    LF653           ; 6
    JMP    LFB65           ; 3
LFB44:
    LDA    $E5             ; 3
    STA    $82             ; 3
    LDA    $E7             ; 3
    STA    $84             ; 3
    LDA    $E9             ; 3
    STA    $86             ; 3
    LDA    $EB             ; 3
    STA    $88             ; 3
    LDA    $ED             ; 3
    STA    $8A             ; 3
    LDA    #$2C            ; 2
    LDX    #0              ; 2
    JSR    LF653           ; 6
    LDA    #$3C            ; 2
    INX                    ; 2
    JSR    LF653           ; 6
LFB65:
    LDA    INTIM           ; 4
    BNE    LFB65           ; 2³
    LDA    #$10            ; 2
    STA    TIM64T          ; 4
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDY    #7              ; 2
LFB75:
    STA    WSYNC           ; 3
    STA    HMCLR           ; 3
    LDA    ($82),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($84),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($8A),Y         ; 5
    PHA                    ; 3
    LDA    ($88),Y         ; 5
    TAX                    ; 2
    LDA    ($86),Y         ; 5
    STA    GRP0            ; 3
    PLA                    ; 4
    STX    GRP1            ; 3
    STA    GRP0            ; 3
    DEY                    ; 2
    BPL    LFB75           ; 2³
    LDA    #0              ; 2
    STA    NUSIZ0          ; 3
    RTS                    ; 6
;===============================
  IF ZELLERS
LFB98:
    .byte $20,$D6,$B7,$20,$3A,$AF,$AE,$9C
  ENDIF
;===============================
LFBA0:
    .byte $B3,$A9,$06,$8D,$C5,$B5,$BD,$C6,$B4,$8D,$D1,$B5,$BD,$C7,$B4,$8D
    .byte $D2,$B5,$BD,$C8,$B4,$8D,$C2,$B5,$8D,$F6,$B5,$BD,$E7,$B4,$8D,$EE
    .byte $B5,$BD,$E8,$B4,$8D,$EF,$B5,$8E,$D9,$B5,$A9,$FF,$8D,$E0,$B5,$8D
    .byte $E1,$B5,$AD,$E2,$B3,$8D,$DA,$B5,$18,$4C,$5E,$AF,$A9,$00,$AA,$9D
    .byte $D1,$B5,$E8,$E0,$2D,$D0,$F8,$AD,$BF,$B5,$49,$FF,$8D,$F9,$B5,$AD
    .byte $C0,$B5,$8D,$F8,$B5,$AD,$C1,$B5,$0A,$0A,$0A,$0A,$AA,$8E,$F7,$B5
LFC00:
    .byte $88,$91,$9A,$A3
    .byte $00 ; |        | $FC04
    .byte $00 ; |        | $FC05
    .byte $00 ; |        | $FC06
    .byte $00 ; |        | $FC07
BlankOne:
    .byte $00 ; |        | $FC08
    .byte $00 ; |        | $FC09
    .byte $00 ; |        | $FC0A
    .byte $00 ; |        | $FC0B
    .byte $00 ; |        | $FC0C
    .byte $00 ; |        | $FC0D
    .byte $00 ; |        | $FC0E
    .byte $00 ; |        | $FC0F
LetterE:
    .byte $00 ; |        | $FC10
    .byte $7C ; | XXXXX  | $FC11
    .byte $66 ; | XX  XX | $FC12
    .byte $60 ; | XX     | $FC13
    .byte $7C ; | XXXXX  | $FC14
    .byte $60 ; | XX     | $FC15
    .byte $66 ; | XX  XX | $FC16
    .byte $7C ; | XXXXX  | $FC17
LetterX:
    .byte $00 ; |        | $FC18
    .byte $C3 ; |XX    XX| $FC19
    .byte $66 ; | XX  XX | $FC1A
    .byte $3C ; |  XXXX  | $FC1B
    .byte $18 ; |   XX   | $FC1C
    .byte $3C ; |  XXXX  | $FC1D
    .byte $66 ; | XX  XX | $FC1E
    .byte $C3 ; |XX    XX| $FC1F
LetterC:
    .byte $00 ; |        | $FC20
    .byte $3C ; |  XXXX  | $FC21
    .byte $66 ; | XX  XX | $FC22
    .byte $60 ; | XX     | $FC23
    .byte $60 ; | XX     | $FC24
    .byte $60 ; | XX     | $FC25
    .byte $66 ; | XX  XX | $FC26
    .byte $3C ; |  XXXX  | $FC27
LetterL:
    .byte $00 ; |        | $FC28
    .byte $7C ; | XXXXX  | $FC29
    .byte $66 ; | XX  XX | $FC2A
    .byte $60 ; | XX     | $FC2B
    .byte $60 ; | XX     | $FC2C
    .byte $60 ; | XX     | $FC2D
    .byte $60 ; | XX     | $FC2E
    .byte $60 ; | XX     | $FC2F
LetterN:
    .byte $00 ; |        | $FC30
    .byte $66 ; | XX  XX | $FC31
    .byte $6E ; | XX XXX | $FC32
    .byte $7E ; | XXXXXX | $FC33
    .byte $7E ; | XXXXXX | $FC34
    .byte $76 ; | XXX XX | $FC35
    .byte $66 ; | XX  XX | $FC36
    .byte $46 ; | X   XX | $FC37
LetterT:
    .byte $00 ; |        | $FC38
    .byte $18 ; |   XX   | $FC39
    .byte $18 ; |   XX   | $FC3A
    .byte $18 ; |   XX   | $FC3B
    .byte $18 ; |   XX   | $FC3C
    .byte $18 ; |   XX   | $FC3D
    .byte $5A ; | X XX X | $FC3E
    .byte $7E ; | XXXXXX | $FC3F
LetterV:
    .byte $00 ; |        | $FC40
    .byte $18 ; |   XX   | $FC41
    .byte $3C ; |  XXXX  | $FC42
    .byte $24 ; |  X  X  | $FC43
    .byte $66 ; | XX  XX | $FC44
    .byte $66 ; | XX  XX | $FC45
    .byte $42 ; | X    X | $FC46
    .byte $42 ; | X    X | $FC47
LetterR:
    .byte $00 ; |        | $FC48
    .byte $66 ; | XX  XX | $FC49
    .byte $6C ; | XX XX  | $FC4A
    .byte $78 ; | XXXX   | $FC4B
    .byte $7C ; | XXXXX  | $FC4C
    .byte $66 ; | XX  XX | $FC4D
    .byte $66 ; | XX  XX | $FC4E
    .byte $7C ; | XXXXX  | $FC4F
LetterY:
    .byte $00 ; |        | $FC50
    .byte $18 ; |   XX   | $FC51
    .byte $18 ; |   XX   | $FC52
    .byte $18 ; |   XX   | $FC53
    .byte $3C ; |  XXXX  | $FC54
    .byte $66 ; | XX  XX | $FC55
    .byte $66 ; | XX  XX | $FC56
    .byte $42 ; | X    X | $FC57
LetterG:
    .byte $00 ; |        | $FC58
    .byte $3A ; |  XXX X | $FC59
    .byte $66 ; | XX  XX | $FC5A
    .byte $66 ; | XX  XX | $FC5B
    .byte $6E ; | XX XXX | $FC5C
    .byte $60 ; | XX     | $FC5D
    .byte $66 ; | XX  XX | $FC5E
    .byte $3C ; |  XXXX  | $FC5F
LetterO:
    .byte $00 ; |        | $FC60
    .byte $3C ; |  XXXX  | $FC61
    .byte $66 ; | XX  XX | $FC62
    .byte $66 ; | XX  XX | $FC63
    .byte $66 ; | XX  XX | $FC64
    .byte $66 ; | XX  XX | $FC65
    .byte $66 ; | XX  XX | $FC66
    .byte $3C ; |  XXXX  | $FC67
LetterD:
    .byte $00 ; |        | $FC68
    .byte $7C ; | XXXXX  | $FC69
    .byte $66 ; | XX  XX | $FC6A
    .byte $66 ; | XX  XX | $FC6B
    .byte $66 ; | XX  XX | $FC6C
    .byte $66 ; | XX  XX | $FC6D
    .byte $66 ; | XX  XX | $FC6E
    .byte $7C ; | XXXXX  | $FC6F
Asterisk:
    .byte $00 ; |        | $FC70
    .byte $08 ; |    X   | $FC71
    .byte $1C ; |   XXX  | $FC72
    .byte $7F ; | XXXXXXX| $FC73
    .byte $3E ; |  XXXXX | $FC74
    .byte $7F ; | XXXXXXX| $FC75
    .byte $1C ; |   XXX  | $FC76
    .byte $08 ; |    X   | $FC77
LetterB:
    .byte $00 ; |        | $FC78
    .byte $7C ; | XXXXX  | $FC79
    .byte $66 ; | XX  XX | $FC7A
    .byte $66 ; | XX  XX | $FC7B
    .byte $7C ; | XXXXX  | $FC7C
    .byte $66 ; | XX  XX | $FC7D
    .byte $66 ; | XX  XX | $FC7E
    .byte $7C ; | XXXXX  | $FC7F
LetterA:
    .byte $00 ; |        | $FC80
    .byte $66 ; | XX  XX | $FC81
    .byte $7E ; | XXXXXX | $FC82
    .byte $7E ; | XXXXXX | $FC83
    .byte $66 ; | XX  XX | $FC84
    .byte $66 ; | XX  XX | $FC85
    .byte $3C ; |  XXXX  | $FC86
    .byte $18 ; |   XX   | $FC87

LFC88:
    .byte $10,$18,$20,$10,$28,$28,$10,$30,$38 ; EXCELLENT
    .byte $40,$10,$48,$50,$08                 ; VERY(blank)
    .byte $58,$60,$60,$68,$08                 ; GOOD(blank)
    .byte $70,$70,$58,$60,$60,$68,$70,$70     ; **GOOD**
    .byte $70,$30,$60,$38,$08                 ; *NOT(blank)
    .byte $78,$80,$68,$70,$0B                 ; BAD*(blank)

    .byte $B1,$42,$48,$20,$5B,$B1,$20,$94,$B1,$68,$60
    .byte $4C,$6F,$B3,$20,$00,$B3,$AD,$C3,$B5,$20,$DA,$AC,$4C,$7F,$B3,$20
    .byte $00,$B3,$20,$A2,$B1,$A0,$00,$B1,$42,$20,$DA,$AC,$20,$B5,$B1,$4C
    .byte $CA,$AC,$48,$20,$B6,$B0,$68,$91,$42,$A9,$40,$0D,$D5,$B5,$8D,$D5
    .byte $B5,$20,$5B,$B1,$4C,$94,$B1,$A9,$80,$8D,$9E,$B3,$D0,$05,$A9,$00
    .byte $8D,$9E,$B3,$20,$28,$AB,$AE,$9C

    .byte $00 ; |        | $FD00
    .byte $80 ; |X       | $FD01
    .byte $B0 ; |X XX    | $FD02
    .byte $7A ; | XXXX X | $FD03
    .byte $7D ; | XXXXX X| $FD04
    .byte $7D ; | XXXXX X| $FD05
    .byte $7A ; | XXXX X | $FD06
    .byte $B0 ; |X XX    | $FD07
    .byte $80 ; |X       | $FD08
    .byte $00 ; |        | $FD09
    .byte $01 ; |       X| $FD0A
    .byte $B2 ; |X XX  X | $FD0B
    .byte $6A ; | XX X X | $FD0C
    .byte $7C ; | XXXXX  | $FD0D
    .byte $7C ; | XXXXX  | $FD0E
    .byte $6A ; | XX X X | $FD0F
    .byte $B2 ; |X XX  X | $FD10
    .byte $01 ; |       X| $FD11
    .byte $00 ; |        | $FD12
    .byte $55 ; | X X X X| $FD13
    .byte $2A ; |  X X X | $FD14
    .byte $88 ; |X   X   | $FD15
    .byte $7C ; | XXXXX  | $FD16
    .byte $7C ; | XXXXX  | $FD17
    .byte $88 ; |X   X   | $FD18
    .byte $2A ; |  X X X | $FD19
    .byte $55 ; | X X X X| $FD1A
    .byte $00 ; |        | $FD1B
    .byte $6B ; | XX X XX| $FD1C
    .byte $36 ; |  XX XX | $FD1D
    .byte $88 ; |X   X   | $FD1E
    .byte $7C ; | XXXXX  | $FD1F
    .byte $7C ; | XXXXX  | $FD20
    .byte $88 ; |X   X   | $FD21
    .byte $36 ; |  XX XX | $FD22
    .byte $6B ; | XX X XX| $FD23
    .byte $00 ; |        | $FD24
    .byte $3C ; |  XXXX  | $FD25
    .byte $E7 ; |XXX  XXX| $FD26
    .byte $3C ; |  XXXX  | $FD27
    .byte $18 ; |   XX   | $FD28
    .byte $18 ; |   XX   | $FD29
    .byte $24 ; |  X  X  | $FD2A
    .byte $DB ; |XX XX XX| $FD2B
    .byte $3C ; |  XXXX  | $FD2C
    .byte $00 ; |        | $FD2D
    .byte $3C ; |  XXXX  | $FD2E
    .byte $DB ; |XX XX XX| $FD2F
    .byte $3C ; |  XXXX  | $FD30
    .byte $18 ; |   XX   | $FD31
    .byte $18 ; |   XX   | $FD32
    .byte $3C ; |  XXXX  | $FD33
    .byte $DB ; |XX XX XX| $FD34
    .byte $24 ; |  X  X  | $FD35
    .byte $00 ; |        | $FD36
    .byte $18 ; |   XX   | $FD37
    .byte $2C ; |  X XX  | $FD38
    .byte $76 ; | XXX XX | $FD39
    .byte $BB ; |X XXX XX| $FD3A
    .byte $DD ; |XX XXX X| $FD3B
    .byte $6E ; | XX XXX | $FD3C
    .byte $34 ; |  XX X  | $FD3D
    .byte $18 ; |   XX   | $FD3E
    .byte $00 ; |        | $FD3F
    .byte $18 ; |   XX   | $FD40
    .byte $34 ; |  XX X  | $FD41
    .byte $6C ; | XX XX  | $FD42
    .byte $DB ; |XX XX XX| $FD43
    .byte $B7 ; |X XX XXX| $FD44
    .byte $6E ; | XX XXX | $FD45
    .byte $1C ; |   XXX  | $FD46
    .byte $18 ; |   XX   | $FD47
    .byte $00 ; |        | $FD48
    .byte $34 ; |  XX X  | $FD49
    .byte $62 ; | XX   X | $FD4A
    .byte $97 ; |X  X XXX| $FD4B
    .byte $0C ; |    XX  | $FD4C
    .byte $1E ; |   XXXX | $FD4D
    .byte $3E ; |  XXXXX | $FD4E
    .byte $7D ; | XXXXX X| $FD4F
    .byte $39 ; |  XXX  X| $FD50
    .byte $18 ; |   XX   | $FD51
    .byte $0C ; |    XX  | $FD52
    .byte $3E ; |  XXXXX | $FD53
    .byte $7B ; | XXXX XX| $FD54
    .byte $33 ; |  XX  XX| $FD55
    .byte $0F ; |    XXXX| $FD56
    .byte $06 ; |     XX | $FD57
    .byte $00 ; |        | $FD58
    .byte $0E ; |    XXX | $FD59
    .byte $24 ; |  X  X  | $FD5A
    .byte $74 ; | XXX X  | $FD5B
    .byte $CC ; |XX  XX  | $FD5C
    .byte $1E ; |   XXXX | $FD5D
    .byte $3E ; |  XXXXX | $FD5E
    .byte $3D ; |  XXXX X| $FD5F
    .byte $78 ; | XXXX   | $FD60
    .byte $18 ; |   XX   | $FD61
    .byte $0C ; |    XX  | $FD62
    .byte $3E ; |  XXXXX | $FD63
    .byte $73 ; | XXX  XX| $FD64
    .byte $3B ; |  XXX XX| $FD65
    .byte $0F ; |    XXXX| $FD66
    .byte $06 ; |     XX | $FD67
LFD68:
    .byte $C8,$B1,$42,$A8,$68,$20,$89,$AD,$AC,$9C,$B3,$C8,$C8,$D0,$E7,$AD
    .byte $D3,$B5,$AC,$D4,$B5,$20,$89,$AD,$38,$B0,$D1,$20,$FB,$AF,$4C,$7F
    .byte $B3,$38,$20,$DD,$B2,$A9,$00,$A2,$05,$9D,$F0,$B5,$CA,$10,$FA,$60
    .byte $20,$DC,$AB,$A9,$FF,$8D,$F9,$B5,$20,$F7,$AF,$A9,$16,$8D,$9D,$B3
    .byte $20,$2F,$AE,$20,$2F,$AE,$A2,$0B,$BD,$AF,$B3,$20,$ED,$FD,$CA,$10
    .byte $F7,$86,$45,$AD,$F6,$B7,$85,$44,$20,$42,$AE,$20,$2F,$AE,$20,$2F
    .byte $AE,$18,$20,$11,$B0,$B0,$5D,$A2,$00,$8E,$9C,$B3,$BD,$C6,$B4,$F0
    .byte $53,$30,$4A,$A0,$A0,$BD,$C8,$B4,$10,$02,$A0,$AA,$98,$20,$ED,$FD
    .byte $BD,$C8,$B4,$29,$7F,$A0,$07,$0A,$0A,$B0,$03,$88,$D0,$FA,$B9,$A7
    .byte $B3,$20,$ED,$FD,$A9,$A0,$20,$ED
LFE00:
    .byte $FF ; |XXXXXXXX| $FE00
    .byte $00 ; |        | $FE01
    .byte $00 ; |        | $FE02
    .byte $00 ; |        | $FE03
    .byte $00 ; |        | $FE04
    .byte $00 ; |        | $FE05
    .byte $00 ; |        | $FE06
    .byte $00 ; |        | $FE07
    .byte $00 ; |        | $FE08
    .byte $00 ; |        | $FE09
  IF PAL
    .byte $00 ; |        |
  ENDIF
    .byte $FF ; |XXXXXXXX| $FE0A
    .byte $00 ; |        | $FE0B
    .byte $00 ; |        | $FE0C
    .byte $00 ; |        | $FE0D
    .byte $00 ; |        | $FE0E
    .byte $00 ; |        | $FE0F
    .byte $00 ; |        | $FE10
    .byte $00 ; |        | $FE11
    .byte $00 ; |        | $FE12
    .byte $00 ; |        | $FE13
  IF PAL
    .byte $00 ; |        |
  ENDIF
    .byte $FF ; |XXXXXXXX| $FE14
    .byte $00 ; |        | $FE15
    .byte $00 ; |        | $FE16
    .byte $00 ; |        | $FE17
    .byte $00 ; |        | $FE18
    .byte $00 ; |        | $FE19
    .byte $00 ; |        | $FE1A
    .byte $00 ; |        | $FE1B
    .byte $00 ; |        | $FE1C
    .byte $00 ; |        | $FE1D
  IF PAL
    .byte $00 ; |        |
  ENDIF
    .byte $FF ; |XXXXXXXX| $FE1E
    .byte $00 ; |        | $FE1F
    .byte $00 ; |        | $FE20
    .byte $00 ; |        | $FE21
    .byte $00 ; |        | $FE22
    .byte $00 ; |        | $FE23
    .byte $00 ; |        | $FE24
    .byte $00 ; |        | $FE25
    .byte $00 ; |        | $FE26
    .byte $00 ; |        | $FE27
  IF PAL
    .byte $00 ; |        |
  ENDIF
    .byte $FF ; |XXXXXXXX| $FE28
    .byte $00 ; |        | $FE29
    .byte $00 ; |        | $FE2A
    .byte $00 ; |        | $FE2B
    .byte $00 ; |        | $FE2C
    .byte $00 ; |        | $FE2D
    .byte $00 ; |        | $FE2E
    .byte $00 ; |        | $FE2F
    .byte $00 ; |        | $FE30
    .byte $00 ; |        | $FE31
  IF PAL
    .byte $00 ; |        |
  ENDIF
    .byte $FF ; |XXXXXXXX| $FE32
    .byte $00 ; |        | $FE33
    .byte $00 ; |        | $FE34
    .byte $00 ; |        | $FE35
    .byte $00 ; |        | $FE36
    .byte $00 ; |        | $FE37
    .byte $00 ; |        | $FE38
    .byte $00 ; |        | $FE39
    .byte $00 ; |        | $FE3A
    .byte $00 ; |        | $FE3B
  IF PAL
    .byte $00 ; |        |
  ENDIF
    .byte $FF ; |XXXXXXXX| $FE3C
    .byte $00 ; |        | $FE3D
    .byte $00 ; |        | $FE3E
    .byte $00 ; |        | $FE3F
    .byte $00 ; |        | $FE40
    .byte $00 ; |        | $FE41
    .byte $00 ; |        | $FE42
    .byte $00 ; |        | $FE43
    .byte $00 ; |        | $FE44
    .byte $00 ; |        | $FE45
  IF PAL
    .byte $00 ; |        |
  ENDIF
    .byte $FF ; |XXXXXXXX| $FE46
 IF ZELLERS
    .byte $00 ; |        | $FE47
    .byte $00 ; |        | $FE48
  ENDIF
LFE49:
    .byte $00,$00,$00,$09,$09,$09,$09,$09,$09,$0A,$0A,$09,$09,$08,$08,$08
    .byte $08,$09,$09,$09,$09,$08,$07,$07,$07,$08,$09,$0C,$0F,$0E,$0C,$0C
    .byte $0C,$00,$00,$0C,$0C,$0F,$0C,$0B,$0C,$0B,$09,$0B,$09,$0A,$0B,$0B
    .byte $0B,$0A,$09,$09,$09,$08,$07,$07,$07,$08,$09,$0C,$0F,$0E,$0C,$0C
    .byte $0C

  IF ZELLERS
    .byte $00,$00
  ENDIF
LFE8C:
    .byte $00,$00,$00,$0F,$0F,$0F,$0F,$0F,$0F,$0E,$0E,$0E,$0E,$0C,$0C,$0C
    .byte $0C,$0F,$0F,$09,$09,$0A,$09,$09,$09,$0A,$0C,$0F,$13,$11,$0F,$0F
    .byte $0F,$00,$00,$0F,$0F,$13,$0F,$0E,$0F,$0E,$0B,$0E,$0B,$0C,$0E,$0E
    .byte $0E,$0C,$0F,$09,$09,$0A,$09,$09,$09,$0A,$0C,$0F,$13,$11,$0F,$0F
    .byte $0F,$00
  IF ZELLERS
    .byte $AF,$A2,$00
  ENDIF
    .byte $8A,$9D,$BB,$B4,$E8,$D0,$FA,$20,$45,$B0,$A9
    .byte $11,$AC,$F0,$B3,$88,$88,$8D,$EC,$B7,$8D,$BC,$B4,$8C,$BD,$B4,$C8
    .byte $8C,$ED,$B7,$A9,$02,$20,$58,$B0,$AC,$BD,$B4,$88,$30,$05,$D0,$EC
    .byte $98,$F0,$E6,$20
BlankTwo:
    .byte $00 ; |        | $FF00
    .byte $00 ; |        | $FF01
    .byte $00 ; |        | $FF02
    .byte $00 ; |        | $FF03
    .byte $00 ; |        | $FF04
    .byte $00 ; |        | $FF05
    .byte $00 ; |        | $FF06
    .byte $00 ; |        | $FF07
Zero:
    .byte $00 ; |        | $FF08
    .byte $3C ; |  XXXX  | $FF09
    .byte $66 ; | XX  XX | $FF0A
    .byte $66 ; | XX  XX | $FF0B
    .byte $66 ; | XX  XX | $FF0C
    .byte $66 ; | XX  XX | $FF0D
    .byte $66 ; | XX  XX | $FF0E
    .byte $3C ; |  XXXX  | $FF0F
One:
    .byte $00 ; |        | $FF10
    .byte $3C ; |  XXXX  | $FF11
    .byte $18 ; |   XX   | $FF12
    .byte $18 ; |   XX   | $FF13
    .byte $18 ; |   XX   | $FF14
    .byte $18 ; |   XX   | $FF15
    .byte $38 ; |  XXX   | $FF16
    .byte $18 ; |   XX   | $FF17
Two:
    .byte $00 ; |        | $FF18
    .byte $7E ; | XXXXXX | $FF19
    .byte $60 ; | XX     | $FF1A
    .byte $60 ; | XX     | $FF1B
    .byte $3C ; |  XXXX  | $FF1C
    .byte $06 ; |     XX | $FF1D
    .byte $46 ; | X   XX | $FF1E
    .byte $3C ; |  XXXX  | $FF1F
Three:
    .byte $00 ; |        | $FF20
    .byte $3C ; |  XXXX  | $FF21
    .byte $46 ; | X   XX | $FF22
    .byte $06 ; |     XX | $FF23
    .byte $1C ; |   XXX  | $FF24
    .byte $06 ; |     XX | $FF25
    .byte $46 ; | X   XX | $FF26
    .byte $3C ; |  XXXX  | $FF27
Four:
    .byte $00 ; |        | $FF28
    .byte $0C ; |    XX  | $FF29
    .byte $0C ; |    XX  | $FF2A
    .byte $7E ; | XXXXXX | $FF2B
    .byte $6C ; | XX XX  | $FF2C
    .byte $3C ; |  XXXX  | $FF2D
    .byte $1C ; |   XXX  | $FF2E
    .byte $0C ; |    XX  | $FF2F
Five:
    .byte $00 ; |        | $FF30
    .byte $7C ; | XXXXX  | $FF31
    .byte $06 ; |     XX | $FF32
    .byte $06 ; |     XX | $FF33
    .byte $7C ; | XXXXX  | $FF34
    .byte $60 ; | XX     | $FF35
    .byte $60 ; | XX     | $FF36
    .byte $7E ; | XXXXXX | $FF37
Six:
    .byte $00 ; |        | $FF38
    .byte $3C ; |  XXXX  | $FF39
    .byte $66 ; | XX  XX | $FF3A
    .byte $66 ; | XX  XX | $FF3B
    .byte $7C ; | XXXXX  | $FF3C
    .byte $60 ; | XX     | $FF3D
    .byte $62 ; | XX   X | $FF3E
    .byte $3C ; |  XXXX  | $FF3F
Seven:
    .byte $00 ; |        | $FF40
    .byte $18 ; |   XX   | $FF41
    .byte $18 ; |   XX   | $FF42
    .byte $18 ; |   XX   | $FF43
    .byte $0C ; |    XX  | $FF44
    .byte $06 ; |     XX | $FF45
    .byte $66 ; | XX  XX | $FF46
    .byte $7E ; | XXXXXX | $FF47
Eight:
    .byte $00 ; |        | $FF48
    .byte $3C ; |  XXXX  | $FF49
    .byte $66 ; | XX  XX | $FF4A
    .byte $66 ; | XX  XX | $FF4B
    .byte $3C ; |  XXXX  | $FF4C
    .byte $66 ; | XX  XX | $FF4D
    .byte $66 ; | XX  XX | $FF4E
    .byte $3C ; |  XXXX  | $FF4F
Nine:
    .byte $00 ; |        | $FF50
    .byte $3C ; |  XXXX  | $FF51
    .byte $46 ; | X   XX | $FF52
    .byte $06 ; |     XX | $FF53
    .byte $3E ; |  XXXXX | $FF54
    .byte $66 ; | XX  XX | $FF55
    .byte $66 ; | XX  XX | $FF56
    .byte $3C ; |  XXXX  | $FF57
Colon:
    .byte $00 ; |        | $FF58
    .byte $18 ; |   XX   | $FF59
    .byte $18 ; |   XX   | $FF5A
    .byte $00 ; |        | $FF5B
    .byte $00 ; |        | $FF5C
    .byte $18 ; |   XX   | $FF5D
    .byte $18 ; |   XX   | $FF5E
    .byte $00 ; |        | $FF5F
;===============================
  IF FUNVISION
LogoOne:
    .byte $00 ; |        | $FF60
    .byte $9D ; |X  XXX X| $FF61
    .byte $95 ; |X  X X X| $FF62
    .byte $95 ; |X  X X X| $FF63
    .byte $F5 ; |XXXX X X| $FF64
    .byte $95 ; |X  X X X| $FF65
    .byte $80 ; |X       | $FF66
    .byte $E0 ; |XXX     | $FF67
LogoTwo:
    .byte $00 ; |        | $FF68
    .byte $28 ; |  X X   | $FF69
    .byte $6C ; | XX XX  | $FF6A
    .byte $EE ; |XXX XXX | $FF6B
    .byte $AA ; |X X X X | $FF6C
    .byte $29 ; |  X X  X| $FF6D
    .byte $00 ; |        | $FF6E
    .byte $00 ; |        | $FF6F
LogoThree:
    .byte $00 ; |        | $FF70
    .byte $BA ; |X XXX X | $FF71
    .byte $8A ; |X   X X | $FF72
    .byte $BA ; |X XXX X | $FF73
    .byte $A2 ; |X X   X | $FF74
    .byte $38 ; |  XXX   | $FF75
    .byte $82 ; |X     X | $FF76
    .byte $00 ; |        | $FF77
LogoFour:
    .byte $00 ; |        | $FF78
    .byte $E9 ; |XXX X  X| $FF79
    .byte $AB ; |X X X XX| $FF7A
    .byte $AF ; |X X XXXX| $FF7B
    .byte $AD ; |X X XX X| $FF7C
    .byte $E9 ; |XXX X  X| $FF7D
    .byte $00 ; |        | $FF7E
    .byte $00 ; |        | $FF7F
  ELSE
LogoOne:
    .byte $00 ; |        | $FF60
    .byte $00 ; |        | $FF61
    .byte $00 ; |        | $FF62
    .byte $00 ; |        | $FF63
    .byte $00 ; |        | $FF64
    .byte $00 ; |        | $FF65
    .byte $00 ; |        | $FF66
    .byte $00 ; |        | $FF67
LogoTwo:
    .byte $00 ; |        | $FF68
    .byte $00 ; |        | $FF69
    .byte $00 ; |        | $FF6A
    .byte $00 ; |        | $FF6B
    .byte $00 ; |        | $FF6C
    .byte $00 ; |        | $FF6D
    .byte $00 ; |        | $FF6E
    .byte $00 ; |        | $FF6F
LogoThree:
    .byte $00 ; |        | $FF70
    .byte $00 ; |        | $FF71
    .byte $00 ; |        | $FF72
    .byte $00 ; |        | $FF73
    .byte $00 ; |        | $FF74
    .byte $00 ; |        | $FF75
    .byte $00 ; |        | $FF76
    .byte $00 ; |        | $FF77
LogoFour:
    .byte $00 ; |        | $FF78
    .byte $00 ; |        | $FF79
    .byte $00 ; |        | $FF7A
    .byte $00 ; |        | $FF7B
    .byte $00 ; |        | $FF7C
    .byte $00 ; |        | $FF7D
    .byte $00 ; |        | $FF7E
    .byte $00 ; |        | $FF7F
  ENDIF
;===============================
LFF80:
    .byte $B5,$AF,$AD,$BB,$B5,$C9,$04,$F0,$02,$38,$60,$20,$44,$B2,$A0,$02
    .byte $91,$42,$48,$88,$AD,$F1,$B5,$91,$42,$48,$20,$3A,$AF,$20,$D6,$B7
    .byte $A0,$05,$AD,$DE,$B5,$91,$42,$C8,$AD,$DF,$B5,$91,$42,$68,$AA,$68
    .byte $A8,$A9,$02,$D0,$02,$A9,$01,$8E,$D3,$B5,$8C,$D4,$B5,$20,$52,$B0
    .byte $A0,$05,$B1,$42,$8D,$DC,$B5,$18,$6D,$DA,$B5,$8D,$DE,$B5,$C8,$B1
    .byte $42,$8D,$DD,$B5,$6D,$DB,$B5,$8D,$DF,$B5,$18,$60,$20,$E4,$AF,$A9
    .byte $01,$4C,$52,$B0,$AC,$CB,$B5,$AD,$CC,$B5,$8C,$F0,$B7,$8D,$F1,$B7
    .byte $AE,$D6,$B5,$AC,$D7,$B5,$60,$A9,UNK_13,$D0,$02,UNK_14

    ORG $FFFC

    .word START
    .byte $C3
  IF TWO_ZERO_EIGHT
    .byte $C9
  ELSE
    .byte $AA
  ENDIF
  
;HES
;LFFF7:
;    LDA    #$2C            ; 2
;    BNE    LFFFD           ; 2
;LFFFB:
;    JMP    LF000           ; 3
;    .byte $C3 ;.DCP        ; 8
;    TAX                    ; 2

;zellers
;LFFF7:
;    LDA    #$01            ; 2
;    BNE    LFFFD           ; 2
;LFFFB:
;    LDA    #$00            ; 2
;LFFFD:
;    BEQ    LFFC2           ; 2
;    TAX                    ; 2
