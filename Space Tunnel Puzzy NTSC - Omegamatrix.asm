; Disassembly of ST_PuzN.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcST_PuzN.cfg ST_PuzN.bin 
;
; ST_PuzN.cfg contents:
;
;      ORG F000
;      CODE F000 F6CA
;      GFX F6CB F6CD
;      CODE F6CE F92B
;      GFX F92C F9CB
;      DATA F9CC F9FF
;      GFX FA00 FA0F
;      DATA FA11 FA3F
;      GFX FA40 FA8F
;      DATA FA90 FACF
;      GFX FAD0 FBED
;      DATA FBEE FBFE
;      DATA FBFF FC81
;      GFX FC82 FCB4
;      GFX FCB5 FFFF

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
LF500   =   $F500
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
    LDA    #$1E            ; 2
    STA    $D3             ; 3
    LDA    LFB9A           ; 4
    STA    $DD             ; 3
    LDA    #$6A            ; 2
    STA    $DC             ; 3
LF04F:
    JSR    LF7E1           ; 6
    LDA    #$00            ; 2
    STA    COLUBK          ; 3
    JSR    LF812           ; 6
    JSR    LF649           ; 6
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
    JSR    LF7B7           ; 6
    LDA    $B5             ; 3
    LDX    #$01            ; 2
    JSR    LF7B7           ; 6
    LDA    $A1             ; 3
    LDX    #$02            ; 2
    JSR    LF7B7           ; 6
    LDA    $A2             ; 3
    LDX    #$03            ; 2
    JSR    LF7B7           ; 6
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
LF0B8:
    LDY    #$00            ; 2
    CMP    $C6             ; 3
    BNE    LF0C0           ; 2
    LDY    #$02            ; 2
LF0C0:
    STY    ENAM0           ; 3
    CMP    $91             ; 3
    BNE    LF0C8           ; 2
    STX    $B0             ; 3
LF0C8:
    LDY    $B0             ; 3
    BEQ    LF0CE           ; 2
    DEC    $B0             ; 5
LF0CE:
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
    BNE    LF0E7           ; 2
    LDY    #$02            ; 2
LF0E7:
    STY    ENAM1           ; 3
    CMP    $B6             ; 3
    BNE    LF0EF           ; 2
    STX    $B1             ; 3
LF0EF:
    LDY    $B1             ; 3
    BEQ    LF0F5           ; 2
    DEC    $B1             ; 5
LF0F5:
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
    BCS    LF0B8           ; 2
LF112:
    DEC    $A8             ; 5
    LDY    #$00            ; 2
    LDA    $A8             ; 3
    CMP    $CD             ; 3
    BNE    LF11E           ; 2
    LDY    #$02            ; 2
LF11E:
    STY    ENAM1           ; 3
    LDX    #$03            ; 2
    JSR    LF789           ; 6
    LDA    $A8             ; 3
    CMP    #$2E            ; 2
    BCS    LF112           ; 2
    JSR    LF8D8           ; 6
    SEC                    ; 2
    LDA    $A8             ; 3
    SBC    #$0A            ; 2
    STA    $A8             ; 3
LF135:
    STA    WSYNC           ; 3
    DEC    $A8             ; 5
    LDA    $A8             ; 3
    CMP    #$15            ; 2
    BCS    LF135           ; 2
    LDA    #$09            ; 2
    STA    TIM64T          ; 4
    JSR    LF730           ; 6
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
    LDA    LF950,Y         ; 4
    STA    $C5             ; 3
    CLC                    ; 2
    LDA    $B3             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LF954,Y         ; 4
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
    JSR    LF686           ; 6
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
    JSR    LF7FF           ; 6
    LDA    #$26            ; 2
    STA    TIM64T          ; 4
    LDA    SWCHB           ; 4
    LSR                    ; 2
    BCS    LF2D8           ; 2
    LDA    #$FF            ; 2
    STA    $94             ; 3
    LDA    #$10            ; 2
    STA    $8C             ; 3
    STA    $8B             ; 3
    STA    $86             ; 3
    LDA    #$00            ; 2
    STA    $88             ; 3
    STA    $89             ; 3
LF2CF:
    LDA    SWCHB           ; 4
    LSR                    ; 2
    BCC    LF2CF           ; 2
    JMP    LF025           ; 3
LF2D8:
    LSR                    ; 2
    BCS    LF31C           ; 2
    LDA    #$00            ; 2
    STA    $86             ; 3
    JSR    LF686           ; 6
    INC    $87             ; 5
    LDA    $87             ; 3
    CMP    #$04            ; 2
    BNE    LF2EE           ; 2
    LDA    #$00            ; 2
    STA    $87             ; 3
LF2EE:
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
    BCS    LF30A           ; 2
    LDY    #$03            ; 2
LF30A:
    STY    $8F             ; 3
    LDA    #$60            ; 2
    STA    $8C             ; 3
    STA    $8B             ; 3
LF312:
    LDA    SWCHB           ; 4
    LSR                    ; 2
    LSR                    ; 2
    BCC    LF312           ; 2
    JMP    LF025           ; 3
LF31C:
    LDY    #$FF            ; 2
    LSR                    ; 2
    LSR                    ; 2
    BCS    LF324           ; 2
    LDY    #$0F            ; 2
LF324:
    STY    $A5             ; 3
    LDY    #$15            ; 2
    LDA    SWCHB           ; 4
    ASL                    ; 2
    ASL                    ; 2
    BCS    LF331           ; 2
    LDY    #$10            ; 2
LF331:
    STY    $E2             ; 3
    LDA    $94             ; 3
    BEQ    LF344           ; 2
    LDA    #$07            ; 2
    STA    $86             ; 3
    JSR    LF686           ; 6
    LDA    #$00            ; 2
    STA    $86             ; 3
    BEQ    LF347           ; 2
LF344:
    JSR    LF686           ; 6
LF347:
    LDA    $8C             ; 3
    BEQ    LF366           ; 2
    CMP    #$10            ; 2
    BEQ    LF353           ; 2
    DEC    $8C             ; 5
    BNE    LF38E           ; 2
LF353:
    LDA    REFP1           ; 3
    ASL                    ; 2
    BCS    LF38E           ; 2
    LDA    $86             ; 3
    BEQ    LF38E           ; 2
    DEC    $86             ; 5
    BEQ    LF38E           ; 2
    LDA    #$00            ; 2
    STA    $8C             ; 3
    BNE    LF38E           ; 2
LF366:
    LDA    $C9             ; 3
    BNE    LF38E           ; 2
    LDA    REFP1           ; 3
    ASL                    ; 2
    BCS    LF38E           ; 2
    LDY    #$04            ; 2
    LDA    $E2             ; 3
    AND    #$0F            ; 2
    BEQ    LF379           ; 2
    LDY    #$08            ; 2
LF379:
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
LF38E:
    LDA    $86             ; 3
    BEQ    LF3B8           ; 2
    LDA    $8C             ; 3
    BNE    LF3B8           ; 2
    LDA    WSYNC           ; 3
    ASL                    ; 2
    BCS    LF3A9           ; 2
    LDA    VBLANK          ; 3
    ASL                    ; 2
    BCS    LF3A9           ; 2
    LDA    $8B             ; 3
    BNE    LF3B8           ; 2
    LDA    COLUP1          ; 3
    ASL                    ; 2
    BCC    LF3B8           ; 2
