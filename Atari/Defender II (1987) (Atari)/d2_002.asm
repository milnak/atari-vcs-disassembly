; Disassembly of d2_002.bin
; Disassembled Sat Feb 28 07:48:16 2004
; Using DiStella v2.0
;
; Command Line: C:\BIN\DISTELLA.EXE -pafscd2_002.cfg d2_002.bin 
;
; d2_002.cfg contents:
;
;      GFX F000 F0FF
;      CODE F100 F67F
;      GFX F680 F8FF
;      CODE F900 F936
;      GFX F937 FAF3
;      CODE FAF4 FAFF
;      GFX FB00 FFF1
;      

      processor 6502
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
RESBL   =  $14
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM1    =  $23
HMBL    =  $24
VDELP0  =  $25
VDEL01  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXPPMM  =  $37
INTIM   =  $0284
$0285   =  $0285
TIM64T  =  $0296

       ORG $F000
       .byte $00 ; |        | $F000
LF001: .byte $00 ; |        | $F001
       .byte $00 ; |        | $F002
       .byte $00 ; |        | $F003
       .byte $00 ; |        | $F004
       .byte $00 ; |        | $F005
       .byte $00 ; |        | $F006
       .byte $00 ; |        | $F007
       .byte $00 ; |        | $F008
       .byte $00 ; |        | $F009
       .byte $00 ; |        | $F00A
       .byte $00 ; |        | $F00B
       .byte $00 ; |        | $F00C
       .byte $00 ; |        | $F00D
       .byte $00 ; |        | $F00E
       .byte $00 ; |        | $F00F
       .byte $00 ; |        | $F010
       .byte $00 ; |        | $F011
       .byte $00 ; |        | $F012
       .byte $00 ; |        | $F013
       .byte $00 ; |        | $F014
       .byte $00 ; |        | $F015
       .byte $00 ; |        | $F016
       .byte $00 ; |        | $F017
       .byte $00 ; |        | $F018
       .byte $00 ; |        | $F019
       .byte $00 ; |        | $F01A
       .byte $00 ; |        | $F01B
       .byte $00 ; |        | $F01C
       .byte $00 ; |        | $F01D
       .byte $00 ; |        | $F01E
       .byte $00 ; |        | $F01F
       .byte $00 ; |        | $F020
       .byte $00 ; |        | $F021
       .byte $00 ; |        | $F022
       .byte $00 ; |        | $F023
       .byte $00 ; |        | $F024
       .byte $00 ; |        | $F025
       .byte $00 ; |        | $F026
       .byte $00 ; |        | $F027
       .byte $00 ; |        | $F028
       .byte $00 ; |        | $F029
       .byte $00 ; |        | $F02A
       .byte $00 ; |        | $F02B
       .byte $00 ; |        | $F02C
       .byte $00 ; |        | $F02D
       .byte $00 ; |        | $F02E
       .byte $00 ; |        | $F02F
       .byte $00 ; |        | $F030
       .byte $00 ; |        | $F031
       .byte $00 ; |        | $F032
       .byte $00 ; |        | $F033
       .byte $00 ; |        | $F034
       .byte $00 ; |        | $F035
       .byte $00 ; |        | $F036
       .byte $00 ; |        | $F037
       .byte $00 ; |        | $F038
       .byte $00 ; |        | $F039
       .byte $00 ; |        | $F03A
       .byte $00 ; |        | $F03B
       .byte $00 ; |        | $F03C
       .byte $00 ; |        | $F03D
       .byte $00 ; |        | $F03E
       .byte $00 ; |        | $F03F
       .byte $00 ; |        | $F040
LF041: .byte $00 ; |        | $F041
       .byte $00 ; |        | $F042
LF043: .byte $00 ; |        | $F043
       .byte $00 ; |        | $F044
       .byte $00 ; |        | $F045
       .byte $00 ; |        | $F046
       .byte $00 ; |        | $F047
LF048: .byte $00 ; |        | $F048
       .byte $00 ; |        | $F049
       .byte $00 ; |        | $F04A
       .byte $00 ; |        | $F04B
       .byte $00 ; |        | $F04C
       .byte $00 ; |        | $F04D
       .byte $00 ; |        | $F04E
       .byte $00 ; |        | $F04F
       .byte $00 ; |        | $F050
       .byte $00 ; |        | $F051
       .byte $00 ; |        | $F052
       .byte $00 ; |        | $F053
       .byte $00 ; |        | $F054
       .byte $00 ; |        | $F055
       .byte $00 ; |        | $F056
       .byte $00 ; |        | $F057
       .byte $00 ; |        | $F058
       .byte $00 ; |        | $F059
       .byte $00 ; |        | $F05A
       .byte $00 ; |        | $F05B
       .byte $00 ; |        | $F05C
       .byte $00 ; |        | $F05D
       .byte $00 ; |        | $F05E
       .byte $00 ; |        | $F05F
       .byte $00 ; |        | $F060
       .byte $00 ; |        | $F061
       .byte $00 ; |        | $F062
       .byte $00 ; |        | $F063
       .byte $00 ; |        | $F064
       .byte $00 ; |        | $F065
       .byte $00 ; |        | $F066
       .byte $00 ; |        | $F067
       .byte $00 ; |        | $F068
       .byte $00 ; |        | $F069
       .byte $00 ; |        | $F06A
       .byte $00 ; |        | $F06B
       .byte $00 ; |        | $F06C
       .byte $00 ; |        | $F06D
       .byte $00 ; |        | $F06E
       .byte $00 ; |        | $F06F
       .byte $00 ; |        | $F070
       .byte $00 ; |        | $F071
       .byte $00 ; |        | $F072
       .byte $00 ; |        | $F073
       .byte $00 ; |        | $F074
       .byte $00 ; |        | $F075
       .byte $00 ; |        | $F076
       .byte $00 ; |        | $F077
       .byte $00 ; |        | $F078
       .byte $00 ; |        | $F079
       .byte $00 ; |        | $F07A
       .byte $00 ; |        | $F07B
       .byte $00 ; |        | $F07C
       .byte $00 ; |        | $F07D
       .byte $00 ; |        | $F07E
       .byte $00 ; |        | $F07F
LF080: .byte $00 ; |        | $F080
LF081: .byte $00 ; |        | $F081
LF082: .byte $00 ; |        | $F082
       .byte $00 ; |        | $F083
       .byte $00 ; |        | $F084
       .byte $00 ; |        | $F085
       .byte $00 ; |        | $F086
       .byte $00 ; |        | $F087
       .byte $00 ; |        | $F088
       .byte $00 ; |        | $F089
       .byte $00 ; |        | $F08A
       .byte $00 ; |        | $F08B
       .byte $00 ; |        | $F08C
       .byte $00 ; |        | $F08D
       .byte $00 ; |        | $F08E
       .byte $00 ; |        | $F08F
       .byte $00 ; |        | $F090
       .byte $00 ; |        | $F091
LF092: .byte $00 ; |        | $F092
       .byte $00 ; |        | $F093
       .byte $00 ; |        | $F094
       .byte $00 ; |        | $F095
       .byte $00 ; |        | $F096
       .byte $00 ; |        | $F097
       .byte $00 ; |        | $F098
       .byte $00 ; |        | $F099
       .byte $00 ; |        | $F09A
       .byte $00 ; |        | $F09B
       .byte $00 ; |        | $F09C
       .byte $00 ; |        | $F09D
       .byte $00 ; |        | $F09E
       .byte $00 ; |        | $F09F
       .byte $00 ; |        | $F0A0
       .byte $00 ; |        | $F0A1
LF0A2: .byte $00 ; |        | $F0A2
       .byte $00 ; |        | $F0A3
       .byte $00 ; |        | $F0A4
       .byte $00 ; |        | $F0A5
       .byte $00 ; |        | $F0A6
       .byte $00 ; |        | $F0A7
       .byte $00 ; |        | $F0A8
       .byte $00 ; |        | $F0A9
       .byte $00 ; |        | $F0AA
       .byte $00 ; |        | $F0AB
       .byte $00 ; |        | $F0AC
       .byte $00 ; |        | $F0AD
       .byte $00 ; |        | $F0AE
       .byte $00 ; |        | $F0AF
       .byte $00 ; |        | $F0B0
       .byte $00 ; |        | $F0B1
       .byte $00 ; |        | $F0B2
       .byte $00 ; |        | $F0B3
       .byte $00 ; |        | $F0B4
       .byte $00 ; |        | $F0B5
       .byte $00 ; |        | $F0B6
       .byte $00 ; |        | $F0B7
       .byte $00 ; |        | $F0B8
       .byte $00 ; |        | $F0B9
       .byte $00 ; |        | $F0BA
       .byte $00 ; |        | $F0BB
       .byte $00 ; |        | $F0BC
       .byte $00 ; |        | $F0BD
       .byte $00 ; |        | $F0BE
       .byte $00 ; |        | $F0BF
       .byte $00 ; |        | $F0C0
       .byte $00 ; |        | $F0C1
       .byte $00 ; |        | $F0C2
LF0C3: .byte $00 ; |        | $F0C3
       .byte $00 ; |        | $F0C4
       .byte $00 ; |        | $F0C5
       .byte $00 ; |        | $F0C6
       .byte $00 ; |        | $F0C7
       .byte $00 ; |        | $F0C8
LF0C9: .byte $00 ; |        | $F0C9
LF0CA: .byte $00 ; |        | $F0CA
       .byte $00 ; |        | $F0CB
       .byte $00 ; |        | $F0CC
       .byte $00 ; |        | $F0CD
LF0CE: .byte $00 ; |        | $F0CE
LF0CF: .byte $00 ; |        | $F0CF
       .byte $00 ; |        | $F0D0
       .byte $00 ; |        | $F0D1
       .byte $00 ; |        | $F0D2
       .byte $00 ; |        | $F0D3
       .byte $00 ; |        | $F0D4
       .byte $00 ; |        | $F0D5
LF0D6: .byte $00 ; |        | $F0D6
       .byte $00 ; |        | $F0D7
       .byte $00 ; |        | $F0D8
       .byte $00 ; |        | $F0D9
       .byte $00 ; |        | $F0DA
       .byte $00 ; |        | $F0DB
       .byte $00 ; |        | $F0DC
LF0DD: .byte $00 ; |        | $F0DD
       .byte $00 ; |        | $F0DE
       .byte $00 ; |        | $F0DF
       .byte $00 ; |        | $F0E0
       .byte $00 ; |        | $F0E1
       .byte $00 ; |        | $F0E2
       .byte $00 ; |        | $F0E3
LF0E4: .byte $00 ; |        | $F0E4
       .byte $00 ; |        | $F0E5
       .byte $00 ; |        | $F0E6
       .byte $00 ; |        | $F0E7
       .byte $00 ; |        | $F0E8
       .byte $00 ; |        | $F0E9
       .byte $00 ; |        | $F0EA
LF0EB: .byte $00 ; |        | $F0EB
       .byte $00 ; |        | $F0EC
       .byte $00 ; |        | $F0ED
       .byte $00 ; |        | $F0EE
       .byte $00 ; |        | $F0EF
       .byte $00 ; |        | $F0F0
       .byte $00 ; |        | $F0F1
LF0F2: .byte $00 ; |        | $F0F2
       .byte $00 ; |        | $F0F3
       .byte $00 ; |        | $F0F4
       .byte $00 ; |        | $F0F5
       .byte $00 ; |        | $F0F6
       .byte $00 ; |        | $F0F7
       .byte $00 ; |        | $F0F8
       .byte $00 ; |        | $F0F9
       .byte $00 ; |        | $F0FA
       .byte $00 ; |        | $F0FB
       .byte $00 ; |        | $F0FC
LF0FD: .byte $00 ; |        | $F0FD
       .byte $00 ; |        | $F0FE
       .byte $00 ; |        | $F0FF

START:
       STA    LFFF8   ;4
       TAY            ;2
       TAY            ;2
       TAY            ;2
       INX            ;2
       TAY            ;2
       TAY            ;2
       EOR    $AAAB,X ;4
       TAX            ;2
       TSX            ;2
       TAX            ;2
       TAX            ;2
       .byte $D3 ;.DCP;8
       TAY            ;2
       LDA    #$31    ;2
       AND    ($29),Y ;5
       LDA    #$A9    ;2
LF118: LDA    $AE     ;3
       BNE    LF142   ;2
       LDY    #$17    ;2
       JSR    LFAF4   ;6
LF121: LDA    INTIM   ;4
       CMP    #$C2    ;2
       BNE    LF121   ;2
       LDY    #$7F    ;2
       JSR    LF904   ;6
       LDY    #$0B    ;2
       JSR    LFAF4   ;6
LF132: LDA    INTIM   ;4
       CMP    #$0C    ;2
       BNE    LF132   ;2
       LDA    #$32    ;2
       LDY    #$06    ;2
       JSR    LF900   ;6
       BEQ    LF155   ;2
LF142: LDY    #$51    ;2
       JSR    LFAF4   ;6
LF147: LDA    INTIM   ;4
       CMP    #$68    ;2
       BNE    LF147   ;2
       LDY    #$06    ;2
       LDA    #$24    ;2
       JSR    LF900   ;6
LF155: JMP    LF535   ;3
       BNE    LF15B   ;2
       INY            ;2
LF15B: LDA    $A9     ;3
       BEQ    LF161   ;2
       LDY    #$02    ;2
LF161: TXA            ;2
       STA    LF048   ;4
       LSR            ;2
       LDA    LF080   ;4
       BCC    LF16D   ;2
       ADC    #$7F    ;2
LF16D: TAX            ;2
       LDA    LFEFE,Y ;4
       STA    $C2     ;3
       LDA    LFFF0,Y ;4
       SEC            ;2
       SBC    $C2     ;3
       STA    $C8     ;3
       LDA    LFEFC,Y ;4
       SBC    $C2     ;3
       STA    $BC     ;3
       LDA    LFBD0,X ;4
       AND    #$F7    ;2
       STA    $B0     ;3
       LDA    LFBD0,X ;4
       ASL            ;2
       AND    #$F0    ;2
       ORA    #$08    ;2
       STA    $B6     ;3
       LDA    $A7     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAX            ;2
       LDA    LF960,X ;4
       STA    $F6     ;3
       LDA    $A6     ;3
       BEQ    LF1DC   ;2
       CMP    #$20    ;2
       BCS    LF1DC   ;2
       LDX    LF0C9   ;4
       STX    $C2     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAX            ;2
       LDY    LF95C,X ;4
       LDX    $85     ;3
       LDA    LFBD0,X ;4
       TAX            ;2
       ASL            ;2
       AND    #$F0    ;2
       ORA    LF948,Y ;4
       STA    $B6     ;3
       TXA            ;2
       AND    #$F7    ;2
       STA    $B0     ;3
       TYA            ;2
       ASL            ;2
       ASL            ;2
       TAY            ;2
       LDA    LFB00,Y ;4
       SEC            ;2
       SBC    $C2     ;3
       STA    $C8     ;3
       LDA    LFB50,Y ;4
       SBC    $C2     ;3
       STA    $BC     ;3
       LDX    #$01    ;2
       BNE    LF255   ;2
LF1DC: LDX    #$01    ;2
       LDA    $A2     ;3
       BEQ    LF255   ;2
       LDA    $81     ;3
       LSR            ;2
       LSR            ;2
       TAY            ;2
       AND    #$03    ;2
       STA    $F8     ;3
       TYA            ;2
       LSR            ;2
       AND    #$03    ;2
       STA    $F9     ;3
       DEX            ;2
       STX    $F1     ;3
       DEX            ;2
       STX    $F0     ;3
LF1F7: INC    $F0     ;5
       LDY    $F0     ;3
       CPY    $A2     ;3
       BEQ    LF253   ;2
       LDA    LF0C3,Y ;4
       TAY            ;2
       BMI    LF1F7   ;2
       LDX    LF082,Y ;4
       LDA    LFBD0,X ;4
       STA    $F4     ;3
       EOR    LF092,Y ;4
       AND    #$08    ;2
       EOR    $F4     ;3
       LDX    $F1     ;3
       STA    $B1,X   ;4
       TYA            ;2
       STA    LF043,X ;5
       LDA.wy $00E0,Y ;4
       STA    $C3,X   ;4
       LDA    LF0A2,Y ;4
       TAY            ;2
       LDA    $A7     ;3
       BEQ    LF22B   ;2
       LDY    $F6     ;3
LF22B: LDA    $F4     ;3
       ASL            ;2
       AND    #$F0    ;2
       ORA    LF948,Y ;4
       STA    $B7,X   ;4
       TYA            ;2
       ASL            ;2
       ASL            ;2
       LDX    LFA00,Y ;4
       ORA    $F8,X   ;4
       LDX    $F1     ;3
       TAY            ;2
       LDA    LFB00,Y ;4
       SEC            ;2
       SBC    $C3,X   ;4
       STA    $C9,X   ;4
       LDA    LFB50,Y ;4
       SBC    $C3,X   ;4
       STA    $BD,X   ;4
       INC    $F1     ;5
       BNE    LF1F7   ;2
LF253: INX            ;2
       INX            ;2
LF255: STX    $A2     ;3
       STX    $A3     ;3
       LDX    #$FD    ;2
       TXS            ;2
       LDX    #$02    ;2
LF25E: LDA    #$F8    ;2
       PHA            ;3
       LDA    $8B,X   ;4
       AND    #$0F    ;2
       TAY            ;2
       LDA    LF93E,Y ;4
       PHA            ;3
       LDA    #$F8    ;2
       PHA            ;3
       LDA    $8B,X   ;4
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAY            ;2
       LDA    LF93E,Y ;4
       PHA            ;3
       DEX            ;2
       BPL    LF25E   ;2
       LDX    #$05    ;2
LF27D: PLA            ;4
       CMP    #$26    ;2
       BNE    LF28A   ;2
       LDA    #$89    ;2
       PHA            ;3
       PLA            ;4
       PLA            ;4
       DEX            ;2
       BNE    LF27D   ;2
LF28A: LDA    #$08    ;2
       STA    COLUPF  ;3
LF28E: LDA    $0285   ;4
       BPL    LF28E   ;2
       STA    WSYNC   ;3
       LDA    #$DC    ;2
       STA    TIM64T  ;4
       LDX    #$00    ;2
       STX    VBLANK  ;3
       STX    GRP0    ;3
       STX    GRP1    ;3
       STX    REFP0   ;3
       STX    REFP1   ;3
       LDA    #$C0    ;2
       SBC    $85     ;3
       STA    HMBL    ;3
       LDA    #$15    ;2
       STA    CTRLPF  ;3
       STA    RESP0   ;3
       STA    RESP1   ;3
       DEX            ;2
       TXS            ;2
       STA    RESBL   ;3
       STX    HMP0    ;3
       LDY    $D7     ;3
       LDA    ($9B),Y ;5
       EOR    $DA     ;3
       AND    #$0F    ;2
       EOR    $DA     ;3
       STA    $DA     ;3
       LDX    #$03    ;2
       STX    NUSIZ0  ;3
       STA    HMOVE   ;3
       LDA    LF0FD   ;4
       BPL    LF2D9   ;2
       ASL            ;2
       AND    #$F7    ;2
       STA    COLUBK  ;3
       JMP    LF535   ;3
