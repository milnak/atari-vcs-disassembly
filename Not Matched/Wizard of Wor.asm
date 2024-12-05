; Disassembly of wizrdwor.bin
; Disassembled Mon Mar 07 00:46:37 2005
; Using DiStella v2.0
;
; Command Line: C:\BIN\DISTELLA.EXE -pafscwizrdwor.cfg wizrdwor.bin 
;
; wizrdwor.cfg contents:
;
;      CODE F000 FDBD
;      GFX FDBE FFFF
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
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
RESM0   =  $12
RESM1   =  $13
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
HMP1    =  $21
HMM0    =  $22
HMM1    =  $23
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXM1P   =  $31
CXM0FB  =  $34
CXM1FB  =  $35
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

       ORG $F000

START:
       CLD                            ;2
       SEI                            ;2
       LDX    #$00                    ;2
       TXA                            ;2
LF005: STA    VSYNC,X                 ;4
       INX                            ;2
       BNE    LF005                   ;2
       DEX                            ;2
       TXS                            ;2
LF00C: LDA    #$02                    ;2
       STA    WSYNC                   ;3
       STA    VBLANK                  ;3
       LDA    #$24                    ;2
       STA    TIM64T                  ;4
       INC    $80                     ;5
       BNE    LF01D                   ;2
       INC    $8E                     ;5
LF01D: LDX    #$04                    ;2
       LDA    #$80                    ;2
LF021: STA    $E2,X                   ;4
       DEX                            ;2
       BPL    LF021                   ;2
       LDA    $93                     ;3
       BMI    LF030                   ;2
       BEQ    LF030                   ;2
       LDY    #$44                    ;2
       BNE    LF03A                   ;2
LF030: LDA    $8B                     ;3
       BEQ    LF038                   ;2
       LDY    #$2A                    ;2
       BNE    LF03A                   ;2
LF038: LDY    #$88                    ;2
LF03A: LDA    $8C                     ;3
       ORA    $8D                     ;3
       ORA    $D6                     ;3
       ORA    $D7                     ;3
       BNE    LF05A                   ;2
       STA    $89                     ;3
       NOP                            ;2
       NOP                            ;2
       TYA                            ;2
       EOR    $8E                     ;3
       AND    #$F6                    ;2
       STA    $EE                     ;3
       TAY                            ;2
       LDA    $8E                     ;3
       AND    #$F6                    ;2
       STA    COLUBK                  ;3
       LDA    #$01                    ;2
       STA    $83                     ;3
LF05A: STY    COLUPF                  ;3
       LDA    #$00                    ;2
       STA    $FA                     ;3
       STA    $FB                     ;3
       LDA    SWCHB                   ;4
       TAY                            ;2
       AND    #$01                    ;2
       BNE    LF071                   ;2
LF06A: STA    COLUBK                  ;3
       STA    $83                     ;3
       JMP    LF172                   ;3
LF071: TYA                            ;2
       AND    #$02                    ;2
       BEQ    LF07E                   ;2
       LDA    $82                     ;3
       BEQ    LF08F                   ;2
       DEC    $82                     ;5
       BEQ    LF084                   ;2
LF07E: LDA    #$01                    ;2
       STA    $82                     ;3
       BNE    LF08F                   ;2
LF084: INC    $81                     ;5
       LDA    $81                     ;3
       AND    #$01                    ;2
       STA    $81                     ;3
       LSR                            ;2
       BPL    LF06A                   ;2
LF08F: LDA    $89                     ;3
       BEQ    LF109                   ;2
       LDX    #$80                    ;2
       STX    $E7                     ;3
       CMP    #$01                    ;2
       BNE    LF09E                   ;2
LF09B: JMP    LF185                   ;3
LF09E: CMP    #$02                    ;2
       BNE    LF0A5                   ;2
       JMP    LF1E1                   ;3
LF0A5: LDA    $CD                     ;3
       CMP    $80                     ;3
       BNE    LF0C9                   ;2
       LDA    #$01                    ;2
       STA    $89                     ;3
       INC    $84                     ;5
       LDA    #$00                    ;2
       STA    $E0                     ;3
       STA    COLUBK                  ;3
       LDA    $D6                     ;3
       CMP    #$01                    ;2
       BNE    LF0BF                   ;2
       INC    $8C                     ;5
LF0BF: LDA    $D7                     ;3
       CMP    #$01                    ;2
       BNE    LF09B                   ;2
       INC    $8D                     ;5
       BNE    LF09B                   ;2
LF0C9: LDA    $94                     ;3
       BEQ    LF0D6                   ;2
       LDA    $80                     ;3
       LSR                            ;2
       STA    AUDF1                   ;3
       LDA    #$0C                    ;2
       BNE    LF0F8                   ;2
LF0D6: LDA    $95                     ;3
       BEQ    LF0E4                   ;2
       LDA    $80                     ;3
       STA    COLUBK                  ;3
       STA    AUDF1                   ;3
       LDA    #$01                    ;2
       BNE    LF0F8                   ;2
LF0E4: LDA    $93                     ;3
       BEQ    LF100                   ;2
       LDA    $80                     ;3
       AND    #$01                    ;2
       BNE    LF103                   ;2
       LDA    $91                     ;3
       BMI    LF100                   ;2
       STA    AUDF1                   ;3
       DEC    $91                     ;5
       LDA    #$03                    ;2
LF0F8: STA    AUDC1                   ;3
       LDA    #$08                    ;2
       STA    AUDV1                   ;3
       BNE    LF103                   ;2
LF100: JSR    LFCC7                   ;6
LF103: JMP    LF339                   ;3
LF106: JMP    LF825                   ;3
LF109: LDA    $8A                     ;3
       BEQ    LF106                   ;2
       LDX    #$05                    ;2
       LDY    #$00                    ;2
LF111: LDA    $D0,X                   ;4
       BMI    LF116                   ;2
       INY                            ;2
LF116: DEX                            ;2
       BPL    LF111                   ;2
       CPY    $8A                     ;3
       BCS    LF16F                   ;2
       LDA    $96                     ;3
       CMP    $97                     ;3
       BEQ    LF125                   ;2
       BCS    LF12F                   ;2
LF125: CMP    $8A                     ;3
       BEQ    LF135                   ;2
       INC    $96                     ;5
       LDA    #$02                    ;2
       BNE    LF159                   ;2
LF12F: INC    $97                     ;5
       LDA    #$03                    ;2
       BNE    LF159                   ;2
LF135: LDA    $8A                     ;3
       CMP    #$01                    ;2
       BEQ    LF16F                   ;2
       LDA    $93                     ;3
       BMI    LF16F                   ;2
       LDX    #$05                    ;2
LF141: LDA    $D0,X                   ;4
       BPL    LF16F                   ;2
       DEX                            ;2
       BPL    LF141                   ;2
       LDA    #$01                    ;2
       STA    $93                     ;3
       LDA    #$08                    ;2
       STA    $91                     ;3
       LDX    $80                     ;3
       BMI    LF155                   ;2
       LSR                            ;2
LF155: STA    $CC                     ;3
       LDA    #$04                    ;2
LF159: STA    $9A                     ;3
       LDX    #$00                    ;2
LF15D: LDA    $D0,X                   ;4
       BMI    LF166                   ;2
       INX                            ;2
       CPX    #$06                    ;2
       BNE    LF15D                   ;2
LF166: LDA    $80                     ;3
       JSR    LFD76                   ;6
       LDA    $9A                     ;3
       STA    $D0,X                   ;4
LF16F: JMP    LF203                   ;3
LF172: LDX    #$7C                    ;2
LF174: STA    $83,X                   ;4
       DEX                            ;2
       BPL    LF174                   ;2
       LDA    #$03                    ;2
       STA    $8D                     ;3
       LDX    $81                     ;3
       BEQ    LF183                   ;2
       STA    $8C                     ;3
LF183: INC    $89                     ;5
LF185: LDA    $E0                     ;3
       CMP    #$40                    ;2
       BCS    LF18F                   ;2
       LDA    #$1D                    ;2
       BNE    LF1A5                   ;2
LF18F: CMP    #$50                    ;2
       BCS    LF197                   ;2
       LDA    #$19                    ;2
       BNE    LF1A5                   ;2
LF197: CMP    #$90                    ;2
       BCS    LF19F                   ;2
       LDA    #$18                    ;2
       BNE    LF1A5                   ;2
LF19F: CMP    #$D0                    ;2
       BEQ    LF1BA                   ;2
       LDA    #$1D                    ;2
LF1A5: INC    $E0                     ;5
       STA    AUDF0                   ;3
       STA    AUDF1                   ;3
       LDA    #$0C                    ;2
       STA    AUDC0                   ;3
       LDA    #$04                    ;2
       STA    AUDC1                   ;3
       ASL                            ;2
       STA    AUDV0                   ;3
       STA    AUDV1                   ;3
       BNE    LF1DE                   ;2
LF1BA: JSR    LFCC7                   ;6
       LDX    #$71                    ;2
       LDA    #$00                    ;2
LF1C1: STA    $8E,X                   ;4
       DEX                            ;2
       BPL    LF1C1                   ;2
       LDA    $84                     ;3
       LSR                            ;2
       CMP    #$04                    ;2
       BCC    LF1CF                   ;2
       LDA    #$04                    ;2
LF1CF: TAX                            ;2
       LDA    LFFE4,X                 ;4
       STA    $8E                     ;3
       LDA    LFFE9,X                 ;4
       STA    $90                     ;3
       LDA    #$02                    ;2
LF1DC: STA    $89                     ;3
LF1DE: JMP    LF825                   ;3
LF1E1: LDX    #$05                    ;2
       LDA    #$F0                    ;2
       STA    $E1                     ;3
LF1E7: LDY    $80                     ;3
       LDA    ($E0),Y                 ;5
       AND    #$3F                    ;2
       JSR    LFD88                   ;6
       INC    $D0,X                   ;6
       INC    $E1                     ;5
       DEX                            ;2
       BPL    LF1E7                   ;2
       LDA    $8A                     ;3
       CMP    #$06                    ;2
       BEQ    LF1FF                   ;2
       INC    $8A                     ;5
LF1FF: LDA    #$00                    ;2
       BEQ    LF1DC                   ;2
LF203: LDA    $80                     ;3
       AND    #$01                    ;2
       TAX                            ;2
       LDA    CXM0FB                  ;3
       BPL    LF20F                   ;2
       JSR    LFCAA                   ;6
LF20F: LDA    CXM1FB                  ;3
       BMI    LF21D                   ;2
       LDA    $A7                     ;3
       CMP    #$10                    ;2
       BCC    LF21D                   ;2
       CMP    #$94                    ;2
       BCC    LF220                   ;2
LF21D: JSR    LFCD1                   ;6
LF220: LDA    #$00                    ;2
       STA    $9A                     ;3
       LDA    $9E,X                   ;4
       BNE    LF22B                   ;2
       JMP    LF2D0                   ;3
LF22B: LDY    #$05                    ;2
LF22D: LDA.wy $D0,Y                   ;4
       BEQ    LF285                   ;2
       LDA.wy $C0,Y                   ;4
       BMI    LF285                   ;2
       LDA.wy $A8,Y                   ;4
       CMP    $A2,X                   ;4
       BCC    LF285                   ;2
       SBC    $A2,X                   ;4
       CMP    #$10                    ;2
       BCS    LF285                   ;2
       LDA    $A0,X                   ;4
       CMP.wy $B0,Y                   ;4
       BEQ    LF24D                   ;2
       BCC    LF285                   ;2
LF24D: SBC.wy $B0,Y                   ;4
       CMP    #$09                    ;2
       BCS    LF285                   ;2
       LDA    #$FF                    ;2
       STA.wy $C0,Y                   ;5
       STA.wy $D8,Y                   ;5
       LDA    #$00                    ;2
       STA.wy $B8,Y                   ;5
       INC    $9A                     ;5
       LDA    $A6                     ;3
       BEQ    LF26E                   ;2
       CPY    $A5                     ;3
       BNE    LF26E                   ;2
       JSR    LFCD1                   ;6
