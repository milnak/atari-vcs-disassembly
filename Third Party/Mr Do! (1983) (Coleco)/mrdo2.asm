; Disassembly of mrdo2.bin
; Disassembled Sun Feb 08 23:48:20 2004
; Using DiStella v2.0
;
; Command Line: C:\BIN\DISTELLA.EXE -pafscmrdo2.cfg mrdo2.bin 
;
; mrdo2.cfg contents:
;
;      CODE 3000 323B
;      GFX 323C 325B
;      CODE 325C 327A
;      GFX 327B 327E
;      CODE 327F 35C1
;      GFX 35C2 39DA
;      CODE 39DB 39F4
;      GFX 39F5 3CD2
;      CODE 3CD3 3CEB
;      GFX 3CEC 3CFD
;      CODE 3CFE 3F83
;      GFX 3F84 3F8A
;      CODE 3F8B 3FE7
;      GFX 3FE8 3FFF

      processor 6502

VBLANK  =  $01
WSYNC   =  $02
NUSIZ0  =  $04
NUSIZ1  =  $05
COLUP0  =  $06
COLUP1  =  $07
COLUPF  =  $08
COLUBK  =  $09
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
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
VDELP0  =  $25
VDEL01  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
INTIM   =  $0284
TIM64T  =  $0296
L302E   =   $302E

       ORG $3000

       NOP            ;2
       NOP            ;2
       NOP            ;2
       JMP    L3012   ;3
       NOP            ;2
L3007: LDA    $FFF8   ;4
       JMP    L302E   ;3
       NOP            ;2

START:
       NOP            ;2
       LDA    $FFF8   ;4
L3012: NOP            ;2
       JSR    L3507   ;6
       LDX    $CE     ;3
       INX            ;2
       CPX    #$03    ;2
       BNE    L301F   ;2
       LDX    #$00    ;2
L301F: STX    $CE     ;3
       LDA    $84     ;3
       AND    #$0F    ;2
       CMP    #$0F    ;2
       BNE    L3054   ;2
       LDX    #$01    ;2
L302B: LDA    $C4,X   ;4
       AND    #$01    ;2
       BEQ    L3036   ;2
       DEC    $C4,X   ;6
       JMP    L3038   ;3
L3036: INC    $C4,X   ;6
L3038: DEX            ;2
       BPL    L302B   ;2
       LDA    $8E     ;3
       AND    #$01    ;2
       TAX            ;2
       LDA    $8E     ;3
       EOR    #$01    ;2
       STA    $8E     ;3
       LDY    #$03    ;2
       LDA    L3248,X ;4
       CPY    $B8     ;3
       BEQ    L3052   ;2
       LDA    L324A,X ;4
L3052: STA    $C3     ;3
L3054: LDA    $DA     ;3
       CMP    #$10    ;2
       BEQ    L306B   ;2
       CMP    #$20    ;2
       BEQ    L306B   ;2
       CMP    #$50    ;2
       BNE    L3068   ;2
       LDA    $85     ;3
       AND    #$03    ;2
       BNE    L306B   ;2
L3068: JMP    L325C   ;3
L306B: LDA    $8B     ;3
       AND    #$07    ;2
       TAX            ;2
       LDA    L3CEC,X ;4
       TAY            ;2
       LDA    L35C2,Y ;4
       LDX    #$04    ;2
       JSR    L3CD3   ;6
       LDA    #$00    ;2
       STA    $DC     ;3
       LDY    #$02    ;2
       LDA    #$E4    ;2
       LDX    #$07    ;2
L3086: STA    $DE,X   ;4
       STY    $E7,X   ;4
       DEX            ;2
       BPL    L3086   ;2
       LDA    $84     ;3
       AND    #$03    ;2
       CMP    #$03    ;2
       BNE    L30C1   ;2
       LDA    $8D     ;3
       BMI    L30C1   ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAX            ;2
       STX    $F1     ;3
       LDA    $D0,X   ;4
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAY            ;2
       LDA    $D0,X   ;4
       ASL            ;2
       AND    #$1F    ;2
       TAX            ;2
       LDA    L323C,X ;4
       STA.wy $00DE,Y ;5
       LDA    L323D,X ;4
       LDX    $F1     ;3
       LDA    $D4,X   ;4
       TAX            ;2
       LDA    L35C2,X ;4
       STA.wy $00E7,Y ;5
L30C1: LDX    #$03    ;2
       STX    $DD     ;3
L30C5: LDX    $DD     ;3
       LDA    $D0,X   ;4
       BMI    L30F1   ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAY            ;2
       LDA.wy $00DE,Y ;4
       CMP    #$E4    ;2
       BNE    L30F1   ;2
       LDA    $D0,X   ;4
       AND    #$0F    ;2
       ASL            ;2
       TAX            ;2
       LDA    L323C,X ;4
       STA.wy $00DE,Y ;5
       LDA    L323D,X ;4
       LDX    $DD     ;3
       LDA    $D4,X   ;4
       TAX            ;2
       LDA    L35C2,X ;4
       STA.wy $00E7,Y ;5
L30F1: DEC    $DD     ;5
       BPL    L30C5   ;2
       JSR    L318C   ;6
       BEQ    L3115   ;2
       LDA    $84     ;3
       AND    #$01    ;2
       BNE    L3171   ;2
       LDA    $BE     ;3
       BMI    L3109   ;2
       LDX    #$00    ;2
       JSR    L31C0   ;6
L3109: LDA    $BF     ;3
       BMI    L3112   ;2
       LDX    #$01    ;2
       JSR    L31C0   ;6
L3112: JMP    L3189   ;3
L3115: LDA    $CE     ;3
       BEQ    L312F   ;2
       LDX    #$01    ;2
       LDA    $84     ;3
       AND    #$02    ;2
       BNE    L3122   ;2
       DEX            ;2
L3122: LDA    $BE,X   ;4
       JSR    L31C0   ;6
       JMP    L3189   ;3
       JSR    L318C   ;6
       BNE    L3171   ;2
L312F: LDA    $84     ;3
       AND    #$02    ;2
       BNE    L3153   ;2
       LDX    #$00    ;2
       JSR    L321E   ;6
       BNE    L3144   ;2
       LDX    #$00    ;2
       JSR    L31C0   ;6
       JMP    L3189   ;3
L3144: LDX    #$01    ;2
       JSR    L321E   ;6
       BNE    L3189   ;2
       LDX    #$01    ;2
       JSR    L31C0   ;6
       JMP    L3189   ;3
L3153: LDX    #$01    ;2
       JSR    L321E   ;6
       BNE    L3162   ;2
       LDX    #$01    ;2
       JSR    L31C0   ;6
       JMP    L3189   ;3
L3162: LDX    #$00    ;2
       JSR    L321E   ;6
       BNE    L3189   ;2
       LDX    #$00    ;2
       JSR    L31C0   ;6
       JMP    L3189   ;3
L3171: LDX    #$00    ;2
       JSR    L321E   ;6
       BNE    L317D   ;2
       LDX    #$00    ;2
       JSR    L31C0   ;6
L317D: LDX    #$01    ;2
       JSR    L321E   ;6
       BNE    L3189   ;2
       LDX    #$01    ;2
       JSR    L31C0   ;6
L3189: JMP    L325C   ;3
L318C: LDA    $BE     ;3
       BPL    L3191   ;2
       RTS            ;6

L3191: AND    #$70    ;2
       STA    $EF     ;3
       LDA    $BF     ;3
       BPL    L319A   ;2
       RTS            ;6

L319A: AND    #$70    ;2
       SEC            ;2
       SBC    $EF     ;3
       BNE    L31A2   ;2
       RTS            ;6

L31A2: CMP    #$10    ;2
       BNE    L31B2   ;2
       LDA    $BF     ;3
       AND    #$0F    ;2
       BNE    L31AF   ;2
       LDA    #$01    ;2
       RTS            ;6

L31AF: LDA    #$00    ;2
       RTS            ;6

L31B2: CMP    #$F0    ;2
       BEQ    L31B7   ;2
       RTS            ;6

L31B7: LDA    $BE     ;3
       AND    #$0F    ;2
       BNE    L31AF   ;2
       LDA    #$01    ;2
       RTS            ;6

L31C0: LDA    $C4,X   ;4
       AND    #$0F    ;2
       TAY            ;2
       LDA    #$00    ;2
       CPY    #$04    ;2
       BCC    L31CD   ;2
       LDA    #$01    ;2
L31CD: STA    $F1     ;3
       LDA    L324C,Y ;4
       STA    $EF     ;3
       LDA    $BE,X   ;4
       STA    $F0     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAY            ;2
       CLC            ;2
L31DE: DEY            ;2
       BMI    L31E7   ;2
       CLC            ;2
       ASL    $F1     ;5
       JMP    L31DE   ;3
L31E7: TAY            ;2
       LDA    $F1     ;3
       ORA    $DC     ;3
       STA    $DC     ;3
       LDA    $C1,X   ;4
       TAX            ;2
       LDA    L35C2,X ;4
       STA.wy $00E7,Y ;5
       LDA    $F0     ;3
       AND    #$0F    ;2
       BNE    L3203   ;2
       LDA    $EF     ;3
       STA.wy $00DE,Y ;5
       RTS            ;6

L3203: TAX            ;2
       LDA    L3643,X ;4
       CLC            ;2
       ADC    $EF     ;3
       STA.wy $00DE,Y ;5
       LDA    $EF     ;3
       SEC            ;2
       SBC    L3653,X ;4
       STA.wy $00DD,Y ;5
       LDA    $F1     ;3
       LSR            ;2
       ORA    $DC     ;3
       STA    $DC     ;3
       RTS            ;6

L321E: LDA    $BE,X   ;4
       BPL    L3223   ;2
       RTS            ;6

L3223: LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAY            ;2
       LDA    $BE,X   ;4
       AND    #$0F    ;2
       BEQ    L3236   ;2
       LDA.wy $00DD,Y ;4
       CMP    #$E4    ;2
       BEQ    L3236   ;2
       RTS            ;6

L3236: LDA.wy $00DE,Y ;4
       CMP    #$E4    ;2
       RTS            ;6

L323C: .byte $00 ; |        | $323C
L323D: .byte $00 ; |        | $323D
       .byte $0E ; |    XXX | $323E
       .byte $00 ; |        | $323F
       .byte $1C ; |   XXX  | $3240
       .byte $00 ; |        | $3241
       .byte $00 ; |        | $3242
       .byte $00 ; |        | $3243
       .byte $2A ; |  X X X | $3244
       .byte $00 ; |        | $3245
       .byte $38 ; |  XXX   | $3246
       .byte $00 ; |        | $3247
L3248: .byte $22 ; |  X   X | $3248
       .byte $44 ; | X   X  | $3249
L324A: .byte $66 ; | XX  XX | $324A
       .byte $88 ; |X   X   | $324B
L324C: .byte $4F ; | X  XXXX| $324C
       .byte $70 ; | XXX    | $324D
       .byte $92 ; |X  X  X | $324E
       .byte $B4 ; |X XX X  | $324F
       .byte $00 ; |        | $3250
       .byte $20 ; |  X     | $3251
       .byte $49 ; | X  X  X| $3252
       .byte $49 ; | X  X  X| $3253
       .byte $6A ; | XX X X | $3254
       .byte $6A ; | XX X X | $3255
       .byte $8B ; |X   X XX| $3256
       .byte $8B ; |X   X XX| $3257
       .byte $AC ; |X X XX  | $3258
       .byte $AC ; |X X XX  | $3259
       .byte $CD ; |XX  XX X| $325A
       .byte $CD ; |XX  XX X| $325B
L325C: LDA    INTIM   ;4
       BMI    L325C   ;2
       LDA    #$40    ;2
       STA    WSYNC   ;3
       STA    VBLANK  ;3
       LDA    #$AD    ;2
       STA    TIM64T  ;4
       LDA    $DA     ;3
       CMP    #$30    ;2
       BNE    L327F   ;2
       LDA    #$B6    ;2
       LDX    #$C3    ;2
       LDY    #$BD    ;2
       JMP    L32CE   ;3
L327B: .byte $20 ; |  X     | $327B
       .byte $10 ; |   X    | $327C
       .byte $08 ; |    X   | $327D
       .byte $04 ; |     X  | $327E
L327F: CMP    #$10    ;2
       BEQ    L329D   ;2
       CMP    #$20    ;2
       BEQ    L329D   ;2
       CMP    #$40    ;2
       BEQ    L32BF   ;2
       CMP    #$70    ;2
       BEQ    L32A0   ;2
       CMP    #$80    ;2
       BEQ    L32F3   ;2
       CMP    #$50    ;2
       BNE    L329D   ;2
       LDA    $85     ;3
       AND    #$03    ;2
       BEQ    L32EA   ;2
L329D: JMP    L338B   ;3
L32A0: LDA    #$CF    ;2
       STA    $EC     ;3
       LDA    #$B6    ;2
       STA    $ED     ;3
       LDA    #$BD    ;2
       STA    $EE     ;3
       LDY    #$66    ;2
       LDA    $84     ;3
       AND    #$10    ;2
       BNE    L32B6   ;2
       LDY    #$88    ;2
L32B6: STY    $EA     ;3
       LDA    #$39    ;2
       STA    $EB     ;3
       JMP    L3303   ;3
L32BF: LDA    $85     ;3
       AND    #$03    ;2
       BEQ    L32C8   ;2
       JMP    L338B   ;3
L32C8: LDA    #$BD    ;2
       LDX    #$C3    ;2
       LDY    #$C9    ;2
L32CE: STA    $EC     ;3
       STX    $ED     ;3
       STY    $EE     ;3
       LDY    #$22    ;2
       LDA    $84     ;3
       LDX    $80     ;3
       AND    L327B,X ;4
       BNE    L32E1   ;2
       LDY    #$44    ;2
L32E1: STY    $EA     ;3
       LDA    #$39    ;2
       STA    $EB     ;3
       JMP    L3303   ;3
L32EA: LDA    #$AA    ;2
       LDX    #$B0    ;2
       LDY    #$B7    ;2
       JMP    L32CE   ;3
L32F3: LDA    #$BD    ;2
       STA    $EC     ;3
       STA    $ED     ;3
       STA    $EE     ;3
       LDA    #$34    ;2
       STA    $EA     ;3
       LDA    #$39    ;2
       STA    $EB     ;3
L3303: LDA    #$0E    ;2
       STA    COLUP0  ;3
       STA    COLUP1  ;3
       LDA    $EC     ;3
       LDX    #$3C    ;2
       JSR    L39DB   ;6
       LDX    #$17    ;2
L3312: STA    WSYNC   ;3
       DEX            ;2
       BPL    L3312   ;2
       JSR    L3F8B   ;6
       LDA    #$98    ;2
       STA    COLUP0  ;3
       STA    COLUP1  ;3
       LDA    $ED     ;3
       LDX    #$3C    ;2
       JSR    L39DB   ;6
       LDX    #$14    ;2
L3329: STA    WSYNC   ;3
       DEX            ;2
       BPL    L3329   ;2
       JSR    L3F8B   ;6
       LDA    #$28    ;2
       STA    COLUP0  ;3
       STA    COLUP1  ;3
       LDA    $EE     ;3
       LDX    #$3C    ;2
       JSR    L39DB   ;6
       LDX    #$1C    ;2
L3340: STA    WSYNC   ;3
       LDA    $DA     ;3
       CMP    #$30    ;2
       BNE    L3353   ;2
       LDY    $80     ;3
       LDA    L38E9,Y ;4
       STA    $F8     ;3
       LDA    #$38    ;2
       STA    $F9     ;3
L3353: DEX            ;2
       BPL    L3340   ;2
       JSR    L3F8B   ;6
       LDX    #$2D    ;2
