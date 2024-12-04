; Disassembly of tacscan.bin
; Disassembled Mon Mar 07 01:20:44 2005
; Using DiStella v2.0
;
; Command Line: C:\BIN\DISTELLA.EXE -pafsctacscan.cfg tacscan.bin 
;
; tacscan.cfg contents:
;
;      CODE F000 FCFA
;      GFX FCFB FCFF
;      CODE FD00 FDAA
;      GFX FDAB FDFF
;      CODE FE00 FE14
;      GFX FE15 FED1
;      CODE FED2 FEF7
;      GFX FEF8 FFEA
;      CODE FFEB FFF1
;      GFX FFF2 FFFF
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
REFP0   =  $0B
REFP1   =  $0C
PF2     =  $0F
RESP0   =  $10
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
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A

INPT0   =  $38

INPT3   =  $3B


SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296


TM25    =  $25
TM18    =  $18
TM27    =  $27

ORIGCONT = 0 ;1=use paddle(3), 0=use paddle(0)
ORIGFONT = 0 ;1=use 9 points, 0=use 6 points



       ORG $F000


LFFF2: .byte $00 ; |        | $FFF2
LFFF3: .byte $09 ; |    X  X| $FFF3
       .byte $12 ; |   X  X | $FFF4
       .byte $1B ; |   XX XX| $FFF5
       .byte $24 ; |  X  X  | $FFF6
       .byte $2D ; |  X XX X| $FFF7
       .byte $36 ; |  XX XX | $FFF8
       .byte $3F ; |  XXXXXX| $FFF9
       .byte $48 ; | X  X   | $FFFA
       .byte $51 ; | X X   X| $FFFB



START:
       SEI                            ;2
       CLD                            ;2
       LDX    #$28                    ;2
       LDA    #$00                    ;2
LF006: STA    NUSIZ0,X                ;4
       DEX                            ;2
       BPL    LF006                   ;2
       TXS                            ;2
LF00C: STA    VSYNC,X                 ;4
       DEX                            ;2
       BMI    LF00C                   ;2
       DEC    $F7                     ;5
LF013: LDX    #$06                    ;2
       STX    $E1                     ;3
LF017: LDA    LFFDD,X                 ;4
       STA    $E2,X                   ;4
       LDA    LFFE4,X                 ;4
       STA    $E9,X                   ;4
       DEX                            ;2
       BPL    LF017                   ;2
       LDA    #$7F                    ;2
       STA    $B1                     ;3
       STA    CTRLPF                  ;3
       LDY    #$FF                    ;2
       STY    $DD                     ;3
       STY    $BE                     ;3
       STY    $88                     ;3
       LDA    #$00                    ;2
       STA    $A9                     ;3
       STA    $AF                     ;3
       STA    $AC                     ;3
       STA    $CE                     ;3
       STA    $B6                     ;3
       LDX    #$0B                    ;2
LF040: STY    $CF,X                   ;4
       DEX                            ;2
       STA    $CF,X                   ;4
       DEX                            ;2
       BPL    LF040                   ;2
       LDX    #$03                    ;2
       STX    $B8                     ;3
       INX                            ;2
LF04D: ADC    #$19                    ;2
       STA    $98,X                   ;4
       STY    $8A,X                   ;4
       STY    $9E,X                   ;4
       STY    $C0,X                   ;4
       DEX                            ;2
       BPL    LF04D                   ;2
       LDA    #$01                    ;2
       STA    $B7                     ;3
       STA    $A4                     ;3
       LDA    #$46                    ;2
       STA    $B9                     ;3
       LDA    #$3E                    ;2
       STA    $BA                     ;3
LF068: JMP    LF85E                   ;3
LF06B: LDA    $F7                     ;3
       BMI    LF072                   ;2
       JMP    LFACC                   ;3
LF072: LDA    INTIM                   ;4
       BNE    LF072                   ;2
       LDA    #$82                    ;2
       STA    WSYNC                   ;3
       STA    VBLANK                  ;3

;       STA    WSYNC                   ;3
;       STA    WSYNC                   ;3
;       STA    WSYNC                   ;3

       STA    VSYNC                   ;3

;       STA    WSYNC                   ;3
;       STA    WSYNC                   ;3

       LDA    #$00                    ;2
       STA    WSYNC                   ;3
       STA    VSYNC                   ;3
       LDA    #TM25                   ;2
       STA    TIM64T                  ;4
       LDA    #$C4                    ;2
       STA    $B0                     ;3
       LDA    #$20                    ;2
       STA    HMBL                    ;3
       LDY    #$5A                    ;2
       STY    $F3                     ;3
       STY    $D9                     ;3
       STA    WSYNC                   ;3
       STA    RESBL                   ;3
       STA    HMOVE                   ;3
       LDA    $80                     ;3
       ADC    $A7                     ;3
       CLC                            ;2
       STA    COLUBK                  ;3
       LDA    #$00                    ;2
       STA    HMBL                    ;3
       LDA    $B9                     ;3
       BPL    LF0BF                   ;2
       LDA    $BA                     ;3
       BPL    LF0BF                   ;2
       LDA    #$FF                    ;2
       STA    $F7                     ;3
LF0BF: LDA    $F7                     ;3
       BPL    LF0C9                   ;2
       JMP    LFBD0                   ;3
LF0C6: JMP    LF1E0                   ;3
LF0C9: LDA    $AC                     ;3
       STA    $F9                     ;3
       INC    $F9                     ;5
       AND    #$03                    ;2
       TAX                            ;2
       LDA    LFE15,X                 ;4
       STA    $80                     ;3
       LDA    LFE19,X                 ;4
       STA    $87                     ;3
       LDA    LFEFC,X                 ;4
       STA    $97                     ;3
       LDA    $A4                     ;3
       CMP    #$01                    ;2
       BNE    LF0C6                   ;2
       LDA    $88                     ;3
       BPL    LF0C6                   ;2
       LDA    $AD                     ;3
       BPL    LF0C6                   ;2
       CMP    #$FF                    ;2
       BNE    LF144                   ;2
       LDX    #$04                    ;2
LF0F5: LDA    $C0,X                   ;4
       BEQ    LF0FF                   ;2
       DEX                            ;2
       BPL    LF0F5                   ;2
       JMP    LF1B4                   ;3
LF0FF: LDA    $81                     ;3
       BNE    LF113                   ;2
       LDY    #$5A                    ;2
       STY    $81                     ;3
       LDX    #$08                    ;2
LF109: LDA    $CF,X                   ;4
       STY    $CF,X                   ;4
       STA    $F2,X                   ;4
       DEX                            ;2
       DEX                            ;2
       BPL    LF109                   ;2
LF113: LDA    #$00                    ;2
       STA    $D9                     ;3
       STA    $D7                     ;3
       LDY    $B6                     ;3
       CPY    #$0A                    ;2
       BCC    LF128                   ;2
       TYA                            ;2
       SBC    #$0A                    ;2
       TAY                            ;2
       LDA    #$09                    ;2
       JSR    LF55C                   ;6
LF128: LDA    LFFF2,Y                 ;4
       JSR    LF558                   ;6
       LDA    $D9                     ;3
       STA    $96                     ;3
       LDA    #$5A                    ;2
       STA    $D9                     ;3
       DEC    $AD                     ;5
       LDA    #$FF                    ;2
       STA    $BE                     ;3
       STA    $9F                     ;3
       STA    $9E                     ;3
       LDA    #$4E                    ;2
       STA    $99                     ;3
LF144: LDA    #$01                    ;2
       STA    $A8                     ;3
       STA    $F9                     ;3
       LDA    $9F                     ;3
       CMP    #$C5                    ;2
       BCS    LF160                   ;2
       AND    #$03                    ;2
       BNE    LF160                   ;2
       LDA    $F0                     ;3
       BMI    LF15E                   ;2
       BEQ    LF160                   ;2
       DEC    $99                     ;5
       BNE    LF160                   ;2
LF15E: INC    $99                     ;5
LF160: LDA    $9F                     ;3
       CMP    #$23                    ;2
       BNE    LF183                   ;2
       LDX    #$00                    ;2
       LDA    $99                     ;3
LF16A: CMP    LFFD3,X                 ;4
       BCC    LF1CB                   ;2
       CMP    LFFD8,X                 ;4
       BCS    LF17C                   ;2
       LDY    $C0,X                   ;4
       BNE    LF1CB                   ;2
       STA    $C0,X                   ;4
       BEQ    LF1A4                   ;2
LF17C: CPX    #$01                    ;2
       BEQ    LF1CB                   ;2
       INX                            ;2
       BPL    LF16A                   ;2
LF183: CMP    #$14                    ;2
       BNE    LF1CB                   ;2
       LDA    $99                     ;3
       LDX    #$02                    ;2
LF18B: CMP    LFFD3,X                 ;4
       BCC    LF1B4                   ;2
       CMP    LFFD8,X                 ;4
       BCS    LF19D                   ;2
       LDY    $C0,X                   ;4
       BNE    LF1B4                   ;2
       STA    $C0,X                   ;4
       BEQ    LF1A4                   ;2
LF19D: CPX    #$04                    ;2
       BEQ    LF1B4                   ;2
       INX                            ;2
       BPL    LF18B                   ;2
LF1A4: LDA    #$00                    ;2
       STA    $95                     ;3
       DEC    $B6                     ;5
       LDA    $B6                     ;3
       BEQ    LF1B4                   ;2
       LDA    #$FF                    ;2
       STA    $AD                     ;3
       BNE    LF1DB                   ;2
LF1B4: LDA    $81                     ;3
       BEQ    LF1C6                   ;2
       LDX    #$08                    ;2
LF1BA: LDA    $F2,X                   ;4
       STA    $CF,X                   ;4
       STX    $96                     ;3
       STX    $81                     ;3
       DEX                            ;2
       DEX                            ;2
       BPL    LF1BA                   ;2
LF1C6: JSR    LFBB4                   ;6
       BPL    LF1E0                   ;2
LF1CB: LDA    $9F                     ;3
       CMP    #$C5                    ;2
       BNE    LF1DB                   ;2
       DEC    $95                     ;5
       LDX    $E1                     ;3
       LDA    $E9,X                   ;4
       CMP    #$A8                    ;2
       BCS    LF248                   ;2
LF1DB: DEC    $9F                     ;5
       JMP    LF248                   ;3
LF1E0: LDA    $DF                     ;3
       BEQ    LF248                   ;2
       DEC    $DF                     ;5
       LDA    #$1E                    ;2
       STA    $B3                     ;3
       LDA    #$00                    ;2
       STA    $A8                     ;3
       LDA    $B9                     ;3
       LDY    $B2                     ;3
       BMI    LF1FD                   ;2
       CLC                            ;2
       ADC    #$04                    ;2
       CPY    #$00                    ;2
       BEQ    LF1FD                   ;2
       ADC    #$04                    ;2
LF1FD: STA    $C5                     ;3
       LDY    $C0                     ;3
       BEQ    LF208                   ;2
       STA    $C7                     ;3
       CLC                            ;2
       ADC    #$10                    ;2
LF208: LDY    $C1                     ;3
       BEQ    LF20E                   ;2
       STA    $C8                     ;3
LF20E: LDA    $BA                     ;3
       LDY    $B2                     ;3
       BMI    LF21D                   ;2
       CLC                            ;2
       ADC    #$04                    ;2
       CPY    #$00                    ;2
       BEQ    LF21D                   ;2
       ADC    #$04                    ;2
LF21D: STA    $C6                     ;3
       LDY    $C2                     ;3
       BEQ    LF227                   ;2
       STA    $C9                     ;3
       ADC    #$10                    ;2
LF227: LDX    $C3                     ;3
       BEQ    LF22F                   ;2
       STA    $CA                     ;3
       LDY    #$01                    ;2
LF22F: CPY    #$00                    ;2
       BEQ    LF236                   ;2
       CLC                            ;2
       ADC    #$10                    ;2
LF236: LDX    $C4                     ;3
       BEQ    LF23C                   ;2
       STA    $CB                     ;3
LF23C: LDA    #$1B                    ;2
       STA    $BE                     ;3
       LDA    $B7                     ;3
       STA    $B4                     ;3
       LDA    $B8                     ;3
       STA    $B5                     ;3
