; Disassembly of ST_PuzP.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcST_PuzP.cfg ST_PuzP.bin 
;
; ST_PuzP.cfg contents:
;
;      ORG F000
;      CODE F000 F6CE
;      GFX F6CF F6D1
;      CODE F6D2 F935
;      GFX F936 FBFF
;      DATA FC00 FCFF
;      GFX FD00 FEFF
;      DATA FF00 FFFB
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
HMP0    =  $20
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296
T1024T  =  $0297
LF600   =   $F600

       ORG $F000

START:
    CLD                    ; 2
    LDX    #$00            ; 2
    LDA    #$00            ; 2
LF005:
    STA    VSYNC,X         ; 4
    TXS                    ; 2
    INX                    ; 2
    BNE    LF005           ; 2
    LDA    #$38            ; 2
    STA    $8D             ; 3
    LDA    #$03            ; 2
    STA    $8F             ; 3
    LDA    #$02            ; 2
    STA    $8A             ; 3
    LDA    #$10            ; 2
    STA    $8C             ; 3
    STA    $8B             ; 3
    LDA    #$10            ; 2
    STA    $92             ; 3
    LDA    #$FF            ; 2
    STA    $94             ; 3
LF025:
    LDA    #$00            ; 2
    LDX    #$A0            ; 2
LF029:
    STA    VSYNC,X         ; 4
    INX                    ; 2
    BNE    LF029           ; 2
    LDA    #$50            ; 2
    STA    $E6             ; 3
    LDA    #$40            ; 2
    STA    $AE             ; 3
    STA    $CC             ; 3
    STA    $CA             ; 3
    LDA    #$00            ; 2
    STA    $AC             ; 3
    LDA    #$25            ; 2
    STA    $B4             ; 3
    LDA    #$2E            ; 2
    STA    $D3             ; 3
    LDA    LFB9A           ; 4
    STA    $DD             ; 3
    LDA    #$6A            ; 2
    STA    $DC             ; 3
LF04F:
    JSR    LF7E5           ; 6
    LDA    #$00            ; 2
    STA    COLUBK          ; 3
    JSR    LF81C           ; 6
    LDA    #$14            ; 2
    STA    T1024T          ; 4
    JSR    LF64D           ; 6
    LDA    $B4             ; 3
    STA    NUSIZ1          ; 3
    LDA    $E2             ; 3
    STA    NUSIZ0          ; 3
    LDA    $D3             ; 3
    AND    $A5             ; 3
    STA    COLUPF          ; 3
    LDA    #$2C            ; 2
    AND    $A5             ; 3
    STA    COLUP0          ; 3
    LDA    $8D             ; 3
    AND    $A5             ; 3
    STA    COLUP1          ; 3
    LDA    $90             ; 3
    LDX    #$00            ; 2
    JSR    LF7BB           ; 6
    LDA    $B5             ; 3
    LDX    #$01            ; 2
    JSR    LF7BB           ; 6
    LDA    $A1             ; 3
    LDX    #$02            ; 2
    JSR    LF7BB           ; 6
    LDA    $A2             ; 3
    LDX    #$03            ; 2
    JSR    LF7BB           ; 6
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    $DD             ; 3
    AND    $A5             ; 3
    STA    COLUBK          ; 3
    LDA    #$01            ; 2
    STA    CTRLPF          ; 3
    LDA    #$00            ; 2
    STA    $AB             ; 3
    LDA    #$D0            ; 2
    STA    $A8             ; 3
    LDX    #$00            ; 2
    STX    $B0             ; 3
    STX    $B1             ; 3
    LDA    $CA             ; 3
    STA    $AE             ; 3
    STA    HMCLR           ; 3
    LDX    #$07            ; 2
    LDA    $A8             ; 3
LF0BD:
    LDY    #$00            ; 2
    CMP    $C6             ; 3
    BNE    LF0C5           ; 2
    LDY    #$02            ; 2
LF0C5:
    STY    ENAM0           ; 3
    CMP    $91             ; 3
    BNE    LF0CD           ; 2
    STX    $B0             ; 3
LF0CD:
    LDY    $B0             ; 3
    BEQ    LF0D3           ; 2
    DEC    $B0             ; 5
LF0D3:
    LDA    LFBDE,Y         ; 4
    AND    $A5             ; 3
    STA    COLUP0          ; 3
    LDA    ($AC),Y         ; 5
    STA    GRP0            ; 3
    DEC    $A8             ; 5
    STA    WSYNC           ; 3
    LDY    #$00            ; 2
    LDA    $A8             ; 3
    CMP    $CD             ; 3
    BNE    LF0EC           ; 2
    LDY    #$02            ; 2
LF0EC:
    STY    ENAM1           ; 3
    CMP    $B6             ; 3
    BNE    LF0F4           ; 2
    STX    $B1             ; 3
LF0F4:
    LDY    $B1             ; 3
    BEQ    LF0FA           ; 2
    DEC    $B1             ; 5
LF0FA:
    LDA    LFBE6,Y         ; 4
    ORA    $8D             ; 3
    AND    $A5             ; 3
    STA    COLUP1          ; 3
    LDA    ($AE),Y         ; 5
    STA    GRP1            ; 3
    DEC    $A8             ; 5
    LDY    $A8             ; 3
    STA    WSYNC           ; 3
    LDA    ($A6),Y         ; 5
    STA    PF0             ; 3
    LDA    $A8             ; 3
    CMP    #$80            ; 2
    BCS    LF0BD           ; 2
LF117:
    DEC    $A8             ; 5
    LDY    #$00            ; 2
    LDA    $A8             ; 3
    CMP    $CD             ; 3
    BNE    LF123           ; 2
    LDY    #$02            ; 2
LF123:
    STY    ENAM1           ; 3
    LDX    #$03            ; 2
    JSR    LF78D           ; 6
    LDA    $A8             ; 3
    CMP    #$2E            ; 2
    BCS    LF117           ; 2
    JSR    LF8E2           ; 6
    SEC                    ; 2
    LDA    $A8             ; 3
    SBC    #$0A            ; 2
    STA    $A8             ; 3
LF13A:
    STA    WSYNC           ; 3
    DEC    $A8             ; 5
    LDA    $A8             ; 3
    CMP    #$15            ; 2
    BCS    LF13A           ; 2
    JSR    LF734           ; 6
    LDA    $86             ; 3
    BNE    LF14E           ; 2
    JMP    LF23C           ; 3
LF14E:
    LDA    $8B             ; 3
    ORA    $8C             ; 3
    BNE    LF18A           ; 2
    LDA    $B3             ; 3
    AND    #$0F            ; 2
    TAY                    ; 2
    LDA    LFB60,Y         ; 4
    STA    AUDF1           ; 3
    LDA    $E1             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LFB70,Y         ; 4
    STA    AUDC1           ; 3
    SEC                    ; 2
    LDA    $B6             ; 3
    SBC    $91             ; 3
    BCS    LF171           ; 2
    EOR    #$FF            ; 2
LF171:
    TAX                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDA    LF95A,Y         ; 4
    STA    $C5             ; 3
    CLC                    ; 2
    LDA    $B3             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LF95E,Y         ; 4
    ADC    $C5             ; 3
    STA    AUDV1           ; 3
LF18A:
    INC    $E0             ; 5
    LDA    $8C             ; 3
    BNE    LF1A8           ; 2
    LDA    $C9             ; 3
    CMP    #$47            ; 2
    BCC    LF1A8           ; 2
    LDA    #$05            ; 2
    STA    AUDC0           ; 3
    LDA    #$08            ; 2
    STA    AUDV0           ; 3
    LDA    $C9             ; 3
    AND    #$0F            ; 2
    EOR    #$0F            ; 2
    ADC    #$08            ; 2
    STA    AUDF0           ; 3
LF1A8:
    LDA    NUSIZ1          ; 3
    ASL                    ; 2
    BCC    LF1B1           ; 2
    LDA    #$01            ; 2
    STA    $DE             ; 3
LF1B1:
    LDA    $DE             ; 3
    BEQ    LF1C3           ; 2
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
    DEC    $DE             ; 5
    LDA    #$07            ; 2
    STA    AUDC0           ; 3
    LDA    #$0A            ; 2
    STA    AUDF0           ; 3
LF1C3:
    LDA    $8C             ; 3
    CMP    #$28            ; 2
    BCC    LF1E4           ; 2
    TAY                    ; 2
    LDA    LF500,Y         ; 4
    STA    AUDF0           ; 3
    LDA    LF600,Y         ; 4
    STA    AUDF1           ; 3
    LDA    #$0C            ; 2
    STA    AUDC1           ; 3
    LDA    #$0C            ; 2
    STA    AUDC0           ; 3
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
    LDA    #$0F            ; 2
    STA    AUDV1           ; 3
LF1E4:
    LDA    $8C             ; 3
    BNE    LF1FA           ; 2
    LDA    $8B             ; 3
    CMP    #$11            ; 2
    BCC    LF1FA           ; 2
    AND    #$1F            ; 2
    STA    AUDF0           ; 3
    LDA    #$0C            ; 2
    STA    AUDC0           ; 3
    LDA    #$0D            ; 2
    STA    AUDV0           ; 3
LF1FA:
    LDA    $8C             ; 3
    BNE    LF218           ; 2
    LDA    $8B             ; 3
    CMP    #$25            ; 2
    BCC    LF218           ; 2
    AND    #$0F            ; 2
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    LDA    #$04            ; 2
    STA    AUDC0           ; 3
    STA    AUDC1           ; 3
    LDA    #$0F            ; 2
    STA    AUDF0           ; 3
    LDA    #$0E            ; 2
    STA    AUDF1           ; 3
LF218:
    LDA    $D5             ; 3
    BEQ    LF23C           ; 2
    DEC    $D5             ; 5
    LDA    $D5             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDA    LFB89,Y         ; 4
    STA    AUDF0           ; 3
    LDA    $D5             ; 3
    AND    #$0F            ; 2
    STA    AUDV0           ; 3
    LDA    #$0C            ; 2
    STA    AUDC0           ; 3
    LDA    #$00            ; 2
    STA    AUDC1           ; 3
    STA    AUDF1           ; 3
    STA    AUDV1           ; 3
LF23C:
    LDA    $DB             ; 3
    BEQ    LF260           ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDA    $DB             ; 3
    AND    #$0F            ; 2
    STA    AUDV1           ; 3
    LDA    #$04            ; 2
    STA    AUDC1           ; 3
    LDA    LFB78,Y         ; 4
    STA    AUDF1           ; 3
    DEC    $DB             ; 5
    BNE    LF260           ; 2
    LDA    #$00            ; 2
    STA    AUDC0           ; 3
    STA    AUDF0           ; 3
    STA    AUDV0           ; 3
LF260:
    LDA    $94             ; 3
    BEQ    LF2AA           ; 2
    DEC    $94             ; 5
    LDA    $94             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDA    #$04            ; 2
    STA    AUDC0           ; 3
    STA    AUDC1           ; 3
    LDA    LFB9E,Y         ; 4
    STA    AUDF0           ; 3
    LDA    $94             ; 3
    AND    #$07            ; 2
    ASL                    ; 2
    STA    AUDV1           ; 3
    STA    AUDV0           ; 3
    LDA    LFBBE,Y         ; 4
    STA    AUDF1           ; 3
    LDA    $94             ; 3
    BNE    LF2AA           ; 2
    LDA    #$06            ; 2
    STA    $86             ; 3
    JSR    LF68A           ; 6
    LDA    #$50            ; 2
    STA    $90             ; 3
    LDA    #$A0            ; 2
    STA    $91             ; 3
    LDA    #$00            ; 2
    STA    $88             ; 3
    STA    $89             ; 3
    STA    $8C             ; 3
    STA    $8E             ; 3
    LDA    #$08            ; 2
    STA    $92             ; 3
    LDA    #$10            ; 2
    STA    $8B             ; 3
LF2AA:
    LDA    INTIM           ; 4
    BNE    LF2AA           ; 2
    LDA    #$00            ; 2
    STA    COLUBK          ; 3
    JSR    LF803           ; 6
    LDA    #$2A            ; 2
    STA    TIM64T          ; 4
    LDA    SWCHB           ; 4
    LSR                    ; 2
    BCS    LF2DC           ; 2
    LDA    #$FF            ; 2
    STA    $94             ; 3
    LDA    #$10            ; 2
    STA    $8C             ; 3
    STA    $8B             ; 3
    STA    $86             ; 3
    LDA    #$00            ; 2
    STA    $88             ; 3
    STA    $89             ; 3
LF2D3:
    LDA    SWCHB           ; 4
    LSR                    ; 2
    BCC    LF2D3           ; 2
    JMP    LF025           ; 3
LF2DC:
    LSR                    ; 2
    BCS    LF320           ; 2
    LDA    #$00            ; 2
    STA    $86             ; 3
    JSR    LF68A           ; 6
    INC    $87             ; 5
    LDA    $87             ; 3
    CMP    #$04            ; 2
    BNE    LF2F2           ; 2
    LDA    #$00            ; 2
    STA    $87             ; 3
LF2F2:
    LDY    $87             ; 3
    INY                    ; 2
    TYA                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    CLC                    ; 2
    ADC    #$08            ; 2
    STA    $92             ; 3
    LDA    #$00            ; 2
    STA    $88             ; 3
    STA    $89             ; 3
    LDY    #$01            ; 2
    LDA    $87             ; 3
    LSR                    ; 2
    LSR                    ; 2
    BCS    LF30E           ; 2
    LDY    #$03            ; 2