L335B: STA    WSYNC   ;3
       DEX            ;2
       BPL    L335B   ;2
       LDA    #$0E    ;2
       STA    COLUP0  ;3
       LDA    #$00    ;2
       STA    VDELP0  ;3
       STA    VDEL01  ;3
       STA    NUSIZ0  ;3
       LDY    $C0     ;3
       LDA    L35C2,Y ;4
       LDX    #$00    ;2
       JSR    L3CD3   ;6
       LDY    #$0F    ;2
L3378: LDA    ($EA),Y ;5
       STA    WSYNC   ;3
       STA    GRP0    ;3
       DEY            ;2
       BPL    L3378   ;2
       LDX    #$0F    ;2
L3383: STA    WSYNC   ;3
       DEX            ;2
       BPL    L3383   ;2
       JMP    L3007   ;3
L338B: STA    HMCLR   ;3
       LDA    #$38    ;2
       STA    $F3     ;3
       STA    $F5     ;3
       STA    $F7     ;3
       STA    $F9     ;3
       STA    $FB     ;3
       STA    $FD     ;3
       LDA    #$90    ;2
       STA    $FC     ;3
       LDA    #$E0    ;2
       STA    $F2     ;3
       LDA    $82     ;3
       AND    #$0F    ;2
       TAY            ;2
       LDA    L38E8,Y ;4
       STA    $FA     ;3
       LDA    $82     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAY            ;2
       LDA    L38E8,Y ;4
       STA    $F8     ;3
       LDA    $83     ;3
       AND    #$0F    ;2
       TAY            ;2
       LDA    L38E8,Y ;4
       STA    $F6     ;3
       LDA    $83     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAY            ;2
       LDA    L38E8,Y ;4
       STA    $F4     ;3
       LDA    #$1A    ;2
       STA    COLUP0  ;3
       STA    COLUP1  ;3
       JSR    L3F8B   ;6
       LDY    #$05    ;2
       LDX    #$0B    ;2
       LDA    $8B     ;3
       STA    $EF     ;3
L33E0: LDA    #$3C    ;2
       STA    $F2,X   ;4
       DEX            ;2
       ASL    $EF     ;5
       LDA    L39CF,Y ;4
       BCC    L33EF   ;2
       LDA    L39D5,Y ;4
L33EF: STA    $F2,X   ;4
       DEX            ;2
       DEY            ;2
       BPL    L33E0   ;2
       LDA    #$02    ;2
       STA    WSYNC   ;3
       STA    ENABL   ;3
       LDA    #$FF    ;2
       STA    PF2     ;3
       LDA    #$96    ;2
       STA    COLUPF  ;3
       LDA    #$1C    ;2
       STA    COLUP0  ;3
       STA    COLUP1  ;3
       LDA    #$00    ;2
       STA    WSYNC   ;3
       STA    PF2     ;3
       JSR    L3FAF   ;6
       LDA    #$FF    ;2
       STA    WSYNC   ;3
       STA    PF2     ;3
       LDA    #$00    ;2
       STA    ENABL   ;3
       LDA    #$00    ;2
       STA    VDELP0  ;3
       STA    VDEL01  ;3
       STA    NUSIZ0  ;3
       STA    NUSIZ1  ;3
       STA    WSYNC   ;3
       LDA    #$00    ;2
       STA    COLUPF  ;3
       LDA    $DA     ;3
       CMP    #$10    ;2
       BNE    L3440   ;2
       LDA    $BA     ;3
       BMI    L3440   ;2
       LDY    $BB     ;3
       LDA    L35C2,Y ;4
       LDX    #$02    ;2
       JSR    L3CD3   ;6
L3440: LDX    #$07    ;2
L3442: LDA    $90,X   ;4
       BPL    L345C   ;2
       AND    #$7F    ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAY            ;2
       LDA    L3663,Y ;4
       TAY            ;2
       LDA    L35C2,Y ;4
       STA    $F8,X   ;4
       LDA    #$00    ;2
       STA    $EF,X   ;4
       JMP    L3464   ;3
L345C: LDA    #$02    ;2
       STA    $F8,X   ;4
       LDA    #$34    ;2
       STA    $EF,X   ;4
L3464: DEX            ;2
       BPL    L3442   ;2
       LDA    $BD     ;3
       BPL    L346E   ;2
       JMP    L34E1   ;3
L346E: LDA    $84     ;3
       AND    #$01    ;2
       BEQ    L3477   ;2
       JMP    L34A9   ;3
L3477: LDA    $BD     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       AND    #$07    ;2
       TAX            ;2
       LDY    $C0     ;3
       LDA    L35C2,Y ;4
       STA    $F8,X   ;4
       LDA    $BD     ;3
       AND    #$0F    ;2
       BEQ    L34A2   ;2
       TAY            ;2
       LDA    L3643,Y ;4
       CLC            ;2
       ADC    $C3     ;3
       STA    $EF,X   ;4
       DEX            ;2
       LDA    $C3     ;3
       SEC            ;2
       SBC    L3653,Y ;4
       STA    $EF,X   ;4
       JMP    L34E1   ;3
L34A2: LDA    $C3     ;3
       STA    $EF,X   ;4
       JMP    L34E1   ;3
L34A9: LDA    $BD     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       AND    #$07    ;2
       TAX            ;2
       LDA    $90,X   ;4
       BMI    L34E1   ;2
       LDA    $BD     ;3
       AND    #$0F    ;2
       BEQ    L34D6   ;2
       TAY            ;2
       DEX            ;2
       LDA    $90,X   ;4
       BMI    L34E1   ;2
       INX            ;2
       LDA    L3643,Y ;4
       CLC            ;2
       ADC    $C3     ;3
       STA    $EF,X   ;4
       LDA    $C3     ;3
       SEC            ;2
       SBC    L3653,Y ;4
       STA    $EE,X   ;4
       JMP    L34DA   ;3
L34D6: LDA    $C3     ;3
       STA    $EF,X   ;4
L34DA: LDY    $C0     ;3
       LDA    L35C2,Y ;4
       STA    $F8,X   ;4
L34E1: LDA    INTIM   ;4
       BMI    L34E1   ;2
       STA    WSYNC   ;3
       LDA    #$80    ;2
       STA    PF0     ;3
       LDA    #$FF    ;2
       STA    PF1     ;3
       STA    PF2     ;3
       LDA    $8F     ;3
       STA    COLUPF  ;3
       STA    WSYNC   ;3
       LDA    #$00    ;2
       STA    COLUPF  ;3
       STA    WSYNC   ;3
       LDA    #$39    ;2
       STA    $F7     ;3
       STA    HMCLR   ;3
       JMP    L3CFE   ;3
L3507: LDY    $89     ;3
       BPL    L350E   ;2
       JMP    L3591   ;3
L350E: BNE    L354A   ;2
       LDY    $87     ;3
       LDX    #$0C    ;2
       LDA    L372D,Y ;4
       CMP    #$FF    ;2
       BEQ    L3541   ;2
       LDA    L372D,Y ;4
       BMI    L3522   ;2
       LDX    #$04    ;2
L3522: STX    AUDC1   ;3
       STA    AUDF1   ;3
       LDA    L378A,Y ;4
       AND    #$3F    ;2
       STA    $89     ;3
       LDA    L378A,Y ;4
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAX            ;2
       LDA    L37E7,X ;4
       STA    AUDV1   ;3
       INC    $87     ;5
       JMP    L354C   ;3
L3541: LDX    #$00    ;2
       STX    AUDV1   ;3
       DEX            ;2
       STX    $89     ;3
       BMI    L354C   ;2
L354A: DEC    $89     ;5
L354C: LDY    $88     ;3
       BMI    L35C1   ;2
       BNE    L358C   ;2
       LDY    $86     ;3
       LDX    #$0C    ;2
       LDA    L3673,Y ;4
       CMP    #$FF    ;2
       BEQ    L3583   ;2
       LDA    L3673,Y ;4
       BMI    L3564   ;2
       LDX    #$04    ;2
L3564: STX    AUDC0   ;3
       STA    AUDF0   ;3
       LDA    L36D0,Y ;4
       AND    #$3F    ;2
       STA    $88     ;3
       LDA    L36D0,Y ;4
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAX            ;2
       LDA    L37E7,X ;4
       STA    AUDV0   ;3
       INC    $86     ;5
       JMP    L35C1   ;3
L3583: LDX    #$00    ;2
       STX    AUDV0   ;3
       DEX            ;2
       STX    $88     ;3
       BNE    L35C1   ;2
L358C: DEC    $88     ;5
       JMP    L35C1   ;3
L3591: LDY    $88     ;3
       BMI    L35C1   ;2
       BNE    L35BF   ;2
       LDY    $86     ;3
       LDA    L37EB,Y ;4
       STA    AUDV0   ;3
       BNE    L35A6   ;2
       LDA    #$FF    ;2
       STA    $88     ;3
       BNE    L35C1   ;2
L35A6: LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       STA    AUDC0   ;3
       LDA    L37EC,Y ;4
       STA    AUDF0   ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       STA    $88     ;3
       INC    $86     ;5
       INC    $86     ;5
       JMP    L35C1   ;3
L35BF: DEC    $88     ;5
L35C1: RTS            ;6

L35C2: .byte $50 ; | X X    | $35C2
       .byte $40 ; | X      | $35C3
       .byte $30 ; |  XX    | $35C4
       .byte $20 ; |  X     | $35C5
       .byte $10 ; |   X    | $35C6
       .byte $00 ; |        | $35C7
       .byte $F0 ; |XXXX    | $35C8
       .byte $E0 ; |XXX     | $35C9
       .byte $D0 ; |XX X    | $35CA
       .byte $C0 ; |XX      | $35CB
       .byte $B0 ; |X XX    | $35CC
       .byte $A0 ; |X X     | $35CD
       .byte $90 ; |X  X    | $35CE
       .byte $71 ; | XXX   X| $35CF
       .byte $61 ; | XX    X| $35D0
       .byte $51 ; | X X   X| $35D1
       .byte $41 ; | X     X| $35D2
       .byte $31 ; |  XX   X| $35D3
       .byte $21 ; |  X    X| $35D4
       .byte $11 ; |   X   X| $35D5
       .byte $01 ; |       X| $35D6
       .byte $F1 ; |XXXX   X| $35D7
       .byte $E1 ; |XXX    X| $35D8
       .byte $D1 ; |XX X   X| $35D9
       .byte $C1 ; |XX     X| $35DA
       .byte $B1 ; |X XX   X| $35DB
       .byte $A1 ; |X X    X| $35DC
       .byte $91 ; |X  X   X| $35DD
       .byte $72 ; | XXX  X | $35DE
       .byte $62 ; | XX   X | $35DF
       .byte $52 ; | X X  X | $35E0
       .byte $42 ; | X    X | $35E1
       .byte $32 ; |  XX  X | $35E2
       .byte $22 ; |  X   X | $35E3
       .byte $12 ; |   X  X | $35E4
       .byte $02 ; |      X | $35E5
       .byte $F2 ; |XXXX  X | $35E6
       .byte $E2 ; |XXX   X | $35E7
       .byte $D2 ; |XX X  X | $35E8
       .byte $C2 ; |XX    X | $35E9
       .byte $B2 ; |X XX  X | $35EA
       .byte $A2 ; |X X   X | $35EB
       .byte $92 ; |X  X  X | $35EC
       .byte $73 ; | XXX  XX| $35ED
       .byte $63 ; | XX   XX| $35EE
       .byte $53 ; | X X  XX| $35EF
       .byte $43 ; | X    XX| $35F0
       .byte $33 ; |  XX  XX| $35F1
       .byte $23 ; |  X   XX| $35F2
       .byte $13 ; |   X  XX| $35F3
       .byte $03 ; |      XX| $35F4
       .byte $F3 ; |XXXX  XX| $35F5
       .byte $E3 ; |XXX   XX| $35F6
       .byte $D3 ; |XX X  XX| $35F7
       .byte $C3 ; |XX    XX| $35F8
       .byte $B3 ; |X XX  XX| $35F9
       .byte $A3 ; |X X   XX| $35FA
       .byte $93 ; |X  X  XX| $35FB
       .byte $74 ; | XXX X  | $35FC
       .byte $64 ; | XX  X  | $35FD
       .byte $54 ; | X X X  | $35FE
       .byte $44 ; | X   X  | $35FF
       .byte $34 ; |  XX X  | $3600
       .byte $24 ; |  X  X  | $3601
       .byte $14 ; |   X X  | $3602
       .byte $04 ; |     X  | $3603
       .byte $F4 ; |XXXX X  | $3604
       .byte $E4 ; |XXX  X  | $3605
       .byte $D4 ; |XX X X  | $3606
       .byte $C4 ; |XX   X  | $3607
       .byte $B4 ; |X XX X  | $3608
       .byte $A4 ; |X X  X  | $3609
       .byte $94 ; |X  X X  | $360A
       .byte $75 ; | XXX X X| $360B
       .byte $65 ; | XX  X X| $360C
       .byte $55 ; | X X X X| $360D
       .byte $45 ; | X   X X| $360E
       .byte $35 ; |  XX X X| $360F
       .byte $25 ; |  X  X X| $3610
       .byte $15 ; |   X X X| $3611
       .byte $05 ; |     X X| $3612
       .byte $F5 ; |XXXX X X| $3613
       .byte $E5 ; |XXX  X X| $3614
       .byte $D5 ; |XX X X X| $3615
       .byte $C5 ; |XX   X X| $3616
       .byte $B5 ; |X XX X X| $3617
       .byte $A5 ; |X X  X X| $3618
       .byte $95 ; |X  X X X| $3619
       .byte $76 ; | XXX XX | $361A
       .byte $66 ; | XX  XX | $361B
       .byte $56 ; | X X XX | $361C
       .byte $46 ; | X   XX | $361D
       .byte $36 ; |  XX XX | $361E
       .byte $26 ; |  X  XX | $361F
       .byte $16 ; |   X XX | $3620
       .byte $06 ; |     XX | $3621
       .byte $F6 ; |XXXX XX | $3622
       .byte $E6 ; |XXX  XX | $3623
       .byte $D6 ; |XX X XX | $3624
       .byte $C6 ; |XX   XX | $3625
       .byte $B6 ; |X XX XX | $3626
       .byte $A6 ; |X X  XX | $3627
       .byte $96 ; |X  X XX | $3628
       .byte $77 ; | XXX XXX| $3629
       .byte $67 ; | XX  XXX| $362A
       .byte $57 ; | X X XXX| $362B
       .byte $47 ; | X   XXX| $362C
       .byte $37 ; |  XX XXX| $362D
       .byte $27 ; |  X  XXX| $362E
       .byte $17 ; |   X XXX| $362F
       .byte $07 ; |     XXX| $3630
       .byte $F7 ; |XXXX XXX| $3631
       .byte $E7 ; |XXX  XXX| $3632
       .byte $D7 ; |XX X XXX| $3633
       .byte $C7 ; |XX   XXX| $3634
       .byte $B7 ; |X XX XXX| $3635
       .byte $A7 ; |X X  XXX| $3636
       .byte $97 ; |X  X XXX| $3637
       .byte $78 ; | XXXX   | $3638
       .byte $68 ; | XX X   | $3639
       .byte $58 ; | X XX   | $363A
       .byte $48 ; | X  X   | $363B
       .byte $38 ; |  XXX   | $363C
       .byte $28 ; |  X X   | $363D
       .byte $18 ; |   XX   | $363E
       .byte $08 ; |    X   | $363F
       .byte $F8 ; |XXXXX   | $3640
       .byte $E8 ; |XXX X   | $3641
       .byte $D8 ; |XX XX   | $3642
