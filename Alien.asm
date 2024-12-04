; Disassembly of alien.bin
; Disassembled Sat Apr 30 02 00:59 2005
; Using DiStella v2.0
;
; Command Line: C:\BIN\DISTELLA.EXE -pafscalien.cfg alien.bin 
;
; alien.cfg contents:      
;
;      GFX F000 F087
;      CODE F088 F1C9
;      GFX F1CA F1D1
;      CODE F1D2 F263
;      GFX F264 F361
;      CODE F362 F3E1
;      GFX F3E2 F5AA
;      CODE F5AB FE3B
;      GFX FE3C FFFF
;      

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


       ORG $F000

       .byte $00 ; |        | $F000
       .byte $1E ; |   XXXX | $F001
       .byte $33 ; |  XX  XX| $F002
       .byte $33 ; |  XX  XX| $F003
       .byte $33 ; |  XX  XX| $F004
       .byte $33 ; |  XX  XX| $F005
       .byte $33 ; |  XX  XX| $F006
       .byte $1E ; |   XXXX | $F007
       .byte $00 ; |        | $F008
       .byte $3F ; |  XXXXXX| $F009
       .byte $0C ; |    XX  | $F00A
       .byte $0C ; |    XX  | $F00B
       .byte $0C ; |    XX  | $F00C
       .byte $0C ; |    XX  | $F00D
       .byte $3C ; |  XXXX  | $F00E
       .byte $1C ; |   XXX  | $F00F
       .byte $00 ; |        | $F010
       .byte $3F ; |  XXXXXX| $F011
       .byte $30 ; |  XX    | $F012
       .byte $30 ; |  XX    | $F013
       .byte $1E ; |   XXXX | $F014
       .byte $03 ; |      XX| $F015
       .byte $23 ; |  X   XX| $F016
       .byte $3E ; |  XXXXX | $F017
       .byte $00 ; |        | $F018
       .byte $1E ; |   XXXX | $F019
       .byte $23 ; |  X   XX| $F01A
       .byte $03 ; |      XX| $F01B
       .byte $06 ; |     XX | $F01C
       .byte $03 ; |      XX| $F01D
       .byte $23 ; |  X   XX| $F01E
       .byte $1E ; |   XXXX | $F01F
       .byte $00 ; |        | $F020
       .byte $06 ; |     XX | $F021
       .byte $06 ; |     XX | $F022
       .byte $3F ; |  XXXXXX| $F023
       .byte $26 ; |  X  XX | $F024
       .byte $16 ; |   X XX | $F025
       .byte $0E ; |    XXX | $F026
       .byte $06 ; |     XX | $F027
       .byte $00 ; |        | $F028
       .byte $3E ; |  XXXXX | $F029
       .byte $23 ; |  X   XX| $F02A
       .byte $03 ; |      XX| $F02B
       .byte $3E ; |  XXXXX | $F02C
       .byte $30 ; |  XX    | $F02D
       .byte $30 ; |  XX    | $F02E
       .byte $3F ; |  XXXXXX| $F02F
       .byte $00 ; |        | $F030
       .byte $1E ; |   XXXX | $F031
       .byte $33 ; |  XX  XX| $F032
       .byte $33 ; |  XX  XX| $F033
       .byte $3E ; |  XXXXX | $F034
       .byte $30 ; |  XX    | $F035
       .byte $31 ; |  XX   X| $F036
       .byte $1E ; |   XXXX | $F037
       .byte $00 ; |        | $F038
       .byte $0C ; |    XX  | $F039
       .byte $0C ; |    XX  | $F03A
       .byte $0C ; |    XX  | $F03B
       .byte $06 ; |     XX | $F03C
       .byte $03 ; |      XX| $F03D
       .byte $21 ; |  X    X| $F03E
       .byte $3F ; |  XXXXXX| $F03F
       .byte $00 ; |        | $F040
       .byte $1E ; |   XXXX | $F041
       .byte $33 ; |  XX  XX| $F042
       .byte $33 ; |  XX  XX| $F043
       .byte $1E ; |   XXXX | $F044
       .byte $33 ; |  XX  XX| $F045
       .byte $33 ; |  XX  XX| $F046
       .byte $1E ; |   XXXX | $F047
       .byte $00 ; |        | $F048
       .byte $1E ; |   XXXX | $F049
       .byte $23 ; |  X   XX| $F04A
       .byte $03 ; |      XX| $F04B
       .byte $1F ; |   XXXXX| $F04C
       .byte $33 ; |  XX  XX| $F04D
       .byte $33 ; |  XX  XX| $F04E
       .byte $1E ; |   XXXX | $F04F
       .byte $00 ; |        | $F050
       .byte $21 ; |  X    X| $F051
       .byte $21 ; |  X    X| $F052
       .byte $21 ; |  X    X| $F053
       .byte $3F ; |  XXXXXX| $F054
       .byte $21 ; |  X    X| $F055
       .byte $21 ; |  X    X| $F056
       .byte $3F ; |  XXXXXX| $F057
       .byte $00 ; |        | $F058
       .byte $07 ; |     XXX| $F059
       .byte $04 ; |     X  | $F05A
       .byte $04 ; |     X  | $F05B
       .byte $04 ; |     X  | $F05C
       .byte $04 ; |     X  | $F05D
       .byte $04 ; |     X  | $F05E
       .byte $04 ; |     X  | $F05F
       .byte $00 ; |        | $F060
       .byte $C1 ; |XX     X| $F061
       .byte $01 ; |       X| $F062
       .byte $01 ; |       X| $F063
       .byte $01 ; |       X| $F064
       .byte $01 ; |       X| $F065
       .byte $01 ; |       X| $F066
       .byte $01 ; |       X| $F067
       .byte $00 ; |        | $F068
       .byte $07 ; |     XXX| $F069
       .byte $04 ; |     X  | $F06A
       .byte $04 ; |     X  | $F06B
       .byte $07 ; |     XXX| $F06C
       .byte $04 ; |     X  | $F06D
       .byte $04 ; |     X  | $F06E
       .byte $07 ; |     XXX| $F06F
       .byte $00 ; |        | $F070
       .byte $E0 ; |XXX     | $F071
       .byte $00 ; |        | $F072
       .byte $00 ; |        | $F073
       .byte $E0 ; |XXX     | $F074
       .byte $00 ; |        | $F075
       .byte $00 ; |        | $F076
       .byte $E0 ; |XXX     | $F077
       .byte $00 ; |        | $F078
       .byte $83 ; |X     XX| $F079
       .byte $87 ; |X    XXX| $F07A
       .byte $8D ; |X   XX X| $F07B
       .byte $99 ; |X  XX  X| $F07C
       .byte $B1 ; |X XX   X| $F07D
       .byte $E1 ; |XXX    X| $F07E
       .byte $C1 ; |XX     X| $F07F
       .byte $00 ; |        | $F080
       .byte $00 ; |        | $F081
       .byte $00 ; |        | $F082
       .byte $00 ; |        | $F083
       .byte $00 ; |        | $F084
       .byte $00 ; |        | $F085
       .byte $00 ; |        | $F086
       .byte $00 ; |        | $F087


IF088:
       LDA    LF264-11,Y              ;4
       STA    PF1                     ;3
       LDX    $9E                     ;3
       LDA    LF508,X                 ;4
       STA    GRP0                    ;3
       LDA    LF2AE,Y                 ;4
       STA    PF2                     ;3
       STA    HMCLR                   ;3
       DEY                            ;2
       CPY    $8F                     ;3
       BCS    LF0C8                   ;2
       LDA    LF405,X                 ;4
       BEQ    LF0B0                   ;2
       INC    $9E                     ;5
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    GRP0                    ;3
       JMP.ind ($93)                  ;5
LF0B0:
       LDA    LF304,Y                 ;4
       AND    #$08                    ;2
       BEQ    LF0C8                   ;2
       LDX    $9C                     ;3
       LDA    $F5,X                   ;4
       STA    COLUP0                  ;3
       LDA    #<IF0EA                 ;2
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    $91                     ;3
       JMP.ind ($93)                  ;5
LF0C8:
       CPY    #$0B                    ;2
       BCS    LF0E1                   ;2
       JMP    LF1D2                   ;3

IF0CF:
       LDA    #<IF088                 ;2
       STA    $91                     ;3
       LDX    $84                     ;3
       LDA    $86                     ;3
LF0D7:
       DEX                            ;2
       BPL    LF0D7                   ;2
       STA    RESP0                   ;3
       STA    HMCLR                   ;3
       STA    HMP0                    ;3
       DEY                            ;2
LF0E1:
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    $3E                     ;3
       JMP.ind ($93)                  ;5



IF0EA:
       LDA    LF264-11,Y              ;4
       STA    PF1                     ;3
       LDA    LF2AE,Y                 ;4
       STA    PF2                     ;3
       LDX    $9C                     ;3
       LDA    $A3,X                   ;4
       STA    $9E                     ;3
       LDA    $AA,X                   ;4
       STA    $8F                     ;3
       STA    HMCLR                   ;3
       DEY                            ;2
       LDA    $B7,X                   ;4
       STA    $86                     ;3
       STA    REFP0                   ;3
       AND    #$07                    ;2
       STA    $84                     ;3
       LDA    $95,X                   ;4
       STA    $9C                     ;3
       LDA    #<IF0CF                 ;2
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    $91                     ;3
       JMP.ind ($93)                  ;5

IF11A:
       LDX    $FC                     ;3
       LDA    LF508,X                 ;4
       STA    GRP1                    ;3
       CPY    $90                     ;3
       STA    HMCLR                   ;3
       BCS    LF14C                   ;2
       LDA    LF405,X                 ;4
       BEQ    LF15E                   ;2
       INC    $FC                     ;5
LF12E:
       TAX                            ;2
       LDA    LF304,Y                 ;4
       STA    HMM0                    ;3
       STA    HMM1                    ;3
       LSR                            ;2
       BCS    LF152                   ;2
LF139:
       LDA    $8C                     ;3
       LSR                            ;2
       STA    ENAM0                   ;3
       LSR                            ;2
       STA    $8C                     ;3
       STA    ENAM1                   ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STX    GRP1                    ;3
       JMP.ind ($91)                  ;5
LF14C:
       NOP                            ;2
       INC    $3E                     ;5
       JMP    LF12E                   ;3
LF152:
       PLA                            ;4
       STA    $8C                     ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STX    GRP1                    ;3
       JMP.ind ($91)                  ;5
LF15E:
       TAX                            ;2
       LDA    LF304,Y                 ;4
       STA    HMM0                    ;3
       STA    HMM1                    ;3
       LSR                            ;2
       BCS    LF152                   ;2
       LSR                            ;2
       BCC    LF139                   ;2
       LDA    #<IF17F                 ;2
       STA    $93                     ;3
       LDA    $8C                     ;3
       LSR                            ;2
       STA    ENAM0                   ;3
       LSR                            ;2
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    ENAM1                   ;3
       JMP.ind ($91)                  ;5

IF17F:
       LDX    $9D                     ;3
       LDA    $F5,X                   ;4
       STA    COLUP1                  ;3
       LDA    $A3,X                   ;4
       STA    $FC                     ;3
       LDA    $AA,X                   ;4
       STA    $90                     ;3
       STA    HMCLR                   ;3
       LDA    $B7,X                   ;4
       STA    $8A                     ;3
       STA    REFP1                   ;3
       AND    #$07                    ;2
       STA    $88                     ;3
       LDA    $95,X                   ;4
       STA    $9D                     ;3
       LDA    #$70                    ;2
       STA    HMM1                    ;3
       STA    HMM0                    ;3
       STA    ENAM0                   ;3
       LDX    #<IF1B0                 ;2
       STA    ENAM1                   ;3
       STA    HMOVE                   ;3
       STX    $93                     ;3
       JMP.ind ($91)                  ;5

IF1B0:
       LDA    #$1A                    ;2
       STA    $93                     ;3
       LDX    $88                     ;3
       LDA    $8A                     ;3
LF1B8:
       DEX                            ;2
       BPL    LF1B8                   ;2
       STA    RESP1                   ;3
       STA    HMCLR                   ;3
       STA    HMP1                    ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    $3E                     ;3
       JMP.ind ($91)                  ;5

LF1CA:
       .byte $00 ; |        | $F1CA
       .byte $00 ; |        | $F1CB
       .byte $00 ; |        | $F1CC
       .byte $00 ; |        | $F1CD
       .byte $01 ; |       X| $F1CE
       .byte $01 ; |       X| $F1CF
       .byte $03 ; |      XX| $F1D0
       .byte $03 ; |      XX| $F1D1

LF1D2:
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDA    #$F0                    ;2
       STA    $84                     ;3
       STA    $86                     ;3
       STA    $88                     ;3
       STA    $8A                     ;3
       STA    $8C                     ;3
       STA    $8E                     ;3
       LDA    #$07                    ;2
       STA    RESP0                   ;3
       STA    RESP1                   ;3
       LDX    #$10                    ;2
       STX    HMP1                    ;3
       STX    REFP0                   ;3
       STX    REFP1                   ;3
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    $8F                     ;3
       LSR                            ;2
       STA    NUSIZ0                  ;3
       STA    NUSIZ1                  ;3
       LSR                            ;2
       STA    VDELP0                  ;3
       STA    VDELP1                  ;3
       LDA    $FB                     ;3
       STA    COLUP0                  ;3
       STA    COLUP1                  ;3
       STA    HMCLR                   ;3
LF20A:
       LDY    $8F                     ;3
       LDA    ($8D),Y                 ;5
       STA    $90                     ;3
       LDA    ($8B),Y                 ;5
       TAX                            ;2
       LDA    ($83),Y                 ;5
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    GRP0                    ;3
       LDA    ($85),Y                 ;5
       STA    GRP1                    ;3
       LDA    ($87),Y                 ;5
       STA    GRP0                    ;3
       LDA    ($89),Y                 ;5
       LDY    $90                     ;3
       STA    GRP1                    ;3
       STX    GRP0                    ;3
       STY    GRP1                    ;3
       STA    GRP0                    ;3
       DEC    $8F                     ;5
       BPL    LF20A                   ;2
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDA    #$00                    ;2
       STA    VDELP0                  ;3
       STA    VDELP1                  ;3
       LDX    $C0                     ;3
       LDA    LF1CA,X                 ;4
       STA    NUSIZ0                  ;3
       LDA    LF1CA-1,X               ;4
       STA    NUSIZ1                  ;3
       LDY    #$07                    ;2
