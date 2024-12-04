; Disassembly of Boxing
; Disassembled by Omegamatrix
;
;
; This hack hides the players hits until the end of the round.
;
;
;
; boxing.cfg contents:
;
;      ORG F000
;      CODE F000 F3FF
;      GFX F400 F476
;      CODE F477 F53B
;      GFX F53C F5FE
;      CODE F5FF F64F
;      GFX F650 F6FB
;      CODE F6FC F75E
;      GFX F75F F7FF

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
REFP0   =  $0B
REFP1   =  $0C
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESBL   =  $14
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMBL    =  $24
VDELP0  =  $25
HMOVE   =  $2A
HMCLR   =  $2B
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;==================================================================================================
;              USER CONSTANTS
;==================================================================================================

;==================================================================================================
;              RAM LOCATIONS
;==================================================================================================

;frameCount      = $80
;col_P0          = $81
;col_P1          = $82
;col_Ropes       = $83
;col_Background  = $84




;==================================================================================================
;              MAIN PROGRAM
;==================================================================================================

       ORG $F000

START:
    SEI                    ;
    CLD                    ;
    LDX    #$FF            ;
    TXS                    ;
    INX                    ;
    TXA                    ;
.loopClear:
    STA    0,X             ;
    INX                    ;
    BNE    .loopClear      ;

    INC    $DD             ; 5
    JSR    LF3C6           ; 6
    JMP    LF16F           ; 3

LF014:
    TAY                    ; 2
    LDA    ($A4),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($A6),Y         ; 5
LF01B:
    STA    HMP0            ; 3
    SEC                    ; 2
    TAY                    ; 2
    TXA                    ; 2
    SBC    $C0             ; 3
    CMP    #$10            ; 2
    STY    NUSIZ0          ; 3
    STA    HMOVE           ; 3
    BEQ    LF05C           ; 2³
    NOP                    ; 2
LF02B:
    BCS    LF07F           ; 2³
    TAY                    ; 2
    LDA    ($A8),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($AA),Y         ; 5
LF034:
    STA    NUSIZ1          ; 3
    STA    HMP1            ; 3
    SEC                    ; 2
LF039:
    TXA                    ; 2
    INX                    ; 2
    SBC    $BF             ; 3
    CMP    #$10            ; 2
    BCC    LF014           ; 2³
    BNE    LF06B           ; 2³
    LDY    $85             ; 3
    INC    $85             ; 5
    LDA.wy $C2,Y           ; 4
    STA    $BF             ; 3
    LDA.wy $CA,Y           ; 4
    STA    $A4             ; 3
    STA    $A6             ; 3
    TXA                    ; 2
    SBC    $C0             ; 3
    CMP    #$10            ; 2
    STA    HMOVE           ; 3
    BNE    LF02B           ; 2³
LF05C:
    PLA                    ; 4
    STA    $C0             ; 3
    PLA                    ; 4
    STA    $A8             ; 3
    STA    $AA             ; 3
    AND    #$0F            ; 2
    STA.w  $001C           ; 4
    BCS    LF039           ; 2³
LF06B:
    LDA    #0              ; 2
    STA    GRP0            ; 3
    STA    GRP0            ; 3
    NOP                    ; 2
    BPL    LF01B           ; 2³
LF074:
    LDX    #0              ; 2
    STA    HMCLR           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    INY                    ; 2
    STY    PF1             ; 3   vertical cross rope
LF07F:
    LDA    #0              ; 2
    CPX    #$8C            ; 2
    STA    GRP1            ; 3
    STA.w  $000F           ; 4
    BCC    LF034           ; 2³
    TAX                    ; 2
    LDA    #$45            ; 2
    LDY    #$2C            ; 2
    JSR    LF364           ; 6
    JSR    LF633           ; 6
    STX    PF1             ; 3
    STX    COLUPF          ; 3
    STX    VDELP0          ; 3
    STX    REFP0           ; 3
    JSR    LF3B3           ; 6
    JSR    LF383           ; 6
    LDA    #$22            ; 2
    STA    TIM64T          ; 4
    LDA    $D7             ; 3
    BEQ    LF0D7           ; 2³
    DEC    $94             ; 5
    BPL    LF0D7           ; 2³
    LDA    #$3B            ; 2
    STA    $94             ; 3
    LDA    $91             ; 3
    SEC                    ; 2
    SED                    ; 2
    SBC    #1              ; 2
    CLD                    ; 2
    BCS    LF0C5           ; 2³
    LDA    $90             ; 3
    SBC    #$0F            ; 2
    STA    $90             ; 3
    LDA    #$59            ; 2
LF0C5:
    STA    $91             ; 3
    TAY                    ; 2
    BNE    LF0D7           ; 2³
    LDY    $90             ; 3
    CPY    #$0B            ; 2
    BNE    LF0D7           ; 2³
    STA    $D7             ; 3
    LDA    #$40            ; 2
    JSR    LF3E9           ; 6
LF0D7:
    LDA    SWCHA           ; 4
    STA    $8E             ; 3
    LDY    $D9             ; 3
    BEQ    LF0EF           ; 2³
    LDA    $92             ; 3
    SED                    ; 2
    SBC    #4              ; 2
    CLD                    ; 2
    CMP    $93             ; 3
    LDA    $90             ; 3
    EOR    #$14            ; 2
    JSR    LF6FC           ; 6
LF0EF:
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    $8F             ; 3
    LDX    #4              ; 2
LF0F7:
    LDY    INTIM           ; 4
    BNE    LF0F7           ; 2³
    DEY                    ; 2
    STA    WSYNC           ; 3
    STY    VSYNC           ; 3
    STY    VBLANK          ; 3
    STA    RESBL           ; 3
    STA    HMCLR           ; 3
    STY    ENABL           ; 3
    LDA    #$31            ; 2
    STA    CTRLPF          ; 3
    INC    $80             ; 5
    BNE    LF117           ; 2³
    INC    $96             ; 5
    BNE    LF117           ; 2³
    STY    $97             ; 3
LF117:
    LDA    SWCHB           ; 4
    STA    $DA             ; 3
    AND    #$08            ; 2
    BNE    LF122           ; 2³
    LDY    #$0F            ; 2
LF122:
    TYA                    ; 2
    LDY    $97             ; 3
    BPL    LF129           ; 2³
    AND    #$F7            ; 2
LF129:
    STA    $AD             ; 3
LF12B:
    LDA    $96             ; 3
    AND    $97             ; 3
    EOR    LF54C,X         ; 4   X = 4,3,2,1
    AND    $AD             ; 3
    STA    $80,X           ; 4   stores colors, among other things
    STA    NUSIZ1,X        ; 4
    DEX                    ; 2
    BNE    LF12B           ; 2³
    STX    COLUPF          ; 3   black
    STX    AUDC1           ; 3
    LDA    #$28            ; 2
    STA    HMBL            ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STX    VSYNC           ; 3
    STA    TIM64T          ; 4
    LDA    $95             ; 3
    BEQ    LF158           ; 2³
    DEC    $DC             ; 5
    LDX    $DC             ; 3
    BNE    LF158           ; 2³
    STX    $95             ; 3
LF158:
    STA    AUDC0           ; 3
    TXA                    ; 2
    LSR                    ; 2
    STA    AUDV0           ; 3
    LDA    $DA             ; 3
    LSR                    ; 2
    BCS    LF168           ; 2³
    JSR    LF3C6           ; 6
    STA    $D7             ; 3
LF168:
    LSR                    ; 2
    BCS    LF18C           ; 2³
    DEC    $D8             ; 5
    BPL    LF18E           ; 2³
