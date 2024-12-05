; Disassembly of d2_001.bin
; Disassembled Sat Feb 28 07:47:26 2004
; Using DiStella v2.0
;
; Command Line: C:\BIN\DISTELLA.EXE -pafscd2_001.cfg d2_001.bin 
;
; d2_001.cfg contents:
;
;      GFX D000 D100
;      CODE D101 DC6E
;      GFX DC6F DFF1
;      

      processor 6502
VSYNC   =  $00
WSYNC   =  $02
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
CXM0P   =  $30
CXP0FB  =  $32
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWCHB   =  $0282
$0285   =  $0285
TIM64T  =  $0296
LDC62   =   $DC62

       ORG $D000
LD000: .byte $00 ; |        | $D000
LD001: .byte $00 ; |        | $D001
LD002: .byte $00 ; |        | $D002
       .byte $00 ; |        | $D003
       .byte $00 ; |        | $D004
       .byte $00 ; |        | $D005
       .byte $00 ; |        | $D006
       .byte $00 ; |        | $D007
       .byte $00 ; |        | $D008
       .byte $00 ; |        | $D009
       .byte $00 ; |        | $D00A
       .byte $00 ; |        | $D00B
       .byte $00 ; |        | $D00C
       .byte $00 ; |        | $D00D
       .byte $00 ; |        | $D00E
       .byte $00 ; |        | $D00F
       .byte $00 ; |        | $D010
       .byte $00 ; |        | $D011
LD012: .byte $00 ; |        | $D012
       .byte $00 ; |        | $D013
       .byte $00 ; |        | $D014
       .byte $00 ; |        | $D015
       .byte $00 ; |        | $D016
       .byte $00 ; |        | $D017
       .byte $00 ; |        | $D018
       .byte $00 ; |        | $D019
       .byte $00 ; |        | $D01A
       .byte $00 ; |        | $D01B
       .byte $00 ; |        | $D01C
       .byte $00 ; |        | $D01D
       .byte $00 ; |        | $D01E
       .byte $00 ; |        | $D01F
       .byte $00 ; |        | $D020
       .byte $00 ; |        | $D021
LD022: .byte $00 ; |        | $D022
LD023: .byte $00 ; |        | $D023
LD024: .byte $00 ; |        | $D024
LD025: .byte $00 ; |        | $D025
LD026: .byte $00 ; |        | $D026
LD027: .byte $00 ; |        | $D027
LD028: .byte $00 ; |        | $D028
       .byte $00 ; |        | $D029
       .byte $00 ; |        | $D02A
       .byte $00 ; |        | $D02B
       .byte $00 ; |        | $D02C
       .byte $00 ; |        | $D02D
       .byte $00 ; |        | $D02E
       .byte $00 ; |        | $D02F
       .byte $00 ; |        | $D030
LD031: .byte $00 ; |        | $D031
LD032: .byte $00 ; |        | $D032
       .byte $00 ; |        | $D033
       .byte $00 ; |        | $D034
       .byte $00 ; |        | $D035
       .byte $00 ; |        | $D036
       .byte $00 ; |        | $D037
LD038: .byte $00 ; |        | $D038
       .byte $00 ; |        | $D039
       .byte $00 ; |        | $D03A
       .byte $00 ; |        | $D03B
       .byte $00 ; |        | $D03C
       .byte $00 ; |        | $D03D
       .byte $00 ; |        | $D03E
       .byte $00 ; |        | $D03F
       .byte $00 ; |        | $D040
LD041: .byte $00 ; |        | $D041
       .byte $00 ; |        | $D042
LD043: .byte $00 ; |        | $D043
       .byte $00 ; |        | $D044
       .byte $00 ; |        | $D045
       .byte $00 ; |        | $D046
       .byte $00 ; |        | $D047
       .byte $00 ; |        | $D048
LD049: .byte $00 ; |        | $D049
LD04A: .byte $00 ; |        | $D04A
LD04B: .byte $00 ; |        | $D04B
LD04C: .byte $00 ; |        | $D04C
LD04D: .byte $00 ; |        | $D04D
LD04E: .byte $00 ; |        | $D04E
LD04F: .byte $00 ; |        | $D04F
       .byte $00 ; |        | $D050
       .byte $00 ; |        | $D051
       .byte $00 ; |        | $D052
       .byte $00 ; |        | $D053
       .byte $00 ; |        | $D054
       .byte $00 ; |        | $D055
       .byte $00 ; |        | $D056
       .byte $00 ; |        | $D057
       .byte $00 ; |        | $D058
       .byte $00 ; |        | $D059
       .byte $00 ; |        | $D05A
       .byte $00 ; |        | $D05B
       .byte $00 ; |        | $D05C
       .byte $00 ; |        | $D05D
       .byte $00 ; |        | $D05E
       .byte $00 ; |        | $D05F
       .byte $00 ; |        | $D060
       .byte $00 ; |        | $D061
       .byte $00 ; |        | $D062
       .byte $00 ; |        | $D063
       .byte $00 ; |        | $D064
       .byte $00 ; |        | $D065
       .byte $00 ; |        | $D066
       .byte $00 ; |        | $D067
       .byte $00 ; |        | $D068
       .byte $00 ; |        | $D069
       .byte $00 ; |        | $D06A
       .byte $00 ; |        | $D06B
       .byte $00 ; |        | $D06C
       .byte $00 ; |        | $D06D
       .byte $00 ; |        | $D06E
       .byte $00 ; |        | $D06F
       .byte $00 ; |        | $D070
       .byte $00 ; |        | $D071
       .byte $00 ; |        | $D072
       .byte $00 ; |        | $D073
       .byte $00 ; |        | $D074
       .byte $00 ; |        | $D075
       .byte $00 ; |        | $D076
       .byte $00 ; |        | $D077
       .byte $00 ; |        | $D078
LD079: .byte $00 ; |        | $D079
LD07A: .byte $00 ; |        | $D07A
LD07B: .byte $00 ; |        | $D07B
LD07C: .byte $00 ; |        | $D07C
LD07D: .byte $00 ; |        | $D07D
       .byte $00 ; |        | $D07E
       .byte $00 ; |        | $D07F
LD080: .byte $00 ; |        | $D080
LD081: .byte $00 ; |        | $D081
LD082: .byte $00 ; |        | $D082
       .byte $00 ; |        | $D083
       .byte $00 ; |        | $D084
       .byte $00 ; |        | $D085
       .byte $00 ; |        | $D086
       .byte $00 ; |        | $D087
       .byte $00 ; |        | $D088
       .byte $00 ; |        | $D089
       .byte $00 ; |        | $D08A
       .byte $00 ; |        | $D08B
       .byte $00 ; |        | $D08C
       .byte $00 ; |        | $D08D
       .byte $00 ; |        | $D08E
       .byte $00 ; |        | $D08F
       .byte $00 ; |        | $D090
       .byte $00 ; |        | $D091
LD092: .byte $00 ; |        | $D092
       .byte $00 ; |        | $D093
       .byte $00 ; |        | $D094
       .byte $00 ; |        | $D095
       .byte $00 ; |        | $D096
       .byte $00 ; |        | $D097
       .byte $00 ; |        | $D098
       .byte $00 ; |        | $D099
       .byte $00 ; |        | $D09A
       .byte $00 ; |        | $D09B
       .byte $00 ; |        | $D09C
       .byte $00 ; |        | $D09D
       .byte $00 ; |        | $D09E
       .byte $00 ; |        | $D09F
       .byte $00 ; |        | $D0A0
       .byte $00 ; |        | $D0A1
LD0A2: .byte $00 ; |        | $D0A2
       .byte $00 ; |        | $D0A3
       .byte $00 ; |        | $D0A4
       .byte $00 ; |        | $D0A5
       .byte $00 ; |        | $D0A6
       .byte $00 ; |        | $D0A7
       .byte $00 ; |        | $D0A8
       .byte $00 ; |        | $D0A9
       .byte $00 ; |        | $D0AA
       .byte $00 ; |        | $D0AB
       .byte $00 ; |        | $D0AC
       .byte $00 ; |        | $D0AD
       .byte $00 ; |        | $D0AE
       .byte $00 ; |        | $D0AF
       .byte $00 ; |        | $D0B0
       .byte $00 ; |        | $D0B1
LD0B2: .byte $00 ; |        | $D0B2
       .byte $00 ; |        | $D0B3
       .byte $00 ; |        | $D0B4
       .byte $00 ; |        | $D0B5
       .byte $00 ; |        | $D0B6
       .byte $00 ; |        | $D0B7
       .byte $00 ; |        | $D0B8
       .byte $00 ; |        | $D0B9
       .byte $00 ; |        | $D0BA
       .byte $00 ; |        | $D0BB
       .byte $00 ; |        | $D0BC
       .byte $00 ; |        | $D0BD
       .byte $00 ; |        | $D0BE
       .byte $00 ; |        | $D0BF
       .byte $00 ; |        | $D0C0
       .byte $00 ; |        | $D0C1
LD0C2: .byte $00 ; |        | $D0C2
LD0C3: .byte $00 ; |        | $D0C3
       .byte $00 ; |        | $D0C4
       .byte $00 ; |        | $D0C5
       .byte $00 ; |        | $D0C6
       .byte $00 ; |        | $D0C7
LD0C8: .byte $00 ; |        | $D0C8
       .byte $00 ; |        | $D0C9
       .byte $00 ; |        | $D0CA
LD0CB: .byte $00 ; |        | $D0CB
LD0CC: .byte $00 ; |        | $D0CC
LD0CD: .byte $00 ; |        | $D0CD
LD0CE: .byte $00 ; |        | $D0CE
       .byte $00 ; |        | $D0CF
       .byte $00 ; |        | $D0D0
       .byte $00 ; |        | $D0D1
       .byte $00 ; |        | $D0D2
       .byte $00 ; |        | $D0D3
       .byte $00 ; |        | $D0D4
       .byte $00 ; |        | $D0D5
       .byte $00 ; |        | $D0D6
       .byte $00 ; |        | $D0D7
       .byte $00 ; |        | $D0D8
       .byte $00 ; |        | $D0D9
       .byte $00 ; |        | $D0DA
       .byte $00 ; |        | $D0DB
       .byte $00 ; |        | $D0DC
       .byte $00 ; |        | $D0DD
       .byte $00 ; |        | $D0DE
       .byte $00 ; |        | $D0DF
       .byte $00 ; |        | $D0E0
       .byte $00 ; |        | $D0E1
       .byte $00 ; |        | $D0E2
       .byte $00 ; |        | $D0E3
       .byte $00 ; |        | $D0E4
       .byte $00 ; |        | $D0E5
       .byte $00 ; |        | $D0E6
       .byte $00 ; |        | $D0E7
       .byte $00 ; |        | $D0E8
       .byte $00 ; |        | $D0E9
       .byte $00 ; |        | $D0EA
       .byte $00 ; |        | $D0EB
       .byte $00 ; |        | $D0EC
       .byte $00 ; |        | $D0ED
       .byte $00 ; |        | $D0EE
       .byte $00 ; |        | $D0EF
       .byte $00 ; |        | $D0F0
       .byte $00 ; |        | $D0F1
       .byte $00 ; |        | $D0F2
       .byte $00 ; |        | $D0F3
       .byte $00 ; |        | $D0F4
       .byte $00 ; |        | $D0F5
       .byte $00 ; |        | $D0F6
       .byte $00 ; |        | $D0F7
       .byte $00 ; |        | $D0F8
LD0F9: .byte $00 ; |        | $D0F9
LD0FA: .byte $00 ; |        | $D0FA
LD0FB: .byte $00 ; |        | $D0FB
LD0FC: .byte $00 ; |        | $D0FC
LD0FD: .byte $00 ; |        | $D0FD
       .byte $00 ; |        | $D0FE
       .byte $00 ; |        | $D0FF
LD100: .byte $00 ; |        | $D100
       .byte $13 ;.SLO;8
       .byte $12 ;.JAM;0

START:
       LDY    #$B5    ;2
       SEI            ;2
       CLD            ;2
       LDX    #$00    ;2
LD109: LDA    #$00    ;2
LD10B: STA    VSYNC,X ;4
       STA    $EF80,X ;5
       INX            ;2
       BNE    LD10B   ;2
       DEX            ;2
       TXS            ;2
       STY    $80     ;3
       LDX    #$0F    ;2
LD119: LDA    LDE6A,X ;4
       STA    $F002,X ;5
       DEX            ;2
       BPL    LD119   ;2
       LDA    #$01    ;2
       STA    $F041   ;4
       LDA    #$10    ;2
       STA    $F031   ;4
       LDA    #$49    ;2
       STA    $99     ;3
       LDA    #$80    ;2
       STA    $AE     ;3
       STA    $85     ;3
       LDX    $82     ;3
       BEQ    LD13D   ;2
       STA    $F07C   ;4
LD13D: LDA    #$01    ;2
       STA    $F001   ;4
       LDA    $82     ;3
       BNE    LD150   ;2
       STA    $AE     ;3
       LDA    #$C8    ;2
       STA    $87     ;3
       LDA    #$A7    ;2
       STA    $88     ;3
