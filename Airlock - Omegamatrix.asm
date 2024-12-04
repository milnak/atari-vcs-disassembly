; Disassembly of air.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcAirlock.cfg air.bin 
;
; Airlock.cfg contents:
;
;      ORG F000
;      CODE F000 F8A3
;      DATA F8A4 F8A7
;      CODE F8A8 FCC7
;      DATA FCC8 FCC9
;      CODE FCCA FCDE
;      GFX FCDF FFFF

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
RESM0   =  $12
RESM1   =  $13
RESBL   =  $14
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
HMM0    =  $22
HMM1    =  $23
HMBL    =  $24
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
SWCHA   =  $0280
SWCHB   =  $0282
SWBCNT  =  $0283
INTIM   =  $0284
TIM64T  =  $0296
LF01F   =   $F01F

       ORG $F000

START:
    SEI                    ; 2
    CLD                    ; 2
    LDA    #$00            ; 2
    TAX                    ; 2
LF005:
    STA    VSYNC,X         ; 4
    DEX                    ; 2
    BNE    LF005           ; 2
    LDA    #$11            ; 2
    STA    CTRLPF          ; 3
    LDA    #$41            ; 2
    STA    $EF             ; 3
    LDA    #$80            ; 2
    STA    $F8             ; 3
    LDA    #$01            ; 2
    STA    $B7             ; 3
    STA    $EC             ; 3
    LDA    #$10            ; 2
    STA    SWBCNT          ; 4
LF021:
    LDA    #$02            ; 2
    STA    WSYNC           ; 3
    STA    VBLANK          ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    VSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    WSYNC           ; 3
    STA    VSYNC           ; 3
    LDA    #$2C            ; 2
    STA    TIM64T          ; 4
    LDX    #$FF            ; 2
    TXS                    ; 2
    JSR    LF297           ; 6
LF044:
    LDA    INTIM           ; 4
    BNE    LF044           ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    VBLANK          ; 3
    LDA    #$00            ; 2
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    STA    COLUBK          ; 3
    BIT    $EF             ; 3
    BVC    LF060           ; 2
    JMP    LF8A8           ; 3
LF060:
    LDA    #$20            ; 2
    LDX    #$60            ; 2
    BIT    $F9             ; 3
    BVS    LF072           ; 2
    LDX    #$68            ; 2
    LDA    #$28            ; 2
    BIT    $ED             ; 3
    BVC    LF072           ; 2
    LDA    #$FE            ; 2
LF072:
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    STX    COLUPF          ; 3
    STA    WSYNC           ; 3
    LDX    #$04            ; 2
    STX    NUSIZ0          ; 3
    STX    NUSIZ1          ; 3
    LDA    #$12            ; 2
    STA    HMP1            ; 3
    AND    #$0F            ; 2
    TAY                    ; 2
LF087:
    DEY                    ; 2
    BPL    LF087           ; 2
    STA    RESP0           ; 3
    STA    RESP1           ; 3
    LDY    #$08            ; 2
LF090:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    ($A4),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($A6),Y         ; 5
    STA    GRP1            ; 3
    LDA    #$48            ; 2
    LDA    $E3             ; 3
    LDA    $E3             ; 3
    LDA    $E3             ; 3
    LDA    $E3             ; 3
    LDA    ($AA),Y         ; 5
    TAX                    ; 2
    LDA    ($A8),Y         ; 5
    STA    GRP0            ; 3
    STX    GRP1            ; 3
    STA    HMCLR           ; 3
    DEY                    ; 2
    BPL    LF090           ; 2
    INY                    ; 2
    STA    WSYNC           ; 3
    STY    GRP0            ; 3
    LDA    $87             ; 3
    STY    GRP1            ; 3
    STA    HMP0            ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
LF0C2:
    DEX                    ; 2
    BPL    LF0C2           ; 2
    STA    RESP0           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDY    #$00            ; 2
    STY    $F0             ; 3
    STY    $F1             ; 3
    LDX    #$03            ; 2
LF0D3:
    DEX                    ; 2
    BNE    LF0D3           ; 2
    STA    HMCLR           ; 3
    STA    WSYNC           ; 3
    LDA    #$90            ; 2
    STA    PF0             ; 3
    LDA    #$FF            ; 2
    STA    PF1             ; 3
    STA    PF2             ; 3
    LDA    #$48            ; 2
    BIT    $F9             ; 3
    BVC    LF0EC           ; 2
    LDA    #$40            ; 2
LF0EC:
    STA    COLUP1          ; 3
LF0EE:
    INY                    ; 2
    STA    WSYNC           ; 3
    LDA    ($80),Y         ; 5
    STA    GRP0            ; 3
    LDX    $F0             ; 3
    LDA    $9A,X           ; 4
    STA    $82             ; 3
    LDA    $BD,X           ; 4
    STA    $89             ; 3
    LDA    $C7,X           ; 4
    STA    $8B             ; 3
    LDX    $F1             ; 3
    LDA    $D6,X           ; 4
    STA    $84             ; 3
    LDA    $AE,X           ; 4
    STA    $86             ; 3
    LDA    $B6             ; 3
    CMP    $F1             ; 3
    BCS    LF117           ; 2
    LDA    #$74            ; 2
    STA    COLUBK          ; 3
LF117:
    INY                    ; 2
    STA    WSYNC           ; 3
    LDA    ($80),Y         ; 5
    STA    GRP0            ; 3
    INC    $F0             ; 5
    LDX    $F0             ; 3
    LDA    $90,X           ; 4
    STA    $81             ; 3
    LDA    $9A,X           ; 4
    STA    $83             ; 3
    LDA    $BD,X           ; 4
    STA    $8A             ; 3
    LDA    $C7,X           ; 4
    STA    $8C             ; 3
    INY                    ; 2
    STA    WSYNC           ; 3
    LDA    ($80),Y         ; 5
    STA    GRP0            ; 3
    LDX    $F0             ; 3
    DEX                    ; 2
    LDA    $90,X           ; 4
    STA    $80             ; 3
    INC    $F0             ; 5
    INC    $F1             ; 5
    LDA    #$00            ; 2
    STA    ENAM0           ; 3
    LDA    #$10            ; 2
    STA    NUSIZ0          ; 3
    LDA    $F1             ; 3
    CMP    #$06            ; 2
    BEQ    LF155           ; 2
    JMP    LF165           ; 3
LF155:
    LDX    #$1C            ; 2
    LDA    #$FF            ; 2
    STA    PF0             ; 3
    STA    RESM0           ; 3
LF15D:
    STA    WSYNC           ; 3
    DEX                    ; 2
    BNE    LF15D           ; 2
    JMP    LF021           ; 3
LF165:
    LDY    #$00            ; 2
    STA    WSYNC           ; 3
    LDA    ($80),Y         ; 5
    STA    GRP0            ; 3
    LDA    $F1             ; 3
    LSR                    ; 2
    BCS    LF182           ; 2
    LDX    #$02            ; 2
LF174:
    DEX                    ; 2
    BNE    LF174           ; 2
    STA    RESM0           ; 3
    LDX    #$06            ; 2
LF17B:
    DEX                    ; 2
    BNE    LF17B           ; 2
    STA    RESM1           ; 3
    BEQ    LF193           ; 2
LF182:
    LDX    #$02            ; 2
LF184:
    DEX                    ; 2
    BNE    LF184           ; 2
    LDA    #$02            ; 2
    STA    RESM1           ; 3
    LDX    #$06            ; 2
LF18D:
    DEX                    ; 2
    BNE    LF18D           ; 2
    STA    RESM0           ; 3
    INY                    ; 2
LF193:
    STA    WSYNC           ; 3
    LDA    ($80),Y         ; 5
    STA    GRP0            ; 3
    LDA    $84             ; 3
    STA    PF0             ; 3
    LDA    #$00            ; 2
    STA    PF1             ; 3
    STA    PF2             ; 3
    STA    NUSIZ1          ; 3
    BIT    $86             ; 3
    BVC    LF1AD           ; 2
    LDA    #$02            ; 2
    STA    ENAM0           ; 3
LF1AD:
    BIT    $86             ; 3
    BPL    LF1B5           ; 2
    LDA    #$02            ; 2
    STA    ENAM1           ; 3
LF1B5:
    INY                    ; 2
    CPY    #$0A            ; 2
    BEQ    LF1DD           ; 2
    STA    WSYNC           ; 3
    LDA    ($80),Y         ; 5
    STA    GRP0            ; 3
    BIT    $EB             ; 3
    BVC    LF1CA           ; 2
    LDA    $AD             ; 3
    CMP    #$40            ; 2
    BCS    LF1DA           ; 2
LF1CA:
    BIT    $EA             ; 3
    BPL    LF1DA           ; 2
    LDA    $B6             ; 3
    CMP    $F1             ; 3
    BCS    LF1DA           ; 2
    LDA    #$74            ; 2
    STA    COLUBK          ; 3
    BNE    LF1DA           ; 2
LF1DA:
    JMP    LF1B5           ; 3
LF1DD:
    LDA    #$00            ; 2
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    LDX    $F1             ; 3
    DEX                    ; 2
    STA    WSYNC           ; 3
    LDA    ($80),Y         ; 5
    STA    GRP0            ; 3
    LDA    $D1,X           ; 4
    STA    HMP1            ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
LF1F3:
    DEX                    ; 2
    BPL    LF1F3           ; 2
    STA    RESP1           ; 3
    INY                    ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    ($80),Y         ; 5
    STA    GRP0            ; 3
    LDA    $F1             ; 3
    LSR                    ; 2
    BCC    LF20A           ; 2
    LDA    #$70            ; 2
    BNE    LF20C           ; 2
LF20A:
    LDA    #$E9            ; 2
LF20C:
    STA    $E3             ; 3
    STA    $E3             ; 3
    STA    HMCLR           ; 3
    INY                    ; 2
    STA    WSYNC           ; 3
    LDA    ($80),Y         ; 5
    STA    GRP0            ; 3
    LDA    $E3             ; 3
    STA    HMM0            ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
LF220:
    DEX                    ; 2
    BPL    LF220           ; 2
    STA    RESM0           ; 3
    INY                    ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    ($80),Y         ; 5
    STA    GRP0            ; 3
    LDX    #$03            ; 2
LF230:
    DEX                    ; 2
    BNE    LF230           ; 2
    STA    HMCLR           ; 3
LF235:
    INY                    ; 2
    CPY    #$16            ; 2
    BEQ    LF247           ; 2
    STA    WSYNC           ; 3
    LDA    ($80),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($82),Y         ; 5
    STA    GRP1            ; 3
    JMP    LF235           ; 3
LF247:
    LDX    $F1             ; 3
    DEX                    ; 2
    CPX    $E7             ; 3
    BNE    LF256           ; 2
    LDA    #$02            ; 2
    STA    ENABL           ; 3
    LDA    $84             ; 3
    STA    PF0             ; 3
LF256:
    STA    WSYNC           ; 3
    LDA    ($80),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($82),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($89),Y         ; 5
    STA    PF1             ; 3
    LDA    ($8B),Y         ; 5
    STA    PF2             ; 3
    INY                    ; 2
    CPY    #$1E            ; 2
    BNE    LF256           ; 2
    LDA    $86             ; 3
    LSR                    ; 2
    BCC    LF278           ; 2
    LDA    #$30            ; 2
    STA    NUSIZ0          ; 3
    LDA    #$02            ; 2
LF278:
    STA    WSYNC           ; 3
    STA    ENAM0           ; 3
    LDX    $F1             ; 3
    LDA    $DB,X           ; 4
    STA    PF0             ; 3
    LDA    #$FF            ; 2
    STA    PF1             ; 3
    STA    PF2             ; 3
    LDA    #$00            ; 2
    STA    GRP1            ; 3
    LDA    #$00            ; 2
    STA    ENABL           ; 3
    LDA    ($80),Y         ; 5
    STA    GRP0            ; 3
    JMP    LF0EE           ; 3
LF297:
    BIT    $F8             ; 3
    BPL    LF2AD           ; 2
    INC    $FB             ; 5
    BNE    LF2AD           ; 2
    INC    $B4             ; 5
    LDA    $B4             ; 3
    CMP    #$70            ; 2
    BNE    LF2AD           ; 2
    LDA    $F9             ; 3
    ORA    #$40            ; 2
    STA    $F9             ; 3