LF26E: TYA                            ;2
       PHA                            ;3
       LDA.wy $D0,Y                   ;4
       TAY                            ;2
       LDA    $8B                     ;3
       BEQ    LF27D                   ;2
       LDA    LFF54,Y                 ;4
       BNE    LF280                   ;2
LF27D: LDA    LFF4F,Y                 ;4
LF280: JSR    LFDB0                   ;6
       PLA                            ;4
       TAY                            ;2
LF285: DEY                            ;2
       BPL    LF22D                   ;2
       LDA    $9A                     ;3
       BEQ    LF28F                   ;2
       JSR    LFCAA                   ;6
LF28F: TXA                            ;2
       EOR    #$01                    ;2
       TAY                            ;2
       LDA.wy $D6,Y                   ;4
       BEQ    LF2D0                   ;2
       BMI    LF2D0                   ;2
       LDA.wy $AE,Y                   ;4
       CMP    $A2,X                   ;4
       BCC    LF2D0                   ;2
       SBC    $A2,X                   ;4
       CMP    #$10                    ;2
       BCS    LF2D0                   ;2
       LDA    $A0,X                   ;4
       CMP.wy $B6,Y                   ;4
       BEQ    LF2B7                   ;2
       BCC    LF2D0                   ;2
       SBC.wy $B6,Y                   ;4
       CMP    #$09                    ;2
       BCS    LF2D0                   ;2
LF2B7: LDA    $8B                     ;3
       BEQ    LF2BF                   ;2
       LDA    #$20                    ;2
       BNE    LF2C1                   ;2
LF2BF: LDA    #$10                    ;2
LF2C1: JSR    LFDB0                   ;6
       LDX    #$00                    ;2
       JSR    LFCAA                   ;6
       INX                            ;2
       JSR    LFCAA                   ;6
       JMP    LF31E                   ;3
LF2D0: LDA    CXM1P                   ;3
       BPL    LF2DE                   ;2
       JSR    LFCD1                   ;6
       LDA    $80                     ;3
       AND    #$01                    ;2
       TAY                            ;2
       BPL    LF31E                   ;2
LF2DE: LDA    $80                     ;3
       AND    #$01                    ;2
       TAY                            ;2
       LDX    #$05                    ;2
LF2E5: LDA    $D0,X                   ;4
       BEQ    LF304                   ;2
       BMI    LF304                   ;2
       LDA    $C0,X                   ;4
       BMI    LF304                   ;2
       LDA.wy $B6,Y                   ;4
       CMP    $B0,X                   ;4
       BCS    LF2FE                   ;2
       SEC                            ;2
       LDA    $B0,X                   ;4
       SBC.wy $B6,Y                   ;4
       BNE    LF300                   ;2
LF2FE: SBC    $B0,X                   ;4
LF300: CMP    #$04                    ;2
       BCC    LF309                   ;2
LF304: DEX                            ;2
       BPL    LF2E5                   ;2
       BMI    LF339                   ;2
LF309: LDA.wy $AE,Y                   ;4
       CMP    $A8,X                   ;4
       BCS    LF318                   ;2
       SEC                            ;2
       LDA    $A8,X                   ;4
       SBC.wy $AE,Y                   ;4
       BNE    LF31A                   ;2
LF318: SBC    $A8,X                   ;4
LF31A: CMP    #$04                    ;2
       BCS    LF304                   ;2
LF31E: TYA                            ;2
       TAX                            ;2
       LDA    $D6,X                   ;4
       BMI    LF339                   ;2
       LDA    #$80                    ;2
       STA    $D6,X                   ;4
       LDA    #$00                    ;2
       STA    $A4                     ;3
       STA    $C6,X                   ;4
       STA    $BE,X                   ;4
       STA    $CE,X                   ;4
       LDA    #$0F                    ;2
       STA    $F2                     ;3
       JSR    LFCAA                   ;6
LF339: STA    CXCLR                   ;3
       LDA    $80                     ;3
       AND    #$01                    ;2
       TAY                            ;2
       EOR    #$01                    ;2
       TAX                            ;2
       LSR                            ;2
       LDA    LFF70,Y                 ;4
       STA    $EE                     ;3
       LDA    SWCHA                   ;4
       JSR    LFD3F                   ;6
       EOR    #$0F                    ;2
       TAY                            ;2
       AND    #$03                    ;2
       BNE    LF357                   ;2
       TYA                            ;2
LF357: STA    $9B                     ;3
       LDA    $89                     ;3
       BEQ    LF363                   ;2
       LDA    $D6,X                   ;4
       BMI    LF3A1                   ;2
       BPL    LF39C                   ;2
LF363: LDA    $D6,X                   ;4
       BNE    LF39F                   ;2
       LDA    $9B                     ;3
       BNE    LF37B                   ;2
       LDA    $9C,X                   ;4
       CMP    #$05                    ;2
       BEQ    LF37B                   ;2
       LDA    $80                     ;3
       LSR                            ;2
       BNE    LF378                   ;2
       INC    $9C,X                   ;6
LF378: JMP    LF55E                   ;3
LF37B: LDA    $8C,X                   ;4
       BEQ    LF378                   ;2
       INC    $D6,X                   ;6
       LDA    #$12                    ;2
       STA    $AE,X                   ;4
       LDA    LFFD7,X                 ;4
       STA    $B6,X                   ;4
       LDA    LFFD9,X                 ;4
       STA    $BE,X                   ;4
       LDA    #$00                    ;2
       STA    $CE,X                   ;4
       STA    $C6,X                   ;4
       LDA    LFFD5,X                 ;4
       STA    $9C,X                   ;4
       DEC    $8C,X                   ;6
LF39C: JMP    LF479                   ;3
LF39F: BPL    LF401                   ;2
LF3A1: LDA    $BE,X                   ;4
       CMP    #$03                    ;2
       BNE    LF3AD                   ;2
       LDA    #$00                    ;2
       STA    $BE,X                   ;4
       INC    $C6,X                   ;6
LF3AD: INC    $BE,X                   ;6
       LDA    $C6,X                   ;4
       CMP    #$0B                    ;2
       BEQ    LF3D4                   ;2
       TAY                            ;2
       AND    #$01                    ;2
       BEQ    LF3BE                   ;2
       INC    $F2                     ;5
       BNE    LF3C0                   ;2
LF3BE: DEC    $F2                     ;5
LF3C0: LDA    #$14                    ;2
       STA    AUDC0                   ;3
       LDA    $F2                     ;3
       STA    AUDF0                   ;3
       LDA    #$08                    ;2
       STA    AUDV0                   ;3
       LDA    LFF68,Y                 ;4
       STA    $EE                     ;3
       JMP    LF479                   ;3
LF3D4: JSR    LFCBE                   ;6
       STA    $BE,X                   ;4
       STA    $C6,X                   ;4
       STA    $AE,X                   ;4
       STA    $B6,X                   ;4
       STA    $D6,X                   ;4
       STA    $9C,X                   ;4
       STA    $A4                     ;3
       STA    $F2                     ;3
       LDA    $93                     ;3
       CMP    #$02                    ;2
       BNE    LF378                   ;2
       LDA    $95                     ;3
       ORA    $94                     ;3
       STA    $8B                     ;3
       LDY    #$FF                    ;2
       STY    $93                     ;3
       STY    $D0                     ;3
       INY                            ;2
       STY    $94                     ;3
       STY    $95                     ;3
       JMP    LF76B                   ;3
LF401: TXA                            ;2
       ORA    #$06                    ;2
       TAX                            ;2
       JSR    LFCDC                   ;6
       LDA    $9A                     ;3
       BMI    LF42D                   ;2
       LDA    $9B                     ;3
       BEQ    LF427                   ;2
       JSR    LFD4C                   ;6
       PHP                            ;3
       TXA                            ;2
       AND    #$01                    ;2 <-
       TAX                            ;2
       PLP                            ;4
       BCS    LF427                   ;2
       LDA    $9B                     ;3
       BIT    $9A                     ;3
       BEQ    LF427                   ;2
       STA    $9C,X                   ;4
       STA    $C6,X                   ;4
       BNE    LF44B                   ;2
LF427: TXA                            ;2
       AND    #$01                    ;2 <-
       TAX                            ;2
       BPL    LF479                   ;2
LF42D: TXA                            ;2
       AND    #$01                    ;2 <-
       TAX                            ;2
       LDA    $9B                     ;3
       BEQ    LF427                   ;2
       CMP    $9C,X                   ;4
       BEQ    LF44B                   ;2
       LDA    $9C,X                   ;4
       TAY                            ;2
       LDA    LFF5A,Y                 ;4
       ORA    $9B                     ;3
       CMP    #$0F                    ;2
       BNE    LF44B                   ;2
       LDA    $9B                     ;3
       STA    $9C,X                   ;4
       BNE    LF479                   ;2
LF44B: LDA    $C6,X                   ;4
       STA    $9A                     ;3
       LDA    $9C,X                   ;4
       BIT    $9A                     ;3
       BNE    LF459                   ;2
       DEC    $CE,X                   ;6
       BPL    LF45B                   ;2
LF459: INC    $CE,X                   ;6
LF45B: CMP    #$01                    ;2
       BNE    LF465                   ;2
       INC    $AE,X                   ;6
       INC    $AE,X                   ;6
       BNE    LF479                   ;2
LF465: CMP    #$02                    ;2
       BNE    LF46F                   ;2
       DEC    $AE,X                   ;6
       DEC    $AE,X                   ;6
       BNE    LF479                   ;2
LF46F: CMP    #$04                    ;2
       BNE    LF477                   ;2
       DEC    $B6,X                   ;6
       BNE    LF479                   ;2
LF477: INC    $B6,X                   ;6
LF479: LDA    $B6,X                   ;4
       STA    $E8                     ;3
       LDA    $AE,X                   ;4
       STA    $E2                     ;3
       LDA    $D6,X                   ;4
       BPL    LF491                   ;2
       LDA    $C6,X                   ;4
       CMP    #$08                    ;2
       BCC    LF491                   ;2
       CMP    #$09                    ;2
       LDY    #$48                    ;2
       BNE    LF4B0                   ;2
LF491: LDA    $9C,X                   ;4
       CMP    #$01                    ;2
       BNE    LF49B                   ;2
       LDY    #$24                    ;2
       BNE    LF4AC                   ;2
LF49B: CMP    #$02                    ;2
       BNE    LF4A3                   ;2
       LDY    #$36                    ;2
       BNE    LF4AC                   ;2
LF4A3: CMP    #$04                    ;2
       BNE    LF4AA                   ;2
       ASL                            ;2
       STA    $FA                     ;3
LF4AA: LDY    #$12                    ;2
LF4AC: LDA    $CE,X                   ;4
       LSR                            ;2
       LSR                            ;2
LF4B0: BCC    LF4B3                   ;2
       INY                            ;2
LF4B3: TYA                            ;2
       SEC                            ;2
       SBC    $E2                     ;3
       STA    $DE                     ;3
       LDA    #$FE                    ;2
       SBC    #$00                    ;2
       STA    $DF                     ;3
       LDA    $87,X                   ;4
       BEQ    LF4CD                   ;2
       BMI    LF4CD                   ;2
       INC    $8C,X                   ;6
       LDA    #$80                    ;2
       ORA    $87,X                   ;4
       STA    $87,X                   ;4
LF4CD: LDA    $89                     ;3
       BEQ    LF4D4                   ;2
       JMP    LF825                   ;3
LF4D4: LDA    $D6                     ;3
       ORA    $D7                     ;3
       BMI    LF4EF                   ;2
       LDA    $A4                     ;3
       BEQ    LF4EF                   ;2
       CMP    #$1F                    ;2
       BEQ    LF4EA                   ;2
       INC    $A4                     ;5
       LDA    $A4                     ;3
       STA    AUDF0                   ;3
       BNE    LF4EF                   ;2
