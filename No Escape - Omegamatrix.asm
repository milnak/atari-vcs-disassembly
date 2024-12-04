; Disassembly of noesntsc.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcnoesc.cfg noesntsc.bin 
;
; noesc.cfg contents:
;
;      ORG 1000
;      GFX 1000 1197
;      CODE 1198 1253
;      GFX 1254 1288
;      CODE 1289 13DA
;      DATA 13DB 13DF
;      CODE 13E0 13EC
;      DATA 13ED 1414
;      CODE 1415 1A5D
;      DATA 1A5E 1AF2
;      CODE 1AF3 1BA5
;      DATA 1BA6 1BBA
;      CODE 1BBB 1CE0
;      DATA 1CE1 1CF5
;      CODE 1CF6 1D4B
;      DATA 1D4C 1D60
;      GFX 1D61 1DB0
;      DATA 1DB1 1DBA
;      CODE 1DBB 1FE6
;      DATA 1FE7 1FFF
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
CTRLPF  =  $0A
REFP0   =  $0B
REFP1   =  $0C
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
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
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM1    =  $23
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
SWCHA   =  $0280
SWCHB   =  $0282
$0285   =  $0285
TIM64T  =  $0296

       ORG $1000
    .byte $04 ; |     X  | $1000
    .byte $24 ; |  X  X  | $1001
    .byte $24 ; |  X  X  | $1002
    .byte $28 ; |  X X   | $1003
    .byte $28 ; |  X X   | $1004
    .byte $28 ; |  X X   | $1005
    .byte $18 ; |   XX   | $1006
    .byte $10 ; |   X    | $1007
    .byte $B9 ; |X XXX  X| $1008
    .byte $91 ; |X  X   X| $1009
    .byte $BD ; |X XXXX X| $100A
    .byte $7E ; | XXXXXX | $100B
    .byte $08 ; |    X   | $100C
    .byte $18 ; |   XX   | $100D
    .byte $24 ; |  X  X  | $100E
    .byte $18 ; |   XX   | $100F
    .byte $10 ; |   X    | $1010
    .byte $18 ; |   XX   | $1011
    .byte $18 ; |   XX   | $1012
    .byte $08 ; |    X   | $1013
    .byte $10 ; |   X    | $1014
    .byte $18 ; |   XX   | $1015
    .byte $18 ; |   XX   | $1016
    .byte $10 ; |   X    | $1017
    .byte $3C ; |  XXXX  | $1018
    .byte $14 ; |   X X  | $1019
    .byte $3C ; |  XXXX  | $101A
    .byte $18 ; |   XX   | $101B
    .byte $10 ; |   X    | $101C
    .byte $30 ; |  XX    | $101D
    .byte $48 ; | X  X   | $101E
    .byte $30 ; |  XX    | $101F
    .byte $22 ; |  X   X | $1020
    .byte $22 ; |  X   X | $1021
    .byte $44 ; | X   X  | $1022
    .byte $44 ; | X   X  | $1023
    .byte $48 ; | X  X   | $1024
    .byte $28 ; |  X X   | $1025
    .byte $10 ; |   X    | $1026
    .byte $78 ; | XXXX   | $1027
    .byte $52 ; | X X  X | $1028
    .byte $7E ; | XXXXXX | $1029
    .byte $3A ; |  XXX X | $102A
    .byte $1C ; |   XXX  | $102B
    .byte $30 ; |  XX    | $102C
    .byte $48 ; | X  X   | $102D
    .byte $30 ; |  XX    | $102E
    .byte $00 ; |        | $102F
    .byte $00 ; |        | $1030
    .byte $06 ; |     XX | $1031
    .byte $32 ; |  XX  X | $1032
    .byte $1C ; |   XXX  | $1033
    .byte $18 ; |   XX   | $1034
    .byte $18 ; |   XX   | $1035
    .byte $19 ; |   XX  X| $1036
    .byte $1D ; |   XXX X| $1037
    .byte $1F ; |   XXXXX| $1038
    .byte $8F ; |X   XXXX| $1039
    .byte $9B ; |X  XX XX| $103A
    .byte $DF ; |XX XXXXX| $103B
    .byte $FF ; |XXXXXXXX| $103C
    .byte $EF ; |XXX XXXX| $103D
    .byte $3D ; |  XXXX X| $103E
    .byte $15 ; |   X X X| $103F
    .byte $31 ; |  XX   X| $1040
    .byte $1B ; |   XX XX| $1041
    .byte $33 ; |  XX  XX| $1042
    .byte $D7 ; |XX X XXX| $1043
    .byte $57 ; | X X XXX| $1044
    .byte $53 ; | X X  XX| $1045
    .byte $7B ; | XXXX XX| $1046
    .byte $1F ; |   XXXXX| $1047
    .byte $1F ; |   XXXXX| $1048
    .byte $07 ; |     XXX| $1049
    .byte $02 ; |      X | $104A
    .byte $86 ; |X    XX | $104B
    .byte $FC ; |XXXXXX  | $104C
    .byte $DC ; |XX XXX  | $104D
    .byte $3C ; |  XXXX  | $104E
    .byte $14 ; |   X X  | $104F
    .byte $30 ; |  XX    | $1050
    .byte $18 ; |   XX   | $1051
    .byte $30 ; |  XX    | $1052
    .byte $D1 ; |XX X   X| $1053
    .byte $53 ; | X X  XX| $1054
    .byte $57 ; | X X XXX| $1055
    .byte $7B ; | XXXX XX| $1056
    .byte $1F ; |   XXXXX| $1057
    .byte $1F ; |   XXXXX| $1058
    .byte $07 ; |     XXX| $1059
    .byte $02 ; |      X | $105A
    .byte $8E ; |X   XXX | $105B
    .byte $FC ; |XXXXXX  | $105C
    .byte $EC ; |XXX XX  | $105D
    .byte $3C ; |  XXXX  | $105E
    .byte $14 ; |   X X  | $105F
    .byte $80 ; |X       | $1060
    .byte $CC ; |XX  XX  | $1061
    .byte $E7 ; |XXX  XXX| $1062
    .byte $65 ; | XX  X X| $1063
    .byte $7F ; | XXXXXXX| $1064
    .byte $7F ; | XXXXXXX| $1065
    .byte $7E ; | XXXXXX | $1066
    .byte $EE ; |XXX XXX | $1067
    .byte $0F ; |    XXXX| $1068
    .byte $0E ; |    XXX | $1069
    .byte $0E ; |    XXX | $106A
    .byte $1C ; |   XXX  | $106B
    .byte $24 ; |  X  X  | $106C
    .byte $4C ; | X  XX  | $106D
    .byte $0C ; |    XX  | $106E
    .byte $00 ; |        | $106F
    .byte $22 ; |  X   X | $1070
    .byte $3A ; |  XXX X | $1071
    .byte $AA ; |X X X X | $1072
    .byte $EA ; |XXX X X | $1073
    .byte $EE ; |XXX XXX | $1074
    .byte $7E ; | XXXXXX | $1075
    .byte $7E ; | XXXXXX | $1076
    .byte $EF ; |XXX XXXX| $1077
    .byte $8E ; |X   XXX | $1078
    .byte $2E ; |  X XXX | $1079
    .byte $3C ; |  XXXX  | $107A
    .byte $04 ; |     X  | $107B
    .byte $0C ; |    XX  | $107C
    .byte $0C ; |    XX  | $107D
    .byte $00 ; |        | $107E
    .byte $00 ; |        | $107F
    .byte $44 ; | X   X  | $1080
    .byte $44 ; | X   X  | $1081
    .byte $C6 ; |XX   XX | $1082
    .byte $E6 ; |XXX  XX | $1083
    .byte $6E ; | XX XXX | $1084
    .byte $7E ; | XXXXXX | $1085
    .byte $7E ; | XXXXXX | $1086
    .byte $FE ; |XXXXXXX | $1087
    .byte $8F ; |X   XXXX| $1088
    .byte $2E ; |  X XXX | $1089
    .byte $2E ; |  X XXX | $108A
    .byte $3C ; |  XXXX  | $108B
    .byte $04 ; |     X  | $108C
    .byte $0C ; |    XX  | $108D
    .byte $0C ; |    XX  | $108E
    .byte $00 ; |        | $108F
    .byte $CC ; |XX  XX  | $1090
    .byte $48 ; | X  X   | $1091
    .byte $78 ; | XXXX   | $1092
    .byte $78 ; | XXXX   | $1093
    .byte $F1 ; |XXXX   X| $1094
    .byte $61 ; | XX    X| $1095
    .byte $E1 ; |XXX    X| $1096
    .byte $6D ; | XX XX X| $1097
    .byte $EF ; |XXX XXXX| $1098
    .byte $7B ; | XXXX XX| $1099
    .byte $F8 ; |XXXXX   | $109A
    .byte $78 ; | XXXX   | $109B
    .byte $3C ; |  XXXX  | $109C
    .byte $1F ; |   XXXXX| $109D
    .byte $0D ; |    XX X| $109E
    .byte $06 ; |     XX | $109F
    .byte $78 ; | XXXX   | $10A0
    .byte $30 ; |  XX    | $10A1
    .byte $70 ; | XXX    | $10A2
    .byte $70 ; | XXX    | $10A3
    .byte $F0 ; |XXXX    | $10A4
    .byte $60 ; | XX     | $10A5
    .byte $E1 ; |XXX    X| $10A6
    .byte $61 ; | XX    X| $10A7
    .byte $ED ; |XXX XX X| $10A8
    .byte $7D ; | XXXXX X| $10A9
    .byte $FF ; |XXXXXXXX| $10AA
    .byte $7B ; | XXXX XX| $10AB
    .byte $3C ; |  XXXX  | $10AC
    .byte $1F ; |   XXXXX| $10AD
    .byte $0D ; |    XX X| $10AE
    .byte $06 ; |     XX | $10AF
    .byte $C0 ; |XX      | $10B0
    .byte $68 ; | XX X   | $10B1
    .byte $78 ; | XXXX   | $10B2
    .byte $71 ; | XXX   X| $10B3
    .byte $61 ; | XX    X| $10B4
    .byte $E1 ; |XXX    X| $10B5
    .byte $61 ; | XX    X| $10B6
    .byte $E7 ; |XXX  XXX| $10B7
    .byte $7C ; | XXXXX  | $10B8
    .byte $F8 ; |XXXXX   | $10B9
    .byte $78 ; | XXXX   | $10BA
    .byte $F0 ; |XXXX    | $10BB
    .byte $7E ; | XXXXXX | $10BC
    .byte $3E ; |  XXXXX | $10BD
    .byte $1A ; |   XX X | $10BE
    .byte $0C ; |    XX  | $10BF
    .byte $7C ; | XXXXX  | $10C0
    .byte $E6 ; |XXX  XX | $10C1
    .byte $E3 ; |XXX   XX| $10C2
    .byte $71 ; | XXX   X| $10C3
    .byte $79 ; | XXXX  X| $10C4
    .byte $38 ; |  XXX   | $10C5
    .byte $30 ; |  XX    | $10C6
    .byte $7A ; | XXXX X | $10C7
    .byte $7A ; | XXXX X | $10C8
    .byte $3E ; |  XXXXX | $10C9
    .byte $18 ; |   XX   | $10CA
    .byte $3C ; |  XXXX  | $10CB
    .byte $97 ; |X  X XXX| $10CC
    .byte $FD ; |XXXXXX X| $10CD
    .byte $52 ; | X X  X | $10CE
    .byte $DB ; |XX XX XX| $10CF
    .byte $3E ; |  XXXXX | $10D0
    .byte $73 ; | XXX  XX| $10D1
    .byte $71 ; | XXX   X| $10D2
    .byte $7B ; | XXXX XX| $10D3
    .byte $7A ; | XXXX X | $10D4
    .byte $30 ; |  XX    | $10D5
    .byte $30 ; |  XX    | $10D6
    .byte $FC ; |XXXXXX  | $10D7
    .byte $7C ; | XXXXX  | $10D8
    .byte $3C ; |  XXXX  | $10D9
    .byte $18 ; |   XX   | $10DA
    .byte $3C ; |  XXXX  | $10DB
    .byte $DF ; |XX XXXXX| $10DC
    .byte $7C ; | XXXXX  | $10DD
    .byte $D7 ; |XX X XXX| $10DE
    .byte $30 ; |  XX    | $10DF
    .byte $3E ; |  XXXXX | $10E0
    .byte $72 ; | XXX  X | $10E1
    .byte $7B ; | XXXX XX| $10E2
    .byte $79 ; | XXXX  X| $10E3
    .byte $39 ; |  XXX  X| $10E4
    .byte $B0 ; |X XX    | $10E5
    .byte $B4 ; |X XX X  | $10E6
    .byte $BA ; |X XXX X | $10E7
    .byte $FE ; |XXXXXXX | $10E8
    .byte $7C ; | XXXXX  | $10E9
    .byte $18 ; |   XX   | $10EA
    .byte $3C ; |  XXXX  | $10EB
    .byte $56 ; | X X XX | $10EC
    .byte $FE ; |XXXXXXX | $10ED
    .byte $2E ; |  X XXX | $10EE
    .byte $6A ; | XX X X | $10EF
    .byte $00 ; |        | $10F0
    .byte $00 ; |        | $10F1
    .byte $00 ; |        | $10F2
    .byte $00 ; |        | $10F3
    .byte $00 ; |        | $10F4
    .byte $00 ; |        | $10F5
    .byte $00 ; |        | $10F6
    .byte $00 ; |        | $10F7
    .byte $00 ; |        | $10F8
    .byte $00 ; |        | $10F9
    .byte $00 ; |        | $10FA
    .byte $00 ; |        | $10FB
    .byte $00 ; |        | $10FC
    .byte $00 ; |        | $10FD
    .byte $00 ; |        | $10FE
    .byte $00 ; |        | $10FF
    .byte $38 ; |  XXX   | $1100
    .byte $6C ; | XX XX  | $1101
    .byte $C6 ; |XX   XX | $1102
    .byte $C6 ; |XX   XX | $1103
    .byte $C6 ; |XX   XX | $1104
    .byte $C6 ; |XX   XX | $1105
    .byte $6C ; | XX XX  | $1106
    .byte $38 ; |  XXX   | $1107
    .byte $18 ; |   XX   | $1108
    .byte $18 ; |   XX   | $1109
    .byte $18 ; |   XX   | $110A
    .byte $18 ; |   XX   | $110B
    .byte $18 ; |   XX   | $110C
    .byte $18 ; |   XX   | $110D
    .byte $18 ; |   XX   | $110E
    .byte $38 ; |  XXX   | $110F
    .byte $FE ; |XXXXXXX | $1110
    .byte $C0 ; |XX      | $1111
    .byte $60 ; | XX     | $1112
    .byte $30 ; |  XX    | $1113
    .byte $18 ; |   XX   | $1114
    .byte $0C ; |    XX  | $1115
    .byte $CC ; |XX  XX  | $1116
    .byte $FC ; |XXXXXX  | $1117
    .byte $FE ; |XXXXXXX | $1118
    .byte $06 ; |     XX | $1119
    .byte $0C ; |    XX  | $111A
    .byte $18 ; |   XX   | $111B
    .byte $38 ; |  XXX   | $111C
    .byte $0C ; |    XX  | $111D
    .byte $06 ; |     XX | $111E
    .byte $7E ; | XXXXXX | $111F
    .byte $0C ; |    XX  | $1120
    .byte $0C ; |    XX  | $1121
    .byte $0C ; |    XX  | $1122
    .byte $FE ; |XXXXXXX | $1123
    .byte $CC ; |XX  XX  | $1124
    .byte $6C ; | XX XX  | $1125
    .byte $3C ; |  XXXX  | $1126
    .byte $1C ; |   XXX  | $1127
    .byte $FE ; |XXXXXXX | $1128
    .byte $FE ; |XXXXXXX | $1129
    .byte $02 ; |      X | $112A
    .byte $02 ; |      X | $112B
    .byte $7E ; | XXXXXX | $112C
    .byte $60 ; | XX     | $112D
    .byte $60 ; | XX     | $112E
    .byte $7C ; | XXXXX  | $112F
    .byte $3C ; |  XXXX  | $1130
    .byte $66 ; | XX  XX | $1131
    .byte $C2 ; |XX    X | $1132
    .byte $FE ; |XXXXXXX | $1133
    .byte $60 ; | XX     | $1134
    .byte $30 ; |  XX    | $1135
    .byte $18 ; |   XX   | $1136
    .byte $0C ; |    XX  | $1137
    .byte $06 ; |     XX | $1138
    .byte $06 ; |     XX | $1139
    .byte $06 ; |     XX | $113A
    .byte $06 ; |     XX | $113B
    .byte $06 ; |     XX | $113C
    .byte $06 ; |     XX | $113D
    .byte $86 ; |X    XX | $113E
    .byte $FE ; |XXXXXXX | $113F
    .byte $FE ; |XXXXXXX | $1140
    .byte $82 ; |X     X | $1141
    .byte $82 ; |X     X | $1142
    .byte $FE ; |XXXXXXX | $1143
    .byte $7C ; | XXXXX  | $1144
    .byte $44 ; | X   X  | $1145
    .byte $44 ; | X   X  | $1146
    .byte $7C ; | XXXXX  | $1147
    .byte $60 ; | XX     | $1148
    .byte $30 ; |  XX    | $1149
    .byte $1C ; |   XXX  | $114A
    .byte $06 ; |     XX | $114B
    .byte $FE ; |XXXXXXX | $114C
    .byte $C6 ; |XX   XX | $114D
    .byte $6C ; | XX XX  | $114E
    .byte $38 ; |  XXX   | $114F
    .byte $00 ; |        | $1150
    .byte $00 ; |        | $1151
    .byte $00 ; |        | $1152
    .byte $00 ; |        | $1153
    .byte $00 ; |        | $1154
    .byte $00 ; |        | $1155
    .byte $00 ; |        | $1156
    .byte $00 ; |        | $1157
    .byte $10 ; |   X    | $1158
    .byte $32 ; |  XX  X | $1159
    .byte $26 ; |  X  XX | $115A
    .byte $2C ; |  X XX  | $115B
    .byte $38 ; |  XXX   | $115C
    .byte $5C ; | X XXX  | $115D
    .byte $DC ; |XX XXX  | $115E
    .byte $FF ; |XXXXXXXX| $115F
    .byte $5F ; | X XXXXX| $1160
    .byte $0F ; |    XXXX| $1161
    .byte $01 ; |       X| $1162
    .byte $03 ; |      XX| $1163
    .byte $1E ; |   XXXX | $1164
    .byte $0C ; |    XX  | $1165
    .byte $7C ; | XXXXX  | $1166
    .byte $F0 ; |XXXX    | $1167
    .byte $00 ; |        | $1168
    .byte $14 ; |   X X  | $1169
    .byte $3C ; |  XXXX  | $116A
    .byte $28 ; |  X X   | $116B
    .byte $38 ; |  XXX   | $116C
    .byte $9C ; |X  XXX  | $116D
    .byte $DC ; |XX XXX  | $116E
    .byte $FF ; |XXXXXXXX| $116F
    .byte $7F ; | XXXXXXX| $1170
    .byte $1F ; |   XXXXX| $1171
    .byte $01 ; |       X| $1172
    .byte $1F ; |   XXXXX| $1173
    .byte $0E ; |    XXX | $1174
    .byte $FC ; |XXXXXX  | $1175
    .byte $78 ; | XXXX   | $1176
    .byte $00 ; |        | $1177
    .byte $00 ; |        | $1178
    .byte $00 ; |        | $1179
    .byte $C0 ; |XX      | $117A
    .byte $58 ; | X XX   | $117B
    .byte $54 ; | X X X  | $117C
    .byte $44 ; | X   X  | $117D
    .byte $EC ; |XXX XX  | $117E
    .byte $F8 ; |XXXXX   | $117F
    .byte $F8 ; |XXXXX   | $1180
    .byte $F8 ; |XXXXX   | $1181
    .byte $F8 ; |XXXXX   | $1182
    .byte $FC ; |XXXXXX  | $1183
    .byte $DF ; |XX XXXXX| $1184
    .byte $CE ; |XX  XXX | $1185
    .byte $64 ; | XX  X  | $1186
    .byte $60 ; | XX     | $1187
    .byte $00 ; |        | $1188
    .byte $00 ; |        | $1189
    .byte $00 ; |        | $118A
    .byte $C0 ; |XX      | $118B
    .byte $5C ; | X XXX  | $118C
    .byte $54 ; | X X X  | $118D
    .byte $CC ; |XX  XX  | $118E
    .byte $F8 ; |XXXXX   | $118F
    .byte $F8 ; |XXXXX   | $1190
    .byte $F8 ; |XXXXX   | $1191
    .byte $F8 ; |XXXXX   | $1192
    .byte $FC ; |XXXXXX  | $1193
    .byte $DF ; |XX XXXXX| $1194
    .byte $DE ; |XX XXXX | $1195
    .byte $64 ; | XX  X  | $1196
    .byte $60 ; | XX     | $1197
