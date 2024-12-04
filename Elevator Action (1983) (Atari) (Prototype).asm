;BANK1
; Disassembly of ea.001
; Disassembled Wed Feb 23 12:32:08 2005
; Using DiStella v2.0
;
; Command Line: C:\BIN\DISTELLA.EXE -pafscea1.cfg ea.001 
;
; ea1.cfg contents:
;
;      GFX D000 D0FF
;      CODE D100 D4BB
;      GFX D4BC DBB2
;      CODE DBB3 DC8E
;      GFX DC8F DCA6
;      CODE DCA7 DD14
;      GFX DD15 DD20
;      CODE DD21 DE7D
;      GFX DE7E DFE9
;      CODE DFEA DFF7
;      GFX DFF8 DFFF
;
;
;BANK2
; Disassembly of ea.002
; Disassembled Wed Feb 23 12:42:22 2005
; Using DiStella v2.0
;
; Command Line: C:\BIN\DISTELLA.EXE -pafscea2.cfg ea.002 
;
; ea2.cfg contents:
;
;      GFX F000 F0FF
;      CODE F100 FB20
;      GFX FB21 FCD4
;      CODE FCD5 FE2E
;      GFX FE2F FFE9
;      CODE FFEA FFF7
;      GFX FFF8 FFFF




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
SWCHA  = $0280 ;Port A data register for joysticks (High nybble:      player0,low nybble:      player1)
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

       .byte $00 ; |        | $D000
       .byte $00 ; |        | $D001
       .byte $00 ; |        | $D002
       .byte $00 ; |        | $D003
LD004:
       .byte $00 ; |        | $D004
       .byte $00 ; |        | $D005
       .byte $00 ; |        | $D006
       .byte $00 ; |        | $D007
       .byte $00 ; |        | $D008
       .byte $00 ; |        | $D009
LD00A:
       .byte $00 ; |        | $D00A
       .byte $00 ; |        | $D00B
       .byte $00 ; |        | $D00C
       .byte $00 ; |        | $D00D
       .byte $00 ; |        | $D00E
       .byte $00 ; |        | $D00F
       .byte $00 ; |        | $D010
LD011:
       .byte $00 ; |        | $D011
       .byte $00 ; |        | $D012
       .byte $00 ; |        | $D013
       .byte $00 ; |        | $D014
       .byte $00 ; |        | $D015
LD016:
       .byte $00 ; |        | $D016
       .byte $00 ; |        | $D017
       .byte $00 ; |        | $D018
LD019:
       .byte $00 ; |        | $D019
       .byte $00 ; |        | $D01A
       .byte $00 ; |        | $D01B
       .byte $00 ; |        | $D01C
       .byte $00 ; |        | $D01D
LD01E:
       .byte $00 ; |        | $D01E
       .byte $00 ; |        | $D01F
       .byte $00 ; |        | $D020
       .byte $00 ; |        | $D021
       .byte $00 ; |        | $D022
       .byte $00 ; |        | $D023
       .byte $00 ; |        | $D024
LD025:
       .byte $00 ; |        | $D025
       .byte $00 ; |        | $D026
       .byte $00 ; |        | $D027
       .byte $00 ; |        | $D028
       .byte $00 ; |        | $D029
LD02A:
       .byte $00 ; |        | $D02A
LD02B:
       .byte $00 ; |        | $D02B
       .byte $00 ; |        | $D02C
       .byte $00 ; |        | $D02D
       .byte $00 ; |        | $D02E
       .byte $00 ; |        | $D02F
       .byte $00 ; |        | $D030
LD031:
       .byte $00 ; |        | $D031
       .byte $00 ; |        | $D032
       .byte $00 ; |        | $D033
       .byte $00 ; |        | $D034
       .byte $00 ; |        | $D035
       .byte $00 ; |        | $D036
       .byte $00 ; |        | $D037
       .byte $00 ; |        | $D038
       .byte $00 ; |        | $D039
       .byte $00 ; |        | $D03A
       .byte $00 ; |        | $D03B
       .byte $00 ; |        | $D03C
       .byte $00 ; |        | $D03D
       .byte $00 ; |        | $D03E
       .byte $00 ; |        | $D03F
       .byte $00 ; |        | $D040
       .byte $00 ; |        | $D041
       .byte $00 ; |        | $D042
       .byte $00 ; |        | $D043
       .byte $00 ; |        | $D044
       .byte $00 ; |        | $D045
LD046:
       .byte $00 ; |        | $D046
       .byte $00 ; |        | $D047
       .byte $00 ; |        | $D048
       .byte $00 ; |        | $D049
       .byte $00 ; |        | $D04A
       .byte $00 ; |        | $D04B
       .byte $00 ; |        | $D04C
       .byte $00 ; |        | $D04D
LD04E:
       .byte $00 ; |        | $D04E
       .byte $00 ; |        | $D04F
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
LD05A:
       .byte $00 ; |        | $D05A
LD05B:
       .byte $00 ; |        | $D05B
LD05C:
       .byte $00 ; |        | $D05C
LD05D:
       .byte $00 ; |        | $D05D
LD05E:
       .byte $00 ; |        | $D05E
LD05F:
       .byte $00 ; |        | $D05F
       .byte $00 ; |        | $D060
       .byte $00 ; |        | $D061
LD062:
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
       .byte $00 ; |        | $D079
       .byte $00 ; |        | $D07A
       .byte $00 ; |        | $D07B
       .byte $00 ; |        | $D07C
       .byte $00 ; |        | $D07D
       .byte $00 ; |        | $D07E
       .byte $00 ; |        | $D07F
       .byte $00 ; |        | $D080
       .byte $00 ; |        | $D081
       .byte $00 ; |        | $D082
       .byte $00 ; |        | $D083
LD084:
       .byte $00 ; |        | $D084
LD085:
       .byte $00 ; |        | $D085
LD086:
       .byte $00 ; |        | $D086
LD087:
       .byte $00 ; |        | $D087
LD088:
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
       .byte $00 ; |        | $D092
       .byte $00 ; |        | $D093
       .byte $00 ; |        | $D094
       .byte $00 ; |        | $D095
LD096:
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
       .byte $00 ; |        | $D0A2
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
       .byte $00 ; |        | $D0B2
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
       .byte $00 ; |        | $D0C2
       .byte $00 ; |        | $D0C3
       .byte $00 ; |        | $D0C4
       .byte $00 ; |        | $D0C5
       .byte $00 ; |        | $D0C6
       .byte $00 ; |        | $D0C7
       .byte $00 ; |        | $D0C8
       .byte $00 ; |        | $D0C9
       .byte $00 ; |        | $D0CA
       .byte $00 ; |        | $D0CB
       .byte $00 ; |        | $D0CC
       .byte $00 ; |        | $D0CD
       .byte $00 ; |        | $D0CE
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
LD0DA:
       .byte $00 ; |        | $D0DA
       .byte $00 ; |        | $D0DB
LD0DC:
       .byte $00 ; |        | $D0DC
       .byte $00 ; |        | $D0DD
LD0DE:
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
       .byte $00 ; |        | $D0F9
       .byte $00 ; |        | $D0FA
       .byte $00 ; |        | $D0FB
       .byte $00 ; |        | $D0FC
       .byte $00 ; |        | $D0FD
       .byte $00 ; |        | $D0FE
       .byte $00 ; |        | $D0FF

START1:
       LDA    #$00                    ;2
       STA    $FB                     ;3
       LDA    #$F0                    ;2
       STA    $FC                     ;3
       JMP    LDFF2                   ;3
       LDA    $FA                     ;3
       BEQ    LD114                   ;2
       DEC    $FA                     ;5
       JMP    LDE03                   ;3
LD114:
       LDA    $F084                   ;4
       ROR                            ;2
       ROR                            ;2
       ROR                            ;2
       ROR                            ;2
       STA    REFP1                   ;3
       LDA    $C0                     ;3
       STA    COLUP1                  ;3
       LDA    $F5                     ;3
       STA    COLUBK                  ;3
       LDY    #$00                    ;2
       STY    HMP0                    ;3
       STA    WSYNC                   ;3
       STY    VBLANK                  ;3
       LDX    $F096                   ;4
       BPL    LD135                   ;2
       JMP    LD1CB                   ;3
LD135:
       BNE    LD13A                   ;2
       JMP    LD179                   ;3
LD13A:
       LDA    ($CF),Y                 ;5
       ORA    ($ED),Y                 ;5
       STA    WSYNC                   ;3
       STA    PF0                     ;3
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($D9),Y                 ;5
       STA    PF1                     ;3
       LDA    ($E3),Y                 ;5
       STA    PF2                     ;3
       ORA    ($EF),Y                 ;5
       STA    PF2                     ;3
       LDA    ($AC),Y                 ;5
       AND    ($B6),Y                 ;5
       STA    GRP1                    ;3
       INY                            ;2
       LDA    ($A3),Y                 ;5
       STA    WSYNC                   ;3
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($A7),Y                 ;5
       STA    COLUP0                  ;3
       LDA    ($F1),Y                 ;5
       STA    ENAM0                   ;3
       LDA    ($F3),Y                 ;5
       STA    ENAM1                   ;3
       LDA    ($AC),Y                 ;5
       AND    ($B6),Y                 ;5
       STA    GRP1                    ;3
       INY                            ;2
       DEX                            ;2
       BNE    LD13A                   ;2
LD179:
       LDA    ($CF),Y                 ;5
       ORA    ($ED),Y                 ;5
       STA    WSYNC                   ;3
       STA    PF0                     ;3
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($E3),Y                 ;5
       ORA    ($EF),Y                 ;5
       STA    PF2                     ;3
       LDX    $CB                     ;3
       LDA    LDA68,X                 ;4
       STA    HMP1                    ;3
       AND    #$0F                    ;2
       STA    $9C                     ;3
       INY                            ;2
       LDA    ($A7),Y                 ;5
       TAX                            ;2
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    WSYNC                   ;3
       STA    GRP0                    ;3
       STX    COLUP0                  ;3
       INY                            ;2
       LDX    $9C                     ;3
LD1A9:
       DEX                            ;2
       BPL    LD1A9                   ;2
       STA    RESP1                   ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDA    ($CF),Y                 ;5
       ORA    ($ED),Y                 ;5
       STA    PF0                     ;3
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    $C1                     ;3
       STA    COLUP1                  ;3
       LDA    ($E3),Y                 ;5
       ORA    ($EF),Y                 ;5
       STA    PF2                     ;3
       JMP    LD1EB                   ;3
LD1CB:
       LDA    ($CF),Y                 ;5
       ORA    ($ED),Y                 ;5
       STA    WSYNC                   ;3
       STA    PF0                     ;3
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($D9),Y                 ;5
       STA    PF1                     ;3
       LDA    ($E3),Y                 ;5
       STA    PF2                     ;3
       ORA    ($EF),Y                 ;5
       STA    PF2                     ;3
       LDA    ($AC),Y                 ;5
       AND    ($B6),Y                 ;5
       STA    GRP1                    ;3
LD1EB:
       INY                            ;2
       LDA    ($A3),Y                 ;5
       STA    WSYNC                   ;3
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($A7),Y                 ;5
       STA    COLUP0                  ;3
       LDA    ($F1),Y                 ;5
       STA    ENAM0                   ;3
       LDA    $F085                   ;4
       ROR                            ;2
       ROR                            ;2
       ROR                            ;2
       ROR                            ;2
       STA    REFP1                   ;3
       LDA    CXM0P                   ;3
       STA    $CA                     ;3
       INY                            ;2
       LDX    #$13                    ;2
       LDA    $F6                     ;3
       STA    COLUBK                  ;3
LD210:
       LDA    ($D1),Y                 ;5
       ORA    ($ED),Y                 ;5
       STA    WSYNC                   ;3
       STA    PF0                     ;3
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($DB),Y                 ;5
       STA    PF1                     ;3
       LDA    ($E5),Y                 ;5
       STA    PF2                     ;3
       ORA    ($EF),Y                 ;5
       STA    PF2                     ;3
       LDA    ($AE),Y                 ;5
       AND    ($B8),Y                 ;5
       STA    GRP1                    ;3
       INY                            ;2
       LDA    ($A3),Y                 ;5
       STA    WSYNC                   ;3
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($A7),Y                 ;5
       STA    COLUP0                  ;3
       LDA    ($F1),Y                 ;5
       STA    ENAM0                   ;3
       LDA    ($F3),Y                 ;5
       STA    ENAM1                   ;3
       LDA    ($AE),Y                 ;5
       AND    ($B8),Y                 ;5
       STA    GRP1                    ;3
       INY                            ;2
       DEX                            ;2
       BNE    LD210                   ;2
       LDA    ($D1),Y                 ;5
       ORA    ($ED),Y                 ;5
       STA    WSYNC                   ;3
       STA    PF0                     ;3
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($E5),Y                 ;5
       ORA    ($EF),Y                 ;5
       STA    PF2                     ;3
       LDX    $CC                     ;3
       LDA    LDA68,X                 ;4
       STA    HMP1                    ;3
       AND    #$0F                    ;2
       STA    $9C                     ;3
       INY                            ;2
       LDA    ($A7),Y                 ;5
       TAX                            ;2
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    WSYNC                   ;3
       STA    GRP0                    ;3
       STX    COLUP0                  ;3
       INY                            ;2
       LDX    $9C                     ;3
LD27F:
       DEX                            ;2
       BPL    LD27F                   ;2
       STA    RESP1                   ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDA    ($D1),Y                 ;5
       ORA    ($ED),Y                 ;5
       STA    PF0                     ;3
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    $C2                     ;3
       STA    COLUP1                  ;3
       LDA    ($E5),Y                 ;5
       ORA    ($EF),Y                 ;5
       STA    PF2                     ;3
       INY                            ;2
       LDA    ($A3),Y                 ;5
       STA    WSYNC                   ;3
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($A7),Y                 ;5
       STA    COLUP0                  ;3
       LDA    ($F1),Y                 ;5
       STA    ENAM0                   ;3
       LDA    $F086                   ;4
       ROR                            ;2
       ROR                            ;2
       ROR                            ;2
       ROR                            ;2
       STA    REFP1                   ;3
       LDA    CXM0P                   ;3
       STA    $CB                     ;3
       INY                            ;2
       LDX    #$13                    ;2
       LDA    $F7                     ;3
       STA    COLUBK                  ;3
LD2C3:
       LDA    ($D3),Y                 ;5
       ORA    ($ED),Y                 ;5
       STA    WSYNC                   ;3
       STA    PF0                     ;3
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($DD),Y                 ;5
       STA    PF1                     ;3
       LDA    ($E7),Y                 ;5
       STA    PF2                     ;3
       ORA    ($EF),Y                 ;5
       STA    PF2                     ;3
       LDA    ($B0),Y                 ;5
       AND    ($BA),Y                 ;5
       STA    GRP1                    ;3
       INY                            ;2
       LDA    ($A3),Y                 ;5
       STA    WSYNC                   ;3
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($A7),Y                 ;5
       STA    COLUP0                  ;3
       LDA    ($F1),Y                 ;5
       STA    ENAM0                   ;3
       LDA    ($F3),Y                 ;5
       STA    ENAM1                   ;3
       LDA    ($B0),Y                 ;5
       AND    ($BA),Y                 ;5
       STA    GRP1                    ;3
       INY                            ;2
       DEX                            ;2
       BNE    LD2C3                   ;2
       LDA    ($D3),Y                 ;5
       ORA    ($ED),Y                 ;5
       STA    WSYNC                   ;3
       STA    PF0                     ;3
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($E7),Y                 ;5
       ORA    ($EF),Y                 ;5
       STA    PF2                     ;3
       LDX    $CD                     ;3
       LDA    LDA68,X                 ;4
       STA    HMP1                    ;3
       AND    #$0F                    ;2
       STA    $9C                     ;3
       INY                            ;2
       LDA    ($A7),Y                 ;5
       TAX                            ;2
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    WSYNC                   ;3
       STA    GRP0                    ;3
       STX    COLUP0                  ;3
       INY                            ;2
       LDX    $9C                     ;3
LD332:
       DEX                            ;2
       BPL    LD332                   ;2
       STA    RESP1                   ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDA    ($D3),Y                 ;5
       ORA    ($ED),Y                 ;5
       STA    PF0                     ;3
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    $C3                     ;3
       STA    COLUP1                  ;3
       LDA    ($E7),Y                 ;5
       ORA    ($EF),Y                 ;5
       STA    PF2                     ;3
       INY                            ;2
       LDA    ($A3),Y                 ;5
       STA    WSYNC                   ;3
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($A7),Y                 ;5
       STA    COLUP0                  ;3
       LDA    ($F1),Y                 ;5
       STA    ENAM0                   ;3
       LDA    $F087                   ;4
       ROR                            ;2
       ROR                            ;2
       ROR                            ;2
       ROR                            ;2
       STA    REFP1                   ;3
       LDA    CXM0P                   ;3
       STA    $CC                     ;3
       INY                            ;2
       LDX    #$13                    ;2
       LDA    $F8                     ;3
       STA    COLUBK                  ;3
LD376:
       LDA    ($D5),Y                 ;5
       ORA    ($ED),Y                 ;5
       STA    WSYNC                   ;3
       STA    PF0                     ;3
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($DF),Y                 ;5
       STA    PF1                     ;3
       LDA    ($E9),Y                 ;5
       STA    PF2                     ;3
       ORA    ($EF),Y                 ;5
       STA    PF2                     ;3
       LDA    ($B2),Y                 ;5
       AND    ($BC),Y                 ;5
       STA    GRP1                    ;3
       INY                            ;2
       LDA    ($A3),Y                 ;5
       STA    WSYNC                   ;3
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($A7),Y                 ;5
       STA    COLUP0                  ;3
       LDA    ($F1),Y                 ;5
       STA    ENAM0                   ;3
       LDA    ($F3),Y                 ;5
       STA    ENAM1                   ;3
       LDA    ($B2),Y                 ;5
       AND    ($BC),Y                 ;5
       STA    GRP1                    ;3
       INY                            ;2
       DEX                            ;2
       BNE    LD376                   ;2
       LDA    ($D5),Y                 ;5
       ORA    ($ED),Y                 ;5
       STA    WSYNC                   ;3
       STA    PF0                     ;3
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($E9),Y                 ;5
       ORA    ($EF),Y                 ;5
       STA    PF2                     ;3
       LDX    $CE                     ;3
       LDA    LDA68,X                 ;4
       STA    HMP1                    ;3
       AND    #$0F                    ;2
       STA    $9C                     ;3
       INY                            ;2
       LDA    ($A7),Y                 ;5
       TAX                            ;2
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    WSYNC                   ;3
       STA    GRP0                    ;3
       STX    COLUP0                  ;3
       INY                            ;2
       LDX    $9C                     ;3
LD3E5:
       DEX                            ;2
       BPL    LD3E5                   ;2
       STA    RESP1                   ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDA    ($D5),Y                 ;5
       ORA    ($ED),Y                 ;5
       STA    PF0                     ;3
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    $C4                     ;3
       STA    COLUP1                  ;3
       LDA    ($E9),Y                 ;5
       ORA    ($EF),Y                 ;5
       STA    PF2                     ;3
       INY                            ;2
       LDA    ($A3),Y                 ;5
       STA    WSYNC                   ;3
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($A7),Y                 ;5
       STA    COLUP0                  ;3
       LDA    $F088                   ;4
       ROR                            ;2
       ROR                            ;2
       ROR                            ;2
       ROR                            ;2
       STA    REFP1                   ;3
       LDA    CXM0P                   ;3
       STA    $CD                     ;3
       INY                            ;2
       CPY    #$A8                    ;2
       BCS    LD467                   ;2
       LDA    $F9                     ;3
       STA    COLUBK                  ;3
LD427:
       LDA    ($D7),Y                 ;5
       ORA    ($ED),Y                 ;5
       STA    WSYNC                   ;3
       STA    PF0                     ;3
       LDA    ($A3),Y                 ;5
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($E1),Y                 ;5
       STA    PF1                     ;3
       LDA    ($EB),Y                 ;5
       STA    PF2                     ;3
       ORA    ($EF),Y                 ;5
       STA    PF2                     ;3
       LDA    ($B4),Y                 ;5
       AND    ($BE),Y                 ;5
       STA    GRP1                    ;3
       INY                            ;2
       LDA    ($A3),Y                 ;5
       STA    WSYNC                   ;3
       AND    ($A5),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($A7),Y                 ;5
       STA    COLUP0                  ;3
       LDA    ($F1),Y                 ;5
       STA    ENAM0                   ;3
       LDA    ($F3),Y                 ;5
       STA    ENAM1                   ;3
       LDA    ($B4),Y                 ;5
       AND    ($BE),Y                 ;5
       STA    GRP1                    ;3
       INY                            ;2
       CPY    #$A8                    ;2
       BCC    LD427                   ;2
LD467:
       LDY    $82                     ;3
       LDA    #$00                    ;2
       LDX    LD4BC,Y                 ;4
       STA    VDELP1                  ;3
       STA    WSYNC                   ;3
       STX    COLUBK                  ;3
       STA    PF0                     ;3
       STA    GRP1                    ;3
       STA    PF1                     ;3
       STA    PF2                     ;3
       LDA    #$0C                    ;2
       STA    COLUP0                  ;3
       STA    COLUP1                  ;3
       JSR    LDD7D                   ;6
       LDY    #$06                    ;2
       JSR    LDD48                   ;6
       LDX    #$7E                    ;2
       STX    $8F                     ;3
       STX    $91                     ;3
       STX    $97                     ;3
       STX    $99                     ;3
       LDX    $82                     ;3
       LDA    $A1,X                   ;4
       AND    #$F0                    ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       TAY                            ;2
       LDA    LDFAF,Y                 ;4
       STA    $93                     ;3
       LDA    $A1,X                   ;4
       AND    #$0F                    ;2
       TAX                            ;2
       LDA    LDFAF,X                 ;4
       STA    $95                     ;3
       LDA    #$3C                    ;2
       STA    COLUP0                  ;3
       STA    COLUP1                  ;3
       LDY    #$06                    ;2
       JSR    LDD48                   ;6
       JMP    LDE03                   ;3

