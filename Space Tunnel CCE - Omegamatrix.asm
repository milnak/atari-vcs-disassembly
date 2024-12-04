; Disassembly of ST_CCE.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasf ST_CCE.bin 
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
    LDA    #$1E            ; 2
    STA    $D3             ; 3
    LDA    LFB9A           ; 4
    STA    $DD             ; 3
    LDA    #$6A            ; 2
    STA    $DC             ; 3
LF05B:
    JSR    LF84A           ; 6
    LDA    #$00            ; 2
    STA    COLUBK          ; 3
    JSR    LF87B           ; 6
    JSR    LF6AF           ; 6
    LDA    #$10            ; 2
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
    JSR    LF820           ; 6
    LDA    $B5             ; 3
    LDX    #$01            ; 2
    JSR    LF820           ; 6
    LDA    $A1             ; 3
    LDX    #$02            ; 2
    JSR    LF820           ; 6
    LDA    $A2             ; 3
    LDX    #$03            ; 2
    JSR    LF820           ; 6
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
LF0C9:
    LDY    #$00            ; 2
    CMP    $C6             ; 3
    BNE    LF0D1           ; 2
    LDY    #$02            ; 2
LF0D1:
    STY    ENAM0           ; 3
    CMP    $91             ; 3
    BNE    LF0D9           ; 2
    STX    $B0             ; 3
LF0D9:
    LDY    $B0             ; 3
    BEQ    LF0DF           ; 2
    DEC    $B0             ; 5
LF0DF:
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
    BNE    LF0F8           ; 2
    LDY    #$02            ; 2
LF0F8:
    STY    ENAM1           ; 3
    CMP    $B6             ; 3
    BNE    LF100           ; 2
    STX    $B1             ; 3
LF100:
    LDY    $B1             ; 3
    BEQ    LF106           ; 2
    DEC    $B1             ; 5
LF106:
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
    BCS    LF0C9           ; 2
LF123:
    DEC    $A8             ; 5
    LDY    #$00            ; 2
    LDA    $A8             ; 3
    CMP    $CD             ; 3
    BNE    LF12F           ; 2
    LDY    #$02            ; 2
LF12F:
    STY    ENAM1           ; 3
    LDX    #$03            ; 2
    JSR    LF7EF           ; 6
    LDA    $A8             ; 3
    CMP    #$2E            ; 2
    BCS    LF123           ; 2
    LDA    $ED             ; 3
    BNE    LF146           ; 2
    JSR    LF941           ; 6
    JMP    LF159           ; 3
LF146:
    LDA    #$00            ; 2
    STA    PF0             ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    ENAM1           ; 3
    STA    ENAM0           ; 3
    LDX    #$0C            ; 2
LF154:
    STA    WSYNC           ; 3
    DEX                    ; 2
    BPL    LF154           ; 2
LF159:
    SEC                    ; 2
    LDA    $A8             ; 3
    SBC    #$0A            ; 2
    STA    $A8             ; 3
    LDA    $DD             ; 3
    STA    $E7             ; 3
    LDA    $94             ; 3
    BEQ    LF16B           ; 2
    JMP    LF252           ; 3
LF16B:
    JSR    LF796           ; 6
    LDA    $86             ; 3
    BNE    LF175           ; 2
    JMP    LF24C           ; 3
LF175:
    LDA    $8B             ; 3
    ORA    $8C             ; 3
    BNE    LF1B1           ; 2
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
    BCS    LF198           ; 2
    EOR    #$FF            ; 2
LF198:
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
LF1B1:
    INC    $E0             ; 5
    LDA    $8C             ; 3
    BNE    LF1CF           ; 2
    LDA    $C9             ; 3
    CMP    #$47            ; 2
    BCC    LF1CF           ; 2
    LDA    #$05            ; 2
    STA    AUDC0           ; 3
    LDA    #$08            ; 2
    STA    AUDV0           ; 3
    LDA    $C9             ; 3
    AND    #$0F            ; 2
    EOR    #$0F            ; 2
    ADC    #$08            ; 2
    STA    AUDF0           ; 3
LF1CF:
    LDA    NUSIZ1          ; 3
    ASL                    ; 2
    BCC    LF1D8           ; 2
    LDA    #$01            ; 2
    STA    $DE             ; 3
LF1D8:
    LDA    $DE             ; 3
    BEQ    LF1EA           ; 2
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
    DEC    $DE             ; 5
    LDA    #$07            ; 2
    STA    AUDC0           ; 3
    LDA    #$0A            ; 2
    STA    AUDF0           ; 3
