; Disassembly of spctnlp.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcSpacet.cfg spctnlp.bin 
;
; Spacet.cfg contents:
;
;      ORG F000
;      CODE F000 F9FC
;      GFX F9FD FA09
;      CODE FA0A FA2F
;      CODE FA30 FA3F
;      GFX FA40 FA8D
;      CODE FA8E FACE
;      GFX FACF FFFF

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
LF9FD   =   $F9FD
LFAB8   =   $FAB8

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
LF401:
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
    BRK                    ; 7
    ORA    ($03,X)         ; 6
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

    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
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

    BRK                    ; 7
    STA    $8C             ; 3
    LDA    #$50            ; 2
    STA    $90             ; 3
    BNE    LF9F2           ; 2
    LDA    $C9             ; 3
    BNE    LF9C6           ; 2
    LDA    REFP1           ; 3
    ASL                    ; 2
    BCS    LF9C6           ; 2
    LDY    #$04            ; 2
    LDA    $E2             ; 3
    AND    #$0F            ; 2
    BEQ    LF9B1           ; 2
    LDY    #$08            ; 2
LF9B1:
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
LF9C6:
    LDA    $86             ; 3
    BEQ    LF9F2           ; 2
    LDA    $8C             ; 3
    BNE    LF9F2           ; 2
    LDA    WSYNC           ; 3
    ASL                    ; 2
    BCS    LF9E1           ; 2
    LDA    VBLANK          ; 3
    ASL                    ; 2
    BCS    LF9E1           ; 2
    LDA    $8B             ; 3
    BNE    LF9F2           ; 2
    LDA    COLUP1          ; 3
    ASL                    ; 2
    BCC    LF9F2           ; 2
LF9E1:
    LDA    #$70            ; 2
    STA    $8C             ; 3
    LDA    #$D0            ; 2
    STA    $AC             ; 3
    LDA    #$11            ; 2
    STA    $CD             ; 3
    STA    $B6             ; 3
    JMP    LF429           ; 3
LF9F2:
    LDA    $8C             ; 3
    BNE    LFA30           ; 2
    LDA    $8B             ; 3
    BEQ    LFA02           ; 2
    CMP    #$10            ; 2
    BEQ    LF9FD           ; 2
    .byte $FF ; |XXXXXXXX| $F9FE
    .byte $FF ; |XXXXXXXX| $F9FF
    .byte $00 ; |        | $FA00
    .byte $00 ; |        | $FA01
LFA02:
    .byte $00 ; |        | $FA02
    .byte $00 ; |        | $FA03
    .byte $00 ; |        | $FA04
    .byte $00 ; |        | $FA05
    .byte $00 ; |        | $FA06
    .byte $00 ; |        | $FA07
    .byte $00 ; |        | $FA08
    .byte $00 ; |        | $FA09
    .byte $44 ;.NOOP; 3
    BRK                    ; 7
    JSR    $4401           ; 6
    BRK                    ; 7
    SED                    ; 2
    SEC                    ; 2
    LDA    $D9             ; 3
    SBC    #$10            ; 2
    STA    $D9             ; 3
    LDA    $D8             ; 3
    SBC    #$00            ; 2
    STA    $D8             ; 3
    CLD                    ; 2
    JMP    LF4A5           ; 3
    INC    $A6             ; 5
    INC    $A6             ; 5
    DEC    $A4             ; 5
    LDA    $A4             ; 3
    AND    #$07            ; 2
    STA    $AA             ; 3
    CMP    #$07            ; 2
LFA30:
    BNE    LFA41           ; 2
    SED                    ; 2
    CLC                    ; 2
    LDA    $D9             ; 3
    ADC    #$10            ; 2
    STA    $D9             ; 3
    LDA    $D8             ; 3
    ADC    #$00            ; 2
    STA    $D8             ; 3
    .byte $00 ; |        | $FA40
LFA41:
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
    BPL    LFAB8           ; 2
    STA    NUSIZ0          ; 3
    LDA    $81             ; 3
    STA    NUSIZ1          ; 3
    STA    HMCLR           ; 3
    LDY    #$07            ; 2