LF16F:
    LDY    $D9             ; 3
    INY                    ; 2
    TYA                    ; 2
    AND    #$01            ; 2
    STA    $D9             ; 3
    STA    $97             ; 3
    STA    $96             ; 3
    STY    $92             ; 3
    LSR                    ; 2
    STA    $97             ; 3
    LDA    #$AA            ; 2
    STA    $93             ; 3
    STA    $90             ; 3
    STA    $91             ; 3
    STX    $D7             ; 3
    LDX    #$1D            ; 2
LF18C:
    STX    $D8             ; 3
LF18E:
    LDX    #1              ; 2
LF190:
    TXA                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    TAY                    ; 2
    ASL    $DA             ; 5
    LDA    $D7             ; 3
    BEQ    LF1B6           ; 2³
    TXA                    ; 2
    EOR    $D2             ; 3
    BNE    LF1A3           ; 2³
    LDA    $D1             ; 3
    BNE    LF1B6           ; 2³
LF1A3:
    LDA.wy $B7,Y           ; 4
    ORA.wy $B9,Y           ; 4
    AND    #$C0            ; 2
    BNE    LF1B6           ; 2³
    LDY    $8E,X           ; 4
    BCC    LF1B8           ; 2³
    LDA    $80             ; 3
    LSR                    ; 2
    BCS    LF1B8           ; 2³
LF1B6:
    LDY    #$F0            ; 2
LF1B8:
    TYA                    ; 2
    LDY    $A0,X           ; 4
    STA    $AC             ; 3
    JSR    LF3B9           ; 6
    JSR    LF49A           ; 6
    JSR    LF3F3           ; 6
    STY    $A0,X           ; 4
    STX    $D4             ; 3
    CPY    $A1             ; 3
    BCC    LF1D0           ; 2³
    INC    $D4             ; 5
LF1D0:
    LDY    $A2,X           ; 4
    JSR    LF3B9           ; 6
    CPY    #3              ; 2
    BCS    LF1DB           ; 2³
    LDY    #3              ; 2
LF1DB:
    CPY    #$58            ; 2
    BCC    LF1E1           ; 2³
    LDY    #$57            ; 2
LF1E1:
    STY    $A2,X           ; 4
    JSR    LF3F3           ; 6
    STY    $A2,X           ; 4
    DEX                    ; 2
    BPL    LF190           ; 2³
    JSR    LF48C           ; 6
    CMP    #$1A            ; 2
    LDY    #$38            ; 2
    BCS    LF20B           ; 2³
    CMP    #$12            ; 2
    BCS    LF1FA           ; 2³
    LDY    #$28            ; 2
LF1FA:
    JSR    LF47E           ; 6
    CMP    #7              ; 2
    BCC    LF210           ; 2³
    CMP    #$1C            ; 2
    BCC    LF20B           ; 2³
    CMP    #$2F            ; 2
    BCC    LF210           ; 2³
    LDY    #$38            ; 2
LF20B:
    TYA                    ; 2
    CLC                    ; 2
    ADC    #$10            ; 2
    TAY                    ; 2
LF210:
    STY    $AE             ; 3
    LDX    #7              ; 2
    NOP                    ; 2
LF215:
    TXA                    ; 2
    LSR                    ; 2
    PHP                    ; 3
    LSR                    ; 2
    TAY                    ; 2
    PLP                    ; 4
    BCS    LF27A           ; 2³
    LDA    $A2             ; 3
    LSR    $AF,X           ; 6
    BCS    LF268           ; 2³
    SBC    $A3             ; 3
    EOR    LF54E,X         ; 4
    ORA    $E3,X           ; 4
    ASL                    ; 2
    LDA    #8              ; 2
    BCC    LF23B           ; 2³
    LDA    $D1             ; 3
    BEQ    LF239           ; 2³
    LDA    #$F8            ; 2
    CPY    $D2             ; 3
    BNE    LF23B           ; 2³
LF239:
    LDA    #$FE            ; 2
LF23B:
    CLC                    ; 2
    ADC    $B7,X           ; 4
    BMI    LF246           ; 2³
    CMP    $98,X           ; 4
    BCC    LF254           ; 2³
    BEQ    LF254           ; 2³
LF246:
    LDA    $B7,X           ; 4
    CMP    $98,X           ; 4
    BEQ    LF25F           ; 2³
    LSR                    ; 2
    LDA    $B7,X           ; 4
    SBC    #1              ; 2
    CLC                    ; 2
    BMI    LF261           ; 2³
LF254:
    STA    $B7,X           ; 4
    BCC    LF268           ; 2³
    LDA    $EB,X           ; 4
    BPL    LF261           ; 2³
    JSR    LF4A9           ; 6
LF25F:
    LDA    $E3,X           ; 4
LF261:
    STA    $EB,X           ; 4
    JSR    LF4F2           ; 6
    STA    $E3,X           ; 4
LF268:
    LDA    $98,X           ; 4
    CMP    $AE             ; 3
    BEQ    LF27A           ; 2³
    BCS    LF272           ; 2³
    ADC    #$11            ; 2
LF272:
    ADC    #$F7            ; 2
    CMP    $B7,X           ; 4
    BEQ    LF27A           ; 2³
    STA    $98,X           ; 4
LF27A:
    LDA.wy $A2,Y           ; 4
    CLC                    ; 2
    ADC    LF558,X         ; 4
    STA    $C1,X           ; 4
    LDA    $B7,X           ; 4
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDA    LF53C,Y         ; 4
    CLC                    ; 2
    ADC    LF551,X         ; 4
    STA    $C9,X           ; 4
    DEX                    ; 2
    BPL    LF215           ; 2³
    LDA    $D4             ; 3
    ASL                    ; 2
    ASL                    ; 2
    TAX                    ; 2
    LDA    $C1,X           ; 4
    STA    $BF             ; 3
    LDA    $C9,X           ; 4
    STA    $A4             ; 3
    STA    $A6             ; 3
    STX    $85             ; 3
    TXA                    ; 2
    EOR    #$07            ; 2
    TAX                    ; 2
    LDY    #2              ; 2
    LDA    #0              ; 2
LF2AE:
    PHA                    ; 3
    LDA    $C1,X           ; 4
    PHA                    ; 3
    DEX                    ; 2
    LDA    $C9,X           ; 4
    DEY                    ; 2
    BPL    LF2AE           ; 2³
    STA    $A8             ; 3
    STA    $AA             ; 3
    LDA    $C1,X           ; 4
    STA    $C0             ; 3
    LDA    $DB             ; 3
    BEQ    LF2C6           ; 2³
    DEC    $DB             ; 5
LF2C6:
    LDA    $D1             ; 3
    BEQ    LF2FE           ; 2³
    LDA    $D2             ; 3
    TAX                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    TAY                    ; 2
    LDA    #8              ; 2
    DEC    $D1             ; 5
    BNE    LF2D8           ; 2³
    LDA    #0              ; 2
LF2D8:
    STA.wy $B8,Y           ; 5
    LDA    #$29            ; 2
    STA.wy $B7,Y           ; 5
    STA.wy $B9,Y           ; 5
    LDY    $D3             ; 3
    LDA    LF651,Y         ; 4
    CLC                    ; 2
    ADC    $A2,X           ; 4
    STA    $A2,X           ; 4
    LDA    $D4             ; 3
    CMP    #1              ; 2
    BCC    LF2F5           ; 2³
    LDA    #$FF            ; 2
LF2F5:
    EOR    LF652,Y         ; 4
    ADC    $A0,X           ; 4
    TAY                    ; 2
    JSR    LF49A           ; 6
LF2FE:
    LDX    INTIM           ; 4
    BNE    LF2FE           ; 2³
    STX    WSYNC           ; 3
    STX    VBLANK          ; 3
    STA    HMCLR           ; 3
    LDX    #4              ; 2
    STX    NUSIZ0          ; 3
    STX    NUSIZ1          ; 3
    LDY    #$60            ; 2
    LDA    $81             ; 3

    JMP    NewCode
    