LF3A9:
    LDA    #$50            ; 2
    STA    $8C             ; 3
    LDA    #$D0            ; 2
    STA    $AC             ; 3
    LDA    #$F5            ; 2
    STA    $CD             ; 3
    JMP    LF3CD           ; 3
LF3B8:
    LDA    $8C             ; 3
    BNE    LF3F6           ; 2
    LDA    $8B             ; 3
    BEQ    LF3C8           ; 2
    CMP    #$10            ; 2
    BEQ    LF3F2           ; 2
    DEC    $8B             ; 5
    BNE    LF3F6           ; 2
LF3C8:
    LDA    VSYNC           ; 3
    ASL                    ; 2
    BCS    LF3D2           ; 2
LF3CD:
    LDA    COLUP1          ; 3
    ASL                    ; 2
    BCC    LF3F6           ; 2
LF3D2:
    JSR    LF878           ; 6
    JSR    LF73F           ; 6
    LDA    $C5             ; 3
    BNE    LF3F6           ; 2
    INC    $E5             ; 5
    LDA    $E5             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LF95C,Y         ; 4
    STA    $8D             ; 3
    LDA    #$08            ; 2
    STA    $CA             ; 3
    LDA    #$30            ; 2
    STA    $8B             ; 3
    BNE    LF3F6           ; 2
LF3F2:
    LDA    #$00            ; 2
    STA    $CA             ; 3
LF3F6:
    INC    $B3             ; 5
    LDA    $8C             ; 3
    BNE    LF449           ; 2
    INC    $A9             ; 5
    LDA    $8F             ; 3
    LSR                    ; 2
    AND    $A9             ; 3
    BNE    LF449           ; 2
    LDA    $8E             ; 3
    LSR                    ; 2
    BCS    LF42A           ; 2
    DEC    $A6             ; 5
    DEC    $A6             ; 5
    INC    $A4             ; 5
    LDA    $A4             ; 3
    AND    #$07            ; 2
    STA    $AA             ; 3
    BNE    LF427           ; 2
    SED                    ; 2
    SEC                    ; 2
    LDA    $D9             ; 3
    SBC    #$10            ; 2
    STA    $D9             ; 3
    LDA    $D8             ; 3
    SBC    #$00            ; 2
    STA    $D8             ; 3
    CLD                    ; 2
LF427:
    JMP    LF449           ; 3
LF42A:
    INC    $A6             ; 5
    INC    $A6             ; 5
    DEC    $A4             ; 5
    LDA    $A4             ; 3
    AND    #$07            ; 2
    STA    $AA             ; 3
    CMP    #$07            ; 2
    BNE    LF449           ; 2
    SED                    ; 2
    CLC                    ; 2
    LDA    $D9             ; 3
    ADC    #$10            ; 2
    STA    $D9             ; 3
    LDA    $D8             ; 3
    ADC    #$00            ; 2
    STA    $D8             ; 3
    CLD                    ; 2
LF449:
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
    BNE    LF495           ; 2
    LDY    $8E             ; 3
    LDX    $90             ; 3
    LDA    SWCHA           ; 4
    ASL                    ; 2
    BCS    LF476           ; 2
    CPX    #$90            ; 2
    BCS    LF476           ; 2
    INX                    ; 2
    INX                    ; 2
    TYA                    ; 2
    AND    #$03            ; 2
    ORA    #$08            ; 2
    TAY                    ; 2
    BNE    LF491           ; 2
LF476:
    ASL                    ; 2
    BCS    LF487           ; 2
    CPX    #$08            ; 2
    BCC    LF487           ; 2
    DEX                    ; 2
    DEX                    ; 2
    TYA                    ; 2
    AND    #$03            ; 2
    ORA    #$04            ; 2
    TAY                    ; 2
    BNE    LF491           ; 2
LF487:
    ASL                    ; 2
    BCS    LF48C           ; 2
    LDY    #$00            ; 2
LF48C:
    ASL                    ; 2
    BCS    LF491           ; 2
    LDY    #$01            ; 2
LF491:
    STY    $8E             ; 3
    STX    $90             ; 3
LF495:
    LDA    $C9             ; 3
    BEQ    LF4E7           ; 2
    CMP    #$40            ; 2
    BEQ    LF49F           ; 2
    DEC    $C9             ; 5
LF49F:
    LDX    $A1             ; 3
    LDY    $C6             ; 3
    LDA    $C7             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    BCC    LF4B4           ; 2
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    CPX    #$18            ; 2
    BCS    LF4D9           ; 2
    BCC    LF4DF           ; 2
LF4B4:
    LSR                    ; 2
    BCC    LF4C1           ; 2
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    INX                    ; 2
    CPX    #$80            ; 2
    BCC    LF4D9           ; 2
    BCS    LF4DF           ; 2
LF4C1:
    LDA    $C7             ; 3
    LSR                    ; 2
    BCC    LF4D1           ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    CPY    #$D0            ; 2
    BCC    LF4D9           ; 2
    JMP    LF4DF           ; 3
LF4D1:
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    CPY    #$68            ; 2
    BCC    LF4DF           ; 2
LF4D9:
    STX    $A1             ; 3
    STY    $C6             ; 3
    BNE    LF4E7           ; 2
LF4DF:
    LDA    #$00            ; 2
    STA    $A1             ; 3
    STA    $C6             ; 3
    STA    $C9             ; 3
LF4E7:
    LDA    $8C             ; 3
    BEQ    LF4EE           ; 2
    JMP    LF553           ; 3
LF4EE:
    LDA    $8B             ; 3
    BEQ    LF514           ; 2
    LDY    $B6             ; 3
    LDA    $8E             ; 3
    LSR                    ; 2
    BCS    LF507           ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    CPY    #$F0            ; 2
    BCC    LF512           ; 2
    JSR    LF6EA           ; 6
    JMP    LF512           ; 3
LF507:
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    CPY    #$11            ; 2
    BCS    LF512           ; 2
    JSR    LF6EA           ; 6
LF512:
    STY    $B6             ; 3
LF514:
    LDA    $8B             ; 3
    BNE    LF553           ; 2
    INC    $CF             ; 5
    LDA    $CF             ; 3
    AND    $8F             ; 3
    BNE    LF553           ; 2
    INC    $D0             ; 5
    LDA    $D0             ; 3
    AND    #$0F            ; 2
    BNE    LF52A           ; 2
    INC    $D4             ; 5
LF52A:
    LDA    $D4             ; 3
    AND    #$1F            ; 2
    TAY                    ; 2
    LDA    LF964,Y         ; 4
    STA    $C5             ; 3
    LDA    LF984,Y         ; 4
    STA    $C8             ; 3
    LDY.w  $00B5           ; 4
    CPY    $C5             ; 3
    BCS    LF542           ; 2
    INY                    ; 2
    INY                    ; 2
LF542:
    DEY                    ; 2
    STY    $B5             ; 3
    LDY    $B6             ; 3
    CPY    $C8             ; 3
    BCS    LF54F           ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
LF54F:
    DEY                    ; 2
    DEY                    ; 2
    STY    $B6             ; 3
LF553:
    DEC    $D6             ; 5
    BEQ    LF55A           ; 2
    JMP    LF5DE           ; 3