LF30E:
    STY    $8F             ; 3
    LDA    #$60            ; 2
    STA    $8C             ; 3
    STA    $8B             ; 3
LF316:
    LDA    SWCHB           ; 4
    LSR                    ; 2
    LSR                    ; 2
    BCC    LF316           ; 2
    JMP    LF025           ; 3
LF320:
    LDY    #$FF            ; 2
    LSR                    ; 2
    LSR                    ; 2
    BCS    LF328           ; 2
    LDY    #$0F            ; 2
LF328:
    STY    $A5             ; 3
    LDY    #$15            ; 2
    LDA    SWCHB           ; 4
    ASL                    ; 2
    ASL                    ; 2
    BCS    LF335           ; 2
    LDY    #$10            ; 2
LF335:
    STY    $E2             ; 3
    LDA    $94             ; 3
    BEQ    LF348           ; 2
    LDA    #$07            ; 2
    STA    $86             ; 3
    JSR    LF68A           ; 6
    LDA    #$00            ; 2
    STA    $86             ; 3
    BEQ    LF34B           ; 2
LF348:
    JSR    LF68A           ; 6
LF34B:
    LDA    $8C             ; 3
    BEQ    LF36A           ; 2
    CMP    #$10            ; 2
    BEQ    LF357           ; 2
    DEC    $8C             ; 5
    BNE    LF392           ; 2
LF357:
    LDA    REFP1           ; 3
    ASL                    ; 2
    BCS    LF392           ; 2
    LDA    $86             ; 3
    BEQ    LF392           ; 2
    DEC    $86             ; 5
    BEQ    LF392           ; 2
    LDA    #$00            ; 2
    STA    $8C             ; 3
    BNE    LF392           ; 2
LF36A:
    LDA    $C9             ; 3
    BNE    LF392           ; 2
    LDA    REFP1           ; 3
    ASL                    ; 2
    BCS    LF392           ; 2
    LDY    #$04            ; 2
    LDA    $E2             ; 3
    AND    #$0F            ; 2
    BEQ    LF37D           ; 2
    LDY    #$08            ; 2
LF37D:
    TYA                    ; 2
    CLC                    ; 2
    ADC    $90             ; 3
    STA    $A1             ; 3
    LDA    $91             ; 3
    SEC                    ; 2
    SBC    #$04            ; 2
    STA    $C6             ; 3
    LDA    $8E             ; 3
    STA    $C7             ; 3
    LDA    #$50            ; 2
    STA    $C9             ; 3
LF392:
    LDA    $86             ; 3
    BEQ    LF3BC           ; 2
    LDA    $8C             ; 3
    BNE    LF3BC           ; 2
    LDA    WSYNC           ; 3
    ASL                    ; 2
    BCS    LF3AD           ; 2
    LDA    VBLANK          ; 3
    ASL                    ; 2
    BCS    LF3AD           ; 2
    LDA    $8B             ; 3
    BNE    LF3BC           ; 2
    LDA    COLUP1          ; 3
    ASL                    ; 2
    BCC    LF3BC           ; 2
LF3AD:
    LDA    #$50            ; 2
    STA    $8C             ; 3
    LDA    #$D0            ; 2
    STA    $AC             ; 3
    LDA    #$F5            ; 2
    STA    $CD             ; 3
    JMP    LF3D1           ; 3
LF3BC:
    LDA    $8C             ; 3
    BNE    LF3FA           ; 2
    LDA    $8B             ; 3
    BEQ    LF3CC           ; 2
    CMP    #$10            ; 2
    BEQ    LF3F6           ; 2
    DEC    $8B             ; 5
    BNE    LF3FA           ; 2
LF3CC:
    LDA    VSYNC           ; 3
    ASL                    ; 2
    BCS    LF3D6           ; 2
LF3D1:
    LDA    COLUP1          ; 3
    ASL                    ; 2
    BCC    LF3FA           ; 2
LF3D6:
    JSR    LF882           ; 6
    JSR    LF743           ; 6
    LDA    $C5             ; 3
    BNE    LF3FA           ; 2
    INC    $E5             ; 5
    LDA    $E5             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LF966,Y         ; 4
    STA    $8D             ; 3
    LDA    #$08            ; 2
    STA    $CA             ; 3
    LDA    #$30            ; 2
    STA    $8B             ; 3
    BNE    LF3FA           ; 2
LF3F6:
    LDA    #$00            ; 2
    STA    $CA             ; 3
LF3FA:
    INC    $B3             ; 5
    LDA    $8C             ; 3
    BNE    LF44D           ; 2
    INC    $A9             ; 5
    LDA    $8F             ; 3
    LSR                    ; 2
    AND    $A9             ; 3
    BNE    LF44D           ; 2
    LDA    $8E             ; 3
    LSR                    ; 2
    BCS    LF42E           ; 2
    DEC    $A6             ; 5
    DEC    $A6             ; 5
    INC    $A4             ; 5
    LDA    $A4             ; 3
    AND    #$07            ; 2
    STA    $AA             ; 3
    BNE    LF42B           ; 2
    SED                    ; 2
    SEC                    ; 2
    LDA    $D9             ; 3
    SBC    #$10            ; 2
    STA    $D9             ; 3
    LDA    $D8             ; 3
    SBC    #$00            ; 2
    STA    $D8             ; 3
    CLD                    ; 2
LF42B:
    JMP    LF44D           ; 3
LF42E:
    INC    $A6             ; 5
    INC    $A6             ; 5
    DEC    $A4             ; 5
    LDA    $A4             ; 3
    AND    #$07            ; 2
    STA    $AA             ; 3
    CMP    #$07            ; 2
    BNE    LF44D           ; 2
    SED                    ; 2
    CLC                    ; 2
    LDA    $D9             ; 3
    ADC    #$10            ; 2
    STA    $D9             ; 3
    LDA    $D8             ; 3
    ADC    #$00            ; 2
    STA    $D8             ; 3
    CLD                    ; 2
LF44D:
    LDA    #$FD            ; 2
    STA    $A7             ; 3
    LDA    #$FA            ; 2
    STA    $AD             ; 3
    STA    $AF             ; 3
    LDA    $AA             ; 3
    STA    $A3             ; 3
    LDA    $8F             ; 3
    LSR                    ; 2
    AND    $B3             ; 3
    BNE    LF499           ; 2
    LDY    $8E             ; 3
    LDX    $90             ; 3
    LDA    SWCHA           ; 4
    ASL                    ; 2
    BCS    LF47A           ; 2
    CPX    #$90            ; 2
    BCS    LF47A           ; 2
    INX                    ; 2
    INX                    ; 2
    TYA                    ; 2
    AND    #$03            ; 2
    ORA    #$08            ; 2
    TAY                    ; 2
    BNE    LF495           ; 2
LF47A:
    ASL                    ; 2
    BCS    LF48B           ; 2
    CPX    #$08            ; 2
    BCC    LF48B           ; 2
    DEX                    ; 2
    DEX                    ; 2
    TYA                    ; 2
    AND    #$03            ; 2
    ORA    #$04            ; 2
    TAY                    ; 2
    BNE    LF495           ; 2
LF48B:
    ASL                    ; 2
    BCS    LF490           ; 2
    LDY    #$00            ; 2
LF490:
    ASL                    ; 2
    BCS    LF495           ; 2
    LDY    #$01            ; 2
LF495:
    STY    $8E             ; 3
    STX    $90             ; 3
LF499:
    LDA    $C9             ; 3
    BEQ    LF4EB           ; 2
    CMP    #$40            ; 2
    BEQ    LF4A3           ; 2
    DEC    $C9             ; 5
LF4A3:
    LDX    $A1             ; 3
    LDY    $C6             ; 3
    LDA    $C7             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    BCC    LF4B8           ; 2
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    CPX    #$18            ; 2
    BCS    LF4DD           ; 2
    BCC    LF4E3           ; 2
LF4B8:
    LSR                    ; 2
    BCC    LF4C5           ; 2
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    CPX    #$80            ; 2
    BCC    LF4DD           ; 2
    BCS    LF4E3           ; 2
LF4C5:
    LDA    $C7             ; 3
    LSR                    ; 2
    BCC    LF4D5           ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    CPY    #$D0            ; 2
    BCC    LF4DD           ; 2
    JMP    LF4E3           ; 3
LF4D5:
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    CPY    #$68            ; 2
    BCC    LF4E3           ; 2
LF4DD:
    STX    $A1             ; 3
    STY    $C6             ; 3
    BNE    LF4EB           ; 2
LF4E3:
    LDA    #$00            ; 2
    STA    $A1             ; 3
    STA    $C6             ; 3
    STA    $C9             ; 3
LF4EB:
    LDA    $8C             ; 3
    BEQ    LF4F2           ; 2
    JMP    LF557           ; 3
LF4F2:
    LDA    $8B             ; 3
    BEQ    LF518           ; 2
    LDY    $B6             ; 3
    LDA    $8E             ; 3
    LSR                    ; 2
    BCS    LF50B           ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
LF500:
    INY                    ; 2
    CPY    #$F0            ; 2
    BCC    LF516           ; 2
    JSR    LF6EE           ; 6
    JMP    LF516           ; 3
LF50B:
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    CPY    #$11            ; 2
    BCS    LF516           ; 2
    JSR    LF6EE           ; 6
LF516:
    STY    $B6             ; 3
LF518:
    LDA    $8B             ; 3
    BNE    LF557           ; 2
    INC    $CF             ; 5
    LDA    $CF             ; 3
    AND    $8F             ; 3
    BNE    LF557           ; 2
    INC    $D0             ; 5
    LDA    $D0             ; 3
    AND    #$0F            ; 2
    BNE    LF52E           ; 2
    INC    $D4             ; 5
LF52E:
    LDA    $D4             ; 3
    AND    #$1F            ; 2
    TAY                    ; 2
    LDA    LF96E,Y         ; 4
    STA    $C5             ; 3
    LDA    LF98E,Y         ; 4
    STA    $C8             ; 3
    LDY.w  $00B5           ; 4
    CPY    $C5             ; 3
    BCS    LF546           ; 2
    INY                    ; 2
    INY                    ; 2
LF546:
    DEY                    ; 2
    STY    $B5             ; 3
    LDY    $B6             ; 3
    CPY    $C8             ; 3
    BCS    LF553           ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
LF553:
    DEY                    ; 2
    DEY                    ; 2
    STY    $B6             ; 3
LF557:
    DEC    $D6             ; 5
    BEQ    LF55E           ; 2
    JMP    LF5E2           ; 3
LF55E:
    JSR    LF6D2           ; 6
    LDY    $CD             ; 3
    CPY    #$E0            ; 2
    BCS    LF5A3           ; 2
    CPY    #$08            ; 2
    BCC    LF5A3           ; 2
    LDA    NUSIZ1          ; 3
    ASL                    ; 2
    BCS    LF5CE           ; 2
    LDA.w  $00A2           ; 4
    LDX.w  $00CB           ; 4
    BNE    LF57D           ; 2
    CLC                    ; 2
    ADC    $8A             ; 3
    BNE    LF582           ; 2
LF57D:
    SEC                    ; 2
    LDA    $A2             ; 3
    SBC    $8A             ; 3
LF582:
    STA    $A2             ; 3
    SEC                    ; 2
    LDA    #$07            ; 2
    SBC    $8A             ; 3
    AND    #$FE            ; 2
    STA    $C5             ; 3
    LDA    $D7             ; 3
    BEQ    LF59A           ; 2
    SEC                    ; 2
    LDA    $CD             ; 3
    SBC    $C5             ; 3
    STA    $CD             ; 3
    BNE    LF5E2           ; 2
LF59A:
    LDA    $C5             ; 3
    CLC                    ; 2
    ADC    $CD             ; 3
    STA    $CD             ; 3
    BNE    LF5E2           ; 2
LF5A3:
    LDA    $8B             ; 3
    ORA    $8C             ; 3
    BNE    LF5E2           ; 2
    LDY    #$01            ; 2
    LDA    $B6             ; 3
    CMP    $91             ; 3
    BCS    LF5B3           ; 2
    LDY    #$00            ; 2
LF5B3:
    STY    $D7             ; 3
    LDX    $B5             ; 3
    STX    $A2             ; 3
    LDY    $B6             ; 3
    STY    $CD             ; 3
    JSR    LF6D2           ; 6
    LDA    $D1             ; 3
    ADC    $D2             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LF9AE,Y         ; 4
    STA    $8A             ; 3
    BNE    LF5E2           ; 2
LF5CE:
    LDA.w  $00CB           ; 4
    EOR    #$01            ; 2
    STA    $CB             ; 3
    LDA    $A2             ; 3
    CMP    #$40            ; 2
    BCS    LF5DD           ; 2
    ADC    #$08            ; 2
LF5DD:
    SEC                    ; 2
    SBC    #$04            ; 2
    STA    $A2             ; 3
LF5E2:
    LDA    $8C             ; 3
    BNE    LF5F1           ; 2
    LDY    #$E0            ; 2
    LDA    $8E             ; 3
    LSR                    ; 2
    BCS    LF5EF           ; 2
    LDY    #$F0            ; 2
LF5EF:
    STY    $AC             ; 3
LF5F1:
    LDX    #$01            ; 2
    SED                    ; 2
    SEC                    ; 2