;LF313:
;    STY    HMP0            ; 3
;    STY    HMP1            ; 3
;    STA    $D5             ; 3
;    LDY    #2              ; 2
;LF31B:
;    DEX                    ; 2
;    BMI    LF34B           ; 2³
;    JSR    LF62E           ; 6
;    LDA    $90,X           ; 4
;    AND    #$0F            ; 2
;    STA.wy $86,Y           ; 5
;    LDA    $90,X           ; 4
;    LSR                    ; 2
;    LSR                    ; 2
;    LSR                    ; 2
;    LSR                    ; 2
;    BNE    LF336           ; 2³
;    CPX    #2              ; 2
;    BCC    LF336           ; 2³
;    LDA    #$0A            ; 2   blank digit
;LF336:
;    STA.wy $8A,Y           ; 5
;    JSR    LF62E           ; 6
;    DEY                    ; 2
;    DEY                    ; 2
;    BPL    LF31B           ; 2³
;    JSR    LF383           ; 6
;    LDY    #$A0            ; 2
;    LDA    $84             ; 3
;    EOR    #$06            ; 2
;    BCS    LF313           ; 2³
;LF34B:
;    JSR    LF633           ; 6
;    LDX    $D4             ; 3
;    LDA    $A1             ; 3
;    LDY    $A0             ; 3
;    JSR    LF364           ; 6
;    STY    REFP0           ; 3
;    LDY    #$0F            ; 2
;    STY    AUDF1           ; 3
;    STY    AUDV1           ; 3
;    STY    VDELP0          ; 3
;    JMP    LF074           ; 3
    
    
    
    
    
    ORG $F364

LF364:
    JSR    LF62E           ; 6
    PHA                    ; 3
    TYA                    ; 2
    LDY    #$3F            ; 2   cross rope
    STY    PF1             ; 3
    LDY    #$FF            ; 2
    STY    PF2             ; 3
    JSR    LF62E           ; 6
    LDY    $81             ; 3   color left player
    JSR    LF5FF           ; 6
    TXA                    ; 2
    EOR    #$01            ; 2
    TAX                    ; 2
    LDY    $82             ; 3   color right player
    PLA                    ; 4
    JMP    LF5FF           ; 3
LF383:
    SEC                    ; 2
    LDA    #$77            ; 2
LF386:
    STA    WSYNC           ; 3
    SBC    #$11            ; 2
    TAY                    ; 2
    LDA    ($8A),Y         ; 5
    STA    GRP0            ; 3
    LDA    $D5             ; 3
    STA    COLUP0          ; 3   score color left player 10's digit, minutes digit, 10's seconds digit, logo part A, logo part C
    STA    COLUP1          ; 3   score color left player 1's digit, colon digit, 1's seconds digit, logo part B, logo part D
    LDA    ($86),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($8C),Y         ; 5
    STX    $AC             ; 3
    TAX                    ; 2
    LDA    ($88),Y         ; 5
    STX    GRP0            ; 3
    STA    GRP1            ; 3
    LDA    $82             ; 3
    STA    COLUP0          ; 3   score color right player 10's digit, also "K"
    STA    COLUP1          ; 3   score color right player 1's digit
    LDX    $AC             ; 3
    TYA                    ; 2
    BNE    LF386           ; 2³
    STA    GRP0            ; 3
    STA    GRP1            ; 3
LF3B3:
    INY                    ; 2
    STY    NUSIZ0          ; 3
    STY    NUSIZ1          ; 3
    RTS                    ; 6

LF3B9:
    ASL    $AC             ; 5
    STY    $AD             ; 3
    BCS    LF3C0           ; 2³
    INY                    ; 2
LF3C0:
    ASL    $AC             ; 5
    BCS    LF3C5           ; 2³
    DEY                    ; 2
LF3C5:
    RTS                    ; 6

LF3C6 SUBROUTINE
    LDX    #$14            ; 2
    LDY    #9              ; 2
    STY    AUDF0           ; 3
LF3CC:
    LDA    #0              ; 2
    STA.wy $91,Y           ; 5
    STA    $96,X           ; 4
    TXA                    ; 2
    STA    $9E,X           ; 4
    LDA    #$F4            ; 2
    STA    $85,X           ; 4
    LDA    LF659,Y         ; 4
    STA    $9F,X           ; 4
    DEX                    ; 2
    DEX                    ; 2
    DEY                    ; 2
    BPL    LF3CC           ; 2³
    LDA    #$2B            ; 2
    STA    $90             ; 3
    RTS                    ; 6

LF3E9:
    STA    $DC             ; 3
    LSR                    ; 2
    EOR    #$0C            ; 2
    AND    #$0C            ; 2
    STA    $95             ; 3
    RTS                    ; 6

LF3F3:
    JSR    LF47E           ; 6
    BCS    LF3FF           ; 2³
    JSR    LF48C           ; 6
    BCS    LF3FF           ; 2³
    LDY    $AD             ; 3
LF3FF:
    RTS                    ; 6

;==============================================================================================================================
;               ALPHA-NUMERIC CHARACTERS AND LOGO GRAPHICS
;==============================================================================================================================
;
;      XXXX  | $3C       XXX   | $38      XXXXX  | $7C       XXXX  | $3C         XX  | $0C      XXXXXX | $7E
;     XX  XX | $66      XXXX   | $78      X   XX | $46      X   XX | $46        XXX  | $1C      XX     | $60
;     XX  XX | $66        XX   | $18          XX | $06          XX | $06       X XX  | $2C      XX     | $60
;     XX  XX | $66        XX   | $18       XXXX  | $3C         XX  | $0C      X  XX  | $4C      XXXXX  | $7C
;     XX  XX | $66        XX   | $18      XX     | $60          XX | $06      XXXXXX | $7E          XX | $06
;     XX  XX | $66        XX   | $18      XX     | $60      X   XX | $46         XX  | $0C      X   XX | $46
;      XXXX  | $3C      XXXXXX | $7E      XXXXXX | $7E       XXXX  | $3C         XX  | $0C      XXXXX  | $7C
;
;                                                                         blank digit           colon          (K)nockout
;      XXXX  | $3C      XXXXXX | $7E       XXXX  | $3C       XXXX  | $3C             | $00             | $00     XX   XX | $C6
;     XX   X | $62      X    X | $42      XX  XX | $66      XX  XX | $66             | $00        XX   | $18     XX  XX  | $CC
;     XX     | $60          XX | $06      XX  XX | $66      XX  XX | $66             | $00        XX   | $18     XX XX   | $D8
;     XXXXX  | $7C         XX  | $0C       XXXX  | $3C       XXXXX | $3E             | $00             | $00     XXXX    | $F0
;     XX  XX | $66        XX   | $18      XX  XX | $66          XX | $06             | $00        XX   | $18     XX XX   | $D8
;     XX  XX | $66        XX   | $18      XX  XX | $66      X   XX | $46             | $00        XX   | $18     XX  XX  | $CC
;      XXXX  | $3C        XX   | $18       XXXX  | $3C       XXXX  | $3C             | $00             | $00     XX   XX | $C6
;
;
;          XXXXXXXX    XXXXXXX
;       X     X   X   XX
;      XXX XX X X X  XX  XXX X XXX X  X
;      X X X  X X X XX X X   X X X XX X
;      XXX X  X X XXX  X XXX X X X XXXX
;      X X X  X X XX   X   X X X X X XX
;      X X XX X X X    X XXX X XXX X  X
;
;
;      logo (A)              logo (B)              logo (C)              logo (D)
;          XXXX  | $0F       XXXX      | $F0       XXXXXXX   | $FE                 | $00
;       X     X  | $41          X   X  | $11       X         | $80                 | $00
;      XXX XX X  | $ED        X X  XX  | $53         XXX X   | $3A       XXX X  X  | $E9
;      X X X  X  | $A9        X X XX   | $56       X X   X   | $A2       X X XX X  | $AD
;      XXX X  X  | $E9        X XXX    | $5C       X XXX X   | $BA       X X XXXX  | $AF
;      X X X  X  | $A9        X XX     | $58       X   X X   | $8A       X X X XX  | $AB
;      X X XX X  | $AD        X X      | $50       X XXX X   | $BA       XXX X  X  | $E9
;
;
;
; These graphics are stored "upside down" and shuffled inside the rom. Using a 17 byte wide table unshuffles the graphics, but
; they still are "upside down" from how they appear above.
;
;                                                               blank digit
;                                                                |
;                                                                |   colon
;                         number(s)                              |    |                logo parts
;                                                                |    |   "K"
;           0    1    2    3    4    5    6    7    8    9       |    |    |       (A)  (B)  (C)  (D)            rom address
;
    .byte $3C, $7E, $7E, $3C, $0C, $7C, $3C, $18, $3C, $3C,     $00, $00, $C6,     $AD, $50, $BA, $E9         ; $F400 - $F410
    .byte $66, $18, $60, $46, $0C, $46, $66, $18, $66, $46,     $00, $18, $CC,     $A9, $58, $8A, $AB         ; $F411 - $F421
    .byte $66, $18, $60, $06, $7E, $06, $66, $18, $66, $06,     $00, $18, $D8,     $E9, $5C, $BA, $AF         ; $F422 - $F432
    .byte $66, $18, $3C, $0C, $4C, $7C, $7C, $0C, $3C, $3E,     $00, $00, $F0,     $A9, $56, $A2, $AD         ; $F433 - $F443
    .byte $66, $18, $06, $06, $2C, $60, $60, $06, $66, $66,     $00, $18, $D8,     $ED, $53, $3A, $E9         ; $F444 - $F454
    .byte $66, $78, $46, $46, $1C, $60, $62, $42, $66, $66,     $00, $18, $CC,     $41, $11, $80, $00         ; $F455 - $F465
    .byte $3C, $38, $7C, $3C, $0C, $7E, $3C, $7E, $3C, $3C,     $00, $00, $C6,     $0F, $F0, $FE, $00         ; $F466 - $F476