LD4BC:
       .byte $34 ; |  XX X  | $D4BC
       .byte $78 ; | XXXX   | $D4BD
       .byte $00 ; |        | $D4BE
       .byte $00 ; |        | $D4BF
       .byte $00 ; |        | $D4C0
       .byte $00 ; |        | $D4C1
       .byte $00 ; |        | $D4C2
       .byte $00 ; |        | $D4C3
       .byte $00 ; |        | $D4C4
       .byte $00 ; |        | $D4C5
       .byte $00 ; |        | $D4C6
       .byte $00 ; |        | $D4C7
       .byte $00 ; |        | $D4C8
       .byte $00 ; |        | $D4C9
       .byte $00 ; |        | $D4CA
       .byte $00 ; |        | $D4CB
       .byte $00 ; |        | $D4CC
       .byte $00 ; |        | $D4CD
       .byte $00 ; |        | $D4CE
       .byte $00 ; |        | $D4CF
       .byte $00 ; |        | $D4D0
       .byte $00 ; |        | $D4D1
       .byte $00 ; |        | $D4D2
       .byte $00 ; |        | $D4D3
       .byte $00 ; |        | $D4D4
       .byte $00 ; |        | $D4D5
       .byte $00 ; |        | $D4D6
       .byte $00 ; |        | $D4D7
       .byte $00 ; |        | $D4D8
       .byte $00 ; |        | $D4D9
       .byte $00 ; |        | $D4DA
       .byte $00 ; |        | $D4DB
       .byte $00 ; |        | $D4DC
       .byte $00 ; |        | $D4DD
       .byte $00 ; |        | $D4DE
       .byte $00 ; |        | $D4DF
       .byte $00 ; |        | $D4E0
       .byte $00 ; |        | $D4E1
       .byte $FF ; |XXXXXXXX| $D4E2
       .byte $3F ; |  XXXXXX| $D4E3
       .byte $FF ; |XXXXXXXX| $D4E4
       .byte $3F ; |  XXXXXX| $D4E5
       .byte $FF ; |XXXXXXXX| $D4E6
       .byte $3F ; |  XXXXXX| $D4E7
       .byte $00 ; |        | $D4E8
       .byte $10 ; |   X    | $D4E9
       .byte $00 ; |        | $D4EA
       .byte $00 ; |        | $D4EB
       .byte $00 ; |        | $D4EC
       .byte $00 ; |        | $D4ED
       .byte $0E ; |    XXX | $D4EE
       .byte $0E ; |    XXX | $D4EF
       .byte $0E ; |    XXX | $D4F0
       .byte $0E ; |    XXX | $D4F1
       .byte $0E ; |    XXX | $D4F2
       .byte $0E ; |    XXX | $D4F3
       .byte $0E ; |    XXX | $D4F4
       .byte $0E ; |    XXX | $D4F5
       .byte $0E ; |    XXX | $D4F6
       .byte $0E ; |    XXX | $D4F7
       .byte $0E ; |    XXX | $D4F8
       .byte $0E ; |    XXX | $D4F9
       .byte $0E ; |    XXX | $D4FA
       .byte $0E ; |    XXX | $D4FB
       .byte $0E ; |    XXX | $D4FC
       .byte $0E ; |    XXX | $D4FD
       .byte $0E ; |    XXX | $D4FE
       .byte $0E ; |    XXX | $D4FF
       .byte $0E ; |    XXX | $D500
       .byte $0E ; |    XXX | $D501
       .byte $0E ; |    XXX | $D502
       .byte $0E ; |    XXX | $D503
       .byte $0E ; |    XXX | $D504
       .byte $0E ; |    XXX | $D505
       .byte $0E ; |    XXX | $D506
       .byte $0E ; |    XXX | $D507
       .byte $0E ; |    XXX | $D508
       .byte $0E ; |    XXX | $D509
       .byte $00 ; |        | $D50A
       .byte $00 ; |        | $D50B
       .byte $FF ; |XXXXXXXX| $D50C
       .byte $3F ; |  XXXXXX| $D50D
       .byte $FF ; |XXXXXXXX| $D50E
       .byte $3F ; |  XXXXXX| $D50F
       .byte $FF ; |XXXXXXXX| $D510
       .byte $3F ; |  XXXXXX| $D511
       .byte $00 ; |        | $D512
       .byte $10 ; |   X    | $D513
       .byte $00 ; |        | $D514
       .byte $00 ; |        | $D515
       .byte $00 ; |        | $D516
       .byte $00 ; |        | $D517
       .byte $0E ; |    XXX | $D518
       .byte $0E ; |    XXX | $D519
       .byte $0E ; |    XXX | $D51A
       .byte $0E ; |    XXX | $D51B
       .byte $0E ; |    XXX | $D51C
       .byte $0E ; |    XXX | $D51D
       .byte $0E ; |    XXX | $D51E
       .byte $0E ; |    XXX | $D51F
       .byte $0E ; |    XXX | $D520
       .byte $0E ; |    XXX | $D521
       .byte $0E ; |    XXX | $D522
       .byte $0E ; |    XXX | $D523
       .byte $8E ; |X   XXX | $D524
       .byte $0E ; |    XXX | $D525
       .byte $8E ; |X   XXX | $D526
       .byte $0E ; |    XXX | $D527
       .byte $8E ; |X   XXX | $D528
       .byte $0E ; |    XXX | $D529
       .byte $CE ; |XX  XXX | $D52A
       .byte $0E ; |    XXX | $D52B
       .byte $CE ; |XX  XXX | $D52C
       .byte $0E ; |    XXX | $D52D
       .byte $CE ; |XX  XXX | $D52E
       .byte $0E ; |    XXX | $D52F
       .byte $EE ; |XXX XXX | $D530
       .byte $0E ; |    XXX | $D531
       .byte $EE ; |XXX XXX | $D532
       .byte $0E ; |    XXX | $D533
       .byte $E0 ; |XXX     | $D534
       .byte $00 ; |        | $D535
       .byte $FF ; |XXXXXXXX| $D536
       .byte $FF ; |XXXXXXXX| $D537
       .byte $FF ; |XXXXXXXX| $D538
       .byte $FF ; |XXXXXXXX| $D539
       .byte $FF ; |XXXXXXXX| $D53A
       .byte $FF ; |XXXXXXXX| $D53B
       .byte $00 ; |        | $D53C
       .byte $90 ; |X  X    | $D53D
       .byte $00 ; |        | $D53E
       .byte $80 ; |X       | $D53F
       .byte $00 ; |        | $D540
       .byte $80 ; |X       | $D541
       .byte $0E ; |    XXX | $D542
       .byte $8E ; |X   XXX | $D543
       .byte $0E ; |    XXX | $D544
       .byte $8E ; |X   XXX | $D545
       .byte $0E ; |    XXX | $D546
       .byte $8E ; |X   XXX | $D547
       .byte $0E ; |    XXX | $D548
       .byte $8E ; |X   XXX | $D549
       .byte $0E ; |    XXX | $D54A
       .byte $8E ; |X   XXX | $D54B
       .byte $0E ; |    XXX | $D54C
       .byte $8E ; |X   XXX | $D54D
       .byte $8E ; |X   XXX | $D54E
       .byte $8E ; |X   XXX | $D54F
       .byte $8E ; |X   XXX | $D550
       .byte $8E ; |X   XXX | $D551
       .byte $8E ; |X   XXX | $D552
       .byte $8E ; |X   XXX | $D553
       .byte $CE ; |XX  XXX | $D554
       .byte $8E ; |X   XXX | $D555
       .byte $CE ; |XX  XXX | $D556
       .byte $8E ; |X   XXX | $D557
       .byte $CE ; |XX  XXX | $D558
       .byte $8E ; |X   XXX | $D559
       .byte $EE ; |XXX XXX | $D55A
       .byte $8E ; |X   XXX | $D55B
       .byte $EE ; |XXX XXX | $D55C
       .byte $8E ; |X   XXX | $D55D
       .byte $E0 ; |XXX     | $D55E
       .byte $80 ; |X       | $D55F
       .byte $FF ; |XXXXXXXX| $D560
       .byte $FF ; |XXXXXXXX| $D561
       .byte $FF ; |XXXXXXXX| $D562
       .byte $FF ; |XXXXXXXX| $D563
       .byte $FF ; |XXXXXXXX| $D564
       .byte $FF ; |XXXXXXXX| $D565
       .byte $00 ; |        | $D566
       .byte $10 ; |   X    | $D567
       .byte $00 ; |        | $D568
       .byte $00 ; |        | $D569
       .byte $00 ; |        | $D56A
       .byte $00 ; |        | $D56B
       .byte $0E ; |    XXX | $D56C
       .byte $0E ; |    XXX | $D56D
       .byte $0E ; |    XXX | $D56E
       .byte $0E ; |    XXX | $D56F
       .byte $0E ; |    XXX | $D570
       .byte $0E ; |    XXX | $D571
       .byte $0E ; |    XXX | $D572
       .byte $0E ; |    XXX | $D573
       .byte $0E ; |    XXX | $D574
       .byte $0E ; |    XXX | $D575
       .byte $0E ; |    XXX | $D576
       .byte $0E ; |    XXX | $D577
       .byte $8E ; |X   XXX | $D578
       .byte $0E ; |    XXX | $D579
       .byte $8E ; |X   XXX | $D57A
       .byte $0E ; |    XXX | $D57B
       .byte $8E ; |X   XXX | $D57C
       .byte $0E ; |    XXX | $D57D
       .byte $CE ; |XX  XXX | $D57E
       .byte $0E ; |    XXX | $D57F
       .byte $CE ; |XX  XXX | $D580
       .byte $0E ; |    XXX | $D581
       .byte $CE ; |XX  XXX | $D582
       .byte $0E ; |    XXX | $D583
       .byte $EE ; |XXX XXX | $D584
       .byte $0E ; |    XXX | $D585
       .byte $EE ; |XXX XXX | $D586
       .byte $0E ; |    XXX | $D587
       .byte $E0 ; |XXX     | $D588
       .byte $00 ; |        | $D589
       .byte $FF ; |XXXXXXXX| $D58A
       .byte $3F ; |  XXXXXX| $D58B
       .byte $FF ; |XXXXXXXX| $D58C
       .byte $3F ; |  XXXXXX| $D58D
       .byte $FF ; |XXXXXXXX| $D58E
       .byte $3F ; |  XXXXXX| $D58F
       .byte $00 ; |        | $D590
       .byte $10 ; |   X    | $D591
       .byte $00 ; |        | $D592
       .byte $00 ; |        | $D593
       .byte $00 ; |        | $D594
       .byte $00 ; |        | $D595
       .byte $0E ; |    XXX | $D596
       .byte $0E ; |    XXX | $D597
       .byte $0E ; |    XXX | $D598
       .byte $0E ; |    XXX | $D599
       .byte $0E ; |    XXX | $D59A
       .byte $0E ; |    XXX | $D59B
       .byte $0E ; |    XXX | $D59C
       .byte $0E ; |    XXX | $D59D
       .byte $0E ; |    XXX | $D59E
       .byte $0E ; |    XXX | $D59F
       .byte $0E ; |    XXX | $D5A0
       .byte $0E ; |    XXX | $D5A1
       .byte $0E ; |    XXX | $D5A2
       .byte $0E ; |    XXX | $D5A3
       .byte $0E ; |    XXX | $D5A4
       .byte $0E ; |    XXX | $D5A5
       .byte $0E ; |    XXX | $D5A6
       .byte $0E ; |    XXX | $D5A7
       .byte $0E ; |    XXX | $D5A8
       .byte $0E ; |    XXX | $D5A9
       .byte $0E ; |    XXX | $D5AA
       .byte $0E ; |    XXX | $D5AB
       .byte $0E ; |    XXX | $D5AC
       .byte $0E ; |    XXX | $D5AD
       .byte $0E ; |    XXX | $D5AE
       .byte $0E ; |    XXX | $D5AF
       .byte $0E ; |    XXX | $D5B0
       .byte $0E ; |    XXX | $D5B1
       .byte $00 ; |        | $D5B2
       .byte $00 ; |        | $D5B3
       .byte $FF ; |XXXXXXXX| $D5B4
       .byte $FF ; |XXXXXXXX| $D5B5
       .byte $FF ; |XXXXXXXX| $D5B6
       .byte $FF ; |XXXXXXXX| $D5B7
       .byte $FF ; |XXXXXXXX| $D5B8
       .byte $FF ; |XXXXXXXX| $D5B9
       .byte $00 ; |        | $D5BA
       .byte $10 ; |   X    | $D5BB
       .byte $00 ; |        | $D5BC
       .byte $00 ; |        | $D5BD
       .byte $00 ; |        | $D5BE
       .byte $00 ; |        | $D5BF
       .byte $39 ; |  XXX  X| $D5C0
       .byte $73 ; | XXX  XX| $D5C1
       .byte $39 ; |  XXX  X| $D5C2
       .byte $73 ; | XXX  XX| $D5C3
       .byte $39 ; |  XXX  X| $D5C4
       .byte $73 ; | XXX  XX| $D5C5
       .byte $39 ; |  XXX  X| $D5C6
       .byte $73 ; | XXX  XX| $D5C7
       .byte $39 ; |  XXX  X| $D5C8
       .byte $73 ; | XXX  XX| $D5C9
       .byte $39 ; |  XXX  X| $D5CA
       .byte $73 ; | XXX  XX| $D5CB
       .byte $39 ; |  XXX  X| $D5CC
       .byte $73 ; | XXX  XX| $D5CD
       .byte $39 ; |  XXX  X| $D5CE
       .byte $73 ; | XXX  XX| $D5CF
       .byte $39 ; |  XXX  X| $D5D0
       .byte $73 ; | XXX  XX| $D5D1
       .byte $39 ; |  XXX  X| $D5D2
       .byte $73 ; | XXX  XX| $D5D3
       .byte $39 ; |  XXX  X| $D5D4
       .byte $73 ; | XXX  XX| $D5D5
       .byte $39 ; |  XXX  X| $D5D6
       .byte $73 ; | XXX  XX| $D5D7
       .byte $39 ; |  XXX  X| $D5D8
       .byte $73 ; | XXX  XX| $D5D9
       .byte $39 ; |  XXX  X| $D5DA
       .byte $73 ; | XXX  XX| $D5DB
       .byte $00 ; |        | $D5DC
       .byte $00 ; |        | $D5DD
       .byte $FF ; |XXXXXXXX| $D5DE
       .byte $FF ; |XXXXXXXX| $D5DF
       .byte $FF ; |XXXXXXXX| $D5E0
       .byte $FF ; |XXXXXXXX| $D5E1
       .byte $FF ; |XXXXXXXX| $D5E2
       .byte $FF ; |XXXXXXXX| $D5E3
       .byte $00 ; |        | $D5E4
       .byte $10 ; |   X    | $D5E5
       .byte $00 ; |        | $D5E6
       .byte $00 ; |        | $D5E7
       .byte $00 ; |        | $D5E8
       .byte $00 ; |        | $D5E9
       .byte $0E ; |    XXX | $D5EA
       .byte $0E ; |    XXX | $D5EB
       .byte $0E ; |    XXX | $D5EC
       .byte $0E ; |    XXX | $D5ED
       .byte $0E ; |    XXX | $D5EE
       .byte $0E ; |    XXX | $D5EF
       .byte $0E ; |    XXX | $D5F0
       .byte $0E ; |    XXX | $D5F1
       .byte $0E ; |    XXX | $D5F2
       .byte $0E ; |    XXX | $D5F3
       .byte $0E ; |    XXX | $D5F4
       .byte $0E ; |    XXX | $D5F5
       .byte $0E ; |    XXX | $D5F6
       .byte $0E ; |    XXX | $D5F7
       .byte $0E ; |    XXX | $D5F8
       .byte $0E ; |    XXX | $D5F9
       .byte $0E ; |    XXX | $D5FA
       .byte $0E ; |    XXX | $D5FB
       .byte $0E ; |    XXX | $D5FC
       .byte $0E ; |    XXX | $D5FD
       .byte $0E ; |    XXX | $D5FE
       .byte $0E ; |    XXX | $D5FF
       .byte $0E ; |    XXX | $D600
       .byte $0E ; |    XXX | $D601
       .byte $0E ; |    XXX | $D602
       .byte $0E ; |    XXX | $D603
       .byte $0E ; |    XXX | $D604
       .byte $0E ; |    XXX | $D605
       .byte $00 ; |        | $D606
       .byte $00 ; |        | $D607
       .byte $FF ; |XXXXXXXX| $D608
       .byte $3F ; |  XXXXXX| $D609
       .byte $FF ; |XXXXXXXX| $D60A
       .byte $3F ; |  XXXXXX| $D60B
       .byte $FF ; |XXXXXXXX| $D60C
       .byte $3F ; |  XXXXXX| $D60D
       .byte $00 ; |        | $D60E
       .byte $10 ; |   X    | $D60F
       .byte $00 ; |        | $D610
       .byte $00 ; |        | $D611
       .byte $00 ; |        | $D612
       .byte $00 ; |        | $D613
       .byte $0E ; |    XXX | $D614
       .byte $0E ; |    XXX | $D615
       .byte $0E ; |    XXX | $D616
       .byte $0E ; |    XXX | $D617
       .byte $0E ; |    XXX | $D618
       .byte $0E ; |    XXX | $D619
       .byte $0E ; |    XXX | $D61A
       .byte $0E ; |    XXX | $D61B
       .byte $0E ; |    XXX | $D61C
       .byte $0E ; |    XXX | $D61D
       .byte $0E ; |    XXX | $D61E
       .byte $0E ; |    XXX | $D61F
       .byte $0E ; |    XXX | $D620
       .byte $0E ; |    XXX | $D621
       .byte $0E ; |    XXX | $D622
       .byte $0E ; |    XXX | $D623
       .byte $0E ; |    XXX | $D624
       .byte $0E ; |    XXX | $D625
       .byte $0E ; |    XXX | $D626
       .byte $0E ; |    XXX | $D627
       .byte $0E ; |    XXX | $D628
       .byte $0E ; |    XXX | $D629
       .byte $0E ; |    XXX | $D62A
       .byte $0E ; |    XXX | $D62B
       .byte $0E ; |    XXX | $D62C
       .byte $0E ; |    XXX | $D62D
       .byte $0E ; |    XXX | $D62E
       .byte $0E ; |    XXX | $D62F
       .byte $00 ; |        | $D630
       .byte $00 ; |        | $D631
       .byte $FF ; |XXXXXXXX| $D632
       .byte $FF ; |XXXXXXXX| $D633
       .byte $FF ; |XXXXXXXX| $D634
       .byte $FF ; |XXXXXXXX| $D635
       .byte $FF ; |XXXXXXXX| $D636
       .byte $FF ; |XXXXXXXX| $D637
       .byte $50 ; | X X    | $D638
       .byte $00 ; |        | $D639
       .byte $AA ; |X X X X | $D63A
       .byte $15 ; |   X X X| $D63B
       .byte $55 ; | X X X X| $D63C
       .byte $2A ; |  X X X | $D63D
       .byte $AA ; |X X X X | $D63E
       .byte $15 ; |   X X X| $D63F
       .byte $55 ; | X X X X| $D640
       .byte $2A ; |  X X X | $D641
       .byte $AA ; |X X X X | $D642
       .byte $15 ; |   X X X| $D643
       .byte $55 ; | X X X X| $D644
       .byte $2A ; |  X X X | $D645
       .byte $AA ; |X X X X | $D646
       .byte $15 ; |   X X X| $D647
       .byte $55 ; | X X X X| $D648
       .byte $2A ; |  X X X | $D649
       .byte $AA ; |X X X X | $D64A
       .byte $15 ; |   X X X| $D64B
       .byte $55 ; | X X X X| $D64C
       .byte $2A ; |  X X X | $D64D
       .byte $AA ; |X X X X | $D64E
       .byte $15 ; |   X X X| $D64F
       .byte $55 ; | X X X X| $D650
       .byte $2A ; |  X X X | $D651
       .byte $AA ; |X X X X | $D652
       .byte $15 ; |   X X X| $D653
       .byte $55 ; | X X X X| $D654
       .byte $2A ; |  X X X | $D655
       .byte $AA ; |X X X X | $D656
       .byte $15 ; |   X X X| $D657
       .byte $55 ; | X X X X| $D658
       .byte $2A ; |  X X X | $D659
       .byte $AA ; |X X X X | $D65A
       .byte $15 ; |   X X X| $D65B
       .byte $55 ; | X X X X| $D65C
       .byte $2A ; |  X X X | $D65D
       .byte $FF ; |XXXXXXXX| $D65E
       .byte $FF ; |XXXXXXXX| $D65F
       .byte $FF ; |XXXXXXXX| $D660
       .byte $FF ; |XXXXXXXX| $D661
       .byte $FF ; |XXXXXXXX| $D662
       .byte $FF ; |XXXXXXXX| $D663
       .byte $00 ; |        | $D664
       .byte $00 ; |        | $D665
       .byte $3F ; |  XXXXXX| $D666
       .byte $7E ; | XXXXXX | $D667
       .byte $7C ; | XXXXX  | $D668
       .byte $74 ; | XXX X  | $D669
       .byte $76 ; | XXX XX | $D66A
       .byte $3E ; |  XXXXX | $D66B
       .byte $3C ; |  XXXX  | $D66C
       .byte $1C ; |   XXX  | $D66D
       .byte $18 ; |   XX   | $D66E
       .byte $18 ; |   XX   | $D66F
       .byte $1C ; |   XXX  | $D670
       .byte $3C ; |  XXXX  | $D671
       .byte $3C ; |  XXXX  | $D672
       .byte $3C ; |  XXXX  | $D673
       .byte $24 ; |  X  X  | $D674
       .byte $2C ; |  X XX  | $D675
       .byte $38 ; |  XXX   | $D676
       .byte $38 ; |  XXX   | $D677
       .byte $18 ; |   XX   | $D678
       .byte $18 ; |   XX   | $D679
       .byte $18 ; |   XX   | $D67A
       .byte $18 ; |   XX   | $D67B
       .byte $1C ; |   XXX  | $D67C
       .byte $00 ; |        | $D67D
       .byte $00 ; |        | $D67E
       .byte $00 ; |        | $D67F
       .byte $3F ; |  XXXXXX| $D680
       .byte $7E ; | XXXXXX | $D681
       .byte $7C ; | XXXXX  | $D682
       .byte $74 ; | XXX X  | $D683
       .byte $76 ; | XXX XX | $D684
       .byte $3E ; |  XXXXX | $D685
       .byte $3C ; |  XXXX  | $D686
       .byte $1C ; |   XXX  | $D687
       .byte $18 ; |   XX   | $D688
       .byte $38 ; |  XXX   | $D689
       .byte $3C ; |  XXXX  | $D68A
       .byte $3C ; |  XXXX  | $D68B
       .byte $30 ; |  XX    | $D68C
       .byte $74 ; | XXX X  | $D68D
       .byte $7C ; | XXXXX  | $D68E
       .byte $78 ; | XXXX   | $D68F
       .byte $7C ; | XXXXX  | $D690
       .byte $3E ; |  XXXXX | $D691
       .byte $36 ; |  XX XX | $D692
       .byte $76 ; | XXX XX | $D693
       .byte $63 ; | XX   XX| $D694
       .byte $30 ; |  XX    | $D695
       .byte $45 ; | X   X X| $D696
       .byte $45 ; | X   X X| $D697
       .byte $45 ; | X   X X| $D698
       .byte $45 ; | X   X X| $D699
       .byte $3C ; |  XXXX  | $D69A
       .byte $3C ; |  XXXX  | $D69B
       .byte $3C ; |  XXXX  | $D69C
       .byte $3C ; |  XXXX  | $D69D
       .byte $3C ; |  XXXX  | $D69E
       .byte $3C ; |  XXXX  | $D69F
       .byte $52 ; | X X  X | $D6A0
       .byte $52 ; | X X  X | $D6A1
       .byte $52 ; | X X  X | $D6A2
       .byte $52 ; | X X  X | $D6A3
       .byte $52 ; | X X  X | $D6A4
       .byte $52 ; | X X  X | $D6A5
       .byte $52 ; | X X  X | $D6A6
       .byte $52 ; | X X  X | $D6A7
       .byte $45 ; | X   X X| $D6A8
       .byte $45 ; | X   X X| $D6A9
       .byte $45 ; | X   X X| $D6AA
       .byte $45 ; | X   X X| $D6AB
       .byte $32 ; |  XX  X | $D6AC
       .byte $32 ; |  XX  X | $D6AD
       .byte $00 ; |        | $D6AE
       .byte $00 ; |        | $D6AF
       .byte $7E ; | XXXXXX | $D6B0
       .byte $FC ; |XXXXXX  | $D6B1
       .byte $F8 ; |XXXXX   | $D6B2
       .byte $E8 ; |XXX X   | $D6B3
       .byte $EC ; |XXX XX  | $D6B4
       .byte $7C ; | XXXXX  | $D6B5
       .byte $78 ; | XXXX   | $D6B6
       .byte $38 ; |  XXX   | $D6B7
       .byte $33 ; |  XX  XX| $D6B8
       .byte $3A ; |  XXX X | $D6B9
       .byte $3C ; |  XXXX  | $D6BA
       .byte $7C ; | XXXXX  | $D6BB
       .byte $78 ; | XXXX   | $D6BC
       .byte $78 ; | XXXX   | $D6BD
       .byte $78 ; | XXXX   | $D6BE
       .byte $78 ; | XXXX   | $D6BF
       .byte $70 ; | XXX    | $D6C0
       .byte $70 ; | XXX    | $D6C1
       .byte $30 ; |  XX    | $D6C2
       .byte $30 ; |  XX    | $D6C3
       .byte $30 ; |  XX    | $D6C4
       .byte $30 ; |  XX    | $D6C5
       .byte $38 ; |  XXX   | $D6C6
       .byte $00 ; |        | $D6C7
       .byte $00 ; |        | $D6C8
       .byte $00 ; |        | $D6C9
       .byte $00 ; |        | $D6CA
       .byte $00 ; |        | $D6CB
       .byte $00 ; |        | $D6CC
       .byte $00 ; |        | $D6CD
       .byte $00 ; |        | $D6CE
       .byte $00 ; |        | $D6CF
       .byte $00 ; |        | $D6D0
       .byte $7E ; | XXXXXX | $D6D1
       .byte $FC ; |XXXXXX  | $D6D2
       .byte $F8 ; |XXXXX   | $D6D3
       .byte $EC ; |XXX XX  | $D6D4
       .byte $EC ; |XXX XX  | $D6D5
       .byte $78 ; | XXXX   | $D6D6
       .byte $3B ; |  XXX XX| $D6D7
       .byte $32 ; |  XX  X | $D6D8
       .byte $7C ; | XXXXX  | $D6D9
       .byte $7C ; | XXXXX  | $D6DA
       .byte $78 ; | XXXX   | $D6DB
       .byte $3E ; |  XXXXX | $D6DC
       .byte $DE ; |XX XXXX | $D6DD
       .byte $F6 ; |XXXX XX | $D6DE
       .byte $B7 ; |X XX XXX| $D6DF
       .byte $00 ; |        | $D6E0
       .byte $7E ; | XXXXXX | $D6E1
       .byte $FC ; |XXXXXX  | $D6E2
       .byte $F8 ; |XXXXX   | $D6E3
       .byte $EC ; |XXX XX  | $D6E4
       .byte $EC ; |XXX XX  | $D6E5
       .byte $78 ; | XXXX   | $D6E6
       .byte $3B ; |  XXX XX| $D6E7
       .byte $32 ; |  XX  X | $D6E8
       .byte $7C ; | XXXXX  | $D6E9
       .byte $7C ; | XXXXX  | $D6EA
       .byte $78 ; | XXXX   | $D6EB
       .byte $71 ; | XXX   X| $D6EC
       .byte $79 ; | XXXX  X| $D6ED
       .byte $7F ; | XXXXXXX| $D6EE
       .byte $3F ; |  XXXXXX| $D6EF
       .byte $00 ; |        | $D6F0
       .byte $00 ; |        | $D6F1
       .byte $00 ; |        | $D6F2
       .byte $00 ; |        | $D6F3
       .byte $00 ; |        | $D6F4
       .byte $00 ; |        | $D6F5
       .byte $00 ; |        | $D6F6
       .byte $00 ; |        | $D6F7
       .byte $00 ; |        | $D6F8
       .byte $00 ; |        | $D6F9
       .byte $00 ; |        | $D6FA
       .byte $00 ; |        | $D6FB
       .byte $00 ; |        | $D6FC
       .byte $00 ; |        | $D6FD
       .byte $0E ; |    XXX | $D6FE
       .byte $06 ; |     XX | $D6FF
       .byte $06 ; |     XX | $D700
       .byte $06 ; |     XX | $D701
       .byte $03 ; |      XX| $D702
       .byte $3B ; |  XXX XX| $D703
       .byte $3B ; |  XXX XX| $D704
       .byte $7D ; | XXXXX X| $D705
       .byte $6D ; | XX XX X| $D706
       .byte $7D ; | XXXXX X| $D707
       .byte $7B ; | XXXX XX| $D708
       .byte $7B ; | XXXX XX| $D709
       .byte $77 ; | XXX XXX| $D70A
       .byte $0E ; |    XXX | $D70B
       .byte $06 ; |     XX | $D70C
       .byte $00 ; |        | $D70D
       .byte $00 ; |        | $D70E
       .byte $00 ; |        | $D70F
       .byte $00 ; |        | $D710
       .byte $00 ; |        | $D711
       .byte $00 ; |        | $D712
       .byte $00 ; |        | $D713
       .byte $00 ; |        | $D714
       .byte $00 ; |        | $D715
       .byte $00 ; |        | $D716
       .byte $60 ; | XX     | $D717
       .byte $70 ; | XXX    | $D718
       .byte $EE ; |XXX XXX | $D719
       .byte $DF ; |XX XXXXX| $D71A
       .byte $DF ; |XX XXXXX| $D71B
       .byte $BF ; |X XXXXXX| $D71C
       .byte $B7 ; |X XX XXX| $D71D
       .byte $BF ; |X XXXXXX| $D71E
       .byte $DC ; |XX XXX  | $D71F
       .byte $DC ; |XX XXX  | $D720
       .byte $C0 ; |XX      | $D721
       .byte $60 ; | XX     | $D722
       .byte $60 ; | XX     | $D723
       .byte $60 ; | XX     | $D724
       .byte $70 ; | XXX    | $D725
       .byte $00 ; |        | $D726
       .byte $00 ; |        | $D727
       .byte $00 ; |        | $D728
       .byte $00 ; |        | $D729
       .byte $00 ; |        | $D72A
       .byte $00 ; |        | $D72B
       .byte $00 ; |        | $D72C
       .byte $00 ; |        | $D72D
       .byte $00 ; |        | $D72E
       .byte $00 ; |        | $D72F
       .byte $10 ; |   X    | $D730
       .byte $00 ; |        | $D731
       .byte $10 ; |   X    | $D732
       .byte $82 ; |X     X | $D733
       .byte $44 ; | X   X  | $D734
       .byte $00 ; |        | $D735
       .byte $82 ; |X     X | $D736
       .byte $00 ; |        | $D737
       .byte $44 ; | X   X  | $D738
       .byte $82 ; |X     X | $D739
       .byte $10 ; |   X    | $D73A
       .byte $00 ; |        | $D73B
       .byte $10 ; |   X    | $D73C
       .byte $00 ; |        | $D73D
       .byte $00 ; |        | $D73E
       .byte $00 ; |        | $D73F
       .byte $00 ; |        | $D740
       .byte $00 ; |        | $D741
       .byte $00 ; |        | $D742
       .byte $F0 ; |XXXX    | $D743
       .byte $00 ; |        | $D744
       .byte $F0 ; |XXXX    | $D745
       .byte $00 ; |        | $D746
       .byte $F0 ; |XXXX    | $D747
       .byte $00 ; |        | $D748
       .byte $F0 ; |XXXX    | $D749
       .byte $00 ; |        | $D74A
       .byte $F0 ; |XXXX    | $D74B
       .byte $00 ; |        | $D74C
       .byte $F0 ; |XXXX    | $D74D
       .byte $00 ; |        | $D74E
       .byte $F0 ; |XXXX    | $D74F
       .byte $00 ; |        | $D750
       .byte $F0 ; |XXXX    | $D751
       .byte $00 ; |        | $D752
       .byte $F0 ; |XXXX    | $D753
       .byte $00 ; |        | $D754
       .byte $F0 ; |XXXX    | $D755
       .byte $00 ; |        | $D756
       .byte $F0 ; |XXXX    | $D757
       .byte $00 ; |        | $D758
       .byte $F0 ; |XXXX    | $D759
       .byte $00 ; |        | $D75A
       .byte $F0 ; |XXXX    | $D75B
       .byte $00 ; |        | $D75C
       .byte $F0 ; |XXXX    | $D75D
       .byte $00 ; |        | $D75E
       .byte $F0 ; |XXXX    | $D75F
       .byte $00 ; |        | $D760
       .byte $F0 ; |XXXX    | $D761
       .byte $00 ; |        | $D762
       .byte $F0 ; |XXXX    | $D763
       .byte $00 ; |        | $D764
       .byte $F0 ; |XXXX    | $D765
       .byte $00 ; |        | $D766
       .byte $F0 ; |XXXX    | $D767
       .byte $00 ; |        | $D768
       .byte $F0 ; |XXXX    | $D769
       .byte $00 ; |        | $D76A
       .byte $F0 ; |XXXX    | $D76B
       .byte $00 ; |        | $D76C
       .byte $00 ; |        | $D76D
       .byte $00 ; |        | $D76E
       .byte $00 ; |        | $D76F
       .byte $00 ; |        | $D770
       .byte $00 ; |        | $D771
       .byte $00 ; |        | $D772
       .byte $00 ; |        | $D773
       .byte $00 ; |        | $D774
       .byte $00 ; |        | $D775
       .byte $00 ; |        | $D776
       .byte $00 ; |        | $D777
       .byte $00 ; |        | $D778
       .byte $00 ; |        | $D779
       .byte $00 ; |        | $D77A
       .byte $00 ; |        | $D77B
       .byte $00 ; |        | $D77C
       .byte $00 ; |        | $D77D
       .byte $00 ; |        | $D77E
       .byte $00 ; |        | $D77F
       .byte $00 ; |        | $D780
       .byte $00 ; |        | $D781
       .byte $00 ; |        | $D782
       .byte $00 ; |        | $D783
       .byte $00 ; |        | $D784
       .byte $00 ; |        | $D785
       .byte $00 ; |        | $D786
       .byte $00 ; |        | $D787
       .byte $00 ; |        | $D788
       .byte $00 ; |        | $D789
       .byte $00 ; |        | $D78A
       .byte $00 ; |        | $D78B
       .byte $00 ; |        | $D78C
       .byte $00 ; |        | $D78D
       .byte $00 ; |        | $D78E
       .byte $30 ; |  XX    | $D78F
       .byte $00 ; |        | $D790
       .byte $F0 ; |XXXX    | $D791
       .byte $00 ; |        | $D792
       .byte $F0 ; |XXXX    | $D793
       .byte $00 ; |        | $D794
       .byte $F0 ; |XXXX    | $D795
       .byte $00 ; |        | $D796
       .byte $30 ; |  XX    | $D797
       .byte $00 ; |        | $D798
       .byte $30 ; |  XX    | $D799
       .byte $00 ; |        | $D79A
       .byte $30 ; |  XX    | $D79B
       .byte $00 ; |        | $D79C
       .byte $70 ; | XXX    | $D79D
       .byte $00 ; |        | $D79E
       .byte $70 ; | XXX    | $D79F
       .byte $00 ; |        | $D7A0
       .byte $70 ; | XXX    | $D7A1
       .byte $00 ; |        | $D7A2
       .byte $F0 ; |XXXX    | $D7A3
       .byte $00 ; |        | $D7A4
       .byte $F0 ; |XXXX    | $D7A5
       .byte $00 ; |        | $D7A6
       .byte $F0 ; |XXXX    | $D7A7
       .byte $00 ; |        | $D7A8
       .byte $F0 ; |XXXX    | $D7A9
       .byte $00 ; |        | $D7AA
       .byte $F0 ; |XXXX    | $D7AB
       .byte $00 ; |        | $D7AC
       .byte $F0 ; |XXXX    | $D7AD
       .byte $00 ; |        | $D7AE
       .byte $F0 ; |XXXX    | $D7AF
       .byte $00 ; |        | $D7B0
       .byte $F0 ; |XXXX    | $D7B1
       .byte $00 ; |        | $D7B2
       .byte $F0 ; |XXXX    | $D7B3
       .byte $00 ; |        | $D7B4
       .byte $F0 ; |XXXX    | $D7B5
       .byte $00 ; |        | $D7B6
       .byte $F0 ; |XXXX    | $D7B7
       .byte $00 ; |        | $D7B8
       .byte $C0 ; |XX      | $D7B9
       .byte $00 ; |        | $D7BA
       .byte $F0 ; |XXXX    | $D7BB
       .byte $00 ; |        | $D7BC
       .byte $F0 ; |XXXX    | $D7BD
       .byte $00 ; |        | $D7BE
       .byte $F0 ; |XXXX    | $D7BF
       .byte $00 ; |        | $D7C0
       .byte $30 ; |  XX    | $D7C1
       .byte $00 ; |        | $D7C2
       .byte $30 ; |  XX    | $D7C3
       .byte $00 ; |        | $D7C4
       .byte $30 ; |  XX    | $D7C5
       .byte $00 ; |        | $D7C6
       .byte $70 ; | XXX    | $D7C7
       .byte $00 ; |        | $D7C8
       .byte $70 ; | XXX    | $D7C9
       .byte $00 ; |        | $D7CA
       .byte $70 ; | XXX    | $D7CB
       .byte $00 ; |        | $D7CC
       .byte $F0 ; |XXXX    | $D7CD
       .byte $00 ; |        | $D7CE
       .byte $F0 ; |XXXX    | $D7CF
       .byte $00 ; |        | $D7D0
       .byte $F0 ; |XXXX    | $D7D1
       .byte $00 ; |        | $D7D2
       .byte $F0 ; |XXXX    | $D7D3
       .byte $00 ; |        | $D7D4
       .byte $F0 ; |XXXX    | $D7D5
       .byte $00 ; |        | $D7D6
       .byte $F0 ; |XXXX    | $D7D7
       .byte $00 ; |        | $D7D8
       .byte $F0 ; |XXXX    | $D7D9
       .byte $00 ; |        | $D7DA
       .byte $F0 ; |XXXX    | $D7DB
       .byte $00 ; |        | $D7DC
       .byte $F0 ; |XXXX    | $D7DD
       .byte $00 ; |        | $D7DE
       .byte $F0 ; |XXXX    | $D7DF
       .byte $00 ; |        | $D7E0
       .byte $F0 ; |XXXX    | $D7E1
       .byte $00 ; |        | $D7E2
       .byte $F0 ; |XXXX    | $D7E3
       .byte $00 ; |        | $D7E4
       .byte $F0 ; |XXXX    | $D7E5
       .byte $00 ; |        | $D7E6
       .byte $F0 ; |XXXX    | $D7E7
       .byte $00 ; |        | $D7E8
       .byte $F0 ; |XXXX    | $D7E9
       .byte $00 ; |        | $D7EA
       .byte $00 ; |        | $D7EB
       .byte $00 ; |        | $D7EC
       .byte $00 ; |        | $D7ED
       .byte $F0 ; |XXXX    | $D7EE
       .byte $F0 ; |XXXX    | $D7EF
       .byte $F0 ; |XXXX    | $D7F0
       .byte $F0 ; |XXXX    | $D7F1
       .byte $F0 ; |XXXX    | $D7F2
       .byte $F0 ; |XXXX    | $D7F3
       .byte $F0 ; |XXXX    | $D7F4
       .byte $F0 ; |XXXX    | $D7F5
       .byte $F0 ; |XXXX    | $D7F6
       .byte $F0 ; |XXXX    | $D7F7
       .byte $F0 ; |XXXX    | $D7F8
       .byte $F0 ; |XXXX    | $D7F9
       .byte $F0 ; |XXXX    | $D7FA
       .byte $F0 ; |XXXX    | $D7FB
       .byte $F0 ; |XXXX    | $D7FC
       .byte $F0 ; |XXXX    | $D7FD
       .byte $F0 ; |XXXX    | $D7FE
       .byte $F0 ; |XXXX    | $D7FF
       .byte $F0 ; |XXXX    | $D800
       .byte $F0 ; |XXXX    | $D801
       .byte $F0 ; |XXXX    | $D802
       .byte $F0 ; |XXXX    | $D803
       .byte $F0 ; |XXXX    | $D804
       .byte $F0 ; |XXXX    | $D805
       .byte $F0 ; |XXXX    | $D806
       .byte $F0 ; |XXXX    | $D807
       .byte $F0 ; |XXXX    | $D808
       .byte $F0 ; |XXXX    | $D809
       .byte $F0 ; |XXXX    | $D80A
       .byte $F0 ; |XXXX    | $D80B
       .byte $F0 ; |XXXX    | $D80C
       .byte $F0 ; |XXXX    | $D80D
       .byte $F0 ; |XXXX    | $D80E
       .byte $F0 ; |XXXX    | $D80F
       .byte $F0 ; |XXXX    | $D810
       .byte $F0 ; |XXXX    | $D811
       .byte $F0 ; |XXXX    | $D812
       .byte $F0 ; |XXXX    | $D813
       .byte $F0 ; |XXXX    | $D814
       .byte $F0 ; |XXXX    | $D815
       .byte $F0 ; |XXXX    | $D816
       .byte $F0 ; |XXXX    | $D817
       .byte $00 ; |        | $D818
       .byte $00 ; |        | $D819
       .byte $00 ; |        | $D81A
       .byte $00 ; |        | $D81B
       .byte $00 ; |        | $D81C
       .byte $00 ; |        | $D81D
       .byte $00 ; |        | $D81E
       .byte $00 ; |        | $D81F
       .byte $00 ; |        | $D820
       .byte $00 ; |        | $D821
       .byte $00 ; |        | $D822
       .byte $00 ; |        | $D823
       .byte $00 ; |        | $D824
       .byte $00 ; |        | $D825
       .byte $00 ; |        | $D826
       .byte $00 ; |        | $D827
       .byte $00 ; |        | $D828
       .byte $00 ; |        | $D829
       .byte $00 ; |        | $D82A
       .byte $00 ; |        | $D82B
       .byte $00 ; |        | $D82C
       .byte $00 ; |        | $D82D
       .byte $00 ; |        | $D82E
       .byte $00 ; |        | $D82F
       .byte $00 ; |        | $D830
       .byte $00 ; |        | $D831
       .byte $00 ; |        | $D832
       .byte $00 ; |        | $D833
       .byte $00 ; |        | $D834
       .byte $00 ; |        | $D835
       .byte $00 ; |        | $D836
       .byte $00 ; |        | $D837
       .byte $00 ; |        | $D838
       .byte $00 ; |        | $D839
       .byte $00 ; |        | $D83A
       .byte $00 ; |        | $D83B
       .byte $00 ; |        | $D83C
       .byte $00 ; |        | $D83D
       .byte $00 ; |        | $D83E
       .byte $00 ; |        | $D83F
       .byte $00 ; |        | $D840
       .byte $00 ; |        | $D841
       .byte $00 ; |        | $D842
       .byte $00 ; |        | $D843
       .byte $00 ; |        | $D844
       .byte $00 ; |        | $D845
       .byte $00 ; |        | $D846
       .byte $00 ; |        | $D847
       .byte $00 ; |        | $D848
       .byte $00 ; |        | $D849
       .byte $00 ; |        | $D84A
       .byte $00 ; |        | $D84B
       .byte $00 ; |        | $D84C
       .byte $00 ; |        | $D84D
       .byte $00 ; |        | $D84E
       .byte $00 ; |        | $D84F
       .byte $00 ; |        | $D850
       .byte $00 ; |        | $D851
       .byte $00 ; |        | $D852
       .byte $00 ; |        | $D853
       .byte $00 ; |        | $D854
       .byte $00 ; |        | $D855
       .byte $00 ; |        | $D856
       .byte $00 ; |        | $D857
       .byte $00 ; |        | $D858
       .byte $00 ; |        | $D859
       .byte $00 ; |        | $D85A
       .byte $00 ; |        | $D85B
       .byte $00 ; |        | $D85C
       .byte $00 ; |        | $D85D
       .byte $00 ; |        | $D85E
       .byte $00 ; |        | $D85F
       .byte $00 ; |        | $D860
       .byte $00 ; |        | $D861
       .byte $00 ; |        | $D862
       .byte $00 ; |        | $D863
       .byte $00 ; |        | $D864
       .byte $00 ; |        | $D865
       .byte $00 ; |        | $D866
       .byte $00 ; |        | $D867
       .byte $00 ; |        | $D868
       .byte $00 ; |        | $D869
       .byte $00 ; |        | $D86A
       .byte $00 ; |        | $D86B
       .byte $00 ; |        | $D86C
       .byte $00 ; |        | $D86D
       .byte $00 ; |        | $D86E
       .byte $00 ; |        | $D86F
       .byte $00 ; |        | $D870
       .byte $00 ; |        | $D871
       .byte $00 ; |        | $D872
       .byte $00 ; |        | $D873
       .byte $00 ; |        | $D874
       .byte $00 ; |        | $D875
       .byte $00 ; |        | $D876
       .byte $00 ; |        | $D877
       .byte $00 ; |        | $D878
       .byte $00 ; |        | $D879
       .byte $00 ; |        | $D87A
       .byte $00 ; |        | $D87B
       .byte $00 ; |        | $D87C
       .byte $00 ; |        | $D87D
       .byte $00 ; |        | $D87E
       .byte $00 ; |        | $D87F
       .byte $00 ; |        | $D880
       .byte $00 ; |        | $D881
       .byte $00 ; |        | $D882
       .byte $00 ; |        | $D883
       .byte $00 ; |        | $D884
       .byte $00 ; |        | $D885
       .byte $00 ; |        | $D886
       .byte $00 ; |        | $D887
       .byte $00 ; |        | $D888
       .byte $00 ; |        | $D889
       .byte $00 ; |        | $D88A
       .byte $00 ; |        | $D88B
       .byte $00 ; |        | $D88C
       .byte $00 ; |        | $D88D
       .byte $00 ; |        | $D88E
       .byte $00 ; |        | $D88F
       .byte $00 ; |        | $D890
       .byte $00 ; |        | $D891
       .byte $00 ; |        | $D892
       .byte $00 ; |        | $D893
       .byte $00 ; |        | $D894
       .byte $00 ; |        | $D895
       .byte $00 ; |        | $D896
       .byte $00 ; |        | $D897
       .byte $00 ; |        | $D898
       .byte $00 ; |        | $D899
       .byte $00 ; |        | $D89A
       .byte $00 ; |        | $D89B
       .byte $00 ; |        | $D89C
       .byte $00 ; |        | $D89D
       .byte $00 ; |        | $D89E
       .byte $00 ; |        | $D89F
       .byte $00 ; |        | $D8A0
       .byte $00 ; |        | $D8A1
       .byte $00 ; |        | $D8A2
       .byte $00 ; |        | $D8A3
       .byte $00 ; |        | $D8A4
       .byte $00 ; |        | $D8A5
       .byte $00 ; |        | $D8A6
       .byte $00 ; |        | $D8A7
       .byte $00 ; |        | $D8A8
       .byte $00 ; |        | $D8A9
       .byte $00 ; |        | $D8AA
       .byte $00 ; |        | $D8AB
       .byte $00 ; |        | $D8AC
       .byte $00 ; |        | $D8AD
       .byte $00 ; |        | $D8AE
       .byte $00 ; |        | $D8AF
       .byte $00 ; |        | $D8B0
       .byte $00 ; |        | $D8B1
       .byte $00 ; |        | $D8B2
       .byte $00 ; |        | $D8B3
       .byte $00 ; |        | $D8B4
       .byte $00 ; |        | $D8B5
       .byte $00 ; |        | $D8B6
       .byte $00 ; |        | $D8B7
       .byte $00 ; |        | $D8B8
       .byte $00 ; |        | $D8B9
       .byte $00 ; |        | $D8BA
       .byte $00 ; |        | $D8BB
       .byte $00 ; |        | $D8BC
       .byte $00 ; |        | $D8BD
       .byte $00 ; |        | $D8BE
       .byte $00 ; |        | $D8BF
       .byte $00 ; |        | $D8C0
       .byte $00 ; |        | $D8C1
       .byte $00 ; |        | $D8C2
       .byte $00 ; |        | $D8C3
       .byte $00 ; |        | $D8C4
       .byte $00 ; |        | $D8C5
       .byte $00 ; |        | $D8C6
       .byte $00 ; |        | $D8C7
       .byte $00 ; |        | $D8C8
       .byte $00 ; |        | $D8C9
       .byte $00 ; |        | $D8CA
       .byte $00 ; |        | $D8CB
       .byte $C0 ; |XX      | $D8CC
       .byte $00 ; |        | $D8CD
       .byte $C0 ; |XX      | $D8CE
       .byte $00 ; |        | $D8CF
       .byte $C0 ; |XX      | $D8D0
       .byte $00 ; |        | $D8D1
       .byte $C0 ; |XX      | $D8D2
       .byte $00 ; |        | $D8D3
       .byte $C0 ; |XX      | $D8D4
       .byte $00 ; |        | $D8D5
       .byte $C0 ; |XX      | $D8D6
       .byte $00 ; |        | $D8D7
       .byte $C0 ; |XX      | $D8D8
       .byte $00 ; |        | $D8D9
       .byte $C0 ; |XX      | $D8DA
       .byte $00 ; |        | $D8DB
       .byte $C0 ; |XX      | $D8DC
       .byte $00 ; |        | $D8DD
       .byte $C0 ; |XX      | $D8DE
       .byte $00 ; |        | $D8DF
       .byte $C0 ; |XX      | $D8E0
       .byte $00 ; |        | $D8E1
       .byte $C0 ; |XX      | $D8E2
       .byte $00 ; |        | $D8E3
       .byte $C0 ; |XX      | $D8E4
       .byte $00 ; |        | $D8E5
       .byte $C0 ; |XX      | $D8E6
       .byte $00 ; |        | $D8E7
       .byte $C0 ; |XX      | $D8E8
       .byte $00 ; |        | $D8E9
       .byte $C0 ; |XX      | $D8EA
       .byte $00 ; |        | $D8EB
       .byte $C0 ; |XX      | $D8EC
       .byte $00 ; |        | $D8ED
       .byte $C0 ; |XX      | $D8EE
       .byte $00 ; |        | $D8EF
       .byte $C0 ; |XX      | $D8F0
       .byte $FF ; |XXXXXXXX| $D8F1
       .byte $C0 ; |XX      | $D8F2
       .byte $00 ; |        | $D8F3
       .byte $C0 ; |XX      | $D8F4
       .byte $00 ; |        | $D8F5
       .byte $00 ; |        | $D8F6
       .byte $00 ; |        | $D8F7
       .byte $00 ; |        | $D8F8
       .byte $00 ; |        | $D8F9
       .byte $00 ; |        | $D8FA
       .byte $00 ; |        | $D8FB
       .byte $00 ; |        | $D8FC
       .byte $00 ; |        | $D8FD
       .byte $00 ; |        | $D8FE
       .byte $00 ; |        | $D8FF
       .byte $00 ; |        | $D900
       .byte $00 ; |        | $D901
       .byte $00 ; |        | $D902
       .byte $00 ; |        | $D903
       .byte $00 ; |        | $D904
       .byte $00 ; |        | $D905
       .byte $00 ; |        | $D906
       .byte $00 ; |        | $D907
       .byte $00 ; |        | $D908
       .byte $00 ; |        | $D909
       .byte $00 ; |        | $D90A
       .byte $00 ; |        | $D90B
       .byte $00 ; |        | $D90C
       .byte $00 ; |        | $D90D
       .byte $00 ; |        | $D90E
       .byte $00 ; |        | $D90F
       .byte $00 ; |        | $D910
       .byte $00 ; |        | $D911
       .byte $00 ; |        | $D912
       .byte $00 ; |        | $D913
       .byte $00 ; |        | $D914
       .byte $00 ; |        | $D915
       .byte $00 ; |        | $D916
       .byte $00 ; |        | $D917
       .byte $00 ; |        | $D918
       .byte $00 ; |        | $D919
       .byte $00 ; |        | $D91A
       .byte $00 ; |        | $D91B
       .byte $00 ; |        | $D91C
       .byte $00 ; |        | $D91D
       .byte $00 ; |        | $D91E
       .byte $00 ; |        | $D91F
       .byte $00 ; |        | $D920
       .byte $00 ; |        | $D921
       .byte $00 ; |        | $D922
       .byte $00 ; |        | $D923
       .byte $00 ; |        | $D924
       .byte $00 ; |        | $D925
       .byte $00 ; |        | $D926
       .byte $00 ; |        | $D927
       .byte $00 ; |        | $D928
       .byte $00 ; |        | $D929
       .byte $00 ; |        | $D92A
       .byte $00 ; |        | $D92B
       .byte $00 ; |        | $D92C
       .byte $00 ; |        | $D92D
       .byte $00 ; |        | $D92E
       .byte $00 ; |        | $D92F
       .byte $00 ; |        | $D930
       .byte $00 ; |        | $D931
       .byte $00 ; |        | $D932
       .byte $00 ; |        | $D933
       .byte $00 ; |        | $D934
       .byte $00 ; |        | $D935
       .byte $00 ; |        | $D936
       .byte $00 ; |        | $D937
       .byte $00 ; |        | $D938
       .byte $00 ; |        | $D939
       .byte $00 ; |        | $D93A
       .byte $00 ; |        | $D93B
       .byte $00 ; |        | $D93C
       .byte $00 ; |        | $D93D
       .byte $00 ; |        | $D93E
       .byte $00 ; |        | $D93F
       .byte $00 ; |        | $D940
       .byte $00 ; |        | $D941
       .byte $00 ; |        | $D942
       .byte $00 ; |        | $D943
       .byte $00 ; |        | $D944
       .byte $00 ; |        | $D945
       .byte $00 ; |        | $D946
       .byte $00 ; |        | $D947
       .byte $00 ; |        | $D948
       .byte $00 ; |        | $D949
       .byte $00 ; |        | $D94A
       .byte $00 ; |        | $D94B
       .byte $00 ; |        | $D94C
       .byte $00 ; |        | $D94D
       .byte $00 ; |        | $D94E
       .byte $00 ; |        | $D94F
       .byte $00 ; |        | $D950
       .byte $00 ; |        | $D951
       .byte $00 ; |        | $D952
       .byte $00 ; |        | $D953
       .byte $00 ; |        | $D954
       .byte $00 ; |        | $D955
       .byte $00 ; |        | $D956
       .byte $00 ; |        | $D957
       .byte $00 ; |        | $D958
       .byte $00 ; |        | $D959
       .byte $00 ; |        | $D95A
       .byte $00 ; |        | $D95B
       .byte $00 ; |        | $D95C
       .byte $00 ; |        | $D95D
       .byte $00 ; |        | $D95E
       .byte $00 ; |        | $D95F
       .byte $00 ; |        | $D960
       .byte $00 ; |        | $D961
       .byte $00 ; |        | $D962
       .byte $00 ; |        | $D963
       .byte $00 ; |        | $D964
       .byte $00 ; |        | $D965
       .byte $00 ; |        | $D966
       .byte $00 ; |        | $D967
       .byte $00 ; |        | $D968
       .byte $00 ; |        | $D969
       .byte $00 ; |        | $D96A
       .byte $00 ; |        | $D96B
       .byte $00 ; |        | $D96C
       .byte $00 ; |        | $D96D
       .byte $00 ; |        | $D96E
       .byte $00 ; |        | $D96F
       .byte $00 ; |        | $D970
       .byte $00 ; |        | $D971
       .byte $00 ; |        | $D972
       .byte $00 ; |        | $D973
       .byte $00 ; |        | $D974
       .byte $00 ; |        | $D975
       .byte $00 ; |        | $D976
       .byte $00 ; |        | $D977
       .byte $00 ; |        | $D978
       .byte $00 ; |        | $D979
       .byte $00 ; |        | $D97A
       .byte $00 ; |        | $D97B
       .byte $00 ; |        | $D97C
       .byte $00 ; |        | $D97D
       .byte $00 ; |        | $D97E
       .byte $00 ; |        | $D97F
       .byte $00 ; |        | $D980
       .byte $00 ; |        | $D981
       .byte $00 ; |        | $D982
       .byte $00 ; |        | $D983
       .byte $00 ; |        | $D984
       .byte $00 ; |        | $D985
       .byte $00 ; |        | $D986
       .byte $00 ; |        | $D987
       .byte $00 ; |        | $D988
       .byte $00 ; |        | $D989
       .byte $00 ; |        | $D98A
       .byte $00 ; |        | $D98B
       .byte $00 ; |        | $D98C
       .byte $00 ; |        | $D98D
       .byte $00 ; |        | $D98E
       .byte $00 ; |        | $D98F
       .byte $00 ; |        | $D990
       .byte $00 ; |        | $D991
       .byte $00 ; |        | $D992
       .byte $00 ; |        | $D993
       .byte $00 ; |        | $D994
       .byte $00 ; |        | $D995
       .byte $00 ; |        | $D996
       .byte $00 ; |        | $D997
       .byte $00 ; |        | $D998
       .byte $00 ; |        | $D999
       .byte $00 ; |        | $D99A
       .byte $00 ; |        | $D99B
       .byte $FF ; |XXXXXXXX| $D99C
       .byte $FF ; |XXXXXXXX| $D99D
       .byte $FF ; |XXXXXXXX| $D99E
       .byte $FF ; |XXXXXXXX| $D99F
       .byte $FF ; |XXXXXXXX| $D9A0
       .byte $FF ; |XXXXXXXX| $D9A1
       .byte $FF ; |XXXXXXXX| $D9A2
       .byte $FF ; |XXXXXXXX| $D9A3
       .byte $FF ; |XXXXXXXX| $D9A4
       .byte $FF ; |XXXXXXXX| $D9A5
       .byte $FF ; |XXXXXXXX| $D9A6
       .byte $FF ; |XXXXXXXX| $D9A7
       .byte $FF ; |XXXXXXXX| $D9A8
       .byte $FF ; |XXXXXXXX| $D9A9
       .byte $FF ; |XXXXXXXX| $D9AA
       .byte $FF ; |XXXXXXXX| $D9AB
       .byte $FF ; |XXXXXXXX| $D9AC
       .byte $FF ; |XXXXXXXX| $D9AD
       .byte $FF ; |XXXXXXXX| $D9AE
       .byte $FF ; |XXXXXXXX| $D9AF
       .byte $FF ; |XXXXXXXX| $D9B0
       .byte $FF ; |XXXXXXXX| $D9B1
       .byte $FF ; |XXXXXXXX| $D9B2
       .byte $FF ; |XXXXXXXX| $D9B3
       .byte $FF ; |XXXXXXXX| $D9B4
       .byte $00 ; |        | $D9B5
       .byte $00 ; |        | $D9B6
       .byte $00 ; |        | $D9B7
       .byte $00 ; |        | $D9B8
       .byte $00 ; |        | $D9B9
       .byte $00 ; |        | $D9BA
       .byte $00 ; |        | $D9BB
       .byte $00 ; |        | $D9BC
       .byte $00 ; |        | $D9BD
       .byte $00 ; |        | $D9BE
       .byte $00 ; |        | $D9BF
       .byte $00 ; |        | $D9C0
       .byte $00 ; |        | $D9C1
       .byte $00 ; |        | $D9C2
       .byte $00 ; |        | $D9C3
       .byte $00 ; |        | $D9C4
       .byte $00 ; |        | $D9C5
       .byte $00 ; |        | $D9C6
       .byte $00 ; |        | $D9C7
       .byte $00 ; |        | $D9C8
       .byte $00 ; |        | $D9C9
       .byte $00 ; |        | $D9CA
       .byte $00 ; |        | $D9CB
       .byte $00 ; |        | $D9CC
       .byte $00 ; |        | $D9CD
       .byte $00 ; |        | $D9CE
       .byte $00 ; |        | $D9CF
       .byte $00 ; |        | $D9D0
       .byte $00 ; |        | $D9D1
       .byte $00 ; |        | $D9D2
       .byte $00 ; |        | $D9D3
       .byte $00 ; |        | $D9D4
       .byte $00 ; |        | $D9D5
       .byte $00 ; |        | $D9D6
       .byte $00 ; |        | $D9D7
       .byte $00 ; |        | $D9D8
       .byte $00 ; |        | $D9D9
       .byte $00 ; |        | $D9DA
       .byte $00 ; |        | $D9DB
       .byte $00 ; |        | $D9DC
       .byte $00 ; |        | $D9DD
       .byte $00 ; |        | $D9DE
       .byte $00 ; |        | $D9DF
       .byte $00 ; |        | $D9E0
       .byte $00 ; |        | $D9E1
       .byte $00 ; |        | $D9E2
       .byte $00 ; |        | $D9E3
       .byte $00 ; |        | $D9E4
       .byte $00 ; |        | $D9E5
       .byte $00 ; |        | $D9E6
       .byte $00 ; |        | $D9E7
       .byte $00 ; |        | $D9E8
       .byte $00 ; |        | $D9E9
       .byte $00 ; |        | $D9EA
       .byte $00 ; |        | $D9EB
       .byte $00 ; |        | $D9EC
       .byte $00 ; |        | $D9ED
       .byte $00 ; |        | $D9EE
       .byte $00 ; |        | $D9EF
       .byte $00 ; |        | $D9F0
       .byte $00 ; |        | $D9F1
       .byte $00 ; |        | $D9F2
       .byte $00 ; |        | $D9F3
       .byte $00 ; |        | $D9F4
       .byte $00 ; |        | $D9F5
       .byte $00 ; |        | $D9F6
       .byte $00 ; |        | $D9F7
       .byte $00 ; |        | $D9F8
       .byte $00 ; |        | $D9F9
       .byte $00 ; |        | $D9FA
       .byte $00 ; |        | $D9FB
       .byte $00 ; |        | $D9FC
       .byte $00 ; |        | $D9FD
       .byte $00 ; |        | $D9FE
       .byte $00 ; |        | $D9FF
       .byte $00 ; |        | $DA00
       .byte $00 ; |        | $DA01
       .byte $00 ; |        | $DA02
       .byte $00 ; |        | $DA03
       .byte $00 ; |        | $DA04
       .byte $00 ; |        | $DA05
       .byte $00 ; |        | $DA06
       .byte $00 ; |        | $DA07
       .byte $00 ; |        | $DA08
       .byte $00 ; |        | $DA09
       .byte $00 ; |        | $DA0A
       .byte $00 ; |        | $DA0B
       .byte $00 ; |        | $DA0C
       .byte $00 ; |        | $DA0D
       .byte $00 ; |        | $DA0E
       .byte $00 ; |        | $DA0F
       .byte $00 ; |        | $DA10
       .byte $00 ; |        | $DA11
       .byte $00 ; |        | $DA12
       .byte $00 ; |        | $DA13
       .byte $00 ; |        | $DA14
       .byte $00 ; |        | $DA15
       .byte $00 ; |        | $DA16
       .byte $00 ; |        | $DA17
       .byte $00 ; |        | $DA18
       .byte $00 ; |        | $DA19
       .byte $00 ; |        | $DA1A
       .byte $00 ; |        | $DA1B
       .byte $00 ; |        | $DA1C
       .byte $00 ; |        | $DA1D
       .byte $00 ; |        | $DA1E
       .byte $00 ; |        | $DA1F
       .byte $00 ; |        | $DA20
       .byte $00 ; |        | $DA21
       .byte $00 ; |        | $DA22
       .byte $00 ; |        | $DA23
       .byte $00 ; |        | $DA24
       .byte $00 ; |        | $DA25
       .byte $00 ; |        | $DA26
       .byte $00 ; |        | $DA27
       .byte $00 ; |        | $DA28
       .byte $00 ; |        | $DA29
       .byte $00 ; |        | $DA2A
       .byte $00 ; |        | $DA2B
       .byte $00 ; |        | $DA2C
       .byte $00 ; |        | $DA2D
       .byte $00 ; |        | $DA2E
       .byte $00 ; |        | $DA2F
       .byte $00 ; |        | $DA30
       .byte $00 ; |        | $DA31
       .byte $00 ; |        | $DA32
       .byte $00 ; |        | $DA33
       .byte $00 ; |        | $DA34
       .byte $00 ; |        | $DA35
       .byte $00 ; |        | $DA36
       .byte $00 ; |        | $DA37
       .byte $00 ; |        | $DA38
       .byte $00 ; |        | $DA39
       .byte $00 ; |        | $DA3A
       .byte $00 ; |        | $DA3B
       .byte $00 ; |        | $DA3C
       .byte $00 ; |        | $DA3D
       .byte $00 ; |        | $DA3E
       .byte $00 ; |        | $DA3F
       .byte $00 ; |        | $DA40
       .byte $00 ; |        | $DA41
       .byte $00 ; |        | $DA42
       .byte $00 ; |        | $DA43
       .byte $00 ; |        | $DA44
       .byte $00 ; |        | $DA45
       .byte $00 ; |        | $DA46
       .byte $00 ; |        | $DA47
       .byte $00 ; |        | $DA48
       .byte $00 ; |        | $DA49
       .byte $00 ; |        | $DA4A
       .byte $00 ; |        | $DA4B
       .byte $00 ; |        | $DA4C
       .byte $00 ; |        | $DA4D
       .byte $00 ; |        | $DA4E
       .byte $00 ; |        | $DA4F
       .byte $00 ; |        | $DA50
       .byte $00 ; |        | $DA51
       .byte $00 ; |        | $DA52
       .byte $00 ; |        | $DA53
       .byte $00 ; |        | $DA54
       .byte $00 ; |        | $DA55
       .byte $00 ; |        | $DA56
       .byte $00 ; |        | $DA57
       .byte $00 ; |        | $DA58
       .byte $00 ; |        | $DA59
       .byte $00 ; |        | $DA5A
       .byte $00 ; |        | $DA5B
       .byte $00 ; |        | $DA5C
       .byte $00 ; |        | $DA5D
       .byte $00 ; |        | $DA5E
       .byte $80 ; |X       | $DA5F
       .byte $00 ; |        | $DA60
       .byte $C0 ; |XX      | $DA61
       .byte $00 ; |        | $DA62
       .byte $E0 ; |XXX     | $DA63
       .byte $00 ; |        | $DA64
       .byte $F0 ; |XXXX    | $DA65
       .byte $00 ; |        | $DA66
       .byte $F0 ; |XXXX    | $DA67
