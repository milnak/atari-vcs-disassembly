; Disassembly of dt.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcDT.cfg dt.bin
;
; DT.cfg contents:
;
;      ORG 1000
;      GFX 1000 12CC
;      CODE 12CD 192F
;      GFX 1930 1930
;      CODE 1931 1FFB
;      GFX 1FFC 1FFF

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
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXM1P   =  $31
CXM1FB  =  $35
CXPPMM  =  $37
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        SEG.U RamVariables
        ORG $80


ram_80             ds 1  ; x8
ram_81             ds 1  ; x5
ram_82             ds 1  ; x5
ram_83             ds 1  ; x16
ram_84             ds 2  ; x2
ram_86             ds 2  ; x4
ram_88             ds 2  ; x4
ram_8A             ds 2  ; x4
ram_8C             ds 2  ; x3
ram_8E             ds 1  ; x2
ram_8F             ds 1  ; x6
ram_90             ds 1  ; x3
ram_91             ds 1  ; x24
ram_92             ds 1  ; x8
ram_93             ds 1  ; x4
ram_94             ds 1  ; x4
ram_95             ds 1  ; x9
ram_96             ds 1  ; x8
ram_97             ds 1  ; x5
ram_98             ds 1  ; x5
ram_99             ds 1  ; x4
ram_9A             ds 1  ; x4
ram_9B             ds 1  ; x4
ram_9C             ds 1  ; x3
ram_9D             ds 1  ; x2
ram_9E             ds 1  ; x2
ram_9F             ds 1  ; x3
ram_A0             ds 1  ; x9
ram_A1             ds 1  ; x4
ram_A2             ds 1  ; x3
ram_A3             ds 1  ; x2
ram_A4             ds 1  ; x10
ram_A5             ds 1  ; x10
ram_A6             ds 1  ; x16
ram_A7             ds 1  ; x12
levelOfReadiness   ds 1  ; x9
ram_A9             ds 1  ; x16
ram_AA             ds 1  ; x3
ram_AB             ds 1  ; x11
ram_AC             ds 1  ; x2
ram_AD             ds 1  ; x2
ram_AE             ds 1  ; x1
ram_AF             ds 2  ; x2
ram_B1             ds 1  ; x12
ram_B2             ds 1  ; x3
ram_B3             ds 1  ; x4
ram_B4             ds 1  ; x4
ram_B5             ds 1  ; x10
ram_B6             ds 1  ; x11
ram_B7             ds 1  ; x5
ram_B8             ds 1  ; x3
ram_B9             ds 1  ; x22
ram_BA             ds 1  ; x7
ram_BB             ds 1  ; x11
ram_BC             ds 1  ; x3
ram_BD             ds 1  ; x2
ram_BE             ds 1  ; x5
ram_BF             ds 1  ; x5
ram_C0             ds 1  ; x11
ram_C1             ds 1  ; x1
ram_C2             ds 2  ; x4
ram_C4             ds 2  ; x1
ram_C6             ds 2  ; x1
ram_C8             ds 2  ; x1
ram_CA             ds 2  ; x1
ram_CC             ds 1  ; x10
ram_CD             ds 1  ; x5
ram_CE             ds 1  ; x6
ram_CF             ds 1  ; x3
ram_D0             ds 1  ; x2
ram_D1             ds 1  ; x3
ram_D2             ds 1  ; x3
ram_D3             ds 1  ; x3
ram_D4             ds 1  ; x2
ram_D5             ds 1  ; x12
ram_D6             ds 1  ; x9
ram_D7             ds 1  ; x3
ram_D8             ds 1  ; x5
ram_D9             ds 1  ; x12
ram_DA             ds 1  ; x6
ram_DB             ds 1  ; x3
ram_DC             ds 1  ; x3
ram_DD             ds 1  ; x6
ram_DE             ds 1  ; x5
ram_DF             ds 1  ; x5
ram_E0             ds 1  ; x6
ram_E1             ds 3  ; x4
ram_E4             ds 11 ; x1
ram_EF             ds 6  ; x2
ram_F5             ds 1  ; x1
ram_F6             ds 10 ; x1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


       SEG code
       ORG $1000

    .byte $3C ; |  XXXX  | $1000
    .byte $66 ; | XX  XX | $1001
    .byte $66 ; | XX  XX | $1002
    .byte $66 ; | XX  XX | $1003
    .byte $66 ; | XX  XX | $1004
    .byte $66 ; | XX  XX | $1005
    .byte $66 ; | XX  XX | $1006
    .byte $3C ; |  XXXX  | $1007
    .byte $3C ; |  XXXX  | $1008
    .byte $18 ; |   XX   | $1009
    .byte $18 ; |   XX   | $100A
    .byte $18 ; |   XX   | $100B
    .byte $18 ; |   XX   | $100C
    .byte $18 ; |   XX   | $100D
    .byte $38 ; |  XXX   | $100E
    .byte $18 ; |   XX   | $100F
    .byte $7E ; | XXXXXX | $1010
    .byte $60 ; | XX     | $1011
    .byte $60 ; | XX     | $1012
    .byte $3C ; |  XXXX  | $1013
    .byte $06 ; |     XX | $1014
    .byte $06 ; |     XX | $1015
    .byte $46 ; | X   XX | $1016
    .byte $3C ; |  XXXX  | $1017
    .byte $3C ; |  XXXX  | $1018
    .byte $46 ; | X   XX | $1019
    .byte $06 ; |     XX | $101A
    .byte $0C ; |    XX  | $101B
    .byte $0C ; |    XX  | $101C
    .byte $06 ; |     XX | $101D
    .byte $46 ; | X   XX | $101E
    .byte $3C ; |  XXXX  | $101F
    .byte $1E ; |   XXXX | $1020
    .byte $0C ; |    XX  | $1021
    .byte $0C ; |    XX  | $1022
    .byte $7E ; | XXXXXX | $1023
    .byte $4C ; | X  XX  | $1024
    .byte $2C ; |  X XX  | $1025
    .byte $1C ; |   XXX  | $1026
    .byte $0C ; |    XX  | $1027
    .byte $7C ; | XXXXX  | $1028
    .byte $46 ; | X   XX | $1029
    .byte $06 ; |     XX | $102A
    .byte $06 ; |     XX | $102B
    .byte $7C ; | XXXXX  | $102C
    .byte $60 ; | XX     | $102D
    .byte $60 ; | XX     | $102E
    .byte $7E ; | XXXXXX | $102F
    .byte $3C ; |  XXXX  | $1030
    .byte $66 ; | XX  XX | $1031
    .byte $66 ; | XX  XX | $1032
    .byte $66 ; | XX  XX | $1033
    .byte $7C ; | XXXXX  | $1034
    .byte $60 ; | XX     | $1035
    .byte $62 ; | XX   X | $1036
    .byte $3C ; |  XXXX  | $1037
    .byte $30 ; |  XX    | $1038
    .byte $30 ; |  XX    | $1039
    .byte $18 ; |   XX   | $103A
    .byte $18 ; |   XX   | $103B
    .byte $0C ; |    XX  | $103C
    .byte $0C ; |    XX  | $103D
    .byte $46 ; | X   XX | $103E
    .byte $7E ; | XXXXXX | $103F
    .byte $3C ; |  XXXX  | $1040
    .byte $66 ; | XX  XX | $1041
    .byte $66 ; | XX  XX | $1042
    .byte $3C ; |  XXXX  | $1043
    .byte $3C ; |  XXXX  | $1044
    .byte $66 ; | XX  XX | $1045
    .byte $66 ; | XX  XX | $1046
    .byte $3C ; |  XXXX  | $1047
    .byte $3C ; |  XXXX  | $1048
    .byte $46 ; | X   XX | $1049
    .byte $06 ; |     XX | $104A
    .byte $3E ; |  XXXXX | $104B
    .byte $66 ; | XX  XX | $104C
    .byte $66 ; | XX  XX | $104D
    .byte $66 ; | XX  XX | $104E
    .byte $3C ; |  XXXX  | $104F
BlankDigit:
    .byte $00 ; |        | $1050
    .byte $00 ; |        | $1051
    .byte $00 ; |        | $1052
    .byte $00 ; |        | $1053
    .byte $00 ; |        | $1054
    .byte $00 ; |        | $1055
    .byte $00 ; |        | $1056
    .byte $00 ; |        | $1057
HardDiffculty:
    .byte $00 ; |        | $1058
    .byte $00 ; |        | $1059
    .byte $20 ; |  X     | $105A
    .byte $70 ; | XXX    | $105B
    .byte $F8 ; |XXXXX   | $105C
    .byte $F8 ; |XXXXX   | $105D
    .byte $70 ; | XXX    | $105E
    .byte $20 ; |  X     | $105F
NormalDifficulty:
    .byte $00 ; |        | $1060
    .byte $00 ; |        | $1061
    .byte $D8 ; |XX XX   | $1062
    .byte $D8 ; |XX XX   | $1063
    .byte $20 ; |  X     | $1064
    .byte $20 ; |  X     | $1065
    .byte $D8 ; |XX XX   | $1066
    .byte $D8 ; |XX XX   | $1067
EasyDifficulty:
    .byte $00 ; |        | $1068
    .byte $00 ; |        | $1069
    .byte $F8 ; |XXXXX   | $106A
    .byte $F8 ; |XXXXX   | $106B
    .byte $D8 ; |XX XX   | $106C
    .byte $D8 ; |XX XX   | $106D
    .byte $F8 ; |XXXXX   | $106E
    .byte $F8 ; |XXXXX   | $106F
LivesDisplay:
    .byte $38 ; |  XXX   | $1070
    .byte $7C ; | XXXXX  | $1071
    .byte $7C ; | XXXXX  | $1072
    .byte $28 ; |  X X   | $1073
    .byte $28 ; |  X X   | $1074
AvalonHillOne:
    .byte $91 ; |X  X   X| $1075
    .byte $91 ; |X  X   X| $1076
    .byte $92 ; |X  X  X | $1077
    .byte $F4 ; |XXXX X  | $1078
    .byte $94 ; |X  X X  | $1079
    .byte $94 ; |X  X X  | $107A
    .byte $64 ; | XX  X  | $107B
CopyrightOne:
    .byte $78 ; | XXXX   | $107C
    .byte $84 ; |X    X  | $107D
    .byte $B4 ; |X XX X  | $107E
    .byte $A4 ; |X X  X  | $107F
    .byte $B4 ; |X XX X  | $1080
    .byte $84 ; |X    X  | $1081
    .byte $78 ; | XXXX   | $1082
AvalonHillTwo:
    .byte $12 ; |   X  X | $1083
    .byte $12 ; |   X  X | $1084
    .byte $92 ; |X  X  X | $1085
    .byte $5E ; | X XXXX | $1086
    .byte $52 ; | X X  X | $1087
    .byte $52 ; | X X  X | $1088
    .byte $4C ; | X  XX  | $1089
CopyrightTwo:
    .byte $98 ; |X  XX   | $108A
    .byte $A5 ; |X X  X X| $108B
    .byte $85 ; |X    X X| $108C
    .byte $9C ; |X  XXX  | $108D
    .byte $A5 ; |X X  X X| $108E
    .byte $A5 ; |X X  X X| $108F
    .byte $98 ; |X  XX   | $1090
AvalonHillThree:
    .byte $E6 ; |XXX  XX | $1091
    .byte $89 ; |X   X  X| $1092
    .byte $89 ; |X   X  X| $1093
    .byte $89 ; |X   X  X| $1094
    .byte $89 ; |X   X  X| $1095
    .byte $89 ; |X   X  X| $1096
    .byte $86 ; |X    XX | $1097
CopyrightThree:
    .byte $C6 ; |XX   XX | $1098
    .byte $29 ; |  X X  X| $1099
    .byte $21 ; |  X    X| $109A
    .byte $C2 ; |XX    X | $109B
    .byte $21 ; |  X    X| $109C
    .byte $29 ; |  X X  X| $109D
L109E:
    .byte $C6 ; |XX   XX | $109E   green background title screen,  shared with gfx for "83" above
L109F:
    .byte $38 ; |  XXX   | $109F   2nd  rose
    .byte $87 ; |X    XXX| $10A0   3rd  purple
