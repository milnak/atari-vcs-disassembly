; Disassembly of airsea.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcAirSea.cfg airseaO.bin 
;
; AirSea.cfg contents:
;
;      ORG F000
;      CODE F000 F5FF
;      GFX F600 F74B
;      CODE F74C F7F8
;      GFX F7F9 F7FF

      processor 6502

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
NUSIZ0  =  $04
COLUP0  =  $06
COLUP1  =  $07
COLUBK  =  $09
CTRLPF  =  $0A
REFP0   =  $0B
REFP1   =  $0C
PF1     =  $0E
RESP0   =  $10
RESP1   =  $11
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
RESMP0  =  $28
RESMP1  =  $29
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
SWBCNT  =  $0283
INTIM   =  $0284
TIM64T  =  $0296

       ORG $F000

START:
    SEI                    ; 2
    CLD                    ; 2
    LDA    #$00            ; 2
    TAX                    ; 2
LF005:
    STA    VSYNC,X         ; 4
    INX                    ; 2
    BNE    LF005           ; 2
    LDA    #$0A            ; 2
    STA    REFP1           ; 3
    STA    CTRLPF          ; 3
    STA    $97             ; 3
    LDA    #$10            ; 2
    STA    SWBCNT          ; 4
LF017:
    LDA    #$02            ; 2
    STA    WSYNC           ; 3
    STA    VBLANK          ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    VSYNC           ; 3
    INC    $80             ; 5
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    WSYNC           ; 3
    STA    VSYNC           ; 3
    LDA    #$2C            ; 2
    STA    TIM64T          ; 4
    LDX    #$FF            ; 2
    TXS                    ; 2
    JSR    LF175           ; 6
    LDA    #$99            ; 2
    STA    $81             ; 3
LF040:
    LDA    INTIM           ; 4
    BNE    LF040           ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    VBLANK          ; 3
LF04B:
    STA    WSYNC           ; 3
    STA    HMCLR           ; 3
    INC    $81             ; 5
    STA    WSYNC           ; 3
    LDA    $81             ; 3
    CMP    $84             ; 3
    BCC    LF04B           ; 2
    CMP    #$9C            ; 2
    BCS    LF0AC           ; 2
LF05D:
    STA    WSYNC           ; 3
    LDA    $85             ; 3
    STA    PF1             ; 3
    LDY    $8F             ; 3
    LDA    LF663,Y         ; 4
    AND    #$F0            ; 2
    STA    $85             ; 3
    LDY    $8D             ; 3
    LDA    LF663,Y         ; 4
    AND    #$0F            ; 2
    ORA    $85             ; 3
    STA    $85             ; 3
    LDA    $86             ; 3
    STA    PF1             ; 3
    LDY    $90             ; 3
    LDA    LF663,Y         ; 4
    AND    #$F0            ; 2
    STA    $86             ; 3
    LDY    $8E             ; 3
    LDA    LF663,Y         ; 4
    AND    $9B             ; 3
    ORA    $86             ; 3
    STA    $86             ; 3
    STA    WSYNC           ; 3
    INC    $81             ; 5
    LDA    $81             ; 3
    CMP    #$A0            ; 2
    BCS    LF0AC           ; 2
    LDA    $85             ; 3
    STA    PF1             ; 3
    INC    $8D             ; 5
    INC    $8F             ; 5
    INC    $8E             ; 5
    INC    $90             ; 5
    LDA    $86             ; 3
    STA    PF1             ; 3
    JMP    LF05D           ; 3
LF0AC:
    LDX    #$00            ; 2
    STX    PF1             ; 3
    STX    $B1             ; 3
LF0B2:
    LDA    $B2,X           ; 4
    STA    NUSIZ0          ; 3
    STA    REFP0           ; 3
    LDA    VSYNC           ; 3
    LSR                    ; 2
    LSR                    ; 2
    ORA    VBLANK          ; 3
    STA    $D9,X           ; 4
    LDA    $E2,X           ; 4
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDA    $EC,X           ; 4
    STA    COLUBK          ; 3
    STA    WSYNC           ; 3
    LDA    $C6,X           ; 4
    STA    HMP0            ; 3
    LDA    $C6,X           ; 4
    AND    #$0F            ; 2
    TAY                    ; 2
LF0D5:
    DEY                    ; 2
    BPL    LF0D5           ; 2
    STA    RESP0           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    BMI    LF0E2           ; 2
LF0E0:
    STA    WSYNC           ; 3
LF0E2:
    TXA                    ; 2
    LDX    #$1E            ; 2
    TXS                    ; 2
    TAX                    ; 2
    SEC                    ; 2
    LDA    $81             ; 3
    SBC    $94             ; 3
    AND    $AC             ; 3
    PHP                    ; 3
    SEC                    ; 2
    LDA    $81             ; 3
    SBC    $93             ; 3
    AND    $AB             ; 3
    STA    $87             ; 3
    LDA    $D0,X           ; 4
    BPL    LF105           ; 2
    ASL                    ; 2
    BPL    LF103           ; 2
    LDA    #$00            ; 2
    BEQ    LF10B           ; 2
LF103:
    LDA    $9E             ; 3
LF105:
    ORA    $B1             ; 3
    TAY                    ; 2
    LDA    LF695,Y         ; 4
LF10B:
    INC    $81             ; 5
    STA    WSYNC           ; 3
    STA    GRP0            ; 3
    LDA    $87             ; 3
    PHP                    ; 3
    INC    $B1             ; 5
    LDA    $B1             ; 3
    AND    #$07            ; 2
    BNE    LF0E0           ; 2
    STA    $B1             ; 3
    INX                    ; 2
    CPX    #$09            ; 2
    BCC    LF0B2           ; 2
    STA    HMP0            ; 3
    STA    WSYNC           ; 3
    LDA    $C6,X           ; 4
    STA    HMP1            ; 3
    LDA    $C6,X           ; 4
    AND    #$0F            ; 2
    TAY                    ; 2
LF130:
    DEY                    ; 2
    BPL    LF130           ; 2
    STA    RESP1           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #$00            ; 2
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    LDA    $EB             ; 3
    STA    COLUP1          ; 3
    BIT    $9A             ; 3
    BMI    LF16A           ; 2
    LDY    $A3             ; 3
    LDX    $A4             ; 3
