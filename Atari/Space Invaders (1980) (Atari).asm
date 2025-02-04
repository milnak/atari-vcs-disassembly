; Disassembly of .\spaceinv.bin
; Disassembled Tue Dec 10 18:11:33 2024
; Using DiStella v3.02-SNAPSHOT
;
; Command Line: D:\temp\distella.EXE -pafscspaceinv.cfg .\spaceinv.bin
;
; spaceinv.cfg contents:
;
;      GFX FBFE FD66
;      GFX FF4C FFF9
;      DATA FFFA FFFF

      processor 6502

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
RSYNC   =  $03
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
RESBL   =  $14
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

; Game Variations:
;
; ONE PLAYER
; Basic Game
;   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16
; TWO OPPOSING PLAYERS
; Alternating Turns
;  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32
; Competing at Same Time
;  33  34  35  36  37  38  39  40  41  42  43  44  45  46  47  48
; Competing at Same Time Alternating shots
;  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63  64
; TWO PLAYER PARTNERSHIP GAME
; One Player Moves Right, Other Player Moves Left
;  65  66  67  68  69  70  71  72  73  74  75  76  77  78  79  80
; Alternating Firing & Control
;  81  82  83  84  85  86  87  88  89  90  91  92  93  94  95  96
; One Player Moves, Other Player Fires
;  97  98  99 100 101 102 103 104 105 106 107 108 109 110 111 112
; INVISIBLE INVADERS
;                                 XXX XXX XXX XXX XXX XXX XXX XXX
; FAST BOMB
;                 XXX XXX XXX XXX                 XXX XXX XXX XXX
; ZIGZAGGING BOMBS
;         XXX XXX         XXX XXX         XXX XXX         XXX XXX
; MOVING SHIELDS
;     XXX     XXX     XXX     XXX     XXX     XXX     XXX     XXX

; Game variation byte:
;
; 7 - not used
; 6, 5, 4 -  player variation (0-111)
; 3 - INVISIBLE INVADERS
; 2 - FAST BOMB
; 1 - ZIGZAGGING BOMBS
; 0 - MOVING SHIELDS

; game variation 12 (internally 11) = %00001011:
; bits 0, 1 and 3 are all turned on so the game variation has:
; INVISIBLE INVADERS, ZIGZAGGING BOMBS and MOVING SHIELDS
; but no FAST BOMB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Variables segment

       seg.u Variables
	org $80

; $DC  game variation (?)
; $EC mask of player variation from game variation (?)

; $E6  score (high byte, BCD) - score of 115 would have ram_E6=$01, ram_E8 =$15
; $E8  score (low byte, BCD)

; $EE  pattern for alien one
; $F0  pattern for alien two
; $F2  pattern for alien three
; $F4  pattern for alien four
; $F6  pattern for alien five
; $F8  pattern for alien six

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Code segment

	seg Code
       org $f000

LF000: STA    HMCLR   ;3
       LDA    $84     ;3
       BMI    LF006   ;2
LF006: AND    #$0F    ;2
       TAX            ;2
LF009: DEX            ;2
       BPL    LF009   ;2

; The Y register counts down from 9 to 0 (inclusive) to draw ten scan lines
; for each alien in a row. An alien pattern can easily be modified by adjusting
; the low byte of any of the pointers in $ee to $f8. Interestingly, these scan
; lines are drawn without any intermediate WSYNC trigger, purely based on
; careful instruction timing.

; The appearance of each "copy" is changed by loading different sprite patterns
; in the GRP0 and GRP1 registers by carefully timed code:
LF00C: LDA    ($F8),Y ;5 Load pattern for alien six in X.
       TAX            ;2
       LDA    ($EE),Y ;5 Load pattern for alien one in GRP0
       STA    GRP0    ;3
       LDA    ($F0),Y ;5 Load pattern for alien two in GRP1
       STA    GRP1    ;3
       LDA    ($F2),Y ;5 Update pattern for alien three in GRP0
       STA    GRP0    ;3
       LDA    ($F4),Y ;5 Update pattern for alien four in GRP1
       STA    GRP1    ;3
       LDA    ($F6),Y ;5 Update pattern for alien five in GRP0
       STA    GRP0    ;3
       TXA            ;2 Update pattern for alien six in GRP1
       STA    GRP1    ;3
       STA    GRP0    ;3

       DEC    $89     ;5
       DEY            ;2
       PHA            ;3
       PLA            ;4
       PHA            ;3
       PLA            ;4

       LDA    ($F8),Y ;5
       TAX            ;2
       LDA    ($EE),Y ;5
       STA    GRP0    ;3
       LDA    ($F0),Y ;5
       STA    GRP1    ;3
       LDA    ($F2),Y ;5
       STA    GRP0    ;3
       LDA    ($F4),Y ;5
       STA    GRP1    ;3
       LDA    ($F6),Y ;5
       STA    GRP0    ;3
       TXA            ;2
       STA    GRP1    ;3
       STA    GRP0    ;3

       LDA    $89     ;3
       CMP    #$04    ;2
       BCC    LF055   ;2
       LDA    #$00    ;2
       BCS    LF058   ;2
LF055: NOP            ;2
       LDA    #$02    ;2
LF058: STA.w  $001F   ;4
       DEY            ;2
       BPL    LF00C   ;2
       INY            ;2
       STY    GRP0    ;3
       STY    GRP1    ;3
       STY    HMCLR   ;3
       STY    GRP0    ;3
       STY    GRP1    ;3
       STA    WSYNC   ;3
       DEC    $89     ;5
       LDA    $89     ;3
       CMP    #$04    ;2
       BCC    LF077   ;2
       LDA    #$00    ;2
       BCS    LF07A   ;2
LF077: NOP            ;2
       LDA    #$02    ;2
LF07A: STA    ENABL   ;3
       LDY    $80     ;3
       LDA    WSYNC   ;3
       ORA    RSYNC   ;3
       ASL            ;2
       BMI    LF08B   ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       NOP            ;2
       BPL    LF092   ;2
LF08B: LDA    $82     ;3
       ORA    LFCDC,Y ;4
       STA    $82     ;3
LF092: STA    CXCLR   ;3 Clear Collision Latches
       DEY            ;2
       DEC    $8C     ;5
       BPL    LF0A2   ;2
       LDA    #$00    ;2
       STA    VDELP0  ;3
       STA    VDELP1  ;3
       JMP    LF109   ;3
LF0A2: JSR    LFDE9   ;6
LF0A5: STY    $80     ;3
       LDA.wy $0092,Y ;4
       STA    $F8     ;3
       LDX    #$F4    ;2
LF0AE: LSR    $F8     ;5
       BCC    LF0B9   ;2
       LDA    LFCD6,Y ;4
       ADC    $8B     ;3
       BNE    LF0BD   ;2
LF0B9: PHA            ;3
       PLA            ;4
       LDA    #$00    ;2
LF0BD: STA    $FA,X   ;4
       INX            ;2
       INX            ;2
       BMI    LF0AE   ;2
       DEC    $89     ;5
       LDA    $89     ;3
       CMP    #$04    ;2
       BCC    LF0CF   ;2
       LDA    #$00    ;2
       BCS    LF0D2   ;2
LF0CF: NOP            ;2
       LDA    #$02    ;2
LF0D2: STA    ENABL   ;3
       LDA    $C8     ;3
       AND    #$38    ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       CMP    $80     ;3
       BNE    LF0F5   ;2
       LDA    $C8     ;3
       AND    #$07    ;2
       ASL            ;2
       TAX            ;2
       LDA    $C8     ;3
       ROL            ;2
       ROL            ;2
       ROL            ;2
       AND    #$03    ;2
       TAY            ;2
       LDA    LFD1E,Y ;4
       STA    $EE,X   ;4
       JMP    LF0FA   ;3
LF0F5: LDX    #$05    ;2
LF0F7: DEX            ;2
       BPL    LF0F7   ;2
LF0FA: STA    HMCLR   ;3
       JSR    LFDB2   ;6
       LDX    #$06    ;2
LF101: DEX            ;2
       BPL    LF101   ;2
       LDY    #$09    ;2
       JMP    LF000   ;3

LF109: DEC    $8E     ;5
       BMI    LF113   ;2
       JSR    LFDB2   ;6
       JMP    LF109   ;3
LF113: BIT    $98     ;3
       BVS    LF11A   ;2
       JMP    LF1B2   ;3

LF11A: LDA    $DD     ;3
       STA    COLUP0  ;3

       LDA    #$01    ;2
       STA    $8E     ;3
       LDA    #$00    ;2
       STA    $EF     ;3
       STA    $F1     ;3
       STA    $F3     ;3
       LDA    #$AB    ;2
       STA    $EE     ;3
       LDA    #$B4    ;2
       STA    $F0     ;3
       LDA    #$BD    ;2
       STA    $F2     ;3
       LDA    #$11    ;2
       STA    WSYNC   ;3
       STA    HMCLR   ;3
       STA    $F4     ;3
       LDA    $85     ;3
       STA    HMP0    ;3
       AND    #$0F    ;2
       TAY            ;2
LF145: DEY            ;2
       BPL    LF145   ;2
       STA    RESP0   ;3
       DEC    $89     ;5
       LDA    $89     ;3
       CMP    #$04    ;2
       LDA    #$02    ;2
       BCC    LF155   ;2
       LSR            ;2
LF155: STA    ENABL   ;3
       STA    WSYNC   ;3
       STA    HMOVE   ;3
       LDY    #$00    ;2
       LDA    $85     ;3
       BPL    LF163   ;2
       LDA    $85     ;3
LF163: AND    #$0F    ;2
       TAX            ;2
       DEX            ;2
       DEX            ;2
LF168: DEX            ;2
       BPL    LF168   ;2
LF16B: LDA    ($EE),Y ;5
       STA    GRP0    ;3
       NOP            ;2
       LDA    ($F0),Y ;5
       STA    GRP0    ;3
       LDA    ($F2),Y ;5
       STA    GRP0    ;3
       DEC    $F4     ;5
       BMI    LF18E   ;2
       LDA    $F4     ;3
       LSR            ;2
       BCC    LF189   ;2
       INY            ;2
       LDA    #$20    ;2
LF184: LSR            ;2
       BNE    LF184   ;2
       BEQ    LF16B   ;2
LF189: JSR    LFDE9   ;6
       BPL    LF16B   ;2
LF18E: LDA    #$00    ;2
       STA    GRP0    ;3
       STA    WSYNC   ;3
       LDA    WSYNC   ;3
       ASL            ;2
       AND    #$80    ;2
       ORA    $82     ;3
       STA    $82     ;3
       STA    CXCLR   ;3
       JSR    LFDE9   ;6
       STA    HMCLR   ;3
       STA    WSYNC   ;3
       STA    WSYNC   ;3
LF1A8: DEC    $8E     ;5
       BMI    LF1B2   ;2
       JSR    LFDB2   ;6
       JMP    LF1A8   ;3
LF1B2: BIT    $98     ;3
       BPL    LF1B9   ;2
       JMP    LF282   ;3
LF1B9: JSR    LFDE9   ;6
       STA    HMCLR   ;3
       STA    WSYNC   ;3

       LDA    $DF     ;3
       STA    COLUP0  ;3

       LDA    $86     ;3
       STA    HMP0    ;3
       AND    #$0F    ;2
       TAY            ;2
LF1CB: DEY            ;2
       BPL    LF1CB   ;2
       STA    RESP0   ;3
       STA    WSYNC   ;3

       LDA    $E0     ;3
       STA    COLUP1  ;3

       LDA    $87     ;3
       STA    HMP1    ;3
       AND    #$0F    ;2
       TAY            ;2
LF1DD: DEY            ;2
       BPL    LF1DD   ;2
       STA    RESP1   ;3
       STA    WSYNC   ;3
       STA    HMOVE   ;3
       JSR    LFDE9   ;6