LF4EA: JSR    LFCBE                   ;6
       STA    $A4                     ;3
LF4EF: LDA    $D6,X                   ;4
       BMI    LF55E                   ;2
       LDA    $9E,X                   ;4
       BNE    LF51C                   ;2
       LDA    INPT4,X                 ;4
       BMI    LF55E                   ;2
       CLC                            ;2
       LDA    $B6,X                   ;4
       ADC    #$05                    ;2
       STA    $A0,X                   ;4
       STA    $EA                     ;3
       SEC                            ;2
       LDA    $AE,X                   ;4
       SBC    #$0B                    ;2
       STA    $A2,X                   ;4
       STA    $E6                     ;3
       LDA    #$04                    ;2
       STA    AUDC0                   ;3
       ASL                            ;2
       STA    AUDV0                   ;3
       LDA    #$05                    ;2
       STA    $A4                     ;3
       LDA    $9C,X                   ;4
       STA    $9E,X                   ;4
LF51C: CMP    #$01                    ;2
       BNE    LF524                   ;2
       LDA    #$03                    ;2
       BNE    LF52A                   ;2
LF524: CMP    #$02                    ;2
       BNE    LF538                   ;2
       LDA    #$FB                    ;2
LF52A: ADC    $A2,X                   ;4
       BMI    LF55B                   ;2
       STA    $A2,X                   ;4
       STA    $E6                     ;3
       LDA    $A0,X                   ;4
       STA    $EA                     ;3
       BNE    LF55E                   ;2
LF538: CMP    #$04                    ;2
       BNE    LF540                   ;2
       LDA    #$FE                    ;2
       BNE    LF546                   ;2
LF540: CMP    #$08                    ;2
       BNE    LF55E                   ;2
       LDA    #$02                    ;2
LF546: CLC                            ;2
       ADC    $A0,X                   ;4
       STA    $A0,X                   ;4
       CMP    #$10                    ;2
       BCC    LF55B                   ;2
       CMP    #$94                    ;2
       BCS    LF55B                   ;2
       STA    $EA                     ;3
       LDA    $A2,X                   ;4
       STA    $E6                     ;3
       BCC    LF55E                   ;2
LF55B: JSR    LFCAA                   ;6
LF55E: LDA    $A6                     ;3
       BEQ    LF587                   ;2
       LDA    $A6                     ;3
       CMP    #$01                    ;2
       BNE    LF56E                   ;2
       INC    $E7                     ;5
       INC    $E7                     ;5
       BNE    LF583                   ;2
LF56E: CMP    #$02                    ;2
       BNE    LF579                   ;2
       DEC    $E7                     ;5
       DEC    $E7                     ;5
       JMP    LF583                   ;3
LF579: CMP    #$04                    ;2
       BNE    LF581                   ;2
       DEC    $A7                     ;5
       BNE    LF583                   ;2
LF581: INC    $A7                     ;5
LF583: LDA    $A7                     ;3
       STA    $EB                     ;3
LF587: LDA    $83                     ;3
       BNE    LF60A                   ;2
       LDA    $93                     ;3
       BEQ    LF5BD                   ;2
       LDA    $80                     ;3
       AND    #$07                    ;2
       BNE    LF5B1                   ;2
       LDA    $91                     ;3
       CMP    #$18                    ;2
       BNE    LF59F                   ;2
       LDA    #$10                    ;2
       STA    $91                     ;3
LF59F: STA    AUDF1                   ;3
       LDA    #$08                    ;2
       STA    AUDV1                   ;3
       LDA    #$01                    ;2
       STA    AUDC1                   ;3
       INC    $91                     ;5
       LDA    $93                     ;3
       CMP    #$02                    ;2
       BEQ    LF5BA                   ;2
LF5B1: LDA    $80                     ;3
       AND    #$03                    ;2
       BEQ    LF5BA                   ;2
       JMP    LF730                   ;3
LF5BA: JMP    LF60D                   ;3
LF5BD: LDA    $8F                     ;3
       CMP    $90                     ;3
       BNE    LF606                   ;2
       LDA    $90                     ;3
       CMP    #$03                    ;2
       BEQ    LF5DC                   ;2
       LDA    $8E                     ;3
       LDX    #$04                    ;2
LF5CD: CMP    LFFE4,X                 ;4
       BEQ    LF5D7                   ;2
       DEX                            ;2
       BPL    LF5CD                   ;2
       BMI    LF5DC                   ;2
LF5D7: LDA    LFFE9,X                 ;4
       STA    $90                     ;3
LF5DC: LDA    #$00                    ;2
       STA    $8F                     ;3
       LDA    $92                     ;3
       BNE    LF5F6                   ;2
       LDA    $91                     ;3
       CMP    #$07                    ;2
       BNE    LF5EE                   ;2
       LDA    #$09                    ;2
       BNE    LF5F0                   ;2
LF5EE: LDA    #$07                    ;2
LF5F0: STA    $91                     ;3
       LDA    #$05                    ;2
       STA    $92                     ;3
LF5F6: DEC    $92                     ;5
       LDA    #$03                    ;2
       STA    AUDC1                   ;3
       LDA    $91                     ;3
       STA    AUDF1                   ;3
       LDA    $92                     ;3
       STA    AUDV1                   ;3
       LDA    $8F                     ;3
LF606: CMP    #$03                    ;2
       BCC    LF60D                   ;2
LF60A: JMP    LF730                   ;3
LF60D: TAX                            ;2
       CLC                            ;2
       ADC    #$06                    ;2
       STA    $9B                     ;3
LF613: LDA    $D0,X                   ;4
       BNE    LF61A                   ;2
LF617: JMP    LF726                   ;3
LF61A: LDA    $C0,X                   ;4
       BMI    LF617                   ;2
       LDA    $A6                     ;3
       BEQ    LF625                   ;2
       JMP    LF6A6                   ;3
LF625: LDA    #$80                    ;2
       STA    $E7                     ;3
       LDA    $D0,X                   ;4
       BMI    LF675                   ;2
       CMP    #$04                    ;2
       BEQ    LF675                   ;2
       CMP    #$05                    ;2
       BNE    LF63B                   ;2
       LDA    $C8,X                   ;4
       CMP    #$07                    ;2
       BCS    LF6A6                   ;2
LF63B: LDA    $B0,X                   ;4
       LDY    #$00                    ;2
       CMP.wy $B6,Y                   ;4
       BEQ    LF64A                   ;2
       INY                            ;2
       CMP.wy $B6,Y                   ;4
       BNE    LF659                   ;2
LF64A: LDA    $A8,X                   ;4
       CMP.wy $AE,Y                   ;4
       BCC    LF655                   ;2
       LDA    #$02                    ;2
       BNE    LF690                   ;2
LF655: LDA    #$01                    ;2
       BNE    LF690                   ;2
LF659: LDA    $A8,X                   ;4
       CMP.wy $AE,Y                   ;4
       BEQ    LF666                   ;2
       DEY                            ;2
       CMP.wy $AE,Y                   ;4
       BNE    LF675                   ;2
LF666: LDA    $B0,X                   ;4
       CMP.wy $B6,Y                   ;4
       BCC    LF671                   ;2
       LDA    #$04                    ;2
       BNE    LF690                   ;2
LF671: LDA    #$08                    ;2
       BNE    LF690                   ;2
LF675: LDA    $D0,X                   ;4
       CMP    #$05                    ;2
       BNE    LF6A6                   ;2
       LDA    $C0,X                   ;4
       AND    #$03                    ;2
       BEQ    LF685                   ;2
       LDA    #$02                    ;2
       BNE    LF687                   ;2
LF685: LDA    #$08                    ;2
LF687: CMP    $CB                     ;3
       BNE    LF68C                   ;2
       LSR                            ;2
LF68C: STA    $CB                     ;3
       BNE    LF694                   ;2
LF690: CMP    $C0,X                   ;4
       BNE    LF675                   ;2
LF694: STA    $A6                     ;3
       STX    $A5                     ;3
       CLC                            ;2
       LDA    $B0,X                   ;4
       ADC    #$05                    ;2
       STA    $A7                     ;3
       SEC                            ;2
       LDA    $A8,X                   ;4
       SBC    #$0B                    ;2
       STA    $E7                     ;3
LF6A6: JSR    LFCDC                   ;6
       LDA    $9A                     ;3
       BMI    LF6FE                   ;2
       LDA    $C0,X                   ;4
       JSR    LFD4C                   ;6
       BCC    LF6CA                   ;2
       STA    $C0,X                   ;4
       LDA    $D0,X                   ;4
       CMP    #$04                    ;2
       BCC    LF726                   ;2
       LDY    #$00                    ;2
       STY    $8B                     ;3
       DEY                            ;2
       STY    $93                     ;3
       STY    $A8,X                   ;4
       STY    $D0,X                   ;4
       JMP    LF78D                   ;3
LF6CA: LDA    $C0,X                   ;4
       TAY                            ;2
       LDA    LFF5A,Y                 ;4
       AND    $9A                     ;3
       STA    $9A                     ;3
       LDA    $93                     ;3
       CMP    #$01                    ;2
       BNE    LF6E0                   ;2
       LDA    $CC                     ;3
       BIT    $9A                     ;3
       BNE    LF6EB                   ;2
LF6E0: LDY    $80                     ;3
       LDA    START,Y                 ;4
       AND    $9A                     ;3
       BNE    LF6EB                   ;2
       LDA    $9A                     ;3
LF6EB: LDY    #$00                    ;2
LF6ED: LSR                            ;2
       BCS    LF6F5                   ;2
       INY                            ;2
       CPY    #$04                    ;2
       BNE    LF6ED                   ;2
LF6F5: LDA    LFFDB,Y                 ;4
       STA    $C0,X                   ;4
       LDA    #$00                    ;2
       STA    $C8,X                   ;4
LF6FE: INC    $C8,X                   ;6
       INC    $C8,X                   ;6
       LDA    $A8,X                   ;4
       LDY    $C0,X                   ;4
       CPY    #$01                    ;2
       BNE    LF70E                   ;2
       ADC    #$03                    ;2
       BNE    LF714                   ;2
LF70E: CPY    #$02                    ;2
       BNE    LF718                   ;2
       SBC    #$04                    ;2
LF714: STA    $A8,X                   ;4
       BNE    LF726                   ;2
LF718: CPY    #$04                    ;2
       BNE    LF722                   ;2
       DEC    $B0,X                   ;6
       DEC    $B0,X                   ;6
       BNE    LF726                   ;2
LF722: INC    $B0,X                   ;6
       INC    $B0,X                   ;6
LF726: INX                            ;2
       INX                            ;2
       INX                            ;2
       CPX    $9B                     ;3
       BEQ    LF730                   ;2
       JMP    LF613                   ;3
LF730: INC    $8F                     ;5
       LDX    $98                     ;3
       CPX    #$05                    ;2
       BNE    LF73A                   ;2
       LDX    #$FF                    ;2
LF73A: INX                            ;2
       CPX    $98                     ;3
       BEQ    LF759                   ;2
       LDA    $D0,X                   ;4
       BMI    LF751                   ;2
       BEQ    LF751                   ;2
       CMP    #$02                    ;2
       BEQ    LF74D                   ;2
       CMP    #$03                    ;2
       BNE    LF7A0                   ;2
LF74D: LDA    $D8,X                   ;4
       BNE    LF7A0                   ;2
LF751: CPX    #$05                    ;2
       BNE    LF73A                   ;2
       LDX    #$FF                    ;2
       BNE    LF73A                   ;2
LF759: LDA    $D0,X                   ;4
       BEQ    LF76B                   ;2
       BMI    LF76B                   ;2
       CMP    #$02                    ;2
       BEQ    LF767                   ;2
       CMP    #$03                    ;2
       BNE    LF7A0                   ;2
LF767: LDA    $D8,X                   ;4
       BNE    LF7A0                   ;2