LD150: LDA    #$FF    ;2
       STA    $D6     ;3
       LDA    #$32    ;2
       STA    $F04A   ;4
       STA    $D8     ;3
       LDA    #$FF    ;2
       STA    $95     ;3
       LDA    #$C8    ;2
       STA    $81     ;3
       STA    $9A     ;3
       LDA    #$0B    ;2
       STA    $A8     ;3
       JMP    LD90B   ;3
       LDA    #$2B    ;2
       STA    TIM64T  ;4
       LDA    $82     ;3
       BNE    LD181   ;2
       LDA    $AE     ;3
       BEQ    LD17D   ;2
       DEC    $AE     ;5
       BNE    LD181   ;2
LD17D: LDA    INPT4   ;3
       BPL    LD188   ;2
LD181: LDA    SWCHB   ;4
       AND    #$01    ;2
       BNE    LD197   ;2
LD188: LDA    #$03    ;2
       STA    $82     ;3
       STA    $84     ;3
       STA    $83     ;3
       LDY    $80     ;3
       LDX    #$89    ;2
       JMP    LD109   ;3
LD197: LDX    #$FF    ;2
       TXS            ;2
       LDA    $82     ;3
       BNE    LD1A1   ;2
       JMP    LD90B   ;3
LD1A1: LDA    CXM0P   ;3
       BPL    LD1B5   ;2
       LDA    $AB     ;3
       BNE    LD1B5   ;2
       LDA    $99     ;3
       SBC    #$05    ;2
       CMP    $9A     ;3
       BCS    LD1B5   ;2
       LDA    #$2F    ;2
       STA    $A6     ;3
LD1B5: LDA    $AC     ;3
       BEQ    LD200   ;2
       DEC    $AC     ;5
       LDX    $A3     ;3
       BEQ    LD1FD   ;2
LD1BF: DEC    $A3     ;5
       LDX    $A3     ;3
       BEQ    LD1FD   ;2
       LDY    $F0C2,X ;4
       LDX    $F0A2,Y ;4
       CPX    #$0D    ;2
       BEQ    LD1E4   ;2
       BCS    LD1BF   ;2
       LDA    #$11    ;2
       STA    $F022,Y ;5
LD1D6: LDA    LDDEF,X ;4
       STA    $F1     ;3
       LDA    LDDFD,X ;4
       JSR    LDC4E   ;6
       JMP    LD1BF   ;3
LD1E4: LDA.wy $00E0,Y ;4
       SEC            ;2
       SBC    #$09    ;2
       STA.wy $00E0,Y ;5
       LDX    #$0E    ;2
       CMP    #$58    ;2
       BCC    LD1F5   ;2
       LDX    #$0F    ;2
LD1F5: TXA            ;2
       STA    $F022,Y ;5
       LDX    #$09    ;2
       BNE    LD1D6   ;2
LD1FD: JMP    LD41C   ;3
LD200: LDA    $A7     ;3
       BNE    LD243   ;2
       LDA    $8E     ;3
       BNE    LD243   ;2
       LDX    $A3     ;3
       DEX            ;2
LD20B: DEX            ;2
       BMI    LD243   ;2
       LDA    $B0,X   ;4
       BPL    LD20B   ;2
       LDY    $F0C3,X ;4
       LDA    $99     ;3
       SBC    #$05    ;2
       CMP.wy $00E0,Y ;4
       BCS    LD243   ;2
       LDX    $F0A2,Y ;4
       CPX    #$0D    ;2
       BCC    LD25F   ;2
       BEQ    LD246   ;2
       CPX    #$10    ;2
       BEQ    LD282   ;2
       CPX    #$10    ;2
       BCS    LD243   ;2
       LDA    #$00    ;2
       STA    $F022,Y ;5
       LDX    $AF     ;3
       INC    $AF     ;5
       CLC            ;2
       LDA    LDE0D,X ;4
       JSR    LDC56   ;6
       LDA    #$D2    ;2
       STA    $91     ;3
LD243: JMP    LD2F5   ;3
LD246: LDA.wy $00E0,Y ;4
       SBC    #$09    ;2
       CMP    $99     ;3
       BCS    LD243   ;2
       STA.wy $00E0,Y ;5
       LDX    #$0E    ;2
       CMP    #$3A    ;2
       BCC    LD25A   ;2
       LDX    #$0F    ;2
LD25A: TXA            ;2
       LDX    #$09    ;2
       BNE    LD262   ;2
LD25F: LDA    LDDD7,X ;4
LD262: STA    $F022,Y ;5
       LDA    LDDEF,X ;4
       STA    $F1     ;3
       LDA    LDDFD,X ;4
       JSR    LDC4E   ;6
       LDA    #$0F    ;2
       STA    $A5     ;3
       LDA    #$76    ;2
       STA    $91     ;3
       LDA    $AB     ;3
       BNE    LD243   ;2
       LDA    #$2F    ;2
       STA    $A6     ;3
       BNE    LD243   ;2
LD282: LDA    $89     ;3
       CMP    #$10    ;2
       BCS    LD2B8   ;2
       LDX    $AF     ;3
       CPX    #$04    ;2
       BCC    LD2B8   ;2
       SED            ;2
       ADC    #$02    ;2
       STA    $89     ;3
       CLD            ;2
       LDA    $8A     ;3
       ADC    #$03    ;2
       STA    $8A     ;3
       LDY    #$09    ;2
       LDA    #$00    ;2
LD29E: DEY            ;2
       BMI    LD2B3   ;2
       LDX    $F0A2,Y ;4
       STA    $F022,Y ;5
       CPX    #$0D    ;2
       BCC    LD29E   ;2
       CPX    #$10    ;2
       BCS    LD29E   ;2
       INC    $AF     ;5
       BCC    LD29E   ;2
LD2B3: LDA    #$20    ;2
       JMP    LD477   ;3
LD2B8: LDX    #$09    ;2
LD2BA: DEX            ;2
       BMI    LD2E0   ;2
       LDA    $F0A2,X ;4
       CMP    #$0D    ;2
       BNE    LD2BA   ;2
       LDA    $F0B2,X ;4
       LSR            ;2
       STA    $F0     ;3
       LDA    $F082,X ;4
       ROR            ;2
       LSR    $F0     ;5
       ROR            ;2
       LSR            ;2
       LSR            ;2
       SEC            ;2
       SBC    #$08    ;2
       AND    #$3F    ;2
       BNE    LD2E2   ;2
       LDA    #$40    ;2
       STA    $99     ;3
       BNE    LD2E2   ;2
LD2E0: LDA    #$20    ;2
LD2E2: STA    $AD     ;3
       LDA    #$2E    ;2
       STA    $91     ;3
       LDX    $F081   ;4
       LDA    LDE15,X ;4
       STA    $85     ;3
       LDA    #$00    ;2
       STA    $F04C   ;4
LD2F5: LDA    $A7     ;3
       BNE    LD361   ;2
       LDA    CXP0FB  ;3
       BPL    LD361   ;2
       LDX    $A4     ;3
       BNE    LD314   ;2
       LDY    $F0C8   ;4
       LDA    LDD02,Y ;4
       EOR    #$FF    ;2
       AND    $D6     ;3
       STA    $D6     ;3
       LDA    #$00    ;2
       STA    $90     ;3
       JMP    LD355   ;3
LD314: LDY    $F0C2,X ;4
       LDX    $F0A2,Y ;4
       CPX    #$10    ;2
       BCS    LD361   ;2
       LDA    LDDD7,X ;4
       STA    $F022,Y ;5
       LDA    #$00    ;2
       STA    $90     ;3
       CPX    #$0D    ;2
       BNE    LD34A   ;2
       LDA.wy $00E0,Y ;4
       SBC    #$08    ;2
       CMP    $D7     ;3
       BCS    LD355   ;2
       STA.wy $00E0,Y ;5
       LDX    #$0E    ;2
       CMP    #$3A    ;2
       BCC    LD340   ;2
       LDX    #$0F    ;2
LD340: TXA            ;2
       STA    $F022,Y ;5
       LDX    #$BF    ;2
       STX    $90     ;3
       LDX    #$09    ;2
LD34A: LDA    LDDEF,X ;4
       STA    $F1     ;3
       LDA    LDDFD,X ;4
       JSR    LDC4E   ;6
LD355: LDA    #$00    ;2
       STA    $D7     ;3
       LDA    #$0F    ;2
       STA    $A5     ;3
       LDA    #$76    ;2
       STA    $91     ;3
LD361: LDA    $81     ;3
       LSR            ;2
       BCS    LD369   ;2
       JMP    LD454   ;3
LD369: LDX    $A9     ;3
       LDA    LDE3D,X ;4
       STA    $8F     ;3
       LDY    $A6     ;3
       BEQ    LD3EC   ;2
       CPY    #$2E    ;2
       BNE    LD385   ;2
       LDA    #$02    ;2
       STA    $90     ;3
       STA    $8E     ;3
       LDA    $99     ;3
       ADC    #$02    ;2
       STA    $F049   ;4
LD385: CPY    #$24    ;2
       BNE    LD3D7   ;2
       LDX    #$00    ;2
       STX    $99     ;3
       STX    $F0     ;3
       DEX            ;2
       STX    $8F     ;3
       LDA    #$02    ;2
       STA    $F041   ;4
       LDA    #$00    ;2
       LDX    #$09    ;2
LD39B: DEX            ;2
       BMI    LD3AA   ;2
       LDY    $F0A2,X ;4
       CPY    #$04    ;2
       BCS    LD39B   ;2
       STA    $F022,X ;5
       BCC    LD39B   ;2
LD3AA: LDY    #$0E    ;2
LD3AC: LDA    LDE5A,Y ;4
       STA.wy $00E0,Y ;5
       TYA            ;2
       AND    #$03    ;2
       STA    $F032,Y ;5
       LDX    $F0A2,Y ;4
       CPX    #$0D    ;2
       BCC    LD3D0   ;2
       CPX    #$10    ;2
       BCS    LD3D0   ;2
       LDA    LDC62,X ;4
       STA    $F022,Y ;5
       LDX    $F0     ;3
       JSR    LDC39   ;6
       STX    $F0     ;3
LD3D0: DEY            ;2
       BPL    LD3AC   ;2
       LDA    #$1F    ;2
       STA    $A7     ;3
LD3D7: DEC    $A6     ;5
       BNE    LD3EC   ;2
       STY    $F001   ;4
       DEY            ;2
       STY    $F04C   ;4
       LDA    #$53    ;2
       STA    $85     ;3
       LDA    #$49    ;2
       STA    $99     ;3
       DEC    $82     ;5
LD3EC: LDA    #$32    ;2
       CPY    #$24    ;2
       BCC    LD3F5   ;2
       LDA    LDE0D,Y ;4
LD3F5: STA    $F04A   ;4
       LDA    $A5     ;3
       BEQ    LD41C   ;2
       DEC    $A5     ;5
       AND    #$03    ;2
       BNE    LD41C   ;2
       LDA    $A5     ;3
       LSR            ;2
       LSR            ;2
       TAX            ;2
       LDA    LD100,X ;4
       LDX    #$0F    ;2
LD40C: DEX            ;2
       BMI    LD41C   ;2
       LDY    $F0A2,X ;4
       CPY    #$11    ;2
       BCC    LD40C   ;2
       STA    $F022,X ;5
       JMP    LD40C   ;3
LD41C: LDA    $A9     ;3
       BEQ    LD430   ;2
       CMP    #$1C    ;2
       BCS    LD430   ;2
       INC    $A9     ;5
       AND    #$03    ;2
       BNE    LD442   ;2
       LDA    #$05    ;2
       STA    $90     ;3
       BNE    LD442   ;2
LD430: LDA    $8E     ;3
       BNE    LD451   ;2
       LDA    $A7     ;3
       BEQ    LD442   ;2
       DEC    $A7     ;5
       CMP    #$19    ;2
       BNE    LD442   ;2
       LDA    #$2E    ;2
       STA    $91     ;3
LD442: LDX    #$2B    ;2
       LDA    SWCHA   ;4
       EOR    #$FF    ;2
       AND    #$C0    ;2
       BEQ    LD44F   ;2
       LDX    #$28    ;2
LD44F: STX    $92     ;3
LD451: JMP    LD5FF   ;3
LD454: LDA    $A8     ;3
       CMP    #$06    ;2
       BCS    LD484   ;2
       LDY    #$0E    ;2
LD45C: LDA    $F0A2,Y ;4
       CMP    #$04    ;2
       BCS    LD484   ;2
       DEY            ;2
       BPL    LD45C   ;2
       INC    $8A     ;5
       SED            ;2
       LDA    $89     ;3
       CLC            ;2
       ADC    #$01    ;2
       STA    $89     ;3
       CLD            ;2
       CMP    #$05    ;2
       BCC    LD477   ;2
       LDA    #$05    ;2
LD477: STA    $F04E   ;4
       LDA    #$D2    ;2
       STA    $AA     ;3
       STA    $8E     ;3
       LDA    #$0B    ;2
       STA    $A8     ;3
