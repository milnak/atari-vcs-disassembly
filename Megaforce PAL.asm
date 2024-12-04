; Disassembly of megap.bin
; Disassembled By Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcmega.cfg megap.bin
;
; mega.cfg contents:
;
;      ORG F000
;      GFX F000 F0BF
;      CODE F0C0 F1B4
;      GFX F1B5 F204
;      CODE F205 F2F5
;      GFX F2F6 F423
;      CODE F424 F4E0
;      GFX F4E1 F56E
;      CODE F56F FE99
;      GFX FE9A FFFF

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
RESP0   =  $10
RESP1   =  $11
RESM0   =  $12
RESM1   =  $13
RESBL   =  $14
AUDC1   =  $16
AUDF1   =  $18
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
HMM1    =  $23
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXM0P   =  $30
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296
LF192   =   $F192

       ORG $F000
    .byte $00 ; |        | $F000
    .byte $1E ; |   XXXX | $F001
    .byte $33 ; |  XX  XX| $F002
    .byte $33 ; |  XX  XX| $F003
    .byte $33 ; |  XX  XX| $F004
    .byte $33 ; |  XX  XX| $F005
    .byte $33 ; |  XX  XX| $F006
    .byte $1E ; |   XXXX | $F007
    .byte $00 ; |        | $F008
    .byte $3F ; |  XXXXXX| $F009
    .byte $0C ; |    XX  | $F00A
    .byte $0C ; |    XX  | $F00B
    .byte $0C ; |    XX  | $F00C
    .byte $0C ; |    XX  | $F00D
    .byte $3C ; |  XXXX  | $F00E
    .byte $1C ; |   XXX  | $F00F
    .byte $00 ; |        | $F010
    .byte $3F ; |  XXXXXX| $F011
    .byte $30 ; |  XX    | $F012
    .byte $30 ; |  XX    | $F013
    .byte $1E ; |   XXXX | $F014
    .byte $03 ; |      XX| $F015
    .byte $23 ; |  X   XX| $F016
    .byte $3E ; |  XXXXX | $F017
    .byte $00 ; |        | $F018
    .byte $1E ; |   XXXX | $F019
    .byte $23 ; |  X   XX| $F01A
    .byte $03 ; |      XX| $F01B
    .byte $06 ; |     XX | $F01C
    .byte $03 ; |      XX| $F01D
    .byte $23 ; |  X   XX| $F01E
    .byte $1E ; |   XXXX | $F01F
    .byte $00 ; |        | $F020
    .byte $06 ; |     XX | $F021
    .byte $06 ; |     XX | $F022
    .byte $3F ; |  XXXXXX| $F023
    .byte $26 ; |  X  XX | $F024
    .byte $16 ; |   X XX | $F025
    .byte $0E ; |    XXX | $F026
    .byte $06 ; |     XX | $F027
    .byte $00 ; |        | $F028
    .byte $3E ; |  XXXXX | $F029
    .byte $23 ; |  X   XX| $F02A
    .byte $03 ; |      XX| $F02B
    .byte $3E ; |  XXXXX | $F02C
    .byte $30 ; |  XX    | $F02D
    .byte $30 ; |  XX    | $F02E
    .byte $3F ; |  XXXXXX| $F02F
    .byte $00 ; |        | $F030
    .byte $1E ; |   XXXX | $F031
    .byte $33 ; |  XX  XX| $F032
    .byte $33 ; |  XX  XX| $F033
    .byte $3E ; |  XXXXX | $F034
    .byte $30 ; |  XX    | $F035
    .byte $31 ; |  XX   X| $F036
    .byte $1E ; |   XXXX | $F037
    .byte $00 ; |        | $F038
    .byte $0C ; |    XX  | $F039
    .byte $0C ; |    XX  | $F03A
    .byte $0C ; |    XX  | $F03B
    .byte $06 ; |     XX | $F03C
    .byte $03 ; |      XX| $F03D
    .byte $21 ; |  X    X| $F03E
    .byte $3F ; |  XXXXXX| $F03F
    .byte $00 ; |        | $F040
    .byte $1E ; |   XXXX | $F041
    .byte $33 ; |  XX  XX| $F042
    .byte $33 ; |  XX  XX| $F043
    .byte $1E ; |   XXXX | $F044
    .byte $33 ; |  XX  XX| $F045
    .byte $33 ; |  XX  XX| $F046
    .byte $1E ; |   XXXX | $F047
    .byte $00 ; |        | $F048
    .byte $1E ; |   XXXX | $F049
    .byte $23 ; |  X   XX| $F04A
    .byte $03 ; |      XX| $F04B
    .byte $1F ; |   XXXXX| $F04C
    .byte $33 ; |  XX  XX| $F04D
    .byte $33 ; |  XX  XX| $F04E
    .byte $1E ; |   XXXX | $F04F
    .byte $00 ; |        | $F050
    .byte $00 ; |        | $F051
    .byte $00 ; |        | $F052
    .byte $00 ; |        | $F053
    .byte $00 ; |        | $F054
    .byte $00 ; |        | $F055
    .byte $00 ; |        | $F056
    .byte $00 ; |        | $F057
    .byte $00 ; |        | $F058
    .byte $C0 ; |XX      | $F059
    .byte $C3 ; |XX    XX| $F05A
    .byte $C0 ; |XX      | $F05B
    .byte $F8 ; |XXXXX   | $F05C
    .byte $C3 ; |XX    XX| $F05D
    .byte $C0 ; |XX      | $F05E
    .byte $F8 ; |XXXXX   | $F05F
    .byte $00 ; |        | $F060
    .byte $97 ; |X  X XXX| $F061
    .byte $94 ; |X  X X  | $F062
    .byte $94 ; |X  X X  | $F063
    .byte $F4 ; |XXXX X  | $F064
    .byte $94 ; |X  X X  | $F065
    .byte $90 ; |X  X    | $F066
    .byte $F0 ; |XXXX    | $F067
    .byte $00 ; |        | $F068
    .byte $75 ; | XXX X X| $F069
    .byte $47 ; | X   XXX| $F06A
    .byte $76 ; | XXX XX | $F06B
    .byte $45 ; | X   X X| $F06C
    .byte $77 ; | XXX XXX| $F06D
    .byte $00 ; |        | $F06E
    .byte $00 ; |        | $F06F
    .byte $00 ; |        | $F070
    .byte $22 ; |  X   X | $F071
    .byte $20 ; |  X     | $F072
    .byte $22 ; |  X   X | $F073
    .byte $22 ; |  X   X | $F074
    .byte $72 ; | XXX  X | $F075
    .byte $02 ; |      X | $F076
    .byte $02 ; |      X | $F077
    .byte $00 ; |        | $F078
    .byte $E7 ; |XXX  XXX| $F079
    .byte $B4 ; |X XX X  | $F07A
    .byte $97 ; |X  X XXX| $F07B
    .byte $94 ; |X  X X  | $F07C
    .byte $97 ; |X  X XXX| $F07D
    .byte $B0 ; |X XX    | $F07E
    .byte $E0 ; |XXX     | $F07F
    .byte $00 ; |        | $F080
    .byte $4E ; | X  XXX | $F081
    .byte $48 ; | X  X   | $F082
    .byte $6E ; | XX XXX | $F083
    .byte $48 ; | X  X   | $F084
    .byte $6E ; | XX XXX | $F085
    .byte $00 ; |        | $F086
    .byte $00 ; |        | $F087
    .byte $00 ; |        | $F088
    .byte $B6 ; |X XX XX | $F089
    .byte $B5 ; |X XX X X| $F08A
    .byte $F5 ; |XXXX X X| $F08B
    .byte $D5 ; |XX X X X| $F08C
    .byte $D6 ; |XX X XX | $F08D
    .byte $00 ; |        | $F08E
    .byte $00 ; |        | $F08F
    .byte $00 ; |        | $F090
    .byte $42 ; | X    X | $F091
    .byte $66 ; | XX  XX | $F092
    .byte $3C ; |  XXXX  | $F093
    .byte $5A ; | X XX X | $F094
    .byte $3C ; |  XXXX  | $F095
    .byte $00 ; |        | $F096
    .byte $18 ; |   XX   | $F097
    .byte $00 ; |        | $F098
    .byte $8B ; |X   X XX| $F099
    .byte $AA ; |X X X X | $F09A
    .byte $AB ; |X X X XX| $F09B
    .byte $AA ; |X X X X | $F09C
    .byte $FB ; |XXXXX XX| $F09D
    .byte $D8 ; |XX XX   | $F09E
    .byte $88 ; |X   X   | $F09F
    .byte $00 ; |        | $F0A0
    .byte $BA ; |X XXX X | $F0A1
    .byte $2A ; |  X X X | $F0A2
    .byte $BB ; |X XXX XX| $F0A3
    .byte $22 ; |  X   X | $F0A4
    .byte $BB ; |X XXX XX| $F0A5
    .byte $00 ; |        | $F0A6
    .byte $00 ; |        | $F0A7
    .byte $00 ; |        | $F0A8
    .byte $8C ; |X   XX  | $F0A9
    .byte $8C ; |X   XX  | $F0AA
    .byte $8C ; |X   XX  | $F0AB
    .byte $8F ; |X   XXXX| $F0AC
    .byte $8C ; |X   XX  | $F0AD
    .byte $0C ; |    XX  | $F0AE
    .byte $0F ; |    XXXX| $F0AF
    .byte $00 ; |        | $F0B0
    .byte $75 ; | XXX X X| $F0B1
    .byte $57 ; | X X XXX| $F0B2
    .byte $56 ; | X X XX | $F0B3
    .byte $55 ; | X X X X| $F0B4
    .byte $77 ; | XXX XXX| $F0B5
    .byte $00 ; |        | $F0B6
    .byte $00 ; |        | $F0B7
    .byte $00 ; |        | $F0B8
    .byte $77 ; | XXX XXX| $F0B9
    .byte $44 ; | X   X  | $F0BA
    .byte $47 ; | X   XXX| $F0BB
    .byte $44 ; | X   X  | $F0BC
    .byte $77 ; | XXX XXX| $F0BD
    .byte $00 ; |        | $F0BE
    .byte $00 ; |        | $F0BF
LF0C0:
    JSR    LF18D           ; 6
    STA    WSYNC           ; 3
    LDA    #$07            ; 2
    STA    $A5             ; 3
    LDA    #$50            ; 2
    STA    $91             ; 3
    LDA    $99             ; 3
    STA    $95             ; 3
    LDA    $9A             ; 3
    STA    $93             ; 3
    LDA    #$58            ; 2
    STA    $97             ; 3
    LDA    #$90            ; 2
    STA    $8D             ; 3
    LDA    $C6             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    $8F             ; 3
    JSR    LF18D           ; 6
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    NUSIZ0          ; 3
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    STA    $94             ; 3
    STA    CXCLR           ; 3
    STA    $8E             ; 3
    LDY    #$56            ; 2
    LDA    #$F1            ; 2
    STA    $90             ; 3
    STA    $96             ; 3
    LDA    #$F2            ; 2
    STA    $92             ; 3
    LDA    #$05            ; 2
    STA    $91             ; 3
    STA    WSYNC           ; 3
    LDA    $8C             ; 3
    STA    COLUBK          ; 3
    LDX    #$1D            ; 2
    TXS                    ; 2
    BNE    LF129           ; 2
    LDX    $93             ; 3
    LDA    LF2F6,X         ; 4
    STA    GRP0            ; 3
    DEY                    ; 2
    BEQ    LF151           ; 2
    CPY    $95             ; 3
    BCS    LF139           ; 2
    LDA    LF381,X         ; 4
    BNE    LF142           ; 2
    CPY    #$05            ; 2
    BCC    LF139           ; 2
LF129:
    LDA    #$7A            ; 2
    STA    $8F             ; 3
    INC    $DA             ; 5
    LDX    $DA             ; 3
    LDA    $83,X           ; 4
    STA    COLUP0          ; 3
    LDA    $BA,X           ; 4
    AND    #$0F            ; 2
LF139:
    STA    WSYNC           ; 3
    STA    HMCLR           ; 3
    STA    $A5             ; 3
    JMP.ind ($0091)        ; 5
LF142:
    INC    $93             ; 5
    LDX    $98             ; 3
    STX    NUSIZ0          ; 3
    STA    WSYNC           ; 3
    STA    HMCLR           ; 3
    STA    GRP0            ; 3
    JMP.ind ($0091)        ; 5
LF151:
    JMP    LF821           ; 3
    LDX    $DA             ; 3
    LDA    $B0,X           ; 4
    STA    $95             ; 3
    DEY                    ; 2
    STA    HMCLR           ; 3
    LDA    $BA,X           ; 4
    STA    HMP0            ; 3
    LDA    $D1,X           ; 4
    STA    REFP0           ; 3
    STA    $98             ; 3
    LDA    CXM0P           ; 3
    STA    $BA,X           ; 4
    STA    CXCLR           ; 3
    LDA    $A7,X           ; 4
    LDX    #$12            ; 2
    STA    WSYNC           ; 3
    STA    $93             ; 3
    STX    $8F             ; 3
    JMP.ind ($0091)        ; 5
    LDX    $A5             ; 3
    LDA    #$54            ; 2
    DEY                    ; 2
LF17F:
    DEX                    ; 2
    BPL    LF17F           ; 2
    STA    RESP0           ; 3
    STA    WSYNC           ; 3
    STA    HMCLR           ; 3
    STA    $8F             ; 3
    JMP.ind ($0091)        ; 5
LF18D:
    LDY    $A5             ; 3
    LDA    ($8D),Y         ; 5
    STA    WSYNC           ; 3
    STA    $A6             ; 3
    LDA    ($8F),Y         ; 5
    TAX                    ; 2
    LDA    ($97),Y         ; 5
    STA    GRP0            ; 3