LF1EA:
    LDA    $8C             ; 3
    CMP    #$10            ; 2
    BCC    LF212           ; 2
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
LF212:
    LDA    $8C             ; 3
    BNE    LF228           ; 2
    LDA    $8B             ; 3
    CMP    #$11            ; 2
    BCC    LF228           ; 2
    AND    #$1F            ; 2
    STA    AUDF0           ; 3
    LDA    #$0C            ; 2
    STA    AUDC0           ; 3
    LDA    #$0B            ; 2
    STA    AUDV0           ; 3
LF228:
    LDA    $8C             ; 3
    BNE    LF246           ; 2
    LDA    $8B             ; 3
    CMP    #$25            ; 2
    BCC    LF246           ; 2
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
LF246:
    LDA    $D5             ; 3
    BEQ    LF24C           ; 2
    DEC    $D5             ; 5
LF24C:
    LDA    $DB             ; 3
    BEQ    LF252           ; 2
    DEC    $DB             ; 5
LF252:
    LDA    $94             ; 3
    BNE    LF259           ; 2
    JMP    LF2F3           ; 3
LF259:
    INC    $EC             ; 5
    LDA    $EC             ; 3
    CMP    #$05            ; 2
    BNE    LF2BB           ; 2
    LDA    #$00            ; 2
    STA    $EC             ; 3
    DEC    $94             ; 5
    LDA    $E9             ; 3
    SEC                    ; 2
    SBC    #$20            ; 2
    STA    $E9             ; 3
    BCS    LF2BB           ; 2
    INC    $E8             ; 5
    LDY    $E8             ; 3
    LDA    LFB9E,Y         ; 4
    STA    $E9             ; 3
    LDA    LFBC1,Y         ; 4
    STA    $EA             ; 3
    LDA    LFBE4,Y         ; 4
    STA    $EB             ; 3
    CPY    #$11            ; 2
    BCC    LF2C1           ; 2
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
    JSR    LF6EC           ; 6
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
    JMP    LF2D6           ; 3
LF2BB:
    LDY    $E8             ; 3
    CPY    #$11            ; 2
    BCS    LF2D6           ; 2
LF2C1:
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
LF2D6:
    LDA    $94             ; 3
    BNE    LF2F3           ; 2
    LDA    #$06            ; 2
    STA    $86             ; 3
    JSR    LF6EC           ; 6
    LDA    #$00            ; 2
    STA    $88             ; 3
    STA    $89             ; 3
    STA    $8C             ; 3
    STA    $8E             ; 3
    LDA    #$08            ; 2
    STA    $92             ; 3
    LDA    #$10            ; 2
    STA    $8B             ; 3
LF2F3:
    LDA    INTIM           ; 4
    BNE    LF2F3           ; 2
    JSR    LF868           ; 6
    LDA    #$24            ; 2
    STA    TIM64T          ; 4
    LDA    SWCHB           ; 4
    LSR                    ; 2
    BCS    LF32B           ; 2
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
LF322:
    LDA    SWCHB           ; 4
    LSR                    ; 2
    BCC    LF322           ; 2
    JMP    LF02F           ; 3
LF32B:
    LSR                    ; 2
    BCS    LF36F           ; 2
    LDA    #$00            ; 2
    STA    $86             ; 3
    JSR    LF6EC           ; 6
    INC    $87             ; 5
    LDA    $87             ; 3
    CMP    #$04            ; 2
    BNE    LF341           ; 2
    LDA    #$00            ; 2
    STA    $87             ; 3
LF341:
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
    BCS    LF35D           ; 2
    LDY    #$03            ; 2
LF35D:
    STY    $8F             ; 3
    LDA    #$60            ; 2
    STA    $8C             ; 3
    STA    $8B             ; 3
LF365:
    LDA    SWCHB           ; 4
    LSR                    ; 2
    LSR                    ; 2
    BCC    LF365           ; 2
    JMP    LF02F           ; 3
LF36F:
    LDY    #$FF            ; 2
    LSR                    ; 2
    LSR                    ; 2
    BCS    LF377           ; 2
    LDY    #$0F            ; 2
LF377:
    STY    $A5             ; 3
    LDY    #$15            ; 2
    LDA    SWCHB           ; 4
    ASL                    ; 2
    ASL                    ; 2
    BCS    LF384           ; 2
    LDY    #$10            ; 2
