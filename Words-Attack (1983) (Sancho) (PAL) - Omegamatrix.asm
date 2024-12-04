; Disassembly of wordsa.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcword.cfg wordsa.bin
;
; word.cfg contents:
;
;      ORG F000
;      CODE F000 F0C7
;      GFX F0C8 F0D3
;      CODE F0D4 F3B6
;      DATA F3B7 F3D0
;      CODE F3D1 F5AD
;      DATA F5AE F5C3
;      CODE F5C4 F658
;      DATA F659 F65A
;      CODE F65B F698
;      DATA F699 F69A
;      CODE F69B F731
;      GFX F732 F743
;      CODE F744 F813
;      GFX F814 F83A
;      CODE F83B F84C
;      GFX F84D F86F
;      CODE F870 F8CD
;      DATA F8CE F90F
;      CODE F910 F91D
;      DATA F91E F995
;      CODE F996 F9C1
;      DATA F9C2 FBFF
;      GFX FC00 FFFF

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
REFP1   =  $0C
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C

; Read TIA Baseline = $00
CXM0P   =  $00
CXP1FB  =  $03
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

       ORG $F000

START:
LF000:
    JMP    LF3D1           ; 3
LF003:
    LDA    $AD             ; 3
    AND    #$01            ; 2
    TAX                    ; 2
    JSR    LF44F           ; 6
    LDA    #$FF            ; 2
    JSR    LF870           ; 6
    LDX    #4              ; 2
    JSR    LF50A           ; 6
    LDA    #0              ; 2
    STA    WSYNC           ; 3
    STA    COLUBK          ; 3
    LDA    #$3C            ; 2
    STA    COLUP0          ; 3
    LDA    #$AC            ; 2
    STA    COLUPF          ; 3
    LDA    #2              ; 2
    NOP                    ; 2
    STA    $E6             ; 3
    LDY    $F6             ; 3
    LDA    LF3CB,Y         ; 4
    STA    $E5             ; 3
    STA    $E5             ; 3
    LDA    LF3CD,Y         ; 4
    STA    NUSIZ0          ; 3
    LDA    #0              ; 2
    STA    $80             ; 3
    LDY    #$0C            ; 2
    STY    $E7             ; 3
    LDX    #0              ; 2
    ASL    LF000,X         ; 7
    JMP    LF09A           ; 3
LF046:
    STY    $E4             ; 3
LF048:
    LDA    #0              ; 2
    CPX    $D4             ; 3
    BCC    LF057           ; 2³
    LDY    $E5             ; 3
    BMI    LF057           ; 2³
    LDA    #2              ; 2
    DEY                    ; 2
    STY    $E5             ; 3
LF057:
    STA    $80             ; 3
    LDA    #0              ; 2
    CPX    $D5             ; 3
    BCC    LF068           ; 2³
    LDY    $E6             ; 3
    BMI    LF068           ; 2³
    LDA    #2              ; 2
    DEY                    ; 2
    STY    $E6             ; 3
LF068:
    INX                    ; 2
    LDY    $E4             ; 3
    STA    WSYNC           ; 3
    STA    ENABL           ; 3
    LDA    ($E8),Y         ; 5
    STA    GRP1            ; 3
    LDA    $80             ; 3
    STA    ENAM0           ; 3
    DEY                    ; 2
    BPL    LF046           ; 2³
    LDA    #0              ; 2
    CPX    $D4             ; 3
    BCC    LF0D4           ; 2³
    LDY    $E5             ; 3
    BMI    LF0D7           ; 2³
    LDA    #2              ; 2
    DEY                    ; 2
    STY    $E5             ; 3
LF089:
    STA    $80             ; 3
    LDA    #0              ; 2
    CPX    $D5             ; 3
    BCC    LF0DC           ; 2³
    LDY    $E6             ; 3
    BMI    LF0DF           ; 2³
    LDA    #2              ; 2
    DEY                    ; 2
    STY    $E6             ; 3
LF09A:
    LDY    $E7             ; 3
    DEY                    ; 2
    BMI    LF0C5           ; 2³
    STY    $E7             ; 3
    INX                    ; 2
    STA    ENABL           ; 3
    LDA    $80             ; 3
    STA    ENAM0           ; 3
    LDA.wy $D8,Y           ; 4
    TAY                    ; 2
    BMI    LF0E4           ; 2³
LF0AE:
    DEY                    ; 2
    BPL    LF0AE           ; 2³
    STA.w  RESP1           ; 4
    LDY    $E7             ; 3
    LDA.wy $BC,Y           ; 4
    STA    NUSIZ1          ; 3
    STA    HMP1            ; 3
    LDA    LF0C8,Y         ; 4
    STA    COLUP1          ; 3
    JMP    LF0FD           ; 3
LF0C5:
    JMP    LF144           ; 3

LF0C8:
    .byte $47 ; | X   XXX| $F0C8
    .byte $A7 ; |X X  XXX| $F0C9
    .byte $D7 ; |XX X XXX| $F0CA
    .byte $67 ; | XX  XXX| $F0CB
    .byte $37 ; |  XX XXX| $F0CC
    .byte $87 ; |X    XXX| $F0CD
    .byte $E7 ; |XXX  XXX| $F0CE
    .byte $A7 ; |X X  XXX| $F0CF
    .byte $27 ; |  X  XXX| $F0D0
    .byte $C7 ; |XX   XXX| $F0D1
    .byte $47 ; | X   XXX| $F0D2
    .byte $47 ; | X   XXX| $F0D3

LF0D4:
    CPX    $D4             ; 3
    NOP                    ; 2
LF0D7:
    CPX    $D4             ; 3
    JMP    LF089           ; 3
LF0DC:
    CPX    $D4             ; 3
    NOP                    ; 2
LF0DF:
    CPX    $D4             ; 3
    JMP    LF09A           ; 3
LF0E4:
    LDY    $E7             ; 3
    LDA.wy $BC,Y           ; 4
    STA    NUSIZ1          ; 3
    STA    HMP1            ; 3
    LDA    LF0C8,Y         ; 4
    STA    COLUP1          ; 3
    NOP                    ; 2
    NOP                    ; 2
    LDA.wy $D8,Y           ; 4
    TAY                    ; 2
LF0F8:
    INY                    ; 2
    BMI    LF0F8           ; 2³
    STA    RESP1           ; 3
LF0FD:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    INX                    ; 2
    LDY    $E7             ; 3
    LDA.wy $C8,Y           ; 4
    STA    $E8             ; 3
    LDA    #7              ; 2
    STA    $E4             ; 3
    LDA    #0              ; 2
    CPX    $D4             ; 3
    BCC    LF11C           ; 2³
    LDY    $E5             ; 3
    BMI    LF11C           ; 2³
    LDA    #2              ; 2
    DEY                    ; 2
    STY    $E5             ; 3
LF11C:
    STA    $80             ; 3
    LDA    #0              ; 2
    CPX    $D5             ; 3
    BCC    LF12D           ; 2³
    LDY    $E6             ; 3
    BMI    LF12D           ; 2³
    LDA    #2              ; 2
    DEY                    ; 2
    STY    $E6             ; 3
LF12D:
    STA    HMCLR           ; 3
    INX                    ; 2
    STA    WSYNC           ; 3
    STA    ENABL           ; 3
    LDA    $80             ; 3
    STA    ENAM0           ; 3
    JSR    LF996           ; 6
    JSR    LF996           ; 6
    JSR    LF996           ; 6
    JMP    LF048           ; 3
LF144:
    STA    WSYNC           ; 3
    LDA    #$D4            ; 2
    STA    COLUBK          ; 3
    LDA    #0              ; 2
    STA    GRP1            ; 3
    LDX    #5              ; 2
    JSR    LF50A           ; 6
    LDA    #$FE            ; 2
    JSR    LF870           ; 6
    LDA    $AD             ; 3
    AND    #$01            ; 2
    TAX                    ; 2
    INX                    ; 2
    INX                    ; 2
    JSR    LF44F           ; 6
    LDA    #$38            ; 2
    STA    TIM64T          ; 4
    LDX    #$0B            ; 2
    LDA    $D4             ; 3
LF16B:
    CMP    LF3BF,X         ; 4
    BCC    LF173           ; 2³
    DEX                    ; 2
    BNE    LF16B           ; 2³
LF173:
    BIT    CXM0P           ; 3
    BPL    LF18C           ; 2³
    CPX    #$0B            ; 2
    BEQ    LF18C           ; 2³
    LDA    $F6             ; 3
    BNE    LF183           ; 2³
    CPX    #0              ; 2
    BNE    LF18C           ; 2³
LF183:
    LDA    #$FF            ; 2
    STA    $D4             ; 3
    LDY    #0              ; 2
    JSR    LF5F5           ; 6
LF18C:
    LDX    #$0B            ; 2
    LDA    $D5             ; 3
LF190:
    CMP    LF3BF,X         ; 4
    BCC    LF19A           ; 2³
    DEX                    ; 2
    BNE    LF190           ; 2³
    BEQ    LF1A7           ; 2³
