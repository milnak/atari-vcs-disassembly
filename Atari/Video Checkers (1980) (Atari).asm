; Disassembly of .\Video Checkers (1980) (Atari).a26
; Disassembled Tue Apr 08 10:30:57 2025
; Using DiStella v3.01b
;
; Command Line: D:\temp\vcs-checkers\distella.exe -pafsccheckers.cfg .\Video Checkers (1980) (Atari).a26
;
; checkers.cfg contents:
;
;      ORG F000
;      CODE F000 FEED
;      GFX FEEE FFD0
;      CODE FFD1 FFF5
;      DATA FFF6 FFFF

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
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

       ORG $F000
LF000: LDX    #$04    ;2
LF002: LDY    #$02    ;2
LF004: STA    WSYNC   ;3
       LDA    $DA,X   ;4
       STA    PF1     ;3
       LDA    $D0,X   ;4
       STA    GRP0    ;3
       LDA    $D5,X   ;4
       STA    GRP1    ;3
       LDA    #$00    ;2
       CPX    #$02    ;2
       BNE    LF019   ;2
       TXA            ;2
LF019: STA    ENAM0   ;3
       LDA    $DF,X   ;4
       DEY            ;2
       STA    PF1     ;3
       BNE    LF004   ;2
       DEX            ;2
       BPL    LF002   ;2
       LDA    $F3     ;3
       STA    WSYNC   ;3
       STA    COLUP1  ;3
       LDA    #$31    ;2
       STA    CTRLPF  ;3
       STY    PF1     ;3
       STY    GRP0    ;3
       STY    GRP1    ;3
       LDA    #$E0    ;2
       STA    HMBL    ;3
       TXA            ;2
       STA    HMM1    ;3
       STA    $D9     ;3
       STA    RESP1   ;3
       LDX    #$06    ;2
       STX    NUSIZ0  ;3
       STY    HMP1    ;3
       STA    RESP0   ;3
       LDX    #$30    ;2
       STX    NUSIZ1  ;3
       STA    $DB     ;3
       STA    $DD     ;3
       STA    $DF     ;3
       LDA    #$10    ;2
       STA    HMP0    ;3
       STA    RESBL   ;3
       STA    RESM1   ;3
       STA    WSYNC   ;3
       STA    HMOVE   ;3
       LDA    $BA     ;3
       STA    COLUBK  ;3
       STA    WSYNC   ;3
       STA    HMCLR   ;3
       LDA    #$C0    ;2
       STA    HMP1    ;3
       STA    HMP0    ;3
       LDY    #$1F    ;2
LF06E: STY    $E0     ;3
       LDX    #$06    ;2
LF072: LDA.wy $0080,Y ;4
       BMI    LF080   ;2
       STA    $D8,X   ;4
       LDA    $CE     ;3
       JMP    LF086   ;3
LF07E: BCS    LF0D0   ;2
LF080: AND    #$7F    ;2
       STA    $D8,X   ;4
       LDA    $CF     ;3
LF086: STA    $D0,X   ;4
       INY            ;2
       DEX            ;2
       DEX            ;2
       BPL    LF072   ;2
       STA    WSYNC   ;3
       STA    HMOVE   ;3
       BCS    LF09C   ;2
       SEC            ;2
       LDA    #$C3    ;2
       LDX    #$03    ;2
       LDY    #$02    ;2
       BCS    LF0A2   ;2
LF09C: CLC            ;2
       LDA    #$3C    ;2
       TAX            ;2
       LDY    #$00    ;2
LF0A2: STA    PF2     ;3
       STX    PF1     ;3
       STY    ENAM1   ;3
       STY    ENABL   ;3
       STA    WSYNC   ;3
       STA    HMOVE   ;3
       STA    WSYNC   ;3
       LDA    #$40    ;2
       BCS    LF0B6   ;2
       LDA    #$C0    ;2
LF0B6: STA    HMP0    ;3
       STA    HMP1    ;3
       LDY    #$0F    ;2
LF0BC: STA    WSYNC   ;3
       LDA    $D0     ;3
       STA    COLUP1  ;3
       LDA    ($D8),Y ;5
       STA    GRP1    ;3
       LDA    $D2     ;3
       STA    COLUP0  ;3
       LDA    ($DA),Y ;5
       STA    GRP0    ;3
       BCS    LF07E   ;2
LF0D0: LDA    $F3     ;3
       STA    COLUP1  ;3
       LDX    $D4     ;3
       LDA    ($DC),Y ;5
       STX    COLUP0  ;3
       STA    GRP0    ;3
       LDX    $D6     ;3
       LDA    ($DE),Y ;5
       STA    GRP0    ;3
       STX    COLUP0  ;3
       DEY            ;2
       BPL    LF0BC   ;2
       STA    WSYNC   ;3
       STA    HMOVE   ;3
       INY            ;2
       STY    GRP1    ;3
       STY    GRP0    ;3
       STA    WSYNC   ;3
       STA    HMOVE   ;3
       PHP            ;3
       LDA    $E0     ;3
       SBC    #$04    ;2
       PLP            ;4
       TAY            ;2
       BMI    LF125   ;2
       JMP    LF06E   ;3

START:
       SEI            ;2
       CLD            ;2
       LDX    #$00    ;2
       TXA            ;2
LF105: STA    VSYNC,X ;4
       INX            ;2
       BNE    LF105   ;2
       DEX            ;2
       TXS            ;2
       INC    $B0     ;5
       LDA    SWCHB   ;4
       STA    $C2     ;3
       AND    #$40    ;2
       STA    $EC     ;3
       LDX    #$30    ;2
       STX    AUDF1   ;3
       INX            ;2
       STX    CTRLPF  ;3
       LDX    #$04    ;2
       STX    AUDC1   ;3
       JSR    LF986   ;6
LF125: STA    WSYNC   ;3
       LDX    #$25    ;2
       STA    WSYNC   ;3
       STX    TIM64T  ;4
       LDX    #$00    ;2
       STX    PF2     ;3
       STX    PF1     ;3
       INC    $C3     ;5
       BNE    LF140   ;2
       INC    $EE     ;5
       BNE    LF140   ;2
       LDA    #$00    ;2
       STA    $EF     ;3
LF140: LDA    $E5     ;3
       BEQ    LF14E   ;2
       CLC            ;2
       JSR    LF9D2   ;6
       LDX    $E8     ;3
       LDA    #$00    ;2
       STA    $80,X   ;4
LF14E: LDX    $E9     ;3
       LDA    $E4     ;3
       STA    $80,X   ;4
       LDX    $AB     ;3
       LDA    $A3     ;3
       STA    $80,X   ;4
       LDA    $F0     ;3
       BNE    LF1CD   ;2
       LDA    SWCHB   ;4
       TAX            ;2
       EOR    $C2     ;3
       STX    $C2     ;3
       BPL    LF1CA   ;2
       LDX    #$02    ;2
       LDA    $AD     ;3
       BMI    LF175   ;2
LF16E: LDA    #$22    ;2
       SEC            ;2
       SBC    $AB,X   ;4
       STA    $AB,X   ;4
LF175: DEX            ;2
       BPL    LF16E   ;2
       LDA    #$22    ;2
       SEC            ;2
       SBC    $E8     ;3
       STA    $E8     ;3
       LDA    #$22    ;2
       SEC            ;2
       SBC    $E9     ;3
       STA    $E9     ;3
       LDX    #$23    ;2
LF188: LDA    $80,X   ;4
       BEQ    LF190   ;2
       EOR    #$80    ;2
       STA    $80,X   ;4
LF190: DEX            ;2
       BPL    LF188   ;2
       LDA    $E4     ;3
       BEQ    LF19B   ;2
       EOR    #$80    ;2
       STA    $E4     ;3
LF19B: LDX    #$10    ;2
       LDY    #$00    ;2
LF19F: LDA    $92,X   ;4
       PHA            ;3
       LDA.wy $0080,Y ;4
       STA    $92,X   ;4
       PLA            ;4
       STA.wy $0080,Y ;5
       INY            ;2
       DEX            ;2
       BPL    LF19F   ;2
       JSR    LFB18   ;6
       LDA    $B1     ;3
       LDX    $B2     ;3
       STX    $B1     ;3
       STA    $B2     ;3
       LDA    $A9     ;3
       LDX    $AA     ;3
       STX    $A9     ;3
       STA    $AA     ;3
       LDA    $AE     ;3
       LDX    $AF     ;3
       STX    $AE     ;3
       STA    $AF     ;3
LF1CA: JSR    LF948   ;6
LF1CD: LDA    #$03    ;2
LF1CF: LDX    INTIM   ;4
       BNE    LF1CF   ;2
       STA    WSYNC   ;3
       STA    VSYNC   ;3
       STA    VBLANK  ;3
       STX    AUDC0   ;3
       STA    CTRLPF  ;3
       STA    WSYNC   ;3
       STA    WSYNC   ;3
       LDY    #$2C    ;2
       STA    WSYNC   ;3
       STX    VSYNC   ;3
       STY    TIM64T  ;4
       LDA    $F0     ;3
       BEQ    LF1F2   ;2
       JMP    LF7DA   ;3
LF1F2: LDA    $C2     ;3
       LDX    $EC     ;3
       BNE    LF25F   ;2
       AND    #$40    ;2
       BNE    LF24A   ;2
       LDA    $E6     ;3
       BEQ    LF213   ;2
       LDX    $EF     ;3
       BEQ    LF210   ;2
       DEC    $F1     ;5
       LDX    $F1     ;3
       STX    $EF     ;3
       BEQ    LF20E   ;2
       LDX    $C3     ;3