L10A1:
    .byte $1A ; |   XX X | $10A1   4th  yellow
    .byte $C6 ; |XX   XX | $10A2
    .byte $38 ; |  XXX   | $10A3
    .byte $87 ; |X    XXX| $10A4
AvalonHillFour:
    .byte $25 ; |  X  X X| $10A5
    .byte $25 ; |  X  X X| $10A6
    .byte $25 ; |  X  X X| $10A7
    .byte $3D ; |  XXXX X| $10A8
    .byte $25 ; |  X  X X| $10A9
    .byte $25 ; |  X  X X| $10AA
    .byte $25 ; |  X  X X| $10AB
AvalonHillFive:
    .byte $77 ; | XXX XXX| $10AC
    .byte $44 ; | X   X  | $10AD
    .byte $44 ; | X   X  | $10AE
    .byte $44 ; | X   X  | $10AF
    .byte $44 ; | X   X  | $10B0
    .byte $44 ; | X   X  | $10B1
AvalonHillSix:
    .byte $44 ; | X   X  | $10B2   shared
    .byte $4C ; | X  XX  | $10B3
    .byte $54 ; | X X X  | $10B4
    .byte $54 ; | X X X  | $10B5
    .byte $54 ; | X X X  | $10B6
    .byte $64 ; | XX  X  | $10B7
    .byte $44 ; | X   X  | $10B8
L10B9:
    .byte $8A ; |X   X X | $10B9   colors
    .byte $1B ; |   XX XX| $10BA
    .byte $D8 ; |XX XX   | $10BB
    .byte $39 ; |  XXX  X| $10BC

PointersTab:
    .byte  <DeathTrapTwo    ; $10BD
    .byte  <DeathTrapThree  ; $10BE
    .byte  <DeathTrapFive   ; $10BF
    .byte  <DeathTrapOne    ; $10C0
    .byte  <DeathTrapFour   ; $10C1
    .byte  <DeathTrapSix    ; $10C2

    .byte  <AvalonHillOne   ; $10C3
    .byte  <AvalonHillTwo   ; $10C4
    .byte  <AvalonHillThree ; $10C5
    .byte  <AvalonHillSix   ; $10C6
    .byte  <AvalonHillFour  ; $10C7
    .byte  <AvalonHillFive  ; $10C8

    .byte  <BlankDigit      ; $10C9
    .byte  <CopyrightOne    ; $10CA
    .byte  <CopyrightTwo    ; $10CB
    .byte  <CopyrightThree  ; $10CC
    .byte  <BlankDigit      ; $10CD
    .byte  <BlankDigit      ; $10CE

L10CF:
    .byte $03 ; |      XX| $10CF
    .byte $0C ; |    XX  | $10D0
    .byte $30 ; |  XX    | $10D1
    .byte $C0 ; |XX      | $10D2
    .byte $30 ; |  XX    | $10D3
    .byte $0C ; |    XX  | $10D4
L10D5:
    .byte $02 ; |      X | $10D5
    .byte $06 ; |     XX | $10D6
    .byte $0E ; |    XXX | $10D7
    .byte $3E ; |  XXXXX | $10D8
    .byte $FE ; |XXXXXXX | $10D9
L10DA:
    .byte $00 ; |        | $10DA
    .byte $18 ; |   XX   | $10DB
    .byte $3C ; |  XXXX  | $10DC
    .byte $7E ; | XXXXXX | $10DD
    .byte $BD ; |X XXXX X| $10DE
    .byte $BD ; |X XXXX X| $10DF
    .byte $BD ; |X XXXX X| $10E0
L10E1:
    .byte $00 ; |        | $10E1
    .byte $00 ; |        | $10E2
    .byte $10 ; |   X    | $10E3
    .byte $10 ; |   X    | $10E4
    .byte $1C ; |   XXX  | $10E5
    .byte $38 ; |  XXX   | $10E6
    .byte $08 ; |    X   | $10E7
    .byte $08 ; |    X   | $10E8
    .byte $00 ; |        | $10E9
    .byte $00 ; |        | $10EA
    .byte $00 ; |        | $10EB
    .byte $24 ; |  X  X  | $10EC
    .byte $66 ; | XX  XX | $10ED
    .byte $66 ; | XX  XX | $10EE
    .byte $66 ; | XX  XX | $10EF
    .byte $66 ; | XX  XX | $10F0
    .byte $66 ; | XX  XX | $10F1
    .byte $66 ; | XX  XX | $10F2
    .byte $66 ; | XX  XX | $10F3
    .byte $66 ; | XX  XX | $10F4
    .byte $66 ; | XX  XX | $10F5
    .byte $66 ; | XX  XX | $10F6
BlackHoleOne:
    .byte $18 ; |   XX   | $10F7
    .byte $3C ; |  XXXX  | $10F8
    .byte $7C ; | XXXXX  | $10F9
    .byte $FE ; |XXXXXXX | $10FA
    .byte $7F ; | XXXXXXX| $10FB
    .byte $FF ; |XXXXXXXX| $10FC
    .byte $FE ; |XXXXXXX | $10FD
    .byte $7E ; | XXXXXX | $10FE
    .byte $7C ; | XXXXX  | $10FF
    .byte $38 ; |  XXX   | $1100
L1101:
    .byte $18 ; |   XX   | $1101
    .byte $3C ; |  XXXX  | $1102
    .byte $7E ; | XXXXXX | $1103
    .byte $FF ; |XXXXXXXX| $1104
    .byte $FF ; |XXXXXXXX| $1105
    .byte $FF ; |XXXXXXXX| $1106
    .byte $FF ; |XXXXXXXX| $1107
    .byte $7E ; | XXXXXX | $1108
    .byte $3C ; |  XXXX  | $1109
    .byte $18 ; |   XX   | $110A
    .byte $00 ; |        | $110B
    .byte $3C ; |  XXXX  | $110C
    .byte $7E ; | XXXXXX | $110D
    .byte $FF ; |XXXXXXXX| $110E
    .byte $FF ; |XXXXXXXX| $110F
    .byte $FF ; |XXXXXXXX| $1110
    .byte $FF ; |XXXXXXXX| $1111
    .byte $FF ; |XXXXXXXX| $1112
    .byte $FF ; |XXXXXXXX| $1113
    .byte $FF ; |XXXXXXXX| $1114
    .byte $FF ; |XXXXXXXX| $1115
    .byte $FF ; |XXXXXXXX| $1116
L1117:
    .byte $34 ; |  XX X  | $1117  colors
    .byte $C9 ; |XX  X  X| $1118
    .byte $64 ; | XX  X  | $1119
    .byte $8A ; |X   X X | $111A
L111B:
    .byte $0F ; |    XXXX| $111B  colors
    .byte $03 ; |      XX| $111C
    .byte $0F ; |    XXXX| $111D
    .byte $03 ; |      XX| $111E
DeathTrapOne:
    .byte $00 ; |        | $111F
    .byte $00 ; |        | $1120
    .byte $00 ; |        | $1121
    .byte $00 ; |        | $1122
    .byte $00 ; |        | $1123
    .byte $20 ; |  X     | $1124
    .byte $31 ; |  XX   X| $1125
    .byte $31 ; |  XX   X| $1126
    .byte $3F ; |  XXXXXX| $1127
    .byte $31 ; |  XX   X| $1128
    .byte $31 ; |  XX   X| $1129
    .byte $1F ; |   XXXXX| $112A
    .byte $0F ; |    XXXX| $112B
    .byte $00 ; |        | $112C
    .byte $04 ; |     X  | $112D
    .byte $08 ; |    X   | $112E
    .byte $01 ; |       X| $112F
    .byte $22 ; |  X   X | $1130
    .byte $41 ; | X     X| $1131
    .byte $82 ; |X     X | $1132
    .byte $24 ; |  X  X  | $1133
    .byte $68 ; | XX X   | $1134
    .byte $61 ; | XX    X| $1135
    .byte $E2 ; |XXX   X | $1136
    .byte $64 ; | XX  X  | $1137
    .byte $68 ; | XX X   | $1138
    .byte $C3 ; |XX    XX| $1139
    .byte $97 ; |X  X XXX| $113A
    .byte $20 ; |  X     | $113B
    .byte $40 ; | X      | $113C
    .byte $80 ; |X       | $113D
    .byte $00 ; |        | $113E
DeathTrapTwo:
    .byte $00 ; |        | $113F
    .byte $00 ; |        | $1140
    .byte $00 ; |        | $1141
    .byte $00 ; |        | $1142
    .byte $00 ; |        | $1143
    .byte $00 ; |        | $1144
    .byte $00 ; |        | $1145
    .byte $00 ; |        | $1146
    .byte $00 ; |        | $1147
    .byte $00 ; |        | $1148
    .byte $00 ; |        | $1149
    .byte $00 ; |        | $114A
    .byte $FF ; |XXXXXXXX| $114B
    .byte $FF ; |XXXXXXXX| $114C
    .byte $E1 ; |XXX    X| $114D
    .byte $E4 ; |XXX  X  | $114E
    .byte $E7 ; |XXX  XXX| $114F
    .byte $E7 ; |XXX  XXX| $1150
    .byte $E0 ; |XXX     | $1151
    .byte $E0 ; |XXX     | $1152
    .byte $E0 ; |XXX     | $1153
    .byte $E0 ; |XXX     | $1154
    .byte $E0 ; |XXX     | $1155
    .byte $E0 ; |XXX     | $1156
    .byte $E0 ; |XXX     | $1157
    .byte $E0 ; |XXX     | $1158
    .byte $E0 ; |XXX     | $1159
    .byte $E0 ; |XXX     | $115A
    .byte $E0 ; |XXX     | $115B
    .byte $E1 ; |XXX    X| $115C
    .byte $FF ; |XXXXXXXX| $115D
    .byte $FF ; |XXXXXXXX| $115E
DeathTrapThree:
    .byte $10 ; |   X    | $115F
    .byte $10 ; |   X    | $1160
    .byte $18 ; |   XX   | $1161
    .byte $18 ; |   XX   | $1162
    .byte $18 ; |   XX   | $1163
    .byte $18 ; |   XX   | $1164
    .byte $18 ; |   XX   | $1165
    .byte $18 ; |   XX   | $1166
    .byte $18 ; |   XX   | $1167
    .byte $18 ; |   XX   | $1168
    .byte $18 ; |   XX   | $1169
    .byte $18 ; |   XX   | $116A
    .byte $18 ; |   XX   | $116B
    .byte $98 ; |X  XX   | $116C
    .byte $D8 ; |XX XX   | $116D
    .byte $D8 ; |XX XX   | $116E
    .byte $FF ; |XXXXXXXX| $116F
    .byte $FF ; |XXXXXXXX| $1170
    .byte $C0 ; |XX      | $1171
    .byte $C0 ; |XX      | $1172
    .byte $C7 ; |XX   XXX| $1173
    .byte $CF ; |XX  XXXX| $1174
    .byte $CC ; |XX  XX  | $1175
    .byte $CF ; |XX  XXXX| $1176
    .byte $CF ; |XX  XXXX| $1177
    .byte $CC ; |XX  XX  | $1178
    .byte $CF ; |XX  XXXX| $1179
    .byte $C7 ; |XX   XXX| $117A
    .byte $C0 ; |XX      | $117B
    .byte $C0 ; |XX      | $117C
    .byte $81 ; |X      X| $117D
    .byte $02 ; |      X | $117E
DeathTrapFour:
    .byte $00 ; |        | $117F
    .byte $00 ; |        | $1180
    .byte $00 ; |        | $1181
    .byte $00 ; |        | $1182
    .byte $00 ; |        | $1183
    .byte $90 ; |X  X    | $1184
    .byte $99 ; |X  XX  X| $1185
    .byte $98 ; |X  XX   | $1186
    .byte $9F ; |X  XXXXX| $1187
    .byte $98 ; |X  XX   | $1188
    .byte $98 ; |X  XX   | $1189
    .byte $1F ; |   XXXXX| $118A
    .byte $0F ; |    XXXX| $118B
    .byte $20 ; |  X     | $118C
    .byte $42 ; | X    X | $118D
    .byte $84 ; |X    X  | $118E
    .byte $08 ; |    X   | $118F
    .byte $10 ; |   X    | $1190
    .byte $20 ; |  X     | $1191
    .byte $00 ; |        | $1192
    .byte $40 ; | X      | $1193
    .byte $60 ; | XX     | $1194
    .byte $60 ; | XX     | $1195
    .byte $60 ; | XX     | $1196
    .byte $60 ; | XX     | $1197
    .byte $60 ; | XX     | $1198
    .byte $FC ; |XXXXXX  | $1199
    .byte $FE ; |XXXXXXX | $119A
    .byte $00 ; |        | $119B
    .byte $00 ; |        | $119C
    .byte $00 ; |        | $119D
    .byte $00 ; |        | $119E