LF14B:
    STA    WSYNC           ; 3
    LDA    LF71C,Y         ; 4
    STA    GRP0            ; 3
    LDA    LF71C,X         ; 4
    STA    GRP1            ; 3
    STA    WSYNC           ; 3
    INY                    ; 2
    INX                    ; 2
    INC    $81             ; 5
    TXA                    ; 2
    AND    #$07            ; 2
    BNE    LF14B           ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    LDA    $F5             ; 3
    STA    COLUBK          ; 3
LF16A:
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    INC    $81             ; 5
    BNE    LF16A           ; 2
    JMP    LF017           ; 3
LF175:
    LDA    $97             ; 3
    STA    SWCHB           ; 4
    CMP    #$0A            ; 2
    BEQ    LF1D8           ; 2
    LDA    SWCHB           ; 4
    ROR                    ; 2
    BCS    LF1A1           ; 2
    LDA    #$FF            ; 2
    STA    $97             ; 3
    LDA    #$00            ; 2
    STA    $8B             ; 3
    STA    $8C             ; 3
    STA    $83             ; 3
    LDA    #$80            ; 2
    STA    $82             ; 3
    LDA    $80             ; 3
    AND    #$01            ; 2
    STA    $80             ; 3
    LDA    #$0F            ; 2
    STA    $9B             ; 3
    JMP    LF231           ; 3
LF1A1:
    LDY    #$9A            ; 2
    LDA    $82             ; 3
    AND    $97             ; 3
    CMP    #$F0            ; 2
    BCC    LF1B3           ; 2
    LDA    $80             ; 3
    AND    #$30            ; 2
    BNE    LF1B3           ; 2
    LDY    #$A0            ; 2
LF1B3:
    STY    $84             ; 3
    LDA    $80             ; 3
    AND    #$3F            ; 2
    BNE    LF1C3           ; 2
    STA    $83             ; 3
    INC    $82             ; 5
    BNE    LF1C3           ; 2
    STA    $97             ; 3
LF1C3:
    LDA    SWCHB           ; 4
    AND    #$02            ; 2
    BEQ    LF1CE           ; 2
    STA    $83             ; 3
    BNE    LF247           ; 2
LF1CE:
    BIT    $83             ; 3
    BMI    LF247           ; 2
    LDA    #$FF            ; 2
    STA    $83             ; 3
    INC    $98             ; 5
LF1D8:
    LDA    $99             ; 3
    STA    $8B             ; 3
    LDX    #$00            ; 2
    STX    $8C             ; 3
    STX    $9B             ; 3
    STX    $97             ; 3
    STX    $80             ; 3
    LDA    $98             ; 3
    CMP    #$1B            ; 2
    BCC    LF1F0           ; 2
    STX    $8B             ; 3
    STX    $98             ; 3
LF1F0:
    LDY    #$FF            ; 2
    JSR    LF790           ; 6
    LDA    $8B             ; 3
    STA    $99             ; 3
    LDX    #$08            ; 2
    LDA    #$FE            ; 2
LF1FD:
    STA    $D0,X           ; 4
    DEX                    ; 2
    BPL    LF1FD           ; 2
    LDX    $98             ; 3
    LDA    LF600,X         ; 4
    STA    $9A             ; 3
    BMI    LF215           ; 2
    LDY    #$01            ; 2
    AND    #$0A            ; 2
    BEQ    LF225           ; 2
    LDA    #$C0            ; 2
    BNE    LF225           ; 2
LF215:
    ROL                    ; 2
    ROL                    ; 2
    ROL                    ; 2
    ROL                    ; 2
    AND    #$03            ; 2
    TAY                    ; 2
    LDA    LF61B,Y         ; 4
    CPX    #$18            ; 2
    BCC    LF225           ; 2
    AND    #$E7            ; 2
LF225:
    STA    $A0             ; 3
    LDA    LF61F,Y         ; 4
    STA    $A1             ; 3
    LDA    LF623,Y         ; 4
    STA    $A2             ; 3
LF231:
    LDA    #$E2            ; 2
    STA    $CE             ; 3
    STA    RESMP0          ; 3
    STA    RESMP1          ; 3
    LDA    #$08            ; 2
    STA    $CF             ; 3
    LDA    #$20            ; 2
    STA    $C4             ; 3
    LDA    #$78            ; 2
    STA    $C5             ; 3
    BNE    LF265           ; 2
LF247:
    LDX    #$01            ; 2
LF249:
    LDA    VSYNC,X         ; 4
    AND    LF746,X         ; 4
    BEQ    LF262           ; 2
    LDY    #$FF            ; 2
LF252:
    INY                    ; 2
    CPY    #$08            ; 2
    BCS    LF262           ; 2
    LDA.wy $00DA,Y         ; 4
    AND    LF744,X         ; 4
    BEQ    LF252           ; 2
    JSR    LF790           ; 6
LF262:
    DEX                    ; 2
    BPL    LF249           ; 2
LF265:
    STA    CXCLR           ; 3
    LDA    $9A             ; 3
    AND    #$10            ; 2
    TAY                    ; 2
    LDA    #$F0            ; 2
    CPY    #$00            ; 2
    BNE    LF277           ; 2
    LDA    SWCHA           ; 4
    AND    #$F0            ; 2
LF277:
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    STA    $A5             ; 3
    LDA    SWCHA           ; 4
    AND    #$0F            ; 2
    STA    $A6             ; 3
    LDA    $80             ; 3
    AND    #$01            ; 2
    TAX                    ; 2
    LDA    SWCHB           ; 4
    EOR    #$FF            ; 2
    AND    LF746,X         ; 4
    BEQ    LF295           ; 2
    LDA    #$20            ; 2
LF295:
    STA    $BA,X           ; 4
    STA    NUSIZ0,X        ; 4
    LDA    $9A             ; 3
    BPL    LF2A5           ; 2
    AND    #$01            ; 2
    BNE    LF2A5           ; 2
    LDA    $93,X           ; 4
    BNE    LF30A           ; 2
