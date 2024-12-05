; Disassembly of qubes1.bin
; Disassembled By Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcqubes1.cfg qubes1.bin
;
; qubes1.cfg contents:
;
;      ORG 1000
;      GFX 1000 11E7
;      CODE 11E8 11FE
;      GFX 11FF 13E7
;      CODE 13E8 13FD
;      GFX 13FE 144F
;      CODE 1450 1491
;      GFX 1492 149D
;      CODE 149E 1AE7
;      GFX 1AE8 1BFF
;      CODE 1C00 1FFE
;      GFX 1FFF 1FFF
;
; Qubes2.cfg contents:
;
;      ORG 1000
;      CODE 1000 17FE
;      GFX 17FF 1DE2
;      CODE 1DE3 1E99
;      GFX 1E9A 1EA7
;      CODE 1EA8 1FA5
;      GFX 1FA6 1FB9
;      CODE 1FBA 1FC7
;      GFX 1FC8 1FCB
;      CODE 1FCC 1FDB
;      GFX 1FDC 1FFF

      processor 6502

VSYNC   =  $00
WSYNC   =  $02
NUSIZ0  =  $04
NUSIZ1  =  $05
COLUP0  =  $06
COLUP1  =  $07
COLUPF  =  $08
CTRLPF  =  $0A
REFP0   =  $0B
REFP1   =  $0C
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

INPT4_mirror  =  $6C

RESP0_mirror  =  $0110
RESP1_mirror  =  $0111


;slice select for first 1K
SLICE0_1    =  $FFE0   ; used
SLICE1_1    =  $FFE1
SLICE2_1    =  $FFE2
SLICE3_1    =  $FFE3   ; used
SLICE4_1    =  $FFE4
SLICE5_1    =  $FFE5
SLICE6_1    =  $FFE6
SLICE7_1    =  $FFE7
;slice select for second 1K
SLICE0_2    =  $FFE8
SLICE1_2    =  $FFE9   ; used
SLICE2_2    =  $FFEA
SLICE3_2    =  $FFEB
SLICE4_2    =  $FFEC   ; used
SLICE5_2    =  $FFED
SLICE6_2    =  $FFEE
SLICE7_2    =  $FFEF
;slice select for third 1K
SLICE0_3    =  $FFF0
SLICE1_3    =  $FFF1
SLICE2_3    =  $FFF2   ; used
SLICE3_3    =  $FFF3
SLICE4_3    =  $FFF4
SLICE5_3    =  $FFF5   ; used
SLICE6_3    =  $FFF6
SLICE7_3    =  $FFF7

;time
VSYNC_TIME    = $18  ; timer8 = 192 clocks, a wsync follows before vsync ends
VBLANK_TIME   = $20  ; timer64 = 2,048 clocks, note VBLANK is never enabled...

;colors
BLACK        = $00
ORANGE       = $38
WHITE        = $0E

COLOR_LIVES_DISPLAY    = ORANGE  ; color for "bonus" too
COLOR_SCORE            = WHITE
COLOR_QBERT            = ORANGE
COLOR_QBERTS_SWEAR     = WHITE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

framecounter      = $80  ; jumps by 2 every three frames (ie $64,$65,$66 then $68)
thirdFrameCounter = $81  ; increments every three frames


tempSetOne        = $85  ; $85 - $90
scorePtrs         = tempSetOne
colCubeTop        = tempSetOne    ; $85,$88,$8B,$8E  (columns 1&2, 3&4, 5&6, 7)
colCubeLeft       = tempSetOne+1  ; $86,$89,$8C,$8F
colCubeRight      = tempSetOne+2  ; $87,$8A,$8D,$90
columns1_2        = tempSetOne+8  ; $8D
columns3_4        = tempSetOne+9  ; $8E
columns5_6        = tempSetOne+10 ; $8F
columns7          = tempSetOne+11 ; $90
;---------------------------------------

scoreBCD          = $97  ; $97 - $99
numOfLives        = $9A
;$9B
;$9C
;$9D ; bit 2 (reflect enemy 1)
;$9E ; bit 2 (reflect enemy 2)

;$A8 ; #$FF pro, #$13 amateur
colEnemy1         = $A9
colEnemy2         = $AA

hPosition         = $B6
hPosQbert         = hPosition     ; $B6
hPosEnemySection1 = hPosition+1   ; $B7
hPosEnemySection2 = hPosition+2   ; $B8
hPosEnemySection3 = hPosition+3   ; $B9
hPosEnemySection4 = hPosition+4   ; $BA
hPosEnemySection5 = hPosition+5   ; $BB
hPosEnemySection6 = hPosition+6   ; $BC

gfxPtrsQbert      = $BD
qbertTopPtr       = gfxPtrsQbert    ; $BD - $BE
qBertRow1Ptr      = gfxPtrsQbert+2  ; $BF - $C0
qBertRow2Ptr      = gfxPtrsQbert+4  ; $C1 - $C2
qBertRow3Ptr      = gfxPtrsQbert+6  ; $C3 - $C4
qBertRow4Ptr      = gfxPtrsQbert+8  ; $C5 - $C6
qBertRow5Ptr      = gfxPtrsQbert+10 ; $C7 - $C8
qBertRow6Ptr      = gfxPtrsQbert+12 ; $C9 - $CA
qBertRow7Ptr      = gfxPtrsQbert+14 ; $CB - $CC

gfxPtrsEnemy      = $CD
enemyTopPtr       = gfxPtrsEnemy    ; $CD - $CE
enemyRow1Ptr      = gfxPtrsEnemy+2  ; $CF - $D0
enemyRow2Ptr      = gfxPtrsEnemy+4  ; $D1 - $D2
enemyRow3Ptr      = gfxPtrsEnemy+6  ; $D3 - $D4
enemyRow4Ptr      = gfxPtrsEnemy+8  ; $D5 - $D6
enemyRow5Ptr      = gfxPtrsEnemy+10 ; $D7 - $D8
enemyRow6Ptr      = gfxPtrsEnemy+12 ; $D9 - $DA
enemyRow7Ptr      = gfxPtrsEnemy+14 ; $DB - $DC

;row/columns enable
row1Col_3_4       = $DD
row1Col_5_6       = $DE
row2Col_3_4       = $DF
row2Col_5_6       = $E0
row3Col_3_4       = $E1
row3Col_5_6       = $E2
row3Col_7         = $E3
row4Col_1_2       = $E4
row4Col_3_4       = $E5
row4Col_5_6       = $E6
row4Col_7         = $E7
row5Col_3_4       = $E8
row5Col_5_6       = $E9
row5Col_7         = $EA
row6Col_3_4       = $EB
row6Col_5_6       = $EC
row7Col_5_6       = $ED

;$EE
;$EF


tempRegisters     = $F0
tempZero          = tempRegisters
tempOne           = tempRegisters+1
tempFour          = tempRegisters+4
tempFive          = tempRegisters+5

;general purpose, used for all rows
qBertLoPtr        = tempRegisters   ; $F0
qbertHiPtr        = tempRegisters+1 ; $F1
enemyLoPtr        = tempRegisters+2 ; $F2
enemyHiPtr        = tempRegisters+3 ; $F3

qBertGfxPtr       = qBertLoPtr      ; $F0 - $F1
enemyGfxPtr       = enemyLoPtr      ; $F2 - $F3

displayPtrs       = tempRegisters+2 ; $F2 - $FB

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SLICE 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ORG $1000
       RORG $1000

    .byte $00 ; |        | $1000
    .byte $00 ; |        | $1001
    .byte $00 ; |        | $1002
    .byte $00 ; |        | $1003
    .byte $00 ; |        | $1004
    .byte $00 ; |        | $1005
    .byte $00 ; |        | $1006
    .byte $00 ; |        | $1007
    .byte $00 ; |        | $1008
    .byte $00 ; |        | $1009
    .byte $00 ; |        | $100A
    .byte $00 ; |        | $100B
    .byte $00 ; |        | $100C
    .byte $00 ; |        | $100D
    .byte $00 ; |        | $100E
    .byte $00 ; |        | $100F
    .byte $00 ; |        | $1010
    .byte $00 ; |        | $1011
    .byte $00 ; |        | $1012
    .byte $00 ; |        | $1013
    .byte $00 ; |        | $1014
    .byte $00 ; |        | $1015
    .byte $00 ; |        | $1016
    .byte $00 ; |        | $1017
    .byte $00 ; |        | $1018
    .byte $00 ; |        | $1019
    .byte $00 ; |        | $101A
    .byte $00 ; |        | $101B
    .byte $04 ; |     X  | $101C
    .byte $12 ; |   X  X | $101D
    .byte $2A ; |  X X X | $101E
    .byte $24 ; |  X  X  | $101F
    .byte $51 ; | X X   X| $1020
    .byte $7F ; | XXXXXXX| $1021
    .byte $5D ; | X XXX X| $1022
    .byte $7F ; | XXXXXXX| $1023
    .byte $3E ; |  XXXXX | $1024
    .byte $3E ; |  XXXXX | $1025
    .byte $3C ; |  XXXX  | $1026
    .byte $7E ; | XXXXXX | $1027
    .byte $DB ; |XX XX XX| $1028
    .byte $BD ; |X XXXX X| $1029
    .byte $1E ; |   XXXX | $102A
    .byte $7E ; | XXXXXX | $102B
    .byte $FE ; |XXXXXXX | $102C
    .byte $9C ; |X  XXX  | $102D
    .byte $3E ; |  XXXXX | $102E
    .byte $77 ; | XXX XXX| $102F
    .byte $77 ; | XXX XXX| $1030
    .byte $77 ; | XXX XXX| $1031
    .byte $22 ; |  X   X | $1032
    .byte $00 ; |        | $1033
    .byte $00 ; |        | $1034
    .byte $00 ; |        | $1035
    .byte $00 ; |        | $1036
    .byte $00 ; |        | $1037
    .byte $00 ; |        | $1038
    .byte $00 ; |        | $1039
    .byte $00 ; |        | $103A
    .byte $00 ; |        | $103B
    .byte $00 ; |        | $103C
    .byte $00 ; |        | $103D
    .byte $00 ; |        | $103E
    .byte $00 ; |        | $103F
    .byte $00 ; |        | $1040
    .byte $00 ; |        | $1041
    .byte $00 ; |        | $1042
    .byte $00 ; |        | $1043
    .byte $00 ; |        | $1044
    .byte $00 ; |        | $1045
    .byte $00 ; |        | $1046
    .byte $00 ; |        | $1047
    .byte $00 ; |        | $1048
    .byte $00 ; |        | $1049
    .byte $00 ; |        | $104A
    .byte $00 ; |        | $104B
    .byte $00 ; |        | $104C
    .byte $00 ; |        | $104D
    .byte $00 ; |        | $104E
    .byte $08 ; |    X   | $104F
    .byte $08 ; |    X   | $1050
    .byte $04 ; |     X  | $1051
    .byte $04 ; |     X  | $1052
    .byte $08 ; |    X   | $1053
    .byte $10 ; |   X    | $1054
    .byte $10 ; |   X    | $1055
    .byte $08 ; |    X   | $1056
    .byte $2A ; |  X X X | $1057
    .byte $7F ; | XXXXXXX| $1058
    .byte $5D ; | X XXX X| $1059
    .byte $3E ; |  XXXXX | $105A
    .byte $3E ; |  XXXXX | $105B
    .byte $3E ; |  XXXXX | $105C
    .byte $BD ; |X XXXX X| $105D
    .byte $FF ; |XXXXXXXX| $105E
    .byte $5A ; | X XX X | $105F
    .byte $3C ; |  XXXX  | $1060
    .byte $1E ; |   XXXX | $1061
    .byte $7E ; | XXXXXX | $1062
    .byte $FE ; |XXXXXXX | $1063
    .byte $9C ; |X  XXX  | $1064
    .byte $3E ; |  XXXXX | $1065
    .byte $77 ; | XXX XXX| $1066
    .byte $77 ; | XXX XXX| $1067
    .byte $77 ; | XXX XXX| $1068
    .byte $22 ; |  X   X | $1069
    .byte $00 ; |        | $106A
    .byte $00 ; |        | $106B
    .byte $00 ; |        | $106C
    .byte $00 ; |        | $106D
    .byte $00 ; |        | $106E
    .byte $00 ; |        | $106F
    .byte $00 ; |        | $1070
    .byte $00 ; |        | $1071
    .byte $00 ; |        | $1072
    .byte $00 ; |        | $1073
    .byte $00 ; |        | $1074
    .byte $00 ; |        | $1075
    .byte $00 ; |        | $1076
    .byte $00 ; |        | $1077
    .byte $00 ; |        | $1078
    .byte $00 ; |        | $1079
    .byte $00 ; |        | $107A
    .byte $00 ; |        | $107B
    .byte $00 ; |        | $107C
    .byte $00 ; |        | $107D
    .byte $00 ; |        | $107E
    .byte $00 ; |        | $107F
    .byte $00 ; |        | $1080
    .byte $00 ; |        | $1081
    .byte $08 ; |    X   | $1082
    .byte $24 ; |  X  X  | $1083
    .byte $54 ; | X X X  | $1084
    .byte $48 ; | X  X   | $1085
    .byte $A2 ; |X X   X | $1086
    .byte $FE ; |XXXXXXX | $1087
    .byte $BA ; |X XXX X | $1088
    .byte $FE ; |XXXXXXX | $1089
    .byte $7C ; | XXXXX  | $108A
    .byte $7C ; | XXXXX  | $108B
    .byte $3C ; |  XXXX  | $108C
    .byte $3E ; |  XXXXX | $108D
    .byte $5B ; | X XX XX| $108E
    .byte $E9 ; |XXX X  X| $108F
    .byte $E4 ; |XXX  X  | $1090
    .byte $74 ; | XXX X  | $1091
    .byte $3C ; |  XXXX  | $1092
    .byte $14 ; |   X X  | $1093
    .byte $7C ; | XXXXX  | $1094
    .byte $EE ; |XXX XXX | $1095
    .byte $EE ; |XXX XXX | $1096
    .byte $EE ; |XXX XXX | $1097
    .byte $44 ; | X   X  | $1098
    .byte $00 ; |        | $1099
    .byte $00 ; |        | $109A
    .byte $00 ; |        | $109B
    .byte $00 ; |        | $109C
    .byte $00 ; |        | $109D
    .byte $00 ; |        | $109E
    .byte $00 ; |        | $109F
    .byte $00 ; |        | $10A0
    .byte $00 ; |        | $10L1
    .byte $00 ; |        | $10A2
    .byte $00 ; |        | $10A3
    .byte $00 ; |        | $10A4
    .byte $00 ; |        | $10A5
    .byte $00 ; |        | $10A6
    .byte $00 ; |        | $10A7
    .byte $00 ; |        | $10A8
    .byte $00 ; |        | $10A9
    .byte $00 ; |        | $10AA
    .byte $00 ; |        | $10AB
    .byte $00 ; |        | $10AC
    .byte $00 ; |        | $10AD
    .byte $00 ; |        | $10AE
    .byte $00 ; |        | $10AF
    .byte $00 ; |        | $10B0
    .byte $00 ; |        | $10B1
    .byte $00 ; |        | $10B2
    .byte $00 ; |        | $10B3
    .byte $00 ; |        | $10B4
    .byte $10 ; |   X    | $10B5
    .byte $10 ; |   X    | $10B6
    .byte $08 ; |    X   | $10B7
    .byte $08 ; |    X   | $10B8
    .byte $10 ; |   X    | $10B9
    .byte $20 ; |  X     | $10BA
    .byte $20 ; |  X     | $10BB
    .byte $10 ; |   X    | $10BC
    .byte $54 ; | X X X  | $10BD
    .byte $FE ; |XXXXXXX | $10BE
    .byte $BA ; |X XXX X | $10BF
    .byte $7C ; | XXXXX  | $10C0
    .byte $7C ; | XXXXX  | $10C1
    .byte $7C ; | XXXXX  | $10C2
    .byte $3D ; |  XXXX X| $10C3
    .byte $3F ; |  XXXXXX| $10C4
    .byte $5A ; | X XX X | $10C5
    .byte $E8 ; |XXX X   | $10C6
    .byte $E4 ; |XXX  X  | $10C7
    .byte $74 ; | XXX X  | $10C8
    .byte $3C ; |  XXXX  | $10C9
    .byte $14 ; |   X X  | $10CA
    .byte $7C ; | XXXXX  | $10CB
    .byte $EE ; |XXX XXX | $10CC
    .byte $EE ; |XXX XXX | $10CD
    .byte $EE ; |XXX XXX | $10CE
    .byte $44 ; | X   X  | $10CF
    .byte $00 ; |        | $10D0
    .byte $00 ; |        | $10D1
    .byte $00 ; |        | $10D2
    .byte $00 ; |        | $10D3
    .byte $00 ; |        | $10D4
    .byte $00 ; |        | $10D5
    .byte $00 ; |        | $10D6
    .byte $00 ; |        | $10D7
    .byte $00 ; |        | $10D8
    .byte $00 ; |        | $10D9
    .byte $00 ; |        | $10DA
    .byte $00 ; |        | $10DB
    .byte $00 ; |        | $10DC
    .byte $00 ; |        | $10DD
    .byte $00 ; |        | $10DE
    .byte $00 ; |        | $10DF
    .byte $00 ; |        | $10E0
    .byte $00 ; |        | $10E1
    .byte $00 ; |        | $10E2
    .byte $00 ; |        | $10E3
    .byte $00 ; |        | $10E4
    .byte $00 ; |        | $10E5
    .byte $00 ; |        | $10E6
    .byte $00 ; |        | $10E7
LivesDisplay:
    .byte $00 ; |        | $10E8
    .byte $50 ; | X X    | $10E9
    .byte $28 ; |  X X   | $10EA
    .byte $A8 ; |X X X   | $10EB
    .byte $F8 ; |XXXXX   | $10EC
    .byte $78 ; | XXXX   | $10ED
    .byte $28 ; |  X X   | $10EE
    .byte $78 ; | XXXX   | $10EF
    .byte $30 ; |  XX    | $10F0

    .byte $B2 ; |X XX  X | $10F1
    .byte $A0 ; |X X     | $10F2
    .byte $A5 ; |X X  X X| $10F3
    .byte $BA ; |X XXX X | $10F4
    .byte $A4 ; |X X  X  | $10F5
    .byte $E5 ; |XXX  X X| $10F6
    .byte $A0 ; |X X     | $10F7
    .byte $A0 ; |X X     | $10F8
    .byte $A0 ; |X X     | $10F9
    .byte $E5 ; |XXX  X X| $10FA
    .byte $A0 ; |X X     | $10FB
    .byte $A2 ; |X X   X | $10FC
    .byte $A5 ; |X X  X X| $10FD
    .byte $A0 ; |X X     | $10FE
    .byte $A0 ; |X X     | $10FF
    .byte $00 ; |        | $1100
    .byte $00 ; |        | $1101
    .byte $00 ; |        | $1102
    .byte $00 ; |        | $1103
    .byte $00 ; |        | $1104
    .byte $00 ; |        | $1105
    .byte $00 ; |        | $1106
    .byte $00 ; |        | $1107
    .byte $00 ; |        | $1108
    .byte $00 ; |        | $1109
    .byte $00 ; |        | $110A
    .byte $00 ; |        | $110B
    .byte $00 ; |        | $110C
    .byte $00 ; |        | $110D
    .byte $00 ; |        | $110E
    .byte $00 ; |        | $110F
    .byte $00 ; |        | $1110
    .byte $00 ; |        | $1111
    .byte $00 ; |        | $1112
    .byte $00 ; |        | $1113
    .byte $00 ; |        | $1114
    .byte $00 ; |        | $1115
    .byte $00 ; |        | $1116
    .byte $00 ; |        | $1117
    .byte $00 ; |        | $1118
    .byte $00 ; |        | $1119
    .byte $00 ; |        | $111A
    .byte $00 ; |        | $111B
    .byte $58 ; | X XX   | $111C
    .byte $5C ; | X XXX  | $111D
    .byte $2E ; |  X XXX | $111E
    .byte $16 ; |   X XX | $111F
    .byte $1C ; |   XXX  | $1120
    .byte $1C ; |   XXX  | $1121
    .byte $3E ; |  XXXXX | $1122
    .byte $26 ; |  X  XX | $1123
    .byte $02 ; |      X | $1124
    .byte $50 ; | X X    | $1125
    .byte $06 ; |     XX | $1126
    .byte $3E ; |  XXXXX | $1127
    .byte $1C ; |   XXX  | $1128
    .byte $00 ; |        | $1129
    .byte $00 ; |        | $112A
    .byte $00 ; |        | $112B
    .byte $00 ; |        | $112C
    .byte $00 ; |        | $112D
    .byte $00 ; |        | $112E
    .byte $00 ; |        | $112F
    .byte $00 ; |        | $1130
    .byte $00 ; |        | $1131
    .byte $00 ; |        | $1132
    .byte $00 ; |        | $1133
    .byte $00 ; |        | $1134
    .byte $00 ; |        | $1135
    .byte $00 ; |        | $1136
    .byte $00 ; |        | $1137
    .byte $00 ; |        | $1138
    .byte $00 ; |        | $1139
    .byte $00 ; |        | $113A
    .byte $00 ; |        | $113B
    .byte $00 ; |        | $113C
    .byte $00 ; |        | $113D
    .byte $00 ; |        | $113E
    .byte $00 ; |        | $113F
    .byte $00 ; |        | $1140
    .byte $00 ; |        | $1141
    .byte $00 ; |        | $1142
    .byte $58 ; | X XX   | $1143
    .byte $5C ; | X XXX  | $1144
    .byte $2E ; |  X XXX | $1145
    .byte $16 ; |   X XX | $1146
    .byte $14 ; |   X X  | $1147
    .byte $14 ; |   X X  | $1148
    .byte $1C ; |   XXX  | $1149
    .byte $1C ; |   XXX  | $114A
    .byte $3E ; |  XXXXX | $114B
    .byte $26 ; |  X  XX | $114C
    .byte $02 ; |      X | $114D
    .byte $50 ; | X X    | $114E
    .byte $06 ; |     XX | $114F
    .byte $3E ; |  XXXXX | $1150
    .byte $1C ; |   XXX  | $1151
    .byte $00 ; |        | $1152
    .byte $00 ; |        | $1153
    .byte $00 ; |        | $1154
    .byte $00 ; |        | $1155
    .byte $00 ; |        | $1156
    .byte $00 ; |        | $1157
    .byte $00 ; |        | $1158
    .byte $00 ; |        | $1159
    .byte $00 ; |        | $115A
    .byte $00 ; |        | $115B
    .byte $00 ; |        | $115C
    .byte $00 ; |        | $115D
    .byte $00 ; |        | $115E
    .byte $00 ; |        | $115F
    .byte $00 ; |        | $1160
    .byte $00 ; |        | $1161
    .byte $00 ; |        | $1162
    .byte $00 ; |        | $1163
    .byte $00 ; |        | $1164
    .byte $00 ; |        | $1165
    .byte $00 ; |        | $1166
    .byte $00 ; |        | $1167
    .byte $00 ; |        | $1168
    .byte $00 ; |        | $1169
    .byte $58 ; | X XX   | $116A
    .byte $5C ; | X XXX  | $116B
    .byte $2E ; |  X XXX | $116C
    .byte $16 ; |   X XX | $116D
    .byte $1C ; |   XXX  | $116E
    .byte $1C ; |   XXX  | $116F
    .byte $3E ; |  XXXXX | $1170
    .byte $3E ; |  XXXXX | $1171
    .byte $16 ; |   X XX | $1172
    .byte $16 ; |   X XX | $1173
    .byte $16 ; |   X XX | $1174
    .byte $3E ; |  XXXXX | $1175
    .byte $1C ; |   XXX  | $1176
    .byte $00 ; |        | $1177
    .byte $00 ; |        | $1178
    .byte $00 ; |        | $1179
    .byte $00 ; |        | $117A
    .byte $00 ; |        | $117B
    .byte $00 ; |        | $117C
    .byte $00 ; |        | $117D
    .byte $00 ; |        | $117E
    .byte $00 ; |        | $117F
    .byte $00 ; |        | $1180
    .byte $00 ; |        | $1181
    .byte $00 ; |        | $1182
    .byte $00 ; |        | $1183
    .byte $00 ; |        | $1184
    .byte $00 ; |        | $1185
    .byte $00 ; |        | $1186
    .byte $00 ; |        | $1187
    .byte $00 ; |        | $1188
    .byte $00 ; |        | $1189
    .byte $00 ; |        | $118A
    .byte $00 ; |        | $118B
    .byte $00 ; |        | $118C
    .byte $00 ; |        | $118D
    .byte $00 ; |        | $118E
    .byte $00 ; |        | $118F
    .byte $00 ; |        | $1190
    .byte $58 ; | X XX   | $1191
    .byte $5C ; | X XXX  | $1192
    .byte $2E ; |  X XXX | $1193
    .byte $16 ; |   X XX | $1194
    .byte $14 ; |   X X  | $1195
    .byte $14 ; |   X X  | $1196
    .byte $1C ; |   XXX  | $1197
    .byte $1C ; |   XXX  | $1198
    .byte $3E ; |  XXXXX | $1199
    .byte $3E ; |  XXXXX | $119A
    .byte $16 ; |   X XX | $119B
    .byte $16 ; |   X XX | $119C
    .byte $16 ; |   X XX | $119D
    .byte $3E ; |  XXXXX | $119E
    .byte $1C ; |   XXX  | $119F
    .byte $00 ; |        | $11A0
    .byte $00 ; |        | $11L1
    .byte $00 ; |        | $11A2
    .byte $00 ; |        | $11A3
    .byte $00 ; |        | $11A4
    .byte $00 ; |        | $11A5
    .byte $00 ; |        | $11A6
    .byte $00 ; |        | $11A7
    .byte $00 ; |        | $11A8
    .byte $00 ; |        | $11A9
    .byte $00 ; |        | $11AA
    .byte $00 ; |        | $11AB
    .byte $00 ; |        | $11AC
    .byte $00 ; |        | $11AD
    .byte $00 ; |        | $11AE
    .byte $00 ; |        | $11AF
    .byte $00 ; |        | $11B0
    .byte $00 ; |        | $11B1
    .byte $00 ; |        | $11B2
    .byte $00 ; |        | $11B3
    .byte $00 ; |        | $11B4
    .byte $00 ; |        | $11B5
    .byte $00 ; |        | $11B6
    .byte $00 ; |        | $11B7
    .byte $00 ; |        | $11B8
    .byte $01 ; |       X| $11B9
    .byte $01 ; |       X| $11BA
    .byte $01 ; |       X| $11BB
    .byte $07 ; |     XXX| $11BC
    .byte $1F ; |   XXXXX| $11BD
    .byte $3F ; |  XXXXXX| $11BE
    .byte $6F ; | XX XXXX| $11BF
    .byte $7D ; | XXXXX X| $11C0
    .byte $EC ; |XXX XX  | $11C1
    .byte $E9 ; |XXX X  X| $11C2
    .byte $CE ; |XX  XXX | $11C3
    .byte $CE ; |XX  XXX | $11C4
    .byte $CC ; |XX  XX  | $11C5
    .byte $4E ; | X  XXX | $11C6
    .byte $7F ; | XXXXXXX| $11C7
    .byte $3F ; |  XXXXXX| $11C8
    .byte $1F ; |   XXXXX| $11C9
    .byte $07 ; |     XXX| $11CA
    .byte $00 ; |        | $11CB
    .byte $00 ; |        | $11CC
    .byte $00 ; |        | $11CD
    .byte $00 ; |        | $11CE
    .byte $00 ; |        | $11CF
    .byte $00 ; |        | $11D0
    .byte $00 ; |        | $11D1
    .byte $80 ; |X       | $11D2
    .byte $C0 ; |XX      | $11D3
    .byte $E0 ; |XXX     | $11D4
    .byte $F8 ; |XXXXX   | $11D5
    .byte $FC ; |XXXXXX  | $11D6
    .byte $76 ; | XXX XX | $11D7
    .byte $3E ; |  XXXXX | $11D8
    .byte $77 ; | XXX XXX| $11D9
    .byte $B3 ; |X XX  XX| $11DA
    .byte $99 ; |X  XX  X| $11DB
    .byte $39 ; |  XXX  X| $11DC
    .byte $A9 ; |X X X  X| $11DD
    .byte $F2 ; |XXXX  X | $11DE
    .byte $FE ; |XXXXXXX | $11DF
    .byte $FC ; |XXXXXX  | $11E0
    .byte $F8 ; |XXXXX   | $11E1
    .byte $E0 ; |XXX     | $11E2
    .byte $00 ; |        | $11E3
    .byte $00 ; |        | $11E4
    .byte $00 ; |        | $11E5
    .byte $00 ; |        | $11E6
    .byte $00 ; |        | $11E7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