LF20E: STX    AUDV1   ;3
LF210: JMP    LF76A   ;3
LF213: LDX    $B0     ;3
       LDA    $F2     ;3
       BEQ    LF238   ;2
       DEC    $F2     ;5
       BNE    LF210   ;2
       CPX    #$10    ;2
       BNE    LF23C   ;2
       JSR    LF9EC   ;6
       BEQ    LF28A   ;2
       LDA    $AB     ;3
       LDX    $E8     ;3
       STA    $E8     ;3
       STX    $AB     ;3
       LDA    $80,X   ;4
       STA    $A3     ;3
       JSR    LFAE6   ;6
       JMP    LF7DA   ;3
LF238: CPX    #$10    ;2
       BEQ    LF240   ;2
LF23C: LDX    $BB     ;3
       BMI    LF243   ;2
LF240: JMP    LF5AB   ;3
LF243: JSR    LF9EC   ;6
       BEQ    LF28A   ;2
       BNE    LF28D   ;2
LF24A: STA    $EC     ;3
       JSR    LFEE5   ;6
       JSR    LFAF7   ;6
       STY    $A4     ;3
       JSR    LFAE6   ;6
       STY    AUDV1   ;3
       STY    $E7     ;3
       STY    $A5     ;3
       BEQ    LF263   ;2
LF25F: AND    #$40    ;2
       STA    $EC     ;3
LF263: JSR    LFAFF   ;6
       LDX    $AB     ;3
       LDA    $80,X   ;4
       BEQ    LF270   ;2
       AND    #$80    ;2
       STA    $BB     ;3
LF270: LDX    #$00    ;2
       STX    $E6     ;3
       STX    $E5     ;3
       LDX    $EC     ;3
       BNE    LF240   ;2
       JSR    LFAF7   ;6
       LDX    $B0     ;3
       CPX    #$10    ;2
       BEQ    LF287   ;2
       LDA    $BB     ;3
       BMI    LF28A   ;2
LF287: JSR    LF9EC   ;6
LF28A: JMP    LF7DA   ;3
LF28D: LDX    #$01    ;2
       STX    $BC     ;3
       STX    $DE     ;3
       STX    $DF     ;3
       DEX            ;2
       STX    $A6     ;3
       STX    VBLANK  ;3
       STX    $C4     ;3
       LDA    #$80    ;2
       STA    $EB     ;3
       STA    $EC     ;3
       STA    $BF     ;3
       LDA    $C2     ;3
       ROR            ;2
       BCS    LF2BC   ;2
       LDA    $C3     ;3
       AND    #$07    ;2
       TAX            ;2
       LDA    LFF6E,X ;4
       STA    $C5     ;3
       AND    #$3F    ;2
       STA    $AC     ;3
       STA    $E8     ;3
       JMP    LF55E   ;3
LF2BC: LDA    SWCHB   ;4
       ROR            ;2
       BCS    LF2CD   ;2
       ROL            ;2
       JSR    LF591   ;6
       LDA    #$1E    ;2
       STA    $F0     ;3
       JMP    LF1CA   ;3
LF2CD: LDA    $A6     ;3
       STA    $A8     ;3
       LDA    $A5     ;3
       STA    $A7     ;3
       LDX    $C0     ;3
LF2D7: LDA    $80,X   ;4
       BEQ    LF2DF   ;2
       EOR    $BB     ;3
       BPL    LF2E2   ;2
LF2DF: JMP    LF4E8   ;3
LF2E2: STX    $AC     ;3
       JSR    LFA26   ;6
LF2E7: LDA    $80,X   ;4
       STA    $A3     ;3
       JSR    LFACD   ;6
       BCS    LF330   ;2
       TAX            ;2
       LDA    $A5     ;3
       BNE    LF328   ;2
       LDA    $80,X   ;4
       BNE    LF330   ;2
       STX    $AD     ;3
       STY    $BE     ;3
       LDA    $A3     ;3
       JSR    LFEC0   ;6
       STA    $80,X   ;4
       LDA    #$00    ;2
       LDX    $AC     ;3
       STA    $80,X   ;4
       JSR    LFBD2   ;6
       BCS    LF31B   ;2
       LDA    $A3     ;3
       AND    #$30    ;2
       ORA    $BE     ;3
       JSR    LFEB3   ;6
       JMP    LF376   ;3
LF31B: JSR    LFB18   ;6
       JSR    LFB66   ;6
       LDA    #$00    ;2
       STA    $A5     ;3
       JMP    LF44E   ;3
LF328: LDA    $80,X   ;4
       BEQ    LF330   ;2
       EOR    $BB     ;3
       BMI    LF333   ;2
LF330: JMP    LF4D6   ;3
LF333: STX    $BD     ;3
       JSR    LFACD   ;6
       BCS    LF330   ;2
       TAX            ;2
       LDA    $80,X   ;4
       BNE    LF330   ;2
       STX    $AD     ;3
       STY    $BE     ;3
       LDA    $A3     ;3
       JSR    LFFDF   ;6
       STA    $80,X   ;4
       LDY    #$00    ;2
       LDX    $AC     ;3
       STY    $80,X   ;4
       LDX    $BD     ;3
       LDA    $80,X   ;4
       ASL            ;2
       ASL            ;2
       ORA    $BD     ;3
       STA    $BD     ;3
       STY    $80,X   ;4
       JSR    LFE55   ;6
       LDA    $A5     ;3
       BEQ    LF36A   ;2
       LDX    $AD     ;3
       JSR    LFA31   ;6
       BCC    LF38C   ;2
LF36A: LDA    #$00    ;2
       STA    $A6     ;3
       JSR    LFBD2   ;6
       BCS    LF387   ;2
       JSR    LFEA3   ;6
LF376: LDA    $DC,X   ;4
       STA    $DE,X   ;4
       LDA    $E9,X   ;4
       STA    $EB,X   ;4
       LDA    #$00    ;2
       STA    $BF     ;3
       STA    $A6     ;3
       JMP    LF2BC   ;3
LF387: JSR    LFB18   ;6
       BCS    LF39B   ;2
LF38C: LDA    #$08    ;2
       STA    $A6     ;3
       JSR    LFB18   ;6
       JSR    LFBE9   ;6
       JSR    LFB18   ;6
       BCC    LF3A8   ;2
LF39B: LDA    $BD     ;3
       AND    #$3F    ;2
       TAX            ;2
       LDA    $BD     ;3
       JSR    LFB40   ;6
       JMP    LF44E   ;3
LF3A8: JSR    LFEA3   ;6
       LDA    $BF     ;3
       AND    #$80    ;2
       STA    $BF     ;3
       LDA    $DD,X   ;4
       STA    $DE,X   ;4
       LDA    $EA,X   ;4
       STA    $EB,X   ;4
       LDA    $DC,X   ;4
       STA    $DD,X   ;4
       LDA    $E9,X   ;4
       STA    $EA,X   ;4
       JMP    LF2BC   ;3
LF3C4: DEC    $BC     ;5
       LDX    $BC     ;3
       LDA    $C7,X   ;4
       AND    #$3F    ;2
       STA    $AC     ;3
       LDA    $D2,X   ;4
       AND    #$08    ;2
       STA    $A8     ;3
       LDA    $D2,X   ;4
       AND    #$04    ;2
       STA    $A7     ;3
       LDA    $D2,X   ;4
       AND    #$03    ;2
       STA    $BE     ;3
       LDA    $A7     ;3
       BNE    LF40D   ;2
       JSR    LFB18   ;6
       LDA    $A8     ;3
       STA    $A6     ;3
       LDA    $A7     ;3
       STA    $A5     ;3
       LDA    $D2,X   ;4
       AND    #$30    ;2
       ORA    $BB     ;3
       STA    $A3     ;3
       LDA    $C7,X   ;4
       AND    #$C0    ;2
       STA    $BF     ;3
       LDA    $AC     ;3
       LDY    $BE     ;3
       CLC            ;2
       ADC    LFF66,Y ;4
       STA    $AD     ;3
       JSR    LFB66   ;6
       JMP    LF419   ;3
LF40D: LDY    $A6     ;3
       BNE    LF421   ;2
       JSR    LFB18   ;6
       LDA    $C7,X   ;4
       JSR    LFB1F   ;6
LF419: ASL    $C4     ;5
       CLC            ;2
       ROR    $C4     ;5
       JMP    LF44E   ;3
LF421: LDA    $DE,X   ;4
       STA    $DD,X   ;4
       LDA    $EB,X   ;4
       STA    $EA,X   ;4
       LDA    $EC,X   ;4
       STA    $EB,X   ;4
       LDA    $DF,X   ;4
       STA    $DE,X   ;4
       LDA    $C4     ;3
       BPL    LF43B   ;2
       JSR    LFB23   ;6
       JMP    LF50E   ;3
LF43B: LDA    $C7,X   ;4
       BIT    $BF     ;3
       BPL    LF448   ;2
       BVC    LF448   ;2
       JSR    LFE6E   ;6
       LDA    $BF     ;3
LF448: JSR    LFB1F   ;6
       JMP    LF4D4   ;3