LD484: LDA    $A9     ;3
       BNE    LD4A4   ;2
       LDA    $D6     ;3
       BNE    LD4A4   ;2
       LDA    $AF     ;3
       BNE    LD4A4   ;2
       LDX    #$08    ;2
LD492: LDA    $F0A2,X ;4
       CMP    #$0D    ;2
       BCS    LD4A4   ;2
       DEX            ;2
       BPL    LD492   ;2
       LDA    #$01    ;2
       STA    $A9     ;3
       LDA    #$1F    ;2
       STA    $A7     ;3
LD4A4: LDA    $A9     ;3
       BEQ    LD4B9   ;2
       LDX    #$08    ;2
LD4AA: LDA    $F0A2,X ;4
       CMP    #$09    ;2
       BNE    LD4B6   ;2
       LDA    #$04    ;2
       STA    $F022,X ;5
LD4B6: DEX            ;2
       BPL    LD4AA   ;2
LD4B9: LDA    $81     ;3
       BEQ    LD4C0   ;2
LD4BD: JMP    LD56C   ;3
LD4C0: LDA    $8E     ;3
       BNE    LD4BD   ;2
       DEC    $A8     ;5
       BEQ    LD542   ;2
       LDA    $A8     ;3
       CMP    #$0A    ;2
       BEQ    LD4FC   ;2
       CMP    #$08    ;2
       BEQ    LD4DB   ;2
       CMP    #$06    ;2
       BNE    LD4BD   ;2
       LDX    #$02    ;2
       JMP    LD4DD   ;3
LD4DB: LDX    #$05    ;2
LD4DD: LDA    $89     ;3
       AND    #$0F    ;2
       TAY            ;2
       LDA    LDFE0,Y ;4
       STA    $F0     ;3
       LDY    #$03    ;2
LD4E9: LDA    $F0     ;3
       STA    $F022,X ;5
       TYA            ;2
       STA    $F032,X ;5
       LDA    #$87    ;2
       STA    $E0,X   ;4
       DEX            ;2
       DEY            ;2
       BNE    LD4E9   ;2
       BEQ    LD56C   ;2
LD4FC: LDA    #$02    ;2
       STA    $F041   ;4
       LDA    $89     ;3
       AND    #$0F    ;2
       TAX            ;2
       LDA    LDF7C,X ;4
       STA    $F0     ;3
       LDA    #$DF    ;2
       STA    $F1     ;3
       LDA    #$1F    ;2
       STA    $A7     ;3
       LDA    #$00    ;2
       STA    $F022   ;4
       STA    $F023   ;4
       STA    $F024   ;4
       STA    $F025   ;4
       STA    $F026   ;4
       STA    $F027   ;4
       LDX    $80     ;3
       LDY    #$08    ;2
LD52B: LDA    ($F0),Y ;5
       STA    $F028,Y ;5
       LDA    LDE5A,Y ;4
       STA.wy $00E6,Y ;5
       TXA            ;2
       AND    #$03    ;2
       STA    $F038,Y ;5
       INX            ;2
       DEY            ;2
       BPL    LD52B   ;2
       BMI    LD56C   ;2
LD542: LDA    #$02    ;2
       STA    $A8     ;3
       LDX    #$07    ;2
LD548: DEX            ;2
       BMI    LD56C   ;2
       LDA    $F0A2,X ;4
       BNE    LD548   ;2
       LDA    $80     ;3
       AND    #$07    ;2
       TAY            ;2
       LDA    LDDE7,Y ;4
       STA    $F022,X ;5
       LDA    #$01    ;2
       STA    $F032,X ;5
       STA    $F002,X ;5
       LDA    #$08    ;2
       STA    $F012,X ;5
       LDA    #$78    ;2
       STA    $E0,X   ;4
LD56C: LDA    $8E     ;3
       BNE    LD5D2   ;2
       LDA    INPT5   ;3
       BMI    LD598   ;2
       LDA    $F0CD   ;4
       BNE    LD5D2   ;2
       LDA    $83     ;3
       BEQ    LD591   ;2
       DEC    $83     ;5
       LDA    #$0F    ;2
       STA    $8F     ;3
       LDA    #$02    ;2
       STA    $AC     ;3
       LDA    #$02    ;2
       STA    $90     ;3
       LDA    #$0F    ;2
       STA    $A5     ;3
       BNE    LD5CF   ;2
LD591: LDA    $84     ;3
       BNE    LD5B3   ;2
       JMP    LD5BD   ;3
LD598: LDA    SWCHA   ;4
       EOR    #$FF    ;2
       AND    #$03    ;2
       BNE    LD5A6   ;2
       STA    $F04D   ;4
       BEQ    LD5D2   ;2
LD5A6: LDX    $F0CD   ;4
       BNE    LD5D2   ;2
       CMP    #$01    ;2
       BNE    LD5BD   ;2
       LDA    $84     ;3
       BEQ    LD5D2   ;2
LD5B3: DEC    $84     ;5
       LDA    $AB     ;3
       ADC    #$1E    ;2
       STA    $AB     ;3
       BNE    LD5CF   ;2
LD5BD: LDA    $80     ;3
       AND    #$3F    ;2
       CMP    #$0D    ;2
       BCS    LD5C9   ;2
       LDX    #$2F    ;2
       STX    $A6     ;3
LD5C9: STA    $AD     ;3
       LDA    #$2E    ;2
       STA    $91     ;3
LD5CF: STA    $F04D   ;4
LD5D2: LDX    $AF     ;3
       BEQ    LD5FF   ;2
       LDA    $99     ;3
       CMP    #$11    ;2
       BCS    LD5FF   ;2
       LDX    #$00    ;2
       LDA    $F080   ;4
       ADC    #$40    ;2
       SBC    $85     ;3
       BCS    LD5E8   ;2
       INX            ;2
LD5E8: JSR    LDC39   ;6
       LDA    $A6     ;3
       BNE    LD5FD   ;2
       LDA    $AA     ;3
       BNE    LD5FD   ;2
       LDA    #$E0    ;2
       STA    $91     ;3
       LDA    #$05    ;2
       CLC            ;2
       JSR    LDC56   ;6
LD5FD: DEC    $AF     ;5
LD5FF: LDA    $82     ;3
       BEQ    LD617   ;2
       LDA    $AD     ;3
       BEQ    LD60F   ;2
       DEC    $AD     ;5
       LDA    #$10    ;2
       STA    $98     ;3
       BNE    LD617   ;2
LD60F: LDY    #$00    ;2
       LDA    $A6     ;3
       BEQ    LD61A   ;2
       STY    $98     ;3
LD617: JMP    LD6CF   ;3
LD61A: LDA    #$FF    ;2
       EOR    SWCHA   ;4
       BNE    LD625   ;2
       LDX    INPT4   ;3
       BMI    LD62E   ;2
LD625: STY    $F07D   ;4
       LDX    $AA     ;3
       BNE    LD62E   ;2
       STY    $8E     ;3
LD62E: LDX    $8E     ;3
       BEQ    LD633   ;2
       TYA            ;2
LD633: STA    $F0     ;3
       LDX    $F081   ;4
       LDY    $F0CC   ;4
       AND    #$C0    ;2
       BEQ    LD64C   ;2
       ROL            ;2
       BCS    LD653   ;2
       LDX    #$00    ;2
       CPY    #$C0    ;2
       BEQ    LD65A   ;2
LD648: DEY            ;2
       JMP    LD65A   ;3
LD64C: TYA            ;2
       BEQ    LD65A   ;2
       BMI    LD659   ;2
       BPL    LD648   ;2
LD653: LDX    #$01    ;2
       CPY    #$40    ;2
       BEQ    LD65A   ;2
LD659: INY            ;2
LD65A: STY    $F04C   ;4
       STX    $F001   ;4
       TYA            ;2
       CPY    #$80    ;2
       ROR            ;2
       STA    $F1     ;3
       TYA            ;2
       LDY    #$00    ;2
       CLC            ;2
       ADC    $F0CB   ;4
       BPL    LD67B   ;2
LD66F: CMP    #$DF    ;2
       BCS    LD67F   ;2
       DEY            ;2
       ADC    #$20    ;2
       BNE    LD66F   ;2
LD678: INY            ;2
       SBC    #$20    ;2
LD67B: CMP    #$20    ;2
       BCS    LD678   ;2
LD67F: STA    $F04B   ;4
       STY    $98     ;3
       SEC            ;2
       LDA    $85     ;3
       TAY            ;2
       SBC    $F1     ;3
       AND    #$FE    ;2
       CPX    #$00    ;2
       BEQ    LD6A6   ;2
       CMP    #$52    ;2
       BEQ    LD6BA   ;2
       BCC    LD6AC   ;2
LD696: CPY    #$53    ;2
       BEQ    LD6BA   ;2
       BCC    LD6B2   ;2
LD69C: DEC    $85     ;5
       CPY    #$A3    ;2
       BCS    LD6BA   ;2
       INC    $98     ;5
       BCC    LD6BA   ;2
LD6A6: CMP    #$AE    ;2
       BEQ    LD6BA   ;2
       BCS    LD696   ;2
LD6AC: CPY    #$AE    ;2
       BEQ    LD6BA   ;2
       BCS    LD69C   ;2
LD6B2: INC    $85     ;5
       CPY    #$57    ;2
       BCC    LD6BA   ;2
       DEC    $98     ;5
LD6BA: LDA    $F0     ;3
       ASL            ;2
       ASL            ;2
       LDY    $99     ;3
       ASL            ;2
       BPL    LD6C6   ;2
       INY            ;2
       CPY    #$89    ;2
LD6C6: BCC    LD6CD   ;2
       CPY    #$09    ;2
       BCC    LD6CD   ;2
       DEY            ;2
LD6CD: STY    $99     ;3
LD6CF: LDA    $D8     ;3
       BEQ    LD6D8   ;2
       DEC    $D8     ;5
       JMP    LD70A   ;3
LD6D8: LDA    $8E     ;3
       BNE    LD70A   ;2
       LDY    INPT4   ;3
       BMI    LD70A   ;2
       LDA    #$4C    ;2
       STA    $90     ;3
       LDA    #$10    ;2
       STA    $D8     ;3
       LDX    $F081   ;4
       LDA    $85     ;3
       SEC            ;2
       SBC    LDF7A,X ;4
       LSR            ;2
       LSR            ;2
       ORA    LDE30,X ;4
       BMI    LD6FF   ;2
       STA    $F0     ;3
       LDA    #$27    ;2
       SEC            ;2
       SBC    $F0     ;3
LD6FF: STA    $D9     ;3
       LDA    $99     ;3
       AND    #$FE    ;2
       SEC            ;2
       SBC    #$03    ;2
       STA    $D7     ;3
LD70A: LDA    $D9     ;3
       AND    #$7F    ;2
       TAX            ;2
       BEQ    LD713   ;2
       DEC    $D9     ;5
LD713: LDA    $D9     ;3
       BMI    LD737   ;2
       LDA    #$00    ;2
       STA    $DA     ;3
       LDA    LDCA5,X ;4
       STA    $DB     ;3
       LDA    LDC72,X ;4
       STA    $DC     ;3
       LDA    LDC76,X ;4
       STA    $DD     ;3
       LDA    LDCB9,X ;4
       STA    $DE     ;3
       LDA    LDC86,X ;4
       STA    $DF     ;3
       JMP    LD754   ;3
LD737: LDA    #$00    ;2
       STA    $DF     ;3
       LDA    LDC85,X ;4
       STA    $DA     ;3
       LDA    LDC84,X ;4
       STA    $DB     ;3
       LDA    LDCB7,X ;4
       STA    $DC     ;3
       LDA    LDCB3,X ;4
       STA    $DD     ;3
       LDA    LDC70,X ;4
       STA    $DE     ;3
LD754: LDA    $81     ;3
       AND    #$0F    ;2
       TAY            ;2
       LDA    LDD12,Y ;4
       STA    $F0     ;3
       LDA    #$0F    ;2
       LDX    $8A     ;3
       CPX    #$0F    ;2
       BCS    LD767   ;2
       TXA            ;2
LD767: STA    $F2     ;3
       LDY    $AD     ;3
       BNE    LD79B   ;2
       ORA    #$05    ;2
       AND    $F0     ;3
       BEQ    LD785   ;2
       LDY    $D3     ;3
       LDA    $9A     ;3
       CMP    #$8C    ;2
       BCS    LD799   ;2
       ADC    LDD58,Y ;4
       AND    #$FE    ;2
       STA    $9A     ;3
       LDA    LDD68,Y ;4
LD785: SEC            ;2
       SBC    $98     ;3
       CLC            ;2
       ADC    $86     ;3
       STA    $86     ;3
       CMP    #$CF    ;2
       BCS    LD795   ;2
       CMP    #$32    ;2
       BCS    LD799   ;2
LD795: LDA    #$F0    ;2
       STA    $9A     ;3
LD799: LDA    $A7     ;3
LD79B: BNE    LD7EA   ;2
       LDA    $8E     ;3
       BNE    LD7EA   ;2
       LDA    $9A     ;3
       CMP    #$8C    ;2
       BCC    LD7F0   ;2
       LDX    $A3     ;3
       BEQ    LD7EA   ;2