L3643: .byte $00 ; |        | $3643
       .byte $01 ; |       X| $3644
       .byte $02 ; |      X | $3645
       .byte $03 ; |      XX| $3646
       .byte $04 ; |     X  | $3647
       .byte $05 ; |     X X| $3648
       .byte $06 ; |     XX | $3649
       .byte $07 ; |     XXX| $364A
       .byte $08 ; |    X   | $364B
       .byte $09 ; |    X  X| $364C
       .byte $0A ; |    X X | $364D
       .byte $0B ; |    X XX| $364E
       .byte $0C ; |    XX  | $364F
       .byte $0D ; |    XX X| $3650
       .byte $0E ; |    XXX | $3651
       .byte $0F ; |    XXXX| $3652
L3653: .byte $12 ; |   X  X | $3653
       .byte $11 ; |   X   X| $3654
       .byte $10 ; |   X    | $3655
       .byte $0F ; |    XXXX| $3656
       .byte $0E ; |    XXX | $3657
       .byte $0D ; |    XX X| $3658
       .byte $0C ; |    XX  | $3659
       .byte $0B ; |    X XX| $365A
       .byte $0A ; |    X X | $365B
       .byte $09 ; |    X  X| $365C
       .byte $08 ; |    X   | $365D
       .byte $07 ; |     XXX| $365E
       .byte $06 ; |     XX | $365F
       .byte $05 ; |     X X| $3660
       .byte $04 ; |     X  | $3661
       .byte $03 ; |      XX| $3662
L3663: .byte $00 ; |        | $3663
       .byte $08 ; |    X   | $3664
       .byte $10 ; |   X    | $3665
       .byte $18 ; |   XX   | $3666
       .byte $20 ; |  X     | $3667
       .byte $28 ; |  X X   | $3668
       .byte $30 ; |  XX    | $3669
       .byte $38 ; |  XXX   | $366A
       .byte $40 ; | X      | $366B
       .byte $48 ; | X  X   | $366C
       .byte $50 ; | X X    | $366D
       .byte $58 ; | X XX   | $366E
       .byte $60 ; | XX     | $366F
       .byte $68 ; | XX X   | $3670
       .byte $70 ; | XXX    | $3671
       .byte $78 ; | XXXX   | $3672
L3673: .byte $13 ; |   X  XX| $3673
       .byte $00 ; |        | $3674
       .byte $0E ; |    XXX | $3675
       .byte $00 ; |        | $3676
       .byte $0F ; |    XXXX| $3677
       .byte $00 ; |        | $3678
       .byte $11 ; |   X   X| $3679
       .byte $00 ; |        | $367A
       .byte $13 ; |   X  XX| $367B
       .byte $00 ; |        | $367C
       .byte $13 ; |   X  XX| $367D
       .byte $00 ; |        | $367E
       .byte $13 ; |   X  XX| $367F
       .byte $00 ; |        | $3680
       .byte $13 ; |   X  XX| $3681
       .byte $00 ; |        | $3682
       .byte $16 ; |   X XX | $3683
       .byte $00 ; |        | $3684
       .byte $11 ; |   X   X| $3685
       .byte $00 ; |        | $3686
       .byte $13 ; |   X  XX| $3687
       .byte $00 ; |        | $3688
       .byte $16 ; |   X XX | $3689
       .byte $00 ; |        | $368A
       .byte $17 ; |   X XXX| $368B
       .byte $00 ; |        | $368C
       .byte $1A ; |   XX X | $368D
       .byte $00 ; |        | $368E
       .byte $17 ; |   X XXX| $368F
       .byte $00 ; |        | $3690
       .byte $16 ; |   X XX | $3691
       .byte $00 ; |        | $3692
       .byte $13 ; |   X  XX| $3693
       .byte $00 ; |        | $3694
       .byte $11 ; |   X   X| $3695
       .byte $00 ; |        | $3696
       .byte $0E ; |    XXX | $3697
       .byte $00 ; |        | $3698
       .byte $0F ; |    XXXX| $3699
       .byte $00 ; |        | $369A
       .byte $0F ; |    XXXX| $369B
       .byte $00 ; |        | $369C
       .byte $11 ; |   X   X| $369D
       .byte $00 ; |        | $369E
       .byte $0F ; |    XXXX| $369F
       .byte $00 ; |        | $36A0
       .byte $13 ; |   X  XX| $36A1
       .byte $00 ; |        | $36A2
       .byte $FF ; |XXXXXXXX| $36A3
       .byte $1A ; |   XX X | $36A4
       .byte $00 ; |        | $36A5
       .byte $11 ; |   X   X| $36A6
       .byte $00 ; |        | $36A7
       .byte $11 ; |   X   X| $36A8
       .byte $00 ; |        | $36A9
       .byte $14 ; |   X X  | $36AA
       .byte $00 ; |        | $36AB
       .byte $1A ; |   XX X | $36AC
       .byte $00 ; |        | $36AD
       .byte $1A ; |   XX X | $36AE
       .byte $00 ; |        | $36AF
       .byte $11 ; |   X   X| $36B0
       .byte $00 ; |        | $36B1
       .byte $11 ; |   X   X| $36B2
       .byte $00 ; |        | $36B3
       .byte $14 ; |   X X  | $36B4
       .byte $00 ; |        | $36B5
       .byte $1A ; |   XX X | $36B6
       .byte $00 ; |        | $36B7
       .byte $17 ; |   X XXX| $36B8
       .byte $00 ; |        | $36B9
       .byte $11 ; |   X   X| $36BA
       .byte $00 ; |        | $36BB
       .byte $11 ; |   X   X| $36BC
       .byte $00 ; |        | $36BD
       .byte $11 ; |   X   X| $36BE
       .byte $00 ; |        | $36BF
       .byte $1B ; |   XX XX| $36C0
       .byte $00 ; |        | $36C1
       .byte $1A ; |   XX X | $36C2
       .byte $FF ; |XXXXXXXX| $36C3
       .byte $0F ; |    XXXX| $36C4
       .byte $11 ; |   X   X| $36C5
       .byte $13 ; |   X  XX| $36C6
       .byte $16 ; |   X XX | $36C7
       .byte $17 ; |   X XXX| $36C8
       .byte $1A ; |   XX X | $36C9
       .byte $1D ; |   XXX X| $36CA
       .byte $00 ; |        | $36CB
       .byte $13 ; |   X  XX| $36CC
       .byte $00 ; |        | $36CD
       .byte $0E ; |    XXX | $36CE
       .byte $FF ; |XXXXXXXX| $36CF
L36D0: .byte $C7 ; |XX   XXX| $36D0
       .byte $03 ; |      XX| $36D1
       .byte $C7 ; |XX   XXX| $36D2
       .byte $03 ; |      XX| $36D3
       .byte $C7 ; |XX   XXX| $36D4
       .byte $03 ; |      XX| $36D5
       .byte $C7 ; |XX   XXX| $36D6
       .byte $03 ; |      XX| $36D7
       .byte $C7 ; |XX   XXX| $36D8
       .byte $03 ; |      XX| $36D9
       .byte $C7 ; |XX   XXX| $36DA
       .byte $03 ; |      XX| $36DB
       .byte $C7 ; |XX   XXX| $36DC
       .byte $03 ; |      XX| $36DD
       .byte $C7 ; |XX   XXX| $36DE
       .byte $03 ; |      XX| $36DF
       .byte $C7 ; |XX   XXX| $36E0
       .byte $03 ; |      XX| $36E1
       .byte $C7 ; |XX   XXX| $36E2
       .byte $03 ; |      XX| $36E3
       .byte $C7 ; |XX   XXX| $36E4
       .byte $03 ; |      XX| $36E5
       .byte $C7 ; |XX   XXX| $36E6
       .byte $03 ; |      XX| $36E7
       .byte $D4 ; |XX X X  | $36E8
       .byte $14 ; |   X X  | $36E9
       .byte $C7 ; |XX   XXX| $36EA
       .byte $03 ; |      XX| $36EB
       .byte $C7 ; |XX   XXX| $36EC
       .byte $03 ; |      XX| $36ED
       .byte $C7 ; |XX   XXX| $36EE
       .byte $03 ; |      XX| $36EF
       .byte $C7 ; |XX   XXX| $36F0
       .byte $03 ; |      XX| $36F1
       .byte $CA ; |XX  X X | $36F2
       .byte $0A ; |    X X | $36F3
       .byte $CA ; |XX  X X | $36F4
       .byte $0A ; |    X X | $36F5
       .byte $C7 ; |XX   XXX| $36F6
       .byte $03 ; |      XX| $36F7
       .byte $C7 ; |XX   XXX| $36F8
       .byte $03 ; |      XX| $36F9
       .byte $C7 ; |XX   XXX| $36FA
       .byte $03 ; |      XX| $36FB
       .byte $C7 ; |XX   XXX| $36FC
       .byte $03 ; |      XX| $36FD
       .byte $D4 ; |XX X X  | $36FE
       .byte $14 ; |   X X  | $36FF
       .byte $FF ; |XXXXXXXX| $3700
       .byte $CC ; |XX  XX  | $3701
       .byte $0C ; |    XX  | $3702
       .byte $C9 ; |XX  X  X| $3703
       .byte $03 ; |      XX| $3704
       .byte $C9 ; |XX  X  X| $3705
       .byte $03 ; |      XX| $3706
       .byte $CC ; |XX  XX  | $3707
       .byte $0C ; |    XX  | $3708
       .byte $CC ; |XX  XX  | $3709
       .byte $0C ; |    XX  | $370A
       .byte $CC ; |XX  XX  | $370B
       .byte $0C ; |    XX  | $370C
       .byte $C9 ; |XX  X  X| $370D
       .byte $03 ; |      XX| $370E
       .byte $C9 ; |XX  X  X| $370F
       .byte $03 ; |      XX| $3710
       .byte $CC ; |XX  XX  | $3711
       .byte $0C ; |    XX  | $3712
       .byte $CC ; |XX  XX  | $3713
       .byte $0C ; |    XX  | $3714
       .byte $CC ; |XX  XX  | $3715
       .byte $0C ; |    XX  | $3716
       .byte $C9 ; |XX  X  X| $3717
       .byte $03 ; |      XX| $3718
       .byte $C9 ; |XX  X  X| $3719
       .byte $03 ; |      XX| $371A
       .byte $D8 ; |XX XX   | $371B
       .byte $30 ; |  XX    | $371C
       .byte $CC ; |XX  XX  | $371D
       .byte $0C ; |    XX  | $371E
       .byte $CC ; |XX  XX  | $371F
       .byte $FF ; |XXXXXXXX| $3720
       .byte $C6 ; |XX   XX | $3721
       .byte $C6 ; |XX   XX | $3722
       .byte $C6 ; |XX   XX | $3723
       .byte $C6 ; |XX   XX | $3724
       .byte $C6 ; |XX   XX | $3725
       .byte $C6 ; |XX   XX | $3726
       .byte $C6 ; |XX   XX | $3727
       .byte $06 ; |     XX | $3728
       .byte $C6 ; |XX   XX | $3729
       .byte $06 ; |     XX | $372A
       .byte $C6 ; |XX   XX | $372B
       .byte $FF ; |XXXXXXXX| $372C
L372D: .byte $93 ; |X  X  XX| $372D
       .byte $80 ; |X       | $372E
       .byte $8F ; |X   XXXX| $372F
       .byte $80 ; |X       | $3730
       .byte $9A ; |X  XX X | $3731
       .byte $80 ; |X       | $3732
       .byte $93 ; |X  X  XX| $3733
       .byte $80 ; |X       | $3734
       .byte $8F ; |X   XXXX| $3735
       .byte $80 ; |X       | $3736
       .byte $91 ; |X  X   X| $3737
       .byte $80 ; |X       | $3738
       .byte $8E ; |X   XXX | $3739
       .byte $80 ; |X       | $373A
       .byte $9A ; |X  XX X | $373B
       .byte $80 ; |X       | $373C
       .byte $93 ; |X  X  XX| $373D
       .byte $80 ; |X       | $373E
       .byte $8F ; |X   XXXX| $373F
       .byte $80 ; |X       | $3740
       .byte $94 ; |X  X X  | $3741
       .byte $80 ; |X       | $3742
       .byte $91 ; |X  X   X| $3743
       .byte $80 ; |X       | $3744
       .byte $8E ; |X   XXX | $3745
       .byte $80 ; |X       | $3746
       .byte $8B ; |X   X XX| $3747
       .byte $80 ; |X       | $3748
       .byte $8C ; |X   XX  | $3749
       .byte $80 ; |X       | $374A
       .byte $8E ; |X   XXX | $374B
       .byte $80 ; |X       | $374C
       .byte $8F ; |X   XXXX| $374D
       .byte $80 ; |X       | $374E
       .byte $91 ; |X  X   X| $374F
       .byte $80 ; |X       | $3750
       .byte $94 ; |X  X X  | $3751
       .byte $80 ; |X       | $3752
       .byte $91 ; |X  X   X| $3753
       .byte $80 ; |X       | $3754
       .byte $8C ; |X   XX  | $3755
       .byte $80 ; |X       | $3756
       .byte $8E ; |X   XXX | $3757
       .byte $80 ; |X       | $3758
       .byte $8F ; |X   XXXX| $3759
       .byte $80 ; |X       | $375A
       .byte $91 ; |X  X   X| $375B
       .byte $80 ; |X       | $375C
       .byte $FF ; |XXXXXXXX| $375D
       .byte $8D ; |X   XX X| $375E
       .byte $80 ; |X       | $375F
       .byte $8B ; |X   X XX| $3760
       .byte $80 ; |X       | $3761
       .byte $8D ; |X   XX X| $3762
       .byte $80 ; |X       | $3763
       .byte $8B ; |X   X XX| $3764
       .byte $80 ; |X       | $3765
       .byte $8D ; |X   XX X| $3766
       .byte $80 ; |X       | $3767
       .byte $8B ; |X   X XX| $3768
       .byte $80 ; |X       | $3769
       .byte $8D ; |X   XX X| $376A
       .byte $80 ; |X       | $376B
       .byte $8B ; |X   X XX| $376C
       .byte $80 ; |X       | $376D
       .byte $8F ; |X   XXXX| $376E
       .byte $80 ; |X       | $376F
       .byte $8B ; |X   X XX| $3770
       .byte $80 ; |X       | $3771
       .byte $8B ; |X   X XX| $3772
       .byte $80 ; |X       | $3773
       .byte $97 ; |X  X XXX| $3774
       .byte $80 ; |X       | $3775
       .byte $97 ; |X  X XXX| $3776
       .byte $80 ; |X       | $3777
       .byte $97 ; |X  X XXX| $3778
       .byte $80 ; |X       | $3779
       .byte $97 ; |X  X XXX| $377A
       .byte $80 ; |X       | $377B
       .byte $91 ; |X  X   X| $377C
       .byte $FF ; |XXXXXXXX| $377D
       .byte $0F ; |    XXXX| $377E
       .byte $11 ; |   X   X| $377F
       .byte $13 ; |   X  XX| $3780
       .byte $16 ; |   X XX | $3781
       .byte $17 ; |   X XXX| $3782
       .byte $1A ; |   XX X | $3783
       .byte $1D ; |   XXX X| $3784
       .byte $00 ; |        | $3785
       .byte $13 ; |   X  XX| $3786
       .byte $00 ; |        | $3787
       .byte $0E ; |    XXX | $3788
       .byte $FF ; |XXXXXXXX| $3789