LF44E: LDX    $BC     ;3
       BIT    $BF     ;3
       BPL    LF45A   ;2
       INC    $DF,X   ;6
       BNE    LF45A   ;2
       INC    $EC,X   ;6
LF45A: LDA    $DE,X   ;4
       CLC            ;2
       ADC    $DF,X   ;4
       STA    $B3     ;3
       LDA    $EB,X   ;4
       ADC    $EC,X   ;4
       BVC    LF469   ;2
       LDA    $EB,X   ;4
LF469: BMI    LF49F   ;2
       BVS    LF49C   ;2
       BNE    LF49C   ;2
       BIT    $BF     ;3
       BPL    LF49C   ;2
       LDA    $B3     ;3
       BNE    LF49C   ;2
       LDA    $C3     ;3
       TAY            ;2
       BNE    LF480   ;2
       LDA    #$62    ;2
       STA    $C3     ;3
LF480: ROL            ;2
       ROL    $C3     ;5
       ROL            ;2
       ROL            ;2
       AND    #$01    ;2
       EOR    $C3     ;3
       STA    $C3     ;3
       LDA    $C4     ;3
       AND    #$7F    ;2
       CMP    #$05    ;2
       BCS    LF495   ;2
       INC    $C4     ;5
LF495: TAX            ;2
       TYA            ;2
       CMP    LFEEE,X ;4
       BCC    LF4BB   ;2
LF49C: JMP    LF4D4   ;3
LF49F: LDA    #$00    ;2
       SEC            ;2
       SBC    $DF,X   ;4
       STA    $DE,X   ;4
       LDA    #$00    ;2
       SBC    $EC,X   ;4
       STA    $EB,X   ;4
       LDA    $DE,X   ;4
       CLC            ;2
       ADC    $DD,X   ;4
       LDA    $EB,X   ;4
       ADC    $EA,X   ;4
       BVC    LF4B9   ;2
       LDA    $EB,X   ;4
LF4B9: BPL    LF50E   ;2
LF4BB: LDA    $BF     ;3
       ORA    #$40    ;2
       STA    $BF     ;3
       BPL    LF4D4   ;2
       LDA    #$00    ;2
       STA    $C4     ;3
       LDA    #$FF    ;2
       LDX    $A5     ;3
       BEQ    LF4CF   ;2
       LDA    $BC     ;3
LF4CF: STA    $A4     ;3
       JSR    LFE6E   ;6
LF4D4: LDY    $BE     ;3
LF4D6: LDX    $AC     ;3
       DEY            ;2
       BMI    LF4E8   ;2
       CPY    #$01    ;2
       BNE    LF4E5   ;2
       LDA    $80,X   ;4
       CMP    #$10    ;2
       BEQ    LF4E8   ;2
LF4E5: JMP    LF2E7   ;3
LF4E8: DEC    $C1     ;5
       BNE    LF504   ;2
       LDA    SWCHB   ;4
       AND    #$08    ;2
       BNE    LF4FA   ;2
       LDA    $BC     ;3
       ASL            ;2
       AND    #$06    ;2
       BPL    LF502   ;2
LF4FA: LDA    $BC     ;3
       ROR            ;2
       ROR            ;2
       ROR            ;2
       ROR            ;2
       ORA    #$02    ;2
LF502: STA    COLUBK  ;3
LF504: LDA    $A6     ;3
       BNE    LF519   ;2
       DEX            ;2
       BMI    LF519   ;2
       JMP    LF2D7   ;3
LF50E: ASL    $C4     ;5
       SEC            ;2
       ROR    $C4     ;5
       LDA    $BF     ;3
       AND    #$80    ;2
       STA    $BF     ;3
LF519: LDA    $BC     ;3
       CMP    #$01    ;2
       BEQ    LF522   ;2
       JMP    LF3C4   ;3
LF522: LDA    $C5     ;3
       AND    #$3F    ;2
       STA    $AC     ;3
       STA    $E8     ;3
       LDX    $A4     ;3
       BMI    LF55E   ;2
       DEC    $A4     ;5
       STA    $B3     ;3
       LDA    #$00    ;2
       STA    $B4     ;3
       ASL    $C5     ;5
       ROL            ;2
       ASL    $C5     ;5
       ROL            ;2
       TAY            ;2
       JSR    LFB84   ;6
       BCS    LF550   ;2
       LDA    $C7     ;3
       PHA            ;3
       LDA    $C6     ;3
       JSR    LFBB9   ;6
       PLA            ;4
       BCS    LF550   ;2
       JSR    LFBB9   ;6
LF550: LDX    $AC     ;3
       LDA    $80,X   ;4
       PHA            ;3
       LDA    #$00    ;2
       STA    $80,X   ;4
       LDA    $B3     ;3
       JMP    LF572   ;3
LF55E: TAX            ;2
       LDA    $80,X   ;4
       PHA            ;3
       LDA    #$00    ;2
       STA    $80,X   ;4
       ASL    $C5     ;5
       ROL            ;2
       ASL    $C5     ;5
       ROL            ;2
       TAY            ;2
       TXA            ;2
       CLC            ;2
       ADC    LFF66,Y ;4
LF572: TAX            ;2
       STA    $AD     ;3
       STA    $E9     ;3
       PLA            ;4
       JSR    LFEC0   ;6
       STA    $80,X   ;4
       STA    $E4     ;3
       JSR    LF58E   ;6
       LDX    $AB     ;3
       LDA    $80,X   ;4
       STA    $A3     ;3
       JSR    LF9EC   ;6
       JMP    LF7DA   ;3
LF58E: LDA    SWCHB   ;4
LF591: STA    $C2     ;3
       AND    #$40    ;2
       STA    $EC     ;3
       JSR    LFAF7   ;6
       INY            ;2
       STY    $A6     ;3
       STY    $BB     ;3
       STY    $E7     ;3
       STY    $ED     ;3
       STY    $E6     ;3
       STY    $F2     ;3
       INY            ;2
       STY    $E5     ;3
       RTS            ;6

LF5AB: LDA    $EC     ;3
       BEQ    LF600   ;2
       LDA    INPT4   ;3
       BPL    LF5B7   ;2
       CLC            ;2
       JMP    LF6DB   ;3
LF5B7: LDA    $C3     ;3
       AND    #$1F    ;2
       BNE    LF614   ;2
       LDA    $A3     ;3
       LDX    #$04    ;2
LF5C1: CMP    LFF4E,X ;4
       BEQ    LF5C9   ;2
       DEX            ;2
       BPL    LF5C1   ;2
LF5C9: LDA    $A9     ;3
       CLC            ;2
       ADC    LFF3E,X ;4
       STA    $A9     ;3
       LDA    $AA     ;3
       CLC            ;2
       ADC    LFF40,X ;4
       STA    $AA     ;3
       LDA    $AE     ;3
       CLC            ;2
       ADC    LFF43,X ;4
       STA    $AE     ;3
       LDA    $AF     ;3
       CLC            ;2
       ADC    LFF45,X ;4
       STA    $AF     ;3
       DEX            ;2
       BPL    LF5EE   ;2
       LDX    #$04    ;2
LF5EE: LDA    LFF4E,X ;4
       LDX    $AB     ;3
       JSR    LFEC0   ;6
       STA    $A3     ;3
       STA    $80,X   ;4
       JSR    LFAF7   ;6
       JMP    LF6CE   ;3
LF600: LDA    $BB     ;3
       ASL            ;2
       ROL            ;2
       TAY            ;2
       LDA.wy $003C,Y ;4
       TAY            ;2
       EOR    $EA     ;3
       BMI    LF628   ;2
       TYA            ;2
       BMI    LF617   ;2
       LDA    $ED     ;3
       BNE    LF66B   ;2
LF614: JMP    LF76A   ;3
LF617: LDA    $ED     ;3
       BPL    LF621   ;2
       LDA    $BB     ;3
       ROL            ;2
       JMP    LF6E1   ;3
LF621: LDA    #$00    ;2
       STA    $ED     ;3
LF625: JMP    LF6D8   ;3
LF628: STY    $EA     ;3
       TYA            ;2
       BMI    LF625   ;2
       LDA    $E7     ;3
       BNE    LF677   ;2
       JSR    LFAE6   ;6
       LDX    $AB     ;3
       JSR    LFA31   ;6
       BCC    LF641   ;2
       BEQ    LF65C   ;2
       LDA    $A5     ;3
       BNE    LF65C   ;2
LF641: INC    $E7     ;5
       LDX    $AB     ;3
       STX    $E9     ;3
       LDA    $80,X   ;4
       STA    $A3     ;3
       STA    $E4     ;3
       LDA    #$00    ;2
       STA    $A6     ;3
       JSR    LFAF7   ;6
       LDA    #$30    ;2
       JSR    LFFEB   ;6
       JMP    LF7DA   ;3
LF65C: LDA    #$01    ;2
LF65E: STA    $ED     ;3
       JSR    LFAF7   ;6
       LDA    $A5     ;3
       BEQ    LF66B   ;2
       LDA    #$BB    ;2
       STA    $AD     ;3
LF66B: LDA    #$30    ;2
       LDX    #$08    ;2
       LDY    #$0F    ;2
       JSR    LFFEF   ;6
       JMP    LF76A   ;3
LF677: LDX    $AB     ;3
       LDA    #$00    ;2
       STA    $80,X   ;4
       CPX    $E9     ;3
       BNE    LF68F   ;2
       LDY    $A6     ;3
       BNE    LF65C   ;2
       JSR    LFEE2   ;6
       LDA    $A3     ;3
       STA    $80,X   ;4
       JMP    LF6CE   ;3