DeathTrapFive:
    .byte $00 ; |        | $119F
    .byte $00 ; |        | $11A0
    .byte $00 ; |        | $11A1
    .byte $00 ; |        | $11A2
    .byte $00 ; |        | $11A3
    .byte $41 ; | X     X| $11A4
    .byte $63 ; | XX   XX| $11A5
    .byte $66 ; | XX  XX | $11A6
    .byte $7C ; | XXXXX  | $11A7
    .byte $62 ; | XX   X | $11A8
    .byte $63 ; | XX   XX| $11A9
    .byte $7F ; | XXXXXXX| $11AA
    .byte $3F ; |  XXXXXX| $11AB
    .byte $00 ; |        | $11AC
    .byte $00 ; |        | $11AD
    .byte $20 ; |  X     | $11AE
    .byte $E0 ; |XXX     | $11AF
    .byte $E0 ; |XXX     | $11B0
    .byte $00 ; |        | $11B1
    .byte $00 ; |        | $11B2
    .byte $C8 ; |XX  X   | $11B3
    .byte $8C ; |X   XX  | $11B4
    .byte $0C ; |    XX  | $11B5
    .byte $0F ; |    XXXX| $11B6
    .byte $0C ; |    XX  | $11B7
    .byte $0C ; |    XX  | $11B8
    .byte $87 ; |X    XXX| $11B9
    .byte $C3 ; |XX    XX| $11BA
    .byte $08 ; |    X   | $11BB
    .byte $10 ; |   X    | $11BC
    .byte $20 ; |  X     | $11BD
    .byte $41 ; | X     X| $11BE
DeathTrapSix:
    .byte $0C ; |    XX  | $11BF
    .byte $1E ; |   XXXX | $11C0
    .byte $1E ; |   XXXX | $11C1
    .byte $3F ; |  XXXXXX| $11C2
    .byte $1E ; |   XXXX | $11C3
    .byte $9E ; |X  XXXX | $11C4
    .byte $0C ; |    XX  | $11C5
    .byte $20 ; |  X     | $11C6
    .byte $80 ; |X       | $11C7
    .byte $C0 ; |XX      | $11C8
    .byte $C0 ; |XX      | $11C9
    .byte $C0 ; |XX      | $11CA
    .byte $80 ; |X       | $11CB
    .byte $00 ; |        | $11CC
    .byte $00 ; |        | $11CD
    .byte $00 ; |        | $11CE
    .byte $00 ; |        | $11CF
    .byte $00 ; |        | $11D0
    .byte $00 ; |        | $11D1
    .byte $00 ; |        | $11D2
    .byte $41 ; | X     X| $11D3
    .byte $63 ; | XX   XX| $11D4
    .byte $63 ; | XX   XX| $11D5
    .byte $7F ; | XXXXXXX| $11D6
    .byte $7F ; | XXXXXXX| $11D7
    .byte $63 ; | XX   XX| $11D8
    .byte $63 ; | XX   XX| $11D9
    .byte $41 ; | X     X| $11DA
    .byte $00 ; |        | $11DB
    .byte $00 ; |        | $11DC
    .byte $00 ; |        | $11DD
    .byte $00 ; |        | $11DE
ShipGfx:
    .byte $00 ; |        | $11DF   $E1   stored in ram
    .byte $7E ; | XXXXXX | $11E0   $E2
    .byte $FF ; |XXXXXXXX| $11E1   $E3
    .byte $FF ; |XXXXXXXX| $11E2   $E4
    .byte $FF ; |XXXXXXXX| $11E3   $E5
    .byte $E7 ; |XXX  XXX| $11E4   $E6
    .byte $24 ; |  X  X  | $11E5   $E7
    .byte $24 ; |  X  X  | $11E6   $E8
    .byte $00 ; |        | $11E7   $E9
    .byte $00 ; |        | $11E8   $EA
    .byte $00 ; |        | $11E9   $EB


L11EA:
    .byte $00 ; |        | $11EA
L11EB:
    .byte $0F ; |    XXXX| $11EB
L11EC:
    .byte $08 ; |    X   | $11EC
L11ED:
    .byte $06 ; |     XX | $11ED
L11EE:
    .byte $2F ; |  X XXXX| $11EE
L11EF:
    .byte $1A ; |   XX X | $11EF   audio
    .byte $00 ; |        | $11F0
    .byte $0F ; |    XXXX| $11F1
    .byte $0C ; |    XX  | $11F2
    .byte $0A ; |    X X | $11F3
    .byte $50 ; | X X    | $11F4
    .byte $63 ; | XX   XX| $11F5
    .byte $01 ; |       X| $11F6
    .byte $0C ; |    XX  | $11F7
    .byte $0B ; |    X XX| $11F8
    .byte $0C ; |    XX  | $11F9
    .byte $04 ; |     X  | $11FA
    .byte $00 ; |        | $11FB
    .byte $01 ; |       X| $11FC
    .byte $0F ; |    XXXX| $11FD
    .byte $0C ; |    XX  | $11FE
    .byte $0A ; |    X X | $11FF
    .byte $09 ; |    X  X| $1200
    .byte $40 ; | X      | $1201
    .byte $01 ; |       X| $1202
    .byte $08 ; |    X   | $1203
    .byte $12 ; |   X  X | $1204
    .byte $12 ; |   X  X | $1205
    .byte $14 ; |   X X  | $1206
    .byte $5E ; | X XXXX | $1207
    .byte $01 ; |       X| $1208
    .byte $08 ; |    X   | $1209
    .byte $01 ; |       X| $120A
    .byte $0C ; |    XX  | $120B
    .byte $09 ; |    X  X| $120C
    .byte $14 ; |   X X  | $120D
    .byte $00 ; |        | $120E
    .byte $0A ; |    X X | $120F
    .byte $1C ; |   XXX  | $1210
    .byte $0A ; |    X X | $1211
    .byte $0D ; |    XX X| $1212
    .byte $0D ; |    XX X| $1213
    .byte $00 ; |        | $1214
    .byte $08 ; |    X   | $1215
    .byte $08 ; |    X   | $1216
    .byte $0C ; |    XX  | $1217
    .byte $0D ; |    XX X| $1218
    .byte $00 ; |        | $1219
    .byte $00 ; |        | $121A
    .byte $08 ; |    X   | $121B
    .byte $1D ; |   XXX X| $121C
    .byte $07 ; |     XXX| $121D
    .byte $01 ; |       X| $121E
    .byte $00 ; |        | $121F
    .byte $01 ; |       X| $1220
    .byte $14 ; |   X X  | $1221
    .byte $16 ; |   X XX | $1222
    .byte $0A ; |    X X | $1223
    .byte $03 ; |      XX| $1224
    .byte $00 ; |        | $1225
    .byte $00 ; |        | $1226
    .byte $01 ; |       X| $1227
    .byte $07 ; |     XXX| $1228
    .byte $0C ; |    XX  | $1229
    .byte $03 ; |      XX| $122A
    .byte $A1 ; |X X    X| $122B
    .byte $00 ; |        | $122C
    .byte $0E ; |    XXX | $122D
    .byte $0A ; |    X X | $122E
    .byte $09 ; |    X  X| $122F
    .byte $03 ; |      XX| $1230
    .byte $41 ; | X     X| $1231
ShipMiddleLightsGfx:
    .byte $6D ; | XX XX X| $1232
    .byte $B6 ; |X XX XX | $1233
    .byte $DB ; |XX XX XX| $1234
    .byte $DB ; |XX XX XX| $1235
L1236:
    .byte $00 ; |        | $1236
    .byte $06 ; |     XX | $1237
    .byte $06 ; |     XX | $1238
    .byte $0F ; |    XXXX| $1239
    .byte $06 ; |     XX | $123A
    .byte $06 ; |     XX | $123B
    .byte $06 ; |     XX | $123C
    .byte $06 ; |     XX | $123D
L123E:
    .byte $40 ; | X      | $123E
    .byte $20 ; |  X     | $123F
    .byte $F0 ; |XXXX    | $1240
    .byte $D0 ; |XX X    | $1241
    .byte $C0 ; |XX      | $1242
    .byte $80 ; |X       | $1243
    .byte $60 ; | XX     | $1244
L1245:
    .byte  <FireballOne    ; $1245
    .byte  <FireballTwo    ; $1246
    .byte  <FireballThree  ; $1247
    .byte  <FireballFour   ; $1248
    .byte  <FireballFive   ; $1249
    .byte  <FireballSix    ; $124A
    .byte  <FireballSeven  ; $124B
    .byte  <FireballEight  ; $124C
FireballOne:
    .byte $00 ; |        | $124D
    .byte $00 ; |        | $124E
    .byte $00 ; |        | $124F
    .byte $00 ; |        | $1250
    .byte $00 ; |        | $1251
    .byte $10 ; |   X    | $1252
    .byte $38 ; |  XXX   | $1253
    .byte $7C ; | XXXXX  | $1254
    .byte $38 ; |  XXX   | $1255
    .byte $10 ; |   X    | $1256
    .byte $00 ; |        | $1257
FireballTwo:
    .byte $00 ; |        | $1258
    .byte $00 ; |        | $1259
    .byte $00 ; |        | $125A
    .byte $00 ; |        | $125B
    .byte $00 ; |        | $125C
    .byte $18 ; |   XX   | $125D
    .byte $18 ; |   XX   | $125E
    .byte $38 ; |  XXX   | $125F
    .byte $7C ; | XXXXX  | $1260
    .byte $38 ; |  XXX   | $1261
    .byte $18 ; |   XX   | $1262
    .byte $18 ; |   XX   | $1263
FireballThree:
    .byte $00 ; |        | $1264
    .byte $00 ; |        | $1265
    .byte $00 ; |        | $1266
    .byte $00 ; |        | $1267
    .byte $10 ; |   X    | $1268
    .byte $38 ; |  XXX   | $1269
    .byte $7C ; | XXXXX  | $126A
    .byte $FE ; |XXXXXXX | $126B
    .byte $FE ; |XXXXXXX | $126C
    .byte $7C ; | XXXXX  | $126D
    .byte $38 ; |  XXX   | $126E
    .byte $10 ; |   X    | $126F
    .byte $00 ; |        | $1270
    .byte $00 ; |        | $1271
    .byte $00 ; |        | $1272
FireballFour:
    .byte $00 ; |        | $1273
    .byte $18 ; |   XX   | $1274
    .byte $3C ; |  XXXX  | $1275
    .byte $3C ; |  XXXX  | $1276
    .byte $7E ; | XXXXXX | $1277
    .byte $7E ; | XXXXXX | $1278
    .byte $7F ; | XXXXXXX| $1279
    .byte $FF ; |XXXXXXXX| $127A
    .byte $FF ; |XXXXXXXX| $127B
    .byte $7E ; | XXXXXX | $127C
    .byte $7E ; | XXXXXX | $127D
    .byte $7E ; | XXXXXX | $127E
    .byte $3C ; |  XXXX  | $127F
    .byte $3C ; |  XXXX  | $1280
    .byte $18 ; |   XX   | $1281
FireballFive:
    .byte $00 ; |        | $1282
    .byte $00 ; |        | $1283
    .byte $00 ; |        | $1284
    .byte $18 ; |   XX   | $1285
    .byte $08 ; |    X   | $1286
    .byte $1C ; |   XXX  | $1287
    .byte $3E ; |  XXXXX | $1288
    .byte $1E ; |   XXXX | $1289
    .byte $1C ; |   XXX  | $128A
    .byte $3C ; |  XXXX  | $128B
    .byte $3E ; |  XXXXX | $128C
    .byte $1C ; |   XXX  | $128D
    .byte $08 ; |    X   | $128E
    .byte $0C ; |    XX  | $128F
