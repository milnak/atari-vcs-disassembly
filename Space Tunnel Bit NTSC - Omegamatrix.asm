; Disassembly of ST_BitN.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcST_BitN.cfg ST_BitN.bin 
;
; ST_BitN.cfg contents:
;
;      ORG F000
;      CODE F000 F6CA
;      GFX F6CB F6CD
;      CODE F6CE F92B
;      CODE F92C FFFF

      processor 6502

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
RSYNC   =  $03
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
RESM0   =  $12
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
HMP0    =  $20
HMBL    =  $24
VDELP0  =  $25
RESMP0  =  $28
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXM0P   =  $30
CXBLPF  =  $36
CXPPMM  =  $37
INPT0   =  $38
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296
LF010   =   $F010
LF026   =   $F026
LF03D   =   $F03D
LF07C   =   $F07C
LF500   =   $F500
LF600   =   $F600
LF63C   =   $F63C
LF666   =   $F666
LF6B4   =   $F6B4
LF810   =   $F810
LF888   =   $F888
LF954   =   $F954
LF95C   =   $F95C
LF9AC   =   $F9AC
LFA5A   =   $FA5A
LFA8F   =   $FA8F
LFB99   =   $FB99
LFBDE   =   $FBDE
LFD02   =   $FD02
LFE00   =   $FE00
LFE18   =   $FE18
LFE42   =   $FE42
LFE5A   =   $FE5A
LFF05   =   $FF05
LFF15   =   $FF15
LFF17   =   $FF17
LFF21   =   $FF21
LFF27   =   $FF27
LFF29   =   $FF29
LFF2D   =   $FF2D
LFF37   =   $FF37
LFF3F   =   $FF3F
LFF49   =   $FF49
LFF4B   =   $FF4B
LFF53   =   $FF53
LFF8C   =   $FF8C

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
LF060:
    LDA    $E2             ; 3
    STA    NUSIZ0          ; 3
LF064:
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
LF0FE:
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
LF114:
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
LF200:
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
LF2EC:
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
LF30E:
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
LF401:
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
LF442:
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
    BRK                    ; 7
    AND    ($49),Y         ; 5
    LDA    $A5,X           ; 4
    LDA    $B5             ; 3
    EOR    #$31            ; 2
LF935:
    BRK                    ; 7
    .byte $D2 ;.JAM        ; 0
    .byte $D2 ;.JAM        ; 0
    .byte $52 ;.JAM        ; 0
    .byte $D2 ;.JAM        ; 0
    .byte $92 ;.JAM        ; 0
    .byte $D2 ;.JAM        ; 0
    .byte $57 ;.SRE        ; 6
    .byte $D7 ;.DCP        ; 6
LF93E:
    BRK                    ; 7
    .byte $37 ;.RLA        ; 6
    .byte $37 ;.RLA        ; 6
    .byte $37 ;.RLA        ; 6
    AND    VDELP0          ; 3
    AND    CXPPMM          ; 3
    .byte $37 ;.RLA        ; 6
LF947:
    BRK                    ; 7
    .byte $54 ;.NOOP; 4
    .byte $54 ;.NOOP; 4
    .byte $64 ;.NOOP; 3
    .byte $77 ;.RRA        ; 6
    .byte $77 ;.RRA        ; 6
    EOR    $55,X           ; 4
    .byte $77 ;.RRA        ; 6
LF950:
    .byte $0C ;.NOOP; 4
    .byte $07 ;.SLO        ; 5
    .byte $04 ;.NOOP; 3
    ORA    ($00,X)         ; 6
    ORA    ($02,X)         ; 6
    .byte $03 ;.SLO        ; 8
    .byte $04 ;.NOOP; 3
    .byte $03 ;.SLO        ; 8
    .byte $02 ;.JAM        ; 0
    ORA    ($38,X)         ; 6
    CLC                    ; 2
    ASL    $5A2E           ; 6
    JMP    $AA8A           ; 3
LF964:
    ROR                    ; 2
    PHA                    ; 3
    .byte $34 ;.NOOP; 4
    ASL    COLUPF,X        ; 6
    ASL    $5D             ; 5
    .byte $74 ;.NOOP; 4
    .byte $82 ;.NOOP; 2
    JMP    ($3D4F)         ; 5
    SEC                    ; 2
    PHA                    ; 3
    .byte $5A ;.NOOP; 2
    .byte $32 ;.JAM        ; 0
    ROL    AUDV1,X         ; 6
    ORA    HMBL            ; 3
    .byte $12 ;.JAM        ; 0
    .byte $44 ;.NOOP; 3
    .byte $64 ;.NOOP; 3
    .byte $5A ;.NOOP; 2
    .byte $7C ;.NOOP; 4
    ROR                    ; 2
    STX    $3F             ; 3
    .byte $93 ;.SHA        ; 6
    ROR                    ; 2
    .byte $5F ;.SRE        ; 7
    .byte $44 ;.NOOP; 3