LF68F: LDY    $A5     ;3
       BEQ    LF6BC   ;2
       TXA            ;2
       LDY    $BE     ;3
       CLC            ;2
       ADC    LFF66,Y ;4
       TAX            ;2
       LDA    $80,X   ;4
       LDY    #$00    ;2
       STY    $80,X   ;4
       ASL            ;2
       ASL            ;2
       JSR    LFE55   ;6
       JSR    LFFD1   ;6
       BCS    LF6BF   ;2
       JSR    LFA31   ;6
       BCS    LF6BF   ;2
       STX    $AB     ;3
       LDA    #$BB    ;2
       STA    $AD     ;3
       STA    $E7     ;3
       STA    $A6     ;3
       BNE    LF6D2   ;2
LF6BC: JSR    LFFD1   ;6
LF6BF: STX    $AB     ;3
       JSR    LFAF7   ;6
       INY            ;2
       STY    $A5     ;3
       JSR    LFB18   ;6
       LDA    #$2D    ;2
       STA    $F2     ;3
LF6CE: LDA    #$00    ;2
       STA    $E7     ;3
LF6D2: JSR    LFFE9   ;6
       JMP    LF7DA   ;3
LF6D8: LDA    $BB     ;3
       ROL            ;2
LF6DB: LDA    $C3     ;3
       AND    #$1F    ;2
       BNE    LF708   ;2
LF6E1: LDA    SWCHA   ;4
       BCS    LF6EA   ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
LF6EA: AND    #$0F    ;2
       CMP    #$0F    ;2
       BEQ    LF708   ;2
       JSR    LFAF7   ;6
       LDX    $E9     ;3
       LDY    $E7     ;3
       BNE    LF6FE   ;2
       JSR    LFEE2   ;6
       LDX    $AB     ;3
LF6FE: LDY    #$03    ;2
LF700: CMP    LFF62,Y ;4
       BEQ    LF70B   ;2
       DEY            ;2
       BPL    LF700   ;2
LF708: JMP    LF766   ;3
LF70B: JSR    LFACD   ;6
       BCC    LF715   ;2
LF710: LDA    #$80    ;2
       JMP    LF65E   ;3
LF715: TAX            ;2
       LDA    $E7     ;3
       BNE    LF723   ;2
       LDA    $80,X   ;4
       STA    $A3     ;3
       STX    $AB     ;3
       JMP    LF75F   ;3
LF723: LDA    $A5     ;3
       BEQ    LF735   ;2
       LDA    $80,X   ;4
       BEQ    LF710   ;2
       EOR    $BB     ;3
       BPL    LF710   ;2
       JSR    LFACD   ;6
       BCS    LF710   ;2
       TAX            ;2
LF735: CPX    $AB     ;3
       BEQ    LF755   ;2
       LDA    $E9     ;3
       CMP    $AB     ;3
       BNE    LF710   ;2
       LDA    $80,X   ;4
       BNE    LF710   ;2
       LDA    $A3     ;3
       CMP    #$10    ;2
       BNE    LF74D   ;2
       CPY    #$02    ;2
       BCC    LF710   ;2
LF74D: CMP    #$90    ;2
       BNE    LF755   ;2
       CPY    #$02    ;2
       BCS    LF710   ;2
LF755: LDA    $80,X   ;4
       STA    $E4     ;3
       STX    $E9     ;3
       STX    $AD     ;3
       STY    $BE     ;3
LF75F: LDA    #$30    ;2
       LDY    #$0E    ;2
       JSR    LFFED   ;6
LF766: LDA    #$00    ;2
       STA    $ED     ;3
LF76A: LDA    $C3     ;3
       AND    #$10    ;2
       BNE    LF797   ;2
       LDA    $E5     ;3
       BEQ    LF7DA   ;2
       SEC            ;2
       JSR    LF9D2   ;6
       LDX    $E8     ;3
       LDA    #$B0    ;2
       STA    $80,X   ;4
       LDX    $E9     ;3
       LDA    #$00    ;2
       STA    $80,X   ;4
       LDX    $AB     ;3
       CPX    $E9     ;3
       BNE    LF7DA   ;2
       LDA    #$30    ;2
       LDY    $BB     ;3
       BPL    LF792   ;2
       LDA    #$B0    ;2
LF792: STA    $80,X   ;4
       JMP    LF7DA   ;3
LF797: LDA    $E6     ;3
       BEQ    LF7A7   ;2
       LDA    $E5     ;3
       BEQ    LF7C1   ;2
       LDX    $E8     ;3
       LDA    #$B0    ;2
       STA    $80,X   ;4
       BNE    LF7C1   ;2
LF7A7: LDX    $AB     ;3
       LDA    #$00    ;2
       LDY    $F2     ;3
       BNE    LF7BF   ;2
       LDA    $E5     ;3
       BEQ    LF7B7   ;2
       CPX    $E9     ;3
       BEQ    LF7C1   ;2
LF7B7: LDA    #$30    ;2
       LDY    $BB     ;3
       BPL    LF7BF   ;2
       LDA    #$B0    ;2
LF7BF: STA    $80,X   ;4
LF7C1: LDA    $E7     ;3
       BEQ    LF7DA   ;2
       LDX    $E9     ;3
       LDY    $A3     ;3
       CPY    $E4     ;3
       BNE    LF7D8   ;2
       LDA    $C3     ;3
       ROR            ;2
       EOR    $C3     ;3
       AND    #$04    ;2
       BNE    LF7D8   ;2
       LDY    #$00    ;2
LF7D8: STY    $80,X   ;4
LF7DA: LDY    #$01    ;2
       LDX    $B0     ;3
       STX    $F6     ;3
       CPX    #$10    ;2
       BNE    LF7E5   ;2
       INY            ;2
LF7E5: STY    $F7     ;3
       LDA    $F2     ;3
       BNE    LF7F8   ;2
       LDX    $AB     ;3
       LDA    $E5     ;3
       BEQ    LF7F3   ;2
       LDX    $AC     ;3
LF7F3: JSR    LFA91   ;6
       STA    $F4     ;3
LF7F8: LDX    $AD     ;3
       JSR    LFA91   ;6
       STA    $F5     ;3
       LDX    #$00    ;2
       STX    $CF     ;3
       LDA    #$FF    ;2
       STA    $B4     ;3
       STA    $B6     ;3
       LDA    #$E4    ;2
       LDX    #$03    ;2
LF80D: SEC            ;2
       SBC    #$05    ;2
       STA    $CE     ;3
       LDA    $F4,X   ;4
       AND    #$0F    ;2
       STA    $B5     ;3
       ASL            ;2
       ASL            ;2
       ADC    $B5     ;3
       ADC    #$8C    ;2
       STA    $B3     ;3
       LDA    $F4,X   ;4
       AND    #$F0    ;2
       LSR            ;2
       LSR            ;2
       STA    $B5     ;3
       LSR            ;2
       LSR            ;2
       ADC    $B5     ;3
       ADC    #$8C    ;2
       STA    $B5     ;3
       LDY    #$04    ;2
LF832: LDA    ($B3),Y ;5
       EOR    ($B5),Y ;5
       AND    #$0F    ;2
       EOR    ($B5),Y ;5
       STA    ($CE),Y ;6
       DEY            ;2
       BPL    LF832   ;2
       LDA    $CE     ;3
       DEX            ;2
       BPL    LF80D   ;2
       LDX    #$05    ;2
LF846: LDA    $DE,X   ;4
       LDY    #$07    ;2
LF84A: ROL            ;2
       ROR    $DE,X   ;6
       DEY            ;2
       BPL    LF84A   ;2
       DEX            ;2
       BNE    LF846   ;2
       LDA    #$15    ;2
       STA    NUSIZ0  ;3
       STA    NUSIZ1  ;3
       LDA    #$F0    ;2
       STA    HMP0    ;3
       LDA    #$30    ;2
       STA    HMP1    ;3
       LDA    #$C0    ;2
       STA    HMM0    ;3
       STA    WSYNC   ;3
       LDY    #$08    ;2
LF869: DEY            ;2
       BNE    LF869   ;2
       STA    RESP0   ;3
       NOP            ;2
       STA    RESM0   ;3
       STA    RESP1   ;3
       STA    WSYNC   ;3
       STA    HMOVE   ;3
       LDX    #$00    ;2
       LDA    $C2     ;3
       AND    #$08    ;2
       BNE    LF8BD   ;2
       LDA    #$0F    ;2
       LDY    $EF     ;3
       BNE    LF889   ;2
       LDX    $EE     ;3
       LDA    #$07    ;2
LF889: STA    $B3     ;3
       TXA            ;2
       EOR    #$06    ;2
       AND    $B3     ;3
       STA    $F3     ;3
       STA    COLUPF  ;3
       STA    COLUBK  ;3
       TXA            ;2
       EOR    #$0A    ;2
       AND    $B3     ;3
       STA    $BA     ;3
       TXA            ;2
       EOR    #$0C    ;2
       AND    $B3     ;3
       STA    $CF     ;3
       TXA            ;2
       AND    $B3     ;3
       STA    $CE     ;3
       LDY    $B1     ;3
       CPY    #$36    ;2
       BEQ    LF8B6   ;2
       LDY    $CF     ;3
       STY    $CE     ;3
       STA    $CF     ;3
       TYA            ;2
