; Disassembly of towerinf.bin
; Disassembled Sun Mar 06 22:23:29 2005
; Using DiStella v2.0
;
; Command Line: C:\BIN\DISTELLA.EXE -pafsctowerinf.cfg towerinf.bin 
;
; towerinf.cfg contents:
;
;      CODE B000 B10F
;      GFX B110 B128
;      CODE B129 B19C
;      GFX B19D B1AC
;      CODE B1AD B21D
;      GFX B21E B225
;      CODE B226 B369
;      GFX B36A B36A
;      CODE B36B B487
;      GFX B488 B5CF
;      CODE B5D0 B7D7
;      GFX B7D8 B835
;      CODE B836 B995
;      GFX B996 B999
;      CODE B99A BA2D
;      GFX BA2E BA37
;      CODE BA38 BACD
;      GFX BACE BAE5
;      CODE BAE6 BB97
;      GFX BB98 BBC9
;      CODE BBCA BD21
;      GFX BD22 BD34
;      CODE BD35 BF4D
;      GFX BF4E BF7B
;      CODE BF7C BFB0
;      GFX BFB1 BFFF

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
CXM0P   =  $30
CXM1P   =  $31
CXP1FB  =  $33
CXM1FB  =  $35
CXPPMM  =  $37
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296


ORIGJOY = 0 ;0 = swap left/right joysticks


       ORG $B000

START:
       CLD                            ;2
       LDX    #$FF                    ;2
       TXS                            ;2
       LDA    #$00                    ;2
LB006: STA    VSYNC,X                 ;4
       DEX                            ;2
       BNE    LB006                   ;2
       INX                            ;2
       STX    $80                     ;3
       LDA    #$29                    ;2
       STA    TIM64T                  ;4
       LDA    #$AA                    ;2
       STA    $EC                     ;3
       STA    $ED                     ;3
LB019: LDX    #$30                    ;2
       LDA    #$00                    ;2
LB01D: STA    $AF,X                   ;4
       DEX                            ;2
       BNE    LB01D                   ;2
       STX    $99                     ;3
       STX    COLUBK                  ;3
       STX    $AD                     ;3
       STX    HMCLR                   ;3
       STX    $F7                     ;3
       STX    $A9                     ;3
       STX    $AA                     ;3
       STX    $F6                     ;3
       INX                            ;2
       STX    $98                     ;3
       LDA    #$10                    ;2
       STA    $AF                     ;3
       LDX    $80                     ;3
       CPX    #$02                    ;2
       BNE    LB049                   ;2
       LDA    $AE                     ;3
       AND    #$0F                    ;2
       BEQ    LB04B                   ;2
       DEC    $AE                     ;5
       BPL    LB04B                   ;2
LB049: STA    $AE                     ;3
LB04B: LDA    #$A6                    ;2
       STA    $EB                     ;3
       JMP    LB9DD                   ;3
LB052: LDA    $EB                     ;3
       AND    #$01                    ;2
       TAX                            ;2
       RTS                            ;6

LB058: LDA    #$00                    ;2
       STA    $9E                     ;3
       STA    $9F                     ;3
       LDA    $80                     ;3
       BMI    LB068                   ;2
       INC    $9F                     ;5
       LDA    #$11                    ;2
       STA    $AF                     ;3
LB068: LDA    #$00                    ;2
       STA    $A9                     ;3
       STA    $AA                     ;3
       STA    $E1                     ;3
       STA    $E0                     ;3
       LDA    $F7                     ;3
       AND    #$0F                    ;2
       ORA    $9E                     ;3
       STA    $9E                     ;3
       BEQ    LB07F                   ;2
       JSR    LB435                   ;6
LB07F: LDA    #$50                    ;2
       STA    NUSIZ1                  ;3
       JSR    LBD08                   ;6
       LDX    #$FF                    ;2
       STX    $E6                     ;3
       STX    $E7                     ;3
       INX                            ;2
       STX    $BF                     ;3
       STX    $AB                     ;3
       LDA    #$04                    ;2
       STA    $F5                     ;3
       STA    $E3                     ;3
       LDA    #$3C                    ;2
       STA    $EA                     ;3
       LDA    $AC                     ;3
       STA    $E9                     ;3
       JSR    LB052                   ;6
       LSR                            ;2
       LDA    SWCHB                   ;4
       BCC    LB0A9                   ;2
       ASL                            ;2
LB0A9: BMI    LB0AF                   ;2
       LDA    #$FB                    ;2
       BNE    LB0B1                   ;2
LB0AF: LDA    #$FF                    ;2
LB0B1: STA    $F0                     ;3
       LDA    #$3B                    ;2
       STA    $96                     ;3
       INC    $9E,X                   ;6
       LDA    $AE,X                   ;4
       AND    #$0F                    ;2
       TAY                            ;2
       LDA    LB110,Y                 ;4
       STA    $E8                     ;3
       LDX    #$00                    ;2
LB0C5: LDA    LB11A,X                 ;4
       BPL    LB0D4                   ;2
       JSR    LB1AD                   ;6
       STA    $C0,X                   ;4
       LDA    $ED                     ;3
       JMP    LB0D6                   ;3
LB0D4: STA    $C0,X                   ;4
LB0D6: STA    $D0,X                   ;4
       INX                            ;2
       CPX    #$0F                    ;2
       BNE    LB0C5                   ;2
       LDA    $EC                     ;3
       CPY    #$09                    ;2
       BEQ    LB0FE                   ;2
       STA    $9D                     ;3
       LDA    $ED                     ;3
       STA    $9C                     ;3
       LSR                            ;2
       BCC    LB0F2                   ;2
       LDA    $9D                     ;3
       AND    #$FB                    ;2
       STA    $9D                     ;3
LB0F2: LDA    $9C                     ;3
       AND    #$03                    ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       STA    $92                     ;3
       BPL    LB10A                   ;2
LB0FE: ORA    #$84                    ;2
       STA    $9D                     ;3
       LDA    $ED                     ;3
       STA    $9C                     ;3
       LDA    #$30                    ;2
       STA    $92                     ;3
LB10A: JSR    LB129                   ;6
       JMP    LB5D0                   ;3

LB110: .byte $74 ; | XXX X  | $B110
       .byte $16 ; |   X XX | $B111
       .byte $26 ; |  X  XX | $B112
       .byte $36 ; |  XX XX | $B113
       .byte $64 ; | XX  X  | $B114
       .byte $86 ; |X    XX | $B115
       .byte $C4 ; |XX   X  | $B116
       .byte $D6 ; |XX X XX | $B117
       .byte $E6 ; |XXX  XX | $B118
       .byte $F6 ; |XXXX XX | $B119
LB11A: .byte $77 ; | XXX XXX| $B11A
       .byte $77 ; | XXX XXX| $B11B
       .byte $77 ; | XXX XXX| $B11C
       .byte $FF ; |XXXXXXXX| $B11D
       .byte $FF ; |XXXXXXXX| $B11E
       .byte $FF ; |XXXXXXXX| $B11F
       .byte $FF ; |XXXXXXXX| $B120
       .byte $FF ; |XXXXXXXX| $B121
       .byte $FF ; |XXXXXXXX| $B122
       .byte $FF ; |XXXXXXXX| $B123
       .byte $FF ; |XXXXXXXX| $B124
       .byte $FF ; |XXXXXXXX| $B125
       .byte $FF ; |XXXXXXXX| $B126
       .byte $77 ; | XXX XXX| $B127
       .byte $77 ; | XXX XXX| $B128

LB129: LDX    #$FF                    ;2
       STX    $94                     ;3
       INX                            ;2
       STX    $95                     ;3
       STX    $A8                     ;3
       STX    REFP1                   ;3
       STX    CXCLR                   ;3
       STX    $F2                     ;3
       STX    $F3                     ;3
       INX                            ;2
       STX    $93                     ;3
       INX                            ;2
       STX    $E2                     ;3
       LDA    #$10                    ;2
       STA    $F4                     ;3
       LDA    #$0F                    ;2
       STA    $E4                     ;3
       STA    WSYNC                   ;3
       LDX    #$08                    ;2
LB14C: DEX                            ;2
       BNE    LB14C                   ;2
       STA    RESP1                   ;3
       STA    RESM1                   ;3
       LDA    #$E0                    ;2
       STA    HMP1                    ;3
       LDA    #$62                    ;2
       STA    $81                     ;3
       LDA    #$80                    ;2
       STA    $82                     ;3
LB15F: STA    WSYNC                   ;3
       LDX    #$08                    ;2
LB163: DEX                            ;2
       BNE    LB163                   ;2
       BIT    $80                     ;3
       STA    RESM0                   ;3
       LDA    #$10                    ;2
       STA    RESBL                   ;3
       STA    HMM0                    ;3
       RTS                            ;6

LB171: LDY    #$66                    ;2
       STY    $B2                     ;3
       STY    $B3                     ;3
       LDY    #$FF                    ;2
       STY    $B4                     ;3
       STY    $B5                     ;3
       JSR    LB1AD                   ;6
       AND    #$0F                    ;2
       TAX                            ;2
       LDY    LB19D,X                 ;4
       STY    $B9                     ;3
       STY    $BA                     ;3
       STY    $BB                     ;3
       AND    #$0C                    ;2
       TAX                            ;2
       LDY    LB19D,X                 ;4
       STY    $B6                     ;3
       STY    $B7                     ;3
       STY    $B8                     ;3
       LDY    #$00                    ;2
       STY    $B1                     ;3
       RTS                            ;6

LB19D: .byte $AA ; |X X X X | $B19D
       .byte $00 ; |        | $B19E
       .byte $88 ; |X   X   | $B19F
       .byte $22 ; |  X   X | $B1A0
       .byte $55 ; | X X X X| $B1A1
       .byte $00 ; |        | $B1A2
       .byte $11 ; |   X   X| $B1A3
       .byte $44 ; | X   X  | $B1A4
       .byte $99 ; |X  XX  X| $B1A5
       .byte $00 ; |        | $B1A6
       .byte $11 ; |   X   X| $B1A7
       .byte $88 ; |X   X   | $B1A8
       .byte $66 ; | XX  XX | $B1A9
       .byte $00 ; |        | $B1AA
       .byte $22 ; |  X   X | $B1AB
       .byte $44 ; | X   X  | $B1AC

LB1AD: LDA    $EC                     ;3
       STA    $EE                     ;3
       LDA    $ED                     ;3
       STA    $EF                     ;3
       ASL                            ;2
       ROL    $EC                     ;5
       ASL                            ;2
       ROL    $EC                     ;5
       CLC                            ;2
       ADC    $EF                     ;3
       STA    $ED                     ;3
       LDA    #$00                    ;2
       ADC    $EC                     ;3
       CLC                            ;2
       ADC    $EE                     ;3
       STA    $EC                     ;3
       LDA    #$00                    ;2
       INC    $ED                     ;5
       ADC    $EC                     ;3
       STA    $EC                     ;3
       RTS                            ;6

LB1D2: LDA    CXM1FB                  ;3
       BMI    LB21D                   ;2
       LDA    CXM1P                   ;3
       BPL    LB21D                   ;2
       LDA    $95                     ;3
       LSR                            ;2
       BCC    LB1E3                   ;2
       LDA    #$D0                    ;2
       BNE    LB1E5                   ;2
LB1E3: LDA    #$C0                    ;2
LB1E5: STA    $88                     ;3
       LDA    $F4                     ;3
       SEC                            ;2
       SBC    LB996                   ;4
       LDY    #$00                    ;2
       SEC                            ;2
LB1F0: INY                            ;2
       SBC    #$0C                    ;2
       BCS    LB1F0                   ;2
       LDA    ($88),Y                 ;5
       TAX                            ;2
       AND    #$08                    ;2
       BEQ    LB203                   ;2
       TXA                            ;2
       AND    #$07                    ;2
       TAX                            ;2
       LDA    LB21E,X                 ;4