LF2AD:
    LDA    SWCHB           ; 4
    ROR                    ; 2
    BCS    LF2C0           ; 2
    LDA    $ED             ; 3
    AND    #$BF            ; 2
    STA    $ED             ; 3
    LDA    #$00            ; 2
    STA    $EB             ; 3
    JMP    LF2CB           ; 3
LF2C0:
    BIT    $EF             ; 3
    BVC    LF2C7           ; 2
    JMP    LFB91           ; 3
LF2C7:
    BIT    $EF             ; 3
    BPL    LF2DC           ; 2
LF2CB:
    BIT    $EB             ; 3
    BVS    LF2D9           ; 2
    LDA    #$49            ; 2
    BIT    $F8             ; 3
    BVC    LF2D7           ; 2
    LDA    #$99            ; 2
LF2D7:
    STA    $AD             ; 3
LF2D9:
    JMP    LF79D           ; 3
LF2DC:
    LDA    SWCHB           ; 4
    AND    #$02            ; 2
    BNE    LF325           ; 2
    BIT    $F9             ; 3
    BMI    LF32B           ; 2
    LDA    #$80            ; 2
    STA    $F9             ; 3
    LDA    #$00            ; 2
    STA    $EB             ; 3
    INC    $EC             ; 5
    LDA    $EC             ; 3
    CMP    #$05            ; 2
    BCC    LF2FB           ; 2
    LDA    #$01            ; 2
    STA    $EC             ; 3
LF2FB:
    LDA    $EC             ; 3
    LSR                    ; 2
    BCS    LF306           ; 2
    LDA    #$80            ; 2
    STA    $ED             ; 3
    BNE    LF30A           ; 2
LF306:
    LDA    #$00            ; 2
    STA    $ED             ; 3
LF30A:
    LDA    $EC             ; 3
    CMP    #$03            ; 2
    BCC    LF318           ; 2
    LDA    $F8             ; 3
    ORA    #$40            ; 2
    STA    $F8             ; 3
    BNE    LF31E           ; 2
LF318:
    LDA    $F8             ; 3
    AND    #$BF            ; 2
    STA    $F8             ; 3
LF31E:
    LDA    $EC             ; 3
    STA    $AD             ; 3
    JMP    LF79D           ; 3
LF325:
    LDA    #$7F            ; 2
    AND    $F9             ; 3
    STA    $F9             ; 3
LF32B:
    BIT    $F8             ; 3
    BPL    LF361           ; 2
    BIT    $ED             ; 3
    BVC    LF33A           ; 2
    LDA    PF0             ; 3
    ASL                    ; 2
    BCS    LF33F           ; 2
    BCC    LF342           ; 2
LF33A:
    LDA    REFP1           ; 3
    ASL                    ; 2
    BCC    LF342           ; 2
LF33F:
    JMP    LF659           ; 3
LF342:
    LDA    $F8             ; 3
    AND    #$7F            ; 2
    STA    $F8             ; 3
    LDA    $F9             ; 3
    AND    #$BF            ; 2
    STA    $F9             ; 3
    LDA    #$00            ; 2
    STA    $FB             ; 3
    STA    $B4             ; 3
    LDA    #$49            ; 2
    BIT    $F8             ; 3
    BVC    LF35C           ; 2
    LDA    #$99            ; 2
LF35C:
    STA    $AD             ; 3
    JMP    LF715           ; 3
LF361:
    BIT    $EA             ; 3
    BVC    LF392           ; 2
    LDA    $B7             ; 3
    ORA    #$40            ; 2
    STA    $B7             ; 3
    LDA    $EF             ; 3
    ORA    #$41            ; 2
    STA    $EF             ; 3
    BIT    $ED             ; 3
    BPL    LF385           ; 2
    BVS    LF37F           ; 2
    LDA    $ED             ; 3
    ORA    #$40            ; 2
    STA    $ED             ; 3
    BNE    LF38B           ; 2
LF37F:
    LDA    $ED             ; 3
    AND    #$BF            ; 2
    STA    $ED             ; 3
LF385:
    LDA    $B7             ; 3
    ORA    #$01            ; 2
    STA    $B7             ; 3
LF38B:
    LDA    #$00            ; 2
    STA    $EB             ; 3
    JMP    LF715           ; 3
LF392:
    LDA    $AD             ; 3
    BNE    LF39C           ; 2
    LDA    $B3             ; 3
    CMP    #$01            ; 2
    BEQ    LF3BA           ; 2
LF39C:
    BIT    $EA             ; 3
    BPL    LF3C3           ; 2
    LDA    $EA             ; 3
    AND    #$7F            ; 2
    STA    $EA             ; 3
    BIT    $EB             ; 3
    BVC    LF3B0           ; 2
    LDA    $AD             ; 3
    CMP    #$41            ; 2
    BCS    LF3B2           ; 2
LF3B0:
    DEC    $B6             ; 5
LF3B2:
    INC    $B5             ; 5
    LDA    $AC             ; 3
    CMP    $B5             ; 3
    BCS    LF3D5           ; 2
LF3BA:
    LDA    $EA             ; 3
    ORA    #$40            ; 2
    STA    $EA             ; 3
    JMP    LF715           ; 3
LF3C3:
    LDA    $AD             ; 3
    AND    #$0F            ; 2
    BNE    LF3D5           ; 2
    LDA    $B3             ; 3
    CMP    #$05            ; 2
    BNE    LF3D5           ; 2
    LDA    $EA             ; 3
    ORA    #$80            ; 2
    STA    $EA             ; 3
LF3D5:
    LDA    $EE             ; 3
    BEQ    LF3DE           ; 2
    DEC    $EE             ; 5
    JMP    LF631           ; 3
LF3DE:
    LDA    $F6             ; 3
    BNE    LF3E5           ; 2
    JMP    LF469           ; 3
LF3E5:
    CMP    #$22            ; 2
    BCS    LF3EC           ; 2
    JMP    LF4C5           ; 3
LF3EC:
    CLC                    ; 2
    SED                    ; 2
    LDA    $AC             ; 3
    ADC    #$01            ; 2
    STA    $AC             ; 3
    CLD                    ; 2
    LDA    $F4             ; 3
    BNE    LF446           ; 2
    LDA    #$00            ; 2
    STA    $F6             ; 3
    BIT    $F8             ; 3
    BVC    LF414           ; 2
    BIT    $EB             ; 3
    BVS    LF414           ; 2
    LDA    $EB             ; 3
    ORA    #$40            ; 2
    STA    $EB             ; 3
    LDA    $EF             ; 3
    ORA    #$80            ; 2
    STA    $EF             ; 3
    JMP    LF715           ; 3
LF414:
    BIT    $ED             ; 3
    BPL    LF42E           ; 2
    BVS    LF428           ; 2
    LDA    $ED             ; 3
    ORA    #$40            ; 2
    STA    $ED             ; 3
    LDA    $EF             ; 3
    ORA    #$80            ; 2
    STA    $EF             ; 3
    BNE    LF434           ; 2
LF428:
    LDA    $ED             ; 3
    AND    #$BF            ; 2
    STA    $ED             ; 3
LF42E:
    LDA    $B7             ; 3
    ORA    #$01            ; 2
    STA    $B7             ; 3
LF434:
    LDA    $EF             ; 3
    ORA    #$41            ; 2
    STA    $EF             ; 3
    LDA    $B7             ; 3
    ORA    #$80            ; 2
    STA    $B7             ; 3
    LDA    $EB             ; 3
    AND    #$BF            ; 2
    STA    $EB             ; 3
LF446:
    LDX    $F4             ; 3
    LDA    #$00            ; 2
    STA    $90,X           ; 4
    LDX    $E7             ; 3
    LDA    #$90            ; 2
    STA    $D6,X           ; 4
    LDA    #$F0            ; 2
    STA    $DB,X           ; 4
    DEC    $F4             ; 5
    DEC    $F4             ; 5
    DEC    $E7             ; 5
    LDX    $E7             ; 3
    LDA    #$10            ; 2
    STA    $D6,X           ; 4
    LDA    #$00            ; 2
    STA    $F6             ; 3
    JMP    LF61C           ; 3
LF469:
    BIT    COLUP1          ; 3
    BPL    LF490           ; 2
    LDA    #$00            ; 2
    STA    $F5             ; 3
    STA    $F3             ; 3
    STA    $E6             ; 3
    LDA    #$2C            ; 2
    STA    $E5             ; 3
    LDA    #$58            ; 2
    STA    $E1             ; 3
    LDA    #$01            ; 2
    STA    $F7             ; 3
    LDA    #$FF            ; 2
    STA    $EE             ; 3
    LDX    $F4             ; 3
    LDA    #$58            ; 2
    STA    $90,X           ; 4
    LDA    #$FE            ; 2
    STA    $91,X           ; 4
    RTS                    ; 6

LF490:
    BIT    WSYNC           ; 3
    BVC    LF4E8           ; 2
    LDA    $F2             ; 3
    AND    #$03            ; 2
    CMP    #$03            ; 2
    BNE    LF4E8           ; 2
    BIT    $E9             ; 3
    BVS    LF4A5           ; 2
    INC    $88             ; 5
    JMP    LF4A7           ; 3
LF4A5:
    DEC    $88             ; 5
LF4A7:
    LDA    #$00            ; 2
    STA    $E6             ; 3
    LDA    #$0C            ; 2
    STA    $E5             ; 3
    LDA    #$88            ; 2
    STA    $E1             ; 3
    LDA    #$01            ; 2
    STA    $F7             ; 3
    LDA    #$00            ; 2
    STA    $F6             ; 3
    STA    $F2             ; 3
    LDX    $E7             ; 3
    LDA    $AE,X           ; 4
    AND    #$FE            ; 2
    STA    $AE,X           ; 4
LF4C5:
    LDX    $F4             ; 3
    LDA    $F6             ; 3
    ADC    #$81            ; 2
    STA    $90,X           ; 4
    LDA    #$FE            ; 2
    STA    $91,X           ; 4
    LDA    $F6             ; 3
    CMP    #$16            ; 2
    BMI    LF4E3           ; 2
    LDX    $F4             ; 3
    BEQ    LF4E3           ; 2
    DEX                    ; 2
    DEX                    ; 2
    LDA    $F6             ; 3
    ADC    #$60            ; 2
    STA    $90,X           ; 4
LF4E3:
    INC    $F6             ; 5
    JMP    LF631           ; 3
LF4E8:
    BIT    WSYNC           ; 3
    BPL    LF50F           ; 2
    LDA    #$01            ; 2
    STA    $F7             ; 3
    LDA    #$00            ; 2
    STA    $E6             ; 3
    LDA    #$38            ; 2
    STA    $E5             ; 3
    LDA    #$18            ; 2
    STA    $E1             ; 3
    BIT    $E9             ; 3
    BVS    LF504           ; 2
    INC    $88             ; 5
    BNE    LF506           ; 2
LF504:
    DEC    $88             ; 5
LF506:
    LDA    #$00            ; 2
    STA    $F3             ; 3
    STA    $F5             ; 3
    JMP    LF618           ; 3
LF50F:
    BIT    VSYNC           ; 3
    BVC    LF533           ; 2
    LDA    #$00            ; 2
    STA    $E6             ; 3
    LDA    #$14            ; 2
    STA    $E5             ; 3
    LDA    #$00            ; 2
    STA    $E1             ; 3
    LDA    #$01            ; 2
    STA    $F7             ; 3
    LDA    #$01            ; 2
    STA    $F2             ; 3
    LDX    $E7             ; 3
    LDA    $AE,X           ; 4
    AND    #$BF            ; 2
    STA    $AE,X           ; 4
    LDA    #$90            ; 2
    STA    $D6,X           ; 4
LF533:
    BIT    VBLANK          ; 3
    BPL    LF55B           ; 2
    LDA    $F2             ; 3
    BEQ    LF55B           ; 2
    ORA    #$02            ; 2
    STA    $F2             ; 3
    LDA    #$01            ; 2
    STA    $F7             ; 3
    LDA    #$00            ; 2
    STA    $E6             ; 3
    LDA    #$14            ; 2
    STA    $E5             ; 3
    LDA    #$00            ; 2
    STA    $E1             ; 3
    LDX    $E7             ; 3
    LDA    $AE,X           ; 4
    AND    #$7F            ; 2
    STA    $AE,X           ; 4
    LDA    #$10            ; 2
    STA    $D6,X           ; 4