LF24B:
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       LDA    LF3E2,Y                 ;4
       CPX    #$02                    ;2
       BCC    LF25E                   ;2
       STA    GRP0                    ;3
       CPX    #$03                    ;2
       BCC    LF25E                   ;2
       STA    GRP1                    ;3
LF25E:
       DEY                            ;2
       BPL    LF24B                   ;2
       JMP    LF751                   ;3

LF264:
       .byte $FF ; |XXXXXXXX| $F264
       .byte $80 ; |X       | $F265
       .byte $80 ; |X       | $F266
       .byte $80 ; |X       | $F267
       .byte $80 ; |X       | $F268
       .byte $80 ; |X       | $F269
       .byte $80 ; |X       | $F26A
       .byte $80 ; |X       | $F26B
       .byte $80 ; |X       | $F26C
       .byte $9C ; |X  XXX  | $F26D
       .byte $94 ; |X  X X  | $F26E
       .byte $94 ; |X  X X  | $F26F
       .byte $9C ; |X  XXX  | $F270
       .byte $80 ; |X       | $F271
       .byte $80 ; |X       | $F272
       .byte $80 ; |X       | $F273
       .byte $80 ; |X       | $F274
       .byte $80 ; |X       | $F275
       .byte $80 ; |X       | $F276
       .byte $80 ; |X       | $F277
       .byte $80 ; |X       | $F278
       .byte $9F ; |X  XXXXX| $F279
       .byte $90 ; |X  X    | $F27A
       .byte $90 ; |X  X    | $F27B
       .byte $9F ; |X  XXXXX| $F27C
       .byte $80 ; |X       | $F27D
       .byte $80 ; |X       | $F27E
       .byte $80 ; |X       | $F27F
       .byte $80 ; |X       | $F280
       .byte $80 ; |X       | $F281
       .byte $80 ; |X       | $F282
       .byte $80 ; |X       | $F283
       .byte $80 ; |X       | $F284
       .byte $F3 ; |XXXX  XX| $F285
       .byte $92 ; |X  X  X | $F286
       .byte $92 ; |X  X  X | $F287
       .byte $F3 ; |XXXX  XX| $F288
       .byte $00 ; |        | $F289
       .byte $00 ; |        | $F28A
       .byte $00 ; |        | $F28B
       .byte $00 ; |        | $F28C
       .byte $00 ; |        | $F28D
       .byte $00 ; |        | $F28E
       .byte $00 ; |        | $F28F
       .byte $00 ; |        | $F290
       .byte $F3 ; |XXXX  XX| $F291
       .byte $92 ; |X  X  X | $F292
       .byte $92 ; |X  X  X | $F293
       .byte $F2 ; |XXXX  X | $F294
       .byte $82 ; |X     X | $F295
       .byte $82 ; |X     X | $F296
       .byte $82 ; |X     X | $F297
       .byte $82 ; |X     X | $F298
       .byte $82 ; |X     X | $F299
       .byte $82 ; |X     X | $F29A
       .byte $82 ; |X     X | $F29B
       .byte $82 ; |X     X | $F29C
       .byte $92 ; |X  X  X | $F29D
       .byte $92 ; |X  X  X | $F29E
       .byte $92 ; |X  X  X | $F29F
       .byte $93 ; |X  X  XX| $F2A0
       .byte $90 ; |X  X    | $F2A1
       .byte $90 ; |X  X    | $F2A2
       .byte $90 ; |X  X    | $F2A3
       .byte $90 ; |X  X    | $F2A4
       .byte $90 ; |X  X    | $F2A5
       .byte $90 ; |X  X    | $F2A6
       .byte $90 ; |X  X    | $F2A7
       .byte $90 ; |X  X    | $F2A8
       .byte $9F ; |X  XXXXX| $F2A9
       .byte $90 ; |X  X    | $F2AA
       .byte $90 ; |X  X    | $F2AB
       .byte $9F ; |X  XXXXX| $F2AC
       .byte $80 ; |X       | $F2AD
LF2AE:
       .byte $80 ; |X       | $F2AE
       .byte $80 ; |X       | $F2AF
       .byte $80 ; |X       | $F2B0
       .byte $80 ; |X       | $F2B1
       .byte $80 ; |X       | $F2B2
       .byte $80 ; |X       | $F2B3
       .byte $80 ; |X       | $F2B4
       .byte $FF ; |XXXXXXXX| $F2B5
       .byte $FF ; |XXXXXXXX| $F2B6
       .byte $FF ; |XXXXXXXX| $F2B7
       .byte $FF ; |XXXXXXXX| $F2B8
       .byte $7F ; | XXXXXXX| $F2B9
       .byte $40 ; | X      | $F2BA
       .byte $40 ; | X      | $F2BB
       .byte $40 ; | X      | $F2BC
       .byte $40 ; | X      | $F2BD
       .byte $40 ; | X      | $F2BE
       .byte $40 ; | X      | $F2BF
       .byte $40 ; | X      | $F2C0
       .byte $40 ; | X      | $F2C1
       .byte $CF ; |XX  XXXX| $F2C2
       .byte $49 ; | X  X  X| $F2C3
       .byte $49 ; | X  X  X| $F2C4
       .byte $CF ; |XX  XXXX| $F2C5
       .byte $01 ; |       X| $F2C6
       .byte $01 ; |       X| $F2C7
       .byte $01 ; |       X| $F2C8
       .byte $01 ; |       X| $F2C9
       .byte $01 ; |       X| $F2CA
       .byte $01 ; |       X| $F2CB
       .byte $01 ; |       X| $F2CC
       .byte $01 ; |       X| $F2CD
       .byte $F9 ; |XXXXX  X| $F2CE
       .byte $09 ; |    X  X| $F2CF
       .byte $09 ; |    X  X| $F2D0
       .byte $F9 ; |XXXXX  X| $F2D1
       .byte $80 ; |X       | $F2D2
       .byte $80 ; |X       | $F2D3
       .byte $80 ; |X       | $F2D4
       .byte $80 ; |X       | $F2D5
       .byte $80 ; |X       | $F2D6
       .byte $80 ; |X       | $F2D7
       .byte $80 ; |X       | $F2D8
       .byte $80 ; |X       | $F2D9
       .byte $9F ; |X  XXXXX| $F2DA
       .byte $90 ; |X  X    | $F2DB
       .byte $90 ; |X  X    | $F2DC
       .byte $9F ; |X  XXXXX| $F2DD
       .byte $00 ; |        | $F2DE
       .byte $00 ; |        | $F2DF
       .byte $00 ; |        | $F2E0
       .byte $00 ; |        | $F2E1
       .byte $00 ; |        | $F2E2
       .byte $00 ; |        | $F2E3
       .byte $00 ; |        | $F2E4
       .byte $00 ; |        | $F2E5
       .byte $F9 ; |XXXXX  X| $F2E6
       .byte $09 ; |    X  X| $F2E7
       .byte $09 ; |    X  X| $F2E8
       .byte $F9 ; |XXXXX  X| $F2E9
       .byte $01 ; |       X| $F2EA
       .byte $01 ; |       X| $F2EB
       .byte $01 ; |       X| $F2EC
       .byte $01 ; |       X| $F2ED
       .byte $01 ; |       X| $F2EE
       .byte $01 ; |       X| $F2EF
       .byte $01 ; |       X| $F2F0
       .byte $01 ; |       X| $F2F1
       .byte $9F ; |X  XXXXX| $F2F2
       .byte $90 ; |X  X    | $F2F3
       .byte $90 ; |X  X    | $F2F4
       .byte $9F ; |X  XXXXX| $F2F5
       .byte $80 ; |X       | $F2F6
       .byte $80 ; |X       | $F2F7
       .byte $80 ; |X       | $F2F8
       .byte $80 ; |X       | $F2F9
       .byte $80 ; |X       | $F2FA
       .byte $80 ; |X       | $F2FB
       .byte $80 ; |X       | $F2FC
       .byte $80 ; |X       | $F2FD
       .byte $F9 ; |XXXXX  X| $F2FE
       .byte $09 ; |    X  X| $F2FF
       .byte $09 ; |    X  X| $F300
       .byte $F9 ; |XXXXX  X| $F301
       .byte $00 ; |        | $F302
LF303:
       .byte $00 ; |        | $F303
LF304:
       .byte $00 ; |        | $F304
       .byte $00 ; |        | $F305
       .byte $00 ; |        | $F306
       .byte $00 ; |        | $F307
       .byte $00 ; |        | $F308
       .byte $00 ; |        | $F309
       .byte $FF ; |XXXXXXXX| $F30A
       .byte $FF ; |XXXXXXXX| $F30B
       .byte $FF ; |XXXXXXXX| $F30C
       .byte $FF ; |XXXXXXXX| $F30D
       .byte $00 ; |        | $F30E
       .byte $00 ; |        | $F30F
       .byte $00 ; |        | $F310
       .byte $00 ; |        | $F311
       .byte $80 ; |X       | $F312
       .byte $88 ; |X   X   | $F313
       .byte $28 ; |  X X   | $F314
       .byte $79 ; | XXXX  X| $F315
       .byte $0C ; |    XX  | $F316
       .byte $78 ; | XXXX   | $F317
       .byte $82 ; |X     X | $F318
       .byte $80 ; |X       | $F319
       .byte $28 ; |  X X   | $F31A
       .byte $71 ; | XXX   X| $F31B
       .byte $00 ; |        | $F31C
       .byte $78 ; | XXXX   | $F31D
       .byte $8A ; |X   X X | $F31E
       .byte $88 ; |X   X   | $F31F
       .byte $28 ; |  X X   | $F320
       .byte $79 ; | XXXX  X| $F321
       .byte $0C ; |    XX  | $F322
       .byte $78 ; | XXXX   | $F323
       .byte $82 ; |X     X | $F324
       .byte $80 ; |X       | $F325
       .byte $28 ; |  X X   | $F326
       .byte $71 ; | XXX   X| $F327
       .byte $00 ; |        | $F328
       .byte $78 ; | XXXX   | $F329
       .byte $8A ; |X   X X | $F32A
       .byte $88 ; |X   X   | $F32B
       .byte $28 ; |  X X   | $F32C
       .byte $79 ; | XXXX  X| $F32D
       .byte $0C ; |    XX  | $F32E
       .byte $78 ; | XXXX   | $F32F
       .byte $82 ; |X     X | $F330
       .byte $80 ; |X       | $F331
       .byte $28 ; |  X X   | $F332
       .byte $71 ; | XXX   X| $F333
       .byte $00 ; |        | $F334
       .byte $78 ; | XXXX   | $F335
       .byte $8A ; |X   X X | $F336
       .byte $88 ; |X   X   | $F337
       .byte $28 ; |  X X   | $F338
       .byte $79 ; | XXXX  X| $F339
       .byte $0C ; |    XX  | $F33A
       .byte $78 ; | XXXX   | $F33B
       .byte $82 ; |X     X | $F33C
       .byte $80 ; |X       | $F33D
       .byte $28 ; |  X X   | $F33E
       .byte $71 ; | XXX   X| $F33F
       .byte $00 ; |        | $F340
       .byte $78 ; | XXXX   | $F341
       .byte $8A ; |X   X X | $F342
       .byte $88 ; |X   X   | $F343
       .byte $28 ; |  X X   | $F344
       .byte $79 ; | XXXX  X| $F345
       .byte $0C ; |    XX  | $F346
       .byte $78 ; | XXXX   | $F347
       .byte $82 ; |X     X | $F348
       .byte $80 ; |X       | $F349
       .byte $28 ; |  X X   | $F34A
       .byte $71 ; | XXX   X| $F34B
       .byte $00 ; |        | $F34C
       .byte $78 ; | XXXX   | $F34D
       .byte $8A ; |X   X X | $F34E
       .byte $88 ; |X   X   | $F34F
       .byte $28 ; |  X X   | $F350
       .byte $79 ; | XXXX  X| $F351
       .byte $0C ; |    XX  | $F352
       .byte $78 ; | XXXX   | $F353
       .byte $82 ; |X     X | $F354
       .byte $80 ; |X       | $F355
       .byte $28 ; |  X X   | $F356
       .byte $71 ; | XXX   X| $F357
       .byte $00 ; |        | $F358
       .byte $78 ; | XXXX   | $F359
       .byte $8A ; |X   X X | $F35A
       .byte $88 ; |X   X   | $F35B
       .byte $28 ; |  X X   | $F35C
       .byte $09 ; |    X  X| $F35D
       .byte $0C ; |    XX  | $F35E
       .byte $0A ; |    X X | $F35F
       .byte $02 ; |      X | $F360
       .byte $0A ; |    X X | $F361
       .byte $0A ; |    X X | $F362

IF363:
       LDX    $FC                     ;3
       LDA    LF508,X                 ;4
       STA    GRP1                    ;3
       CPY    #$5C                    ;2
       STA    HMCLR                   ;3
       BCS    LF390                   ;2
       CPY    $90                     ;3
       BCS    LF38A                   ;2
       LDA    LF405,X                 ;4
       BEQ    LF384                   ;2
       INC    $FC                     ;5
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    GRP1                    ;3
       JMP.ind ($91)                  ;5
LF384:
       INC    $9D                     ;5
       LDA    #<IF39D                 ;2
       STA    $93                     ;3
LF38A:
       LDA    #$00                    ;2
       CPY    #$0B                    ;2
       BNE    LF394                   ;2
LF390:
       LDA    $F8                     ;3
       AND    #$F4                    ;2

LF394:
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    COLUPF                  ;3 wall color in bonus stage
       JMP.ind ($91)                  ;5

IF39D:
       LDX    $9D                     ;3
       LDA    $F5,X                   ;4
       STA    COLUP1                  ;3
       LDA    LF4F8,X                 ;4
       STA    $90                     ;3
       LDA    $C9,X                   ;4
       STA    $FC                     ;3
       LDA    $C1,X                   ;4
       STA    $8A                     ;3
       AND    #$0F                    ;2
       STA    $88                     ;3
       LDA    CXPPMM                  ;3
       STA    $D1,X                   ;4
       STA    CXCLR                   ;3
       LDA    LF500,X                 ;4
       STA    REFP1                   ;3
       STA    NUSIZ1                  ;3
       LDA    #$CC                    ;2
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    $93                     ;3
       JMP.ind ($91)                  ;5

IF3CC:
       LDX    $88                     ;3
       LDA    $8A                     ;3
LF3D0:
       DEX                            ;2
       BPL    LF3D0                   ;2
       STA    RESP1                   ;3
       STA    HMP1                    ;3
       LDA    #$63                    ;2
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    $93                     ;3
       JMP.ind ($91)                  ;5