LF55A:
    JSR    LF6CE           ; 6
    LDY    $CD             ; 3
    CPY    #$E0            ; 2
    BCS    LF59F           ; 2
    CPY    #$08            ; 2
    BCC    LF59F           ; 2
    LDA    NUSIZ1          ; 3
    ASL                    ; 2
    BCS    LF5CA           ; 2
    LDA.w  $00A2           ; 4
    LDX.w  $00CB           ; 4
    BNE    LF579           ; 2
    CLC                    ; 2
    ADC    $8A             ; 3
    BNE    LF57E           ; 2
LF579:
    SEC                    ; 2
    LDA    $A2             ; 3
    SBC    $8A             ; 3
LF57E:
    STA    $A2             ; 3
    SEC                    ; 2
    LDA    #$07            ; 2
    SBC    $8A             ; 3
    AND    #$FE            ; 2
    STA    $C5             ; 3
    LDA    $D7             ; 3
    BEQ    LF596           ; 2
    SEC                    ; 2
    LDA    $CD             ; 3
    SBC    $C5             ; 3
    STA    $CD             ; 3
    BNE    LF5DE           ; 2
LF596:
    LDA    $C5             ; 3
    CLC                    ; 2
    ADC    $CD             ; 3
    STA    $CD             ; 3
    BNE    LF5DE           ; 2
LF59F:
    LDA    $8B             ; 3
    ORA    $8C             ; 3
    BNE    LF5DE           ; 2
    LDY    #$01            ; 2
    LDA    $B6             ; 3
    CMP    $91             ; 3
    BCS    LF5AF           ; 2
    LDY    #$00            ; 2
LF5AF:
    STY    $D7             ; 3
    LDX    $B5             ; 3
    STX    $A2             ; 3
    LDY    $B6             ; 3
    STY    $CD             ; 3
    JSR    LF6CE           ; 6
    LDA    $D1             ; 3
    ADC    $D2             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LF9A4,Y         ; 4
    STA    $8A             ; 3
    BNE    LF5DE           ; 2
LF5CA:
    LDA.w  $00CB           ; 4
    EOR    #$01            ; 2
    STA    $CB             ; 3
    LDA    $A2             ; 3
    CMP    #$40            ; 2
    BCS    LF5D9           ; 2
    ADC    #$08            ; 2
LF5D9:
    SEC                    ; 2
    SBC    #$04            ; 2
    STA    $A2             ; 3
LF5DE:
    LDA    $8C             ; 3
    BNE    LF5ED           ; 2
    LDY    #$E0            ; 2
    LDA    $8E             ; 3
    LSR                    ; 2
    BCS    LF5EB           ; 2
    LDY    #$F0            ; 2
LF5EB:
    STY    $AC             ; 3
LF5ED:
    LDX    #$01            ; 2
    SED                    ; 2
    SEC                    ; 2
LF5F1:
    LDA    #$00            ; 2
    ADC    $D1,X           ; 4
    STA    $D1,X           ; 4
    DEX                    ; 2
    BPL    LF5F1           ; 2
    CLD                    ; 2
    JSR    LF890           ; 6
    JSR    LF607           ; 6
    JSR    LF629           ; 6
    JMP    LF04F           ; 3
LF607:
    LDA    $89             ; 3
    AND    #$F0            ; 2
    CMP    $E6             ; 3
    BNE    LF628           ; 2
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
LF628:
    RTS                    ; 6

LF629:
    LDA    $88             ; 3
    AND    #$0F            ; 2
    CMP    $DA             ; 3
    BEQ    LF648           ; 2
    STA    $DA             ; 3
    INC    $E3             ; 5
    LDA    $86             ; 3
    CMP    #$06            ; 2
    BEQ    LF63D           ; 2
    INC    $86             ; 5
LF63D:
    LDA    #$F0            ; 2
    STA    $D5             ; 3
    CLC                    ; 2
    LDA    $DC             ; 3
    ADC    #$40            ; 2
    STA    $DC             ; 3
LF648:
    RTS                    ; 6

LF649:
    LDA    #$20            ; 2
    LDX    #$00            ; 2
    JSR    LF7B7           ; 6
    LDA    #$50            ; 2
    LDX    #$01            ; 2
    JSR    LF7B7           ; 6
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
LF66F:
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
    BPL    LF66F           ; 2
    RTS                    ; 6

LF686:
    LDA    #$FA            ; 2
    STA    $83             ; 3
    STA    $85             ; 3
    LDY    $86             ; 3
    BEQ    LF699           ; 2
    DEY                    ; 2
    CPY    #$04            ; 2
    BCS    LF6B7           ; 2
    CPY    #$01            ; 2
    BCS    LF6A5           ; 2
LF699:
    LDA    #$00            ; 2
    STA    $80             ; 3
    STA    $81             ; 3
    STA    $82             ; 3
    STA    $84             ; 3
    BEQ    LF6CA           ; 2
LF6A5:
    LDA    #$00            ; 2
    STA    $84             ; 3
    STA    $81             ; 3
    DEY                    ; 2
    LDA    LF6CB,Y         ; 4
    STA    $80             ; 3
    LDA    #$F0            ; 2
    STA    $82             ; 3
    BNE    LF6CA           ; 2
LF6B7:
    LDA    #$03            ; 2
    STA    $80             ; 3
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    LDA    LF6CB,Y         ; 4
    STA    $81             ; 3
    LDA    #$F0            ; 2
    STA    $82             ; 3
    STA    $84             ; 3
LF6CA:
    RTS                    ; 6

LF6CB:
    .byte $00 ; |        | $F6CB
    .byte $01 ; |       X| $F6CC
    .byte $03 ; |      XX| $F6CD
LF6CE:
    LDA    $87             ; 3
    LSR                    ; 2
    BCC    LF6D8           ; 2
    LDA    $89             ; 3
    JMP    LF6DE           ; 3
LF6D8:
    LDA    $89             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
LF6DE:
    AND    #$0F            ; 2
    CLC                    ; 2
    ADC    $DA             ; 3
    TAY                    ; 2
    LDA    LF9BC,Y         ; 4
    STA    $D6             ; 3
    RTS                    ; 6

LF6EA:
    CLC                    ; 2
    LDA    $CC             ; 3
    ADC    #$08            ; 2
    CMP    #$90            ; 2
    BCC    LF6F5           ; 2
    LDA    #$40            ; 2
LF6F5:
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
    BCC    LF716           ; 2
    LDA    #$05            ; 2
LF716:
    CLC                    ; 2
    AND    #$07            ; 2
    TAY                    ; 2
    STA    $E1             ; 3
    ADC    #$20            ; 2
    STA    $B4             ; 3
    LDA    LF9AC,Y         ; 4
    STA    $D3             ; 3
    LDA    $D2             ; 3
    LSR                    ; 2
    BCS    LF72D           ; 2
    LDY    #$13            ; 2
    RTS                    ; 6

LF72D:
    LDY    #$EF            ; 2
    RTS                    ; 6

LF730:
    LDA    #$00            ; 2
    STA    AUDC0           ; 3
    STA    AUDC1           ; 3
    STA    AUDF0           ; 3
    STA    AUDF1           ; 3
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    RTS                    ; 6

LF73F:
    LDA    $B4             ; 3
    AND    #$0F            ; 2
    CMP    #$00            ; 2
    BEQ    LF784           ; 2
    CMP    #$05            ; 2
    BEQ    LF784           ; 2
    CMP    #$07            ; 2
    BEQ    LF784           ; 2
    STA    $C5             ; 3
    LDA    $B5             ; 3
    CLC                    ; 2
    ADC    #$0B            ; 2
    CMP    $A1             ; 3
    BCC    LF771           ; 2
    LDA    $C5             ; 3
    LSR                    ; 2
    BCC    LF763           ; 2
    LDA    #$10            ; 2
    BNE    LF76C           ; 2