;==============================================================================================================================

LF477:
    JSR    LF48C           ; 6
    CMP    #$1D            ; 2
    BCS    LF48B           ; 2³
LF47E:
    SEC                    ; 2
    LDA    $A2             ; 3
    SBC    $A3             ; 3
    BCS    LF489           ; 2³
    EOR    #$FF            ; 2
    ADC    #1              ; 2
LF489:
    CMP    #$30            ; 2
LF48B:
    RTS                    ; 6

LF48C:
    SEC                    ; 2
    LDA    $A0             ; 3
    SBC    $A1             ; 3
    BCS    LF497           ; 2³
    EOR    #$FF            ; 2
    ADC    #1              ; 2
LF497:
    CMP    #$0E            ; 2
    RTS                    ; 6

LF49A:
    CPY    #$1E            ; 2
    BCS    LF4A0           ; 2³
    LDY    #$1E            ; 2
LF4A0:
    CPY    #$6E            ; 2
    BCC    LF4A6           ; 2³
    LDY    #$6D            ; 2
LF4A6:
    STY    $A0,X           ; 4
    RTS                    ; 6

LF4A9:
    JSR    LF477           ; 6
    BCS    LF4F1           ; 2³
    ADC    #$F5            ; 2
    CMP    #$12            ; 2
    LDA    $D1             ; 3
    BNE    LF4F1           ; 2³
    LDA    $D7             ; 3
    BEQ    LF4F1           ; 2³
    LDA    #3              ; 2
    STA    $AF,X           ; 4
    LDA    #$0F            ; 2
    STA    AUDC1           ; 3
    BCS    LF4F1           ; 2³
    STA    $D1             ; 3
    STX    $D3             ; 3
    LDA    #$39            ; 2
    STA    $DB             ; 3
    CMP    $98,X           ; 4
    LDA.wy $92,Y           ; 4
    SED                    ; 2
    ADC    #1              ; 2
    CLD                    ; 2
    BCC    LF4D9           ; 2³
    LDA    #$C0            ; 2
LF4D9:
    STA.wy $92,Y           ; 5
    LDA    #$0F            ; 2
    BCC    LF4E6           ; 2³
    LDA    #0              ; 2
    STA    $D7             ; 3
    LDA    #$40            ; 2
LF4E6:
    JSR    LF3E9           ; 6
    TYA                    ; 2
    EOR    #$01            ; 2
    STA    $D2             ; 3
LF4EE:
    LDA.wy $0C,Y           ; 4
LF4F1:
    RTS                    ; 6

LF4F2:
    LDA    $D7             ; 3
    BEQ    LF539           ; 2³
    TYA                    ; 2
    AND    $D9             ; 3
    BEQ    LF4EE           ; 2³
    LDA    $DD             ; 3
    AND    #$1F            ; 2
    BEQ    LF51D           ; 2³
    LDA    $DB             ; 3
    BEQ    LF512           ; 2³
    LDA    $D2             ; 3
    BNE    LF512           ; 2³
    LDA    $A0             ; 3
    SEC                    ; 2
    SBC    #$28            ; 2
    CMP    #$50            ; 2
    BCS    LF51D           ; 2³
LF512:
    JSR    LF477           ; 6
    BCS    LF53A           ; 2³
    ADC    #$F5            ; 2
    CMP    #$15            ; 2
    BCS    LF53A           ; 2³
LF51D:
    LDA    $93             ; 3
    CMP    $92             ; 3
    LDA    $90             ; 3
    EOR    #$13            ; 2
    BIT    SWCHB           ; 4
    BPL    LF52C           ; 2³
    ORA    #$24            ; 2
LF52C:
    BCC    LF530           ; 2³
    ORA    #$0B            ; 2
LF530:
    AND    $DE             ; 3
    BNE    LF539           ; 2³
    CLC                    ; 2
    LDA    $EB,X           ; 4
    BMI    LF53A           ; 2³
LF539:
    SEC                    ; 2
LF53A:
    ROR                    ; 2
    RTS                    ; 6

LF53C:
    .byte $00 ; |        | $F53C
    .byte $10 ; |   X    | $F53D
    .byte $10 ; |   X    | $F53E
    .byte $10 ; |   X    | $F53F
    .byte $00 ; |        | $F540
    .byte $00 ; |        | $F541
    .byte $20 ; |  X     | $F542
    .byte $20 ; |  X     | $F543
LF544:
    .byte $30 ; |  XX    | $F544
    .byte $30 ; |  XX    | $F545
    .byte $0E ; |    XXX | $F546
    .byte $00 ; |        | $F547
    .byte $10 ; |   X    | $F548
    .byte $00 ; |        | $F549
    .byte $0D ; |    XX X| $F54A
    .byte $00 ; |        | $F54B
LF54C:
    .byte $0F ; |    XXXX| $F54C
    .byte $0C ; |    XX  | $F54D
LF54E:
    .byte $00 ; |        | $F54E
    .byte $28 ; |  X X   | $F54F
    .byte $D6 ; |XX X XX | $F550
LF551:
    .byte $5F ; | X XXXXX| $F551
    .byte $9F ; |X  XXXXX| $F552
    .byte $BF ; |X XXXXXX| $F553
    .byte $00 ; |        | $F554
    .byte $5F ; | X XXXXX| $F555
    .byte $9F ; |X  XXXXX| $F556
    .byte $BF ; |X XXXXXX| $F557