L378A: .byte $07 ; |     XXX| $378A
       .byte $03 ; |      XX| $378B
       .byte $0A ; |    X X | $378C
       .byte $0A ; |    X X | $378D
       .byte $07 ; |     XXX| $378E
       .byte $03 ; |      XX| $378F
       .byte $0A ; |    X X | $3790
       .byte $0A ; |    X X | $3791
       .byte $0A ; |    X X | $3792
       .byte $0A ; |    X X | $3793
       .byte $07 ; |     XXX| $3794
       .byte $03 ; |      XX| $3795
       .byte $0A ; |    X X | $3796
       .byte $0A ; |    X X | $3797
       .byte $07 ; |     XXX| $3798
       .byte $03 ; |      XX| $3799
       .byte $0A ; |    X X | $379A
       .byte $0A ; |    X X | $379B
       .byte $0A ; |    X X | $379C
       .byte $0A ; |    X X | $379D
       .byte $07 ; |     XXX| $379E
       .byte $03 ; |      XX| $379F
       .byte $0A ; |    X X | $37A0
       .byte $0A ; |    X X | $37A1
       .byte $07 ; |     XXX| $37A2
       .byte $03 ; |      XX| $37A3
       .byte $07 ; |     XXX| $37A4
       .byte $03 ; |      XX| $37A5
       .byte $07 ; |     XXX| $37A6
       .byte $03 ; |      XX| $37A7
       .byte $07 ; |     XXX| $37A8
       .byte $03 ; |      XX| $37A9
       .byte $07 ; |     XXX| $37AA
       .byte $03 ; |      XX| $37AB
       .byte $07 ; |     XXX| $37AC
       .byte $03 ; |      XX| $37AD
       .byte $0A ; |    X X | $37AE
       .byte $0A ; |    X X | $37AF
       .byte $07 ; |     XXX| $37B0
       .byte $03 ; |      XX| $37B1
       .byte $07 ; |     XXX| $37B2
       .byte $03 ; |      XX| $37B3
       .byte $07 ; |     XXX| $37B4
       .byte $03 ; |      XX| $37B5
       .byte $07 ; |     XXX| $37B6
       .byte $03 ; |      XX| $37B7
       .byte $07 ; |     XXX| $37B8
       .byte $03 ; |      XX| $37B9
       .byte $FF ; |XXXXXXXX| $37BA
       .byte $8C ; |X   XX  | $37BB
       .byte $0C ; |    XX  | $37BC
       .byte $8C ; |X   XX  | $37BD
       .byte $0C ; |    XX  | $37BE
       .byte $8C ; |X   XX  | $37BF
       .byte $0C ; |    XX  | $37C0
       .byte $8C ; |X   XX  | $37C1
       .byte $0C ; |    XX  | $37C2
       .byte $8C ; |X   XX  | $37C3
       .byte $0C ; |    XX  | $37C4
       .byte $8C ; |X   XX  | $37C5
       .byte $0C ; |    XX  | $37C6
       .byte $8C ; |X   XX  | $37C7
       .byte $0C ; |    XX  | $37C8
       .byte $8C ; |X   XX  | $37C9
       .byte $0C ; |    XX  | $37CA
       .byte $8C ; |X   XX  | $37CB
       .byte $0C ; |    XX  | $37CC
       .byte $8C ; |X   XX  | $37CD
       .byte $0C ; |    XX  | $37CE
       .byte $8C ; |X   XX  | $37CF
       .byte $0C ; |    XX  | $37D0
       .byte $89 ; |X   X  X| $37D1
       .byte $03 ; |      XX| $37D2
       .byte $89 ; |X   X  X| $37D3
       .byte $03 ; |      XX| $37D4
       .byte $8C ; |X   XX  | $37D5
       .byte $0C ; |    XX  | $37D6
       .byte $8C ; |X   XX  | $37D7
       .byte $0C ; |    XX  | $37D8
       .byte $8C ; |X   XX  | $37D9
       .byte $FF ; |XXXXXXXX| $37DA
       .byte $06 ; |     XX | $37DB
       .byte $06 ; |     XX | $37DC
       .byte $06 ; |     XX | $37DD
       .byte $06 ; |     XX | $37DE
       .byte $06 ; |     XX | $37DF
       .byte $06 ; |     XX | $37E0
       .byte $06 ; |     XX | $37E1
       .byte $06 ; |     XX | $37E2
       .byte $06 ; |     XX | $37E3
       .byte $06 ; |     XX | $37E4
       .byte $06 ; |     XX | $37E5
       .byte $FF ; |XXXXXXXX| $37E6
L37E7: .byte $00 ; |        | $37E7
       .byte $0A ; |    X X | $37E8
       .byte $0B ; |    X XX| $37E9
       .byte $0C ; |    XX  | $37EA
L37EB: .byte $88 ; |X   X   | $37EB
L37EC: .byte $F5 ; |XXXX X X| $37EC
       .byte $87 ; |X    XXX| $37ED
       .byte $FA ; |XXXXX X | $37EE
       .byte $88 ; |X   X   | $37EF
       .byte $F1 ; |XXXX   X| $37F0
       .byte $00 ; |        | $37F1
       .byte $00 ; |        | $37F2
       .byte $48 ; | X  X   | $37F3
       .byte $7B ; | XXXX XX| $37F4
       .byte $44 ; | X   X  | $37F5
       .byte $7B ; | XXXX XX| $37F6
       .byte $00 ; |        | $37F7
       .byte $00 ; |        | $37F8
       .byte $48 ; | X  X   | $37F9
       .byte $73 ; | XXX  XX| $37FA
       .byte $44 ; | X   X  | $37FB
       .byte $73 ; | XXX  XX| $37FC
       .byte $00 ; |        | $37FD
       .byte $00 ; |        | $37FE
       .byte $49 ; | X  X  X| $37FF
       .byte $63 ; | XX   XX| $3800
       .byte $49 ; | X  X  X| $3801
       .byte $EA ; |XXX X X | $3802
       .byte $49 ; | X  X  X| $3803
       .byte $E7 ; |XXX  XXX| $3804
       .byte $00 ; |        | $3805
       .byte $00 ; |        | $3806
       .byte $4B ; | X  X XX| $3807
       .byte $7D ; | XXXXX X| $3808
       .byte $4B ; | X  X XX| $3809
       .byte $6E ; | XX XXX | $380A
       .byte $4B ; | X  X XX| $380B
       .byte $7D ; | XXXXX X| $380C
       .byte $4B ; | X  X XX| $380D
       .byte $6E ; | XX XXX | $380E
       .byte $4B ; | X  X XX| $380F
       .byte $7D ; | XXXXX X| $3810
       .byte $4B ; | X  X XX| $3811
       .byte $7D ; | XXXXX X| $3812
       .byte $00 ; |        | $3813
       .byte $4B ; | X  X XX| $3814
       .byte $7A ; | XXXX X | $3815
       .byte $4B ; | X  X XX| $3816
       .byte $6C ; | XX XX  | $3817
       .byte $4B ; | X  X XX| $3818
       .byte $7A ; | XXXX X | $3819
       .byte $4B ; | X  X XX| $381A
       .byte $6C ; | XX XX  | $381B
       .byte $4B ; | X  X XX| $381C
       .byte $7A ; | XXXX X | $381D
       .byte $4B ; | X  X XX| $381E
       .byte $6C ; | XX XX  | $381F
       .byte $00 ; |        | $3820
       .byte $4B ; | X  X XX| $3821
       .byte $77 ; | XXX XXX| $3822
       .byte $4B ; | X  X XX| $3823
       .byte $6B ; | XX X XX| $3824
       .byte $4B ; | X  X XX| $3825
       .byte $77 ; | XXX XXX| $3826
       .byte $4B ; | X  X XX| $3827
       .byte $6B ; | XX X XX| $3828
       .byte $4B ; | X  X XX| $3829
       .byte $77 ; | XXX XXX| $382A
       .byte $4B ; | X  X XX| $382B
       .byte $6B ; | XX X XX| $382C
       .byte $00 ; |        | $382D
       .byte $4B ; | X  X XX| $382E
       .byte $75 ; | XXX X X| $382F
       .byte $4B ; | X  X XX| $3830
       .byte $6A ; | XX X X | $3831
       .byte $4B ; | X  X XX| $3832
       .byte $75 ; | XXX X X| $3833
       .byte $4B ; | X  X XX| $3834
       .byte $6A ; | XX X X | $3835
       .byte $4B ; | X  X XX| $3836
       .byte $75 ; | XXX X X| $3837
       .byte $4B ; | X  X XX| $3838
       .byte $6A ; | XX X X | $3839
       .byte $00 ; |        | $383A
       .byte $4B ; | X  X XX| $383B
       .byte $73 ; | XXX  XX| $383C
       .byte $4B ; | X  X XX| $383D
       .byte $69 ; | XX X  X| $383E
       .byte $4B ; | X  X XX| $383F
       .byte $73 ; | XXX  XX| $3840
       .byte $4B ; | X  X XX| $3841
       .byte $69 ; | XX X  X| $3842
       .byte $4B ; | X  X XX| $3843
       .byte $73 ; | XXX  XX| $3844
       .byte $4B ; | X  X XX| $3845
       .byte $69 ; | XX X  X| $3846
       .byte $00 ; |        | $3847
       .byte $4B ; | X  X XX| $3848
       .byte $71 ; | XXX   X| $3849
       .byte $4B ; | X  X XX| $384A
       .byte $68 ; | XX X   | $384B
       .byte $4B ; | X  X XX| $384C
       .byte $71 ; | XXX   X| $384D
       .byte $4B ; | X  X XX| $384E
       .byte $68 ; | XX X   | $384F
       .byte $4B ; | X  X XX| $3850
       .byte $71 ; | XXX   X| $3851
       .byte $4B ; | X  X XX| $3852
       .byte $68 ; | XX X   | $3853
       .byte $00 ; |        | $3854
       .byte $FF ; |XXXXXXXX| $3855
       .byte $01 ; |       X| $3856
       .byte $01 ; |       X| $3857
       .byte $FF ; |XXXXXXXX| $3858
       .byte $FF ; |XXXXXXXX| $3859
       .byte $01 ; |       X| $385A
       .byte $01 ; |       X| $385B
       .byte $FF ; |XXXXXXXX| $385C
       .byte $FF ; |XXXXXXXX| $385D
       .byte $01 ; |       X| $385E
       .byte $01 ; |       X| $385F
       .byte $FF ; |XXXXXXXX| $3860
       .byte $FF ; |XXXXXXXX| $3861
       .byte $01 ; |       X| $3862
       .byte $01 ; |       X| $3863
       .byte $01 ; |       X| $3864
       .byte $FF ; |XXXXXXXX| $3865
       .byte $01 ; |       X| $3866
       .byte $01 ; |       X| $3867
       .byte $FF ; |XXXXXXXX| $3868
       .byte $FF ; |XXXXXXXX| $3869
       .byte $01 ; |       X| $386A
       .byte $01 ; |       X| $386B
       .byte $FF ; |XXXXXXXX| $386C
       .byte $FF ; |XXXXXXXX| $386D
       .byte $01 ; |       X| $386E
       .byte $01 ; |       X| $386F
       .byte $FF ; |XXXXXXXX| $3870
       .byte $FF ; |XXXXXXXX| $3871
       .byte $01 ; |       X| $3872
       .byte $01 ; |       X| $3873
       .byte $01 ; |       X| $3874
       .byte $FF ; |XXXXXXXX| $3875
       .byte $01 ; |       X| $3876
       .byte $01 ; |       X| $3877
       .byte $FF ; |XXXXXXXX| $3878
       .byte $FF ; |XXXXXXXX| $3879
       .byte $01 ; |       X| $387A
       .byte $01 ; |       X| $387B
       .byte $FF ; |XXXXXXXX| $387C
       .byte $FF ; |XXXXXXXX| $387D
       .byte $01 ; |       X| $387E
       .byte $01 ; |       X| $387F
       .byte $FF ; |XXXXXXXX| $3880
       .byte $FF ; |XXXXXXXX| $3881
       .byte $01 ; |       X| $3882
       .byte $01 ; |       X| $3883
       .byte $FF ; |XXXXXXXX| $3884
       .byte $FF ; |XXXXXXXX| $3885
       .byte $01 ; |       X| $3886
       .byte $01 ; |       X| $3887
       .byte $FF ; |XXXXXXXX| $3888
       .byte $FF ; |XXXXXXXX| $3889
       .byte $01 ; |       X| $388A
       .byte $01 ; |       X| $388B
       .byte $FF ; |XXXXXXXX| $388C
       .byte $FF ; |XXXXXXXX| $388D
       .byte $01 ; |       X| $388E
       .byte $01 ; |       X| $388F
       .byte $00 ; |        | $3890
       .byte $1C ; |   XXX  | $3891
       .byte $22 ; |  X   X | $3892
       .byte $63 ; | XX   XX| $3893
       .byte $63 ; | XX   XX| $3894
       .byte $63 ; | XX   XX| $3895
       .byte $22 ; |  X   X | $3896
       .byte $1C ; |   XXX  | $3897
       .byte $00 ; |        | $3898
       .byte $7F ; | XXXXXXX| $3899
       .byte $0C ; |    XX  | $389A
       .byte $0C ; |    XX  | $389B
       .byte $0C ; |    XX  | $389C
       .byte $1C ; |   XXX  | $389D
       .byte $0C ; |    XX  | $389E
       .byte $04 ; |     X  | $389F
       .byte $00 ; |        | $38A0
       .byte $7F ; | XXXXXXX| $38A1
       .byte $60 ; | XX     | $38A2
       .byte $60 ; | XX     | $38A3
       .byte $3E ; |  XXXXX | $38A4
       .byte $03 ; |      XX| $38A5
       .byte $03 ; |      XX| $38A6
       .byte $3E ; |  XXXXX | $38A7
       .byte $00 ; |        | $38A8
       .byte $7E ; | XXXXXX | $38A9
       .byte $03 ; |      XX| $38AA
       .byte $03 ; |      XX| $38AB
       .byte $3E ; |  XXXXX | $38AC
       .byte $03 ; |      XX| $38AD
       .byte $03 ; |      XX| $38AE
       .byte $7E ; | XXXXXX | $38AF
       .byte $00 ; |        | $38B0
       .byte $06 ; |     XX | $38B1
       .byte $7F ; | XXXXXXX| $38B2
       .byte $26 ; |  X  XX | $38B3
       .byte $16 ; |   X XX | $38B4
       .byte $0E ; |    XXX | $38B5
       .byte $06 ; |     XX | $38B6
       .byte $02 ; |      X | $38B7
       .byte $00 ; |        | $38B8
       .byte $7E ; | XXXXXX | $38B9
       .byte $03 ; |      XX| $38BA
       .byte $03 ; |      XX| $38BB
       .byte $3E ; |  XXXXX | $38BC
       .byte $60 ; | XX     | $38BD
       .byte $60 ; | XX     | $38BE
       .byte $7E ; | XXXXXX | $38BF
       .byte $00 ; |        | $38C0
       .byte $3E ; |  XXXXX | $38C1
       .byte $63 ; | XX   XX| $38C2
       .byte $63 ; | XX   XX| $38C3
       .byte $7E ; | XXXXXX | $38C4
       .byte $60 ; | XX     | $38C5
       .byte $60 ; | XX     | $38C6
       .byte $3E ; |  XXXXX | $38C7
       .byte $00 ; |        | $38C8
       .byte $30 ; |  XX    | $38C9
       .byte $18 ; |   XX   | $38CA
       .byte $0C ; |    XX  | $38CB
       .byte $06 ; |     XX | $38CC
       .byte $03 ; |      XX| $38CD
       .byte $61 ; | XX    X| $38CE
       .byte $7F ; | XXXXXXX| $38CF
       .byte $00 ; |        | $38D0
       .byte $3E ; |  XXXXX | $38D1
       .byte $63 ; | XX   XX| $38D2
       .byte $63 ; | XX   XX| $38D3
       .byte $3E ; |  XXXXX | $38D4
       .byte $63 ; | XX   XX| $38D5
       .byte $63 ; | XX   XX| $38D6
       .byte $3E ; |  XXXXX | $38D7
       .byte $00 ; |        | $38D8
       .byte $3E ; |  XXXXX | $38D9
       .byte $03 ; |      XX| $38DA
       .byte $03 ; |      XX| $38DB
       .byte $3F ; |  XXXXXX| $38DC
       .byte $63 ; | XX   XX| $38DD
       .byte $63 ; | XX   XX| $38DE
       .byte $3E ; |  XXXXX | $38DF
       .byte $00 ; |        | $38E0
       .byte $00 ; |        | $38E1
       .byte $00 ; |        | $38E2
       .byte $00 ; |        | $38E3
       .byte $00 ; |        | $38E4
       .byte $00 ; |        | $38E5
       .byte $00 ; |        | $38E6
       .byte $00 ; |        | $38E7