L1198:
    LDA    $CC             ; 3
    LSR                    ; 2
    BCC    L11C3           ; 2
    JSR    L1CB3           ; 6
    BCS    L11C4           ; 2
    LDA    $CC             ; 3
    BMI    L11C3           ; 2
    LDA    #$81            ; 2
    STA    $CC             ; 3
    LDA    #$00            ; 2
    STA    $C7             ; 3
    LDA    #$3F            ; 2
    STA    $C8             ; 3
    LDA    #$F0            ; 2
    LDY    #$61            ; 2
    LDX    #$05            ; 2
L11B8:
    CMP    $BF,X           ; 4
    BEQ    L11BE           ; 2
    STY    $BF,X           ; 4
L11BE:
    DEX                    ; 2
    STX    $B8             ; 3
    BPL    L11B8           ; 2
L11C3:
    RTS                    ; 6

L11C4:
    LDA    $CC             ; 3
    LSR                    ; 2
    LSR                    ; 2
    BCS    L11F1           ; 2
    LDA    #$00            ; 2
    STA    $C8             ; 3
    STA    $C7             ; 3
    INC    $BC             ; 5
    LDA    $BC             ; 3
    CMP    #$76            ; 2
    BNE    L11DF           ; 2
    LDA    #$03            ; 2
    STA    $CC             ; 3
    JMP    L1E70           ; 3