LF19C:
    LDA    ($95),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($93),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($91),Y         ; 5
LF1A6:
    LDY    $A6             ; 3
    STA    GRP1            ; 3
    STX    GRP0            ; 3
    STY    GRP1            ; 3
    STA    GRP0            ; 3
LF1B0:
    DEC    $A5             ; 5
    BPL    LF18D           ; 2
    RTS                    ; 6

    .byte $26 ; |  X  XX | $F1B5
    .byte $48 ; | X  X   | $F1B6
    .byte $42 ; | X    X | $F1B7
    .byte $46 ; | X   XX | $F1B8
    .byte $56 ; | X X XX | $F1B9
LF1BA:
    .byte $5A ; | X XX X | $F1BA
    .byte $2E ; |  X XXX | $F1BB
    .byte $1C ; |   XXX  | $F1BC
    .byte $88 ; |X   X   | $F1BD
    .byte $84 ; |X    X  | $F1BE
    .byte $00 ; |        | $F1BF
    .byte $00 ; |        | $F1C0
    .byte $FF ; |XXXXXXXX| $F1C1
    .byte $FF ; |XXXXXXXX| $F1C2
    .byte $FF ; |XXXXXXXX| $F1C3
LF1C4:
    .byte $FF ; |XXXXXXXX| $F1C4
    .byte $00 ; |        | $F1C5
    .byte $FF ; |XXXXXXXX| $F1C6
    .byte $FF ; |XXXXXXXX| $F1C7
    .byte $F0 ; |XXXX    | $F1C8
    .byte $00 ; |        | $F1C9
    .byte $00 ; |        | $F1CA
    .byte $70 ; | XXX    | $F1CB
    .byte $70 ; | XXX    | $F1CC
    .byte $50 ; | X X    | $F1CD
LF1CE:
    .byte $50 ; | X X    | $F1CE
    .byte $40 ; | X      | $F1CF
    .byte $30 ; |  XX    | $F1D0
    .byte $20 ; |  X     | $F1D1
    .byte $20 ; |  X     | $F1D2
    .byte $00 ; |        | $F1D3
    .byte $00 ; |        | $F1D4
    .byte $90 ; |X  X    | $F1D5
    .byte $90 ; |X  X    | $F1D6
    .byte $B0 ; |X XX    | $F1D7
LF1D8:
    .byte $D0 ; |XX X    | $F1D8
    .byte $D0 ; |XX X    | $F1D9
    .byte $D0 ; |XX X    | $F1DA
    .byte $E0 ; |XXX     | $F1DB
    .byte $00 ; |        | $F1DC
    .byte $00 ; |        | $F1DD
    .byte $24 ; |  X  X  | $F1DE
    .byte $40 ; | X      | $F1DF
    .byte $44 ; | X   X  | $F1E0
    .byte $40 ; | X      | $F1E1
    .byte $58 ; | X XX   | $F1E2
    .byte $3C ; |  XXXX  | $F1E3
    .byte $0C ; |    XX  | $F1E4
    .byte $8A ; |X   X X | $F1E5
    .byte $86 ; |X    XX | $F1E6
    .byte $00 ; |        | $F1E7
    .byte $00 ; |        | $F1E8
    .byte $70 ; | XXX    | $F1E9
    .byte $70 ; | XXX    | $F1EA
    .byte $60 ; | XX     | $F1EB
    .byte $40 ; | X      | $F1EC
    .byte $40 ; | X      | $F1ED
    .byte $00 ; |        | $F1EE
    .byte $20 ; |  X     | $F1EF
    .byte $10 ; |   X    | $F1F0
    .byte $00 ; |        | $F1F1
    .byte $00 ; |        | $F1F2
    .byte $90 ; |X  X    | $F1F3
    .byte $90 ; |X  X    | $F1F4
    .byte $A0 ; |X X     | $F1F5
    .byte $C0 ; |XX      | $F1F6
    .byte $D0 ; |XX X    | $F1F7
    .byte $00 ; |        | $F1F8
    .byte $E0 ; |XXX     | $F1F9
    .byte $F0 ; |XXXX    | $F1FA
    .byte $00 ; |        | $F1FB
    .byte $00 ; |        | $F1FC
    .byte $FF ; |XXXXXXXX| $F1FD
    .byte $FF ; |XXXXXXXX| $F1FE
    .byte $FF ; |XXXXXXXX| $F1FF
    .byte $FF ; |XXXXXXXX| $F200
    .byte $00 ; |        | $F201
    .byte $FF ; |XXXXXXXX| $F202
    .byte $FF ; |XXXXXXXX| $F203
    .byte $FF ; |XXXXXXXX| $F204
    LDX    $94             ; 3
    LDA    LF2F6,X         ; 4
    STA    GRP1            ; 3
    CPY    $BA             ; 3
    PHP                    ; 3
    PLA                    ; 4
    CPY    $96             ; 3
    BCS    LF234           ; 2
    LDA    LF381,X         ; 4
    BNE    LF243           ; 2
    CPY    #$14            ; 2
    BCC    LF23A           ; 2
    LDX    $8E             ; 3
    LDA    $BE,X           ; 4
    AND    #$0F            ; 2
    STA    $A6             ; 3
    LDA    #$77            ; 2
LF227:
    STA    $91             ; 3
    LDA    #$00            ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    ENAM0           ; 3
    JMP.ind ($008F)        ; 5
LF234:
    LDA    #$CE            ; 2
    CPY    #$2D            ; 2
    BEQ    LF227           ; 2
LF23A:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    $FF             ; 3
    JMP.ind ($008F)        ; 5
LF243:
    INC    $94             ; 5
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    GRP1            ; 3
    JMP.ind ($008F)        ; 5
    CPY    $BA             ; 3
    PHP                    ; 3
    PLA                    ; 4
    LDX    $8E             ; 3
    INC    $8E             ; 5
    LDA    $AB,X           ; 4
    STA    $94             ; 3
    LDA    $B4,X           ; 4
    STA    $96             ; 3
    LDA    $BE,X           ; 4
    STA    HMP1            ; 3
    LDA    $D5,X           ; 4
    STA    REFP1           ; 3
    STA    NUSIZ1          ; 3
    LDA    $87,X           ; 4
    STA    COLUP1          ; 3
    LDA    #$05            ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    $91             ; 3
    JMP.ind ($008F)        ; 5
    LDX    $A6             ; 3
    LDA    #$4E            ; 2
LF27B:
    DEX                    ; 2
    BPL    LF27B           ; 2
    STA    RESP1           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    $91             ; 3
    JMP.ind ($008F)        ; 5
LF289:
    LDA    LF1BA,Y         ; 4
    EOR    $A1             ; 3
    AND    $83             ; 3
    LDX    $93             ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    COLUBK          ; 3
    LDA    LF2F6,X         ; 4
    STA    GRP0            ; 3
    LDA    LF1D8,Y         ; 4
    STA    GRP1            ; 3
    LDA    LF1C4,Y         ; 4
    STA    HMCLR           ; 3
    STA    HMP1            ; 3
    LDA    LF1CE,Y         ; 4
    STA    HMM1            ; 3
    DEY                    ; 2
    CPY    $95             ; 3
    BCS    LF2F2           ; 2
    LDA    LF381,X         ; 4
    BEQ    LF2BE           ; 2
    LDX    $98             ; 3
    STX    NUSIZ0          ; 3
    INC    $93             ; 5
LF2BE:
    TAX                    ; 2
    LDA    LF192,Y         ; 4
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STX    GRP0            ; 3
    EOR    $A1             ; 3
    AND    $83             ; 3
    STA    COLUBK          ; 3
    LDA    LF19C,Y         ; 4
    STA    GRP1            ; 3
    STA    ENAM1           ; 3
    CPY    $BA             ; 3
    PHP                    ; 3
    PLA                    ; 4
    LDA    LF1A6,Y         ; 4
    STA    HMP1            ; 3
    LDA    LF1B0,Y         ; 4
    STA    HMM1            ; 3
    CPY    #$23            ; 2
    BNE    LF289           ; 2
    LDA    #$05            ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    $91             ; 3
    JMP.ind ($008F)        ; 5
LF2F2:
    LDA    #$00            ; 2
    BEQ    LF2BE           ; 2
LF2F6:
    .byte $00 ; |        | $F2F6
    .byte $00 ; |        | $F2F7
    .byte $1C ; |   XXX  | $F2F8
    .byte $B4 ; |X XX X  | $F2F9
    .byte $FF ; |XXXXXXXX| $F2FA
    .byte $03 ; |      XX| $F2FB
    .byte $A8 ; |X X X   | $F2FC
    .byte $00 ; |        | $F2FD
    .byte $00 ; |        | $F2FE
    .byte $1C ; |   XXX  | $F2FF
    .byte $B4 ; |X XX X  | $F300
    .byte $FF ; |XXXXXXXX| $F301
    .byte $03 ; |      XX| $F302
    .byte $00 ; |        | $F303
    .byte $00 ; |        | $F304
    .byte $18 ; |   XX   | $F305
    .byte $1C ; |   XXX  | $F306
    .byte $3B ; |  XXX XX| $F307
    .byte $AD ; |X X XX X| $F308
    .byte $42 ; | X    X | $F309
    .byte $00 ; |        | $F30A
    .byte $00 ; |        | $F30B
    .byte $18 ; |   XX   | $F30C
    .byte $1C ; |   XXX  | $F30D
    .byte $3B ; |  XXX XX| $F30E
    .byte $4A ; | X  X X | $F30F
    .byte $A5 ; |X X  X X| $F310
    .byte $00 ; |        | $F311
    .byte $00 ; |        | $F312
    .byte $6C ; | XX XX  | $F313
    .byte $6C ; | XX XX  | $F314
    .byte $00 ; |        | $F315
    .byte $00 ; |        | $F316
    .byte $3C ; |  XXXX  | $F317
    .byte $CC ; |XX  XX  | $F318
    .byte $3C ; |  XXXX  | $F319
    .byte $00 ; |        | $F31A
    .byte $00 ; |        | $F31B
    .byte $3C ; |  XXXX  | $F31C
    .byte $33 ; |  XX  XX| $F31D
    .byte $3C ; |  XXXX  | $F31E
    .byte $00 ; |        | $F31F
    .byte $00 ; |        | $F320
    .byte $7E ; | XXXXXX | $F321
    .byte $29 ; |  X X  X| $F322
    .byte $08 ; |    X   | $F323
    .byte $18 ; |   XX   | $F324
    .byte $10 ; |   X    | $F325
    .byte $30 ; |  XX    | $F326
    .byte $60 ; | XX     | $F327
    .byte $00 ; |        | $F328
    .byte $00 ; |        | $F329
    .byte $3C ; |  XXXX  | $F32A
    .byte $E3 ; |XXX   XX| $F32B
    .byte $A3 ; |X X   XX| $F32C
    .byte $AF ; |X X XXXX| $F32D
    .byte $AB ; |X X X XX| $F32E
    .byte $AB ; |X X X XX| $F32F
    .byte $BF ; |X XXXXXX| $F330
    .byte $AF ; |X X XXXX| $F331
    .byte $AF ; |X X XXXX| $F332
    .byte $BF ; |X XXXXXX| $F333
    .byte $AF ; |X X XXXX| $F334
    .byte $A3 ; |X X   XX| $F335
    .byte $00 ; |        | $F336
    .byte $00 ; |        | $F337
    .byte $10 ; |   X    | $F338
    .byte $28 ; |  X X   | $F339
    .byte $6C ; | XX XX  | $F33A
    .byte $EE ; |XXX XXX | $F33B
    .byte $BA ; |X XXX X | $F33C
    .byte $38 ; |  XXX   | $F33D
    .byte $00 ; |        | $F33E
    .byte $00 ; |        | $F33F
    .byte $7F ; | XXXXXXX| $F340
    .byte $00 ; |        | $F341
    .byte $00 ; |        | $F342
    .byte $00 ; |        | $F343
    .byte $5A ; | X XX X | $F344
    .byte $66 ; | XX  XX | $F345
    .byte $00 ; |        | $F346
    .byte $00 ; |        | $F347
    .byte $10 ; |   X    | $F348
    .byte $38 ; |  XXX   | $F349
    .byte $7C ; | XXXXX  | $F34A
    .byte $FE ; |XXXXXXX | $F34B
    .byte $FE ; |XXXXXXX | $F34C
    .byte $38 ; |  XXX   | $F34D
    .byte $FE ; |XXXXXXX | $F34E
    .byte $FF ; |XXXXXXXX| $F34F
    .byte $AB ; |X X X XX| $F350
    .byte $AB ; |X X X XX| $F351
    .byte $FF ; |XXXXXXXX| $F352
    .byte $C7 ; |XX   XXX| $F353
    .byte $C7 ; |XX   XXX| $F354
    .byte $00 ; |        | $F355
    .byte $00 ; |        | $F356
    .byte $10 ; |   X    | $F357
    .byte $38 ; |  XXX   | $F358
    .byte $7C ; | XXXXX  | $F359
    .byte $FE ; |XXXXXXX | $F35A
    .byte $FE ; |XXXXXXX | $F35B
    .byte $7C ; | XXXXX  | $F35C
    .byte $7C ; | XXXXX  | $F35D
    .byte $EE ; |XXX XXX | $F35E
    .byte $D6 ; |XX X XX | $F35F
    .byte $D6 ; |XX X XX | $F360
    .byte $FF ; |XXXXXXXX| $F361
    .byte $FF ; |XXXXXXXX| $F362
    .byte $AB ; |X X X XX| $F363
    .byte $AB ; |X X X XX| $F364
    .byte $AB ; |X X X XX| $F365
    .byte $00 ; |        | $F366
    .byte $00 ; |        | $F367
    .byte $10 ; |   X    | $F368
    .byte $09 ; |    X  X| $F369
    .byte $54 ; | X X X  | $F36A
    .byte $10 ; |   X    | $F36B
    .byte $04 ; |     X  | $F36C
    .byte $00 ; |        | $F36D
    .byte $00 ; |        | $F36E
    .byte $20 ; |  X     | $F36F
    .byte $48 ; | X  X   | $F370
    .byte $48 ; | X  X   | $F371
    .byte $28 ; |  X X   | $F372
    .byte $00 ; |        | $F373
    .byte $00 ; |        | $F374
    .byte $04 ; |     X  | $F375
    .byte $10 ; |   X    | $F376
    .byte $10 ; |   X    | $F377
    .byte $00 ; |        | $F378
    .byte $00 ; |        | $F379
    .byte $08 ; |    X   | $F37A
    .byte $08 ; |    X   | $F37B
    .byte $00 ; |        | $F37C
    .byte $00 ; |        | $F37D
    .byte $60 ; | XX     | $F37E
    .byte $60 ; | XX     | $F37F
    .byte $00 ; |        | $F380
