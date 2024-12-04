; Disassembly of texas.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
;
; Command Line: newdistella -pasfctexas.cfg texas.bin 
;
; texas.cfg contents:
;
;      ORG 5000
;      CODE 5000 571B
;      GFX 571C 5723
;      CODE 5724 58C3
;      GFX 58C4 58F2
;      CODE 58F3 5938
;      GFX 5939 5940
;      CODE 5941 5AA2
;      GFX 5AA3 5BD7
;      CODE 5BD8 5BE4
;      GFX 5BE5 5CC7
;      CODE 5CC8 5CFC
;      GFX 5CFD 5EAD
;      CODE 5EAE 5EBC
;      GFX 5EBD 5F91
;      CODE 5F92 5FF0
;      GFX 5FF1 5FFF

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
HMP0    =  $20
HMP1    =  $21
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXPPMM  =  $37
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

       ORG $5000

START:
    LDY    #$00            ; 2
L5002:
    CLD                    ; 2
    SEI                    ; 2
    LDX    #$FF            ; 2
    TXS                    ; 2
    INX                    ; 2
    TXA                    ; 2
L5009:
    STA    VSYNC,X         ; 4
    INX                    ; 2
    BNE    L5009           ; 2
    LDX    #$52            ; 2
    JSR    L5CC8           ; 6
    STY    $CF             ; 3
    LDA    #$A1            ; 2
    STA    $8C             ; 3
    STA    $8E             ; 3
    LDA    #$AA            ; 2
    STA    $8D             ; 3
    JSR    L5EAE           ; 6
L5022:
    LDA    #$2A            ; 2
    STA    WSYNC           ; 3
    STA    VBLANK          ; 3
    STA    VSYNC           ; 3
    STA    TIM8T           ; 4
    INC    $F0             ; 5
    LDA    $96             ; 3
    CMP    #$02            ; 2
    BEQ    L5038           ; 2
    JSR    L50E3           ; 6
L5038:
    LDA    INTIM           ; 4
    BNE    L5038           ; 2
    STA    WSYNC           ; 3
    STA    VSYNC           ; 3
    LDA    #$2D            ; 2
    STA    TIM64T          ; 4
    LDA    $96             ; 3
    BPL    L5071           ; 2
    LDA    $D5             ; 3
    BNE    L506E           ; 2
    LDA    $BF             ; 3
    BNE    L5056           ; 2
    LDA    #$04            ; 2
    STA    $BF             ; 3
L5056:
    JSR    L54E3           ; 6
    JSR    L5CD1           ; 6
    JSR    L558F           ; 6
    JSR    L5671           ; 6
    JSR    L5724           ; 6
    JSR    L5FB3           ; 6
    JSR    L5F92           ; 6
    JSR    L5BD8           ; 6
L506E:
    JSR    L5980           ; 6
L5071:
    LDA    INTIM           ; 4
    BNE    L5071           ; 2
    STA    WSYNC           ; 3
    STA    VBLANK          ; 3
    JSR    L5115           ; 6
    LDA    #$FF            ; 2
    LDX    #$1F            ; 2
    STA    WSYNC           ; 3
    STA    VBLANK          ; 3
    STX    TIM64T          ; 4
    JSR    L50A2           ; 6
    JSR    L556B           ; 6
    JSR    L59D1           ; 6
    LDA    $96             ; 3
    BPL    L509B           ; 2
    JSR    L58F3           ; 6
    JSR    L5829           ; 6
L509B:
    LDA    INTIM           ; 4
    BNE    L509B           ; 2
    BEQ    L5022           ; 2
L50A2:
    LDA    $96             ; 3
    BEQ    L50AA           ; 2
    CMP    #$02            ; 2
    BNE    L50BC           ; 2
L50AA:
    LDA    INPT4           ; 3
    BPL    L50B8           ; 2
    LDA    INPT5           ; 3
    BPL    L50B8           ; 2
    LDA    $CE             ; 3
    BNE    L50C2           ; 2
    BEQ    L50BC           ; 2
L50B8:
    LDA    #$01            ; 2
    STA    $CE             ; 3
L50BC:
    LDA    SWCHB           ; 4
    LSR                    ; 2
    BCS    L50CA           ; 2
L50C2:
    LDX    #$4E            ; 2
    JSR    L5CC8           ; 6
    STX    $96             ; 3
    RTS                    ; 6

L50CA:
    LSR                    ; 2
    BCS    L50E2           ; 2
    LDA    $F0             ; 3
    AND    #$0F            ; 2
    BNE    L50E2           ; 2
    LDX    #$4E            ; 2
    JSR    L5CC8           ; 6
    LDA    $CF             ; 3
    EOR    #$01            ; 2
    STA    $CF             ; 3
    STA    $8E             ; 3
    INC    $8E             ; 5
L50E2:
    RTS                    ; 6

L50E3:
    LDX    #$02            ; 2
L50E5:
    TXA                    ; 2
    ASL                    ; 2
    TAY                    ; 2
    LDA    $8C,X           ; 4
    AND    #$0F            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA.wy $0086,Y         ; 5
    LDA    $8C,X           ; 4
    AND    #$F0            ; 2
    LSR                    ; 2
    STA.wy $0080,Y         ; 5
    DEX                    ; 2
    BPL    L50E5           ; 2
    LDY    #$50            ; 2
    INX                    ; 2
L5100:
    LDA    $80,X           ; 4
    BNE    L5114           ; 2
    STY    $80,X           ; 4
    CPX    #$04            ; 2
    BEQ    L5114           ; 2
    LDA    $86,X           ; 4
    BNE    L5114           ; 2
    STY    $86,X           ; 4
    INX                    ; 2
    INX                    ; 2
    BPL    L5100           ; 2
L5114:
    RTS                    ; 6

L5115:
    STA    COLUBK          ; 3
    LDA    $96             ; 3
    CMP    #$02            ; 2
    BNE    L5120           ; 2
    JMP    L53FD           ; 3
L5120:
    LDX    #$07            ; 2
    STX    $DF             ; 3
    STA    WSYNC           ; 3
L5126:
    DEX                    ; 2
    BNE    L5126           ; 2
    NOP                    ; 2
    STA    RESP0           ; 3
    STA    RESP1           ; 3
    STA    HMCLR           ; 3
    LDA    #$10            ; 2
    STA    HMP1            ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STX    GRP0            ; 3
    STX    GRP1            ; 3
    STX    GRP0            ; 3
    STX    GRP1            ; 3
    INX                    ; 2
    STX    VDELP0          ; 3
    STX    VDELP1          ; 3
    LDX    #$03            ; 2
    STX    NUSIZ0          ; 3
    STX    NUSIZ1          ; 3
    LDA    $C4             ; 3
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
L5151:
    LDY    $DF             ; 3
    LDA    L5BE5,Y         ; 4
    STA    GRP0            ; 3
    STA    WSYNC           ; 3
    LDA    L5BED,Y         ; 4
    STA    GRP1            ; 3
    NOP                    ; 2
    NOP                    ; 2
    LDA    $DD             ; 3
    STA    GRP0            ; 3
    LDA    $DC             ; 3
    STA    $E0             ; 3
    LDA    $DB             ; 3
    TAX                    ; 2
    LDA    $DA             ; 3
    TAY                    ; 2
    NOP                    ; 2
    STA    HMP1            ; 3
    LDA    $E0             ; 3
    STA    GRP1            ; 3
    STX    GRP0            ; 3
    STY    GRP1            ; 3
    STY    GRP0            ; 3
    DEC    $DF             ; 5
    BPL    L5151           ; 2
    LDY    #$00            ; 2
    STA    WSYNC           ; 3
    STY    GRP0            ; 3
    STY    GRP1            ; 3
    STY    VDELP0          ; 3
    STY    VDELP1          ; 3
    STY    NUSIZ1          ; 3
    STY    NUSIZ0          ; 3
    STA    HMCLR           ; 3
    LDA    $C5             ; 3
    STA    COLUPF          ; 3
    LDA    $C4             ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    COLUBK          ; 3
    DEY                    ; 2
    STY    PF0             ; 3
    STY    PF1             ; 3
    STY    PF2             ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    $BD             ; 3
    LDA    L5FF1,X         ; 4
    STA    COLUP0          ; 3
    LDA    #$0A            ; 2
    LDY    $8F             ; 3
    BEQ    L51B7           ; 2
    TYA                    ; 2
L51B7:
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    $DF             ; 3
    LDA    #$5F            ; 2
    STA    $E0             ; 3
    STA    RESP0           ; 3
    LDY    #$07            ; 2
L51C4:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    ($DF),Y         ; 5
    STA    GRP0            ; 3
    DEY                    ; 2
    BPL    L51C4           ; 2
    INY                    ; 2
    LDX    #$06            ; 2
L51D2:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STY    GRP0            ; 3
    DEX                    ; 2
    BNE    L51D2           ; 2
    LDY    #$04            ; 2
L51DD:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #$00            ; 2
    STA    PF0             ; 3
    LDA    L5EF9,Y         ; 4
    STA    PF1             ; 3
    STA    PF2             ; 3
    DEY                    ; 2
    BPL    L51DD           ; 2
    LDA    #$10            ; 2
    STA    PF1             ; 3
    STA    PF2             ; 3
    LDA    $C6             ; 3
    STA    COLUPF          ; 3
    LDY    #$10            ; 2
L51FB:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    DEY                    ; 2
    BNE    L51FB           ; 2
    LDA    $C7             ; 3
    STA    COLUBK          ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    $97             ; 3
    STA    HMP0            ; 3
    STA    HMP1            ; 3
    AND    #$0F            ; 2
    TAY                    ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
L521B:
    DEY                    ; 2
    BNE    L521B           ; 2
    STA    RESP0           ; 3
    STA    RESP1           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDY    #$03            ; 2
    JSR    L5CD0           ; 6
    JSR    L5CD0           ; 6
    STA    HMCLR           ; 3
L5230:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    ($C8),Y         ; 5
    STA    GRP0            ; 3
    DEY                    ; 2
    BPL    L5230           ; 2
    LDA    #$01            ; 2
    STA    VDELP1          ; 3
    LDY    #$07            ; 2
    LDX    #$00            ; 2
L5243:
    LDA    ($CA),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($CC),Y         ; 5
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    GRP0            ; 3
    LDA    L5F6E,Y         ; 4
    STA    COLUP0          ; 3
    LDA    L5F56,Y         ; 4
    STA    COLUP1          ; 3
    STX    PF1             ; 3
    STX    PF2             ; 3
    DEY                    ; 2
    BPL    L5243           ; 2
    STA    CXCLR           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    INY                    ; 2
    STY    GRP0            ; 3
    STY    GRP1            ; 3
    STY    VDELP1          ; 3
    LDA    #$5D            ; 2
    STA    $E3             ; 3
    LDA    #$5C            ; 2
    STA    $EB             ; 3
    LDA    #$5E            ; 2
    STA    $E5             ; 3
    LDA    #$5B            ; 2
    STA    $ED             ; 3
    LDA    #$5E            ; 2
    STA    $E7             ; 3
    LDA    #$5E            ; 2
    STA    $E9             ; 3
    LDA    $A8             ; 3
    STA    HMP0            ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    $A9             ; 3
    STA    REFP0           ; 3
L5294:
    DEX                    ; 2
    BNE    L5294           ; 2
    STA    RESP0           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    #$03            ; 2
    STX    $EE             ; 3
    LDA    $AB,X           ; 4
    STA    $E6             ; 3
    LDA    $B3,X           ; 4
    STA    $E4             ; 3
L52A9:
    LDA    $AF,X           ; 4
    STA    $E2             ; 3
    LDA    $B7,X           ; 4
    STA    $E8             ; 3
    LDY    #$1B            ; 2
    LDA    ($E2),Y         ; 5
    TAX                    ; 2
    LDA    ($E4),Y         ; 5
    STA    $DF             ; 3
    LDA    ($E6),Y         ; 5
    STA    HMP0            ; 3
    LDA    ($E8),Y         ; 5
    DEY                    ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    NUSIZ0          ; 3
    STX    GRP0            ; 3
    LDA    $DF             ; 3
    STA    COLUP0          ; 3
    LDX    $EE             ; 3
    LDA    $98,X           ; 4
    STA    HMP1            ; 3
    AND    #$0F            ; 2
    STA    $E0             ; 3
    LDA    $9C,X           ; 4
    STA    $EA             ; 3
    LDA    $A0,X           ; 4
    STA    $EC             ; 3
    LDA    ($E2),Y         ; 5
    TAX                    ; 2
    LDA    ($E4),Y         ; 5
    STA    $DF             ; 3
    LDA    ($E6),Y         ; 5
    STA    HMP0            ; 3
    LDA    ($E8),Y         ; 5
    DEY                    ; 2
    NOP                    ; 2
    STA    HMOVE           ; 3
    STA    NUSIZ0          ; 3
    STX    GRP0            ; 3
    LDA    $DF             ; 3
    STA    COLUP0          ; 3
    LDX    $EE             ; 3
    LDA    $A4,X           ; 4
    STA    REFP1           ; 3
    LDA    ($E2),Y         ; 5
    TAX                    ; 2
    LDA    ($E4),Y         ; 5
    STA    $DF             ; 3
    LDA    ($E6),Y         ; 5
    STA    HMP0            ; 3
    LDA    ($E8),Y         ; 5
    STA    $E1             ; 3
    DEY                    ; 2
    LDA    $E0             ; 3
    CMP    #$05            ; 2
    BPL    L5317           ; 2
    JMP    L5345           ; 3
L5317:
    SEC                    ; 2
    SBC    #$05            ; 2
    STA    $E0             ; 3
    LDA    $E1             ; 3
    STA    HMOVE           ; 3
    STA    NUSIZ0          ; 3
    STX    GRP0            ; 3
    LDA    $DF             ; 3
    STA    COLUP0          ; 3
    LDA    ($E2),Y         ; 5
    STA    $E1             ; 3
    STA    $E1             ; 3
    LDA    ($E6),Y         ; 5
    STA    HMP0            ; 3
    LDA    ($E8),Y         ; 5
    LDX    $E0             ; 3
    NOP                    ; 2
    NOP                    ; 2
    BEQ    L533E           ; 2
    NOP                    ; 2