L11DF:
    AND    #$03            ; 2
    BNE    L11F0           ; 2
    LDX    #$06            ; 2
L11E5:
    LSR    $CD,X           ; 6
    ROL    $D4,X           ; 6
    LSR    $E2,X           ; 6
    ROL    $DB,X           ; 6
    DEX                    ; 2
    BPL    L11E5           ; 2
L11F0:
    RTS                    ; 6

L11F1:
    LSR                    ; 2
    BCS    L1209           ; 2
    LDA    #$78            ; 2
    STA    $CA             ; 3
    LDA    #$58            ; 2
    STA    $C5             ; 3
    LDA    #$11            ; 2
    STA    $C6             ; 3
    LDA    #$14            ; 2
    STA    $AD             ; 3
    LDA    #$0F            ; 2
    STA    $CC             ; 3
    RTS                    ; 6

L1209:
    LSR                    ; 2
    LSR                    ; 2
    BCS    L1253           ; 2
    LDA    $F1             ; 3
    AND    #$06            ; 2
    BNE    L1253           ; 2
    LDA    $BC             ; 3
    CMP    #$02            ; 2
    BEQ    L1227           ; 2
    LDA    $F1             ; 3
    LSR                    ; 2
    BCS    L1220           ; 2
    INC    $AD             ; 5
L1220:
    DEC    $BC             ; 5
    DEC    $BC             ; 5
    JMP    L1253           ; 3
L1227:
    LDA    $BB             ; 3
    BEQ    L122F           ; 2
    DEC    $BB             ; 5
    BNE    L1253           ; 2
L122F:
    LDA    $F0             ; 3
    LSR                    ; 2
    BCC    L1243           ; 2
    LDA    $F2             ; 3
    BEQ    L1253           ; 2
    JSR    L1372           ; 6
L123B:
    LDX    #$00            ; 2
    STX    $F2             ; 3
    INX                    ; 2
    STX    $F0             ; 3
    RTS                    ; 6

L1243:
    JSR    L1372           ; 6
    LDX    $90             ; 3
    LDA    $EA,X           ; 4
    BEQ    L123B           ; 2
    LDA    #$02            ; 2
    STA    $F0             ; 3
    JMP    L14C0           ; 3
L1253:
    RTS                    ; 6

    .byte $C2 ; |XX    X | $1254
    .byte $42 ; | X    X | $1255
    .byte $4E ; | X  XXX | $1256
    .byte $58 ; | X XX   | $1257
    .byte $50 ; | X X    | $1258
    .byte $70 ; | XXX    | $1259
    .byte $30 ; |  XX    | $125A
    .byte $30 ; |  XX    | $125B
    .byte $70 ; | XXX    | $125C
    .byte $78 ; | XXXX   | $125D
    .byte $3C ; |  XXXX  | $125E
    .byte $38 ; |  XXX   | $125F
    .byte $60 ; | XX     | $1260
    .byte $60 ; | XX     | $1261
    .byte $60 ; | XX     | $1262
    .byte $00 ; |        | $1263
    .byte $60 ; | XX     | $1264
    .byte $20 ; |  X     | $1265
    .byte $24 ; |  X  X  | $1266
    .byte $3C ; |  XXXX  | $1267
    .byte $38 ; |  XXX   | $1268
    .byte $30 ; |  XX    | $1269
    .byte $30 ; |  XX    | $126A
    .byte $30 ; |  XX    | $126B
    .byte $30 ; |  XX    | $126C
    .byte $70 ; | XXX    | $126D
    .byte $38 ; |  XXX   | $126E
    .byte $30 ; |  XX    | $126F
    .byte $60 ; | XX     | $1270
    .byte $60 ; | XX     | $1271
    .byte $60 ; | XX     | $1272
    .byte $00 ; |        | $1273
    .byte $18 ; |   XX   | $1274
    .byte $28 ; |  X X   | $1275
    .byte $18 ; |   XX   | $1276
    .byte $38 ; |  XXX   | $1277
    .byte $70 ; | XXX    | $1278
    .byte $70 ; | XXX    | $1279
    .byte $30 ; |  XX    | $127A
    .byte $30 ; |  XX    | $127B
    .byte $30 ; |  XX    | $127C
    .byte $F4 ; |XXXX X  | $127D
    .byte $B4 ; |X XX X  | $127E
    .byte $38 ; |  XXX   | $127F
    .byte $60 ; | XX     | $1280
    .byte $60 ; | XX     | $1281
    .byte $60 ; | XX     | $1282
    .byte $00 ; |        | $1283
L1284:
    .byte $0F ; |    XXXX| $1284
    .byte $1F ; |   XXXXX| $1285
    .byte $3F ; |  XXXXXX| $1286
    .byte $7F ; | XXXXXXX| $1287
    .byte $FF ; |XXXXXXXX| $1288
L1289:
    LDA    $F1             ; 3
    LSR                    ; 2
    BCC    L1293           ; 2
    LDA    #$00            ; 2
    STA    $93             ; 3
L1292:
    RTS                    ; 6

L1293:
    LDA    $A6             ; 3
    AND    #$02            ; 2
    BEQ    L12EA           ; 2
    LDA    $93             ; 3
    BNE    L1292           ; 2
    LDX    $90             ; 3
    LDA    SWCHB           ; 4
    AND    L1FFA,X         ; 4
    BEQ    L12AD           ; 2
    LDA    $F0             ; 3
    AND    #$80            ; 2
    BNE    L12D6           ; 2
L12AD:
    LDA    $80             ; 3
    INC    $80             ; 5
    AND    #$03            ; 2
    BNE    L12C0           ; 2
    JSR    L1E70           ; 6
    LDA    $80             ; 3
    CMP    #$11            ; 2
    BCS    L12C1           ; 2
    INC    $81             ; 5
L12C0:
    RTS                    ; 6

L12C1:
    DEC    $81             ; 5
    BNE    L12C0           ; 2
    LDA    #$00            ; 2
    STA    $CC             ; 3
    LDA    #$12            ; 2
    STA    $C6             ; 3
    LDA    #$54            ; 2
    STA    $C5             ; 3
    SEC                    ; 2
    LDX    $90             ; 3
    ROR    $EA,X           ; 6
L12D6:
    LDA    #$7F            ; 2
    AND    $F0             ; 3
    STA    $F0             ; 3
    LDA    #$00            ; 2
    STA    $80             ; 3
    STA    $86             ; 3
    LDA    #$22            ; 2
    STA    $B4             ; 3
    LDA    #$01            ; 2
    STA    $A6             ; 3
L12EA:
    LDA    $B4             ; 3
    CMP    #$A0            ; 2
    BCS    L1327           ; 2
    LDA    #$A5            ; 2
    STA    $93             ; 3
    JSR    L1B2A           ; 6
    LDA    #$00            ; 2
    STA    $93             ; 3
    STA    $95             ; 3
    STA    $B6             ; 3
    STA    $B7             ; 3
    BCC    L130B           ; 2
    LDA    $B4             ; 3
    CLC                    ; 2
    ADC    #$04            ; 2
    STA    $B4             ; 3
    RTS                    ; 6

L130B:
    LDA    $EC             ; 3
    LSR                    ; 2
    CMP    #$08            ; 2
    BCC    L1314           ; 2
    LDA    #$08            ; 2
L1314:
    TAY                    ; 2
    INC    $86             ; 5
    LDA    $86             ; 3
    CMP    L1FE7,Y         ; 4
    BCC    L1322           ; 2
    LDA    #$99            ; 2
    BNE    L1324           ; 2
L1322:
    LDA    #$05            ; 2
L1324:
    JMP    L1E57           ; 3
L1327:
    LDA    #$A1            ; 2
    STA    $BF             ; 3
    LDA    $F0             ; 3
    EOR    #$02            ; 2
    STA    $F0             ; 3
    LDA    #$0F            ; 2
    STA    $BD             ; 3
    LDA    $EC             ; 3
    LSR                    ; 2
    STA    $86             ; 3
    LDA    #$00            ; 2
    STA    $A6             ; 3
    STA    $AC             ; 3
    JSR    L1B16           ; 6
    JSR    L1372           ; 6
    BCC    L1371           ; 2
    LDA    $83             ; 3
    SED                    ; 2
    ADC    #$00            ; 2
    CLD                    ; 2
    STA    $83             ; 3
    INC    $EC             ; 5
    LDA    $ED             ; 3
    BPL    L1358           ; 2
    EOR    #$FF            ; 2
L1358:
    CLC                    ; 2
    ADC    #$04            ; 2
    CMP    #$30            ; 2
    BCS    L1361           ; 2
    STA    $ED             ; 3
L1361:
    LDA    $BE             ; 3
    CMP    #$07            ; 2
    BCS    L1369           ; 2
    INC    $BE             ; 5
L1369:
    DEC    $EF             ; 5
    BPL    L1371           ; 2
    LDA    #$10            ; 2
    STA    $EF             ; 3
L1371:
    RTS                    ; 6

L1372:
    LDA    $F0             ; 3
    LSR                    ; 2
    LDA    $90             ; 3
    BNE    L138B           ; 2
    LDA    $EE             ; 3
    AND    #$01            ; 2
    BEQ    L1395           ; 2
    BCS    L1385           ; 2
    LDA    $EB             ; 3
    BEQ    L1395           ; 2
L1385:
    LDA    #$01            ; 2
    STA    $90             ; 3
    CLC                    ; 2
    RTS                    ; 6

L138B:
    BCS    L1391           ; 2
    LDA    $EA             ; 3
    BEQ    L1395           ; 2
L1391:
    LDA    #$00            ; 2
    STA    $90             ; 3
L1395:
    SEC                    ; 2
    RTS                    ; 6

L1397:
    LDA    $F1             ; 3
    LSR                    ; 2
    PHP                    ; 3
    BCS    L13A1           ; 2
    LDA    $95             ; 3
    BCC    L13A3           ; 2
L13A1:
    LDA    $93             ; 3
L13A3:
    BNE    L13BC           ; 2
L13A5:
    PLP                    ; 4
    LDA    $AE,X           ; 4
    CMP    #$16            ; 2
    BMI    L13B0           ; 2
    CMP    #$83            ; 2
    BMI    L13B9           ; 2
L13B0:
    LDA    $ED             ; 3
    EOR    #$FF            ; 2
    SEC                    ; 2
    ADC    #$00            ; 2
    STA    $ED             ; 3
L13B9:
    LDA    $ED             ; 3
    RTS                    ; 6

L13BC:
    LDA    $EC             ; 3
    BEQ    L13A5           ; 2
    LDA    $AE,X           ; 4
    ADC    #$14            ; 2
    PLP                    ; 4
    BCS    L13CB           ; 2
    SEC                    ; 2
    SBC    $B6             ; 3
    RTS                    ; 6

L13CB:
    SBC    $B4             ; 3
    RTS                    ; 6

L13CE:
    LDA    $C7,X           ; 4
    LSR                    ; 2
    EOR    $C7,X           ; 4
    AND    L13DB,Y         ; 4
    EOR    $C7,X           ; 4
    STA    $C7,X           ; 4
    RTS                    ; 6