LF381:
    .byte $00 ; |        | $F381
    .byte $04 ; |     X  | $F382
    .byte $38 ; |  XXX   | $F383
    .byte $D6 ; |XX X XX | $F384
    .byte $FE ; |XXXXXXX | $F385
    .byte $56 ; | X X XX | $F386
    .byte $50 ; | X X    | $F387
    .byte $00 ; |        | $F388
    .byte $04 ; |     X  | $F389
    .byte $38 ; |  XXX   | $F38A
    .byte $D6 ; |XX X XX | $F38B
    .byte $FE ; |XXXXXXX | $F38C
    .byte $06 ; |     XX | $F38D
    .byte $00 ; |        | $F38E
    .byte $08 ; |    X   | $F38F
    .byte $10 ; |   X    | $F390
    .byte $36 ; |  XX XX | $F391
    .byte $7A ; | XXXX X | $F392
    .byte $42 ; | X    X | $F393
    .byte $A5 ; |X X  X X| $F394
    .byte $00 ; |        | $F395
    .byte $08 ; |    X   | $F396
    .byte $10 ; |   X    | $F397
    .byte $36 ; |  XX XX | $F398
    .byte $7A ; | XXXX X | $F399
    .byte $A5 ; |X X  X X| $F39A
    .byte $42 ; | X    X | $F39B
    .byte $00 ; |        | $F39C
    .byte $48 ; | X  X   | $F39D
    .byte $FF ; |XXXXXXXX| $F39E
    .byte $48 ; | X  X   | $F39F
    .byte $00 ; |        | $F3A0
    .byte $18 ; |   XX   | $F3A1
    .byte $FF ; |XXXXXXXX| $F3A2
    .byte $FF ; |XXXXXXXX| $F3A3
    .byte $18 ; |   XX   | $F3A4
    .byte $00 ; |        | $F3A5
    .byte $18 ; |   XX   | $F3A6
    .byte $FF ; |XXXXXXXX| $F3A7
    .byte $FF ; |XXXXXXXX| $F3A8
    .byte $18 ; |   XX   | $F3A9
    .byte $00 ; |        | $F3AA
    .byte $1C ; |   XXX  | $F3AB
    .byte $9B ; |X  XX XX| $F3AC
    .byte $28 ; |  X X   | $F3AD
    .byte $08 ; |    X   | $F3AE
    .byte $10 ; |   X    | $F3AF
    .byte $30 ; |  XX    | $F3B0
    .byte $20 ; |  X     | $F3B1
    .byte $60 ; | XX     | $F3B2
    .byte $00 ; |        | $F3B3
    .byte $18 ; |   XX   | $F3B4
    .byte $7E ; | XXXXXX | $F3B5
    .byte $EF ; |XXX XXXX| $F3B6
    .byte $EF ; |XXX XXXX| $F3B7
    .byte $FF ; |XXXXXXXX| $F3B8
    .byte $EB ; |XXX X XX| $F3B9
    .byte $E3 ; |XXX   XX| $F3BA
    .byte $E3 ; |XXX   XX| $F3BB
    .byte $E3 ; |XXX   XX| $F3BC
    .byte $E3 ; |XXX   XX| $F3BD
    .byte $EF ; |XXX XXXX| $F3BE
    .byte $EF ; |XXX XXXX| $F3BF
    .byte $FF ; |XXXXXXXX| $F3C0
    .byte $00 ; |        | $F3C1
    .byte $10 ; |   X    | $F3C2
    .byte $38 ; |  XXX   | $F3C3
    .byte $38 ; |  XXX   | $F3C4
    .byte $FE ; |XXXXXXX | $F3C5
    .byte $FE ; |XXXXXXX | $F3C6
    .byte $92 ; |X  X  X | $F3C7
    .byte $28 ; |  X X   | $F3C8
    .byte $00 ; |        | $F3C9
    .byte $1E ; |   XXXX | $F3CA
    .byte $FF ; |XXXXXXXX| $F3CB
    .byte $00 ; |        | $F3CC
    .byte $18 ; |   XX   | $F3CD
    .byte $3C ; |  XXXX  | $F3CE
    .byte $3C ; |  XXXX  | $F3CF
    .byte $42 ; | X    X | $F3D0
    .byte $00 ; |        | $F3D1
    .byte $10 ; |   X    | $F3D2
    .byte $10 ; |   X    | $F3D3
    .byte $38 ; |  XXX   | $F3D4
    .byte $FE ; |XXXXXXX | $F3D5
    .byte $FE ; |XXXXXXX | $F3D6
    .byte $7C ; | XXXXX  | $F3D7
    .byte $7C ; | XXXXX  | $F3D8
    .byte $FE ; |XXXXXXX | $F3D9
    .byte $AB ; |X X X XX| $F3DA
    .byte $AB ; |X X X XX| $F3DB
    .byte $AB ; |X X X XX| $F3DC
    .byte $EF ; |XXX XXXX| $F3DD
    .byte $C7 ; |XX   XXX| $F3DE
    .byte $C7 ; |XX   XXX| $F3DF
    .byte $00 ; |        | $F3E0
    .byte $10 ; |   X    | $F3E1
    .byte $10 ; |   X    | $F3E2
    .byte $38 ; |  XXX   | $F3E3
    .byte $FE ; |XXXXXXX | $F3E4
    .byte $FE ; |XXXXXXX | $F3E5
    .byte $FE ; |XXXXXXX | $F3E6
    .byte $38 ; |  XXX   | $F3E7
    .byte $7C ; | XXXXX  | $F3E8
    .byte $D6 ; |XX X XX | $F3E9
    .byte $FE ; |XXXXXXX | $F3EA
    .byte $D6 ; |XX X XX | $F3EB
    .byte $FF ; |XXXXXXXX| $F3EC
    .byte $AB ; |X X X XX| $F3ED
    .byte $AB ; |X X X XX| $F3EE
    .byte $AB ; |X X X XX| $F3EF
    .byte $AB ; |X X X XX| $F3F0
    .byte $00 ; |        | $F3F1
    .byte $08 ; |    X   | $F3F2
    .byte $42 ; | X    X | $F3F3
    .byte $80 ; |X       | $F3F4
    .byte $81 ; |X      X| $F3F5
    .byte $4A ; | X  X X | $F3F6
    .byte $10 ; |   X    | $F3F7
    .byte $00 ; |        | $F3F8
    .byte $08 ; |    X   | $F3F9
    .byte $14 ; |   X X  | $F3FA
    .byte $22 ; |  X   X | $F3FB
    .byte $10 ; |   X    | $F3FC
    .byte $10 ; |   X    | $F3FD
    .byte $00 ; |        | $F3FE
    .byte $10 ; |   X    | $F3FF
    .byte $28 ; |  X X   | $F400
    .byte $04 ; |     X  | $F401
    .byte $08 ; |    X   | $F402
    .byte $00 ; |        | $F403
    .byte $10 ; |   X    | $F404
    .byte $20 ; |  X     | $F405
    .byte $20 ; |  X     | $F406
    .byte $00 ; |        | $F407
    .byte $30 ; |  XX    | $F408
    .byte $FF ; |XXXXXXXX| $F409
    .byte $30 ; |  XX    | $F40A
    .byte $00 ; |        | $F40B
LF40C:
    .byte $80 ; |X       | $F40C
LF40D:
    .byte $80 ; |X       | $F40D
LF40E:
    .byte $40 ; | X      | $F40E
    .byte $20 ; |  X     | $F40F
    .byte $10 ; |   X    | $F410
    .byte $08 ; |    X   | $F411
    .byte $04 ; |     X  | $F412
    .byte $02 ; |      X | $F413
    .byte $01 ; |       X| $F414
    .byte $02 ; |      X | $F415
LF416:
    .byte $00 ; |        | $F416
    .byte $30 ; |  XX    | $F417
    .byte $30 ; |  XX    | $F418
    .byte $31 ; |  XX   X| $F419
    .byte $30 ; |  XX    | $F41A
    .byte $31 ; |  XX   X| $F41B
    .byte $32 ; |  XX  X | $F41C
    .byte $33 ; |  XX  XX| $F41D
LF41E:
    .byte $80 ; |X       | $F41E
    .byte $40 ; | X      | $F41F
    .byte $20 ; |  X     | $F420
LF421:
    .byte $4E ; | X  XXX | $F421
    .byte $42 ; | X    X | $F422
    .byte $38 ; |  XXX   | $F423
LF424:
    LDX    $DE             ; 3
    STA    $DE             ; 3
    CPX    #$08            ; 2
    BCS    LF44C           ; 2
    LDA    $A7             ; 3
    BPL    LF432           ; 2
    LDA    #$00            ; 2
LF432:
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LF416,Y         ; 4
    AND    $A7             ; 3
    STA    $A6             ; 3
    LDA    $A2             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    LF416,Y         ; 4
    AND    $A2             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ORA    $A6             ; 3
    STA    $E0,X           ; 4
LF44C:
    TXA                    ; 2
    TAY                    ; 2
    LDX    #$02            ; 2
LF450:
    CPY    #$08            ; 2
    BCS    LF49A           ; 2
    LDA    $E8,X           ; 4
    AND    LF40D,Y         ; 4
    BEQ    LF49A           ; 2
    LDA    $A5             ; 3
    BMI    LF474           ; 2
    LDA    $CA,X           ; 4
    CMP    #$30            ; 2
    BCC    LF49A           ; 2
    LDA    $D5,X           ; 4
    ORA    #$80            ; 2
    STA    $D5,X           ; 4
    LDA    #$01            ; 2
    STA    $98             ; 3
    LDA    LF40E,Y         ; 4
    BNE    LF484           ; 2
LF474:
    LDA    $CA,X           ; 4
    CMP    #$C4            ; 2
    BCS    LF49A           ; 2
    TYA                    ; 2
    BEQ    LF4B1           ; 2
    LDA    #$10            ; 2
    STA    $98             ; 3
    LDA    LF40C,Y         ; 4
LF484:
    EOR    $E8,X           ; 4
    CMP    $E8,X           ; 4
    BCS    LF492           ; 2
    LDA    $F1             ; 3
    ADC    $98             ; 3
    STA    $F1             ; 3
    LDA    $E8,X           ; 4
LF492:
    EOR    LF40D,Y         ; 4
    STA    $E8,X           ; 4
    JMP    LF4B1           ; 3
LF49A:
    LDA    LF41E,X         ; 4
    BIT    SWCHB           ; 4
    BPL    LF4A4           ; 2
    LDA    #$90            ; 2
LF4A4:
    STA    $D5,X           ; 4
    LDA    LF421,X         ; 4
    STA    $B4,X           ; 4
    LDA    $A5             ; 3
    EOR    #$E0            ; 2
    STA    $CA,X           ; 4
LF4B1:
    DEX                    ; 2
    BPL    LF450           ; 2
    LDX    $DE             ; 3
    LDA    LF600,X         ; 4
    AND    #$0F            ; 2
    CPX    #$08            ; 2
    BCS    LF4C1           ; 2
    LDA    $E0,X           ; 4
LF4C1:
    TAY                    ; 2
    AND    #$33            ; 2
    ORA    #$44            ; 2
    BCC    LF4CA           ; 2
    ORA    #$A0            ; 2
LF4CA:
    STA    $A7             ; 3
    TYA                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    AND    #$33            ; 2
    ORA    #$04            ; 2
    STA    $A2             ; 3
LF4D5:
    LDX    #$FF            ; 2
    STX    $B9             ; 3
    INX                    ; 2
    STX    $B0             ; 3
    STX    $EB             ; 3
    STX    $A4             ; 3
    RTS                    ; 6

