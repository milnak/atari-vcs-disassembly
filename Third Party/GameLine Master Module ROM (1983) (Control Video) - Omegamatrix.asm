; Disassembly of game.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcgame.cfg game.bin 
;
; game.cfg contents:
;
;      ORG 1000
;      CODE 1000 1002
;      GFX 1003 1008
;      CODE 1009 1442
;      GFX 1443 146C
;      CODE 146D 15F5
;      GFX 15F6 1623
;      CODE 1624 17C4
;      GFX 17C5 17D0
;      CODE 17D1 17F6
;      GFX 17F7 1C69
;      CODE 1C6A 1C99
;      GFX 1C9A 1CA1
;      CODE 1CA2 1CD1
;      GFX 1CD2 1CE3
;      CODE 1CE4 1E1F
;      GFX 1E20 1ECF
;      CODE 1ED0 1F61
;      GFX 1F62 1F87
;      CODE 1F88 1FFB
;      GFX 1FFC 1FFF

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
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
HMP0    =  $20
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
SWCHA   =  $0280
SWCHB   =  $0282
TIM8T   =  $0295
TIM64T  =  $0296
T1024T  =  $0297
L12DC   =   $12DC
L14B9   =   $14B9
L14D5   =   $14D5
L14E0   =   $14E0
L1533   =   $1533
L17F1   =   $17F1
L1FDA   =   $1FDA
L1FF8   =   $1FF8

       ORG $1000
L1000:
    JMP    L1009           ; 3
    .byte $06 ; |     XX | $1003
    .byte $11 ; |   X   X| $1004
    .byte $9A ; |X  XX X | $1005
    .byte $13 ; |   X  XX| $1006
    .byte $D8 ; |XX XX   | $1007
    .byte $15 ; |   X X X| $1008
L1009:
    LDA    #$00            ; 2
    TAX                    ; 2
L100C:
    STA    VSYNC,X         ; 4
    TXS                    ; 2
    INX                    ; 2
    BNE    L100C           ; 2
    LDX    #$01            ; 2
    STX    $80             ; 3
    INX                    ; 2
    STX    $81             ; 3
    LDX    #$04            ; 2
    STX    $82             ; 3
    LDX    #$0D            ; 2
    STX    $83             ; 3
    LDA    $0980           ; 4
    LDA    $0884           ; 4
    JSR    L1CA2           ; 6
    BNE    L1034           ; 2
    LDA    $0885           ; 4
    JSR    L1CA2           ; 6
    BEQ    L1051           ; 2
L1034:
    LDA    $08A4           ; 4
    LDX    #$00            ; 2
    STX    L1802           ; 4
    LDA    $08A5           ; 4
    STX    L1802           ; 4
    LDA    #$00            ; 2
    STA    $83             ; 3
    LDA    #$FF            ; 2
    STA    $B6             ; 3
    LDA    #$00            ; 2
    LDX    #$1C            ; 2
    JMP    L1106           ; 3
L1051:
    LDA    $0884           ; 4
    LDA    L1808           ; 4
    LDX    L1809           ; 4
    JMP    L1106           ; 3
L105D:
    STA    WSYNC           ; 3
    LDX    #$05            ; 2
L1061:
    DEX                    ; 2
    BNE    L1061           ; 2
    NOP                    ; 2
    NOP                    ; 2
    LDA    #$F0            ; 2
    STA    HMP0            ; 3
    STA    RESP0           ; 3
    STA    RESP1           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #$03            ; 2
    STA    NUSIZ0          ; 3
    LDA    #$03            ; 2
    STA    NUSIZ1          ; 3
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    STA    HMCLR           ; 3
    RTS                    ; 6

L1081:
    STA    GRP0            ; 3
    LDA    ($91),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($93),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($95),Y         ; 5
    TAX                    ; 2
    LDA    ($97),Y         ; 5
    LDY    $8C             ; 3
    STX    GRP1            ; 3
    STA    GRP0            ; 3
    STY    GRP1            ; 3
    STA    GRP0            ; 3
    INC    $86             ; 5
L109C:
    LDY    $86             ; 3
    LDA    ($99),Y         ; 5
    STA    $8C             ; 3
    LDA    ($8F),Y         ; 5
    STA    WSYNC           ; 3
    CPY    $87             ; 3
    BNE    L1081           ; 2
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    GRP0            ; 3
    RTS                    ; 6

L10B3:
    LDX    #$00            ; 2
    LDA    #$00            ; 2
    LDY    #$1C            ; 2
L10B9:
    STA    $8F,X           ; 4
    INX                    ; 2
    STY    $8F,X           ; 4
    EOR    #$80            ; 2
    BMI    L10C3           ; 2
    INY                    ; 2
L10C3:
    INX                    ; 2
    CPX    #$0C            ; 2
    BNE    L10B9           ; 2
    RTS                    ; 6

L10C9:
    LDA    $0583           ; 4
    LDA    #$00            ; 2
    LDX    #$14            ; 2
    JMP    L10DC           ; 3
L10D3:
    LDA    $0885           ; 4
    LDA    L1808           ; 4
    LDX    L1809           ; 4
L10DC:
    STA    $AD             ; 3
    STX    $AE             ; 3
    JSR    L10F7           ; 6
L10E3:
    STX    $DE             ; 3
    LDX    $81             ; 3
    LDA    $0580,X         ; 4
    LDX    $82             ; 3
    LDA    $0880,X         ; 4
    LDX    $83             ; 3
    LDA    $0980,X         ; 4
    LDX    $DE             ; 3
    RTS                    ; 6

L10F7:
    JMP.ind ($00AD)        ; 5
L10FA:
    LDA    $0884           ; 4
    LDA    L1806           ; 4
    LDX    L1807           ; 4
    JMP    L10DC           ; 3
L1106:
    STA    $AB             ; 3
    STX    $AC             ; 3
    JSR    L10E3           ; 6
    LDA    #$00            ; 2
    STA    $AF             ; 3
    STA    $8E             ; 3
    STA    $D2             ; 3
    LDA    #$28            ; 2
    STA    $8D             ; 3
    LDA    #$01            ; 2
    STA    CTRLPF          ; 3
    LDA    #$0A            ; 2
    STA    $A4             ; 3
    STA    $9B             ; 3
L1123:
    JSR    L12BF           ; 6
    LDY    #$08            ; 2
    LDA    ($AB),Y         ; 5
    STA    TIM64T          ; 4
    LDA    $AF             ; 3
    BEQ    L1134           ; 2
    JMP    L11B6           ; 3
L1134:
    LDA    #$12            ; 2
    STA    T1024T          ; 4
    LDX    #$FF            ; 2
    STX    $9C             ; 3
    INX                    ; 2
    STX    $9F             ; 3
    INX                    ; 2
    STX    $9D             ; 3
    STX    $9E             ; 3
    LDY    #$00            ; 2
    LDA    ($AB),Y         ; 5
    STA    $AF             ; 3
    JSR    L105D           ; 6
    LDY    #$0A            ; 2
    LDA    ($AB),Y         ; 5
    STA    $B0             ; 3
    LDY    #$02            ; 2
    LDA    ($AB),Y         ; 5
    BEQ    L1178           ; 2
    STA    $C6             ; 3
    INY                    ; 2
    LDA    ($AB),Y         ; 5
    STA    $BB             ; 3
    INY                    ; 2
    LDA    ($AB),Y         ; 5
    STA    $C0             ; 3
    INY                    ; 2
    LDA    ($AB),Y         ; 5
    JSR    L131A           ; 6
    STA    $C1             ; 3
    LDA    $0580,X         ; 4
    LDA    #$06            ; 2
    STA    $BA             ; 3
    JSR    L10D3           ; 6
L1178:
    LDY    #$0E            ; 2
    LDA    ($AB),Y         ; 5
    TAX                    ; 2
    INY                    ; 2
    LDA    ($AB),Y         ; 5
    BEQ    L118F           ; 2
    STX    $B4             ; 3
    JSR    L131A           ; 6
    STA    $B5             ; 3
    STX    $B6             ; 3
    LDA    #$01            ; 2
    STA    $B7             ; 3
L118F:
    LDY    #$10            ; 2
    LDA    ($AB),Y         ; 5
    TAX                    ; 2
    INY                    ; 2
    LDA    ($AB),Y         ; 5
    BEQ    L11A0           ; 2
    STA    $AE             ; 3
    STX    $AD             ; 3
    JSR    L11B3           ; 6
L11A0:
    LDY    #$01            ; 2
    LDA    ($AB),Y         ; 5
    STA    $D2             ; 3
    STA    $B1             ; 3
    JSR    L130A           ; 6
    LDA    #$02            ; 2
    STA    TIM64T          ; 4
    JMP    L12A6           ; 3
L11B3:
    JMP.ind ($00AD)        ; 5
L11B6:
    LDY    #$09            ; 2
    LDA    ($AB),Y         ; 5
    TAX                    ; 2
    JSR    L130A           ; 6
    STX    TIM64T          ; 4
    BIT    $AF             ; 3
    BPL    L11CB           ; 2
    BVS    L11CB           ; 2
    LDA    #$FF            ; 2
    STA    PF2             ; 3
L11CB:
    LDA    #$00            ; 2
    STA    $B3             ; 3
    LDY    #$0B            ; 2
    LDA    ($AB),Y         ; 5
    BEQ    L11D9           ; 2
    TAX                    ; 2
    JSR    L1314           ; 6
L11D9:
    ASL                    ; 2
    STA    $8B             ; 3
    LDY    #$14            ; 2
    STY    $84             ; 3
L11E0:
    JSR    L1326           ; 6
    LDA    $85             ; 3
    BMI    L122A           ; 2
    BEQ    L11F5           ; 2
    CPY    $D2             ; 3
    BNE    L11F5           ; 2
    PHA                    ; 3
    PLA                    ; 4
    PHA                    ; 3
    PLA                    ; 4
    LDA    #$FE            ; 2
    STA    PF1             ; 3
L11F5:
    LDA    $87             ; 3
    CLC                    ; 2
    ADC    $8B             ; 3
    ADC    #$02            ; 2
    CMP    $B0             ; 3
    BCS    L1271           ; 2
    STA    $8B             ; 3
    LDA    $87             ; 3
    CLC                    ; 2
    ADC    $86             ; 3
    STA    $87             ; 3
    JSR    L109C           ; 6
    LDA    #$00            ; 2
    STA    PF1             ; 3
L1210:
    LDA    $88             ; 3
    BEQ    L1227           ; 2
    TAX                    ; 2
    CLC                    ; 2
    ADC    $8B             ; 3
    CMP    $B0             ; 3
    BCS    L1271           ; 2
    STA    $8B             ; 3
    JSR    L1314           ; 6
    JSR    L10B3           ; 6
    JSR    L10E3           ; 6
L1227:
    JMP    L11E0           ; 3
L122A:
    ASL                    ; 2
    BMI    L123C           ; 2
    LDA    $0880           ; 4
    JSR    L192B           ; 6
    JSR    L10E3           ; 6
    JSR    L105D           ; 6
    JMP    L1210           ; 3
L123C:
    ASL                    ; 2
    BMI    L1261           ; 2
    LDY    #$06            ; 2
    LDA    ($AB),Y         ; 5
    STA    $AD             ; 3
    INY                    ; 2
    LDA    ($AB),Y         ; 5
    STA    $AE             ; 3
    LDY    #$00            ; 2
L124C:
    LDA    ($AD),Y         ; 5
    STA.wy $008F,Y         ; 5
    INY                    ; 2
    CPY    #$0C            ; 2
    BNE    L124C           ; 2
    JSR    L131A           ; 6
    STA    $9A             ; 3
    LDA    $0980,X         ; 4
    JMP    L11F5           ; 3
L1261:
    ASL                    ; 2
    BMI    L126D           ; 2
    JSR    L126A           ; 6
    JMP    L1210           ; 3
L126A:
    JMP.ind ($0086)        ; 5
L126D:
    LDA    #$FF            ; 2
    STA    $B2             ; 3
L1271:
    JSR    L130A           ; 6
    LDA    #$00            ; 2
    STA    PF2             ; 3
    LDY    #$08            ; 2
    LDA    ($AB),Y         ; 5
    INY                    ; 2
    CLC                    ; 2
    ADC    ($AB),Y         ; 5
    EOR    #$FF            ; 2
    ADC    #$20            ; 2
    STA    WSYNC           ; 3
    STA    TIM64T          ; 4
    LDY    #$12            ; 2
    LDA    ($AB),Y         ; 5
    STA    $AD             ; 3
    INY                    ; 2
    LDA    ($AB),Y         ; 5
    BEQ    L1299           ; 2
    STA    $AE             ; 3
    JSR    L11B3           ; 6
L1299:
    LDA    $D4             ; 3
    BNE    L12A3           ; 2
    INC    $D1             ; 5
    BNE    L12A3           ; 2
    INC    $D0             ; 5
L12A3:
    JSR    L1624           ; 6
L12A6:
    JSR    L130A           ; 6
    JMP    L1123           ; 3
L12AC:
    LDA    #$02            ; 2
    STA    WSYNC           ; 3
    STA    VBLANK          ; 3
    JSR    L1312           ; 6
    STA    VSYNC           ; 3
    LDA    #$00            ; 2
    JSR    L1312           ; 6
    STA    VSYNC           ; 3
    RTS                    ; 6

L12BF:
    JSR    L12AC           ; 6
    LDA    #$5A            ; 2
    STA    TIM8T           ; 4
    LDA    #$00            ; 2
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    BIT    $AF             ; 3
    BPL    L12EB           ; 2
    LDA    $8D             ; 3
    AND    #$F0            ; 2
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    BVS    L12E5           ; 2
    STA    COLUBK          ; 3
    LDA    $8D             ; 3
    STA    COLUPF          ; 3
    BVC    L12F7           ; 2
L12E5:
    LDA    $8D             ; 3
    STA    COLUBK          ; 3
    BVS    L12F7           ; 2
L12EB:
    BVC    L12F7           ; 2
    LDA    #$00            ; 2
    STA    COLUBK          ; 3
    LDA    #$1F            ; 2
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
L12F7:
    JSR    L10B3           ; 6
    LDX    $B6             ; 3
    BMI    L1304           ; 2
    LDA    $0980,X         ; 4
    JSR    L10FA           ; 6
L1304:
    JSR    L130A           ; 6
    STA    VBLANK          ; 3
    RTS                    ; 6

L130A:
    LDA    TIM8T           ; 4
    BPL    L130A           ; 2
L130F:
    STA    WSYNC           ; 3
    RTS                    ; 6

L1312:
    LDX    #$03            ; 2
L1314:
    STA    WSYNC           ; 3
    DEX                    ; 2
    BNE    L1314           ; 2
    RTS                    ; 6

L131A:
    PHA                    ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAX                    ; 2
    PLA                    ; 4
    AND    #$0F            ; 2
    ORA    #$10            ; 2
    RTS                    ; 6

L1326:
    LDX    #$00            ; 2
    LDY    $84             ; 3
    LDA    ($AB),Y         ; 5
    BMI    L133A           ; 2
    BEQ    L133A           ; 2
    LDA    $B3             ; 3
    BNE    L133A           ; 2
    LDY    $B1             ; 3
    STY    $84             ; 3
    STY    $B3             ; 3