LF19A:
    BIT    CXP1FB          ; 3
    BVC    LF1A7           ; 2³
    LDA    #$FF            ; 2
    STA    $D5             ; 3
    LDY    #1              ; 2
    JSR    LF5F5           ; 6
LF1A7:
    LDA    $EA             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    $A7             ; 3
    LDA    $EB             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    $AA             ; 3
    LDA    $AD             ; 3
    AND    #$03            ; 2
    STA    $80             ; 3
    LDX    #$0A            ; 2
LF1BF:
    TXA                    ; 2
    AND    #$03            ; 2
    CMP    $80             ; 3
    BNE    LF1CB           ; 2³
    LSR                    ; 2
    TAY                    ; 2
    JSR    LF76D           ; 6
LF1CB:
    DEX                    ; 2
    BNE    LF1BF           ; 2³
    LDX    #1              ; 2
LF1D0:
    LDA    $ED,X           ; 4
    STA    $80             ; 3
    AND    #$1F            ; 2
    BEQ    LF21F           ; 2³+1
    BIT    $80             ; 3
    BMI    LF1FA           ; 2³
    BVS    LF200           ; 2³+1
    LDY    #0              ; 2
    LDA    #$0C            ; 2
LF1E2:
    STA    AUDC0,X         ; 4
    LDA    #5              ; 2
    STA    AUDF0,X         ; 4
    LDA    $80             ; 3
    SEC                    ; 2
    SBC    #1              ; 2
    STA    $ED,X           ; 4
    AND    #$0F            ; 2
    STA    AUDV0,X         ; 4
    BNE    LF21C           ; 2³+1
    STY    $ED,X           ; 4
    JMP    LF21C           ; 3
LF1FA:
    LDA    #8              ; 2
    LDY    #$5F            ; 2
    BNE    LF1E2           ; 2³
LF200:
    LDA    #1              ; 2
    STA    AUDC0,X         ; 4
    LDA    $AD             ; 3
    AND    #$01            ; 2
    BNE    LF21C           ; 2³
    LDA    $80             ; 3
    SEC                    ; 2
    SBC    #1              ; 2
    STA    $ED,X           ; 4
    AND    #$1F            ; 2
    EOR    #$1F            ; 2
    STA    AUDF0,X         ; 4
    EOR    #$1F            ; 2
    LSR                    ; 2
    STA    AUDV0,X         ; 4
LF21C:
    JMP    LF235           ; 3
LF21F:
    LDA    $D4,X           ; 4
    CMP    #$FF            ; 2
    BNE    LF229           ; 2³
    LDA    #0              ; 2
    BEQ    LF233           ; 2³
LF229:
    LSR                    ; 2
    LSR                    ; 2
    STA    AUDF0,X         ; 4
    LDA    #4              ; 2
    STA    AUDC0,X         ; 4
    LDA    #$0F            ; 2
LF233:
    STA    AUDV0,X         ; 4
LF235:
    DEX                    ; 2
    BPL    LF1D0           ; 2³+1
    LDA    $ED             ; 3
    AND    #$1F            ; 2
    BNE    LF2A1           ; 2³
    LDA    $EE             ; 3
    AND    #$1F            ; 2
    BNE    LF2A1           ; 2³
    LDA    $F6             ; 3
    BEQ    LF24C           ; 2³
    LDA    $EA             ; 3
    BEQ    LF250           ; 2³
LF24C:
    LDA    $EB             ; 3
    BNE    LF2A1           ; 2³
LF250:
    LDX    #1              ; 2
LF252:
    LDA    $EF,X           ; 4
    BNE    LF276           ; 2³
    LDY    $F3,X           ; 4
    DEY                    ; 2
    BPL    LF265           ; 2³
    CPX    #0              ; 2
    BNE    LF262           ; 2³
    JSR    LF890           ; 6
LF262:
    LDY    LF992,X         ; 4
LF265:
    STY    $F3,X           ; 4
    JSR    LF910           ; 6
    AND    #$0F            ; 2
    TAY                    ; 2
    LDA    LF91E,Y         ; 4
    STA    $EF,X           ; 4
    LDA    #$0F            ; 2
    STA    $F1,X           ; 4
LF276:
    DEC    $EF,X           ; 6
    LDA    #$0C            ; 2
    STA    AUDC0,X         ; 4
    LDY    $F3,X           ; 4
    JSR    LF910           ; 6
    AND    #$F0            ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDA    LF92E,Y         ; 4
    STA    AUDF0,X         ; 4
    LDY    $F1,X           ; 4
    LDA    $AD             ; 3
    AND    #$01            ; 2
    BNE    LF29C           ; 2³
    LDY    $F1,X           ; 4
    BEQ    LF29A           ; 2³
    DEY                    ; 2
LF29A:
    STY    $F1,X           ; 4
LF29C:
    STY    AUDV0,X         ; 4
    DEX                    ; 2
    BPL    LF252           ; 2³
LF2A1:
    JMP    LF2C0           ; 3
    LDX    #1              ; 2
LF2A6:
    LDY    LF994,X         ; 4
    LDA.wy $A8,Y           ; 4
    CMP    #1              ; 2
    BNE    LF2BD           ; 2³
    LDA    #0              ; 2
    STA.wy $A8,Y           ; 5
    LDA    $EA,X           ; 4
    CMP    #8              ; 2
    BEQ    LF2BD           ; 2³
    INC    $EA,X           ; 6
LF2BD:
    DEX                    ; 2
    BPL    LF2A6           ; 2³
LF2C0:
    LDA    INTIM           ; 4
    BNE    LF2C0           ; 2³
    LDY    #$82            ; 2
    STY    WSYNC           ; 3
    STY    VBLANK          ; 3
    STY    VSYNC           ; 3
    STY    WSYNC           ; 3
    STY    WSYNC           ; 3
    STY    WSYNC           ; 3
    STA    VSYNC           ; 3
    LDA    #$25            ; 2
    STA    TIM64T          ; 4
    INC    $AD             ; 5
    LDA    SWCHB           ; 4
    AND    #$01            ; 2
    BNE    LF306           ; 2³+1
    JSR    LF879           ; 6
    JSR    LF8B0           ; 6
    LDA    #8              ; 2
    STA    $EB             ; 3
    LDY    $F6             ; 3
    BNE    LF2F3           ; 2³
    LDA    #0              ; 2
LF2F3:
    STA    $EA             ; 3
    CLC                    ; 2
    LDA    SWCHB           ; 4
    AND    #$80            ; 2
    ROL                    ; 2
    ROL                    ; 2
    STA    $F6             ; 3
    LDA    #$7F            ; 2
    STA    $F7             ; 3
    JMP    LF40C           ; 3
LF306:
    NOP                    ; 2
    LDA    SWCHA           ; 4
    STA    $81             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    $80             ; 3
    LDA    $F6             ; 3
    BNE    LF31A           ; 2³
    LDA    $F7             ; 3
    STA    $80             ; 3
LF31A:
    LDX    #1              ; 2
LF31C:
    LDA    $D4,X           ; 4
    CMP    #$FF            ; 2
    BNE    LF34F           ; 2³
    LDA    $F6             ; 3
    BEQ    LF32A           ; 2³
    LDA    $EA             ; 3
    BEQ    LF3A1           ; 2³
LF32A:
    LDA    $EB             ; 3
    BEQ    LF3A1           ; 2³
    CPX    #0              ; 2
    BNE    LF33F           ; 2³
    LDA    $F6             ; 3
    BNE    LF33F           ; 2³
    LDA    $BB             ; 3
    CLC                    ; 2
    ADC    #3              ; 2
    STA    $D6             ; 3
    BNE    LF34A           ; 2³
LF33F:
    TXA                    ; 2
    EOR    #$01            ; 2
    TAY                    ; 2
    LDA.wy INPT4,Y         ; 4
    AND    #$80            ; 2
    BNE    LF36E           ; 2³
LF34A:
    LDA    LF3B7,X         ; 4
    BNE    LF36C           ; 2³
LF34F:
    LDA    $AD             ; 3
    CPX    #0              ; 2
    BNE    LF359           ; 2³
    LDY    $F6             ; 3
    BEQ    LF35D           ; 2³
LF359:
    AND    #$01            ; 2
    BNE    LF3A1           ; 2³
LF35D:
    LDA    $D4,X           ; 4
    CMP    LF3B9,X         ; 4
    BNE    LF368           ; 2³
    LDA    #$FF            ; 2
    BNE    LF36C           ; 2³
LF368:
    CLC                    ; 2
    ADC    LF3BB,X         ; 4
LF36C:
    STA    $D4,X           ; 4
LF36E:
    LDA    $F6             ; 3
    BEQ    LF376           ; 2³
    LDA    $EA             ; 3
    BEQ    LF3A1           ; 2³
LF376:
    LDA    $EB             ; 3
    BEQ    LF3A1           ; 2³
    LDA    LF3BD,X         ; 4
    TAY                    ; 2
    LDA    $80,X           ; 4
    AND    #$80            ; 2
    BNE    LF38F           ; 2³
    LDA.wy $B0,Y           ; 4
    CMP    #$8E            ; 2
    BCS    LF3AB           ; 2³
    ADC    #1              ; 2
    BNE    LF39E           ; 2³