LB203: STA    $97                     ;3
       JSR    LB1AD                   ;6
       AND    #$F0                    ;2
       ORA    $97                     ;3
       STA    ($88),Y                 ;6
       LDA    #$01                    ;2
       STA    $97                     ;3
       JSR    LB299                   ;6
       LDA    #$F4                    ;2
       STA    $E0                     ;3
       LDA    #$20                    ;2
       STA    $E1                     ;3
LB21D: RTS                            ;6

LB21E: .byte $00 ; |        | $B21E
       .byte $08 ; |    X   | $B21F
       .byte $08 ; |    X   | $B220
       .byte $0D ; |    XX X| $B221
       .byte $08 ; |    X   | $B222
       .byte $08 ; |    X   | $B223
       .byte $0C ; |    XX  | $B224
       .byte $0E ; |    XXX | $B225

LB226: LDA    $EC                     ;3
       TAY                            ;2
       AND    #$0F                    ;2
       CMP    #$0F                    ;2
       BNE    LB230                   ;2
       DEY                            ;2
LB230: TYA                            ;2
       AND    #$1F                    ;2
       TAX                            ;2
       TYA                            ;2
       AND    #$F0                    ;2
       STA    $97                     ;3
       LDA    $C0,X                   ;4
       AND    #$0F                    ;2
       ORA    $97                     ;3
       STA    $C0,X                   ;4
       RTS                            ;6

LB242: LDA    $E3                     ;3
       BMI    LB298                   ;2
       BNE    LB25F                   ;2
       LDA    $F5                     ;3
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       STA    $97                     ;3
       JSR    LB299                   ;6
       LDA    #$20                    ;2
       STA    $E1                     ;3
       LDA    #$FF                    ;2
       STA    $E0                     ;3
       STA    $E3                     ;3
       BNE    LB298                   ;2
LB25F: LDA    $E6                     ;3
       BEQ    LB298                   ;2
       DEC    $EA                     ;5
       LDA    $EA                     ;3
       AND    #$03                    ;2
       BNE    LB272                   ;2
       LDA    $BF                     ;3
       BNE    LB272                   ;2
       JSR    LB226                   ;6
LB272: LDA    $EA                     ;3
       BNE    LB298                   ;2
       LDA    #$3C                    ;2
       STA    $EA                     ;3
       DEC    $E9                     ;5
       BNE    LB298                   ;2
       LDA    $AC                     ;3
       STA    $E9                     ;3
       LDX    #$04                    ;2
LB284: LDA    $E7                     ;3
       LSR                            ;2
       STA    $E7                     ;3
       ROL    $E6                     ;5
       DEX                            ;2
       BNE    LB284                   ;2
       DEC    $F5                     ;5
       LDA    #$11                    ;2
       STA    $E0                     ;3
       LDA    #$FF                    ;2
       STA    $E1                     ;3
LB298: RTS                            ;6

LB299: LDA    $EB                     ;3
       AND    #$01                    ;2
       TAX                            ;2
       CLC                            ;2
       SED                            ;2
       LDA    $84,X                   ;4
       ADC    $97                     ;3
       STA    $84,X                   ;4
       LDA    $86,X                   ;4
       ADC    #$00                    ;2
       STA    $86,X                   ;4
       CLD                            ;2
LB2AD: LDA    $84,X                   ;4
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       STA    $8F                     ;3
       LDA    $84,X                   ;4
       AND    #$F0                    ;2
       STA    $8E                     ;3
       LDA    $86,X                   ;4
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       STA    $8D                     ;3
       LDA    $86,X                   ;4
       AND    #$F0                    ;2
       STA    $8C                     ;3
       RTS                            ;6


  IF ORIGJOY
LB2CA: JSR    LB052                   ;6
       EOR    #$01                    ;2
       TAX                            ;2
  ELSE
       .byte $00,$00,$00 ;free
LB2CA: JSR    LB052                   ;6
  ENDIF


       LDA    $83                     ;3
       STA    HMP1                    ;3
       LDY    INPT4,X                 ;4
       BPL    LB30E                   ;2
       LDX    $F3                     ;3
       BNE    LB30E                   ;2
       TAX                            ;2
       LDA    $A8                     ;3
       AND    #$0C                    ;2
       BEQ    LB309                   ;2
       AND    #$08                    ;2
       EOR    #$08                    ;2
       STA    REFP1                   ;3
       STA    $97                     ;3
       LDA    $95                     ;3
       AND    #$08                    ;2
       CMP    $97                     ;3
       BEQ    LB309                   ;2
       LDA    $95                     ;3
       EOR    #$08                    ;2
       STA    $95                     ;3
       LDA    $83                     ;3
       LDX    $97                     ;3
       BEQ    LB305                   ;2
       CLC                            ;2
       ADC    #$60                    ;2
       JMP    LB308                   ;3
LB305: SEC                            ;2
       SBC    #$60                    ;2
LB308: TAX                            ;2
LB309: STX    HMM1                    ;3
       JMP    LB369                   ;3
LB30E: AND    #$F0                    ;2
       BEQ    LB31D                   ;2
       CMP    #$10                    ;2
       BNE    LB31B                   ;2
       INC    $F2                     ;5
       JMP    LB31D                   ;3
LB31B: DEC    $F2                     ;5
LB31D: INC    $F3                     ;5
       LDA    $F3                     ;3
       CMP    #$07                    ;2
       BEQ    LB357                   ;2
       STA    $97                     ;3
       ASL                            ;2
       CLC                            ;2
       ADC    $97                     ;3
       STA    $97                     ;3
       LDA    #$00                    ;2
       STA    HMM1                    ;3
       LDA    $81                     ;3
       LDX    $93                     ;3
       CPX    #$01                    ;2
       BEQ    LB342                   ;2
       SEC                            ;2
       SBC    #$06                    ;2
       SEC                            ;2
       SBC    $97                     ;3
       JMP    LB348                   ;3
LB342: CLC                            ;2
       ADC    $97                     ;3
       SEC                            ;2
       SBC    #$02                    ;2
LB348: STA    $F4                     ;3
       CMP    LB36A                   ;4
       BCS    LB369                   ;2
       LDA    $93                     ;3
       CMP    #$01                    ;2
       BEQ    LB369                   ;2
       BNE    LB365                   ;2
LB357: LDA    $F2                     ;3
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       STA    HMM1                    ;3
       LDA    #$00                    ;2
       STA    $F3                     ;3
       STA    $F2                     ;3
LB365: LDA    #$10                    ;2
       STA    $F4                     ;3
LB369: RTS                            ;6

LB36A: .byte $5E ; | X XXXX | $B36A

LB36B: LDA    $93                     ;3
       CMP    #$02                    ;2
       BEQ    LB37D                   ;2
       LDA    #$F9                    ;2
       STA    $A1                     ;3
       LDA    #$31                    ;2
       STA    $A2                     ;3
       LDA    #$38                    ;2
       BNE    LB387                   ;2
LB37D: LDA    #$F8                    ;2
       STA    $A1                     ;3
       LDA    #$30                    ;2
       STA    $A2                     ;3
       LDA    #$39                    ;2
LB387: STA    $A4                     ;3
       STA    $A5                     ;3
       LDA    #$28                    ;2
       STA    $A6                     ;3
       LDA    #$3E                    ;2
       STA    $A3                     ;3
       LDA    #$2C                    ;2
       STA    $A7                     ;3
       LDA    #$30                    ;2
       STA    $A0                     ;3
       LDA    #$00                    ;2
       STA    $A8                     ;3
       RTS                            ;6

LB3A0: LDA    $E3                     ;3
       BMI    LB3EB                   ;2
       LDA    $E6                     ;3
       CMP    #$F0                    ;2
       BNE    LB3CD                   ;2
       LDX    $E9                     ;3
       DEX                            ;2
       STX    $97                     ;3
       LDA    $EA                     ;3
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ROL    $97                     ;5
       LDA    $97                     ;3
       CMP    #$05                    ;2
       BPL    LB3CD                   ;2
       LSR                            ;2
       BCS    LB3CD                   ;2
       LDA    #$05                    ;2
       STA    AUDC1                   ;3
       LDA    #$1F                    ;2
       STA    AUDF1                   ;3
       LDA    #$0F                    ;2
       STA    AUDV1                   ;3
       BNE    LB3FD                   ;2
LB3CD: LDA    #$02                    ;2
       STA    AUDC1                   ;3
       LDX    #$00                    ;2
       LDY    #$0C                    ;2
LB3D5: LDA    $C3,X                   ;4
       AND    #$08                    ;2
       BNE    LB3DC                   ;2
       INY                            ;2
LB3DC: INX                            ;2
       CPX    #$0A                    ;2
       BNE    LB3E3                   ;2
       LDX    #$10                    ;2
LB3E3: CPX    #$1A                    ;2
       BNE    LB3D5                   ;2
       CPY    #$20                    ;2
       BNE    LB3F7                   ;2
LB3EB: LDA    #$00                    ;2
       STA    AUDV1                   ;3
       LDX    $E3                     ;3
       BMI    LB3FD                   ;2
       STA    $E3                     ;3
       BPL    LB3FD                   ;2
LB3F7: STY    AUDF1                   ;3
       LDA    #$0F                    ;2
       STA    AUDV1                   ;3
LB3FD: LDA    $E0                     ;3
       BEQ    LB427                   ;2
       BMI    LB412                   ;2
       CMP    #$14                    ;2
       BNE    LB40D                   ;2
       LDA    $95                     ;3
       LSR                            ;2
       BCS    LB40D                   ;2
       RTS                            ;6

LB40D: INC    $E1                     ;5
       JMP    LB414                   ;3
LB412: DEC    $E1                     ;5
LB414: LDA    $E1                     ;3
       BMI    LB427                   ;2
       CMP    #$20                    ;2
       BEQ    LB427                   ;2
       STA    AUDF0                   ;3
       LDA    $E0                     ;3
       STA    AUDC0                   ;3
       LDA    #$0F                    ;2
       STA    AUDV0                   ;3
       RTS                            ;6

LB427: LDA    #$00                    ;2
       STA    AUDV0                   ;3
       STA    $E0                     ;3
       RTS                            ;6

LB42E: JSR    LB052                   ;6
       LDA    $F5                     ;3
       STA    $A9,X                   ;4
LB435: LDY    $9E                     ;3
       BEQ    LB445                   ;2
       LDA    $F7                     ;3
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       ORA    $9F                     ;3
       STA    $9F                     ;3
       BNE    LB45A                   ;2
LB445: LDA    $EB                     ;3
       EOR    #$FF                    ;2
       STA    $EB                     ;3
       AND    #$01                    ;2
       TAX                            ;2
       LDA    $9E,X                   ;4
       BNE    LB445                   ;2
       JSR    LB2AD                   ;6
       PLA                            ;4
       PLA                            ;4
       JMP    LB07F                   ;3
LB45A: PLA                            ;4
       PLA                            ;4
       JMP    LB9DD                   ;3
LB45F: JSR    LBC4E                   ;6
       LDA    $82                     ;3
       CMP    LB997                   ;4
       BNE    LB46C                   ;2
       JSR    LB42E                   ;6
LB46C: LDA    $BF                     ;3
       BNE    LB476                   ;2
       JSR    LB1D2                   ;6
       JSR    LB2CA                   ;6
LB476: JSR    LB171                   ;6
LB479: JSR    LB242                   ;6
       JSR    LB15F                   ;6
       JSR    LB36B                   ;6
       JSR    LB3A0                   ;6
       JMP    LB5D0                   ;3

LB488: .byte $00 ; |        | $B488
       .byte $00 ; |        | $B489
       .byte $55 ; | X X X X| $B48A
       .byte $55 ; | X X X X| $B48B
       .byte $55 ; | X X X X| $B48C
       .byte $22 ; |  X   X | $B48D
       .byte $22 ; |  X   X | $B48E
       .byte $77 ; | XXX XXX| $B48F
       .byte $22 ; |  X   X | $B490
       .byte $22 ; |  X   X | $B491