LFA9A:
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
    BPL    LFA9A           ; 2
    RTS                    ; 6

    LDA    #$FA            ; 2
    STA    $83             ; 3
    STA    $85             ; 3
    LDY    $86             ; 3
    BEQ    LFAC4           ; 2
    DEY                    ; 2
    CPY    #$04            ; 2
    BCS    LFAE2           ; 2
    CPY    #$01            ; 2
    BCS    LFAD0           ; 2
LFAC4:
    LDA    #$00            ; 2
    STA    $80             ; 3
    STA    $81             ; 3
    STA    $82             ; 3
    STA    $84             ; 3
    BEQ    LFAF5           ; 2
LFAD0:
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
LFAE2:
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
LFAF5:
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
    .byte $FF ; |XXXXXXXX| $FBDE
    .byte $FF ; |XXXXXXXX| $FBDF
    .byte $C8 ; |XX  X   | $FBE0
    .byte $C0 ; |XX      | $FBE1
    .byte $F0 ; |XXXX    | $FBE2
    .byte $90 ; |X  X    | $FBE3
    .byte $11 ; |   X   X| $FBE4
    .byte $20 ; |  X     | $FBE5
    .byte $4A ; | X  X X | $FBE6
    .byte $F7 ; |XXXX XXX| $FBE7
    .byte $4C ; | X  XX  | $FBE8
    .byte $72 ; | XXX  X | $FBE9
    .byte $F5 ; |XXXX X X| $FBEA
    .byte $88 ; |X   X   | $FBEB
    .byte $88 ; |X   X   | $FBEC
    .byte $88 ; |X   X   | $FBED
    .byte $88 ; |X   X   | $FBEE
    .byte $C0 ; |XX      | $FBEF
    .byte $11 ; |   X   X| $FBF0
    .byte $B0 ; |X XX    | $FBF1
    .byte $03 ; |      XX| $FBF2
    .byte $20 ; |  X     | $FBF3
    .byte $4A ; | X  X X | $FBF4
    .byte $F7 ; |XXXX XXX| $FBF5
    .byte $84 ; |X    X  | $FBF6
    .byte $B6 ; |X XX XX | $FBF7
    .byte $A5 ; |X X  X X| $FBF8
    .byte $8B ; |X   X XX| $FBF9
    .byte $D0 ; |XX X    | $FBFA
    .byte $3B ; |  XXX XX| $FBFB
    .byte $E6 ; |XXX  XX | $FBFC
    .byte $CF ; |XX  XXXX| $FBFD
    .byte $A5 ; |X X  X X| $FBFE
    .byte $CF ; |XX  XXXX| $FBFF
    .byte $FF ; |XXXXXXXX| $FC00
    .byte $FF ; |XXXXXXXX| $FC01
    .byte $FF ; |XXXXXXXX| $FC02
    .byte $FF ; |XXXXXXXX| $FC03
    .byte $FF ; |XXXXXXXX| $FC04
    .byte $FF ; |XXXXXXXX| $FC05
    .byte $FF ; |XXXXXXXX| $FC06
    .byte $FF ; |XXXXXXXX| $FC07
    .byte $FF ; |XXXXXXXX| $FC08
    .byte $FF ; |XXXXXXXX| $FC09
    .byte $FF ; |XXXXXXXX| $FC0A
    .byte $FF ; |XXXXXXXX| $FC0B
    .byte $FF ; |XXXXXXXX| $FC0C
    .byte $FF ; |XXXXXXXX| $FC0D
    .byte $FF ; |XXXXXXXX| $FC0E
    .byte $FF ; |XXXXXXXX| $FC0F
    .byte $FF ; |XXXXXXXX| $FC10
    .byte $FF ; |XXXXXXXX| $FC11
    .byte $FF ; |XXXXXXXX| $FC12
    .byte $FF ; |XXXXXXXX| $FC13
    .byte $FF ; |XXXXXXXX| $FC14
    .byte $FF ; |XXXXXXXX| $FC15
    .byte $FF ; |XXXXXXXX| $FC16
    .byte $FF ; |XXXXXXXX| $FC17
    .byte $FF ; |XXXXXXXX| $FC18
    .byte $FF ; |XXXXXXXX| $FC19
    .byte $FF ; |XXXXXXXX| $FC1A
    .byte $FF ; |XXXXXXXX| $FC1B
    .byte $FF ; |XXXXXXXX| $FC1C
    .byte $FF ; |XXXXXXXX| $FC1D
    .byte $FF ; |XXXXXXXX| $FC1E
    .byte $FF ; |XXXXXXXX| $FC1F
    .byte $FF ; |XXXXXXXX| $FC20
    .byte $FF ; |XXXXXXXX| $FC21
    .byte $FF ; |XXXXXXXX| $FC22
    .byte $FF ; |XXXXXXXX| $FC23
    .byte $FF ; |XXXXXXXX| $FC24
    .byte $FF ; |XXXXXXXX| $FC25
    .byte $FF ; |XXXXXXXX| $FC26
    .byte $FF ; |XXXXXXXX| $FC27
    .byte $FF ; |XXXXXXXX| $FC28
    .byte $FF ; |XXXXXXXX| $FC29
    .byte $FF ; |XXXXXXXX| $FC2A
    .byte $FF ; |XXXXXXXX| $FC2B
    .byte $FF ; |XXXXXXXX| $FC2C
    .byte $FF ; |XXXXXXXX| $FC2D
    .byte $FF ; |XXXXXXXX| $FC2E
    .byte $FF ; |XXXXXXXX| $FC2F
    .byte $FF ; |XXXXXXXX| $FC30
    .byte $FF ; |XXXXXXXX| $FC31
    .byte $FF ; |XXXXXXXX| $FC32
    .byte $FF ; |XXXXXXXX| $FC33
    .byte $FF ; |XXXXXXXX| $FC34
    .byte $FF ; |XXXXXXXX| $FC35
    .byte $FF ; |XXXXXXXX| $FC36
    .byte $FF ; |XXXXXXXX| $FC37
    .byte $FF ; |XXXXXXXX| $FC38
    .byte $FF ; |XXXXXXXX| $FC39
    .byte $FF ; |XXXXXXXX| $FC3A
    .byte $FF ; |XXXXXXXX| $FC3B
    .byte $FF ; |XXXXXXXX| $FC3C
    .byte $FF ; |XXXXXXXX| $FC3D
    .byte $FF ; |XXXXXXXX| $FC3E
    .byte $FF ; |XXXXXXXX| $FC3F
    .byte $FF ; |XXXXXXXX| $FC40
    .byte $FF ; |XXXXXXXX| $FC41
    .byte $FF ; |XXXXXXXX| $FC42
    .byte $FF ; |XXXXXXXX| $FC43
    .byte $FF ; |XXXXXXXX| $FC44
    .byte $FF ; |XXXXXXXX| $FC45
    .byte $FF ; |XXXXXXXX| $FC46
    .byte $FF ; |XXXXXXXX| $FC47
    .byte $FF ; |XXXXXXXX| $FC48
    .byte $FF ; |XXXXXXXX| $FC49
    .byte $FF ; |XXXXXXXX| $FC4A
    .byte $FF ; |XXXXXXXX| $FC4B
    .byte $FF ; |XXXXXXXX| $FC4C
    .byte $FF ; |XXXXXXXX| $FC4D
    .byte $FF ; |XXXXXXXX| $FC4E
    .byte $FF ; |XXXXXXXX| $FC4F
    .byte $00 ; |        | $FC50
    .byte $00 ; |        | $FC51
    .byte $00 ; |        | $FC52
    .byte $00 ; |        | $FC53
    .byte $00 ; |        | $FC54
    .byte $00 ; |        | $FC55
    .byte $00 ; |        | $FC56
    .byte $00 ; |        | $FC57
    .byte $00 ; |        | $FC58
    .byte $00 ; |        | $FC59
    .byte $00 ; |        | $FC5A
    .byte $00 ; |        | $FC5B
    .byte $00 ; |        | $FC5C
    .byte $00 ; |        | $FC5D
    .byte $00 ; |        | $FC5E
    .byte $00 ; |        | $FC5F
    .byte $00 ; |        | $FC60
    .byte $00 ; |        | $FC61
    .byte $00 ; |        | $FC62
    .byte $00 ; |        | $FC63
    .byte $00 ; |        | $FC64
    .byte $00 ; |        | $FC65
    .byte $00 ; |        | $FC66
    .byte $00 ; |        | $FC67
    .byte $00 ; |        | $FC68
    .byte $00 ; |        | $FC69
    .byte $00 ; |        | $FC6A
    .byte $00 ; |        | $FC6B
    .byte $00 ; |        | $FC6C
    .byte $00 ; |        | $FC6D
    .byte $00 ; |        | $FC6E
    .byte $00 ; |        | $FC6F
    .byte $00 ; |        | $FC70
    .byte $00 ; |        | $FC71
    .byte $00 ; |        | $FC72
    .byte $00 ; |        | $FC73
    .byte $00 ; |        | $FC74
    .byte $00 ; |        | $FC75
    .byte $00 ; |        | $FC76
    .byte $00 ; |        | $FC77
    .byte $00 ; |        | $FC78
    .byte $00 ; |        | $FC79
    .byte $00 ; |        | $FC7A
    .byte $00 ; |        | $FC7B
    .byte $00 ; |        | $FC7C
    .byte $00 ; |        | $FC7D
    .byte $00 ; |        | $FC7E
    .byte $4C ; | X  XX  | $FC7F
    .byte $49 ; | X  X  X| $FC80
    .byte $4E ; | X  XXX | $FC81
    .byte $4B ; | X  X XX| $FC82
    .byte $20 ; |  X     | $FC83
    .byte $31 ; |  XX   X| $FC84
    .byte $2E ; |  X XXX | $FC85
    .byte $36 ; |  XX XX | $FC86
    .byte $0D ; |    XX X| $FC87
    .byte $49 ; | X  X  X| $FC88
    .byte $4E ; | X  XXX | $FC89
    .byte $49 ; | X  X  X| $FC8A
    .byte $54 ; | X X X  | $FC8B
    .byte $20 ; |  X     | $FC8C
    .byte $2F ; |  X XXXX| $FC8D
    .byte $F0 ; |XXXX    | $FC8E
    .byte $C1 ; |XX     X| $FC8F
    .byte $41 ; | X     X| $FC90
    .byte $20 ; |  X     | $FC91
    .byte $20 ; |  X     | $FC92
    .byte $20 ; |  X     | $FC93
    .byte $20 ; |  X     | $FC94
    .byte $05 ; |     X X| $FC95
    .byte $F0 ; |XXXX    | $FC96
    .byte $D4 ; |XX X X  | $FC97
    .byte $4F ; | X  XXXX| $FC98
    .byte $50 ; | X X    | $FC99
    .byte $20 ; |  X     | $FC9A
    .byte $20 ; |  X     | $FC9B
    .byte $20 ; |  X     | $FC9C
    .byte $00 ; |        | $FC9D
    .byte $F0 ; |XXXX    | $FC9E
    .byte $54 ; | X X X  | $FC9F
    .byte $50 ; | X X    | $FCA0
    .byte $4C ; | X  XX  | $FCA1
    .byte $45 ; | X   X X| $FCA2
    .byte $4E ; | X  XXX | $FCA3
    .byte $20 ; |  X     | $FCA4
    .byte $FF ; |XXXXXXXX| $FCA5
    .byte $00 ; |        | $FCA6
    .byte $58 ; | X XX   | $FCA7
    .byte $4D ; | X  XX X| $FCA8
    .byte $49 ; | X  X  X| $FCA9
    .byte $4E ; | X  XXX | $FCAA
    .byte $20 ; |  X     | $FCAB
    .byte $20 ; |  X     | $FCAC
    .byte $08 ; |    X   | $FCAD
    .byte $00 ; |        | $FCAE
    .byte $59 ; | X XX  X| $FCAF
    .byte $4D ; | X  XX X| $FCB0
    .byte $49 ; | X  X  X| $FCB1
    .byte $4E ; | X  XXX | $FCB2
    .byte $20 ; |  X     | $FCB3
    .byte $20 ; |  X     | $FCB4
    .byte $08 ; |    X   | $FCB5
    .byte $00 ; |        | $FCB6
    .byte $59 ; | X XX  X| $FCB7
    .byte $4D ; | X  XX X| $FCB8
    .byte $41 ; | X     X| $FCB9
    .byte $58 ; | X XX   | $FCBA
    .byte $20 ; |  X     | $FCBB
    .byte $20 ; |  X     | $FCBC
    .byte $EC ; |XXX XX  | $FCBD
    .byte $00 ; |        | $FCBE
    .byte $58 ; | X XX   | $FCBF
    .byte $4D ; | X  XX X| $FCC0
    .byte $41 ; | X     X| $FCC1
    .byte $58 ; | X XX   | $FCC2
    .byte $20 ; |  X     | $FCC3
    .byte $20 ; |  X     | $FCC4
    .byte $90 ; |X  X    | $FCC5
    .byte $00 ; |        | $FCC6
    .byte $53 ; | X X  XX| $FCC7
    .byte $54 ; | X X X  | $FCC8
    .byte $41 ; | X     X| $FCC9
    .byte $52 ; | X X  X | $FCCA
    .byte $54 ; | X X X  | $FCCB
    .byte $20 ; |  X     | $FCCC
    .byte $00 ; |        | $FCCD
    .byte $00 ; |        | $FCCE
    .byte $43 ; | X    XX| $FCCF
    .byte $45 ; | X   X X| $FCD0
    .byte $4E ; | X  XXX | $FCD1
    .byte $54 ; | X X X  | $FCD2
    .byte $20 ; |  X     | $FCD3
    .byte $20 ; |  X     | $FCD4
    .byte $A0 ; |X X     | $FCD5
    .byte $00 ; |        | $FCD6
    .byte $43 ; | X    XX| $FCD7
    .byte $43 ; | X    XX| $FCD8
    .byte $30 ; |  XX    | $FCD9
    .byte $39 ; |  XXX  X| $FCDA
    .byte $20 ; |  X     | $FCDB
    .byte $20 ; |  X     | $FCDC
    .byte $73 ; | XXX  XX| $FCDD
    .byte $00 ; |        | $FCDE
    .byte $43 ; | X    XX| $FCDF
    .byte $43 ; | X    XX| $FCE0
    .byte $30 ; |  XX    | $FCE1
    .byte $36 ; |  XX XX | $FCE2
    .byte $20 ; |  X     | $FCE3
    .byte $20 ; |  X     | $FCE4
    .byte $2C ; |  X XX  | $FCE5
    .byte $00 ; |        | $FCE6
    .byte $43 ; | X    XX| $FCE7
    .byte $43 ; | X    XX| $FCE8
    .byte $30 ; |  XX    | $FCE9
    .byte $37 ; |  XX XXX| $FCEA
    .byte $20 ; |  X     | $FCEB
    .byte $20 ; |  X     | $FCEC
    .byte $38 ; |  XXX   | $FCED
    .byte $00 ; |        | $FCEE
    .byte $43 ; | X    XX| $FCEF
    .byte $43 ; | X    XX| $FCF0
    .byte $30 ; |  XX    | $FCF1
    .byte $38 ; |  XXX   | $FCF2
    .byte $20 ; |  X     | $FCF3
    .byte $20 ; |  X     | $FCF4
    .byte $2E ; |  X XXX | $FCF5
    .byte $00 ; |        | $FCF6
    .byte $FF ; |XXXXXXXX| $FCF7
    .byte $FC ; |XXXXXX  | $FCF8
    .byte $FC ; |XXXXXX  | $FCF9
    .byte $FC ; |XXXXXX  | $FCFA
    .byte $FC ; |XXXXXX  | $FCFB
    .byte $FC ; |XXXXXX  | $FCFC
    .byte $FC ; |XXXXXX  | $FCFD
    .byte $FC ; |XXXXXX  | $FCFE
    .byte $FC ; |XXXXXX  | $FCFF
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
    .byte $AE ; |X X XXX | $FF00
    .byte $66 ; | XX  XX | $FF01
    .byte $88 ; |X   X   | $FF02
    .byte $CA ; |XX  X X | $FF03
    .byte $4A ; | X  X X | $FF04
    .byte $AA ; |X X X X | $FF05
    .byte $88 ; |X   X   | $FF06
    .byte $AE ; |X X XXX | $FF07