LF55B:
    LDA    $F5             ; 3
    BEQ    LF580           ; 2
    LDA    $F3             ; 3
    CMP    #$0F            ; 2
    BPL    LF57A           ; 2
    LDA    #$C0            ; 2
    BIT    $E9             ; 3
    BEQ    LF573           ; 2
    BVS    LF571           ; 2
    DEC    $88             ; 5
    BNE    LF573           ; 2
LF571:
    INC    $88             ; 5
LF573:
    INC    $F3             ; 5
    BEQ    LF57A           ; 2
    JMP    LF614           ; 3
LF57A:
    LDA    #$00            ; 2
    STA    $F3             ; 3
    STA    $F5             ; 3
LF580:
    BIT    $ED             ; 3
    BVC    LF58B           ; 2
    LDA    PF0             ; 3
    ASL                    ; 2
    BCS    LF5CA           ; 2
    BCC    LF590           ; 2
LF58B:
    LDA    REFP1           ; 3
    ASL                    ; 2
    BCS    LF5CA           ; 2
LF590:
    LDA    #$00            ; 2
    STA    $E6             ; 3
    LDA    #$18            ; 2
    STA    $E5             ; 3
    LDA    #$98            ; 2
    STA    $E1             ; 3
    LDA    #$01            ; 2
    STA    $F7             ; 3
    LDA    #$01            ; 2
    STA    $F5             ; 3
    LDA    #$00            ; 2
    STA    $F3             ; 3
    BIT    $ED             ; 3
    BVC    LF5B7           ; 2
    LDA    SWCHA           ; 4
    AND    #$0C            ; 2
    CMP    #$0C            ; 2
    BNE    LF5D4           ; 2
    BEQ    LF5C0           ; 2
LF5B7:
    LDA    SWCHA           ; 4
    AND    #$C0            ; 2
    CMP    #$C0            ; 2
    BMI    LF5D4           ; 2
LF5C0:
    LDA    #$D0            ; 2
    STA    $8E             ; 3
    LDA    #$FE            ; 2
    STA    $8F             ; 3
    BNE    LF5DC           ; 2
LF5CA:
    LDA    #$00            ; 2
    STA    $8E             ; 3
    LDA    #$FE            ; 2
    STA    $8F             ; 3
    BNE    LF5DC           ; 2
LF5D4:
    LDA    #$E0            ; 2
    STA    $8E             ; 3
    LDA    #$FE            ; 2
    STA    $8F             ; 3
LF5DC:
    LDA    #$00            ; 2
    STA    $E9             ; 3
    BIT    $ED             ; 3
    BVC    LF5F4           ; 2
    LDA    SWCHA           ; 4
    AND    #$08            ; 2
    BEQ    LF600           ; 2
    LDA    SWCHA           ; 4
    AND    #$04            ; 2
    BEQ    LF608           ; 2
    BNE    LF61C           ; 2
LF5F4:
    LDA    SWCHA           ; 4
    ASL                    ; 2
    BCC    LF600           ; 2
    ASL                    ; 2
    BCC    LF608           ; 2
    JMP    LF61C           ; 3
LF600:
    INC    $88             ; 5
    LDA    #$40            ; 2
    STA    $E9             ; 3
    BNE    LF60E           ; 2
LF608:
    DEC    $88             ; 5
    LDA    #$80            ; 2
    STA    $E9             ; 3
LF60E:
    LDA    #$80            ; 2
    ORA    $85             ; 3
    STA    $85             ; 3
LF614:
    LDA    #$03            ; 2
    STA    $EE             ; 3
LF618:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
LF61C:
    LDX    $F4             ; 3
    LDY    $F3             ; 3
    CLC                    ; 2
    LDA    ($8E),Y         ; 5
    ADC    #$0E            ; 2
    STA    $90,X           ; 4
    LDA    #$FE            ; 2
    STA    $91,X           ; 4
    STA    HMCLR           ; 3
    BIT    $F8             ; 3
    BMI    LF659           ; 2
LF631:
    LDA    $B3             ; 3
    BEQ    LF63A           ; 2
    DEC    $B3             ; 5
    JMP    LF68C           ; 3
LF63A:
    LDA    #$7F            ; 2
    BIT    $ED             ; 3
    BVC    LF647           ; 2
    BIT    SWCHB           ; 4
    BMI    LF64E           ; 2
    BPL    LF64C           ; 2
LF647:
    BIT    SWCHB           ; 4
    BVS    LF64E           ; 2
LF64C:
    LDA    #$58            ; 2
LF64E:
    STA    $B3             ; 3
    SEC                    ; 2
    SED                    ; 2
    LDA    $AD             ; 3
    SBC    #$01            ; 2
    STA    $AD             ; 3
    CLD                    ; 2
LF659:
    LDA    #$04            ; 2
    STA    $E3             ; 3
    LDX    #$01            ; 2
LF65F:
    LDA    $AC,X           ; 4
    AND    #$F0            ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDA    LFF1E,Y         ; 4
    LDY    $E3             ; 3
    STA.wy $00A4,Y         ; 5
    LDA    $AC,X           ; 4
    AND    #$0F            ; 2
    TAY                    ; 2
    LDA    LFF1E,Y         ; 4
    LDY    $E3             ; 3
    STA.wy $00A6,Y         ; 5
    LDA    #$FF            ; 2
    STA.wy $00A5,Y         ; 5
    STA.wy $00A7,Y         ; 5
    LDY    #$00            ; 2
    STY    $E3             ; 3
    DEX                    ; 2
    BPL    LF65F           ; 2
LF68C:
    LDA    $E8             ; 3
    BNE    LF6DB           ; 2
    LDA    #$03            ; 2
    STA    $E8             ; 3
    LDX    #$00            ; 2
LF696:
    LDA    $B8,X           ; 4
    CMP    #$80            ; 2
    BCS    LF6B8           ; 2
    SEC                    ; 2
    SBC    #$01            ; 2
    CPX    #$00            ; 2
    BNE    LF6A5           ; 2
    SBC    #$01            ; 2
LF6A5:
    STA    $B8,X           ; 4
    CMP    #$08            ; 2
    BCC    LF6B2           ; 2
    JSR    LFCCA           ; 6
    STA    $D1,X           ; 4
    BNE    LF6D4           ; 2
LF6B2:
    ORA    #$80            ; 2
    STA    $B8,X           ; 4
    BNE    LF6D4           ; 2
LF6B8:
    AND    #$7F            ; 2
    CLC                    ; 2
    ADC    #$01            ; 2
    CPX    #$01            ; 2
    BNE    LF6C3           ; 2
    ADC    #$01            ; 2
LF6C3:
    STA    $B8,X           ; 4
    CMP    #$7D            ; 2
    BCS    LF6D2           ; 2
    JSR    LFCCA           ; 6
    STA    $D1,X           ; 4
    LDA    $B8,X           ; 4
    ORA    #$80            ; 2
LF6D2:
    STA    $B8,X           ; 4
LF6D4:
    INX                    ; 2
    CPX    #$05            ; 2
    BNE    LF696           ; 2
    BEQ    LF6DD           ; 2
LF6DB:
    DEC    $E8             ; 5
LF6DD:
    LDA    $E7             ; 3
    LSR                    ; 2
    BCC    LF6F1           ; 2
    LDX    #$0E            ; 2
    LDA    #$C0            ; 2
    STA    HMBL            ; 3
    STA    WSYNC           ; 3
LF6EA:
    DEX                    ; 2
    BNE    LF6EA           ; 2
    STA    RESBL           ; 3
    BEQ    LF6FA           ; 2
LF6F1:
    LDX    #$04            ; 2
    STA    WSYNC           ; 3
LF6F5:
    DEX                    ; 2
    BNE    LF6F5           ; 2
    STA    RESBL           ; 3
LF6FA:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #$00            ; 2
    STA    HMM0            ; 3
    STA    HMM1            ; 3
    STA    HMBL            ; 3
    LDA    #$00            ; 2
    STA    NUSIZ1          ; 3
    STA    CXCLR           ; 3
    STA    HMCLR           ; 3
    LDA    $88             ; 3
    JSR    LFCCA           ; 6
    STA    $87             ; 3
LF715:
    BIT    $85             ; 3
    BPL    LF754           ; 2
    LDA    $85             ; 3
    AND    #$7F            ; 2
    STA    $85             ; 3
    CMP    #$01            ; 2
    BNE    LF73E           ; 2
    LDA    #$08            ; 2
    SEC                    ; 2
    SBC    $8D             ; 3
    SBC    $8D             ; 3
    STA    AUDV1           ; 3
    DEC    $8D             ; 5
    BEQ    LF733           ; 2
    JMP    LF768           ; 3
LF733:
    LDA    #$02            ; 2
    STA    $85             ; 3
    LDA    #$08            ; 2
    STA    $8D             ; 3
    JMP    LF768           ; 3
LF73E:
    LDA    #$00            ; 2
    STA    AUDV1           ; 3
    DEC    $8D             ; 5
    BEQ    LF749           ; 2
    JMP    LF768           ; 3
LF749:
    LDA    #$01            ; 2
    STA    $85             ; 3
    LDA    #$05            ; 2
    STA    $8D             ; 3
    JMP    LF768           ; 3
LF754:
    LDA    #$00            ; 2
    STA    AUDV1           ; 3
    LDA    #$05            ; 2
    STA    $8D             ; 3
    LDA    #$08            ; 2
    STA    AUDC1           ; 3
    LDA    #$0A            ; 2
    STA    AUDF1           ; 3
    LDA    #$01            ; 2
    STA    $85             ; 3
LF768:
    LDA    $F7             ; 3
    BEQ    LF772           ; 2
    LDA    $E4             ; 3
    BEQ    LF773           ; 2
    DEC    $E4             ; 5
LF772:
    RTS                    ; 6

LF773:
    LDY    $E6             ; 3
    CPY    $E5             ; 3
    BEQ    LF794           ; 2
    LDA    ($E1),Y         ; 5
    STA    $E4             ; 3
    INY                    ; 2
    LDA    ($E1),Y         ; 5
    STA    AUDC0           ; 3
    INY                    ; 2
    LDA    ($E1),Y         ; 5
    STA    AUDF0           ; 3
    INY                    ; 2
    LDA    ($E1),Y         ; 5
    STA    AUDV0           ; 3
    CLC                    ; 2
    LDA    $E6             ; 3
    ADC    #$04            ; 2
    STA    $E6             ; 3
    RTS                    ; 6

LF794:
    LDA    #$00            ; 2
    STA    AUDV0           ; 3
    STA    $F7             ; 3
    STA    $E6             ; 3
    RTS                    ; 6

LF79D:
    LDA    #$08            ; 2
    STA    $F4             ; 3
    LDA    #$04            ; 2
    STA    $E7             ; 3
    LDA    #$BF            ; 2
    AND    $F9             ; 3
    STA    $F9             ; 3
    LDA    #$00            ; 2
    STA    COLUBK          ; 3
    LDA    #$10            ; 2
    STA    NUSIZ0          ; 3
    LDA    #$FD            ; 2
    STA    $E2             ; 3
    BIT    $EB             ; 3
    BVS    LF7E2           ; 2
    LDA    #$00            ; 2
    STA    $AC             ; 3
    STA    $EA             ; 3
    STA    $B7             ; 3
    STA    $B5             ; 3
    LDA    $F8             ; 3
    ORA    #$80            ; 2
    STA    $F8             ; 3
    LDA    #$7F            ; 2
    STA    $B3             ; 3
    LDA    $EC             ; 3
    LSR                    ; 2
    BCC    LF7DC           ; 2
    LDA    $ED             ; 3
    AND    #$7F            ; 2
    STA    $ED             ; 3
    BPL    LF7E2           ; 2
LF7DC:
    LDA    $ED             ; 3
    ORA    #$80            ; 2
    STA    $ED             ; 3