LF248: LDX    $88                     ;3
LF24A: BMI    LF26E                   ;2
       LDY    $F0                     ;3
       BEQ    LF26E                   ;2
       BMI    LF25F                   ;2
       LDA    $8E,X                   ;4
       BNE    LF25A                   ;2
       LDA    #$A1                    ;2
       STA    $8E,X                   ;4
LF25A: DEC    $8E,X                   ;6
       JMP    LF26B                   ;3
LF25F: LDA    $8E,X                   ;4
       CMP    #$A0                    ;2
       BNE    LF269                   ;2
       LDA    #$FF                    ;2
       STA    $8E,X                   ;4
LF269: INC    $8E,X                   ;6
LF26B: DEX                            ;2
       BPL    LF24A                   ;2
LF26E: JSR    LFB5C                   ;6
       LDA    $AE                     ;3
       BMI    LF292                   ;2
       LDY    #$74                    ;2
       LDX    #$05                    ;2
       CMP    #$06                    ;2
       BCC    LF281                   ;2
       LDY    #$67                    ;2
       LDX    #$07                    ;2
LF281: LDA    $F7                     ;3
       CMP    #$02                    ;2
       BCC    LF28E                   ;2
       STY    $F3                     ;3
       BCS    LF290                   ;2
LF28B: JMP    LF581                   ;3
LF28E: STY    $D9                     ;3
LF290: STX    $98                     ;3
LF292: DEC    $9D                     ;5
       LDA    $9D                     ;3
       CMP    #$FB                    ;2
       BNE    LF29E                   ;2
       LDA    #$03                    ;2
       STA    $9D                     ;3
LF29E: LDX    $A4                     ;3
       DEX                            ;2
       STX    $A3                     ;3
       LDX    $E1                     ;3
       STX    $E0                     ;3
       LDX    #$05                    ;2
LF2A9: DEX                            ;2
       BEQ    LF2B9                   ;2
       LDA    $81,X                   ;4
       BEQ    LF2A9                   ;2
       CMP    #$01                    ;2
       BNE    LF2A9                   ;2
       DEC    $81,X                   ;6
       JSR    LF784                   ;6
LF2B9: LDA    $BE                     ;3
       CMP    #$FF                    ;2
       BNE    LF2C5                   ;2
       LDA    $88                     ;3
       BMI    LF28B                   ;2
       BPL    LF341                   ;2
LF2C5: LDA    $BE                     ;3
       ADC    #$06                    ;2
       STA    $BE                     ;3
       LDA    $B2                     ;3
       AND    #$01                    ;2
       BEQ    LF2D5                   ;2
       INC    $BE                     ;5
       INC    $BE                     ;5
LF2D5: LDA    $BE                     ;3
       CMP    #$C5                    ;2
       BCC    LF2E1                   ;2
       LDA    #$FF                    ;2
       STA    $BE                     ;3
       STA    $B3                     ;3
LF2E1: LDA    $BE                     ;3
       SEC                            ;2
       SBC    #$0E                    ;2
       STA    $BF                     ;3
       LDX    $A4                     ;3
LF2EA: DEX                            ;2
       BEQ    LF341                   ;2
       STX    $F1                     ;3
       LDA    $81,X                   ;4
       BNE    LF2EA                   ;2
       LDA    $9E,X                   ;4
       CMP    $BE                     ;3
       BCC    LF319                   ;2
       SBC    #$16                    ;2
       CMP    $BE                     ;3
       BCS    LF319                   ;2
       LDA    $98,X                   ;4
       LDX    #$01                    ;2
LF303: LDY    $C0,X                   ;4
       BEQ    LF316                   ;2
       CMP    $C7,X                   ;4
       BEQ    LF352                   ;2
       BCS    LF319                   ;2
       ADC    #$0B                    ;2
       CMP    $C7,X                   ;4
       BCS    LF352                   ;2
       SEC                            ;2
       SBC    #$0B                    ;2
LF316: DEX                            ;2
       BEQ    LF303                   ;2
LF319: LDX    $F1                     ;3
       LDA    $9E,X                   ;4
       CMP    $BF                     ;3
       BCC    LF2EA                   ;2
       SBC    #$16                    ;2
       CMP    $BF                     ;3
       BCS    LF2EA                   ;2
       LDA    $98,X                   ;4
       LDX    #$02                    ;2
LF32B: LDY    $C2,X                   ;4
       BEQ    LF33E                   ;2
       CMP    $C9,X                   ;4
       BEQ    LF352                   ;2
       BCS    LF341                   ;2
       ADC    #$0B                    ;2
       CMP    $C9,X                   ;4
       BCS    LF352                   ;2
       SEC                            ;2
       SBC    #$0B                    ;2
LF33E: DEX                            ;2
       BPL    LF32B                   ;2
LF341: LDA    $A8                     ;3
       BNE    LF3B9                   ;2
       LDA    $C5                     ;3
       LDX    #$02                    ;2
       JSR    LFE00                   ;6
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       BMI    LF3BC                   ;2
LF352: LDX    $F1                     ;3
       LDA    $9E,X                   ;4
       CMP    $BD                     ;3
       BNE    LF36B                   ;2
       LDA    #$2D                    ;2
       JSR    LF568                   ;6
       LDA    #$0E                    ;2
       STA    $F5                     ;3
       STA    $AB                     ;3
       STA    $AF                     ;3
       LDA    #$00                    ;2
       STA    $BD                     ;3
LF36B: INC    $86                     ;5
       LDX    $AC                     ;3
       LDA    LFFF3,X                 ;4
       JSR    LF568                   ;6
       LDA    $AD                     ;3
       BNE    LF39F                   ;2
       LDA    $B6                     ;3
       CMP    #$13                    ;2
       BEQ    LF381                   ;2
       INC    $B6                     ;5
LF381: LDX    $AC                     ;3
       CPX    #$03                    ;2
       BCC    LF38F                   ;2
       LDA    #$12                    ;2
       JSR    LF560                   ;6
       JMP    LF395                   ;3
LF38F: LDA    LFDF8,X                 ;4
       JSR    LF564                   ;6
LF395: LDA    #$2D                    ;2
       STA    $F5                     ;3
       INC    $CE                     ;5
       LDA    #$00                    ;2
       STA    $BD                     ;3
LF39F: LDA    $AD                     ;3
       BMI    LF3A5                   ;2
       DEC    $AD                     ;5
LF3A5: LDX    $F1                     ;3
       LDA    #$0F                    ;2
       STA    $81,X                   ;4
       LDA    #$0E                    ;2
       STA    $A7                     ;3
       LDA    #$0F                    ;2
       STA    $A5                     ;3
       LDA    #$FF                    ;2
       STA    $B3                     ;3
       DEC    $A3                     ;5
LF3B9: JMP    LF581                   ;3
LF3BC: LDY    #$00                    ;2
LF3BE: LDX    $88                     ;3
       BMI    LF3FF                   ;2
LF3C2: LDA.wy $9E,Y                   ;4
       CMP    $8A,X                   ;4
       BCC    LF3D4                   ;2
       SBC    #$13                    ;2
       CMP    $8A,X                   ;4
       BCS    LF3D4                   ;2
       DEY                            ;2
       STY    $A3                     ;3
       BPL    LF3DE                   ;2
LF3D4: DEX                            ;2
       BPL    LF3C2                   ;2
       CPY    $A3                     ;3
       BCS    LF3DE                   ;2
       INY                            ;2
       BPL    LF3BE                   ;2
LF3DE: LDY    #$00                    ;2
LF3E0: LDX    $88                     ;3
LF3E2: LDA.wy $E9,Y                   ;4
       CMP    $8A,X                   ;4
       BCC    LF3F5                   ;2
       SBC    #$05                    ;2
       CMP    $8A,X                   ;4
       BCS    LF3F5                   ;2
       DEY                            ;2
       STY    $E0                     ;3
       JMP    LF3FF                   ;3
LF3F5: DEX                            ;2
       BPL    LF3E2                   ;2
       CPY    $E0                     ;3
       BCS    LF3FF                   ;2
       INY                            ;2
       BPL    LF3E0                   ;2
LF3FF: LDA    INTIM                   ;4
       BNE    LF3FF                   ;2
       STA    WSYNC                   ;3
       STA    VBLANK                  ;3
       STA    WSYNC                   ;3
       STA    HMM0                    ;3
       LDA    #$02                    ;2
       STA    ENABL                   ;3
       STA    WSYNC                   ;3
LF412: LDA    $B0                     ;3
       LDX    $E0                     ;3
       BMI    LF421                   ;2
       CMP    $E9,X                   ;4
       BNE    LF421                   ;2
       JSR    LF51E                   ;6
       BPL    LF412                   ;2
LF421: LDX    #$00                    ;2
       CMP    $8A                     ;3
       BEQ    LF45B                   ;2
       CMP    $8B                     ;3
       BEQ    LF45A                   ;2
       CMP    $8C                     ;3
       BEQ    LF459                   ;2
       CMP    $8D                     ;3
       BEQ    LF458                   ;2
       CMP    $BE                     ;3
       BEQ    LF481                   ;2
       LDX    $A3                     ;3
       CMP    $9E,X                   ;4
       BNE    LF447                   ;2
       STA    WSYNC                   ;3
       SEC                            ;2
       SBC    #$11                    ;2
       STA    $B0                     ;3
       JSR    LFD38                   ;6
LF447: DEC    $B0                     ;5
       STA    WSYNC                   ;3
       BNE    LF412                   ;2
       LDA    $BC                     ;3
       STA    $BB                     ;3
       LDA    #$01                    ;2
       STA    $A8                     ;3
       JMP    LF69F                   ;3
LF458: INX                            ;2
LF459: INX                            ;2
LF45A: INX                            ;2
LF45B: STA    WSYNC                   ;3
       SEC                            ;2
       SBC    #$0B                    ;2
       STA    $B0                     ;3
       LDA    #$0F                    ;2
       STA    COLUP0                  ;3
       LDA    $8E,X                   ;4
       LDX    #$00                    ;2
       JSR    LFE00                   ;6
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STX    NUSIZ0                  ;3
       LDX    #$06                    ;2
LF475: LDA    LFECB,X                 ;4
       STA    WSYNC                   ;3
       STA    GRP0                    ;3
       DEX                            ;2
       BMI    LF447                   ;2
       BPL    LF475                   ;2
LF481: LDA    #$0F                    ;2
       STA    COLUP0                  ;3
       LDA    $B4                     ;3
       STA    WSYNC                   ;3
       LDX    $B2                     ;3
       BEQ    LF490                   ;2
       CLC                            ;2
       ADC    #$10                    ;2
LF490: STA    NUSIZ0                  ;3
       LDA    #$00                    ;2
       LDX    $B2                     ;3
       BEQ    LF49F                   ;2
       BPL    LF49C                   ;2
       LDA    #$E0                    ;2
LF49C: CLC                            ;2
       ADC    #$10                    ;2
LF49F: STA    HMM0                    ;3
       LDA    #$02                    ;2
       LDX    $B4                     ;3
       BPL    LF4A9                   ;2
       LDA    #$00                    ;2
LF4A9: STA    ENAM0                   ;3
       LDA    $B0                     ;3
       SEC                            ;2
       SBC    #$19                    ;2
       STA    $B0                     ;3
       LDY    #$00                    ;2
       LDX    #$09                    ;2
LF4B6: STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       CPX    #$05                    ;2
       BNE    LF4C4                   ;2
       LDA    $B2                     ;3
       BEQ    LF4C4                   ;2
       STY    ENAM0                   ;3
LF4C4: DEX                            ;2
       BPL    LF4B6                   ;2
       STY    ENAM0                   ;3
       LDA    $B5                     ;3
       LDX    $B2                     ;3
       BEQ    LF4D2                   ;2
       CLC                            ;2
       ADC    #$10                    ;2
LF4D2: STA    NUSIZ0                  ;3
       LDA    $C6                     ;3
       LDX    #$02                    ;2
       JSR    LFE00                   ;6
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDA    #$02                    ;2
       LDX    $B5                     ;3
       BPL    LF4E7                   ;2
       LDA    #$00                    ;2
LF4E7: STA    WSYNC                   ;3
       STA    ENAM0                   ;3
       LDA    #$00                    ;2
       LDX    $B2                     ;3
       BEQ    LF4F8                   ;2
       BPL    LF4F5                   ;2
       LDA    #$E0                    ;2