LF4E1:
    .byte $00 ; |        | $F4E1
    .byte $ED ; |XXX XX X| $F4E2
    .byte $F8 ; |XXXXX   | $F4E3
    .byte $C6 ; |XX   XX | $F4E4
    .byte $86 ; |X    XX | $F4E5
    .byte $45 ; | X   X X| $F4E6
    .byte $E6 ; |XXX  XX | $F4E7
    .byte $06 ; |     XX | $F4E8
    .byte $06 ; |     XX | $F4E9
    .byte $05 ; |     X X| $F4EA
    .byte $05 ; |     X X| $F4EB
    .byte $04 ; |     X  | $F4EC
    .byte $03 ; |      XX| $F4ED
    .byte $03 ; |      XX| $F4EE
    .byte $02 ; |      X | $F4EF
    .byte $02 ; |      X | $F4F0
    .byte $02 ; |      X | $F4F1
    .byte $00 ; |        | $F4F2
    .byte $E0 ; |XXX     | $F4F3
    .byte $F8 ; |XXXXX   | $F4F4
    .byte $04 ; |     X  | $F4F5
    .byte $28 ; |  X X   | $F4F6
    .byte $EA ; |XXX X X | $F4F7
    .byte $1A ; |   XX X | $F4F8
    .byte $B8 ; |X XXX   | $F4F9
    .byte $00 ; |        | $F4FA
    .byte $E2 ; |XXX   X | $F4FB
    .byte $F3 ; |XXXX  XX| $F4FC
    .byte $2F ; |  X XXXX| $F4FD
    .byte $1F ; |   XXXXX| $F4FE
    .byte $2F ; |  X XXXX| $F4FF
    .byte $1F ; |   XXXXX| $F500
    .byte $2F ; |  X XXXX| $F501
    .byte $F8 ; |XXXXX   | $F502
    .byte $E2 ; |XXX   X | $F503
    .byte $3F ; |  XXXXXX| $F504
    .byte $4F ; | X  XXXX| $F505
    .byte $5F ; | X XXXXX| $F506
    .byte $5B ; | X XX XX| $F507
    .byte $6D ; | XX XX X| $F508
    .byte $7C ; | XXXXX  | $F509
    .byte $8C ; |X   XX  | $F50A
    .byte $9C ; |X  XXX  | $F50B
    .byte $AA ; |X X X X | $F50C
    .byte $BA ; |X XXX X | $F50D
    .byte $CA ; |XX  X X | $F50E
    .byte $F8 ; |XXXXX   | $F50F
    .byte $E9 ; |XXX X  X| $F510
    .byte $0E ; |    XXX | $F511
    .byte $1E ; |   XXXX | $F512
    .byte $2E ; |  X XXX | $F513
    .byte $3F ; |  XXXXXX| $F514
    .byte $4F ; | X  XXXX| $F515
    .byte $5A ; | X XX X | $F516
    .byte $6B ; | XX X XX| $F517
    .byte $7C ; | XXXXX  | $F518
    .byte $8C ; |X   XX  | $F519
    .byte $9D ; |X  XXX X| $F51A
    .byte $AD ; |X X XX X| $F51B
    .byte $BE ; |X XXXXX | $F51C
    .byte $CF ; |XX  XXXX| $F51D
    .byte $DF ; |XX XXXXX| $F51E
    .byte $DF ; |XX XXXXX| $F51F
    .byte $DE ; |XX XXXX | $F520
    .byte $DE ; |XX XXXX | $F521
    .byte $DE ; |XX XXXX | $F522
    .byte $DE ; |XX XXXX | $F523
    .byte $DE ; |XX XXXX | $F524
    .byte $DD ; |XX XXX X| $F525
    .byte $DD ; |XX XXX X| $F526
    .byte $DD ; |XX XXX X| $F527
    .byte $DC ; |XX XXX  | $F528
    .byte $DC ; |XX XXX  | $F529
    .byte $DA ; |XX XX X | $F52A
    .byte $DA ; |XX XX X | $F52B
    .byte $DA ; |XX XX X | $F52C
    .byte $DA ; |XX XX X | $F52D
    .byte $D9 ; |XX XX  X| $F52E
    .byte $D9 ; |XX XX  X| $F52F
    .byte $D7 ; |XX X XXX| $F530
    .byte $B7 ; |X XX XXX| $F531
    .byte $A7 ; |X X  XXX| $F532
    .byte $F3 ; |XXXX  XX| $F533
    .byte $97 ; |X  X XXX| $F534
    .byte $89 ; |X   X  X| $F535
    .byte $77 ; | XXX XXX| $F536
    .byte $66 ; | XX  XX | $F537
    .byte $55 ; | X X X X| $F538
    .byte $44 ; | X   X  | $F539
    .byte $33 ; |  XX  XX| $F53A
    .byte $22 ; |  X   X | $F53B
    .byte $21 ; |  X    X| $F53C
    .byte $00 ; |        | $F53D
    .byte $E0 ; |XXX     | $F53E
    .byte $F2 ; |XXXX  X | $F53F
    .byte $22 ; |  X   X | $F540
    .byte $00 ; |        | $F541
    .byte $E3 ; |XXX   XX| $F542
    .byte $FC ; |XXXXXX  | $F543
    .byte $12 ; |   X  X | $F544
    .byte $22 ; |  X   X | $F545
    .byte $32 ; |  XX  X | $F546
    .byte $42 ; | X    X | $F547
    .byte $32 ; |  XX  X | $F548
    .byte $22 ; |  X   X | $F549
    .byte $12 ; |   X  X | $F54A
    .byte $00 ; |        | $F54B
    .byte $E0 ; |XXX     | $F54C
    .byte $F2 ; |XXXX  X | $F54D
    .byte $82 ; |X     X | $F54E
    .byte $00 ; |        | $F54F
    .byte $E1 ; |XXX    X| $F550
    .byte $F8 ; |XXXXX   | $F551
    .byte $12 ; |   X  X | $F552
    .byte $24 ; |  X  X  | $F553
    .byte $36 ; |  XX XX | $F554
    .byte $48 ; | X  X   | $F555
    .byte $5A ; | X XX X | $F556
    .byte $4C ; | X  XX  | $F557
    .byte $3E ; |  XXXXX | $F558
    .byte $E8 ; |XXX X   | $F559
    .byte $F8 ; |XXXXX   | $F55A
    .byte $0A ; |    X X | $F55B
    .byte $19 ; |   XX  X| $F55C
    .byte $28 ; |  X X   | $F55D
    .byte $37 ; |  XX XXX| $F55E
    .byte $46 ; | X   XX | $F55F
    .byte $35 ; |  XX X X| $F560
    .byte $25 ; |  X  X X| $F561
    .byte $34 ; |  XX X  | $F562
    .byte $44 ; | X   X  | $F563
    .byte $53 ; | X X  XX| $F564
    .byte $43 ; | X    XX| $F565
    .byte $32 ; |  XX  X | $F566
    .byte $22 ; |  X   X | $F567
    .byte $12 ; |   X  X | $F568
    .byte $02 ; |      X | $F569
    .byte $00 ; |        | $F56A
    .byte $ED ; |XXX XX X| $F56B
    .byte $F3 ; |XXXX  XX| $F56C
    .byte $53 ; | X X  XX| $F56D
    .byte $00 ; |        | $F56E

START:
    SEI                    ; 2
    CLD                    ; 2
    LDX    #$00            ; 2
    LDY    #$C0            ; 2
LF575:
    LDA    #$00            ; 2
LF577:
    STA    VSYNC,X         ; 4
    INX                    ; 2
    BNE    LF577           ; 2
    STY    $80             ; 3
    LDY    $81             ; 3
    LDX    LFFE8,Y         ; 4
    LDA    LFFC0,Y         ; 4
    AND    #$0F            ; 2
    STA    $C6             ; 3
    LDA    #$15            ; 2
    STA    CTRLPF          ; 3
LF58E:
    STX    $DF             ; 3
    LDA    #$5F            ; 2
    STA    $E0             ; 3
    LDX    #$FF            ; 2
    STX    $E7             ; 3
    STX    $DE             ; 3
    LDY    $DF             ; 3
    INX                    ; 2
LF59D:
    LDA    LFF52,Y         ; 4
    STA    $E1,X           ; 4
    INY                    ; 2
    INX                    ; 2
    CPX    #$06            ; 2
    BCC    LF59D           ; 2
    LDA    $DF             ; 3
    SBC    #$FA            ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDX    #$02            ; 2
LF5B0:
    DEY                    ; 2
    LDA    LFF67,Y         ; 4
    STA    $E8,X           ; 4
    DEX                    ; 2
    BPL    LF5B0           ; 2
LF5B9:
    LDA    LFF8D,Y         ; 4
    STA    $99             ; 3
    LDA    #$D3            ; 2
    STA    $C9             ; 3
    STA    $BA             ; 3
    STA    $B2             ; 3
    LDA    #$1F            ; 2
    STA    $B1             ; 3
    LDA    #$30            ; 2
    STA    $EC             ; 3
    STA    PF0             ; 3
    LDA    #$A0            ; 2
    STA    $C7             ; 3
    LDX    #$48            ; 2
    STX    $9A             ; 3
    STX    $CD             ; 3
    DEX                    ; 2
    STX    $D1             ; 3
    LDA    #$29            ; 2
    STA    $B7             ; 3
    LDA    #$36            ; 2
    STA    $D8             ; 3
    LDX    #$FF            ; 2
    TXS                    ; 2
    TXA                    ; 2
    JSR    LF424           ; 6
    STX    $D2             ; 3
    STX    $DC             ; 3
    STX    $DD             ; 3
    STX    $F9             ; 3
    STX    $B8             ; 3
    STX    $B3             ; 3
LF5F8:
    LDX    INTIM           ; 4
    BNE    LF5F8           ; 2
    DEX                    ; 2
    LDA    #$4D            ; 2
LF600:
    STA    WSYNC           ; 3
    STX    VSYNC           ; 3
    STA    TIM64T          ; 4
    LDX    #$02            ; 2
LF609:
    STA    WSYNC           ; 3
    LDY    $F5,X           ; 4
    LDA    LF4E1,Y         ; 4
    BNE    LF620           ; 2
    LDY    $F7,X           ; 4
    BEQ    LF635           ; 2
    BIT    $80             ; 3
    BMI    LF635           ; 2
    STY    $F5,X           ; 4
    STA    $F7,X           ; 4
    BPL    LF640           ; 2
LF620:
    INC    $F5,X           ; 6
    CMP    #$F0            ; 2
    BCC    LF62A           ; 2
    STA    RESBL,X         ; 4
    BCS    LF640           ; 2
LF62A:
    CMP    #$E0            ; 2
    BCC    LF635           ; 2
    AND    #$0F            ; 2
    ASL                    ; 2
    STA    $F9,X           ; 4
    BCC    LF640           ; 2
LF635:
    STA    AUDF1,X         ; 4
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    CLC                    ; 2
    ADC    $F9,X           ; 4
    STA    AUDC1,X         ; 4
LF640:
    DEX                    ; 2
    BNE    LF609           ; 2
    STA    WSYNC           ; 3
    STX    VSYNC           ; 3
    JSR    LFB64           ; 6
    LDA    $99             ; 3
    CMP    #$10            ; 2
    BCS    LF65A           ; 2
    LDA    #$8A            ; 2
    STA    $F8             ; 3
    LDA    $A3             ; 3
    AND    $84             ; 3
    STA    $84             ; 3
LF65A:
    LDY    $B2             ; 3
    BPL    LF686           ; 2
    LDA    INPT4           ; 3
    BMI    LF686           ; 2
    LDA    $80             ; 3
    AND    #$88            ; 2
    BNE    LF686           ; 2
    STA    $A4             ; 3
    LDY    #$1C            ; 2
    STY    $A9             ; 3
    LDA    #$0E            ; 2
    STA    $DB             ; 3
    LDA    $B1             ; 3
    SBC    #$02            ; 2
    STA    $B2             ; 3
    LDA    $C7             ; 3
    STA    $C8             ; 3
    LDA    $D2             ; 3
    STA    $D3             ; 3
    LDA    #$01            ; 2
    STA    $F6             ; 3
    BPL    LF6C9           ; 2
LF686:
    LDA    $DB             ; 3
    BEQ    LF68C           ; 2
    DEC    $DB             ; 5
LF68C:
    LSR                    ; 2
    TAX                    ; 2
    CPY    #$2F            ; 2
    BCS    LF69A           ; 2
    LDY    LFEBF,X         ; 4
    LDA    LFEB7,X         ; 4
    BCC    LF69F           ; 2
LF69A:
    LDY    LFEAF,X         ; 4
    LDA    #$00            ; 2
LF69F:
    CLC                    ; 2
    ADC    $B2             ; 3
    STA    $B2             ; 3
    BMI    LF6C2           ; 2
    LDA    LFEA7,X         ; 4
    AND    $83             ; 3
    STA    $85             ; 3
    TYA                    ; 2
    LDY    $D3             ; 3
    CPY    #$08            ; 2
    BCC    LF6B6           ; 2
    EOR    #$FF            ; 2
LF6B6:
    ADC    $C8             ; 3
    STA    $C8             ; 3
    CMP    #$30            ; 2
    BCC    LF6C2           ; 2
    CMP    #$D0            ; 2
    BCC    LF6C9           ; 2
LF6C2:
    LDX    #$00            ; 2
    STX    $A9             ; 3
    DEX                    ; 2
    STX    $B2             ; 3
LF6C9:
    LDX    #$0A            ; 2
LF6CB:
    LDA    LFF71,X         ; 4
    LSR                    ; 2
    LDA    $C7,X           ; 4
    BCC    LF6D5           ; 2
    LDA    $8B,X           ; 4
LF6D5:
    SEC                    ; 2
    SBC    #$30            ; 2
    CMP    #$94            ; 2
    BCC    LF6F0           ; 2
    CPX    #$08            ; 2
    BEQ    LF6E4           ; 2
    CPX    #$03            ; 2
    BCS    LF6E8           ; 2
LF6E4:
    LDA    #$89            ; 2
    BNE    LF70F           ; 2
LF6E8:
    CMP    #$A0            ; 2
    BCC    LF6F0           ; 2
    LDA    #$FA            ; 2
    BNE    LF70F           ; 2
LF6F0:
    TAY                    ; 2
    AND    #$0F            ; 2
    STA    $A5             ; 3
    TYA                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    CLC                    ; 2
    ADC    $A5             ; 3
    CMP    #$0F            ; 2
    BCC    LF705           ; 2
    SBC    #$0F            ; 2
    INY                    ; 2
LF705:
    STY    $A5             ; 3
    EOR    #$07            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ORA    $A5             ; 3