LF2A5:
    LDA    $A5,X           ; 4
    AND    #$03            ; 2
    TAY                    ; 2
    LDA    LF651,Y         ; 4
    STA    $9C,X           ; 4
    CLC                    ; 2
    ADC    #$40            ; 2
    TAY                    ; 2
    LDA    #$08            ; 2
    BIT    $9A             ; 3
    BNE    LF2C6           ; 2
    BVC    LF301           ; 2
    TXA                    ; 2
    BNE    LF2C4           ; 2
    LDA    $9A             ; 3
    AND    #$20            ; 2
    BNE    LF30A           ; 2
LF2C4:
    STY    $9C,X           ; 4
LF2C6:
    BIT    $9A             ; 3
    BMI    LF30A           ; 2
    LDA    $A5,X           ; 4
    AND    #$08            ; 2
    BEQ    LF2E5           ; 2
    LDA    $A5,X           ; 4
    AND    #$04            ; 2
    BNE    LF2F9           ; 2
    SEC                    ; 2
    LDA    $C4,X           ; 4
    SBC    #$02            ; 2
    CMP    LF748,X         ; 4
    BCS    LF2F2           ; 2
    LDA    LF748,X         ; 4
    BNE    LF2F2           ; 2
LF2E5:
    CLC                    ; 2
    LDA    $C4,X           ; 4
    ADC    #$02            ; 2
    CMP    LF74A,X         ; 4
    BCC    LF2F2           ; 2
    LDA    LF74A,X         ; 4
LF2F2:
    STA    $C4,X           ; 4
    JSR    LF74C           ; 6
    STA    $CE,X           ; 4
LF2F9:
    LDA    $9A             ; 3
    AND    #$0C            ; 2
    CMP    #$04            ; 2
    BEQ    LF307           ; 2
LF301:
    LDA    $A5,X           ; 4
    AND    #$03            ; 2
    ASL                    ; 2
    ASL                    ; 2
LF307:
    ASL                    ; 2
    STA    $A3,X           ; 4
LF30A:
    LDA    $9A             ; 3
    AND    #$01            ; 2
    BEQ    LF314           ; 2
    LDA    $A5,X           ; 4
    STA    $A7,X           ; 4
LF314:
    LDA    $93,X           ; 4
    BNE    LF36E           ; 2
    BIT    $97             ; 3
    BPL    LF329           ; 2
    LDA    INPT4,X         ; 4
    BPL    LF32C           ; 2
    LDA    $9A             ; 3
    AND    #$10            ; 2
    BEQ    LF329           ; 2
    TXA                    ; 2
    BEQ    LF32C           ; 2
LF329:
    JMP    LF3F6           ; 3
LF32C:
    LDA    $9A             ; 3
    AND    #$20            ; 2
    TAY                    ; 2
    LDA    #$E7            ; 2
    BIT    $9A             ; 3
    BPL    LF347           ; 2
    LDA    LF627,X         ; 4
    BVC    LF347           ; 2
    CPX    #$00            ; 2
    BNE    LF344           ; 2
    CPY    #$00            ; 2
    BNE    LF347           ; 2
LF344:
    CLC                    ; 2
    ADC    #$30            ; 2
LF347:
    STA    $93,X           ; 4
    LDA    #$00            ; 2
    STA    RESMP0,X        ; 4
    LDA    $A5,X           ; 4
    STA    $A7,X           ; 4
    LDA    #$1F            ; 2
    STA    $AD,X           ; 4
    LDA    #$FF            ; 2
    STA    $AB,X           ; 4
    LDA    $C4,X           ; 4
    STA    $A9,X           ; 4
    BIT    $9A             ; 3
    BVC    LF36E           ; 2
    TXA                    ; 2
    BNE    LF36A           ; 2
    LDA    $9A             ; 3
    AND    #$20            ; 2
    BNE    LF36E           ; 2
LF36A:
    LDA    #$FC            ; 2
    STA    $AB,X           ; 4
LF36E:
    LDA    $A1,X           ; 4
    BMI    LF378           ; 2
    TAY                    ; 2
    LDA.wy $00D0,Y         ; 4
    BMI    LF3EA           ; 2
LF378:
    LDA    $A9,X           ; 4
    STA    $87             ; 3
    LDY    #$02            ; 2
    BIT    $9A             ; 3
    BMI    LF38B           ; 2
    BVC    LF392           ; 2
    LDA    $9A             ; 3
    AND    #$01            ; 2
    TAY                    ; 2
    BEQ    LF3AC           ; 2
LF38B:
    LDA    $C4,X           ; 4
    STA    $87             ; 3
    JMP    LF3AC           ; 3
LF392:
    LDA    $A7,X           ; 4
    AND    #$03            ; 2
    TAY                    ; 2
    LDA    LF73C,Y         ; 4
    CPX    #$00            ; 2
    BEQ    LF3A3           ; 2
    CLC                    ; 2
    EOR    #$FF            ; 2
    ADC    #$01            ; 2
LF3A3:
    CLC                    ; 2
    ADC    $A9,X           ; 4
    STA    $87             ; 3
    CMP    #$97            ; 2
    BCS    LF3EA           ; 2
LF3AC:
    SEC                    ; 2
    LDA    $A9,X           ; 4
    SBC    $87             ; 3
    CMP    #$FC            ; 2
    BCS    LF3B9           ; 2
    CMP    #$05            ; 2
    BCS    LF3EA           ; 2
LF3B9:
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    HMM0,X          ; 4
    LDA    $87             ; 3
    STA    $A9,X           ; 4
    LDA    #$20            ; 2
    BIT    $9A             ; 3
    BPL    LF3DE           ; 2
    BVC    LF3D0           ; 2
    BEQ    LF3DE           ; 2
    TXA                    ; 2
    BNE    LF3DE           ; 2
LF3D0:
    CLC                    ; 2
    LDA    LF740,Y         ; 4
    ADC    $93,X           ; 4
    STA    $93,X           ; 4
    CMP    #$E0            ; 2
    BCS    LF3EA           ; 2
    BCC    LF3F6           ; 2