LF384:
    STY    $E2             ; 3
    LDA    $94             ; 3
    BEQ    LF39D           ; 2
    LDA    $E8             ; 3
    CMP    #$11            ; 2
    BCS    LF3A0           ; 2
    LDA    #$07            ; 2
    STA    $86             ; 3
    JSR    LF6EC           ; 6
    LDA    #$00            ; 2
    STA    $86             ; 3
    BEQ    LF3A0           ; 2
LF39D:
    JSR    LF6EC           ; 6
LF3A0:
    LDA    $8C             ; 3
    BEQ    LF3C6           ; 2
    CMP    #$10            ; 2
    BEQ    LF3B4           ; 2
    CMP    #$30            ; 2
    BCC    LF3B0           ; 2
    DEC    $8C             ; 5
    DEC    $8C             ; 5
LF3B0:
    DEC    $8C             ; 5
    BNE    LF3EE           ; 2
LF3B4:
    LDA    $86             ; 3
    BEQ    LF3EE           ; 2
    DEC    $86             ; 5
    BEQ    LF3EE           ; 2
    LDA    #$00            ; 2
    STA    $8C             ; 3
    LDA    #$50            ; 2
    STA    $90             ; 3
    BNE    LF41A           ; 2
LF3C6:
    LDA    $C9             ; 3
    BNE    LF3EE           ; 2
    LDA    REFP1           ; 3
    ASL                    ; 2
    BCS    LF3EE           ; 2
    LDY    #$04            ; 2
    LDA    $E2             ; 3
    AND    #$0F            ; 2
    BEQ    LF3D9           ; 2
    LDY    #$08            ; 2
LF3D9:
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
LF3EE:
    LDA    $86             ; 3
    BEQ    LF41A           ; 2
    LDA    $8C             ; 3
    BNE    LF41A           ; 2
    LDA    WSYNC           ; 3
    ASL                    ; 2
    BCS    LF409           ; 2
    LDA    VBLANK          ; 3
    ASL                    ; 2
    BCS    LF409           ; 2
    LDA    $8B             ; 3
    BNE    LF41A           ; 2
    LDA    COLUP1          ; 3
    ASL                    ; 2
    BCC    LF41A           ; 2
LF409:
    LDA    #$70            ; 2
    STA    $8C             ; 3
    LDA    #$D0            ; 2
    STA    $AC             ; 3
    LDA    #$F5            ; 2
    STA    $CD             ; 3
    STA    $B6             ; 3
    JMP    LF42F           ; 3
LF41A:
    LDA    $8C             ; 3
    BNE    LF458           ; 2
    LDA    $8B             ; 3
    BEQ    LF42A           ; 2
    CMP    #$10            ; 2
    BEQ    LF454           ; 2
    DEC    $8B             ; 5
    BNE    LF458           ; 2
LF42A:
    LDA    VSYNC           ; 3
    ASL                    ; 2
    BCS    LF434           ; 2
LF42F:
    LDA    COLUP1          ; 3
    ASL                    ; 2
    BCC    LF458           ; 2
LF434:
    JSR    LF8E1           ; 6
    JSR    LF7A5           ; 6
    LDA    $C5             ; 3
    BNE    LF458           ; 2
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
    BNE    LF458           ; 2
LF454:
    LDA    #$00            ; 2
    STA    $CA             ; 3
LF458:
    INC    $B3             ; 5
    LDA    $8C             ; 3
    BNE    LF4AB           ; 2
    INC    $A9             ; 5
    LDA    $8F             ; 3
    LSR                    ; 2
    AND    $A9             ; 3
    BNE    LF4AB           ; 2
    LDA    $8E             ; 3
    LSR                    ; 2
    BCS    LF48C           ; 2
    DEC    $A6             ; 5
    DEC    $A6             ; 5
    INC    $A4             ; 5
    LDA    $A4             ; 3
    AND    #$07            ; 2
    STA    $AA             ; 3
    BNE    LF489           ; 2
    SED                    ; 2
    SEC                    ; 2
    LDA    $D9             ; 3
    SBC    #$10            ; 2
    STA    $D9             ; 3
    LDA    $D8             ; 3
    SBC    #$00            ; 2
    STA    $D8             ; 3
    CLD                    ; 2
LF489:
    JMP    LF4AB           ; 3
LF48C:
    INC    $A6             ; 5
    INC    $A6             ; 5
    DEC    $A4             ; 5
    LDA    $A4             ; 3
    AND    #$07            ; 2
    STA    $AA             ; 3
    CMP    #$07            ; 2
    BNE    LF4AB           ; 2
    SED                    ; 2
    CLC                    ; 2
    LDA    $D9             ; 3
    ADC    #$10            ; 2
    STA    $D9             ; 3
    LDA    $D8             ; 3
    ADC    #$00            ; 2
    STA    $D8             ; 3
    CLD                    ; 2