LF763:
    LSR                    ; 2
    BCC    LF76A           ; 2
    LDA    #$20            ; 2
    BNE    LF76C           ; 2
LF76A:
    LDA    #$40            ; 2
LF76C:
    CLC                    ; 2
    ADC    $B5             ; 3
    STA    $B5             ; 3
LF771:
    LDA    $C5             ; 3
    LSR                    ; 2
    AND    $C5             ; 3
    TAY                    ; 2
    CLC                    ; 2
    ADC    #$20            ; 2
    STA    $B4             ; 3
    STA    $C5             ; 3
    LDA    LF9AC,Y         ; 4
    STA    $D3             ; 3
    RTS                    ; 6

LF784:
    LDA    #$00            ; 2
    STA    $C5             ; 3
    RTS                    ; 6

LF789:
    LDA    $A8             ; 3
    STA    WSYNC           ; 3
    CMP    $B6             ; 3
    BNE    LF795           ; 2
    LDA    #$07            ; 2
    STA    $B1             ; 3
LF795:
    LDY    $B1             ; 3
    BEQ    LF79B           ; 2
    DEC    $B1             ; 5
LF79B:
    LDA    LFBE6,Y         ; 4
    ORA    $8D             ; 3
    AND    $A5             ; 3
    STA    COLUP1          ; 3
    LDA    ($AE),Y         ; 5
    STA    GRP1            ; 3
    JSR    LF7AE           ; 6
    DEC    $A8             ; 5
    RTS                    ; 6

LF7AE:
    STA    WSYNC           ; 3
    LDY    $A8             ; 3
    LDA    ($A6),Y         ; 5
    STA    PF0             ; 3
    RTS                    ; 6

LF7B7:
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
    BCC    LF7D1           ; 2
    SBC    #$0F            ; 2
    INY                    ; 2
LF7D1:
    EOR    #$07            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    HMP0,X          ; 4
    STA    WSYNC           ; 3
LF7DB:
    DEY                    ; 2
    BPL    LF7DB           ; 2
    STA    RESP0,X         ; 4
    RTS                    ; 6

LF7E1:
    LDA    INTIM           ; 4
    BNE    LF7E1           ; 2
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

LF7FF:
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

LF812:
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    STA    PF0             ; 3
    LDA    #$38            ; 2
    LDX    #$00            ; 2
    JSR    LF7B7           ; 6
    LDA    #$40            ; 2
    LDX    #$01            ; 2
    JSR    LF7B7           ; 6
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
LF848:
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
    BPL    LF848           ; 2
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    RTS                    ; 6

LF878:
    LDA    $B4             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LF9B4,Y         ; 4
    CLC                    ; 2
    LDX    #$01            ; 2
    SED                    ; 2
LF884:
    ADC.wx $0088,X         ; 4
    STA    $88,X           ; 4
    LDA    #$00            ; 2
    DEX                    ; 2
    BPL    LF884           ; 2
    CLD                    ; 2
    RTS                    ; 6

LF890:
    LDA    $88             ; 3
    STA    $B8             ; 3
    LDA    $89             ; 3
    STA    $B9             ; 3
    LDX    #$01            ; 2
    LDY    #$04            ; 2
LF89C:
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
    BPL    LF89C           ; 2
    LDA    #$FB            ; 2
    STA    $93             ; 3
    LDX    #$00            ; 2
LF8C7:
    LDA    $BB,X           ; 4
    CMP    #$08            ; 2
    BNE    LF8D7           ; 2
    LDA    #$00            ; 2
    STA    $BB,X           ; 4
    INX                    ; 2
    INX                    ; 2
    CMP    #$08            ; 2
    BNE    LF8C7           ; 2
LF8D7:
    RTS                    ; 6

LF8D8:
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    STA    PF0             ; 3
    LDA    #$20            ; 2
    LDX    #$00            ; 2
    JSR    LF7B7           ; 6
    LDA    #$28            ; 2
    LDX    #$01            ; 2
    JSR    LF7B7           ; 6
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
LF90A:
    STA    WSYNC           ; 3
    LDA    LF92C,X         ; 4
    STA    GRP0            ; 3
    LDA    LF935,X         ; 4
    STA    GRP1            ; 3
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    LDA    LF947,X         ; 4
    TAY                    ; 2
    LDA    LF93E,X         ; 4
    STA    GRP0            ; 3
    STY    GRP1            ; 3
    STA    HMCLR           ; 3
    DEX                    ; 2
    BPL    LF90A           ; 2
    RTS                    ; 6

LF92C:
    .byte $00 ; |        | $F92C
    .byte $38 ; |  XXX   | $F92D
    .byte $38 ; |  XXX   | $F92E
    .byte $3E ; |  XXXXX | $F92F
    .byte $3E ; |  XXXXX | $F930
    .byte $3A ; |  XXX X | $F931
    .byte $7A ; | XXXX X | $F932
    .byte $7E ; | XXXXXX | $F933
    .byte $7E ; | XXXXXX | $F934
LF935:
    .byte $00 ; |        | $F935
    .byte $FB ; |XXXXX XX| $F936
    .byte $FB ; |XXXXX XX| $F937
    .byte $FB ; |XXXXX XX| $F938
    .byte $E9 ; |XXX X  X| $F939
    .byte $E8 ; |XXX X   | $F93A
    .byte $E8 ; |XXX X   | $F93B
    .byte $EB ; |XXX X XX| $F93C
    .byte $EB ; |XXX X XX| $F93D
LF93E:
    .byte $00 ; |        | $F93E
    .byte $EF ; |XXX XXXX| $F93F
    .byte $EF ; |XXX XXXX| $F940
    .byte $EF ; |XXX XXXX| $F941
    .byte $04 ; |     X  | $F942
    .byte $82 ; |X     X | $F943
    .byte $41 ; | X     X| $F944
    .byte $EF ; |XXX XXXX| $F945
    .byte $EF ; |XXX XXXX| $F946
LF947:
    .byte $00 ; |        | $F947
    .byte $8C ; |X   XX  | $F948
    .byte $8C ; |X   XX  | $F949
    .byte $BC ; |X XXXX  | $F94A
    .byte $3E ; |  XXXXX | $F94B
    .byte $3A ; |  XXX X | $F94C
    .byte $3A ; |  XXX X | $F94D
    .byte $BA ; |X XXX X | $F94E
    .byte $BA ; |X XXX X | $F94F
LF950:
    .byte $0C ; |    XX  | $F950
    .byte $07 ; |     XXX| $F951
    .byte $04 ; |     X  | $F952
    .byte $01 ; |       X| $F953
LF954:
    .byte $00 ; |        | $F954
    .byte $01 ; |       X| $F955
    .byte $02 ; |      X | $F956
    .byte $03 ; |      XX| $F957
    .byte $04 ; |     X  | $F958
    .byte $03 ; |      XX| $F959
    .byte $02 ; |      X | $F95A
    .byte $01 ; |       X| $F95B