LF70F:
    STA    $BB,X           ; 4
    DEX                    ; 2
    BPL    LF6CB           ; 2
    LDX    #$05            ; 2
    STX    $A5             ; 3
    INX                    ; 2
    LDA    $80             ; 3
    ROL                    ; 2
    BMI    LF74A           ; 2
    BIT    $A3             ; 3
    BVS    LF748           ; 2
    BCS    LF74A           ; 2
    LDA    $E8             ; 3
    ORA    $E9             ; 3
    ORA    $EA             ; 3
    LDY    #$40            ; 2
    LDX    #$0C            ; 2
    CMP    #$40            ; 2
    BCS    LF73D           ; 2
    LDY    $DE             ; 3
    AND    LF40E,Y         ; 4
    BEQ    LF748           ; 2
    LDX    #$12            ; 2
    LDY    #$44            ; 2
LF73D:
    LDA    $E0             ; 3
    BEQ    LF742           ; 2
    TYA                    ; 2
LF742:
    AND    $83             ; 3
    STA    COLUBK          ; 3
    BPL    LF74A           ; 2
LF748:
    LDX    #$00            ; 2
LF74A:
    LDY    #$0A            ; 2
LF74C:
    LDA    $9B,X           ; 4
    BEQ    LF752           ; 2
    STX    $A5             ; 3
LF752:
    CPX    $A5             ; 3
    BCS    LF758           ; 2
    LDA    #$50            ; 2
LF758:
    CPX    #$06            ; 2
    BCC    LF766           ; 2
    LDA    LFEC4,X         ; 4
    BNE    LF766           ; 2
    ADC    $81             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
LF766:
    STA.wy $008D,Y         ; 5
    INX                    ; 2
    DEY                    ; 2
    DEY                    ; 2
    BPL    LF74C           ; 2
    LDA    $B3             ; 3
    STA    $FD             ; 3
    LDA    $A9             ; 3
    STA    $EE             ; 3
    LDA    #$00            ; 2
    STA    COLUPF          ; 3
    LDX    $B9             ; 3
    CPX    #$80            ; 2
    ROL                    ; 2
    CPX    #$23            ; 2
    BCC    LF787           ; 2
    LDX    #$34            ; 2
    CPX    $B1             ; 3
LF787:
    ROL                    ; 2
    LDX    $B2             ; 3
    STX    $FC             ; 3
    CPX    #$80            ; 2
    ROL                    ; 2
    TAX                    ; 2
    LDA    $A3             ; 3
    AND    LFF1A,X         ; 4
    TAY                    ; 2
    AND    #$01            ; 2
    STA    $DA             ; 3
    BNE    LF79E           ; 2
    STA    $A9             ; 3
LF79E:
    TYA                    ; 2
    CMP    LFF89,X         ; 4
    BNE    LF7B0           ; 2
    LDA    $B9             ; 3
    STA    $B2             ; 3
    LDA    $B0             ; 3
    STA    $A9             ; 3
    LDA    $C3             ; 3
    STA    $BC             ; 3
LF7B0:
    LDA    $B3             ; 3
    CLC                    ; 2
    ADC    #$09            ; 2
    CMP    $B2             ; 3
    BCC    LF7CD           ; 2
    LDA    $A3             ; 3
    DEX                    ; 2
    BPL    LF7BF           ; 2
    LSR                    ; 2
LF7BF:
    LSR                    ; 2
    LDY    #$00            ; 2
    BCS    LF7CB           ; 2
    STY    $A9             ; 3
    DEY                    ; 2
    STY    $B2             ; 3
    BNE    LF7CD           ; 2
LF7CB:
    STY    $B3             ; 3
LF7CD:
    LDX    INTIM           ; 4
    BNE    LF7CD           ; 2
    STA    WSYNC           ; 3
    LDA    $C5             ; 3
    STA    HMM1            ; 3
    AND    #$0F            ; 2
    TAY                    ; 2
    INC    $FF,X           ; 6
LF7DD:
    DEY                    ; 2
    BPL    LF7DD           ; 2
    STA    RESM1           ; 3
    STA    WSYNC           ; 3
    LDA    $C4             ; 3
    STA    HMM0            ; 3
    AND    #$0F            ; 2
    TAY                    ; 2
    DEC    $FF,X           ; 6
LF7ED:
    DEY                    ; 2
    BPL    LF7ED           ; 2
    STA    RESM0           ; 3
    STA    WSYNC           ; 3
    STX    VBLANK          ; 3
    LDA    #$F0            ; 2
    STA    $8E             ; 3
    STA    $90             ; 3
    STA    $92             ; 3
    STA    $94             ; 3
    STA    $96             ; 3
    STA    $98             ; 3
    LDA    #$07            ; 2
    STA    $A5             ; 3
    NOP                    ; 2
    LSR                    ; 2
    LDX    #$10            ; 2
    STX    HMP1            ; 3
    STA    RESP0           ; 3
    STA    RESP1           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    NUSIZ1          ; 3
    STA    NUSIZ0          ; 3
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    JMP    LF0C0           ; 3
LF821:
    LDA    #$43            ; 2
    STA    WSYNC           ; 3
    STA    TIM64T          ; 4
    LDX    #$FF            ; 2
    STX    VBLANK          ; 3
    TXS                    ; 2
    STX    $95             ; 3
    INX                    ; 2
    STX    GRP0            ; 3
    STX    GRP1            ; 3
    STX    GRP0            ; 3
    STX    ENAM0           ; 3
    STX    $A1             ; 3
    STX    REFP0           ; 3
    STX    REFP1           ; 3
    LDA    $FC             ; 3
    CMP    $B2             ; 3
    BEQ    LF846           ; 2
    STX    $BD             ; 3
LF846:
    STA    $B2             ; 3
    LDA    $FD             ; 3
    STA    $B3             ; 3
    LDA    $EE             ; 3
    STA    $A9             ; 3
    INC    $82             ; 5
    LDX    $82             ; 3
    LDA    LFC59,X         ; 4
    EOR    $A3             ; 3
    STA    $96             ; 3
    INC    $A3             ; 5
    BNE    LF866           ; 2
    INC    $A4             ; 5
    BNE    LF866           ; 2
    SEC                    ; 2
    ROR    $A4             ; 5
LF866:
    LDA    SWCHB           ; 4
    AND    #$08            ; 2
    ASL                    ; 2
    SBC    #$00            ; 2
    EOR    #$F0            ; 2
    LDY    $A4             ; 3
    BPL    LF878           ; 2
    STY    $A1             ; 3
    AND    #$F7            ; 2
LF878:
    STA    $83             ; 3
    ASL    $A1             ; 5
    LDX    #$0C            ; 2
LF87E:
    LDA    $A1             ; 3
    EOR    LFE9A,X         ; 4
    AND    $83             ; 3
    STA    $84,X           ; 4
    CPX    #$09            ; 2
    BCC    LF88D           ; 2
    STA    $FD,X           ; 4
LF88D:
    DEX                    ; 2
    BPL    LF87E           ; 2
    LDA    SWCHB           ; 4
    EOR    #$FF            ; 2
    LDY    #$09            ; 2
    LSR    $80             ; 5
    AND    #$03            ; 2
    BEQ    LF8B0           ; 2
    BCS    LF8B1           ; 2
    LSR                    ; 2
    BEQ    LF8AB           ; 2
    CLC                    ; 2
    ADC    $81             ; 3
    AND    #$03            ; 2
    STA    $81             ; 3
    LDY    #$C9            ; 2
LF8AB:
    LDX    #$8D            ; 2
    JMP    LF575           ; 3
LF8B0:
    CLC                    ; 2
LF8B1:
    ROL    $80             ; 5
    LDA    $DF             ; 3
    LSR                    ; 2
    STA    $97             ; 3
    TAY                    ; 2
    LDA    LFF81,Y         ; 4
    BCC    LF8C0           ; 2
    ADC    #$0E            ; 2
LF8C0:
    ADC    $F2             ; 3
    STA    $F2             ; 3
    LDA    #$01            ; 2
    ADC    #$00            ; 2
    STA    $93             ; 3
    DEC    $EC             ; 5
    BNE    LF90B           ; 2
    LDA    $80             ; 3
    AND    #$12            ; 2
    BEQ    LF8FA           ; 2
    CMP    #$04            ; 2
    LDA    $80             ; 3
    AND    #$E8            ; 2
    STA    $80             ; 3
    BCS    LF8E1           ; 2
    JMP    LF5B9           ; 3
LF8E1:
    LDA    #$0D            ; 2
    JSR    LFB49           ; 6
    LDA    $E0             ; 3
    BNE    LF8F0           ; 2
    LDA    $C6             ; 3
    BEQ    LF8F0           ; 2
    DEC    $C6             ; 5
LF8F0:
    LDX    $DF             ; 3
    CPX    #$0F            ; 2
    BCS    LF8F7           ; 2
    INX                    ; 2
LF8F7:
    JMP    LF58E           ; 3
LF8FA:
    LDX    $EB             ; 3
    STA    $F9             ; 3
    STA    $EB             ; 3
    LDA    #$E0            ; 2
    DEX                    ; 2
    BMI    LF907           ; 2
    STA    $B2,X           ; 4
LF907:
    AND    $80             ; 3
    STA    $80             ; 3
LF90B:
    LDX    #$02            ; 2
    LDA    $EF             ; 3
    JSR    LF9F6           ; 6
    LDX    #$07            ; 2
    LDA    #$FF            ; 2
    JSR    LF9F6           ; 6
    LDA    $A3             ; 3
    AND    #$0C            ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    STA    $94             ; 3
    LDA    LFEE4,Y         ; 4
    LDX    $B1             ; 3
    CPX    #$2A            ; 2
    BCS    LF92E           ; 2
    LDA    LFEE8,Y         ; 4
LF92E:
    STA    $A8             ; 3
    LDX    $EB             ; 3
    CPX    #$08            ; 2
    BEQ    LF993           ; 2
    LDX    #$00            ; 2
    LDY    $B9             ; 3
    CPY    #$12            ; 2
    BCC    LF96C           ; 2
    LDA    #$FF            ; 2
    STA    $EF             ; 3
    LDA    $CF             ; 3
    SBC    $C7             ; 3
    BEQ    LF96C           ; 2
    BCS    LF954           ; 2
    LDX    #$04            ; 2
    CPX    $CF             ; 3
    BCC    LF952           ; 2
    STX    $CF             ; 3
LF952:
    EOR    #$FF            ; 2
LF954:
    INX                    ; 2
    CPY    #$29            ; 2
    BCS    LF96C           ; 2
    INX                    ; 2
    CMP    #$06            ; 2
    BCC    LF96C           ; 2
    INX                    ; 2
    LDA    $B1             ; 3
    SBC    #$09            ; 2
    SBC    $B9             ; 3
    BEQ    LF96C           ; 2
    INX                    ; 2
    BCC    LF978           ; 2
    DEX                    ; 2
    DEX                    ; 2
LF96C:
    LDY    $97             ; 3
    CLC                    ; 2
    LDA    LFFC0,Y         ; 4
    ADC    $F0             ; 3
    STA    $F0             ; 3
    BCC    LF993           ; 2
LF978:
    LDA    $80             ; 3
    AND    #$88            ; 2
    BNE    LF9C0           ; 2
    CLC                    ; 2
    LDA    $B9             ; 3
    BMI    LF993           ; 2
    ADC    LFFC8,X         ; 4
    STA    $B9             ; 3
    LDY    $F5             ; 3
    BNE    LF993           ; 2
    LDA    LFFCF,X         ; 4
    ADC    $CF             ; 3
    STA    $CF             ; 3
LF993:
    LDA    $C4             ; 3
    CMP    #$FA            ; 2
    BEQ    LF9BC           ; 2
    LDA    $DF             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ORA    #$87            ; 2
    ADC    $F3             ; 3
    STA    $F3             ; 3
    BCC    LF9C0           ; 2
    LDX    $ED             ; 3
    CLC                    ; 2
    LDA    $D0             ; 3
    ADC    LFF95,X         ; 4
    STA    $D0             ; 3
    CLC                    ; 2
    LDA    $BA             ; 3
    BMI    LF9C0           ; 2
    ADC    LFFA5,X         ; 4
    CMP    $B3             ; 3
    BCS    LF9BE           ; 2
LF9BC:
    LDA    #$FF            ; 2
LF9BE:
    STA    $BA             ; 3
LF9C0:
    LDX    #$05            ; 2
LF9C2:
    LDY    $DE             ; 3
    BPL    LF9CC           ; 2
    LDA    $D9             ; 3
    ORA    #$08            ; 2
    STA    $D9             ; 3
LF9CC:
    LDA    $E5,X           ; 4
    CPY    #$08            ; 2
    BCC    LF9D4           ; 2
    LDA    #$00            ; 2
LF9D4:
    AND    LF40D,Y         ; 4
    BEQ    LF9E6           ; 2
    CPX    $EB             ; 3
    BNE    LF9E1           ; 2
    EOR    $E5,X           ; 4
    STA    $E5,X           ; 4
LF9E1:
    LDY    $94             ; 3
    LDA    LFEEC,Y         ; 4
LF9E6:
    STA    $A8,X           ; 4
    JSR    LFD59           ; 6
    DEX                    ; 2
    CPX    #$03            ; 2
    BCS    LF9C2           ; 2
    JSR    LFCFE           ; 6
    JMP    LF5F8           ; 3
LF9F6:
    AND    $A0,X           ; 4
    TAY                    ; 2
    AND    #$0F            ; 2
    STA    $A6             ; 3
    TYA                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    STY    $A5             ; 3
    LDA    LFEF0,Y         ; 4
    STA    $A8,X           ; 4
    LDA    LFF07,Y         ; 4
    CPY    #$08            ; 2
    BCC    LFA19           ; 2
    LDY    #$06            ; 2
    LDA    $A3             ; 3
    AND    #$0F            ; 2
    ORA    #$10            ; 2