LF7E2:
    LDA    #$04            ; 2
    STA    $B6             ; 3
    LDA    #$00            ; 2
    STA    $F3             ; 3
    STA    $F5             ; 3
    STA    $F2             ; 3
    STA    $F6             ; 3
    STA    $EF             ; 3
    STA    $EE             ; 3
    STA    $B4             ; 3
    STA    $FB             ; 3
    LDX    #$00            ; 2
LF7FA:
    STA    $90,X           ; 4
    INX                    ; 2
    INX                    ; 2
    CPX    #$0A            ; 2
    BNE    LF7FA           ; 2
    LDA    #$FE            ; 2
    LDX    #$00            ; 2
LF806:
    STA    $91,X           ; 4
    INX                    ; 2
    INX                    ; 2
    CPX    #$0A            ; 2
    BNE    LF806           ; 2
    LDA    #$0A            ; 2
    LDX    #$00            ; 2
LF812:
    STA    $9A,X           ; 4
    INX                    ; 2
    INX                    ; 2
    CPX    #$0A            ; 2
    BNE    LF812           ; 2
    LDA    #$FE            ; 2
    LDX    #$00            ; 2
LF81E:
    STA    $9B,X           ; 4
    INX                    ; 2
    INX                    ; 2
    CPX    #$0A            ; 2
    BNE    LF81E           ; 2
    LDA    #$C1            ; 2
    LDX    #$00            ; 2
LF82A:
    STA    $AE,X           ; 4
    INX                    ; 2
    CPX    #$05            ; 2
    BNE    LF82A           ; 2
    LDA    #$A8            ; 2
    STA    $B8             ; 3
    LDA    #$40            ; 2
    STA    $B9             ; 3
    LDA    #$32            ; 2
    STA    $BA             ; 3
    LDA    #$C1            ; 2
    STA    $BB             ; 3
    LDA    #$9E            ; 2
    STA    $BC             ; 3
    LDA    #$3A            ; 2
    LDX    #$00            ; 2
LF849:
    STA    $BD,X           ; 4
    INX                    ; 2
    INX                    ; 2
    CPX    #$0A            ; 2
    BNE    LF849           ; 2
    LDA    #$FE            ; 2
    LDX    #$00            ; 2
LF855:
    STA    $BE,X           ; 4
    INX                    ; 2
    INX                    ; 2
    CPX    #$0A            ; 2
    BNE    LF855           ; 2
    LDA    #$4A            ; 2
    BIT    $EB             ; 3
    BVC    LF865           ; 2
    LDA    #$3A            ; 2
LF865:
    LDX    #$00            ; 2
    LDX    #$00            ; 2
LF869:
    STA    $C7,X           ; 4
    INX                    ; 2
    INX                    ; 2
    CPX    #$0A            ; 2
    BNE    LF869           ; 2
    LDA    #$FE            ; 2
    LDX    #$00            ; 2
LF875:
    STA    $C8,X           ; 4
    INX                    ; 2
    INX                    ; 2
    CPX    #$0A            ; 2
    BNE    LF875           ; 2
    LDA    #$90            ; 2
    LDX    #$00            ; 2
LF881:
    STA    $D6,X           ; 4
    STA    $DB,X           ; 4
    INX                    ; 2
    CPX    #$05            ; 2
    BNE    LF881           ; 2
    LDA    #$F0            ; 2
    STA    $DB,X           ; 4
    LDA    #$63            ; 2
    BIT    $EB             ; 3
    BVC    LF89A           ; 2
    LDA    #$95            ; 2
    LDY    #$10            ; 2
    STY    $DA             ; 3
LF89A:
    STA    $88             ; 3
    JSR    LFCCA           ; 6
    STA    $87             ; 3
    JMP    LF61C           ; 3
LF8A4:
    .byte $0C,$F6,$02,$A2
LF8A8:
    STA    WSYNC           ; 3
    LDA    #$18            ; 2
    BIT    $F9             ; 3
    BVC    LF8B2           ; 2
    LDA    #$10            ; 2
LF8B2:
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDA    #$00            ; 2
    STA    PF0             ; 3
    STA    ENAM1           ; 3
    LDX    #$0A            ; 2
LF8BE:
    STA    WSYNC           ; 3
    DEX                    ; 2
    BNE    LF8BE           ; 2
    STA    WSYNC           ; 3
    LDX    #$01            ; 2
    STX    NUSIZ0          ; 3
    STX    NUSIZ1          ; 3
    LDA    #$14            ; 2
    STA    HMP1            ; 3
    AND    #$0F            ; 2
    TAY                    ; 2
LF8D2:
    DEY                    ; 2
    BPL    LF8D2           ; 2
    STA    RESP0           ; 3
    STA    RESP1           ; 3
    LDY    #$08            ; 2
LF8DB:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    ($90),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($92),Y         ; 5
    STA    GRP1            ; 3
    LDA    $E3             ; 3
    LDA    $E3             ; 3
    LDA    $E3             ; 3
    LDA    $E3             ; 3
    LDA    #$00            ; 2
    LDA    ($96),Y         ; 5
    TAX                    ; 2
    LDA    ($94),Y         ; 5
    STA    GRP0            ; 3
    STX    GRP1            ; 3
    STA    HMCLR           ; 3
    LDA    $E3             ; 3
    DEY                    ; 2
    BPL    LF8DB           ; 2
    INY                    ; 2
    STA    WSYNC           ; 3
    STY    GRP0            ; 3
    STY    GRP1            ; 3
    LDX    #$15            ; 2
LF90A:
    STA    WSYNC           ; 3
    DEX                    ; 2
    BNE    LF90A           ; 2
    STA    WSYNC           ; 3
    LDA    $80,X           ; 4
    LDA    $80,X           ; 4
    LDA    #$D0            ; 2
    STA    HMP0            ; 3
    LDX    #$06            ; 2
LF91B:
    DEX                    ; 2
    BNE    LF91B           ; 2
    STA    RESP0           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    #$07            ; 2
LF926:
    DEX                    ; 2
    BNE    LF926           ; 2
    STA    HMCLR           ; 3
    STA    WSYNC           ; 3
    LDA    $80,X           ; 4
    LDA    $80,X           ; 4
    LDA    #$D0            ; 2
    STA    HMP1            ; 3
    LDX    #$06            ; 2
LF937:
    DEX                    ; 2
    BNE    LF937           ; 2
    STA    RESP1           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    #$07            ; 2
LF942:
    DEX                    ; 2
    BNE    LF942           ; 2
    STA    HMCLR           ; 3
    STA    WSYNC           ; 3
    LDX    #$48            ; 2
    LDA    #$0E            ; 2
    BIT    $F9             ; 3
    BVC    LF955           ; 2
    LDX    #$40            ; 2
    LDA    #$00            ; 2
LF955:
    STX    COLUPF          ; 3
    STA    COLUP1          ; 3
    LDA    #$28            ; 2
    LDX    $ED             ; 3
    CPX    #$80            ; 2
    BNE    LF963           ; 2
    LDA    #$FE            ; 2
LF963:
    STA    COLUP0          ; 3
    LDA    #$00            ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    STA    WSYNC           ; 3
    LDA    #$02            ; 2
    STA    ENAM1           ; 3
    LDX    #$0A            ; 2
LF973:
    STA    WSYNC           ; 3
    DEX                    ; 2
    BNE    LF973           ; 2
    LDA    #$10            ; 2
    STA    NUSIZ1          ; 3
    LDY    #$00            ; 2
LF97E:
    STA    WSYNC           ; 3
    LDA    #$C0            ; 2
    BIT    $B7             ; 3
    BEQ    LF98A           ; 2
    LDA    ($BD),Y         ; 5
    STA    GRP0            ; 3
LF98A:
    INY                    ; 2
    CPY    #$0A            ; 2
    BNE    LF97E           ; 2
    LDX    #$04            ; 2
LF991:
    STA    WSYNC           ; 3
    LDA    #$C0            ; 2
    BIT    $B7             ; 3
    BEQ    LF9A2           ; 2
    LDA    #$02            ; 2
    STA    ENABL           ; 3
    LDA    ($BD),Y         ; 5
    STA    GRP0            ; 3
    INY                    ; 2
LF9A2:
    DEX                    ; 2
    BNE    LF991           ; 2
    BIT    $B7             ; 3
    BVC    LF9AC           ; 2
    JMP    LFA8E           ; 3
LF9AC:
    STA    WSYNC           ; 3
    LDA    #$48            ; 2
    BIT    $F9             ; 3
    BVC    LF9B6           ; 2
    LDA    #$40            ; 2
LF9B6:
    STA    COLUP0          ; 3
    LDA    #$C0            ; 2
    STA    PF2             ; 3
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    ENAM1           ; 3
    STA    ENABL           ; 3
    STA    WSYNC           ; 3
    LDA    $80,X           ; 4
    LDA    $80,X           ; 4
    LDA    #$F0            ; 2
    STA    HMP0            ; 3
    LDX    #$05            ; 2
LF9D0:
    DEX                    ; 2
    BNE    LF9D0           ; 2
    STA    RESP0           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    #$07            ; 2
LF9DB:
    DEX                    ; 2
    BNE    LF9DB           ; 2
    STA    HMCLR           ; 3
    STA    WSYNC           ; 3
    LDX    #$00            ; 2
LF9E4:
    LDA    LFCE0,X         ; 4
    STA    GRP0            ; 3
    LDA    LFFB6,X         ; 4
    STA    GRP1            ; 3
    STA    WSYNC           ; 3
    INX                    ; 2
    CPX    #$10            ; 2
    BNE    LF9E4           ; 2
    BIT    $B7             ; 3
    BPL    LF9FC           ; 2
    JMP    LFA8E           ; 3
LF9FC:
    LDX    #$10            ; 2
LF9FE:
    LDA    LFCE0,X         ; 4
    STA    GRP0            ; 3
    LDA    LFFB6,X         ; 4
    STA    GRP1            ; 3
    STA    WSYNC           ; 3
    INX                    ; 2
    CPX    #$1B            ; 2
    BNE    LF9FE           ; 2
    LDA    #$05            ; 2
    STA    NUSIZ1          ; 3
    LDA    #$48            ; 2
    BIT    $F9             ; 3
    BVC    LFA1B           ; 2
    LDA    #$40            ; 2
LFA1B:
    STA    COLUP1          ; 3
    LDX    #$00            ; 2
    STA    WSYNC           ; 3
    LDA    LFCFC           ; 4
    STA    GRP0,X          ; 4
    LDA    #$C0            ; 2
    STA    HMP1            ; 3
    LDX    #$09            ; 2
LFA2C:
    DEX                    ; 2
    BNE    LFA2C           ; 2
    STA    RESP1           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    #$07            ; 2
LFA37:
    DEX                    ; 2
    BNE    LFA37           ; 2
    STA    HMCLR           ; 3
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    LDX    #$00            ; 2
    STA    WSYNC           ; 3
    LDA    #$F0            ; 2
    STA    PF2,X           ; 4
    LDA    #$00            ; 2
    LDA    #$A0            ; 2
    STA    HMP0            ; 3
    LDX    #$02            ; 2
LFA50:
    DEX                    ; 2
    BNE    LFA50           ; 2
    STA    RESP0           ; 3
    LDX    #$03            ; 2
LFA57:
    DEX                    ; 2
    BNE    LFA57           ; 2
    LDA    #$C0            ; 2
    STA    PF2             ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #$F0            ; 2
    STA    PF2             ; 3
    LDX    #$07            ; 2
LFA68:
    DEX                    ; 2
    BNE    LFA68           ; 2
    LDA    #$C0            ; 2
    STA    PF2             ; 3
    STA    HMCLR           ; 3
    STA    WSYNC           ; 3
    LDA    #$FF            ; 2
    STA    PF2             ; 3
    LDA    #$0F            ; 2
    STA    PF1             ; 3
    LDX    #$00            ; 2
LFA7D:
    STA    WSYNC           ; 3
    LDA    LFF82,X         ; 4
    STA    GRP0            ; 3
    LDA    LFF8A,X         ; 4
    STA    GRP1            ; 3
    INX                    ; 2
    CPX    #$08            ; 2
    BNE    LFA7D           ; 2
