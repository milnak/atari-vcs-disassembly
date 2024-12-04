; Disassembly of ST_BitP.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasf ST_BitP.bin 
;


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
    LDA    #$00            ; 2
    STA    $E8             ; 3
    STA    $E9             ; 3
    STA    $EA             ; 3
    STA    $EB             ; 3
LF02F:
    LDA    #$00            ; 2
    LDX    #$A0            ; 2
LF033:
    STA    VSYNC,X         ; 4
    INX                    ; 2
    BNE    LF033           ; 2
    STA    $ED             ; 3
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
LF05B:
    JSR    LF844           ; 6
    LDA    #$00            ; 2
    STA    COLUBK          ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    JSR    LF87B           ; 6
    LDX    #$03            ; 2
LF06B:
    STA    WSYNC           ; 3
    DEX                    ; 2
    BPL    LF06B           ; 2
    JSR    LF6A9           ; 6
    LDA    #$13            ; 2
    STA    T1024T          ; 4
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
    JSR    LF81A           ; 6
    LDA    $B5             ; 3
    LDX    #$01            ; 2
    JSR    LF81A           ; 6
    LDA    $A1             ; 3
    LDX    #$02            ; 2
    JSR    LF81A           ; 6
    LDA    $A2             ; 3
    LDX    #$03            ; 2
    JSR    LF81A           ; 6
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    $E7             ; 3
    AND    $A5             ; 3
    STA    COLUBK          ; 3
    LDA    #$01            ; 2
    STA    CTRLPF          ; 3
    LDA    #$00            ; 2
    STA    $AB             ; 3
    LDA    #$EC            ; 2
    STA    $A8             ; 3
    LDX    #$00            ; 2
    STX    $B0             ; 3
    STX    $B1             ; 3
    LDA    $CA             ; 3
    STA    $AE             ; 3
    STA    HMCLR           ; 3
    LDX    #$07            ; 2
    LDA    $A8             ; 3
LF0D4:
    LDY    #$00            ; 2
    CMP    $C6             ; 3
    BNE    LF0DC           ; 2
    LDY    #$02            ; 2
LF0DC:
    STY    ENAM0           ; 3
    CMP    $91             ; 3
    BNE    LF0E4           ; 2
    STX    $B0             ; 3
LF0E4:
    LDY    $B0             ; 3
    BEQ    LF0EA           ; 2
    DEC    $B0             ; 5
LF0EA:
    LDA    LFF00,Y         ; 4
    AND    $A5             ; 3
    STA    COLUP0          ; 3
    LDA    ($AC),Y         ; 5
    STA    GRP0            ; 3
    DEC    $A8             ; 5
    STA    WSYNC           ; 3
    LDY    #$00            ; 2
    LDA    $A8             ; 3
    CMP    $CD             ; 3
    BNE    LF103           ; 2
    LDY    #$02            ; 2
LF103:
    STY    ENAM1           ; 3
    CMP    $B6             ; 3
    BNE    LF10B           ; 2
    STX    $B1             ; 3
LF10B:
    LDY    $B1             ; 3
    BEQ    LF111           ; 2
    DEC    $B1             ; 5
LF111:
    LDA    LFF08,Y         ; 4
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
    BCS    LF0D4           ; 2
LF12E:
    DEC    $A8             ; 5
    LDY    #$00            ; 2
    LDA    $A8             ; 3
    CMP    $CD             ; 3
    BNE    LF13A           ; 2
    LDY    #$02            ; 2
LF13A:
    STY    ENAM1           ; 3
    LDX    #$03            ; 2
    JSR    LF7E9           ; 6
    LDA    $A8             ; 3
    CMP    #$27            ; 2
    BCS    LF12E           ; 2
    LDA    $ED             ; 3
    BNE    LF151           ; 2
    JSR    LF941           ; 6
    JMP    LF164           ; 3
LF151:
    LDA    #$00            ; 2
    STA    PF0             ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    ENAM1           ; 3
    STA    ENAM0           ; 3
    LDX    #$0C            ; 2
LF15F:
    STA    WSYNC           ; 3
    DEX                    ; 2
    BPL    LF15F           ; 2
LF164:
    SEC                    ; 2
    LDA    $A8             ; 3
    SBC    #$0A            ; 2
    STA    $A8             ; 3
    LDA    $DD             ; 3
    STA    $E7             ; 3
    LDA    $94             ; 3
    BEQ    LF176           ; 2
    JMP    LF2A3           ; 3
LF176:
    JSR    LF790           ; 6
    LDA    $86             ; 3
    BNE    LF180           ; 2
    JMP    LF27A           ; 3
LF180:
    LDA    $8B             ; 3
    ORA    $8C             ; 3
    BNE    LF1BC           ; 2
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
    BCS    LF1A3           ; 2
    EOR    #$FF            ; 2
LF1A3:
    TAX                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDA    LFF74,Y         ; 4
    STA    $C5             ; 3
    CLC                    ; 2
    LDA    $B3             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LFF78,Y         ; 4
    ADC    $C5             ; 3
    STA    AUDV1           ; 3
LF1BC:
    INC    $E0             ; 5
    LDA    $8C             ; 3
    BNE    LF1DA           ; 2
    LDA    $C9             ; 3
    CMP    #$47            ; 2
    BCC    LF1DA           ; 2
    LDA    #$05            ; 2
    STA    AUDC0           ; 3
    LDA    #$08            ; 2
    STA    AUDV0           ; 3
    LDA    $C9             ; 3
    AND    #$0F            ; 2
    EOR    #$0F            ; 2
    ADC    #$08            ; 2
    STA    AUDF0           ; 3
LF1DA:
    LDA    NUSIZ1          ; 3
    ASL                    ; 2
    BCC    LF1E3           ; 2
    LDA    #$01            ; 2
    STA    $DE             ; 3