; The difficulty switches control the size of the laser cannons
; on the screen. In the b position, the cannon is smaller, and
; therefore easier for the beginning player to use. In the a
; position, the cannon is twice as large, and therefore more
; susceptible to enemy fire.
       LDA    #$00    ;2
       BIT    SWCHB   ;4
       BPL    LF1F2   ;2

       LDA    #$05    ;2 1 = pro (A)
LF1F2: STA    NUSIZ1  ;3 Stretch missile graphics 1x (A=0) or 2x (A=5)

       LDA    #$00    ;2
       BVC    LF1FA   ;2

       LDA    #$05    ;2
LF1FA: STA    NUSIZ0  ;3

       LDA    $98     ;3
       AND    #$10    ;2
       BEQ    LF204   ;2
       LDA    #$0A    ;2
LF204: STA    $F4     ;3
       LDA    $98     ;3
       AND    #$20    ;2
       BEQ    LF20E   ;2
       LDA    #$0A    ;2
LF20E: STA    $F6     ;3
       LDA    $AA     ;3
       LSR            ;2
       STA    WSYNC   ;3
       BCC    LF22E   ;2
       LDX    $C9     ;3
       LDA    LFD16,X ;4
       STA    $F8     ;3
       LDA    #$FF    ;2
       STA    $F9     ;3
       LDA    $CA     ;3
       AND    #$08    ;2
       BNE    LF22C   ;2
       STA    $F4     ;3
       STA    $F6     ;3
LF22C: BPL    LF253   ;2
LF22E: LDA    #$00    ;2
       STA    $F8     ;3
       LDA    $CA     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LDA    $AA     ;3
       AND    #$04    ;2
       BEQ    LF245   ;2
       LDA    #$1E    ;2
       BCS    LF243   ;2
       LDA    #$14    ;2
LF243: STA    $F4     ;3
LF245: LDA    $AA     ;3
       AND    #$02    ;2
       BEQ    LF253   ;2
       LDA    #$14    ;2
       BCS    LF251   ;2
       LDA    #$1E    ;2
LF251: STA    $F6     ;3
LF253: LDX    #$09    ;2
       LDY    #$09    ;2
LF257: STA    WSYNC   ;3
       LDA    #$00    ;2
       STA    PF0     ;3
       LDA    ($F4),Y ;5
       STA    GRP0    ;3
       LDA    ($F6),Y ;5
       STA    GRP1    ;3
       TXA            ;2
       LSR            ;2
       TAY            ;2
       LDA    ($F8),Y ;5
       STA    PF0     ;3
       TXA            ;2
       LSR            ;2
       BCC    LF27D   ;2
       DEC    $89     ;5
       LDA    $89     ;3
       CMP    #$04    ;2
       LDA    #$02    ;2
       BCC    LF27B   ;2
       LSR            ;2
LF27B: STA    ENABL   ;3
LF27D: DEX            ;2
       TXA            ;2
       TAY            ;2
       BPL    LF257   ;2
LF282: STA    WSYNC   ;3

       LDA    #$00    ;2
       STA    NUSIZ0  ;3
       STA    NUSIZ1  ;3

       STA    PF0     ;3
       STA    ENABL   ;3
       STA    GRP0    ;3
       STA    GRP1    ;3
       LDA    $E4     ;3
       STA    COLUBK  ;3 Background Color
       LDA    $81     ;3
       STA    RESP0   ;3
       LDX    #$04    ;2
LF29C: DEX            ;2
       BPL    LF29C   ;2
       STA    RESP1   ;3
       STA    HMCLR   ;3
       LDA    #$E0    ;2
       STA    HMP1    ;3
       STA    WSYNC   ;3
       STA    HMOVE   ;3
       LDA    #$C0    ;2
       STA    GRP0    ;3
       STA    GRP1    ;3
       LDX    #$04    ;2
       LDA    #$00    ;2
LF2B5: STA    $F3,X   ;4
       DEX            ;2
       BNE    LF2B5   ;2
       JSR    LFE08   ;6
       INX            ;2
       JSR    LFE08   ;6
       LDA    $AA     ;3
       AND    #$81    ;2
       BNE    LF2F6   ;2
       BIT    WSYNC   ;3
       BVC    LF2D1   ;2
       LDA    #$04    ;2
       BIT    $AA     ;3
       BEQ    LF2DC   ;2
LF2D1: DEX            ;2
       BIT    RSYNC   ;3
       BVC    LF2F6   ;2
       LDA    #$02    ;2
       BIT    $AA     ;3
       BNE    LF2F6   ;2
LF2DC: ORA    $AA     ;3
       STA    $AA     ;3
       STA    $C6     ;3
       JSR    LFE75   ;6
       LDA    #$06    ;2
       JSR    LFE7E   ;6
       LDA    $C7     ;3
       BNE    LF2F6   ;2
       BIT    $DB     ;3
       BVC    LF2F6   ;2
       LDA    #$02    ;2
       STA    $F4,X   ;4
LF2F6: STA    WSYNC   ;3
LF2F8: LDA    INTIM   ;4
       BNE    LF2F8   ;2
       STA    GRP0    ;3
       STA    GRP1    ;3
       LDA    #$C8    ;2
       STA    TIM8T   ;4
       LDA    #$00    ;2
       STA    $F1     ;3
       TAX            ;2
       LDA    $82     ;3
       BPL    LF36E   ;2
       LDA    $CA     ;3
       LSR            ;2
       BCC    LF316   ;2
       LDX    #$04    ;2
LF316: LDA    $D1,X   ;4
       CMP    #$49    ;2
       BCC    LF320   ;2
       CMP    #$58    ;2
       BCC    LF321   ;2
LF320: INX            ;2
LF321: CPX    #$03    ;2
       BCC    LF331   ;2
       LDA    #$09    ;2
       STA    $EF     ;3
       LDA    #$FF    ;2
       STA    $F2     ;3
       LDA    #$7F    ;2
       BNE    LF33B   ;2
LF331: LDA    #$FF    ;2
       STA    $EF     ;3
       LDA    #$01    ;2
       STA    $F2     ;3
       LDA    #$F6    ;2
LF33B: STA    $D1,X   ;4
       LDA    $D3,X   ;4
       LDY    #$03    ;2
       CLC            ;2
       SBC    $9B     ;3
LF344: DEY            ;2
       CLC            ;2
       ADC    #$E0    ;2
       BPL    LF344   ;2
       ADC    #$20    ;2
       TAX            ;2
       LDA    LFD13,Y ;4
       STA    $F0     ;3
       LDY    $EF     ;3
LF354: TYA            ;2
       CLC            ;2
       ADC    $F2     ;3
       TAY            ;2
       LDA    LFF4C,X ;4
       EOR    #$FF    ;2
       AND    ($F0),Y ;5
       BEQ    LF354   ;2
       JSR    LFD8F   ;6
       DEY            ;2
       JSR    LFD8B   ;6
       INY            ;2
       INY            ;2
       JSR    LFD8B   ;6
LF36E: LDA    $CA     ;3
       LSR            ;2
       BCS    LF376   ;2
       JMP    LF429   ;3
LF376: BIT    $82     ;3
       BVC    LF3A0   ;2
       LDA    $C8     ;3
       AND    #$39    ;2
       CMP    #$39    ;2
       BEQ    LF3A0   ;2
       LDA    #$39    ;2
       STA    $C8     ;3
       LDX    #$01    ;2
       LDA    $98     ;3
       AND    #$04    ;2
       BNE    LF38F   ;2
       DEX            ;2
LF38F: LDA    #$04    ;2
       STA    $C6     ;3
       LSR            ;2
       BIT    $DB     ;3
       BVC    LF399   ;2
       LSR            ;2
LF399: STA    $F4,X   ;4
       LDA    #$05    ;2
       JSR    LFE8B   ;6
LF3A0: LDA    #$06    ;2
       STA    $F0     ;3
LF3A4: DEC    $F0     ;5
       BPL    LF3AB   ;2
       JMP    LF4CF   ;3
LF3AB: LDX    $F0     ;3
       LDA    $82     ;3
       AND    LFCDC,X ;4
       BEQ    LF3A4   ;2
       LDY    #$01    ;2
       LDA    #$35    ;2
       SEC            ;2
       SBC    LFD31,X ;4
       CLC            ;2
       ADC    $90     ;3
       CMP    #$52    ;2
       BCS    LF426   ;2
       CMP    $D5     ;3
       BCS    LF3CE   ;2
       ADC    #$0D    ;2
       CMP    $D5     ;3
       BCC    LF3CE   ;2
       DEY            ;2
LF3CE: STY    $EE     ;3
       LDX    $EE     ;3
       LDY    #$FF    ;2
       LDA    $9A     ;3
       CLC            ;2
       ADC    #$FD    ;2
LF3D9: INY            ;2
       ADC    #$10    ;2
       CMP    $D7,X   ;4
       BCC    LF3D9   ;2
       STY    $EF     ;3
       LDX    $F0     ;3
       LDA    LFCDC,Y ;4
       AND    $92,X   ;4
       BEQ    LF426   ;2
       EOR    $92,X   ;4
       STA    $92,X   ;4
       LDY    $EE     ;3
       LDA    LFCDE,Y ;4
       LDY    #$01    ;2
       AND    $98     ;3
       BNE    LF3FB   ;2
       DEY            ;2
LF3FB: LDA    LFD2B,X ;4
       STA.wy $00F6,Y ;5
       LDA    #$02    ;2
       JSR    LFE7E   ;6
       DEC    $91     ;5
       BNE    LF414   ;2
       LDA    $AA     ;3
       ORA    #$08    ;2
       STA    $AA     ;3
       LDA    #$61    ;2
       STA    $CA     ;3
LF414: JSR    LFBED   ;6
       TXA            ;2
       ASL            ;2
       ASL            ;2
       ASL            ;2
       ORA    $EF     ;3
       STA    $C8     ;3
       LDA    #$F6    ;2
       LDY    $EE     ;3
       STA.wy $00D5,Y ;5
LF426: JMP    LF3A4   ;3
LF429: LSR            ;2
       BCS    LF459   ;2
       LDA    $C8     ;3
       AND    #$39    ;2
       CMP    #$39    ;2
       BEQ    LF459   ;2
       LDA    $9E     ;3
       CMP    #$B4    ;2
       BEQ    LF459   ;2
       LDA    $98     ;3
       LSR            ;2
       BCS    LF445   ;2
       DEC    $9E     ;5
       BNE    LF459   ;2
       BEQ    LF44D   ;2
LF445: INC    $9E     ;5
       LDA    $9E     ;3
       CMP    #$98    ;2
       BCC    LF459   ;2
LF44D: LDA    #$B4    ;2
       STA    $9E     ;3
       LDA    #$00    ;2
       STA    $CC     ;3
       LDA    #$04    ;2
       STA    $C6     ;3

; Read Joystick Controllers
LF459: LDA    SWCHA   ;4 joystick directions (0 = moved)
       TAY            ;2
       ASL            ;2
       ASL            ;2
       ASL            ;2
       ASL            ;2
       STA    $EE     ;3
       AND    #$80    ;2
       STA    $81     ;3
       LDA    $DB     ;3
       CMP    #$90    ;2
       BNE    LF475   ;2
       BIT    $AA     ;3
       BVC    LF47F   ;2
       LDY    $EE     ;3
       BVS    LF47F   ;2
LF475: AND    #$02    ;2
       BEQ    LF47F   ;2
       TYA            ;2
       AND    #$40    ;2
       ORA    $81     ;3
       TAY            ;2