L133A:
    LDA    ($AB),Y         ; 5
    STA    $85,X           ; 4
    INY                    ; 2
    INX                    ; 2
    CPX    #$06            ; 2
    BNE    L133A           ; 2
    LDA    $84             ; 3
    STY    $84             ; 3
    STY    $B2             ; 3
    TAY                    ; 2
    RTS                    ; 6

L134C:
    LDY    $BC             ; 3
    BNE    L135A           ; 2
    DEY                    ; 2
    STY    $BF             ; 3
    STY    $C4             ; 3
    INC    $BC             ; 5
    JMP    L137A           ; 3
L135A:
    INY                    ; 2
    STY    $BC             ; 3
    CPY    #$0A            ; 2
    BEQ    L1393           ; 2
    LDY    #$00            ; 2
    STY    $BE             ; 3
    INC    $C4             ; 5
    LDA    $C4             ; 3
    CMP    #$02            ; 2
    BNE    L137A           ; 2
    DEY                    ; 2
    STY    $C4             ; 3
    INC    $BF             ; 5
    LDA    $BF             ; 3
    CMP    #$01            ; 2
    BNE    L137A           ; 2
    STY    $BF             ; 3
L137A:
    LDA    $0885           ; 4
    LDA    L1802           ; 4
    BNE    L1392           ; 2
    LDA    $08A5           ; 4
    LDA    $BF             ; 3
    STA    L180C           ; 4
    LDA    $C4             ; 3
    STA    L180D           ; 4
    LDA    $0885           ; 4
L1392:
    RTS                    ; 6

L1393:
    LDA    #$00            ; 2
    STA    $BC             ; 3
    JMP    L1034           ; 3
L139A:
    LDA    #$00            ; 2
    STA    $BC             ; 3
    STA    $BE             ; 3
    JSR    L146D           ; 6
L13A3:
    LDX    #$00            ; 2
    STX    $8E             ; 3
    DEX                    ; 2
    STX    $BB             ; 3
    LDA    $DF             ; 3
    BEQ    L13B1           ; 2
    JMP    L15D8           ; 3
L13B1:
    JSR    L105D           ; 6
    LDX    #$00            ; 2
    LDY    #$14            ; 2
    LDA    #$43            ; 2
L13BA:
    STA    $8F,X           ; 4
    INX                    ; 2
    STY    $8F,X           ; 4
    INX                    ; 2
    CLC                    ; 2
    ADC    #$07            ; 2
    BCC    L13C6           ; 2
    INY                    ; 2
L13C6:
    CPX    #$0C            ; 2
    BNE    L13BA           ; 2
L13CA:
    JSR    L12AC           ; 6
    LDA    REFP1           ; 3
    AND    PF0             ; 3
    AND    #$80            ; 2
    BNE    L13D7           ; 2
    STA    $DF             ; 3
L13D7:
    LDX    #$0A            ; 2
    JSR    L1314           ; 6
    LDA    #$00            ; 2
    STA    VBLANK          ; 3
    LDX    #$0F            ; 2
    JSR    L1314           ; 6
    JSR    L1400           ; 6
    LDA    #$00            ; 2
    STA    $86             ; 3
    LDA    #$07            ; 2
    STA    $87             ; 3
    JSR    L109C           ; 6
    JSR    L1435           ; 6
    LDX    #$0C            ; 2
    JSR    L1314           ; 6
    INC    $8E             ; 5
    JMP    L13CA           ; 3
L1400:
    LDA    $8E             ; 3
    AND    #$E0            ; 2
    CLC                    ; 2
    ADC    #$10            ; 2
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    CLC                    ; 2
    ADC    #$02            ; 2
    STA    $8D             ; 3
L1410:
    JSR    L141D           ; 6
    CLC                    ; 2
    ADC    #$02            ; 2
    STA    $8D             ; 3
    AND    #$0F            ; 2
    BNE    L1410           ; 2
    RTS                    ; 6

L141D:
    LDA    $8D             ; 3
    STA    WSYNC           ; 3
    STA    COLUBK          ; 3
    PHA                    ; 3
    STA    WSYNC           ; 3
    LDX    #$7B            ; 2
    STX    TIM8T           ; 4
    JSR    L147B           ; 6
L142E:
    LDX    TIM8T           ; 4
    BPL    L142E           ; 2
    PLA                    ; 4
    RTS                    ; 6

L1435:
    DEC    $8D             ; 5
    DEC    $8D             ; 5
    JSR    L141D           ; 6
    AND    #$0F            ; 2
    CMP    #$02            ; 2
    BNE    L1435           ; 2
    RTS                    ; 6

    .byte $00 ; |        | $1443
    .byte $00 ; |        | $1444
    .byte $00 ; |        | $1445
    .byte $00 ; |        | $1446
    .byte $00 ; |        | $1447
    .byte $00 ; |        | $1448
    .byte $00 ; |        | $1449
    .byte $3B ; |  XXX XX| $144A
    .byte $2A ; |  X X X | $144B
    .byte $22 ; |  X   X | $144C
    .byte $22 ; |  X   X | $144D
    .byte $23 ; |  X   XX| $144E
    .byte $2A ; |  X X X | $144F
    .byte $3A ; |  XXX X | $1450
    .byte $A2 ; |X X   X | $1451
    .byte $A2 ; |X X   X | $1452
    .byte $A2 ; |X X   X | $1453
    .byte $A2 ; |X X   X | $1454
    .byte $A2 ; |X X   X | $1455
    .byte $A2 ; |X X   X | $1456
    .byte $BB ; |X XXX XX| $1457
    .byte $3A ; |  XXX X | $1458
    .byte $12 ; |   X  X | $1459
    .byte $13 ; |   X  XX| $145A
    .byte $12 ; |   X  X | $145B
    .byte $12 ; |   X  X | $145C
    .byte $12 ; |   X  X | $145D
    .byte $BA ; |X XXX X | $145E
    .byte $5C ; | X XXX  | $145F
    .byte $54 ; | X X X  | $1460
    .byte $50 ; | X X    | $1461
    .byte $D4 ; |XX X X  | $1462
    .byte $54 ; | X X X  | $1463
    .byte $54 ; | X X X  | $1464
    .byte $5C ; | X XXX  | $1465
    .byte $00 ; |        | $1466
    .byte $00 ; |        | $1467
    .byte $00 ; |        | $1468
    .byte $00 ; |        | $1469
    .byte $00 ; |        | $146A
    .byte $00 ; |        | $146B
    .byte $00 ; |        | $146C
L146D:
    LDA    $0885           ; 4
    LDA    L180C           ; 4
    STA    $BF             ; 3
    LDA    L180D           ; 4
    STA    $C4             ; 3
    RTS                    ; 6

L147B:
    LDA    $DF             ; 3
    BNE    L149D           ; 2
    LDA    $BB             ; 3
    BMI    L14AF           ; 2
    DEC    $C0             ; 5
    BNE    L148D           ; 2
    LDA    $C1             ; 3
    BEQ    L149E           ; 2
    DEC    $C1             ; 5
L148D:
    LDA    $BB             ; 3
    CMP    #$04            ; 2
    BNE    L1496           ; 2
    JMP    L15B5           ; 3
L1496:
    CMP    #$05            ; 2
    BNE    L149D           ; 2
    JMP    L15C4           ; 3
L149D:
    RTS                    ; 6

L149E:
    LDA    $BB             ; 3
    ASL                    ; 2
    TAY                    ; 2
    LDA    L1604,Y         ; 4
    STA    $AD             ; 3
    LDA    L1605,Y         ; 4
    STA    $AE             ; 3
    JMP.ind ($00AD)        ; 5
L14AF:
    LDA    $0CB8           ; 4
    LDA    #$90            ; 2
    STA    $C0             ; 3
    LDA    #$06            ; 2
    STA    $C1             ; 3
    LDA    #$00            ; 2
    STA    $BB             ; 3
    LDA    #$00            ; 2
    STA    $BD             ; 3
L14C2:
    LDX    $BE             ; 3
    LDA    L1812,X         ; 4
    STA    $C2             ; 3
    LDA    L1813,X         ; 4
    STA    $C3             ; 3
    BPL    L14D6           ; 2
    JSR    L134C           ; 6
    JMP    L14C2           ; 3
L14D6:
    INC    $BE             ; 5
    INC    $BE             ; 5
    RTS                    ; 6

L14DB:
    LDY    $BD             ; 3
    LDA    ($C2),Y         ; 5
    CMP    #$0F            ; 2
    BNE    L14ED           ; 2
    LDY    #$04            ; 2
    LDX    L180E           ; 4
    LDA    #$00            ; 2
    JMP    L15AE           ; 3
L14ED:
    CMP    #$0E            ; 2
    BNE    L14FC           ; 2
    LDA    #$48            ; 2
    STA    $C0             ; 3
    LDA    #$03            ; 2
    STA    $C1             ; 3
    INC    $BD             ; 5
    RTS                    ; 6

L14FC:
    CMP    #$0D            ; 2
    BNE    L1510           ; 2
    LDA    $BF             ; 3
    BMI    L150B           ; 2
    LDA    #$01            ; 2
    STA    $DE             ; 3
    JMP    L152C           ; 3
L150B:
    INC    $BD             ; 5
    JMP    L14DB           ; 3
L1510:
    CMP    #$0C            ; 2
    BNE    L1521           ; 2
    LDA    $BF             ; 3
    BMI    L150B           ; 2
    BEQ    L150B           ; 2
    LDA    $DE             ; 3
    INC    $DE             ; 5
    JMP    L152C           ; 3
L1521:
    CMP    #$0B            ; 2
    BNE    L152C           ; 2
    INC    $DF             ; 5
    INC    $BD             ; 5
    INC    $C0             ; 5
    RTS                    ; 6

L152C:
    LDY    $C4             ; 3
    BMI    L154F           ; 2
    CMP    #$00            ; 2
    BNE    L1536           ; 2
    LDA    #$0A            ; 2
L1536:
    STA    $BA             ; 3
L1538:
    LDA    $0CB0           ; 4
    LDA    #$0C            ; 2
    STA    AUDC0           ; 3
    LDA    #$1F            ; 2
    STA    AUDF1           ; 3
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
    LDA    L1612,Y         ; 4
    LDY    #$01            ; 2
    JMP    L15B0           ; 3
L154F:
    TAY                    ; 2
    ASL                    ; 2
    ADC    #$0A            ; 2
    STA    AUDF0           ; 3
    LDA    #$04            ; 2
    STA    AUDC0           ; 3
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
    LDA    L161A,Y         ; 4
    TAY                    ; 2
    LDA    $0D80,Y         ; 4
    LDA    #$34            ; 2
    LDY    #$03            ; 2
    JMP    L15B0           ; 3
    LDA    $0CB8           ; 4
    LDA    #$00            ; 2
    STA    AUDV0           ; 3
    LDY    $C4             ; 3
    LDA    L1614,Y         ; 4
    LDY    #$02            ; 2
    JMP    L15B0           ; 3
    LDY    $C4             ; 3
    DEC    $BA             ; 5
    BNE    L1538           ; 2
    LDY    $C4             ; 3
    LDA    L1616,Y         ; 4
    LDX    L1618,Y         ; 4
    LDY    #$00            ; 2
    INC    $BD             ; 5
    JMP    L15AE           ; 3
    LDA    $0D80           ; 4
    LDA    #$00            ; 2
    STA    AUDV0           ; 3
    LDA    #$34            ; 2
    LDY    #$00            ; 2
    INC    $BD             ; 5
    JMP    L15B0           ; 3
L15A1:
    LDA    $0CB0           ; 4
    LDA    #$00            ; 2
    STA    $DF             ; 3
    LDY    #$06            ; 2
    LDA    #$90            ; 2
    LDX    #$06            ; 2
L15AE:
    STX    $C1             ; 3
L15B0:
    STA    $C0             ; 3
    STY    $BB             ; 3
L15B4:
    RTS                    ; 6

L15B5:
    BIT    L1FF8           ; 4
    BVS    L15BB           ; 2
    RTS                    ; 6

L15BB:
    LDA    #$05            ; 2
    STA    $BB             ; 3
    LDA    #$C0            ; 2
    STA    $BD             ; 3
    RTS                    ; 6

L15C4:
    BIT    L1FF8           ; 4
    BVS    L15CE           ; 2
    LDA    #$04            ; 2
    STA    $BB             ; 3
    RTS                    ; 6

L15CE:
    DEC    $BD             ; 5
    BNE    L15B4           ; 2
    LDA    #$FF            ; 2
    STA    $BB             ; 3
    DEC    $DF             ; 5
L15D8:
    LDX    #$FF            ; 2
    TXS                    ; 2
    JSR    L10C9           ; 6
    JSR    L146D           ; 6
    LDA    #$00            ; 2
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    STA    AUDV0           ; 3
    JSR    L15A1           ; 6
    JMP    L13B1           ; 3
    LDA    #$FF            ; 2
    STA    $BB             ; 3
    RTS                    ; 6

    .byte $0D ; |    XX X| $15F6
    .byte $08 ; |    X   | $15F7
    .byte $00 ; |        | $15F8
    .byte $00 ; |        | $15F9
    .byte $03 ; |      XX| $15FA
    .byte $06 ; |     XX | $15FB
    .byte $08 ; |    X   | $15FC
    .byte $01 ; |       X| $15FD
    .byte $02 ; |      X | $15FE
    .byte $04 ; |     X  | $15FF
    .byte $02 ; |      X | $1600
    .byte $0F ; |    XXXX| $1601
    .byte $00 ; |        | $1602
    .byte $00 ; |        | $1603
L1604:
    .byte $DB ; |XX XX XX| $1604
L1605:
    .byte $14 ; |   X X  | $1605
    .byte $6B ; | XX X XX| $1606
    .byte $15 ; |   X X X| $1607
    .byte $7C ; | XXXXX  | $1608
    .byte $15 ; |   X X X| $1609
    .byte $91 ; |X  X   X| $160A
    .byte $15 ; |   X X X| $160B
    .byte $A1 ; |X X    X| $160C
    .byte $15 ; |   X X X| $160D
    .byte $A1 ; |X X    X| $160E
    .byte $15 ; |   X X X| $160F
    .byte $F1 ; |XXXX   X| $1610
    .byte $15 ; |   X X X| $1611
L1612:
    .byte $1A ; |   XX X | $1612
    .byte $34 ; |  XX X  | $1613
L1614:
    .byte $12 ; |   X  X | $1614
    .byte $24 ; |  X  X  | $1615
L1616:
    .byte $3B ; |  XXX XX| $1616
    .byte $76 ; | XXX XX | $1617
L1618:
    .byte $01 ; |       X| $1618
    .byte $02 ; |      X | $1619
L161A:
    .byte $17 ; |   X XXX| $161A
    .byte $10 ; |   X    | $161B
    .byte $14 ; |   X X  | $161C
    .byte $18 ; |   XX   | $161D
    .byte $11 ; |   X   X| $161E
    .byte $15 ; |   X X X| $161F
    .byte $19 ; |   XX  X| $1620
    .byte $12 ; |   X  X | $1621
    .byte $16 ; |   X XX | $1622
    .byte $1A ; |   XX X | $1623
L1624:
    DEC    $A5             ; 5
    BNE    L1633           ; 2
    LDA    $A6             ; 3
    BNE    L1631           ; 2
    LDX    #$0E            ; 2
    JMP    L16EB           ; 3
