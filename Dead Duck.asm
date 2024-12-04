; Disassembly of deadduck.bin
; Disassembled Mon Aug 16 19:40:18 2004
; Using DiStella v2.0
;
; Command Line: C:\BIN\DISTELLA.EXE -pafscdeadduck.cfg deadduck.bin 
;
; deadduck.cfg contents:
;
;      ORG F000
;      CODE F000 FC0C
;      GFX FC0D FD05
;      CODE FD06 FDF6
;      GFX FDF7 FE4F
;      CODE FE50 FEFC
;      GFX FEFD FF8A
;      CODE FF8B FFF7
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
CTRLPF  =  $0A
REFP1   =  $0C
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
RESBL   =  $14
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMBL    =  $24
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXP0FB  =  $32
CXP1FB  =  $33
CXBLPF  =  $36
CXPPMM  =  $37
INPT0   =  $38
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

ORIGINAL = 0

       ORG $F000

  IF ORIGINAL
START:
  ENDIF

LF000:
       JMP    LFD06               ;3 ???
LF003:
       LDA    $EC                 ;3 
       CMP    #$01                ;2 
       BEQ    LF05E               ;2 
       LDA    $D7                 ;3 
       BMI    LF05E               ;2 
       CMP    #$05                ;2 
       BNE    LF02E               ;2 
       LDA    $D8                 ;3 
       CMP    #$05                ;2 
       BCS    LF022               ;2 
       ASL                        ;2 
       ASL                        ;2 
       CLC                        ;2 
       ADC    #$8D                ;2 
       STA    $CF                 ;3 
       INC    $D8                 ;5 
       BCC    LF05E               ;2 
LF022:
       DEC    $D7                 ;5 
       LDA    #$00                ;2 
       STA    $D8                 ;3 
       LDA    #$9F                ;2 
       STA    $CF                 ;3 
       LDA    $D7                 ;3 
LF02E:
       STA    $DB                 ;3 
       LDA    #$04                ;2 
       SEC                        ;2 
       SBC    $DB                 ;3 
       STA    $DB                 ;3 
       TAY                        ;2 
       LDA    $D8                 ;3 
       CMP    #$05                ;2 
       BCS    LF04C               ;2 
       TAX                        ;2 
       LDA    LFCFD,X             ;4 
       CLC                        ;2 
       ADC    #$4D                ;2 
       STA.wy $BE,Y               ;5 
       INC    $D8                 ;5 
       BCC    LF05E               ;2 
LF04C:
       LDY    $DB                 ;3 
       LDA    #$9F                ;2 
       STA.wy $BE,Y               ;5 
       LDA    #$61                ;2 
       STA.wy $BF,Y               ;5 
       LDA    #$01                ;2 
       STA    $D8                 ;3 
       DEC    $D7                 ;5 
LF05E:
       LDA    $F8                 ;3 
       CMP    #$03                ;2 
       BCC    LF066               ;2 
       LDA    #$03                ;2 
LF066:
       AND    #$03                ;2 
       TAX                        ;2 
       LDA    LFFF8,X             ;4 
       STA    $FD                 ;3 
       LDA    $F8                 ;3 
       BPL    LF099               ;2 
       LDA    INPT4               ;3 
       BMI    LF079               ;2 
       JMP    LF2CC               ;3 
LF079:
       LDA    $E5                 ;3 
       BNE    LF07F               ;2 
       DEC    $D4                 ;5 
LF07F:
       LDA    $FA                 ;3 
       STA    $FB                 ;3 
       BEQ    LF08D               ;2 
       TAX                        ;2 
       LDA    LFDF7,X             ;4 
       STA    $CE                 ;3 
       BPL    LF09B               ;2 
LF08D:
       LDA    #$38                ;2 
       STA    $80                 ;3 
       STA    $85                 ;3 
       LDA    #$00                ;2 
       STA    $CE                 ;3 
       BEQ    LF09B               ;2 
LF099:
       STA    $FB                 ;3 
LF09B:
       LDA    SWCHB               ;4 
       CLC                        ;2 
       ROR                        ;2 
       BCS    LF0A5               ;2 
       JMP    LF2CC               ;3 
LF0A5:
       DEC    $FC                 ;5 
       BNE    LF0C7               ;2 
       LDY    #$12                ;2 
       STY    $FC                 ;3 
       CLC                        ;2 
       ROR                        ;2 
       BCS    LF0C7               ;2 
       LDA    $FA                 ;3 
       ADC    #$01                ;2 
       AND    #$03                ;2 
       STA    $FA                 ;3 
       LDA    #$83                ;2 
       STA    $8A                 ;3 
       LDA    #$03                ;2 
       STA    $8B                 ;3 
       LDA    #$00                ;2 
       STA    $F7                 ;3 
       BEQ    LF104               ;2 
LF0C7:
       LDA    $F9                 ;3 
       BNE    LF100               ;2 
       INC    $F7                 ;5 
       INC    $F8                 ;5 
       JSR    LFD7B               ;6 
       LDA    #$00                ;2 
       STA    $EE                 ;3 
       STA    $EF                 ;3 
       LDA    #$48                ;2 
       STA    $80                 ;3 
       STA    $85                 ;3 
       LDA    $F8                 ;3 
       CMP    #$02                ;2 
       BCC    LF100               ;2 
       LDX    #$01                ;2 
       STX    $CE                 ;3 
       CMP    #$03                ;2 
       BCC    LF100               ;2 
       LDX    #$03                ;2 
       STX    $CE                 ;3 
       CMP    #$04                ;2 
       BCC    LF100               ;2 
       LDX    #$1A                ;2 
       STX    $E9                 ;3 
       CMP    #$05                ;2 
       BCC    LF100               ;2 
       LDX    #$20                ;2 
       STX    $EB                 ;3 
LF100:
       LDA    $F7                 ;3 
       BNE    LF115               ;2 
LF104:
       LDA    #<LFC9F             ;2 
       STA    $B9                 ;3 
       LDA    #>LFC9F             ;2 
       STA    $BA                 ;3 
       LDX    #$FF                ;2 
       STX    $F8                 ;3 
       INX                        ;2 
       STX    AUDV0               ;3 
       STX    AUDV1               ;3 
LF115:
       LDA    $F4                 ;3 
       BNE    LF14B               ;2 
       LDA    #$10                ;2 
       STA    $DB                 ;3 
       LDA    #$40                ;2 
       BIT    SWCHA               ;4 
       BNE    LF135               ;2 
       LDA    $B7                 ;3 
       JSR    LFC01               ;6 
       CMP    #$71                ;2 
       BEQ    LF12F               ;2 
       STA    $B7                 ;3 
LF12F:
       LDA    #$08                ;2 
       STA    $D5                 ;3 
       BNE    LF14B               ;2 
LF135:
       LDA    #$80                ;2 
       BIT    SWCHA               ;4 
       BNE    LF14B               ;2 
       LDA    $B7                 ;3 
       JSR    LFECB               ;6 
       CMP    #$A8                ;2 
       BEQ    LF147               ;2 
       STA    $B7                 ;3 
LF147:
       LDA    #$00                ;2 
       STA    $D5                 ;3 
LF14B:
       LDA    CXP1FB              ;3 
       BPL    LF17D               ;2 
       LDA    $F4                 ;3 
       BNE    LF181               ;2 
       LDA    $F5                 ;3 
       BEQ    LF15D               ;2 
       LDA    #$46                ;2 
       STA    $F4                 ;3 
       BNE    LF181               ;2 
LF15D:
       LDA    #$20                ;2 
       STA    $DB                 ;3 
       INC    $F5                 ;5 
       LDA    $B7                 ;3 
       LDY    $D5                 ;3 
       BEQ    LF172               ;2 
       JSR    LFECB               ;6 
       CMP    #$A8                ;2 
       BEQ    LF181               ;2 
       BNE    LF179               ;2 
LF172:
       JSR    LFC01               ;6 
       CMP    #$71                ;2 
       BEQ    LF181               ;2 
LF179:
       STA    $B7                 ;3 
       BNE    LF181               ;2 
LF17D:
       LDA    #$00                ;2 
       STA    $F5                 ;3 
LF181:
       JSR    LFDD9               ;6 
       JMP    LFDAB               ;3 
LF187:
       JSR    LFDE6               ;6 
       JSR    LFFD8               ;6 
       LDA    $F4                 ;3 
       CMP    #$01                ;2 
       BNE    LF1A3               ;2 
       DEC    $F4                 ;5 
       DEC    $F4                 ;5 
       LDA    #$64                ;2 
       STA    $F6                 ;3 
       LDA    #$9F                ;2 
       STA    $B9                 ;3 
       LDA    #$FC                ;2 
       STA    $BA                 ;3 
LF1A3:
       JSR    LFED7               ;6 
       LDA    $C9                 ;3 
       BNE    LF1D8               ;2 
       DEC    $C8                 ;5 
       BMI    LF1D6               ;2 
       LDX    $CA                 ;3 
       INX                        ;2 
       INX                        ;2 
       LDA    #$40                ;2 
       STA    $DB                 ;3 
       LDA    $CB                 ;3 
       BEQ    LF1C8               ;2 
       LDA    $8A,X               ;4 
       JSR    LFC01               ;6 
       STA    $8A,X               ;4 
       LSR    $B5                 ;5 
       ROL    $B4                 ;5 
       JMP    LF1D8               ;3 
LF1C8:
       LDA    $8A,X               ;4 
       JSR    LFECB               ;6 
       STA    $8A,X               ;4 
       LSR    $B2                 ;5 
       ROL    $B3                 ;5 
       JMP    LF1D8               ;3 
LF1D6:
       DEC    $C9                 ;5 
LF1D8:
       DEC    $EC                 ;5 
       BNE    LF236               ;2 
       LDA    #$03                ;2 
       STA    $EC                 ;3 
       LDA    $C9                 ;3 
       BPL    LF236               ;2 
       LDA    $BD                 ;3 
       ORA    $BC                 ;3 
       BEQ    LF236               ;2 
       LDX    #$03                ;2 
LF1EC:
       LDA    $B2,X               ;4 
       TAY                        ;2 
       LDA    $AE,X               ;4 
       STA    $B2,X               ;4 
       LDA    $AA,X               ;4 
       STA    $AE,X               ;4 
       LDA    $A6,X               ;4 
       STA    $AA,X               ;4 
       LDA    $A2,X               ;4 
       STA    $A6,X               ;4 
       TYA                        ;2 
       STA    $A2,X               ;4 
       DEX                        ;2 
       BPL    LF1EC               ;2 
       DEC    $CD                 ;5 
       BNE    LF20F               ;2 
       LDA    #$05                ;2 
       STA    $CD                 ;3 
       BNE    LF236               ;2 
LF20F:
       LDA    $CD                 ;3 
       CMP    #$04                ;2 
       BNE    LF236               ;2 
       ASL    $BD                 ;5 
       ASL    $BC                 ;5 
       LDA    $BD                 ;3 
       ORA    $BC                 ;3 
       CMP    #$40                ;2 
       BNE    LF236               ;2 
       LDX    #$03                ;2 
       LDY    #$00                ;2 
LF225:
       LDA    $A2,X               ;4 
       ORA    $E1,X               ;4 
       STA    $E1,X               ;4 
       STY    $A2,X               ;4 
       DEX                        ;2 
       BPL    LF225               ;2 
       STY    $BD                 ;3 
       STY    $BC                 ;3 
       INC    $CD                 ;5 