LF47F: LDX    #$01    ;2
LF481: LDA    $AA     ;3
       AND    LFD60,X ;4
       BNE    LF4A0   ;2
       BIT    $EE     ;3
       BMI    LF48E   ;2
       INC    $9C,X   ;6
LF48E: BVS    LF492   ;2
       DEC    $9C,X   ;6
LF492: LDA    $9C,X   ;4
       CMP    #$76    ;2
       BCC    LF49A   ;2
       DEC    $9C,X   ;6
LF49A: CMP    #$23    ;2
       BCS    LF4A0   ;2
       INC    $9C,X   ;6
LF4A0: STY    $EE     ;3
       DEX            ;2
       BPL    LF481   ;2

       LDA    $CA     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       BCS    LF4CF   ;2
       LDA    $DC     ;3 Variation (?)
       LSR            ;2
       BCC    LF4CF   ;2
       LDA    $AA     ;3
       AND    #$10    ;2
       BEQ    LF4C1   ;2
       INC    $9B     ;5
       LDA    $9B     ;3
       CMP    #$35    ;2
       BCC    LF4CF   ;2
       BCS    LF4C9   ;2
LF4C1: DEC    $9B     ;5
       LDA    $9B     ;3
       CMP    #$21    ;2
       BCS    LF4CF   ;2
LF4C9: LDA    $AA     ;3
       EOR    #$10    ;2
       STA    $AA     ;3
LF4CF: LDA    INTIM   ;4
       BNE    LF4CF   ;2

; Main game loop (?)
LF4D4: LDA    #$02    ;2
       STA    VBLANK  ;3
       STA    WSYNC   ;3
       BIT    $AA     ;3
       BMI    LF4F1   ;2

       SED            ;2
       LDX    #$01    ;2
LF4E1: LDA    $E8,X   ;4 Score
       CLC            ;2
       ADC    $F6,X   ;4
       STA    $E8,X   ;4 Score
       LDA    $E6,X   ;4 Score
       ADC    $F4,X   ;4
       STA    $E6,X   ;4 Score
       DEX            ;2
       BPL    LF4E1   ;2

LF4F1: CLD            ;2
       STA    WSYNC   ;3
       LDA    $CA     ;3
       AND    #$07    ;2
       BNE    LF50C   ;2
       LDA    $C8     ;3
       CLC            ;2
       ADC    #$40    ;2
       STA    $C8     ;3
       CMP    #$40    ;2
       BCS    LF50C   ;2
       JSR    LFBF1   ;6
       LDA    #$30    ;2
       STA    $C8     ;3
LF50C: LDA    #$02    ;2
       STA    WSYNC   ;3
       STA    VSYNC   ;3 End VSYNC Period
       STA    WSYNC   ;3
       STA    WSYNC   ;3

; Have to have 37 scanlines of VBLANK time.
; Each scadnline uses 76 cycles, that makes 2888 (37*76) cycles.
; Subtract cycles to set timer, and 3 cycles to STA WSYNC to next line
; Round down
       LDA    #48     ;2
       STA    TIM64T  ;4

       LDA    #$00    ;2
       STA    WSYNC   ;3
       STA    VSYNC   ;3 End VSYNC Period
       LDA    $CA     ;3
       LSR            ;2
       BCC    LF549   ;2
       LDX    #$01    ;2
LF528: LDA    $D5,X   ;4
       CMP    #$79    ;2
       BNE    LF532   ;2
       LDA    #$F6    ;2
       STA    $D5,X   ;4
LF532: LDA    $D5,X   ;4
       CMP    #$EC    ;2
       BCS    LF544   ;2
       LDA    $D5,X   ;4
       ADC    #$FE    ;2
       CMP    #$03    ;2
       BCS    LF542   ;2
       LDA    #$F6    ;2
LF542: STA    $D5,X   ;4
LF544: DEX            ;2
       BPL    LF528   ;2
       BMI    LF5A2   ;2
LF549: LDA    $CA     ;3
       AND    #$0F    ;2
       CMP    #$0F    ;2
       BEQ    LF556   ;2
       JSR    LFDFB   ;6
       STA    $DA     ;3
LF556: LDA    $DC     ;3 Variation (?)
       AND    #$04    ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LDA    #$01    ;2
       TAX            ;2
       BCC    LF563   ;2
       ASL            ;2
LF563: STA    $81     ;3
LF565: LDA    $D1,X   ;4
       CMP    #$EC    ;2
       BCS    LF59F   ;2
       LDA    $DC     ;3 Variation (?)
       AND    #$02    ;2
       BEQ    LF590   ;2
       LDA    $DA     ;3
       CPX    #$00    ;2
       BEQ    LF579   ;2
       ASL            ;2
       ASL            ;2
LF579: ASL            ;2
       BCC    LF590   ;2
       BPL    LF588   ;2
       LDA    $D3,X   ;4
       CMP    #$81    ;2
       BCS    LF590   ;2
       INC    $D3,X   ;6
       BNE    LF590   ;2
LF588: LDA    $D3,X   ;4
       CMP    #$17    ;2
       BCC    LF590   ;2
       DEC    $D3,X   ;6
LF590: LDA    $D1,X   ;4
       CLC            ;2
       ADC    $81     ;3
       STA    $D1,X   ;4
       CMP    #$6C    ;2
       BCC    LF59F   ;2
       LDA    #$F6    ;2
       STA    $D1,X   ;4
LF59F: DEX            ;2
       BPL    LF565   ;2
LF5A2: DEC    $CA     ;5
       BEQ    LF5A9   ;2
       JMP    LF68C   ;3
LF5A9: LDA    $C7     ;3
       BEQ    LF5B1   ;2
       INC    $C7     ;5
       INC    $C7     ;5
LF5B1: BIT    $E5     ;3
       BMI    LF622   ;2
       LDA    $AA     ;3
       AND    #$08    ;2
       BEQ    LF5E5   ;2
       EOR    $AA     ;3
       STA    $AA     ;3
       LDX    $99     ;3
       LDA    LFD0F,X ;4
       STA    $90     ;3
       CPX    #$03    ;2
       BCS    LF5CC   ;2
       INC    $99     ;5
LF5CC: BIT    $98     ;3
       BMI    LF5DF   ;2
       JSR    LFEFA   ;6
       LDA    $AA     ;3
       AND    #$06    ;2
       BNE    LF5E5   ;2
       LDA    $AA     ;3
       ORA    #$01    ;2
       STA    $AA     ;3
LF5DF: LDA    #$40    ;2
       STA    $CA     ;3
       BNE    LF61F   ;2
LF5E5: BIT    $98     ;3
       BPL    LF5F7   ;2
       BIT    $A7     ;3
       BMI    LF60F   ;2
       LDA    $DB     ;3
       CMP    #$10    ;2
       BNE    LF60F   ;2
       LDA    #$00    ;2
       BEQ    LF628   ;2
LF5F7: LDA    $AA     ;3
       AND    #$01    ;2
       BEQ    LF622   ;2
       EOR    $AA     ;3
       STA    $AA     ;3
       LDA    #$50    ;2
       STA    $D9     ;3
       LDA    #$05    ;2
       STA    $C6     ;3
       LDA    $C9     ;3
       BNE    LF65C   ;2
       INC    $C9     ;5
LF60F: LDA    $E5     ;3
       ORA    #$80    ;2
       STA    $E5     ;3
       LDA    $C7     ;3
       BNE    LF622   ;2
       LDA    #$BF    ;2
       STA    $C7     ;3
       BPL    LF622   ;2
LF61F: JMP    LF689   ;3
LF622: LDA    $AA     ;3
       AND    #$06    ;2
       BEQ    LF668   ;2
LF628: ORA    #$01    ;2
       EOR    $AA     ;3
       STA    $AA     ;3
       LDA    #$23    ;2
       STA    $9C     ;3
       LDA    #$75    ;2
       STA    $9D     ;3
       LDA    $DB     ;3
       CMP    #$10    ;2
       BNE    LF65A   ;2
       BIT    $A7     ;3
       BMI    LF65A   ;2
       LDX    #$0A    ;2
LF642: LDY    $90,X   ;4
       LDA    $9F,X   ;4
       STA    $90,X   ;4
       STY    $9F,X   ;4
       DEX            ;2
       BPL    LF642   ;2
       JSR    LFF3A   ;6
       LDA    $AA     ;3
       EOR    #$40    ;2
       STA    $AA     ;3
       AND    #$40    ;2
       BNE    LF65C   ;2
LF65A: DEC    $C9     ;5
LF65C: LDA    #$40    ;2
       STA    $CA     ;3
       LDA    #$B4    ;2
       STA    $9E     ;3
       LDA    #$00    ;2
       STA    $CC     ;3
LF668: DEC    $C6     ;5
       BNE    LF689   ;2
       LDA    $91     ;3
       CMP    #$07    ;2
       BCC    LF689   ;2
       JSR    LFDFB   ;6
       AND    #$01    ;2
       EOR    $98     ;3
       STA    $98     ;3
       LSR            ;2
       LDA    #$98    ;2
       BCC    LF682   ;2
       LDA    #$00    ;2
LF682: STA    $9E     ;3
       LDA    #$04    ;2
       JSR    LFE8B   ;6
LF689: JMP    LF875   ;3

LF68C: LDA    $CA     ;3
       LSR            ;2
       BCS    LF694   ;2
       JMP    LF7DB   ;3

; Check Game Select, Game Reset switches
LF694: LDA    SWCHB   ;4
       AND    #$03    ;2
       CMP    #$02    ;2
       BNE    LF6A3   ;2
; Holding the game select switch down will cause the
; game number to increase continually on the screen.
       JSR    LFEB2   ;6
       JMP    LF744   ;3
LF6A3: LDA    SWCHB   ;4
       AND    #$02    ;2
       BEQ    LF6B3   ;2
; To increase the game number rapidly, depress and
; hold down both the game select and game reset switches.
       LDA    $AA     ;3
       STA    $ED     ;3
       BMI    LF6EE   ;2
       JMP    LF747   ;3

LF6B3: LDA    #$B1    ;2
       STA    $C7     ;3
       BIT    $AA     ;3
       BMI    LF6C9   ;2
       LDA    $AA     ;3
       AND    #$B0    ;2
       ORA    #$80    ;2
       STA    $ED     ;3
       JSR    LFEC0   ;6
       JMP    LF744   ;3

LF6C9: INC    $ED     ;5
       LDA    $ED     ;3
       CMP    #$0F    ;2
       BCC    LF6EE   ;2

; Check if reset switch is pressed?
       LDA    SWCHB   ;4
       LSR            ;2
       LDA    #$0D    ;2
       BCC    LF6DB   ;2
       LDA    #$02    ;2 0 = switch pressed
LF6DB: STA    $ED     ;3
       LDA    $98     ;3
       AND    #$F3    ;2
       STA    $98     ;3
       LDA    $DC     ;3 Variation (?)
       CLC            ;2
       ADC    #$91    ;2 145
       BEQ    LF6EC   ;2
       ADC    #$70    ;2 112
LF6EC: STA    $DC     ;3 Variation (?)
LF6EE: LDA    $AA     ;3
       ORA    #$80    ;2
       STA    $AA     ;3
       LDA    $DC     ;3 Variation (?)
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       STA    $EC     ;3 Player variation (?)
       TAY            ;2
       LDA    LFD4B,Y ;4
       STA    $DB     ;3
       LDA    $98     ;3
       AND    #$CF    ;2
       ORA    LFD52,Y ;4
       STA    $98     ;3
       LDA    #$AA    ;2
       STA    $E7     ;3
       LDA    #$A2    ;2
       STA    $E9     ;3
       LDY    #$00    ;2
       TYA            ;2
       SEC            ;2
       ADC    $DC     ;3 Variation (?)
LF719: CMP    #$0A    ;2
       BCC    LF723   ;2
       INY            ;2
       SBC    #$0A    ;2
       JMP    LF719   ;3