LD7AB: DEX            ;2
       BEQ    LD7EA   ;2
       LDY    $F0C2,X ;4
       LDA    $F0A2,Y ;4
       CMP    #$09    ;2
       BEQ    LD7C4   ;2
       CMP    #$01    ;2
       BEQ    LD7C4   ;2
       CMP    #$0D    ;2
       BEQ    LD7C4   ;2
       CMP    #$04    ;2
       BNE    LD7AB   ;2
LD7C4: LDA    $80     ;3
       AND    #$03    ;2
       STA    $D3     ;3
       LDA    $F082,Y ;4
       ADC    #$03    ;2
       CMP    #$C6    ;2
       BCS    LD7EA   ;2
       STA    $86     ;3
       CMP    $85     ;3
       ROL    $D3     ;5
       LDA.wy $00E0,Y ;4
       SBC    #$03    ;2
       STA    $9A     ;3
       CMP    $99     ;3
       ROL    $D3     ;5
       LDA    #$B9    ;2
       STA    $90     ;3
       BNE    LD7F0   ;2
LD7EA: LDA    #$CF    ;2
       STA    $86     ;3
       STA    $9A     ;3
LD7F0: LDA    $8E     ;3
       BEQ    LD7F7   ;2
       JMP    LD86E   ;3
LD7F7: LDX    #$0F    ;2
LD7F9: LDY    $F0A2,X ;4
       LDA    LDD22,Y ;4
       ORA    $F2     ;3
       AND    $F0     ;3
       BEQ    LD813   ;2
       LDY    $F092,X ;4
       LDA    $E0,X   ;4
       CLC            ;2
       ADC    LDD47,Y ;4
       STA    $E0,X   ;4
       LDA    LDD36,Y ;4
LD813: LDY    $F082,X ;4
       STY    $F1     ;3
       SEC            ;2
       SBC    $98     ;3
       CLC            ;2
       BPL    LD842   ;2
       ADC    $F082,X ;4
       STA    $F002,X ;5
       LDA    $F0B2,X ;4
       ADC    #$FF    ;2
       AND    #$03    ;2
       BNE    LD83A   ;2
       LDY    $F0B2,X ;4
       BEQ    LD83A   ;2
       LDY    $D5     ;3
       CPY    #$05    ;2
       BCS    LD866   ;2
       INC    $D5     ;5
LD83A: STA    $F032,X ;5
       DEX            ;2
       BPL    LD7F9   ;2
       BMI    LD86E   ;2
LD842: ADC    $F082,X ;4
       STA    $F002,X ;5
       LDA    $F0B2,X ;4
       ADC    #$00    ;2
       AND    #$03    ;2
       BNE    LD85E   ;2
       LDY    $F0B2,X ;4
       BEQ    LD85E   ;2
       LDY    $D5     ;3
       CPY    #$05    ;2
       BCS    LD866   ;2
       INC    $D5     ;5
LD85E: STA    $F032,X ;5
       DEX            ;2
       BPL    LD7F9   ;2
       BMI    LD86E   ;2
LD866: LDA    $F1     ;3
       STA    $F002,X ;5
       DEX            ;2
       BPL    LD7F9   ;2
LD86E: LDX    $F0F9   ;4
       BPL    LD88D   ;2
       LDY    $F0FA   ;4
       LDX    LDCFA,Y ;4
       LDY    #$06    ;2
       LDA    #$00    ;2
LD87D: STA    $F04F,X ;5
       INX            ;2
       DEY            ;2
       BNE    LD87D   ;2
       LDX    #$0F    ;2
       LDA    $81     ;3
       AND    #$08    ;2
       BEQ    LD88D   ;2
       INX            ;2
LD88D: DEX            ;2
       BMI    LD8E7   ;2
       LDA    $F0A2,X ;4
       BEQ    LD88D   ;2
       LDA    $F082,X ;4
       ASL            ;2
       LDA    $F0B2,X ;4
       ROL            ;2
       CMP    $F0FA   ;4
       BNE    LD88D   ;2
       STX    $F079   ;4
       LDA    $F082,X ;4
       AND    #$7F    ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAY            ;2
       LDA    LDCEA,Y ;4
       STA    $F0     ;3
       LDA    LDCEE,Y ;4
       STA    $F1     ;3
       LDA    $E0,X   ;4
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAX            ;2
       LDA    LDCD8,X ;4
       LDY    $F0FA   ;4
       CLC            ;2
       ADC    LDCFA,Y ;4
       TAX            ;2
       LDA    $F0CE,X ;4
       ORA    $F0     ;3
       STA    $F04E,X ;5
       LDY    $F0F9   ;4
       LDA    $F0A2,Y ;4
       CMP    #$0D    ;2
       BNE    LD90B   ;2
       LDA    $F0CD,X ;4
       ORA    $F1     ;3
       STA    $F04D,X ;5
       BNE    LD90B   ;2
LD8E7: STX    $F079   ;4
       LDX    $F0FA   ;4
       LDY    LDCF2,X ;4
       STY    $F07A   ;4
       LDA    LDD02,Y ;4
       AND    $D6     ;3
       BEQ    LD905   ;2
       LDA    $F080   ;4
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAX            ;2
       LDA    LDD0A,X ;4
LD905: LDX    LDCFA,Y ;4
       STA    $F04E,X ;5
LD90B: LDA    $0285   ;4
       BPL    LD90B   ;2
       LDA    #$02    ;2
       STA    WSYNC   ;3
       STA    VSYNC   ;3
       LDA    $80     ;3
       ASL            ;2
       EOR    $80     ;3
       ASL            ;2
       EOR    $80     ;3
       ASL            ;2
       ASL            ;2
       EOR    $80     ;3
       ASL            ;2
       ROL    $80     ;5
       LDY    $99     ;3
       LDA    $AB     ;3
       BEQ    LD93A   ;2
       LDA    $81     ;3
       AND    #$03    ;2
       BEQ    LD935   ;2
       LDY    #$00    ;2
       BEQ    LD93A   ;2
LD935: DEC    $AB     ;5
       STA    $F04A   ;4
LD93A: STY    $F0     ;3
       LDX    $AF     ;3
       LDA    LDE17,X ;4
       STA    $95     ;3
       LDA    #$00    ;2
       STA    $94     ;3
       LDA    LDE20,X ;4
       SEC            ;2
       SBC    $F0     ;3
       STA    $96     ;3
       LDA    $F0     ;3
       ADC    #$05    ;2
       STA    $97     ;3
       LDX    #$01    ;2
LD957: LDA    $87,X   ;4
       SEC            ;2
       SBC    $98     ;3
       CMP    #$30    ;2
       BCC    LD964   ;2
       CMP    #$D0    ;2
       BCC    LD966   ;2
LD964: EOR    #$E0    ;2
LD966: STA    $87,X   ;4
       DEX            ;2
       BPL    LD957   ;2
       LDA    #$FE    ;2
       STA    $9C     ;3
       LDA    #$00    ;2
       CLC            ;2
       ADC    $A9     ;3
       STA    $9B     ;3
       LDA    $81     ;3
       AND    #$01    ;2
       TAX            ;2
       LDY    $90,X   ;4
       LDA    LDE7A,Y ;4
       BNE    LD98B   ;2
       LDY    $92,X   ;4
       STY    $90,X   ;4
       STA    $92,X   ;4
       JMP    LD99F   ;3
LD98B: INC    $90,X   ;6
       CMP    #$10    ;2
       BEQ    LD99D   ;2
       BCS    LD997   ;2
       STA    AUDC0,X ;4
       BCC    LD99F   ;2
LD997: STA    AUDF0,X ;4
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
LD99D: STA    AUDV0,X ;4
LD99F: LDA    #$00    ;2
       STA    WSYNC   ;3
       STA    VSYNC   ;3
       LDA    #$2A    ;2
       STA    TIM64T  ;4
       LDX    $F0FC   ;4
       BEQ    LD9CA   ;2
       DEX            ;2
       STX    $F07C   ;4
       LDA    #$06    ;2
       STA    AUDC0   ;3
       ASL            ;2
       STA    AUDF0   ;3
       LDA    #$01    ;2
       STA    AUDC1   ;3
       LDA    #$1A    ;2
       STA    AUDF1   ;3
       TXA            ;2
       STA    AUDV0   ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       STA    AUDV1   ;3
LD9CA: INC    $81     ;5
       BNE    LD9D9   ;2
       LDX    $F0FD   ;4
       INX            ;2
       BNE    LD9D6   ;2
       LDX    #$80    ;2
LD9D6: STX    $F07D   ;4
LD9D9: LDA    $81     ;3
       LSR            ;2
       BCC    LDA20   ;2
       LDX    #$00    ;2
       LDY    #$0F    ;2
LD9E2: LDA    $F0A2,Y ;4
       BEQ    LD9EF   ;2
       LDA    $F0B2,Y ;4
       BNE    LD9EF   ;2
       STY    $CE,X   ;4
       INX            ;2
LD9EF: DEY            ;2
       BPL    LD9E2   ;2
       STX    $F07B   ;4
       STX    $D5     ;3
       TXA            ;2
       BEQ    LDA1D   ;2
       STX    $F0     ;3
LD9FC: DEC    $F0     ;5
       BEQ    LDA1D   ;2
       LDY    #$00    ;2
LDA02: LDX    $CE,Y   ;4
       LDA    $E0,X   ;4
       INY            ;2
       LDX    $CE,Y   ;4
       CMP    $E0,X   ;4
       BCC    LDA17   ;2
       DEY            ;2
       LDA.wy $00CE,Y ;4
       STX    $CE,Y   ;4
       INY            ;2
       STA.wy $00CE,Y ;5
LDA17: CPY    $F0     ;3
       BNE    LDA02   ;2
       BEQ    LD9FC   ;2
LDA1D: JMP    LDB9B   ;3
LDA20: LDA    $A7     ;3
       BNE    LDA6D   ;2
       LDA    $80     ;3
       AND    #$03    ;2
       STA    $F0     ;3
       LDY    $F0FB   ;4
LDA2D: DEY            ;2
       BMI    LDA6D   ;2
       LDX    $CE,Y   ;4
       LDA    $F0A2,X ;4
       CMP    #$09    ;2
       BCS    LDA2D   ;2
       STY    $F2     ;3
       TAY            ;2
       LDA    #$00    ;2
       STA    $F1     ;3
       LDA    $F082,X ;4
       CMP    $85     ;3
       ROL    $F1     ;5
       LDA    $F082,X ;4
       EOR    $85     ;3
       AND    LDE28,Y ;4
       BNE    LDA64   ;2
       LDA    $E0,X   ;4
       CMP    $99     ;3
       LDA    $F1     ;3
       ROL            ;2
       ASL            ;2
       ASL            ;2
       ORA    $F0     ;3
LDA5C: STA    $F012,X ;5
       LDY    $F2     ;3
       JMP    LDA2D   ;3
LDA64: ROR    $F1     ;5
       LDA    #$04    ;2
       BCC    LDA5C   ;2
       ASL            ;2
       BCC    LDA5C   ;2
LDA6D: LDX    #$09    ;2
LDA6F: DEX            ;2
       BPL    LDA75   ;2
       JMP    LDB30   ;3
LDA75: LDA    $F0A2,X ;4
       CMP    #$09    ;2
       BEQ    LDAE1   ;2
       CMP    #$0E    ;2
       BEQ    LDAA3   ;2
       CMP    #$0D    ;2
       BEQ    LDACF   ;2
       CMP    #$0F    ;2
       BNE    LDA6F   ;2
       LDA    #$0C    ;2
       STA    $F012,X ;5
       LDA    $E0,X   ;4
       CMP    #$1B    ;2
       BCS    LDA6F   ;2
       LDA    #$11    ;2
       STA    $F022,X ;5
       LDA    #$0F    ;2
       STA    $A5     ;3
LDA9C: LDA    #$05    ;2
       STA    $91     ;3
LDAA0: JMP    LDA6F   ;3
LDAA3: LDA    #$0C    ;2
       STA    $F012,X ;5
       LDA    $E0,X   ;4
       CMP    #$1B    ;2
       BCS    LDA6F   ;2
       LDA    #$00    ;2
       STA    $F022,X ;5
       LDA    $F082,X ;4
       ASL            ;2
       LDA    $F0B2,X ;4
       ROL            ;2
       TAX            ;2
       JSR    LDC39   ;6
       LDA    #$02    ;2
       STA    $F1     ;3
       LDA    #$50    ;2
       JSR    LDC4E   ;6
       LDA    #$E0    ;2
       STA    $91     ;3
       JMP    LDA6F   ;3
LDACF: LDA    #$00    ;2
       STA    $F012,X ;5
       LDA    $E0,X   ;4
       CMP    #$84    ;2
       BCC    LDA6F   ;2
       LDA    #$04    ;2
       STA    $F022,X ;5
       BNE    LDA9C   ;2