LF95C:
    .byte $38 ; |  XXX   | $F95C
    .byte $18 ; |   XX   | $F95D
    .byte $0E ; |    XXX | $F95E
    .byte $2E ; |  X XXX | $F95F
    .byte $5A ; | X XX X | $F960
    .byte $4C ; | X  XX  | $F961
    .byte $8A ; |X   X X | $F962
    .byte $AA ; |X X X X | $F963
LF964:
    .byte $6A ; | XX X X | $F964
    .byte $48 ; | X  X   | $F965
    .byte $34 ; |  XX X  | $F966
    .byte $16 ; |   X XX | $F967
    .byte $08 ; |    X   | $F968
    .byte $06 ; |     XX | $F969
    .byte $5D ; | X XXX X| $F96A
    .byte $74 ; | XXX X  | $F96B
    .byte $82 ; |X     X | $F96C
    .byte $6C ; | XX XX  | $F96D
    .byte $4F ; | X  XXXX| $F96E
    .byte $3D ; |  XXXX X| $F96F
    .byte $38 ; |  XXX   | $F970
    .byte $48 ; | X  X   | $F971
    .byte $5A ; | X XX X | $F972
    .byte $32 ; |  XX  X | $F973
    .byte $36 ; |  XX XX | $F974
    .byte $1A ; |   XX X | $F975
    .byte $05 ; |     X X| $F976
    .byte $24 ; |  X  X  | $F977
    .byte $12 ; |   X  X | $F978
    .byte $44 ; | X   X  | $F979
    .byte $64 ; | XX  X  | $F97A
    .byte $5A ; | X XX X | $F97B
    .byte $7C ; | XXXXX  | $F97C
    .byte $6A ; | XX X X | $F97D
    .byte $86 ; |X    XX | $F97E
    .byte $3F ; |  XXXXXX| $F97F
    .byte $93 ; |X  X  XX| $F980
    .byte $6A ; | XX X X | $F981
    .byte $5F ; | X XXXXX| $F982
    .byte $44 ; | X   X  | $F983
LF984:
    .byte $1A ; |   XX X | $F984
    .byte $24 ; |  X  X  | $F985
    .byte $42 ; | X    X | $F986
    .byte $74 ; | XXX X  | $F987
    .byte $B3 ; |X XX  XX| $F988
    .byte $DE ; |XX XXXX | $F989
    .byte $EC ; |XXX XX  | $F98A
    .byte $E2 ; |XXX   X | $F98B
    .byte $86 ; |X    XX | $F98C
    .byte $70 ; | XXX    | $F98D
    .byte $52 ; | X X  X | $F98E
    .byte $6D ; | XX XX X| $F98F
    .byte $B4 ; |X XX X  | $F990
    .byte $C6 ; |XX   XX | $F991
    .byte $C0 ; |XX      | $F992
    .byte $A0 ; |X X     | $F993
    .byte $C6 ; |XX   XX | $F994
    .byte $E2 ; |XXX   X | $F995
    .byte $B8 ; |X XXX   | $F996
    .byte $64 ; | XX  X  | $F997
    .byte $38 ; |  XXX   | $F998
    .byte $22 ; |  X   X | $F999
    .byte $44 ; | X   X  | $F99A
    .byte $88 ; |X   X   | $F99B
    .byte $54 ; | X X X  | $F99C
    .byte $78 ; | XXXX   | $F99D
    .byte $A4 ; |X X  X  | $F99E
    .byte $C1 ; |XX     X| $F99F
    .byte $D8 ; |XX XX   | $F9A0
    .byte $C8 ; |XX  X   | $F9A1
    .byte $C1 ; |XX     X| $F9A2
    .byte $92 ; |X  X  X | $F9A3
LF9A4:
    .byte $02 ; |      X | $F9A4
    .byte $01 ; |       X| $F9A5
    .byte $03 ; |      XX| $F9A6
    .byte $05 ; |     X X| $F9A7
    .byte $03 ; |      XX| $F9A8
    .byte $04 ; |     X  | $F9A9
    .byte $04 ; |     X  | $F9AA
    .byte $01 ; |       X| $F9AB
LF9AC:
    .byte $1E ; |   XXXX | $F9AC
    .byte $6A ; | XX X X | $F9AD
    .byte $6A ; | XX X X | $F9AE
    .byte $48 ; | X  X   | $F9AF
    .byte $6A ; | XX X X | $F9B0
    .byte $1E ; |   XXXX | $F9B1
    .byte $48 ; | X  X   | $F9B2
    .byte $7C ; | XXXXX  | $F9B3
LF9B4:
    .byte $03 ; |      XX| $F9B4
    .byte $05 ; |     X X| $F9B5
    .byte $05 ; |     X X| $F9B6
    .byte $08 ; |    X   | $F9B7
    .byte $05 ; |     X X| $F9B8
    .byte $03 ; |      XX| $F9B9
    .byte $08 ; |    X   | $F9BA
    .byte $04 ; |     X  | $F9BB
LF9BC:
    .byte $07 ; |     XXX| $F9BC
    .byte $06 ; |     XX | $F9BD
    .byte $05 ; |     X X| $F9BE
    .byte $05 ; |     X X| $F9BF
    .byte $04 ; |     X  | $F9C0
    .byte $04 ; |     X  | $F9C1
    .byte $03 ; |      XX| $F9C2
    .byte $03 ; |      XX| $F9C3
    .byte $02 ; |      X | $F9C4
    .byte $01 ; |       X| $F9C5
    .byte $03 ; |      XX| $F9C6
    .byte $04 ; |     X  | $F9C7
    .byte $05 ; |     X X| $F9C8
    .byte $01 ; |       X| $F9C9
    .byte $04 ; |     X  | $F9CA
    .byte $02 ; |      X | $F9CB
LF9CC:
    .byte $11,$20,$EA,$F6,$4C,$12,$F5,$88,$88,$88,$88,$C0,$11,$B0,$03,$20
    .byte $EA,$F6,$84,$B6,$A5,$8B,$D0,$3B,$E6,$CF,$A5,$CF,$25,$8F,$D0,$33
    .byte $E6,$D0,$A5,$D0,$29,$0F,$D0,$02,$E6,$D4,$A5,$D4,$29,$1F,$A8,$B9
    .byte $64,$F9,$85,$C5
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
LFA10:
    .byte $4A,$B0,$02,$A0,$03,$84,$8F,$A9,$60,$85,$8C,$85,$8B,$AD,$82,$02
    .byte $4A,$4A,$90,$F9,$4C,$25,$F0,$A0,$FF,$4A,$4A,$B0,$02,$A0,$0F,$84
    .byte $A5,$A0,$15,$AD,$82,$02,$0A,$0A,$B0,$02,$A0,$10,$84,$E2,$A5,$94
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
LFA90:
    .byte $F2,$FF,$20,$90,$FE,$F0,$09,$C0,$01,$D0,$02,$A0,$03,$CA,$10,$EF
    .byte $A5,$E8,$D0,$09,$A5,$8B,$29,$F0,$85,$8B,$4C,$BF,$FA,$20,$C1,$FE
    .byte $A5,$8B,$29,$20,$F0,$09,$A5,$8B,$29,$CF,$85,$8B,$20,$C8,$FE,$A5
    .byte $EB,$29,$40,$F0,$03,$4C,$76,$FB,$A5,$D0,$29,$10,$D0,$53,$24,$8B
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
    .byte $73 ; | XXX  XX| $FB9A
    .byte $04 ; |     X  | $FB9B
    .byte $64 ; | XX  X  | $FB9C
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
    .byte $0C ; |    XX  | $FBDE
    .byte $0C ; |    XX  | $FBDF
    .byte $38 ; |  XXX   | $FBE0
    .byte $1A ; |   XX X | $FBE1
    .byte $48 ; | X  X   | $FBE2
    .byte $1A ; |   XX X | $FBE3
    .byte $38 ; |  XXX   | $FBE4
    .byte $0C ; |    XX  | $FBE5