LF3DE:
    SEC                    ; 2
    LDA    $93,X           ; 4
    SBC    LF740,Y         ; 4
    STA    $93,X           ; 4
    CMP    #$A0            ; 2
    BCS    LF3F6           ; 2
LF3EA:
    LDA    #$02            ; 2
    STA    RESMP0,X        ; 4
    LDA    #$00            ; 2
    STA    $93,X           ; 4
    LDA    #$FF            ; 2
    STA    $AD,X           ; 4
LF3F6:
    JSR    LF781           ; 6
    TXA                    ; 2
    BNE    LF40F           ; 2
    LDA    $95             ; 3
    STA    $96             ; 3
    LDY    #$05            ; 2
LF402:
    LDA.wy $00D0,Y         ; 4
    CMP    #$E0            ; 2
    ROR                    ; 2
    BPL    LF40D           ; 2
    DEY                    ; 2
    BPL    LF402           ; 2
LF40D:
    STA    $9F             ; 3
LF40F:
    LDA    LF746,X         ; 4
    STA    $89             ; 3
    TXA                    ; 2
    ORA    #$06            ; 2
    TAX                    ; 2
LF418:
    LDA    $B2,X           ; 4
    AND    #$0F            ; 2
    ORA    $BA             ; 3
    STA    $B2,X           ; 4
    ROR                    ; 2
    LDA    #$8C            ; 2
    BCS    LF427           ; 2
    LDA    #$95            ; 2
LF427:
    STA    $88             ; 3
    LDY    #$01            ; 2
    CPX    $A2             ; 3
    BEQ    LF435           ; 2
    DEY                    ; 2
    CPX    $A1             ; 3
    BEQ    LF435           ; 2
    DEY                    ; 2
LF435:
    STY    $8A             ; 3
    LDA    $D0,X           ; 4
    BMI    LF43E           ; 2
    JMP    LF4DF           ; 3
LF43E:
    CMP    #$E1            ; 2
    BCS    LF444           ; 2
    INC    $D0,X           ; 6
LF444:
    LDA    #$04            ; 2
    BIT    $9A             ; 3
    BPL    LF44C           ; 2
    BNE    LF454           ; 2
LF44C:
    BIT    $9F             ; 3
    BMI    LF45B           ; 2
    CPX    #$06            ; 2
    BCC    LF458           ; 2
LF454:
    INC    $D0,X           ; 6
    BPL    LF45B           ; 2
LF458:
    JMP    LF550           ; 3
LF45B:
    LDA    $BA             ; 3
    STA    $B2,X           ; 4
    LDA    $9A             ; 3
    AND    #$02            ; 2
    BNE    LF469           ; 2
    LDA    $95             ; 3
    STA    $96             ; 3
LF469:
    LDA    $A0             ; 3
    AND    $89             ; 3
    BNE    LF4B0           ; 2
    LDY    $8A             ; 3
    BMI    LF47B           ; 2
    LDA.wy $009C,Y         ; 4
    AND    #$40            ; 2
    JMP    LF4BB           ; 3
LF47B:
    LDA    $9A             ; 3
    AND    #$0C            ; 2
    TAY                    ; 2
    CMP    #$08            ; 2
    BNE    LF491           ; 2
    LDA    $96             ; 3
    AND    #$18            ; 2
    CLC                    ; 2
    ADC    #$28            ; 2
    CMP    #$40            ; 2
    BCC    LF4BB           ; 2
    BCS    LF4B0           ; 2
LF491:
    BIT    $9A             ; 3
    BMI    LF49D           ; 2
    CPX    #$06            ; 2
    BCC    LF49D           ; 2
    LDA    #$20            ; 2
    BNE    LF4B4           ; 2
LF49D:
    LDA    $98             ; 3
    CMP    #$18            ; 2
    BCC    LF4A7           ; 2
    LDA    #$68            ; 2
    BNE    LF4BB           ; 2
LF4A7:
    LDA    $95             ; 3
    LSR                    ; 2
    LDA    $96             ; 3
    AND    #$18            ; 2
    BCS    LF4B4           ; 2
LF4B0:
    LDA    #$C0            ; 2
    BNE    LF4BB           ; 2
LF4B4:
    CPY    #$00            ; 2
    BEQ    LF4BB           ; 2
    CLC                    ; 2
    ADC    #$40            ; 2
LF4BB:
    STA    $D0,X           ; 4
    AND    #$08            ; 2
    BNE    LF4C7           ; 2
    LDA    #$05            ; 2
    ORA    $BA             ; 3
    STA    $B2,X           ; 4
LF4C7:
    LDY    #$00            ; 2
    LDA    $96             ; 3
    AND    #$04            ; 2
    BEQ    LF4D8           ; 2
    ASL                    ; 2
    ORA    $B2,X           ; 4
    STA    $B2,X           ; 4
    LDA    #$8D            ; 2
    LDY    #$A9            ; 2
LF4D8:
    STA    $BC,X           ; 4
    STY    $C6,X           ; 4
    JMP    LF550           ; 3
LF4DF:
    LDY    $8A             ; 3
    BMI    LF4E6           ; 2
    LDA.wy $009C,Y         ; 4
LF4E6:
    LDY    #$02            ; 2
    STY    $87             ; 3
    AND    #$30            ; 2
    BEQ    LF4FA           ; 2
    DEC    $87             ; 5
    CMP    #$20            ; 2
    BCC    LF4FA           ; 2
    LDA    $80             ; 3
    AND    #$02            ; 2
    BNE    LF550           ; 2
LF4FA:
    LDA    $9A             ; 3
    AND    #$0C            ; 2
    TAY                    ; 2
    CMP    #$08            ; 2
    BNE    LF513           ; 2
    LDA    $80             ; 3
    AND    #$7C            ; 2
    BNE    LF513           ; 2
    BIT    $95             ; 3
    BVC    LF513           ; 2
    LDA    $B2,X           ; 4
    EOR    #$08            ; 2
    STA    $B2,X           ; 4
LF513:
    LDA    $B2,X           ; 4
    AND    #$08            ; 2
    BEQ    LF524           ; 2
    LDA    $BC,X           ; 4
    SEC                    ; 2
    SBC    $87             ; 3
    BCS    LF53D           ; 2
    LDA    $88             ; 3
    BNE    LF52F           ; 2