LF558:
    .byte $00 ; |        | $F558
    .byte $11 ; |   X   X| $F559
    .byte $22 ; |  X   X | $F55A
    .byte $00 ; |        | $F55B
    .byte $00 ; |        | $F55C
    .byte $11 ; |   X   X| $F55D
    .byte $22 ; |  X   X | $F55E

    .byte $00 ; |        | $F55F   fighter waiting top gfx
    .byte $1C ; |   XXX  | $F560
    .byte $3E ; |  XXXXX | $F561
    .byte $3B ; |  XXX XX| $F562
    .byte $3F ; |  XXXXXX| $F563
    .byte $7F ; | XXXXXXX| $F564
    .byte $7F ; | XXXXXXX| $F565
    .byte $7F ; | XXXXXXX| $F566
    .byte $7B ; | XXXX XX| $F567
    .byte $7B ; | XXXX XX| $F568
    .byte $3B ; |  XXX XX| $F569
    .byte $3B ; |  XXX XX| $F56A
    .byte $36 ; |  XX XX | $F56B
    .byte $36 ; |  XX XX | $F56C
    .byte $0F ; |    XXXX| $F56D
    .byte $0F ; |    XXXX| $F56E

    .byte $00 ; |        | $F56F
    .byte $0F ; |    XXXX| $F570
    .byte $1C ; |   XXX  | $F571
    .byte $1C ; |   XXX  | $F572
    .byte $3D ; |  XXXX X| $F573
    .byte $3F ; |  XXXXXX| $F574
    .byte $3F ; |  XXXXXX| $F575
    .byte $3F ; |  XXXXXX| $F576
    .byte $3F ; |  XXXXXX| $F577
    .byte $3F ; |  XXXXXX| $F578
    .byte $3A ; |  XXX X | $F579
    .byte $3E ; |  XXXXX | $F57A
    .byte $F7 ; |XXXX XXX| $F57B
    .byte $FF ; |XXXXXXXX| $F57C
    .byte $0F ; |    XXXX| $F57D
    .byte $0F ; |    XXXX| $F57E

    .byte $00 ; |        | $F57F
    .byte $00 ; |        | $F580
    .byte $78 ; | XXXX   | $F581
    .byte $FC ; |XXXXXX  | $F582
    .byte $3C ; |  XXXX  | $F583
    .byte $FE ; |XXXXXXX | $F584
    .byte $FF ; |XXXXXXXX| $F585
    .byte $FF ; |XXXXXXXX| $F586
    .byte $FF ; |XXXXXXXX| $F587
    .byte $FF ; |XXXXXXXX| $F588
    .byte $E3 ; |XXX   XX| $F589
    .byte $E3 ; |XXX   XX| $F58A
    .byte $C3 ; |XX    XX| $F58B
    .byte $18 ; |   XX   | $F58C
    .byte $0F ; |    XXXX| $F58D
    .byte $0F ; |    XXXX| $F58E

    .byte $00 ; |        | $F58F
    .byte $00 ; |        | $F590
    .byte $70 ; | XXX    | $F591
    .byte $F8 ; |XXXXX   | $F592
    .byte $78 ; | XXXX   | $F593
    .byte $1E ; |   XXXX | $F594
    .byte $3C ; |  XXXX  | $F595
    .byte $7C ; | XXXXX  | $F596
    .byte $7C ; | XXXXX  | $F597
    .byte $6E ; | XX XXX | $F598
    .byte $6E ; | XX XXX | $F599
    .byte $9C ; |X  XXX  | $F59A
    .byte $1F ; |   XXXXX| $F59B
    .byte $3C ; |  XXXX  | $F59C
    .byte $0F ; |    XXXX| $F59D
    .byte $0F ; |    XXXX| $F59E

    .byte $0E ; |    XXX | $F59F   fighter waiting middle gfx
    .byte $1E ; |   XXXX | $F5A0
    .byte $7E ; | XXXXXX | $F5A1
    .byte $FF ; |XXXXXXXX| $F5A2
    .byte $FF ; |XXXXXXXX| $F5A3
    .byte $FF ; |XXXXXXXX| $F5A4
    .byte $7C ; | XXXXX  | $F5A5
    .byte $7C ; | XXXXX  | $F5A6
    .byte $7C ; | XXXXX  | $F5A7
    .byte $FF ; |XXXXXXXX| $F5A8
    .byte $FF ; |XXXXXXXX| $F5A9
    .byte $FF ; |XXXXXXXX| $F5AA
    .byte $7E ; | XXXXXX | $F5AB
    .byte $1E ; |   XXXX | $F5AC
    .byte $0E ; |    XXX | $F5AD
    .byte $0F ; |    XXXX| $F5AE

    .byte $0F ; |    XXXX| $F5AF
    .byte $7E ; | XXXXXX | $F5B0
    .byte $FE ; |XXXXXXX | $F5B1
    .byte $7E ; | XXXXXX | $F5B2
    .byte $FE ; |XXXXXXX | $F5B3
    .byte $FE ; |XXXXXXX | $F5B4
    .byte $78 ; | XXXX   | $F5B5
    .byte $78 ; | XXXX   | $F5B6
    .byte $78 ; | XXXX   | $F5B7
    .byte $FE ; |XXXXXXX | $F5B8
    .byte $FE ; |XXXXXXX | $F5B9
    .byte $7E ; | XXXXXX | $F5BA
    .byte $FE ; |XXXXXXX | $F5BB
    .byte $7E ; | XXXXXX | $F5BC
    .byte $0F ; |    XXXX| $F5BD
    .byte $0F ; |    XXXX| $F5BE

    .byte $0F ; |    XXXX| $F5BF   fighter waiting bottom gfx
    .byte $36 ; |  XX XX | $F5C0
    .byte $36 ; |  XX XX | $F5C1
    .byte $3B ; |  XXX XX| $F5C2
    .byte $3B ; |  XXX XX| $F5C3
    .byte $7B ; | XXXX XX| $F5C4
    .byte $7B ; | XXXX XX| $F5C5
    .byte $7F ; | XXXXXXX| $F5C6
    .byte $7F ; | XXXXXXX| $F5C7
    .byte $7F ; | XXXXXXX| $F5C8
    .byte $3F ; |  XXXXXX| $F5C9
    .byte $3B ; |  XXX XX| $F5CA
    .byte $3E ; |  XXXXX | $F5CB
    .byte $1C ; |   XXX  | $F5CC
    .byte $00 ; |        | $F5CD
    .byte $00 ; |        | $F5CE

    .byte $0F ; |    XXXX| $F5CF
    .byte $FF ; |XXXXXXXX| $F5D0
    .byte $F7 ; |XXXX XXX| $F5D1
    .byte $3E ; |  XXXXX | $F5D2
    .byte $3A ; |  XXX X | $F5D3
    .byte $3F ; |  XXXXXX| $F5D4
    .byte $3F ; |  XXXXXX| $F5D5
    .byte $3F ; |  XXXXXX| $F5D6
    .byte $3F ; |  XXXXXX| $F5D7
    .byte $3F ; |  XXXXXX| $F5D8
    .byte $3D ; |  XXXX X| $F5D9
    .byte $1C ; |   XXX  | $F5DA
    .byte $1C ; |   XXX  | $F5DB
    .byte $0F ; |    XXXX| $F5DC
    .byte $00 ; |        | $F5DD
    .byte $00 ; |        | $F5DE

    .byte $0F ; |    XXXX| $F5DF
    .byte $18 ; |   XX   | $F5E0
    .byte $C3 ; |XX    XX| $F5E1
    .byte $E3 ; |XXX   XX| $F5E2
    .byte $E3 ; |XXX   XX| $F5E3
    .byte $FF ; |XXXXXXXX| $F5E4
    .byte $FF ; |XXXXXXXX| $F5E5
    .byte $FF ; |XXXXXXXX| $F5E6
    .byte $FF ; |XXXXXXXX| $F5E7
    .byte $FE ; |XXXXXXX | $F5E8
    .byte $3C ; |  XXXX  | $F5E9
    .byte $FC ; |XXXXXX  | $F5EA
    .byte $78 ; | XXXX   | $F5EB
    .byte $00 ; |        | $F5EC
    .byte $00 ; |        | $F5ED
    .byte $00 ; |        | $F5EE

    .byte $0F ; |    XXXX| $F5EF
    .byte $3C ; |  XXXX  | $F5F0
    .byte $1F ; |   XXXXX| $F5F1
    .byte $9C ; |X  XXX  | $F5F2
    .byte $6E ; | XX XXX | $F5F3
    .byte $6E ; | XX XXX | $F5F4
    .byte $7C ; | XXXXX  | $F5F5
    .byte $7C ; | XXXXX  | $F5F6
    .byte $3C ; |  XXXX  | $F5F7
    .byte $1E ; |   XXXX | $F5F8
    .byte $3C ; |  XXXX  | $F5F9
    .byte $FC ; |XXXXXX  | $F5FA
    .byte $78 ; | XXXX   | $F5FB
    .byte $00 ; |        | $F5FC
    .byte $00 ; |        | $F5FD
    .byte $00 ; |        | $F5FE