LB492: .byte $00 ; |        | $B492
       .byte $00 ; |        | $B493
       .byte $AA ; |X X X X | $B494
       .byte $AA ; |X X X X | $B495
       .byte $AA ; |X X X X | $B496
       .byte $44 ; | X   X  | $B497
       .byte $44 ; | X   X  | $B498
       .byte $EE ; |XXX XXX | $B499
       .byte $44 ; | X   X  | $B49A
       .byte $44 ; | X   X  | $B49B

LB49C: .byte $00 ; |        | $B49C
       .byte $00 ; |        | $B49D
       .byte $EE ; |XXX XXX | $B49E
       .byte $EE ; |XXX XXX | $B49F
       .byte $AA ; |X X X X | $B4A0
       .byte $AA ; |X X X X | $B4A1
       .byte $AA ; |X X X X | $B4A2
       .byte $AA ; |X X X X | $B4A3
       .byte $EE ; |XXX XXX | $B4A4
       .byte $EE ; |XXX XXX | $B4A5
       .byte $00 ; |        | $B4A6
       .byte $00 ; |        | $B4A7
       .byte $00 ; |        | $B4A8
       .byte $00 ; |        | $B4A9
       .byte $00 ; |        | $B4AA
       .byte $00 ; |        | $B4AB
       .byte $00 ; |        | $B4AC
       .byte $00 ; |        | $B4AD
       .byte $EE ; |XXX XXX | $B4AE
       .byte $EE ; |XXX XXX | $B4AF
       .byte $44 ; | X   X  | $B4B0
       .byte $44 ; | X   X  | $B4B1
       .byte $44 ; | X   X  | $B4B2
       .byte $44 ; | X   X  | $B4B3
       .byte $44 ; | X   X  | $B4B4
       .byte $CC ; |XX  XX  | $B4B5
       .byte $00 ; |        | $B4B6
       .byte $00 ; |        | $B4B7
       .byte $00 ; |        | $B4B8
       .byte $00 ; |        | $B4B9
       .byte $00 ; |        | $B4BA
       .byte $00 ; |        | $B4BB
       .byte $00 ; |        | $B4BC
       .byte $00 ; |        | $B4BD
       .byte $EE ; |XXX XXX | $B4BE
       .byte $EE ; |XXX XXX | $B4BF
       .byte $88 ; |X   X   | $B4C0
       .byte $88 ; |X   X   | $B4C1
       .byte $CC ; |XX  XX  | $B4C2
       .byte $66 ; | XX  XX | $B4C3
       .byte $22 ; |  X   X | $B4C4
       .byte $EE ; |XXX XXX | $B4C5
       .byte $00 ; |        | $B4C6
       .byte $00 ; |        | $B4C7
       .byte $00 ; |        | $B4C8
       .byte $00 ; |        | $B4C9
       .byte $00 ; |        | $B4CA
       .byte $00 ; |        | $B4CB
       .byte $00 ; |        | $B4CC
       .byte $00 ; |        | $B4CD
       .byte $EE ; |XXX XXX | $B4CE
       .byte $EE ; |XXX XXX | $B4CF
       .byte $22 ; |  X   X | $B4D0
       .byte $22 ; |  X   X | $B4D1
       .byte $EE ; |XXX XXX | $B4D2
       .byte $22 ; |  X   X | $B4D3
       .byte $22 ; |  X   X | $B4D4
       .byte $EE ; |XXX XXX | $B4D5
       .byte $00 ; |        | $B4D6
       .byte $00 ; |        | $B4D7
       .byte $00 ; |        | $B4D8
       .byte $00 ; |        | $B4D9
       .byte $00 ; |        | $B4DA
       .byte $00 ; |        | $B4DB
       .byte $00 ; |        | $B4DC
       .byte $00 ; |        | $B4DD
       .byte $22 ; |  X   X | $B4DE
       .byte $22 ; |  X   X | $B4DF
       .byte $22 ; |  X   X | $B4E0
       .byte $22 ; |  X   X | $B4E1
       .byte $EE ; |XXX XXX | $B4E2
       .byte $AA ; |X X X X | $B4E3
       .byte $AA ; |X X X X | $B4E4
       .byte $88 ; |X   X   | $B4E5
       .byte $00 ; |        | $B4E6
       .byte $00 ; |        | $B4E7
       .byte $00 ; |        | $B4E8
       .byte $00 ; |        | $B4E9
       .byte $00 ; |        | $B4EA
       .byte $00 ; |        | $B4EB
       .byte $00 ; |        | $B4EC
       .byte $00 ; |        | $B4ED
       .byte $EE ; |XXX XXX | $B4EE
       .byte $22 ; |  X   X | $B4EF
       .byte $22 ; |  X   X | $B4F0
       .byte $66 ; | XX  XX | $B4F1
       .byte $CC ; |XX  XX  | $B4F2
       .byte $88 ; |X   X   | $B4F3
       .byte $88 ; |X   X   | $B4F4
       .byte $EE ; |XXX XXX | $B4F5
       .byte $00 ; |        | $B4F6
       .byte $00 ; |        | $B4F7
       .byte $00 ; |        | $B4F8
       .byte $00 ; |        | $B4F9
       .byte $00 ; |        | $B4FA
       .byte $00 ; |        | $B4FB
       .byte $00 ; |        | $B4FC
       .byte $00 ; |        | $B4FD
       .byte $EE ; |XXX XXX | $B4FE
       .byte $EE ; |XXX XXX | $B4FF
       .byte $AA ; |X X X X | $B500
       .byte $AA ; |X X X X | $B501
       .byte $EE ; |XXX XXX | $B502
       .byte $88 ; |X   X   | $B503
       .byte $88 ; |X   X   | $B504
       .byte $EE ; |XXX XXX | $B505
       .byte $00 ; |        | $B506
       .byte $00 ; |        | $B507
       .byte $00 ; |        | $B508
       .byte $00 ; |        | $B509
       .byte $00 ; |        | $B50A
       .byte $00 ; |        | $B50B
       .byte $00 ; |        | $B50C
       .byte $00 ; |        | $B50D
       .byte $88 ; |X   X   | $B50E
       .byte $88 ; |X   X   | $B50F
       .byte $44 ; | X   X  | $B510
       .byte $44 ; | X   X  | $B511
       .byte $22 ; |  X   X | $B512
       .byte $22 ; |  X   X | $B513
       .byte $22 ; |  X   X | $B514
       .byte $EE ; |XXX XXX | $B515
       .byte $00 ; |        | $B516
       .byte $00 ; |        | $B517
       .byte $00 ; |        | $B518
       .byte $00 ; |        | $B519
       .byte $00 ; |        | $B51A
       .byte $00 ; |        | $B51B
       .byte $00 ; |        | $B51C
       .byte $00 ; |        | $B51D
       .byte $EE ; |XXX XXX | $B51E
       .byte $EE ; |XXX XXX | $B51F
       .byte $AA ; |X X X X | $B520
       .byte $AA ; |X X X X | $B521
       .byte $EE ; |XXX XXX | $B522
       .byte $AA ; |X X X X | $B523
       .byte $AA ; |X X X X | $B524
       .byte $EE ; |XXX XXX | $B525
       .byte $00 ; |        | $B526
       .byte $00 ; |        | $B527
       .byte $00 ; |        | $B528
       .byte $00 ; |        | $B529
       .byte $00 ; |        | $B52A
       .byte $00 ; |        | $B52B
       .byte $00 ; |        | $B52C
       .byte $00 ; |        | $B52D
       .byte $22 ; |  X   X | $B52E
       .byte $22 ; |  X   X | $B52F
       .byte $22 ; |  X   X | $B530
       .byte $22 ; |  X   X | $B531
       .byte $EE ; |XXX XXX | $B532
       .byte $AA ; |X X X X | $B533
       .byte $AA ; |X X X X | $B534
       .byte $EE ; |XXX XXX | $B535
LB536: .byte $00 ; |        | $B536
       .byte $00 ; |        | $B537
       .byte $77 ; | XXX XXX| $B538
       .byte $77 ; | XXX XXX| $B539
       .byte $55 ; | X X X X| $B53A
       .byte $55 ; | X X X X| $B53B
       .byte $55 ; | X X X X| $B53C
       .byte $55 ; | X X X X| $B53D
       .byte $77 ; | XXX XXX| $B53E
       .byte $77 ; | XXX XXX| $B53F
       .byte $00 ; |        | $B540
       .byte $00 ; |        | $B541
       .byte $00 ; |        | $B542
       .byte $00 ; |        | $B543
       .byte $00 ; |        | $B544
       .byte $00 ; |        | $B545
       .byte $00 ; |        | $B546
       .byte $00 ; |        | $B547
       .byte $77 ; | XXX XXX| $B548
       .byte $77 ; | XXX XXX| $B549
       .byte $22 ; |  X   X | $B54A
       .byte $22 ; |  X   X | $B54B
       .byte $22 ; |  X   X | $B54C
       .byte $22 ; |  X   X | $B54D
       .byte $22 ; |  X   X | $B54E
       .byte $33 ; |  XX  XX| $B54F
       .byte $00 ; |        | $B550
       .byte $00 ; |        | $B551
       .byte $00 ; |        | $B552
       .byte $00 ; |        | $B553
       .byte $00 ; |        | $B554
       .byte $00 ; |        | $B555
       .byte $00 ; |        | $B556
       .byte $00 ; |        | $B557
       .byte $77 ; | XXX XXX| $B558
       .byte $77 ; | XXX XXX| $B559
       .byte $11 ; |   X   X| $B55A
       .byte $11 ; |   X   X| $B55B
       .byte $33 ; |  XX  XX| $B55C
       .byte $66 ; | XX  XX | $B55D
       .byte $44 ; | X   X  | $B55E
       .byte $77 ; | XXX XXX| $B55F
       .byte $00 ; |        | $B560
       .byte $00 ; |        | $B561
       .byte $00 ; |        | $B562
       .byte $00 ; |        | $B563
       .byte $00 ; |        | $B564
       .byte $00 ; |        | $B565
       .byte $00 ; |        | $B566
       .byte $00 ; |        | $B567
       .byte $77 ; | XXX XXX| $B568
       .byte $77 ; | XXX XXX| $B569
       .byte $44 ; | X   X  | $B56A
       .byte $44 ; | X   X  | $B56B
       .byte $77 ; | XXX XXX| $B56C
       .byte $44 ; | X   X  | $B56D
       .byte $44 ; | X   X  | $B56E
       .byte $77 ; | XXX XXX| $B56F
       .byte $00 ; |        | $B570
       .byte $00 ; |        | $B571
       .byte $00 ; |        | $B572
       .byte $00 ; |        | $B573
       .byte $00 ; |        | $B574
       .byte $00 ; |        | $B575
       .byte $00 ; |        | $B576
       .byte $00 ; |        | $B577
       .byte $44 ; | X   X  | $B578
       .byte $44 ; | X   X  | $B579
       .byte $44 ; | X   X  | $B57A
       .byte $44 ; | X   X  | $B57B
       .byte $77 ; | XXX XXX| $B57C
       .byte $55 ; | X X X X| $B57D
       .byte $55 ; | X X X X| $B57E
       .byte $11 ; |   X   X| $B57F
       .byte $00 ; |        | $B580
       .byte $00 ; |        | $B581
       .byte $00 ; |        | $B582
       .byte $00 ; |        | $B583
       .byte $00 ; |        | $B584
       .byte $00 ; |        | $B585
       .byte $00 ; |        | $B586
       .byte $00 ; |        | $B587
       .byte $77 ; | XXX XXX| $B588
       .byte $44 ; | X   X  | $B589
       .byte $44 ; | X   X  | $B58A
       .byte $66 ; | XX  XX | $B58B
       .byte $33 ; |  XX  XX| $B58C
       .byte $11 ; |   X   X| $B58D
       .byte $11 ; |   X   X| $B58E
       .byte $77 ; | XXX XXX| $B58F
       .byte $00 ; |        | $B590
       .byte $00 ; |        | $B591
       .byte $00 ; |        | $B592
       .byte $00 ; |        | $B593
       .byte $00 ; |        | $B594
       .byte $00 ; |        | $B595
       .byte $00 ; |        | $B596
       .byte $00 ; |        | $B597
       .byte $77 ; | XXX XXX| $B598
       .byte $77 ; | XXX XXX| $B599
       .byte $55 ; | X X X X| $B59A
       .byte $55 ; | X X X X| $B59B
       .byte $77 ; | XXX XXX| $B59C
       .byte $11 ; |   X   X| $B59D
       .byte $11 ; |   X   X| $B59E
       .byte $77 ; | XXX XXX| $B59F
       .byte $00 ; |        | $B5A0
       .byte $00 ; |        | $B5A1
       .byte $00 ; |        | $B5A2
       .byte $00 ; |        | $B5A3
       .byte $00 ; |        | $B5A4
       .byte $00 ; |        | $B5A5
       .byte $00 ; |        | $B5A6
       .byte $00 ; |        | $B5A7
       .byte $11 ; |   X   X| $B5A8
       .byte $11 ; |   X   X| $B5A9
       .byte $22 ; |  X   X | $B5AA
       .byte $22 ; |  X   X | $B5AB
       .byte $44 ; | X   X  | $B5AC
       .byte $44 ; | X   X  | $B5AD
       .byte $44 ; | X   X  | $B5AE
       .byte $77 ; | XXX XXX| $B5AF
       .byte $00 ; |        | $B5B0
       .byte $00 ; |        | $B5B1
       .byte $00 ; |        | $B5B2
       .byte $00 ; |        | $B5B3
       .byte $00 ; |        | $B5B4
       .byte $00 ; |        | $B5B5
       .byte $00 ; |        | $B5B6
       .byte $00 ; |        | $B5B7
       .byte $77 ; | XXX XXX| $B5B8
       .byte $77 ; | XXX XXX| $B5B9
       .byte $55 ; | X X X X| $B5BA
       .byte $55 ; | X X X X| $B5BB
       .byte $77 ; | XXX XXX| $B5BC
       .byte $55 ; | X X X X| $B5BD
       .byte $55 ; | X X X X| $B5BE
       .byte $77 ; | XXX XXX| $B5BF
       .byte $00 ; |        | $B5C0
       .byte $00 ; |        | $B5C1
       .byte $00 ; |        | $B5C2
       .byte $00 ; |        | $B5C3
       .byte $00 ; |        | $B5C4
       .byte $00 ; |        | $B5C5
       .byte $00 ; |        | $B5C6
       .byte $00 ; |        | $B5C7
       .byte $44 ; | X   X  | $B5C8
       .byte $44 ; | X   X  | $B5C9
       .byte $44 ; | X   X  | $B5CA
       .byte $44 ; | X   X  | $B5CB
       .byte $77 ; | XXX XXX| $B5CC
       .byte $55 ; | X X X X| $B5CD
       .byte $55 ; | X X X X| $B5CE
       .byte $77 ; | XXX XXX| $B5CF

