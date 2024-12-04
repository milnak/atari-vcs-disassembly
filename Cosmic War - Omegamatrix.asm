; Disassembly of CW_Home.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasf CW_Home.bin 
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
HMP0    =  $20
HMP1    =  $21
VDELP0  =  $25
VDELP1  =  $26
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
    LDA    #$4B            ; 2
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
    JSR    LF849           ; 6
    LDA    #$00            ; 2
    STA    COLUBK          ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    JSR    LF880           ; 6
    LDX    #$03            ; 2
LF06B:
    STA    WSYNC           ; 3
    DEX                    ; 2
    BPL    LF06B           ; 2
    JSR    LF6AE           ; 6
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
    JSR    LF81F           ; 6
    LDA    $B5             ; 3
    LDX    #$01            ; 2
    JSR    LF81F           ; 6
    LDA    $A1             ; 3
    LDX    #$02            ; 2
    JSR    LF81F           ; 6
    LDA    $A2             ; 3
    LDX    #$03            ; 2
    JSR    LF81F           ; 6
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    $E7             ; 3
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
    JSR    LF7EE           ; 6
    LDA    $A8             ; 3
    CMP    #$18            ; 2
    BCS    LF12E           ; 2
    LDA    $ED             ; 3
    BNE    LF151           ; 2
    JSR    LF946           ; 6
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
    JMP    LF251           ; 3
LF176:
    JSR    LF795           ; 6
    LDA    $86             ; 3
    BNE    LF180           ; 2
    JMP    LF251           ; 3
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
    LDA    $94             ; 3
    BNE    LF258           ; 2
    JMP    LF2F2           ; 3
LF258:
    INC    $EC             ; 5
    LDA    $EC             ; 3
    CMP    #$03            ; 2
    BNE    LF2BA           ; 2
    LDA    #$00            ; 2
    STA    $EC             ; 3
    DEC    $94             ; 5
    LDA    $E9             ; 3
    SEC                    ; 2
    SBC    #$20            ; 2
    STA    $E9             ; 3
    BCS    LF2BA           ; 2
    INC    $E8             ; 5
    LDY    $E8             ; 3
    LDA    LFB9E,Y         ; 4
    STA    $E9             ; 3
    LDA    LFBC1,Y         ; 4
    STA    $EA             ; 3
    LDA    LFBE4,Y         ; 4
    STA    $EB             ; 3
    CPY    #$11            ; 2
    BCC    LF2C0           ; 2
    LDA    #$50            ; 2
    STA    $90             ; 3
    LDA    #$A0            ; 2
    STA    $91             ; 3
    LDA    #$80            ; 2
    STA    $ED             ; 3
    LDA    #$F0            ; 2
    STA    $AC             ; 3
    LDA    #$06            ; 2
    STA    $86             ; 3
    JSR    LF6EB           ; 6
    LDA    #$00            ; 2
    STA    $86             ; 3
    LDA    #$0E            ; 2
    LDY    #$0E            ; 2
    STA    AUDC0           ; 3
    STY    AUDC1           ; 3
    LDA    $EA             ; 3
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    LDA    $E9             ; 3
    STA    AUDF0           ; 3
    LDA    $EB             ; 3
    STA    AUDF1           ; 3
    JMP    LF2D5           ; 3
LF2BA:
    LDY    $E8             ; 3
    CPY    #$11            ; 2
    BCS    LF2D5           ; 2
LF2C0:
    LDA    #$04            ; 2
    STA    AUDC0           ; 3
    LDA    #$0C            ; 2
    STA    AUDC1           ; 3
    LDA    $B3             ; 3
    ASL                    ; 2
    STA    AUDF0           ; 3
    STA    AUDF1           ; 3
    LDA    #$05            ; 2
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
LF2D5:
    LDA    $94             ; 3
    BNE    LF2F2           ; 2
    LDA    #$06            ; 2
    STA    $86             ; 3
    JSR    LF6EB           ; 6
    LDA    #$00            ; 2
    STA    $88             ; 3
    STA    $89             ; 3
    STA    $8C             ; 3
    STA    $8E             ; 3
    LDA    #$08            ; 2
    STA    $92             ; 3
    LDA    #$10            ; 2
    STA    $8B             ; 3
LF2F2:
    LDA    INTIM           ; 4
    BNE    LF2F2           ; 2
    JSR    LF867           ; 6
    LDA    #$26            ; 2
    STA    TIM64T          ; 4
    LDA    SWCHB           ; 4
    LSR                    ; 2
    BCS    LF32A           ; 2
    LDA    #$4B            ; 2
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
LF321:
    LDA    SWCHB           ; 4
    LSR                    ; 2
    BCC    LF321           ; 2
    JMP    LF02F           ; 3
LF32A:
    LSR                    ; 2
    BCS    LF36E           ; 2
    LDA    #$00            ; 2
    STA    $86             ; 3
    JSR    LF6EB           ; 6
    INC    $87             ; 5
    LDA    $87             ; 3
    CMP    #$04            ; 2
    BNE    LF340           ; 2
    LDA    #$00            ; 2
    STA    $87             ; 3