L38E8: .byte $90 ; |X  X    | $38E8
L38E9: .byte $98 ; |X  XX   | $38E9
       .byte $A0 ; |X X     | $38EA
       .byte $A8 ; |X X X   | $38EB
       .byte $B0 ; |X XX    | $38EC
       .byte $B8 ; |X XXX   | $38ED
       .byte $C0 ; |XX      | $38EE
       .byte $C8 ; |XX  X   | $38EF
       .byte $D0 ; |XX X    | $38F0
       .byte $D8 ; |XX XX   | $38F1
       .byte $01 ; |       X| $38F2
       .byte $01 ; |       X| $38F3
       .byte $FF ; |XXXXXXXX| $38F4
       .byte $FF ; |XXXXXXXX| $38F5
       .byte $01 ; |       X| $38F6
       .byte $01 ; |       X| $38F7
       .byte $FF ; |XXXXXXXX| $38F8
       .byte $FF ; |XXXXXXXX| $38F9
       .byte $01 ; |       X| $38FA
       .byte $01 ; |       X| $38FB
       .byte $FF ; |XXXXXXXX| $38FC
       .byte $FF ; |XXXXXXXX| $38FD
       .byte $01 ; |       X| $38FE
       .byte $01 ; |       X| $38FF
       .byte $00 ; |        | $3900
       .byte $00 ; |        | $3901
       .byte $00 ; |        | $3902
       .byte $00 ; |        | $3903
       .byte $42 ; | X    X | $3904
       .byte $E7 ; |XXX  XXX| $3905
       .byte $EF ; |XXX XXXX| $3906
       .byte $E7 ; |XXX  XXX| $3907
       .byte $42 ; | X    X | $3908
       .byte $24 ; |  X  X  | $3909
       .byte $14 ; |   X X  | $390A
       .byte $0C ; |    XX  | $390B
       .byte $04 ; |     X  | $390C
       .byte $00 ; |        | $390D
       .byte $00 ; |        | $390E
       .byte $00 ; |        | $390F
       .byte $00 ; |        | $3910
       .byte $00 ; |        | $3911
       .byte $00 ; |        | $3912
       .byte $00 ; |        | $3913
       .byte $00 ; |        | $3914
       .byte $00 ; |        | $3915
       .byte $00 ; |        | $3916
       .byte $00 ; |        | $3917
       .byte $00 ; |        | $3918
       .byte $00 ; |        | $3919
       .byte $00 ; |        | $391A
       .byte $00 ; |        | $391B
       .byte $00 ; |        | $391C
       .byte $00 ; |        | $391D
       .byte $00 ; |        | $391E
       .byte $00 ; |        | $391F
       .byte $00 ; |        | $3920
       .byte $00 ; |        | $3921
       .byte $00 ; |        | $3922
       .byte $C0 ; |XX      | $3923
       .byte $44 ; | X   X  | $3924
       .byte $4C ; | X  XX  | $3925
       .byte $30 ; |  XX    | $3926
       .byte $38 ; |  XXX   | $3927
       .byte $78 ; | XXXX   | $3928
       .byte $F8 ; |XXXXX   | $3929
       .byte $F8 ; |XXXXX   | $392A
       .byte $30 ; |  XX    | $392B
       .byte $70 ; | XXX    | $392C
       .byte $58 ; | X XX   | $392D
       .byte $5D ; | X XXX X| $392E
       .byte $7E ; | XXXXXX | $392F
       .byte $38 ; |  XXX   | $3930
       .byte $10 ; |   X    | $3931
       .byte $00 ; |        | $3932
       .byte $00 ; |        | $3933
       .byte $00 ; |        | $3934
       .byte $00 ; |        | $3935
       .byte $00 ; |        | $3936
       .byte $00 ; |        | $3937
       .byte $00 ; |        | $3938
       .byte $00 ; |        | $3939
       .byte $00 ; |        | $393A
       .byte $00 ; |        | $393B
       .byte $00 ; |        | $393C
       .byte $00 ; |        | $393D
       .byte $00 ; |        | $393E
       .byte $00 ; |        | $393F
       .byte $00 ; |        | $3940
       .byte $00 ; |        | $3941
       .byte $00 ; |        | $3942
       .byte $00 ; |        | $3943
       .byte $00 ; |        | $3944
       .byte $68 ; | XX X   | $3945
       .byte $38 ; |  XXX   | $3946
       .byte $30 ; |  XX    | $3947
       .byte $30 ; |  XX    | $3948
       .byte $38 ; |  XXX   | $3949
       .byte $78 ; | XXXX   | $394A
       .byte $F8 ; |XXXXX   | $394B
       .byte $F8 ; |XXXXX   | $394C
       .byte $30 ; |  XX    | $394D
       .byte $70 ; | XXX    | $394E
       .byte $58 ; | X XX   | $394F
       .byte $5C ; | X XXX  | $3950
       .byte $7E ; | XXXXXX | $3951
       .byte $39 ; |  XXX  X| $3952
       .byte $10 ; |   X    | $3953
       .byte $00 ; |        | $3954
       .byte $00 ; |        | $3955
       .byte $00 ; |        | $3956
       .byte $00 ; |        | $3957
       .byte $00 ; |        | $3958
       .byte $00 ; |        | $3959
       .byte $00 ; |        | $395A
       .byte $00 ; |        | $395B
       .byte $00 ; |        | $395C
       .byte $00 ; |        | $395D
       .byte $00 ; |        | $395E
       .byte $00 ; |        | $395F
       .byte $00 ; |        | $3960
       .byte $00 ; |        | $3961
       .byte $00 ; |        | $3962
       .byte $00 ; |        | $3963
       .byte $00 ; |        | $3964
       .byte $00 ; |        | $3965
       .byte $00 ; |        | $3966
       .byte $03 ; |      XX| $3967
       .byte $22 ; |  X   X | $3968
       .byte $32 ; |  XX  X | $3969
       .byte $0C ; |    XX  | $396A
       .byte $1C ; |   XXX  | $396B
       .byte $1E ; |   XXXX | $396C
       .byte $1F ; |   XXXXX| $396D
       .byte $1F ; |   XXXXX| $396E
       .byte $0C ; |    XX  | $396F
       .byte $0E ; |    XXX | $3970
       .byte $1A ; |   XX X | $3971
       .byte $BA ; |X XXX X | $3972
       .byte $7E ; | XXXXXX | $3973
       .byte $1C ; |   XXX  | $3974
       .byte $08 ; |    X   | $3975
       .byte $00 ; |        | $3976
       .byte $00 ; |        | $3977
       .byte $00 ; |        | $3978
       .byte $00 ; |        | $3979
       .byte $00 ; |        | $397A
       .byte $00 ; |        | $397B
       .byte $00 ; |        | $397C
       .byte $00 ; |        | $397D
       .byte $00 ; |        | $397E
       .byte $00 ; |        | $397F
       .byte $00 ; |        | $3980
       .byte $00 ; |        | $3981
       .byte $00 ; |        | $3982
       .byte $00 ; |        | $3983
       .byte $00 ; |        | $3984
       .byte $00 ; |        | $3985
       .byte $00 ; |        | $3986
       .byte $00 ; |        | $3987
       .byte $00 ; |        | $3988
       .byte $16 ; |   X XX | $3989
       .byte $1C ; |   XXX  | $398A
       .byte $0C ; |    XX  | $398B
       .byte $0C ; |    XX  | $398C
       .byte $1C ; |   XXX  | $398D
       .byte $1E ; |   XXXX | $398E
       .byte $1F ; |   XXXXX| $398F
       .byte $1F ; |   XXXXX| $3990
       .byte $0C ; |    XX  | $3991
       .byte $0E ; |    XXX | $3992
       .byte $1A ; |   XX X | $3993
       .byte $3A ; |  XXX X | $3994
       .byte $7E ; | XXXXXX | $3995
       .byte $9C ; |X  XXX  | $3996
       .byte $08 ; |    X   | $3997
       .byte $00 ; |        | $3998
       .byte $00 ; |        | $3999
       .byte $00 ; |        | $399A
       .byte $00 ; |        | $399B
       .byte $00 ; |        | $399C
       .byte $00 ; |        | $399D
       .byte $00 ; |        | $399E
       .byte $00 ; |        | $399F
       .byte $00 ; |        | $39A0
       .byte $00 ; |        | $39A1
       .byte $00 ; |        | $39A2
       .byte $00 ; |        | $39A3
       .byte $00 ; |        | $39A4
       .byte $00 ; |        | $39A5
       .byte $00 ; |        | $39A6
       .byte $00 ; |        | $39A7
       .byte $00 ; |        | $39A8
       .byte $00 ; |        | $39A9
       .byte $70 ; | XXX    | $39AA
       .byte $80 ; |X       | $39AB
       .byte $78 ; | XXXX   | $39AC
       .byte $30 ; |  XX    | $39AD
       .byte $70 ; | XXX    | $39AE
       .byte $80 ; |X       | $39AF
       .byte $88 ; |X   X   | $39B0
       .byte $90 ; |X  X    | $39B1
       .byte $98 ; |X  XX   | $39B2
       .byte $A0 ; |X X     | $39B3
       .byte $A8 ; |X X X   | $39B4
       .byte $B0 ; |X XX    | $39B5
       .byte $B8 ; |X XXX   | $39B6
       .byte $00 ; |        | $39B7
       .byte $18 ; |   XX   | $39B8
       .byte $20 ; |  X     | $39B9
       .byte $28 ; |  X X   | $39BA
       .byte $B8 ; |X XXX   | $39BB
       .byte $B8 ; |X XXX   | $39BC
       .byte $B8 ; |X XXX   | $39BD
       .byte $B8 ; |X XXX   | $39BE
       .byte $B8 ; |X XXX   | $39BF
       .byte $B8 ; |X XXX   | $39C0
       .byte $B8 ; |X XXX   | $39C1
       .byte $B8 ; |X XXX   | $39C2
       .byte $B8 ; |X XXX   | $39C3
       .byte $C2 ; |XX    X | $39C4
       .byte $60 ; | XX     | $39C5
       .byte $00 ; |        | $39C6
       .byte $30 ; |  XX    | $39C7
       .byte $B8 ; |X XXX   | $39C8
       .byte $B8 ; |X XXX   | $39C9
       .byte $80 ; |X       | $39CA
       .byte $CB ; |XX  X XX| $39CB
       .byte $30 ; |  XX    | $39CC
       .byte $08 ; |    X   | $39CD
       .byte $B8 ; |X XXX   | $39CE
L39CF: .byte $B8 ; |X XXX   | $39CF
       .byte $30 ; |  XX    | $39D0
       .byte $40 ; | X      | $39D1
       .byte $50 ; | X X    | $39D2
       .byte $08 ; |    X   | $39D3
       .byte $60 ; | XX     | $39D4
L39D5: .byte $B8 ; |X XXX   | $39D5
       .byte $38 ; |  XXX   | $39D6
       .byte $48 ; | X  X   | $39D7
       .byte $58 ; | X XX   | $39D8
       .byte $10 ; |   X    | $39D9
       .byte $68 ; | XX X   | $39DA
L39DB: STA    $EF     ;3
       LDA    #$39    ;2
       STA    $F0     ;3
       STX    $F1     ;3
       LDY    #$05    ;2
       LDX    #$0B    ;2