LF5F5:
    LDA    #$00            ; 2
    ADC    $D1,X           ; 4
    STA    $D1,X           ; 4
    DEX                    ; 2
    BPL    LF5F5           ; 2
    CLD                    ; 2
    JSR    LF89A           ; 6
    JSR    LF60B           ; 6
    JSR    LF62D           ; 6
    JMP    LF04F           ; 3
LF60B:
    LDA    $89             ; 3
    AND    #$F0            ; 2
    CMP    $E6             ; 3
    BNE    LF62C           ; 2
    SED                    ; 2
    LDA    $E6             ; 3
    CLC                    ; 2
    ADC    #$50            ; 2
    STA    $E6             ; 3
    CLD                    ; 2
    LDA    #$FF            ; 2
    STA    $DB             ; 3
    INC    $E4             ; 5
    LDA    $E4             ; 3
    AND    #$03            ; 2
    TAY                    ; 2
    LDA    LFB9A,Y         ; 4
    STA    $DD             ; 3
LF62C:
    RTS                    ; 6

LF62D:
    LDA    $88             ; 3
    AND    #$0F            ; 2
    CMP    $DA             ; 3
    BEQ    LF64C           ; 2
    STA    $DA             ; 3
    INC    $E3             ; 5
    LDA    $86             ; 3
    CMP    #$06            ; 2
    BEQ    LF641           ; 2
    INC    $86             ; 5
LF641:
    LDA    #$F0            ; 2
    STA    $D5             ; 3
    CLC                    ; 2
    LDA    $DC             ; 3
    ADC    #$40            ; 2
    STA    $DC             ; 3
LF64C:
    RTS                    ; 6

LF64D:
    LDA    #$20            ; 2
    LDX    #$00            ; 2
    JSR    LF7BB           ; 6
    LDA    #$50            ; 2
    LDX    #$01            ; 2
    JSR    LF7BB           ; 6
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #$2C            ; 2
    AND    $A5             ; 3
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDA    $80             ; 3
    STA    NUSIZ0          ; 3
    LDA    $81             ; 3
    STA    NUSIZ1          ; 3
    STA    HMCLR           ; 3
    LDY    #$07            ; 2
LF673:
    STA    WSYNC           ; 3
    LDA    LFBDE,Y         ; 4
    AND    $A5             ; 3
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDA    ($82),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($84),Y         ; 5
    STA    GRP1            ; 3
    DEY                    ; 2
    BPL    LF673           ; 2
    RTS                    ; 6

LF68A:
    LDA    #$FA            ; 2
    STA    $83             ; 3
    STA    $85             ; 3
    LDY    $86             ; 3
    BEQ    LF69D           ; 2
    DEY                    ; 2
    CPY    #$04            ; 2
    BCS    LF6BB           ; 2
    CPY    #$01            ; 2
    BCS    LF6A9           ; 2
LF69D:
    LDA    #$00            ; 2
    STA    $80             ; 3
    STA    $81             ; 3
    STA    $82             ; 3
    STA    $84             ; 3
    BEQ    LF6CE           ; 2
LF6A9:
    LDA    #$00            ; 2
    STA    $84             ; 3
    STA    $81             ; 3
    DEY                    ; 2
    LDA    LF6CF,Y         ; 4
    STA    $80             ; 3
    LDA    #$F0            ; 2
    STA    $82             ; 3
    BNE    LF6CE           ; 2
LF6BB:
    LDA    #$03            ; 2
    STA    $80             ; 3
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    LDA    LF6CF,Y         ; 4
    STA    $81             ; 3
    LDA    #$F0            ; 2
    STA    $82             ; 3
    STA    $84             ; 3
LF6CE:
    RTS                    ; 6

LF6CF:
    .byte $00 ; |        | $F6CF
    .byte $01 ; |       X| $F6D0
    .byte $03 ; |      XX| $F6D1
LF6D2:
    LDA    $87             ; 3
    LSR                    ; 2
    BCC    LF6DC           ; 2
    LDA    $89             ; 3
    JMP    LF6E2           ; 3
LF6DC:
    LDA    $89             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
LF6E2:
    AND    #$0F            ; 2
    CLC                    ; 2
    ADC    $DA             ; 3
    TAY                    ; 2
    LDA    LF9C6,Y         ; 4
    STA    $D6             ; 3
    RTS                    ; 6

LF6EE:
    CLC                    ; 2
    LDA    $CC             ; 3
    ADC    #$08            ; 2
    CMP    #$90            ; 2
    BCC    LF6F9           ; 2
    LDA    #$40            ; 2
LF6F9:
    STA    $CC             ; 3
    TAY                    ; 2
    STA.w  $00CA           ; 4
    LDA    ($A6),Y         ; 5
    ADC    $CC             ; 3
    AND    #$7F            ; 2
    ADC    #$10            ; 2
    STA.w  $00B5           ; 4
    LDA    #$00            ; 2
    STA    $8B             ; 3
    LDA    $D1             ; 3
    ADC    $D2             ; 3
    AND    #$1F            ; 2
    CMP    #$08            ; 2
    BCC    LF71A           ; 2
    LDA    #$05            ; 2
LF71A:
    CLC                    ; 2
    AND    #$07            ; 2
    TAY                    ; 2
    STA    $E1             ; 3
    ADC    #$20            ; 2
    STA    $B4             ; 3
    LDA    LF9B6,Y         ; 4
    STA    $D3             ; 3
    LDA    $D2             ; 3
    LSR                    ; 2
    BCS    LF731           ; 2
    LDY    #$13            ; 2
    RTS                    ; 6

LF731:
    LDY    #$EF            ; 2
    RTS                    ; 6

LF734:
    LDA    #$00            ; 2
    STA    AUDC0           ; 3
    STA    AUDC1           ; 3
    STA    AUDF0           ; 3
    STA    AUDF1           ; 3
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    RTS                    ; 6

LF743:
    LDA    $B4             ; 3
    AND    #$0F            ; 2
    CMP    #$00            ; 2
    BEQ    LF788           ; 2
    CMP    #$05            ; 2
    BEQ    LF788           ; 2
    CMP    #$07            ; 2
    BEQ    LF788           ; 2
    STA    $C5             ; 3
    LDA    $B5             ; 3
    CLC                    ; 2
    ADC    #$0B            ; 2
    CMP    $A1             ; 3
    BCC    LF775           ; 2
    LDA    $C5             ; 3
    LSR                    ; 2
    BCC    LF767           ; 2
    LDA    #$10            ; 2
    BNE    LF770           ; 2
LF767:
    LSR                    ; 2
    BCC    LF76E           ; 2
    LDA    #$20            ; 2
    BNE    LF770           ; 2
LF76E:
    LDA    #$40            ; 2
LF770:
    CLC                    ; 2
    ADC    $B5             ; 3
    STA    $B5             ; 3
LF775:
    LDA    $C5             ; 3
    LSR                    ; 2
    AND    $C5             ; 3
    TAY                    ; 2
    CLC                    ; 2
    ADC    #$20            ; 2
    STA    $B4             ; 3
    STA    $C5             ; 3
    LDA    LF9B6,Y         ; 4
    STA    $D3             ; 3
    RTS                    ; 6

LF788:
    LDA    #$00            ; 2
    STA    $C5             ; 3
    RTS                    ; 6

LF78D:
    LDA    $A8             ; 3
    STA    WSYNC           ; 3
    CMP    $B6             ; 3
    BNE    LF799           ; 2
    LDA    #$07            ; 2
    STA    $B1             ; 3
LF799:
    LDY    $B1             ; 3
    BEQ    LF79F           ; 2
    DEC    $B1             ; 5
LF79F:
    LDA    LFBE6,Y         ; 4
    ORA    $8D             ; 3
    AND    $A5             ; 3
    STA    COLUP1          ; 3
    LDA    ($AE),Y         ; 5
    STA    GRP1            ; 3
    JSR    LF7B2           ; 6
    DEC    $A8             ; 5
    RTS                    ; 6

LF7B2:
    STA    WSYNC           ; 3
    LDY    $A8             ; 3
    LDA    ($A6),Y         ; 5
    STA    PF0             ; 3
    RTS                    ; 6

LF7BB:
    CLC                    ; 2
    ADC    #$2E            ; 2
    TAY                    ; 2
    AND    #$0F            ; 2
    STA.w  $00A0           ; 4
    TYA                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    CLC                    ; 2
    ADC.w  $00A0           ; 4
    CMP    #$0F            ; 2
    BCC    LF7D5           ; 2
    SBC    #$0F            ; 2
    INY                    ; 2
LF7D5:
    EOR    #$07            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    HMP0,X          ; 4
    STA    WSYNC           ; 3
LF7DF:
    DEY                    ; 2
    BPL    LF7DF           ; 2
    STA    RESP0,X         ; 4
    RTS                    ; 6

LF7E5:
    LDA    INTIM           ; 4
    BNE    LF7E5           ; 2
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

LF803:
    LDA    #$82            ; 2
    STA    WSYNC           ; 3
    STA    VBLANK          ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    VSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    VSYNC           ; 3
    RTS                    ; 6

LF81C:
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    STA    PF0             ; 3
    LDA    #$38            ; 2
    LDX    #$00            ; 2
    JSR    LF7BB           ; 6
    LDA    #$40            ; 2
    LDX    #$01            ; 2
    JSR    LF7BB           ; 6
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #$03            ; 2
    STA    NUSIZ0          ; 3
    LDA    #$01            ; 2
    STA    NUSIZ1          ; 3
    LDA    $DC             ; 3
    AND    $A5             ; 3
    STA    COLUP1          ; 3
    STA    COLUP0          ; 3
    LDY    #$07            ; 2
    STY    $C5             ; 3
    NOP                    ; 2
    NOP                    ; 2
    STA    HMCLR           ; 3
LF852:
    LDY    $C5             ; 3
    LDA    ($92),Y         ; 5
    STA    $A0             ; 3
    STA    WSYNC           ; 3
    LDA    ($BB),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($BD),Y         ; 5
    STA    GRP1            ; 3
    NOP                    ; 2
    NOP                    ; 2
    LDA    ($C1),Y         ; 5
    TAX                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    LDA    ($BF),Y         ; 5
    LDY    $A0             ; 3
    STA.w  $001B           ; 4
    STX    GRP1            ; 3
    STY    GRP0            ; 3
    DEC    $C5             ; 5
    BPL    LF852           ; 2
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    RTS                    ; 6

LF882:
    LDA    $B4             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LF9BE,Y         ; 4
    CLC                    ; 2
    LDX    #$01            ; 2
    SED                    ; 2
LF88E:
    ADC.wx $0088,X         ; 4
    STA    $88,X           ; 4
    LDA    #$00            ; 2
    DEX                    ; 2
    BPL    LF88E           ; 2
    CLD                    ; 2
    RTS                    ; 6

LF89A:
    LDA    $88             ; 3
    STA    $B8             ; 3
    LDA    $89             ; 3
    STA    $B9             ; 3
    LDX    #$01            ; 2
    LDY    #$04            ; 2
LF8A6:
    LDA    $B8,X           ; 4
    AND    #$F0            ; 2
    LSR                    ; 2
    ADC    #$08            ; 2
    STA.wy $00BB,Y         ; 5
    LDA    $B8,X           ; 4
    AND    #$0F            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ADC    #$08            ; 2
    STA.wy $00BD,Y         ; 5
    LDA    #$FB            ; 2
    STA.wy $00BC,Y         ; 5
    STA.wy $00BE,Y         ; 5
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEX                    ; 2
    BPL    LF8A6           ; 2
    LDA    #$FB            ; 2
    STA    $93             ; 3
    LDX    #$00            ; 2
LF8D1:
    LDA    $BB,X           ; 4
    CMP    #$08            ; 2
    BNE    LF8E1           ; 2
    LDA    #$00            ; 2
    STA    $BB,X           ; 4
    INX                    ; 2
    INX                    ; 2
    CMP    #$08            ; 2
    BNE    LF8D1           ; 2
LF8E1:
    RTS                    ; 6

LF8E2:
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    STA    PF0             ; 3
    LDA    #$20            ; 2
    LDX    #$00            ; 2
    JSR    LF7BB           ; 6
    LDA    #$28            ; 2
    LDX    #$01            ; 2
    JSR    LF7BB           ; 6
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #$01            ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDA    #$0C            ; 2
    STA    COLUP1          ; 3
    STA    COLUP0          ; 3
    LDX    #$08            ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    STA    HMCLR           ; 3
LF914:
    STA    WSYNC           ; 3
    LDA    LF936,X         ; 4
    STA    GRP0            ; 3
    LDA    LF93F,X         ; 4
    STA    GRP1            ; 3
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    LDA    LF951,X         ; 4
    TAY                    ; 2
    LDA    LF948,X         ; 4
    STA    GRP0            ; 3
    STY    GRP1            ; 3
    STA    HMCLR           ; 3
    DEX                    ; 2
    BPL    LF914           ; 2
    RTS                    ; 6

LF936:
    .byte $00 ; |        | $F936
    .byte $38 ; |  XXX   | $F937
    .byte $38 ; |  XXX   | $F938
    .byte $3E ; |  XXXXX | $F939
    .byte $3E ; |  XXXXX | $F93A
    .byte $3A ; |  XXX X | $F93B
    .byte $7A ; | XXXX X | $F93C
    .byte $7E ; | XXXXXX | $F93D
    .byte $7E ; | XXXXXX | $F93E