LF4F5: CLC                            ;2
       ADC    #$10                    ;2
LF4F8: STA    HMM0                    ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDX    #$03                    ;2
LF500: STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       DEX                            ;2
       BPL    LF500                   ;2
       INX                            ;2
       LDA    $B2                     ;3
       BEQ    LF50E                   ;2
       STX    ENAM0                   ;3
LF50E: LDY    #$03                    ;2
LF510: STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       DEY                            ;2
       BPL    LF510                   ;2
       STX    ENAM0                   ;3
       STA    WSYNC                   ;3
       JMP    LF412                   ;3
LF51E: LDA    $E2,X                   ;4
       LDX    #$01                    ;2
       JSR    LFE00                   ;6

  IF ORIGCONT
       LDA    INPT3                   ;3
  ELSE
       LDA    INPT0                   ;3
  ENDIF

       BMI    LF52D                   ;2
       INC    $BB                     ;5
       INC    $BB                     ;5
LF52D: STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       JSR    LFFEB                   ;6
       DEC    $E0                     ;5
       LDA    $B0                     ;3
       SEC                            ;2
       SBC    #$05                    ;2
       STA    $B0                     ;3
       LDA    #$0F                    ;2
       STA    COLUP1                  ;3
       LDA    #$06                    ;2
       STA    NUSIZ1                  ;3
       LDA    #$10                    ;2
       STA    WSYNC                   ;3
       STA    GRP1                    ;3
       JSR    LFFEB                   ;6
       JSR    LFFEB                   ;6
       LDA    #$00                    ;2
       STA    WSYNC                   ;3
       STA    GRP1                    ;3
       RTS                            ;6

LF558: LDX    #$0A                    ;2
       BNE    LF56A                   ;2
LF55C: LDX    #$08                    ;2
       BNE    LF56A                   ;2
LF560: LDX    #$02                    ;2
       BNE    LF56A                   ;2
LF564: LDX    #$04                    ;2
       BNE    LF56A                   ;2
LF568: LDX    #$06                    ;2
LF56A: STX    $F7                     ;3
LF56C: CLC                            ;2
       ADC    $CF,X                   ;4
       SEC                            ;2
       SBC    #$5A                    ;2
       BCC    LF57C                   ;2
       STA    $CF,X                   ;4
       LDA    #$09                    ;2
       DEX                            ;2
       DEX                            ;2
       BPL    LF56C                   ;2
LF57C: ADC    #$5A                    ;2
       STA    $CF,X                   ;4
       RTS                            ;6

LF581: LDA    #$01                    ;2
       STA    $A8                     ;3
       LDA    $A4                     ;3
       CMP    #$01                    ;2
       BNE    LF5A4                   ;2
       LDA    $AD                     ;3
       CMP    #$F0                    ;2
       BCC    LF5A4                   ;2
       CMP    #$FF                    ;2
       BEQ    LF5A4                   ;2
       LDA    $9F                     ;3
       CMP    #$C5                    ;2
       BCS    LF5A4                   ;2
       AND    #$01                    ;2
       BNE    LF5A2                   ;2
       JMP    LF70E                   ;3
LF5A2: INC    $AD                     ;5
LF5A4: LDA    $B7                     ;3
       STA    NUSIZ0                  ;3
       LDA    $B9                     ;3
       LDX    #$00                    ;2
       STA    WSYNC                   ;3
       JSR    LFE00                   ;6
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
LF5B5: LDA    INTIM                   ;4
       BNE    LF5B5                   ;2
       STA    $BB                     ;3
       STA    WSYNC                   ;3
       STA    VBLANK                  ;3
       STA    WSYNC                   ;3
       STA    HMP0                    ;3
       LDA    #$02                    ;2
       STA    ENABL                   ;3
       LDA    $F7                     ;3
       BPL    LF5CF                   ;2
       JMP    LFBF9                   ;3
LF5CF: STA    WSYNC                   ;3
LF5D1: LDA    $B0                     ;3
       LDX    $A3                     ;3
       BEQ    LF5ED                   ;2
       CMP    $9E,X                   ;4
       BNE    LF5ED                   ;2
       SEC                            ;2
       SBC    #$11                    ;2
       STA    $B0                     ;3
       STA    WSYNC                   ;3

  IF ORIGCONT
       LDA    INPT3                   ;3
  ELSE
       LDA    INPT0                   ;3
  ENDIF

       BMI    LF5E8                   ;2
       INC    $BB                     ;5
LF5E8: JSR    LFD38                   ;6
       BMI    LF5FC                   ;2
LF5ED: CMP    #$29                    ;2
       BEQ    LF61F                   ;2
       LDX    $E0                     ;3
       BMI    LF5FC                   ;2
       CMP    $E9,X                   ;4
       BNE    LF5FC                   ;2
       JSR    LF51E                   ;6
LF5FC: DEC    $B0                     ;5

  IF ORIGCONT
       LDA    INPT3                   ;3
  ELSE
       LDA    INPT0                   ;3
  ENDIF

       BMI    LF604                   ;2
       INC    $BB                     ;5
LF604: STA    WSYNC                   ;3
       JMP    LF5D1                   ;3

LF609: JSR    LFED2                   ;6
       BMI    LF641                   ;2
LF60E: STA    WSYNC                   ;3
       STX    PF2                     ;3
       STX    COLUPF                  ;3
       STA    WSYNC                   ;3
       STA    WSYNC                   ;3
       STA    WSYNC                   ;3
       JSR    LFED2                   ;6
       BMI    LF66B                   ;2
LF61F: LDA    $AE                     ;3
       BMI    LF629                   ;2
       LDA    #$28                    ;2
       EOR    $AE                     ;3
       STA    COLUP1                  ;3
LF629: LDX    $98                     ;3
       STX    NUSIZ1                  ;3
       LDX    #$01                    ;2
       LDA    $A6                     ;3
       STA    WSYNC                   ;3
       JSR    LFE00                   ;6
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDA    $B9                     ;3
       BMI    LF609                   ;2
       JSR    LFD00                   ;6
LF641: LDA    $AD                     ;3
       BPL    LF64B                   ;2
       LDA    #$60                    ;2
       STA    PF2                     ;3
       DEC    COLUPF                  ;5
LF64B: LDA    $B8                     ;3
       STA    NUSIZ0                  ;3
       LDA    $F3                     ;3
       STA    $D9                     ;3
       LDX    #$00                    ;2
       STX    HMP1                    ;3
       LDA    $BA                     ;3
       BMI    LF60E                   ;2
       STA    WSYNC                   ;3
       STX    PF2                     ;3
       STX    COLUPF                  ;3
       JSR    LFE00                   ;6
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       JSR    LFD00                   ;6
LF66B: STA    WSYNC                   ;3
       LDA    $AD                     ;3
       BPL    LF67B                   ;2
       LDA    #$98                    ;2
       STA    PF2                     ;3
       CMP    ($8A,X)                 ;6
       CMP    ($8A,X)                 ;6
       DEC    COLUPF                  ;5
LF67B: STA    WSYNC                   ;3
       LDA    #$00                    ;2
       STA    PF2                     ;3
       STA    COLUPF                  ;3
       STA    WSYNC                   ;3
       STA    WSYNC                   ;3

  IF ORIGCONT
       LDA    INPT3                   ;3
  ELSE
       LDA    INPT0                   ;3
  ENDIF

       BMI    LF68F                   ;2
       LDA    #$F0                    ;2
       STA    $BB                     ;3
LF68F: STA    WSYNC                   ;3
       LDA    $88                     ;3
       BPL    LF69B                   ;2
       LDA    $BE                     ;3
       CMP    #$FF                    ;2
       BEQ    LF69F                   ;2
LF69B: LDA    #$00                    ;2
       STA    $A8                     ;3
LF69F: LDA    $87                     ;3
       STA    COLUBK                  ;3
       LDX    #$00                    ;2
       STX    GRP0                    ;3
       STX    GRP1                    ;3
       STX    REFP0                   ;3
       STX    REFP1                   ;3
       LDA    #$3A                    ;2
       JSR    LFE00                   ;6
       LDA    #$0F                    ;2
       STA    COLUP0                  ;3
       STA    COLUP1                  ;3
       LDA    $96                     ;3
       STA    $D9                     ;3
       LDX    #$01                    ;2 possible INX instead
       STX    VDELP0                  ;3
       STX    VDELP1                  ;3
       LDA    #$42                    ;2
       JSR    LFE00                   ;6
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDA    #$03                    ;2
       STA    NUSIZ0                  ;3
       STA    NUSIZ1                  ;3

  IF ORIGFONT
       LDY    #$08                    ;2 score font = 9 points
  ELSE
       LDY    #$05                    ;2 score font = 6 points
  ENDIF

LF6D3: STY    $94                     ;3
       LDA    ($D9),Y                 ;5
       STA    $F1                     ;3
       STA    WSYNC                   ;3
       LDA    ($CF),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($D1),Y                 ;5
       STA    GRP1                    ;3
       LDA    ($D3),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($D5),Y                 ;5
       NOP                            ;2
       TAX                            ;2
       LDA    ($D7),Y                 ;5
       LDY    $F1                     ;3
       STX    GRP1                    ;3
       STA    GRP0                    ;3
       STY    GRP1                    ;3
       STA    GRP0                    ;3
       LDY    $94                     ;3
       DEY                            ;2
       BPL    LF6D3                   ;2

       LDA    #$00                    ;2 possible INY+STY's instead
       STA    VDELP0                  ;3
       STA    VDELP1                  ;3
       STA    GRP0                    ;3
       STA    GRP1                    ;3

       LDA    #TM18                   ;2
       STA    TIM64T                  ;4
       JMP    LF068                   ;3
LF70E: DEC    $AD                     ;5
       LDA    $BB                     ;3
       STA    $BC                     ;3
LF714: LDA    INTIM                   ;4
       BNE    LF714                   ;2
       STA    WSYNC                   ;3
       STA    VBLANK                  ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    WSYNC                   ;3
       STA    NUSIZ0                  ;3
       LDX    #$08                    ;2
       STX    COLUP0                  ;3
       LDA    #$02                    ;2
       STA    ENABL                   ;3
LF72D: LDA    $B0                     ;3
       CMP    $9F                     ;3
       BNE    LF768                   ;2
       LDA    $99                     ;3
       LDX    #$00                    ;2
       JSR    LFE00                   ;6
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDA    $B0                     ;3
       SEC                            ;2
       SBC    #$10                    ;2
       STA    $B0                     ;3
       LDY    #$0C                    ;2
LF747: CPY    #$04                    ;2
       BNE    LF755                   ;2
       LDA    $AC                     ;3
       AND    #$03                    ;2
       TAX                            ;2
       LDA    LFCFB,X                 ;4
       STA    COLUP0                  ;3
LF755: LDA    LFF81,Y                 ;4
       LDX    $9D                     ;3
       BMI    LF75F                   ;2
       LDA    LFF8E,Y                 ;4
LF75F: STA    WSYNC                   ;3
       STA    GRP0                    ;3
       DEY                            ;2
       BPL    LF747                   ;2
       BMI    LF72D                   ;2
LF768: LDX    $E0                     ;3
       BMI    LF773                   ;2
       CMP    $E9,X                   ;4
       BNE    LF773                   ;2
       JSR    LF51E                   ;6
LF773: STA    WSYNC                   ;3
       DEC    $B0                     ;5
       BNE    LF72D                   ;2
       LDA    $BC                     ;3
       STA    $BB                     ;3
       LDA    #$00                    ;2
       STA    $DF                     ;3
       JMP    LF69F                   ;3
LF784: CPX    #$04                    ;2
       BEQ    LF797                   ;2
       LDA    $99,X                   ;4
       STA    $98,X                   ;4
       LDA    $9F,X                   ;4
       STA    $9E,X                   ;4
       LDA    $82,X                   ;4
       STA    $81,X                   ;4
       INX                            ;2
       BPL    LF784                   ;2
LF797: LDA    $99                     ;3
       CLC                            ;2
       ADC    #$3F                    ;2
       CMP    #$9A                    ;2
       BCC    LF7A2                   ;2
       AND    #$7F                    ;2
LF7A2: CMP    #$08                    ;2
       BCS    LF7A8                   ;2
       ADC    #$08                    ;2