LF4AB:
    LDA    #$FD            ; 2
    STA    $A7             ; 3
    LDA    #$FA            ; 2
    STA    $AD             ; 3
    STA    $AF             ; 3
    LDA    $AA             ; 3
    STA    $A3             ; 3
    LDA    $94             ; 3
    BNE    LF4FB           ; 2
    LDA    $8F             ; 3
    LSR                    ; 2
    AND    $B3             ; 3
    BNE    LF4FB           ; 2
    LDY    $8E             ; 3
    LDX    $90             ; 3
    LDA    SWCHA           ; 4
    ASL                    ; 2
    BCS    LF4DC           ; 2
    CPX    #$90            ; 2
    BCS    LF4DC           ; 2
    INX                    ; 2
    INX                    ; 2
    TYA                    ; 2
    AND    #$03            ; 2
    ORA    #$08            ; 2
    TAY                    ; 2
    BNE    LF4F7           ; 2
LF4DC:
    ASL                    ; 2
    BCS    LF4ED           ; 2
    CPX    #$08            ; 2
    BCC    LF4ED           ; 2
    DEX                    ; 2
    DEX                    ; 2
    TYA                    ; 2
    AND    #$03            ; 2
    ORA    #$04            ; 2
    TAY                    ; 2
    BNE    LF4F7           ; 2
LF4ED:
    ASL                    ; 2
    BCS    LF4F2           ; 2
    LDY    #$00            ; 2
LF4F2:
    ASL                    ; 2
    BCS    LF4F7           ; 2
    LDY    #$01            ; 2
LF4F7:
    STY    $8E             ; 3
    STX    $90             ; 3
LF4FB:
    LDA    $C9             ; 3
    BEQ    LF54D           ; 2
    CMP    #$40            ; 2
    BEQ    LF505           ; 2
    DEC    $C9             ; 5
LF505:
    LDX    $A1             ; 3
    LDY    $C6             ; 3
    LDA    $C7             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    BCC    LF51A           ; 2
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    CPX    #$18            ; 2
    BCS    LF53F           ; 2
    BCC    LF545           ; 2
LF51A:
    LSR                    ; 2
    BCC    LF527           ; 2
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    CPX    #$80            ; 2
    BCC    LF53F           ; 2
    BCS    LF545           ; 2
LF527:
    LDA    $C7             ; 3
    LSR                    ; 2
    BCC    LF537           ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    CPY    #$D0            ; 2
    BCC    LF53F           ; 2
    JMP    LF545           ; 3
LF537:
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    CPY    #$68            ; 2
    BCC    LF545           ; 2
LF53F:
    STX    $A1             ; 3
    STY    $C6             ; 3
    BNE    LF54D           ; 2
LF545:
    LDA    #$00            ; 2
    STA    $A1             ; 3
    STA    $C6             ; 3
    STA    $C9             ; 3
LF54D:
    LDA    $8C             ; 3
    BEQ    LF554           ; 2
    JMP    LF5B9           ; 3
LF554:
    LDA    $8B             ; 3
    BEQ    LF57A           ; 2
    LDY    $B6             ; 3
    LDA    $8E             ; 3
    LSR                    ; 2
    BCS    LF56D           ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    CPY    #$F0            ; 2
    BCC    LF578           ; 2
    JSR    LF750           ; 6
    JMP    LF578           ; 3
LF56D:
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    CPY    #$11            ; 2
    BCS    LF578           ; 2
    JSR    LF750           ; 6
LF578:
    STY    $B6             ; 3
LF57A:
    LDA    $8B             ; 3
    BNE    LF5B9           ; 2
    INC    $CF             ; 5
    LDA    $CF             ; 3
    AND    $8F             ; 3
    BNE    LF5B9           ; 2
    INC    $D0             ; 5
    LDA    $D0             ; 3
    AND    #$0F            ; 2
    BNE    LF590           ; 2
    INC    $D4             ; 5
LF590:
    LDA    $D4             ; 3
    AND    #$1F            ; 2
    TAY                    ; 2
    LDA    LFF10,Y         ; 4
    STA    $C5             ; 3
    LDA    LFF30,Y         ; 4
    STA    $C8             ; 3
    LDY.w  $00B5           ; 4
    CPY    $C5             ; 3
    BCS    LF5A8           ; 2
    INY                    ; 2
    INY                    ; 2