LF93F:
    .byte $00 ; |        | $F93F
    .byte $FB ; |XXXXX XX| $F940
    .byte $FB ; |XXXXX XX| $F941
    .byte $FB ; |XXXXX XX| $F942
    .byte $E9 ; |XXX X  X| $F943
    .byte $E8 ; |XXX X   | $F944
    .byte $E8 ; |XXX X   | $F945
    .byte $EB ; |XXX X XX| $F946
    .byte $EB ; |XXX X XX| $F947
LF948:
    .byte $00 ; |        | $F948
    .byte $EF ; |XXX XXXX| $F949
    .byte $EF ; |XXX XXXX| $F94A
    .byte $EF ; |XXX XXXX| $F94B
    .byte $04 ; |     X  | $F94C
    .byte $82 ; |X     X | $F94D
    .byte $41 ; | X     X| $F94E
    .byte $EF ; |XXX XXXX| $F94F
    .byte $EF ; |XXX XXXX| $F950
LF951:
    .byte $00 ; |        | $F951
    .byte $8C ; |X   XX  | $F952
    .byte $8C ; |X   XX  | $F953
    .byte $BC ; |X XXXX  | $F954
    .byte $3E ; |  XXXXX | $F955
    .byte $3A ; |  XXX X | $F956
    .byte $3A ; |  XXX X | $F957
    .byte $BA ; |X XXX X | $F958
    .byte $BA ; |X XXX X | $F959
LF95A:
    .byte $0C ; |    XX  | $F95A
    .byte $07 ; |     XXX| $F95B
    .byte $04 ; |     X  | $F95C
    .byte $01 ; |       X| $F95D
LF95E:
    .byte $00 ; |        | $F95E
    .byte $01 ; |       X| $F95F
    .byte $02 ; |      X | $F960
    .byte $03 ; |      XX| $F961
    .byte $04 ; |     X  | $F962
    .byte $03 ; |      XX| $F963
    .byte $02 ; |      X | $F964
    .byte $01 ; |       X| $F965
LF966:
    .byte $38 ; |  XXX   | $F966
    .byte $18 ; |   XX   | $F967
    .byte $0E ; |    XXX | $F968
    .byte $2E ; |  X XXX | $F969
    .byte $5A ; | X XX X | $F96A
    .byte $4C ; | X  XX  | $F96B
    .byte $8A ; |X   X X | $F96C
    .byte $AA ; |X X X X | $F96D
LF96E:
    .byte $6A ; | XX X X | $F96E
    .byte $48 ; | X  X   | $F96F
    .byte $34 ; |  XX X  | $F970
    .byte $16 ; |   X XX | $F971
    .byte $08 ; |    X   | $F972
    .byte $06 ; |     XX | $F973
    .byte $5D ; | X XXX X| $F974
    .byte $74 ; | XXX X  | $F975
    .byte $82 ; |X     X | $F976
    .byte $6C ; | XX XX  | $F977
    .byte $4F ; | X  XXXX| $F978
    .byte $3D ; |  XXXX X| $F979
    .byte $38 ; |  XXX   | $F97A
    .byte $48 ; | X  X   | $F97B
    .byte $5A ; | X XX X | $F97C
    .byte $32 ; |  XX  X | $F97D
    .byte $36 ; |  XX XX | $F97E
    .byte $1A ; |   XX X | $F97F
    .byte $05 ; |     X X| $F980
    .byte $24 ; |  X  X  | $F981
    .byte $12 ; |   X  X | $F982
    .byte $44 ; | X   X  | $F983
    .byte $64 ; | XX  X  | $F984
    .byte $5A ; | X XX X | $F985
    .byte $7C ; | XXXXX  | $F986
    .byte $6A ; | XX X X | $F987
    .byte $86 ; |X    XX | $F988
    .byte $3F ; |  XXXXXX| $F989
    .byte $93 ; |X  X  XX| $F98A
    .byte $6A ; | XX X X | $F98B
    .byte $5F ; | X XXXXX| $F98C
    .byte $44 ; | X   X  | $F98D
LF98E:
    .byte $1A ; |   XX X | $F98E
    .byte $24 ; |  X  X  | $F98F
    .byte $42 ; | X    X | $F990
    .byte $74 ; | XXX X  | $F991
    .byte $B3 ; |X XX  XX| $F992
    .byte $DE ; |XX XXXX | $F993
    .byte $EC ; |XXX XX  | $F994
    .byte $E2 ; |XXX   X | $F995
    .byte $86 ; |X    XX | $F996
    .byte $70 ; | XXX    | $F997
    .byte $52 ; | X X  X | $F998
    .byte $6D ; | XX XX X| $F999
    .byte $B4 ; |X XX X  | $F99A
    .byte $C6 ; |XX   XX | $F99B
    .byte $C0 ; |XX      | $F99C
    .byte $A0 ; |X X     | $F99D
    .byte $C6 ; |XX   XX | $F99E
    .byte $E2 ; |XXX   X | $F99F
    .byte $B8 ; |X XXX   | $F9A0
    .byte $64 ; | XX  X  | $F9A1
    .byte $38 ; |  XXX   | $F9A2
    .byte $22 ; |  X   X | $F9A3
    .byte $44 ; | X   X  | $F9A4
    .byte $88 ; |X   X   | $F9A5
    .byte $54 ; | X X X  | $F9A6
    .byte $78 ; | XXXX   | $F9A7
    .byte $A4 ; |X X  X  | $F9A8
    .byte $C1 ; |XX     X| $F9A9
    .byte $D8 ; |XX XX   | $F9AA
    .byte $C8 ; |XX  X   | $F9AB
    .byte $C1 ; |XX     X| $F9AC
    .byte $92 ; |X  X  X | $F9AD
LF9AE:
    .byte $02 ; |      X | $F9AE
    .byte $01 ; |       X| $F9AF
    .byte $03 ; |      XX| $F9B0
    .byte $05 ; |     X X| $F9B1
    .byte $03 ; |      XX| $F9B2
    .byte $04 ; |     X  | $F9B3
    .byte $04 ; |     X  | $F9B4
    .byte $01 ; |       X| $F9B5
LF9B6:
    .byte $2E ; |  X XXX | $F9B6
    .byte $C8 ; |XX  X   | $F9B7
    .byte $C8 ; |XX  X   | $F9B8
    .byte $64 ; | XX  X  | $F9B9
    .byte $C8 ; |XX  X   | $F9BA
    .byte $2E ; |  X XXX | $F9BB
    .byte $64 ; | XX  X  | $F9BC
    .byte $BA ; |X XXX X | $F9BD
LF9BE:
    .byte $03 ; |      XX| $F9BE
    .byte $05 ; |     X X| $F9BF
    .byte $05 ; |     X X| $F9C0
    .byte $08 ; |    X   | $F9C1
    .byte $05 ; |     X X| $F9C2
    .byte $03 ; |      XX| $F9C3
    .byte $08 ; |    X   | $F9C4
    .byte $04 ; |     X  | $F9C5