LF984:
    .byte $1A ;.NOOP; 2
    BIT    $42             ; 3
    .byte $74 ;.NOOP; 4
    .byte $B3 ;.LAX        ; 5
    DEC    $E2EC,X         ; 7
    STX    $70             ; 3
    .byte $52 ;.JAM        ; 0
    ADC    $C6B4           ; 4
    CPY    #$A0            ; 2
    DEC    $E2             ; 5
    CLV                    ; 2
    .byte $64 ;.NOOP; 3
    SEC                    ; 2
    .byte $22 ;.JAM        ; 0
    .byte $44 ;.NOOP; 3
    DEY                    ; 2
    .byte $54 ;.NOOP; 4
    SEI                    ; 2
    LDY    $C1             ; 3
    CLD                    ; 2
    INY                    ; 2
    CMP    ($92,X)         ; 6
LF9A4:
    .byte $02 ;.JAM        ; 0
    ORA    ($03,X)         ; 6
    ORA    RSYNC           ; 3
    .byte $04 ;.NOOP; 3
    .byte $04 ;.NOOP; 3
    ORA    ($1E,X)         ; 6
    ROR                    ; 2
    ROR                    ; 2
    PHA                    ; 3
    ROR                    ; 2
    ASL    $7C48,X         ; 7
LF9B4:
    .byte $03 ;.SLO        ; 8
    ORA    NUSIZ1          ; 3
    PHP                    ; 3
    ORA    RSYNC           ; 3
    PHP                    ; 3
    .byte $04 ;.NOOP; 3
LF9BC:
    .byte $07 ;.SLO        ; 5
    ASL    NUSIZ1          ; 5
    ORA    NUSIZ0          ; 3
    .byte $04 ;.NOOP; 3
    .byte $03 ;.SLO        ; 8
    .byte $03 ;.SLO        ; 8
    .byte $02 ;.JAM        ; 0
    ORA    ($03,X)         ; 6
    .byte $04 ;.NOOP; 3
    ORA    VBLANK          ; 3
    .byte $04 ;.NOOP; 3
    .byte $02 ;.JAM        ; 0
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    .byte $44 ;.NOOP; 3
    BRK                    ; 7
    JSR    $4401           ; 6
    BRK                    ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
LFA14:
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
LFA1C:
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
LFA2E:
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    BRK                    ; 7
    BRK                    ; 7
    BIT    $5A             ; 3
    STA    $2442,Y         ; 5
    CLC                    ; 2
    BRK                    ; 7
    BPL    LFA8F           ; 2
    PLP                    ; 4
    .byte $92 ;.JAM        ; 0
    PLP                    ; 4
    .byte $44 ;.NOOP; 3
    BPL    LFA51           ; 2
LFA51:
    .byte $63 ;.RRA        ; 8
    .byte $22 ;.JAM        ; 0
    .byte $14 ;.NOOP; 4
    PHP                    ; 3
    EOR    CXBLPF,X        ; 4
    PHP                    ; 3
    BRK                    ; 7
    BPL    LFA83           ; 2
    .byte $44 ;.NOOP; 3
    DEC    RESMP0,X        ; 6
    JMP.ind ($0000)        ; 5
    BIT    VSYNC           ; 3
    .byte $5A ;.NOOP; 2
    .byte $5A ;.NOOP; 2
    STA    ($18,X)         ; 6
    BIT    VSYNC           ; 3
    BPL    LFAA3           ; 2
    .byte $54 ;.NOOP; 4
    INC    $3810,X         ; 7
    .byte $7C ;.NOOP; 4
    BRK                    ; 7
    BRK                    ; 7
    CLC                    ; 2
    BIT    AUDF1           ; 3
    BIT    $81             ; 3
    ROR    VSYNC           ; 5
    .byte $0C ;.NOOP; 4
    CLC                    ; 2
    .byte $0C ;.NOOP; 4
    ROL    $49,X           ; 6
    EOR    #$22            ; 2
    BRK                    ; 7
    .byte $42 ;.JAM        ; 0
    .byte $5A ;.NOOP; 2
LFA83:
    BIT    $42             ; 3
    STA    ($5A,X)         ; 6
    BIT    VSYNC           ; 3
    PLP                    ; 4
LFA8A:
    .byte $44 ;.NOOP; 3
    .byte $92 ;.JAM        ; 0
    .byte $92 ;.JAM        ; 0
    JMP    ($2810)         ; 5
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
LFAA3:
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
LFACE:
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BPL    LFB29           ; 2
    SEC                    ; 2
    LSR    $6064,X         ; 7
    BPL    LFAD9           ; 2
