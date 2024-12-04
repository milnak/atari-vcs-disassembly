; Disassembly of vanguard.001
; Disassembled Sat Apr 30 17:29:56 2005
; Using DiStella v2.0
;
; Command Line: C:\BIN\DISTELLA.EXE -pafscvg1.cfg vanguard.001 > vg1.asm
;
; vg1.cfg contents:
;
;      CODE D000 D6A4
;      GFX D6A5 D6B8
;      CODE D6B9 D7FB
;      GFX D7FC D83B
;      CODE D83C D97A
;      GFX D97B DFF1
;      CODE DFF2 DFF7
;      GFX DFF8 DFFF
;
;
; Disassembly of vanguard.002
; Disassembled Sat Apr 30 17:14:10 2005
; Using DiStella v2.0
;
; Command Line: C:\BIN\DISTELLA.EXE -pafscvg2.cfg vanguard.002 > vg2.asm
;
; vg2.cfg contents:
;
;      CODE F000 F141
;      GFX F142 F165
;      CODE F166 F600
;      GFX F601 F638
;      CODE F639 F6CF
;      GFX F6D0 F6D5
;      CODE F6D6 F6FC
;      GFX F6FD F70C
;      CODE F70D F854
;      GFX F855 F85A
;      CODE F85B FA84
;      GFX FA85 FA8C
;      CODE FA8D FC95
;      GFX FC96 FCA5
;      CODE FCA6 FE3C
;      GFX FE3D FE44
;      CODE FE45 FE72
;      GFX FE73 FE7E
;      CODE FE7F FE9A
;      GFX FE9B FEBD
;      CODE FEBE FF72
;      GFX FF73 FFF1
;      CODE FFF2 FFF7
;      GFX FFF8 FFFF
;      
;
; Command Line: C:\BIN\Dasm vanguard.asm -f3 -otest.bin
;DASM V2.20.10, Macro Assembler (C)1988-2004
;Complete.
;
; Command Line: C:\BIN\FC /b vanguard.bin test.bin
;Comparing files Vanguard.bin and test.bin
;FC: no differences encountered


      processor 6502

;hardware register equates
VSYNC   =  $00 ;Vertical Sync Set-Clear
VBLANK  =  $01 ;Vertical Blank Set-Clear
WSYNC   =  $02 ;Wait for Horizontal Blank
RSYNC   =  $03 ;Reset Horizontal Sync Counter
NUSIZ0  =  $04 ;Number-Size player/missle 0
NUSIZ1  =  $05 ;Number-Size player/missle 1
COLUP0  =  $06 ;Color-Luminance Player 0
COLUP1  =  $07 ;Color-Luminance Player 1
COLUPF  =  $08 ;Color-Luminance Playfield
COLUBK  =  $09 ;Color-Luminance Background
CTRLPF  =  $0A ;Control Playfield, Ball, Collisions
REFP0   =  $0B ;Reflection Player 0
REFP1   =  $0C ;Reflection Player 1
PF0     =  $0D ;Playfield Register Byte 0 (upper nybble used only)
PF1     =  $0E ;Playfield Register Byte 1
PF2     =  $0F ;Playfield Register Byte 2
RESP0   =  $10 ;Reset Player 0
RESP1   =  $11 ;Reset Player 1
RESM0   =  $12 ;Reset Missle 0
RESM1   =  $13 ;Reset Missle 1
RESBL   =  $14 ;Reset Ball
;Audio registers
AUDC0   =  $15 ;Audio Control - Voice 0 (distortion)
AUDC1   =  $16 ;Audio Control - Voice 1 (distortion)
AUDF0   =  $17 ;Audio Frequency - Voice 0
AUDF1   =  $18 ;Audio Frequency - Voice 1
AUDV0   =  $19 ;Audio Volume - Voice 0
AUDV1   =  $1A ;Audio Volume - Voice 1
;Sprite registers
GRP0    =  $1B ;Graphics Register Player 0
GRP1    =  $1C ;Graphics Register Player 1
ENAM0   =  $1D ;Graphics Enable Missle 0
ENAM1   =  $1E ;Graphics Enable Missle 1
ENABL   =  $1F ;Graphics Enable Ball
HMP0    =  $20 ;Horizontal Motion Player 0
HMP1    =  $21 ;Horizontal Motion Player 1
HMM0    =  $22 ;Horizontal Motion Missle 0
HMM1    =  $23 ;Horizontal Motion Missle 1
HMBL    =  $24 ;Horizontal Motion Ball
VDELP0  =  $25 ;Vertical Delay Player 0
VDELP1  =  $26 ;Vertical Delay Player 1
VDEL01  =  $26 ;Vertical Delay Player 1
VDELBL  =  $27 ;Vertical Delay Ball
RESMP0  =  $28 ;Reset Missle 0 to Player 0
RESMP1  =  $29 ;Reset Missle 1 to Player 1
HMOVE   =  $2A ;Apply Horizontal Motion
HMCLR   =  $2B ;Clear Horizontal Move Registers
CXCLR   =  $2C ;Clear Collision Latches
Waste1  =  $2D ;Unused
Waste2  =  $2E ;Unused
Waste3  =  $2F ;Unused
;collisions                     (bit 7) (bit 6)
CXM0P   =  $30 ;Read Collision - M0-P1   M0-P0
CXM1P   =  $31 ;Read Collision - M1-P0   M1-P1
CXP0FB  =  $32 ;Read Collision - P0-PF   P0-BL
CXP1FB  =  $33 ;Read Collision - P1-PF   P1-BL
CXM0FB  =  $34 ;Read Collision - M0-PF   M0-BL
CXM1FB  =  $35 ;Read Collision - M1-PF   M1-BL
CXBLPF  =  $36 ;Read Collision - BL-PF   -----
CXPPMM  =  $37 ;Read Collision - P0-P1   M0-M1
INPT0   =  $38 ;Read Pot Port 0
INPT1   =  $39 ;Read Pot Port 1
INPT2   =  $3A ;Read Pot Port 2
INPT3   =  $3B ;Read Pot Port 3
INPT4   =  $3C ;Read Input - Trigger 0 (bit 7)
INPT5   =  $3D ;Read Input - Trigger 1 (bit 7)
;RIOT registers
SWCHA  = $0280 ;Port A data register for joysticks (High nybble:player0,low nybble:player1)
SWACNT = $0281 ;Port A data direction register (DDR)
SWCHB  = $0282 ;Port B data (console switches) bit pattern LR--B-SR
SWBCNT = $0283 ;Port B data direction register (DDR)
INTIM  = $0284 ;Timer output
TIMINT = $0285 ;
WasteA = $0286 ;Unused/undefined
WasteB = $0287 ;Unused/undefined
WasteC = $0288 ;Unused/undefined
WasteD = $0289 ;Unused/undefined
WasteE = $028A ;Unused/undefined
WasteF = $028B ;Unused/undefined
WasteG = $028C ;Unused/undefined
WasteH = $028D ;Unused/undefined
WasteI = $028E ;Unused/undefined
WasteJ = $028F ;Unused/undefined
WasteK = $0290 ;Unused/undefined
WasteL = $0291 ;Unused/undefined
WasteM = $0292 ;Unused/undefined
WasteN = $0293 ;Unused/undefined
TIM1T  = $0294 ;set 1 clock interval
TIM8T  = $0295 ;set 8 clock interval
TIM64T = $0296 ;set 64 clock interval
T1024T = $0297 ;set 1024 clock interval


       ORG $1000
       RORG $D000

START1:
       STA    $FFF9                   ;4
LD003:
       BEQ    LD008                   ;2
       JMP    LD954                   ;3
LD008:
       STA    HMCLR                   ;3
       LDX    $E9                     ;3
LD00C:
       DEX                            ;2
       BPL    LD011                   ;2
       LDX    #$03                    ;2
LD011:
       LDA    $E3,X                   ;4
       BNE    LD021                   ;2
       CPX    $E9                     ;3
       BNE    LD00C                   ;2
       LDX    #$FF                    ;2
       STX    $B7                     ;3
       STX    $B6                     ;3
       BNE    LD046                   ;2
LD021:
       STA    $B7                     ;3
       STX    $E9                     ;3
       CPX    #$02                    ;2
       BCC    LD02F                   ;2
       ADC    #$0B                    ;2
       LDY    #$00                    ;2
       BEQ    LD033                   ;2
LD02F:
       ADC    #$01                    ;2
       LDY    #$30                    ;2
LD033:
       STA    $B6                     ;3
       STA    WSYNC                   ;3
       STY    NUSIZ0                  ;3
       LDA    $D6,X                   ;4
       STA    HMM0                    ;3
       AND    #$0F                    ;2
       TAX                            ;2
       NOP                            ;2
LD041:
       DEX                            ;2
       BNE    LD041                   ;2
       STA    RESM0                   ;3
LD046:
       LDA    $96                     ;3
       AND    #$01                    ;2
       TAX                            ;2
       LDY    $E7,X                   ;4
       BNE    LD05C                   ;2
       EOR    #$01                    ;2
       TAX                            ;2
       LDY    $E7,X                   ;4
       BNE    LD05C                   ;2
       LDA    #$FF                    ;2
       STA    $B8                     ;3
       BNE    LD06D                   ;2
LD05C:
       STA    WSYNC                   ;3
       STY    $B8                     ;3
       LDA    $DA,X                   ;4
       STA    HMBL                    ;3
       AND    #$0F                    ;2
       TAX                            ;2
       NOP                            ;2
LD068:
       DEX                            ;2
       BNE    LD068                   ;2
       STA    RESBL                   ;3
LD06D:
       BIT    $C6                     ;3
       BVS    LD091                   ;2
       BIT    $F8                     ;3
       BMI    LD091                   ;2
       BVC    LD091                   ;2
       LDA    $F8                     ;3
       CMP    #$47                    ;2
       BCS    LD087                   ;2
       LDA    $96                     ;3
       AND    #$08                    ;2
       BEQ    LD087                   ;2
       LDA    #$04                    ;2
       BNE    LD08F                   ;2
LD087:
       LDA    $96                     ;3
       ASL                            ;2
       ASL                            ;2
       AND    #$F0                    ;2
       ORA    #$0A                    ;2
LD08F:
       STA    COLUP0                  ;3
LD091:
       LDA    $9E                     ;3
       ASL                            ;2
       ADC    $9E                     ;3
       ASL                            ;2
       ASL                            ;2
       STA    $CB                     ;3
       LDA    $DC                     ;3
       SEC                            ;2
       SBC    $CB                     ;3
       CMP    #$04                    ;2
       BCS    LD0AF                   ;2
       DEC    $9E                     ;5
       LDA    $9E                     ;3
       CMP    #$0F                    ;2
       BNE    LD0AF                   ;2
       LDA    #$C0                    ;2
       STA    $9E                     ;3
LD0AF:
       STA    WSYNC                   ;3
       LDA    $CF                     ;3
       STA    HMP0                    ;3
       AND    #$0F                    ;2
       TAX                            ;2
       NOP                            ;2
       NOP                            ;2
       NOP                            ;2
LD0BB:
       DEX                            ;2
       BNE    LD0BB                   ;2
       STA    RESP0                   ;3
       LDA    $C9                     ;3
       CMP    #$4B                    ;2
       BCS    LD0E9                   ;2
       LDA    $C8                     ;3
       CMP    #$69                    ;2
       BEQ    LD0E3                   ;2
       LDX    #$05                    ;2
LD0CE:
       LDA    $AF,X                   ;4
       BMI    LD0E0                   ;2
       LDA    $88                     ;3
       ADC    $DD,X                   ;4
       EOR    $96                     ;3
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       AND    #$30                    ;2
       STA    $AF,X                   ;4
LD0E0:
       DEX                            ;2
       BPL    LD0CE                   ;2
LD0E3:
       LDA    #$00                    ;2
       STA    $E7                     ;3
       STA    $E8                     ;3
LD0E9:
       LDA    #$8C                    ;2
       STA    COLUP1                  ;3
       LDA    $C8                     ;3
       AND    #$0F                    ;2
       TAX                            ;2
       CPX    #$05                    ;2
       BNE    LD106                   ;2
       LDA    $81                     ;3
       BNE    LD106                   ;2
       LDA    $96                     ;3
       AND    #$08                    ;2
       BNE    LD106                   ;2
       LDA    #$67                    ;2
       LDY    #$DE                    ;2
       BNE    LD10C                   ;2
LD106:
       LDY    LD9B6,X                 ;4
       LDA    LD9AC,X                 ;4
LD10C:
       STY    $CB                     ;3
       STA    $CA                     ;3
       LDA    #$00                    ;2
       STA    $CC                     ;3
       LDX    #$05                    ;2
LD116:
       LDA    $AF,X                   ;4
       AND    #$03                    ;2
       TAY                            ;2
       BNE    LD123                   ;2
       LDA    #$E8                    ;2
       LDY    #$DC                    ;2
       BNE    LD16D                   ;2
LD123:
       CMP    #$03                    ;2
       BEQ    LD159                   ;2
       LDA    $96                     ;3
       AND    #$0F                    ;2
       STA    AUDF1                   ;3
       LDA    #$08                    ;2
       STA    AUDC1                   ;3
       LDA    $F7                     ;3
       BEQ    LD137                   ;2
       LDA    #$0C                    ;2
LD137:
       STA    AUDV1                   ;3
       STA    $CC                     ;3
       LDA    $C8                     ;3
       AND    #$F0                    ;2
       CMP    #$40                    ;2
       BEQ    LD14D                   ;2
       CPY    #$02                    ;2
       BNE    LD153                   ;2
       LDA    #$AD                    ;2
       LDY    #$DD                    ;2
       BNE    LD16D                   ;2
LD14D:
       LDA    #$7F                    ;2
       LDY    #$DE                    ;2
       BNE    LD16D                   ;2
LD153:
       LDA    #$C4                    ;2
       LDY    #$DD                    ;2
       BNE    LD16D                   ;2
LD159:
       LDA    $AF,X                   ;4
       BPL    LD163                   ;2
       LDA    #$09                    ;2
       LDY    #$DE                    ;2
       BNE    LD16D                   ;2
LD163:
       LDA    $C8                     ;3
       AND    #$F0                    ;2
       BEQ    LD177                   ;2
       LDY    $CB                     ;3
       LDA    $CA                     ;3
LD16D:
       SEC                            ;2
       SBC    $DD,X                   ;4
       STA    $EA,X                   ;4
       BCS    LD175                   ;2
       DEY                            ;2
LD175:
       STY    $F0,X                   ;4
LD177:
       DEX                            ;2
       BMI    LD17D                   ;2
       JMP    LD116                   ;3
LD17D:
       LDA    $C8                     ;3
       AND    #$F0                    ;2
       BNE    LD19C                   ;2
       LDX    #$05                    ;2
LD185:
       LDA    $AF,X                   ;4
       AND    #$0F                    ;2
       BEQ    LD197                   ;2
       CMP    #$03                    ;2
       BEQ    LD197                   ;2
       CMP    #$0C                    ;2
       BEQ    LD197                   ;2
       CMP    #$0F                    ;2
       BNE    LD1A4                   ;2
LD197:
       DEX                            ;2
       BPL    LD185                   ;2
       BMI    LD1A0                   ;2
LD19C:
       LDA    $CC                     ;3
       BNE    LD1A4                   ;2
LD1A0:
       LDA    #$00                    ;2
       STA    AUDV1                   ;3
LD1A4:
       LDX    #$05                    ;2
       STX    $95                     ;3
       LDA    $C8                     ;3
       AND    #$F0                    ;2
       BEQ    LD1B4                   ;2
       BMI    LD1C2                   ;2
       CMP    #$40                    ;2
       BCC    LD1C2                   ;2
LD1B4:
       LDY    $E2                     ;3
       CPY    #$0D                    ;2
       BCC    LD1C2                   ;2
       LDX    #$E8                    ;2
       LDY    #$DC                    ;2
       LDA    #$80                    ;2
       BNE    LD1C8                   ;2
LD1C2:
       LDX    $EF                     ;3
       LDY    $F5                     ;3
       LDA    #$C0                    ;2
LD1C8:
       STX    $86                     ;3
       STA    WSYNC                   ;3
       STY    $87                     ;3
       STA    $9D                     ;3
       LDA    $D5                     ;3
       STA    HMP1                    ;3
       AND    #$0F                    ;2
       TAX                            ;2
LD1D7:
       DEX                            ;2
       BNE    LD1D7                   ;2
       STA    RESP1                   ;3
       LDA    $C8                     ;3
       CMP    #$69                    ;2
       BNE    LD1FF                   ;2
       LDA    $83                     ;3
       BEQ    LD1FF                   ;2
       DEC    $83                     ;5
       LDX    #$1D                    ;2
       STX    AUDF1                   ;3
       LDX    #$08                    ;2
       STX    AUDC1                   ;3
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       STA    AUDV1                   ;3
       LDA    #$00                    ;2
       STA    $E7                     ;3
       STA    $E8                     ;3
       LDA    #$0E                    ;2
       BCC    LD20B                   ;2
LD1FF:
       LDA    #$04                    ;2
       LDX    $F7                     ;3
       BNE    LD20B                   ;2
       LDA    $96                     ;3
       AND    #$E0                    ;2
       ORA    #$04                    ;2
LD20B:
       STA    COLUBK                  ;3
       LDA    #$FF                    ;2
       STA    $CD                     ;3
       LDA    #$19                    ;2
       STA    $CE                     ;3
       LDX    #$00                    ;2
LD217:
       LDA    INTIM                   ;4
       BNE    LD217                   ;2
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STX    VBLANK                  ;3
       STX    PF0                     ;3
       STX    PF1                     ;3
       STX    PF2                     ;3
       LDX    $88                     ;3
       LDA    LD9E4,X                 ;4
       STA    COLUPF                  ;3
       BIT    $C8                     ;3
       BPL    LD23C                   ;2
       LDX    #$19                    ;2
       LDA    LD9E4,X                 ;4
       STA    COLUPF                  ;3
       LDX    #$0C                    ;2
LD23C:
       STX    $CA                     ;3
       LDA    $8C                     ;3
       STA    $CC                     ;3
       STA    HMCLR                   ;3
       LDY    #$01                    ;2
LD246:
       BIT    $C8                     ;3
       BPL    LD269                   ;2
       LDX    $CE                     ;3
       STA    WSYNC                   ;3
       LDA    $CC                     ;3
       STA    PF0                     ;3
       LDA    ($86),Y                 ;5
       STA    GRP1                    ;3
       LDA    $8D,X                   ;4
       AND    $CD                     ;3
       STA    PF1                     ;3
       LDA    $A7,X                   ;4
       AND    $CD                     ;3
       STA    PF2                     ;3
       LDA    LD9E4,X                 ;4
       STA    COLUPF                  ;3
       BNE    LD286                   ;2
LD269:
       STY    $CB                     ;3
       STA    WSYNC                   ;3
       LDA    ($86),Y                 ;5
       STA    GRP1                    ;3
       LDY    $CA                     ;3
       LDA    ($8D),Y                 ;5
       STA    PF0                     ;3
       LDA    ($8F),Y                 ;5
       STA    PF1                     ;3
       LDA    ($91),Y                 ;5
       STA    PF2                     ;3
       LDA    LD9E4,Y                 ;4
       STA    COLUPF                  ;3
       LDY    $CB                     ;3
LD286:
       INY                            ;2
       LDA    ($86),Y                 ;5
       TAX                            ;2
       LDA    #$01                    ;2
       CPY    $B8                     ;3
       BNE    LD291                   ;2
       ASL                            ;2
LD291:
       STA    ENABL                   ;3
       STA    WSYNC                   ;3
       BIT    $9E                     ;3
       BPL    LD29D                   ;2
       BVS    LD2AA                   ;2
       BVC    LD2A6                   ;2
LD29D:
       LDA    #$00                    ;2
       STA    GRP0                    ;3
       STX    GRP1                    ;3
       INY                            ;2
       BNE    LD2B5                   ;2
LD2A6:
       LDA    #$0F                    ;2
       STA    $9E                     ;3
LD2AA:
       LDA    ($84),Y                 ;5
       STA    GRP0                    ;3
       STX    GRP1                    ;3
       INY                            ;2
       LDA    ($84),Y                 ;5
       STA    GRP0                    ;3
LD2B5:
       LDA    #$01                    ;2
       CPY    $B7                     ;3
       BCC    LD2C0                   ;2
       CPY    $B6                     ;3
       BCS    LD2C0                   ;2
       ASL                            ;2
LD2C0:
       STA    ENAM0                   ;3
       BIT    $C8                     ;3
       BMI    LD2CE                   ;2
       DEC    $CA                     ;5
       BPL    LD2CE                   ;2
       LDX    #$47                    ;2
       STX    $CA                     ;3
LD2CE:
       STA    WSYNC                   ;3
       LDA    ($86),Y                 ;5
       STA    GRP1                    ;3
       INY                            ;2
       LDA    ($86),Y                 ;5
       TAX                            ;2
       STA    HMCLR                   ;3
       LDA    #$01                    ;2
       CPY    $B8                     ;3
       BNE    LD2E1                   ;2
       ASL                            ;2
LD2E1:
       STA    ENABL                   ;3
       LDA    $9E                     ;3
       BEQ    LD2FC                   ;2
       CMP    #$C0                    ;2
       BNE    LD2EF                   ;2
       LDA    #$80                    ;2
       BNE    LD2FE                   ;2
LD2EF:
       LDA    #$00                    ;2
       STA    WSYNC                   ;3
       STA    GRP0                    ;3
       STX    GRP1                    ;3
       DEC    $9E                     ;5
       INY                            ;2
       BNE    LD310                   ;2
LD2FC:
       LDA    #$C0                    ;2
LD2FE:
       STA    $9E                     ;3
       LDA    ($84),Y                 ;5
       STA    WSYNC                   ;3
       STA    GRP0                    ;3
       STX    GRP1                    ;3
       INY                            ;2
       LDA    ($84),Y                 ;5
       STA    GRP0                    ;3
       NOP                            ;2
       NOP                            ;2
       NOP                            ;2
LD310:
       LDA    #$01                    ;2
       CPY    $B7                     ;3
       BCC    LD31B                   ;2
       CPY    $B6                     ;3
       BCS    LD31B                   ;2
       ASL                            ;2
LD31B:
       STA    ENAM0                   ;3
       BIT    $C8                     ;3
       BMI    LD341                   ;2
       LDA    ($86),Y                 ;5
       TAX                            ;2
       STY    $CB                     ;3
       LDY    $CA                     ;3
       LDA    ($8D),Y                 ;5
       STA    WSYNC                   ;3
       STA    PF0                     ;3
       STX    GRP1                    ;3
       LDA    ($8F),Y                 ;5
       STA    PF1                     ;3
       LDA    LD9E4,Y                 ;4
       STA    COLUPF                  ;3
       LDA    ($91),Y                 ;5
       STA    PF2                     ;3
       LDY    $CB                     ;3
       BNE    LD35A                   ;2
LD341:
       LDA    ($86),Y                 ;5
       STA    WSYNC                   ;3
       STA    GRP1                    ;3
       LDX    $CE                     ;3
       LDA    LDC60,X                 ;4
       STA    $CD                     ;3
       LDX    $CA                     ;3
       LDA    $80,X                   ;4
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       AND    $CD                     ;3
       STA    $CC                     ;3
LD35A:
       INY                            ;2
       LDA    ($86),Y                 ;5
       TAX                            ;2
       LDA    #$01                    ;2
       CPY    $B8                     ;3
       BNE    LD365                   ;2
       ASL                            ;2
LD365:
       STA    ENABL                   ;3
       DEC    $CE                     ;5
       BIT    $9E                     ;3
       BMI    LD376                   ;2
       STA    WSYNC                   ;3
       STX    GRP1                    ;3
       INY                            ;2
       LDA    #$00                    ;2
       BEQ    LD381                   ;2
LD376:
       STA    WSYNC                   ;3
       LDA    ($84),Y                 ;5
       STA    GRP0                    ;3
       STX    GRP1                    ;3
       INY                            ;2
       LDA    ($84),Y                 ;5
LD381:
       STA    GRP0                    ;3
       LDA    #$01                    ;2
       CPY    $B7                     ;3
       BCC    LD38E                   ;2
       CPY    $B6                     ;3
       BCS    LD38E                   ;2
       ASL                            ;2
LD38E:
       STA    ENAM0                   ;3
       LDA    ($86),Y                 ;5
       BIT    $C8                     ;3
       BMI    LD3A4                   ;2
       STA    WSYNC                   ;3
       STA    GRP1                    ;3
       DEC    $CA                     ;5
       BPL    LD3BF                   ;2
       LDA    #$47                    ;2
       STA    $CA                     ;3
       BNE    LD3BF                   ;2
LD3A4:
       LDX    $CC                     ;3
       STA    WSYNC                   ;3
       STX    PF0                     ;3
       LDX    $CE                     ;3
       STA    GRP1                    ;3
       LDA    $8D,X                   ;4
       AND    $CD                     ;3
       STA    PF1                     ;3
       LDA    $A7,X                   ;4
       AND    $CD                     ;3
       STA    PF2                     ;3
       LDA    LD9E4,X                 ;4
       STA    COLUPF                  ;3
LD3BF:
       INY                            ;2
       LDA    ($86),Y                 ;5
       TAX                            ;2
       LDA    #$01                    ;2
       CPY    $B8                     ;3
       BNE    LD3CA                   ;2
       ASL                            ;2
LD3CA:
       STA    ENABL                   ;3
       LDA    ($84),Y                 ;5
       INY                            ;2
       BIT    $9E                     ;3
       BMI    LD3DA                   ;2
       STA    WSYNC                   ;3
       STX    GRP1                    ;3
       JMP    LD3E4                   ;3
LD3DA:
       STA    WSYNC                   ;3
       STA    GRP0                    ;3
       STX    GRP1                    ;3
       LDA    ($84),Y                 ;5
       STA    GRP0                    ;3
LD3E4:
       LDA    #$01                    ;2
       CPY    $B7                     ;3
       BCC    LD3EF                   ;2
       CPY    $B6                     ;3
       BCS    LD3EF                   ;2
       ASL                            ;2
LD3EF:
       STA    ENAM0                   ;3
       BIT    $C8                     ;3
       BPL    LD41F                   ;2
       DEC    $CA                     ;5
       LDA    ($86),Y                 ;5
       STA    WSYNC                   ;3
       STA    GRP1                    ;3
       INY                            ;2
       LDX    $CE                     ;3
       DEX                            ;2
       LDA    LDC60,X                 ;4
       STA    $CD                     ;3
       LDX    $CA                     ;3
       AND    $80,X                   ;4
       STA    $CC                     ;3
       JMP    LD445                   ;3
LD40F:
       LDA    ($86),Y                 ;5
       TAX                            ;2
       JMP    LD485                   ;3
LD415:
       INY                            ;2
       STA    WSYNC                   ;3
       STX    GRP1                    ;3
       STX    GRP0                    ;3
       JMP    LD465                   ;3
LD41F:
       LDA    ($86),Y                 ;5
       TAX                            ;2
       STY    $CB                     ;3
       LDY    $CA                     ;3
       LDA    LD9E4,Y                 ;4
       STA    COLUPF                  ;3
       LDA    ($8D),Y                 ;5
       STA    WSYNC                   ;3
       STA    PF0                     ;3
       STX    GRP1                    ;3
       LDA    ($8F),Y                 ;5
       STA    PF1                     ;3
       LDA    ($91),Y                 ;5
       STA    PF2                     ;3
       DEY                            ;2
       BPL    LD440                   ;2
       LDY    #$47                    ;2
LD440:
       STY    $CA                     ;3
       LDY    $CB                     ;3
       INY                            ;2