LF340:
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
    BCS    LF35C           ; 2
    LDY    #$03            ; 2
LF35C:
    STY    $8F             ; 3
    LDA    #$60            ; 2
    STA    $8C             ; 3
    STA    $8B             ; 3
LF364:
    LDA    SWCHB           ; 4
    LSR                    ; 2
    LSR                    ; 2
    BCC    LF364           ; 2
    JMP    LF02F           ; 3
LF36E:
    LDY    #$FF            ; 2
    LSR                    ; 2
    LSR                    ; 2
    BCS    LF376           ; 2
    LDY    #$0F            ; 2
LF376:
    STY    $A5             ; 3
    LDY    #$15            ; 2
    LDA    SWCHB           ; 4
    ASL                    ; 2
    ASL                    ; 2
    BCS    LF383           ; 2
    LDY    #$10            ; 2
LF383:
    STY    $E2             ; 3
    LDA    $94             ; 3
    BEQ    LF39C           ; 2
    LDA    $E8             ; 3
    CMP    #$11            ; 2
    BCS    LF39F           ; 2
    LDA    #$07            ; 2
    STA    $86             ; 3
    JSR    LF6EB           ; 6
    LDA    #$00            ; 2
    STA    $86             ; 3
    BEQ    LF39F           ; 2
LF39C:
    JSR    LF6EB           ; 6
LF39F:
    LDA    $8C             ; 3
    BEQ    LF3C5           ; 2
    CMP    #$10            ; 2
    BEQ    LF3B3           ; 2
    CMP    #$30            ; 2
    BCC    LF3AF           ; 2
    DEC    $8C             ; 5
    DEC    $8C             ; 5
LF3AF:
    DEC    $8C             ; 5
    BNE    LF3ED           ; 2
LF3B3:
    LDA    $86             ; 3
    BEQ    LF3ED           ; 2
    DEC    $86             ; 5
    BEQ    LF3ED           ; 2
    LDA    #$00            ; 2
    STA    $8C             ; 3
    LDA    #$50            ; 2
    STA    $90             ; 3
    BNE    LF419           ; 2
LF3C5:
    LDA    $C9             ; 3
    BNE    LF3ED           ; 2
    LDA    REFP1           ; 3
    ASL                    ; 2
    BCS    LF3ED           ; 2
    LDY    #$04            ; 2
    LDA    $E2             ; 3
    AND    #$0F            ; 2
    BEQ    LF3D8           ; 2
    LDY    #$08            ; 2
LF3D8:
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
LF3ED:
    LDA    $86             ; 3
    BEQ    LF419           ; 2
    LDA    $8C             ; 3
    BNE    LF419           ; 2
    LDA    WSYNC           ; 3
    ASL                    ; 2
    BCS    LF408           ; 2
    LDA    VBLANK          ; 3
    ASL                    ; 2
    BCS    LF408           ; 2
    LDA    $8B             ; 3
    BNE    LF419           ; 2
    LDA    COLUP1          ; 3
    ASL                    ; 2
    BCC    LF419           ; 2
LF408:
    LDA    #$70            ; 2
    STA    $8C             ; 3
    LDA    #$D0            ; 2
    STA    $AC             ; 3
    LDA    #$F5            ; 2
    STA    $CD             ; 3
    STA    $B6             ; 3
    JMP    LF42E           ; 3
LF419:
    LDA    $8C             ; 3
    BNE    LF457           ; 2
    LDA    $8B             ; 3
    BEQ    LF429           ; 2
    CMP    #$10            ; 2
    BEQ    LF453           ; 2
    DEC    $8B             ; 5
    BNE    LF457           ; 2
LF429:
    LDA    VSYNC           ; 3
    ASL                    ; 2
    BCS    LF433           ; 2
LF42E:
    LDA    COLUP1          ; 3
    ASL                    ; 2
    BCC    LF457           ; 2
LF433:
    JSR    LF8E6           ; 6
    JSR    LF7A4           ; 6
    LDA    $C5             ; 3
    BNE    LF457           ; 2
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
    BNE    LF457           ; 2
LF453:
    LDA    #$00            ; 2
    STA    $CA             ; 3
LF457:
    INC    $B3             ; 5
    LDA    $8C             ; 3
    BNE    LF4AA           ; 2
    INC    $A9             ; 5
    LDA    $8F             ; 3
    LSR                    ; 2
    AND    $A9             ; 3
    BNE    LF4AA           ; 2
    LDA    $8E             ; 3
    LSR                    ; 2
    BCS    LF48B           ; 2
    DEC    $A6             ; 5
    DEC    $A6             ; 5
    INC    $A4             ; 5
    LDA    $A4             ; 3
    AND    #$07            ; 2
    STA    $AA             ; 3
    BNE    LF488           ; 2
    SED                    ; 2
    SEC                    ; 2
    LDA    $D9             ; 3
    SBC    #$10            ; 2
    STA    $D9             ; 3
    LDA    $D8             ; 3
    SBC    #$00            ; 2
    STA    $D8             ; 3
    CLD                    ; 2