LF2D9: STX    NUSIZ1  ;3
       STX    VDELP0  ;3
       STX    VDEL01  ;3
       LDY    #$06    ;2
       LDA    $81     ;3
       ASL            ;2
       AND    #$F0    ;2
       ORA    #$14    ;2
       JSR    LF900   ;6
       LDY    $82     ;3
       BNE    LF2F2   ;2
       JMP    LF118   ;3
LF2F2: DEY            ;2
       LDA    #$40    ;2
       JSR    LF66B   ;6
       LDA    #$32    ;2
       LDY    #$04    ;2
       JSR    LF900   ;6
       LDY    $83     ;3
       LDA    #$53    ;2
       JSR    LF66B   ;6
       LDY    #$02    ;2
       LDA    #$FF    ;2
       JSR    LF900   ;6
       LDY    $84     ;3
       LDA    #$DD    ;2
       JSR    LF66B   ;6
       LDY    #$01    ;2
       LDA    #$32    ;2
       JSR    LF900   ;6
       LDA    $AA     ;3
       BEQ    LF322   ;2
       JMP    LF553   ;3
LF322: LDA    #$C2    ;2
       STA    COLUP0  ;3
       STA    COLUP1  ;3
       LDA    $F0     ;3
       LDA    $99     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAX            ;2
       LDA    LFA29,X ;4
       STA    $F0     ;3
       SEC            ;2
       LDA    #$67    ;2
       SBC    $F0     ;3
       STA    $F8     ;3
       LDA    #$FE    ;2
       STA    $F9     ;3
       LDA    #$0D    ;2
       STA    $F0     ;3
       LDA    #$02    ;2
       STA    PF2     ;3
LF348: LDA    $F0     ;3
       LSR            ;2
       TAY            ;2
       LDA    ($F8),Y ;5
       STA    ENABL   ;3
       LDA    LF0F2,Y ;4
       STA    $F1     ;3
       LDA    LF0EB,Y ;4
       TAX            ;2
       LDA    LF0CF,Y ;4
       STA    GRP0    ;3
       LDA    LF0D6,Y ;4
       STA    GRP1    ;3
       LDA    LF0DD,Y ;4
       STA    GRP0    ;3
       LDA    LF0E4,Y ;4
       LDY    $F1     ;3
       STA    GRP1    ;3
       STX    GRP0    ;3
       STY    GRP1    ;3
       STA    GRP0    ;3
       DEC    $F0     ;5
       BPL    LF348   ;2
       STA    WSYNC   ;3
       LDA    #$82    ;2
       STA    PF2     ;3
       JSR    LF92E   ;6
       JSR    LF92E   ;6
       STA    ENABL   ;3
       STA    VDEL01  ;3
       STA    NUSIZ0  ;3
       STA    NUSIZ1  ;3
       LDA    #$FE    ;2
       STA    PF2     ;3
       STA    WSYNC   ;3
       LDX    #$03    ;2
       JMP    LF3A2   ;3
LF398: BCC    LF39C   ;2
       STA    RESM0,X ;4
LF39C: STA    WSYNC   ;3
       LDA    #$00    ;2
       STA    PF2     ;3
LF3A2: LDY    $85,X   ;4
       LDA    LFBD0,Y ;4
       BMI    LF3A9   ;2
LF3A9: AND    #$06    ;2
       BEQ    LF3B2   ;2
       SEC            ;2
LF3AE: SBC    #$01    ;2
       BNE    LF3AE   ;2
LF3B2: STA    RESP1,X ;4
       LDA    LFBD0,Y ;4
       ASL            ;2
       STA    HMP1,X  ;4
       LSR            ;2
       LSR            ;2
       DEX            ;2
       BPL    LF398   ;2
       BCC    LF3C4   ;2
       NOP            ;2
       STA    RESP1   ;3
LF3C4: STA    WSYNC   ;3
       STA    HMOVE   ;3
       LDX    #$1D    ;2
       TXS            ;2
       LDY    #$8B    ;2
       STA    WSYNC   ;3
       STA    HMOVE   ;3
       LDA    $8F     ;3
       STA    COLUBK  ;3
       LDA    LF0CA   ;4
       STA    COLUP1  ;3
       STA    COLUPF  ;3
       LDX    LF081   ;4
       DEX            ;2
       STX    REFP1   ;3
       NOP            ;2
       STA    CXCLR   ;3
       STA    HMCLR   ;3
       LDA    $AD     ;3
       BEQ    LF3EE   ;2
       JMP    LF535   ;3
LF3EE: LDA    #$30    ;2
       STA    HMM1    ;3
       LDA    #$D0    ;2
       STA    HMBL    ;3
       LDA    #$00    ;2
       JMP    LF461   ;3
LF3FB: JMP    LF53B   ;3
       BRK            ;7
       BRK            ;7
LF400: LDA    ($9F),Y ;5
       JMP    LF409   ;3
LF405: STX    $A1     ;3
LF407: LDA    #$FF    ;2
LF409: STA    WSYNC   ;3
       STA    HMOVE   ;3
       STA    COLUP0  ;3
       LDA    ($94),Y ;5
       STA    GRP1    ;3
       LDA    ($9B),Y ;5
       STA    ENAM1   ;3
       STA    ENABL   ;3
       AND    #$F0    ;2
       STA    NUSIZ1  ;3
       STA    CTRLPF  ;3
       DEY            ;2
       BEQ    LF3FB   ;2
       CPY    $97     ;3
       BCS    LF42A   ;2
       LDA    $96     ;3
       STA    $94     ;3
LF42A: LDA    #$00    ;2
       STA    HMP0    ;3
       CPY    $A1     ;3
       BCC    LF438   ;2
       STA    WSYNC   ;3
       STA    HMOVE   ;3
       BCS    LF444   ;2
LF438: LDA    ($9D),Y ;5
       STA    GRP0    ;3
       LDA    ($9F),Y ;5
       STA    WSYNC   ;3
       STA    HMOVE   ;3
       STA    COLUP0  ;3
LF444: LDA    ($94),Y ;5
       STA    GRP1    ;3
       LDA    ($9B),Y ;5
       STA    ENAM1   ;3
       STA    ENABL   ;3
       CPY    $9A     ;3
       PHP            ;3
       PLA            ;4
       DEY            ;2
       CPY    $D7     ;3
       BEQ    LF4CC   ;2
LF457: CPY    $A1     ;3
       BCS    LF407   ;2
       LDA    ($9D),Y ;5
       STA    GRP0    ;3
       BNE    LF400   ;2
LF461: LDX    $A2     ;3
       BEQ    LF405   ;2
       DEX            ;2
       LDA    $C2,X   ;4
       STA    $A1     ;3
       LDA    ($94),Y ;5
       STA    HMOVE   ;3
       STA    GRP1    ;3
       DEY            ;2
       LDA    $B0,X   ;4
       STA    REFP0   ;3
       BMI    LF477   ;2
LF477: AND    #$06    ;2
       BEQ    LF480   ;2
       SEC            ;2
LF47C: SBC    #$01    ;2
       BNE    LF47C   ;2
LF480: STA    RESP0   ;3
       LSR    $B0,X   ;6
       LDA    $B6,X   ;4
       STA    HMP0    ;3
       ORA    #$F0    ;2
       STA    $A0     ;3
       STA    $9E     ;3
       BCC    LF492   ;2
       STA    RESP0   ;3
LF492: STA    WSYNC   ;3
       STA    HMOVE   ;3
       LDA    ($94),Y ;5
       STA    GRP1    ;3
       LDA    ($9B),Y ;5
       STA    ENAM1   ;3
       STA    ENABL   ;3
       CPY    $9A     ;3
       PHP            ;3
       PLA            ;4
       DEY            ;2
       LDA    $BC,X   ;4
       STA    $9F     ;3
       LDA    $C8,X   ;4
       STA    $9D     ;3
       LDA    CXPPMM  ;3
       STA    $B0,X   ;4
       STX    $A2     ;3
       CPY    $D7     ;3
       BEQ    LF4BF   ;2
       JMP    LF407   ;3
LF4BA: LDA    $F0     ;3
       NOP            ;2
       NOP            ;2
       NOP            ;2
LF4BF: LDX    $DA     ;3
       STX    PF0     ;3
       LDA    $DB     ;3
       STA    PF1     ;3
       STA    HMOVE   ;3
       JMP    LF4E4   ;3
LF4CC: STX    $A4     ;3
       LDX    $DA     ;3
       CPY    $A1     ;3
       BCS    LF4BA   ;2
       STX    PF0     ;3
       LDA    ($9D),Y ;5
       STA    GRP0    ;3
       LDA    $DB     ;3
       STA    PF1     ;3
       LDA    ($9F),Y ;5
       STA    HMOVE   ;3
       STA    COLUP0  ;3
LF4E4: STX    ENABL   ;3
       STX    ENAM1   ;3
       LDA    ($94),Y ;5
       STA    GRP1    ;3
       LDA    $DC     ;3
       STA    PF2     ;3
       DEY            ;2
       LDX    #$00    ;2
       STX    HMP0    ;3
       LDA    $DD     ;3
       STA    PF0     ;3
       LDA    $DE     ;3
       STA    PF1     ;3
       LDA    $DF     ;3
       STA    PF2     ;3
       CPY    $A1     ;3
       STX    PF0     ;3
       BCS    LF527   ;2
       LDA    ($9D),Y ;5
       STX    PF1     ;3
       STA    GRP0    ;3
       STX    PF2     ;3
       CPY    $9A     ;3
       STA    HMOVE   ;3
       PHP            ;3
       LDA    ($9F),Y ;5
       STA    COLUP0  ;3
       LDA    ($9B),Y ;5
       STA    ENAM1   ;3
       STA    ENABL   ;3
       LDA    ($94),Y ;5
       STA    GRP1    ;3
       PLA            ;4
       DEY            ;2
       JMP    LF457   ;3
LF527: NOP            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       STX    PF1     ;3
       STX    PF2     ;3
       STA    HMOVE   ;3
       JMP    LF444   ;3
LF535: LDX    #$00    ;2
       STX    $A3     ;3
       STX    $A2     ;3
LF53B: LDA    $0285   ;4
       BPL    LF53B   ;2
       STA    WSYNC   ;3
       LDA    #$02    ;2
       STA    VBLANK  ;3
       LDA    #$00    ;2
       STA    COLUBK  ;3
       STA    ENAM1   ;3
       STA    ENAM0   ;3
       STA    ENABL   ;3
       JMP    LFFF2   ;3
LF553: LDY    #$23    ;2
       LDA    LF0CE   ;4
       CMP    #$20    ;2
       BNE    LF55E   ;2
       LDY    #$5D    ;2
LF55E: JSR    LFAF4   ;6
LF561: LDA    INTIM   ;4
       CMP    #$AC    ;2
       BNE    LF561   ;2
       LDA    #$82    ;2
       LDY    #$06    ;2
       JSR    LF900   ;6
       LDY    #$2F    ;2
       JSR    LFAF4   ;6
       LDA    $89     ;3
       AND    #$0F    ;2
       TAX            ;2
       LDA    LF0CE   ;4
       CMP    #$20    ;2
       BNE    LF581   ;2
       INX            ;2
LF581: LDA    LF93E,X ;4
       STA    $F8     ;3
       LDA    $89     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAX            ;2
       BEQ    LF594   ;2
       LDA    LF93E,X ;4
       STA    $F6     ;3
LF594: LDA    INTIM   ;4
       CMP    #$9B    ;2
       BNE    LF594   ;2
       LDY    #$06    ;2
       JSR    LF904   ;6
       LDA    LF0CE   ;4
       CMP    #$20    ;2
       BEQ    LF5B8   ;2
       LDY    #$39    ;2
       JSR    LFAF4   ;6
LF5AC: LDA    INTIM   ;4
       CMP    #$88    ;2
       BNE    LF5AC   ;2
       LDY    #$06    ;2
       JSR    LF904   ;6
LF5B8: LDA    $AA     ;3
       AND    #$07    ;2
       BNE    LF5EE   ;2
       LDY    #$00    ;2
       STY    $92     ;3
       LDA    $D6     ;3
       LDX    #$07    ;2
LF5C6: LSR            ;2
       BCC    LF5CA   ;2
       INY            ;2
LF5CA: DEX            ;2
       BPL    LF5C6   ;2
       CPY    $D4     ;3
       BEQ    LF5EE   ;2
       INC    $D4     ;5
       LDA    #$FD    ;2
       STA    $90     ;3
       SED            ;2
       LDA    LF0CE   ;4
       CLC            ;2
       ADC    $8C     ;3
       STA    $8C     ;3
       BCC    LF5EE   ;2
       INC    $82     ;5
       INC    $84     ;5
       INC    $83     ;5
       LDA    #$8B    ;2
       STA    $93     ;3
       INC    $8B     ;5
LF5EE: CLD            ;2
       LDX    #$00    ;2
       STX    $99     ;3
       DEC    $AA     ;5
       BNE    LF615   ;2
       STX    $8E     ;3
       STX    $D4     ;3
       DEX            ;2
       STX    $81     ;3
       LDA    $89     ;3
       AND    #$0F    ;2
       BEQ    LF608   ;2
       CMP    #$05    ;2
       BNE    LF60D   ;2
LF608: STX    $D6     ;3
       INX            ;2
       STX    $A9     ;3
LF60D: LDA    #$53    ;2
       STA    $85     ;3
       LDA    #$49    ;2
       STA    $99     ;3
LF615: LDA    #$01    ;2
       STA    LF001   ;4
       STA    LF041   ;4
       LDY    #$45    ;2
       JSR    LFAF4   ;6
       LDX    LF0CE   ;4
       CPX    #$20    ;2
       BEQ    LF62E   ;2
       LDA    LF93E,X ;4
       STA    $FA     ;3
LF62E: LDA    INTIM   ;4
       CMP    #$4F    ;2
       BNE    LF62E   ;2
       LDA    #$C2    ;2
       LDY    #$06    ;2
       JSR    LF900   ;6
       LDY    #$2F    ;2
       JSR    LFAF4   ;6
       LDY    $D4     ;3
       LDX    #$00    ;2
       TYA            ;2
LF646: BEQ    LF658   ;2
       LDA    #$56    ;2
       CPY    #$02    ;2
       BCS    LF650   ;2
       LDA    #$5E    ;2
LF650: STA    $F4,X   ;4
       INX            ;2
       INX            ;2
       DEY            ;2
       DEY            ;2
       BPL    LF646   ;2
LF658: LDA    INTIM   ;4
       CMP    #$41    ;2
       BNE    LF658   ;2
       LDA    #$54    ;2
       LDY    #$07    ;2
       JSR    LF900   ;6
       STA    CXCLR   ;3
       JMP    LF535   ;3
LF66B: LDX    #$0A    ;2
LF66D: DEY            ;2
       BMI    LF677   ;2
       STA    $F2,X   ;4
       DEX            ;2
       DEX            ;2
       BPL    LF66D   ;2
       RTS            ;6