LD445:
       LDA    #$01                    ;2
       CPY    $B8                     ;3
       BNE    LD44C                   ;2
       ASL                            ;2
LD44C:
       STA    ENABL                   ;3
       BIT    $9D                     ;3
       BVS    LD40F                   ;2
       LDX    #$00                    ;2
       BIT    $9E                     ;3
       BPL    LD415                   ;2
       LDA    ($84),Y                 ;5
       STA    WSYNC                   ;3
       STA    GRP0                    ;3
       STX    GRP1                    ;3
       INY                            ;2
       LDA    ($84),Y                 ;5
       STA    GRP0                    ;3
LD465:
       LDA    #$01                    ;2
       CPY    $B7                     ;3
       BCC    LD470                   ;2
       CPY    $B6                     ;3
       BCS    LD470                   ;2
       ASL                            ;2
LD470:
       STA    ENAM0                   ;3
       LDX    $95                     ;3
       BMI    LD4B9                   ;2
       LDA    $EA,X                   ;4
       STA    $86                     ;3
       LDA    $F0,X                   ;4
       STA    $87                     ;3
       LDA    $D0,X                   ;4
       STA    HMP1                    ;3
       JMP    LD4D3                   ;3
LD485:
       BIT    $9E                     ;3
       STA    WSYNC                   ;3
       BPL    LD48F                   ;2
       LDA    ($84),Y                 ;5
       STA    GRP0                    ;3
LD48F:
       STX    GRP1                    ;3
       INY                            ;2
       LDA    #$01                    ;2
       CPY    $B7                     ;3
       BCC    LD49D                   ;2
       CPY    $B6                     ;3
       BCS    LD49D                   ;2
       ASL                            ;2
LD49D:
       STA    ENAM0                   ;3
       BIT    $9E                     ;3
       BPL    LD4A7                   ;2
       LDA    ($84),Y                 ;5
       STA    GRP0                    ;3
LD4A7:
       STA    WSYNC                   ;3
       LDA    ($86),Y                 ;5
       STA    GRP1                    ;3
       INY                            ;2
       LDA    ($86),Y                 ;5
       TAX                            ;2
       DEC    $95                     ;5
       LDA    #$80                    ;2
       STA    $9D                     ;3
       BNE    LD4C8                   ;2
LD4B9:
       STA    WSYNC                   ;3
       LDX    #$00                    ;2
       STX    GRP1                    ;3
       LDA    #$58                    ;2
       STA    $86                     ;3
       LDA    #$DC                    ;2
       STA    $87                     ;3
       INY                            ;2
LD4C8:
       LDA    #$01                    ;2
       CPY    $B8                     ;3
       BNE    LD4CF                   ;2
       ASL                            ;2
LD4CF:
       STA    ENABL                   ;3
       BNE    LD4E9                   ;2
LD4D3:
       AND    #$0F                    ;2
       TAX                            ;2
       STA    WSYNC                   ;3
       LDA    #$00                    ;2
       STA    GRP1                    ;3
       STA    $011F                   ;4
       LDA    #$C0                    ;2
       STA    $9D                     ;3
       INY                            ;2
LD4E4:
       DEX                            ;2
       BNE    LD4E4                   ;2
       STA    RESP1                   ;3
LD4E9:
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       BIT    $9E                     ;3
       BPL    LD510                   ;2
       LDA    ($84),Y                 ;5
       STA    GRP0                    ;3
       STX    GRP1                    ;3
       INY                            ;2
       LDA    ($84),Y                 ;5
       STA    GRP0                    ;3
LD4FC:
       LDA    #$01                    ;2
       CPY    $B7                     ;3
       BCC    LD507                   ;2
       CPY    $B6                     ;3
       BCS    LD507                   ;2
       ASL                            ;2
LD507:
       STA    ENAM0                   ;3
       DEC    $CE                     ;5
       BMI    LD515                   ;2
       JMP    LD246                   ;3
LD510:
       STX    GRP1                    ;3
       INY                            ;2
       BNE    LD4FC                   ;2
LD515:
       STA    WSYNC                   ;3
       LDA    #$00                    ;2
       STA    PF0                     ;3
       STA    COLUBK                  ;3
       STA    PF1                     ;3
       STA    PF2                     ;3
       STA    REFP1                   ;3
       STA    WSYNC                   ;3
       LDA    $F6                     ;3
       BPL    LD52B                   ;2
       LDA    #$00                    ;2
LD52B:
       STA    WSYNC                   ;3
       BEQ    LD545                   ;2
       LDA    #$34                    ;2
       STA    CTRLPF                  ;3
       BIT    $F8                     ;3
       BVC    LD545                   ;2
       LDA    #$0C                    ;2
       BIT    $C6                     ;3
       BVS    LD545                   ;2
       LDA    $96                     ;3
       ASL                            ;2
       ASL                            ;2
       AND    #$F0                    ;2
       ORA    #$0A                    ;2
LD545:
       STA    COLUPF                  ;3
       LDA    $F8                     ;3
       BMI    LD54D                   ;2
       AND    #$3F                    ;2
LD54D:
       TAX                            ;2
       LDY    #$06                    ;2
       STA    WSYNC                   ;3
LD552:
       LDA    #$FF                    ;2
       CPX    #$04                    ;2
       BPL    LD573                   ;2
       CPX    #$28                    ;2
       BCS    LD5A8                   ;2
       LDA    LD9A8,X                 ;4
       STA    PF0                     ;3
       NOP                            ;2
LD562:
       LDA    #$00                    ;2
LD564:
       STA    PF2                     ;3
       LDA    #$00                    ;2
LD568:
       STA    PF0                     ;3
       LDA    #$00                    ;2
LD56C:
       STA    PF1                     ;3
       NOP                            ;2
       LDA    #$00                    ;2
       BEQ    LD5A6                   ;2
LD573:
       STA    PF0                     ;3
       CPX    #$0C                    ;2
       BCS    LD580                   ;2
       LDA    LD998,X                 ;4
       STA    PF1                     ;3
       BCC    LD562                   ;2
LD580:
       STA    PF1                     ;3
       CPX    #$14                    ;2
       BCS    LD58B                   ;2
       LDA    LD998,X                 ;4
       BCC    LD564                   ;2
LD58B:
       STA    PF2                     ;3
       CPX    #$18                    ;2
       BCS    LD596                   ;2
       LDA    LD994,X                 ;4
       BCC    LD568                   ;2
LD596:
       STA    PF0                     ;3
       CPX    #$20                    ;2
       BCS    LD5A1                   ;2
       LDA    LD984,X                 ;4
       BCC    LD56C                   ;2
LD5A1:
       STA    PF1                     ;3
       LDA    LD984,X                 ;4
LD5A6:
       STA    PF2                     ;3
LD5A8:
       DEY                            ;2
       STA    WSYNC                   ;3
       BNE    LD552                   ;2
       STY    PF0                     ;3
       STY    PF1                     ;3
       STY    PF2                     ;3
       LDX    #$50                    ;2
       STX    $CD                     ;3
       BIT    $C8                     ;3
       BMI    LD5BF                   ;2
       LDA    #$35                    ;2
       STA    CTRLPF                  ;3
LD5BF:
       BIT    $C6                     ;3
       LDA    $F7                     ;3
       AND    #$0F                    ;2
       TAY                            ;2
       STA    WSYNC                   ;3
       BVC    LD5D4                   ;2
       LDA    #$C2                    ;2
       LDY    #$0E                    ;2
       JSR    LD83C                   ;6
       JMP    LD64B                   ;3
LD5D4:
       BNE    LD607                   ;2
       LDA    #$8A                    ;2
       STA    $F4                     ;3
       STA    $F2                     ;3
       STA    $F0                     ;3
       STA    $EE                     ;3
       STA    $EC                     ;3
       LDA    #$42                    ;2
       LDX    $C6                     ;3
       BPL    LD5EA                   ;2
       LDA    #$4A                    ;2
LD5EA:
       LDY    $C1                     ;3
       JSR    LD851                   ;6
       LDX    $99                     ;3
       CPX    #$FF                    ;2
       BNE    LD64B                   ;2
       STA    WSYNC                   ;3
       STA    WSYNC                   ;3
       STA    WSYNC                   ;3
       LDY    $C1                     ;3
       STA    WSYNC                   ;3
       LDA    #$92                    ;2
       JSR    LD83C                   ;6
       JMP    LD693                   ;3
LD607:
       STA    WSYNC                   ;3
       LDA    LD6A7,Y                 ;4
       STA    NUSIZ0                  ;3
       LDA    LD6A5-1,Y               ;4
       STA    NUSIZ1                  ;3
       STA    NUSIZ1                  ;3
       LDX    LD6B1,Y                 ;4
       STA    RESP0                   ;3
       BNE    LD61F                   ;2
       NOP                            ;2
       BEQ    LD622                   ;2
LD61F:
       LDX    $01C1                   ;4
LD622:
       STX    COLUP0                  ;3
       STX    COLUP0                  ;3
       STA    RESP1                   ;3
       LDA    LD6AE,Y                 ;4
       BNE    LD62E                   ;2
       TAX                            ;2
LD62E:
       STX    COLUP1                  ;3
       LDX    #$00                    ;2
LD632:
       STA    WSYNC                   ;3
       LDA    LDD34,X                 ;4
       STA    GRP0                    ;3
       STA    GRP1                    ;3
       INX                            ;2
       CPX    #$0A                    ;2
       BNE    LD632                   ;2
       LDY    #$07                    ;2
LD642:
       DEY                            ;2
       BNE    LD642                   ;2
       STY    GRP0                    ;3
       STY    GRP1                    ;3
       STY    GRP0                    ;3
LD64B:
       LDY    #$02                    ;2
       LDX    #$0A                    ;2
       STA    WSYNC                   ;3
LD651:
       LDA.wy $97,Y                   ;4
       AND    #$F0                    ;2
       LSR                            ;2
       BNE    LD661                   ;2
       LDA    #$50                    ;2
       CMP    $CD                     ;3
       BEQ    LD661                   ;2
       LDA    #$00                    ;2
LD661:
       STA    $CD                     ;3
       CLC                            ;2
       ADC    #$3A                    ;2
       STA    $EA,X                   ;4
       DEX                            ;2
       DEX                            ;2
       LDA.wy $97,Y                   ;4
       AND    #$0F                    ;2
       BNE    LD67C                   ;2
       LDA    #$50                    ;2
       CMP    $CD                     ;3
       CLC                            ;2
       BEQ    LD681                   ;2
       LDA    #$00                    ;2
       BEQ    LD681                   ;2
LD67C:
       STA    $CD                     ;3
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
LD681:
       ADC    #$3A                    ;2
       STA    $EA,X                   ;4
       DEX                            ;2
       DEX                            ;2
       DEY                            ;2
       STA    WSYNC                   ;3
       BPL    LD651                   ;2
       LDY    $C1                     ;3
       LDA    #$3A                    ;2
       JSR    LD851                   ;6
LD693:
       STA    WSYNC                   ;3
       LDA    #$24                    ;2
       STA    TIM64T                  ;4
       LDA    $C9                     ;3
       BPL    LD6A2                   ;2
       CMP    #$F1                    ;2
       BCC    LD6B9                   ;2
LD6A2:
       JMP    LDFF2                   ;3

LD6A5:
       .byte $00 ; |        | $D6A5
       .byte $00 ; |        | $D6A6
LD6A7:
       .byte $00 ; |        | $D6A7
       .byte $00 ; |        | $D6A8
       .byte $00 ; |        | $D6A9
       .byte $01 ; |       X| $D6AA
       .byte $03 ; |      XX| $D6AB
       .byte $03 ; |      XX| $D6AC
       .byte $03 ; |      XX| $D6AD
LD6AE:
       .byte $03 ; |      XX| $D6AE
       .byte $00 ; |        | $D6AF
       .byte $00 ; |        | $D6B0
LD6B1:
       .byte $00 ; |        | $D6B1
       .byte $00 ; |        | $D6B2
       .byte $01 ; |       X| $D6B3
       .byte $01 ; |       X| $D6B4
       .byte $01 ; |       X| $D6B5
       .byte $01 ; |       X| $D6B6
       .byte $01 ; |       X| $D6B7
       .byte $01 ; |       X| $D6B8
LD6B9:
       LDA    INTIM                   ;4
       BNE    LD6B9                   ;2
       STA    WSYNC                   ;3
       LDA    #$02                    ;2
       STA    VSYNC                   ;3
       STA    VBLANK                  ;3
       INC    $96                     ;5
       STA    WSYNC                   ;3
       STA    WSYNC                   ;3
       STA    WSYNC                   ;3
       LDA    #$00                    ;2
       STA    VSYNC                   ;3
       LDA    #$2A                    ;2
       STA    TIM64T                  ;4
       DEC    $C9                     ;5
       BMI    LD6EC                   ;2
       LDA    $C7                     ;3
       BNE    LD6E9                   ;2
       LDA    $F7                     ;3
       AND    #$0F                    ;2
       CMP    #$06                    ;2
       BNE    LD6E9                   ;2
       DEC    $F7                     ;5
LD6E9:
       JMP    LD8BF                   ;3
LD6EC:
       LDA    SWCHB                   ;4
       LSR                            ;2
       BCC    LD6FA                   ;2
       LDX    $F7                     ;3
       BNE    LD6FE                   ;2
       BIT    INPT4                   ;3
       BMI    LD6FE                   ;2
LD6FA:
       LDX    $C7                     ;3
       BNE    LD6E9                   ;2
LD6FE:
       LSR                            ;2
       BCS    LD709                   ;2
       LDA    $C6                     ;3
       AND    #$20                    ;2
       BEQ    LD6E9                   ;2
       BNE    LD70F                   ;2
LD709:
       LDA    $C6                     ;3
       AND    #$DF                    ;2
       STA    $C6                     ;3
LD70F:
       LDA    #$30                    ;2
       STA    CTRLPF                  ;3
       STA    AUDV0                   ;3
       STA    AUDV1                   ;3
       LDX    #$00                    ;2
       STX    COLUPF                  ;3
       LDA    $96                     ;3
       AND    #$08                    ;2
       BNE    LD723                   ;2
       LDX    $C1                     ;3
LD723:
       STX    COLUP1                  ;3
       LDA    $C7                     ;3
       TAX                            ;2
       SEC                            ;2
       SBC    #$16                    ;2
       BCC    LD72E                   ;2
       TAX                            ;2
LD72E:
       LDA    LD80E,X                 ;4
       STA    $CA                     ;3
       LDA    $C8                     ;3
       BMI    LD747                   ;2
       AND    #$10                    ;2
       BEQ    LD741                   ;2
       LDA    #$4B                    ;2
       LDY    #$DD                    ;2
       BNE    LD74B                   ;2
LD741:
       LDA    #$33                    ;2
       LDY    #$DD                    ;2
       BNE    LD74B                   ;2
LD747:
       LDA    #$1A                    ;2
       LDY    #$DD                    ;2
LD74B:
       STA    $84                     ;3
       LDA    LD824,X                 ;4
       STA    WSYNC                   ;3
       STY    $85                     ;3
       STA    HMP1                    ;3
       AND    #$0F                    ;2
       TAX                            ;2
       LDA    #$D6                    ;2
       STA    $0109                   ;4
LD75E:
       DEX                            ;2
       BNE    LD75E                   ;2
       STA    RESP1                   ;3
LD763:
       LDA    INTIM                   ;4
       BNE    LD763                   ;2
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    VBLANK                  ;3
       LDY    #$2A                    ;2
LD770:
       STA    WSYNC                   ;3
       DEY                            ;2
       BNE    LD770                   ;2
       TYA                            ;2
       TAX                            ;2
LD777:
       STA    WSYNC                   ;3
       CPX    $CA                     ;3
       BNE    LD782                   ;2
       LDA    ($84),Y                 ;5
       JMP    LD787                   ;3
LD782:
       NOP                            ;2
       NOP                            ;2
       JMP    LD787                   ;3
LD787:
       STA    GRP1                    ;3
       LDA    $C7                     ;3
       CMP    #$0B                    ;2
       BCC    LD79E                   ;2
       CMP    #$16                    ;2
       BCS    LD7A0                   ;2
       LDA    LD7FC,X                 ;4
       STA    $010F                   ;4
       LDA    LD804,X                 ;4
       BCC    LD7AA                   ;2
LD79E:
       NOP                            ;2
       NOP                            ;2
LD7A0:
       LDA    LD808,X                 ;4
       STA    PF2                     ;3
       STA    PF2                     ;3
       LDA    LD802,X                 ;4
LD7AA:
       STA    PF0                     ;3
       INY                            ;2
       LDA    #$00                    ;2
       STA    PF2                     ;3
       STA    PF0                     ;3
       CPY    #$0C                    ;2
       BNE    LD777                   ;2
       TAY                            ;2
       INX                            ;2
       CPX    #$06                    ;2
       BNE    LD777                   ;2
       STA    WSYNC                   ;3
       STA    GRP1                    ;3
       STA    HMCLR                   ;3
       LDA    $C6                     ;3
       AND    #$01                    ;2
       TAX                            ;2
       LDA    LD83A,X                 ;4
       STA    $84                     ;3
       LDA    #$DF                    ;2
       STA    $85                     ;3
       LDA    #$00                    ;2
       STA    COLUP1                  ;3
       LDY    #$02                    ;2
LD7D7:
       DEY                            ;2
       BNE    LD7D7                   ;2
       STA    RESP1                   ;3
       LDY    #$10                    ;2
LD7DE:
       STA    WSYNC                   ;3
       DEY                            ;2
       BNE    LD7DE                   ;2
       LDY    #$07                    ;2
LD7E5:
       STA    WSYNC                   ;3
       LDA    ($84),Y                 ;5
       STA    GRP1                    ;3
       DEY                            ;2
       BPL    LD7E5                   ;2
       LDY    #$11                    ;2
LD7F0:
       STA    WSYNC                   ;3
       LDA    #$00                    ;2
       STA    GRP1                    ;3
       DEY                            ;2
       BNE    LD7F0                   ;2
       JMP    LD515                   ;3
LD7FC:
       .byte $00 ; |        | $D7FC
       .byte $00 ; |        | $D7FD
       .byte $00 ; |        | $D7FE
       .byte $F0 ; |XXXX    | $D7FF
       .byte $30 ; |  XX    | $D800
       .byte $3F ; |  XXXXXX| $D801
LD802:
       .byte $C0 ; |XX      | $D802
       .byte $C0 ; |XX      | $D803
LD804:
       .byte $C0 ; |XX      | $D804
       .byte $C0 ; |XX      | $D805
       .byte $C0 ; |XX      | $D806
       .byte $F0 ; |XXXX    | $D807
LD808:
       .byte $00 ; |        | $D808
       .byte $00 ; |        | $D809
       .byte $00 ; |        | $D80A
       .byte $3F ; |  XXXXXX| $D80B
       .byte $30 ; |  XX    | $D80C
       .byte $F0 ; |XXXX    | $D80D
LD80E:
       .byte $03 ; |      XX| $D80E
       .byte $03 ; |      XX| $D80F
       .byte $03 ; |      XX| $D810
       .byte $05 ; |     X X| $D811
       .byte $05 ; |     X X| $D812
       .byte $05 ; |     X X| $D813
       .byte $03 ; |      XX| $D814
       .byte $02 ; |      X | $D815
       .byte $01 ; |       X| $D816
       .byte $01 ; |       X| $D817
       .byte $00 ; |        | $D818
       .byte $05 ; |     X X| $D819
       .byte $05 ; |     X X| $D81A
       .byte $05 ; |     X X| $D81B
       .byte $03 ; |      XX| $D81C
       .byte $03 ; |      XX| $D81D
       .byte $03 ; |      XX| $D81E
       .byte $03 ; |      XX| $D81F
       .byte $02 ; |      X | $D820
       .byte $01 ; |       X| $D821
       .byte $01 ; |       X| $D822
       .byte $00 ; |        | $D823
LD824:
       .byte $24 ; |  X  X  | $D824
       .byte $B4 ; |X XX X  | $D825
       .byte $25 ; |  X  X X| $D826
       .byte $15 ; |   X X X| $D827
       .byte $46 ; | X   XX | $D828
       .byte $77 ; | XXX XXX| $D829
       .byte $77 ; | XXX XXX| $D82A
       .byte $77 ; | XXX XXX| $D82B
       .byte $77 ; | XXX XXX| $D82C
       .byte $77 ; | XXX XXX| $D82D
       .byte $77 ; | XXX XXX| $D82E
       .byte $24 ; |  X  X  | $D82F
       .byte $B4 ; |X XX X  | $D830
       .byte $25 ; |  X  X X| $D831
       .byte $15 ; |   X X X| $D832
       .byte $95 ; |X  X X X| $D833
       .byte $06 ; |     XX | $D834
       .byte $77 ; | XXX XXX| $D835
       .byte $77 ; | XXX XXX| $D836
       .byte $77 ; | XXX XXX| $D837
       .byte $77 ; | XXX XXX| $D838
       .byte $77 ; | XXX XXX| $D839
LD83A:
       .byte $42 ; | X    X | $D83A
       .byte $4A ; | X  X X | $D83B
LD83C:
       STA    $F4                     ;3
       CLC                            ;2
       ADC    #$08                    ;2
       STA    $F2                     ;3
       ADC    #$08                    ;2
       STA    $F0                     ;3
       ADC    #$08                    ;2
       STA    $EE                     ;3
       ADC    #$08                    ;2
       STA    $EC                     ;3
       ADC    #$08                    ;2
LD851:
       STA    WSYNC                   ;3
       STA    $EA                     ;3
       STY    COLUP0                  ;3
       STY    COLUP1                  ;3
       LDY    #$07                    ;2
       STY    $CB                     ;3
       LDY    #$03                    ;2
       STY    NUSIZ0                  ;3
       STY    NUSIZ1                  ;3
LD863:
       DEY                            ;2
       BNE    LD863                   ;2
       STA    RESP0                   ;3
       STA    RESP1                   ;3
       STA    HMCLR                   ;3
       LDA    #$F0                    ;2
       STA    HMP0                    ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDA    #$DF                    ;2
       STA    $EB                     ;3
       STA    $ED                     ;3
       STA    $EF                     ;3
       STA    $F1                     ;3
       STA    $F3                     ;3
       STA    $F5                     ;3
       LDA    #$01                    ;2
       STA    VDELP1                  ;3
LD886:
       LDY    $CB                     ;3
       LDA    ($F4),Y                 ;5
       STA    GRP0                    ;3
       STA    WSYNC                   ;3
       LDA    ($F2),Y                 ;5
       STA    GRP1                    ;3
       LDA    ($F0),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($EE),Y                 ;5
       STA    $CA                     ;3
       LDA    ($EC),Y                 ;5
       TAX                            ;2
       LDA    ($EA),Y                 ;5
       TAY                            ;2
       LDA    $CA                     ;3
       STA    GRP1                    ;3
       STX    GRP0                    ;3
       STY    GRP1                    ;3
       STA    GRP0                    ;3
       DEC    $CB                     ;5
       BPL    LD886                   ;2
       STA    WSYNC                   ;3
       LDA    #$00                    ;2
       STA    GRP0                    ;3
       STA    GRP1                    ;3
       STA    GRP0                    ;3
       STA    VDELP1                  ;3
       STA    NUSIZ0                  ;3
       STA    NUSIZ1                  ;3
       RTS                            ;6

LD8BF:
       LDA    #$2C                    ;2
       STA    $C9                     ;3
       LDA    #$00                    ;2
       STA    $88                     ;3
       LDA    #$46                    ;2
       STA    $CF                     ;3
       LDA    #$48                    ;2
       STA    $DC                     ;3
       LDA    #$06                    ;2
       STA    $84                     ;3
       LDA    $C8                     ;3
       BPL    LD912                   ;2
       AND    #$70                    ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       TAX                            ;2
       LDA    LD9E0,X                 ;4
       STA    $CB                     ;3
       LDA    LD9E2,X                 ;4
       STA    $CA                     ;3
       LDY    #$27                    ;2
LD8EA:
       LDA    ($CA),Y                 ;5
       STA.wy $99,Y                   ;5
       DEY                            ;2
       CPY    #$20                    ;2
       BCS    LD8EA                   ;2
LD8F4:
       LDA    ($CA),Y                 ;5
       STA.wy $8F,Y                   ;5
       DEY                            ;2
       CPY    #$10                    ;2
       BCS    LD8F4                   ;2
LD8FE:
       LDA    ($CA),Y                 ;5
       STA.wy $85,Y                   ;5
       DEY                            ;2
       CPY    #$04                    ;2
       BCS    LD8FE                   ;2
LD908:
       LDA    ($CA),Y                 ;5
       STA.wy $80,Y                   ;5
       DEY                            ;2
       BPL    LD908                   ;2
       BMI    LD951                   ;2
LD912:
       AND    #$60                    ;2
       BEQ    LD928                   ;2
       CMP    #$60                    ;2
       BNE    LD930                   ;2
       LDX    #$35                    ;2
       STX    $D4                     ;3
       STX    $D3                     ;3
       LDX    #$26                    ;2
       STX    $88                     ;3
       LDX    #$93                    ;2
       STX    $DD                     ;3
LD928:
       LDX    #$6E                    ;2
       STX    $DC                     ;3
       LDX    #$0B                    ;2
       STX    $84                     ;3
LD930:
       LSR                            ;2
       LSR                            ;2
       TAY                            ;2
       LDX    #$00                    ;2
LD935:
       LDA    LD9C0,Y                 ;4
       STA    $8D,X                   ;4
       LDA    #$00                    ;2
       STA    $B9,X                   ;4
       INY                            ;2
       INX                            ;2
       CPX    #$06                    ;2
       BNE    LD935                   ;2
       LDX    #$01                    ;2
       STX    $82                     ;3
       DEX                            ;2
       STX    $A7                     ;3
       STX    $80                     ;3
       STX    $81                     ;3
       STX    $83                     ;3
LD951:
       JMP    LD008                   ;3
LD954:
       LDA    $C8                     ;3
       AND    #$F0                    ;2
       STA    $CA                     ;3
       LDA    LD97B,X                 ;4
       STA    $C8                     ;3
       AND    #$F0                    ;2
       CMP    $CA                     ;3
       BEQ    LD978                   ;2
       CMP    #$80                    ;2
       BNE    LD971                   ;2
       STA    $AF                     ;3
       LDA    $F7                     ;3
       BNE    LD971                   ;2
       STA    $C7                     ;3
LD971:
       LDA    #$F0                    ;2
       STA    $C9                     ;3
       JMP    LD6EC                   ;3
LD978:
       JMP    LD008                   ;3
LD97B:
       .byte $80 ; |X       | $D97B
       .byte $82 ; |X     X | $D97C
       .byte $33 ; |  XX  XX| $D97D
       .byte $92 ; |X  X  X | $D97E
       .byte $91 ; |X  X   X| $D97F
       .byte $24 ; |  X  X  | $D980
       .byte $08 ; |    X   | $D981
       .byte $23 ; |  X   XX| $D982
       .byte $45 ; | X   X X| $D983
LD984:
       .byte $46 ; | X   XX | $D984
       .byte $69 ; | XX X  X| $D985
       .byte $80 ; |X       | $D986
       .byte $82 ; |X     X | $D987
       .byte $08 ; |    X   | $D988
       .byte $92 ; |X  X  X | $D989
       .byte $90 ; |X  X    | $D98A
       .byte $91 ; |X  X   X| $D98B
       .byte $23 ; |  X   XX| $D98C
       .byte $23 ; |  X   XX| $D98D
       .byte $45 ; | X   X X| $D98E
       .byte $47 ; | X   XXX| $D98F
       .byte $69 ; | XX X  X| $D990
       .byte $80 ; |X       | $D991
       .byte $82 ; |X     X | $D992
       .byte $33 ; |  XX  XX| $D993