LF723: ADC    LFD39,Y ;4
       STA    $E8     ;3 Score
       LDA    $DC     ;3 Variation (?)
       CMP    #$63    ;2
       LDA    #$AA    ;2
       BCC    LF732   ;2
       LDA    #$A1    ;2
LF732: STA    $E6     ;3 Score
       LDA    $DC     ;3 Variation (?)
       CMP    #$10    ;2
       BCS    LF73C   ;2
       DEC    $E9     ;5
LF73C: CMP    #$09    ;2
       BCS    LF744   ;2
       ADC    #$A1    ;2
       STA    $E8     ;3 Score
LF744: JMP    LF875   ;3

LF747: LDA    $CA     ;3
       LSR            ;2
       BCS    LF74F   ;2
LF74C: JMP    LF7DB   ;3
LF74F: LDA    $C7     ;3
       BNE    LF74C   ;2
       BIT    $98     ;3
       BMI    LF769   ;2
       LDA    $AA     ;3
       AND    #$07    ;2
       BNE    LF769   ;2
       LDA    $DB     ;3
       AND    #$10    ;2
       BEQ    LF7BB   ;2
       LDA    $D5     ;3
       CMP    #$EC    ;2
       BCS    LF76C   ;2
LF769: JMP    LF7D8   ;3
LF76C: LDA    $DB     ;3
       CMP    #$14    ;2
       BEQ    LF77A   ;2
       CMP    #$90    ;2
       BNE    LF77F   ;2
       BIT    $AA     ;3
       BVC    LF79B   ;2
LF77A: BIT    PF0     ;3
       JMP    LF79D   ;3
LF77F: LDA    $DB     ;3
       BPL    LF78D   ;2
       DEC    $D9     ;5
       BNE    LF78D   ;2
       BIT    $AA     ;3
       BVC    LF79F   ;2
       BVS    LF7AB   ;2
LF78D: BIT    $AA     ;3
       BVS    LF7A7   ;2
       LDA    $DB     ;3
       AND    #$20    ;2
       BEQ    LF79B   ;2
       BIT    PF0     ;3
       BPL    LF79F   ;2
LF79B: BIT    REFP1   ;3
LF79D: BMI    LF7D8   ;2
LF79F: LDA    $98     ;3
       AND    #$FB    ;2
       LDX    #$00    ;2
       BPL    LF7B1   ;2
LF7A7: BIT    PF0     ;3
       BMI    LF7D8   ;2
LF7AB: LDX    #$01    ;2
       LDA    $98     ;3
       ORA    #$04    ;2
LF7B1: STA    $98     ;3
       LDY    #$00    ;2
       JSR    LFBAF   ;6
       JMP    LF7D8   ;3
LF7BB: LDY    #$01    ;2
LF7BD: LDX    #$01    ;2
       LDA    $98     ;3
       AND    LFCDE,Y ;4
       BNE    LF7C7   ;2
       DEX            ;2
LF7C7: LDA.wy $00D5,Y ;4
       CMP    #$EC    ;2
       BCC    LF7D5   ;2
       LDA    REFP1,X ;4
       BMI    LF7D5   ;2
       JSR    LFBAF   ;6
LF7D5: DEY            ;2
       BPL    LF7BD   ;2
LF7D8: JMP    LF875   ;3

LF7DB: LDA    $AA     ;3
       AND    #$07    ;2
       BNE    LF7D8   ;2
       TAY            ;2
       LDA    $91     ;3
       BEQ    LF7D8   ;2
       LDA    #$EB    ;2
       STA    $EE     ;3
       CMP    $D2     ;3
       BCS    LF7D8   ;2
       JSR    LFDFB   ;6
       BPL    LF80D   ;2
       AND    #$03    ;2
       ASL            ;2
       STA    $EE     ;3
       LDA    $EA     ;3
       LSR            ;2
       LSR            ;2
       TAX            ;2
LF7FD: TXA            ;2
       SEC            ;2
       ADC    $EE     ;3
       AND    #$07    ;2
       TAX            ;2
       LDA    LFCDC,X ;4
       AND    $EB     ;3
       BEQ    LF7FD   ;2
       BNE    LF83C   ;2
LF80D: LDA    $98     ;3
       AND    #$04    ;2
       BEQ    LF814   ;2
       INY            ;2
LF814: LDX    #$05    ;2
LF816: LDA    LFCDC,X ;4
       AND    $EB     ;3
       BEQ    LF82D   ;2
       LDA    $9A     ;3
       CLC            ;2
       ADC    #$FD    ;2
       CLC            ;2
       ADC    LFD39,X ;4
       CMP.wy $009C,Y ;4
       BCC    LF831   ;2
       STX    $EE     ;3
LF82D: DEX            ;2
       BPL    LF816   ;2
       INX            ;2
LF831: LDA    $EA     ;3
       AND    #$10    ;2
       BNE    LF83C   ;2
       LDA    $EE     ;3
       BMI    LF83C   ;2
       TAX            ;2
LF83C: STX    $EF     ;3
       LDA    LFCDC,X ;4
       STA    $F0     ;3
       LDX    #$FF    ;2
LF845: INX            ;2
       CPX    #$06    ;2
       BCS    LF875   ;2

       LDA    $92,X   ;4
       AND    $F0     ;3
       BEQ    LF845   ;2
       LDA    #$3C    ;2
       ADC    $90     ;3
       SBC    LFD31,X ;4
       STA    $D2     ;3
       SEC            ;2
       SBC    $D1     ;3
       CMP    #$10    ;2
       BCC    LF871   ;2
       CMP    #$F1    ;2
       BCS    LF871   ;2
       LDY    $EF     ;3
       LDA    $9A     ;3
       ADC    LFD39,Y ;4
       ADC    #$04    ;2
       STA    $D4     ;3
       BNE    LF875   ;2

LF871: LDA    #$F6    ;2
       STA    $D2     ;3

LF875: LDA    $AA     ;3
       AND    #$07    ;2
       BNE    LF8F5   ;2
       BIT    $98     ;3
       BMI    LF8F5   ;2
       LDY    #$FF    ;2
       LDA    $91     ;3
       BEQ    LF8F5   ;2
LF885: INY            ;2
       CMP    LFCE4,Y ;4
       BCC    LF885   ;2
       LDA    LFCF6,Y ;4
       STA    $EE     ;3
       LDA    LFCED,Y ;4
       STA    $EF     ;3
       LDA    $CA     ;3
       AND    #$3F    ;2
       STA    $F0     ;3
       CLC            ;2
       ADC    $EF     ;3
       CMP    #$41    ;2
       BCS    LF8F5   ;2
       LDA    $F0     ;3
LF8A4: BEQ    LF8AF   ;2
       CMP    $EF     ;3
       BCC    LF8F5   ;2
       SBC    $EF     ;3
       JMP    LF8A4   ;3
LF8AF: BIT    $8B     ;3
       LDA    #$09    ;2
       BVS    LF8B7   ;2
       LDA    #$FF    ;2
LF8B7: STA    $8B     ;3
       LDA    #$01    ;2
       JSR    LFE7E   ;6
       LDA    $98     ;3
       AND    #$02    ;2
       BEQ    LF8D3   ;2
       LDA    $9A     ;3
       CLC            ;2
       ADC    $EE     ;3
       STA    $9A     ;3
       CMP    $8D     ;3
       BCC    LF8F5   ;2
       LDA    $8D     ;3
       BNE    LF8E0   ;2
LF8D3: LDA    $9A     ;3
       SEC            ;2
       SBC    $EE     ;3
       STA    $9A     ;3
       CMP    #$17    ;2
       BCS    LF8F5   ;2
       LDA    #$17    ;2
LF8E0: STA    $9A     ;3
       LDA    $98     ;3
       EOR    #$02    ;2
       STA    $98     ;3
       BMI    LF8F5   ;2
       BIT    $AA     ;3
       BMI    LF8F5   ;2
       LDA    $90     ;3
       CLC            ;2
       ADC    #$05    ;2
       STA    $90     ;3
LF8F5: LDA    #$05    ;2
       STA    $8C     ;3
       LDA    #$0B    ;2
       SEC            ;2
       SBC    $90     ;3
       STA    $8E     ;3
       BIT    $98     ;3
       BVS    LF90B   ;2
       LDA    $8E     ;3
       CLC            ;2
       ADC    #$0C    ;2
       STA    $8E     ;3
LF90B: LDX    #$FB    ;2
LF90D: LDA    $97,X   ;4
       BNE    LF91D   ;2
       DEC    $8C     ;5
       LDA    $8E     ;3
       CLC            ;2
       ADC    #$09    ;2
       STA    $8E     ;3
       INX            ;2
       BNE    LF90D   ;2
LF91D: LDA    $8E     ;3
       BPL    LF952   ;2
       LDA    $98     ;3
       AND    #$40    ;2
       BEQ    LF934   ;2
       EOR    $98     ;3
       STA    $98     ;3
       LDA    $8E     ;3
       CLC            ;2
       ADC    #$0C    ;2
       STA    $8E     ;3
       BPL    LF952   ;2
LF934: LDA    #$00    ;2
       STA    $8E     ;3
       LDA    $98     ;3
       BMI    LF952   ;2
       ORA    #$80    ;2
       STA    $98     ;3
       LDY    $8C     ;3
       LDA    $90     ;3
       CLC            ;2
       ADC    LFFF2,Y ;4
       STA    $90     ;3
       JSR    LFE75   ;6
       LDA    #$06    ;2
       JSR    LFE7E   ;6
LF952: LDX    #$05    ;2
       LDA    #$00    ;2
LF956: ORA    $92,X   ;4
       DEX            ;2
       BPL    LF956   ;2
       STA    $EB     ;3
LF95D: LDA    $EB     ;3
       BEQ    LF98E   ;2
       LSR            ;2
       BCS    LF97C   ;2
       JSR    LFBED   ;6
       LDA    #$3A    ;2
       STA    $C8     ;3
       LDX    #$05    ;2
LF96D: LSR    $92,X   ;6
       DEX            ;2
       BPL    LF96D   ;2
       LDA    $9A     ;3
       ADC    #$10    ;2
       STA    $9A     ;3
       LSR    $EB     ;5
       BNE    LF95D   ;2
LF97C: LDX    #$06    ;2
LF97E: DEX            ;2
       LDA    LFCDC,X ;4
       AND    $EB     ;3
       BEQ    LF97E   ;2
       LDA    #$82    ;2
       SEC            ;2
       SBC    LFD39,X ;4
       STA    $8D     ;3
LF98E: LDA    $90     ;3
       STA    $8F     ;3
       LDX    #$04    ;2
LF994: LDA    $99,X   ;4
       JSR    LFD67   ;6
       DEX            ;2
       BNE    LF994   ;2
; Check Color - B/W switch
       LDA    SWCHB   ;4
       AND    #$08    ;2
       TAY            ;2
       BEQ    LF9A6   ;2
       LDA    #$F7    ;2
LF9A6: ORA    #$07    ;2
       STA    $EE     ;3
       LDX    #$F8    ;2
LF9AC: LDA    LFCFF,Y ;4
       EOR    $C7     ;3
       AND    $EE     ;3
       STA    $E5,X   ;4
       INY            ;2
       INX            ;2
       BMI    LF9AC   ;2
       BIT    $AA     ;3
       BMI    LF9C1   ;2
       LDA    $C7     ;3
       BNE    LF9D3   ;2
LF9C1: LDA    $C8     ;3
       AND    #$38    ;2
       CMP    #$30    ;2
       BNE    LF9D3   ;2
       LDA    $DC     ;3 Variation (?)
       AND    #$08    ;2
       BEQ    LF9D3   ;2
       LDA    $E3     ;3
       STA    $E1     ;3