L13DB:
    .byte $FF,$FE,$FC,$F8,$F0
L13E0:
    LDA    #$00            ; 2
    TAX                    ; 2
L13E3:
    STA    NUSIZ1,X        ; 4
    STA    $80,X           ; 4
    INX                    ; 2
    CPX    #$25            ; 2
    BNE    L13E3           ; 2
    RTS                    ; 6

L13ED:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$48,$20,$30,$40,$48,$50,$54,$40
    .byte $00,$00,$00,$FF,$20,$20,$0F,$01,$1F,$04,$91,$F0,$F0,$F0,$F0,$F0
    .byte $54,$12,$0F,$00,$FF,$58,$01,$00
L1415:
    LDA    #$02            ; 2
    STA    VBLANK          ; 3
    STA    WSYNC           ; 3
    STA    VSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    STA    WSYNC           ; 3
    STA    VSYNC           ; 3
    LDA    #$33            ; 2
    STA    TIM64T          ; 4
    INC    $F1             ; 5
    BNE    L1438           ; 2
    INC    $F2             ; 5
L1438:
    LDA    SWCHB           ; 4
    TAX                    ; 2
    AND    #$08            ; 2
    TAY                    ; 2
    LDA    $F0             ; 3
    LSR                    ; 2
    BCS    L144F           ; 2
    TYA                    ; 2
    EOR    $82             ; 3
    BEQ    L144F           ; 2
    LDA    #$80            ; 2
    ORA    $EF             ; 3
    STA    $EF             ; 3
L144F:
    STY    $82             ; 3
    TXA                    ; 2
    ROR    $CB             ; 5
    BCS    L145A           ; 2
    LSR                    ; 2
    BCS    L1499           ; 2
    ROL                    ; 2
L145A:
    LSR                    ; 2
    ROL    $CB             ; 5
    LSR                    ; 2
    BIT    $E9             ; 3
    BCC    L1467           ; 2
    ROL    $E9             ; 5
    JMP    L14E7           ; 3
L1467:
    BPL    L147A           ; 2
L1469:
    LDA    $F1             ; 3
    AND    #$1F            ; 2
    STA    $E9             ; 3
    INC    $EE             ; 5
    LDA    $EE             ; 3
    AND    #$07            ; 2
    STA    $EE             ; 3
    JMP    L1482           ; 3
L147A:
    LDA    $E9             ; 3
    EOR    $F1             ; 3
    AND    #$1F            ; 2
    BEQ    L1469           ; 2
L1482:
    JMP    L14D5           ; 3

START:
    SEI                    ; 2
    CLD                    ; 2
    LDA    #$00            ; 2
    STA    $EE             ; 3
    STA    $EB             ; 3
    LDA    #$1C            ; 2
    STA    $ED             ; 3
    STA    $EC             ; 3
    LDA    #$03            ; 2
    STA    $F0             ; 3
    BNE    L14AF           ; 2
L1499:
    LDX    #$02            ; 2
    STX    $F0             ; 3
    LDA    $EE             ; 3
    LSR                    ; 2
    TAY                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    $EC             ; 3
    LDA    L1FEF,Y         ; 4
    STA    $ED             ; 3
    LDA    L1FF3,Y         ; 4
    STA    $EF             ; 3
L14AF:
    LDX    #$FF            ; 2
    TXS                    ; 2
    JSR    L13E0           ; 6
    LDX    #$F0            ; 2
    STX    $EA             ; 3
    LDA    $EE             ; 3
    LSR                    ; 2
    BCC    L14C0           ; 2
    STX    $EB             ; 3
L14C0:
    LDX    #$27            ; 2
L14C2:
    LDA    L13ED,X         ; 4
    STA    $A5,X           ; 4
    DEX                    ; 2
    BPL    L14C2           ; 2
    TXS                    ; 2
    JSR    L1B16           ; 6
L14CE:
    LDX    #$01            ; 2
    STX    CTRLPF          ; 3
    JMP    L1585           ; 3
L14D5:
    JSR    L13E0           ; 6
    LDA    $EE             ; 3
    CLC                    ; 2
    ADC    #$01            ; 2
    STA    $8C             ; 3
    STA    $8F             ; 3
    LDA    #$01            ; 2
    STA    $F0             ; 3
    BNE    L14CE           ; 2
L14E7:
    LDA    $A6             ; 3
    BEQ    L14F4           ; 2
    JSR    L1CC5           ; 6
    JSR    L1289           ; 6
    JMP    L1585           ; 3
L14F4:
    LDA    $F0             ; 3
    LSR                    ; 2
    BCC    L14FD           ; 2
    LDA    REFP1           ; 3
    BPL    L1499           ; 2
L14FD:
    STA    HMCLR           ; 3
    LDA    $CC             ; 3
    LSR                    ; 2
    BCC    L1512           ; 2
    LDA    #$00            ; 2
    STA    $93             ; 3
    STA    $94             ; 3
    STA    $88             ; 3
    JSR    L1198           ; 6
    JMP    L1585           ; 3
L1512:
    JSR    L1CB3           ; 6
    BCC    L151D           ; 2
    LDA    #$03            ; 2
    STA    $A6             ; 3
    BNE    L1539           ; 2
L151D:
    JSR    L1AF3           ; 6
    JSR    L1397           ; 6
    JSR    L1CF6           ; 6
L1526:
    INC    $A2             ; 5
    LDX    $A2             ; 3
    CPX    #$06            ; 2
    BEQ    L1539           ; 2
    LDA    $AE,X           ; 4
    SEC                    ; 2
    SBC    $AD,X           ; 4
    JSR    L1CF6           ; 6
    JMP    L1526           ; 3
L1539:
    JSR    L1CC5           ; 6
    LDA    $F1             ; 3
    LSR                    ; 2
    BCC    L1547           ; 2
    JSR    L1B2A           ; 6
    JMP    L1585           ; 3
L1547:
    LDX    #$05            ; 2
L1549:
    LDA    $A7,X           ; 4
    BEQ    L1582           ; 2
    INC    $A5             ; 5
    DEC    $A7,X           ; 6
    BNE    L1582           ; 2
    TXA                    ; 2
    TAY                    ; 2
L1555:
    LDA    $A8,X           ; 4
    STA    $A7,X           ; 4
    LDA    $C0,X           ; 4
    STA    $BF,X           ; 4
    LDA    $AF,X           ; 4
    STA    $AE,X           ; 4
    CPX    #$04            ; 2
    BNE    L157B           ; 2
    DEC    $B8             ; 5
    LDA    #$00            ; 2
    STA    $A5             ; 3
    LDA    #$F0            ; 2
    STA    $C4             ; 3
    LDX    #$00            ; 2
    JSR    L13CE           ; 6
    INX                    ; 2
    JSR    L13CE           ; 6
    JMP    L1585           ; 3
L157B:
    INX                    ; 2
    CPX    #$05            ; 2
    BNE    L1555           ; 2
    BEQ    L1585           ; 2
L1582:
    DEX                    ; 2
    BPL    L1549           ; 2
L1585:
    JSR    L1CC5           ; 6
    JSR    L1BBB           ; 6
    LDA    L1A8A           ; 4
    STA    COLUPF          ; 3
    LDX    #$08            ; 2
L1592:
    LDA    $AD,X           ; 4
    STA    $92             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    SEC                    ; 2
    ADC    $92             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    STA    $91             ; 3
    CLC                    ; 2
    ADC    $92             ; 3
    AND    #$0F            ; 2
    SEC                    ; 2
    SBC    #$07            ; 2
    EOR    #$FF            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ORA    $91             ; 3
    STA    $97,X           ; 4
    DEX                    ; 2
    BPL    L1592           ; 2
    STA    WSYNC           ; 3
    LDA    $9E             ; 3
    STA    HMBL            ; 3
    AND    #$0F            ; 2
    TAY                    ; 2
L15C1:
    DEY                    ; 2
    BPL    L15C1           ; 2
    STY    RESBL           ; 3
    STA    WSYNC           ; 3
    LDA    $9F             ; 3
    STA    HMM1            ; 3
    AND    #$0F            ; 2
    TAY                    ; 2
L15CF:
    DEY                    ; 2
    BPL    L15CF           ; 2
    STA    RESM1           ; 3
    STY    WSYNC           ; 3
    STA    RESP0           ; 3
    LDA    #$D0            ; 2
    STA    HMP0            ; 3
    LDA    #$70            ; 2
    STA    HMP1            ; 3
    LDY    #$0A            ; 2
L15E2:
    DEY                    ; 2
    BPL    L15E2           ; 2
    STA    RESP1           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #$0F            ; 2
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
L15F1:
    BIT    $0285           ; 4
    BPL    L15F1           ; 2
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    VBLANK          ; 3
    STA    HMCLR           ; 3
    STA    NUSIZ0          ; 3
    LDX    #$1F            ; 2
    TXS                    ; 2
    LDX    #$9D            ; 2
    STX    CXCLR           ; 3
    STX    WSYNC           ; 3
    LDY    $BC             ; 3
L160B:
    STY    WSYNC           ; 3
    DEX                    ; 2
    DEY                    ; 2
    BNE    L160B           ; 2
    LDA    $CC             ; 3
    AND    #$08            ; 2
    BEQ    L162E           ; 2
    LDA    $CA             ; 3
    STA    $F4             ; 3
    LDA    #$11            ; 2
    STA    $F5             ; 3
    LDA    #$F0            ; 2
    STA    $FC             ; 3
    LDA    #$10            ; 2
    STA    $FD             ; 3
    LDA    #$DB            ; 2
    STA    $FA             ; 3
    JMP    L179F           ; 3
L162E:
    LDY    #$06            ; 2
L1630:
    LDA    L1A83,Y         ; 4
    STY    WSYNC           ; 3
    CPX    $93             ; 3
    PHP                    ; 3
    CPX    $94             ; 3
    PHP                    ; 3
    AND    $C9             ; 3
    STA.w  $0008           ; 4
    LDA.wy $00CD,Y         ; 4
    STA    PF1             ; 3
    LDA.wy $00D4,Y         ; 4
    STA    PF2             ; 3
    PLA                    ; 4
    PLA                    ; 4
    LDA.wy $00DB,Y         ; 4
    STA    PF2             ; 3
    LDA.wy $00E2,Y         ; 4
    STA    PF1             ; 3
    DEX                    ; 2
    CPX    #$91            ; 2
    BNE    L165F           ; 2
    LDA    #$E0            ; 2
    STA    PF0             ; 3
L165F:
    LDA    L1A83,Y         ; 4
    STY    WSYNC           ; 3
    CPX    $93             ; 3
    PHP                    ; 3
    CPX    $94             ; 3
    PHP                    ; 3
    AND    $C9             ; 3
    STA.w  $0008           ; 4
    LDA.wy $00CD,Y         ; 4
    STA    PF1             ; 3
    LDA.wy $00D4,Y         ; 4
    STA    PF2             ; 3
    PLA                    ; 4
    PLA                    ; 4
    LDA.wy $00DB,Y         ; 4
    STA    PF2             ; 3
    LDA.wy $00E2,Y         ; 4
    STA    PF1             ; 3
    DEX                    ; 2
    DEY                    ; 2
    BPL    L1630           ; 2