LD994:
       .byte $92 ; |X  X  X | $D994
       .byte $91 ; |X  X   X| $D995
       .byte $24 ; |  X  X  | $D996
       .byte $08 ; |    X   | $D997
LD998:
       .byte $23 ; |  X   XX| $D998
       .byte $45 ; | X   X X| $D999
       .byte $46 ; | X   XX | $D99A
       .byte $69 ; | XX X  X| $D99B
       .byte $80 ; |X       | $D99C
       .byte $C0 ; |XX      | $D99D
       .byte $E0 ; |XXX     | $D99E
       .byte $F0 ; |XXXX    | $D99F
       .byte $F8 ; |XXXXX   | $D9A0
       .byte $FC ; |XXXXXX  | $D9A1
       .byte $FE ; |XXXXXXX | $D9A2
       .byte $FF ; |XXXXXXXX| $D9A3
       .byte $01 ; |       X| $D9A4
       .byte $03 ; |      XX| $D9A5
       .byte $07 ; |     XXX| $D9A6
       .byte $0F ; |    XXXX| $D9A7
LD9A8:
       .byte $1F ; |   XXXXX| $D9A8
       .byte $3F ; |  XXXXXX| $D9A9
       .byte $7F ; | XXXXXXX| $D9AA
       .byte $FF ; |XXXXXXXX| $D9AB
LD9AC:
       .byte $96 ; |X  X XX | $D9AC
       .byte $96 ; |X  X XX | $D9AD
       .byte $E1 ; |XXX    X| $D9AE
       .byte $AF ; |X X XXXX| $D9AF
       .byte $AF ; |X X XXXX| $D9B0
       .byte $37 ; |  XX XXX| $D9B1
       .byte $20 ; |  X     | $D9B2
       .byte $20 ; |  X     | $D9B3
       .byte $00 ; |        | $D9B4
       .byte $C8 ; |XX  X   | $D9B5
LD9B6:
       .byte $DE ; |XX XXXX | $D9B6
       .byte $DE ; |XX XXXX | $D9B7
       .byte $DE ; |XX XXXX | $D9B8
       .byte $DE ; |XX XXXX | $D9B9
       .byte $DE ; |XX XXXX | $D9BA
       .byte $DE ; |XX XXXX | $D9BB
       .byte $DE ; |XX XXXX | $D9BC
       .byte $DE ; |XX XXXX | $D9BD
       .byte $00 ; |        | $D9BE
       .byte $DE ; |XX XXXX | $D9BF
LD9C0:
       .byte $2C ; |  X XX  | $D9C0
       .byte $DA ; |XX XX X | $D9C1
       .byte $7A ; | XXXX X | $D9C2
       .byte $DC ; |XX XXX  | $D9C3
       .byte $74 ; | XXX X  | $D9C4
       .byte $DA ; |XX XX X | $D9C5
       .byte $00 ; |        | $D9C6
       .byte $00 ; |        | $D9C7
       .byte $BC ; |X XXXX  | $D9C8
       .byte $DA ; |XX XX X | $D9C9
       .byte $04 ; |     X  | $D9CA
       .byte $DB ; |XX XX XX| $D9CB
       .byte $BB ; |X XXX XX| $D9CC
       .byte $DC ; |XX XXX  | $D9CD
       .byte $00 ; |        | $D9CE
       .byte $00 ; |        | $D9CF
       .byte $4C ; | X  XX  | $D9D0
       .byte $DB ; |XX XX XX| $D9D1
       .byte $A3 ; |X X   XX| $D9D2
       .byte $DB ; |XX XX XX| $D9D3
       .byte $CF ; |XX  XXXX| $D9D4
       .byte $DC ; |XX XXX  | $D9D5
       .byte $00 ; |        | $D9D6
       .byte $00 ; |        | $D9D7
       .byte $80 ; |X       | $D9D8
       .byte $DB ; |XX XX XX| $D9D9
       .byte $EB ; |XXX X XX| $D9DA
       .byte $DB ; |XX XX XX| $D9DB
       .byte $E7 ; |XXX  XXX| $D9DC
       .byte $DE ; |XX XXXX | $D9DD
       .byte $00 ; |        | $D9DE
       .byte $00 ; |        | $D9DF
LD9E0:
       .byte $DC ; |XX XXX  | $D9E0
       .byte $DC ; |XX XXX  | $D9E1
LD9E2:
       .byte $12 ; |   X  X | $D9E2
       .byte $39 ; |  XXX  X| $D9E3
LD9E4:
       .byte $F6 ; |XXXX XX | $D9E4
       .byte $16 ; |   X XX | $D9E5
       .byte $26 ; |  X  XX | $D9E6
       .byte $36 ; |  XX XX | $D9E7
       .byte $46 ; | X   XX | $D9E8
       .byte $56 ; | X X XX | $D9E9
       .byte $66 ; | XX  XX | $D9EA
       .byte $76 ; | XXX XX | $D9EB
       .byte $86 ; |X    XX | $D9EC
       .byte $96 ; |X  X XX | $D9ED
       .byte $A6 ; |X X  XX | $D9EE
       .byte $B6 ; |X XX XX | $D9EF
       .byte $C6 ; |XX   XX | $D9F0
       .byte $D6 ; |XX X XX | $D9F1
       .byte $E6 ; |XXX  XX | $D9F2
       .byte $F6 ; |XXXX XX | $D9F3
       .byte $16 ; |   X XX | $D9F4
       .byte $26 ; |  X  XX | $D9F5
       .byte $36 ; |  XX XX | $D9F6
       .byte $46 ; | X   XX | $D9F7
       .byte $56 ; | X X XX | $D9F8
       .byte $66 ; | XX  XX | $D9F9
       .byte $76 ; | XXX XX | $D9FA
       .byte $86 ; |X    XX | $D9FB
       .byte $96 ; |X  X XX | $D9FC
       .byte $A6 ; |X X  XX | $D9FD
       .byte $B6 ; |X XX XX | $D9FE
       .byte $C6 ; |XX   XX | $D9FF
       .byte $D6 ; |XX X XX | $DA00
       .byte $E6 ; |XXX  XX | $DA01
       .byte $F6 ; |XXXX XX | $DA02
       .byte $16 ; |   X XX | $DA03
       .byte $26 ; |  X  XX | $DA04
       .byte $36 ; |  XX XX | $DA05
       .byte $46 ; | X   XX | $DA06
       .byte $56 ; | X X XX | $DA07
       .byte $66 ; | XX  XX | $DA08
       .byte $76 ; | XXX XX | $DA09
       .byte $86 ; |X    XX | $DA0A
       .byte $96 ; |X  X XX | $DA0B
       .byte $A6 ; |X X  XX | $DA0C
       .byte $B6 ; |X XX XX | $DA0D
       .byte $C6 ; |XX   XX | $DA0E
       .byte $D6 ; |XX X XX | $DA0F
       .byte $E6 ; |XXX  XX | $DA10
       .byte $F6 ; |XXXX XX | $DA11
       .byte $16 ; |   X XX | $DA12
       .byte $26 ; |  X  XX | $DA13
       .byte $36 ; |  XX XX | $DA14
       .byte $46 ; | X   XX | $DA15
       .byte $56 ; | X X XX | $DA16
       .byte $66 ; | XX  XX | $DA17
       .byte $76 ; | XXX XX | $DA18
       .byte $86 ; |X    XX | $DA19
       .byte $96 ; |X  X XX | $DA1A
       .byte $A6 ; |X X  XX | $DA1B
       .byte $B6 ; |X XX XX | $DA1C
       .byte $C6 ; |XX   XX | $DA1D
       .byte $D6 ; |XX X XX | $DA1E
       .byte $E6 ; |XXX  XX | $DA1F
       .byte $F6 ; |XXXX XX | $DA20
       .byte $16 ; |   X XX | $DA21
       .byte $26 ; |  X  XX | $DA22
       .byte $36 ; |  XX XX | $DA23
       .byte $46 ; | X   XX | $DA24
       .byte $56 ; | X X XX | $DA25
       .byte $66 ; | XX  XX | $DA26
       .byte $76 ; | XXX XX | $DA27
       .byte $86 ; |X    XX | $DA28
       .byte $A6 ; |X X  XX | $DA29
       .byte $C6 ; |XX   XX | $DA2A
       .byte $E6 ; |XXX  XX | $DA2B
       .byte $10 ; |   X    | $DA2C
       .byte $10 ; |   X    | $DA2D
       .byte $10 ; |   X    | $DA2E
       .byte $10 ; |   X    | $DA2F
       .byte $10 ; |   X    | $DA30
       .byte $10 ; |   X    | $DA31
       .byte $10 ; |   X    | $DA32
       .byte $10 ; |   X    | $DA33
       .byte $10 ; |   X    | $DA34
       .byte $10 ; |   X    | $DA35
       .byte $10 ; |   X    | $DA36
       .byte $50 ; | X X    | $DA37
       .byte $50 ; | X X    | $DA38
       .byte $50 ; | X X    | $DA39
       .byte $50 ; | X X    | $DA3A
       .byte $50 ; | X X    | $DA3B
       .byte $50 ; | X X    | $DA3C
       .byte $50 ; | X X    | $DA3D
       .byte $50 ; | X X    | $DA3E
       .byte $50 ; | X X    | $DA3F
       .byte $50 ; | X X    | $DA40
       .byte $50 ; | X X    | $DA41
       .byte $50 ; | X X    | $DA42
       .byte $50 ; | X X    | $DA43
       .byte $50 ; | X X    | $DA44
       .byte $50 ; | X X    | $DA45
       .byte $50 ; | X X    | $DA46
       .byte $50 ; | X X    | $DA47
       .byte $50 ; | X X    | $DA48
       .byte $50 ; | X X    | $DA49
       .byte $50 ; | X X    | $DA4A
       .byte $50 ; | X X    | $DA4B
       .byte $50 ; | X X    | $DA4C
       .byte $10 ; |   X    | $DA4D
       .byte $10 ; |   X    | $DA4E
       .byte $10 ; |   X    | $DA4F
       .byte $10 ; |   X    | $DA50
       .byte $10 ; |   X    | $DA51
       .byte $10 ; |   X    | $DA52
       .byte $10 ; |   X    | $DA53
       .byte $10 ; |   X    | $DA54
       .byte $10 ; |   X    | $DA55
       .byte $10 ; |   X    | $DA56
       .byte $50 ; | X X    | $DA57
       .byte $50 ; | X X    | $DA58
       .byte $50 ; | X X    | $DA59
       .byte $50 ; | X X    | $DA5A
       .byte $50 ; | X X    | $DA5B
       .byte $50 ; | X X    | $DA5C
       .byte $50 ; | X X    | $DA5D
       .byte $50 ; | X X    | $DA5E
       .byte $50 ; | X X    | $DA5F
       .byte $50 ; | X X    | $DA60
       .byte $50 ; | X X    | $DA61
       .byte $50 ; | X X    | $DA62
       .byte $50 ; | X X    | $DA63
       .byte $50 ; | X X    | $DA64
       .byte $50 ; | X X    | $DA65
       .byte $50 ; | X X    | $DA66
       .byte $50 ; | X X    | $DA67
       .byte $50 ; | X X    | $DA68
       .byte $50 ; | X X    | $DA69
       .byte $50 ; | X X    | $DA6A
       .byte $50 ; | X X    | $DA6B
       .byte $50 ; | X X    | $DA6C
       .byte $50 ; | X X    | $DA6D
       .byte $50 ; | X X    | $DA6E
       .byte $50 ; | X X    | $DA6F
       .byte $10 ; |   X    | $DA70
       .byte $10 ; |   X    | $DA71
       .byte $10 ; |   X    | $DA72
       .byte $10 ; |   X    | $DA73
       .byte $AA ; |X X X X | $DA74
       .byte $AA ; |X X X X | $DA75
       .byte $AA ; |X X X X | $DA76
       .byte $AA ; |X X X X | $DA77
       .byte $AA ; |X X X X | $DA78
       .byte $AA ; |X X X X | $DA79
       .byte $AA ; |X X X X | $DA7A
       .byte $AA ; |X X X X | $DA7B
       .byte $AA ; |X X X X | $DA7C
       .byte $AA ; |X X X X | $DA7D
       .byte $AA ; |X X X X | $DA7E
       .byte $AA ; |X X X X | $DA7F
       .byte $AA ; |X X X X | $DA80
       .byte $AA ; |X X X X | $DA81
       .byte $AA ; |X X X X | $DA82
       .byte $AA ; |X X X X | $DA83
       .byte $AA ; |X X X X | $DA84
       .byte $AA ; |X X X X | $DA85
       .byte $AA ; |X X X X | $DA86
       .byte $AA ; |X X X X | $DA87
       .byte $AA ; |X X X X | $DA88
       .byte $AA ; |X X X X | $DA89
       .byte $AA ; |X X X X | $DA8A
       .byte $AA ; |X X X X | $DA8B
       .byte $AA ; |X X X X | $DA8C
       .byte $A8 ; |X X X   | $DA8D
       .byte $A0 ; |X X     | $DA8E
       .byte $80 ; |X       | $DA8F
       .byte $80 ; |X       | $DA90
       .byte $00 ; |        | $DA91
       .byte $00 ; |        | $DA92
       .byte $00 ; |        | $DA93
       .byte $00 ; |        | $DA94
       .byte $00 ; |        | $DA95
       .byte $00 ; |        | $DA96
       .byte $80 ; |X       | $DA97
       .byte $A0 ; |X X     | $DA98
       .byte $A0 ; |X X     | $DA99
       .byte $A0 ; |X X     | $DA9A
       .byte $A0 ; |X X     | $DA9B
       .byte $A0 ; |X X     | $DA9C
       .byte $80 ; |X       | $DA9D
       .byte $80 ; |X       | $DA9E
       .byte $00 ; |        | $DA9F
       .byte $00 ; |        | $DAA0
       .byte $00 ; |        | $DAA1
       .byte $00 ; |        | $DAA2
       .byte $00 ; |        | $DAA3
       .byte $00 ; |        | $DAA4
       .byte $00 ; |        | $DAA5
       .byte $00 ; |        | $DAA6
       .byte $00 ; |        | $DAA7
       .byte $00 ; |        | $DAA8
       .byte $00 ; |        | $DAA9
       .byte $00 ; |        | $DAAA
       .byte $00 ; |        | $DAAB
       .byte $00 ; |        | $DAAC
       .byte $00 ; |        | $DAAD
       .byte $00 ; |        | $DAAE
       .byte $00 ; |        | $DAAF
       .byte $00 ; |        | $DAB0
       .byte $00 ; |        | $DAB1
       .byte $00 ; |        | $DAB2
       .byte $00 ; |        | $DAB3
       .byte $80 ; |X       | $DAB4
       .byte $80 ; |X       | $DAB5
       .byte $A0 ; |X X     | $DAB6
       .byte $A0 ; |X X     | $DAB7
       .byte $A0 ; |X X     | $DAB8
       .byte $A0 ; |X X     | $DAB9
       .byte $A8 ; |X X X   | $DABA
       .byte $AA ; |X X X X | $DABB
       .byte $30 ; |  XX    | $DABC
       .byte $B0 ; |X XX    | $DABD
       .byte $90 ; |X  X    | $DABE
       .byte $20 ; |  X     | $DABF
       .byte $30 ; |  XX    | $DAC0
       .byte $20 ; |  X     | $DAC1
       .byte $A0 ; |X X     | $DAC2
       .byte $B0 ; |X XX    | $DAC3
       .byte $10 ; |   X    | $DAC4
       .byte $90 ; |X  X    | $DAC5
       .byte $60 ; | XX     | $DAC6
       .byte $20 ; |  X     | $DAC7
       .byte $00 ; |        | $DAC8
       .byte $00 ; |        | $DAC9
       .byte $40 ; | X      | $DACA
       .byte $60 ; | XX     | $DACB
       .byte $00 ; |        | $DACC
       .byte $10 ; |   X    | $DACD
       .byte $50 ; | X X    | $DACE
       .byte $40 ; | X      | $DACF
       .byte $F0 ; |XXXX    | $DAD0
       .byte $10 ; |   X    | $DAD1
       .byte $60 ; | XX     | $DAD2
       .byte $90 ; |X  X    | $DAD3
       .byte $30 ; |  XX    | $DAD4
       .byte $20 ; |  X     | $DAD5
       .byte $80 ; |X       | $DAD6
       .byte $B0 ; |X XX    | $DAD7
       .byte $40 ; | X      | $DAD8
       .byte $00 ; |        | $DAD9
       .byte $30 ; |  XX    | $DADA
       .byte $A0 ; |X X     | $DADB
       .byte $C0 ; |XX      | $DADC
       .byte $80 ; |X       | $DADD
       .byte $00 ; |        | $DADE
       .byte $50 ; | X X    | $DADF
       .byte $50 ; | X X    | $DAE0
       .byte $80 ; |X       | $DAE1
       .byte $00 ; |        | $DAE2
       .byte $A0 ; |X X     | $DAE3
       .byte $E0 ; |XXX     | $DAE4
       .byte $20 ; |  X     | $DAE5
       .byte $00 ; |        | $DAE6
       .byte $A0 ; |X X     | $DAE7
       .byte $D0 ; |XX X    | $DAE8
       .byte $B0 ; |X XX    | $DAE9
       .byte $00 ; |        | $DAEA
       .byte $20 ; |  X     | $DAEB
       .byte $C0 ; |XX      | $DAEC
       .byte $40 ; | X      | $DAED
       .byte $B0 ; |X XX    | $DAEE
       .byte $A0 ; |X X     | $DAEF
       .byte $70 ; | XXX    | $DAF0
       .byte $50 ; | X X    | $DAF1
       .byte $40 ; | X      | $DAF2
       .byte $F0 ; |XXXX    | $DAF3
       .byte $60 ; | XX     | $DAF4
       .byte $F0 ; |XXXX    | $DAF5
       .byte $90 ; |X  X    | $DAF6
       .byte $60 ; | XX     | $DAF7
       .byte $40 ; | X      | $DAF8
       .byte $80 ; |X       | $DAF9
       .byte $50 ; | X X    | $DAFA
       .byte $30 ; |  XX    | $DAFB
       .byte $30 ; |  XX    | $DAFC
       .byte $20 ; |  X     | $DAFD
       .byte $80 ; |X       | $DAFE
       .byte $90 ; |X  X    | $DAFF
       .byte $10 ; |   X    | $DB00
       .byte $10 ; |   X    | $DB01
       .byte $40 ; | X      | $DB02
       .byte $60 ; | XX     | $DB03
       .byte $00 ; |        | $DB04
       .byte $00 ; |        | $DB05
       .byte $00 ; |        | $DB06
       .byte $08 ; |    X   | $DB07
       .byte $6C ; | XX XX  | $DB08
       .byte $A8 ; |X X X   | $DB09
       .byte $80 ; |X       | $DB0A
       .byte $02 ; |      X | $DB0B
       .byte $42 ; | X    X | $DB0C
       .byte $01 ; |       X| $DB0D
       .byte $D0 ; |XX X    | $DB0E
       .byte $91 ; |X  X   X| $DB0F
       .byte $21 ; |  X    X| $DB10
       .byte $A0 ; |X X     | $DB11
       .byte $A0 ; |X X     | $DB12
       .byte $00 ; |        | $DB13
       .byte $00 ; |        | $DB14
       .byte $40 ; | X      | $DB15
       .byte $A0 ; |X X     | $DB16
       .byte $A0 ; |X X     | $DB17
       .byte $40 ; | X      | $DB18
       .byte $80 ; |X       | $DB19
       .byte $80 ; |X       | $DB1A
       .byte $00 ; |        | $DB1B
       .byte $00 ; |        | $DB1C
       .byte $80 ; |X       | $DB1D
       .byte $00 ; |        | $DB1E
       .byte $40 ; | X      | $DB1F
       .byte $50 ; | X X    | $DB20
       .byte $10 ; |   X    | $DB21
       .byte $20 ; |  X     | $DB22
       .byte $00 ; |        | $DB23
       .byte $00 ; |        | $DB24
       .byte $20 ; |  X     | $DB25
       .byte $70 ; | XXX    | $DB26
       .byte $90 ; |X  X    | $DB27
       .byte $10 ; |   X    | $DB28
       .byte $00 ; |        | $DB29
       .byte $A0 ; |X X     | $DB2A
       .byte $40 ; | X      | $DB2B
       .byte $00 ; |        | $DB2C
       .byte $00 ; |        | $DB2D
       .byte $40 ; | X      | $DB2E
       .byte $40 ; | X      | $DB2F
       .byte $80 ; |X       | $DB30
       .byte $20 ; |  X     | $DB31
       .byte $20 ; |  X     | $DB32
       .byte $00 ; |        | $DB33
       .byte $68 ; | XX X   | $DB34
       .byte $C8 ; |XX  X   | $DB35
       .byte $80 ; |X       | $DB36
       .byte $00 ; |        | $DB37
       .byte $00 ; |        | $DB38
       .byte $40 ; | X      | $DB39
       .byte $C0 ; |XX      | $DB3A
       .byte $A0 ; |X X     | $DB3B
       .byte $30 ; |  XX    | $DB3C
       .byte $50 ; | X X    | $DB3D
       .byte $C0 ; |XX      | $DB3E
       .byte $80 ; |X       | $DB3F
       .byte $20 ; |  X     | $DB40
       .byte $A0 ; |X X     | $DB41
       .byte $00 ; |        | $DB42
       .byte $40 ; | X      | $DB43
       .byte $A0 ; |X X     | $DB44
       .byte $A0 ; |X X     | $DB45
       .byte $08 ; |    X   | $DB46
       .byte $48 ; | X  X   | $DB47
       .byte $40 ; | X      | $DB48
       .byte $60 ; | XX     | $DB49
       .byte $90 ; |X  X    | $DB4A
       .byte $10 ; |   X    | $DB4B
       .byte $F0 ; |XXXX    | $DB4C
       .byte $F0 ; |XXXX    | $DB4D
       .byte $F0 ; |XXXX    | $DB4E
       .byte $70 ; | XXX    | $DB4F
       .byte $70 ; | XXX    | $DB50
       .byte $70 ; | XXX    | $DB51
       .byte $70 ; | XXX    | $DB52
       .byte $70 ; | XXX    | $DB53
       .byte $70 ; | XXX    | $DB54
       .byte $70 ; | XXX    | $DB55
       .byte $70 ; | XXX    | $DB56
       .byte $F0 ; |XXXX    | $DB57
       .byte $F0 ; |XXXX    | $DB58
       .byte $F0 ; |XXXX    | $DB59
       .byte $F0 ; |XXXX    | $DB5A
       .byte $F0 ; |XXXX    | $DB5B
       .byte $F0 ; |XXXX    | $DB5C
       .byte $F0 ; |XXXX    | $DB5D
       .byte $F0 ; |XXXX    | $DB5E
       .byte $F0 ; |XXXX    | $DB5F
       .byte $F0 ; |XXXX    | $DB60
       .byte $F0 ; |XXXX    | $DB61
       .byte $F0 ; |XXXX    | $DB62
       .byte $F0 ; |XXXX    | $DB63
       .byte $F0 ; |XXXX    | $DB64
       .byte $F0 ; |XXXX    | $DB65
       .byte $F0 ; |XXXX    | $DB66
       .byte $F0 ; |XXXX    | $DB67
       .byte $F0 ; |XXXX    | $DB68
       .byte $F0 ; |XXXX    | $DB69
       .byte $F0 ; |XXXX    | $DB6A
       .byte $F0 ; |XXXX    | $DB6B
       .byte $F0 ; |XXXX    | $DB6C
       .byte $F0 ; |XXXX    | $DB6D
       .byte $F0 ; |XXXX    | $DB6E
       .byte $F0 ; |XXXX    | $DB6F
       .byte $F0 ; |XXXX    | $DB70
       .byte $F0 ; |XXXX    | $DB71
       .byte $F0 ; |XXXX    | $DB72
       .byte $F0 ; |XXXX    | $DB73
       .byte $F0 ; |XXXX    | $DB74
       .byte $F0 ; |XXXX    | $DB75
       .byte $F0 ; |XXXX    | $DB76
       .byte $F0 ; |XXXX    | $DB77
       .byte $F0 ; |XXXX    | $DB78
       .byte $F0 ; |XXXX    | $DB79
       .byte $F0 ; |XXXX    | $DB7A
       .byte $F0 ; |XXXX    | $DB7B
       .byte $F0 ; |XXXX    | $DB7C
       .byte $F0 ; |XXXX    | $DB7D
       .byte $70 ; | XXX    | $DB7E
       .byte $70 ; | XXX    | $DB7F
       .byte $F0 ; |XXXX    | $DB80
       .byte $F0 ; |XXXX    | $DB81
       .byte $F0 ; |XXXX    | $DB82
       .byte $F0 ; |XXXX    | $DB83
       .byte $F0 ; |XXXX    | $DB84
       .byte $F0 ; |XXXX    | $DB85
       .byte $F0 ; |XXXX    | $DB86
       .byte $F0 ; |XXXX    | $DB87
       .byte $F0 ; |XXXX    | $DB88
       .byte $F0 ; |XXXX    | $DB89
       .byte $F0 ; |XXXX    | $DB8A
       .byte $F0 ; |XXXX    | $DB8B
       .byte $F0 ; |XXXX    | $DB8C
       .byte $F0 ; |XXXX    | $DB8D
       .byte $F0 ; |XXXX    | $DB8E
       .byte $F0 ; |XXXX    | $DB8F
       .byte $F0 ; |XXXX    | $DB90
       .byte $F0 ; |XXXX    | $DB91
       .byte $F0 ; |XXXX    | $DB92
       .byte $F0 ; |XXXX    | $DB93
       .byte $F0 ; |XXXX    | $DB94
       .byte $F0 ; |XXXX    | $DB95
       .byte $F0 ; |XXXX    | $DB96
       .byte $F0 ; |XXXX    | $DB97
       .byte $F0 ; |XXXX    | $DB98
       .byte $F0 ; |XXXX    | $DB99
       .byte $F0 ; |XXXX    | $DB9A
       .byte $F0 ; |XXXX    | $DB9B
       .byte $E0 ; |XXX     | $DB9C
       .byte $E0 ; |XXX     | $DB9D
       .byte $E0 ; |XXX     | $DB9E
       .byte $C0 ; |XX      | $DB9F
       .byte $C0 ; |XX      | $DBA0
       .byte $C0 ; |XX      | $DBA1
       .byte $80 ; |X       | $DBA2
       .byte $80 ; |X       | $DBA3
       .byte $00 ; |        | $DBA4
       .byte $00 ; |        | $DBA5
       .byte $00 ; |        | $DBA6
       .byte $00 ; |        | $DBA7
       .byte $00 ; |        | $DBA8
       .byte $00 ; |        | $DBA9
       .byte $00 ; |        | $DBAA
       .byte $00 ; |        | $DBAB
       .byte $00 ; |        | $DBAC
       .byte $00 ; |        | $DBAD
       .byte $00 ; |        | $DBAE
       .byte $00 ; |        | $DBAF
       .byte $00 ; |        | $DBB0
       .byte $00 ; |        | $DBB1
       .byte $80 ; |X       | $DBB2
       .byte $C0 ; |XX      | $DBB3
       .byte $C0 ; |XX      | $DBB4
       .byte $F0 ; |XXXX    | $DBB5
       .byte $F0 ; |XXXX    | $DBB6
       .byte $C0 ; |XX      | $DBB7
       .byte $80 ; |X       | $DBB8
       .byte $80 ; |X       | $DBB9
       .byte $80 ; |X       | $DBBA
       .byte $80 ; |X       | $DBBB
       .byte $80 ; |X       | $DBBC
       .byte $80 ; |X       | $DBBD
       .byte $00 ; |        | $DBBE
       .byte $00 ; |        | $DBBF
       .byte $00 ; |        | $DBC0
       .byte $00 ; |        | $DBC1
       .byte $00 ; |        | $DBC2
       .byte $00 ; |        | $DBC3
       .byte $00 ; |        | $DBC4
       .byte $00 ; |        | $DBC5
       .byte $00 ; |        | $DBC6
       .byte $00 ; |        | $DBC7
       .byte $00 ; |        | $DBC8
       .byte $00 ; |        | $DBC9
       .byte $00 ; |        | $DBCA
       .byte $00 ; |        | $DBCB
       .byte $80 ; |X       | $DBCC
       .byte $C0 ; |XX      | $DBCD
       .byte $C0 ; |XX      | $DBCE
       .byte $FC ; |XXXXXX  | $DBCF
       .byte $FC ; |XXXXXX  | $DBD0
       .byte $C0 ; |XX      | $DBD1
       .byte $C0 ; |XX      | $DBD2
       .byte $80 ; |X       | $DBD3
       .byte $00 ; |        | $DBD4
       .byte $00 ; |        | $DBD5
       .byte $00 ; |        | $DBD6
       .byte $80 ; |X       | $DBD7
       .byte $80 ; |X       | $DBD8
       .byte $80 ; |X       | $DBD9
       .byte $C0 ; |XX      | $DBDA
       .byte $C0 ; |XX      | $DBDB
       .byte $C0 ; |XX      | $DBDC
       .byte $E0 ; |XXX     | $DBDD
       .byte $E0 ; |XXX     | $DBDE
       .byte $F0 ; |XXXX    | $DBDF
       .byte $FF ; |XXXXXXXX| $DBE0
       .byte $FF ; |XXXXXXXX| $DBE1
       .byte $F8 ; |XXXXX   | $DBE2
       .byte $F0 ; |XXXX    | $DBE3
       .byte $E0 ; |XXX     | $DBE4
       .byte $E0 ; |XXX     | $DBE5
       .byte $C0 ; |XX      | $DBE6
       .byte $C0 ; |XX      | $DBE7
       .byte $80 ; |X       | $DBE8
       .byte $80 ; |X       | $DBE9
       .byte $80 ; |X       | $DBEA
       .byte $00 ; |        | $DBEB
       .byte $00 ; |        | $DBEC
       .byte $00 ; |        | $DBED
       .byte $00 ; |        | $DBEE
       .byte $00 ; |        | $DBEF
       .byte $80 ; |X       | $DBF0
       .byte $80 ; |X       | $DBF1
       .byte $80 ; |X       | $DBF2
       .byte $C0 ; |XX      | $DBF3
       .byte $C0 ; |XX      | $DBF4
       .byte $C0 ; |XX      | $DBF5
       .byte $E0 ; |XXX     | $DBF6
       .byte $E0 ; |XXX     | $DBF7
       .byte $E0 ; |XXX     | $DBF8
       .byte $F0 ; |XXXX    | $DBF9
       .byte $F0 ; |XXXX    | $DBFA
       .byte $F8 ; |XXXXX   | $DBFB
       .byte $F8 ; |XXXXX   | $DBFC
       .byte $FC ; |XXXXXX  | $DBFD
       .byte $FC ; |XXXXXX  | $DBFE
       .byte $FE ; |XXXXXXX | $DBFF
       .byte $FE ; |XXXXXXX | $DC00
       .byte $FF ; |XXXXXXXX| $DC01
       .byte $FF ; |XXXXXXXX| $DC02
       .byte $FF ; |XXXXXXXX| $DC03
       .byte $FF ; |XXXXXXXX| $DC04
       .byte $FF ; |XXXXXXXX| $DC05
       .byte $FF ; |XXXXXXXX| $DC06
       .byte $FF ; |XXXXXXXX| $DC07
       .byte $FF ; |XXXXXXXX| $DC08
       .byte $FF ; |XXXXXXXX| $DC09
       .byte $FF ; |XXXXXXXX| $DC0A
       .byte $FF ; |XXXXXXXX| $DC0B
       .byte $FF ; |XXXXXXXX| $DC0C
       .byte $FF ; |XXXXXXXX| $DC0D
       .byte $FF ; |XXXXXXXX| $DC0E
       .byte $FF ; |XXXXXXXX| $DC0F
       .byte $3F ; |  XXXXXX| $DC10
       .byte $0F ; |    XXXX| $DC11
       .byte $FF ; |XXXXXXXX| $DC12
       .byte $EF ; |XXX XXXX| $DC13
       .byte $8C ; |X   XX  | $DC14
       .byte $00 ; |        | $DC15
       .byte $00 ; |        | $DC16
       .byte $31 ; |  XX   X| $DC17
       .byte $FF ; |XXXXXXXX| $DC18
       .byte $FF ; |XXXXXXXX| $DC19
       .byte $FF ; |XXXXXXXX| $DC1A
       .byte $FE ; |XXXXXXX | $DC1B
       .byte $FC ; |XXXXXX  | $DC1C
       .byte $F8 ; |XXXXX   | $DC1D
       .byte $E0 ; |XXX     | $DC1E
       .byte $80 ; |X       | $DC1F
       .byte $00 ; |        | $DC20
       .byte $00 ; |        | $DC21
       .byte $00 ; |        | $DC22
       .byte $00 ; |        | $DC23
       .byte $00 ; |        | $DC24
       .byte $00 ; |        | $DC25
       .byte $00 ; |        | $DC26
       .byte $80 ; |X       | $DC27
       .byte $C0 ; |XX      | $DC28
       .byte $FF ; |XXXXXXXX| $DC29
       .byte $FF ; |XXXXXXXX| $DC2A
       .byte $FE ; |XXXXXXX | $DC2B
       .byte $CE ; |XX  XXX | $DC2C
       .byte $0C ; |    XX  | $DC2D
       .byte $00 ; |        | $DC2E
       .byte $00 ; |        | $DC2F
       .byte $00 ; |        | $DC30
       .byte $00 ; |        | $DC31
       .byte $00 ; |        | $DC32
       .byte $C0 ; |XX      | $DC33
       .byte $E0 ; |XXX     | $DC34
       .byte $E0 ; |XXX     | $DC35
       .byte $F0 ; |XXXX    | $DC36
       .byte $FC ; |XXXXXX  | $DC37
       .byte $FF ; |XXXXXXXX| $DC38
       .byte $FF ; |XXXXXXXX| $DC39
       .byte $27 ; |  X  XXX| $DC3A
       .byte $85 ; |X    X X| $DC3B
       .byte $00 ; |        | $DC3C
       .byte $42 ; | X    X | $DC3D
       .byte $08 ; |    X   | $DC3E
       .byte $C8 ; |XX  X   | $DC3F
       .byte $FF ; |XXXXXXXX| $DC40
       .byte $FF ; |XXXXXXXX| $DC41
       .byte $7F ; | XXXXXXX| $DC42
       .byte $3F ; |  XXXXXX| $DC43
       .byte $1F ; |   XXXXX| $DC44
       .byte $0E ; |    XXX | $DC45
       .byte $04 ; |     X  | $DC46
       .byte $0A ; |    X X | $DC47
       .byte $11 ; |   X   X| $DC48
       .byte $10 ; |   X    | $DC49
       .byte $20 ; |  X     | $DC4A
       .byte $41 ; | X     X| $DC4B
       .byte $80 ; |X       | $DC4C
       .byte $C0 ; |XX      | $DC4D
       .byte $E0 ; |XXX     | $DC4E
       .byte $FC ; |XXXXXX  | $DC4F
       .byte $FF ; |XXXXXXXX| $DC50
       .byte $FF ; |XXXXXXXX| $DC51
       .byte $CF ; |XX  XXXX| $DC52
       .byte $03 ; |      XX| $DC53
       .byte $01 ; |       X| $DC54
       .byte $00 ; |        | $DC55
       .byte $00 ; |        | $DC56
       .byte $00 ; |        | $DC57
       .byte $00 ; |        | $DC58
       .byte $00 ; |        | $DC59
       .byte $00 ; |        | $DC5A
       .byte $00 ; |        | $DC5B
       .byte $11 ; |   X   X| $DC5C
       .byte $0A ; |    X X | $DC5D
       .byte $04 ; |     X  | $DC5E
       .byte $0E ; |    XXX | $DC5F