FireballSix:
    .byte $00 ; |        | $1290
    .byte $00 ; |        | $1291
    .byte $18 ; |   XX   | $1292
    .byte $18 ; |   XX   | $1293
    .byte $7E ; | XXXXXX | $1294
    .byte $7E ; | XXXXXX | $1295
    .byte $FF ; |XXXXXXXX| $1296
    .byte $FF ; |XXXXXXXX| $1297
    .byte $7E ; | XXXXXX | $1298
    .byte $7E ; | XXXXXX | $1299
    .byte $18 ; |   XX   | $129A
    .byte $18 ; |   XX   | $129B
FireballSeven:
    .byte $00 ; |        | $129C
    .byte $00 ; |        | $129D
    .byte $00 ; |        | $129E
    .byte $00 ; |        | $129F
    .byte $00 ; |        | $12A0
    .byte $04 ; |     X  | $12A1
    .byte $0E ; |    XXX | $12A2
    .byte $1E ; |   XXXX | $12A3
    .byte $0F ; |    XXXX| $12A4
    .byte $07 ; |     XXX| $12A5
    .byte $02 ; |      X | $12A6
FireballEight:
    .byte $00 ; |        | $12A7
    .byte $00 ; |        | $12A8
    .byte $00 ; |        | $12A9
    .byte $00 ; |        | $12AA
    .byte $00 ; |        | $12AB
    .byte $00 ; |        | $12AC
    .byte $18 ; |   XX   | $12AD
    .byte $3C ; |  XXXX  | $12AE
    .byte $3C ; |  XXXX  | $12AF
    .byte $3C ; |  XXXX  | $12B0
    .byte $18 ; |   XX   | $12B1
    .byte $00 ; |        | $12B2
    .byte $00 ; |        | $12B3
    .byte $00 ; |        | $12B4
    .byte $00 ; |        | $12B5
    .byte $00 ; |        | $12B6
L12B7:
    .byte $34 ; |  XX X  | $12B7   colors
    .byte $0F ; |    XXXX| $12B8
    .byte $1A ; |   XX X | $12B9
    .byte $0F ; |    XXXX| $12BA
    .byte $34 ; |  XX X  | $12BB
    .byte $0F ; |    XXXX| $12BC
    .byte $66 ; | XX  XX | $12BD
    .byte $1A ; |   XX X | $12BE
NusizZeroTab:
    .byte $00 ; |        | $12BF
    .byte $00 ; |        | $12C0
    .byte $00 ; |        | $12C1
    .byte $01 ; |       X| $12C2
    .byte $01 ; |       X| $12C3
    .byte $03 ; |      XX| $12C4
    .byte $03 ; |      XX| $12C5
NusizOneTab:
    .byte $00 ; |        | $12C6
    .byte $00 ; |        | $12C7
    .byte $00 ; |        | $12C8
    .byte $00 ; |        | $12C9
    .byte $01 ; |       X| $12CA
    .byte $01 ; |       X| $12CB
    .byte $03 ; |      XX| $12CC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L12CD SUBROUTINE
    ldx    #0                    ; 2
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    #$3C                  ; 2
    jsr    HorizPositiong        ; 6
    inx                          ; 2
    lda    #$44                  ; 2
    jsr    HorizPositiong        ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L12E3:
    lda    INTIM                 ; 4
    cmp    #$58                  ; 2
    bne    L12E3                 ; 2³
    ldx    #0                    ; 2
    stx    GRP0                  ; 3
    lda    #$50                  ; 2
    jsr    HorizPositiong        ; 6
    inx                          ; 2
    lda    #$50                  ; 2
    jsr    HorizPositiong        ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jsr    Waste47Cycles         ;47
    sta    HMCLR                 ; 3
    ldx    ram_CC                ; 3
    lda    L1117,X               ; 4
    sta    COLUP0                ; 3
    lda    L111B,X               ; 4
    sta    COLUP1                ; 3
    ldx    #$16                  ; 2
L1310:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    L10E1-1,X             ; 4
    sta    GRP0                  ; 3
    lda    L1101-1,X             ; 4
    sta    GRP1                  ; 3
    dex                          ; 2
    bne    L1310                 ; 2³
    stx    GRP1                  ; 3
    jmp    L1485                 ; 3

L1324:
    jsr    L1531                 ; 6
    lda    #$FF                  ; 2
    sta    TIM64T                ; 4
    lda    #$11                  ; 2
    jsr    L1AF0                 ; 6
L1331:
    lda    INTIM                 ; 4
    cmp    #$E0                  ; 2
    bne    L1331                 ; 2³
    ldy    #0                    ; 2
    sty    GRP0                  ; 3
    jsr    LoadPointers
    sta    HMCLR                 ; 3
    ldx    ram_CC                ; 3
    lda    L10B9,X               ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    #1                    ; 2
    stx    CTRLPF                ; 3
    dex                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    COLUPF                ; 3
    lda    #$FE                  ; 2
    sta    PF2                   ; 3
    lda    #$E5                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    ldx    #9                    ; 2
L135F:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    L135F                 ; 2³
    lda    #$1F                  ; 2
    jsr    L18E7                 ; 6
    ldx    #9                    ; 2
L136B:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    L136B                 ; 2³
    sta    PF2                   ; 3
    lda    ram_A9                ; 3
    bmi    L1390                 ; 2³
    bne    L138D                 ; 2³
    lda    ram_AA                ; 3
    bmi    L13BA                 ; 2³
    lda    ram_91                ; 3
    and    #$07                  ; 2
    bne    L13BA                 ; 2³
    lda    ram_83                ; 3
    lsr                          ; 2
    bcs    L1393                 ; 2³
    lsr                          ; 2
    bcs    L13A8                 ; 2³
    jmp    L13BA                 ; 3

L138D:
    jmp    L1485                 ; 3

L1390:
    jmp    L12E3                 ; 3

L1393:
    lda    $AB
    cmp    #<HardDiffculty          ; top level, can't go any higher
    beq    L13BA
    sec
    lda    ram_AB                   ; - don't need to do this, accumulator already holds value from $AB
    sbc    #8                       ; sprites are 8 bits tall, now at normal difficulty
    sta    $AB
    ldy    #$0C                  ; 2
    jsr    L173B                 ; 6
    jmp    L13BA                 ; 3

L13A8:
    lda    $AB
    cmp    #<EasyDifficulty         ; bottom level, can't go lower
    beq    L13BA
    clc
    lda    ram_AB                   ; again, you don't need to do this...
    adc    #8
    sta    ram_AB                   ; now at normal difficulty
    ldy    #$0C                  ; 2
    jsr    L173B                 ; 6
L13BA:
    lda    ram_AB                ; 3
    sta    ram_C0                ; 3
    lda    ram_CE                ; 3
    cmp    #$65                  ; 2
    bne    L13DC                 ; 2³
    lda    ram_91                ; 3
    and    #$0F                  ; 2
    cmp    #$0F                  ; 2
    bmi    L13EF                 ; 2³
    ldy    #$24                  ; 2
    jsr    L173B                 ; 6
    inc    ram_CD                ; 5
    lda    ram_CD                ; 3
    cmp    #$0F                  ; 2
    bne    L13EF                 ; 2³
    jmp    L14E9                 ; 3

L13DC:
    lda    ram_AA                ; 3
    bmi    L13ED                 ; 2³
    lda    ram_83                ; 3
    and    #$08                  ; 2
    beq    L13EF                 ; 2³
    ldy    #$0C                  ; 2
    jsr    L173B                 ; 6
    dec    ram_AA                ; 5
L13ED:
    inc    ram_CE                ; 5
L13EF:
    lda    INTIM                 ; 4
    cmp    #$7B                  ; 2
    bne    L13EF                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #0                    ; 2
    lda    ram_CE                ; 3
    jsr    HorizPositiong        ; 6
    inx                          ; 2
    lda    #$60                  ; 2
    jsr    HorizPositiong        ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #5                    ; 2
    sta    NUSIZ1                ; 3
    lda    ram_CE                ; 3
    cmp    #$65                  ; 2
    bne    L1418                 ; 2³
    lda    ram_91                ; 3
    jmp    L141D                 ; 3

L1418:
    ldx    ram_CC                ; 3
    lda    L109F,X               ; 4
L141D:
    sta    ram_EF                ; 3
    lda    ram_CD                ; 3
    sta    COLUP1                ; 3
    ldx    #$0A                  ; 2
    sta    HMCLR                 ; 3
L1427:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_E0,X              ; 4
    sta    GRP0                  ; 3
    cpx    #4                    ; 2
    bne    L1435                 ; 2³
    lda    #$0F                  ; 2
    bne    L1437                 ; 3   always branch

L1435:
    lda    ram_EF                ; 3
L1437:
    sta    COLUP0                ; 3
    lda    BlackHoleOne,X        ; 4
    sta    GRP1                  ; 3
    dex                          ; 2
    bpl    L1427                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    inx                          ; 2
    stx    GRP1                  ; 3
    lda    #$10                  ; 2
    jsr    L1AF0                 ; 6
    lda    ram_B3                ; 3
    bmi    L1485                 ; 2³
    lda    ram_8E                ; 3
    bne    L1458                 ; 2³
    ldy    #$36                  ; 2
    jsr    L173B                 ; 6
L1458:
    lda    INTIM                 ; 4
    cmp    #$4C                  ; 2
    bne    L1458                 ; 2³
    ldx    #0                    ; 2
    lda    #$50                  ; 2
    sta    ram_8E                ; 3
    jsr    HorizPositiong        ; 6
    ldx    ram_CC                ; 3
    lda    L10A1,X               ; 4
    sta    COLUP0                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jsr    Waste47Cycles         ;47
    sta    HMCLR                 ; 3
    ldy    #7                    ; 2
L147A:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_C0),Y            ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bne    L147A                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
L1485:
    lda    #$10                  ; 2
    jsr    L1AF0                 ; 6
L148A:
    lda    INTIM                 ; 4
    cmp    #$30                  ; 2
    bne    L148A                 ; 2³
    jsr    L12CD                 ; 6
    ldx    ram_CC                ; 3
    lda    L10A1,X               ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    ram_A9                ; 3
    bne    L14AB                 ; 2³
    ldy    #6                    ; 2
    jsr    LoadPointers
    lda    #6                    ; 2
    jmp    L14C4                 ; 3

L14AB:
    jsr    L1506                 ; 6
    lda    ram_AB                ; 3
    sta    ram_C0                ; 3
    ldx    ram_CC                ; 3
    lda    L109F,X               ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    ram_83                ; 3
    bpl    L14C2                 ; 2³
    jmp    START                 ; 3

L14C2:
    lda    #7                    ; 2
L14C4:
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    L18E7                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$0C                  ; 2
    jsr    LoadPointers
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_A9                ; 3
    bne    L14E5                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    #6                    ; 2
    jsr    L18E7                 ; 6
L14E5:
    lda    #0                    ; 2
    sta    PF1                   ; 3
L14E9:
    lda    INTIM                 ; 4
    bne    L14E9                 ; 2³
    lda    #$10                  ; 2
    sta    TIM64T                ; 4
L14F3:
    lda    INTIM                 ; 4
    bne    L14F3                 ; 2³
    lda    ram_CD                ; 3
    cmp    #$0F                  ; 2
    bne    L1503                 ; 2³+1
    inc    ram_B4                ; 5
    jmp    L1B08                 ; 3

L1503:
    jmp    L1324                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1506 SUBROUTINE
    ldx    #2                    ; 2
L1508:
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    ram_80,X              ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    sta.wy ram_C0,Y              ; 5
    lda    ram_80,X              ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta.wy ram_C2,Y              ; 5
    dex                          ; 2
    bpl    L1508                 ; 2³
    inx                          ; 2
L1522:
    lda    ram_C0,X              ; 4
    bne    L1530                 ; 2³
    lda    #$50                  ; 2
    sta    ram_C0,X              ; 4
    inx                          ; 2
    inx                          ; 2
    cpx    #$0A                  ; 2
    bne    L1522                 ; 2³
L1530:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1531 SUBROUTINE
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcs    L1540                 ; 2³
    jmp    START                 ; 3