L1689:
    LDA    L1BF4,Y         ; 4
    STA    WSYNC           ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    LDA    #$00            ; 2
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    CPX    $93             ; 3
    PHP                    ; 3
    CPX    $94             ; 3
    PHP                    ; 3
    PLA                    ; 4
    PLA                    ; 4
    DEX                    ; 2
    DEY                    ; 2
    CPY    #$FB            ; 2
    BNE    L1689           ; 2
    LDY    $A5             ; 3
L16AA:
    STA    WSYNC           ; 3
    LDA    #$40            ; 2
    STA    PF0             ; 3
    LDA    #$0F            ; 2
    STA    COLUPF          ; 3
    CPX    $93             ; 3
    PHP                    ; 3
    CPX    $94             ; 3
    PHP                    ; 3
    PLA                    ; 4
    PLA                    ; 4
    DEX                    ; 2
    DEY                    ; 2
    BPL    L16AA           ; 2
    LDA    $BC             ; 3
    CMP    #$01            ; 2
    BEQ    L16C9           ; 2
    JMP    L1768           ; 3
L16C9:
    LDA    $EC             ; 3
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    L1AEB,Y         ; 4
    STA    $F6             ; 3
    LDA    #$1A            ; 2
    STA    $F7             ; 3
    LDA    #$05            ; 2
    STA    $A2             ; 3
L16DB:
    STX    WSYNC           ; 3
    CPX    $93             ; 3
    PHP                    ; 3
    CPX    $94             ; 3
    PHP                    ; 3
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    PLA                    ; 4
    PLA                    ; 4
    DEX                    ; 2
    STX    $91             ; 3
    LDX    $A2             ; 3
    LDA    $BF,X           ; 4
    STA    $F4             ; 3
    LSR                    ; 2
    BCS    L16FB           ; 2
    LDA    #$10            ; 2
    BCC    L16FD           ; 2
L16FB:
    LDA    #$1D            ; 2
L16FD:
    STA    $F5             ; 3
    LDA    $98,X           ; 4
    STA    HMP0            ; 3
    AND    #$0F            ; 2
    TAY                    ; 2
    LDX    $91             ; 3
    STX    WSYNC           ; 3
    CPX    $93             ; 3
    PHP                    ; 3
    CPX    $94             ; 3
    PHP                    ; 3
    PLA                    ; 4
L1711:
    DEY                    ; 2
    BPL    L1711           ; 2
    STY    RESP0           ; 3
    PLA                    ; 4
    DEX                    ; 2
    STX    CXCLR           ; 3
    STX    WSYNC           ; 3
    STY    HMOVE           ; 3
    CPX    $93             ; 3
    PHP                    ; 3
    CPX    $94             ; 3
    PHP                    ; 3
    PLA                    ; 4
    PLA                    ; 4
    DEX                    ; 2
    LDY    $A2             ; 3
    LDA.wy $00A7,Y         ; 4
    BNE    L1757           ; 2
    LDY    #$0F            ; 2
L1730:
    CPX    $93             ; 3
    STX    WSYNC           ; 3
    PHP                    ; 3
    CPX    $94             ; 3
    PHP                    ; 3
    LDA    ($F4),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($F6),Y         ; 5
    STA    COLUP0          ; 3
    PLA                    ; 4
    PLA                    ; 4
    DEX                    ; 2
    DEY                    ; 2
    BPL    L1730           ; 2
L1746:
    LDA    VBLANK          ; 3
    ASL                    ; 2
    ROR    $E7             ; 5
    LDA    WSYNC           ; 3
    ASL                    ; 2
    ASL                    ; 2
    ROR    $E6             ; 5
    DEC    $A2             ; 5
    BMI    L1768           ; 2
    BPL    L16DB           ; 2
L1757:
    TAY                    ; 2
L1758:
    STX    WSYNC           ; 3
    CPX    $93             ; 3
    PHP                    ; 3
    CPX    $94             ; 3
    PHP                    ; 3
    PLA                    ; 4
    PLA                    ; 4
    DEX                    ; 2
    DEY                    ; 2
    BPL    L1758           ; 2
    BMI    L1746           ; 2
L1768:
    STX    WSYNC           ; 3
    CPX    $93             ; 3
    PHP                    ; 3
    CPX    $94             ; 3
    PHP                    ; 3
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    PLA                    ; 4
    PLA                    ; 4
    DEX                    ; 2
    CPX    #$13            ; 2
    BNE    L1768           ; 2
    LDA    $C5             ; 3
    LDA    #$F0            ; 2
    STA    $F4             ; 3
    LDA    #$10            ; 2
    STA    $F5             ; 3
    LDA    #$73            ; 2
    STA    $FC             ; 3
    LDA    #$1A            ; 2
    STA    $FD             ; 3
    LDA    #$CB            ; 2
    STA    $FA             ; 3
    LDA    $88             ; 3
    BMI    L179B           ; 2
    LDA    #$FF            ; 2
    BNE    L179D           ; 2
L179B:
    LDA    #$00            ; 2
L179D:
    STA    REFP1           ; 3
L179F:
    LDA    #$1A            ; 2
    STA    $FB             ; 3
    LDA    $97             ; 3
    STY    WSYNC           ; 3
    STA    HMP1            ; 3
    CLC                    ; 2
    ADC    #$10            ; 2
    STA    HMP0            ; 3
    AND    #$0F            ; 2
    TAY                    ; 2
L17B1:
    DEY                    ; 2
    BPL    L17B1           ; 2
    STA    RESP1           ; 3
    STA    RESP0           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    CPX    $93             ; 3
    PHP                    ; 3
    CPX    $94             ; 3
    PHP                    ; 3
    PLA                    ; 4
    PLA                    ; 4
    DEX                    ; 2
    STA    CXCLR           ; 3
    LDY    $BB             ; 3
    BEQ    L17F5           ; 2
L17CB:
    LDA    ($FA),Y         ; 5
    STA    $92             ; 3
    LDA    ($C5),Y         ; 5
    STA    $91             ; 3
    LDA    ($F4),Y         ; 5
    STA    WSYNC           ; 3
    STA    GRP0            ; 3
    LDA    $92             ; 3
    STA    COLUP1          ; 3
    LDA    $91             ; 3
    STA    GRP1            ; 3
    LDA    ($FC),Y         ; 5
    STA    PF0             ; 3
    CPX    $93             ; 3
    PHP                    ; 3
    CPX    $94             ; 3
    PHP                    ; 3
    PLA                    ; 4
    PLA                    ; 4
    DEX                    ; 2
    DEY                    ; 2
    BPL    L17CB           ; 2
    CPX    #$02            ; 2
    BEQ    L1800           ; 2
L17F5:
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    DEX                    ; 2
    BNE    L17F5           ; 2
L1800:
    STX    WSYNC           ; 3
    LDX    #$FF            ; 2
    STX    PF0             ; 3
    STX    PF1             ; 3
    STX    PF2             ; 3
    TXS                    ; 2
    LDA    #$C4            ; 2
    STA    COLUPF          ; 3
    INX                    ; 2
    STX    GRP0            ; 3
    STX    GRP1            ; 3
    STX    ENAM1           ; 3
    STX    ENABL           ; 3
    STX    REFP0           ; 3
    STX    REFP1           ; 3
    LDA    #$09            ; 2
    STA    TIM64T          ; 4
    LDA    #$FE            ; 2
    STA    $D2             ; 3
    LDA    $90             ; 3
    BEQ    L182B           ; 2
    LDA    #$06            ; 2
L182B:
    STA    $D1             ; 3
    LDA    #$06            ; 2
    STA    $D3             ; 3
    LDA    #$FB            ; 2
    STA    $E8             ; 3
L1835:
    LDA    $D1             ; 3
    LSR                    ; 2
    TAX                    ; 2
    LDA    $8A,X           ; 4
    BCC    L1844           ; 2
    AND    #$0F            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    BCC    L1847           ; 2
L1844:
    LSR                    ; 2
    AND    #$78            ; 2
L1847:
    BNE    L1853           ; 2
    LDY    $E8             ; 3
    BPL    L1853           ; 2
    INC    $E8             ; 5
    LDA    #$50            ; 2
    BNE    L1855           ; 2
L1853:
    STA    $E8             ; 3
L1855:
    LDX    $D2             ; 3
    STA    VSYNC,X         ; 4
    DEC    $D2             ; 5
    DEC    $D2             ; 5
    INC    $D1             ; 5
    LDA    #$11            ; 2
    STA    VBLANK,X        ; 4
    DEC    $D3             ; 5
    BNE    L1835           ; 2
L1867:
    LDA    #$07            ; 2
    STA    $92             ; 3
    BIT    $0285           ; 4
    BPL    L1867           ; 2
    STY    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    GRP1            ; 3
    STA    GRP0            ; 3
    STA    HMCLR           ; 3
    LDX    $90             ; 3
    LDA    L1FFE,X         ; 4
    STA    COLUP1          ; 3
    STA    COLUP0          ; 3
    LDA    #$03            ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDY    #$06            ; 2
    STA    WSYNC           ; 3
L188D:
    DEY                    ; 2
    BPL    L188D           ; 2
    NOP                    ; 2
    STA    RESP0           ; 3
    STA    RESP1           ; 3
    LDA    #$F0            ; 2
    STA    HMP0            ; 3
    LDA    #$01            ; 2
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
L18A3:
    LDY    $92             ; 3
    LDA    ($FE),Y         ; 5
    STA    GRP0            ; 3
    STA    WSYNC           ; 3
    LDA    ($FC),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($FA),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($F8),Y         ; 5
    STA    $91             ; 3
    LDA    ($F6),Y         ; 5
    TAX                    ; 2
    LDA    ($F4),Y         ; 5
    TAY                    ; 2
    LDA    $91             ; 3
    STA    GRP1            ; 3
    STX    GRP0            ; 3
    STY    GRP1            ; 3
    STY    GRP0            ; 3
    DEC    $92             ; 5
    BPL    L18A3           ; 2
    STY    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    LDA    #$07            ; 2
    STA    NUSIZ1          ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    LDX    $81             ; 3
    LDA    L1284,X         ; 4
    STA    PF2             ; 3
    LDA    #$05            ; 2
    STA    CTRLPF          ; 3
    STA    WSYNC           ; 3
    LDX    $90             ; 3
    LDA    $EA,X           ; 4
    STA    GRP1            ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    GRP1            ; 3
    LDX    #$FF            ; 2
    STX    PF2             ; 3
    STA    WSYNC           ; 3
    LDA    #$21            ; 2
    STA    TIM64T          ; 4
    CLC                    ; 2
    ROR    $E7             ; 5
    ROR    $E7             ; 5
    ROR    $E6             ; 5
    ROR    $E6             ; 5
    LDA    $F1             ; 3
    LSR                    ; 2
    BCC    L1940           ; 2
    LDX    #$21            ; 2
    STX    CTRLPF          ; 3
    DEX                    ; 2
    STX    NUSIZ1          ; 3
    JSR    L1C3B           ; 6
    LDX    #$00            ; 2
    JSR    L1E79           ; 6
    LDA    $B4             ; 3
    STA    $F6             ; 3
    LDX    #$01            ; 2
    STX    $91             ; 3
    JSR    L1E26           ; 6
    BCS    L1935           ; 2
    DEX                    ; 2
    JSR    L1E26           ; 6