LDAE1: TXA            ;2
       AND    #$01    ;2
       TAY            ;2
       LDA    $E0,X   ;4
       CMP    #$1D    ;2
       BCS    LDB27   ;2
       LDA    $80     ;3
       BMI    LDA6F   ;2
       LDA    LDFFA,Y ;4
       STA    $F012,X ;5
       LDA    $F080   ;4
       AND    #$7C    ;2
       STA    $F0     ;3
       LDA    $F082,X ;4
       AND    #$7C    ;2
       CMP    $F0     ;3
       BNE    LDAA0   ;2
       LDA    $F082,X ;4
       ASL            ;2
       LDA    $F0B2,X ;4
       ROL            ;2
       TAY            ;2
       LDA    $D6     ;3
       AND    LDD02,Y ;4
       BEQ    LDAA0   ;2
       EOR    #$FF    ;2
       AND    $D6     ;3
       STA    $D6     ;3
       LDA    #$0D    ;2
       STA    $F022,X ;5
       LDA    #$6B    ;2
       STA    $91     ;3
       JMP    LDA6F   ;3
LDB27: LDA    LDFFE,Y ;4
       STA    $F012,X ;5
       JMP    LDA6F   ;3
LDB30: LDY    $F0FB   ;4
       BEQ    LDB6D   ;2
       DEY            ;2
       DEY            ;2
LDB37: INY            ;2
LDB38: CPY    #$02    ;2
       BCC    LDB6D   ;2
       STY    $F0     ;3
       LDX    $CE,Y   ;4
       STX    $F1     ;3
       LDA    $E0,X   ;4
       DEY            ;2
       DEY            ;2
       LDX    $CE,Y   ;4
       SEC            ;2
       SBC    $E0,X   ;4
       CMP    #$15    ;2
       BCS    LDB37   ;2
       DEC    $E0,X   ;6
       LDY    $F0A2,X ;4
       LDA    LDDB1,Y ;4
       STA    $F012,X ;5
       LDX    $F1     ;3
       INC    $E0,X   ;6
       LDY    $F0A2,X ;4
       LDA    LDD8B,Y ;4
       STA    $F012,X ;5
       LDY    $F0     ;3
       DEY            ;2
       JMP    LDB38   ;3
LDB6D: LDX    #$19    ;2
       LDA    $A9     ;3
       BEQ    LDB75   ;2
       LDX    #$11    ;2
LDB75: STX    $F0     ;3
       LDX    #$0E    ;2
LDB79: LDY    $F0A2,X ;4
       LDA    $E0,X   ;4
       CMP    #$86    ;2
       BCC    LDB8C   ;2
       DEC    $E0,X   ;6
       LDA    LDD9E,Y ;4
       STA    $F012,X ;5
       BCS    LDB98   ;2
LDB8C: CMP    $F0     ;3
       BCS    LDB98   ;2
       INC    $E0,X   ;6
       LDA    LDD78,Y ;4
       STA    $F012,X ;5
LDB98: DEX            ;2
       BPL    LDB79   ;2
LDB9B: LDA    $F0FB   ;4
       BEQ    LDBC0   ;2
       STA    $F1     ;3
       LDX    #$00    ;2
       STX    $A2     ;3
LDBA6: LDY    $CE,X   ;4
       LDA    $F082,Y ;4
       CMP    #$30    ;2
       BCC    LDBBB   ;2
       CMP    #$D0    ;2
       BCS    LDBBB   ;2
       TYA            ;2
       LDY    $A2     ;3
       STA    $F043,Y ;5
       INC    $A2     ;5
LDBBB: INX            ;2
       CPX    $F1     ;3
       BNE    LDBA6   ;2
LDBC0: LDY    $A2     ;3
       BNE    LDBC7   ;2
       JMP    LDBF9   ;3
LDBC7: DEY            ;2
LDBC8: TYA            ;2
       BEQ    LDBF9   ;2
       LDX    $F0C3,Y ;4
       LDA    $F0A2,X ;4
       STA    $F0     ;3
       LDA    $E0,X   ;4
       DEY            ;2
       LDX    $F0C3,Y ;4
       CLC            ;2
       ADC    #$08    ;2
       SEC            ;2
       SBC    $E0,X   ;4
       LDX    $F0     ;3
       CMP    LDDC4,X ;4
       BCS    LDBC8   ;2
       STY    $F0     ;3
       LDA    $81     ;3
       EOR    $F0     ;3
       AND    #$01    ;2
       ADC    $F0     ;3
       TAX            ;2
       LDA    #$FF    ;2
       STA    $F043,X ;5
       JMP    LDBC8   ;3
LDBF9: LDA    #$6C    ;2
       STA    $EF     ;3
       LDA    $F080   ;4
       SEC            ;2
       SBC    $98     ;3
       STA    $F000   ;4
       BPL    LDC1C   ;2
       AND    #$7F    ;2
       STA    $F000   ;4
       LDA    $D6     ;3
       LDY    $98     ;3
       BMI    LDC19   ;2
       LSR            ;2
       ROR    $D6     ;5
       JMP    LDC1C   ;3
LDC19: ASL            ;2
       ROL    $D6     ;5
LDC1C: LDX    #$00    ;2
       LDA    $F080   ;4
       CMP    #$30    ;2
       BCC    LDC2E   ;2
       CMP    #$50    ;2
       BCS    LDC2F   ;2
       LDA    $81     ;3
       LSR            ;2
       BCS    LDC2F   ;2
LDC2E: INX            ;2
LDC2F: LDY    #$00    ;2
       LDA    $D6     ;3
       AND    LDD02,X ;4
       JMP    LDFF2   ;3
LDC39: DEX            ;2
LDC3A: INX            ;2
       TXA            ;2
       AND    #$07    ;2
       TAX            ;2
       LDA    $D6     ;3
       AND    LDD02,X ;4
       BNE    LDC3A   ;2
       LDA    LDD02,X ;4
       ORA    $D6     ;3
       STA    $D6     ;3
       RTS            ;6

LDC4E: SED            ;2
       CLC            ;2
       ADC    $8D     ;3
       STA    $8D     ;3
       LDA    $F1     ;3
LDC56: SED            ;2
       ADC    $8C     ;3
       STA    $8C     ;3
       BCC    LDC6D   ;2
       LDA    #$00    ;2
       ADC    $8B     ;3
       STA    $8B     ;3
       INC    $82     ;5
       INC    $83     ;5
       INC    $84     ;5
       LDA    #$8B    ;2
       STA    $93     ;3
LDC6D: CLD            ;2
       RTS            ;6

       .byte $09 ; |    X  X| $DC6F
LDC70: .byte $00 ; |        | $DC70
       .byte $00 ; |        | $DC71
LDC72: .byte $00 ; |        | $DC72
       .byte $00 ; |        | $DC73
       .byte $00 ; |        | $DC74
       .byte $00 ; |        | $DC75
LDC76: .byte $00 ; |        | $DC76
       .byte $00 ; |        | $DC77
       .byte $00 ; |        | $DC78
       .byte $00 ; |        | $DC79
       .byte $00 ; |        | $DC7A
       .byte $00 ; |        | $DC7B
       .byte $00 ; |        | $DC7C
       .byte $00 ; |        | $DC7D
       .byte $00 ; |        | $DC7E
       .byte $00 ; |        | $DC7F
       .byte $00 ; |        | $DC80
       .byte $00 ; |        | $DC81
       .byte $00 ; |        | $DC82
       .byte $00 ; |        | $DC83
LDC84: .byte $00 ; |        | $DC84
LDC85: .byte $00 ; |        | $DC85
LDC86: .byte $00 ; |        | $DC86
       .byte $80 ; |X       | $DC87
       .byte $C0 ; |XX      | $DC88
       .byte $E0 ; |XXX     | $DC89
       .byte $F0 ; |XXXX    | $DC8A
       .byte $F8 ; |XXXXX   | $DC8B
       .byte $FC ; |XXXXXX  | $DC8C
       .byte $FE ; |XXXXXXX | $DC8D
       .byte $FF ; |XXXXXXXX| $DC8E
       .byte $FF ; |XXXXXXXX| $DC8F
       .byte $FF ; |XXXXXXXX| $DC90
       .byte $FF ; |XXXXXXXX| $DC91
       .byte $FF ; |XXXXXXXX| $DC92
       .byte $FF ; |XXXXXXXX| $DC93
       .byte $FF ; |XXXXXXXX| $DC94
       .byte $FF ; |XXXXXXXX| $DC95
       .byte $FF ; |XXXXXXXX| $DC96
       .byte $FF ; |XXXXXXXX| $DC97
       .byte $FF ; |XXXXXXXX| $DC98
       .byte $FF ; |XXXXXXXX| $DC99
       .byte $FF ; |XXXXXXXX| $DC9A
       .byte $FF ; |XXXXXXXX| $DC9B
       .byte $FF ; |XXXXXXXX| $DC9C
       .byte $3F ; |  XXXXXX| $DC9D
       .byte $0F ; |    XXXX| $DC9E
       .byte $03 ; |      XX| $DC9F
       .byte $00 ; |        | $DCA0
       .byte $00 ; |        | $DCA1
       .byte $00 ; |        | $DCA2
       .byte $00 ; |        | $DCA3
       .byte $00 ; |        | $DCA4
LDCA5: .byte $00 ; |        | $DCA5
       .byte $00 ; |        | $DCA6
       .byte $00 ; |        | $DCA7
       .byte $00 ; |        | $DCA8
       .byte $00 ; |        | $DCA9
       .byte $00 ; |        | $DCAA
       .byte $00 ; |        | $DCAB
       .byte $00 ; |        | $DCAC
       .byte $00 ; |        | $DCAD
       .byte $00 ; |        | $DCAE
       .byte $00 ; |        | $DCAF
       .byte $00 ; |        | $DCB0
       .byte $00 ; |        | $DCB1
       .byte $00 ; |        | $DCB2
LDCB3: .byte $00 ; |        | $DCB3
       .byte $00 ; |        | $DCB4
       .byte $00 ; |        | $DCB5
       .byte $00 ; |        | $DCB6
LDCB7: .byte $00 ; |        | $DCB7
       .byte $00 ; |        | $DCB8
LDCB9: .byte $00 ; |        | $DCB9
       .byte $00 ; |        | $DCBA
       .byte $00 ; |        | $DCBB
       .byte $00 ; |        | $DCBC
       .byte $00 ; |        | $DCBD
       .byte $00 ; |        | $DCBE
       .byte $00 ; |        | $DCBF
       .byte $00 ; |        | $DCC0
       .byte $00 ; |        | $DCC1
       .byte $01 ; |       X| $DCC2
       .byte $03 ; |      XX| $DCC3
       .byte $07 ; |     XXX| $DCC4
       .byte $0F ; |    XXXX| $DCC5
       .byte $1F ; |   XXXXX| $DCC6
       .byte $3F ; |  XXXXXX| $DCC7
       .byte $7F ; | XXXXXXX| $DCC8
       .byte $FF ; |XXXXXXXX| $DCC9
       .byte $FF ; |XXXXXXXX| $DCCA
       .byte $FF ; |XXXXXXXX| $DCCB
       .byte $FF ; |XXXXXXXX| $DCCC
       .byte $FF ; |XXXXXXXX| $DCCD
       .byte $FF ; |XXXXXXXX| $DCCE
       .byte $FF ; |XXXXXXXX| $DCCF
       .byte $FF ; |XXXXXXXX| $DCD0
       .byte $FF ; |XXXXXXXX| $DCD1
       .byte $FF ; |XXXXXXXX| $DCD2
       .byte $FF ; |XXXXXXXX| $DCD3
       .byte $FC ; |XXXXXX  | $DCD4
       .byte $F0 ; |XXXX    | $DCD5
       .byte $C0 ; |XX      | $DCD6
       .byte $00 ; |        | $DCD7
LDCD8: .byte $FF ; |XXXXXXXX| $DCD8
       .byte $00 ; |        | $DCD9
       .byte $00 ; |        | $DCDA
       .byte $01 ; |       X| $DCDB
       .byte $01 ; |       X| $DCDC
       .byte $02 ; |      X | $DCDD
       .byte $02 ; |      X | $DCDE
       .byte $03 ; |      XX| $DCDF
       .byte $03 ; |      XX| $DCE0
       .byte $03 ; |      XX| $DCE1
       .byte $04 ; |     X  | $DCE2
       .byte $04 ; |     X  | $DCE3
       .byte $05 ; |     X X| $DCE4
       .byte $05 ; |     X X| $DCE5
       .byte $06 ; |     XX | $DCE6
       .byte $06 ; |     XX | $DCE7
       .byte $06 ; |     XX | $DCE8
       .byte $06 ; |     XX | $DCE9
LDCEA: .byte $C0 ; |XX      | $DCEA
       .byte $30 ; |  XX    | $DCEB
       .byte $0C ; |    XX  | $DCEC
       .byte $03 ; |      XX| $DCED
LDCEE: .byte $80 ; |X       | $DCEE
       .byte $20 ; |  X     | $DCEF
       .byte $08 ; |    X   | $DCF0
       .byte $02 ; |      X | $DCF1