HorizPositioning SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    sec                          ; 2
.divideBy15:
    sbc    #15                   ; 2
    bcs    .divideBy15           ; 2³
    eor    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$90                  ; 2
    sta    RESP0_mirror,X        ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMP0,X                ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $A0 ; |X X     | $11FF   garbage

    .byte $00 ; |        | $1200
    .byte $00 ; |        | $1201
    .byte $00 ; |        | $1202
    .byte $00 ; |        | $1203
    .byte $00 ; |        | $1204
    .byte $00 ; |        | $1205
    .byte $00 ; |        | $1206
    .byte $00 ; |        | $1207
    .byte $00 ; |        | $1208
    .byte $00 ; |        | $1209
    .byte $00 ; |        | $120A
    .byte $00 ; |        | $120B
    .byte $00 ; |        | $120C
    .byte $00 ; |        | $120D
    .byte $00 ; |        | $120E
    .byte $00 ; |        | $120F
    .byte $00 ; |        | $1210
    .byte $00 ; |        | $1211
    .byte $00 ; |        | $1212
    .byte $00 ; |        | $1213
    .byte $00 ; |        | $1214
    .byte $00 ; |        | $1215
    .byte $00 ; |        | $1216
    .byte $00 ; |        | $1217
    .byte $00 ; |        | $1218
    .byte $00 ; |        | $1219
    .byte $00 ; |        | $121A
    .byte $00 ; |        | $121B
    .byte $04 ; |     X  | $121C
    .byte $2E ; |  X XXX | $121D
    .byte $77 ; | XXX XXX| $121E
    .byte $1F ; |   XXXXX| $121F
    .byte $6C ; | XX XX  | $1220
    .byte $F6 ; |XXXX XX | $1221
    .byte $FE ; |XXXXXXX | $1222
    .byte $FF ; |XXXXXXXX| $1223
    .byte $FF ; |XXXXXXXX| $1224
    .byte $7F ; | XXXXXXX| $1225
    .byte $7F ; | XXXXXXX| $1226
    .byte $2A ; |  X X X | $1227
    .byte $14 ; |   X X  | $1228
    .byte $00 ; |        | $1229
    .byte $00 ; |        | $122A
    .byte $00 ; |        | $122B
    .byte $00 ; |        | $122C
    .byte $00 ; |        | $122D
    .byte $00 ; |        | $122E
    .byte $00 ; |        | $122F
    .byte $00 ; |        | $1230
    .byte $00 ; |        | $1231
    .byte $00 ; |        | $1232
    .byte $00 ; |        | $1233
    .byte $00 ; |        | $1234
    .byte $00 ; |        | $1235
    .byte $00 ; |        | $1236
    .byte $00 ; |        | $1237
    .byte $00 ; |        | $1238
    .byte $00 ; |        | $1239
    .byte $00 ; |        | $123A
    .byte $00 ; |        | $123B
    .byte $00 ; |        | $123C
    .byte $00 ; |        | $123D
    .byte $00 ; |        | $123E
    .byte $00 ; |        | $123F
    .byte $00 ; |        | $1240
    .byte $00 ; |        | $1241
    .byte $00 ; |        | $1242
    .byte $04 ; |     X  | $1243
    .byte $2C ; |  X XX  | $1244
    .byte $6E ; | XX XXX | $1245
    .byte $76 ; | XXX XX | $1246
    .byte $33 ; |  XX  XX| $1247
    .byte $17 ; |   X XXX| $1248
    .byte $1C ; |   XXX  | $1249
    .byte $6C ; | XX XX  | $124A
    .byte $F6 ; |XXXX XX | $124B
    .byte $FE ; |XXXXXXX | $124C
    .byte $FF ; |XXXXXXXX| $124D
    .byte $FF ; |XXXXXXXX| $124E
    .byte $7F ; | XXXXXXX| $124F
    .byte $2A ; |  X X X | $1250
    .byte $14 ; |   X X  | $1251
    .byte $00 ; |        | $1252
    .byte $00 ; |        | $1253
    .byte $00 ; |        | $1254
    .byte $00 ; |        | $1255
    .byte $00 ; |        | $1256
    .byte $00 ; |        | $1257
    .byte $00 ; |        | $1258
    .byte $00 ; |        | $1259
    .byte $00 ; |        | $125A
    .byte $00 ; |        | $125B
    .byte $00 ; |        | $125C
    .byte $00 ; |        | $125D
    .byte $00 ; |        | $125E
    .byte $00 ; |        | $125F
    .byte $00 ; |        | $1260
    .byte $00 ; |        | $1261
    .byte $00 ; |        | $1262
    .byte $00 ; |        | $1263
    .byte $00 ; |        | $1264
    .byte $00 ; |        | $1265
    .byte $00 ; |        | $1266
    .byte $00 ; |        | $1267
    .byte $00 ; |        | $1268
    .byte $00 ; |        | $1269
    .byte $3C ; |  XXXX  | $126A
    .byte $7E ; | XXXXXX | $126B
    .byte $FF ; |XXXXXXXX| $126C
    .byte $FF ; |XXXXXXXX| $126D
    .byte $BF ; |X XXXXXX| $126E
    .byte $FF ; |XXXXXXXX| $126F
    .byte $DF ; |XX XXXXX| $1270
    .byte $66 ; | XX  XX | $1271
    .byte $3C ; |  XXXX  | $1272
    .byte $00 ; |        | $1273
    .byte $00 ; |        | $1274
    .byte $00 ; |        | $1275
    .byte $00 ; |        | $1276
    .byte $00 ; |        | $1277
    .byte $00 ; |        | $1278
    .byte $00 ; |        | $1279
    .byte $00 ; |        | $127A
    .byte $00 ; |        | $127B
    .byte $00 ; |        | $127C
    .byte $00 ; |        | $127D
    .byte $00 ; |        | $127E
    .byte $00 ; |        | $127F
    .byte $00 ; |        | $1280
    .byte $00 ; |        | $1281
    .byte $00 ; |        | $1282
    .byte $00 ; |        | $1283
    .byte $00 ; |        | $1284
    .byte $00 ; |        | $1285
    .byte $00 ; |        | $1286
    .byte $00 ; |        | $1287
    .byte $00 ; |        | $1288
    .byte $00 ; |        | $1289
    .byte $00 ; |        | $128A
    .byte $00 ; |        | $128B
    .byte $00 ; |        | $128C
    .byte $00 ; |        | $128D
    .byte $3C ; |  XXXX  | $128E
    .byte $7E ; | XXXXXX | $128F
    .byte $7E ; | XXXXXX | $1290
    .byte $FF ; |XXXXXXXX| $1291
    .byte $FF ; |XXXXXXXX| $1292
    .byte $FF ; |XXXXXXXX| $1293
    .byte $FF ; |XXXXXXXX| $1294
    .byte $BF ; |X XXXXXX| $1295
    .byte $FF ; |XXXXXXXX| $1296
    .byte $5E ; | X XXXX | $1297
    .byte $66 ; | XX  XX | $1298
    .byte $3C ; |  XXXX  | $1299
    .byte $00 ; |        | $129A
    .byte $00 ; |        | $129B
    .byte $00 ; |        | $129C
    .byte $00 ; |        | $129D
    .byte $00 ; |        | $129E
    .byte $00 ; |        | $129F
    .byte $00 ; |        | $12A0
    .byte $00 ; |        | $12L1
    .byte $00 ; |        | $12A2
    .byte $00 ; |        | $12A3
    .byte $00 ; |        | $12A4
    .byte $00 ; |        | $12A5
    .byte $00 ; |        | $12A6
    .byte $00 ; |        | $12A7
    .byte $00 ; |        | $12A8
    .byte $00 ; |        | $12A9
    .byte $00 ; |        | $12AA
    .byte $00 ; |        | $12AB
    .byte $00 ; |        | $12AC
    .byte $00 ; |        | $12AD
    .byte $00 ; |        | $12AE
    .byte $00 ; |        | $12AF
    .byte $00 ; |        | $12B0
    .byte $00 ; |        | $12B1
    .byte $1B ; |   XX XX| $12B2
    .byte $6F ; | XX XXXX| $12B3
    .byte $2F ; |  X XXXX| $12B4
    .byte $1F ; |   XXXXX| $12B5
    .byte $3F ; |  XXXXXX| $12B6
    .byte $6E ; | XX XXX | $12B7
    .byte $E0 ; |XXX     | $12B8
    .byte $A0 ; |X X     | $12B9
    .byte $60 ; | XX     | $12BA
    .byte $00 ; |        | $12BB
    .byte $00 ; |        | $12BC
    .byte $00 ; |        | $12BD
    .byte $00 ; |        | $12BE
    .byte $00 ; |        | $12BF
    .byte $00 ; |        | $12C0
    .byte $00 ; |        | $12C1
    .byte $00 ; |        | $12C2
    .byte $00 ; |        | $12C3
    .byte $00 ; |        | $12C4
    .byte $00 ; |        | $12C5
    .byte $00 ; |        | $12C6
    .byte $00 ; |        | $12C7
    .byte $00 ; |        | $12C8
    .byte $00 ; |        | $12C9
    .byte $00 ; |        | $12CA
    .byte $00 ; |        | $12CB
    .byte $00 ; |        | $12CC
    .byte $00 ; |        | $12CD
    .byte $00 ; |        | $12CE
    .byte $00 ; |        | $12CF
    .byte $00 ; |        | $12D0
    .byte $00 ; |        | $12D1
    .byte $00 ; |        | $12D2
    .byte $00 ; |        | $12D3
    .byte $00 ; |        | $12D4
    .byte $00 ; |        | $12D5
    .byte $1B ; |   XX XX| $12D6
    .byte $69 ; | XX X  X| $12D7
    .byte $2F ; |  X XXXX| $12D8
    .byte $1F ; |   XXXXX| $12D9
    .byte $1F ; |   XXXXX| $12DA
    .byte $7F ; | XXXXXXX| $12DB
    .byte $EE ; |XXX XXX | $12DC
    .byte $A0 ; |X X     | $12DD
    .byte $60 ; | XX     | $12DE
    .byte $00 ; |        | $12DF
    .byte $00 ; |        | $12E0
    .byte $00 ; |        | $12E1
    .byte $00 ; |        | $12E2
    .byte $00 ; |        | $12E3
    .byte $00 ; |        | $12E4
    .byte $00 ; |        | $12E5
    .byte $00 ; |        | $12E6
    .byte $00 ; |        | $12E7
    .byte $00 ; |        | $12E8
    .byte $00 ; |        | $12E9
    .byte $00 ; |        | $12EA
    .byte $00 ; |        | $12EB
    .byte $00 ; |        | $12EC
    .byte $00 ; |        | $12ED
    .byte $00 ; |        | $12EE
    .byte $00 ; |        | $12EF
    .byte $00 ; |        | $12F0
    .byte $00 ; |        | $12F1
    .byte $00 ; |        | $12F2
    .byte $00 ; |        | $12F3
    .byte $00 ; |        | $12F4
    .byte $00 ; |        | $12F5
    .byte $00 ; |        | $12F6
    .byte $00 ; |        | $12F7
    .byte $00 ; |        | $12F8
    .byte $00 ; |        | $12F9
    .byte $00 ; |        | $12FA
    .byte $A0 ; |X X     | $12FB
    .byte $84 ; |X    X  | $12FC
    .byte $AA ; |X X X X | $12FD
    .byte $A0 ; |X X     | $12FE
    .byte $A0 ; |X X     | $12FF
QbertGraphics:
    .byte $00 ; |        | $1300
    .byte $00 ; |        | $1301
    .byte $00 ; |        | $1302
    .byte $00 ; |        | $1303
    .byte $00 ; |        | $1304
    .byte $00 ; |        | $1305
    .byte $00 ; |        | $1306
    .byte $00 ; |        | $1307
    .byte $00 ; |        | $1308
    .byte $00 ; |        | $1309
    .byte $00 ; |        | $130A
    .byte $00 ; |        | $130B
    .byte $00 ; |        | $130C
    .byte $00 ; |        | $130D
    .byte $00 ; |        | $130E
    .byte $00 ; |        | $130F
    .byte $00 ; |        | $1310
    .byte $00 ; |        | $1311
    .byte $00 ; |        | $1312
    .byte $00 ; |        | $1313
    .byte $00 ; |        | $1314
    .byte $00 ; |        | $1315
    .byte $00 ; |        | $1316
    .byte $00 ; |        | $1317
    .byte $00 ; |        | $1318
    .byte $00 ; |        | $1319
    .byte $00 ; |        | $131A
    .byte $00 ; |        | $131B
    .byte $14 ; |   X X  | $131C
    .byte $3C ; |  XXXX  | $131D
    .byte $14 ; |   X X  | $131E
    .byte $1C ; |   XXX  | $131F
    .byte $1E ; |   XXXX | $1320
    .byte $1E ; |   XXXX | $1321
    .byte $3F ; |  XXXXXX| $1322
    .byte $3F ; |  XXXXXX| $1323
    .byte $3F ; |  XXXXXX| $1324
    .byte $2F ; |  X XXXX| $1325
    .byte $6F ; | XX XXXX| $1326
    .byte $EF ; |XXX XXXX| $1327
    .byte $EF ; |XXX XXXX| $1328
    .byte $5E ; | X XXXX | $1329
    .byte $0C ; |    XX  | $132A
    .byte $00 ; |        | $132B
    .byte $00 ; |        | $132C
    .byte $00 ; |        | $132D
    .byte $00 ; |        | $132E
    .byte $00 ; |        | $132F
    .byte $00 ; |        | $1330
    .byte $00 ; |        | $1331
    .byte $00 ; |        | $1332
    .byte $00 ; |        | $1333
    .byte $00 ; |        | $1334
    .byte $00 ; |        | $1335
    .byte $00 ; |        | $1336
    .byte $00 ; |        | $1337
    .byte $00 ; |        | $1338
    .byte $00 ; |        | $1339
    .byte $00 ; |        | $133A
    .byte $00 ; |        | $133B
    .byte $00 ; |        | $133C
    .byte $00 ; |        | $133D
    .byte $00 ; |        | $133E
    .byte $00 ; |        | $133F
    .byte $00 ; |        | $1340
    .byte $00 ; |        | $1341
    .byte $00 ; |        | $1342
    .byte $00 ; |        | $1343
    .byte $00 ; |        | $1344
    .byte $00 ; |        | $1345
    .byte $14 ; |   X X  | $1346
    .byte $3C ; |  XXXX  | $1347
    .byte $14 ; |   X X  | $1348
    .byte $14 ; |   X X  | $1349
    .byte $14 ; |   X X  | $134A
    .byte $1C ; |   XXX  | $134B
    .byte $1E ; |   XXXX | $134C
    .byte $1E ; |   XXXX | $134D
    .byte $3F ; |  XXXXXX| $134E
    .byte $3F ; |  XXXXXX| $134F
    .byte $3F ; |  XXXXXX| $1350
    .byte $2F ; |  X XXXX| $1351
    .byte $6F ; | XX XXXX| $1352
    .byte $EF ; |XXX XXXX| $1353
    .byte $EF ; |XXX XXXX| $1354
    .byte $5E ; | X XXXX | $1355
    .byte $0C ; |    XX  | $1356
    .byte $00 ; |        | $1357
    .byte $00 ; |        | $1358
    .byte $00 ; |        | $1359
    .byte $00 ; |        | $135A
    .byte $00 ; |        | $135B
    .byte $00 ; |        | $135C
    .byte $00 ; |        | $135D
    .byte $00 ; |        | $135E
    .byte $00 ; |        | $135F
    .byte $00 ; |        | $1360
    .byte $00 ; |        | $1361
    .byte $00 ; |        | $1362
    .byte $00 ; |        | $1363
L1364:
    .byte $00 ; |        | $1364
    .byte $00 ; |        | $1365
    .byte $00 ; |        | $1366
    .byte $00 ; |        | $1367
    .byte $00 ; |        | $1368
    .byte $00 ; |        | $1369
    .byte $00 ; |        | $136A
    .byte $00 ; |        | $136B
    .byte $00 ; |        | $136C
    .byte $00 ; |        | $136D
    .byte $00 ; |        | $136E
    .byte $00 ; |        | $136F
    .byte $28 ; |  X X   | $1370
    .byte $14 ; |   X X  | $1371
    .byte $14 ; |   X X  | $1372
    .byte $14 ; |   X X  | $1373
    .byte $1C ; |   XXX  | $1374
    .byte $5E ; | X XXXX | $1375
    .byte $FE ; |XXXXXXX | $1376
    .byte $BF ; |X XXXXXX| $1377
    .byte $FF ; |XXXXXXXX| $1378
    .byte $7F ; | XXXXXXX| $1379
    .byte $2B ; |  X X XX| $137A
L137B:
    .byte $2B ; |  X X XX| $137B
    .byte $2B ; |  X X XX| $137C
    .byte $2B ; |  X X XX| $137D
    .byte $1E ; |   XXXX | $137E
    .byte $0C ; |    XX  | $137F
    .byte $00 ; |        | $1380
    .byte $00 ; |        | $1381
    .byte $00 ; |        | $1382
    .byte $00 ; |        | $1383
    .byte $00 ; |        | $1384
    .byte $00 ; |        | $1385
    .byte $00 ; |        | $1386
    .byte $00 ; |        | $1387
    .byte $00 ; |        | $1388
    .byte $00 ; |        | $1389
    .byte $00 ; |        | $138A
    .byte $00 ; |        | $138B
    .byte $00 ; |        | $138C
    .byte $00 ; |        | $138D
    .byte $00 ; |        | $138E
    .byte $00 ; |        | $138F
    .byte $00 ; |        | $1390
    .byte $00 ; |        | $1391
    .byte $00 ; |        | $1392
    .byte $00 ; |        | $1393
    .byte $00 ; |        | $1394
    .byte $00 ; |        | $1395
    .byte $00 ; |        | $1396
    .byte $00 ; |        | $1397
    .byte $00 ; |        | $1398
    .byte $00 ; |        | $1399
    .byte $28 ; |  X X   | $139A
    .byte $14 ; |   X X  | $139B
    .byte $14 ; |   X X  | $139C
    .byte $14 ; |   X X  | $139D
    .byte $14 ; |   X X  | $139E
    .byte $14 ; |   X X  | $139F
    .byte $1C ; |   XXX  | $13A0
    .byte $5E ; | X XXXX | $13L1
    .byte $FE ; |XXXXXXX | $13A2
    .byte $BF ; |X XXXXXX| $13A3
    .byte $FF ; |XXXXXXXX| $13A4
    .byte $7F ; | XXXXXXX| $13A5
    .byte $2B ; |  X X XX| $13A6
    .byte $2B ; |  X X XX| $13A7
    .byte $2B ; |  X X XX| $13A8
    .byte $2B ; |  X X XX| $13A9
    .byte $1E ; |   XXXX | $13AA
    .byte $0C ; |    XX  | $13AB
    .byte $00 ; |        | $13AC
    .byte $00 ; |        | $13AD
    .byte $00 ; |        | $13AE
    .byte $00 ; |        | $13AF
    .byte $00 ; |        | $13B0
    .byte $00 ; |        | $13B1
    .byte $00 ; |        | $13B2
    .byte $00 ; |        | $13B3
    .byte $00 ; |        | $13B4
    .byte $00 ; |        | $13B5
    .byte $00 ; |        | $13B6
    .byte $00 ; |        | $13B7
    .byte $00 ; |        | $13B8
    .byte $00 ; |        | $13B9
    .byte $00 ; |        | $13BA
    .byte $00 ; |        | $13BB
    .byte $00 ; |        | $13BC
    .byte $00 ; |        | $13BD
    .byte $00 ; |        | $13BE
    .byte $00 ; |        | $13BF
    .byte $00 ; |        | $13C0
    .byte $00 ; |        | $13C1
    .byte $00 ; |        | $13C2
    .byte $00 ; |        | $13C3
BonusOne:
    .byte $E1 ; |XXX    X| $13C4   the low nibble pointer of this location "BonusOne" = $C4,
    .byte $92 ; |X  X  X | $13C5   it is used to disable the ball, missile 1, missile 2
    .byte $92 ; |X  X  X | $13C6
    .byte $E2 ; |XXX   X | $13C7
    .byte $92 ; |X  X  X | $13C8
    .byte $92 ; |X  X  X | $13C9
    .byte $E1 ; |XXX    X| $13CA
    .byte $00 ; |        | $13CB
    .byte $00 ; |        | $13CC