LB5D0: LDA    #$00                    ;2
       STA    PF0                     ;3
       STA    PF1                     ;3
       STA    PF2                     ;3
       LDA    $9D                     ;3
       STA    $91                     ;3
       LDA    $9C                     ;3
       STA    $90                     ;3
       JSR    LB052                   ;6
       LDA    $AE,X                   ;4
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       PHA                            ;3
       LDA    $E3                     ;3
       BMI    LB60B                   ;2
       LDY    $E9                     ;3
       DEY                            ;2
       STY    $97                     ;3
       LDA    $EA                     ;3
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ROL    $97                     ;5
       LDA    $97                     ;3
       CMP    #$05                    ;2
       BPL    LB60B                   ;2
       LSR                            ;2
       BCC    LB607                   ;2
       LDA    #$00                    ;2
       BEQ    LB60F                   ;2
LB607: LDA    #$0C                    ;2
       BNE    LB60F                   ;2
LB60B: LDA    $E8                     ;3
       EOR    #$FF                    ;2
LB60F: AND    $9B                     ;3
       STA    COLUP0                  ;3
       LDY    #$09                    ;2
       PLA                            ;4
       STA    $97                     ;3
LB618: LDA    INTIM                   ;4
       BNE    LB618                   ;2
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    VBLANK                  ;3
       STA    CXCLR                   ;3
       LDA    $95                     ;3
       LSR                            ;2
       BCS    LB62F                   ;2
       LDA    #$D0                    ;2
       JMP    LB633                   ;3
LB62F: STA    RESP0                   ;3
       LDA    #$C0                    ;2
LB633: STA    $88                     ;3
       LDA    $81                     ;3
       STA    $8B                     ;3
       LDA    $F4                     ;3
       STA    $8A                     ;3
       LDA    #$80                    ;2
       STA    HMP0                    ;3
       LDX    #$00                    ;2
       STX    HMP1                    ;3
       STX    HMM0                    ;3
       STX    HMM1                    ;3
       LDA    #$02                    ;2
       STA    CTRLPF                  ;3
       LDA    $EB                     ;3
       AND    $9B                     ;3
       STA    COLUP1                  ;3
       TXA                            ;2
       BCC    LB687                   ;2
LB656: STA    WSYNC                   ;3
       NOP                            ;2
       LDA    LB488,Y                 ;4
       AND    $E6                     ;3
       STA    PF1                     ;3
       LDA    LB492,Y                 ;4
       AND    $E7                     ;3
       STA    PF2                     ;3
       TYA                            ;2
       ORA    $8C                     ;3
       TAX                            ;2
       LDA    LB49C,X                 ;4
       AND    #$F0                    ;2
       STA    PF1                     ;3
       LDA    #$00                    ;2
       STA    PF0                     ;3
       NOP                            ;2
       STA    PF2                     ;3
       TYA                            ;2
       ORA    $97                     ;3
       TAX                            ;2
       LDA    LB536,X                 ;4
       STA    PF0                     ;3
       DEY                            ;2
       BNE    LB656                   ;2
       BEQ    LB6B7                   ;2
LB687: STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    PF1                     ;3
       STA    PF2                     ;3
       TYA                            ;2
       ORA    $8F                     ;3
       TAX                            ;2
       LDA    LB536,X                 ;4
       AND    #$F0                    ;2
       STA    $97                     ;3
       TYA                            ;2
       ORA    $8D                     ;3
       TAX                            ;2
       LDA    LB49C,X                 ;4
       AND    #$0F                    ;2
       STA    PF1                     ;3
       TYA                            ;2
       ORA    $8E                     ;3
       TAX                            ;2
       LDA    LB536,X                 ;4
       AND    #$0F                    ;2
       ORA    $97                     ;3
       STA    PF2                     ;3
       LDA    #$00                    ;2
       DEY                            ;2
       BNE    LB687                   ;2
LB6B7: LDA    #$25                    ;2
       AND    $F0                     ;3
       STA    CTRLPF                  ;3
       LDA    $E8                     ;3
       AND    $9B                     ;3
       STA    COLUPF                  ;3
       LDA    $E4                     ;3
       AND    $9B                     ;3
       STA    COLUP0                  ;3
       STA    WSYNC                   ;3
       LDY    #$FF                    ;2
       STY    PF1                     ;3
       LDY    #$7F                    ;2
       STY    PF2                     ;3
       STY    ENAM0                   ;3
       STY    $F1                     ;3
       LDA    #$30                    ;2
       STA    NUSIZ0                  ;3
       LDY    #$0E                    ;2
       LDA    ($88),Y                 ;5
       STA    HMP0                    ;3
       AND    #$08                    ;2
       STA    $E5                     ;3
       LDA    #$80                    ;2
       STA    PF0                     ;3
LB6E9: STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDX    #$0B                    ;2
       STX    $97                     ;3
       JMP    LB703                   ;3
LB6F4: STA    WSYNC                   ;3
       LDA    $F1                     ;3
       STA    ENAM0                   ;3
       JMP    LB703                   ;3
LB6FD: STA    WSYNC                   ;3
       LDA    $B0,X                   ;4
       STA    GRP0                    ;3
LB703: LDX    $8B                     ;3
       CPX    #$09                    ;2
       BCS    LB70D                   ;2
       LDA    $A0,X                   ;4
       STA    GRP1                    ;3
LB70D: LDA    #$00                    ;2
       LDX    $8A                     ;3
       CPX    #$02                    ;2
       BCS    LB717                   ;2
       LDA    #$02                    ;2
LB717: STA    ENAM1                   ;3
       INC    $8B                     ;5
       INC    $8A                     ;5
       LDX    $97                     ;3
       BEQ    LB6E9                   ;2
       DEX                            ;2
       STX    $97                     ;3
       BEQ    LB72D                   ;2
       LDA    $E5                     ;3
       BNE    LB6FD                   ;2
       JMP    LB6F4                   ;3
LB72D: DEY                            ;2
       BMI    LB7A2                   ;2
       LDA    ($88),Y                 ;5
       STA    HMP0                    ;3
       STA    NUSIZ0                  ;3
       AND    #$08                    ;2
       STA    $E5                     ;3
       TYA                            ;2
       BEQ    LB758                   ;2
       ASL    $90                     ;5
       ROL    $91                     ;5
       ROL                            ;2
       TAX                            ;2
       LDA    LB818,X                 ;4
       PHA                            ;3
       LDA    #$2C                    ;2
       AND    $9B                     ;3
       STA    COLUP0                  ;3
       STA    ENAM0                   ;3
       STA    $F1                     ;3
       LDA    $E3                     ;3
       BMI    LB7CE                   ;2
       JMP    LB7BC                   ;3
LB758: LDA    $E2                     ;3
       STA    ENABL                   ;3
       LDA    $96                     ;3
       BEQ    LB782                   ;2
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STY    PF0                     ;3
       STY    PF1                     ;3
       STY    PF2                     ;3
       AND    #$03                    ;2
       ORA    #$30                    ;2
       STA    NUSIZ0                  ;3
       LDA    #$03                    ;2
       STA    $F1                     ;3
       NOP                            ;2
       STA    RESM0                   ;3
       LDA    $EB                     ;3
       AND    $9B                     ;3
       STA    COLUP0                  ;3
       NOP                            ;2
       NOP                            ;2
       JMP    LB703                   ;3
LB782: NOP                            ;2
       ORA    #$20                    ;2
       STA    NUSIZ0                  ;3
       LDA    #$02                    ;2
       STA    $F1                     ;3
       LDA    $E8                     ;3
       AND    $9B                     ;3
       STA    COLUP0                  ;3
       LDA    #$60                    ;2
       STA    HMM0                    ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STY    PF0                     ;3
       STY    PF1                     ;3
       STY    PF2                     ;3
       JMP    LB703                   ;3
LB7A2: LDA    #$00                    ;2
       STA    WSYNC                   ;3
       STY    PF0                     ;3
       STY    PF1                     ;3
       STA    GRP1                    ;3
       STA    ENAM0                   ;3
       STA    ENAM1                   ;3
       STA    ENABL                   ;3
       STY    PF2                     ;3
       TAY                            ;2
       LDA    ($88),Y                 ;5
       STA    HMP0                    ;3
       JMP    LB83C                   ;3
LB7BC: TYA                            ;2
       ORA    $92                     ;3
       TAX                            ;2
       LDA    LB7D8,X                 ;4
       TAX                            ;2
       PLA                            ;4
LB7C5: STA    WSYNC                   ;3
       STX    PF1                     ;3
       STA    PF2                     ;3
       JMP    LB703                   ;3
LB7CE: CPY    #$01                    ;2
       BEQ    LB7BC                   ;2
       PLA                            ;4
       LDA    #$00                    ;2
       TAX                            ;2
       BEQ    LB7C5                   ;2