LFBE6:
    .byte $04 ; |     X  | $FBE6
    .byte $04 ; |     X  | $FBE7
    .byte $00 ; |        | $FBE8
    .byte $32 ; |  XX  X | $FBE9
    .byte $64 ; | XX  X  | $FBEA
    .byte $32 ; |  XX  X | $FBEB
    .byte $04 ; |     X  | $FBEC
    .byte $00 ; |        | $FBED
LFBEE:
    .byte $29,$03,$09,$08,$A8,$D0,$1B,$0A,$B0,$0E,$E0,$08,$90,$0A,$CA,$CA
    .byte $98,$29,$BF,$CA,$10,$E7,$A9,$4F,$85,$84,$A9,$EF,$85,$8E,$85,$DF
    .byte $E8,$86,$EE,$86,$E8,$86,$D0,$86,$09,$86,$19,$86,$1A,$86,$EB,$A9
    .byte $C0,$25,$8B,$85,$8B,$60,$A5,$D0,$29,$0F,$85,$D0,$60,$A5,$EB,$29
    .byte $40,$F0,$10,$A9,$00,$85,$D0,$24,$CF,$50,$04,$A9,$02,$D0,$02,$A9
    .byte $03,$85,$EB,$60,$A5,$EA,$1D,$5B,$FF,$85,$EA,$60,$A5,$EA,$3D,$60
    .byte $FF,$85,$EA,$60,$18,$75,$89,$6A,$95,$89,$60,$18,$75,$82,$6A,$95
    .byte $82,$60,$A9,$05,$85,$E0,$85,$E1,$85,$E2,$85,$E3,$60,$A5,$DA,$4A
    .byte $90,$12,$20,$4A,$FC,$A5,$85,$C9,$34,$90,$0A,$A5,$8E,$C9,$1E,$B0
    .byte $04,$20,$49,$4E
    .byte $4B ; | X  X XX| $FC82
    .byte $20 ; |  X     | $FC83
    .byte $31 ; |  XX   X| $FC84
    .byte $2E ; |  X XXX | $FC85
    .byte $36 ; |  XX XX | $FC86
    .byte $0D ; |    XX X| $FC87
    .byte $41 ; | X     X| $FC88
    .byte $35 ; |  XX X X| $FC89
    .byte $20 ; |  X     | $FC8A
    .byte $20 ; |  X     | $FC8B
    .byte $20 ; |  X     | $FC8C
    .byte $29 ; |  X X  X| $FC8D
    .byte $F0 ; |XXXX    | $FC8E
    .byte $C2 ; |XX    X | $FC8F
    .byte $49 ; | X  X  X| $FC90
    .byte $4E ; | X  XXX | $FC91
    .byte $49 ; | X  X  X| $FC92
    .byte $54 ; | X X X  | $FC93
    .byte $20 ; |  X     | $FC94
    .byte $25 ; |  X  X X| $FC95
    .byte $F0 ; |XXXX    | $FC96
    .byte $C1 ; |XX     X| $FC97
    .byte $41 ; | X     X| $FC98
    .byte $20 ; |  X     | $FC99
    .byte $20 ; |  X     | $FC9A
    .byte $20 ; |  X     | $FC9B
    .byte $20 ; |  X     | $FC9C
    .byte $05 ; |     X X| $FC9D
    .byte $F0 ; |XXXX    | $FC9E
    .byte $D4 ; |XX X X  | $FC9F
    .byte $4F ; | X  XXXX| $FCA0
    .byte $50 ; | X X    | $FCA1
    .byte $20 ; |  X     | $FCA2
    .byte $20 ; |  X     | $FCA3
    .byte $20 ; |  X     | $FCA4
    .byte $00 ; |        | $FCA5
    .byte $F0 ; |XXXX    | $FCA6
    .byte $58 ; | X XX   | $FCA7
    .byte $4D ; | X  XX X| $FCA8
    .byte $49 ; | X  X  X| $FCA9
    .byte $4E ; | X  XXX | $FCAA
    .byte $20 ; |  X     | $FCAB
    .byte $20 ; |  X     | $FCAC
    .byte $08 ; |    X   | $FCAD
    .byte $00 ; |        | $FCAE
    .byte $59 ; | X XX  X| $FCAF
    .byte $0A ; |    X X | $FCB0
    .byte $A5 ; |X X  X X| $FCB1
    .byte $8E ; |X   XXX | $FCB2
    .byte $C9 ; |XX  X  X| $FCB3
    .byte $1E ; |   XXXX | $FCB4
    .byte $B0 ; |X XX    | $FCB5
    .byte $04 ; |     X  | $FCB6
    .byte $20 ; |  X     | $FCB7
    .byte $02 ; |      X | $FCB8
    .byte $FD ; |XXXXXX X| $FCB9
    .byte $60 ; | XX     | $FCBA
    .byte $20 ; |  X     | $FCBB
    .byte $42 ; | X    X | $FCBC
    .byte $FC ; |XXXXXX  | $FCBD
    .byte $A5 ; |X X  X X| $FCBE
    .byte $84 ; |X    X  | $FCBF
    .byte $38 ; |  XXX   | $FCC0
    .byte $E9 ; |XXX X  X| $FCC1
    .byte $0A ; |    X X | $FCC2
    .byte $20 ; |  X     | $FCC3
    .byte $1B ; |   XX XX| $FCC4
    .byte $FD ; |XXXXXX X| $FCC5
    .byte $C9 ; |XX  X  X| $FCC6
    .byte $5F ; | X XXXXX| $FCC7
    .byte $B0 ; |X XX    | $FCC8
    .byte $F0 ; |XXXX    | $FCC9
    .byte $A9 ; |X X X  X| $FCCA
    .byte $5F ; | X XXXXX| $FCCB
    .byte $85 ; |X    X X| $FCCC
    .byte $86 ; |X    XX | $FCCD
    .byte $60 ; | XX     | $FCCE
    .byte $A5 ; |X X  X X| $FCCF
    .byte $CF ; |XX  XXXX| $FCD0
    .byte $29 ; |  X X  X| $FCD1
    .byte $C0 ; |XX      | $FCD2
    .byte $F0 ; |XXXX    | $FCD3
    .byte $06 ; |     XX | $FCD4
    .byte $A5 ; |X X  X X| $FCD5
    .byte $DA ; |XX XX X | $FCD6
    .byte $29 ; |  X X  X| $FCD7
    .byte $03 ; |      XX| $FCD8
    .byte $D0 ; |XX X    | $FCD9
    .byte $12 ; |   X  X | $FCDA
    .byte $20 ; |  X     | $FCDB
    .byte $4A ; | X  X X | $FCDC
    .byte $FC ; |XXXXXX  | $FCDD
    .byte $A5 ; |X X  X X| $FCDE
    .byte $83 ; |X     XX| $FCDF
    .byte $C9 ; |XX  X  X| $FCE0
    .byte $62 ; | XX   X | $FCE1
    .byte $B0 ; |X XX    | $FCE2
    .byte $0A ; |    X X | $FCE3
    .byte $A5 ; |X X  X X| $FCE4
    .byte $8E ; |X   XXX | $FCE5
    .byte $C9 ; |XX  X  X| $FCE6
    .byte $3D ; |  XXXX X| $FCE7
    .byte $90 ; |X  X    | $FCE8
    .byte $04 ; |     X  | $FCE9
    .byte $20 ; |  X     | $FCEA
    .byte $02 ; |      X | $FCEB
    .byte $FD ; |XXXXXX X| $FCEC
    .byte $60 ; | XX     | $FCED
    .byte $20 ; |  X     | $FCEE
    .byte $42 ; | X    X | $FCEF
    .byte $FC ; |XXXXXX  | $FCF0
    .byte $A5 ; |X X  X X| $FCF1
    .byte $84 ; |X    X  | $FCF2
    .byte $38 ; |  XXX   | $FCF3
    .byte $E9 ; |XXX X  X| $FCF4
    .byte $06 ; |     XX | $FCF5
    .byte $20 ; |  X     | $FCF6
    .byte $1B ; |   XX XX| $FCF7
    .byte $FD ; |XXXXXX X| $FCF8
    .byte $C9 ; |XX  X  X| $FCF9
    .byte $61 ; | XX    X| $FCFA
    .byte $B0 ; |X XX    | $FCFB
    .byte $F0 ; |XXXX    | $FCFC
    .byte $A9 ; |X X X  X| $FCFD
    .byte $61 ; | XX    X| $FCFE
    .byte $85 ; |X    X X| $FCFF
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
    .byte $28 ; |  X X   | $FF00
    .byte $A4 ; |X X  X  | $FF01
    .byte $41 ; | X     X| $FF02
    .byte $00 ; |        | $FF03
    .byte $06 ; |     XX | $FF04
    .byte $04 ; |     X  | $FF05
    .byte $03 ; |      XX| $FF06
    .byte $00 ; |        | $FF07
    .byte $40 ; | X      | $FF08
    .byte $00 ; |        | $FF09
    .byte $80 ; |X       | $FF0A
    .byte $C0 ; |XX      | $FF0B
    .byte $FF ; |XXXXXXXX| $FF0C
    .byte $FF ; |XXXXXXXX| $FF0D
    .byte $FF ; |XXXXXXXX| $FF0E
    .byte $FF ; |XXXXXXXX| $FF0F
    .byte $FF ; |XXXXXXXX| $FF10
    .byte $FF ; |XXXXXXXX| $FF11
    .byte $1F ; |   XXXXX| $FF12
    .byte $1F ; |   XXXXX| $FF13
    .byte $F0 ; |XXXX    | $FF14
    .byte $F0 ; |XXXX    | $FF15
    .byte $F0 ; |XXXX    | $FF16
    .byte $F0 ; |XXXX    | $FF17
    .byte $F0 ; |XXXX    | $FF18
    .byte $F0 ; |XXXX    | $FF19
    .byte $00 ; |        | $FF1A
    .byte $00 ; |        | $FF1B
    .byte $7E ; | XXXXXX | $FF1C
    .byte $5A ; | X XX X | $FF1D
    .byte $5A ; | X XX X | $FF1E
    .byte $5A ; | X XX X | $FF1F
    .byte $7E ; | XXXXXX | $FF20
    .byte $00 ; |        | $FF21
    .byte $7E ; | XXXXXX | $FF22
    .byte $24 ; |  X  X  | $FF23
    .byte $24 ; |  X  X  | $FF24
    .byte $3C ; |  XXXX  | $FF25
    .byte $24 ; |  X  X  | $FF26
    .byte $00 ; |        | $FF27
    .byte $7E ; | XXXXXX | $FF28
    .byte $18 ; |   XX   | $FF29
    .byte $7E ; | XXXXXX | $FF2A
    .byte $42 ; | X    X | $FF2B
    .byte $7E ; | XXXXXX | $FF2C
    .byte $00 ; |        | $FF2D
    .byte $7E ; | XXXXXX | $FF2E
    .byte $42 ; | X    X | $FF2F
    .byte $66 ; | XX  XX | $FF30
    .byte $42 ; | X    X | $FF31
    .byte $7E ; | XXXXXX | $FF32
    .byte $00 ; |        | $FF33
    .byte $42 ; | X    X | $FF34
    .byte $42 ; | X    X | $FF35
    .byte $7E ; | XXXXXX | $FF36
    .byte $5A ; | X XX X | $FF37
    .byte $5A ; | X XX X | $FF38
    .byte $00 ; |        | $FF39
    .byte $7E ; | XXXXXX | $FF3A
    .byte $42 ; | X    X | $FF3B
    .byte $7E ; | XXXXXX | $FF3C
    .byte $18 ; |   XX   | $FF3D
    .byte $7E ; | XXXXXX | $FF3E
    .byte $00 ; |        | $FF3F
    .byte $7E ; | XXXXXX | $FF40
    .byte $5A ; | X XX X | $FF41
    .byte $7E ; | XXXXXX | $FF42
    .byte $18 ; |   XX   | $FF43
    .byte $7E ; | XXXXXX | $FF44
    .byte $00 ; |        | $FF45
    .byte $18 ; |   XX   | $FF46
    .byte $18 ; |   XX   | $FF47
    .byte $24 ; |  X  X  | $FF48
    .byte $42 ; | X    X | $FF49
    .byte $7E ; | XXXXXX | $FF4A
    .byte $00 ; |        | $FF4B
    .byte $7E ; | XXXXXX | $FF4C
    .byte $5A ; | X XX X | $FF4D
    .byte $7E ; | XXXXXX | $FF4E
    .byte $5A ; | X XX X | $FF4F
    .byte $7E ; | XXXXXX | $FF50
    .byte $00 ; |        | $FF51
    .byte $7E ; | XXXXXX | $FF52
    .byte $42 ; | X    X | $FF53
    .byte $7E ; | XXXXXX | $FF54
    .byte $5A ; | X XX X | $FF55
    .byte $7E ; | XXXXXX | $FF56
    .byte $8F ; |X   XXXX| $FF57
    .byte $4F ; | X  XXXX| $FF58
    .byte $2F ; |  X XXXX| $FF59
    .byte $1F ; |   XXXXX| $FF5A
    .byte $80 ; |X       | $FF5B
    .byte $40 ; | X      | $FF5C
    .byte $00 ; |        | $FF5D
    .byte $02 ; |      X | $FF5E
    .byte $01 ; |       X| $FF5F
    .byte $7F ; | XXXXXXX| $FF60
    .byte $BF ; |X XXXXXX| $FF61
    .byte $00 ; |        | $FF62
    .byte $FD ; |XXXXXX X| $FF63
    .byte $FE ; |XXXXXXX | $FF64
    .byte $80 ; |X       | $FF65
    .byte $40 ; | X      | $FF66
    .byte $20 ; |  X     | $FF67
    .byte $10 ; |   X    | $FF68
    .byte $30 ; |  XX    | $FF69
    .byte $30 ; |  XX    | $FF6A
    .byte $20 ; |  X     | $FF6B
    .byte $10 ; |   X    | $FF6C
    .byte $10 ; |   X    | $FF6D
    .byte $20 ; |  X     | $FF6E
    .byte $20 ; |  X     | $FF6F
    .byte $3C ; |  XXXX  | $FF70
    .byte $1F ; |   XXXXX| $FF71
    .byte $1F ; |   XXXXX| $FF72
    .byte $1F ; |   XXXXX| $FF73
    .byte $3C ; |  XXXX  | $FF74
    .byte $00 ; |        | $FF75
    .byte $00 ; |        | $FF76
    .byte $00 ; |        | $FF77
    .byte $7C ; | XXXXX  | $FF78
    .byte $F8 ; |XXXXX   | $FF79
    .byte $F8 ; |XXXXX   | $FF7A
    .byte $F8 ; |XXXXX   | $FF7B
    .byte $7C ; | XXXXX  | $FF7C
    .byte $00 ; |        | $FF7D
    .byte $00 ; |        | $FF7E
    .byte $00 ; |        | $FF7F
    .byte $7E ; | XXXXXX | $FF80
    .byte $FF ; |XXXXXXXX| $FF81
    .byte $FF ; |XXXXXXXX| $FF82
    .byte $C3 ; |XX    XX| $FF83
    .byte $00 ; |        | $FF84
    .byte $00 ; |        | $FF85
    .byte $00 ; |        | $FF86
    .byte $00 ; |        | $FF87
    .byte $C3 ; |XX    XX| $FF88
    .byte $FF ; |XXXXXXXX| $FF89
    .byte $FF ; |XXXXXXXX| $FF8A
    .byte $7E ; | XXXXXX | $FF8B
    .byte $00 ; |        | $FF8C
    .byte $00 ; |        | $FF8D
    .byte $00 ; |        | $FF8E
    .byte $00 ; |        | $FF8F
    .byte $30 ; |  XX    | $FF90
    .byte $F8 ; |XXXXX   | $FF91
    .byte $FC ; |XXXXXX  | $FF92
    .byte $3E ; |  XXXXX | $FF93
    .byte $1E ; |   XXXX | $FF94
    .byte $0C ; |    XX  | $FF95
    .byte $00 ; |        | $FF96
    .byte $00 ; |        | $FF97
    .byte $0C ; |    XX  | $FF98
    .byte $1F ; |   XXXXX| $FF99
    .byte $3F ; |  XXXXXX| $FF9A
    .byte $7E ; | XXXXXX | $FF9B
    .byte $7C ; | XXXXX  | $FF9C
    .byte $30 ; |  XX    | $FF9D
    .byte $00 ; |        | $FF9E
    .byte $00 ; |        | $FF9F
    .byte $0C ; |    XX  | $FFA0
    .byte $1E ; |   XXXX | $FFA1
    .byte $3E ; |  XXXXX | $FFA2
    .byte $FC ; |XXXXXX  | $FFA3
    .byte $F8 ; |XXXXX   | $FFA4
    .byte $30 ; |  XX    | $FFA5
    .byte $00 ; |        | $FFA6
    .byte $00 ; |        | $FFA7
    .byte $30 ; |  XX    | $FFA8
    .byte $7C ; | XXXXX  | $FFA9
    .byte $7E ; | XXXXXX | $FFAA
    .byte $3F ; |  XXXXXX| $FFAB
    .byte $1F ; |   XXXXX| $FFAC
    .byte $0C ; |    XX  | $FFAD
    .byte $00 ; |        | $FFAE
    .byte $00 ; |        | $FFAF
    .byte $17 ; |   X XXX| $FFB0
    .byte $11 ; |   X   X| $FFB1
    .byte $0B ; |    X XX| $FFB2
    .byte $05 ; |     X X| $FFB3
    .byte $0B ; |    X XX| $FFB4
    .byte $17 ; |   X XXX| $FFB5
    .byte $11 ; |   X   X| $FFB6
    .byte $0B ; |    X XX| $FFB7
    .byte $05 ; |     X X| $FFB8
    .byte $0B ; |    X XX| $FFB9
    .byte $17 ; |   X XXX| $FFBA
    .byte $11 ; |   X   X| $FFBB
    .byte $0B ; |    X XX| $FFBC
    .byte $05 ; |     X X| $FFBD
    .byte $0B ; |    X XX| $FFBE
    .byte $17 ; |   X XXX| $FFBF
    .byte $11 ; |   X   X| $FFC0
    .byte $0B ; |    X XX| $FFC1
    .byte $05 ; |     X X| $FFC2
    .byte $0B ; |    X XX| $FFC3
    .byte $17 ; |   X XXX| $FFC4
    .byte $11 ; |   X   X| $FFC5
    .byte $0B ; |    X XX| $FFC6
    .byte $1E ; |   XXXX | $FFC7
    .byte $3D ; |  XXXX X| $FFC8
    .byte $60 ; | XX     | $FFC9
    .byte $00 ; |        | $FFCA
    .byte $38 ; |  XXX   | $FFCB
    .byte $5F ; | X XXXXX| $FFCC
    .byte $0C ; |    XX  | $FFCD
    .byte $07 ; |     XXX| $FFCE
    .byte $04 ; |     X  | $FFCF
    .byte $01 ; |       X| $FFD0
    .byte $3C ; |  XXXX  | $FFD1
    .byte $00 ; |        | $FFD2
    .byte $00 ; |        | $FFD3
    .byte $1F ; |   XXXXX| $FFD4
    .byte $00 ; |        | $FFD5
    .byte $01 ; |       X| $FFD6
    .byte $03 ; |      XX| $FFD7
    .byte $07 ; |     XXX| $FFD8
    .byte $08 ; |    X   | $FFD9
    .byte $40 ; | X      | $FFDA
    .byte $41 ; | X     X| $FFDB
    .byte $43 ; | X    XX| $FFDC
    .byte $47 ; | X   XXX| $FFDD
    .byte $48 ; | X  X   | $FFDE
    .byte $80 ; |X       | $FFDF
    .byte $81 ; |X      X| $FFE0
    .byte $83 ; |X     XX| $FFE1
    .byte $87 ; |X    XXX| $FFE2
    .byte $88 ; |X   X   | $FFE3
    .byte $C0 ; |XX      | $FFE4
    .byte $C1 ; |XX     X| $FFE5
    .byte $C3 ; |XX    XX| $FFE6
    .byte $C7 ; |XX   XXX| $FFE7
    .byte $C8 ; |XX  X   | $FFE8
    .byte $E0 ; |XXX     | $FFE9
    .byte $E1 ; |XXX    X| $FFEA
    .byte $E3 ; |XXX   XX| $FFEB
    .byte $13 ; |   X  XX| $FFEC
    .byte $0B ; |    X XX| $FFED
    .byte $1B ; |   XX XX| $FFEE
    .byte $23 ; |  X   XX| $FFEF
    .byte $2B ; |  X X XX| $FFF0
    .byte $33 ; |  XX  XX| $FFF1
    .byte $9A ; |X  XX X | $FFF2
    .byte $A2 ; |X X   X | $FFF3
    .byte $92 ; |X  X  X | $FFF4
    .byte $8A ; |X   X X | $FFF5
    .byte $82 ; |X     X | $FFF6
    .byte $7A ; | XXXX X | $FFF7
    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9
    .byte $00 ; |        | $FFFA
    .byte $00 ; |        | $FFFB
    .byte $00 ; |        | $FFFC
    .byte $F0 ; |XXXX    | $FFFD
    .byte $00 ; |        | $FFFE
    .byte $F0 ; |XXXX    | $FFFF