LF677: LDA    #$89    ;2
LF679: STA    $F2,X   ;4
       DEX            ;2
       DEX            ;2
       BPL    LF679   ;2
       RTS            ;6

       .byte $FF ; |XXXXXXXX| $F680
       .byte $80 ; |X       | $F681
       .byte $80 ; |X       | $F682
       .byte $80 ; |X       | $F683
       .byte $80 ; |X       | $F684
       .byte $80 ; |X       | $F685
       .byte $F0 ; |XXXX    | $F686
       .byte $10 ; |   X    | $F687
       .byte $10 ; |   X    | $F688
       .byte $10 ; |   X    | $F689
       .byte $10 ; |   X    | $F68A
       .byte $10 ; |   X    | $F68B
       .byte $10 ; |   X    | $F68C
       .byte $10 ; |   X    | $F68D
       .byte $10 ; |   X    | $F68E
       .byte $10 ; |   X    | $F68F
       .byte $10 ; |   X    | $F690
       .byte $F0 ; |XXXX    | $F691
       .byte $80 ; |X       | $F692
       .byte $80 ; |X       | $F693
       .byte $87 ; |X    XXX| $F694
       .byte $87 ; |X    XXX| $F695
       .byte $87 ; |X    XXX| $F696
       .byte $F7 ; |XXXX XXX| $F697
       .byte $07 ; |     XXX| $F698
       .byte $07 ; |     XXX| $F699
       .byte $07 ; |     XXX| $F69A
       .byte $07 ; |     XXX| $F69B
       .byte $00 ; |        | $F69C
       .byte $07 ; |     XXX| $F69D
       .byte $07 ; |     XXX| $F69E
       .byte $00 ; |        | $F69F
       .byte $00 ; |        | $F6A0
       .byte $00 ; |        | $F6A1
       .byte $01 ; |       X| $F6A2
       .byte $03 ; |      XX| $F6A3
       .byte $07 ; |     XXX| $F6A4
       .byte $07 ; |     XXX| $F6A5
       .byte $07 ; |     XXX| $F6A6
       .byte $07 ; |     XXX| $F6A7
       .byte $07 ; |     XXX| $F6A8
       .byte $07 ; |     XXX| $F6A9
       .byte $03 ; |      XX| $F6AA
       .byte $01 ; |       X| $F6AB
       .byte $00 ; |        | $F6AC
       .byte $00 ; |        | $F6AD
       .byte $00 ; |        | $F6AE
       .byte $07 ; |     XXX| $F6AF
       .byte $07 ; |     XXX| $F6B0
       .byte $07 ; |     XXX| $F6B1
       .byte $07 ; |     XXX| $F6B2
       .byte $07 ; |     XXX| $F6B3
       .byte $07 ; |     XXX| $F6B4
       .byte $07 ; |     XXX| $F6B5
       .byte $00 ; |        | $F6B6
       .byte $07 ; |     XXX| $F6B7
       .byte $07 ; |     XXX| $F6B8
       .byte $07 ; |     XXX| $F6B9
       .byte $00 ; |        | $F6BA
       .byte $00 ; |        | $F6BB
       .byte $00 ; |        | $F6BC
       .byte $07 ; |     XXX| $F6BD
       .byte $07 ; |     XXX| $F6BE
       .byte $07 ; |     XXX| $F6BF
       .byte $07 ; |     XXX| $F6C0
       .byte $07 ; |     XXX| $F6C1
       .byte $07 ; |     XXX| $F6C2
       .byte $07 ; |     XXX| $F6C3
       .byte $07 ; |     XXX| $F6C4
       .byte $07 ; |     XXX| $F6C5
       .byte $07 ; |     XXX| $F6C6
       .byte $07 ; |     XXX| $F6C7
       .byte $00 ; |        | $F6C8
       .byte $00 ; |        | $F6C9
       .byte $00 ; |        | $F6CA
       .byte $01 ; |       X| $F6CB
       .byte $03 ; |      XX| $F6CC
       .byte $07 ; |     XXX| $F6CD
       .byte $07 ; |     XXX| $F6CE
       .byte $07 ; |     XXX| $F6CF
       .byte $07 ; |     XXX| $F6D0
       .byte $07 ; |     XXX| $F6D1
       .byte $07 ; |     XXX| $F6D2
       .byte $03 ; |      XX| $F6D3
       .byte $01 ; |       X| $F6D4
       .byte $00 ; |        | $F6D5
       .byte $00 ; |        | $F6D6
       .byte $07 ; |     XXX| $F6D7
       .byte $07 ; |     XXX| $F6D8
       .byte $07 ; |     XXX| $F6D9
       .byte $07 ; |     XXX| $F6DA
       .byte $07 ; |     XXX| $F6DB
       .byte $07 ; |     XXX| $F6DC
       .byte $07 ; |     XXX| $F6DD
       .byte $07 ; |     XXX| $F6DE
       .byte $00 ; |        | $F6DF
       .byte $07 ; |     XXX| $F6E0
       .byte $07 ; |     XXX| $F6E1
       .byte $07 ; |     XXX| $F6E2
       .byte $00 ; |        | $F6E3
       .byte $00 ; |        | $F6E4
       .byte $00 ; |        | $F6E5
       .byte $01 ; |       X| $F6E6
       .byte $03 ; |      XX| $F6E7
       .byte $07 ; |     XXX| $F6E8
       .byte $07 ; |     XXX| $F6E9
       .byte $07 ; |     XXX| $F6EA
       .byte $07 ; |     XXX| $F6EB
       .byte $07 ; |     XXX| $F6EC
       .byte $07 ; |     XXX| $F6ED
       .byte $03 ; |      XX| $F6EE
       .byte $01 ; |       X| $F6EF
       .byte $00 ; |        | $F6F0
       .byte $00 ; |        | $F6F1
       .byte $00 ; |        | $F6F2
       .byte $1F ; |   XXXXX| $F6F3
       .byte $1F ; |   XXXXX| $F6F4
       .byte $1F ; |   XXXXX| $F6F5
       .byte $1F ; |   XXXXX| $F6F6
       .byte $1F ; |   XXXXX| $F6F7
       .byte $1F ; |   XXXXX| $F6F8
       .byte $1F ; |   XXXXX| $F6F9
       .byte $1F ; |   XXXXX| $F6FA
       .byte $1F ; |   XXXXX| $F6FB
       .byte $00 ; |        | $F6FC
       .byte $7F ; | XXXXXXX| $F6FD
       .byte $7F ; | XXXXXXX| $F6FE
       .byte $7F ; | XXXXXXX| $F6FF
       .byte $FF ; |XXXXXXXX| $F700
       .byte $00 ; |        | $F701
       .byte $00 ; |        | $F702
       .byte $00 ; |        | $F703
       .byte $00 ; |        | $F704
       .byte $FE ; |XXXXXXX | $F705
       .byte $82 ; |X     X | $F706
       .byte $82 ; |X     X | $F707
       .byte $82 ; |X     X | $F708
       .byte $82 ; |X     X | $F709
       .byte $82 ; |X     X | $F70A
       .byte $82 ; |X     X | $F70B
       .byte $82 ; |X     X | $F70C
       .byte $82 ; |X     X | $F70D
       .byte $82 ; |X     X | $F70E
       .byte $82 ; |X     X | $F70F
       .byte $82 ; |X     X | $F710
       .byte $FE ; |XXXXXXX | $F711
       .byte $00 ; |        | $F712
       .byte $03 ; |      XX| $F713
       .byte $C7 ; |XX   XXX| $F714
       .byte $CF ; |XX  XXXX| $F715
       .byte $DF ; |XX XXXXX| $F716
       .byte $DE ; |XX XXXX | $F717
       .byte $DC ; |XX XXX  | $F718
       .byte $DE ; |XX XXXX | $F719
       .byte $C7 ; |XX   XXX| $F71A
       .byte $C3 ; |XX    XX| $F71B
       .byte $07 ; |     XXX| $F71C
       .byte $FF ; |XXXXXXXX| $F71D
       .byte $FE ; |XXXXXXX | $F71E
       .byte $00 ; |        | $F71F
       .byte $00 ; |        | $F720
       .byte $00 ; |        | $F721
       .byte $FF ; |XXXXXXXX| $F722
       .byte $FF ; |XXXXXXXX| $F723
       .byte $80 ; |X       | $F724
       .byte $80 ; |X       | $F725
       .byte $FF ; |XXXXXXXX| $F726
       .byte $FF ; |XXXXXXXX| $F727
       .byte $8F ; |X   XXXX| $F728
       .byte $8F ; |X   XXXX| $F729
       .byte $FF ; |XXXXXXXX| $F72A
       .byte $FE ; |XXXXXXX | $F72B
       .byte $00 ; |        | $F72C
       .byte $00 ; |        | $F72D
       .byte $00 ; |        | $F72E
       .byte $FC ; |XXXXXX  | $F72F
       .byte $FF ; |XXXXXXXX| $F730
       .byte $FF ; |XXXXXXXX| $F731
       .byte $CF ; |XX  XXXX| $F732
       .byte $C7 ; |XX   XXX| $F733
       .byte $C7 ; |XX   XXX| $F734
       .byte $C7 ; |XX   XXX| $F735
       .byte $0F ; |    XXXX| $F736
       .byte $FF ; |XXXXXXXX| $F737
       .byte $FF ; |XXXXXXXX| $F738
       .byte $FC ; |XXXXXX  | $F739
       .byte $00 ; |        | $F73A
       .byte $00 ; |        | $F73B
       .byte $01 ; |       X| $F73C
       .byte $C3 ; |XX    XX| $F73D
       .byte $C7 ; |XX   XXX| $F73E
       .byte $CF ; |XX  XXXX| $F73F
       .byte $DF ; |XX XXXXX| $F740
       .byte $DF ; |XX XXXXX| $F741
       .byte $DF ; |XX XXXXX| $F742
       .byte $DF ; |XX XXXXX| $F743
       .byte $DB ; |XX XX XX| $F744
       .byte $D3 ; |XX X  XX| $F745
       .byte $C3 ; |XX    XX| $F746
       .byte $C3 ; |XX    XX| $F747
       .byte $00 ; |        | $F748
       .byte $00 ; |        | $F749
       .byte $00 ; |        | $F74A
       .byte $FF ; |XXXXXXXX| $F74B
       .byte $FF ; |XXXXXXXX| $F74C
       .byte $80 ; |X       | $F74D
       .byte $80 ; |X       | $F74E
       .byte $FF ; |XXXXXXXX| $F74F
       .byte $FF ; |XXXXXXXX| $F750
       .byte $8F ; |X   XXXX| $F751
       .byte $8F ; |X   XXXX| $F752
       .byte $FF ; |XXXXXXXX| $F753
       .byte $FE ; |XXXXXXX | $F754
       .byte $00 ; |        | $F755
       .byte $00 ; |        | $F756
       .byte $C0 ; |XX      | $F757
       .byte $C0 ; |XX      | $F758
       .byte $C0 ; |XX      | $F759
       .byte $C0 ; |XX      | $F75A
       .byte $C0 ; |XX      | $F75B
       .byte $FC ; |XXXXXX  | $F75C
       .byte $FC ; |XXXXXX  | $F75D
       .byte $C0 ; |XX      | $F75E
       .byte $00 ; |        | $F75F
       .byte $FF ; |XXXXXXXX| $F760
       .byte $FF ; |XXXXXXXX| $F761
       .byte $FF ; |XXXXXXXX| $F762
       .byte $00 ; |        | $F763
       .byte $00 ; |        | $F764
       .byte $00 ; |        | $F765
       .byte $FF ; |XXXXXXXX| $F766
       .byte $FF ; |XXXXXXXX| $F767
       .byte $80 ; |X       | $F768
       .byte $80 ; |X       | $F769
       .byte $FF ; |XXXXXXXX| $F76A
       .byte $FF ; |XXXXXXXX| $F76B
       .byte $8F ; |X   XXXX| $F76C
       .byte $8F ; |X   XXXX| $F76D
       .byte $FF ; |XXXXXXXX| $F76E
       .byte $FE ; |XXXXXXX | $F76F
       .byte $00 ; |        | $F770
       .byte $00 ; |        | $F771
       .byte $00 ; |        | $F772
       .byte $FF ; |XXXXXXXX| $F773
       .byte $FF ; |XXXXXXXX| $F774
       .byte $FF ; |XXXXXXXX| $F775
       .byte $87 ; |X    XXX| $F776
       .byte $83 ; |X     XX| $F777
       .byte $83 ; |X     XX| $F778
       .byte $83 ; |X     XX| $F779
       .byte $83 ; |X     XX| $F77A
       .byte $83 ; |X     XX| $F77B
       .byte $07 ; |     XXX| $F77C
       .byte $FF ; |XXXXXXXX| $F77D
       .byte $FF ; |XXXXXXXX| $F77E
       .byte $FF ; |XXXXXXXX| $F77F
       .byte $FE ; |XXXXXXX | $F780
       .byte $02 ; |      X | $F781
       .byte $02 ; |      X | $F782
       .byte $02 ; |      X | $F783
       .byte $02 ; |      X | $F784
       .byte $02 ; |      X | $F785
       .byte $1E ; |   XXXX | $F786
       .byte $10 ; |   X    | $F787
       .byte $10 ; |   X    | $F788
       .byte $10 ; |   X    | $F789
       .byte $10 ; |   X    | $F78A
       .byte $10 ; |   X    | $F78B
       .byte $10 ; |   X    | $F78C
       .byte $10 ; |   X    | $F78D
       .byte $10 ; |   X    | $F78E
       .byte $10 ; |   X    | $F78F
       .byte $10 ; |   X    | $F790
       .byte $1E ; |   XXXX | $F791
       .byte $02 ; |      X | $F792
       .byte $E2 ; |XXX   X | $F793
       .byte $C2 ; |XX    X | $F794
       .byte $82 ; |X     X | $F795
       .byte $02 ; |      X | $F796
       .byte $3E ; |  XXXXX | $F797
       .byte $00 ; |        | $F798
       .byte $00 ; |        | $F799
       .byte $80 ; |X       | $F79A
       .byte $C0 ; |XX      | $F79B
       .byte $C0 ; |XX      | $F79C
       .byte $80 ; |X       | $F79D
       .byte $00 ; |        | $F79E
       .byte $00 ; |        | $F79F
       .byte $00 ; |        | $F7A0
       .byte $00 ; |        | $F7A1
       .byte $00 ; |        | $F7A2
       .byte $00 ; |        | $F7A3
       .byte $00 ; |        | $F7A4
       .byte $00 ; |        | $F7A5
       .byte $00 ; |        | $F7A6
       .byte $80 ; |X       | $F7A7
       .byte $80 ; |X       | $F7A8
       .byte $80 ; |X       | $F7A9
       .byte $00 ; |        | $F7AA
       .byte $00 ; |        | $F7AB
       .byte $00 ; |        | $F7AC
       .byte $00 ; |        | $F7AD
       .byte $00 ; |        | $F7AE
       .byte $00 ; |        | $F7AF
       .byte $00 ; |        | $F7B0
       .byte $80 ; |X       | $F7B1
       .byte $C0 ; |XX      | $F7B2
       .byte $C0 ; |XX      | $F7B3
       .byte $C0 ; |XX      | $F7B4
       .byte $C0 ; |XX      | $F7B5
       .byte $C0 ; |XX      | $F7B6
       .byte $80 ; |X       | $F7B7
       .byte $00 ; |        | $F7B8
       .byte $00 ; |        | $F7B9
       .byte $00 ; |        | $F7BA
       .byte $00 ; |        | $F7BB
       .byte $C0 ; |XX      | $F7BC
       .byte $C0 ; |XX      | $F7BD
       .byte $C0 ; |XX      | $F7BE
       .byte $C0 ; |XX      | $F7BF
       .byte $C0 ; |XX      | $F7C0
       .byte $C0 ; |XX      | $F7C1
       .byte $C0 ; |XX      | $F7C2
       .byte $C0 ; |XX      | $F7C3
       .byte $C0 ; |XX      | $F7C4
       .byte $C0 ; |XX      | $F7C5
       .byte $C0 ; |XX      | $F7C6
       .byte $C0 ; |XX      | $F7C7
       .byte $00 ; |        | $F7C8
       .byte $00 ; |        | $F7C9
       .byte $00 ; |        | $F7CA
       .byte $00 ; |        | $F7CB
       .byte $00 ; |        | $F7CC
       .byte $00 ; |        | $F7CD
       .byte $00 ; |        | $F7CE
       .byte $00 ; |        | $F7CF
       .byte $80 ; |X       | $F7D0
       .byte $80 ; |X       | $F7D1
       .byte $80 ; |X       | $F7D2
       .byte $00 ; |        | $F7D3
       .byte $00 ; |        | $F7D4
       .byte $00 ; |        | $F7D5
       .byte $00 ; |        | $F7D6
       .byte $00 ; |        | $F7D7
       .byte $00 ; |        | $F7D8
       .byte $00 ; |        | $F7D9
       .byte $00 ; |        | $F7DA
       .byte $00 ; |        | $F7DB
       .byte $00 ; |        | $F7DC
       .byte $00 ; |        | $F7DD
       .byte $00 ; |        | $F7DE
       .byte $00 ; |        | $F7DF
       .byte $80 ; |X       | $F7E0
       .byte $80 ; |X       | $F7E1
       .byte $80 ; |X       | $F7E2
       .byte $00 ; |        | $F7E3
       .byte $00 ; |        | $F7E4
       .byte $00 ; |        | $F7E5
       .byte $00 ; |        | $F7E6
       .byte $00 ; |        | $F7E7
       .byte $00 ; |        | $F7E8
       .byte $00 ; |        | $F7E9
       .byte $00 ; |        | $F7EA
       .byte $80 ; |X       | $F7EB
       .byte $80 ; |X       | $F7EC
       .byte $80 ; |X       | $F7ED
       .byte $00 ; |        | $F7EE
       .byte $00 ; |        | $F7EF
       .byte $00 ; |        | $F7F0
       .byte $00 ; |        | $F7F1
       .byte $00 ; |        | $F7F2
       .byte $00 ; |        | $F7F3
       .byte $C0 ; |XX      | $F7F4
       .byte $E0 ; |XXX     | $F7F5
       .byte $F0 ; |XXXX    | $F7F6
       .byte $F0 ; |XXXX    | $F7F7
       .byte $F0 ; |XXXX    | $F7F8
       .byte $F0 ; |XXXX    | $F7F9
       .byte $F0 ; |XXXX    | $F7FA
       .byte $F0 ; |XXXX    | $F7FB
       .byte $F0 ; |XXXX    | $F7FC
       .byte $E0 ; |XXX     | $F7FD
       .byte $C0 ; |XX      | $F7FE
       .byte $00 ; |        | $F7FF
       .byte $30 ; |  XX    | $F800
       .byte $30 ; |  XX    | $F801
       .byte $30 ; |  XX    | $F802
       .byte $18 ; |   XX   | $F803
       .byte $0C ; |    XX  | $F804
       .byte $46 ; | X   XX | $F805
       .byte $7E ; | XXXXXX | $F806
       .byte $18 ; |   XX   | $F807
       .byte $18 ; |   XX   | $F808
       .byte $18 ; |   XX   | $F809
       .byte $18 ; |   XX   | $F80A
       .byte $78 ; | XXXX   | $F80B
       .byte $38 ; |  XXX   | $F80C
       .byte $7C ; | XXXXX  | $F80D
       .byte $46 ; | X   XX | $F80E
       .byte $06 ; |     XX | $F80F
       .byte $7C ; | XXXXX  | $F810
       .byte $60 ; | XX     | $F811
       .byte $60 ; | XX     | $F812
       .byte $7E ; | XXXXXX | $F813
       .byte $60 ; | XX     | $F814
       .byte $60 ; | XX     | $F815
       .byte $3C ; |  XXXX  | $F816
       .byte $06 ; |     XX | $F817
       .byte $46 ; | X   XX | $F818
       .byte $7C ; | XXXXX  | $F819
       .byte $3C ; |  XXXX  | $F81A
       .byte $46 ; | X   XX | $F81B
       .byte $06 ; |     XX | $F81C
       .byte $0C ; |    XX  | $F81D
       .byte $06 ; |     XX | $F81E
       .byte $46 ; | X   XX | $F81F
       .byte $3C ; |  XXXX  | $F820
       .byte $46 ; | X   XX | $F821
       .byte $06 ; |     XX | $F822
       .byte $3E ; |  XXXXX | $F823
       .byte $66 ; | XX  XX | $F824
       .byte $66 ; | XX  XX | $F825
       .byte $3C ; |  XXXX  | $F826
       .byte $66 ; | XX  XX | $F827
       .byte $66 ; | XX  XX | $F828
       .byte $66 ; | XX  XX | $F829
       .byte $66 ; | XX  XX | $F82A
       .byte $66 ; | XX  XX | $F82B
       .byte $3C ; |  XXXX  | $F82C
       .byte $66 ; | XX  XX | $F82D
       .byte $66 ; | XX  XX | $F82E
       .byte $3C ; |  XXXX  | $F82F
       .byte $66 ; | XX  XX | $F830
       .byte $66 ; | XX  XX | $F831
       .byte $3C ; |  XXXX  | $F832
       .byte $66 ; | XX  XX | $F833
       .byte $66 ; | XX  XX | $F834
       .byte $7C ; | XXXXX  | $F835
       .byte $60 ; | XX     | $F836
       .byte $62 ; | XX   X | $F837
       .byte $3C ; |  XXXX  | $F838
       .byte $0C ; |    XX  | $F839
       .byte $0C ; |    XX  | $F83A
       .byte $7E ; | XXXXXX | $F83B
       .byte $4C ; | X  XX  | $F83C
       .byte $2C ; |  X XX  | $F83D
       .byte $1C ; |   XXX  | $F83E
       .byte $0C ; |    XX  | $F83F
       .byte $7F ; | XXXXXXX| $F840
       .byte $FA ; |XXXXX X | $F841
       .byte $FC ; |XXXXXX  | $F842
       .byte $60 ; | XX     | $F843
       .byte $40 ; | X      | $F844
       .byte $77 ; | XXX XXX| $F845
       .byte $77 ; | XXX XXX| $F846
       .byte $55 ; | X X X X| $F847
       .byte $55 ; | X X X X| $F848
       .byte $55 ; | X X X X| $F849
       .byte $77 ; | XXX XXX| $F84A
       .byte $77 ; | XXX XXX| $F84B
       .byte $77 ; | XXX XXX| $F84C
       .byte $47 ; | X   XXX| $F84D
       .byte $45 ; | X   X X| $F84E
       .byte $25 ; |  X  X X| $F84F
       .byte $15 ; |   X X X| $F850
       .byte $17 ; |   X XXX| $F851
       .byte $67 ; | XX  XXX| $F852
       .byte $DE ; |XX XXXX | $F853
       .byte $7F ; | XXXXXXX| $F854
       .byte $DE ; |XX XXXX | $F855
       .byte $66 ; | XX  XX | $F856
       .byte $66 ; | XX  XX | $F857
       .byte $66 ; | XX  XX | $F858
       .byte $77 ; | XXX XXX| $F859
       .byte $77 ; | XXX XXX| $F85A
       .byte $77 ; | XXX XXX| $F85B
       .byte $66 ; | XX  XX | $F85C
       .byte $66 ; | XX  XX | $F85D
       .byte $60 ; | XX     | $F85E
       .byte $60 ; | XX     | $F85F
       .byte $60 ; | XX     | $F860
       .byte $70 ; | XXX    | $F861
       .byte $70 ; | XXX    | $F862
       .byte $70 ; | XXX    | $F863
       .byte $60 ; | XX     | $F864
       .byte $60 ; | XX     | $F865
       .byte $11 ; |   X   X| $F866
       .byte $11 ; |   X   X| $F867
       .byte $11 ; |   X   X| $F868
       .byte $79 ; | XXXX  X| $F869
       .byte $51 ; | X X   X| $F86A
       .byte $50 ; | X X    | $F86B
       .byte $50 ; | X X    | $F86C
       .byte $B3 ; |X XX  XX| $F86D
       .byte $B3 ; |X XX  XX| $F86E
       .byte $F3 ; |XXXX  XX| $F86F
       .byte $B3 ; |X XX  XX| $F870
       .byte $B3 ; |X XX  XX| $F871
       .byte $EB ; |XXX X XX| $F872
       .byte $4F ; | X  XXXX| $F873
       .byte $36 ; |  XX XX | $F874
       .byte $36 ; |  XX XX | $F875
       .byte $3E ; |  XXXXX | $F876
       .byte $36 ; |  XX XX | $F877
       .byte $36 ; |  XX XX | $F878
       .byte $5C ; | X XXX  | $F879
       .byte $C8 ; |XX  X   | $F87A
       .byte $DB ; |XX XX XX| $F87B
       .byte $DB ; |XX XX XX| $F87C
       .byte $D3 ; |XX X  XX| $F87D
       .byte $F3 ; |XXXX  XX| $F87E
       .byte $DB ; |XX XX XX| $F87F
       .byte $DB ; |XX XX XX| $F880
       .byte $E3 ; |XXX   XX| $F881
       .byte $27 ; |  X  XXX| $F882
       .byte $54 ; | X X X  | $F883
       .byte $54 ; | X X X  | $F884
       .byte $56 ; | X X XX | $F885
       .byte $54 ; | X X X  | $F886
       .byte $54 ; | X X X  | $F887
       .byte $57 ; | X X XXX| $F888
       .byte $00 ; |        | $F889
       .byte $00 ; |        | $F88A
       .byte $00 ; |        | $F88B
       .byte $00 ; |        | $F88C
       .byte $00 ; |        | $F88D
       .byte $00 ; |        | $F88E
       .byte $00 ; |        | $F88F
       .byte $00 ; |        | $F890
       .byte $FE ; |XXXXXXX | $F891
       .byte $30 ; |  XX    | $F892
       .byte $30 ; |  XX    | $F893
       .byte $30 ; |  XX    | $F894
       .byte $38 ; |  XXX   | $F895
       .byte $38 ; |  XXX   | $F896
       .byte $38 ; |  XXX   | $F897
       .byte $30 ; |  XX    | $F898
       .byte $30 ; |  XX    | $F899
       .byte $00 ; |        | $F89A
       .byte $00 ; |        | $F89B
       .byte $00 ; |        | $F89C
       .byte $00 ; |        | $F89D
       .byte $30 ; |  XX    | $F89E
       .byte $30 ; |  XX    | $F89F
       .byte $30 ; |  XX    | $F8A0
       .byte $38 ; |  XXX   | $F8A1
       .byte $38 ; |  XXX   | $F8A2
       .byte $38 ; |  XXX   | $F8A3
       .byte $30 ; |  XX    | $F8A4
       .byte $30 ; |  XX    | $F8A5
       .byte $10 ; |   X    | $F8A6
       .byte $92 ; |X  X  X | $F8A7
       .byte $54 ; | X X X  | $F8A8
       .byte $38 ; |  XXX   | $F8A9
       .byte $FE ; |XXXXXXX | $F8AA
       .byte $92 ; |X  X  X | $F8AB
       .byte $92 ; |X  X  X | $F8AC
       .byte $7C ; | XXXXX  | $F8AD
       .byte $38 ; |  XXX   | $F8AE
       .byte $0F ; |    XXXX| $F8AF
       .byte $C6 ; |XX   XX | $F8B0
       .byte $54 ; | X X X  | $F8B1
       .byte $54 ; | X X X  | $F8B2
       .byte $54 ; | X X X  | $F8B3
       .byte $54 ; | X X X  | $F8B4
       .byte $54 ; | X X X  | $F8B5
       .byte $54 ; | X X X  | $F8B6
       .byte $C4 ; |XX   X  | $F8B7
       .byte $C4 ; |XX   X  | $F8B8
       .byte $00 ; |        | $F8B9
       .byte $C4 ; |XX   X  | $F8BA
       .byte $C4 ; |XX   X  | $F8BB
       .byte $C4 ; |XX   X  | $F8BC
       .byte $C4 ; |XX   X  | $F8BD
       .byte $C4 ; |XX   X  | $F8BE
       .byte $C4 ; |XX   X  | $F8BF
       .byte $E6 ; |XXX  XX | $F8C0
       .byte $C4 ; |XX   X  | $F8C1
       .byte $00 ; |        | $F8C2
       .byte $00 ; |        | $F8C3
       .byte $00 ; |        | $F8C4
       .byte $00 ; |        | $F8C5
       .byte $38 ; |  XXX   | $F8C6
       .byte $38 ; |  XXX   | $F8C7
       .byte $38 ; |  XXX   | $F8C8
       .byte $38 ; |  XXX   | $F8C9
       .byte $38 ; |  XXX   | $F8CA
       .byte $00 ; |        | $F8CB
       .byte $00 ; |        | $F8CC
       .byte $00 ; |        | $F8CD
       .byte $00 ; |        | $F8CE
       .byte $38 ; |  XXX   | $F8CF
       .byte $38 ; |  XXX   | $F8D0
       .byte $20 ; |  X     | $F8D1
       .byte $38 ; |  XXX   | $F8D2
       .byte $38 ; |  XXX   | $F8D3
       .byte $00 ; |        | $F8D4
       .byte $00 ; |        | $F8D5
       .byte $00 ; |        | $F8D6
       .byte $00 ; |        | $F8D7
       .byte $38 ; |  XXX   | $F8D8
       .byte $20 ; |  X     | $F8D9
       .byte $20 ; |  X     | $F8DA
       .byte $20 ; |  X     | $F8DB
       .byte $38 ; |  XXX   | $F8DC
       .byte $FF ; |XXXXXXXX| $F8DD
       .byte $FF ; |XXXXXXXX| $F8DE
       .byte $C4 ; |XX   X  | $F8DF
       .byte $C4 ; |XX   X  | $F8E0
       .byte $C4 ; |XX   X  | $F8E1
       .byte $C4 ; |XX   X  | $F8E2
       .byte $C4 ; |XX   X  | $F8E3
       .byte $00 ; |        | $F8E4
       .byte $00 ; |        | $F8E5
       .byte $00 ; |        | $F8E6
       .byte $00 ; |        | $F8E7
       .byte $08 ; |    X   | $F8E8
       .byte $88 ; |X   X   | $F8E9
       .byte $41 ; | X     X| $F8EA
       .byte $10 ; |   X    | $F8EB
       .byte $10 ; |   X    | $F8EC
       .byte $C1 ; |XX     X| $F8ED
       .byte $10 ; |   X    | $F8EE
       .byte $10 ; |   X    | $F8EF
       .byte $41 ; | X     X| $F8F0
       .byte $88 ; |X   X   | $F8F1
       .byte $08 ; |    X   | $F8F2
       .byte $0F ; |    XXXX| $F8F3
       .byte $0F ; |    XXXX| $F8F4
       .byte $0F ; |    XXXX| $F8F5
       .byte $0F ; |    XXXX| $F8F6
       .byte $0F ; |    XXXX| $F8F7
       .byte $00 ; |        | $F8F8
       .byte $00 ; |        | $F8F9
       .byte $0F ; |    XXXX| $F8FA
       .byte $00 ; |        | $F8FB
       .byte $00 ; |        | $F8FC
       .byte $0F ; |    XXXX| $F8FD
       .byte $0F ; |    XXXX| $F8FE
       .byte $0F ; |    XXXX| $F8FF