LF3E2:
       .byte $00 ; |        | $F3E2
       .byte $C0 ; |XX      | $F3E3
       .byte $60 ; | XX     | $F3E4
       .byte $F8 ; |XXXXX   | $F3E5
       .byte $60 ; | XX     | $F3E6
       .byte $C0 ; |XX      | $F3E7
       .byte $00 ; |        | $F3E8
       .byte $00 ; |        | $F3E9
LF3EA:
       .byte $FF ; |XXXXXXXX| $F3EA
       .byte $0E ; |    XXX | $F3EB
       .byte $FF ; |XXXXXXXX| $F3EC
       .byte $94 ; |X  X X  | $F3ED
       .byte $BE ; |X XXXXX | $F3EE
       .byte $18 ; |   XX   | $F3EF
       .byte $FF ; |XXXXXXXX| $F3F0
       .byte $90 ; |X  X    | $F3F1
       .byte $FF ; |XXXXXXXX| $F3F2
       .byte $0C ; |    XX  | $F3F3
       .byte $FF ; |XXXXXXXX| $F3F4
       .byte $44 ; | X   X  | $F3F5
       .byte $7F ; | XXXXXXX| $F3F6
       .byte $FF ; |XXXXXXXX| $F3F7
       .byte $C0 ; |XX      | $F3F8
       .byte $FF ; |XXXXXXXX| $F3F9
       .byte $A4 ; |X X  X  | $F3FA
       .byte $F4 ; |XXXX X  | $F3FB
       .byte $60 ; | XX     | $F3FC
       .byte $FF ; |XXXXXXXX| $F3FD
       .byte $24 ; |  X  X  | $F3FE
       .byte $FF ; |XXXXXXXX| $F3FF
       .byte $C0 ; |XX      | $F400
       .byte $FF ; |XXXXXXXX| $F401
       .byte $88 ; |X   X   | $F402
       .byte $F8 ; |XXXXX   | $F403
       .byte $00 ; |        | $F404
LF405:
       .byte $00 ; |        | $F405
       .byte $08 ; |    X   | $F406
       .byte $42 ; | X    X | $F407
       .byte $80 ; |X       | $F408
       .byte $81 ; |X      X| $F409
       .byte $4A ; | X  X X | $F40A
       .byte $10 ; |   X    | $F40B
       .byte $00 ; |        | $F40C
       .byte $08 ; |    X   | $F40D
       .byte $14 ; |   X X  | $F40E
       .byte $22 ; |  X   X | $F40F
       .byte $10 ; |   X    | $F410
       .byte $10 ; |   X    | $F411
       .byte $00 ; |        | $F412
       .byte $10 ; |   X    | $F413
       .byte $28 ; |  X X   | $F414
       .byte $04 ; |     X  | $F415
       .byte $08 ; |    X   | $F416
       .byte $00 ; |        | $F417
       .byte $10 ; |   X    | $F418
       .byte $20 ; |  X     | $F419
       .byte $20 ; |  X     | $F41A
       .byte $00 ; |        | $F41B
       .byte $2E ; |  X XXX | $F41C
       .byte $1F ; |   XXXXX| $F41D
       .byte $7C ; | XXXXX  | $F41E
       .byte $B0 ; |X XX    | $F41F
       .byte $73 ; | XXX  XX| $F420
       .byte $7C ; | XXXXX  | $F421
       .byte $00 ; |        | $F422
       .byte $2C ; |  X XX  | $F423
       .byte $1A ; |   XX X | $F424
       .byte $78 ; | XXXX   | $F425
       .byte $36 ; |  XX XX | $F426
       .byte $38 ; |  XXX   | $F427
       .byte $00 ; |        | $F428
       .byte $00 ; |        | $F429
       .byte $08 ; |    X   | $F42A
       .byte $1C ; |   XXX  | $F42B
       .byte $30 ; |  XX    | $F42C
       .byte $38 ; |  XXX   | $F42D
       .byte $00 ; |        | $F42E
       .byte $00 ; |        | $F42F
       .byte $00 ; |        | $F430
       .byte $08 ; |    X   | $F431
       .byte $6B ; | XX X XX| $F432
       .byte $08 ; |    X   | $F433
       .byte $08 ; |    X   | $F434
       .byte $6B ; | XX X XX| $F435
       .byte $08 ; |    X   | $F436
       .byte $00 ; |        | $F437
       .byte $3C ; |  XXXX  | $F438
       .byte $24 ; |  X  X  | $F439
       .byte $C9 ; |XX  X  X| $F43A
       .byte $A6 ; |X X  XX | $F43B
       .byte $41 ; | X     X| $F43C
       .byte $E3 ; |XXX   XX| $F43D
       .byte $00 ; |        | $F43E
       .byte $18 ; |   XX   | $F43F
       .byte $2C ; |  X XX  | $F440
       .byte $42 ; | X    X | $F441
       .byte $74 ; | XXX X  | $F442
       .byte $4A ; | X  X X | $F443
       .byte $74 ; | XXX X  | $F444
       .byte $00 ; |        | $F445
       .byte $18 ; |   XX   | $F446
       .byte $24 ; |  X  X  | $F447
       .byte $04 ; |     X  | $F448
       .byte $14 ; |   X X  | $F449
       .byte $20 ; |  X     | $F44A
       .byte $34 ; |  XX X  | $F44B
       .byte $00 ; |        | $F44C
       .byte $10 ; |   X    | $F44D
       .byte $08 ; |    X   | $F44E
       .byte $10 ; |   X    | $F44F
       .byte $10 ; |   X    | $F450
       .byte $08 ; |    X   | $F451
       .byte $10 ; |   X    | $F452
       .byte $00 ; |        | $F453
       .byte $16 ; |   X XX | $F454
       .byte $5D ; | X XXX X| $F455
       .byte $30 ; |  XX    | $F456
       .byte $70 ; | XXX    | $F457
       .byte $7D ; | XXXXX X| $F458
       .byte $88 ; |X   X   | $F459
       .byte $84 ; |X    X  | $F45A
       .byte $00 ; |        | $F45B
       .byte $0A ; |    X X | $F45C
       .byte $3D ; |  XXXX X| $F45D
       .byte $F0 ; |XXXX    | $F45E
       .byte $70 ; | XXX    | $F45F
       .byte $7D ; | XXXXX X| $F460
       .byte $50 ; | X X    | $F461
       .byte $50 ; | X X    | $F462
       .byte $00 ; |        | $F463
       .byte $18 ; |   XX   | $F464
       .byte $18 ; |   XX   | $F465
       .byte $3E ; |  XXXXX | $F466
       .byte $58 ; | X XX   | $F467
       .byte $3E ; |  XXXXX | $F468
       .byte $61 ; | XX    X| $F469
       .byte $81 ; |X      X| $F46A
       .byte $00 ; |        | $F46B
       .byte $18 ; |   XX   | $F46C
       .byte $18 ; |   XX   | $F46D
       .byte $18 ; |   XX   | $F46E
       .byte $3C ; |  XXXX  | $F46F
       .byte $1C ; |   XXX  | $F470
       .byte $34 ; |  XX X  | $F471
       .byte $24 ; |  X  X  | $F472
       .byte $00 ; |        | $F473
       .byte $42 ; | X    X | $F474
       .byte $FF ; |XXXXXXXX| $F475
       .byte $42 ; | X    X | $F476
       .byte $00 ; |        | $F477
       .byte $0F ; |    XXXX| $F478
       .byte $34 ; |  XX X  | $F479
       .byte $3C ; |  XXXX  | $F47A
       .byte $00 ; |        | $F47B
       .byte $2A ; |  X X X | $F47C
       .byte $7F ; | XXXXXXX| $F47D
       .byte $2A ; |  X X X | $F47E
       .byte $00 ; |        | $F47F
       .byte $1F ; |   XXXXX| $F480
       .byte $5A ; | X XX X | $F481
       .byte $E8 ; |XXX X   | $F482
       .byte $00 ; |        | $F483
       .byte $19 ; |   XX  X| $F484
       .byte $54 ; | X X X  | $F485
       .byte $14 ; |   X X  | $F486
       .byte $00 ; |        | $F487
       .byte $70 ; | XXX    | $F488
       .byte $FF ; |XXXXXXXX| $F489
       .byte $70 ; | XXX    | $F48A
       .byte $00 ; |        | $F48B
       .byte $08 ; |    X   | $F48C
       .byte $3E ; |  XXXXX | $F48D
       .byte $08 ; |    X   | $F48E
       .byte $00 ; |        | $F48F
       .byte $18 ; |   XX   | $F490
       .byte $18 ; |   XX   | $F491
       .byte $18 ; |   XX   | $F492
       .byte $18 ; |   XX   | $F493
       .byte $18 ; |   XX   | $F494
       .byte $18 ; |   XX   | $F495
       .byte $18 ; |   XX   | $F496
       .byte $00 ; |        | $F497
       .byte $24 ; |  X  X  | $F498
       .byte $BD ; |X XXXX X| $F499
       .byte $24 ; |  X  X  | $F49A
       .byte $00 ; |        | $F49B
       .byte $16 ; |   X XX | $F49C
       .byte $5D ; | X XXX X| $F49D
       .byte $30 ; |  XX    | $F49E
       .byte $70 ; | XXX    | $F49F
       .byte $3D ; |  XXXX X| $F4A0
       .byte $20 ; |  X     | $F4A1
       .byte $20 ; |  X     | $F4A2
       .byte $00 ; |        | $F4A3
       .byte $30 ; |  XX    | $F4A4
       .byte $FF ; |XXXXXXXX| $F4A5
       .byte $30 ; |  XX    | $F4A6
       .byte $00 ; |        | $F4A7
LF4A8:
       .byte $E3 ; |XXX   XX| $F4A8
       .byte $90 ; |X  X    | $F4A9
       .byte $75 ; | XXX X X| $F4AA
       .byte $75 ; | XXX X X| $F4AB
       .byte $C5 ; |XX   X X| $F4AC
       .byte $B0 ; |X XX    | $F4AD
       .byte $06 ; |     XX | $F4AE
       .byte $00 ; |        | $F4AF
       .byte $59 ; | X XX  X| $F4B0
       .byte $D5 ; |XX X X X| $F4B1
       .byte $55 ; | X X X X| $F4B2
       .byte $55 ; | X X X X| $F4B3
       .byte $D5 ; |XX X X X| $F4B4
       .byte $55 ; | X X X X| $F4B5
       .byte $0C ; |    XX  | $F4B6
       .byte $00 ; |        | $F4B7
       .byte $79 ; | XXXX  X| $F4B8
       .byte $D5 ; |XX X X X| $F4B9
       .byte $65 ; | XX  X X| $F4BA
       .byte $30 ; |  XX    | $F4BB
       .byte $D5 ; |XX X X X| $F4BC
       .byte $75 ; | XXX X X| $F4BD
       .byte $0C ; |    XX  | $F4BE
       .byte $00 ; |        | $F4BF
       .byte $9A ; |X  XX X | $F4C0
       .byte $75 ; | XXX X X| $F4C1
       .byte $C5 ; |XX   X X| $F4C2
       .byte $90 ; |X  X    | $F4C3
       .byte $75 ; | XXX X X| $F4C4
       .byte $C5 ; |XX   X X| $F4C5
       .byte $0A ; |    X X | $F4C6
       .byte $00 ; |        | $F4C7
       .byte $53 ; | X X  XX| $F4C8
       .byte $57 ; | X X XXX| $F4C9
       .byte $06 ; |     XX | $F4CA
       .byte $02 ; |      X | $F4CB
       .byte $53 ; | X X  XX| $F4CC
       .byte $57 ; | X X XXX| $F4CD
       .byte $06 ; |     XX | $F4CE
       .byte $00 ; |        | $F4CF
       .byte $F5 ; |XXXX X X| $F4D0
       .byte $75 ; | XXX X X| $F4D1
       .byte $D5 ; |XX X X X| $F4D2
       .byte $D5 ; |XX X X X| $F4D3
       .byte $75 ; | XXX X X| $F4D4
       .byte $F5 ; |XXXX X X| $F4D5
       .byte $05 ; |     X X| $F4D6
       .byte $00 ; |        | $F4D7
       .byte $00 ; |        | $F4D8
       .byte $00 ; |        | $F4D9
       .byte $00 ; |        | $F4DA
       .byte $00 ; |        | $F4DB
       .byte $00 ; |        | $F4DC
       .byte $00 ; |        | $F4DD
       .byte $00 ; |        | $F4DE
       .byte $00 ; |        | $F4DF
       .byte $5B ; | X XX XX| $F4E0
       .byte $3C ; |  XXXX  | $F4E1
       .byte $5D ; | X XXX X| $F4E2
       .byte $55 ; | X X X X| $F4E3
       .byte $6D ; | XX XX X| $F4E4
       .byte $59 ; | X XX  X| $F4E5
       .byte $0E ; |    XXX | $F4E6
       .byte $00 ; |        | $F4E7
LF4E8:
       .byte $00 ; |        | $F4E8
       .byte $04 ; |     X  | $F4E9
       .byte $09 ; |    X  X| $F4EA
       .byte $00 ; |        | $F4EB
       .byte $03 ; |      XX| $F4EC
       .byte $08 ; |    X   | $F4ED
       .byte $00 ; |        | $F4EE
       .byte $02 ; |      X | $F4EF
       .byte $07 ; |     XXX| $F4F0
       .byte $0C ; |    XX  | $F4F1
       .byte $01 ; |       X| $F4F2
       .byte $06 ; |     XX | $F4F3
       .byte $0B ; |    X XX| $F4F4
       .byte $00 ; |        | $F4F5
       .byte $05 ; |     X X| $F4F6
       .byte $0A ; |    X X | $F4F7
LF4F8:
       .byte $5A ; | X XX X | $F4F8
       .byte $50 ; | X X    | $F4F9
       .byte $46 ; | X   XX | $F4FA
       .byte $3C ; |  XXXX  | $F4FB
       .byte $32 ; |  XX  X | $F4FC
       .byte $28 ; |  X X   | $F4FD
       .byte $1E ; |   XXXX | $F4FE
       .byte $00 ; |        | $F4FF
LF500:
       .byte $00 ; |        | $F500
       .byte $0A ; |    X X | $F501
       .byte $02 ; |      X | $F502
       .byte $0A ; |    X X | $F503
       .byte $02 ; |      X | $F504
       .byte $0A ; |    X X | $F505
       .byte $02 ; |      X | $F506
       .byte $00 ; |        | $F507