LDCF2: .byte $01 ; |       X| $DCF2
       .byte $02 ; |      X | $DCF3
       .byte $03 ; |      XX| $DCF4
       .byte $06 ; |     XX | $DCF5
       .byte $00 ; |        | $DCF6
       .byte $00 ; |        | $DCF7
       .byte $07 ; |     XXX| $DCF8
       .byte $00 ; |        | $DCF9
LDCFA: .byte $0F ; |    XXXX| $DCFA
       .byte $16 ; |   X XX | $DCFB
       .byte $1D ; |   XXX X| $DCFC
       .byte $24 ; |  X  X  | $DCFD
       .byte $00 ; |        | $DCFE
       .byte $00 ; |        | $DCFF
       .byte $01 ; |       X| $DD00
       .byte $08 ; |    X   | $DD01
LDD02: .byte $01 ; |       X| $DD02
       .byte $02 ; |      X | $DD03
       .byte $04 ; |     X  | $DD04
       .byte $08 ; |    X   | $DD05
       .byte $10 ; |   X    | $DD06
       .byte $20 ; |  X     | $DD07
       .byte $40 ; | X      | $DD08
       .byte $80 ; |X       | $DD09
LDD0A: .byte $80 ; |X       | $DD0A
       .byte $40 ; | X      | $DD0B
       .byte $20 ; |  X     | $DD0C
       .byte $10 ; |   X    | $DD0D
       .byte $08 ; |    X   | $DD0E
       .byte $04 ; |     X  | $DD0F
       .byte $02 ; |      X | $DD10
       .byte $01 ; |       X| $DD11
LDD12: .byte $01 ; |       X| $DD12
       .byte $08 ; |    X   | $DD13
       .byte $04 ; |     X  | $DD14
       .byte $08 ; |    X   | $DD15
       .byte $02 ; |      X | $DD16
       .byte $08 ; |    X   | $DD17
       .byte $04 ; |     X  | $DD18
       .byte $08 ; |    X   | $DD19
       .byte $00 ; |        | $DD1A
       .byte $08 ; |    X   | $DD1B
       .byte $04 ; |     X  | $DD1C
       .byte $08 ; |    X   | $DD1D
       .byte $02 ; |      X | $DD1E
       .byte $08 ; |    X   | $DD1F
       .byte $04 ; |     X  | $DD20
       .byte $08 ; |    X   | $DD21
LDD22: .byte $00 ; |        | $DD22
       .byte $0B ; |    X XX| $DD23
       .byte $09 ; |    X  X| $DD24
       .byte $08 ; |    X   | $DD25
       .byte $06 ; |     XX | $DD26
       .byte $07 ; |     XXX| $DD27
       .byte $05 ; |     X X| $DD28
       .byte $06 ; |     XX | $DD29
       .byte $09 ; |    X  X| $DD2A
       .byte $03 ; |      XX| $DD2B
       .byte $03 ; |      XX| $DD2C
       .byte $03 ; |      XX| $DD2D
       .byte $06 ; |     XX | $DD2E
       .byte $03 ; |      XX| $DD2F
       .byte $04 ; |     X  | $DD30
       .byte $04 ; |     X  | $DD31
       .byte $00 ; |        | $DD32
       .byte $00 ; |        | $DD33
       .byte $00 ; |        | $DD34
       .byte $00 ; |        | $DD35
LDD36: .byte $00 ; |        | $DD36
       .byte $01 ; |       X| $DD37
       .byte $01 ; |       X| $DD38
       .byte $02 ; |      X | $DD39
       .byte $02 ; |      X | $DD3A
       .byte $02 ; |      X | $DD3B
       .byte $01 ; |       X| $DD3C
       .byte $01 ; |       X| $DD3D
       .byte $FE ; |XXXXXXX | $DD3E
       .byte $FE ; |XXXXXXX | $DD3F
       .byte $FF ; |XXXXXXXX| $DD40
       .byte $FF ; |XXXXXXXX| $DD41
       .byte $00 ; |        | $DD42
       .byte $FF ; |XXXXXXXX| $DD43
       .byte $FF ; |XXXXXXXX| $DD44
       .byte $FE ; |XXXXXXX | $DD45
       .byte $00 ; |        | $DD46
LDD47: .byte $01 ; |       X| $DD47
       .byte $02 ; |      X | $DD48
       .byte $01 ; |       X| $DD49
       .byte $01 ; |       X| $DD4A
       .byte $00 ; |        | $DD4B
       .byte $FF ; |XXXXXXXX| $DD4C
       .byte $FF ; |XXXXXXXX| $DD4D
       .byte $FE ; |XXXXXXX | $DD4E
       .byte $00 ; |        | $DD4F
       .byte $01 ; |       X| $DD50
       .byte $01 ; |       X| $DD51
       .byte $02 ; |      X | $DD52
       .byte $FF ; |XXXXXXXX| $DD53
       .byte $FE ; |XXXXXXX | $DD54
       .byte $FF ; |XXXXXXXX| $DD55
       .byte $FF ; |XXXXXXXX| $DD56
       .byte $00 ; |        | $DD57
LDD58: .byte $02 ; |      X | $DD58
       .byte $FE ; |XXXXXXX | $DD59
       .byte $02 ; |      X | $DD5A
       .byte $FE ; |XXXXXXX | $DD5B
       .byte $02 ; |      X | $DD5C
       .byte $FE ; |XXXXXXX | $DD5D
       .byte $02 ; |      X | $DD5E
       .byte $FE ; |XXXXXXX | $DD5F
       .byte $04 ; |     X  | $DD60
       .byte $FC ; |XXXXXX  | $DD61
       .byte $04 ; |     X  | $DD62
       .byte $FC ; |XXXXXX  | $DD63
       .byte $02 ; |      X | $DD64
       .byte $FE ; |XXXXXXX | $DD65
       .byte $02 ; |      X | $DD66
       .byte $FE ; |XXXXXXX | $DD67
LDD68: .byte $01 ; |       X| $DD68
       .byte $01 ; |       X| $DD69
       .byte $FF ; |XXXXXXXX| $DD6A
       .byte $FF ; |XXXXXXXX| $DD6B
       .byte $02 ; |      X | $DD6C
       .byte $02 ; |      X | $DD6D
       .byte $FE ; |XXXXXXX | $DD6E
       .byte $FE ; |XXXXXXX | $DD6F
       .byte $01 ; |       X| $DD70
       .byte $01 ; |       X| $DD71
       .byte $FF ; |XXXXXXXX| $DD72
       .byte $FF ; |XXXXXXXX| $DD73
       .byte $00 ; |        | $DD74
       .byte $00 ; |        | $DD75
       .byte $00 ; |        | $DD76
       .byte $00 ; |        | $DD77
LDD78: .byte $00 ; |        | $DD78
       .byte $09 ; |    X  X| $DD79
       .byte $03 ; |      XX| $DD7A
       .byte $0B ; |    X XX| $DD7B
       .byte $03 ; |      XX| $DD7C
       .byte $09 ; |    X  X| $DD7D
       .byte $03 ; |      XX| $DD7E
       .byte $0B ; |    X XX| $DD7F
       .byte $09 ; |    X  X| $DD80
       .byte $09 ; |    X  X| $DD81
       .byte $02 ; |      X | $DD82
       .byte $0A ; |    X X | $DD83
       .byte $0A ; |    X X | $DD84
       .byte $00 ; |        | $DD85
       .byte $00 ; |        | $DD86
       .byte $00 ; |        | $DD87
       .byte $10 ; |   X    | $DD88
       .byte $00 ; |        | $DD89
       .byte $00 ; |        | $DD8A
LDD8B: .byte $00 ; |        | $DD8B
       .byte $0A ; |    X X | $DD8C
       .byte $02 ; |      X | $DD8D
       .byte $0A ; |    X X | $DD8E
       .byte $02 ; |      X | $DD8F
       .byte $0A ; |    X X | $DD90
       .byte $02 ; |      X | $DD91
       .byte $0A ; |    X X | $DD92
       .byte $0A ; |    X X | $DD93
       .byte $0A ; |    X X | $DD94
       .byte $0A ; |    X X | $DD95
       .byte $02 ; |      X | $DD96
       .byte $03 ; |      XX| $DD97
       .byte $00 ; |        | $DD98
       .byte $00 ; |        | $DD99
       .byte $00 ; |        | $DD9A
       .byte $10 ; |   X    | $DD9B
       .byte $00 ; |        | $DD9C
       .byte $00 ; |        | $DD9D
LDD9E: .byte $00 ; |        | $DD9E
       .byte $0F ; |    XXXX| $DD9F
       .byte $05 ; |     X X| $DDA0
       .byte $0D ; |    XX X| $DDA1
       .byte $05 ; |     X X| $DDA2
       .byte $0F ; |    XXXX| $DDA3
       .byte $05 ; |     X X| $DDA4
       .byte $0D ; |    XX X| $DDA5
       .byte $0F ; |    XXXX| $DDA6
       .byte $0F ; |    XXXX| $DDA7
       .byte $06 ; |     XX | $DDA8
       .byte $0C ; |    XX  | $DDA9
       .byte $05 ; |     X X| $DDAA
       .byte $0C ; |    XX  | $DDAB
       .byte $0C ; |    XX  | $DDAC
       .byte $0C ; |    XX  | $DDAD
       .byte $10 ; |   X    | $DDAE
       .byte $0C ; |    XX  | $DDAF
       .byte $0C ; |    XX  | $DDB0
LDDB1: .byte $0C ; |    XX  | $DDB1
       .byte $0E ; |    XXX | $DDB2
       .byte $06 ; |     XX | $DDB3
       .byte $0E ; |    XXX | $DDB4
       .byte $06 ; |     XX | $DDB5
       .byte $0E ; |    XXX | $DDB6
       .byte $06 ; |     XX | $DDB7
       .byte $0E ; |    XXX | $DDB8
       .byte $06 ; |     XX | $DDB9
       .byte $0E ; |    XXX | $DDBA
       .byte $0E ; |    XXX | $DDBB
       .byte $0D ; |    XX X| $DDBC
       .byte $0E ; |    XXX | $DDBD
       .byte $0C ; |    XX  | $DDBE
       .byte $0C ; |    XX  | $DDBF
       .byte $0C ; |    XX  | $DDC0
       .byte $10 ; |   X    | $DDC1
       .byte $0C ; |    XX  | $DDC2
       .byte $0C ; |    XX  | $DDC3
LDDC4: .byte $0C ; |    XX  | $DDC4
       .byte $12 ; |   X  X | $DDC5
       .byte $13 ; |   X  XX| $DDC6
       .byte $15 ; |   X X X| $DDC7
       .byte $16 ; |   X XX | $DDC8
       .byte $15 ; |   X X X| $DDC9
       .byte $19 ; |   XX  X| $DDCA
       .byte $19 ; |   XX  X| $DDCB
       .byte $11 ; |   X   X| $DDCC
       .byte $16 ; |   X XX | $DDCD
       .byte $13 ; |   X  XX| $DDCE
       .byte $15 ; |   X X X| $DDCF
       .byte $16 ; |   X XX | $DDD0
       .byte $1F ; |   XXXXX| $DDD1
       .byte $16 ; |   X XX | $DDD2
       .byte $16 ; |   X XX | $DDD3
       .byte $17 ; |   X XXX| $DDD4
       .byte $17 ; |   X XXX| $DDD5
       .byte $18 ; |   XX   | $DDD6
LDDD7: .byte $19 ; |   XX  X| $DDD7
       .byte $11 ; |   X   X| $DDD8
       .byte $11 ; |   X   X| $DDD9
       .byte $11 ; |   X   X| $DDDA
       .byte $11 ; |   X   X| $DDDB
       .byte $11 ; |   X   X| $DDDC
       .byte $07 ; |     XXX| $DDDD
       .byte $08 ; |    X   | $DDDE
       .byte $11 ; |   X   X| $DDDF
       .byte $11 ; |   X   X| $DDE0
       .byte $11 ; |   X   X| $DDE1
       .byte $06 ; |     XX | $DDE2
       .byte $11 ; |   X   X| $DDE3
       .byte $09 ; |    X  X| $DDE4
       .byte $11 ; |   X   X| $DDE5
       .byte $11 ; |   X   X| $DDE6
LDDE7: .byte $01 ; |       X| $DDE7
       .byte $01 ; |       X| $DDE8
       .byte $01 ; |       X| $DDE9
       .byte $01 ; |       X| $DDEA
       .byte $03 ; |      XX| $DDEB
       .byte $03 ; |      XX| $DDEC
       .byte $02 ; |      X | $DDED
       .byte $02 ; |      X | $DDEE
LDDEF: .byte $00 ; |        | $DDEF
       .byte $02 ; |      X | $DDF0
       .byte $00 ; |        | $DDF1
       .byte $02 ; |      X | $DDF2
       .byte $01 ; |       X| $DDF3
       .byte $02 ; |      X | $DDF4
       .byte $01 ; |       X| $DDF5
       .byte $01 ; |       X| $DDF6
       .byte $01 ; |       X| $DDF7
       .byte $01 ; |       X| $DDF8
       .byte $02 ; |      X | $DDF9
       .byte $05 ; |     X X| $DDFA
       .byte $02 ; |      X | $DDFB
       .byte $01 ; |       X| $DDFC