LF38F:
    LDA    $80,X           ; 4
    AND    #$40            ; 2
    BNE    LF3A1           ; 2³
    LDA.wy $B0,Y           ; 4
    CMP    #1              ; 2
    BCC    LF3B1           ; 2³
    SBC    #1              ; 2
LF39E:
    STA.wy $B0,Y           ; 5
LF3A1:
    DEX                    ; 2
    BMI    LF3A7           ; 2³
    JMP    LF31C           ; 3
LF3A7:
    NOP                    ; 2
    JMP    LF3E2           ; 3
LF3AB:
    LDA    #$BF            ; 2
    STA    $F7,X           ; 4
    BNE    LF3A1           ; 2³
LF3B1:
    LDA    #$7F            ; 2
    STA    $F7,X           ; 4
    BNE    LF3A1           ; 2³

LF3B7:
    .byte $07,$A3
LF3B9:
    .byte $A3,$03
LF3BB:
    .byte $01,$FF
LF3BD:
    .byte $0B,$00
LF3BF:
    .byte $A7,$99,$8B,$7D,$6F,$61,$53,$45,$37,$29,$1B,$0D
LF3CB:
    .byte $02,$02
LF3CD:
    .byte $13,$10
LF3CF:
    .byte $03,$05

LF3D1:
    SEI                    ; 2
    CLD                    ; 2
    LDA    #0              ; 2
    TAX                    ; 2
LF3D6:
    STA    0,X             ; 4
    TXS                    ; 2
    INX                    ; 2
    BNE    LF3D6           ; 2³
    JSR    CopyrightPtrs   ; 6
    JSR    LF879           ; 6
LF3E2:
    LDA    #$11            ; 2
    STA    CTRLPF          ; 3
    LDX    #2              ; 2
    LDY    $F6             ; 3
    BNE    LF3F1           ; 2³
    LDA    $D6             ; 3
    JMP    LF3F6           ; 3
LF3F1:
    LDA    $BB             ; 3
    CLC                    ; 2
    ADC    #$0A            ; 2
LF3F6:
    JSR    LF744           ; 6
    JSR    LF763           ; 6
    LDX    #4              ; 2
    LDA    $B0             ; 3
    CLC                    ; 2
    ADC    #$0A            ; 2
    JSR    LF744           ; 6
    JSR    LF763           ; 6
    JSR    LF5C4           ; 6
LF40C:
    LDA    INTIM           ; 4
    BNE    LF40C           ; 2³
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    REFP1           ; 3
    LDX    #7              ; 2
LF419:
    DEX                    ; 2
    BPL    LF419           ; 2³
    STA    HMCLR           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    VBLANK          ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    CXCLR           ; 3
    JMP    LF003           ; 3
LF42F:
    LDA    #7              ; 2
    STA    $80             ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    LDA    #0              ; 2
    STA    GRP0            ; 3
    LDA    #3              ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDX    $82             ; 3
    LDA    LF5BA,X         ; 4
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    RTS                    ; 6

LF44F:
    STA    WSYNC           ; 3
    STX    $82             ; 3
    LDA    LF5AE,X         ; 4
    STA    $AE             ; 3
    LDX    #$0C            ; 2
    LDY    #5              ; 2
LF45C:
    LDA    ($AE),Y         ; 5
    STA    $81,X           ; 4
    DEY                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    BNE    LF45C           ; 2³
    LDX    $82             ; 3
    LDA    LF5B4,X         ; 4
    STA    WSYNC           ; 3
    STA    COLUBK          ; 3
    LDA    #0              ; 2
    STA    COLUPF          ; 3
    LDA    #$0F            ; 2
    STA    PF1             ; 3
    LDA    #$FF            ; 2
    STA    PF2             ; 3
    STA    WSYNC           ; 3
    LDA    LF5B4,X         ; 4
    STA    COLUBK          ; 3
    LDA    #$10            ; 2
    STA    HMP0            ; 3
    LDA    #$20            ; 2
    STA    HMP1            ; 3
    STA    HMP1            ; 3
    LDA    $82             ; 3
    LSR                    ; 2
    BCC    LF495           ; 2³
    LDA    $82             ; 3
    JSR    LF761           ; 6
LF495:
    STA.w  RESP0           ; 4
    STA    RESP1           ; 3
    JSR    LF42F           ; 6
    TXA                    ; 2
    LSR                    ; 2
    BCC    LF4CC           ; 2³
LF4A1:
    LDY    $80             ; 3
    STA    WSYNC           ; 3
    LDA    ($8D),Y         ; 5
    STA    $81             ; 3
    LDA    ($8B),Y         ; 5
    TAX                    ; 2
    LDA    ($83),Y         ; 5
    NOP                    ; 2
    STA    GRP0            ; 3
    LDA    ($85),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($87),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($89),Y         ; 5
    LDY    $81             ; 3
    STA    GRP1            ; 3
    STX    GRP0            ; 3
    STY    GRP1            ; 3
    STA    GRP0            ; 3
    DEC    $80             ; 5
    BPL    LF4A1           ; 2³
    JMP    LF4F7           ; 3
LF4CC:
    LDY    $80             ; 3
    LDA    ($8D),Y         ; 5
    STA.w  $81             ; 4
    LDA    ($8B),Y         ; 5
    TAX                    ; 2
    STA    WSYNC           ; 3
    LDA    ($83),Y         ; 5
    STA.w  GRP0            ; 4
    LDA    ($85),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($87),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($89),Y         ; 5
    LDY    $81             ; 3
    STA    GRP1            ; 3
    STX    GRP0            ; 3
    STY    GRP1            ; 3
    STA    GRP0            ; 3
    DEC    $80             ; 5
    BPL    LF4CC           ; 2³
    STA    WSYNC           ; 3
LF4F7:
    LDA    #0              ; 2
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    RTS                    ; 6

LF50A:
    STA    WSYNC           ; 3
    LDA    #5              ; 2
    STA    TIM64T          ; 4
    STX    $82             ; 3
    LDA    LF5AE,X         ; 4
    STA    $AE             ; 3
    LDY    #2              ; 2
LF51A:
    TYA                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    TAX                    ; 2
    LDA    ($AE),Y         ; 5
    AND    #$F0            ; 2
    LSR                    ; 2
    STA    $83,X           ; 4
    LDA    ($AE),Y         ; 5
    AND    #$0F            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    $85,X           ; 4
    DEY                    ; 2
    BPL    LF51A           ; 2³
    INY                    ; 2
LF532:
    LDA.wy $83,Y           ; 4
    CMP    #0              ; 2
    BNE    LF544           ; 2³
    LDA    #$7D            ; 2
    STA.wy $83,Y           ; 5
    INY                    ; 2
    INY                    ; 2
    CPY    #$0B            ; 2
    BCC    LF532           ; 2³
LF544:
    LDA    #$7D            ; 2
    STA    $85             ; 3
    LDX    $82             ; 3
LF54A:
    LDA    INTIM           ; 4
    BNE    LF54A           ; 2³
    TXA                    ; 2
    SEC                    ; 2
    SBC    #4              ; 2
    TAY                    ; 2
    LDA.wy $ED,Y           ; 4
    STA    $80             ; 3
    ROL                    ; 2
    ROL                    ; 2
    ROL                    ; 2
    AND    #$01            ; 2
    TAY                    ; 2
    LDA    $80             ; 3
    AND    LF5C2,Y         ; 4
    TAY                    ; 2
    LDA    LF5C0,Y         ; 4
    STA    WSYNC           ; 3
    ORA    LF5B4,X         ; 4
    STA    COLUBK          ; 3
    LDA    #$10            ; 2
    STA    HMP0            ; 3
    LDA    #$20            ; 2
    STA    HMP1            ; 3
    JSR    LF75E           ; 6
    STA    RESP0           ; 3
    STA    RESP1           ; 3
    JSR    LF42F           ; 6
LF581:
    LDY    $80             ; 3
    LDA    ($8D),Y         ; 5
    STA    $81             ; 3
    STA    WSYNC           ; 3
    LDA    ($8B),Y         ; 5
    TAX                    ; 2
    NOP                    ; 2
    LDA    ($83),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($85),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($87),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($89),Y         ; 5
    LDY    $81             ; 3
    STA    GRP1            ; 3
    STX    GRP0            ; 3
    STY    GRP1            ; 3
    STA    GRP0            ; 3
    DEC    $80             ; 5
    BPL    LF581           ; 2³
    STA    WSYNC           ; 3
    JMP    LF4F7           ; 3

LF5AE:
    .byte $8F,$95,$9B,$A1,$A7,$AA
LF5B4:
    .byte $C4,$C4,$A4,$A4,$24,$54
LF5BA:
    .byte $CC,$CC,$AC,$AC,$2C,$5C
LF5C0:
    .byte $00,$0F
LF5C2:
    .byte $00,$01

LF5C4:
    LDY    $F6             ; 3
    LDA    LF3CF,Y         ; 4
    STA    $C7             ; 3
    LDX    #$0B            ; 2
LF5CD:
    LDA    $BC,X           ; 4
    AND    #$07            ; 2
    STA    $81             ; 3
    LDA    $B0,X           ; 4
    CMP    #$99            ; 2
    BCC    LF5DB           ; 2³
    LDA    #0              ; 2