LF508:
       .byte $00 ; |        | $F508
       .byte $00 ; |        | $F509
       .byte $10 ; |   X    | $F50A
       .byte $09 ; |    X  X| $F50B
       .byte $54 ; | X X X  | $F50C
       .byte $10 ; |   X    | $F50D
       .byte $04 ; |     X  | $F50E
       .byte $00 ; |        | $F50F
       .byte $00 ; |        | $F510
       .byte $20 ; |  X     | $F511
       .byte $48 ; | X  X   | $F512
       .byte $48 ; | X  X   | $F513
       .byte $28 ; |  X X   | $F514
       .byte $00 ; |        | $F515
       .byte $00 ; |        | $F516
       .byte $04 ; |     X  | $F517
       .byte $10 ; |   X    | $F518
       .byte $10 ; |   X    | $F519
       .byte $00 ; |        | $F51A
       .byte $00 ; |        | $F51B
       .byte $08 ; |    X   | $F51C
       .byte $08 ; |    X   | $F51D
       .byte $00 ; |        | $F51E
       .byte $00 ; |        | $F51F
       .byte $3F ; |  XXXXXX| $F520
       .byte $5D ; | X XXX X| $F521
       .byte $34 ; |  XX X  | $F522
       .byte $E0 ; |XXX     | $F523
       .byte $76 ; | XXX XX | $F524
       .byte $00 ; |        | $F525
       .byte $00 ; |        | $F526
       .byte $3E ; |  XXXXX | $F527
       .byte $18 ; |   XX   | $F528
       .byte $72 ; | XXX  X | $F529
       .byte $3C ; |  XXXX  | $F52A
       .byte $00 ; |        | $F52B
       .byte $00 ; |        | $F52C
       .byte $00 ; |        | $F52D
       .byte $1C ; |   XXX  | $F52E
       .byte $38 ; |  XXX   | $F52F
       .byte $2C ; |  X XX  | $F530
       .byte $00 ; |        | $F531
       .byte $00 ; |        | $F532
       .byte $00 ; |        | $F533
       .byte $00 ; |        | $F534
       .byte $49 ; | X  X  X| $F535
       .byte $22 ; |  X   X | $F536
       .byte $CB ; |XX  X XX| $F537
       .byte $22 ; |  X   X | $F538
       .byte $49 ; | X  X  X| $F539
       .byte $00 ; |        | $F53A
       .byte $00 ; |        | $F53B
       .byte $24 ; |  X  X  | $F53C
       .byte $6E ; | XX XXX | $F53D
       .byte $83 ; |X     XX| $F53E
       .byte $E3 ; |XXX   XX| $F53F
       .byte $9D ; |X  XXX X| $F540
       .byte $00 ; |        | $F541
       .byte $00 ; |        | $F542
       .byte $28 ; |  X X   | $F543
       .byte $62 ; | XX   X | $F544
       .byte $54 ; | X X X  | $F545
       .byte $22 ; |  X   X | $F546
       .byte $5A ; | X XX X | $F547
       .byte $00 ; |        | $F548
       .byte $00 ; |        | $F549
       .byte $14 ; |   X X  | $F54A
       .byte $30 ; |  XX    | $F54B
       .byte $28 ; |  X X   | $F54C
       .byte $14 ; |   X X  | $F54D
       .byte $08 ; |    X   | $F54E
       .byte $00 ; |        | $F54F
       .byte $00 ; |        | $F550
       .byte $00 ; |        | $F551
       .byte $10 ; |   X    | $F552
       .byte $00 ; |        | $F553
       .byte $00 ; |        | $F554
       .byte $10 ; |   X    | $F555
       .byte $00 ; |        | $F556
       .byte $00 ; |        | $F557
       .byte $1F ; |   XXXXX| $F558
       .byte $74 ; | XXX X  | $F559
       .byte $30 ; |  XX    | $F55A
       .byte $74 ; | XXX X  | $F55B
       .byte $DF ; |XX XXXXX| $F55C
       .byte $8C ; |X   XX  | $F55D
       .byte $00 ; |        | $F55E
       .byte $00 ; |        | $F55F
       .byte $2F ; |  X XXXX| $F560
       .byte $B4 ; |X XX X  | $F561
       .byte $30 ; |  XX    | $F562
       .byte $74 ; | XXX X  | $F563
       .byte $77 ; | XXX XXX| $F564
       .byte $50 ; | X X    | $F565
       .byte $00 ; |        | $F566
       .byte $00 ; |        | $F567
       .byte $10 ; |   X    | $F568
       .byte $12 ; |   X  X | $F569
       .byte $7C ; | XXXXX  | $F56A
       .byte $18 ; |   XX   | $F56B
       .byte $6F ; | XX XXXX| $F56C
       .byte $C1 ; |XX     X| $F56D
       .byte $00 ; |        | $F56E
       .byte $00 ; |        | $F56F
       .byte $10 ; |   X    | $F570
       .byte $10 ; |   X    | $F571
       .byte $3C ; |  XXXX  | $F572
       .byte $38 ; |  XXX   | $F573
       .byte $34 ; |  XX X  | $F574
       .byte $24 ; |  X  X  | $F575
       .byte $00 ; |        | $F576
       .byte $00 ; |        | $F577
       .byte $99 ; |X  XX  X| $F578
       .byte $99 ; |X  XX  X| $F579
       .byte $00 ; |        | $F57A
       .byte $00 ; |        | $F57B
       .byte $F6 ; |XXXX XX | $F57C
       .byte $18 ; |   XX   | $F57D
       .byte $00 ; |        | $F57E
       .byte $00 ; |        | $F57F
       .byte $1C ; |   XXX  | $F580
       .byte $1C ; |   XXX  | $F581
       .byte $00 ; |        | $F582
       .byte $00 ; |        | $F583
       .byte $39 ; |  XXX  X| $F584
       .byte $98 ; |X  XX   | $F585
       .byte $00 ; |        | $F586
       .byte $00 ; |        | $F587
       .byte $3E ; |  XXXXX | $F588
       .byte $14 ; |   X X  | $F589
       .byte $00 ; |        | $F58A
       .byte $00 ; |        | $F58B
       .byte $38 ; |  XXX   | $F58C
       .byte $38 ; |  XXX   | $F58D
       .byte $00 ; |        | $F58E
       .byte $00 ; |        | $F58F
       .byte $08 ; |    X   | $F590
       .byte $08 ; |    X   | $F591
       .byte $00 ; |        | $F592
       .byte $00 ; |        | $F593
       .byte $10 ; |   X    | $F594
       .byte $10 ; |   X    | $F595
       .byte $18 ; |   XX   | $F596
       .byte $18 ; |   XX   | $F597
       .byte $18 ; |   XX   | $F598
       .byte $18 ; |   XX   | $F599
       .byte $00 ; |        | $F59A
       .byte $00 ; |        | $F59B
       .byte $B4 ; |X XX X  | $F59C
       .byte $2D ; |  X XX X| $F59D
       .byte $00 ; |        | $F59E
       .byte $00 ; |        | $F59F
       .byte $1F ; |   XXXXX| $F5A0
       .byte $74 ; | XXX X  | $F5A1
       .byte $30 ; |  XX    | $F5A2
       .byte $74 ; | XXX X  | $F5A3
       .byte $27 ; |  X  XXX| $F5A4
       .byte $20 ; |  X     | $F5A5
       .byte $00 ; |        | $F5A6
       .byte $00 ; |        | $F5A7
       .byte $7C ; | XXXXX  | $F5A8
       .byte $7C ; | XXXXX  | $F5A9
       .byte $00 ; |        | $F5AA

START: ;@ $F5AB
       SEI                            ;2
       CLD                            ;2
       LDX    #$00                    ;2
       LDY    #$80                    ;2
LF5B1:
       LDA    #$00                    ;2
LF5B3:
       STA    VSYNC,X                 ;4
       INX                            ;2
       BNE    LF5B3                   ;2
       STY    $80                     ;3
       DEC    $F4                     ;5
       LDX    $81                     ;3
       TYA                            ;2
       BPL    LF5C6                   ;2
       LDA    LFF70,X                 ;4
       STA    $8D                     ;3
LF5C6:
       LDA    LFF74,X                 ;4
       STA    $C0                     ;3
       LDA    LFF7C,X                 ;4
       STA    $DC                     ;3
       LDA    #$01                    ;2
       STA    CTRLPF                  ;3
       LDA    #<IF088                 ;2
       STA    $91                     ;3
       LDA    #>IF088                 ;2
       STA    $92                     ;3
       LDA    #$80                    ;2
       LDX    #$08                    ;2
LF5E0:
       STA    $83,X                   ;4
       DEX                            ;2
       BPL    LF5E0                   ;2
       CPY    #$80                    ;2
       BNE    LF5F3                   ;2
       LDX    #$0B                    ;2
LF5EB:
       SEC                            ;2
       SBC    #$04                    ;2
       STA    $83,X                   ;4
       DEX                            ;2
       BPL    LF5EB                   ;2

;indirect
LF5F3:
       LDA    #<IF11A                 ;2
       STA    $93                     ;3
       LDA    #>IF11A                 ;2
       STA    $94                     ;3
       LDX    #$1A                    ;2
LF5FD:
       LDA    LF3EA,X                 ;4
       STA    $C1,X                   ;4
       DEX                            ;2
       BPL    LF5FD                   ;2
       LDA    #$03                    ;2
       STA    $E7                     ;3
LF609:
       LDX    #$43                    ;2
       LDA    #$00                    ;2
LF60D:
       STA    $DD                     ;3
       STA    PF0                     ;3
       STX    $AD                     ;3
       LDA    #$3C                    ;2
       STA    $B4                     ;3
       STA    $B6                     ;3
       LDA    #$74                    ;2
       STA    $BC                     ;3
       LDX    #$03                    ;2
       STX    $A2                     ;3
       INX                            ;2
       STX    $E6                     ;3
       LDX    #$00                    ;2
       STX    $E8                     ;3
       STX    $AA                     ;3
       STX    $AB                     ;3
       STX    $AC                     ;3
       STX    $AF                     ;3
       STX    $EB                     ;3
       STX    AUDV0                   ;3
       DEX                            ;2
       TXS                            ;2
       LDA    #$1E                    ;2
       STA    $EA                     ;3
LF63A:
       LDX    INTIM                   ;4
       BNE    LF63A                   ;2
       DEX                            ;2
       LDA    #$31                    ;2
       STA    WSYNC                   ;3
       STX    VSYNC                   ;3
       STA    TIM64T                  ;4
       LDX    #$77                    ;2
       LDA    $BE                     ;3
       AND    #$08                    ;2
       BEQ    LF653                   ;2
       LDX    #$87                    ;2
LF653:
       STX    $A7                     ;3
       STA    WSYNC                   ;3
       LDA    $BE                     ;3
       AND    #$01                    ;2
       TAY                            ;2
       LDA    LFE45,Y                 ;4
       STA    HMM0                    ;3
       LDA    LFE47,Y                 ;4
       STA    HMM1                    ;3
       LDX    LFE49,Y                 ;4
       STA    WSYNC                   ;3
LF66B:
       DEX                            ;2
       BPL    LF66B                   ;2
       STA    RESM0                   ;3
       PLA                            ;4
       PHA                            ;3
       STA    RESM1                   ;3
       STA    WSYNC                   ;3
       INX                            ;2
       STX    VSYNC                   ;3
       LDX    $E7                     ;3
       LDA    LFEE3,X                 ;4
       STA    $B5                     ;3
       LDY    LFFF6,X                 ;4
       LDA    $80                     ;3
       BNE    LF6B6                   ;2
       LDA    $F4                     ;3
       BEQ    LF6B6                   ;2
       LDA    INPT4                   ;3
       BMI    LF6B6                   ;2
       LDA    $BA                     ;3
       STA    $BB                     ;3
       AND    #$08                    ;2
       EOR    #$08                    ;2
       BNE    LF69B                   ;2
       LDA    #$F8                    ;2
LF69B:
       CLC                            ;2
       ADC    $B4                     ;3
       CMP    #$77                    ;2
       BCS    LF6B6                   ;2
       STA    $B5                     ;3
       LDA    #$4E                    ;2
       AND    $9E                     ;3
       STA    $F8                     ;3
       DEC    $F4                     ;5
       LDA    #$9F                    ;2
       STA    $A7                     ;3
       STA    $EC                     ;3
       LDY    $AD                     ;3
       DEY                            ;2
       DEY                            ;2
LF6B6:
       STY    $AE                     ;3
       JSR    LFA44                   ;6
       LDX    #$04                    ;2
LF6BD:
       LDA    $B1,X                   ;4
       LDY    #$FF                    ;2
LF6C1:
       INY                            ;2
       SEC                            ;2
       SBC    #$0F                    ;2
       BCS    LF6C1                   ;2
       STY    $84                     ;3
       SBC    #$00                    ;2
       EOR    #$07                    ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       STA    $86                     ;3
       LDA    $9F,X                   ;4
       LSR                            ;2
       BCS    LF6DE                   ;2
       ASL                            ;2
       ASL                            ;2
       ASL                            ;2
       JMP    LF6E0                   ;3
LF6DE:
       LDA    $B7,X                   ;4
LF6E0:
       AND    #$08                    ;2
       ORA    $86                     ;3
       ORA    $84                     ;3
       STA    $B7,X                   ;4
       DEX                            ;2
       BPL    LF6BD                   ;2
       INX                            ;2
       JSR    LF939                   ;6
       STA    $9C                     ;3
       TAX                            ;2
       LDA    $AA,X                   ;4
       CMP    #$2C                    ;2
       BCC    LF6FD                   ;2
       SBC.wy $AA,Y                   ;4
       CMP    #$26                    ;2
LF6FD:
       LDA    #$00                    ;2
       ROR                            ;2
       ORA    $9C                     ;3
       STA    $ED                     ;3
       LDX    #$03                    ;2
       JSR    LF939                   ;6
       CLC                            ;2
       ADC    #$03                    ;2
       STA    $9D                     ;3
       LDY    #$07                    ;2
       JSR    LF902                   ;6
       LDY    #$08                    ;2
       JSR    LF902                   ;6
       LDX    #$C0                    ;2
       LDA    $BE                     ;3
       LSR                            ;2
       BCC    LF721                   ;2
       LDX    #$CD                    ;2