LFF08:
    .byte $2C ; |  X XX  | $FF08
    .byte $2C ; |  X XX  | $FF09
    .byte $08 ; |    X   | $FF0A
    .byte $67 ; | XX  XXX| $FF0B
    .byte $64 ; | XX  X  | $FF0C
    .byte $2B ; |  X X XX| $FF0D
    .byte $2C ; |  X XX  | $FF0E
    .byte $00 ; |        | $FF0F
LFF10:
    .byte $6A ; | XX X X | $FF10
    .byte $48 ; | X  X   | $FF11
    .byte $34 ; |  XX X  | $FF12
    .byte $16 ; |   X XX | $FF13
    .byte $08 ; |    X   | $FF14
    .byte $06 ; |     XX | $FF15
    .byte $5D ; | X XXX X| $FF16
    .byte $74 ; | XXX X  | $FF17
    .byte $82 ; |X     X | $FF18
    .byte $6C ; | XX XX  | $FF19
    .byte $4F ; | X  XXXX| $FF1A
    .byte $3D ; |  XXXX X| $FF1B
    .byte $38 ; |  XXX   | $FF1C
    .byte $48 ; | X  X   | $FF1D
    .byte $5A ; | X XX X | $FF1E
    .byte $32 ; |  XX  X | $FF1F
    .byte $36 ; |  XX XX | $FF20
    .byte $1A ; |   XX X | $FF21
    .byte $05 ; |     X X| $FF22
    .byte $24 ; |  X  X  | $FF23
    .byte $12 ; |   X  X | $FF24
    .byte $44 ; | X   X  | $FF25
    .byte $64 ; | XX  X  | $FF26
    .byte $5A ; | X XX X | $FF27
    .byte $7C ; | XXXXX  | $FF28
    .byte $6A ; | XX X X | $FF29
    .byte $86 ; |X    XX | $FF2A
    .byte $3F ; |  XXXXXX| $FF2B
    .byte $93 ; |X  X  XX| $FF2C
    .byte $6A ; | XX X X | $FF2D
    .byte $5F ; | X XXXXX| $FF2E
    .byte $44 ; | X   X  | $FF2F