LF5DB:
    JSR    LF744           ; 6
    ORA    $81             ; 3
    STA    $BC,X           ; 4
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    TYA                    ; 2
    CMP    #6              ; 2
    BCC    LF5EF           ; 2³
    SEC                    ; 2
    SBC    #6              ; 2
    EOR    #$FF            ; 2
LF5EF:
    STA    $D8,X           ; 4
    DEX                    ; 2
    BPL    LF5CD           ; 2³
    RTS                    ; 6

LF5F5:
    STX    $81             ; 3
    STY    $82             ; 3
    LDA    $C8,X           ; 4
    CMP    #$E8            ; 2
    BCC    LF61A           ; 2³+1
    LDA    #$50            ; 2
    STA    $DA             ; 3
    CPX    #0              ; 2
    BNE    LF60B           ; 2³
    LDA    $F6             ; 3
    BEQ    LF60E           ; 2³
LF60B:
    JSR    LF69B           ; 6
LF60E:
    TYA                    ; 2
    EOR    #$01            ; 2
    TAY                    ; 2
    LDA    #$5F            ; 2
    STA.wy $ED,Y           ; 5
    JMP    LF627           ; 3
LF61A:
    CMP    #$D0            ; 2
    BCC    LF62E           ; 2³
    LDA    #$8F            ; 2
    STA.wy $ED,Y           ; 5
    LDA    #1              ; 2
    STA    $DA             ; 3
LF627:
    JSR    LF675           ; 6
    JSR    LF643           ; 6
    RTS                    ; 6

LF62E:
    LDA    #$0F            ; 2
    STA.wy $ED,Y           ; 5
    LDA    #1              ; 2
    STA    $DA             ; 3
    JSR    LF69B           ; 6
    JSR    LF65B           ; 6
    LDX    $81             ; 3
    JSR    LF6AE           ; 6
    RTS                    ; 6

LF643:
    LDA    LF659,Y         ; 4
    STA    $AE             ; 3
    LDY    #$0A            ; 2
LF64A:
    LDA    ($AE),Y         ; 5
    INY                    ; 2
    STA    ($AE),Y         ; 6
    DEY                    ; 2
    DEY                    ; 2
    BPL    LF64A           ; 2³
    LDA    #$F8            ; 2
    INY                    ; 2
    STA    ($AE),Y         ; 6
    RTS                    ; 6

LF659:
    .byte $8F,$9B
LF65B:
    LDA    LF659,Y         ; 4
    STA    $AE             ; 3
    LDY    #1              ; 2
LF662:
    LDA    ($AE),Y         ; 5
    DEY                    ; 2
    STA    ($AE),Y         ; 6
    INY                    ; 2
    INY                    ; 2
    CPY    #$0C            ; 2
    BNE    LF662           ; 2³
    DEY                    ; 2
    LDX    $81             ; 3
    LDA    $C8,X           ; 4
    STA    ($AE),Y         ; 6
    RTS                    ; 6

LF675:
    SED                    ; 2
    SEC                    ; 2
    LDX    LF699,Y         ; 4
    LDA    $A9,X           ; 4
    SBC    $DA             ; 3
    STA    $A9,X           ; 4
    LDA    $A8,X           ; 4
    SBC    #0              ; 2
    BCS    LF68A           ; 2³
    LDA    #0              ; 2
    STA    $A9,X           ; 4
LF68A:
    STA    $A8,X           ; 4
    CLD                    ; 2
    LDA.wy $EA,Y           ; 4
    BEQ    LF698           ; 2³
    SEC                    ; 2
    SBC    #1              ; 2
    STA.wy $EA,Y           ; 5
LF698:
    RTS                    ; 6

LF699:
    .byte $00,$03

LF69B:
    SED                    ; 2
    CLC                    ; 2
    LDX    LF699,Y         ; 4
    LDA    $A9,X           ; 4
    ADC    $DA             ; 3
    STA    $A9,X           ; 4
    LDA    $A8,X           ; 4
    ADC    #0              ; 2
    STA    $A8,X           ; 4
    CLD                    ; 2
    RTS                    ; 6

LF6AE:
    LDY    $82             ; 3
    LDA    LF3BD,Y         ; 4
    TAY                    ; 2
    LDA.wy $B0,Y           ; 4
    CLC                    ; 2
    ADC    #$0B            ; 2
    STA    $82             ; 3
    LDA    $B0,X           ; 4
    STA    $D8             ; 3
    CLC                    ; 2
    ADC    #$20            ; 2
    STA    $D9             ; 3
    CLC                    ; 2
    ADC    #$20            ; 2
    STA    $DA             ; 3
    LDX    #2              ; 2
LF6CC:
    LDA    $D8,X           ; 4
    CMP    #$A0            ; 2
    BCC    LF6D5           ; 2³
    CLC                    ; 2
    SBC    #$A0            ; 2
LF6D5:
    STA    $D8,X           ; 4
    DEX                    ; 2
    BPL    LF6CC           ; 2³
    LDX    #2              ; 2
LF6DC:
    LDA    $D8,X           ; 4
    CMP    #$98            ; 2
    BCS    LF6ED           ; 2³
    CMP    $82             ; 3
    BCS    LF6ED           ; 2³
    CLC                    ; 2
    ADC    #9              ; 2
    CMP    $82             ; 3
    BCS    LF6F0           ; 2³
LF6ED:
    DEX                    ; 2
    BNE    LF6DC           ; 2³
LF6F0:
    STX    $DB             ; 3
    LDX    $81             ; 3
    LDA    $BC,X           ; 4
    AND    #$07            ; 2
    BEQ    LF72D           ; 2³+1
    LDX    $DB             ; 3
    CMP    #6              ; 2
    BNE    LF709           ; 2³
    LDY    LF732,X         ; 4
    LDA    LF735,X         ; 4
    JMP    LF71C           ; 3
LF709:
    CMP    #4              ; 2
    BNE    LF716           ; 2³
    LDY    LF738,X         ; 4
    LDA    LF73B,X         ; 4
    JMP    LF71C           ; 3
LF716:
    LDY    LF73E,X         ; 4
    LDA    LF741,X         ; 4
LF71C:
    LDX    $81             ; 3
    STY    $BC,X           ; 4
    CLC                    ; 2
    ADC    $B0,X           ; 4
    CMP    #$A0            ; 2
    BCC    LF72A           ; 2³
    SEC                    ; 2
    SBC    #$A0            ; 2
LF72A:
    STA    $B0,X           ; 4
    RTS                    ; 6

LF72D:
    LDA    #$F8            ; 2
    STA    $C8,X           ; 4
    RTS                    ; 6

LF732:
    .byte $02 ; |      X | $F732
    .byte $04 ; |     X  | $F733
    .byte $02 ; |      X | $F734
LF735:
    .byte $20 ; |  X     | $F735
    .byte $00 ; |        | $F736
    .byte $00 ; |        | $F737
LF738:
    .byte $00 ; |        | $F738
    .byte $04 ; |     X  | $F739
    .byte $00 ; |        | $F73A
LF73B:
    .byte $40 ; | X      | $F73B
    .byte $00 ; |        | $F73C
    .byte $00 ; |        | $F73D
LF73E:
    .byte $00 ; |        | $F73E
    .byte $00 ; |        | $F73F
    .byte $00 ; |        | $F740
LF741:
    .byte $20 ; |  X     | $F741
    .byte $00 ; |        | $F742
    .byte $00 ; |        | $F743

LF744:
    CLC                    ; 2
    ADC    #$2E            ; 2
    TAY                    ; 2
    AND    #$0F            ; 2
    STA    $80             ; 3
    TYA                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    CLC                    ; 2
    ADC    $80             ; 3
    CMP    #$0F            ; 2
    BCC    LF75C           ; 2³
    SBC    #$0F            ; 2
    INY                    ; 2
LF75C:
    EOR    #$07            ; 2
LF75E:
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
LF761:
    ASL                    ; 2
    RTS                    ; 6

LF763:
    STA    HMP0,X          ; 4
    STA    WSYNC           ; 3
LF767:
    DEY                    ; 2
    BPL    LF767           ; 2³
    STA    RESP0,X         ; 4
    RTS                    ; 6

LF76D:
    STY    $81             ; 3
    LDA    $B0,X           ; 4
    CLC                    ; 2
    ADC    LF814,Y         ; 4
    STA    $B0,X           ; 4
    CMP    #$99            ; 2
    BCC    LF782           ; 2³
    LDA    #$F8            ; 2
    STA    $C8,X           ; 4
    JMP    LF7F6           ; 3
LF782:
    CMP    LF816,Y         ; 4
    BNE    LF791           ; 2³
    JSR    LF83B           ; 6
    STA    $C8,X           ; 4
    LDA    #0              ; 2
    JMP    LF7F4           ; 3
LF791:
    CMP    LF818,Y         ; 4
    BNE    LF7B2           ; 2³
    CPY    #0              ; 2
    BNE    LF7AD           ; 2³
    LDA    $BC,X           ; 4
    AND    #$07            ; 2
    TAY                    ; 2
    CPY    #4              ; 2
    BCS    LF7F6           ; 2³
    LDA    #0              ; 2
    STA    $B0,X           ; 4
    LDA    LF834,Y         ; 4
    JMP    LF7F4           ; 3