L1540:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    ram_B3                ; 3
    bpl    L155D                 ; 2³
    lda    ram_B1                ; 3
    bne    L1580                 ; 2³
    ldy    #1                    ; 2
    lda    INPT5                 ; 3
    bpl    L1555                 ; 2³
    dey                          ; 2
    lda    INPT4                 ; 3
    bmi    L1580                 ; 2³
L1555:
    sty    ram_B3                ; 3
    tya                          ; 2
    tax                          ; 2
    lda    #$FF                  ; 2
    sta    ram_B1                ; 3
L155D:
    lda    SWCHA                 ; 4
    cpx    #0                    ; 2
    bne    L1568                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
L1568:
    and    #$0F                  ; 2
    eor    #$0F                  ; 2
    beq    L1570                 ; 2³
    ora    #$40                  ; 2
L1570:
    sta    ram_83                ; 3
    tay                          ; 2
    lda    ram_B1                ; 3
    bne    L1580                 ; 2³
    lda    INPT4,X               ; 4
    bmi    L1580                 ; 2³
    tya                          ; 2
    ora    #$80                  ; 2
    sta    ram_83                ; 3
L1580:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                    ; Vsync starts
    sta    WSYNC
    sta    WSYNC                    ; three scanlines
    lda    #0
    sta    WSYNC                    ; Vsync ends
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    VBLANK                ; 3
    lda    #$21                  ; 2
    sta    TIM64T                ; 4
    lda    #$87                  ; 2
    sta    COLUBK                ; 3
    sta    COLUPF                ; 3
    inc    ram_91                ; 5
    bne    L15A5                 ; 2³
    inc    ram_90                ; 5
L15A5:
    lda    ram_B1                ; 3
    beq    L15AB                 ; 2³
    dec    ram_B1                ; 5
L15AB:
    lda    ram_B4                ; 3
    bne    L15B2                 ; 2³
    jmp    L1676                 ; 3

L15B2:
    lda    ram_A9                ; 3
    bpl    L15BE                 ; 2³
    lda    ram_91                ; 3
    lsr                          ; 2
    bcs    L15BE                 ; 2³
    jsr    L1781                 ; 6
L15BE:
    lda    ram_A9                ; 3
    beq    L15C5                 ; 2³
    jmp    L1656                 ; 3

L15C5:
    lda    ram_AB                ; 3
    cmp    #$58                  ; 2
    beq    L15E1                 ; 2³
    lda    ram_91                ; 3
    and    #$03                  ; 2
    bne    L15E1                 ; 2³
    inc    ram_D4                ; 5
    bne    L15E1                 ; 2³
    inc    levelOfReadiness
    lda    levelOfReadiness
    cmp    #7                    ; 2
    bmi    L15E1                 ; 2³
    lda    #6                    ; 2
    sta    levelOfReadiness
L15E1:
    lda    ram_91                ; 3
    and    #$7F                  ; 2
    bne    L15F7                 ; 2³
    lda    ram_BB                ; 3
    cmp    #$5D                  ; 2
    bpl    L15F7                 ; 2³
    lda    ram_D8                ; 3
    and    #$03                  ; 2
    bne    L15F5                 ; 2³
    dec    ram_CF                ; 5
L15F5:
    inc    ram_D8                ; 5
L15F7:
    sec                          ; 2
    lda    ram_8F                ; 3
    sbc    #4                    ; 2
    cmp    ram_A7                ; 3
    bmi    L1609                 ; 2³
    sec                          ; 2
    lda    ram_D8                ; 3
    sbc    #5                    ; 2
    cmp    ram_A7                ; 3
    bmi    L1611                 ; 2³
L1609:
    inc    ram_A9                ; 5
    inc    ram_A9                ; 5
    lda    #$FF                  ; 2
    sta    ram_B1                ; 3
L1611:
    lda    ram_DF                ; 3
    beq    L162A                 ; 2³
    lda    ram_91                ; 3
    and    #$3F                  ; 2
    bne    L162A                 ; 2³
    clc                          ; 2
    sed                          ; 2
    lda    levelOfReadiness
    adc    ram_DA                ; 3
    sta    ram_DA                ; 3
    lda    #0                    ; 2
    adc    ram_D9                ; 3
    sta    ram_D9                ; 3
    cld                          ; 2
L162A:
    lda    ram_91                ; 3
    and    #$03                  ; 2
    bne    L1632                 ; 2³
    dec    ram_DE                ; 5
L1632:
    lda    ram_DE                ; 3
    bne    L1656                 ; 2³
    sed                          ; 2
    sec                          ; 2
    lda    ram_82                ; 3
    sbc    #$90                  ; 2
    sta    ram_82                ; 3
    lda    ram_81                ; 3
    sbc    #0                    ; 2
    sta    ram_81                ; 3
    lda    ram_80                ; 3
    sbc    #0                    ; 2
    sta    ram_80                ; 3
    cld                          ; 2
    lda    #$FF                  ; 2
    sta    ram_DE                ; 3
    dec    ram_8F                ; 5
    ldy    #0                    ; 2
    jsr    L173B                 ; 6
L1656:
    lda    ram_DA                ; 3
    bne    L1661                 ; 2³
    lda    ram_D9                ; 3
    bne    L1661                 ; 2³
    jmp    L1676                 ; 3

L1661:
    sed                          ; 2
    lda    ram_DA                ; 3
    clc                          ; 2
    adc    ram_82                ; 3
    sta    ram_82                ; 3
    lda    ram_81                ; 3
    adc    ram_D9                ; 3
    sta    ram_81                ; 3
    lda    ram_80                ; 3
    adc    #0                    ; 2
    sta    ram_80                ; 3
    cld                          ; 2
L1676:
    lda    #$10                  ; 2
    jsr    L1AF0                 ; 6
    ldx    #0                    ; 2
    stx    ram_DA                ; 3
    stx    ram_D9                ; 3
    lda    ram_80                ; 3
    cmp    #$99                  ; 2
    bne    L168D                 ; 2³
    stx    ram_80                ; 3
    stx    ram_81                ; 3
    stx    ram_82                ; 3
L168D:
    inx                          ; 2
L168E:
    lda    ram_8A,X              ; 4
    beq    L16FB                 ; 2³
    dec    ram_8A,X              ; 6
    bne    L16C3                 ; 2³
    lda    ram_8C,X              ; 4
    bpl    L16A9                 ; 2³
    clc                          ; 2
    lda    ram_84,X              ; 4
    adc    #6                    ; 2
    tay                          ; 2
    stx    ram_92                ; 3
    jsr    L173B                 ; 6
    ldx    ram_92                ; 3
    bpl    L16FB                 ; 2³
L16A9:
    cpx    #1                    ; 2
    beq    L16BD                 ; 2³
    lda    ram_A9                ; 3
    bne    L16BD                 ; 2³
    lda    #3                    ; 2
    sta    AUDC0                 ; 3
    sta    AUDV0                 ; 3
    lda    ram_CF                ; 3
    sta    AUDF0                 ; 3
    bne    L16FB                 ; 2³
L16BD:
    lda    #0                    ; 2
    sta    AUDV0,X               ; 4
    beq    L16FB                 ; 3   always branch

L16C3:
    lda    ram_8C,X              ; 4
    and    #$7F                  ; 2
    beq    L16FB                 ; 2³
    tay                          ; 2
    and    #$07                  ; 2
    asl                          ; 2
    and    ram_8A,X              ; 4
    bne    L16FB                 ; 2³
    tya                          ; 2
    and    #$40                  ; 2
    bne    L16DB                 ; 2³
    inc    ram_88,X              ; 6
    jmp    L16E2                 ; 3

L16DB:
    tya                          ; 2
    and    #$20                  ; 2
    bne    L16E6                 ; 2³
    dec    ram_88,X              ; 6
L16E2:
    lda    ram_88,X              ; 4
    sta    AUDV0,X               ; 4
L16E6:
    tya                          ; 2
    and    #$10                  ; 2
    bne    L16F0                 ; 2³
    inc    ram_86,X              ; 6
    jmp    L16F7                 ; 3

L16F0:
    tya                          ; 2
    and    #$08                  ; 2
    bne    L16FB                 ; 2³
    dec    ram_86,X              ; 6
L16F7:
    lda    ram_86,X              ; 4
    sta    AUDF0,X               ; 4
L16FB:
    dex                          ; 2
    bpl    L168E                 ; 2³
    lda    ram_B4                ; 3
    bne    L171F                 ; 2³
    lda    ram_90                ; 3
    and    #$03                  ; 2
    bne    L1718                 ; 2³
    lda    ram_91                ; 3
    bne    L1718                 ; 2³
    inc    ram_CC                ; 5
    lda    ram_CC                ; 3
    cmp    #4                    ; 2
    bmi    L1718                 ; 2³
    lda    #0                    ; 2
    sta    ram_CC                ; 3
L1718:
    ldx    ram_CC                ; 3
    lda    L109E,X               ; 4
    sta    COLUBK                ; 3
L171F:
    lda    ram_A9                ; 3
    cmp    #1                    ; 2
    bpl    L1731                 ; 2³
    lda    ram_91                ; 3
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    tax                          ; 2
    lda    ShipMiddleLightsGfx,X ; 4
    sta    ram_E4                ; 3
L1731:
    lda    INTIM                 ; 4
    bne    L1731                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L173B SUBROUTINE
    ldx    L11EA,Y               ; 4
    sty    ram_84,X              ; 4
    lda    L11EB,Y               ; 4
    sta    AUDC0,X               ; 4
    lda    L11EC,Y               ; 4
    sta    AUDF0,X               ; 4
    sta    ram_86,X              ; 4
    lda    L11ED,Y               ; 4
    sta    AUDV0,X               ; 4
    sta    ram_88,X              ; 4
    lda    L11EE,Y               ; 4
    sta    ram_8A,X              ; 4
    lda    L11EF,Y               ; 4
    sta    ram_8C,X              ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Waste47Cycles SUBROUTINE
    pha                          ; 3
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1769 SUBROUTINE
    bcc    L1770                 ; 2³
    lda    #$80                  ; 2
    sta    ram_A4                ; 3
    rts                          ; 6

L1770:
    lda    #0                    ; 2
    sta    ram_A4                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1775 SUBROUTINE
    bcc    L177C                 ; 2³
    lda    #$80                  ; 2
    sta    ram_A5                ; 3
    rts                          ; 6

L177C:
    lda    #0                    ; 2
    sta    ram_A5                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1781 SUBROUTINE
    lda    ram_83                ; 3
    and    #$04                  ; 2
    beq    L1793                 ; 2³
    dec    ram_A6                ; 5
    dec    ram_A6                ; 5
    lda    ram_DD                ; 3
    cmp    #8                    ; 2
    bcc    L1793                 ; 2³
    dec    ram_A6                ; 5
L1793:
    lda    ram_83                ; 3
    and    #$08                  ; 2
    beq    L17A5                 ; 2³
    inc    ram_A6                ; 5
    inc    ram_A6                ; 5
    lda    ram_DD                ; 3
    cmp    #8                    ; 2
    bcc    L17A5                 ; 2³
    inc    ram_A6                ; 5
L17A5:
    lda    ram_83                ; 3
    lsr                          ; 2
    bcc    L17BA                 ; 2³
    lda    ram_A7                ; 3
    cmp    #$6C                  ; 2
    bcs    L17D0                 ; 2³
    inc    ram_A7                ; 5
    lda    ram_DD                ; 3
    cmp    #8                    ; 2
    bcc    L17BA                 ; 2³
    inc    ram_A7                ; 5
L17BA:
    lda    ram_83                ; 3
    and    #$02                  ; 2
    beq    L17D0                 ; 2³
    lda    ram_A7                ; 3
    cmp    #$20                  ; 2
    bcc    L17D0                 ; 2³
    dec    ram_A7                ; 5
    lda    ram_DD                ; 3
    cmp    #8                    ; 2
    bcc    L17D0                 ; 2³
    dec    ram_A7                ; 5
L17D0:
    inc    ram_DD                ; 5
    lda    ram_83                ; 3
    and    #$0F                  ; 2
    bne    L17DC                 ; 2³
    lda    #0                    ; 2
    sta    ram_DD                ; 3