LF1E3:
    LDA    $DE             ; 3
    BEQ    LF1F5           ; 2
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
    DEC    $DE             ; 5
    LDA    #$07            ; 2
    STA    AUDC0           ; 3
    LDA    #$0A            ; 2
    STA    AUDF0           ; 3
LF1F5:
    LDA    $8C             ; 3
    CMP    #$10            ; 2
    BCC    LF21D           ; 2
    LDA    #$08            ; 2
    STA    AUDC0           ; 3
    LDA.w  $008C           ; 4
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LSR                    ; 2
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    TYA                    ; 2
    EOR    #$1F            ; 2
    STA    AUDF0           ; 3
    LDA    #$07            ; 2
    STA    AUDC1           ; 3
    LDA    #$1F            ; 2
    STA    AUDF1           ; 3
    LDA    $8C             ; 3
    ASL                    ; 2
    ASL                    ; 2
    STA    $E7             ; 3
LF21D:
    LDA    $8C             ; 3
    BNE    LF233           ; 2
    LDA    $8B             ; 3
    CMP    #$11            ; 2
    BCC    LF233           ; 2
    AND    #$1F            ; 2
    STA    AUDF0           ; 3
    LDA    #$0C            ; 2
    STA    AUDC0           ; 3
    LDA    #$0B            ; 2
    STA    AUDV0           ; 3
LF233:
    LDA    $8C             ; 3
    BNE    LF251           ; 2
    LDA    $8B             ; 3
    CMP    #$25            ; 2
    BCC    LF251           ; 2
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
LF251:
    LDA    $D5             ; 3
    BEQ    LF27A           ; 2
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
    ORA    #$03            ; 2
    SEC                    ; 2
    SBC    #$03            ; 2
    STA    AUDV0           ; 3
    LDA    #$0C            ; 2
    STA    AUDC0           ; 3
    LDA    #$00            ; 2
    STA    AUDC1           ; 3
    STA    AUDF1           ; 3
    STA    AUDV1           ; 3
LF27A:
    LDA    $DB             ; 3
    BEQ    LF2A3           ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDA    $DB             ; 3
    AND    #$0F            ; 2
    ORA    #$03            ; 2
    SEC                    ; 2
    SBC    #$03            ; 2
    STA    AUDV1           ; 3
    LDA    #$04            ; 2
    STA    AUDC1           ; 3
    LDA    LFB78,Y         ; 4
    STA    AUDF1           ; 3
    DEC    $DB             ; 5
    BNE    LF2A3           ; 2
    LDA    #$00            ; 2
    STA    AUDC0           ; 3
    STA    AUDF0           ; 3
    STA    AUDV0           ; 3
LF2A3:
    LDA    $94             ; 3
    BEQ    LF2ED           ; 2
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
    BNE    LF2ED           ; 2
    LDA    #$06            ; 2
    STA    $86             ; 3
    JSR    LF6E6           ; 6
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
LF2ED:
    LDA    INTIM           ; 4
    BNE    LF2ED           ; 2
    JSR    LF862           ; 6
    LDA    #$26            ; 2
    STA    TIM64T          ; 4
    LDA    SWCHB           ; 4
    LSR                    ; 2
    BCS    LF325           ; 2
    LDA    #$FF            ; 2
    STA    $94             ; 3
    LDA    #$00            ; 2
    STA    $E8             ; 3
    STA    $E9             ; 3
    STA    $EA             ; 3
    STA    $EB             ; 3
    LDA    #$10            ; 2
    STA    $8C             ; 3
    STA    $8B             ; 3
    LDA    #$00            ; 2
    STA    $86             ; 3
    STA    $88             ; 3
    STA    $89             ; 3
LF31C:
    LDA    SWCHB           ; 4
    LSR                    ; 2
    BCC    LF31C           ; 2
    JMP    LF02F           ; 3
LF325:
    LSR                    ; 2
    BCS    LF369           ; 2
    LDA    #$00            ; 2
    STA    $86             ; 3
    JSR    LF6E6           ; 6
    INC    $87             ; 5
    LDA    $87             ; 3
    CMP    #$04            ; 2
    BNE    LF33B           ; 2
    LDA    #$00            ; 2
    STA    $87             ; 3
LF33B:
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
    BCS    LF357           ; 2
    LDY    #$03            ; 2
LF357:
    STY    $8F             ; 3
    LDA    #$60            ; 2
    STA    $8C             ; 3
    STA    $8B             ; 3
LF35F:
    LDA    SWCHB           ; 4
    LSR                    ; 2
    LSR                    ; 2
    BCC    LF35F           ; 2
    JMP    LF02F           ; 3
LF369:
    LDY    #$FF            ; 2
    LSR                    ; 2
    LSR                    ; 2
    BCS    LF371           ; 2
    LDY    #$0F            ; 2
LF371:
    STY    $A5             ; 3
    LDY    #$15            ; 2
    LDA    SWCHB           ; 4
    ASL                    ; 2
    ASL                    ; 2
    BCS    LF37E           ; 2
    LDY    #$10            ; 2
LF37E:
    STY    $E2             ; 3
    LDA    $94             ; 3
    BEQ    LF397           ; 2
    LDA    $E8             ; 3
    CMP    #$11            ; 2
    BCS    LF39A           ; 2
    LDA    #$07            ; 2
    STA    $86             ; 3
    JSR    LF6E6           ; 6
    LDA    #$00            ; 2
    STA    $86             ; 3
    BEQ    LF39A           ; 2
LF397:
    JSR    LF6E6           ; 6
LF39A:
    LDA    $8C             ; 3
    BEQ    LF3C0           ; 2
    CMP    #$10            ; 2
    BEQ    LF3AE           ; 2
    CMP    #$30            ; 2
    BCC    LF3AA           ; 2
    DEC    $8C             ; 5
    DEC    $8C             ; 5