LF9D3: LDA    $DE     ;3
       STA    COLUP0  ;3

       LDA    $E3     ;3
       STA    COLUBK  ;3 Background Color
       LDA    $E2     ;3
       STA    COLUPF  ;3
       LDA    $CA     ;3
       LSR            ;2
       LDX    #$04    ;2
       BCS    LF9E8   ;2
       LDX    #$00    ;2
LF9E8: STX    $EF     ;3
       LDA    $D1,X   ;4
       CMP    $D2,X   ;4
       BCC    LFA1B   ;2
       STA    $81     ;3
       LDA    $D2,X   ;4
       STA    $D1,X   ;4
       LDA    $81     ;3
       STA    $D2,X   ;4
       LDA    $D3,X   ;4
       STA    $81     ;3
       LDA    $D4,X   ;4
       STA    $D3,X   ;4
       LDA    $81     ;3
       STA    $D4,X   ;4
       LDA    $CA     ;3
       LSR            ;2
       BCC    LFA1B   ;2
       LDA    $98     ;3
       AND    #$0C    ;2
       LSR            ;2
       LSR            ;2
       TAY            ;2
       LDA    $98     ;3
       AND    #$F3    ;2
       ORA    LFD1A,Y ;4
       STA    $98     ;3
LFA1B: LDA    $D4,X   ;4
       LDX    #$05    ;2
       JSR    LFD67   ;6
       LDX    $EF     ;3
       LDA    $D1,X   ;4
       STA    $89     ;3
       LDA    $D2,X   ;4
       CMP    #$EC    ;2
       BCS    LFA31   ;2
       SEC            ;2
       SBC    $D1,X   ;4
LFA31: STA    $8A     ;3
       LDA    $D3,X   ;4
       LDX    #$00    ;2
       JSR    LFD67   ;6
       LDX    #$04    ;2
       JSR    LFD7E   ;6
       STA    WSYNC   ;3
       STA    HMOVE   ;3
LFA43: LDA    INTIM   ;4
       BNE    LFA43   ;2
       STA    VBLANK  ;3
       STA    CXCLR   ;3
       LDX    #$00    ;2

; Have to have 37 scanlines of VBLANK time.
; Each scadnline uses 76 cycles, that makes 2888 (37*76) cycles.
; Subtract cycles to set timer, and 3 cycles to STA WSYNC to next line
; Round down
       LDA    #234    ;2
       STA    WSYNC   ;3
       STA    TIM64T  ;4

       STA    HMCLR   ;3
       BIT    $AA     ;3
       BMI    LFA64   ;2
       LDA    $9E     ;3
       CMP    #$B4    ;2
       BEQ    LFA64   ;2
       JMP    LFB0D   ;3

LFA64: LDX    #$07    ;2
       LDY    #$03    ;2

LFA68: LDA.wy $00E6,Y ;4 Score
       AND    #$0F    ;2 mask out the low nibble
       STA    $F0     ;3 store in Temp
       ASL            ;2
       ASL            ;2
       ADC    $F0     ;3 multiply by 5
       ADC    #$54    ;2
       STA    $F0,X   ;4 store leftmost digit
       DEX            ;2

       LDA.wy $00E6,Y ;4 Score
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2 shift right by 4 (BCD: divide by 10)
       STA    $F0     ;3 store in Temp
       ASL            ;2
       ASL            ;2
       ADC    $F0     ;3 multiply by 5
       ADC    #$54    ;2
       STA    $F0,X   ;4
       DEX            ;2
       DEY            ;2
       BPL    LFA68   ;2

       STA    WSYNC   ;3

       LDA    $DF     ;3
       STA    COLUP0  ;3 Set color for left score

; playfield takles two distinct colors
; player 0's color in COLUP0 for left side
; player 1's color in COLUP1 for right side.
       LDA    #$02    ;2
       STA    CTRLPF  ;3 Score mode

       LDA    $E0     ;3
       STA    COLUP1  ;3 Set color for right score

       LDA    #$04    ;2 ($EE) points to $FF04
       STA    $EE     ;3
       LDA    #$FF    ;2
       STA    $EF     ;3
       NOP            ;2
       NOP            ;2

       LDX    #$05    ;2
LFAA7: DEX            ;2
       BPL    LFAA7   ;2

LFAAA: LDY    $F0     ;3
       LDA    ($EE),Y ;5
       STA    PF0     ;3
       LDA    #$00    ;2
       STA    PF1     ;3

       LDY    $F5     ;3
       LDA    ($EE),Y ;5
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       STA    PF2     ;3

       LDY    $F2     ;3
       LDA    ($EE),Y ;5
       STA    PF0     ;3

       LDY    $F7     ;3
       LDA    ($EE),Y ;5
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       STA    PF2     ;3

       LDY    $F4     ;3
       LDA    ($EE),Y ;5
       AND    #$0F    ;2
       STA    $81     ;3

       LDY    $F1     ;3
       LDA    ($EE),Y ;5
       ASL            ;2
       ASL            ;2
       ASL            ;2
       ASL            ;2
       ORA    $81     ;3
       STA    PF1     ;3
       LDA    #$00    ;2
       STA    PF0     ;3
       STA    PF2     ;3

       LDY    $F6     ;3
       LDA    ($EE),Y ;5
       AND    #$0F    ;2
       STA    $81     ;3

       LDY    $F3     ;3
       LDA    ($EE),Y ;5
       ASL            ;2
       ASL            ;2
       ASL            ;2
       ASL            ;2
       ORA    $81     ;3
       STA    PF1     ;3
       DEC    $EE     ;5
       BPL    LFAAA   ;2
       LDA    $89     ;3
       CLC            ;2
       ADC    #$F9    ;2
       STA    $89     ;3
       LDA    #$00    ;2
       STA    PF1     ;3
       BEQ    LFB55   ;2
LFB0D: JSR    LFD67   ;6
       JSR    LFD7E   ;6
       JSR    LFDE9   ;6
       LDA    #$A0    ;2
       STA    $EE     ;3
       LDA    #$FC    ;2
       STA    $EF     ;3

       LDA    #$00    ;2
       STA    NUSIZ0  ;3

       STA    WSYNC   ;3
       STA    HMOVE   ;3
       LDA    $C8     ;3
       AND    #$39    ;2
       CMP    #$39    ;2
       BNE    LFB3C   ;2
       LDA    $C8     ;3
       ROL            ;2
       ROL            ;2
       ROL            ;2
       ROL            ;2
       AND    #$03    ;2
       TAY            ;2
       LDA    LFD1E,Y ;4
       STA    $EE     ;3
LFB3C: STA    WSYNC   ;3
       STA    HMCLR   ;3
       JSR    LFDE9   ;6
       LDY    #$09    ;2
LFB45: STA    WSYNC   ;3
       LDA    ($EE),Y ;5
       STA    GRP0    ;3
       TYA            ;2
       LSR            ;2
       BCS    LFB52   ;2
       JSR    LFDE9   ;6
LFB52: DEY            ;2
       BPL    LFB45   ;2
LFB55: LDA    #$00    ;2
       STA    WSYNC   ;3
       STA    GRP0    ;3
       LDA    $84     ;3
       STA    HMP1    ;3
       STA    HMP0    ;3
       AND    #$0F    ;2
       TAY            ;2
LFB64: DEY            ;2
       BPL    LFB64   ;2
       STA    RESP0   ;3
       LDA    #$06    ;2
       STA    RESP1   ;3
       STA    WSYNC   ;3
       STA    HMOVE   ;3

; Both NUSIZ0 and NUSIZ1 are set to $06 which means single pixel resolution and
; three copies each at a medium spacing.
; The copies of both sprites interlace to form a row of six in a pattern
; "A B A B A B".
       STA    NUSIZ0  ;3
       STA    NUSIZ1  ;3

       LDX    #$0A    ;2
       LDA    #$FC    ;2
LFB79: STA    $EF,X   ;4
       DEX            ;2
       DEX            ;2
       BPL    LFB79   ;2
       JSR    LFDE9   ;6
       LDA    WSYNC   ;3
       AND    #$40    ;2
       STA    $82     ;3
       STA    CXCLR   ;3
       STA    HMCLR   ;3
       LDA    #$F0    ;2
       STA    HMP1    ;3
       STA    WSYNC   ;3
       STA    HMOVE   ;3

       LDA    $E1     ;3
       STA    COLUP0  ;3
       STA    COLUP1  ;3

LFB9A: DEC    $8F     ;5
       BPL    LFBA9   ;2
       LDY    #$05    ;2
       LDA    #$01    ;2
       STA    VDELP0  ;3
       STA    VDELP1  ;3
       JMP    LF0A5   ;3
LFBA9: JSR    LFDB2   ;6
       JMP    LFB9A   ;3
LFBAF: STX    $F2     ;3
       LDX    LFD38,Y ;4
       LDA    $D5,X   ;4
       CMP    #$56    ;2
       BCS    LFBBE   ;2
       CMP    #$45    ;2
       BCS    LFBEC   ;2

LFBBE: LDX    $F2     ;3
       LDA    #$55    ;2
       STA.wy $00D5,Y ;5
       LDA    LFCE2,X ;4
       AND    SWCHB   ;4
       CLC            ;2
       BEQ    LFBD0   ;2
       LDA    #$04    ;2
LFBD0: ADC    #$05    ;2
       ADC    $9C,X   ;4
       STA.wy $00D7,Y ;5
       LDA    #$03    ;2
       JSR    LFE8B   ;6
       LDA    $DB     ;3
       AND    #$80    ;2
       BEQ    LFBEC   ;2
       LDA    $AA     ;3
       EOR    #$40    ;2
       STA    $AA     ;3
       LDA    #$50    ;2
       STA    $D9     ;3
LFBEC: RTS            ;6

LFBED: LDA    $C8     ;3
       AND    #$39    ;2
LFBF1: CMP    #$39    ;2
       BNE    LFBFD   ;2
       LDA    #$B4    ;2
       STA    $9E     ;3
       LDA    #$00    ;2
       STA    $CC     ;3