LF7AD:
    LDA    #2              ; 2
    JMP    LF7F4           ; 3
LF7B2:
    CMP    LF81A,Y         ; 4
    BNE    LF7D5           ; 2³
    CPY    #0              ; 2
    BNE    LF7CA           ; 2³
    LDA    $BC,X           ; 4
    AND    #$07            ; 2
    BNE    LF7F6           ; 2³
    LDA    #0              ; 2
    STA    $B0,X           ; 4
    LDA    #4              ; 2
    JMP    LF7F4           ; 3
LF7CA:
    LDA    $BC,X           ; 4
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LF81C,Y         ; 4
    JMP    LF7F4           ; 3
LF7D5:
    CPY    #0              ; 2
    BEQ    LF7F7           ; 2³
    CMP    #0              ; 2
    BNE    LF7F6           ; 2³
    LDA    $BC,X           ; 4
    AND    #$07            ; 2
    TAY                    ; 2
    BNE    LF7E9           ; 2³
    LDA    #$A0            ; 2
    STA    $B0,X           ; 4
    RTS                    ; 6

LF7E9:
    LDA    $B0,X           ; 4
    CLC                    ; 2
    ADC    LF826,Y         ; 4
    STA    $B0,X           ; 4
    LDA    LF81F,Y         ; 4
LF7F4:
    STA    $BC,X           ; 4
LF7F6:
    RTS                    ; 6

LF7F7:
    LDA    $BC,X           ; 4
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LF82D,Y         ; 4
    CMP    $B0,X           ; 4
    BNE    LF7F6           ; 2³+1
    CPY    #0              ; 2
    BNE    LF80E           ; 2³
    LDA    #$F8            ; 2
    STA    $B0,X           ; 4
    STA    $C8,X           ; 4
    RTS                    ; 6

LF80E:
    LDA    LF81F,Y         ; 4
    STA    $BC,X           ; 4
    RTS                    ; 6

LF814:
    .byte $01 ; |       X| $F814
    .byte $FF ; |XXXXXXXX| $F815
LF816:
    .byte $00 ; |        | $F816
    .byte $98 ; |X  XX   | $F817
LF818:
    .byte $20 ; |  X     | $F818
    .byte $78 ; | XXXX   | $F819
LF81A:
    .byte $40 ; | X      | $F81A
    .byte $58 ; | X XX   | $F81B
LF81C:
    .byte $04 ; |     X  | $F81C
    .byte $04 ; |     X  | $F81D
    .byte $06 ; |     XX | $F81E
LF81F:
    .byte $00 ; |        | $F81F
    .byte $00 ; |        | $F820
    .byte $00 ; |        | $F821
    .byte $00 ; |        | $F822
    .byte $00 ; |        | $F823
    .byte $00 ; |        | $F824
    .byte $02 ; |      X | $F825
LF826:
    .byte $00 ; |        | $F826
    .byte $00 ; |        | $F827
    .byte $20 ; |  X     | $F828
    .byte $00 ; |        | $F829
    .byte $40 ; | X      | $F82A
    .byte $00 ; |        | $F82B
    .byte $20 ; |  X     | $F82C
LF82D:
    .byte $98 ; |X  XX   | $F82D
    .byte $98 ; |X  XX   | $F82E
    .byte $78 ; | XXXX   | $F82F
    .byte $98 ; |X  XX   | $F830
    .byte $58 ; | X XX   | $F831
    .byte $98 ; |X  XX   | $F832
    .byte $58 ; | X XX   | $F833
LF834:
    .byte $02 ; |      X | $F834
    .byte $02 ; |      X | $F835
    .byte $06 ; |     XX | $F836
    .byte $02 ; |      X | $F837
    .byte $04 ; |     X  | $F838
    .byte $02 ; |      X | $F839
    .byte $06 ; |     XX | $F83A

LF83B:
    LDY    $EC             ; 3
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    BPL    LF847           ; 2³
    TYA                    ; 2
    CLC                    ; 2
    ADC    #$23            ; 2
    TAY                    ; 2
LF847:
    STY    $EC             ; 3
    LDA    LF84D,Y         ; 4
    RTS                    ; 6

LF84D:
    .byte $00 ; |        | $F84D  Letter_A, Zero   ??
    .byte $C8 ; |XX  X   | $F84E  Letter_Z         ??
    .byte $D0 ; |XX X    | $F84F  Heart            ??
    .byte $78 ; | XXXX   | $F850  Logo_F           ??
    .byte $90 ; |X  X    | $F851  Letter_S         ??
    .byte $28 ; |  X X   | $F852  Letter_F, Five   ??
    .byte $18 ; |   XX   | $F853  Letter_D, Three  ??
    .byte $D8 ; |XX XX   | $F854  Bird             ??
    .byte $48 ; | X  X   | $F855  Letter_J, Nine   ??
    .byte $88 ; |X   X   | $F856  Letter_R         ??
    .byte $08 ; |    X   | $F857  Letter_B, One    ??
    .byte $E0 ; |XXX     | $F858  Tornado          ??
    .byte $B8 ; |X XXX   | $F859  Letter_X         ??
    .byte $E0 ; |XXX     | $F85A  Tornado          ??
    .byte $10 ; |   X    | $F85B  Letter_C, Two    ??
    .byte $40 ; | X      | $F85C  Letter_I, Eight  ??
    .byte $B0 ; |X XX    | $F85D  Letter_W         ??
    .byte $D8 ; |XX XX   | $F85E  Bird             ??
    .byte $20 ; |  X     | $F85F  Letter_E, Four   ??
    .byte $80 ; |X       | $F860  Letter_Q         ??
    .byte $D8 ; |XX XX   | $F861  Bird             ??
    .byte $30 ; |  XX    | $F862  Letter_G, Six    ??
    .byte $38 ; |  XXX   | $F863  Letter_H, Seven  ??
    .byte $A0 ; |X X     | $F864  Letter_U         ??
    .byte $50 ; | X X    | $F865  Logo_A           ??
    .byte $D0 ; |XX X    | $F866  Heart            ??
    .byte $A8 ; |X X X   | $F867  Letter_V         ??
    .byte $58 ; | X XX   | $F868  Logo_B           ??
    .byte $60 ; | XX     | $F869  Logo_C           ??
    .byte $D0 ; |XX X    | $F86A  Heart            ??
    .byte $70 ; | XXX    | $F86B  Logo_E           ??
    .byte $68 ; | XX X   | $F86C  Logo_D           ??
    .byte $98 ; |X  XX   | $F86D  Letter_T         ??
    .byte $C0 ; |XX      | $F86E  Letter_Y         ??
    .byte $D0 ; |XX X    | $F86F  Heart            ??

LF870:
    LDX    #$0C            ; 2
LF872:
    STA    $82,X           ; 4
    DEX                    ; 2
    DEX                    ; 2
    BNE    LF872           ; 2³
    RTS                    ; 6

LF879:
    JSR    LF89B           ; 6
    JSR    LF890           ; 6
    LDA    #$FE            ; 2
    STA    $E9             ; 3
    LDA    #$50            ; 2
    STA    $B0             ; 3
    STA    $BB             ; 3
    LDA    #$FF            ; 2
    STA    $D4             ; 3
    STA    $D5             ; 3
    RTS                    ; 6

LF890:
    LDY    #7              ; 2
    LDA    #0              ; 2
LF894:
    STA.wy $ED,Y           ; 5
    DEY                    ; 2
    BPL    LF894           ; 2³
    RTS                    ; 6

LF89B:
    LDX    #$0B            ; 2
LF89D:
    LDA    LF8CE,X         ; 4
    STA    $B0,X           ; 4
    LDA    LF8DA,X         ; 4
    STA    $BC,X           ; 4
    LDA    StartScreenPat,X ; 4
    STA    $C8,X           ; 4
    DEX                    ; 2
    BPL    LF89D           ; 2³
    RTS                    ; 6

LF8B0:
    LDX    #$17            ; 2
    LDA    #$F8            ; 2
LF8B4:
    STA    $8F,X           ; 4
    DEX                    ; 2
    BPL    LF8B4           ; 2³
    LDX    #5              ; 2
    LDA    #0              ; 2
LF8BD:
    STA    $A7,X           ; 4
    DEX                    ; 2
    BPL    LF8BD           ; 2³
    RTS                    ; 6

CopyrightPtrs SUBROUTINE
    LDX    #$1D            ; 2
.loopCopyright:
    LDA    CopyrightTab,X  ; 4
    STA    $8F,X           ; 4
    DEX                    ; 2
    BPL    .loopCopyright  ; 2³
    RTS                    ; 6

LF8CE:
    .byte <Letter_J      ; $F8CE
    .byte <Letter_G      ; $F8CF
    .byte <Letter_M      ; $F8D0
    .byte <Letter_O      ; $F8D1
    .byte <Letter_I      ; $F8D2
    .byte <Letter_C      ; $F8D3
    .byte <Letter_Q      ; $F8D4
    .byte <Letter_G      ; $F8D5
    .byte <Letter_K      ; $F8D6
    .byte <Letter_E      ; $F8D7
    .byte <Letter_M      ; $F8D8
    .byte <Letter_J      ; $F8D9