L1935:
    JSR    L1DBB           ; 6
    LDA    VBLANK          ; 3
    AND    #$40            ; 2
    BEQ    L1995           ; 2
    BNE    L1984           ; 2
L1940:
    LDX    #$01            ; 2
    STX    CTRLPF          ; 3
    DEX                    ; 2
    STX    NUSIZ1          ; 3
    JSR    L1E10           ; 6
    INX                    ; 2
    JSR    L1E10           ; 6
    LDX    #$00            ; 2
    JSR    L1E79           ; 6
    LDX    #$01            ; 2
    JSR    L1E79           ; 6
    DEC    $BD             ; 5
    BNE    L1978           ; 2
    LDA    $F0             ; 3
    AND    #$02            ; 2
    BEQ    L1978           ; 2
    INC    $B8             ; 5
    LDX    $B8             ; 3
    LDA    #$A1            ; 2
    STA    $BF,X           ; 4
    LDA    #$09            ; 2
    STA    $BD             ; 3
    CPX    #$05            ; 2
    BNE    L1978           ; 2
    LDA    $F0             ; 3
    EOR    #$02            ; 2
    STA    $F0             ; 3
L1978:
    LDA    VBLANK          ; 3
    AND    #$40            ; 2
    BNE    L1984           ; 2
    LDA    RSYNC           ; 3
    AND    #$40            ; 2
    BEQ    L1995           ; 2
L1984:
    LDA    #$40            ; 2
    STA    $A3             ; 3
    LDA    $C5             ; 3
    LSR                    ; 2
    BCS    L1995           ; 2
    LDA    #$61            ; 2
    STA    $C5             ; 3
    LDA    #$1D            ; 2
    STA    $C6             ; 3
L1995:
    STA    CXCLR           ; 3
    LDY    #$02            ; 2
L1999:
    LDX    L1FF7,Y         ; 4
    LDA    VSYNC,X         ; 4
    STA    $91             ; 3
    LDA    VBLANK,X        ; 4
    PHA                    ; 3
    LDA    WSYNC,X         ; 4
    STA    VSYNC,X         ; 4
    LDA    RSYNC,X         ; 4
    STA    VBLANK,X        ; 4
    LDA    $91             ; 3
    STA    WSYNC,X         ; 4
    PLA                    ; 4
    STA    RSYNC,X         ; 4
    DEY                    ; 2
    BPL    L1999           ; 2
    LDA    $F1             ; 3
    AND    #$07            ; 2
    CMP    #$07            ; 2
    BNE    L1A31           ; 2
    LDX    #$05            ; 2
L19BF:
    LDA    $BF,X           ; 4
    LSR                    ; 2
    BCS    L19E1           ; 2
    ROL                    ; 2
    CMP    #$F0            ; 2
    BEQ    L19E4           ; 2
    CLC                    ; 2
    ADC    #$10            ; 2
    LDY    #$04            ; 2
L19CE:
    CMP    L1DB1,Y         ; 4
    BNE    L19D9           ; 2
    LDA    L1DB6,Y         ; 4
    JMP    L19DC           ; 3
L19D9:
    DEY                    ; 2
    BPL    L19CE           ; 2
L19DC:
    STA    $BF,X           ; 4
    JMP    L19E4           ; 3
L19E1:
    JSR    L1EBA           ; 6
L19E4:
    DEX                    ; 2
    BPL    L19BF           ; 2
    LDA    $CC             ; 3
    AND    #$02            ; 2
    BNE    L1A31           ; 2
    LDA    $C5             ; 3
    LSR                    ; 2
    BCC    L1A12           ; 2
    ROL                    ; 2
    ADC    #$10            ; 2
    CMP    #$B1            ; 2
    BNE    L1A2F           ; 2
    LDA    #$80            ; 2
    ORA    $F0             ; 3
    STA    $F0             ; 3
    CLC                    ; 2
    LDX    $90             ; 3
    ROL    $EA,X           ; 6
    BNE    L1A1C           ; 2
    LDA    #$01            ; 2
    STA    $CC             ; 3
    LDA    #$10            ; 2
    STA    $C6             ; 3
    LDA    #$F0            ; 2
    BNE    L1A2F           ; 2
L1A12:
    LDA    $C5             ; 3
    CMP    #$F0            ; 2
    BEQ    L1A2F           ; 2
    LDA    $88             ; 3
    BNE    L1A24           ; 2
L1A1C:
    LDA    #$12            ; 2
    STA    $C6             ; 3
    LDA    #$74            ; 2
    BNE    L1A2F           ; 2
L1A24:
    LDA    $C5             ; 3
    CLC                    ; 2
    ADC    #$10            ; 2
    CMP    #$84            ; 2
    BNE    L1A2F           ; 2
    LDA    #$54            ; 2
L1A2F:
    STA    $C5             ; 3
L1A31:
    LDA    $CC             ; 3
    AND    #$08            ; 2
    BEQ    L1A53           ; 2
    LDA    $F1             ; 3
    AND    #$07            ; 2
    BNE    L1A53           ; 2
    LDA    $CA             ; 3
    CLC                    ; 2
    ADC    #$10            ; 2
    STA    $CA             ; 3
    LDA    $C5             ; 3
    CLC                    ; 2
    ADC    #$10            ; 2
    CMP    #$78            ; 2
    BNE    L1A51           ; 2
    STA    $CA             ; 3
    LDA    #$58            ; 2
L1A51:
    STA    $C5             ; 3
L1A53:
    JSR    L1F3C           ; 6
L1A56:
    BIT    $0285           ; 4
    BPL    L1A56           ; 2
    JMP    L1415           ; 3
L1A5E:
    .byte $03,$03,$02,$02,$01,$01,$01
L1A65:
    .byte $FF,$FF,$1F,$07,$00,$00,$00
L1A6C:
    .byte $FF,$FF,$FF,$FF,$FF,$FC,$F0,$F0,$F0,$F0,$00,$E0,$E0,$E0,$00,$40
    .byte $40,$40,$40,$40,$40,$40,$40
L1A83:
    .byte $28,$48,$68,$88,$A8,$B8,$D8
L1A8A:
    .byte $E8,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$0A,$0A,$0A,$0A,$0C,$0C,$1A,$4A
    .byte $1A,$08,$F4,$F6,$F4,$F6,$F8,$F6,$F8,$48,$48,$48,$4A,$46,$4A,$18
    .byte $1A,$44,$46,$44,$84,$86,$88,$88,$86,$88,$88,$48,$4A,$4C,$4A,$3C
    .byte $3E,$98,$98,$98,$D8,$F8,$F8,$F8,$F8,$46,$48,$46,$F4,$F4,$F6,$F8
    .byte $FA,$3C,$3C,$3C,$3C,$3C,$3C,$86,$86,$86,$86,$86,$86,$8C,$8C,$3C
    .byte $1F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
    .byte $0F
L1AEB:
    .byte $8B,$DB,$AB,$BB,$9B,$8B,$AB,$BB
L1AF3:
    LDA    $F0             ; 3
    AND    #$04            ; 2
    BEQ    L1B15           ; 2
    LDA    $F1             ; 3
    LSR                    ; 2
    BCS    L1B15           ; 2
    CLC                    ; 2
    LDA    $85             ; 3
    ADC    #$10            ; 2
    SBC    $B7             ; 3
    BMI    L1B0C           ; 2
    LSR                    ; 2
    LSR                    ; 2
    JMP    L1B10           ; 3
L1B0C:
    SEC                    ; 2
    ROR                    ; 2
    SEC                    ; 2
    ROR                    ; 2
L1B10:
    CLC                    ; 2
    ADC    $B7             ; 3
    STA    $B7             ; 3
L1B15:
    RTS                    ; 6

L1B16:
    LDX    #$06            ; 2
L1B18:
    LDA    L1A65,X         ; 4
    STA    $CD,X           ; 4
    STA    $E2,X           ; 4
    LDA    L1A6C,X         ; 4
    STA    $D4,X           ; 4
    STA    $DB,X           ; 4
    DEX                    ; 2
    BPL    L1B18           ; 2
    RTS                    ; 6

L1B2A:
    LDA    $93             ; 3
    SEC                    ; 2
    SBC    #$92            ; 2
    BCS    L1B32           ; 2
    RTS                    ; 6

L1B32:
    LSR                    ; 2
    CMP    #$07            ; 2
    BCC    L1B39           ; 2
    LDA    #$06            ; 2
L1B39:
    STA    $91             ; 3
    LDA    #$00            ; 2
    STA    $FB             ; 3
    STA    $F8             ; 3
    LDA    $B4             ; 3
    SEC                    ; 2
    SBC    #$22            ; 2
    CMP    #$40            ; 2
    BCC    L1B50           ; 2
    SBC    #$40            ; 2
    INC    $F8             ; 5
    INC    $F8             ; 5
L1B50:
    CMP    #$20            ; 2
    BCC    L1B58           ; 2
    SBC    #$20            ; 2
    INC    $F8             ; 5
L1B58:
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDA    $F8             ; 3
    LSR                    ; 2
    BCC    L1B65           ; 2
    LDA    L1BAA,Y         ; 4
    BNE    L1B68           ; 2
L1B65:
    LDA    L1BB3,Y         ; 4
L1B68:
    TAX                    ; 2
    LDY    $F8             ; 3
    LDA    L1BA6,Y         ; 4
    STA    $FA             ; 3
    LDY    #$00            ; 2
L1B72:
    TXA                    ; 2
    AND    ($FA),Y         ; 5
    BNE    L1B7F           ; 2
    INY                    ; 2
    CPY    $91             ; 3
    BMI    L1B72           ; 2
    BEQ    L1B72           ; 2
    RTS                    ; 6

L1B7F:
    EOR    #$FF            ; 2
    AND    ($FA),Y         ; 5
    STA    ($FA),Y         ; 6
    LDA    $95             ; 3
    STA    $96             ; 3
    LDA    $B6             ; 3
    STA    $B7             ; 3
    LDA    $B4             ; 3
    CLC                    ; 2
    ADC    #$02            ; 2
    ORA    #$03            ; 2
    SEC                    ; 2
    SBC    #$05            ; 2
    STA    $B6             ; 3
    TYA                    ; 2
    ASL                    ; 2
    ADC    #$92            ; 2
    STA    $95             ; 3
    LDA    #$00            ; 2
    STA    $93             ; 3
    JMP    L1E70           ; 3
L1BA6:
    .byte $CD,$D4,$DB,$E2
L1BAA:
    .byte $01,$02,$04,$08,$10,$20,$40,$80,$80
L1BB3:
    .byte $80,$40,$20,$10,$08,$04,$02,$01
L1BBB:
    LDA    $CC             ; 3
    BEQ    L1BC0           ; 2
    RTS                    ; 6

L1BC0:
    LDA    $90             ; 3
    LSR                    ; 2
    LDA    SWCHA           ; 4
    BCS    L1BCC           ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