LFBFD: RTS            ;6

       .byte $00 ; |        | $FBFE
       .byte $00 ; |        | $FBFF

       .byte $00 ; |        | $FC00
       .byte $00 ; |        | $FC01
       .byte $00 ; |        | $FC02
       .byte $00 ; |        | $FC03
       .byte $00 ; |        | $FC04
       .byte $00 ; |        | $FC05
       .byte $00 ; |        | $FC06
       .byte $00 ; |        | $FC07
       .byte $00 ; |        | $FC08
       .byte $00 ; |        | $FC09

       .byte $FE ; |XXXXXXX | $FC0A
       .byte $FE ; |XXXXXXX | $FC0B
       .byte $7C ; | XXXXX  | $FC0C
       .byte $FE ; |XXXXXXX | $FC0D
       .byte $38 ; |  XXX   | $FC0E
       .byte $38 ; |  XXX   | $FC0F
       .byte $7C ; | XXXXX  | $FC10
       .byte $38 ; |  XXX   | $FC11
       .byte $38 ; |  XXX   | $FC12
       .byte $10 ; |   X    | $FC13

       .byte $B6 ; |X XX XX | $FC14
       .byte $BE ; |X XXXXX | $FC15
       .byte $5D ; | X XXX X| $FC16
       .byte $6B ; | XX X XX| $FC17
       .byte $59 ; | X XX  X| $FC18
       .byte $63 ; | XX   XX| $FC19
       .byte $3C ; |  XXXX  | $FC1A
       .byte $4C ; | X  XX  | $FC1B
       .byte $14 ; |   X X  | $FC1C
       .byte $28 ; |  X X   | $FC1D

       .byte $B6 ; |X XX XX | $FC1E
       .byte $BE ; |X XXXXX | $FC1F
       .byte $5D ; | X XXX X| $FC20
       .byte $5B ; | X XX XX| $FC21
       .byte $24 ; |  X  X  | $FC22
       .byte $85 ; |X    X X| $FC23
       .byte $66 ; | XX  XX | $FC24
       .byte $64 ; | XX  X  | $FC25
       .byte $28 ; |  X X   | $FC26
       .byte $10 ; |   X    | $FC27

       .byte $90 ; |X  X    | $FC28
       .byte $88 ; |X   X   | $FC29
       .byte $88 ; |X   X   | $FC2A
       .byte $44 ; | X   X  | $FC2B
       .byte $42 ; | X    X | $FC2C
       .byte $42 ; | X    X | $FC2D
       .byte $FF ; |XXXXXXXX| $FC2E
       .byte $DB ; |XX XX XX| $FC2F
       .byte $5A ; | X XX X | $FC30
       .byte $18 ; |   XX   | $FC31

       .byte $09 ; |    X  X| $FC32
       .byte $11 ; |   X   X| $FC33
       .byte $11 ; |   X   X| $FC34
       .byte $22 ; |  X   X | $FC35
       .byte $42 ; | X    X | $FC36
       .byte $42 ; | X    X | $FC37
       .byte $FF ; |XXXXXXXX| $FC38
       .byte $DB ; |XX XX XX| $FC39
       .byte $7E ; | XXXXXX | $FC3A
       .byte $18 ; |   XX   | $FC3B

       .byte $A5 ; |X X  X X| $FC3C
       .byte $A5 ; |X X  X X| $FC3D
       .byte $A5 ; |X X  X X| $FC3E
       .byte $99 ; |X  XX  X| $FC3F
       .byte $99 ; |X  XX  X| $FC40
       .byte $A5 ; |X X  X X| $FC41
       .byte $FF ; |XXXXXXXX| $FC42
       .byte $5A ; | X XX X | $FC43
       .byte $7E ; | XXXXXX | $FC44
       .byte $3C ; |  XXXX  | $FC45

       .byte $42 ; | X    X | $FC46
       .byte $5A ; | X XX X | $FC47
       .byte $5A ; | X XX X | $FC48
       .byte $5A ; | X XX X | $FC49
       .byte $99 ; |X  XX  X| $FC4A
       .byte $A5 ; |X X  X X| $FC4B
       .byte $FF ; |XXXXXXXX| $FC4C
       .byte $5A ; | X XX X | $FC4D
       .byte $7E ; | XXXXXX | $FC4E
       .byte $3C ; |  XXXX  | $FC4F

       .byte $C3 ; |XX    XX| $FC50
       .byte $24 ; |  X  X  | $FC51
       .byte $18 ; |   XX   | $FC52
       .byte $18 ; |   XX   | $FC53
       .byte $18 ; |   XX   | $FC54
       .byte $5A ; | X XX X | $FC55
       .byte $BD ; |X XXXX X| $FC56
       .byte $A5 ; |X X  X X| $FC57
       .byte $81 ; |X      X| $FC58
       .byte $81 ; |X      X| $FC59

       .byte $24 ; |  X  X  | $FC5A
       .byte $42 ; | X    X | $FC5B
       .byte $24 ; |  X  X  | $FC5C
       .byte $A5 ; |X X  X X| $FC5D
       .byte $99 ; |X  XX  X| $FC5E
       .byte $99 ; |X  XX  X| $FC5F
       .byte $BD ; |X XXXX X| $FC60
       .byte $5A ; | X XX X | $FC61
       .byte $18 ; |   XX   | $FC62
       .byte $00 ; |        | $FC63

       .byte $81 ; |X      X| $FC64
       .byte $42 ; | X    X | $FC65
       .byte $42 ; | X    X | $FC66
       .byte $24 ; |  X  X  | $FC67
       .byte $24 ; |  X  X  | $FC68
       .byte $3C ; |  XXXX  | $FC69
       .byte $7E ; | XXXXXX | $FC6A
       .byte $EB ; |XXX X XX| $FC6B
       .byte $7E ; | XXXXXX | $FC6C
       .byte $3C ; |  XXXX  | $FC6D

       .byte $00 ; |        | $FC6E
       .byte $24 ; |  X  X  | $FC6F
       .byte $5A ; | X XX X | $FC70
       .byte $42 ; | X    X | $FC71
       .byte $24 ; |  X  X  | $FC72
       .byte $3C ; |  XXXX  | $FC73
       .byte $7E ; | XXXXXX | $FC74
       .byte $D7 ; |XX X XXX| $FC75
       .byte $7E ; | XXXXXX | $FC76
       .byte $3C ; |  XXXX  | $FC77

       .byte $77 ; | XXX XXX| $FC78
       .byte $44 ; | X   X  | $FC79
       .byte $44 ; | X   X  | $FC7A
       .byte $44 ; | X   X  | $FC7B
       .byte $5C ; | X XXX  | $FC7C
       .byte $FF ; |XXXXXXXX| $FC7D
       .byte $F3 ; |XXXX  XX| $FC7E
       .byte $F3 ; |XXXX  XX| $FC7F
       .byte $7E ; | XXXXXX | $FC80
       .byte $3C ; |  XXXX  | $FC81

       .byte $EE ; |XXX XXX | $FC82
       .byte $22 ; |  X   X | $FC83
       .byte $22 ; |  X   X | $FC84
       .byte $22 ; |  X   X | $FC85
       .byte $3A ; |  XXX X | $FC86
       .byte $FF ; |XXXXXXXX| $FC87
       .byte $CF ; |XX  XXXX| $FC88
       .byte $CF ; |XX  XXXX| $FC89
       .byte $7E ; | XXXXXX | $FC8A
       .byte $3C ; |  XXXX  | $FC8B
       .byte $E7 ; |XXX  XXX| $FC8C

       .byte $42 ; | X    X | $FC8D
       .byte $7E ; | XXXXXX | $FC8E
       .byte $7E ; | XXXXXX | $FC8F
       .byte $6B ; | XX X XX| $FC90
       .byte $3E ; |  XXXXX | $FC91
       .byte $98 ; |X  XX   | $FC92
       .byte $A4 ; |X X  X  | $FC93
       .byte $42 ; | X    X | $FC94
       .byte $01 ; |       X| $FC95

       .byte $C6 ; |XX   XX | $FC96
       .byte $42 ; | X    X | $FC97
       .byte $7E ; | XXXXXX | $FC98
       .byte $7E ; | XXXXXX | $FC99
       .byte $56 ; | X X XX | $FC9A
       .byte $7C ; | XXXXX  | $FC9B
       .byte $19 ; |   XX  X| $FC9C
       .byte $25 ; |  X  X X| $FC9D
       .byte $42 ; | X    X | $FC9E
       .byte $80 ; |X       | $FC9F

       .byte $00 ; |        | $FCA0
       .byte $38 ; |  XXX   | $FCA1
       .byte $7C ; | XXXXX  | $FCA2
       .byte $FE ; |XXXXXXX | $FCA3
       .byte $FE ; |XXXXXXX | $FCA4
       .byte $AA ; |X X X X | $FCA5
       .byte $FE ; |XXXXXXX | $FCA6
       .byte $7C ; | XXXXX  | $FCA7
       .byte $38 ; |  XXX   | $FCA8
       .byte $00 ; |        | $FCA9

       .byte $00 ; |        | $FCAA
       .byte $00 ; |        | $FCAB
       .byte $00 ; |        | $FCAC
       .byte $24 ; |  X  X  | $FCAD
       .byte $3C ; |  XXXX  | $FCAE
       .byte $76 ; | XXX XX | $FCAF
       .byte $5C ; | X XXX  | $FCB0
       .byte $28 ; |  X X   | $FCB1
       .byte $00 ; |        | $FCB2
       .byte $00 ; |        | $FCB3
       .byte $00 ; |        | $FCB4
       .byte $00 ; |        | $FCB5
       .byte $00 ; |        | $FCB6
       .byte $01 ; |       X| $FCB7
       .byte $24 ; |  X  X  | $FCB8
       .byte $95 ; |X  X X X| $FCB9
       .byte $48 ; | X  X   | $FCBA
       .byte $C7 ; |XX   XXX| $FCBB
       .byte $24 ; |  X  X  | $FCBC
       .byte $90 ; |X  X    | $FCBD
       .byte $20 ; |  X     | $FCBE
       .byte $40 ; | X      | $FCBF
       .byte $5D ; | X XXX X| $FCC0
       .byte $BB ; |X XXX XX| $FCC1
       .byte $B6 ; |X XX XX | $FCC2
       .byte $77 ; | XXX XXX| $FCC3
       .byte $CC ; |XX  XX  | $FCC4
       .byte $2D ; |  X XX X| $FCC5
       .byte $7E ; | XXXXXX | $FCC6
       .byte $CD ; |XX  XX X| $FCC7
       .byte $DA ; |XX XX X | $FCC8
       .byte $6D ; | XX XX X| $FCC9
       .byte $77 ; | XXX XXX| $FCCA
       .byte $77 ; | XXX XXX| $FCCB
       .byte $82 ; |X     X | $FCCC
       .byte $54 ; | X X X  | $FCCD
       .byte $25 ; |  X  X X| $FCCE
       .byte $53 ; | X X  XX| $FCCF
       .byte $C3 ; |XX    XX| $FCD0
       .byte $54 ; | X X X  | $FCD1
       .byte $93 ; |X  X  XX| $FCD2
       .byte $A5 ; |X X  X X| $FCD3
       .byte $99 ; |X  XX  X| $FCD4
       .byte $81 ; |X      X| $FCD5
LFCD6: .byte $28 ; |  X X   | $FCD6
       .byte $78 ; | XXXX   | $FCD7
       .byte $64 ; | XX  X  | $FCD8
       .byte $50 ; | X X    | $FCD9
       .byte $3C ; |  XXXX  | $FCDA
       .byte $8C ; |X   XX  | $FCDB
LFCDC: .byte $01 ; |       X| $FCDC
       .byte $02 ; |      X | $FCDD
LFCDE: .byte $04 ; |     X  | $FCDE
       .byte $08 ; |    X   | $FCDF
       .byte $10 ; |   X    | $FCE0
       .byte $20 ; |  X     | $FCE1

; Port B Console Switch lookup table (?)

LFCE2: .byte $40 ; | X      | $FCE2
       .byte $80 ; |X       | $FCE3
LFCE4: .byte $22 ; |  X   X | $FCE4
       .byte $16 ; |   X XX | $FCE5
       .byte $0C ; |    XX  | $FCE6
       .byte $08 ; |    X   | $FCE7
       .byte $05 ; |     X X| $FCE8
       .byte $04 ; |     X  | $FCE9
       .byte $03 ; |      XX| $FCEA
       .byte $02 ; |      X | $FCEB
       .byte $00 ; |        | $FCEC
LFCED: .byte $20 ; |  X     | $FCED
       .byte $20 ; |  X     | $FCEE
       .byte $15 ; |   X X X| $FCEF
       .byte $15 ; |   X X X| $FCF0
       .byte $10 ; |   X    | $FCF1
       .byte $0B ; |    X XX| $FCF2
       .byte $07 ; |     XXX| $FCF3
       .byte $07 ; |     XXX| $FCF4
       .byte $04 ; |     X  | $FCF5
LFCF6: .byte $01 ; |       X| $FCF6
       .byte $01 ; |       X| $FCF7
       .byte $02 ; |      X | $FCF8
       .byte $02 ; |      X | $FCF9
       .byte $03 ; |      XX| $FCFA
       .byte $03 ; |      XX| $FCFB
       .byte $03 ; |      XX| $FCFC
       .byte $04 ; |     X  | $FCFD
       .byte $05 ; |     X X| $FCFE