LF236:
       LDA    $D3                 ;3 
       BMI    LF272               ;2 
       LDX    #$03                ;2 
       LDA    #$02                ;2 
       JSR    LFBF0               ;6 
       BCC    LF272               ;2 
       LDX    $D3                 ;3 
       ASL                        ;2 
       TAY                        ;2 
       TXA                        ;2 
       CMP    #$11                ;2 
       BCC    LF25B               ;2 
       CLC                        ;2 
       ADC    LFCF5,Y             ;4 
       STA    $D1                 ;3 
       LDA    LFCF6,Y             ;4 
       STA    $D2                 ;3 
       DEC    $D3                 ;5 
       BCC    LF272               ;2 
LF25B:
       CLC                        ;2 
       ADC    LFCF9,Y             ;4 
       STA    $D1                 ;3 
       LDA    LFCFA,Y             ;4 
       STA    $D2                 ;3 
       DEC    $D3                 ;5 
       BPL    LF272               ;2 
       LDA    #$9F                ;2 
       STA    $D1                 ;3 
       LDA    #$00                ;2 
       STA    $E0                 ;3 
LF272:
       LDA    $D7                 ;3 
       BPL    LF2BD               ;2 
       LDA    $F4                 ;3 
       BNE    LF2BD               ;2 
       LDA    $F8                 ;3 
       BMI    LF2BD               ;2 
       LDA    #$9F                ;2 
       LDY    INPT4               ;3 
       BMI    LF2BD               ;2 
       LDX    #$04                ;2 
LF286:
       STA    $BE,X               ;4 
       DEX                        ;2 
       BPL    LF286               ;2 
       LDA    #$00                ;2 
       STA    $D8                 ;3 
       LDA    #$05                ;2 
       STA    $D7                 ;3 
       LDA    $D5                 ;3 
       BEQ    LF2A2               ;2 
       LDA    #$40                ;2 
       STA    $DB                 ;3 
       LDA    $B7                 ;3 
       JSR    LFECB               ;6 
       BNE    LF2AB               ;2 
LF2A2:
       LDA    #$50                ;2 
       STA    $DB                 ;3 
       LDA    $B7                 ;3 
       JSR    LFECB               ;6 
LF2AB:
       TAX                        ;2 
       AND    #$F0                ;2 
       STA    $C5                 ;3 
       TXA                        ;2 
       AND    #$0F                ;2 
       STA    $C6                 ;3 
       LDA    #$79                ;2 
       STA    $B9                 ;3 
       LDA    #$12                ;2 
       STA    $D6                 ;3 
LF2BD:
       LDA    $D6                 ;3 
       BEQ    LF2C9               ;2 
       DEC    $D6                 ;5 
       BNE    LF2C9               ;2 
       LDA    #$70                ;2 
       STA    $B9                 ;3 
LF2C9:
       JMP    LF300               ;3 
LF2CC:
       JSR    LFD7B               ;6 
       LDA    #<LFF70             ;2 
       STA    $B9                 ;3 
       LDA    #>LFF70             ;2 
       STA    $BA                 ;3 
       LDA    #$38                ;2 
       STA    $80                 ;3 
       STA    $85                 ;3 
       LDA    #$05                ;2 
       STA    $F7                 ;3 
       LDA    #$00                ;2 
       STA    $EE                 ;3 
       STA    $EF                 ;3 
       STA    $F2                 ;3 
       STA    $F3                 ;3 
       LDA    $FA                 ;3 
       STA    $F8                 ;3 
       LDA    #$FF                ;2 
       STA    $F4                 ;3 
       STA    $D4                 ;3 
       LDA    #$64                ;2 
       STA    $F6                 ;3 
       LDX    $FA                 ;3 
       LDA    LFDF7,X             ;4 
       STA    $CE                 ;3 
LF300:
       LDX    #$F9                ;2 
LF302:
       LDA    INTIM               ;4 
       BNE    LF302               ;2 
       STA    WSYNC               ;3 
       STA    VBLANK              ;3 
       STX    TIM64T              ;4 
       STA    CXCLR               ;3 
       LDA    #$00                ;2 
       STA    NUSIZ0              ;3 
       STA    NUSIZ1              ;3 
       STA    WSYNC               ;3 
       ASL    INPT0               ;5 
       ASL    INPT0               ;5 
       STA    INPT0               ;3 
       LDA    $C5                 ;3 
       STA    HMBL                ;3 
       LDX    $C6                 ;3 
LF324:
       DEX                        ;2 
       BNE    LF324               ;2 
       STA    RESBL               ;3 
       STA    WSYNC               ;3 
       STA    HMOVE               ;3 
       LDX    #$04                ;2 
       LDA    #$01                ;2 
       STA    $C7                 ;3 
       LDA    $BE,X               ;4 
       STA    $C3                 ;3 
       STX    $DD                 ;3 
       LDX    #$09                ;2 
       LDY    #$14                ;2 
       LDA    #$01                ;2 
       BIT    $BD                 ;3 
       BNE    LF349               ;2 
       BIT    $BC                 ;3 
       BNE    LF349               ;2 XXX
       BEQ    LF34C               ;2 
LF349:
       JMP    LF4D4               ;3 
LF34C:
       STA    WSYNC               ;3 
       LDA    $8A,X               ;4 
       TXS                        ;2 
       TAX                        ;2 
       AND    #$F0                ;2 
       STA    HMP0                ;3 
       TXA                        ;2 
       AND    #$0F                ;2 
       TAX                        ;2 
LF35A:
       DEX                        ;2 
       BNE    LF35A               ;2 
       STA    RESP0               ;3 
       TSX                        ;2 
       STA    WSYNC               ;3 
       LDA    ($C3),Y             ;5 
       STA    ENABL               ;3 
       TYA                        ;2 
       CLC                        ;2 
       ADC    #$08                ;2 
       TAY                        ;2 
       STY    $DF                 ;3 
       LDA    $95                 ;3 
       LSR                        ;2 
       LDA    $94                 ;3 
       ROR                        ;2 
       EOR    $95                 ;3 
       LDY    $94                 ;3 
       STA    $94                 ;3 
       STY    $95                 ;3 
       LDY    $DF                 ;3 
       STA    $FE                 ;3 
       LDA    $C7                 ;3 
       LSR                        ;2 
       STA    $FF                 ;3 
       STA    WSYNC               ;3 
       LDA    #$00                ;2 
       STA    HMBL                ;3 
       CPX    #$09                ;2 
       BEQ    LF3BF               ;2 
       LDA    $BD                 ;3 
       ORA    $BC                 ;3 
       ORA    $DA                 ;3 
       BNE    LF3BF               ;2 
       LDA    $8C,X               ;4 
       AND    #$0F                ;2 
       CMP    #$05                ;2 
       BCS    LF3AD               ;2 
       LDA    #$11                ;2 
       STA    $DB                 ;3 
       LDA    #$00                ;2 
       STA    $DE                 ;3 
       LDA    #$10                ;2 
       STA    $DF                 ;3 
  IF ORIGINAL
       JMP    LF3B9               ;3 
  ELSE
       BNE    LF3B9               ;2+1 always branch
  ENDIF
;1 byte saved

LF3AD:
       LDA    #$D9                ;2 
       STA    $DB                 ;3 
       LDA    #$01                ;2 
       STA    $DE                 ;3 
       LDA    #$13                ;2 
       STA    $DF                 ;3 
LF3B9:
       LDA    CXP0FB              ;3 
       BPL    LF3BF               ;2 
       BMI    LF3CD               ;2 
LF3BF:
       STA    WSYNC               ;3 
       LDA    #$00                ;2 
       STA    PF1                 ;3 
       STA    PF2                 ;3 
       STA    ENABL               ;3 
       STA    HMBL                ;3 
       BEQ    LF3F6               ;2 
LF3CD:
       STA    WSYNC               ;3 
       LDA    #$00                ;2 
       STA    PF1                 ;3 
       STA    PF2                 ;3 
       STA    ENABL               ;3 
       LDA    $FF                 ;3 
       STA    $BD                 ;3 
       LDA    $DB                 ;3 
       STA    $8C,X               ;4 
       STX    $CA                 ;3 
       LDA    $FE                 ;3 
       AND    #$0F                ;2 
       STA    $C8                 ;3 
       LDA    $DE                 ;3 
       STA    $CB                 ;3 
       LDA    #$0A                ;2 
       STA    $C9                 ;3 
       LDA    #$80                ;2 
       LDX    $DF                 ;3 
       STA    $A2,X               ;4 
       TSX                        ;2 
LF3F6:
       STA    WSYNC               ;3 
       LDA    $89,X               ;4 
       TXS                        ;2 
       TAX                        ;2 
       AND    #$F0                ;2 
       STA    HMP1                ;3 
       TXA                        ;2 
       AND    #$0F                ;2 
       TAX                        ;2 
LF404:
       DEX                        ;2 
       BNE    LF404               ;2 
       STA    RESP1               ;3 
       TSX                        ;2 
       STA    WSYNC               ;3 
       LDA    ($C3),Y             ;5 
       STA    ENABL               ;3 
       TYA                        ;2 
       CLC                        ;2 
       ADC    #$08                ;2 
       TAY                        ;2 
       LDA    ($C3),Y             ;5 
       STA    $DC                 ;3 
       STA    WSYNC               ;3 
       CPX    #$09                ;2 
       BEQ    LF450               ;2 
       LDA    $BD                 ;3 
       ORA    $BC                 ;3 
       ORA    $D9                 ;3 
       BNE    LF450               ;2 
       LDA    $8B,X               ;4 
       AND    #$0F                ;2 
       CMP    #$05                ;2 
       BCS    LF43E               ;2 
       LDA    #$11                ;2 
       STA    $DB                 ;3 
       LDA    #$00                ;2 
       STA    $DE                 ;3 
       LDA    #$10                ;2 
       STA    $DF                 ;3 
       JMP    LF44A               ;3 
LF43E:
       LDA    #$D9                ;2 
       STA    $DB                 ;3 
       LDA    #$01                ;2 
       STA    $DE                 ;3 
       LDA    #$13                ;2 
       STA    $DF                 ;3 
LF44A:
       LDA    CXP1FB              ;3 
       BPL    LF450               ;2 
       BMI    LF45C               ;2 
LF450:
       STA    WSYNC               ;3 
       LDA    #$00                ;2 
       STA    PF1                 ;3 
       STA    PF2                 ;3 
       STA    ENABL               ;3 
       BEQ    LF486               ;2 
LF45C:
       STA    WSYNC               ;3 
       LDA    #$00                ;2 
       STA    PF1                 ;3 
       STA    PF2                 ;3 
       STA    ENABL               ;3 
       TXS                        ;2 
       DEX                        ;2 
       LDA    $FF                 ;3 
       STA    $BC                 ;3 
       LDA    $DB                 ;3 
       STA    $8C,X               ;4 
       STX    $CA                 ;3 
       LDA    $FE                 ;3 
       AND    #$0F                ;2 
       STA    $C8                 ;3 
       LDA    $DE                 ;3 
       STA    $CB                 ;3 
       LDA    #$0A                ;2 
       STA    $C9                 ;3 
       LDA    #$80                ;2 
       LDX    $DF                 ;3 
       STA    $A2,X               ;4 
LF486:
       STA    WSYNC               ;3 
       STA    HMOVE               ;3 
       LDA    $E6                 ;3 
       ORA    CXBLPF              ;3 
       STA    $E6                 ;3 
       STA    CXCLR               ;3 
       LDY    #$00                ;2 
       LDX    $DD                 ;3 
       LDA    $80,X               ;4 
       STA    $96                 ;3 
       LDA    $85,X               ;4 
       STA    $98                 ;3 
       DEX                        ;2 
       STX    $DD                 ;3 
       LDA    ($96),Y             ;5 
       TAX                        ;2 
       LDA    ($98),Y             ;5 
       STA    $DB                 ;3 
       INY                        ;2 
       LDA    ($96),Y             ;5 
       INY                        ;2 