LFAD9:
    BPL    LFB31           ; 2
    SEC                    ; 2
    LSR.wx $0064,X         ; 7
    BRK                    ; 7
    BRK                    ; 7
    DEC    RESP0,X         ; 6
    PLP                    ; 4
    .byte $54 ;.NOOP; 4
    DEC    INPT0           ; 5
    BPL    LFAE9           ; 2
LFAE9:
    DEC    RESP0,X         ; 6
    PLP                    ; 4
    .byte $54 ;.NOOP; 4
    DEC    INPT0           ; 5
    BPL    LFAF1           ; 2
LFAF1:
    BPL    LFB2B           ; 2
    DEC    $54             ; 5
    PLP                    ; 4
    BPL    LFACE           ; 2
    BRK                    ; 7
    .byte $3C ;.NOOP; 4
    LDA    $66             ; 3
    .byte $5A ;.NOOP; 2
    .byte $E7 ;.ISB        ; 5
    .byte $3C ;.NOOP; 4
    PHP                    ; 3
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    .byte $3C ;.NOOP; 4
    ROR    $66             ; 5
    ROR    $66             ; 5
    ROR    $66             ; 5
    .byte $3C ;.NOOP; 4
    .byte $3C ;.NOOP; 4
    CLC                    ; 2
    CLC                    ; 2
    CLC                    ; 2
    CLC                    ; 2
    CLC                    ; 2
    SEC                    ; 2
    CLC                    ; 2
    ROR    $6060,X         ; 7
    .byte $3C ;.NOOP; 4
    ASL    COLUP0          ; 5
    LSR    INPT4           ; 5
    .byte $3C ;.NOOP; 4
    LSR    COLUP0          ; 5
    .byte $0C ;.NOOP; 4
    .byte $0C ;.NOOP; 4
    ASL    $46             ; 5
    .byte $3C ;.NOOP; 4
    .byte $0C ;.NOOP; 4
LFB29:
    .byte $0C ;.NOOP; 4
    .byte $0C ;.NOOP; 4
LFB2B:
    ROR    $2C4C,X         ; 7
    .byte $1C ;.NOOP; 4
    .byte $0C ;.NOOP; 4
    .byte $7C ;.NOOP; 4
LFB31:
    LSR    COLUP0          ; 5
    ASL    $7C             ; 5
    RTS                    ; 6

    RTS                    ; 6

    ROR    $663C,X         ; 7
    ROR    $66             ; 5
    .byte $7C ;.NOOP; 4
    RTS                    ; 6

    .byte $62 ;.JAM        ; 0
    .byte $3C ;.NOOP; 4
    CLC                    ; 2
    CLC                    ; 2
    CLC                    ; 2
    CLC                    ; 2
    .byte $0C ;.NOOP; 4
    ASL    $42             ; 5
    ROR    $663C,X         ; 7
    ROR    INPT4           ; 5
    .byte $3C ;.NOOP; 4
    ROR    $66             ; 5
    .byte $3C ;.NOOP; 4
    .byte $3C ;.NOOP; 4
    LSR    COLUP0          ; 5
    ROL    $6666,X         ; 7
    ROR    INPT4           ; 5
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
LFB60:
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    CPY    $CCCC           ; 4
    CPY    $8888           ; 4
    DEY                    ; 2
    DEY                    ; 2
LFB70:
    .byte $07 ;.SLO        ; 5
    ORA    ($0A,X)         ; 6
    .byte $04 ;.NOOP; 3
    ORA    #$0C            ; 2
    ORA    COLUPF          ; 3
LFB78:
    .byte $1B ;.SLO        ; 7
    ASL    RESM0,X         ; 6
    BPL    LFB91           ; 2
    .byte $12 ;.JAM        ; 0
    .byte $14 ;.NOOP; 4
    ASL    RESBL,X         ; 6
    .byte $12 ;.JAM        ; 0
    .byte $12 ;.JAM        ; 0
    BPL    LFB99           ; 2
    BPL    LFB9B           ; 2
    BPL    LFB9D           ; 2
LFB89:
    PHP                    ; 3
    PHP                    ; 3
    .byte $07 ;.SLO        ; 5
    ORA    #$08            ; 2
    ASL                    ; 2
    ORA    #$0B            ; 2
LFB91:
    ASL                    ; 2
    .byte $0C ;.NOOP; 4
    .byte $0B ;.ANC        ; 2
    ORA    $0E0C           ; 4
    ORA.w  $000F           ; 4
LFB9A:
    .byte $73 ;.RRA        ; 8
LFB9B:
    .byte $04 ;.NOOP; 3
    .byte $64 ;.NOOP; 3