LDC60:
       .byte $FF ; |XXXXXXXX| $DC60
       .byte $FF ; |XXXXXXXX| $DC61
       .byte $FF ; |XXXXXXXX| $DC62
       .byte $FF ; |XXXXXXXX| $DC63
       .byte $FF ; |XXXXXXXX| $DC64
       .byte $FF ; |XXXXXXXX| $DC65
       .byte $FF ; |XXXXXXXX| $DC66
       .byte $FF ; |XXXXXXXX| $DC67
       .byte $00 ; |        | $DC68
       .byte $00 ; |        | $DC69
       .byte $00 ; |        | $DC6A
       .byte $00 ; |        | $DC6B
       .byte $00 ; |        | $DC6C
       .byte $00 ; |        | $DC6D
       .byte $00 ; |        | $DC6E
       .byte $00 ; |        | $DC6F
       .byte $00 ; |        | $DC70
       .byte $00 ; |        | $DC71
       .byte $FF ; |XXXXXXXX| $DC72
       .byte $FF ; |XXXXXXXX| $DC73
       .byte $FF ; |XXXXXXXX| $DC74
       .byte $FF ; |XXXXXXXX| $DC75
       .byte $FF ; |XXXXXXXX| $DC76
       .byte $FF ; |XXXXXXXX| $DC77
       .byte $FF ; |XXXXXXXX| $DC78
       .byte $FF ; |XXXXXXXX| $DC79
       .byte $00 ; |        | $DC7A
       .byte $01 ; |       X| $DC7B
       .byte $01 ; |       X| $DC7C
       .byte $01 ; |       X| $DC7D
       .byte $01 ; |       X| $DC7E
       .byte $01 ; |       X| $DC7F
       .byte $01 ; |       X| $DC80
       .byte $01 ; |       X| $DC81
       .byte $01 ; |       X| $DC82
       .byte $00 ; |        | $DC83
       .byte $00 ; |        | $DC84
       .byte $00 ; |        | $DC85
       .byte $00 ; |        | $DC86
       .byte $00 ; |        | $DC87
       .byte $00 ; |        | $DC88
       .byte $00 ; |        | $DC89
       .byte $00 ; |        | $DC8A
       .byte $00 ; |        | $DC8B
       .byte $00 ; |        | $DC8C
       .byte $00 ; |        | $DC8D
       .byte $00 ; |        | $DC8E
       .byte $80 ; |X       | $DC8F
       .byte $80 ; |X       | $DC90
       .byte $80 ; |X       | $DC91
       .byte $80 ; |X       | $DC92
       .byte $80 ; |X       | $DC93
       .byte $A0 ; |X X     | $DC94
       .byte $A0 ; |X X     | $DC95
       .byte $A0 ; |X X     | $DC96
       .byte $A0 ; |X X     | $DC97
       .byte $A0 ; |X X     | $DC98
       .byte $80 ; |X       | $DC99
       .byte $00 ; |        | $DC9A
       .byte $00 ; |        | $DC9B
       .byte $00 ; |        | $DC9C
       .byte $00 ; |        | $DC9D
       .byte $00 ; |        | $DC9E
       .byte $00 ; |        | $DC9F
       .byte $00 ; |        | $DCA0
       .byte $00 ; |        | $DCA1
       .byte $00 ; |        | $DCA2
       .byte $00 ; |        | $DCA3
       .byte $00 ; |        | $DCA4
       .byte $00 ; |        | $DCA5
       .byte $00 ; |        | $DCA6
       .byte $00 ; |        | $DCA7
       .byte $00 ; |        | $DCA8
       .byte $00 ; |        | $DCA9
       .byte $00 ; |        | $DCAA
       .byte $00 ; |        | $DCAB
       .byte $00 ; |        | $DCAC
       .byte $80 ; |X       | $DCAD
       .byte $80 ; |X       | $DCAE
       .byte $A8 ; |X X X   | $DCAF
       .byte $AA ; |X X X X | $DCB0
       .byte $AA ; |X X X X | $DCB1
       .byte $AA ; |X X X X | $DCB2
       .byte $AA ; |X X X X | $DCB3
       .byte $A8 ; |X X X   | $DCB4
       .byte $A8 ; |X X X   | $DCB5
       .byte $A0 ; |X X     | $DCB6
       .byte $A0 ; |X X     | $DCB7
       .byte $A0 ; |X X     | $DCB8
       .byte $80 ; |X       | $DCB9
       .byte $80 ; |X       | $DCBA
       .byte $00 ; |        | $DCBB
       .byte $00 ; |        | $DCBC
       .byte $00 ; |        | $DCBD
       .byte $00 ; |        | $DCBE
       .byte $00 ; |        | $DCBF
       .byte $00 ; |        | $DCC0
       .byte $00 ; |        | $DCC1
       .byte $00 ; |        | $DCC2
       .byte $00 ; |        | $DCC3
       .byte $00 ; |        | $DCC4
       .byte $00 ; |        | $DCC5
       .byte $00 ; |        | $DCC6
       .byte $00 ; |        | $DCC7
       .byte $01 ; |       X| $DCC8
       .byte $00 ; |        | $DCC9
       .byte $00 ; |        | $DCCA
       .byte $00 ; |        | $DCCB
       .byte $01 ; |       X| $DCCC
       .byte $01 ; |       X| $DCCD
       .byte $00 ; |        | $DCCE
       .byte $00 ; |        | $DCCF
       .byte $00 ; |        | $DCD0
       .byte $00 ; |        | $DCD1
       .byte $00 ; |        | $DCD2
       .byte $00 ; |        | $DCD3
       .byte $00 ; |        | $DCD4
       .byte $00 ; |        | $DCD5
       .byte $00 ; |        | $DCD6
       .byte $00 ; |        | $DCD7
       .byte $00 ; |        | $DCD8
       .byte $00 ; |        | $DCD9
       .byte $00 ; |        | $DCDA
       .byte $00 ; |        | $DCDB
       .byte $00 ; |        | $DCDC
       .byte $00 ; |        | $DCDD
       .byte $00 ; |        | $DCDE
       .byte $00 ; |        | $DCDF
       .byte $00 ; |        | $DCE0
       .byte $00 ; |        | $DCE1
       .byte $00 ; |        | $DCE2
       .byte $00 ; |        | $DCE3
       .byte $00 ; |        | $DCE4
       .byte $00 ; |        | $DCE5
       .byte $00 ; |        | $DCE6
       .byte $00 ; |        | $DCE7
       .byte $00 ; |        | $DCE8
       .byte $00 ; |        | $DCE9
       .byte $00 ; |        | $DCEA
       .byte $00 ; |        | $DCEB
       .byte $00 ; |        | $DCEC
       .byte $00 ; |        | $DCED
       .byte $00 ; |        | $DCEE
       .byte $00 ; |        | $DCEF
       .byte $00 ; |        | $DCF0
       .byte $00 ; |        | $DCF1
       .byte $00 ; |        | $DCF2
       .byte $00 ; |        | $DCF3
       .byte $00 ; |        | $DCF4
       .byte $00 ; |        | $DCF5
       .byte $00 ; |        | $DCF6
       .byte $00 ; |        | $DCF7
       .byte $00 ; |        | $DCF8
       .byte $00 ; |        | $DCF9
       .byte $00 ; |        | $DCFA
       .byte $00 ; |        | $DCFB
       .byte $00 ; |        | $DCFC
       .byte $00 ; |        | $DCFD
       .byte $00 ; |        | $DCFE
       .byte $00 ; |        | $DCFF
       .byte $00 ; |        | $DD00
       .byte $00 ; |        | $DD01
       .byte $00 ; |        | $DD02
       .byte $00 ; |        | $DD03
       .byte $00 ; |        | $DD04
       .byte $00 ; |        | $DD05
       .byte $00 ; |        | $DD06
       .byte $00 ; |        | $DD07
       .byte $00 ; |        | $DD08
       .byte $00 ; |        | $DD09
       .byte $00 ; |        | $DD0A
       .byte $00 ; |        | $DD0B
       .byte $03 ; |      XX| $DD0C
       .byte $03 ; |      XX| $DD0D
       .byte $00 ; |        | $DD0E
       .byte $00 ; |        | $DD0F
       .byte $00 ; |        | $DD10
       .byte $00 ; |        | $DD11
       .byte $00 ; |        | $DD12
       .byte $00 ; |        | $DD13
       .byte $00 ; |        | $DD14
       .byte $00 ; |        | $DD15
       .byte $00 ; |        | $DD16
       .byte $00 ; |        | $DD17
       .byte $00 ; |        | $DD18
       .byte $00 ; |        | $DD19
       .byte $10 ; |   X    | $DD1A
       .byte $D0 ; |XX X    | $DD1B
       .byte $70 ; | XXX    | $DD1C
       .byte $38 ; |  XXX   | $DD1D
       .byte $7C ; | XXXXX  | $DD1E
       .byte $FF ; |XXXXXXXX| $DD1F
       .byte $FF ; |XXXXXXXX| $DD20
       .byte $7C ; | XXXXX  | $DD21
       .byte $38 ; |  XXX   | $DD22
       .byte $70 ; | XXX    | $DD23
       .byte $D0 ; |XX X    | $DD24
       .byte $10 ; |   X    | $DD25
       .byte $00 ; |        | $DD26
       .byte $00 ; |        | $DD27
       .byte $00 ; |        | $DD28
       .byte $00 ; |        | $DD29
       .byte $00 ; |        | $DD2A
       .byte $00 ; |        | $DD2B
       .byte $00 ; |        | $DD2C
       .byte $00 ; |        | $DD2D
       .byte $00 ; |        | $DD2E
       .byte $00 ; |        | $DD2F
       .byte $00 ; |        | $DD30
       .byte $00 ; |        | $DD31
       .byte $00 ; |        | $DD32
       .byte $00 ; |        | $DD33