L39E7: LDA    $F1     ;3
       STA    $F2,X   ;4
       DEX            ;2
       LDA    ($EF),Y ;5
       STA    $F2,X   ;4
       DEX            ;2
       DEY            ;2
       BPL    L39E7   ;2
       RTS            ;6

       .byte $FF ; |XXXXXXXX| $39F5
       .byte $01 ; |       X| $39F6
       .byte $01 ; |       X| $39F7
       .byte $FF ; |XXXXXXXX| $39F8
       .byte $FF ; |XXXXXXXX| $39F9
       .byte $01 ; |       X| $39FA
       .byte $01 ; |       X| $39FB
       .byte $FF ; |XXXXXXXX| $39FC
       .byte $FF ; |XXXXXXXX| $39FD
       .byte $01 ; |       X| $39FE
       .byte $01 ; |       X| $39FF
       .byte $00 ; |        | $3A00
       .byte $00 ; |        | $3A01
       .byte $24 ; |  X  X  | $3A02
       .byte $7E ; | XXXXXX | $3A03
       .byte $7E ; | XXXXXX | $3A04
       .byte $FF ; |XXXXXXXX| $3A05
       .byte $FF ; |XXXXXXXX| $3A06
       .byte $FF ; |XXXXXXXX| $3A07
       .byte $67 ; | XX  XXX| $3A08
       .byte $2A ; |  X X X | $3A09
       .byte $08 ; |    X   | $3A0A
       .byte $04 ; |     X  | $3A0B
       .byte $00 ; |        | $3A0C
       .byte $00 ; |        | $3A0D
       .byte $00 ; |        | $3A0E
       .byte $00 ; |        | $3A0F
       .byte $10 ; |   X    | $3A10
       .byte $36 ; |  XX XX | $3A11
       .byte $7F ; | XXXXXXX| $3A12
       .byte $FF ; |XXXXXXXX| $3A13
       .byte $FF ; |XXXXXXXX| $3A14
       .byte $FF ; |XXXXXXXX| $3A15
       .byte $67 ; | XX  XXX| $3A16
       .byte $2A ; |  X X X | $3A17
       .byte $08 ; |    X   | $3A18
       .byte $10 ; |   X    | $3A19
       .byte $00 ; |        | $3A1A
       .byte $00 ; |        | $3A1B
       .byte $00 ; |        | $3A1C
       .byte $00 ; |        | $3A1D
       .byte $08 ; |    X   | $3A1E
       .byte $6C ; | XX XX  | $3A1F
       .byte $FE ; |XXXXXXX | $3A20
       .byte $FF ; |XXXXXXXX| $3A21
       .byte $FF ; |XXXXXXXX| $3A22
       .byte $FF ; |XXXXXXXX| $3A23
       .byte $E6 ; |XXX  XX | $3A24
       .byte $54 ; | X X X  | $3A25
       .byte $10 ; |   X    | $3A26
       .byte $08 ; |    X   | $3A27
       .byte $00 ; |        | $3A28
       .byte $00 ; |        | $3A29
       .byte $00 ; |        | $3A2A
       .byte $00 ; |        | $3A2B
       .byte $18 ; |   XX   | $3A2C
       .byte $3C ; |  XXXX  | $3A2D
       .byte $E7 ; |XXX  XXX| $3A2E
       .byte $C3 ; |XX    XX| $3A2F
       .byte $C3 ; |XX    XX| $3A30
       .byte $81 ; |X      X| $3A31
       .byte $81 ; |X      X| $3A32
       .byte $00 ; |        | $3A33
       .byte $00 ; |        | $3A34
       .byte $00 ; |        | $3A35
       .byte $00 ; |        | $3A36
       .byte $00 ; |        | $3A37
       .byte $00 ; |        | $3A38
       .byte $00 ; |        | $3A39
       .byte $3C ; |  XXXX  | $3A3A
       .byte $E7 ; |XXX  XXX| $3A3B
       .byte $C3 ; |XX    XX| $3A3C
       .byte $81 ; |X      X| $3A3D
       .byte $00 ; |        | $3A3E
       .byte $00 ; |        | $3A3F
       .byte $00 ; |        | $3A40
       .byte $00 ; |        | $3A41
       .byte $00 ; |        | $3A42
       .byte $00 ; |        | $3A43
       .byte $00 ; |        | $3A44
       .byte $00 ; |        | $3A45
       .byte $00 ; |        | $3A46
       .byte $00 ; |        | $3A47
       .byte $00 ; |        | $3A48
       .byte $00 ; |        | $3A49
       .byte $00 ; |        | $3A4A
       .byte $00 ; |        | $3A4B
       .byte $00 ; |        | $3A4C
       .byte $00 ; |        | $3A4D
       .byte $00 ; |        | $3A4E
       .byte $00 ; |        | $3A4F
       .byte $0C ; |    XX  | $3A50
       .byte $08 ; |    X   | $3A51
       .byte $38 ; |  XXX   | $3A52
       .byte $28 ; |  X X   | $3A53
       .byte $7E ; | XXXXXX | $3A54
       .byte $C2 ; |XX    X | $3A55
       .byte $47 ; | X   XXX| $3A56
       .byte $28 ; |  X X   | $3A57
       .byte $28 ; |  X X   | $3A58
       .byte $C8 ; |XX  X   | $3A59
       .byte $86 ; |X    XX | $3A5A
       .byte $92 ; |X  X  X | $3A5B
       .byte $92 ; |X  X  X | $3A5C
       .byte $84 ; |X    X  | $3A5D
       .byte $78 ; | XXXX   | $3A5E
       .byte $00 ; |        | $3A5F
       .byte $00 ; |        | $3A60
       .byte $00 ; |        | $3A61
       .byte $00 ; |        | $3A62
       .byte $00 ; |        | $3A63
       .byte $00 ; |        | $3A64
       .byte $00 ; |        | $3A65
       .byte $00 ; |        | $3A66
       .byte $00 ; |        | $3A67
       .byte $00 ; |        | $3A68
       .byte $00 ; |        | $3A69
       .byte $00 ; |        | $3A6A
       .byte $00 ; |        | $3A6B
       .byte $00 ; |        | $3A6C
       .byte $00 ; |        | $3A6D
       .byte $00 ; |        | $3A6E
       .byte $00 ; |        | $3A6F
       .byte $00 ; |        | $3A70
       .byte $30 ; |  XX    | $3A71
       .byte $20 ; |  X     | $3A72
       .byte $2C ; |  X XX  | $3A73
       .byte $28 ; |  X X   | $3A74
       .byte $7C ; | XXXXX  | $3A75
       .byte $C4 ; |XX   X  | $3A76
       .byte $44 ; | X   X  | $3A77
       .byte $22 ; |  X   X | $3A78
       .byte $2F ; |  X XXXX| $3A79
       .byte $C8 ; |XX  X   | $3A7A
       .byte $86 ; |X    XX | $3A7B
       .byte $82 ; |X     X | $3A7C
       .byte $92 ; |X  X  X | $3A7D
       .byte $84 ; |X    X  | $3A7E
       .byte $78 ; | XXXX   | $3A7F
       .byte $00 ; |        | $3A80
       .byte $00 ; |        | $3A81
       .byte $00 ; |        | $3A82
       .byte $00 ; |        | $3A83
       .byte $00 ; |        | $3A84
       .byte $00 ; |        | $3A85
       .byte $00 ; |        | $3A86
       .byte $00 ; |        | $3A87
       .byte $00 ; |        | $3A88
       .byte $00 ; |        | $3A89
       .byte $00 ; |        | $3A8A
       .byte $00 ; |        | $3A8B
       .byte $00 ; |        | $3A8C
       .byte $00 ; |        | $3A8D
       .byte $00 ; |        | $3A8E
       .byte $00 ; |        | $3A8F
       .byte $00 ; |        | $3A90
       .byte $00 ; |        | $3A91
       .byte $00 ; |        | $3A92
       .byte $2A ; |  X X X | $3A93
       .byte $3E ; |  XXXXX | $3A94
       .byte $7F ; | XXXXXXX| $3A95
       .byte $EA ; |XXX X X | $3A96
       .byte $CA ; |XX  X X | $3A97
       .byte $80 ; |X       | $3A98
       .byte $80 ; |X       | $3A99
       .byte $CA ; |XX  X X | $3A9A
       .byte $EB ; |XXX X XX| $3A9B
       .byte $FF ; |XXXXXXXX| $3A9C
       .byte $7E ; | XXXXXX | $3A9D
       .byte $66 ; | XX  XX | $3A9E
       .byte $55 ; | X X X X| $3A9F
       .byte $55 ; | X X X X| $3AA0
       .byte $77 ; | XXX XXX| $3AA1
       .byte $00 ; |        | $3AA2
       .byte $00 ; |        | $3AA3
       .byte $00 ; |        | $3AA4
       .byte $00 ; |        | $3AA5
       .byte $00 ; |        | $3AA6
       .byte $00 ; |        | $3AA7
       .byte $00 ; |        | $3AA8
       .byte $00 ; |        | $3AA9
       .byte $00 ; |        | $3AAA
       .byte $00 ; |        | $3AAB
       .byte $00 ; |        | $3AAC
       .byte $00 ; |        | $3AAD
       .byte $00 ; |        | $3AAE
       .byte $00 ; |        | $3AAF
       .byte $00 ; |        | $3AB0
       .byte $00 ; |        | $3AB1
       .byte $00 ; |        | $3AB2
       .byte $00 ; |        | $3AB3
       .byte $00 ; |        | $3AB4
       .byte $54 ; | X X X  | $3AB5
       .byte $54 ; | X X X  | $3AB6
       .byte $3E ; |  XXXXX | $3AB7
       .byte $7F ; | XXXXXXX| $3AB8
       .byte $CA ; |XX  X X | $3AB9
       .byte $80 ; |X       | $3ABA
       .byte $CA ; |XX  X X | $3ABB
       .byte $EB ; |XXX X XX| $3ABC
       .byte $FF ; |XXXXXXXX| $3ABD
       .byte $7E ; | XXXXXX | $3ABE
       .byte $4C ; | X  XX  | $3ABF
       .byte $55 ; | X X X X| $3AC0
       .byte $55 ; | X X X X| $3AC1
       .byte $55 ; | X X X X| $3AC2
       .byte $77 ; | XXX XXX| $3AC3
       .byte $00 ; |        | $3AC4
       .byte $00 ; |        | $3AC5
       .byte $00 ; |        | $3AC6
       .byte $00 ; |        | $3AC7
       .byte $00 ; |        | $3AC8
       .byte $00 ; |        | $3AC9
       .byte $00 ; |        | $3ACA
       .byte $00 ; |        | $3ACB
       .byte $00 ; |        | $3ACC
       .byte $00 ; |        | $3ACD
       .byte $00 ; |        | $3ACE
       .byte $00 ; |        | $3ACF
       .byte $00 ; |        | $3AD0
       .byte $00 ; |        | $3AD1
       .byte $00 ; |        | $3AD2
       .byte $00 ; |        | $3AD3
       .byte $00 ; |        | $3AD4
       .byte $00 ; |        | $3AD5
       .byte $00 ; |        | $3AD6
       .byte $00 ; |        | $3AD7
       .byte $00 ; |        | $3AD8
       .byte $00 ; |        | $3AD9
       .byte $00 ; |        | $3ADA
       .byte $00 ; |        | $3ADB
       .byte $00 ; |        | $3ADC
       .byte $00 ; |        | $3ADD
       .byte $00 ; |        | $3ADE
       .byte $00 ; |        | $3ADF
       .byte $00 ; |        | $3AE0
       .byte $00 ; |        | $3AE1
       .byte $00 ; |        | $3AE2
       .byte $00 ; |        | $3AE3
       .byte $00 ; |        | $3AE4
       .byte $00 ; |        | $3AE5
       .byte $00 ; |        | $3AE6
       .byte $00 ; |        | $3AE7
       .byte $00 ; |        | $3AE8
       .byte $00 ; |        | $3AE9
       .byte $00 ; |        | $3AEA
       .byte $00 ; |        | $3AEB
       .byte $00 ; |        | $3AEC
       .byte $00 ; |        | $3AED
       .byte $00 ; |        | $3AEE
       .byte $00 ; |        | $3AEF
       .byte $00 ; |        | $3AF0
       .byte $00 ; |        | $3AF1
       .byte $00 ; |        | $3AF2
       .byte $00 ; |        | $3AF3
       .byte $00 ; |        | $3AF4
       .byte $00 ; |        | $3AF5
       .byte $01 ; |       X| $3AF6
       .byte $01 ; |       X| $3AF7
       .byte $FF ; |XXXXXXXX| $3AF8
       .byte $FF ; |XXXXXXXX| $3AF9
       .byte $01 ; |       X| $3AFA
       .byte $01 ; |       X| $3AFB
       .byte $FF ; |XXXXXXXX| $3AFC
       .byte $FF ; |XXXXXXXX| $3AFD
       .byte $01 ; |       X| $3AFE
       .byte $01 ; |       X| $3AFF
       .byte $00 ; |        | $3B00
       .byte $00 ; |        | $3B01
       .byte $C2 ; |XX    X | $3B02
       .byte $66 ; | XX  XX | $3B03
       .byte $FC ; |XXXXXX  | $3B04
       .byte $F8 ; |XXXXX   | $3B05
       .byte $AC ; |X X XX  | $3B06
       .byte $A6 ; |X X  XX | $3B07
       .byte $02 ; |      X | $3B08
       .byte $0A ; |    X X | $3B09
       .byte $0E ; |    XXX | $3B0A
       .byte $AC ; |X X XX  | $3B0B
       .byte $AC ; |X X XX  | $3B0C
       .byte $F8 ; |XXXXX   | $3B0D
       .byte $78 ; | XXXX   | $3B0E
       .byte $30 ; |  XX    | $3B0F
       .byte $00 ; |        | $3B10
       .byte $00 ; |        | $3B11
       .byte $00 ; |        | $3B12
       .byte $00 ; |        | $3B13
       .byte $00 ; |        | $3B14
       .byte $00 ; |        | $3B15
       .byte $00 ; |        | $3B16
       .byte $00 ; |        | $3B17
       .byte $00 ; |        | $3B18
       .byte $00 ; |        | $3B19
       .byte $00 ; |        | $3B1A
       .byte $00 ; |        | $3B1B
       .byte $00 ; |        | $3B1C
       .byte $00 ; |        | $3B1D
       .byte $00 ; |        | $3B1E
       .byte $00 ; |        | $3B1F
       .byte $00 ; |        | $3B20
       .byte $00 ; |        | $3B21
       .byte $00 ; |        | $3B22
       .byte $00 ; |        | $3B23
       .byte $38 ; |  XXX   | $3B24
       .byte $18 ; |   XX   | $3B25
       .byte $18 ; |   XX   | $3B26
       .byte $38 ; |  XXX   | $3B27
       .byte $7C ; | XXXXX  | $3B28
       .byte $E6 ; |XXX  XX | $3B29
       .byte $A6 ; |X X  XX | $3B2A
       .byte $06 ; |     XX | $3B2B
       .byte $A6 ; |X X  XX | $3B2C
       .byte $FC ; |XXXXXX  | $3B2D
       .byte $7C ; | XXXXX  | $3B2E
       .byte $38 ; |  XXX   | $3B2F
       .byte $00 ; |        | $3B30
       .byte $00 ; |        | $3B31
       .byte $00 ; |        | $3B32
       .byte $00 ; |        | $3B33
       .byte $00 ; |        | $3B34
       .byte $00 ; |        | $3B35
       .byte $00 ; |        | $3B36
       .byte $00 ; |        | $3B37
       .byte $00 ; |        | $3B38
       .byte $00 ; |        | $3B39
       .byte $00 ; |        | $3B3A
       .byte $00 ; |        | $3B3B
       .byte $00 ; |        | $3B3C
       .byte $00 ; |        | $3B3D
       .byte $00 ; |        | $3B3E
       .byte $00 ; |        | $3B3F
       .byte $00 ; |        | $3B40
       .byte $00 ; |        | $3B41
       .byte $00 ; |        | $3B42
       .byte $00 ; |        | $3B43
       .byte $00 ; |        | $3B44
       .byte $00 ; |        | $3B45
       .byte $00 ; |        | $3B46
       .byte $00 ; |        | $3B47
       .byte $00 ; |        | $3B48
       .byte $00 ; |        | $3B49
       .byte $C3 ; |XX    XX| $3B4A
       .byte $66 ; | XX  XX | $3B4B
       .byte $7E ; | XXXXXX | $3B4C
       .byte $42 ; | X    X | $3B4D
       .byte $81 ; |X      X| $3B4E
       .byte $BD ; |X XXXX X| $3B4F
       .byte $B1 ; |X XX   X| $3B50
       .byte $B1 ; |X XX   X| $3B51
       .byte $BD ; |X XXXX X| $3B52
       .byte $B1 ; |X XX   X| $3B53
       .byte $B1 ; |X XX   X| $3B54
       .byte $BD ; |X XXXX X| $3B55
       .byte $81 ; |X      X| $3B56
       .byte $42 ; | X    X | $3B57
       .byte $3C ; |  XXXX  | $3B58
       .byte $00 ; |        | $3B59
       .byte $00 ; |        | $3B5A
       .byte $00 ; |        | $3B5B
       .byte $00 ; |        | $3B5C
       .byte $00 ; |        | $3B5D
       .byte $00 ; |        | $3B5E
       .byte $00 ; |        | $3B5F
       .byte $00 ; |        | $3B60
       .byte $00 ; |        | $3B61
       .byte $00 ; |        | $3B62
       .byte $00 ; |        | $3B63
       .byte $00 ; |        | $3B64
       .byte $00 ; |        | $3B65
       .byte $00 ; |        | $3B66
       .byte $00 ; |        | $3B67
       .byte $00 ; |        | $3B68
       .byte $00 ; |        | $3B69
       .byte $00 ; |        | $3B6A
       .byte $C3 ; |XX    XX| $3B6B
       .byte $66 ; | XX  XX | $3B6C
       .byte $7E ; | XXXXXX | $3B6D
       .byte $42 ; | X    X | $3B6E
       .byte $81 ; |X      X| $3B6F
       .byte $A5 ; |X X  X X| $3B70
       .byte $A5 ; |X X  X X| $3B71
       .byte $A5 ; |X X  X X| $3B72
       .byte $99 ; |X  XX  X| $3B73
       .byte $99 ; |X  XX  X| $3B74
       .byte $A5 ; |X X  X X| $3B75
       .byte $A5 ; |X X  X X| $3B76
       .byte $81 ; |X      X| $3B77
       .byte $42 ; | X    X | $3B78
       .byte $3C ; |  XXXX  | $3B79
       .byte $00 ; |        | $3B7A
       .byte $00 ; |        | $3B7B
       .byte $00 ; |        | $3B7C
       .byte $00 ; |        | $3B7D
       .byte $00 ; |        | $3B7E
       .byte $00 ; |        | $3B7F
       .byte $00 ; |        | $3B80
       .byte $00 ; |        | $3B81
       .byte $00 ; |        | $3B82
       .byte $00 ; |        | $3B83
       .byte $00 ; |        | $3B84
       .byte $00 ; |        | $3B85
       .byte $00 ; |        | $3B86
       .byte $00 ; |        | $3B87
       .byte $00 ; |        | $3B88
       .byte $00 ; |        | $3B89
       .byte $00 ; |        | $3B8A
       .byte $00 ; |        | $3B8B
       .byte $C3 ; |XX    XX| $3B8C
       .byte $66 ; | XX  XX | $3B8D
       .byte $7E ; | XXXXXX | $3B8E
       .byte $42 ; | X    X | $3B8F
       .byte $81 ; |X      X| $3B90
       .byte $99 ; |X  XX  X| $3B91
       .byte $99 ; |X  XX  X| $3B92
       .byte $99 ; |X  XX  X| $3B93
       .byte $99 ; |X  XX  X| $3B94
       .byte $99 ; |X  XX  X| $3B95
       .byte $99 ; |X  XX  X| $3B96
       .byte $BD ; |X XXXX X| $3B97
       .byte $81 ; |X      X| $3B98
       .byte $42 ; | X    X | $3B99
       .byte $3C ; |  XXXX  | $3B9A
       .byte $00 ; |        | $3B9B
       .byte $00 ; |        | $3B9C
       .byte $00 ; |        | $3B9D
       .byte $00 ; |        | $3B9E
       .byte $00 ; |        | $3B9F
       .byte $00 ; |        | $3BA0
       .byte $00 ; |        | $3BA1
       .byte $00 ; |        | $3BA2
       .byte $00 ; |        | $3BA3
       .byte $00 ; |        | $3BA4
       .byte $00 ; |        | $3BA5
       .byte $00 ; |        | $3BA6
       .byte $00 ; |        | $3BA7
       .byte $00 ; |        | $3BA8
       .byte $00 ; |        | $3BA9
       .byte $00 ; |        | $3BAA
       .byte $00 ; |        | $3BAB
       .byte $00 ; |        | $3BAC
       .byte $C3 ; |XX    XX| $3BAD
       .byte $66 ; | XX  XX | $3BAE
       .byte $7E ; | XXXXXX | $3BAF
       .byte $42 ; | X    X | $3BB0
       .byte $81 ; |X      X| $3BB1
       .byte $B5 ; |X XX X X| $3BB2
       .byte $B5 ; |X XX X X| $3BB3
       .byte $B9 ; |X XXX  X| $3BB4
       .byte $B5 ; |X XX X X| $3BB5
       .byte $B5 ; |X XX X X| $3BB6
       .byte $B5 ; |X XX X X| $3BB7
       .byte $B9 ; |X XXX  X| $3BB8
       .byte $81 ; |X      X| $3BB9
       .byte $42 ; | X    X | $3BBA
       .byte $3C ; |  XXXX  | $3BBB
       .byte $00 ; |        | $3BBC
       .byte $00 ; |        | $3BBD
       .byte $00 ; |        | $3BBE
       .byte $00 ; |        | $3BBF
       .byte $00 ; |        | $3BC0
       .byte $00 ; |        | $3BC1
       .byte $00 ; |        | $3BC2
       .byte $00 ; |        | $3BC3
       .byte $00 ; |        | $3BC4
       .byte $00 ; |        | $3BC5
       .byte $00 ; |        | $3BC6
       .byte $00 ; |        | $3BC7
       .byte $00 ; |        | $3BC8
       .byte $00 ; |        | $3BC9
       .byte $00 ; |        | $3BCA
       .byte $00 ; |        | $3BCB
       .byte $00 ; |        | $3BCC
       .byte $00 ; |        | $3BCD
       .byte $C3 ; |XX    XX| $3BCE
       .byte $66 ; | XX  XX | $3BCF
       .byte $7E ; | XXXXXX | $3BD0
       .byte $42 ; | X    X | $3BD1
       .byte $81 ; |X      X| $3BD2
       .byte $A5 ; |X X  X X| $3BD3
       .byte $A5 ; |X X  X X| $3BD4
       .byte $BD ; |X XXXX X| $3BD5
       .byte $A5 ; |X X  X X| $3BD6
       .byte $A5 ; |X X  X X| $3BD7
       .byte $A5 ; |X X  X X| $3BD8
       .byte $99 ; |X  XX  X| $3BD9
       .byte $81 ; |X      X| $3BDA
       .byte $42 ; | X    X | $3BDB
       .byte $3C ; |  XXXX  | $3BDC
       .byte $00 ; |        | $3BDD
       .byte $00 ; |        | $3BDE
       .byte $00 ; |        | $3BDF
       .byte $00 ; |        | $3BE0
       .byte $00 ; |        | $3BE1
       .byte $00 ; |        | $3BE2
       .byte $00 ; |        | $3BE3
       .byte $00 ; |        | $3BE4
       .byte $00 ; |        | $3BE5
       .byte $00 ; |        | $3BE6
       .byte $00 ; |        | $3BE7
       .byte $00 ; |        | $3BE8
       .byte $00 ; |        | $3BE9
       .byte $00 ; |        | $3BEA
       .byte $00 ; |        | $3BEB
       .byte $00 ; |        | $3BEC
       .byte $00 ; |        | $3BED
       .byte $00 ; |        | $3BEE
       .byte $00 ; |        | $3BEF
       .byte $00 ; |        | $3BF0
       .byte $FF ; |XXXXXXXX| $3BF1
       .byte $01 ; |       X| $3BF2
       .byte $01 ; |       X| $3BF3
       .byte $FF ; |XXXXXXXX| $3BF4
       .byte $FF ; |XXXXXXXX| $3BF5
       .byte $01 ; |       X| $3BF6
       .byte $01 ; |       X| $3BF7
       .byte $FF ; |XXXXXXXX| $3BF8
       .byte $FF ; |XXXXXXXX| $3BF9
       .byte $01 ; |       X| $3BFA
       .byte $01 ; |       X| $3BFB
       .byte $FF ; |XXXXXXXX| $3BFC
       .byte $FF ; |XXXXXXXX| $3BFD
       .byte $01 ; |       X| $3BFE
       .byte $01 ; |       X| $3BFF
       .byte $00 ; |        | $3C00
       .byte $41 ; | X     X| $3C01
       .byte $41 ; | X     X| $3C02
       .byte $41 ; | X     X| $3C03
       .byte $49 ; | X  X  X| $3C04
       .byte $55 ; | X X X X| $3C05
       .byte $63 ; | XX   XX| $3C06
       .byte $41 ; | X     X| $3C07
       .byte $00 ; |        | $3C08
       .byte $43 ; | X    XX| $3C09
       .byte $46 ; | X   XX | $3C0A
       .byte $4C ; | X  XX  | $3C0B
       .byte $7E ; | XXXXXX | $3C0C
       .byte $41 ; | X     X| $3C0D
       .byte $41 ; | X     X| $3C0E
       .byte $7E ; | XXXXXX | $3C0F
       .byte $00 ; |        | $3C10
       .byte $BC ; |X XXXX  | $3C11
       .byte $B9 ; |X XXX  X| $3C12
       .byte $B3 ; |X XX  XX| $3C13
       .byte $81 ; |X      X| $3C14
       .byte $BE ; |X XXXXX | $3C15
       .byte $BE ; |X XXXXX | $3C16
       .byte $81 ; |X      X| $3C17
       .byte $00 ; |        | $3C18
       .byte $40 ; | X      | $3C19
       .byte $40 ; | X      | $3C1A
       .byte $40 ; | X      | $3C1B
       .byte $48 ; | X  X   | $3C1C
       .byte $78 ; | XXXX   | $3C1D
       .byte $40 ; | X      | $3C1E
       .byte $00 ; |        | $3C1F
       .byte $00 ; |        | $3C20
       .byte $78 ; | XXXX   | $3C21
       .byte $44 ; | X   X  | $3C22
       .byte $44 ; | X   X  | $3C23
       .byte $44 ; | X   X  | $3C24
       .byte $44 ; | X   X  | $3C25
       .byte $44 ; | X   X  | $3C26
       .byte $78 ; | XXXX   | $3C27
       .byte $00 ; |        | $3C28
       .byte $62 ; | XX   X | $3C29
       .byte $90 ; |X  X    | $3C2A
       .byte $92 ; |X  X  X | $3C2B
       .byte $92 ; |X  X  X | $3C2C
       .byte $93 ; |X  X  XX| $3C2D
       .byte $63 ; | XX   XX| $3C2E
       .byte $03 ; |      XX| $3C2F
       .byte $00 ; |        | $3C30
       .byte $7E ; | XXXXXX | $3C31
       .byte $40 ; | X      | $3C32
       .byte $40 ; | X      | $3C33
       .byte $78 ; | XXXX   | $3C34
       .byte $40 ; | X      | $3C35
       .byte $40 ; | X      | $3C36
       .byte $7E ; | XXXXXX | $3C37
       .byte $00 ; |        | $3C38
       .byte $81 ; |X      X| $3C39
       .byte $BF ; |X XXXXXX| $3C3A
       .byte $BF ; |X XXXXXX| $3C3B
       .byte $87 ; |X    XXX| $3C3C
       .byte $BF ; |X XXXXXX| $3C3D
       .byte $BF ; |X XXXXXX| $3C3E
       .byte $81 ; |X      X| $3C3F
       .byte $00 ; |        | $3C40
       .byte $41 ; | X     X| $3C41
       .byte $22 ; |  X   X | $3C42
       .byte $14 ; |   X X  | $3C43
       .byte $08 ; |    X   | $3C44
       .byte $14 ; |   X X  | $3C45
       .byte $22 ; |  X   X | $3C46
       .byte $41 ; | X     X| $3C47
       .byte $00 ; |        | $3C48
       .byte $BE ; |X XXXXX | $3C49
       .byte $DD ; |XX XXX X| $3C4A
       .byte $EB ; |XXX X XX| $3C4B
       .byte $F7 ; |XXXX XXX| $3C4C
       .byte $EB ; |XXX X XX| $3C4D
       .byte $DD ; |XX XXX X| $3C4E
       .byte $BE ; |X XXXXX | $3C4F
       .byte $00 ; |        | $3C50
       .byte $08 ; |    X   | $3C51
       .byte $08 ; |    X   | $3C52
       .byte $08 ; |    X   | $3C53
       .byte $08 ; |    X   | $3C54
       .byte $08 ; |    X   | $3C55
       .byte $08 ; |    X   | $3C56
       .byte $7F ; | XXXXXXX| $3C57
       .byte $00 ; |        | $3C58
       .byte $F7 ; |XXXX XXX| $3C59
       .byte $F7 ; |XXXX XXX| $3C5A
       .byte $F7 ; |XXXX XXX| $3C5B
       .byte $F7 ; |XXXX XXX| $3C5C
       .byte $F7 ; |XXXX XXX| $3C5D
       .byte $80 ; |X       | $3C5E
       .byte $FF ; |XXXXXXXX| $3C5F
       .byte $00 ; |        | $3C60
       .byte $44 ; | X   X  | $3C61
       .byte $44 ; | X   X  | $3C62
       .byte $44 ; | X   X  | $3C63
       .byte $7C ; | XXXXX  | $3C64
       .byte $44 ; | X   X  | $3C65
       .byte $28 ; |  X X   | $3C66
       .byte $10 ; |   X    | $3C67
       .byte $00 ; |        | $3C68
       .byte $BB ; |X XXX XX| $3C69
       .byte $BB ; |X XXX XX| $3C6A
       .byte $BB ; |X XXX XX| $3C6B
       .byte $83 ; |X     XX| $3C6C
       .byte $BB ; |X XXX XX| $3C6D
       .byte $D7 ; |XX X XXX| $3C6E
       .byte $EF ; |XXX XXXX| $3C6F
       .byte $00 ; |        | $3C70
       .byte $7F ; | XXXXXXX| $3C71
       .byte $40 ; | X      | $3C72
       .byte $40 ; | X      | $3C73
       .byte $40 ; | X      | $3C74
       .byte $40 ; | X      | $3C75
       .byte $40 ; | X      | $3C76
       .byte $7F ; | XXXXXXX| $3C77
       .byte $00 ; |        | $3C78
       .byte $7F ; | XXXXXXX| $3C79
       .byte $40 ; | X      | $3C7A
       .byte $40 ; | X      | $3C7B
       .byte $40 ; | X      | $3C7C
       .byte $40 ; | X      | $3C7D
       .byte $40 ; | X      | $3C7E
       .byte $40 ; | X      | $3C7F
       .byte $00 ; |        | $3C80
       .byte $7F ; | XXXXXXX| $3C81
       .byte $41 ; | X     X| $3C82
       .byte $41 ; | X     X| $3C83
       .byte $41 ; | X     X| $3C84
       .byte $41 ; | X     X| $3C85
       .byte $41 ; | X     X| $3C86
       .byte $7F ; | XXXXXXX| $3C87
       .byte $00 ; |        | $3C88
       .byte $84 ; |X    X  | $3C89
       .byte $85 ; |X    X X| $3C8A
       .byte $86 ; |X    XX | $3C8B
       .byte $F7 ; |XXXX XXX| $3C8C
       .byte $94 ; |X  X X  | $3C8D
       .byte $94 ; |X  X X  | $3C8E
       .byte $F7 ; |XXXX XXX| $3C8F
       .byte $00 ; |        | $3C90
       .byte $B9 ; |X XXX  X| $3C91
       .byte $20 ; |  X     | $3C92
       .byte $20 ; |  X     | $3C93
       .byte $B9 ; |X XXX  X| $3C94
       .byte $A1 ; |X X    X| $3C95
       .byte $A1 ; |X X    X| $3C96
       .byte $BD ; |X XXXX X| $3C97
       .byte $00 ; |        | $3C98
       .byte $EF ; |XXX XXXX| $3C99
       .byte $28 ; |  X X   | $3C9A
       .byte $28 ; |  X X   | $3C9B
       .byte $EE ; |XXX XXX | $3C9C
       .byte $08 ; |    X   | $3C9D
       .byte $08 ; |    X   | $3C9E
       .byte $EF ; |XXX XXXX| $3C9F
       .byte $00 ; |        | $3CA0
       .byte $44 ; | X   X  | $3CA1
       .byte $4C ; | X  XX  | $3CA2
       .byte $4C ; | X  XX  | $3CA3
       .byte $54 ; | X X X  | $3CA4
       .byte $54 ; | X X X  | $3CA5
       .byte $64 ; | XX  X  | $3CA6
       .byte $45 ; | X   X X| $3CA7
       .byte $00 ; |        | $3CA8
       .byte $47 ; | X   XXX| $3CA9
       .byte $40 ; | X      | $3CAA
       .byte $40 ; | X      | $3CAB
       .byte $47 ; | X   XXX| $3CAC
       .byte $44 ; | X   X  | $3CAD
       .byte $44 ; | X   X  | $3CAE
       .byte $F7 ; |XXXX XXX| $3CAF
       .byte $00 ; |        | $3CB0
       .byte $C0 ; |XX      | $3CB1
       .byte $40 ; | X      | $3CB2
       .byte $40 ; | X      | $3CB3
       .byte $C0 ; |XX      | $3CB4
       .byte $00 ; |        | $3CB5
       .byte $00 ; |        | $3CB6
       .byte $C0 ; |XX      | $3CB7
       .byte $00 ; |        | $3CB8
       .byte $00 ; |        | $3CB9
       .byte $00 ; |        | $3CBA
       .byte $00 ; |        | $3CBB
       .byte $00 ; |        | $3CBC
       .byte $00 ; |        | $3CBD
       .byte $00 ; |        | $3CBE
       .byte $00 ; |        | $3CBF
       .byte $00 ; |        | $3CC0
       .byte $00 ; |        | $3CC1
       .byte $00 ; |        | $3CC2
       .byte $7C ; | XXXXX  | $3CC3
       .byte $84 ; |X    X  | $3CC4
       .byte $8E ; |X   XXX | $3CC5
       .byte $80 ; |X       | $3CC6
       .byte $80 ; |X       | $3CC7
       .byte $84 ; |X    X  | $3CC8
       .byte $7C ; | XXXXX  | $3CC9
       .byte $00 ; |        | $3CCA
       .byte $00 ; |        | $3CCB
       .byte $0C ; |    XX  | $3CCC
       .byte $0C ; |    XX  | $3CCD
       .byte $12 ; |   X  X | $3CCE
       .byte $12 ; |   X  X | $3CCF
       .byte $21 ; |  X    X| $3CD0
       .byte $21 ; |  X    X| $3CD1
       .byte $21 ; |  X    X| $3CD2