LDA68:
       .byte $00 ; |        | $DA68
       .byte $70 ; | XXX    | $DA69
       .byte $60 ; | XX     | $DA6A
       .byte $50 ; | X X    | $DA6B
       .byte $40 ; | X      | $DA6C
       .byte $30 ; |  XX    | $DA6D
       .byte $20 ; |  X     | $DA6E
       .byte $10 ; |   X    | $DA6F
       .byte $71 ; | XXX   X| $DA70
       .byte $61 ; | XX    X| $DA71
       .byte $51 ; | X X   X| $DA72
       .byte $41 ; | X     X| $DA73
       .byte $31 ; |  XX   X| $DA74
       .byte $21 ; |  X    X| $DA75
       .byte $11 ; |   X   X| $DA76
       .byte $01 ; |       X| $DA77
       .byte $F1 ; |XXXX   X| $DA78
       .byte $E1 ; |XXX    X| $DA79
       .byte $D1 ; |XX X   X| $DA7A
       .byte $C1 ; |XX     X| $DA7B
       .byte $B1 ; |X XX   X| $DA7C
       .byte $A1 ; |X X    X| $DA7D
       .byte $91 ; |X  X   X| $DA7E
       .byte $81 ; |X      X| $DA7F
       .byte $62 ; | XX   X | $DA80
       .byte $52 ; | X X  X | $DA81
       .byte $42 ; | X    X | $DA82
       .byte $32 ; |  XX  X | $DA83
       .byte $22 ; |  X   X | $DA84
       .byte $12 ; |   X  X | $DA85
       .byte $02 ; |      X | $DA86
       .byte $F2 ; |XXXX  X | $DA87
       .byte $E2 ; |XXX   X | $DA88
       .byte $D2 ; |XX X  X | $DA89
       .byte $C2 ; |XX    X | $DA8A
       .byte $B2 ; |X XX  X | $DA8B
       .byte $A2 ; |X X   X | $DA8C
       .byte $92 ; |X  X  X | $DA8D
       .byte $82 ; |X     X | $DA8E
       .byte $63 ; | XX   XX| $DA8F
       .byte $53 ; | X X  XX| $DA90
       .byte $43 ; | X    XX| $DA91
       .byte $33 ; |  XX  XX| $DA92
       .byte $23 ; |  X   XX| $DA93
       .byte $13 ; |   X  XX| $DA94
       .byte $03 ; |      XX| $DA95
       .byte $F3 ; |XXXX  XX| $DA96
       .byte $E3 ; |XXX   XX| $DA97
       .byte $D3 ; |XX X  XX| $DA98
       .byte $C3 ; |XX    XX| $DA99
       .byte $B3 ; |X XX  XX| $DA9A
       .byte $A3 ; |X X   XX| $DA9B
       .byte $93 ; |X  X  XX| $DA9C
       .byte $83 ; |X     XX| $DA9D
       .byte $64 ; | XX  X  | $DA9E
       .byte $54 ; | X X X  | $DA9F
       .byte $44 ; | X   X  | $DAA0
       .byte $34 ; |  XX X  | $DAA1
       .byte $24 ; |  X  X  | $DAA2
       .byte $14 ; |   X X  | $DAA3
       .byte $04 ; |     X  | $DAA4
       .byte $F4 ; |XXXX X  | $DAA5
       .byte $E4 ; |XXX  X  | $DAA6
       .byte $D4 ; |XX X X  | $DAA7
       .byte $C4 ; |XX   X  | $DAA8
       .byte $B4 ; |X XX X  | $DAA9
       .byte $A4 ; |X X  X  | $DAAA
       .byte $94 ; |X  X X  | $DAAB
       .byte $84 ; |X    X  | $DAAC
       .byte $65 ; | XX  X X| $DAAD
       .byte $55 ; | X X X X| $DAAE
       .byte $45 ; | X   X X| $DAAF
       .byte $35 ; |  XX X X| $DAB0
       .byte $25 ; |  X  X X| $DAB1
       .byte $15 ; |   X X X| $DAB2
       .byte $05 ; |     X X| $DAB3
       .byte $F5 ; |XXXX X X| $DAB4
       .byte $E5 ; |XXX  X X| $DAB5
       .byte $D5 ; |XX X X X| $DAB6
       .byte $C5 ; |XX   X X| $DAB7
       .byte $B5 ; |X XX X X| $DAB8
       .byte $A5 ; |X X  X X| $DAB9
       .byte $95 ; |X  X X X| $DABA
       .byte $85 ; |X    X X| $DABB
       .byte $66 ; | XX  XX | $DABC
       .byte $56 ; | X X XX | $DABD
       .byte $46 ; | X   XX | $DABE
       .byte $36 ; |  XX XX | $DABF
       .byte $26 ; |  X  XX | $DAC0
       .byte $16 ; |   X XX | $DAC1
       .byte $06 ; |     XX | $DAC2
       .byte $F6 ; |XXXX XX | $DAC3
       .byte $E6 ; |XXX  XX | $DAC4
       .byte $D6 ; |XX X XX | $DAC5
       .byte $C6 ; |XX   XX | $DAC6
       .byte $B6 ; |X XX XX | $DAC7
       .byte $A6 ; |X X  XX | $DAC8
       .byte $96 ; |X  X XX | $DAC9
       .byte $86 ; |X    XX | $DACA
       .byte $67 ; | XX  XXX| $DACB
       .byte $57 ; | X X XXX| $DACC
       .byte $47 ; | X   XXX| $DACD
       .byte $37 ; |  XX XXX| $DACE
       .byte $27 ; |  X  XXX| $DACF
       .byte $17 ; |   X XXX| $DAD0
       .byte $07 ; |     XXX| $DAD1
       .byte $F7 ; |XXXX XXX| $DAD2
       .byte $E7 ; |XXX  XXX| $DAD3
       .byte $D7 ; |XX X XXX| $DAD4
       .byte $C7 ; |XX   XXX| $DAD5
       .byte $B7 ; |X XX XXX| $DAD6
       .byte $A7 ; |X X  XXX| $DAD7
       .byte $97 ; |X  X XXX| $DAD8
       .byte $87 ; |X    XXX| $DAD9
       .byte $68 ; | XX X   | $DADA
       .byte $58 ; | X XX   | $DADB
       .byte $48 ; | X  X   | $DADC
       .byte $38 ; |  XXX   | $DADD
       .byte $28 ; |  X X   | $DADE
       .byte $18 ; |   XX   | $DADF
       .byte $08 ; |    X   | $DAE0
       .byte $F8 ; |XXXXX   | $DAE1
       .byte $E8 ; |XXX X   | $DAE2
       .byte $D8 ; |XX XX   | $DAE3
       .byte $C8 ; |XX  X   | $DAE4
       .byte $B8 ; |X XXX   | $DAE5
       .byte $A8 ; |X X X   | $DAE6
       .byte $98 ; |X  XX   | $DAE7
       .byte $88 ; |X   X   | $DAE8
       .byte $69 ; | XX X  X| $DAE9
       .byte $59 ; | X XX  X| $DAEA
       .byte $49 ; | X  X  X| $DAEB
       .byte $39 ; |  XXX  X| $DAEC
       .byte $29 ; |  X X  X| $DAED
       .byte $19 ; |   XX  X| $DAEE
       .byte $09 ; |    X  X| $DAEF
       .byte $F9 ; |XXXXX  X| $DAF0
       .byte $E9 ; |XXX X  X| $DAF1
       .byte $D9 ; |XX XX  X| $DAF2
       .byte $C9 ; |XX  X  X| $DAF3
       .byte $B9 ; |X XXX  X| $DAF4
       .byte $A9 ; |X X X  X| $DAF5
       .byte $99 ; |X  XX  X| $DAF6
       .byte $89 ; |X   X  X| $DAF7
       .byte $6A ; | XX X X | $DAF8
       .byte $5A ; | X XX X | $DAF9
       .byte $4A ; | X  X X | $DAFA
       .byte $3A ; |  XXX X | $DAFB
       .byte $2A ; |  X X X | $DAFC
       .byte $1A ; |   XX X | $DAFD
       .byte $0A ; |    X X | $DAFE
       .byte $FA ; |XXXXX X | $DAFF
       .byte $EA ; |XXX X X | $DB00
       .byte $DA ; |XX XX X | $DB01
       .byte $CA ; |XX  X X | $DB02
       .byte $BA ; |X XXX X | $DB03
       .byte $00 ; |        | $DB04
       .byte $00 ; |        | $DB05
       .byte $00 ; |        | $DB06
       .byte $80 ; |X       | $DB07
       .byte $00 ; |        | $DB08
       .byte $80 ; |X       | $DB09
       .byte $C0 ; |XX      | $DB0A
       .byte $C0 ; |XX      | $DB0B
       .byte $00 ; |        | $DB0C
       .byte $00 ; |        | $DB0D
       .byte $00 ; |        | $DB0E
       .byte $00 ; |        | $DB0F
       .byte $00 ; |        | $DB10
       .byte $00 ; |        | $DB11
       .byte $00 ; |        | $DB12
       .byte $00 ; |        | $DB13
       .byte $00 ; |        | $DB14
       .byte $00 ; |        | $DB15
       .byte $00 ; |        | $DB16
       .byte $00 ; |        | $DB17
       .byte $00 ; |        | $DB18
       .byte $00 ; |        | $DB19
       .byte $00 ; |        | $DB1A
       .byte $00 ; |        | $DB1B
       .byte $00 ; |        | $DB1C
       .byte $00 ; |        | $DB1D
       .byte $40 ; | X      | $DB1E
       .byte $C0 ; |XX      | $DB1F
       .byte $C0 ; |XX      | $DB20
       .byte $E0 ; |XXX     | $DB21
       .byte $40 ; | X      | $DB22
       .byte $60 ; | XX     | $DB23
       .byte $F0 ; |XXXX    | $DB24
       .byte $F0 ; |XXXX    | $DB25
       .byte $C0 ; |XX      | $DB26
       .byte $C0 ; |XX      | $DB27
       .byte $80 ; |X       | $DB28
       .byte $C0 ; |XX      | $DB29
       .byte $C0 ; |XX      | $DB2A
       .byte $C0 ; |XX      | $DB2B
       .byte $00 ; |        | $DB2C
       .byte $40 ; | X      | $DB2D
       .byte $C0 ; |XX      | $DB2E
       .byte $80 ; |X       | $DB2F
       .byte $C0 ; |XX      | $DB30
       .byte $E0 ; |XXX     | $DB31
       .byte $60 ; | XX     | $DB32
       .byte $60 ; | XX     | $DB33
       .byte $30 ; |  XX    | $DB34
       .byte $00 ; |        | $DB35
       .byte $34 ; |  XX X  | $DB36
       .byte $3C ; |  XXXX  | $DB37
       .byte $3C ; |  XXXX  | $DB38
       .byte $7E ; | XXXXXX | $DB39
       .byte $34 ; |  XX X  | $DB3A
       .byte $36 ; |  XX XX | $DB3B
       .byte $3F ; |  XXXXXX| $DB3C
       .byte $1F ; |   XXXXX| $DB3D
       .byte $1C ; |   XXX  | $DB3E
       .byte $0C ; |    XX  | $DB3F
       .byte $18 ; |   XX   | $DB40
       .byte $1C ; |   XXX  | $DB41
       .byte $3C ; |  XXXX  | $DB42
       .byte $3C ; |  XXXX  | $DB43
       .byte $3C ; |  XXXX  | $DB44
       .byte $7C ; | XXXXX  | $DB45
       .byte $64 ; | XX  X  | $DB46
       .byte $6C ; | XX XX  | $DB47
       .byte $7C ; | XXXXX  | $DB48
       .byte $38 ; |  XXX   | $DB49
       .byte $18 ; |   XX   | $DB4A
       .byte $18 ; |   XX   | $DB4B
       .byte $18 ; |   XX   | $DB4C
       .byte $18 ; |   XX   | $DB4D
       .byte $1C ; |   XXX  | $DB4E
       .byte $00 ; |        | $DB4F
       .byte $34 ; |  XX X  | $DB50
       .byte $3C ; |  XXXX  | $DB51
       .byte $3C ; |  XXXX  | $DB52
       .byte $7E ; | XXXXXX | $DB53
       .byte $34 ; |  XX X  | $DB54
       .byte $36 ; |  XX XX | $DB55
       .byte $3F ; |  XXXXXX| $DB56
       .byte $1F ; |   XXXXX| $DB57
       .byte $1C ; |   XXX  | $DB58
       .byte $0C ; |    XX  | $DB59
       .byte $18 ; |   XX   | $DB5A
       .byte $1C ; |   XXX  | $DB5B
       .byte $3C ; |  XXXX  | $DB5C
       .byte $3C ; |  XXXX  | $DB5D
       .byte $30 ; |  XX    | $DB5E
       .byte $74 ; | XXX X  | $DB5F
       .byte $7C ; | XXXXX  | $DB60
       .byte $78 ; | XXXX   | $DB61
       .byte $7C ; | XXXXX  | $DB62
       .byte $3E ; |  XXXXX | $DB63
       .byte $36 ; |  XX XX | $DB64
       .byte $76 ; | XXX XX | $DB65
       .byte $63 ; | XX   XX| $DB66
       .byte $30 ; |  XX    | $DB67
       .byte $68 ; | XX X   | $DB68
       .byte $78 ; | XXXX   | $DB69
       .byte $78 ; | XXXX   | $DB6A
       .byte $FC ; |XXXXXX  | $DB6B
       .byte $68 ; | XX X   | $DB6C
       .byte $6C ; | XX XX  | $DB6D
       .byte $7E ; | XXXXXX | $DB6E
       .byte $3E ; |  XXXXX | $DB6F
       .byte $38 ; |  XXX   | $DB70
       .byte $1B ; |   XX XX| $DB71
       .byte $22 ; |  X   X | $DB72
       .byte $34 ; |  XX X  | $DB73
       .byte $3C ; |  XXXX  | $DB74
       .byte $3C ; |  XXXX  | $DB75
       .byte $30 ; |  XX    | $DB76
       .byte $78 ; | XXXX   | $DB77
       .byte $78 ; | XXXX   | $DB78
       .byte $78 ; | XXXX   | $DB79
       .byte $78 ; | XXXX   | $DB7A
       .byte $30 ; |  XX    | $DB7B
       .byte $30 ; |  XX    | $DB7C
       .byte $30 ; |  XX    | $DB7D
       .byte $30 ; |  XX    | $DB7E
       .byte $30 ; |  XX    | $DB7F
       .byte $38 ; |  XXX   | $DB80
       .byte $00 ; |        | $DB81
       .byte $00 ; |        | $DB82
       .byte $00 ; |        | $DB83
       .byte $00 ; |        | $DB84
       .byte $00 ; |        | $DB85
       .byte $00 ; |        | $DB86
       .byte $68 ; | XX X   | $DB87
       .byte $78 ; | XXXX   | $DB88
       .byte $78 ; | XXXX   | $DB89
       .byte $FC ; |XXXXXX  | $DB8A
       .byte $68 ; | XX X   | $DB8B
       .byte $6C ; | XX XX  | $DB8C
       .byte $7E ; | XXXXXX | $DB8D
       .byte $3E ; |  XXXXX | $DB8E
       .byte $38 ; |  XXX   | $DB8F
       .byte $1B ; |   XX XX| $DB90
       .byte $22 ; |  X   X | $DB91
       .byte $34 ; |  XX X  | $DB92
       .byte $7C ; | XXXXX  | $DB93
       .byte $7C ; | XXXXX  | $DB94
       .byte $78 ; | XXXX   | $DB95
       .byte $3E ; |  XXXXX | $DB96
       .byte $DE ; |XX XXXX | $DB97
       .byte $F6 ; |XXXX XX | $DB98
       .byte $B7 ; |X XX XXX| $DB99
       .byte $00 ; |        | $DB9A
       .byte $00 ; |        | $DB9B
       .byte $00 ; |        | $DB9C
       .byte $00 ; |        | $DB9D
       .byte $00 ; |        | $DB9E
       .byte $00 ; |        | $DB9F
       .byte $68 ; | XX X   | $DBA0
       .byte $78 ; | XXXX   | $DBA1
       .byte $78 ; | XXXX   | $DBA2
       .byte $FC ; |XXXXXX  | $DBA3
       .byte $68 ; | XX X   | $DBA4
       .byte $6C ; | XX XX  | $DBA5
       .byte $7E ; | XXXXXX | $DBA6
       .byte $3E ; |  XXXXX | $DBA7
       .byte $38 ; |  XXX   | $DBA8
       .byte $18 ; |   XX   | $DBA9
       .byte $20 ; |  X     | $DBAA
       .byte $38 ; |  XXX   | $DBAB
       .byte $78 ; | XXXX   | $DBAC
       .byte $76 ; | XXX XX | $DBAD
       .byte $74 ; | XXX X  | $DBAE
       .byte $38 ; |  XXX   | $DBAF
       .byte $DE ; |XX XXXX | $DBB0
       .byte $F6 ; |XXXX XX | $DBB1
       .byte $B7 ; |X XX XXX| $DBB2


       LDX    #$0B                    ;2