L1BCC:
    AND    #$0C            ; 2
    CMP    #$0C            ; 2
    STA    $91             ; 3
    BEQ    L1C0B           ; 2
    LDA    $F1             ; 3
    LSR                    ; 2
    BCS    L1C0B           ; 2
    LDA    $91             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LDX    #$FF            ; 2
    LSR                    ; 2
    BCS    L1BE8           ; 2
    DEC    $AD             ; 5
    LDA    #$FF            ; 2
    BNE    L1BEC           ; 2
L1BE8:
    INC    $AD             ; 5
    LDA    #$01            ; 2
L1BEC:
    CLC                    ; 2
    ADC    $88             ; 3
    BPL    L1BF8           ; 2
    EOR    #$FF            ; 2
    CLC                    ; 2
L1BF4:
    ADC    #$01            ; 2
    LDX    #$FE            ; 2
L1BF8:
    CMP    #$04            ; 2
    BCC    L1BFE           ; 2
    LDA    #$04            ; 2
L1BFE:
    CPX    #$FF            ; 2
    BCS    L1C06           ; 2
    EOR    #$FF            ; 2
    ADC    #$01            ; 2
L1C06:
    STA    $88             ; 3
    JMP    L1C1F           ; 3
L1C0B:
    LDA    $F1             ; 3
    AND    #$07            ; 2
    CMP    #$07            ; 2
    BNE    L1C1F           ; 2
    LDA    $88             ; 3
    BEQ    L1C1F           ; 2
    BMI    L1C1D           ; 2
    DEC    $88             ; 5
    BPL    L1C1F           ; 2
L1C1D:
    INC    $88             ; 5
L1C1F:
    LDA    $88             ; 3
    CLC                    ; 2
    LDA    $AD             ; 3
    CMP    #$14            ; 2
    BCS    L1C2E           ; 2
    LDA    #$00            ; 2
    STA    $88             ; 3
    LDA    #$14            ; 2
L1C2E:
    CMP    #$8E            ; 2
    BCC    L1C38           ; 2
    LDA    #$00            ; 2
    STA    $88             ; 3
    LDA    #$8E            ; 2
L1C38:
    STA    $AD             ; 3
    RTS                    ; 6

L1C3B:
    LDA    $CC             ; 3
    BNE    L1C90           ; 2
    LDA    $F0             ; 3
    AND    #$02            ; 2
    BNE    L1C90           ; 2
    LDA    $A6             ; 3
    BNE    L1C90           ; 2
    LDA    $93             ; 3
    BEQ    L1C91           ; 2
    CLC                    ; 2
    ADC    $BE             ; 3
    CMP    #$A5            ; 2
    BCC    L1C56           ; 2
    LDA    #$00            ; 2
L1C56:
    STA    $93             ; 3
    LDA    $F1             ; 3
    AND    #$06            ; 2
    CMP    #$02            ; 2
    BNE    L1C6D           ; 2
    LDA    $89             ; 3
    BEQ    L1C6D           ; 2
    BPL    L1C6B           ; 2
    INC    $89             ; 5
    JMP    L1C6D           ; 3
L1C6B:
    DEC    $89             ; 5
L1C6D:
    LDA    $89             ; 3
    CLC                    ; 2
    ADC    $B4             ; 3
    STA    $B4             ; 3
    CMP    #$22            ; 2
    BCS    L1C7C           ; 2
    LDA    #$23            ; 2
    BNE    L1C82           ; 2
L1C7C:
    CMP    #$A0            ; 2
    BCC    L1C90           ; 2
    LDA    #$9F            ; 2
L1C82:
    STA    $B4             ; 3
    JSR    L1E70           ; 6
    LDA    $89             ; 3
    EOR    #$FF            ; 2
    CLC                    ; 2
    ADC    #$01            ; 2
    STA    $89             ; 3
L1C90:
    RTS                    ; 6

L1C91:
    LDX    $90             ; 3
    LDA    REFP1,X         ; 4
    BMI    L1C90           ; 2
    LDA    #$7F            ; 2
    AND    $EF             ; 3
    STA    $EF             ; 3
    LDA    $EC             ; 3
    CMP    #$05            ; 2
    BCC    L1CA5           ; 2
    INC    $86             ; 5
L1CA5:
    LDA    $88             ; 3
    STA    $89             ; 3
    LDA    $AD             ; 3
    ADC    #$11            ; 2
    STA    $B4             ; 3
    LDA    #$12            ; 2
    BNE    L1C56           ; 2
L1CB3:
    LDX    #$00            ; 2
L1CB5:
    LDA    $BF,X           ; 4
    CMP    #$F0            ; 2
    BNE    L1CC1           ; 2
    INX                    ; 2
    CPX    #$06            ; 2
    BNE    L1CB5           ; 2
    RTS                    ; 6

L1CC1:
    STX    $A2             ; 3
    CLC                    ; 2
    RTS                    ; 6

L1CC5:
    LDA    #$00            ; 2
    LDX    #$02            ; 2
L1CC9:
    STA    $E6,X           ; 4
    STA    $D1,X           ; 4
    DEX                    ; 2
    BPL    L1CC9           ; 2
    RTS                    ; 6

L1CD1:
    PHA                    ; 3
    LDA    $F1             ; 3
    AND    #$0F            ; 2
    TAY                    ; 2
    PLA                    ; 4
L1CD8:
    CLC                    ; 2
    ADC    L1CE1,Y         ; 4
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    RTS                    ; 6

L1CE1:
    .byte $09,$02,$0B,$04,$0D,$06,$0F,$08,$01,$0A,$03,$0C,$05,$0E,$07,$00
    .byte $7E,$00,$FF
L1CF4:
    .byte $03,$05
    
L1CF6:
    STA    $E7             ; 3
    LDA    $E7             ; 3
    PHP                    ; 3
    BPL    L1D02           ; 2
    CLC                    ; 2
    EOR    #$FF            ; 2
    ADC    #$01            ; 2
L1D02:
    LDX    #$09            ; 2
L1D04:
    CMP    L1D4C,X         ; 4
    BCS    L1D0C           ; 2
    DEX                    ; 2
    BNE    L1D04           ; 2
L1D0C:
    STX    $92             ; 3
    LDX    $EC             ; 3
    CPX    #$02            ; 2
    BCC    L1D1B           ; 2
    LDX    $92             ; 3
    LDA    L1D56,X         ; 4
    BCS    L1D1E           ; 2
L1D1B:
    LDA    L1CF4,X         ; 4
L1D1E:
    JSR    L1CD1           ; 6
    PLP                    ; 4
    BMI    L1D29           ; 2
    CLC                    ; 2
    EOR    #$FF            ; 2
    ADC    #$01            ; 2
L1D29:
    STA    $91             ; 3
    CMP    #$02            ; 2
    BCS    L1D34           ; 2
    LDA    $E7             ; 3
    BNE    L1D34           ; 2
    RTS                    ; 6

L1D34:
    LDA    $91             ; 3
    CLC                    ; 2
    LDX    $A2             ; 3
    ADC    $AE,X           ; 4
    CMP    #$15            ; 2
    BPL    L1D43           ; 2
    LDA    #$15            ; 2
    BEQ    L1D49           ; 2
L1D43:
    CMP    #$83            ; 2
    BCC    L1D49           ; 2
    LDA    #$83            ; 2
L1D49:
    STA    $AE,X           ; 4
    RTS                    ; 6

L1D4C:
    .byte $00,$01,$08,$0E,$11,$14,$15,$16,$17,$18
L1D56:
    .byte $00,$08,$0C,$10,$14,$18,$1C,$20,$24,$28,$59
    
    .byte $81 ; |X      X| $1D61
    .byte $81 ; |X      X| $1D62
    .byte $81 ; |X      X| $1D63
    .byte $81 ; |X      X| $1D64
    .byte $81 ; |X      X| $1D65
    .byte $81 ; |X      X| $1D66
    .byte $81 ; |X      X| $1D67
    .byte $81 ; |X      X| $1D68
    .byte $81 ; |X      X| $1D69
    .byte $81 ; |X      X| $1D6A
    .byte $81 ; |X      X| $1D6B
    .byte $81 ; |X      X| $1D6C
    .byte $81 ; |X      X| $1D6D
    .byte $81 ; |X      X| $1D6E
    .byte $81 ; |X      X| $1D6F
    .byte $81 ; |X      X| $1D70
    .byte $24 ; |  X  X  | $1D71
    .byte $24 ; |  X  X  | $1D72
    .byte $24 ; |  X  X  | $1D73
    .byte $24 ; |  X  X  | $1D74
    .byte $24 ; |  X  X  | $1D75
    .byte $24 ; |  X  X  | $1D76
    .byte $24 ; |  X  X  | $1D77
    .byte $24 ; |  X  X  | $1D78
    .byte $24 ; |  X  X  | $1D79
    .byte $24 ; |  X  X  | $1D7A
    .byte $24 ; |  X  X  | $1D7B
    .byte $24 ; |  X  X  | $1D7C
    .byte $24 ; |  X  X  | $1D7D
    .byte $24 ; |  X  X  | $1D7E
    .byte $24 ; |  X  X  | $1D7F
    .byte $24 ; |  X  X  | $1D80
    .byte $18 ; |   XX   | $1D81
    .byte $18 ; |   XX   | $1D82
    .byte $18 ; |   XX   | $1D83
    .byte $18 ; |   XX   | $1D84
    .byte $18 ; |   XX   | $1D85
    .byte $18 ; |   XX   | $1D86
    .byte $18 ; |   XX   | $1D87
    .byte $18 ; |   XX   | $1D88
    .byte $18 ; |   XX   | $1D89
    .byte $18 ; |   XX   | $1D8A
    .byte $18 ; |   XX   | $1D8B
    .byte $18 ; |   XX   | $1D8C
    .byte $18 ; |   XX   | $1D8D
    .byte $18 ; |   XX   | $1D8E
    .byte $18 ; |   XX   | $1D8F
    .byte $18 ; |   XX   | $1D90
    .byte $00 ; |        | $1D91
    .byte $00 ; |        | $1D92
    .byte $00 ; |        | $1D93
    .byte $00 ; |        | $1D94
    .byte $18 ; |   XX   | $1D95
    .byte $18 ; |   XX   | $1D96
    .byte $18 ; |   XX   | $1D97
    .byte $18 ; |   XX   | $1D98
    .byte $18 ; |   XX   | $1D99
    .byte $18 ; |   XX   | $1D9A
    .byte $18 ; |   XX   | $1D9B
    .byte $18 ; |   XX   | $1D9C
    .byte $00 ; |        | $1D9D
    .byte $00 ; |        | $1D9E
    .byte $00 ; |        | $1D9F
    .byte $00 ; |        | $1DA0
    .byte $00 ; |        | $1DA1
    .byte $00 ; |        | $1DA2
    .byte $00 ; |        | $1DA3
    .byte $00 ; |        | $1DA4
    .byte $00 ; |        | $1DA5
    .byte $00 ; |        | $1DA6
    .byte $00 ; |        | $1DA7
    .byte $18 ; |   XX   | $1DA8
    .byte $18 ; |   XX   | $1DA9
    .byte $00 ; |        | $1DAA
    .byte $00 ; |        | $1DAB
    .byte $00 ; |        | $1DAC
    .byte $00 ; |        | $1DAD
    .byte $00 ; |        | $1DAE
    .byte $00 ; |        | $1DAF
    .byte $00 ; |        | $1DB0