LF721:
       TXS                            ;2
       LDA    $80                     ;3
       AND    #$20                    ;2
       BEQ    LF730                   ;2
       LDA    #$FF                    ;2
       STA    $9D                     ;3
       LDA    #$03                    ;2
       STA    $9C                     ;3
LF730:
       LDA    #$00                    ;2
       STA    $9E                     ;3
       STA    $FC                     ;3
       STA    $8C                     ;3
       STA    NUSIZ0                  ;3
       STA    NUSIZ1                  ;3
       LDY    #$60                    ;2
       STY    $8F                     ;3
       STY    $90                     ;3
       DEY                            ;2
LF743:
       LDA    INTIM                   ;4
       BNE    LF743                   ;2
       STA    WSYNC                   ;3
       STA    HMOVE                   ;3
       STA    VBLANK                  ;3
       JMP.ind ($91)                  ;5
LF751:
       LDA    #$27                    ;2
       STA    WSYNC                   ;3
       STA    TIM64T                  ;4
       LDX    #$FF                    ;2
       STX    VBLANK                  ;3
       TXS                            ;2 start with %11111111
       LDA    SWCHB                   ;4
       AND    #$08                    ;2 check B&W
       BNE    LF766                   ;2 if color, skip next line
       LDX    #$0D                    ;2 use %00001101 instead
LF766:
       TXA                            ;2 move that bit pattern to A
       LDY    #$00                    ;2
       BIT    $80                     ;3
       BVC    LF773                   ;2
       LDY    $BF                     ;3
       ORA    #$02                    ;2
       AND    #$F6                    ;2
LF773:
       STA    $9E                     ;3 save the bit pattern to $9E
       STY    $84                     ;3
       LDA    $E8                     ;3
       BNE    LF78F                   ;2
       LDX    #$08                    ;2
LF77D:
       LDA    LFE3C,X                 ;4 get value from a table
       EOR    $84                     ;3
       AND    $9E                     ;3 strip away bits when B&W
       STA    $F5,X                   ;4
       CPX    #$07                    ;2
       BCC    LF78C                   ;2
       STA    VBLANK,X                ;4 when X = 7 or 8, save to the color registers
LF78C:
       DEX                            ;2
       BPL    LF77D                   ;2
LF78F:
       LDY    #$01                    ;2
       LSR    $80                     ;5
       LDA    $BE                     ;3
       EOR    #$3B                    ;2
       BNE    LF79A                   ;2
       CLC                            ;2
LF79A:
       LDA    SWCHB                   ;4
       EOR    #$FF                    ;2
       AND    #$03                    ;2
       BEQ    LF7B8                   ;2
       BCS    LF7B9                   ;2
       CMP    #$02                    ;2
       BCC    LF7B3                   ;2
       LDA    $81                     ;3
       ADC    #$00                    ;2
       AND    #$03                    ;2
       STA    $81                     ;3
       LDY    #$81                    ;2
LF7B3:
       LDX    #$83                    ;2
       JMP    LF5B1                   ;3
LF7B8:
       CLC                            ;2
LF7B9:
       ROL    $80                     ;5
       JSR    LFBF6                   ;6
       JSR    LFC9A                   ;6
       LDA    $80                     ;3
       BMI    LF841                   ;2
       LDA    $EA                     ;3
       BNE    LF841                   ;2
       LDX    #$03                    ;2
       JSR    LFE06                   ;6
       TAX                            ;2
       BCC    LF7D5                   ;2
       LDA    #$FF                    ;2
       STA    $E5                     ;3
LF7D5:
       LDA    $A2                     ;3
       AND    #$03                    ;2
       TAY                            ;2
       EOR    #$02                    ;2
       STA    $8E                     ;3
       BCS    LF7E3                   ;2
       LDX    LFE99,Y                 ;4
LF7E3:
       LDA    $80                     ;3
       AND    #$20                    ;2
       BEQ    LF7ED                   ;2
       LDX    #$0A                    ;2
       LDY    #$00                    ;2
LF7ED:
       LDA    SWCHA                   ;4
       EOR    #$FF                    ;2
       AND    #$F0                    ;2
       BEQ    LF7F8                   ;2
       STY    $BF                     ;3
LF7F8:
       ORA    LFE91,Y                 ;4
       AND    LFE75,X                 ;4
       BEQ    LF841                   ;2
       STA    $84                     ;3
LF802:
       INY                            ;2
       LDA    LFE91,Y                 ;4
       AND    $84                     ;3
       BEQ    LF802                   ;2
       ROR    $E1                     ;5
       LDA    $DC                     ;3
       AND    #$FE                    ;2
       ASL                            ;2
       ASL                            ;2
       TAX                            ;2
       TYA                            ;2
       AND    #$03                    ;2
       STA    $86                     ;3
       EOR    $8E                     ;3
       BNE    LF820                   ;2
       LDY    #$7F                    ;2
       STY    $EC                     ;3
LF820:
       LSR                            ;2
       LDA    LFEAC,X                 ;4
       BCS    LF838                   ;2
       LDA    LFEA8,X                 ;4
       LDY    $F3                     ;3
       BNE    LF838                   ;2
       LDA    LFEAB,X                 ;4
       BIT    $E1                     ;3
       BMI    LF838                   ;2
       LDA    $A2                     ;3
       AND    #$FC                    ;2
LF838:
       ORA    $86                     ;3
       STA    $A2                     ;3
       LDX    #$03                    ;2
       JSR    LFA09                   ;6
LF841:
       LDX    #$03                    ;2
LF843:
       CPX    $E6                     ;3
       BNE    LF85A                   ;2
       LDA    #$00                    ;2
       STA    $A6                     ;3
       LDA    $EA                     ;3
       AND    #$18                    ;2
       LSR                            ;2
       LSR                            ;2
       ORA    LFF3E,X                 ;4
       TAY                            ;2
       LDA    LFF4D,Y                 ;4
       BNE    LF883                   ;2
LF85A:
       LDA    $AA,X                   ;4
       CMP    #$37                    ;2
       BNE    LF872                   ;2
       LDA    $B1,X                   ;4
       CMP    #$05                    ;2
       BCC    LF86C                   ;2
       CMP    #$73                    ;2
       BCC    LF872                   ;2
       EOR    #$77                    ;2
LF86C:
       TAY                            ;2
       LDA    LFF60,Y                 ;4
       BNE    LF883                   ;2
LF872:
       LDA    $BE                     ;3
       CPX    #$03                    ;2
       BEQ    LF879                   ;2
       LSR                            ;2
LF879:
       AND    #$0C                    ;2
       LSR                            ;2
       ORA    LFF3E,X                 ;4
       TAY                            ;2
       LDA    LFF45,Y                 ;4
LF883:
       STA    $A3,X                   ;4
       DEX                            ;2
       BPL    LF843                   ;2
       INC    $BE                     ;5
       BNE    LF894                   ;2
       INC    $BF                     ;5
       BPL    LF894                   ;2
       LDA    #$C0                    ;2
       STA    $80                     ;3
LF894:
       LDA    $BE                     ;3
       LSR                            ;2
       BCS    LF8F9                   ;2
       LDA    $EA                     ;3
       BEQ    LF8C6                   ;2
       DEC    $EA                     ;5
       BNE    LF8F9                   ;2
       LDX    $E6                     ;3
       LDY    #$00                    ;2
       STY    $AA,X                   ;4
       STY    $ED                     ;3
       LDA    $80                     ;3
       AND    #$10                    ;2
       BEQ    LF8B4                   ;2
       STY    $80                     ;3
       JMP    LF5F3                   ;3
LF8B4:
       CPX    #$03                    ;2
       BNE    LF8C6                   ;2
       DEY                            ;2
       STY    $F4                     ;3
       DEC    $C0                     ;5
       BNE    LF8C3                   ;2
       LDA    #$C0                    ;2
       STA    $80                     ;3
LF8C3:
       JMP    LF609                   ;3
LF8C6:
       LDA    $EB                     ;3
       BEQ    LF8CC                   ;2
       DEC    $EB                     ;5
LF8CC:
       LDA    #$04                    ;2
       STA    $E6                     ;3
       LDA    $E8                     ;3
       BEQ    LF8F1                   ;2
       DEC    $E8                     ;5
       CMP    #$3C                    ;2
       BCS    LF8F1                   ;2
       LDY    #$0F                    ;2
       AND    #$08                    ;2
       BNE    LF8E5                   ;2
       LDA    #$8B                    ;2
       AND    $9E                     ;3
       TAY                            ;2
LF8E5:
       LDX    #$02                    ;2
LF8E7:
       LDA    $F5,X                   ;4
       LSR                            ;2
       BCC    LF8EE                   ;2
       STY    $F5,X                   ;4
LF8EE:
       DEX                            ;2
       BPL    LF8E7                   ;2
LF8F1:
       DEC    $DD                     ;5
       BNE    LF8F9                   ;2
       LDA    #$00                    ;2
       STA    $AF                     ;3
LF8F9:
       JSR    LFD55                   ;6
       JSR    LF971                   ;6
       JMP    LF63A                   ;3
LF902:
       LDA    $BE                     ;3
       STA    $88                     ;3
LF906:
       STY    $84                     ;3
LF908:
       LDX    $84                     ;3
       LDY    $95,X                   ;4
       LDX    $95,Y                   ;4
       CPX    #$06                    ;2
       BEQ    LF938                   ;2
       LDA.wy $AA,Y                   ;4
       SEC                            ;2
       SBC    LFF65,Y                 ;4
       CMP    $AA,X                   ;4
       BCS    LF906                   ;2
       TYA                            ;2
       CMP.wy $95,Y                   ;4
       BCS    LF92D                   ;2
       LSR    $88                     ;5
       BCS    LF931                   ;2
LF927:
       LDY    $84                     ;3
       STX    $95,Y                   ;4
       BPL    LF908                   ;2
LF92D:
       LSR    $88                     ;5
       BCS    LF927                   ;2
LF931:
       LDA    $95,X                   ;4
       STA.wy $95,Y                   ;5
       BPL    LF908                   ;2
LF938:
       RTS                            ;6

LF939:
       STX    $84                     ;3
       LDA    $AA,X                   ;4
       CMP    $AB,X                   ;4
       ROL    $86                     ;5
       CMP    $AC,X                   ;4
       ROL    $86                     ;5
       LDA    $AB,X                   ;4
       CMP    $AC,X                   ;4
       LDA    $86                     ;3
       ROL                            ;2
       AND    #$07                    ;2
       TAY                            ;2
       INX                            ;2
       INX                            ;2
       LDA    LFE6B,Y                 ;4
LF954:
       STA    $86                     ;3
       AND    #$03                    ;2
       CMP    #$03                    ;2
       BNE    LF962                   ;2
       TXA                            ;2
       TAY                            ;2
       LDA    #$06                    ;2
       BNE    LF965                   ;2
LF962:
       CLC                            ;2
       ADC    $84                     ;3
LF965:
       STA    $95,X                   ;4
       LDA    $86                     ;3
       LSR                            ;2
       LSR                            ;2
       DEX                            ;2
       CPX    $84                     ;3
       BPL    LF954                   ;2
       RTS                            ;6

LF971:
       BIT    $80                     ;3
       BMI    LF980                   ;2
       LDY    $EE                     ;3
       LDA    LFF80,Y                 ;4
       BNE    LF986                   ;2
       LDA    $F1                     ;3
       STA    $EE                     ;3
LF980:
       LDA    #$00                    ;2
       STA    $F1                     ;3
       BEQ    LF99C                   ;2
LF986:
       INC    $EE                     ;5
       CMP    #$F0                    ;2
       BCC    LF990                   ;2
       STA    AUDC1                   ;3
       BCS    LF9A7                   ;2
LF990:
       CMP    #$E0                    ;2
       BCC    LF99C                   ;2
       AND    #$0F                    ;2
       ASL                            ;2
       STA    $F2                     ;3
       JMP    LF9A7                   ;3
LF99C:
       STA    AUDV1                   ;3
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       CLC                            ;2
       ADC    $F2                     ;3
       STA    AUDF1                   ;3
LF9A7:
       LDA    $80                     ;3
       AND    #$80                    ;2
       BMI    LF9D4                   ;2
       LDA    $E8                     ;3
       BEQ    LF9D7                   ;2
       CMP    $EF                     ;3
       BCC    LF9C9                   ;2
       LDA    #$04                    ;2
       STA    AUDC0                   ;3
       STA    AUDV0                   ;3
       LDX    $F0                     ;3
       INX                            ;2
       CPX    #$1C                    ;2
       BCC    LF9C4                   ;2
       LDX    #$0B                    ;2
LF9C4:
       STX    $F0                     ;3
       STX    AUDF0                   ;3
       RTS                            ;6

LF9C9:
       LDA    #$0F                    ;2
       STA    AUDF0                   ;3
       LSR                            ;2
       STA    AUDC0                   ;3
       LDA    $BE                     ;3
       AND    #$07                    ;2
LF9D4:
       STA    AUDV0                   ;3
       RTS                            ;6

LF9D7:
       LDA    #$04                    ;2
       STA    AUDC0                   ;3
       LDA    $DB                     ;3
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       TAX                            ;2
       LDA    #$01                    ;2
       LDY    $EA                     ;3
       BNE    LF9EB                   ;2
       STA    AUDV0                   ;3
LF9EB:
       LDY    $F0                     ;3
       BMI    LF9FA                   ;2
       INY                            ;2
       TYA                            ;2
       CMP    LFFBC,X                 ;4
       BCC    LFA00                   ;2
       ORA    #$80                    ;2
       BMI    LFA00                   ;2
LF9FA:
       DEY                            ;2
       BMI    LF9FF                   ;2
       LDY    #$00                    ;2
LF9FF:
       TYA                            ;2
LFA00:
       STA    $F0                     ;3
       CLC                            ;2
       ADC    LFFBD,X                 ;4
       STA    AUDF0                   ;3
       RTS                            ;6

LFA09:
       LDA    $9F,X                   ;4
       AND    #$FC                    ;2
       CLC                            ;2
       ADC    $E2,X                   ;4
       STA    $E2,X                   ;4
       BCC    LFA43                   ;2
       LDA    $DE,X                   ;4
       AND    #$3F                    ;2
       STA    $DE,X                   ;4
       LDA    $9F,X                   ;4
       AND    #$03                    ;2
       TAY                            ;2
       LDA    $AA,X                   ;4
       BEQ    LFA43                   ;2
       CLC                            ;2
       ADC    LFF78,Y                 ;4
       CMP    #$13                    ;2
       BCC    LFA2D                   ;2
       STA    $AA,X                   ;4