LFCFF: .byte $0F ; |    XXXX| $FCFF
       .byte $0E ; |    XXX | $FD00
       .byte $0F ; |    XXXX| $FD01
       .byte $00 ; |        | $FD02
       .byte $02 ; |      X | $FD03
       .byte $00 ; |        | $FD04
       .byte $04 ; |     X  | $FD05
       .byte $02 ; |      X | $FD06
       .byte $34 ; |  XX X  | $FD07
       .byte $52 ; | X X  X | $FD08
       .byte $CC ; |XX  XX  | $FD09
       .byte $F6 ; |XXXX XX | $FD0A
       .byte $14 ; |   X X  | $FD0B
       .byte $0F ; |    XXXX| $FD0C
       .byte $00 ; |        | $FD0D
       .byte $E2 ; |XXX   X | $FD0E
LFD0F: .byte $05 ; |     X X| $FD0F
       .byte $0A ; |    X X | $FD10
       .byte $0F ; |    XXXX| $FD11
       .byte $14 ; |   X X  | $FD12
LFD13: .byte $BD ; |X XXXX X| $FD13
       .byte $B4 ; |X XX X  | $FD14
       .byte $AB ; |X X X XX| $FD15
LFD16: .byte $54 ; | X X X  | $FD16
       .byte $59 ; | X XX  X| $FD17
       .byte $5E ; | X XXXX | $FD18
       .byte $63 ; | XX   XX| $FD19
LFD1A: .byte $00 ; |        | $FD1A
       .byte $08 ; |    X   | $FD1B
       .byte $04 ; |     X  | $FD1C
       .byte $0C ; |    XX  | $FD1D
LFD1E: .byte $AA ; |X X X X | $FD1E
       .byte $B6 ; |X XX XX | $FD1F
       .byte $C0 ; |XX      | $FD20
       .byte $CC ; |XX  XX  | $FD21
LFD22: .byte $3C ; |  XXXX  | $FD22
       .byte $7E ; | XXXXXX | $FD23
       .byte $7E ; | XXXXXX | $FD24
       .byte $7E ; | XXXXXX | $FD25
       .byte $7E ; | XXXXXX | $FD26
       .byte $FF ; |XXXXXXXX| $FD27
       .byte $FF ; |XXXXXXXX| $FD28
       .byte $FF ; |XXXXXXXX| $FD29
       .byte $C3 ; |XX    XX| $FD2A
LFD2B: .byte $05 ; |     X X| $FD2B
       .byte $10 ; |   X    | $FD2C
       .byte $15 ; |   X X X| $FD2D
       .byte $20 ; |  X     | $FD2E
       .byte $25 ; |  X  X X| $FD2F
       .byte $30 ; |  XX    | $FD30
LFD31: .byte $00 ; |        | $FD31
       .byte $09 ; |    X  X| $FD32
       .byte $12 ; |   X  X | $FD33
       .byte $1B ; |   XX XX| $FD34
       .byte $24 ; |  X  X  | $FD35
       .byte $2D ; |  X XX X| $FD36
       .byte $36 ; |  XX XX | $FD37
LFD38: .byte $01 ; |       X| $FD38
LFD39: .byte $00 ; |        | $FD39
       .byte $10 ; |   X    | $FD3A
       .byte $20 ; |  X     | $FD3B
       .byte $30 ; |  XX    | $FD3C
       .byte $40 ; | X      | $FD3D
       .byte $50 ; | X X    | $FD3E
       .byte $60 ; | XX     | $FD3F
       .byte $70 ; | XXX    | $FD40
       .byte $80 ; |X       | $FD41
       .byte $90 ; |X  X    | $FD42
       .byte $00 ; |        | $FD43
LFD44: .byte $10 ; |   X    | $FD44
       .byte $8B ; |X   X XX| $FD45
       .byte $D1 ; |XX X   X| $FD46
       .byte $BF ; |X XXXXXX| $FD47
       .byte $9D ; |X  XXX X| $FD48
       .byte $D1 ; |XX X   X| $FD49
       .byte $D1 ; |XX X   X| $FD4A

; Game variations masks (?)

LFD4B: .byte $18 ; |   XX   | $FD4B
       .byte $10 ; |   X    | $FD4C
       .byte $61 ; | XX    X| $FD4D
       .byte $D1 ; |XX X   X| $FD4E
       .byte $32 ; |  XX  X | $FD4F
       .byte $90 ; |X  X    | $FD50
       .byte $14 ; |   X X  | $FD51

LFD52: .byte $10 ; |   X    | $FD52
       .byte $10 ; |   X    | $FD53
       .byte $30 ; |  XX    | $FD54
       .byte $30 ; |  XX    | $FD55
       .byte $10 ; |   X    | $FD56
       .byte $10 ; |   X    | $FD57
       .byte $10 ; |   X    | $FD58

LFD59: .byte $00 ; |        | $FD59
       .byte $00 ; |        | $FD5A
       .byte $08 ; |    X   | $FD5B
       .byte $00 ; |        | $FD5C
       .byte $00 ; |        | $FD5D
       .byte $00 ; |        | $FD5E
       .byte $00 ; |        | $FD5F

LFD60: .byte $05 ; |     X X| $FD60

LFD61: .byte $03 ; |      XX| $FD61
       .byte $17 ; |   X XXX| $FD62
       .byte $2B ; |  X X XX| $FD63
       .byte $23 ; |  X   XX| $FD64
       .byte $75 ; | XXX X X| $FD65
       .byte $B4 ; |X XX X  | $FD66

LFD67: LDY    #$FF    ;2
       SEC            ;2
LFD6A: INY            ;2
       SBC    #$0F    ;2
       BCS    LFD6A   ;2
       EOR    #$FF    ;2
       SBC    #$06    ;2
       ASL            ;2
       ASL            ;2
       ASL            ;2
       ASL            ;2
       STY    $83,X   ;4
       ORA    $83,X   ;4
       STA    $83,X   ;4
       RTS            ;6

LFD7E: STA    WSYNC   ;3
       NOP            ;2
       INY            ;2
       STA    HMP0,X  ;4
       NOP            ;2
LFD85: DEY            ;2
       BPL    LFD85   ;2
       STA    RESP0,X ;4
       RTS            ;6

LFD8B: CPY    #$09    ;2
       BCS    LFDB1   ;2
LFD8F: STX    $EE     ;3
       INX            ;2
       JSR    LFDFB   ;6
       AND    #$20    ;2
       BNE    LFD9B   ;2
       DEX            ;2
       DEX            ;2
LFD9B: CPX    #$08    ;2
       BCS    LFDA8   ;2
       LDA    $EA     ;3
       CMP    #$C0    ;2
       BCC    LFDA8   ;2
       JSR    LFDAA   ;6
LFDA8: LDX    $EE     ;3
LFDAA: LDA    ($F0),Y ;5
       AND    LFF4C,X ;4
       STA    ($F0),Y ;6
LFDB1: RTS            ;6

LFDB2: DEC    $89     ;5
       LDA    $89     ;3
       BMI    LFDC7   ;2
       CMP    #$04    ;2
       LDA    #$02    ;2
       BCC    LFDBF   ;2
       LSR            ;2
LFDBF: STA    ENABL   ;3
       STA    WSYNC   ;3
       STA    HMCLR   ;3
       BPL    LFDE4   ;2
LFDC7: CLC            ;2
       ADC    $8A     ;3
       STA    $89     ;3
       LDA    #$00    ;2
       STA    WSYNC   ;3
       STA    HMCLR   ;3
       STA    ENABL   ;3
       LDA    $88     ;3
       STA    HMBL    ;3
       AND    #$0F    ;2
       TAY            ;2
LFDDB: DEY            ;2
       BPL    LFDDB   ;2
       STA    RESBL   ;3
       LDA    #$7C    ;2
       STA    $8A     ;3
LFDE4: STA    WSYNC   ;3
       STA    HMOVE   ;3
       RTS            ;6

LFDE9: DEC    $89     ;5
       LDA    $89     ;3
       CMP    #$04    ;2
       BCC    LFDF5   ;2
       LDA    #$00    ;2
       BCS    LFDF8   ;2
LFDF5: NOP            ;2
       LDA    #$02    ;2
LFDF8: STA    ENABL   ;3
       RTS            ;6

LFDFB: LDA    $EA     ;3
       ASL            ;2
       ASL            ;2
       CLC            ;2
       ADC    $EA     ;3
       CLC            ;2
       ADC    #$59    ;2
       STA    $EA     ;3
       RTS            ;6

LFE08: LDA    $C7     ;3
       BNE    LFE68   ;2
       INC    $CD,X   ;6
       LDY    $CB,X   ;4
       BEQ    LFE68   ;2
       CPY    #$05    ;2
       BEQ    LFE1A   ;2
       CPY    #$02    ;2
       BNE    LFE3E   ;2
LFE1A: LDY    $CD,X   ;4
       CPY    #$08    ;2
       BNE    LFE28   ;2
       LDA    $CB,X   ;4
       CMP    #$05    ;2
       BEQ    LFE6C   ;2
       BNE    LFE68   ;2
LFE28: LDA    LFFEA,Y ;4
       STA    AUDF0,X ;4
       LDA    #$0C    ;2
       STA    AUDC0,X ;4
       LDA    #$CB    ;2
       CMP    #$05    ;2
       LDA    #$04    ;2
       BCC    LFE3B   ;2
       LDA    #$08    ;2
LFE3B: STA    AUDV0,X ;4
       RTS            ;6

LFE3E: LDA    LFD44,Y ;4
       STA    $EE     ;3
       LDA    #$FF    ;2
       STA    $EF     ;3
       LDY    $CF,X   ;4
       LDA    ($EE),Y ;5
       CMP    $CD,X   ;4
       BNE    LFE67   ;2
       INY            ;2
       LDA    ($EE),Y ;5
       BMI    LFE68   ;2
       CMP    #$3F    ;2
       BEQ    LFE6C   ;2
       STA    AUDF0,X ;4
       INY            ;2
       LDA    ($EE),Y ;5
       STA    AUDC0,X ;4
       INY            ;2
       LDA    ($EE),Y ;5
       INY            ;2
       STY    $CF,X   ;4
       STA    AUDV0,X ;4
LFE67: RTS            ;6

LFE68: LDA    #$00    ;2
       STA    $CB,X   ;4
LFE6C: LDA    #$00    ;2
       STA    AUDV0,X ;4
       STA    $CD,X   ;4
       STA    $CF,X   ;4
       RTS            ;6

LFE75: LDA    $CA     ;3
       AND    #$01    ;2
       ORA    #$80    ;2
       STA    $CA     ;3
       RTS            ;6

LFE7E: CMP    $CB     ;3
       BCC    LFE8A   ;2
       STA    $CB     ;3
       LDA    #$00    ;2
       STA    $CD     ;3
       STA    $CF     ;3
LFE8A: RTS            ;6

LFE8B: CMP    $CC     ;3
       BCC    LFE97   ;2
       STA    $CC     ;3
       LDA    #$00    ;2
       STA    $CE     ;3
       STA    $D0     ;3
LFE97: RTS            ;6

;===============================================================================
; ROM START

START:
       CLD            ;2 Clear BCD math bit.
       SEI            ;2 Disable interrupts, if there are any.

; Clear memory and TIA registers
       LDX    #$00    ;2
       TXA            ;2
LFE9D: STA    $00,X   ;4
       INX            ;2
       BNE    LFE9D   ;2

       DEX            ;2
       TXS            ;2 Set stack to beginning.

       JSR    LFEB2   ;6

       LDA    #$C5    ;2
       STA    $C7     ;3
       LDA    #$80    ;2
       STA    $AA     ;3
       JMP    LF4D4   ;3