LF4AC:
       STA    WSYNC               ;3 
       STA    COLUP1              ;3 
       STA    COLUP0              ;3 
       STX    GRP0                ;3 
       LDA    $DB                 ;3 
       STA    GRP1                ;3 
       LDA    $DC                 ;3 
       STA    ENABL               ;3 
       LDA    ($C3),Y             ;5 
       STA    $DC                 ;3 
       LDA    ($96),Y             ;5 
       TAX                        ;2 
       LDA    ($98),Y             ;5 
       STA    $DB                 ;3 
       INY                        ;2 
       LDA    ($96),Y             ;5 
       INY                        ;2 
       CPY    #$16                ;2 
       BNE    LF4AC               ;2 
       STA    WSYNC               ;3 
       JMP    LF6A2               ;3 
LF4D4:
       STA    WSYNC               ;3 
       LDA    $8A,X               ;4 
       TXS                        ;2 
       TAX                        ;2 
       AND    #$F0                ;2 
       STA    HMP0                ;3 
       TXA                        ;2 
       AND    #$0F                ;2 
       TAX                        ;2 
LF4E2:
       DEX                        ;2 
       BNE    LF4E2               ;2 
       STA    RESP0               ;3 
       STA    WSYNC               ;3 
       LDA    $A2                 ;3 
       STA    PF1                 ;3 
       LDA    ($C3),Y             ;5 
       STA    ENABL               ;3 
       LDA    $A3                 ;3 
       STA    PF2                 ;3 
       TYA                        ;2 
       CLC                        ;2 
       ADC    #$08                ;2 
       TAY                        ;2 
       ASL    INPT0               ;5 
       NOP                        ;2 
       NOP                        ;2 
       LDA    $A4                 ;3 
       ASL    INPT0               ;5 
       STA    PF2                 ;3 
       LDA    $A5                 ;3 
       STA    PF1                 ;3 
       LDA    #$00                ;2 
       STA    HMBL                ;3 
       STA    WSYNC               ;3 
       LDA    $A2                 ;3 
       STA    PF1                 ;3 
       LDA    $A3                 ;3 
       STA    PF2                 ;3 
       LDA    $A4                 ;3 
       LDX    #$03                ;2 
       STX    $BB                 ;3 
LF51C:
       DEC    $BB                 ;5 
       BNE    LF51C               ;2 
       TSX                        ;2 
       STA    PF2                 ;3 
       LDA    $A5                 ;3 
       STA    PF1                 ;3 
       STA    WSYNC               ;3 
       LDA    #$00                ;2 
       STA    PF1                 ;3 
       STA    PF2                 ;3 
       STA    ENABL               ;3 
       STA    WSYNC               ;3 
       LDA    $89,X               ;4 
       TXS                        ;2 
       TAX                        ;2 
       AND    #$F0                ;2 
       STA    HMP1                ;3 
       TXA                        ;2 
       AND    #$0F                ;2 
       TAX                        ;2 
LF53F:
       DEX                        ;2 
       BNE    LF53F               ;2 
       STA    RESP1               ;3 
       STA    WSYNC               ;3 
       LDA    $A6                 ;3 
       STA    PF1                 ;3 
       LDA    ($C3),Y             ;5 
       STA    ENABL               ;3 
       LDA    $A7                 ;3 
       STA    PF2                 ;3 
       TYA                        ;2 
       CLC                        ;2 
       ADC    #$10                ;2 
       TAY                        ;2 
       LDA    ($C3),Y             ;5 
       STA    $DC                 ;3 
       DEY                        ;2 
       DEY                        ;2 
       LDA    $A8                 ;3 
       NOP                        ;2 
       STA    PF2                 ;3 
       LDA    $A9                 ;3 
       STA    PF1                 ;3 
       STA    WSYNC               ;3 
       LDA    $A6                 ;3 
       STA    PF1                 ;3 
       LDA    $A7                 ;3 
       STA    PF2                 ;3 
       LDA    $A8                 ;3 
       LDX    #$03                ;2 
       STX    $BB                 ;3 
LF576:
       DEC    $BB                 ;5 
       BNE    LF576               ;2 
       NOP                        ;2 
       STA    PF2                 ;3 
       LDA    $A9                 ;3 
       STA    PF1                 ;3 
       STA    WSYNC               ;3 
       LDA    #$00                ;2 
       STA    PF1                 ;3 
       STA    PF2                 ;3 
       STA    ENABL               ;3 
       STA    WSYNC               ;3 
       STA    HMOVE               ;3 
       LDA    $E6                 ;3 
       ORA    CXBLPF              ;3 
       STA    $E6                 ;3 
       STA    CXCLR               ;3 
       LDY    #$00                ;2 
       LDX    $DD                 ;3 
       LDA    $80,X               ;4 
       STA    $96                 ;3 
       LDA    $85,X               ;4 
       STA    $98                 ;3 
       DEX                        ;2 
       STX    $DD                 ;3 
       LDA    ($96),Y             ;5 
       TAX                        ;2 
       LDA    ($98),Y             ;5 
       STA    $DB                 ;3 
       INY                        ;2 
       LDA    ($96),Y             ;5 
       INY                        ;2 
       STA    WSYNC               ;3 
LF5B3:
       STA    COLUP0              ;3 
       STA    COLUP1              ;3 
       STX    GRP0                ;3 
       LDA    $DB                 ;3 
       STA    GRP1                ;3 
       LDA    $AA                 ;3 
       STA    PF1                 ;3 
       LDA    $DC                 ;3 
       STA.w  ENABL               ;4 
       LDA    $AB                 ;3 
       STA    PF2                 ;3 
       LDA    ($98),Y             ;5 
       STA    $DB                 ;3 
       LDA    $AC                 ;3 
       STA    PF2                 ;3 
       LDA    $AD                 ;3 
       STA.w  PF1                 ;4 
       LDA    ($96),Y             ;5 
       TAX                        ;2 
       INY                        ;2 
       LDA    ($96),Y             ;5 
       INY                        ;2 
       CPY    #$04                ;2 
       BEQ    LF5B3               ;2 
LF5E2:
       STA    COLUP0              ;3 
       STA    COLUP1              ;3 
       LDA    #$00                ;2 
       STA    PF1                 ;3 
       STA    ENABL               ;3 
       STA    PF2                 ;3 
       STX    GRP0                ;3 
       LDA    $DB                 ;3 
       STA    GRP1                ;3 
       LDA    #$00                ;2 
       LDA    ($C3),Y             ;5 
       STA    $DC                 ;3 
       LDA    ($96),Y             ;5 
       TAX                        ;2 
       LDA    ($98),Y             ;5 
       STA    $DB                 ;3 
       INY                        ;2 
       LDA    ($96),Y             ;5 
       INY                        ;2 
       ASL    INPT0               ;5 
       ASL    INPT0               ;5 
       CPY    #$08                ;2 
       BEQ    LF5E2               ;2 
       STA    INPT0               ;3 
LF60F:
       STA    COLUP0              ;3 
       STA    COLUP1              ;3 
       STX    GRP0                ;3 
       LDA    $DB                 ;3 
       STA    GRP1                ;3 
       LDA    $AE                 ;3 
       STA    PF1                 ;3 
       LDA    $DC                 ;3 
       STA.w  ENABL               ;4 
       LDA    $AF                 ;3 
       STA    PF2                 ;3 
       LDA    ($98),Y             ;5 
       STA    $DB                 ;3 
       LDA    $B0                 ;3 
       STA    PF2                 ;3 
       LDA    $B1                 ;3 
       STA.w  PF1                 ;4 
       LDA    ($96),Y             ;5 
       TAX                        ;2 
       INY                        ;2 
       LDA    ($96),Y             ;5 
       INY                        ;2 
       CPY    #$0C                ;2 
       BEQ    LF60F               ;2 
LF63E:
       STA    COLUP0              ;3 
       STA    COLUP1              ;3 
       LDA    #$00                ;2 
       STA    PF1                 ;3 
       STA    ENABL               ;3 
       STA    PF2                 ;3 
       STX    GRP0                ;3 
       LDA    $DB                 ;3 
       STA    GRP1                ;3 
       LDA    #$00                ;2 
       LDA    ($C3),Y             ;5 
       STA    $DC                 ;3 
       LDA    ($96),Y             ;5 
       TAX                        ;2 
       LDA    ($98),Y             ;5 
       STA    $DB                 ;3 
       INY                        ;2 
       LDA    ($96),Y             ;5 
       INY                        ;2 
       ASL    INPT0               ;5 
       ASL.w  $38                 ;6 
       CPY    #$10                ;2 
       BEQ    LF63E               ;2 
       NOP                        ;2 
LF66B:
       STA    COLUP0              ;3 
       STA    COLUP1              ;3 
       STX    GRP0                ;3 
       LDA    $DB                 ;3 
       STA    GRP1                ;3 
       LDA    $B2                 ;3 
       STA    PF1                 ;3 
       LDA    $DC                 ;3 
       STA.w  ENABL               ;4 
       LDA    $B3                 ;3 
       STA    PF2                 ;3 
       LDA    ($98),Y             ;5 
       STA    $DB                 ;3 
       LDA    $B4                 ;3 
       STA    PF2                 ;3 
       LDA    $B5                 ;3 
       STA.w  PF1                 ;4 
       LDA    ($96),Y             ;5 
       TAX                        ;2 
       INY                        ;2 
       LDA    ($96),Y             ;5 
       INY                        ;2 
       CPY    #$14                ;2 
       BEQ    LF66B               ;2 
       LDA    #$00                ;2 
       STA    PF1                 ;3 
       STA    PF2                 ;3 
       STA    ENABL               ;3 
LF6A2:
       STA    WSYNC               ;3 
       LDA    #$00                ;2 
       STA    PF1                 ;3 
       STA    PF2                 ;3 
       STA    ENABL               ;3 
       TSX                        ;2 
       DEX                        ;2 
       DEX                        ;2 
       TXS                        ;2 
       BMI    LF716               ;2 
       LDX    $DD                 ;3 
       INX                        ;2 
       BIT    CXP0FB              ;3 
       BVS    LF6BF               ;2 
       BIT    CXP1FB              ;3 
       BVS    LF6D9               ;2 
       BVC    LF6F1               ;2 
LF6BF:
       LDA    #$26                ;2 
       STA    $80,X               ;4 
       LDA    #$0A                ;2 
       STA    $ED                 ;3 
       LDA    $C7                 ;3 
       STA    $DA                 ;3 
       LDA    #$9F                ;2 
       STA    $BE,X               ;4 
       LDA    #$FF                ;2 
       STA    $D7                 ;3 
       LDA    #$01                ;2 
       STA    $D6                 ;3 
       BNE    LF6F1               ;2 
LF6D9:
       LDA    #$26                ;2 
       STA    $85,X               ;4 
       LDA    #$0A                ;2 
       STA    $ED                 ;3 
       LDA    $C7                 ;3 
       STA    $D9                 ;3 
       LDA    #$9F                ;2 
       STA    $BE,X               ;4 
       LDA    #$FF                ;2 
       STA    $D7                 ;3 
       LDA    #$01                ;2 
       STA    $D6                 ;3 
LF6F1:
       STA    WSYNC               ;3 
       CPX    #$01                ;2 
       BNE    LF6FD               ;2 
       LDA    $CE                 ;3 
       STA    NUSIZ0              ;3 
       STA    NUSIZ1              ;3 
LF6FD:
       STA    WSYNC               ;3 
       LDX    $DD                 ;3 
       LDA    $BE,X               ;4 
       STA    $C3                 ;3 
       TSX                        ;2 
       ASL    $C7                 ;5 
       LDA    $BD                 ;3 
       ORA    $BC                 ;3 
       BIT    $C7                 ;3 
       BNE    LF713               ;2 
       JMP    LF34C               ;3 
LF713:
       JMP    LF4D4               ;3 