LF3AA:
    DEC    $8C             ; 5
    BNE    LF3E8           ; 2
LF3AE:
    LDA    $86             ; 3
    BEQ    LF3E8           ; 2
    DEC    $86             ; 5
    BEQ    LF3E8           ; 2
    LDA    #$00            ; 2
    STA    $8C             ; 3
    LDA    #$50            ; 2
    STA    $90             ; 3
    BNE    LF414           ; 2
LF3C0:
    LDA    $C9             ; 3
    BNE    LF3E8           ; 2
    LDA    REFP1           ; 3
    ASL                    ; 2
    BCS    LF3E8           ; 2
    LDY    #$04            ; 2
    LDA    $E2             ; 3
    AND    #$0F            ; 2
    BEQ    LF3D3           ; 2
    LDY    #$08            ; 2
LF3D3:
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
LF3E8:
    LDA    $86             ; 3
    BEQ    LF414           ; 2
    LDA    $8C             ; 3
    BNE    LF414           ; 2
    LDA    WSYNC           ; 3
    ASL                    ; 2
    BCS    LF403           ; 2
    LDA    VBLANK          ; 3
    ASL                    ; 2
    BCS    LF403           ; 2
    LDA    $8B             ; 3
    BNE    LF414           ; 2
    LDA    COLUP1          ; 3
    ASL                    ; 2
    BCC    LF414           ; 2
LF403:
    LDA    #$70            ; 2
    STA    $8C             ; 3
    LDA    #$D0            ; 2
    STA    $AC             ; 3
    LDA    #$11            ; 2
    STA    $CD             ; 3
    STA    $B6             ; 3
    JMP    LF429           ; 3
LF414:
    LDA    $8C             ; 3
    BNE    LF452           ; 2
    LDA    $8B             ; 3
    BEQ    LF424           ; 2
    CMP    #$10            ; 2
    BEQ    LF44E           ; 2
    DEC    $8B             ; 5
    BNE    LF452           ; 2
LF424:
    LDA    VSYNC           ; 3
    ASL                    ; 2
    BCS    LF42E           ; 2
LF429:
    LDA    COLUP1          ; 3
    ASL                    ; 2
    BCC    LF452           ; 2
LF42E:
    JSR    LF8E1           ; 6
    JSR    LF79F           ; 6
    LDA    $C5             ; 3
    BNE    LF452           ; 2
    INC    $E5             ; 5
    LDA    $E5             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LFF80,Y         ; 4
    STA    $8D             ; 3
    LDA    #$08            ; 2
    STA    $CA             ; 3
    LDA    #$30            ; 2
    STA    $8B             ; 3
    BNE    LF452           ; 2
LF44E:
    LDA    #$00            ; 2
    STA    $CA             ; 3
LF452:
    INC    $B3             ; 5
    LDA    $8C             ; 3
    BNE    LF4A5           ; 2
    INC    $A9             ; 5
    LDA    $8F             ; 3
    LSR                    ; 2
    AND    $A9             ; 3
    BNE    LF4A5           ; 2
    LDA    $8E             ; 3
    LSR                    ; 2
    BCS    LF486           ; 2
    DEC    $A6             ; 5
    DEC    $A6             ; 5
    INC    $A4             ; 5
    LDA    $A4             ; 3
    AND    #$07            ; 2
    STA    $AA             ; 3
    BNE    LF483           ; 2
    SED                    ; 2
    SEC                    ; 2
    LDA    $D9             ; 3
    SBC    #$10            ; 2
    STA    $D9             ; 3
    LDA    $D8             ; 3
    SBC    #$00            ; 2
    STA    $D8             ; 3
    CLD                    ; 2
LF483:
    JMP    LF4A5           ; 3
LF486:
    INC    $A6             ; 5
    INC    $A6             ; 5
    DEC    $A4             ; 5
    LDA    $A4             ; 3
    AND    #$07            ; 2
    STA    $AA             ; 3
    CMP    #$07            ; 2
    BNE    LF4A5           ; 2
    SED                    ; 2
    CLC                    ; 2
    LDA    $D9             ; 3
    ADC    #$10            ; 2
    STA    $D9             ; 3
    LDA    $D8             ; 3
    ADC    #$00            ; 2
    STA    $D8             ; 3
    CLD                    ; 2
LF4A5:
    LDA    #$FD            ; 2
    STA    $A7             ; 3
    LDA    #$FA            ; 2
    STA    $AD             ; 3
    STA    $AF             ; 3
    LDA    $AA             ; 3
    STA    $A3             ; 3
    LDA    $94             ; 3
    BNE    LF4F5           ; 2
    LDA    $8F             ; 3
    LSR                    ; 2
    AND    $B3             ; 3
    BNE    LF4F5           ; 2
    LDY    $8E             ; 3
    LDX    $90             ; 3
    LDA    SWCHA           ; 4
    ASL                    ; 2
    BCS    LF4D6           ; 2
    CPX    #$90            ; 2
    BCS    LF4D6           ; 2
    INX                    ; 2
    INX                    ; 2
    TYA                    ; 2
    AND    #$03            ; 2
    ORA    #$08            ; 2
    TAY                    ; 2
    BNE    LF4F1           ; 2
LF4D6:
    ASL                    ; 2
    BCS    LF4E7           ; 2
    CPX    #$08            ; 2
    BCC    LF4E7           ; 2
    DEX                    ; 2
    DEX                    ; 2
    TYA                    ; 2
    AND    #$03            ; 2
    ORA    #$04            ; 2
    TAY                    ; 2
    BNE    LF4F1           ; 2
LF4E7:
    ASL                    ; 2
    BCS    LF4EC           ; 2
    LDY    #$00            ; 2
LF4EC:
    ASL                    ; 2
    BCS    LF4F1           ; 2
    LDY    #$01            ; 2
LF4F1:
    STY    $8E             ; 3
    STX    $90             ; 3