LFA2D:
       LDA    $B1,X                   ;4
       CLC                            ;2
       ADC    LFF79,Y                 ;4
       CMP    #$78                    ;2
       BCC    LFA41                   ;2
       BNE    LFA3B                   ;2
       LDA    #$00                    ;2
LFA3B:
       AND    #$77                    ;2
       LDY    #$12                    ;2
       STY    $F1                     ;3
LFA41:
       STA    $B1,X                   ;4
LFA43:
       RTS                            ;6

LFA44:
       INC    $82                     ;5
       LDX    $82                     ;3
       LDA    LFA44,X                 ;4
       STA    $90                     ;3
       LDA    $EA                     ;3
       BNE    LFA8D                   ;2
       LDA    $DC                     ;3
       AND    #$FE                    ;2
       ASL                            ;2
       ASL                            ;2
       STA    $8F                     ;3
       LDX    #$02                    ;2
LFA5B:
       LDA    $EB                     ;3
       BNE    LFA8E                   ;2
       LDA    $AA,X                   ;4
       BNE    LFA8E                   ;2
       TXA                            ;2
       BEQ    LFA6A                   ;2
       LDA    $AA                     ;3
       BEQ    LFA6E                   ;2
LFA6A:
       LDA    $ED                     ;3
       BPL    LFA88                   ;2
LFA6E:
       LDA    #$61                    ;2
       STA    $9F,X                   ;4
       LDA    #$3C                    ;2
       STA    $B1,X                   ;4
       LDA    #$13                    ;2
       STA    $AA,X                   ;4
       LDA    LFE3C,X                 ;4
       AND    $9E                     ;3
       STA    $F5,X                   ;4
       LDY    $8F                     ;3
       LDA    LFEAD,Y                 ;4
       STA    $EB                     ;3
LFA88:
       DEX                            ;2
       BPL    LFA5B                   ;2
       LSR    $EC                     ;5
LFA8D:
       RTS                            ;6

LFA8E:
       JSR    LFE06                   ;6
       BCC    LFA96                   ;2
       JMP    LFB22                   ;3
LFA96:
       LDA    $A2                     ;3
       EOR    $DC                     ;3
       AND    #$03                    ;2
       ADC    LFF6A,X                 ;4
       LDY    $DB                     ;3
       CPY    #$02                    ;2
       BEQ    LFAAC                   ;2
       LDA    LFF6D,X                 ;4
       CPY    #$44                    ;2
       BNE    LFAAE                   ;2
LFAAC:
       STA    $DE,X                   ;4
LFAAE:
       LDA    $B1,X                   ;4
       CMP    #$3C                    ;2
       BNE    LFACC                   ;2
       LDA    $AA,X                   ;4
       CMP    #$18                    ;2
       BNE    LFACC                   ;2
       LDA    $EB                     ;3
       BPL    LFAC4                   ;2
       DEC    $AA,X                   ;6
       LDA    #$43                    ;2
       BNE    LFB1A                   ;2
LFAC4:
       LDA    #$10                    ;2
       STA    $EB                     ;3
       INC    $AA,X                   ;6
       BNE    LFB1C                   ;2
LFACC:
       LDA    $F5,X                   ;4
       LSR                            ;2
       LDA    #$07                    ;2
       BCS    LFB10                   ;2
       BIT    $EC                     ;3
       BVS    LFB0E                   ;2
       LDY    LFE73,X                 ;4
       LDA    $AA,X                   ;4
       ADC    #$05                    ;2
       SBC.wy $AA,Y                   ;4
       CMP    #$0B                    ;2
       BCS    LFAFE                   ;2
       LDA    $B1,X                   ;4
       ADC    #$05                    ;2
       SBC.wy $B1,Y                   ;4
       CMP    #$0B                    ;2
       BCS    LFAFE                   ;2
       TXA                            ;2
       BNE    LFB0E                   ;2
       LDA    $A0                     ;3
       AND    #$03                    ;2
       LDY    $8F                     ;3
       ORA    LFEAE,Y                 ;4
       STA    $A0                     ;3
LFAFE:
       LDA    $AA,X                   ;4
       CMP    #$37                    ;2
       BNE    LFB1C                   ;2
       LDA    $B1,X                   ;4
       CMP    #$0F                    ;2
       BCC    LFB0E                   ;2
       CMP    #$69                    ;2
       BCC    LFB1C                   ;2
LFB0E:
       LDA    #$06                    ;2
LFB10:
       ORA    $8F                     ;3
       TAY                            ;2
       LDA    $9F,X                   ;4
       AND    #$03                    ;2
       ORA    LFEA8,Y                 ;4
LFB1A:
       STA    $9F,X                   ;4
LFB1C:
       JSR    LFA09                   ;6
       JMP    LFA88                   ;3
LFB22:
       LDY    $DE,X                   ;4
       BMI    LFB1C                   ;2
       STA    $84                     ;3
       LDA    $81                     ;3
       CMP    #$03                    ;2
       BEQ    LFB34                   ;2
       LDA    $F5,X                   ;4
       AND    #$01                    ;2
       BEQ    LFB38                   ;2
LFB34:
       LDA    #$02                    ;2
       LDY    #$00                    ;2
LFB38:
       STA    $86                     ;3
       LDA    #$00                    ;2
       STA    $88                     ;3
       TXA                            ;2
       EOR    $ED                     ;3
       BMI    LFB53                   ;2
       BEQ    LFB4D                   ;2
       LDA    $95,X                   ;4
       CMP    #$06                    ;2
       BNE    LFB53                   ;2
       LDA    #$02                    ;2
LFB4D:
       EOR    #$02                    ;2
       STA    $86                     ;3
       BPL    LFB6D                   ;2
LFB53:
       LDA    LFEEA,Y                 ;4
       BNE    LFB5A                   ;2
       LDA    $AD                     ;3
LFB5A:
       CMP    $AA,X                   ;4
       BNE    LFB60                   ;2
       INC    $86                     ;5
LFB60:
       ROL    $86                     ;5
       ASL    $86                     ;5
       LDA    LFF04,Y                 ;4
       BNE    LFB8A                   ;2
       LDA    $E8                     ;3
       BNE    LFB88                   ;2
LFB6D:
       SEC                            ;2
       LDA    $AD                     ;3
       SBC    #$0D                    ;2
       CMP    $AA,X                   ;4
       BCS    LFB88                   ;2
       ADC    #$1A                    ;2
       CMP    $AA,X                   ;4
       BCC    LFB88                   ;2
       TXA                            ;2
       EOR    $DC                     ;3
       ASL                            ;2
       EOR    $9F,X                   ;4
       AND    #$03                    ;2
       BNE    LFB88                   ;2
       DEC    $88                     ;5
LFB88:
       LDA    $B4                     ;3
LFB8A:
       CMP    $B1,X                   ;4
       BNE    LFB90                   ;2
       INC    $86                     ;5
LFB90:
       ROL    $86                     ;5
       LDA    $9F,X                   ;4
       AND    #$03                    ;2
       CPX    #$01                    ;2
       LDY    $EC                     ;3
       BMI    LFBA4                   ;2
       BCS    LFBA0                   ;2
       BNE    LFBA2                   ;2
LFBA0:
       EOR    #$02                    ;2
LFBA2:
       ORA    $88                     ;3
LFBA4:
       STA    $88                     ;3
       LDA    #$80                    ;2
       LDY    $86                     ;3
       CPY    #$0F                    ;2
       BNE    LFBB4                   ;2
       LDA    $A2                     ;3
       AND    #$01                    ;2
       ADC    #$00                    ;2
LFBB4:
       CLC                            ;2
       ADC    $DE,X                   ;4
       STA    $DE,X                   ;4
       BIT    SWCHB                   ;4
       TXA                            ;2
       BVC    LFBC3                   ;2
       LDA    $90                     ;3
       AND    #$01                    ;2
LFBC3:
       BNE    LFBC9                   ;2
       TYA                            ;2
       ORA    #$08                    ;2
       TAY                            ;2
LFBC9:
       LDA    LFF1E,Y                 ;4
LFBCC:
       STA    $8A                     ;3
       AND    #$03                    ;2
       TAY                            ;2
       CPY    $88                     ;3
       BEQ    LFBDC                   ;2
       LDA    LFF41,Y                 ;4
       AND    $84                     ;3
       BNE    LFBE6                   ;2
LFBDC:
       LDY    $88                     ;3
       LDA    $8A                     ;3
       BEQ    LFBE6                   ;2
       LSR                            ;2
       LSR                            ;2
       BPL    LFBCC                   ;2
LFBE6:
       STY    $9F,X                   ;4
       TXA                            ;2
       ORA    $8F                     ;3
       TAY                            ;2
       LDA    LFEA8,Y                 ;4
       ORA    $9F,X                   ;4
       STA    $9F,X                   ;4
       JMP    LFA88                   ;3
LFBF6:
       LDY    $AD                     ;3
       LDA    LF303,Y                 ;4
       AND    #$F0                    ;2
       BNE    LFC0F                   ;2
       TYA                            ;2
       LSR                            ;2
       AND    #$0F                    ;2
       TAX                            ;2
       LDA    $B4                     ;3
       LSR                            ;2
       LSR                            ;2
       TAY                            ;2
       LDA    LFE4B,Y                 ;4
       TAY                            ;2
       BPL    LFC10                   ;2
LFC0F:
       RTS                            ;6

LFC10:
       LDA    LF4E8,X                 ;4
       CPY    #$06                    ;2
       BCC    LFC19                   ;2
       ADC    #$0C                    ;2
LFC19:
       TAX                            ;2
       LDA    $C1,X                   ;4
       AND    LFE85,Y                 ;4
       STA    $F3                     ;3
       BEQ    LFC0F                   ;2
       EOR    $C1,X                   ;4
       STA    $C1,X                   ;4
       LDA    #$01                    ;2
       STA    $F1                     ;3
       LDA    #$18                    ;2
       JSR    LFDE3                   ;6
       INC    $DB                     ;5
       LDA    $DB                     ;3
       CMP    #$28                    ;2
       BEQ    LFC3C                   ;2
       CMP    #$50                    ;2
       BNE    LFC53                   ;2
LFC3C:
       LDX    $DC                     ;3
       LDY    LFE9D,X                 ;4
       LDX    $81                     ;3
       CPX    #$02                    ;2
       BCC    LFC49                   ;2
       LDY    #$7B                    ;2
LFC49:
       STY    $A8                     ;3
       LDY    #$D2                    ;2
       STY    $DD                     ;3
       LDY    #$42                    ;2
       STY    $AF                     ;3
LFC53:
       CMP    #$6A                    ;2
       BNE    LFC0F                   ;2
       LDX    $DC                     ;3
       CPX    #$0A                    ;2
       BEQ    LFC5F                   ;2
       INC    $DC                     ;5
LFC5F:
       CPX    #$01                    ;2
       BNE    LFC65                   ;2
       INC    $C0                     ;5
LFC65:
       LDA    #$1A                    ;2
       JSR    LFDE3                   ;6
       LDA    #$83                    ;2
       STA    $C9                     ;3
       LDA    #$84                    ;2
       STA    $C1                     ;3
       LDA    #$00                    ;2
       STA    $E7                     ;3
       STA    $DB                     ;3
       LDA    #$21                    ;2
       STA    $80                     ;3
       LDX    #$05                    ;2
LFC7E:
       LDA    $BE                     ;3
       EOR    LFBF6,X                 ;4
       AND    #$F7                    ;2
       ORA    #$01                    ;2
       STA    $C2,X                   ;4
       DEX                            ;2
       BPL    LFC7E                   ;2

;indirect
       LDA    #$F3                    ;2
       STA    $94                     ;3
       LDA    #$63                    ;2
       STA    $93                     ;3
       TXA                            ;2
       LDX    #$13                    ;2
       JMP    LF60D                   ;3
LFC9A:
       LDA    $80                     ;3
       AND    #$A0                    ;2
       ORA    $EA                     ;3
       BNE    LFD1C                   ;2
       CLC                            ;2
       LDA    $B4                     ;3
       ADC    #$02                    ;2
       STA    $86                     ;3
       SBC    #$03                    ;2
       STA    $88                     ;3
       CLC                            ;2
       LDA    $AD                     ;3
       ADC    #$02                    ;2
       STA    $8A                     ;3
       SBC    #$03                    ;2
       STA    $8C                     ;3
       LDX    #$05                    ;2
LFCBA:
       LDA    $B1,X                   ;4
       CMP    $86                     ;3
       BCS    LFCCE                   ;2
       CMP    $88                     ;3
       BCC    LFCCE                   ;2
       LDA    $AA,X                   ;4
       CMP    $8A                     ;3
       BCS    LFCCE                   ;2
       CMP    $8C                     ;3
       BCS    LFCCF                   ;2
LFCCE:
       CLC                            ;2
LFCCF:
       BCC    LFCD3                   ;2
       TXA                            ;2
       TAY                            ;2
LFCD3:
       ROL    $84                     ;5
       DEX                            ;2
       BPL    LFCBA                   ;2
       LDA    $84                     ;3
       AND    #$20                    ;2
       BEQ    LFCEE                   ;2
       LDA    #$23                    ;2
       STA    $F1                     ;3
       LDA    #$00                    ;2
       STA    $AF                     ;3
       LDX    $DC                     ;3
       LDA    LFF55,X                 ;4
       JMP    LFDE3                   ;3
LFCEE:
       LDA    $84                     ;3
       AND    #$10                    ;2
       BEQ    LFD1D                   ;2
       DEC    $E7                     ;5
       LDA    #$18                    ;2
       JSR    LFDE3                   ;6
       LDX    $DC                     ;3
       BIT    SWCHB                   ;4
       BPL    LFD04                   ;2
       LDX    #$0A                    ;2
LFD04:
       LDA    LFED8,X                 ;4
       STA    $E8                     ;3
       STA    $EF                     ;3
       LDX    #$00                    ;2
       STX    $E9                     ;3
       DEX                            ;2
       STX    $EC                     ;3
       LDA    #$8B                    ;2
       AND    $9E                     ;3
       STA    $F5                     ;3
       STA    $F6                     ;3
       STA    $F7                     ;3
LFD1C:
       RTS                            ;6

LFD1D:
       LDA    $84                     ;3
       AND    #$07                    ;2
       BEQ    LFD54                   ;2
       LDA    #$1E                    ;2
       STA    $EA                     ;3
       LDA.wy $F5,Y                   ;4
       LSR                            ;2
       LDA    #$00                    ;2
       BCC    LFD47                   ;2
       STA    $F0                     ;3
       LDA    $E8                     ;3
       BMI    LFD37                   ;2
       LDA    #$10                    ;2