LFB9D:
    BRK                    ; 7
LFB9E:
    ORA    ($14),Y         ; 5
    .byte $17 ;.SLO        ; 6
    .byte $14 ;.NOOP; 4
    ASL    $1114           ; 6
    .byte $0B ;.ANC        ; 2
    .byte $17 ;.SLO        ; 6
    .byte $14 ;.NOOP; 4
    ORA    ($0E),Y         ; 5
    .byte $14 ;.NOOP; 4
    ORA    ($0B),Y         ; 5
    .byte $0B ;.ANC        ; 2
    ORA    REFP0           ; 3
    ORA    #$08            ; 2
    ASL    COLUPF          ; 5
    ORA    #$0B            ; 2
    ORA    ($14),Y         ; 5
    .byte $17 ;.SLO        ; 6
    .byte $1A ;.NOOP; 2
    ORA    ($14),Y         ; 5
    .byte $17 ;.SLO        ; 6
    .byte $1A ;.NOOP; 2
LFBBE:
    .byte $14 ;.NOOP; 4
    .byte $1A ;.NOOP; 2
    .byte $17 ;.SLO        ; 6
    .byte $1A ;.NOOP; 2
    .byte $13 ;.SLO        ; 8
    .byte $1A ;.NOOP; 2
    .byte $14 ;.NOOP; 4
    ASL    $1A1C           ; 6
    .byte $14 ;.NOOP; 4
    .byte $13 ;.SLO        ; 8
    .byte $1A ;.NOOP; 2
    .byte $14 ;.NOOP; 4
    ASL    $130E           ; 6
    ASL    $0B0C           ; 6
    PHP                    ; 3
    .byte $0B ;.ANC        ; 2
    .byte $0C ;.NOOP; 4
    ASL    $1A14           ; 6
    .byte $1C ;.NOOP; 4
    ASL    $1A14,X         ; 7
    .byte $17 ;.SLO        ; 6
    ASL    $0C0C,X         ; 7
    SEC                    ; 2
    .byte $1A ;.NOOP; 2
    PHA                    ; 3
    .byte $1A ;.NOOP; 2
    SEC                    ; 2
    .byte $0C ;.NOOP; 4
LFBE6:
    .byte $04 ;.NOOP; 3
    .byte $04 ;.NOOP; 3
    BRK                    ; 7
    .byte $32 ;.JAM        ; 0
    .byte $64 ;.NOOP; 3
    .byte $32 ;.JAM        ; 0
    .byte $04 ;.NOOP; 3
    BRK                    ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
LFC20:
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
LFC3E:
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
LFC42:
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
LFC48:
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
LFC4A:
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
LFC4C:
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
LFCBA:
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    TAX                    ; 2
    LDA    $84             ; 3
    SEC                    ; 2
    SBC    #$0A            ; 2
    JSR    LFD1B           ; 6
    CMP    #$5F            ; 2
    BCS    LFCBA           ; 2
    LDA    #$5F            ; 2
LFCCC:
    STA    $86             ; 3
    RTS                    ; 6

    LDA    $CF             ; 3
    AND    #$C0            ; 2
    BEQ    LFCDB           ; 2
    LDA    $DA             ; 3
    AND    #$03            ; 2
    BNE    LFCED           ; 2
LFCDB:
    JSR    LFC4A           ; 6
    LDA    $83             ; 3
    CMP    #$62            ; 2
    BCS    LFCEE           ; 2
    LDA    $8E             ; 3
    CMP    #$3D            ; 2
    BCC    LFCEE           ; 2
    JSR    LFD02           ; 6
LFCED:
    RTS                    ; 6

LFCEE:
    JSR    LFC42           ; 6
    LDA    $84             ; 3
    SEC                    ; 2
    SBC    #$06            ; 2
    JSR    LFD1B           ; 6
LFCF9:
    CMP    #$61            ; 2
LFCFB:
    BCS    LFCED           ; 2
LFCFD:
    LDA    #$61            ; 2
LFCFF:
    STA    CXM0P           ; 3
    BMI    LFD33           ; 2
    BMI    LFD75           ; 2
    BVS    LFD77           ; 2
    BVS    LFCF9           ; 2
    BEQ    LFCFB           ; 2
    BEQ    LFCFD           ; 2
    BEQ    LFCFF           ; 2
    BEQ    LFD81           ; 2
    BVS    LFD83           ; 2
    BVS    LFD45           ; 2
    BMI    LFD47           ; 2
    BMI    LFD49           ; 2
    BMI    LFD4B           ; 2