LF76B: LDX    #$05                    ;2
LF76D: LDA    $D0,X                   ;4
       BPL    LF78A                   ;2
       DEX                            ;2
       BPL    LF76D                   ;2
       LDA    $80                     ;3
       LDX    $93                     ;3
       BMI    LF77E                   ;2
       LDX    $84                     ;3
       BNE    LF781                   ;2
LF77E: CLC                            ;2
       ADC    #$60                    ;2
LF781: STA    $CD                     ;3
       LDA    #$03                    ;2
       STA    $89                     ;3
       JSR    LFCC7                   ;6
LF78A: JMP    LF825                   ;3
LF78D: LDA    $80                     ;3
       ASL                            ;2
       BMI    LF76B                   ;2
       LSR                            ;2
       JSR    LFD76                   ;6
       LDA    #$05                    ;2
       STA    $D0,X                   ;4
       LDA    #$02                    ;2
       STA    $93                     ;3
       BNE    LF78A                   ;2
LF7A0: STX    $98                     ;3
       LDA    $B0,X                   ;4
       STA    $E9                     ;3
       LDA    $A8,X                   ;4
       STA    $E3                     ;3
       LDY    $D0,X                   ;4
       LDA    LFF62,Y                 ;4
       STA    $EF                     ;3
       LDA    LFEFA,Y                 ;4
       TAY                            ;2
       LDA    $C0,X                   ;4
       BPL    LF7BD                   ;2
       LDY    #$0C                    ;2
       BNE    LF7D0                   ;2
LF7BD: CMP    #$01                    ;2
       BEQ    LF7C6                   ;2
       CMP    #$02                    ;2
       BNE    LF7C9                   ;2
       INY                            ;2
LF7C6: INY                            ;2
       BNE    LF7D0                   ;2
LF7C9: CMP    #$04                    ;2
       BNE    LF7D0                   ;2
       ASL                            ;2
       STA    $FB                     ;3
LF7D0: LDA    LFFEE,Y                 ;4
       STA    $E0                     ;3
       LDA    #$FE                    ;2
       STA    $E1                     ;3
       LDA    $C0,X                   ;4
       BPL    LF810                   ;2
       LDA    $B8,X                   ;4
       CMP    #$03                    ;2
       BNE    LF806                   ;2
       LDA    $D0,X                   ;4
       CMP    #$04                    ;2
       BCC    LF7FE                   ;2
       LDY    #$FF                    ;2
       STY    $C0,X                   ;4
       STY    $D0,X                   ;4
       INC    $8B                     ;5
       CMP    #$05                    ;2
       BEQ    LF7F9                   ;2
       INC    $95                     ;5
       BNE    LF78D                   ;2
LF7F9: INC    $94                     ;5
       JMP    LF76B                   ;3
LF7FE: LDA    #$80                    ;2
       STA    $D0,X                   ;4
       STA    $E3                     ;3
       BNE    LF825                   ;2
LF806: INC    $B8,X                   ;6
       LDA    $B8,X                   ;4
       CMP    #$02                    ;2
       BCS    LF816                   ;2
       BCC    LF818                   ;2
LF810: LDA    $C8,X                   ;4
       LSR                            ;2
       LSR                            ;2
       BCC    LF818                   ;2
LF816: INC    $E0                     ;5
LF818: SEC                            ;2
       LDA    $E0                     ;3
       SBC    $E3                     ;3
       STA    $E0                     ;3
       LDA    $E1                     ;3
       SBC    #$00                    ;2
       STA    $E1                     ;3
LF825: LDA    INTIM                   ;4
       BPL    LF825                   ;2
       LDA    #$02                    ;2
       STA    VSYNC                   ;3
       LDA    #$2A                    ;2
       STA    TIM8T                   ;4
       LDX    #$05                    ;2
LF835: LDA    $D8,X                   ;4
       BNE    LF84D                   ;2
       LDA    $A8,X                   ;4
       CMP    $AE                     ;3
       BEQ    LF84D                   ;2
       CMP    $AF                     ;3
       BEQ    LF84D                   ;2
       LDA    $B0,X                   ;4
       CMP    $B6                     ;3
       BEQ    LF84D                   ;2
       CMP    $B7                     ;3
       BNE    LF84F                   ;2
LF84D: DEC    $D8,X                   ;6
LF84F: DEX                            ;2
       BPL    LF835                   ;2
LF852: LDA    INTIM                   ;4
       BNE    LF852                   ;2
       STA    WSYNC                   ;3
       STA    VSYNC                   ;3
       LDA    #$28                    ;2
       STA    TIM64T                  ;4
       LDA    $83                     ;3
       BEQ    LF874                   ;2
       LDA    $D6                     ;3
       ORA    $D7                     ;3
       BNE    LF874                   ;2
       JSR    LFCC7                   ;6
       LDX    #$62                    ;2
LF86F: STA    $8F,X                   ;4
       DEX                            ;2
       BPL    LF86F                   ;2
LF874: LDX    $99                     ;3
       LDY    #$00                    ;2
LF878: STY    $9A                     ;3
       LDA    $D0,X                   ;4
       BEQ    LF880                   ;2
       BPL    LF88A                   ;2
LF880: LDA    #$00                    ;2
       STA.wy $F0,Y                   ;5
       STA.wy $EC,Y                   ;5
       BEQ    LF8B8                   ;2
LF88A: TAY                            ;2
       LDA    LFF62,Y                 ;4
       LDY    $9A                     ;3
       STA.wy $F0,Y                   ;5
       LDA    $B8,X                   ;4
       LDY    #$06                    ;2
LF897: SEC                            ;2
       SBC    #$0B                    ;2
       BMI    LF89F                   ;2
       DEY                            ;2
       BPL    LF897                   ;2
LF89F: TYA                            ;2
       LDY    $9A                     ;3
       STA.wy $E4,Y                   ;5
       LDA    $B8,X                   ;4
LF8A7: CMP    #$0B                    ;2
       BCC    LF8AF                   ;2
       SBC    #$0B                    ;2
       BPL    LF8A7                   ;2
LF8AF: TAY                            ;2
       LDA    LFF73,Y                 ;4
       LDY    $9A                     ;3
       STA.wy $EC,Y                   ;5
LF8B8: INX                            ;2
       INX                            ;2
       INX                            ;2
       INY                            ;2
       CPY    #$02                    ;2
       BNE    LF878                   ;2
       LDA    $99                     ;3
       CMP    #$02                    ;2
       BNE    LF8CA                   ;2
       LDA    #$FF                    ;2
       STA    $99                     ;3
LF8CA: INC    $99                     ;5
       LDA    $81                     ;3
       BEQ    LF8D4                   ;2
       LDA    $80                     ;3
       AND    #$01                    ;2
LF8D4: EOR    #$01                    ;2
       TAX                            ;2
       LDA    #$00                    ;2
       STA    $F3                     ;3
       STA    $F4                     ;3
       LDA    $85,X                   ;4
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       STA    $F6                     ;3
       LDA    $85,X                   ;4
       AND    #$0F                    ;2
       STA    $F5                     ;3
       LDA    $87,X                   ;4
       AND    #$0F                    ;2
       STA    $F7                     ;3
       LDX    #$05                    ;2
LF8F3: LDA    $E8,X                   ;4
       BEQ    LF91C                   ;2
       CLC                            ;2
       ADC    #$2E                    ;2
       TAY                            ;2
       AND    #$0F                    ;2
       STA    $9A                     ;3
       TYA                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       TAY                            ;2
       CLC                            ;2
       ADC    $9A                     ;3
       CMP    #$0F                    ;2
       BCC    LF90F                   ;2
       SBC    #$0F                    ;2
       INY                            ;2
LF90F: EOR    #$07                    ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       STA    $E8,X                   ;4
       TYA                            ;2
       ORA    $E8,X                   ;4
       STA    $E8,X                   ;4
LF91C: DEX                            ;2
       BPL    LF8F3                   ;2
LF91F: LDA    INTIM                   ;4
       BNE    LF91F                   ;2
       STA    WSYNC                   ;3
       STA    VBLANK                  ;3
       STA    PF0                     ;3
       STA    PF1                     ;3
       LDY    #$FE                    ;2
       LDA    #$46                    ;2
       STA    $F8                     ;3
       LDA    #$FF                    ;2
       STA    $F9                     ;3
       LDA    $80                     ;3
       PHA                            ;3
       LDX    $81                     ;3
       BNE    LF941                   ;2
       AND    #$FE                    ;2
       STA    $80                     ;3
LF941: STA    WSYNC                   ;3
       LDA    #$10                    ;2
       STA    HMP0                    ;3
       LDA    #$20                    ;2
       STA    HMP1                    ;3
       LDA    $80                     ;3
       LSR                            ;2
       BCC    LF953                   ;2
       NOP                            ;2
       BCS    LF958                   ;2
LF953: LDX    #$07                    ;2
LF955: DEX                            ;2
       BNE    LF955                   ;2
LF958: STA    RESP0                   ;3
       STA    RESP1                   ;3
       LDA    #$01                    ;2
       STA    NUSIZ1                  ;3
       LDA    #$03                    ;2
       STA    NUSIZ0                  ;3
       LDA    $80                     ;3
       LDX    $94                     ;3
       BEQ    LF973                   ;2
       LSR                            ;2
       AND    #$0F                    ;2
       STA    COLUPF                  ;3
       STA    $EE                     ;3
       BPL    LF97F                   ;2
LF973: AND    #$01                    ;2
       TAX                            ;2
       LDA    LFF70,X                 ;4
       LDX    $83                     ;3
       BEQ    LF97F                   ;2
       EOR    $8E                     ;3
LF97F: STA    COLUP0                  ;3
       STA    COLUP1                  ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       BCC    LF990                   ;2
       NOP                            ;2
       LDX    #$08                    ;2
LF98C: DEX                            ;2
       BNE    LF98C                   ;2
       NOP                            ;2
LF990: LDY    $F7                     ;3
       LDA    ($F8),Y                 ;5
       STA    GRP0                    ;3
       LDY    $F6                     ;3
       LDA    ($F8),Y                 ;5
       STA    GRP1                    ;3
       LDY    $F5                     ;3
       LDA    ($F8),Y                 ;5
       TAX                            ;2
       LDY    $F4                     ;3
       LDA    ($F8),Y                 ;5
       STA    $9A                     ;3
       LDY    $F3                     ;3
       LDA    ($F8),Y                 ;5
       LDY    $9A                     ;3
       STX    GRP0                    ;3
       STY    GRP1                    ;3
       STA    GRP0                    ;3
       LDA    $F8                     ;3
       SEC                            ;2
       SBC    #$0A                    ;2
       STA    $F8                     ;3
       BNE    LF990                   ;2
       STA    GRP0                    ;3
       STA    GRP1                    ;3
       PLA                            ;4
       STA    $80                     ;3
       LDX    #$05                    ;2
LF9C5: DEX                            ;2
       BNE    LF9C5                   ;2
       STA    WSYNC                   ;3
       LDA    $FA                     ;3
       STA    REFP0                   ;3
       LDA    $FB                     ;3
       STA    REFP1                   ;3
       STA    WSYNC                   ;3
       STA    HMCLR                   ;3
       LDX    #$03                    ;2
LF9D8: LDA    $E8,X                   ;4
       AND    #$F0                    ;2
       STA    HMP0,X                  ;4
       LDA    $E8,X                   ;4
       AND    #$0F                    ;2
       STA    $E8,X                   ;4
       DEX                            ;2
       BPL    LF9D8                   ;2
       LDA    $E8                     ;3
       AND    #$0F                    ;2
       TAY                            ;2
       STA    WSYNC                   ;3
LF9EE: DEY                            ;2
       BPL    LF9EE                   ;2
       STA    RESP0                   ;3
       LDY    $E9                     ;3
       STA    WSYNC                   ;3
LF9F7: DEY                            ;2
       BPL    LF9F7                   ;2
       STA    RESP1                   ;3
       LDY    $EA                     ;3
       STA    WSYNC                   ;3
LFA00: DEY                            ;2
       BPL    LFA00                   ;2
       STA    RESM0                   ;3
       LDY    $EB                     ;3
       STA    WSYNC                   ;3