LFA8E:
    STA    WSYNC           ; 3
    LDA    #$88            ; 2
    BIT    $F9             ; 3
    BVC    LFA98           ; 2
    LDA    #$80            ; 2
LFA98:
    STA    COLUBK          ; 3
    LDA    #$00            ; 2
    STA    PF1             ; 3
    STA    PF2             ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    ENAM1           ; 3
    STA    ENABL           ; 3
    LDA    #$00            ; 2
    STA    COLUP0          ; 3
    LDA    #$05            ; 2
    STA    NUSIZ0          ; 3
    STA    WSYNC           ; 3
    LDA    $E3             ; 3
    LDA    $E3             ; 3
    LDA    $98             ; 3
    STA    HMP0            ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
LFABD:
    DEX                    ; 2
    BPL    LFABD           ; 2
    STA    RESP0           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    #$08            ; 2
LFAC8:
    DEX                    ; 2
    BNE    LFAC8           ; 2
    STA    HMCLR           ; 3
    LDX    #$00            ; 2
LFACF:
    STA    WSYNC           ; 3
    LDA    LFF92,X         ; 4
    STA    GRP0            ; 3
    INX                    ; 2
    CPX    #$06            ; 2
    BNE    LFACF           ; 2
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    BIT    $B7             ; 3
    BVS    LFAEB           ; 2
    BMI    LFAEF           ; 2
    LDX    #$18            ; 2
    BNE    LFAF1           ; 2
LFAEB:
    LDX    #$44            ; 2
    BNE    LFAF1           ; 2
LFAEF:
    LDX    #$30            ; 2
LFAF1:
    STA    WSYNC           ; 3
    DEX                    ; 2
    BNE    LFAF1           ; 2
    STA    WSYNC           ; 3
    LDA    $E3             ; 3
    LDA    $E3             ; 3
    LDA    $99             ; 3
    STA    HMP1            ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
LFB03:
    DEX                    ; 2
    BPL    LFB03           ; 2
    STA    RESP1           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    #$08            ; 2
LFB0E:
    DEX                    ; 2
    BNE    LFB0E           ; 2
    STA    HMCLR           ; 3
    STA    WSYNC           ; 3
    LDA    #$2C            ; 2
    BIT    $F9             ; 3
    BVC    LFB1D           ; 2
    LDA    #$20            ; 2
LFB1D:
    STA    COLUP1          ; 3
    LDA    #$03            ; 2
    STA    NUSIZ1          ; 3
    LDX    #$00            ; 2
LFB25:
    STA    WSYNC           ; 3
    LDA    LFF99,X         ; 4
    STA    GRP1            ; 3
    INX                    ; 2
    CPX    #$07            ; 2
    BNE    LFB25           ; 2
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    GRP1            ; 3
    LDX    #$08            ; 2
LFB39:
    STA    WSYNC           ; 3
    DEX                    ; 2
    BNE    LFB39           ; 2
    STA    WSYNC           ; 3
    LDA    $E3             ; 3
    LDA    $E3             ; 3
    LDA    $9A             ; 3
    STA    HMP0            ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
LFB4B:
    DEX                    ; 2
    BPL    LFB4B           ; 2
    STA    RESP0           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    #$06            ; 2
LFB56:
    DEX                    ; 2
    BNE    LFB56           ; 2
    STA    HMCLR           ; 3
    STA    WSYNC           ; 3
    LDA    #$0F            ; 2
    LDA    #$0C            ; 2
    BIT    $F9             ; 3
    BVC    LFB67           ; 2
    LDA    #$00            ; 2
LFB67:
    STA    COLUP0          ; 3
    LDA    #$05            ; 2
    STA    NUSIZ0          ; 3
    LDA    #$08            ; 2
    STA    REFP0           ; 3
    LDX    #$00            ; 2
LFB73:
    STA    WSYNC           ; 3
    LDA    LFF99,X         ; 4
    STA    GRP0            ; 3
    INX                    ; 2
    CPX    #$07            ; 2
    BNE    LFB73           ; 2
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    REFP0           ; 3
    LDX    #$1E            ; 2
LFB89:
    STA    WSYNC           ; 3
    DEX                    ; 2
    BNE    LFB89           ; 2
    JMP    LF01F           ; 3
LFB91:
    LDA    #$FD            ; 2
    STA    $E2             ; 3
    LDA    #$01            ; 2
    BIT    $EF             ; 3
    BEQ    LFBC7           ; 2
    LDA    #$FE            ; 2
    AND    $EF             ; 3
    STA    $EF             ; 3
    LDA    #$FF            ; 2
    STA    $C9             ; 3
    LDA    #$00            ; 2
    STA    $C7             ; 3
    STA    $C8             ; 3
    STA    $E6             ; 3
    LDA    #$01            ; 2
    STA    $F7             ; 3
    BIT    $B7             ; 3
    BMI    LFBBF           ; 2
    BVS    LFBB9           ; 2
    BPL    LFBD7           ; 2
LFBB9:
    LDA    #$30            ; 2
    LDX    #$B0            ; 2
    BNE    LFBC3           ; 2
LFBBF:
    LDA    #$20            ; 2
    LDX    #$E0            ; 2
LFBC3:
    STA    $E5             ; 3
    STX    $E1             ; 3
LFBC7:
    DEC    $C9             ; 5
    BNE    LFBF1           ; 2
    LDA    #$01            ; 2
    BIT    $B7             ; 3
    BNE    LFBD7           ; 2
    LDA    #$80            ; 2
    STA    $EF             ; 3
    BNE    LFBF1           ; 2
LFBD7:
    LDA    #$00            ; 2
    STA    $E6             ; 3
    LDA    #$01            ; 2
    STA    $F7             ; 3
    LDA    #$18            ; 2
    STA    $E5             ; 3
    LDA    #$58            ; 2
    STA    $E1             ; 3
    LDA    $F8             ; 3
    ORA    #$80            ; 2
    STA    $F8             ; 3
    LDA    #$01            ; 2
    STA    $B7             ; 3
LFBF1:
    LDA    #$00            ; 2
    STA    COLUBK          ; 3
    INC    $9B             ; 5
    INC    $9B             ; 5
    LDA    $9B             ; 3
    CMP    #$A1            ; 2
    BCC    LFC03           ; 2
    LDA    #$00            ; 2
    STA    $9B             ; 3
LFC03:
    JSR    LFCCA           ; 6
    STA    $98             ; 3
    DEC    $9C             ; 5
    LDA    $9C             ; 3
    CMP    #$04            ; 2
    BCS    LFC14           ; 2
    LDA    #$A0            ; 2
    STA    $9C             ; 3
LFC14:
    JSR    LFCCA           ; 6
    STA    $99             ; 3
    INC    $9D             ; 5
    LDA    $9D             ; 3
    CMP    #$A1            ; 2
    BCC    LFC25           ; 2
    LDA    #$00            ; 2
    STA    $9D             ; 3
LFC25:
    JSR    LFCCA           ; 6
    STA    $9A             ; 3
    STA    WSYNC           ; 3
    LDA    ($80),Y         ; 5
    LDA    ($80),Y         ; 5
    LDA    #$B0            ; 2
    STA    HMM1            ; 3
    LDX    #$05            ; 2
LFC36:
    DEX                    ; 2
    BNE    LFC36           ; 2
    STA    RESM1           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    #$08            ; 2
    LDX    #$07            ; 2
LFC43:
    DEX                    ; 2
    BNE    LFC43           ; 2
    STA    HMCLR           ; 3
    STA    WSYNC           ; 3
    LDA    ($80),Y         ; 5
    LDA    $80             ; 3
    LDA    #$00            ; 2
    STA    HMBL            ; 3
    LDX    #$06            ; 2
LFC54:
    DEX                    ; 2
    BNE    LFC54           ; 2
    STA    RESBL           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    #$07            ; 2
LFC5F:
    DEX                    ; 2
    BNE    LFC5F           ; 2
    STA    HMCLR           ; 3
    LDA    #$09            ; 2
    STA    $90             ; 3
    LDA    #$13            ; 2
    STA    $92             ; 3
    LDA    #$A2            ; 2
    STA    $94             ; 3
    LDA    #$AC            ; 2
    STA    $96             ; 3
    LDA    #$FF            ; 2
    STA    $91             ; 3
    STA    $93             ; 3
    STA    $95             ; 3
    STA    $97             ; 3
    BIT    $B7             ; 3
    BVS    LFCA6           ; 2
    BPL    LFCC5           ; 2
    LDA    $C7             ; 3
    BNE    LFCC3           ; 2
    LDA    #$08            ; 2
    STA    $C7             ; 3
    LDA    $C8             ; 3
    BNE    LFC98           ; 2
    LDA    #$01            ; 2
    STA    $C8             ; 3
    LDX    #$D6            ; 2
    BNE    LFC9E           ; 2
LFC98:
    LDX    #$DC            ; 2
    LDA    #$00            ; 2
    STA    $C8             ; 3
LFC9E:
    STX    $BD             ; 3
    LDA    #$FF            ; 2
    STA    $BE             ; 3
    BNE    LFCC5           ; 2
LFCA6:
    LDX    $C8             ; 3
    CPX    #$08            ; 2
    BCS    LFCC5           ; 2
    LDA    $C7             ; 3
    BNE    LFCC3           ; 2
    LDA    #$20            ; 2
    STA    $C7             ; 3
    INC    $C8             ; 5
    SEC                    ; 2
    LDA    #$D6            ; 2
    SBC    $C8             ; 3
    STA    $BD             ; 3
    LDA    #$FF            ; 2
    STA    $BE             ; 3
    BNE    LFCC5           ; 2
LFCC3:
    DEC    $C7             ; 5
LFCC5:
    JMP    LF715           ; 3
LFCC8:
    .byte $32,$23
LFCCA:
    LDY    #$FF            ; 2
    SEC                    ; 2
LFCCD:
    INY                    ; 2
    SBC    #$0F            ; 2
    BCS    LFCCD           ; 2
    STY    $E3             ; 3
    EOR    #$FF            ; 2
    ADC    #$09            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ORA    $E3             ; 3
    RTS                    ; 6

    .byte $00 ; |        | $FCDF
LFCE0:
    .byte $01 ; |       X| $FCE0
    .byte $01 ; |       X| $FCE1
    .byte $01 ; |       X| $FCE2
    .byte $01 ; |       X| $FCE3
    .byte $03 ; |      XX| $FCE4
    .byte $03 ; |      XX| $FCE5
    .byte $03 ; |      XX| $FCE6
    .byte $03 ; |      XX| $FCE7
    .byte $07 ; |     XXX| $FCE8
    .byte $07 ; |     XXX| $FCE9
    .byte $07 ; |     XXX| $FCEA
    .byte $07 ; |     XXX| $FCEB
    .byte $0F ; |    XXXX| $FCEC
    .byte $0F ; |    XXXX| $FCED
    .byte $0F ; |    XXXX| $FCEE
    .byte $0F ; |    XXXX| $FCEF
    .byte $1F ; |   XXXXX| $FCF0
    .byte $1F ; |   XXXXX| $FCF1
    .byte $1F ; |   XXXXX| $FCF2
    .byte $1F ; |   XXXXX| $FCF3
    .byte $3F ; |  XXXXXX| $FCF4
    .byte $3F ; |  XXXXXX| $FCF5
    .byte $3F ; |  XXXXXX| $FCF6
    .byte $3F ; |  XXXXXX| $FCF7
    .byte $7F ; | XXXXXXX| $FCF8
    .byte $7F ; | XXXXXXX| $FCF9
    .byte $7F ; | XXXXXXX| $FCFA
    .byte $7F ; | XXXXXXX| $FCFB