LB7D8: .byte $00 ; |        | $B7D8
       .byte $FF ; |XXXXXXXX| $B7D9
       .byte $01 ; |       X| $B7DA
       .byte $01 ; |       X| $B7DB
       .byte $00 ; |        | $B7DC
       .byte $C0 ; |XX      | $B7DD
       .byte $00 ; |        | $B7DE
       .byte $00 ; |        | $B7DF
       .byte $00 ; |        | $B7E0
       .byte $00 ; |        | $B7E1
       .byte $00 ; |        | $B7E2
       .byte $C0 ; |XX      | $B7E3
       .byte $00 ; |        | $B7E4
       .byte $00 ; |        | $B7E5
       .byte $FF ; |XXXXXXXX| $B7E6
       .byte $00 ; |        | $B7E7
       .byte $00 ; |        | $B7E8
       .byte $FF ; |XXXXXXXX| $B7E9
       .byte $01 ; |       X| $B7EA
       .byte $01 ; |       X| $B7EB
       .byte $00 ; |        | $B7EC
       .byte $00 ; |        | $B7ED
       .byte $00 ; |        | $B7EE
       .byte $00 ; |        | $B7EF
       .byte $3F ; |  XXXXXX| $B7F0
       .byte $00 ; |        | $B7F1
       .byte $00 ; |        | $B7F2
       .byte $00 ; |        | $B7F3
       .byte $00 ; |        | $B7F4
       .byte $00 ; |        | $B7F5
       .byte $FF ; |XXXXXXXX| $B7F6
       .byte $00 ; |        | $B7F7
       .byte $00 ; |        | $B7F8
       .byte $FF ; |XXXXXXXX| $B7F9
       .byte $01 ; |       X| $B7FA
       .byte $01 ; |       X| $B7FB
       .byte $00 ; |        | $B7FC
       .byte $C1 ; |XX     X| $B7FD
       .byte $01 ; |       X| $B7FE
       .byte $00 ; |        | $B7FF
       .byte $00 ; |        | $B800
       .byte $00 ; |        | $B801
       .byte $01 ; |       X| $B802
       .byte $C1 ; |XX     X| $B803
       .byte $00 ; |        | $B804
       .byte $00 ; |        | $B805
       .byte $FF ; |XXXXXXXX| $B806
       .byte $00 ; |        | $B807
       .byte $00 ; |        | $B808
       .byte $FF ; |XXXXXXXX| $B809
       .byte $01 ; |       X| $B80A
       .byte $01 ; |       X| $B80B
       .byte $00 ; |        | $B80C
       .byte $01 ; |       X| $B80D
       .byte $01 ; |       X| $B80E
       .byte $00 ; |        | $B80F
       .byte $3F ; |  XXXXXX| $B810
       .byte $00 ; |        | $B811
       .byte $01 ; |       X| $B812
       .byte $01 ; |       X| $B813
       .byte $00 ; |        | $B814
       .byte $00 ; |        | $B815
       .byte $FF ; |XXXXXXXX| $B816
       .byte $00 ; |        | $B817
LB818: .byte $00 ; |        | $B818
       .byte $00 ; |        | $B819
       .byte $1F ; |   XXXXX| $B81A
       .byte $1F ; |   XXXXX| $B81B
       .byte $00 ; |        | $B81C
       .byte $01 ; |       X| $B81D
       .byte $00 ; |        | $B81E
       .byte $C0 ; |XX      | $B81F
       .byte $00 ; |        | $B820
       .byte $F0 ; |XXXX    | $B821
       .byte $C0 ; |XX      | $B822
       .byte $FF ; |XXXXXXXX| $B823
       .byte $00 ; |        | $B824
       .byte $C0 ; |XX      | $B825
       .byte $00 ; |        | $B826
       .byte $C0 ; |XX      | $B827
       .byte $F0 ; |XXXX    | $B828
       .byte $FF ; |XXXXXXXX| $B829
       .byte $00 ; |        | $B82A
       .byte $C0 ; |XX      | $B82B
       .byte $00 ; |        | $B82C
       .byte $C0 ; |XX      | $B82D
       .byte $C0 ; |XX      | $B82E
       .byte $FF ; |XXXXXXXX| $B82F
       .byte $00 ; |        | $B830
       .byte $C0 ; |XX      | $B831
       .byte $00 ; |        | $B832
       .byte $01 ; |       X| $B833
       .byte $7F ; | XXXXXXX| $B834
       .byte $7F ; | XXXXXXX| $B835

LB836: STA    WSYNC                   ;3
       DEX                            ;2
       BNE    LB836                   ;2
       RTS                            ;6

LB83C: JSR    LB1AD                   ;6
       LDA    $BF                     ;3
       BEQ    LB84B                   ;2
       LDX    #$12                    ;2
       JSR    LB836                   ;6
       JMP    LB90D                   ;3
LB84B: LDX    #$0D                    ;2
       JSR    LB836                   ;6
       STX    $83                     ;3
       LDA    $EB                     ;3 Player? even values use right stick
       LSR                            ;2
       LDA    SWCHA                   ;4


  IF ORIGJOY
       BCS    LB865                   ;2
  ELSE
       BCC    LB865                   ;2
  ENDIF


;right stick
       AND    #$0F                    ;2
       STA    $97                     ;3
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       JMP    LB86D                   ;3
;left stick
LB865: AND    #$F0                    ;2
       STA    $97                     ;3
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
LB86D: ORA    $97                     ;3
       STA    $97                     ;3
       ORA    #$CC                    ;2
       TAX                            ;2
       LDA    $97                     ;3
       ORA    #$33                    ;2
       TAY                            ;2
       STA    WSYNC                   ;3
       LDA    $81                     ;3
       CMP    LB996                   ;4
       BCS    LB888                   ;2
       CPX    #$DD                    ;2
       BNE    LB888                   ;2
       LDX    #$FF                    ;2
LB888: STA    WSYNC                   ;3
       LDA    CXP1FB                  ;3
       AND    #$C0                    ;2
       BNE    LB894                   ;2
       LDA    CXM0P                   ;3
       BPL    LB8C0                   ;2
LB894: LDA    $94                     ;3
       ORA    #$CC                    ;2
       CMP    #$EE                    ;2
       BEQ    LB8A4                   ;2
       CMP    #$DD                    ;2
       BEQ    LB8A8                   ;2
       LDX    #$FF                    ;2
       BNE    LB8AA                   ;2
LB8A4: LDX    #$DD                    ;2
       BNE    LB8AA                   ;2
LB8A8: LDX    #$EE                    ;2
LB8AA: LDA    $94                     ;3
       ORA    #$33                    ;2
       CMP    #$BB                    ;2
       BEQ    LB8BA                   ;2
       CMP    #$77                    ;2
       BEQ    LB8BE                   ;2
       LDY    #$FF                    ;2
       BNE    LB8C0                   ;2
LB8BA: LDY    #$77                    ;2
       BNE    LB8C0                   ;2
LB8BE: LDY    #$BB                    ;2
LB8C0: STY    $97                     ;3
       TXA                            ;2
       AND    $97                     ;3
       STA    $94                     ;3
       STA    WSYNC                   ;3
       LDA    #$FF                    ;2
       CPX    #$EE                    ;2
       BEQ    LB8D5                   ;2
       CPX    #$DD                    ;2
       BEQ    LB8DA                   ;2
       BNE    LB8DC                   ;2
LB8D5: INC    $81                     ;5
       JMP    LB8DC                   ;3
LB8DA: DEC    $81                     ;5
LB8DC: CPY    #$BB                    ;2
       BEQ    LB8E6                   ;2
       CPY    #$77                    ;2
       BEQ    LB8EF                   ;2
       BNE    LB8F5                   ;2
LB8E6: LDA    #$10                    ;2
       STA    $83                     ;3
       INC    $82                     ;5
       JMP    LB8F5                   ;3
LB8EF: LDA    #$F0                    ;2
       STA    $83                     ;3
       DEC    $82                     ;5
LB8F5: STA    WSYNC                   ;3
       LDA    $EB                     ;3
       LSR                            ;2
       LDA    SWCHA                   ;4
       EOR    #$FF                    ;2

  IF ORIGJOY
       BCC    LB905                   ;2
  ELSE
       BCS    LB905                   ;2
  ENDIF

       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
LB905: STA    $A8                     ;3
       AND    #$03                    ;2
       BEQ    LB90D                   ;2
       STA    $93                     ;3
LB90D: LDA    #$02                    ;2
       STA    WSYNC                   ;3
       STA    VBLANK                  ;3
       STA    VSYNC                   ;3
       LDA    #$2A                    ;2
       STA    TIM8T                   ;4
       LDA    $95                     ;3
       EOR    #$01                    ;2
       STA    $95                     ;3
LB920: LDA    INTIM                   ;4
       BNE    LB920                   ;2
       STA    WSYNC                   ;3
       STA    VSYNC                   ;3
       LDA    #$26                    ;2
       STA    TIM64T                  ;4
       LSR    $BF                     ;5
       LSR    $AB                     ;5
       LDA    $BF                     ;3
       BCC    LB93A                   ;2
       ORA    #$80                    ;2
       BNE    LB93C                   ;2
LB93A: AND    #$7F                    ;2
LB93C: STA    $BF                     ;3
       AND    #$0F                    ;2
       STA    COLUBK                  ;3
       LDX    $E6                     ;3
       BNE    LB94E                   ;2
       LDA    #$00                    ;2
       STA    $96                     ;3
       LDA    $BF                     ;3
       BEQ    LB977                   ;2
LB94E: LDA    $BF                     ;3
       BEQ    LB958                   ;2
       CMP    #$01                    ;2
       BEQ    LB987                   ;2
       BNE    LB974                   ;2
LB958: LDA    CXPPMM                  ;3
       BMI    LB977                   ;2
       AND    #$40                    ;2
       BEQ    LB974                   ;2
       LDA    $E2                     ;3
       BEQ    LB96C                   ;2
       LDA    #$F8                    ;2
       STA    $E0                     ;3
       LDA    #$20                    ;2
       STA    $E1                     ;3
LB96C: LDA    #$00                    ;2
       STA    $E2                     ;3
       LDA    $E8                     ;3
       STA    $E4                     ;3
LB974: JMP    LB45F                   ;3
LB977: LDA    #$CC                    ;2
       STA    $BF                     ;3
       STA    $AB                     ;3
       LDA    #$FF                    ;2
       STA    $E1                     ;3
       LDA    #$14                    ;2
       STA    $E0                     ;3
       BNE    LB974                   ;2
LB987: LDA    $96                     ;3
       BEQ    LB99A                   ;2
       LSR                            ;2
       AND    #$FB                    ;2
       STA    $96                     ;3
       JSR    LB129                   ;6
       JMP    LB479                   ;3

LB996: .byte $59 ; | X XX  X| $B996
LB997: .byte $39 ; |  XXX  X| $B997
LB998: .byte $01 ; |       X| $B998
       .byte $10 ; |   X    | $B999

LB99A: JSR    LB052                   ;6
       LDA    $80                     ;3
       CMP    #$84                    ;2
       BNE    LB9B5                   ;2
       TAY                            ;2
       LDA    LB998,X                 ;4
       STA    $97                     ;3
       LDA    $F7                     ;3
       ORA    $97                     ;3
       STA    $F7                     ;3
       CMP    #$11                    ;2
       BEQ    LB9D8                   ;2
       BNE    LB9C3                   ;2
LB9B5: LDA    $80                     ;3
       BMI    LB9BF                   ;2
       CMP    #$03                    ;2
       BEQ    LB9C3                   ;2
       BNE    LB9D8                   ;2
LB9BF: CMP    #$85                    ;2
       BEQ    LB9CA                   ;2
LB9C3: DEC    $AE,X                   ;6
LB9C5: INC    $9E,X                   ;6
       JSR    LB435                   ;6
LB9CA: LDA    #$00                    ;2
       STA    $84,X                   ;4
       STA    $86,X                   ;4
       STA    $A9,X                   ;4
       LDA    #$10                    ;2
       STA    $AE,X                   ;4
       BNE    LB9C5                   ;2
LB9D8: PHA                            ;3
       PHA                            ;3
       JMP    LBC69                   ;3