L3CD3: STA    WSYNC   ;3
       STA    HMP0,X  ;4
       AND    #$0F    ;2
       TAY            ;2
       LDA    $DD     ;3
       LDA    $DD     ;3
       LDA    $DD     ;3
       LDA    $DD     ;3
L3CE2: DEY            ;2
       BPL    L3CE2   ;2
       STA    RESP0,X ;4
       STA    WSYNC   ;3
       STA    HMOVE   ;3
       RTS            ;6

L3CEC: .byte $2E ; |  X XXX | $3CEC
       .byte $36 ; |  XX XX | $3CED
       .byte $3E ; |  XXXXX | $3CEE
       .byte $46 ; | X   XX | $3CEF
       .byte $4E ; | X  XXX | $3CF0
       .byte $FF ; |XXXXXXXX| $3CF1
       .byte $01 ; |       X| $3CF2
       .byte $01 ; |       X| $3CF3
       .byte $FF ; |XXXXXXXX| $3CF4
       .byte $FF ; |XXXXXXXX| $3CF5
       .byte $01 ; |       X| $3CF6
       .byte $01 ; |       X| $3CF7
       .byte $FF ; |XXXXXXXX| $3CF8
       .byte $FF ; |XXXXXXXX| $3CF9
       .byte $01 ; |       X| $3CFA
       .byte $01 ; |       X| $3CFB
       .byte $FF ; |XXXXXXXX| $3CFC
       .byte $FF ; |XXXXXXXX| $3CFD