LF8DA:
    .byte $05 ; |     X X| $F8DA
    .byte $06 ; |     XX | $F8DB
    .byte $06 ; |     XX | $F8DC
    .byte $06 ; |     XX | $F8DD
    .byte $06 ; |     XX | $F8DE
    .byte $06 ; |     XX | $F8DF
    .byte $06 ; |     XX | $F8E0
    .byte $06 ; |     XX | $F8E1
    .byte $06 ; |     XX | $F8E2
    .byte $06 ; |     XX | $F8E3
    .byte $06 ; |     XX | $F8E4
    .byte $05 ; |     X X| $F8E5

StartScreenPat:
    .byte <Ship          ; $F8E6
    .byte <Letter_Y      ; $F8E7
    .byte <Letter_Z      ; $F8E8
    .byte <Heart         ; $F8E9
    .byte <Bird          ; $F8EA
    .byte <Tornado       ; $F8EB
    .byte <Heart         ; $F8EC
    .byte <Letter_A      ; $F8ED
    .byte <Letter_B      ; $F8EE
    .byte <Letter_C      ; $F8EF
    .byte <Letter_D      ; $F8F0
    .byte <Enemy         ; $F8F1

CopyrightTab:
    .byte <Blank         ; $F8F2
    .byte <Letter_C      ; $F8F3
    .byte <Letter_O      ; $F8F4
    .byte <Letter_P      ; $F8F5
    .byte <Letter_Y      ; $F8F6
    .byte <Blank         ; $F8F7
    .byte <Letter_R      ; $F8F8
    .byte <Letter_I      ; $F8F9
    .byte <Letter_G      ; $F8FA
    .byte <Letter_H      ; $F8FB
    .byte <Letter_T      ; $F8FC
    .byte <Blank         ; $F8FD
    .byte <Letter_S      ; $F8FE
    .byte <Letter_A      ; $F8FF
    .byte <Letter_N      ; $F900
    .byte <Letter_C      ; $F901
    .byte <Letter_H      ; $F902
    .byte <Letter_O      ; $F903
    .byte <Blank         ; $F904
    .byte <Letter_C      ; $F905
    .byte <Letter_O      ; $F906
    .byte <Letter_R      ; $F907
    .byte <Letter_P      ; $F908
    .byte <Blank         ; $F909

    .byte 0              ; $F90A
    .byte $19,$83        ; $F90B - $F90C    "1983" in BCD, year on top row of screen

    .byte 0              ; $F90D
    .byte $19,$83        ; $F90E - $F90F    "1983" in BCD, year on bottom row of screen

LF910:
    CPX    #0              ; 2
    BNE    LF91A           ; 2³
    LDA    LF93C,Y         ; 4
    JMP    LF91D           ; 3
LF91A:
    LDA    LF966,Y         ; 4
LF91D:
    RTS                    ; 6

LF91E:
    .byte $0A,$13,$1C,$25,$2E,$37,$40,$49,$52,$5B,$64,$6D,$76,$7F,$88,$91
LF92E:
    .byte $1D,$1A,$17,$15,$13,$11,$0F,$0E,$0C,$0B,$0A,$09,$08,$07
LF93C:
    .byte $73,$81,$81,$91,$91,$A1,$A1,$B3,$C1,$C1,$B1,$B1,$71,$71,$83,$91
    .byte $91,$A1,$A1,$B1,$B1,$83,$91,$91,$A1,$A1,$B1,$B1,$73,$81,$81,$91
    .byte $91,$A1,$A1,$B3,$C1,$C1,$B1,$B1,$71,$71
LF966:
    .byte $03,$13,$03,$13,$41,$21,$41,$01,$41,$21,$41,$01,$41,$31,$41,$11
    .byte $41,$31,$41,$11,$41,$31,$41,$11,$41,$31,$41,$11,$41,$21,$41,$01
    .byte $41,$21,$41,$01,$41,$21,$41,$01,$41,$21,$41,$01
LF992:
    .byte $29,$2B
LF994:
    .byte $00,$03

LF996:
    LDA    #0              ; 2
    CPX    $D4             ; 3
    BCC    LF9A5           ; 2³
    LDY    $E5             ; 3
    BMI    LF9A5           ; 2³
    LDA    #2              ; 2
    DEY                    ; 2
    STY    $E5             ; 3
LF9A5:
    STA    $80             ; 3
    LDA    #0              ; 2
    CPX    $D5             ; 3
    BCC    LF9B6           ; 2³
    LDY    $E6             ; 3
    BMI    LF9B6           ; 2³
    LDA    #2              ; 2
    DEY                    ; 2
    STY    $E6             ; 3
LF9B6:
    STA    HMCLR           ; 3
    INX                    ; 2
    STA    WSYNC           ; 3
    STA    ENABL           ; 3
    LDA    $80             ; 3
    STA    ENAM0           ; 3
    RTS                    ; 6

LF9C2:
    .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$8D,$AA,$AA,$AA,$AA,$AA
    .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
    .byte $AA,$AA,$AA,$8D,$AA,$D4,$C1,$C7,$A0,$C4,$C5,$CC,$C5,$D4,$C5,$A0
    .byte $C3,$CF,$CE,$D4,$D2,$CF,$CC,$A0,$D3,$D5,$C2,$AA,$8D,$AA,$AA,$AA
    .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
    .byte $AA,$AA,$AA,$AA,$AA,$8D,$D4,$C4,$C3,$D3,$A0,$CC,$C4,$D9,$A0,$C2
    .byte $D5,$C6,$C6,$B3,$8D,$A0,$CC,$C4,$C1,$A0,$C7,$D5,$CE,$C9,$CE,$C4
    .byte $D4,$AC,$D9,$8D,$A0,$D4,$C1,$D9,$8D,$A0,$CC,$C4,$C1,$A0,$D4,$C1
    .byte $C7,$D8,$B1,$AC,$D9,$8D,$A0,$C3,$CC,$C3,$8D,$A0,$C1,$C4,$C3,$A0
    .byte $A3,$A4,$B0,$C2,$8D,$A0,$D3,$D4,$C1,$A0,$C2,$D5,$C6,$C6,$B3,$8D
    .byte $AA,$AA,$AA,$AA,$AA,$8D,$D4,$C4,$C3,$D3,$C1,$A0,$CC,$C4,$C1,$A0
    .byte $D4,$C1,$C7,$D8,$B1,$AC,$D8,$8D,$A0,$D3,$D4,$C1,$A0,$C2,$D5,$C6
    .byte $C6,$B4,$8D,$A0,$C3,$CC,$C3,$8D,$A0,$C1,$C4,$C3,$A0,$A3,$A4,$B2
    .byte $B0,$8D,$A0,$D3,$D4,$C1,$A0,$C2,$D5,$C6,$C6,$B5,$8D,$A0,$C3,$CC
    .byte $C3,$8D,$A0,$C1,$C4,$C3,$A0,$A3,$A4,$B2,$B0,$8D,$A0,$D3,$D4,$C1
    .byte $A0,$C2,$D5,$C6,$C6,$B6,$8D,$A0,$CC,$C4,$D8,$A0,$A3,$A4,$B0,$B2
    .byte $8D,$D4,$C4,$C3,$D3,$C1,$B2,$A0,$CC,$C4,$C1,$A0,$C2,$D5,$C6,$C6
    .byte $B4,$AC,$D8,$A0,$8D,$A0,$C3,$CD,$D0,$A0,$A3,$A4,$C1,$B0,$A0,$8D
    .byte $A0,$C2,$C3,$C3,$A0,$D4,$C4,$C3,$D3,$C1,$B1,$8D,$A0,$C3,$CC,$C3
    .byte $8D,$A0,$D3,$C2,$C3,$A0,$A3,$A4,$C1,$B0,$A0,$8D,$D4,$C4,$C3,$D3
    .byte $C1,$B1,$A0,$D3,$D4,$C1,$A0,$C2,$D5,$C6,$C6,$B4,$AC,$D8,$8D,$A0
    .byte $C4,$C5,$D8,$8D,$A0,$C2,$D0,$CC,$A0,$D4,$C4,$C3,$D3,$C1,$B2,$8D
    .byte $A0,$CC,$C4,$D8,$A0,$A3,$A4,$B0,$B2,$8D,$D4,$C4,$C3,$D3,$C1,$B5
    .byte $A0,$CC,$C4,$C1,$A0,$C2,$D5,$C6,$C6,$B4,$AC,$D8,$8D,$A0,$C3,$CD
    .byte $D0,$A0,$A3,$A4,$B9,$B8,$8D,$A0,$C2,$C3,$D3,$A0,$D4,$C4,$C3,$D3
    .byte $C1,$B3,$8D,$A0,$C3,$CD,$D0,$A0,$C2,$D5,$C6,$C6,$B3,$8D,$A0,$C2
    .byte $C3,$D3,$A0,$D4,$C4,$C3,$D3,$C1,$B3,$8D,$A0,$C3,$CC,$C3,$8D,$A0
    .byte $C1,$C4,$C3,$A0,$A3,$A4,$B0,$B9,$8D,$A0,$C3,$CD,$D0,$A0,$C2,$D5
    .byte $C6,$C6,$B3,$8D,$A0,$C2,$C3,$D3,$A0,$D4,$C4,$C3,$D3,$C1,$B4,$8D
    .byte $D4,$C4,$C3,$D3,$C1,$B3,$A0,$C4,$C5,$D8,$8D,$A0,$C2,$CE,$C5,$A0
    .byte $D4,$C4,$C3,$D3,$C1,$B5,$8D,$D4,$C4,$C3,$D3,$C1,$B4,$A0,$D3,$D4
    .byte $D8,$A0,$C2,$D5,$C6,$C6,$B7,$8D,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
    .byte $8D,$A0,$CC,$C4,$D8,$A0,$C2,$D5,$C6,$C6,$B2,$8D,$A0,$CC,$C4,$C1
    .byte $A0,$D4,$C1,$C7,$C6,$B1,$AC,$D8,$8D,$A0,$C1,$CE,$C4,$A0,$A3,$A4
    .byte $B0,$B7,$8D,$A0,$C2,$C5,$D1,$A0,$D4,$C4,$C3,$D3,$B1,$8D,$A0,$CC
    .byte $C4,$D8,$A0,$C2,$D5,$C6,$C6,$B7,$8D,$A0,$C3,$CD,$D0,$A0

  REPEAT ($FE00 - *)
    .byte 0
  REPEND