LF4F5:
    LDA    $C9             ; 3
    BEQ    LF547           ; 2
    CMP    #$40            ; 2
    BEQ    LF4FF           ; 2
    DEC    $C9             ; 5
LF4FF:
    LDX    $A1             ; 3
    LDY    $C6             ; 3
    LDA    $C7             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    BCC    LF514           ; 2
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    CPX    #$18            ; 2
    BCS    LF539           ; 2
    BCC    LF53F           ; 2
LF514:
    LSR                    ; 2
    BCC    LF521           ; 2
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    CPX    #$80            ; 2
    BCC    LF539           ; 2
    BCS    LF53F           ; 2
LF521:
    LDA    $C7             ; 3
    LSR                    ; 2
    BCC    LF531           ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    CPY    #$EC            ; 2
    BCC    LF539           ; 2
    JMP    LF53F           ; 3
LF531:
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    CPY    #$68            ; 2
    BCC    LF53F           ; 2
LF539:
    STX    $A1             ; 3
    STY    $C6             ; 3
    BNE    LF547           ; 2
LF53F:
    LDA    #$00            ; 2
    STA    $A1             ; 3
    STA    $C6             ; 3
    STA    $C9             ; 3
LF547:
    LDA    $8C             ; 3
    BEQ    LF54E           ; 2
    JMP    LF5B3           ; 3
LF54E:
    LDA    $8B             ; 3
    BEQ    LF574           ; 2
    LDY    $B6             ; 3
    LDA    $8E             ; 3
    LSR                    ; 2
    BCS    LF567           ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    CPY    #$F0            ; 2
    BCC    LF572           ; 2
    JSR    LF74A           ; 6
    JMP    LF572           ; 3
LF567:
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    CPY    #$11            ; 2
    BCS    LF572           ; 2
    JSR    LF74A           ; 6
LF572:
    STY    $B6             ; 3
LF574:
    LDA    $8B             ; 3
    BNE    LF5B3           ; 2
    INC    $CF             ; 5
    LDA    $CF             ; 3
    AND    $8F             ; 3
    BNE    LF5B3           ; 2
    INC    $D0             ; 5
    LDA    $D0             ; 3
    AND    #$0F            ; 2
    BNE    LF58A           ; 2
    INC    $D4             ; 5
LF58A:
    LDA    $D4             ; 3
    AND    #$1F            ; 2
    TAY                    ; 2
    LDA    LFF10,Y         ; 4
    STA    $C5             ; 3
    LDA    LFF30,Y         ; 4
    STA    $C8             ; 3
    LDY.w  $00B5           ; 4
    CPY    $C5             ; 3
    BCS    LF5A2           ; 2
    INY                    ; 2
    INY                    ; 2
LF5A2:
    DEY                    ; 2
    STY    $B5             ; 3
    LDY    $B6             ; 3
    CPY    $C8             ; 3
    BCS    LF5AF           ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
LF5AF:
    DEY                    ; 2
    DEY                    ; 2
    STY    $B6             ; 3
LF5B3:
    DEC    $D6             ; 5
    BEQ    LF5BA           ; 2
    JMP    LF63E           ; 3
LF5BA:
    JSR    LF72E           ; 6
    LDY    $CD             ; 3
    CPY    #$FC            ; 2
    BCS    LF5FF           ; 2
    CPY    #$08            ; 2
    BCC    LF5FF           ; 2
    LDA    NUSIZ1          ; 3
    ASL                    ; 2
    BCS    LF62A           ; 2
    LDA.w  $00A2           ; 4
    LDX.w  $00CB           ; 4
    BNE    LF5D9           ; 2
    CLC                    ; 2
    ADC    $8A             ; 3
    BNE    LF5DE           ; 2
LF5D9:
    SEC                    ; 2
    LDA    $A2             ; 3
    SBC    $8A             ; 3
LF5DE:
    STA    $A2             ; 3
    SEC                    ; 2
    LDA    #$07            ; 2
    SBC    $8A             ; 3
    AND    #$FE            ; 2
    STA    $C5             ; 3
    LDA    $D7             ; 3
    BEQ    LF5F6           ; 2
    SEC                    ; 2
    LDA    $CD             ; 3
    SBC    $C5             ; 3
    STA    $CD             ; 3
    BNE    LF63E           ; 2
LF5F6:
    LDA    $C5             ; 3
    CLC                    ; 2
    ADC    $CD             ; 3
    STA    $CD             ; 3
    BNE    LF63E           ; 2
LF5FF:
    LDA    $8B             ; 3
    ORA    $8C             ; 3
    BNE    LF63E           ; 2
    LDY    #$01            ; 2
    LDA    $B6             ; 3
    CMP    $91             ; 3
    BCS    LF60F           ; 2
    LDY    #$00            ; 2
LF60F:
    STY    $D7             ; 3
    LDX    $B5             ; 3
    STX    $A2             ; 3
    LDY    $B6             ; 3
    STY    $CD             ; 3
    JSR    LF72E           ; 6
    LDA    $D1             ; 3
    ADC    $D2             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LFF88,Y         ; 4
    STA    $8A             ; 3
    BNE    LF63E           ; 2
LF62A:
    LDA.w  $00CB           ; 4
    EOR    #$01            ; 2
    STA    $CB             ; 3
    LDA    $A2             ; 3
    CMP    #$40            ; 2
    BCS    LF639           ; 2
    ADC    #$08            ; 2
LF639:
    SEC                    ; 2
    SBC    #$04            ; 2
    STA    $A2             ; 3
LF63E:
    LDA    $8C             ; 3
    BNE    LF64D           ; 2
    LDY    #$E0            ; 2
    LDA    $8E             ; 3
    LSR                    ; 2
    BCS    LF64B           ; 2
    LDY    #$F0            ; 2
LF64B:
    STY    $AC             ; 3