LFD1B:
    BMI    LFD2D           ; 2
    BPL    LFD2F           ; 2
    BPL    LFD51           ; 2
    BMI    LFD53           ; 2
    BMI    LFD35           ; 2
    BPL    LFD37           ; 2
    BPL    LFD59           ; 2
    BMI    LFD5B           ; 2
    BMI    LFD5D           ; 2
LFD2D:
    BMI    LFD5F           ; 2
LFD2F:
    BMI    LFDA1           ; 2
    BVS    LFDA3           ; 2
LFD33:
    BVS    LFDA5           ; 2
LFD35:
    BVS    LFDA7           ; 2
LFD37:
    BVS    LFD69           ; 2
LFD39:
    BMI    LFD6B           ; 2
LFD3B:
    BMI    LFD4D           ; 2
    BPL    LFD4F           ; 2
    BPL    LFD51           ; 2
    BPL    LFD53           ; 2
    BPL    LFDB5           ; 2
LFD45:
    BVS    LFDB7           ; 2
LFD47:
    BVS    LFD39           ; 2
LFD49:
    BEQ    LFD3B           ; 2
LFD4B:
    BEQ    LFDBD           ; 2
LFD4D:
    BVS    LFDBF           ; 2
LFD4F:
    BVS    LFD81           ; 2
LFD51:
    BMI    LFD83           ; 2
LFD53:
    BMI    LFDC5           ; 2
    BVS    LFDC7           ; 2
    BVS    LFD89           ; 2
LFD59:
    BMI    LFD8B           ; 2
LFD5B:
    BMI    LFD6D           ; 2
LFD5D:
    BPL    LFD6F           ; 2
LFD5F:
    BPL    LFD71           ; 2
    BPL    LFD73           ; 2
    BPL    LFD95           ; 2
LFD65:
    BMI    LFD97           ; 2
LFD67:
    BMI    LFDD9           ; 2
LFD69:
    BVS    LFDDB           ; 2
LFD6B:
    BVS    LFD5D           ; 2
LFD6D:
    BEQ    LFD5F           ; 2
LFD6F:
    BEQ    LFDE1           ; 2
LFD71:
    BVS    LFDE3           ; 2
LFD73:
    BVS    LFD65           ; 2
LFD75:
    BEQ    LFD67           ; 2
LFD77:
    BEQ    LFDE9           ; 2
    BVS    LFDEB           ; 2
    BVS    LFD8D           ; 2
    BPL    LFD8F           ; 2
    BPL    LFDB1           ; 2
LFD81:
    BMI    LFDB3           ; 2
LFD83:
    BMI    LFD95           ; 2
    BPL    LFD97           ; 2
    BPL    LFD99           ; 2
LFD89:
    BPL    LFD9B           ; 2
LFD8B:
    BPL    LFDBD           ; 2
LFD8D:
    BMI    LFDBF           ; 2
LFD8F:
    BMI    LFE01           ; 2
LFD91:
    BVS    LFE03           ; 2
LFD93:
    BVS    LFDA5           ; 2
LFD95:
    BPL    LFDA7           ; 2
LFD97:
    BPL    LFDC9           ; 2
LFD99:
    BMI    LFDCB           ; 2
LFD9B:
    BMI    LFE0D           ; 2
    BVS    LFE0F           ; 2
    BVS    LFD91           ; 2
LFDA1:
    BEQ    LFD93           ; 2
LFDA3:
    BEQ    LFD95           ; 2
LFDA5:
    BEQ    LFD97           ; 2
LFDA7:
    BEQ    LFE19           ; 2
    BVS    LFE1B           ; 2
    BVS    LFDDD           ; 2
    BMI    LFDDF           ; 2
    BMI    LFDA1           ; 2
LFDB1:
    BEQ    LFDA3           ; 2
LFDB3:
    BEQ    LFDA5           ; 2
LFDB5:
    BEQ    LFDA7           ; 2
LFDB7:
    BEQ    LFDE9           ; 2
    BMI    LFDEB           ; 2
    BMI    LFDCD           ; 2
LFDBD:
    BPL    LFDCF           ; 2
LFDBF:
    BPL    LFDD1           ; 2
    BPL    LFDD3           ; 2
    BPL    LFDF5           ; 2
LFDC5:
    BMI    LFDF7           ; 2
LFDC7:
    BMI    LFDD9           ; 2
LFDC9:
    BPL    LFDDB           ; 2
LFDCB:
    BPL    LFDDD           ; 2
LFDCD:
    BPL    LFDDF           ; 2
LFDCF:
    BPL    LFE01           ; 2
LFDD1:
    BMI    LFE03           ; 2
LFDD3:
    BMI    LFE05           ; 2
    BMI    LFE07           ; 2
    BMI    LFE49           ; 2
LFDD9:
    BVS    LFE4B           ; 2
LFDDB:
    BVS    LFDCD           ; 2