Letter_A:
    .byte $00 ; |        | $FE00
    .byte $66 ; | XX  XX | $FE01
    .byte $66 ; | XX  XX | $FE02
    .byte $7E ; | XXXXXX | $FE03
    .byte $66 ; | XX  XX | $FE04
    .byte $66 ; | XX  XX | $FE05
    .byte $3C ; |  XXXX  | $FE06
    .byte $18 ; |   XX   | $FE07
Letter_B:
    .byte $00 ; |        | $FE08
    .byte $7C ; | XXXXX  | $FE09
    .byte $66 ; | XX  XX | $FE0A
    .byte $66 ; | XX  XX | $FE0B
    .byte $7C ; | XXXXX  | $FE0C
    .byte $66 ; | XX  XX | $FE0D
    .byte $66 ; | XX  XX | $FE0E
    .byte $7C ; | XXXXX  | $FE0F
Letter_C:
    .byte $00 ; |        | $FE10
    .byte $3C ; |  XXXX  | $FE11
    .byte $76 ; | XXX XX | $FE12
    .byte $60 ; | XX     | $FE13
    .byte $60 ; | XX     | $FE14
    .byte $60 ; | XX     | $FE15
    .byte $76 ; | XXX XX | $FE16
    .byte $3C ; |  XXXX  | $FE17
Letter_D:
    .byte $00 ; |        | $FE18
    .byte $78 ; | XXXX   | $FE19
    .byte $6C ; | XX XX  | $FE1A
    .byte $66 ; | XX  XX | $FE1B
    .byte $66 ; | XX  XX | $FE1C
    .byte $66 ; | XX  XX | $FE1D
    .byte $6C ; | XX XX  | $FE1E
    .byte $78 ; | XXXX   | $FE1F
Letter_E:
    .byte $00 ; |        | $FE20
    .byte $7E ; | XXXXXX | $FE21
    .byte $60 ; | XX     | $FE22
    .byte $64 ; | XX  X  | $FE23
    .byte $7C ; | XXXXX  | $FE24
    .byte $64 ; | XX  X  | $FE25
    .byte $60 ; | XX     | $FE26
    .byte $7E ; | XXXXXX | $FE27
Letter_F:
    .byte $00 ; |        | $FE28
    .byte $60 ; | XX     | $FE29
    .byte $60 ; | XX     | $FE2A
    .byte $64 ; | XX  X  | $FE2B
    .byte $7C ; | XXXXX  | $FE2C
    .byte $64 ; | XX  X  | $FE2D
    .byte $60 ; | XX     | $FE2E
    .byte $7E ; | XXXXXX | $FE2F
Letter_G:
    .byte $00 ; |        | $FE30
    .byte $3E ; |  XXXXX | $FE31
    .byte $76 ; | XXX XX | $FE32
    .byte $66 ; | XX  XX | $FE33
    .byte $7E ; | XXXXXX | $FE34
    .byte $60 ; | XX     | $FE35
    .byte $76 ; | XXX XX | $FE36
    .byte $3C ; |  XXXX  | $FE37
Letter_H:
    .byte $00 ; |        | $FE38
    .byte $66 ; | XX  XX | $FE39
    .byte $66 ; | XX  XX | $FE3A
    .byte $66 ; | XX  XX | $FE3B
    .byte $7E ; | XXXXXX | $FE3C
    .byte $66 ; | XX  XX | $FE3D
    .byte $66 ; | XX  XX | $FE3E
    .byte $66 ; | XX  XX | $FE3F
Letter_I:
    .byte $00 ; |        | $FE40
    .byte $3C ; |  XXXX  | $FE41
    .byte $18 ; |   XX   | $FE42
    .byte $18 ; |   XX   | $FE43
    .byte $18 ; |   XX   | $FE44
    .byte $18 ; |   XX   | $FE45
    .byte $18 ; |   XX   | $FE46
    .byte $3C ; |  XXXX  | $FE47
Letter_J:
    .byte $00 ; |        | $FE48
    .byte $30 ; |  XX    | $FE49
    .byte $58 ; | X XX   | $FE4A
    .byte $18 ; |   XX   | $FE4B
    .byte $18 ; |   XX   | $FE4C
    .byte $18 ; |   XX   | $FE4D
    .byte $18 ; |   XX   | $FE4E
    .byte $3C ; |  XXXX  | $FE4F
Letter_K:
    .byte $00 ; |        | $FE50
    .byte $66 ; | XX  XX | $FE51
    .byte $6C ; | XX XX  | $FE52
    .byte $78 ; | XXXX   | $FE53
    .byte $70 ; | XXX    | $FE54
    .byte $78 ; | XXXX   | $FE55
    .byte $6C ; | XX XX  | $FE56
    .byte $66 ; | XX  XX | $FE57
Letter_L:
    .byte $00 ; |        | $FE58
    .byte $7C ; | XXXXX  | $FE59
    .byte $66 ; | XX  XX | $FE5A
    .byte $60 ; | XX     | $FE5B
    .byte $60 ; | XX     | $FE5C
    .byte $60 ; | XX     | $FE5D
    .byte $60 ; | XX     | $FE5E
    .byte $60 ; | XX     | $FE5F
Letter_M:
    .byte $00 ; |        | $FE60
    .byte $66 ; | XX  XX | $FE61
    .byte $66 ; | XX  XX | $FE62
    .byte $66 ; | XX  XX | $FE63
    .byte $7E ; | XXXXXX | $FE64
    .byte $7E ; | XXXXXX | $FE65
    .byte $66 ; | XX  XX | $FE66
    .byte $42 ; | X    X | $FE67
Letter_N:
    .byte $00 ; |        | $FE68
    .byte $66 ; | XX  XX | $FE69
    .byte $6E ; | XX XXX | $FE6A
    .byte $6E ; | XX XXX | $FE6B
    .byte $7E ; | XXXXXX | $FE6C
    .byte $76 ; | XXX XX | $FE6D
    .byte $76 ; | XXX XX | $FE6E
    .byte $66 ; | XX  XX | $FE6F
Letter_O:
    .byte $00 ; |        | $FE70
    .byte $3C ; |  XXXX  | $FE71
    .byte $66 ; | XX  XX | $FE72
    .byte $66 ; | XX  XX | $FE73
    .byte $66 ; | XX  XX | $FE74
    .byte $66 ; | XX  XX | $FE75
    .byte $66 ; | XX  XX | $FE76
    .byte $3C ; |  XXXX  | $FE77
Letter_P:
    .byte $00 ; |        | $FE78
    .byte $60 ; | XX     | $FE79
    .byte $60 ; | XX     | $FE7A
    .byte $60 ; | XX     | $FE7B
    .byte $7C ; | XXXXX  | $FE7C
    .byte $66 ; | XX  XX | $FE7D
    .byte $66 ; | XX  XX | $FE7E
    .byte $7C ; | XXXXX  | $FE7F
Letter_Q:
    .byte $00 ; |        | $FE80
    .byte $3E ; |  XXXXX | $FE81
    .byte $66 ; | XX  XX | $FE82
    .byte $6E ; | XX XXX | $FE83
    .byte $76 ; | XXX XX | $FE84
    .byte $66 ; | XX  XX | $FE85
    .byte $66 ; | XX  XX | $FE86
    .byte $3C ; |  XXXX  | $FE87
Letter_R:
    .byte $00 ; |        | $FE88
    .byte $66 ; | XX  XX | $FE89
    .byte $6C ; | XX XX  | $FE8A
    .byte $78 ; | XXXX   | $FE8B
    .byte $7C ; | XXXXX  | $FE8C
    .byte $66 ; | XX  XX | $FE8D
    .byte $66 ; | XX  XX | $FE8E
    .byte $7C ; | XXXXX  | $FE8F