LF64D:
    LDX    #$01            ; 2
    SED                    ; 2
    SEC                    ; 2
LF651:
    LDA    #$00            ; 2
    ADC    $D1,X           ; 4
    STA    $D1,X           ; 4
    DEX                    ; 2
    BPL    LF651           ; 2
    CLD                    ; 2
    JSR    LF8F9           ; 6
    JSR    LF667           ; 6
    JSR    LF689           ; 6
    JMP    LF05B           ; 3
LF667:
    LDA    $89             ; 3
    AND    #$F0            ; 2
    CMP    $E6             ; 3
    BNE    LF688           ; 2
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
LF688:
    RTS                    ; 6

LF689:
    LDA    $88             ; 3
    AND    #$0F            ; 2
    CMP    $DA             ; 3
    BEQ    LF6A8           ; 2
    STA    $DA             ; 3
    INC    $E3             ; 5
    LDA    $86             ; 3
    CMP    #$06            ; 2
    BEQ    LF69D           ; 2
    INC    $86             ; 5
LF69D:
    LDA    #$F0            ; 2
    STA    $D5             ; 3
    CLC                    ; 2
    LDA    $DC             ; 3
    ADC    #$40            ; 2
    STA    $DC             ; 3
LF6A8:
    RTS                    ; 6

LF6A9:
    LDA    #$20            ; 2
    LDX    #$00            ; 2
    JSR    LF81A           ; 6
    LDA    #$50            ; 2
    LDX    #$01            ; 2
    JSR    LF81A           ; 6
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
LF6CF:
    STA    WSYNC           ; 3
    LDA    LFF00,Y         ; 4
    AND    $A5             ; 3
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDA    ($82),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($84),Y         ; 5
    STA    GRP1            ; 3
    DEY                    ; 2
    BPL    LF6CF           ; 2
    RTS                    ; 6

LF6E6:
    LDA    #$FA            ; 2
    STA    $83             ; 3
    STA    $85             ; 3
    LDY    $86             ; 3
    BEQ    LF6F9           ; 2
    DEY                    ; 2
    CPY    #$04            ; 2
    BCS    LF717           ; 2
    CPY    #$01            ; 2
    BCS    LF705           ; 2
LF6F9:
    LDA    #$00            ; 2
    STA    $80             ; 3
    STA    $81             ; 3
    STA    $82             ; 3
    STA    $84             ; 3
    BEQ    LF72A           ; 2
LF705:
    LDA    #$00            ; 2
    STA    $84             ; 3
    STA    $81             ; 3
    DEY                    ; 2
    LDA    LF72B,Y         ; 4
    STA    $80             ; 3
    LDA    #$F0            ; 2
    STA    $82             ; 3
    BNE    LF72A           ; 2
LF717:
    LDA    #$03            ; 2
    STA    $80             ; 3
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    LDA    LF72B,Y         ; 4
    STA    $81             ; 3
    LDA    #$F0            ; 2
    STA    $82             ; 3
    STA    $84             ; 3
LF72A:
    RTS                    ; 6

LF72B:
    .byte $00,$01,$03
LF72E:
    LDA    $87             ; 3
    LSR                    ; 2
    BCC    LF738           ; 2
    LDA    $89             ; 3
    JMP    LF73E           ; 3
LF738:
    LDA    $89             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
LF73E:
    AND    #$0F            ; 2
    CLC                    ; 2
    ADC    $DA             ; 3
    TAY                    ; 2
    LDA    LFFA0,Y         ; 4
    STA    $D6             ; 3
    RTS                    ; 6

LF74A:
    CLC                    ; 2
    LDA    $CC             ; 3
    ADC    #$08            ; 2
    CMP    #$90            ; 2
    BCC    LF755           ; 2
    LDA    #$40            ; 2
LF755:
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
    BCC    LF776           ; 2
    LDA    #$05            ; 2
LF776:
    CLC                    ; 2
    AND    #$07            ; 2
    TAY                    ; 2
    STA    $E1             ; 3
    ADC    #$20            ; 2
    STA    $B4             ; 3
    LDA    LFF90,Y         ; 4
    STA    $D3             ; 3
    LDA    $D2             ; 3
    LSR                    ; 2
    BCS    LF78D           ; 2
    LDY    #$13            ; 2
    RTS                    ; 6

LF78D:
    LDY    #$EF            ; 2
    RTS                    ; 6

LF790:
    LDA    #$00            ; 2
    STA    AUDC0           ; 3
    STA    AUDC1           ; 3
    STA    AUDF0           ; 3
    STA    AUDF1           ; 3
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    RTS                    ; 6

LF79F:
    LDA    $B4             ; 3
    AND    #$0F            ; 2
    CMP    #$00            ; 2
    BEQ    LF7E4           ; 2
    CMP    #$05            ; 2
    BEQ    LF7E4           ; 2
    CMP    #$07            ; 2
    BEQ    LF7E4           ; 2
    STA    $C5             ; 3
    LDA    $B5             ; 3
    CLC                    ; 2
    ADC    #$0B            ; 2
    CMP    $A1             ; 3
    BCC    LF7D1           ; 2
    LDA    $C5             ; 3
    LSR                    ; 2
    BCC    LF7C3           ; 2
    LDA    #$10            ; 2
    BNE    LF7CC           ; 2
LF7C3:
    LSR                    ; 2
    BCC    LF7CA           ; 2
    LDA    #$20            ; 2
    BNE    LF7CC           ; 2
LF7CA:
    LDA    #$40            ; 2
LF7CC:
    CLC                    ; 2
    ADC    $B5             ; 3
    STA    $B5             ; 3
LF7D1:
    LDA    $C5             ; 3
    LSR                    ; 2
    AND    $C5             ; 3
    TAY                    ; 2
    CLC                    ; 2
    ADC    #$20            ; 2
    STA    $B4             ; 3
    STA    $C5             ; 3
    LDA    LFF90,Y         ; 4
    STA    $D3             ; 3
    RTS                    ; 6