LFA09: DEY                            ;2
       BPL    LFA09                   ;2
       STA    RESM1                   ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    WSYNC                   ;3
       LDA    #$01                    ;2
       STA    CTRLPF                  ;3
       LDY    #$77                    ;2
       LDA    #$0A                    ;2
       STA    $E9                     ;3
       LDA    $80                     ;3
       BPL    LFA28                   ;2
       LDX    #$8F                    ;2
       LDA    #$FF                    ;2
       BNE    LFA2D                   ;2
LFA28: LDX    #$9A                    ;2
       LDA    #$FF                    ;2
       NOP                            ;2
LFA2D: STX    $F7                     ;3
       STA    $F8                     ;3
       LDX    #$FF                    ;2
       LDA    $EE                     ;3
       STA    COLUP0                  ;3
       LDA    $EF                     ;3
       STA    COLUP1                  ;3
       LDA    #$00                    ;2
       STA    NUSIZ0                  ;3
       STA    NUSIZ1                  ;3
       STA    $F5                     ;3
       STA    $F6                     ;3
       STA    $F3                     ;3
       STA    $F4                     ;3
       LDA    #$80                    ;2
       STX    PF2                     ;3
       STX    PF1                     ;3
LFA4F: STA    WSYNC                   ;3
       STA    PF0                     ;3
       JSR    LFC69                   ;6
       CPY    $E7                     ;3
       PHP                            ;3
       PLA                            ;4
       STA    ENAM1                   ;3
       LDA    #$07                    ;2
       STA    $9B                     ;3
       LDA    $84                     ;3
       AND    #$01                    ;2
       TAX                            ;2
       LDA    LFFD1,X                 ;4
       STA    $F9                     ;3
       LDA    LFFD3,X                 ;4
       STA    $FB                     ;3
       LDA    #$FF                    ;2
       STA    $FA                     ;3
       STA    $FC                     ;3
       STA    WSYNC                   ;3
       JSR    LFC69                   ;6
       NOP                            ;2
       NOP                            ;2
       NOP                            ;2
       STY    $E8                     ;3
       LDY    $E9                     ;3
       LDA    ($F7),Y                 ;5
       STA    $9A                     ;3
       LDA    ($F9),Y                 ;5
       TAX                            ;2
       LDA    ($FB),Y                 ;5
       DEC    $E9                     ;5
       LDY    $E8                     ;3
       STA    PF2                     ;3
       LDA    $9A                     ;3
       STX    PF1                     ;3
       STA    PF0                     ;3
LFA96: STA    WSYNC                   ;3
       JSR    LFC69                   ;6
       CPY    $E7                     ;3
       PHP                            ;3
       PLA                            ;4
       STA    ENAM1                   ;3
       DEC    $9B                     ;5
       BNE    LFA96                   ;2
       STA    WSYNC                   ;3
       JSR    LFC69                   ;6
       NOP                            ;2
       TYA                            ;2
       BMI    LFAC8                   ;2
       STA    $E8                     ;3
       LDY    $E9                     ;3
       LDA    ($F7),Y                 ;5
       STA    $9A                     ;3
       LDA    ($F9),Y                 ;5
       TAX                            ;2
       LDA    ($FB),Y                 ;5
       DEC    $E9                     ;5
       LDY    $E8                     ;3
       STA    PF2                     ;3
       LDA    $9A                     ;3
       STX    PF1                     ;3
       JMP    LFA4F                   ;3
LFAC8: NOP                            ;2
       NOP                            ;2
       NOP                            ;2
       NOP                            ;2
       LDA    #$00                    ;2
       LDX    #$03                    ;2
LFAD0: STA    GRP0,X                  ;4
       DEX                            ;2
       BPL    LFAD0                   ;2
       STA    WSYNC                   ;3
       STA    HMCLR                   ;3
       LDA    #$80                    ;2
       STA    PF0                     ;3
       STX    PF1                     ;3
       STX    PF2                     ;3
       LDA    $94                     ;3
       BEQ    LFAED                   ;2
       LDA    $80                     ;3
       AND    #$1F                    ;2
       LSR                            ;2
       TAX                            ;2
       BPL    LFAF1                   ;2
LFAED: LDX    #$8C                    ;2
       LDA    #$28                    ;2
LFAF1: STX    COLUP0                  ;3
       STA    COLUP1                  ;3
       LDX    $8C                     ;3
       BNE    LFAFD                   ;2
       STX    COLUP0                  ;3
       BEQ    LFB02                   ;2
LFAFD: CPX    #$03                    ;2
       BEQ    LFB02                   ;2
       DEX                            ;2
LFB02: STX    NUSIZ0                  ;3
       LDA    #$20                    ;2
       STA    HMP0                    ;3
       LDY    #$04                    ;2
       STA    WSYNC                   ;3
LFB0C: DEY                            ;2
       BPL    LFB0C                   ;2
       STA    RESP0                   ;3
       LDX    $8D                     ;3
       BNE    LFB19                   ;2
       STX    COLUP1                  ;3
       BEQ    LFB1E                   ;2
LFB19: CPX    #$03                    ;2
       BEQ    LFB1E                   ;2
       DEX                            ;2
LFB1E: STX    NUSIZ1                  ;3
       LDA    LFFE0,X                 ;4
       PHA                            ;3
       AND    #$0F                    ;2
       TAY                            ;2
       PLA                            ;4
       AND    #$F0                    ;2
       STA    HMP1                    ;3
       STA    WSYNC                   ;3
LFB2E: DEY                            ;2
       BNE    LFB2E                   ;2
       STA    RESP1                   ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDA    #$00                    ;2
       STA    REFP0                   ;3
       LDA    #$08                    ;2
       STA    REFP1                   ;3
       LDA    $83                     ;3
       BEQ    LFB4B                   ;2
       LDA    $8E                     ;3
       AND    #$F6                    ;2
       STA    COLUP0                  ;3
       STA    COLUP1                  ;3
LFB4B: STA    WSYNC                   ;3
       LDA    #$70                    ;2
       STA    GRP0                    ;3
       STA    GRP1                    ;3
       LDA    #$80                    ;2
       STA    PF0                     ;3
       LDA    #$20                    ;2
       STA    PF1                     ;3
       LDA    #$00                    ;2
       STA    PF2                     ;3
       LDX    #$0C                    ;2
       STA    WSYNC                   ;3
       LDA    $EC                     ;3
       AND    #$F0                    ;2
       STA    HMM0                    ;3
       LDA    $EC                     ;3
       AND    #$0F                    ;2
       TAY                            ;2
       STA    WSYNC                   ;3
       LDA    #$60                    ;2
       STA    GRP0                    ;3
       STA    GRP1                    ;3
       STA    WSYNC                   ;3
LFB78: DEY                            ;2
       BPL    LFB78                   ;2
       STA    RESM0                   ;3
       STA    WSYNC                   ;3
       LDA    #$F0                    ;2
       STA    GRP0                    ;3
       STA    GRP1                    ;3
       LDA    $ED                     ;3
       AND    #$F0                    ;2
       STA    HMM1                    ;3
       LDA    $ED                     ;3
       AND    #$0F                    ;2
       TAY                            ;2
       STA    WSYNC                   ;3
LFB92: DEY                            ;2
       BPL    LFB92                   ;2
       STA    RESM1                   ;3
       LDY    #$0A                    ;2
LFB99: STA    WSYNC                   ;3
       LDA    LFE00,Y                 ;4
       STA    GRP0                    ;3
       STA    GRP1                    ;3
       STA    WSYNC                   ;3
       DEY                            ;2
       DEY                            ;2
       BNE    LFB99                   ;2
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STY    CTRLPF                  ;3
       STY    REFP1                   ;3
       STY    GRP0                    ;3
       STY    GRP1                    ;3
       LDA    #$E0                    ;2
       STA    PF1                     ;3
       LDA    #$20                    ;2
       STA    NUSIZ0                  ;3
       STA    NUSIZ1                  ;3
       LDA    #$FC                    ;2
       STA    PF2                     ;3
       LDA    #$F0                    ;2
       STA    PF0                     ;3
       LDA    $F0                     ;3
       STA    COLUP0                  ;3
       LDA    $F1                     ;3
       STA    COLUP1                  ;3
       LDA    #$1E                    ;2
       STA    PF2                     ;3
       LDX    #$02                    ;2
LFBD4: STA    WSYNC                   ;3
       LDA    #$80                    ;2
       STA    PF0                     ;3
       LDA    #$E0                    ;2
       STA    PF1                     ;3
       LDA    #$FC                    ;2
       STA    PF2                     ;3
       LDY    #$02                    ;2
LFBE4: DEY                            ;2
       BPL    LFBE4                   ;2
       LDA    #$F0                    ;2
       STA    PF0                     ;3
       LDA    #$E0                    ;2
       STA    PF1                     ;3
       NOP                            ;2
       LDA    #$1E                    ;2
       STA    PF2                     ;3
       DEX                            ;2
       BPL    LFBD4                   ;2
       LDY    #$06                    ;2
       LDA    #$00                    ;2
       STA    PF0                     ;3
       NOP                            ;2
       NOP                            ;2
       STA    PF1                     ;3
       LDA    #$01                    ;2
       STA    CTRLPF                  ;3
LFC05: STA    WSYNC                   ;3
       LDA    #$04                    ;2
       STA    PF2                     ;3
       CPY    $E4                     ;3
       PHP                            ;3
       PLA                            ;4
       STA    ENAM0                   ;3
       CPY    $E5                     ;3
       PHP                            ;3
       PLA                            ;4
       STA    ENAM1                   ;3
       NOP                            ;2
       NOP                            ;2
       NOP                            ;2
       LDA    #$02                    ;2
       STA    PF2                     ;3
       STY    $E8                     ;3
       LDY    #$02                    ;2
LFC22: STA    WSYNC                   ;3
       LDA    #$04                    ;2
       STA    PF2                     ;3
       LDX    #$06                    ;2
LFC2A: DEX                            ;2
       BPL    LFC2A                   ;2
       LDA    #$02                    ;2
       STA    PF2                     ;3
       DEY                            ;2
       BPL    LFC22                   ;2
       LDY    $E8                     ;3
       DEY                            ;2
       BNE    LFC05                   ;2


       TYA                            ;2

       NOP                            ;2
       NOP                            ;2
       NOP                            ;2
       LDY    #$03                    ;2
;       LDA    #$00                    ;2
       STA    CTRLPF                  ;3
LFC42: STA    WSYNC                   ;3
       LDA    #$00                    ;2
       STA    PF0                     ;3
       STA    PF1                     ;3
       STA    ENAM0                   ;3
       STA    ENAM1                   ;3
       LDA    #$FC                    ;2
       STA    PF2                     ;3
       LDX    #$03                    ;2
LFC54: DEX                            ;2
       BPL    LFC54                   ;2
;       LDA    #$F0                    ;2
;       STA    PF0                     ;3

       NOP                            ;2
       STX    PF0                     ;3


       LDA    #$E0                    ;2
       STA    PF1                     ;3

;       LDA    #$00                    ;2
;       STA    PF2                     ;3

       INX                            ;2
       STX    PF2                     ;3


       DEY                            ;2
       BPL    LFC42                   ;2
       JMP    LF00C                   ;3
LFC69: DEY                            ;2
       LDA    $F5                     ;3
       STA    GRP0                    ;3
       LDA    $F6                     ;3
       STA    GRP1                    ;3
       LDA    $F3                     ;3
       BEQ    LFC7F                   ;2
       INC    $F3                     ;5
       LDA    ($DE),Y                 ;5
       STA    $F5                     ;3
       JMP    LFC89                   ;3
LFC7F: STA    $F5                     ;3
       CPY    $E2                     ;3
       BNE    LFC89                   ;2
       LDA    #$F8                    ;2
       STA    $F3                     ;3
LFC89: LDA    $F4                     ;3
       BEQ    LFC96                   ;2
       INC    $F4                     ;5
       LDA    ($E0),Y                 ;5
       STA    $F6                     ;3
       JMP    LFCA0                   ;3