LF524:
    CLC                    ; 2
    LDA    $BC,X           ; 4
    ADC    $87             ; 3
    CMP    $88             ; 3
    BCC    LF53D           ; 2
    LDA    #$00            ; 2
LF52F:
    CPY    #$04            ; 2
    BNE    LF53D           ; 2
    BIT    $9A             ; 3
    BMI    LF53D           ; 2
    LDA    #$C0            ; 2
    STA    $D0,X           ; 4
    BNE    LF550           ; 2
LF53D:
    STA    $BC,X           ; 4
    JSR    LF74C           ; 6
    STA    $C6,X           ; 4
    LDY    $8A             ; 3
    BMI    LF550           ; 2
    STA.wy $00CE,Y         ; 5
    LDA    $BC,X           ; 4
    STA.wy $00C4,Y         ; 5
LF550:
    DEX                    ; 2
    DEX                    ; 2
    BMI    LF55E           ; 2
    LSR    $89             ; 5
    LSR    $89             ; 5
    JSR    LF781           ; 6
    JMP    LF418           ; 3
LF55E:
    LDX    #$01            ; 2
LF560:
    STX    $87             ; 3
    LDA    $9A             ; 3
    AND    #$0C            ; 2
    LSR                    ; 2
    ORA    $87             ; 3
    TAY                    ; 2
    LDA    #$00            ; 2
    STA    AUDV0,X         ; 4
    STA    $85,X           ; 4
    LDA    $AD,X           ; 4
    BMI    LF581           ; 2
    STA    AUDF0,X         ; 4
    LDA    LF715,Y         ; 4
    STA    AUDC0,X         ; 4
    LDA    #$08            ; 2
    STA    AUDV0,X         ; 4
    DEC    $AD,X           ; 6
LF581:
    LDA    $AF,X           ; 4
    BMI    LF594           ; 2
    EOR    #$1F            ; 2
    STA    AUDF0,X         ; 4
    LDA    LF716,Y         ; 4
    STA    AUDC0,X         ; 4
    LDA    #$08            ; 2
    STA    AUDV0,X         ; 4
    DEC    $AF,X           ; 6
LF594:
    LDA    $8B,X           ; 4
    AND    #$0F            ; 2
    STA    $87             ; 3
    ASL                    ; 2
    ASL                    ; 2
    CLC                    ; 2
    ADC    $87             ; 3
    STA    $8D,X           ; 4
    LDA    $8B,X           ; 4
    AND    #$F0            ; 2
    LSR                    ; 2
    LSR                    ; 2
    STA    $87             ; 3
    LSR                    ; 2
    LSR                    ; 2
    CLC                    ; 2
    ADC    $87             ; 3
    STA    $8F,X           ; 4
    DEX                    ; 2
    BPL    LF560           ; 2
    LDA    $97             ; 3
    EOR    #$FF            ; 2
    AND    $82             ; 3
    STA    $8A             ; 3
    LDA    #$0F            ; 2
    STA    $89             ; 3
    LDX    #$09            ; 2
    LDY    #$09            ; 2
    LDA    SWCHB           ; 4
    AND    #$08            ; 2
    BEQ    LF5D0           ; 2
    LDA    #$FF            ; 2
    STA    $89             ; 3
    LDY    #$13            ; 2
LF5D0:
    LDA    LF63D,Y         ; 4
    EOR    $8A             ; 3
    AND    $89             ; 3
    STA    $E2,X           ; 4
    DEY                    ; 2
    DEX                    ; 2
    BPL    LF5D0           ; 2
    LDX    #$09            ; 2
    LDY    #$09            ; 2
    BIT    $9A             ; 3
    BPL    LF5E7           ; 2
    LDY    #$13            ; 2
LF5E7:
    LDA    LF629,Y         ; 4
    EOR    $8A             ; 3
    AND    $89             ; 3
    STA    $EC,X           ; 4
    DEY                    ; 2
    DEX                    ; 2
    BPL    LF5E7           ; 2
    STA    COLUBK          ; 3
    LDA    $80             ; 3
    AND    #$04            ; 2
    ASL                    ; 2
    ORA    #$70            ; 2
    STA    $9E             ; 3
    RTS                    ; 6

LF600:
    .byte $02 ; |      X | $F600
    .byte $03 ; |      XX| $F601
    .byte $12 ; |   X  X | $F602
    .byte $00 ; |        | $F603
    .byte $01 ; |       X| $F604
    .byte $10 ; |   X    | $F605
    .byte $46 ; | X   XX | $F606
    .byte $47 ; | X   XXX| $F607
    .byte $56 ; | X X XX | $F608
    .byte $44 ; | X   X  | $F609
    .byte $45 ; | X   X X| $F60A
    .byte $54 ; | X X X  | $F60B
    .byte $08 ; |    X   | $F60C
    .byte $09 ; |    X  X| $F60D
    .byte $18 ; |   XX   | $F60E
    .byte $C0 ; |XX      | $F60F
    .byte $C1 ; |XX     X| $F610
    .byte $D0 ; |XX X    | $F611
    .byte $84 ; |X    X  | $F612
    .byte $85 ; |X    X X| $F613
    .byte $94 ; |X  X X  | $F614
    .byte $E4 ; |XXX  X  | $F615
    .byte $E5 ; |XXX  X X| $F616
    .byte $F4 ; |XXXX X  | $F617
    .byte $E4 ; |XXX  X  | $F618
    .byte $E5 ; |XXX  X X| $F619
    .byte $F4 ; |XXXX X  | $F61A
LF61B:
    .byte $0C ; |    XX  | $F61B
    .byte $00 ; |        | $F61C
    .byte $30 ; |  XX    | $F61D
    .byte $7E ; | XXXXXX | $F61E
LF61F:
    .byte $00 ; |        | $F61F
    .byte $FF ; |XXXXXXXX| $F620
    .byte $06 ; |     XX | $F621
    .byte $00 ; |        | $F622
LF623:
    .byte $01 ; |       X| $F623
    .byte $FF ; |XXXXXXXX| $F624
    .byte $07 ; |     XXX| $F625
    .byte $07 ; |     XXX| $F626