L533B:
    DEX                    ; 2
    BNE    L533B           ; 2
L533E:
    STA    RESP1           ; 3
    LDX    $E1             ; 3
    JMP    L5368           ; 3
L5345:
    LDA    $E1             ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    NUSIZ0          ; 3
    STX    GRP0            ; 3
    LDA    $DF             ; 3
    STA    COLUP0          ; 3
    LDX    $E0             ; 3
    LDX    $E0             ; 3
    BEQ    L535D           ; 2
    NOP                    ; 2
L535A:
    DEX                    ; 2
    BNE    L535A           ; 2
L535D:
    STA    RESP1           ; 3
    LDA    ($E2),Y         ; 5
    TAX                    ; 2
    LDA    ($E6),Y         ; 5
    STA    HMP0            ; 3
    LDA    ($E8),Y         ; 5
L5368:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    NUSIZ0          ; 3
    STX    GRP0            ; 3
    LDA    ($E4),Y         ; 5
    STA    COLUP0          ; 3
    DEY                    ; 2
    LDA    ($E2),Y         ; 5
    TAX                    ; 2
    LDA    ($E4),Y         ; 5
    STA    $DF             ; 3
    STA    HMCLR           ; 3
    LDA    ($E6),Y         ; 5
    STA    HMP0            ; 3
    LDA    ($EA),Y         ; 5
    STA    $E0             ; 3
    LDA    ($E8),Y         ; 5
L5388:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    NUSIZ0          ; 3
    STX    GRP0            ; 3
    LDA    $E0             ; 3
    STA    GRP1            ; 3
    LDA    $DF             ; 3
    STA    COLUP0          ; 3
    LDA    ($EC),Y         ; 5
    STA    COLUP1          ; 3
    DEY                    ; 2
    LDA    ($E2),Y         ; 5
    TAX                    ; 2
    LDA    ($E4),Y         ; 5
    STA    $DF             ; 3
    LDA    ($E6),Y         ; 5
    STA    HMP0            ; 3
    LDA    ($EA),Y         ; 5
    STA    $E0             ; 3
    LDA    ($E8),Y         ; 5
    CPY    #$02            ; 2
    BPL    L5388           ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    NUSIZ0          ; 3
    STX    GRP0            ; 3
    LDA    #$00            ; 2
    STA    GRP1            ; 3
    LDA    $DF             ; 3
    STA    COLUP0          ; 3
    DEY                    ; 2
    LDA    ($E4),Y         ; 5
    STA    $DF             ; 3
    LDA    ($E6),Y         ; 5
    STA    HMP0            ; 3
    DEC    $EE             ; 5
    BMI    L53EE           ; 2
    LDX    $EE             ; 3
    LDA    $AB,X           ; 4
    STA    $E6             ; 3
    LDA    $B3,X           ; 4
    STA    $E4             ; 3
    LDA    ($E2),Y         ; 5
    TAX                    ; 2
    LDA    ($E8),Y         ; 5
    NOP                    ; 2
    STA    HMOVE           ; 3
    STA    NUSIZ0          ; 3
    STX    GRP0            ; 3
    LDA    $DF             ; 3
    STA    COLUP0          ; 3
    LDX    $EE             ; 3
    JMP    L52A9           ; 3
L53EE:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    REFP0           ; 3
    STA    REFP1           ; 3
    JMP    L5472           ; 3
L53FD:
    STA    WSYNC           ; 3
    LDY    #$1A            ; 2
    LDX    #$01            ; 2
    STX    AUDC0           ; 3
    DEX                    ; 2
    STX    COLUBK          ; 3
    STX    COLUPF          ; 3
    LDA    $F0             ; 3
    AND    #$7F            ; 2
    CMP    #$20            ; 2
    BCS    L541D           ; 2
    LSR                    ; 2
    TAX                    ; 2
    AND    #$0F            ; 2
    EOR    #$0F            ; 2
    ORA    #$30            ; 2
    STA    COLUPF          ; 3
    DEX                    ; 2
L541D:
    STX    AUDF0           ; 3
    STX    AUDV0           ; 3
L5421:
    STA    WSYNC           ; 3
    DEY                    ; 2
    BNE    L5421           ; 2
    LDX    #$0E            ; 2
L5428:
    LDA    #$04            ; 2
    STA    $DF             ; 3
L542C:
    LDY    #$04            ; 2
L542E:
    STA    WSYNC           ; 3
    LDA    L5B7E,X         ; 4
    STA    PF0             ; 3
    LDA    L5B8D,X         ; 4
    STA    PF1             ; 3
    LDA    L5B9C,X         ; 4
    STA    PF2             ; 3
    LDA    L5BAB,X         ; 4
    STA    PF0             ; 3
    NOP                    ; 2
    LDA    L5BBA,X         ; 4
    STA    PF1             ; 3
    LDA    L5BC9,X         ; 4
    DEY                    ; 2
    NOP                    ; 2
    STA    PF2             ; 3
    BPL    L542E           ; 2
    DEX                    ; 2
    DEC    $DF             ; 5
    BPL    L542C           ; 2
    STA    WSYNC           ; 3
    INY                    ; 2
    STY    PF0             ; 3
    STY    PF1             ; 3
    STY    PF2             ; 3
    LDY    #$0E            ; 2
L5463:
    STA    WSYNC           ; 3
    DEY                    ; 2
    BNE    L5463           ; 2
    TXA                    ; 2
    BPL    L5428           ; 2
    LDX    #$27            ; 2
L546D:
    STA    WSYNC           ; 3
    DEX                    ; 2
    BNE    L546D           ; 2
L5472:
    LDX    #$07            ; 2
    STX    $DF             ; 3
    LDA    #$00            ; 2
    STA    COLUBK          ; 3
    STA    WSYNC           ; 3
L547C:
    DEX                    ; 2
    BNE    L547C           ; 2
    NOP                    ; 2
    STA    RESP0           ; 3
    STA    RESP1           ; 3
    STA    HMCLR           ; 3
    LDA    #$10            ; 2
    STA    HMP1            ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STX    GRP0            ; 3
    STX    GRP1            ; 3
    STX    GRP0            ; 3
    STX    GRP1            ; 3
    INX                    ; 2
    STX    VDELP0          ; 3
    STX    VDELP1          ; 3
    LDX    #$03            ; 2
    STX    NUSIZ0          ; 3
    STX    NUSIZ1          ; 3
    LDY    $BD             ; 3
    LDA    L5FF1,Y         ; 4
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
L54AA:
    LDY    $DF             ; 3
    LDA    ($80),Y         ; 5
    STA    GRP0            ; 3
    STA    WSYNC           ; 3
    LDA    ($86),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($82),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($88),Y         ; 5
    STA    $E0             ; 3
    LDA    ($84),Y         ; 5
    TAX                    ; 2
    LDA    ($8A),Y         ; 5
    TAY                    ; 2
    LDA    $E0             ; 3
    STA    GRP1            ; 3
    STX    GRP0            ; 3
    STY    GRP1            ; 3
    STY    GRP0            ; 3
    DEC    $DF             ; 5
    BPL    L54AA           ; 2
    LDA    #$00            ; 2
    STA    WSYNC           ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    RTS                    ; 6

L54E3:
    LDA    $D1             ; 3
    STA    $DF             ; 3
    LDA    $D0             ; 3
    STA    $E0             ; 3
    LDA    #$00            ; 2
    LDX    #$08            ; 2
L54EF:
    LSR    $DF             ; 5
    BCC    L54F6           ; 2
    CLC                    ; 2
    ADC    $E0             ; 3
L54F6:
    ROR                    ; 2
    ROR    $D0             ; 5
    DEX                    ; 2
    BNE    L54EF           ; 2
    CLC                    ; 2
    LDA    $D0             ; 3
    ADC    $D2             ; 3
    STA    $D0             ; 3
    INC    $DE             ; 5
    LDX    $DE             ; 3
    BNE    L5516           ; 2
    TAX                    ; 2
    ASL                    ; 2
    SEC                    ; 2
    ROL                    ; 2
    STA    $D1             ; 3
    TXA                    ; 2
    SEC                    ; 2
    ROL                    ; 2
    STA    $D2             ; 3
    BNE    L54E3           ; 2
L5516:
    RTS                    ; 6

L5517:
    STY    $E0             ; 3
    STA    $DF             ; 3
    CLC                    ; 2
    ADC    $E0             ; 3
    LDY    $E0             ; 3
    BPL    L552E           ; 2
    LDY    $DF             ; 3
    BPL    L553D           ; 2
    TAY                    ; 2
    BMI    L553D           ; 2
    CLC                    ; 2
    ADC    #$F1            ; 2
    BNE    L553D           ; 2
L552E:
    LDY    $DF             ; 3
    BMI    L553D           ; 2
    TAY                    ; 2
    AND    #$F0            ; 2
    CMP    #$70            ; 2
    TYA                    ; 2
    BCC    L553D           ; 2
    CLC                    ; 2
    ADC    #$0F            ; 2
L553D:
    TAY                    ; 2
    JSR    L5555           ; 6
    CMP    L5F82,X         ; 4
    BCC    L554D           ; 2
    CMP    L5F86,X         ; 4
    BCS    L5551           ; 2
    TYA                    ; 2
    RTS                    ; 6

L554D:
    LDA    L5F8A,X         ; 4
    RTS                    ; 6

L5551:
    LDA    L5F8E,X         ; 4
    RTS                    ; 6

L5555:
    STA    $DF             ; 3
    EOR    #$F0            ; 2
    CLC                    ; 2
    ADC    #$70            ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    STA    $E0             ; 3
    LDA    $DF             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ORA    $E0             ; 3
    RTS                    ; 6

L556B:
    LDX    #$03            ; 2
    LDA    #$FF            ; 2
L556F:
    STA    $DA,X           ; 4
    DEX                    ; 2
    BPL    L556F           ; 2
    LDX    #$04            ; 2
    LDY    $BD             ; 3
    LDA.wy $00BB,Y         ; 4
L557B:
    DEX                    ; 2
    SEC                    ; 2
    SBC    #$08            ; 2
    BPL    L557B           ; 2
    EOR    #$FF            ; 2
    TAY                    ; 2
    LDA    L5FF5,Y         ; 4
L5587:
    STA    $DA,X           ; 4
    LDA    #$00            ; 2
    DEX                    ; 2
    BPL    L5587           ; 2
    RTS                    ; 6

L558F:
    LDA    $EF             ; 3
    ASL                    ; 2
    BCS    L5598           ; 2
    LDY    #$08            ; 2
    STY    $A9             ; 3
L5598:
    ASL                    ; 2
    BCS    L559F           ; 2
    LDY    #$00            ; 2
    STY    $A9             ; 3
L559F:
    LDY    $AA             ; 3
    ASL                    ; 2
    BCS    L55AA           ; 2
    CPY    #$53            ; 2
    BEQ    L55AA           ; 2
    INC    $AA             ; 5
L55AA:
    ASL                    ; 2
    BCS    L55B2           ; 2
    TYA                    ; 2
    BEQ    L55B2           ; 2
    DEC    $AA             ; 5
L55B2:
    LDA    $AA             ; 3
    CMP    #$38            ; 2
    BCC    L55C0           ; 2
    LDY    #$00            ; 2
    STY    $B1             ; 3
    STY    $B2             ; 3
    BEQ    L55D5           ; 2
L55C0:
    CMP    #$1C            ; 2
    BCC    L55CD           ; 2
    LDY    #$00            ; 2
    STY    $B2             ; 3
    STY    $AF             ; 3
    INY                    ; 2
    BNE    L55D5           ; 2
L55CD:
    LDA    #$00            ; 2
    STA    $AF             ; 3
    STA    $B0             ; 3
    LDY    #$02            ; 2
L55D5:
    STY    $EE             ; 3
    LDX    $BD             ; 3
    LDA    $C1             ; 3
    BEQ    L55E1           ; 2
    DEC    $C1             ; 5
    BPL    L5601           ; 2
L55E1:
    LDA    INPT4,X         ; 4
    BMI    L5615           ; 2
    LDA    $BB,X           ; 4
    BEQ    L5615           ; 2
    LDA    $BF             ; 3
    CMP    #$03            ; 2
    BCC    L5601           ; 2
    LDA    #$02            ; 2
    STA    $BF             ; 3
    LDA    #$27            ; 2
    STA    $D4             ; 3
    LDA    #$68            ; 2
    STA    $C1             ; 3
    DEC    $BB,X           ; 6
    BEQ    L5601           ; 2
    DEC    $BB,X           ; 6
L5601:
    INC    $D3             ; 5
    LDA    $D3             ; 3
    CMP    #$0C            ; 2
    BNE    L560D           ; 2
    LDA    #$00            ; 2
    STA    $D3             ; 3
L560D:
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDA    L5BF5,Y         ; 4
    BNE    L562B           ; 2
L5615:
    LDA    $EF             ; 3
    AND    #$F0            ; 2
    CMP    #$F0            ; 2
    BNE    L5621           ; 2
    LDY    #$00            ; 2
    BEQ    L5628           ; 2
L5621:
    LDA    $F0             ; 3
    AND    #$07            ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
L5628:
    LDA    L5EFE,Y         ; 4
L562B:
    STA    $E0             ; 3
    LDA    $AA             ; 3
L562F:
    CMP    #$1C            ; 2
    BCC    L5638           ; 2
    SEC                    ; 2
    SBC    #$1C            ; 2
    BPL    L562F           ; 2