L17DC:
    lda    ram_A6                ; 3
    jsr    L17E4                 ; 6
    sta    ram_A6                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L17E4 SUBROUTINE
    cmp    #$A0                  ; 2
    bcc    L17F3                 ; 2³
    cmp    #$F0                  ; 2
    bcc    L17F1                 ; 2³
    clc                          ; 2
    adc    #$A0                  ; 2
    bne    L17F3                 ; 3   always branch

L17F1:
    and    #$0F                  ; 2
L17F3:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L17F4 SUBROUTINE
    sec                          ;2    @2
    lda    ram_B5                ;3    @5
    sbc    ram_B9                ;3    @8
    bcc    L1804                 ;2³+1 @10/12
    cmp    #4                    ;2    @12
    bcs    L1804                 ;2³+1 @14/16
    lda    ram_B7                ;3    @17
    sta    ENAM1                 ;3    @20
    rts                          ;6    @26

L1804:
    lda    #0                    ;2    @14/18
    sta    ENAM1                 ;3    @17/21
    rts                          ;6    @23/27   best case, worse case

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1809 SUBROUTINE
    sec                          ; 2
    lda    ram_D6                ; 3
    sbc    ram_B9                ; 3
    bcc    L181E                 ; 2³
    cmp    #$0F                  ; 2
    bcs    L181E                 ; 2³
    sty    ram_D7                ; 3
    tay                          ; 2
    lda    (ram_AD),Y            ; 5
    sta    GRP1                  ; 3
    ldy    ram_D7                ; 3
    rts                          ; 6

L181E:
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1823 SUBROUTINE
    lda    ram_91                ; 3
    and    #$07                  ; 2
    beq    L182C                 ; 2³
    jmp    L18E6                 ; 3

L182C:
    asl    ram_94                ; 5
    jsr    L1769                 ; 6
    lsr    ram_95                ; 5
    jsr    L1775                 ; 6
    lda    ram_95                ; 3
    ora    ram_A4                ; 3
    sta    ram_95                ; 3
    asl    ram_96                ; 5
    jsr    L1769                 ; 6
    lda    ram_A5                ; 3
    beq    L1847                 ; 2³
    inc    ram_96                ; 5
L1847:
    asl    ram_97                ; 5
    jsr    L1775                 ; 6
    lda    ram_A4                ; 3
    beq    L1856                 ; 2³
    lda    ram_97                ; 3
    ora    #$10                  ; 2
    sta    ram_97                ; 3
L1856:
    lsr    ram_98                ; 5
    jsr    L1769                 ; 6
    lda    ram_98                ; 3
    ora    ram_A5                ; 3
    sta    ram_98                ; 3
    asl    ram_99                ; 5
    jsr    L1775                 ; 6
    lda    ram_A4                ; 3
    beq    L186C                 ; 2³
    inc    ram_99                ; 5
L186C:
    lsr    ram_9A                ; 5
    jsr    L1769                 ; 6
    lda    ram_9A                ; 3
    ora    ram_A5                ; 3
    sta    ram_9A                ; 3
    lsr    ram_9B                ; 5
    jsr    L1775                 ; 6
    lda    ram_9B                ; 3
    ora    ram_A4                ; 3
    sta    ram_9B                ; 3
    lda    ram_A5                ; 3
    beq    L1888                 ; 2³
    inc    ram_94                ; 5
L1888:
    lsr    ram_9C                ; 5
    jsr    L1769                 ; 6
    asl    ram_9D                ; 5
    jsr    L1775                 ; 6
    lda    ram_A4                ; 3
    beq    L1898                 ; 2³
    inc    ram_9D                ; 5
L1898:
    asl    ram_9E                ; 5
    jsr    L1769                 ; 6
    lda    ram_A5                ; 3
    beq    L18A3                 ; 2³
    inc    ram_9E                ; 5
L18A3:
    lsr    ram_9F                ; 5
    jsr    L1775                 ; 6
    lda    ram_9F                ; 3
    ora    ram_A4                ; 3
    sta    ram_9F                ; 3
    asl    ram_A0                ; 5
    jsr    L1769                 ; 6
    lda    ram_A5                ; 3
    beq    L18B9                 ; 2³
    inc    ram_A0                ; 5
L18B9:
    lsr    ram_A1                ; 5
    lda    ram_A1                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    jsr    L1775                 ; 6
    lda    ram_A1                ; 3
    ora    ram_A4                ; 3
    sta    ram_A1                ; 3
    lsr    ram_A2                ; 5
    jsr    L1769                 ; 6
    lda    ram_A2                ; 3
    ora    ram_A5                ; 3
    sta    ram_A2                ; 3
    asl    ram_A3                ; 5
    jsr    L1775                 ; 6
    lda    ram_A4                ; 3
    beq    L18E0                 ; 2³
    inc    ram_A3                ; 5
L18E0:
    lda    ram_9C                ; 3
    ora    ram_A5                ; 3
    sta    ram_9C                ; 3
L18E6:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L18E7 SUBROUTINE
    sta    ram_92                ; 3
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #7                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
L18F5:
    ldy    ram_92                ; 3
    lda    (ram_CA),Y            ; 5
    sta    ram_93                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_C8),Y            ; 5
    tax                          ; 2
    lda    (ram_C0),Y            ; 5
    nop                          ; 2
    sta    GRP0                  ; 3
    lda    (ram_C2),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_C4),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_C6),Y            ; 5
    ldy    ram_93                ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_92                ; 5
    bpl    L18F5                 ; 2³+1
    lda    #0                    ; 2
    sta    VDELP0                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP1                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $1B ; |   XX XX| $1930
    nop                          ; 2
    lda    ram_F5                ; 3
    sta    PF2                   ; 3  unused code?
    lda    ram_F6                ; 3
    sta    PF1                   ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

HorizPositiong SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    sec                          ; 2
L193D:
    sbc    #$0F                  ; 2
    bcs    L193D                 ; 2³
    eor    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$90                  ; 2
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMP0,X                ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1950:
    lda    INTIM                 ; 4
    cmp    #$1F                  ; 2
    bne    L1950                 ; 2³
    lda    #0                    ; 2
    sta    ENAM1                 ; 3
    jsr    L12CD                 ; 6
    jsr    L1506                 ; 6
    lda    ram_AB                ; 3
    sta    ram_C0                ; 3
    sta    HMCLR                 ; 3
    lda    #$16                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #7                    ; 2
    jsr    L18E7                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    L1F15                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1979 SUBROUTINE
    lda    #$FF                  ; 2
    sta    ram_DE                ; 3
    sed                          ; 2
    clc                          ; 2
    lda    ram_DC                ; 3
    adc    #$10                  ; 2
    sta    ram_DC                ; 3
    lda    ram_DB                ; 3
    adc    #0                    ; 2
    sta    ram_DB                ; 3
    cld                          ; 2
    lda    ram_DC                ; 3
    sta    ram_DA                ; 3
    lda    ram_DB                ; 3
    sta    ram_D9                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1995 SUBROUTINE
    lda    ram_B8                ; 3
    cmp    #$60                  ; 2
    bmi    L19CF                 ; 2³
    jsr    L1979                 ; 6
    lda    ram_BB                ; 3
    cmp    #$5E                  ; 2
    beq    L19F4                 ; 2³
    bmi    L19BC                 ; 2³
    lda    ram_AB                ; 3
    cmp    #$68                  ; 2
    beq    L19C6                 ; 2³
    lda    ram_A0                ; 3
    and    #$18                  ; 2
    cmp    #$18                  ; 2
    beq    L19BD                 ; 2³
    lda    ram_A0                ; 3
    ora    #$18                  ; 2
    sta    ram_A0                ; 3
L19BA:
    dec    ram_BB                ; 5
L19BC:
    rts                          ; 6

L19BD:
    lda    ram_A0                ; 3
    ora    #$1C                  ; 2
    sta    ram_A0                ; 3
    dec    ram_BB                ; 5
    rts                          ; 6

L19C6:
    lda    ram_A0                ; 3
    ora    #$08                  ; 2
    sta    ram_A0                ; 3
    jmp    L19BA                 ; 3

L19CF:
    cmp    #$40                  ; 2
    bmi    L1A17                 ; 2³+1
    lda    ram_BB                ; 3
    cmp    #$53                  ; 2
    bne    L19F7                 ; 2³
    jsr    L1979                 ; 6
    lda    #$FF                  ; 2
    sta    ram_B1                ; 3
    lda    #0                    ; 2
    sta    ram_D1                ; 3
    lda    ram_D9                ; 3
    ora    #$50                  ; 2
    sta    ram_D9                ; 3
    dec    ram_D6                ; 5
    ldy    #6                    ; 2
    jsr    L173B                 ; 6
    dec    ram_A9                ; 5
    rts                          ; 6

L19F4:
    jmp    L1A77                 ; 3

L19F7:
    lda    ram_BA                ; 3
    cmp    #$29                  ; 2
    bmi    L1A16                 ; 2³+1
    lda    ram_BB                ; 3
    cmp    #$5E                  ; 2
    bpl    L1A16                 ; 2³
    jsr    L1979                 ; 6
    lda    #$34                  ; 2
    sta    ram_D2                ; 3
    inc    ram_D0                ; 5
    lda    ram_D0                ; 3
    lsr                          ; 2
    bcc    L1A14                 ; 2³
    jmp    L1A4B                 ; 3

L1A14:
    dec    ram_BB                ; 5
L1A16:
    rts                          ; 6

L1A17:
    cmp    #$20                  ; 2
    bmi    L1A4D                 ; 2³
    jsr    L1979                 ; 6
    lda    ram_BA                ; 3
    cmp    #$28                  ; 2
    beq    L1A57                 ; 2³
    bpl    L1A4D                 ; 2³
    lda    ram_AB                ; 3
    cmp    #$68                  ; 2
    beq    L1A4E                 ; 2³
    lda    ram_95                ; 3
    lsr                          ; 2
    bcs    L1A34                 ; 2³
    jmp    L1A3F                 ; 3

L1A34:
    lda    ram_96                ; 3
    lsr                          ; 2
    bcc    L1A3F                 ; 2³
    lda    ram_95                ; 3
    ora    #$02                  ; 2
    sta    ram_95                ; 3
L1A3F:
    lda    ram_95                ; 3
    ora    #$01                  ; 2
    sta    ram_95                ; 3
    lda    ram_96                ; 3
    ora    #$01                  ; 2
    sta    ram_96                ; 3
L1A4B:
    inc    ram_BA                ; 5
L1A4D:
    rts                          ; 6

L1A4E:
    lda    ram_96                ; 3
    ora    #$01                  ; 2
    sta    ram_96                ; 3
    jmp    L1A4B                 ; 3

L1A57:
    lda    ram_D9                ; 3
    ora    #$20                  ; 2
    sta    ram_D9                ; 3
    inc    ram_BA                ; 5
    lda    ram_BB                ; 3
    cmp    #$5E                  ; 2
    bmi    L1A6E                 ; 2³
    lda    #$70                  ; 2
    sta    ram_BF                ; 3
    lda    #0                    ; 2
    sta    ram_BE                ; 3
    rts                          ; 6

L1A6E:
    lda    #$50                  ; 2
    sta    ram_BF                ; 3
    lda    #$7E                  ; 2
    sta    ram_B2                ; 3
    rts                          ; 6

L1A77:
    lda    ram_D9                ; 3
    ora    #$20                  ; 2
    sta    ram_D9                ; 3
    dec    ram_BB                ; 5
    lda    ram_BA                ; 3
    cmp    #$29                  ; 2
    bpl    L1A6E                 ; 2³
    lda    #0                    ; 2
    sta    ram_BE                ; 3
    rts                          ; 6


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

START:
L1A8A:
    sei                          ; 2
    cld                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    inx                          ; 2
    txa                          ; 2