LF900: STA    COLUP0  ;3
       STA    COLUP1  ;3
LF904: STY    $F0     ;3
LF906: LDY    $F0     ;3
       LDA    ($FC),Y ;5
       STA    $F1     ;3
       STA    WSYNC   ;3
       LDA    ($FA),Y ;5
       TAX            ;2
       LDA    ($F2),Y ;5
       NOP            ;2
       STA    GRP0    ;3
       LDA    ($F4),Y ;5
       STA    GRP1    ;3
       LDA    ($F6),Y ;5
       STA    GRP0    ;3
       LDA    ($F8),Y ;5
       LDY    $F1     ;3
       STA    GRP1    ;3
       STX    GRP0    ;3
       STY    GRP1    ;3
       STA    GRP0    ;3
       DEC    $F0     ;5
       BPL    LF906   ;2
LF92E: LDA    #$00    ;2
       STA    GRP0    ;3
       STA    GRP1    ;3
       STA    GRP0    ;3
       RTS            ;6

       .byte $A5 ; |X X  X X| $F937
       .byte $55 ; | X X X X| $F938
       .byte $55 ; | X X X X| $F939
       .byte $57 ; | X X XXX| $F93A
       .byte $15 ; |   X X X| $F93B
       .byte $15 ; |   X X X| $F93C
       .byte $12 ; |   X  X | $F93D
LF93E: .byte $26 ; |  X  XX | $F93E
       .byte $06 ; |     XX | $F93F
       .byte $13 ; |   X  XX| $F940
       .byte $1A ; |   XX X | $F941
       .byte $39 ; |  XXX  X| $F942
       .byte $0D ; |    XX X| $F943
       .byte $32 ; |  XX  X | $F944
       .byte $00 ; |        | $F945
       .byte $2C ; |  X XX  | $F946
       .byte $20 ; |  X     | $F947
LF948: .byte $08 ; |    X   | $F948
       .byte $0C ; |    XX  | $F949
       .byte $08 ; |    X   | $F94A
       .byte $0B ; |    X XX| $F94B
       .byte $0F ; |    XXXX| $F94C
       .byte $0C ; |    XX  | $F94D
       .byte $09 ; |    X  X| $F94E
       .byte $09 ; |    X  X| $F94F
       .byte $09 ; |    X  X| $F950
       .byte $0F ; |    XXXX| $F951
       .byte $0D ; |    XX X| $F952
       .byte $0B ; |    X XX| $F953
       .byte $0A ; |    X X | $F954
       .byte $08 ; |    X   | $F955
       .byte $08 ; |    X   | $F956
       .byte $08 ; |    X   | $F957
       .byte $09 ; |    X  X| $F958
       .byte $0D ; |    XX X| $F959
       .byte $0D ; |    XX X| $F95A
       .byte $08 ; |    X   | $F95B
LF95C: .byte $00 ; |        | $F95C
       .byte $13 ; |   X  XX| $F95D
       .byte $12 ; |   X  X | $F95E
       .byte $11 ; |   X   X| $F95F
LF960: .byte $11 ; |   X   X| $F960
       .byte $12 ; |   X  X | $F961
       .byte $13 ; |   X  XX| $F962
       .byte $00 ; |        | $F963
       .byte $17 ; |   X XXX| $F964
       .byte $15 ; |   X X X| $F965
       .byte $15 ; |   X X X| $F966
       .byte $17 ; |   X XXX| $F967
       .byte $75 ; | XXX X X| $F968
       .byte $55 ; | X X X X| $F969
       .byte $77 ; | XXX XXX| $F96A
       .byte $C9 ; |XX  X  X| $F96B
       .byte $09 ; |    X  X| $F96C
       .byte $09 ; |    X  X| $F96D
       .byte $89 ; |X   X  X| $F96E
       .byte $09 ; |    X  X| $F96F
       .byte $09 ; |    X  X| $F970
       .byte $DD ; |XX XXX X| $F971
       .byte $00 ; |        | $F972
       .byte $00 ; |        | $F973
       .byte $00 ; |        | $F974
       .byte $00 ; |        | $F975
       .byte $FF ; |XXXXXXXX| $F976
       .byte $81 ; |X      X| $F977
       .byte $BD ; |X XXXX X| $F978
       .byte $A5 ; |X X  X X| $F979
       .byte $B5 ; |X XX X X| $F97A
       .byte $A5 ; |X X  X X| $F97B
       .byte $BD ; |X XXXX X| $F97C
       .byte $81 ; |X      X| $F97D
       .byte $FF ; |XXXXXXXX| $F97E
       .byte $32 ; |  XX  X | $F97F
       .byte $32 ; |  XX  X | $F980
       .byte $32 ; |  XX  X | $F981
       .byte $32 ; |  XX  X | $F982
       .byte $32 ; |  XX  X | $F983
       .byte $32 ; |  XX  X | $F984
       .byte $32 ; |  XX  X | $F985
       .byte $32 ; |  XX  X | $F986
       .byte $32 ; |  XX  X | $F987
       .byte $E8 ; |XXX X   | $F988
       .byte $E8 ; |XXX X   | $F989
       .byte $E8 ; |XXX X   | $F98A
       .byte $E8 ; |XXX X   | $F98B
       .byte $E8 ; |XXX X   | $F98C
       .byte $E8 ; |XXX X   | $F98D
       .byte $E8 ; |XXX X   | $F98E
       .byte $E8 ; |XXX X   | $F98F
       .byte $E8 ; |XXX X   | $F990
       .byte $00 ; |        | $F991
       .byte $00 ; |        | $F992
       .byte $00 ; |        | $F993
       .byte $00 ; |        | $F994
       .byte $18 ; |   XX   | $F995
       .byte $3C ; |  XXXX  | $F996
       .byte $18 ; |   XX   | $F997
       .byte $10 ; |   X    | $F998
       .byte $06 ; |     XX | $F999
       .byte $0F ; |    XXXX| $F99A
       .byte $06 ; |     XX | $F99B
       .byte $10 ; |   X    | $F99C
       .byte $18 ; |   XX   | $F99D
       .byte $3C ; |  XXXX  | $F99E
       .byte $18 ; |   XX   | $F99F
       .byte $00 ; |        | $F9A0
       .byte $00 ; |        | $F9A1
       .byte $00 ; |        | $F9A2
       .byte $00 ; |        | $F9A3
       .byte $66 ; | XX  XX | $F9A4
       .byte $FF ; |XXXXXXXX| $F9A5
       .byte $66 ; | XX  XX | $F9A6
       .byte $10 ; |   X    | $F9A7
       .byte $18 ; |   XX   | $F9A8
       .byte $3C ; |  XXXX  | $F9A9
       .byte $18 ; |   XX   | $F9AA
       .byte $00 ; |        | $F9AB
       .byte $00 ; |        | $F9AC
       .byte $00 ; |        | $F9AD
       .byte $00 ; |        | $F9AE
       .byte $18 ; |   XX   | $F9AF
       .byte $3C ; |  XXXX  | $F9B0
       .byte $18 ; |   XX   | $F9B1
       .byte $10 ; |   X    | $F9B2
       .byte $60 ; | XX     | $F9B3
       .byte $F0 ; |XXXX    | $F9B4
       .byte $60 ; | XX     | $F9B5
       .byte $10 ; |   X    | $F9B6
       .byte $18 ; |   XX   | $F9B7
       .byte $3C ; |  XXXX  | $F9B8
       .byte $18 ; |   XX   | $F9B9
       .byte $00 ; |        | $F9BA
       .byte $00 ; |        | $F9BB
       .byte $00 ; |        | $F9BC
       .byte $00 ; |        | $F9BD
       .byte $18 ; |   XX   | $F9BE
       .byte $3C ; |  XXXX  | $F9BF
       .byte $18 ; |   XX   | $F9C0
       .byte $10 ; |   X    | $F9C1
       .byte $66 ; | XX  XX | $F9C2
       .byte $FF ; |XXXXXXXX| $F9C3
       .byte $66 ; | XX  XX | $F9C4
       .byte $10 ; |   X    | $F9C5
       .byte $10 ; |   X    | $F9C6
       .byte $10 ; |   X    | $F9C7
       .byte $10 ; |   X    | $F9C8
       .byte $0F ; |    XXXX| $F9C9
       .byte $0F ; |    XXXX| $F9CA
       .byte $44 ; | X   X  | $F9CB
       .byte $44 ; | X   X  | $F9CC
       .byte $44 ; | X   X  | $F9CD
       .byte $00 ; |        | $F9CE
       .byte $44 ; | X   X  | $F9CF
       .byte $44 ; | X   X  | $F9D0
       .byte $44 ; | X   X  | $F9D1
       .byte $00 ; |        | $F9D2
       .byte $44 ; | X   X  | $F9D3
       .byte $44 ; | X   X  | $F9D4
       .byte $44 ; | X   X  | $F9D5
       .byte $0F ; |    XXXX| $F9D6
       .byte $0F ; |    XXXX| $F9D7
       .byte $44 ; | X   X  | $F9D8
       .byte $44 ; | X   X  | $F9D9
       .byte $44 ; | X   X  | $F9DA
       .byte $00 ; |        | $F9DB
       .byte $44 ; | X   X  | $F9DC
       .byte $44 ; | X   X  | $F9DD
       .byte $44 ; | X   X  | $F9DE
       .byte $00 ; |        | $F9DF
       .byte $00 ; |        | $F9E0
       .byte $00 ; |        | $F9E1
       .byte $00 ; |        | $F9E2
       .byte $00 ; |        | $F9E3
       .byte $00 ; |        | $F9E4
       .byte $00 ; |        | $F9E5
       .byte $00 ; |        | $F9E6
       .byte $60 ; | XX     | $F9E7
       .byte $F0 ; |XXXX    | $F9E8
       .byte $60 ; | XX     | $F9E9
       .byte $10 ; |   X    | $F9EA
       .byte $18 ; |   XX   | $F9EB
       .byte $3C ; |  XXXX  | $F9EC
       .byte $18 ; |   XX   | $F9ED
       .byte $00 ; |        | $F9EE
       .byte $00 ; |        | $F9EF
       .byte $00 ; |        | $F9F0
       .byte $00 ; |        | $F9F1
       .byte $06 ; |     XX | $F9F2
       .byte $0F ; |    XXXX| $F9F3
       .byte $06 ; |     XX | $F9F4
       .byte $10 ; |   X    | $F9F5
       .byte $18 ; |   XX   | $F9F6
       .byte $3C ; |  XXXX  | $F9F7
       .byte $18 ; |   XX   | $F9F8
       .byte $44 ; | X   X  | $F9F9
       .byte $44 ; | X   X  | $F9FA
       .byte $44 ; | X   X  | $F9FB
       .byte $00 ; |        | $F9FC
       .byte $44 ; | X   X  | $F9FD
       .byte $44 ; | X   X  | $F9FE
       .byte $44 ; | X   X  | $F9FF