BonusTwo:
    .byte $89 ; |X   X  X| $13CD
    .byte $49 ; | X  X  X| $13CE
    .byte $4B ; | X  X XX| $13CF
    .byte $4F ; | X  XXXX| $13D0
    .byte $4D ; | X  XX X| $13D1
    .byte $49 ; | X  X  X| $13D2
    .byte $89 ; |X   X  X| $13D3
    .byte $00 ; |        | $13D4
    .byte $00 ; |        | $13D5
BonusThree:
    .byte $18 ; |   XX   | $13D6
    .byte $24 ; |  X  X  | $13D7
    .byte $24 ; |  X  X  | $13D8
    .byte $24 ; |  X  X  | $13D9
    .byte $24 ; |  X  X  | $13DA
    .byte $24 ; |  X  X  | $13DB
    .byte $24 ; |  X  X  | $13DC
    .byte $00 ; |        | $13DD
    .byte $00 ; |        | $13DE
BonusFour:
    .byte $E1 ; |XXX    X| $13DF
    .byte $10 ; |   X    | $13E0
    .byte $10 ; |   X    | $13E1
    .byte $61 ; | XX    X| $13E2
    .byte $81 ; |X      X| $13E3
    .byte $81 ; |X      X| $13E4
    .byte $71 ; | XXX   X| $13E5
    .byte $00 ; |        | $13E6
    .byte $00 ; |        | $13E7

L13E8:
    ldy    #0                    ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    lda    #$14                  ; 2
    sta    TIM64T                ; 4
    lda    $82                   ; 3
    asl                          ; 2
    tay                          ; 2
    lda    IndirectPtrsTab+1,Y   ; 4   get high nybble for an indirect jump
    tax                          ; 2
    jmp    L1DFD                 ; 3   swap in slices 3,4,5 (in that order), jump to beginning of 3

    .byte $A0 ; |X X     | $13FE   garbage
    .byte $C4 ; |XX   X  | $13FF   garbage


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SLICE 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

NumberGfx:
    .byte $00 ; |        | $1400
    .byte $18 ; |   XX   | $1401
    .byte $24 ; |  X  X  | $1402
    .byte $24 ; |  X  X  | $1403
    .byte $24 ; |  X  X  | $1404
    .byte $24 ; |  X  X  | $1405
    .byte $24 ; |  X  X  | $1406
    .byte $18 ; |   XX   | $1407
    .byte $00 ; |        | $1408
    .byte $1C ; |   XXX  | $1409
    .byte $08 ; |    X   | $140A
    .byte $08 ; |    X   | $140B
    .byte $08 ; |    X   | $140C
    .byte $08 ; |    X   | $140D
    .byte $18 ; |   XX   | $140E
    .byte $08 ; |    X   | $140F
    .byte $00 ; |        | $1410
    .byte $3C ; |  XXXX  | $1411
    .byte $20 ; |  X     | $1412
    .byte $20 ; |  X     | $1413
    .byte $18 ; |   XX   | $1414
    .byte $04 ; |     X  | $1415
    .byte $24 ; |  X  X  | $1416
    .byte $18 ; |   XX   | $1417
    .byte $00 ; |        | $1418
    .byte $38 ; |  XXX   | $1419
    .byte $04 ; |     X  | $141A
    .byte $04 ; |     X  | $141B
    .byte $18 ; |   XX   | $141C
    .byte $04 ; |     X  | $141D
    .byte $04 ; |     X  | $141E
    .byte $38 ; |  XXX   | $141F
    .byte $00 ; |        | $1420
    .byte $04 ; |     X  | $1421
    .byte $04 ; |     X  | $1422
    .byte $04 ; |     X  | $1423
    .byte $3C ; |  XXXX  | $1424
    .byte $24 ; |  X  X  | $1425
    .byte $24 ; |  X  X  | $1426
    .byte $24 ; |  X  X  | $1427
    .byte $00 ; |        | $1428
    .byte $38 ; |  XXX   | $1429
    .byte $04 ; |     X  | $142A
    .byte $04 ; |     X  | $142B
    .byte $38 ; |  XXX   | $142C
    .byte $20 ; |  X     | $142D
    .byte $20 ; |  X     | $142E
    .byte $3C ; |  XXXX  | $142F
    .byte $00 ; |        | $1430
    .byte $18 ; |   XX   | $1431
    .byte $24 ; |  X  X  | $1432
    .byte $24 ; |  X  X  | $1433
    .byte $38 ; |  XXX   | $1434
    .byte $20 ; |  X     | $1435
    .byte $20 ; |  X     | $1436
    .byte $1C ; |   XXX  | $1437
    .byte $00 ; |        | $1438
    .byte $10 ; |   X    | $1439
    .byte $10 ; |   X    | $143A
    .byte $08 ; |    X   | $143B
    .byte $08 ; |    X   | $143C
    .byte $04 ; |     X  | $143D
    .byte $04 ; |     X  | $143E
    .byte $3C ; |  XXXX  | $143F
    .byte $00 ; |        | $1440
    .byte $18 ; |   XX   | $1441
    .byte $24 ; |  X  X  | $1442
    .byte $24 ; |  X  X  | $1443
    .byte $18 ; |   XX   | $1444
    .byte $24 ; |  X  X  | $1445
    .byte $24 ; |  X  X  | $1446
    .byte $18 ; |   XX   | $1447
    .byte $00 ; |        | $1448
    .byte $38 ; |  XXX   | $1449
    .byte $04 ; |     X  | $144A
    .byte $04 ; |     X  | $144B
    .byte $1C ; |   XXX  | $144C
    .byte $24 ; |  X  X  | $144D
    .byte $24 ; |  X  X  | $144E
    .byte $18 ; |   XX   | $144F

L1450:
    ldy    #3                    ; 2
    ldx    #$0B                  ; 2
    bne    .getNumPtrs           ; 3   always branch

.loopNumberPtrs:
    lda.wy scoreBCD,Y            ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    scorePtrs,X           ; 4
    dex                          ; 2
    lda    #>NumberGfx           ; 2   digits 1,3,5 from left
    sta    scorePtrs,X           ; 4
    dex                          ; 2
    lda.wy scoreBCD,Y            ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    sta    scorePtrs,X           ; 4
    dex                          ; 2
    bmi    .getDisplayColor      ; 2³  exit loop
.getNumPtrs:
    lda    #>NumberGfx           ; 2   digits 2,4,6 from left
    sta    scorePtrs,X           ; 4
    dex                          ; 2
    dey                          ; 2
    bpl    .loopNumberPtrs       ; 3   always branch

.getDisplayColor:
    ldx    #COLOR_LIVES_DISPLAY  ; 2   shared color for "bonus" too
    stx    COLUP0                ; 3
    stx    COLUP1                ; 3
    lda    $82                   ; 3   check for bonus round
    cmp    #$0D                  ; 2
    bne    .doLivesDisplay       ; 2³
;do bonus round instead
    ldx    #$0B                  ; 2
.loopBonusPointers:
    lda    BonusGfxPtrTab,X      ; 4
    sta    displayPtrs,X         ; 4
    dex                          ; 2
    bpl    .loopBonusPointers    ; 2³
    jmp    WaitForKernelTime     ; 3

BonusGfxPtrTab:
    .word  BonusOne
    .word  BonusTwo
    .word  BonusThree
    .word  BonusFour
    .word  QbertGraphics
    .word  QbertGraphics

.doLivesDisplay:
    ldy    #$0B                  ; 2
    lda    #>LivesDisplay        ; 2
.loopHiPtrsLivesDisp:
    sta.wy displayPtrs,Y         ; 5
    dey                          ; 2
    dey                          ; 2
    bpl    .loopHiPtrsLivesDisp  ; 2³

    ldy    #$0A                  ; 2
    lda    numOfLives            ; 3
    and    #$0F                  ; 2
    tax                          ; 2
.loopLoPtrsLivesDisp:
    dex                          ; 2
    bpl    .lifeGfxPtr           ; 2³
    inx                          ; 2
    txa                          ; 2   A=0, pointer becomes $1000, which points to some blank gfx
    beq    .blankGfxPtr          ; 3   always branch

.lifeGfxPtr:
    lda    #<LivesDisplay        ; 2   A=$E8
.blankGfxPtr:
    sta.wy displayPtrs,Y         ; 5
    dey                          ; 2
    dey                          ; 2
    bpl    .loopLoPtrsLivesDisp  ; 2³

WaitForKernelTime:
.loopWaitKernel:
    ldx    INTIM                 ; 4
    bpl    .loopWaitKernel       ; 2³

    ldx    #0                    ; 2
    sta    ENABL                 ; 3   A=0, $E8, or $C4, so always disable...
    sta    ENAM1                 ; 3
    sta    ENAM0                 ; 3
    stx    GRP0                  ; 3   clear
    stx    GRP1                  ; 3
    stx    REFP0                 ; 3   no reflect
    stx    REFP1                 ; 3
    lda    #$5C                  ; 2
    jsr    HorizPositioning      ; 6   X=0, position P0 at $5B
    inx                          ; 2
    lda    #$64                  ; 2
    jsr    HorizPositioning      ; 6   X=1, position P1 at $63
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    #8                    ; 2
    inx                          ; 2
    inx                          ; 2   X=3
    stx    VDELP0                ; 3   delay
    stx    VDELP1                ; 3
    stx    NUSIZ0                ; 3   three copies (close)
    stx    NUSIZ1                ; 3

.loopDrawLivesDispOrBonus:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (displayPtrs),Y       ; 5
    sta    GRP0                  ; 3
    lda    (displayPtrs+2),Y     ; 5
    sta    GRP1                  ; 3
    lda    (displayPtrs+4),Y     ; 5
    sta    GRP0                  ; 3
    lda    (displayPtrs+6),Y     ; 5
    tax                          ; 2
    lda    (displayPtrs+10),Y    ; 5
    sta    tempZero              ; 3
    lda    (displayPtrs+8),Y     ; 5
    dey                          ; 2
    nop                          ; 2
    sty    tempOne               ; 3
    ldy    tempZero              ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    ldy    tempOne               ; 3
    bpl    .loopDrawLivesDispOrBonus  ; 2³

    ldy    #7                    ; 2
    lda    #COLOR_SCORE          ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3

.loopDrawScore:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (scorePtrs),Y         ; 5
    sta    GRP0                  ; 3
    lda    (scorePtrs+2),Y       ; 5
    sta    GRP1                  ; 3
    lda    (scorePtrs+4),Y       ; 5
    sta    GRP0                  ; 3
    lda    (scorePtrs+6),Y       ; 5
    tax                          ; 2
    lda    (scorePtrs+10),Y      ; 5
    sta    tempZero              ; 3
    lda    (scorePtrs+8),Y       ; 5
    dey                          ; 2
    nop                          ; 2
    sty    tempOne               ; 3
    ldy    tempZero              ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    ldy    tempOne               ; 3
    bpl    .loopDrawScore        ; 2³

    lda    $9C                   ; 3
    and    #$04                  ; 2   reflect or no reflect?
    beq    .noReflectQbert       ; 2³
    lda    #8                    ; 2   reflect Qbert gfx, Qbert now faces to the right side of screen
.noReflectQbert:
    sta    REFP0                 ; 3
    ldx    #0                    ; 2
    stx    VDELP0                ; 3   no delay
    stx    VDELP1                ; 3
    stx    NUSIZ0                ; 3   one copy
    stx    NUSIZ1                ; 3
    stx    PF0                   ; 3   clear
    lda    hPosQbert             ; 3
    jsr    HorizPositioning      ; 6
    inx                          ; 2   X=1
    stx    CTRLPF                ; 3   reflect the playfield
    lda    hPosEnemySection1     ; 3   this is the entry point (horizontally) for the enemies
    jsr    HorizPositioning      ; 6
    ldx    #COLOR_QBERT          ; 2
    lda    $82                   ; 3
    cmp    #$0C                  ; 2
    bne    .colorQbert           ; 2³
    ldx    #COLOR_QBERTS_SWEAR   ; 2
.colorQbert:
    stx    COLUP0                ; 3
    ldx    #2                    ; 2
    lda    $A6                   ; 3   choose between $A9 and $AA registers for enemy color
    bmi    L1580                 ; 2³  - use $AA colEnemy2
    dex                          ; 2   - use $A9 colEnemy1
L1580:
    lda    $A8,X                 ; 4
    sta    COLUP1                ; 3
    lda    $9C,X                 ; 4   find out if the enemy should face left or right
    and    #$04                  ; 2
    beq    .noReflectEnemy       ; 2³
    lda    #8                    ; 2
.noReflectEnemy:
    sta    REFP1                 ; 3
    ldy    #$11                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3   move one time only
    lda    (qbertTopPtr),Y       ; 5
    sta    GRP0                  ; 3
    lda    (enemyTopPtr),Y       ; 5
    sta    GRP1                  ; 3
    dey                          ; 2   Y=16
.loopDrawAboveCubes:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (qbertTopPtr),Y       ; 5
    sta    GRP0                  ; 3
    lda    (enemyTopPtr),Y       ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    bpl    .loopDrawAboveCubes   ; 2³

    lda    #0                    ; 2
    jsr    CheckToDrawEnemy2     ; 6   draw on first row?
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$17                  ; 2   Y=23
    lda    (qBertRow1Ptr),Y      ; 5
    sta    GRP0                  ; 3
    lda    (enemyRow1Ptr),Y      ; 5
    sta    GRP1                  ; 3
    lda    qBertRow1Ptr          ; 3   $BF > $F0  P0
    sta    qBertLoPtr            ; 3   $C0 > $F1
    lda    qBertRow1Ptr+1        ; 3   $CF > $F2  P1
    sta    qbertHiPtr            ; 3   $D0 > $F3
    lda    enemyRow1Ptr          ; 3   $DE > $8F  columns 5,6
    sta    enemyLoPtr            ; 3   $DD > $8E  columns 3,4
    lda    enemyRow1Ptr+1        ; 3  #$FF > $90  column 7
    sta    enemyHiPtr            ; 3
    lda    row1Col_5_6           ; 3
    sta    columns5_6            ; 3
    lda    row1Col_3_4           ; 3
    sta    columns3_4            ; 3
    lda    #$FF                  ; 2
    sta    columns7              ; 3   hide column 7
    jsr    OddNumberRows         ; 6   draw 1st (top) row of cubes
    lda    (qBertRow2Ptr),Y      ; 5
    sta    GRP0                  ; 3
    lda    (enemyRow2Ptr),Y      ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    lda    (qBertRow2Ptr),Y      ; 5
    tax                          ; 2
    lda    (enemyRow2Ptr),Y      ; 5
    beq    L15F8                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sta    HMCLR                 ; 3
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    L15FD                 ; 3

L15F8:
    lda    hPosEnemySection2     ; 3
    jsr    HorizPositionEnemy    ; 6
L15FD:
    lda    (enemyRow2Ptr),Y      ; 5
    sta    GRP1                  ; 3
    lda    (qBertRow2Ptr),Y      ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    lda    #2                    ; 2
    jsr    CheckToDrawEnemy2     ; 6   draw on second row?
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (qBertRow2Ptr),Y      ; 5
    sta    GRP0                  ; 3
    lda    (enemyRow2Ptr),Y      ; 5
    sta    GRP1                  ; 3
    lda    qBertRow2Ptr          ; 3   $C1 > $F0  P0
    sta    qBertLoPtr            ; 3   $C2 > $F1
    lda    qBertRow2Ptr+1        ; 3   $D1 > $F2  P1
    sta    qbertHiPtr            ; 3   $D2 > $F3
    lda    enemyRow2Ptr          ; 3   $DF > $8E  columns 3,4
    sta    enemyLoPtr            ; 3   $E0 > $8F  columns 5,6
    lda    enemyRow2Ptr+1        ; 3  #$FF > $8D  columns 1,2
    sta    enemyHiPtr            ; 3  #$FF > $90  column 7
    lda    row2Col_3_4           ; 3
    sta    columns3_4            ; 3
    lda    row2Col_5_6           ; 3
    sta    columns5_6            ; 3
    lda    #$FF                  ; 2
    sta    columns1_2            ; 3   hide columns 1,2
    sta    columns7              ; 3   hide columns 7
    jsr    EvenNumberRows        ; 6   draw 2nd row of cubes
    ldy    #$17                  ; 2
    lda    (enemyRow3Ptr),Y      ; 5
    sta    GRP1                  ; 3
    lda    (qBertRow3Ptr),Y      ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    lda    (qBertRow3Ptr),Y      ; 5
    tax                          ; 2
    lda    (enemyRow3Ptr),Y      ; 5
    beq    L1658                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    L165D                 ; 3

L1658:
    lda    hPosEnemySection3     ; 3
    jsr    HorizPositionEnemy    ; 6
L165D:
    lda    (enemyRow3Ptr),Y      ; 5
    sta    GRP1                  ; 3
    lda    (qBertRow3Ptr),Y      ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    lda    #4                    ; 2
    jsr    CheckToDrawEnemy2     ; 6   draw on third row?
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (qBertRow3Ptr),Y      ; 5
    sta    GRP0                  ; 3
    lda    (enemyRow3Ptr),Y      ; 5
    sta    GRP1                  ; 3
    lda    qBertRow3Ptr          ; 3   $C3 > $F0  P0
    sta    qBertLoPtr            ; 3   $C4 > $F1
    lda    qBertRow3Ptr+1        ; 3   $D3 > $F2  P1
    sta    qbertHiPtr            ; 3
    lda    enemyRow3Ptr          ; 3
    sta    enemyLoPtr            ; 3
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (qBertRow3Ptr),Y      ; 5
    sta    GRP0                  ; 3
    lda    (enemyRow3Ptr),Y      ; 5
    sta    GRP1                  ; 3
    lda    row3Col_3_4           ; 3   $E1 > $8E  columns 3,4
    sta    columns3_4            ; 3   $D4 > $F3
    lda    enemyRow3Ptr+1        ; 3   $E2 > $8F  columns 5,6
    sta    enemyHiPtr            ; 3   $E3 > $90  column 7
    lda    row3Col_5_6           ; 3
    sta    columns5_6            ; 3
    lda    row3Col_7             ; 3
    sta    columns7              ; 3
    jsr    OddNumberRows         ; 6   draw 3rd row of cubes
    lda    (qBertRow4Ptr),Y      ; 5
    sta    GRP0                  ; 3
    lda    (enemyRow4Ptr),Y      ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    lda    (qBertRow4Ptr),Y      ; 5
    tax                          ; 2
    lda    (enemyRow4Ptr),Y      ; 5
    beq    L16BF                 ; 2³
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    L16C4                 ; 3

L16BF:
    lda    hPosEnemySection4     ; 3
    jsr    HorizPositionEnemy    ; 6
L16C4:
    lda    (qBertRow4Ptr),Y      ; 5
    sta    GRP0                  ; 3
    lda    (enemyRow4Ptr),Y      ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    lda    #6                    ; 2
    jsr    CheckToDrawEnemy2     ; 6   draw on fourth row?
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (qBertRow4Ptr),Y      ; 5
    sta    GRP0                  ; 3
    lda    (enemyRow4Ptr),Y      ; 5
    sta    GRP1                  ; 3
    lda    row4Col_1_2           ; 3   $E4 > $8D  columns 1,2
    sta    columns1_2            ; 3   $E5 > $8E  columns 3,4
    lda    row4Col_3_4           ; 3   $E6 > $8F  columns 5,6
    sta    columns3_4            ; 3   $E7 > $90  column 7
    lda    row4Col_5_6           ; 3   $C5 > $F0  P0
    sta    columns5_6            ; 3   $C6 > $F1
    lda    row4Col_7             ; 3   $D5 > $F2  P1
    sta    columns7              ; 3   $D6 > $F3
    lda    qBertRow4Ptr          ; 3
    sta    qBertLoPtr            ; 3
    lda    qBertRow4Ptr+1        ; 3
    sta    qbertHiPtr            ; 3
    lda    enemyRow4Ptr          ; 3
    sta    enemyLoPtr            ; 3
    lda    enemyRow4Ptr+1        ; 3
    sta    enemyHiPtr            ; 3
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    EvenNumberRows        ; 6   draw 4th row of cubes
    lda    #BLACK                ; 2
    sta    COLUPF                ; 3
    ldy    #$17                  ; 2
    lda    (enemyRow5Ptr),Y      ; 5
    sta    GRP1                  ; 3
    lda    (qBertRow5Ptr),Y      ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    lda    (qBertRow5Ptr),Y      ; 5
    tax                          ; 2
    lda    (enemyRow5Ptr),Y      ; 5
    beq    L1728                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sta    HMCLR                 ; 3
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    L172D                 ; 3

L1728:
    lda    hPosEnemySection5     ; 3
    jsr    HorizPositionEnemy    ; 6
L172D:
    lda    (enemyRow5Ptr),Y      ; 5
    sta    GRP1                  ; 3
    lda    (qBertRow5Ptr),Y      ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    lda    #8                    ; 2
    jsr    CheckToDrawEnemy2     ; 6   draw on fifth row?
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (enemyRow5Ptr),Y      ; 5
    sta    GRP1                  ; 3
    lda    (qBertRow5Ptr),Y      ; 5
    sta    GRP0                  ; 3
    lda    qBertRow5Ptr          ; 3   $C7 > $F0  P0
    sta    qBertLoPtr            ; 3   $C8 > $F1
    lda    qBertRow5Ptr+1        ; 3   $D7 > $F2  P1
    sta    qbertHiPtr            ; 3   $D8 > $F3
    lda    enemyRow5Ptr          ; 3   $E8 > $8E  columns 3,4
    sta    enemyLoPtr            ; 3
    lda    enemyRow5Ptr+1        ; 3
    sta    enemyHiPtr            ; 3
    lda    row5Col_3_4           ; 3
    sta    columns3_4            ; 3
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (qBertRow5Ptr),Y      ; 5
    sta    GRP0                  ; 3
    lda    (enemyRow5Ptr),Y      ; 5
    sta    GRP1                  ; 3
    lda    row5Col_5_6           ; 3   $E9 > $8F  columns 5,6
    sta    columns5_6            ; 3   $EA > $90  column 7
    lda    row5Col_7             ; 3
    sta    columns7              ; 3
    jsr    OddNumberRows         ; 6   draw 5th row of cubes
    lda    (qBertRow6Ptr),Y      ; 5
    sta    GRP0                  ; 3
    lda    (enemyRow6Ptr),Y      ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    lda    (qBertRow6Ptr),Y      ; 5
    tax                          ; 2
    lda    (enemyRow6Ptr),Y      ; 5
    beq    L178F                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sta    HMCLR                 ; 3
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    L1794                 ; 3

L178F:
    lda    hPosEnemySection6     ; 3
    jsr    HorizPositionEnemy    ; 6
L1794:
    lda    (qBertRow6Ptr),Y      ; 5
    sta    GRP0                  ; 3
    lda    (enemyRow6Ptr),Y      ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    lda    #$0A                  ; 2
    jsr    CheckToDrawEnemy2     ; 6   draw on sixth row?
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (qBertRow6Ptr),Y      ; 5
    sta    GRP0                  ; 3
    lda    (enemyRow6Ptr),Y      ; 5
    sta    GRP1                  ; 3
    lda    qBertRow6Ptr          ; 3   $C9 > $F0  P0
    sta    qBertLoPtr            ; 3   $CA > $F1
    lda    qBertRow6Ptr+1        ; 3   $D9 > $F2  P1
    sta    qbertHiPtr            ; 3   $DA > $F3
    lda    enemyRow6Ptr          ; 3   $EB > $8E  columns 3,4
    sta    enemyLoPtr            ; 3   $EC > $8F  columns 5,6
    lda    enemyRow6Ptr+1        ; 3  #$FF > $8D  columns 1,2
    sta    enemyHiPtr            ; 3  #$FF > $90  column 7
    lda    row6Col_3_4           ; 3
    sta    columns3_4            ; 3
    lda    row6Col_5_6           ; 3
    sta    columns5_6            ; 3
    lda    #$FF                  ; 2
    sta    columns1_2            ; 3   hide columns 1,2
    sta    columns7              ; 3   hide column 7
    jsr    EvenNumberRows        ; 6   draw 6th row of cubes
    ldy    #$17                  ; 2
    lda    (enemyRow7Ptr),Y      ; 5
    sta    GRP1                  ; 3
    lda    (qBertRow7Ptr),Y      ; 5
    sta    GRP0                  ; 3
    lda    qBertRow7Ptr          ; 3   $CB > $F0  P0
    sta    qBertLoPtr            ; 3   $CC > $F1
    lda    qBertRow7Ptr+1        ; 3   $DB > $F2  P1
    sta    qbertHiPtr            ; 3   $DC > $F3
    lda    enemyRow7Ptr          ; 3   $ED > $8F  columns 5,6
    sta    enemyLoPtr            ; 3  #$FF > $8E  columns 3,4
    lda    enemyRow7Ptr+1        ; 3  #$FF > $90  column 7
    sta    enemyHiPtr            ; 3
    lda    row7Col_5_6           ; 3
    sta    columns5_6            ; 3
    lda    #$FF                  ; 2
    sta    columns3_4            ; 3   hide columns 3,4
    sta    columns7              ; 3   hide column 7
    jsr    OddNumberRows         ; 6   draw 7th row of cubes
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    L13E8                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Waste12Cycles SUBROUTINE
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