LFF30:
    .byte $1A ; |   XX X | $FF30
    .byte $24 ; |  X  X  | $FF31
    .byte $42 ; | X    X | $FF32
    .byte $74 ; | XXX X  | $FF33
    .byte $B3 ; |X XX  XX| $FF34
    .byte $DE ; |XX XXXX | $FF35
    .byte $EC ; |XXX XX  | $FF36
    .byte $E2 ; |XXX   X | $FF37
    .byte $86 ; |X    XX | $FF38
    .byte $70 ; | XXX    | $FF39
    .byte $52 ; | X X  X | $FF3A
    .byte $6D ; | XX XX X| $FF3B
    .byte $B4 ; |X XX X  | $FF3C
    .byte $C6 ; |XX   XX | $FF3D
    .byte $C0 ; |XX      | $FF3E
    .byte $A0 ; |X X     | $FF3F
    .byte $C6 ; |XX   XX | $FF40
    .byte $E2 ; |XXX   X | $FF41
    .byte $B8 ; |X XXX   | $FF42
    .byte $64 ; | XX  X  | $FF43
    .byte $38 ; |  XXX   | $FF44
    .byte $22 ; |  X   X | $FF45
    .byte $44 ; | X   X  | $FF46
    .byte $88 ; |X   X   | $FF47
    .byte $54 ; | X X X  | $FF48
    .byte $78 ; | XXXX   | $FF49
    .byte $A4 ; |X X  X  | $FF4A
    .byte $C1 ; |XX     X| $FF4B
    .byte $D8 ; |XX XX   | $FF4C
    .byte $C8 ; |XX  X   | $FF4D
    .byte $C1 ; |XX     X| $FF4E
    .byte $92 ; |X  X  X | $FF4F