LF8B6: STA    COLUP0  ;3
       STA    COLUP1  ;3
       JMP    LF913   ;3
LF8BD: LDA    #$FF    ;2
       LDY    $EF     ;3
       BNE    LF8CC   ;2
       LDA    $EE     ;3
       ROL            ;2
       ROL            ;2
       ROL            ;2
       ROL            ;2
       TAX            ;2
       LDA    #$F7    ;2
LF8CC: STA    $B3     ;3
       TXA            ;2
       EOR    #$92    ;2
       LDY    $B1     ;3
       CPY    #$36    ;2
       BEQ    LF8DA   ;2
       TXA            ;2
       EOR    #$0C    ;2
LF8DA: AND    $B3     ;3
       STA    COLUP0  ;3
       STA    COLUP1  ;3
       LDY    #$00    ;2
       LDA    $B0     ;3
       AND    #$0F    ;2
       CMP    #$05    ;2
       BCC    LF8EC   ;2
       LDY    #$03    ;2
LF8EC: TXA            ;2
       EOR    LFFCB,Y ;4
       AND    $B3     ;3
       STA    $F3     ;3
       STA    COLUPF  ;3
       LDA    $EF     ;3
       BNE    LF8FB   ;2
       INY            ;2
LF8FB: TXA            ;2
       EOR    LFFCC,Y ;4
       AND    $B3     ;3
       STA    COLUBK  ;3
       STA    $BA     ;3
       TXA            ;2
       EOR    $B1     ;3
       AND    $B3     ;3
       STA    $CE     ;3
       TXA            ;2
       EOR    $B2     ;3
       AND    $B3     ;3
       STA    $CF     ;3
LF913: LDA    $E6     ;3
       BEQ    LF929   ;2
       LDA    $C3     ;3
       AND    #$10    ;2
       BNE    LF929   ;2
       LDA    $F3     ;3
       LDX    $BB     ;3
       BMI    LF927   ;2
       STA    $CF     ;3
       BPL    LF929   ;2
LF927: STA    $CE     ;3
LF929: LDY    $F0     ;3
       BEQ    LF93C   ;2
       LDY    #$02    ;2
       DEC    $F0     ;5
       BNE    LF93C   ;2
       LDA    $B0     ;3
       CMP    #$10    ;2
       BEQ    LF93C   ;2
       JSR    LFFE9   ;6
LF93C: LDX    INTIM   ;4
       BNE    LF93C   ;2
       STA    WSYNC   ;3
       STY    VBLANK  ;3
       JMP    LF000   ;3
LF948: LDA    $C2     ;3
       ROR            ;2
       ROR            ;2
       BCS    LF971   ;2
       DEC    $EB     ;5
       BNE    LF970   ;2
       LDA    #$2D    ;2
       STA    $EB     ;3
       SED            ;2
       LDA    $B0     ;3
       CLC            ;2
       ADC    #$01    ;2
       CMP    #$20    ;2
       BNE    LF962   ;2
       LDA    #$01    ;2
LF962: STA    $B0     ;3
       CLD            ;2
       LDA    $E6     ;3
       BNE    LF96C   ;2
       JSR    LFAF7   ;6
LF96C: LDY    #$00    ;2
       STY    AUDV1   ;3
LF970: RTS            ;6

LF971: ASL            ;2
       BCS    LF9CD   ;2
       LDA    #$00    ;2
       LDX    #$2F    ;2
LF978: STA    $80,X   ;4
       DEX            ;2
       BPL    LF978   ;2
       STA    AUDV1   ;3
       LDX    #$03    ;2
LF981: STA    $E4,X   ;4
       DEX            ;2
       BPL    LF981   ;2
LF986: JSR    LFAF7   ;6
       STY    $A4     ;3
       JSR    LFEE5   ;6
       LDA    $EC     ;3
       BNE    LF9A9   ;2
       LDA    #$10    ;2
       LDY    #$90    ;2
       LDX    #$0D    ;2
LF998: STA    $7F,X   ;4
       STY    $95,X   ;4
       DEX            ;2
       BNE    LF998   ;2
       STX    $88     ;3
       STX    $9A     ;3
       LDA    #$18    ;2
       STA    $AA     ;3
       STA    $A9     ;3
LF9A9: LDX    #$0B    ;2
       LDY    #$17    ;2
       LDA    $B0     ;3
       CMP    #$10    ;2
       BNE    LF9BB   ;2
       LDA    $BB     ;3
       BPL    LF9BB   ;2
       LDX    #$17    ;2
       LDY    #$0B    ;2
LF9BB: STX    $AB     ;3
       STY    $E8     ;3
       LDA    $80,X   ;4
       STA    $A3     ;3
       LDA    #$80    ;2
       STA    $EA     ;3
       JSR    LFAFF   ;6
       JSR    LFAE6   ;6
LF9CD: LDX    #$01    ;2
       STX    $EB     ;3
       RTS            ;6

LF9D2: LDY    $A4     ;3
       BMI    LF9EB   ;2
LF9D6: LDA    #$10    ;2
       LDX    $C5,Y   ;4
       BPL    LF9E2   ;2
       TXA            ;2
       AND    #$7F    ;2
       TAX            ;2
       LDA    #$20    ;2
LF9E2: BCS    LF9E6   ;2
       LDA    #$00    ;2
LF9E6: STA    $80,X   ;4
       DEY            ;2
       BPL    LF9D6   ;2
LF9EB: RTS            ;6

LF9EC: LDA    #$80    ;2
       STA    $EA     ;3
       LDA    #$00    ;2
       STA    $A6     ;3
       JSR    LFA02   ;6
       BNE    LFA01   ;2
       INC    $E6     ;5
       LDA    #$80    ;2
       STA    $F1     ;3
       LDA    #$00    ;2
LFA01: RTS            ;6

LFA02: LDA    #$1E    ;2
       STA    $F0     ;3
       LDA    #$02    ;2
       STA    VBLANK  ;3
LFA0A: LDA    #$00    ;2
       STA    $B6     ;3
       LDA    #$04    ;2
       STA    $A5     ;3
       LDX    #$22    ;2
LFA14: JSR    LFA31   ;6
       BEQ    LFA1D   ;2
       INC    $B6     ;5
       BCC    LFA23   ;2
LFA1D: DEX            ;2
       BPL    LFA14   ;2
       INX            ;2
       STX    $A5     ;3
LFA23: LDY    $B6     ;3
       RTS            ;6

LFA26: LDY    #$03    ;2
       LDA    $80,X   ;4
       CMP    #$90    ;2
       BNE    LFA30   ;2
       LDY    #$01    ;2
LFA30: RTS            ;6

LFA31: LDY    #$00    ;2
       STY    $B5     ;3
       LDA    $80,X   ;4
       BEQ    LFA7D   ;2
       EOR    $BB     ;3
       BMI    LFA7D   ;2
       STX    $B4     ;3
       JSR    LFA26   ;6
LFA42: JSR    LFACD   ;6
       BCS    LFA6E   ;2
       TAX            ;2
       LDA    $80,X   ;4
       BNE    LFA59   ;2
       TXA            ;2
       LDA    $B6     ;3
       BNE    LFA55   ;2
       LDX    $B4     ;3
       STX    $C0     ;3
LFA55: INC    $B5     ;5
       BNE    LFA6E   ;2
LFA59: EOR    $BB     ;3
       BPL    LFA6E   ;2
       JSR    LFACD   ;6
       BCS    LFA6E   ;2
       TAX            ;2
       LDA    $80,X   ;4
       BNE    LFA6E   ;2
       LDX    $B4     ;3
       STX    $C0     ;3
       LDY    #$01    ;2
       RTS            ;6

LFA6E: LDX    $B4     ;3
       DEY            ;2
       BMI    LFA7D   ;2
       CPY    #$01    ;2
       BNE    LFA42   ;2
       LDA    $80,X   ;4
       CMP    #$10    ;2
       BNE    LFA42   ;2
LFA7D: SEC            ;2
       LDY    $B5     ;3
       RTS            ;6

LFA81: CPX    #$08    ;2
       BCC    LFA90   ;2
       DEX            ;2
       CPX    #$10    ;2
       BCC    LFA90   ;2
       DEX            ;2
       CPX    #$18    ;2
       BCC    LFA90   ;2
       DEX            ;2
LFA90: RTS            ;6

LFA91: TXA            ;2
       BPL    LFA9E   ;2
       LDA    $C3     ;3
       AND    #$10    ;2
       BEQ    LFA9C   ;2
       LDX    #$AA    ;2
LFA9C: TXA            ;2
       RTS            ;6

LFA9E: JSR    LFA81   ;6
       LDA    $C2     ;3
       LDY    $B1     ;3
       CPY    #$36    ;2
       BNE    LFAAF   ;2
       AND    #$08    ;2
       BEQ    LFAB3   ;2
       BNE    LFABA   ;2
LFAAF: AND    #$08    ;2
       BEQ    LFABA   ;2
LFAB3: TXA            ;2
       SEC            ;2
       SBC    #$20    ;2
       EOR    #$FF    ;2
       TAX            ;2
LFABA: INX            ;2
       TXA            ;2
       LDY    #$00    ;2
LFABE: CMP    #$0A    ;2
       BCC    LFAC9   ;2
       SBC    #$0A    ;2
       INY            ;2
       BNE    LFABE   ;2