LDBB5:
       LDA    LDC8F,X                 ;4
       STA    $8F,X                   ;4
       DEX                            ;2
       BPL    LDBB5                   ;2
       LDA    $86                     ;3
       EOR    #$3C                    ;2
       BEQ    LDBC7                   ;2
       STA    COLUP0                  ;3
       STA    COLUP1                  ;3
LDBC7:
       JSR    LDD7D                   ;6
       JMP    LDDE3                   ;3
       LDA    #$00                    ;2
       LDY    #$1A                    ;2
       STA    WSYNC                   ;3
       STA    VBLANK                  ;3
       JSR    LDD48                   ;6
       LDX    #$7B                    ;2
LDBDA:
       STA    WSYNC                   ;3
       DEX                            ;2
       BNE    LDBDA                   ;2
       LDX    #$0B                    ;2
LDBE1:
       LDA    LDC9B,X                 ;4
       STA    $8F,X                   ;4
       DEX                            ;2
       BPL    LDBE1                   ;2
       LDX    $80                     ;3
       INX                            ;2
       LDA    LDFAF,X                 ;4
       STA    $95                     ;3
       LDY    #$06                    ;2
       JSR    LDD48                   ;6
       STA    WSYNC                   ;3
       STA    WSYNC                   ;3
       LDX    #$0B                    ;2
LDBFC:
       LDA    LDFBA,X                 ;4
       STA    $8F,X                   ;4
       DEX                            ;2
       BPL    LDBFC                   ;2
       LDA    $81                     ;3
       BEQ    LDC24                   ;2
       LDY    #$02                    ;2
       JSR    LDD3F                   ;6
       LDA    $80                     ;3
       ROR                            ;2
       BCC    LDC1C                   ;2
       LDY    #$06                    ;2
       JSR    LDD48                   ;6
       LDY    #$05                    ;2
       JSR    LDD3F                   ;6
LDC1C:
       LDA    $86                     ;3
       EOR    #$93                    ;2
       BEQ    LDC24                   ;2
       STA    COLUBK                  ;3
LDC24:
       LDY    #$06                    ;2
       JSR    LDD48                   ;6
       JMP    LDE03                   ;3
       LDY    #$00                    ;2
       LDA    $85                     ;3
       AND    #$0F                    ;2
       BNE    LDC80                   ;2
       LDA    SWCHB                   ;4
       AND    #$02                    ;2
       BNE    LDC45                   ;2
       INC    $80                     ;5
       LDA    $80                     ;3
       CMP    #$02                    ;2
       BCC    LDC45                   ;2
       STY    $80                     ;3
LDC45:
       LDA    INPT4                   ;3
       BMI    LDC80                   ;2
       STY    $87                     ;3
       STY    $88                     ;3
       STY    $89                     ;3
       LDA    #$22                    ;2
       STA    $F05C                   ;4
       STA    $F05D                   ;4
       LDA    #$30                    ;2
       STA    $F05A                   ;4
       STA    $F05B                   ;4
       LDA    #$04                    ;2
       STA    $83                     ;3
       LDX    #$00                    ;2
       STX    $F05E                   ;4
       STX    $F05F                   ;4
       JSR    LDD34                   ;6
       LDA    $80                     ;3
       BEQ    LDC7B                   ;2
       LDY    #$04                    ;2
       STY    $84                     ;3
       LDX    #$05                    ;2
       JSR    LDD34                   ;6
LDC7B:
       LDA    #$02                    ;2
       JMP    LDE68                   ;3
LDC80:
       JMP    LDE60                   ;3
       LDA    #$00                    ;2
       STA    PF0                     ;3
       STA    PF1                     ;3
       STA    PF2                     ;3
       STA    COLUBK                  ;3
       BEQ    LDC80                   ;2

LDC8F:
       .byte $7E ; | XXXXXX | $DC8F
       .byte $DE ; |XX XXXX | $DC90
       .byte $99 ; |X  XX  X| $DC91
       .byte $DE ; |XX XXXX | $DC92
       .byte $B4 ; |X XX X  | $DC93
       .byte $DE ; |XX XXXX | $DC94
       .byte $CF ; |XX  XXXX| $DC95
       .byte $DE ; |XX XXXX | $DC96
       .byte $EA ; |XXX X X | $DC97
       .byte $DE ; |XX XXXX | $DC98
       .byte $05 ; |     X X| $DC99
       .byte $DF ; |XX XXXXX| $DC9A
LDC9B:
       .byte $7E ; | XXXXXX | $DC9B
       .byte $DF ; |XX XXXXX| $DC9C
       .byte $7E ; | XXXXXX | $DC9D
       .byte $DF ; |XX XXXXX| $DC9E
       .byte $7E ; | XXXXXX | $DC9F
       .byte $DF ; |XX XXXXX| $DCA0
       .byte $7E ; | XXXXXX | $DCA1
       .byte $DF ; |XX XXXXX| $DCA2
       .byte $7E ; | XXXXXX | $DCA3
       .byte $DF ; |XX XXXXX| $DCA4
       .byte $7E ; | XXXXXX | $DCA5
       .byte $DF ; |XX XXXXX| $DCA6


       LDA    #$03                    ;2
       STA    $F031                   ;4
       LDA    #$3D                    ;2
       STA    $A9                     ;3
       LDA    #$32                    ;2
       STA    $AA                     ;3
       LDA    #$28                    ;2
       STA    $FA                     ;3
       LDY    #$FF                    ;2
       STY    $F01E                   ;4
       STY    $9B                     ;3
       STY    $F00A                   ;4
       LDX    #$04                    ;2
LDCC4:
       TYA                            ;2
       STA    $F019,X                 ;5
       LDA    LDD15,X                 ;4
       STA    $F011,X                 ;5
       LDA    LDD1A,X                 ;4
       STA    $F02B,X                 ;5
       LDA    #$00                    ;2
       STA    $9F                     ;3
       STA    $F004,X                 ;5
       STA    $F025,X                 ;5
       CPX    #$04                    ;2
       BEQ    LDCEC                   ;2
       STA    $F02A                   ;4
       STA    $F046,X                 ;5
       TYA                            ;2
       STA    $F04E,X                 ;5
LDCEC:
       DEX                            ;2
       BPL    LDCC4                   ;2
       LDX    $82                     ;3
       LDA    $F0DC,X                 ;4
       STA    $A0                     ;3
       LDA    $F0DA,X                 ;4
       STA    $A1                     ;3
       LDA    $F0DE,X                 ;4
       AND    #$03                    ;2
       TAX                            ;2
       LDA    LDD21,X                 ;4
       STA    COLUPF                  ;3
       LDA    #$13                    ;2
       STA    $F016                   ;4
       LDA    #$01                    ;2
       STA    $F062                   ;4
       STA    CTRLPF                  ;3
       JMP    LDE60                   ;3


LDD15:
       .byte $24 ; |  X  X  | $DD15
       .byte $4E ; | X  XXX | $DD16
       .byte $78 ; | XXXX   | $DD17
       .byte $A2 ; |X X   X | $DD18
       .byte $CC ; |XX  XX  | $DD19
LDD1A:
       .byte $20 ; |  X     | $DD1A
       .byte $12 ; |   X  X | $DD1B
       .byte $0E ; |    XXX | $DD1C
       .byte $07 ; |     XXX| $DD1D
       .byte $10 ; |   X    | $DD1E
       .byte $07 ; |     XXX| $DD1F
       .byte $00 ; |        | $DD20


LDD21:
       ROR    $94,X                   ;6
       ROL    $C8,X                   ;6
       LDA    LDA68,X                 ;4
       TAX                            ;2
       LDA    #$D3                    ;2
       STA    $FB                     ;3
       LDA    #$FA                    ;2
       STA    $FC                     ;3
       JMP    LDFEA                   ;3
LDD34:
       LDA    #$13                    ;2
       STA    $FB                     ;3
       LDA    #$FE                    ;2
       STA    $FC                     ;3
       JMP    LDFEA                   ;3
LDD3F:
       LDA    #$21                    ;2
       STA    $FB                     ;3
       LDA    #$FE                    ;2
       STA    $FC                     ;3
       RTS                            ;6

LDD48:
       STY    $9C                     ;3
LDD4A:
       LDY    $9C                     ;3
       LDA    ($8F),Y                 ;5
       STA    GRP0                    ;3
       STA    WSYNC                   ;3
       LDA    ($91),Y                 ;5
       STA    GRP1                    ;3
       LDA    ($93),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($95),Y                 ;5
       STA    $9D                     ;3
       LDA    ($97),Y                 ;5
       TAX                            ;2
       LDA    ($99),Y                 ;5
       TAY                            ;2
       LDA    $9D                     ;3
       STA    GRP1                    ;3
       STX    GRP0                    ;3
       STY    GRP1                    ;3
       STY    GRP0                    ;3
       DEC    $9C                     ;5
       BPL    LDD4A                   ;2
       LDA    #$00                    ;2
       STA    GRP0                    ;3
       STA    GRP1                    ;3
       STA    GRP0                    ;3
       STA    GRP1                    ;3
       RTS                            ;6

LDD7D:
       STA    WSYNC                   ;3
       LDA    #$03                    ;2
       LDY    #$00                    ;2
       STY    REFP1                   ;3
       STA    NUSIZ0                  ;3
       STA    NUSIZ1                  ;3
       STA    VDELP0                  ;3
       STA    VDELP1                  ;3
       STY    GRP0                    ;3
       STY    GRP1                    ;3
       STY    GRP0                    ;3
       STY    GRP1                    ;3
       STY    HMP1                    ;3
       NOP                            ;2
       STA    RESP0                   ;3
       STA    RESP1                   ;3
       STY    REFP0                   ;3
       LDA    #$F0                    ;2
       STA    HMP0                    ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       RTS                            ;6