LFF50:
    .byte $00 ; |        | $FF50
    .byte $31 ; |  XX   X| $FF51
    .byte $49 ; | X  X  X| $FF52
    .byte $B5 ; |X XX X X| $FF53
    .byte $A5 ; |X X  X X| $FF54
    .byte $A5 ; |X X  X X| $FF55
    .byte $B5 ; |X XX X X| $FF56
    .byte $49 ; | X  X  X| $FF57
    .byte $31 ; |  XX   X| $FF58
LFF59:
    .byte $00 ; |        | $FF59
    .byte $D2 ; |XX X  X | $FF5A
    .byte $D2 ; |XX X  X | $FF5B
    .byte $52 ; | X X  X | $FF5C
    .byte $D2 ; |XX X  X | $FF5D
    .byte $92 ; |X  X  X | $FF5E
    .byte $D2 ; |XX X  X | $FF5F
    .byte $57 ; | X X XXX| $FF60
    .byte $D7 ; |XX X XXX| $FF61
LFF62:
    .byte $00 ; |        | $FF62
    .byte $37 ; |  XX XXX| $FF63
    .byte $37 ; |  XX XXX| $FF64
    .byte $37 ; |  XX XXX| $FF65
    .byte $25 ; |  X  X X| $FF66
    .byte $25 ; |  X  X X| $FF67
    .byte $25 ; |  X  X X| $FF68
    .byte $37 ; |  XX XXX| $FF69
    .byte $37 ; |  XX XXX| $FF6A