L3CFE: LDA    #$00    ;2
       STA    WSYNC   ;3
       STA    COLUBK  ;3
       LDX    #$07    ;2
       STX    $DD     ;3
       LDA    $8F     ;3
       STA    COLUPF  ;3
       LDA    #$10    ;2
       STA.w  $0004   ;4
       LDA    $98,X   ;4
       STA    PF1     ;3
       LDA    $A0,X   ;4
       STA    PF2     ;3
       LDA    $B0,X   ;4
       STA    PF1     ;3
       LDA    $A8,X   ;4
       STA    PF2     ;3
       LDY    #$03    ;2
L3D23: DEY            ;2
       BNE    L3D23   ;2
       LDX    $DD     ;3
       JMP    L3E06   ;3
L3D2B: STA    COLUPF  ;3
       STA    WSYNC   ;3
       LDA    ($E5),Y ;5
       STA    GRP0    ;3
       BEQ    L3DAC   ;2
       LDA    ($F6),Y ;5
       STA    GRP1    ;3
       NOP            ;2
       LDA    $98,X   ;4
       STA    PF1     ;3
       LDA    $A0,X   ;4
       STA    PF2     ;3
       LDA    $B0,X   ;4
       STA    PF1     ;3
       LDA    $A8,X   ;4
       STA    PF2     ;3
       LDA    ($F6),Y ;5
       BEQ    L3D76   ;2
       LDA    $DE,X   ;4
       STA    $E5     ;3
       LDA    $EF,X   ;4
       STA    $F6     ;3
       LDY    #$11    ;2
       LDA    ($E5),Y ;5
       STA    GRP0    ;3
       LDA    #$00    ;2
       STA.w  $0008   ;4
       LDA    ($F6),Y ;5
       STA    GRP1    ;3
       DEY            ;2
       ASL    $DC     ;5
       STA    WSYNC   ;3
       LDA    ($E5),Y ;5
       STA    GRP0    ;3
       LDA    ($F6),Y ;5
       STA    GRP1    ;3
       DEY            ;2
       JMP    L3E38   ;3
L3D76: LDA    $DE,X   ;4
       STA    $E5     ;3
       LDA    $EF,X   ;4
       STA    $F6     ;3
       LDY    #$11    ;2
       NOP            ;2
       LDA    #$00    ;2
       STA    COLUPF  ;3
       LDA    ($E5),Y ;5
       STA    GRP0    ;3
       DEY            ;2
       LDA    #$0E    ;2
       STA    COLUP1  ;3
       LDA    $F8,X   ;4
       STA    HMP1    ;3
       AND    #$0F    ;2
       TAX            ;2
       ASL    $DC     ;5
       STA    WSYNC   ;3
       LDA    ($E5),Y ;5
       STA    GRP0    ;3
       DEY            ;2
       LDA    $DD     ;3
       LDA    ($E5),Y ;5
L3DA2: DEX            ;2
       BPL    L3DA2   ;2
       LDX    $DD     ;3
       STA    RESP1   ;3
       JMP    L3E3A   ;3
L3DAC: LDA    ($F6),Y ;5
       STA.w  $001C   ;4
       LDA    $98,X   ;4
       STA    PF1     ;3
       LDA    $A0,X   ;4
       STA    PF2     ;3
       LDA    $B0,X   ;4
       STA    PF1     ;3
       LDA    $A8,X   ;4
       STA    PF2     ;3
       LDA    ($F6),Y ;5
       BEQ    L3DFE   ;2
       LDA    $DE,X   ;4
       STA    $E5     ;3
       LDA    $EF,X   ;4
       STA    $F6     ;3
       LDY    #$11    ;2
       LDA    ($F6),Y ;5
       STA    GRP1    ;3
       LDA    #$00    ;2
       STA.w  $0008   ;4
       LDA    $E7,X   ;4
       STA.w  $0020   ;4
       AND    #$0F    ;2
       TAX            ;2
L3DE0: DEX            ;2
       BPL    L3DE0   ;2
       STA    RESP0   ;3
       LDX    $DD     ;3
       STA    WSYNC   ;3
       DEY            ;2
       LDA    ($F6),Y ;5
       STA    GRP1    ;3
       LDA    #$9A    ;2
       STA    COLUP0  ;3
       DEY            ;2
       LDA    #$3A    ;2
       ASL    $DC     ;5
       ADC    #$00    ;2
       STA    $E6     ;3
       JMP    L3E38   ;3
L3DFE: LDA    $DE,X   ;4
       STA    $E5     ;3
       LDA    $EF,X   ;4
       STA    $F6     ;3
L3E06: LDA    #$00    ;2
       STA.w  $0008   ;4
       LDA    $E7,X   ;4
       STA.w  $0020   ;4
       AND    #$0F    ;2
       TAY            ;2
       LDA    #$3A    ;2
       ASL    $DC     ;5
       ADC    #$00    ;2
L3E19: DEY            ;2
       BPL    L3E19   ;2
       STA    RESP0   ;3
       STA    $E6     ;3
       LDA    #$0E    ;2
       STA    WSYNC   ;3
       STA    COLUP1  ;3
       LDA    #$9A    ;2
       STA    COLUP0  ;3
       LDA    $F8,X   ;4
       STA    HMP1    ;3
       AND    #$0F    ;2
       TAY            ;2
L3E31: DEY            ;2
       BPL    L3E31   ;2
       LDY    #$0F    ;2
       STA    RESP1   ;3
L3E38: LDA    ($E5),Y ;5
L3E3A: STA    WSYNC   ;3
       STA    HMOVE   ;3
       STA    GRP0    ;3
       LDA    $8F     ;3
       STA    COLUPF  ;3
       LDA    ($F6),Y ;5
       STA    GRP1    ;3
       LDA    $98,X   ;4
       STA    PF1     ;3
       LDA    $A0,X   ;4
       STA    PF2     ;3
       LDA    $B0,X   ;4
       STA    PF1     ;3
       LDA    $A8,X   ;4
       STA    PF2     ;3
       LDA    #$00    ;2
       CMP    $F6     ;3
       BEQ    L3E62   ;2
       LDA    #$00    ;2
       BEQ    L3E68   ;2
L3E62: LDA    #$22    ;2
       STA    COLUP1  ;3
       LDA    $90,X   ;4
L3E68: STA    NUSIZ1  ;3
       DEY            ;2
       LDA    #$00    ;2
       STA    WSYNC   ;3
L3E6F: STA    COLUPF  ;3
       LDA    ($E5),Y ;5
       STA    GRP0    ;3
       LDA    ($F6),Y ;5
       STA    GRP1    ;3
       LDA    #$3A    ;2
       CMP    $E5     ;3
       BCC    L3E83   ;2
       LDA    #$28    ;2
       STA    COLUP0  ;3
L3E83: LDA    $BA     ;3
       CMP    $DD     ;3
       BNE    L3E91   ;2
       CPY    $B9     ;3
       BNE    L3E91   ;2
       LDA    #$02    ;2
       STA    ENAM0   ;3
L3E91: DEY            ;2
       STA    WSYNC   ;3
       LDA    ($E5),Y ;5
       STA    GRP0    ;3
       LDA    ($F6),Y ;5
       STA    GRP1    ;3
       LDA    $BA     ;3
       CMP    $DD     ;3
       BEQ    L3EAC   ;2
       DEX            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       JMP    L3EBE   ;3
L3EAC: CPY    $B9     ;3
       BEQ    L3EB7   ;2
       DEX            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       JMP    L3EBE   ;3
L3EB7: LDA    #$02    ;2
       STA    ENAM0   ;3
       LDX    $DD     ;3
       DEX            ;2
L3EBE: DEY            ;2
       BEQ    L3EF5   ;2
       LDX    $DD     ;3
       LDA    $8F     ;3
       STA    WSYNC   ;3
       STA    COLUPF  ;3
       LDA    ($E5),Y ;5
       STA    GRP0    ;3
       LDA    ($F6),Y ;5
       STA.w  $001C   ;4
       LDA    $98,X   ;4
       STA    PF1     ;3
       LDA    $A0,X   ;4
       STA    PF2     ;3
       LDA    $B0,X   ;4
       STA    PF1     ;3
       LDA    $A8,X   ;4
       STA    PF2     ;3
       DEY            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       LDA    #$00    ;2
       STA    ENAM0   ;3
       LDX.w  $00DD   ;4
       LDA    #$00    ;2
       JMP    L3E6F   ;3
L3EF5: STA    HMCLR   ;3
       DEC    $DD     ;5
       BMI    L3F06   ;2
       LDA    #$00    ;2
       STA    NUSIZ1  ;3
       STA    ENAM0   ;3
       LDA    $8F     ;3
       JMP    L3D2B   ;3
L3F06: STA    WSYNC   ;3
       LDA    #$00    ;2
       STA    GRP0    ;3
       STA    GRP1    ;3
       STA    ENAM0   ;3
       LDA    #$FF    ;2
       LDY    $8F     ;3
       STY    COLUPF  ;3
       STA    PF1     ;3
       STA    PF2     ;3
       STA    WSYNC   ;3
       LDA    #$00    ;2
       STA    COLUPF  ;3
       LDX    #$00    ;2
       STX    PF0     ;3
       STX    PF1     ;3
       STX    PF2     ;3
       LDA    #$39    ;2
       STA    $F0     ;3
       STA    $F2     ;3
       LDA    #$2A    ;2
       STA    $EF     ;3
       STA    $F1     ;3
       LDX    #$34    ;2
       LDY    #$04    ;2
       STA    WSYNC   ;3
L3F3A: DEY            ;2
       BPL    L3F3A   ;2
       STA    RESP0   ;3
       NOP            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       LDA    $DD     ;3
       STA    RESP1   ;3
       STA    WSYNC   ;3
       LDA    #$D6    ;2
       STA    COLUBK  ;3
       LDA    #$0E    ;2
       STA    COLUP0  ;3
       STA    COLUP1  ;3
       LDY    $DB     ;3
       LDA    L3F84,Y ;4
       BMI    L3F5F   ;2
       BNE    L3F61   ;2
       STX    $EF     ;3
L3F5F: STX    $F1     ;3
L3F61: STA    NUSIZ0  ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       STA    NUSIZ1  ;3
       LDY    #$07    ;2
L3F6B: STA    WSYNC   ;3
       LDA    ($EF),Y ;5
       STA    GRP0    ;3
       LDA    ($F1),Y ;5
       STA    GRP1    ;3
       DEY            ;2
       BPL    L3F6B   ;2
       INY            ;2
       STY    GRP0    ;3
       STY    GRP1    ;3
       STY    GRP0    ;3
       STY    GRP1    ;3
       JMP    L3007   ;3
L3F84: .byte $00 ; |        | $3F84
       .byte $80 ; |X       | $3F85
       .byte $81 ; |X      X| $3F86
       .byte $83 ; |X     XX| $3F87
       .byte $03 ; |      XX| $3F88
       .byte $13 ; |   X  XX| $3F89
       .byte $33 ; |  XX  XX| $3F8A
L3F8B: STA    WSYNC   ;3
       LDX    #$00    ;2
       STX    COLUBK  ;3
       LDA    #$03    ;2
       STA    WSYNC   ;3
       STA    NUSIZ0  ;3
       STA    NUSIZ1  ;3
       STA    VDELP0  ;3
       STA    VDEL01  ;3
       LDA    #$10    ;2
       STA    HMP0    ;3
       ASL            ;2
       STA    HMP1    ;3
       NOP            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       STA    RESP0   ;3
       STA    RESP1   ;3
L3FAF: STA    WSYNC   ;3
       STA    HMOVE   ;3
       LDA    #$07    ;2
       STA    $EF     ;3
L3FB7: LDY    $EF     ;3
       LDA    ($F2),Y ;5
       STA    GRP0    ;3
       STA    WSYNC   ;3
       LDA    ($F4),Y ;5
       STA    GRP1    ;3
       LDA    ($F6),Y ;5
       STA    GRP0    ;3
       LDA    ($F8),Y ;5
       STA    $F0     ;3
       LDA    ($FA),Y ;5
       TAX            ;2
       LDA    ($FC),Y ;5
       TAY            ;2
       LDA    $F0     ;3
       STA    GRP1    ;3
       STX    GRP0    ;3
       STY    GRP1    ;3
       STY    GRP0    ;3
       DEC    $EF     ;5
       BPL    L3FB7   ;2
       LDA    #$00    ;2
       STA    GRP0    ;3
       STA    GRP1    ;3
       STA    HMCLR   ;3
       RTS            ;6

       .byte $FF ; |XXXXXXXX| $3FE8
       .byte $FF ; |XXXXXXXX| $3FE9
       .byte $01 ; |       X| $3FEA
       .byte $01 ; |       X| $3FEB
       .byte $FF ; |XXXXXXXX| $3FEC
       .byte $FF ; |XXXXXXXX| $3FED
       .byte $01 ; |       X| $3FEE
       .byte $01 ; |       X| $3FEF
       .byte $FF ; |XXXXXXXX| $3FF0
       .byte $FF ; |XXXXXXXX| $3FF1
       .byte $01 ; |       X| $3FF2
       .byte $01 ; |       X| $3FF3
       .byte $FF ; |XXXXXXXX| $3FF4
       .byte $FF ; |XXXXXXXX| $3FF5
       .byte $01 ; |       X| $3FF6
       .byte $01 ; |       X| $3FF7
L3FF8: .byte $03 ; |      XX| $3FF8
       .byte $FF ; |XXXXXXXX| $3FF9
       .byte $01 ; |       X| $3FFA
       .byte $01 ; |       X| $3FFB

       .word START

       .byte $00 ; |        | $3FFE
       .byte $00 ; |        | $3FFF