LF488:
    JMP    LF4AA           ; 3
LF48B:
    INC    $A6             ; 5
    INC    $A6             ; 5
    DEC    $A4             ; 5
    LDA    $A4             ; 3
    AND    #$07            ; 2
    STA    $AA             ; 3
    CMP    #$07            ; 2
    BNE    LF4AA           ; 2
    SED                    ; 2
    CLC                    ; 2
    LDA    $D9             ; 3
    ADC    #$10            ; 2
    STA    $D9             ; 3
    LDA    $D8             ; 3
    ADC    #$00            ; 2
    STA    $D8             ; 3
    CLD                    ; 2
LF4AA:
    LDA    #$FD            ; 2
    STA    $A7             ; 3
    LDA    #$FA            ; 2
    STA    $AD             ; 3
    STA    $AF             ; 3
    LDA    $AA             ; 3
    STA    $A3             ; 3
    LDA    $94             ; 3
    BNE    LF4FA           ; 2
    LDA    $8F             ; 3
    LSR                    ; 2
    AND    $B3             ; 3
    BNE    LF4FA           ; 2
    LDY    $8E             ; 3
    LDX    $90             ; 3
    LDA    SWCHA           ; 4
    ASL                    ; 2
    BCS    LF4DB           ; 2
    CPX    #$90            ; 2
    BCS    LF4DB           ; 2
    INX                    ; 2
    INX                    ; 2
    TYA                    ; 2
    AND    #$03            ; 2
    ORA    #$08            ; 2
    TAY                    ; 2
    BNE    LF4F6           ; 2
LF4DB:
    ASL                    ; 2
    BCS    LF4EC           ; 2
    CPX    #$08            ; 2
    BCC    LF4EC           ; 2
    DEX                    ; 2
    DEX                    ; 2
    TYA                    ; 2
    AND    #$03            ; 2
    ORA    #$04            ; 2
    TAY                    ; 2
    BNE    LF4F6           ; 2
LF4EC:
    ASL                    ; 2
    BCS    LF4F1           ; 2
    LDY    #$00            ; 2
LF4F1:
    ASL                    ; 2
    BCS    LF4F6           ; 2
    LDY    #$01            ; 2
LF4F6:
    STY    $8E             ; 3
    STX    $90             ; 3
LF4FA:
    LDA    $C9             ; 3
    BEQ    LF54C           ; 2
    CMP    #$40            ; 2
    BEQ    LF504           ; 2
    DEC    $C9             ; 5
LF504:
    LDX    $A1             ; 3
    LDY    $C6             ; 3
    LDA    $C7             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    BCC    LF519           ; 2
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    CPX    #$18            ; 2
    BCS    LF53E           ; 2
    BCC    LF544           ; 2
LF519:
    LSR                    ; 2
    BCC    LF526           ; 2
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    CPX    #$80            ; 2
    BCC    LF53E           ; 2
    BCS    LF544           ; 2
LF526:
    LDA    $C7             ; 3
    LSR                    ; 2
    BCC    LF536           ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    CPY    #$D0            ; 2
    BCC    LF53E           ; 2
    JMP    LF544           ; 3
LF536:
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    CPY    #$68            ; 2
    BCC    LF544           ; 2
LF53E:
    STX    $A1             ; 3
    STY    $C6             ; 3
    BNE    LF54C           ; 2
LF544:
    LDA    #$00            ; 2
    STA    $A1             ; 3
    STA    $C6             ; 3
    STA    $C9             ; 3
LF54C:
    LDA    $8C             ; 3
    BEQ    LF553           ; 2
    JMP    LF5B8           ; 3
LF553:
    LDA    $8B             ; 3
    BEQ    LF579           ; 2
    LDY    $B6             ; 3
    LDA    $8E             ; 3
    LSR                    ; 2
    BCS    LF56C           ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    CPY    #$F0            ; 2
    BCC    LF577           ; 2
    JSR    LF74F           ; 6
    JMP    LF577           ; 3
LF56C:
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    CPY    #$11            ; 2
    BCS    LF577           ; 2
    JSR    LF74F           ; 6
LF577:
    STY    $B6             ; 3
LF579:
    LDA    $8B             ; 3
    BNE    LF5B8           ; 2
    INC    $CF             ; 5
    LDA    $CF             ; 3
    AND    $8F             ; 3
    BNE    LF5B8           ; 2
    INC    $D0             ; 5
    LDA    $D0             ; 3
    AND    #$0F            ; 2
    BNE    LF58F           ; 2
    INC    $D4             ; 5
LF58F:
    LDA    $D4             ; 3
    AND    #$1F            ; 2
    TAY                    ; 2
    LDA    LFF10,Y         ; 4
    STA    $C5             ; 3
    LDA    LFF30,Y         ; 4
    STA    $C8             ; 3
    LDY.w  $00B5           ; 4
    CPY    $C5             ; 3
    BCS    LF5A7           ; 2
    INY                    ; 2
    INY                    ; 2
LF5A7:
    DEY                    ; 2
    STY    $B5             ; 3
    LDY    $B6             ; 3
    CPY    $C8             ; 3
    BCS    LF5B4           ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