L1DB1:
    .byte $30,$60,$90,$C0,$F0
L1DB6:
    .byte $00,$30,$60,$90,$C0
L1DBB:
    LDA    $F0             ; 3
    AND    #$02            ; 2
    BNE    L1E02           ; 2
    LDA    $94             ; 3
    BNE    L1E03           ; 2
    JSR    L1CB3           ; 6
    CPX    #$06            ; 2
    BEQ    L1E02           ; 2
    LDA    $84             ; 3
    CMP    #$02            ; 2
    BCS    L1E02           ; 2
    LDA    $AD             ; 3
    ADC    #$04            ; 2
    STA    $85             ; 3
    INC    $87             ; 5
    LDA    $87             ; 3
    AND    #$0F            ; 2
    TAY                    ; 2
    LDA    $86             ; 3
    JSR    L1CD8           ; 6
    BEQ    L1DE8           ; 2
    LDA    #$04            ; 2
L1DE8:
    EOR    $F0             ; 3
    AND    #$04            ; 2
    EOR    $F0             ; 3
    STA    $F0             ; 3
    LDX    $A2             ; 3
    LDA    $AE,X           ; 4
    CLC                    ; 2
    ADC    #$18            ; 2
    STA    $B5             ; 3
    LDA    #$0F            ; 2
L1DFB:
    ADC    #$10            ; 2
    DEX                    ; 2
    BPL    L1DFB           ; 2
L1E00:
    STA    $94             ; 3
L1E02:
    RTS                    ; 6

L1E03:
    LDA    #$FE            ; 2
    CLC                    ; 2
    ADC    $94             ; 3
    CMP    #$9D            ; 2
    BCC    L1E00           ; 2
    LDA    #$00            ; 2
    BEQ    L1E00           ; 2
L1E10:
    LDA    $93,X           ; 4
    BEQ    L1E25           ; 2
    LDA    #$FF            ; 2
    EOR    $BE             ; 3
    SEC                    ; 2
    ROR                    ; 2
    SEC                    ; 2
    ADC    $93,X           ; 4
    CMP    #$A5            ; 2
    BCC    L1E23           ; 2
    LDA    #$00            ; 2
L1E23:
    STA    $93,X           ; 4
L1E25:
    RTS                    ; 6

L1E26:
    ASL    $91             ; 5
    LDA    $B6,X           ; 4
    SEC                    ; 2
    SBC    #$01            ; 2
    CMP    $B4             ; 3
    BCS    L1E77           ; 2
    ADC    #$04            ; 2
    CMP    $B4             ; 3
    BCC    L1E77           ; 2
    LDA    $93             ; 3
    BEQ    L1E77           ; 2
    LDA    $95,X           ; 4
    BEQ    L1E77           ; 2
    CMP    #$0A            ; 2
    BCC    L1E77           ; 2
    SBC    $93             ; 3
    STA    $92             ; 3
    LDA    $BE             ; 3
    ASL                    ; 2
    CMP    $92             ; 3
    BCC    L1E77           ; 2
    LDA    #$00            ; 2
    STA    $93             ; 3
    STA    $95,X           ; 4
    SEC                    ; 2
    LDA    #$02            ; 2
L1E57:
    SED                    ; 2
    CLC                    ; 2
    LDX    $90             ; 3
    BEQ    L1E5F           ; 2
    LDX    #$03            ; 2
L1E5F:
    ADC    $8C,X           ; 4
    STA    $8C,X           ; 4
    LDA    #$00            ; 2
    ADC    $8B,X           ; 4
    STA    $8B,X           ; 4
    LDA    #$00            ; 2
    ADC    $8A,X           ; 4
    STA    $8A,X           ; 4
    CLD                    ; 2
L1E70:
    LDA    #$08            ; 2
    ORA    $F0             ; 3
    STA    $F0             ; 3
    RTS                    ; 6

L1E77:
    CLC                    ; 2
    RTS                    ; 6

L1E79:
    LDA    $E6,X           ; 4
    BEQ    L1EB9           ; 2
    LDA    $F1             ; 3
    LSR                    ; 2
    PHP                    ; 3
    BCS    L1E8C           ; 2
    STX    $91             ; 3
    LDA    #$02            ; 2
    JSR    L1E57           ; 6
    LDX    $91             ; 3
L1E8C:
    LDA    #$00            ; 2
    STA    $93,X           ; 4
    LDA    $E6,X           ; 4
    LDX    #$05            ; 2
L1E94:
    LSR                    ; 2
    BCS    L1E9A           ; 2
    DEX                    ; 2
    BPL    L1E94           ; 2
L1E9A:
    LDA    L1BAA,X         ; 4
    ORA    $C8             ; 3
    STA    $C8             ; 3
    LDA    #$08            ; 2
    STA    $B9             ; 3
    LDA    L1BAA,X         ; 4
    PLP                    ; 4
    BCC    L1EAF           ; 2
    ORA    $C7             ; 3
    BNE    L1EB3           ; 2
L1EAF:
    EOR    #$FF            ; 2
    AND    $C7             ; 3
L1EB3:
    STA    $C7             ; 3
    LDA    #$61            ; 2
    STA    $BF,X           ; 4
L1EB9:
    RTS                    ; 6

L1EBA:
    LDA    L1BAA,X         ; 4
    AND    $C8             ; 3
    BEQ    L1F13           ; 2
    LDA    $BF,X           ; 4
    CMP    #$A1            ; 2
    BNE    L1F0A           ; 2
    LDA    L1BAA,X         ; 4
    BIT    $C7             ; 3
    PHP                    ; 3
    EOR    #$FF            ; 2
    AND    $C8             ; 3
    STA    $C8             ; 3
    PLP                    ; 4
    BNE    L1EE9           ; 2
    CPX    $B8             ; 3
    BNE    L1EE0           ; 2
    DEC    $B8             ; 5
    LDA    #$00            ; 2
    BEQ    L1EE2           ; 2
L1EE0:
    LDA    #$0E            ; 2
L1EE2:
    STA    $A7,X           ; 4
    LDA    #$F0            ; 2
    STA    $BF,X           ; 4
    RTS                    ; 6

L1EE9:
    LDA    #$02            ; 2
    STA    $BA             ; 3
    STX    $91             ; 3
    LDX    $B8             ; 3
    CPX    #$05            ; 2
    BNE    L1EF7           ; 2
    BEQ    L1F07           ; 2
L1EF7:
    INC    $B8             ; 5
    INX                    ; 2
    LDA    L1BAA,X         ; 4
    EOR    #$FF            ; 2
    AND    $C8             ; 3
    STA    $C8             ; 3
    LDA    #$A1            ; 2
    STA    $BF,X           ; 4
L1F07:
    LDX    $91             ; 3
    RTS                    ; 6

L1F0A:
    INC    $B9             ; 5
    CLC                    ; 2
    ADC    #$10            ; 2
    STA    $BF,X           ; 4
    BNE    L1F3B           ; 2
L1F13:
    INC    $BA             ; 5
    LDA    $BF,X           ; 4
    CMP    #$61            ; 2
    BNE    L1F36           ; 2
    LDA    #$00            ; 2
    STA    AUDV1           ; 3
    LDA    $83             ; 3
    LSR                    ; 2
    AND    #$07            ; 2
    TAY                    ; 2
    LDA    L1DB6,Y         ; 4
    STA    $BF,X           ; 4
    LDA    L1BAA,X         ; 4
    EOR    #$FF            ; 2
    AND    $C7             ; 3
    STA    $C7             ; 3
    JMP    L1F3B           ; 3
L1F36:
    SEC                    ; 2
    SBC    #$10            ; 2
    STA    $BF,X           ; 4
L1F3B:
    RTS                    ; 6

L1F3C:
    LDA    $F0             ; 3
    LSR                    ; 2
    BCC    L1F42           ; 2
    RTS                    ; 6

L1F42:
    LDA    $C8             ; 3
    BEQ    L1F64           ; 2
    LDA    $F1             ; 3
    LSR                    ; 2
    BCS    L1F9D           ; 2
    INC    $B9             ; 5
    LDA    $B9             ; 3
    STA    AUDF0           ; 3
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    ADC    #$01            ; 2
    LSR                    ; 2
    STA    AUDF1           ; 3
    LDA    #$04            ; 2
    STA    AUDC1           ; 3
    LDA    #$0C            ; 2
    STA    AUDC0           ; 3
    BNE    L1F9D           ; 2
L1F64:
    LDA    #$00            ; 2
    STA    AUDV1           ; 3
    LDA    $F1             ; 3
    LSR                    ; 2
    EOR    #$0E            ; 2
    AND    #$19            ; 2
    ORA    $EF             ; 3
    STA    AUDF0           ; 3
    AND    #$90            ; 2
    PHA                    ; 3
    LDX    #$00            ; 2
    LDY    $B8             ; 3
    BMI    L1F90           ; 2
    LDX    L1A5E,Y         ; 4
    BEQ    L1F90           ; 2
    LDA    $F1             ; 3
    EOR    #$FF            ; 2
    CLC                    ; 2
    ADC    #$01            ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
L1F8B:
    ASL                    ; 2
    DEX                    ; 2
    BNE    L1F8B           ; 2
    TAX                    ; 2
L1F90:
    STX    AUDV0           ; 3
    AND    #$0F            ; 2
    ORA    $FD             ; 3
    STA    $84             ; 3
    PLA                    ; 4
    LDA    #$06            ; 2
    STA    AUDC0           ; 3
L1F9D:
    LDA    $F1             ; 3
    LSR                    ; 2
    BCS    L1FB4           ; 2
    LDA    $BA             ; 3
    CMP    #$00            ; 2
    BEQ    L1FB4           ; 2
    DEC    $BA             ; 5
    STA    AUDF1           ; 3
    EOR    #$FF            ; 2
    STA    AUDV1           ; 3
    LDA    #$04            ; 2
    STA    AUDC1           ; 3
L1FB4:
    LDA    $F0             ; 3
    AND    #$08            ; 2
    BEQ    L1FD1           ; 2
    EOR    $F0             ; 3
    STA    $F0             ; 3
    LDA    #$FF            ; 2
    STA    AUDV1           ; 3
    LDA    #$0C            ; 2
    STA    AUDC1           ; 3
    LDA    $CB             ; 3
    EOR    #$08            ; 2
    STA    $CB             ; 3
    LSR                    ; 2
    ORA    #$01            ; 2
    STA    AUDF1           ; 3
L1FD1:
    LDA    $A3             ; 3
    BEQ    L1FE6           ; 2
    LDA    $F1             ; 3
    ASL                    ; 2
    STA    AUDF0           ; 3
    DEC    $A3             ; 5
    LDA    $A3             ; 3
    LSR                    ; 2
    LSR                    ; 2
    STA    AUDV0           ; 3
    LDA    #$03            ; 2
    STA    AUDC0           ; 3
L1FE6:
    RTS                    ; 6

L1FE7:
    .byte $93,$92,$91,$8F,$8C,$87,$80,$73
L1FEF:
    .byte $01,$0C,$14,$1C
L1FF3:
    .byte $10,$0C,$08,$04
L1FF7:
    .byte $93,$9E,$B4
L1FFA:
    .byte $40,$80,$85,$14
L1FFE:
    .byte $1C,$8C