LF5A8:
    DEY                    ; 2
    STY    $B5             ; 3
    LDY    $B6             ; 3
    CPY    $C8             ; 3
    BCS    LF5B5           ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
LF5B5:
    DEY                    ; 2
    DEY                    ; 2
    STY    $B6             ; 3
LF5B9:
    DEC    $D6             ; 5
    BEQ    LF5C0           ; 2
    JMP    LF644           ; 3
LF5C0:
    JSR    LF734           ; 6
    LDY    $CD             ; 3
    CPY    #$E0            ; 2
    BCS    LF605           ; 2
    CPY    #$08            ; 2
    BCC    LF605           ; 2
    LDA    NUSIZ1          ; 3
    ASL                    ; 2
    BCS    LF630           ; 2
    LDA.w  $00A2           ; 4
    LDX.w  $00CB           ; 4
    BNE    LF5DF           ; 2
    CLC                    ; 2
    ADC    $8A             ; 3
    BNE    LF5E4           ; 2
LF5DF:
    SEC                    ; 2
    LDA    $A2             ; 3
    SBC    $8A             ; 3
LF5E4:
    STA    $A2             ; 3
    SEC                    ; 2
    LDA    #$07            ; 2
    SBC    $8A             ; 3
    AND    #$FE            ; 2
    STA    $C5             ; 3
    LDA    $D7             ; 3
    BEQ    LF5FC           ; 2
    SEC                    ; 2
    LDA    $CD             ; 3
    SBC    $C5             ; 3
    STA    $CD             ; 3
    BNE    LF644           ; 2
LF5FC:
    LDA    $C5             ; 3
    CLC                    ; 2
    ADC    $CD             ; 3
    STA    $CD             ; 3
    BNE    LF644           ; 2
LF605:
    LDA    $8B             ; 3
    ORA    $8C             ; 3
    BNE    LF644           ; 2
    LDY    #$01            ; 2
    LDA    $B6             ; 3
    CMP    $91             ; 3
    BCS    LF615           ; 2
    LDY    #$00            ; 2
LF615:
    STY    $D7             ; 3
    LDX    $B5             ; 3
    STX    $A2             ; 3
    LDY    $B6             ; 3
    STY    $CD             ; 3
    JSR    LF734           ; 6
    LDA    $D1             ; 3
    ADC    $D2             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LFF88,Y         ; 4
    STA    $8A             ; 3
    BNE    LF644           ; 2
LF630:
    LDA.w  $00CB           ; 4
    EOR    #$01            ; 2
    STA    $CB             ; 3
    LDA    $A2             ; 3
    CMP    #$40            ; 2
    BCS    LF63F           ; 2
    ADC    #$08            ; 2
LF63F:
    SEC                    ; 2
    SBC    #$04            ; 2
    STA    $A2             ; 3
LF644:
    LDA    $8C             ; 3
    BNE    LF653           ; 2
    LDY    #$E0            ; 2
    LDA    $8E             ; 3
    LSR                    ; 2
    BCS    LF651           ; 2
    LDY    #$F0            ; 2
LF651:
    STY    $AC             ; 3
LF653:
    LDX    #$01            ; 2
    SED                    ; 2
    SEC                    ; 2
LF657:
    LDA    #$00            ; 2
    ADC    $D1,X           ; 4
    STA    $D1,X           ; 4
    DEX                    ; 2
    BPL    LF657           ; 2
    CLD                    ; 2
    JSR    LF8F9           ; 6
    JSR    LF66D           ; 6
    JSR    LF68F           ; 6
    JMP    LF05B           ; 3
LF66D:
    LDA    $89             ; 3
    AND    #$F0            ; 2
    CMP    $E6             ; 3
    BNE    LF68E           ; 2
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
LF68E:
    RTS                    ; 6

LF68F:
    LDA    $88             ; 3
    AND    #$0F            ; 2
    CMP    $DA             ; 3
    BEQ    LF6AE           ; 2
    STA    $DA             ; 3
    INC    $E3             ; 5
    LDA    $86             ; 3
    CMP    #$06            ; 2
    BEQ    LF6A3           ; 2
    INC    $86             ; 5
LF6A3:
    LDA    #$F0            ; 2
    STA    $D5             ; 3
    CLC                    ; 2
    LDA    $DC             ; 3
    ADC    #$40            ; 2
    STA    $DC             ; 3
LF6AE:
    RTS                    ; 6