LFAC7: ADC    #$10    ;2
LFAC9: DEY            ;2
       BPL    LFAC7   ;2
       RTS            ;6

LFACD: TXA            ;2
       CLC            ;2
       ADC    LFF66,Y ;4
       CMP    #$23    ;2
       BCS    LFAE4   ;2
       CMP    #$1A    ;2
       BEQ    LFAE4   ;2
       CMP    #$11    ;2
       BEQ    LFAE4   ;2
       CMP    #$08    ;2
       BEQ    LFAE4   ;2
       CLC            ;2
       RTS            ;6

LFAE4: SEC            ;2
       RTS            ;6

LFAE6: LDY    $A5     ;3
       BEQ    LFAEE   ;2
       LDY    #$BB    ;2
       BNE    LFAF0   ;2
LFAEE: LDY    #$AA    ;2
LFAF0: STY    $AD     ;3
       LDY    #$00    ;2
       STY    $E5     ;3
       RTS            ;6

LFAF7: LDY    #$00    ;2
       STY    $EE     ;3
       DEY            ;2
       STY    $EF     ;3
       RTS            ;6

LFAFF: LDY    $C2     ;3
       BPL    LFB0B   ;2
       LDA    #$80    ;2
       LDX    #$0C    ;2
       LDY    #$36    ;2
       BNE    LFB11   ;2
LFB0B: LDA    #$00    ;2
       LDX    #$36    ;2
       LDY    #$0C    ;2
LFB11: STA    $BB     ;3
       STX    $B1     ;3
       STY    $B2     ;3
       RTS            ;6

LFB18: LDA    $BB     ;3
       EOR    #$80    ;2
       STA    $BB     ;3
       RTS            ;6

LFB1F: AND    #$C0    ;2
       STA    $BF     ;3
LFB23: LDX    $BC     ;3
       LDA    $D2,X   ;4
       AND    #$30    ;2
       ORA    $BB     ;3
       STA    $A3     ;3
       LDA    $D2,X   ;4
       PHA            ;3
       LDA    $AC     ;3
       LDY    $BE     ;3
       CLC            ;2
       ADC    LFF66,Y ;4
       TAX            ;2
       CLC            ;2
       ADC    LFF66,Y ;4
       STA    $AD     ;3
       PLA            ;4
LFB40: LDY    #$02    ;2
       ROL            ;2
       LDA    #$90    ;2
       BCC    LFB4A   ;2
       INY            ;2
       LDA    #$A0    ;2
LFB4A: EOR    $BB     ;3
       STA    $80,X   ;4
       AND    #$80    ;2
       ASL            ;2
       ROL            ;2
       TAX            ;2
       TYA            ;2
       ADC    $A9,X   ;4
       STA    $A9,X   ;4
       CPY    #$03    ;2
       BNE    LFB5E   ;2
       INC    $AE,X   ;6
LFB5E: LDA    $A7     ;3
       STA    $A5     ;3
       LDA    $A8     ;3
       STA    $A6     ;3
LFB66: LDX    $AD     ;3
       LDA    $80,X   ;4
       CMP    $A3     ;3
       BEQ    LFB77   ;2
       LDA    $BB     ;3
       ASL            ;2
       ROL            ;2
       TAX            ;2
       DEC    $A9,X   ;6
       DEC    $AE,X   ;6
LFB77: LDX    $AD     ;3
       LDA    #$00    ;2
       STA    $80,X   ;4
       LDX    $AC     ;3
       LDA    $A3     ;3
       STA    $80,X   ;4
       RTS            ;6

LFB84: LDA    $B3     ;3
       CLC            ;2
       ADC    LFF66,Y ;4
       PHA            ;3
       TAX            ;2
       LDA    $80,X   ;4
       DEC    $A9     ;5
       DEC    $A9     ;5
       CMP    #$20    ;2
       BNE    LFB9A   ;2
       DEC    $A9     ;5
       DEC    $AE     ;5
LFB9A: PHA            ;3
       LDA    #$00    ;2
       STA    $80,X   ;4
       PLA            ;4
       TAX            ;2
       PLA            ;4
       PHA            ;3
       CPX    #$20    ;2
       BNE    LFBA9   ;2
       ORA    #$80    ;2
LFBA9: LDX    $B4     ;3
       STA    $C5,X   ;4
       INC    $B4     ;5
       PLA            ;4
       CLC            ;2
       ADC    LFF66,Y ;4
       STA    $B3     ;3
       CPX    $A4     ;3
       RTS            ;6

LFBB9: STA    $B6     ;3
       LDA    #$03    ;2
       STA    $B5     ;3
LFBBF: LDA    #$00    ;2
       ASL    $B6     ;5
       ROL            ;2
       ASL    $B6     ;5
       ROL            ;2
       TAY            ;2
       JSR    LFB84   ;6
       BCS    LFBD1   ;2
       DEC    $B5     ;5
       BPL    LFBBF   ;2
LFBD1: RTS            ;6

LFBD2: JSR    LFB18   ;6
       JSR    LFA0A   ;6
       BNE    LFBE9   ;2
       LDX    $BC     ;3
       TXA            ;2
       CLC            ;2
       ADC    #$02    ;2
       STA    $DF,X   ;4
       LDA    #$80    ;2
       STA    $EC,X   ;4
       JMP    LFE3E   ;3
LFBE9: LDA    $BC     ;3
       CMP    #$0B    ;2
       BCC    LFC11   ;2
       JSR    LFC21   ;6
       LDA    $A5     ;3
       BEQ    LFC0F   ;2
       LDY    #$00    ;2
       LDX    $BC     ;3
       LDA    $EC,X   ;4
       BPL    LFC00   ;2
       LDY    #$02    ;2
LFC00: LDA    LFFC8,Y ;4
       CLC            ;2
       ADC    $DF,X   ;4
       STA    $DF,X   ;4
       LDA    LFFC9,Y ;4
       ADC    $EC,X   ;4
       STA    $EC,X   ;4
LFC0F: SEC            ;2
       RTS            ;6

LFC11: LDX    $A5     ;3
       BEQ    LFC17   ;2
LFC15: CLC            ;2
       RTS            ;6

LFC17: LDA    $B0     ;3
       AND    #$0F    ;2
       CMP    $BC     ;3
       BEQ    LFC21   ;2
       BCS    LFC15   ;2
LFC21: LDX    $A9     ;3
       LDY    $AA     ;3
       STX    $B8     ;3
       STY    $B6     ;3
       LDA    #$00    ;2
       STA    $B5     ;3
       LDX    #$11    ;2
       CLC            ;2
LFC30: ROL    $B5     ;5
       ROL    $B6     ;5
       DEX            ;2
       BEQ    LFC40   ;2
       ROL            ;2
       CMP    $B8     ;3
       BCC    LFC30   ;2
       SBC    $B8     ;3
       BCS    LFC30   ;2
LFC40: LDA    #$00    ;2
       STA    $B4     ;3
       ASL    $B5     ;5
       ROL    $B6     ;5
       ASL    $B5     ;5
       ROL    $B6     ;5
       ASL    $B5     ;5
       ROL    $B6     ;5
       ASL    $B5     ;5
       ROL    $B6     ;5
       BCS    LFC58   ;2
       BPL    LFC63   ;2
LFC58: LDA    #$F2    ;2
       STA    $B5     ;3
       LDA    #$7F    ;2
       STA    $B6     ;3
       JMP    LFE1E   ;3
LFC63: LDA    #$FF    ;2
       STA    $B9     ;3
       LDA    $A9     ;3
       SEC            ;2
       SBC    $AE     ;3
       CMP    #$08    ;2
       BCC    LFC73   ;2
LFC70: JMP    LFD14   ;3
LFC73: ADC    $AF     ;3
       SEC            ;2
       SBC    $AA     ;3
       BCS    LFC70   ;2
       LDX    #$22    ;2
LFC7C: STX    $B9     ;3
       LDA    $80,X   ;4
       BEQ    LFCE6   ;2
       AND    #$20    ;2
       BNE    LFC93   ;2
       JSR    LFA81   ;6
       TXA            ;2
       LSR            ;2
       LSR            ;2
       CLC            ;2
       ADC    $B4     ;3
       STA    $B4     ;3
       LDX    $B9     ;3
LFC93: LDA    $80,X   ;4
       BMI    LFCE6   ;2
       JSR    LFA81   ;6
       TXA            ;2
       LSR            ;2
       LSR            ;2
       STA    $B7     ;3
       EOR    #$01    ;2
       ROR            ;2
       TXA            ;2
       ROL            ;2
       AND    #$07    ;2
       STA    $B8     ;3
       LDX    #$22    ;2
LFCAA: LDA    $80,X   ;4
       BPL    LFCE3   ;2
       TXA            ;2
       PHA            ;3
       JSR    LFA81   ;6
       TXA            ;2
       LSR            ;2
       LSR            ;2
       SEC            ;2
       SBC    $B7     ;3
       BPL    LFCC0   ;2
       EOR    #$FF    ;2
       CLC            ;2
       ADC    #$01    ;2
LFCC0: STA    $B3     ;3
       TXA            ;2
       LSR            ;2
       LSR            ;2
       EOR    #$01    ;2
       ROR            ;2
       TXA            ;2
       ROL            ;2
       AND    #$07    ;2
       SEC            ;2
       SBC    $B8     ;3
       BPL    LFCD6   ;2
       EOR    #$FF    ;2
       CLC            ;2
       ADC    #$01    ;2