LFC96: STA    $F6                     ;3
       CPY    $E3                     ;3
       BNE    LFCA0                   ;2
       LDA    #$F8                    ;2
       STA    $F4                     ;3
LFCA0: STA    WSYNC                   ;3
       DEY                            ;2
       CPY    $E6                     ;3
       PHP                            ;3
       PLA                            ;4
       STA    ENAM0                   ;3
LFCA9: RTS                            ;6

LFCAA: LDA    #$00                    ;2
       STA    $9E,X                   ;4
       STA    $A2,X                   ;4
       STA    $A0,X                   ;4
       LDA    $9E                     ;3
       ORA    $9F                     ;3
       BNE    LFCA9                   ;2
       LDA    #$FF                    ;2
       STA    $EA                     ;3
       STA    $E6                     ;3
LFCBE: LDA    #$00                    ;2
       STA    AUDC0                   ;3
       STA    AUDF0                   ;3
       STA    AUDV0                   ;3
       RTS                            ;6

LFCC7: LDA    #$00                    ;2
       STA    AUDC1                   ;3
       STA    AUDF1                   ;3
       STA    AUDV1                   ;3
       BEQ    LFCBE                   ;2
LFCD1: LDA    #$00                    ;2
       STA    $A6                     ;3
       STA    $A7                     ;3
       LDA    #$80                    ;2
       STA    $E7                     ;3
       RTS                            ;6

LFCDC: LDY    $C8,X                   ;4
       BEQ    LFD2D                   ;2
       LDA    $C0,X                   ;4
       AND    #$03                    ;2
       BEQ    LFCEC                   ;2
       CPY    #$0A                    ;2
       BEQ    LFCF4                   ;2
       BNE    LFCF0                   ;2
LFCEC: CPY    #$0C                    ;2
       BEQ    LFCF4                   ;2
LFCF0: LDA    #$FF                    ;2
       BMI    LFD49                   ;2
LFCF4: LDA    $D0,X                   ;4
       CMP    #$05                    ;2
       BNE    LFD04                   ;2
       LDA    $80                     ;3
       ADC    $B8,X                   ;4
       JSR    LFD76                   ;6
       JMP    LFD2D                   ;3
LFD04: LDA    #$00                    ;2
       STA    $C8,X                   ;4
       LDA    $C0,X                   ;4
       CMP    #$08                    ;2
       BNE    LFD12                   ;2
       INC    $B8,X                   ;6
       BPL    LFD2D                   ;2
LFD12: CMP    #$04                    ;2
       BNE    LFD1A                   ;2
       DEC    $B8,X                   ;6
       BPL    LFD2D                   ;2
LFD1A: CMP    #$02                    ;2
       BNE    LFD26                   ;2
       LDA    $B8,X                   ;4
       ADC    #$0A                    ;2
       STA    $B8,X                   ;4
       BPL    LFD2D                   ;2
LFD26: SEC                            ;2
       LDA    $B8,X                   ;4
       SBC    #$0B                    ;2
       STA    $B8,X                   ;4
LFD2D: LDA    $B8,X                   ;4
       LSR                            ;2
       TAY                            ;2
       LDA    $84                     ;3
       AND    #$01                    ;2
       BEQ    LFD3C                   ;2
       LDA    LFDDF,Y                 ;4
       BNE    LFD3F                   ;2
LFD3C: LDA    LFDBE,Y                 ;4

LFD3F: BCS    LFD47                   ;2 <-

       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2

;       BNE    LFD49                   ;2
       NOP                            ;2


LFD47: AND    #$0F                    ;2
LFD49: STA    $9A                     ;3
       RTS                            ;6

LFD4C: LDY    $80                     ;3
       BPL    LFD74                   ;2
       LDY    $B8,X                   ;4
       CPY    #$16                    ;2
       BNE    LFD62                   ;2
       CMP    #$04                    ;2
       BNE    LFD74                   ;2
       LDY    #$20                    ;2
       STY    $B8,X                   ;4
       LDY    #$8B                    ;2
       BNE    LFD70                   ;2
LFD62: CPY    #$20                    ;2
       BNE    LFD74                   ;2
       CMP    #$08                    ;2
       BNE    LFD74                   ;2
       LDY    #$16                    ;2
       STY    $B8,X                   ;4
       LDY    #$13                    ;2
LFD70: STY    $B0,X                   ;4
       SEC                            ;2
       RTS                            ;6

LFD74: CLC                            ;2
       RTS                            ;6

LFD76: AND    #$3F                    ;2
       CMP    $BE                     ;3
       BEQ    LFD84                   ;2
       CMP    $BF                     ;3
       BEQ    LFD84                   ;2
       CMP    $B8                     ;3
       BNE    LFD88                   ;2
LFD84: ADC    #$00                    ;2
       BPL    LFD76                   ;2
LFD88: STA    $B8,X                   ;4
       LDY    #$00                    ;2
LFD8C: SEC                            ;2
       SBC    #$0B                    ;2
       BMI    LFD94                   ;2
       INY                            ;2
       BNE    LFD8C                   ;2
LFD94: LDA    LFF7E,Y                 ;4
       STA    $A8,X                   ;4
       LDA    $B8,X                   ;4
LFD9B: CMP    #$0B                    ;2
       BCC    LFDA3                   ;2
       SBC    #$0B                    ;2
       BPL    LFD9B                   ;2
LFDA3: TAY                            ;2
       LDA    LFF84,Y                 ;4
       STA    $B0,X                   ;4
       LDA    #$00                    ;2
       STA    $C0,X                   ;4
       STA    $C8,X                   ;4
       RTS                            ;6

LFDB0: SED                            ;2
       CLC                            ;2
       ADC    $85,X                   ;4
       STA    $85,X                   ;4
       LDA    $87,X                   ;4
       ADC    #$00                    ;2
       STA    $87,X                   ;4
       CLD                            ;2
       RTS                            ;6


LFFE0: .byte $2D ; |  X XX X| $FFE0
       .byte $3C ; |  XXXX  | $FFE1
       .byte $00 ; |        | $FFE2
       .byte $4B ; | X  X XX| $FFE3



LFDBE: .byte $AC ; |X X XX  | $FDBE
       .byte $CE ; |XX  XXX | $FDBF
       .byte $EC ; |XXX XX  | $FDC0
       .byte $EE ; |XXX XXX | $FDC1
       .byte $CC ; |XX  XX  | $FDC2
       .byte $6B ; | XX X XX| $FDC3
       .byte $CE ; |XX  XXX | $FDC4
       .byte $5B ; | X XX XX| $FDC5
       .byte $C7 ; |XX   XXX| $FDC6
       .byte $9E ; |X  XXXX | $FDC7
       .byte $C7 ; |XX   XXX| $FDC8
       .byte $9E ; |X  XXXX | $FDC9
       .byte $7A ; | XXXX X | $FDCA
       .byte $DE ; |XX XXXX | $FDCB
       .byte $D6 ; |XX X XX | $FDCC
       .byte $BE ; |X XXXXX | $FDCD
       .byte $5A ; | X XX X | $FDCE
       .byte $5B ; | X XX XX| $FDCF
       .byte $7A ; | XXXX X | $FDD0
       .byte $F6 ; |XXXX XX | $FDD1
       .byte $B7 ; |X XX XXX| $FDD2
       .byte $96 ; |X  X XX | $FDD3
       .byte $3A ; |  XXX X | $FDD4
       .byte $5B ; | X XX XX| $FDD5
       .byte $73 ; | XXX  XX| $FDD6
       .byte $B7 ; |X XX XXX| $FDD7
       .byte $96 ; |X  X XX | $FDD8
       .byte $39 ; |  XXX  X| $FDD9
       .byte $DC ; |XX XXX  | $FDDA
       .byte $59 ; | X XX  X| $FDDB
       .byte $D5 ; |XX X X X| $FDDC
       .byte $9C ; |X  XXX  | $FDDD
       .byte $D5 ; |XX X X X| $FDDE
LFDDF: .byte $AC ; |X X XX  | $FDDF
       .byte $6A ; | XX X X | $FDE0
       .byte $CE ; |XX  XXX | $FDE1
       .byte $C6 ; |XX   XX | $FDE2
       .byte $AC ; |X X XX  | $FDE3
       .byte $63 ; | XX   XX| $FDE4
       .byte $AD ; |X X XX X| $FDE5
       .byte $FC ; |XXXXXX  | $FDE6
       .byte $FC ; |XXXXXX  | $FDE7
       .byte $FD ; |XXXXXX X| $FDE8
       .byte $63 ; | XX   XX| $FDE9
       .byte $97 ; |X  X XXX| $FDEA
       .byte $AF ; |X X XXXX| $FDEB
       .byte $63 ; | XX   XX| $FDEC
       .byte $AF ; |X X XXXX| $FDED
       .byte $6B ; | XX X XX| $FDEE
       .byte $5A ; | X XX X | $FDEF
       .byte $D7 ; |XX X XXX| $FDF0
       .byte $33 ; |  XX  XX| $FDF1
       .byte $33 ; |  XX  XX| $FDF2
       .byte $3B ; |  XXX XX| $FDF3
       .byte $D6 ; |XX X XX | $FDF4
       .byte $BC ; |X XXXX  | $FDF5
       .byte $F5 ; |XXXX X X| $FDF6
       .byte $BF ; |X XXXXXX| $FDF7
       .byte $79 ; | XXXX  X| $FDF8
       .byte $FC ; |XXXXXX  | $FDF9
       .byte $79 ; | XXXX  X| $FDFA
       .byte $CD ; |XX  XX X| $FDFB
       .byte $C5 ; |XX   X X| $FDFC
       .byte $19 ; |   XX  X| $FDFD
       .byte $CD ; |XX  XX X| $FDFE
       .byte $C5 ; |XX   X X| $FDFF