LFA19:
    EOR    $A1             ; 3
    AND    $83             ; 3
    STA    $84,X           ; 4
    LDA    LFF12,Y         ; 4
    CLC                    ; 2
    ADC    $C9             ; 3
    STA    $CE             ; 3
    LDA    LFEFF,Y         ; 4
    LDY    $A6             ; 3
    BNE    LFA2F           ; 2
    TYA                    ; 2
LFA2F:
    STA    $B1,X           ; 4
    BEQ    LFA63           ; 2
    LDA    #$02            ; 2
    CMP    $A5             ; 3
    BNE    LFA63           ; 2
    LDA    $B9             ; 3
    BPL    LFA63           ; 2
    TYA                    ; 2
    AND    $96             ; 3
    BEQ    LFA43           ; 2
    TAY                    ; 2
LFA43:
    LDA    LFFE0,Y         ; 4
    ADC    $C9             ; 3
    CMP    #$C4            ; 2
    BCS    LFA63           ; 2
    CMP    #$30            ; 2
    BCC    LFA63           ; 2
    STA    $CF             ; 3
    LDA    LFFB8,Y         ; 4
    STA    $EF             ; 3
    LDA    #$6F            ; 2
    STA    $F9             ; 3
    LDA    #$09            ; 2
    STA    $B9             ; 3
    LDA    #$41            ; 2
    STA    $B0             ; 3
LFA63:
    LDY    $A6             ; 3
    LDA    LFF3C,Y         ; 4
    STA    $D2,X           ; 4
    CLC                    ; 2
    LDA    $C7,X           ; 4
    ADC    LFF37,Y         ; 4
    STA    $8B,X           ; 4
    CMP    LFF0D,X         ; 4
    BCC    LFA81           ; 2
    LDY    #$02            ; 2
    CMP    LFF0E,X         ; 4
    BCS    LFA96           ; 2
    INY                    ; 2
    BCC    LFA96           ; 2
LFA81:
    CMP    #$30            ; 2
    BCS    LFA9D           ; 2
    LDY    $D2,X           ; 4
    CPY    #$03            ; 2
    BNE    LFA90           ; 2
    CMP    #$20            ; 2
    BCS    LFA90           ; 2
    DEY                    ; 2
LFA90:
    CLC                    ; 2
    ADC    LFF21,Y         ; 4
    STA    $8B,X           ; 4
LFA96:
    LDA    $D2,X           ; 4
    AND    LFF25,Y         ; 4
    STA    $D2,X           ; 4
LFA9D:
    LDA    $B2             ; 3
    BMI    LFAA8           ; 2
    SEC                    ; 2
    SBC    #$04            ; 2
    CMP    $B1,X           ; 4
    BCC    LFAA9           ; 2
LFAA8:
    RTS                    ; 6

LFAA9:
    LDA    $C8             ; 3
    ADC    LFF0F,X         ; 4
    SEC                    ; 2
    SBC    $C7,X           ; 4
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    CMP    #$04            ; 2
    BCS    LFAA8           ; 2
    TAY                    ; 2
    LDA    LFFB5,Y         ; 4
    AND    $A0,X           ; 4
    BEQ    LFAA8           ; 2
    EOR    $A0,X           ; 4
    STA    $A0,X           ; 4
    INC    $95             ; 5
    LDA    #$F0            ; 2
    STA    $B2             ; 3
    LDA    $B0             ; 3
    CMP    #$41            ; 2
    BEQ    LFADD           ; 2
    LDA    $C8             ; 3
    STA    $CF             ; 3
    LDA    $B1,X           ; 4
    STA    $B9             ; 3
    LDA    #$08            ; 2
    STA    $EB             ; 3
LFADD:
    LDA    #$21            ; 2
    STA    $F7             ; 3
    LDY    #$1F            ; 2
    STY    $EC             ; 3
    LDA    #$04            ; 2
    LDY    #$07            ; 2
    CPY    $DE             ; 3
    BNE    LFAFD           ; 2
    LDY    $A2             ; 3
    CPY    #$31            ; 2
    BCS    LFAFD           ; 2
    LDY    $A7             ; 3
    CPY    #$71            ; 2
    BCS    LFAFD           ; 2
    LDA    #$1C            ; 2
    ASL    $EC             ; 5
LFAFD:
    ORA    $80             ; 3
    STA    $80             ; 3
    LDA    $A0,X           ; 4
    CMP    #$60            ; 2
    BNE    LFB1A           ; 2
    LDA    $F4             ; 3
    INC    $F4             ; 5
    BIT    SWCHB           ; 4
    BVC    LFB12           ; 2
    EOR    $96             ; 3
LFB12:
    AND    #$0F            ; 2
    TAY                    ; 2
    LDA    LFF71,Y         ; 4
    STA    $A0,X           ; 4
LFB1A:
    LDY    $A5             ; 3
    LDA    LFF29,Y         ; 4
    BPL    LFB2B           ; 2
    LDX    $C6             ; 3
    INX                    ; 2
    CPX    #$09            ; 2
    BCS    LFB2B           ; 2
    STX    $C6             ; 3
    ASL                    ; 2
LFB2B:
    CLC                    ; 2
    ADC    $99             ; 3
    CMP    #$28            ; 2
    BCC    LFB34           ; 2
    LDA    #$28            ; 2
LFB34:
    STA    $99             ; 3
    LDA    LFFEB,Y         ; 4
    BPL    LFB45           ; 2
    LDY    #$27            ; 2
    STY    $A2             ; 3
    LDY    #$07            ; 2
    STY    $F1             ; 3
    AND    #$3F            ; 2
LFB45:
    LDY    $E0             ; 3
    BEQ    LFB63           ; 2
LFB49:
    TAY                    ; 2
    AND    #$07            ; 2
    TAX                    ; 2
    TYA                    ; 2
    AND    #$78            ; 2
LFB50:
    CLC                    ; 2
    ADC    $9B,X           ; 4
    CMP    #$50            ; 2
    BCC    LFB61           ; 2
    SBC    #$50            ; 2
    STA    $9B,X           ; 4
    LDA    #$08            ; 2
    DEX                    ; 2
    BPL    LFB50           ; 2
    RTS                    ; 6

LFB61:
    STA    $9B,X           ; 4
LFB63:
    RTS                    ; 6

LFB64:
    ASL    $F5             ; 5
    LDX    $D2             ; 3
    LDY    $DC             ; 3
    LDA    $80             ; 3
    ROL                    ; 2
    AND    #$10            ; 2
    BNE    LFB63           ; 2
    BCS    LFB78           ; 2
    LDA    SWCHA           ; 4
    EOR    #$FF            ; 2
LFB78:
    STA    $8E             ; 3
    AND    #$C0            ; 2
    BEQ    LFB8F           ; 2
    ROL                    ; 2
    LDA    #$5D            ; 2
    STA    $F8             ; 3
    BCS    LFB9A           ; 2
    LDX    #$08            ; 2
    CPY    #$C0            ; 2
    BEQ    LFBA1           ; 2
LFB8B:
    DEY                    ; 2
    JMP    LFBA1           ; 3
LFB8F:
    LDA    #$6B            ; 2
    STA    $F8             ; 3
    TYA                    ; 2
    BEQ    LFBA1           ; 2
    BMI    LFBA0           ; 2
    BPL    LFB8B           ; 2
LFB9A:
    LDX    #$00            ; 2
    CPY    #$40            ; 2
    BEQ    LFBA1           ; 2
LFBA0:
    INY                    ; 2
LFBA1:
    STY    $DC             ; 3
    CPX    $D2             ; 3
    BEQ    LFBA9           ; 2
    DEC    $F5             ; 5
LFBA9:
    STX    $D2             ; 3
    TYA                    ; 2
    CPY    #$80            ; 2
    ROR                    ; 2
    STA    $A5             ; 3
    TYA                    ; 2
    LDY    #$00            ; 2
    CLC                    ; 2
    ADC    $DD             ; 3
    BPL    LFBC5           ; 2
LFBB9:
    CMP    #$DF            ; 2
    BCS    LFBC9           ; 2
    DEY                    ; 2
    ADC    #$20            ; 2
    BNE    LFBB9           ; 2
LFBC2:
    INY                    ; 2
    SBC    #$20            ; 2
LFBC5:
    CMP    #$20            ; 2
    BCS    LFBC2           ; 2
LFBC9:
    STA    $DD             ; 3
    STY    $A6             ; 3
    SEC                    ; 2
    LDA    $C7             ; 3
    TAY                    ; 2
    SBC    $A5             ; 3
    AND    #$FE            ; 2
    CPX    #$08            ; 2
    BEQ    LFBEF           ; 2
    CMP    #$36            ; 2
    BEQ    LFC03           ; 2
    BCC    LFBF5           ; 2
LFBDF:
    CPY    #$37            ; 2
    BEQ    LFC03           ; 2
    BCC    LFBFB           ; 2
LFBE5:
    DEC    $C7             ; 5
    CPY    #$AD            ; 2
    BCS    LFC03           ; 2
    INC    $A6             ; 5
    BCC    LFC03           ; 2
LFBEF:
    CMP    #$B8            ; 2
    BEQ    LFC03           ; 2
    BCS    LFBDF           ; 2
LFBF5:
    CPY    #$B8            ; 2
    BEQ    LFC03           ; 2
    BCS    LFBE5           ; 2
LFBFB:
    INC    $C7             ; 5
    CPY    #$3B            ; 2
    BCC    LFC03           ; 2
    DEC    $A6             ; 5
LFC03:
    LDA    $A3             ; 3
    AND    #$07            ; 2
    BEQ    LFC22           ; 2
    LDA    $8E             ; 3
    AND    #$30            ; 2
    BEQ    LFC22           ; 2
    LDX    $B1             ; 3
    INX                    ; 2
    AND    #$10            ; 2
    BNE    LFC18           ; 2
    DEX                    ; 2
    DEX                    ; 2
LFC18:
    CPX    #$58            ; 2
    BCS    LFC22           ; 2
    CPX    #$1A            ; 2
    BCC    LFC22           ; 2
    STX    $B1             ; 3
LFC22:
    LDX    #$08            ; 2
LFC24:
    SEC                    ; 2
    LDA    $C9,X           ; 4
    SBC    $A6             ; 3
    CPX    #$04            ; 2
    BEQ    LFC31           ; 2
    CPX    #$08            ; 2
    BNE    LFC3B           ; 2
LFC31:
    CMP    #$30            ; 2
    BCC    LFC39           ; 2
    CMP    #$D0            ; 2
    BCC    LFC3B           ; 2
LFC39:
    EOR    #$E0            ; 2
LFC3B:
    STA    $C9,X           ; 4
    DEX                    ; 2
    BPL    LFC24           ; 2
    SEC                    ; 2
    SBC    #$D0            ; 2
    CLC                    ; 2
    ADC    $A6             ; 3
    LDA    $A6             ; 3
    AND    #$80            ; 2
    ROL                    ; 2
    ROL                    ; 2
    TAY                    ; 2
    LDA    LFEC6,Y         ; 4
    BEQ    LFC59           ; 2
    STA    $A5             ; 3
    ADC    $DE             ; 3
    JMP    LF424           ; 3
LFC59:
    LDA    $80             ; 3
    BMI    LFCC2           ; 2
    LDX    #$01            ; 2
LFC5F:
    LDY    #$03            ; 2
LFC61:
    LDA.wy $00A8,Y         ; 4
    BEQ    LFC70           ; 2
    LDA.wy $00B1,Y         ; 4
    SEC                    ; 2
    SBC    #$07            ; 2
    CMP    $B1,X           ; 4
    BCC    LFC77           ; 2
LFC70:
    INY                    ; 2
    CPY    #$06            ; 2
    BCC    LFC61           ; 2
    BCS    LFCC3           ; 2
LFC77:
    ADC    #$0B            ; 2
    CMP    $B1,X           ; 4
    BCC    LFCC3           ; 2
    LDA.wy $00C7,Y         ; 4
    SBC    #$0E            ; 2
    CMP    $C7,X           ; 4
    BCS    LFCC3           ; 2
    ADC    #$10            ; 2
    CMP    $C7,X           ; 4
    BCC    LFCC3           ; 2
    CPY    $EB             ; 3
    BEQ    LFCC3           ; 2
    STY    $EB             ; 3
    LDY    #$F0            ; 2
    LDA    #$08            ; 2
    CMP    $EB             ; 3
    BNE    LFC9C           ; 2
    STY    $B9             ; 3
LFC9C:
    LDA    #$1A            ; 2
    STA    $F7             ; 3
    LDA    #$1F            ; 2
    STA    $EC             ; 3
    TXA                    ; 2
    BEQ    LFCAE           ; 2
    STY    $B2             ; 3
    LDA    #$13            ; 2
    JMP    LFB45           ; 3
LFCAE:
    LDA    #$1A            ; 2
    STA    $F6             ; 3
    LDA    #$0A            ; 2
    DEC    $C6             ; 5
    BPL    LFCBC           ; 2
    STA    $C6             ; 3
    LDA    #$8A            ; 2
LFCBC:
    STA    $80             ; 3
    LDA    #$37            ; 2
    STA    $EC             ; 3
LFCC2:
    RTS                    ; 6