LFD37:
       AND    #$7F                    ;2
       STA    $EF                     ;3
       STY    $E6                     ;3
       LDX    $E9                     ;3
       INC    $E9                     ;5
       LDA    LFEE7,X                 ;4
       JMP    LFDE3                   ;3
LFD47:
       STA    AUDV0                   ;3
       STA.wy $AA,Y                   ;5
       LDA    #$41                    ;2
       STA    $F1                     ;3
       LDA    #$03                    ;2
       STA    $E6                     ;3
LFD54:
       RTS                            ;6

LFD55:
       LDA    $80                     ;3
       AND    #$20                    ;2
       BEQ    LFD8D                   ;2
       LDA    #$00                    ;2 black background during bonus stage
       STA    COLUBK                  ;3
       LDX    #$06                    ;2
       LDA    $A3                     ;3
LFD63:
       STA    $CA,X                   ;4
       DEX                            ;2
       BPL    LFD63                   ;2
       LDA    $EA                     ;3
       BNE    LFD8D                   ;2
       LDA    #$30                    ;2
       STA    $80                     ;3
       LDX    $DD                     ;3
       CPX    #$3C                    ;2
       BCS    LFD7A                   ;2
       LDA    #$68                    ;2
       STA    $DB                     ;3
LFD7A:
       DEX                            ;2
       BNE    LFD8E                   ;2
LFD7D:
       LDA    #$03                    ;2
       STA    $E6                     ;3
       LDA    #$41                    ;2
LFD83:
       STA    $F1                     ;3
       LDA    #$00                    ;2
       STA    AUDV0                   ;3
       LDA    #$1E                    ;2
       STA    $EA                     ;3
LFD8D:
       RTS                            ;6

LFD8E:
       LDA    $D2                     ;3
       BPL    LFDA2                   ;2
       LDA    #$00                    ;2
       STA    $C9                     ;3
       LDX    $DC                     ;3
       LDA    LFF55,X                 ;4
       JSR    LFDE3                   ;6
       LDA    #$23                    ;2
       BNE    LFD83                   ;2
LFDA2:
       LDX    #$05                    ;2
LFDA4:
       LDA    $D3,X                   ;4
       BMI    LFD7D                   ;2
       DEX                            ;2
       BPL    LFDA4                   ;2
       BIT    $E0                     ;3
       BVS    LFD8D                   ;2
       LDA    #$40                    ;2
       STA    $E0                     ;3
       LDX    #$05                    ;2
LFDB5:
       TXA                            ;2
       LSR                            ;2
       LDA    $C2,X                   ;4
       BCC    LFDCD                   ;2
       SBC    #$10                    ;2
       BMI    LFDC5                   ;2
       CMP    #$70                    ;2
       BCC    LFDC5                   ;2
       ADC    #$F0                    ;2
LFDC5:
       CMP    #$08                    ;2
       BNE    LFDCB                   ;2
       LDA    #$D0                    ;2
LFDCB:
       BNE    LFDDD                   ;2
LFDCD:
       ADC    #$10                    ;2
       BPL    LFDD7                   ;2
       CMP    #$90                    ;2
       BCS    LFDD7                   ;2
       ADC    #$0F                    ;2
LFDD7:
       CMP    #$D0                    ;2
       BNE    LFDDD                   ;2
       LDA    #$08                    ;2
LFDDD:
       STA    $C2,X                   ;4
       DEX                            ;2
       BPL    LFDB5                   ;2
       RTS                            ;6

LFDE3:
       TAY                            ;2
       AND    #$0F                    ;2
       TAX                            ;2
       TYA                            ;2
       LSR                            ;2
       AND    #$F8                    ;2
LFDEB:
       CLC                            ;2
       ADC    $83,X                   ;4
       CMP    #$80                    ;2
       BCS    LFE01                   ;2
       CMP    #$50                    ;2
       BCC    LFE03                   ;2
       SBC    #$50                    ;2
       STA    $83,X                   ;4
       LDA    #$08                    ;2
       DEX                            ;2
       DEX                            ;2
       BPL    LFDEB                   ;2
       RTS                            ;6

LFE01:
       SBC    #$80                    ;2
LFE03:
       STA    $83,X                   ;4
       RTS                            ;6

LFE06:
       LDY    $AA,X                   ;4
       LDA    LF303,Y                 ;4
       AND    #$04                    ;2
       BEQ    LFE29                   ;2
       TYA                            ;2
       ASL                            ;2
       CMP    #$A0                    ;2
       BCC    LFE17                   ;2
       LDA    #$08                    ;2
LFE17:
       AND    #$38                    ;2
       STA    $84                     ;3
       LDA    $B1,X                   ;4
       LSR                            ;2
       BCS    LFE29                   ;2
       LSR                            ;2
       BCS    LFE29                   ;2
       TAY                            ;2
       LDA    LFE4B,Y                 ;4
       BPL    LFE2B                   ;2
LFE29:
       CLC                            ;2
       RTS                            ;6

LFE2B:
       LSR                            ;2
       ORA    $84                     ;3
       TAY                            ;2
       LDA    LF4A8,Y                 ;4
       BCC    LFE38                   ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
       LSR                            ;2
LFE38:
       AND    #$0F                    ;2
       SEC                            ;2
       RTS                            ;6

LFE3C:
       .byte $BE ; |X XXXXX | $FE3C
       .byte $1E ; |   XXXX | $FE3D
       .byte $5E ; | X XXXX | $FE3E
       .byte $8E ; |X   XXX | $FE3F
       .byte $4E ; | X  XXX | $FE40
       .byte $1E ; |   XXXX | $FE41
       .byte $8E ; |X   XXX | $FE42
       .byte $60 ; | XX     | $FE43 wall color in maze section
       .byte $84 ; |X    X  | $FE44 screen color in maze section
LFE45:
       .byte $D0 ; |XX X    | $FE45
       .byte $A0 ; |X X     | $FE46
LFE47:
       .byte $D0 ; |XX X    | $FE47
       .byte $B0 ; |X XX    | $FE48
LFE49:
       .byte $05 ; |     X X| $FE49
       .byte $09 ; |    X  X| $FE4A
LFE4B:
       .byte $80 ; |X       | $FE4B
       .byte $00 ; |        | $FE4C
       .byte $80 ; |X       | $FE4D
       .byte $80 ; |X       | $FE4E
       .byte $01 ; |       X| $FE4F
       .byte $80 ; |X       | $FE50
       .byte $02 ; |      X | $FE51
       .byte $80 ; |X       | $FE52
       .byte $80 ; |X       | $FE53
       .byte $03 ; |      XX| $FE54
       .byte $80 ; |X       | $FE55
       .byte $80 ; |X       | $FE56
       .byte $04 ; |     X  | $FE57
       .byte $05 ; |     X X| $FE58
       .byte $80 ; |X       | $FE59
       .byte $06 ; |     XX | $FE5A
       .byte $80 ; |X       | $FE5B
       .byte $07 ; |     XXX| $FE5C
       .byte $08 ; |    X   | $FE5D
       .byte $80 ; |X       | $FE5E
       .byte $80 ; |X       | $FE5F
       .byte $09 ; |    X  X| $FE60
       .byte $80 ; |X       | $FE61
       .byte $80 ; |X       | $FE62
       .byte $0A ; |    X X | $FE63
       .byte $80 ; |X       | $FE64
       .byte $0B ; |    X XX| $FE65
       .byte $80 ; |X       | $FE66
       .byte $80 ; |X       | $FE67
       .byte $0C ; |    XX  | $FE68
       .byte $80 ; |X       | $FE69
       .byte $80 ; |X       | $FE6A
LFE6B:
       .byte $B1 ; |X XX   X| $FE6B
       .byte $78 ; | XXXX   | $FE6C
       .byte $C0 ; |XX      | $FE6D
       .byte $63 ; | XX   XX| $FE6E
       .byte $9C ; |X  XXX  | $FE6F
       .byte $C0 ; |XX      | $FE70
       .byte $2D ; |  X XX X| $FE71
       .byte $1B ; |   XX XX| $FE72
LFE73:
       .byte $01 ; |       X| $FE73
       .byte $02 ; |      X | $FE74
LFE75:
       .byte $00 ; |        | $FE75
       .byte $80 ; |X       | $FE76
       .byte $10 ; |   X    | $FE77
       .byte $90 ; |X  X    | $FE78
       .byte $40 ; | X      | $FE79
       .byte $C0 ; |XX      | $FE7A
       .byte $50 ; | X X    | $FE7B
       .byte $D0 ; |XX X    | $FE7C
       .byte $20 ; |  X     | $FE7D
       .byte $A0 ; |X X     | $FE7E
       .byte $30 ; |  XX    | $FE7F
       .byte $B0 ; |X XX    | $FE80
       .byte $60 ; | XX     | $FE81
       .byte $E0 ; |XXX     | $FE82
       .byte $70 ; | XXX    | $FE83
       .byte $F0 ; |XXXX    | $FE84
LFE85:
       .byte $04 ; |     X  | $FE85
       .byte $10 ; |   X    | $FE86
       .byte $40 ; | X      | $FE87
       .byte $08 ; |    X   | $FE88
       .byte $20 ; |  X     | $FE89
       .byte $80 ; |X       | $FE8A
       .byte $00 ; |        | $FE8B
       .byte $04 ; |     X  | $FE8C
       .byte $10 ; |   X    | $FE8D
       .byte $40 ; | X      | $FE8E
       .byte $08 ; |    X   | $FE8F
       .byte $20 ; |  X     | $FE90
LFE91:
       .byte $80 ; |X       | $FE91
       .byte $10 ; |   X    | $FE92
       .byte $40 ; | X      | $FE93
       .byte $20 ; |  X     | $FE94
       .byte $80 ; |X       | $FE95
       .byte $10 ; |   X    | $FE96
       .byte $40 ; | X      | $FE97
       .byte $20 ; |  X     | $FE98
LFE99:
       .byte $05 ; |     X X| $FE99
       .byte $0A ; |    X X | $FE9A
       .byte $05 ; |     X X| $FE9B
       .byte $0A ; |    X X | $FE9C
LFE9D:
       .byte $83 ; |X     XX| $FE9D
       .byte $83 ; |X     XX| $FE9E
       .byte $7B ; | XXXX XX| $FE9F
       .byte $7B ; | XXXX XX| $FEA0
       .byte $73 ; | XXX  XX| $FEA1
       .byte $73 ; | XXX  XX| $FEA2
       .byte $6F ; | XX XXXX| $FEA3
       .byte $6F ; | XX XXXX| $FEA4
       .byte $93 ; |X  X  XX| $FEA5
       .byte $93 ; |X  X  XX| $FEA6
       .byte $7F ; | XXXXXXX| $FEA7
LFEA8:
       .byte $68 ; | XX X   | $FEA8
       .byte $8C ; |X   XX  | $FEA9
       .byte $78 ; | XXXX   | $FEAA
LFEAB:
       .byte $70 ; | XXX    | $FEAB
LFEAC:
       .byte $90 ; |X  X    | $FEAC
LFEAD:
       .byte $B8 ; |X XXX   | $FEAD
LFEAE:
       .byte $48 ; | X  X   | $FEAE
       .byte $50 ; | X X    | $FEAF
       .byte $80 ; |X       | $FEB0
       .byte $A4 ; |X X  X  | $FEB1
       .byte $8C ; |X   XX  | $FEB2
       .byte $84 ; |X    X  | $FEB3
       .byte $A4 ; |X X  X  | $FEB4
       .byte $B0 ; |X XX    | $FEB5
       .byte $64 ; | XX  X  | $FEB6
       .byte $6C ; | XX XX  | $FEB7
       .byte $98 ; |X  XX   | $FEB8
       .byte $C8 ; |XX  X   | $FEB9
       .byte $A8 ; |X X X   | $FEBA
       .byte $9C ; |X  XXX  | $FEBB
       .byte $CC ; |XX  XX  | $FEBC
       .byte $A8 ; |X X X   | $FEBD
       .byte $80 ; |X       | $FEBE
       .byte $88 ; |X   X   | $FEBF
       .byte $B4 ; |X XX X  | $FEC0
       .byte $F0 ; |XXXX    | $FEC1
       .byte $C4 ; |XX   X  | $FEC2
       .byte $BC ; |X XXXX  | $FEC3
       .byte $F8 ; |XXXXX   | $FEC4
       .byte $A0 ; |X X     | $FEC5
       .byte $90 ; |X  X    | $FEC6
       .byte $A0 ; |X X     | $FEC7
       .byte $80 ; |X       | $FEC8
       .byte $C4 ; |XX   X  | $FEC9
       .byte $B4 ; |X XX X  | $FECA
       .byte $88 ; |X   X   | $FECB
       .byte $D8 ; |XX XX   | $FECC
       .byte $90 ; |X  X    | $FECD
       .byte $68 ; | XX X   | $FECE
       .byte $70 ; | XXX    | $FECF
       .byte $90 ; |X  X    | $FED0
       .byte $D8 ; |XX XX   | $FED1
       .byte $C0 ; |XX      | $FED2
       .byte $94 ; |X  X X  | $FED3
       .byte $F8 ; |XXXXX   | $FED4
       .byte $05 ; |     X X| $FED5
       .byte $74 ; | XXX X  | $FED6
       .byte $84 ; |X    X  | $FED7
LFED8:
       .byte $FC ; |XXXXXX  | $FED8
       .byte $81 ; |X      X| $FED9
       .byte $C2 ; |XX    X | $FEDA
       .byte $60 ; | XX     | $FEDB
       .byte $81 ; |X      X| $FEDC
       .byte $42 ; | X    X | $FEDD
       .byte $60 ; | XX     | $FEDE
       .byte $31 ; |  XX   X| $FEDF
       .byte $42 ; | X    X | $FEE0
       .byte $20 ; |  X     | $FEE1
       .byte $02 ; |      X | $FEE2
LFEE3:
       .byte $00 ; |        | $FEE3
       .byte $69 ; | XX X  X| $FEE4
       .byte $0D ; |    XX X| $FEE5
       .byte $3B ; |  XXX XX| $FEE6
LFEE7:
       .byte $56 ; | X X XX | $FEE7
       .byte $14 ; |   X X  | $FEE8
       .byte $24 ; |  X  X  | $FEE9