LFCD6: CMP    $B3     ;3
       BCS    LFCDC   ;2
       LDA    $B3     ;3
LFCDC: CLC            ;2
       ADC    $B4     ;3
       STA    $B4     ;3
       PLA            ;4
       TAX            ;2
LFCE3: DEX            ;2
       BPL    LFCAA   ;2
LFCE6: LDX    $B9     ;3
       DEX            ;2
       BPL    LFC7C   ;2
       LDA    $B5     ;3
       SEC            ;2
       SBC    $B4     ;3
       STA    $B5     ;3
       BCS    LFCF6   ;2
       DEC    $B6     ;5
LFCF6: LDA    #$00    ;2
       STA    $B4     ;3
       LDY    #$0D    ;2
LFCFC: LDX    LFF7E,Y ;4
       LDA    $80,X   ;4
       BEQ    LFD11   ;2
       ROL            ;2
       AND    #$40    ;2
       BEQ    LFD11   ;2
       BCC    LFD0F   ;2
       INC    $B4     ;5
       JMP    LFD11   ;3
LFD0F: DEC    $B4     ;5
LFD11: DEY            ;2
       BPL    LFCFC   ;2
LFD14: LDA    $B0     ;3
       AND    #$0E    ;2
       BNE    LFD1D   ;2
LFD1A: JMP    LFE1E   ;3
LFD1D: LDA    $AE     ;3
       ASL            ;2
       ADC    $AE     ;3
       CMP    $A9     ;3
       BEQ    LFD49   ;2
       LDA    #$00    ;2
       LDY    $9F     ;3
       BPL    LFD2E   ;2
       ORA    #$08    ;2
LFD2E: LDY    $A0     ;3
       BPL    LFD34   ;2
       ORA    #$04    ;2
LFD34: LDY    $A1     ;3
       BPL    LFD3A   ;2
       ORA    #$02    ;2
LFD3A: LDY    $A2     ;3
       BPL    LFD40   ;2
       ORA    #$01    ;2
LFD40: TAX            ;2
       LDA    LFF52,X ;4
       CLC            ;2
       ADC    $B4     ;3
       STA    $B4     ;3
LFD49: LDA    $AF     ;3
       ASL            ;2
       ADC    $AF     ;3
       CMP    $AA     ;3
       BEQ    LFD7D   ;2
       LDA    #$00    ;2
       LDY    $83     ;3
       BEQ    LFD5C   ;2
       BMI    LFD5C   ;2
       ORA    #$08    ;2
LFD5C: LDY    $82     ;3
       BEQ    LFD64   ;2
       BMI    LFD64   ;2
       ORA    #$04    ;2
LFD64: LDY    $81     ;3
       BEQ    LFD6C   ;2
       BMI    LFD6C   ;2
       ORA    #$02    ;2
LFD6C: LDY    $80     ;3
       BEQ    LFD74   ;2
       BMI    LFD74   ;2
       ORA    #$01    ;2
LFD74: TAX            ;2
       LDA    $B4     ;3
       SEC            ;2
       SBC    LFF52,X ;4
       STA    $B4     ;3
LFD7D: LDA    $B0     ;3
       AND    #$0F    ;2
       CMP    #$03    ;2
       BCC    LFD1A   ;2
       LDA    #$20    ;2
       LDX    #$FC    ;2
       LDY    $A9     ;3
       CPY    $AA     ;3
       BEQ    LFD95   ;2
       BCC    LFD95   ;2
       LDA    #$A0    ;2
       LDX    #$04    ;2
LFD95: STA    $B8     ;3
       STX    $B3     ;3
       LDY    #$00    ;2
       LDA    $80     ;3
       BEQ    LFDA4   ;2
       EOR    $B8     ;3
       BNE    LFDB8   ;2
       INY            ;2
LFDA4: LDA    $84     ;3
       BEQ    LFDAD   ;2
       EOR    $B8     ;3
       BNE    LFDB8   ;2
       INY            ;2
LFDAD: CPY    #$01    ;2
       BNE    LFDB8   ;2
       LDA    $B4     ;3
       CLC            ;2
       ADC    $B3     ;3
       STA    $B4     ;3
LFDB8: LDY    #$00    ;2
       LDA    $9E     ;3
       BEQ    LFDC3   ;2
       EOR    $B8     ;3
       BNE    LFDD7   ;2
       INY            ;2
LFDC3: LDA    $A2     ;3
       BEQ    LFDCC   ;2
       EOR    $B8     ;3
       BNE    LFDD7   ;2
       INY            ;2
LFDCC: CPY    #$01    ;2
       BNE    LFDD7   ;2
       LDA    $B4     ;3
       CLC            ;2
       ADC    $B3     ;3
       STA    $B4     ;3
LFDD7: LDA    $B9     ;3
       BEQ    LFDE7   ;2
       LDA    $93     ;3
       BPL    LFDE1   ;2
       INC    $B4     ;5
LFDE1: LDA    $94     ;3
       BPL    LFDE7   ;2
       INC    $B4     ;5
LFDE7: LDA    $B0     ;3
       AND    #$0C    ;2
       BEQ    LFE1E   ;2
       LDA    $A9     ;3
       CLC            ;2
       ADC    $AA     ;3
       CMP    #$19    ;2
       BCS    LFE1E   ;2
       LDA    $A9     ;3
       SEC            ;2
       SBC    $AE     ;3
       SEC            ;2
       SBC    $AA     ;3
       CLC            ;2
       ADC    $AF     ;3
       BNE    LFE1E   ;2
       LDY    #$0F    ;2
       LDA    #$00    ;2
       STA    $B3     ;3
LFE09: LDX    LFF75,Y ;4
       LDA    $80,X   ;4
       BEQ    LFE12   ;2
       INC    $B3     ;5
LFE12: DEY            ;2
       BPL    LFE09   ;2
       ROR    $B3     ;5
       ROR            ;2
       EOR    $BB     ;3
       BMI    LFE1E   ;2
       INC    $B4     ;5
LFE1E: LDX    $BC     ;3
       LDA    $B4     ;3
       CLC            ;2
       ADC    $B5     ;3
       STA    $DF,X   ;4
       LDA    #$00    ;2
       LDY    $B4     ;3
       BPL    LFE2F   ;2
       LDA    #$FF    ;2
LFE2F: ADC    $B6     ;3
       STA    $EC,X   ;4
       LDA    $BB     ;3
       BMI    LFE3E   ;2
       LDA    $B0     ;3
       CMP    #$10    ;2
       BCC    LFE46   ;2
       RTS            ;6

LFE3E: LDX    $BC     ;3
       LDA    $B0     ;3
       CMP    #$10    ;2
       BCC    LFE53   ;2
LFE46: SEC            ;2
       LDA    #$00    ;2
       SBC    $DF,X   ;4
       STA    $DF,X   ;4
       LDA    #$00    ;2
       SBC    $EC,X   ;4
       STA    $EC,X   ;4
LFE53: SEC            ;2
       RTS            ;6

LFE55: LDY    #$FE    ;2
       TAX            ;2
       BPL    LFE5B   ;2
       DEY            ;2
LFE5B: LDA    $BB     ;3
       EOR    #$80    ;2
       ASL            ;2
       ROL            ;2
       TAX            ;2
       TYA            ;2
       ADC    $A9,X   ;4
       STA    $A9,X   ;4
       CPY    #$FD    ;2
       BNE    LFE6D   ;2
       DEC    $AE,X   ;6
LFE6D: RTS            ;6

LFE6E: LDY    #$00    ;2
       LDX    $BC     ;3
       DEX            ;2
       BNE    LFE7F   ;2
       LDA    $BE     ;3
       LSR            ;2
       ROR            ;2
       ROR            ;2
       ORA    $AC     ;3
       STA    $C5     ;3
       RTS            ;6

LFE7F: DEX            ;2
       TXA            ;2
       PHA            ;3
       LSR            ;2
       LSR            ;2
       TAX            ;2
       INX            ;2
       PLA            ;4
       AND    #$03    ;2
       TAY            ;2
       LDA    $BE     ;3
       STY    $B3     ;3
LFE8E: CPY    #$03    ;2
       BCS    LFE97   ;2
       ASL            ;2
       ASL            ;2
       INY            ;2
       BCC    LFE8E   ;2
LFE97: LDY    $B3     ;3
       EOR    $C5,X   ;4
       AND    LFF4A,Y ;4
       EOR    $C5,X   ;4
       STA    $C5,X   ;4
       RTS            ;6

LFEA3: LDA    $BD     ;3
       AND    #$C0    ;2
       ORA    $A7     ;3
       ORA    $A8     ;3
       ORA    $BE     ;3
       EOR    $A3     ;3
       AND    #$CF    ;2
       EOR    $A3     ;3
LFEB3: INC    $BC     ;5
       LDX    $BC     ;3
       STA    $D1,X   ;4
       LDA    $AC     ;3
       ORA    $BF     ;3
       STA    $C6,X   ;4
       RTS            ;6

LFEC0: CMP    #$90    ;2
       BNE    LFECE   ;2
       CPX    #$04    ;2
       BCS    LFEE0   ;2
       INC    $AA     ;5
       INC    $AF     ;5
       BCC    LFEDA   ;2