LB9DD: LDA    #$74                    ;2
       STA    $AB                     ;3
LB9E1: LDA    #$10                    ;2
       STA    $F4                     ;3
       LDA    #$04                    ;2
       STA    $96                     ;3
       LDA    #$EA                    ;2
       STA    $81                     ;3
       LDA    #$40                    ;2
       STA    $F5                     ;3
       LDA    #$00                    ;2
       STA    $90                     ;3
       STA    $91                     ;3
       STA    $92                     ;3
       STA    $93                     ;3
       STA    $F1                     ;3
       STA    REFP1                   ;3
       STA    $E0                     ;3
       STA    $E1                     ;3
       STA    AUDV0                   ;3
       LDA    #$1F                    ;2
       STA    $94                     ;3
       LDA    #$A6                    ;2
       STA    $EB                     ;3
       JSR    LBA1A                   ;6
       LDA    $99                     ;3
       BEQ    LBA17                   ;2
       JSR    LBA41                   ;6
LBA17: JMP    LBDC5                   ;3
LBA1A: STA    WSYNC                   ;3
       LDX    #$08                    ;2
LBA1E: DEX                            ;2
       BNE    LBA1E                   ;2
       STA    RESP0                   ;3
       STA    RESP1                   ;3
       LDA    #$70                    ;2
       STA    HMP0                    ;3
       LDA    #$30                    ;2
       STA    HMP1                    ;3
       RTS                            ;6

LBA2E: .byte $00 ; |        | $BA2E
       .byte $04 ; |     X  | $BA2F
       .byte $07 ; |     XXX| $BA30
       .byte $0B ; |    X XX| $BA31
       .byte $0E ; |    XXX | $BA32
       .byte $12 ; |   X  X | $BA33
       .byte $15 ; |   X X X| $BA34
       .byte $19 ; |   XX  X| $BA35
       .byte $1C ; |   XXX  | $BA36
       .byte $20 ; |  X     | $BA37

LBA38: LDA    $AE                     ;3
       CMP    $AF                     ;3
       BPL    LBA40                   ;2
       LDA    $AF                     ;3
LBA40: RTS                            ;6

LBA41: JSR    LBA38                   ;6
       STA    $97                     ;3
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       TAY                            ;2
       DEY                            ;2
       LDA    LB110,Y                 ;4
       STA    $AB                     ;3
       LDA    $97                     ;3
       AND    #$0F                    ;2
       TAY                            ;2
       LDA    LBA2E,Y                 ;4
       STA    $97                     ;3
       LDX    #$00                    ;2
LBA5D: CPX    $97                     ;3
       BMI    LBA77                   ;2
       TXA                            ;2
       LSR                            ;2
       BCS    LBA69                   ;2
       LDA    #$08                    ;2
       BNE    LBA79                   ;2
LBA69: LSR                            ;2
       BCS    LBA71                   ;2
       LDA    $ED                     ;3
       JMP    LBA79                   ;3
LBA71: JSR    LB1AD                   ;6
       JMP    LBA79                   ;3
LBA77: AND    #$F7                    ;2
LBA79: STA    $BB,X                   ;4
       INX                            ;2
       CPX    #$20                    ;2
       BNE    LBA5D                   ;2
       LDA    #$00                    ;2
       TAX                            ;2
LBA83: STA    $DB,X                   ;4
       INX                            ;2
       CPX    #$05                    ;2
       STA    $BC                     ;3
       BNE    LBA83                   ;2
       RTS                            ;6

LBA8D: LDY    $96                     ;3
       LDA    LBACE,Y                 ;4
       STA    $A0                     ;3
       LDA    LBAD6,Y                 ;4
       STA    $A1                     ;3
       LDA    LBADE,Y                 ;4
       STA    $A2                     ;3
       CPY    #$07                    ;2
       BEQ    LBAAA                   ;2
       CPY    #$01                    ;2
       BEQ    LBAB3                   ;2
       LDA    $95                     ;3
       BEQ    LBAB3                   ;2
LBAAA: LDA    #$01                    ;2
       STA    $95                     ;3
       DEC    $96                     ;5
       JMP    LBAB9                   ;3
LBAB3: LDA    #$00                    ;2
       STA    $95                     ;3
       INC    $96                     ;5
LBAB9: LDA    #$08                    ;2
       STA    $A3                     ;3
       LDA    #$F3                    ;2
       STA    $A4                     ;3
       LDA    #$3F                    ;2
       STA    $A5                     ;3
       LDA    #$0E                    ;2
       STA    $A6                     ;3
       LDA    #$00                    ;2
       STA    $A7                     ;3
       RTS                            ;6

LBACE: .byte $00 ; |        | $BACE
       .byte $07 ; |     XXX| $BACF
       .byte $03 ; |      XX| $BAD0
       .byte $01 ; |       X| $BAD1
       .byte $00 ; |        | $BAD2
       .byte $40 ; | X      | $BAD3
       .byte $60 ; | XX     | $BAD4
       .byte $70 ; | XXX    | $BAD5
LBAD6: .byte $00 ; |        | $BAD6
       .byte $08 ; |    X   | $BAD7
       .byte $1C ; |   XXX  | $BAD8
       .byte $3F ; |  XXXXXX| $BAD9
       .byte $7F ; | XXXXXXX| $BADA
       .byte $3E ; |  XXXXX | $BADB
       .byte $1C ; |   XXX  | $BADC
       .byte $08 ; |    X   | $BADD
LBADE: .byte $00 ; |        | $BADE
       .byte $78 ; | XXXX   | $BADF
       .byte $68 ; | XX X   | $BAE0
       .byte $48 ; | X  X   | $BAE1
       .byte $08 ; |    X   | $BAE2
       .byte $09 ; |    X  X| $BAE3
       .byte $0B ; |    X XX| $BAE4
       .byte $0F ; |    XXXX| $BAE5

LBAE6: LDY    #$00                    ;2
       STY    $B1                     ;3
       LDY    #$60                    ;2
       STY    $B2                     ;3
       LDY    #$F0                    ;2
       STY    $B3                     ;3
       JSR    LB1AD                   ;6
       AND    #$0F                    ;2
       TAX                            ;2
       LDY    LB19D,X                 ;4
       AND    #$0C                    ;2
       TAX                            ;2
       LDA    LB19D,X                 ;4
       AND    #$F0                    ;2
       STA    $B4                     ;3
       TYA                            ;2
       AND    #$F0                    ;2
       STA    $B5                     ;3
       RTS                            ;6

LBB0B: LDA    $90                     ;3
       CMP    #$20                    ;2
       BEQ    LBB1E                   ;2
       LDA    #$1F                    ;2
       STA    AUDC1                   ;3
       STA    AUDF1                   ;3
       LDA    #$0A                    ;2
       STA    AUDV1                   ;3
       INC    $90                     ;5
       RTS                            ;6

LBB1E: LDA    #$1A                    ;2
       STA    AUDF1                   ;3
       LDA    #$0F                    ;2
       STA    AUDV1                   ;3
       LDA    $91                     ;3
       CMP    #$32                    ;2
       BEQ    LBB40                   ;2
       TAX                            ;2
       INC    $91                     ;5
       LDA    LBB98,X                 ;4
       STA    HMP1                    ;3
       LSR                            ;2
       BCC    LBB97                   ;2
       LSR                            ;2
       BCC    LBB3D                   ;2
       DEC    $81                     ;5
       RTS                            ;6

LBB3D: INC    $81                     ;5
       RTS                            ;6

LBB40: LDA    $92                     ;3
       CMP    #$81                    ;2
       BEQ    LBB4B                   ;2
       INC    $92                     ;5
       DEC    $81                     ;5
       RTS                            ;6

LBB4B: LDA    #$1F                    ;2
       STA    AUDF1                   ;3
       LDA    #$08                    ;2
       STA    AUDV1                   ;3
       LDA    $A9                     ;3
       BNE    LBB5B                   ;2
       LDA    $AA                     ;3
       BEQ    LBB5F                   ;2
LBB5B: JSR    LBBE3                   ;6
       RTS                            ;6

LBB5F: LDA    $94                     ;3
       CMP    #$1F                    ;2
       BEQ    LBB69                   ;2
       JSR    LBBE9                   ;6
       RTS                            ;6

LBB69: JSR    LBC37                   ;6
       LDA    $93                     ;3
       CMP    #$60                    ;2
       BNE    LBB95                   ;2
       LDA    $AE                     ;3
       AND    #$0F                    ;2
       CMP    #$09                    ;2
       BEQ    LBB82                   ;2
       LDA    $AF                     ;3
       AND    #$0F                    ;2
       CMP    #$09                    ;2
       BNE    LBB85                   ;2
LBB82: INC    $AD                     ;5
       RTS                            ;6

LBB85: LDX    #$A6                    ;2
       STX    $EB                     ;3
       LDA    #$00                    ;2
       STA    $97                     ;3
       JSR    LB2AD                   ;6
       LDA    #$01                    ;2
       STA    $F1                     ;3
       RTS                            ;6

LBB95: INC    $93                     ;5
LBB97: RTS                            ;6

LBB98: .byte $01 ; |       X| $BB98
       .byte $01 ; |       X| $BB99
       .byte $01 ; |       X| $BB9A
       .byte $01 ; |       X| $BB9B
       .byte $01 ; |       X| $BB9C
       .byte $F0 ; |XXXX    | $BB9D
       .byte $F0 ; |XXXX    | $BB9E
       .byte $F0 ; |XXXX    | $BB9F
       .byte $F0 ; |XXXX    | $BBA0
       .byte $F0 ; |XXXX    | $BBA1
       .byte $F0 ; |XXXX    | $BBA2
       .byte $F0 ; |XXXX    | $BBA3
       .byte $F0 ; |XXXX    | $BBA4
       .byte $F0 ; |XXXX    | $BBA5
       .byte $F0 ; |XXXX    | $BBA6
       .byte $F0 ; |XXXX    | $BBA7
       .byte $F0 ; |XXXX    | $BBA8
       .byte $F0 ; |XXXX    | $BBA9
       .byte $F0 ; |XXXX    | $BBAA
       .byte $F0 ; |XXXX    | $BBAB
       .byte $F0 ; |XXXX    | $BBAC
       .byte $F0 ; |XXXX    | $BBAD
       .byte $F0 ; |XXXX    | $BBAE
       .byte $F0 ; |XXXX    | $BBAF
       .byte $F0 ; |XXXX    | $BBB0
       .byte $F3 ; |XXXX  XX| $BBB1
       .byte $F3 ; |XXXX  XX| $BBB2
       .byte $F3 ; |XXXX  XX| $BBB3
       .byte $F3 ; |XXXX  XX| $BBB4
       .byte $F3 ; |XXXX  XX| $BBB5
       .byte $F3 ; |XXXX  XX| $BBB6
       .byte $F3 ; |XXXX  XX| $BBB7
       .byte $F3 ; |XXXX  XX| $BBB8
       .byte $F3 ; |XXXX  XX| $BBB9
       .byte $F3 ; |XXXX  XX| $BBBA
       .byte $F3 ; |XXXX  XX| $BBBB
       .byte $F3 ; |XXXX  XX| $BBBC
       .byte $F3 ; |XXXX  XX| $BBBD
       .byte $F3 ; |XXXX  XX| $BBBE
       .byte $F3 ; |XXXX  XX| $BBBF
       .byte $F3 ; |XXXX  XX| $BBC0
       .byte $F3 ; |XXXX  XX| $BBC1
       .byte $F3 ; |XXXX  XX| $BBC2
       .byte $F3 ; |XXXX  XX| $BBC3
       .byte $F3 ; |XXXX  XX| $BBC4
       .byte $F3 ; |XXXX  XX| $BBC5
       .byte $F3 ; |XXXX  XX| $BBC6
       .byte $F3 ; |XXXX  XX| $BBC7
       .byte $F3 ; |XXXX  XX| $BBC8
       .byte $F3 ; |XXXX  XX| $BBC9