LFDDD:
    BEQ    LFDCF           ; 2
LFDDF:
    BEQ    LFDD1           ; 2
LFDE1:
    BEQ    LFDD3           ; 2
LFDE3:
    BEQ    LFE55           ; 2
LFDE5:
    BVS    LFE57           ; 2
LFDE7:
    BVS    LFE19           ; 2
LFDE9:
    BMI    LFE1B           ; 2
LFDEB:
    BMI    LFDFD           ; 2
    BPL    LFDFF           ; 2
    BPL    LFE21           ; 2
    BMI    LFE23           ; 2
    BMI    LFDE5           ; 2
LFDF5:
    BEQ    LFDE7           ; 2
LFDF7:
    BEQ    LFDE9           ; 2
    BEQ    LFDEB           ; 2
    BEQ    LFE2D           ; 2
LFDFD:
    BMI    LFE2F           ; 2
LFDFF:
    BMI    LFE11           ; 2
LFE01:
    BPL    LFE13           ; 2
LFE03:
    BPL    LFE15           ; 2
LFE05:
    BPL    LFE17           ; 2
LFE07:
    BPL    LFE39           ; 2
    BMI    LFE3B           ; 2
    BMI    LFE7D           ; 2
LFE0D:
    BVS    LFE7F           ; 2
LFE0F:
    BVS    LFE41           ; 2
LFE11:
    BMI    LFE43           ; 2
LFE13:
    BMI    LFE05           ; 2
LFE15:
    BEQ    LFE07           ; 2
LFE17:
    BEQ    LFE29           ; 2
LFE19:
    BPL    LFE2B           ; 2
LFE1B:
    BPL    LFE4D           ; 2
    BMI    LFE4F           ; 2
    BMI    LFE91           ; 2
LFE21:
    BVS    LFE93           ; 2
LFE23:
    BVS    LFE95           ; 2
LFE25:
    BVS    LFE97           ; 2
LFE27:
    BVS    LFE19           ; 2
LFE29:
    BEQ    LFE1B           ; 2
LFE2B:
    BEQ    LFE3D           ; 2
LFE2D:
    BPL    LFE3F           ; 2
LFE2F:
    BPL    LFE61           ; 2
    BMI    LFE63           ; 2
    BMI    LFE25           ; 2
    BEQ    LFE27           ; 2
    BEQ    LFEA9           ; 2
LFE39:
    BVS    LFEAB           ; 2
LFE3B:
    BVS    LFE6D           ; 2
LFE3D:
    BMI    LFE6F           ; 2
LFE3F:
    BMI    LFE51           ; 2
LFE41:
    BPL    LFE53           ; 2
LFE43:
    BPL    LFEB5           ; 2
    BVS    LFEB7           ; 2
    BVS    LFE79           ; 2
LFE49:
    BMI    LFE7B           ; 2
LFE4B:
    BMI    LFE5D           ; 2
LFE4D:
    BPL    LFE5F           ; 2
LFE4F:
    BPL    LFE61           ; 2
LFE51:
    BPL    LFE63           ; 2
LFE53:
    BPL    LFE85           ; 2
LFE55:
    BMI    LFE87           ; 2
LFE57:
    BMI    LFE69           ; 2
    BPL    LFE6B           ; 2
    BPL    LFECD           ; 2
LFE5D:
    BVS    LFECF           ; 2
LFE5F:
    BVS    LFED1           ; 2
LFE61:
    BVS    LFED3           ; 2
LFE63:
    BVS    LFE95           ; 2
    BMI    LFE97           ; 2
    BMI    LFE79           ; 2
LFE69:
    BPL    LFE7B           ; 2
LFE6B:
    BPL    LFE9D           ; 2
LFE6D:
    BMI    LFE9F           ; 2
LFE6F:
    BMI    LFEA1           ; 2
    BMI    LFEA3           ; 2
    BMI    LFEE5           ; 2
    BVS    LFEE7           ; 2
    BVS    LFE69           ; 2
LFE79:
    BEQ    LFE6B           ; 2
LFE7B:
    BEQ    LFE6D           ; 2
LFE7D:
    BEQ    LFE6F           ; 2
LFE7F:
    BEQ    LFEF1           ; 2
    BVS    LFEF3           ; 2
    BVS    LFEB5           ; 2
LFE85:
    BMI    LFEB7           ; 2
LFE87:
    BMI    LFEB9           ; 2
    BMI    LFEBB           ; 2
    BMI    LFE9D           ; 2
    BPL    LFE9F           ; 2
    BPL    LFEC1           ; 2
LFE91:
    BMI    LFEC3           ; 2
LFE93:
    BMI    LFEA5           ; 2
LFE95:
    BPL    LFEA7           ; 2