L5638:
    STA    $E1             ; 3
    LDX    $EE             ; 3
    CLC                    ; 2
    ADC    $E0             ; 3
    STA    $B0,X           ; 4
    SEC                    ; 2
    SBC    #$1C            ; 2
    STA    $AF,X           ; 4
    LDA    #$91            ; 2
    CLC                    ; 2
    ADC    $E1             ; 3
    STA    $B4,X           ; 4
    SEC                    ; 2
    SBC    #$1C            ; 2
    STA    $B3,X           ; 4
    LDA    #$4B            ; 2
    CLC                    ; 2
    ADC    $E1             ; 3
    STA    $B8,X           ; 4
    SEC                    ; 2
    SBC    #$1C            ; 2
    STA    $B7,X           ; 4
    LDA    #$1C            ; 2
    LDY    $A9             ; 3
    BEQ    L5666           ; 2
    LDA    #$5A            ; 2
L5666:
    CLC                    ; 2
    ADC    $E1             ; 3
    STA    $AC,X           ; 4
    SEC                    ; 2
    SBC    #$1C            ; 2
    STA    $AB,X           ; 4
    RTS                    ; 6

L5671:
    LDA    $F0             ; 3
    AND    #$3F            ; 2
    BNE    L568D           ; 2
    TAY                    ; 2
    LDA    $EF             ; 3
    ASL                    ; 2
    BCS    L567F           ; 2
    LDY    #$10            ; 2
L567F:
    ASL                    ; 2
    BCS    L5684           ; 2
    LDY    #$F0            ; 2
L5684:
    LDA    $97             ; 3
    LDX    #$01            ; 2
    JSR    L5517           ; 6
    STA    $97             ; 3
L568D:
    RTS                    ; 6

L568E:
    LDA    $F0             ; 3
    AND    #$03            ; 2
    BEQ    L5695           ; 2
    RTS                    ; 6

L5695:
    TAY                    ; 2
    LDA    $F0             ; 3
    AND    #$08            ; 2
    BEQ    L569E           ; 2
    LDY    #$16            ; 2
L569E:
    LDX    $EE             ; 3
    STY    $9C,X           ; 4
    LDY    #$20            ; 2
    LDA    $A4,X           ; 4
    BEQ    L56AC           ; 2
    LDY    #$E0            ; 2
    BNE    L56BA           ; 2
L56AC:
    LDA    $EF             ; 3
    ASL                    ; 2
    BCS    L56B3           ; 2
    LDY    #$30            ; 2
L56B3:
    ASL                    ; 2
    BCS    L56C6           ; 2
    LDY    #$F0            ; 2
    BNE    L56C6           ; 2
L56BA:
    LDA    $EF             ; 3
    ASL                    ; 2
    BCS    L56C1           ; 2
    LDY    #$10            ; 2
L56C1:
    ASL                    ; 2
    BCS    L56C6           ; 2
    LDY    #$D0            ; 2
L56C6:
    LDX    $EE             ; 3
    LDA    $98,X           ; 4
    LDX    #$03            ; 2
    JSR    L5517           ; 6
    LDX    $EE             ; 3
    STA    $98,X           ; 4
    CMP    #$40            ; 2
    BEQ    L56DB           ; 2
    CMP    #$88            ; 2
    BNE    L56E0           ; 2
L56DB:
    LDA    #$B0            ; 2
    STA    $9C,X           ; 4
    RTS                    ; 6

L56E0:
    LDA    $98,X           ; 4
    JSR    L5555           ; 6
    LDY    $A4,X           ; 4
    BNE    L56F1           ; 2
    CMP    #$50            ; 2
    BCC    L56F9           ; 2
    LDY    #$08            ; 2
    BNE    L56F7           ; 2
L56F1:
    CMP    #$50            ; 2
    BCS    L56F9           ; 2
    LDY    #$00            ; 2
L56F7:
    STY    $A4,X           ; 4
L56F9:
    LDY    $A4,X           ; 4
    BEQ    L56FF           ; 2
    LDY    #$01            ; 2
L56FF:
    CMP    L571C,Y         ; 4
    BNE    L571B           ; 2
    LDA    $D0             ; 3
    CMP    #$40            ; 2
    BCC    L571B           ; 2
    LDA    $EF             ; 3
    AND    L571E,Y         ; 4
    BNE    L571B           ; 2
    LDA    L5720,Y         ; 4
    STA    $98,X           ; 4
    LDA    L5722,Y         ; 4
    STA    $A4,X           ; 4
L571B:
    RTS                    ; 6

L571C:
    .byte $40 ; | X      | $571C
    .byte $64 ; | XX  X  | $571D
L571E:
    .byte $40 ; | X      | $571E
    .byte $80 ; |X       | $571F
L5720:
    .byte $66 ; | XX  XX | $5720
    .byte $24 ; |  X  X  | $5721
L5722:
    .byte $08 ; |    X   | $5722
    .byte $00 ; |        | $5723
L5724:
    LDA    #$03            ; 2
    STA    $EE             ; 3
L5728:
    LDX    $EE             ; 3
    LDA    $9C,X           ; 4
    CMP    #$B0            ; 2
    BCC    L5736           ; 2
    JSR    L5751           ; 6
    JMP    L574C           ; 3
L5736:
    CMP    #$84            ; 2
    BCC    L573F           ; 2
    JSR    L580A           ; 6
    BNE    L574C           ; 2
L573F:
    CMP    #$2C            ; 2
    BCC    L5749           ; 2
    JSR    L57C2           ; 6
    JMP    L574C           ; 3
L5749:
    JSR    L568E           ; 6
L574C:
    DEC    $EE             ; 5
    BPL    L5728           ; 2
    RTS                    ; 6

L5751:
    LDY    #$00            ; 2
    LDA    $EF             ; 3
    ASL                    ; 2
    BCC    L575C           ; 2
    INY                    ; 2
    ASL                    ; 2
    BCS    L57C1           ; 2
L575C:
    LDA    $F0             ; 3
    AND    #$0F            ; 2
    BNE    L57C1           ; 2
    LDA    $D0             ; 3
    LDX    $EE             ; 3
    ASL                    ; 2
    LDA    $D0             ; 3
L5769:
    ROL                    ; 2
    ROL                    ; 2
    DEX                    ; 2
    BPL    L5769           ; 2
    STA    $DF             ; 3
    LDX    #$03            ; 2
L5772:
    LDA    $9C,X           ; 4
    BEQ    L579E           ; 2
    CMP    #$16            ; 2
    BEQ    L579E           ; 2
    DEX                    ; 2
    BPL    L5772           ; 2
    LDA    $DF             ; 3
    CMP    #$F0            ; 2
    BCC    L579E           ; 2
    LDX    #$52            ; 2
    LDA    $D0             ; 3
    LSR                    ; 2
    BCC    L578C           ; 2
    LDX    #$3E            ; 2
L578C:
    STX    $DF             ; 3
    LDA    #$03            ; 2
    CMP    $BF             ; 3
    BPL    L579A           ; 2
    STA    $BF             ; 3
    LDA    #$64            ; 2
    STA    $D4             ; 3
L579A:
    LDA    #$00            ; 2
    BEQ    L57AF           ; 2
L579E:
    LDA    $DF             ; 3
    CMP    #$40            ; 2
    BCS    L57C1           ; 2
    AND    #$03            ; 2
    TAX                    ; 2
    LDA    L5BF8,X         ; 4
    STA    $DF             ; 3
    LDA    L5BFC,X         ; 4
L57AF:
    LDX    $EE             ; 3
    STA    $9C,X           ; 4
    LDA    $DF             ; 3
    STA    $A0,X           ; 4
    LDA    L5C00,Y         ; 4
    STA    $98,X           ; 4
    LDA    L5B00,Y         ; 4
    STA    $A4,X           ; 4
L57C1:
    RTS                    ; 6

L57C2:
    LDA    $EF             ; 3
    LDY    #$00            ; 2
    ASL                    ; 2
    BCS    L57CB           ; 2
    LDY    #$10            ; 2
L57CB:
    ASL                    ; 2
    BCS    L57D0           ; 2
    LDY    #$F0            ; 2
L57D0:
    LDX    $EE             ; 3
    LDA    $9C,X           ; 4
    CMP    #$42            ; 2
    BNE    L57E3           ; 2
    TYA                    ; 2
    BEQ    L57E3           ; 2
    BMI    L57E1           ; 2
    LDY    #$20            ; 2
    BNE    L57E3           ; 2
L57E1:
    LDY    #$E0            ; 2
L57E3:
    TYA                    ; 2
    BEQ    L57F2           ; 2
    BMI    L57EE           ; 2
    CLC                    ; 2
    ADC    $90             ; 3
    TAY                    ; 2
    BNE    L57F2           ; 2
L57EE:
    SEC                    ; 2
    SBC    $90             ; 3
    TAY                    ; 2
L57F2:
    LDA    $98,X           ; 4
    LDX    #$03            ; 2
    JSR    L5517           ; 6
    LDX    $EE             ; 3
    STA    $98,X           ; 4
    CMP    #$40            ; 2
    BEQ    L5805           ; 2
    CMP    #$88            ; 2
    BNE    L5809           ; 2
L5805:
    LDA    #$B0            ; 2
    STA    $9C,X           ; 4
L5809:
    RTS                    ; 6

L580A:
    LDX    $EE             ; 3
    LDA    #$B0            ; 2
    DEC    $BE             ; 5
    BEQ    L5826           ; 2
    LDA    $BE             ; 3
    CMP    #$D0            ; 2
    BNE    L5820           ; 2
    LDY    #$06            ; 2
    STY    $D4             ; 3
    LDY    #$01            ; 2
    STY    $BF             ; 3
L5820:
    LDA    #$16            ; 2
    STA    $A0,X           ; 4
    LDA    #$9A            ; 2
L5826:
    STA    $9C,X           ; 4
    RTS                    ; 6

L5829:
    LDY    #$00            ; 2
    LDA    $BF             ; 3
    BNE    L5834           ; 2
    STY    AUDV0           ; 3
    STY    AUDV1           ; 3
    RTS                    ; 6

L5834:
    CMP    #$01            ; 2
    BEQ    L5844           ; 2
    CMP    #$02            ; 2
    BEQ    L5875           ; 2
    CMP    #$03            ; 2
    BEQ    L58A9           ; 2
    CMP    #$04            ; 2
    BEQ    L5891           ; 2
L5844:
    LDA    $D4             ; 3
    BPL    L584F           ; 2
    STY    $BF             ; 3
    STY    AUDV0           ; 3
    STY    AUDV1           ; 3
    RTS                    ; 6

L584F:
    LDA    $F0             ; 3
    AND    #$07            ; 2
    BNE    L5859           ; 2
    DEC    $D4             ; 5
    BMI    L5874           ; 2
L5859:
    LDX    $D4             ; 3
    LDA    L58C4,X         ; 4
    TAX                    ; 2
    STX    AUDF1           ; 3
    LDA    $F0             ; 3
    LSR                    ; 2
    BCS    L5867           ; 2
    DEX                    ; 2
L5867:
    STX    AUDF0           ; 3
    INY                    ; 2
    STY    AUDC0           ; 3
    STY    AUDC1           ; 3
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
L5874:
    RTS                    ; 6

L5875:
    LDX    $D4             ; 3
    BPL    L587C           ; 2
    STY    $BF             ; 3
    RTS                    ; 6

L587C:
    LDA    $F0             ; 3
    AND    L58CB,X         ; 4
    BNE    L5897           ; 2
    DEC    $D4             ; 5
    LDA    #$1F            ; 2
    STA    AUDF0           ; 3
    INY                    ; 2
    STY    AUDC0           ; 3
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
    RTS                    ; 6

L5891:
    LDA    $F0             ; 3
    AND    #$07            ; 2
    BEQ    L589A           ; 2
L5897:
    STY    AUDV0           ; 3
    RTS                    ; 6

L589A:
    INY                    ; 2
    STY    AUDC0           ; 3
    LDA    #$03            ; 2
    STA    AUDV0           ; 3
    LDA    #$1F            ; 2
    STA    AUDF0           ; 3
    DEY                    ; 2
    STY    $BF             ; 3
    RTS                    ; 6

L58A9:
    LDA    $D4             ; 3
    BPL    L58B4           ; 2
    STY    $BF             ; 3
    STY    AUDV0           ; 3
    STY    AUDV1           ; 3
    RTS                    ; 6

L58B4:
    DEC    $D4             ; 5
    BMI    L58C3           ; 2
    INY                    ; 2
    STY    AUDF0           ; 3
    LDA    #$0C            ; 2
    STA    AUDC0           ; 3
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
L58C3:
    RTS                    ; 6

L58C4:
    .byte $0B ; |    X XX| $58C4
    .byte $09 ; |    X  X| $58C5
    .byte $0A ; |    X X | $58C6
    .byte $08 ; |    X   | $58C7
    .byte $09 ; |    X  X| $58C8
    .byte $07 ; |     XXX| $58C9
    .byte $08 ; |    X   | $58CA
L58CB:
    .byte $01 ; |       X| $58CB
    .byte $01 ; |       X| $58CC
    .byte $01 ; |       X| $58CD
    .byte $01 ; |       X| $58CE
    .byte $01 ; |       X| $58CF
    .byte $01 ; |       X| $58D0
    .byte $01 ; |       X| $58D1
    .byte $01 ; |       X| $58D2
    .byte $01 ; |       X| $58D3
    .byte $01 ; |       X| $58D4
    .byte $01 ; |       X| $58D5
    .byte $01 ; |       X| $58D6
    .byte $01 ; |       X| $58D7
    .byte $01 ; |       X| $58D8
    .byte $01 ; |       X| $58D9
    .byte $01 ; |       X| $58DA
    .byte $01 ; |       X| $58DB
    .byte $01 ; |       X| $58DC
    .byte $01 ; |       X| $58DD
    .byte $01 ; |       X| $58DE
    .byte $01 ; |       X| $58DF
    .byte $01 ; |       X| $58E0
    .byte $01 ; |       X| $58E1
    .byte $01 ; |       X| $58E2
    .byte $01 ; |       X| $58E3
    .byte $01 ; |       X| $58E4
    .byte $01 ; |       X| $58E5
    .byte $01 ; |       X| $58E6
    .byte $01 ; |       X| $58E7
    .byte $01 ; |       X| $58E8
    .byte $01 ; |       X| $58E9
    .byte $01 ; |       X| $58EA
    .byte $01 ; |       X| $58EB
    .byte $01 ; |       X| $58EC
    .byte $03 ; |      XX| $58ED
    .byte $03 ; |      XX| $58EE
    .byte $03 ; |      XX| $58EF
    .byte $07 ; |     XXX| $58F0
    .byte $07 ; |     XXX| $58F1
    .byte $07 ; |     XXX| $58F2