LDD34:
       .byte $10 ; |   X    | $DD34
       .byte $10 ; |   X    | $DD35
       .byte $10 ; |   X    | $DD36
       .byte $38 ; |  XXX   | $DD37
       .byte $38 ; |  XXX   | $DD38
       .byte $FE ; |XXXXXXX | $DD39
       .byte $7C ; | XXXXX  | $DD3A
       .byte $7C ; | XXXXX  | $DD3B
       .byte $D6 ; |XX X XX | $DD3C
       .byte $92 ; |X  X  X | $DD3D
       .byte $00 ; |        | $DD3E
       .byte $00 ; |        | $DD3F
       .byte $00 ; |        | $DD40
       .byte $00 ; |        | $DD41
       .byte $00 ; |        | $DD42
       .byte $00 ; |        | $DD43
       .byte $00 ; |        | $DD44
       .byte $00 ; |        | $DD45
       .byte $00 ; |        | $DD46
       .byte $00 ; |        | $DD47
       .byte $00 ; |        | $DD48
       .byte $00 ; |        | $DD49
       .byte $00 ; |        | $DD4A
       .byte $00 ; |        | $DD4B
       .byte $92 ; |X  X  X | $DD4C
       .byte $D6 ; |XX X XX | $DD4D
       .byte $7C ; | XXXXX  | $DD4E
       .byte $7C ; | XXXXX  | $DD4F
       .byte $FE ; |XXXXXXX | $DD50
       .byte $38 ; |  XXX   | $DD51
       .byte $38 ; |  XXX   | $DD52
       .byte $10 ; |   X    | $DD53
       .byte $10 ; |   X    | $DD54
       .byte $10 ; |   X    | $DD55
       .byte $00 ; |        | $DD56
       .byte $00 ; |        | $DD57
       .byte $00 ; |        | $DD58
       .byte $00 ; |        | $DD59
       .byte $00 ; |        | $DD5A
       .byte $00 ; |        | $DD5B
       .byte $00 ; |        | $DD5C
       .byte $00 ; |        | $DD5D
       .byte $00 ; |        | $DD5E
       .byte $00 ; |        | $DD5F
       .byte $00 ; |        | $DD60
       .byte $00 ; |        | $DD61
       .byte $00 ; |        | $DD62
       .byte $00 ; |        | $DD63
       .byte $00 ; |        | $DD64
       .byte $00 ; |        | $DD65
       .byte $99 ; |X  XX  X| $DD66
       .byte $66 ; | XX  XX | $DD67
       .byte $5A ; | X XX X | $DD68
       .byte $BD ; |X XXXX X| $DD69
       .byte $BD ; |X XXXX X| $DD6A
       .byte $5A ; | X XX X | $DD6B
       .byte $66 ; | XX  XX | $DD6C
       .byte $99 ; |X  XX  X| $DD6D
       .byte $00 ; |        | $DD6E
       .byte $00 ; |        | $DD6F
       .byte $00 ; |        | $DD70
       .byte $00 ; |        | $DD71
       .byte $00 ; |        | $DD72
       .byte $00 ; |        | $DD73
       .byte $00 ; |        | $DD74
       .byte $00 ; |        | $DD75
       .byte $00 ; |        | $DD76
       .byte $00 ; |        | $DD77
       .byte $00 ; |        | $DD78
       .byte $00 ; |        | $DD79
       .byte $00 ; |        | $DD7A
       .byte $00 ; |        | $DD7B
       .byte $00 ; |        | $DD7C
       .byte $00 ; |        | $DD7D
       .byte $18 ; |   XX   | $DD7E
       .byte $24 ; |  X  X  | $DD7F
       .byte $5A ; | X XX X | $DD80
       .byte $A5 ; |X X  X X| $DD81
       .byte $A5 ; |X X  X X| $DD82
       .byte $5A ; | X XX X | $DD83
       .byte $24 ; |  X  X  | $DD84
       .byte $18 ; |   XX   | $DD85
       .byte $00 ; |        | $DD86
       .byte $00 ; |        | $DD87
       .byte $00 ; |        | $DD88
       .byte $00 ; |        | $DD89
       .byte $00 ; |        | $DD8A
       .byte $00 ; |        | $DD8B
       .byte $00 ; |        | $DD8C
       .byte $00 ; |        | $DD8D
       .byte $00 ; |        | $DD8E
       .byte $00 ; |        | $DD8F
       .byte $00 ; |        | $DD90
       .byte $00 ; |        | $DD91
       .byte $00 ; |        | $DD92
       .byte $00 ; |        | $DD93
       .byte $00 ; |        | $DD94
       .byte $00 ; |        | $DD95
       .byte $10 ; |   X    | $DD96
       .byte $42 ; | X    X | $DD97
       .byte $08 ; |    X   | $DD98
       .byte $21 ; |  X    X| $DD99
       .byte $88 ; |X   X   | $DD9A
       .byte $10 ; |   X    | $DD9B
       .byte $42 ; | X    X | $DD9C
       .byte $10 ; |   X    | $DD9D
       .byte $00 ; |        | $DD9E
       .byte $00 ; |        | $DD9F
       .byte $00 ; |        | $DDA0
       .byte $00 ; |        | $DDA1
       .byte $00 ; |        | $DDA2
       .byte $00 ; |        | $DDA3
       .byte $00 ; |        | $DDA4
       .byte $00 ; |        | $DDA5
       .byte $00 ; |        | $DDA6
       .byte $00 ; |        | $DDA7
       .byte $00 ; |        | $DDA8
       .byte $00 ; |        | $DDA9
       .byte $00 ; |        | $DDAA
       .byte $00 ; |        | $DDAB
       .byte $00 ; |        | $DDAC
       .byte $22 ; |  X   X | $DDAD
       .byte $3C ; |  XXXX  | $DDAE
       .byte $E6 ; |XXX  XX | $DDAF
       .byte $DB ; |XX XX XX| $DDB0
       .byte $C7 ; |XX   XXX| $DDB1
       .byte $76 ; | XXX XX | $DDB2
       .byte $3C ; |  XXXX  | $DDB3
       .byte $06 ; |     XX | $DDB4
       .byte $00 ; |        | $DDB5
       .byte $00 ; |        | $DDB6
       .byte $00 ; |        | $DDB7
       .byte $00 ; |        | $DDB8
       .byte $00 ; |        | $DDB9
       .byte $00 ; |        | $DDBA
       .byte $00 ; |        | $DDBB
       .byte $00 ; |        | $DDBC
       .byte $00 ; |        | $DDBD
       .byte $00 ; |        | $DDBE
       .byte $00 ; |        | $DDBF
       .byte $00 ; |        | $DDC0
       .byte $00 ; |        | $DDC1
       .byte $00 ; |        | $DDC2
       .byte $00 ; |        | $DDC3
       .byte $22 ; |  X   X | $DDC4
       .byte $2C ; |  X XX  | $DDC5
       .byte $86 ; |X    XX | $DDC6
       .byte $88 ; |X   X   | $DDC7
       .byte $C3 ; |XX    XX| $DDC8
       .byte $54 ; | X X X  | $DDC9
       .byte $24 ; |  X  X  | $DDCA
       .byte $44 ; | X   X  | $DDCB
       .byte $00 ; |        | $DDCC
       .byte $00 ; |        | $DDCD
       .byte $00 ; |        | $DDCE
       .byte $00 ; |        | $DDCF
       .byte $00 ; |        | $DDD0
       .byte $00 ; |        | $DDD1
       .byte $00 ; |        | $DDD2
       .byte $00 ; |        | $DDD3
       .byte $00 ; |        | $DDD4
       .byte $00 ; |        | $DDD5
       .byte $00 ; |        | $DDD6
       .byte $00 ; |        | $DDD7
       .byte $00 ; |        | $DDD8
       .byte $00 ; |        | $DDD9
       .byte $00 ; |        | $DDDA
       .byte $18 ; |   XX   | $DDDB
       .byte $7E ; | XXXXXX | $DDDC
       .byte $FF ; |XXXXXXXX| $DDDD
       .byte $66 ; | XX  XX | $DDDE
       .byte $FF ; |XXXXXXXX| $DDDF
       .byte $7E ; | XXXXXX | $DDE0
       .byte $24 ; |  X  X  | $DDE1
       .byte $24 ; |  X  X  | $DDE2
       .byte $00 ; |        | $DDE3
       .byte $00 ; |        | $DDE4
       .byte $00 ; |        | $DDE5
       .byte $00 ; |        | $DDE6
       .byte $00 ; |        | $DDE7
       .byte $00 ; |        | $DDE8
       .byte $00 ; |        | $DDE9
       .byte $00 ; |        | $DDEA
       .byte $00 ; |        | $DDEB
       .byte $00 ; |        | $DDEC
       .byte $00 ; |        | $DDED
       .byte $00 ; |        | $DDEE
       .byte $00 ; |        | $DDEF
       .byte $00 ; |        | $DDF0
       .byte $00 ; |        | $DDF1
       .byte $18 ; |   XX   | $DDF2
       .byte $3C ; |  XXXX  | $DDF3
       .byte $7E ; | XXXXXX | $DDF4
       .byte $5A ; | X XX X | $DDF5
       .byte $FF ; |XXXXXXXX| $DDF6
       .byte $E7 ; |XXX  XXX| $DDF7
       .byte $5A ; | X XX X | $DDF8
       .byte $7E ; | XXXXXX | $DDF9
       .byte $3D ; |  XXXX X| $DDFA
       .byte $24 ; |  X  X  | $DDFB
       .byte $24 ; |  X  X  | $DDFC
       .byte $48 ; | X  X   | $DDFD
       .byte $00 ; |        | $DDFE
       .byte $00 ; |        | $DDFF
       .byte $00 ; |        | $DE00
       .byte $00 ; |        | $DE01
       .byte $00 ; |        | $DE02
       .byte $00 ; |        | $DE03
       .byte $00 ; |        | $DE04
       .byte $00 ; |        | $DE05
       .byte $00 ; |        | $DE06
       .byte $00 ; |        | $DE07
       .byte $00 ; |        | $DE08
       .byte $FE ; |XXXXXXX | $DE09
       .byte $FE ; |XXXXXXX | $DE0A
       .byte $82 ; |X     X | $DE0B
       .byte $82 ; |X     X | $DE0C
       .byte $9E ; |X  XXXX | $DE0D
       .byte $86 ; |X    XX | $DE0E
       .byte $86 ; |X    XX | $DE0F
       .byte $9E ; |X  XXXX | $DE10
       .byte $82 ; |X     X | $DE11
       .byte $82 ; |X     X | $DE12
       .byte $FE ; |XXXXXXX | $DE13
       .byte $FE ; |XXXXXXX | $DE14
       .byte $00 ; |        | $DE15
       .byte $00 ; |        | $DE16
       .byte $00 ; |        | $DE17
       .byte $00 ; |        | $DE18
       .byte $00 ; |        | $DE19
       .byte $00 ; |        | $DE1A
       .byte $00 ; |        | $DE1B
       .byte $00 ; |        | $DE1C
       .byte $00 ; |        | $DE1D
       .byte $00 ; |        | $DE1E
       .byte $00 ; |        | $DE1F
       .byte $10 ; |   X    | $DE20
       .byte $10 ; |   X    | $DE21
       .byte $10 ; |   X    | $DE22
       .byte $10 ; |   X    | $DE23
       .byte $10 ; |   X    | $DE24
       .byte $54 ; | X X X  | $DE25
       .byte $54 ; | X X X  | $DE26
       .byte $7C ; | XXXXX  | $DE27
       .byte $7C ; | XXXXX  | $DE28
       .byte $7C ; | XXXXX  | $DE29
       .byte $38 ; |  XXX   | $DE2A
       .byte $10 ; |   X    | $DE2B
       .byte $00 ; |        | $DE2C
       .byte $00 ; |        | $DE2D
       .byte $00 ; |        | $DE2E
       .byte $00 ; |        | $DE2F
       .byte $00 ; |        | $DE30
       .byte $00 ; |        | $DE31
       .byte $00 ; |        | $DE32
       .byte $00 ; |        | $DE33
       .byte $00 ; |        | $DE34
       .byte $00 ; |        | $DE35
       .byte $00 ; |        | $DE36
       .byte $18 ; |   XX   | $DE37
       .byte $3C ; |  XXXX  | $DE38
       .byte $76 ; | XXX XX | $DE39
       .byte $E6 ; |XXX  XX | $DE3A
       .byte $A3 ; |X X   XX| $DE3B
       .byte $E3 ; |XXX   XX| $DE3C
       .byte $43 ; | X    XX| $DE3D
       .byte $03 ; |      XX| $DE3E
       .byte $06 ; |     XX | $DE3F
       .byte $0C ; |    XX  | $DE40
       .byte $3C ; |  XXXX  | $DE41
       .byte $18 ; |   XX   | $DE42
       .byte $00 ; |        | $DE43
       .byte $00 ; |        | $DE44
       .byte $00 ; |        | $DE45
       .byte $00 ; |        | $DE46
       .byte $00 ; |        | $DE47
       .byte $00 ; |        | $DE48
       .byte $00 ; |        | $DE49
       .byte $00 ; |        | $DE4A
       .byte $00 ; |        | $DE4B
       .byte $00 ; |        | $DE4C
       .byte $00 ; |        | $DE4D
       .byte $00 ; |        | $DE4E
       .byte $81 ; |X      X| $DE4F
       .byte $C3 ; |XX    XX| $DE50
       .byte $66 ; | XX  XX | $DE51
       .byte $3C ; |  XXXX  | $DE52
       .byte $FF ; |XXXXXXXX| $DE53
       .byte $24 ; |  X  X  | $DE54
       .byte $FF ; |XXXXXXXX| $DE55
       .byte $3C ; |  XXXX  | $DE56
       .byte $66 ; | XX  XX | $DE57
       .byte $C3 ; |XX    XX| $DE58
       .byte $81 ; |X      X| $DE59
       .byte $00 ; |        | $DE5A
       .byte $00 ; |        | $DE5B
       .byte $00 ; |        | $DE5C
       .byte $00 ; |        | $DE5D
       .byte $00 ; |        | $DE5E
       .byte $00 ; |        | $DE5F
       .byte $00 ; |        | $DE60
       .byte $00 ; |        | $DE61
       .byte $00 ; |        | $DE62
       .byte $00 ; |        | $DE63
       .byte $00 ; |        | $DE64
       .byte $00 ; |        | $DE65
       .byte $00 ; |        | $DE66
       .byte $18 ; |   XX   | $DE67
       .byte $3C ; |  XXXX  | $DE68
       .byte $76 ; | XXX XX | $DE69
       .byte $E6 ; |XXX  XX | $DE6A
       .byte $A3 ; |X X   XX| $DE6B
       .byte $E3 ; |XXX   XX| $DE6C
       .byte $43 ; | X    XX| $DE6D
       .byte $17 ; |   X XXX| $DE6E
       .byte $1E ; |   XXXX | $DE6F
       .byte $08 ; |    X   | $DE70
       .byte $00 ; |        | $DE71
       .byte $00 ; |        | $DE72
       .byte $00 ; |        | $DE73
       .byte $00 ; |        | $DE74
       .byte $00 ; |        | $DE75
       .byte $00 ; |        | $DE76
       .byte $00 ; |        | $DE77
       .byte $00 ; |        | $DE78
       .byte $00 ; |        | $DE79
       .byte $00 ; |        | $DE7A
       .byte $00 ; |        | $DE7B
       .byte $00 ; |        | $DE7C
       .byte $00 ; |        | $DE7D
       .byte $00 ; |        | $DE7E
       .byte $10 ; |   X    | $DE7F
       .byte $20 ; |  X     | $DE80
       .byte $54 ; | X X X  | $DE81
       .byte $28 ; |  X X   | $DE82
       .byte $CE ; |XX  XXX | $DE83
       .byte $A4 ; |X X  X  | $DE84
       .byte $4C ; | X  XX  | $DE85
       .byte $68 ; | XX X   | $DE86
       .byte $10 ; |   X    | $DE87
       .byte $00 ; |        | $DE88
       .byte $00 ; |        | $DE89
       .byte $00 ; |        | $DE8A
       .byte $00 ; |        | $DE8B
       .byte $00 ; |        | $DE8C
       .byte $00 ; |        | $DE8D
       .byte $00 ; |        | $DE8E
       .byte $00 ; |        | $DE8F
       .byte $00 ; |        | $DE90
       .byte $00 ; |        | $DE91
       .byte $00 ; |        | $DE92
       .byte $00 ; |        | $DE93
       .byte $00 ; |        | $DE94
       .byte $00 ; |        | $DE95
       .byte $78 ; | XXXX   | $DE96
       .byte $10 ; |   X    | $DE97
       .byte $53 ; | X X  XX| $DE98
       .byte $D6 ; |XX X XX | $DE99
       .byte $FE ; |XXXXXXX | $DE9A
       .byte $FE ; |XXXXXXX | $DE9B
       .byte $D6 ; |XX X XX | $DE9C
       .byte $53 ; | X X  XX| $DE9D
       .byte $10 ; |   X    | $DE9E
       .byte $78 ; | XXXX   | $DE9F
       .byte $00 ; |        | $DEA0
       .byte $00 ; |        | $DEA1
       .byte $00 ; |        | $DEA2
       .byte $00 ; |        | $DEA3
       .byte $00 ; |        | $DEA4
       .byte $00 ; |        | $DEA5
       .byte $00 ; |        | $DEA6
       .byte $00 ; |        | $DEA7
       .byte $00 ; |        | $DEA8
       .byte $00 ; |        | $DEA9
       .byte $00 ; |        | $DEAA
       .byte $00 ; |        | $DEAB
       .byte $00 ; |        | $DEAC
       .byte $00 ; |        | $DEAD
       .byte $00 ; |        | $DEAE
       .byte $3C ; |  XXXX  | $DEAF
       .byte $7E ; | XXXXXX | $DEB0
       .byte $FF ; |XXXXXXXX| $DEB1
       .byte $FF ; |XXXXXXXX| $DEB2
       .byte $FF ; |XXXXXXXX| $DEB3
       .byte $FF ; |XXXXXXXX| $DEB4
       .byte $7E ; | XXXXXX | $DEB5
       .byte $3C ; |  XXXX  | $DEB6
       .byte $00 ; |        | $DEB7
       .byte $00 ; |        | $DEB8
       .byte $00 ; |        | $DEB9
       .byte $00 ; |        | $DEBA
       .byte $00 ; |        | $DEBB
       .byte $00 ; |        | $DEBC
       .byte $00 ; |        | $DEBD
       .byte $00 ; |        | $DEBE
       .byte $00 ; |        | $DEBF
       .byte $00 ; |        | $DEC0
       .byte $00 ; |        | $DEC1
       .byte $00 ; |        | $DEC2
       .byte $00 ; |        | $DEC3
       .byte $00 ; |        | $DEC4
       .byte $00 ; |        | $DEC5
       .byte $00 ; |        | $DEC6
       .byte $00 ; |        | $DEC7
       .byte $FF ; |XXXXXXXX| $DEC8
       .byte $FF ; |XXXXXXXX| $DEC9
       .byte $FF ; |XXXXXXXX| $DECA
       .byte $FF ; |XXXXXXXX| $DECB
       .byte $FF ; |XXXXXXXX| $DECC
       .byte $FF ; |XXXXXXXX| $DECD
       .byte $FF ; |XXXXXXXX| $DECE
       .byte $FF ; |XXXXXXXX| $DECF
       .byte $00 ; |        | $DED0
       .byte $00 ; |        | $DED1
       .byte $00 ; |        | $DED2
       .byte $00 ; |        | $DED3
       .byte $00 ; |        | $DED4
       .byte $00 ; |        | $DED5
       .byte $00 ; |        | $DED6
       .byte $00 ; |        | $DED7
       .byte $00 ; |        | $DED8
       .byte $00 ; |        | $DED9
       .byte $00 ; |        | $DEDA
       .byte $00 ; |        | $DEDB
       .byte $00 ; |        | $DEDC
       .byte $00 ; |        | $DEDD
       .byte $00 ; |        | $DEDE
       .byte $00 ; |        | $DEDF
       .byte $00 ; |        | $DEE0
       .byte $03 ; |      XX| $DEE1
       .byte $06 ; |     XX | $DEE2
       .byte $1E ; |   XXXX | $DEE3
       .byte $FF ; |XXXXXXXX| $DEE4
       .byte $7E ; | XXXXXX | $DEE5
       .byte $07 ; |     XXX| $DEE6
       .byte $00 ; |        | $DEE7
       .byte $00 ; |        | $DEE8
       .byte $00 ; |        | $DEE9
       .byte $00 ; |        | $DEEA
       .byte $00 ; |        | $DEEB
       .byte $00 ; |        | $DEEC
       .byte $00 ; |        | $DEED
       .byte $00 ; |        | $DEEE
       .byte $00 ; |        | $DEEF
       .byte $00 ; |        | $DEF0
       .byte $00 ; |        | $DEF1
       .byte $00 ; |        | $DEF2
       .byte $00 ; |        | $DEF3
       .byte $00 ; |        | $DEF4
       .byte $00 ; |        | $DEF5
       .byte $00 ; |        | $DEF6
       .byte $00 ; |        | $DEF7
       .byte $00 ; |        | $DEF8
       .byte $00 ; |        | $DEF9
       .byte $00 ; |        | $DEFA
       .byte $00 ; |        | $DEFB
       .byte $00 ; |        | $DEFC
       .byte $00 ; |        | $DEFD
       .byte $00 ; |        | $DEFE
       .byte $01 ; |       X| $DEFF
       .byte $03 ; |      XX| $DF00
       .byte $03 ; |      XX| $DF01
       .byte $0F ; |    XXXX| $DF02
       .byte $0F ; |    XXXX| $DF03
       .byte $0F ; |    XXXX| $DF04
       .byte $8F ; |X   XXXX| $DF05
       .byte $0F ; |    XXXX| $DF06
       .byte $5F ; | X XXXXX| $DF07
       .byte $1F ; |   XXXXX| $DF08
       .byte $3F ; |  XXXXXX| $DF09
       .byte $3F ; |  XXXXXX| $DF0A
       .byte $7F ; | XXXXXXX| $DF0B
       .byte $FF ; |XXXXXXXX| $DF0C
       .byte $FF ; |XXXXXXXX| $DF0D
       .byte $BC ; |X XXXX  | $DF0E
       .byte $3F ; |  XXXXXX| $DF0F
       .byte $7D ; | XXXXX X| $DF10
       .byte $3E ; |  XXXXX | $DF11
       .byte $FB ; |XXXXX XX| $DF12
       .byte $75 ; | XXX X X| $DF13
       .byte $EF ; |XXX XXXX| $DF14
       .byte $3C ; |  XXXX  | $DF15
       .byte $FF ; |XXXXXXXX| $DF16
       .byte $BD ; |X XXXX X| $DF17
       .byte $FE ; |XXXXXXX | $DF18
       .byte $7D ; | XXXXX X| $DF19
       .byte $F6 ; |XXXX XX | $DF1A
       .byte $70 ; | XXX    | $DF1B
       .byte $4F ; | X  XXXX| $DF1C
       .byte $7D ; | XXXXX X| $DF1D
       .byte $E2 ; |XXX   X | $DF1E
       .byte $5F ; | X XXXXX| $DF1F
       .byte $69 ; | XX X  X| $DF20
       .byte $7D ; | XXXXX X| $DF21
       .byte $B9 ; |X XXX  X| $DF22
       .byte $74 ; | XXX X  | $DF23
       .byte $FB ; |XXXXX XX| $DF24
       .byte $7B ; | XXXX XX| $DF25
       .byte $E7 ; |XXX  XXX| $DF26
       .byte $3C ; |  XXXX  | $DF27
       .byte $EF ; |XXX XXXX| $DF28
       .byte $B9 ; |X XXX  X| $DF29
       .byte $E3 ; |XXX   XX| $DF2A
       .byte $04 ; |     X  | $DF2B
       .byte $DD ; |XX XXX X| $DF2C
       .byte $74 ; | XXX X  | $DF2D
       .byte $BE ; |X XXXXX | $DF2E
       .byte $0F ; |    XXXX| $DF2F
       .byte $FB ; |XXXXX XX| $DF30
       .byte $7C ; | XXXXX  | $DF31
       .byte $71 ; | XXX   X| $DF32
       .byte $F4 ; |XXXX X  | $DF33
       .byte $AF ; |X X XXXX| $DF34
       .byte $FD ; |XXXXXX X| $DF35
       .byte $F0 ; |XXXX    | $DF36
       .byte $79 ; | XXXX  X| $DF37
       .byte $EF ; |XXX XXXX| $DF38
       .byte $7E ; | XXXXXX | $DF39
       .byte $38 ; |  XXX   | $DF3A
       .byte $6C ; | XX XX  | $DF3B
       .byte $C6 ; |XX   XX | $DF3C
       .byte $C6 ; |XX   XX | $DF3D
       .byte $C6 ; |XX   XX | $DF3E
       .byte $6C ; | XX XX  | $DF3F
       .byte $38 ; |  XXX   | $DF40
       .byte $00 ; |        | $DF41
       .byte $7E ; | XXXXXX | $DF42
       .byte $18 ; |   XX   | $DF43
       .byte $18 ; |   XX   | $DF44
       .byte $18 ; |   XX   | $DF45
       .byte $18 ; |   XX   | $DF46
       .byte $38 ; |  XXX   | $DF47
       .byte $18 ; |   XX   | $DF48
       .byte $00 ; |        | $DF49
       .byte $FE ; |XXXXXXX | $DF4A
       .byte $C0 ; |XX      | $DF4B
       .byte $E0 ; |XXX     | $DF4C
       .byte $3C ; |  XXXX  | $DF4D
       .byte $06 ; |     XX | $DF4E
       .byte $C6 ; |XX   XX | $DF4F
       .byte $7C ; | XXXXX  | $DF50
       .byte $00 ; |        | $DF51
       .byte $FC ; |XXXXXX  | $DF52
       .byte $06 ; |     XX | $DF53
       .byte $06 ; |     XX | $DF54
       .byte $7C ; | XXXXX  | $DF55
       .byte $06 ; |     XX | $DF56
       .byte $06 ; |     XX | $DF57
       .byte $FC ; |XXXXXX  | $DF58
       .byte $00 ; |        | $DF59
       .byte $0C ; |    XX  | $DF5A
       .byte $0C ; |    XX  | $DF5B
       .byte $0C ; |    XX  | $DF5C
       .byte $FE ; |XXXXXXX | $DF5D
       .byte $CC ; |XX  XX  | $DF5E
       .byte $CC ; |XX  XX  | $DF5F
       .byte $CC ; |XX  XX  | $DF60
       .byte $00 ; |        | $DF61
       .byte $FC ; |XXXXXX  | $DF62
       .byte $06 ; |     XX | $DF63
       .byte $06 ; |     XX | $DF64
       .byte $FC ; |XXXXXX  | $DF65
       .byte $C0 ; |XX      | $DF66
       .byte $C0 ; |XX      | $DF67
       .byte $FC ; |XXXXXX  | $DF68
       .byte $00 ; |        | $DF69
       .byte $7C ; | XXXXX  | $DF6A
       .byte $C6 ; |XX   XX | $DF6B
       .byte $C6 ; |XX   XX | $DF6C
       .byte $FC ; |XXXXXX  | $DF6D
       .byte $C0 ; |XX      | $DF6E
       .byte $C0 ; |XX      | $DF6F
       .byte $7C ; | XXXXX  | $DF70
       .byte $00 ; |        | $DF71
       .byte $30 ; |  XX    | $DF72
       .byte $30 ; |  XX    | $DF73
       .byte $18 ; |   XX   | $DF74
       .byte $18 ; |   XX   | $DF75
       .byte $0C ; |    XX  | $DF76
       .byte $06 ; |     XX | $DF77
       .byte $FE ; |XXXXXXX | $DF78
       .byte $00 ; |        | $DF79
       .byte $7C ; | XXXXX  | $DF7A
       .byte $C6 ; |XX   XX | $DF7B
       .byte $C6 ; |XX   XX | $DF7C
       .byte $7C ; | XXXXX  | $DF7D
       .byte $C6 ; |XX   XX | $DF7E
       .byte $C6 ; |XX   XX | $DF7F
       .byte $7C ; | XXXXX  | $DF80
       .byte $00 ; |        | $DF81
       .byte $7C ; | XXXXX  | $DF82
       .byte $06 ; |     XX | $DF83
       .byte $06 ; |     XX | $DF84
       .byte $7E ; | XXXXXX | $DF85
       .byte $C6 ; |XX   XX | $DF86
       .byte $C6 ; |XX   XX | $DF87
       .byte $7C ; | XXXXX  | $DF88
       .byte $00 ; |        | $DF89
       .byte $00 ; |        | $DF8A
       .byte $00 ; |        | $DF8B
       .byte $00 ; |        | $DF8C
       .byte $00 ; |        | $DF8D
       .byte $00 ; |        | $DF8E
       .byte $00 ; |        | $DF8F
       .byte $00 ; |        | $DF90
       .byte $00 ; |        | $DF91
       .byte $7C ; | XXXXX  | $DF92
       .byte $C6 ; |XX   XX | $DF93
       .byte $BA ; |X XXX X | $DF94
       .byte $B2 ; |X XX  X | $DF95
       .byte $BA ; |X XXX X | $DF96
       .byte $C6 ; |XX   XX | $DF97
       .byte $7C ; | XXXXX  | $DF98
       .byte $00 ; |        | $DF99
       .byte $1D ; |   XXX X| $DF9A
       .byte $08 ; |    X   | $DF9B
       .byte $08 ; |    X   | $DF9C
       .byte $09 ; |    X  X| $DF9D
       .byte $09 ; |    X  X| $DF9E
       .byte $19 ; |   XX  X| $DF9F
       .byte $08 ; |    X   | $DFA0
       .byte $00 ; |        | $DFA1
       .byte $89 ; |X   X  X| $DFA2
       .byte $55 ; | X X X X| $DFA3
       .byte $55 ; | X X X X| $DFA4
       .byte $C9 ; |XX  X  X| $DFA5
       .byte $54 ; | X X X  | $DFA6
       .byte $55 ; | X X X X| $DFA7
       .byte $89 ; |X   X  X| $DFA8
       .byte $00 ; |        | $DFA9
       .byte $C2 ; |XX    X | $DFAA
       .byte $02 ; |      X | $DFAB
       .byte $02 ; |      X | $DFAC
       .byte $83 ; |X     XX| $DFAD
       .byte $42 ; | X    X | $DFAE
       .byte $42 ; | X    X | $DFAF
       .byte $81 ; |X      X| $DFB0
       .byte $00 ; |        | $DFB1
       .byte $9B ; |X  XX XX| $DFB2
       .byte $96 ; |X  X XX | $DFB3
       .byte $93 ; |X  X  XX| $DFB4
       .byte $90 ; |X  X    | $DFB5
       .byte $BB ; |X XXX XX| $DFB6
       .byte $90 ; |X  X    | $DFB7
       .byte $10 ; |   X    | $DFB8
       .byte $00 ; |        | $DFB9
       .byte $E3 ; |XXX   XX| $DFBA
       .byte $A2 ; |X X   X | $DFBB
       .byte $A2 ; |X X   X | $DFBC
       .byte $A2 ; |X X   X | $DFBD
       .byte $3A ; |  XXX X | $DFBE
       .byte $00 ; |        | $DFBF
       .byte $02 ; |      X | $DFC0
       .byte $00 ; |        | $DFC1
       .byte $11 ; |   X   X| $DFC2
       .byte $2A ; |  X X X | $DFC3
       .byte $42 ; | X    X | $DFC4
       .byte $42 ; | X    X | $DFC5
       .byte $42 ; | X    X | $DFC6
       .byte $2A ; |  X X X | $DFC7
       .byte $11 ; |   X   X| $DFC8
       .byte $00 ; |        | $DFC9
       .byte $93 ; |X  X  XX| $DFCA
       .byte $53 ; | X X  XX| $DFCB
       .byte $55 ; | X X X X| $DFCC
       .byte $55 ; | X X X X| $DFCD
       .byte $55 ; | X X X X| $DFCE
       .byte $59 ; | X XX  X| $DFCF
       .byte $99 ; |X  XX  X| $DFD0
       .byte $00 ; |        | $DFD1
       .byte $11 ; |   X   X| $DFD2
       .byte $10 ; |   X    | $DFD3
       .byte $10 ; |   X    | $DFD4
       .byte $10 ; |   X    | $DFD5
       .byte $10 ; |   X    | $DFD6
       .byte $54 ; | X X X  | $DFD7
       .byte $7D ; | XXXXX X| $DFD8
       .byte $00 ; |        | $DFD9
       .byte $D3 ; |XX X  XX| $DFDA
       .byte $93 ; |X  X  XX| $DFDB
       .byte $95 ; |X  X X X| $DFDC
       .byte $95 ; |X  X X X| $DFDD
       .byte $95 ; |X  X X X| $DFDE
       .byte $99 ; |X  XX  X| $DFDF
       .byte $D9 ; |XX XX  X| $DFE0
       .byte $00 ; |        | $DFE1
       .byte $33 ; |  XX  XX| $DFE2
       .byte $4A ; | X  X X | $DFE3
       .byte $4A ; | X  X X | $DFE4
       .byte $4B ; | X  X XX| $DFE5
       .byte $4A ; | X  X X | $DFE6
       .byte $4A ; | X  X X | $DFE7
       .byte $4B ; | X  X XX| $DFE8
       .byte $00 ; |        | $DFE9
       .byte $C4 ; |XX   X  | $DFEA
       .byte $40 ; | X      | $DFEB
       .byte $04 ; |     X  | $DFEC
       .byte $84 ; |X    X  | $DFED
       .byte $02 ; |      X | $DFEE
       .byte $52 ; | X X  X | $DFEF
       .byte $CC ; |XX  XX  | $DFF0
       .byte $00 ; |        | $DFF1
LDFF2:
       STA    $FFF9                   ;4
       JMP    LD003                   ;3

       ORG $1FF8
       RORG $DFF8

       .byte $4A ; | X  X X | $DFF8
       .byte $FF ; |XXXXXXXX| $DFF9
       .byte $9D ; |X  XXX X| $DFFA
       .byte $E2 ; |XXX   X | $DFFB

       .word START1,$0193










       ORG $2000
       RORG $F000

START2:
       NOP                            ;2
       NOP                            ;2
       NOP                            ;2
       SEI                            ;2
       CLD                            ;2
       LDX    #$FF                    ;2
       TXS                            ;2
       LDA    #$00                    ;2
LF00A:
       STA    WSYNC,X                 ;4
       DEX                            ;2
       BNE    LF00A                   ;2
       INX                            ;2
       STX    VDELP0                  ;3
       STX    VDELBL                  ;3
       JSR    LF166                   ;6
       LDX    #$00                    ;2
       STX    SWACNT                  ;4
       STX    SWBCNT                  ;4
       STX    $F7                     ;3
       DEC    $99                     ;5
       DEC    $C4                     ;5
       BNE    LF02E                   ;2
LF027:
       LDA    INTIM                   ;4
       BNE    LF027                   ;2
       STA    WSYNC                   ;3
LF02E:
       LDA    #$02                    ;2
       STA    VSYNC                   ;3
       STA    VBLANK                  ;3
       LDA    $F7                     ;3
       INC    $96                     ;5
       BNE    LF044                   ;2
       CMP    #$00                    ;2
       BNE    LF044                   ;2
       BIT    $C6                     ;3
       BVS    LF044                   ;2
       INC    $F6                     ;5
LF044:
       STA    WSYNC                   ;3
       LDA    $F6                     ;3
       CMP    #$C0                    ;2
       BCS    LF067                   ;2
       LDA    #$3F                    ;2
       LDX    $F8                     ;3
       BMI    LF060                   ;2
       CPX    #$40                    ;2
       BCC    LF060                   ;2
       BNE    LF05E                   ;2
       STX    AUDV0                   ;3
       LDX    #$27                    ;2
       STX    $F8                     ;3
LF05E:
       LDA    #$0F                    ;2
LF060:
       AND    $96                     ;3
       BNE    LF067                   ;2
       DEX                            ;2
       STX    $F8                     ;3
LF067:
       STA    WSYNC                   ;3
       LDA    $F8                     ;3
       BMI    LF0A4                   ;2
       CMP    #$40                    ;2
       BCC    LF0A4                   ;2
       CMP    #$44                    ;2
       BCS    LF07F                   ;2
       LDA    $96                     ;3
       AND    #$0F                    ;2
       ADC    #$08                    ;2
       STA    AUDF0                   ;3
       BNE    LF0A4                   ;2
LF07F:
       SBC    #$44                    ;2
       CMP    #$12                    ;2
       BCC    LF087                   ;2
       SBC    #$12                    ;2
LF087:
       TAY                            ;2
       CLC                            ;2
       LDA    $96                     ;3
       AND    #$08                    ;2
       BNE    LF090                   ;2
       SEC                            ;2