.loopClear:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    .loopClear            ; 2³

    dex                          ; 2
    stx    ram_DE                ; 3
    lda    #$FE                  ; 2
    sta    ram_B2                ; 3
    lda    #$60                  ; 2
    sta    ram_AB                ; 3
    lda    #$80                  ; 2
    sta    ram_B3                ; 3
    lda    #$39                  ; 2
    sta    ram_CE                ; 3
    lda    #$5A                  ; 2
    sta    ram_A7                ; 3
    sta    ram_B5                ; 3
    lda    #$65                  ; 2
    sta    ram_B6                ; 3
    sta    ram_A6                ; 3
    lda    #$13                  ; 2
    sta    ram_BA                ; 3
    lda    #$73                  ; 2
    sta    ram_BB                ; 3
    lda    #$25                  ; 2
    sta    ram_D8                ; 3
    lda    #$30                  ; 2
    sta    ram_BF                ; 3
    lda    #$0F                  ; 2
    sta    ram_D1                ; 3
    lda    #$1E                  ; 2
    sta    ram_D2                ; 3
    sta    ram_CF                ; 3
    lda    #$12                  ; 2
    sta    ram_AE                ; 3
    lda    #$20                  ; 2
    sta    ram_B1                ; 3
    ldx    #6                       ; maximum level, display 6 ships
    stx    levelOfReadiness
    lda    #4                    ; 2
    sta    ram_BE                ; 3
    ldx    #$0A                  ; 2
L1AE1:
    lda    ShipGfx,X
    sta    ram_E1,X                 ; $E1 - $EB
    dex                          ; 2
    bpl    L1AE1                 ; 2³
    lda    #$6F                  ; 2
    sta    ram_8F                ; 3
    jmp    L1324                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1AF0 SUBROUTINE
    ldx    #$0A                  ; 2
L1AF2:
    sta    ram_C1,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    L1AF2                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Y = 0, 6, or 12

LoadPointers SUBROUTINE
    ldx    #0                    ; 2
.loopGetPointers:
    lda    PointersTab,Y         ; 4
    sta    ram_C0,X              ; 4
    iny                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #$0C                  ; 2
    bne    .loopGetPointers
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1B08:
    jsr    L1531                 ; 6
    ldx    #$FF                  ; 2
    stx    TIM64T                ; 4
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    stx    CXCLR                 ; 3
    lda    #$39                  ; 2
    sta    ram_CE                ; 3
    inx                             ; X=$3A
    stx    ram_CD                ; 3
    stx    ram_B8                ; 3
    lda    ram_D2                ; 3
    sta    COLUBK                ; 3
    lda    #7                    ; 2
    sta    CTRLPF                ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    ram_BA                ; 3
    jsr    HorizPositiong        ; 6
    inx                          ; 2
    lda    ram_BB                ; 3
    jsr    HorizPositiong        ; 6
    inx                          ; 2
    lda    #$4A                  ; 2
    jsr    HorizPositiong        ; 6
    inx                          ; 2
    lda    #$5F                  ; 2
    jsr    HorizPositiong        ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    #$85                  ;2  @5
    sta    COLUPF                ;3  @8
    ldx    #9                    ;2  @10
    lda    #$19                  ;2  @12
    sta    COLUP0                ;3  @15
    sta    COLUP1                ;3  @18
    jsr    Waste47Cycles         ;47 @65
    sta    HMCLR                 ;3  @68
L1B59:
    sta    WSYNC                 ;3  @25/71
;---------------------------------------
    ldy    #$FF                  ;2  @2
    sty    GRP0                  ;3  @5
    sty    GRP1                  ;3  @8
    sty    ENAM0                 ;3  @11
    sty    ENAM1                 ;3  @14
    iny                          ;2  @16
    sty    PF2                   ;3  @19
    dex                          ;2  @21
    bne    L1B59                 ;2³ @23/24
    dex                          ;2  @25
    stx    PF2                   ;3  @28
    lda    ram_D1                ;3  @31
    sta    COLUP0                ;3  @34
    inx                          ;2  @36
    stx    GRP0                  ;3  @39
    stx    GRP1                  ;3  @42
    stx    ENAM0                 ;3  @45
    stx    ENAM1                 ;3  @48
    stx    COLUBK                ;3  @51
    inx                          ;2  @53
    stx    CTRLPF                ;3  @56
    lda    #$10                  ;2  @58
    sta    NUSIZ1                ;3  @61
    sta    WSYNC                 ;3  @64
;---------------------------------------
    lda    #$87                  ; 2
    sta    COLUPF                ; 3
    sec                          ; 2
    lda    #$80                  ; 2
    sbc    ram_A7                ; 3
    sta    ram_AC                ; 3
    lda    #$27                  ; 2
    sta    COLUP1                ; 3
    ldx    #3                    ; 2
    lda    ram_B6                ; 3
    clc                          ; 2
    adc    #4                    ; 2
    jsr    HorizPositiong        ; 6
    lda    ram_BE                ; 3
    sta    NUSIZ0                ; 3
    lda    ram_BF                ; 3
    ldx    #0                    ; 2
    jsr    HorizPositiong        ; 6
    lda    ram_D6                ; 3
    cmp    #$20                  ; 2
    bpl    L1BF9                 ; 2³
    lda    ram_A9                ; 3
    bne    L1BCC                 ; 2³
    lda    ram_DF                ; 3
    beq    L1BCC                 ; 2³
    lda    ram_AB                ; 3
    cmp    #$58                  ; 2
    beq    L1BD6                 ; 2³
    cmp    #$60                  ; 2
    beq    L1BCF                 ; 2³
    lda    ram_91                ; 3
    rol                          ; 2
    lda    ram_90                ; 3
    rol                          ; 2
    and    #$03                  ; 2
L1BCA:
    beq    L1BD6                 ; 2³
L1BCC:
    jmp    L1C5A                 ; 3

L1BCF:
    lda    ram_91                ; 3
    and    #$80                  ; 2
    jmp    L1BCA                 ; 3

L1BD6:
    lda    #$A0                  ; 2
    sta    ram_D6                ; 3
    lda    ram_BE                ; 3
    bne    L1BE3                 ; 2³
    lda    ram_BF                ; 3
    jmp    L1BF0                 ; 3

L1BE3:
    lda    ram_A6                ; 3
    cmp    #$54                  ; 2
    bpl    L1BEE                 ; 2³
    lda    #$30                  ; 2
    jmp    L1BF0                 ; 3

L1BEE:
    lda    #$70                  ; 2
L1BF0:
    sta    ram_AF                ; 3
    sta    ram_D5                ; 3
    ldy    #$3C                  ; 2
    jsr    L173B                 ; 6
L1BF9:
    dec    ram_D6                ; 5
    lda    ram_D5                ; 3
    jsr    L17E4                 ; 6
    sta    ram_D5                ; 3
    ldx    #1                    ; 2
    jsr    HorizPositiong        ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #4                    ; 2
    lda    ram_AF                ; 3
    clc                          ; 2
    adc    #4                    ; 2
    jsr    HorizPositiong        ; 6
    lda    #0                    ; 2
    sta    ENABL                 ; 3
    ldy    #0                    ; 2
    sty    GRP0                  ; 3
    lda    ram_D6                ; 3
    cmp    #$8A                  ; 2
    bpl    L1C5A                 ; 2³
    lda    ram_D5                ; 3
    cmp    ram_A6                ; 3
    beq    L1C5A                 ; 2³
    bpl    L1C43                 ; 2³
    lda    ram_91                ; 3
    and    #$07                  ; 2
    bne    L1C31                 ; 2³
    inc    ram_D5                ; 5
L1C31:
    inc    ram_D5                ; 5
    sec                          ; 2
    lda    ram_A6                ; 3
    sbc    ram_D5                ; 3
    cmp    #$20                  ; 2
    bmi    L1C5A                 ; 2³
    inc    ram_D6                ; 5
    inc    ram_D5                ; 5
    jmp    L1C5A                 ; 3

L1C43:
    lda    ram_91                ; 3
    and    #$07                  ; 2
    bne    L1C4B                 ; 2³
    dec    ram_D5                ; 5
L1C4B:
    dec    ram_D5                ; 5
    sec                          ; 2
    lda    ram_D5                ; 3
    sbc    ram_A6                ; 3
    cmp    #$20                  ; 2
    bmi    L1C5A                 ; 2³
    inc    ram_D6                ; 5
    dec    ram_D5                ; 5
L1C5A:
    lda    ram_91                ; 3
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    L1245,X               ; 4
    sta    ram_AD                ; 3
L1C66:
    lda    INTIM                 ; 4
    cmp    #$DA                  ; 2
    bne    L1C66                 ; 2³

    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    #$83                  ;2  @5
    sta    COLUPF                ;3  @8
    lda    ram_91                ;3  @11
    lsr                          ;2  @13
    lsr                          ;2  @15
    and    #$07                  ;2  @17
    sta    ram_93                ;3  @20
    jsr    Waste47Cycles         ;47 @67
    sta    HMCLR                 ;3  @70
    sty    PF0                   ;3  @73
    lda    ram_B2                ;3  @76
;---------------------------------------
    sta    PF2                   ;3  @3
    ldy    #5                    ;2  @5
    lda    #$B1                  ;2  @7
    sta    ram_B9                ;3  @10
L1C8E:
    lda    L10D5-1,Y             ;4  @14/23
    sta    PF1                   ;3  @17/26
    ldx    #6                    ;2  @19/28
L1C95:
    dec    ram_B9                ;5  @20..33
    sec                          ;2  @22..35
    lda    ram_B5                ;3  @25..38
    sbc    ram_B9                ;3  @28..41
    bcc    L1CA9                 ;2³ @30/31..43/44
    cmp    #4                    ;2  @32..45
    bcs    L1CA9                 ;2³ @34/35..47/48
    lda    ram_B7                ;3  @37..50
    sta    ENAM1                 ;3  @40..53
    jmp    L1CAD                 ;3  @43..56

L1CA9:
    lda    #0                    ;2  @33..50
    sta    ENAM1                 ;3  @36..53
L1CAD:
    stx    ram_92                ;3  @39..59
    txa                          ;2  @41..61
    clc                          ;2  @43..63
    lda    ram_93                ;3  @46..66
    adc    ram_92                ;3  @49..69
    tax                          ;2  @51..71
    sta    WSYNC                 ;3  @54..74
;---------------------------------------
    lda    L10CF-1,X             ;4  @4
    sta    GRP0                  ;3  @7
    ldx    ram_92                ;3  @10
    dex                          ;2  @12
    bne    L1C95                 ;2³ @14/15
    dey                          ;2  @16
    bne    L1C8E                 ;2³ @18/19
    sty    PF1                   ;3  @21
    lda    #$83                  ;2  @23
    sta    COLUP0                ;3  @26
    lda    #$FF                  ;2  @28
    sta    GRP0                  ;3  @31
    ldx    #2                    ;2  @33
L1CD1:
    sta    WSYNC                 ;3  @36..48
;---------------------------------------
    dec    ram_B9                ;5  @5
    jsr    L17F4                 ;6  @34..38
    dex                          ;2  @36..40
    bne    L1CD1                 ;2³ @38/39..42/43
    sta    WSYNC                 ;3  @41..45
;---------------------------------------
    dec    ram_B9                ;5  @5
    stx    PF2                   ;3  @8
    lda    #$37                  ;2  @10
    sta    COLUP0                ;3  @13
    lda    #$0F                  ;2  @15
    sta    COLUPF                ;3  @18
    lda    #$10                  ;2  @20
    sta    CTRLPF                ;3  @23
    ldy    #7                    ;2  @25
L1CEF:
    sta    WSYNC                 ; 3
;---------------------------------------
    dec    ram_B9                ; 5
    lda    L10DA-1,Y             ; 4
    sta    GRP0                  ; 3
    jsr    L17F4                 ; 6
    dey                          ; 2
    bne    L1CEF                 ; 2³
    lda    CXM1P                 ; 3
    bpl    L1D06                 ; 2³
    lda    ram_B6                ; 3
    sta    ram_B8                ; 3
L1D06:
    lda    ram_A9                ; 3
    bmi    L1D19                 ; 2³
    cmp    #1                    ; 2
    beq    L1D19                 ; 2³
    lda    ram_91                ; 3
    lsr                          ; 2
    bcc    L1D16                 ; 2³
    jmp    L1D19                 ; 3

L1D16:
    jmp    L1DBD                 ; 3

L1D19:
    ldy    #$FF                  ; 2
    lda    ram_DF                ; 3
    beq    L1D25                 ; 2³
    lda    ram_D6                ; 3
    cmp    #$90                  ; 2
    bcs    L1D27                 ; 2³