LDDA7:
       LDA    #$03                    ;2
       STA    WSYNC                   ;3
       STA    VSYNC                   ;3
       LDA    $8D                     ;3
       ASL                            ;2
       EOR    $8D                     ;3
       ASL                            ;2
       EOR    $8D                     ;3
       ASL                            ;2
       ASL                            ;2
       EOR    $8D                     ;3
       ASL                            ;2
       ROL    $8D                     ;5
       STA    WSYNC                   ;3
       STA    WSYNC                   ;3
       LDX    #$00                    ;2
       STA    WSYNC                   ;3
       STX    VSYNC                   ;3
       LDA    #$2C                    ;2
       STA    TIM64T                  ;4
       INC    $85                     ;5
       BNE    LDDD1                   ;2
       INC    $86                     ;5
LDDD1:
       LDA    $81                     ;3
       AND    #$0F                    ;2
       TAX                            ;2
       LDA    LDF26,X                 ;4
       STA    $FB                     ;3
       LDA    LDF29,X                 ;4
       STA    $FC                     ;3
       JMP    LDFEA                   ;3
LDDE3:
       LDA    INTIM                   ;4
       BNE    LDDE3                   ;2
       STA    WSYNC                   ;3
       LDA    #$E5                    ;2
       STA    TIM64T                  ;4
       STA    CXCLR                   ;3
       LDA    $81                     ;3
       AND    #$0F                    ;2
       TAY                            ;2
       LDA    LDF2C,Y                 ;4
       STA    $FB                     ;3
       LDA    LDF2F,Y                 ;4
       STA    $FC                     ;3
       JMP    LDFEA                   ;3
LDE03:
       LDA    INTIM                   ;4
       BNE    LDE03                   ;2
       STA    WSYNC                   ;3
       LDA    #$02                    ;2
       STA    VBLANK                  ;3
       LDA    #$23                    ;2
       STA    TIM64T                  ;4
       LDX    #$FF                    ;2
       TXS                            ;2
       LDA    SWCHB                   ;4
       ROR                            ;2
       BCC    LDE23                   ;2
       ROR                            ;2
       LDY    $81                     ;3
       BEQ    LDE30                   ;2
       BCS    LDE30                   ;2
LDE23:
       LDX    #$81                    ;2
       LDA    #$06                    ;2
       STA    $FB                     ;3
       LDA    #$F1                    ;2
       STA    $FC                     ;3
       JMP    LDFEA                   ;3
LDE30:
       LDA    SWCHA                   ;4
       EOR    #$FF                    ;2
       BEQ    LDE3D                   ;2
       LDA    #$00                    ;2
       STA    $86                     ;3
       BEQ    LDE4E                   ;2
LDE3D:
       LDA    $86                     ;3
       CMP    #$FF                    ;2
       BNE    LDE4E                   ;2
       LDA    $81                     ;3
       BEQ    LDE4E                   ;2
       LDA    #$01                    ;2
       STA    $86                     ;3
       JMP    LDE68                   ;3
LDE4E:
       LDA    $81                     ;3
       AND    #$0F                    ;2
       TAX                            ;2
       LDA    LDF32,X                 ;4
       STA    $FB                     ;3
       LDA    LDF35,X                 ;4
       STA    $FC                     ;3
       JMP    LDFEA                   ;3
LDE60:
       LDA    INTIM                   ;4
       BNE    LDE60                   ;2
       JMP    LDDA7                   ;3
LDE68:
       STA    $81                     ;3
       TAX                            ;2
       LDA    #$00                    ;2
       STA    AUDV0                   ;3
       STA    AUDV1                   ;3
       LDA    LDF20,X                 ;4
       STA    $FB                     ;3
       LDA    LDF23,X                 ;4
       STA    $FC                     ;3
       JMP    LDFEA                   ;3


       .byte $03 ; |      XX| $DE7E
       .byte $03 ; |      XX| $DE7F
       .byte $03 ; |      XX| $DE80
       .byte $07 ; |     XXX| $DE81
       .byte $07 ; |     XXX| $DE82
       .byte $07 ; |     XXX| $DE83
       .byte $03 ; |      XX| $DE84
       .byte $03 ; |      XX| $DE85
       .byte $03 ; |      XX| $DE86
       .byte $03 ; |      XX| $DE87
       .byte $03 ; |      XX| $DE88
       .byte $01 ; |       X| $DE89
       .byte $00 ; |        | $DE8A
       .byte $00 ; |        | $DE8B
       .byte $00 ; |        | $DE8C
       .byte $07 ; |     XXX| $DE8D
       .byte $07 ; |     XXX| $DE8E
       .byte $06 ; |     XX | $DE8F
       .byte $06 ; |     XX | $DE90
       .byte $06 ; |     XX | $DE91
       .byte $07 ; |     XXX| $DE92
       .byte $0F ; |    XXXX| $DE93
       .byte $06 ; |     XX | $DE94
       .byte $06 ; |     XX | $DE95
       .byte $06 ; |     XX | $DE96
       .byte $07 ; |     XXX| $DE97
       .byte $07 ; |     XXX| $DE98
       .byte $18 ; |   XX   | $DE99
       .byte $19 ; |   XX  X| $DE9A
       .byte $19 ; |   XX  X| $DE9B
       .byte $9B ; |X  XX XX| $DE9C
       .byte $FB ; |XXXXX XX| $DE9D
       .byte $FB ; |XXXXX XX| $DE9E
       .byte $7B ; | XXXX XX| $DE9F
       .byte $1B ; |   XX XX| $DEA0
       .byte $1B ; |   XX XX| $DEA1
       .byte $B9 ; |X XXX  X| $DEA2
       .byte $F9 ; |XXXXX  X| $DEA3
       .byte $F0 ; |XXXX    | $DEA4
       .byte $E0 ; |XXX     | $DEA5
       .byte $00 ; |        | $DEA6
       .byte $00 ; |        | $DEA7
       .byte $77 ; | XXX XXX| $DEA8
       .byte $77 ; | XXX XXX| $DEA9
       .byte $66 ; | XX  XX | $DEAA
       .byte $66 ; | XX  XX | $DEAB
       .byte $66 ; | XX  XX | $DEAC
       .byte $67 ; | XX  XXX| $DEAD
       .byte $6F ; | XX XXXX| $DEAE
       .byte $66 ; | XX  XX | $DEAF
       .byte $66 ; | XX  XX | $DEB0
       .byte $66 ; | XX  XX | $DEB1
       .byte $67 ; | XX  XXX| $DEB2
       .byte $67 ; | XX  XXX| $DEB3
       .byte $E1 ; |XXX    X| $DEB4
       .byte $F3 ; |XXXX  XX| $DEB5
       .byte $F3 ; |XXXX  XX| $DEB6
       .byte $B3 ; |X XX  XX| $DEB7
       .byte $03 ; |      XX| $DEB8
       .byte $03 ; |      XX| $DEB9
       .byte $03 ; |      XX| $DEBA
       .byte $03 ; |      XX| $DEBB
       .byte $B7 ; |X XX XXX| $DEBC
       .byte $F7 ; |XXXX XXX| $DEBD
       .byte $F7 ; |XXXX XXX| $DEBE
       .byte $E3 ; |XXX   XX| $DEBF
       .byte $03 ; |      XX| $DEC0
       .byte $03 ; |      XX| $DEC1
       .byte $00 ; |        | $DEC2
       .byte $11 ; |   X   X| $DEC3
       .byte $39 ; |  XXX  X| $DEC4
       .byte $39 ; |  XXX  X| $DEC5
       .byte $6D ; | XX XX X| $DEC6
       .byte $6D ; | XX XX X| $DEC7
       .byte $6D ; | XX XX X| $DEC8
       .byte $6D ; | XX XX X| $DEC9
       .byte $6D ; | XX XX X| $DECA
       .byte $6D ; | XX XX X| $DECB
       .byte $6D ; | XX XX X| $DECC
       .byte $6D ; | XX XX X| $DECD
       .byte $6C ; | XX XX  | $DECE
       .byte $B1 ; |X XX   X| $DECF
       .byte $B3 ; |X XX  XX| $DED0
       .byte $B3 ; |X XX  XX| $DED1
       .byte $37 ; |  XX XXX| $DED2
       .byte $36 ; |  XX XX | $DED3
       .byte $36 ; |  XX XX | $DED4
       .byte $35 ; |  XX X X| $DED5
       .byte $33 ; |  XX  XX| $DED6
       .byte $06 ; |     XX | $DED7
       .byte $B3 ; |X XX  XX| $DED8
       .byte $B3 ; |X XX  XX| $DED9
       .byte $B1 ; |X XX   X| $DEDA
       .byte $00 ; |        | $DEDB
       .byte $00 ; |        | $DEDC
       .byte $00 ; |        | $DEDD
       .byte $B3 ; |X XX  XX| $DEDE
       .byte $B3 ; |X XX  XX| $DEDF
       .byte $B3 ; |X XX  XX| $DEE0
       .byte $B3 ; |X XX  XX| $DEE1
       .byte $B3 ; |X XX  XX| $DEE2
       .byte $F3 ; |XXXX  XX| $DEE3
       .byte $F3 ; |XXXX  XX| $DEE4
       .byte $B3 ; |X XX  XX| $DEE5
       .byte $B3 ; |X XX  XX| $DEE6
       .byte $B3 ; |X XX  XX| $DEE7
       .byte $F7 ; |XXXX XXX| $DEE8
       .byte $E7 ; |XXX  XXX| $DEE9
       .byte $C6 ; |XX   XX | $DEEA
       .byte $E6 ; |XXX  XX | $DEEB
       .byte $E6 ; |XXX  XX | $DEEC
       .byte $76 ; | XXX XX | $DEED
       .byte $36 ; |  XX XX | $DEEE
       .byte $16 ; |   X XX | $DEEF
       .byte $E6 ; |XXX  XX | $DEF0
       .byte $F6 ; |XXXX XX | $DEF1
       .byte $3F ; |  XXXXXX| $DEF2
       .byte $FF ; |XXXXXXXX| $DEF3
       .byte $EF ; |XXX XXXX| $DEF4
       .byte $C6 ; |XX   XX | $DEF5
       .byte $00 ; |        | $DEF6
       .byte $00 ; |        | $DEF7
       .byte $00 ; |        | $DEF8
       .byte $39 ; |  XXX  X| $DEF9
       .byte $39 ; |  XXX  X| $DEFA
       .byte $6D ; | XX XX X| $DEFB
       .byte $6D ; | XX XX X| $DEFC
       .byte $6D ; | XX XX X| $DEFD
       .byte $6D ; | XX XX X| $DEFE
       .byte $6D ; | XX XX X| $DEFF
       .byte $6D ; | XX XX X| $DF00
       .byte $6D ; | XX XX X| $DF01
       .byte $6D ; | XX XX X| $DF02
       .byte $B9 ; |X XXX  X| $DF03
       .byte $B9 ; |X XXX  X| $DF04
       .byte $30 ; |  XX    | $DF05
       .byte $70 ; | XXX    | $DF06
       .byte $70 ; | XXX    | $DF07
       .byte $60 ; | XX     | $DF08
       .byte $60 ; | XX     | $DF09
       .byte $60 ; | XX     | $DF0A
       .byte $60 ; | XX     | $DF0B
       .byte $60 ; | XX     | $DF0C
       .byte $60 ; | XX     | $DF0D
       .byte $E0 ; |XXX     | $DF0E
       .byte $E0 ; |XXX     | $DF0F
       .byte $C0 ; |XX      | $DF10
       .byte $00 ; |        | $DF11
       .byte $00 ; |        | $DF12
       .byte $00 ; |        | $DF13
       .byte $B0 ; |X XX    | $DF14
       .byte $B0 ; |X XX    | $DF15
       .byte $B0 ; |X XX    | $DF16
       .byte $B0 ; |X XX    | $DF17
       .byte $B0 ; |X XX    | $DF18
       .byte $E0 ; |XXX     | $DF19
       .byte $E0 ; |XXX     | $DF1A
       .byte $B0 ; |X XX    | $DF1B
       .byte $B0 ; |X XX    | $DF1C
       .byte $B0 ; |X XX    | $DF1D
       .byte $F0 ; |XXXX    | $DF1E
       .byte $E0 ; |XXX     | $DF1F
LDF20:
       .byte $83 ; |X     XX| $DF20
       .byte $83 ; |X     XX| $DF21
       .byte $A7 ; |X X  XXX| $DF22
LDF23:
       .byte $DC ; |XX XXX  | $DF23
       .byte $DC ; |XX XXX  | $DF24
       .byte $DC ; |XX XXX  | $DF25
LDF26:
       .byte $B3 ; |X XX  XX| $DF26
       .byte $B3 ; |X XX  XX| $DF27
       .byte $66 ; | XX  XX | $DF28
LDF29:
       .byte $DB ; |XX XX XX| $DF29
       .byte $DB ; |XX XX XX| $DF2A
       .byte $F8 ; |XXXXX   | $DF2B
LDF2C:
       .byte $CD ; |XX  XX X| $DF2C
       .byte $CD ; |XX  XX X| $DF2D
       .byte $0B ; |    X XX| $DF2E
LDF2F:
       .byte $DB ; |XX XX XX| $DF2F
       .byte $DB ; |XX XX XX| $DF30
       .byte $D1 ; |XX X   X| $DF31
LDF32:
       .byte $2C ; |  X XX  | $DF32
       .byte $2C ; |  X XX  | $DF33
       .byte $15 ; |   X X X| $DF34
LDF35:
       .byte $DC ; |XX XXX  | $DF35
       .byte $DC ; |XX XXX  | $DF36
       .byte $F1 ; |XXXX   X| $DF37
       .byte $3C ; |  XXXX  | $DF38
       .byte $66 ; | XX  XX | $DF39
       .byte $66 ; | XX  XX | $DF3A
       .byte $66 ; | XX  XX | $DF3B
       .byte $66 ; | XX  XX | $DF3C
       .byte $66 ; | XX  XX | $DF3D
       .byte $3C ; |  XXXX  | $DF3E
       .byte $7E ; | XXXXXX | $DF3F
       .byte $18 ; |   XX   | $DF40
       .byte $18 ; |   XX   | $DF41
       .byte $18 ; |   XX   | $DF42
       .byte $18 ; |   XX   | $DF43
       .byte $78 ; | XXXX   | $DF44
       .byte $38 ; |  XXX   | $DF45
       .byte $7E ; | XXXXXX | $DF46
       .byte $60 ; | XX     | $DF47
       .byte $60 ; | XX     | $DF48
       .byte $3C ; |  XXXX  | $DF49
       .byte $06 ; |     XX | $DF4A
       .byte $46 ; | X   XX | $DF4B
       .byte $7C ; | XXXXX  | $DF4C
       .byte $3C ; |  XXXX  | $DF4D
       .byte $46 ; | X   XX | $DF4E
       .byte $06 ; |     XX | $DF4F
       .byte $0C ; |    XX  | $DF50
       .byte $06 ; |     XX | $DF51
       .byte $46 ; | X   XX | $DF52
       .byte $3C ; |  XXXX  | $DF53
       .byte $0C ; |    XX  | $DF54
       .byte $0C ; |    XX  | $DF55
       .byte $7E ; | XXXXXX | $DF56
       .byte $4C ; | X  XX  | $DF57
       .byte $2C ; |  X XX  | $DF58
       .byte $1C ; |   XXX  | $DF59
       .byte $0C ; |    XX  | $DF5A
       .byte $7C ; | XXXXX  | $DF5B
       .byte $46 ; | X   XX | $DF5C
       .byte $06 ; |     XX | $DF5D
       .byte $7C ; | XXXXX  | $DF5E
       .byte $60 ; | XX     | $DF5F
       .byte $60 ; | XX     | $DF60
       .byte $7E ; | XXXXXX | $DF61
       .byte $3C ; |  XXXX  | $DF62
       .byte $66 ; | XX  XX | $DF63
       .byte $66 ; | XX  XX | $DF64
       .byte $7C ; | XXXXX  | $DF65
       .byte $60 ; | XX     | $DF66
       .byte $62 ; | XX   X | $DF67
       .byte $3C ; |  XXXX  | $DF68
       .byte $18 ; |   XX   | $DF69
       .byte $18 ; |   XX   | $DF6A
       .byte $08 ; |    X   | $DF6B
       .byte $04 ; |     X  | $DF6C
       .byte $02 ; |      X | $DF6D
       .byte $62 ; | XX   X | $DF6E
       .byte $7E ; | XXXXXX | $DF6F
       .byte $3C ; |  XXXX  | $DF70
       .byte $66 ; | XX  XX | $DF71
       .byte $66 ; | XX  XX | $DF72
       .byte $3C ; |  XXXX  | $DF73
       .byte $66 ; | XX  XX | $DF74
       .byte $66 ; | XX  XX | $DF75
       .byte $3C ; |  XXXX  | $DF76
       .byte $3C ; |  XXXX  | $DF77
       .byte $46 ; | X   XX | $DF78
       .byte $06 ; |     XX | $DF79
       .byte $3E ; |  XXXXX | $DF7A
       .byte $66 ; | XX  XX | $DF7B
       .byte $66 ; | XX  XX | $DF7C
       .byte $3C ; |  XXXX  | $DF7D
       .byte $00 ; |        | $DF7E
       .byte $00 ; |        | $DF7F
       .byte $00 ; |        | $DF80
       .byte $00 ; |        | $DF81
       .byte $00 ; |        | $DF82
       .byte $00 ; |        | $DF83
       .byte $00 ; |        | $DF84
       .byte $3C ; |  XXXX  | $DF85
       .byte $3E ; |  XXXXX | $DF86
       .byte $76 ; | XXX XX | $DF87
       .byte $74 ; | XXX X  | $DF88
       .byte $7C ; | XXXXX  | $DF89
       .byte $7E ; | XXXXXX | $DF8A
       .byte $3F ; |  XXXXXX| $DF8B
       .byte $79 ; | XXXX  X| $DF8C
       .byte $85 ; |X    X X| $DF8D
       .byte $B5 ; |X XX X X| $DF8E
       .byte $A5 ; |X X  X X| $DF8F
       .byte $B5 ; |X XX X X| $DF90
       .byte $85 ; |X    X X| $DF91
       .byte $79 ; | XXXX  X| $DF92
       .byte $17 ; |   X XXX| $DF93
       .byte $15 ; |   X X X| $DF94
       .byte $15 ; |   X X X| $DF95
       .byte $77 ; | XXX XXX| $DF96
       .byte $55 ; | X X X X| $DF97
       .byte $55 ; | X X X X| $DF98
       .byte $77 ; | XXX XXX| $DF99
       .byte $71 ; | XXX   X| $DF9A
       .byte $51 ; | X X   X| $DF9B
       .byte $11 ; |   X   X| $DF9C
       .byte $71 ; | XXX   X| $DF9D
       .byte $11 ; |   X   X| $DF9E
       .byte $51 ; | X X   X| $DF9F
       .byte $70 ; | XXX    | $DFA0
       .byte $49 ; | X  X  X| $DFA1
       .byte $49 ; | X  X  X| $DFA2
       .byte $49 ; | X  X  X| $DFA3
       .byte $C9 ; |XX  X  X| $DFA4
       .byte $49 ; | X  X  X| $DFA5
       .byte $49 ; | X  X  X| $DFA6
       .byte $BE ; |X XXXXX | $DFA7
       .byte $55 ; | X X X X| $DFA8
       .byte $55 ; | X X X X| $DFA9
       .byte $55 ; | X X X X| $DFAA
       .byte $D9 ; |XX XX  X| $DFAB
       .byte $55 ; | X X X X| $DFAC
       .byte $55 ; | X X X X| $DFAD
       .byte $99 ; |X  XX  X| $DFAE
LDFAF:
       .byte $38 ; |  XXX   | $DFAF
       .byte $3F ; |  XXXXXX| $DFB0
       .byte $46 ; | X   XX | $DFB1
       .byte $4D ; | X  XX X| $DFB2
       .byte $54 ; | X X X  | $DFB3
       .byte $5B ; | X XX XX| $DFB4
       .byte $62 ; | XX   X | $DFB5
       .byte $69 ; | XX X  X| $DFB6
       .byte $70 ; | XXX    | $DFB7
       .byte $77 ; | XXX XXX| $DFB8
       .byte $7E ; | XXXXXX | $DFB9
LDFBA:
       .byte $7E ; | XXXXXX | $DFBA
       .byte $DF ; |XX XXXXX| $DFBB
       .byte $8C ; |X   XX  | $DFBC
       .byte $DF ; |XX XXXXX| $DFBD
       .byte $93 ; |X  X  XX| $DFBE
       .byte $DF ; |XX XXXXX| $DFBF
       .byte $9A ; |X  XX X | $DFC0
       .byte $DF ; |XX XXXXX| $DFC1
       .byte $A1 ; |X X    X| $DFC2
       .byte $DF ; |XX XXXXX| $DFC3
       .byte $A8 ; |X X X   | $DFC4
       .byte $DF ; |XX XXXXX| $DFC5
       .byte $00 ; |        | $DFC6
       .byte $00 ; |        | $DFC7
       .byte $00 ; |        | $DFC8
       .byte $00 ; |        | $DFC9
       .byte $00 ; |        | $DFCA
       .byte $00 ; |        | $DFCB
       .byte $00 ; |        | $DFCC
       .byte $00 ; |        | $DFCD
       .byte $00 ; |        | $DFCE
       .byte $00 ; |        | $DFCF
       .byte $00 ; |        | $DFD0
       .byte $00 ; |        | $DFD1
       .byte $00 ; |        | $DFD2
       .byte $00 ; |        | $DFD3
       .byte $00 ; |        | $DFD4
       .byte $00 ; |        | $DFD5
       .byte $00 ; |        | $DFD6
       .byte $00 ; |        | $DFD7
       .byte $00 ; |        | $DFD8
       .byte $00 ; |        | $DFD9
       .byte $00 ; |        | $DFDA
       .byte $00 ; |        | $DFDB
       .byte $00 ; |        | $DFDC
       .byte $00 ; |        | $DFDD
       .byte $00 ; |        | $DFDE
       .byte $00 ; |        | $DFDF
       .byte $00 ; |        | $DFE0
       .byte $00 ; |        | $DFE1
       .byte $00 ; |        | $DFE2
       .byte $00 ; |        | $DFE3
       .byte $00 ; |        | $DFE4
       .byte $00 ; |        | $DFE5
       .byte $00 ; |        | $DFE6
       .byte $00 ; |        | $DFE7
       .byte $00 ; |        | $DFE8
       .byte $00 ; |        | $DFE9


LDFEA:
       LDA    $FC                     ;3
       AND    #$F0                    ;2
       CMP    #$F0                    ;2
       BNE    LDFF5                   ;2
LDFF2:
       LDA    $FFF9                   ;4
LDFF5:
       JMP.ind ($FB)                  ;5


       ORG $1FF8
       RORG $DFF8

       .word 0,START2,START2,START2








       ORG $2000
       RORG $F000

LF000:
       .byte $00 ; |        | $F000
       .byte $00 ; |        | $F001
       .byte $00 ; |        | $F002
LF003:
       .byte $00 ; |        | $F003
LF004:
       .byte $00 ; |        | $F004
LF005:
       .byte $00 ; |        | $F005
       .byte $00 ; |        | $F006
       .byte $00 ; |        | $F007
LF008:
       .byte $00 ; |        | $F008
       .byte $00 ; |        | $F009
LF00A:
       .byte $00 ; |        | $F00A
LF00B:
       .byte $00 ; |        | $F00B
       .byte $00 ; |        | $F00C
       .byte $00 ; |        | $F00D
       .byte $00 ; |        | $F00E
       .byte $00 ; |        | $F00F
       .byte $00 ; |        | $F010
LF011:
       .byte $00 ; |        | $F011
LF012:
       .byte $00 ; |        | $F012
       .byte $00 ; |        | $F013
LF014:
       .byte $00 ; |        | $F014
LF015:
       .byte $00 ; |        | $F015
LF016:
       .byte $00 ; |        | $F016
LF017:
       .byte $00 ; |        | $F017
LF018:
       .byte $00 ; |        | $F018
LF019:
       .byte $00 ; |        | $F019
       .byte $00 ; |        | $F01A
       .byte $00 ; |        | $F01B
       .byte $00 ; |        | $F01C
       .byte $00 ; |        | $F01D
       .byte $00 ; |        | $F01E
LF01F:
       .byte $00 ; |        | $F01F
       .byte $00 ; |        | $F020
       .byte $00 ; |        | $F021
       .byte $00 ; |        | $F022
       .byte $00 ; |        | $F023
       .byte $00 ; |        | $F024
LF025:
       .byte $00 ; |        | $F025
       .byte $00 ; |        | $F026
       .byte $00 ; |        | $F027
       .byte $00 ; |        | $F028
       .byte $00 ; |        | $F029
       .byte $00 ; |        | $F02A
LF02B:
       .byte $00 ; |        | $F02B
       .byte $00 ; |        | $F02C
       .byte $00 ; |        | $F02D
       .byte $00 ; |        | $F02E
       .byte $00 ; |        | $F02F
       .byte $00 ; |        | $F030
LF031:
       .byte $00 ; |        | $F031
LF032:
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
LF03C:
       .byte $00 ; |        | $F03C
       .byte $00 ; |        | $F03D
       .byte $00 ; |        | $F03E
       .byte $00 ; |        | $F03F
       .byte $00 ; |        | $F040
       .byte $00 ; |        | $F041
       .byte $00 ; |        | $F042
       .byte $00 ; |        | $F043
       .byte $00 ; |        | $F044
       .byte $00 ; |        | $F045
LF046:
       .byte $00 ; |        | $F046
       .byte $00 ; |        | $F047
LF048:
       .byte $00 ; |        | $F048
       .byte $00 ; |        | $F049
LF04A:
       .byte $00 ; |        | $F04A
       .byte $00 ; |        | $F04B
LF04C:
       .byte $00 ; |        | $F04C
LF04D:
       .byte $00 ; |        | $F04D
LF04E:
       .byte $00 ; |        | $F04E
       .byte $00 ; |        | $F04F
LF050:
       .byte $00 ; |        | $F050
       .byte $00 ; |        | $F051
LF052:
       .byte $00 ; |        | $F052
LF053:
       .byte $00 ; |        | $F053
       .byte $00 ; |        | $F054
LF055:
       .byte $00 ; |        | $F055
       .byte $00 ; |        | $F056
LF057:
       .byte $00 ; |        | $F057
LF058:
       .byte $00 ; |        | $F058
LF059:
       .byte $00 ; |        | $F059
LF05A:
       .byte $00 ; |        | $F05A
       .byte $00 ; |        | $F05B
LF05C:
       .byte $00 ; |        | $F05C
       .byte $00 ; |        | $F05D
LF05E:
       .byte $00 ; |        | $F05E
       .byte $00 ; |        | $F05F
LF060:
       .byte $00 ; |        | $F060
       .byte $00 ; |        | $F061
LF062:
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
LF080:
       .byte $00 ; |        | $F080
       .byte $00 ; |        | $F081
       .byte $00 ; |        | $F082
LF083:
       .byte $00 ; |        | $F083
LF084:
       .byte $00 ; |        | $F084
LF085:
       .byte $00 ; |        | $F085
LF086:
       .byte $00 ; |        | $F086
LF087:
       .byte $00 ; |        | $F087
LF088:
       .byte $00 ; |        | $F088
       .byte $00 ; |        | $F089
LF08A:
       .byte $00 ; |        | $F08A
LF08B:
       .byte $00 ; |        | $F08B
       .byte $00 ; |        | $F08C
       .byte $00 ; |        | $F08D
       .byte $00 ; |        | $F08E
       .byte $00 ; |        | $F08F
       .byte $00 ; |        | $F090
LF091:
       .byte $00 ; |        | $F091
LF092:
       .byte $00 ; |        | $F092
LF093:
       .byte $00 ; |        | $F093
LF094:
       .byte $00 ; |        | $F094
LF095:
       .byte $00 ; |        | $F095
LF096:
       .byte $00 ; |        | $F096
LF097:
       .byte $00 ; |        | $F097
LF098:
       .byte $00 ; |        | $F098
LF099:
       .byte $00 ; |        | $F099
       .byte $00 ; |        | $F09A
       .byte $00 ; |        | $F09B
       .byte $00 ; |        | $F09C
       .byte $00 ; |        | $F09D
       .byte $00 ; |        | $F09E
LF09F:
       .byte $00 ; |        | $F09F
       .byte $00 ; |        | $F0A0
       .byte $00 ; |        | $F0A1
       .byte $00 ; |        | $F0A2
       .byte $00 ; |        | $F0A3
       .byte $00 ; |        | $F0A4