LBBCA: LDY    #$01                    ;2
LBBCC: LDA    $8C                     ;3
       STA    $97                     ;3
       TYA                            ;2
       CLC                            ;2
       ADC    $97                     ;3
       TAX                            ;2
       LDA    LB49C,X                 ;4
       AND    #$F0                    ;2
       STA.wy $E0,Y                   ;5
       INY                            ;2
       CPY    #$0A                    ;2
       BNE    LBBCC                   ;2
       RTS                            ;6

LBBE3: LDA    $94                     ;3
       CMP    #$1F                    ;2
       BEQ    LBC06                   ;2
LBBE9: STA    AUDF0                   ;3
       TAY                            ;2
       LDA    $80                     ;3
       BPL    LBBF8                   ;2
       LDA    $F3                     ;3
       BEQ    LBBF8                   ;2
       TYA                            ;2
       EOR    #$FF                    ;2
       TAY                            ;2
LBBF8: TYA                            ;2
       STA    AUDC0                   ;3
       INC    $94                     ;5
       LDA    #$F0                    ;2
       STA    HMBL                    ;3
       LDA    #$0F                    ;2
       STA    AUDV0                   ;3
       RTS                            ;6

LBC06: LDA    #$00                    ;2
       STA    $94                     ;3
       JSR    LBC40                   ;6
       LDX    #$00                    ;2
LBC0F: STX    $F3                     ;3
       LDA    $A9,X                   ;4
       BEQ    LBC2F                   ;2
       LDA    #$25                    ;2
       STA    $97                     ;3
       LDA    $EB                     ;3
       STA    $F2                     ;3
       STX    $EB                     ;3
       JSR    LB299                   ;6
       LDA    $F2                     ;3
       STA    $EB                     ;3
       LDA    #$51                    ;2
       STA    $F4                     ;3
       LDX    $F3                     ;3
       DEC    $A9,X                   ;6
       RTS                            ;6

LBC2F: CPX    #$01                    ;2
       BEQ    LBC37                   ;2
       INX                            ;2
       JMP    LBC0F                   ;3
LBC37: LDA    #$10                    ;2
       STA    $F4                     ;3
       LDA    #$00                    ;2
       STA    AUDV0                   ;3
       RTS                            ;6

LBC40: STA    WSYNC                   ;3
       LDX    #$0C                    ;2
LBC44: DEX                            ;2
       BNE    LBC44                   ;2
       STA    RESBL                   ;3
       LDA    #$40                    ;2
       STA    HMBL                    ;3
       RTS                            ;6

LBC4E: LDY    #$FF                    ;2
       LDA    SWCHB                   ;4
       AND    #$08                    ;2
       BNE    LBC59                   ;2
       LDY    #$0F                    ;2
LBC59: STY    $9B                     ;3
       LDA    SWCHB                   ;4
       LSR                            ;2
       BCS    LBCB4                   ;2
       LDA    #$00                    ;2
       STA    $F6                     ;3
       LDA    $98                     ;3
       BNE    LBCB8                   ;2
LBC69: LDA    #$01                    ;2
       STA    $98                     ;3
       LDA    $99                     ;3
       EOR    #$01                    ;2
       BNE    LBC78                   ;2
       PLA                            ;4
       PLA                            ;4
       JMP    LB019                   ;3
LBC78: STA    $99                     ;3
       JSR    LBA41                   ;6
       LDA    $80                     ;3
       AND    #$7F                    ;2
       CMP    #$04                    ;2
       BPL    LBC87                   ;2
       BNE    LBC89                   ;2
LBC87: ORA    #$80                    ;2
LBC89: STA    $80                     ;3
       JSR    LBA1A                   ;6
       LDA    #$A6                    ;2
       STA    $EB                     ;3
       LDA    $80                     ;3
       CMP    #$02                    ;2
       BEQ    LBCAF                   ;2
       CMP    #$04                    ;2
       BEQ    LBCAF                   ;2
       LDA    #$00                    ;2
       STA    $84                     ;3
       STA    $85                     ;3
       STA    $86                     ;3
       STA    $87                     ;3
       LDX    #$00                    ;2
       JSR    LB2AD                   ;6
       INX                            ;2
       JSR    LB2AD                   ;6
LBCAF: PLA                            ;4
       PLA                            ;4
       JMP    LBDC5                   ;3
LBCB4: LDA    #$00                    ;2
       STA    $98                     ;3
LBCB8: RTS                            ;6

LBCB9: LDA    SWCHB                   ;4
       AND    #$02                    ;2
       BNE    LBCEF                   ;2
       LDA    $9A                     ;3
       BNE    LBCF8                   ;2
       LDA    #$01                    ;2
       STA    $9A                     ;3
LBCC8: LDA    $80                     ;3
       AND    #$7F                    ;2
       CMP    #$07                    ;2
       BNE    LBCD5                   ;2
       LDA    #$01                    ;2
       STA    $80                     ;3
       RTS                            ;6

LBCD5: INC    $80                     ;5
       LDX    #$00                    ;2
       STX    $84                     ;3
       STX    $86                     ;3
       STX    $85                     ;3
       STX    $87                     ;3
       LDY    #$10                    ;2
       STY    $AE                     ;3
       STY    $AF                     ;3
       JSR    LB2AD                   ;6
       INX                            ;2
       JSR    LB2AD                   ;6
       RTS                            ;6

LBCEF: LDA    #$00                    ;2
       STA    $9A                     ;3
       LDA    #$40                    ;2
       STA    $F5                     ;3
LBCF7: RTS                            ;6

LBCF8: INC    $F5                     ;5
       LDA    $F5                     ;3
       BPL    LBCF7                   ;2
       AND    #$08                    ;2
       BEQ    LBCF7                   ;2
       LDA    #$80                    ;2
       STA    $F5                     ;3
       BNE    LBCC8                   ;2
LBD08: JSR    LB052                   ;6
       LDA    $AE,X                   ;4
       TAY                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       STA    $97                     ;3
       TYA                            ;2
       AND    #$0F                    ;2
       CLC                            ;2
       ADC    $97                     ;3
       TAY                            ;2
       DEY                            ;2
       LDA    LBD22,Y                 ;4
       STA    $AC                     ;3
       RTS                            ;6

LBD22: .byte $14 ; |   X X  | $BD22
       .byte $12 ; |   X  X | $BD23
       .byte $10 ; |   X    | $BD24
       .byte $0E ; |    XXX | $BD25
       .byte $0C ; |    XX  | $BD26
       .byte $0B ; |    X XX| $BD27
       .byte $0A ; |    X X | $BD28
       .byte $09 ; |    X  X| $BD29
       .byte $07 ; |     XXX| $BD2A
       .byte $06 ; |     XX | $BD2B
       .byte $05 ; |     X X| $BD2C
       .byte $04 ; |     X  | $BD2D
       .byte $04 ; |     X  | $BD2E
       .byte $03 ; |      XX| $BD2F
       .byte $03 ; |      XX| $BD30
       .byte $03 ; |      XX| $BD31
       .byte $03 ; |      XX| $BD32
       .byte $03 ; |      XX| $BD33
       .byte $03 ; |      XX| $BD34

LBD35: LDA    $F6                     ;3
       BMI    LBD6E                   ;2
       LDA    $AD                     ;3
       AND    #$7F                    ;2
       CMP    #$5F                    ;2
       BNE    LBD6E                   ;2
       LDX    #$01                    ;2
       STX    $99                     ;3
       DEX                            ;2
       STX    $AD                     ;3
LBD48: LDA    $AE,X                   ;4
       STA    $97                     ;3
       AND    #$0F                    ;2
       CMP    #$09                    ;2
       BNE    LBD66                   ;2
       LDA    $97                     ;3
       AND    #$F0                    ;2
       CMP    #$90                    ;2
       BEQ    LBD62                   ;2
       CLC                            ;2
       ADC    #$10                    ;2
LBD5D: STA    $AE,X                   ;4
       JMP    LBD66                   ;3
LBD62: LDA    #$10                    ;2
       BNE    LBD5D                   ;2
LBD66: INX                            ;2
       CPX    #$02                    ;2
       BNE    LBD48                   ;2
       JMP    LB9E1                   ;3
LBD6E: LDA    $F1                     ;3
       BEQ    LBD86                   ;2
       INC    $AE                     ;5
       INC    $AF                     ;5
       LDA    $80                     ;3
       CMP    #$87                    ;2
       BNE    LBD83                   ;2
       JSR    LBA38                   ;6
       STA    $AE                     ;3
       STA    $AF                     ;3
LBD83: JMP    LB058                   ;3
LBD86: JSR    LBC4E                   ;6
       LDA    $99                     ;3
       BNE    LBDB3                   ;2
       JSR    LBA8D                   ;6
       LDA    #$04                    ;2
       STA    $96                     ;3
       LDA    #$00                    ;2
       STA    AUDV1                   ;3
       LDA    $80                     ;3
       AND    #$7F                    ;2
       CMP    #$04                    ;2
       BPL    LBDA4                   ;2
       LDA    #$A6                    ;2
       BNE    LBDA8                   ;2
LBDA4: LDA    $EB                     ;3
       EOR    #$FF                    ;2
LBDA8: STA    $EB                     ;3
       JSR    LBA1A                   ;6
       JSR    LBCB9                   ;6
       JMP    LBDBC                   ;3
LBDB3: JSR    LBB0B                   ;6
       JSR    LBA8D                   ;6
       JSR    LBAE6                   ;6
LBDBC: JSR    LB052                   ;6
       JSR    LB2AD                   ;6
       JSR    LBBCA                   ;6
LBDC5: LDA    $F6                     ;3
       BMI    LBDDC                   ;2
       LDA    $AD                     ;3
       BEQ    LBDE0                   ;2
       LDA    SWCHB                   ;4
       AND    #$0A                    ;2
       BNE    LBDE0                   ;2
       LDA    INPT4                   ;3

;       BMI    LBDE0                   ;2
;       LDA    INPT5                   ;3
;       BMI    LBDE0                   ;2
;LBDDC: LDA    #$FF                    ;2
;       BNE    LBDE2                   ;2

       ORA    INPT5                   ;3
       BMI    LBDE0                   ;2
LBDDC: LDA    #$FF                    ;2
       BNE    LBDE2                   ;2
       .byte $00,$00 ;free


LBDE0: LDA    #$00                    ;2
LBDE2: STA    $F6                     ;3
LBDE4: LDA    INTIM                   ;4
       BNE    LBDE4                   ;2
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    VBLANK                  ;3
       STA    COLUBK                  ;3
       STA    PF0                     ;3
       STA    PF1                     ;3
       STA    PF2                     ;3
       STA    NUSIZ1                  ;3
       LDA    #$02                    ;2
       STA    CTRLPF                  ;3
       LDA    $EB                     ;3
       LSR                            ;2
       BCC    LBE0E                   ;2
       LDA    #$00                    ;2
       STA    COLUP1                  ;3
       LDA    $EB                     ;3
       AND    $9B                     ;3
       STA    COLUP0                  ;3
       BNE    LBE18                   ;2
LBE0E: LDA    #$00                    ;2
       STA    COLUP0                  ;3
       LDA    $EB                     ;3
       AND    $9B                     ;3
       STA    COLUP1                  ;3
LBE18: LDA    #$00                    ;2
       STA    $97                     ;3
       LDY    #$09                    ;2