LF5FF:
    STY    COLUP0,X        ; 4   color for players
    CLC                    ; 2
    ADC    LF650,X         ; 4
    TAY                    ; 2
    AND    #$0F            ; 2
    STA    $AD             ; 3
    TYA                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    CLC                    ; 2
    ADC    $AD             ; 3
    CMP    #$0F            ; 2
    BCC    LF61A           ; 2³
    SBC    #$0F            ; 2
    INY                    ; 2
LF61A:
    STA    HMCLR           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    NOP                    ; 2
    EOR    #$07            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
LF627:
    DEY                    ; 2
    BPL    LF627           ; 2³
    STA    RESP0,X         ; 4
    STA    HMP0,X          ; 4
LF62E:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    RTS                    ; 6

LF633:
    LDX    #$0A            ; 2
    LDA    $83             ; 3
    STA    COLUPF          ; 3
    LDY    #0              ; 2
    STA    HMCLR           ; 3
LF63D:
    JSR    LF62E           ; 6
    LDA    #$30            ; 2   ring post
    STA    PF1             ; 3
    STY    PF2             ; 3
    LDA    LF544,X         ; 4
    STA    $84,X           ; 4
    DEX                    ; 2
    DEX                    ; 2
    BNE    LF63D           ; 2³
    RTS                    ; 6

LF650:
    .byte $13 ; |   X  XX| $F650
LF651:
    .byte $02 ; |      X | $F651
LF652:
    .byte $01 ; |       X| $F652
    .byte $FE ; |XXXXXXX | $F653
    .byte $01 ; |       X| $F654
    .byte $02 ; |      X | $F655
    .byte $FF ; |XXXXXXXX| $F656
    .byte $FE ; |XXXXXXX | $F657
    .byte $FF ; |XXXXXXXX| $F658
LF659:
    .byte $77 ; | XXX XXX| $F659
    .byte $70 ; | XXX    | $F65A
    .byte $F5 ; |XXXX X X| $F65B
    .byte $F7 ; |XXXX XXX| $F65C
    .byte $F5 ; |XXXX X X| $F65D
    .byte $F6 ; |XXXX XX | $F65E

    .byte $E0 ; |XXX     | $F65F
    .byte $00 ; |        | $F660
    .byte $40 ; | X      | $F661
    .byte $05 ; |     X X| $F662
    .byte $F5 ; |XXXX X X| $F663
    .byte $05 ; |     X X| $F664
    .byte $05 ; |     X X| $F665
    .byte $05 ; |     X X| $F666
    .byte $05 ; |     X X| $F667
    .byte $15 ; |   X X X| $F668
    .byte $05 ; |     X X| $F669
    .byte $F5 ; |XXXX X X| $F66A
    .byte $05 ; |     X X| $F66B
    .byte $A5 ; |X X  X X| $F66C
    .byte $00 ; |        | $F66D
    .byte $00 ; |        | $F66E
    .byte $E0 ; |XXX     | $F66F
    .byte $40 ; | X      | $F670
    .byte $05 ; |     X X| $F671
    .byte $F5 ; |XXXX X X| $F672
    .byte $05 ; |     X X| $F673
    .byte $05 ; |     X X| $F674
    .byte $05 ; |     X X| $F675
    .byte $05 ; |     X X| $F676
    .byte $05 ; |     X X| $F677
    .byte $F5 ; |XXXX X X| $F678
    .byte $05 ; |     X X| $F679
    .byte $A5 ; |X X  X X| $F67A
    .byte $00 ; |        | $F67B
    .byte $10 ; |   X    | $F67C
    .byte $00 ; |        | $F67D
    .byte $00 ; |        | $F67E
    .byte $E0 ; |XXX     | $F67F
    .byte $70 ; | XXX    | $F680
    .byte $00 ; |        | $F681
    .byte $60 ; | XX     | $F682
    .byte $C5 ; |XX   X X| $F683
    .byte $05 ; |     X X| $F684
    .byte $05 ; |     X X| $F685
    .byte $05 ; |     X X| $F686
    .byte $05 ; |     X X| $F687
    .byte $F5 ; |XXXX X X| $F688
    .byte $05 ; |     X X| $F689
    .byte $F5 ; |XXXX X X| $F68A
    .byte $A5 ; |X X  X X| $F68B
    .byte $C5 ; |XX   X X| $F68C
    .byte $00 ; |        | $F68D
    .byte $00 ; |        | $F68E
    .byte $70 ; | XXX    | $F68F
    .byte $70 ; | XXX    | $F690
    .byte $00 ; |        | $F691
    .byte $40 ; | X      | $F692
    .byte $45 ; | X   X X| $F693
    .byte $25 ; |  X  X X| $F694
    .byte $C7 ; |XX   XXX| $F695
    .byte $07 ; |     XXX| $F696
    .byte $07 ; |     XXX| $F697
    .byte $07 ; |     XXX| $F698
    .byte $A7 ; |X X  XXX| $F699
    .byte $87 ; |X    XXX| $F69A
    .byte $A5 ; |X X  X X| $F69B
    .byte $B5 ; |X XX X X| $F69C
    .byte $00 ; |        | $F69D
    .byte $00 ; |        | $F69E
    .byte $00 ; |        | $F69F
    .byte $F0 ; |XXXX    | $F6A0
    .byte $00 ; |        | $F6A1
    .byte $00 ; |        | $F6A2
    .byte $00 ; |        | $F6A3
    .byte $50 ; | X X    | $F6A4
    .byte $05 ; |     X X| $F6A5
    .byte $05 ; |     X X| $F6A6
    .byte $B5 ; |X XX X X| $F6A7
    .byte $00 ; |        | $F6A8
    .byte $00 ; |        | $F6A9
    .byte $00 ; |        | $F6AA
    .byte $10 ; |   X    | $F6AB
    .byte $00 ; |        | $F6AC
    .byte $00 ; |        | $F6AD
    .byte $00 ; |        | $F6AE
    .byte $D0 ; |XX X    | $F6AF
    .byte $F0 ; |XXXX    | $F6B0
    .byte $00 ; |        | $F6B1
    .byte $F0 ; |XXXX    | $F6B2
    .byte $00 ; |        | $F6B3
    .byte $40 ; | X      | $F6B4
    .byte $05 ; |     X X| $F6B5
    .byte $05 ; |     X X| $F6B6
    .byte $C5 ; |XX   X X| $F6B7
    .byte $00 ; |        | $F6B8
    .byte $10 ; |   X    | $F6B9
    .byte $00 ; |        | $F6BA
    .byte $10 ; |   X    | $F6BB
    .byte $30 ; |  XX    | $F6BC
    .byte $00 ; |        | $F6BD
    .byte $00 ; |        | $F6BE
    .byte $60 ; | XX     | $F6BF
    .byte $05 ; |     X X| $F6C0
    .byte $15 ; |   X X X| $F6C1
    .byte $05 ; |     X X| $F6C2
    .byte $F5 ; |XXXX X X| $F6C3
    .byte $05 ; |     X X| $F6C4
    .byte $05 ; |     X X| $F6C5
    .byte $05 ; |     X X| $F6C6
    .byte $05 ; |     X X| $F6C7
    .byte $15 ; |   X X X| $F6C8
    .byte $05 ; |     X X| $F6C9
    .byte $C5 ; |XX   X X| $F6CA
    .byte $00 ; |        | $F6CB
    .byte $00 ; |        | $F6CC
    .byte $00 ; |        | $F6CD
    .byte $00 ; |        | $F6CE
    .byte $F0 ; |XXXX    | $F6CF
    .byte $00 ; |        | $F6D0
    .byte $60 ; | XX     | $F6D1
    .byte $05 ; |     X X| $F6D2
    .byte $15 ; |   X X X| $F6D3
    .byte $05 ; |     X X| $F6D4
    .byte $05 ; |     X X| $F6D5
    .byte $05 ; |     X X| $F6D6
    .byte $05 ; |     X X| $F6D7
    .byte $05 ; |     X X| $F6D8
    .byte $15 ; |   X X X| $F6D9
    .byte $05 ; |     X X| $F6DA
    .byte $C5 ; |XX   X X| $F6DB
    .byte $10 ; |   X    | $F6DC
    .byte $00 ; |        | $F6DD
    .byte $00 ; |        | $F6DE
    .byte $40 ; | X      | $F6DF
    .byte $65 ; | XX  X X| $F6E0
    .byte $15 ; |   X X X| $F6E1
    .byte $05 ; |     X X| $F6E2
    .byte $15 ; |   X X X| $F6E3
    .byte $05 ; |     X X| $F6E4
    .byte $05 ; |     X X| $F6E5
    .byte $05 ; |     X X| $F6E6
    .byte $05 ; |     X X| $F6E7
    .byte $45 ; | X   X X| $F6E8
    .byte $A5 ; |X X  X X| $F6E9
    .byte $00 ; |        | $F6EA
    .byte $F0 ; |XXXX    | $F6EB
    .byte $A0 ; |X X     | $F6EC
    .byte $00 ; |        | $F6ED
    .byte $00 ; |        | $F6EE
    .byte $50 ; | X X    | $F6EF
    .byte $65 ; | XX  X X| $F6F0
    .byte $75 ; | XXX X X| $F6F1
    .byte $77 ; | XXX XXX| $F6F2
    .byte $07 ; |     XXX| $F6F3
    .byte $07 ; |     XXX| $F6F4
    .byte $07 ; |     XXX| $F6F5
    .byte $47 ; | X   XXX| $F6F6
    .byte $47 ; | X   XXX| $F6F7
    .byte $87 ; |X    XXX| $F6F8
    .byte $A5 ; |X X  X X| $F6F9
    .byte $00 ; |        | $F6FA
    .byte $90 ; |X  X    | $F6FB