LFE97:
    BPL    LFEC9           ; 2
    BMI    LFECB           ; 2
    BMI    LFECD           ; 2
LFE9D:
    BMI    LFECF           ; 2
LFE9F:
    BMI    LFF11           ; 2
LFEA1:
    BVS    LFF13           ; 2
LFEA3:
    BVS    LFF15           ; 2
LFEA5:
    BVS    LFF17           ; 2
LFEA7:
    BVS    LFED9           ; 2
LFEA9:
    BMI    LFEDB           ; 2
LFEAB:
    BMI    LFEBD           ; 2
    BPL    LFEBF           ; 2
    BPL    LFEC1           ; 2
    BPL    LFEC3           ; 2
    BPL    LFF25           ; 2
LFEB5:
    BVS    LFF27           ; 2
LFEB7:
    BVS    LFEA9           ; 2
LFEB9:
    BEQ    LFEAB           ; 2
LFEBB:
    BEQ    LFF2D           ; 2
LFEBD:
    BVS    LFF2F           ; 2
LFEBF:
    BVS    LFEF1           ; 2
LFEC1:
    BMI    LFEF3           ; 2
LFEC3:
    BMI    LFF35           ; 2
    BVS    LFF37           ; 2
    BVS    LFEF9           ; 2
LFEC9:
    BMI    LFEFB           ; 2
LFECB:
    BMI    LFEDD           ; 2
LFECD:
    BPL    LFEDF           ; 2
LFECF:
    BPL    LFEE1           ; 2
LFED1:
    BPL    LFEE3           ; 2
LFED3:
    BPL    LFF05           ; 2
LFED5:
    BMI    LFF07           ; 2
LFED7:
    BMI    LFF49           ; 2
LFED9:
    BVS    LFF4B           ; 2
LFEDB:
    BVS    LFECD           ; 2
LFEDD:
    BEQ    LFECF           ; 2
LFEDF:
    BEQ    LFF51           ; 2
LFEE1:
    BVS    LFF53           ; 2
LFEE3:
    BVS    LFED5           ; 2
LFEE5:
    BEQ    LFED7           ; 2
LFEE7:
    BEQ    LFF59           ; 2
    BVS    LFF5B           ; 2
    BVS    LFEFD           ; 2
    BPL    LFEFF           ; 2
    BPL    LFF21           ; 2
LFEF1:
    BMI    LFF23           ; 2
LFEF3:
    BMI    LFF05           ; 2
    BPL    LFF07           ; 2
    BPL    LFF09           ; 2
LFEF9:
    BPL    LFF0B           ; 2
LFEFB:
    BPL    LFF2D           ; 2
LFEFD:
    BMI    LFF2F           ; 2
LFEFF:
    BMI    LFF29           ; 2
    LDY    $41             ; 3
    BRK                    ; 7
    ASL    NUSIZ0          ; 5
LFF06:
    .byte $03 ;.SLO        ; 8
LFF07:
    BRK                    ; 7
LFF08:
    RTI                    ; 6

LFF09:
    BRK                    ; 7
LFF0A:
    .byte $80 ;.NOOP; 2
LFF0B:
    CPY    #$FF            ; 2
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
    .byte $FF ;.ISB        ; 7
LFF11:
    .byte $FF ;.ISB        ; 7
    .byte $1F ;.SLO        ; 7
LFF13:
    .byte $1F ;.SLO        ; 7
    BEQ    LFF06           ; 2
    BEQ    LFF08           ; 2
    BEQ    LFF0A           ; 2
    BRK                    ; 7
    BRK                    ; 7
    ROR    $5A5A,X         ; 7
    .byte $5A ;.NOOP; 2
    ROR    $7E00,X         ; 7
LFF23:
    BIT    HMBL            ; 3
LFF25:
    .byte $3C ;.NOOP; 4
    BIT    VSYNC           ; 3
    ROR    $7E18,X         ; 7
    .byte $42 ;.JAM        ; 0
    ROR    $7E00,X         ; 7
LFF2F:
    .byte $42 ;.JAM        ; 0
    ROR    $42             ; 5
    ROR    $4200,X         ; 7
LFF35:
    .byte $42 ;.JAM        ; 0
    ROR    $5A5A,X         ; 7
    BRK                    ; 7
    ROR    $7E42,X         ; 7
    CLC                    ; 2
    ROR    $7E00,X         ; 7
    .byte $5A ;.NOOP; 2
    ROR    $7E18,X         ; 7
    BRK                    ; 7
    CLC                    ; 2
    CLC                    ; 2
    BIT    $42             ; 3
    ROR    $7E00,X         ; 7
    .byte $5A ;.NOOP; 2
    ROR    $7E5A,X         ; 7