LF0A5:
       .byte $00 ; |        | $F0A5
       .byte $00 ; |        | $F0A6
       .byte $00 ; |        | $F0A7
       .byte $00 ; |        | $F0A8
       .byte $00 ; |        | $F0A9
       .byte $00 ; |        | $F0AA
LF0AB:
       .byte $00 ; |        | $F0AB
       .byte $00 ; |        | $F0AC
       .byte $00 ; |        | $F0AD
       .byte $00 ; |        | $F0AE
       .byte $00 ; |        | $F0AF
       .byte $00 ; |        | $F0B0
LF0B1:
       .byte $00 ; |        | $F0B1
LF0B2:
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
LF0BC:
       .byte $00 ; |        | $F0BC
       .byte $00 ; |        | $F0BD
       .byte $00 ; |        | $F0BE
       .byte $00 ; |        | $F0BF
       .byte $00 ; |        | $F0C0
       .byte $00 ; |        | $F0C1
       .byte $00 ; |        | $F0C2
       .byte $00 ; |        | $F0C3
       .byte $00 ; |        | $F0C4
LF0C5:
       .byte $00 ; |        | $F0C5
LF0C6:
       .byte $00 ; |        | $F0C6
       .byte $00 ; |        | $F0C7
LF0C8:
       .byte $00 ; |        | $F0C8
       .byte $00 ; |        | $F0C9
LF0CA:
       .byte $00 ; |        | $F0CA
       .byte $00 ; |        | $F0CB
       .byte $00 ; |        | $F0CC
LF0CD:
       .byte $00 ; |        | $F0CD
LF0CE:
       .byte $00 ; |        | $F0CE
       .byte $00 ; |        | $F0CF
       .byte $00 ; |        | $F0D0
       .byte $00 ; |        | $F0D1
LF0D2:
       .byte $00 ; |        | $F0D2
LF0D3:
       .byte $00 ; |        | $F0D3
       .byte $00 ; |        | $F0D4
       .byte $00 ; |        | $F0D5
       .byte $00 ; |        | $F0D6
LF0D7:
       .byte $00 ; |        | $F0D7
LF0D8:
       .byte $00 ; |        | $F0D8
LF0D9:
       .byte $00 ; |        | $F0D9
       .byte $00 ; |        | $F0DA
       .byte $00 ; |        | $F0DB
       .byte $00 ; |        | $F0DC
       .byte $00 ; |        | $F0DD
LF0DE:
       .byte $00 ; |        | $F0DE
       .byte $00 ; |        | $F0DF
LF0E0:
       .byte $00 ; |        | $F0E0
       .byte $00 ; |        | $F0E1
LF0E2:
       .byte $00 ; |        | $F0E2
       .byte $00 ; |        | $F0E3
       .byte $00 ; |        | $F0E4
       .byte $00 ; |        | $F0E5
       .byte $00 ; |        | $F0E6
       .byte $00 ; |        | $F0E7
       .byte $00 ; |        | $F0E8
       .byte $00 ; |        | $F0E9
       .byte $00 ; |        | $F0EA
       .byte $00 ; |        | $F0EB
       .byte $00 ; |        | $F0EC
       .byte $00 ; |        | $F0ED
       .byte $00 ; |        | $F0EE
       .byte $00 ; |        | $F0EF
       .byte $00 ; |        | $F0F0
       .byte $00 ; |        | $F0F1
       .byte $00 ; |        | $F0F2
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
       .byte $00 ; |        | $F0FD
       .byte $00 ; |        | $F0FE
       .byte $00 ; |        | $F0FF

START2:
       CLD                            ;2
       SEI                            ;2
       LDX    #$FF                    ;2
       TXS                            ;2
       INX                            ;2
       LDA    #$00                    ;2
LF108:
       STA    VSYNC,X                 ;4
       INX                            ;2
       BNE    LF108                   ;2
       LDA    #$0D                    ;2
       STA    $8D                     ;3
       TXA                            ;2
       JMP    LFDEF                   ;3
       LDA    SWCHA                   ;4
       LDX    $82                     ;3
       BEQ    LF120                   ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
LF120:
       STA    $8E                     ;3
       LDA    $AA                     ;3
       CMP    #$32                    ;2
       BEQ    LF132                   ;2
       LDA    $85                     ;3
       ROR                            ;2
       ROR                            ;2
       BCC    LF132                   ;2
       INC    $AA                     ;5
       INC    $AA                     ;5
LF132:
       LDA    $A0                     ;3
       CMP    #$04                    ;2
       BNE    LF170                   ;2
       LDA    $A9                     ;3
       CMP    #$0E                    ;2
       BCS    LF170                   ;2
       LDX    $82                     ;3
       INC    $83,X                   ;6
       LDA    #$22                    ;2
       STA    LF05C,X                 ;5
       LDA    #$30                    ;2
       STA    LF05A,X                 ;5
       LDA    LF0DE,X                 ;4
       SED                            ;2
       ADC    #$01                    ;2
       CLD                            ;2
       STA    LF05E,X                 ;5
       CMP    #$10                    ;2
       BCC    LF15C                   ;2
       LDA    #$09                    ;2
LF15C:
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       JSR    LFD70                   ;6
       LDX    $82                     ;3
       LDA    LFB26,X                 ;4
       JSR    LFCD5                   ;6
       LDA    #$02                    ;2
       JMP    LFDEF                   ;3
LF170:
       LDA    CXM1P                   ;3
       BPL    LF187                   ;2
       LDA    $85                     ;3
       AND    #$01                    ;2
       TAX                            ;2
       LDA    #$00                    ;2
       STA    LF048,X                 ;5
       LDA    #$FF                    ;2
       STA    LF050,X                 ;5
       LDA    #$08                    ;2
       STA    $9F                     ;3
LF187:
       LDA    $9F                     ;3
       CMP    #$0C                    ;2
       BNE    LF1C0                   ;2
       LDX    $82                     ;3
       LDA    $A1                     ;3
       STA    LF05A,X                 ;5
       LDA    $A0                     ;3
       STA    LF05C,X                 ;5
       DEC    $83,X                   ;6
       LDA    $80                     ;3
       ROR                            ;2
       BCC    LF1B1                   ;2
       LDA    $82                     ;3
       EOR    #$01                    ;2
       STA    $82                     ;3
       TAX                            ;2
       LDA    $83,X                   ;4
       BNE    LF1B1                   ;2
       LDA    $82                     ;3
       EOR    #$01                    ;2
       STA    $82                     ;3
LF1B1:
       LDA    $83                     ;3
       ORA    $84                     ;3
       BNE    LF1BB                   ;2
       LDA    #$01                    ;2
       BNE    LF1BD                   ;2
LF1BB:
       LDA    #$02                    ;2
LF1BD:
       JMP    LFDEF                   ;3
LF1C0:
       LDA    CXPPMM                  ;3
       BPL    LF1F6                   ;2
       LDA    $C1                     ;3
       CMP    #$34                    ;2
       BNE    LF1F6                   ;2
       LDX    #$00                    ;2
       LDA    $82                     ;3
       BEQ    LF1D2                   ;2
       LDX    #$05                    ;2
LF1D2:
       LDY    #$05                    ;2
       LDA    $A0                     ;3
       SEC                            ;2
       SBC    #$01                    ;2
       STA    $9C                     ;3
LF1DB:
       LDA    LF0BC,X                 ;4
       CMP    $9C                     ;3
       BNE    LF1F2                   ;2
       LDA    #$7F                    ;2
       AND    LF0B2,X                 ;4
       STA    LF032,X                 ;5
       LDA    #$05                    ;2
       JSR    LFD70                   ;6
       JMP    LF1F6                   ;3
LF1F2:
       INX                            ;2
       DEY                            ;2
       BNE    LF1DB                   ;2
LF1F6:
       LDA    CXM0P                   ;3
       BPL    LF238                   ;2
       LDX    #$00                    ;2
LF1FC:
       LDA    $CA,X                   ;4
       BPL    LF233                   ;2
       LDA    $C0,X                   ;4
       CMP    #$34                    ;2
       BEQ    LF238                   ;2
       LDA    LF084,X                 ;4
       AND    #$7F                    ;2
       CMP    #$0B                    ;2
       BCC    LF213                   ;2
       CMP    #$0E                    ;2
       BCC    LF222                   ;2
LF213:
       LDA    LF084,X                 ;4
       AND    #$80                    ;2
       ORA    #$0B                    ;2
       STA    LF004,X                 ;5
       LDA    #$01                    ;2
       JSR    LFD70                   ;6
LF222:
       LDA    $85                     ;3
       AND    #$01                    ;2
       TAX                            ;2
       LDA    #$00                    ;2
       STA    LF046,X                 ;5
       LDA    #$FF                    ;2
       STA    LF04E,X                 ;5
       BNE    LF238                   ;2
LF233:
       INX                            ;2
       CPX    #$04                    ;2
       BNE    LF1FC                   ;2
LF238:
       LDX    #$03                    ;2
LF23A:
       LDY    LF0CA,X                 ;4
       LDA    LF0C6,X                 ;4
       BEQ    LF29D                   ;2
       CPX    #$02                    ;2
       BCS    LF255                   ;2
       LDA    LF0E0,X                 ;4
       CMP    #$0B                    ;2
       BNE    LF255                   ;2
       CPY    #$58                    ;2
       BEQ    LF28E                   ;2
       CPY    #$3E                    ;2
       BEQ    LF28E                   ;2
LF255:
       LDA    LF0C6,X                 ;4
       BMI    LF274                   ;2
       LDA    LF0D3,X                 ;4
       CPY    #$98                    ;2
       BCS    LF293                   ;2
       AND    #$03                    ;2
       BEQ    LF29D                   ;2
       ROR                            ;2
       BCC    LF26E                   ;2
       CPY    #$8B                    ;2
       BCS    LF293                   ;2
       BCC    LF29D                   ;2
LF26E:
       CPY    #$48                    ;2
       BNE    LF29D                   ;2
       BEQ    LF293                   ;2
LF274:
       LDA    LF0D3,X                 ;4
       CPY    #$01                    ;2
       BCC    LF293                   ;2
       AND    #$03                    ;2
       BEQ    LF29D                   ;2
       ROR                            ;2
       BCC    LF288                   ;2
       CPY    #$0E                    ;2
       BCC    LF293                   ;2
       BCS    LF29D                   ;2
LF288:
       CPY    #$50                    ;2
       BNE    LF29D                   ;2
       BEQ    LF293                   ;2
LF28E:
       LDA    #$FF                    ;2
       STA    LF062                   ;4
LF293:
       LDA    #$00                    ;2
       STA    LF046,X                 ;5
       LDA    #$FF                    ;2
       STA    LF04E,X                 ;5
LF29D:
       DEX                            ;2
       BPL    LF23A                   ;2
       LDA    LF08A                   ;4
       SEC                            ;2
       SBC    #$01                    ;2
       STA    LF00A                   ;4
       BEQ    LF2AE                   ;2
       JMP    LF2F0                   ;3
LF2AE:
       LDX    #$01                    ;2
       LDA    LF085                   ;4
       BEQ    LF2BF                   ;2
       LDA    $8D                     ;3
       AND    #$03                    ;2
       TAX                            ;2
       LDA    LF084,X                 ;4
       BNE    LF2E8                   ;2
LF2BF:
       STX    $9C                     ;3
       SEC                            ;2
       LDA    $A0                     ;3
       SBC    $9C                     ;3
       TAY                            ;2
       LDA    LFC46,Y                 ;4
       STA    $9C                     ;3
       LDA    $8D                     ;3
       EOR    $85                     ;3
       AND    #$03                    ;2
       TAY                            ;2
       LDA    LFBC8,Y                 ;4
       CLC                            ;2
       ADC    $9C                     ;3
       TAY                            ;2
       LDA    LFBCC,Y                 ;4
       CMP    #$01                    ;2
       BEQ    LF2E8                   ;2
       STA    $C5,X                   ;4
       LDA    #$01                    ;2
       STA    LF004,X                 ;5
LF2E8:
       LDA    $8D                     ;3
       LSR                            ;2
       ORA    #$08                    ;2
       STA    LF00A                   ;4
LF2F0:
       LDA    LF097                   ;4
       CMP    #$FE                    ;2
       BEQ    LF35D                   ;2
       LDX    $A0                     ;3
       LDA    LFC45,X                 ;4
       TAX                            ;2
       LDA    LFBB6,X                 ;4
       STA    $9C                     ;3
       AND    #$0C                    ;2
       BEQ    LF32E                   ;2
       AND    #$04                    ;2
       BEQ    LF32A                   ;2
       LDA    $8E                     ;3
       AND    #$20                    ;2
       BNE    LF32A                   ;2
       LDA    $A9                     ;3
       CMP    #$04                    ;2
       BCS    LF31A                   ;2
       LDA    #$01                    ;2
       BNE    LF320                   ;2
LF31A:
       CMP    #$90                    ;2
       BCC    LF38A                   ;2
       LDA    #$FF                    ;2
LF320:
       STA    LF057                   ;4
       LDA    #$02                    ;2
       STA    LF058                   ;4
       BNE    LF356                   ;2
LF32A:
       LDA    $9C                     ;3
       AND    #$08                    ;2
LF32E:
       BEQ    LF38A                   ;2
       LDA    $8E                     ;3
       AND    #$10                    ;2
       BNE    LF38A                   ;2
       LDA    $A9                     ;3
       CMP    #$17                    ;2
       BCS    LF344                   ;2
       CMP    #$14                    ;2
       BCC    LF38A                   ;2
       LDA    #$FF                    ;2
       BNE    LF34E                   ;2
LF344:
       CMP    #$7B                    ;2
       BCC    LF38A                   ;2
       CMP    #$7F                    ;2
       BCS    LF38A                   ;2
       LDA    #$01                    ;2
LF34E:
       STA    LF057                   ;4
       LDA    #$FE                    ;2
       STA    LF058                   ;4
LF356:
       LDA    #$FE                    ;2
       STA    LF017                   ;4
       BNE    LF37A                   ;2
LF35D:
       LDA    LF0D9                   ;4
       CLC                            ;2
       ADC    #$3A                    ;2
       STA    LF059                   ;4
       BCS    LF36B                   ;2
       JMP    LF5BE                   ;3
LF36B:
       LDA    $A9                     ;3
       CLC                            ;2
       ADC    LF0D7                   ;4
       STA    $A9                     ;3
       LDA    LF096                   ;4
       CMP    #$13                    ;2
       BEQ    LF385                   ;2
LF37A:
       LDA    LF0D8                   ;4
       BMI    LF382                   ;2
       JMP    LF496                   ;3
LF382:
       JMP    LF419                   ;3
LF385:
       LDA    #$FF                    ;2
       STA    LF017                   ;4
LF38A:
       LDX    $A0                     ;3
       LDA    LFC10,X                 ;4
       AND    #$7F                    ;2
       BEQ    LF3CE                   ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       BEQ    LF3A4                   ;2
       TAY                            ;2
       LDA    $A9                     ;3
       CMP    #$06                    ;2
       BCC    LF3B6                   ;2
       CMP    #$8D                    ;2
       BCS    LF3B6                   ;2
LF3A4:
       LDA    LFC10,X                 ;4
       AND    #$0F                    ;2
       BEQ    LF3CE                   ;2
       TAY                            ;2
       LDA    $A9                     ;3
       CMP    #$46                    ;2
       BCC    LF3CE                   ;2
       CMP    #$4E                    ;2
       BCS    LF3CE                   ;2
LF3B6:
       DEY                            ;2
       LDA    LF097                   ;4
       BPL    LF3D3                   ;2
       LDA    LF0A5,Y                 ;4
       BNE    LF3CE                   ;2
       LDA    LF0AB,Y                 ;4
       CMP    $A0                     ;3
       BNE    LF3CE                   ;2
       STY    LF017                   ;4
       JMP    LF3D3                   ;3
LF3CE:
       LDA    #$FF                    ;2
       STA    LF017                   ;4
LF3D3:
       LDA    #$00                    ;2
       STA    LF018                   ;4
       LDA    $85                     ;3
       AND    #$03                    ;2
       BEQ    LF3E1                   ;2
LF3DE:
       JMP    LF4F7                   ;3
LF3E1:
       LDA    LF0E2                   ;4
       BEQ    LF3EC                   ;2
       SEC                            ;2
       SBC    #$01                    ;2
       STA    LF062                   ;4
LF3EC:
       LDY    LF097                   ;4
       BPL    LF3FB                   ;2
       LDA    LF096                   ;4
       CMP    #$13                    ;2
       BEQ    LF3DE                   ;2
       JMP    LF496                   ;3
LF3FB:
       LDA    #$10                    ;2
       AND    $8E                     ;3
       BEQ    LF404                   ;2
       JMP    LF476                   ;3
LF404:
       LDA    LF0A5,Y                 ;4
       BNE    LF411                   ;2
       LDA    LF0AB,Y                 ;4
       CMP    LFC39,Y                 ;4
       BEQ    LF3DE                   ;2
LF411:
       LDA    #$FF                    ;2
       STA    LF019,Y                 ;5
       STA    LF018                   ;4
LF419:
       LDX    #$04                    ;2
LF41B:
       LDA    LF0C5,X                 ;4
       BEQ    LF429                   ;2
       LDA    LF0CD,X                 ;4
       CLC                            ;2
       ADC    #$02                    ;2
       STA    LF04D,X                 ;5
LF429:
       CLC                            ;2
       LDA    LF091,X                 ;4
       ADC    #$02                    ;2
       STA    LF011,X                 ;5
       DEX                            ;2
       BEQ    LF429                   ;2
       BPL    LF41B                   ;2
       CLC                            ;2
       LDA    LF096                   ;4
       ADC    #$01                    ;2
       STA    LF016                   ;4
       CMP    #$14                    ;2
       BNE    LF473                   ;2
       LDA    #$FF                    ;2
       STA    LF016                   ;4
       LDX    #$03                    ;2
LF44B:
       LDA    LF091,X                 ;4
       STA    LF012,X                 ;5
       LDA    LF084,X                 ;4
       STA    LF005,X                 ;5
       LDA    $C5,X                   ;4
       STA    $C6,X                   ;4
       DEX                            ;2
       BPL    LF44B                   ;2
       LDA    #$00                    ;2
       STA    LF004                   ;4
       LDA    #$FC                    ;2
       STA    LF011                   ;4
       LDA    $A1                     ;3
       CLC                            ;2
       SED                            ;2
       ADC    #$01                    ;2
       STA    $A1                     ;3
       CLD                            ;2
       INC    $A0                     ;5
LF473:
       JMP    LF4F7                   ;3
LF476:
       LDA    #$20                    ;2
       AND    $8E                     ;3
       BEQ    LF47F                   ;2
LF47C:
       JMP    LF4F7                   ;3
LF47F:
       LDA    LF0A5,Y                 ;4
       BNE    LF48C                   ;2
       LDA    LF0AB,Y                 ;4
       CMP    LFC33,Y                 ;4
       BEQ    LF47C                   ;2
LF48C:
       LDA    #$00                    ;2
       STA    LF019,Y                 ;5
       LDA    #$FF                    ;2
       STA    LF018                   ;4
LF496:
       LDX    #$04                    ;2
LF498:
       LDA    LF0C5,X                 ;4
       BEQ    LF4A6                   ;2
       LDA    LF0CD,X                 ;4
       SEC                            ;2
       SBC    #$02                    ;2
       STA    LF04D,X                 ;5
LF4A6:
       LDA    LF091,X                 ;4
       SEC                            ;2
       SBC    #$02                    ;2
       STA    LF011,X                 ;5
       DEX                            ;2
       BEQ    LF4A6                   ;2
       BPL    LF498                   ;2
       SEC                            ;2
       LDA    LF096                   ;4
       SBC    #$01                    ;2
       STA    LF016                   ;4
       CMP    #$FE                    ;2
       BNE    LF4F7                   ;2
       LDA    #$13                    ;2
       STA    LF016                   ;4
       LDX    #$00                    ;2
LF4C8:
       LDA    LF092,X                 ;4
       STA    LF011,X                 ;5
       LDA    LF085,X                 ;4
       STA    LF004,X                 ;5
       LDA    $C6,X                   ;4
       STA    $C5,X                   ;4
       INX                            ;2
       CPX    #$04                    ;2
       BNE    LF4C8                   ;2
       LDA    #$00                    ;2
       STA    LF008                   ;4
       LDA    #$A2                    ;2
       STA    LF014                   ;4
       LDA    #$CC                    ;2
       STA    LF015                   ;4
       LDA    $A1                     ;3
       SED                            ;2
       SEC                            ;2
       SBC    #$01                    ;2
       STA    $A1                     ;3
       CLD                            ;2
       DEC    $A0                     ;5
LF4F7:
       LDA    #$A3                    ;2
       LDX    $9F                     ;3
       CPX    #$08                    ;2
       BCC    LF501                   ;2
       LDA    #$11                    ;2
LF501:
       CLC                            ;2
       ADC    $AB                     ;3
       STA    $AB                     ;3
       BCS    LF50B                   ;2
       JMP    LF5BE                   ;3
LF50B:
       LDX    #$01                    ;2
       LDA    LF097                   ;4
       CMP    #$FF                    ;2
       BNE    LF531                   ;2
       LDA    $8E                     ;3
       AND    #$20                    ;2
       BNE    LF520                   ;2
       LDA    #$05                    ;2
       STA    $9F                     ;3
       BNE    LF52E                   ;2
LF520:
       LDA    $8E                     ;3
       AND    #$10                    ;2
       BNE    LF531                   ;2
       LDA    #$06                    ;2
       STA    $9F                     ;3
       LDA    #$28                    ;2
       STA    $AA                     ;3
LF52E:
       JMP    LF5B7                   ;3
LF531:
       LDA    LF097                   ;4
       BMI    LF53E                   ;2
       LDA    LF0A5,Y                 ;4
       CMP    #$0B                    ;2
       BCC    LF53E                   ;2
       DEX                            ;2
LF53E:
       LDY    $A0                     ;3
       DEY                            ;2
       LDA    LFC46,Y                 ;4
       TAY                            ;2
       LDA    LFBB6,Y                 ;4
       STA    $9E                     ;3
       LDA    #$80                    ;2
       AND    $8E                     ;3
       BNE    LF57B                   ;2
       CPX    #$00                    ;2
       BEQ    LF56C                   ;2
       LDY    $A9                     ;3
       LDA    $9E                     ;3
       ROR                            ;2
       BCC    LF55F                   ;2
       CPY    #$85                    ;2
       BCS    LF56C                   ;2
LF55F:
       ROR                            ;2
       BCC    LF566                   ;2
       CPY    #$40                    ;2
       BEQ    LF56C                   ;2
LF566:
       CPY    #$90                    ;2
       BCS    LF56C                   ;2
       INC    $A9                     ;5
LF56C:
       LDA    #$00                    ;2
       STA    LF000                   ;4
       LDA    $9F                     ;3
       BNE    LF577                   ;2
       LDA    #$01                    ;2
LF577:
       STA    $9F                     ;3
       BNE    LF5B7                   ;2
LF57B:
       LDA    #$40                    ;2
       AND    $8E                     ;3
       BNE    LF5AD                   ;2
       CPX    #$00                    ;2
       BEQ    LF59D                   ;2
       LDY    $A9                     ;3
       LDA    $9E                     ;3
       ROR                            ;2
       BCC    LF590                   ;2
       CPY    #$0E                    ;2
       BCC    LF59D                   ;2
LF590:
       ROR                            ;2
       BCC    LF597                   ;2
       CPY    #$52                    ;2
       BEQ    LF59D                   ;2
LF597:
       CPY    #$01                    ;2
       BCC    LF59D                   ;2
       DEC    $A9                     ;5
LF59D:
       LDA    #$08                    ;2
       STA    LF000                   ;4
       LDA    $9F                     ;3
       BNE    LF5A8                   ;2
       LDA    #$01                    ;2
LF5A8:
       STA    $9F                     ;3
       JMP    LF5B7                   ;3
LF5AD:
       LDA    $9F                     ;3
       CMP    #$08                    ;2
       BCS    LF5B7                   ;2
       LDA    #$00                    ;2
       STA    $9F                     ;3
LF5B7:
       LDX    $9F                     ;3
       LDA    LFB28,X                 ;4
       STA    $9F                     ;3
LF5BE:
       LDX    #$05                    ;2
LF5C0:
       CPX    LF097                   ;4
       BNE    LF5CC                   ;2
       LDA    LF098                   ;4
       BNE    LF614                   ;2
       BEQ    LF5E5                   ;2
LF5CC:
       LDA    LF0A5,X                 ;4
       BNE    LF609                   ;2
       CPX    #$04                    ;2
       BCC    LF5F6                   ;2
       BNE    LF5E8                   ;2
       LDA    LF0AB,X                 ;4
       CMP    LFC39,X                 ;4
       BNE    LF5F6                   ;2
       LDA    $A0                     ;3
       CMP    #$0E                    ;2
       BCS    LF5F6                   ;2
LF5E5:
       JMP    LF67F                   ;3
LF5E8:
       LDA    LF0AB,X                 ;4
       CMP    LFC33,X                 ;4
       BNE    LF5F6                   ;2
       LDA    $A0                     ;3
       CMP    #$0E                    ;2
       BCS    LF5E5                   ;2
LF5F6:
       LDA    $85                     ;3
       AND    #$03                    ;2
       BNE    LF5E5                   ;2
       LDA    LF09F,X                 ;4
       SEC                            ;2
       SBC    #$01                    ;2
       STA    LF01F,X                 ;5
       BNE    LF67F                   ;2
       BEQ    LF614                   ;2
LF609:
       LDA    LF09F,X                 ;4
       CLC                            ;2
       ADC    #$23                    ;2
       STA    LF01F,X                 ;5
       BCC    LF67F                   ;2
LF614:
       LDA    LF099,X                 ;4
       BMI    LF655                   ;2
       LDA    LF0A5,X                 ;4
       SEC                            ;2
       SBC    #$02                    ;2
       STA    LF025,X                 ;5
       BNE    LF62C                   ;2
       LDA    #$1F                    ;2
       STA    LF01F,X                 ;5
       JMP    LF67F                   ;3
LF62C:
       BPL    LF67F                   ;2
       LDA    #$28                    ;2
       STA    LF025,X                 ;5
       LDA    LF0AB,X                 ;4
       SEC                            ;2
       SBC    #$01                    ;2
       STA    LF02B,X                 ;5
       CMP    LFC33,X                 ;4
       BCS    LF67F                   ;2
       LDA    #$01                    ;2
       STA    LF025,X                 ;5
       LDA    LF0AB,X                 ;4
       ADC    #$01                    ;2
       STA    LF02B,X                 ;5
       LDA    #$FF                    ;2
       STA    LF019,X                 ;5
       BNE    LF67F                   ;2
LF655:
       CLC                            ;2
       LDA    LF0A5,X                 ;4
       ADC    #$02                    ;2
       STA    LF025,X                 ;5
       CMP    #$2A                    ;2
       BCC    LF67F                   ;2
       LDA    #$00                    ;2
       STA    LF025,X                 ;5
       LDA    #$1F                    ;2
       STA    LF01F,X                 ;5
       LDA    LF0AB,X                 ;4
       CLC                            ;2
       ADC    #$01                    ;2
       STA    LF02B,X                 ;5
       CMP    LFC39,X                 ;4
       BCC    LF67F                   ;2
       LDA    #$00                    ;2
       STA    LF019,X                 ;5
LF67F:
       DEX                            ;2
       BMI    LF685                   ;2
       JMP    LF5C0                   ;3
LF685:
       LDX    #$05                    ;2
LF687:
       CPX    LF0B1                   ;4
       BEQ    LF6F4                   ;2
LF68C:
       LDA    $A0                     ;3
       CLC                            ;2
       ADC    #$01                    ;2
       CMP    LF0AB,X                 ;4
       BCC    LF6E8                   ;2
       CMP    #$07                    ;2
       BCC    LF6A2                   ;2
       SEC                            ;2
       SBC    #$06                    ;2
       CMP    LF0AB,X                 ;4
       BCS    LF6E8                   ;2
LF6A2:
       LDA    $A0                     ;3
       CLC                            ;2
       ADC    #$01                    ;2
       SEC                            ;2
       SBC    LF0AB,X                 ;4
       TAY                            ;2
       LDA    LFC3F,Y                 ;4
       STA    $9C                     ;3
       LDA    LF096                   ;4
       CLC                            ;2
       ADC    #$01                    ;2
       ASL                            ;2
       CLC                            ;2
       ADC    $9C                     ;3
       CMP    LF0A5,X                 ;4
       BCC    LF6F4                   ;2
       SEC                            ;2
       SBC    LF0A5,X                 ;4
       CMP    #$D0                    ;2
       BCS    LF6F4                   ;2
LF6C8:
       CPX    #$04                    ;2
       BCS    LF6F8                   ;2
       DEX                            ;2
       BPL    LF6D1                   ;2
       LDX    #$03                    ;2