LF7E4:
    LDA    #$00            ; 2
    STA    $C5             ; 3
    RTS                    ; 6

LF7E9:
    LDA    $A8             ; 3
    STA    WSYNC           ; 3
    CMP    $B6             ; 3
    BNE    LF7F5           ; 2
    LDA    #$07            ; 2
    STA    $B1             ; 3
LF7F5:
    LDY    $B1             ; 3
    BEQ    LF7FB           ; 2
    DEC    $B1             ; 5
LF7FB:
    LDA    LFF08,Y         ; 4
    ORA    $8D             ; 3
    AND    $A5             ; 3
    STA    COLUP1          ; 3
    LDA    ($AE),Y         ; 5
    STA    GRP1            ; 3
    JSR    LF80E           ; 6
    DEC    $A8             ; 5
    RTS                    ; 6

LF80E:
    STA    WSYNC           ; 3
    LDY    $A8             ; 3
    LDA    ($A6),Y         ; 5
    STA    PF0             ; 3
    RTS                    ; 6

LF817:
    .byte $EA,$EA,$EA
LF81A:
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
    BCC    LF834           ; 2
    SBC    #$0F            ; 2
    INY                    ; 2
LF834:
    EOR    #$07            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    HMP0,X          ; 4
    STA    WSYNC           ; 3
LF83E:
    DEY                    ; 2
    BPL    LF83E           ; 2
    STA    RESP0,X         ; 4
    RTS                    ; 6

LF844:
    LDA    INTIM           ; 4
    BNE    LF844           ; 2
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

LF862:
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

LF87B:
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    STA    PF0             ; 3
    LDA    #$38            ; 2
    LDX    #$00            ; 2
    JSR    LF81A           ; 6
    LDA    #$40            ; 2
    LDX    #$01            ; 2
    JSR    LF81A           ; 6
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
LF8B1:
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
    BPL    LF8B1           ; 2
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    RTS                    ; 6

LF8E1:
    LDA    $B4             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LFF98,Y         ; 4
    CLC                    ; 2
    LDX    #$01            ; 2
    SED                    ; 2
LF8ED:
    ADC.wx $0088,X         ; 4
    STA    $88,X           ; 4
    LDA    #$00            ; 2
    DEX                    ; 2
    BPL    LF8ED           ; 2
    CLD                    ; 2
    RTS                    ; 6

LF8F9:
    LDA    $88             ; 3
    STA    $B8             ; 3
    LDA    $89             ; 3
    STA    $B9             ; 3
    LDX    #$01            ; 2
    LDY    #$04            ; 2
LF905:
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
    BPL    LF905           ; 2
    LDA    #$FB            ; 2
    STA    $93             ; 3
    LDX    #$00            ; 2
LF930:
    LDA    $BB,X           ; 4
    CMP    #$08            ; 2
    BNE    LF940           ; 2
    LDA    #$00            ; 2
    STA    $BB,X           ; 4
    INX                    ; 2
    INX                    ; 2
    CMP    #$08            ; 2
    BNE    LF930           ; 2
LF940:
    RTS                    ; 6

LF941:
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    STA    PF0             ; 3
    LDA    #$20            ; 2
    LDX    #$00            ; 2
    JSR    LF81A           ; 6
    LDA    #$28            ; 2
    LDX    #$01            ; 2
    JSR    LF81A           ; 6
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
LF973:
    STA    WSYNC           ; 3
    LDA    LFF50,X         ; 4
    STA    GRP0            ; 3
    LDA    LFF59,X         ; 4
    STA    GRP1            ; 3
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    LDA    LFF6B,X         ; 4
    TAY                    ; 2
    LDA    LFF62,X         ; 4
    STA    GRP0            ; 3
    STY    GRP1            ; 3
    STA    HMCLR           ; 3
    DEX                    ; 2
    BPL    LF973           ; 2
    RTS                    ; 6