LF716:
       LDA    CXP0FB              ;3 
       BPL    LF722               ;2 
       LDA    $B6                 ;3 
       EOR    #$01                ;2 
       STA    $B6                 ;3 
       BPL    LF72C               ;2 
LF722:
       LDA    CXP1FB              ;3 
       BPL    LF72C               ;2 
       LDA    $B6                 ;3 
       EOR    #$01                ;2 
       STA    $B6                 ;3 
LF72C:
       BIT    CXP0FB              ;3 
       BVC    LF74E               ;2 
       LDA    #$FF                ;2 
       STA    $D7                 ;3 
       LDA    #$01                ;2 
       STA    $D6                 ;3 
       LDA    #$9F                ;2 
       STA    $BE                 ;3 
       LDA    $E0                 ;3 
       BNE    LF778               ;2 
       LDA    $8B                 ;3 
       STA    $B8                 ;3 
       LDA    #$1E                ;2 
       STA    $D3                 ;3 
       LDA    #$01                ;2 
       STA    $E0                 ;3 
       BNE    LF778               ;2 
LF74E:
       BIT    CXP1FB              ;3 
       BVC    LF770               ;2 
       LDA    #$FF                ;2 
       STA    $D7                 ;3 
       LDA    #$01                ;2 
       STA    $D6                 ;3 
       LDA    #$9F                ;2 
       STA    $BE                 ;3 
       LDA    $E0                 ;3 
       BNE    LF778               ;2 
       LDA    $8A                 ;3 
       STA    $B8                 ;3 
       LDA    #$1E                ;2 
       STA    $D3                 ;3 
       LDA    #$01                ;2 
       STA    $E0                 ;3 
       BNE    LF778               ;2 
LF770:
       ASL    INPT0               ;5 
       ASL    INPT0               ;5 
       ASL    INPT0               ;5 
       BVC    LF77C               ;2 
LF778:
       LDA    #$01                ;2 
       STA    $E7                 ;3 
LF77C:
       LDA    $E6                 ;3 
       ORA    CXBLPF              ;3 
       STA    $E6                 ;3 
       STA    CXCLR               ;3 
       ASL    $C7                 ;5 
       LDA    $BD                 ;3 
       ORA    $BC                 ;3 
       BIT    $C7                 ;3 
       BNE    LF791               ;2 
       JMP    LF83E               ;3 
LF791:
       STA    WSYNC               ;3 
       LDA.w  $B8                 ;4 
       TXS                        ;2 
       TAX                        ;2 
       AND    #$F0                ;2 
       STA    HMP0                ;3 
       TXA                        ;2 
       AND    #$0F                ;2 
       TAX                        ;2 
LF7A0:
       DEX                        ;2 
       BNE    LF7A0               ;2 
       STA    RESP0               ;3 
       STA    WSYNC               ;3 
       LDA    $CE                 ;3 
       STA    NUSIZ0              ;3 
       LDA    #$12                ;2 
       STA    $BB                 ;3 
       STA    WSYNC               ;3 
       STA    HMOVE               ;3 
       LDY    #$00                ;2 
       LDA    #$02                ;2 
       STA    $BB                 ;3 
       LDX    #$00                ;2 
       LDA    #$0E                ;2 
       STA    COLUP0              ;3 
LF7BF:
       STA    WSYNC               ;3 
       LDA    ($D1),Y             ;5 
       STA    GRP0                ;3 
       LDA    ($CF),Y             ;5 
       STA    ENABL               ;3 
       LDA    $A2,X               ;4 
       STA    PF1                 ;3 
       LDA    $A3,X               ;4 
       STA    PF2                 ;3 
       LDA    $A4,X               ;4 
       INY                        ;2 
       ASL    INPT0               ;5 
       STA.w  $38                 ;4 
       STA    PF2                 ;3 
       LDA    $A5,X               ;4 
       STA    PF1                 ;3 
       STA    WSYNC               ;3 
       LDA    ($D1),Y             ;5 
       STA    GRP0                ;3 
       LDA    ($CF),Y             ;5 
       STA    ENABL               ;3 
       LDA    $A2,X               ;4 
       STA    PF1                 ;3 
       LDA    $A3,X               ;4 
       STA    PF2                 ;3 
       LDA    $A4,X               ;4 
       INY                        ;2 
       ASL    INPT0               ;5 
       STA.w  $38                 ;4 
       STA    PF2                 ;3 
       LDA    $A5,X               ;4 
       STA    PF1                 ;3 
       INX                        ;2 
       INX                        ;2 
       INX                        ;2 
       INX                        ;2 
       LDA    #$02                ;2 
       STA    $BB                 ;3 
LF807:
       STA    WSYNC               ;3 
       CPX    #$13                ;2 
       BCS    LF826               ;2 
       LDA    ($D1),Y             ;5 
       STA    GRP0                ;3 
       LDA    ($CF),Y             ;5 
       STA    ENABL               ;3 
       LDA    #$00                ;2 
       STA    PF1                 ;3 
       STA    PF2                 ;3 
       INY                        ;2 
       DEC    $BB                 ;5 
       BNE    LF807               ;2 
       LDA    #$02                ;2 
       STA    $BB                 ;3 
       BNE    LF7BF               ;2 
LF826:
       LDA    ($D1),Y             ;5 
       STA    GRP0                ;3 
       LDA    #$00                ;2 
       STA    ENABL               ;3 
       STA    PF1                 ;3 
       STA    PF2                 ;3 
       STA    NUSIZ1              ;3 
       INY                        ;2 
       LDA    ($D1),Y             ;5 
       TAX                        ;2 
       INY                        ;2 
       STA    HMCLR               ;3 
       JMP    LF889               ;3 
LF83E:
       STA    WSYNC               ;3 
       LDA.w  $B8                 ;4 
       TXS                        ;2 
       TAX                        ;2 
       AND    #$F0                ;2 
       STA    HMP0                ;3 
       TXA                        ;2 
       AND    #$0F                ;2 
       TAX                        ;2 
LF84D:
       DEX                        ;2 
       BNE    LF84D               ;2 
       STA    RESP0               ;3 
       TSX                        ;2 
       STA    WSYNC               ;3 
       LDA    $CE                 ;3 
       STA    NUSIZ0              ;3 
       STA    WSYNC               ;3 
       STA    HMOVE               ;3 
       LDY    #$00                ;2 
       LDA    #$0E                ;2 
       STA    COLUP0              ;3 
LF863:
       STA    WSYNC               ;3 
       LDA    ($D1),Y             ;5 
       STA    GRP0                ;3 
       LDA    ($CF),Y             ;5 
       STA    ENABL               ;3 
       INY                        ;2 
       CPY    #$12                ;2 
       BNE    LF863               ;2 
       STA    WSYNC               ;3 
       LDA    ($D1),Y             ;5 
       STA    GRP0                ;3 
       LDA    #$00                ;2 
       STA    ENABL               ;3 
       STA    PF1                 ;3 
       STA    PF2                 ;3 
       STA    NUSIZ1              ;3 
       INY                        ;2 
       LDA    ($D1),Y             ;5 
       TAX                        ;2 
       INY                        ;2 
       STA    HMCLR               ;3 
LF889:
       STA    WSYNC               ;3 
       STX    GRP0                ;3 
       NOP                        ;2 
       LDA.w  $B7                 ;4 
       TAX                        ;2 
       AND    #$F0                ;2 
       STA    HMP1                ;3 
       TXA                        ;2 
       AND    #$0F                ;2 
       TAX                        ;2 
LF89A:
       DEX                        ;2 
       BNE    LF89A               ;2 
       STA    RESP1               ;3 
       STA    WSYNC               ;3 
       LDA    ($D1),Y             ;5 
       STA    GRP0                ;3 
       INY                        ;2 
       STA    WSYNC               ;3 
       STA    HMOVE               ;3 
       LDA    ($D1),Y             ;5 
       STA    GRP0                ;3 
       INY                        ;2 
       STA    WSYNC               ;3 
       LDA    ($D1),Y             ;5 
       STA    GRP0                ;3 
       STY    $DB                 ;3 
       LDY    #$00                ;2 
       LDA    ($B9),Y             ;5 
       TAX                        ;2 
       INY                        ;2 
       LDA    $D5                 ;3 
       STA    REFP1               ;3 
       LDA    #$4A                ;2 
       STA    COLUP1              ;3 
       STY    $DC                 ;3 
       LDY    $DB                 ;3 
       LDA    ($D1),Y             ;5 
       INY                        ;2 
LF8CC:
       STA    WSYNC               ;3 
       STA    GRP0                ;3 
       STX    GRP1                ;3 
       LDY    $DC                 ;3 
       LDA    ($B9),Y             ;5 
       TAX                        ;2 
       INY                        ;2 
       STY    $DC                 ;3 
       LDY    $DB                 ;3 
       LDA    ($D1),Y             ;5 
       INY                        ;2 
       STY    $DB                 ;3 
       CPY    #$1D                ;2 
       BNE    LF8CC               ;2 
LF8E5:
       STA    WSYNC               ;3 
       STA    GRP0                ;3 
       STX    GRP1                ;3 
       LDA    $E1                 ;3 
       STA    PF1                 ;3 
       LDA    $E2                 ;3 
       STA    PF2                 ;3 
       LDY    $DC                 ;3 
       LDA    ($B9),Y             ;5 
       TAX                        ;2 
       INY                        ;2 
       STY    $DC                 ;3 
       LDA    $E3                 ;3 
       TAY                        ;2 
       LDA    $E4                 ;3 
       NOP                        ;2 
       NOP                        ;2 
       STY    PF2                 ;3 
       STA    PF1                 ;3 
       LDY    $DB                 ;3 
       LDA    ($D1),Y             ;5 
       INY                        ;2 
       STY    $DB                 ;3 
       CPY    #$1F                ;2 
       BNE    LF8E5               ;2 
       STA    WSYNC               ;3 
       LDA    #$00                ;2 
       STA    GRP0                ;3 
       STA    GRP1                ;3 
       LDA    #$7E                ;2 
       AND    $D4                 ;3 
       STA    COLUPF              ;3 
       LDA    #$FF                ;2 
       STA    PF1                 ;3 
       STA    PF2                 ;3 
       LDA    #$01                ;2 
       STA    CTRLPF              ;3 
       LDX    $F7                 ;3 
       CPX    #$04                ;2 
       BCC    LF931               ;2 
       LDX    #$04                ;2 
LF931:
       LDA    LFEFD,X             ;4 
       STA    NUSIZ0              ;3 
       LDA    #$4A                ;2 
       STA    COLUP0              ;3 
       LDX    #$FF                ;2 
       TXS                        ;2 
       STA    WSYNC               ;3 
       LDA    #$7C                ;2 
       AND    $D4                 ;3 
       STA    COLUPF              ;3 
       LDX    #$05                ;2 
LF947:
       DEX                        ;2 
       BNE    LF947               ;2 
       STA    RESP0               ;3 
       LDX    #$7B                ;2 
       LDY    #$00                ;2 
LF950:
       STA    WSYNC               ;3 
       TXA                        ;2 
       AND    $D4                 ;3 
       STA    COLUPF              ;3 
       LDA    $F7                 ;3 
       CMP    #$02                ;2 
       BCC    LF96D               ;2 
       LDA    #$00                ;2 
       CPX    #$7A                ;2 
       BCS    LF96D               ;2 
       CPY    #$09                ;2 
       BEQ    LF96B               ;2 
       LDA    LFF70,Y             ;4 
       INY                        ;2 
LF96B:
       STA    GRP0                ;3 