LF6AF:
    LDA    #$20            ; 2
    LDX    #$00            ; 2
    JSR    LF820           ; 6
    LDA    #$50            ; 2
    LDX    #$01            ; 2
    JSR    LF820           ; 6
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
LF6D5:
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
    BPL    LF6D5           ; 2
    RTS                    ; 6

LF6EC:
    LDA    #$FA            ; 2
    STA    $83             ; 3
    STA    $85             ; 3
    LDY    $86             ; 3
    BEQ    LF6FF           ; 2
    DEY                    ; 2
    CPY    #$04            ; 2
    BCS    LF71D           ; 2
    CPY    #$01            ; 2
    BCS    LF70B           ; 2
LF6FF:
    LDA    #$00            ; 2
    STA    $80             ; 3
    STA    $81             ; 3
    STA    $82             ; 3
    STA    $84             ; 3
    BEQ    LF730           ; 2
LF70B:
    LDA    #$00            ; 2
    STA    $84             ; 3
    STA    $81             ; 3
    DEY                    ; 2
    LDA    LF731,Y         ; 4
    STA    $80             ; 3
    LDA    #$F0            ; 2
    STA    $82             ; 3
    BNE    LF730           ; 2
LF71D:
    LDA    #$03            ; 2
    STA    $80             ; 3
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    LDA    LF731,Y         ; 4
    STA    $81             ; 3
    LDA    #$F0            ; 2
    STA    $82             ; 3
    STA    $84             ; 3
LF730:
    RTS                    ; 6

LF731:
    .byte $00,$01,$03
LF734:
    LDA    $87             ; 3
    LSR                    ; 2
    BCC    LF73E           ; 2
    LDA    $89             ; 3
    JMP    LF744           ; 3
LF73E:
    LDA    $89             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
LF744:
    AND    #$0F            ; 2
    CLC                    ; 2
    ADC    $DA             ; 3
    TAY                    ; 2
    LDA    LFFA0,Y         ; 4
    STA    $D6             ; 3
    RTS                    ; 6

LF750:
    CLC                    ; 2
    LDA    $CC             ; 3
    ADC    #$08            ; 2
    CMP    #$90            ; 2
    BCC    LF75B           ; 2
    LDA    #$40            ; 2
LF75B:
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
    BCC    LF77C           ; 2
    LDA    #$05            ; 2
LF77C:
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
    BCS    LF793           ; 2
    LDY    #$13            ; 2
    RTS                    ; 6

LF793:
    LDY    #$EF            ; 2
    RTS                    ; 6

LF796:
    LDA    #$00            ; 2
    STA    AUDC0           ; 3
    STA    AUDC1           ; 3
    STA    AUDF0           ; 3
    STA    AUDF1           ; 3
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    RTS                    ; 6

LF7A5:
    LDA    $B4             ; 3
    AND    #$0F            ; 2
    CMP    #$00            ; 2
    BEQ    LF7EA           ; 2
    CMP    #$05            ; 2
    BEQ    LF7EA           ; 2
    CMP    #$07            ; 2
    BEQ    LF7EA           ; 2
    STA    $C5             ; 3
    LDA    $B5             ; 3
    CLC                    ; 2
    ADC    #$0B            ; 2
    CMP    $A1             ; 3
    BCC    LF7D7           ; 2
    LDA    $C5             ; 3
    LSR                    ; 2
    BCC    LF7C9           ; 2
    LDA    #$10            ; 2
    BNE    LF7D2           ; 2
LF7C9:
    LSR                    ; 2
    BCC    LF7D0           ; 2
    LDA    #$20            ; 2
    BNE    LF7D2           ; 2
LF7D0:
    LDA    #$40            ; 2
LF7D2:
    CLC                    ; 2
    ADC    $B5             ; 3
    STA    $B5             ; 3
LF7D7:
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

LF7EA:
    LDA    #$00            ; 2
    STA    $C5             ; 3
    RTS                    ; 6

LF7EF:
    LDA    $A8             ; 3
    STA    WSYNC           ; 3
    CMP    $B6             ; 3
    BNE    LF7FB           ; 2
    LDA    #$07            ; 2
    STA    $B1             ; 3
LF7FB:
    LDY    $B1             ; 3
    BEQ    LF801           ; 2
    DEC    $B1             ; 5
LF801:
    LDA    LFF08,Y         ; 4
    ORA    $8D             ; 3
    AND    $A5             ; 3
    STA    COLUP1          ; 3
    LDA    ($AE),Y         ; 5
    STA    GRP1            ; 3
    JSR    LF814           ; 6
    DEC    $A8             ; 5
    RTS                    ; 6