LF090:
       TYA                            ;2
       ROL                            ;2
       TAY                            ;2
       LDA    LF142,Y                 ;4
       STA    AUDF0                   ;3
       LDA    $F7                     ;3
       BEQ    LF0A2                   ;2
       LDA    #$04                    ;2
       STA    AUDC0                   ;3
       LDA    #$0C                    ;2
LF0A2:
       STA    AUDV0                   ;3
LF0A4:
       STA    WSYNC                   ;3
       LDA    #$00                    ;2
       STA    VSYNC                   ;3
       LDA    #$2A                    ;2
       STA    TIM64T                  ;4
       LDA    SWCHB                   ;4
       LSR                            ;2
       BCC    LF0E1                   ;2
       LSR                            ;2
       BCS    LF0CD                   ;2
       LDA    $C6                     ;3
       AND    #$20                    ;2
       BNE    LF115                   ;2
       JSR    LF166                   ;6
       LDX    #$00                    ;2
       STX    $F7                     ;3
       LDA    $C6                     ;3
       EOR    #$A0                    ;2
       STA    $C6                     ;3
       BNE    LF115                   ;2
LF0CD:
       LDA    $C6                     ;3
       AND    #$DF                    ;2
       STA    $C6                     ;3
       LDA    $F7                     ;3
       BNE    LF115                   ;2
       LDX    INPT4                   ;3
       BIT    $C6                     ;3
       BVS    LF0E6                   ;2
       CPX    #$80                    ;2
       BCS    LF115                   ;2
LF0E1:
       JSR    LF166                   ;6
       BNE    LF115                   ;2
LF0E6:
       LDY    $C1                     ;3
       STY    COLUP0                  ;3
       LDA    $F6                     ;3
       CMP    #$02                    ;2
       BCC    LF100                   ;2
       BEQ    LF0FA                   ;2
       CPX    #$80                    ;2
       BCC    LF0F8                   ;2
       DEC    $F6                     ;5
LF0F8:
       BNE    LF11E                   ;2
LF0FA:
       LDA    #$67                    ;2
       STA    $F8                     ;3
       DEC    $F6                     ;5
LF100:
       CPX    #$80                    ;2
       BCS    LF10B                   ;2
       JSR    LF16F                   ;6
       DEC    $F7                     ;5
       BNE    LF10F                   ;2
LF10B:
       BIT    $F8                     ;3
       BVS    LF11E                   ;2
LF10F:
       LDA    $C6                     ;3
       AND    #$BF                    ;2
       STA    $C6                     ;3
LF115:
       JMP    LFDDA                   ;3
LF118:
       JMP    LF1B1                   ;3
LF11B:
       JMP    LFF00                   ;3
LF11E:
       JMP    LFE7B                   ;3
LF121:
       JMP    LFFF2                   ;3
LF124:
       BIT    $C6                     ;3
       BVS    LF12B                   ;2
       JMP    LF815                   ;3
LF12B:
       LDA    $DC                     ;3
       LSR                            ;2
       LSR                            ;2
       TAY                            ;2
       LDA    LFFCA,Y                 ;4
       STA    $9E                     ;3
       LDA    INTIM                   ;4
       CMP    #$10                    ;2
       BCC    LF13F                   ;2
       JMP    LF70D                   ;3
LF13F:
       JMP    LF027                   ;3
LF142:
       .byte $00 ; |        | $F142
       .byte $00 ; |        | $F143
       .byte $00 ; |        | $F144
       .byte $13 ; |   X  XX| $F145
       .byte $13 ; |   X  XX| $F146
       .byte $13 ; |   X  XX| $F147
       .byte $1D ; |   XXX X| $F148
       .byte $1D ; |   XXX X| $F149
       .byte $1D ; |   XXX X| $F14A
       .byte $18 ; |   XX   | $F14B
       .byte $15 ; |   X X X| $F14C
       .byte $13 ; |   X  XX| $F14D
       .byte $15 ; |   X X X| $F14E
       .byte $13 ; |   X  XX| $F14F
       .byte $12 ; |   X  X | $F150
       .byte $13 ; |   X  XX| $F151
       .byte $12 ; |   X  X | $F152
       .byte $10 ; |   X    | $F153
       .byte $12 ; |   X  X | $F154
       .byte $10 ; |   X    | $F155
       .byte $0E ; |    XXX | $F156
       .byte $10 ; |   X    | $F157
       .byte $10 ; |   X    | $F158
       .byte $10 ; |   X    | $F159
       .byte $12 ; |   X  X | $F15A
       .byte $10 ; |   X    | $F15B
       .byte $0E ; |    XXX | $F15C
       .byte $10 ; |   X    | $F15D
       .byte $10 ; |   X    | $F15E
       .byte $10 ; |   X    | $F15F
       .byte $10 ; |   X    | $F160
       .byte $10 ; |   X    | $F161
       .byte $10 ; |   X    | $F162
       .byte $19 ; |   XX  X| $F163
       .byte $19 ; |   XX  X| $F164
       .byte $19 ; |   XX  X| $F165
LF166:
       LDX    #$00                    ;2
       STX    $C8                     ;3
       STX    $C5                     ;3
       DEX                            ;2
       STX    $C7                     ;3
LF16F:
       LDX    #$06                    ;2
       STX    $F6                     ;3
       LDY    #$3A                    ;2
       STY    $C1                     ;3
       LDA    $C6                     ;3
       AND    #$BE                    ;2
       STA    $C6                     ;3
       BPL    LF181                   ;2
       LDX    #$66                    ;2
LF181:
       STX    $F7                     ;3
       LDA    #$27                    ;2
       STA    $F8                     ;3
       LDX    #$00                    ;2
       STX    $97                     ;3
       STX    $98                     ;3
       STX    $99                     ;3
       STX    $C2                     ;3
       STX    $C3                     ;3
       STX    $C4                     ;3
LF195:
       LDX    #$06                    ;2
LF197:
       LDY    #$01                    ;2
       STY    $CF,X                   ;4
       DEY                            ;2
       STY    $AE,X                   ;4
       DEX                            ;2
       BNE    LF197                   ;2
       STX    $C9                     ;3
       LDA    $F7                     ;3
       BEQ    LF1AB                   ;2
       LDA    $C8                     ;3
       BNE    LF1B0                   ;2
LF1AB:
       STX    $88                     ;3
       DEX                            ;2
       STX    $B5                     ;3
LF1B0:
       RTS                            ;6

LF1B1:
       LDA    $C8                     ;3
       AND    #$0F                    ;2
       CMP    #$03                    ;2
       BCC    LF1D4                   ;2
       CMP    #$05                    ;2
       BCS    LF1C0                   ;2
       JMP    LF305                   ;3
LF1C0:
       BNE    LF1C5                   ;2
       JMP    LF39B                   ;3
LF1C5:
       CMP    #$08                    ;2
       BCS    LF1CC                   ;2
       JMP    LF3EB                   ;3
LF1CC:
       BNE    LF1D1                   ;2
       JMP    LF4B1                   ;3
LF1D1:
       JMP    LF639                   ;3
LF1D4:
       STA    $CA                     ;3
       LDA    $96                     ;3
       AND    #$1F                    ;2
       BNE    LF210                   ;2
       LDA    $88                     ;3
       JSR    LF6D8                   ;6
       AND    #$07                    ;2
       CMP    #$06                    ;2
       BCS    LF210                   ;2
       TAX                            ;2
       LDA    $AF,X                   ;4
       LDY    $CA                     ;3
       CPY    #$02                    ;2
       BNE    LF1F8                   ;2
       CMP    #$C0                    ;2
       BCS    LF210                   ;2
       ORA    #$04                    ;2
       BNE    LF20E                   ;2
LF1F8:
       AND    #$8C                    ;2
       BNE    LF20A                   ;2
       LDA    $D0,X                   ;4
       AND    #$0F                    ;2
       CMP    #$0B                    ;2
       BEQ    LF210                   ;2
       LDA    $AF,X                   ;4
       ORA    #$08                    ;2
       BNE    LF20E                   ;2
LF20A:
       LDA    $AF,X                   ;4
       AND    #$F3                    ;2
LF20E:
       STA    $AF,X                   ;4
LF210:
       LDX    #$06                    ;2
LF212:
       LDA    $AE,X                   ;4
       AND    #$03                    ;2
       BNE    LF21B                   ;2
       JMP    LF2B0                   ;3
LF21B:
       CMP    #$03                    ;2
       BEQ    LF22A                   ;2
       LDA    $96                     ;3
       AND    #$0F                    ;2
       BNE    LF227                   ;2
       DEC    $AE,X                   ;6
LF227:
       JMP    LF274                   ;3
LF22A:
       CPX    #$01                    ;2
       BNE    LF24E                   ;2
       BIT    $AF                     ;3
       BPL    LF24E                   ;2
       LDA    $C9                     ;3
       BPL    LF227                   ;2
       LDA    $FB                     ;3
       AND    $96                     ;3
       BNE    LF227                   ;2
       LDY    #$04                    ;2
       JSR    LFE22                   ;6
       CMP    #$4B                    ;2
       BNE    LF227                   ;2
       LDA    $AF                     ;3
       CLC                            ;2
       ADC    #$04                    ;2
       AND    #$FC                    ;2
       BNE    LF268                   ;2
LF24E:
       LDA    $AE,X                   ;4
       LDY    $CA                     ;3
       CPY    #$02                    ;2
       BNE    LF27A                   ;2
       AND    #$04                    ;2
       BNE    LF25C                   ;2
LF25A:
       LDY    #$01                    ;2
LF25C:
       JSR    LFE22                   ;6
       CMP    #$4B                    ;2
       BNE    LF26A                   ;2
       JSR    LF6D6                   ;6
       AND    #$30                    ;2
LF268:
       STA    $AE,X                   ;4
LF26A:
       LDA    INTIM                   ;4
       CMP    #$1A                    ;2
       BPL    LF274                   ;2
       JMP    LF11E                   ;3
LF274:
       DEX                            ;2
       BNE    LF212                   ;2
LF277:
       JMP    LF11B                   ;3
LF27A:
       AND    #$0C                    ;2
       BEQ    LF25A                   ;2
       CMP    #$0C                    ;2
       BEQ    LF298                   ;2
       LDA    $DC,X                   ;4
       CLC                            ;2
       SBC    LF6D0-1,X               ;4
       BEQ    LF292                   ;2
       CLC                            ;2
       ADC    LF6D0-1,X               ;4
       STA    $DC,X                   ;4
       BNE    LF274                   ;2
LF292:
       LDA    $AE,X                   ;4
       ORA    #$04                    ;2
       BNE    LF268                   ;2
LF298:
       LDA    $DC,X                   ;4
       SEC                            ;2
       SBC    LF6D0-1,X               ;4
       CMP    #$0C                    ;2
       BEQ    LF2AA                   ;2
       SEC                            ;2
       ADC    LF6D0-1,X               ;4
       STA    $DC,X                   ;4
       BNE    LF274                   ;2
LF2AA:
       LDA    $AE,X                   ;4
       AND    #$FB                    ;2
       BNE    LF268                   ;2
LF2B0:
       CPX    #$01                    ;2
       BNE    LF2DB                   ;2
       LDA    $C8                     ;3
       CMP    #$90                    ;2
       BCS    LF2DB                   ;2
       LDA    $AF                     ;3
       AND    #$10                    ;2
       BNE    LF302                   ;2
       BIT    $F8                     ;3
       BMI    LF2C6                   ;2
       BVS    LF302                   ;2
LF2C6:
       LDA    $88                     ;3
       CMP    #$10                    ;2
       BNE    LF302                   ;2
       LDA    $96                     ;3
       AND    #$02                    ;2
       BNE    LF302                   ;2
       LDA    $AF                     ;3
       ORA    #$03                    ;2
       TAY                            ;2
       LDA    #$79                    ;2
       BNE    LF2FA                   ;2
LF2DB:
       LDA    $96                     ;3
       SBC    $AE,X                   ;4
       AND    #$3F                    ;2
       STA    $CC                     ;3
       CPX    $CC                     ;3
       BNE    LF302                   ;2
       LDA    $B5                     ;3
       BMI    LF302                   ;2
       JSR    LF6D6                   ;6
       LDY    #$03                    ;2
       AND    #$0F                    ;2
       CMP    #$0C                    ;2
       BCS    LF2FC                   ;2
       SEC                            ;2
       ADC    LF6D0-1,X               ;4
LF2FA:
       STA    $DC,X                   ;4
LF2FC:
       LDA    #$4B                    ;2
       STA    $CF,X                   ;4
       STY    $AE,X                   ;4
LF302:
       JMP    LF274                   ;3
LF305:
       LDX    #$06                    ;2
LF307:
       LDA    $AE,X                   ;4
       AND    #$03                    ;2
       BEQ    LF366                   ;2
       CMP    #$03                    ;2
       BEQ    LF31B                   ;2
       LDA    $96                     ;3
       AND    #$0F                    ;2
       BNE    LF360                   ;2
       DEC    $AE,X                   ;6
       BPL    LF360                   ;2
LF31B:
       LDY    #$01                    ;2
       LDA    $AE,X                   ;4
       AND    #$04                    ;2
       BNE    LF33E                   ;2
       JSR    LFE22                   ;6
       LDY    $CF,X                   ;4
       JSR    LF6E3                   ;6
       CMP    #$23                    ;2
       BCC    LF338                   ;2
       SBC    #$41                    ;2
       BCS    LF360                   ;2
       EOR    #$FF                    ;2
       JMP    LF34E                   ;3
LF338:
       LDA    $AE,X                   ;4
       ORA    #$04                    ;2
       BNE    LF35E                   ;2
LF33E:
       JSR    LFE45                   ;6
       LDY    $CF,X                   ;4
       JSR    LF6E3                   ;6
       CMP    #$87                    ;2
       BCS    LF35A                   ;2
       SBC    #$69                    ;2
       BCC    LF360                   ;2
LF34E:
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       STA    $CA                     ;3
       JSR    LF6D6                   ;6
       CMP    $CA                     ;3
       BCS    LF360                   ;2
LF35A:
       LDA    $AE,X                   ;4
       EOR    #$04                    ;2
LF35E:
       STA    $AE,X                   ;4
LF360:
       DEX                            ;2
       BNE    LF307                   ;2
       JMP    LF277                   ;3
LF366:
       LDA    $96                     ;3
       SBC    $AE,X                   ;4
       AND    #$3F                    ;2
       BNE    LF360                   ;2
       LDA    $B5                     ;3
       BMI    LF360                   ;2
       LDA    $AE,X                   ;4
       AND    #$30                    ;2
       ORA    #$03                    ;2
       STA    $AE,X                   ;4
       JSR    LF6D6                   ;6
       AND    #$0F                    ;2
       CMP    #$0E                    ;2
       BCS    LF389                   ;2
       SEC                            ;2
       ADC    LF6D0-1,X               ;4
       STA    $DC,X                   ;4
LF389:
       LDY    #$4B                    ;2
       LSR                            ;2
       BCC    LF396                   ;2
       LDA    $AE,X                   ;4
       ORA    #$04                    ;2
       STA    $AE,X                   ;4
       LDY    #$61                    ;2
LF396:
       TYA                            ;2
       STA    $CF,X                   ;4
       BNE    LF360                   ;2
LF39B:
       LDX    #$00                    ;2
       LDA    $81                     ;3
       BEQ    LF3C9                   ;2
       CMP    #$01                    ;2
       BEQ    LF3BB                   ;2
       LDA    $96                     ;3
       AND    #$02                    ;2
       BNE    LF3B5                   ;2
       LDA    #$04                    ;2
       STA    AUDC0                   ;3
       LDA    #$0D                    ;2
       STA    AUDF0                   ;3
       BNE    LF3B9                   ;2
LF3B5:
       LDA    #$0F                    ;2
       STA    AUDF0                   ;3
LF3B9:
       LDX    #$0C                    ;2
LF3BB:
       LDA    $F7                     ;3
       BNE    LF3C0                   ;2
       TAX                            ;2
LF3C0:
       STX    AUDV0                   ;3
       LDY    #$FF                    ;2
       JSR    LFC22                   ;6
       DEC    $81                     ;5
LF3C9:
       LDA    $96                     ;3
       AND    #$0F                    ;2
       BNE    LF3E9                   ;2
       LDA    $D0                     ;3
       JSR    LF6D8                   ;6
       TAX                            ;2
       LDA    $AF                     ;3
       AND    #$03                    ;2
       CPX    #$90                    ;2
       BCC    LF3E7                   ;2
       CPX    #$B0                    ;2
       BCS    LF3E5                   ;2
       ORA    #$04                    ;2
       BNE    LF3E7                   ;2
LF3E5:
       ORA    #$08                    ;2
LF3E7:
       STA    $AF                     ;3
LF3E9:
       LDA    #$00                    ;2
LF3EB:
       STA    $CB                     ;3
       LDX    #$06                    ;2
LF3EF:
       LDA    $AE,X                   ;4
       AND    #$03                    ;2
       BEQ    LF40B                   ;2
       CMP    #$03                    ;2
       BEQ    LF40B                   ;2
       CMP    #$02                    ;2
       BEQ    LF403                   ;2
       LDA    $96                     ;3
       AND    #$0F                    ;2
       BEQ    LF409                   ;2
LF403:
       LDA    $96                     ;3
       AND    #$1F                    ;2
       BNE    LF40B                   ;2
LF409:
       DEC    $AE,X                   ;6
LF40B:
       LDA    $CB                     ;3
       BNE    LF41D                   ;2
       LDA    $81                     ;3
       BNE    LF41F                   ;2
       LDA    $AF                     ;3
       CMP    #$08                    ;2
       BCS    LF41F                   ;2
       CMP    #$04                    ;2
       BCC    LF461                   ;2
LF41D:
       INC    $DC,X                   ;6
LF41F:
       DEX                            ;2
       BNE    LF3EF                   ;2
       LDA    $DD                     ;3
       CMP    #$91                    ;2
       BCC    LF45E                   ;2
       LDA    $AF                     ;3
       AND    #$0C                    ;2
       STA    $CA                     ;3
       LDA    $B0                     ;3
       AND    #$03                    ;2
       ORA    $CA                     ;3
       STA    $B0                     ;3
LF436:
       LDA    $D1,X                   ;4
       STA    $D0,X                   ;4
       LDA    $DE,X                   ;4
       STA    $DD,X                   ;4
       LDA    $B0,X                   ;4
       STA    $AF,X                   ;4
       INX                            ;2
       CPX    #$05                    ;2
       BNE    LF436                   ;2
       LDX    #$01                    ;2
       STX    $E2                     ;3
       LDA    $B5                     ;3
       BMI    LF45B                   ;2
       LDA    $CB                     ;3
       BEQ    LF45B                   ;2
       LDA    #$03                    ;2
       STA    $B4                     ;3
       LDX    #$05                    ;2
       BNE    LF496                   ;2
LF45B:
       DEX                            ;2
       STX    $B4                     ;3
LF45E:
       JMP    LF277                   ;3
LF461:
       DEC    $DC,X                   ;6
       DEX                            ;2
       BEQ    LF469                   ;2
       JMP    LF3EF                   ;3
LF469:
       LDA    $DD                     ;3
       CMP    #$79                    ;2
       BCS    LF4AE                   ;2
       LDX    #$05                    ;2
LF471:
       LDA    $CF,X                   ;4
       STA    $D0,X                   ;4
       LDA    $DC,X                   ;4
       STA    $DD,X                   ;4
       LDA    $AE,X                   ;4
       STA    $AF,X                   ;4
       DEX                            ;2
       BNE    LF471                   ;2
       LDA    #$03                    ;2
       STA    $CA                     ;3
       LDA    $B5                     ;3
       BPL    LF48A                   ;2
       STX    $CA                     ;3
LF48A:
       LDA    $B0                     ;3
       AND    #$0C                    ;2
       ORA    $CA                     ;3
       STA    $AF                     ;3
       LDA    #$90                    ;2
       STA    $DD,X                   ;4
LF496:
       LDA    $88                     ;3
       JSR    LF6D8                   ;6
       AND    #$F7                    ;2
       CLC                            ;2
       ADC    #$02                    ;2
       STA    $D0,X                   ;4
       AND    #$F0                    ;2
       CMP    #$80                    ;2
       BNE    LF4AE                   ;2
       LDA    $D0,X                   ;4
       EOR    #$F0                    ;2
       STA    $D0,X                   ;4
LF4AE:
       JMP    LF277                   ;3
LF4B1:
       LDA    $C9                     ;3
       BPL    LF4BB                   ;2
       LDA    $FB                     ;3
       AND    $96                     ;3
       BEQ    LF4BE                   ;2
LF4BB:
       JMP    LF544                   ;3
LF4BE:
       LDX    #$06                    ;2
LF4C0:
       LDA    $DC,X                   ;4
       CLC                            ;2
       ADC    #$04                    ;2
       STA    $DC,X                   ;4
       DEX                            ;2
       BNE    LF4C0                   ;2
       CMP    #$91                    ;2
       BCC    LF544                   ;2
LF4CE:
       LDA    $DE,X                   ;4
       STA    $DD,X                   ;4
       LDA    $B0,X                   ;4
       STA    $AF,X                   ;4
       LDA    $D1,X                   ;4
       STA    $D0,X                   ;4
       LDA    $BA,X                   ;4
       STA    $B9,X                   ;4
       INX                            ;2
       CPX    #$05                    ;2
       BNE    LF4CE                   ;2
       LDX    #$01                    ;2
       STX    $E2                     ;3
       DEX                            ;2
       LDA    $B5                     ;3
       BMI    LF4EE                   ;2
       LDX    #$03                    ;2
LF4EE:
       STX    $B4                     ;3
       LDA    $B5                     ;3
       BMI    LF540                   ;2
       LDX    $88                     ;3
       CPX    #$05                    ;2
       BNE    LF50A                   ;2
       CMP    #$1C                    ;2
       BCC    LF50A                   ;2
       LDA    $CF                     ;3
       AND    #$0F                    ;2
       CMP    #$06                    ;2
       BCC    LF50A                   ;2
       LDA    #$83                    ;2
       STA    $B4                     ;3
LF50A:
       LDA    $88                     ;3
       CLC                            ;2
       ADC    #$01                    ;2
       CMP    #$48                    ;2
       BNE    LF515                   ;2
       LDA    #$00                    ;2
LF515:
       LSR                            ;2
       TAY                            ;2
       LDA    LFFCA,Y                 ;4
       TAY                            ;2
       LDX    LF60D,Y                 ;4
       LDA    $CF                     ;3
       AND    #$0F                    ;2
       CMP    #$06                    ;2
       LDA    LF619,Y                 ;4
       BCS    LF530                   ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LDX    LF601,Y                 ;4
LF530:
       STX    $D5                     ;3
       AND    #$0F                    ;2
       STA    $BE                     ;3
       CMP    #$02                    ;2
       BNE    LF53C                   ;2
       STA    $A7                     ;3
LF53C:
       CMP    #$04                    ;2
       BNE    LF544                   ;2
LF540:
       LDX    #$00                    ;2
       STX    $B4                     ;3
LF544:
       LDA    #$8C                    ;2
       STA    COLUP1                  ;3
       LDX    #$06                    ;2
LF54A:
       LDA    $AE,X                   ;4
       AND    #$03                    ;2
       BEQ    LF579                   ;2
       CMP    #$03                    ;2
       BEQ    LF579                   ;2
       LDA    $B8,X                   ;4
       CMP    #$03                    ;2
       BNE    LF569                   ;2
       LDA    $AE,X                   ;4
       ORA    #$03                    ;2
       STA    $AE,X                   ;4
       BIT    $F8                     ;3
       BVS    LF579                   ;2
       DEC    $F8                     ;5
       JMP    LF579                   ;3
LF569:
       CMP    #$02                    ;2
       BNE    LF571                   ;2
       LDA    #$00                    ;2
       STA    $A7                     ;3
LF571:
       LDA    $96                     ;3
       AND    #$0F                    ;2
       BNE    LF579                   ;2
       DEC    $AE,X                   ;6
LF579:
       LDA    $B8,X                   ;4
       CMP    #$03                    ;2
       BNE    LF5A9                   ;2
       LDY    #$01                    ;2
       LDA    $AE,X                   ;4
       AND    #$10                    ;2
       BNE    LF596                   ;2
       JSR    LFE45                   ;6
       LDA    $CF,X                   ;4
       CMP    #$69                    ;2
       BEQ    LF5A3                   ;2
       CMP    #$75                    ;2
       BNE    LF5A9                   ;2
       BEQ    LF5A3                   ;2
LF596:
       JSR    LFE22                   ;6
       LDA    $CF,X                   ;4
       CMP    #$27                    ;2
       BEQ    LF5A3                   ;2
       CMP    #$33                    ;2
       BNE    LF5A9                   ;2
LF5A3:
       LDA    $AE,X                   ;4
       EOR    #$10                    ;2
       STA    $AE,X                   ;4
LF5A9:
       LDA    $B8,X                   ;4
       CMP    #$05                    ;2
       BCC    LF5E6                   ;2
       SBC    #$05                    ;2
       STA    $CA                     ;3
       LDA    $96                     ;3
       LSR                            ;2
       STA    REFP1                   ;3
       BCC    LF5D4                   ;2
       LDY    #$01                    ;2
       LDA    $AE,X                   ;4
       AND    #$10                    ;2
       BNE    LF5D8                   ;2
       JSR    LFE45                   ;6
       LDA    $CF,X                   ;4
       LDY    $CA                     ;3
       CMP    LF636,Y                 ;4
       BNE    LF5D4                   ;2
LF5CE:
       LDA    $AE,X                   ;4
       EOR    #$10                    ;2
       STA    $AE,X                   ;4
LF5D4:
       LDA    #$00                    ;2
       BEQ    LF5E6                   ;2
LF5D8:
       JSR    LFE22                   ;6
       LDA    $CF,X                   ;4
       LDY    $CA                     ;3
       CMP    LF633,Y                 ;4
       BEQ    LF5CE                   ;2
       LDA    #$00                    ;2
LF5E6:
       TAY                            ;2
       LDA    LF62A,Y                 ;4
       STA    $EF,X                   ;4
       LDA    LF625,Y                 ;4
       SEC                            ;2
       SBC    $DC,X                   ;4
       STA    $E9,X                   ;4
       BCS    LF5F8                   ;2
       DEC    $EF,X                   ;6
LF5F8:
       DEX                            ;2
       BEQ    LF5FE                   ;2
       JMP    LF54A                   ;3
LF5FE:
       JMP    LF277                   ;3
LF601:
       .byte $11 ; |   X   X| $F601
       .byte $11 ; |   X   X| $F602
       .byte $91 ; |X  X   X| $F603
       .byte $91 ; |X  X   X| $F604
       .byte $12 ; |   X  X | $F605
       .byte $33 ; |  XX  XX| $F606
       .byte $11 ; |   X   X| $F607
       .byte $11 ; |   X   X| $F608
       .byte $91 ; |X  X   X| $F609
       .byte $01 ; |       X| $F60A
       .byte $01 ; |       X| $F60B
       .byte $01 ; |       X| $F60C
LF60D:
       .byte $9A ; |X  XX X | $F60D
       .byte $9A ; |X  XX X | $F60E
       .byte $1A ; |   XX X | $F60F
       .byte $38 ; |  XXX   | $F610
       .byte $28 ; |  X X   | $F611
       .byte $27 ; |  X  XXX| $F612
       .byte $9A ; |X  XX X | $F613
       .byte $9A ; |X  XX X | $F614
       .byte $1A ; |   XX X | $F615
       .byte $01 ; |       X| $F616
       .byte $01 ; |       X| $F617
       .byte $01 ; |       X| $F618