LF96D:
       DEX                        ;2 
       CPX    #$6F                ;2 
       BNE    LF950               ;2 
       STA    WSYNC               ;3 
       LDA    #$00                ;2 
       STA    PF0                 ;3 
       STA    PF1                 ;3 
       STA    PF2                 ;3 
       STA    REFP1               ;3 
       SED                        ;2 
       LDA    $F2                 ;3 
       CLC                        ;2 
       ADC    $E7                 ;3 
       STA    $F2                 ;3 
       LDA    $F3                 ;3 
       ADC    #$00                ;2 
       STA    $F3                 ;3 
       CLD                        ;2 
       LDA    #$00                ;2 
       STA    $E7                 ;3 
       LDA    $F8                 ;3 
       BPL    LF99C               ;2 
       LDA    $9E                 ;3 
       BEQ    LF99C               ;2 
       JMP    LFB14               ;3 
LF99C:
       STA    WSYNC               ;3 
       LDA    $F2                 ;3 
       AND    #$0F                ;2 
       ASL                        ;2 
       ASL                        ;2 
       ASL                        ;2 
       STA    $DC                 ;3 
       LDA    $F2                 ;3 
       AND    #$F0                ;2 
       LSR                        ;2 
       STA    $DD                 ;3 
       LDA    $F3                 ;3 
       AND    #$0F                ;2 
       ASL                        ;2 
       ASL                        ;2 
       ASL                        ;2 
       STA    $DE                 ;3 
       LDA    $F3                 ;3 
       AND    #$F0                ;2 
       LSR                        ;2 
       STA    $DF                 ;3 
       LDY    #$00                ;2 
       STA    WSYNC               ;3 
       LDA    $DF                 ;3 
       BNE    LF9DA               ;2 
       STY    $DF                 ;3 
       LDA    $DE                 ;3 
       BNE    LF9DA               ;2 
       STY    $DE                 ;3 
       LDA    $DD                 ;3 
       BNE    LF9DA               ;2 
       STY    $DD                 ;3 
       LDA    $DC                 ;3 
       BNE    LF9DA               ;2 
       STY    $DC                 ;3 
LF9DA:
       STA    WSYNC               ;3 
       LDX    #$00                ;2 
LF9DE:
       STA    WSYNC               ;3 
       CPX    #$00                ;2 
       BNE    LFA50               ;2 
       STA    HMCLR               ;3 
       LDA    #$0E                ;2 
       STA    COLUP0              ;3 
       STA    COLUP1              ;3 
       LDX    #$04                ;2 
       LDA    #$10                ;2 
       STA    HMP1                ;3 
       STA    WSYNC               ;3 
       LDA    #$00                ;2 
       STA    CTRLPF              ;3 
       STA    REFP1               ;3 
       BIT    $FF                 ;3 
       BIT    $FF                 ;3 
       BIT    $FF                 ;3 
LFA00:
       DEX                        ;2 
       BNE    LFA00               ;2 
       STA    RESP0               ;3 
       STA    RESP1               ;3 
       STA    WSYNC               ;3 
       STA    HMOVE               ;3 
       LDA    #$07                ;2 
       STA    $F0                 ;3 
       LDA    #$FE                ;2 
       STA    $F1                 ;3 
       LDA    #$03                ;2 
       STA    NUSIZ0              ;3 
       LDA    #$01                ;2 
       STA    NUSIZ1              ;3 
LFA1B:
       LDY    $DC                 ;3 
       LDA    ($F0),Y             ;5 
       TAX                        ;2 
       LDY    $DF                 ;3 
       STA    WSYNC               ;3 
       LDA    ($F0),Y             ;5 
       LDY    $DE                 ;3 
       STA    GRP0                ;3 
       LDA    ($F0),Y             ;5 
       STA    GRP1                ;3 
       LDY    $DD                 ;3 
       LDA    ($F0),Y             ;5 
       STA    $DB                 ;3 
       LDY    #$00                ;2 
       LDA    ($F0),Y             ;5 
       LDY    $DB                 ;3 
       STY    GRP0                ;3 
       STX    GRP1                ;3 
       STA    GRP0                ;3 
       DEC    $F0                 ;5 
       BPL    LFA1B               ;2 
       LDA    #$00                ;2 
       STA    NUSIZ1              ;3 
       STA    GRP0                ;3 
       STA    GRP1                ;3 
       LDX    #$01                ;2 
       BNE    LF9DE               ;2 
LFA50:
       LDA    $F8                 ;3 
       BPL    LFA57               ;2 
       JMP    LFB14               ;3 
LFA57:
       JMP    LFFB7               ;3 
LFA5A:
       LDA    $C9                 ;3 
       BPL    LFA81               ;2 
       LDA    $BD                 ;3 
       ORA    $BC                 ;3 
       BEQ    LFA81               ;2 
       CMP    #$20                ;2 
       BEQ    LFA7D               ;2 
       LDX    #$03                ;2 
       CLC                        ;2 
LFA6B:
       ROR                        ;2 
       BCS    LFA71               ;2 
       INX                        ;2 
       BPL    LFA6B               ;2 
LFA71:
       STX    AUDF0               ;3 
       LDA    #$08                ;2 
       STA    AUDC0               ;3 
       LDA    #$02                ;2 
       STA    AUDV0               ;3 
       BNE    LFA81               ;2 
LFA7D:
       LDA    #$00                ;2 
       STA    AUDV0               ;3 
LFA81:

       LDA    $C9                 ;3 
       BEQ    LFA9D               ;2 
       BMI    LFA9D               ;2 
       CMP    #$01                ;2 
       BEQ    LFA99               ;2 
       EOR    #$0C                ;2 
       STA    AUDF0               ;3 
       LDA    #$0C                ;2 
       STA    AUDC0               ;3 
       LDA    #$08                ;2 
       STA    AUDV0               ;3 
       BNE    LFA9D               ;2 
LFA99:
       LDA    #$00                ;2 
       STA    AUDV0               ;3 
LFA9D:
       LDA    $D3                 ;3 
       CMP    #$11                ;2 
       BCS    LFAB7               ;2 
       CMP    #$02                ;2 
       BCC    LFAB3               ;2 
       STA    AUDV0               ;3 
       LDA    #$08                ;2 
       STA    AUDC0               ;3 
       LDA    #$FF                ;2 
       STA    AUDF0               ;3 
       BMI    LFAB7               ;2 
LFAB3:
       LDA    #$00                ;2 
       STA    AUDV0               ;3 
LFAB7:
       LDA    $ED                 ;3 
       BEQ    LFAD4               ;2 
       BMI    LFAD4               ;2 
       LSR                        ;2 
       BEQ    LFAD0               ;2 
       EOR    #$07                ;2 
       STA    AUDF0               ;3 
       ASL                        ;2 
       ORA    COLUP1              ;3 
       STA    AUDC0               ;3 
       EOR    #$08                ;2 
       STA    AUDV0               ;3 
       JMP    LFAD4               ;3 
LFAD0:
       LDA    #$00                ;2 
       STA    AUDV0               ;3 
LFAD4:
       LDA    $F4                 ;3 
       BEQ    LFAF3               ;2 
       BMI    LFAF3               ;2 
       CMP    #$02                ;2 
       BEQ    LFAEF               ;2 
       LSR                        ;2 
       TAX                        ;2 
       ASL                        ;2 
       STA    AUDF1               ;3 
       LDA    LFF07,X             ;4 
       EOR    #$07                ;2 
       STA    AUDV1               ;3 
       STA    AUDC1               ;3 
       JMP    LFAF3               ;3 
LFAEF:
       LDA    #$00                ;2 
       STA    AUDV1               ;3 
LFAF3:
       LDA    $F7                 ;3 
       CMP    #$01                ;2 
       BNE    LFB14               ;2 
       LDA    $F6                 ;3 
       BEQ    LFB14               ;2 
       CMP    #$01                ;2 
       BEQ    LFB10               ;2 
       TAX                        ;2 
       AND    #$0F                ;2 
       STA    AUDF0               ;3 
       LDA    LF000,X             ;4 
       STA    AUDC0               ;3 
       STA    AUDV0               ;3 
       JMP    LFB14               ;3 
LFB10:
       LDA    #$00                ;2 
       STA    AUDV0               ;3 
LFB14:
       LDA    $ED                 ;3 
       CMP    #$0A                ;2 
       BNE    LFB1E               ;2 
       LDA    #$03                ;2 
       STA    $E7                 ;3 
LFB1E:
       LDA    $E6                 ;3 
       ORA    CXBLPF              ;3 
       BPL    LFB4A               ;2 
       LDA    #$01                ;2 
       STA    $D6                 ;3 

       LDA    #$9F                ;2 
       LDX    #$04                ;2 
LFB2C:
       STA    $BE,X               ;4 
       DEX                        ;2 
       BPL    LFB2C               ;2 
       STA    $CF                 ;3 
  IF ORIGINAL
       LDA    #$FF                ;2 
       STA    $D7                 ;3 
  ELSE
       NOP                        ;2 X is still #$FF from above loop
       STX    $D7                 ;3 
  ENDIF
;1 byte saved
       LDA    #$00                ;2 
       STA    $E6                 ;3 
       LDX    #$13                ;2 
LFB3D:
       STA    $A2,X               ;4 
       DEX                        ;2 
       BPL    LFB3D               ;2 
       LDA    #$FF                ;2 
       STA    $C9                 ;3 
       LDA    $FD                 ;3 
       STA    $E7                 ;3 
LFB4A:
       LDA    $FB                 ;3 
       BEQ    LFB5F               ;2 
       LDX    #$01                ;2 
       LDA    #$04                ;2 
       JSR    LFBF0               ;6 
       BCC    LFB5F               ;2 
       TAY                        ;2 
       LDA    LFCEF,Y             ;4 
       STA    $80                 ;3 
       STA    $85                 ;3 
LFB5F:
       LDX    #$00                ;2 
       LDA    #$0C                ;2 
       JSR    LFBF0               ;6 
       BCC    LFB97               ;2 
  IF ORIGINAL
       LDA    #$00                ;2 
       STA    $DF                 ;3 
  ELSE
       NOP                        ;2 
       STX    $DF                 ;3 X not changed by JSR...could use it instead
  ENDIF
;1 byte saved
       LDA    $BC                 ;3 
       STA    $DC                 ;3 
       LDA    $BD                 ;3 
       STA    $DD                 ;3 
       LDY    #$04                ;2 
LFB76:
       LDX    #$01                ;2 
LFB78:
       LDA    LFD04,X             ;4 
       STA    $DE                 ;3 
       LDA    #$00                ;2 
       ROR    $DC,X               ;6 
       ROL                        ;2 
       ASL                        ;2 
       CLC                        ;2 
       ADC    $9E                 ;3 
       TXS                        ;2 
       TAX                        ;2 
       LDA    LFCF1,X             ;4 
       STA    ($DE),Y             ;6 
       TSX                        ;2 
       DEX                        ;2 
       BPL    LFB78               ;2 
       DEY                        ;2 
       BNE    LFB76               ;2 
  IF ORIGINAL
       LDX    #$FF                ;2 
  ELSE
       NOP                        ;2 X is still #$FF from above loop
  ENDIF
;1 byte saved
       TXS                        ;2 
LFB97:
       LDA    $C9                 ;3 
       BEQ    LFB9F               ;2 
       BMI    LFB9F               ;2 
       DEC    $C9                 ;5 
LFB9F:
       LDA    $ED                 ;3 
       BEQ    LFBDB               ;2 
       BMI    LFBDB               ;2 
       LDA    #$00                ;2 
       STA    $DF                 ;3 
       LDX    #$01                ;2 
LFBAB:
       LDA    LFD04,X             ;4 
       STA    $DE                 ;3 
       LDA    $D9,X               ;4 
       STA    $DD                 ;3 
       LDY    #$04                ;2 
LFBB6:
       CLC                        ;2 
       ROR    $DD                 ;5 
       BCC    LFBC5               ;2 
       LDA    #$26                ;2 
       STA    ($DE),Y             ;6 
       DEC    $ED                 ;5 
       BEQ    LFBCD               ;2 
       BNE    LFBDB               ;2 