LFE00: .byte $00 ; |        | $FE00
       .byte $00 ; |        | $FE01
       .byte $C6 ; |XX   XX | $FE02
       .byte $70 ; | XXX    | $FE03
       .byte $6C ; | XX XX  | $FE04
       .byte $60 ; | XX     | $FE05
       .byte $78 ; | XXXX   | $FE06
       .byte $78 ; | XXXX   | $FE07
       .byte $FF ; |XXXXXXXX| $FE08
       .byte $FF ; |XXXXXXXX| $FE09
       .byte $F8 ; |XXXXX   | $FE0A
       .byte $F8 ; |XXXXX   | $FE0B
       .byte $F0 ; |XXXX    | $FE0C
       .byte $F0 ; |XXXX    | $FE0D
       .byte $60 ; | XX     | $FE0E
       .byte $60 ; | XX     | $FE0F
       .byte $70 ; | XXX    | $FE10
       .byte $70 ; | XXX    | $FE11
       .byte $00 ; |        | $FE12
       .byte $00 ; |        | $FE13
       .byte $39 ; |  XXX  X| $FE14
       .byte $38 ; |  XXX   | $FE15
       .byte $FF ; |XXXXXXXX| $FE16
       .byte $FF ; |XXXXXXXX| $FE17
       .byte $FE ; |XXXXXXX | $FE18
       .byte $FF ; |XXXXXXXX| $FE19
       .byte $BC ; |X XXXX  | $FE1A
       .byte $BD ; |X XXXX X| $FE1B
       .byte $1E ; |   XXXX | $FE1C
       .byte $1C ; |   XXX  | $FE1D
       .byte $0B ; |    X XX| $FE1E
       .byte $08 ; |    X   | $FE1F
       .byte $09 ; |    X  X| $FE20
       .byte $08 ; |    X   | $FE21
       .byte $08 ; |    X   | $FE22
       .byte $08 ; |    X   | $FE23
       .byte $00 ; |        | $FE24
       .byte $00 ; |        | $FE25
       .byte $08 ; |    X   | $FE26
       .byte $08 ; |    X   | $FE27
       .byte $09 ; |    X  X| $FE28
       .byte $08 ; |    X   | $FE29
       .byte $0B ; |    X XX| $FE2A
       .byte $08 ; |    X   | $FE2B
       .byte $1E ; |   XXXX | $FE2C
       .byte $1C ; |   XXX  | $FE2D
       .byte $BC ; |X XXXX  | $FE2E
       .byte $BD ; |X XXXX X| $FE2F
       .byte $FE ; |XXXXXXX | $FE30
       .byte $FF ; |XXXXXXXX| $FE31
       .byte $FF ; |XXXXXXXX| $FE32
       .byte $FF ; |XXXXXXXX| $FE33
       .byte $39 ; |  XXX  X| $FE34
       .byte $38 ; |  XXX   | $FE35
       .byte $00 ; |        | $FE36
       .byte $00 ; |        | $FE37
       .byte $00 ; |        | $FE38
       .byte $28 ; |  X X   | $FE39
       .byte $12 ; |   X  X | $FE3A
       .byte $82 ; |X     X | $FE3B
       .byte $40 ; | X      | $FE3C
       .byte $10 ; |   X    | $FE3D
       .byte $08 ; |    X   | $FE3E
       .byte $84 ; |X    X  | $FE3F
       .byte $01 ; |       X| $FE40
       .byte $21 ; |  X    X| $FE41
       .byte $24 ; |  X  X  | $FE42
       .byte $88 ; |X   X   | $FE43
       .byte $00 ; |        | $FE44
       .byte $22 ; |  X   X | $FE45
       .byte $00 ; |        | $FE46
       .byte $08 ; |    X   | $FE47
       .byte $00 ; |        | $FE48
       .byte $00 ; |        | $FE49
       .byte $C6 ; |XX   XX | $FE4A
       .byte $6C ; | XX XX  | $FE4B
       .byte $6C ; | XX XX  | $FE4C
       .byte $38 ; |  XXX   | $FE4D
       .byte $78 ; | XXXX   | $FE4E
       .byte $78 ; | XXXX   | $FE4F
       .byte $7F ; | XXXXXXX| $FE50
       .byte $7C ; | XXXXX  | $FE51
       .byte $B8 ; |X XXX   | $FE52
       .byte $BF ; |X XXXXXX| $FE53
       .byte $9F ; |X  XXXXX| $FE54
       .byte $9F ; |X  XXXXX| $FE55
       .byte $56 ; | X X XX | $FE56
       .byte $96 ; |X  X XX | $FE57
       .byte $9C ; |X  XXX  | $FE58
       .byte $5C ; | X XXX  | $FE59
       .byte $00 ; |        | $FE5A
       .byte $00 ; |        | $FE5B
       .byte $B1 ; |X XX   X| $FE5C
       .byte $E0 ; |XXX     | $FE5D
       .byte $4F ; | X  XXXX| $FE5E
       .byte $8D ; |X   XX X| $FE5F
       .byte $1E ; |   XXXX | $FE60
       .byte $1F ; |   XXXXX| $FE61
       .byte $FC ; |XXXXXX  | $FE62
       .byte $FE ; |XXXXXXX | $FE63
       .byte $BE ; |X XXXXX | $FE64
       .byte $BF ; |X XXXXXX| $FE65
       .byte $EB ; |XXX X XX| $FE66
       .byte $F9 ; |XXXXX  X| $FE67
       .byte $69 ; | XX X  X| $FE68
       .byte $70 ; | XXX    | $FE69
       .byte $28 ; |  X X   | $FE6A
       .byte $30 ; |  XX    | $FE6B
       .byte $00 ; |        | $FE6C
       .byte $00 ; |        | $FE6D
       .byte $28 ; |  X X   | $FE6E
       .byte $30 ; |  XX    | $FE6F
       .byte $69 ; | XX X  X| $FE70
       .byte $70 ; | XXX    | $FE71
       .byte $EB ; |XXX X XX| $FE72
       .byte $F9 ; |XXXXX  X| $FE73
       .byte $BE ; |X XXXXX | $FE74
       .byte $BF ; |X XXXXXX| $FE75
       .byte $FC ; |XXXXXX  | $FE76
       .byte $FE ; |XXXXXXX | $FE77
       .byte $1E ; |   XXXX | $FE78
       .byte $1F ; |   XXXXX| $FE79
       .byte $4F ; | X  XXXX| $FE7A
       .byte $8D ; |X   XX X| $FE7B
       .byte $B1 ; |X XX   X| $FE7C
       .byte $E0 ; |XXX     | $FE7D
       .byte $00 ; |        | $FE7E
       .byte $00 ; |        | $FE7F
       .byte $28 ; |  X X   | $FE80
       .byte $14 ; |   X X  | $FE81
       .byte $2A ; |  X X X | $FE82
       .byte $14 ; |   X X  | $FE83
       .byte $3F ; |  XXXXXX| $FE84
       .byte $3E ; |  XXXXX | $FE85
       .byte $7C ; | XXXXX  | $FE86
       .byte $7F ; | XXXXXXX| $FE87
       .byte $FF ; |XXXXXXXX| $FE88
       .byte $FF ; |XXXXXXXX| $FE89
       .byte $9B ; |X  XX XX| $FE8A
       .byte $9B ; |X  XX XX| $FE8B
       .byte $4E ; | X  XXX | $FE8C
       .byte $8E ; |X   XXX | $FE8D
       .byte $84 ; |X    X  | $FE8E
       .byte $44 ; | X   X  | $FE8F
       .byte $00 ; |        | $FE90
       .byte $00 ; |        | $FE91
       .byte $B0 ; |X XX    | $FE92
       .byte $70 ; | XXX    | $FE93
       .byte $58 ; | X XX   | $FE94
       .byte $98 ; |X  XX   | $FE95
       .byte $1F ; |   XXXXX| $FE96
       .byte $1C ; |   XXX  | $FE97
       .byte $3C ; |  XXXX  | $FE98
       .byte $3F ; |  XXXXXX| $FE99
       .byte $7F ; | XXXXXXX| $FE9A
       .byte $7C ; | XXXXX  | $FE9B
       .byte $DC ; |XX XXX  | $FE9C
       .byte $DF ; |XX XXXXX| $FE9D
       .byte $76 ; | XXX XX | $FE9E
       .byte $7C ; | XXXXX  | $FE9F
       .byte $34 ; |  XX X  | $FEA0
       .byte $38 ; |  XXX   | $FEA1
       .byte $00 ; |        | $FEA2
       .byte $00 ; |        | $FEA3
       .byte $34 ; |  XX X  | $FEA4
       .byte $38 ; |  XXX   | $FEA5
       .byte $76 ; | XXX XX | $FEA6
       .byte $7C ; | XXXXX  | $FEA7
       .byte $DC ; |XX XXX  | $FEA8
       .byte $DF ; |XX XXXXX| $FEA9
       .byte $7F ; | XXXXXXX| $FEAA
       .byte $7C ; | XXXXX  | $FEAB
       .byte $3C ; |  XXXX  | $FEAC
       .byte $3F ; |  XXXXXX| $FEAD
       .byte $1F ; |   XXXXX| $FEAE
       .byte $1C ; |   XXX  | $FEAF
       .byte $58 ; | X XX   | $FEB0
       .byte $98 ; |X  XX   | $FEB1
       .byte $B0 ; |X XX    | $FEB2
       .byte $70 ; | XXX    | $FEB3
       .byte $00 ; |        | $FEB4
       .byte $00 ; |        | $FEB5
       .byte $C3 ; |XX    XX| $FEB6
       .byte $66 ; | XX  XX | $FEB7
       .byte $3C ; |  XXXX  | $FEB8
       .byte $BD ; |X XXXX X| $FEB9
       .byte $18 ; |   XX   | $FEBA
       .byte $99 ; |X  XX  X| $FEBB
       .byte $5A ; | X XX X | $FEBC
       .byte $DB ; |XX XX XX| $FEBD
       .byte $FF ; |XXXXXXXX| $FEBE
       .byte $FF ; |XXXXXXXX| $FEBF
       .byte $DB ; |XX XX XX| $FEC0
       .byte $5A ; | X XX X | $FEC1
       .byte $99 ; |X  XX  X| $FEC2
       .byte $18 ; |   XX   | $FEC3
       .byte $81 ; |X      X| $FEC4
       .byte $00 ; |        | $FEC5
       .byte $00 ; |        | $FEC6
       .byte $00 ; |        | $FEC7
       .byte $FC ; |XXXXXX  | $FEC8
       .byte $3F ; |  XXXXXX| $FEC9
       .byte $3C ; |  XXXX  | $FECA
       .byte $1E ; |   XXXX | $FECB
       .byte $30 ; |  XX    | $FECC
       .byte $18 ; |   XX   | $FECD
       .byte $38 ; |  XXX   | $FECE
       .byte $38 ; |  XXX   | $FECF
       .byte $1F ; |   XXXXX| $FED0
       .byte $1F ; |   XXXXX| $FED1
       .byte $1C ; |   XXX  | $FED2
       .byte $1C ; |   XXX  | $FED3
       .byte $18 ; |   XX   | $FED4
       .byte $18 ; |   XX   | $FED5
       .byte $0C ; |    XX  | $FED6
       .byte $0C ; |    XX  | $FED7
       .byte $00 ; |        | $FED8
       .byte $00 ; |        | $FED9
       .byte $01 ; |       X| $FEDA
       .byte $00 ; |        | $FEDB
       .byte $03 ; |      XX| $FEDC
       .byte $00 ; |        | $FEDD
       .byte $0F ; |    XXXX| $FEDE
       .byte $09 ; |    X  X| $FEDF
       .byte $7F ; | XXXXXXX| $FEE0
       .byte $7B ; | XXXX XX| $FEE1
       .byte $FB ; |XXXXX XX| $FEE2
       .byte $FF ; |XXXXXXXX| $FEE3
       .byte $B1 ; |X XX   X| $FEE4
       .byte $B7 ; |X XX XXX| $FEE5
       .byte $10 ; |   X    | $FEE6
       .byte $13 ; |   X  XX| $FEE7
       .byte $10 ; |   X    | $FEE8
       .byte $11 ; |   X   X| $FEE9
       .byte $00 ; |        | $FEEA
       .byte $00 ; |        | $FEEB
       .byte $10 ; |   X    | $FEEC
       .byte $11 ; |   X   X| $FEED
       .byte $10 ; |   X    | $FEEE
       .byte $13 ; |   X  XX| $FEEF
       .byte $B1 ; |X XX   X| $FEF0
       .byte $B7 ; |X XX XXX| $FEF1
       .byte $FB ; |XXXXX XX| $FEF2
       .byte $FF ; |XXXXXXXX| $FEF3
       .byte $7F ; | XXXXXXX| $FEF4
       .byte $7B ; | XXXX XX| $FEF5
       .byte $0F ; |    XXXX| $FEF6
       .byte $09 ; |    X  X| $FEF7
       .byte $03 ; |      XX| $FEF8
       .byte $00 ; |        | $FEF9