L1631:
    DEC    $A6             ; 5
L1633:
    LDA    $A4             ; 3
    BEQ    L163A           ; 2
    DEC    $A4             ; 5
L1639:
    RTS                    ; 6

L163A:
    LDA    REFP1           ; 3
    AND    PF0             ; 3
    AND    #$80            ; 2
    CMP    $A1             ; 3
    BNE    L1647           ; 2
    JMP    L16D2           ; 3
L1647:
    STA    $A1             ; 3
    ASL                    ; 2
    BCS    L1639           ; 2
    JSR    L17DC           ; 6
    JSR    L17E3           ; 6
    JSR    L17D1           ; 6
    BPL    L165E           ; 2
    BVC    L16A9           ; 2
    LDX    #$00            ; 2
    JMP    L16EB           ; 3
L165E:
    STA    $DE             ; 3
    JSR    L169E           ; 6
    LSR    $DE             ; 5
    BCC    L1672           ; 2
    BNE    L167D           ; 2
L1669:
    STA    $AC             ; 3
    STX    $AB             ; 3
    LDA    #$00            ; 2
    STA    $AF             ; 3
    RTS                    ; 6

L1672:
    LSR    $DE             ; 5
    BNE    L1688           ; 2
    STA    $AE             ; 3
    STX    $AD             ; 3
L167A:
    JMP.ind ($00AD)        ; 5
L167D:
    STA    $D3             ; 3
    STX    $D2             ; 3
    LDA    #$00            ; 2
    STA    $D4             ; 3
    JMP    L139A           ; 3
L1688:
    STA    $AE             ; 3
    STX    $AD             ; 3
    LDX    $A7             ; 3
    LDA    $A8             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ORA    $A9             ; 3
    CLC                    ; 2
    JSR    L167A           ; 6
    BCC    L167D           ; 2
    BCS    L1669           ; 2
L169E:
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    INY                    ; 2
    LDA    ($AB),Y         ; 5
    TAX                    ; 2
    INY                    ; 2
    LDA    ($AB),Y         ; 5
    RTS                    ; 6

L16A9:
    TAY                    ; 2
    LDA    $9E             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ORA    $9D             ; 3
    TAX                    ; 2
    LDA    L17C5,X         ; 4
    BPL    L16BF           ; 2
    ASL                    ; 2
    BMI    L16CA           ; 2
    TYA                    ; 2
    LDY    $D2             ; 3
    JMP    L165E           ; 3
L16BF:
    LDX    $9F             ; 3
    CPX    #$03            ; 2
    BEQ    L16CF           ; 2
    STA    $A7,X           ; 4
    INC    $9F             ; 5
    RTS                    ; 6

L16CA:
    LDA    #$00            ; 2
    STA    $9F             ; 3
L16CE:
    RTS                    ; 6

L16CF:
    JMP    L17F0           ; 3
L16D2:
    LDA    SWCHB           ; 4
    AND    #$03            ; 2
    CMP    $A2             ; 3
    BEQ    L16FB           ; 2
    STA    $A2             ; 3
    JSR    L17DC           ; 6
    LSR                    ; 2
    BEQ    L16E9           ; 2
    BCS    L16CE           ; 2
    LDX    #$02            ; 2
    BNE    L16EB           ; 2
L16E9:
    LDX    #$04            ; 2
L16EB:
    LDY    #$0C            ; 2
    LDA    ($AB),Y         ; 5
    STA    $AD             ; 3
    INY                    ; 2
    LDA    ($AB),Y         ; 5
    BEQ    L1719           ; 2
    STA    $AE             ; 3
    JMP.ind ($00AD)        ; 5
L16FB:
    LDA    SWCHA           ; 4
    CMP    $A3             ; 3
    BEQ    L1719           ; 2
    STA    $A3             ; 3
    JSR    L17DC           ; 6
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    AND    $A3             ; 3
    ASL                    ; 2
    BCC    L177B           ; 2
    ASL                    ; 2
    BCC    L1790           ; 2
    ASL                    ; 2
    BCC    L171A           ; 2
    ASL                    ; 2
    BCC    L174F           ; 2
L1719:
    RTS                    ; 6

L171A:
    JSR    L17D1           ; 6
    BPL    L172F           ; 2
    BVC    L1726           ; 2
    LDX    #$0A            ; 2
    JMP    L16EB           ; 3
L1726:
    LDA    $9D             ; 3
    CMP    #$03            ; 2
    BEQ    L1719           ; 2
    INC    $9D             ; 5
    RTS                    ; 6

L172F:
    JSR    L17A3           ; 6
    BCC    L1719           ; 2
    STY    $D2             ; 3
    CPY    #$32            ; 2
    BMI    L1719           ; 2
    LDA    $B2             ; 3
    SEC                    ; 2
    SBC    $D2             ; 3
    CMP    #$0C            ; 2
    BEQ    L1745           ; 2
    BPL    L1719           ; 2
L1745:
    LDY    $B1             ; 3
    JSR    L17A3           ; 6
    BCC    L1719           ; 2
    STY    $B1             ; 3
    RTS                    ; 6

L174F:
    JSR    L17D1           ; 6
    BPL    L1762           ; 2
    BVC    L175B           ; 2
    LDX    #$0C            ; 2
    JMP    L16EB           ; 3
L175B:
    LDA    $9D             ; 3
    BEQ    L1719           ; 2
    DEC    $9D             ; 5
    RTS                    ; 6

L1762:
    JSR    L17B4           ; 6
    BCC    L1719           ; 2
    STY    $D2             ; 3
    TYA                    ; 2
    SEC                    ; 2
    SBC    $B1             ; 3
    CMP    #$06            ; 2
    BNE    L1719           ; 2
    LDY    $B1             ; 3
    JSR    L17B4           ; 6
    BCC    L1719           ; 2
    STY    $B1             ; 3
    RTS                    ; 6

L177B:
    JSR    L17D1           ; 6
    BPL    L178B           ; 2
    BVS    L178B           ; 2
    LDA    $9E             ; 3
    CMP    #$02            ; 2
    BEQ    L178A           ; 2
    INC    $9E             ; 5
L178A:
    RTS                    ; 6

L178B:
    LDX    #$06            ; 2
    JMP    L16EB           ; 3
L1790:
    JSR    L17D1           ; 6
    BPL    L179E           ; 2
    BVS    L179E           ; 2
    LDA    $9E             ; 3
    BEQ    L179D           ; 2
    DEC    $9E             ; 5
L179D:
    RTS                    ; 6

L179E:
    LDX    #$08            ; 2
    JMP    L16EB           ; 3
L17A3:
    LDA    ($AB),Y         ; 5
    BMI    L17B2           ; 2
L17A7:
    TYA                    ; 2
    CLC                    ; 2
    ADC    #$06            ; 2
    TAY                    ; 2
    LDA    ($AB),Y         ; 5
    BEQ    L17A7           ; 2
    BPL    L17C3           ; 2
L17B2:
    CLC                    ; 2
    RTS                    ; 6

L17B4:
    CPY    #$14            ; 2
    BEQ    L17B2           ; 2
    TYA                    ; 2
    SEC                    ; 2
    SBC    #$06            ; 2
    TAY                    ; 2
    LDA    ($AB),Y         ; 5
    BMI    L17B2           ; 2
    BEQ    L17B4           ; 2
L17C3:
    SEC                    ; 2
    RTS                    ; 6

L17C5:
    .byte $01 ; |       X| $17C5
    .byte $04 ; |     X  | $17C6
    .byte $07 ; |     XXX| $17C7
    .byte $C0 ; |XX      | $17C8
    .byte $02 ; |      X | $17C9
    .byte $05 ; |     X X| $17CA
    .byte $08 ; |    X   | $17CB
    .byte $00 ; |        | $17CC
    .byte $03 ; |      XX| $17CD
    .byte $06 ; |     XX | $17CE
    .byte $09 ; |    X  X| $17CF
    .byte $80 ; |X       | $17D0
L17D1:
    LDY    $D2             ; 3
    LDA    ($AB),Y         ; 5
    STA    $DE             ; 3
    AND    #$0F            ; 2
    BIT    $DE             ; 3
    RTS                    ; 6

L17DC:
    PHA                    ; 3
    LDA    #$05            ; 2
    STA    $A4             ; 3
    PLA                    ; 4
    RTS                    ; 6

L17E3:
    LDA    #$F7            ; 2
    LDX    #$17            ; 2
L17E7:
    STA    $B4             ; 3
    STX    $B5             ; 3
    LDA    #$01            ; 2
    STA    $B7             ; 3
    RTS                    ; 6

L17F0:
    LDA    #$FB            ; 2
    LDX    #$17            ; 2
    JMP    L17E7           ; 3
    .byte $86 ; |X    XX | $17F7
    .byte $C1 ; |XX     X| $17F8
    .byte $3F ; |  XXXXXX| $17F9
    .byte $88 ; |X   X   | $17FA
    .byte $86 ; |X    XX | $17FB
    .byte $C6 ; |XX   XX | $17FC
    .byte $9F ; |X  XXXXX| $17FD
    .byte $FE ; |XXXXXXX | $17FE
    .byte $88 ; |X   X   | $17FF
L1800:
    .byte $CC ; |XX  XX  | $1800
L1801:
    .byte $21 ; |  X    X| $1801
L1802:
    .byte $00 ; |        | $1802
    .byte $CD ; |XX  XX X| $1803
    .byte $3C ; |  XXXX  | $1804
    .byte $77 ; | XXX XXX| $1805
L1806:
    .byte $9F ; |X  XXXXX| $1806
L1807:
    .byte $8F ; |X   XXXX| $1807
L1808:
    .byte $A0 ; |X X     | $1808
L1809:
    .byte $00 ; |        | $1809
L180A:
    .byte $4B ; | X  X XX| $180A
L180B:
    .byte $25 ; |  X  X X| $180B
L180C:
    .byte $ED ; |XXX XX X| $180C
L180D:
    .byte $77 ; | XXX XXX| $180D
L180E:
    .byte $DB ; |XX XX XX| $180E
    .byte $C7 ; |XX   XXX| $180F
    .byte $98 ; |X  XX   | $1810
    .byte $C2 ; |XX    X | $1811
L1812:
    .byte $A6 ; |X X  XX | $1812