LFA00: .byte $00 ; |        | $FA00
       .byte $00 ; |        | $FA01
       .byte $01 ; |       X| $FA02
       .byte $01 ; |       X| $FA03
       .byte $01 ; |       X| $FA04
       .byte $01 ; |       X| $FA05
       .byte $01 ; |       X| $FA06
       .byte $01 ; |       X| $FA07
       .byte $00 ; |        | $FA08
       .byte $01 ; |       X| $FA09
       .byte $00 ; |        | $FA0A
       .byte $00 ; |        | $FA0B
       .byte $00 ; |        | $FA0C
       .byte $00 ; |        | $FA0D
       .byte $00 ; |        | $FA0E
       .byte $00 ; |        | $FA0F
       .byte $00 ; |        | $FA10
       .byte $00 ; |        | $FA11
       .byte $00 ; |        | $FA12
       .byte $00 ; |        | $FA13
       .byte $E6 ; |XXX  XX | $FA14
       .byte $AF ; |X X XXXX| $FA15
       .byte $89 ; |X   X  X| $FA16
       .byte $89 ; |X   X  X| $FA17
       .byte $89 ; |X   X  X| $FA18
       .byte $AF ; |X X XXXX| $FA19
       .byte $E6 ; |XXX  XX | $FA1A
       .byte $45 ; | X   X X| $FA1B
       .byte $45 ; | X   X X| $FA1C
       .byte $55 ; | X X X X| $FA1D
       .byte $55 ; | X X X X| $FA1E
       .byte $7D ; | XXXXX X| $FA1F
       .byte $6D ; | XX XX X| $FA20
       .byte $45 ; | X   X X| $FA21
       .byte $1D ; |   XXX X| $FA22
       .byte $1D ; |   XXX X| $FA23
       .byte $11 ; |   X   X| $FA24
       .byte $D1 ; |XX X   X| $FA25
       .byte $51 ; | X X   X| $FA26
       .byte $51 ; | X X   X| $FA27
       .byte $D1 ; |XX X   X| $FA28
LFA29: .byte $FF ; |XXXXXXXX| $FA29
       .byte $00 ; |        | $FA2A
       .byte $00 ; |        | $FA2B
       .byte $01 ; |       X| $FA2C
       .byte $01 ; |       X| $FA2D
       .byte $02 ; |      X | $FA2E
       .byte $02 ; |      X | $FA2F
       .byte $03 ; |      XX| $FA30
       .byte $03 ; |      XX| $FA31
       .byte $03 ; |      XX| $FA32
       .byte $04 ; |     X  | $FA33
       .byte $04 ; |     X  | $FA34
       .byte $05 ; |     X X| $FA35
       .byte $05 ; |     X X| $FA36
       .byte $06 ; |     XX | $FA37
       .byte $06 ; |     XX | $FA38
       .byte $06 ; |     XX | $FA39
       .byte $06 ; |     XX | $FA3A
LFA3B: .byte $99 ; |X  XX  X| $FA3B
       .byte $FA ; |XXXXX X | $FA3C
       .byte $64 ; | XX  X  | $FA3D
       .byte $F9 ; |XXXXX  X| $FA3E
       .byte $66 ; | XX  XX | $FA3F
       .byte $F8 ; |XXXXX   | $FA40
       .byte $6D ; | XX XX X| $FA41
       .byte $F8 ; |XXXXX   | $FA42
       .byte $74 ; | XXX X  | $FA43
       .byte $F8 ; |XXXXX   | $FA44
       .byte $7B ; | XXXX XX| $FA45
       .byte $F8 ; |XXXXX   | $FA46
       .byte $00 ; |        | $FA47
       .byte $FF ; |XXXXXXXX| $FA48
       .byte $00 ; |        | $FA49
       .byte $FF ; |XXXXXXXX| $FA4A
       .byte $80 ; |X       | $FA4B
       .byte $F6 ; |XXXX XX | $FA4C
       .byte $00 ; |        | $FA4D
       .byte $F7 ; |XXXX XXX| $FA4E
       .byte $80 ; |X       | $FA4F
       .byte $F7 ; |XXXX XXX| $FA50
       .byte $00 ; |        | $FA51
       .byte $FF ; |XXXXXXXX| $FA52
       .byte $89 ; |X   X  X| $FA53
       .byte $F8 ; |XXXXX   | $FA54
       .byte $03 ; |      XX| $FA55
       .byte $F1 ; |XXXX   X| $FA56
       .byte $0A ; |    X X | $FA57
       .byte $F1 ; |XXXX   X| $FA58
       .byte $11 ; |   X   X| $FA59
       .byte $F1 ; |XXXX   X| $FA5A
       .byte $37 ; |  XX XXX| $FA5B
       .byte $F9 ; |XXXXX  X| $FA5C
       .byte $82 ; |X     X | $FA5D
       .byte $F8 ; |XXXXX   | $FA5E
       .byte $89 ; |X   X  X| $FA5F
       .byte $F8 ; |XXXXX   | $FA60
       .byte $89 ; |X   X  X| $FA61
       .byte $F8 ; |XXXXX   | $FA62
       .byte $89 ; |X   X  X| $FA63
       .byte $F8 ; |XXXXX   | $FA64
       .byte $89 ; |X   X  X| $FA65
       .byte $F8 ; |XXXXX   | $FA66
       .byte $89 ; |X   X  X| $FA67
       .byte $F8 ; |XXXXX   | $FA68
       .byte $89 ; |X   X  X| $FA69
       .byte $F8 ; |XXXXX   | $FA6A
       .byte $14 ; |   X X  | $FA6B
       .byte $FA ; |XXXXX X | $FA6C
       .byte $1B ; |   XX XX| $FA6D
       .byte $FA ; |XXXXX X | $FA6E
       .byte $22 ; |  X   X | $FA6F
       .byte $FA ; |XXXXX X | $FA70
       .byte $6B ; | XX X XX| $FA71
       .byte $F9 ; |XXXXX  X| $FA72
       .byte $F7 ; |XXXX XXX| $FA73
       .byte $FB ; |XXXXX XX| $FA74
       .byte $89 ; |X   X  X| $FA75
       .byte $F8 ; |XXXXX   | $FA76
       .byte $F2 ; |XXXX  X | $FA77
       .byte $FD ; |XXXXXX X| $FA78
       .byte $F9 ; |XXXXX  X| $FA79
       .byte $FD ; |XXXXXX X| $FA7A
       .byte $F5 ; |XXXX X X| $FA7B
       .byte $FE ; |XXXXXXX | $FA7C
       .byte $4C ; | X  XX  | $FA7D
       .byte $F8 ; |XXXXX   | $FA7E
       .byte $45 ; | X   X X| $FA7F
       .byte $F8 ; |XXXXX   | $FA80
       .byte $89 ; |X   X  X| $FA81
       .byte $F8 ; |XXXXX   | $FA82
       .byte $A8 ; |X X X   | $FA83
       .byte $FE ; |XXXXXXX | $FA84
       .byte $AF ; |X X XXXX| $FA85
       .byte $FE ; |XXXXXXX | $FA86
       .byte $B6 ; |X XX XX | $FA87
       .byte $FE ; |XXXXXXX | $FA88
       .byte $BD ; |X XXXX X| $FA89
       .byte $FE ; |XXXXXXX | $FA8A
       .byte $C4 ; |XX   X  | $FA8B
       .byte $FE ; |XXXXXXX | $FA8C
       .byte $CB ; |XX  X XX| $FA8D
       .byte $FE ; |XXXXXXX | $FA8E
       .byte $D2 ; |XX X  X | $FA8F
       .byte $FE ; |XXXXXXX | $FA90
       .byte $D9 ; |XX XX  X| $FA91
       .byte $FE ; |XXXXXXX | $FA92
       .byte $E0 ; |XXX     | $FA93
       .byte $FE ; |XXXXXXX | $FA94
       .byte $E7 ; |XXX  XXX| $FA95
       .byte $FE ; |XXXXXXX | $FA96
       .byte $EE ; |XXX XXX | $FA97
       .byte $FE ; |XXXXXXX | $FA98
       .byte $79 ; | XXXX  X| $FA99
       .byte $85 ; |X    X X| $FA9A
       .byte $B5 ; |X XX X X| $FA9B
       .byte $A5 ; |X X  X X| $FA9C
       .byte $B5 ; |X XX X X| $FA9D
       .byte $85 ; |X    X X| $FA9E
       .byte $79 ; | XXXX  X| $FA9F
       .byte $00 ; |        | $FAA0
       .byte $00 ; |        | $FAA1
       .byte $00 ; |        | $FAA2
       .byte $00 ; |        | $FAA3
       .byte $38 ; |  XXX   | $FAA4
       .byte $7C ; | XXXXX  | $FAA5
       .byte $38 ; |  XXX   | $FAA6
       .byte $10 ; |   X    | $FAA7
       .byte $10 ; |   X    | $FAA8
       .byte $38 ; |  XXX   | $FAA9
       .byte $7C ; | XXXXX  | $FAAA
LFAAB: .byte $38 ; |  XXX   | $FAAB
       .byte $00 ; |        | $FAAC
       .byte $00 ; |        | $FAAD
       .byte $00 ; |        | $FAAE
       .byte $00 ; |        | $FAAF
       .byte $30 ; |  XX    | $FAB0
       .byte $70 ; | XXX    | $FAB1
       .byte $F0 ; |XXXX    | $FAB2
       .byte $F0 ; |XXXX    | $FAB3
       .byte $1E ; |   XXXX | $FAB4
       .byte $1E ; |   XXXX | $FAB5
       .byte $1C ; |   XXX  | $FAB6
       .byte $18 ; |   XX   | $FAB7
       .byte $00 ; |        | $FAB8
       .byte $00 ; |        | $FAB9
       .byte $00 ; |        | $FABA
       .byte $00 ; |        | $FABB
       .byte $C6 ; |XX   XX | $FABC
       .byte $FE ; |XXXXXXX | $FABD
       .byte $FE ; |XXXXXXX | $FABE
       .byte $C6 ; |XX   XX | $FABF
       .byte $10 ; |   X    | $FAC0
       .byte $10 ; |   X    | $FAC1
       .byte $00 ; |        | $FAC2
       .byte $00 ; |        | $FAC3
       .byte $00 ; |        | $FAC4
       .byte $00 ; |        | $FAC5
       .byte $18 ; |   XX   | $FAC6
       .byte $1C ; |   XXX  | $FAC7
       .byte $1E ; |   XXXX | $FAC8
       .byte $1E ; |   XXXX | $FAC9
       .byte $F0 ; |XXXX    | $FACA
       .byte $F0 ; |XXXX    | $FACB
       .byte $70 ; | XXX    | $FACC
       .byte $30 ; |  XX    | $FACD
       .byte $0F ; |    XXXX| $FACE
       .byte $0F ; |    XXXX| $FACF
       .byte $D6 ; |XX X XX | $FAD0
       .byte $D6 ; |XX X XX | $FAD1
       .byte $D6 ; |XX X XX | $FAD2
       .byte $D6 ; |XX X XX | $FAD3
       .byte $D6 ; |XX X XX | $FAD4
       .byte $D6 ; |XX X XX | $FAD5
       .byte $D6 ; |XX X XX | $FAD6
       .byte $D6 ; |XX X XX | $FAD7
       .byte $0F ; |    XXXX| $FAD8
       .byte $0F ; |    XXXX| $FAD9
       .byte $E8 ; |XXX X   | $FADA
       .byte $E8 ; |XXX X   | $FADB
       .byte $E8 ; |XXX X   | $FADC
       .byte $E8 ; |XXX X   | $FADD
       .byte $E8 ; |XXX X   | $FADE
       .byte $E8 ; |XXX X   | $FADF
       .byte $E8 ; |XXX X   | $FAE0
       .byte $E8 ; |XXX X   | $FAE1
       .byte $0F ; |    XXXX| $FAE2
       .byte $0F ; |    XXXX| $FAE3
       .byte $D6 ; |XX X XX | $FAE4
       .byte $D6 ; |XX X XX | $FAE5
       .byte $D6 ; |XX X XX | $FAE6
       .byte $D6 ; |XX X XX | $FAE7
       .byte $00 ; |        | $FAE8
       .byte $00 ; |        | $FAE9
       .byte $0F ; |    XXXX| $FAEA
       .byte $0F ; |    XXXX| $FAEB
       .byte $56 ; | X X XX | $FAEC
       .byte $56 ; | X X XX | $FAED
       .byte $56 ; | X X XX | $FAEE
       .byte $56 ; | X X XX | $FAEF
       .byte $56 ; | X X XX | $FAF0
       .byte $56 ; | X X XX | $FAF1
       .byte $56 ; | X X XX | $FAF2
       .byte $56 ; | X X XX | $FAF3
LFAF4: LDX    #$0B    ;2
LFAF6: LDA    LFA3B,Y ;4
       STA    $F2,X   ;4
       DEY            ;2
       DEX            ;2
       BPL    LFAF6   ;2
       RTS            ;6

LFB00: .byte $D8 ; |XX XX   | $FB00
       .byte $D8 ; |XX XX   | $FB01
       .byte $D8 ; |XX XX   | $FB02
       .byte $D8 ; |XX XX   | $FB03
       .byte $DE ; |XX XXXX | $FB04
       .byte $EA ; |XXX X X | $FB05
       .byte $F2 ; |XXXX  X | $FB06
       .byte $FA ; |XXXXX X | $FB07
       .byte $CB ; |XX  X XX| $FB08
       .byte $D4 ; |XX X X  | $FB09
       .byte $DD ; |XX XXX X| $FB0A
       .byte $D4 ; |XX X X  | $FB0B
       .byte $AB ; |X X X XX| $FB0C
       .byte $BD ; |X XXXX X| $FB0D
       .byte $C8 ; |XX  X   | $FB0E
       .byte $DA ; |XX XX X | $FB0F
       .byte $D3 ; |XX X  XX| $FB10
       .byte $D3 ; |XX X  XX| $FB11
       .byte $D3 ; |XX X  XX| $FB12
       .byte $D3 ; |XX X  XX| $FB13
       .byte $AB ; |X X X XX| $FB14
       .byte $B5 ; |X XX X X| $FB15
       .byte $BE ; |X XXXXX | $FB16
       .byte $B5 ; |X XX X X| $FB17
       .byte $A0 ; |X X     | $FB18
       .byte $AB ; |X X X XX| $FB19
       .byte $BA ; |X XXX X | $FB1A
       .byte $C9 ; |XX  X  X| $FB1B
       .byte $EE ; |XXX XXX | $FB1C
       .byte $BA ; |X XXX X | $FB1D
       .byte $A0 ; |X X     | $FB1E
       .byte $F9 ; |XXXXX  X| $FB1F
       .byte $C1 ; |XX     X| $FB20
       .byte $C1 ; |XX     X| $FB21
       .byte $C1 ; |XX     X| $FB22
       .byte $C1 ; |XX     X| $FB23
       .byte $9E ; |X  XXXX | $FB24
       .byte $B2 ; |X XX  X | $FB25
       .byte $C7 ; |XX   XXX| $FB26
       .byte $D3 ; |XX X  XX| $FB27
       .byte $A4 ; |X X  X  | $FB28
       .byte $B2 ; |X XX  X | $FB29
       .byte $BB ; |X XXX XX| $FB2A
       .byte $C4 ; |XX   X  | $FB2B
       .byte $EC ; |XXX XX  | $FB2C
       .byte $F7 ; |XXXX XXX| $FB2D
       .byte $EC ; |XXX XX  | $FB2E
       .byte $F7 ; |XXXX XXX| $FB2F
       .byte $AC ; |X X XX  | $FB30
       .byte $B8 ; |X XXX   | $FB31
       .byte $C2 ; |XX    X | $FB32
       .byte $CE ; |XX  XXX | $FB33
       .byte $AF ; |X X XXXX| $FB34
       .byte $AF ; |X X XXXX| $FB35
       .byte $AF ; |X X XXXX| $FB36
       .byte $AF ; |X X XXXX| $FB37
       .byte $A6 ; |X X  XX | $FB38
       .byte $A6 ; |X X  XX | $FB39
       .byte $A6 ; |X X  XX | $FB3A
       .byte $A6 ; |X X  XX | $FB3B
       .byte $A6 ; |X X  XX | $FB3C
       .byte $A6 ; |X X  XX | $FB3D
       .byte $A6 ; |X X  XX | $FB3E
       .byte $A6 ; |X X  XX | $FB3F
       .byte $7F ; | XXXXXXX| $FB40
       .byte $7F ; | XXXXXXX| $FB41
       .byte $7F ; | XXXXXXX| $FB42
       .byte $7F ; | XXXXXXX| $FB43
       .byte $E4 ; |XXX  X  | $FB44
       .byte $E4 ; |XXX  X  | $FB45
       .byte $E4 ; |XXX  X  | $FB46
       .byte $E4 ; |XXX  X  | $FB47
       .byte $F2 ; |XXXX  X | $FB48
       .byte $F2 ; |XXXX  X | $FB49
       .byte $F2 ; |XXXX  X | $FB4A
       .byte $F2 ; |XXXX  X | $FB4B
       .byte $F3 ; |XXXX  XX| $FB4C
       .byte $F3 ; |XXXX  XX| $FB4D
       .byte $F3 ; |XXXX  XX| $FB4E
       .byte $F3 ; |XXXX  XX| $FB4F