LF6FC:
    BCC    LF700           ; 2³
    LSR                    ; 2
    NOP                    ; 2
LF700:
    AND    $80             ; 3
    BNE    LF718           ; 2³
    LDA    $DD             ; 3
    AND    #$3F            ; 2
    STA    $DF             ; 3
    LDA    $A2             ; 3
    STA    $E2             ; 3
    LDA    $A0             ; 3
    STA    $E1             ; 3
    LDA    $DE             ; 3
    AND    #$1F            ; 2
    STA    $E0             ; 3
LF718:
    LDA    $DD             ; 3
    ASL                    ; 2
    EOR    $DD             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ROL    $DE             ; 5
    ROL    $DD             ; 5
    LDA    $E1             ; 3
    CMP    #$46            ; 2
    BCS    LF72B           ; 2³
    ADC    #$3A            ; 2
LF72B:
    SBC    #$2C            ; 2
    CLC                    ; 2
    ADC    $E0             ; 3
    LDY    #$0F            ; 2
    CMP    $A1             ; 3
    BEQ    LF73C           ; 2³
    LDY    #7              ; 2
    BCS    LF73C           ; 2³
    LDY    #$0B            ; 2
LF73C:
    LDA    $E2             ; 3
    SEC                    ; 2
    SBC    #$20            ; 2
    CLC                    ; 2
    ADC    $DF             ; 3
    CMP    #$C0            ; 2
    BCS    LF74F           ; 2³
    CMP    $A3             ; 3
    BEQ    LF750           ; 2³
    DEY                    ; 2
    BCC    LF750           ; 2³
LF74F:
    DEY                    ; 2
LF750:
    TYA                    ; 2
    LDY    $DB             ; 3
    CPY    #$10            ; 2
    BCC    LF75E           ; 2³
    LDY    $D2             ; 3
    BNE    LF75C           ; 2³
    TYA                    ; 2
LF75C:
    EOR    #$03            ; 2