LFECE: CMP    #$10    ;2
       BNE    LFEE0   ;2
       CPX    #$1F    ;2
       BCC    LFEE0   ;2
       INC    $A9     ;5
       INC    $AE     ;5
LFEDA: AND    #$80    ;2
       ORA    #$20    ;2
       SEC            ;2
       RTS            ;6

LFEE0: CLC            ;2
       RTS            ;6

LFEE2: JSR    LFAE6   ;6
LFEE5: LDY    #$08    ;2
       STY    $E9     ;3
       LDY    #$00    ;2
       STY    $E4     ;3
       RTS            ;6

LFEEE: .byte $80 ; |X       | $FEEE
       .byte $55 ; | X X X X| $FEEF
       .byte $40 ; | X      | $FEF0
       .byte $33 ; |  XX  XX| $FEF1
       .byte $2B ; |  X X XX| $FEF2
       .byte $25 ; |  X  X X| $FEF3

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



LFF3E: .byte $00 ; |        | $FF3E
       .byte $00 ; |        | $FF3F
LFF40: .byte $FD ; |XXXXXX X| $FF40
       .byte $01 ; |       X| $FF41
       .byte $02 ; |      X | $FF42
LFF43: .byte $00 ; |        | $FF43
       .byte $00 ; |        | $FF44
LFF45: .byte $FF ; |XXXXXXXX| $FF45
       .byte $01 ; |       X| $FF46
       .byte $00 ; |        | $FF47
       .byte $00 ; |        | $FF48
       .byte $00 ; |        | $FF49
LFF4A: .byte $C0 ; |XX      | $FF4A
       .byte $30 ; |  XX    | $FF4B
       .byte $0C ; |    XX  | $FF4C
       .byte $03 ; |      XX| $FF4D
LFF4E: .byte $A0 ; |X X     | $FF4E
       .byte $90 ; |X  X    | $FF4F
       .byte $20 ; |  X     | $FF50
       .byte $10 ; |   X    | $FF51
LFF52: .byte $00 ; |        | $FF52
       .byte $02 ; |      X | $FF53
       .byte $02 ; |      X | $FF54
       .byte $06 ; |     XX | $FF55
       .byte $02 ; |      X | $FF56
       .byte $0C ; |    XX  | $FF57
       .byte $04 ; |     X  | $FF58
       .byte $0C ; |    XX  | $FF59
       .byte $02 ; |      X | $FF5A
       .byte $06 ; |     XX | $FF5B
       .byte $08 ; |    X   | $FF5C
       .byte $0A ; |    X X | $FF5D
       .byte $02 ; |      X | $FF5E
       .byte $0C ; |    XX  | $FF5F
       .byte $08 ; |    X   | $FF60
       .byte $0C ; |    XX  | $FF61
LFF62: .byte $05 ; |     X X| $FF62
       .byte $09 ; |    X  X| $FF63
       .byte $06 ; |     XX | $FF64
       .byte $0A ; |    X X | $FF65
LFF66: .byte $FB ; |XXXXX XX| $FF66
       .byte $FC ; |XXXXXX  | $FF67
       .byte $04 ; |     X  | $FF68
       .byte $05 ; |     X X| $FF69
       .byte $F6 ; |XXXX XX | $FF6A
       .byte $F8 ; |XXXXX   | $FF6B
       .byte $08 ; |    X   | $FF6C
       .byte $0A ; |    X X | $FF6D
LFF6E: .byte $59 ; | X XX  X| $FF6E
       .byte $19 ; |   XX  X| $FF6F
       .byte $58 ; | X XX   | $FF70
       .byte $18 ; |   XX   | $FF71
       .byte $57 ; | X X XXX| $FF72
       .byte $56 ; | X X XX | $FF73
       .byte $57 ; | X X XXX| $FF74
LFF75: .byte $17 ; |   X XXX| $FF75
       .byte $06 ; |     XX | $FF76
       .byte $07 ; |     XXX| $FF77
       .byte $0D ; |    XX X| $FF78
       .byte $10 ; |   X    | $FF79
       .byte $16 ; |   X XX | $FF7A
       .byte $1F ; |   XXXXX| $FF7B
       .byte $20 ; |  X     | $FF7C
       .byte $21 ; |  X    X| $FF7D
LFF7E: .byte $04 ; |     X  | $FF7E
       .byte $05 ; |     X X| $FF7F
       .byte $0E ; |    XXX | $FF80
       .byte $0F ; |    XXXX| $FF81
       .byte $18 ; |   XX   | $FF82
       .byte $19 ; |   XX  X| $FF83
       .byte $22 ; |  X   X | $FF84
       .byte $00 ; |        | $FF85
       .byte $09 ; |    X  X| $FF86
       .byte $0A ; |    X X | $FF87
       .byte $13 ; |   X  XX| $FF88
       .byte $14 ; |   X X  | $FF89
       .byte $1D ; |   XXX X| $FF8A
       .byte $1E ; |   XXXX | $FF8B

       .byte $0E ; |    XXX | $FF8C
       .byte $0A ; |    X X | $FF8D
       .byte $0A ; |    X X | $FF8E
       .byte $0A ; |    X X | $FF8F
       .byte $0E ; |    XXX | $FF90

       .byte $EE ; |XXX XXX | $FF91
       .byte $44 ; | X   X  | $FF92
       .byte $44 ; | X   X  | $FF93
       .byte $CC ; |XX  XX  | $FF94
       .byte $44 ; | X   X  | $FF95

       .byte $EE ; |XXX XXX | $FF96
       .byte $88 ; |X   X   | $FF97
       .byte $EE ; |XXX XXX | $FF98
       .byte $22 ; |  X   X | $FF99
       .byte $EE ; |XXX XXX | $FF9A

       .byte $EE ; |XXX XXX | $FF9B
       .byte $22 ; |  X   X | $FF9C
       .byte $66 ; | XX  XX | $FF9D
       .byte $22 ; |  X   X | $FF9E
       .byte $EE ; |XXX XXX | $FF9F

       .byte $22 ; |  X   X | $FFA0
       .byte $22 ; |  X   X | $FFA1
       .byte $EE ; |XXX XXX | $FFA2
       .byte $AA ; |X X X X | $FFA3
       .byte $AA ; |X X X X | $FFA4

       .byte $EE ; |XXX XXX | $FFA5
       .byte $22 ; |  X   X | $FFA6
       .byte $EE ; |XXX XXX | $FFA7
       .byte $88 ; |X   X   | $FFA8
       .byte $EE ; |XXX XXX | $FFA9

       .byte $EE ; |XXX XXX | $FFAA
       .byte $AA ; |X X X X | $FFAB
       .byte $EE ; |XXX XXX | $FFAC
       .byte $88 ; |X   X   | $FFAD
       .byte $EE ; |XXX XXX | $FFAE

       .byte $22 ; |  X   X | $FFAF
       .byte $22 ; |  X   X | $FFB0
       .byte $22 ; |  X   X | $FFB1
       .byte $22 ; |  X   X | $FFB2
       .byte $EE ; |XXX XXX | $FFB3

       .byte $EE ; |XXX XXX | $FFB4
       .byte $AA ; |X X X X | $FFB5
       .byte $EE ; |XXX XXX | $FFB6
       .byte $AA ; |X X X X | $FFB7
       .byte $EE ; |XXX XXX | $FFB8

       .byte $EE ; |XXX XXX | $FFB9
       .byte $22 ; |  X   X | $FFBA
       .byte $EE ; |XXX XXX | $FFBB
       .byte $AA ; |X X X X | $FFBC
       .byte $EE ; |XXX XXX | $FFBD

       .byte $00 ; |        | $FFBE
       .byte $00 ; |        | $FFBF
       .byte $00 ; |        | $FFC0
       .byte $00 ; |        | $FFC1
       .byte $00 ; |        | $FFC2

       .byte $E4 ; |XXX  X  | $FFC3
       .byte $A4 ; |X X  X  | $FFC4
       .byte $27 ; |  X  XXX| $FFC5
       .byte $25 ; |  X  X X| $FFC6
       .byte $27 ; |  X  XXX| $FFC7

LFFC8: .byte $E0 ; |XXX     | $FFC8
LFFC9: .byte $FF ; |XXXXXXXX| $FFC9
       .byte $20 ; |  X     | $FFCA
LFFCB: .byte $00 ; |        | $FFCB
LFFCC: .byte $34 ; |  XX X  | $FFCC
       .byte $36 ; |  XX XX | $FFCD
       .byte $B0 ; |X XX    | $FFCE
       .byte $26 ; |  X  XX | $FFCF
       .byte $26 ; |  X  XX | $FFD0
LFFD1: LDX    $E9     ;3
       LDA    $A3     ;3
       JSR    LFFDF   ;6
       STA    $A3     ;3
       STA    $80,X   ;4
       STA    $E4     ;3
       RTS            ;6

LFFDF: JSR    LFEC0   ;6
       BCC    LFFE8   ;2
       LDY    #$00    ;2
       STY    $A5     ;3
LFFE8: RTS            ;6

LFFE9: LDA    #$36    ;2
LFFEB: LDY    #$04    ;2
LFFED: LDX    #$0F    ;2
LFFEF: STA    AUDF0   ;3
       STX    AUDV0   ;3
       STY    AUDC0   ;3
       RTS            ;6

LFFF6: .byte $00,$00,$00,$00,$00,$00,$00,$F1,$00,$00