LFCFC:
    .byte $FF ; |XXXXXXXX| $FCFC
    .byte $FF ; |XXXXXXXX| $FCFD
    .byte $FF ; |XXXXXXXX| $FCFE
    .byte $FF ; |XXXXXXXX| $FCFF
    
    
    .byte $00 ; |        | $FD00
    .byte $0C ; |    XX  | $FD01
    .byte $0C ; |    XX  | $FD02
    .byte $1E ; |   XXXX | $FD03
    .byte $00 ; |        | $FD04
    .byte $0C ; |    XX  | $FD05
    .byte $00 ; |        | $FD06
    .byte $00 ; |        | $FD07
    .byte $00 ; |        | $FD08
    .byte $0C ; |    XX  | $FD09
    .byte $02 ; |      X | $FD0A
    .byte $02 ; |      X | $FD0B
    .byte $00 ; |        | $FD0C
    .byte $0C ; |    XX  | $FD0D
    .byte $00 ; |        | $FD0E
    .byte $04 ; |     X  | $FD0F
    .byte $00 ; |        | $FD10
    .byte $0C ; |    XX  | $FD11
    .byte $06 ; |     XX | $FD12
    .byte $06 ; |     XX | $FD13
    .byte $00 ; |        | $FD14
    .byte $00 ; |        | $FD15
    .byte $00 ; |        | $FD16
    .byte $00 ; |        | $FD17
    .byte $00 ; |        | $FD18
    .byte $0F ; |    XXXX| $FD19
    .byte $1F ; |   XXXXX| $FD1A
    .byte $0F ; |    XXXX| $FD1B
    .byte $00 ; |        | $FD1C
    .byte $0F ; |    XXXX| $FD1D
    .byte $1F ; |   XXXXX| $FD1E
    .byte $0E ; |    XXX | $FD1F
    .byte $00 ; |        | $FD20
    .byte $0F ; |    XXXX| $FD21
    .byte $1F ; |   XXXXX| $FD22
    .byte $0D ; |    XX X| $FD23
    .byte $00 ; |        | $FD24
    .byte $0F ; |    XXXX| $FD25
    .byte $1F ; |   XXXXX| $FD26
    .byte $0C ; |    XX  | $FD27
    .byte $00 ; |        | $FD28
    .byte $0F ; |    XXXX| $FD29
    .byte $1F ; |   XXXXX| $FD2A
    .byte $0B ; |    X XX| $FD2B
    .byte $00 ; |        | $FD2C
    .byte $0F ; |    XXXX| $FD2D
    .byte $1F ; |   XXXXX| $FD2E
    .byte $0A ; |    X X | $FD2F
    .byte $00 ; |        | $FD30
    .byte $0F ; |    XXXX| $FD31
    .byte $1F ; |   XXXXX| $FD32
    .byte $09 ; |    X  X| $FD33
    .byte $00 ; |        | $FD34
    .byte $0F ; |    XXXX| $FD35
    .byte $1F ; |   XXXXX| $FD36
    .byte $08 ; |    X   | $FD37
    .byte $00 ; |        | $FD38
    .byte $0F ; |    XXXX| $FD39
    .byte $1F ; |   XXXXX| $FD3A
    .byte $07 ; |     XXX| $FD3B
    .byte $00 ; |        | $FD3C
    .byte $0F ; |    XXXX| $FD3D
    .byte $1F ; |   XXXXX| $FD3E
    .byte $06 ; |     XX | $FD3F
    .byte $00 ; |        | $FD40
    .byte $0F ; |    XXXX| $FD41
    .byte $1F ; |   XXXXX| $FD42
    .byte $05 ; |     X X| $FD43
    .byte $00 ; |        | $FD44
    .byte $0F ; |    XXXX| $FD45
    .byte $1F ; |   XXXXX| $FD46
    .byte $04 ; |     X  | $FD47
    .byte $00 ; |        | $FD48
    .byte $0F ; |    XXXX| $FD49
    .byte $1F ; |   XXXXX| $FD4A
    .byte $03 ; |      XX| $FD4B
    .byte $00 ; |        | $FD4C
    .byte $0F ; |    XXXX| $FD4D
    .byte $1F ; |   XXXXX| $FD4E
    .byte $02 ; |      X | $FD4F
    .byte $00 ; |        | $FD50
    .byte $0F ; |    XXXX| $FD51
    .byte $1F ; |   XXXXX| $FD52
    .byte $01 ; |       X| $FD53
    .byte $00 ; |        | $FD54
    .byte $00 ; |        | $FD55
    .byte $00 ; |        | $FD56
    .byte $00 ; |        | $FD57
    .byte $00 ; |        | $FD58
    .byte $0C ; |    XX  | $FD59
    .byte $12 ; |   X  X | $FD5A
    .byte $0F ; |    XXXX| $FD5B
    .byte $01 ; |       X| $FD5C
    .byte $0C ; |    XX  | $FD5D
    .byte $12 ; |   X  X | $FD5E
    .byte $0A ; |    X X | $FD5F
    .byte $02 ; |      X | $FD60
    .byte $0C ; |    XX  | $FD61
    .byte $12 ; |   X  X | $FD62
    .byte $07 ; |     XXX| $FD63
    .byte $05 ; |     X X| $FD64
    .byte $0C ; |    XX  | $FD65
    .byte $12 ; |   X  X | $FD66
    .byte $04 ; |     X  | $FD67
    .byte $10 ; |   X    | $FD68
    .byte $0C ; |    XX  | $FD69
    .byte $12 ; |   X  X | $FD6A
    .byte $01 ; |       X| $FD6B
    .byte $08 ; |    X   | $FD6C
    .byte $0C ; |    XX  | $FD6D
    .byte $12 ; |   X  X | $FD6E
    .byte $00 ; |        | $FD6F
    .byte $00 ; |        | $FD70
    .byte $0C ; |    XX  | $FD71
    .byte $17 ; |   X XXX| $FD72
    .byte $05 ; |     X X| $FD73
    .byte $01 ; |       X| $FD74
    .byte $0C ; |    XX  | $FD75
    .byte $17 ; |   X XXX| $FD76
    .byte $04 ; |     X  | $FD77
    .byte $02 ; |      X | $FD78
    .byte $0C ; |    XX  | $FD79
    .byte $17 ; |   X XXX| $FD7A
    .byte $03 ; |      XX| $FD7B
    .byte $10 ; |   X    | $FD7C
    .byte $0C ; |    XX  | $FD7D
    .byte $17 ; |   X XXX| $FD7E
    .byte $02 ; |      X | $FD7F
    .byte $30 ; |  XX    | $FD80
    .byte $0C ; |    XX  | $FD81
    .byte $17 ; |   X XXX| $FD82
    .byte $01 ; |       X| $FD83
    .byte $00 ; |        | $FD84
    .byte $00 ; |        | $FD85
    .byte $00 ; |        | $FD86
    .byte $00 ; |        | $FD87
    .byte $0C ; |    XX  | $FD88
    .byte $0C ; |    XX  | $FD89
    .byte $16 ; |   X XX | $FD8A
    .byte $08 ; |    X   | $FD8B
    .byte $0C ; |    XX  | $FD8C
    .byte $0C ; |    XX  | $FD8D
    .byte $10 ; |   X    | $FD8E
    .byte $08 ; |    X   | $FD8F
    .byte $0C ; |    XX  | $FD90
    .byte $0C ; |    XX  | $FD91
    .byte $0D ; |    XX X| $FD92
    .byte $08 ; |    X   | $FD93
    .byte $24 ; |  X  X  | $FD94
    .byte $0C ; |    XX  | $FD95
    .byte $0A ; |    X X | $FD96
    .byte $08 ; |    X   | $FD97
    .byte $00 ; |        | $FD98
    .byte $0C ; |    XX  | $FD99
    .byte $1F ; |   XXXXX| $FD9A
    .byte $08 ; |    X   | $FD9B
    .byte $01 ; |       X| $FD9C
    .byte $0C ; |    XX  | $FD9D
    .byte $1C ; |   XXX  | $FD9E
    .byte $08 ; |    X   | $FD9F
    .byte $02 ; |      X | $FDA0
    .byte $0C ; |    XX  | $FDA1
    .byte $1D ; |   XXX X| $FDA2
    .byte $08 ; |    X   | $FDA3
    .byte $03 ; |      XX| $FDA4
    .byte $0C ; |    XX  | $FDA5
    .byte $0C ; |    XX  | $FDA6
    .byte $08 ; |    X   | $FDA7
    .byte $04 ; |     X  | $FDA8
    .byte $0C ; |    XX  | $FDA9
    .byte $08 ; |    X   | $FDAA
    .byte $08 ; |    X   | $FDAB
    .byte $05 ; |     X X| $FDAC
    .byte $0C ; |    XX  | $FDAD
    .byte $04 ; |     X  | $FDAE
    .byte $0C ; |    XX  | $FDAF
    .byte $05 ; |     X X| $FDB0
    .byte $0C ; |    XX  | $FDB1
    .byte $0C ; |    XX  | $FDB2
    .byte $08 ; |    X   | $FDB3
    .byte $10 ; |   X    | $FDB4
    .byte $0C ; |    XX  | $FDB5
    .byte $0C ; |    XX  | $FDB6
    .byte $00 ; |        | $FDB7
    .byte $07 ; |     XXX| $FDB8
    .byte $0C ; |    XX  | $FDB9
    .byte $10 ; |   X    | $FDBA
    .byte $08 ; |    X   | $FDBB
    .byte $10 ; |   X    | $FDBC
    .byte $0C ; |    XX  | $FDBD
    .byte $10 ; |   X    | $FDBE
    .byte $00 ; |        | $FDBF
    .byte $09 ; |    X  X| $FDC0
    .byte $0C ; |    XX  | $FDC1
    .byte $14 ; |   X X  | $FDC2
    .byte $08 ; |    X   | $FDC3
    .byte $14 ; |   X X  | $FDC4
    .byte $0C ; |    XX  | $FDC5
    .byte $14 ; |   X X  | $FDC6
    .byte $00 ; |        | $FDC7
    .byte $0B ; |    X XX| $FDC8
    .byte $0C ; |    XX  | $FDC9
    .byte $18 ; |   XX   | $FDCA
    .byte $08 ; |    X   | $FDCB
    .byte $18 ; |   XX   | $FDCC
    .byte $0C ; |    XX  | $FDCD
    .byte $18 ; |   XX   | $FDCE
    .byte $00 ; |        | $FDCF
    .byte $0D ; |    XX X| $FDD0
    .byte $0C ; |    XX  | $FDD1
    .byte $1C ; |   XXX  | $FDD2
    .byte $08 ; |    X   | $FDD3
    .byte $1C ; |   XXX  | $FDD4
    .byte $0C ; |    XX  | $FDD5
    .byte $1C ; |   XXX  | $FDD6
    .byte $00 ; |        | $FDD7
    .byte $40 ; | X      | $FDD8
    .byte $0C ; |    XX  | $FDD9
    .byte $1F ; |   XXXXX| $FDDA
    .byte $08 ; |    X   | $FDDB
    .byte $20 ; |  X     | $FDDC
    .byte $0C ; |    XX  | $FDDD
    .byte $1F ; |   XXXXX| $FDDE
    .byte $00 ; |        | $FDDF
    .byte $0C ; |    XX  | $FDE0
    .byte $0C ; |    XX  | $FDE1
    .byte $12 ; |   X  X | $FDE2
    .byte $08 ; |    X   | $FDE3
    .byte $06 ; |     XX | $FDE4
    .byte $0C ; |    XX  | $FDE5
    .byte $0F ; |    XXXX| $FDE6
    .byte $08 ; |    X   | $FDE7
    .byte $06 ; |     XX | $FDE8
    .byte $0C ; |    XX  | $FDE9
    .byte $12 ; |   X  X | $FDEA
    .byte $08 ; |    X   | $FDEB
    .byte $0C ; |    XX  | $FDEC
    .byte $0C ; |    XX  | $FDED
    .byte $18 ; |   XX   | $FDEE
    .byte $08 ; |    X   | $FDEF
    .byte $06 ; |     XX | $FDF0
    .byte $0C ; |    XX  | $FDF1
    .byte $12 ; |   X  X | $FDF2
    .byte $08 ; |    X   | $FDF3
    .byte $06 ; |     XX | $FDF4
    .byte $0C ; |    XX  | $FDF5
    .byte $18 ; |   XX   | $FDF6
    .byte $08 ; |    X   | $FDF7
    .byte $0C ; |    XX  | $FDF8
    .byte $0C ; |    XX  | $FDF9
    .byte $12 ; |   X  X | $FDFA
    .byte $08 ; |    X   | $FDFB
    .byte $06 ; |     XX | $FDFC
    .byte $06 ; |     XX | $FDFD
    .byte $0F ; |    XXXX| $FDFE
    .byte $00 ; |        | $FDFF
    .byte $00 ; |        | $FE00
    .byte $00 ; |        | $FE01
    .byte $00 ; |        | $FE02
    .byte $00 ; |        | $FE03
    .byte $00 ; |        | $FE04
    .byte $00 ; |        | $FE05
    .byte $00 ; |        | $FE06
    .byte $00 ; |        | $FE07
    .byte $00 ; |        | $FE08
    .byte $00 ; |        | $FE09
    .byte $00 ; |        | $FE0A
    .byte $00 ; |        | $FE0B
    .byte $00 ; |        | $FE0C
    .byte $00 ; |        | $FE0D
    .byte $00 ; |        | $FE0E
    .byte $00 ; |        | $FE0F
    .byte $00 ; |        | $FE10
    .byte $00 ; |        | $FE11
    .byte $00 ; |        | $FE12
    .byte $00 ; |        | $FE13
    .byte $00 ; |        | $FE14
    .byte $00 ; |        | $FE15
    .byte $00 ; |        | $FE16
    .byte $00 ; |        | $FE17
    .byte $00 ; |        | $FE18
    .byte $00 ; |        | $FE19
    .byte $00 ; |        | $FE1A
    .byte $00 ; |        | $FE1B
    .byte $00 ; |        | $FE1C
    .byte $00 ; |        | $FE1D
    .byte $00 ; |        | $FE1E
    .byte $00 ; |        | $FE1F
    .byte $00 ; |        | $FE20
    .byte $00 ; |        | $FE21
    .byte $00 ; |        | $FE22
    .byte $3C ; |  XXXX  | $FE23
    .byte $3C ; |  XXXX  | $FE24
    .byte $18 ; |   XX   | $FE25
    .byte $7E ; | XXXXXX | $FE26
    .byte $3C ; |  XXXX  | $FE27
    .byte $3C ; |  XXXX  | $FE28
    .byte $24 ; |  X  X  | $FE29
    .byte $24 ; |  X  X  | $FE2A
    .byte $00 ; |        | $FE2B
    .byte $00 ; |        | $FE2C
    .byte $00 ; |        | $FE2D
    .byte $00 ; |        | $FE2E
    .byte $00 ; |        | $FE2F
    .byte $00 ; |        | $FE30
    .byte $00 ; |        | $FE31
    .byte $00 ; |        | $FE32
    .byte $00 ; |        | $FE33
    .byte $00 ; |        | $FE34
    .byte $00 ; |        | $FE35
    .byte $00 ; |        | $FE36
    .byte $00 ; |        | $FE37
    .byte $00 ; |        | $FE38
    .byte $00 ; |        | $FE39
    .byte $00 ; |        | $FE3A
    .byte $00 ; |        | $FE3B
    .byte $00 ; |        | $FE3C
    .byte $00 ; |        | $FE3D
    .byte $00 ; |        | $FE3E
    .byte $00 ; |        | $FE3F
    .byte $00 ; |        | $FE40
    .byte $00 ; |        | $FE41
    .byte $00 ; |        | $FE42
    .byte $00 ; |        | $FE43
    .byte $00 ; |        | $FE44
    .byte $00 ; |        | $FE45
    .byte $00 ; |        | $FE46
    .byte $00 ; |        | $FE47
    .byte $00 ; |        | $FE48
    .byte $00 ; |        | $FE49
    .byte $00 ; |        | $FE4A
    .byte $00 ; |        | $FE4B
    .byte $00 ; |        | $FE4C
    .byte $00 ; |        | $FE4D
    .byte $00 ; |        | $FE4E
    .byte $00 ; |        | $FE4F
    .byte $00 ; |        | $FE50
    .byte $00 ; |        | $FE51
    .byte $02 ; |      X | $FE52
    .byte $02 ; |      X | $FE53
    .byte $02 ; |      X | $FE54
    .byte $02 ; |      X | $FE55
    .byte $02 ; |      X | $FE56
    .byte $02 ; |      X | $FE57
    .byte $00 ; |        | $FE58
    .byte $00 ; |        | $FE59
    .byte $00 ; |        | $FE5A
    .byte $00 ; |        | $FE5B
    .byte $00 ; |        | $FE5C
    .byte $00 ; |        | $FE5D
    .byte $00 ; |        | $FE5E
    .byte $00 ; |        | $FE5F
    .byte $00 ; |        | $FE60
    .byte $00 ; |        | $FE61
    .byte $00 ; |        | $FE62
    .byte $00 ; |        | $FE63
    .byte $00 ; |        | $FE64
    .byte $00 ; |        | $FE65
    .byte $00 ; |        | $FE66
    .byte $00 ; |        | $FE67
    .byte $00 ; |        | $FE68
    .byte $00 ; |        | $FE69
    .byte $00 ; |        | $FE6A
    .byte $00 ; |        | $FE6B
    .byte $00 ; |        | $FE6C
    .byte $00 ; |        | $FE6D
    .byte $00 ; |        | $FE6E
    .byte $3C ; |  XXXX  | $FE6F
    .byte $3C ; |  XXXX  | $FE70
    .byte $18 ; |   XX   | $FE71
    .byte $7E ; | XXXXXX | $FE72
    .byte $3C ; |  XXXX  | $FE73
    .byte $BD ; |X XXXX X| $FE74
    .byte $FF ; |XXXXXXXX| $FE75
    .byte $00 ; |        | $FE76
    .byte $00 ; |        | $FE77
    .byte $00 ; |        | $FE78
    .byte $00 ; |        | $FE79
    .byte $00 ; |        | $FE7A
    .byte $00 ; |        | $FE7B
    .byte $00 ; |        | $FE7C
    .byte $00 ; |        | $FE7D
    .byte $00 ; |        | $FE7E
    .byte $00 ; |        | $FE7F
    .byte $00 ; |        | $FE80
    .byte $00 ; |        | $FE81
    .byte $00 ; |        | $FE82
    .byte $00 ; |        | $FE83
    .byte $00 ; |        | $FE84
    .byte $00 ; |        | $FE85
    .byte $00 ; |        | $FE86
    .byte $00 ; |        | $FE87
    .byte $00 ; |        | $FE88
    .byte $00 ; |        | $FE89
    .byte $00 ; |        | $FE8A
    .byte $00 ; |        | $FE8B
    .byte $00 ; |        | $FE8C
    .byte $00 ; |        | $FE8D
    .byte $00 ; |        | $FE8E
    .byte $00 ; |        | $FE8F
    .byte $00 ; |        | $FE90
    .byte $00 ; |        | $FE91
    .byte $00 ; |        | $FE92
    .byte $00 ; |        | $FE93
    .byte $00 ; |        | $FE94
    .byte $00 ; |        | $FE95
    .byte $00 ; |        | $FE96
    .byte $3C ; |  XXXX  | $FE97
    .byte $3C ; |  XXXX  | $FE98
    .byte $18 ; |   XX   | $FE99
    .byte $7E ; | XXXXXX | $FE9A
    .byte $3C ; |  XXXX  | $FE9B
    .byte $3C ; |  XXXX  | $FE9C
    .byte $24 ; |  X  X  | $FE9D
    .byte $24 ; |  X  X  | $FE9E
    .byte $FF ; |XXXXXXXX| $FE9F
    .byte $FF ; |XXXXXXXX| $FEA0
    .byte $FF ; |XXXXXXXX| $FEA1
    .byte $FF ; |XXXXXXXX| $FEA2
    .byte $00 ; |        | $FEA3
    .byte $00 ; |        | $FEA4
    .byte $00 ; |        | $FEA5
    .byte $00 ; |        | $FEA6
    .byte $00 ; |        | $FEA7
    .byte $00 ; |        | $FEA8
    .byte $00 ; |        | $FEA9
    .byte $00 ; |        | $FEAA
    .byte $00 ; |        | $FEAB
    .byte $00 ; |        | $FEAC
    .byte $00 ; |        | $FEAD
    .byte $00 ; |        | $FEAE
    .byte $00 ; |        | $FEAF
    .byte $00 ; |        | $FEB0
    .byte $00 ; |        | $FEB1
    .byte $00 ; |        | $FEB2
    .byte $00 ; |        | $FEB3
    .byte $00 ; |        | $FEB4
    .byte $00 ; |        | $FEB5
    .byte $00 ; |        | $FEB6
    .byte $00 ; |        | $FEB7
    .byte $00 ; |        | $FEB8
    .byte $00 ; |        | $FEB9
    .byte $00 ; |        | $FEBA
    .byte $00 ; |        | $FEBB
    .byte $00 ; |        | $FEBC
    .byte $00 ; |        | $FEBD
    .byte $00 ; |        | $FEBE
    .byte $00 ; |        | $FEBF
    .byte $00 ; |        | $FEC0
    .byte $00 ; |        | $FEC1
    .byte $00 ; |        | $FEC2
    .byte $00 ; |        | $FEC3
    .byte $00 ; |        | $FEC4
    .byte $00 ; |        | $FEC5
    .byte $00 ; |        | $FEC6
    .byte $00 ; |        | $FEC7
    .byte $00 ; |        | $FEC8
    .byte $00 ; |        | $FEC9
    .byte $00 ; |        | $FECA
    .byte $00 ; |        | $FECB
    .byte $00 ; |        | $FECC
    .byte $00 ; |        | $FECD
    .byte $00 ; |        | $FECE
    .byte $00 ; |        | $FECF
    .byte $01 ; |       X| $FED0
    .byte $02 ; |      X | $FED1
    .byte $04 ; |     X  | $FED2
    .byte $06 ; |     XX | $FED3
    .byte $08 ; |    X   | $FED4
    .byte $0A ; |    X X | $FED5
    .byte $0C ; |    XX  | $FED6
    .byte $0E ; |    XXX | $FED7
    .byte $0C ; |    XX  | $FED8
    .byte $0A ; |    X X | $FED9
    .byte $08 ; |    X   | $FEDA
    .byte $06 ; |     XX | $FEDB
    .byte $04 ; |     X  | $FEDC
    .byte $02 ; |      X | $FEDD
    .byte $01 ; |       X| $FEDE
    .byte $00 ; |        | $FEDF
    .byte $01 ; |       X| $FEE0
    .byte $03 ; |      XX| $FEE1
    .byte $05 ; |     X X| $FEE2
    .byte $07 ; |     XXX| $FEE3
    .byte $09 ; |    X  X| $FEE4
    .byte $0A ; |    X X | $FEE5
    .byte $0C ; |    XX  | $FEE6
    .byte $0D ; |    XX X| $FEE7
    .byte $0C ; |    XX  | $FEE8
    .byte $0A ; |    X X | $FEE9
    .byte $09 ; |    X  X| $FEEA
    .byte $07 ; |     XXX| $FEEB
    .byte $05 ; |     X X| $FEEC
    .byte $03 ; |      XX| $FEED
    .byte $01 ; |       X| $FEEE
    .byte $00 ; |        | $FEEF
    .byte $00 ; |        | $FEF0
    .byte $00 ; |        | $FEF1
    .byte $00 ; |        | $FEF2
    .byte $00 ; |        | $FEF3
    .byte $00 ; |        | $FEF4
    .byte $00 ; |        | $FEF5
    .byte $00 ; |        | $FEF6
    .byte $00 ; |        | $FEF7
    .byte $00 ; |        | $FEF8
    .byte $00 ; |        | $FEF9
    .byte $00 ; |        | $FEFA
    .byte $00 ; |        | $FEFB
    .byte $00 ; |        | $FEFC
    .byte $00 ; |        | $FEFD
    .byte $00 ; |        | $FEFE
    .byte $00 ; |        | $FEFF
    .byte $00 ; |        | $FF00
    .byte $00 ; |        | $FF01
    .byte $00 ; |        | $FF02
    .byte $00 ; |        | $FF03
    .byte $00 ; |        | $FF04
    .byte $00 ; |        | $FF05
    .byte $00 ; |        | $FF06
    .byte $00 ; |        | $FF07
    .byte $00 ; |        | $FF08
    .byte $E5 ; |XXX  X X| $FF09
    .byte $55 ; | X X X X| $FF0A
    .byte $57 ; | X X XXX| $FF0B
    .byte $55 ; | X X X X| $FF0C
    .byte $55 ; | X X X X| $FF0D
    .byte $52 ; | X X  X | $FF0E
    .byte $50 ; | X X    | $FF0F
    .byte $50 ; | X X    | $FF10
    .byte $E0 ; |XXX     | $FF11
    .byte $00 ; |        | $FF12
    .byte $25 ; |  X  X X| $FF13
    .byte $25 ; |  X  X X| $FF14
    .byte $27 ; |  X  XXX| $FF15
    .byte $25 ; |  X  X X| $FF16
    .byte $25 ; |  X  X X| $FF17
    .byte $72 ; | XXX  X | $FF18
    .byte $00 ; |        | $FF19
    .byte $00 ; |        | $FF1A
    .byte $00 ; |        | $FF1B
    .byte $00 ; |        | $FF1C
    .byte $00 ; |        | $FF1D