L1813:
    .byte $A7 ; |X X  XXX| $1813
    .byte $AE ; |X X XXX | $1814
    .byte $69 ; | XX X  X| $1815
    .byte $81 ; |X      X| $1816
    .byte $4B ; | X  X XX| $1817
    .byte $2D ; |  X XX X| $1818
    .byte $42 ; | X    X | $1819
    .byte $C2 ; |XX    X | $181A
    .byte $0C ; |    XX  | $181B
    .byte $33 ; |  XX  XX| $181C
    .byte $F6 ; |XXXX XX | $181D
    .byte $3C ; |  XXXX  | $181E
    .byte $9F ; |X  XXXXX| $181F
    .byte $E5 ; |XXX  X X| $1820
    .byte $9C ; |X  XXX  | $1821
    .byte $3D ; |  XXXX X| $1822
    .byte $05 ; |     X X| $1823
    .byte $20 ; |  X     | $1824
    .byte $0B ; |    X XX| $1825
    .byte $5F ; | X XXXXX| $1826
    .byte $D6 ; |XX X XX | $1827
    .byte $01 ; |       X| $1828
    .byte $01 ; |       X| $1829
    .byte $82 ; |X     X | $182A
    .byte $58 ; | X XX   | $182B
    .byte $6B ; | XX X XX| $182C
    .byte $FB ; |XXXXX XX| $182D
    .byte $93 ; |X  X  XX| $182E
    .byte $7B ; | XXXX XX| $182F
    .byte $73 ; | XXX  XX| $1830
    .byte $3B ; |  XXX XX| $1831
    .byte $F9 ; |XXXXX  X| $1832
    .byte $5E ; | X XXXX | $1833
    .byte $9B ; |X  XX XX| $1834
    .byte $60 ; | XX     | $1835
    .byte $64 ; | XX  X  | $1836
    .byte $0E ; |    XXX | $1837
    .byte $01 ; |       X| $1838
    .byte $02 ; |      X | $1839
    .byte $02 ; |      X | $183A
    .byte $11 ; |   X   X| $183B
    .byte $F8 ; |XXXXX   | $183C
    .byte $FB ; |XXXXX XX| $183D
    .byte $79 ; | XXXX  X| $183E
    .byte $FB ; |XXXXX XX| $183F
    .byte $15 ; |   X X X| $1840
    .byte $F3 ; |XXXX  XX| $1841
    .byte $0C ; |    XX  | $1842
    .byte $47 ; | X   XXX| $1843
    .byte $FC ; |XXXXXX  | $1844
    .byte $50 ; | X X    | $1845
    .byte $71 ; | XXX   X| $1846
    .byte $9C ; |X  XXX  | $1847
    .byte $EA ; |XXX X X | $1848
    .byte $80 ; |X       | $1849
    .byte $08 ; |    X   | $184A
    .byte $50 ; | X X    | $184B
    .byte $8D ; |X   XX X| $184C
    .byte $BA ; |X XXX X | $184D
    .byte $82 ; |X     X | $184E
    .byte $7F ; | XXXXXXX| $184F
    .byte $B0 ; |X XX    | $1850
    .byte $10 ; |   X    | $1851
    .byte $86 ; |X    XX | $1852
    .byte $DE ; |XX XXXX | $1853
    .byte $1F ; |   XXXXX| $1854
    .byte $DF ; |XX XXXXX| $1855
    .byte $49 ; | X  X  X| $1856
    .byte $AE ; |X X XXX | $1857
    .byte $80 ; |X       | $1858
    .byte $A2 ; |X X   X | $1859
    .byte $30 ; |  XX    | $185A
    .byte $29 ; |  X X  X| $185B
    .byte $7F ; | XXXXXXX| $185C
    .byte $A3 ; |X X   XX| $185D
    .byte $FE ; |XXXXXXX | $185E
    .byte $1B ; |   XX XX| $185F
    .byte $06 ; |     XX | $1860
    .byte $CE ; |XX  XXX | $1861
    .byte $E2 ; |XXX   X | $1862
    .byte $C8 ; |XX  X   | $1863
    .byte $17 ; |   X XXX| $1864
    .byte $A8 ; |X X X   | $1865
    .byte $C0 ; |XX      | $1866
    .byte $11 ; |   X   X| $1867
    .byte $05 ; |     X X| $1868
    .byte $60 ; | XX     | $1869
    .byte $76 ; | XXX XX | $186A
    .byte $09 ; |    X  X| $186B
    .byte $FE ; |XXXXXXX | $186C
    .byte $0F ; |    XXXX| $186D
    .byte $FF ; |XXXXXXXX| $186E
    .byte $9F ; |X  XXXXX| $186F
    .byte $6B ; | XX X XX| $1870
    .byte $7D ; | XXXXX X| $1871
    .byte $35 ; |  XX X X| $1872
    .byte $3A ; |  XXX X | $1873
    .byte $4E ; | X  XXX | $1874
    .byte $95 ; |X  X X X| $1875
    .byte $C1 ; |XX     X| $1876
    .byte $61 ; | XX    X| $1877
    .byte $00 ; |        | $1878
    .byte $00 ; |        | $1879
    .byte $0A ; |    X X | $187A
    .byte $57 ; | X X XXX| $187B
    .byte $81 ; |X      X| $187C
    .byte $D7 ; |XX X XXX| $187D
    .byte $EE ; |XXX XXX | $187E
    .byte $44 ; | X   X  | $187F
    .byte $FA ; |XXXXX X | $1880
    .byte $B2 ; |X XX  X | $1881
    .byte $94 ; |X  X X  | $1882
    .byte $36 ; |  XX XX | $1883
    .byte $8C ; |X   XX  | $1884
    .byte $F6 ; |XXXX XX | $1885
    .byte $DF ; |XX XXXXX| $1886
    .byte $84 ; |X    X  | $1887
    .byte $A0 ; |X X     | $1888
    .byte $15 ; |   X X X| $1889
    .byte $81 ; |X      X| $188A
    .byte $0F ; |    XXXX| $188B
    .byte $D0 ; |XX X    | $188C
    .byte $BF ; |X XXXXXX| $188D
    .byte $35 ; |  XX X X| $188E
    .byte $B7 ; |X XX XXX| $188F
    .byte $36 ; |  XX XX | $1890
    .byte $80 ; |X       | $1891
    .byte $AE ; |X X XXX | $1892
    .byte $95 ; |X  X X X| $1893
    .byte $9E ; |X  XXXX | $1894
    .byte $8D ; |X   XX X| $1895
    .byte $8F ; |X   XXXX| $1896
    .byte $51 ; | X X   X| $1897
    .byte $0A ; |    X X | $1898
    .byte $40 ; | X      | $1899
    .byte $AC ; |X X XX  | $189A
    .byte $00 ; |        | $189B
    .byte $4E ; | X  XXX | $189C
    .byte $E7 ; |XXX  XXX| $189D
    .byte $3C ; |  XXXX  | $189E
    .byte $FE ; |XXXXXXX | $189F
    .byte $DC ; |XX XXX  | $18A0
    .byte $F5 ; |XXXX X X| $18A1
    .byte $29 ; |  X X  X| $18A2
    .byte $DB ; |XX XX XX| $18A3
    .byte $35 ; |  XX X X| $18A4
    .byte $52 ; | X X  X | $18A5
    .byte $F5 ; |XXXX X X| $18A6
    .byte $C3 ; |XX    XX| $18A7
    .byte $C1 ; |XX     X| $18A8
    .byte $44 ; | X   X  | $18A9
    .byte $91 ; |X  X   X| $18AA
    .byte $72 ; | XXX  X | $18AB
    .byte $FD ; |XXXXXX X| $18AC
    .byte $9D ; |X  XXX X| $18AD
    .byte $F7 ; |XXXX XXX| $18AE
    .byte $9D ; |X  XXX X| $18AF
    .byte $80 ; |X       | $18B0
    .byte $C2 ; |XX    X | $18B1
    .byte $6F ; | XX XXXX| $18B2
    .byte $78 ; | XXXX   | $18B3
    .byte $0B ; |    X XX| $18B4
    .byte $C4 ; |XX   X  | $18B5
    .byte $32 ; |  XX  X | $18B6
    .byte $AB ; |X X X XX| $18B7
    .byte $00 ; |        | $18B8
    .byte $20 ; |  X     | $18B9
    .byte $82 ; |X     X | $18BA
    .byte $00 ; |        | $18BB
    .byte $D5 ; |XX X X X| $18BC
    .byte $DC ; |XX XXX  | $18BD
    .byte $DC ; |XX XXX  | $18BE
    .byte $E8 ; |XXX X   | $18BF
    .byte $30 ; |  XX    | $18C0
    .byte $51 ; | X X   X| $18C1
    .byte $50 ; | X X    | $18C2
    .byte $DC ; |XX XXX  | $18C3
    .byte $41 ; | X     X| $18C4
    .byte $E1 ; |XXX    X| $18C5
    .byte $6B ; | XX X XX| $18C6
    .byte $AB ; |X X X XX| $18C7
    .byte $56 ; | X X XX | $18C8
    .byte $31 ; |  XX   X| $18C9
    .byte $8F ; |X   XXXX| $18CA
    .byte $00 ; |        | $18CB
    .byte $FF ; |XXXXXXXX| $18CC
    .byte $F3 ; |XXXX  XX| $18CD
    .byte $FE ; |XXXXXXX | $18CE
    .byte $EE ; |XXX XXX | $18CF
    .byte $CF ; |XX  XXXX| $18D0
    .byte $65 ; | XX  X X| $18D1
    .byte $95 ; |X  X X X| $18D2
    .byte $F7 ; |XXXX XXX| $18D3
    .byte $59 ; | X XX  X| $18D4
    .byte $43 ; | X    XX| $18D5
    .byte $5F ; | X XXXXX| $18D6
    .byte $92 ; |X  X  X | $18D7
    .byte $32 ; |  XX  X | $18D8
    .byte $0A ; |    X X | $18D9
    .byte $99 ; |X  XX  X| $18DA
    .byte $41 ; | X     X| $18DB
    .byte $FF ; |XXXXXXXX| $18DC
    .byte $C5 ; |XX   X X| $18DD
    .byte $BF ; |X XXXXXX| $18DE
    .byte $CC ; |XX  XX  | $18DF
L18E0:
    .byte $CA ; |XX  X X | $18E0
    .byte $CA ; |XX  X X | $18E1
    .byte $56 ; | X X XX | $18E2
    .byte $9A ; |X  XX X | $18E3
    .byte $1D ; |   XXX X| $18E4
    .byte $91 ; |X  X   X| $18E5
    .byte $4B ; | X  X XX| $18E6
    .byte $10 ; |   X    | $18E7
    .byte $02 ; |      X | $18E8
    .byte $20 ; |  X     | $18E9
    .byte $4C ; | X  XX  | $18EA
    .byte $18 ; |   XX   | $18EB
    .byte $AB ; |X X X XX| $18EC
    .byte $AF ; |X X XXXX| $18ED
    .byte $4C ; | X  XX  | $18EE
    .byte $9C ; |X  XXX  | $18EF
    .byte $72 ; | XXX  X | $18F0
    .byte $A4 ; |X X  X  | $18F1
    .byte $0F ; |    XXXX| $18F2
    .byte $A4 ; |X X  X  | $18F3
    .byte $B0 ; |X XX    | $18F4
    .byte $7B ; | XXXX XX| $18F5
    .byte $CE ; |XX  XXX | $18F6
    .byte $47 ; | X   XXX| $18F7
    .byte $03 ; |      XX| $18F8
    .byte $31 ; |  XX   X| $18F9
    .byte $63 ; | XX   XX| $18FA
    .byte $35 ; |  XX X X| $18FB
    .byte $FF ; |XXXXXXXX| $18FC
    .byte $CD ; |XX  XX X| $18FD
    .byte $78 ; | XXXX   | $18FE
    .byte $DB ; |XX XX XX| $18FF
    .byte $F1 ; |XXXX   X| $1900
    .byte $06 ; |     XX | $1901
    .byte $18 ; |   XX   | $1902
    .byte $79 ; | XXXX  X| $1903
    .byte $E2 ; |XXX   X | $1904
    .byte $C5 ; |XX   X X| $1905
    .byte $C3 ; |XX    XX| $1906
    .byte $95 ; |X  X X X| $1907
    .byte $C4 ; |XX   X  | $1908
    .byte $61 ; | XX    X| $1909
    .byte $00 ; |        | $190A
    .byte $45 ; | X   X X| $190B
    .byte $DF ; |XX XXXXX| $190C
    .byte $8A ; |X   X X | $190D
    .byte $BD ; |X XXXX X| $190E
    .byte $F1 ; |XXXX   X| $190F
L1910:
    .byte $7A ; | XXXX X | $1910
    .byte $4A ; | X  X X | $1911
    .byte $95 ; |X  X X X| $1912
    .byte $BA ; |X XXX X | $1913
L1914:
    .byte $77 ; | XXX XXX| $1914
    .byte $A3 ; |X X   XX| $1915
    .byte $73 ; | XXX  XX| $1916
    .byte $B5 ; |X XX X X| $1917
    .byte $92 ; |X  X  X | $1918
    .byte $00 ; |        | $1919
    .byte $00 ; |        | $191A
    .byte $06 ; |     XX | $191B
    .byte $EC ; |XXX XX  | $191C
    .byte $64 ; | XX  X  | $191D
    .byte $FD ; |XXXXXX X| $191E
    .byte $8D ; |X   XX X| $191F
    .byte $B9 ; |X XXX  X| $1920
    .byte $4F ; | X  XXXX| $1921
    .byte $94 ; |X  X X  | $1922
    .byte $84 ; |X    X  | $1923
    .byte $93 ; |X  X  XX| $1924
    .byte $5F ; | X XXXXX| $1925
    .byte $73 ; | XXX  XX| $1926
    .byte $AB ; |X X X XX| $1927
    .byte $61 ; | XX    X| $1928
    .byte $B1 ; |X XX   X| $1929
    .byte $56 ; | X X XX | $192A
L192B:
    .byte $0B ; |    X XX| $192B
    .byte $FD ; |XXXXXX X| $192C
    .byte $38 ; |  XXX   | $192D
    .byte $BD ; |X XXXX X| $192E
    .byte $E9 ; |XXX X  X| $192F
    .byte $FA ; |XXXXX X | $1930
    .byte $44 ; | X   X  | $1931
    .byte $7F ; | XXXXXXX| $1932
    .byte $5F ; | X XXXXX| $1933
    .byte $7A ; | XXXX X | $1934
    .byte $DC ; |XX XXX  | $1935
    .byte $3D ; |  XXXX X| $1936
    .byte $F4 ; |XXXX X  | $1937
    .byte $F0 ; |XXXX    | $1938
    .byte $05 ; |     X X| $1939
    .byte $56 ; | X X XX | $193A
    .byte $43 ; | X    XX| $193B
    .byte $AD ; |X X XX X| $193C
    .byte $DC ; |XX XXX  | $193D
    .byte $7F ; | XXXXXXX| $193E
    .byte $E6 ; |XXX  XX | $193F
    .byte $97 ; |X  X XXX| $1940
    .byte $37 ; |  XX XXX| $1941
    .byte $42 ; | X    X | $1942
    .byte $63 ; | XX   XX| $1943
    .byte $11 ; |   X   X| $1944
    .byte $D2 ; |XX X  X | $1945
    .byte $B8 ; |X XXX   | $1946
    .byte $9A ; |X  XX X | $1947
    .byte $46 ; | X   XX | $1948
    .byte $11 ; |   X   X| $1949
    .byte $62 ; | XX   X | $194A
    .byte $03 ; |      XX| $194B
    .byte $C1 ; |XX     X| $194C
    .byte $76 ; | XXX XX | $194D
    .byte $DA ; |XX XX X | $194E
    .byte $F8 ; |XXXXX   | $194F
    .byte $9C ; |X  XXX  | $1950
    .byte $BE ; |X XXXXX | $1951
    .byte $4E ; | X  XXX | $1952
    .byte $1C ; |   XXX  | $1953
    .byte $E0 ; |XXX     | $1954
    .byte $A4 ; |X X  X  | $1955
    .byte $70 ; | XXX    | $1956
    .byte $7B ; | XXXX XX| $1957
    .byte $82 ; |X     X | $1958
    .byte $07 ; |     XXX| $1959
    .byte $04 ; |     X  | $195A
    .byte $23 ; |  X   XX| $195B
    .byte $B1 ; |X XX   X| $195C
    .byte $FD ; |XXXXXX X| $195D
    .byte $9F ; |X  XXXXX| $195E
    .byte $75 ; | XXX X X| $195F
    .byte $26 ; |  X  XX | $1960
    .byte $13 ; |   X  XX| $1961
    .byte $92 ; |X  X  X | $1962
    .byte $38 ; |  XXX   | $1963
    .byte $BB ; |X XXX XX| $1964
    .byte $E4 ; |XXX  X  | $1965
    .byte $18 ; |   XX   | $1966
    .byte $A3 ; |X X   XX| $1967
    .byte $B6 ; |X XX XX | $1968
    .byte $43 ; | X    XX| $1969
    .byte $01 ; |       X| $196A
    .byte $25 ; |  X  X X| $196B
    .byte $F5 ; |XXXX X X| $196C
    .byte $BF ; |X XXXXXX| $196D
    .byte $BA ; |X XXX X | $196E
    .byte $CB ; |XX  X XX| $196F
    .byte $E0 ; |XXX     | $1970
    .byte $70 ; | XXX    | $1971
    .byte $04 ; |     X  | $1972
    .byte $8E ; |X   XXX | $1973
    .byte $D7 ; |XX X XXX| $1974
    .byte $71 ; | XXX   X| $1975
    .byte $8F ; |X   XXXX| $1976
    .byte $CA ; |XX  X X | $1977
    .byte $E0 ; |XXX     | $1978
    .byte $00 ; |        | $1979
    .byte $41 ; | X     X| $197A
    .byte $06 ; |     XX | $197B
    .byte $FF ; |XXXXXXXX| $197C
    .byte $E9 ; |XXX X  X| $197D
    .byte $6F ; | XX XXXX| $197E
    .byte $92 ; |X  X  X | $197F
    .byte $EC ; |XXX XX  | $1980
    .byte $79 ; | XXXX  X| $1981
    .byte $65 ; | XX  X X| $1982
    .byte $D1 ; |XX X   X| $1983
    .byte $EB ; |XXX X XX| $1984
    .byte $02 ; |      X | $1985
    .byte $02 ; |      X | $1986
    .byte $B7 ; |X XX XXX| $1987
    .byte $01 ; |       X| $1988
    .byte $00 ; |        | $1989
    .byte $00 ; |        | $198A
    .byte $02 ; |      X | $198B
    .byte $BF ; |X XXXXXX| $198C
    .byte $BD ; |X XXXX X| $198D
    .byte $91 ; |X  X   X| $198E
    .byte $CF ; |XX  XXXX| $198F
    .byte $93 ; |X  X  XX| $1990
    .byte $1D ; |   XXX X| $1991
    .byte $53 ; | X X  XX| $1992
    .byte $60 ; | XX     | $1993
    .byte $89 ; |X   X  X| $1994
    .byte $98 ; |X  XX   | $1995
    .byte $32 ; |  XX  X | $1996
    .byte $55 ; | X X X X| $1997
    .byte $41 ; | X     X| $1998
    .byte $4A ; | X  X X | $1999
    .byte $2A ; |  X X X | $199A
    .byte $2B ; |  X X XX| $199B
    .byte $F2 ; |XXXX  X | $199C
    .byte $DB ; |XX XX XX| $199D
    .byte $DF ; |XX XXXXX| $199E
    .byte $BF ; |X XXXXXX| $199F
    .byte $B7 ; |X XX XXX| $19A0
    .byte $8E ; |X   XXX | $19A1
    .byte $5B ; | X XX XX| $19A2
    .byte $33 ; |  XX  XX| $19A3
    .byte $89 ; |X   X  X| $19A4
    .byte $B2 ; |X XX  X | $19A5
    .byte $F4 ; |XXXX X  | $19A6