LFF6B:
    .byte $00 ; |        | $FF6B
    .byte $54 ; | X X X  | $FF6C
    .byte $54 ; | X X X  | $FF6D
    .byte $64 ; | XX  X  | $FF6E
    .byte $77 ; | XXX XXX| $FF6F
    .byte $77 ; | XXX XXX| $FF70
    .byte $55 ; | X X X X| $FF71
    .byte $55 ; | X X X X| $FF72
    .byte $77 ; | XXX XXX| $FF73
LFF74:
    .byte $08 ; |    X   | $FF74
    .byte $05 ; |     X X| $FF75
    .byte $03 ; |      XX| $FF76
    .byte $01 ; |       X| $FF77
LFF78:
    .byte $00 ; |        | $FF78
    .byte $01 ; |       X| $FF79
    .byte $02 ; |      X | $FF7A
    .byte $03 ; |      XX| $FF7B
    .byte $04 ; |     X  | $FF7C
    .byte $03 ; |      XX| $FF7D
    .byte $02 ; |      X | $FF7E
    .byte $01 ; |       X| $FF7F
LFF80:
    .byte $38 ; |  XXX   | $FF80
    .byte $18 ; |   XX   | $FF81
    .byte $0E ; |    XXX | $FF82
    .byte $2E ; |  X XXX | $FF83
    .byte $5A ; | X XX X | $FF84
    .byte $4C ; | X  XX  | $FF85
    .byte $8A ; |X   X X | $FF86
    .byte $AA ; |X X X X | $FF87