LFBC5:
       DEY                        ;2 
       BNE    LFBB6               ;2 
       DEX                        ;2 
       BPL    LFBAB               ;2 
       BMI    LFBDB               ;2 
LFBCD:
       DEC    $ED                 ;5 
       LDA    $D9,X               ;4 
       ORA    $EE,X               ;4 
       STA    $EE,X               ;4 
       LDA    #$00                ;2 
       STA    $D9,X               ;4 
       DEC    $F9                 ;5 
LFBDB:
       JMP    LFE50               ;3 
LFBDE:
       LDA    INTIM               ;4 
       BNE    LFBDE               ;2 
       STA    WSYNC               ;3 

  IF ORIGINAL
       LDA    #$00                ;2 
  ELSE
       NOP                        ;2 A is still #00 from above loop
  ENDIF
;1 byte saved

       STA    PF0                 ;3 
       STA    PF1                 ;3 
       STA    PF2                 ;3 
       JMP    LFF8B               ;3 
LFBF0:
       DEC    $9A,X               ;6 
       BNE    LFBFF               ;2 
       STA    $9A,X               ;4 
       LDA    $9E,X               ;4 
       EOR    #$01                ;2 
       STA    $9E,X               ;4 
       SEC                        ;2 
       BCS    LFC00               ;2 
LFBFF:
       CLC                        ;2 
LFC00:
       RTS                        ;6 

LFC01:
       CLC                        ;2 
       ADC    $DB                 ;3 
       BVC    LFC0C               ;2 
       CLC                        ;2 
       ADC    #$10                ;2 
       SEC                        ;2 
       SBC    #$01                ;2 
LFC0C:
       RTS                        ;6 

  IF ORIGINAL = 0
LFFF8:
       .byte $05,$10,$20,$50
  ENDIF

  ORG $FC0D

       .byte $00 ; |        | $FC0D
       .byte $00 ; |        | $FC0E
       .byte $00 ; |        | $FC0F
       .byte $00 ; |        | $FC10
       .byte $00 ; |        | $FC11
       .byte $00 ; |        | $FC12
       .byte $00 ; |        | $FC13
       .byte $00 ; |        | $FC14
       .byte $00 ; |        | $FC15
       .byte $00 ; |        | $FC16
       .byte $00 ; |        | $FC17
       .byte $00 ; |        | $FC18
       .byte $00 ; |        | $FC19
       .byte $00 ; |        | $FC1A
       .byte $00 ; |        | $FC1B
       .byte $00 ; |        | $FC1C
       .byte $00 ; |        | $FC1D
       .byte $00 ; |        | $FC1E
       .byte $00 ; |        | $FC1F
       .byte $00 ; |        | $FC20
       .byte $00 ; |        | $FC21
       .byte $00 ; |        | $FC22
       .byte $00 ; |        | $FC23
       .byte $00 ; |        | $FC24
       .byte $00 ; |        | $FC25
       .byte $00 ; |        | $FC26
       .byte $08 ; |    X   | $FC27
       .byte $10 ; |   X    | $FC28
       .byte $00 ; |        | $FC29
       .byte $08 ; |    X   | $FC2A
       .byte $18 ; |   XX   | $FC2B
       .byte $18 ; |   XX   | $FC2C
       .byte $00 ; |        | $FC2D
       .byte $00 ; |        | $FC2E
       .byte $00 ; |        | $FC2F
       .byte $00 ; |        | $FC30
       .byte $00 ; |        | $FC31
       .byte $00 ; |        | $FC32
       .byte $00 ; |        | $FC33
       .byte $00 ; |        | $FC34
       .byte $00 ; |        | $FC35
       .byte $00 ; |        | $FC36
       .byte $00 ; |        | $FC37
       .byte $00 ; |        | $FC38
       .byte $00 ; |        | $FC39
       .byte $00 ; |        | $FC3A
       .byte $00 ; |        | $FC3B
       .byte $00 ; |        | $FC3C
       .byte $00 ; |        | $FC3D
       .byte $00 ; |        | $FC3E
       .byte $00 ; |        | $FC3F
       .byte $00 ; |        | $FC40
       .byte $00 ; |        | $FC41
       .byte $00 ; |        | $FC42
       .byte $00 ; |        | $FC43
       .byte $00 ; |        | $FC44
       .byte $00 ; |        | $FC45
       .byte $00 ; |        | $FC46
       .byte $00 ; |        | $FC47
       .byte $00 ; |        | $FC48
       .byte $50 ; | X X    | $FC49
       .byte $05 ; |     X X| $FC4A
       .byte $81 ; |X      X| $FC4B
       .byte $24 ; |  X  X  | $FC4C
       .byte $00 ; |        | $FC4D
       .byte $00 ; |        | $FC4E
       .byte $00 ; |        | $FC4F
       .byte $00 ; |        | $FC50
       .byte $00 ; |        | $FC51
       .byte $00 ; |        | $FC52
       .byte $00 ; |        | $FC53
       .byte $00 ; |        | $FC54
       .byte $00 ; |        | $FC55
       .byte $00 ; |        | $FC56
       .byte $00 ; |        | $FC57
       .byte $00 ; |        | $FC58
       .byte $00 ; |        | $FC59
       .byte $00 ; |        | $FC5A
       .byte $00 ; |        | $FC5B
       .byte $00 ; |        | $FC5C
       .byte $00 ; |        | $FC5D
       .byte $00 ; |        | $FC5E
       .byte $00 ; |        | $FC5F
       .byte $00 ; |        | $FC60
       .byte $00 ; |        | $FC61
       .byte $00 ; |        | $FC62
       .byte $00 ; |        | $FC63
       .byte $00 ; |        | $FC64
       .byte $00 ; |        | $FC65
       .byte $00 ; |        | $FC66
       .byte $00 ; |        | $FC67
       .byte $00 ; |        | $FC68
       .byte $00 ; |        | $FC69
       .byte $00 ; |        | $FC6A
       .byte $00 ; |        | $FC6B
       .byte $00 ; |        | $FC6C
       .byte $00 ; |        | $FC6D
       .byte $00 ; |        | $FC6E
       .byte $00 ; |        | $FC6F
       .byte $00 ; |        | $FC70
       .byte $02 ; |      X | $FC71
       .byte $02 ; |      X | $FC72
       .byte $02 ; |      X | $FC73
       .byte $02 ; |      X | $FC74
       .byte $00 ; |        | $FC75
       .byte $00 ; |        | $FC76
       .byte $00 ; |        | $FC77
       .byte $00 ; |        | $FC78
       .byte $00 ; |        | $FC79
       .byte $00 ; |        | $FC7A
       .byte $00 ; |        | $FC7B
       .byte $00 ; |        | $FC7C
       .byte $00 ; |        | $FC7D
       .byte $00 ; |        | $FC7E
       .byte $00 ; |        | $FC7F
       .byte $00 ; |        | $FC80
       .byte $00 ; |        | $FC81
       .byte $00 ; |        | $FC82
       .byte $00 ; |        | $FC83
       .byte $00 ; |        | $FC84
       .byte $00 ; |        | $FC85
       .byte $00 ; |        | $FC86
       .byte $00 ; |        | $FC87
       .byte $00 ; |        | $FC88
       .byte $00 ; |        | $FC89
       .byte $00 ; |        | $FC8A
       .byte $00 ; |        | $FC8B
       .byte $00 ; |        | $FC8C
       .byte $00 ; |        | $FC8D
       .byte $00 ; |        | $FC8E
       .byte $00 ; |        | $FC8F
       .byte $00 ; |        | $FC90
       .byte $00 ; |        | $FC91
       .byte $00 ; |        | $FC92
       .byte $00 ; |        | $FC93
       .byte $00 ; |        | $FC94
       .byte $00 ; |        | $FC95
       .byte $00 ; |        | $FC96
       .byte $00 ; |        | $FC97
       .byte $00 ; |        | $FC98
       .byte $00 ; |        | $FC99
       .byte $00 ; |        | $FC9A
       .byte $00 ; |        | $FC9B
       .byte $00 ; |        | $FC9C
       .byte $02 ; |      X | $FC9D
       .byte $02 ; |      X | $FC9E
LFC9F:
       .byte $00 ; |        | $FC9F
       .byte $00 ; |        | $FCA0
       .byte $00 ; |        | $FCA1
       .byte $00 ; |        | $FCA2
       .byte $00 ; |        | $FCA3
       .byte $00 ; |        | $FCA4
       .byte $00 ; |        | $FCA5
       .byte $00 ; |        | $FCA6
       .byte $00 ; |        | $FCA7
       .byte $00 ; |        | $FCA8
       .byte $00 ; |        | $FCA9
       .byte $00 ; |        | $FCAA
       .byte $00 ; |        | $FCAB
       .byte $00 ; |        | $FCAC
       .byte $00 ; |        | $FCAD
       .byte $00 ; |        | $FCAE
       .byte $00 ; |        | $FCAF
       .byte $00 ; |        | $FCB0
       .byte $00 ; |        | $FCB1
       .byte $00 ; |        | $FCB2
       .byte $00 ; |        | $FCB3
       .byte $00 ; |        | $FCB4
       .byte $00 ; |        | $FCB5
       .byte $00 ; |        | $FCB6
       .byte $00 ; |        | $FCB7
       .byte $00 ; |        | $FCB8
       .byte $00 ; |        | $FCB9
       .byte $00 ; |        | $FCBA
       .byte $00 ; |        | $FCBB
       .byte $00 ; |        | $FCBC
       .byte $00 ; |        | $FCBD
       .byte $00 ; |        | $FCBE
       .byte $00 ; |        | $FCBF
       .byte $00 ; |        | $FCC0
       .byte $00 ; |        | $FCC1
       .byte $00 ; |        | $FCC2
       .byte $00 ; |        | $FCC3
       .byte $00 ; |        | $FCC4
       .byte $00 ; |        | $FCC5
       .byte $00 ; |        | $FCC6
       .byte $00 ; |        | $FCC7
       .byte $00 ; |        | $FCC8
       .byte $00 ; |        | $FCC9
       .byte $00 ; |        | $FCCA
       .byte $00 ; |        | $FCCB
       .byte $00 ; |        | $FCCC
       .byte $00 ; |        | $FCCD
       .byte $00 ; |        | $FCCE
       .byte $00 ; |        | $FCCF
       .byte $00 ; |        | $FCD0
       .byte $00 ; |        | $FCD1
       .byte $00 ; |        | $FCD2
       .byte $00 ; |        | $FCD3
       .byte $00 ; |        | $FCD4
       .byte $00 ; |        | $FCD5
       .byte $00 ; |        | $FCD6
       .byte $00 ; |        | $FCD7
       .byte $00 ; |        | $FCD8
       .byte $00 ; |        | $FCD9
       .byte $00 ; |        | $FCDA
       .byte $00 ; |        | $FCDB
       .byte $00 ; |        | $FCDC
       .byte $00 ; |        | $FCDD
       .byte $00 ; |        | $FCDE
       .byte $00 ; |        | $FCDF
       .byte $00 ; |        | $FCE0
       .byte $00 ; |        | $FCE1
       .byte $00 ; |        | $FCE2
       .byte $00 ; |        | $FCE3
       .byte $00 ; |        | $FCE4
       .byte $00 ; |        | $FCE5
       .byte $00 ; |        | $FCE6
       .byte $00 ; |        | $FCE7
       .byte $00 ; |        | $FCE8
       .byte $00 ; |        | $FCE9
       .byte $00 ; |        | $FCEA
       .byte $00 ; |        | $FCEB
       .byte $00 ; |        | $FCEC
       .byte $00 ; |        | $FCED
       .byte $00 ; |        | $FCEE