L19A7:
    .byte $1E ; |   XXXX | $19A7
    .byte $91 ; |X  X   X| $19A8
    .byte $C3 ; |XX    XX| $19A9
    .byte $22 ; |  X   X | $19AA
    .byte $7C ; | XXXXX  | $19AB
    .byte $A8 ; |X X X   | $19AC
    .byte $E7 ; |XXX  XXX| $19AD
    .byte $9F ; |X  XXXXX| $19AE
    .byte $4F ; | X  XXXX| $19AF
    .byte $E7 ; |XXX  XXX| $19B0
    .byte $C2 ; |XX    X | $19B1
    .byte $E0 ; |XXX     | $19B2
L19B3:
    .byte $3F ; |  XXXXXX| $19B3
    .byte $07 ; |     XXX| $19B4
    .byte $0E ; |    XXX | $19B5
    .byte $B7 ; |X XX XXX| $19B6
    .byte $17 ; |   X XXX| $19B7
    .byte $44 ; | X   X  | $19B8
    .byte $32 ; |  XX  X | $19B9
    .byte $20 ; |  X     | $19BA
    .byte $04 ; |     X  | $19BB
    .byte $CE ; |XX  XXX | $19BC
    .byte $02 ; |      X | $19BD
    .byte $FA ; |XXXXX X | $19BE
    .byte $97 ; |X  X XXX| $19BF
    .byte $16 ; |   X XX | $19C0
    .byte $7A ; | XXXX X | $19C1
    .byte $E4 ; |XXX  X  | $19C2
    .byte $85 ; |X    X X| $19C3
    .byte $BC ; |X XXXX  | $19C4
    .byte $1E ; |   XXXX | $19C5
    .byte $01 ; |       X| $19C6
    .byte $98 ; |X  XX   | $19C7
    .byte $22 ; |  X   X | $19C8
    .byte $0E ; |    XXX | $19C9
    .byte $5F ; | X XXXXX| $19CA
    .byte $67 ; | XX  XXX| $19CB
    .byte $DF ; |XX XXXXX| $19CC
    .byte $ED ; |XXX XX X| $19CD
    .byte $90 ; |X  X    | $19CE
L19CF:
    .byte $EF ; |XXX XXXX| $19CF
    .byte $A6 ; |X X  XX | $19D0
    .byte $B2 ; |X XX  X | $19D1
    .byte $69 ; | XX X  X| $19D2
    .byte $63 ; | XX   XX| $19D3
    .byte $D8 ; |XX XX   | $19D4
    .byte $2E ; |  X XXX | $19D5
    .byte $90 ; |X  X    | $19D6
    .byte $9B ; |X  XX XX| $19D7
    .byte $D0 ; |XX X    | $19D8
    .byte $A2 ; |X X   X | $19D9
    .byte $83 ; |X     XX| $19DA
    .byte $14 ; |   X X  | $19DB
    .byte $AD ; |X X XX X| $19DC
    .byte $FF ; |XXXXXXXX| $19DD
    .byte $FB ; |XXXXX XX| $19DE
L19DF:
    .byte $FA ; |XXXXX X | $19DF
    .byte $E9 ; |XXX X  X| $19E0
    .byte $E8 ; |XXX X   | $19E1
    .byte $FB ; |XXXXX XX| $19E2
    .byte $49 ; | X  X  X| $19E3
    .byte $45 ; | X   X X| $19E4
    .byte $E1 ; |XXX    X| $19E5
    .byte $09 ; |    X  X| $19E6
    .byte $EA ; |XXX X X | $19E7
    .byte $50 ; | X X    | $19E8
    .byte $1E ; |   XXXX | $19E9
    .byte $03 ; |      XX| $19EA
    .byte $E6 ; |XXX  XX | $19EB
    .byte $FF ; |XXXXXXXX| $19EC
    .byte $E5 ; |XXX  X X| $19ED
    .byte $FB ; |XXXXX XX| $19EE
    .byte $F6 ; |XXXX XX | $19EF
    .byte $88 ; |X   X   | $19F0
    .byte $3D ; |  XXXX X| $19F1
    .byte $CA ; |XX  X X | $19F2
    .byte $B6 ; |X XX XX | $19F3
    .byte $6D ; | XX XX X| $19F4
L19F5:
    .byte $FD ; |XXXXXX X| $19F5
    .byte $B2 ; |X XX  X | $19F6
    .byte $A0 ; |X X     | $19F7
    .byte $18 ; |   XX   | $19F8
    .byte $40 ; | X      | $19F9
    .byte $C0 ; |XX      | $19FA
    .byte $2C ; |  X XX  | $19FB
    .byte $EB ; |XXX X XX| $19FC
    .byte $FC ; |XXXXXX  | $19FD
    .byte $B0 ; |X XX    | $19FE
    .byte $BF ; |X XXXXXX| $19FF
    .byte $01 ; |       X| $1A00
    .byte $51 ; | X X   X| $1A01
    .byte $07 ; |     XXX| $1A02
    .byte $A2 ; |X X   X | $1A03
    .byte $85 ; |X    X X| $1A04
    .byte $FD ; |XXXXXX X| $1A05
    .byte $FC ; |XXXXXX  | $1A06
    .byte $BA ; |X XXX X | $1A07
    .byte $B0 ; |X XX    | $1A08
    .byte $10 ; |   X    | $1A09
    .byte $14 ; |   X X  | $1A0A
    .byte $C3 ; |XX    XX| $1A0B
    .byte $C0 ; |XX      | $1A0C
    .byte $FD ; |XXXXXX X| $1A0D
    .byte $2F ; |  X XXXX| $1A0E
    .byte $97 ; |X  X XXX| $1A0F
    .byte $38 ; |  XXX   | $1A10
    .byte $18 ; |   XX   | $1A11
    .byte $0A ; |    X X | $1A12
    .byte $13 ; |   X  XX| $1A13
    .byte $5D ; | X XXX X| $1A14
    .byte $9E ; |X  XXXX | $1A15
    .byte $AF ; |X X XXXX| $1A16
    .byte $D3 ; |XX X  XX| $1A17
    .byte $39 ; |  XXX  X| $1A18
    .byte $36 ; |  XX XX | $1A19
    .byte $39 ; |  XXX  X| $1A1A
    .byte $09 ; |    X  X| $1A1B
    .byte $D2 ; |XX X  X | $1A1C
    .byte $3D ; |  XXXX X| $1A1D
    .byte $EF ; |XXX XXXX| $1A1E
    .byte $D8 ; |XX XX   | $1A1F
L1A20:
    .byte $AA ; |X X X X | $1A20
    .byte $27 ; |  X  XXX| $1A21
    .byte $20 ; |  X     | $1A22
    .byte $81 ; |X      X| $1A23
    .byte $1F ; |   XXXXX| $1A24
    .byte $FA ; |XXXXX X | $1A25
    .byte $BC ; |X XXXX  | $1A26
    .byte $F4 ; |XXXX X  | $1A27
    .byte $FC ; |XXXXXX  | $1A28
    .byte $00 ; |        | $1A29
    .byte $84 ; |X    X  | $1A2A
    .byte $B7 ; |X XX XXX| $1A2B
    .byte $F8 ; |XXXXX   | $1A2C
    .byte $0D ; |    XX X| $1A2D
    .byte $F6 ; |XXXX XX | $1A2E
    .byte $5F ; | X XXXXX| $1A2F
    .byte $00 ; |        | $1A30
    .byte $40 ; | X      | $1A31
    .byte $50 ; | X X    | $1A32
    .byte $2C ; |  X XX  | $1A33
    .byte $F3 ; |XXXX  XX| $1A34
    .byte $FD ; |XXXXXX X| $1A35
    .byte $FB ; |XXXXX XX| $1A36
    .byte $5D ; | X XXX X| $1A37
    .byte $8A ; |X   X X | $1A38
    .byte $6E ; | XX XXX | $1A39
    .byte $49 ; | X  X  X| $1A3A
    .byte $5F ; | X XXXXX| $1A3B
    .byte $99 ; |X  XX  X| $1A3C
    .byte $FB ; |XXXXX XX| $1A3D
    .byte $95 ; |X  X X X| $1A3E
    .byte $0A ; |    X X | $1A3F
    .byte $0E ; |    XXX | $1A40
    .byte $C0 ; |XX      | $1A41
    .byte $05 ; |     X X| $1A42
    .byte $04 ; |     X  | $1A43
    .byte $EF ; |XXX XXXX| $1A44
    .byte $FB ; |XXXXX XX| $1A45
    .byte $ED ; |XXX XX X| $1A46
    .byte $B8 ; |X XXX   | $1A47
    .byte $5C ; | X XXX  | $1A48
    .byte $3E ; |  XXXXX | $1A49
    .byte $85 ; |X    X X| $1A4A
    .byte $F4 ; |XXXX X  | $1A4B
    .byte $95 ; |X  X X X| $1A4C
    .byte $B8 ; |X XXX   | $1A4D
    .byte $F4 ; |XXXX X  | $1A4E
    .byte $AD ; |X X XX X| $1A4F
    .byte $04 ; |     X  | $1A50
    .byte $04 ; |     X  | $1A51
    .byte $91 ; |X  X   X| $1A52
    .byte $04 ; |     X  | $1A53
    .byte $1F ; |   XXXXX| $1A54
    .byte $F9 ; |XXXXX  X| $1A55
    .byte $5D ; | X XXX X| $1A56
    .byte $BE ; |X XXXXX | $1A57
    .byte $EB ; |XXX X XX| $1A58
    .byte $A7 ; |X X  XXX| $1A59
    .byte $9B ; |X  XX XX| $1A5A
    .byte $E6 ; |XXX  XX | $1A5B
    .byte $FA ; |XXXXX X | $1A5C
    .byte $E9 ; |XXX X  X| $1A5D
    .byte $EB ; |XXX X XX| $1A5E
    .byte $26 ; |  X  XX | $1A5F
    .byte $E5 ; |XXX  X X| $1A60
    .byte $7D ; | XXXXX X| $1A61
    .byte $19 ; |   XX  X| $1A62
    .byte $C3 ; |XX    XX| $1A63
    .byte $C7 ; |XX   XXX| $1A64
    .byte $3D ; |  XXXX X| $1A65
    .byte $37 ; |  XX XXX| $1A66
    .byte $6F ; | XX XXXX| $1A67
    .byte $10 ; |   X    | $1A68
    .byte $6D ; | XX XX X| $1A69
    .byte $01 ; |       X| $1A6A
    .byte $51 ; | X X   X| $1A6B
    .byte $CB ; |XX  X XX| $1A6C
    .byte $2E ; |  X XXX | $1A6D
    .byte $FE ; |XXXXXXX | $1A6E
    .byte $F5 ; |XXXX X X| $1A6F
    .byte $20 ; |  X     | $1A70
    .byte $47 ; | X   XXX| $1A71
    .byte $01 ; |       X| $1A72
    .byte $05 ; |     X X| $1A73
    .byte $AD ; |X X XX X| $1A74
    .byte $FF ; |XXXXXXXX| $1A75
    .byte $F2 ; |XXXX  X | $1A76
    .byte $9D ; |X  XXX X| $1A77
    .byte $BF ; |X XXXXXX| $1A78
    .byte $7C ; | XXXXX  | $1A79
    .byte $88 ; |X   X   | $1A7A
    .byte $C7 ; |XX   XXX| $1A7B
    .byte $F9 ; |XXXXX  X| $1A7C
    .byte $42 ; | X    X | $1A7D
    .byte $12 ; |   X  X | $1A7E
    .byte $13 ; |   X  XX| $1A7F
    .byte $11 ; |   X   X| $1A80
    .byte $2F ; |  X XXXX| $1A81
    .byte $60 ; | XX     | $1A82
    .byte $68 ; | XX X   | $1A83
    .byte $32 ; |  XX  X | $1A84
    .byte $FB ; |XXXXX XX| $1A85
    .byte $EB ; |XXX X XX| $1A86
    .byte $F5 ; |XXXX X X| $1A87
    .byte $95 ; |X  X X X| $1A88
    .byte $A5 ; |X X  X X| $1A89
    .byte $63 ; | XX   XX| $1A8A
    .byte $49 ; | X  X  X| $1A8B
    .byte $E8 ; |XXX X   | $1A8C
    .byte $C8 ; |XX  X   | $1A8D
    .byte $80 ; |X       | $1A8E
    .byte $C9 ; |XX  X  X| $1A8F
    .byte $B0 ; |X XX    | $1A90
    .byte $2C ; |  X XX  | $1A91
    .byte $52 ; | X X  X | $1A92
    .byte $02 ; |      X | $1A93
    .byte $BF ; |X XXXXXX| $1A94
    .byte $6C ; | XX XX  | $1A95
    .byte $3C ; |  XXXX  | $1A96
    .byte $1A ; |   XX X | $1A97
    .byte $AE ; |X X XXX | $1A98
    .byte $28 ; |  X X   | $1A99
    .byte $1D ; |   XXX X| $1A9A
    .byte $57 ; | X X XXX| $1A9B
    .byte $F9 ; |XXXXX  X| $1A9C
    .byte $ED ; |XXX XX X| $1A9D
    .byte $FC ; |XXXXXX  | $1A9E
    .byte $9D ; |X  XXX X| $1A9F
    .byte $21 ; |  X    X| $1AA0
    .byte $82 ; |X     X | $1AA1
    .byte $1C ; |   XXX  | $1AA2
    .byte $3C ; |  XXXX  | $1AA3
    .byte $BF ; |X XXXXXX| $1AA4
    .byte $BF ; |X XXXXXX| $1AA5
    .byte $EF ; |XXX XXXX| $1AA6
    .byte $FC ; |XXXXXX  | $1AA7
    .byte $D1 ; |XX X   X| $1AA8
    .byte $E9 ; |XXX X  X| $1AA9
    .byte $0A ; |    X X | $1AAA
    .byte $C3 ; |XX    XX| $1AAB
    .byte $B5 ; |X XX X X| $1AAC
    .byte $57 ; | X X XXX| $1AAD
    .byte $5D ; | X XXX X| $1AAE
    .byte $BC ; |X XXXX  | $1AAF
    .byte $11 ; |   X   X| $1AB0
    .byte $1B ; |   XX XX| $1AB1
    .byte $2D ; |  X XX X| $1AB2