LF627:
    .byte $A5 ; |X X  X X| $F627
    .byte $AD ; |X X XX X| $F628
LF629:
    .byte $80 ; |X       | $F629
    .byte $82 ; |X     X | $F62A
    .byte $82 ; |X     X | $F62B
    .byte $84 ; |X    X  | $F62C
    .byte $86 ; |X    XX | $F62D
    .byte $88 ; |X   X   | $F62E
    .byte $8A ; |X   X X | $F62F
    .byte $8C ; |X   XX  | $F630
    .byte $8E ; |X   XXX | $F631
    .byte $E8 ; |XXX X   | $F632
    .byte $82 ; |X     X | $F633
    .byte $82 ; |X     X | $F634
    .byte $82 ; |X     X | $F635
    .byte $82 ; |X     X | $F636
    .byte $86 ; |X    XX | $F637
    .byte $88 ; |X   X   | $F638
    .byte $8A ; |X   X X | $F639
    .byte $8C ; |X   XX  | $F63A
    .byte $8E ; |X   XXX | $F63B
    .byte $E8 ; |XXX X   | $F63C
LF63D:
    .byte $0C ; |    XX  | $F63D
    .byte $06 ; |     XX | $F63E
    .byte $0A ; |    X X | $F63F
    .byte $0C ; |    XX  | $F640
    .byte $0E ; |    XXX | $F641
    .byte $00 ; |        | $F642
    .byte $06 ; |     XX | $F643
    .byte $00 ; |        | $F644
    .byte $08 ; |    X   | $F645
    .byte $06 ; |     XX | $F646
    .byte $A8 ; |X X X   | $F647
    .byte $38 ; |  XXX   | $F648
    .byte $16 ; |   X XX | $F649
    .byte $CC ; |XX  XX  | $F64A
    .byte $9C ; |X  XXX  | $F64B
    .byte $66 ; | XX  XX | $F64C
    .byte $A6 ; |X X  XX | $F64D
    .byte $38 ; |  XXX   | $F64E
    .byte $A8 ; |X X X   | $F64F
    .byte $38 ; |  XXX   | $F650
LF651:
    .byte $20 ; |  X     | $F651
    .byte $20 ; |  X     | $F652
    .byte $00 ; |        | $F653
    .byte $10 ; |   X    | $F654
LF655:
    .byte $03 ; |      XX| $F655
    .byte $04 ; |     X  | $F656
    .byte $01 ; |       X| $F657
    .byte $02 ; |      X | $F658
    .byte $00 ; |        | $F659
    .byte $03 ; |      XX| $F65A
    .byte $01 ; |       X| $F65B
    .byte $02 ; |      X | $F65C
    .byte $03 ; |      XX| $F65D
    .byte $04 ; |     X  | $F65E
    .byte $01 ; |       X| $F65F
    .byte $02 ; |      X | $F660
    .byte $00 ; |        | $F661
    .byte $00 ; |        | $F662
LF663:
    .byte $0E ; |    XXX | $F663
    .byte $0A ; |    X X | $F664
    .byte $0A ; |    X X | $F665
    .byte $0A ; |    X X | $F666
    .byte $0E ; |    XXX | $F667
    .byte $22 ; |  X   X | $F668
    .byte $22 ; |  X   X | $F669
    .byte $22 ; |  X   X | $F66A
    .byte $22 ; |  X   X | $F66B
    .byte $22 ; |  X   X | $F66C
    .byte $EE ; |XXX XXX | $F66D
    .byte $22 ; |  X   X | $F66E
    .byte $EE ; |XXX XXX | $F66F
    .byte $88 ; |X   X   | $F670
    .byte $EE ; |XXX XXX | $F671
    .byte $EE ; |XXX XXX | $F672
    .byte $22 ; |  X   X | $F673
    .byte $66 ; | XX  XX | $F674
    .byte $22 ; |  X   X | $F675
    .byte $EE ; |XXX XXX | $F676
    .byte $AA ; |X X X X | $F677
    .byte $AA ; |X X X X | $F678
    .byte $EE ; |XXX XXX | $F679
    .byte $22 ; |  X   X | $F67A
    .byte $22 ; |  X   X | $F67B
    .byte $EE ; |XXX XXX | $F67C
    .byte $88 ; |X   X   | $F67D
    .byte $EE ; |XXX XXX | $F67E
    .byte $22 ; |  X   X | $F67F
    .byte $EE ; |XXX XXX | $F680
    .byte $EE ; |XXX XXX | $F681
    .byte $88 ; |X   X   | $F682
    .byte $EE ; |XXX XXX | $F683
    .byte $AA ; |X X X X | $F684
    .byte $EE ; |XXX XXX | $F685
    .byte $EE ; |XXX XXX | $F686
    .byte $22 ; |  X   X | $F687
    .byte $22 ; |  X   X | $F688
    .byte $22 ; |  X   X | $F689
    .byte $22 ; |  X   X | $F68A
    .byte $EE ; |XXX XXX | $F68B
    .byte $AA ; |X X X X | $F68C
    .byte $EE ; |XXX XXX | $F68D
    .byte $AA ; |X X X X | $F68E
    .byte $EE ; |XXX XXX | $F68F
    .byte $EE ; |XXX XXX | $F690
    .byte $AA ; |X X X X | $F691
    .byte $EE ; |XXX XXX | $F692
    .byte $22 ; |  X   X | $F693
    .byte $EE ; |XXX XXX | $F694