LFF88:
    .byte $02 ; |      X | $FF88
    .byte $01 ; |       X| $FF89
    .byte $03 ; |      XX| $FF8A
    .byte $05 ; |     X X| $FF8B
    .byte $03 ; |      XX| $FF8C
    .byte $04 ; |     X  | $FF8D
    .byte $04 ; |     X  | $FF8E
    .byte $01 ; |       X| $FF8F
LFF90:
    .byte $2E ; |  X XXX | $FF90
    .byte $C8 ; |XX  X   | $FF91
    .byte $C8 ; |XX  X   | $FF92
    .byte $64 ; | XX  X  | $FF93
    .byte $C8 ; |XX  X   | $FF94
    .byte $2E ; |  X XXX | $FF95
    .byte $64 ; | XX  X  | $FF96
    .byte $BA ; |X XXX X | $FF97
LFF98:
    .byte $03 ; |      XX| $FF98
    .byte $05 ; |     X X| $FF99
    .byte $05 ; |     X X| $FF9A
    .byte $08 ; |    X   | $FF9B
    .byte $05 ; |     X X| $FF9C
    .byte $03 ; |      XX| $FF9D
    .byte $08 ; |    X   | $FF9E
    .byte $04 ; |     X  | $FF9F
LFFA0:
    .byte $07 ; |     XXX| $FFA0
    .byte $06 ; |     XX | $FFA1
    .byte $05 ; |     X X| $FFA2
    .byte $05 ; |     X X| $FFA3
    .byte $04 ; |     X  | $FFA4
    .byte $04 ; |     X  | $FFA5
    .byte $03 ; |      XX| $FFA6
    .byte $03 ; |      XX| $FFA7
    .byte $02 ; |      X | $FFA8
    .byte $01 ; |       X| $FFA9
    .byte $03 ; |      XX| $FFAA
    .byte $04 ; |     X  | $FFAB
    .byte $05 ; |     X X| $FFAC
    .byte $01 ; |       X| $FFAD
    .byte $04 ; |     X  | $FFAE
    .byte $02 ; |      X | $FFAF
    .byte $FF ; |XXXXXXXX| $FFB0
    .byte $85 ; |X    X X| $FFB1
    .byte $1B ; |   XX XX| $FFB2
    .byte $84 ; |X    X  | $FFB3
    .byte $1C ; |   XXX  | $FFB4
    .byte $85 ; |X    X X| $FFB5
    .byte $2B ; |  X X XX| $FFB6
    .byte $CA ; |XX  X X | $FFB7
    .byte $10 ; |   X    | $FFB8
    .byte $DF ; |XX XXXXX| $FFB9
    .byte $60 ; | XX     | $FFBA
    .byte $00 ; |        | $FFBB
    .byte $85 ; |X    X X| $FFBC
    .byte $8C ; |X   XX  | $FFBD
    .byte $A9 ; |X X X  X| $FFBE
    .byte $50 ; | X X    | $FFBF
    .byte $85 ; |X    X X| $FFC0
    .byte $90 ; |X  X    | $FFC1
    .byte $D0 ; |XX X    | $FFC2
    .byte $54 ; | X X X  | $FFC3
    .byte $A5 ; |X X  X X| $FFC4
    .byte $C9 ; |XX  X  X| $FFC5
    .byte $D0 ; |XX X    | $FFC6
    .byte $24 ; |  X  X  | $FFC7
    .byte $A5 ; |X X  X X| $FFC8
    .byte $0C ; |    XX  | $FFC9
    .byte $0A ; |    X X | $FFCA
    .byte $B0 ; |X XX    | $FFCB
    .byte $1F ; |   XXXXX| $FFCC
    .byte $A0 ; |X X     | $FFCD
    .byte $04 ; |     X  | $FFCE
    .byte $A5 ; |X X  X X| $FFCF
    .byte $E2 ; |XXX   X | $FFD0
    .byte $29 ; |  X X  X| $FFD1
    .byte $0F ; |    XXXX| $FFD2
    .byte $F0 ; |XXXX    | $FFD3
    .byte $02 ; |      X | $FFD4
    .byte $A0 ; |X X     | $FFD5
    .byte $08 ; |    X   | $FFD6
    .byte $98 ; |X  XX   | $FFD7
    .byte $18 ; |   XX   | $FFD8
    .byte $65 ; | XX  X X| $FFD9
    .byte $90 ; |X  X    | $FFDA
    .byte $85 ; |X    X X| $FFDB
    .byte $A1 ; |X X    X| $FFDC
    .byte $A5 ; |X X  X X| $FFDD
    .byte $91 ; |X  X   X| $FFDE
    .byte $38 ; |  XXX   | $FFDF
    .byte $E9 ; |XXX X  X| $FFE0
    .byte $04 ; |     X  | $FFE1
    .byte $85 ; |X    X X| $FFE2
    .byte $C6 ; |XX   XX | $FFE3
    .byte $A5 ; |X X  X X| $FFE4
    .byte $8E ; |X   XXX | $FFE5
    .byte $85 ; |X    X X| $FFE6
    .byte $C7 ; |XX   XXX| $FFE7
    .byte $A9 ; |X X X  X| $FFE8
    .byte $50 ; | X X    | $FFE9
    .byte $85 ; |X    X X| $FFEA
    .byte $C9 ; |XX  X  X| $FFEB
    .byte $A5 ; |X X  X X| $FFEC
    .byte $86 ; |X    XX | $FFED
    .byte $F0 ; |XXXX    | $FFEE
    .byte $28 ; |  X X   | $FFEF
    .byte $A5 ; |X X  X X| $FFF0
    .byte $8C ; |X   XX  | $FFF1
    .byte $D0 ; |XX X    | $FFF2
    .byte $24 ; |  X  X  | $FFF3
    .byte $A5 ; |X X  X X| $FFF4
    .byte $02 ; |      X | $FFF5
    .byte $0A ; |    X X | $FFF6
    .byte $B0 ; |X XX    | $FFF7
    .byte $FF ; |XXXXXXXX| $FFF8
    .byte $FF ; |XXXXXXXX| $FFF9
    .byte $FF ; |XXXXXXXX| $FFFA
    .byte $FF ; |XXXXXXXX| $FFFB
    .byte $00 ; |        | $FFFC
    .byte $F0 ; |XXXX    | $FFFD
    .byte $00 ; |        | $FFFE
    .byte $F0 ; |XXXX    | $FFFF