L1D25:
    ldy    #0                    ; 2
L1D27:
    sty    ENABL                 ; 3
    lda    #0                    ; 2
    sta    ENAM1                 ; 3
    tax                          ; 2
    lda    ram_A6                ; 3
    jsr    HorizPositiong        ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    ram_AC                ; 3
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    lda    ram_91                ; 3
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    L12B7,X               ; 4
    sta    COLUP1                ; 3
    jsr    Waste47Cycles         ;47
    sta    HMCLR                 ; 3
L1D4E:
    sta    WSYNC                 ; 3
;---------------------------------------
    dec    ram_B9                ; 5
    jsr    L1809                 ; 6
    lda    #0                    ; 2
    sta    ENABL                 ; 3
    dey                          ; 2
    bne    L1D4E                 ; 2³
    ldy    #7                    ; 2
    ldx    levelOfReadiness
L1D60:
    dec    ram_B9                ; 5
    jsr    L1809                 ; 6
    lda.wy ram_E1,Y              ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    L1236,Y               ; 4
    ora    L123E,X               ; 4
    sta    COLUP0                ; 3
    dey                          ; 2
    bpl    L1D60                 ; 2³
L1D77:
    sta    WSYNC                 ; 3
;---------------------------------------
    dec    ram_B9                ; 5
    jsr    L1809                 ; 6
    lda    INTIM                 ; 4
    cmp    #$28                  ; 2
    bpl    L1D77                 ; 2³
    lda    ram_D3                ; 3
    bne    L1DAE                 ; 2³
    lda    CXPPMM                ; 3
    and    #$80                  ; 2
    beq    L1DB0                 ; 2³
    lda    #$30                  ; 2
    sta    ram_D3                ; 3
    ldy    #$2A                  ; 2
    jsr    L173B                 ; 6
    lda    #0                    ; 2
    sta    ram_D4                ; 3
    dec    levelOfReadiness
    bpl    L1DB0                 ; 2³
    inc    ram_A9                ; 5
    inc    ram_A9                ; 5
    lda    #$FF                  ; 2
    sta    ram_B1                ; 3
    asl                          ; 2
    sta    levelOfReadiness
    jmp    L1DB0                 ; 3

L1DAE:
    dec    ram_D3                ; 5
L1DB0:
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    sta    ENABL                 ; 3
    sta    GRP0                  ; 3
    sta    ENAM0                 ; 3
    jmp    L1950                 ; 3

L1DBD:
    ldy    #4                    ; 2
    lda    #0                    ; 2
    sta    ENABL                 ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    ldx    #5                    ; 2
L1DC9:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$0F                  ; 2
    sta    COLUPF                ; 3
    dec    ram_B9                ; 5
    jsr    L17F4                 ; 6
    dex                          ; 2
    bne    L1DC9                 ; 2³
L1DD7:
    lda    ram_BC                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    dec    ram_B9                ; 5
    lda    ram_94                ; 3
    sta    PF0                   ; 3
    lda    ram_95                ; 3
    sta    PF1                   ; 3
    lda    ram_96,X              ; 4
    sta    PF2                   ; 3
    lda    ram_97,X              ; 4
    sta    PF0                   ; 3
    lda    ram_98,X              ; 4
    sta    PF1                   ; 3
    lda    ram_99,X              ; 4
    sta    PF2                   ; 3
    dec    ram_B9                ; 5
    cpy    #3                    ; 2
    bne    L1E01                 ; 2³+1
    lda    #0                    ; 2
    sta    ENAM1                 ; 3
L1E01:
    dey                          ; 2
    bne    L1DD7                 ; 2³+1
    sta    WSYNC                 ; 3
;---------------------------------------
    dec    ram_B9                ; 5
    sty    COLUBK                ; 3
    sty    PF0                   ; 3
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    ldx    #4                    ; 2
L1E12:
    sta    WSYNC                 ; 3
;---------------------------------------
    dec    ram_B9                ; 5
    jsr    L17F4                 ; 6
    dex                          ; 2
    bne    L1E12                 ; 2³
    ldy    #4                    ; 2
    ldx    #8                    ; 2
L1E20:
    lda    ram_BD                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    dec    ram_B9                ; 5
    lda    ram_94,X              ; 4
    sta    PF0                   ; 3
    lda    ram_9B,X              ; 4
    sta    PF1                   ; 3
    lda    ram_9A,X              ; 4
    sta    PF2                   ; 3
    lda    ram_99,X              ; 4
    sta    PF0                   ; 3
    lda    ram_98,X              ; 4
    sta    PF1                   ; 3
    lda    ram_97,X              ; 4
    sta    PF2                   ; 3
    cpy    #3                    ; 2
    bne    L1E48                 ; 2³
    lda    #0                    ; 2
    sta    ENAM1                 ; 3
L1E48:
    dey                          ; 2
    bne    L1E20                 ; 2³
L1E4B:
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    COLUBK                ; 3
    sty    PF0                   ; 3
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    dec    ram_B9                ; 5
    jsr    L17F4                 ; 6
    lda    ram_B9                ; 3
    cmp    ram_8F                ; 3
    bpl    L1E4B                 ; 2³
    ldx    #3                    ; 2
L1E62:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_BC                ; 3
    sta    COLUBK                ; 3
    dec    ram_B9                ; 5
    jsr    L17F4                 ; 6
    dex                          ; 2
    bne    L1E62                 ; 2³
L1E70:
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    COLUBK                ; 3
    dec    ram_B9                ; 5
    jsr    L17F4                 ; 6
    clc                          ; 2
    lda    ram_B9                ; 3
    adc    #$0A                  ; 2
    cmp    ram_D8                ; 3
    bpl    L1E70                 ; 2³
    lda    ram_91                ; 3
    and    #$E0                  ; 2
    ora    #$07                  ; 2
    ldx    #4                    ; 2
L1E8A:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    dex                          ; 2
    bne    L1E8A                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    COLUBK                ; 3
    lda    ram_83                ; 3
    bmi    L1ED8                 ; 2³
    sec                          ; 2
    lda    ram_A9                ; 3
    bne    L1EA5                 ; 2³
    jsr    L1781                 ; 6
    lda    ram_E0                ; 3
    bne    L1ECD                 ; 2³
L1EA5:
    ldx    #0                    ; 2
    stx    ram_E0                ; 3
    lda    ram_A7                ; 3
    sta    ram_B5                ; 3
    lda    ram_A6                ; 3
    sta    ram_B6                ; 3
    dex                          ; 2
    stx    ram_B7                ; 3
    lda    ram_83                ; 3
    lsr                          ; 2
    bcc    L1EBB                 ; 2³
    inc    ram_B5                ; 5
L1EBB:
    lsr                          ; 2
    bcc    L1EC0                 ; 2³
    dec    ram_B5                ; 5
L1EC0:
    lsr                          ; 2
    bcc    L1EC5                 ; 2³
    dec    ram_B6                ; 5
L1EC5:
    lsr                          ; 2
    bcc    L1ECA                 ; 2³
    inc    ram_B6                ; 5
L1ECA:
    jmp    L1F0E                 ; 3

L1ECD:
    inc    ram_B5                ; 5
    lda    #$B3                  ; 2
    cmp    ram_B5                ; 3
    bcc    L1EA5                 ; 2³
    jmp    L1F0E                 ; 3

L1ED8:
    lda    #1                    ; 2
    sta    ram_DF                ; 3
    lda    #$FF                  ; 2
    sta    ram_D7                ; 3
    lda    ram_83                ; 3
    and    #$04                  ; 2
    beq    L1EE8                 ; 2³
    dec    ram_B6                ; 5
L1EE8:
    lda    ram_83                ; 3
    and    #$08                  ; 2
    beq    L1EF0                 ; 2³
    inc    ram_B6                ; 5
L1EF0:
    lda    ram_83                ; 3
    lsr                          ; 2
    bcc    L1EF7                 ; 2³
    inc    ram_B5                ; 5
L1EF7:
    lda    ram_B6                ; 3
    jsr    L17E4                 ; 6
    sta    ram_B6                ; 3
    inc    ram_E0                ; 5
    lda    ram_E0                ; 3
    cmp    #1                    ; 2
    bne    L1F0B                 ; 2³
    ldy    #$1E                  ; 2
    jsr    L173B                 ; 6
L1F0B:
    jmp    L1ECD                 ; 3

L1F0E:
    lda    #0                    ; 2
    sta    ENAM1                 ; 3
    jmp    L1950                 ; 3

L1F15:
    lda    #$87                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    levelOfReadiness
    cpx    #0                       ; compare to no ships
    beq    L1F4F                 ; 2³
    bmi    L1F4F                 ; 2³
    lda    #NusizZeroTab,X
    sta    NUSIZ0
    lda    NusizOneTab,X
    sta    NUSIZ1
    lda    #<LivesDisplay
    sta    ram_C0                ; 3
    cpx    #1                    ; 2
    bne    L1F37                 ; 2³
    lda    #$50                  ; 2
L1F37:
    sta    ram_C2                ; 3
    ldy    #4                    ; 2
L1F3B:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_C0),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_C2),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    bpl    L1F3B                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    iny                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
L1F4F:
    lda    INTIM                 ; 4
    bne    L1F4F                 ; 2³
    lda    #$10                  ; 2
    sta    TIM64T                ; 4
    jsr    L1823                 ; 6
    lda    CXM1P                 ; 3
    bpl    L1F68                 ; 2³
    ldy    #$18                  ; 2
    jsr    L173B                 ; 6
    jmp    L1F71                 ; 3

L1F68:
    lda    CXM1FB                ; 3
    bpl    L1F84                 ; 2³
    ldy    #$12                  ; 2
    jsr    L173B                 ; 6
L1F71:
    ldx    #0                    ; 2
    stx    ram_E0                ; 3
    lda    ram_A7                ; 3
    sta    ram_B5                ; 3
    lda    ram_A6                ; 3
    sta    ram_B6                ; 3
    dex                          ; 2
    stx    ram_B7                ; 3
    lda    #$0A                  ; 2
    sta    ram_B1                ; 3
L1F84:
    jsr    L1995                 ; 6
    lda    ram_91                ; 3
    and    #$F0                  ; 2
    ora    #$08                  ; 2
    sta    ram_BC                ; 3
    eor    #$F0                  ; 2
    sta    ram_BD                ; 3
    sta    ENAM0                 ; 3
    lda    ram_A9                ; 3
    bmi    L1FC1                 ; 2³
    bne    L1FA3                 ; 2³
L1F9B:
    lda    INTIM                 ; 4
    bne    L1F9B                 ; 2³
    jmp    L1B08                 ; 3

L1FA3:
    lda    #0                    ; 2
    sta    ram_83                ; 3
    sta    ram_DF                ; 3
    sta    ram_B7                ; 3
    lda    ram_91                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    ram_E1,X              ; 4
    ldy    ram_91                ; 3
    and    L1A8A,Y               ; 4
    sta    ram_E1,X              ; 4
    ldy    #$30                  ; 2
    jsr    L173B                 ; 6
L1FC1:
    lda    ram_B1                ; 3
    bne    L1F9B                 ; 2³
    lda    #$80                  ; 2
    sta    ram_B1                ; 3
    dec    ram_B4                ; 5
    jmp    L14E9                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;all this code is unused...

    lda    $1237,Y               ; 4   this area of data has nothing to do with color, now
    sta    COLUP1                ; 3
    rts                          ; 6

    pha                          ; 3
    pla                          ; 4
    brk                          ; 7
    nop                          ; 2
    lda    ram_8F,X              ; 4
    sty    COLUBK                ; 3
    brk                          ; 7
    nop                          ; 2
    lda    #0                    ; 2
    sta    COLUBK                ; 3
    rts                          ; 6

;$1FE3  it looks like break was originally used...
    ror    ram_8F                ; 5
    rti                          ; 6

    sta    WSYNC                 ; 3
;---------------------------------------
    sec                          ; 2
L1FE9:
    sbc    #$0F                  ; 2
    bcs    L1FE9                 ; 2³   This horizontal positioning routine isn't used. The horizontal
    eor    #$0F                  ; 2    positioning routine that is used is located at $193A.
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$90                  ; 2
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMP0,X                ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ORG $1FFC

    .word START
    .word $1FE3