LFCC3:
    DEX                    ; 2
    BPL    LFC5F           ; 2
    BIT    $BC             ; 3
    BVS    LFCAE           ; 2
    LDA    $B9             ; 3
    BMI    LFCF4           ; 2
    CLC                    ; 2
    ADC    #$07            ; 2
    CMP    $B1             ; 3
    BCC    LFCF4           ; 2
    LDX    #$08            ; 2
    CPX    $EB             ; 3
    BEQ    LFCF5           ; 2
    LDA    #$1F            ; 2
    STA    $EC             ; 3
    LDA    #$78            ; 2
    STA    $F9             ; 3
    STX    $EB             ; 3
    SEC                    ; 2
    LDA    $CF             ; 3
    SBC    #$06            ; 2
    CMP    $C7             ; 3
    BCS    LFCF4           ; 2
    ADC    #$0C            ; 2
    CMP    $C7             ; 3
    BCS    LFCAE           ; 2
LFCF4:
    RTS                    ; 6

LFCF5:
    SBC    #$04            ; 2
    CMP    $B1             ; 3
    BCC    LFCF4           ; 2
    JMP    LF4D5           ; 3
LFCFE:
    LDA    $80             ; 3
    AND    #$88            ; 2
    BNE    LFD20           ; 2
    LDA    $A3             ; 3
    AND    #$3F            ; 2
    BNE    LFD20           ; 2
    INC    $82             ; 5
    LDX    #$01            ; 2
LFD0E:
    SEC                    ; 2
    LDA    $99,X           ; 4
    SBC    #$08            ; 2
    BCS    LFD1E           ; 2
    LDA    #$48            ; 2
    STA    $99,X           ; 4
    DEX                    ; 2
    BPL    LFD0E           ; 2
    BMI    LFCAE           ; 2
LFD1E:
    STA    $99,X           ; 4
LFD20:
    LDA    $EC             ; 3
    AND    #$1F            ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAX                    ; 2
    LDY    LFEDC,X         ; 4
    LDA    $80             ; 3
    AND    #$02            ; 2
    BEQ    LFD32           ; 2
    STY    $A8             ; 3
LFD32:
    LDA    $80             ; 3
    AND    #$04            ; 2
    BEQ    LFD3E           ; 2
    LDA    $96             ; 3
    AND    #$0E            ; 2
    STA    $A1             ; 3
LFD3E:
    LDX    $EB             ; 3
    BEQ    LFD58           ; 2
    STY    $A8,X           ; 4
    LDA    $80             ; 3
    AND    #$10            ; 2
    BNE    LFD52           ; 2
    CPX    #$06            ; 2
    BCS    LFD58           ; 2
    LDA    $96             ; 3
    AND    #$72            ; 2
LFD52:
    ORA    #$40            ; 2
    AND    $83             ; 3
    STA    $8C             ; 3
LFD58:
    RTS                    ; 6

LFD59:
    AND    $95             ; 3
    BEQ    LFDC8           ; 2
    LDA    $F9             ; 3
    BNE    LFD65           ; 2
    LDA    #$61            ; 2
    STA    $F9             ; 3
LFD65:
    LDY    #$08            ; 2
    LDA    $D2,X           ; 4
    BMI    LFD72           ; 2
    LDY    $CE             ; 3
    ASL                    ; 2
    BPL    LFD72           ; 2
    LDY    $C7             ; 3
LFD72:
    STY    $A5             ; 3
    LDY    $DE             ; 3
    BEQ    LFD7C           ; 2
    CPY    #$07            ; 2
    BNE    LFD88           ; 2
LFD7C:
    LDA    LFF44,Y         ; 4
    EOR    $A5             ; 3
    BPL    LFD88           ; 2
    LDA    LFF44,Y         ; 4
    STA    $A5             ; 3
LFD88:
    LDY    $C7,X           ; 4
    CPY    $A5             ; 3
    LDA    $93             ; 3
    BCC    LFD92           ; 2
    EOR    #$FF            ; 2
LFD92:
    ADC    $C7,X           ; 4
    CMP    #$FC            ; 2
    BCC    LFD9A           ; 2
    LDA    #$FA            ; 2
LFD9A:
    CMP    #$04            ; 2
    BCS    LFDA0           ; 2
    LDA    #$06            ; 2
LFDA0:
    STA    $C7,X           ; 4
    CMP    $A5             ; 3
    BCC    LFDC8           ; 2
    SBC    #$04            ; 2
    CMP    $A5             ; 3
    BCS    LFDC8           ; 2
    LDA    $D2,X           ; 4
    BPL    LFDC0           ; 2
    LDY    $DE             ; 3
    LDA    $E5,X           ; 4
    EOR    LF40C,Y         ; 4
    CMP    $E5,X           ; 4
    BCC    LFDC0           ; 2
    EOR    LF40D,Y         ; 4
    STA    $E5,X           ; 4
LFDC0:
    LDA    $D2,X           ; 4
    AND    #$7F            ; 2
    EOR    #$40            ; 2
    STA    $D2,X           ; 4
LFDC8:
    LDA    $A3             ; 3
    AND    #$03            ; 2
    CMP    LFFB3,X         ; 4
    BNE    LFE43           ; 2
    LDA    $96             ; 3
    CMP    #$57            ; 2
    BCC    LFE0F           ; 2
    LDY    $DE             ; 3
    BEQ    LFE0F           ; 2
    CPY    #$08            ; 2
    BCS    LFE0F           ; 2
    LDA    $A3             ; 3
    AND    #$BC            ; 2
    ASL                    ; 2
    BNE    LFE0F           ; 2
    LDA    $E5,X           ; 4
    BMI    LFDFA           ; 2
    BCS    LFE0F           ; 2
    AND    LFF44,Y         ; 4
    STA    $A5             ; 3
    EOR    $E5,X           ; 4
    ASL                    ; 2
    ORA    $A5             ; 3
    STA    $E5,X           ; 4
    BPL    LFE0F           ; 2
LFDFA:
    LDA    $E0             ; 3
    BEQ    LFE0F           ; 2
    LSR                    ; 2
    EOR    #$08            ; 2
    AND    #$0F            ; 2
    TAY                    ; 2
    LDA    #$2E            ; 2
    STA    $8C             ; 3
    STA    $F7             ; 3
    LDA    LFFD8,Y         ; 4
    STA    $E0             ; 3
LFE0F:
    LDA    $BA             ; 3
    BPL    LFE44           ; 2
    LDA    $81             ; 3
    CMP    #$03            ; 2
    BEQ    LFE44           ; 2
    LDA    $A8,X           ; 4
    BEQ    LFE44           ; 2
    LDA    $BB,X           ; 4
    CMP    #$FA            ; 2
    BEQ    LFE27           ; 2
    LDA    #$12            ; 2
    STA    $F9             ; 3
LFE27:
    LDA    $96             ; 3
    AND    #$03            ; 2
    STA    $ED             ; 3
    LDA    $B1,X           ; 4
    SBC    #$03            ; 2
    STA    $BA             ; 3
    CMP    $B1             ; 3
    ROL    $ED             ; 5
    LDA    $C7,X           ; 4
    ADC    #$04            ; 2
    STA    $D0             ; 3
    SBC    #$08            ; 2
    CMP    $C7             ; 3
    ROL    $ED             ; 5
LFE43:
    RTS                    ; 6

LFE44:
    LDA    $96             ; 3
    AND    #$07            ; 2
    CMP    $DE             ; 3
    BEQ    LFE6F           ; 2
    TAY                    ; 2
    LDA    $E5,X           ; 4
    AND    LF40D,Y         ; 4
    BNE    LFE6F           ; 2
    LDA    $F1             ; 3
    BCS    LFE60           ; 2
    SBC    #$0F            ; 2
    BCC    LFE6F           ; 2
    STA    $F1             ; 3
    BCS    LFE68           ; 2
LFE60:
    AND    #$0F            ; 2
    SBC    #$01            ; 2
    BCC    LFE6F           ; 2
    DEC    $F1             ; 5
LFE68:
    LDA    LF40D,Y         ; 4
    ORA    $E5,X           ; 4
    STA    $E5,X           ; 4
LFE6F:
    LDA    $D2,X           ; 4
    AND    #$10            ; 2
    BEQ    LFE77           ; 2
    LDA    #$FE            ; 2
LFE77:
    SEC                    ; 2
    ADC    $B1,X           ; 4
    CMP    LFF49,X         ; 4
    BCS    LFE84           ; 2
    CMP    LFF4C,X         ; 4
    BCS    LFE93           ; 2
LFE84:
    LDA    $D2,X           ; 4
    EOR    #$10            ; 2
    LDY    $96             ; 3
    CPY    #$30            ; 2
    BCS    LFE90           ; 2
    ORA    #$80            ; 2
LFE90:
    STA    $D2,X           ; 4
    RTS                    ; 6

LFE93:
    CPX    $EB             ; 3
    BEQ    LFE99           ; 2
    STA    $B1,X           ; 4
LFE99:
    RTS                    ; 6

LFE9A:
    .byte $0E ; |    XXX | $FE9A
    .byte $4E ; | X  XXX | $FE9B
    .byte $C4 ; |XX   X  | $FE9C
    .byte $FE ; |XXXXXXX | $FE9D
    .byte $8E ; |X   XXX | $FE9E
    .byte $3C ; |  XXXX  | $FE9F
    .byte $24 ; |  X  X  | $FEA0
    .byte $0E ; |    XXX | $FEA1
    .byte $84 ; |X    X  | $FEA2
    .byte $4E ; | X  XXX | $FEA3
    .byte $4E ; | X  XXX | $FEA4
    .byte $4E ; | X  XXX | $FEA5
    .byte $82 ; |X     X | $FEA6
LFEA7:
    .byte $7E ; | XXXXXX | $FEA7
    .byte $7E ; | XXXXXX | $FEA8
    .byte $1C ; |   XXX  | $FEA9
    .byte $1C ; |   XXX  | $FEAA
    .byte $2A ; |  X X X | $FEAB
    .byte $3A ; |  XXX X | $FEAC
    .byte $48 ; | X  X   | $FEAD
    .byte $58 ; | X XX   | $FEAE
LFEAF:
    .byte $06 ; |     XX | $FEAF
    .byte $06 ; |     XX | $FEB0
    .byte $05 ; |     X X| $FEB1
    .byte $04 ; |     X  | $FEB2
    .byte $03 ; |      XX| $FEB3
    .byte $02 ; |      X | $FEB4
    .byte $01 ; |       X| $FEB5
    .byte $09 ; |    X  X| $FEB6
LFEB7:
    .byte $FE ; |XXXXXXX | $FEB7
    .byte $FF ; |XXXXXXXX| $FEB8
    .byte $FF ; |XXXXXXXX| $FEB9
    .byte $FF ; |XXXXXXXX| $FEBA
    .byte $FF ; |XXXXXXXX| $FEBB
    .byte $FF ; |XXXXXXXX| $FEBC
    .byte $FF ; |XXXXXXXX| $FEBD
    .byte $00 ; |        | $FEBE
LFEBF:
    .byte $04 ; |     X  | $FEBF
    .byte $03 ; |      XX| $FEC0
    .byte $03 ; |      XX| $FEC1
    .byte $03 ; |      XX| $FEC2
    .byte $02 ; |      X | $FEC3
LFEC4:
    .byte $02 ; |      X | $FEC4
    .byte $01 ; |       X| $FEC5
LFEC6:
    .byte $00 ; |        | $FEC6
    .byte $FF ; |XXXXXXXX| $FEC7
    .byte $01 ; |       X| $FEC8
    .byte $00 ; |        | $FEC9
    .byte $98 ; |X  XX   | $FECA
    .byte $A0 ; |X X     | $FECB
    .byte $A8 ; |X X X   | $FECC
    .byte $B0 ; |X XX    | $FECD
    .byte $B8 ; |X XXX   | $FECE
    .byte $00 ; |        | $FECF
    .byte $50 ; | X X    | $FED0
    .byte $78 ; | XXXX   | $FED1
    .byte $80 ; |X       | $FED2
    .byte $88 ; |X   X   | $FED3
    .byte $50 ; | X X    | $FED4
    .byte $50 ; | X X    | $FED5
    .byte $50 ; | X X    | $FED6
    .byte $60 ; | XX     | $FED7
    .byte $68 ; | XX X   | $FED8
    .byte $70 ; | XXX    | $FED9
    .byte $50 ; | X X    | $FEDA
    .byte $50 ; | X X    | $FEDB
LFEDC:
    .byte $83 ; |X     XX| $FEDC
    .byte $7E ; | XXXXXX | $FEDD
    .byte $78 ; | XXXX   | $FEDE
    .byte $71 ; | XXX   X| $FEDF
    .byte $71 ; | XXX   X| $FEE0
    .byte $78 ; | XXXX   | $FEE1
    .byte $7E ; | XXXXXX | $FEE2
    .byte $83 ; |X     XX| $FEE3
LFEE4:
    .byte $01 ; |       X| $FEE4
    .byte $08 ; |    X   | $FEE5
    .byte $01 ; |       X| $FEE6
    .byte $08 ; |    X   | $FEE7
LFEE8:
    .byte $0E ; |    XXX | $FEE8
    .byte $15 ; |   X X X| $FEE9
    .byte $0E ; |    XXX | $FEEA
    .byte $15 ; |   X X X| $FEEB
LFEEC:
    .byte $20 ; |  X     | $FEEC
    .byte $25 ; |  X  X X| $FEED
    .byte $20 ; |  X     | $FEEE
    .byte $25 ; |  X  X X| $FEEF
LFEF0:
    .byte $2A ; |  X X X | $FEF0
    .byte $51 ; | X X   X| $FEF1
    .byte $41 ; | X     X| $FEF2
    .byte $51 ; | X X   X| $FEF3
    .byte $49 ; | X  X  X| $FEF4
    .byte $60 ; | XX     | $FEF5
    .byte $33 ; |  XX  XX| $FEF6
    .byte $60 ; | XX     | $FEF7
    .byte $1C ; |   XXX  | $FEF8
    .byte $4C ; | X  XX  | $FEF9
    .byte $20 ; |  X     | $FEFA
    .byte $41 ; | X     X| $FEFB
    .byte $2A ; |  X X X | $FEFC
    .byte $0E ; |    XXX | $FEFD
    .byte $87 ; |X    XXX| $FEFE