LF9C6:
    .byte $07 ; |     XXX| $F9C6
    .byte $06 ; |     XX | $F9C7
    .byte $05 ; |     X X| $F9C8
    .byte $05 ; |     X X| $F9C9
    .byte $04 ; |     X  | $F9CA
    .byte $04 ; |     X  | $F9CB
    .byte $03 ; |      XX| $F9CC
    .byte $03 ; |      XX| $F9CD
    .byte $02 ; |      X | $F9CE
    .byte $01 ; |       X| $F9CF
    .byte $03 ; |      XX| $F9D0
    .byte $04 ; |     X  | $F9D1
    .byte $05 ; |     X X| $F9D2
    .byte $01 ; |       X| $F9D3
    .byte $04 ; |     X  | $F9D4
    .byte $02 ; |      X | $F9D5
    .byte $FF ; |XXXXXXXX| $F9D6
    .byte $FF ; |XXXXXXXX| $F9D7
    .byte $FF ; |XXXXXXXX| $F9D8
    .byte $FF ; |XXXXXXXX| $F9D9
    .byte $FF ; |XXXXXXXX| $F9DA
    .byte $FF ; |XXXXXXXX| $F9DB
    .byte $FF ; |XXXXXXXX| $F9DC
    .byte $FF ; |XXXXXXXX| $F9DD
    .byte $FF ; |XXXXXXXX| $F9DE
    .byte $FF ; |XXXXXXXX| $F9DF
    .byte $FF ; |XXXXXXXX| $F9E0
    .byte $FF ; |XXXXXXXX| $F9E1
    .byte $FF ; |XXXXXXXX| $F9E2
    .byte $FF ; |XXXXXXXX| $F9E3
    .byte $FF ; |XXXXXXXX| $F9E4
    .byte $FF ; |XXXXXXXX| $F9E5
    .byte $FF ; |XXXXXXXX| $F9E6
    .byte $FF ; |XXXXXXXX| $F9E7
    .byte $FF ; |XXXXXXXX| $F9E8
    .byte $FF ; |XXXXXXXX| $F9E9
    .byte $FF ; |XXXXXXXX| $F9EA
    .byte $FF ; |XXXXXXXX| $F9EB
    .byte $FF ; |XXXXXXXX| $F9EC
    .byte $FF ; |XXXXXXXX| $F9ED
    .byte $FF ; |XXXXXXXX| $F9EE
    .byte $FF ; |XXXXXXXX| $F9EF
    .byte $FF ; |XXXXXXXX| $F9F0
    .byte $FF ; |XXXXXXXX| $F9F1
    .byte $FF ; |XXXXXXXX| $F9F2
    .byte $FF ; |XXXXXXXX| $F9F3
    .byte $FF ; |XXXXXXXX| $F9F4
    .byte $FF ; |XXXXXXXX| $F9F5
    .byte $FF ; |XXXXXXXX| $F9F6
    .byte $FF ; |XXXXXXXX| $F9F7
    .byte $FF ; |XXXXXXXX| $F9F8
    .byte $FF ; |XXXXXXXX| $F9F9
    .byte $FF ; |XXXXXXXX| $F9FA
    .byte $FF ; |XXXXXXXX| $F9FB
    .byte $FF ; |XXXXXXXX| $F9FC
    .byte $FF ; |XXXXXXXX| $F9FD
    .byte $FF ; |XXXXXXXX| $F9FE
    .byte $FF ; |XXXXXXXX| $F9FF
    .byte $00 ; |        | $FA00
    .byte $00 ; |        | $FA01
    .byte $00 ; |        | $FA02
    .byte $00 ; |        | $FA03
    .byte $00 ; |        | $FA04
    .byte $00 ; |        | $FA05
    .byte $00 ; |        | $FA06
    .byte $00 ; |        | $FA07
    .byte $00 ; |        | $FA08
    .byte $00 ; |        | $FA09
    .byte $44 ; | X   X  | $FA0A
    .byte $00 ; |        | $FA0B
    .byte $20 ; |  X     | $FA0C
    .byte $01 ; |       X| $FA0D
    .byte $44 ; | X   X  | $FA0E
    .byte $00 ; |        | $FA0F
    .byte $FF ; |XXXXXXXX| $FA10
    .byte $FF ; |XXXXXXXX| $FA11
    .byte $FF ; |XXXXXXXX| $FA12
    .byte $FF ; |XXXXXXXX| $FA13
    .byte $FF ; |XXXXXXXX| $FA14
    .byte $FF ; |XXXXXXXX| $FA15
    .byte $FF ; |XXXXXXXX| $FA16
    .byte $FF ; |XXXXXXXX| $FA17
    .byte $FF ; |XXXXXXXX| $FA18
    .byte $FF ; |XXXXXXXX| $FA19
    .byte $FF ; |XXXXXXXX| $FA1A
    .byte $FF ; |XXXXXXXX| $FA1B
    .byte $FF ; |XXXXXXXX| $FA1C
    .byte $FF ; |XXXXXXXX| $FA1D
    .byte $FF ; |XXXXXXXX| $FA1E
    .byte $FF ; |XXXXXXXX| $FA1F
    .byte $FF ; |XXXXXXXX| $FA20
    .byte $FF ; |XXXXXXXX| $FA21
    .byte $FF ; |XXXXXXXX| $FA22
    .byte $FF ; |XXXXXXXX| $FA23
    .byte $FF ; |XXXXXXXX| $FA24
    .byte $FF ; |XXXXXXXX| $FA25
    .byte $FF ; |XXXXXXXX| $FA26
    .byte $FF ; |XXXXXXXX| $FA27
    .byte $FF ; |XXXXXXXX| $FA28
    .byte $FF ; |XXXXXXXX| $FA29
    .byte $FF ; |XXXXXXXX| $FA2A
    .byte $FF ; |XXXXXXXX| $FA2B
    .byte $FF ; |XXXXXXXX| $FA2C
    .byte $FF ; |XXXXXXXX| $FA2D
    .byte $FF ; |XXXXXXXX| $FA2E
    .byte $FF ; |XXXXXXXX| $FA2F
    .byte $FF ; |XXXXXXXX| $FA30
    .byte $FF ; |XXXXXXXX| $FA31
    .byte $FF ; |XXXXXXXX| $FA32
    .byte $FF ; |XXXXXXXX| $FA33
    .byte $FF ; |XXXXXXXX| $FA34
    .byte $FF ; |XXXXXXXX| $FA35
    .byte $FF ; |XXXXXXXX| $FA36
    .byte $FF ; |XXXXXXXX| $FA37
    .byte $FF ; |XXXXXXXX| $FA38
    .byte $FF ; |XXXXXXXX| $FA39
    .byte $FF ; |XXXXXXXX| $FA3A
    .byte $FF ; |XXXXXXXX| $FA3B
    .byte $FF ; |XXXXXXXX| $FA3C
    .byte $FF ; |XXXXXXXX| $FA3D
    .byte $FF ; |XXXXXXXX| $FA3E
    .byte $FF ; |XXXXXXXX| $FA3F
    .byte $00 ; |        | $FA40
    .byte $00 ; |        | $FA41
    .byte $24 ; |  X  X  | $FA42
    .byte $5A ; | X XX X | $FA43
    .byte $99 ; |X  XX  X| $FA44
    .byte $42 ; | X    X | $FA45
    .byte $24 ; |  X  X  | $FA46
    .byte $18 ; |   XX   | $FA47
    .byte $00 ; |        | $FA48
    .byte $10 ; |   X    | $FA49
    .byte $44 ; | X   X  | $FA4A
    .byte $28 ; |  X X   | $FA4B
    .byte $92 ; |X  X  X | $FA4C
    .byte $28 ; |  X X   | $FA4D
    .byte $44 ; | X   X  | $FA4E
    .byte $10 ; |   X    | $FA4F
    .byte $00 ; |        | $FA50
    .byte $63 ; | XX   XX| $FA51
    .byte $22 ; |  X   X | $FA52
    .byte $14 ; |   X X  | $FA53
    .byte $08 ; |    X   | $FA54
    .byte $55 ; | X X X X| $FA55
    .byte $36 ; |  XX XX | $FA56
    .byte $08 ; |    X   | $FA57
    .byte $00 ; |        | $FA58
    .byte $10 ; |   X    | $FA59
    .byte $28 ; |  X X   | $FA5A
    .byte $44 ; | X   X  | $FA5B
    .byte $D6 ; |XX X XX | $FA5C
    .byte $28 ; |  X X   | $FA5D
    .byte $6C ; | XX XX  | $FA5E
    .byte $00 ; |        | $FA5F
    .byte $00 ; |        | $FA60
    .byte $24 ; |  X  X  | $FA61
    .byte $00 ; |        | $FA62
    .byte $5A ; | X XX X | $FA63
    .byte $5A ; | X XX X | $FA64
    .byte $81 ; |X      X| $FA65
    .byte $18 ; |   XX   | $FA66
    .byte $24 ; |  X  X  | $FA67
    .byte $00 ; |        | $FA68
    .byte $10 ; |   X    | $FA69
    .byte $38 ; |  XXX   | $FA6A
    .byte $54 ; | X X X  | $FA6B
    .byte $FE ; |XXXXXXX | $FA6C
    .byte $10 ; |   X    | $FA6D
    .byte $38 ; |  XXX   | $FA6E
    .byte $7C ; | XXXXX  | $FA6F
    .byte $00 ; |        | $FA70
    .byte $00 ; |        | $FA71
    .byte $18 ; |   XX   | $FA72
    .byte $24 ; |  X  X  | $FA73
    .byte $18 ; |   XX   | $FA74
    .byte $24 ; |  X  X  | $FA75
    .byte $81 ; |X      X| $FA76
    .byte $66 ; | XX  XX | $FA77
    .byte $00 ; |        | $FA78
    .byte $0C ; |    XX  | $FA79
    .byte $18 ; |   XX   | $FA7A
    .byte $0C ; |    XX  | $FA7B
    .byte $36 ; |  XX XX | $FA7C
    .byte $49 ; | X  X  X| $FA7D
    .byte $49 ; | X  X  X| $FA7E
    .byte $22 ; |  X   X | $FA7F
    .byte $00 ; |        | $FA80
    .byte $42 ; | X    X | $FA81
    .byte $5A ; | X XX X | $FA82
    .byte $24 ; |  X  X  | $FA83
    .byte $42 ; | X    X | $FA84
    .byte $81 ; |X      X| $FA85
    .byte $5A ; | X XX X | $FA86
    .byte $24 ; |  X  X  | $FA87
    .byte $00 ; |        | $FA88
    .byte $28 ; |  X X   | $FA89
    .byte $44 ; | X   X  | $FA8A
    .byte $92 ; |X  X  X | $FA8B
    .byte $92 ; |X  X  X | $FA8C
    .byte $6C ; | XX XX  | $FA8D
    .byte $10 ; |   X    | $FA8E
    .byte $28 ; |  X X   | $FA8F
    .byte $00 ; |        | $FA90
    .byte $00 ; |        | $FA91
    .byte $00 ; |        | $FA92
    .byte $00 ; |        | $FA93
    .byte $00 ; |        | $FA94
    .byte $00 ; |        | $FA95
    .byte $00 ; |        | $FA96
    .byte $00 ; |        | $FA97
    .byte $00 ; |        | $FA98
    .byte $00 ; |        | $FA99
    .byte $00 ; |        | $FA9A
    .byte $00 ; |        | $FA9B
    .byte $00 ; |        | $FA9C
    .byte $00 ; |        | $FA9D
    .byte $00 ; |        | $FA9E
    .byte $00 ; |        | $FA9F
    .byte $00 ; |        | $FAA0
    .byte $00 ; |        | $FAA1
    .byte $00 ; |        | $FAA2
    .byte $00 ; |        | $FAA3
    .byte $00 ; |        | $FAA4
    .byte $00 ; |        | $FAA5
    .byte $00 ; |        | $FAA6
    .byte $00 ; |        | $FAA7
    .byte $00 ; |        | $FAA8
    .byte $00 ; |        | $FAA9
    .byte $00 ; |        | $FAAA
    .byte $00 ; |        | $FAAB
    .byte $00 ; |        | $FAAC
    .byte $00 ; |        | $FAAD
    .byte $00 ; |        | $FAAE
    .byte $00 ; |        | $FAAF
    .byte $00 ; |        | $FAB0
    .byte $00 ; |        | $FAB1
    .byte $00 ; |        | $FAB2
    .byte $00 ; |        | $FAB3
    .byte $00 ; |        | $FAB4
    .byte $00 ; |        | $FAB5
    .byte $00 ; |        | $FAB6
    .byte $00 ; |        | $FAB7
    .byte $00 ; |        | $FAB8
    .byte $00 ; |        | $FAB9
    .byte $00 ; |        | $FABA
    .byte $00 ; |        | $FABB
    .byte $00 ; |        | $FABC
    .byte $00 ; |        | $FABD
    .byte $00 ; |        | $FABE
    .byte $00 ; |        | $FABF
    .byte $00 ; |        | $FAC0
    .byte $00 ; |        | $FAC1
    .byte $00 ; |        | $FAC2
    .byte $00 ; |        | $FAC3
    .byte $00 ; |        | $FAC4
    .byte $00 ; |        | $FAC5
    .byte $00 ; |        | $FAC6
    .byte $00 ; |        | $FAC7
    .byte $00 ; |        | $FAC8
    .byte $00 ; |        | $FAC9
    .byte $00 ; |        | $FACA
    .byte $00 ; |        | $FACB
    .byte $00 ; |        | $FACC
    .byte $00 ; |        | $FACD
    .byte $00 ; |        | $FACE
    .byte $00 ; |        | $FACF
    .byte $00 ; |        | $FAD0
    .byte $10 ; |   X    | $FAD1
    .byte $56 ; | X X XX | $FAD2
    .byte $38 ; |  XXX   | $FAD3
    .byte $5E ; | X XXXX | $FAD4
    .byte $64 ; | XX  X  | $FAD5
    .byte $60 ; | XX     | $FAD6
    .byte $10 ; |   X    | $FAD7
    .byte $00 ; |        | $FAD8
    .byte $10 ; |   X    | $FAD9
    .byte $56 ; | X X XX | $FADA
    .byte $38 ; |  XXX   | $FADB
    .byte $5E ; | X XXXX | $FADC
    .byte $64 ; | XX  X  | $FADD
    .byte $00 ; |        | $FADE
    .byte $00 ; |        | $FADF
    .byte $00 ; |        | $FAE0
    .byte $D6 ; |XX X XX | $FAE1
    .byte $10 ; |   X    | $FAE2
    .byte $28 ; |  X X   | $FAE3
    .byte $54 ; | X X X  | $FAE4
    .byte $C6 ; |XX   XX | $FAE5
    .byte $38 ; |  XXX   | $FAE6
    .byte $10 ; |   X    | $FAE7
    .byte $00 ; |        | $FAE8
    .byte $D6 ; |XX X XX | $FAE9
    .byte $10 ; |   X    | $FAEA
    .byte $28 ; |  X X   | $FAEB
    .byte $54 ; | X X X  | $FAEC
    .byte $C6 ; |XX   XX | $FAED
    .byte $38 ; |  XXX   | $FAEE
    .byte $10 ; |   X    | $FAEF
    .byte $00 ; |        | $FAF0
    .byte $10 ; |   X    | $FAF1
    .byte $38 ; |  XXX   | $FAF2
    .byte $C6 ; |XX   XX | $FAF3
    .byte $54 ; | X X X  | $FAF4
    .byte $28 ; |  X X   | $FAF5
    .byte $10 ; |   X    | $FAF6
    .byte $D6 ; |XX X XX | $FAF7
    .byte $00 ; |        | $FAF8
    .byte $3C ; |  XXXX  | $FAF9
    .byte $A5 ; |X X  X X| $FAFA
    .byte $66 ; | XX  XX | $FAFB
    .byte $5A ; | X XX X | $FAFC
    .byte $E7 ; |XXX  XXX| $FAFD
    .byte $3C ; |  XXXX  | $FAFE
    .byte $08 ; |    X   | $FAFF
    .byte $00 ; |        | $FB00
    .byte $00 ; |        | $FB01
    .byte $00 ; |        | $FB02
    .byte $00 ; |        | $FB03
    .byte $00 ; |        | $FB04
    .byte $00 ; |        | $FB05
    .byte $00 ; |        | $FB06
    .byte $00 ; |        | $FB07
    .byte $3C ; |  XXXX  | $FB08
    .byte $66 ; | XX  XX | $FB09
    .byte $66 ; | XX  XX | $FB0A
    .byte $66 ; | XX  XX | $FB0B
    .byte $66 ; | XX  XX | $FB0C
    .byte $66 ; | XX  XX | $FB0D
    .byte $66 ; | XX  XX | $FB0E
    .byte $3C ; |  XXXX  | $FB0F
    .byte $3C ; |  XXXX  | $FB10
    .byte $18 ; |   XX   | $FB11
    .byte $18 ; |   XX   | $FB12
    .byte $18 ; |   XX   | $FB13
    .byte $18 ; |   XX   | $FB14
    .byte $18 ; |   XX   | $FB15
    .byte $38 ; |  XXX   | $FB16
    .byte $18 ; |   XX   | $FB17
    .byte $7E ; | XXXXXX | $FB18
    .byte $60 ; | XX     | $FB19
    .byte $60 ; | XX     | $FB1A
    .byte $3C ; |  XXXX  | $FB1B
    .byte $06 ; |     XX | $FB1C
    .byte $06 ; |     XX | $FB1D
    .byte $46 ; | X   XX | $FB1E
    .byte $3C ; |  XXXX  | $FB1F
    .byte $3C ; |  XXXX  | $FB20
    .byte $46 ; | X   XX | $FB21
    .byte $06 ; |     XX | $FB22
    .byte $0C ; |    XX  | $FB23
    .byte $0C ; |    XX  | $FB24
    .byte $06 ; |     XX | $FB25
    .byte $46 ; | X   XX | $FB26
    .byte $3C ; |  XXXX  | $FB27
    .byte $0C ; |    XX  | $FB28
    .byte $0C ; |    XX  | $FB29
    .byte $0C ; |    XX  | $FB2A
    .byte $7E ; | XXXXXX | $FB2B
    .byte $4C ; | X  XX  | $FB2C
    .byte $2C ; |  X XX  | $FB2D
    .byte $1C ; |   XXX  | $FB2E
    .byte $0C ; |    XX  | $FB2F
    .byte $7C ; | XXXXX  | $FB30
    .byte $46 ; | X   XX | $FB31
    .byte $06 ; |     XX | $FB32
    .byte $06 ; |     XX | $FB33
    .byte $7C ; | XXXXX  | $FB34
    .byte $60 ; | XX     | $FB35
    .byte $60 ; | XX     | $FB36
    .byte $7E ; | XXXXXX | $FB37
    .byte $3C ; |  XXXX  | $FB38
    .byte $66 ; | XX  XX | $FB39
    .byte $66 ; | XX  XX | $FB3A
    .byte $66 ; | XX  XX | $FB3B
    .byte $7C ; | XXXXX  | $FB3C
    .byte $60 ; | XX     | $FB3D
    .byte $62 ; | XX   X | $FB3E
    .byte $3C ; |  XXXX  | $FB3F
    .byte $18 ; |   XX   | $FB40
    .byte $18 ; |   XX   | $FB41
    .byte $18 ; |   XX   | $FB42
    .byte $18 ; |   XX   | $FB43
    .byte $0C ; |    XX  | $FB44
    .byte $06 ; |     XX | $FB45
    .byte $42 ; | X    X | $FB46
    .byte $7E ; | XXXXXX | $FB47
    .byte $3C ; |  XXXX  | $FB48
    .byte $66 ; | XX  XX | $FB49
    .byte $66 ; | XX  XX | $FB4A
    .byte $3C ; |  XXXX  | $FB4B
    .byte $3C ; |  XXXX  | $FB4C
    .byte $66 ; | XX  XX | $FB4D
    .byte $66 ; | XX  XX | $FB4E
    .byte $3C ; |  XXXX  | $FB4F
    .byte $3C ; |  XXXX  | $FB50
    .byte $46 ; | X   XX | $FB51
    .byte $06 ; |     XX | $FB52
    .byte $3E ; |  XXXXX | $FB53
    .byte $66 ; | XX  XX | $FB54
    .byte $66 ; | XX  XX | $FB55
    .byte $66 ; | XX  XX | $FB56
    .byte $3C ; |  XXXX  | $FB57
    .byte $FF ; |XXXXXXXX| $FB58
    .byte $FF ; |XXXXXXXX| $FB59
    .byte $FF ; |XXXXXXXX| $FB5A
    .byte $FF ; |XXXXXXXX| $FB5B
    .byte $FF ; |XXXXXXXX| $FB5C
    .byte $FF ; |XXXXXXXX| $FB5D
    .byte $FF ; |XXXXXXXX| $FB5E
    .byte $FF ; |XXXXXXXX| $FB5F