LF7A8: STA    $9C                     ;3
       LDA    $CE                     ;3
       AND    #$03                    ;2
       TAX                            ;2
       LDA    LFEF8,X                 ;4
       STA    $A2                     ;3
       DEC    $A4                     ;5
       LDA    #$00                    ;2
       STA    $85                     ;3
       RTS                            ;6

LF7BB: LDA    $F7                     ;3
       BMI    LF7C9                   ;2
       LDA    SWCHB                   ;4
       AND    #$01                    ;2
       BNE    LF7C9                   ;2
       JMP    START                   ;3
LF7C9: LDX    #$08                    ;2
       LDA    $BB                     ;3
       STA    $BC                     ;3
       LDY    #$00                    ;2
       CMP    #$05                    ;2
       BCS    LF7DB                   ;2
       INY                            ;2
       INY                            ;2
LF7D7: LDA    #$B5                    ;2
       BNE    LF80D                   ;2
LF7DB: CMP    #$09                    ;2
       BCC    LF809                   ;2
       CMP    #$32                    ;2
       BCS    LF7E8                   ;2
       INY                            ;2
LF7E4: LDA    #$9B                    ;2
       BNE    LF80D                   ;2
LF7E8: CMP    #$37                    ;2
       BCC    LF809                   ;2
       LDX    #$00                    ;2
       CMP    #$73                    ;2
       BCS    LF7F6                   ;2
       LDA    #$81                    ;2
       BNE    LF80D                   ;2
LF7F6: CMP    #$77                    ;2
       BCC    LF809                   ;2
       CMP    #$E0                    ;2
       BCS    LF801                   ;2
       DEY                            ;2
       BMI    LF7E4                   ;2
LF801: CMP    #$AA                    ;2
       BCC    LF809                   ;2
       DEY                            ;2
       DEY                            ;2
       BMI    LF7D7                   ;2
LF809: LDA    $DE                     ;3
       LDY    $F0                     ;3
LF80D: STA    $DC                     ;3
       STA    $DE                     ;3
       STY    $F0                     ;3
       LDA    $9D                     ;3
       BMI    LF81E                   ;2
       LDA    $DC                     ;3
       CLC                            ;2
       ADC    #$0D                    ;2
       STA    $DC                     ;3
LF81E: STX    REFP0                   ;3
       LDA    SWCHA                   ;4
       EOR    $CC                     ;3
       BEQ    LF830                   ;2
       LDA    SWCHA                   ;4
       STA    $CC                     ;3

  IF ORIGCONT
       AND    #$04                    ;2 trigger(3)
  ELSE
       AND    #$40                    ;2 trigger(0)
  ENDIF

       BEQ    LF838                   ;2
LF830: LDA    $BE                     ;3
       CMP    #$FF                    ;2
       BEQ    LF83E                   ;2
       BNE    LF85B                   ;2
LF838: LDA    $F0                     ;3
       STA    $B2                     ;3
       INC    $DF                     ;5
LF83E: LDY    $86                     ;3
       CPY    #$03                    ;2
       BCC    LF857                   ;2
       BEQ    LF84A                   ;2
       LDA    #$12                    ;2
       BPL    LF84C                   ;2
LF84A: LDA    #$09                    ;2
LF84C: JSR    LF560                   ;6
       LDA    #$0E                    ;2
       STA    $F5                     ;3
       STA    $AB                     ;3
       STA    $AF                     ;3
LF857: LDA    #$00                    ;2
       STA    $86                     ;3
LF85B: JMP    LF06B                   ;3
LF85E: LDA    $A7                     ;3
       BEQ    LF86E                   ;2
       DEC    $A7                     ;5
       LDA    $A7                     ;3
       CMP    #$80                    ;2
       BNE    LF86E                   ;2
       LDA    #$00                    ;2
       STA    $A7                     ;3
LF86E: LDY    #$00                    ;2
       LDX    #$00                    ;2
       LDA    $B1                     ;3
       BMI    LF898                   ;2
       DEC    $B1                     ;5
       AND    #$07                    ;2
       BNE    LF87E                   ;2
       INC    $AF                     ;5
LF87E: LDY    $A9                     ;3
       AND    #$01                    ;2
       BEQ    LF88E                   ;2
       LDA    #$1F                    ;2
       CPY    #$1F                    ;2
       BNE    LF88C                   ;2
       LDA    #$18                    ;2
LF88C: STA    $A9                     ;3
LF88E: LDX    $AF                     ;3
       LDA    #$FF                    ;2
       STA    $9F                     ;3
       LDA    #$04                    ;2
       BNE    LF8BA                   ;2
LF898: LDA    $B3                     ;3
       BMI    LF8AE                   ;2
       CMP    #$1E                    ;2
       BNE    LF8A6                   ;2
       STY    $A9                     ;3
       LDA    #$08                    ;2
       STA    AUDC0                   ;3
LF8A6: LDX    #$08                    ;2
       LDY    $A9                     ;3
       DEC    $A9                     ;5
       DEC    $B3                     ;5
LF8AE: LDA    $A5                     ;3
       BMI    LF8BC                   ;2
       DEC    $A5                     ;5
       LDY    #$1F                    ;2
       LDA    #$08                    ;2
       LDX    #$0F                    ;2
LF8BA: STA    AUDC0                   ;3
LF8BC: STY    AUDF0                   ;3
       STX    AUDV0                   ;3
       LDY    #$00                    ;2
       LDX    #$00                    ;2
       LDA    $89                     ;3
       BMI    LF8D4                   ;2
       LDX    $89                     ;3
       DEC    $89                     ;5
       LDY    $AA                     ;3
       INC    $AA                     ;5
       LDA    #$0A                    ;2
       STA    AUDC1                   ;3
LF8D4: LDA    $AE                     ;3
       BMI    LF8E2                   ;2
       DEC    $AE                     ;5
       LDX    #$06                    ;2
       LDA    #$07                    ;2
       STA    AUDC1                   ;3
       LDY    #$0F                    ;2
LF8E2: LDA    $F5                     ;3
       BEQ    LF90C                   ;2
       CMP    #$1E                    ;2
       BCC    LF8F4                   ;2
       BNE    LF90A                   ;2
       STA    $AB                     ;3
       LDX    #$0F                    ;2
       STX    $AF                     ;3
       BNE    LF8FE                   ;2
LF8F4: CMP    #$0F                    ;2
       BCS    LF8FE                   ;2
       DEC    $AB                     ;5
       DEC    $AB                     ;5
       DEC    $AF                     ;5
LF8FE: INC    $AB                     ;5
       INC    $AF                     ;5
       LDY    $AB                     ;3
       LDA    #$0C                    ;2
       STA    AUDC1                   ;3
       LDX    $AF                     ;3
LF90A: DEC    $F5                     ;5
LF90C: LDA    $95                     ;3
       BEQ    LF918                   ;2
       LDX    #$03                    ;2
       LDY    #$05                    ;2
       LDA    #$08                    ;2
       STA    AUDC1                   ;3
LF918: STY    AUDF1                   ;3
       STX    AUDV1                   ;3
       JMP    LF7BB                   ;3
LF91F: LDA    $AD                     ;3
       BPL    LF933                   ;2
       LDX    $A4                     ;3
       CPX    #$01                    ;2
       BNE    LF933                   ;2
       LDA    $88                     ;3
       BMI    LF930                   ;2
       JMP    LFA05                   ;3
LF930: JMP    LFA89                   ;3
LF933: LDA    $BD                     ;3
       BEQ    LF93C                   ;2
       SEC                            ;2
       SBC    $F9                     ;3
       STA    $BD                     ;3
LF93C: LDA    $9F                     ;3
       SEC                            ;2
       SBC    $F9                     ;3
       CMP    #$40                    ;2
       BCS    LF94A                   ;2
       LDX    #$01                    ;2
       JSR    LF784                   ;6
LF94A: LDX    $A4                     ;3
LF94C: DEX                            ;2
       BEQ    LF977                   ;2
       LDA    $9E,X                   ;4
       SEC                            ;2
       SBC    $F9                     ;3
       STA    $9E,X                   ;4
       LDA    $F0                     ;3
       BEQ    LF94C                   ;2
       BPL    LF96B                   ;2
       INC    $98,X                   ;6
       LDA    $98,X                   ;4
       CMP    #$A0                    ;2
       BCC    LF94C                   ;2
       LDA    #$00                    ;2
LF966: STA    $98,X                   ;4
       JMP    LF94C                   ;3
LF96B: DEC    $98,X                   ;6
       LDA    $98,X                   ;4
       CMP    #$A0                    ;2
       BCC    LF94C                   ;2
       LDA    #$A0                    ;2
       BNE    LF966                   ;2
LF977: LDA    $AD                     ;3
       BMI    LF9B2                   ;2
       LDX    $A4                     ;3
       CPX    #$05                    ;2
       BEQ    LF9B2                   ;2
       LDA    $9E,X                   ;4
       CMP    #$C5                    ;2
       BNE    LF9B0                   ;2
       LDX    $E1                     ;3
       LDA    $E9,X                   ;4
       CMP    #$A8                    ;2
       BCS    LF9B2                   ;2
       LDX    $A4                     ;3
       DEX                            ;2
       BEQ    LF99A                   ;2
       LDA    $9E,X                   ;4
       CMP    #$A8                    ;2
       BCS    LF9B2                   ;2
LF99A: LDX    $A4                     ;3
       LDA    #$00                    ;2
       STA    $81,X                   ;4
       INC    $A4                     ;5
       LDA    $AD                     ;3
       CMP    #$04                    ;2
       BNE    LF9B0                   ;2
       LDA    $BD                     ;3
       BNE    LF9B0                   ;2
       LDA    #$C4                    ;2
       STA    $BD                     ;3
LF9B0: DEC    $9E,X                   ;6
LF9B2: LDA    $AD                     ;3
       BMI    LFA05                   ;2
       LDY    $88                     ;3
       CPY    #$03                    ;2
       BEQ    LFA05                   ;2
       LDY    $A4                     ;3
LF9BE: DEY                            ;2
       BEQ    LFA05                   ;2
       LDA.wy $81,Y                   ;4
       BNE    LF9BE                   ;2
       LDA.wy $9E,Y                   ;4
       LDX    $F9                     ;3
LF9CB: DEX                            ;2
       BMI    LF9BE                   ;2
       CMP    LFFCF,X                 ;4
       BNE    LF9CB                   ;2
       LDX    $88                     ;3
       SEC                            ;2
       SBC    #$0A                    ;2
       STA    $92                     ;3
       LDA.wy $98,Y                   ;4
       STA    $8F,X                   ;4
       LDY    $88                     ;3
LF9E1: BMI    LF9F7                   ;2
       LDA.wy $8A,Y                   ;4
       CLC                            ;2
       ADC    #$0C                    ;2
       CMP    $92                     ;3
       BCC    LF9F4                   ;2
       SEC                            ;2
       SBC    #$19                    ;2
       CMP    $92                     ;3
       BCC    LFA05                   ;2
LF9F4: DEY                            ;2
       BPL    LF9E1                   ;2
LF9F7: LDA    $92                     ;3
       STA    $8B,X                   ;4
       LDA    #$0C                    ;2
       STA    $89                     ;3
       LDA    #$00                    ;2
       STA    $AA                     ;3
       INC    $88                     ;5
LFA05: LDX    $88                     ;3
       BPL    LFA0B                   ;2
       BMI    LFA89                   ;2
LFA0B: LDA    $8A,X                   ;4
       CMP    #$C4                    ;2
       BCS    LFA1F                   ;2
       SEC                            ;2
       SBC    $F9                     ;3
       SBC    #$01                    ;2
       STA    $8A,X                   ;4
       CMP    #$0D                    ;2
       BCS    LFA1F                   ;2
       JSR    LFEDE                   ;6
LFA1F: DEX                            ;2
       BPL    LFA0B                   ;2
       LDA    $AE                     ;3
       BPL    LFA89                   ;2
       LDY    #$00                    ;2
       LDX    #$04                    ;2
LFA2A: DEX                            ;2
       BMI    LFA89                   ;2
       LDA    $8A,X                   ;4
       CMP    #$28                    ;2
       BCS    LFA2A                   ;2
       CMP    #$1F                    ;2
       BCC    LFA4B                   ;2
       LDA    $8E,X                   ;4
       CMP    #$41                    ;2
       BCC    LFA89                   ;2
       CMP    #$4C                    ;2
       BCC    LFA6D                   ;2
       CMP    #$51                    ;2
       BCC    LFA89                   ;2
       CMP    #$5C                    ;2
       BCC    LFA6C                   ;2
       BCS    LFA89                   ;2