LFCEF:
       .byte $48 ; | X  X   | $FCEF
       .byte $5A ; | X XX X | $FCF0
LFCF1:
       .byte $02 ; |      X | $FCF1
       .byte $14 ; |   X X  | $FCF2
       .byte $02 ; |      X | $FCF3
       .byte $02 ; |      X | $FCF4
LFCF5:
       .byte $0D ; |    XX X| $FCF5
LFCF6:
       .byte $FC ; |XXXXXX  | $FCF6
       .byte $0D ; |    XX X| $FCF7
       .byte $FC ; |XXXXXX  | $FCF8
LFCF9:
       .byte $2D ; |  X XX X| $FCF9
LFCFA:
       .byte $FC ; |XXXXXX  | $FCFA
       .byte $9F ; |X  XXXXX| $FCFB
       .byte $FC ; |XXXXXX  | $FCFC
LFCFD:
       .byte $14 ; |   X X  | $FCFD
       .byte $1C ; |   XXX  | $FCFE
       .byte $22 ; |  X   X | $FCFF
       .byte $06 ; |     XX | $FD00
       .byte $0E ; |    XXX | $FD01
LFD02:
       .byte $55 ; | X X X X| $FD02
       .byte $AA ; |X X X X | $FD03
LFD04:
       .byte $85 ; |X    X X| $FD04
       .byte $80 ; |X       | $FD05

  IF ORIGINAL = 0
START:
  ENDIF

LFD06:
       SEI                        ;2 
       CLD                        ;2 
       LDA    #$00                ;2 
       TAX                        ;2 
LFD0B:
       STA    VSYNC,X             ;4 
       INX                        ;2 
       BNE    LFD0B               ;2 
       DEX                        ;2 
       TXS                        ;2 
       JSR    LFD7B               ;6 
       LDA    #$38                ;2 
       STA    $80                 ;3 
       STA    $85                 ;3 

       LDA    #$FF                ;2 
       STA    $97                 ;3 
       STA    $99                 ;3 


       LDA    #>LFC9F             ;2 
       STA    $C4                 ;3 
       STA    $D0                 ;3 
       STA    $D2                 ;3 
       LDA    #>LFC9F             ;2 
       STA    $BA                 ;3 
       LDA    #<LFC9F             ;2 
       STA    $CF                 ;3 
       STA    $D1                 ;3 
       STA    $B9                 ;3 
       STA    $BF                 ;3 
       STA    $BE                 ;3 
       LDA    #$0D                ;2 
       STA    $E8                 ;3 
       STA    $E9                 ;3 
       LDA    #$10                ;2 
       STA    $EB                 ;3 
       LDA    #$0C                ;2 
       STA    $9A                 ;3 
       STX    $C9                 ;3 
       STX    $D7                 ;3 
       STX    $F8                 ;3 
       STX    $D4                 ;3 
       INX                        ;2 
       INX                        ;2 
       STX    $94                 ;3 
       STX    $FC                 ;3 
       INX                        ;2 
       STX    $9D                 ;3 
       INX                        ;2 
       STX    $EC                 ;3 
       INX                        ;2 
       STX    $9B                 ;3 
       STX    $9C                 ;3 
       INX                        ;2 
       STX    $CD                 ;3 
       STX    $B7                 ;3 
       STX    $B8                 ;3 
       STX    $C6                 ;3 
       JMP    LFF8B               ;3 
LFD6C:
       LDA    $95                 ;3 
       LSR                        ;2 
       LDA    $94                 ;3 
       ROR                        ;2 
       EOR    $95                 ;3 
       LDY    $94                 ;3 
       STA    $94                 ;3 
       STY    $95                 ;3 
       RTS                        ;6 

LFD7B:
       LDX    #$04                ;2 
LFD7D:
       LDA    #$02                ;2 
       STA    $85,X               ;4 
       STA    $80,X               ;4 
       LDA    #$9F                ;2 
       STA    $BE,X               ;4 
       DEX                        ;2 
       CPX    #$01                ;2 
       BNE    LFD7D               ;2 
       LDX    #$09                ;2 
LFD8E:
       LDA    #$B6                ;2 
       STA    $8A,X               ;4 
       DEX                        ;2 
       LDA    #$14                ;2 
       STA    $8A,X               ;4 
       DEX                        ;2 
       BPL    LFD8E               ;2 
       LDA    #$83                ;2 
       STA    $8A                 ;3 
       LDA    #$03                ;2 
       STA    $8B                 ;3 
       LDA    #$08                ;2 
       STA    $F9                 ;3 
       LDA    #$10                ;2 
       STA    $EB                 ;3 
       RTS                        ;6 

LFDAB:
       LDA    $FB                 ;3 
       BEQ    LFDD6               ;2 
       LDA    #$20                ;2 
       STA    $DB                 ;3 
       LDA    $B6                 ;3 
       BEQ    LFDC8               ;2 
       LDA    $8B                 ;3 
       JSR    LFC01               ;6 
       STA    $8B                 ;3 
       LDA    $8A                 ;3 
       JSR    LFC01               ;6 
       STA    $8A                 ;3 
       JMP    LFDD6               ;3 
LFDC8:
       LDA    $8B                 ;3 
       JSR    LFECB               ;6 
       STA    $8B                 ;3 
       LDA    $8A                 ;3 
       JSR    LFECB               ;6 
       STA    $8A                 ;3 
LFDD6:
       JMP    LF187               ;3 
LFDD9:
       LDA    $F4                 ;3 
       BNE    LFDE5               ;2 
       LDA    CXPPMM              ;3 
       BPL    LFDE5               ;2 
       LDA    #$46                ;2 
       STA    $F4                 ;3 
LFDE5:
       RTS                        ;6 

LFDE6:
       LDA    $F4                 ;3 
       BEQ    LFDF6               ;2 
       BMI    LFDF6               ;2 
       LDA    #<LFF82             ;2 
       STA    $B9                 ;3 
       LDA    #>LFF82             ;2 
       STA    $BA                 ;3 
       DEC    $F4                 ;5 
LFDF6:
       RTS                        ;6 

  ORG $FDF7

LFDF7:
       .byte $00 ; |        | $FDF7
       .byte $00 ; |        | $FDF8
       .byte $01 ; |       X| $FDF9
       .byte $03 ; |      XX| $FDFA
       .byte $00 ; |        | $FDFB
       .byte $00 ; |        | $FDFC
       .byte $00 ; |        | $FDFD
       .byte $00 ; |        | $FDFE
       .byte $00 ; |        | $FDFF
       .byte $3E ; |  XXXXX | $FE00
       .byte $63 ; | XX   XX| $FE01
       .byte $63 ; | XX   XX| $FE02
       .byte $63 ; | XX   XX| $FE03
       .byte $63 ; | XX   XX| $FE04
       .byte $63 ; | XX   XX| $FE05
       .byte $63 ; | XX   XX| $FE06
       .byte $3E ; |  XXXXX | $FE07
       .byte $1E ; |   XXXX | $FE08
       .byte $0C ; |    XX  | $FE09
       .byte $0C ; |    XX  | $FE0A
       .byte $0C ; |    XX  | $FE0B
       .byte $0C ; |    XX  | $FE0C
       .byte $0C ; |    XX  | $FE0D
       .byte $1C ; |   XXX  | $FE0E
       .byte $0C ; |    XX  | $FE0F
       .byte $7F ; | XXXXXXX| $FE10
       .byte $60 ; | XX     | $FE11
       .byte $60 ; | XX     | $FE12
       .byte $3E ; |  XXXXX | $FE13
       .byte $03 ; |      XX| $FE14
       .byte $03 ; |      XX| $FE15
       .byte $43 ; | X    XX| $FE16
       .byte $3E ; |  XXXXX | $FE17
       .byte $3E ; |  XXXXX | $FE18
       .byte $43 ; | X    XX| $FE19
       .byte $03 ; |      XX| $FE1A
       .byte $03 ; |      XX| $FE1B
       .byte $1E ; |   XXXX | $FE1C
       .byte $03 ; |      XX| $FE1D
       .byte $43 ; | X    XX| $FE1E
       .byte $3E ; |  XXXXX | $FE1F
       .byte $06 ; |     XX | $FE20
       .byte $06 ; |     XX | $FE21
       .byte $06 ; |     XX | $FE22
       .byte $3F ; |  XXXXXX| $FE23
       .byte $26 ; |  X  XX | $FE24
       .byte $16 ; |   X XX | $FE25
       .byte $0E ; |    XXX | $FE26
       .byte $06 ; |     XX | $FE27
       .byte $3E ; |  XXXXX | $FE28
       .byte $43 ; | X    XX| $FE29
       .byte $03 ; |      XX| $FE2A
       .byte $03 ; |      XX| $FE2B
       .byte $7E ; | XXXXXX | $FE2C
       .byte $60 ; | XX     | $FE2D
       .byte $60 ; | XX     | $FE2E
       .byte $7F ; | XXXXXXX| $FE2F
       .byte $3E ; |  XXXXX | $FE30
       .byte $63 ; | XX   XX| $FE31
       .byte $63 ; | XX   XX| $FE32
       .byte $63 ; | XX   XX| $FE33
       .byte $7E ; | XXXXXX | $FE34
       .byte $60 ; | XX     | $FE35
       .byte $60 ; | XX     | $FE36
       .byte $3E ; |  XXXXX | $FE37
       .byte $30 ; |  XX    | $FE38
       .byte $30 ; |  XX    | $FE39
       .byte $10 ; |   X    | $FE3A
       .byte $08 ; |    X   | $FE3B
       .byte $04 ; |     X  | $FE3C
       .byte $02 ; |      X | $FE3D
       .byte $41 ; | X     X| $FE3E
       .byte $7F ; | XXXXXXX| $FE3F
       .byte $3E ; |  XXXXX | $FE40
       .byte $63 ; | XX   XX| $FE41
       .byte $63 ; | XX   XX| $FE42
       .byte $63 ; | XX   XX| $FE43
       .byte $3E ; |  XXXXX | $FE44
       .byte $63 ; | XX   XX| $FE45
       .byte $63 ; | XX   XX| $FE46
       .byte $3E ; |  XXXXX | $FE47
       .byte $3E ; |  XXXXX | $FE48
       .byte $43 ; | X    XX| $FE49
       .byte $03 ; |      XX| $FE4A
       .byte $3F ; |  XXXXXX| $FE4B
       .byte $63 ; | XX   XX| $FE4C
       .byte $63 ; | XX   XX| $FE4D
       .byte $63 ; | XX   XX| $FE4E
       .byte $3E ; |  XXXXX | $FE4F

LFE50:
       LDA    #$00                ;2 
       STA    $DF                 ;3 
       LDX    #$01                ;2 
LFE56:
       LDA    LFD04,X             ;4 
       STA    $DE                 ;3 
       LDA    $EE,X               ;4 
       STA    $DC                 ;3 
       LDY    #$04                ;2 
LFE61:
       CLC                        ;2 
       ROR    $DC                 ;5 
       BCC    LFE6A               ;2 
       LDA    #$38                ;2 
       STA    ($DE),Y             ;6 
LFE6A:
       DEY                        ;2 
       BNE    LFE61               ;2 
       DEX                        ;2 
       BPL    LFE56               ;2 
       LDA    $F4                 ;3 
       BNE    LFEC8               ;2 
       DEC    $E8                 ;5 
       BNE    LFE81               ;2 
       LDA    $E9                 ;3 
       STA    $E8                 ;3 
       JSR    LFD6C               ;6 
       STA    $EA                 ;3 
LFE81:
       LDA    $EB                 ;3 
       STA    $DB                 ;3 
       LDX    #$09                ;2 
       LDA    $BC                 ;3 
       STA    $DE                 ;3 
       LDA    $BD                 ;3 
       STA    $DF                 ;3 
       LDA    #$01                ;2 
       STA    $DC                 ;3 