LFEFF:
    .byte $08 ; |    X   | $FEFF
    .byte $0E ; |    XXX | $FF00
    .byte $08 ; |    X   | $FF01
    .byte $0E ; |    XXX | $FF02
    .byte $03 ; |      XX| $FF03
    .byte $11 ; |   X   X| $FF04
    .byte $0E ; |    XXX | $FF05
    .byte $11 ; |   X   X| $FF06
LFF07:
    .byte $C4 ; |XX   X  | $FF07
    .byte $0F ; |    XXXX| $FF08
    .byte $4E ; | X  XXX | $FF09
    .byte $00 ; |        | $FF0A
    .byte $82 ; |X     X | $FF0B
    .byte $1E ; |   XXXX | $FF0C
LFF0D:
    .byte $0E ; |    XXX | $FF0D
LFF0E:
    .byte $40 ; | X      | $FF0E
LFF0F:
    .byte $A6 ; |X X  XX | $FF0F
    .byte $B6 ; |X XX XX | $FF10
    .byte $06 ; |     XX | $FF11
LFF12:
    .byte $00 ; |        | $FF12
    .byte $00 ; |        | $FF13
    .byte $AC ; |X X XX  | $FF14
    .byte $BC ; |X XXXX  | $FF15
    .byte $0A ; |    X X | $FF16
    .byte $0E ; |    XXX | $FF17
    .byte $3E ; |  XXXXX | $FF18
    .byte $0E ; |    XXX | $FF19
LFF1A:
    .byte $01 ; |       X| $FF1A
    .byte $00 ; |        | $FF1B
    .byte $03 ; |      XX| $FF1C
    .byte $01 ; |       X| $FF1D
    .byte $01 ; |       X| $FF1E
    .byte $00 ; |        | $FF1F
    .byte $01 ; |       X| $FF20
LFF21:
    .byte $00 ; |        | $FF21
    .byte $10 ; |   X    | $FF22
    .byte $20 ; |  X     | $FF23
    .byte $10 ; |   X    | $FF24
LFF25:
    .byte $FC ; |XXXXXX  | $FF25
    .byte $FC ; |XXXXXX  | $FF26
    .byte $FC ; |XXXXXX  | $FF27
    .byte $FD ; |XXXXXX X| $FF28
LFF29:
    .byte $00 ; |        | $FF29
    .byte $08 ; |    X   | $FF2A
    .byte $00 ; |        | $FF2B
    .byte $00 ; |        | $FF2C
    .byte $00 ; |        | $FF2D
    .byte $08 ; |    X   | $FF2E
    .byte $08 ; |    X   | $FF2F
    .byte $00 ; |        | $FF30
    .byte $08 ; |    X   | $FF31
    .byte $88 ; |X   X   | $FF32
    .byte $00 ; |        | $FF33
    .byte $00 ; |        | $FF34
    .byte $10 ; |   X    | $FF35
    .byte $08 ; |    X   | $FF36
LFF37:
    .byte $00 ; |        | $FF37
    .byte $20 ; |  X     | $FF38
    .byte $10 ; |   X    | $FF39
    .byte $10 ; |   X    | $FF3A
    .byte $00 ; |        | $FF3B
LFF3C:
    .byte $00 ; |        | $FF3C
    .byte $00 ; |        | $FF3D
    .byte $00 ; |        | $FF3E
    .byte $01 ; |       X| $FF3F
    .byte $00 ; |        | $FF40
    .byte $02 ; |      X | $FF41
    .byte $01 ; |       X| $FF42
    .byte $03 ; |      XX| $FF43
LFF44:
    .byte $FF ; |XXXXXXXX| $FF44
    .byte $7F ; | XXXXXXX| $FF45
    .byte $3F ; |  XXXXXX| $FF46
    .byte $1F ; |   XXXXX| $FF47
    .byte $0F ; |    XXXX| $FF48
LFF49:
    .byte $07 ; |     XXX| $FF49
    .byte $03 ; |      XX| $FF4A
    .byte $01 ; |       X| $FF4B
LFF4C:
    .byte $56 ; | X X XX | $FF4C
    .byte $4B ; | X  X XX| $FF4D
    .byte $40 ; | X      | $FF4E
    .byte $4D ; | X  XX X| $FF4F
    .byte $43 ; | X    XX| $FF50
    .byte $37 ; |  XX XXX| $FF51
LFF52:
    .byte $2E ; |  X XXX | $FF52
    .byte $2F ; |  X XXXX| $FF53
    .byte $A3 ; |X X   XX| $FF54
    .byte $AB ; |X X X XX| $FF55
    .byte $A6 ; |X X  XX | $FF56
    .byte $AF ; |X X XXXX| $FF57
    .byte $AF ; |X X XXXX| $FF58
    .byte $A7 ; |X X  XXX| $FF59
    .byte $AA ; |X X X X | $FF5A
    .byte $AD ; |X X XX X| $FF5B
    .byte $AE ; |X X XXX | $FF5C
    .byte $A5 ; |X X  X X| $FF5D
    .byte $AA ; |X X X X | $FF5E
    .byte $A6 ; |X X  XX | $FF5F
    .byte $A8 ; |X X X   | $FF60
    .byte $AC ; |X X XX  | $FF61
    .byte $AC ; |X X XX  | $FF62
    .byte $AC ; |X X XX  | $FF63
    .byte $AC ; |X X XX  | $FF64
    .byte $AC ; |X X XX  | $FF65
    .byte $AC ; |X X XX  | $FF66
LFF67:
    .byte $03 ; |      XX| $FF67
    .byte $6A ; | XX X X | $FF68
    .byte $35 ; |  XX X X| $FF69
    .byte $5E ; | X XXXX | $FF6A
    .byte $3D ; |  XXXX X| $FF6B
    .byte $7B ; | XXXX XX| $FF6C
    .byte $EF ; |XXX XXXX| $FF6D
    .byte $7F ; | XXXXXXX| $FF6E
    .byte $FF ; |XXXXXXXX| $FF6F
    .byte $FF ; |XXXXXXXX| $FF70
LFF71:
    .byte $82 ; |X     X | $FF71
    .byte $D2 ; |XX X  X | $FF72
    .byte $A1 ; |X X    X| $FF73
    .byte $C2 ; |XX    X | $FF74
    .byte $82 ; |X     X | $FF75
    .byte $B2 ; |X XX  X | $FF76
    .byte $D2 ; |XX X  X | $FF77
    .byte $91 ; |X  X   X| $FF78
    .byte $82 ; |X     X | $FF79
    .byte $A2 ; |X X   X | $FF7A
    .byte $D2 ; |XX X  X | $FF7B
    .byte $B2 ; |X XX  X | $FF7C
    .byte $C2 ; |XX    X | $FF7D
    .byte $D2 ; |XX X  X | $FF7E
    .byte $82 ; |X     X | $FF7F
    .byte $92 ; |X  X  X | $FF80
LFF81:
    .byte $02 ; |      X | $FF81
    .byte $24 ; |  X  X  | $FF82
    .byte $48 ; | X  X   | $FF83
    .byte $6C ; | XX XX  | $FF84
    .byte $90 ; |X  X    | $FF85
    .byte $B4 ; |X XX X  | $FF86
    .byte $B8 ; |X XXX   | $FF87
    .byte $F0 ; |XXXX    | $FF88
LFF89:
    .byte $00 ; |        | $FF89
    .byte $00 ; |        | $FF8A
    .byte $01 ; |       X| $FF8B
    .byte $01 ; |       X| $FF8C
LFF8D:
    .byte $48 ; | X  X   | $FF8D
    .byte $18 ; |   XX   | $FF8E
    .byte $10 ; |   X    | $FF8F
    .byte $10 ; |   X    | $FF90
    .byte $10 ; |   X    | $FF91
    .byte $10 ; |   X    | $FF92
    .byte $08 ; |    X   | $FF93
    .byte $08 ; |    X   | $FF94
LFF95:
    .byte $03 ; |      XX| $FF95
    .byte $FD ; |XXXXXX X| $FF96
    .byte $03 ; |      XX| $FF97
    .byte $FD ; |XXXXXX X| $FF98
    .byte $02 ; |      X | $FF99
    .byte $FE ; |XXXXXXX | $FF9A
    .byte $02 ; |      X | $FF9B
    .byte $FE ; |XXXXXXX | $FF9C
    .byte $02 ; |      X | $FF9D
    .byte $FE ; |XXXXXXX | $FF9E
    .byte $02 ; |      X | $FF9F
    .byte $FE ; |XXXXXXX | $FFA0
    .byte $01 ; |       X| $FFA1
    .byte $FF ; |XXXXXXXX| $FFA2
    .byte $01 ; |       X| $FFA3
    .byte $FF ; |XXXXXXXX| $FFA4
LFFA5:
    .byte $01 ; |       X| $FFA5
    .byte $01 ; |       X| $FFA6
    .byte $FF ; |XXXXXXXX| $FFA7
    .byte $FF ; |XXXXXXXX| $FFA8
    .byte $01 ; |       X| $FFA9
    .byte $01 ; |       X| $FFAA
    .byte $FF ; |XXXXXXXX| $FFAB
    .byte $FF ; |XXXXXXXX| $FFAC
    .byte $02 ; |      X | $FFAD
    .byte $02 ; |      X | $FFAE
    .byte $FE ; |XXXXXXX | $FFAF
    .byte $FE ; |XXXXXXX | $FFB0
    .byte $02 ; |      X | $FFB1
    .byte $02 ; |      X | $FFB2
LFFB3:
    .byte $FE ; |XXXXXXX | $FFB3
    .byte $FE ; |XXXXXXX | $FFB4
LFFB5:
    .byte $04 ; |     X  | $FFB5
    .byte $02 ; |      X | $FFB6
    .byte $01 ; |       X| $FFB7
LFFB8:
    .byte $00 ; |        | $FFB8
    .byte $FE ; |XXXXXXX | $FFB9
    .byte $FD ; |XXXXXX X| $FFBA
    .byte $FD ; |XXXXXX X| $FFBB
    .byte $FB ; |XXXXX XX| $FFBC
    .byte $FE ; |XXXXXXX | $FFBD
    .byte $FD ; |XXXXXX X| $FFBE
    .byte $FB ; |XXXXX XX| $FFBF
LFFC0:
    .byte $44 ; | X   X  | $FFC0
    .byte $63 ; | XX   XX| $FFC1
    .byte $84 ; |X    X  | $FFC2
    .byte $98 ; |X  XX   | $FFC3
    .byte $A0 ; |X X     | $FFC4
    .byte $B0 ; |X XX    | $FFC5
    .byte $D0 ; |XX X    | $FFC6
    .byte $E0 ; |XXX     | $FFC7
LFFC8:
    .byte $01 ; |       X| $FFC8
    .byte $01 ; |       X| $FFC9
    .byte $01 ; |       X| $FFCA
    .byte $00 ; |        | $FFCB
    .byte $FF ; |XXXXXXXX| $FFCC
    .byte $01 ; |       X| $FFCD
    .byte $01 ; |       X| $FFCE
LFFCF:
    .byte $00 ; |        | $FFCF
    .byte $FF ; |XXXXXXXX| $FFD0
    .byte $FE ; |XXXXXXX | $FFD1
    .byte $FE ; |XXXXXXX | $FFD2
    .byte $FE ; |XXXXXXX | $FFD3
    .byte $01 ; |       X| $FFD4
    .byte $02 ; |      X | $FFD5
    .byte $02 ; |      X | $FFD6
    .byte $02 ; |      X | $FFD7
LFFD8:
    .byte $40 ; | X      | $FFD8
    .byte $50 ; | X X    | $FFD9
    .byte $52 ; | X X  X | $FFDA
    .byte $59 ; | X XX  X| $FFDB
    .byte $52 ; | X X  X | $FFDC
    .byte $59 ; | X XX  X| $FFDD
    .byte $59 ; | X XX  X| $FFDE
    .byte $5D ; | X XXX X| $FFDF
LFFE0:
    .byte $00 ; |        | $FFE0
    .byte $20 ; |  X     | $FFE1
    .byte $10 ; |   X    | $FFE2
    .byte $10 ; |   X    | $FFE3
    .byte $00 ; |        | $FFE4
    .byte $20 ; |  X     | $FFE5
    .byte $10 ; |   X    | $FFE6
    .byte $00 ; |        | $FFE7
LFFE8:
    .byte $02 ; |      X | $FFE8
    .byte $06 ; |     XX | $FFE9
    .byte $0E ; |    XXX | $FFEA


LFFEB:
    .byte $00 ; |        | $FFEB
    .byte $0B ; |    X XX| $FFEC
    .byte $1B ; |   XX XX| $FFED
    .byte $1B ; |   XX XX| $FFEE
    .byte $00 ; |        | $FFEF   $80 in PAL [a]
    .byte $23 ; |  X   XX| $FFF0
    .byte $44 ; | X   X  | $FFF1
    .byte $33 ; |  XX  XX| $FFF2
    .byte $1B ; |   XX XX| $FFF3
    .byte $33 ; |  XX  XX| $FFF4
    .byte $CB ; |XX  X XX| $FFF5
    .byte $FC ; |XXXXXX  | $FFF6
    .byte $23 ; |  X   XX| $FFF7
    .byte $1B ; |   XX XX| $FFF8
    .byte $00 ; |        | $FFF9
    .byte $64 ; | XX  X  | $FFFA
    .byte $6E ; | XX XXX | $FFFB


    ORG $FFFC

    .word START,START