LDDFD: .byte $00 ; |        | $DDFD
       .byte $00 ; |        | $DDFE
       .byte $50 ; | X X    | $DDFF
       .byte $00 ; |        | $DE00
       .byte $50 ; | X X    | $DE01
       .byte $00 ; |        | $DE02
       .byte $50 ; | X X    | $DE03
       .byte $50 ; | X X    | $DE04
       .byte $50 ; | X X    | $DE05
       .byte $50 ; | X X    | $DE06
       .byte $00 ; |        | $DE07
       .byte $00 ; |        | $DE08
       .byte $50 ; | X X    | $DE09
       .byte $50 ; | X X    | $DE0A
       .byte $00 ; |        | $DE0B
       .byte $00 ; |        | $DE0C
LDE0D: .byte $05 ; |     X X| $DE0D
       .byte $10 ; |   X    | $DE0E
       .byte $15 ; |   X X X| $DE0F
       .byte $20 ; |  X     | $DE10
       .byte $20 ; |  X     | $DE11
       .byte $20 ; |  X     | $DE12
       .byte $20 ; |  X     | $DE13
       .byte $20 ; |  X     | $DE14
LDE15: .byte $AE ; |X X XXX | $DE15
       .byte $53 ; | X X  XX| $DE16
LDE17: .byte $FF ; |XXXXXXXX| $DE17
       .byte $FD ; |XXXXXX X| $DE18
       .byte $FD ; |XXXXXX X| $DE19
       .byte $FD ; |XXXXXX X| $DE1A
       .byte $FD ; |XXXXXX X| $DE1B
       .byte $FD ; |XXXXXX X| $DE1C
       .byte $FD ; |XXXXXX X| $DE1D
       .byte $FD ; |XXXXXX X| $DE1E
       .byte $FD ; |XXXXXX X| $DE1F
LDE20: .byte $90 ; |X  X    | $DE20
       .byte $9A ; |X  XX X | $DE21
       .byte $9A ; |X  XX X | $DE22
       .byte $9A ; |X  XX X | $DE23
       .byte $9A ; |X  XX X | $DE24
       .byte $9A ; |X  XX X | $DE25
       .byte $9A ; |X  XX X | $DE26
       .byte $9A ; |X  XX X | $DE27
LDE28: .byte $9A ; |X  XX X | $DE28
       .byte $80 ; |X       | $DE29
       .byte $80 ; |X       | $DE2A
       .byte $80 ; |X       | $DE2B
       .byte $F8 ; |XXXXX   | $DE2C
       .byte $80 ; |X       | $DE2D
       .byte $80 ; |X       | $DE2E
       .byte $80 ; |X       | $DE2F
LDE30: .byte $80 ; |X       | $DE30
       .byte $00 ; |        | $DE31
       .byte $34 ; |  XX X  | $DE32
       .byte $82 ; |X     X | $DE33
       .byte $88 ; |X   X   | $DE34
       .byte $C2 ; |XX    X | $DE35
       .byte $C8 ; |XX  X   | $DE36
       .byte $32 ; |  XX  X | $DE37
       .byte $36 ; |  XX XX | $DE38
       .byte $32 ; |  XX  X | $DE39
       .byte $36 ; |  XX XX | $DE3A
       .byte $32 ; |  XX  X | $DE3B
       .byte $36 ; |  XX XX | $DE3C
LDE3D: .byte $00 ; |        | $DE3D
       .byte $8E ; |X   XXX | $DE3E
       .byte $8C ; |X   XX  | $DE3F
       .byte $88 ; |X   X   | $DE40
       .byte $86 ; |X    XX | $DE41
       .byte $84 ; |X    X  | $DE42
       .byte $82 ; |X     X | $DE43
       .byte $80 ; |X       | $DE44
       .byte $68 ; | XX X   | $DE45
       .byte $66 ; | XX  XX | $DE46
       .byte $64 ; | XX  X  | $DE47
       .byte $22 ; |  X   X | $DE48
       .byte $88 ; |X   X   | $DE49
       .byte $86 ; |X    XX | $DE4A
       .byte $84 ; |X    X  | $DE4B
       .byte $82 ; |X     X | $DE4C
       .byte $80 ; |X       | $DE4D
       .byte $48 ; | X  X   | $DE4E
       .byte $46 ; | X   XX | $DE4F
       .byte $42 ; | X    X | $DE50
       .byte $40 ; | X      | $DE51
       .byte $C8 ; |XX  X   | $DE52
       .byte $C6 ; |XX   XX | $DE53
       .byte $C4 ; |XX   X  | $DE54
       .byte $C2 ; |XX    X | $DE55
       .byte $06 ; |     XX | $DE56
       .byte $04 ; |     X  | $DE57
       .byte $02 ; |      X | $DE58
       .byte $00 ; |        | $DE59
LDE5A: .byte $82 ; |X     X | $DE5A
       .byte $82 ; |X     X | $DE5B
       .byte $82 ; |X     X | $DE5C
       .byte $82 ; |X     X | $DE5D
       .byte $6E ; | XX XXX | $DE5E
       .byte $6E ; | XX XXX | $DE5F
       .byte $6E ; | XX XXX | $DE60
       .byte $6E ; | XX XXX | $DE61
       .byte $5A ; | X XX X | $DE62
       .byte $40 ; | X      | $DE63
       .byte $50 ; | X X    | $DE64
       .byte $60 ; | XX     | $DE65
       .byte $50 ; | X X    | $DE66
       .byte $40 ; | X      | $DE67
       .byte $46 ; | X   XX | $DE68
       .byte $46 ; | X   XX | $DE69
LDE6A: .byte $10 ; |   X    | $DE6A
       .byte $20 ; |  X     | $DE6B
       .byte $30 ; |  XX    | $DE6C
       .byte $40 ; | X      | $DE6D
       .byte $50 ; | X X    | $DE6E
       .byte $60 ; | XX     | $DE6F
       .byte $70 ; | XXX    | $DE70
       .byte $80 ; |X       | $DE71
       .byte $90 ; |X  X    | $DE72
       .byte $A0 ; |X X     | $DE73
       .byte $10 ; |   X    | $DE74
       .byte $20 ; |  X     | $DE75
       .byte $30 ; |  XX    | $DE76
       .byte $40 ; | X      | $DE77
       .byte $50 ; | X X    | $DE78
       .byte $80 ; |X       | $DE79