LFF1E:
    .byte $28 ; |  X X   | $FF1E
    .byte $31 ; |  XX   X| $FF1F
    .byte $3A ; |  XXX X | $FF20
    .byte $43 ; | X    XX| $FF21
    .byte $4C ; | X  XX  | $FF22
    .byte $55 ; | X X X X| $FF23
    .byte $5E ; | X XXXX | $FF24
    .byte $67 ; | XX  XXX| $FF25
    .byte $70 ; | XXX    | $FF26
    .byte $79 ; | XXXX  X| $FF27
    
    .byte $3C ; |  XXXX  | $FF28
    .byte $66 ; | XX  XX | $FF29
    .byte $66 ; | XX  XX | $FF2A
    .byte $66 ; | XX  XX | $FF2B
    .byte $66 ; | XX  XX | $FF2C
    .byte $66 ; | XX  XX | $FF2D
    .byte $66 ; | XX  XX | $FF2E
    .byte $66 ; | XX  XX | $FF2F
    .byte $3C ; |  XXXX  | $FF30
    .byte $3C ; |  XXXX  | $FF31
    .byte $18 ; |   XX   | $FF32
    .byte $18 ; |   XX   | $FF33
    .byte $18 ; |   XX   | $FF34
    .byte $18 ; |   XX   | $FF35
    .byte $18 ; |   XX   | $FF36
    .byte $18 ; |   XX   | $FF37
    .byte $38 ; |  XXX   | $FF38
    .byte $18 ; |   XX   | $FF39
    .byte $7E ; | XXXXXX | $FF3A
    .byte $60 ; | XX     | $FF3B
    .byte $60 ; | XX     | $FF3C
    .byte $60 ; | XX     | $FF3D
    .byte $3C ; |  XXXX  | $FF3E
    .byte $06 ; |     XX | $FF3F
    .byte $06 ; |     XX | $FF40
    .byte $46 ; | X   XX | $FF41
    .byte $3C ; |  XXXX  | $FF42
    .byte $3C ; |  XXXX  | $FF43
    .byte $46 ; | X   XX | $FF44
    .byte $06 ; |     XX | $FF45
    .byte $06 ; |     XX | $FF46
    .byte $0C ; |    XX  | $FF47
    .byte $18 ; |   XX   | $FF48
    .byte $0C ; |    XX  | $FF49
    .byte $46 ; | X   XX | $FF4A
    .byte $3C ; |  XXXX  | $FF4B
    .byte $0C ; |    XX  | $FF4C
    .byte $0C ; |    XX  | $FF4D
    .byte $7E ; | XXXXXX | $FF4E
    .byte $4C ; | X  XX  | $FF4F
    .byte $4C ; | X  XX  | $FF50
    .byte $2C ; |  X XX  | $FF51
    .byte $2C ; |  X XX  | $FF52
    .byte $1C ; |   XXX  | $FF53
    .byte $0C ; |    XX  | $FF54
    .byte $7C ; | XXXXX  | $FF55
    .byte $46 ; | X   XX | $FF56
    .byte $06 ; |     XX | $FF57
    .byte $06 ; |     XX | $FF58
    .byte $7C ; | XXXXX  | $FF59
    .byte $60 ; | XX     | $FF5A
    .byte $60 ; | XX     | $FF5B
    .byte $60 ; | XX     | $FF5C
    .byte $7E ; | XXXXXX | $FF5D
    .byte $3C ; |  XXXX  | $FF5E
    .byte $66 ; | XX  XX | $FF5F
    .byte $66 ; | XX  XX | $FF60
    .byte $66 ; | XX  XX | $FF61
    .byte $7C ; | XXXXX  | $FF62
    .byte $60 ; | XX     | $FF63
    .byte $60 ; | XX     | $FF64
    .byte $62 ; | XX   X | $FF65
    .byte $3C ; |  XXXX  | $FF66
    .byte $18 ; |   XX   | $FF67
    .byte $18 ; |   XX   | $FF68
    .byte $18 ; |   XX   | $FF69
    .byte $18 ; |   XX   | $FF6A
    .byte $0C ; |    XX  | $FF6B
    .byte $0C ; |    XX  | $FF6C
    .byte $06 ; |     XX | $FF6D
    .byte $42 ; | X    X | $FF6E
    .byte $7E ; | XXXXXX | $FF6F
    .byte $3C ; |  XXXX  | $FF70
    .byte $66 ; | XX  XX | $FF71
    .byte $66 ; | XX  XX | $FF72
    .byte $66 ; | XX  XX | $FF73
    .byte $3C ; |  XXXX  | $FF74
    .byte $66 ; | XX  XX | $FF75
    .byte $66 ; | XX  XX | $FF76
    .byte $66 ; | XX  XX | $FF77
    .byte $3C ; |  XXXX  | $FF78
    .byte $3C ; |  XXXX  | $FF79
    .byte $46 ; | X   XX | $FF7A
    .byte $06 ; |     XX | $FF7B
    .byte $06 ; |     XX | $FF7C
    .byte $3E ; |  XXXXX | $FF7D
    .byte $66 ; | XX  XX | $FF7E
    .byte $66 ; | XX  XX | $FF7F
    .byte $66 ; | XX  XX | $FF80
    .byte $3C ; |  XXXX  | $FF81