LF5B4:
    DEY                    ; 2
    DEY                    ; 2
    STY    $B6             ; 3
LF5B8:
    DEC    $D6             ; 5
    BEQ    LF5BF           ; 2
    JMP    LF643           ; 3
LF5BF:
    JSR    LF733           ; 6
    LDY    $CD             ; 3
    CPY    #$E0            ; 2
    BCS    LF604           ; 2
    CPY    #$08            ; 2
    BCC    LF604           ; 2
    LDA    NUSIZ1          ; 3
    ASL                    ; 2
    BCS    LF62F           ; 2
    LDA.w  $00A2           ; 4
    LDX.w  $00CB           ; 4
    BNE    LF5DE           ; 2
    CLC                    ; 2
    ADC    $8A             ; 3
    BNE    LF5E3           ; 2
LF5DE:
    SEC                    ; 2
    LDA    $A2             ; 3
    SBC    $8A             ; 3
LF5E3:
    STA    $A2             ; 3
    SEC                    ; 2
    LDA    #$07            ; 2
    SBC    $8A             ; 3
    AND    #$FE            ; 2
    STA    $C5             ; 3
    LDA    $D7             ; 3
    BEQ    LF5FB           ; 2
    SEC                    ; 2
    LDA    $CD             ; 3
    SBC    $C5             ; 3
    STA    $CD             ; 3
    BNE    LF643           ; 2
LF5FB:
    LDA    $C5             ; 3
    CLC                    ; 2
    ADC    $CD             ; 3
    STA    $CD             ; 3
    BNE    LF643           ; 2
LF604:
    LDA    $8B             ; 3
    ORA    $8C             ; 3
    BNE    LF643           ; 2
    LDY    #$01            ; 2
    LDA    $B6             ; 3
    CMP    $91             ; 3
    BCS    LF614           ; 2
    LDY    #$00            ; 2
LF614:
    STY    $D7             ; 3
    LDX    $B5             ; 3
    STX    $A2             ; 3
    LDY    $B6             ; 3
    STY    $CD             ; 3
    JSR    LF733           ; 6
    LDA    $D1             ; 3
    ADC    $D2             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LFF88,Y         ; 4
    STA    $8A             ; 3
    BNE    LF643           ; 2
LF62F:
    LDA.w  $00CB           ; 4
    EOR    #$01            ; 2
    STA    $CB             ; 3
    LDA    $A2             ; 3
    CMP    #$40            ; 2
    BCS    LF63E           ; 2
    ADC    #$08            ; 2
LF63E:
    SEC                    ; 2
    SBC    #$04            ; 2
    STA    $A2             ; 3
LF643:
    LDA    $8C             ; 3
    BNE    LF652           ; 2
    LDY    #$E0            ; 2
    LDA    $8E             ; 3
    LSR                    ; 2
    BCS    LF650           ; 2
    LDY    #$F0            ; 2
LF650:
    STY    $AC             ; 3
LF652:
    LDX    #$01            ; 2
    SED                    ; 2
    SEC                    ; 2
LF656:
    LDA    #$00            ; 2
    ADC    $D1,X           ; 4
    STA    $D1,X           ; 4
    DEX                    ; 2
    BPL    LF656           ; 2
    CLD                    ; 2
    JSR    LF8FE           ; 6
    JSR    LF66C           ; 6
    JSR    LF68E           ; 6
    JMP    LF05B           ; 3
LF66C:
    LDA    $89             ; 3
    AND    #$F0            ; 2
    CMP    $E6             ; 3
    BNE    LF68D           ; 2
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
LF68D:
    RTS                    ; 6

LF68E:
    LDA    $88             ; 3
    AND    #$0F            ; 2
    CMP    $DA             ; 3
    BEQ    LF6AD           ; 2
    STA    $DA             ; 3
    INC    $E3             ; 5
    LDA    $86             ; 3
    CMP    #$06            ; 2
    BEQ    LF6A2           ; 2
    INC    $86             ; 5
LF6A2:
    LDA    #$F0            ; 2
    STA    $D5             ; 3
    CLC                    ; 2
    LDA    $DC             ; 3
    ADC    #$40            ; 2
    STA    $DC             ; 3
LF6AD:
    RTS                    ; 6

LF6AE:
    LDA    #$20            ; 2
    LDX    #$00            ; 2
    JSR    LF81F           ; 6
    LDA    #$50            ; 2
    LDX    #$01            ; 2
    JSR    LF81F           ; 6
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
LF6D4:
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
    BPL    LF6D4           ; 2
    RTS                    ; 6

LF6EB:
    LDA    #$FA            ; 2
    STA    $83             ; 3
    STA    $85             ; 3
    LDY    $86             ; 3
    BEQ    LF6FE           ; 2
    DEY                    ; 2
    CPY    #$04            ; 2
    BCS    LF71C           ; 2
    CPY    #$01            ; 2
    BCS    LF70A           ; 2
LF6FE:
    LDA    #$00            ; 2
    STA    $80             ; 3
    STA    $81             ; 3
    STA    $82             ; 3
    STA    $84             ; 3
    BEQ    LF72F           ; 2