LFA4B: CMP    #$16                    ;2
       BCS    LFA2A                   ;2
       LDA    $8E,X                   ;4
       CMP    #$39                    ;2
       BCC    LFA89                   ;2
       CMP    #$44                    ;2
       BCC    LFA6B                   ;2
       CMP    #$49                    ;2
       BCC    LFA89                   ;2
       CMP    #$55                    ;2
       BCC    LFA6A                   ;2
       CMP    #$59                    ;2
       BCC    LFA89                   ;2
       CMP    #$65                    ;2
       BCS    LFA89                   ;2
       INY                            ;2
LFA6A: INY                            ;2
LFA6B: INY                            ;2
LFA6C: INY                            ;2
LFA6D: LDA.wy $C0,Y                   ;4
       BEQ    LFA89                   ;2
       LDA    LFDFB,Y                 ;4
       STA    $A6                     ;3
       LDA    #$00                    ;2
       STA.wy $C0,Y                   ;5
       STY    $F7                     ;3
       JSR    LFEDE                   ;6
       LDA    #$0C                    ;2
       STA    $AE                     ;3
       LDA    #$0F                    ;2
       STA    $A7                     ;3
LFA89: LDX    #$FF                    ;2
       LDY    #$FF                    ;2
       LDA    $C1                     ;3
       BEQ    LFA94                   ;2
       LDX    #$56                    ;2
       INY                            ;2
LFA94: LDA    $C0                     ;3
       BEQ    LFA9B                   ;2
       LDX    #$46                    ;2
       INY                            ;2
LFA9B: STX    $B9                     ;3
       STY    $B7                     ;3
       LDY    #$FF                    ;2
       LDX    #$FF                    ;2
       LDA    $C4                     ;3
       BEQ    LFAAA                   ;2
       INY                            ;2
       LDX    #$5E                    ;2
LFAAA: LDA    $C3                     ;3
       BEQ    LFAB1                   ;2
       INY                            ;2
       LDX    #$4E                    ;2
LFAB1: LDA    $C2                     ;3
       BEQ    LFAB8                   ;2
       INY                            ;2
       LDX    #$3E                    ;2
LFAB8: STX    $BA                     ;3
       CPY    #$02                    ;2
       BEQ    LFAC6                   ;2
       CPY    #$01                    ;2
       BNE    LFAC7                   ;2
       LDA    $C3                     ;3
       BNE    LFAC7                   ;2
LFAC6: INY                            ;2
LFAC7: STY    $B8                     ;3
       JMP    LF072                   ;3
LFACC: LDA    $E1                     ;3
       CMP    #$06                    ;2
       BEQ    LFB08                   ;2
       LDX    $A4                     ;3
       CPX    #$05                    ;2
       BNE    LFADB                   ;2
       DEX                            ;2
       BPL    LFAF4                   ;2
LFADB: LDA    $9E,X                   ;4
       CMP    #$C5                    ;2
       BEQ    LFB08                   ;2
       CPX    #$01                    ;2
       BNE    LFAF1                   ;2
       LDY    $AD                     ;3
       BPL    LFAFA                   ;2
       LDA    $9F                     ;3
       CMP    #$C5                    ;2
       BCS    LFAFA                   ;2
       BCC    LFAF4                   ;2
LFAF1: DEX                            ;2
       BEQ    LFAFA                   ;2
LFAF4: LDA    $9E,X                   ;4
       CMP    #$BC                    ;2
       BCS    LFB08                   ;2
LFAFA: LDX    $E1                     ;3
       LDA    $E9,X                   ;4
       CMP    #$B1                    ;2
       BCS    LFB08                   ;2
       INC    $E1                     ;5
       LDA    #$C4                    ;2
       STA    $EA,X                   ;4
LFB08: LDA    $E9                     ;3
       SEC                            ;2
       SBC    $F9                     ;3
       CMP    #$30                    ;2
       BCS    LFB2C                   ;2
       LDX    #$00                    ;2
       LDY    $E2                     ;3
LFB15: LDA    $EA,X                   ;4
       SEC                            ;2
       SBC    $F9                     ;3
       STA    $E9,X                   ;4
       LDA    $E3,X                   ;4
       STA    $E2,X                   ;4
       INX                            ;2
       CPX    $E1                     ;3
       BNE    LFB15                   ;2
       DEC    $E1                     ;5
       STY    $E2,X                   ;4
       JMP    LFB38                   ;3
LFB2C: LDX    $E1                     ;3
LFB2E: LDA    $E9,X                   ;4
       SEC                            ;2
       SBC    $F9                     ;3
       STA    $E9,X                   ;4
       DEX                            ;2
       BPL    LFB2E                   ;2
LFB38: LDX    #$06                    ;2
LFB3A: LDA    $F0                     ;3
       BEQ    LFB59                   ;2
       BMI    LFB4A                   ;2
       DEC    $E2,X                   ;6
       BNE    LFB56                   ;2
       LDA    #$A0                    ;2
       STA    $E2,X                   ;4
       BNE    LFB56                   ;2
LFB4A: INC    $E2,X                   ;6
       LDA    $E2,X                   ;4
       CMP    #$A1                    ;2
       BNE    LFB56                   ;2
       LDA    #$01                    ;2
       STA    $E2,X                   ;4
LFB56: DEX                            ;2
       BPL    LFB3A                   ;2
LFB59: JMP    LF91F                   ;3
LFB5C: LDX    #$06                    ;2
       LDY    $B2                     ;3
       BEQ    LFB88                   ;2
       BMI    LFB76                   ;2
LFB64: LDA    $C5,X                   ;4
       CPY    #$01                    ;2
       CLC                            ;2
       BEQ    LFB6D                   ;2
       ADC    #$01                    ;2
LFB6D: ADC    #$02                    ;2
       STA    $C5,X                   ;4
       DEX                            ;2
       BPL    LFB64                   ;2
       BMI    LFB9E                   ;2
LFB76: LDA    $C5,X                   ;4
       SEC                            ;2
       CPY    #$FE                    ;2
       BNE    LFB7F                   ;2
       SBC    #$01                    ;2
LFB7F: SBC    #$02                    ;2
       STA    $C5,X                   ;4
       DEX                            ;2
       BPL    LFB76                   ;2
       BMI    LFB9E                   ;2
LFB88: LDA    $F0                     ;3
       BEQ    LFBB3                   ;2
       BMI    LFB97                   ;2
       LDX    #$06                    ;2
LFB90: DEC    $C5,X                   ;6
       DEX                            ;2
       BPL    LFB90                   ;2
       BMI    LFB9E                   ;2
LFB97: LDX    #$06                    ;2
LFB99: INC    $C5,X                   ;6
       DEX                            ;2
       BPL    LFB99                   ;2
LFB9E: LDA    $B8                     ;3
       BPL    LFBA9                   ;2
       LDA    $C5                     ;3
       CMP    #$98                    ;2
       JMP    LFBAD                   ;3
LFBA9: LDA    $C6                     ;3
       CMP    #$8C                    ;2
LFBAD: BCC    LFBB3                   ;2
       LDA    #$FF                    ;2
       STA    $BE                     ;3
LFBB3: RTS                            ;6

LFBB4: LDA    #$09                    ;2
       STA    $AD                     ;3
       LDA    $F7                     ;3
       BMI    LFBC8                   ;2
       LDA    $CE                     ;3
       AND    #$03                    ;2
       BNE    LFBC8                   ;2
       INC    $AC                     ;5
       LDA    #$7F                    ;2
       STA    $B1                     ;3
LFBC8: LDX    #$FF                    ;2
       STX    $9F                     ;3
       INX                            ;2
       STX    $95                     ;3
       RTS                            ;6

LFBD0: JSR    LFBB4                   ;6
       LDA    $A7                     ;3
       STA    $95                     ;3
       BEQ    LFBE5                   ;2
       BMI    LFBDF                   ;2
       LDA    #$01                    ;2
       STA    $A7                     ;3
LFBDF: DEC    $A7                     ;5
       DEC    $A7                     ;5
       BNE    LFBF0                   ;2
LFBE5: LDA    $DF                     ;3
       BEQ    LFBF0                   ;2
       DEC    $DF                     ;5
       INC    $F7                     ;5
       JMP    LF013                   ;3
LFBF0: LDA    #$00                    ;2
       STA    $DF                     ;3
       STA    REFP0                   ;3
       JMP    LF5B5                   ;3
LFBF9: LDA    #$4A                    ;2
       LDX    #$01                    ;2
       JSR    LFE00                   ;6
       LDA    #$52                    ;2
       LDX    #$00                    ;2 possible DEX instead
       JSR    LFE00                   ;6
       STX    NUSIZ0                  ;3
       STX    NUSIZ1                  ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDA    #TM27                   ;2
       STA    TIM64T                  ;4
       LDY    #$09                    ;2
       STY    $98                     ;3
       STY    $F1                     ;3
       LDX    $CE                     ;3
LFC1C: DEX                            ;2
       BMI    LFC35                   ;2
       TYA                            ;2
       CLC                            ;2
       ADC    $98                     ;3
       CMP    #$63                    ;2
       BNE    LFC28                   ;2
       TYA                            ;2
LFC28: STA    $98                     ;3
       CMP    #$09                    ;2
       BNE    LFC1C                   ;2
       CLC                            ;2
       ADC    $F1                     ;3
       STA    $F1                     ;3
       BNE    LFC1C                   ;2
LFC35: LDA    INTIM                   ;4
       BNE    LFC35                   ;2
LFC3A: DEC    $F1                     ;5
       DEC    $98                     ;5
       LDX    $F1                     ;3
       LDA    LFF00,X                 ;4
       LDX    $98                     ;3
       STA    WSYNC                   ;3
       STA    GRP1                    ;3
       LDA    LFF00,X                 ;4
       STA    GRP0                    ;3
       DEY                            ;2
       BPL    LFC3A                   ;2
       LDX    #$00                    ;2
       STX    GRP0                    ;3
       STX    GRP1                    ;3
       LDA    #$42                    ;2
       JSR    LFE00                   ;6
       LDA    #$4A                    ;2
       LDX    #$01                    ;2 possible INX instead
       JSR    LFE00                   ;6
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STX    NUSIZ0                  ;3
       STX    NUSIZ1                  ;3
       LDA    $93                     ;3
       AND    #$F0                    ;2
       STA    $92                     ;3
       LDX    #$2D                    ;2
       JSR    LFCF4                   ;6
       LDX    #$0F                    ;2
       LDY    $DB                     ;3
LFC7A: LDA    $92                     ;3
       STA    COLUP0                  ;3
       STA    COLUP1                  ;3
       STA    WSYNC                   ;3
       LDA    #$01                    ;2
       STA    VDELP0                  ;3
       STA    VDELP1                  ;3
       LDA    LFDAB,Y                 ;4
       STA    GRP0                    ;3
       LDA    LFDBE,Y                 ;4
       NOP                            ;2
       NOP                            ;2
       STA    GRP1                    ;3
       LDA    LFDD1,Y                 ;4
       INC.w  $92                     ;6
       STA    GRP0                    ;3
       LDA    LFDE4,Y                 ;4
       NOP                            ;2
       STA    GRP1                    ;3
       STA    GRP0                    ;3
       DEY                            ;2
       BPL    LFCA9                   ;2
       LDY    #$13                    ;2
LFCA9: DEX                            ;2
       BPL    LFC7A                   ;2
       LDA    #$00                    ;2
       STA    VDELP0                  ;3
       STA    VDELP1                  ;3
       STA    GRP0                    ;3
       STA    GRP1                    ;3
       DEC    $9D                     ;5
       BMI    LFCBC                   ;2
       BNE    LFCD5                   ;2
LFCBC: LDA    #$08                    ;2
       STA    $9D                     ;3
       DEC    $DB                     ;5
       BPL    LFCD5                   ;2
       LDA    #$13                    ;2
       STA    $DB                     ;3
       LDA    $93                     ;3
       CLC                            ;2
       ADC    #$10                    ;2
       STA    $93                     ;3
       STA    $87                     ;3
       ADC    #$80                    ;2
       STA    $80                     ;3