LFF51:
    BRK                    ; 7
    ROR    $7E42,X         ; 7
    .byte $5A ;.NOOP; 2
    ROR    $4F8F,X         ; 7
LFF59:
    .byte $2F ;.RLA        ; 6
    .byte $1F ;.SLO        ; 7
LFF5B:
    .byte $80 ;.NOOP; 2
    RTI                    ; 6

    BRK                    ; 7
    .byte $02 ;.JAM        ; 0
    ORA    ($7F,X)         ; 6
    .byte $BF ;.LAX        ; 4
    BRK                    ; 7
    SBC    $80FE,X         ; 4
    RTI                    ; 6

    JSR    $3010           ; 6
    BMI    LFF8C           ; 2
    BPL    LFF7E           ; 2
    JSR    $3C20           ; 6
    .byte $1F ;.SLO        ; 7
    .byte $1F ;.SLO        ; 7
    .byte $1F ;.SLO        ; 7
    .byte $3C ;.NOOP; 4
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    .byte $7C ;.NOOP; 4
    SED                    ; 2
    SED                    ; 2
    SED                    ; 2
    .byte $7C ;.NOOP; 4
    BRK                    ; 7
LFF7E:
    BRK                    ; 7
    BRK                    ; 7
    ROR    LFFFF,X         ; 7
    .byte $C3 ;.DCP        ; 8
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    .byte $C3 ;.DCP        ; 8
    .byte $FF ;.ISB        ; 7
LFF8A:
    .byte $FF ;.ISB        ; 7
    ROR.wx $0000,X         ; 7
    BRK                    ; 7
LFF8F:
    BRK                    ; 7
    BMI    LFF8A           ; 2
    .byte $FC ;.NOOP; 4
    ROL    $0C1E,X         ; 7
    BRK                    ; 7
    BRK                    ; 7
    .byte $0C ;.NOOP; 4
    .byte $1F ;.SLO        ; 7
    .byte $3F ;.RLA        ; 7
    ROR    $307C,X         ; 7
    BRK                    ; 7
    BRK                    ; 7
    .byte $0C ;.NOOP; 4
    ASL    LFC3E,X         ; 7
    SED                    ; 2
    BMI    LFFA7           ; 2
LFFA7:
    BRK                    ; 7
    BMI    $10026          ; 2
    ROR    $1F3F,X         ; 7
    .byte $0C ;.NOOP; 4
    BRK                    ; 7
    BRK                    ; 7
    .byte $17 ;.SLO        ; 6
    ORA    ($0B),Y         ; 5
    ORA    REFP0           ; 3
    .byte $17 ;.SLO        ; 6
    ORA    ($0B),Y         ; 5
    ORA    REFP0           ; 3
    .byte $17 ;.SLO        ; 6
    ORA    ($0B),Y         ; 5
    ORA    REFP0           ; 3
    .byte $17 ;.SLO        ; 6
    ORA    ($0B),Y         ; 5
    ORA    REFP0           ; 3
    .byte $17 ;.SLO        ; 6
    ORA    ($0B),Y         ; 5
    ASL    $603D,X         ; 7
    BRK                    ; 7
    SEC                    ; 2
    .byte $5F ;.SRE        ; 7
    .byte $0C ;.NOOP; 4
    .byte $07 ;.SLO        ; 5
    .byte $04 ;.NOOP; 3
    ORA    ($3C,X)         ; 6
    BRK                    ; 7
    BRK                    ; 7
    .byte $1F ;.SLO        ; 7
    BRK                    ; 7
    ORA    ($03,X)         ; 6
    .byte $07 ;.SLO        ; 5
    PHP                    ; 3
    RTI                    ; 6

    EOR    ($43,X)         ; 6
    .byte $47 ;.SRE        ; 5
    PHA                    ; 3
    .byte $80 ;.NOOP; 2
    STA    ($83,X)         ; 6
    .byte $87 ;.SAX        ; 3
    DEY                    ; 2
    CPY    #$C1            ; 2
    .byte $C3 ;.DCP        ; 8
    .byte $C7 ;.DCP        ; 5
    INY                    ; 2
    CPX    #$E1            ; 2
    .byte $E3 ;.ISB        ; 8
    .byte $13 ;.SLO        ; 8
    .byte $0B ;.ANC        ; 2
    .byte $1B ;.SLO        ; 7
    .byte $23 ;.RLA        ; 8
    .byte $2B ;.ANC        ; 2
    .byte $33 ;.RLA        ; 8
    TXS                    ; 2
    LDX    #$92            ; 2
    TXA                    ; 2
    .byte $82 ;.NOOP; 2
    .byte $7A ;.NOOP; 2
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BRK                    ; 7
    BEQ    LFFFF           ; 2
LFFFF:
    .byte $F0