LF6D1:
       STX    LF031                   ;4
       AND    #$FE                    ;2
       STA    $9C                     ;3
       LDA    #$F4                    ;2
       SEC                            ;2
       SBC    $9C                     ;3
       STA    $EF                     ;3
       LDA    #$D8                    ;2
       SBC    #$00                    ;2
       STA    $F0                     ;3
       JMP    LF70D                   ;3
LF6E8:
       CPX    #$04                    ;2
       BEQ    LF6F4                   ;2
       DEX                            ;2
       BPL    LF687                   ;2
       LDX    #$03                    ;2
       JMP    LF687                   ;3
LF6F4:
       LDA    #$D0                    ;2
       BNE    LF6C8                   ;2
LF6F8:
       STA    $9C                     ;3
       LDA    #$16                    ;2
       SEC                            ;2
       SBC    $9C                     ;3
       STA    $ED                     ;3
       LDA    #$D8                    ;2
       SBC    #$00                    ;2
       STA    $EE                     ;3
       LDX    LF0B1                   ;4
       JMP    LF68C                   ;3
LF70D:
       LDA    #$B5                    ;2
       SEC                            ;2
       SBC    LF091                   ;4
       STA    $B6                     ;3
       LDA    #$D9                    ;2
       SBC    #$00                    ;2
       STA    $B7                     ;3
       LDA    #$B5                    ;2
       SEC                            ;2
       SBC    LF092                   ;4
       STA    $B8                     ;3
       LDA    #$D9                    ;2
       SBC    #$00                    ;2
       STA    $B9                     ;3
       LDA    #$B5                    ;2
       SEC                            ;2
       SBC    LF093                   ;4
       STA    $BA                     ;3
       LDA    #$D9                    ;2
       SBC    #$00                    ;2
       STA    $BB                     ;3
       LDA    #$B5                    ;2
       SEC                            ;2
       SBC    LF094                   ;4
       STA    $BC                     ;3
       LDA    #$D9                    ;2
       SBC    #$00                    ;2
       STA    $BD                     ;3
       LDA    #$B5                    ;2
       SEC                            ;2
       SBC    LF095                   ;4
       STA    $BE                     ;3
       LDA    #$D9                    ;2
       SBC    #$00                    ;2
       STA    $BF                     ;3
       LDA    LF084                   ;4
       AND    #$7F                    ;2
       TAX                            ;2
       LDA    LFB90,X                 ;4
       SEC                            ;2
       SBC    LF091                   ;4
       STA    $AC                     ;3
       LDA    LFBA3,X                 ;4
       SBC    #$00                    ;2
       STA    $AD                     ;3
       LDA    LF085                   ;4
       AND    #$7F                    ;2
       TAX                            ;2
       LDA    LFB90,X                 ;4
       SEC                            ;2
       SBC    LF092                   ;4
       STA    $AE                     ;3
       LDA    LFBA3,X                 ;4
       SBC    #$00                    ;2
       STA    $AF                     ;3
       LDA    LF086                   ;4
       AND    #$7F                    ;2
       TAX                            ;2
       LDA    LFB90,X                 ;4
       SEC                            ;2
       SBC    LF093                   ;4
       STA    $B0                     ;3
       LDA    LFBA3,X                 ;4
       SBC    #$00                    ;2
       STA    $B1                     ;3
       LDA    LF087                   ;4
       AND    #$7F                    ;2
       TAX                            ;2
       LDA    LFB90,X                 ;4
       SEC                            ;2
       SBC    LF094                   ;4
       STA    $B2                     ;3
       LDA    LFBA3,X                 ;4
       SBC    #$00                    ;2
       STA    $B3                     ;3
       LDA    LF088                   ;4
       AND    #$7F                    ;2
       TAX                            ;2
       LDA    LFB90,X                 ;4
       SEC                            ;2
       SBC    LF095                   ;4
       STA    $B4                     ;3
       LDA    LFBA3,X                 ;4
       SBC    #$00                    ;2
       STA    $B5                     ;3
       LDA    $C5                     ;3
       STA    $CA                     ;3
       LDA    $C6                     ;3
       STA    $CB                     ;3
       LDA    $C7                     ;3
       STA    $CC                     ;3
       LDA    $C8                     ;3
       STA    $CD                     ;3
       LDA    $C9                     ;3
       STA    $CE                     ;3
       LDA    #$04                    ;2
       STA    $C0                     ;3
       STA    $C1                     ;3
       STA    $C2                     ;3
       STA    $C3                     ;3
       STA    $C4                     ;3
       LDA    #$04                    ;2
       STA    $FC                     ;3
       LDY    #$00                    ;2
       LDX    #$00                    ;2
       LDA    $82                     ;3
       BEQ    LF7EF                   ;2
       LDX    #$05                    ;2
LF7EF:
       LDA    $A0                     ;3
       STA    $9C                     ;3
LF7F3:
       CMP    LF0BC,X                 ;4
       BEQ    LF802                   ;2
       BCS    LF85A                   ;2
       INX                            ;2
       DEC    $FC                     ;5
       BPL    LF7F3                   ;2
       JMP    LF863                   ;3
LF802:
       LDA    LF0B2,X                 ;4
       BPL    LF855                   ;2
       LDA    LF084,Y                 ;4
       BEQ    LF811                   ;2
       LDA    $85                     ;3
       ROR                            ;2
       BCC    LF855                   ;2
LF811:
       STX    $9D                     ;3
       LDA    LF0B2,X                 ;4
       AND    #$7F                    ;2
       TAX                            ;2
       LDA    LFBC8,X                 ;4
       STA    $FB                     ;3
       LDX    $9C                     ;3
       LDA    LFC46,X                 ;4
       CLC                            ;2
       ADC    $FB                     ;3
       TAX                            ;2
       LDA    LFBCC,X                 ;4
       SEC                            ;2
       SBC    #$09                    ;2
       STA.wy $CA,Y                   ;5
       LDX    $9D                     ;3
       LDA    #$B7                    ;2
       SEC                            ;2
       SBC    LF091,Y                 ;4
       STA    $9D                     ;3
       LDA    #$D9                    ;2
       SBC    #$00                    ;2
       STA    $9E                     ;3
       LDA    #$34                    ;2
       STA.wy $C0,Y                   ;5
       TYA                            ;2
       ASL                            ;2
       TAY                            ;2
       LDA    $9D                     ;3
       STA.wy $AC,Y                   ;5
       LDA    $9E                     ;3
       STA.wy $AD,Y                   ;5
       TYA                            ;2
       LSR                            ;2
       TAY                            ;2
LF855:
       INX                            ;2
       DEC    $FC                     ;5
       BMI    LF863                   ;2
LF85A:
       DEC    $9C                     ;5
       LDA    $9C                     ;3
       INY                            ;2
       CPY    #$05                    ;2
       BNE    LF7F3                   ;2
LF863:
       JMP    LFDFD                   ;3
       LDX    $82                     ;3
       LDA    INPT4,X                 ;4
       CMP    LF083                   ;4
       BEQ    LF8BE                   ;2
       LDA    INPT4,X                 ;4
       STA    LF003                   ;4
       BMI    LF8BE                   ;2
       LDX    #$01                    ;2
LF878:
       LDA    LF0C6,X                 ;4
       BNE    LF8BB                   ;2
       LDY    $9F                     ;3
       CPY    #$08                    ;2
       BCS    LF8BE                   ;2
       CPY    #$05                    ;2
       BCS    LF88B                   ;2
       LDY    #$07                    ;2
       STY    $9F                     ;3
LF88B:
       LDA    $AA                     ;3
       CLC                            ;2
       ADC    LFB1E,Y                 ;4
       ORA    #$01                    ;2
       STA    LF04E,X                 ;5
       LDA    LF096                   ;4
       STA    LF060,X                 ;5
       LDA    $A9                     ;3
       STA    LF04A,X                 ;5
       LDY    $A0                     ;3
       DEY                            ;2
       LDA    LFC46,Y                 ;4
       TAY                            ;2
       LDA    LFBB6,Y                 ;4
       STA    LF053,X                 ;5
       LDA    #$01                    ;2
       LDY    LF080                   ;4
       BEQ    LF8B7                   ;2
       LDA    #$80                    ;2
LF8B7:
       STA    LF046,X                 ;5
       DEX                            ;2
LF8BB:
       DEX                            ;2
       BPL    LF878                   ;2
LF8BE:
       LDX    #$04                    ;2
LF8C0:
       LDA    LF084,X                 ;4
       BEQ    LF8DA                   ;2
       AND    #$80                    ;2
       STA    $9C                     ;3
       LDA    LF084,X                 ;4
       AND    #$7F                    ;2
       TAY                            ;2
       LDA    LF08B,X                 ;4
       ADC    LFB6A,Y                 ;4
       STA    LF00B,X                 ;5
       BCS    LF8DD                   ;2
LF8DA:
       JMP    LF97A                   ;3
LF8DD:
       CPY    #$03                    ;2
       BNE    LF8FC                   ;2
       LDA    $8D                     ;3
       AND    #$80                    ;2
       STA    $9C                     ;3
       LDY    $82                     ;3
       LDA    LF0DE,Y                 ;4
       AND    #$0F                    ;2
       STA    $FB                     ;3
       LDA    $8D                     ;3
       AND    #$07                    ;2
       ADC    $FB                     ;3
       TAY                            ;2
       LDA    LFB59,Y                 ;4
       BNE    LF901                   ;2
LF8FC:
       LDA    LFB7D,Y                 ;4
       BEQ    LF905                   ;2
LF901:
       STA    $9E                     ;3
       ORA    $9C                     ;3
LF905:
       STA    LF004,X                 ;5
       STX    $9D                     ;3
       LDA    $A0                     ;3
       SEC                            ;2
       SBC    $9D                     ;3
       TAY                            ;2
       LDA    LFC46,Y                 ;4
       TAY                            ;2
       LDA    LFBB6,Y                 ;4
       STA    $9D                     ;3
       LDA    $9E                     ;3
       CMP    #$0E                    ;2
       BCC    LF95D                   ;2
       LDY    $C5,X                   ;4
       LDA    $9C                     ;3
       BMI    LF941                   ;2
       LDA    $9D                     ;3
       AND    #$A0                    ;2
       BEQ    LF92F                   ;2
       CPY    #$49                    ;2
       BEQ    LF97A                   ;2
LF92F:
       LDA    $9D                     ;3
       AND    #$02                    ;2
       BEQ    LF939                   ;2
       CPY    #$4D                    ;2
       BEQ    LF97A                   ;2
LF939:
       CPY    #$90                    ;2
       BCS    LF97A                   ;2
       INC    $C5,X                   ;6
       BNE    LF97A                   ;2
LF941:
       LDA    $9D                     ;3
       AND    #$A0                    ;2
       BEQ    LF94B                   ;2
       CPY    #$61                    ;2
       BEQ    LF97A                   ;2
LF94B:
       LDA    $9D                     ;3
       AND    #$02                    ;2
       BEQ    LF955                   ;2
       CPY    #$5D                    ;2
       BEQ    LF97A                   ;2
LF955:
       CPY    #$19                    ;2
       BCC    LF97A                   ;2
       DEC    $C5,X                   ;6
       BNE    LF97A                   ;2
LF95D:
       CMP    #$05                    ;2
       BCC    LF97A                   ;2
       BNE    LF968                   ;2
       LDA    #$0E                    ;2
       JMP    LFDAC                   ;3
LF968:
       CMP    #$07                    ;2
       BNE    LF971                   ;2
       LDA    #$08                    ;2
       JMP    LFDAC                   ;3
LF971:
       CMP    #$09                    ;2
       BNE    LF97A                   ;2
       LDA    #$04                    ;2
       JMP    LFDAC                   ;3
LF97A:
       DEX                            ;2
       BMI    LF980                   ;2
       JMP    LF8C0                   ;3
LF980:
       LDA    LF0D2                   ;4
       ADC    #$DF                    ;2
       STA    LF052                   ;4
       BCC    LF9A8                   ;2
       LDX    #$03                    ;2
LF98C:
       LDA    LF0C6,X                 ;4
       BEQ    LF9A5                   ;2
       BPL    LF99C                   ;2
       LDA    LF0CA,X                 ;4
       SEC                            ;2
       SBC    #$01                    ;2
       JMP    LF9A2                   ;3
LF99C:
       LDA    LF0CA,X                 ;4
       CLC                            ;2
       ADC    #$01                    ;2
LF9A2:
       STA    LF04A,X                 ;5
LF9A5:
       DEX                            ;2
       BPL    LF98C                   ;2
LF9A8:
       LDX    #$00                    ;2
       LDA    $85                     ;3
       ROR                            ;2
       BCC    LF9B0                   ;2
       INX                            ;2
LF9B0:
       LDA    #$F5                    ;2
       SEC                            ;2
       SBC    LF0CE,X                 ;4
       STA    $F1                     ;3
       LDA    #$D8                    ;2
       SBC    #$00                    ;2
       STA    $F2                     ;3
       LDA    LF0CA,X                 ;4
       STA    $9C                     ;3
       INX                            ;2
       INX                            ;2
       LDA    #$F5                    ;2
       SEC                            ;2
       SBC    LF0CE,X                 ;4
       STA    $F3                     ;3
       LDA    #$D8                    ;2
       SBC    #$00                    ;2
       STA    $F4                     ;3
       LDA    LF0CA,X                 ;4
       STA    $9D                     ;3
       LDX    #$02                    ;2
       LDA    $9C                     ;3
       JSR    LFD08                   ;6
       JSR    LFD24                   ;6
       INX                            ;2
       LDA    $9D                     ;3
       JSR    LFD08                   ;6
       JSR    LFD24                   ;6
       LDA    $A0                     ;3
       STA    $9E                     ;3
       LDA    LF096                   ;4
       ASL                            ;2
       CLC                            ;2
       ADC    #$04                    ;2
       STA    $9D                     ;3
       LDY    #$00                    ;2
LF9FA:
       LDX    $9E                     ;3
       LDA    LFC46,X                 ;4
       TAX                            ;2
       LDA    LFC69,X                 ;4
       SEC                            ;2
       SBC    $9D                     ;3
       STA.wy $CF,Y                   ;5
       LDA    LFC7B,X                 ;4
       SBC    #$00                    ;2
       STA.wy $D0,Y                   ;5
       LDA    LFC8D,X                 ;4
       SEC                            ;2
       SBC    $9D                     ;3
       STA.wy $D9,Y                   ;5
       LDA    LFC9F,X                 ;4
       SBC    #$00                    ;2
       STA.wy $DA,Y                   ;5
       LDA    LFCB1,X                 ;4
       SEC                            ;2
       SBC    $9D                     ;3
       STA.wy $E3,Y                   ;5
       LDA    LFCC3,X                 ;4
       SBC    #$00                    ;2
       STA.wy $E4,Y                   ;5
       LDA    $9D                     ;3
       CLC                            ;2
       ADC    #$2A                    ;2
       STA    $9D                     ;3
       DEC    $9E                     ;5
       INY                            ;2
       INY                            ;2
       CPY    #$0A                    ;2
       BCC    LF9FA                   ;2
       LDX    #$00                    ;2
       LDY    $A0                     ;3
LFA46:
       LDA    LFC10,Y                 ;4
       BPL    LFA54                   ;2
       LDA    LF0E2                   ;4
       BNE    LFA54                   ;2
       LDA    #$BA                    ;2
       BNE    LFA56                   ;2
LFA54:
       LDA    #$00                    ;2
LFA56:
       STA    $F5,X                   ;4
       DEY                            ;2
       INX                            ;2
       CPX    #$05                    ;2
       BNE    LFA46                   ;2
       LDA    LF080                   ;4
       STA    REFP0                   ;3
       LDX    #$20                    ;2
       STX    NUSIZ0                  ;3
       STX    NUSIZ1                  ;3
       LDX    #$00                    ;2
       STX    VDELP0                  ;3
       INX                            ;2
       STX    VDELP1                  ;3
       LDA    $A0                     ;3
       CMP    #$07                    ;2
       BCS    LFA86                   ;2
       LDX    #$34                    ;2
       STX    $F9                     ;3
       CMP    #$06                    ;2
       BCS    LFA86                   ;2
       STX    $F8                     ;3
       CMP    #$05                    ;2
       BCS    LFA86                   ;2
       STX    $F7                     ;3
LFA86:
       LDA    #$98                    ;2
       SEC                            ;2
       SBC    $AA                     ;3
       STA    $A5                     ;3
       LDA    #$D9                    ;2
       SBC    #$00                    ;2
       STA    $A6                     ;3
       LDX    $9F                     ;3
       LDA    LFB34,X                 ;4
       SEC                            ;2
       SBC    $AA                     ;3
       STA    $A3                     ;3
       LDA    LFB41,X                 ;4
       SBC    #$00                    ;2
       STA    $A4                     ;3
       LDA    $9F                     ;3
       CMP    #$05                    ;2
       BNE    LFAAE                   ;2
       LDA    #$8A                    ;2
       BNE    LFAB0                   ;2
LFAAE:
       LDA    #$91                    ;2
LFAB0:
       SEC                            ;2
       SBC    $AA                     ;3
       STA    $A7                     ;3
       LDA    #$D6                    ;2
       SBC    #$00                    ;2
       STA    $A8                     ;3
       LDX    $CA                     ;3
       LDA    LF096                   ;4
       BPL    LFAC8                   ;2
       LDX    $CB                     ;3
       LDY    $C1                     ;3
       STY    $C0                     ;3
LFAC8:
       LDA    #$25                    ;2
       STA    $FB                     ;3
       LDA    #$DD                    ;2
       STA    $FC                     ;3
       JMP    LFFEA                   ;3
       TXA                            ;2
       STA    WSYNC                   ;3
       NOP                            ;2
       NOP                            ;2
       STA    HMP1                    ;3
       AND    #$0F                    ;2
       TAY                            ;2
LFADD:
       DEY                            ;2
       BPL    LFADD                   ;2
       STA    RESP1                   ;3
       LDX    #$00                    ;2
       LDA    $A9                     ;3
       JSR    LFD08                   ;6
       JSR    LFD24                   ;6
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDX    $82                     ;3
       LDA    $9B                     ;3
       BEQ    LFAFE                   ;2
       DEC    $9B                     ;5
       JSR    LFD86                   ;6
       JMP    LFB04                   ;3
LFAFE:
       LDY    LFB21,X                 ;4
       JSR    LFD32                   ;6
LFB04:
       LDY    #$00                    ;2
       LDA    ($CF),Y                 ;5
       ORA    ($ED),Y                 ;5
       STA    PF0                     ;3
       LDA    ($D9),Y                 ;5
       STA    PF1                     ;3
       LDA    ($E3),Y                 ;5
       ORA    ($EF),Y                 ;5
       STA    PF2                     ;3
       LDA    ($AC),Y                 ;5
       AND    ($B6),Y                 ;5
       STA    GRP1                    ;3
       STA    HMCLR                   ;3
LFB1E:
       JMP    LFE08                   ;3

LFB21:
       .byte $02 ; |      X | $FB21
       .byte $05 ; |     X X| $FB22
       .byte $18 ; |   XX   | $FB23
       .byte $0C ; |    XX  | $FB24
       .byte $14 ; |   X X  | $FB25
LFB26:
       .byte $00 ; |        | $FB26
       .byte $05 ; |     X X| $FB27
LFB28:
       .byte $00 ; |        | $FB28
       .byte $02 ; |      X | $FB29
       .byte $03 ; |      XX| $FB2A
       .byte $04 ; |     X  | $FB2B
       .byte $00 ; |        | $FB2C
       .byte $05 ; |     X X| $FB2D
       .byte $06 ; |     XX | $FB2E
       .byte $07 ; |     XXX| $FB2F
       .byte $09 ; |    X  X| $FB30
       .byte $0A ; |    X X | $FB31
       .byte $0B ; |    X XX| $FB32
       .byte $0C ; |    XX  | $FB33
LFB34:
       .byte $60 ; | XX     | $FB34
       .byte $60 ; | XX     | $FB35
       .byte $60 ; | XX     | $FB36
       .byte $79 ; | XXXX  X| $FB37
       .byte $79 ; | XXXX  X| $FB38
       .byte $C3 ; |XX    XX| $FB39
       .byte $DC ; |XX XXX  | $FB3A
       .byte $AA ; |X X X X | $FB3B
       .byte $F5 ; |XXXX X X| $FB3C
       .byte $0E ; |    XXX | $FB3D
       .byte $26 ; |  X  XX | $FB3E
       .byte $CA ; |XX  X X | $FB3F
       .byte $CA ; |XX  X X | $FB40
LFB41:
       .byte $D6 ; |XX X XX | $FB41
       .byte $D6 ; |XX X XX | $FB42
       .byte $D6 ; |XX X XX | $FB43
       .byte $D6 ; |XX X XX | $FB44
       .byte $D6 ; |XX X XX | $FB45
       .byte $D6 ; |XX X XX | $FB46
       .byte $D6 ; |XX X XX | $FB47
       .byte $D6 ; |XX X XX | $FB48
       .byte $D6 ; |XX X XX | $FB49
       .byte $D7 ; |XX X XXX| $FB4A
       .byte $D7 ; |XX X XXX| $FB4B
       .byte $D9 ; |XX XX  X| $FB4C
       .byte $D9 ; |XX XX  X| $FB4D
LFB4E:
       .byte $38 ; |  XXX   | $FB4E
       .byte $3F ; |  XXXXXX| $FB4F
       .byte $46 ; | X   XX | $FB50
       .byte $4D ; | X  XX X| $FB51
       .byte $54 ; | X X X  | $FB52
       .byte $5B ; | X XX XX| $FB53
       .byte $62 ; | XX   X | $FB54
       .byte $69 ; | XX X  X| $FB55
       .byte $70 ; | XXX    | $FB56
       .byte $77 ; | XXX XXX| $FB57
       .byte $7E ; | XXXXXX | $FB58
LFB59:
       .byte $05 ; |     X X| $FB59
       .byte $07 ; |     XXX| $FB5A
       .byte $05 ; |     X X| $FB5B
       .byte $07 ; |     XXX| $FB5C
       .byte $04 ; |     X  | $FB5D
       .byte $0E ; |    XXX | $FB5E
       .byte $04 ; |     X  | $FB5F
       .byte $0E ; |    XXX | $FB60
       .byte $09 ; |    X  X| $FB61
       .byte $09 ; |    X  X| $FB62
       .byte $05 ; |     X X| $FB63
       .byte $07 ; |     XXX| $FB64
       .byte $09 ; |    X  X| $FB65
       .byte $07 ; |     XXX| $FB66
       .byte $0E ; |    XXX | $FB67
       .byte $09 ; |    X  X| $FB68
       .byte $09 ; |    X  X| $FB69
LFB6A:
       .byte $01 ; |       X| $FB6A
       .byte $09 ; |    X  X| $FB6B
       .byte $09 ; |    X  X| $FB6C
       .byte $2F ; |  X XXXX| $FB6D
       .byte $02 ; |      X | $FB6E
       .byte $02 ; |      X | $FB6F
       .byte $02 ; |      X | $FB70
       .byte $02 ; |      X | $FB71
       .byte $02 ; |      X | $FB72
       .byte $02 ; |      X | $FB73
       .byte $02 ; |      X | $FB74
       .byte $11 ; |   X   X| $FB75
       .byte $11 ; |   X   X| $FB76
       .byte $11 ; |   X   X| $FB77
       .byte $1E ; |   XXXX | $FB78
       .byte $1E ; |   XXXX | $FB79
       .byte $1E ; |   XXXX | $FB7A
       .byte $1E ; |   XXXX | $FB7B
       .byte $1E ; |   XXXX | $FB7C
LFB7D:
       .byte $00 ; |        | $FB7D
       .byte $02 ; |      X | $FB7E
       .byte $03 ; |      XX| $FB7F
       .byte $04 ; |     X  | $FB80
       .byte $03 ; |      XX| $FB81
       .byte $06 ; |     XX | $FB82
       .byte $04 ; |     X  | $FB83
       .byte $08 ; |    X   | $FB84
       .byte $04 ; |     X  | $FB85
       .byte $0A ; |    X X | $FB86
       .byte $04 ; |     X  | $FB87
       .byte $0C ; |    XX  | $FB88
       .byte $0D ; |    XX X| $FB89
       .byte $00 ; |        | $FB8A
       .byte $0F ; |    XXXX| $FB8B
       .byte $10 ; |   X    | $FB8C
       .byte $11 ; |   X   X| $FB8D
       .byte $12 ; |   X  X | $FB8E
       .byte $03 ; |      XX| $FB8F
LFB90:
       .byte $E7 ; |XXX  XXX| $FB90
       .byte $1D ; |   XXX X| $FB91
       .byte $36 ; |  XX XX | $FB92
       .byte $4F ; | X  XXXX| $FB93
       .byte $4F ; | X  XXXX| $FB94
       .byte $81 ; |X      X| $FB95
       .byte $81 ; |X      X| $FB96
       .byte $9A ; |X  XX X | $FB97
       .byte $9A ; |X  XX X | $FB98
       .byte $B3 ; |X XX  XX| $FB99
       .byte $B3 ; |X XX  XX| $FB9A
       .byte $12 ; |   X  X | $FB9B
       .byte $2B ; |  X X XX| $FB9C
       .byte $43 ; | X    XX| $FB9D
       .byte $68 ; | XX X   | $FB9E
       .byte $4F ; | X  XXXX| $FB9F
       .byte $68 ; | XX X   | $FBA0
       .byte $4F ; | X  XXXX| $FBA1
       .byte $68 ; | XX X   | $FBA2
LFBA3:
       .byte $D9 ; |XX XX  X| $FBA3
       .byte $DB ; |XX XX XX| $FBA4
       .byte $DB ; |XX XX XX| $FBA5
       .byte $DB ; |XX XX XX| $FBA6
       .byte $DB ; |XX XX XX| $FBA7
       .byte $DB ; |XX XX XX| $FBA8
       .byte $DB ; |XX XX XX| $FBA9
       .byte $DB ; |XX XX XX| $FBAA
       .byte $DB ; |XX XX XX| $FBAB
       .byte $DB ; |XX XX XX| $FBAC
       .byte $DB ; |XX XX XX| $FBAD
       .byte $D7 ; |XX X XXX| $FBAE
       .byte $D7 ; |XX X XXX| $FBAF
       .byte $D7 ; |XX X XXX| $FBB0
       .byte $DB ; |XX XX XX| $FBB1
       .byte $DB ; |XX XX XX| $FBB2
       .byte $DB ; |XX XX XX| $FBB3
       .byte $DB ; |XX XX XX| $FBB4
       .byte $DB ; |XX XX XX| $FBB5
LFBB6:
       .byte $A0 ; |X X     | $FBB6
       .byte $80 ; |X       | $FBB7
       .byte $D0 ; |XX X    | $FBB8
       .byte $C0 ; |XX      | $FBB9
       .byte $40 ; | X      | $FBBA
       .byte $E0 ; |XXX     | $FBBB
       .byte $D0 ; |XX X    | $FBBC
       .byte $C0 ; |XX      | $FBBD
       .byte $E0 ; |XXX     | $FBBE
       .byte $8C ; |X   XX  | $FBBF
       .byte $0E ; |    XXX | $FBC0
       .byte $AC ; |X X XX  | $FBC1
       .byte $84 ; |X    X  | $FBC2
       .byte $81 ; |X      X| $FBC3
       .byte $08 ; |    X   | $FBC4
       .byte $00 ; |        | $FBC5
       .byte $88 ; |X   X   | $FBC6
       .byte $00 ; |        | $FBC7
LFBC8:
       .byte $00 ; |        | $FBC8
       .byte $12 ; |   X  X | $FBC9
       .byte $24 ; |  X  X  | $FBCA
       .byte $36 ; |  XX XX | $FBCB