L58F3:
    LDA    $BE             ; 3
    BNE    L5938           ; 2
    LDA    $C0             ; 3
    BEQ    L5906           ; 2
    DEC    $C0             ; 5
    BNE    L5938           ; 2
    LDX    $C2             ; 3
    LDA    #$B0            ; 2
    STA    $9C,X           ; 4
    RTS                    ; 6

L5906:
    LDA    CXPPMM          ; 3
    BPL    L5938           ; 2
    LDX    #$03            ; 2
L590C:
    LDA    $AA             ; 3
    CMP    L5939,X         ; 4
    BCC    L5935           ; 2
    CMP    L593D,X         ; 4
    BCS    L5935           ; 2
    LDA    $9C,X           ; 4
    CMP    #$2C            ; 2
    BCC    L5935           ; 2
    CMP    #$84            ; 2
    BCS    L5935           ; 2
    LDA    $98,X           ; 4
    JSR    L5555           ; 6
    CMP    #$44            ; 2
    BCC    L5935           ; 2
    CMP    #$63            ; 2
    BCS    L5935           ; 2
    LDA    #$78            ; 2
    STA    $C0             ; 3
    STX    $C2             ; 3
L5935:
    DEX                    ; 2
    BPL    L590C           ; 2
L5938:
    RTS                    ; 6

L5939:
    .byte $3D ; |  XXXX X| $5939
    .byte $21 ; |  X    X| $593A
    .byte $05 ; |     X X| $593B
    .byte $00 ; |        | $593C
L593D:
    .byte $54 ; | X X X  | $593D
    .byte $52 ; | X X  X | $593E
    .byte $35 ; |  XX X X| $593F
    .byte $1A ; |   XX X | $5940
L5941:
    SED                    ; 2
    CLC                    ; 2
    LDA    #$10            ; 2
    ADC    $8D             ; 3
    STA    $8D             ; 3
    LDA    #$00            ; 2
    ADC    $8C             ; 3
    STA    $8C             ; 3
    CLD                    ; 2
    LDA    $8D             ; 3
    AND    #$F0            ; 2
    BEQ    L595A           ; 2
    CMP    #$50            ; 2
    BNE    L5971           ; 2
L595A:
    LDX    $BD             ; 3
    LDA    #$08            ; 2
    LDY    $8C             ; 3
    BEQ    L5966           ; 2
    TYA                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
L5966:
    CLC                    ; 2
    ADC    $BB,X           ; 4
    CMP    #$20            ; 2
    BCC    L596F           ; 2
    LDA    #$1F            ; 2
L596F:
    STA    $BB,X           ; 4
L5971:
    LDA    $90             ; 3
    CMP    #$50            ; 2
    BEQ    L597F           ; 2
    LDA    $8C             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    $90             ; 3
L597F:
    RTS                    ; 6

L5980:
    LDA    $D5             ; 3
    BEQ    L5991           ; 2
    DEC    $D5             ; 5
    LDA    $D5             ; 3
    LSR                    ; 2
    LSR                    ; 2
    EOR    #$1F            ; 2
    LDX    $BD             ; 3
    STA    $BB,X           ; 4
    RTS                    ; 6

L5991:
    LDX    $BD             ; 3
    LDA    $BB,X           ; 4
    BNE    L59D0           ; 2
    DEC    $8F             ; 5
    LDA    $CF             ; 3
    BEQ    L59B4           ; 2
    TXA                    ; 2
    EOR    #$01            ; 2
    TAX                    ; 2
    LDA    $94             ; 3
    BEQ    L59B4           ; 2
    STX    $BD             ; 3
    LDX    #$04            ; 2
L59A9:
    LDA    $8C,X           ; 4
    LDY    $91,X           ; 4
    STY    $8C,X           ; 4
    STA    $91,X           ; 4
    DEX                    ; 2
    BPL    L59A9           ; 2
L59B4:
    LDA    $8F             ; 3
    BEQ    L59D0           ; 2
    LDA    #$80            ; 2
    STA    $D5             ; 3
    LDA    #$B0            ; 2
    STA    $9C             ; 3
    STA    $9D             ; 3
    STA    $9E             ; 3
    STA    $9F             ; 3
    LDA    #$00            ; 2
    STA    $C1             ; 3
    STA    $C0             ; 3
    STA    $BE             ; 3
    STA    $BF             ; 3
L59D0:
    RTS                    ; 6

L59D1:
    LDA    $96             ; 3
    CMP    #$01            ; 2
    BEQ    L5A3F           ; 2
    LDA    $8F             ; 3
    BNE    L5A45           ; 2
    LDY    $CF             ; 3
    BEQ    L59E3           ; 2
    LDY    $94             ; 3
    BNE    L5A45           ; 2
L59E3:
    STY    AUDV0           ; 3
    STY    AUDV1           ; 3
    INY                    ; 2
    STY    $96             ; 3
    LDA    #$3C            ; 2
    STA    $F1             ; 3
    LDX    #$04            ; 2
    STX    $D5             ; 3
    DEX                    ; 2
    LDA    #$B0            ; 2
L59F5:
    STA    $9C,X           ; 4
    DEX                    ; 2
    BPL    L59F5           ; 2
    INX                    ; 2
    LDA    $AA             ; 3
L59FD:
    CMP    L5AA7,X         ; 4
    BPL    L5A05           ; 2
    INX                    ; 2
    BNE    L59FD           ; 2
L5A05:
    STX    $D7             ; 3
    LDA    #$00            ; 2
    STA    $9C,X           ; 4
    LDA    #$52            ; 2
    STA    $A0,X           ; 4
    LDA    $A9             ; 3
    BEQ    L5A14           ; 2
    DEY                    ; 2
L5A14:
    LDA    L5AA3,Y         ; 4
    STA    $98,X           ; 4
    LDA    L5B00,Y         ; 4
    STA    $A4,X           ; 4
    LDA    L5F60,Y         ; 4
    STA    $D6             ; 3
    LDA    L5FF3,Y         ; 4
    STA    $D9             ; 3
    LDA    L5AA5,Y         ; 4
    STA    $D8             ; 3
    LDA    #$00            ; 2
    STA    $C4             ; 3
    STA    $C5             ; 3
    STA    $C6             ; 3
    STA    $C7             ; 3
    LDA    #$50            ; 2
    STA    $C8             ; 3
    STA    $CA             ; 3
    STA    $CC             ; 3
L5A3F:
    LDA    $F1             ; 3
    BEQ    L5A46           ; 2
    DEC    $F1             ; 5
L5A45:
    RTS                    ; 6

L5A46:
    LDX    $D7             ; 3
    LDY    $9C,X           ; 4
    CPY    #$84            ; 2
    BEQ    L5A60           ; 2
    LDY    #$84            ; 2
    LDA    $98,X           ; 4
    CMP    $D9             ; 3
    BEQ    L5A60           ; 2
    LDY    #$00            ; 2
    LDA    $F0             ; 3
    AND    #$08            ; 2
    BNE    L5A60           ; 2
    LDY    #$16            ; 2
L5A60:
    STY    $9C,X           ; 4
    LDY    $D8             ; 3
    LDA    $98,X           ; 4
    CMP    $D6             ; 3
    BEQ    L5A75           ; 2
    LDX    #$03            ; 2
    JSR    L5517           ; 6
    LDX    $D7             ; 3
    STA    $98,X           ; 4
    BPL    L5A7F           ; 2
L5A75:
    LDA    #$00            ; 2
    STA    $AF             ; 3
    STA    $B0             ; 3
    STA    $B1             ; 3
    STA    $B2             ; 3
L5A7F:
    LDA    $F0             ; 3
    BNE    L5AA2           ; 2
    LDY    $CF             ; 3
    DEC    $D5             ; 5
    BPL    L5A8C           ; 2
    JMP    L5002           ; 3
L5A8C:
    TYA                    ; 2
    BEQ    L5AA2           ; 2
    LDA    $BD             ; 3
    EOR    #$01            ; 2
    STA    $BD             ; 3
    LDX    #$02            ; 2
L5A97:
    LDA    $8C,X           ; 4
    LDY    $91,X           ; 4
    STA    $91,X           ; 4
    STY    $8C,X           ; 4
    DEX                    ; 2
    BPL    L5A97           ; 2
L5AA2:
    RTS                    ; 6

L5AA3:
    .byte $40 ; | X      | $5AA3
    .byte $98 ; |X  XX   | $5AA4
L5AA5:
    .byte $F0 ; |XXXX    | $5AA5
    .byte $10 ; |   X    | $5AA6
L5AA7:
    .byte $3E ; |  XXXXX | $5AA7
    .byte $29 ; |  X X  X| $5AA8
    .byte $14 ; |   X X  | $5AA9
    .byte $00 ; |        | $5AAA
L5AAB:
    .byte $00 ; |        | $5AAB
    .byte $5F ; | X XXXXX| $5AAC
    .byte $00 ; |        | $5AAD
    .byte $5F ; | X XXXXX| $5AAE
    .byte $00 ; |        | $5AAF
    .byte $5F ; | X XXXXX| $5AB0
    .byte $00 ; |        | $5AB1
    .byte $5F ; | X XXXXX| $5AB2
    .byte $00 ; |        | $5AB3
    .byte $5F ; | X XXXXX| $5AB4
    .byte $00 ; |        | $5AB5
    .byte $5F ; | X XXXXX| $5AB6
    .byte $00 ; |        | $5AB7
    .byte $00 ; |        | $5AB8
    .byte $00 ; |        | $5AB9
    .byte $03 ; |      XX| $5ABA
    .byte $00 ; |        | $5ABB
    .byte $00 ; |        | $5ABC
    .byte $00 ; |        | $5ABD
    .byte $00 ; |        | $5ABE
    .byte $03 ; |      XX| $5ABF
    .byte $00 ; |        | $5AC0
    .byte $00 ; |        | $5AC1
    .byte $08 ; |    X   | $5AC2
    .byte $06 ; |     XX | $5AC3
    .byte $03 ; |      XX| $5AC4
    .byte $05 ; |     X X| $5AC5
    .byte $04 ; |     X  | $5AC6
    .byte $B0 ; |X XX    | $5AC7
    .byte $B0 ; |X XX    | $5AC8
    .byte $B0 ; |X XX    | $5AC9
    .byte $B0 ; |X XX    | $5ACA
    .byte $52 ; | X X  X | $5ACB
    .byte $52 ; | X X  X | $5ACC
    .byte $52 ; | X X  X | $5ACD
    .byte $52 ; | X X  X | $5ACE
    .byte $00 ; |        | $5ACF
    .byte $00 ; |        | $5AD0
    .byte $00 ; |        | $5AD1
    .byte $00 ; |        | $5AD2
    .byte $08 ; |    X   | $5AD3
    .byte $00 ; |        | $5AD4
    .byte $00 ; |        | $5AD5
    .byte $1C ; |   XXX  | $5AD6
    .byte $1C ; |   XXX  | $5AD7
    .byte $1C ; |   XXX  | $5AD8
    .byte $1C ; |   XXX  | $5AD9
    .byte $00 ; |        | $5ADA
    .byte $1C ; |   XXX  | $5ADB
    .byte $00 ; |        | $5ADC
    .byte $00 ; |        | $5ADD
    .byte $91 ; |X  X   X| $5ADE
    .byte $91 ; |X  X   X| $5ADF
    .byte $91 ; |X  X   X| $5AE0
    .byte $91 ; |X  X   X| $5AE1
    .byte $4B ; | X  X XX| $5AE2
    .byte $4B ; | X  X XX| $5AE3
    .byte $4B ; | X  X XX| $5AE4
    .byte $4B ; | X  X XX| $5AE5
    .byte $1F ; |   XXXXX| $5AE6
    .byte $00 ; |        | $5AE7
    .byte $00 ; |        | $5AE8
    .byte $00 ; |        | $5AE9
    .byte $00 ; |        | $5AEA
    .byte $00 ; |        | $5AEB
    .byte $00 ; |        | $5AEC
    .byte $00 ; |        | $5AED
    .byte $1E ; |   XXXX | $5AEE
    .byte $A8 ; |X X X   | $5AEF
    .byte $C4 ; |XX   X  | $5AF0
    .byte $16 ; |   X XX | $5AF1
    .byte $DA ; |XX XX X | $5AF2
    .byte $6A ; | XX X X | $5AF3
    .byte $5F ; | X XXXXX| $5AF4
    .byte $7A ; | XXXX X | $5AF5
    .byte $5F ; | X XXXXX| $5AF6
    .byte $62 ; | XX   X | $5AF7
    .byte $5F ; | X XXXXX| $5AF8
    .byte $00 ; |        | $5AF9
    .byte $00 ; |        | $5AFA
    .byte $7F ; | XXXXXXX| $5AFB
    .byte $1D ; |   XXX X| $5AFC
    .byte $A1 ; |X X    X| $5AFD
    .byte $00 ; |        | $5AFE
    .byte $00 ; |        | $5AFF