LFB60:
    .byte $FF ; |XXXXXXXX| $FB60
    .byte $FF ; |XXXXXXXX| $FB61
    .byte $FF ; |XXXXXXXX| $FB62
    .byte $FF ; |XXXXXXXX| $FB63
    .byte $AA ; |X X X X | $FB64
    .byte $AA ; |X X X X | $FB65
    .byte $AA ; |X X X X | $FB66
    .byte $AA ; |X X X X | $FB67
    .byte $CC ; |XX  XX  | $FB68
    .byte $CC ; |XX  XX  | $FB69
    .byte $CC ; |XX  XX  | $FB6A
    .byte $CC ; |XX  XX  | $FB6B
    .byte $88 ; |X   X   | $FB6C
    .byte $88 ; |X   X   | $FB6D
    .byte $88 ; |X   X   | $FB6E
    .byte $88 ; |X   X   | $FB6F
LFB70:
    .byte $07 ; |     XXX| $FB70
    .byte $01 ; |       X| $FB71
    .byte $0A ; |    X X | $FB72
    .byte $04 ; |     X  | $FB73
    .byte $09 ; |    X  X| $FB74
    .byte $0C ; |    XX  | $FB75
    .byte $05 ; |     X X| $FB76
    .byte $08 ; |    X   | $FB77
LFB78:
    .byte $1B ; |   XX XX| $FB78
    .byte $16 ; |   X XX | $FB79
    .byte $12 ; |   X  X | $FB7A
    .byte $10 ; |   X    | $FB7B
    .byte $14 ; |   X X  | $FB7C
    .byte $12 ; |   X  X | $FB7D
    .byte $14 ; |   X X  | $FB7E
    .byte $16 ; |   X XX | $FB7F
    .byte $14 ; |   X X  | $FB80
    .byte $12 ; |   X  X | $FB81
    .byte $12 ; |   X  X | $FB82
    .byte $10 ; |   X    | $FB83
    .byte $14 ; |   X X  | $FB84
    .byte $10 ; |   X    | $FB85
    .byte $14 ; |   X X  | $FB86
    .byte $10 ; |   X    | $FB87
    .byte $14 ; |   X X  | $FB88
LFB89:
    .byte $08 ; |    X   | $FB89
    .byte $08 ; |    X   | $FB8A
    .byte $07 ; |     XXX| $FB8B
    .byte $09 ; |    X  X| $FB8C
    .byte $08 ; |    X   | $FB8D
    .byte $0A ; |    X X | $FB8E
    .byte $09 ; |    X  X| $FB8F
    .byte $0B ; |    X XX| $FB90
    .byte $0A ; |    X X | $FB91
    .byte $0C ; |    XX  | $FB92
    .byte $0B ; |    X XX| $FB93
    .byte $0D ; |    XX X| $FB94
    .byte $0C ; |    XX  | $FB95
    .byte $0E ; |    XXX | $FB96
    .byte $0D ; |    XX X| $FB97
    .byte $0F ; |    XXXX| $FB98
    .byte $00 ; |        | $FB99
LFB9A:
    .byte $D3 ; |XX X  XX| $FB9A
    .byte $14 ; |   X X  | $FB9B
    .byte $C3 ; |XX    XX| $FB9C
    .byte $00 ; |        | $FB9D
LFB9E:
    .byte $11 ; |   X   X| $FB9E
    .byte $14 ; |   X X  | $FB9F
    .byte $17 ; |   X XXX| $FBA0
    .byte $14 ; |   X X  | $FBA1
    .byte $0E ; |    XXX | $FBA2
    .byte $14 ; |   X X  | $FBA3
    .byte $11 ; |   X   X| $FBA4
    .byte $0B ; |    X XX| $FBA5
    .byte $17 ; |   X XXX| $FBA6
    .byte $14 ; |   X X  | $FBA7
    .byte $11 ; |   X   X| $FBA8
    .byte $0E ; |    XXX | $FBA9
    .byte $14 ; |   X X  | $FBAA
    .byte $11 ; |   X   X| $FBAB
    .byte $0B ; |    X XX| $FBAC
    .byte $0B ; |    X XX| $FBAD
    .byte $05 ; |     X X| $FBAE
    .byte $0B ; |    X XX| $FBAF
    .byte $09 ; |    X  X| $FBB0
    .byte $08 ; |    X   | $FBB1
    .byte $06 ; |     XX | $FBB2
    .byte $08 ; |    X   | $FBB3
    .byte $09 ; |    X  X| $FBB4
    .byte $0B ; |    X XX| $FBB5
    .byte $11 ; |   X   X| $FBB6
    .byte $14 ; |   X X  | $FBB7
    .byte $17 ; |   X XXX| $FBB8
    .byte $1A ; |   XX X | $FBB9
    .byte $11 ; |   X   X| $FBBA
    .byte $14 ; |   X X  | $FBBB
    .byte $17 ; |   X XXX| $FBBC
    .byte $1A ; |   XX X | $FBBD
LFBBE:
    .byte $14 ; |   X X  | $FBBE
    .byte $1A ; |   XX X | $FBBF
    .byte $17 ; |   X XXX| $FBC0
    .byte $1A ; |   XX X | $FBC1
    .byte $13 ; |   X  XX| $FBC2
    .byte $1A ; |   XX X | $FBC3
    .byte $14 ; |   X X  | $FBC4
    .byte $0E ; |    XXX | $FBC5
    .byte $1C ; |   XXX  | $FBC6
    .byte $1A ; |   XX X | $FBC7
    .byte $14 ; |   X X  | $FBC8
    .byte $13 ; |   X  XX| $FBC9
    .byte $1A ; |   XX X | $FBCA
    .byte $14 ; |   X X  | $FBCB
    .byte $0E ; |    XXX | $FBCC
    .byte $0E ; |    XXX | $FBCD
    .byte $13 ; |   X  XX| $FBCE
    .byte $0E ; |    XXX | $FBCF
    .byte $0C ; |    XX  | $FBD0
    .byte $0B ; |    X XX| $FBD1
    .byte $08 ; |    X   | $FBD2
    .byte $0B ; |    X XX| $FBD3
    .byte $0C ; |    XX  | $FBD4
    .byte $0E ; |    XXX | $FBD5
    .byte $14 ; |   X X  | $FBD6
    .byte $1A ; |   XX X | $FBD7
    .byte $1C ; |   XXX  | $FBD8
    .byte $1E ; |   XXXX | $FBD9
    .byte $14 ; |   X X  | $FBDA
    .byte $1A ; |   XX X | $FBDB
    .byte $17 ; |   X XXX| $FBDC
    .byte $1E ; |   XXXX | $FBDD
LFBDE:
    .byte $AE ; |X X XXX | $FBDE
    .byte $66 ; | XX  XX | $FBDF
    .byte $88 ; |X   X   | $FBE0
    .byte $CA ; |XX  X X | $FBE1
    .byte $4A ; | X  X X | $FBE2
    .byte $AA ; |X X X X | $FBE3
    .byte $88 ; |X   X   | $FBE4
    .byte $AE ; |X X XXX | $FBE5
LFBE6:
    .byte $2C ; |  X XX  | $FBE6
    .byte $2C ; |  X XX  | $FBE7
    .byte $08 ; |    X   | $FBE8
    .byte $67 ; | XX  XXX| $FBE9
    .byte $64 ; | XX  X  | $FBEA
    .byte $2B ; |  X X XX| $FBEB
    .byte $2C ; |  X XX  | $FBEC
    .byte $00 ; |        | $FBED
    .byte $FF ; |XXXXXXXX| $FBEE
    .byte $FF ; |XXXXXXXX| $FBEF
    .byte $FF ; |XXXXXXXX| $FBF0
    .byte $FF ; |XXXXXXXX| $FBF1
    .byte $FF ; |XXXXXXXX| $FBF2
    .byte $FF ; |XXXXXXXX| $FBF3
    .byte $FF ; |XXXXXXXX| $FBF4
    .byte $FF ; |XXXXXXXX| $FBF5
    .byte $FF ; |XXXXXXXX| $FBF6
    .byte $FF ; |XXXXXXXX| $FBF7
    .byte $FF ; |XXXXXXXX| $FBF8
    .byte $FF ; |XXXXXXXX| $FBF9
    .byte $FF ; |XXXXXXXX| $FBFA
    .byte $FF ; |XXXXXXXX| $FBFB
    .byte $FF ; |XXXXXXXX| $FBFC
    .byte $FF ; |XXXXXXXX| $FBFD
    .byte $FF ; |XXXXXXXX| $FBFE
    .byte $FF ; |XXXXXXXX| $FBFF