Letter_S:
    .byte $00 ; |        | $FE90
    .byte $3C ; |  XXXX  | $FE91
    .byte $66 ; | XX  XX | $FE92
    .byte $06 ; |     XX | $FE93
    .byte $3C ; |  XXXX  | $FE94
    .byte $60 ; | XX     | $FE95
    .byte $66 ; | XX  XX | $FE96
    .byte $3C ; |  XXXX  | $FE97
Letter_T:
    .byte $00 ; |        | $FE98
    .byte $18 ; |   XX   | $FE99
    .byte $18 ; |   XX   | $FE9A
    .byte $18 ; |   XX   | $FE9B
    .byte $18 ; |   XX   | $FE9C
    .byte $18 ; |   XX   | $FE9D
    .byte $18 ; |   XX   | $FE9E
    .byte $7E ; | XXXXXX | $FE9F
Letter_U:
    .byte $00 ; |        | $FEA0
    .byte $3C ; |  XXXX  | $FEA1
    .byte $66 ; | XX  XX | $FEA2
    .byte $66 ; | XX  XX | $FEA3
    .byte $66 ; | XX  XX | $FEA4
    .byte $66 ; | XX  XX | $FEA5
    .byte $66 ; | XX  XX | $FEA6
    .byte $66 ; | XX  XX | $FEA7
Letter_V:
    .byte $00 ; |        | $FEA8
    .byte $18 ; |   XX   | $FEA9
    .byte $18 ; |   XX   | $FEAA
    .byte $3C ; |  XXXX  | $FEAB
    .byte $24 ; |  X  X  | $FEAC
    .byte $66 ; | XX  XX | $FEAD
    .byte $42 ; | X    X | $FEAE
    .byte $42 ; | X    X | $FEAF
Letter_W:
    .byte $00 ; |        | $FEB0
    .byte $24 ; |  X  X  | $FEB1
    .byte $3C ; |  XXXX  | $FEB2
    .byte $7E ; | XXXXXX | $FEB3
    .byte $5A ; | X XX X | $FEB4
    .byte $5A ; | X XX X | $FEB5
    .byte $5A ; | X XX X | $FEB6
    .byte $42 ; | X    X | $FEB7
Letter_X:
    .byte $00 ; |        | $FEB8
    .byte $66 ; | XX  XX | $FEB9
    .byte $66 ; | XX  XX | $FEBA
    .byte $3C ; |  XXXX  | $FEBB
    .byte $18 ; |   XX   | $FEBC
    .byte $3C ; |  XXXX  | $FEBD
    .byte $66 ; | XX  XX | $FEBE
    .byte $66 ; | XX  XX | $FEBF
Letter_Y:
    .byte $00 ; |        | $FEC0
    .byte $18 ; |   XX   | $FEC1
    .byte $18 ; |   XX   | $FEC2
    .byte $18 ; |   XX   | $FEC3
    .byte $3C ; |  XXXX  | $FEC4
    .byte $24 ; |  X  X  | $FEC5
    .byte $24 ; |  X  X  | $FEC6
    .byte $66 ; | XX  XX | $FEC7
Letter_Z:
    .byte $00 ; |        | $FEC8
    .byte $7E ; | XXXXXX | $FEC9
    .byte $66 ; | XX  XX | $FECA
    .byte $30 ; |  XX    | $FECB
    .byte $18 ; |   XX   | $FECC
    .byte $0C ; |    XX  | $FECD
    .byte $66 ; | XX  XX | $FECE
    .byte $7E ; | XXXXXX | $FECF
Heart:
    .byte $00 ; |        | $FED0
    .byte $08 ; |    X   | $FED1
    .byte $1C ; |   XXX  | $FED2
    .byte $3E ; |  XXXXX | $FED3
    .byte $7F ; | XXXXXXX| $FED4
    .byte $7F ; | XXXXXXX| $FED5
    .byte $77 ; | XXX XXX| $FED6
    .byte $22 ; |  X   X | $FED7
Bird:
    .byte $00 ; |        | $FED8
    .byte $F0 ; |XXXX    | $FED9
    .byte $78 ; | XXXX   | $FEDA
    .byte $FC ; |XXXXXX  | $FEDB
    .byte $9C ; |X  XXX  | $FEDC
    .byte $07 ; |     XXX| $FEDD
    .byte $03 ; |      XX| $FEDE
    .byte $03 ; |      XX| $FEDF
Tornado:
    .byte $00 ; |        | $FEE0
    .byte $08 ; |    X   | $FEE1
    .byte $10 ; |   X    | $FEE2
    .byte $08 ; |    X   | $FEE3
    .byte $14 ; |   X X  | $FEE4
    .byte $28 ; |  X X   | $FEE5
    .byte $54 ; | X X X  | $FEE6
    .byte $2A ; |  X X X | $FEE7
Ship:
    .byte $22 ; |  X   X | $FEE8
    .byte $2A ; |  X X X | $FEE9
    .byte $7F ; | XXXXXXX| $FEEA
    .byte $5D ; | X XXX X| $FEEB
    .byte $49 ; | X  X  X| $FEEC
    .byte $08 ; |    X   | $FEED
    .byte $08 ; |    X   | $FEEE
    .byte $00 ; |        | $FEEF
Enemy:
    .byte $00 ; |        | $FEF0
    .byte $08 ; |    X   | $FEF1
    .byte $08 ; |    X   | $FEF2
    .byte $49 ; | X  X  X| $FEF3
    .byte $5D ; | X XXX X| $FEF4
    .byte $7F ; | XXXXXXX| $FEF5
    .byte $2A ; |  X X X | $FEF6
    .byte $22 ; |  X   X | $FEF7
Blank:
    .byte $00 ; |        | $FEF8
    .byte $00 ; |        | $FEF9
    .byte $00 ; |        | $FEFA
    .byte $00 ; |        | $FEFB
    .byte $00 ; |        | $FEFC
    .byte $00 ; |        | $FEFD
    .byte $00 ; |        | $FEFE
    .byte $00 ; |        | $FEFF
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;                          X    X                  X
;                                                  X
;    XXX  X   X X  XXX X X X XX X XXX XXX  XXX XXX
;    X X X X X X X X X X X X X  X X X X X  X X   X
;    X X X X X X X XXX X X X XX X X X X X  XXX XXX
;    X X X X X X X X   X X X  X X X X X X  X X   X
;    X X  X  X X X XXX  X  X XX X XXX X X  XXX XXX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Logo_A:
    .byte $B8 ; |X XXX   | $FF50
    .byte $88 ; |X   X   | $FF51
    .byte $B8 ; |X XXX   | $FF52
    .byte $88 ; |X   X   | $FF53
    .byte $B8 ; |X XXX   | $FF54
    .byte $02 ; |      X | $FF55
    .byte $02 ; |      X | $FF56
    .byte $00 ; |        | $FF57
Logo_B:
    .byte $53 ; | X X  XX| $FF58
    .byte $52 ; | X X  X | $FF59
    .byte $53 ; | X X  XX| $FF5A
    .byte $52 ; | X X  X | $FF5B
    .byte $73 ; | XXX  XX| $FF5C
    .byte $00 ; |        | $FF5D
    .byte $00 ; |        | $FF5E
    .byte $00 ; |        | $FF5F
Logo_C:
    .byte $D7 ; |XX X XXX| $FF60
    .byte $55 ; | X X X X| $FF61
    .byte $D5 ; |XX X X X| $FF62
    .byte $95 ; |X  X X X| $FF63
    .byte $D7 ; |XX X XXX| $FF64
    .byte $00 ; |        | $FF65
    .byte $10 ; |   X    | $FF66
    .byte $00 ; |        | $FF67
Logo_D:
    .byte $92 ; |X  X  X | $FF68
    .byte $2A ; |  X X X | $FF69
    .byte $AA ; |X X X X | $FF6A
    .byte $AA ; |X X X X | $FF6B
    .byte $AA ; |X X X X | $FF6C
    .byte $00 ; |        | $FF6D
    .byte $02 ; |      X | $FF6E
    .byte $00 ; |        | $FF6F
Logo_E:
    .byte $AB ; |X X X XX| $FF70
    .byte $AA ; |X X X X | $FF71
    .byte $AB ; |X X X XX| $FF72
    .byte $AA ; |X X X X | $FF73
    .byte $53 ; | X X  XX| $FF74
    .byte $00 ; |        | $FF75
    .byte $00 ; |        | $FF76
    .byte $00 ; |        | $FF77
Logo_F:
    .byte $A4 ; |X X  X  | $FF78
    .byte $AA ; |X X X X | $FF79
    .byte $AA ; |X X X X | $FF7A
    .byte $AA ; |X X X X | $FF7B
    .byte $E4 ; |XXX  X  | $FF7C
    .byte $00 ; |        | $FF7D
    .byte $00 ; |        | $FF7E
    .byte $00 ; |        | $FF7F

  REPEAT ($FFFC - *)
    .byte 0
  REPEND

     ORG $FFFC

    .word START, 0