LFF82:
    .byte $01 ; |       X| $FF82
    .byte $01 ; |       X| $FF83
    .byte $03 ; |      XX| $FF84
    .byte $03 ; |      XX| $FF85
    .byte $07 ; |     XXX| $FF86
    .byte $07 ; |     XXX| $FF87
    .byte $0F ; |    XXXX| $FF88
    .byte $0F ; |    XXXX| $FF89
LFF8A:
    .byte $80 ; |X       | $FF8A
    .byte $C0 ; |XX      | $FF8B
    .byte $E0 ; |XXX     | $FF8C
    .byte $F0 ; |XXXX    | $FF8D
    .byte $F8 ; |XXXXX   | $FF8E
    .byte $FC ; |XXXXXX  | $FF8F
    .byte $FE ; |XXXXXXX | $FF90
    .byte $FF ; |XXXXXXXX| $FF91
LFF92:
    .byte $00 ; |        | $FF92
    .byte $5C ; | X XXX  | $FF93
    .byte $3E ; |  XXXXX | $FF94
    .byte $7F ; | XXXXXXX| $FF95
    .byte $3E ; |  XXXXX | $FF96
    .byte $5C ; | X XXX  | $FF97
    .byte $00 ; |        | $FF98
LFF99:
    .byte $00 ; |        | $FF99
    .byte $31 ; |  XX   X| $FF9A
    .byte $7A ; | XXXX X | $FF9B
    .byte $DE ; |XX XXXX | $FF9C
    .byte $FE ; |XXXXXXX | $FF9D
    .byte $7A ; | XXXX X | $FF9E
    .byte $31 ; |  XX   X| $FF9F
    .byte $00 ; |        | $FFA0
    .byte $00 ; |        | $FFA1
    .byte $09 ; |    X  X| $FFA2
    .byte $09 ; |    X  X| $FFA3
    .byte $09 ; |    X  X| $FFA4
    .byte $09 ; |    X  X| $FFA5
    .byte $0F ; |    XXXX| $FFA6
    .byte $09 ; |    X  X| $FFA7
    .byte $09 ; |    X  X| $FFA8
    .byte $09 ; |    X  X| $FFA9
    .byte $06 ; |     XX | $FFAA
    .byte $00 ; |        | $FFAB
    .byte $17 ; |   X XXX| $FFAC
    .byte $74 ; | XXX X  | $FFAD
    .byte $54 ; | X X X  | $FFAE
    .byte $77 ; | XXX XXX| $FFAF
    .byte $44 ; | X   X  | $FFB0
    .byte $77 ; | XXX XXX| $FFB1
    .byte $00 ; |        | $FFB2
    .byte $00 ; |        | $FFB3
    .byte $00 ; |        | $FFB4
    .byte $00 ; |        | $FFB5
LFFB6:
    .byte $00 ; |        | $FFB6
    .byte $00 ; |        | $FFB7
    .byte $00 ; |        | $FFB8
    .byte $00 ; |        | $FFB9
    .byte $00 ; |        | $FFBA
    .byte $00 ; |        | $FFBB
    .byte $00 ; |        | $FFBC
    .byte $00 ; |        | $FFBD
    .byte $88 ; |X   X   | $FFBE
    .byte $88 ; |X   X   | $FFBF
    .byte $88 ; |X   X   | $FFC0
    .byte $F8 ; |XXXXX   | $FFC1
    .byte $88 ; |X   X   | $FFC2
    .byte $88 ; |X   X   | $FFC3
    .byte $88 ; |X   X   | $FFC4
    .byte $00 ; |        | $FFC5
    .byte $00 ; |        | $FFC6
    .byte $00 ; |        | $FFC7
    .byte $00 ; |        | $FFC8
    .byte $00 ; |        | $FFC9
    .byte $00 ; |        | $FFCA
    .byte $00 ; |        | $FFCB
    .byte $00 ; |        | $FFCC
    .byte $00 ; |        | $FFCD
    .byte $00 ; |        | $FFCE
    .byte $00 ; |        | $FFCF
    .byte $00 ; |        | $FFD0
    .byte $00 ; |        | $FFD1
    .byte $00 ; |        | $FFD2
    .byte $00 ; |        | $FFD3
    .byte $00 ; |        | $FFD4
    .byte $00 ; |        | $FFD5
    .byte $00 ; |        | $FFD6
    .byte $00 ; |        | $FFD7
    .byte $00 ; |        | $FFD8
    .byte $00 ; |        | $FFD9
    .byte $00 ; |        | $FFDA
    .byte $00 ; |        | $FFDB
    .byte $3C ; |  XXXX  | $FFDC
    .byte $BD ; |X XXXX X| $FFDD
    .byte $99 ; |X  XX  X| $FFDE
    .byte $7E ; | XXXXXX | $FFDF
    .byte $3C ; |  XXXX  | $FFE0
    .byte $3C ; |  XXXX  | $FFE1
    .byte $24 ; |  X  X  | $FFE2
    .byte $24 ; |  X  X  | $FFE3
    .byte $00 ; |        | $FFE4
    .byte $00 ; |        | $FFE5
    .byte $00 ; |        | $FFE6
    .byte $00 ; |        | $FFE7
    .byte $00 ; |        | $FFE8
    .byte $00 ; |        | $FFE9
    .byte $00 ; |        | $FFEA
    .byte $00 ; |        | $FFEB
    .byte $00 ; |        | $FFEC
    .byte $00 ; |        | $FFED
    .byte $00 ; |        | $FFEE
    .byte $00 ; |        | $FFEF
    .byte $00 ; |        | $FFF0
    .byte $00 ; |        | $FFF1
    .byte $00 ; |        | $FFF2
    .byte $00 ; |        | $FFF3
    .byte $00 ; |        | $FFF4
    .byte $00 ; |        | $FFF5
    .byte $00 ; |        | $FFF6
    .byte $00 ; |        | $FFF7
    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9
    
    .byte $00 ; |        | $FFFA
    .byte $F0 ; |XXXX    | $FFFB
    .byte $00 ; |        | $FFFC
    .byte $F0 ; |XXXX    | $FFFD
    .byte $00 ; |        | $FFFE
    .byte $00 ; |        | $FFFF