HorizPositionEnemy SUBROUTINE
    sta    HMCLR                 ; 3
    sec                          ; 2
    stx    HMCLR                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SLICE 2
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP0                  ; 3
.divideBy15_Enemy:
    sbc    #15                   ; 2
    bcs    .divideBy15_Enemy     ; 2³
    eor    #$0F                  ; 2   offset the fine postion left/right by 8
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$90                  ; 2
    sta    RESP1_mirror          ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMP1                  ; 3
    dey                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;cube columns 1 and 2 from left

ColorColumns_1_2 SUBROUTINE
    dey                          ; 2
    asl                          ; 2   from register $8E or $8D
    asl                          ; 2
    tax                          ; 2
    bmi    .hideColumns_1_2      ; 2³  coloring the cubes black hides them...
    lda    L1D7F,X               ; 4
    sta    colCubeTop            ; 3
    lda    L1D80,X               ; 4
    sta    colCubeLeft           ; 3
    lda    L1D81,X               ; 4
    sta    colCubeRight          ; 3
    rts                          ; 6

.hideColumns_1_2:
    lda    #BLACK                ; 2
    sta    colCubeTop            ; 3
    sta    colCubeLeft           ; 3
    sta    colCubeRight          ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;cube columns 3 and 4 from left

ColorColumns_3_4 SUBROUTINE
    dey                          ; 2   from register $8F or $8E
    asl                          ; 2
    asl                          ; 2
    tax                          ; 2
    bmi    .hideColumns_3_4      ; 2³
    lda    L1D7F,X               ; 4
    sta    colCubeTop+3          ; 3
    lda    L1D80,X               ; 4
    sta    colCubeLeft+3         ; 3
    lda    L1D81,X               ; 4
    sta    colCubeRight+3        ; 3
    rts                          ; 6

.hideColumns_3_4:
    lda    #BLACK                ; 2
    sta    colCubeTop+3          ; 3
    sta    colCubeLeft+3         ; 3
    sta    colCubeRight+3        ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;cube columns 5 and 6 from left

ColorColumns_5_6 SUBROUTINE
    dey                          ; 2
    asl                          ; 2   from register $90 or $8F
    asl                          ; 2
    tax                          ; 2
    bmi    .hideColumns_5_6      ; 2³
    lda    L1D7F,X               ; 4
    sta    colCubeTop+6          ; 3
    lda    L1D80,X               ; 4
    sta    colCubeLeft+6         ; 3
    lda    L1D81,X               ; 4
    sta    colCubeRight+6        ; 3
    rts                          ; 6

.hideColumns_5_6:
    lda    #BLACK                ; 2
    sta    colCubeTop+6          ; 3
    sta    colCubeLeft+6         ; 3
    sta    colCubeRight+6        ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;because of the checkered diamond shape,
;odd rows display the even numbered columns...

OddNumberRows SUBROUTINE
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (enemyGfxPtr),Y       ; 5
    sta    GRP1                  ; 3
    lda    (qBertGfxPtr),Y       ; 5
    sta    GRP0                  ; 3
    lda    columns3_4            ; 3
    jsr    ColorColumns_1_2      ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (enemyGfxPtr),Y       ; 5
    sta    GRP1                  ; 3
    lda    (qBertGfxPtr),Y       ; 5
    sta    GRP0                  ; 3
    lda    columns5_6            ; 3
    jsr    ColorColumns_3_4      ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (enemyGfxPtr),Y       ; 5
    sta    GRP1                  ; 3
    lda    (qBertGfxPtr),Y       ; 5
    sta    GRP0                  ; 3
    lda    columns7              ; 3
    jsr    ColorColumns_5_6      ; 6
L18A5:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (enemyGfxPtr),Y       ; 5
    tax                          ; 2
    lda    (qBertGfxPtr),Y       ; 5
    dey                          ; 2
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    (enemyGfxPtr),Y       ; 5
    tax                          ; 2
    lda    (qBertGfxPtr),Y       ; 5
    cpy    #$0E                  ; 2
    bne    L18A5                 ; 2³
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    #1                    ; 2
    sta    PF1                   ; 3
    lda    #$81                  ; 2
    sta    PF2                   ; 3
    lda    colCubeTop            ; 3   column 2 top-right
    sta    COLUPF                ; 3
    lda    (enemyGfxPtr),Y       ; 5
    sta    tempFour              ; 3
    lda    (qBertGfxPtr),Y       ; 5
    sta    tempFive              ; 3
    lda    colCubeTop+3          ; 3   column 4 top-right
    sta    COLUPF                ; 3
    ldx    tempFour              ; 3
    lda    colCubeTop+6          ; 3   column 6 top-right
    sta    COLUPF                ; 3
    lda    tempFive              ; 3
    dey                          ; 2
L18E8:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    #3                    ; 2
    sta    PF1                   ; 3
    lda    colCubeTop            ; 3   column 2 top-left
    sta    COLUPF                ; 3
    lda    (qBertGfxPtr),Y       ; 5
    sta    tempFour              ; 3
    lda    #$C1                  ; 2
    sta    PF2                   ; 3
    lda    (enemyGfxPtr),Y       ; 5
    tax                          ; 2
    lda    colCubeTop+3          ; 3   column 4 top-left
    sta    COLUPF                ; 3
    lda    #$83                  ; 2
    sta    PF2                   ; 3
    lda    colCubeTop+6          ; 3
    sta    COLUPF                ; 3   column 6 top-left
    lda    #1                    ; 2
    sta    PF1                   ; 3
    lda    tempFour              ; 3
    dey                          ; 2
    cpy    #$0A                  ; 2
    bne    L18E8                 ; 2³
    jmp    L1946                 ; 3

L191B:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    colCubeRight          ; 3   column 2 right
    sta    COLUPF                ; 3
    lda    #1                    ; 2
    sta    PF2                   ; 3
    lda    tempFour              ; 3   waste
    lda    tempFour              ; 3   waste
    jsr    Waste12Cycles         ;
    lda    #$80                  ; 2
    ldx    colCubeRight+3        ; 3   column 4 right
    stx    COLUPF                ; 3
    ldx    #1                    ; 2
    sta    PF2                   ; 3
    stx    PF1                   ; 3
    lda    colCubeRight+6        ; 3   column 6 right
    sta    COLUPF                ; 3
    lda    (enemyGfxPtr),Y       ; 5
    tax                          ; 2
    lda    (qBertGfxPtr),Y       ; 5
    dey                          ; 2
L1946:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    colCubeLeft           ; 3   column 2 left
    sta    COLUPF                ; 3
    lda    #3                    ; 2
    sta    PF1                   ; 3
    lda    #$C0                  ; 2
    sta    PF2                   ; 3
    lda    (enemyGfxPtr),Y       ; 5
    sta    tempFour              ; 3
    nop                          ; 2
    nop                          ; 2
    lda    colCubeLeft+3         ; 3   column 4 left
    sta    COLUPF                ; 3
    lda    #3                    ; 2
    ldx    colCubeLeft+6         ; 3   column 6 left
    sta    PF2                   ; 3
    stx    COLUPF                ; 3
    ldx    tempFour              ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    (qBertGfxPtr),Y       ; 5
    dey                          ; 2
    bpl    L191B                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$17                  ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;this routnine updates the color and
;orientation for drawing enemy 2

CheckToDrawEnemy2 SUBROUTINE
    cmp    $A6                   ; 3  A = 0,2,4,6,8,10
    bcc    L198E                 ; 2³
    lda    $9E                   ; 3
    and    #$04                  ; 2
    beq    .noReflectEnemy2      ; 2³
    lda    #8                    ; 2
.noReflectEnemy2:
    sta    REFP1                 ; 3
    lda    colEnemy2             ; 3
    sta    COLUP1                ; 3
L198E:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;because of the checkered diamond shape,
;even rows display the odd numbered columns...

EvenNumberRows SUBROUTINE
    lda    (enemyGfxPtr),Y       ; 5
    sta    GRP1                  ; 3
    lda    (qBertGfxPtr),Y       ; 5
    sta    GRP0                  ; 3
    lda    columns1_2            ; 3
    jsr    ColorColumns_1_2      ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (enemyGfxPtr),Y       ; 5
    sta    GRP1                  ; 3
    lda    (qBertGfxPtr),Y       ; 5
    sta    GRP0                  ; 3
    lda    columns3_4            ; 3
    jsr    ColorColumns_3_4      ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (enemyGfxPtr),Y       ; 5
    sta    GRP1                  ; 3
    lda    (qBertGfxPtr),Y       ; 5
    sta    GRP0                  ; 3
    lda    columns5_6            ; 3
    jsr    ColorColumns_5_6      ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (enemyGfxPtr),Y       ; 5
    sta    GRP1                  ; 3
    lda    (qBertGfxPtr),Y       ; 5
    sta    GRP0                  ; 3
    lda    columns7              ; 3
    asl                          ; 2
    asl                          ; 2
    tax                          ; 2
    bpl    .colorColumn_7        ; 2³
    lda    #BLACK                ; 2   hide cube
    sta    colCubeTop+9          ; 3
    sta    colCubeLeft+9         ; 3
    sta    colCubeRight+9        ; 3
    beq    L19E4                 ; 3   always branch

.colorColumn_7:
    lda    L1D7F,X               ; 4
    sta    colCubeTop+9          ; 3   color column 7 top
    lda    L1D80,X               ; 4
    sta    colCubeLeft+9         ; 3   color column 7 left
    lda    L1D81,X               ; 4
    sta    colCubeRight+9        ; 3   color column 7 right
L19E4:
    dey                          ; 2
L19E5:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (enemyGfxPtr),Y       ; 5
    sta    GRP1                  ; 3
    lda    (qBertGfxPtr),Y       ; 5
    dey                          ; 2
    sta    GRP0                  ; 3
    lda    (enemyGfxPtr),Y       ; 5
    tax                          ; 2
    lda    (qBertGfxPtr),Y       ; 5
    cpy    #$0D                  ; 2
    bne    L19E5                 ; 2³
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    #$18                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    colCubeTop            ; 3   column 1 top-right
    sta    COLUPF                ; 3
    lda    (enemyGfxPtr),Y       ; 5
    sta    tempFive              ; 3
    lda    colCubeTop+3          ; 3   column 3 top-right
    sta    tempFour              ; 3
    sta    COLUPF                ; 3
    lda    colCubeTop+6          ; 3   waste
    lda    colCubeTop+6          ; 3   column 5 top-right
    sta    COLUPF                ; 3
    ldx    tempFive              ; 3
    lda    colCubeTop+9          ; 3   column 7 top-right
    nop                          ; 2
    sta    COLUPF                ; 3
    lda    (qBertGfxPtr),Y       ; 5
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    ldx    #$38                  ; 2
    stx    PF1                   ; 3
    lda    colCubeTop            ; 3   column 1 top-left
    sta    COLUPF                ; 3
    lda    (enemyGfxPtr),Y       ; 5
    sta    tempFive              ; 3
    lda    colCubeTop+3          ; 3   column 3 top-left
    ldx    #$1C                  ; 2
    stx    PF2                   ; 3
    nop                          ; 2
    sta    COLUPF                ; 3
    ldx    #$38                  ; 2
    lda    colCubeTop+6          ; 3   column 5 top-left
    sta    COLUPF                ; 3
    stx    PF2                   ; 3
    ldx    #$1C                  ; 2
    lda    colCubeTop+9          ; 3   column 7 top-left
    sta    COLUPF                ; 3
    stx    PF1                   ; 3
    lda    (qBertGfxPtr),Y       ; 5
    ldx    tempFive              ; 3
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    ldx    #$38                  ; 2
    stx    PF1                   ; 3
    lda    colCubeTop            ; 3   column 1 top-underneath
    sta    COLUPF                ; 3
    lda    (enemyGfxPtr),Y       ; 5
    sta    tempFive              ; 3
    lda    colCubeTop+3          ; 3   column 3 top-underneath
    ldx    #$1C                  ; 2
    stx    PF2                   ; 3
    nop                          ; 2
    sta    COLUPF                ; 3
    ldx    #$38                  ; 2
    lda    colCubeTop+6          ; 3   column 5 top-underneath
    sta    COLUPF                ; 3
    stx    PF2                   ; 3
    ldx    #$1C                  ; 2
    lda    colCubeTop+9          ; 3   column 7 top-underneath
    sta    COLUPF                ; 3
    stx    PF1                   ; 3
    lda    (qBertGfxPtr),Y       ; 5
    ldx    tempFive              ; 3
    dey                          ; 2
    jmp    L1AB6                 ; 3

L1A87:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    #8                    ; 2
    sta    PF1                   ; 3
    lda    colCubeRight          ; 3   column 1 right
    sta    COLUPF                ; 3
    ldx    #$10                  ; 2
    stx    PF2                   ; 3
    lda    (enemyGfxPtr),Y       ; 5
    sta    tempFive              ; 3
    nop                          ; 2
    lda    colCubeRight+3        ; 3   column 3 right
    sta    COLUPF                ; 3
    nop                          ; 2
    lda    #8                    ; 2
    sta    PF2                   ; 3
    lda    colCubeRight+6        ; 3   column 5 right
    sta    COLUPF                ; 3
    stx    PF1                   ; 3
    lda    colCubeRight+9        ; 3   column 7 right
    sta    COLUPF                ; 3
    ldx    tempFive              ; 3
    lda    (qBertGfxPtr),Y       ; 5
    dey                          ; 2
L1AB6:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    ldx    #$30                  ; 2
    stx    PF1                   ; 3
    lda    colCubeLeft           ; 3   column 1 left
    sta    COLUPF                ; 3
    lda    (enemyGfxPtr),Y       ; 5
    sta    tempFive              ; 3
    lda    #$0C                  ; 2
    sta    PF2                   ; 3
    lda    colCubeLeft+3         ; 3   column 3 left
    sta    COLUPF                ; 3
    lda    tempFive              ; 3
    lda    colCubeLeft+6         ; 3   column 5 left
    sta    COLUPF                ; 3
    stx    PF2                   ; 3
    lda    #$0C                  ; 2
    sta    PF1                   ; 3
    lda    colCubeLeft+9         ; 3   column 7 left
    sta    COLUPF                ; 3
    ldx    tempFive              ; 3
    lda    (qBertGfxPtr),Y       ; 5
    dey                          ; 2
    bpl    L1A87                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1AE8:
    .byte $94 ; |X  X X  | $1AE8
L1AE9:
    .byte $24 ; |  X  X  | $1AE9
    .byte $3A ; |  XXX X | $1AEA
    .byte $3D ; |  XXXX X| $1AEB
    .byte $3A ; |  XXX X | $1AEC
    .byte $1D ; |   XXX X| $1AED
    .byte $3D ; |  XXXX X| $1AEE
    .byte $3F ; |  XXXXXX| $1AEF
    .byte $3D ; |  XXXX X| $1AF0
    .byte $37 ; |  XX XXX| $1AF1
    .byte $3A ; |  XXX X | $1AF2
    .byte $37 ; |  XX XXX| $1AF3
    .byte $1A ; |   XX X | $1AF4
    .byte $3B ; |  XXX XX| $1AF5
    .byte $3A ; |  XXX X | $1AF6
    .byte $36 ; |  XX XX | $1AF7
    .byte $3A ; |  XXX X | $1AF8
    .byte $36 ; |  XX XX | $1AF9
    .byte $11 ; |   X   X| $1AFA
    .byte $11 ; |   X   X| $1AFB
    .byte $D6 ; |XX X XX | $1AFC
    .byte $D7 ; |XX X XXX| $1AFD
    .byte $D8 ; |XX XX   | $1AFE
    .byte $D9 ; |XX XX  X| $1AFF
    .byte $DA ; |XX XX X | $1B00
    .byte $DB ; |XX XX XX| $1B01
    .byte $DC ; |XX XXX  | $1B02
    .byte $DD ; |XX XXX X| $1B03
    .byte $DC ; |XX XXX  | $1B04
    .byte $DB ; |XX XX XX| $1B05
    .byte $DA ; |XX XX X | $1B06
    .byte $D9 ; |XX XX  X| $1B07
    .byte $D8 ; |XX XX   | $1B08
    .byte $D7 ; |XX X XXX| $1B09
    .byte $D6 ; |XX X XX | $1B0A
    .byte $00 ; |        | $1B0B
    .byte $24 ; |  X  X  | $1B0C
    .byte $30 ; |  XX    | $1B0D
    .byte $31 ; |  XX   X| $1B0E
    .byte $30 ; |  XX    | $1B0F
    .byte $11 ; |   X   X| $1B10
    .byte $31 ; |  XX   X| $1B11
    .byte $32 ; |  XX  X | $1B12
    .byte $31 ; |  XX   X| $1B13
    .byte $2E ; |  X XXX | $1B14
    .byte $30 ; |  XX    | $1B15
    .byte $2C ; |  X XX  | $1B16
    .byte $0F ; |    XXXX| $1B17
    .byte $30 ; |  XX    | $1B18
    .byte $2F ; |  X XXXX| $1B19
    .byte $2C ; |  X XX  | $1B1A
    .byte $2D ; |  X XX X| $1B1B
    .byte $2C ; |  X XX  | $1B1C
    .byte $0A ; |    X X | $1B1D
    .byte $08 ; |    X   | $1B1E
    .byte $2E ; |  X XXX | $1B1F
    .byte $30 ; |  XX    | $1B20
    .byte $31 ; |  XX   X| $1B21
    .byte $30 ; |  XX    | $1B22
    .byte $2E ; |  X XXX | $1B23
    .byte $00 ; |        | $1B24
    .byte $54 ; | X X X  | $1B25
    .byte $FD ; |XXXXXX X| $1B26
    .byte $F4 ; |XXXX X  | $1B27
    .byte $FA ; |XXXXX X | $1B28
    .byte $F1 ; |XXXX   X| $1B29
    .byte $F7 ; |XXXX XXX| $1B2A
    .byte $EF ; |XXX XXXX| $1B2B
    .byte $F3 ; |XXXX  XX| $1B2C
    .byte $E9 ; |XXX X  X| $1B2D
    .byte $FD ; |XXXXXX X| $1B2E
    .byte $F4 ; |XXXX X  | $1B2F
    .byte $FA ; |XXXXX X | $1B30
    .byte $71 ; | XXX   X| $1B31
    .byte $77 ; | XXX XXX| $1B32
    .byte $6F ; | XX XXXX| $1B33
    .byte $73 ; | XXX  XX| $1B34
    .byte $69 ; | XX X  X| $1B35
    .byte $7D ; | XXXXX X| $1B36
    .byte $74 ; | XXX X  | $1B37
    .byte $3A ; |  XXX X | $1B38
    .byte $31 ; |  XX   X| $1B39
    .byte $37 ; |  XX XXX| $1B3A
    .byte $2F ; |  X XXXX| $1B3B
    .byte $33 ; |  XX  XX| $1B3C
    .byte $29 ; |  X X  X| $1B3D
    .byte $BD ; |X XXXX X| $1B3E
    .byte $B4 ; |X XX X  | $1B3F
    .byte $BA ; |X XXX X | $1B40
    .byte $B1 ; |X XX   X| $1B41
    .byte $B7 ; |X XX XXX| $1B42
    .byte $AF ; |X X XXXX| $1B43
    .byte $B3 ; |X XX  XX| $1B44
    .byte $A9 ; |X X X  X| $1B45
    .byte $BD ; |X XXXX X| $1B46
    .byte $B4 ; |X XX X  | $1B47
    .byte $BA ; |X XXX X | $1B48
    .byte $B1 ; |X XX   X| $1B49
    .byte $B7 ; |X XX XXX| $1B4A
    .byte $AF ; |X X XXXX| $1B4B
    .byte $B3 ; |X XX  XX| $1B4C
    .byte $A9 ; |X X X  X| $1B4D
    .byte $B3 ; |X XX  XX| $1B4E
    .byte $AA ; |X X X X | $1B4F
    .byte $B6 ; |X XX XX | $1B50
    .byte $AB ; |X X X XX| $1B51
    .byte $B7 ; |X XX XXX| $1B52
    .byte $AC ; |X X XX  | $1B53
    .byte $BA ; |X XXX X | $1B54
    .byte $AD ; |X X XX X| $1B55
    .byte $BB ; |X XXX XX| $1B56
    .byte $AE ; |X X XXX | $1B57
    .byte $BD ; |X XXXX X| $1B58
    .byte $AF ; |X X XXXX| $1B59
    .byte $BF ; |X XXXXXX| $1B5A
    .byte $B1 ; |X XX   X| $1B5B
    .byte $B5 ; |X XX X X| $1B5C
    .byte $B3 ; |X XX  XX| $1B5D
    .byte $B8 ; |X XXX   | $1B5E
    .byte $B5 ; |X XX X X| $1B5F
    .byte $BB ; |X XXX XX| $1B60
    .byte $B8 ; |X XXX   | $1B61
    .byte $BF ; |X XXXXXX| $1B62
    .byte $00 ; |        | $1B63
    .byte $8C ; |X   XX  | $1B64
    .byte $82 ; |X     X | $1B65
    .byte $5F ; | X XXXXX| $1B66
    .byte $5E ; | X XXXX | $1B67
    .byte $5C ; | X XXX  | $1B68
    .byte $00 ; |        | $1B69
    .byte $44 ; | X   X  | $1B6A
    .byte $43 ; | X    XX| $1B6B
    .byte $41 ; | X     X| $1B6C
    .byte $DF ; |XX XXXXX| $1B6D
    .byte $00 ; |        | $1B6E
    .byte $8A ; |X   X X | $1B6F
    .byte $AC ; |X X XX  | $1B70
    .byte $45 ; | X   X X| $1B71
    .byte $4B ; | X  X XX| $1B72
    .byte $00 ; |        | $1B73
    .byte $58 ; | X XX   | $1B74
    .byte $E0 ; |XXX     | $1B75
    .byte $35 ; |  XX X X| $1B76
    .byte $21 ; |  X    X| $1B77
    .byte $1F ; |   XXXXX| $1B78
    .byte $00 ; |        | $1B79
    .byte $1C ; |   XXX  | $1B7A
    .byte $46 ; | X   XX | $1B7B
    .byte $F0 ; |XXXX    | $1B7C
    .byte $F0 ; |XXXX    | $1B7D
    .byte $F0 ; |XXXX    | $1B7E
    .byte $00 ; |        | $1B7F
    .byte $18 ; |   XX   | $1B80
    .byte $4F ; | X  XXXX| $1B81
    .byte $41 ; | X     X| $1B82
    .byte $55 ; | X X X X| $1B83
    .byte $42 ; | X    X | $1B84
    .byte $5A ; | X XX X | $1B85
    .byte $43 ; | X    XX| $1B86
    .byte $5F ; | X XXXXX| $1B87
    .byte $55 ; | X X X X| $1B88
    .byte $F0 ; |XXXX    | $1B89
    .byte $F0 ; |XXXX    | $1B8A
    .byte $00 ; |        | $1B8B
    .byte $01 ; |       X| $1B8C
    .byte $C9 ; |XX  X  X| $1B8D
    .byte $C8 ; |XX  X   | $1B8E
    .byte $C7 ; |XX   XXX| $1B8F
    .byte $46 ; | X   XX | $1B90
    .byte $45 ; | X   X X| $1B91
    .byte $44 ; | X   X  | $1B92
    .byte $00 ; |        | $1B93
    .byte $0C ; |    XX  | $1B94
    .byte $C0 ; |XX      | $1B95
    .byte $5E ; | X XXXX | $1B96
    .byte $5A ; | X XX X | $1B97
    .byte $57 ; | X X XXX| $1B98
    .byte $49 ; | X  X  X| $1B99
    .byte $47 ; | X   XXX| $1B9A
    .byte $00 ; |        | $1B9B
    .byte $9C ; |X  XXX  | $1B9C
    .byte $BD ; |X XXXX X| $1B9D
    .byte $AF ; |X X XXXX| $1B9E
    .byte $BF ; |X XXXXXX| $1B9F
    .byte $AF ; |X X XXXX| $1BA0
    .byte $A7 ; |X X  XXX| $1BL1
    .byte $A3 ; |X X   XX| $1BA2
    .byte $A0 ; |X X     | $1BA3
    .byte $00 ; |        | $1BA4
    .byte $0C ; |    XX  | $1BA5
    .byte $C0 ; |XX      | $1BA6
    .byte $BF ; |X XXXXXX| $1BA7
    .byte $AF ; |X X XXXX| $1BA8
    .byte $DF ; |XX XXXXX| $1BA9
    .byte $AF ; |X X XXXX| $1BAA
    .byte $A7 ; |X X  XXX| $1BAB
    .byte $A3 ; |X X   XX| $1BAC
    .byte $C1 ; |XX     X| $1BAD
    .byte $00 ; |        | $1BAE
    .byte $21 ; |  X    X| $1BAF
    .byte $6F ; | XX XXXX| $1BB0
    .byte $10 ; |   X    | $1BB1
    .byte $11 ; |   X   X| $1BB2
    .byte $92 ; |X  X  X | $1BB3
    .byte $93 ; |X  X  XX| $1BB4
    .byte $14 ; |   X X  | $1BB5
    .byte $00 ; |        | $1BB6
    .byte $94 ; |X  X X  | $1BB7
    .byte $C7 ; |XX   XXX| $1BB8
    .byte $6E ; | XX XXX | $1BB9
    .byte $8F ; |X   XXXX| $1BBA
    .byte $90 ; |X  X    | $1BBB
    .byte $91 ; |X  X   X| $1BBC
    .byte $92 ; |X  X  X | $1BBD
    .byte $73 ; | XXX  XX| $1BBE
    .byte $74 ; | XXX X  | $1BBF
    .byte $00 ; |        | $1BC0
    .byte $11 ; |   X   X| $1BC1
    .byte $D7 ; |XX X XXX| $1BC2
    .byte $D8 ; |XX XX   | $1BC3
    .byte $D9 ; |XX XX  X| $1BC4
    .byte $CC ; |XX  XX  | $1BC5
    .byte $CB ; |XX  X XX| $1BC6
    .byte $CA ; |XX  X X | $1BC7
    .byte $D2 ; |XX X  X | $1BC8
    .byte $D3 ; |XX X  XX| $1BC9
    .byte $D4 ; |XX X X  | $1BCA
    .byte $C6 ; |XX   XX | $1BCB
    .byte $CE ; |XX  XXX | $1BCC
    .byte $CC ; |XX  XX  | $1BCD
    .byte $CB ; |XX  X XX| $1BCE
    .byte $DF ; |XX XXXXX| $1BCF
    .byte $00 ; |        | $1BD0
    .byte $03 ; |      XX| $1BD1
    .byte $C0 ; |XX      | $1BD2
    .byte $F1 ; |XXXX   X| $1BD3
    .byte $55 ; | X X X X| $1BD4
    .byte $C1 ; |XX     X| $1BD5
    .byte $42 ; | X    X | $1BD6
    .byte $46 ; | X   XX | $1BD7
    .byte $43 ; | X    XX| $1BD8
    .byte $00 ; |        | $1BD9
    .byte $51 ; | X X   X| $1BDA
    .byte $2A ; |  X X X | $1BDB
    .byte $6D ; | XX XX X| $1BDC
    .byte $00 ; |        | $1BDD
    .byte $5F ; | X XXXXX| $1BDE
    .byte $C1 ; |XX     X| $1BDF
    .byte $C2 ; |XX    X | $1BE0
    .byte $C4 ; |XX   X  | $1BE1
    .byte $C6 ; |XX   XX | $1BE2
    .byte $C0 ; |XX      | $1BE3
    .byte $C7 ; |XX   XXX| $1BE4
    .byte $C3 ; |XX    XX| $1BE5
    .byte $A8 ; |X X X   | $1BE6
    .byte $00 ; |        | $1BE7
    .byte $C3 ; |XX    XX| $1BE8
    .byte $A8 ; |X X X   | $1BE9
    .byte $00 ; |        | $1BEA