L1AB3:
    .byte $29 ; |  X X  X| $1AB3
    .byte $ED ; |XXX XX X| $1AB4
    .byte $8E ; |X   XXX | $1AB5
    .byte $AF ; |X X XXXX| $1AB6
    .byte $57 ; | X X XXX| $1AB7
    .byte $BF ; |X XXXXXX| $1AB8
    .byte $F8 ; |XXXXX   | $1AB9
    .byte $5C ; | X XXX  | $1ABA
    .byte $D0 ; |XX X    | $1ABB
    .byte $BD ; |X XXXX X| $1ABC
    .byte $99 ; |X  XX  X| $1ABD
    .byte $FD ; |XXXXXX X| $1ABE
    .byte $0E ; |    XXX | $1ABF
    .byte $82 ; |X     X | $1AC0
    .byte $28 ; |  X X   | $1AC1
    .byte $00 ; |        | $1AC2
    .byte $26 ; |  X  XX | $1AC3
    .byte $87 ; |X    XXX| $1AC4
    .byte $EF ; |XXX XXXX| $1AC5
    .byte $F8 ; |XXXXX   | $1AC6
    .byte $F8 ; |XXXXX   | $1AC7
    .byte $B3 ; |X XX  XX| $1AC8
    .byte $6D ; | XX XX X| $1AC9
    .byte $3F ; |  XXXXXX| $1ACA
    .byte $1E ; |   XXXX | $1ACB
    .byte $29 ; |  X X  X| $1ACC
    .byte $9B ; |X  XX XX| $1ACD
    .byte $98 ; |X  XX   | $1ACE
    .byte $62 ; | XX   X | $1ACF
    .byte $8E ; |X   XXX | $1AD0
    .byte $11 ; |   X   X| $1AD1
    .byte $02 ; |      X | $1AD2
    .byte $0A ; |    X X | $1AD3
    .byte $74 ; | XXX X  | $1AD4
    .byte $F3 ; |XXXX  XX| $1AD5
    .byte $DD ; |XX XXX X| $1AD6
    .byte $4F ; | X  XXXX| $1AD7
    .byte $99 ; |X  XX  X| $1AD8
    .byte $44 ; | X   X  | $1AD9
    .byte $AA ; |X X X X | $1ADA
    .byte $FA ; |XXXXX X | $1ADB
    .byte $46 ; | X   XX | $1ADC
    .byte $F3 ; |XXXX  XX| $1ADD
    .byte $AF ; |X X XXXX| $1ADE
    .byte $03 ; |      XX| $1ADF
    .byte $98 ; |X  XX   | $1AE0
    .byte $C4 ; |XX   X  | $1AE1
    .byte $80 ; |X       | $1AE2
    .byte $C1 ; |XX     X| $1AE3
    .byte $B8 ; |X XXX   | $1AE4
    .byte $BD ; |X XXXX X| $1AE5
    .byte $FD ; |XXXXXX X| $1AE6
    .byte $EB ; |XXX X XX| $1AE7
    .byte $86 ; |X    XX | $1AE8
    .byte $3A ; |  XXX X | $1AE9
    .byte $54 ; | X X X  | $1AEA
    .byte $33 ; |  XX  XX| $1AEB
    .byte $89 ; |X   X  X| $1AEC
    .byte $81 ; |X      X| $1AED
    .byte $EE ; |XXX XXX | $1AEE
    .byte $A1 ; |X X    X| $1AEF
    .byte $82 ; |X     X | $1AF0
    .byte $80 ; |X       | $1AF1
    .byte $03 ; |      XX| $1AF2
    .byte $29 ; |  X X  X| $1AF3
    .byte $D7 ; |XX X XXX| $1AF4
    .byte $1D ; |   XXX X| $1AF5
    .byte $7B ; | XXXX XX| $1AF6
    .byte $DF ; |XX XXXXX| $1AF7
    .byte $3F ; |  XXXXXX| $1AF8
    .byte $98 ; |X  XX   | $1AF9
    .byte $C4 ; |XX   X  | $1AFA
    .byte $5C ; | X XXX  | $1AFB
    .byte $54 ; | X X X  | $1AFC
    .byte $03 ; |      XX| $1AFD
    .byte $71 ; | XXX   X| $1AFE
    .byte $B5 ; |X XX X X| $1AFF
    .byte $5B ; | X XX XX| $1B00
    .byte $E0 ; |XXX     | $1B01
    .byte $4E ; | X  XXX | $1B02
    .byte $4D ; | X  XX X| $1B03
    .byte $1F ; |   XXXXX| $1B04
    .byte $F9 ; |XXXXX  X| $1B05
    .byte $BB ; |X XXX XX| $1B06
    .byte $B9 ; |X XXX  X| $1B07
    .byte $48 ; | X  X   | $1B08
    .byte $EA ; |XXX X X | $1B09
    .byte $14 ; |   X X  | $1B0A
    .byte $BB ; |X XXX XX| $1B0B
    .byte $66 ; | XX  XX | $1B0C
    .byte $C5 ; |XX   X X| $1B0D
    .byte $EA ; |XXX X X | $1B0E
    .byte $49 ; | X  X  X| $1B0F
    .byte $10 ; |   X    | $1B10
    .byte $98 ; |X  XX   | $1B11
    .byte $8B ; |X   X XX| $1B12
    .byte $C2 ; |XX    X | $1B13
    .byte $67 ; | XX  XXX| $1B14
    .byte $9F ; |X  XXXXX| $1B15
    .byte $19 ; |   XX  X| $1B16
    .byte $6D ; | XX XX X| $1B17
    .byte $9C ; |X  XXX  | $1B18
    .byte $39 ; |  XXX  X| $1B19
    .byte $67 ; | XX  XXX| $1B1A
    .byte $59 ; | X XX  X| $1B1B
    .byte $B7 ; |X XX XXX| $1B1C
    .byte $D8 ; |XX XX   | $1B1D
    .byte $49 ; | X  X  X| $1B1E
    .byte $A1 ; |X X    X| $1B1F
    .byte $64 ; | XX  X  | $1B20
    .byte $01 ; |       X| $1B21
    .byte $54 ; | X X X  | $1B22
    .byte $12 ; |   X  X | $1B23
    .byte $F4 ; |XXXX X  | $1B24
    .byte $B3 ; |X XX  XX| $1B25
    .byte $EE ; |XXX XXX | $1B26
    .byte $85 ; |X    X X| $1B27
    .byte $C2 ; |XX    X | $1B28
    .byte $3F ; |  XXXXXX| $1B29
    .byte $50 ; | X X    | $1B2A
    .byte $54 ; | X X X  | $1B2B
    .byte $2B ; |  X X XX| $1B2C
    .byte $93 ; |X  X  XX| $1B2D
    .byte $0F ; |    XXXX| $1B2E
    .byte $2B ; |  X X XX| $1B2F
    .byte $00 ; |        | $1B30
    .byte $60 ; | XX     | $1B31
    .byte $E6 ; |XXX  XX | $1B32
    .byte $95 ; |X  X X X| $1B33
    .byte $14 ; |   X X  | $1B34
    .byte $37 ; |  XX XXX| $1B35
    .byte $BE ; |X XXXXX | $1B36
    .byte $6F ; | XX XXXX| $1B37
    .byte $A6 ; |X X  XX | $1B38
    .byte $BD ; |X XXXX X| $1B39
    .byte $C5 ; |XX   X X| $1B3A
    .byte $E0 ; |XXX     | $1B3B
    .byte $36 ; |  XX XX | $1B3C
    .byte $21 ; |  X    X| $1B3D
    .byte $EB ; |XXX X XX| $1B3E
    .byte $28 ; |  X X   | $1B3F
    .byte $84 ; |X    X  | $1B40
    .byte $12 ; |   X  X | $1B41
    .byte $80 ; |X       | $1B42
    .byte $01 ; |       X| $1B43
    .byte $16 ; |   X XX | $1B44
    .byte $F7 ; |XXXX XXX| $1B45
    .byte $D5 ; |XX X X X| $1B46
    .byte $1A ; |   XX X | $1B47
    .byte $AC ; |X X XX  | $1B48
    .byte $92 ; |X  X  X | $1B49
    .byte $8B ; |X   X XX| $1B4A
    .byte $78 ; | XXXX   | $1B4B
    .byte $4B ; | X  X XX| $1B4C
    .byte $5D ; | X XXX X| $1B4D
    .byte $2B ; |  X X XX| $1B4E
    .byte $0D ; |    XX X| $1B4F
    .byte $00 ; |        | $1B50
    .byte $41 ; | X     X| $1B51
    .byte $82 ; |X     X | $1B52
    .byte $0A ; |    X X | $1B53
    .byte $3F ; |  XXXXXX| $1B54
    .byte $A9 ; |X X X  X| $1B55
    .byte $FF ; |XXXXXXXX| $1B56
    .byte $FE ; |XXXXXXX | $1B57
    .byte $91 ; |X  X   X| $1B58
    .byte $E0 ; |XXX     | $1B59
    .byte $9A ; |X  XX X | $1B5A
    .byte $07 ; |     XXX| $1B5B
    .byte $C6 ; |XX   XX | $1B5C
    .byte $B5 ; |X XX X X| $1B5D
    .byte $EB ; |XXX X XX| $1B5E
    .byte $9E ; |X  XXXX | $1B5F
    .byte $C9 ; |XX  X  X| $1B60
    .byte $C9 ; |XX  X  X| $1B61
    .byte $ED ; |XXX XX X| $1B62
    .byte $32 ; |  XX  X | $1B63
    .byte $5F ; | X XXXXX| $1B64
    .byte $FE ; |XXXXXXX | $1B65
    .byte $EB ; |XXX X XX| $1B66
    .byte $DE ; |XX XXXX | $1B67
    .byte $1C ; |   XXX  | $1B68
    .byte $85 ; |X    X X| $1B69
    .byte $C6 ; |XX   XX | $1B6A
    .byte $AE ; |X X XXX | $1B6B
    .byte $47 ; | X   XXX| $1B6C
    .byte $A9 ; |X X X  X| $1B6D
    .byte $5C ; | X XXX  | $1B6E
    .byte $AF ; |X X XXXX| $1B6F
    .byte $50 ; | X X    | $1B70
    .byte $CF ; |XX  XXXX| $1B71
    .byte $0D ; |    XX X| $1B72
    .byte $B9 ; |X XXX  X| $1B73
    .byte $53 ; | X X  XX| $1B74
    .byte $F9 ; |XXXXX  X| $1B75
    .byte $33 ; |  XX  XX| $1B76
    .byte $EB ; |XXX X XX| $1B77
    .byte $5F ; | X XXXXX| $1B78
    .byte $AB ; |X X X XX| $1B79
    .byte $CE ; |XX  XXX | $1B7A
    .byte $2C ; |  X XX  | $1B7B
    .byte $9E ; |X  XXXX | $1B7C
    .byte $6F ; | XX XXXX| $1B7D
    .byte $AC ; |X X XX  | $1B7E
    .byte $94 ; |X  X X  | $1B7F
    .byte $08 ; |    X   | $1B80
    .byte $80 ; |X       | $1B81
    .byte $10 ; |   X    | $1B82
    .byte $09 ; |    X  X| $1B83
    .byte $8F ; |X   XXXX| $1B84
    .byte $7F ; | XXXXXXX| $1B85
    .byte $9B ; |X  XX XX| $1B86
    .byte $C6 ; |XX   XX | $1B87
    .byte $41 ; | X     X| $1B88
    .byte $51 ; | X X   X| $1B89
    .byte $52 ; | X X  X | $1B8A
    .byte $48 ; | X  X   | $1B8B
    .byte $24 ; |  X  X  | $1B8C
    .byte $15 ; |   X X X| $1B8D
    .byte $12 ; |   X  X | $1B8E
    .byte $E7 ; |XXX  XXX| $1B8F
    .byte $11 ; |   X   X| $1B90
    .byte $0A ; |    X X | $1B91
    .byte $02 ; |      X | $1B92
    .byte $A4 ; |X X  X  | $1B93
    .byte $4E ; | X  XXX | $1B94
    .byte $BE ; |X XXXXX | $1B95
    .byte $F1 ; |XXXX   X| $1B96
    .byte $EE ; |XXX XXX | $1B97
    .byte $24 ; |  X  X  | $1B98
    .byte $CD ; |XX  XX X| $1B99
    .byte $70 ; | XXX    | $1B9A
    .byte $6B ; | XX X XX| $1B9B
    .byte $A7 ; |X X  XXX| $1B9C
    .byte $24 ; |  X  X  | $1B9D
    .byte $36 ; |  XX XX | $1B9E
    .byte $42 ; | X    X | $1B9F
    .byte $B7 ; |X XX XXX| $1BA0
    .byte $AE ; |X X XXX | $1BA1
    .byte $00 ; |        | $1BA2
    .byte $00 ; |        | $1BA3
    .byte $EF ; |XXX XXXX| $1BA4
    .byte $DF ; |XX XXXXX| $1BA5
    .byte $7F ; | XXXXXXX| $1BA6
    .byte $7F ; | XXXXXXX| $1BA7
    .byte $3A ; |  XXX X | $1BA8
    .byte $5C ; | X XXX  | $1BA9
    .byte $C9 ; |XX  X  X| $1BAA
    .byte $9F ; |X  XXXXX| $1BAB
    .byte $B4 ; |X XX X  | $1BAC
    .byte $AD ; |X X XX X| $1BAD
    .byte $7B ; | XXXX XX| $1BAE
    .byte $07 ; |     XXX| $1BAF
    .byte $B0 ; |X XX    | $1BB0
    .byte $C1 ; |XX     X| $1BB1
    .byte $94 ; |X  X X  | $1BB2
    .byte $91 ; |X  X   X| $1BB3
    .byte $AF ; |X X XXXX| $1BB4
    .byte $35 ; |  XX X X| $1BB5
    .byte $2B ; |  X X XX| $1BB6
    .byte $F6 ; |XXXX XX | $1BB7
    .byte $5E ; | X XXXX | $1BB8
    .byte $6F ; | XX XXXX| $1BB9
    .byte $03 ; |      XX| $1BBA
    .byte $6A ; | XX X X | $1BBB
    .byte $F4 ; |XXXX X  | $1BBC
    .byte $E0 ; |XXX     | $1BBD
    .byte $FD ; |XXXXXX X| $1BBE
    .byte $E0 ; |XXX     | $1BBF
    .byte $91 ; |X  X   X| $1BC0
    .byte $00 ; |        | $1BC1
    .byte $80 ; |X       | $1BC2
    .byte $C3 ; |XX    XX| $1BC3
    .byte $E4 ; |XXX  X  | $1BC4
    .byte $FE ; |XXXXXXX | $1BC5
    .byte $76 ; | XXX XX | $1BC6
    .byte $F1 ; |XXXX   X| $1BC7
    .byte $AC ; |X X XX  | $1BC8
    .byte $5E ; | X XXXX | $1BC9
    .byte $53 ; | X X  XX| $1BCA
    .byte $05 ; |     X X| $1BCB
    .byte $C7 ; |XX   XXX| $1BCC
    .byte $1F ; |   XXXXX| $1BCD
    .byte $5C ; | X XXX  | $1BCE
    .byte $43 ; | X    XX| $1BCF
    .byte $28 ; |  X X   | $1BD0
    .byte $21 ; |  X    X| $1BD1
    .byte $16 ; |   X XX | $1BD2
    .byte $51 ; | X X   X| $1BD3
    .byte $CF ; |XX  XXXX| $1BD4
    .byte $FE ; |XXXXXXX | $1BD5
    .byte $97 ; |X  X XXX| $1BD6
    .byte $FE ; |XXXXXXX | $1BD7
    .byte $AD ; |X X XX X| $1BD8
    .byte $5F ; | X XXXXX| $1BD9
    .byte $37 ; |  XX XXX| $1BDA
    .byte $F1 ; |XXXX   X| $1BDB
    .byte $00 ; |        | $1BDC
    .byte $3E ; |  XXXXX | $1BDD
    .byte $DB ; |XX XX XX| $1BDE
    .byte $EE ; |XXX XXX | $1BDF
    .byte $00 ; |        | $1BE0
    .byte $24 ; |  X  X  | $1BE1
    .byte $0D ; |    XX X| $1BE2
    .byte $4A ; | X  X X | $1BE3
    .byte $DB ; |XX XX XX| $1BE4
    .byte $B8 ; |X XXX   | $1BE5
    .byte $DF ; |XX XXXXX| $1BE6
    .byte $7F ; | XXXXXXX| $1BE7
    .byte $BF ; |X XXXXXX| $1BE8
    .byte $92 ; |X  X  X | $1BE9
    .byte $21 ; |  X    X| $1BEA
    .byte $3A ; |  XXX X | $1BEB
    .byte $CF ; |XX  XXXX| $1BEC
    .byte $7B ; | XXXX XX| $1BED
    .byte $D8 ; |XX XX   | $1BEE
    .byte $6F ; | XX XXXX| $1BEF
    .byte $20 ; |  X     | $1BF0
    .byte $22 ; |  X   X | $1BF1
    .byte $B8 ; |X XXX   | $1BF2
    .byte $20 ; |  X     | $1BF3
    .byte $FE ; |XXXXXXX | $1BF4
    .byte $E3 ; |XXX   XX| $1BF5
    .byte $CC ; |XX  XX  | $1BF6
    .byte $DF ; |XX XXXXX| $1BF7
    .byte $DA ; |XX XX X | $1BF8
    .byte $46 ; | X   XX | $1BF9
    .byte $D4 ; |XX X X  | $1BFA
    .byte $AC ; |X X XX  | $1BFB
    .byte $60 ; | XX     | $1BFC
    .byte $B2 ; |X XX  X | $1BFD
    .byte $AD ; |X X XX X| $1BFE
    .byte $A5 ; |X X  X X| $1BFF
    .byte $C1 ; |XX     X| $1C00
    .byte $1E ; |   XXXX | $1C01
    .byte $00 ; |        | $1C02
    .byte $00 ; |        | $1C03
    .byte $00 ; |        | $1C04
    .byte $00 ; |        | $1C05
    .byte $21 ; |  X    X| $1C06
    .byte $1C ; |   XXX  | $1C07
    .byte $64 ; | XX  X  | $1C08
    .byte $89 ; |X   X  X| $1C09
    .byte $7F ; | XXXXXXX| $1C0A
    .byte $0A ; |    X X | $1C0B
    .byte $75 ; | XXX X X| $1C0C
    .byte $1C ; |   XXX  | $1C0D
    .byte $00 ; |        | $1C0E
    .byte $00 ; |        | $1C0F
    .byte $00 ; |        | $1C10
    .byte $00 ; |        | $1C11
    .byte $69 ; | XX X  X| $1C12
    .byte $1C ; |   XXX  | $1C13
    .byte $C0 ; |XX      | $1C14
    .byte $00 ; |        | $1C15
    .byte $05 ; |     X X| $1C16
    .byte $03 ; |      XX| $1C17
    .byte $00 ; |        | $1C18
    .byte $00 ; |        | $1C19
    .byte $C0 ; |XX      | $1C1A
    .byte $05 ; |     X X| $1C1B
    .byte $05 ; |     X X| $1C1C
    .byte $00 ; |        | $1C1D
    .byte $00 ; |        | $1C1E
    .byte $00 ; |        | $1C1F
    .byte $FF ; |XXXXXXXX| $1C20
    .byte $2D ; |  X XX X| $1C21
    .byte $1C ; |   XXX  | $1C22
    .byte $37 ; |  XX XXX| $1C23
    .byte $1C ; |   XXX  | $1C24
    .byte $41 ; | X     X| $1C25
    .byte $1C ; |   XXX  | $1C26
    .byte $4B ; | X  X XX| $1C27
    .byte $1C ; |   XXX  | $1C28
    .byte $55 ; | X X X X| $1C29
    .byte $1C ; |   XXX  | $1C2A
    .byte $5F ; | X XXXXX| $1C2B
    .byte $0C ; |    XX  | $1C2C
    .byte $0E ; |    XXX | $1C2D
    .byte $0A ; |    X X | $1C2E
    .byte $CE ; |XX  XXX | $1C2F
    .byte $0C ; |    XX  | $1C30
    .byte $0A ; |    X X | $1C31
    .byte $0E ; |    XXX | $1C32
    .byte $0A ; |    X X | $1C33
    .byte $CE ; |XX  XXX | $1C34
    .byte $08 ; |    X   | $1C35
    .byte $08 ; |    X   | $1C36
    .byte $EE ; |XXX XXX | $1C37
    .byte $8A ; |X   X X | $1C38
    .byte $CE ; |XX  XXX | $1C39
    .byte $8A ; |X   X X | $1C3A
    .byte $EA ; |XXX X X | $1C3B
    .byte $EE ; |XXX XXX | $1C3C
    .byte $A8 ; |X X X   | $1C3D
    .byte $EC ; |XXX XX  | $1C3E
    .byte $C8 ; |XX  X   | $1C3F
    .byte $AE ; |X X XXX | $1C40
    .byte $C2 ; |XX    X | $1C41
    .byte $A3 ; |X X   XX| $1C42
    .byte $A2 ; |X X   X | $1C43
    .byte $A2 ; |X X   X | $1C44
    .byte $C2 ; |XX    X | $1C45
    .byte $EE ; |XXX XXX | $1C46
    .byte $88 ; |X   X   | $1C47
    .byte $EE ; |XXX XXX | $1C48
    .byte $22 ; |  X   X | $1C49
    .byte $EE ; |XXX XXX | $1C4A
    .byte $2E ; |  X XXX | $1C4B
    .byte $6A ; | XX X X | $1C4C
    .byte $AE ; |X X XXX | $1C4D
    .byte $2A ; |  X X X | $1C4E
    .byte $2A ; |  X X X | $1C4F
    .byte $3B ; |  XXX XX| $1C50
    .byte $2A ; |  X X X | $1C51
    .byte $3B ; |  XXX XX| $1C52
    .byte $32 ; |  XX  X | $1C53
    .byte $2B ; |  X X XX| $1C54
    .byte $95 ; |X  X X X| $1C55
    .byte $D5 ; |XX X X X| $1C56
    .byte $F5 ; |XXXX X X| $1C57
    .byte $B5 ; |X XX X X| $1C58
    .byte $97 ; |X  X XXX| $1C59
    .byte $BB ; |X XXX XX| $1C5A
    .byte $22 ; |  X   X | $1C5B
    .byte $3B ; |  XXX XX| $1C5C
    .byte $0A ; |    X X | $1C5D
    .byte $BB ; |X XXX XX| $1C5E
    .byte $74 ; | XXX X  | $1C5F
    .byte $54 ; | X X X  | $1C60
    .byte $74 ; | XXX X  | $1C61
    .byte $54 ; | X X X  | $1C62
    .byte $57 ; | X X XXX| $1C63
    .byte $B8 ; |X XXX   | $1C64
    .byte $10 ; |   X    | $1C65
    .byte $90 ; |X  X    | $1C66
    .byte $10 ; |   X    | $1C67
    .byte $90 ; |X  X    | $1C68
    .byte $E6 ; |XXX  XX | $1C69
    STX    $07D0           ; 4
    LDA    $8D             ; 3
    CLC                    ; 2
    ADC    #$50            ; 2
    STA    $8D             ; 3
    RTS                    ; 6

    CPX    #$02            ; 2
    BEQ    L1C7A           ; 2
    RTS                    ; 6