;LFCD5: LDY    #$23                    ;2 35 blank scanlines (title screen)
LFCD5: LDY    #$26                    ;2 38 blank scanlines (title screen)

LFCD7: STA    WSYNC                   ;3 possible to use X instead...
       DEY                            ;2
       BNE    LFCD7                   ;2
       LDA    $B9                     ;3
       LDX    #$00                    ;2 <-
       JSR    LFE00                   ;6
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDA    $B7                     ;3
       STA    NUSIZ0                  ;3
       LDA    #$00                    ;2 ...to use TXA here (saving 3 bytes)

       STA    WSYNC                   ;3
       STA    HMP0                    ;3
       JMP    LF61F                   ;3
LFCF4: DEX                            ;2
LFCF5: STA    WSYNC                   ;3
       DEX                            ;2
       BPL    LFCF5                   ;2
       RTS                            ;6








       ORG $FCFB

LFCFB: .byte $40 ; | X      | $FCFB
       .byte $42 ; | X    X | $FCFC
       .byte $0F ; |    XXXX| $FCFD
       .byte $0F ; |    XXXX| $FCFE
       .byte $01 ; |       X| $FCFF

LFD00: STA    WSYNC                   ;3
       LDY    #$07                    ;2
       LDA    SWCHB                   ;4
       AND    #$08                    ;2
       BNE    LFD0D                   ;2
       LDY    #$0E                    ;2
LFD0D: LDX    $BE                     ;3
       BPL    LFD15                   ;2
       LDX    $88                     ;3
       BMI    LFD16                   ;2
LFD15: INY                            ;2
LFD16: STY    COLUP0                  ;3
       LDY    #$0D                    ;2
LFD1A: DEY                            ;2
       BMI    LFD37                   ;2
       LDA    ($DC),Y                 ;5
       STA    WSYNC                   ;3
       STA    GRP0                    ;3
       LDA    ($D9),Y                 ;5
       STA    GRP1                    ;3
       CPY    #$04                    ;2
       BNE    LFD1A                   ;2
       LDA    $AC                     ;3
       AND    #$03                    ;2
       TAX                            ;2
       LDA    LFCFB,X                 ;4
       STA    COLUP0                  ;3
       BNE    LFD1A                   ;2
LFD37: RTS                            ;6

LFD38: LDA    #$00                    ;2
       STA    NUSIZ1                  ;3
       LDX    $A3                     ;3
       LDA    $97                     ;3
       LDY    $9E,X                   ;4
       CPY    $BD                     ;3
       BNE    LFD48                   ;2
       ADC    $BD                     ;3
LFD48: STA    COLUP1                  ;3
       LDA    $98,X                   ;4
       LDX    #$01                    ;2
       JSR    LFE00                   ;6

  IF ORIGCONT
       LDA    INPT3                   ;3
  ELSE
       LDA    INPT0                   ;3
  ENDIF

       BMI    LFD5B                   ;2
       INC    $BB                     ;5
       INC    $BB                     ;5
       INC    $BB                     ;5
LFD5B: STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDX    $A3                     ;3
       DEC    $A3                     ;5
       LDA    $81,X                   ;4
       BNE    LFD7C                   ;2
       LDY    #$0D                    ;2
LFD69: DEY                            ;2
       BMI    LFDAA                   ;2
       LDA    LFEBE,Y                 ;4
       STA    WSYNC                   ;3
       STA    GRP1                    ;3

  IF ORIGCONT
       LDA    INPT3                   ;3
  ELSE
       LDA    INPT0                   ;3
  ENDIF

       BMI    LFD79                   ;2
       INC    $BB                     ;5
LFD79: JMP    LFD69                   ;3
LFD7C: DEC    $81,X                   ;6
       LDY    #$4F                    ;2
       CMP    #$0A                    ;2
       BCS    LFD8A                   ;2
       LDY    #$05                    ;2
       STY    NUSIZ1                  ;3
       LDY    #$45                    ;2
LFD8A: STY    COLUP1                  ;3
       LDY    #$0C                    ;2
LFD8E: LDA    LFF67,Y                 ;4
LFD91: STA    WSYNC                   ;3
       STA    GRP1                    ;3

  IF ORIGCONT
       LDA    INPT3                   ;3
  ELSE
       LDA    INPT0                   ;3
  ENDIF

       BMI    LFD9B                   ;2
       INC    $BB                     ;5
LFD9B: DEY                            ;2
       BMI    LFDAA                   ;2
       LDA    $81,X                   ;4
       CMP    #$07                    ;2
       BCS    LFD8E                   ;2
       LDA    LFF74,Y                 ;4
       JMP    LFD91                   ;3
LFDAA: RTS                            ;6



LFDAB: .byte $00 ; |        | $FDAB
       .byte $FC ; |XXXXXX  | $FDAC
       .byte $02 ; |      X | $FDAD
       .byte $02 ; |      X | $FDAE
       .byte $7C ; | XXXXX  | $FDAF
       .byte $80 ; |X       | $FDB0
       .byte $80 ; |X       | $FDB1
       .byte $7E ; | XXXXXX | $FDB2
       .byte $00 ; |        | $FDB3
       .byte $00 ; |        | $FDB4
       .byte $00 ; |        | $FDB5
       .byte $7C ; | XXXXX  | $FDB6
       .byte $82 ; |X     X | $FDB7
       .byte $BA ; |X XXX X | $FDB8
       .byte $A2 ; |X X   X | $FDB9
       .byte $BA ; |X XXX X | $FDBA
       .byte $82 ; |X     X | $FDBB
       .byte $7C ; | XXXXX  | $FDBC
       .byte $00 ; |        | $FDBD
LFDBE: .byte $00 ; |        | $FDBE
       .byte $FE ; |XXXXXXX | $FDBF
       .byte $80 ; |X       | $FDC0
       .byte $80 ; |X       | $FDC1
       .byte $F8 ; |XXXXX   | $FDC2
       .byte $80 ; |X       | $FDC3
       .byte $80 ; |X       | $FDC4
       .byte $FE ; |XXXXXXX | $FDC5
       .byte $00 ; |        | $FDC6
       .byte $00 ; |        | $FDC7
       .byte $00 ; |        | $FDC8
       .byte $70 ; | XXX    | $FDC9
       .byte $20 ; |  X     | $FDCA
       .byte $20 ; |  X     | $FDCB
       .byte $23 ; |  X   XX| $FDCC
       .byte $24 ; |  X  X  | $FDCD
       .byte $64 ; | XX  X  | $FDCE
       .byte $23 ; |  X   XX| $FDCF
       .byte $00 ; |        | $FDD0
LFDD1: .byte $00 ; |        | $FDD1
       .byte $7E ; | XXXXXX | $FDD2
       .byte $82 ; |X     X | $FDD3
       .byte $82 ; |X     X | $FDD4
       .byte $9E ; |X  XXXX | $FDD5
       .byte $80 ; |X       | $FDD6
       .byte $82 ; |X     X | $FDD7
       .byte $7C ; | XXXXX  | $FDD8
       .byte $00 ; |        | $FDD9
       .byte $00 ; |        | $FDDA
       .byte $00 ; |        | $FDDB
       .byte $4E ; | X  XXX | $FDDC
       .byte $51 ; | X X   X| $FDDD
       .byte $51 ; | X X   X| $FDDE
       .byte $CE ; |XX  XXX | $FDDF
       .byte $51 ; | X X   X| $FDE0
       .byte $51 ; | X X   X| $FDE1
       .byte $8E ; |X   XXX | $FDE2
       .byte $00 ; |        | $FDE3
LFDE4: .byte $00 ; |        | $FDE4
       .byte $82 ; |X     X | $FDE5
       .byte $82 ; |X     X | $FDE6
       .byte $FE ; |XXXXXXX | $FDE7
       .byte $82 ; |X     X | $FDE8
       .byte $82 ; |X     X | $FDE9
       .byte $44 ; | X   X  | $FDEA
       .byte $38 ; |  XXX   | $FDEB
       .byte $00 ; |        | $FDEC
       .byte $00 ; |        | $FDED
       .byte $00 ; |        | $FDEE
       .byte $7C ; | XXXXX  | $FDEF
       .byte $20 ; |  X     | $FDF0
       .byte $10 ; |   X    | $FDF1
       .byte $08 ; |    X   | $FDF2
       .byte $04 ; |     X  | $FDF3
       .byte $44 ; | X   X  | $FDF4
       .byte $38 ; |  XXX   | $FDF5
       .byte $00 ; |        | $FDF6
       .byte $00 ; |        | $FDF7
LFDF8: .byte $09 ; |    X  X| $FDF8
       .byte $12 ; |   X  X | $FDF9
       .byte $2D ; |  X XX X| $FDFA
LFDFB: .byte $46 ; | X   XX | $FDFB
       .byte $56 ; | X X XX | $FDFC
       .byte $3E ; |  XXXXX | $FDFD
       .byte $4E ; | X  XXX | $FDFE
       .byte $5E ; | X XXXX | $FDFF

LFE00: TAY                            ;2
       LDA    LFE1D,Y                 ;4
       PHA                            ;3
       AND    #$0F                    ;2
       TAY                            ;2
       PLA                            ;4
       STA    WSYNC                   ;3
LFE0B: DEY                            ;2
       BPL    LFE0B                   ;2
       STA    RESP0,X                 ;4
       STA    WSYNC                   ;3
       STA    HMP0,X                  ;4
       RTS                            ;6

LFE15: .byte $90 ; |X  X    | $FE15
       .byte $00 ; |        | $FE16
       .byte $50 ; | X X    | $FE17
       .byte $10 ; |   X    | $FE18
LFE19: .byte $40 ; | X      | $FE19
       .byte $20 ; |  X     | $FE1A
       .byte $90 ; |X  X    | $FE1B
       .byte $73 ; | XXX  XX| $FE1C