LF70A:
    LDA    #$00            ; 2
    STA    $84             ; 3
    STA    $81             ; 3
    DEY                    ; 2
    LDA    LF730,Y         ; 4
    STA    $80             ; 3
    LDA    #$F0            ; 2
    STA    $82             ; 3
    BNE    LF72F           ; 2
LF71C:
    LDA    #$03            ; 2
    STA    $80             ; 3
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    LDA    LF730,Y         ; 4
    STA    $81             ; 3
    LDA    #$F0            ; 2
    STA    $82             ; 3
    STA    $84             ; 3
LF72F:
    RTS                    ; 6

LF730:
    .byte $00,$01,$03
LF733:
    LDA    $87             ; 3
    LSR                    ; 2
    BCC    LF73D           ; 2
    LDA    $89             ; 3
    JMP    LF743           ; 3
LF73D:
    LDA    $89             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
LF743:
    AND    #$0F            ; 2
    CLC                    ; 2
    ADC    $DA             ; 3
    TAY                    ; 2
    LDA    LFFA0,Y         ; 4
    STA    $D6             ; 3
    RTS                    ; 6

LF74F:
    CLC                    ; 2
    LDA    $CC             ; 3
    ADC    #$08            ; 2
    CMP    #$90            ; 2
    BCC    LF75A           ; 2
    LDA    #$40            ; 2
LF75A:
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
    BCC    LF77B           ; 2
    LDA    #$05            ; 2
LF77B:
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
    BCS    LF792           ; 2
    LDY    #$13            ; 2
    RTS                    ; 6

LF792:
    LDY    #$EF            ; 2
    RTS                    ; 6

LF795:
    LDA    #$00            ; 2
    STA    AUDC0           ; 3
    STA    AUDC1           ; 3
    STA    AUDF0           ; 3
    STA    AUDF1           ; 3
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    RTS                    ; 6

LF7A4:
    LDA    $B4             ; 3
    AND    #$0F            ; 2
    CMP    #$00            ; 2
    BEQ    LF7E9           ; 2
    CMP    #$05            ; 2
    BEQ    LF7E9           ; 2
    CMP    #$07            ; 2
    BEQ    LF7E9           ; 2
    STA    $C5             ; 3
    LDA    $B5             ; 3
    CLC                    ; 2
    ADC    #$0B            ; 2
    CMP    $A1             ; 3
    BCC    LF7D6           ; 2
    LDA    $C5             ; 3
    LSR                    ; 2
    BCC    LF7C8           ; 2
    LDA    #$10            ; 2
    BNE    LF7D1           ; 2
LF7C8:
    LSR                    ; 2
    BCC    LF7CF           ; 2
    LDA    #$20            ; 2
    BNE    LF7D1           ; 2
LF7CF:
    LDA    #$40            ; 2
LF7D1:
    CLC                    ; 2
    ADC    $B5             ; 3
    STA    $B5             ; 3
LF7D6:
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

LF7E9:
    LDA    #$00            ; 2
    STA    $C5             ; 3
    RTS                    ; 6

LF7EE:
    LDA    $A8             ; 3
    STA    WSYNC           ; 3
    CMP    $B6             ; 3
    BNE    LF7FA           ; 2
    LDA    #$07            ; 2
    STA    $B1             ; 3
LF7FA:
    LDY    $B1             ; 3
    BEQ    LF800           ; 2
    DEC    $B1             ; 5
LF800:
    LDA    LFF08,Y         ; 4
    ORA    $8D             ; 3
    AND    $A5             ; 3
    STA    COLUP1          ; 3
    LDA    ($AE),Y         ; 5
    STA    GRP1            ; 3
    JSR    LF813           ; 6
    DEC    $A8             ; 5
    RTS                    ; 6

LF813:
    STA    WSYNC           ; 3
    LDY    $A8             ; 3
    LDA    ($A6),Y         ; 5
    STA    PF0             ; 3
    RTS                    ; 6

LF81C:
    .byte $EA,$EA,$EA
LF81F:
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
    BCC    LF839           ; 2
    SBC    #$0F            ; 2
    INY                    ; 2
LF839:
    EOR    #$07            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    HMP0,X          ; 4
    STA    WSYNC           ; 3
LF843:
    DEY                    ; 2
    BPL    LF843           ; 2
    STA    RESP0,X         ; 4
    RTS                    ; 6

LF849:
    LDA    INTIM           ; 4
    BNE    LF849           ; 2
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

LF867:
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

LF880:
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    STA    PF0             ; 3
    LDA    #$38            ; 2
    LDX    #$00            ; 2
    JSR    LF81F           ; 6
    LDA    #$40            ; 2
    LDX    #$01            ; 2
    JSR    LF81F           ; 6
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
LF8B6:
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
    BPL    LF8B6           ; 2
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    RTS                    ; 6

LF8E6:
    LDA    $B4             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LFF98,Y         ; 4
    CLC                    ; 2
    LDX    #$01            ; 2
    SED                    ; 2