L5B00:
    .byte $08 ; |    X   | $5B00
    .byte $00 ; |        | $5B01
    .byte $0E ; |    XXX | $5B02
    .byte $0E ; |    XXX | $5B03
    .byte $0E ; |    XXX | $5B04
    .byte $0E ; |    XXX | $5B05
    .byte $0E ; |    XXX | $5B06
    .byte $0E ; |    XXX | $5B07
    .byte $0E ; |    XXX | $5B08
    .byte $0E ; |    XXX | $5B09
    .byte $0E ; |    XXX | $5B0A
    .byte $0E ; |    XXX | $5B0B
    .byte $0E ; |    XXX | $5B0C
    .byte $0E ; |    XXX | $5B0D
    .byte $0E ; |    XXX | $5B0E
    .byte $0E ; |    XXX | $5B0F
    .byte $0E ; |    XXX | $5B10
    .byte $0E ; |    XXX | $5B11
    .byte $0E ; |    XXX | $5B12
    .byte $0E ; |    XXX | $5B13
    .byte $0E ; |    XXX | $5B14
    .byte $0E ; |    XXX | $5B15
    .byte $0E ; |    XXX | $5B16
    .byte $0E ; |    XXX | $5B17
    .byte $26 ; |  X  XX | $5B18
    .byte $26 ; |  X  XX | $5B19
    .byte $26 ; |  X  XX | $5B1A
    .byte $26 ; |  X  XX | $5B1B
    .byte $16 ; |   X XX | $5B1C
    .byte $16 ; |   X XX | $5B1D
    .byte $2C ; |  X XX  | $5B1E
    .byte $2C ; |  X XX  | $5B1F
    .byte $2C ; |  X XX  | $5B20
    .byte $2C ; |  X XX  | $5B21
    .byte $2C ; |  X XX  | $5B22
    .byte $2C ; |  X XX  | $5B23
    .byte $2C ; |  X XX  | $5B24
    .byte $0E ; |    XXX | $5B25
    .byte $0E ; |    XXX | $5B26
    .byte $0E ; |    XXX | $5B27
    .byte $0E ; |    XXX | $5B28
    .byte $0E ; |    XXX | $5B29
    .byte $26 ; |  X  XX | $5B2A
    .byte $26 ; |  X  XX | $5B2B
    .byte $26 ; |  X  XX | $5B2C
    .byte $26 ; |  X  XX | $5B2D
    .byte $00 ; |        | $5B2E
    .byte $00 ; |        | $5B2F
    .byte $00 ; |        | $5B30
    .byte $00 ; |        | $5B31
    .byte $00 ; |        | $5B32
    .byte $00 ; |        | $5B33
    .byte $00 ; |        | $5B34
    .byte $00 ; |        | $5B35
    .byte $00 ; |        | $5B36
    .byte $00 ; |        | $5B37
    .byte $00 ; |        | $5B38
    .byte $00 ; |        | $5B39
    .byte $00 ; |        | $5B3A
    .byte $00 ; |        | $5B3B
    .byte $00 ; |        | $5B3C
    .byte $00 ; |        | $5B3D
    .byte $00 ; |        | $5B3E
    .byte $00 ; |        | $5B3F
    .byte $00 ; |        | $5B40
    .byte $00 ; |        | $5B41
    .byte $0E ; |    XXX | $5B42
    .byte $1A ; |   XX X | $5B43
    .byte $1A ; |   XX X | $5B44
    .byte $1A ; |   XX X | $5B45
    .byte $1A ; |   XX X | $5B46
    .byte $00 ; |        | $5B47
    .byte $1A ; |   XX X | $5B48
    .byte $1A ; |   XX X | $5B49
    .byte $1A ; |   XX X | $5B4A
    .byte $1A ; |   XX X | $5B4B
    .byte $1A ; |   XX X | $5B4C
    .byte $2C ; |  X XX  | $5B4D
    .byte $2C ; |  X XX  | $5B4E
    .byte $2C ; |  X XX  | $5B4F
    .byte $2C ; |  X XX  | $5B50
    .byte $2C ; |  X XX  | $5B51
    .byte $2C ; |  X XX  | $5B52
    .byte $2C ; |  X XX  | $5B53
    .byte $16 ; |   X XX | $5B54
    .byte $16 ; |   X XX | $5B55
    .byte $0E ; |    XXX | $5B56
    .byte $58 ; | X XX   | $5B57
    .byte $58 ; | X XX   | $5B58
    .byte $58 ; | X XX   | $5B59
    .byte $58 ; | X XX   | $5B5A
    .byte $16 ; |   X XX | $5B5B
    .byte $0E ; |    XXX | $5B5C
    .byte $0E ; |    XXX | $5B5D
    .byte $0E ; |    XXX | $5B5E
    .byte $0E ; |    XXX | $5B5F
    .byte $0E ; |    XXX | $5B60
    .byte $2C ; |  X XX  | $5B61
    .byte $2C ; |  X XX  | $5B62
    .byte $2C ; |  X XX  | $5B63
    .byte $2C ; |  X XX  | $5B64
    .byte $2C ; |  X XX  | $5B65
    .byte $2C ; |  X XX  | $5B66
    .byte $2C ; |  X XX  | $5B67
    .byte $16 ; |   X XX | $5B68
    .byte $16 ; |   X XX | $5B69
    .byte $16 ; |   X XX | $5B6A
    .byte $16 ; |   X XX | $5B6B
    .byte $16 ; |   X XX | $5B6C
    .byte $16 ; |   X XX | $5B6D
    .byte $16 ; |   X XX | $5B6E
    .byte $16 ; |   X XX | $5B6F
    .byte $16 ; |   X XX | $5B70
    .byte $16 ; |   X XX | $5B71
    .byte $16 ; |   X XX | $5B72
    .byte $16 ; |   X XX | $5B73
    .byte $16 ; |   X XX | $5B74
    .byte $16 ; |   X XX | $5B75
    .byte $16 ; |   X XX | $5B76
    .byte $16 ; |   X XX | $5B77
    .byte $16 ; |   X XX | $5B78
    .byte $16 ; |   X XX | $5B79
    .byte $16 ; |   X XX | $5B7A
    .byte $16 ; |   X XX | $5B7B
    .byte $16 ; |   X XX | $5B7C
    .byte $16 ; |   X XX | $5B7D
L5B7E:
    .byte $80 ; |X       | $5B7E
    .byte $80 ; |X       | $5B7F
    .byte $80 ; |X       | $5B80
    .byte $80 ; |X       | $5B81
    .byte $80 ; |X       | $5B82
    .byte $00 ; |        | $5B83
    .byte $00 ; |        | $5B84
    .byte $00 ; |        | $5B85
    .byte $00 ; |        | $5B86
    .byte $00 ; |        | $5B87
    .byte $40 ; | X      | $5B88
    .byte $40 ; | X      | $5B89
    .byte $40 ; | X      | $5B8A
    .byte $40 ; | X      | $5B8B
    .byte $E0 ; |XXX     | $5B8C
L5B8D:
    .byte $15 ; |   X X X| $5B8D
    .byte $15 ; |   X X X| $5B8E
    .byte $57 ; | X X XXX| $5B8F
    .byte $B5 ; |X XX X X| $5B90
    .byte $12 ; |   X  X | $5B91
    .byte $EA ; |XXX X X | $5B92
    .byte $8A ; |X   X X | $5B93
    .byte $8E ; |X   XXX | $5B94
    .byte $8A ; |X   X X | $5B95
    .byte $EA ; |XXX X X | $5B96
    .byte $57 ; | X X XXX| $5B97
    .byte $54 ; | X X X  | $5B98
    .byte $76 ; | XXX XX | $5B99
    .byte $54 ; | X X X  | $5B9A
    .byte $57 ; | X X XXX| $5B9B
L5B9C:
    .byte $EE ; |XXX XXX | $5B9C
    .byte $88 ; |X   X   | $5B9D
    .byte $EE ; |XXX XXX | $5B9E
    .byte $22 ; |  X   X | $5B9F
    .byte $EE ; |XXX XXX | $5BA0
    .byte $55 ; | X X X X| $5BA1
    .byte $55 ; | X X X X| $5BA2
    .byte $D7 ; |XX X XXX| $5BA3
    .byte $D5 ; |XX X X X| $5BA4
    .byte $52 ; | X X  X | $5BA5
    .byte $40 ; | X      | $5BA6
    .byte $40 ; | X      | $5BA7
    .byte $40 ; | X      | $5BA8
    .byte $40 ; | X      | $5BA9
    .byte $E0 ; |XXX     | $5BAA
L5BAB:
    .byte $A0 ; |X X     | $5BAB
    .byte $A0 ; |X X     | $5BAC
    .byte $E0 ; |XXX     | $5BAD
    .byte $A0 ; |X X     | $5BAE
    .byte $40 ; | X      | $5BAF
    .byte $A0 ; |X X     | $5BB0
    .byte $30 ; |  XX    | $5BB1
    .byte $B0 ; |X XX    | $5BB2
    .byte $A0 ; |X X     | $5BB3
    .byte $A0 ; |X X     | $5BB4
    .byte $E0 ; |XXX     | $5BB5
    .byte $20 ; |  X     | $5BB6
    .byte $60 ; | XX     | $5BB7
    .byte $20 ; |  X     | $5BB8
    .byte $E0 ; |XXX     | $5BB9
L5BBA:
    .byte $75 ; | XXX X X| $5BBA
    .byte $46 ; | X   XX | $5BBB
    .byte $47 ; | X   XXX| $5BBC
    .byte $45 ; | X   X X| $5BBD
    .byte $77 ; | XXX XXX| $5BBE
    .byte $D4 ; |XX X X  | $5BBF
    .byte $55 ; | X X X X| $5BC0
    .byte $DD ; |XX XXX X| $5BC1
    .byte $15 ; |   X X X| $5BC2
    .byte $C9 ; |XX  X  X| $5BC3
    .byte $55 ; | X X X X| $5BC4
    .byte $55 ; | X X X X| $5BC5
    .byte $27 ; |  X  XXX| $5BC6
    .byte $55 ; | X X X X| $5BC7
    .byte $52 ; | X X  X | $5BC8
L5BC9:
    .byte $0E ; |    XXX | $5BC9
    .byte $02 ; |      X | $5BCA
    .byte $06 ; |     XX | $5BCB
    .byte $02 ; |      X | $5BCC
    .byte $0E ; |    XXX | $5BCD
    .byte $05 ; |     X X| $5BCE
    .byte $0A ; |    X X | $5BCF
    .byte $0A ; |    X X | $5BD0
    .byte $08 ; |    X   | $5BD1
    .byte $08 ; |    X   | $5BD2
    .byte $0E ; |    XXX | $5BD3
    .byte $08 ; |    X   | $5BD4
    .byte $0E ; |    XXX | $5BD5
    .byte $02 ; |      X | $5BD6
    .byte $0E ; |    XXX | $5BD7
L5BD8:
    DEC    $C3             ; 5
    BNE    L5BE4           ; 2
    LDX    $BD             ; 3
    LDA    $BB,X           ; 4
    BEQ    L5BE4           ; 2
    DEC    $BB,X           ; 6
L5BE4:
    RTS                    ; 6

L5BE5:
    .byte $00 ; |        | $5BE5
    .byte $9D ; |X  XXX X| $5BE6
    .byte $9D ; |X  XXX X| $5BE7
    .byte $D5 ; |XX X X X| $5BE8
    .byte $D5 ; |XX X X X| $5BE9
    .byte $95 ; |X  X X X| $5BEA
    .byte $D5 ; |XX X X X| $5BEB
    .byte $D5 ; |XX X X X| $5BEC
L5BED:
    .byte $00 ; |        | $5BED
    .byte $B2 ; |X XX  X | $5BEE
    .byte $B2 ; |X XX  X | $5BEF
    .byte $20 ; |  X     | $5BF0
    .byte $A0 ; |X X     | $5BF1
    .byte $22 ; |  X   X | $5BF2
    .byte $A2 ; |X X   X | $5BF3
    .byte $A0 ; |X X     | $5BF4
L5BF5:
    .byte $1C ; |   XXX  | $5BF5
    .byte $8C ; |X   XX  | $5BF6
    .byte $C4 ; |XX   X  | $5BF7
L5BF8:
    .byte $66 ; | XX  XX | $5BF8
    .byte $2C ; |  X XX  | $5BF9
    .byte $00 ; |        | $5BFA
    .byte $00 ; |        | $5BFB
L5BFC:
    .byte $2C ; |  X XX  | $5BFC
    .byte $42 ; | X    X | $5BFD
    .byte $58 ; | X XX   | $5BFE
    .byte $6E ; | XX XXX | $5BFF