LFBCC:
       .byte $01 ; |       X| $FBCC
       .byte $01 ; |       X| $FBCD
       .byte $34 ; |  XX X  | $FBCE
       .byte $34 ; |  XX X  | $FBCF
       .byte $2C ; |  X XX  | $FBD0
       .byte $34 ; |  XX X  | $FBD1
       .byte $34 ; |  XX X  | $FBD2
       .byte $34 ; |  XX X  | $FBD3
       .byte $34 ; |  XX X  | $FBD4
       .byte $34 ; |  XX X  | $FBD5
       .byte $34 ; |  XX X  | $FBD6
       .byte $34 ; |  XX X  | $FBD7
       .byte $34 ; |  XX X  | $FBD8
       .byte $34 ; |  XX X  | $FBD9
       .byte $01 ; |       X| $FBDA
       .byte $01 ; |       X| $FBDB
       .byte $34 ; |  XX X  | $FBDC
       .byte $01 ; |       X| $FBDD
       .byte $01 ; |       X| $FBDE
       .byte $01 ; |       X| $FBDF
       .byte $48 ; | X  X   | $FBE0
       .byte $48 ; | X  X   | $FBE1
       .byte $40 ; | X      | $FBE2
       .byte $48 ; | X  X   | $FBE3
       .byte $48 ; | X  X   | $FBE4
       .byte $48 ; | X  X   | $FBE5
       .byte $48 ; | X  X   | $FBE6
       .byte $48 ; | X  X   | $FBE7
       .byte $48 ; | X  X   | $FBE8
       .byte $48 ; | X  X   | $FBE9
       .byte $48 ; | X  X   | $FBEA
       .byte $48 ; | X  X   | $FBEB
       .byte $01 ; |       X| $FBEC
       .byte $01 ; |       X| $FBED
       .byte $48 ; | X  X   | $FBEE
       .byte $01 ; |       X| $FBEF
       .byte $01 ; |       X| $FBF0
       .byte $01 ; |       X| $FBF1
       .byte $74 ; | XXX X  | $FBF2
       .byte $74 ; | XXX X  | $FBF3
       .byte $69 ; | XX X  X| $FBF4
       .byte $74 ; | XXX X  | $FBF5
       .byte $74 ; | XXX X  | $FBF6
       .byte $74 ; | XXX X  | $FBF7
       .byte $74 ; | XXX X  | $FBF8
       .byte $74 ; | XXX X  | $FBF9
       .byte $74 ; | XXX X  | $FBFA
       .byte $74 ; | XXX X  | $FBFB
       .byte $74 ; | XXX X  | $FBFC
       .byte $74 ; | XXX X  | $FBFD
       .byte $01 ; |       X| $FBFE
       .byte $01 ; |       X| $FBFF
       .byte $74 ; | XXX X  | $FC00
       .byte $01 ; |       X| $FC01
       .byte $01 ; |       X| $FC02
       .byte $01 ; |       X| $FC03
       .byte $88 ; |X   X   | $FC04
       .byte $88 ; |X   X   | $FC05
       .byte $7C ; | XXXXX  | $FC06
       .byte $88 ; |X   X   | $FC07
       .byte $88 ; |X   X   | $FC08
       .byte $88 ; |X   X   | $FC09
       .byte $88 ; |X   X   | $FC0A
       .byte $88 ; |X   X   | $FC0B
       .byte $88 ; |X   X   | $FC0C
       .byte $88 ; |X   X   | $FC0D
       .byte $88 ; |X   X   | $FC0E
       .byte $88 ; |X   X   | $FC0F
LFC10:
       .byte $01 ; |       X| $FC10
       .byte $01 ; |       X| $FC11
       .byte $88 ; |X   X   | $FC12
       .byte $01 ; |       X| $FC13
       .byte $04 ; |     X  | $FC14
       .byte $E4 ; |XXX  X  | $FC15
       .byte $E4 ; |XXX  X  | $FC16
       .byte $E4 ; |XXX  X  | $FC17
       .byte $64 ; | XX  X  | $FC18
       .byte $60 ; | XX     | $FC19
       .byte $E0 ; |XXX     | $FC1A
       .byte $E0 ; |XXX     | $FC1B
       .byte $E0 ; |XXX     | $FC1C
       .byte $E3 ; |XXX   XX| $FC1D
       .byte $53 ; | X X  XX| $FC1E
       .byte $53 ; | X X  XX| $FC1F
       .byte $D0 ; |XX X    | $FC20
       .byte $D0 ; |XX X    | $FC21
       .byte $52 ; | X X  X | $FC22
       .byte $82 ; |X     X | $FC23
       .byte $02 ; |      X | $FC24
       .byte $00 ; |        | $FC25
       .byte $81 ; |X      X| $FC26
       .byte $81 ; |X      X| $FC27
       .byte $81 ; |X      X| $FC28
       .byte $81 ; |X      X| $FC29
       .byte $81 ; |X      X| $FC2A
       .byte $81 ; |X      X| $FC2B
       .byte $81 ; |X      X| $FC2C
       .byte $81 ; |X      X| $FC2D
       .byte $81 ; |X      X| $FC2E
       .byte $81 ; |X      X| $FC2F
       .byte $81 ; |X      X| $FC30
       .byte $01 ; |       X| $FC31
       .byte $01 ; |       X| $FC32
LFC33:
       .byte $16 ; |   X XX | $FC33
       .byte $12 ; |   X  X | $FC34
       .byte $0D ; |    XX X| $FC35
       .byte $04 ; |     X  | $FC36
       .byte $0E ; |    XXX | $FC37
       .byte $05 ; |     X X| $FC38
LFC39:
       .byte $22 ; |  X   X | $FC39
       .byte $14 ; |   X X  | $FC3A
       .byte $0F ; |    XXXX| $FC3B
       .byte $08 ; |    X   | $FC3C
       .byte $12 ; |   X  X | $FC3D
       .byte $0D ; |    XX X| $FC3E
LFC3F:
       .byte $00 ; |        | $FC3F
       .byte $2A ; |  X X X | $FC40
       .byte $54 ; | X X X  | $FC41
       .byte $7E ; | XXXXXX | $FC42
       .byte $A8 ; |X X X   | $FC43
       .byte $D2 ; |XX X  X | $FC44
LFC45:
       .byte $FC ; |XXXXXX  | $FC45
LFC46:
       .byte $11 ; |   X   X| $FC46
       .byte $11 ; |   X   X| $FC47
       .byte $00 ; |        | $FC48
       .byte $01 ; |       X| $FC49
       .byte $02 ; |      X | $FC4A
       .byte $03 ; |      XX| $FC4B
       .byte $03 ; |      XX| $FC4C
       .byte $03 ; |      XX| $FC4D
       .byte $04 ; |     X  | $FC4E
       .byte $04 ; |     X  | $FC4F
       .byte $04 ; |     X  | $FC50
       .byte $04 ; |     X  | $FC51
       .byte $05 ; |     X X| $FC52
       .byte $06 ; |     XX | $FC53
       .byte $07 ; |     XXX| $FC54
       .byte $04 ; |     X  | $FC55
       .byte $04 ; |     X  | $FC56
       .byte $08 ; |    X   | $FC57
       .byte $10 ; |   X    | $FC58
       .byte $09 ; |    X  X| $FC59
       .byte $0A ; |    X X | $FC5A
       .byte $0B ; |    X XX| $FC5B
       .byte $0C ; |    XX  | $FC5C
       .byte $0D ; |    XX X| $FC5D
       .byte $0D ; |    XX X| $FC5E
       .byte $0D ; |    XX X| $FC5F
       .byte $0D ; |    XX X| $FC60
       .byte $0D ; |    XX X| $FC61
       .byte $0D ; |    XX X| $FC62
       .byte $0D ; |    XX X| $FC63
       .byte $0D ; |    XX X| $FC64
       .byte $0D ; |    XX X| $FC65
       .byte $0D ; |    XX X| $FC66
       .byte $0E ; |    XXX | $FC67
       .byte $0F ; |    XXXX| $FC68
LFC69:
       .byte $42 ; | X    X | $FC69
       .byte $62 ; | XX   X | $FC6A
       .byte $E8 ; |XXX X   | $FC6B
       .byte $42 ; | X    X | $FC6C
       .byte $42 ; | X    X | $FC6D
       .byte $42 ; | X    X | $FC6E
       .byte $E8 ; |XXX X   | $FC6F
       .byte $42 ; | X    X | $FC70
       .byte $42 ; | X    X | $FC71
       .byte $C1 ; |XX     X| $FC72
       .byte $C1 ; |XX     X| $FC73
       .byte $C1 ; |XX     X| $FC74
       .byte $97 ; |X  X XXX| $FC75
       .byte $6D ; | XX XX X| $FC76
       .byte $E8 ; |XXX X   | $FC77
       .byte $42 ; | X    X | $FC78
       .byte $EB ; |XXX X XX| $FC79
       .byte $42 ; | X    X | $FC7A
LFC7B:
       .byte $D8 ; |XX XX   | $FC7B
       .byte $D6 ; |XX X XX | $FC7C
       .byte $D4 ; |XX X X  | $FC7D
       .byte $D8 ; |XX XX   | $FC7E
       .byte $D8 ; |XX XX   | $FC7F
       .byte $D8 ; |XX XX   | $FC80
       .byte $D4 ; |XX X X  | $FC81
       .byte $D8 ; |XX XX   | $FC82
       .byte $D8 ; |XX XX   | $FC83
       .byte $D7 ; |XX X XXX| $FC84
       .byte $D7 ; |XX X XXX| $FC85
       .byte $D7 ; |XX X XXX| $FC86
       .byte $D7 ; |XX X XXX| $FC87
       .byte $D7 ; |XX X XXX| $FC88
       .byte $D4 ; |XX X X  | $FC89
       .byte $D8 ; |XX XX   | $FC8A
       .byte $D7 ; |XX X XXX| $FC8B
       .byte $D8 ; |XX XX   | $FC8C
LFC8D:
       .byte $42 ; | X    X | $FC8D
       .byte $64 ; | XX  X  | $FC8E
       .byte $0E ; |    XXX | $FC8F
       .byte $0E ; |    XXX | $FC90
       .byte $E4 ; |XXX  X  | $FC91
       .byte $38 ; |  XXX   | $FC92
       .byte $0E ; |    XXX | $FC93
       .byte $0E ; |    XXX | $FC94
       .byte $BA ; |X XXX X | $FC95
       .byte $90 ; |X  X    | $FC96
       .byte $66 ; | XX  XX | $FC97
       .byte $3C ; |  XXXX  | $FC98
       .byte $12 ; |   X  X | $FC99
       .byte $12 ; |   X  X | $FC9A
       .byte $E8 ; |XXX X   | $FC9B
       .byte $68 ; | XX X   | $FC9C
       .byte $90 ; |X  X    | $FC9D
       .byte $42 ; | X    X | $FC9E
LFC9F:
       .byte $D8 ; |XX XX   | $FC9F
       .byte $D6 ; |XX X XX | $FCA0
       .byte $D6 ; |XX X XX | $FCA1
       .byte $D6 ; |XX X XX | $FCA2
       .byte $D5 ; |XX X X X| $FCA3
       .byte $D6 ; |XX X XX | $FCA4
       .byte $D6 ; |XX X XX | $FCA5
       .byte $D6 ; |XX X XX | $FCA6
       .byte $D5 ; |XX X X X| $FCA7
       .byte $D5 ; |XX X X X| $FCA8
       .byte $D5 ; |XX X X X| $FCA9
       .byte $D5 ; |XX X X X| $FCAA
       .byte $D5 ; |XX X X X| $FCAB
       .byte $D5 ; |XX X X X| $FCAC
       .byte $D4 ; |XX X X  | $FCAD
       .byte $DA ; |XX XX X | $FCAE
       .byte $D5 ; |XX X X X| $FCAF
       .byte $D8 ; |XX XX   | $FCB0
LFCB1:
       .byte $43 ; | X    XX| $FCB1
       .byte $65 ; | XX  X X| $FCB2
       .byte $0F ; |    XXXX| $FCB3
       .byte $0F ; |    XXXX| $FCB4
       .byte $E5 ; |XXX  X X| $FCB5
       .byte $39 ; |  XXX  X| $FCB6
       .byte $0F ; |    XXXX| $FCB7
       .byte $0F ; |    XXXX| $FCB8
       .byte $BB ; |X XXX XX| $FCB9
       .byte $91 ; |X  X   X| $FCBA
       .byte $67 ; | XX  XXX| $FCBB
       .byte $3D ; |  XXXX X| $FCBC
       .byte $0F ; |    XXXX| $FCBD
       .byte $13 ; |   X  XX| $FCBE
       .byte $E9 ; |XXX X  X| $FCBF
       .byte $69 ; | XX X  X| $FCC0
       .byte $91 ; |X  X   X| $FCC1
       .byte $43 ; | X    XX| $FCC2
LFCC3:
       .byte $D8 ; |XX XX   | $FCC3
       .byte $D6 ; |XX X XX | $FCC4
       .byte $D6 ; |XX X XX | $FCC5
       .byte $D6 ; |XX X XX | $FCC6
       .byte $D5 ; |XX X X X| $FCC7
       .byte $D6 ; |XX X XX | $FCC8
       .byte $D6 ; |XX X XX | $FCC9
       .byte $D6 ; |XX X XX | $FCCA
       .byte $D5 ; |XX X X X| $FCCB
       .byte $D5 ; |XX X X X| $FCCC
       .byte $D5 ; |XX X X X| $FCCD
       .byte $D5 ; |XX X X X| $FCCE
       .byte $D6 ; |XX X XX | $FCCF
       .byte $D5 ; |XX X X X| $FCD0
       .byte $D4 ; |XX X X  | $FCD1
       .byte $DA ; |XX XX X | $FCD2
       .byte $D5 ; |XX X X X| $FCD3
       .byte $D8 ; |XX XX   | $FCD4

LFCD5:
       LDY    #$04                    ;2
       LDA    $8D                     ;3
       AND    #$EF                    ;2
       STA    $9C                     ;3
       LDA    #$16                    ;2
       STA    $9E                     ;3
       BNE    LFCF0                   ;2
LFCE3:
       ROR    $9C                     ;5
       LDA    $9C                     ;3
       AND    #$03                    ;2
       STA    $9D                     ;3
       LDA    $9E                     ;3
       SEC                            ;2
       SBC    $9D                     ;3
LFCF0:
       STA    LF03C,X                 ;5
       LDA    $9E                     ;3
       SEC                            ;2
       SBC    #$04                    ;2
       STA    $9E                     ;3
       LDA    $9C                     ;3
       AND    #$03                    ;2
       ORA    #$80                    ;2
       STA    LF032,X                 ;5
       INX                            ;2
       DEY                            ;2
       BPL    LFCE3                   ;2
       RTS                            ;6

LFD08:
       LDY    #$00                    ;2
       CLC                            ;2
       ADC    #$01                    ;2
       CMP    #$2D                    ;2
       BCC    LFD15                   ;2
       LDY    #$03                    ;2
       SBC    #$2D                    ;2
LFD15:
       SEC                            ;2
LFD16:
       INY                            ;2
       SBC    #$0F                    ;2
       BCS    LFD16                   ;2
       EOR    #$FF                    ;2
       SBC    #$06                    ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       RTS                            ;6

LFD24:
       STA    WSYNC                   ;3
       NOP                            ;2
       NOP                            ;2
       NOP                            ;2
       STA    HMP0,X                  ;4
LFD2B:
       DEY                            ;2
       BPL    LFD2B                   ;2
       STA.wx RESP0,X                 ;5
       RTS                            ;6

LFD32:
       LDA    #$0A                    ;2
       STA    $9C                     ;3
LFD36:
       LDA.wy $87,Y                   ;4
       AND    #$0F                    ;2
       TAX                            ;2
       LDA    LFB4E,X                 ;4
       LDX    $9C                     ;3
       STA    $8F,X                   ;4
       DEC    $9C                     ;5
       DEC    $9C                     ;5
       LDA.wy $87,Y                   ;4
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       TAX                            ;2
       LDA    LFB4E,X                 ;4
       LDX    $9C                     ;3
       STA    $8F,X                   ;4
       DEC    $9C                     ;5
       DEY                            ;2
       DEC    $9C                     ;5
       BPL    LFD36                   ;2
       LDX    #$00                    ;2
LFD5F:
       LDA    $8F,X                   ;4
       CMP    #$38                    ;2
       BNE    LFD6F                   ;2
       LDA    #$7E                    ;2
       STA    $8F,X                   ;4
       INX                            ;2
       INX                            ;2
       CPX    #$0A                    ;2
       BCC    LFD5F                   ;2
LFD6F:
       RTS                            ;6

LFD70:
       LDY    $82                     ;3
       LDX    LFD84,Y                 ;4
       SED                            ;2
       CLC                            ;2
       ADC    $87,X                   ;4
       STA    $87,X                   ;4
       DEX                            ;2
       LDA    $87,X                   ;4
       ADC    #$00                    ;2
       STA    $87,X                   ;4
       CLD                            ;2
       RTS                            ;6

LFD84:
       ORA    ($04,X)                 ;6
LFD86:
       LDA    $9B                     ;3
       BEQ    LFDAB                   ;2
       LDA    #$7E                    ;2
       STA    $99                     ;3
       STA    $97                     ;3
       STA    $95                     ;3
       STA    $93                     ;3
       STA    $91                     ;3
       STA    $8F                     ;3
       LDY    $83,X                   ;4
       LDX    #$0C                    ;2
       LDA    #$85                    ;2
       BNE    LFDA3                   ;2
LFDA0:
       STA    $8F,X                   ;4
       DEY                            ;2
LFDA3:
       CPY    #$02                    ;2
       BCC    LFDAB                   ;2
       DEX                            ;2
       DEX                            ;2
       BPL    LFDA0                   ;2
LFDAB:
       RTS                            ;6

LFDAC:
       STA    $9E                     ;3
       LDA    #$00                    ;2
       LDY    $C5,X                   ;4
       CPY    $A9                     ;3
       BCC    LFDB8                   ;2
       LDA    #$80                    ;2
LFDB8: 
       STA    $9C                     ;3
       LDA    LF084,X                 ;4
       AND    #$7F                    ;2
       ORA    $9C                     ;3
       STA    LF004,X                 ;5
       LDY    #$01                    ;2
LFDC6:
       LDA    LF0C8,Y                 ;4
       BNE    LFDE9                   ;2
       LDA    $9D                     ;3
       STA    LF055,Y                 ;5
       LDA    $C5,X                   ;4
       STA    LF04C,Y                 ;5
       LDA    LF091,X                 ;4
       SEC                            ;2
       SBC    $9E                     ;3
       ORA    #$01                    ;2
       STA    LF050,Y                 ;5
       LDA    $9C                     ;3
       ORA    #$01                    ;2
       STA    LF048,Y                 ;5
       BNE    LFDEC                   ;2
LFDE9:
       DEY                            ;2
       BPL    LFDC6                   ;2
LFDEC:
       JMP    LF97A                   ;3
LFDEF:
       STA    $81                     ;3
       TAX                            ;2
       LDA    #$6B                    ;2
       STA    $FB                     ;3
       LDA    #$DE                    ;2
       STA    $FC                     ;3
       JMP    LFFEA                   ;3
LFDFD:
       LDA    #$60                    ;2
       STA    $FB                     ;3
       LDA    #$DE                    ;2
       STA    $FC                     ;3
       JMP    LFFEA                   ;3
LFE08:
       LDA    #$E3                    ;2
       STA    $FB                     ;3
       LDA    #$DD                    ;2
       STA    $FC                     ;3
       JMP    LFFEA                   ;3
       JSR    LFCD5                   ;6
       LDA    #$47                    ;2
       STA    $FB                     ;3
       LDA    #$DD                    ;2
       STA    $FC                     ;3
       JMP    LFFEA                   ;3
       JSR    LFD32                   ;6
       LDA    #$47                    ;2
       STA    $FB                     ;3
       LDA    #$DD                    ;2
       STA    $FC                     ;3
       JMP    LFFEA                   ;3


       .byte $00 ; |        | $FE2F
       .byte $00 ; |        | $FE30
       .byte $00 ; |        | $FE31
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
       .byte $00 ; |        | $FE43
       .byte $00 ; |        | $FE44
       .byte $00 ; |        | $FE45
       .byte $00 ; |        | $FE46
       .byte $00 ; |        | $FE47
       .byte $00 ; |        | $FE48
       .byte $00 ; |        | $FE49
       .byte $00 ; |        | $FE4A
       .byte $00 ; |        | $FE4B
       .byte $00 ; |        | $FE4C
       .byte $00 ; |        | $FE4D
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
       .byte $00 ; |        | $FE5D
       .byte $00 ; |        | $FE5E
       .byte $00 ; |        | $FE5F
       .byte $00 ; |        | $FE60
       .byte $00 ; |        | $FE61
       .byte $00 ; |        | $FE62
       .byte $00 ; |        | $FE63
       .byte $00 ; |        | $FE64
       .byte $00 ; |        | $FE65
       .byte $00 ; |        | $FE66
       .byte $00 ; |        | $FE67
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
       .byte $00 ; |        | $FE7D
       .byte $00 ; |        | $FE7E
       .byte $00 ; |        | $FE7F
       .byte $00 ; |        | $FE80
       .byte $00 ; |        | $FE81
       .byte $00 ; |        | $FE82
       .byte $00 ; |        | $FE83
       .byte $00 ; |        | $FE84
       .byte $00 ; |        | $FE85
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
       .byte $00 ; |        | $FE97
       .byte $00 ; |        | $FE98
       .byte $00 ; |        | $FE99
       .byte $00 ; |        | $FE9A
       .byte $00 ; |        | $FE9B
       .byte $00 ; |        | $FE9C
       .byte $00 ; |        | $FE9D
       .byte $00 ; |        | $FE9E
       .byte $00 ; |        | $FE9F
       .byte $00 ; |        | $FEA0
       .byte $00 ; |        | $FEA1
       .byte $00 ; |        | $FEA2
       .byte $00 ; |        | $FEA3
       .byte $00 ; |        | $FEA4
       .byte $00 ; |        | $FEA5
       .byte $00 ; |        | $FEA6
       .byte $00 ; |        | $FEA7
       .byte $00 ; |        | $FEA8
       .byte $00 ; |        | $FEA9
       .byte $00 ; |        | $FEAA
       .byte $00 ; |        | $FEAB
       .byte $00 ; |        | $FEAC
       .byte $00 ; |        | $FEAD
       .byte $00 ; |        | $FEAE
       .byte $00 ; |        | $FEAF
       .byte $00 ; |        | $FEB0
       .byte $00 ; |        | $FEB1
       .byte $00 ; |        | $FEB2
       .byte $00 ; |        | $FEB3
       .byte $00 ; |        | $FEB4
       .byte $00 ; |        | $FEB5
       .byte $00 ; |        | $FEB6
       .byte $00 ; |        | $FEB7
       .byte $00 ; |        | $FEB8
       .byte $00 ; |        | $FEB9
       .byte $00 ; |        | $FEBA
       .byte $00 ; |        | $FEBB
       .byte $00 ; |        | $FEBC
       .byte $00 ; |        | $FEBD
       .byte $00 ; |        | $FEBE
       .byte $00 ; |        | $FEBF
       .byte $00 ; |        | $FEC0
       .byte $00 ; |        | $FEC1
       .byte $00 ; |        | $FEC2
       .byte $00 ; |        | $FEC3
       .byte $00 ; |        | $FEC4
       .byte $00 ; |        | $FEC5
       .byte $00 ; |        | $FEC6
       .byte $00 ; |        | $FEC7
       .byte $00 ; |        | $FEC8
       .byte $00 ; |        | $FEC9
       .byte $00 ; |        | $FECA
       .byte $00 ; |        | $FECB
       .byte $00 ; |        | $FECC
       .byte $00 ; |        | $FECD
       .byte $00 ; |        | $FECE
       .byte $00 ; |        | $FECF
       .byte $00 ; |        | $FED0
       .byte $00 ; |        | $FED1
       .byte $00 ; |        | $FED2
       .byte $00 ; |        | $FED3
       .byte $00 ; |        | $FED4
       .byte $00 ; |        | $FED5
       .byte $00 ; |        | $FED6
       .byte $00 ; |        | $FED7
       .byte $00 ; |        | $FED8
       .byte $00 ; |        | $FED9
       .byte $00 ; |        | $FEDA
       .byte $00 ; |        | $FEDB
       .byte $00 ; |        | $FEDC
       .byte $00 ; |        | $FEDD
       .byte $00 ; |        | $FEDE
       .byte $00 ; |        | $FEDF
       .byte $00 ; |        | $FEE0
       .byte $00 ; |        | $FEE1
       .byte $00 ; |        | $FEE2
       .byte $00 ; |        | $FEE3
       .byte $00 ; |        | $FEE4
       .byte $00 ; |        | $FEE5
       .byte $00 ; |        | $FEE6
       .byte $00 ; |        | $FEE7
       .byte $00 ; |        | $FEE8
       .byte $00 ; |        | $FEE9
       .byte $00 ; |        | $FEEA
       .byte $00 ; |        | $FEEB
       .byte $00 ; |        | $FEEC
       .byte $00 ; |        | $FEED
       .byte $00 ; |        | $FEEE
       .byte $00 ; |        | $FEEF
       .byte $00 ; |        | $FEF0
       .byte $00 ; |        | $FEF1
       .byte $00 ; |        | $FEF2
       .byte $00 ; |        | $FEF3
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
       .byte $00 ; |        | $FF8C
       .byte $00 ; |        | $FF8D
       .byte $00 ; |        | $FF8E
       .byte $00 ; |        | $FF8F
       .byte $00 ; |        | $FF90
       .byte $00 ; |        | $FF91
       .byte $00 ; |        | $FF92
       .byte $00 ; |        | $FF93
       .byte $00 ; |        | $FF94
       .byte $00 ; |        | $FF95
       .byte $00 ; |        | $FF96
       .byte $00 ; |        | $FF97
       .byte $00 ; |        | $FF98
       .byte $00 ; |        | $FF99
       .byte $00 ; |        | $FF9A
       .byte $00 ; |        | $FF9B
       .byte $00 ; |        | $FF9C
       .byte $00 ; |        | $FF9D
       .byte $00 ; |        | $FF9E
       .byte $00 ; |        | $FF9F
       .byte $00 ; |        | $FFA0
       .byte $00 ; |        | $FFA1
       .byte $00 ; |        | $FFA2
       .byte $00 ; |        | $FFA3
       .byte $00 ; |        | $FFA4
       .byte $00 ; |        | $FFA5
       .byte $00 ; |        | $FFA6
       .byte $00 ; |        | $FFA7
       .byte $00 ; |        | $FFA8
       .byte $00 ; |        | $FFA9
       .byte $00 ; |        | $FFAA
       .byte $00 ; |        | $FFAB
       .byte $00 ; |        | $FFAC
       .byte $00 ; |        | $FFAD
       .byte $00 ; |        | $FFAE
       .byte $00 ; |        | $FFAF
       .byte $00 ; |        | $FFB0
       .byte $00 ; |        | $FFB1
       .byte $00 ; |        | $FFB2
       .byte $00 ; |        | $FFB3
       .byte $00 ; |        | $FFB4
       .byte $00 ; |        | $FFB5
       .byte $00 ; |        | $FFB6
       .byte $00 ; |        | $FFB7
       .byte $00 ; |        | $FFB8
       .byte $00 ; |        | $FFB9
       .byte $00 ; |        | $FFBA
       .byte $00 ; |        | $FFBB
       .byte $00 ; |        | $FFBC
       .byte $00 ; |        | $FFBD
       .byte $00 ; |        | $FFBE
       .byte $00 ; |        | $FFBF
       .byte $00 ; |        | $FFC0
       .byte $00 ; |        | $FFC1
       .byte $00 ; |        | $FFC2
       .byte $00 ; |        | $FFC3
       .byte $00 ; |        | $FFC4
       .byte $00 ; |        | $FFC5
       .byte $00 ; |        | $FFC6
       .byte $00 ; |        | $FFC7
       .byte $00 ; |        | $FFC8
       .byte $00 ; |        | $FFC9
       .byte $00 ; |        | $FFCA
       .byte $00 ; |        | $FFCB
       .byte $00 ; |        | $FFCC
       .byte $00 ; |        | $FFCD
       .byte $00 ; |        | $FFCE
       .byte $00 ; |        | $FFCF
       .byte $00 ; |        | $FFD0
       .byte $00 ; |        | $FFD1
       .byte $00 ; |        | $FFD2
       .byte $00 ; |        | $FFD3
       .byte $00 ; |        | $FFD4
       .byte $00 ; |        | $FFD5
       .byte $00 ; |        | $FFD6
       .byte $00 ; |        | $FFD7
       .byte $00 ; |        | $FFD8
       .byte $00 ; |        | $FFD9
       .byte $00 ; |        | $FFDA
       .byte $00 ; |        | $FFDB
       .byte $00 ; |        | $FFDC
       .byte $00 ; |        | $FFDD
       .byte $00 ; |        | $FFDE
       .byte $00 ; |        | $FFDF
       .byte $00 ; |        | $FFE0
       .byte $00 ; |        | $FFE1
       .byte $00 ; |        | $FFE2
       .byte $00 ; |        | $FFE3
       .byte $00 ; |        | $FFE4
       .byte $00 ; |        | $FFE5
       .byte $00 ; |        | $FFE6
       .byte $00 ; |        | $FFE7
       .byte $00 ; |        | $FFE8
       .byte $00 ; |        | $FFE9

LFFEA:
       LDA    $FC                     ;3
       AND    #$F0                    ;2
       CMP    #$F0                    ;2
       BEQ    LFFF5                   ;2
       LDA    $FFF8                   ;4
LFFF5:
       JMP.ind ($00FB)                ;5


       ORG $2FF8
       RORG $FFF8

       .word 0,START2,START2,START2