;$1BEA - $1BFF
    .byte $A5,$5A,$A5,$5A,$A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SLICE 3
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ORG $1C00
       RORG $3000

L3000:
    lda    SWCHB                 ; 4   test color/BW switch to pause or unpause game
    and    #$08                  ; 2
    bne    .pauseTheGame         ; 2³  - pause
    jmp    FinishOverscan        ; 3   - unpause

.pauseTheGame:
    txa                          ; 2
    pha                          ; 3
    lda    IndirectPtrsTab,Y     ; 4   get the low nibble for an indirect jump
    pha                          ; 3
    rts                          ; 6   do the indirect jump

L3011:
    jsr    L1EA8                 ; 6
    lda    #5                    ; 2
    sta    numOfLives            ; 3
    ldx    #0                    ; 2  when reset is hit, clear the score
    stx    scoreBCD              ; 3  first 2 digits from left
    stx    scoreBCD+1            ; 3  3rd, 4th digits from left
    stx    scoreBCD+2            ; 3  5th, 6th digits from left
L3020:
    jmp    L32CB                 ; 3

L3023:
    ldx    #1                    ; 2
    stx    framecounter          ; 3
    dex                          ; 2
    stx    $9B                   ; 3   X=0
    beq    L3020                 ; 3   always branch

L302C:
    jmp    FinishOverscan        ; 3

L302F:
    lda    $9C                   ; 3
    and    #$09                  ; 2   check bits 7,4
    bne    L305D                 ; 2³
L3035:
    lda    SWCHA                 ; 4   check left joystick
    cmp    #$F0                  ; 2
    bcs    L305D                 ; 2³  branch if no direction pressed
    and    #$F0                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2

;mathematically possible combinations
;  00 0000 00 = $00   X=0   right,left,down,up
;  00 0001 00 = $04   X=4   right,left,down
;  00 0010 00 = $08   X=8   right,left,up
;  00 0011 00 = $0C   X=12  right,left
;  00 0100 00 = $10   X=16  right,down,up
;  00 0101 00 = $14   X=20  right,down
;  00 0110 00 = $18   X=24  right,up
;  00 0111 00 = $1C   X=28  right
;  00 1000 00 = $20   X=32  left,down,up
;  00 1001 00 = $24   X=36  left,down
;  00 1010 00 = $28   X=40  left,up
;  00 1011 00 = $2C   X=44  left
;  00 1100 00 = $30   X=48  up,down
;  00 1101 00 = $34   X=52  down
;  00 1110 00 = $38   X=56  up


    lda    $9C                   ; 3
    and    #$F0                  ; 2
    ora    L1DAA,X               ; 4
    sta    $9C                   ; 3
    ldy    #0                    ; 2
    tya                          ; 2
    jsr    L3AAA                 ; 6
    bit    $9B                   ; 3
    bvs    L302C                 ; 2³
    ldy    #0                    ; 2
    jsr    L1F0A                 ; 6
    iny                          ; 2
    jmp    L30A9                 ; 3

L305D:
    lda    $A8                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L1FA6,Y               ; 4
    tay                          ; 2
    lda    #0                    ; 2
    sta    $86                   ; 3
    sta    $87                   ; 3
    ldx    #$12                  ; 2
L306E:
    lda    L1D05,X               ; 4
    and    $B0                   ; 3
    cmp    L1D05,X               ; 4
    bne    L30A3                 ; 2³
    lda    L1D06,X               ; 4
    and    $B1                   ; 3
    cmp    L1D06,X               ; 4
    bne    L30A3                 ; 2³
    ora    $87                   ; 3
    sta    $87                   ; 3
    lda    L1D05,X               ; 4
    ora    $86                   ; 3
    sta    $86                   ; 3
    dey                          ; 2
    bpl    L30A3                 ; 2³
    inc    $82                   ; 5
    sta    $B2                   ; 3
    lda    $87                   ; 3
    sta    $B3                   ; 3
    ldx    #0                    ; 2
    jsr    L1ED2                 ; 6
    jmp    FinishOverscan        ; 3


    jmp    L30A7                 ; 3

L30A3:
    dex                          ; 2
    dex                          ; 2
    bpl    L306E                 ; 2³
L30A7:
    ldy    #3                    ; 2
L30A9:
    dey                          ; 2
    bpl    L30AF                 ; 2³
    jmp    FinishOverscan        ; 3

L30AF:
    lda    framecounter          ; 3
    and    #$03                  ; 2
    sta    $F0                   ; 3
    cpy    $F0                   ; 3
    bne    L30A9                 ; 2³
    tya                          ; 2
    jsr    L3B57                 ; 6
    lda.wy $A5,Y                 ; 4
    bpl    L30C5                 ; 2³
    jmp    L3158                 ; 3

L30C5:
    lda.wy $9C,Y                 ; 4
    and    #$08                  ; 2
    beq    L30F3                 ; 2³
    lda.wy $9F,Y                 ; 4
    cmp    #$FC                  ; 2
    bne    L30EE                 ; 2³
    lda.wy $A2,Y                 ; 4
    bne    L30E4                 ; 2³
    ldx    $89                   ; 3
    sta    $BD,X                 ; 4
    lda    #$FF                  ; 2
    sta.wy $A5,Y                 ; 5
    jmp    L3158                 ; 3

L30E4:
    lda    framecounter          ; 3
    and    #$01                  ; 2
    clc                          ; 2
    adc    #$FE                  ; 2
    jmp    L3182                 ; 3

L30EE:
    lda    #$FA                  ; 2
    jmp    L3182                 ; 3

L30F3:
    cpy    #0                    ; 2
    beq    L30FB                 ; 2³
    lda    $9B                   ; 3
    bmi    L30A9                 ; 2³
L30FB:
    lda    #$FF                  ; 2
    clc                          ; 2
    adc.wy $9F,Y                 ; 4
    bmi    L3108                 ; 2³
    sta.wy $9F,Y                 ; 5
    bpl    L317B                 ; 3   always branch

L3108:
    cmp    #$FF                  ; 2
    bne    L30A9                 ; 2³
    sta.wy $9F,Y                 ; 5
    ldx    $F4                   ; 3
    jsr    L37EA                 ; 6
    lda.wy $9C,Y                 ; 4
    and    #$04                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    $F4                   ; 3
    tax                          ; 2
    lda    L1CAF,X               ; 4
    sta    $85                   ; 3
    ldx    $88                   ; 3
    lda.wy $9C,Y                 ; 4
    and    #$04                  ; 2
    beq    L3135                 ; 2³
    lda    hPosition,X           ; 4
    cmp    $85                   ; 3
    bcs    L3161                 ; 2³
    bcc    L313B                 ; 3   always branch

L3135:
    lda    hPosition,X           ; 4
    cmp    $85                   ; 3
    bcc    L3161                 ; 2³
L313B:
    tya                          ; 2
    bne    L3147                 ; 2³
    lda    #4                    ; 2
    jsr    L1F35                 ; 6
    ldx    #$87                  ; 2
    bne    L3152                 ; 3   always branch

L3147:
    ldx    #$7C                  ; 2
    lda.wy $9C,Y                 ; 4
    cmp    #$20                  ; 2
    bcs    L3152                 ; 2³
    ldx    #$A4                  ; 2
L3152:
    jsr    L1ED2                 ; 6
    jmp    L315B                 ; 3

L3158:
    jsr    L37C1                 ; 6
L315B:
    jmp    L30A9                 ; 3


    jmp    FinishOverscan        ; 3

L3161:
    lda    #8                    ; 2
    ora.wy $9C,Y                 ; 4
    sta.wy $9C,Y                 ; 5
    and    #$F0                  ; 2
    beq    L3171                 ; 2³
    cmp    #$50                  ; 2
    bne    L315B                 ; 2³
L3171:
    ldx    #$CF                  ; 2
    jsr    L1ED2                 ; 6
    jmp    L30A9                 ; 3


    bne    L315B                 ; 2³
L317B:
    lda.wy $9F,Y                 ; 4
    tax                          ; 2
    jsr    L3891                 ; 6
L3182:
    clc                          ; 2
    adc.wy $A2,Y                 ; 4
    sta.wy $A2,Y                 ; 5
    ldx    $89                   ; 3
    lda    $87                   ; 3
    jsr    L1F8E                 ; 6
    lda    #0                    ; 2
    sta    $BD,X                 ; 4
    cpx    #0                    ; 2
    beq    L31A7                 ; 2³
    cpx    #$10                  ; 2
    beq    L31A7                 ; 2³
    dex                          ; 2
    dex                          ; 2
    sta    $BD,X                 ; 4
    lda    $87                   ; 3
    jsr    L1F8E                 ; 6
    inx                          ; 2
    inx                          ; 2
L31A7:
    cpx    #$0E                  ; 2
    beq    L31BB                 ; 2³
    cpx    #$1E                  ; 2
    beq    L31BB                 ; 2³
    inx                          ; 2
    inx                          ; 2
    lda.wy $A2,Y                 ; 4
    bpl    L31BB                 ; 2³
    lda    $87                   ; 3
    jsr    L1F8E                 ; 6
L31BB:
    ldx    $F4                   ; 3
    lda.wy $A2,Y                 ; 4
    bmi    L31DE                 ; 2³
    cmp    #$18                  ; 2
    bcc    L31DB                 ; 2³
    dex                          ; 2
    dex                          ; 2
    bmi    L31DB                 ; 2³
    dec    $89                   ; 5
    dec    $89                   ; 5
    pha                          ; 3
    txa                          ; 2
    sta.wy $A5,Y                 ; 5
    sta    $F4                   ; 3
    pla                          ; 4
    sbc    #$17                  ; 2
    sta.wy $A2,Y                 ; 5
L31DB:
    jmp    L324A                 ; 3

L31DE:
    inx                          ; 2
    inx                          ; 2
    cpx    #$0F                  ; 2
    bcc    L322C                 ; 2³
    dex                          ; 2
    dex                          ; 2
    lda    #1                    ; 2
    sbc.w  $8C                   ; 4
    cmp.wy $A2,Y                 ; 4
    bcc    L3207                 ; 2³
    tya                          ; 2
    bne    L3200                 ; 2³
    lda    #$10                  ; 2
    ora    $9B                   ; 3
    sta    $9B                   ; 3
    lda    #$0B                  ; 2
    sta    $82                   ; 3
L31FD:
    jmp    L32C8                 ; 3

L3200:
    lda    #$FF                  ; 2
    sta.wy $A5,Y                 ; 5
    bne    L31FD                 ; 3   always branch

L3207:
    lda    #0                    ; 2
    sec                          ; 2
    sbc.wy $A2,Y                 ; 4
    ldx    $89                   ; 3
    clc                          ; 2
    adc.w  $8B                   ; 4
    sta    $BD,X                 ; 4
    sec                          ; 2
    sbc.w  $8B                   ; 4
    clc                          ; 2
    adc    #$17                  ; 2
    cmp.w  $8C                   ; 4
    bcs    L3229                 ; 2³
    lda    $BD,X                 ; 4
    adc    #$17                  ; 2
    dex                          ; 2
    dex                          ; 2
    sta    $BD,X                 ; 4
L3229:
    jmp    L32C8                 ; 3

L322C:
    clc                          ; 2
    adc    #$18                  ; 2
    stx    $F4                   ; 3
    inc    $89                   ; 5
    inc    $89                   ; 5
    sta.wy $A2,Y                 ; 5
    ldx    $88                   ; 3
    lda    hPosition,X           ; 4
    pha                          ; 3
    lda    $89                   ; 3
    lsr                          ; 2
    tax                          ; 2
    lda    L1C76,X               ; 4
    and    #$07                  ; 2
    tax                          ; 2
    pla                          ; 4
    sta    hPosition,X           ; 4
L324A:
    lda    $F4                   ; 3
    sta.wy $A5,Y                 ; 5
    lda.wy $9F,Y                 ; 4
    tax                          ; 2
    jsr    L3853                 ; 6
    sta    $86                   ; 3
    lda    $89                   ; 3
    lsr                          ; 2
    tax                          ; 2
    lda    L1C76,X               ; 4
    and    #$07                  ; 2
    tax                          ; 2
    lda.wy $9C,Y                 ; 4
    and    #$08                  ; 2
    bne    L3275                 ; 2³
    lda.wy $9F,Y                 ; 4
    bmi    L3275                 ; 2³
    lda    $86                   ; 3
    clc                          ; 2
    adc    hPosition,X           ; 4
    sta    hPosition,X           ; 4
L3275:
    lda    hPosition,X           ; 4
    sta    $86                   ; 3
    ldx    $89                   ; 3
    lda.w  $8B                   ; 4
    sec                          ; 2
    sbc.wy $A2,Y                 ; 4
    sta    $BD,X                 ; 4
    cpx    #0                    ; 2
    beq    L32C8                 ; 2³
    cpx    #$10                  ; 2
    beq    L32C8                 ; 2³
    dex                          ; 2
    dex                          ; 2
    stx    $87                   ; 3
    jsr    L1FBA                 ; 6
    ldx    $87                   ; 3
    cpx    #0                    ; 2
    beq    L32B4                 ; 2³
    cpx    #$10                  ; 2
    beq    L32B4                 ; 2³
    lda.wy $9C,Y                 ; 4
    and    #$F0                  ; 2
    cmp    #$10                  ; 2
    bne    L32B4                 ; 2³
    dex                          ; 2
    dex                          ; 2
    lda    #0                    ; 2
    sta    $BD,X                 ; 4
    lda    #$10                  ; 2
    jsr    L1F8E                 ; 6
    jsr    L1FBA                 ; 6
L32B4:
    ldx    $87                   ; 3
    lda    #$17                  ; 2
    sec                          ; 2
    sbc.wy $A2,Y                 ; 4
    cmp.w  $8C                   ; 4
    bcs    L32C8                 ; 2³
    lda    $BF,X                 ; 4   qBertRow1Ptr
    clc                          ; 2
    adc    #$17                  ; 2
    sta    $BD,X                 ; 4
L32C8:
    jmp    L30A9                 ; 3

L32CB:
    inc    $82                   ; 5
    
FinishOverscan:
.loopWaitOverscanEnd:
    lda    INTIM                 ; 4
    bpl    .loopWaitOverscanEnd  ; 2³
    
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3   Vsync starts
    lda    #VSYNC_TIME           ; 2   192 clocks, a wsync follows before vsync ends...
    sta    TIM8T                 ; 4
    ldx    $84                   ; 3
    ldy    $83                   ; 3
    rol    $83                   ; 5
    rol    $84                   ; 5
    lda    $83                   ; 3
    adc    #$C3                  ; 2
    sty    $83                   ; 3
    eor    $83                   ; 3
    sta    $83                   ; 3
    txa                          ; 2
    eor    $84                   ; 3
    sta    $84                   ; 3
    lda    framecounter          ; 3
    bne    L32FE                 ; 2³
    lda    #$20                  ; 2
    ora    $9B                   ; 3
    sta    $9B                   ; 3
L32FE:
    lda    framecounter          ; 3
    and    #$1F                  ; 2
    bne    L330C                 ; 2³
    dec    $84                   ; 5
    dec    $EE                   ; 5
    bpl    L330C                 ; 2³
    inc    $EE                   ; 5
L330C:
    inc    framecounter          ; 5
    lda    framecounter          ; 3
    and    #$03                  ; 2
    cmp    #3                    ; 2
    bne    L3324                 ; 2³
    inc    framecounter          ; 5
    inc    thirdFrameCounter     ; 5
    bne    L3324                 ; 2³
    lda    #$77                  ; 2
    and    $9B                   ; 3
    sta    $9B                   ; 3
    inc    $83                   ; 5
L3324:
    lda    SWCHB                 ; 4
    lsr                          ; 2   test reset switch
    bcs    .noReset              ; 2³  - no reset
    lda    #1                    ; 2   -yes, reset
    sta    $82                   ; 3
    lda    #$40                  ; 2
    sta    $9B                   ; 3
    ldx    #$FF                  ; 2
    bit    SWCHB                 ; 4   test left difficulty switch
    bvs    .proSetting           ; 2³  - pro
    ldx    #$13                  ; 2   - amateur
.proSetting:
    stx    $A8                   ; 3   #$FF pro, #$13 amateur
.noReset:
    inc    $9B                   ; 5
    lda    $9B                   ; 3
    and    #$07                  ; 2
    cmp    #6                    ; 2
    bcc    FinishVsync           ; 2³
    lda    #$F8                  ; 2
    and    $9B                   ; 3
    sta    $9B                   ; 3
FinishVsync:
.loopWaitVsyncEnd:
    lda    INTIM                 ; 4
    bne    .loopWaitVsyncEnd     ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3   Vsync ends
    jmp    L369F                 ; 3

L3359:
    lda    #$0F                  ; 2
    and    numOfLives            ; 3
    ora    #$50                  ; 2
    sta    numOfLives            ; 3
    lda    #0                    ; 2
    sta    $B0                   ; 3
    sta    $B1                   ; 3
    lda    #$C0                  ; 2
    sta    $B4                   ; 3
    jsr    L1EA8                 ; 6
    jsr    L1F9B                 ; 6
    sta    $DD                   ; 3
    jmp    L33D1                 ; 3  jump to a jump (L32CB)

L3376:
    dec    $B4                   ; 5
    beq    L3391                 ; 2³
    lda    framecounter          ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    jsr    L1F9B                 ; 6
    sta    $DE,X                 ; 4
    lda    thirdFrameCounter     ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    jsr    L1F9B                 ; 6
    sta    $DE,X                 ; 4
    jmp    FinishOverscan        ; 3

L3391:
    bit    $9B                   ; 3
    bvc    L33A3                 ; 2³
    lda    #$BF                  ; 2
    and    $9B                   ; 3
    sta    $9B                   ; 3
    ldx    #0                    ; 2
    jsr    L1ED2                 ; 6
    jmp    L33BC                 ; 3

L33A3:
    lda    $A8                   ; 3
    and    #$03                  ; 2
    cmp    #3                    ; 2
    bne    L33BC                 ; 2³
    lda    #$40                  ; 2
    ora    $9B                   ; 3
    sta    $9B                   ; 3
    lda    #$70                  ; 2
    sta    $EE                   ; 3
    lda    #$0D                  ; 2
L33B7:
    sta    $82                   ; 3
    jmp    FinishOverscan        ; 3

L33BC:
    inc    $A8                   ; 5
    lda    $A8                   ; 3
    cmp    #$28                  ; 2
    bcc    L33C9                 ; 2³
    sec                          ; 2
    sbc    #$0C                  ; 2
    sta    $A8                   ; 3
L33C9:
    lda    #6                    ; 2
    sta    $B4                   ; 3
    lda    #0                    ; 2
    sta    $B5                   ; 3
L33D1:
    jmp    L32CB                 ; 3

L33D4:
    lda    $B2                   ; 3
    ora    $B3                   ; 3
    bne    L340E                 ; 2³
    lda    INPT4_mirror          ; 3
    bpl    L3411                 ; 2³
    dec    $B4                   ; 5
    bmi    L3411                 ; 2³
    lda    $B4                   ; 3
    asl                          ; 2
    tax                          ; 2
    lda    $A8                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L1FA6,Y               ; 4
    tay                          ; 2
L33EF:
    lda    L1D05,X               ; 4
    ora    $B2                   ; 3
    sta    $B2                   ; 3
    lda    L1D06,X               ; 4
    ora    $B3                   ; 3
    sta    $B3                   ; 3
    inx                          ; 2
    inx                          ; 2  $1FFE
    cpx    #$14                  ; 2  $1FFF, $2000... cpx's operand belongs in the other bank

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SLICE 4
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    bcc    L3407                 ; 2³
    txa                          ; 2
    sbc    #$14                  ; 2
    tax                          ; 2
L3407:
    dey                          ; 2
    bpl    L33EF                 ; 2³
    lda    #$0A                  ; 2
    sta    $B5                   ; 3
L340E:
    jmp    FinishOverscan        ; 3

L3411:
    ldx    #0                    ; 2
    ldy    #$10                  ; 2
L3415:
    lda.wy $DD,Y                 ; 4
    and    #$1F                  ; 2
    sta.wy $DD,Y                 ; 5
    cmp    $DD                   ; 3
    bne    L3429                 ; 2³
    lda    L1C12,X               ; 4
    sta.wy $DD,Y                 ; 5
    inx                          ; 2
    iny                          ; 2
L3429:
    dey                          ; 2
    bne    L3415                 ; 2³
    beq    L33D1                 ; 3   always branch, to a jump (L32CB)

L342E:
    lda    $A8                   ; 3
    and    #$02                  ; 2
    beq    L3439                 ; 2³
    inc    $82                   ; 5
    jmp    L32CB                 ; 3