L5C00:
    .byte $98 ; |X  XX   | $5C00
    .byte $40 ; | X      | $5C01
    .byte $66 ; | XX  XX | $5C02
    .byte $66 ; | XX  XX | $5C03
    .byte $22 ; |  X   X | $5C04
    .byte $FF ; |XXXXXXXX| $5C05
    .byte $FF ; |XXXXXXXX| $5C06
    .byte $7E ; | XXXXXX | $5C07
    .byte $7E ; | XXXXXX | $5C08
    .byte $3C ; |  XXXX  | $5C09
    .byte $2C ; |  X XX  | $5C0A
    .byte $24 ; |  X  X  | $5C0B
    .byte $74 ; | XXX X  | $5C0C
    .byte $74 ; | XXX X  | $5C0D
    .byte $34 ; |  XX X  | $5C0E
    .byte $18 ; |   XX   | $5C0F
    .byte $3C ; |  XXXX  | $5C10
    .byte $34 ; |  XX X  | $5C11
    .byte $74 ; | XXX X  | $5C12
    .byte $7C ; | XXXXX  | $5C13
    .byte $2C ; |  X XX  | $5C14
    .byte $3C ; |  XXXX  | $5C15
    .byte $7C ; | XXXXX  | $5C16
    .byte $78 ; | XXXX   | $5C17
    .byte $18 ; |   XX   | $5C18
    .byte $18 ; |   XX   | $5C19
    .byte $08 ; |    X   | $5C1A
    .byte $FF ; |XXXXXXXX| $5C1B
    .byte $FF ; |XXXXXXXX| $5C1C
    .byte $7E ; | XXXXXX | $5C1D
    .byte $7E ; | XXXXXX | $5C1E
    .byte $3C ; |  XXXX  | $5C1F
    .byte $34 ; |  XX X  | $5C20
    .byte $34 ; |  XX X  | $5C21
    .byte $74 ; | XXX X  | $5C22
    .byte $74 ; | XXX X  | $5C23
    .byte $34 ; |  XX X  | $5C24
    .byte $18 ; |   XX   | $5C25
    .byte $3C ; |  XXXX  | $5C26
    .byte $34 ; |  XX X  | $5C27
    .byte $74 ; | XXX X  | $5C28
    .byte $7C ; | XXXXX  | $5C29
    .byte $2C ; |  X XX  | $5C2A
    .byte $3C ; |  XXXX  | $5C2B
    .byte $7C ; | XXXXX  | $5C2C
    .byte $78 ; | XXXX   | $5C2D
    .byte $83 ; |X     XX| $5C2E
    .byte $5C ; | X XXX  | $5C2F
    .byte $20 ; |  X     | $5C30
    .byte $51 ; | X X   X| $5C31
    .byte $8A ; |X   X X | $5C32
    .byte $04 ; |     X  | $5C33
    .byte $0A ; |    X X | $5C34
    .byte $11 ; |   X   X| $5C35
    .byte $21 ; |  X    X| $5C36
    .byte $41 ; | X     X| $5C37
    .byte $84 ; |X    X  | $5C38
    .byte $12 ; |   X  X | $5C39
    .byte $E1 ; |XXX    X| $5C3A
    .byte $1E ; |   XXXX | $5C3B
    .byte $10 ; |   X    | $5C3C
    .byte $28 ; |  X X   | $5C3D
    .byte $44 ; | X   X  | $5C3E
    .byte $8A ; |X   X X | $5C3F
    .byte $19 ; |   XX  X| $5C40
    .byte $14 ; |   X X  | $5C41
    .byte $24 ; |  X  X  | $5C42
    .byte $C2 ; |XX    X | $5C43
    .byte $73 ; | XXX  XX| $5C44
    .byte $FB ; |XXXXX XX| $5C45
    .byte $AB ; |X X X XX| $5C46
    .byte $AB ; |X X X XX| $5C47
    .byte $FA ; |XXXXX X | $5C48
    .byte $FA ; |XXXXX X | $5C49
    .byte $AE ; |X X XXX | $5C4A
    .byte $AE ; |X X XXX | $5C4B
    .byte $FE ; |XXXXXXX | $5C4C
    .byte $7E ; | XXXXXX | $5C4D
    .byte $22 ; |  X   X | $5C4E
    .byte $22 ; |  X   X | $5C4F
    .byte $3E ; |  XXXXX | $5C50
    .byte $3C ; |  XXXX  | $5C51
    .byte $20 ; |  X     | $5C52
    .byte $20 ; |  X     | $5C53
    .byte $20 ; |  X     | $5C54
    .byte $20 ; |  X     | $5C55
    .byte $60 ; | XX     | $5C56
    .byte $60 ; | XX     | $5C57
    .byte $00 ; |        | $5C58
    .byte $00 ; |        | $5C59
    .byte $00 ; |        | $5C5A
    .byte $00 ; |        | $5C5B
    .byte $00 ; |        | $5C5C
    .byte $40 ; | X      | $5C5D
    .byte $A6 ; |X X  XX | $5C5E
    .byte $A6 ; |X X  XX | $5C5F
    .byte $9D ; |X  XXX X| $5C60
    .byte $9D ; |X  XXX X| $5C61
    .byte $17 ; |   X XXX| $5C62
    .byte $17 ; |   X XXX| $5C63
    .byte $1A ; |   XX X | $5C64
    .byte $1A ; |   XX X | $5C65
    .byte $0C ; |    XX  | $5C66
    .byte $0C ; |    XX  | $5C67
    .byte $02 ; |      X | $5C68
    .byte $02 ; |      X | $5C69
    .byte $01 ; |       X| $5C6A
    .byte $01 ; |       X| $5C6B
    .byte $01 ; |       X| $5C6C
    .byte $01 ; |       X| $5C6D
    .byte $06 ; |     XX | $5C6E
    .byte $0C ; |    XX  | $5C6F
    .byte $80 ; |X       | $5C70
    .byte $80 ; |X       | $5C71
    .byte $80 ; |X       | $5C72
    .byte $C0 ; |XX      | $5C73
    .byte $C0 ; |XX      | $5C74
    .byte $A0 ; |X X     | $5C75
    .byte $A0 ; |X X     | $5C76
    .byte $90 ; |X  X    | $5C77
    .byte $D0 ; |XX X    | $5C78
    .byte $C8 ; |XX  X   | $5C79
    .byte $A8 ; |X X X   | $5C7A
    .byte $25 ; |  X  X X| $5C7B
    .byte $15 ; |   X X X| $5C7C
    .byte $13 ; |   X  XX| $5C7D
    .byte $0B ; |    X XX| $5C7E
    .byte $09 ; |    X  X| $5C7F
    .byte $05 ; |     X X| $5C80
    .byte $05 ; |     X X| $5C81
    .byte $03 ; |      XX| $5C82
    .byte $03 ; |      XX| $5C83
    .byte $01 ; |       X| $5C84
    .byte $01 ; |       X| $5C85
    .byte $0C ; |    XX  | $5C86
    .byte $0C ; |    XX  | $5C87
    .byte $04 ; |     X  | $5C88
    .byte $FF ; |XXXXXXXX| $5C89
    .byte $FF ; |XXXXXXXX| $5C8A
    .byte $9F ; |X  XXXXX| $5C8B
    .byte $9F ; |X  XXXXX| $5C8C
    .byte $1F ; |   XXXXX| $5C8D
    .byte $0B ; |    X XX| $5C8E
    .byte $09 ; |    X  X| $5C8F
    .byte $1D ; |   XXX X| $5C90
    .byte $1D ; |   XXX X| $5C91
    .byte $0D ; |    XX X| $5C92
    .byte $06 ; |     XX | $5C93
    .byte $0F ; |    XXXX| $5C94
    .byte $0D ; |    XX X| $5C95
    .byte $1D ; |   XXX X| $5C96
    .byte $1F ; |   XXXXX| $5C97
    .byte $0B ; |    X XX| $5C98
    .byte $0F ; |    XXXX| $5C99
    .byte $1F ; |   XXXXX| $5C9A
    .byte $1E ; |   XXXX | $5C9B
    .byte $7C ; | XXXXX  | $5C9C
    .byte $FF ; |XXXXXXXX| $5C9D
    .byte $7E ; | XXXXXX | $5C9E
    .byte $3C ; |  XXXX  | $5C9F
    .byte $78 ; | XXXX   | $5CA0
    .byte $7C ; | XXXXX  | $5CA1
    .byte $3C ; |  XXXX  | $5CA2
    .byte $2C ; |  X XX  | $5CA3
    .byte $7C ; | XXXXX  | $5CA4
    .byte $74 ; | XXX X  | $5CA5
    .byte $34 ; |  XX X  | $5CA6
    .byte $3C ; |  XXXX  | $5CA7
    .byte $18 ; |   XX   | $5CA8
    .byte $34 ; |  XX X  | $5CA9
    .byte $74 ; | XXX X  | $5CAA
    .byte $74 ; | XXX X  | $5CAB
    .byte $24 ; |  X  X  | $5CAC
    .byte $2C ; |  X XX  | $5CAD
    .byte $3C ; |  XXXX  | $5CAE
    .byte $7E ; | XXXXXX | $5CAF
    .byte $7E ; | XXXXXX | $5CB0
    .byte $FF ; |XXXXXXXX| $5CB1
    .byte $00 ; |        | $5CB2
    .byte $00 ; |        | $5CB3
    .byte $00 ; |        | $5CB4
    .byte $00 ; |        | $5CB5
    .byte $00 ; |        | $5CB6
    .byte $00 ; |        | $5CB7
    .byte $00 ; |        | $5CB8
    .byte $00 ; |        | $5CB9
    .byte $00 ; |        | $5CBA
    .byte $00 ; |        | $5CBB
    .byte $00 ; |        | $5CBC
    .byte $00 ; |        | $5CBD
    .byte $00 ; |        | $5CBE
    .byte $00 ; |        | $5CBF
    .byte $00 ; |        | $5CC0
    .byte $00 ; |        | $5CC1
    .byte $00 ; |        | $5CC2
    .byte $00 ; |        | $5CC3
    .byte $00 ; |        | $5CC4
    .byte $00 ; |        | $5CC5
    .byte $00 ; |        | $5CC6
    .byte $00 ; |        | $5CC7
L5CC8:
    LDA    L5AAB,X         ; 4
    STA    $80,X           ; 4
    DEX                    ; 2
    BPL    L5CC8           ; 2
L5CD0:
    RTS                    ; 6

L5CD1:
    LDA    SWCHA           ; 4
    LDX    $BD             ; 3
    BEQ    L5CDC           ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
L5CDC:
    LDX    $BE             ; 3
    BNE    L5CE8           ; 2
    LDX    $D5             ; 3
    BNE    L5CE8           ; 2
    LDX    $C0             ; 3
    BEQ    L5CEA           ; 2
L5CE8:
    LDA    #$FF            ; 2
L5CEA:
    STA    $EF             ; 3
    AND    #$30            ; 2
    CMP    #$30            ; 2
    BEQ    L5CFC           ; 2
    LDA    $F0             ; 3
    ORA    #$01            ; 2
    STA    $D2             ; 3
    AND    #$FD            ; 2
    STA    $D1             ; 3
L5CFC:
    RTS                    ; 6