LFEFA: .byte $01 ; |       X| $FEFA
       .byte $00 ; |        | $FEFB
       .byte $00 ; |        | $FEFC
       .byte $03 ; |      XX| $FEFD
       .byte $06 ; |     XX | $FEFE
       .byte $09 ; |    X  X| $FEFF
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
       .byte $3E ; |  XXXXX | $FF0A
       .byte $7E ; | XXXXXX | $FF0B
       .byte $7F ; | XXXXXXX| $FF0C
       .byte $3E ; |  XXXXX | $FF0D
       .byte $06 ; |     XX | $FF0E
       .byte $3E ; |  XXXXX | $FF0F
       .byte $3E ; |  XXXXX | $FF10
       .byte $18 ; |   XX   | $FF11
       .byte $3E ; |  XXXXX | $FF12
       .byte $3E ; |  XXXXX | $FF13
       .byte $63 ; | XX   XX| $FF14
       .byte $18 ; |   XX   | $FF15
       .byte $70 ; | XXX    | $FF16
       .byte $63 ; | XX   XX| $FF17
       .byte $06 ; |     XX | $FF18
       .byte $63 ; | XX   XX| $FF19
       .byte $63 ; | XX   XX| $FF1A
       .byte $18 ; |   XX   | $FF1B
       .byte $63 ; | XX   XX| $FF1C
       .byte $06 ; |     XX | $FF1D
       .byte $73 ; | XXX  XX| $FF1E
       .byte $18 ; |   XX   | $FF1F
       .byte $3C ; |  XXXX  | $FF20
       .byte $03 ; |      XX| $FF21
       .byte $7E ; | XXXXXX | $FF22
       .byte $03 ; |      XX| $FF23
       .byte $63 ; | XX   XX| $FF24
       .byte $18 ; |   XX   | $FF25
       .byte $63 ; | XX   XX| $FF26
       .byte $03 ; |      XX| $FF27
       .byte $6B ; | XX X XX| $FF28
       .byte $18 ; |   XX   | $FF29
       .byte $1E ; |   XXXX | $FF2A
       .byte $1E ; |   XXXX | $FF2B
       .byte $66 ; | XX  XX | $FF2C
       .byte $03 ; |      XX| $FF2D
       .byte $7E ; | XXXXXX | $FF2E
       .byte $0C ; |    XX  | $FF2F
       .byte $3E ; |  XXXXX | $FF30
       .byte $3F ; |  XXXXXX| $FF31
       .byte $67 ; | XX  XXX| $FF32
       .byte $18 ; |   XX   | $FF33
       .byte $07 ; |     XXX| $FF34
       .byte $0C ; |    XX  | $FF35
       .byte $36 ; |  XX XX | $FF36
       .byte $7E ; | XXXXXX | $FF37
       .byte $60 ; | XX     | $FF38
       .byte $06 ; |     XX | $FF39
       .byte $63 ; | XX   XX| $FF3A
       .byte $63 ; | XX   XX| $FF3B
       .byte $63 ; | XX   XX| $FF3C
       .byte $38 ; |  XXX   | $FF3D
       .byte $63 ; | XX   XX| $FF3E
       .byte $06 ; |     XX | $FF3F
       .byte $1E ; |   XXXX | $FF40
       .byte $60 ; | XX     | $FF41
       .byte $30 ; |  XX    | $FF42
       .byte $63 ; | XX   XX| $FF43
       .byte $63 ; | XX   XX| $FF44
       .byte $63 ; | XX   XX| $FF45
       .byte $3E ; |  XXXXX | $FF46
       .byte $18 ; |   XX   | $FF47
       .byte $3E ; |  XXXXX | $FF48
       .byte $3F ; |  XXXXXX| $FF49
       .byte $0E ; |    XXX | $FF4A
       .byte $7E ; | XXXXXX | $FF4B
       .byte $1E ; |   XXXX | $FF4C
       .byte $7E ; | XXXXXX | $FF4D
       .byte $3E ; |  XXXXX | $FF4E
LFF4F: .byte $3E ; |  XXXXX | $FF4F
       .byte $01 ; |       X| $FF50
       .byte $02 ; |      X | $FF51
       .byte $05 ; |     X X| $FF52
       .byte $0A ; |    X X | $FF53
LFF54: .byte $14 ; |   X X  | $FF54
       .byte $02 ; |      X | $FF55
       .byte $04 ; |     X  | $FF56
       .byte $0A ; |    X X | $FF57
       .byte $14 ; |   X X  | $FF58
       .byte $28 ; |  X X   | $FF59
LFF5A: .byte $0F ; |    XXXX| $FF5A
       .byte $0D ; |    XX X| $FF5B
       .byte $0E ; |    XXX | $FF5C
       .byte $00 ; |        | $FF5D
       .byte $07 ; |     XXX| $FF5E
       .byte $00 ; |        | $FF5F
       .byte $00 ; |        | $FF60
       .byte $00 ; |        | $FF61
LFF62: .byte $0B ; |    X XX| $FF62
       .byte $8C ; |X   XX  | $FF63
       .byte $28 ; |  X X   | $FF64
       .byte $44 ; | X   X  | $FF65
       .byte $2C ; |  X XX  | $FF66
       .byte $0F ; |    XXXX| $FF67
LFF68: .byte $2C ; |  X XX  | $FF68
       .byte $00 ; |        | $FF69
       .byte $8C ; |X   XX  | $FF6A
       .byte $00 ; |        | $FF6B
       .byte $2C ; |  X XX  | $FF6C
       .byte $00 ; |        | $FF6D
       .byte $8C ; |X   XX  | $FF6E
       .byte $00 ; |        | $FF6F
LFF70: .byte $2C ; |  X XX  | $FF70
       .byte $8C ; |X   XX  | $FF71
       .byte $00 ; |        | $FF72
LFF73: .byte $40 ; | X      | $FF73
       .byte $44 ; | X   X  | $FF74
       .byte $48 ; | X  X   | $FF75
       .byte $4C ; | X  XX  | $FF76
       .byte $50 ; | X X    | $FF77
       .byte $54 ; | X X X  | $FF78
       .byte $58 ; | X XX   | $FF79
       .byte $5C ; | X XXX  | $FF7A
       .byte $60 ; | XX     | $FF7B
       .byte $64 ; | XX  X  | $FF7C
       .byte $68 ; | XX X   | $FF7D
LFF7E: .byte $76 ; | XXX XX | $FF7E
       .byte $62 ; | XX   X | $FF7F
       .byte $4E ; | X  XXX | $FF80
       .byte $3A ; |  XXX X | $FF81
       .byte $26 ; |  X  XX | $FF82
       .byte $12 ; |   X  X | $FF83
LFF84: .byte $13 ; |   X  XX| $FF84
       .byte $1F ; |   XXXXX| $FF85
       .byte $2B ; |  X X XX| $FF86
       .byte $37 ; |  XX XXX| $FF87
       .byte $43 ; | X    XX| $FF88
       .byte $4F ; | X  XXXX| $FF89
       .byte $5B ; | X XX XX| $FF8A
       .byte $67 ; | XX  XXX| $FF8B
       .byte $73 ; | XXX  XX| $FF8C
       .byte $7F ; | XXXXXXX| $FF8D
       .byte $8B ; |X   X XX| $FF8E
       .byte $80 ; |X       | $FF8F
       .byte $80 ; |X       | $FF90
       .byte $80 ; |X       | $FF91
       .byte $80 ; |X       | $FF92
       .byte $80 ; |X       | $FF93
       .byte $E0 ; |XXX     | $FF94
       .byte $00 ; |        | $FF95
       .byte $E0 ; |XXX     | $FF96
       .byte $80 ; |X       | $FF97
       .byte $80 ; |X       | $FF98
       .byte $80 ; |X       | $FF99
       .byte $80 ; |X       | $FF9A
       .byte $80 ; |X       | $FF9B
       .byte $80 ; |X       | $FF9C
       .byte $80 ; |X       | $FF9D
       .byte $80 ; |X       | $FF9E
       .byte $E0 ; |XXX     | $FF9F
       .byte $80 ; |X       | $FFA0
       .byte $E0 ; |XXX     | $FFA1
       .byte $80 ; |X       | $FFA2
       .byte $80 ; |X       | $FFA3
       .byte $80 ; |X       | $FFA4
       .byte $00 ; |        | $FFA5
       .byte $27 ; |  X  XXX| $FFA6
       .byte $20 ; |  X     | $FFA7
       .byte $3C ; |  XXXX  | $FFA8
       .byte $04 ; |     X  | $FFA9
       .byte $E4 ; |XXX  X  | $FFAA
       .byte $00 ; |        | $FFAB
       .byte $3C ; |  XXXX  | $FFAC
       .byte $00 ; |        | $FFAD
       .byte $3F ; |  XXXXXX| $FFAE
       .byte $00 ; |        | $FFAF
       .byte $00 ; |        | $FFB0
       .byte $3C ; |  XXXX  | $FFB1
       .byte $00 ; |        | $FFB2
       .byte $3C ; |  XXXX  | $FFB3
       .byte $00 ; |        | $FFB4
       .byte $E4 ; |XXX  X  | $FFB5
       .byte $04 ; |     X  | $FFB6
       .byte $27 ; |  X  XXX| $FFB7
       .byte $20 ; |  X     | $FFB8
       .byte $3C ; |  XXXX  | $FFB9
       .byte $00 ; |        | $FFBA
       .byte $08 ; |    X   | $FFBB
       .byte $49 ; | X  X  X| $FFBC
       .byte $41 ; | X     X| $FFBD
       .byte $49 ; | X  X  X| $FFBE
       .byte $08 ; |    X   | $FFBF
       .byte $79 ; | XXXX  X| $FFC0
       .byte $01 ; |       X| $FFC1
       .byte $CF ; |XX  XXXX| $FFC2
       .byte $08 ; |    X   | $FFC3
       .byte $C9 ; |XX  X  X| $FFC4
       .byte $00 ; |        | $FFC5
       .byte $40 ; | X      | $FFC6
       .byte $4F ; | X  XXXX| $FFC7
       .byte $08 ; |    X   | $FFC8
       .byte $49 ; | X  X  X| $FFC9
       .byte $49 ; | X  X  X| $FFCA
       .byte $49 ; | X  X  X| $FFCB
       .byte $40 ; | X      | $FFCC
       .byte $79 ; | XXXX  X| $FFCD
       .byte $00 ; |        | $FFCE
       .byte $79 ; | XXXX  X| $FFCF
       .byte $01 ; |       X| $FFD0
LFFD1: .byte $A5 ; |X X  X X| $FFD1
       .byte $B0 ; |X XX    | $FFD2
LFFD3: .byte $BB ; |X XXX XX| $FFD3
       .byte $C6 ; |XX   XX | $FFD4
LFFD5: .byte $08 ; |    X   | $FFD5
       .byte $04 ; |     X  | $FFD6
LFFD7: .byte $13 ; |   X  XX| $FFD7
       .byte $8B ; |X   X XX| $FFD8
LFFD9: .byte $37 ; |  XX XXX| $FFD9
       .byte $41 ; | X     X| $FFDA
LFFDB: .byte $01 ; |       X| $FFDB
       .byte $02 ; |      X | $FFDC
       .byte $04 ; |     X  | $FFDD
       .byte $08 ; |    X   | $FFDE
       .byte $01 ; |       X| $FFDF

;LFFE0: .byte $2D ; |  X XX X| $FFE0
;       .byte $3C ; |  XXXX  | $FFE1
;       .byte $00 ; |        | $FFE2
;       .byte $4B ; | X  X XX| $FFE3

LFFE4: .byte $03 ; |      XX| $FFE4
       .byte $06 ; |     XX | $FFE5
       .byte $09 ; |    X  X| $FFE6
       .byte $0C ; |    XX  | $FFE7
       .byte $0F ; |    XXXX| $FFE8
LFFE9: .byte $18 ; |   XX   | $FFE9
       .byte $12 ; |   X  X | $FFEA
       .byte $0C ; |    XX  | $FFEB
       .byte $06 ; |     XX | $FFEC
       .byte $03 ; |      XX| $FFED
LFFEE: .byte $5A ; | X XX X | $FFEE
       .byte $6C ; | XX XX  | $FFEF
       .byte $7E ; | XXXXXX | $FFF0
       .byte $90 ; |X  X    | $FFF1
       .byte $A2 ; |X X   X | $FFF2
       .byte $B4 ; |X XX X  | $FFF3
       .byte $C6 ; |XX   XX | $FFF4
       .byte $C6 ; |XX   XX | $FFF5
       .byte $C6 ; |XX   XX | $FFF6
       .byte $D8 ; |XX XX   | $FFF7
       .byte $EA ; |XXX X X | $FFF8
       .byte $FC ; |XXXXXX  | $FFF9
       .byte $48 ; | X  X   | $FFFA
       .byte $00 ; |        | $FFFB

       ORG $FFF8
       .word 0,0,START,$FFFF