LF995:
    .byte $00,$85,$8C,$A9,$50,$85,$90,$D0,$54,$A5,$C9,$D0,$24,$A5,$0C,$0A
    .byte $B0,$1F,$A0,$04,$A5,$E2,$29,$0F,$F0,$02,$A0,$08,$98,$18,$65,$90
    .byte $85,$A1,$A5,$91,$38,$E9,$04,$85,$C6,$A5,$8E,$85,$C7,$A9,$50,$85
    .byte $C9,$A5,$86,$F0,$28,$A5,$8C,$D0,$24,$A5,$02,$0A,$B0,$0E,$A5,$01
    .byte $0A,$B0,$09,$A5,$8B,$D0,$16,$A5,$07,$0A,$90,$11,$A9,$70,$85,$8C
    .byte $A9,$D0,$85,$AC,$A9,$11,$85,$CD,$85,$B6,$4C,$29,$F4,$A5,$8C,$D0
    .byte $3A,$A5,$8B,$F0,$08,$C9,$10,$F0,$FF,$FF,$FF,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$44,$00,$20,$01,$44,$00,$F8,$38,$A5,$D9,$E9
    .byte $10,$85,$D9,$A5,$D8,$E9,$00,$85,$D8,$D8,$4C,$A5,$F4,$E6,$A6,$E6
    .byte $A6,$C6,$A4,$A5,$A4,$29,$07,$85,$AA,$C9,$07,$D0,$0F,$F8,$18,$A5
    .byte $D9,$69,$10,$85,$D9,$A5,$D8,$69,$00,$85,$D8,$00,$00,$24,$5A,$99
    .byte $42,$24,$18,$00,$10,$44,$28,$92,$28,$44,$10,$00,$63,$22,$14,$08
    .byte $55,$36,$08,$00,$10,$28,$44,$D6,$28,$6C,$00,$00,$24,$00,$5A,$5A
    .byte $81,$18,$24,$00,$10,$38,$54,$FE,$10,$38,$7C,$00,$00,$18,$24,$18
    .byte $24,$81,$66,$00,$0C,$18,$0C,$36,$49,$49,$22,$00,$42,$5A,$24,$42
    .byte $81,$5A,$24,$00,$28,$44,$92,$92,$6C,$10,$28,$85,$04,$A5,$81,$85
    .byte $05,$85,$2B,$A0,$07,$85,$02,$B9,$00,$FF,$25,$A5,$85,$06,$85,$07
    .byte $B1,$82,$85,$1B,$B1,$84,$85,$1C,$88,$10,$EA,$60,$A9,$FA,$85,$83
    .byte $85,$85,$A4,$86,$F0,$09,$88,$C0,$04,$B0,$22,$C0,$01,$B0,$0C,$A9
    .byte $00,$85,$80,$85,$81,$85,$82,$85,$84,$F0,$25,$00,$10,$56,$38,$5E
    .byte $64,$60,$10,$00,$10,$56,$38,$5E,$64,$00,$00,$00,$D6,$10,$28,$54
    .byte $C6,$38,$10,$00,$D6,$10,$28,$54,$C6,$38,$10,$00,$10,$38,$C6,$54
    .byte $28,$10,$D6,$00,$3C,$A5,$66,$5A,$E7,$3C,$08,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$3C,$66,$66,$66,$66,$66,$66,$3C,$3C,$18,$18,$18,$18
    .byte $18,$38,$18,$7E,$60,$60,$3C,$06,$06,$46,$3C,$3C,$46,$06,$0C,$0C
    .byte $06,$46,$3C,$0C,$0C,$0C,$7E,$4C,$2C,$1C,$0C,$7C,$46,$06,$06,$7C
    .byte $60,$60,$7E,$3C,$66,$66,$66,$7C,$60,$62,$3C,$18,$18,$18,$18,$0C
    .byte $06,$42,$7E,$3C,$66,$66,$3C,$3C,$66,$66,$3C,$3C,$46,$06,$3E,$66
    .byte $66,$66,$3C,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LFB60:
    .byte $FF,$FF,$FF,$FF,$AA,$AA,$AA,$AA,$CC,$CC,$CC,$CC,$88,$88,$88,$88
LFB70:
    .byte $07,$01,$0A,$04,$09,$0C,$05,$08
LFB78:
    .byte $1B,$16,$12,$10,$14,$12,$14,$16,$14,$12,$12,$10,$14,$10,$14,$10
    .byte $14
LFB89:
    .byte $08,$08,$07,$09,$08,$0A,$09,$0B,$0A,$0C,$0B,$0D,$0C,$0E,$0D,$0F
    .byte $00
LFB9A:
    .byte $D3,$14,$C3,$00
LFB9E:
    .byte $11,$14,$17,$14,$0E,$14,$11,$0B,$17,$14,$11,$0E,$14,$11,$0B,$0B
    .byte $05,$0B,$09,$08,$06,$08,$09,$0B,$11,$14,$17,$1A,$11,$14,$17,$1A