LBE1E: STA    WSYNC                   ;3
       STA    PF1                     ;3
       LDA    $97                     ;3
       STA    PF2                     ;3
       TYA                            ;2
       ORA    $8F                     ;3
       TAX                            ;2
       LDA    LB536,X                 ;4
       AND    #$F0                    ;2
       STA    $97                     ;3
       TYA                            ;2
       ORA    $8E                     ;3
       TAX                            ;2
       LDA    LB536,X                 ;4
       AND    #$0F                    ;2
       ORA    $97                     ;3
       STA    $97                     ;3
       TYA                            ;2
       ORA    $8D                     ;3
       TAX                            ;2
       LDA    LB49C,X                 ;4
       AND    #$0F                    ;2
       ORA.wy $E0,Y                   ;4
       DEY                            ;2
       BNE    LBE1E                   ;2
       STA    WSYNC                   ;3
       STA    PF1                     ;3
       STA    PF2                     ;3
       LDA    #$01                    ;2
       STA    CTRLPF                  ;3
       LDA    $AD                     ;3
       AND    $9B                     ;3
       STA    COLUBK                  ;3
       LDA    $AB                     ;3
       AND    $9B                     ;3
       STA    COLUPF                  ;3
       LDA    #$2D                    ;2
       AND    $9B                     ;3
       STA    COLUP0                  ;3
       AND    #$F7                    ;2
       STA    COLUP1                  ;3
       LDA    $81                     ;3
       STA    $8B                     ;3
       LDA    $F4                     ;3
       STA    $8A                     ;3
       LDA    #$03                    ;2
       STA    NUSIZ0                  ;3
       LDX    #$25                    ;2
       BNE    LBEBB                   ;2
       LDY    #$04                    ;2
LBE7F: STA    WSYNC                   ;3
LBE81: STY    $97                     ;3
       LDY    $8B                     ;3
       CPY    #$08                    ;2
       BCS    LBE8E                   ;2
       LDA.wy $A0,Y                   ;4
       STA    GRP1                    ;3
LBE8E: LDA    $BB,X                   ;4
       AND    #$08                    ;2
       BEQ    LBE9E                   ;2
       LDY    $97                     ;3
       LDA.wy $B1,Y                   ;4
       STA    GRP0                    ;3
       JMP    LBEAC                   ;3
LBE9E: LDA    #$00                    ;2
       LDY    $8A                     ;3
       CPY    #$03                    ;2
       BCS    LBEA8                   ;2
       LDA    #$02                    ;2
LBEA8: STA    ENABL                   ;3
       LDY    $97                     ;3
LBEAC: INC    $8A                     ;5
       INC    $8B                     ;5
       DEY                            ;2
       BMI    LBEBB                   ;2
       BNE    LBE7F                   ;2
       STA    WSYNC                   ;3
       STY    PF2                     ;3
       BEQ    LBE81                   ;2
LBEBB: LDA    $F6                     ;3
       BEQ    LBEC5                   ;2
       LDA    LBFB1,X                 ;4
       JMP    LBEC8                   ;3
LBEC5: LDA    LBFD6,X                 ;4
LBEC8: STA    PF2                     ;3
       LDY    #$04                    ;2
       DEX                            ;2
       BNE    LBE81                   ;2
       STA    HMCLR                   ;3
       STA    WSYNC                   ;3
       LDA    #$08                    ;2
       STA    COLUPF                  ;3
       LDA    #$FF                    ;2
       STA    PF0                     ;3
       STA    PF1                     ;3
       STA    PF2                     ;3
       BIT    $80                     ;3
       STX    GRP1                    ;3
       STX    GRP0                    ;3
       LDA    #$1A                    ;2
       AND    $9B                     ;3
       STA    COLUP0                  ;3
       STA    COLUP1                  ;3
       LDA    #$01                    ;2
       STA    NUSIZ0                  ;3
       LDA    #$00                    ;2
       STA    NUSIZ1                  ;3
       STA    WSYNC                   ;3
       STX    PF0                     ;3
       STX    PF1                     ;3
       STX    PF2                     ;3
       LDX    #$0F                    ;2
       LDA    $99                     ;3
       BEQ    LBF0B                   ;2
LBF03: STA    WSYNC                   ;3
       DEX                            ;2
       BPL    LBF03                   ;2
;       JMP    LBF7C                   ;3
       BMI    LBF7C                   ;2

LBF0B: LDA    #$10                    ;2
       STA    HMP1                    ;3
       NOP                            ;2
       STA    RESP0                   ;3
       STA    RESP1                   ;3
       LDA    $80                     ;3
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       STA    $97                     ;3
       LDA    #$00                    ;2
LBF1E: STA    PF2                     ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDA    LBF4E,X                 ;4
       STA    GRP0                    ;3
       LDA    LBF5D,X                 ;4
       STA    GRP1                    ;3
       TXA                            ;2
       SBC    #$05                    ;2
       AND    #$0F                    ;2
       ORA    $97                     ;3
       LDY    LBF6C,X                 ;4
       STY    GRP0                    ;3
       STA    HMCLR                   ;3
       TAY                            ;2
       LDA    LB49C,Y                 ;4
       AND    #$0F                    ;2
       STA    PF2                     ;3
       LDA    #$00                    ;2
       DEX                            ;2
       BPL    LBF1E                   ;2
       STA    PF2                     ;3
;       JMP    LBF7C                   ;3
LBF7C: LDX    #$0D                    ;2
       JSR    LB836                   ;6
;x is now = 0

       LDA    #$02                    ;2
       STA    WSYNC                   ;3
       STA    VBLANK                  ;3
       STA    VSYNC                   ;3


       LDA    #$2A                    ;2
       STA    TIM8T                   ;4
       LDA    $99                     ;3
       BEQ    LBFA0                   ;2
       LDA    $80                     ;3
       BPL    LBFA0                   ;2
       LDA    $F1                     ;3
       BNE    LBFA0                   ;2
       LDA    $EB                     ;3
       EOR    #$FF                    ;2
       STA    $EB                     ;3
LBFA0: LDA    INTIM                   ;4
       BNE    LBFA0                   ;2
       STA    WSYNC                   ;3
       STA    VSYNC                   ;3
       LDA    #$29                    ;2
       STA    TIM64T                  ;4
       JMP    LBD35                   ;3






LBFB1: .byte $00 ; |        | $BFB1
       .byte $00 ; |        | $BFB2
       .byte $F8 ; |XXXXX   | $BFB3
       .byte $00 ; |        | $BFB4
       .byte $48 ; | X  X   | $BFB5
       .byte $48 ; | X  X   | $BFB6
       .byte $58 ; | X XX   | $BFB7
       .byte $58 ; | X XX   | $BFB8
       .byte $68 ; | XX X   | $BFB9
       .byte $68 ; | XX X   | $BFBA
       .byte $48 ; | X  X   | $BFBB
       .byte $48 ; | X  X   | $BFBC
       .byte $00 ; |        | $BFBD
       .byte $48 ; | X  X   | $BFBE
       .byte $48 ; | X  X   | $BFBF
       .byte $48 ; | X  X   | $BFC0
       .byte $48 ; | X  X   | $BFC1
       .byte $78 ; | XXXX   | $BFC2
       .byte $48 ; | X  X   | $BFC3
       .byte $48 ; | X  X   | $BFC4
       .byte $30 ; |  XX    | $BFC5
       .byte $00 ; |        | $BFC6
       .byte $40 ; | X      | $BFC7
       .byte $40 ; | X      | $BFC8
       .byte $40 ; | X      | $BFC9
       .byte $40 ; | X      | $BFCA
       .byte $78 ; | XXXX   | $BFCB
       .byte $48 ; | X  X   | $BFCC
       .byte $48 ; | X  X   | $BFCD
       .byte $78 ; | XXXX   | $BFCE
       .byte $00 ; |        | $BFCF
       .byte $F8 ; |XXXXX   | $BFD0
       .byte $00 ; |        | $BFD1
       .byte $00 ; |        | $BFD2
       .byte $00 ; |        | $BFD3
       .byte $00 ; |        | $BFD4
       .byte $00 ; |        | $BFD5
LBFD6: .byte $00 ; |        | $BFD6
       .byte $00 ; |        | $BFD7
       .byte $A8 ; |X X X   | $BFD8
       .byte $F8 ; |XXXXX   | $BFD9
       .byte $A8 ; |X X X   | $BFDA
       .byte $F8 ; |XXXXX   | $BFDB
       .byte $A8 ; |X X X   | $BFDC
       .byte $F8 ; |XXXXX   | $BFDD
       .byte $A8 ; |X X X   | $BFDE
       .byte $F8 ; |XXXXX   | $BFDF
       .byte $A8 ; |X X X   | $BFE0
       .byte $F8 ; |XXXXX   | $BFE1
       .byte $A8 ; |X X X   | $BFE2
       .byte $F8 ; |XXXXX   | $BFE3
       .byte $A8 ; |X X X   | $BFE4
       .byte $F8 ; |XXXXX   | $BFE5
       .byte $A8 ; |X X X   | $BFE6
       .byte $F8 ; |XXXXX   | $BFE7
       .byte $A8 ; |X X X   | $BFE8
       .byte $F8 ; |XXXXX   | $BFE9
       .byte $A8 ; |X X X   | $BFEA
       .byte $F8 ; |XXXXX   | $BFEB
       .byte $A8 ; |X X X   | $BFEC
       .byte $F8 ; |XXXXX   | $BFED
       .byte $A8 ; |X X X   | $BFEE
       .byte $F8 ; |XXXXX   | $BFEF
       .byte $A8 ; |X X X   | $BFF0
       .byte $F8 ; |XXXXX   | $BFF1
       .byte $A8 ; |X X X   | $BFF2
       .byte $F8 ; |XXXXX   | $BFF3
       .byte $A8 ; |X X X   | $BFF4
       .byte $F8 ; |XXXXX   | $BFF5
       .byte $00 ; |        | $BFF6
       .byte $00 ; |        | $BFF7
       .byte $00 ; |        | $BFF8
       .byte $00 ; |        | $BFF9
;       .byte $00 ; |        | $BFFA
;       .byte $00 ; |        | $BFFB
LBF4E: .byte $00 ; |        | $BF4E
       .byte $00 ; |        | $BF4F
       .byte $05 ; |     X X| $BF50
       .byte $0A ; |    X X | $BF51
       .byte $EA ; |XXX X X | $BF52
       .byte $28 ; |  X X   | $BF53
       .byte $4E ; | X  XXX | $BF54
       .byte $80 ; |X       | $BF55
       .byte $E7 ; |XXX  XXX| $BF56
       .byte $08 ; |    X   | $BF57
       .byte $EB ; |XXX X XX| $BF58
       .byte $AA ; |X X X X | $BF59
       .byte $AB ; |X X X XX| $BF5A
       .byte $A8 ; |X X X   | $BF5B
       .byte $A7 ; |X X  XXX| $BF5C
LBF5D: .byte $00 ; |        | $BF5D
       .byte $00 ; |        | $BF5E
       .byte $A8 ; |X X X   | $BF5F
       .byte $A8 ; |X X X   | $BF60
       .byte $EA ; |XXX X X | $BF61
       .byte $AA ; |X X X X | $BF62
       .byte $EF ; |XXX XXXX| $BF63
       .byte $00 ; |        | $BF64
       .byte $91 ; |X  X   X| $BF65
       .byte $51 ; | X X   X| $BF66
       .byte $51 ; | X X   X| $BF67
       .byte $57 ; | X X XXX| $BF68
       .byte $55 ; | X X X X| $BF69
       .byte $55 ; | X X X X| $BF6A
       .byte $97 ; |X  X XXX| $BF6B
LBF6C: .byte $00 ; |        | $BF6C
       .byte $00 ; |        | $BF6D
       .byte $B7 ; |X XX XXX| $BF6E
       .byte $A1 ; |X X    X| $BF6F
       .byte $B2 ; |X XX  X | $BF70
       .byte $A4 ; |X X  X  | $BF71
       .byte $B7 ; |X XX XXX| $BF72
       .byte $00 ; |        | $BF73
       .byte $77 ; | XXX XXX| $BF74
       .byte $54 ; | X X X  | $BF75
       .byte $54 ; | X X X  | $BF76
       .byte $72 ; | XXX  X | $BF77
       .byte $51 ; | X X   X| $BF78
       .byte $55 ; | X X X X| $BF79
       .byte $72 ; | XXX  X | $BF7A
       .byte $00 ; |        | $BF7B


;free
       .byte $00 ; |        | $BF7B
       .byte $00 ; |        | $BF7B


       ORG $BFF8
       .word 0,0,START,START