LDE7A: .byte $10 ; |   X    | $DE7A
       .byte $00 ; |        | $DE7B
       .byte $03 ; |      XX| $DE7C
       .byte $E4 ; |XXX  X  | $DE7D
       .byte $E2 ; |XXX   X | $DE7E
       .byte $08 ; |    X   | $DE7F
       .byte $E7 ; |XXX  XXX| $DE80
       .byte $E9 ; |XXX X  X| $DE81
       .byte $A9 ; |X X X  X| $DE82
       .byte $CB ; |XX  X XX| $DE83
       .byte $CD ; |XX  XX X| $DE84
       .byte $AF ; |X X XXXX| $DE85
       .byte $B0 ; |X XX    | $DE86
       .byte $F3 ; |XXXX  XX| $DE87
       .byte $F5 ; |XXXX X X| $DE88
       .byte $97 ; |X  X XXX| $DE89
       .byte $D9 ; |XX XX  X| $DE8A
       .byte $D8 ; |XX XX   | $DE8B
       .byte $FD ; |XXXXXX X| $DE8C
       .byte $FE ; |XXXXXXX | $DE8D
       .byte $FF ; |XXXXXXXX| $DE8E
       .byte $FF ; |XXXXXXXX| $DE8F
       .byte $FF ; |XXXXXXXX| $DE90
       .byte $FF ; |XXXXXXXX| $DE91
       .byte $DF ; |XX XXXXX| $DE92
       .byte $DF ; |XX XXXXX| $DE93
       .byte $BF ; |X XXXXXX| $DE94
       .byte $BF ; |X XXXXXX| $DE95
       .byte $9F ; |X  XXXXX| $DE96
       .byte $7F ; | XXXXXXX| $DE97
       .byte $7C ; | XXXXX  | $DE98
       .byte $03 ; |      XX| $DE99
       .byte $7B ; | XXXX XX| $DE9A
       .byte $9A ; |X  XX X | $DE9B
       .byte $78 ; | XXXX   | $DE9C
       .byte $57 ; | X X XXX| $DE9D
       .byte $35 ; |  XX X X| $DE9E
       .byte $34 ; |  XX X  | $DE9F
       .byte $14 ; |   X X  | $DEA0
       .byte $00 ; |        | $DEA1
       .byte $08 ; |    X   | $DEA2
       .byte $37 ; |  XX XXX| $DEA3
       .byte $00 ; |        | $DEA4
       .byte $08 ; |    X   | $DEA5
       .byte $18 ; |   XX   | $DEA6
       .byte $00 ; |        | $DEA7
       .byte $08 ; |    X   | $DEA8
       .byte $9F ; |X  XXXXX| $DEA9
       .byte $9E ; |X  XXXX | $DEAA
       .byte $7D ; | XXXXX X| $DEAB
       .byte $7C ; | XXXXX  | $DEAC
       .byte $7B ; | XXXX XX| $DEAD
       .byte $7A ; | XXXX X | $DEAE
       .byte $79 ; | XXXX  X| $DEAF
       .byte $78 ; | XXXX   | $DEB0
       .byte $77 ; | XXX XXX| $DEB1
       .byte $76 ; | XXX XX | $DEB2
       .byte $75 ; | XXX X X| $DEB3
       .byte $74 ; | XXX X  | $DEB4
       .byte $73 ; | XXX  XX| $DEB5
       .byte $72 ; | XXX  X | $DEB6
       .byte $71 ; | XXX   X| $DEB7
       .byte $70 ; | XXX    | $DEB8
       .byte $6F ; | XX XXXX| $DEB9
       .byte $6E ; | XX XXX | $DEBA
       .byte $6D ; | XX XX X| $DEBB
       .byte $6C ; | XX XX  | $DEBC
       .byte $6B ; | XX X XX| $DEBD
       .byte $6A ; | XX X X | $DEBE
       .byte $49 ; | X  X  X| $DEBF
       .byte $48 ; | X  X   | $DEC0
       .byte $74 ; | XXX X  | $DEC1
       .byte $46 ; | X   XX | $DEC2
       .byte $45 ; | X   X X| $DEC3
       .byte $44 ; | X   X  | $DEC4
       .byte $00 ; |        | $DEC5
       .byte $08 ; |    X   | $DEC6
       .byte $44 ; | X   X  | $DEC7
       .byte $45 ; | X   X X| $DEC8
       .byte $46 ; | X   XX | $DEC9
       .byte $47 ; | X   XXX| $DECA
       .byte $48 ; | X  X   | $DECB
       .byte $49 ; | X  X  X| $DECC
       .byte $4A ; | X  X X | $DECD
       .byte $4B ; | X  X XX| $DECE
       .byte $4C ; | X  XX  | $DECF
       .byte $4D ; | X  XX X| $DED0
       .byte $4E ; | X  XXX | $DED1
       .byte $4F ; | X  XXXX| $DED2
       .byte $50 ; | X X    | $DED3
       .byte $51 ; | X X   X| $DED4
       .byte $52 ; | X X  X | $DED5
       .byte $53 ; | X X  XX| $DED6
       .byte $54 ; | X X X  | $DED7
       .byte $55 ; | X X X X| $DED8
       .byte $56 ; | X X XX | $DED9
       .byte $57 ; | X X XXX| $DEDA
       .byte $58 ; | X XX   | $DEDB
       .byte $59 ; | X XX  X| $DEDC
       .byte $5A ; | X XX X | $DEDD
       .byte $5B ; | X XX XX| $DEDE
       .byte $5C ; | X XXX  | $DEDF
       .byte $5D ; | X XXX X| $DEE0
       .byte $5E ; | X XXXX | $DEE1
       .byte $5F ; | X XXXXX| $DEE2
       .byte $10 ; |   X    | $DEE3
       .byte $00 ; |        | $DEE4
       .byte $05 ; |     X X| $DEE5
       .byte $4F ; | X  XXXX| $DEE6
       .byte $4C ; | X  XX  | $DEE7
       .byte $4B ; | X  X XX| $DEE8
       .byte $4D ; | X  XX X| $DEE9
       .byte $4C ; | X  XX  | $DEEA
       .byte $4B ; | X  X XX| $DEEB
       .byte $4D ; | X  XX X| $DEEC
       .byte $4E ; | X  XXX | $DEED
       .byte $4F ; | X  XXXX| $DEEE
       .byte $00 ; |        | $DEEF
       .byte $02 ; |      X | $DEF0
       .byte $E4 ; |XXX  X  | $DEF1
       .byte $E4 ; |XXX  X  | $DEF2
       .byte $84 ; |X    X  | $DEF3
       .byte $64 ; | XX  X  | $DEF4
       .byte $10 ; |   X    | $DEF5
       .byte $A6 ; |X X  XX | $DEF6
       .byte $86 ; |X    XX | $DEF7
       .byte $66 ; | XX  XX | $DEF8
       .byte $10 ; |   X    | $DEF9
       .byte $66 ; | XX  XX | $DEFA
       .byte $46 ; | X   XX | $DEFB
       .byte $26 ; |  X  XX | $DEFC
       .byte $10 ; |   X    | $DEFD
       .byte $26 ; |  X  XX | $DEFE
       .byte $26 ; |  X  XX | $DEFF
       .byte $10 ; |   X    | $DF00
       .byte $10 ; |   X    | $DF01
       .byte $26 ; |  X  XX | $DF02
       .byte $10 ; |   X    | $DF03
       .byte $00 ; |        | $DF04
       .byte $0D ; |    XX X| $DF05
       .byte $7B ; | XXXX XX| $DF06
       .byte $7A ; | XXXX X | $DF07
       .byte $79 ; | XXXX  X| $DF08
       .byte $78 ; | XXXX   | $DF09
       .byte $7B ; | XXXX XX| $DF0A
       .byte $7A ; | XXXX X | $DF0B
       .byte $79 ; | XXXX  X| $DF0C
       .byte $76 ; | XXX XX | $DF0D
       .byte $7B ; | XXXX XX| $DF0E
       .byte $7A ; | XXXX X | $DF0F
       .byte $79 ; | XXXX  X| $DF10
       .byte $74 ; | XXX X  | $DF11
       .byte $7B ; | XXXX XX| $DF12
       .byte $7A ; | XXXX X | $DF13
       .byte $79 ; | XXXX  X| $DF14
       .byte $73 ; | XXX  XX| $DF15
       .byte $7B ; | XXXX XX| $DF16
       .byte $7A ; | XXXX X | $DF17
       .byte $79 ; | XXXX  X| $DF18
       .byte $71 ; | XXX   X| $DF19
       .byte $7B ; | XXXX XX| $DF1A
       .byte $7A ; | XXXX X | $DF1B
       .byte $79 ; | XXXX  X| $DF1C
       .byte $6F ; | XX XXXX| $DF1D
       .byte $7B ; | XXXX XX| $DF1E
       .byte $7A ; | XXXX X | $DF1F
       .byte $79 ; | XXXX  X| $DF20
       .byte $6E ; | XX XXX | $DF21
       .byte $7B ; | XXXX XX| $DF22
       .byte $7A ; | XXXX X | $DF23
       .byte $79 ; | XXXX  X| $DF24
       .byte $6C ; | XX XX  | $DF25
       .byte $7B ; | XXXX XX| $DF26
       .byte $7A ; | XXXX X | $DF27
       .byte $79 ; | XXXX  X| $DF28
       .byte $6B ; | XX X XX| $DF29
       .byte $7B ; | XXXX XX| $DF2A
       .byte $7A ; | XXXX X | $DF2B
       .byte $79 ; | XXXX  X| $DF2C
       .byte $6A ; | XX X X | $DF2D
       .byte $7B ; | XXXX XX| $DF2E
       .byte $7A ; | XXXX X | $DF2F
       .byte $79 ; | XXXX  X| $DF30
       .byte $69 ; | XX X  X| $DF31
       .byte $00 ; |        | $DF32
       .byte $01 ; |       X| $DF33
       .byte $62 ; | XX   X | $DF34
       .byte $63 ; | XX   XX| $DF35
       .byte $44 ; | X   X  | $DF36
       .byte $49 ; | X  X  X| $DF37
       .byte $00 ; |        | $DF38
       .byte $05 ; |     X X| $DF39
       .byte $63 ; | XX   XX| $DF3A
       .byte $6F ; | XX XXXX| $DF3B
       .byte $70 ; | XXX    | $DF3C
       .byte $71 ; | XXX   X| $DF3D
       .byte $72 ; | XXX  X | $DF3E
       .byte $73 ; | XXX  XX| $DF3F
       .byte $54 ; | X X X  | $DF40
       .byte $55 ; | X X X X| $DF41
       .byte $56 ; | X X XX | $DF42
       .byte $57 ; | X X XXX| $DF43
       .byte $58 ; | X XX   | $DF44
       .byte $59 ; | X XX  X| $DF45
       .byte $3A ; |  XXX X | $DF46
       .byte $3C ; |  XXXX  | $DF47
       .byte $3E ; |  XXXXX | $DF48
       .byte $3F ; |  XXXXXX| $DF49
       .byte $1F ; |   XXXXX| $DF4A
       .byte $00 ; |        | $DF4B
       .byte $05 ; |     X X| $DF4C
       .byte $68 ; | XX X   | $DF4D
       .byte $6A ; | XX X X | $DF4E
       .byte $6C ; | XX XX  | $DF4F
       .byte $6F ; | XX XXXX| $DF50
       .byte $68 ; | XX X   | $DF51
       .byte $6A ; | XX X X | $DF52
       .byte $6C ; | XX XX  | $DF53
       .byte $6F ; | XX XXXX| $DF54
       .byte $68 ; | XX X   | $DF55
       .byte $6A ; | XX X X | $DF56
       .byte $6C ; | XX XX  | $DF57
       .byte $6F ; | XX XXXX| $DF58
       .byte $00 ; |        | $DF59
       .byte $0A ; |    X X | $DF5A
       .byte $C9 ; |XX  X  X| $DF5B
       .byte $87 ; |X    XXX| $DF5C
       .byte $85 ; |X    X X| $DF5D
       .byte $84 ; |X    X  | $DF5E
       .byte $83 ; |X     XX| $DF5F
       .byte $81 ; |X      X| $DF60
       .byte $10 ; |   X    | $DF61
       .byte $C9 ; |XX  X  X| $DF62
       .byte $87 ; |X    XXX| $DF63
       .byte $85 ; |X    X X| $DF64
       .byte $84 ; |X    X  | $DF65
       .byte $83 ; |X     XX| $DF66
       .byte $81 ; |X      X| $DF67
       .byte $10 ; |   X    | $DF68
       .byte $C9 ; |XX  X  X| $DF69
       .byte $67 ; | XX  XXX| $DF6A
       .byte $65 ; | XX  X X| $DF6B
       .byte $64 ; | XX  X  | $DF6C
       .byte $63 ; | XX   XX| $DF6D
       .byte $61 ; | XX    X| $DF6E
       .byte $10 ; |   X    | $DF6F
       .byte $89 ; |X   X  X| $DF70
       .byte $47 ; | X   XXX| $DF71
       .byte $45 ; | X   X X| $DF72
       .byte $44 ; | X   X  | $DF73
       .byte $43 ; | X    XX| $DF74
       .byte $41 ; | X     X| $DF75
       .byte $00 ; |        | $DF76
       .byte $0D ; |    XX X| $DF77
       .byte $F1 ; |XXXX   X| $DF78
       .byte $51 ; | X X   X| $DF79
LDF7A: .byte $30 ; |  XX    | $DF7A
       .byte $28 ; |  X X   | $DF7B
LDF7C: .byte $86 ; |X    XX | $DF7C
       .byte $8F ; |X   XXXX| $DF7D
       .byte $98 ; |X  XX   | $DF7E
       .byte $A1 ; |X X    X| $DF7F
LDF80: .byte $AA ; |X X X X | $DF80
       .byte $B3 ; |X XX  XX| $DF81
       .byte $BC ; |X XXXX  | $DF82
       .byte $C5 ; |XX   X X| $DF83
       .byte $CE ; |XX  XXX | $DF84
       .byte $D7 ; |XX X XXX| $DF85
       .byte $09 ; |    X  X| $DF86
       .byte $09 ; |    X  X| $DF87
       .byte $09 ; |    X  X| $DF88
       .byte $0C ; |    XX  | $DF89
       .byte $0C ; |    XX  | $DF8A
       .byte $0C ; |    XX  | $DF8B
       .byte $0A ; |    X X | $DF8C
       .byte $0A ; |    X X | $DF8D
       .byte $00 ; |        | $DF8E
       .byte $09 ; |    X  X| $DF8F
       .byte $09 ; |    X  X| $DF90
       .byte $09 ; |    X  X| $DF91
       .byte $05 ; |     X X| $DF92
       .byte $0C ; |    XX  | $DF93
       .byte $0A ; |    X X | $DF94
       .byte $05 ; |     X X| $DF95
       .byte $05 ; |     X X| $DF96
       .byte $05 ; |     X X| $DF97
       .byte $09 ; |    X  X| $DF98
       .byte $09 ; |    X  X| $DF99
       .byte $09 ; |    X  X| $DF9A
       .byte $0B ; |    X XX| $DF9B
       .byte $0C ; |    XX  | $DF9C
       .byte $0B ; |    X XX| $DF9D
       .byte $0A ; |    X X | $DF9E
       .byte $05 ; |     X X| $DF9F
       .byte $0C ; |    XX  | $DFA0
       .byte $09 ; |    X  X| $DFA1
       .byte $09 ; |    X  X| $DFA2
       .byte $09 ; |    X  X| $DFA3
       .byte $0B ; |    X XX| $DFA4
       .byte $0C ; |    XX  | $DFA5
       .byte $0C ; |    XX  | $DFA6
       .byte $0A ; |    X X | $DFA7
       .byte $0B ; |    X XX| $DFA8
       .byte $0A ; |    X X | $DFA9
       .byte $0C ; |    XX  | $DFAA
       .byte $0C ; |    XX  | $DFAB
       .byte $0A ; |    X X | $DFAC
       .byte $0A ; |    X X | $DFAD
       .byte $05 ; |     X X| $DFAE
       .byte $05 ; |     X X| $DFAF
       .byte $05 ; |     X X| $DFB0
       .byte $05 ; |     X X| $DFB1
       .byte $05 ; |     X X| $DFB2
       .byte $09 ; |    X  X| $DFB3
       .byte $09 ; |    X  X| $DFB4
       .byte $09 ; |    X  X| $DFB5
       .byte $0B ; |    X XX| $DFB6
       .byte $0B ; |    X XX| $DFB7
       .byte $0C ; |    XX  | $DFB8
       .byte $0C ; |    XX  | $DFB9
       .byte $0A ; |    X X | $DFBA
       .byte $0B ; |    X XX| $DFBB
       .byte $09 ; |    X  X| $DFBC
       .byte $09 ; |    X  X| $DFBD
       .byte $09 ; |    X  X| $DFBE
       .byte $05 ; |     X X| $DFBF
       .byte $0B ; |    X XX| $DFC0
       .byte $05 ; |     X X| $DFC1
       .byte $0B ; |    X XX| $DFC2
       .byte $05 ; |     X X| $DFC3
       .byte $0B ; |    X XX| $DFC4
       .byte $09 ; |    X  X| $DFC5
       .byte $09 ; |    X  X| $DFC6
       .byte $09 ; |    X  X| $DFC7
       .byte $05 ; |     X X| $DFC8
       .byte $0C ; |    XX  | $DFC9
       .byte $0A ; |    X X | $DFCA
       .byte $0B ; |    X XX| $DFCB
       .byte $0B ; |    X XX| $DFCC
       .byte $05 ; |     X X| $DFCD
       .byte $09 ; |    X  X| $DFCE
       .byte $09 ; |    X  X| $DFCF
       .byte $09 ; |    X  X| $DFD0
       .byte $0B ; |    X XX| $DFD1
       .byte $0C ; |    XX  | $DFD2
       .byte $05 ; |     X X| $DFD3
       .byte $0B ; |    X XX| $DFD4
       .byte $0C ; |    XX  | $DFD5
       .byte $05 ; |     X X| $DFD6
       .byte $0C ; |    XX  | $DFD7
       .byte $0C ; |    XX  | $DFD8
       .byte $0C ; |    XX  | $DFD9
       .byte $0C ; |    XX  | $DFDA
       .byte $0C ; |    XX  | $DFDB
       .byte $0C ; |    XX  | $DFDC
       .byte $0B ; |    X XX| $DFDD
       .byte $0B ; |    X XX| $DFDE
       .byte $0B ; |    X XX| $DFDF
LDFE0: .byte $09 ; |    X  X| $DFE0
       .byte $09 ; |    X  X| $DFE1
       .byte $09 ; |    X  X| $DFE2
       .byte $09 ; |    X  X| $DFE3
       .byte $05 ; |     X X| $DFE4
       .byte $09 ; |    X  X| $DFE5
       .byte $09 ; |    X  X| $DFE6
       .byte $09 ; |    X  X| $DFE7
       .byte $09 ; |    X  X| $DFE8
       .byte $0C ; |    XX  | $DFE9
       .byte $00 ; |        | $DFEA
       .byte $00 ; |        | $DFEB
       .byte $00 ; |        | $DFEC
       .byte $00 ; |        | $DFED
       .byte $00 ; |        | $DFEE
       .byte $00 ; |        | $DFEF
       .byte $00 ; |        | $DFF0
       .byte $00 ; |        | $DFF1
LDFF2: .byte $8D,$F9,$FF,$4C,$6C,$D1,$00,$00
LDFFA: .byte $08,$04,$03,$D1
LDFFE: .byte $0F,$05