LFC00:
    .byte $10,$85,$8C,$85,$8B,$85,$86,$A9,$00,$85,$88,$85,$89,$AD,$82,$02
    .byte $4A,$90,$FA,$4C,$25,$F0,$4A,$B0,$41,$A9,$00,$85,$86,$20,$8A,$F6
    .byte $E6,$87,$A5,$87,$C9,$04,$D0,$04,$A9,$00,$85,$87,$A4,$87,$C8,$98
    .byte $0A,$0A,$0A,$18,$69,$08,$85,$92,$A9,$00,$85,$88,$85,$89,$A0,$01
    .byte $A5,$87,$4A,$4A,$B0,$02,$A0,$03,$84,$8F,$A9,$60,$85,$8C,$85,$8B
    .byte $AD,$82,$02,$4A,$4A,$90,$F9,$4C,$25,$F0,$A0,$FF,$4A,$4A,$B0,$02
    .byte $A0,$0F,$84,$A5,$A0,$15,$AD,$82,$02,$0A,$0A,$B0,$02,$A0,$10,$84
    .byte $E2,$A5,$94,$F0,$0D,$A9,$07,$85,$86,$20,$8A,$F6,$A9,$00,$85,$86
    .byte $F0,$03,$20,$8A,$F6,$A5,$8C,$F0,$1B,$C9,$10,$F0,$04,$C6,$8C,$D0
    .byte $3B,$A5,$0C,$0A,$B0,$36,$A5,$86,$F0,$32,$C6,$86,$F0,$2E,$A9,$00
    .byte $85,$8C,$D0,$28,$A5,$C9,$D0,$24,$A5,$0C,$0A,$B0,$1F,$A0,$04,$A5
    .byte $E2,$29,$0F,$F0,$02,$A0,$08,$98,$18,$65,$90,$85,$A1,$A5,$91,$38
    .byte $E9,$04,$85,$C6,$A5,$8E,$85,$C7,$A9,$50,$85,$C9,$A5,$86,$F0,$26
    .byte $A5,$8C,$D0,$22,$A5,$02,$0A,$B0,$0E,$A5,$01,$0A,$B0,$09,$A5,$8B
    .byte $D0,$14,$A5,$07,$0A,$90,$0F,$A9,$50,$85,$8C,$A9,$D0,$85,$AC,$A9
    .byte $F5,$85,$CD,$4C,$D1,$F3,$A5,$8C,$D0,$3A,$A5,$8B,$F0,$08,$C9,$10
    .byte $30 ; |  XX    | $FD00
    .byte $30 ; |  XX    | $FD01
    .byte $30 ; |  XX    | $FD02
    .byte $30 ; |  XX    | $FD03
    .byte $70 ; | XXX    | $FD04
    .byte $70 ; | XXX    | $FD05
    .byte $70 ; | XXX    | $FD06
    .byte $70 ; | XXX    | $FD07
    .byte $F0 ; |XXXX    | $FD08
    .byte $F0 ; |XXXX    | $FD09
    .byte $F0 ; |XXXX    | $FD0A
    .byte $F0 ; |XXXX    | $FD0B
    .byte $F0 ; |XXXX    | $FD0C
    .byte $F0 ; |XXXX    | $FD0D
    .byte $F0 ; |XXXX    | $FD0E
    .byte $F0 ; |XXXX    | $FD0F
    .byte $70 ; | XXX    | $FD10
    .byte $70 ; | XXX    | $FD11
    .byte $70 ; | XXX    | $FD12
    .byte $70 ; | XXX    | $FD13
    .byte $30 ; |  XX    | $FD14
    .byte $30 ; |  XX    | $FD15
    .byte $30 ; |  XX    | $FD16
    .byte $30 ; |  XX    | $FD17
    .byte $30 ; |  XX    | $FD18
    .byte $30 ; |  XX    | $FD19
    .byte $30 ; |  XX    | $FD1A
    .byte $30 ; |  XX    | $FD1B
    .byte $10 ; |   X    | $FD1C
    .byte $10 ; |   X    | $FD1D
    .byte $10 ; |   X    | $FD1E
    .byte $10 ; |   X    | $FD1F
    .byte $30 ; |  XX    | $FD20
    .byte $30 ; |  XX    | $FD21
    .byte $30 ; |  XX    | $FD22
    .byte $30 ; |  XX    | $FD23
    .byte $10 ; |   X    | $FD24
    .byte $10 ; |   X    | $FD25
    .byte $10 ; |   X    | $FD26
    .byte $10 ; |   X    | $FD27
    .byte $30 ; |  XX    | $FD28
    .byte $30 ; |  XX    | $FD29
    .byte $30 ; |  XX    | $FD2A
    .byte $30 ; |  XX    | $FD2B
    .byte $30 ; |  XX    | $FD2C
    .byte $30 ; |  XX    | $FD2D
    .byte $30 ; |  XX    | $FD2E
    .byte $30 ; |  XX    | $FD2F
    .byte $70 ; | XXX    | $FD30
    .byte $70 ; | XXX    | $FD31
    .byte $70 ; | XXX    | $FD32
    .byte $70 ; | XXX    | $FD33
    .byte $70 ; | XXX    | $FD34
    .byte $70 ; | XXX    | $FD35
    .byte $70 ; | XXX    | $FD36
    .byte $70 ; | XXX    | $FD37
    .byte $30 ; |  XX    | $FD38
    .byte $30 ; |  XX    | $FD39
    .byte $30 ; |  XX    | $FD3A
    .byte $30 ; |  XX    | $FD3B
    .byte $10 ; |   X    | $FD3C
    .byte $10 ; |   X    | $FD3D
    .byte $10 ; |   X    | $FD3E
    .byte $10 ; |   X    | $FD3F
    .byte $10 ; |   X    | $FD40
    .byte $10 ; |   X    | $FD41
    .byte $10 ; |   X    | $FD42
    .byte $10 ; |   X    | $FD43
    .byte $70 ; | XXX    | $FD44
    .byte $70 ; | XXX    | $FD45
    .byte $70 ; | XXX    | $FD46
    .byte $70 ; | XXX    | $FD47
    .byte $F0 ; |XXXX    | $FD48
    .byte $F0 ; |XXXX    | $FD49
    .byte $F0 ; |XXXX    | $FD4A
    .byte $F0 ; |XXXX    | $FD4B
    .byte $70 ; | XXX    | $FD4C
    .byte $70 ; | XXX    | $FD4D
    .byte $70 ; | XXX    | $FD4E
    .byte $70 ; | XXX    | $FD4F
    .byte $30 ; |  XX    | $FD50
    .byte $30 ; |  XX    | $FD51
    .byte $30 ; |  XX    | $FD52
    .byte $30 ; |  XX    | $FD53
    .byte $70 ; | XXX    | $FD54
    .byte $70 ; | XXX    | $FD55
    .byte $70 ; | XXX    | $FD56
    .byte $70 ; | XXX    | $FD57
    .byte $30 ; |  XX    | $FD58
    .byte $30 ; |  XX    | $FD59
    .byte $30 ; |  XX    | $FD5A
    .byte $30 ; |  XX    | $FD5B
    .byte $10 ; |   X    | $FD5C
    .byte $10 ; |   X    | $FD5D
    .byte $10 ; |   X    | $FD5E
    .byte $10 ; |   X    | $FD5F
    .byte $10 ; |   X    | $FD60
    .byte $10 ; |   X    | $FD61
    .byte $10 ; |   X    | $FD62
    .byte $10 ; |   X    | $FD63
    .byte $30 ; |  XX    | $FD64
    .byte $30 ; |  XX    | $FD65
    .byte $30 ; |  XX    | $FD66
    .byte $30 ; |  XX    | $FD67
    .byte $70 ; | XXX    | $FD68
    .byte $70 ; | XXX    | $FD69
    .byte $70 ; | XXX    | $FD6A
    .byte $70 ; | XXX    | $FD6B
    .byte $F0 ; |XXXX    | $FD6C
    .byte $F0 ; |XXXX    | $FD6D
    .byte $F0 ; |XXXX    | $FD6E
    .byte $F0 ; |XXXX    | $FD6F
    .byte $70 ; | XXX    | $FD70
    .byte $70 ; | XXX    | $FD71
    .byte $70 ; | XXX    | $FD72
    .byte $70 ; | XXX    | $FD73
    .byte $F0 ; |XXXX    | $FD74
    .byte $F0 ; |XXXX    | $FD75
    .byte $F0 ; |XXXX    | $FD76
    .byte $F0 ; |XXXX    | $FD77
    .byte $70 ; | XXX    | $FD78
    .byte $70 ; | XXX    | $FD79
    .byte $70 ; | XXX    | $FD7A
    .byte $70 ; | XXX    | $FD7B
    .byte $10 ; |   X    | $FD7C
    .byte $10 ; |   X    | $FD7D
    .byte $10 ; |   X    | $FD7E
    .byte $10 ; |   X    | $FD7F
    .byte $30 ; |  XX    | $FD80
    .byte $30 ; |  XX    | $FD81
    .byte $30 ; |  XX    | $FD82
    .byte $30 ; |  XX    | $FD83
    .byte $10 ; |   X    | $FD84
    .byte $10 ; |   X    | $FD85
    .byte $10 ; |   X    | $FD86
    .byte $10 ; |   X    | $FD87
    .byte $10 ; |   X    | $FD88
    .byte $10 ; |   X    | $FD89
    .byte $10 ; |   X    | $FD8A
    .byte $10 ; |   X    | $FD8B
    .byte $30 ; |  XX    | $FD8C
    .byte $30 ; |  XX    | $FD8D
    .byte $30 ; |  XX    | $FD8E
    .byte $30 ; |  XX    | $FD8F
    .byte $70 ; | XXX    | $FD90
    .byte $70 ; | XXX    | $FD91
    .byte $70 ; | XXX    | $FD92
    .byte $70 ; | XXX    | $FD93
    .byte $10 ; |   X    | $FD94
    .byte $10 ; |   X    | $FD95
    .byte $10 ; |   X    | $FD96
    .byte $10 ; |   X    | $FD97
    .byte $30 ; |  XX    | $FD98
    .byte $30 ; |  XX    | $FD99
    .byte $30 ; |  XX    | $FD9A
    .byte $30 ; |  XX    | $FD9B
    .byte $70 ; | XXX    | $FD9C
    .byte $70 ; | XXX    | $FD9D
    .byte $70 ; | XXX    | $FD9E
    .byte $70 ; | XXX    | $FD9F
    .byte $F0 ; |XXXX    | $FDA0
    .byte $F0 ; |XXXX    | $FDA1
    .byte $F0 ; |XXXX    | $FDA2
    .byte $F0 ; |XXXX    | $FDA3
    .byte $F0 ; |XXXX    | $FDA4
    .byte $F0 ; |XXXX    | $FDA5
    .byte $F0 ; |XXXX    | $FDA6
    .byte $F0 ; |XXXX    | $FDA7
    .byte $70 ; | XXX    | $FDA8
    .byte $70 ; | XXX    | $FDA9
    .byte $70 ; | XXX    | $FDAA
    .byte $70 ; | XXX    | $FDAB
    .byte $30 ; |  XX    | $FDAC
    .byte $30 ; |  XX    | $FDAD
    .byte $30 ; |  XX    | $FDAE
    .byte $30 ; |  XX    | $FDAF
    .byte $F0 ; |XXXX    | $FDB0
    .byte $F0 ; |XXXX    | $FDB1
    .byte $F0 ; |XXXX    | $FDB2
    .byte $F0 ; |XXXX    | $FDB3
    .byte $F0 ; |XXXX    | $FDB4
    .byte $F0 ; |XXXX    | $FDB5
    .byte $F0 ; |XXXX    | $FDB6
    .byte $F0 ; |XXXX    | $FDB7
    .byte $30 ; |  XX    | $FDB8
    .byte $30 ; |  XX    | $FDB9
    .byte $30 ; |  XX    | $FDBA
    .byte $30 ; |  XX    | $FDBB
    .byte $10 ; |   X    | $FDBC
    .byte $10 ; |   X    | $FDBD
    .byte $10 ; |   X    | $FDBE
    .byte $10 ; |   X    | $FDBF
    .byte $10 ; |   X    | $FDC0
    .byte $10 ; |   X    | $FDC1
    .byte $10 ; |   X    | $FDC2
    .byte $10 ; |   X    | $FDC3
    .byte $30 ; |  XX    | $FDC4
    .byte $30 ; |  XX    | $FDC5
    .byte $30 ; |  XX    | $FDC6
    .byte $30 ; |  XX    | $FDC7
    .byte $10 ; |   X    | $FDC8
    .byte $10 ; |   X    | $FDC9
    .byte $10 ; |   X    | $FDCA
    .byte $10 ; |   X    | $FDCB
    .byte $10 ; |   X    | $FDCC
    .byte $10 ; |   X    | $FDCD
    .byte $10 ; |   X    | $FDCE
    .byte $10 ; |   X    | $FDCF
    .byte $30 ; |  XX    | $FDD0
    .byte $30 ; |  XX    | $FDD1
    .byte $30 ; |  XX    | $FDD2
    .byte $30 ; |  XX    | $FDD3
    .byte $30 ; |  XX    | $FDD4
    .byte $30 ; |  XX    | $FDD5
    .byte $30 ; |  XX    | $FDD6
    .byte $30 ; |  XX    | $FDD7
    .byte $70 ; | XXX    | $FDD8
    .byte $70 ; | XXX    | $FDD9
    .byte $70 ; | XXX    | $FDDA
    .byte $70 ; | XXX    | $FDDB
    .byte $F0 ; |XXXX    | $FDDC
    .byte $F0 ; |XXXX    | $FDDD
    .byte $F0 ; |XXXX    | $FDDE
    .byte $F0 ; |XXXX    | $FDDF
    .byte $F0 ; |XXXX    | $FDE0
    .byte $F0 ; |XXXX    | $FDE1
    .byte $F0 ; |XXXX    | $FDE2
    .byte $F0 ; |XXXX    | $FDE3
    .byte $70 ; | XXX    | $FDE4
    .byte $70 ; | XXX    | $FDE5
    .byte $70 ; | XXX    | $FDE6
    .byte $70 ; | XXX    | $FDE7
    .byte $30 ; |  XX    | $FDE8
    .byte $30 ; |  XX    | $FDE9
    .byte $30 ; |  XX    | $FDEA
    .byte $30 ; |  XX    | $FDEB
    .byte $10 ; |   X    | $FDEC
    .byte $10 ; |   X    | $FDED
    .byte $10 ; |   X    | $FDEE
    .byte $10 ; |   X    | $FDEF
    .byte $30 ; |  XX    | $FDF0
    .byte $30 ; |  XX    | $FDF1
    .byte $30 ; |  XX    | $FDF2
    .byte $30 ; |  XX    | $FDF3
    .byte $F0 ; |XXXX    | $FDF4
    .byte $F0 ; |XXXX    | $FDF5
    .byte $F0 ; |XXXX    | $FDF6
    .byte $F0 ; |XXXX    | $FDF7
    .byte $F0 ; |XXXX    | $FDF8
    .byte $F0 ; |XXXX    | $FDF9
    .byte $F0 ; |XXXX    | $FDFA
    .byte $F0 ; |XXXX    | $FDFB
    .byte $30 ; |  XX    | $FDFC
    .byte $30 ; |  XX    | $FDFD
    .byte $30 ; |  XX    | $FDFE
    .byte $30 ; |  XX    | $FDFF
    .byte $10 ; |   X    | $FE00
    .byte $10 ; |   X    | $FE01
    .byte $10 ; |   X    | $FE02
    .byte $10 ; |   X    | $FE03
    .byte $10 ; |   X    | $FE04
    .byte $10 ; |   X    | $FE05
    .byte $10 ; |   X    | $FE06
    .byte $10 ; |   X    | $FE07
    .byte $30 ; |  XX    | $FE08
    .byte $30 ; |  XX    | $FE09
    .byte $30 ; |  XX    | $FE0A
    .byte $30 ; |  XX    | $FE0B
    .byte $70 ; | XXX    | $FE0C
    .byte $70 ; | XXX    | $FE0D
    .byte $70 ; | XXX    | $FE0E
    .byte $70 ; | XXX    | $FE0F
    .byte $30 ; |  XX    | $FE10
    .byte $30 ; |  XX    | $FE11
    .byte $30 ; |  XX    | $FE12
    .byte $30 ; |  XX    | $FE13
    .byte $F0 ; |XXXX    | $FE14
    .byte $F0 ; |XXXX    | $FE15
    .byte $F0 ; |XXXX    | $FE16
    .byte $F0 ; |XXXX    | $FE17
    .byte $10 ; |   X    | $FE18
    .byte $10 ; |   X    | $FE19
    .byte $10 ; |   X    | $FE1A
    .byte $10 ; |   X    | $FE1B
    .byte $30 ; |  XX    | $FE1C
    .byte $30 ; |  XX    | $FE1D
    .byte $30 ; |  XX    | $FE1E
    .byte $30 ; |  XX    | $FE1F
    .byte $70 ; | XXX    | $FE20
    .byte $70 ; | XXX    | $FE21
    .byte $70 ; | XXX    | $FE22
    .byte $70 ; | XXX    | $FE23
    .byte $70 ; | XXX    | $FE24
    .byte $70 ; | XXX    | $FE25
    .byte $70 ; | XXX    | $FE26
    .byte $70 ; | XXX    | $FE27
    .byte $F0 ; |XXXX    | $FE28
    .byte $F0 ; |XXXX    | $FE29
    .byte $F0 ; |XXXX    | $FE2A
    .byte $F0 ; |XXXX    | $FE2B
    .byte $10 ; |   X    | $FE2C
    .byte $10 ; |   X    | $FE2D
    .byte $10 ; |   X    | $FE2E
    .byte $10 ; |   X    | $FE2F
    .byte $30 ; |  XX    | $FE30
    .byte $30 ; |  XX    | $FE31
    .byte $30 ; |  XX    | $FE32
    .byte $30 ; |  XX    | $FE33
    .byte $F0 ; |XXXX    | $FE34
    .byte $F0 ; |XXXX    | $FE35
    .byte $F0 ; |XXXX    | $FE36
    .byte $F0 ; |XXXX    | $FE37
    .byte $70 ; | XXX    | $FE38
    .byte $70 ; | XXX    | $FE39
    .byte $70 ; | XXX    | $FE3A
    .byte $70 ; | XXX    | $FE3B
    .byte $30 ; |  XX    | $FE3C
    .byte $30 ; |  XX    | $FE3D
    .byte $30 ; |  XX    | $FE3E
    .byte $30 ; |  XX    | $FE3F
    .byte $10 ; |   X    | $FE40
    .byte $10 ; |   X    | $FE41
    .byte $10 ; |   X    | $FE42
    .byte $10 ; |   X    | $FE43
    .byte $70 ; | XXX    | $FE44
    .byte $70 ; | XXX    | $FE45
    .byte $70 ; | XXX    | $FE46
    .byte $70 ; | XXX    | $FE47
    .byte $30 ; |  XX    | $FE48
    .byte $30 ; |  XX    | $FE49
    .byte $30 ; |  XX    | $FE4A
    .byte $30 ; |  XX    | $FE4B
    .byte $10 ; |   X    | $FE4C
    .byte $10 ; |   X    | $FE4D
    .byte $10 ; |   X    | $FE4E
    .byte $10 ; |   X    | $FE4F
    .byte $10 ; |   X    | $FE50
    .byte $10 ; |   X    | $FE51
    .byte $10 ; |   X    | $FE52
    .byte $10 ; |   X    | $FE53
    .byte $30 ; |  XX    | $FE54
    .byte $30 ; |  XX    | $FE55
    .byte $30 ; |  XX    | $FE56
    .byte $30 ; |  XX    | $FE57
    .byte $10 ; |   X    | $FE58
    .byte $10 ; |   X    | $FE59
    .byte $10 ; |   X    | $FE5A
    .byte $10 ; |   X    | $FE5B
    .byte $70 ; | XXX    | $FE5C
    .byte $70 ; | XXX    | $FE5D
    .byte $70 ; | XXX    | $FE5E
    .byte $70 ; | XXX    | $FE5F
    .byte $70 ; | XXX    | $FE60
    .byte $70 ; | XXX    | $FE61
    .byte $70 ; | XXX    | $FE62
    .byte $70 ; | XXX    | $FE63
    .byte $30 ; |  XX    | $FE64
    .byte $30 ; |  XX    | $FE65
    .byte $30 ; |  XX    | $FE66
    .byte $30 ; |  XX    | $FE67
    .byte $10 ; |   X    | $FE68
    .byte $10 ; |   X    | $FE69
    .byte $10 ; |   X    | $FE6A
    .byte $10 ; |   X    | $FE6B
    .byte $30 ; |  XX    | $FE6C
    .byte $30 ; |  XX    | $FE6D
    .byte $30 ; |  XX    | $FE6E
    .byte $30 ; |  XX    | $FE6F
    .byte $30 ; |  XX    | $FE70
    .byte $30 ; |  XX    | $FE71
    .byte $30 ; |  XX    | $FE72
    .byte $30 ; |  XX    | $FE73
    .byte $70 ; | XXX    | $FE74
    .byte $70 ; | XXX    | $FE75
    .byte $70 ; | XXX    | $FE76
    .byte $70 ; | XXX    | $FE77
    .byte $F0 ; |XXXX    | $FE78
    .byte $F0 ; |XXXX    | $FE79
    .byte $F0 ; |XXXX    | $FE7A
    .byte $F0 ; |XXXX    | $FE7B
    .byte $F0 ; |XXXX    | $FE7C
    .byte $F0 ; |XXXX    | $FE7D
    .byte $F0 ; |XXXX    | $FE7E
    .byte $F0 ; |XXXX    | $FE7F
    .byte $70 ; | XXX    | $FE80
    .byte $70 ; | XXX    | $FE81
    .byte $70 ; | XXX    | $FE82
    .byte $70 ; | XXX    | $FE83
    .byte $30 ; |  XX    | $FE84
    .byte $30 ; |  XX    | $FE85
    .byte $30 ; |  XX    | $FE86
    .byte $30 ; |  XX    | $FE87
    .byte $30 ; |  XX    | $FE88
    .byte $30 ; |  XX    | $FE89
    .byte $30 ; |  XX    | $FE8A
    .byte $30 ; |  XX    | $FE8B
    .byte $10 ; |   X    | $FE8C
    .byte $10 ; |   X    | $FE8D
    .byte $10 ; |   X    | $FE8E
    .byte $10 ; |   X    | $FE8F
    .byte $30 ; |  XX    | $FE90
    .byte $30 ; |  XX    | $FE91
    .byte $30 ; |  XX    | $FE92
    .byte $30 ; |  XX    | $FE93
    .byte $10 ; |   X    | $FE94
    .byte $10 ; |   X    | $FE95
    .byte $10 ; |   X    | $FE96
    .byte $10 ; |   X    | $FE97
    .byte $30 ; |  XX    | $FE98
    .byte $30 ; |  XX    | $FE99
    .byte $30 ; |  XX    | $FE9A
    .byte $30 ; |  XX    | $FE9B
    .byte $30 ; |  XX    | $FE9C
    .byte $30 ; |  XX    | $FE9D
    .byte $30 ; |  XX    | $FE9E
    .byte $30 ; |  XX    | $FE9F
    .byte $70 ; | XXX    | $FEA0
    .byte $70 ; | XXX    | $FEA1
    .byte $70 ; | XXX    | $FEA2
    .byte $70 ; | XXX    | $FEA3
    .byte $70 ; | XXX    | $FEA4
    .byte $70 ; | XXX    | $FEA5
    .byte $70 ; | XXX    | $FEA6
    .byte $70 ; | XXX    | $FEA7
    .byte $30 ; |  XX    | $FEA8
    .byte $30 ; |  XX    | $FEA9
    .byte $30 ; |  XX    | $FEAA
    .byte $30 ; |  XX    | $FEAB
    .byte $10 ; |   X    | $FEAC
    .byte $10 ; |   X    | $FEAD
    .byte $10 ; |   X    | $FEAE
    .byte $10 ; |   X    | $FEAF
    .byte $10 ; |   X    | $FEB0
    .byte $10 ; |   X    | $FEB1
    .byte $10 ; |   X    | $FEB2
    .byte $10 ; |   X    | $FEB3
    .byte $70 ; | XXX    | $FEB4
    .byte $70 ; | XXX    | $FEB5
    .byte $70 ; | XXX    | $FEB6
    .byte $70 ; | XXX    | $FEB7
    .byte $F0 ; |XXXX    | $FEB8
    .byte $F0 ; |XXXX    | $FEB9
    .byte $F0 ; |XXXX    | $FEBA
    .byte $F0 ; |XXXX    | $FEBB
    .byte $70 ; | XXX    | $FEBC
    .byte $70 ; | XXX    | $FEBD
    .byte $70 ; | XXX    | $FEBE
    .byte $70 ; | XXX    | $FEBF
    .byte $30 ; |  XX    | $FEC0
    .byte $30 ; |  XX    | $FEC1
    .byte $30 ; |  XX    | $FEC2
    .byte $30 ; |  XX    | $FEC3
    .byte $70 ; | XXX    | $FEC4
    .byte $70 ; | XXX    | $FEC5
    .byte $70 ; | XXX    | $FEC6
    .byte $70 ; | XXX    | $FEC7
    .byte $30 ; |  XX    | $FEC8
    .byte $30 ; |  XX    | $FEC9
    .byte $30 ; |  XX    | $FECA
    .byte $30 ; |  XX    | $FECB
    .byte $10 ; |   X    | $FECC
    .byte $10 ; |   X    | $FECD
    .byte $10 ; |   X    | $FECE
    .byte $10 ; |   X    | $FECF
    .byte $10 ; |   X    | $FED0
    .byte $10 ; |   X    | $FED1
    .byte $10 ; |   X    | $FED2
    .byte $10 ; |   X    | $FED3
    .byte $30 ; |  XX    | $FED4
    .byte $30 ; |  XX    | $FED5
    .byte $30 ; |  XX    | $FED6
    .byte $30 ; |  XX    | $FED7
    .byte $70 ; | XXX    | $FED8
    .byte $70 ; | XXX    | $FED9
    .byte $70 ; | XXX    | $FEDA
    .byte $70 ; | XXX    | $FEDB
    .byte $F0 ; |XXXX    | $FEDC
    .byte $F0 ; |XXXX    | $FEDD
    .byte $F0 ; |XXXX    | $FEDE
    .byte $F0 ; |XXXX    | $FEDF
    .byte $70 ; | XXX    | $FEE0
    .byte $70 ; | XXX    | $FEE1
    .byte $70 ; | XXX    | $FEE2
    .byte $70 ; | XXX    | $FEE3
    .byte $F0 ; |XXXX    | $FEE4
    .byte $F0 ; |XXXX    | $FEE5
    .byte $F0 ; |XXXX    | $FEE6
    .byte $F0 ; |XXXX    | $FEE7
    .byte $70 ; | XXX    | $FEE8
    .byte $70 ; | XXX    | $FEE9
    .byte $70 ; | XXX    | $FEEA
    .byte $70 ; | XXX    | $FEEB
    .byte $10 ; |   X    | $FEEC
    .byte $10 ; |   X    | $FEED
    .byte $10 ; |   X    | $FEEE
    .byte $10 ; |   X    | $FEEF
    .byte $30 ; |  XX    | $FEF0
    .byte $30 ; |  XX    | $FEF1
    .byte $30 ; |  XX    | $FEF2
    .byte $30 ; |  XX    | $FEF3
    .byte $10 ; |   X    | $FEF4
    .byte $10 ; |   X    | $FEF5
    .byte $10 ; |   X    | $FEF6
    .byte $10 ; |   X    | $FEF7
    .byte $10 ; |   X    | $FEF8
    .byte $10 ; |   X    | $FEF9
    .byte $10 ; |   X    | $FEFA
    .byte $10 ; |   X    | $FEFB
    .byte $30 ; |  XX    | $FEFC
    .byte $30 ; |  XX    | $FEFD
    .byte $30 ; |  XX    | $FEFE
    .byte $30 ; |  XX    | $FEFF