L3439:
    lda    L1D19                 ; 4
    sta    $B2                   ; 3
    lda    L1D1A                 ; 4
    sta    $B3                   ; 3
    lda    #$0A                  ; 2
    sta    $B5                   ; 3
    ldy    #$10                  ; 2
L3449:
    dey                          ; 2
    bmi    L345D                 ; 2³
    tya                          ; 2
    tax                          ; 2
    jsr    L1FCC                 ; 6
    and    L1D19,X               ; 4
    beq    L3449                 ; 2³
    lda    #$18                  ; 2
    sta.wy $DE,Y                 ; 5
    bne    L3449                 ; 3   always branch

L345D:
    jmp    L32CB                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3460 SUBROUTINE
    lda    thirdFrameCounter     ; 3
    and    #$02                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $F0                   ; 3
L346A SUBROUTINE
    ldx    #$10                  ; 2
L346C:
    dex                          ; 2
    bmi    L3487                 ; 2³
    stx    $F4                   ; 3
    jsr    L1FCC                 ; 6
    and    $F2,X                 ; 4
    php                          ; 3
    ldx    $F4                   ; 3
    plp                          ; 4
    beq    L346C                 ; 2³
    lda    #$DF                  ; 2
    and    $DE,X                 ; 4
    ora    $F0                   ; 3
    sta    $DE,X                 ; 4
    jmp    L346C                 ; 3

L3487:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3488:
    lda    $B2                   ; 3
    ora    $B3                   ; 3
    bne    L34E8                 ; 2³
    lda    $B0                   ; 3
    sta    $B2                   ; 3
    lda    $B1                   ; 3
    sta    $B3                   ; 3
    lda    #$0A                  ; 2
    sta    $B5                   ; 3
    jmp    L32CB                 ; 3

L349D:
    lda    framecounter          ; 3
    and    #$0F                  ; 2
    bne    L34A9                 ; 2³
    lda    $B2                   ; 3
    ora    $B3                   ; 3
    beq    L34AC                 ; 2³
L34A9:
    jmp    FinishOverscan        ; 3

L34AC:
    ldy    #8                    ; 2
    ldx    #1                    ; 2
L34B0:
    dey                          ; 2
    bmi    L34B9                 ; 2³
    lsr    $B0,X                 ; 6
    bcs    L34C0                 ; 2³
    bcc    L34B0                 ; 3   always branch

L34B9:
    dex                          ; 2
    bmi    L34EB                 ; 2³
    ldy    #8                    ; 2
    bne    L34B0                 ; 3   always branch

L34C0:
    ldx    #1                    ; 2
    txa                          ; 2
    jsr    L1F37                 ; 6
    lda    $A8                   ; 3
    sec                          ; 2
    sbc    #4                    ; 2
    bcc    L34E8                 ; 2³
    ldx    #$24                  ; 2
    cmp    #$0C                  ; 2
    bcc    L34DD                 ; 2³
    lsr                          ; 2
    ldx    #$49                  ; 2
    cmp    #$18                  ; 2
    bcc    L34DD                 ; 2³
    lsr                          ; 2
    ldx    #$99                  ; 2
L34DD:
    tay                          ; 2
    stx    $F0                   ; 3
L34E0:
    lda    $F0                   ; 3
    jsr    L1F35                 ; 6
    dey                          ; 2
    bpl    L34E0                 ; 2³
L34E8:
    jmp    FinishOverscan        ; 3

L34EB:
    lda    #2                    ; 2
    jmp    L33B7                 ; 3

L34F0:
    lda    $B2                   ; 3
    ora    $B3                   ; 3
    bne    L34E8                 ; 2³
    lda    L1D19                 ; 4
    sta    $B0                   ; 3
    lda    L1D1A                 ; 4
    sta    $B1                   ; 3
    jmp    L32CB                 ; 3

L3503:
    jsr    L35A7                 ; 6
    bne    L34E8                 ; 2³
    ldx    #$98                  ; 2
    jsr    L1ED2                 ; 6
    ldy    #$13                  ; 2
    ldx    #$0F                  ; 2
    lda    #0                    ; 2
    beq    L3518                 ; 3   always branch

L3515:
    sta    $CD,X                 ; 4
    dex                          ; 2
L3518:
    sty    $CD,X                 ; 4
    dex                          ; 2
    bpl    L3515                 ; 2³
    lda    #ORANGE               ; 2
    sta    colEnemy2             ; 3
    lda    $A5                   ; 3
    sta    $A7                   ; 3
    lda    $9C                   ; 3
    sta    $9E                   ; 3
    ldy    #2                    ; 2
    jsr    L3B8D                 ; 6
    tax                          ; 2
    lda    hPosQbert             ; 3
    sta    hPosition,X           ; 4
    sta    $B5,X                 ; 4
    lda    #0                    ; 2
    sta    $9C                   ; 3
    sta    $9D                   ; 3
    ldx    $A5                   ; 3
    lda    $9B                   ; 3
    and    #$10                  ; 2
    beq    L354E                 ; 2³
    lda    #0                    ; 2
L3545:
    sta    $BD,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    sta    $BD,X                 ; 4
    jmp    L3559                 ; 3

L354E:
    cpx    #2                    ; 2
    beq    L3545                 ; 2³
    txa                          ; 2
    bne    L3559                 ; 2³
    ldx    #2                    ; 2
    bne    L3545                 ; 3   always branch

L3559:
    ldx    $A5                   ; 3
    lda    $BD,X                 ; 4
    sta    $CD,X                 ; 4
    lda    #0                    ; 2
    sta    $BD,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    L3569                 ; 2³
    ldx    #0                    ; 2
L3569:
    lda    $BD,X                 ; 4
    sta    $CD,X                 ; 4
    lda    #0                    ; 2
    sta    $BD,X                 ; 4
    lda    $9B                   ; 3
    and    #$10                  ; 2
    bne    L357D                 ; 2³
    dex                          ; 2
    dex                          ; 2
    bpl    L357D                 ; 2³
    ldx    #0                    ; 2
L357D:
    stx    $A6                   ; 3
    ldy    #1                    ; 2
    jsr    L3B8D                 ; 6
    tax                          ; 2
    lda    hPosQbert             ; 3
    sta    hPosition,X           ; 4
    clc                          ; 2
    adc    #8                    ; 2
    sta    hPosQbert             ; 3
    ldx    $A6                   ; 3
    lda    #$D0                  ; 2
    sta    $BD,X                 ; 4
    lda    #$B8                  ; 2
    sta    $CD,X                 ; 4
    lda    #$11                  ; 2
    sta    $BE,X                 ; 4
    sta    $CE,X                 ; 4
    lda    #WHITE                ; 2
    sta    colEnemy1             ; 3
    sta    $EE                   ; 3
    jmp    L32CB                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;called twice

L35A7 SUBROUTINE
    ldx    $91                   ; 3
    lda    SLICE2_3              ; 4   swap in slice 2...
    lda    L1AE9,X               ; 4   to get to a data table
    pha                          ; 3
    lda    SLICE5_3              ; 4   then replace with slice 5
    pla                          ; 4
    bne    L35B8                 ; 2³
    cmp    $93                   ; 3
L35B8:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L35B9:
    jsr    L35A7                 ; 6
    bne    L35E3                 ; 2³
    lda    numOfLives            ; 3
    and    #$0F                  ; 2
    bne    L35D0                 ; 2³
    cpx    #$F2                  ; 2
    bcs    L35E3                 ; 2³
    ldx    #$F2                  ; 2
    jsr    L1ED2                 ; 6
    jmp    L35E3                 ; 3

L35D0:
    cpx    #$D9                  ; 2
    bcs    L35E6                 ; 2³
    ldx    #$D9                  ; 2
    bit    framecounter          ; 3
    bpl    L35E0                 ; 2³
    ldx    #$E9                  ; 2
    bvc    L35E0                 ; 2³
    ldx    #$F6                  ; 2
L35E0:
    jsr    L1ED2                 ; 6
L35E3:
    jmp    FinishOverscan        ; 3

L35E6:
    lda    $EE                   ; 3
    bne    L35E3                 ; 2³
    dec    numOfLives            ; 5
    lda    $9B                   ; 3
    and    #$10                  ; 2
    beq    L3600                 ; 2³
    lda    #$EF                  ; 2
    and    $9B                   ; 3
    sta    $9B                   ; 3
    jsr    L1EA8                 ; 6
L35FB:
    lda    #7                    ; 2
    jmp    L33B7                 ; 3

L3600:
    lda    $A7                   ; 3
    sta    $A5                   ; 3
    ldy    #2                    ; 2
    jsr    L3B8D                 ; 6
    tax                          ; 2
    lda    hPosition,X           ; 4
    sta    hPosQbert             ; 3
    lda    #0                    ; 2
    ldx    #$1E                  ; 2
L3612:
    sta    $BD,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    L3612                 ; 2³
    inx                          ; 2
    stx    $A6                   ; 3
    stx    $A7                   ; 3
    lda    $9E                   ; 3
    sta    $9C                   ; 3
    ldy    #0                    ; 2
    ldx    $A5                   ; 3
    lda    $9F                   ; 3
    bpl    L35FB                 ; 2³
    jsr    L37EA                 ; 6
    jmp    L35FB                 ; 3

L362F:
    lda    $EE                   ; 3
    beq    L3670                 ; 2³
    ldy    #0                    ; 2
    sty    $EF                   ; 3
    lda    $9F                   ; 3
    cmp    #$FE                  ; 2
    beq    L3642                 ; 2³
    ldy    #1                    ; 2
    jmp    L30A9                 ; 3

L3642:
    jsr    L3BE6                 ; 6
    bcc    L364A                 ; 2³
L3647:
    jmp    FinishOverscan        ; 3

L364A:
    jsr    L38A1                 ; 6
    ldx    $F0                   ; 3
    lda    $DD,X                 ; 4
    and    #$1F                  ; 2
    cmp    $DD                   ; 3
    beq    L365A                 ; 2³
    jmp    L3035                 ; 3

L365A:
    lda    #$20                  ; 2
    ora    $DD,X                 ; 4
    sta    $DD,X                 ; 4
    cpx    #$0A                  ; 2
    beq    L3670                 ; 2³
    lda    L1D1D,X               ; 4
    and    #$0F                  ; 2
    sta    $9C                   ; 3
    jsr    L1F0A                 ; 6
    bne    L3647                 ; 3   always branch

L3670:
    lda    #0                    ; 2
    sta    $EE                   ; 3
    lda    framecounter          ; 3
    and    #$7F                  ; 2
    bne    L3647                 ; 2³
    ldx    #$0F                  ; 2
L367C:
    lda    $DE,X                 ; 4
    and    #$20                  ; 2
    bne    L3687                 ; 2³
    dex                          ; 2
    bpl    L367C                 ; 2³
    bmi    L369C                 ; 3   always branch

L3687:
    lda    #$1F                  ; 2
    and    $DE,X                 ; 4
    sta    $DE,X                 ; 4
    inc    $EF                   ; 5
    ldy    $EF                   ; 3
L3691:
    lda    #$99                  ; 2
    jsr    L1F35                 ; 6
    dey                          ; 2
    bne    L3691                 ; 2³
    jmp    L3647                 ; 3

L369C:
    jmp    L34EB                 ; 3

L369F:
    lda    #VBLANK_TIME          ; 2   note Vblank is never enabled...
    sta    TIM64T                ; 4
    jsr    L1E0D                 ; 6
    lda    SWCHB                 ; 4   test for pause/unpause again
    and    #$08                  ; 2
    bne    L36B1                 ; 2³  - no pause
    jmp    L1DED                 ; 3   - yes, pause

L36B1:
    lda    $9B                   ; 3
    and    #$07                  ; 2
    tax                          ; 2
    cmp    #5                    ; 2
    bcc    L36BD                 ; 2³
    jmp    L3768                 ; 3

L36BD:
    cmp    #4                    ; 2
    bcs    L36CD                 ; 2³
    lda    $82                   ; 3
    ldy    #2                    ; 2
L36C5:
    cmp    L1D5B,Y               ; 4
    beq    L36D0                 ; 2³
    dey                          ; 2
    bpl    L36C5                 ; 2³
L36CD:
    jmp    L378D                 ; 3

L36D0:
    lda    #0                    ; 2
L36D2:
    dex                          ; 2
    bmi    L36DA                 ; 2³
    clc                          ; 2
    adc    #4                    ; 2
    bne    L36D2                 ; 2³
L36DA:
    tax                          ; 2
    jmp    L36E4                 ; 3

L36DE:
    inx                          ; 2
    txa                          ; 2
    and    #$03                  ; 2
    beq    L36CD                 ; 2³
L36E4:
    stx    $F2                   ; 3
    jsr    L1FCC                 ; 6
    stx    $F1                   ; 3
    sta    $F0                   ; 3
    ldy    #0                    ; 2
    and    $AE,X                 ; 4
    beq    L36F4                 ; 2³
    iny                          ; 2
L36F4:
    sty    $F3                   ; 3
    lda    $F2                   ; 3
    asl                          ; 2
    tax                          ; 2
    lda    $BE,X                 ; 4
    rol                          ; 2
    rol    $F3                   ; 5
    rol                          ; 2
    rol    $F3                   ; 5
    rol                          ; 2
    rol    $F3                   ; 5
    ldy    $F3                   ; 3
    bne    L370C                 ; 2³
    jmp    L3763                 ; 3

L370C:
    dec    $F3                   ; 5
    php                          ; 3
    ror    $F3                   ; 5
    ror                          ; 2
    ror    $F3                   ; 5
    ror                          ; 2
    ror    $F3                   ; 5
    ror                          ; 2
    sta    $BE,X                 ; 4
    lda    $F3                   ; 3
    beq    L3720                 ; 2³
    lda    $F0                   ; 3
L3720:
    ldx    $F1                   ; 3
    sta    $F3                   ; 3
    lda    $F0                   ; 3
    eor    #$FF                  ; 2
    and    $AE,X                 ; 4
    ora    $F3                   ; 3
    sta    $AE,X                 ; 4
    ldx    $F2                   ; 3
    inx                          ; 2
    jsr    L1F5C                 ; 6
    plp                          ; 4
    bne    L3763                 ; 2³
    lda    $82                   ; 3
    cmp    #$0D                  ; 2
    beq    L3763                 ; 2³
    lda    $DD,X                 ; 4
    and    #$1F                  ; 2
    cmp    $DD                   ; 3
    bne    L3763                 ; 2³
    lda    #$18                  ; 2
    sta    $DD,X                 ; 4
    ldx    $F1                   ; 3
    lda    $F0                   ; 3
    ora    $B2,X                 ; 4
    sta    $B2,X                 ; 4
    lda    $F0                   ; 3
    ora    $B0,X                 ; 4
    sta    $B0,X                 ; 4
    lda    #$0A                  ; 2
    sta    $B5                   ; 3
    lda    #$99                  ; 2
    jsr    L1F35                 ; 6
    jmp    L37BE                 ; 3

L3763:
    ldx    $F2                   ; 3
    jmp    L36DE                 ; 3

L3768:
    lda    $B5                   ; 3
    beq    L377F                 ; 2³
    lda    $B2                   ; 3
    sta    $F2                   ; 3
    lda    $B3                   ; 3
    sta    $F3                   ; 3
    dec    $B5                   ; 5
    bne    L3787                 ; 2³
    lda    #0                    ; 2
    sta    $F0                   ; 3
    jsr    L346A                 ; 6
L377F:
    lda    #0                    ; 2
    sta    $B2                   ; 3
    sta    $B3                   ; 3
    beq    L378A                 ; 3   always branch

L3787:
    jsr    L3460                 ; 6
L378A:
    jmp    L37BE                 ; 3

L378D:
    lda    $82                   ; 3
    cmp    #8                    ; 2
    bne    L37BE                 ; 2³
    lda    $A6                   ; 3
    cmp    #8                    ; 2
    bne    L37AF                 ; 2³
    lda    $A7                   ; 3
    bpl    L37AF                 ; 2³
    ldx    #$10                  ; 2
L379F:
    lda    $9C,X                 ; 4
    sta    $9D,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    L379F                 ; 2³
    ldx    #$FF                  ; 2
    stx    $A6                   ; 3
    dex                          ; 2
    sta    $A0                   ; 3
L37AF:
    lda    $9B                   ; 3
    and    #$C0                  ; 2
    bne    L37BE                 ; 2³
    lda    $9B                   ; 3
    and    #$01                  ; 2
    tay                          ; 2
    iny                          ; 2
    jsr    L38DC                 ; 6
L37BE:
    jmp    L1DED                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L37C1 SUBROUTINE
    tya                          ; 2
    bne    L37D3                 ; 2³
    jsr    L1EA8                 ; 6
    lda    #$F6                  ; 2
    and    $9D                   ; 3
    sta    $9D                   ; 3
    lda    #$F6                  ; 2
    and    $9E                   ; 3
    sta    $9E                   ; 3
L37D3:
    sty    $F0                   ; 3
L37D5:
    lda    #$0C                  ; 2
    sta.wy $A2,Y                 ; 5
    ldy    $F0                   ; 3
    lda    #$FE                  ; 2
    sta.wy $9F,Y                 ; 5
    lda    #$F6                  ; 2
    and.wy $9C,Y                 ; 4
    sta.wy $9C,Y                 ; 5
    rts                          ; 6

L37EA SUBROUTINE
    sty    $F0                   ; 3
    txa                          ; 2
    sta.wy $A5,Y                 ; 5
    lda.wy $9C,Y                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    and    #$3C                  ; 2
    tax                          ; 2
    lda    L1D60,X               ; 4
    sta    $F1                   ; 3
    lda    L1D5E,X               ; 4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SLICE 5
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    sta    $F2                   ; 3
    lda.wy $9C,Y                 ; 4
    cmp    #$20                  ; 2
    bcs    L381C                 ; 2³
    and    #$02                  ; 2
    beq    L381C                 ; 2³
    lda    L1D5F,X               ; 4
    asl                          ; 2
    clc                          ; 2
    adc    #$17                  ; 2
    clc                          ; 2
    adc    #$17                  ; 2
    clc                          ; 2
    adc    $F1                   ; 3
    sta    $F1                   ; 3
L381C:
    lda.wy $A5,Y                 ; 4
    cpy    #0                    ; 2
    beq    L3826                 ; 2³
    clc                          ; 2
    adc    #$10                  ; 2
L3826:
    tax                          ; 2
    lda    $F1                   ; 3
    sec                          ; 2
    sbc    #$0C                  ; 2
    sta    $BD,X                 ; 4
    lda    $F2                   ; 3
    jsr    L1F8E                 ; 6
    lda    $F1                   ; 3
    clc                          ; 2
    adc    #$0B                  ; 2
    cpx    #0                    ; 2
    beq    L37D5                 ; 2³
    cpx    #$10                  ; 2
    beq    L37D5                 ; 2³
    dex                          ; 2
    dex                          ; 2
    sta    $BD,X                 ; 4
    lda    $F2                   ; 3
    jsr    L1F8E                 ; 6
    jmp    L37D5                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L384C SUBROUTINE
    txa                          ; 2
    clc                          ; 2
    adc.wy $AB,Y                 ; 4
    tax                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3853 SUBROUTINE
    jsr    L384C                 ; 6
    lda.wy $9C,Y                 ; 4
    and    #$02                  ; 2
    beq    L3865                 ; 2³
    lda    L1CBF,X               ; 4
    and    #$0F                  ; 2
    jmp    L386C                 ; 3

L3865:
    lda    L1CBF,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
L386C:
    sta    $F0                   ; 3
    lda.wy $9C,Y                 ; 4
    and    #$04                  ; 2
    beq    L3878                 ; 2³
    lda    $F0                   ; 3
    rts                          ; 6

L3878:
    lda    #0                    ; 2
    sec                          ; 2
    sbc    $F0                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L387E:
    pla                          ; 4
    and    #$0F                  ; 2
L3881:
    cmp    #8                    ; 2
    bcs    L3886                 ; 2³
    rts                          ; 6

L3886:
    ora    #$F0                  ; 2
    rts                          ; 6

L3889:
    pla                          ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    jmp    L3881                 ; 3

L3891 SUBROUTINE
    jsr    L384C                 ; 6
    lda    L1CE2,X               ; 4
    pha                          ; 3
    lda.wy $9C,Y                 ; 4
    and    #$02                  ; 2
    beq    L3889                 ; 2³
    bne    L387E                 ; 3   always branch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L38A1 SUBROUTINE
    jsr    L3B8D                 ; 6
    ldx    $88                   ; 3
    lda    hPosition,X           ; 4
    sec                          ; 2
    sbc    #$20                  ; 2
    bpl    L38B1                 ; 2³
    lda    #0                    ; 2
    beq    L38B5                 ; 3   always branch

L38B1:
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
L38B5:
    sta    $F0                   ; 3
    lda.wy $A5,Y                 ; 4
    bmi    L38D4                 ; 2³
    lsr                          ; 2
    tax                          ; 2
    lda    L1CA7,X               ; 4
    clc                          ; 2
    adc    $F0                   ; 3
    tax                          ; 2
    lda    L1C76,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    stx    $F0                   ; 3
    dex                          ; 2
    jsr    L1FCC                 ; 6
    sec                          ; 2
    rts                          ; 6

L38D4:
    jsr    L37C1                 ; 6
    clc                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;many jumps away from this subroutine

L38D9:
    jmp    L3A56                 ; 3

L38DC SUBROUTINE
    lda.wy $9C,Y                 ; 4
    cmp    #$10                  ; 2
    bcc    L38EC                 ; 2³
    and    #$08                  ; 2
    bne    L38D9                 ; 2³
    lda.wy $A5,Y                 ; 4
    bpl    L38EF                 ; 2³
L38EC:
    jmp    L3A07                 ; 3

L38EF:
    lda.wy $A5,Y                 ; 4
    cmp    $A5                   ; 3
    bne    L3937                 ; 2³
    lda    $9C                   ; 3
    ora.wy $9C,Y                 ; 4
    and    #$08                  ; 2
    bne    L3937                 ; 2³
    lda    $9C                   ; 3
    lsr                          ; 2
    bcc    L3916                 ; 2³
    and    #$03                  ; 2
    sta    $F0                   ; 3
    lda.wy $9C,Y                 ; 4
    lsr                          ; 2
    bcc    L3916                 ; 2³
    and    #$03                  ; 2
    eor    #$03                  ; 2
    cmp    $F0                   ; 3
    bne    L3937                 ; 2³
L3916:
    lda    $A2                   ; 3
    adc    #$0B                  ; 2
    sbc.wy $A2,Y                 ; 4
    bmi    L3937                 ; 2³
    cmp    #$17                  ; 2
    bcs    L3937                 ; 2³
    jsr    L3B8D                 ; 6
    ldx    $88                   ; 3
    lda    hPosition,X           ; 4
    adc    #3                    ; 2
    sbc    hPosQbert             ; 3
    bmi    L3937                 ; 2³
    cmp    #7                    ; 2
    bcs    L3937                 ; 2³
    jmp    L3AFC                 ; 3

L3937:
    lda.wy $9F,Y                 ; 4
    cmp    #$FE                  ; 2
    bne    L38D9                 ; 2³
    lda.wy $9C,Y                 ; 4
    and    #$F0                  ; 2
    cmp    #$10                  ; 2
    beq    L396F                 ; 2³
    cmp    #$40                  ; 2
    bne    L39A8                 ; 2³
    jsr    L3BE6                 ; 6
    bcs    L39A8                 ; 2³
    ldx    $F0                   ; 3
    lda    $DE,X                 ; 4
    and    #$1F                  ; 2
    asl                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    L1D7F,X               ; 4
    cmp.wy $A8,Y                 ; 4
    bne    L39A8                 ; 2³
    lda    #$FC                  ; 2
    sta.wy $9F,Y                 ; 5
    lda    #8                    ; 2
    ora.wy $9C,Y                 ; 4
    sta.wy $9C,Y                 ; 5
    rts                          ; 6

L396F:
    jsr    L3BE6                 ; 6
    bcc    L39A8                 ; 2³
    lda    numOfLives            ; 3
    and    #$F0                  ; 2
    bne    L3982                 ; 2³
    lda    #4                    ; 2
    jsr    L1F35                 ; 6
    jmp    L399A                 ; 3

L3982:
    lda    numOfLives            ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    numOfLives            ; 3
    ldx    #4                    ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    #4                    ; 2
    bcs    L3994                 ; 2³
    tax                          ; 2
L3994:
    txa                          ; 2
    ldx    #1                    ; 2
    jsr    L1F37                 ; 6
L399A:
    lda    #8                    ; 2
    ora.wy $9C,Y                 ; 4
    sta.wy $9C,Y                 ; 5
    jmp    L3A93                 ; 3