LFE93:
       TXA                        ;2 
       AND    #$01                ;2 
       STX    $DD                 ;3 
       TAX                        ;2 
       LDA    $DC                 ;3 
       ROR    $DE,X               ;6 
       BCS    LFEBF               ;2 
       LDX    $DD                 ;3 
       BIT    $EA                 ;3 
       BEQ    LFEAC               ;2 
       LDA    $8A,X               ;4 
       JSR    LFC01               ;6 
       BNE    LFEB1               ;2 
LFEAC:
       LDA    $8A,X               ;4 
       JSR    LFECB               ;6 
LFEB1:
       TAY                        ;2 
       AND    #$0F                ;2 
       CMP    #$01                ;2 
       BCC    LFEBF               ;2 
       CMP    #$0A                ;2 
       BCS    LFEBF               ;2 
       TYA                        ;2 
       STA    $8A,X               ;4 
LFEBF:
       LDX    $DD                 ;3 
       ASL    $DC                 ;5 
       DEX                        ;2 
       CPX    #$01                ;2 
       BNE    LFE93               ;2 
LFEC8:
       JMP    LFBDE               ;3 
LFECB:
       SEC                        ;2 
       SBC    $DB                 ;3 
       BVC    LFED6               ;2 
;???
       SEC                        ;2 
       SBC    #$10                ;2 
       CLC                        ;2 
       ADC    #$01                ;2 
LFED6:
       RTS                        ;6 

LFED7:
       LDA    $F4                 ;3 
       BPL    LFEFC               ;2 
       DEC    $F6                 ;5 
       BNE    LFEFC               ;2 
       LDA    #$00                ;2 
       STA    $F4                 ;3 
       LDX    #$03                ;2 
LFEE5:
       STA    $E1,X               ;4 
       DEX                        ;2 
       BPL    LFEE5               ;2 
       LDA    $F7                 ;3 
       BEQ    LFEF0               ;2 
       DEC    $F7                 ;5 
LFEF0:
       LDA    #$05                ;2 
       STA    $B7                 ;3 
       LDA    #<LFF70             ;2 
       STA    $B9                 ;3 
       LDA    #>LFF70             ;2 
       STA    $BA                 ;3 
LFEFC:
       RTS                        ;6 

  ORG $FEFD

LFEFD:
       .byte $00 ; |        | $FEFD
       .byte $00 ; |        | $FEFE
       .byte $00 ; |        | $FEFF
       .byte $02 ; |      X | $FF00
       .byte $06 ; |     XX | $FF01
       .byte $00 ; |        | $FF02
       .byte $00 ; |        | $FF03

;gfx,color,gfx,color...etc :)
;crab1
       .byte $24 ; |  X  X  | $FF04
       .byte $0E ; |    XXX | $FF05
       .byte $18 ; |   XX   | $FF06
LFF07:
       .byte $46 ; | X   XX | $FF07
       .byte $3C ; |  XXXX  | $FF08
       .byte $46 ; | X   XX | $FF09
       .byte $7E ; | XXXXXX | $FF0A
       .byte $46 ; | X   XX | $FF0B
       .byte $81 ; |X      X| $FF0C
       .byte $9E ; |X  XXXX | $FF0D
       .byte $81 ; |X      X| $FF0E
       .byte $9E ; |X  XXXX | $FF0F
       .byte $42 ; | X    X | $FF10
       .byte $2E ; |  X XXX | $FF11
       .byte $00 ; |        | $FF12
       .byte $00 ; |        | $FF13
       .byte $00 ; |        | $FF14
       .byte $00 ; |        | $FF15

;crab2
       .byte $24 ; |  X  X  | $FF16
       .byte $0E ; |    XXX | $FF17
       .byte $18 ; |   XX   | $FF18
       .byte $46 ; | X   XX | $FF19
       .byte $3C ; |  XXXX  | $FF1A
       .byte $46 ; | X   XX | $FF1B
       .byte $24 ; |  X  X  | $FF1C
       .byte $46 ; | X   XX | $FF1D
       .byte $42 ; | X    X | $FF1E
       .byte $9E ; |X  XXXX | $FF1F
       .byte $42 ; | X    X | $FF20
       .byte $9E ; |X  XXXX | $FF21
       .byte $24 ; |  X  X  | $FF22
       .byte $2E ; |  X XXX | $FF23
       .byte $00 ; |        | $FF24
       .byte $00 ; |        | $FF25
       .byte $00 ; |        | $FF26
       .byte $00 ; |        | $FF27
       .byte $00 ; |        | $FF28

;claw1
       .byte $0E ; |    XXX | $FF29
       .byte $13 ; |   X  XX| $FF2A
       .byte $46 ; | X   XX | $FF2B
       .byte $21 ; |  X    X| $FF2C
       .byte $46 ; | X   XX | $FF2D
       .byte $86 ; |X    XX | $FF2E
       .byte $76 ; | XXX XX | $FF2F
       .byte $34 ; |  XX X  | $FF30
       .byte $9E ; |X  XXXX | $FF31
       .byte $05 ; |     X X| $FF32
       .byte $9E ; |X  XXXX | $FF33
       .byte $00 ; |        | $FF34
       .byte $2E ; |  X XXX | $FF35
       .byte $00 ; |        | $FF36
       .byte $00 ; |        | $FF37
       .byte $00 ; |        | $FF38
       .byte $00 ; |        | $FF39
       .byte $00 ; |        | $FF3A

;claw2
       .byte $0E ; |    XXX | $FF3B
       .byte $00 ; |        | $FF3C
       .byte $46 ; | X   XX | $FF3D
       .byte $00 ; |        | $FF3E
       .byte $46 ; | X   XX | $FF3F
       .byte $00 ; |        | $FF40
       .byte $46 ; | X   XX | $FF41
       .byte $00 ; |        | $FF42
       .byte $9E ; |X  XXXX | $FF43
       .byte $00 ; |        | $FF44
       .byte $9E ; |X  XXXX | $FF45
       .byte $00 ; |        | $FF46
       .byte $2E ; |  X XXX | $FF47
       .byte $00 ; |        | $FF48
       .byte $00 ; |        | $FF49
       .byte $00 ; |        | $FF4A
       .byte $00 ; |        | $FF4B
       .byte $00 ; |        | $FF4C
       .byte $00 ; |        | $FF4D

;barrier1
       .byte $24 ; |  X  X  | $FF4E
       .byte $0E ; |    XXX | $FF4F
       .byte $18 ; |   XX   | $FF50
       .byte $EC ; |XXX XX  | $FF51
       .byte $3C ; |  XXXX  | $FF52
       .byte $EC ; |XXX XX  | $FF53
       .byte $24 ; |  X  X  | $FF54
       .byte $EC ; |XXX XX  | $FF55
       .byte $28 ; |  X X   | $FF56
       .byte $2E ; |  X XXX | $FF57
       .byte $14 ; |   X X  | $FF58
       .byte $2E ; |  X XXX | $FF59
       .byte $00 ; |        | $FF5A
       .byte $00 ; |        | $FF5B
       .byte $00 ; |        | $FF5C
       .byte $00 ; |        | $FF5D
       .byte $00 ; |        | $FF5E
       .byte $00 ; |        | $FF5F

;barrier2
       .byte $24 ; |  X  X  | $FF60
       .byte $0E ; |    XXX | $FF61
       .byte $18 ; |   XX   | $FF62
       .byte $EC ; |XXX XX  | $FF63
       .byte $7E ; | XXXXXX | $FF64
       .byte $EC ; |XXX XX  | $FF65
       .byte $24 ; |  X  X  | $FF66
       .byte $EC ; |XXX XX  | $FF67
       .byte $14 ; |   X X  | $FF68
       .byte $2E ; |  X XXX | $FF69
       .byte $28 ; |  X X   | $FF6A
       .byte $2E ; |  X XXX | $FF6B
       .byte $00 ; |        | $FF6C
       .byte $00 ; |        | $FF6D
       .byte $00 ; |        | $FF6E
       .byte $00 ; |        | $FF6F
LFF70:
;swimming duck
       .byte $04 ; |     X  | $FF70
       .byte $0A ; |    X X | $FF71
       .byte $0F ; |    XXXX| $FF72
       .byte $0E ; |    XXX | $FF73
       .byte $04 ; |     X  | $FF74
       .byte $86 ; |X    XX | $FF75
       .byte $FF ; |XXXXXXXX| $FF76
       .byte $C7 ; |XX   XXX| $FF77
       .byte $7E ; | XXXXXX | $FF78
;shooting duck
       .byte $08 ; |    X   | $FF79
       .byte $08 ; |    X   | $FF7A
       .byte $1C ; |   XXX  | $FF7B
       .byte $1C ; |   XXX  | $FF7C
       .byte $1C ; |   XXX  | $FF7D
       .byte $86 ; |X    XX | $FF7E
       .byte $FF ; |XXXXXXXX| $FF7F
       .byte $C7 ; |XX   XXX| $FF80
       .byte $7E ; | XXXXXX | $FF81
LFF82:
;dead duck
       .byte $00 ; |        | $FF82
       .byte $00 ; |        | $FF83
       .byte $00 ; |        | $FF84
       .byte $1E ; |   XXXX | $FF85
       .byte $08 ; |    X   | $FF86
       .byte $08 ; |    X   | $FF87
       .byte $1E ; |   XXXX | $FF88
       .byte $3F ; |  XXXXXX| $FF89
       .byte $7F ; | XXXXXXX| $FF8A

LFF8B:
       LDX    #$2A                ;2 
       LDA    #$02                ;2 
       STA    WSYNC               ;3 
       STA    VBLANK              ;3 
       STA    VSYNC               ;3 
       STX    TIM8T               ;4 
       LDX    #$37                ;2 
       LDA    #$05                ;2 
       STA    CTRLPF              ;3 
       LDA    #$1E                ;2 
       AND    $D4                 ;3 
       STA    COLUPF              ;3 
       LDA    #$C0                ;2 
       STA    PF0                 ;3 
LFFA8:
       LDA    INTIM               ;4 
       BNE    LFFA8               ;2 
       STA    WSYNC               ;3 
       STA    VSYNC               ;3 
       STX    TIM64T              ;4 
       JMP    LF003               ;3 
LFFB7:
       LDA    $D6                 ;3 
       BEQ    LFFD1               ;2 
       CMP    #$0E                ;2 
       BCS    LFFD5               ;2 
       CMP    #$06                ;2 
       BCC    LFFD1               ;2 
       STA    AUDF1               ;3 
       ASL                        ;2 
       ASL                        ;2 
       EOR    #$0D                ;2 
       STA    AUDC1               ;3 
       EOR    #$0F                ;2 
       STA    AUDV1               ;3 
       BPL    LFFD5               ;2 
LFFD1:
       LDA    #$00                ;2 
       STA    AUDV1               ;3 
LFFD5:
       JMP    LFA5A               ;3 
LFFD8:
       DEC    $E5                 ;5 
       LDA    $E5                 ;3 
       BEQ    LFFE7               ;2 
       CMP    #$80                ;2 
       BNE    LFFF7               ;2 
       LDX    #$01                ;2 
       JMP    LFFE9               ;3 
LFFE7:
       LDX    #$00                ;2 
LFFE9:
       LDY    #$03                ;2 
LFFEB:
       LDA.wy $E1,Y               ;4 
       AND    LFD02,X             ;4 
       STA.wy $E1,Y               ;5 
       DEY                        ;2 
       BPL    LFFEB               ;2 
LFFF7:
       RTS                        ;6 

  IF ORIGINAL
LFFF8:
       .byte $05,$10,$20,$50
  ENDIF

       ORG $FFFC

       .word START, START