LFF00:
    .byte $A8,$B9,$AE,$F9,$85,$8A,$D0,$14,$AD,$CB,$00,$49,$01,$85,$CB,$A5
    .byte $A2,$C9,$40,$B0,$02,$69,$08,$38,$E9,$04,$85,$A2,$A5,$8C,$D0,$0B
    .byte $A0,$E0,$A5,$8E,$4A,$B0,$02,$A0,$F0,$84,$AC,$A2,$01,$F8,$38,$A9
    .byte $00,$75,$D1,$95,$D1,$CA,$10,$F7,$D8,$20,$9A,$F8,$20,$0B,$F6,$20
    .byte $2D,$F6,$4C,$4F,$F0,$A5,$89,$29,$F0,$C5,$E6,$D0,$19,$F8,$A5,$E6
    .byte $18,$69,$50,$85,$E6,$D8,$A9,$FF,$85,$DB,$E6,$E4,$A5,$E4,$29,$03
    .byte $A8,$B9,$9A,$FB,$85,$DD,$60,$A5,$88,$29,$0F,$C5,$DA,$F0,$17,$85
    .byte $DA,$E6,$E3,$A5,$86,$C9,$06,$F0,$02,$E6,$86,$A9,$F0,$85,$D5,$18
    .byte $A5,$DC,$69,$40,$85,$DC,$60,$A9,$20,$A2,$00,$20,$BB,$F7,$A9,$50
    .byte $A2,$01,$20,$BB,$F7,$85,$02,$85,$2A,$A9,$2C,$25,$A5,$85,$06,$85
    .byte $07,$A5,$80,$85,$04,$A5,$81,$85,$05,$85,$2B,$A0,$07,$85,$02,$B9
    .byte $DE,$FB,$25,$A5,$85,$06,$85,$07,$B1,$82,$85,$1B,$B1,$84,$85,$1C
    .byte $88,$10,$EA,$60,$A9,$FA,$85,$83,$85,$85,$A4,$86,$F0,$09,$88,$C0
    .byte $04,$B0,$22,$C0,$01,$B0,$0C,$A9,$00,$85,$80,$85,$81,$85,$82,$85
    .byte $84,$F0,$25,$A9,$00,$85,$84,$85,$81,$88,$B9,$CF,$F6,$85,$80,$A9
    .byte $F0,$85,$82,$D0,$13,$A9,$03,$85,$80,$88,$88,$88
    .byte $00 ; |        | $FFFC
    .byte $F0 ; |XXXX    | $FFFD
    .byte $00 ; |        | $FFFE
    .byte $F0 ; |XXXX    | $FFFF