LF619:
       .byte $51 ; | X X   X| $F619
       .byte $51 ; | X X   X| $F61A
       .byte $61 ; | XX    X| $F61B
       .byte $62 ; | XX   X | $F61C
       .byte $71 ; | XXX   X| $F61D
       .byte $33 ; |  XX  XX| $F61E
       .byte $11 ; |   X   X| $F61F
       .byte $11 ; |   X   X| $F620
       .byte $11 ; |   X   X| $F621
       .byte $44 ; | X   X  | $F622
       .byte $44 ; | X   X  | $F623
       .byte $44 ; | X   X  | $F624
LF625:
       .byte $F2 ; |XXXX  X | $F625
       .byte $DB ; |XX XX XX| $F626
       .byte $4F ; | X  XXXX| $F627
       .byte $C8 ; |XX  X   | $F628
       .byte $E8 ; |XXX X   | $F629
LF62A:
       .byte $DD ; |XX XXX X| $F62A
       .byte $DD ; |XX XXX X| $F62B
       .byte $DE ; |XX XXXX | $F62C
       .byte $DE ; |XX XXXX | $F62D
       .byte $DC ; |XX XXX  | $F62E
LF62F:
       .byte $01 ; |       X| $F62F
       .byte $01 ; |       X| $F630
       .byte $08 ; |    X   | $F631
       .byte $00 ; |        | $F632
LF633:
       .byte $11 ; |   X   X| $F633
       .byte $91 ; |X  X   X| $F634
       .byte $12 ; |   X  X | $F635
LF636:
       .byte $13 ; |   X  XX| $F636
       .byte $93 ; |X  X  XX| $F637
       .byte $74 ; | XXX X  | $F638
LF639:
       LDA    $C9                     ;3
       BEQ    LF5FE                   ;2
       LDA    #$33                    ;2
       STA    NUSIZ1                  ;3
       LDX    $82                     ;3
       LDA    $96                     ;3
       AND    #$1F                    ;2
       BNE    LF66D                   ;2
       LDA    $DC,X                   ;4
       SEC                            ;2
       SBC    #$02                    ;2
       STA    $DC,X                   ;4
       CMP    #$77                    ;2
       BEQ    LF65C                   ;2
       CMP    #$5F                    ;2
       BEQ    LF65C                   ;2
       CMP    #$47                    ;2
       BNE    LF66D                   ;2
LF65C:
       INX                            ;2
       STX    $82                     ;3
       STA    $DC,X                   ;4
       LDA    $CE,X                   ;4
       STA    $CF,X                   ;4
       LDA    $AD,X                   ;4
       STA    $AE,X                   ;4
       LDA    #$00                    ;2
       STA    $AD,X                   ;4
LF66D:
       LDY    #$08                    ;2
       LDA    $AE,X                   ;4
       AND    #$04                    ;2
       BNE    LF683                   ;2
       JSR    LFE22                   ;6
       LDY    $CF,X                   ;4
       JSR    LF6E3                   ;6
       CMP    #$1A                    ;2
       BCS    LF699                   ;2
       BCC    LF68F                   ;2
LF683:
       JSR    LFE45                   ;6
       LDY    $CF,X                   ;4
       JSR    LF6E3                   ;6
       CMP    #$70                    ;2
       BCC    LF699                   ;2
LF68F:
       LDA    $AE,X                   ;4
       AND    #$07                    ;2
       EOR    #$04                    ;2
       ORA    #$03                    ;2
       STA    $AE,X                   ;4
LF699:
       LDA    $DC,X                   ;4
       CMP    #$85                    ;2
       BCS    LF6A6                   ;2
       LSR                            ;2
       LSR                            ;2
       TAY                            ;2
       LDA    LFFCA,Y                 ;4
       LSR                            ;2
LF6A6:
       LDA    #$10                    ;2
       LDX    #$05                    ;2
       BCS    LF6AE                   ;2
       LSR                            ;2
       DEX                            ;2
LF6AE:
       STA    $E2                     ;3
       LDY    #$00                    ;2
       STY    $B2                     ;3
       STY    $B3                     ;3
       LDA    #$31                    ;2
       STA    $DC,X                   ;4
       LDY    #$03                    ;2
       JSR    LFE22                   ;6
       LDA    $CF,X                   ;4
       CMP    #$34                    ;2
       BNE    LF6C9                   ;2
       LDA    #$35                    ;2
       STA    $CF,X                   ;4
LF6C9:
       LDA    #$03                    ;2
       STA    $AE,X                   ;4
       JMP    LF277                   ;3
LF6D0:
       .byte $78 ; | XXXX   | $F6D0
       .byte $60 ; | XX     | $F6D1
       .byte $48 ; | X  X   | $F6D2
       .byte $30 ; |  XX    | $F6D3
       .byte $18 ; |   XX   | $F6D4
       .byte $00 ; |        | $F6D5
LF6D6:
       LDA    $96                     ;3
LF6D8:
       ADC    $F9                     ;3
       ADC    $FA                     ;3
       LDY    $F9                     ;3
       STY    $FA                     ;3
       STA    $F9                     ;3
       RTS                            ;6

LF6E3:
       TYA                            ;2
       AND    #$F0                    ;2
       CLC                            ;2
       BPL    LF6EC                   ;2
       ORA    #$0F                    ;2
       SEC                            ;2
LF6EC:
       ROR                            ;2
       ROR                            ;2
       ROR                            ;2
       ROR                            ;2
       STA    $CE                     ;3
       TYA                            ;2
       AND    #$0F                    ;2
       TAY                            ;2
       LDA    LF6FD,Y                 ;4
       SEC                            ;2
       SBC    $CE                     ;3
       RTS                            ;6

LF6FD:
       .byte $00 ; |        | $F6FD
       .byte $0F ; |    XXXX| $F6FE
       .byte $1E ; |   XXXX | $F6FF
       .byte $2D ; |  X XX X| $F700
       .byte $3C ; |  XXXX  | $F701
       .byte $4B ; | X  X XX| $F702
       .byte $5A ; | X XX X | $F703
       .byte $69 ; | XX X  X| $F704
       .byte $78 ; | XXXX   | $F705
       .byte $87 ; |X    XXX| $F706
       .byte $96 ; |X  X XX | $F707
       .byte $A5 ; |X X  X X| $F708
       .byte $B4 ; |X XX X  | $F709
       .byte $C3 ; |XX    XX| $F70A
       .byte $D2 ; |XX X  X | $F70B
       .byte $E1 ; |XXX    X| $F70C
LF70D:
       LDA    $C8                     ;3
       AND    #$0F                    ;2
       BEQ    LF726                   ;2
       CMP    #$07                    ;2
       BEQ    LF72C                   ;2
       CMP    #$08                    ;2
       BEQ    LF729                   ;2
       CMP    #$09                    ;2
       BNE    LF722                   ;2
       JMP    LF7E3                   ;3
LF722:
       CMP    #$03                    ;2
       BCC    LF72C                   ;2
LF726:
       JMP    LF13F                   ;3
LF729:
       JMP    LF78B                   ;3
LF72C:
       STA    $CA                     ;3
       LDX    #$0B                    ;2
LF730:
       LDA    $DC,X                   ;4
       BNE    LF776                   ;2
       LDA    $96                     ;3
       AND    #$1F                    ;2
       BNE    LF783                   ;2
       LDA    $CA                     ;3
       CMP    #$01                    ;2
       BEQ    LF749                   ;2
       JSR    LF6D6                   ;6
       AND    #$07                    ;2
       CMP    #$06                    ;2
       BCC    LF74F                   ;2
LF749:
       LDA    #$0B                    ;2
       SEC                            ;2
       SBC    $9E                     ;3
       LSR                            ;2
LF74F:
       TAY                            ;2
       LDA.wy $AF,Y                   ;4
       AND    #$C7                    ;2
       CMP    #$03                    ;2
       BNE    LF783                   ;2
       LDA.wy $AF,Y                   ;4
       ORA    #$40                    ;2
       STA.wy $AF,Y                   ;5
       LDA.wy $D0,Y                   ;4
       STA    $CF,X                   ;4
       LDA    #$02                    ;2
       CMP    $CA                     ;3
       BEQ    LF76E                   ;2
       LDA    #$04                    ;2
LF76E:
       SEC                            ;2
       ADC.wy $DD,Y                   ;4
       AND    #$FE                    ;2
       STA    $DC,X                   ;4
LF776:
       LDY    #$02                    ;2
       JSR    LFE22                   ;6
       CMP    #$4B                    ;2
       BNE    LF783                   ;2
       LDA    #$00                    ;2
       STA    $DC,X                   ;4
LF783:
       INX                            ;2
       CPX    #$0D                    ;2
       BNE    LF730                   ;2
LF788:
       JMP    LF726                   ;3
LF78B:
       LDA    $88                     ;3
       SEC                            ;2
       SBC    #$11                    ;2
       BCC    LF796                   ;2
       CMP    #$26                    ;2
       BCC    LF79E                   ;2
LF796:
       LDA    #$00                    ;2
       STA    $E7                     ;3
       STA    $E8                     ;3
       BEQ    LF788                   ;2
LF79E:
       ASL                            ;2
       ASL                            ;2
       ADC    #$02                    ;2
       LDX    $A7                     ;3
       BEQ    LF7BA                   ;2
       LDX    $E7                     ;3
       BNE    LF7B0                   ;2
       STA    $E7                     ;3
       LDY    #$1A                    ;2
       STY    $DA                     ;3
LF7B0:
       LDX    $E8                     ;3
       BNE    LF7BA                   ;2
       STA    $E8                     ;3
       LDY    #$38                    ;2
       STY    $DB                     ;3
LF7BA:
       LDY    #$06                    ;2
       LDX    #$0B                    ;2
       JSR    LFE22                   ;6
       INX                            ;2
       JSR    LFE45                   ;6
       LDA    $C9                     ;3
       BPL    LF7E0                   ;2
       LDA    $FB                     ;3
       LSR                            ;2
       AND    $96                     ;3
       BNE    LF7E0                   ;2
       LDA    $E7                     ;3
       BEQ    LF7D8                   ;2
       INC    $E7                     ;5
       INC    $E7                     ;5
LF7D8:
       LDA    $E8                     ;3
       BEQ    LF7E0                   ;2
       INC    $E8                     ;5
       INC    $E8                     ;5
LF7E0:
       JMP    LF726                   ;3
LF7E3:
       LDA    $E7                     ;3
       BNE    LF80B                   ;2
       LDA    $DC                     ;3
       CLC                            ;2
       ADC    #$05                    ;2
       AND    #$FE                    ;2
       STA    $E7                     ;3
       LSR                            ;2
       LSR                            ;2
       TAY                            ;2
       LDA    LFFCA,Y                 ;4
       ASL                            ;2
       ADC    LFFCA,Y                 ;4
       ASL                            ;2
       ASL                            ;2
       EOR    #$FF                    ;2
       SEC                            ;2
       ADC    $E7                     ;3
       BNE    LF807                   ;2
       INC    $E7                     ;5
       INC    $E7                     ;5
LF807:
       LDA    #$0A                    ;2
       STA    $DA                     ;3
LF80B:
       LDY    #$02                    ;2
       LDX    #$0B                    ;2
       JSR    LFE22                   ;6
       JMP    LF726                   ;3
LF815:
       LDA    $C8                     ;3
       AND    #$0F                    ;2
       TAX                            ;2
       LDA    LFFB0,X                 ;4
       STA    $CA                     ;3
       CPX    #$09                    ;2
       BNE    LF85B                   ;2
       LDA    $83                     ;3
       BEQ    LF838                   ;2
       CMP    #$02                    ;2
       BCC    LF82E                   ;2
       JMP    LF905                   ;3
LF82E:
       LDA    #$00                    ;2
       STA    $C8                     ;3
       JSR    LF195                   ;6
       JMP    LF9DD                   ;3
LF838:
       LDA    $E6                     ;3
       BEQ    LF85B                   ;2
       CMP    #$2D                    ;2
       BCS    LF85B                   ;2
       LDA    #$00                    ;2
       STA    $E6                     ;3
       LDX    $82                     ;3
       LDA    LF855,X                 ;4
       SED                            ;2
       CLC                            ;2
       JSR    LFC37                   ;6
       LDA    #$7F                    ;2
       STA    $83                     ;3
       JMP    LFB5D                   ;3
LF855:
       .byte $10 ; |   X    | $F855
       .byte $20 ; |  X     | $F856
       .byte $30 ; |  XX    | $F857
       .byte $80 ; |X       | $F858
       .byte $10 ; |   X    | $F859
       .byte $10 ; |   X    | $F85A
LF85B:
       LDX    #$03                    ;2
       STX    $CC                     ;3
LF85F:
       LDA    $E3,X                   ;4
       BNE    LF866                   ;2
       JMP    LF88B                   ;3
LF866:
       LSR                            ;2
       LSR                            ;2
       TAY                            ;2
       LDA    LFFCA,Y                 ;4
       SEC                            ;2
       SBC    #$01                    ;2
       BMI    LF880                   ;2
       LSR                            ;2
       STA    $CB                     ;3
       SEC                            ;2
       SBC    #$05                    ;2
       EOR    #$FF                    ;2
       TAX                            ;2
       INX                            ;2
       JSR    LF897                   ;6
       LDA    $CB                     ;3
LF880:
       SEC                            ;2
       SBC    #$05                    ;2
       EOR    #$FF                    ;2
       TAX                            ;2
       BMI    LF88B                   ;2
       JSR    LF897                   ;6
LF88B:
       DEC    $CC                     ;5
       BPL    LF892                   ;2
       JMP    LF905                   ;3
LF892:
       LDX    $CC                     ;3
       JMP    LF85F                   ;3
LF897:
       LDA    $AF,X                   ;4
       AND    #$83                    ;2
       CMP    #$03                    ;2
       BNE    LF8B9                   ;2
       LDY    $CC                     ;3
       LDA.wy $E3,Y                   ;4
       SBC    $DD,X                   ;4
       CPY    #$02                    ;2
       BCC    LF8BA                   ;2
       BEQ    LF8B3                   ;2
       SBC    $CA                     ;3
       CMP    #$FA                    ;2
       BCS    LF8C4                   ;2
       RTS                            ;6

LF8B3:
       ADC    #$0A                    ;2
       CMP    #$06                    ;2
       BCC    LF8C4                   ;2
LF8B9:
       RTS                            ;6

LF8BA:
       CMP    #$FF                    ;2
       BEQ    LF8C4                   ;2
       CMP    $CA                     ;3
       BEQ    LF8C4                   ;2
       BCS    LF8B9                   ;2
LF8C4:
       STX    $CD                     ;3
       LDY    $D0,X                   ;4
       JSR    LF6E3                   ;6
       STA    $86                     ;3
       LDX    $CC                     ;3
       LDY    $D6,X                   ;4
       JSR    LF6E3                   ;6
       SEC                            ;2
       SBC    $86                     ;3
       CPX    #$01                    ;2
       BCC    LF8E2                   ;2
       BNE    LF8E4                   ;2
       ADC    #$07                    ;2
       JMP    LF8E4                   ;3
LF8E2:
       SBC    #$04                    ;2
LF8E4:
       CMP    #$08                    ;2
       BCS    LF8B9                   ;2
       LDA    #$00                    ;2
       STA    $E3,X                   ;4
       LDA    $C8                     ;3
       CMP    #$69                    ;2
       BEQ    LF8B9                   ;2
       LDX    $CD                     ;3
       DEC    $AF,X                   ;6
       BIT    $F8                     ;3
       BVS    LF902                   ;2
       LDA    $F8                     ;3
       CMP    #$27                    ;2
       BEQ    LF902                   ;2
       INC    $F8                     ;5
LF902:
       JMP    LFBFA                   ;3
LF905:
       LDY    #$00                    ;2
       BIT    CXM0FB                  ;3
       BPL    LF90F                   ;2
       LDX    $E9                     ;3
       STY    $E3,X                   ;4
LF90F:
       BIT    CXBLPF                  ;3
       BPL    LF931                   ;2
       LDA    $96                     ;3
       AND    #$01                    ;2
       TAX                            ;2
       LDA    $E7,X                   ;4
       BNE    LF921                   ;2
       INX                            ;2
       TXA                            ;2
       AND    #$01                    ;2
       TAX                            ;2
LF921:
       LDA    $C8                     ;3
       CMP    #$69                    ;2
       BNE    LF92F                   ;2
       LDA    $DA,X                   ;4
       AND    #$0F                    ;2
       CMP    #$06                    ;2
       BCS    LF931                   ;2
LF92F:
       STY    $E7,X                   ;4
LF931:
       BIT    CXPPMM                  ;3
       BPL    LF93C                   ;2
       LDA    $C9                     ;3
       BPL    LF993                   ;2
       JMP    LFAB0                   ;3
LF93C:
       BIT    CXP0FB                  ;3
       BMI    LF993                   ;2
       BVS    LF973                   ;2
       DEC    $C9                     ;5
       BPL    LF96E                   ;2
LF946:
       LDA    #$FF                    ;2
       STA    $C9                     ;3
LF94A:
       LDA    $C8                     ;3
       CMP    #$45                    ;2
       BNE    LF96B                   ;2
       LDA    $81                     ;3
       BEQ    LF96B                   ;2
       CMP    #$01                    ;2
       BNE    LF970                   ;2
       LDA    $DC                     ;3
       LDX    #$05                    ;2
LF95C:
       CMP    $DD,X                   ;4
       BEQ    LF963                   ;2
       DEX                            ;2
       BNE    LF95C                   ;2
LF963:
       LDA    #$00                    ;2
       STA    $AF,X                   ;4
       STA    AUDV0                   ;3
       INC    $80                     ;5
LF96B:
       JMP    LFC6E                   ;3
LF96E:
       STA    CXCLR                   ;3
LF970:
       JMP    LFB4F                   ;3
LF973:
       DEC    $C9                     ;5
       BPL    LF9A0                   ;2
       LDX    #$00                    ;2
LF979:
       LDA    $E7,X                   ;4
       SEC                            ;2
       SBC    $DC                     ;3
       SEC                            ;2
       SBC    #$02                    ;2
       CMP    #$09                    ;2
       BCC    LF98C                   ;2
       INX                            ;2
       CPX    #$01                    ;2
       BEQ    LF979                   ;2
       BNE    LF946                   ;2
LF98C:
       LDA    #$00                    ;2
       STA    $E7,X                   ;4
       JMP    LFAB0                   ;3
LF993:
       DEC    $C9                     ;5
       BPL    LF9A0                   ;2
       LDA    #$FB                    ;2
       CMP    $C9                     ;3
       BCC    LF94A                   ;2
       JMP    LFAB0                   ;3
LF9A0:
       LDA    $C9                     ;3
       CMP    #$75                    ;2
       BCC    LF9A9                   ;2
       JMP    LFAFD                   ;3
LF9A9:
       CMP    #$6C                    ;2
       BCS    LF9BB                   ;2
       CMP    #$5F                    ;2
       BCS    LF9C8                   ;2
       CMP    #$55                    ;2
       BCS    LF9D5                   ;2
       CMP    #$2D                    ;2
       BCS    LF9E0                   ;2
       BCC    LF9E7                   ;2
LF9BB:
       LDY    #$26                    ;2
       STY    COLUP0                  ;3
       LDA    #$7C                    ;2
       LDX    #$DD                    ;2
       LDY    #$08                    ;2
       JMP    LFB6D                   ;3
LF9C8:
       LDY    #$22                    ;2
       STY    COLUP0                  ;3
       LDA    #$94                    ;2
       LDX    #$DD                    ;2
       LDY    #$04                    ;2
       JMP    LFB6D                   ;3
LF9D5:
       LDA    #$00                    ;2
       STA    AUDV0                   ;3
       LDY    #$22                    ;2
       STY    COLUP0                  ;3
LF9DD:
       JMP    LF12B                   ;3
LF9E0:
       LDA    #$E8                    ;2
       LDX    #$DC                    ;2
       JMP    LFB75                   ;3
LF9E7:
       CMP    #$2C                    ;2
       BEQ    LF9EE                   ;2
       JMP    LFAA2                   ;3
LF9EE:
       LDA    $C8                     ;3
       CMP    #$08                    ;2
       BNE    LF9F8                   ;2
       LDX    #$00                    ;2
       STX    $A7                     ;3
LF9F8:
       LDA    #$27                    ;2
       STA    $F8                     ;3
       LDA    $F7                     ;3
       BNE    LFA03                   ;2
LFA00:
       JMP    LFA8D                   ;3
LFA03:
       DEC    $F7                     ;5
       BNE    LFA24                   ;2
       LDA    $C6                     ;3
       BMI    LFA00                   ;2
       LDA    $C7                     ;3
       CMP    #$0A                    ;2
       BCS    LFA24                   ;2
       LDA    #$40                    ;2
       STA    $F6                     ;3
       ORA    $C6                     ;3
       STA    $C6                     ;3
       LDA    #$00                    ;2
       LDX    #$03                    ;2
LFA1D:
       STA    $E3,X                   ;4
       DEX                            ;2
       BNE    LFA1D                   ;2
       BEQ    LFAA2                   ;2
LFA24:
       LDA    $C8                     ;3
       CMP    #$69                    ;2
       BNE    LFA33                   ;2
       LDA    #$00                    ;2
       STA    $C8                     ;3
       JSR    LF195                   ;6
       STA    CXCLR                   ;3
LFA33:
       LDA    $C6                     ;3
       BPL    LF9DD                   ;2
       LDA    $F7                     ;3
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       BEQ    LF9DD                   ;2
       STA    $CA                     ;3
       LDA    $F7                     ;3
       AND    #$0F                    ;2
       TAX                            ;2
       LDA    LFA85,X                 ;4
       ORA    $CA                     ;3
       STA    $F7                     ;3
       LDA    $C7                     ;3
       LDX    $C5                     ;3
       DEX                            ;2
       STX    $C7                     ;3
       STA    $C5                     ;3
       LDA    #$00                    ;2
       STA    $C8                     ;3
       JSR    LF195                   ;6
       STX    $C8                     ;3
LFA5F:
       LDX    #$02                    ;2
LFA61:
       LDA    $97,X                   ;4
       LDY    $C2,X                   ;4
       STY    $97,X                   ;4
       STA    $C2,X                   ;4
       DEX                            ;2
       BPL    LFA61                   ;2
LFA6C:
       LDA    $C6                     ;3
       EOR    #$01                    ;2
       STA    $C6                     ;3
       LDY    #$3A                    ;2
       LSR                            ;2
       BCC    LFA79                   ;2
       LDY    #$58                    ;2
LFA79:
       STY    $C1                     ;3
       LDA    $F7                     ;3
       BNE    LFA82                   ;2
       JMP    LFAA2                   ;3
LFA82:
       JMP    LF9DD                   ;3
LFA85:
       .byte $00 ; |        | $FA85
       .byte $10 ; |   X    | $FA86
       .byte $20 ; |  X     | $FA87
       .byte $30 ; |  XX    | $FA88
       .byte $40 ; | X      | $FA89
       .byte $50 ; | X X    | $FA8A
       .byte $60 ; | XX     | $FA8B
       .byte $70 ; | XXX    | $FA8C
LFA8D:
       JSR    LF195                   ;6
       LDA    $C7                     ;3
       CMP    #$09                    ;2
       BCC    LFA9A                   ;2
       LDA    #$FF                    ;2
       STA    $C7                     ;3
LFA9A:
       STA    CXCLR                   ;3
       LDA    $C6                     ;3
       BPL    LFA6C                   ;2
       BMI    LFA5F                   ;2
LFAA2:
       LDA    $C8                     ;3
       BMI    LFAA9                   ;2
       JMP    LFB12                   ;3
LFAA9:
       LDA    #$48                    ;2
       STA    $DC                     ;3
       JMP    LFB4F                   ;3
LFAB0:
       BIT    CXPPMM                  ;3
       BMI    LFAB7                   ;2
       JMP    LFAF3                   ;3
LFAB7:
       LDA    #$00                    ;2
       STA    $CB                     ;3
       LDA    $DC                     ;3
       LSR                            ;2
       LSR                            ;2
       TAY                            ;2
       LDA    LFFCA,Y                 ;4
       SEC                            ;2
       SBC    #$01                    ;2
       BMI    LFAD7                   ;2
       LSR                            ;2
       STA    $CC                     ;3
       SEC                            ;2
       SBC    #$05                    ;2
       EOR    #$FF                    ;2
       TAX                            ;2
       INX                            ;2
       JSR    LFB82                   ;6
       LDA    $CC                     ;3
LFAD7:
       SEC                            ;2
       SBC    #$05                    ;2
       EOR    #$FF                    ;2
       TAX                            ;2
       BMI    LFAE2                   ;2
       JSR    LFB82                   ;6
LFAE2:
       LDA    $CB                     ;3
       BNE    LFAF3                   ;2
       LDA    $81                     ;3
       BNE    LFAF0                   ;2
       BIT    CXP0FB                  ;3
       BMI    LFAF3                   ;2
       BVS    LFAF3                   ;2
LFAF0:
       JMP    LF946                   ;3
LFAF3:
       BIT    $F8                     ;3
       BMI    LFAF9                   ;2
       BVS    LFAF0                   ;2
LFAF9:
       LDA    #$7F                    ;2
       STA    $C9                     ;3
LFAFD:
       LDA    #$08                    ;2
       STA    AUDC0                   ;3
       LDA    #$1C                    ;2
       STA    AUDF0                   ;3
       LDY    #$2A                    ;2
       STY    COLUP0                  ;3
       LDY    #$0F                    ;2
       LDA    #$64                    ;2
       LDX    #$DD                    ;2
       JMP    LFB6D                   ;3
LFB12:
       AND    #$F0                    ;2
       BNE    LFB4B                   ;2
       LDA    #$4E                    ;2
       SEC                            ;2
       SBC    $DC                     ;3
       BCC    LFB2B                   ;2
       LSR                            ;2
       LSR                            ;2
       CLC                            ;2
       ADC    $88                     ;3
       CMP    #$48                    ;2
       BCC    LFB36                   ;2
       SBC    #$48                    ;2
       JMP    LFB36                   ;3
LFB2B:
       LSR                            ;2
       LSR                            ;2
       ORA    #$C0                    ;2
       CLC                            ;2
       ADC    $88                     ;3
       BPL    LFB36                   ;2
       ADC    #$48                    ;2
LFB36:
       LSR                            ;2
       LSR                            ;2
       TAX                            ;2
       LDA    $CF                     ;3
       AND    #$0F                    ;2
       CMP    #$06                    ;2
       BCC    LFB46                   ;2
       LDA    LFF9E,X                 ;4
       BNE    LFB4D                   ;2
LFB46:
       LDA    LFF8D,X                 ;4
       BNE    LFB4D                   ;2
LFB4B:
       LDA    #$46                    ;2
LFB4D:
       STA    $CF                     ;3
LFB4F:
       LDA    $C8                     ;3
       BMI    LFB63                   ;2
       AND    #$10                    ;2
       BEQ    LFB5D                   ;2
       LDA    #$4C                    ;2
       LDX    #$DD                    ;2
       BNE    LFB67                   ;2
LFB5D:
       LDA    #$34                    ;2
       LDX    #$DD                    ;2
       BNE    LFB67                   ;2
LFB63:
       LDA    #$1A                    ;2
       LDX    #$DD                    ;2
LFB67:
       LDY    $C1                     ;3
       STY    COLUP0                  ;3
       BNE    LFB75                   ;2
LFB6D:
       STY    AUDV0                   ;3
       LDY    $F7                     ;3
       BNE    LFB75                   ;2
       STY    AUDV0                   ;3
LFB75:
       SEC                            ;2
       SBC    $DC                     ;3
       STA    $84                     ;3
       BCS    LFB7D                   ;2
       DEX                            ;2
LFB7D:
       STX    $85                     ;3
       JMP    LF9DD                   ;3