L5CFD:
    .byte $44 ; | X   X  | $5CFD
    .byte $5A ; | X XX X | $5CFE
    .byte $00 ; |        | $5CFF
    .byte $00 ; |        | $5D00
    .byte $00 ; |        | $5D01
    .byte $00 ; |        | $5D02
    .byte $00 ; |        | $5D03
    .byte $00 ; |        | $5D04
    .byte $00 ; |        | $5D05
    .byte $00 ; |        | $5D06
    .byte $00 ; |        | $5D07
    .byte $00 ; |        | $5D08
    .byte $00 ; |        | $5D09
    .byte $00 ; |        | $5D0A
    .byte $00 ; |        | $5D0B
    .byte $00 ; |        | $5D0C
    .byte $00 ; |        | $5D0D
    .byte $00 ; |        | $5D0E
    .byte $00 ; |        | $5D0F
    .byte $00 ; |        | $5D10
    .byte $00 ; |        | $5D11
    .byte $00 ; |        | $5D12
    .byte $00 ; |        | $5D13
    .byte $00 ; |        | $5D14
    .byte $00 ; |        | $5D15
    .byte $00 ; |        | $5D16
    .byte $00 ; |        | $5D17
    .byte $00 ; |        | $5D18
    .byte $00 ; |        | $5D19
    .byte $00 ; |        | $5D1A
    .byte $00 ; |        | $5D1B
    .byte $E7 ; |XXX  XXX| $5D1C
    .byte $E7 ; |XXX  XXX| $5D1D
    .byte $63 ; | XX   XX| $5D1E
    .byte $63 ; | XX   XX| $5D1F
    .byte $36 ; |  XX XX | $5D20
    .byte $36 ; |  XX XX | $5D21
    .byte $3E ; |  XXXXX | $5D22
    .byte $3E ; |  XXXXX | $5D23
    .byte $8E ; |X   XXX | $5D24
    .byte $8E ; |X   XXX | $5D25
    .byte $FE ; |XXXXXXX | $5D26
    .byte $FE ; |XXXXXXX | $5D27
    .byte $FE ; |XXXXXXX | $5D28
    .byte $2E ; |  X XXX | $5D29
    .byte $2E ; |  X XXX | $5D2A
    .byte $3E ; |  XXXXX | $5D2B
    .byte $3E ; |  XXXXX | $5D2C
    .byte $1C ; |   XXX  | $5D2D
    .byte $7E ; | XXXXXX | $5D2E
    .byte $6E ; | XX XXX | $5D2F
    .byte $1F ; |   XXXXX| $5D30
    .byte $7F ; | XXXXXXX| $5D31
    .byte $FB ; |XXXXX XX| $5D32
    .byte $7B ; | XXXX XX| $5D33
    .byte $5B ; | X XX XX| $5D34
    .byte $7F ; | XXXXXXX| $5D35
    .byte $7F ; | XXXXXXX| $5D36
    .byte $3E ; |  XXXXX | $5D37
    .byte $00 ; |        | $5D38
    .byte $00 ; |        | $5D39
    .byte $00 ; |        | $5D3A
    .byte $00 ; |        | $5D3B
    .byte $00 ; |        | $5D3C
    .byte $00 ; |        | $5D3D
    .byte $00 ; |        | $5D3E
    .byte $00 ; |        | $5D3F
    .byte $00 ; |        | $5D40
    .byte $00 ; |        | $5D41
    .byte $00 ; |        | $5D42
    .byte $00 ; |        | $5D43
    .byte $00 ; |        | $5D44
    .byte $00 ; |        | $5D45
    .byte $00 ; |        | $5D46
    .byte $00 ; |        | $5D47
    .byte $00 ; |        | $5D48
    .byte $00 ; |        | $5D49
    .byte $00 ; |        | $5D4A
    .byte $00 ; |        | $5D4B
    .byte $00 ; |        | $5D4C
    .byte $00 ; |        | $5D4D
    .byte $00 ; |        | $5D4E
    .byte $00 ; |        | $5D4F
    .byte $00 ; |        | $5D50
    .byte $00 ; |        | $5D51
    .byte $00 ; |        | $5D52
    .byte $00 ; |        | $5D53
    .byte $38 ; |  XXX   | $5D54
    .byte $38 ; |  XXX   | $5D55
    .byte $18 ; |   XX   | $5D56
    .byte $18 ; |   XX   | $5D57
    .byte $18 ; |   XX   | $5D58
    .byte $18 ; |   XX   | $5D59
    .byte $3E ; |  XXXXX | $5D5A
    .byte $3E ; |  XXXXX | $5D5B
    .byte $8E ; |X   XXX | $5D5C
    .byte $8E ; |X   XXX | $5D5D
    .byte $FE ; |XXXXXXX | $5D5E
    .byte $FE ; |XXXXXXX | $5D5F
    .byte $FE ; |XXXXXXX | $5D60
    .byte $2E ; |  X XXX | $5D61
    .byte $2E ; |  X XXX | $5D62
    .byte $3E ; |  XXXXX | $5D63
    .byte $3E ; |  XXXXX | $5D64
    .byte $1C ; |   XXX  | $5D65
    .byte $7E ; | XXXXXX | $5D66
    .byte $6E ; | XX XXX | $5D67
    .byte $1F ; |   XXXXX| $5D68
    .byte $7F ; | XXXXXXX| $5D69
    .byte $FB ; |XXXXX XX| $5D6A
    .byte $7B ; | XXXX XX| $5D6B
    .byte $5B ; | X XX XX| $5D6C
    .byte $7F ; | XXXXXXX| $5D6D
    .byte $7F ; | XXXXXXX| $5D6E
    .byte $3E ; |  XXXXX | $5D6F
    .byte $00 ; |        | $5D70
    .byte $00 ; |        | $5D71
    .byte $00 ; |        | $5D72
    .byte $00 ; |        | $5D73
    .byte $00 ; |        | $5D74
    .byte $00 ; |        | $5D75
    .byte $00 ; |        | $5D76
    .byte $00 ; |        | $5D77
    .byte $00 ; |        | $5D78
    .byte $00 ; |        | $5D79
    .byte $00 ; |        | $5D7A
    .byte $00 ; |        | $5D7B
    .byte $00 ; |        | $5D7C
    .byte $00 ; |        | $5D7D
    .byte $00 ; |        | $5D7E
    .byte $00 ; |        | $5D7F
    .byte $00 ; |        | $5D80
    .byte $00 ; |        | $5D81
    .byte $00 ; |        | $5D82
    .byte $00 ; |        | $5D83
    .byte $00 ; |        | $5D84
    .byte $00 ; |        | $5D85
    .byte $00 ; |        | $5D86
    .byte $00 ; |        | $5D87
    .byte $00 ; |        | $5D88
    .byte $00 ; |        | $5D89
    .byte $00 ; |        | $5D8A
    .byte $00 ; |        | $5D8B
    .byte $7E ; | XXXXXX | $5D8C
    .byte $7E ; | XXXXXX | $5D8D
    .byte $36 ; |  XX XX | $5D8E
    .byte $36 ; |  XX XX | $5D8F
    .byte $1C ; |   XXX  | $5D90
    .byte $1C ; |   XXX  | $5D91
    .byte $3E ; |  XXXXX | $5D92
    .byte $3E ; |  XXXXX | $5D93
    .byte $4E ; | X  XXX | $5D94
    .byte $4E ; | X  XXX | $5D95
    .byte $FE ; |XXXXXXX | $5D96
    .byte $FE ; |XXXXXXX | $5D97
    .byte $FE ; |XXXXXXX | $5D98
    .byte $4E ; | X  XXX | $5D99
    .byte $4E ; | X  XXX | $5D9A
    .byte $3E ; |  XXXXX | $5D9B
    .byte $3E ; |  XXXXX | $5D9C
    .byte $1C ; |   XXX  | $5D9D
    .byte $7E ; | XXXXXX | $5D9E
    .byte $6E ; | XX XXX | $5D9F
    .byte $1F ; |   XXXXX| $5DA0
    .byte $7F ; | XXXXXXX| $5DA1
    .byte $FB ; |XXXXX XX| $5DA2
    .byte $7B ; | XXXX XX| $5DA3
    .byte $5B ; | X XX XX| $5DA4
    .byte $7F ; | XXXXXXX| $5DA5
    .byte $7F ; | XXXXXXX| $5DA6
    .byte $3E ; |  XXXXX | $5DA7
    .byte $00 ; |        | $5DA8
    .byte $00 ; |        | $5DA9
    .byte $00 ; |        | $5DAA
    .byte $00 ; |        | $5DAB
    .byte $00 ; |        | $5DAC
    .byte $00 ; |        | $5DAD
    .byte $00 ; |        | $5DAE
    .byte $00 ; |        | $5DAF
    .byte $00 ; |        | $5DB0
    .byte $00 ; |        | $5DB1
    .byte $00 ; |        | $5DB2
    .byte $00 ; |        | $5DB3
    .byte $00 ; |        | $5DB4
    .byte $00 ; |        | $5DB5
    .byte $00 ; |        | $5DB6
    .byte $00 ; |        | $5DB7
    .byte $00 ; |        | $5DB8
    .byte $00 ; |        | $5DB9
    .byte $00 ; |        | $5DBA
    .byte $00 ; |        | $5DBB
    .byte $00 ; |        | $5DBC
    .byte $00 ; |        | $5DBD
    .byte $00 ; |        | $5DBE
    .byte $00 ; |        | $5DBF
    .byte $00 ; |        | $5DC0
    .byte $00 ; |        | $5DC1
    .byte $00 ; |        | $5DC2
    .byte $00 ; |        | $5DC3
    .byte $38 ; |  XXX   | $5DC4
    .byte $38 ; |  XXX   | $5DC5
    .byte $18 ; |   XX   | $5DC6
    .byte $18 ; |   XX   | $5DC7
    .byte $18 ; |   XX   | $5DC8
    .byte $18 ; |   XX   | $5DC9
    .byte $3E ; |  XXXXX | $5DCA
    .byte $3E ; |  XXXXX | $5DCB
    .byte $2E ; |  X XXX | $5DCC
    .byte $2E ; |  X XXX | $5DCD
    .byte $FE ; |XXXXXXX | $5DCE
    .byte $FE ; |XXXXXXX | $5DCF
    .byte $FE ; |XXXXXXX | $5DD0
    .byte $8E ; |X   XXX | $5DD1
    .byte $8E ; |X   XXX | $5DD2
    .byte $3E ; |  XXXXX | $5DD3
    .byte $3E ; |  XXXXX | $5DD4
    .byte $1C ; |   XXX  | $5DD5
    .byte $7E ; | XXXXXX | $5DD6
    .byte $6E ; | XX XXX | $5DD7
    .byte $1F ; |   XXXXX| $5DD8
    .byte $7F ; | XXXXXXX| $5DD9
    .byte $FB ; |XXXXX XX| $5DDA
    .byte $7B ; | XXXX XX| $5DDB
    .byte $5B ; | X XX XX| $5DDC
    .byte $7F ; | XXXXXXX| $5DDD
    .byte $7F ; | XXXXXXX| $5DDE
    .byte $3E ; |  XXXXX | $5DDF
    .byte $00 ; |        | $5DE0
    .byte $00 ; |        | $5DE1
    .byte $00 ; |        | $5DE2
    .byte $00 ; |        | $5DE3
    .byte $00 ; |        | $5DE4
    .byte $00 ; |        | $5DE5
    .byte $00 ; |        | $5DE6
    .byte $00 ; |        | $5DE7
    .byte $00 ; |        | $5DE8
    .byte $00 ; |        | $5DE9
    .byte $00 ; |        | $5DEA
    .byte $00 ; |        | $5DEB
    .byte $00 ; |        | $5DEC
    .byte $00 ; |        | $5DED
    .byte $00 ; |        | $5DEE
    .byte $00 ; |        | $5DEF
    .byte $00 ; |        | $5DF0
    .byte $00 ; |        | $5DF1
    .byte $00 ; |        | $5DF2
    .byte $00 ; |        | $5DF3
    .byte $00 ; |        | $5DF4
    .byte $00 ; |        | $5DF5
    .byte $00 ; |        | $5DF6
    .byte $00 ; |        | $5DF7
    .byte $00 ; |        | $5DF8
    .byte $00 ; |        | $5DF9
    .byte $00 ; |        | $5DFA
    .byte $00 ; |        | $5DFB
    .byte $00 ; |        | $5DFC
    .byte $00 ; |        | $5DFD
    .byte $00 ; |        | $5DFE
    .byte $00 ; |        | $5DFF
    .byte $00 ; |        | $5E00
    .byte $00 ; |        | $5E01
    .byte $00 ; |        | $5E02
    .byte $00 ; |        | $5E03
    .byte $00 ; |        | $5E04
    .byte $00 ; |        | $5E05
    .byte $00 ; |        | $5E06
    .byte $00 ; |        | $5E07
    .byte $00 ; |        | $5E08
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
    .byte $90 ; |X  X    | $5E23
    .byte $00 ; |        | $5E24
    .byte $00 ; |        | $5E25
    .byte $00 ; |        | $5E26
    .byte $00 ; |        | $5E27
    .byte $00 ; |        | $5E28
    .byte $00 ; |        | $5E29
    .byte $70 ; | XXX    | $5E2A
    .byte $00 ; |        | $5E2B
    .byte $00 ; |        | $5E2C
    .byte $00 ; |        | $5E2D
    .byte $00 ; |        | $5E2E
    .byte $00 ; |        | $5E2F
    .byte $00 ; |        | $5E30
    .byte $00 ; |        | $5E31
    .byte $00 ; |        | $5E32
    .byte $00 ; |        | $5E33
    .byte $00 ; |        | $5E34
    .byte $00 ; |        | $5E35
    .byte $00 ; |        | $5E36
    .byte $00 ; |        | $5E37
    .byte $00 ; |        | $5E38
    .byte $00 ; |        | $5E39
    .byte $00 ; |        | $5E3A
    .byte $00 ; |        | $5E3B
    .byte $00 ; |        | $5E3C
    .byte $00 ; |        | $5E3D
    .byte $00 ; |        | $5E3E
    .byte $00 ; |        | $5E3F
    .byte $00 ; |        | $5E40
    .byte $00 ; |        | $5E41
    .byte $00 ; |        | $5E42
    .byte $00 ; |        | $5E43
    .byte $00 ; |        | $5E44
    .byte $00 ; |        | $5E45
    .byte $00 ; |        | $5E46
    .byte $00 ; |        | $5E47
    .byte $00 ; |        | $5E48
    .byte $00 ; |        | $5E49
    .byte $00 ; |        | $5E4A
    .byte $00 ; |        | $5E4B
    .byte $00 ; |        | $5E4C
    .byte $00 ; |        | $5E4D
    .byte $00 ; |        | $5E4E
    .byte $00 ; |        | $5E4F
    .byte $00 ; |        | $5E50
    .byte $00 ; |        | $5E51
    .byte $00 ; |        | $5E52
    .byte $05 ; |     X X| $5E53
    .byte $05 ; |     X X| $5E54
    .byte $05 ; |     X X| $5E55
    .byte $05 ; |     X X| $5E56
    .byte $05 ; |     X X| $5E57
    .byte $05 ; |     X X| $5E58
    .byte $05 ; |     X X| $5E59
    .byte $00 ; |        | $5E5A
    .byte $00 ; |        | $5E5B
    .byte $00 ; |        | $5E5C
    .byte $00 ; |        | $5E5D
    .byte $00 ; |        | $5E5E
    .byte $00 ; |        | $5E5F
    .byte $00 ; |        | $5E60
    .byte $D0 ; |XX X    | $5E61
    .byte $00 ; |        | $5E62
    .byte $00 ; |        | $5E63
    .byte $00 ; |        | $5E64
    .byte $00 ; |        | $5E65
    .byte $00 ; |        | $5E66
    .byte $00 ; |        | $5E67
    .byte $30 ; |  XX    | $5E68
    .byte $00 ; |        | $5E69
    .byte $00 ; |        | $5E6A
    .byte $00 ; |        | $5E6B
    .byte $00 ; |        | $5E6C
    .byte $00 ; |        | $5E6D
    .byte $00 ; |        | $5E6E
    .byte $00 ; |        | $5E6F
    .byte $00 ; |        | $5E70
    .byte $00 ; |        | $5E71
    .byte $00 ; |        | $5E72
    .byte $00 ; |        | $5E73
    .byte $00 ; |        | $5E74
    .byte $00 ; |        | $5E75
    .byte $00 ; |        | $5E76
    .byte $00 ; |        | $5E77
    .byte $00 ; |        | $5E78
    .byte $00 ; |        | $5E79
    .byte $00 ; |        | $5E7A
    .byte $00 ; |        | $5E7B
    .byte $00 ; |        | $5E7C
    .byte $00 ; |        | $5E7D
    .byte $00 ; |        | $5E7E
    .byte $00 ; |        | $5E7F
    .byte $00 ; |        | $5E80
    .byte $00 ; |        | $5E81
    .byte $00 ; |        | $5E82
    .byte $00 ; |        | $5E83
    .byte $00 ; |        | $5E84
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
    .byte $A8 ; |X X X   | $5E93
    .byte $A8 ; |X X X   | $5E94
    .byte $A8 ; |X X X   | $5E95
    .byte $A8 ; |X X X   | $5E96
    .byte $A8 ; |X X X   | $5E97
    .byte $A8 ; |X X X   | $5E98
    .byte $A8 ; |X X X   | $5E99
    .byte $A8 ; |X X X   | $5E9A
    .byte $A8 ; |X X X   | $5E9B
    .byte $A8 ; |X X X   | $5E9C
    .byte $A8 ; |X X X   | $5E9D
    .byte $A8 ; |X X X   | $5E9E
    .byte $A8 ; |X X X   | $5E9F
    .byte $A8 ; |X X X   | $5EA0
    .byte $A8 ; |X X X   | $5EA1
    .byte $A8 ; |X X X   | $5EA2
    .byte $F8 ; |XXXXX   | $5EA3
    .byte $F8 ; |XXXXX   | $5EA4
    .byte $F8 ; |XXXXX   | $5EA5
    .byte $F8 ; |XXXXX   | $5EA6
    .byte $F8 ; |XXXXX   | $5EA7
    .byte $F8 ; |XXXXX   | $5EA8
    .byte $F8 ; |XXXXX   | $5EA9
    .byte $F8 ; |XXXXX   | $5EAA
    .byte $F8 ; |XXXXX   | $5EAB
    .byte $00 ; |        | $5EAC
    .byte $00 ; |        | $5EAD
L5EAE:
    LDA    #$02            ; 2
    STA    $96             ; 3
    LDX    #$0B            ; 2
L5EB4:
    LDA    L5EBD,X         ; 4
    STA    $80,X           ; 4
    DEX                    ; 2
    BPL    L5EB4           ; 2
    RTS                    ; 6