LFEB2: LDA    #$00    ;2
       STA    $E6     ;3 Score
       STA    $E8     ;3 Score
       STA    $E7     ;3
       STA    $E9     ;3
       STA    $C7     ;3
       LDA    #$01    ;2
LFEC0: STA    $AA     ;3
       LDA    #$00    ;2
       STA    $90     ;3
       STA    $99     ;3
       STA    $C6     ;3
       JSR    LFE75   ;6
       LDA    #$03    ;2
       STA    $C9     ;3
       LDA    #$FF    ;2
       STA    $8B     ;3
       LDA    $98     ;3
       AND    #$53    ;2
       LDY    $EC     ;3 Player variation (?)
       ORA    LFD52,Y ;4
       ORA    LFD59,Y ;4
       STA    $98     ;3
       LDA    $E5     ;3
       AND    #$7F    ;2
       STA    $E5     ;3
       JSR    LFEFA   ;6
       LDX    #$0A    ;2
LFEEE: LDA    $90,X   ;4
       STA    $9F,X   ;4
       DEX            ;2
       BPL    LFEEE   ;2
       LDA    #$6E    ;2
       STA    $A7     ;3
       RTS            ;6

LFEFA: LDX    #$05    ;2
       LDA    #$3F    ;2
LFEFE: STA    $92,X   ;4
       DEX            ;2
       BPL    LFEFE   ;2
       STA    $EB     ;3
       STA    $D7     ;3
       STA    $D8     ;3
       STA    $D3     ;3
       STA    $D4     ;3
       LDA    #$F6    ;2
       STA    $D5     ;3
       STA    $D6     ;3
       STA    $D1     ;3
       STA    $D2     ;3

       LDX    #$05    ;2
LFF19: LDA    LFD61,X ;4
       STA    $99,X   ;4
       DEX            ;2
       BNE    LFF19   ;2

       TXA            ;2
       STA    $CB     ;3
       STA    $CC     ;3
       LDA    #$24    ;2
       STA    $91     ;3
       LDA    #$42    ;2
       ORA    $98     ;3
       STA    $98     ;3
       LDA    #$30    ;2
       STA    $C8     ;3
       LDA    $AA     ;3
       AND    #$F7    ;2
       STA    $AA     ;3
LFF3A: LDX    #$1A    ;2
       LDY    #$08    ;2
LFF3E: LDA    LFD22,Y ;4
       STA    $AB,X   ;4
       DEY            ;2
       BPL    LFF48   ;2
       LDY    #$08    ;2
LFF48: DEX            ;2
       BPL    LFF3E   ;2
       RTS            ;6

LFF4C: .byte $7F ; | XXXXXXX| $FF4C
       .byte $BF ; |X XXXXXX| $FF4D
       .byte $DF ; |XX XXXXX| $FF4E
       .byte $EF ; |XXX XXXX| $FF4F
       .byte $F7 ; |XXXX XXX| $FF50
       .byte $FB ; |XXXXX XX| $FF51
       .byte $FD ; |XXXXXX X| $FF52
       .byte $FE ; |XXXXXXX | $FF53

; Digits (0-9) - 4x5 pixels
; two 4-pixel copies of a character in a single byte.
       .byte $E7 ; |XXX  XXX| $FF54
       .byte $A5 ; |X X  X X| $FF55
       .byte $A5 ; |X X  X X| $FF56
       .byte $A5 ; |X X  X X| $FF57
       .byte $E7 ; |XXX  XXX| $FF58

       .byte $E7 ; |XXX  XXX| $FF59
       .byte $42 ; | X    X | $FF5A
       .byte $42 ; | X    X | $FF5B
       .byte $66 ; | XX  XX | $FF5C
       .byte $42 ; | X    X | $FF5D

       .byte $E7 ; |XXX  XXX| $FF5E
       .byte $24 ; |  X  X  | $FF5F
       .byte $E7 ; |XXX  XXX| $FF60
       .byte $81 ; |X      X| $FF61
       .byte $E7 ; |XXX  XXX| $FF62

       .byte $E7 ; |XXX  XXX| $FF63
       .byte $81 ; |X      X| $FF64
       .byte $E7 ; |XXX  XXX| $FF65
       .byte $81 ; |X      X| $FF66
       .byte $E7 ; |XXX  XXX| $FF67

       .byte $81 ; |X      X| $FF68
       .byte $81 ; |X      X| $FF69
       .byte $E7 ; |XXX  XXX| $FF6A
       .byte $A5 ; |X X  X X| $FF6B
       .byte $A5 ; |X X  X X| $FF6C

       .byte $E7 ; |XXX  XXX| $FF6D
       .byte $81 ; |X      X| $FF6E
       .byte $E7 ; |XXX  XXX| $FF6F
       .byte $24 ; |  X  X  | $FF70
       .byte $E7 ; |XXX  XXX| $FF71

       .byte $E7 ; |XXX  XXX| $FF72
       .byte $A5 ; |X X  X X| $FF73
       .byte $E7 ; |XXX  XXX| $FF74
       .byte $24 ; |  X  X  | $FF75
       .byte $24 ; |  X  X  | $FF76

       .byte $81 ; |X      X| $FF77
       .byte $81 ; |X      X| $FF78
       .byte $81 ; |X      X| $FF79
       .byte $81 ; |X      X| $FF7A
       .byte $E7 ; |XXX  XXX| $FF7B

       .byte $E7 ; |XXX  XXX| $FF7C
       .byte $A5 ; |X X  X X| $FF7D
       .byte $E7 ; |XXX  XXX| $FF7E
       .byte $A5 ; |X X  X X| $FF7F
       .byte $E7 ; |XXX  XXX| $FF80

       .byte $81 ; |X      X| $FF81
       .byte $81 ; |X      X| $FF82
       .byte $E7 ; |XXX  XXX| $FF83
       .byte $A5 ; |X X  X X| $FF84
       .byte $E7 ; |XXX  XXX| $FF85

       .byte $00 ; |        | $FF86
       .byte $00 ; |        | $FF87
       .byte $00 ; |        | $FF88
       .byte $00 ; |        | $FF89
       .byte $00 ; |        | $FF8A

       .byte $01 ; |       X| $FF8B
       .byte $16 ; |   X XX | $FF8C
       .byte $09 ; |    X  X| $FF8D
       .byte $0A ; |    X X | $FF8E
       .byte $02 ; |      X | $FF8F
       .byte $19 ; |   XX  X| $FF90

       .byte $08 ; |    X   | $FF91
       .byte $0A ; |    X X | $FF92
       .byte $03 ; |      XX| $FF93
       .byte $1F ; |   XXXXX| $FF94
       .byte $0C ; |    XX  | $FF95

       .byte $08 ; |    X   | $FF96
       .byte $04 ; |     X  | $FF97
       .byte $16 ; |   X XX | $FF98
       .byte $0E ; |    XXX | $FF99
       .byte $07 ; |     XXX| $FF9A

       .byte $06 ; |     XX | $FF9B
       .byte $FF ; |XXXXXXXX| $FF9C
       .byte $01 ; |       X| $FF9D
       .byte $18 ; |   XX   | $FF9E
       .byte $0C ; |    XX  | $FF9F

       .byte $03 ; |      XX| $FFA0
       .byte $03 ; |      XX| $FFA1
       .byte $16 ; |   X XX | $FFA2
       .byte $0C ; |    XX  | $FFA3
       .byte $03 ; |      XX| $FFA4

       .byte $05 ; |     X X| $FFA5
       .byte $14 ; |   X X  | $FFA6
       .byte $0C ; |    XX  | $FFA7
       .byte $03 ; |      XX| $FFA8
       .byte $07 ; |     XXX| $FFA9

       .byte $12 ; |   X  X | $FFAA
       .byte $0C ; |    XX  | $FFAB
       .byte $03 ; |      XX| $FFAC
       .byte $09 ; |    X  X| $FFAD
       .byte $10 ; |   X    | $FFAE

       .byte $0C ; |    XX  | $FFAF
       .byte $03 ; |      XX| $FFB0
       .byte $0B ; |    X XX| $FFB1
       .byte $0E ; |    XXX | $FFB2
       .byte $0C ; |    XX  | $FFB3

       .byte $03 ; |      XX| $FFB4
       .byte $0D ; |    XX X| $FFB5
       .byte $0D ; |    XX X| $FFB6
       .byte $0C ; |    XX  | $FFB7
       .byte $03 ; |      XX| $FFB8
       .byte $0F ; |    XXXX| $FFB9

       .byte $10 ; |   X    | $FFBA
       .byte $0C ; |    XX  | $FFBB
       .byte $03 ; |      XX| $FFBC
       .byte $11 ; |   X   X| $FFBD
       .byte $3F ; |  XXXXXX| $FFBE

       .byte $01 ; |       X| $FFBF
       .byte $18 ; |   XX   | $FFC0
       .byte $08 ; |    X   | $FFC1
       .byte $07 ; |     XXX| $FFC2
       .byte $04 ; |     X  | $FFC3

       .byte $19 ; |   XX  X| $FFC4
       .byte $08 ; |    X   | $FFC5
       .byte $05 ; |     X X| $FFC6
       .byte $10 ; |   X    | $FFC7
       .byte $1C ; |   XXX  | $FFC8

       .byte $08 ; |    X   | $FFC9
       .byte $02 ; |      X | $FFCA
       .byte $30 ; |  XX    | $FFCB
       .byte $1E ; |   XXXX | $FFCC
       .byte $08 ; |    X   | $FFCD

       .byte $01 ; |       X| $FFCE
       .byte $50 ; | X X    | $FFCF
       .byte $FF ; |XXXXXXXX| $FFD0
       .byte $01 ; |       X| $FFD1
       .byte $18 ; |   XX   | $FFD2

       .byte $03 ; |      XX| $FFD3
       .byte $0C ; |    XX  | $FFD4
       .byte $09 ; |    X  X| $FFD5
       .byte $10 ; |   X    | $FFD6
       .byte $0A ; |    X X | $FFD7

       .byte $08 ; |    X   | $FFD8
       .byte $11 ; |   X   X| $FFD9
       .byte $12 ; |   X  X | $FFDA
       .byte $0E ; |    XXX | $FFDB

       .byte $0F ; |    XXXX| $FFDC
       .byte $19 ; |   XX  X| $FFDD
       .byte $16 ; |   X XX | $FFDE
       .byte $0E ; |    XXX | $FFDF
       .byte $08 ; |    X   | $FFE0

       .byte $29 ; |  X X  X| $FFE1
       .byte $1A ; |   XX X | $FFE2
       .byte $0E ; |    XXX | $FFE3
       .byte $04 ; |     X  | $FFE4
       .byte $39 ; |  XXX  X| $FFE5

       .byte $1D ; |   XXX X| $FFE6
       .byte $0E ; |    XXX | $FFE7
       .byte $02 ; |      X | $FFE8
       .byte $49 ; | X  X  X| $FFE9

LFFEA: .byte $FF ; |XXXXXXXX| $FFEA
       .byte $10 ; |   X    | $FFEB
       .byte $0D ; |    XX X| $FFEC
       .byte $0A ; |    X X | $FFED
       .byte $08 ; |    X   | $FFEE
       .byte $07 ; |     XXX| $FFEF
       .byte $06 ; |     XX | $FFF0
       .byte $05 ; |     X X| $FFF1

LFFF2: .byte $06 ; |     XX | $FFF2
       .byte $07 ; |     XXX| $FFF3
       .byte $03 ; |      XX| $FFF4
       .byte $04 ; |     X  | $FFF5
       .byte $05 ; |     X X| $FFF6
       .byte $06 ; |     XX | $FFF7
       .byte $00 ; |        | $FFF8
       .byte $00 ; |        | $FFF9

LFFFA: .word START
       .word START
       .word START