LFB82:
       LDA    $C8                     ;3
       AND    #$F0                    ;2
       CMP    #$40                    ;2
       BEQ    LFB92                   ;2
       LDA    $AF,X                   ;4
       AND    #$03                    ;2
       CMP    #$03                    ;2
       BNE    LFBCE                   ;2
LFB92:
       LDA    $DD,X                   ;4
       SBC    $DC                     ;3
       CLC                            ;2
       ADC    $CA                     ;3
       SEC                            ;2
       SBC    #$0A                    ;2
       CMP    #$F9                    ;2
       BCS    LFBA4                   ;2
       CMP    $CA                     ;3
       BCS    LFBCE                   ;2
LFBA4:
       LDY    $CF                     ;3
       JSR    LF6E3                   ;6
       STA    $86                     ;3
       LDY    $D0,X                   ;4
       JSR    LF6E3                   ;6
       SEC                            ;2
       SBC    $86                     ;3
       CLC                            ;2
       ADC    #$05                    ;2
       LDY    $C8                     ;3
       CPY    #$69                    ;2
       BNE    LFBC2                   ;2
       CMP    #$23                    ;2
       BCS    LFBCE                   ;2
       BCC    LFBC6                   ;2
LFBC2:
       CMP    #$0B                    ;2
       BCS    LFBCE                   ;2
LFBC6:
       LDA    $AF,X                   ;4
       BPL    LFBCF                   ;2
       LDA    #$67                    ;2
       STA    $F8                     ;3
LFBCE:
       RTS                            ;6

LFBCF:
       CPY    #$45                    ;2
       BNE    LFBF0                   ;2
       LDA    $80                     ;3
       CMP    #$03                    ;2
       BEQ    LFBF0                   ;2
       LDA    $81                     ;3
       BNE    LFBEF                   ;2
       LDA    #$6D                    ;2
       STA    $81                     ;3
       LDA    $DD,X                   ;4
       STA    $DC                     ;3
       LDA    $D0,X                   ;4
       STA    $CF                     ;3
       LDA    $AF,X                   ;4
       ORA    #$03                    ;2
       STA    $AF,X                   ;4
LFBEF:
       RTS                            ;6

LFBF0:
       LDA    #$01                    ;2
       STA    $CB                     ;3
       CPY    #$69                    ;2
       BEQ    LFBEF                   ;2
       DEC    $AF,X                   ;6
LFBFA:
       DEC    $B5                     ;5
       LDA    $C8                     ;3
       AND    #$0F                    ;2
       CMP    #$08                    ;2
       BNE    LFC21                   ;2
       LDA    $F7                     ;3
       BEQ    LFC53                   ;2
       LDA    $B9,X                   ;4
       CMP    #$05                    ;2
       BCS    LFC66                   ;2
       TAY                            ;2
       LDA    LF62F,Y                 ;4
       BNE    LFC19                   ;2
       INC    $B5                     ;5
       JMP    LFC53                   ;3
LFC19:
       CMP    #$01                    ;2
       BEQ    LFC66                   ;2
       SED                            ;2
       CLC                            ;2
       BNE    LFC37                   ;2
LFC21:
       TAY                            ;2
LFC22:
       LDX    $F7                     ;3
       BEQ    LFC53                   ;2
       INY                            ;2
       LDA    LFFBA,Y                 ;4
       CMP    #$01                    ;2
       BEQ    LFC66                   ;2
       CLC                            ;2
       SED                            ;2
       ADC    $97                     ;3
       STA    $97                     ;3
       LDA    LFFC1,Y                 ;4
LFC37:
       ADC    $98                     ;3
       STA    $98                     ;3
       LDA    #$00                    ;2
       ADC    $99                     ;3
       STA    $99                     ;3
       CLD                            ;2
       LDA    $97                     ;3
       LSR                            ;2
       BCS    LFC54                   ;2
       LDA    $99                     ;3
       BEQ    LFC53                   ;2
       LDA    $97                     ;3
       ORA    #$01                    ;2
       STA    $97                     ;3
       INC    $F7                     ;5
LFC53:
       RTS                            ;6

LFC54:
       LSR                            ;2
       BCS    LFC53                   ;2
       LDA    $99                     ;3
       CMP    #$05                    ;2
       BNE    LFC53                   ;2
       LDA    $97                     ;3
       ORA    #$02                    ;2
       STA    $97                     ;3
       INC    $F7                     ;5
       RTS                            ;6

LFC66:
       LDA    $96                     ;3
       AND    #$03                    ;2
       SEC                            ;2
       SED                            ;2
       BCS    LFC37                   ;2
LFC6E:
       LDA    $96                     ;3
       AND    #$01                    ;2
       BEQ    LFC77                   ;2
LFC74:
       JMP    LF96E                   ;3
LFC77:
       LDA    $F8                     ;3
       BPL    LFC81                   ;2
       LDA    #$06                    ;2
       STA    $CA                     ;3
       BNE    LFCE6                   ;2
LFC81:
       LDA    $F7                     ;3
       BNE    LFCA6                   ;2
       LDA    $96                     ;3
       AND    #$03                    ;2
       BNE    LFC74                   ;2
       JSR    LF6D6                   ;6
       AND    #$0F                    ;2
       TAY                            ;2
       LDA    LFC96,Y                 ;4
       BNE    LFCC1                   ;2
LFC96:
       .byte $01 ; |       X| $FC96
       .byte $02 ; |      X | $FC97
       .byte $04 ; |     X  | $FC98
       .byte $08 ; |    X   | $FC99
       .byte $09 ; |    X  X| $FC9A
       .byte $05 ; |     X X| $FC9B
       .byte $0A ; |    X X | $FC9C
       .byte $06 ; |     XX | $FC9D
       .byte $81 ; |X      X| $FC9E
       .byte $82 ; |X     X | $FC9F
       .byte $84 ; |X    X  | $FCA0
       .byte $88 ; |X   X   | $FCA1
       .byte $89 ; |X   X  X| $FCA2
       .byte $85 ; |X    X X| $FCA3
       .byte $8A ; |X   X X | $FCA4
       .byte $86 ; |X    XX | $FCA5
LFCA6:
       LDA    #$80                    ;2
       BIT    SWCHB                   ;4
       BVC    LFCAF                   ;2
       LDA    #$00                    ;2
LFCAF:
       STA    $CD                     ;3
       LDA    $C6                     ;3
       LSR                            ;2
       LDA    SWCHA                   ;4
       BCS    LFCBD                   ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
LFCBD:
       AND    #$0F                    ;2
       EOR    #$0F                    ;2
LFCC1:
       STA    $CA                     ;3
       BEQ    LFD2E                   ;2
       BIT    $F8                     ;3
       BVS    LFCE6                   ;2
       LDA    $F7                     ;3
       BNE    LFCD1                   ;2
       LDA    $CA                     ;3
       BNE    LFCDC                   ;2
LFCD1:
       LDA    $C6                     ;3
       LSR                            ;2
       BCC    LFCDA                   ;2
       LDA    INPT5                   ;3
       BCS    LFCDC                   ;2
LFCDA:
       LDA    INPT4                   ;3
LFCDC:
       CMP    $CD                     ;3
       BMI    LFCE6                   ;2
       LDA    $96                     ;3
       AND    #$03                    ;2
       BNE    LFD4E                   ;2
LFCE6:
       LDX    #$00                    ;2
       LDA    $CA                     ;3
       AND    #$04                    ;2
       BEQ    LFCFD                   ;2
       LDA    $CF                     ;3
       CMP    #$11                    ;2
       BEQ    LFCFD                   ;2
       CMP    #$21                    ;2
       BEQ    LFCFD                   ;2
       LDY    #$01                    ;2
       JSR    LFE22                   ;6
LFCFD:
       LDA    $CA                     ;3
       AND    #$01                    ;2
       BEQ    LFD0B                   ;2
       LDA    $DC                     ;3
       CMP    #$07                    ;2
       BCC    LFD0B                   ;2
       DEC    $DC                     ;5
LFD0B:
       LDA    $CA                     ;3
       AND    #$08                    ;2
       BEQ    LFD20                   ;2
       LDA    $CF                     ;3
       CMP    #$AA                    ;2
       BEQ    LFD20                   ;2
       CMP    #$9A                    ;2
       BEQ    LFD20                   ;2
       LDY    #$01                    ;2
       JSR    LFE45                   ;6
LFD20:
       LDA    $CA                     ;3
       AND    #$02                    ;2
       BEQ    LFD2E                   ;2
       LDA    $DC                     ;3
       CMP    #$8A                    ;2
       BCS    LFD2E                   ;2
       INC    $DC                     ;5
LFD2E:
       LDA    $F8                     ;3
       AND    #$C0                    ;2
       BNE    LFD4B                   ;2
       LDA    $F7                     ;3
       BNE    LFD3C                   ;2
       LDA    $CA                     ;3
       BNE    LFD47                   ;2
LFD3C:
       LDA    $C6                     ;3
       LSR                            ;2
       BCC    LFD45                   ;2
       LDA    INPT5                   ;3
       BCS    LFD47                   ;2
LFD45:
       LDA    INPT4                   ;3
LFD47:
       CMP    $CD                     ;3
       BPL    LFD4E                   ;2
LFD4B:
       JMP    LF96E                   ;3
LFD4E:
       LDA    SWCHB                   ;4
       BMI    LFD6D                   ;2
       LDA    $C8                     ;3
       BMI    LFD67                   ;2
       AND    #$10                    ;2
       BNE    LFD61                   ;2
       LDA    $CA                     ;3
       ORA    #$01                    ;2
       BNE    LFD6B                   ;2
LFD61:
       LDA    $CA                     ;3
       ORA    #$02                    ;2
       BNE    LFD6B                   ;2
LFD67:
       LDA    $CA                     ;3
       ORA    #$08                    ;2
LFD6B:
       STA    $CA                     ;3
LFD6D:
       LDA    $CA                     ;3
       AND    #$04                    ;2
       BEQ    LFD84                   ;2
       LDA    $E3                     ;3
       BNE    LFD84                   ;2
       LDA    $CF                     ;3
       STA    $D6                     ;3
       LDA    $DC                     ;3
       CLC                            ;2
       ADC    #$04                    ;2
       ORA    #$01                    ;2
       STA    $E3                     ;3
LFD84:
       LDA    $CA                     ;3
       AND    #$08                    ;2
       BEQ    LFD9B                   ;2
       LDA    $E4                     ;3
       BNE    LFD9B                   ;2
       LDA    $CF                     ;3
       STA    $D7                     ;3
       LDA    $DC                     ;3
       CLC                            ;2
       ADC    #$04                    ;2
       ORA    #$01                    ;2
       STA    $E4                     ;3
LFD9B:
       LDA    $CA                     ;3
       AND    #$02                    ;2
       BEQ    LFDB9                   ;2
       LDA    $E5                     ;3
       BNE    LFDB9                   ;2
       LDA    $CF                     ;3
       STA    $D8                     ;3
       LDX    #$09                    ;2
       LDY    #$04                    ;2
       JSR    LFE45                   ;6
       LDA    $DC                     ;3
       SEC                            ;2
       SBC    #$04                    ;2
       ORA    #$01                    ;2
       STA    $E5                     ;3
LFDB9:
       LDA    $CA                     ;3
       AND    #$01                    ;2
       BEQ    LFDD7                   ;2
       LDA    $E6                     ;3
       BNE    LFDD7                   ;2
       LDA    $CF                     ;3
       STA    $D9                     ;3
       LDX    #$0A                    ;2
       LDY    #$04                    ;2
       JSR    LFE45                   ;6
       LDA    $DC                     ;3
       CLC                            ;2
       ADC    #$04                    ;2
       ORA    #$01                    ;2
       STA    $E6                     ;3
LFDD7:
       JMP    LF96E                   ;3
LFDDA:
       LDX    #$07                    ;2
       LDA    $E3                     ;3
       BEQ    LFDED                   ;2
       LDY    #$04                    ;2
       JSR    LFE22                   ;6
       CMP    #$4B                    ;2
       BNE    LFDED                   ;2
       LDA    #$00                    ;2
       STA    $E3                     ;3
LFDED:
       INX                            ;2
       LDA    $E4                     ;3
       BEQ    LFDFF                   ;2
       LDY    #$04                    ;2
       JSR    LFE45                   ;6
       CMP    #$61                    ;2
       BNE    LFDFF                   ;2
       LDA    #$00                    ;2
       STA    $E4                     ;3
LFDFF:
       INX                            ;2
       LDA    $E5                     ;3
       BEQ    LFE0F                   ;2
       CLC                            ;2
       ADC    #$04                    ;2
       CMP    #$90                    ;2
       BCC    LFE0D                   ;2
       LDA    #$00                    ;2
LFE0D:
       STA    $E5                     ;3
LFE0F:
       INX                            ;2
       LDA    $E6                     ;3
       BEQ    LFE1F                   ;2
       SEC                            ;2
       SBC    #$04                    ;2
       CMP    #$04                    ;2
       BCS    LFE1D                   ;2
       LDA    #$00                    ;2
LFE1D:
       STA    $E6                     ;3
LFE1F:
       JMP    LF118                   ;3
LFE22:
       TYA                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ADC    $CF,X                   ;4
       BPL    LFE32                   ;2
       CMP    LFE3C,Y                 ;4
       BCS    LFE32                   ;2
       SBC    #$F0                    ;2
LFE32:
       STA    $CF,X                   ;4
       AND    #$0F                    ;2
       BNE    LFE3C                   ;2
       LDA    #$4B                    ;2
       STA    $CF,X                   ;4
LFE3C:
       RTS                            ;6

       .byte $8F ; |X   XXXX| $FE3D
       .byte $9F ; |X  XXXXX| $FE3E
       .byte $AF ; |X X XXXX| $FE3F
       .byte $BF ; |X XXXXXX| $FE40
       .byte $CF ; |XX  XXXX| $FE41
       .byte $DF ; |XX XXXXX| $FE42
       .byte $EF ; |XXX XXXX| $FE43
       .byte $FF ; |XXXXXXXX| $FE44
LFE45:
       TYA                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       STA    $CB                     ;3
       LDA    $CF,X                   ;4
       SEC                            ;2
       SBC    $CB                     ;3
       CMP    #$90                    ;2
       BCS    LFE5C                   ;2
       CMP    LFE72,Y                 ;4
       BCC    LFE5C                   ;2
       SBC    #$0F                    ;2
LFE5C:
       STA    $CF,X                   ;4
       AND    #$0F                    ;2
       CMP    #$0B                    ;2
       BNE    LFE72                   ;2
       LDA    $CF,X                   ;4
       CMP    #$40                    ;2
       BCC    LFE6E                   ;2
       CMP    #$80                    ;2
       BCC    LFE72                   ;2
LFE6E:
       LDA    #$61                    ;2
       STA    $CF,X                   ;4
LFE72:
       RTS                            ;6

       .byte $80 ; |X       | $FE73
       .byte $70 ; | XXX    | $FE74
       .byte $60 ; | XX     | $FE75
       .byte $50 ; | X X    | $FE76
       .byte $40 ; | X      | $FE77
       .byte $30 ; |  XX    | $FE78
       .byte $20 ; |  X     | $FE79
       .byte $10 ; |   X    | $FE7A
LFE7B:
       .byte $A5 ; |X X  X X| $FE7B
       .byte $B5 ; |X XX X X| $FE7C
       .byte $10 ; |   X    | $FE7D
       .byte $17 ; |   X XXX| $FE7E
       LDX    #$05                    ;2
LFE81:
       LDA    $AF,X                   ;4
       AND    #$03                    ;2
       BNE    LFE96                   ;2
       DEX                            ;2
       BPL    LFE81                   ;2
       LDA    $C9                     ;3
       BEQ    LFE90                   ;2
       BPL    LFE96                   ;2
LFE90:
       LDA    $88                     ;3
       AND    #$07                    ;2
       BEQ    LFEBC                   ;2
LFE96:
       LDA    #$00                    ;2
LFE98:
       JMP    LF121                   ;3
LFE9B:
       .byte $10 ; |   X    | $FE9B
       .byte $18 ; |   XX   | $FE9C
       .byte $23 ; |  X   XX| $FE9D
       .byte $28 ; |  X X   | $FE9E
       .byte $10 ; |   X    | $FE9F
       .byte $23 ; |  X   XX| $FEA0
       .byte $1E ; |   XXXX | $FEA1
       .byte $14 ; |   X X  | $FEA2
       .byte $0F ; |    XXXX| $FEA3
       .byte $1E ; |   XXXX | $FEA4
       .byte $63 ; | XX   XX| $FEA5
       .byte $10 ; |   X    | $FEA6
       .byte $18 ; |   XX   | $FEA7
       .byte $1E ; |   XXXX | $FEA8
       .byte $28 ; |  X X   | $FEA9
       .byte $10 ; |   X    | $FEAA
       .byte $10 ; |   X    | $FEAB
       .byte $23 ; |  X   XX| $FEAC
       .byte $23 ; |  X   XX| $FEAD
       .byte $0F ; |    XXXX| $FEAE
       .byte $1E ; |   XXXX | $FEAF
       .byte $63 ; | XX   XX| $FEB0
       .byte $10 ; |   X    | $FEB1
       .byte $18 ; |   XX   | $FEB2
       .byte $23 ; |  X   XX| $FEB3
       .byte $28 ; |  X X   | $FEB4
       .byte $10 ; |   X    | $FEB5
       .byte $23 ; |  X   XX| $FEB6
       .byte $1E ; |   XXXX | $FEB7
       .byte $14 ; |   X X  | $FEB8
       .byte $0F ; |    XXXX| $FEB9
       .byte $1E ; |   XXXX | $FEBA
       .byte $63 ; | XX   XX| $FEBB
LFEBC:
       .byte $A5 ; |X X  X X| $FEBC
       .byte $AF ; |X X XXXX| $FEBD
       STA    $CA                     ;3
       LDX    $F7                     ;3
       BNE    LFECE                   ;2
       LDA    $C8                     ;3
       CMP    #$46                    ;2
       BNE    LFECE                   ;2
       LDA    #$FF                    ;2
       STA    $C7                     ;3
LFECE:
       LDX    #$05                    ;2
       LDA    #$00                    ;2
       STA    $C9                     ;3
LFED4:
       STA    $E3,X                   ;4
       STA    $AF,X                   ;4
       LDY    LF6D0,X                 ;4
       INY                            ;2
       STY    $DD,X                   ;4
       DEX                            ;2
       BPL    LFED4                   ;2
       LDA    $C8                     ;3
       CMP    #$80                    ;2
       BNE    LFEEB                   ;2
       LDA    $CA                     ;3
       STA    $AF                     ;3
LFEEB:
       INC    $C7                     ;5
       LDX    $C7                     ;3
       CPX    #$21                    ;2
       BNE    LFEF7                   ;2
       LDX    #$0B                    ;2
       STX    $C7                     ;3
LFEF7:
       LDA    LFE9B,X                 ;4
       STA    $B5                     ;3
       LDA    #$FF                    ;2
       BNE    LFE98                   ;2
LFF00:
       LDA    $C9                     ;3
       BPL    LFF70                   ;2
       LDA    $C8                     ;3
       CMP    #$69                    ;2
       BEQ    LFF70                   ;2
       LDA    #$03                    ;2
       LDY    $C7                     ;3
       CPY    #$0A                    ;2
       BCS    LFF14                   ;2
       SEC                            ;2
       ROL                            ;2
LFF14:
       STA    $FB                     ;3
       AND    $96                     ;3
       BNE    LFF70                   ;2
       LDX    $C8                     ;3
       BMI    LFF2D                   ;2
       TXA                            ;2
       LDX    #$48                    ;2
       AND    #$10                    ;2
       BEQ    LFF66                   ;2
       DEC    $88                     ;5
       BPL    LFF70                   ;2
       LDA    #$47                    ;2
       BNE    LFF6E                   ;2
LFF2D:
       LDX    #$19                    ;2
LFF2F:
       LDA    LFF73,X                 ;4
       BNE    LFF36                   ;2
       LDX    #$07                    ;2
LFF36:
       TXA                            ;2
       LSR                            ;2
       TAY                            ;2
       LDA.wy $80,Y                   ;4
       AND    #$10                    ;2
       BNE    LFF41                   ;2
       CLC                            ;2
LFF41:
       ROR    $A7,X                   ;6
       ROL    $8D,X                   ;6
       LDA.wy $80,Y                   ;4
       AND    #$E1                    ;2
       ROR                            ;2
       STA    $CA                     ;3
       DEX                            ;2
       ROR    $A7,X                   ;6
       ROL    $8D,X                   ;6
       LDA.wy $80,Y                   ;4
       AND    #$0E                    ;2
       BCC    LFF5B                   ;2
       ORA    #$10                    ;2
LFF5B:
       LSR                            ;2
       ORA    $CA                     ;3
       STA.wy $80,Y                   ;5
       DEX                            ;2
       BPL    LFF2F                   ;2
       LDX    #$50                    ;2
LFF66:
       INC    $88                     ;5
       CPX    $88                     ;3
       BNE    LFF70                   ;2
       LDA    #$00                    ;2
LFF6E:
       STA    $88                     ;3
LFF70:
       JMP    LF11E                   ;3
LFF73:
       .byte $FF ; |XXXXXXXX| $FF73
       .byte $FF ; |XXXXXXXX| $FF74
       .byte $FF ; |XXXXXXXX| $FF75
       .byte $FF ; |XXXXXXXX| $FF76
       .byte $FF ; |XXXXXXXX| $FF77
       .byte $FF ; |XXXXXXXX| $FF78
       .byte $FF ; |XXXXXXXX| $FF79
       .byte $FF ; |XXXXXXXX| $FF7A
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
       .byte $FF ; |XXXXXXXX| $FF85
       .byte $FF ; |XXXXXXXX| $FF86
       .byte $FF ; |XXXXXXXX| $FF87
       .byte $FF ; |XXXXXXXX| $FF88
       .byte $FF ; |XXXXXXXX| $FF89
       .byte $FF ; |XXXXXXXX| $FF8A
       .byte $FF ; |XXXXXXXX| $FF8B
       .byte $FF ; |XXXXXXXX| $FF8C
LFF8D:
       .byte $46 ; | X   XX | $FF8D
       .byte $C4 ; |XX   X  | $FF8E
       .byte $44 ; | X   X  | $FF8F
       .byte $43 ; | X    XX| $FF90
       .byte $C2 ; |XX    X | $FF91
       .byte $C2 ; |XX    X | $FF92
       .byte $C2 ; |XX    X | $FF93
       .byte $C2 ; |XX    X | $FF94
       .byte $C2 ; |XX    X | $FF95
       .byte $43 ; | X    XX| $FF96
       .byte $43 ; | X    XX| $FF97
       .byte $E3 ; |XXX   XX| $FF98
       .byte $E3 ; |XXX   XX| $FF99
       .byte $44 ; | X   X  | $FF9A
       .byte $44 ; | X   X  | $FF9B
       .byte $44 ; | X   X  | $FF9C
       .byte $46 ; | X   XX | $FF9D
LFF9E:
       .byte $46 ; | X   XX | $FF9E
       .byte $C7 ; |XX   XXX| $FF9F
       .byte $48 ; | X  X   | $FFA0
       .byte $49 ; | X  X  X| $FFA1
       .byte $C9 ; |XX  X  X| $FFA2
       .byte $C9 ; |XX  X  X| $FFA3
       .byte $C9 ; |XX  X  X| $FFA4
       .byte $C9 ; |XX  X  X| $FFA5
       .byte $C9 ; |XX  X  X| $FFA6
       .byte $49 ; | X  X  X| $FFA7
       .byte $49 ; | X  X  X| $FFA8
       .byte $98 ; |X  XX   | $FFA9
       .byte $98 ; |X  XX   | $FFAA
       .byte $48 ; | X  X   | $FFAB
       .byte $48 ; | X  X   | $FFAC
       .byte $48 ; | X  X   | $FFAD
       .byte $46 ; | X   XX | $FFAE
       .byte $46 ; | X   XX | $FFAF
LFFB0:
       .byte $0A ; |    X X | $FFB0
       .byte $0A ; |    X X | $FFB1
       .byte $06 ; |     XX | $FFB2
       .byte $08 ; |    X   | $FFB3
       .byte $08 ; |    X   | $FFB4
       .byte $0C ; |    XX  | $FFB5
       .byte $0C ; |    XX  | $FFB6
       .byte $0C ; |    XX  | $FFB7
       .byte $0A ; |    X X | $FFB8
       .byte $08 ; |    X   | $FFB9
LFFBA:
       .byte $10 ; |   X    | $FFBA
       .byte $70 ; | XXX    | $FFBB
       .byte $70 ; | XXX    | $FFBC
       .byte $50 ; | X X    | $FFBD
       .byte $80 ; |X       | $FFBE
       .byte $20 ; |  X     | $FFBF
       .byte $01 ; |       X| $FFC0
LFFC1:
       .byte $00 ; |        | $FFC1
       .byte $00 ; |        | $FFC2
       .byte $00 ; |        | $FFC3
       .byte $00 ; |        | $FFC4
       .byte $00 ; |        | $FFC5
       .byte $01 ; |       X| $FFC6
       .byte $00 ; |        | $FFC7
       .byte $01 ; |       X| $FFC8
       .byte $01 ; |       X| $FFC9
LFFCA:
       .byte $00 ; |        | $FFCA
       .byte $00 ; |        | $FFCB
       .byte $00 ; |        | $FFCC
       .byte $01 ; |       X| $FFCD
       .byte $01 ; |       X| $FFCE
       .byte $01 ; |       X| $FFCF
       .byte $02 ; |      X | $FFD0
       .byte $02 ; |      X | $FFD1
       .byte $02 ; |      X | $FFD2
       .byte $03 ; |      XX| $FFD3
       .byte $03 ; |      XX| $FFD4
       .byte $03 ; |      XX| $FFD5
       .byte $04 ; |     X  | $FFD6
       .byte $04 ; |     X  | $FFD7
       .byte $04 ; |     X  | $FFD8
       .byte $05 ; |     X X| $FFD9
       .byte $05 ; |     X X| $FFDA
       .byte $05 ; |     X X| $FFDB
       .byte $06 ; |     XX | $FFDC
       .byte $06 ; |     XX | $FFDD
       .byte $06 ; |     XX | $FFDE
       .byte $07 ; |     XXX| $FFDF
       .byte $07 ; |     XXX| $FFE0
       .byte $07 ; |     XXX| $FFE1
       .byte $08 ; |    X   | $FFE2
       .byte $08 ; |    X   | $FFE3
       .byte $08 ; |    X   | $FFE4
       .byte $09 ; |    X  X| $FFE5
       .byte $09 ; |    X  X| $FFE6
       .byte $09 ; |    X  X| $FFE7
       .byte $0A ; |    X X | $FFE8
       .byte $0A ; |    X X | $FFE9
       .byte $0A ; |    X X | $FFEA
       .byte $0B ; |    X XX| $FFEB
       .byte $0B ; |    X XX| $FFEC
       .byte $0B ; |    X XX| $FFED
       .byte $0C ; |    XX  | $FFEE
       .byte $0C ; |    XX  | $FFEF
       .byte $0C ; |    XX  | $FFF0
       .byte $00 ; |        | $FFF1
LFFF2:
       STA    $FFF8                   ;4
       JMP    LF124                   ;3

       ORG $2FF8
       RORG $FFF8

       .byte $4A ; | X  X X | $FFF8
       .byte $FF ; |XXXXXXXX| $FFF9
       .byte $C7 ; |XX   XXX| $FFFA
       .byte $91 ; |X  X   X| $FFFB

       .word START2,$70D3