LF814:
    STA    WSYNC           ; 3
    LDY    $A8             ; 3
    LDA    ($A6),Y         ; 5
    STA    PF0             ; 3
    RTS                    ; 6

LF81D:
    .byte $EA,$EA,$EA
LF820:
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
    BCC    LF83A           ; 2
    SBC    #$0F            ; 2
    INY                    ; 2
LF83A:
    EOR    #$07            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    HMP0,X          ; 4
    STA    WSYNC           ; 3
LF844:
    DEY                    ; 2
    BPL    LF844           ; 2
    STA    RESP0,X         ; 4
    RTS                    ; 6

LF84A:
    LDA    INTIM           ; 4
    BNE    LF84A           ; 2
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

LF868:
    LDA    #$82            ; 2
    STA    WSYNC           ; 3
    STA    VBLANK          ; 3
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
    JSR    LF820           ; 6
    LDA    #$40            ; 2
    LDX    #$01            ; 2
    JSR    LF820           ; 6
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
    JSR    LF820           ; 6
    LDA    #$28            ; 2
    LDX    #$01            ; 2
    JSR    LF820           ; 6
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
    .byte $89,$A0,$01,$A5,$87,$4A,$4A,$B0,$02,$A0,$03,$84,$8F,$A9,$60,$85
    .byte $8C,$85,$8B,$AD,$82,$02,$4A,$4A,$90,$F9,$4C,$2F,$F0,$A0,$FF,$4A
    .byte $4A,$B0,$02,$A0,$0F,$84,$A5,$A0,$15,$AD,$82,$02,$0A,$0A,$B0,$02
    .byte $A0,$10,$84,$E2,$A5,$94,$F0,$13,$A5,$E8,$C9,$11,$B0,$10,$A9,$07
    .byte $85,$86,$20,$EC,$F6,$A9,$00,$85,$86,$F0,$03,$20,$EC,$F6,$A5,$8C
    .byte $F0,$22,$C9,$10,$F0,$0C,$C9,$30,$90,$04,$C6,$8C,$C6,$8C,$C6,$8C
    .byte $D0,$3A,$A5,$86,$F0,$36,$C6,$86,$F0,$32,$FF,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$44,$00,$20,$01,$44,$00,$A5,$8B,$D0,$3B,$E6
    .byte $CF,$A5,$CF,$25,$8F,$D0,$33,$E6,$D0,$A5,$D0,$29,$0F,$D0,$02,$E6
    .byte $D4,$A5,$D4,$29,$1F,$A8,$B9,$10,$FF,$85,$C5,$B9,$30,$FF,$85,$C8
    .byte $AC,$B5,$00,$C4,$C5,$B0,$02,$C8,$C8,$88,$84,$00,$00,$24,$5A,$99
    .byte $42,$24,$18,$00,$10,$44,$28,$92,$28,$44,$10,$00,$63,$22,$14,$08
    .byte $55,$36,$08,$00,$10,$28,$44,$D6,$28,$6C,$00,$00,$24,$00,$5A,$5A
    .byte $81,$18,$24,$00,$10,$38,$54,$FE,$10,$38,$7C,$00,$00,$18,$24,$18
    .byte $24,$81,$66,$00,$0C,$18,$0C,$36,$49,$49,$22,$00,$42,$5A,$24,$42
    .byte $81,$5A,$24,$00,$28,$44,$92,$92,$6C,$10,$28,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$56,$38,$5E
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
    .byte $07,$01,$0A,$04,$09,$0C,$05,$08,$1B,$16,$12,$10,$14,$12,$14,$16
    .byte $14,$12,$12,$10,$14,$10,$14,$10,$14,$08,$08,$07,$09,$08,$0A,$09
    .byte $0B,$0A,$0C,$0B,$0D,$0C,$0E,$0D,$0F,$00