LFB50: .byte $DF ; |XX XXXXX| $FB50
       .byte $DF ; |XX XXXXX| $FB51
       .byte $DF ; |XX XXXXX| $FB52
       .byte $DF ; |XX XXXXX| $FB53
       .byte $FE ; |XXXXXXX | $FB54
       .byte $FE ; |XXXXXXX | $FB55
       .byte $E2 ; |XXX   X | $FB56
       .byte $E2 ; |XXX   X | $FB57
       .byte $E4 ; |XXX  X  | $FB58
       .byte $E4 ; |XXX  X  | $FB59
       .byte $E4 ; |XXX  X  | $FB5A
       .byte $E4 ; |XXX  X  | $FB5B
       .byte $E1 ; |XXX    X| $FB5C
       .byte $E1 ; |XXX    X| $FB5D
       .byte $E1 ; |XXX    X| $FB5E
       .byte $E1 ; |XXX    X| $FB5F
       .byte $A6 ; |X X  XX | $FB60
       .byte $BB ; |X XXX XX| $FB61
       .byte $E6 ; |XXX  XX | $FB62
       .byte $F0 ; |XXXX    | $FB63
       .byte $C7 ; |XX   XXX| $FB64
       .byte $CF ; |XX  XXXX| $FB65
       .byte $D6 ; |XX X XX | $FB66
       .byte $CF ; |XX  XXXX| $FB67
       .byte $D6 ; |XX X XX | $FB68
       .byte $D2 ; |XX X  X | $FB69
       .byte $D6 ; |XX X XX | $FB6A
       .byte $E3 ; |XXX   XX| $FB6B
       .byte $00 ; |        | $FB6C
       .byte $E3 ; |XXX   XX| $FB6D
       .byte $E3 ; |XXX   XX| $FB6E
       .byte $00 ; |        | $FB6F
       .byte $CE ; |XX  XXX | $FB70
       .byte $CE ; |XX  XXX | $FB71
       .byte $CE ; |XX  XXX | $FB72
       .byte $CE ; |XX  XXX | $FB73
       .byte $DD ; |XX XXX X| $FB74
       .byte $DD ; |XX XXX X| $FB75
       .byte $DD ; |XX XXX X| $FB76
       .byte $DD ; |XX XXX X| $FB77
       .byte $A9 ; |X X X  X| $FB78
       .byte $CF ; |XX  XXXX| $FB79
       .byte $D7 ; |XX X XXX| $FB7A
       .byte $CF ; |XX  XXXX| $FB7B
       .byte $CF ; |XX  XXXX| $FB7C
       .byte $B2 ; |X XX  X | $FB7D
       .byte $CF ; |XX  XXXX| $FB7E
       .byte $B2 ; |X XX  X | $FB7F
       .byte $D8 ; |XX XX   | $FB80
       .byte $E2 ; |XXX   X | $FB81
       .byte $EA ; |XXX X X | $FB82
       .byte $F4 ; |XXXX X  | $FB83
       .byte $C2 ; |XX    X | $FB84
       .byte $C2 ; |XX    X | $FB85
       .byte $C2 ; |XX    X | $FB86
       .byte $C2 ; |XX    X | $FB87
       .byte $B9 ; |X XXX  X| $FB88
       .byte $B9 ; |X XXX  X| $FB89
       .byte $B9 ; |X XXX  X| $FB8A
       .byte $B9 ; |X XXX  X| $FB8B
       .byte $B9 ; |X XXX  X| $FB8C
       .byte $B9 ; |X XXX  X| $FB8D
       .byte $B9 ; |X XXX  X| $FB8E
       .byte $B9 ; |X XXX  X| $FB8F
       .byte $88 ; |X   X   | $FB90
       .byte $88 ; |X   X   | $FB91
       .byte $88 ; |X   X   | $FB92
       .byte $91 ; |X  X   X| $FB93
       .byte $D0 ; |XX X    | $FB94
       .byte $D0 ; |XX X    | $FB95
       .byte $D0 ; |XX X    | $FB96
       .byte $D0 ; |XX X    | $FB97
       .byte $CF ; |XX  XXXX| $FB98
       .byte $CF ; |XX  XXXX| $FB99
       .byte $CF ; |XX  XXXX| $FB9A
       .byte $CF ; |XX  XXXX| $FB9B
       .byte $00 ; |        | $FB9C
       .byte $00 ; |        | $FB9D
       .byte $00 ; |        | $FB9E
       .byte $00 ; |        | $FB9F
       .byte $00 ; |        | $FBA0
       .byte $00 ; |        | $FBA1
       .byte $00 ; |        | $FBA2
       .byte $00 ; |        | $FBA3
       .byte $7C ; | XXXXX  | $FBA4
       .byte $7C ; | XXXXX  | $FBA5
       .byte $7C ; | XXXXX  | $FBA6
       .byte $7C ; | XXXXX  | $FBA7
       .byte $7C ; | XXXXX  | $FBA8
       .byte $7C ; | XXXXX  | $FBA9
       .byte $7C ; | XXXXX  | $FBAA
       .byte $42 ; | X    X | $FBAB
       .byte $42 ; | X    X | $FBAC
       .byte $42 ; | X    X | $FBAD
       .byte $42 ; | X    X | $FBAE
       .byte $42 ; | X    X | $FBAF
       .byte $42 ; | X    X | $FBB0
       .byte $42 ; | X    X | $FBB1
       .byte $00 ; |        | $FBB2
       .byte $00 ; |        | $FBB3
       .byte $00 ; |        | $FBB4
       .byte $00 ; |        | $FBB5
       .byte $7C ; | XXXXX  | $FBB6
       .byte $60 ; | XX     | $FBB7
       .byte $60 ; | XX     | $FBB8
       .byte $60 ; | XX     | $FBB9
       .byte $60 ; | XX     | $FBBA
       .byte $60 ; | XX     | $FBBB
       .byte $7C ; | XXXXX  | $FBBC
       .byte $00 ; |        | $FBBD
       .byte $00 ; |        | $FBBE
       .byte $00 ; |        | $FBBF
       .byte $00 ; |        | $FBC0
       .byte $7C ; | XXXXX  | $FBC1
       .byte $7C ; | XXXXX  | $FBC2
       .byte $60 ; | XX     | $FBC3
       .byte $60 ; | XX     | $FBC4
       .byte $60 ; | XX     | $FBC5
       .byte $7C ; | XXXXX  | $FBC6
       .byte $7C ; | XXXXX  | $FBC7
       .byte $64 ; | XX  X  | $FBC8
       .byte $64 ; | XX  X  | $FBC9
       .byte $64 ; | XX  X  | $FBCA
       .byte $64 ; | XX  X  | $FBCB
       .byte $64 ; | XX  X  | $FBCC
       .byte $64 ; | XX  X  | $FBCD
       .byte $64 ; | XX  X  | $FBCE
       .byte $00 ; |        | $FBCF