LFEEA:
       .byte $00 ; |        | $FEEA
       .byte $37 ; |  XX XXX| $FEEB
       .byte $43 ; | X    XX| $FEEC
       .byte $00 ; |        | $FEED
       .byte $00 ; |        | $FEEE
       .byte $4F ; | X  XXXX| $FEEF
       .byte $5B ; | X XX XX| $FEF0
       .byte $37 ; |  XX XXX| $FEF1
       .byte $37 ; |  XX XXX| $FEF2
       .byte $00 ; |        | $FEF3
       .byte $00 ; |        | $FEF4
       .byte $2B ; |  X X XX| $FEF5
       .byte $13 ; |   X  XX| $FEF6
       .byte $37 ; |  XX XXX| $FEF7
       .byte $4F ; | X  XXXX| $FEF8
       .byte $37 ; |  XX XXX| $FEF9
       .byte $2B ; |  X X XX| $FEFA
       .byte $00 ; |        | $FEFB
       .byte $00 ; |        | $FEFC
       .byte $37 ; |  XX XXX| $FEFD
       .byte $00 ; |        | $FEFE
       .byte $00 ; |        | $FEFF
       .byte $4F ; | X  XXXX| $FF00
       .byte $00 ; |        | $FF01
       .byte $00 ; |        | $FF02
       .byte $00 ; |        | $FF03
LFF04:
       .byte $00 ; |        | $FF04
       .byte $18 ; |   XX   | $FF05
       .byte $54 ; | X X X  | $FF06
       .byte $00 ; |        | $FF07
       .byte $00 ; |        | $FF08
       .byte $68 ; | XX X   | $FF09
       .byte $10 ; |   X    | $FF0A
       .byte $04 ; |     X  | $FF0B
       .byte $54 ; | X X X  | $FF0C
       .byte $00 ; |        | $FF0D
       .byte $00 ; |        | $FF0E
       .byte $04 ; |     X  | $FF0F
       .byte $60 ; | XX     | $FF10
       .byte $74 ; | XXX X  | $FF11
       .byte $10 ; |   X    | $FF12
       .byte $74 ; | XXX X  | $FF13
       .byte $54 ; | X X X  | $FF14
       .byte $00 ; |        | $FF15
       .byte $00 ; |        | $FF16
       .byte $24 ; |  X  X  | $FF17
       .byte $00 ; |        | $FF18
       .byte $00 ; |        | $FF19
       .byte $48 ; | X  X   | $FF1A
       .byte $00 ; |        | $FF1B
       .byte $00 ; |        | $FF1C
       .byte $00 ; |        | $FF1D
LFF1E:
       .byte $4B ; | X  X XX| $FF1E
       .byte $63 ; | XX   XX| $FF1F
       .byte $B1 ; |X XX   X| $FF20
       .byte $63 ; | XX   XX| $FF21
       .byte $C9 ; |XX  X  X| $FF22
       .byte $E1 ; |XXX    X| $FF23
       .byte $E1 ; |XXX    X| $FF24
       .byte $E1 ; |XXX    X| $FF25
       .byte $1B ; |   XX XX| $FF26
       .byte $93 ; |X  X  XX| $FF27
       .byte $B1 ; |X XX   X| $FF28
       .byte $93 ; |X  X  XX| $FF29
       .byte $36 ; |  XX XX | $FF2A
       .byte $B4 ; |X XX X  | $FF2B
       .byte $B1 ; |X XX   X| $FF2C
       .byte $B1 ; |X XX   X| $FF2D
       .byte $E1 ; |XXX    X| $FF2E
       .byte $C9 ; |XX  X  X| $FF2F
       .byte $B1 ; |X XX   X| $FF30
       .byte $E1 ; |XXX    X| $FF31
       .byte $63 ; | XX   XX| $FF32
       .byte $4B ; | X  X XX| $FF33
       .byte $E1 ; |XXX    X| $FF34
       .byte $63 ; | XX   XX| $FF35
       .byte $B1 ; |X XX   X| $FF36
       .byte $39 ; |  XXX  X| $FF37
       .byte $B1 ; |X XX   X| $FF38
       .byte $2D ; |  X XX X| $FF39
       .byte $9C ; |X  XXX  | $FF3A
       .byte $1E ; |   XXXX | $FF3B
       .byte $B1 ; |X XX   X| $FF3C
       .byte $4B ; | X  X XX| $FF3D
LFF3E:
       .byte $00 ; |        | $FF3E
       .byte $00 ; |        | $FF3F
       .byte $00 ; |        | $FF40
LFF41:
       .byte $01 ; |       X| $FF41
       .byte $02 ; |      X | $FF42
       .byte $04 ; |     X  | $FF43
       .byte $08 ; |    X   | $FF44
LFF45:
       .byte $4F ; | X  XXXX| $FF45
       .byte $5F ; | X XXXXX| $FF46
       .byte $57 ; | X X XXX| $FF47
       .byte $67 ; | XX  XXX| $FF48
       .byte $97 ; |X  X XXX| $FF49
       .byte $8B ; |X   X XX| $FF4A
       .byte $57 ; | X X XXX| $FF4B
       .byte $67 ; | XX  XXX| $FF4C
LFF4D:
       .byte $2C ; |  X XX  | $FF4D
       .byte $48 ; | X  X   | $FF4E
       .byte $25 ; |  X  X X| $FF4F
       .byte $41 ; | X     X| $FF50
       .byte $1E ; |   XXXX | $FF51
       .byte $3A ; |  XXX X | $FF52
       .byte $17 ; |   X XXX| $FF53
       .byte $33 ; |  XX  XX| $FF54
LFF55:
       .byte $56 ; | X X XX | $FF55
       .byte $56 ; | X X XX | $FF56
       .byte $14 ; |   X X  | $FF57
       .byte $14 ; |   X X  | $FF58
       .byte $24 ; |  X  X  | $FF59
       .byte $24 ; |  X  X  | $FF5A
       .byte $24 ; |  X  X  | $FF5B
       .byte $34 ; |  XX X  | $FF5C
       .byte $34 ; |  XX X  | $FF5D
       .byte $34 ; |  XX X  | $FF5E
       .byte $54 ; | X X X  | $FF5F
LFF60:
       .byte $13 ; |   X  XX| $FF60
       .byte $13 ; |   X  XX| $FF61
       .byte $0E ; |    XXX | $FF62
       .byte $08 ; |    X   | $FF63
       .byte $01 ; |       X| $FF64
LFF65:
       .byte $0C ; |    XX  | $FF65
       .byte $0C ; |    XX  | $FF66
       .byte $0C ; |    XX  | $FF67
       .byte $0F ; |    XXXX| $FF68
       .byte $0B ; |    X XX| $FF69
LFF6A:
       .byte $0B ; |    X XX| $FF6A
       .byte $05 ; |     X X| $FF6B
       .byte $01 ; |       X| $FF6C
LFF6D:
       .byte $16 ; |   X XX | $FF6D
       .byte $13 ; |   X  XX| $FF6E
       .byte $02 ; |      X | $FF6F
LFF70:
       .byte $08 ; |    X   | $FF70
       .byte $10 ; |   X    | $FF71
       .byte $18 ; |   XX   | $FF72
       .byte $20 ; |  X     | $FF73
LFF74:
       .byte $03 ; |      XX| $FF74
       .byte $02 ; |      X | $FF75
       .byte $03 ; |      XX| $FF76
       .byte $06 ; |     XX | $FF77
LFF78:
       .byte $00 ; |        | $FF78
LFF79:
       .byte $01 ; |       X| $FF79
       .byte $00 ; |        | $FF7A
       .byte $FF ; |XXXXXXXX| $FF7B
LFF7C:
       .byte $00 ; |        | $FF7C
       .byte $02 ; |      X | $FF7D
       .byte $09 ; |    X  X| $FF7E
       .byte $01 ; |       X| $FF7F
LFF80:
       .byte $00 ; |        | $FF80
       .byte $E7 ; |XXX  XXX| $FF81
       .byte $F1 ; |XXXX   X| $FF82
       .byte $A2 ; |X X   X | $FF83
       .byte $83 ; |X     XX| $FF84
       .byte $65 ; | XX  X X| $FF85
       .byte $F8 ; |XXXXX   | $FF86
       .byte $C4 ; |XX   X  | $FF87
       .byte $C3 ; |XX    XX| $FF88
       .byte $C2 ; |XX    X | $FF89
       .byte $10 ; |   X    | $FF8A
       .byte $10 ; |   X    | $FF8B
       .byte $10 ; |   X    | $FF8C
       .byte $F7 ; |XXXX XXX| $FF8D
       .byte $C4 ; |XX   X  | $FF8E
       .byte $C4 ; |XX   X  | $FF8F
       .byte $C4 ; |XX   X  | $FF90
       .byte $00 ; |        | $FF91
       .byte $E6 ; |XXX  XX | $FF92
       .byte $F8 ; |XXXXX   | $FF93
       .byte $01 ; |       X| $FF94
       .byte $02 ; |      X | $FF95
       .byte $03 ; |      XX| $FF96
       .byte $04 ; |     X  | $FF97
       .byte $05 ; |     X X| $FF98
       .byte $05 ; |     X X| $FF99
       .byte $05 ; |     X X| $FF9A
       .byte $05 ; |     X X| $FF9B
       .byte $04 ; |     X  | $FF9C
       .byte $04 ; |     X  | $FF9D
       .byte $03 ; |      XX| $FF9E
       .byte $02 ; |      X | $FF9F
       .byte $02 ; |      X | $FFA0
       .byte $01 ; |       X| $FFA1
       .byte $00 ; |        | $FFA2
       .byte $E4 ; |XXX  X  | $FFA3
       .byte $F7 ; |XXXX XXX| $FFA4
       .byte $D5 ; |XX X X X| $FFA5
       .byte $D7 ; |XX X XXX| $FFA6
       .byte $C9 ; |XX  X  X| $FFA7
       .byte $FF ; |XXXXXXXX| $FFA8
       .byte $B9 ; |X XXX  X| $FFA9
       .byte $A9 ; |X X X  X| $FFAA
       .byte $9A ; |X  XX X | $FFAB
       .byte $8A ; |X   X X | $FFAC
       .byte $7A ; | XXXX X | $FFAD
       .byte $6A ; | XX X X | $FFAE
       .byte $5A ; | X XX X | $FFAF
       .byte $4A ; | X  X X | $FFB0
       .byte $3A ; |  XXX X | $FFB1
       .byte $2A ; |  X X X | $FFB2
       .byte $1A ; |   XX X | $FFB3
       .byte $19 ; |   XX  X| $FFB4
       .byte $29 ; |  X X  X| $FFB5
       .byte $37 ; |  XX XXX| $FFB6
       .byte $45 ; | X   X X| $FFB7
       .byte $55 ; | X X X X| $FFB8
       .byte $61 ; | XX    X| $FFB9
       .byte $71 ; | XXX   X| $FFBA
       .byte $00 ; |        | $FFBB
LFFBC:
       .byte $0E ; |    XXX | $FFBC
LFFBD:
       .byte $0D ; |    XX X| $FFBD
       .byte $0C ; |    XX  | $FFBE
       .byte $0B ; |    X XX| $FFBF
       .byte $0A ; |    X X | $FFC0
       .byte $E0 ; |XXX     | $FFC1
       .byte $F6 ; |XXXX XX | $FFC2
       .byte $09 ; |    X  X| $FFC3
       .byte $18 ; |   XX   | $FFC4
       .byte $27 ; |  X  XXX| $FFC5
       .byte $36 ; |  XX XX | $FFC6
       .byte $45 ; | X   X X| $FFC7
       .byte $59 ; | X XX  X| $FFC8
       .byte $69 ; | XX X  X| $FFC9
       .byte $79 ; | XXXX  X| $FFCA
       .byte $F4 ; |XXXX X  | $FFCB
       .byte $89 ; |X   X  X| $FFCC
       .byte $99 ; |X  XX  X| $FFCD
       .byte $A9 ; |X X X  X| $FFCE
       .byte $B9 ; |X XXX  X| $FFCF
       .byte $C9 ; |XX  X  X| $FFD0
       .byte $D9 ; |XX XX  X| $FFD1
       .byte $E7 ; |XXX  XXX| $FFD2
       .byte $09 ; |    X  X| $FFD3
       .byte $19 ; |   XX  X| $FFD4
       .byte $29 ; |  X X  X| $FFD5
       .byte $39 ; |  XXX  X| $FFD6
       .byte $49 ; | X  X  X| $FFD7
       .byte $59 ; | X XX  X| $FFD8
       .byte $69 ; | XX X  X| $FFD9
       .byte $75 ; | XXX X X| $FFDA
       .byte $85 ; |X    X X| $FFDB
       .byte $95 ; |X  X X X| $FFDC
       .byte $A5 ; |X X  X X| $FFDD
       .byte $B5 ; |X XX X X| $FFDE
       .byte $C5 ; |XX   X X| $FFDF
       .byte $D5 ; |XX X X X| $FFE0
       .byte $EE ; |XXX XXX | $FFE1
       .byte $05 ; |     X X| $FFE2
       .byte $15 ; |   X X X| $FFE3
       .byte $25 ; |  X  X X| $FFE4
       .byte $35 ; |  XX X X| $FFE5
       .byte $E2 ; |XXX   X | $FFE6
       .byte $FC ; |XXXXXX  | $FFE7
       .byte $DE ; |XX XXXX | $FFE8
       .byte $DD ; |XX XXX X| $FFE9
       .byte $CC ; |XX  XX  | $FFEA
       .byte $BB ; |X XXX XX| $FFEB
       .byte $AA ; |X X X X | $FFEC
       .byte $99 ; |X  XX  X| $FFED
       .byte $88 ; |X   X   | $FFEE
       .byte $77 ; | XXX XXX| $FFEF
       .byte $66 ; | XX  XX | $FFF0
       .byte $55 ; | X X X X| $FFF1
       .byte $44 ; | X   X  | $FFF2
       .byte $33 ; |  XX  XX| $FFF3
       .byte $22 ; |  X   X | $FFF4
       .byte $11 ; |   X   X| $FFF5
LFFF6:
       .byte $00 ; |        | $FFF6
       .byte $1E ; |   XXXX | $FFF7
       .byte $1E ; |   XXXX | $FFF8
       .byte $5A ; | X XX X | $FFF9
       .byte $64 ; | XX  X  | $FFFA
       .byte $6E ; | XX XXX | $FFFB


       ORG $FFFC
       .word START,START