LF8F2:
    ADC.wx $0088,X         ; 4
    STA    $88,X           ; 4
    LDA    #$00            ; 2
    DEX                    ; 2
    BPL    LF8F2           ; 2
    CLD                    ; 2
    RTS                    ; 6

LF8FE:
    LDA    $88             ; 3
    STA    $B8             ; 3
    LDA    $89             ; 3
    STA    $B9             ; 3
    LDX    #$01            ; 2
    LDY    #$04            ; 2
LF90A:
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
    BPL    LF90A           ; 2
    LDA    #$FB            ; 2
    STA    $93             ; 3
    LDX    #$00            ; 2
LF935:
    LDA    $BB,X           ; 4
    CMP    #$08            ; 2
    BNE    LF945           ; 2
    LDA    #$00            ; 2
    STA    $BB,X           ; 4
    INX                    ; 2
    INX                    ; 2
    CMP    #$08            ; 2
    BNE    LF935           ; 2
LF945:
    RTS                    ; 6

LF946:
    LDA    #$00            ; 2
    STA    WSYNC           ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    STA    PF0             ; 3
    STA    HMCLR           ; 3
    LDA    #$13            ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    STA    HMP1            ; 3
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    STA    RESP0           ; 3
    STA    RESP1           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #$0F            ; 2
    STA    COLUP1          ; 3
    STA    COLUP0          ; 3
    LDY    #$08            ; 2
LF972:
    STY    $C5             ; 3
    LDA    $19E3,Y         ; 4
    STA    $A0             ; 3
    STA    WSYNC           ; 3
    LDA    $1F50,Y         ; 4
    STA.w  $001B           ; 4
    LDA    $1F59,Y         ; 4
    STA.w  $001C           ; 4
    LDA    $1F62,Y         ; 4
    STA.w  $001B           ; 4
    LDA    $19DA,Y         ; 4
    TAX                    ; 2
    LDA    $1F6B,Y         ; 4
    LDY    $A0             ; 3
    NOP                    ; 2
    STA    GRP1            ; 3
    STX    GRP0            ; 3
    STY    GRP1            ; 3
    STA    GRP0            ; 3
    LDY    $C5             ; 3
    DEY                    ; 2
    BPL    LF972           ; 2
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    RTS                    ; 6

LF9AD:
    .byte $02,$60,$1C,$85,$1B,$85,$25,$85,$26,$60,$01,$85,$04,$85,$05,$A9
    .byte $0C,$85,$07,$85,$06,$A2,$08,$EA,$EA,$EA,$EA,$85,$2B,$85,$02,$BD
    .byte $50,$FF,$85,$1B,$BD,$59,$FF,$85,$1C,$EA,$EA,$EA,$EA
LF9DA:
    .byte $00,$E5,$15,$65,$85,$75,$00,$04,$00
LF9E3:
    .byte $00,$E9,$29,$29,$29,$EF,$00,$00,$00,$FF,$FF,$FF,$FF,$E9,$0A,$85
    .byte $A8,$A5,$DD,$85,$E7,$A5,$94,$F0,$03,$4C,$51,$F2,$20,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$44,$00,$20,$01,$44,$00,$4A,$4A,$90
    .byte $F9,$4C,$2F,$F0,$A0,$FF,$4A,$4A,$B0,$02,$A0,$0F,$84,$A5,$A0,$15
    .byte $AD,$82,$02,$0A,$0A,$B0,$02,$A0,$10,$84,$E2,$A5,$94,$F0,$13,$A5
    .byte $E8,$C9,$11,$B0,$10,$A9,$07,$85,$86,$20,$EB,$F6,$A9,$00,$00,$24
    .byte $5A,$99,$42,$24,$18,$00,$10,$44,$28,$92,$28,$44,$10,$00,$63,$22
    .byte $14,$08,$55,$36,$08,$00,$10,$28,$44,$D6,$28,$6C,$00,$00,$24,$00
    .byte $5A,$5A,$81,$18,$24,$00,$10,$38,$54,$FE,$10,$38,$7C,$00,$00,$18
    .byte $24,$18,$24,$81,$66,$00,$0C,$18,$0C,$36,$49,$49,$22,$00,$42,$5A
    .byte $24,$42,$81,$5A,$24,$00,$28,$44,$92,$92,$6C,$10,$28,$03,$20,$4F
    .byte $F7,$84,$B6,$A5,$8B,$D0,$3B,$E6,$CF,$A5,$CF,$25,$8F,$D0,$33,$E6
    .byte $D0,$A5,$D0,$29,$0F,$D0,$02,$E6,$D4,$A5,$D4,$29,$1F,$A8,$B9,$10
    .byte $FF,$85,$C5,$B9,$30,$FF,$85,$C8,$AC,$B5,$00,$C4,$C5,$B0,$02,$C8
    .byte $C8,$88,$84,$B5,$A4,$B6,$C4,$C8,$B0,$04,$C8,$C8,$C8,$00,$10,$56
    .byte $38,$5E,$64,$60,$10,$00,$10,$56,$38,$5E,$64,$00,$00,$00,$D6,$10
    .byte $28,$54,$C6,$38,$10,$00,$D6,$10,$28,$54,$C6,$38,$10,$00,$10,$38
    .byte $C6,$54,$28,$10,$D6,$00,$3C,$A5,$66,$5A,$E7,$3C,$08,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$3C,$66,$66,$66,$66,$66,$66,$3C,$3C,$18,$18
    .byte $18,$18,$18,$38,$18,$7E,$60,$60,$3C,$06,$06,$46,$3C,$3C,$46,$06
    .byte $0C,$0C,$06,$46,$3C,$0C,$0C,$0C,$7E,$4C,$2C,$1C,$0C,$7C,$46,$06
    .byte $06,$7C,$60,$60,$7E,$3C,$66,$66,$66,$7C,$60,$62,$3C,$18,$18,$18
    .byte $18,$0C,$06,$42,$7E,$3C,$66,$66,$3C,$3C,$66,$66,$3C,$3C,$46,$06
    .byte $3E,$66,$66,$66,$3C,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LFB60:
    .byte $FF,$FF,$FF,$FF,$AA,$AA,$AA,$AA,$CC,$CC,$CC,$CC,$88,$88,$88,$88