LFE1D: .byte $73 ; | XXX  XX| $FE1D
       .byte $63 ; | XX   XX| $FE1E
       .byte $53 ; | X X  XX| $FE1F
       .byte $43 ; | X    XX| $FE20
       .byte $33 ; |  XX  XX| $FE21
       .byte $23 ; |  X   XX| $FE22
       .byte $13 ; |   X  XX| $FE23
       .byte $03 ; |      XX| $FE24
       .byte $F3 ; |XXXX  XX| $FE25
       .byte $E3 ; |XXX   XX| $FE26
       .byte $D3 ; |XX X  XX| $FE27
       .byte $C3 ; |XX    XX| $FE28
       .byte $B3 ; |X XX  XX| $FE29
       .byte $A3 ; |X X   XX| $FE2A
       .byte $93 ; |X  X  XX| $FE2B
       .byte $74 ; | XXX X  | $FE2C
       .byte $64 ; | XX  X  | $FE2D
       .byte $54 ; | X X X  | $FE2E
       .byte $44 ; | X   X  | $FE2F
       .byte $34 ; |  XX X  | $FE30
       .byte $24 ; |  X  X  | $FE31
       .byte $14 ; |   X X  | $FE32
       .byte $04 ; |     X  | $FE33
       .byte $F4 ; |XXXX X  | $FE34
       .byte $E4 ; |XXX  X  | $FE35
       .byte $D4 ; |XX X X  | $FE36
       .byte $C4 ; |XX   X  | $FE37
       .byte $B4 ; |X XX X  | $FE38
       .byte $A4 ; |X X  X  | $FE39
       .byte $94 ; |X  X X  | $FE3A
       .byte $75 ; | XXX X X| $FE3B
       .byte $65 ; | XX  X X| $FE3C
       .byte $55 ; | X X X X| $FE3D
       .byte $45 ; | X   X X| $FE3E
       .byte $35 ; |  XX X X| $FE3F
       .byte $25 ; |  X  X X| $FE40
       .byte $15 ; |   X X X| $FE41
       .byte $05 ; |     X X| $FE42
       .byte $F5 ; |XXXX X X| $FE43
       .byte $E5 ; |XXX  X X| $FE44
       .byte $D5 ; |XX X X X| $FE45
       .byte $C5 ; |XX   X X| $FE46
       .byte $B5 ; |X XX X X| $FE47
       .byte $A5 ; |X X  X X| $FE48
       .byte $95 ; |X  X X X| $FE49
       .byte $76 ; | XXX XX | $FE4A
       .byte $66 ; | XX  XX | $FE4B
       .byte $56 ; | X X XX | $FE4C
       .byte $46 ; | X   XX | $FE4D
       .byte $36 ; |  XX XX | $FE4E
       .byte $26 ; |  X  XX | $FE4F
       .byte $16 ; |   X XX | $FE50
       .byte $06 ; |     XX | $FE51
       .byte $F6 ; |XXXX XX | $FE52
       .byte $E6 ; |XXX  XX | $FE53
       .byte $D6 ; |XX X XX | $FE54
       .byte $C6 ; |XX   XX | $FE55
       .byte $B6 ; |X XX XX | $FE56
       .byte $A6 ; |X X  XX | $FE57
       .byte $96 ; |X  X XX | $FE58
       .byte $77 ; | XXX XXX| $FE59
       .byte $67 ; | XX  XXX| $FE5A
       .byte $57 ; | X X XXX| $FE5B
       .byte $47 ; | X   XXX| $FE5C
       .byte $37 ; |  XX XXX| $FE5D
       .byte $27 ; |  X  XXX| $FE5E
       .byte $17 ; |   X XXX| $FE5F
       .byte $07 ; |     XXX| $FE60
       .byte $F7 ; |XXXX XXX| $FE61
       .byte $E7 ; |XXX  XXX| $FE62
       .byte $D7 ; |XX X XXX| $FE63
       .byte $C7 ; |XX   XXX| $FE64
       .byte $B7 ; |X XX XXX| $FE65
       .byte $A7 ; |X X  XXX| $FE66
       .byte $97 ; |X  X XXX| $FE67
       .byte $78 ; | XXXX   | $FE68
       .byte $68 ; | XX X   | $FE69
       .byte $58 ; | X XX   | $FE6A
       .byte $48 ; | X  X   | $FE6B
       .byte $38 ; |  XXX   | $FE6C
       .byte $28 ; |  X X   | $FE6D
       .byte $18 ; |   XX   | $FE6E
       .byte $08 ; |    X   | $FE6F
       .byte $F8 ; |XXXXX   | $FE70
       .byte $E8 ; |XXX X   | $FE71
       .byte $D8 ; |XX XX   | $FE72
       .byte $C8 ; |XX  X   | $FE73
       .byte $B8 ; |X XXX   | $FE74
       .byte $A8 ; |X X X   | $FE75
       .byte $98 ; |X  XX   | $FE76
       .byte $79 ; | XXXX  X| $FE77
       .byte $69 ; | XX X  X| $FE78
       .byte $59 ; | X XX  X| $FE79
       .byte $49 ; | X  X  X| $FE7A
       .byte $39 ; |  XXX  X| $FE7B
       .byte $29 ; |  X X  X| $FE7C
       .byte $19 ; |   XX  X| $FE7D
       .byte $09 ; |    X  X| $FE7E
       .byte $F9 ; |XXXXX  X| $FE7F
       .byte $E9 ; |XXX X  X| $FE80
       .byte $D9 ; |XX XX  X| $FE81
       .byte $C9 ; |XX  X  X| $FE82
       .byte $B9 ; |X XXX  X| $FE83
       .byte $A9 ; |X X X  X| $FE84
       .byte $99 ; |X  XX  X| $FE85
       .byte $7A ; | XXXX X | $FE86
       .byte $6A ; | XX X X | $FE87
       .byte $5A ; | X XX X | $FE88
       .byte $4A ; | X  X X | $FE89
       .byte $3A ; |  XXX X | $FE8A
       .byte $2A ; |  X X X | $FE8B
       .byte $1A ; |   XX X | $FE8C
       .byte $0A ; |    X X | $FE8D
       .byte $FA ; |XXXXX X | $FE8E
       .byte $EA ; |XXX X X | $FE8F
       .byte $DA ; |XX XX X | $FE90
       .byte $CA ; |XX  X X | $FE91
       .byte $BA ; |X XXX X | $FE92
       .byte $AA ; |X X X X | $FE93
       .byte $9A ; |X  XX X | $FE94
       .byte $7B ; | XXXX XX| $FE95
       .byte $6B ; | XX X XX| $FE96
       .byte $5B ; | X XX XX| $FE97
       .byte $4B ; | X  X XX| $FE98
       .byte $3B ; |  XXX XX| $FE99
       .byte $2B ; |  X X XX| $FE9A
       .byte $1B ; |   XX XX| $FE9B
       .byte $0B ; |    X XX| $FE9C
       .byte $FB ; |XXXXX XX| $FE9D
       .byte $EB ; |XXX X XX| $FE9E
       .byte $DB ; |XX XX XX| $FE9F
       .byte $CB ; |XX  X XX| $FEA0
       .byte $BB ; |X XXX XX| $FEA1
       .byte $AB ; |X X X XX| $FEA2
       .byte $9B ; |X  XX XX| $FEA3
       .byte $7C ; | XXXXX  | $FEA4
       .byte $6C ; | XX XX  | $FEA5
       .byte $5C ; | X XXX  | $FEA6
       .byte $4C ; | X  XX  | $FEA7
       .byte $3C ; |  XXXX  | $FEA8
       .byte $2C ; |  X XX  | $FEA9
       .byte $1C ; |   XXX  | $FEAA
       .byte $0C ; |    XX  | $FEAB
       .byte $FC ; |XXXXXX  | $FEAC
       .byte $EC ; |XXX XX  | $FEAD
       .byte $DC ; |XX XXX  | $FEAE
       .byte $CC ; |XX  XX  | $FEAF
       .byte $BC ; |X XXXX  | $FEB0
       .byte $AC ; |X X XX  | $FEB1
       .byte $9C ; |X  XXX  | $FEB2
       .byte $7D ; | XXXXX X| $FEB3
       .byte $6D ; | XX XX X| $FEB4
       .byte $5D ; | X XXX X| $FEB5
       .byte $4D ; | X  XX X| $FEB6
       .byte $3D ; |  XXXX X| $FEB7
       .byte $2D ; |  X XX X| $FEB8
       .byte $1D ; |   XXX X| $FEB9
       .byte $0D ; |    XX X| $FEBA
       .byte $FD ; |XXXXXX X| $FEBB
       .byte $ED ; |XXX XX X| $FEBC
       .byte $DD ; |XX XXX X| $FEBD
LFEBE: .byte $00 ; |        | $FEBE
       .byte $18 ; |   XX   | $FEBF
       .byte $18 ; |   XX   | $FEC0
       .byte $24 ; |  X  X  | $FEC1
       .byte $7E ; | XXXXXX | $FEC2
       .byte $FF ; |XXXXXXXX| $FEC3
       .byte $FF ; |XXXXXXXX| $FEC4
       .byte $FF ; |XXXXXXXX| $FEC5
       .byte $E7 ; |XXX  XXX| $FEC6
       .byte $C3 ; |XX    XX| $FEC7
       .byte $81 ; |X      X| $FEC8
       .byte $81 ; |X      X| $FEC9
       .byte $81 ; |X      X| $FECA
LFECB: .byte $00 ; |        | $FECB
       .byte $42 ; | X    X | $FECC
       .byte $42 ; | X    X | $FECD
       .byte $42 ; | X    X | $FECE
       .byte $42 ; | X    X | $FECF
       .byte $42 ; | X    X | $FED0
       .byte $42 ; | X    X | $FED1

LFED2: LDY    #$0D                    ;2
LFED4: LDA    ($D9),Y                 ;5
       STA    WSYNC                   ;3
       STA    GRP1                    ;3
       DEY                            ;2
       BPL    LFED4                   ;2
       RTS                            ;6

LFEDE: STX    $F1                     ;3
       DEC    $88                     ;5
LFEE2: CPX    #$03                    ;2
       BEQ    LFEF1                   ;2
       LDA    $8F,X                   ;4
       STA    $8E,X                   ;4
       LDA    $8B,X                   ;4
       STA    $8A,X                   ;4
       INX                            ;2
       BPL    LFEE2                   ;2
LFEF1: LDA    #$FF                    ;2
       STA    $8D                     ;3
       LDX    $F1                     ;3
       RTS                            ;6

LFEF8: .byte $F0 ; |XXXX    | $FEF8
       .byte $E0 ; |XXX     | $FEF9
       .byte $D0 ; |XX X    | $FEFA
       .byte $D0 ; |XX X    | $FEFB
LFEFC: .byte $25 ; |  X  X X| $FEFC
       .byte $0F ; |    XXXX| $FEFD
       .byte $D4 ; |XX X X  | $FEFE
       .byte $54 ; | X X X  | $FEFF



  IF ORIGFONT

LFF00: .byte $7E ; | XXXXXX | $FF00
       .byte $42 ; | X    X | $FF01
       .byte $42 ; | X    X | $FF02
       .byte $42 ; | X    X | $FF03
       .byte $42 ; | X    X | $FF04
       .byte $42 ; | X    X | $FF05
       .byte $42 ; | X    X | $FF06
       .byte $42 ; | X    X | $FF07
       .byte $7E ; | XXXXXX | $FF08

       .byte $10 ; |   X    | $FF09
       .byte $10 ; |   X    | $FF0A
       .byte $10 ; |   X    | $FF0B
       .byte $10 ; |   X    | $FF0C
       .byte $10 ; |   X    | $FF0D
       .byte $10 ; |   X    | $FF0E
       .byte $10 ; |   X    | $FF0F
       .byte $10 ; |   X    | $FF10
       .byte $10 ; |   X    | $FF11

       .byte $7E ; | XXXXXX | $FF12
       .byte $40 ; | X      | $FF13
       .byte $40 ; | X      | $FF14
       .byte $40 ; | X      | $FF15
       .byte $7E ; | XXXXXX | $FF16
       .byte $02 ; |      X | $FF17
       .byte $02 ; |      X | $FF18
       .byte $02 ; |      X | $FF19
       .byte $7E ; | XXXXXX | $FF1A

       .byte $7E ; | XXXXXX | $FF1B
       .byte $02 ; |      X | $FF1C
       .byte $02 ; |      X | $FF1D
       .byte $02 ; |      X | $FF1E
       .byte $7E ; | XXXXXX | $FF1F
       .byte $02 ; |      X | $FF20
       .byte $02 ; |      X | $FF21
       .byte $02 ; |      X | $FF22
       .byte $7E ; | XXXXXX | $FF23

       .byte $02 ; |      X | $FF24
       .byte $02 ; |      X | $FF25
       .byte $02 ; |      X | $FF26
       .byte $02 ; |      X | $FF27
       .byte $7E ; | XXXXXX | $FF28
       .byte $42 ; | X    X | $FF29
       .byte $42 ; | X    X | $FF2A
       .byte $42 ; | X    X | $FF2B
       .byte $42 ; | X    X | $FF2C

       .byte $7E ; | XXXXXX | $FF2D
       .byte $02 ; |      X | $FF2E
       .byte $02 ; |      X | $FF2F
       .byte $02 ; |      X | $FF30
       .byte $7E ; | XXXXXX | $FF31
       .byte $40 ; | X      | $FF32
       .byte $40 ; | X      | $FF33
       .byte $40 ; | X      | $FF34
       .byte $7E ; | XXXXXX | $FF35

       .byte $7E ; | XXXXXX | $FF36
       .byte $42 ; | X    X | $FF37
       .byte $42 ; | X    X | $FF38
       .byte $42 ; | X    X | $FF39
       .byte $7E ; | XXXXXX | $FF3A
       .byte $40 ; | X      | $FF3B
       .byte $40 ; | X      | $FF3C
       .byte $40 ; | X      | $FF3D
       .byte $40 ; | X      | $FF3E

       .byte $02 ; |      X | $FF3F
       .byte $02 ; |      X | $FF40
       .byte $02 ; |      X | $FF41
       .byte $02 ; |      X | $FF42
       .byte $02 ; |      X | $FF43
       .byte $02 ; |      X | $FF44
       .byte $02 ; |      X | $FF45
       .byte $02 ; |      X | $FF46
       .byte $7E ; | XXXXXX | $FF47

       .byte $7E ; | XXXXXX | $FF48
       .byte $42 ; | X    X | $FF49
       .byte $42 ; | X    X | $FF4A
       .byte $42 ; | X    X | $FF4B
       .byte $7E ; | XXXXXX | $FF4C
       .byte $42 ; | X    X | $FF4D
       .byte $42 ; | X    X | $FF4E
       .byte $42 ; | X    X | $FF4F
       .byte $7E ; | XXXXXX | $FF50

       .byte $02 ; |      X | $FF51
       .byte $02 ; |      X | $FF52
       .byte $02 ; |      X | $FF53
       .byte $02 ; |      X | $FF54
       .byte $7E ; | XXXXXX | $FF55
       .byte $42 ; | X    X | $FF56
       .byte $42 ; | X    X | $FF57
       .byte $42 ; | X    X | $FF58
       .byte $7E ; | XXXXXX | $FF59

  ELSE