LFBBE:
    .byte $14,$1A,$17,$1A,$13,$1A,$14,$0E,$1C,$1A,$14,$13,$1A,$14,$0E,$0E
    .byte $13,$0E,$0C,$0B,$08,$0B,$0C,$0E,$14,$1A,$1C,$1E,$14,$1A,$17,$1E
    .byte $FF,$FF,$C8,$C0,$F0,$90,$11,$20,$4A,$F7,$4C,$72,$F5,$88,$88,$88
    .byte $88,$C0,$11,$B0,$03,$20,$4A,$F7,$84,$B6,$A5,$8B,$D0,$3B,$E6,$CF
    .byte $A5,$CF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$4C,$49,$4E,$4B,$20,$31,$2E,$36,$0D,$49,$4E,$49,$54,$20,$2F
    .byte $F0,$C1,$41,$20,$20,$20,$20,$05,$F0,$D4,$4F,$50,$20,$20,$20,$00
    .byte $F0,$54,$50,$4C,$45,$4E,$20,$FF,$00,$58,$4D,$49,$4E,$20,$20,$08
    .byte $00,$59,$4D,$49,$4E,$20,$20,$08,$00,$59,$4D,$41,$58,$20,$20,$EC
    .byte $00,$58,$4D,$41,$58,$20,$20,$90,$00,$53,$54,$41,$52,$54,$20,$00
    .byte $00,$43,$45,$4E,$54,$20,$20,$A0,$00,$43,$43,$30,$39,$20,$20,$73
    .byte $00,$43,$43,$30,$36,$20,$20,$2C,$00,$43,$43,$30,$37,$20,$20,$38
    .byte $00,$43,$43,$30,$38,$20,$20,$2E,$00,$FF,$FC,$FC,$FC,$FC,$FC,$FC
    .byte $FC,$FC,$30,$30,$30,$30,$70,$70,$70,$70,$F0,$F0,$F0,$F0,$F0,$F0
    .byte $F0,$F0,$70,$70,$70,$70,$30,$30,$30,$30,$30,$30,$30,$30,$10,$10
    .byte $10,$10,$30,$30,$30,$30,$10,$10,$10,$10,$30,$30,$30,$30,$30,$30
    .byte $30,$30,$70,$70,$70,$70,$70,$70,$70,$70,$30,$30,$30,$30,$10,$10
    .byte $10,$10,$10,$10,$10,$10,$70,$70,$70,$70,$F0,$F0,$F0,$F0,$70,$70
    .byte $70,$70,$30,$30,$30,$30,$70,$70,$70,$70,$30,$30,$30,$30,$10,$10
    .byte $10,$10,$10,$10,$10,$10,$30,$30,$30,$30,$70,$70,$70,$70,$F0,$F0
    .byte $F0,$F0,$70,$70,$70,$70,$F0,$F0,$F0,$F0,$70,$70,$70,$70,$10,$10
    .byte $10,$10,$30,$30,$30,$30,$10,$10,$10,$10,$10,$10,$10,$10,$30,$30
    .byte $30,$30,$70,$70,$70,$70,$10,$10,$10,$10,$30,$30,$30,$30,$70,$70
    .byte $70,$70,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$70,$70,$70,$70,$30,$30
    .byte $30,$30,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$30,$30,$30,$30,$10,$10
    .byte $10,$10,$10,$10,$10,$10,$30,$30,$30,$30,$10,$10,$10,$10,$10,$10
    .byte $10,$10,$30,$30,$30,$30,$30,$30,$30,$30,$70,$70,$70,$70,$F0,$F0
    .byte $F0,$F0,$F0,$F0,$F0,$F0,$70,$70,$70,$70,$30,$30,$30,$30,$10,$10
    .byte $10,$10,$30,$30,$30,$30,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$30,$30
    .byte $30,$30,$10,$10,$10,$10,$10,$10,$10,$10,$30,$30,$30,$30,$70,$70
    .byte $70,$70,$30,$30,$30,$30,$F0,$F0,$F0,$F0,$10,$10,$10,$10,$30,$30
    .byte $30,$30,$70,$70,$70,$70,$70,$70,$70,$70,$F0,$F0,$F0,$F0,$10,$10
    .byte $10,$10,$30,$30,$30,$30,$F0,$F0,$F0,$F0,$70,$70,$70,$70,$30,$30
    .byte $30,$30,$10,$10,$10,$10,$70,$70,$70,$70,$30,$30,$30,$30,$10,$10
    .byte $10,$10,$10,$10,$10,$10,$30,$30,$30,$30,$10,$10,$10,$10,$70,$70
    .byte $70,$70,$70,$70,$70,$70,$30,$30,$30,$30,$10,$10,$10,$10,$30,$30
    .byte $30,$30,$30,$30,$30,$30,$70,$70,$70,$70,$F0,$F0,$F0,$F0,$F0,$F0
    .byte $F0,$F0,$70,$70,$70,$70,$30,$30,$30,$30,$30,$30,$30,$30,$10,$10
    .byte $10,$10,$30,$30,$30,$30,$10,$10,$10,$10,$30,$30,$30,$30,$30,$30
    .byte $30,$30,$70,$70,$70,$70,$70,$70,$70,$70,$30,$30,$30,$30,$10,$10
    .byte $10,$10,$10,$10,$10,$10,$70,$70,$70,$70,$F0,$F0,$F0,$F0,$70,$70
    .byte $70,$70,$30,$30,$30,$30,$70,$70,$70,$70,$30,$30,$30,$30,$10,$10
    .byte $10,$10,$10,$10,$10,$10,$30,$30,$30,$30,$70,$70,$70,$70,$F0,$F0
    .byte $F0,$F0,$70,$70,$70,$70,$F0,$F0,$F0,$F0,$70,$70,$70,$70,$10,$10
    .byte $10,$10,$30,$30,$30,$30,$10,$10,$10,$10,$10,$10,$10,$10,$30,$30
    .byte $30,$30
LFF00:
    .byte $AE,$66,$88,$CA,$4A,$AA,$88,$AE
LFF08:
    .byte $2C,$2C,$08,$67,$64,$2B,$2C,$00
LFF10:
    .byte $6A,$48,$34,$16,$08,$06,$5D,$74,$82,$6C,$4F,$3D,$38,$48,$5A,$32
    .byte $36,$1A,$05,$24,$12,$44,$64,$5A,$7C,$6A,$86,$3F,$93,$6A,$5F,$44
LFF30:
    .byte $1A,$24,$42,$74,$B3,$DE,$EC,$E2,$86,$70,$52,$6D,$B4,$C6,$C0,$A0
    .byte $C6,$E2,$B8,$64,$38,$22,$44,$88,$54,$78,$A4,$C1,$D8,$C8,$C1,$92
LFF50:
    .byte $00,$31,$49,$B5,$A5,$A5,$B5,$49,$31
LFF59:
    .byte $00,$D2,$D2,$52,$D2,$92,$D2,$57,$D7
LFF62:
    .byte $00,$37,$37,$37,$25,$25,$25,$37,$37
LFF6B:
    .byte $00,$54,$54,$64,$77,$77,$55,$55,$77
LFF74:
    .byte $08,$05,$03,$01
LFF78:
    .byte $00,$01,$02,$03,$04,$03,$02,$01
LFF80:
    .byte $38,$18,$0E,$2E,$5A,$4C,$8A,$AA
LFF88:
    .byte $02,$01,$03,$05,$03,$04,$04,$01
LFF90:
    .byte $2E,$C8,$C8,$64,$C8,$2E,$64,$BA
LFF98:
    .byte $03,$05,$05,$08,$05,$03,$08,$04
LFFA0:
    .byte $07,$06,$05,$05,$04,$04,$03,$03,$02,$01,$03,$04,$05,$01,$04,$02
    .byte $FF,$85,$1B,$84,$1C,$85,$2B,$CA,$10,$DF,$60,$00,$85,$8C,$A9,$50
    .byte $85,$90,$D0,$54,$A5,$C9,$D0,$24,$A5,$0C,$0A,$B0,$1F,$A0,$04,$A5
    .byte $E2,$29,$0F,$F0,$02,$A0,$08,$98,$18,$65,$90,$85,$A1,$A5,$91,$38
    .byte $E9,$04,$85,$C6,$A5,$8E,$85,$C7,$A9,$50,$85,$C9,$A5,$86,$F0,$28
    .byte $A5,$8C,$D0,$24,$A5,$02,$0A,$B0,$FF,$FF,$FF,$FF,$00,$F0,$00,$F0