LFB70:
    .byte $07,$01,$0A,$04,$09,$0C,$05,$08,$1B,$16,$12,$10,$14,$12,$14,$16
    .byte $14,$12,$12,$10,$14,$10,$14,$10,$14,$08,$08,$07,$09,$08,$0A,$09
    .byte $0B,$0A,$0C,$0B,$0D,$0C,$0E,$0D,$0F,$00
LFB9A:
    .byte $D3,$14,$C3,$00
LFB9E:
    .byte $00,$73,$00,$73,$00,$73,$00,$73,$00,$73,$00,$73,$00,$73,$00,$73
    .byte $00,$E0,$69,$69,$29,$29,$29,$29,$29,$29,$29,$29,$29,$29,$29,$29
    .byte $29,$29,$29
LFBC1:
    .byte $00,$0F,$00,$0F,$00,$0F,$00,$0F,$00,$0F,$00,$0F,$00,$0F,$00,$0F
    .byte $00,$E0,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0D,$0D,$0B,$09,$07,$05,$03
    .byte $01,$00,$00
LFBE4:
    .byte $00,$6F,$00,$6F,$00,$6F,$00,$6F,$00,$6F,$00,$6F,$00,$6F,$00,$6F
    .byte $00,$E0,$6C,$6C,$2C,$2C,$2C,$2C,$2C,$2C,$2C,$2C,$2C,$2C,$2C,$2C
    .byte $2C,$2C,$2C,$2C,$29,$30,$FF,$85,$C8,$AC,$B5,$00,$C4,$C5,$B0,$02
    .byte $C8,$C8,$88,$84,$B5,$A4,$B6,$C4,$C8,$B0,$04,$C8,$C8,$C8,$C8,$88
    .byte $88,$84,$B6,$C6,$D6,$F0,$03,$4C,$43,$F6,$20,$33,$F7,$A4,$CD,$C0
    .byte $E0,$B0,$3C,$C0,$08,$90,$38,$A5,$05,$0A,$B0,$5E,$AD,$A2,$00,$AE
    .byte $CB,$00,$D0,$05,$18,$65,$8A,$D0,$05,$38,$A5,$A2,$E5,$8A,$85,$A2
    .byte $38,$A9,$07,$E5,$8A,$29,$FE,$85,$C5,$A5,$D7,$F0,$09,$38,$A5,$CD
    .byte $E5,$C5,$85,$CD,$D0,$48,$A5,$C5,$18,$65,$CD,$85,$CD,$D0,$3F,$A5
    .byte $8B,$05,$8C,$D0,$39,$A0,$01,$A5,$B6,$C5,$91,$B0,$02,$A0,$00,$84
    .byte $D7,$A6,$B5,$86,$A2,$A4,$B6,$84,$CD,$20,$33,$F7,$A5,$D1,$65,$D2
    .byte $29,$07,$A8,$B9,$88,$FF,$85,$8A,$D0,$14,$AD,$CB,$00,$49,$01,$85
    .byte $CB,$A5,$A2,$C9,$40,$B0,$02,$69,$08,$38,$E9,$04,$85,$A2,$A5,$8C
    .byte $D0,$0B,$A0,$E0,$A5,$8E,$4A,$B0,$02,$A0,$F0,$84,$AC,$A2,$01,$F8
    .byte $38,$A9,$00,$75,$D1,$95,$D1,$CA,$10,$F7,$D8,$20,$FE,$F8,$20,$6C
    .byte $F6,$20,$8E,$F6,$4C,$5B,$F0,$A5,$89,$29,$F0,$C5,$E6,$D0,$19,$F8
    .byte $A5,$E6,$18,$69,$50,$85,$E6,$D8,$A9,$FF,$85,$DB,$E6,$E4,$A5,$E4
    .byte $29,$03,$A8,$B9,$9A,$FB,$85,$DD,$60,$A5,$88,$00,$30,$30,$30,$30
    .byte $70,$70,$70,$70,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$70,$70,$70,$70
    .byte $30,$30,$30,$30,$30,$30,$30,$30,$10,$10,$10,$10,$30,$30,$30,$30
    .byte $10,$10,$10,$10,$30,$30,$30,$30,$30,$30,$30,$30,$70,$70,$70,$70
    .byte $70,$70,$70,$70,$30,$30,$30,$30,$10,$10,$10,$10,$10,$10,$10,$10
    .byte $70,$70,$70,$70,$F0,$F0,$F0,$F0,$70,$70,$70,$70,$30,$30,$30,$30
    .byte $70,$70,$70,$70,$30,$30,$30,$30,$10,$10,$10,$10,$10,$10,$10,$10
    .byte $30,$30,$30,$30,$70,$70,$70,$70,$F0,$F0,$F0,$F0,$70,$70,$70,$70
    .byte $F0,$F0,$F0,$F0,$70,$70,$70,$70,$10,$10,$10,$10,$30,$30,$30,$30
    .byte $10,$10,$10,$10,$10,$10,$10,$10,$30,$30,$30,$30,$70,$70,$70,$70
    .byte $10,$10,$10,$10,$30,$30,$30,$30,$70,$70,$70,$70,$F0,$F0,$F0,$F0
    .byte $F0,$F0,$F0,$F0,$70,$70,$70,$70,$30,$30,$30,$30,$F0,$F0,$F0,$F0
    .byte $F0,$F0,$F0,$F0,$30,$30,$30,$30,$10,$10,$10,$10,$10,$10,$10,$10
    .byte $30,$30,$30,$30,$10,$10,$10,$10,$10,$10,$10,$10,$30,$30,$30,$30
    .byte $30,$30,$30,$30,$70,$70,$70,$70,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0
    .byte $70,$70,$70,$70,$30,$30,$30,$30,$10,$10,$10,$10,$30,$30,$30,$30
    .byte $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$30,$30,$30,$30,$10,$10,$10,$10
    .byte $10,$10,$10,$10,$30,$30,$30,$30,$70,$70,$70,$70,$30,$30,$30,$30
    .byte $F0,$F0,$F0,$F0,$10,$10,$10,$10,$30,$30,$30,$30,$70,$70,$70,$70
    .byte $70,$70,$70,$70,$F0,$F0,$F0,$F0,$10,$10,$10,$10,$30,$30,$30,$30
    .byte $F0,$F0,$F0,$F0,$70,$70,$70,$70,$30,$30,$30,$30,$10,$10,$10,$10
    .byte $70,$70,$70,$70,$30,$30,$30,$30,$10,$10,$10,$10,$10,$10,$10,$10
    .byte $30,$30,$30,$30,$10,$10,$10,$10,$70,$70,$70,$70,$70,$70,$70,$70
    .byte $30,$30,$30,$30,$10,$10,$10,$10,$30,$30,$30,$30,$30,$30,$30,$30
    .byte $70,$70,$70,$70,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$70,$70,$70,$70
    .byte $30,$30,$30,$30,$30,$30,$30,$30,$10,$10,$10,$10,$30,$30,$30,$30
    .byte $10,$10,$10,$10,$30,$30,$30,$30,$30,$30,$30,$30,$70,$70,$70,$70
    .byte $70,$70,$70,$70,$30,$30,$30,$30,$10,$10,$10,$10,$10,$10,$10,$10
    .byte $70,$70,$70,$70,$F0,$F0,$F0,$F0,$70,$70,$70,$70,$30,$30,$30,$30
    .byte $70,$70,$70,$70,$30,$30,$30,$30,$10,$10,$10,$10,$10,$10,$10,$10
    .byte $30,$30,$30,$30,$70,$70,$70,$70,$F0,$F0,$F0,$F0,$70,$70,$70,$70
    .byte $F0,$F0,$F0,$F0,$70,$70,$70,$70,$10,$10,$10,$10,$30,$30,$30,$30
    .byte $10,$10,$10,$10,$10,$10,$10,$10,$30,$30,$30,$30
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
    .byte $00,$97,$94,$94,$94,$F7,$80,$80,$80
LFF59:
    .byte $00,$AA,$AA,$AA,$AA,$BE,$00,$00,$00
LFF62:
    .byte $00,$F0,$80,$F0,$90,$F0,$00,$00,$00
LFF6B:
    .byte $00,$12,$2A,$2A,$2A,$2A,$00,$02,$00
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
    .byte $98,$0A,$0A,$0A,$18,$69,$08,$85,$92,$A9,$00,$85,$88,$85,$89,$A0
    .byte $01,$A5,$87,$4A,$4A,$B0,$02,$A0,$03,$84,$8F,$A9,$60,$85,$8C,$85
    .byte $8B,$AD,$82,$02,$4A,$4A,$90,$F9,$4C,$2F,$F0,$A0,$FF,$4A,$4A,$B0
    .byte $02,$A0,$0F,$84,$A5,$A0,$15,$AD,$82,$02,$0A,$0A,$B0,$02,$A0,$10
    .byte $84,$E2,$A5,$94,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$F0,$00,$F0