LF75E:
    RTS                    ; 6

    .byte $00 ; |        | $F75F   fighter waiting top hmove/nusiz
    .byte $70 ; | XXX    | $F760
    .byte $00 ; |        | $F761
    .byte $65 ; | XX  X X| $F762
    .byte $05 ; |     X X| $F763
    .byte $15 ; |   X X X| $F764
    .byte $05 ; |     X X| $F765
    .byte $05 ; |     X X| $F766
    .byte $05 ; |     X X| $F767
    .byte $05 ; |     X X| $F768
    .byte $F5 ; |XXXX X X| $F769
    .byte $05 ; |     X X| $F76A
    .byte $15 ; |   X X X| $F76B
    .byte $05 ; |     X X| $F76C
    .byte $C0 ; |XX      | $F76D
    .byte $00 ; |        | $F76E

    .byte $00 ; |        | $F76F
    .byte $70 ; | XXX    | $F770
    .byte $65 ; | XX  X X| $F771
    .byte $05 ; |     X X| $F772
    .byte $15 ; |   X X X| $F773
    .byte $05 ; |     X X| $F774
    .byte $05 ; |     X X| $F775
    .byte $05 ; |     X X| $F776
    .byte $05 ; |     X X| $F777
    .byte $05 ; |     X X| $F778
    .byte $15 ; |   X X X| $F779
    .byte $05 ; |     X X| $F77A
    .byte $C0 ; |XX      | $F77B
    .byte $00 ; |        | $F77C
    .byte $F0 ; |XXXX    | $F77D
    .byte $00 ; |        | $F77E

    .byte $00 ; |        | $F77F
    .byte $20 ; |  X     | $F780
    .byte $F0 ; |XXXX    | $F781
    .byte $00 ; |        | $F782
    .byte $45 ; | X   X X| $F783
    .byte $45 ; | X   X X| $F784
    .byte $05 ; |     X X| $F785
    .byte $05 ; |     X X| $F786
    .byte $05 ; |     X X| $F787
    .byte $05 ; |     X X| $F788
    .byte $15 ; |   X X X| $F789
    .byte $05 ; |     X X| $F78A
    .byte $15 ; |   X X X| $F78B
    .byte $65 ; | XX  X X| $F78C
    .byte $90 ; |X  X    | $F78D
    .byte $00 ; |        | $F78E

    .byte $00 ; |        | $F78F
    .byte $90 ; |X  X    | $F790
    .byte $F0 ; |XXXX    | $F791
    .byte $00 ; |        | $F792
    .byte $65 ; | XX  X X| $F793
    .byte $67 ; | XX  XXX| $F794
    .byte $47 ; | X   XXX| $F795
    .byte $47 ; | X   XXX| $F796
    .byte $07 ; |     XXX| $F797
    .byte $07 ; |     XXX| $F798
    .byte $07 ; |     XXX| $F799
    .byte $67 ; | XX  XXX| $F79A
    .byte $95 ; |X  X X X| $F79B
    .byte $45 ; | X   X X| $F79C
    .byte $B0 ; |X XX    | $F79D
    .byte $00 ; |        | $F79E

    .byte $00 ; |        | $F79F   fighter waiting middle hmove/nusiz
    .byte $00 ; |        | $F7A0
    .byte $10 ; |   X    | $F7A1
    .byte $00 ; |        | $F7A2
    .byte $00 ; |        | $F7A3
    .byte $00 ; |        | $F7A4
    .byte $55 ; | X X X X| $F7A5
    .byte $05 ; |     X X| $F7A6
    .byte $05 ; |     X X| $F7A7
    .byte $B0 ; |X XX    | $F7A8
    .byte $00 ; |        | $F7A9
    .byte $00 ; |        | $F7AA
    .byte $00 ; |        | $F7AB
    .byte $F0 ; |XXXX    | $F7AC
    .byte $00 ; |        | $F7AD
    .byte $00 ; |        | $F7AE

    .byte $00 ; |        | $F7AF
    .byte $30 ; |  XX    | $F7B0
    .byte $10 ; |   X    | $F7B1
    .byte $00 ; |        | $F7B2
    .byte $10 ; |   X    | $F7B3
    .byte $00 ; |        | $F7B4
    .byte $65 ; | XX  X X| $F7B5
    .byte $05 ; |     X X| $F7B6
    .byte $05 ; |     X X| $F7B7
    .byte $A0 ; |X X     | $F7B8
    .byte $00 ; |        | $F7B9
    .byte $F0 ; |XXXX    | $F7BA
    .byte $00 ; |        | $F7BB
    .byte $F0 ; |XXXX    | $F7BC
    .byte $D0 ; |XX X    | $F7BD
    .byte $00 ; |        | $F7BE

    .byte $00 ; |        | $F7BF   fighter waiting bottom hmove/nusiz
    .byte $45 ; | X   X X| $F7C0
    .byte $05 ; |     X X| $F7C1
    .byte $F5 ; |XXXX X X| $F7C2
    .byte $05 ; |     X X| $F7C3
    .byte $15 ; |   X X X| $F7C4
    .byte $05 ; |     X X| $F7C5
    .byte $05 ; |     X X| $F7C6
    .byte $05 ; |     X X| $F7C7
    .byte $05 ; |     X X| $F7C8
    .byte $F5 ; |XXXX X X| $F7C9
    .byte $05 ; |     X X| $F7CA
    .byte $A0 ; |X X     | $F7CB
    .byte $00 ; |        | $F7CC
    .byte $90 ; |X  X    | $F7CD
    .byte $00 ; |        | $F7CE

    .byte $00 ; |        | $F7CF
    .byte $10 ; |   X    | $F7D0
    .byte $00 ; |        | $F7D1
    .byte $45 ; | X   X X| $F7D2
    .byte $05 ; |     X X| $F7D3
    .byte $F5 ; |XXXX X X| $F7D4
    .byte $05 ; |     X X| $F7D5
    .byte $05 ; |     X X| $F7D6
    .byte $05 ; |     X X| $F7D7
    .byte $05 ; |     X X| $F7D8
    .byte $05 ; |     X X| $F7D9
    .byte $F5 ; |XXXX X X| $F7DA
    .byte $05 ; |     X X| $F7DB
    .byte $A0 ; |X X     | $F7DC
    .byte $90 ; |X  X    | $F7DD
    .byte $00 ; |        | $F7DE

    .byte $00 ; |        | $F7DF
    .byte $75 ; | XXX X X| $F7E0
    .byte $A5 ; |X X  X X| $F7E1
    .byte $F5 ; |XXXX X X| $F7E2
    .byte $05 ; |     X X| $F7E3
    .byte $F5 ; |XXXX X X| $F7E4
    .byte $05 ; |     X X| $F7E5
    .byte $05 ; |     X X| $F7E6
    .byte $05 ; |     X X| $F7E7
    .byte $05 ; |     X X| $F7E8
    .byte $C5 ; |XX   X X| $F7E9
    .byte $C0 ; |XX      | $F7EA
    .byte $00 ; |        | $F7EB
    .byte $10 ; |   X    | $F7EC
    .byte $E0 ; |XXX     | $F7ED
    .byte $00 ; |        | $F7EE

    .byte $00 ; |        | $F7EF
    .byte $55 ; | X X X X| $F7F0
    .byte $C5 ; |XX   X X| $F7F1
    .byte $77 ; | XXX XXX| $F7F2
    .byte $A7 ; |X X  XXX| $F7F3
    .byte $07 ; |     XXX| $F7F4
    .byte $07 ; |     XXX| $F7F5
    .byte $07 ; |     XXX| $F7F6
    .byte $C7 ; |XX   XXX| $F7F7
    .byte $C7 ; |XX   XXX| $F7F8
    .byte $85 ; |X    X X| $F7F9
    .byte $C0 ; |XX      | $F7FA
    .byte $00 ; |        | $F7FB

       ORG $F7FC
      
NewCode:
        
LF313:
    STY    HMP0            ; 3
    STY    HMP1            ; 3
    STA    $D5             ; 3
    LDY    #2              ; 2
    
LF31B:
    DEX                    ; 2
    BMI    LF34B           ; 2³
 ;   JSR    LF62E           ; 6
    
;1) carry clear,Y=2,X=3
;2) carry set,Y=0,X=2 (above hits)
;3) carry set,y=2,X=1 (below hits)
;4) carry set,Y=0, X=0
    lda   #$C0
    cmp   $92
    sta   WSYNC
    sta   HMOVE

    beq   .showScore
    cmp   $93
    beq   .showScore

    lda   #$AA
    cmp   $90
    bne   .checkOther
    cmp   $91
    beq   .showScore
    
.checkOther:
    cpx   #2
    bcc   .showScore
    lda   $91
    bne   .hideScore
    lda   #$0B
    cmp   $90
    beq   .showScore
    
.hideScore:

    sta   WSYNC
    sta   HMOVE
    dex
    lda   #$0A
    sta   WSYNC
    sta   HMOVE
    sta   WSYNC
    sta   HMOVE
    sta   $86
    sta   $88
    sta   $8A
    sta   $8C
    bne   .gotoHere  ; always branch
    
.showScore:
    LDA    $90,X           ; 4
    AND    #$0F            ; 2
    STA.wy $86,Y           ; 5
    LDA    $90,X           ; 4
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    BNE    LF336           ; 2³
    CPX    #2              ; 2
    BCC    LF336           ; 2³
    LDA    #$0A            ; 2   blank digit
LF336:
    STA.wy $8A,Y           ; 5
;    JSR    LF62E           ; 6
    STA    WSYNC
    STA    HMOVE
    DEY                    ; 2
    DEY                    ; 2
    BPL    LF31B           ; 2³
.gotoHere:
    JSR    LF383           ; 6
    LDY    #$A0            ; 2
    LDA    $84             ; 3
    EOR    #$06            ; 2
    BCS    LF313           ; 2³
LF34B:
    JSR    LF633           ; 6
    LDX    $D4             ; 3
    LDA    $A1             ; 3
    LDY    $A0             ; 3
    JSR    LF364           ; 6
    STY    REFP0           ; 3
    LDY    #$0F            ; 2
    STY    AUDF1           ; 3
    STY    AUDV1           ; 3
    STY    VDELP0          ; 3
    JMP    LF074           ; 3
    
       ORG $FFFC
       
    .word START,START