L39A5:
    jmp    L3A56                 ; 3

L39A8:
    lda    $A8                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    L1C0C,X               ; 4
    cmp.wy $82,Y                 ; 4
    bcs    L39A5                 ; 2³
    lda.wy $9C,Y                 ; 4
    and    #$F0                  ; 2
    sta.wy $9C,Y                 ; 5
    cmp    #$50                  ; 2
    bne    L39D0                 ; 2³
    jsr    L38A1                 ; 6
    bcc    L39D0                 ; 2³
    and    L1D1B,X               ; 4
    beq    L39D0                 ; 2³
    lda    #$10                  ; 2
    sta.wy $9C,Y                 ; 5
L39D0:
    lda.wy $9C,Y                 ; 4
    cmp    #$10                  ; 2
    bne    L39DA                 ; 2³
    jmp    L3A6E                 ; 3

L39DA:
    cpy    #1                    ; 2
    bne    L39E6                 ; 2³
    lda    $A6                   ; 3
    adc    #5                    ; 2
    cmp    $A7                   ; 3
    bcs    L3A56                 ; 2³
L39E6:
    lda.wy $82,Y                 ; 4
    and    #$07                  ; 2
    ora    #$03                  ; 2
    ora.wy $9C,Y                 ; 4
    sta.wy $9C,Y                 ; 5
    and    #$F0                  ; 2
    cmp    #$20                  ; 2
    bcc    L3A04                 ; 2³
    cmp    #$40                  ; 2
    bcs    L3A04                 ; 2³
    tya                          ; 2
    pha                          ; 3
    jsr    L3AAA                 ; 6
    pla                          ; 4
    tay                          ; 2
L3A04:
    jmp    L1F0A                 ; 3

L3A07:
    cpy    #1                    ; 2
    bne    L3A56                 ; 2³
    lda    $A7                   ; 3
    bmi    L3A27                 ; 2³
    lda    $9E                   ; 3
    and    #$08                  ; 2
    beq    L3A1B                 ; 2³
    lda    $A7                   ; 3
    cmp    #8                    ; 2
    bcs    L3A27                 ; 2³
L3A1B:
    lda    $9E                   ; 3
    and    #$F0                  ; 2
    cmp    #$50                  ; 2
    beq    L3A56                 ; 2³
    cmp    #$10                  ; 2
    beq    L3A56                 ; 2³
L3A27:
    lda    $9B                   ; 3
    and    #$20                  ; 2
    bne    L3A2F                 ; 2³
    beq    L3A56                 ; 3   always branch

L3A2F:
    lda    $A8                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    cmp    #5                    ; 2
    bcc    L3A39                 ; 2³
    sbc    #5                    ; 2
L3A39:
    cmp    #3                    ; 2
    bcc    L3A3F                 ; 2³
    sbc    #1                    ; 2
L3A3F:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $F0                   ; 3
    lda    $83                   ; 3
    and    #$07                  ; 2
    clc                          ; 2
    adc    $F0                   ; 3
    tax                          ; 2
    lda    L1D1D,X               ; 4
    and    #$F0                  ; 2
    ora    #$03                  ; 2
    jsr    L3BAB                 ; 6
L3A56:
    jmp    L3A93                 ; 3

L3A59:
    lda    $83                   ; 3
    and    #$02                  ; 2
    tax                          ; 2
    jmp    L3A7F                 ; 3

L3A61:
    lda    $83                   ; 3
    and    #$01                  ; 2
    sta    $F0                   ; 3
    txa                          ; 2
    ora    $F0                   ; 3
    tax                          ; 2
    jmp    L3A89                 ; 3

L3A6E:
    jsr    L3B8D                 ; 6
    ldx    $88                   ; 3
    lda    hPosition,X           ; 4
    ldx    #2                    ; 2
    cmp    hPosQbert             ; 3
    bcc    L3A7F                 ; 2³
    beq    L3A59                 ; 2³
    ldx    #0                    ; 2
L3A7F:
    lda    $A5                   ; 3
    cmp.wy $A5,Y                 ; 4
    bcc    L3A89                 ; 2³
    beq    L3A61                 ; 2³
    inx                          ; 2
L3A89:
    txa                          ; 2
    asl                          ; 2
    ora    #$11                  ; 2
    sta.wy $9C,Y                 ; 5
    jmp    L1F0A                 ; 3

L3A93:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3A94:
    eor    #$FF                  ; 2
    pha                          ; 3
    and    $B2,X                 ; 4
    sta    $B2,X                 ; 4
    pla                          ; 4
    and    $B0,X                 ; 4
    sta    $B0,X                 ; 4
    lda    $DD                   ; 3
    ldx    $F0                   ; 3
    sta    $DD,X                 ; 4
    pha                          ; 3
    jmp    L3AD0                 ; 3

L3AAA SUBROUTINE
    php                          ; 3
    lda    $A8                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    L1FB0,X               ; 4
    beq    L3AB9                 ; 2³
    plp                          ; 4
    lda    #$FF                  ; 2
    php                          ; 3
L3AB9:
    jsr    L38A1                 ; 6
    bcs    L3AC0                 ; 2³
    bcc    L3ACF                 ; 3   always branch

L3AC0:
    sta    $F1                   ; 3
    stx    $F2                   ; 3
    lda    $B0,X                 ; 4
    ora    $B2,X                 ; 4
    and    $F1                   ; 3
    beq    L3AD0                 ; 2³
    plp                          ; 4
    bne    L3A94                 ; 2³  always branch?
L3ACF:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3AD0:
    pla                          ; 4
    ldx    $F0                   ; 3
    lda.wy $9C,Y                 ; 4
    lsr                          ; 2
    asl    $DD,X                 ; 6
    asl    $DD,X                 ; 6
    ror                          ; 2
    ror    $DD,X                 ; 6
    ror                          ; 2
    ror    $DD,X                 ; 6
    dex                          ; 2
    stx    $F0                   ; 3
    lda    $F1                   ; 3
    ldx    $F2                   ; 3
    ora    $AE,X                 ; 4
    sta    $AE,X                 ; 4
    lda    $F0                   ; 3
    asl                          ; 2
    tax                          ; 2
    lda    #$1F                  ; 2
    and    $BE,X                 ; 4
    sta    $BE,X                 ; 4
    ldx    $F0                   ; 3
    inx                          ; 2
    jmp    L1F5C                 ; 3

L3AFC:
    lda.wy $9C,Y                 ; 4
    and    #$F0                  ; 2
    cmp    #$60                  ; 2
    bcs    L3B3A                 ; 2³
    cmp    #$40                  ; 2
    bcs    L3B11                 ; 2³
    cmp    #$20                  ; 2
    bcs    L3B1B                 ; 2³
    ldx    #$8C                  ; 2
    bne    L3B13                 ; 3   always branch

L3B11:
    ldx    #$92                  ; 2
L3B13:
    jsr    L1ED2                 ; 6
    lda    #$0B                  ; 2
    sta    $82                   ; 3
    rts                          ; 6

L3B1B:
    lda.wy $A5,Y                 ; 4
    clc                          ; 2
    adc    #$10                  ; 2
    tax                          ; 2
    lda    #0                    ; 2
    sta    $BD,X                 ; 4
    cpx    #$11                  ; 2
    bcc    L3B2E                 ; 2³
    dex                          ; 2
    dex                          ; 2
    sta    $BD,X                 ; 4
L3B2E:
    ldx    #$FE                  ; 2
    stx    $9F,Y                 ; 4
    inx                          ; 2
    stx    $A5,Y                 ; 4
    lda    #$99                  ; 2
    jmp    L1F35                 ; 3

L3B3A:
    ldx    #$64                  ; 2
    stx    thirdFrameCounter     ; 3
    ldx    #$80                  ; 2
    cmp    #$70                  ; 2
    bcc    L3B46                 ; 2³
    ldx    #8                    ; 2
L3B46:
    txa                          ; 2
    ora    $9B                   ; 3
    sta    $9B                   ; 3
    sty    $85                   ; 3
    ldx    #$3D                  ; 2
    jsr    L1ED2                 ; 6
    ldy    $85                   ; 3
    jmp    L3B1B                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3B57 SUBROUTINE
    lda.wy $9C,Y                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    and    #$3C                  ; 2
    tax                          ; 2
    lda    L1D5F,X               ; 4
    sta.w  $8C                   ; 4
    clc                          ; 2
    adc    #$18                  ; 2
    sta    $8E                   ; 3
    clc                          ; 2
    adc    L1D60,X               ; 4
    sta.w  $8B                   ; 4
    lda    L1D5E,X               ; 4
    sta    $87                   ; 3
    lda.wy $9C,Y                 ; 4
    cmp    #$20                  ; 2
    bcs    L3B8D                 ; 2³
    and    #$02                  ; 2
    beq    L3B8D                 ; 2³
    lda.w  $8B                   ; 4
    clc                          ; 2
    adc    $8E                   ; 3
    clc                          ; 2
    adc    $8E                   ; 3
    sta.w  $8B                   ; 4
L3B8D SUBROUTINE
    lda.wy $A5,Y                 ; 4
    sta    $F4                   ; 3
    sta    $89                   ; 3
    cpy    #0                    ; 2
    beq    L3B9F                 ; 2³
    lda    #$10                  ; 2
    clc                          ; 2
    adc    $F4                   ; 3
    sta    $89                   ; 3
L3B9F:
    lda    $89                   ; 3
    lsr                          ; 2
    tax                          ; 2
    lda    L1C76,X               ; 4
    and    #$07                  ; 2
    sta    $88                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3BAB SUBROUTINE
    sta.wy $9C,Y                 ; 5
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    L1D61,X               ; 4
    cmp    #$FF                  ; 2
    bne    L3BC1                 ; 2³
    jsr    L1F9B                 ; 6
    asl                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    L1D7F,X               ; 4
L3BC1:
    sta    colEnemy1             ; 3
    lda    $84                   ; 3
    and    #$04                  ; 2
    ora.wy $9C,Y                 ; 4
    sta.wy $9C,Y                 ; 5
    and    #$04                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    L1C10,X               ; 4
    sta    hPosEnemySection1     ; 3
    sta    $B8                   ; 3
    lda    #$0C                  ; 2
    sta.wy $A2,Y                 ; 5
    lda    #2                    ; 2
    sta.wy $A5,Y                 ; 5
    jmp    L1F0A                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3BE6 SUBROUTINE
    jsr    L38A1                 ; 6
    bcc    L3BFD                 ; 2³
    and    $AE,X                 ; 4
    bne    L3BFB                 ; 2³
    dec    $F0                   ; 5
    lda    $F0                   ; 3
    asl                          ; 2
    tax                          ; 2
    lda    $BE,X                 ; 4
    and    #$C0                  ; 2
    beq    L3BFD                 ; 2³
L3BFB:
    sec                          ; 2
    rts                          ; 6

L3BFD:
    clc                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $60 ; | XX     | $3BFF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SLICE 6
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $10 ; |   X    | $3C00
    .byte $00 ; |        | $3C01
    .byte $74 ; | XXX X  | $3C02
    .byte $1C ; |   XXX  | $3C03
    .byte $29 ; |  X X  X| $3C04
    .byte $07 ; |     XXX| $3C05
    .byte $AA ; |X X X X | $3C06   might be code
    .byte $A5 ; |X X  X X| $3C07
    .byte $86 ; |X    XX | $3C08
    .byte $95 ; |X  X X X| $3C09
    .byte $B6 ; |X XX XX | $3C0A
    .byte $60 ; | XX     | $3C0B
    .byte $60 ; | XX     | $3C0C
    .byte $10 ; |   X    | $3C0D
    .byte $00 ; |        | $3C0E

;1009 bytes
      

    .byte $5A,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5
    .byte $5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5

    .byte $5A,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5
    .byte $5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5

    .byte $5A,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5
    .byte $5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5

    .byte $5A,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5
    .byte $5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5

    .byte $5A,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5
    .byte $5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5

    .byte $5A,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5
    .byte $5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5

    .byte $5A,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5
    .byte $5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5

    .byte $5A,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5
    .byte $5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5

    .byte $5A,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5
    .byte $5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5

    .byte $5A,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5
    .byte $5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5

    .byte $5A,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5
    .byte $5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5

    .byte $5A,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5
    .byte $5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5

    .byte $5A,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5
    .byte $5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5

    .byte $5A,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5
    .byte $5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5

    .byte $5A,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5
    .byte $5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5

    .byte $5A,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A
    .byte $A5,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5,$5A,$A5
    .byte $5A


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SLICE 7
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ORG $2C00
       RORG $1C00

L1C00:
    .byte $00 ; |        | $1C00
    .byte $00 ; |        | $1C01
    .byte $00 ; |        | $1C02
    .byte $FE ; |XXXXXXX | $1C03
    .byte $FE ; |XXXXXXX | $1C04
    .byte $FE ; |XXXXXXX | $1C05
    .byte $0C ; |    XX  | $1C06
    .byte $00 ; |        | $1C07
    .byte $00 ; |        | $1C08
    .byte $02 ; |      X | $1C09
    .byte $FF ; |XXXXXXXX| $1C0A
    .byte $FF ; |XXXXXXXX| $1C0B
L1C0C:
    .byte $E2 ; |XXX   X | $1C0C
    .byte $DD ; |XX XXX X| $1C0D
    .byte $D2 ; |XX X  X | $1C0E
    .byte $60 ; | XX     | $1C0F
L1C10:
    .byte $6D ; | XX XX X| $1C10
    .byte $2D ; |  X XX X| $1C11
L1C12:
    .byte $11 ; |   X   X| $1C12
    .byte $15 ; |   X X X| $1C13
    .byte $05 ; |     X X| $1C14
    .byte $0C ; |    XX  | $1C15
    .byte $17 ; |   X XXX| $1C16
    .byte $13 ; |   X  XX| $1C17
    .byte $0D ; |    XX X| $1C18
    .byte $04 ; |     X  | $1C19
    .byte $0E ; |    XXX | $1C1A
    .byte $06 ; |     XX | $1C1B
    .byte $12 ; |   X  X | $1C1C
    .byte $14 ; |   X X  | $1C1D
    .byte $07 ; |     XXX| $1C1E
    .byte $0F ; |    XXXX| $1C1F
    .byte $16 ; |   X XX | $1C20
    .byte $10 ; |   X    | $1C21
    .byte $14 ; |   X X  | $1C22
    .byte $10 ; |   X    | $1C23
    .byte $01 ; |       X| $1C24
    .byte $08 ; |    X   | $1C25
    .byte $12 ; |   X  X | $1C26
    .byte $16 ; |   X XX | $1C27
    .byte $09 ; |    X  X| $1C28
    .byte $00 ; |        | $1C29
    .byte $02 ; |      X | $1C2A
    .byte $0A ; |    X X | $1C2B
    .byte $13 ; |   X  XX| $1C2C
    .byte $15 ; |   X X X| $1C2D
    .byte $0B ; |    X XX| $1C2E
    .byte $03 ; |      XX| $1C2F
    .byte $17 ; |   X XXX| $1C30
    .byte $11 ; |   X   X| $1C31
    .byte $15 ; |   X X X| $1C32
    .byte $11 ; |   X   X| $1C33
    .byte $04 ; |     X  | $1C34
    .byte $0D ; |    XX X| $1C35
    .byte $13 ; |   X  XX| $1C36
    .byte $17 ; |   X XXX| $1C37
    .byte $0C ; |    XX  | $1C38
    .byte $05 ; |     X X| $1C39
    .byte $06 ; |     XX | $1C3A
    .byte $0E ; |    XXX | $1C3B
    .byte $10 ; |   X    | $1C3C
    .byte $16 ; |   X XX | $1C3D
    .byte $0F ; |    XXXX| $1C3E
    .byte $07 ; |     XXX| $1C3F
    .byte $14 ; |   X X  | $1C40
    .byte $12 ; |   X  X | $1C41
    .byte $10 ; |   X    | $1C42
    .byte $14 ; |   X X  | $1C43
    .byte $00 ; |        | $1C44
    .byte $09 ; |    X  X| $1C45
    .byte $16 ; |   X XX | $1C46
    .byte $12 ; |   X  X | $1C47
    .byte $08 ; |    X   | $1C48
    .byte $01 ; |       X| $1C49
    .byte $0A ; |    X X | $1C4A
    .byte $02 ; |      X | $1C4B
    .byte $11 ; |   X   X| $1C4C
    .byte $17 ; |   X XXX| $1C4D
    .byte $03 ; |      XX| $1C4E
    .byte $0B ; |    X XX| $1C4F
    .byte $15 ; |   X X X| $1C50
    .byte $13 ; |   X  XX| $1C51
    .byte $04 ; |     X  | $1C52
    .byte $0C ; |    XX  | $1C53
    .byte $03 ; |      XX| $1C54
    .byte $0A ; |    X X | $1C55
    .byte $08 ; |    X   | $1C56
    .byte $00 ; |        | $1C57
    .byte $07 ; |     XXX| $1C58
    .byte $0E ; |    XXX | $1C59
    .byte $0D ; |    XX X| $1C5A
    .byte $05 ; |     X X| $1C5B
    .byte $0B ; |    X XX| $1C5C
    .byte $02 ; |      X | $1C5D
    .byte $01 ; |       X| $1C5E
    .byte $09 ; |    X  X| $1C5F
    .byte $0F ; |    XXXX| $1C60
    .byte $06 ; |     XX | $1C61
    .byte $0C ; |    XX  | $1C62
    .byte $04 ; |     X  | $1C63
    .byte $02 ; |      X | $1C64
    .byte $0B ; |    X XX| $1C65
    .byte $00 ; |        | $1C66
    .byte $08 ; |    X   | $1C67
    .byte $06 ; |     XX | $1C68
    .byte $0F ; |    XXXX| $1C69
    .byte $05 ; |     X X| $1C6A
    .byte $0D ; |    XX X| $1C6B
    .byte $0A ; |    X X | $1C6C
    .byte $03 ; |      XX| $1C6D
    .byte $09 ; |    X  X| $1C6E
    .byte $01 ; |       X| $1C6F
    .byte $0E ; |    XXX | $1C70
    .byte $07 ; |     XXX| $1C71
L1C72:
    .byte $00 ; |        | $1C72
    .byte $03 ; |      XX| $1C73
    .byte $02 ; |      X | $1C74
    .byte $01 ; |       X| $1C75
L1C76:
    .byte $00 ; |        | $1C76
    .byte $00 ; |        | $1C77
    .byte $08 ; |    X   | $1C78
    .byte $08 ; |    X   | $1C79
    .byte $00 ; |        | $1C7A
    .byte $00 ; |        | $1C7B
    .byte $00 ; |        | $1C7C
    .byte $00 ; |        | $1C7D
    .byte $11 ; |   X   X| $1C7E
    .byte $11 ; |   X   X| $1C7F
    .byte $1A ; |   XX X | $1C80
    .byte $1B ; |   XX XX| $1C81
    .byte $04 ; |     X  | $1C82
    .byte $05 ; |     X X| $1C83
    .byte $26 ; |  X  XX | $1C84
    .byte $26 ; |  X  XX | $1C85
    .byte $28 ; |  X X   | $1C86
    .byte $28 ; |  X X   | $1C87
    .byte $30 ; |  XX    | $1C88
    .byte $30 ; |  XX    | $1C89
    .byte $00 ; |        | $1C8A
    .byte $38 ; |  XXX   | $1C8B
    .byte $40 ; | X      | $1C8C
    .byte $40 ; | X      | $1C8D
    .byte $48 ; | X  X   | $1C8E
    .byte $48 ; | X  X   | $1C8F
    .byte $50 ; | X X    | $1C90
    .byte $50 ; | X X    | $1C91
    .byte $58 ; | X XX   | $1C92
    .byte $58 ; | X XX   | $1C93
    .byte $60 ; | XX     | $1C94
    .byte $60 ; | XX     | $1C95
    .byte $68 ; | XX X   | $1C96
    .byte $68 ; | XX X   | $1C97
    .byte $00 ; |        | $1C98
    .byte $00 ; |        | $1C99
    .byte $70 ; | XXX    | $1C9A
    .byte $70 ; | XXX    | $1C9B
    .byte $78 ; | XXXX   | $1C9C
    .byte $78 ; | XXXX   | $1C9D
    .byte $00 ; |        | $1C9E
    .byte $00 ; |        | $1C9F
    .byte $00 ; |        | $1CA0
    .byte $00 ; |        | $1CL1
    .byte $80 ; |X       | $1CA2
    .byte $80 ; |X       | $1CA3
    .byte $00 ; |        | $1CA4
    .byte $00 ; |        | $1CA5
    .byte $00 ; |        | $1CA6
L1CA7:
    .byte $00 ; |        | $1CA7
    .byte $00 ; |        | $1CA8
    .byte $07 ; |     XXX| $1CA9
    .byte $0E ; |    XXX | $1CAA
    .byte $15 ; |   X X X| $1CAB
    .byte $1C ; |   XXX  | $1CAC
    .byte $23 ; |  X   XX| $1CAD
    .byte $2A ; |  X X X | $1CAE
L1CAF:
    .byte $46 ; | X   XX | $1CAF
    .byte $55 ; | X X X X| $1CB0
    .byte $46 ; | X   XX | $1CB1
    .byte $55 ; | X X X X| $1CB2
    .byte $37 ; |  XX XXX| $1CB3
    .byte $64 ; | XX  X  | $1CB4
    .byte $28 ; |  X X   | $1CB5
    .byte $73 ; | XXX  XX| $1CB6
    .byte $14 ; |   X X  | $1CB7
    .byte $84 ; |X    X  | $1CB8
    .byte $28 ; |  X X   | $1CB9
    .byte $73 ; | XXX  XX| $1CBA
    .byte $37 ; |  XX XXX| $1CBB
    .byte $64 ; | XX  X  | $1CBC
    .byte $46 ; | X   XX | $1CBD
    .byte $55 ; | X X X X| $1CBE
L1CBF:
    .byte $20 ; |  X     | $1CBF
    .byte $10 ; |   X    | $1CC0
    .byte $11 ; |   X   X| $1CC1
    .byte $11 ; |   X   X| $1CC2
    .byte $11 ; |   X   X| $1CC3
    .byte $12 ; |   X  X | $1CC4
    .byte $11 ; |   X   X| $1CC5
    .byte $11 ; |   X   X| $1CC6
    .byte $11 ; |   X   X| $1CC7
    .byte $21 ; |  X    X| $1CC8
    .byte $12 ; |   X  X | $1CC9
    .byte $12 ; |   X  X | $1CCA
    .byte $12 ; |   X  X | $1CCB
    .byte $11 ; |   X   X| $1CCC
    .byte $00 ; |        | $1CCD
    .byte $20 ; |  X     | $1CCE
    .byte $21 ; |  X    X| $1CCF
    .byte $21 ; |  X    X| $1CD0
    .byte $21 ; |  X    X| $1CD1
    .byte $22 ; |  X   X | $1CD2
    .byte $22 ; |  X   X | $1CD3
    .byte $12 ; |   X  X | $1CD4
    .byte $12 ; |   X  X | $1CD5
    .byte $12 ; |   X  X | $1CD6
    .byte $12 ; |   X  X | $1CD7
    .byte $01 ; |       X| $1CD8
    .byte $41 ; | X     X| $1CD9
    .byte $21 ; |  X    X| $1CDA
    .byte $22 ; |  X   X | $1CDB
    .byte $22 ; |  X   X | $1CDC
    .byte $22 ; |  X   X | $1CDD
    .byte $22 ; |  X   X | $1CDE
    .byte $12 ; |   X  X | $1CDF
    .byte $12 ; |   X  X | $1CE0
    .byte $02 ; |      X | $1CE1
L1CE2:
    .byte $B8 ; |X XXX   | $1CE2
    .byte $FB ; |XXXXX XX| $1CE3
    .byte $0C ; |    XX  | $1CE4
    .byte $0D ; |    XX X| $1CE5
    .byte $0D ; |    XX X| $1CE6
    .byte $0D ; |    XX X| $1CE7
    .byte $1E ; |   XXXX | $1CE8
    .byte $1F ; |   XXXXX| $1CE9
    .byte $10 ; |   X    | $1CEA
    .byte $30 ; |  XX    | $1CEB
    .byte $41 ; | X     X| $1CEC
    .byte $61 ; | XX    X| $1CED
    .byte $72 ; | XXX  X | $1CEE
    .byte $72 ; | XXX  X | $1CEF
    .byte $B8 ; |X XXX   | $1CF0
    .byte $FA ; |XXXXX X | $1CF1
    .byte $0B ; |    X XX| $1CF2
    .byte $1C ; |   XXX  | $1CF3
    .byte $2D ; |  X XX X| $1CF4
    .byte $2E ; |  X XXX | $1CF5
    .byte $3F ; |  XXXXXX| $1CF6
    .byte $40 ; | X      | $1CF7
    .byte $41 ; | X     X| $1CF8
    .byte $41 ; | X     X| $1CF9
    .byte $51 ; | X X   X| $1CFA
    .byte $53 ; | X X  XX| $1CFB
    .byte $A8 ; |X X X   | $1CFC
    .byte $18 ; |   XX   | $1CFD
    .byte $1B ; |   XX XX| $1CFE
    .byte $2C ; |  X XX  | $1CFF
    .byte $2E ; |  X XXX | $1D00
    .byte $4F ; | X  XXXX| $1D01
    .byte $61 ; | XX    X| $1D02
    .byte $72 ; | XXX  X | $1D03
    .byte $73 ; | XXX  XX| $1D04