L1C7A:
    LDY    $08A5           ; 4
    LDX    #$00            ; 2
L1C7F:
    LDA    L1C9A,X         ; 4
    STA    L180E,X         ; 5
    INX                    ; 2
    CPX    #$08            ; 2
    BNE    L1C7F           ; 2
    LDA    #$10            ; 2
    STA    $D2             ; 3
    LDA    #$00            ; 2
    STA    $D3             ; 3
    STA    $BC             ; 3
    JSR    L134C           ; 6
    JMP    L13A3           ; 3
L1C9A:
    .byte $63 ; | XX   XX| $1C9A
    .byte $6C ; | XX XX  | $1C9B
    .byte $03 ; |      XX| $1C9C
    .byte $14 ; |   X X  | $1C9D
    .byte $F6 ; |XXXX XX | $1C9E
    .byte $15 ; |   X X X| $1C9F
    .byte $FF ; |XXXXXXXX| $1CA0
    .byte $FF ; |XXXXXXXX| $1CA1
L1CA2:
    LDX    #$03            ; 2
    LDA    #$E9            ; 2
L1CA6:
    CMP    L1802,X         ; 4
    BNE    L1CD1           ; 2
    ASL                    ; 2
    DEX                    ; 2
    BNE    L1CA6           ; 2
    LDA    #$18            ; 2
    STA    $AE             ; 3
    LDY    #$00            ; 2
    STY    $AD             ; 3
    TYA                    ; 2
L1CB8:
    CLC                    ; 2
    ADC    ($AD),Y         ; 5
    INC    $AD             ; 5
    BNE    L1CC1           ; 2
    INC    $AE             ; 5
L1CC1:
    LDX    L1800           ; 4
    CPX    $AD             ; 3
    BNE    L1CB8           ; 2
    LDX    L1801           ; 4
    CPX    $AE             ; 3
    BNE    L1CB8           ; 2
    CMP    ($AD),Y         ; 5
L1CD1:
    RTS                    ; 6

    .byte $04 ; |     X  | $1CD2
    .byte $11 ; |   X   X| $1CD3
    .byte $6C ; | XX XX  | $1CD4
    .byte $33 ; |  XX  XX| $1CD5
    .byte $FD ; |XXXXXX X| $1CD6
    .byte $20 ; |  X     | $1CD7
    .byte $31 ; |  XX   X| $1CD8
    .byte $10 ; |   X    | $1CD9
    .byte $C9 ; |XX  X  X| $1CDA
    .byte $BA ; |X XXX X | $1CDB
    .byte $F0 ; |XXXX    | $1CDC
    .byte $DE ; |XX XXXX | $1CDD
    .byte $C9 ; |XX  X  X| $1CDE
    .byte $E0 ; |XXX     | $1CDF
    .byte $85 ; |X    X X| $1CE0
    .byte $02 ; |      X | $1CE1
    .byte $A2 ; |X X   X | $1CE2
    .byte $07 ; |     XXX| $1CE3
L1CE4:
    DEX                    ; 2
    BNE    L1CE4           ; 2
    NOP                    ; 2
    STA    RESP0           ; 3
    STA    WSYNC           ; 3
    LDA    #$03            ; 2
    STA    NUSIZ0          ; 3
    LDA    #$00            ; 2
    STA    NUSIZ1          ; 3
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    RTS                    ; 6

L1CF9:
    NOP                    ; 2
    LDA    ($91),Y         ; 5
    AND    $0196           ; 4
    EOR    $0199           ; 4
    TAX                    ; 2
    LDA    ($93),Y         ; 5
    AND    $0197           ; 4
    EOR    $019A           ; 4
    STX    GRP0            ; 3
    JMP    L1910           ; 3
    STA    GRP0            ; 3
    INC    $86             ; 5
    LDY    $86             ; 3
    LDA    ($8F),Y         ; 5
    AND    $0195           ; 4
    STA    WSYNC           ; 3
    EOR    $0198           ; 4
    STA    GRP0            ; 3
    CPY    $87             ; 3
    BNE    L1CF9           ; 2
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    RTS                    ; 6

    LDA    $86             ; 3
    STA    COLUPF          ; 3
    LDA    $87             ; 3
    STA    $A0             ; 3
    LDA    #$FE            ; 2
    STA    PF2             ; 3
    JSR    L18E0           ; 6
    LDX    #$06            ; 2
    JSR    L1314           ; 6
    LDA    #$24            ; 2
    STA    $8F             ; 3
    LDA    #$50            ; 2
    STA    $91             ; 3
    LDA    #$7C            ; 2
    STA    $93             ; 3
    LDA    #$1A            ; 2
    STA    $90             ; 3
    LDA    #$1A            ; 2
    STA    $92             ; 3
    LDA    #$1A            ; 2
    STA    $94             ; 3
    LDY    #$00            ; 2
    STY    $86             ; 3
    TYA                    ; 2
L1D5C:
    CLC                    ; 2
    ADC    #$0B            ; 2
    STA    $87             ; 3
    STY    $DE             ; 3
    JSR    L19A7           ; 6
    JSR    L1914           ; 6
    LDX    #$03            ; 2
    JSR    L1314           ; 6
    LDY    $DE             ; 3
    INY                    ; 2
    LDA    $86             ; 3
    CMP    #$22            ; 2
    BMI    L1D5C           ; 2
    LDX    #$06            ; 2
    JSR    L1314           ; 6
    LDA    #$00            ; 2
    STA    PF2             ; 3
    LDX    #$03            ; 2
    JSR    L1314           ; 6
    LDA    #$00            ; 2
    STA    $86             ; 3
    LDA    #$0B            ; 2
    STA    $87             ; 3
    JSR    L19DF           ; 6
    JSR    L19B3           ; 6
    JSR    L1914           ; 6
    LDA    #$1F            ; 2
    STA    COLUPF          ; 3
    LDA    #$98            ; 2
    STA    WSYNC           ; 3
    STA    PF2             ; 3
    LDA    #$00            ; 2
    STA    WSYNC           ; 3
    STA    PF2             ; 3
    RTS                    ; 6

    JSR    L19CF           ; 6
    CPY    $9D             ; 3
    BNE    L1DB2           ; 2
    LDX    $9E             ; 3
    DEC    $98,X           ; 6
L1DB2:
    RTS                    ; 6

    JSR    L19CF           ; 6
    LDX    $9F             ; 3
    CPX    #$03            ; 2
    BEQ    L1DB2           ; 2
    LDA    $9C             ; 3
    STA    $95,X           ; 4
    DEC    $9B             ; 5
    BNE    L1DB2           ; 2
    LDA    $9C             ; 3
    EOR    #$FF            ; 2
    STA    $9C             ; 3
    LDA    #$14            ; 2
    STA    $9B             ; 3
    RTS                    ; 6

    LDX    #$FF            ; 2
    STX    $95             ; 3
    STX    $96             ; 3
    STX    $97             ; 3
    INX                    ; 2
    STX    $98             ; 3
    STX    $99             ; 3
    STX    $9A             ; 3
    RTS                    ; 6

    LDA    #$A8            ; 2
    STA    $8F             ; 3
    STA    $91             ; 3
    STA    $93             ; 3
    LDA    #$1A            ; 2
    STA    $90             ; 3
    STA    $92             ; 3
    STA    $94             ; 3
    LDX    #$00            ; 2
    LDA    $A0             ; 3
    BEQ    L1E16           ; 2
    CPX    $9F             ; 3
    BPL    L1E16           ; 2
    LDY    $A7,X           ; 4
    LDA    L1AB3,Y         ; 4
    CLC                    ; 2
    ADC    #$24            ; 2
    PHA                    ; 3
    LDA    #$00            ; 2
    ADC    #$1A            ; 2
    PHA                    ; 3
    TXA                    ; 2
    ASL                    ; 2
    TAY                    ; 2
    PLA                    ; 4
    STA.wy $0090,Y         ; 5
    PLA                    ; 4
    STA.wy $008F,Y         ; 5
    INX                    ; 2
    JMP    L19F5           ; 3
L1E16:
    LDA    L1A20,X         ; 4
    BEQ    L1E1F           ; 2
    TAX                    ; 2
    JSR    L1314           ; 6