LFBD0: .byte $00 ; |        | $FBD0
       .byte $00 ; |        | $FBD1
       .byte $00 ; |        | $FBD2
       .byte $7C ; | XXXXX  | $FBD3
       .byte $7C ; | XXXXX  | $FBD4
       .byte $7C ; | XXXXX  | $FBD5
       .byte $60 ; | XX     | $FBD6
       .byte $7C ; | XXXXX  | $FBD7
       .byte $7C ; | XXXXX  | $FBD8
       .byte $7C ; | XXXXX  | $FBD9
       .byte $0C ; |    XX  | $FBDA
       .byte $56 ; | X X XX | $FBDB
       .byte $56 ; | X X XX | $FBDC
       .byte $56 ; | X X XX | $FBDD
       .byte $56 ; | X X XX | $FBDE
       .byte $56 ; | X X XX | $FBDF
       .byte $0C ; |    XX  | $FBE0
       .byte $00 ; |        | $FBE1
       .byte $00 ; |        | $FBE2
       .byte $00 ; |        | $FBE3
       .byte $00 ; |        | $FBE4
       .byte $10 ; |   X    | $FBE5
       .byte $10 ; |   X    | $FBE6
       .byte $38 ; |  XXX   | $FBE7
       .byte $FE ; |XXXXXXX | $FBE8
       .byte $38 ; |  XXX   | $FBE9
       .byte $10 ; |   X    | $FBEA
       .byte $10 ; |   X    | $FBEB
       .byte $00 ; |        | $FBEC
       .byte $00 ; |        | $FBED
       .byte $00 ; |        | $FBEE
       .byte $00 ; |        | $FBEF
       .byte $10 ; |   X    | $FBF0
       .byte $54 ; | X X X  | $FBF1
       .byte $38 ; |  XXX   | $FBF2
       .byte $7C ; | XXXXX  | $FBF3
       .byte $38 ; |  XXX   | $FBF4
       .byte $54 ; | X X X  | $FBF5
       .byte $10 ; |   X    | $FBF6
       .byte $D8 ; |XX XX   | $FBF7
       .byte $14 ; |   X X  | $FBF8
       .byte $14 ; |   X X  | $FBF9
       .byte $94 ; |X  X X  | $FBFA
       .byte $14 ; |   X X  | $FBFB
       .byte $14 ; |   X X  | $FBFC
       .byte $D8 ; |XX XX   | $FBFD
       .byte $00 ; |        | $FBFE
       .byte $00 ; |        | $FBFF
       .byte $30 ; |  XX    | $FC00
       .byte $B8 ; |X XXX   | $FC01
       .byte $28 ; |  X X   | $FC02
       .byte $B0 ; |X XX    | $FC03
       .byte $20 ; |  X     | $FC04
       .byte $A8 ; |X X X   | $FC05
       .byte $18 ; |   XX   | $FC06
       .byte $A0 ; |X X     | $FC07
       .byte $10 ; |   X    | $FC08
       .byte $98 ; |X  XX   | $FC09
       .byte $08 ; |    X   | $FC0A
       .byte $90 ; |X  X    | $FC0B
       .byte $00 ; |        | $FC0C
       .byte $88 ; |X   X   | $FC0D
       .byte $78 ; | XXXX   | $FC0E
       .byte $80 ; |X       | $FC0F
       .byte $70 ; | XXX    | $FC10
       .byte $F8 ; |XXXXX   | $FC11
       .byte $68 ; | XX X   | $FC12
       .byte $F0 ; |XXXX    | $FC13
       .byte $60 ; | XX     | $FC14
       .byte $E8 ; |XXX X   | $FC15
       .byte $58 ; | X XX   | $FC16
       .byte $E0 ; |XXX     | $FC17
       .byte $50 ; | X X    | $FC18
       .byte $D8 ; |XX XX   | $FC19
       .byte $48 ; | X  X   | $FC1A
       .byte $D0 ; |XX X    | $FC1B
       .byte $40 ; | X      | $FC1C
       .byte $C8 ; |XX  X   | $FC1D
       .byte $32 ; |  XX  X | $FC1E
       .byte $BA ; |X XXX X | $FC1F
       .byte $2A ; |  X X X | $FC20
       .byte $B2 ; |X XX  X | $FC21
       .byte $22 ; |  X   X | $FC22
       .byte $AA ; |X X X X | $FC23
       .byte $1A ; |   XX X | $FC24
       .byte $A2 ; |X X   X | $FC25
       .byte $12 ; |   X  X | $FC26
       .byte $9A ; |X  XX X | $FC27
       .byte $0A ; |    X X | $FC28
       .byte $92 ; |X  X  X | $FC29
       .byte $02 ; |      X | $FC2A
       .byte $8A ; |X   X X | $FC2B
       .byte $7A ; | XXXX X | $FC2C
       .byte $82 ; |X     X | $FC2D
       .byte $72 ; | XXX  X | $FC2E
       .byte $FA ; |XXXXX X | $FC2F
       .byte $6A ; | XX X X | $FC30
       .byte $F2 ; |XXXX  X | $FC31
       .byte $62 ; | XX   X | $FC32
       .byte $EA ; |XXX X X | $FC33
       .byte $5A ; | X XX X | $FC34
       .byte $E2 ; |XXX   X | $FC35
       .byte $52 ; | X X  X | $FC36
       .byte $DA ; |XX XX X | $FC37
       .byte $4A ; | X  X X | $FC38
       .byte $D2 ; |XX X  X | $FC39
       .byte $42 ; | X    X | $FC3A
       .byte $CA ; |XX  X X | $FC3B
       .byte $34 ; |  XX X  | $FC3C
       .byte $BC ; |X XXXX  | $FC3D
       .byte $2C ; |  X XX  | $FC3E
       .byte $B4 ; |X XX X  | $FC3F
       .byte $24 ; |  X  X  | $FC40
       .byte $AC ; |X X XX  | $FC41
       .byte $1C ; |   XXX  | $FC42
       .byte $A4 ; |X X  X  | $FC43
       .byte $14 ; |   X X  | $FC44
       .byte $9C ; |X  XXX  | $FC45
       .byte $0C ; |    XX  | $FC46
       .byte $94 ; |X  X X  | $FC47
       .byte $04 ; |     X  | $FC48
       .byte $8C ; |X   XX  | $FC49
       .byte $7C ; | XXXXX  | $FC4A
       .byte $84 ; |X    X  | $FC4B
       .byte $74 ; | XXX X  | $FC4C
       .byte $FC ; |XXXXXX  | $FC4D
       .byte $6C ; | XX XX  | $FC4E
       .byte $F4 ; |XXXX X  | $FC4F
       .byte $29 ; |  X X  X| $FC50
       .byte $B1 ; |X XX   X| $FC51
       .byte $21 ; |  X    X| $FC52
       .byte $A9 ; |X X X  X| $FC53
       .byte $19 ; |   XX  X| $FC54
       .byte $A1 ; |X X    X| $FC55
       .byte $11 ; |   X   X| $FC56
       .byte $99 ; |X  XX  X| $FC57
       .byte $09 ; |    X  X| $FC58
       .byte $91 ; |X  X   X| $FC59
       .byte $01 ; |       X| $FC5A
       .byte $89 ; |X   X  X| $FC5B
       .byte $79 ; | XXXX  X| $FC5C
       .byte $81 ; |X      X| $FC5D
       .byte $71 ; | XXX   X| $FC5E
       .byte $F9 ; |XXXXX  X| $FC5F
       .byte $69 ; | XX X  X| $FC60
       .byte $F1 ; |XXXX   X| $FC61
       .byte $61 ; | XX    X| $FC62
       .byte $E9 ; |XXX X  X| $FC63
       .byte $59 ; | X XX  X| $FC64
       .byte $E1 ; |XXX    X| $FC65
       .byte $51 ; | X X   X| $FC66
       .byte $D9 ; |XX XX  X| $FC67
       .byte $49 ; | X  X  X| $FC68
       .byte $D1 ; |XX X   X| $FC69
       .byte $41 ; | X     X| $FC6A
       .byte $C9 ; |XX  X  X| $FC6B
       .byte $33 ; |  XX  XX| $FC6C
       .byte $BB ; |X XXX XX| $FC6D
       .byte $2B ; |  X X XX| $FC6E
       .byte $B3 ; |X XX  XX| $FC6F
       .byte $23 ; |  X   XX| $FC70
       .byte $AB ; |X X X XX| $FC71
       .byte $1B ; |   XX XX| $FC72
       .byte $A3 ; |X X   XX| $FC73
       .byte $13 ; |   X  XX| $FC74
       .byte $9B ; |X  XX XX| $FC75
       .byte $0B ; |    X XX| $FC76
       .byte $93 ; |X  X  XX| $FC77
       .byte $03 ; |      XX| $FC78
       .byte $8B ; |X   X XX| $FC79
       .byte $7B ; | XXXX XX| $FC7A
       .byte $83 ; |X     XX| $FC7B
       .byte $73 ; | XXX  XX| $FC7C
       .byte $FB ; |XXXXX XX| $FC7D
       .byte $6B ; | XX X XX| $FC7E
       .byte $F3 ; |XXXX  XX| $FC7F
       .byte $63 ; | XX   XX| $FC80
       .byte $EB ; |XXX X XX| $FC81
       .byte $5B ; | X XX XX| $FC82
       .byte $E3 ; |XXX   XX| $FC83
       .byte $53 ; | X X  XX| $FC84
       .byte $DB ; |XX XX XX| $FC85
       .byte $4B ; | X  X XX| $FC86
       .byte $D3 ; |XX X  XX| $FC87
       .byte $43 ; | X    XX| $FC88
       .byte $CB ; |XX  X XX| $FC89
       .byte $35 ; |  XX X X| $FC8A
       .byte $BD ; |X XXXX X| $FC8B
       .byte $2D ; |  X XX X| $FC8C
       .byte $B5 ; |X XX X X| $FC8D
       .byte $25 ; |  X  X X| $FC8E
       .byte $AD ; |X X XX X| $FC8F
       .byte $1D ; |   XXX X| $FC90
       .byte $A5 ; |X X  X X| $FC91
       .byte $15 ; |   X X X| $FC92
       .byte $9D ; |X  XXX X| $FC93
       .byte $0D ; |    XX X| $FC94
       .byte $95 ; |X  X X X| $FC95
       .byte $05 ; |     X X| $FC96
       .byte $8D ; |X   XX X| $FC97
       .byte $7D ; | XXXXX X| $FC98
       .byte $85 ; |X    X X| $FC99
       .byte $75 ; | XXX X X| $FC9A
       .byte $FD ; |XXXXXX X| $FC9B
       .byte $6D ; | XX XX X| $FC9C
       .byte $F5 ; |XXXX X X| $FC9D
       .byte $65 ; | XX  X X| $FC9E
       .byte $ED ; |XXX XX X| $FC9F
       .byte $00 ; |        | $FCA0
       .byte $00 ; |        | $FCA1
       .byte $00 ; |        | $FCA2
       .byte $00 ; |        | $FCA3
       .byte $30 ; |  XX    | $FCA4
       .byte $78 ; | XXXX   | $FCA5
       .byte $30 ; |  XX    | $FCA6
       .byte $7E ; | XXXXXX | $FCA7
       .byte $30 ; |  XX    | $FCA8
       .byte $78 ; | XXXX   | $FCA9
       .byte $30 ; |  XX    | $FCAA
       .byte $00 ; |        | $FCAB
       .byte $00 ; |        | $FCAC
       .byte $00 ; |        | $FCAD
       .byte $00 ; |        | $FCAE
       .byte $30 ; |  XX    | $FCAF
       .byte $78 ; | XXXX   | $FCB0
       .byte $7E ; | XXXXXX | $FCB1
       .byte $78 ; | XXXX   | $FCB2
       .byte $30 ; |  XX    | $FCB3
       .byte $10 ; |   X    | $FCB4
       .byte $00 ; |        | $FCB5
       .byte $00 ; |        | $FCB6
       .byte $00 ; |        | $FCB7
       .byte $00 ; |        | $FCB8
       .byte $30 ; |  XX    | $FCB9
       .byte $7E ; | XXXXXX | $FCBA
       .byte $30 ; |  XX    | $FCBB
       .byte $10 ; |   X    | $FCBC
       .byte $10 ; |   X    | $FCBD
       .byte $0F ; |    XXXX| $FCBE
       .byte $0F ; |    XXXX| $FCBF
       .byte $E6 ; |XXX  XX | $FCC0
       .byte $56 ; | X X XX | $FCC1
       .byte $56 ; | X X XX | $FCC2
       .byte $E6 ; |XXX  XX | $FCC3
       .byte $C4 ; |XX   X  | $FCC4
       .byte $C4 ; |XX   X  | $FCC5
       .byte $E6 ; |XXX  XX | $FCC6
       .byte $0F ; |    XXXX| $FCC7
       .byte $0F ; |    XXXX| $FCC8
       .byte $56 ; | X X XX | $FCC9
       .byte $56 ; | X X XX | $FCCA
       .byte $C4 ; |XX   X  | $FCCB
       .byte $56 ; | X X XX | $FCCC
       .byte $56 ; | X X XX | $FCCD
       .byte $00 ; |        | $FCCE
       .byte $0F ; |    XXXX| $FCCF
       .byte $0F ; |    XXXX| $FCD0
       .byte $56 ; | X X XX | $FCD1
       .byte $E6 ; |XXX  XX | $FCD2
       .byte $56 ; | X X XX | $FCD3
       .byte $00 ; |        | $FCD4
       .byte $00 ; |        | $FCD5
       .byte $00 ; |        | $FCD6
       .byte $00 ; |        | $FCD7
       .byte $00 ; |        | $FCD8
       .byte $00 ; |        | $FCD9
       .byte $7E ; | XXXXXX | $FCDA
       .byte $CF ; |XX  XXXX| $FCDB
       .byte $4E ; | X  XXX | $FCDC
       .byte $3C ; |  XXXX  | $FCDD
       .byte $C4 ; |XX   X  | $FCDE
       .byte $56 ; | X X XX | $FCDF
       .byte $56 ; | X X XX | $FCE0
       .byte $C4 ; |XX   X  | $FCE1
       .byte $00 ; |        | $FCE2
       .byte $00 ; |        | $FCE3
       .byte $00 ; |        | $FCE4
       .byte $00 ; |        | $FCE5
       .byte $7E ; | XXXXXX | $FCE6
       .byte $E7 ; |XXX  XXX| $FCE7
       .byte $66 ; | XX  XX | $FCE8
       .byte $3C ; |  XXXX  | $FCE9
       .byte $00 ; |        | $FCEA
       .byte $00 ; |        | $FCEB
       .byte $00 ; |        | $FCEC
       .byte $00 ; |        | $FCED
       .byte $7E ; | XXXXXX | $FCEE
       .byte $F3 ; |XXXX  XX| $FCEF
       .byte $72 ; | XXX  X | $FCF0
       .byte $3C ; |  XXXX  | $FCF1
       .byte $00 ; |        | $FCF2
       .byte $00 ; |        | $FCF3
       .byte $00 ; |        | $FCF4
       .byte $00 ; |        | $FCF5
       .byte $7E ; | XXXXXX | $FCF6
       .byte $DB ; |XX XX XX| $FCF7
       .byte $5A ; | X XX X | $FCF8
       .byte $3C ; |  XXXX  | $FCF9
       .byte $C4 ; |XX   X  | $FCFA
       .byte $E6 ; |XXX  XX | $FCFB
       .byte $E6 ; |XXX  XX | $FCFC
       .byte $C4 ; |XX   X  | $FCFD
       .byte $00 ; |        | $FCFE
       .byte $00 ; |        | $FCFF
       .byte $00 ; |        | $FD00
       .byte $00 ; |        | $FD01
       .byte $00 ; |        | $FD02
       .byte $00 ; |        | $FD03
       .byte $00 ; |        | $FD04
       .byte $00 ; |        | $FD05
       .byte $00 ; |        | $FD06
       .byte $00 ; |        | $FD07
       .byte $00 ; |        | $FD08
       .byte $00 ; |        | $FD09
       .byte $00 ; |        | $FD0A
       .byte $00 ; |        | $FD0B
       .byte $00 ; |        | $FD0C
       .byte $00 ; |        | $FD0D
       .byte $00 ; |        | $FD0E
       .byte $00 ; |        | $FD0F
       .byte $00 ; |        | $FD10
       .byte $00 ; |        | $FD11
       .byte $00 ; |        | $FD12
       .byte $00 ; |        | $FD13
       .byte $00 ; |        | $FD14
       .byte $00 ; |        | $FD15
       .byte $00 ; |        | $FD16
       .byte $00 ; |        | $FD17
       .byte $00 ; |        | $FD18
       .byte $00 ; |        | $FD19
       .byte $00 ; |        | $FD1A
       .byte $00 ; |        | $FD1B
       .byte $00 ; |        | $FD1C
       .byte $00 ; |        | $FD1D
       .byte $00 ; |        | $FD1E
       .byte $00 ; |        | $FD1F
       .byte $00 ; |        | $FD20
       .byte $00 ; |        | $FD21
       .byte $00 ; |        | $FD22
       .byte $00 ; |        | $FD23
       .byte $00 ; |        | $FD24
       .byte $00 ; |        | $FD25
       .byte $00 ; |        | $FD26
       .byte $00 ; |        | $FD27
       .byte $00 ; |        | $FD28
       .byte $00 ; |        | $FD29
       .byte $00 ; |        | $FD2A
       .byte $00 ; |        | $FD2B
       .byte $00 ; |        | $FD2C
       .byte $00 ; |        | $FD2D
       .byte $00 ; |        | $FD2E
       .byte $00 ; |        | $FD2F
       .byte $00 ; |        | $FD30
       .byte $00 ; |        | $FD31
       .byte $00 ; |        | $FD32
       .byte $00 ; |        | $FD33
       .byte $00 ; |        | $FD34
       .byte $00 ; |        | $FD35
       .byte $00 ; |        | $FD36
       .byte $00 ; |        | $FD37
       .byte $00 ; |        | $FD38
       .byte $00 ; |        | $FD39
       .byte $00 ; |        | $FD3A
       .byte $00 ; |        | $FD3B
       .byte $00 ; |        | $FD3C
       .byte $00 ; |        | $FD3D
       .byte $00 ; |        | $FD3E
       .byte $00 ; |        | $FD3F
       .byte $00 ; |        | $FD40
       .byte $00 ; |        | $FD41
       .byte $00 ; |        | $FD42
       .byte $00 ; |        | $FD43
       .byte $00 ; |        | $FD44
       .byte $00 ; |        | $FD45
       .byte $00 ; |        | $FD46
       .byte $00 ; |        | $FD47
       .byte $00 ; |        | $FD48
       .byte $00 ; |        | $FD49
       .byte $00 ; |        | $FD4A
       .byte $00 ; |        | $FD4B
       .byte $00 ; |        | $FD4C
       .byte $00 ; |        | $FD4D
       .byte $00 ; |        | $FD4E
       .byte $00 ; |        | $FD4F
       .byte $00 ; |        | $FD50
       .byte $00 ; |        | $FD51
       .byte $00 ; |        | $FD52
       .byte $00 ; |        | $FD53
       .byte $00 ; |        | $FD54
       .byte $00 ; |        | $FD55
       .byte $00 ; |        | $FD56
       .byte $00 ; |        | $FD57
       .byte $00 ; |        | $FD58
       .byte $00 ; |        | $FD59
       .byte $00 ; |        | $FD5A
       .byte $00 ; |        | $FD5B
       .byte $00 ; |        | $FD5C
       .byte $00 ; |        | $FD5D
       .byte $00 ; |        | $FD5E
       .byte $00 ; |        | $FD5F
       .byte $00 ; |        | $FD60
       .byte $00 ; |        | $FD61
       .byte $00 ; |        | $FD62
       .byte $00 ; |        | $FD63
       .byte $00 ; |        | $FD64
       .byte $00 ; |        | $FD65
       .byte $00 ; |        | $FD66
       .byte $00 ; |        | $FD67
       .byte $00 ; |        | $FD68
       .byte $00 ; |        | $FD69
       .byte $00 ; |        | $FD6A
       .byte $00 ; |        | $FD6B
       .byte $00 ; |        | $FD6C
       .byte $00 ; |        | $FD6D
       .byte $00 ; |        | $FD6E
       .byte $00 ; |        | $FD6F
       .byte $00 ; |        | $FD70
       .byte $00 ; |        | $FD71
       .byte $00 ; |        | $FD72
       .byte $00 ; |        | $FD73
       .byte $00 ; |        | $FD74
       .byte $00 ; |        | $FD75
       .byte $00 ; |        | $FD76
       .byte $00 ; |        | $FD77
       .byte $00 ; |        | $FD78
       .byte $00 ; |        | $FD79
       .byte $00 ; |        | $FD7A
       .byte $00 ; |        | $FD7B
       .byte $00 ; |        | $FD7C
       .byte $00 ; |        | $FD7D
       .byte $00 ; |        | $FD7E
       .byte $00 ; |        | $FD7F
       .byte $00 ; |        | $FD80
       .byte $00 ; |        | $FD81
       .byte $00 ; |        | $FD82
       .byte $00 ; |        | $FD83
       .byte $00 ; |        | $FD84
       .byte $00 ; |        | $FD85
       .byte $00 ; |        | $FD86
       .byte $00 ; |        | $FD87
       .byte $00 ; |        | $FD88
       .byte $00 ; |        | $FD89
       .byte $00 ; |        | $FD8A
       .byte $00 ; |        | $FD8B
       .byte $18 ; |   XX   | $FD8C
       .byte $18 ; |   XX   | $FD8D
       .byte $18 ; |   XX   | $FD8E
       .byte $38 ; |  XXX   | $FD8F
       .byte $38 ; |  XXX   | $FD90
       .byte $38 ; |  XXX   | $FD91
       .byte $18 ; |   XX   | $FD92
       .byte $18 ; |   XX   | $FD93
       .byte $00 ; |        | $FD94
       .byte $00 ; |        | $FD95
       .byte $7F ; | XXXXXXX| $FD96
       .byte $FA ; |XXXXX X | $FD97
       .byte $FC ; |XXXXXX  | $FD98
       .byte $60 ; | XX     | $FD99
       .byte $40 ; | X      | $FD9A
       .byte $00 ; |        | $FD9B
       .byte $00 ; |        | $FD9C
       .byte $00 ; |        | $FD9D
       .byte $00 ; |        | $FD9E
       .byte $00 ; |        | $FD9F
       .byte $28 ; |  X X   | $FDA0
       .byte $54 ; | X X X  | $FDA1
       .byte $28 ; |  X X   | $FDA2
       .byte $0F ; |    XXXX| $FDA3
       .byte $0F ; |    XXXX| $FDA4
       .byte $46 ; | X   XX | $FDA5
       .byte $46 ; | X   XX | $FDA6
       .byte $46 ; | X   XX | $FDA7
       .byte $00 ; |        | $FDA8
       .byte $00 ; |        | $FDA9
       .byte $00 ; |        | $FDAA
       .byte $00 ; |        | $FDAB
       .byte $00 ; |        | $FDAC
       .byte $10 ; |   X    | $FDAD
       .byte $28 ; |  X X   | $FDAE
       .byte $50 ; | X X    | $FDAF
       .byte $20 ; |  X     | $FDB0
       .byte $10 ; |   X    | $FDB1
       .byte $00 ; |        | $FDB2
       .byte $00 ; |        | $FDB3
       .byte $00 ; |        | $FDB4
       .byte $00 ; |        | $FDB5
       .byte $10 ; |   X    | $FDB6
       .byte $28 ; |  X X   | $FDB7
       .byte $10 ; |   X    | $FDB8
       .byte $28 ; |  X X   | $FDB9
       .byte $10 ; |   X    | $FDBA
       .byte $00 ; |        | $FDBB
       .byte $00 ; |        | $FDBC
       .byte $00 ; |        | $FDBD
       .byte $00 ; |        | $FDBE
       .byte $10 ; |   X    | $FDBF
       .byte $28 ; |  X X   | $FDC0
       .byte $14 ; |   X X  | $FDC1
       .byte $08 ; |    X   | $FDC2
       .byte $10 ; |   X    | $FDC3
       .byte $0F ; |    XXXX| $FDC4
       .byte $0F ; |    XXXX| $FDC5
       .byte $0F ; |    XXXX| $FDC6
       .byte $0F ; |    XXXX| $FDC7
       .byte $0F ; |    XXXX| $FDC8
       .byte $0F ; |    XXXX| $FDC9
       .byte $EA ; |XXX X X | $FDCA
       .byte $EA ; |XXX X X | $FDCB
       .byte $EA ; |XXX X X | $FDCC
       .byte $EA ; |XXX X X | $FDCD
       .byte $00 ; |        | $FDCE
       .byte $00 ; |        | $FDCF
       .byte $0F ; |    XXXX| $FDD0
       .byte $0F ; |    XXXX| $FDD1
       .byte $46 ; | X   XX | $FDD2
       .byte $46 ; | X   XX | $FDD3
       .byte $46 ; | X   XX | $FDD4
       .byte $46 ; | X   XX | $FDD5
       .byte $46 ; | X   XX | $FDD6
       .byte $00 ; |        | $FDD7
       .byte $00 ; |        | $FDD8
       .byte $00 ; |        | $FDD9
       .byte $00 ; |        | $FDDA
       .byte $08 ; |    X   | $FDDB
       .byte $2A ; |  X X X | $FDDC
       .byte $14 ; |   X X  | $FDDD
       .byte $22 ; |  X   X | $FDDE
       .byte $14 ; |   X X  | $FDDF
       .byte $2A ; |  X X X | $FDE0
       .byte $08 ; |    X   | $FDE1
       .byte $10 ; |   X    | $FDE2
       .byte $10 ; |   X    | $FDE3
       .byte $00 ; |        | $FDE4
       .byte $00 ; |        | $FDE5
       .byte $00 ; |        | $FDE6
       .byte $00 ; |        | $FDE7
       .byte $08 ; |    X   | $FDE8
       .byte $49 ; | X  X  X| $FDE9
       .byte $22 ; |  X   X | $FDEA
       .byte $08 ; |    X   | $FDEB
       .byte $63 ; | XX   XX| $FDEC
       .byte $08 ; |    X   | $FDED
       .byte $22 ; |  X   X | $FDEE
       .byte $49 ; | X  X  X| $FDEF
       .byte $08 ; |    X   | $FDF0
       .byte $10 ; |   X    | $FDF1
       .byte $C4 ; |XX   X  | $FDF2
       .byte $AA ; |X X X X | $FDF3
       .byte $AA ; |X X X X | $FDF4
       .byte $CA ; |XX  X X | $FDF5
       .byte $AA ; |X X X X | $FDF6
       .byte $AA ; |X X X X | $FDF7
       .byte $C4 ; |XX   X  | $FDF8
       .byte $97 ; |X  X XXX| $FDF9
       .byte $97 ; |X  X XXX| $FDFA
       .byte $B5 ; |X XX X X| $FDFB
       .byte $F5 ; |XXXX X X| $FDFC
       .byte $D5 ; |XX X X X| $FDFD
       .byte $95 ; |X  X X X| $FDFE
       .byte $95 ; |X  X X X| $FDFF
       .byte $2F ; |  X XXXX| $FE00
       .byte $2F ; |  X XXXX| $FE01
       .byte $2F ; |  X XXXX| $FE02
       .byte $2F ; |  X XXXX| $FE03
       .byte $2F ; |  X XXXX| $FE04
       .byte $2F ; |  X XXXX| $FE05
       .byte $2F ; |  X XXXX| $FE06
       .byte $2F ; |  X XXXX| $FE07
       .byte $2F ; |  X XXXX| $FE08
       .byte $2F ; |  X XXXX| $FE09
       .byte $2F ; |  X XXXX| $FE0A
       .byte $2F ; |  X XXXX| $FE0B
       .byte $2F ; |  X XXXX| $FE0C
       .byte $2F ; |  X XXXX| $FE0D
       .byte $2F ; |  X XXXX| $FE0E
       .byte $2F ; |  X XXXX| $FE0F
       .byte $2F ; |  X XXXX| $FE10
       .byte $2F ; |  X XXXX| $FE11
       .byte $2F ; |  X XXXX| $FE12
       .byte $2F ; |  X XXXX| $FE13
       .byte $2F ; |  X XXXX| $FE14
       .byte $2F ; |  X XXXX| $FE15
       .byte $2F ; |  X XXXX| $FE16
       .byte $2F ; |  X XXXX| $FE17
       .byte $2F ; |  X XXXX| $FE18
       .byte $2F ; |  X XXXX| $FE19
       .byte $2F ; |  X XXXX| $FE1A
       .byte $2F ; |  X XXXX| $FE1B
       .byte $2F ; |  X XXXX| $FE1C
       .byte $20 ; |  X     | $FE1D
       .byte $20 ; |  X     | $FE1E
       .byte $20 ; |  X     | $FE1F
       .byte $20 ; |  X     | $FE20
       .byte $20 ; |  X     | $FE21
       .byte $00 ; |        | $FE22
       .byte $00 ; |        | $FE23
       .byte $00 ; |        | $FE24
       .byte $00 ; |        | $FE25
       .byte $00 ; |        | $FE26
       .byte $0F ; |    XXXX| $FE27
       .byte $00 ; |        | $FE28
       .byte $00 ; |        | $FE29
       .byte $00 ; |        | $FE2A
       .byte $00 ; |        | $FE2B
       .byte $00 ; |        | $FE2C
       .byte $00 ; |        | $FE2D
       .byte $00 ; |        | $FE2E
       .byte $00 ; |        | $FE2F
       .byte $00 ; |        | $FE30
       .byte $0F ; |    XXXX| $FE31
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
       .byte $0F ; |    XXXX| $FE43
       .byte $00 ; |        | $FE44
       .byte $00 ; |        | $FE45
       .byte $00 ; |        | $FE46
       .byte $00 ; |        | $FE47
       .byte $00 ; |        | $FE48
       .byte $00 ; |        | $FE49
       .byte $00 ; |        | $FE4A
       .byte $00 ; |        | $FE4B
       .byte $00 ; |        | $FE4C
       .byte $0F ; |    XXXX| $FE4D
       .byte $00 ; |        | $FE4E
       .byte $00 ; |        | $FE4F
       .byte $00 ; |        | $FE50
       .byte $00 ; |        | $FE51
       .byte $00 ; |        | $FE52
       .byte $00 ; |        | $FE53
       .byte $00 ; |        | $FE54
       .byte $00 ; |        | $FE55
       .byte $00 ; |        | $FE56
       .byte $00 ; |        | $FE57
       .byte $00 ; |        | $FE58
       .byte $00 ; |        | $FE59
       .byte $00 ; |        | $FE5A
       .byte $00 ; |        | $FE5B
       .byte $00 ; |        | $FE5C
       .byte $0F ; |    XXXX| $FE5D
       .byte $00 ; |        | $FE5E
       .byte $00 ; |        | $FE5F
       .byte $00 ; |        | $FE60
       .byte $00 ; |        | $FE61
       .byte $00 ; |        | $FE62
       .byte $00 ; |        | $FE63
       .byte $00 ; |        | $FE64
       .byte $00 ; |        | $FE65
       .byte $00 ; |        | $FE66
       .byte $0F ; |    XXXX| $FE67
       .byte $00 ; |        | $FE68
       .byte $00 ; |        | $FE69
       .byte $00 ; |        | $FE6A
       .byte $00 ; |        | $FE6B
       .byte $00 ; |        | $FE6C
       .byte $00 ; |        | $FE6D
       .byte $00 ; |        | $FE6E
       .byte $00 ; |        | $FE6F
       .byte $00 ; |        | $FE70
       .byte $00 ; |        | $FE71
       .byte $00 ; |        | $FE72
       .byte $00 ; |        | $FE73
       .byte $00 ; |        | $FE74
       .byte $00 ; |        | $FE75
       .byte $00 ; |        | $FE76
       .byte $00 ; |        | $FE77
       .byte $00 ; |        | $FE78
       .byte $00 ; |        | $FE79
       .byte $00 ; |        | $FE7A
       .byte $00 ; |        | $FE7B
       .byte $00 ; |        | $FE7C
       .byte $0F ; |    XXXX| $FE7D
       .byte $00 ; |        | $FE7E
       .byte $00 ; |        | $FE7F
       .byte $00 ; |        | $FE80
       .byte $00 ; |        | $FE81
       .byte $00 ; |        | $FE82
       .byte $00 ; |        | $FE83
       .byte $00 ; |        | $FE84
       .byte $0F ; |    XXXX| $FE85
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
       .byte $0F ; |    XXXX| $FE97
       .byte $00 ; |        | $FE98
       .byte $00 ; |        | $FE99
       .byte $00 ; |        | $FE9A
       .byte $00 ; |        | $FE9B
       .byte $00 ; |        | $FE9C
       .byte $00 ; |        | $FE9D
       .byte $00 ; |        | $FE9E
       .byte $00 ; |        | $FE9F
       .byte $00 ; |        | $FEA0
       .byte $0F ; |    XXXX| $FEA1
       .byte $00 ; |        | $FEA2
       .byte $00 ; |        | $FEA3
       .byte $00 ; |        | $FEA4
       .byte $00 ; |        | $FEA5
       .byte $00 ; |        | $FEA6
       .byte $00 ; |        | $FEA7
       .byte $65 ; | XX  X X| $FEA8
       .byte $95 ; |X  X X X| $FEA9
       .byte $95 ; |X  X X X| $FEAA
       .byte $A7 ; |X X  XXX| $FEAB
       .byte $85 ; |X    X X| $FEAC
       .byte $95 ; |X  X X X| $FEAD
       .byte $62 ; | XX   X | $FEAE
       .byte $55 ; | X X X X| $FEAF
       .byte $55 ; | X X X X| $FEB0
       .byte $55 ; | X X X X| $FEB1
       .byte $55 ; | X X X X| $FEB2
       .byte $55 ; | X X X X| $FEB3
       .byte $55 ; | X X X X| $FEB4
       .byte $29 ; |  X X  X| $FEB5
       .byte $C0 ; |XX      | $FEB6
       .byte $00 ; |        | $FEB7
       .byte $00 ; |        | $FEB8
       .byte $80 ; |X       | $FEB9
       .byte $00 ; |        | $FEBA
       .byte $00 ; |        | $FEBB
       .byte $C0 ; |XX      | $FEBC
       .byte $62 ; | XX   X | $FEBD
       .byte $95 ; |X  X X X| $FEBE
       .byte $95 ; |X  X X X| $FEBF
       .byte $95 ; |X  X X X| $FEC0
       .byte $95 ; |X  X X X| $FEC1
       .byte $95 ; |X  X X X| $FEC2
       .byte $65 ; | XX  X X| $FEC3
       .byte $75 ; | XXX X X| $FEC4
       .byte $45 ; | X   X X| $FEC5
       .byte $45 ; | X   X X| $FEC6
       .byte $66 ; | XX  XX | $FEC7
       .byte $45 ; | X   X X| $FEC8
       .byte $45 ; | X   X X| $FEC9
       .byte $76 ; | XXX XX | $FECA
       .byte $52 ; | X X  X | $FECB
       .byte $AA ; |X X X X | $FECC
       .byte $AA ; |X X X X | $FECD
       .byte $AB ; |X X X XX| $FECE
       .byte $8A ; |X   X X | $FECF
       .byte $8A ; |X   X X | $FED0
       .byte $89 ; |X   X  X| $FED1
       .byte $AA ; |X X X X | $FED2
       .byte $AA ; |X X X X | $FED3
       .byte $AA ; |X X X X | $FED4
       .byte $B3 ; |X XX  XX| $FED5
       .byte $AA ; |X X X X | $FED6
       .byte $AA ; |X X X X | $FED7
       .byte $33 ; |  XX  XX| $FED8
       .byte $04 ; |     X  | $FED9
       .byte $05 ; |     X X| $FEDA
       .byte $05 ; |     X X| $FEDB
       .byte $05 ; |     X X| $FEDC
       .byte $85 ; |X    X X| $FEDD
       .byte $85 ; |X    X X| $FEDE
       .byte $0E ; |    XXX | $FEDF
       .byte $87 ; |X    XXX| $FEE0
       .byte $44 ; | X   X  | $FEE1
       .byte $44 ; | X   X  | $FEE2
       .byte $44 ; | X   X  | $FEE3
       .byte $44 ; | X   X  | $FEE4
       .byte $44 ; | X   X  | $FEE5
       .byte $84 ; |X    X  | $FEE6
       .byte $72 ; | XXX  X | $FEE7
       .byte $45 ; | X   X X| $FEE8
       .byte $45 ; | X   X X| $FEE9
       .byte $65 ; | XX  X X| $FEEA
       .byte $45 ; | X   X X| $FEEB
       .byte $45 ; | X   X X| $FEEC
       .byte $75 ; | XXX X X| $FEED
       .byte $77 ; | XXX XXX| $FEEE
       .byte $44 ; | X   X  | $FEEF
       .byte $44 ; | X   X  | $FEF0
       .byte $64 ; | XX  X  | $FEF1
       .byte $44 ; | X   X  | $FEF2
       .byte $44 ; | X   X  | $FEF3
       .byte $74 ; | XXX X  | $FEF4
       .byte $70 ; | XXX    | $FEF5
       .byte $10 ; |   X    | $FEF6
       .byte $15 ; |   X X X| $FEF7
       .byte $72 ; | XXX  X | $FEF8
       .byte $45 ; | X   X X| $FEF9
       .byte $40 ; | X      | $FEFA
       .byte $70 ; | XXX    | $FEFB