LFB9A:
    .byte $73,$04,$64,$00
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
    .byte $2C,$2C,$2C,$2C,$29,$F5,$88,$88,$88,$88,$C0,$11,$B0,$03,$20,$50
    .byte $F7,$84,$B6,$A5,$8B,$D0,$3B,$E6,$CF,$A5,$CF,$25,$8F,$D0,$33,$E6
    .byte $D0,$A5,$D0,$29,$0F,$D0,$02,$E6,$D4,$A5,$D4,$29,$1F,$A8,$B9,$10
    .byte $FF,$85,$C5,$B9,$30,$FF,$85,$C8,$AC,$B5,$00,$C4,$C5,$B0,$02,$C8
    .byte $C8,$88,$84,$B5,$A4,$B6,$C4,$C8,$B0,$04,$C8,$C8,$4A,$90,$05,$A5
    .byte $89,$4C,$44,$F7,$A5,$89,$4A,$4A,$4A,$4A,$29,$0F,$18,$65,$DA,$A8
    .byte $B9,$A0,$FF,$85,$D6,$60,$18,$A5,$CC,$69,$08,$C9,$90,$90,$02,$A9
    .byte $40,$85,$CC,$A8,$8D,$CA,$00,$B1,$A6,$00,$00,$4C,$49,$4E,$4B,$20
    .byte $31,$2E,$36,$0D,$49,$4E,$49,$54,$20,$2F,$F0,$C1,$41,$20,$20,$20
    .byte $20,$05,$F0,$D4,$4F,$50,$20,$20,$20,$00,$F0,$54,$50,$4C,$45,$4E
    .byte $20,$4B,$00,$58,$4D,$49,$4E,$20,$20,$08,$00,$59,$4D,$49,$4E,$20
    .byte $20,$08,$00,$59,$4D,$41,$58,$20,$20,$D0,$00,$58,$4D,$41,$58,$20
    .byte $20,$90,$00,$53,$54,$41,$52,$54,$20,$00,$00,$43,$45,$4E,$54,$20
    .byte $20,$A0,$00,$43,$43,$30,$39,$20,$20,$73,$00,$43,$43,$30,$36,$20
    .byte $20,$2C,$00,$43,$43,$30,$37,$20,$20,$38,$00,$43,$43,$30,$38,$20
    .byte $20,$1E,$00,$FF,$FC,$FC,$FC,$FC,$FC,$FC,$FC,$FC,$30,$30,$30,$30
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
    .byte $0C,$0C,$38,$1A,$48,$1A,$38,$0C
LFF08:
    .byte $04,$04,$00,$32,$64,$32,$04,$00
LFF10:
    .byte $6A,$48,$34,$16,$08,$06,$5D,$74,$82,$6C,$4F,$3D,$38,$48,$5A,$32
    .byte $36,$1A,$05,$24,$12,$44,$64,$5A,$7C,$6A,$86,$3F,$93,$6A,$5F,$44
LFF30:
    .byte $1A,$24,$42,$74,$B3,$DE,$EC,$E2,$86,$70,$52,$6D,$B4,$C6,$C0,$A0
    .byte $C6,$E2,$B8,$64,$38,$22,$44,$88,$54,$78,$A4,$C1,$D8,$C8,$C1,$92
LFF50:
    .byte $00,$07,$0F,$4C,$AC,$4C,$0C,$0F,$07
LFF59:
    .byte $00,$C7,$EF,$EC,$0C,$0C,$EC,$EF,$C7
LFF62:
    .byte $00,$C7,$EF,$EC,$0C,$0F,$EC,$EF,$C7
LFF6B:
    .byte $00,$C0,$E0,$E4,$0A,$E4,$E0,$E0,$C0
LFF74:
    .byte $08,$05,$03,$01
LFF78:
    .byte $00,$01,$02,$03,$04,$03,$02,$01
LFF80:
    .byte $38,$18,$0E,$2E,$5A,$4C,$8A,$AA
LFF88:
    .byte $02,$01,$03,$05,$03,$04,$04,$01
LFF90:
    .byte $1E,$6A,$6A,$48,$6A,$1E,$48,$7C
LFF98:
    .byte $03,$05,$05,$08,$05,$03,$08,$04
LFFA0:
    .byte $07,$06,$05,$05,$04,$04,$03,$03,$02,$01,$03,$04,$05,$01,$04,$02
    .byte $84,$B5,$A4,$B6,$C4,$C8,$B0,$04,$C8,$C8,$C8,$C8,$88,$88,$84,$B6
    .byte $C6,$D6,$F0,$03,$4C,$44,$F6,$20,$34,$F7,$A4,$CD,$C0,$E0,$B0,$3C
    .byte $C0,$08,$90,$38,$A5,$05,$0A,$B0,$5E,$AD,$A2,$00,$AE,$CB,$00,$D0
    .byte $05,$18,$65,$8A,$D0,$05,$38,$A5,$A2,$E5,$8A,$85,$A2,$38,$A9,$07
    .byte $E5,$8A,$29,$FE,$85,$C5,$A5,$D7,$F0,$FF,$FF,$FF,$00,$F0,$00,$F0