L1E1F:
    RTS                    ; 6

    .byte $02 ; |      X | $1E20
    .byte $02 ; |      X | $1E21
    .byte $01 ; |       X| $1E22
    .byte $00 ; |        | $1E23
    .byte $00 ; |        | $1E24
    .byte $08 ; |    X   | $1E25
    .byte $18 ; |   XX   | $1E26
    .byte $08 ; |    X   | $1E27
    .byte $08 ; |    X   | $1E28
    .byte $08 ; |    X   | $1E29
    .byte $08 ; |    X   | $1E2A
    .byte $08 ; |    X   | $1E2B
    .byte $08 ; |    X   | $1E2C
    .byte $1C ; |   XXX  | $1E2D
    .byte $00 ; |        | $1E2E
    .byte $00 ; |        | $1E2F
    .byte $28 ; |  X X   | $1E30
    .byte $28 ; |  X X   | $1E31
    .byte $28 ; |  X X   | $1E32
    .byte $28 ; |  X X   | $1E33
    .byte $28 ; |  X X   | $1E34
    .byte $3C ; |  XXXX  | $1E35
    .byte $08 ; |    X   | $1E36
    .byte $08 ; |    X   | $1E37
    .byte $08 ; |    X   | $1E38
    .byte $00 ; |        | $1E39
    .byte $00 ; |        | $1E3A
    .byte $3C ; |  XXXX  | $1E3B
    .byte $04 ; |     X  | $1E3C
    .byte $04 ; |     X  | $1E3D
    .byte $04 ; |     X  | $1E3E
    .byte $08 ; |    X   | $1E3F
    .byte $08 ; |    X   | $1E40
    .byte $10 ; |   X    | $1E41
    .byte $10 ; |   X    | $1E42
    .byte $10 ; |   X    | $1E43
    .byte $00 ; |        | $1E44
    .byte $00 ; |        | $1E45
    .byte $00 ; |        | $1E46
    .byte $42 ; | X    X | $1E47
    .byte $24 ; |  X  X  | $1E48
    .byte $18 ; |   XX   | $1E49
    .byte $7E ; | XXXXXX | $1E4A
    .byte $18 ; |   XX   | $1E4B
    .byte $24 ; |  X  X  | $1E4C
    .byte $42 ; | X    X | $1E4D
    .byte $00 ; |        | $1E4E
    .byte $00 ; |        | $1E4F
    .byte $00 ; |        | $1E50
    .byte $18 ; |   XX   | $1E51
    .byte $24 ; |  X  X  | $1E52
    .byte $04 ; |     X  | $1E53
    .byte $04 ; |     X  | $1E54
    .byte $08 ; |    X   | $1E55
    .byte $10 ; |   X    | $1E56
    .byte $20 ; |  X     | $1E57
    .byte $20 ; |  X     | $1E58
    .byte $3C ; |  XXXX  | $1E59
    .byte $00 ; |        | $1E5A
    .byte $00 ; |        | $1E5B
    .byte $3C ; |  XXXX  | $1E5C
    .byte $20 ; |  X     | $1E5D
    .byte $20 ; |  X     | $1E5E
    .byte $38 ; |  XXX   | $1E5F
    .byte $24 ; |  X  X  | $1E60
    .byte $04 ; |     X  | $1E61
    .byte $04 ; |     X  | $1E62
    .byte $24 ; |  X  X  | $1E63
    .byte $18 ; |   XX   | $1E64
    .byte $00 ; |        | $1E65
    .byte $00 ; |        | $1E66
    .byte $18 ; |   XX   | $1E67
    .byte $24 ; |  X  X  | $1E68
    .byte $24 ; |  X  X  | $1E69
    .byte $24 ; |  X  X  | $1E6A
    .byte $18 ; |   XX   | $1E6B
    .byte $24 ; |  X  X  | $1E6C
    .byte $24 ; |  X  X  | $1E6D
    .byte $24 ; |  X  X  | $1E6E
    .byte $18 ; |   XX   | $1E6F
    .byte $00 ; |        | $1E70
    .byte $00 ; |        | $1E71
    .byte $18 ; |   XX   | $1E72
    .byte $24 ; |  X  X  | $1E73
    .byte $24 ; |  X  X  | $1E74
    .byte $24 ; |  X  X  | $1E75
    .byte $24 ; |  X  X  | $1E76
    .byte $24 ; |  X  X  | $1E77
    .byte $24 ; |  X  X  | $1E78
    .byte $24 ; |  X  X  | $1E79
    .byte $18 ; |   XX   | $1E7A
    .byte $00 ; |        | $1E7B
    .byte $00 ; |        | $1E7C
    .byte $18 ; |   XX   | $1E7D
    .byte $24 ; |  X  X  | $1E7E
    .byte $04 ; |     X  | $1E7F
    .byte $04 ; |     X  | $1E80
    .byte $18 ; |   XX   | $1E81
    .byte $04 ; |     X  | $1E82
    .byte $04 ; |     X  | $1E83
    .byte $24 ; |  X  X  | $1E84
    .byte $18 ; |   XX   | $1E85
    .byte $00 ; |        | $1E86
    .byte $00 ; |        | $1E87
    .byte $18 ; |   XX   | $1E88
    .byte $24 ; |  X  X  | $1E89
    .byte $20 ; |  X     | $1E8A
    .byte $20 ; |  X     | $1E8B
    .byte $38 ; |  XXX   | $1E8C
    .byte $24 ; |  X  X  | $1E8D
    .byte $24 ; |  X  X  | $1E8E
    .byte $24 ; |  X  X  | $1E8F
    .byte $18 ; |   XX   | $1E90
    .byte $00 ; |        | $1E91
    .byte $00 ; |        | $1E92
    .byte $18 ; |   XX   | $1E93
    .byte $24 ; |  X  X  | $1E94
    .byte $24 ; |  X  X  | $1E95
    .byte $24 ; |  X  X  | $1E96
    .byte $1C ; |   XXX  | $1E97
    .byte $04 ; |     X  | $1E98
    .byte $04 ; |     X  | $1E99
    .byte $24 ; |  X  X  | $1E9A
    .byte $18 ; |   XX   | $1E9B
    .byte $00 ; |        | $1E9C
    .byte $00 ; |        | $1E9D
    .byte $00 ; |        | $1E9E
    .byte $24 ; |  X  X  | $1E9F
    .byte $7E ; | XXXXXX | $1EA0
    .byte $24 ; |  X  X  | $1EA1
    .byte $24 ; |  X  X  | $1EA2
    .byte $7E ; | XXXXXX | $1EA3
    .byte $24 ; |  X  X  | $1EA4
    .byte $24 ; |  X  X  | $1EA5
    .byte $00 ; |        | $1EA6
    .byte $00 ; |        | $1EA7
    .byte $00 ; |        | $1EA8
    .byte $FF ; |XXXXXXXX| $1EA9
    .byte $FF ; |XXXXXXXX| $1EAA
    .byte $FF ; |XXXXXXXX| $1EAB
    .byte $FF ; |XXXXXXXX| $1EAC
    .byte $FF ; |XXXXXXXX| $1EAD
    .byte $FF ; |XXXXXXXX| $1EAE
    .byte $FF ; |XXXXXXXX| $1EAF
    .byte $FF ; |XXXXXXXX| $1EB0
    .byte $FF ; |XXXXXXXX| $1EB1
    .byte $00 ; |        | $1EB2
    .byte $4D ; | X  XX X| $1EB3
    .byte $00 ; |        | $1EB4
    .byte $2C ; |  X XX  | $1EB5
    .byte $58 ; | X XX   | $1EB6
    .byte $0B ; |    X XX| $1EB7
    .byte $37 ; |  XX XXX| $1EB8
    .byte $63 ; | XX   XX| $1EB9
    .byte $16 ; |   X XX | $1EBA
    .byte $42 ; | X    X | $1EBB
    .byte $6E ; | XX XXX | $1EBC
    .byte $D3 ; |XX X  XX| $1EBD
    .byte $CC ; |XX  XX  | $1EBE
    .byte $EF ; |XXX XXXX| $1EBF
    .byte $F4 ; |XXXX X  | $1EC0
    .byte $16 ; |   X XX | $1EC1
    .byte $00 ; |        | $1EC2
    .byte $06 ; |     XX | $1EC3
    .byte $D3 ; |XX X  XX| $1EC4
    .byte $E1 ; |XXX    X| $1EC5
    .byte $D6 ; |XX X XX | $1EC6
    .byte $C5 ; |XX   X X| $1EC7
    .byte $04 ; |     X  | $1EC8
    .byte $12 ; |   X  X | $1EC9
    .byte $00 ; |        | $1ECA
    .byte $12 ; |   X  X | $1ECB
    .byte $D4 ; |XX X X  | $1ECC
    .byte $D2 ; |XX X  X | $1ECD
    .byte $F5 ; |XXXX X X| $1ECE
    .byte $EE ; |XXX XXX | $1ECF
    LDA    #$7F            ; 2
    LDX    #$08            ; 2
    LDY    #$FF            ; 2
    STY    AUDV0           ; 3
    LDY    #$01            ; 2
    STY    AUDC0           ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    STX    AUDF0           ; 3
    JSR    L1533           ; 6
    CMP    #$00            ; 2
    BEQ    L1EEE           ; 2
    DEX                    ; 2
    LSR                    ; 2
    JMP    L12DC           ; 3
L1EEE:
    STA    AUDV0           ; 3
    RTS                    ; 6

    JSR    L14B9           ; 6
    LDA    #$20            ; 2
    JSR    L17F1           ; 6
    LDA    $0885           ; 4
    LDA    L1802           ; 4
    BNE    L1F09           ; 2
    LDA    #$08            ; 2
    LDX    #$13            ; 2
    JMP    L130F           ; 3
    BRK                    ; 7
L1F09:
    LDA    L180A           ; 4
    LDX    L180B           ; 4
    STA    $AD             ; 3
    STX    $AE             ; 3
    LDY    #$00            ; 2
    LDA    ($AD),Y         ; 5
    CLC                    ; 2
    ADC    #$05            ; 2
    JSR    L17F1           ; 6
    LDA    $D2             ; 3
    JSR    L17F1           ; 6
    LDA    $D3             ; 3
    JSR    L17F1           ; 6
    LDA    $C4             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    $DE             ; 3
    LDA    $BF             ; 3
    AND    #$0F            ; 2
    ORA    $DE             ; 3
    JSR    L17F1           ; 6
    JSR    L14D5           ; 6
    JSR    L17DC           ; 6
    LDY    #$00            ; 2
L1F40:
    LDA    L1FDA,Y         ; 4
    JSR    L17F1           ; 6
    INY                    ; 2
    CPY    #$05            ; 2
    BNE    L1F40           ; 2
    LDY    #$00            ; 2
    LDA    ($AD),Y         ; 5
    BEQ    L1F5B           ; 2
    TAX                    ; 2
L1F52:
    INY                    ; 2
    LDA    ($AD),Y         ; 5
    JSR    L17F1           ; 6
    DEX                    ; 2
    BNE    L1F52           ; 2
L1F5B:
    JSR    L14D5           ; 6
    JSR    L14E0           ; 6
    RTS                    ; 6

    .byte $14 ; |   X X  | $1F62
    .byte $2E ; |  X XXX | $1F63
    .byte $1B ; |   XX XX| $1F64
    .byte $76 ; | XXX XX | $1F65
    .byte $16 ; |   X XX | $1F66
    .byte $16 ; |   X XX | $1F67
    .byte $17 ; |   X XXX| $1F68
    .byte $C4 ; |XX   X  | $1F69
    .byte $16 ; |   X XX | $1F6A
    .byte $FF ; |XXXXXXXX| $1F6B
    .byte $16 ; |   X XX | $1F6C
    .byte $C3 ; |XX    XX| $1F6D
    .byte $15 ; |   X X X| $1F6E
    .byte $B5 ; |X XX X X| $1F6F
    .byte $CD ; |XX  XX X| $1F70
    .byte $D3 ; |XX X  XX| $1F71
    .byte $D3 ; |XX X  XX| $1F72
    .byte $A0 ; |X X     | $1F73
    .byte $D3 ; |XX X  XX| $1F74
    .byte $D4 ; |XX X X  | $1F75
    .byte $A0 ; |X X     | $1F76
    .byte $D2 ; |XX X  X | $1F77
    .byte $C8 ; |XX  X   | $1F78
    .byte $66 ; | XX  XX | $1F79
    .byte $16 ; |   X XX | $1F7A
    .byte $EF ; |XXX XXXX| $1F7B
    .byte $16 ; |   X XX | $1F7C
    .byte $79 ; | XXXX  X| $1F7D
    .byte $15 ; |   X X X| $1F7E
    .byte $32 ; |  XX  X | $1F7F
    .byte $1D ; |   XXX X| $1F80
    .byte $24 ; |  X  X  | $1F81
    .byte $5A ; | X XX X | $1F82
    .byte $30 ; |  XX    | $1F83
    .byte $03 ; |      XX| $1F84
    .byte $20 ; |  X     | $1F85
    .byte $81 ; |X      X| $1F86
    .byte $14 ; |   X X  | $1F87
L1F88:
    LDX    #$00            ; 2
    STX    $CA             ; 3
    LDA    $0CB0           ; 4
L1F8F:
    LDA    L1FC0,X         ; 4
    EOR    $CA             ; 3
    STA    $CA             ; 3
    ASL                    ; 2
    ROL    $CA             ; 5
    INX                    ; 2
    CPX    #$1F            ; 2
    BNE    L1F8F           ; 2
    LDA    L1FC0,X         ; 4
    CMP    $CA             ; 3
    BNE    L1FA9           ; 2
    LDA    $0C80           ; 4
    RTS                    ; 6

L1FA9:
    LDA    #$E6            ; 2
    STA    COLUBK          ; 3
    JMP    L1FA9           ; 3
L1FB0:
    LDA    $0CA0           ; 4
    STY    L1000           ; 4
    LDA    L1FF8           ; 4
    AND    #$03            ; 2
    LDY    $0C80           ; 4
    RTS                    ; 6


START:
    SEI                    ; 2
L1FC0:
    CLD                    ; 2
    LDA    #$00            ; 2
    TAX                    ; 2
    LDY    #$A8            ; 2
L1FC6:
    TXS                    ; 2
    INX                    ; 2
    BNE    L1FC6           ; 2
    DEY                    ; 2
    BNE    L1FC6           ; 2
    LDX    #$05            ; 2
    LDA    $04AD           ; 4
L1FD2:
    LDY    #$02            ; 2
    JSR    L1FB0           ; 6
    CMP    #$02            ; 2
    BNE    L1FE4           ; 2
    LDY    #$01            ; 2
    JSR    L1FB0           ; 6
    CMP    #$01            ; 2
    BEQ    L1FEA           ; 2
L1FE4:
    LDA    $0680           ; 4
    DEX                    ; 2
    BNE    L1FD2           ; 2
L1FEA:
    LDA    $0680           ; 4
    JSR    L1F88           ; 6
    LDA    $0481           ; 4
    LDA    $0582           ; 4
    LDA    $0884           ; 4
    JMP    L1000           ; 3
    .byte $BF ; |X XXXXXX| $1FFC
    .byte $1F ; |   XXXXX| $1FFD
    .byte $BF ; |X XXXXXX| $1FFE
    .byte $1F ; |   XXXXX| $1FFF