LFEFC: .byte $B9 ; |X XXX  X| $FEFC
       .byte $B1 ; |X XX   X| $FEFD
LFEFE: .byte $0A ; |    X X | $FEFE
       .byte $02 ; |      X | $FEFF
       .byte $00 ; |        | $FF00
       .byte $00 ; |        | $FF01
       .byte $00 ; |        | $FF02
       .byte $00 ; |        | $FF03
       .byte $00 ; |        | $FF04
       .byte $00 ; |        | $FF05
       .byte $00 ; |        | $FF06
       .byte $00 ; |        | $FF07
       .byte $00 ; |        | $FF08
       .byte $00 ; |        | $FF09
       .byte $00 ; |        | $FF0A
       .byte $00 ; |        | $FF0B
       .byte $00 ; |        | $FF0C
       .byte $00 ; |        | $FF0D
       .byte $00 ; |        | $FF0E
       .byte $00 ; |        | $FF0F
       .byte $00 ; |        | $FF10
       .byte $00 ; |        | $FF11
       .byte $00 ; |        | $FF12
       .byte $00 ; |        | $FF13
       .byte $00 ; |        | $FF14
       .byte $00 ; |        | $FF15
       .byte $00 ; |        | $FF16
       .byte $00 ; |        | $FF17
       .byte $00 ; |        | $FF18
       .byte $00 ; |        | $FF19
       .byte $00 ; |        | $FF1A
       .byte $00 ; |        | $FF1B
       .byte $00 ; |        | $FF1C
       .byte $00 ; |        | $FF1D
       .byte $00 ; |        | $FF1E
       .byte $00 ; |        | $FF1F
       .byte $00 ; |        | $FF20
       .byte $00 ; |        | $FF21
       .byte $00 ; |        | $FF22
       .byte $00 ; |        | $FF23
       .byte $00 ; |        | $FF24
       .byte $00 ; |        | $FF25
       .byte $00 ; |        | $FF26
       .byte $00 ; |        | $FF27
       .byte $00 ; |        | $FF28
       .byte $00 ; |        | $FF29
       .byte $00 ; |        | $FF2A
       .byte $00 ; |        | $FF2B
       .byte $00 ; |        | $FF2C
       .byte $00 ; |        | $FF2D
       .byte $00 ; |        | $FF2E
       .byte $00 ; |        | $FF2F
       .byte $00 ; |        | $FF30
       .byte $00 ; |        | $FF31
       .byte $00 ; |        | $FF32
       .byte $00 ; |        | $FF33
       .byte $00 ; |        | $FF34
       .byte $00 ; |        | $FF35
       .byte $00 ; |        | $FF36
       .byte $00 ; |        | $FF37
       .byte $00 ; |        | $FF38
       .byte $00 ; |        | $FF39
       .byte $00 ; |        | $FF3A
       .byte $00 ; |        | $FF3B
       .byte $00 ; |        | $FF3C
       .byte $00 ; |        | $FF3D
       .byte $00 ; |        | $FF3E
       .byte $00 ; |        | $FF3F
       .byte $00 ; |        | $FF40
       .byte $00 ; |        | $FF41
       .byte $00 ; |        | $FF42
       .byte $00 ; |        | $FF43
       .byte $00 ; |        | $FF44
       .byte $00 ; |        | $FF45
       .byte $00 ; |        | $FF46
       .byte $00 ; |        | $FF47
       .byte $00 ; |        | $FF48
       .byte $00 ; |        | $FF49
       .byte $00 ; |        | $FF4A
       .byte $00 ; |        | $FF4B
       .byte $00 ; |        | $FF4C
       .byte $00 ; |        | $FF4D
       .byte $00 ; |        | $FF4E
       .byte $00 ; |        | $FF4F
       .byte $00 ; |        | $FF50
       .byte $00 ; |        | $FF51
       .byte $00 ; |        | $FF52
       .byte $00 ; |        | $FF53
       .byte $00 ; |        | $FF54
       .byte $00 ; |        | $FF55
       .byte $00 ; |        | $FF56
       .byte $00 ; |        | $FF57
       .byte $00 ; |        | $FF58
       .byte $00 ; |        | $FF59
       .byte $00 ; |        | $FF5A
       .byte $00 ; |        | $FF5B
       .byte $00 ; |        | $FF5C
       .byte $00 ; |        | $FF5D
       .byte $00 ; |        | $FF5E
       .byte $00 ; |        | $FF5F
       .byte $00 ; |        | $FF60
       .byte $00 ; |        | $FF61
       .byte $00 ; |        | $FF62
       .byte $00 ; |        | $FF63
       .byte $00 ; |        | $FF64
       .byte $00 ; |        | $FF65
       .byte $00 ; |        | $FF66
       .byte $00 ; |        | $FF67
       .byte $00 ; |        | $FF68
       .byte $00 ; |        | $FF69
       .byte $00 ; |        | $FF6A
       .byte $00 ; |        | $FF6B
       .byte $00 ; |        | $FF6C
       .byte $00 ; |        | $FF6D
       .byte $00 ; |        | $FF6E
       .byte $00 ; |        | $FF6F
       .byte $00 ; |        | $FF70
       .byte $00 ; |        | $FF71
       .byte $00 ; |        | $FF72
       .byte $00 ; |        | $FF73
       .byte $00 ; |        | $FF74
       .byte $00 ; |        | $FF75
       .byte $00 ; |        | $FF76
       .byte $00 ; |        | $FF77
       .byte $00 ; |        | $FF78
       .byte $00 ; |        | $FF79
       .byte $00 ; |        | $FF7A
       .byte $00 ; |        | $FF7B
       .byte $00 ; |        | $FF7C
       .byte $00 ; |        | $FF7D
       .byte $00 ; |        | $FF7E
       .byte $00 ; |        | $FF7F
       .byte $00 ; |        | $FF80
       .byte $00 ; |        | $FF81
       .byte $00 ; |        | $FF82
       .byte $00 ; |        | $FF83
       .byte $00 ; |        | $FF84
       .byte $00 ; |        | $FF85
       .byte $00 ; |        | $FF86
       .byte $00 ; |        | $FF87
       .byte $00 ; |        | $FF88
       .byte $00 ; |        | $FF89
       .byte $00 ; |        | $FF8A
       .byte $00 ; |        | $FF8B
       .byte $7F ; | XXXXXXX| $FF8C
       .byte $FA ; |XXXXX X | $FF8D
       .byte $FC ; |XXXXXX  | $FF8E
       .byte $60 ; | XX     | $FF8F
       .byte $40 ; | X      | $FF90
       .byte $00 ; |        | $FF91
       .byte $00 ; |        | $FF92
       .byte $00 ; |        | $FF93
       .byte $00 ; |        | $FF94
       .byte $00 ; |        | $FF95
       .byte $92 ; |X  X  X | $FF96
       .byte $54 ; | X X X  | $FF97
       .byte $38 ; |  XXX   | $FF98
       .byte $FE ; |XXXXXXX | $FF99
       .byte $B2 ; |X XX  X | $FF9A
       .byte $B2 ; |X XX  X | $FF9B
       .byte $7C ; | XXXXX  | $FF9C
       .byte $38 ; |  XXX   | $FF9D
       .byte $C4 ; |XX   X  | $FF9E
       .byte $C4 ; |XX   X  | $FF9F
       .byte $C4 ; |XX   X  | $FFA0
       .byte $C4 ; |XX   X  | $FFA1
       .byte $56 ; | X X XX | $FFA2
       .byte $56 ; | X X XX | $FFA3
       .byte $56 ; | X X XX | $FFA4
       .byte $56 ; | X X XX | $FFA5
       .byte $00 ; |        | $FFA6
       .byte $00 ; |        | $FFA7
       .byte $00 ; |        | $FFA8
       .byte $00 ; |        | $FFA9
       .byte $92 ; |X  X  X | $FFAA
       .byte $54 ; | X X X  | $FFAB
       .byte $38 ; |  XXX   | $FFAC
       .byte $FE ; |XXXXXXX | $FFAD
       .byte $E6 ; |XXX  XX | $FFAE
       .byte $E6 ; |XXX  XX | $FFAF
       .byte $7C ; | XXXXX  | $FFB0
       .byte $38 ; |  XXX   | $FFB1
       .byte $E6 ; |XXX  XX | $FFB2
       .byte $E6 ; |XXX  XX | $FFB3
       .byte $E6 ; |XXX  XX | $FFB4
       .byte $E6 ; |XXX  XX | $FFB5
       .byte $C4 ; |XX   X  | $FFB6
       .byte $56 ; | X X XX | $FFB7
       .byte $56 ; | X X XX | $FFB8
       .byte $C4 ; |XX   X  | $FFB9
       .byte $C4 ; |XX   X  | $FFBA
       .byte $00 ; |        | $FFBB
       .byte $00 ; |        | $FFBC
       .byte $00 ; |        | $FFBD
       .byte $00 ; |        | $FFBE
       .byte $92 ; |X  X  X | $FFBF
       .byte $54 ; | X X X  | $FFC0
       .byte $38 ; |  XXX   | $FFC1
       .byte $FE ; |XXXXXXX | $FFC2
       .byte $CE ; |XX  XXX | $FFC3
       .byte $CE ; |XX  XXX | $FFC4
       .byte $7C ; | XXXXX  | $FFC5
       .byte $38 ; |  XXX   | $FFC6
       .byte $00 ; |        | $FFC7
       .byte $00 ; |        | $FFC8
       .byte $00 ; |        | $FFC9
       .byte $00 ; |        | $FFCA
       .byte $92 ; |X  X  X | $FFCB
       .byte $54 ; | X X X  | $FFCC
       .byte $38 ; |  XXX   | $FFCD
       .byte $FE ; |XXXXXXX | $FFCE
       .byte $9A ; |X  XX X | $FFCF
       .byte $9A ; |X  XX X | $FFD0
       .byte $7C ; | XXXXX  | $FFD1
       .byte $38 ; |  XXX   | $FFD2
       .byte $0F ; |    XXXX| $FFD3
       .byte $0F ; |    XXXX| $FFD4
       .byte $C4 ; |XX   X  | $FFD5
       .byte $C4 ; |XX   X  | $FFD6
       .byte $C4 ; |XX   X  | $FFD7
       .byte $C4 ; |XX   X  | $FFD8
       .byte $C4 ; |XX   X  | $FFD9
       .byte $C4 ; |XX   X  | $FFDA
       .byte $E6 ; |XXX  XX | $FFDB
       .byte $C4 ; |XX   X  | $FFDC
       .byte $0F ; |    XXXX| $FFDD
       .byte $C4 ; |XX   X  | $FFDE
       .byte $C4 ; |XX   X  | $FFDF
       .byte $C4 ; |XX   X  | $FFE0
       .byte $C4 ; |XX   X  | $FFE1
       .byte $C4 ; |XX   X  | $FFE2
       .byte $C4 ; |XX   X  | $FFE3
       .byte $E6 ; |XXX  XX | $FFE4
       .byte $E6 ; |XXX  XX | $FFE5
       .byte $0F ; |    XXXX| $FFE6
       .byte $0F ; |    XXXX| $FFE7
       .byte $56 ; | X X XX | $FFE8
       .byte $56 ; | X X XX | $FFE9
       .byte $56 ; | X X XX | $FFEA
       .byte $D6 ; |XX X XX | $FFEB
       .byte $56 ; | X X XX | $FFEC
       .byte $56 ; | X X XX | $FFED
       .byte $C4 ; |XX   X  | $FFEE
       .byte $C4 ; |XX   X  | $FFEF
LFFF0: .byte $9A ; |X  XX X | $FFF0
       .byte $92 ; |X  X  X | $FFF1
LFFF2: .byte $8D,$F8,$FF,$4C,$58,$F1
LFFF8: .byte $00,$00,$00,$F1,$00,$F1,$00,$F1