L1D05:
    .byte $C0 ; |XX      | $1D05
L1D06:
    .byte $03 ; |      XX| $1D06
    .byte $11 ; |   X   X| $1D07
    .byte $88 ; |X   X   | $1D08
    .byte $88 ; |X   X   | $1D09
    .byte $48 ; | X  X   | $1D0A
    .byte $20 ; |  X     | $1D0B
    .byte $29 ; |  X X  X| $1D0C
    .byte $12 ; |   X  X | $1D0D
    .byte $11 ; |   X   X| $1D0E
    .byte $94 ; |X  X X  | $1D0F
    .byte $04 ; |     X  | $1D10
    .byte $40 ; | X      | $1D11
    .byte $A4 ; |X X  X  | $1D12
    .byte $00 ; |        | $1D13
    .byte $D2 ; |XX X  X | $1D14
    .byte $25 ; |  X  X X| $1D15
    .byte $02 ; |      X | $1D16
    .byte $4B ; | X  X XX| $1D17
    .byte $00 ; |        | $1D18
L1D19:
    .byte $41 ; | X     X| $1D19
L1D1A:
    .byte $82 ; |X     X | $1D1A
L1D1B:
    .byte $40 ; | X      | $1D1B
    .byte $F6 ; |XXXX XX | $1D1C
L1D1D:
    .byte $70 ; | XXX    | $1D1D
    .byte $53 ; | X X  XX| $1D1E
    .byte $47 ; | X   XXX| $1D1F
    .byte $47 ; | X   XXX| $1D20
    .byte $43 ; | X    XX| $1D21
    .byte $45 ; | X   X X| $1D22
    .byte $43 ; | X    XX| $1D23
    .byte $47 ; | X   XXX| $1D24
    .byte $41 ; | X     X| $1D25
    .byte $43 ; | X    XX| $1D26
    .byte $50 ; | X X    | $1D27
    .byte $57 ; | X X XXX| $1D28
    .byte $41 ; | X     X| $1D29
    .byte $65 ; | XX  X X| $1D2A
    .byte $77 ; | XXX XXX| $1D2B
    .byte $45 ; | X   X X| $1D2C
    .byte $55 ; | X X X X| $1D2D
    .byte $40 ; | X      | $1D2E
    .byte $70 ; | XXX    | $1D2F
    .byte $40 ; | X      | $1D30
    .byte $40 ; | X      | $1D31
    .byte $60 ; | XX     | $1D32
    .byte $20 ; |  X     | $1D33
    .byte $40 ; | X      | $1D34
    .byte $40 ; | X      | $1D35
    .byte $50 ; | X X    | $1D36
    .byte $60 ; | XX     | $1D37
    .byte $20 ; |  X     | $1D38
    .byte $30 ; |  XX    | $1D39
    .byte $40 ; | X      | $1D3A
    .byte $70 ; | XXX    | $1D3B
    .byte $50 ; | X X    | $1D3C
IndirectPtrsTab:
    .word  FinishOverscan-1 ; $1D3D
    .word  L3011-1       ; $1D3F
    .word  L3359-1       ; $1D41
    .word  L3376-1       ; $1D43
    .word  L33D4-1       ; $1D45
    .word  L342E-1       ; $1D47
    .word  L34F0-1       ; $1D49
    .word  L3023-1       ; $1D4B
    .word  L302F-1       ; $1D4D
    .word  L3488-1       ; $1D4F
    .word  L349D-1       ; $1D51
    .word  L3503-1       ; $1D53
    .word  L35B9-1       ; $1D55
    .word  L362F-1       ; $1D57
    .word  FinishOverscan-1 ; $1D59
L1D5B:
    .byte $08 ; |    X   | $1D5B
    .byte $0D ; |    XX X| $1D5C
    .byte $0B ; |    X XX| $1D5D
L1D5E:
    .byte $13 ; |   X  XX| $1D5E
L1D5F:
    .byte $12 ; |   X  X | $1D5F
L1D60:
    .byte $1C ; |   XXX  | $1D60
L1D61:
    .byte $38 ; |  XXX   | $1D61
    .byte $10 ; |   X    | $1D62
    .byte $1B ; |   XX XX| $1D63
    .byte $1C ; |   XXX  | $1D64
    .byte $68 ; | XX X   | $1D65
    .byte $11 ; |   X   X| $1D66
    .byte $0F ; |    XXXX| $1D67
    .byte $1C ; |   XXX  | $1D68
    .byte $C8 ; |XX  X   | $1D69
    .byte $11 ; |   X   X| $1D6A
    .byte $0F ; |    XXXX| $1D6B
    .byte $6A ; | XX X X | $1D6C
    .byte $C8 ; |XX  X   | $1D6D
    .byte $12 ; |   X  X | $1D6E
    .byte $0F ; |    XXXX| $1D6F
    .byte $1C ; |   XXX  | $1D70
    .byte $FF ; |XXXXXXXX| $1D71
    .byte $12 ; |   X  X | $1D72
    .byte $0C ; |    XX  | $1D73
    .byte $6A ; | XX X X | $1D74
    .byte $68 ; | XX X   | $1D75
    .byte $12 ; |   X  X | $1D76
    .byte $0C ; |    XX  | $1D77
    .byte $6A ; | XX X X | $1D78
    .byte $C8 ; |XX  X   | $1D79
    .byte $12 ; |   X  X | $1D7A
    .byte $0A ; |    X X | $1D7B
    .byte $B2 ; |X XX  X | $1D7C
    .byte $C8 ; |XX  X   | $1D7D
L1D7E:
    .byte $01 ; |       X| $1D7E
L1D7F:
    .byte $0E ; |    XXX | $1D7F
L1D80:
    .byte $FC ; |XXXXXX  | $1D80
L1D81:
    .byte $88 ; |X   X   | $1D81
    .byte $02 ; |      X | $1D82
    .byte $0E ; |    XXX | $1D83
    .byte $68 ; | XX X   | $1D84
    .byte $C8 ; |XX  X   | $1D85
    .byte $04 ; |     X  | $1D86
    .byte $0E ; |    XXX | $1D87
    .byte $88 ; |X   X   | $1D88
    .byte $68 ; | XX X   | $1D89
    .byte $08 ; |    X   | $1D8A
    .byte $0E ; |    XXX | $1D8B
    .byte $C8 ; |XX  X   | $1D8C
    .byte $FC ; |XXXXXX  | $1D8D
    .byte $10 ; |   X    | $1D8E
    .byte $FC ; |XXXXXX  | $1D8F
    .byte $0E ; |    XXX | $1D90
    .byte $C8 ; |XX  X   | $1D91
    .byte $20 ; |  X     | $1D92
    .byte $FC ; |XXXXXX  | $1D93
    .byte $38 ; |  XXX   | $1D94
    .byte $88 ; |X   X   | $1D95
    .byte $40 ; | X      | $1D96
    .byte $FC ; |XXXXXX  | $1D97
    .byte $88 ; |X   X   | $1D98
    .byte $0E ; |    XXX | $1D99
    .byte $80 ; |X       | $1D9A
    .byte $FC ; |XXXXXX  | $1D9B
    .byte $C8 ; |XX  X   | $1D9C
    .byte $38 ; |  XXX   | $1D9D
    .byte $01 ; |       X| $1D9E
    .byte $38 ; |  XXX   | $1D9F
    .byte $FC ; |XXXXXX  | $1DA0
    .byte $C8 ; |XX  X   | $1DL1
    .byte $02 ; |      X | $1DA2
    .byte $38 ; |  XXX   | $1DA3
    .byte $68 ; | XX X   | $1DA4
    .byte $88 ; |X   X   | $1DA5
    .byte $04 ; |     X  | $1DA6
    .byte $38 ; |  XXX   | $1DA7
    .byte $88 ; |X   X   | $1DA8
    .byte $FC ; |XXXXXX  | $1DA9
L1DAA:
    .byte $08 ; |    X   | $1DAA   +0   bit 2 (ie $04) set = reflect, bits 7 or 4 set don't check joystick
    .byte $38 ; |  XXX   | $1DAB   +1
    .byte $C8 ; |XX  X   | $1DAC   +2
    .byte $68 ; | XX X   | $1DAD   +3
    .byte $10 ; |   X    | $1DAE   +4
    .byte $68 ; | XX X   | $1DAF   +5
    .byte $0E ; |    XXX | $1DB0   +6
    .byte $88 ; |X   X   | $1DB1   +7
    .byte $20 ; |  X     | $1DB2   +8
    .byte $68 ; | XX X   | $1DB3   +9
    .byte $38 ; |  XXX   | $1DB4   +10
    .byte $C8 ; |XX  X   | $1DB5   +11
    .byte $40 ; | X      | $1DB6   +12
    .byte $68 ; | XX X   | $1DB7   +13
    .byte $88 ; |X   X   | $1DB8   +14
    .byte $38 ; |  XXX   | $1DB9   +15
    .byte $80 ; |X       | $1DBA   +16
    .byte $68 ; | XX X   | $1DBB   +17
    .byte $C8 ; |XX  X   | $1DBC   +18
    .byte $0E ; |    XXX | $1DBD   +19
    .byte $07 ; |     XXX| $1DBE   +20
    .byte $88 ; |X   X   | $1DBF   +21
    .byte $0E ; |    XXX | $1DC0   +22
    .byte $FC ; |XXXXXX  | $1DC1   +23
    .byte $05 ; |     X X| $1DC2   +24
    .byte $88 ; |X   X   | $1DC3   +25
    .byte $FC ; |XXXXXX  | $1DC4   +26
    .byte $38 ; |  XXX   | $1DC5   +27
    .byte $07 ; |     XXX| $1DC6   +28
    .byte $88 ; |X   X   | $1DC7   +29
    .byte $38 ; |  XXX   | $1DC8   +30
    .byte $68 ; | XX X   | $1DC9   +31
    .byte $00 ; |        | $1DCA   +32
    .byte $88 ; |X   X   | $1DCB   +33
    .byte $68 ; | XX X   | $1DCC   +34
    .byte $0E ; |    XXX | $1DCD   +35
    .byte $03 ; |      XX| $1DCE   +36
    .byte $C8 ; |XX  X   | $1DCF   +37
    .byte $0E ; |    XXX | $1DD0   +38
    .byte $68 ; | XX X   | $1DD1   +39
    .byte $01 ; |       X| $1DD2   +40
    .byte $C8 ; |XX  X   | $1DD3   +41
    .byte $FC ; |XXXXXX  | $1DD4   +42
    .byte $0E ; |    XXX | $1DD5   +43
    .byte $01 ; |       X| $1DD6   +44
    .byte $C8 ; |XX  X   | $1DD7   +45
    .byte $38 ; |  XXX   | $1DD8   +46
    .byte $FC ; |XXXXXX  | $1DD9   +47
    .byte $00 ; |        | $1DDA   +48
    .byte $C8 ; |XX  X   | $1DDB   +49
    .byte $68 ; | XX X   | $1DDC   +50
    .byte $38 ; |  XXX   | $1DDD   +51
    .byte $03 ; |      XX| $1DDE   +52
    .byte $C6 ; |XX   XX | $1DDF   +53
    .byte $C6 ; |XX   XX | $1DE0   +54
    .byte $C6 ; |XX   XX | $1DE1   +55
    .byte $05 ; |     X X| $1DE2   +56


START:
    lda    #0                    ; 2
    tax                          ; 2
.loopClear:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    .loopClear            ; 2³
    cld                          ; 2

L1DED:
    jsr    UseLowSlices          ; 6   swap in slices 0,1,2 (in that order, for the first 3K of rom)
    jmp    L1450                 ; 3   jump into the first slice

UseLowSlices SUBROUTINE
    lda    SLICE0_1              ; 4   0,1,2
    lda    SLICE1_2              ; 4
    lda    SLICE2_3              ; 4
    rts                          ; 6

L1DFD:
    jsr    UseHighSlices         ; 6   swap in slices 3,4,5 (in that order, for the first 3K of rom)
    jmp    L3000-$2000           ; 3   goto the beginning of slice 3 once it's swapped in...

UseHighSlices SUBROUTINE
    lda    SLICE3_1              ; 4   3,4,5
    lda    SLICE4_2              ; 4
    lda    SLICE5_3              ; 4
    rts                          ; 6

L1E0D SUBROUTINE
    lda    SLICE2_3              ; 4
    ldx    #1                    ; 2
L1E12:
    lda    $93,X                 ; 4
    beq    L1E40                 ; 2³
    dec    $93,X                 ; 6
    lda    $95,X                 ; 4
    and    #$40                  ; 2
    beq    L1E25                 ; 2³
    lda    $9B                   ; 3
    and    #$07                  ; 2
    jmp    L1E37                 ; 3

L1E25:
    lda    $95,X                 ; 4
    and    #$20                  ; 2
    beq    L1E39                 ; 2³
    txa                          ; 2
    beq    L1E35                 ; 2³
    lda    thirdFrameCounter     ; 3
    and    #$07                  ; 2
    jmp    L1E37                 ; 3

L1E35:
    lda    #8                    ; 2
L1E37:
    sta    AUDV0,X               ; 4
L1E39:
    dex                          ; 2
    bpl    L1E12                 ; 2³
    lda    SLICE5_3              ; 4
    rts                          ; 6

L1E40:
    ldy    $91,X                 ; 4
    iny                          ; 2
    lda    L1AE8,Y               ; 4
    bne    L1E4E                 ; 2³
    sta    AUDV0,X               ; 4
    sta    $95,X                 ; 4
    beq    L1E39                 ; 3   always branch

L1E4E:
    sta    AUDF0,X               ; 4
    lda    $95,X                 ; 4
    and    #$40                  ; 2
    bne    L1E66                 ; 2³
    lda    $95,X                 ; 4
    and    #$20                  ; 2
    beq    L1E6A                 ; 2³
    txa                          ; 2
    beq    L1E66                 ; 2³
    lda    thirdFrameCounter     ; 3
    and    #$07                  ; 2
    jmp    L1E6C                 ; 3

L1E66:
    lda    #$0F                  ; 2
    bne    L1E6C                 ; 3   always branch

L1E6A:
    lda    #$0C                  ; 2
L1E6C:
    sta    AUDV0,X               ; 4
    lda    L1AE8,Y               ; 4
    sty    $91,X                 ; 4
    cmp    #$F0                  ; 2
    bcc    L1E89                 ; 2³
    lda    $95,X                 ; 4
    and    #$60                  ; 2
    bne    L1E89                 ; 2³
    lda    #0                    ; 2
    sta    AUDV0,X               ; 4
    lda    L1AE8,Y               ; 4
    and    #$0F                  ; 2
    jmp    L1E91                 ; 3

L1E89:
    lda    L1AE8,Y               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
L1E91:
    tay                          ; 2
    lda    L1E9A,Y               ; 4
    sta    $93,X                 ; 4
    jmp    L1E39                 ; 3

L1E9A:
    .byte $11 ; |   X   X| $1E9A
    .byte $05 ; |     X X| $1E9B
    .byte $00 ; |        | $1E9C
    .byte $08 ; |    X   | $1E9D
    .byte $0F ; |    XXXX| $1E9E
    .byte $04 ; |     X  | $1E9F
    .byte $01 ; |       X| $1EA0
    .byte $0A ; |    X X | $1EL1
L1EA2:
    .byte $00 ; |        | $1EA2
    .byte $0E ; |    XXX | $1EA3
    .byte $1A ; |   XX X | $1EA4
L1EA5:
    .byte $0E ; |    XXX | $1EA5
    .byte $0C ; |    XX  | $1EA6
    .byte $09 ; |    X  X| $1EA7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1EA8 SUBROUTINE
    ldx    #$0B                  ; 2
.getQbertGfxPtrs:
    lda    QbertStartGfxPtrTab,X ; 4
    sta    $BD,X                 ; 4
    lda    L1C00,X               ; 4
    sta    $9C,X                 ; 4
    cpx    #8                    ; 2
    bcs    .badBranch            ; 2³   meant to delay 2 or 3 cycles?
.badBranch:
    dex                          ; 2
    bpl    .getQbertGfxPtrs      ; 2³
    lda    #$4D                  ; 2   intial horizontal position for Qbert
    sta    hPosQbert             ; 3
    ldx    #$1A                  ; 2
L1EC1:
    lda    #>QbertGraphics       ; 2
    sta    $C2,X                 ; 4
    lda    #<QbertGraphics       ; 2
    sta    $C1,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    L1EC1                 ; 2³
    lda    #2                    ; 2
    sta    $A5                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1ED2 SUBROUTINE
    pha                          ; 3
    tya                          ; 2
    pha                          ; 3
    jsr    UseLowSlices          ; 6   swap in slices 0,1,2 (in that order, for the first 3K of rom)
    ldy    #0                    ; 2
    lda    L1AE8,X               ; 4
    and    #$10                  ; 2
    bne    L1EE6                 ; 2³
    lda.wy $95,Y                 ; 4
    bne    L1EF8                 ; 2³
L1EE6:
    lda    #0                    ; 2
    sta.wy $93,Y                 ; 5
    lda    L1AE8,X               ; 4
    sta.wy AUDC0,Y               ; 5
    sta.wy $95,Y                 ; 5
    bmi    L1EFF                 ; 2³
    stx    $91,Y                 ; 4
L1EF8:
    pla                          ; 4   do an indirect jump, never return
    tay                          ; 2
    pla                          ; 4
    tax                          ; 2
    jmp    UseHighSlices         ; 3   swap in slices 3,4,5 (in that order, for the first 3K of rom)

L1EFF:
    inx                          ; 2
    lda    L1AE8,X               ; 4
    stx    $91,Y                 ; 4
    tax                          ; 2
    ldy    #1                    ; 2
    bne    L1EE6                 ; 3   always branch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1F0A SUBROUTINE
    tya                          ; 2
    beq    L1F17                 ; 2³
    lda    $9B                   ; 3
    and    #$08                  ; 2
    beq    L1F17                 ; 2³
    ldx    #0                    ; 2
    beq    L1F28                 ; 3   always branch

L1F17:
    lda    $A8                   ; 3
    and    #$F0                  ; 2
    beq    L1F1F                 ; 2³
    lda    #1                    ; 2
L1F1F:
    tax                          ; 2
    lda.wy $9C,Y                 ; 4
    and    #$02                  ; 2
    beq    L1F28                 ; 2³
    inx                          ; 2
L1F28:
    lda    L1EA2,X               ; 4
    sta.wy $AB,Y                 ; 5
    lda    L1EA5,X               ; 4
    sta.wy $9F,Y                 ; 5
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1F35 SUBROUTINE
    ldx    #2                    ; 2
L1F37 SUBROUTINE
    sed                          ; 2
    jmp    L1F3D                 ; 3

L1F3B:
    lda    #0                    ; 2
L1F3D:
    sec                          ; 2
    adc    scoreBCD,X            ; 4
    sta    scoreBCD,X            ; 4
    dex                          ; 2
    bcc    L1F5A                 ; 2³
    bne    L1F3B                 ; 2³
    lda    numOfLives            ; 3
    and    #$0F                  ; 2
    cmp    #$0F                  ; 2
    beq    L1F3B                 ; 2³
    inc    numOfLives            ; 5
    txa                          ; 2
    ldx    #$B4                  ; 2
    jsr    L1ED2                 ; 6
    jmp    L1F3B                 ; 3

L1F5A:
    cld                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1F5C SUBROUTINE
    stx    $86                   ; 3
    lda    $DD,X                 ; 4
    pha                          ; 3
    rol                          ; 2
    rol    $85                   ; 5
    rol                          ; 2
    rol    $85                   ; 5
    lda    $85                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    L1C72,X               ; 4
    sta    $8A                   ; 3
    ldy    $86                   ; 3
    lda.wy $DD,Y                 ; 4
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    $8A                   ; 3
    tax                          ; 2
    lda    L1C12,X               ; 4
    sta.wy $DD,Y                 ; 5
    pla                          ; 4
    and    #$C0                  ; 2
    ora.wy $DD,Y                 ; 4
    sta.wy $DD,Y                 ; 5
    ldx    $86                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1F8E SUBROUTINE
    pha                          ; 3
    lda    #$E0                  ; 2
    and    $BE,X                 ; 4
    sta    $BE,X                 ; 4
    pla                          ; 4
    ora    $BE,X                 ; 4
    sta    $BE,X                 ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1F9B SUBROUTINE
    lda    $84                   ; 3
    and    #$1F                  ; 2
    cmp    #$18                  ; 2
    bcc    L1FA5                 ; 2³
    sbc    #$18                  ; 2
L1FA5:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1FA6:
    .byte $00 ; |        | $1FA6
    .byte $01 ; |       X| $1FA7
    .byte $01 ; |       X| $1FA8
    .byte $02 ; |      X | $1FA9
    .byte $02 ; |      X | $1FAA
    .byte $00 ; |        | $1FAB
    .byte $01 ; |       X| $1FAC
    .byte $02 ; |      X | $1FAD
    .byte $02 ; |      X | $1FAE
    .byte $03 ; |      XX| $1FAF
L1FB0:
    .byte $00 ; |        | $1FB0
    .byte $00 ; |        | $1FB1
    .byte $00 ; |        | $1FB2
    .byte $00 ; |        | $1FB3
    .byte $00 ; |        | $1FB4
    .byte $01 ; |       X| $1FB5
    .byte $01 ; |       X| $1FB6
    .byte $01 ; |       X| $1FB7
    .byte $01 ; |       X| $1FB8
    .byte $00 ; |        | $1FB9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1FBA SUBROUTINE
    txa                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    L1C76,X               ; 4
    and    #$07                  ; 2
    tax                          ; 2
    lda    $86                   ; 3
    sta    hPosition,X           ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

QbertStartGfxPtrTab:
    .byte  <L137B        ; $1FC8
    .byte  >L137B        ; $1FC9
    .byte  <L1364        ; $1FCA
    .byte  >L1364        ; $1FCB

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1FCC SUBROUTINE
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $85                   ; 3
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    L1D7E,X               ; 4
    ldx    $85                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $A0 ; |X X     | $1FDC
    .byte $85 ; |X    X X| $1FDD
    .byte $A0 ; |X X     | $1FDE
    .byte $A2 ; |X X   X | $1FDF
    .byte $CC ; |XX  XX  | $1FE0
    .byte $A0 ; |X X     | $1FE1
    .byte $80 ; |X       | $1FE2
    .byte $A0 ; |X X     | $1FE3
    .byte $EA ; |XXX X X | $1FE4
    .byte $C9 ; |XX  X  X| $1FE5
    .byte $F9 ; |XXXXX  X| $1FE6
    .byte $A0 ; |X X     | $1FE7
    .byte $97 ; |X  X XXX| $1FE8
    .byte $C6 ; |XX   XX | $1FE9
    .byte $A0 ; |X X     | $1FEA
    .byte $D2 ; |XX X  X | $1FEB
    .byte $A0 ; |X X     | $1FEC
    .byte $FA ; |XXXXX X | $1FED
    .byte $B7 ; |X XX XXX| $1FEE
    .byte $97 ; |X  X XXX| $1FEF
    .byte $C9 ; |XX  X  X| $1FF0
    .byte $A0 ; |X X     | $1FF1
    .byte $97 ; |X  X XXX| $1FF2
    .byte $D3 ; |XX X  XX| $1FF3
    .byte $A9 ; |X X X  X| $1FF4
    .byte $A0 ; |X X     | $1FF5
    .byte $A5 ; |X X  X X| $1FF6
    .byte $CC ; |XX  XX  | $1FF7
    .byte $A0 ; |X X     | $1FF8
    .byte $82 ; |X     X | $1FF9
    .byte $D3 ; |XX X  XX| $1FFA
    .byte $A5 ; |X X  X X| $1FFB

        ORG $2FFC
       RORG $1FFC

    .word START, $F000