L5EBD:
    .byte $C9 ; |XX  X  X| $5EBD
    .byte $5E ; | X XXXX | $5EBE
    .byte $D9 ; |XX XX  X| $5EBF
    .byte $5E ; | X XXXX | $5EC0
    .byte $E9 ; |XXX X  X| $5EC1
    .byte $5E ; | X XXXX | $5EC2
    .byte $D1 ; |XX X   X| $5EC3
    .byte $5E ; | X XXXX | $5EC4
    .byte $E1 ; |XXX    X| $5EC5
    .byte $5E ; | X XXXX | $5EC6
    .byte $F1 ; |XXXX   X| $5EC7
    .byte $5E ; | X XXXX | $5EC8
    .byte $00 ; |        | $5EC9
    .byte $00 ; |        | $5ECA
    .byte $00 ; |        | $5ECB
    .byte $00 ; |        | $5ECC
    .byte $00 ; |        | $5ECD
    .byte $00 ; |        | $5ECE
    .byte $00 ; |        | $5ECF
    .byte $00 ; |        | $5ED0
    .byte $36 ; |  XX XX | $5ED1
    .byte $49 ; | X  X  X| $5ED2
    .byte $49 ; | X  X  X| $5ED3
    .byte $49 ; | X  X  X| $5ED4
    .byte $49 ; | X  X  X| $5ED5
    .byte $49 ; | X  X  X| $5ED6
    .byte $49 ; | X  X  X| $5ED7
    .byte $41 ; | X     X| $5ED8
    .byte $5E ; | X XXXX | $5ED9
    .byte $5E ; | X XXXX | $5EDA
    .byte $48 ; | X  X   | $5EDB
    .byte $48 ; | X  X   | $5EDC
    .byte $44 ; | X   X  | $5EDD
    .byte $44 ; | X   X  | $5EDE
    .byte $5E ; | X XXXX | $5EDF
    .byte $5E ; | X XXXX | $5EE0
    .byte $94 ; |X  X X  | $5EE1
    .byte $94 ; |X  X X  | $5EE2
    .byte $F5 ; |XXXX X X| $5EE3
    .byte $F7 ; |XXXX XXX| $5EE4
    .byte $97 ; |X  X XXX| $5EE5
    .byte $94 ; |X  X X  | $5EE6
    .byte $F7 ; |XXXX XXX| $5EE7
    .byte $67 ; | XX  XXX| $5EE8
    .byte $B8 ; |X XXX   | $5EE9
    .byte $BC ; |X XXXX  | $5EEA
    .byte $24 ; |  X  X  | $5EEB
    .byte $24 ; |  X  X  | $5EEC
    .byte $A4 ; |X X  X  | $5EED
    .byte $A4 ; |X X  X  | $5EEE
    .byte $BC ; |X XXXX  | $5EEF
    .byte $38 ; |  XXX   | $5EF0
    .byte $00 ; |        | $5EF1
    .byte $00 ; |        | $5EF2
    .byte $00 ; |        | $5EF3
    .byte $00 ; |        | $5EF4
    .byte $00 ; |        | $5EF5
    .byte $00 ; |        | $5EF6
    .byte $00 ; |        | $5EF7
    .byte $00 ; |        | $5EF8
L5EF9:
    .byte $38 ; |  XXX   | $5EF9
    .byte $38 ; |  XXX   | $5EFA
    .byte $7E ; | XXXXXX | $5EFB
    .byte $7E ; | XXXXXX | $5EFC
    .byte $7E ; | XXXXXX | $5EFD
L5EFE:
    .byte $1C ; |   XXX  | $5EFE
    .byte $54 ; | X X X  | $5EFF
    .byte $3C ; |  XXXX  | $5F00
    .byte $7E ; | XXXXXX | $5F01
    .byte $66 ; | XX  XX | $5F02
    .byte $66 ; | XX  XX | $5F03
    .byte $66 ; | XX  XX | $5F04
    .byte $66 ; | XX  XX | $5F05
    .byte $7E ; | XXXXXX | $5F06
    .byte $3C ; |  XXXX  | $5F07
    .byte $3C ; |  XXXX  | $5F08
    .byte $3C ; |  XXXX  | $5F09
    .byte $18 ; |   XX   | $5F0A
    .byte $18 ; |   XX   | $5F0B
    .byte $18 ; |   XX   | $5F0C
    .byte $18 ; |   XX   | $5F0D
    .byte $38 ; |  XXX   | $5F0E
    .byte $18 ; |   XX   | $5F0F
    .byte $7E ; | XXXXXX | $5F10
    .byte $7E ; | XXXXXX | $5F11
    .byte $60 ; | XX     | $5F12
    .byte $7C ; | XXXXX  | $5F13
    .byte $3E ; |  XXXXX | $5F14
    .byte $06 ; |     XX | $5F15
    .byte $7E ; | XXXXXX | $5F16
    .byte $3C ; |  XXXX  | $5F17
    .byte $3C ; |  XXXX  | $5F18
    .byte $7E ; | XXXXXX | $5F19
    .byte $06 ; |     XX | $5F1A
    .byte $0C ; |    XX  | $5F1B
    .byte $0C ; |    XX  | $5F1C
    .byte $06 ; |     XX | $5F1D
    .byte $7E ; | XXXXXX | $5F1E
    .byte $3C ; |  XXXX  | $5F1F
    .byte $0C ; |    XX  | $5F20
    .byte $0C ; |    XX  | $5F21
    .byte $7E ; | XXXXXX | $5F22
    .byte $7E ; | XXXXXX | $5F23
    .byte $6C ; | XX XX  | $5F24
    .byte $6C ; | XX XX  | $5F25
    .byte $3C ; |  XXXX  | $5F26
    .byte $1C ; |   XXX  | $5F27
    .byte $3C ; |  XXXX  | $5F28
    .byte $7E ; | XXXXXX | $5F29
    .byte $06 ; |     XX | $5F2A
    .byte $7E ; | XXXXXX | $5F2B
    .byte $7C ; | XXXXX  | $5F2C
    .byte $60 ; | XX     | $5F2D
    .byte $7E ; | XXXXXX | $5F2E
    .byte $7E ; | XXXXXX | $5F2F
    .byte $3C ; |  XXXX  | $5F30
    .byte $7E ; | XXXXXX | $5F31
    .byte $66 ; | XX  XX | $5F32
    .byte $7E ; | XXXXXX | $5F33
    .byte $7C ; | XXXXX  | $5F34
    .byte $60 ; | XX     | $5F35
    .byte $7E ; | XXXXXX | $5F36
    .byte $3C ; |  XXXX  | $5F37
    .byte $60 ; | XX     | $5F38
    .byte $30 ; |  XX    | $5F39
    .byte $18 ; |   XX   | $5F3A
    .byte $0C ; |    XX  | $5F3B
    .byte $06 ; |     XX | $5F3C
    .byte $06 ; |     XX | $5F3D
    .byte $7E ; | XXXXXX | $5F3E
    .byte $7E ; | XXXXXX | $5F3F
    .byte $3C ; |  XXXX  | $5F40
    .byte $7E ; | XXXXXX | $5F41
    .byte $66 ; | XX  XX | $5F42
    .byte $3C ; |  XXXX  | $5F43
    .byte $3C ; |  XXXX  | $5F44
    .byte $66 ; | XX  XX | $5F45
    .byte $7E ; | XXXXXX | $5F46
    .byte $3C ; |  XXXX  | $5F47
    .byte $3C ; |  XXXX  | $5F48
    .byte $7E ; | XXXXXX | $5F49
    .byte $06 ; |     XX | $5F4A
    .byte $3E ; |  XXXXX | $5F4B
    .byte $7E ; | XXXXXX | $5F4C
    .byte $66 ; | XX  XX | $5F4D
    .byte $7E ; | XXXXXX | $5F4E
    .byte $3C ; |  XXXX  | $5F4F
    .byte $00 ; |        | $5F50
    .byte $00 ; |        | $5F51
    .byte $00 ; |        | $5F52
    .byte $00 ; |        | $5F53
    .byte $00 ; |        | $5F54
    .byte $00 ; |        | $5F55
L5F56:
    .byte $00 ; |        | $5F56
    .byte $00 ; |        | $5F57
    .byte $A8 ; |X X X   | $5F58
    .byte $A8 ; |X X X   | $5F59
    .byte $A8 ; |X X X   | $5F5A
    .byte $A8 ; |X X X   | $5F5B
    .byte $A8 ; |X X X   | $5F5C
    .byte $A8 ; |X X X   | $5F5D
    .byte $A8 ; |X X X   | $5F5E
    .byte $A8 ; |X X X   | $5F5F
L5F60:
    .byte $C4 ; |XX   X  | $5F60
    .byte $B5 ; |X XX X X| $5F61
    .byte $DF ; |XX XXXXX| $5F62
    .byte $DF ; |XX XXXXX| $5F63
    .byte $D9 ; |XX XX  X| $5F64
    .byte $D9 ; |XX XX  X| $5F65
    .byte $DF ; |XX XXXXX| $5F66
    .byte $FF ; |XXXXXXXX| $5F67
    .byte $E7 ; |XXX  XXX| $5F68
    .byte $E7 ; |XXX  XXX| $5F69
    .byte $FF ; |XXXXXXXX| $5F6A
    .byte $7E ; | XXXXXX | $5F6B
    .byte $3C ; |  XXXX  | $5F6C
    .byte $18 ; |   XX   | $5F6D
L5F6E:
    .byte $26 ; |  X  XX | $5F6E
    .byte $26 ; |  X  XX | $5F6F
    .byte $26 ; |  X  XX | $5F70
    .byte $26 ; |  X  XX | $5F71
    .byte $26 ; |  X  XX | $5F72
    .byte $26 ; |  X  XX | $5F73
    .byte $26 ; |  X  XX | $5F74
    .byte $26 ; |  X  XX | $5F75
    .byte $26 ; |  X  XX | $5F76
    .byte $00 ; |        | $5F77
    .byte $00 ; |        | $5F78
    .byte $00 ; |        | $5F79
    .byte $66 ; | XX  XX | $5F7A
    .byte $66 ; | XX  XX | $5F7B
    .byte $FF ; |XXXXXXXX| $5F7C
    .byte $FF ; |XXXXXXXX| $5F7D
    .byte $FF ; |XXXXXXXX| $5F7E
    .byte $F0 ; |XXXX    | $5F7F
    .byte $70 ; | XXX    | $5F80
    .byte $30 ; |  XX    | $5F81
L5F82:
    .byte $3F ; |  XXXXXX| $5F82
    .byte $3F ; |  XXXXXX| $5F83
    .byte $25 ; |  X  X X| $5F84
    .byte $01 ; |       X| $5F85
L5F86:
    .byte $CF ; |XX  XXXX| $5F86
    .byte $D3 ; |XX X  XX| $5F87
    .byte $AD ; |X X XX X| $5F88
    .byte $8F ; |X   XXXX| $5F89
L5F8A:
    .byte $8C ; |X   XX  | $5F8A
    .byte $4D ; | X  XX X| $5F8B
    .byte $AA ; |X X X X | $5F8C
    .byte $40 ; | X      | $5F8D
L5F8E:
    .byte $64 ; | XX  X  | $5F8E
    .byte $64 ; | XX  X  | $5F8F
    .byte $02 ; |      X | $5F90
    .byte $88 ; |X   X   | $5F91
L5F92:
    LDA    $C0             ; 3
    BEQ    L5FB2           ; 2
    CMP    #$80            ; 2
    BEQ    L5FB2           ; 2
    CMP    #$70            ; 2
    BCC    L5FB2           ; 2
    LDX    $C2             ; 3
    LDA    $9C,X           ; 4
    CMP    #$2C            ; 2
    BNE    L5FB2           ; 2
    INC    $C0             ; 5
    LDX    $BD             ; 3
    LDA    INPT4,X         ; 4
    BMI    L5FB2           ; 2
    LDA    #$68            ; 2
    STA    $C0             ; 3
L5FB2:
    RTS                    ; 6

L5FB3:
    LDX    #$00            ; 2
    LDA    $AA             ; 3
    CMP    #$45            ; 2
    BCS    L5FC6           ; 2
    INX                    ; 2
    CMP    #$29            ; 2
    BCS    L5FC6           ; 2
    INX                    ; 2
    CMP    #$0D            ; 2
    BCS    L5FC6           ; 2
    INX                    ; 2
L5FC6:
    LDA    $98,X           ; 4
    JSR    L5555           ; 6
    LDY    $A9             ; 3
    BEQ    L5FD1           ; 2
    LDY    #$01            ; 2
L5FD1:
    CMP    L5CFD,Y         ; 4
    BCC    L5FF0           ; 2
    CMP    L5FFE,Y         ; 4
    BCS    L5FF0           ; 2
    LDA    $C1             ; 3
    BEQ    L5FF0           ; 2
    LDA    $9C,X           ; 4
    CMP    #$2C            ; 2
    BCS    L5FF0           ; 2
    LDA    #$9A            ; 2
    STA    $9C,X           ; 4
    LDA    #$FF            ; 2
    STA    $BE             ; 3
    JSR    L5941           ; 6
L5FF0:
    RTS                    ; 6

L5FF1:
    .byte $1C ; |   XXX  | $5FF1
    .byte $26 ; |  X  XX | $5FF2
L5FF3:
    .byte $04 ; |     X  | $5FF3
    .byte $66 ; | XX  XX | $5FF4
L5FF5:
    .byte $FE ; |XXXXXXX | $5FF5
    .byte $FC ; |XXXXXX  | $5FF6
    .byte $F8 ; |XXXXX   | $5FF7
    .byte $F0 ; |XXXX    | $5FF8
    .byte $E0 ; |XXX     | $5FF9
    .byte $C0 ; |XX      | $5FFA
    .byte $80 ; |X       | $5FFB
    .byte $00 ; |        | $5FFC
    .byte $50 ; | X X    | $5FFD
L5FFE:
    .byte $4E ; | X  XXX | $5FFE
    .byte $63 ; | XX   XX| $5FFF