LFF00: .byte $7E ; | XXXXXX | $FF00
       .byte $42 ; | X    X | $FF01
       .byte $42 ; | X    X | $FF02
       .byte $42 ; | X    X | $FF06
       .byte $42 ; | X    X | $FF07
       .byte $7E ; | XXXXXX | $FF08
       .byte $00 ; |        | $FF5A
       .byte $00 ; |        | $FF5B
       .byte $00 ; |        | $FF5C

       .byte $10 ; |   X    | $FF09
       .byte $10 ; |   X    | $FF0D
       .byte $10 ; |   X    | $FF0E
       .byte $10 ; |   X    | $FF0F
       .byte $10 ; |   X    | $FF10
       .byte $10 ; |   X    | $FF11
       .byte $00 ; |        | $FF5A
       .byte $00 ; |        | $FF5B
       .byte $00 ; |        | $FF5C

       .byte $7E ; | XXXXXX | $FF12
       .byte $40 ; | X      | $FF13
       .byte $7E ; | XXXXXX | $FF16
       .byte $02 ; |      X | $FF18
       .byte $02 ; |      X | $FF19
       .byte $7E ; | XXXXXX | $FF1A
       .byte $00 ; |        | $FF5A
       .byte $00 ; |        | $FF5B
       .byte $00 ; |        | $FF5C

       .byte $7E ; | XXXXXX | $FF1B
       .byte $02 ; |      X | $FF1C
       .byte $02 ; |      X | $FF1E
       .byte $7E ; | XXXXXX | $FF1F
       .byte $02 ; |      X | $FF20
       .byte $7E ; | XXXXXX | $FF23
       .byte $00 ; |        | $FF5A
       .byte $00 ; |        | $FF5B
       .byte $00 ; |        | $FF5C

       .byte $02 ; |      X | $FF24
       .byte $02 ; |      X | $FF25
       .byte $7E ; | XXXXXX | $FF28
       .byte $42 ; | X    X | $FF2A
       .byte $42 ; | X    X | $FF2B
       .byte $42 ; | X    X | $FF2C
       .byte $00 ; |        | $FF5A
       .byte $00 ; |        | $FF5B
       .byte $00 ; |        | $FF5C

       .byte $7E ; | XXXXXX | $FF2D
       .byte $02 ; |      X | $FF2E
       .byte $02 ; |      X | $FF30
       .byte $7E ; | XXXXXX | $FF31
       .byte $40 ; | X      | $FF32
       .byte $7E ; | XXXXXX | $FF35
       .byte $00 ; |        | $FF5A
       .byte $00 ; |        | $FF5B
       .byte $00 ; |        | $FF5C

       .byte $7E ; | XXXXXX | $FF36
       .byte $42 ; | X    X | $FF37
       .byte $42 ; | X    X | $FF39
       .byte $7E ; | XXXXXX | $FF3A
       .byte $40 ; | X      | $FF3B
       .byte $40 ; | X      | $FF3E
       .byte $00 ; |        | $FF5A
       .byte $00 ; |        | $FF5B
       .byte $00 ; |        | $FF5C

       .byte $02 ; |      X | $FF3F
       .byte $02 ; |      X | $FF40
       .byte $02 ; |      X | $FF41
       .byte $02 ; |      X | $FF42
       .byte $02 ; |      X | $FF46
       .byte $7E ; | XXXXXX | $FF47
       .byte $00 ; |        | $FF5A
       .byte $00 ; |        | $FF5B
       .byte $00 ; |        | $FF5C

       .byte $7E ; | XXXXXX | $FF48
       .byte $42 ; | X    X | $FF49
       .byte $42 ; | X    X | $FF4B
       .byte $7E ; | XXXXXX | $FF4C
       .byte $42 ; | X    X | $FF4F
       .byte $7E ; | XXXXXX | $FF50
       .byte $00 ; |        | $FF5A
       .byte $00 ; |        | $FF5B
       .byte $00 ; |        | $FF5C

       .byte $02 ; |      X | $FF51
       .byte $02 ; |      X | $FF54
       .byte $7E ; | XXXXXX | $FF55
       .byte $42 ; | X    X | $FF56
       .byte $42 ; | X    X | $FF58
       .byte $7E ; | XXXXXX | $FF59
       .byte $00 ; |        | $FF5A
       .byte $00 ; |        | $FF5B
       .byte $00 ; |        | $FF5C

  ENDIF



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
LFF67: .byte $00 ; |        | $FF67
       .byte $20 ; |  X     | $FF68
       .byte $92 ; |X  X  X | $FF69
       .byte $00 ; |        | $FF6A
       .byte $24 ; |  X  X  | $FF6B
       .byte $05 ; |     X X| $FF6C
       .byte $40 ; | X      | $FF6D
       .byte $22 ; |  X   X | $FF6E
       .byte $00 ; |        | $FF6F
       .byte $24 ; |  X  X  | $FF70
       .byte $80 ; |X       | $FF71
       .byte $00 ; |        | $FF72
       .byte $21 ; |  X    X| $FF73
LFF74: .byte $00 ; |        | $FF74
       .byte $80 ; |X       | $FF75
       .byte $00 ; |        | $FF76
       .byte $00 ; |        | $FF77
       .byte $01 ; |       X| $FF78
       .byte $00 ; |        | $FF79
       .byte $00 ; |        | $FF7A
       .byte $40 ; | X      | $FF7B
       .byte $00 ; |        | $FF7C
       .byte $00 ; |        | $FF7D
       .byte $02 ; |      X | $FF7E
       .byte $00 ; |        | $FF7F
       .byte $80 ; |X       | $FF80
LFF81: .byte $00 ; |        | $FF81
       .byte $00 ; |        | $FF82
       .byte $00 ; |        | $FF83
       .byte $00 ; |        | $FF84
       .byte $00 ; |        | $FF85
       .byte $00 ; |        | $FF86
       .byte $81 ; |X      X| $FF87
       .byte $66 ; | XX  XX | $FF88
       .byte $7E ; | XXXXXX | $FF89
       .byte $3C ; |  XXXX  | $FF8A
       .byte $3C ; |  XXXX  | $FF8B
       .byte $18 ; |   XX   | $FF8C
       .byte $18 ; |   XX   | $FF8D
LFF8E: .byte $00 ; |        | $FF8E
       .byte $10 ; |   X    | $FF8F
       .byte $18 ; |   XX   | $FF90
       .byte $38 ; |  XXX   | $FF91
       .byte $00 ; |        | $FF92
       .byte $00 ; |        | $FF93
       .byte $81 ; |X      X| $FF94
       .byte $66 ; | XX  XX | $FF95
       .byte $7E ; | XXXXXX | $FF96
       .byte $3C ; |  XXXX  | $FF97
       .byte $3C ; |  XXXX  | $FF98
       .byte $18 ; |   XX   | $FF99
       .byte $18 ; |   XX   | $FF9A
       .byte $00 ; |        | $FF9B
       .byte $00 ; |        | $FF9C
       .byte $00 ; |        | $FF9D
       .byte $00 ; |        | $FF9E
       .byte $80 ; |X       | $FF9F
       .byte $80 ; |X       | $FFA0
       .byte $C0 ; |XX      | $FFA1
       .byte $60 ; | XX     | $FFA2
       .byte $78 ; | XXXX   | $FFA3
       .byte $7F ; | XXXXXXX| $FFA4
       .byte $3C ; |  XXXX  | $FFA5
       .byte $38 ; |  XXX   | $FFA6
       .byte $20 ; |  X     | $FFA7
       .byte $00 ; |        | $FFA8
       .byte $06 ; |     XX | $FFA9
       .byte $0E ; |    XXX | $FFAA
       .byte $0C ; |    XX  | $FFAB
       .byte $8C ; |X   XX  | $FFAC
       .byte $80 ; |X       | $FFAD
       .byte $C0 ; |XX      | $FFAE
       .byte $60 ; | XX     | $FFAF
       .byte $78 ; | XXXX   | $FFB0
       .byte $7F ; | XXXXXXX| $FFB1
       .byte $3C ; |  XXXX  | $FFB2
       .byte $38 ; |  XXX   | $FFB3
       .byte $20 ; |  X     | $FFB4
       .byte $00 ; |        | $FFB5
       .byte $00 ; |        | $FFB6
       .byte $00 ; |        | $FFB7
       .byte $00 ; |        | $FFB8
       .byte $80 ; |X       | $FFB9
       .byte $80 ; |X       | $FFBA
       .byte $C0 ; |XX      | $FFBB
       .byte $C0 ; |XX      | $FFBC
       .byte $E0 ; |XXX     | $FFBD
       .byte $E0 ; |XXX     | $FFBE
       .byte $F0 ; |XXXX    | $FFBF
       .byte $F8 ; |XXXXX   | $FFC0
       .byte $FC ; |XXXXXX  | $FFC1
       .byte $00 ; |        | $FFC2
       .byte $00 ; |        | $FFC3
       .byte $06 ; |     XX | $FFC4
       .byte $0E ; |    XXX | $FFC5
       .byte $8C ; |X   XX  | $FFC6
       .byte $8C ; |X   XX  | $FFC7
       .byte $C0 ; |XX      | $FFC8
       .byte $C0 ; |XX      | $FFC9
       .byte $E0 ; |XXX     | $FFCA
       .byte $E0 ; |XXX     | $FFCB
       .byte $F0 ; |XXXX    | $FFCC
       .byte $F8 ; |XXXXX   | $FFCD
       .byte $FC ; |XXXXXX  | $FFCE

LFFCF: .byte $C4 ; |XX   X  | $FFCF
       .byte $A6 ; |X X  XX | $FFD0
       .byte $4C ; | X  XX  | $FFD1
       .byte $90 ; |X  X    | $FFD2

LFFD3: .byte $40 ; | X      | $FFD3
       .byte $50 ; | X X    | $FFD4
       .byte $38 ; |  XXX   | $FFD5
       .byte $48 ; | X  X   | $FFD6
       .byte $58 ; | X XX   | $FFD7
LFFD8: .byte $4E ; | X  XXX | $FFD8
       .byte $5E ; | X XXXX | $FFD9
       .byte $47 ; | X   XXX| $FFDA
       .byte $57 ; | X X XXX| $FFDB
       .byte $67 ; | XX  XXX| $FFDC

LFFDD: .byte $1E ; |   XXXX | $FFDD
       .byte $78 ; | XXXX   | $FFDE
       .byte $3C ; |  XXXX  | $FFDF
       .byte $5A ; | X XX X | $FFE0
       .byte $96 ; |X  X XX | $FFE1
       .byte $2D ; |  X XX X| $FFE2
       .byte $69 ; | XX X  X| $FFE3
LFFE4: .byte $2F ; |  X XXXX| $FFE4
       .byte $3D ; |  XXXX X| $FFE5
       .byte $4E ; | X  XXX | $FFE6
       .byte $5E ; | X XXXX | $FFE7
       .byte $6F ; | XX XXXX| $FFE8
       .byte $80 ; |X       | $FFE9
       .byte $90 ; |X  X    | $FFEA




LFFEB:

  IF ORIGCONT
       LDA    INPT3                   ;3
  ELSE
       LDA    INPT0                   ;3
  ENDIF

       BMI    LFFF1                   ;2
       INC    $BB                     ;5
LFFF1:
       RTS                            ;6




;free
       .byte $00 ; |        | $FFB7
       .byte $00 ; |        | $FFB7
       .byte $00 ; |        | $FFB7
       .byte $00 ; |        | $FFB7
       .byte $00 ; |        | $FFB7
       .byte $00 ; |        | $FFB7
       .byte $00 ; |        | $FFB7
       .byte $00 ; |        | $FFB7
       .byte $00 ; |        | $FFB7
       .byte $00 ; |        | $FFB7


       ORG $FFFC
       .word START,START