LF695:
    .byte $00 ; |        | $F695
    .byte $80 ; |X       | $F696
    .byte $86 ; |X    XX | $F697
    .byte $FF ; |XXXXXXXX| $F698
    .byte $FF ; |XXXXXXXX| $F699
    .byte $38 ; |  XXX   | $F69A
    .byte $30 ; |  XX    | $F69B
    .byte $00 ; |        | $F69C
    .byte $00 ; |        | $F69D
    .byte $BE ; |X XXXXX | $F69E
    .byte $88 ; |X   X   | $F69F
    .byte $FF ; |XXXXXXXX| $F6A0
    .byte $FF ; |XXXXXXXX| $F6A1
    .byte $08 ; |    X   | $F6A2
    .byte $3E ; |  XXXXX | $F6A3
    .byte $00 ; |        | $F6A4
    .byte $00 ; |        | $F6A5
    .byte $80 ; |X       | $F6A6
    .byte $C0 ; |XX      | $F6A7
    .byte $FE ; |XXXXXXX | $F6A8
    .byte $0F ; |    XXXX| $F6A9
    .byte $18 ; |   XX   | $F6AA
    .byte $30 ; |  XX    | $F6AB
    .byte $00 ; |        | $F6AC
    .byte $1F ; |   XXXXX| $F6AD
    .byte $84 ; |X    X  | $F6AE
    .byte $CF ; |XX  XXXX| $F6AF
    .byte $7D ; | XXXXX X| $F6B0
    .byte $0D ; |    XX X| $F6B1
    .byte $0F ; |    XXXX| $F6B2
    .byte $00 ; |        | $F6B3
    .byte $00 ; |        | $F6B4
    .byte $7E ; | XXXXXX | $F6B5
    .byte $C3 ; |XX    XX| $F6B6
    .byte $DB ; |XX XX XX| $F6B7
    .byte $C3 ; |XX    XX| $F6B8
    .byte $DB ; |XX XX XX| $F6B9
    .byte $7E ; | XXXXXX | $F6BA
    .byte $18 ; |   XX   | $F6BB
    .byte $00 ; |        | $F6BC
    .byte $00 ; |        | $F6BD
    .byte $00 ; |        | $F6BE
    .byte $08 ; |    X   | $F6BF
    .byte $44 ; | X   X  | $F6C0
    .byte $3A ; |  XXX X | $F6C1
    .byte $7C ; | XXXXX  | $F6C2
    .byte $46 ; | X   XX | $F6C3
    .byte $00 ; |        | $F6C4
    .byte $7E ; | XXXXXX | $F6C5
    .byte $DB ; |XX XX XX| $F6C6
    .byte $FF ; |XXXXXXXX| $F6C7
    .byte $E7 ; |XXX  XXX| $F6C8
    .byte $BD ; |X XXXX X| $F6C9
    .byte $81 ; |X      X| $F6CA
    .byte $FF ; |XXXXXXXX| $F6CB
    .byte $00 ; |        | $F6CC
    .byte $00 ; |        | $F6CD
    .byte $00 ; |        | $F6CE
    .byte $0C ; |    XX  | $F6CF
    .byte $0B ; |    X XX| $F6D0
    .byte $44 ; | X   X  | $F6D1
    .byte $FE ; |XXXXXXX | $F6D2
    .byte $7E ; | XXXXXX | $F6D3
    .byte $00 ; |        | $F6D4
    .byte $00 ; |        | $F6D5
    .byte $10 ; |   X    | $F6D6
    .byte $38 ; |  XXX   | $F6D7
    .byte $FF ; |XXXXXXXX| $F6D8
    .byte $FE ; |XXXXXXX | $F6D9
    .byte $7E ; | XXXXXX | $F6DA
    .byte $00 ; |        | $F6DB
    .byte $00 ; |        | $F6DC
    .byte $00 ; |        | $F6DD
    .byte $10 ; |   X    | $F6DE
    .byte $54 ; | X X X  | $F6DF
    .byte $7F ; | XXXXXXX| $F6E0
    .byte $FE ; |XXXXXXX | $F6E1
    .byte $FC ; |XXXXXX  | $F6E2
    .byte $3C ; |  XXXX  | $F6E3
    .byte $00 ; |        | $F6E4
    .byte $10 ; |   X    | $F6E5
    .byte $10 ; |   X    | $F6E6
    .byte $36 ; |  XX XX | $F6E7
    .byte $FF ; |XXXXXXXX| $F6E8
    .byte $7E ; | XXXXXX | $F6E9
    .byte $3C ; |  XXXX  | $F6EA
    .byte $00 ; |        | $F6EB
    .byte $00 ; |        | $F6EC
    .byte $28 ; |  X X   | $F6ED
    .byte $28 ; |  X X   | $F6EE
    .byte $28 ; |  X X   | $F6EF
    .byte $AB ; |X X X XX| $F6F0
    .byte $FF ; |XXXXXXXX| $F6F1
    .byte $7E ; | XXXXXX | $F6F2
    .byte $7C ; | XXXXX  | $F6F3
    .byte $00 ; |        | $F6F4
    .byte $2A ; |  X X X | $F6F5
    .byte $1C ; |   XXX  | $F6F6
    .byte $1C ; |   XXX  | $F6F7
    .byte $2A ; |  X X X | $F6F8
    .byte $08 ; |    X   | $F6F9
    .byte $30 ; |  XX    | $F6FA
    .byte $C0 ; |XX      | $F6FB
    .byte $00 ; |        | $F6FC
    .byte $18 ; |   XX   | $F6FD
    .byte $5A ; | X XX X | $F6FE
    .byte $3C ; |  XXXX  | $F6FF
    .byte $FF ; |XXXXXXXX| $F700
    .byte $3C ; |  XXXX  | $F701
    .byte $5A ; | X XX X | $F702
    .byte $18 ; |   XX   | $F703
    .byte $00 ; |        | $F704
    .byte $18 ; |   XX   | $F705
    .byte $24 ; |  X  X  | $F706
    .byte $42 ; | X    X | $F707
    .byte $81 ; |X      X| $F708
    .byte $42 ; | X    X | $F709
    .byte $24 ; |  X  X  | $F70A
    .byte $18 ; |   XX   | $F70B
    .byte $00 ; |        | $F70C
    .byte $42 ; | X    X | $F70D
    .byte $81 ; |X      X| $F70E
    .byte $99 ; |X  XX  X| $F70F
    .byte $24 ; |  X  X  | $F710
    .byte $99 ; |X  XX  X| $F711
    .byte $81 ; |X      X| $F712
    .byte $42 ; | X    X | $F713
    .byte $00 ; |        | $F714
LF715:
    .byte $08 ; |    X   | $F715
LF716:
    .byte $09 ; |    X  X| $F716
    .byte $04 ; |     X  | $F717
    .byte $0C ; |    XX  | $F718
    .byte $03 ; |      XX| $F719
    .byte $01 ; |       X| $F71A
    .byte $08 ; |    X   | $F71B
LF71C:
    .byte $1C ; |   XXX  | $F71C
    .byte $1C ; |   XXX  | $F71D
    .byte $38 ; |  XXX   | $F71E
    .byte $38 ; |  XXX   | $F71F
    .byte $70 ; | XXX    | $F720
    .byte $70 ; | XXX    | $F721
    .byte $FF ; |XXXXXXXX| $F722
    .byte $FF ; |XXXXXXXX| $F723
    .byte $70 ; | XXX    | $F724
    .byte $70 ; | XXX    | $F725
    .byte $70 ; | XXX    | $F726
    .byte $70 ; | XXX    | $F727
    .byte $70 ; | XXX    | $F728
    .byte $70 ; | XXX    | $F729
    .byte $FF ; |XXXXXXXX| $F72A
    .byte $FF ; |XXXXXXXX| $F72B
    .byte $00 ; |        | $F72C
    .byte $01 ; |       X| $F72D
    .byte $07 ; |     XXX| $F72E
    .byte $1E ; |   XXXX | $F72F
    .byte $3C ; |  XXXX  | $F730
    .byte $70 ; | XXX    | $F731
    .byte $FF ; |XXXXXXXX| $F732
    .byte $FF ; |XXXXXXXX| $F733
    .byte $1C ; |   XXX  | $F734
    .byte $1C ; |   XXX  | $F735
    .byte $38 ; |  XXX   | $F736
    .byte $38 ; |  XXX   | $F737
    .byte $70 ; | XXX    | $F738
    .byte $70 ; | XXX    | $F739
    .byte $FF ; |XXXXXXXX| $F73A
    .byte $FF ; |XXXXXXXX| $F73B
LF73C:
    .byte $01 ; |       X| $F73C
    .byte $00 ; |        | $F73D
    .byte $02 ; |      X | $F73E
    .byte $01 ; |       X| $F73F
LF740:
    .byte $02 ; |      X | $F740
    .byte $02 ; |      X | $F741
    .byte $01 ; |       X| $F742
    .byte $02 ; |      X | $F743
LF744:
    .byte $10 ; |   X    | $F744
    .byte $80 ; |X       | $F745
LF746:
    .byte $40 ; | X      | $F746
    .byte $80 ; |X       | $F747
LF748:
    .byte $02 ; |      X | $F748
    .byte $4D ; | X  XX X| $F749
LF74A:
    .byte $45 ; | X   X X| $F74A
    .byte $90 ; |X  X    | $F74B
LF74C:
    STA    $87             ; 3
    BPL    LF758           ; 2
    CMP    #$9E            ; 2
    BCC    LF758           ; 2
    LDA    #$00            ; 2
    STA    $87             ; 3
LF758:
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDA    $87             ; 3
    AND    #$0F            ; 2
    STY    $87             ; 3
    CLC                    ; 2
    ADC    $87             ; 3
    CMP    #$0F            ; 2
    BCC    LF76D           ; 2
    SBC    #$0F            ; 2
    INY                    ; 2
LF76D:
    CMP    #$08            ; 2
    EOR    #$0F            ; 2
    BCS    LF776           ; 2
    ADC    #$01            ; 2
    DEY                    ; 2
LF776:
    INY                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    $87             ; 3
    TYA                    ; 2
    ORA    $87             ; 3
    RTS                    ; 6

LF781:
    LSR    $95             ; 5
    ROL                    ; 2
    EOR    $95             ; 3
    LSR                    ; 2
    LDA    $95             ; 3
    BCS    LF78F           ; 2
    ORA    #$40            ; 2
    STA    $95             ; 3
LF78F:
    RTS                    ; 6

LF790:
    STY    $87             ; 3
    LDY    #$02            ; 2
    LDA    $87             ; 3
    BMI    LF7C3           ; 2
    CMP    $A1,X           ; 4
    BEQ    LF7F6           ; 2
    TXA                    ; 2
    EOR    #$01            ; 2
    TAY                    ; 2
    LDA    $87             ; 3
    CMP.wy $00A1,Y         ; 4
    BNE    LF7B1           ; 2
    LDA    $9A             ; 3
    AND    #$20            ; 2
    BEQ    LF7F6           ; 2
    LDY    #$02            ; 2
    BNE    LF7C3           ; 2
LF7B1:
    LDY    $87             ; 3
    LDA.wy $00D0,Y         ; 4
    BMI    LF7F6           ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDA    $9A             ; 3
    AND    #$02            ; 2
    BEQ    LF7C3           ; 2
    TAY                    ; 2
LF7C3:
    LDA    LF655,Y         ; 4
    SED                    ; 2
    CLC                    ; 2
    ADC    $8B,X           ; 4
    STA    $8B,X           ; 4
    CLD                    ; 2
    BCS    LF7D3           ; 2
    CMP    #$99            ; 2
    BNE    LF7DF           ; 2
LF7D3:
    LDA    #$00            ; 2
    STA    $97             ; 3
    STA    $82             ; 3
    STA    $80             ; 3
    LDA    #$99            ; 2
    STA    $8B,X           ; 4
LF7DF:
    LDY    $87             ; 3
    LDA    #$1F            ; 2
    STA    $AF,X           ; 4
    CPY    #$08            ; 2
    BCS    LF7EE           ; 2
    LDA    #$A0            ; 2
    STA.wy $00D0,Y         ; 5
LF7EE:
    LDA    #$00            ; 2
    STA    $93,X           ; 4
    LDA    #$02            ; 2
    STA    RESMP0,X        ; 4
LF7F6:
    LDY    $87             ; 3
    RTS                    ; 6

    .byte $6A ; | XX X X | $F7F9
    .byte $00 ; |        | $F7FA
    .byte $F0 ; |XXXX    | $F7FB
    .byte $00 ; |        | $F7FC
    .byte $F0 ; |XXXX    | $F7FD
    .byte $00 ; |        | $F7FE
    .byte $F0 ; |XXXX    | $F7FF
