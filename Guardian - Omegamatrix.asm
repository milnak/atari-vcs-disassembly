; Rough disassembly of Guardian
; Disassembled by Omegamatrix
;
;
; Rom Hunter:
; The manual states that a free planet is awarded every 50k but someone has played it to over 150k
; and never got any. Maybe the routine for extra lives was never implemented, or maybe there are 2 versions?
;
;
;
;
; Command Line: limit -cGuard.cfg guard.bin
;
; Guard.cfg contents:
;
;      ORG 3000
;      GFX 3000 3143
;      CODE 3144 37E7
;      GFX 37E8 3838
;      CODE 3839 38E2
;      GFX 38E3 38FC
;      CODE 38FD 3FC3
;      GFX 3FC4 3FFF

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
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
CXCLR   =  $2C
CXP0FB  =  $32
CXP1FB  =  $33
CXBLPF  =  $36
CXPPMM  =  $37
INPT0   =  $38
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

RandomBytes  =  $3200

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RIOT RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

frameCounter       ds 1  ;$80
ram_81             ds 1  ; x8
ram_82             ds 1  ; x5
ram_83             ds 1  ; x16
colBackGround      ds 1  ;$84
ram_85             ds 1  ; x14
ram_86             ds 1  ; x7
ram_87             ds 1  ; x6
ram_88             ds 1  ; x2
ram_89             ds 1  ; x4
ram_8A             ds 1  ; x15
ram_8B             ds 2  ; x2
ram_8D             ds 1  ; x3
ram_8E             ds 1  ; x2
ram_8F             ds 1  ; x4
ram_90             ds 1  ; x1
ram_91             ds 1  ; x5
ram_92             ds 1  ; x5
ram_93             ds 1  ; x3
ram_94             ds 1  ; x5
ram_95             ds 1  ; x8
ram_96             ds 1  ; x3
ram_97             ds 1  ; x3
ram_98             ds 1  ; x3
ram_99             ds 1  ; x13
ram_9A             ds 1  ; x10
ram_9B             ds 2  ; x5
ram_9D             ds 2  ; x2
ram_9F             ds 2  ; x2
ram_A1             ds 2  ; x2
ram_A3             ds 2  ; x2
ram_A5             ds 2  ; x2
ram_A7             ds 3  ; x1
ram_AA             ds 1  ; x6  BCD score $AA-$AC
ram_AB             ds 1  ; x1
ram_AC             ds 1  ; x2
ram_AD             ds 1  ; x3
ram_AE             ds 1  ; x6
ram_AF             ds 1  ; x7
ram_B0             ds 1  ; x4
ram_B1             ds 1  ; x3
ram_B2             ds 6  ; x7  shields
ram_B8             ds 6  ; x2  shields
ram_BE             ds 1  ; x10 shields
ram_BF             ds 1  ; x8
ram_C0             ds 1  ; x3
ram_C1             ds 1  ; x1
ram_C2             ds 1  ; x7
ram_C3             ds 1  ; x4
ram_C4             ds 1  ; x6
ram_C5             ds 1  ; x2
ram_C6             ds 9  ; x16
ram_CF             ds 1  ; x2
ram_D0             ds 4  ; x11
ram_D4             ds 1  ; x1
ram_D5             ds 4  ; x1
ram_D9             ds 1  ; x6
ram_DA             ds 3  ; x21
ram_DD             ds 1  ; x1
ram_DE             ds 1  ; x1
ram_DF             ds 1  ; x1
ram_E0             ds 2  ; x1
ram_E2             ds 1  ; x2
ram_E3             ds 1  ; x2
ram_E4             ds 1  ; x5
ram_E5             ds 1  ; x4
ram_E6             ds 1  ; x8
ram_E7             ds 1  ; x2
ram_E8             ds 1  ; x4
ram_E9             ds 1  ; x2
ram_EA             ds 1  ; x4
ram_EB             ds 1  ; x3
ram_EC             ds 1  ; x21
ram_ED             ds 1  ; x52
ram_EE             ds 1  ; x17
ram_EF             ds 1  ; x19
ram_F0             ds 1  ; x28
ram_F1             ds 1  ; x16
ram_F2             ds 1  ; x19
ram_F3             ds 13 ; x7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE
       ORG $3000

NumberGfx:
Zero:
    .byte $3C ; |  XXXX  | $3000
    .byte $66 ; | XX  XX | $3001
    .byte $66 ; | XX  XX | $3002
    .byte $66 ; | XX  XX | $3003
    .byte $66 ; | XX  XX | $3004
    .byte $66 ; | XX  XX | $3005
    .byte $3C ; |  XXXX  | $3006
    .byte $00 ;            $3007
One:
    .byte $3C ; |  XXXX  | $3008
    .byte $18 ; |   XX   | $3009
    .byte $18 ; |   XX   | $300A
    .byte $18 ; |   XX   | $300B
    .byte $18 ; |   XX   | $300C
    .byte $38 ; |  XXX   | $300D
    .byte $18 ; |   XX   | $300E
    .byte $00 ;            $300F
Two:
    .byte $7E ; | XXXXXX | $3010
    .byte $60 ; | XX     | $3011
    .byte $30 ; |  XX    | $3012
    .byte $18 ; |   XX   | $3013
    .byte $0C ; |    XX  | $3014
    .byte $66 ; | XX  XX | $3015
    .byte $3C ; |  XXXX  | $3016
    .byte $00 ;            $3017
Three:
    .byte $3C ; |  XXXX  | $3018
    .byte $66 ; | XX  XX | $3019
    .byte $06 ; |     XX | $301A
    .byte $1C ; |   XXX  | $301B
    .byte $06 ; |     XX | $301C
    .byte $66 ; | XX  XX | $301D
    .byte $3C ; |  XXXX  | $301E
    .byte $00 ;            $301F  <--  never reached in my testing
Four:
    .byte $0C ; |    XX  | $3020
    .byte $7E ; | XXXXXX | $3021
    .byte $6C ; | XX XX  | $3022
    .byte $6C ; | XX XX  | $3023
    .byte $3C ; |  XXXX  | $3024
    .byte $1C ; |   XXX  | $3025
    .byte $0C ; |    XX  | $3026
    .byte $00 ;            $3027  <--  never reached in my testing
Five:
    .byte $3C ; |  XXXX  | $3028
    .byte $66 ; | XX  XX | $3029
    .byte $06 ; |     XX | $302A
    .byte $06 ; |     XX | $302B
    .byte $7C ; | XXXXX  | $302C
    .byte $60 ; | XX     | $302D
    .byte $7C ; | XXXXX  | $302E
    .byte $00 ;            $302F  <--  never reached in my testing
Six:
    .byte $3C ; |  XXXX  | $3030
    .byte $66 ; | XX  XX | $3031
    .byte $66 ; | XX  XX | $3032
    .byte $7C ; | XXXXX  | $3033
    .byte $60 ; | XX     | $3034
    .byte $66 ; | XX  XX | $3035
    .byte $3C ; |  XXXX  | $3036
    .byte $00 ;            $3037  <--  never reached in my testing
Seven:
    .byte $30 ; |  XX    | $3038
    .byte $30 ; |  XX    | $3039
    .byte $18 ; |   XX   | $303A
    .byte $0C ; |    XX  | $303B
    .byte $06 ; |     XX | $303C
    .byte $06 ; |     XX | $303D
    .byte $7E ; | XXXXXX | $303E
    .byte $00 ;            $303F  <--  never reached in my testing
Eight:
    .byte $3C ; |  XXXX  | $3040
    .byte $66 ; | XX  XX | $3041
    .byte $66 ; | XX  XX | $3042
    .byte $3C ; |  XXXX  | $3043
    .byte $66 ; | XX  XX | $3044
    .byte $66 ; | XX  XX | $3045
    .byte $3C ; |  XXXX  | $3046
    .byte $00 ;            $3047  <--  never reached in my testing
Nine:
    .byte $3C ; |  XXXX  | $3048
    .byte $66 ; | XX  XX | $3049
    .byte $06 ; |     XX | $304A
    .byte $3E ; |  XXXXX | $304B
    .byte $66 ; | XX  XX | $304C
    .byte $66 ; | XX  XX | $304D
    .byte $3C ; |  XXXX  | $304E
    .byte $00 ;            $304F  <--  never reached in my testing
BlankDigit:
    .byte $00 ; |        | $3050
    .byte $00 ; |        | $3051
    .byte $00 ; |        | $3052
    .byte $00 ; |        | $3053
    .byte $00 ; |        | $3054
    .byte $00 ; |        | $3055
    .byte $00 ; |        | $3056
    .byte $00 ; |        | $3057
    .byte $81 ; |X      X| $3058
    .byte $42 ; | X    X | $3059
    .byte $24 ; |  X  X  | $305A
    .byte $18 ; |   XX   | $305B
    .byte $18 ; |   XX   | $305C
    .byte $00 ; |        | $305D
    .byte $00 ; |        | $305E
    .byte $00 ; |        | $305F
    .byte $30 ; |  XX    | $3060
    .byte $30 ; |  XX    | $3061
    .byte $0C ; |    XX  | $3062
    .byte $0C ; |    XX  | $3063
    .byte $00 ; |        | $3064
    .byte $00 ; |        | $3065
    .byte $18 ; |   XX   | $3066
    .byte $24 ; |  X  X  | $3067
    .byte $42 ; | X    X | $3068
    .byte $42 ; | X    X | $3069
    .byte $24 ; |  X  X  | $306A
    .byte $18 ; |   XX   | $306B
    .byte $00 ; |        | $306C
    .byte $42 ; | X    X | $306D
    .byte $24 ; |  X  X  | $306E
    .byte $24 ; |  X  X  | $306F
    .byte $3C ; |  XXXX  | $3070
    .byte $18 ; |   XX   | $3071
    .byte $00 ; |        | $3072
    .byte $00 ; |        | $3073
    .byte $18 ; |   XX   | $3074
    .byte $FF ; |XXXXXXXX| $3075
    .byte $18 ; |   XX   | $3076
    .byte $00 ; |        | $3077
    .byte $00 ; |        | $3078
    .byte $00 ; |        | $3079
    .byte $18 ; |   XX   | $307A
    .byte $3C ; |  XXXX  | $307B
    .byte $24 ; |  X  X  | $307C
    .byte $24 ; |  X  X  | $307D
    .byte $42 ; | X    X | $307E
    .byte $00 ; |        | $307F
    .byte $00 ; |        | $3080
    .byte $18 ; |   XX   | $3081
    .byte $18 ; |   XX   | $3082
    .byte $24 ; |  X  X  | $3083
    .byte $42 ; | X    X | $3084
    .byte $81 ; |X      X| $3085
    .byte $00 ; |        | $3086
    .byte $18 ; |   XX   | $3087
    .byte $7E ; | XXXXXX | $3088
    .byte $54 ; | X X X  | $3089
    .byte $7E ; | XXXXXX | $308A
    .byte $18 ; |   XX   | $308B
    .byte $00 ; |        | $308C
    .byte $00 ; |        | $308D
    .byte $18 ; |   XX   | $308E
    .byte $7E ; | XXXXXX | $308F
    .byte $2A ; |  X X X | $3090
    .byte $7E ; | XXXXXX | $3091
    .byte $18 ; |   XX   | $3092
    .byte $00 ; |        | $3093
    .byte $00 ; |        | $3094
    .byte $10 ; |   X    | $3095
    .byte $10 ; |   X    | $3096
    .byte $08 ; |    X   | $3097
    .byte $08 ; |    X   | $3098
    .byte $00 ; |        | $3099
    .byte $00 ; |        | $309A
    .byte $08 ; |    X   | $309B
    .byte $08 ; |    X   | $309C
    .byte $10 ; |   X    | $309D
    .byte $10 ; |   X    | $309E
    .byte $00 ; |        | $309F
    .byte $00 ; |        | $30A0
    .byte $52 ; | X X  X | $30A1
    .byte $81 ; |X      X| $30A2
    .byte $54 ; | X X X  | $30A3
    .byte $94 ; |X  X X  | $30A4
    .byte $21 ; |  X    X| $30A5
    .byte $4A ; | X  X X | $30A6
    .byte $81 ; |X      X| $30A7
    .byte $4A ; | X  X X | $30A8
    .byte $04 ; |     X  | $30A9
    .byte $08 ; |    X   | $30AA
    .byte $10 ; |   X    | $30AB
    .byte $3C ; |  XXXX  | $30AC
    .byte $08 ; |    X   | $30AD
    .byte $10 ; |   X    | $30AE
    .byte $3C ; |  XXXX  | $30AF
    .byte $08 ; |    X   | $30B0
    .byte $10 ; |   X    | $30B1
    .byte $3C ; |  XXXX  | $30B2
    .byte $08 ; |    X   | $30B3
    .byte $10 ; |   X    | $30B4
    .byte $3C ; |  XXXX  | $30B5
    .byte $08 ; |    X   | $30B6
    .byte $10 ; |   X    | $30B7
    .byte $20 ; |  X     | $30B8
    .byte $30 ; |  XX    | $30B9
    .byte $30 ; |  XX    | $30BA
    .byte $18 ; |   XX   | $30BB
    .byte $18 ; |   XX   | $30BC
    .byte $18 ; |   XX   | $30BD
    .byte $18 ; |   XX   | $30BE
    .byte $0C ; |    XX  | $30BF
    .byte $0C ; |    XX  | $30C0
    .byte $0C ; |    XX  | $30C1
    .byte $0C ; |    XX  | $30C2
    .byte $18 ; |   XX   | $30C3
    .byte $18 ; |   XX   | $30C4
    .byte $18 ; |   XX   | $30C5
    .byte $18 ; |   XX   | $30C6
    .byte $30 ; |  XX    | $30C7
    .byte $30 ; |  XX    | $30C8
    .byte $08 ; |    X   | $30C9
    .byte $08 ; |    X   | $30CA
    .byte $08 ; |    X   | $30CB
    .byte $08 ; |    X   | $30CC
    .byte $10 ; |   X    | $30CD
    .byte $10 ; |   X    | $30CE
    .byte $10 ; |   X    | $30CF
    .byte $10 ; |   X    | $30D0
    .byte $30 ; |  XX    | $30D1
    .byte $30 ; |  XX    | $30D2
    .byte $10 ; |   X    | $30D3
    .byte $10 ; |   X    | $30D4
    .byte $08 ; |    X   | $30D5
    .byte $08 ; |    X   | $30D6
    .byte $0C ; |    XX  | $30D7
    .byte $0C ; |    XX  | $30D8
    .byte $04 ; |     X  | $30D9
    .byte $04 ; |     X  | $30DA
    .byte $0C ; |    XX  | $30DB
    .byte $0C ; |    XX  | $30DC
    .byte $30 ; |  XX    | $30DD
    .byte $30 ; |  XX    | $30DE
    .byte $20 ; |  X     | $30DF
    .byte $20 ; |  X     | $30E0
    .byte $24 ; |  X  X  | $30E1
    .byte $00 ; |        | $30E2
    .byte $A5 ; |X X  X X| $30E3
    .byte $18 ; |   XX   | $30E4
    .byte $18 ; |   XX   | $30E5
    .byte $A5 ; |X X  X X| $30E6
    .byte $00 ; |        | $30E7
    .byte $24 ; |  X  X  | $30E8

L30E9:
    .byte $50   ; $30E9
    .byte $50   ; $30EA
    .byte $50   ; $30EB
    .byte $50   ; $30EC
    .byte $E1   ; $30ED
    .byte $A1   ; $30EE
    .byte $E1   ; $30EF
    .byte $A1   ; $30F0
    .byte $C9   ; $30F1
    .byte $93   ; $30F2
    .byte $5E   ; $30F3
    .byte $99   ; $30F4
    .byte $6C   ; $30F5
    .byte $72   ; $30F6
    .byte $79   ; $30F7
    .byte $72   ; $30F8
    .byte $C9   ; $30F9
    .byte $D1   ; $30FA
    .byte $5E   ; $30FB
    .byte $D9   ; $30FC
    .byte $58   ; $30FD
    .byte $72   ; $30FE
    .byte $7F   ; $30FF
    .byte $72   ; $3100
    .byte $86   ; $3101
    .byte $86   ; $3102
    .byte $8D   ; $3103
    .byte $8D   ; $3104
    .byte $99   ; $3105
    .byte $B9   ; $3106
    .byte $93   ; $3107
    .byte $C1   ; $3108
    .byte $65   ; $3109
    .byte $72   ; $310A
    .byte $65   ; $310B
    .byte $72   ; $310C
    .byte $93   ; $310D
    .byte $99   ; $310E
    .byte $93   ; $310F
    .byte $99   ; $3110
    .byte $65   ; $3111
    .byte $93   ; $3112
    .byte $65   ; $3113
    .byte $99   ; $3114
    .byte $A9   ; $3115
    .byte $B1   ; $3116
    .byte $A9   ; $3117
    .byte $B1   ; $3118
L3119:
    .byte $00   ; $3119
    .byte $04   ; $311A
    .byte $0C   ; $311B
    .byte $10   ; $311C
    .byte $2C   ; $311D
    .byte $14   ; $311E
    .byte $20   ; $311F
    .byte $28   ; $3120
    .byte $1C   ; $3121
    .byte $08   ; $3122
    .byte $24   ; $3123
    .byte $18   ; $3124
    
L3125:
    .byte $00   ; $3125   NUSIZx
    .byte $04   ; $3126
    .byte $04   ; $3127
    .byte $06   ; $3128
    .byte $04   ; $3129
    .byte $05   ; $312A
    .byte $06   ; $312B
    .byte $07   ; $312C  <--  never reached in my testing
L312D:
    .byte $FB   ; $312D   AND mask to decreases planets 
    .byte $FD   ; $312E
    .byte $FE   ; $312F
    
L3130:
    .byte $00   ; $3130
    .byte $40   ; $3131
    .byte $20   ; $3132
    .byte $20   ; $3133  <--  never reached in my testing
    .byte $00   ; $3134
    .byte $00   ; $3135
    .byte $00   ; $3136
    .byte $00   ; $3137  <--  never reached in my testing

    .byte $FF ; |XXXXXXXX| $3138
    .byte $00 ; |        | $3139
    .byte $01 ; |       X| $313A
    .byte $0F ; |    XXXX| $313B
    .byte $0E ; |    XXX | $313C
    .byte $44 ; | X   X  | $313D
    .byte $40 ; | X      | $313E
    .byte $E0 ; |XXX     | $313F
    .byte $F0 ; |XXXX    | $3140
    .byte $10 ; |   X    | $3141
    .byte $06 ; |     XX | $3142
    .byte $FF ; |XXXXXXXX| $3143

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L3144 x2

L3144 SUBROUTINE
    sta    ram_EC                ; 3
    lda    #$E6                  ; 2
    sta    ram_EE                ; 3
    lda    #$E9                  ; 2
    sta    ram_F0                ; 3
    lda    #$00                  ; 2
    sta    ram_ED                ; 3
    sta    ram_EF                ; 3
    sta    ram_F1                ; 3
    ldy    #$00                  ; 2
    sty    ram_F2                ; 3
L315A:
    lda    (ram_EC),Y            ; 5  $E6,$E7,$E8
    and    #$F0                  ; 2
    bne    L3168                 ; 2³
    ldx    ram_F2                ; 3
    bne    L3168                 ; 2³
    lda    #<BlankDigit          ; 2   #$50
    bne    L316B                 ; 3   always branch

L3168:
    dec    ram_F2                ; 5
    lsr                          ; 2
L316B:
    sta    (ram_EE),Y            ; 6
    cpy    #$02                  ; 2
    bne    L3173                 ; 2³
    dec    ram_F2                ; 5
L3173:
    lda    (ram_EC),Y            ; 5
    and    #$0F                  ; 2
    bne    L3181                 ; 2³
    ldx    ram_F2                ; 3
    bne    L3181                 ; 2³
    lda    #<BlankDigit          ; 2   #$50
    bne    L3186                 ; 3   always branch

L3181:
    dec    ram_F2                ; 5
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
L3186:
    sta    (ram_F0),Y            ; 6
    iny                          ; 2
    cpy    #$03                  ; 2
    bne    L315A                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L318E x1

L318E SUBROUTINE
    sta    CXCLR                 ; 3
    ldx    #$00                  ; 2
    lda    ram_E4                ; 3
    and    #$0F                  ; 2
    cmp    #$02                  ; 2
    bmi    L31A6                 ; 2³
    lda    ram_99                ; 3
    cmp    #$08                  ; 2
    bne    L31A6                 ; 2³
    lda    ram_E4                ; 3
    jsr    ShiftHighDigit        ; 6
    tax                          ; 2
L31A6:
    stx    ram_F1                ; 3
    lda    ram_85                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$16                  ; 2
    sta    ram_F0                ; 3
    ldx    #$09                  ; 2
    stx    ram_EC                ; 3
    lda    ram_DA,X              ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L3119,X               ; 4
    adc    ram_9A                ; 3
    tay                          ; 2
    lda    L30E9,Y               ; 4
    adc    ram_99                ; 3
    sta    ram_F3                ; 3
L31C8:
    lda    INTIM                 ; 4
    bne    L31C8                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    COLUBK                ; 3
    sta    ENABL                 ; 3
    sta    ram_8A                ; 3
    lda    #$10                  ; 2
    sta    CTRLPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    L379D                 ; 6
    lda    ram_83                ; 3
    lsr                          ; 2
    bcc    L320E                 ; 2³+1
    lda    colBackGround         ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    ldx    #$05                  ; 2
L31ED:
    txa                          ; 2
    ldy    L30E9,X               ; 4
    asl                          ; 2
    tay                          ; 2
    lda    ram_E6,X              ; 4
    sta.wy ram_9B,Y              ; 5
    dex                          ; 2
    bpl    L31ED                 ; 2³
    ldy    #$24                  ; 2
L31FD:
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    L379D                 ; 6
    dey                          ; 2
    bne    L31FD                 ; 2³+1
    sty    ram_E6                ; 3
    sty    ram_E8                ; 3
    sty    ram_EA                ; 3
    jmp    L345E                 ; 3   finish subroutine elsewhere

L320E:
    ldy    ram_D9                ; 3
    tya                          ; 2
    and    #$0F                  ; 2
    tax                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
L3216:
    dex                          ; 2
    bne    L3216                 ; 2³
    sty    HMBL                  ; 3
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jsr    L388C                 ; 6
    lda    #$94                  ; 2
    ldx    #$50                  ; 2
    stx    HMBL                  ; 3
    jsr    L371E                 ; 6
    stx    HMBL                  ; 3
    jsr    L379D                 ; 6
    lda    ram_C2                ; 3
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    ldy    colBackGround         ; 3
    lda    ram_F1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    ENABL                 ; 3
    stx    ram_EE                ; 3
    dex                          ; 2
    dex                          ; 2
    sty    COLUBK                ; 3
    dex                          ; 2
L324A:
    dex                          ; 2
    bne    L324A                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    ram_EE                ; 3
    dey                          ; 2
L3254:
    dey                          ; 2
    bne    L3254                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_C4                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L3831,X               ; 4
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    ram_E6                ; 3
    sta    ram_9B                ; 3
    lda    ram_E9                ; 3
    sta    ram_A1                ; 3
    lda    ram_E7                ; 3
    sta    ram_9D                ; 3
    jsr    L379D                 ; 6
    lda    #$84                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP1                ; 3
    lda    ram_EA                ; 3
    sta    ram_A3                ; 3
    lda    ram_E8                ; 3
    sta    ram_9F                ; 3
    lda    ram_EB                ; 3
    sta    ram_A5                ; 3
    jsr    L379D                 ; 6
    ldy    #$0B                  ; 2
L328F:
    lda    (ram_C0),Y            ; 5
    and    L3819,Y               ; 4
    and    ram_BE                ; 3
    tax                          ; 2
    eor    #$FF                  ; 2
    and    L3819,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    and    ram_BE                ; 3
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    L3825,Y               ; 4
    sta    COLUP0                ; 3
    jsr    L379D                 ; 6
    dey                          ; 2
    bpl    L328F                 ; 2³
    lda    CXP0FB                ; 3
    sta    ram_E8                ; 3
    iny                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    CXCLR                 ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    jsr    L379D                 ; 6
    ldx    ram_F3                ; 3
    tya                          ; 2
    ldy    ram_99                ; 3
    dey                          ; 2
    bmi    L32CF                 ; 2³
    dex                          ; 2
    lda    NumberGfx,X           ; 4
L32CF:
    sta    ram_F2                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    L379D                 ; 6
    lda    #$29                  ; 2
    adc    ram_AF                ; 3
    sta    COLUP1                ; 3
    lda    ram_F1                ; 3
    asl                          ; 2
    sta    ENABL                 ; 3
    lda    frameCounter          ; 3
    and    #$3C                  ; 2
    adc    #$12                  ; 2
    sta    ram_EF                ; 3
    lda    #$88                  ; 2
    ldy    ram_BE                ; 3
    bne    L32F1                 ; 2³
    lda    ram_F0                ; 3  <--  never reached in my testing
L32F1:
    ldy    #$B2                  ; 2
    jsr    L37A6                 ; 6
    ldx    ram_81                ; 3
    lda    INPT0,X               ; 4
    bpl    L32FE                 ; 2³
    inc    ram_8A                ; 5
L32FE:
    sty    ram_EA                ; 3
    lda    ram_F0                ; 3
    sta    COLUP0                ; 3
    sta    COLUPF                ; 3
    lda    ram_D9                ; 3
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    ram_8D                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    nop                          ; 2
L331A:
    dex                          ; 2
    bne    L331A                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
L3321:
    dey                          ; 2
    bne    L3321                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jsr    L379D                 ; 6
    ldy    ram_E4                ; 3
    cpy    #$01                  ; 2
    beq    L3335                 ; 2³
    ldy    #$00                  ; 2
L3335:
    lda    L3119,Y               ; 4
    clc                          ; 2
    adc    ram_9A                ; 3
    tax                          ; 2
    ldy    L30E9,X               ; 4
    ldx    #$00                  ; 2
    stx    ram_ED                ; 3
L3343:
    lda    L3809,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    NumberGfx,Y           ; 4
    sta    GRP0                  ; 3
    jsr    L379D                 ; 6
    iny                          ; 2
    inc    ram_ED                ; 5
    ldx    ram_ED                ; 3
    cpx    #$08                  ; 2
    bmi    L3343                 ; 2³
    lda    CXP1FB                ; 3
    sta    ram_E6                ; 3
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    HMP1                  ; 3
    sta    CXCLR                 ; 3
    jsr    L379D                 ; 6
    ldy    ram_F2                ; 3
    tya                          ; 2
    beq    L337C                 ; 2³
    lda    frameCounter          ; 3
    and    #$06                  ; 2
    tay                          ; 2
    iny                          ; 2
    lda    L3811,Y               ; 4
L337C:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    #$00                  ; 2
    sta    ENABL                 ; 3
    lda    ram_F0                ; 3
    sta    COLUP0                ; 3
    lda    ram_EF                ; 3
    sta    COLUP1                ; 3
    jsr    L379D                 ; 6
    tya                          ; 2
    beq    L3396                 ; 2³
    dey                          ; 2
    lda    L3811,Y               ; 4
L3396:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    jsr    L379D                 ; 6
    ldx    ram_F3                ; 3
    lda    ram_CF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    ram_F2                ; 3
    sta    GRP0                  ; 3
    lda    #$08                  ; 2
    sec                          ; 2
    sbc    ram_99                ; 3
    beq    L33D4                 ; 2³
    sta    ram_ED                ; 3
L33B2:
    ldy    ram_ED                ; 3
    cpy    #$04                  ; 2
    bne    L33BC                 ; 2³
    lda    ram_CF                ; 3
    sta    GRP1                  ; 3
L33BC:
    ldy    ram_81                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    NumberGfx,X           ; 4
    sta    GRP0                  ; 3
    lda.wy INPT0,Y               ; 4
    asl                          ; 2
    lda    ram_8A                ; 3
    adc    #$00                  ; 2
    sta    ram_8A                ; 3
    inx                          ; 2
    dec    ram_ED                ; 5
    bne    L33B2                 ; 2³
L33D4:
    ldx    #$09                  ; 2
    lda    CXPPMM                ; 3
    sta    CXCLR                 ; 3
    sta    ram_C6,X              ; 4
    dex                          ; 2
    stx    ram_EC                ; 3
L33DF:
    lda    ram_D0,X              ; 4
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    dex                          ; 2
L33ED:
    dex                          ; 2
    bne    L33ED                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_F0                ; 3
    sta    COLUP0                ; 3
    ldx    ram_EC                ; 3
    lda    ram_DA,X              ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L3119,X               ; 4
    clc                          ; 2
    adc    ram_9A                ; 3
    tay                          ; 2
    ldx    L30E9,Y               ; 4
    lda    #$07                  ; 2
    sta    ram_ED                ; 3
L340F:
    ldy    ram_ED                ; 3
    cpy    #$04                  ; 2
    bne    L341C                 ; 2³
    ldy    ram_EC                ; 3
    lda.wy ram_C6,Y              ; 4
    sta    GRP1                  ; 3
L341C:
    lda    NumberGfx,X           ; 4
    ldy    ram_81                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda.wy INPT0,Y               ; 4
    bpl    L342C                 ; 2³
    inc    ram_8A                ; 5
L342C:
    inx                          ; 2
    dec    ram_ED                ; 5
    bpl    L340F                 ; 2³
    ldx    ram_EC                ; 3
    lda    CXPPMM                ; 3
    sta    CXCLR                 ; 3
    sta    ram_C6,X              ; 4
    dex                          ; 2
    stx    ram_EC                ; 3
    cpx    #$06                  ; 2
    bpl    L33DF                 ; 2³+1
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$00                  ; 2
    sty    GRP0                  ; 3
    jsr    L379D                 ; 6
    lda    ram_99                ; 3
    beq    L345C                 ; 2³
    sta    ram_ED                ; 3
L344F:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    ram_EC                ; 3
    lda    ram_C6,X              ; 4
    jsr    L379D                 ; 6
    dec    ram_ED                ; 5
    bne    L344F                 ; 2³
L345C:
    dec    ram_EC                ; 5
L345E:
    lda    ram_86                ; 3
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    GRP1                  ; 3
    dex                          ; 2
L346C:
    dex                          ; 2
    bne    L346C                 ; 2³
    sta    RESP0                 ; 3
    nop                          ; 2
    sta    RESP1                 ; 3
    lda    #$05                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    jsr    L379D                 ; 6
    ldy    #$08                  ; 2
L3483:
    lda    L37E8,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    L37F1,Y               ; 4
    sta    GRP0                  ; 3
    lda    L37FA,Y               ; 4
    sta    GRP1                  ; 3
    jsr    L379D                 ; 6
    dey                          ; 2
    cpy    #$05                  ; 2
    bpl    L3483                 ; 2³
    ldx    ram_89                ; 3
    lda    L37E8,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    L3803,X               ; 4
    sta    GRP0                  ; 3
    lda    L3806,X               ; 4
    sta    GRP1                  ; 3
    jsr    L379D                 ; 6
    dey                          ; 2
L34B7:
    lda    L37E8,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    L37F1,Y               ; 4
    sta    GRP0                  ; 3
    lda    L37FA,Y               ; 4
    sta    GRP1                  ; 3
    jsr    L379D                 ; 6
    dey                          ; 2
    bpl    L34B7                 ; 2³
    iny                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    sta    CXCLR                 ; 3
    jsr    L379D                 ; 6
    dec    ram_EC                ; 5
    ldx    ram_EC                ; 3
    ldy    ram_C6,X              ; 4
    lda    ram_8E                ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
L34EF:
    dex                          ; 2
    bne    L34EF                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    frameCounter          ; 3
    and    #$3C                  ; 2
    adc    #$12                  ; 2
    sta    COLUP1                ; 3
    sty    GRP1                  ; 3
    ldy    ram_99                ; 3
    dey                          ; 2
    bmi    L350F                 ; 2³
L3507:
    jsr    L379D                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bpl    L3507                 ; 2³
L350F:
    jsr    L379D                 ; 6
    ldx    ram_EC                ; 3
L3514:
    lda    #$07                  ; 2
    sta    ram_ED                ; 3
    lda    ram_D0,X              ; 4
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMP1                  ; 3
    dex                          ; 2
    sta    GRP0                  ; 3
    dex                          ; 2
L3529:
    dex                          ; 2
    bne    L3529                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_F0                ; 3
    sta    COLUP0                ; 3
    ldx    ram_EC                ; 3
    lda    ram_DA,X              ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L3119,X               ; 4
    clc                          ; 2
    adc    ram_9A                ; 3
    tay                          ; 2
    ldx    L30E9,Y               ; 4
L3547:
    ldy    ram_ED                ; 3
    cpy    #$03                  ; 2
    bne    L3554                 ; 2³
    ldy    ram_EC                ; 3
    lda.wy ram_C6,Y              ; 4
    sta    GRP1                  ; 3
L3554:
    lda    NumberGfx,X           ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    ldy    ram_81                ; 3
    lda.wy INPT0,Y               ; 4
    asl                          ; 2
    lda    ram_8A                ; 3
    adc    #$00                  ; 2
    sta    ram_8A                ; 3
    inx                          ; 2
    dec    ram_ED                ; 5
    bpl    L3547                 ; 2³
    ldx    ram_EC                ; 3
    lda    CXPPMM                ; 3
    sta    CXCLR                 ; 3
    sta    ram_C6,X              ; 4
    dex                          ; 2
    stx    ram_EC                ; 3
    bne    L3514                 ; 2³
    lda    ram_D0                ; 3
    sta    HMP0                  ; 3
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    dex                          ; 2
L3589:
    dex                          ; 2
    bne    L3589                 ; 2³
    sta    RESP0                 ; 3
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_F0                ; 3
    sta    COLUP0                ; 3
    sta    COLUPF                ; 3
    jsr    L379D                 ; 6
    lda    ram_DA                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L3119,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    clc                          ; 2
    adc    ram_9A                ; 3
    tax                          ; 2
    ldy    L30E9,X               ; 4
    jsr    L379D                 ; 6
    lda    #$08                  ; 2
    sta    ram_EE                ; 3
    lda    #$08                  ; 2
    sec                          ; 2
    sbc    ram_99                ; 3
    beq    L35D3                 ; 2³
    sta    ram_ED                ; 3
L35BE:
    lda    ram_C6                ; 3
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    NumberGfx,Y           ; 4
    sta    GRP0                  ; 3
    jsr    L379D                 ; 6
    iny                          ; 2
    dec    ram_EE                ; 5
    dec    ram_ED                ; 5
    bne    L35BE                 ; 2³
L35D3:
    lda    #$50                  ; 2
    sta    HMBL                  ; 3
    lda    #$00                  ; 2
    sta    HMP1                  ; 3
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    dec    ram_EE                ; 5
    bmi    L35EA                 ; 2³
    lda    NumberGfx,Y           ; 4
    and    #$7E                  ; 2
L35EA:
    sta    GRP0                  ; 3
    tay                          ; 2
    jsr    L379D                 ; 6
    lda    CXPPMM                ; 3
    sta    CXCLR                 ; 3
    sta    ram_C6                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    tya                          ; 2
    beq    L3603                 ; 2³+1
    lda    frameCounter          ; 3
    and    #$06                  ; 2
    tay                          ; 2
    lda    L3811,Y               ; 4
L3603:
    sta    GRP0                  ; 3
    jsr    L379D                 ; 6
    tya                          ; 2
    beq    L360F                 ; 2³
    iny                          ; 2
    lda    L3811,Y               ; 4
L360F:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    jsr    L379D                 ; 6
    ldx    #$00                  ; 2
    lda    ram_E5                ; 3
    cmp    #$02                  ; 2
    bmi    L3626                 ; 2³
    lda    ram_99                ; 3
    cmp    #$08                  ; 2
    bne    L3626                 ; 2³
    ldx    #$02                  ; 2
L3626:
    lda    #$29                  ; 2
    adc    ram_AF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP1                ; 3
    stx    ENABL                 ; 3
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    jsr    L379D                 ; 6
    ldy    ram_E5                ; 3
    cpy    #$01                  ; 2
    beq    L3641                 ; 2³
    ldy    #$00                  ; 2
L3641:
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    L379D                 ; 6
    lda    L3119,Y               ; 4
    clc                          ; 2
    adc    ram_9A                ; 3
    tax                          ; 2
    ldy    L30E9,X               ; 4
    lda    #$07                  ; 2
    sta    ram_ED                ; 3
L3654:
    ldx    ram_ED                ; 3
    lda    L3809,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    NumberGfx,Y           ; 4
    sta    GRP0                  ; 3
    ldx    ram_81                ; 3
    lda    INPT0,X               ; 4
    asl                          ; 2
    lda    ram_8A                ; 3
    adc    #$00                  ; 2
    sta    ram_8A                ; 3
    iny                          ; 2
    dec    ram_ED                ; 5
    bpl    L3654                 ; 2³
    lda    CXP1FB                ; 3
    sta    ram_E7                ; 3
    asl                          ; 2
    bpl    L367D                 ; 2³
    ldx    #$00                  ; 2
    stx    ENABL                 ; 3
L367D:
    lda    ram_C3                ; 3
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    tay                          ; 2
    lda    #$00                  ; 2
    sta    HMBL                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    dex                          ; 2
    sta    GRP1                  ; 3
    dex                          ; 2
L3693:
    dex                          ; 2
    bne    L3693                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    CXCLR                 ; 3
    dey                          ; 2
L369D:
    dey                          ; 2
    bne    L369D                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jsr    L379D                 ; 6
    lda    #$38                  ; 2
    ldy    ram_BF                ; 3
    bne    L36B1                 ; 2³
    lda    ram_F0                ; 3
L36B1:
    ldy    #$B8                  ; 2
    jsr    L37A6                 ; 6
    tya                          ; 2
    bpl    L36BB                 ; 2³
    stx    ENABL                 ; 3
L36BB:
    sty    ram_EB                ; 3
    lda    ram_C5                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L3831,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$84                  ; 2
    sta    COLUP1                ; 3
    lda    ram_F0                ; 3
    sta    COLUPF                ; 3
    ldy    #$0B                  ; 2
L36D5:
    lda    (ram_C0),Y            ; 5  Continents
    and    L3819,Y               ; 4  Globe
    and    ram_BF                ; 3  show or hide planets?
    tax                          ; 2
    eor    #$FF                  ; 2
    and    L3819,Y               ; 4
    and    ram_BF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    L3825,Y               ; 4
    sta    COLUP0                ; 3
    jsr    L379D                 ; 6
    dey                          ; 2
    bpl    L36D5                 ; 2³
    iny                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    lda    CXP0FB                ; 3
    sta    ram_E9                ; 3
    asl                          ; 2
    bpl    L3705                 ; 2³
    sty    ENABL                 ; 3
L3705:
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    jsr    L379D                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    L379D                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    PF0                   ; 3
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    lda    #$24                  ; 2
    jmp    L371E                 ; 3   redundant

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L371E x1

L371E SUBROUTINE
    sec                          ; 2
    adc    ram_AF                ; 3
    sta    ram_EF                ; 3
    jsr    L379D                 ; 6
    ldx    #$07                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
L372A:
    dex                          ; 2
    bne    L372A                 ; 2³
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    stx    HMP0                  ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    lda    #$01                  ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    #$03                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$00                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$06                  ; 2
    sta    ram_ED                ; 3
    lda    ram_EF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    stx    ENABL                 ; 3
L3768:
    ldy    ram_ED                ; 3
    lda    (ram_9B),Y            ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_A1),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_9D),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_A3),Y            ; 5
    sta    ram_EE                ; 3
    lda    (ram_9F),Y            ; 5
    tax                          ; 2
    lda    (ram_A5),Y            ; 5
    tay                          ; 2
    lda    ram_EE                ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    dec    ram_ED                ; 5
    bpl    L3768                 ; 2³
    ldx    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    VDELP0                ; 3
    stx    VDELP1                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L379D x35

L379D SUBROUTINE
    ldx    ram_81                ; 3
    lda    INPT0,X               ; 4
    bpl    L37A5                 ; 2³
    inc    ram_8A                ; 5
L37A5:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L37A6 x2

L37A6 SUBROUTINE
    ldx    #$03                  ; 2
    stx    ram_ED                ; 3
    ldx    ram_81                ; 3
    sta    COLUPF                ; 3
L37AE:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda.wy 0,Y                   ; 4
    sta    PF0                   ; 3
    lda.wy 1,Y                   ; 4
    sta    PF1                   ; 3
    lda.wy 2,Y                   ; 4
    sta    PF2                   ; 3
    lda    INPT0,X               ; 4
    asl                          ; 2
    lda    ram_8A                ; 3
    adc    #$00                  ; 2
    sta    ram_8A                ; 3
    lda.wy 3,Y                   ; 4
    sta    PF0                   ; 3
    lda.wy 4,Y                   ; 4
    sta    PF1                   ; 3
    lda.wy 5,Y                   ; 4
    sta    PF2                   ; 3
    dec    ram_ED                ; 5
    bne    L37AE                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    CXBLPF                ; 3
    ldx    #$00                  ; 2
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L37E8:
    .byte $94   ; $37E8  colors
    .byte $96   ; $37E9
    .byte $98   ; $37EA
    .byte $9A   ; $37EB
    .byte $9C   ; $37EC
    .byte $9A   ; $37ED
    .byte $98   ; $37EE
    .byte $96   ; $37EF
    .byte $94   ; $37F0

L37F1:
    .byte $03 ; |      XX| $37F1
    .byte $07 ; |     XXX| $37F2
    .byte $1F ; |   XXXXX| $37F3
    .byte $3F ; |  XXXXXX| $37F4
    .byte $FF ; |XXXXXXXX| $37F5  <--  never reached in my testing
    .byte $3F ; |  XXXXXX| $37F6
    .byte $1F ; |   XXXXX| $37F7
    .byte $07 ; |     XXX| $37F8
    .byte $03 ; |      XX| $37F9
L37FA:
    .byte $C0 ; |XX      | $37FA
    .byte $E0 ; |XXX     | $37FB
    .byte $F8 ; |XXXXX   | $37FC
    .byte $FC ; |XXXXXX  | $37FD
    .byte $FF ; |XXXXXXXX| $37FE  <--  never reached in my testing
    .byte $FC ; |XXXXXX  | $37FF
    .byte $F8 ; |XXXXX   | $3800
    .byte $E0 ; |XXX     | $3801
    .byte $C0 ; |XX      | $3802
L3803:
    .byte $1B ; |   XX XX| $3803
    .byte $2D ; |  X XX X| $3804
    .byte $36 ; |  XX XX | $3805
L3806:
    .byte $6C ; | XX XX  | $3806
    .byte $B4 ; |X XX X  | $3807
    .byte $D8 ; |XX XX   | $3808
L3809:
    .byte $82 ; |X     X | $3809
    .byte $C6 ; |XX   XX | $380A
    .byte $7C ; | XXXXX  | $380B
    .byte $7C ; | XXXXX  | $380C
    .byte $38 ; |  XXX   | $380D
    .byte $38 ; |  XXX   | $380E
    .byte $10 ; |   X    | $380F
    .byte $10 ; |   X    | $3810
L3811:
    .byte $F8 ; |XXXXX   | $3811
    .byte $1C ; |   XXX  | $3812
    .byte $38 ; |  XXX   | $3813
    .byte $18 ; |   XX   | $3814
    .byte $1C ; |   XXX  | $3815
    .byte $18 ; |   XX   | $3816
    .byte $1F ; |   XXXXX| $3817
    .byte $38 ; |  XXX   | $3818
L3819:
    .byte $38 ; |  XXX   | $3819
    .byte $7C ; | XXXXX  | $381A
    .byte $7C ; | XXXXX  | $381B
    .byte $FE ; |XXXXXXX | $381C
    .byte $FE ; |XXXXXXX | $381D
    .byte $FE ; |XXXXXXX | $381E
    .byte $FE ; |XXXXXXX | $381F
    .byte $FE ; |XXXXXXX | $3820
    .byte $FE ; |XXXXXXX | $3821
    .byte $7C ; | XXXXX  | $3822
    .byte $7C ; | XXXXX  | $3823
    .byte $38 ; |  XXX   | $3824

L3825:
    .byte $0C   ; $3825  colors
    .byte $0C   ; $3826
    .byte $C6   ; $3827
    .byte $C6   ; $3828
    .byte $C6   ; $3829
    .byte $C6   ; $382A
    .byte $C6   ; $382B
    .byte $C6   ; $382C
    .byte $C6   ; $382D
    .byte $C6   ; $382E
    .byte $0C   ; $382F
    .byte $0C   ; $3830
L3831:
    .byte $00   ; $3831  NUSIZx
    .byte $00   ; $3832  <--  never reached in my testing
    .byte $00   ; $3833  <--  never reached in my testing
    .byte $02   ; $3834  <--  never reached in my testing
    .byte $00   ; $3835
    .byte $04   ; $3836
    .byte $02   ; $3837
    .byte $06   ; $3838

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L3839 x3
;L383B x1

L3839:
    ldx    #$00                  ; 2
L383B SUBROUTINE
    sty    ram_EE                ; 3
    sta    ram_ED                ; 3
    clc                          ; 2
    adc    ram_EE                ; 3
    ldy    ram_EE                ; 3
    bpl    L3852                 ; 2³
    ldy    ram_ED                ; 3
    bpl    L3861                 ; 2³
    tay                          ; 2
    bmi    L3861                 ; 2³
    clc                          ; 2
    adc    #$F1                  ; 2
    bne    L3861                 ; 2³
L3852:
    ldy    ram_ED                ; 3
    bmi    L3861                 ; 2³
    tay                          ; 2
    and    #$F0                  ; 2
    cmp    #$70                  ; 2
    tya                          ; 2
    bcc    L3861                 ; 2³
    clc                          ; 2
    adc    #$0F                  ; 2
L3861:
    tay                          ; 2
    jsr    L3877                 ; 6
    cmp    #$42                  ; 2
    bcc    L3870                 ; 2³
    cmp    L3FC4,X               ; 4
    bcs    L3874                 ; 2³
    tya                          ; 2
    rts                          ; 6

L3870:
    lda    L3FC5,X               ; 4
    rts                          ; 6

L3874:
    lda    #$24                  ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L3877 x2
;L388C x1

L3877 SUBROUTINE
    sta    ram_ED                ; 3
    eor    #$F0                  ; 2
    clc                          ; 2
    adc    #$70                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_EE                ; 3
    lda    ram_ED                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    ram_EE                ; 3
L388C SUBROUTINE
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L388D x2

L388D SUBROUTINE
    ldy    #$04                  ; 2
    sec                          ; 2
    sbc    #$0C                  ; 2
    bcc    L389A                 ; 2³
L3894:
    iny                          ; 2
    sec                          ; 2
    sbc    #$0F                  ; 2
    bcs    L3894                 ; 2³
L389A:
    adc    #$09                  ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_ED                ; 3
    tya                          ; 2
    ora    ram_ED                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L38AB x6

L38AB SUBROUTINE
    jsr    L3877                 ; 6
    tax                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_ED                ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    ram_ED                ; 3
    sec                          ; 2
    sbc    #$3F                  ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L38BD x2

L38BD SUBROUTINE
    sty    ram_EF                ; 3
    jsr    L38AB                 ; 6
    clc                          ; 2
    adc    ram_EF                ; 3
    cmp    #$A0                  ; 2
    bcc    L38CC                 ; 2³
    sec                          ; 2  <--  never reached in my testing
    sbc    #$A0                  ; 2  <--  never reached in my testing
L38CC:
    jsr    L388D                 ; 6
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L38D0 x1

L38D0 SUBROUTINE
    ldx    #$06                  ; 2
L38D2:
    dex                          ; 2
    cmp    L38E3,X               ; 4
    bmi    L38D2                 ; 2³
    cmp    #$14                  ; 2
    bmi    L38DE                 ; 2³
    sbc    #$14                  ; 2
L38DE:
    tay                          ; 2
    lda    L38E9,Y               ; 4
    rts                          ; 6

L38E3:
    .byte $00   ; $38E3
    .byte $04   ; $38E4
    .byte $0C   ; $38E5
    .byte $14   ; $38E6
    .byte $18   ; $38E7
    .byte $20   ; $38E8
L38E9:
    .byte $10   ; $38E9
    .byte $20   ; $38EA
    .byte $40   ; $38EB
    .byte $80   ; $38EC
    .byte $80   ; $38ED
    .byte $40   ; $38EE
    .byte $20   ; $38EF
    .byte $10   ; $38F0
    .byte $08   ; $38F1
    .byte $04   ; $38F2
    .byte $02   ; $38F3
    .byte $01   ; $38F4
    .byte $01   ; $38F5
    .byte $02   ; $38F6
    .byte $04   ; $38F7
    .byte $08   ; $38F8
    .byte $10   ; $38F9
    .byte $20   ; $38FA
    .byte $40   ; $38FB
    .byte $80   ; $38FC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L38FD x2
;ShiftHighDigit x3

L38FD SUBROUTINE
    bcs    L3903                 ; 2³+1
ShiftHighDigit SUBROUTINE
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
L3903:
    and    #$0F                  ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;TimesBy10 x1

TimesBy10 SUBROUTINE
    asl                          ; 2
    sta    ram_ED                ; 3
    asl                          ; 2
    asl                          ; 2
    adc    ram_ED                ; 3   x8 + x2  = x10 (times by 10)
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

START:
    cld                          ; 2
    sei                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    inx                          ; 2
    txa                          ; 2
L3915:
    sta    0,X                   ; 4
    inx                          ; 2
    cpx    #$FE                  ; 2
    bne    L3915                 ; 2³
    
    lda    #$30                  ; 2  high nibble
    ldx    #$0B                  ; 2
L3920:
    sta    ram_9B,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    L3920                 ; 2³
    
    jsr    L3E4E                 ; 6
    lda    #$01                  ; 2
    sta    ram_83                ; 3
    sta    ram_85                ; 3
    sta    ram_AA                ; 3   start on game variation 1
    lda    #$A1                  ; 2   Blank <<4 | 1
    sta    ram_AC                ; 3   star with player 1
L3935:
    lda    #$2A                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    VSYNC                 ; 3
    sta    TIM8T                 ; 4
    lda    #$A7                  ; 2
    jsr    L3144                 ; 6
L3945:
    lda    INTIM                 ; 4
    bne    L3945                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #$2D                  ; 2
    sta    TIM64T                ; 4
    
    ldx    #$05                  ; 2
L3955:
    txa                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    ram_E6,X              ; 4   load low pointers for score
    sta.wy ram_9B,Y              ; 5
    dex                          ; 2
    bpl    L3955                 ; 2³
    
    lda    #$AA                  ; 2
    jsr    L3144                 ; 6
    lda    frameCounter          ; 3
    eor    ram_86                ; 3
    eor    ram_8A                ; 3
    sta    ram_EC                ; 3
    lda    ram_AF                ; 3
    beq    L3975                 ; 2³
    lda    #$00                  ; 2
    sta    ram_BF                ; 3   hide planets
L3975:
    ldx    ram_98                ; 3
    beq    L397E                 ; 2³
    dex                          ; 2
    stx    ram_98                ; 3
    bne    L39D7                 ; 2³
L397E:
    stx    ram_F3                ; 3
    lda    ram_85                ; 3
    cmp    #$0A                  ; 2
    bmi    L3988                 ; 2³
    lda    #$09                  ; 2
L3988:
    sta    ram_85                ; 3
    lda    #$09                  ; 2
    sec                          ; 2
    sbc    ram_85                ; 3
    ldx    ram_83                ; 3
    cpx    #$21                  ; 2
    bmi    L3997                 ; 2³
    adc    #$04                  ; 2  <--  never reached in my testing
L3997:
    sta    ram_98                ; 3
    inc    ram_99                ; 5
    ldx    ram_99                ; 3
    cpx    #$09                  ; 2
    bne    L39D7                 ; 2³
    inc    ram_B1                ; 5
    ldy    #$00                  ; 2
    lda    ram_85                ; 3
    asl                          ; 2
    sta    ram_ED                ; 3
    asl                          ; 2
    asl                          ; 2
    tax                          ; 2
    adc    ram_ED                ; 3
    cmp    ram_B1                ; 3
    bpl    L39C9                 ; 2³
    lda    #$0B                  ; 2
    sta    ram_F3                ; 3
    sty    ram_B1                ; 3
    cpx    ram_AD                ; 3
    sty    ram_AD                ; 3
    bpl    L39C9                 ; 2³
    sty    ram_F3                ; 3
    lda    #$C8                  ; 2
    sta    ram_AE                ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_B0                ; 3
L39C9:
    sty    ram_99                ; 3
    lda    ram_83                ; 3
    lsr                          ; 2
    bcc    L39DA                 ; 2³
    lda    #$0A                  ; 2
    jsr    L3F46                 ; 6
    sta    ram_E2                ; 3
L39D7:
    jmp    L39F7                 ; 3

L39DA:
    lda    #$05                  ; 2
    jsr    L3F46                 ; 6
    sta    ram_DE                ; 3
    ldy    #$08                  ; 2
    ldx    #$09                  ; 2
L39E5:
    jsr    L3E97                 ; 6
    dey                          ; 2
    dex                          ; 2
    cpx    #$05                  ; 2
    bpl    L39E5                 ; 2³
    lda    ram_BE                ; 3
    sta    ram_EE                ; 3
    jsr    L3F59                 ; 6
    sta    ram_DF                ; 3
L39F7:
    lda    ram_83                ; 3
    lsr                          ; 2
    bcc    L3A02                 ; 2³+1
    lda    ram_E2                ; 3
    and    #$0F                  ; 2
    bcs    L3A0E                 ; 3   always branch

L3A02:
    lda    ram_E0                ; 3
    and    #$0F                  ; 2
    cmp    #$02                  ; 2
    bpl    L3A0E                 ; 2³
    lda    ram_DD                ; 3
    and    #$0F                  ; 2
L3A0E:
    asl                          ; 2
    sta    ram_ED                ; 3
    lda    ram_9A                ; 3
    and    #$01                  ; 2
    adc    ram_ED                ; 3
    tay                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    L3FED,X               ; 4
    jsr    L38FD                 ; 6
    sta    AUDC1                 ; 3
    tya                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    ram_AF                ; 3
    beq    L3A2C                 ; 2³
    jmp    L3BA2                 ; 3

L3A2C:
    lda    L3FE2,X               ; 4
    jsr    L38FD                 ; 6
    sta    AUDF1                 ; 3
    lda    #$02                  ; 2
    sta    AUDV1                 ; 3
    lda    #$00                  ; 2
    sta    ram_92                ; 3
    sta    ram_91                ; 3
    ldx    ram_BF                ; 3
    ldy    ram_BE                ; 3
    bit    SWCHA                 ; 4
    bmi    L3A4D                 ; 2³
    lda    ram_90                ; 3
    bne    L3A4D                 ; 2³
    stx    ram_92                ; 3
L3A4D:
    bvs    L3A55                 ; 2³
    lda    ram_8F                ; 3  <--  never reached in my testing
    bne    L3A55                 ; 2³ <--  never reached in my testing
    sty    ram_91                ; 3  <--  never reached in my testing
L3A55:
    lda    #$08                  ; 2
    sta    AUDC0                 ; 3
    sta    AUDF0                 ; 3
    lda    #$01                  ; 2
    sta    AUDV0                 ; 3
    lda    ram_91                ; 3
    ora    ram_92                ; 3
    beq    L3A75                 ; 2³
    lda    frameCounter          ; 3
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    tax                          ; 2
    eor    #$07                  ; 2
    sta    AUDV0                 ; 3
    lda    L3FC8,X               ; 4
    sta    AUDF0                 ; 3
L3A75:
    ldx    ram_AE                ; 3
    bne    L3A8C                 ; 2³
    ldx    ram_B0                ; 3
    beq    L3A8C                 ; 2³
    dec    ram_B0                ; 5
    bne    L3A83                 ; 2³
    inc    ram_85                ; 5
L3A83:
    lda    RandomBytes,X         ; 4
    and    #$17                  ; 2
    ldx    #$0C                  ; 2
    bne    L3AAB                 ; 3   always branch

L3A8C:
    ldx    ram_95                ; 3
    beq    L3AB3                 ; 2³
    dec    ram_95                ; 5
    txa                          ; 2
    bpl    L3A9F                 ; 2³
    and    #$7F                  ; 2
    bne    L3A9B                 ; 2³
    sta    ram_95                ; 3
L3A9B:
    ldx    #$0C                  ; 2
    bne    L3AAB                 ; 3   always branch

L3A9F:
    lda    ram_95                ; 3
    and    #$FE                  ; 2
    tax                          ; 2
    lda    RandomBytes,X         ; 4
    and    #$07                  ; 2
    ldx    #$08                  ; 2
L3AAB:
    stx    AUDC0                 ; 3
    sta    AUDF0                 ; 3
    lda    #$04                  ; 2
    sta    AUDV0                 ; 3
L3AB3:
    lda    ram_93                ; 3
    beq    L3AC7                 ; 2³
    dec    ram_93                ; 5
    jsr    L3F8B                 ; 6
    sbc    #$02                  ; 2
    sta    AUDV1                 ; 3
    lda    L3FD3,X               ; 4
    sbc    #$04                  ; 2
    sta    AUDF1                 ; 3
L3AC7:
    lda    ram_94                ; 3
    beq    L3AE6                 ; 2³
    dec    ram_94                ; 5
    lsr                          ; 2
    jsr    L3F8B                 ; 6
    sta    AUDV1                 ; 3
    lda    L3FD3,X               ; 4
    sta    AUDF1                 ; 3
    lda    #$00                  ; 2
    ldx    ram_94                ; 3
    cpx    #$1E                  ; 2
    bmi    L3AE4                 ; 2³
    lda    frameCounter          ; 3
    asl                          ; 2
    asl                          ; 2
L3AE4:
    sta    colBackGround         ; 3
L3AE6:
    lda    frameCounter          ; 3
    and    #$0F                  ; 2
    cmp    #$0A                  ; 2
    bpl    L3B20                 ; 2³+1
    sta    ram_F2                ; 3
    tax                          ; 2
    lda    ram_D0,X              ; 4
    jsr    L38AB                 ; 6
    sta    ram_EF                ; 3
    ldx    ram_F2                ; 3
    beq    L3B15                 ; 2³+1
    lda    ram_C3                ; 3
    sta    ram_F0                ; 3
    ldy    #$F4                  ; 2
    lda    ram_83                ; 3
    lsr                          ; 2
    bcs    L3B22                 ; 2³
    cpx    #$05                  ; 2
    bmi    L3B11                 ; 2³
    lda    ram_C2                ; 3
    sta    ram_F0                ; 3
    ldy    #$0C                  ; 2
L3B11:
    cpx    #$09                  ; 2
    bne    L3B22                 ; 2³
L3B15:
    lda    ram_EF                ; 3
    and    #$03                  ; 2
    tax                          ; 2
    ldy    L3FDE,X               ; 4
    jmp    L3B4D                 ; 3

L3B20:
    bpl    L3B7D                 ; 2³
L3B22:
    sty    ram_F1                ; 3
    ldx    ram_F2                ; 3
    lda    ram_DA,X              ; 4
    and    #$F0                  ; 2
    tay                          ; 2
    ldx    ram_83                ; 3
    dex                          ; 2
    txa                          ; 2
    and    #$08                  ; 2
    beq    L3B4D                 ; 2³
    lda    ram_F0                ; 3  <--  never reached in my testing
    jsr    L38AB                 ; 6              |
    adc    ram_F1                ; 3              |
    cmp    ram_EF                ; 3              |
    ldx    ram_F2                ; 3             \ /
    lda    ram_DA,X              ; 4              |
    and    #$0F                  ; 2              |  all this not reached!
    ora    #$40                  ; 2              |
    bcc    L3B48                 ; 2³            \ /
    ora    #$C0                  ; 2              |
L3B48:;                                           |
    sta    ram_DA,X              ; 4              |
    and    #$F0                  ; 2             \ /
    tay                          ; 2  <--  never reached in my testing
L3B4D:
    ldx    ram_83                ; 3
    dex                          ; 2
    txa                          ; 2
    ldx    ram_F2                ; 3
    and    #$10                  ; 2
    bne    L3B72                 ; 2³
    lda    ram_DA,X              ; 4
    and    #$0F                  ; 2
    sta    ram_F1                ; 3
    lda    ram_EF                ; 3
    cmp    #$05                  ; 2
    bcs    L3B67                 ; 2³
    ldy    #$F0                  ; 2
    bne    L3B6D                 ; 3   always branch

L3B67:
    cmp    #$90                  ; 2
    bcc    L3B6D                 ; 2³
    ldy    #$10                  ; 2
L3B6D:
    tya                          ; 2
    ora    ram_F1                ; 3
    sta    ram_DA,X              ; 4
L3B72:
    lda    ram_D0,X              ; 4
    ldx    #$02                  ; 2
    jsr    L383B                 ; 6
    ldx    ram_F2                ; 3
    sta    ram_D0,X              ; 4
L3B7D:
    lda    ram_99                ; 3
    bne    L3BA2                 ; 2³
    lda    ram_D9                ; 3
    jsr    L3E8B                 ; 6
    ldy    #$30                  ; 2
    and    ram_B2,X              ; 4
    beq    L3B8E                 ; 2³
    ldy    #$10                  ; 2
L3B8E:
    sty    ram_ED                ; 3
    lda    ram_E3                ; 3
    and    #$0F                  ; 2
    cmp    #$02                  ; 2
    bmi    L3B9A                 ; 2³
    adc    ram_ED                ; 3
L3B9A:
    sta    ram_E4                ; 3
    lda    ram_DA                ; 3
    and    #$0F                  ; 2
    sta    ram_E5                ; 3
L3BA2:
    ldy    ram_87                ; 3
    lda    ram_86                ; 3
    cmp    #$24                  ; 2
    bne    L3BAC                 ; 2³
    ldy    #$F0                  ; 2
L3BAC:
    cmp    #$9C                  ; 2
    bne    L3BB2                 ; 2³
    ldy    #$10                  ; 2
L3BB2:
    sty    ram_87                ; 3
    jsr    L3839                 ; 6
    sta    ram_86                ; 3
    lda    ram_86                ; 3
    ldy    #$0C                  ; 2
    jsr    L38BD                 ; 6
    tax                          ; 2
    lda    ram_83                ; 3
    lsr                          ; 2
    bcs    L3BCC                 ; 2³
    stx    ram_D4                ; 3
    stx    ram_D5                ; 3
    bcc    L3BCE                 ; 3   always branch

L3BCC:
    stx    ram_D9                ; 3
L3BCE:
    ldy    ram_83                ; 3
    dey                          ; 2
    tya                          ; 2
    and    #$02                  ; 2
    bne    L3BEE                 ; 2³
    lda    ram_86                ; 3
    and    #$0F                  ; 2
    sbc    #$05                  ; 2
    cmp    #$07                  ; 2
    bpl    L3BEE                 ; 2³
    dec    ram_88                ; 5
    bne    L3BEE                 ; 2³
    ora    #$C8                  ; 2
    sta    ram_88                ; 3
    lda    ram_87                ; 3
    eor    #$E0                  ; 2
    sta    ram_87                ; 3
L3BEE:
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    bne    L3C06                 ; 2³+1
    ldy    #$F0                  ; 2
    lda    ram_C2                ; 3
    jsr    L3839                 ; 6
    sta    ram_C2                ; 3
    ldy    #$10                  ; 2
    lda    ram_C3                ; 3
    jsr    L3839                 ; 6
    sta    ram_C3                ; 3
L3C06:
    lda    ram_AE                ; 3
    beq    L3C0C                 ; 2³
    dec    ram_AE                ; 5
L3C0C:
    ora    ram_BE                ; 3
    ora    ram_BF                ; 3
    bne    L3C25                 ; 2³
    lda    ram_AF                ; 3
    and    #$F0                  ; 2
    adc    #$12                  ; 2
    sta    ram_AF                ; 3
    lda    #$28                  ; 2
    sta    ram_AE                ; 3
    bit    SWCHA                 ; 4
    bpl    L3C2B                 ; 2³
    bvc    L3C2B                 ; 2³
L3C25:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcs    L3C6D                 ; 2³
L3C2B:
    lda    ram_82                ; 3
    bne    L3C41                 ; 2³
    lda    ram_AA                ; 3
    jsr    ShiftHighDigit        ; 6   move the high digit into the low position
    jsr    TimesBy10             ; 6
    sta    ram_ED                ; 3
    lda    ram_AA                ; 3
    and    #$0F                  ; 2   high digit (x10) plus low digit
    adc    ram_ED                ; 3
    sta    ram_83                ; 3
L3C41:
    jsr    L3E4E                 ; 6
    ldx    #$0A                  ; 2
L3C46:
    sty    ram_A7,X              ; 4
    dex                          ; 2
    bpl    L3C46                 ; 2³
    dey                          ; 2
    ldx    #$0D                  ; 2
L3C4E:
    sty    ram_B2,X              ; 4
    dex                          ; 2
    bpl    L3C4E                 ; 2³
    lda    ram_83                ; 3
    ldx    #$01                  ; 2
    cmp    #$21                  ; 2
    bpl    L3C5D                 ; 2³
    ldx    #$02                  ; 2
L3C5D:
    stx    ram_85                ; 3
    lsr                          ; 2
    bcc    L3C65                 ; 2³
    iny                          ; 2
    sty    ram_BE                ; 3
L3C65:
    lda    #$9F                  ; 2
    sta    ram_95                ; 3
    sta    ram_82                ; 3
    bne    L3CA4                 ; 3   always branch

L3C6D:
    lsr                          ; 2
    bcs    L3CA4                 ; 2³
    ldx    ram_82                ; 3
    beq    L3C84                 ; 2³
    jsr    L3E4E                 ; 6
    sty    ram_AA                ; 3
    sty    ram_82                ; 3
    sty    AUDV0                 ; 3
    sty    AUDV1                 ; 3
    iny                          ; 2
    sty    ram_83                ; 3
    sty    ram_85                ; 3
L3C84:
    dec    ram_85                ; 5
    bne    L3CA4                 ; 2³
    lda    #$14                  ; 2
    sta    ram_85                ; 3
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;do game variation scroll
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda    ram_AA                ; 3
    clc                          ; 2
    sed                          ; 2
    cmp    #$34                  ; 2   last game variation
    bne    L3C96                 ; 2³
    lda    #0                    ; 2   reset to first game variation
L3C96:
    clc                          ; 2
    adc    #1                    ; 2
    cld                          ; 2
    sta    ram_AA                ; 3
    
    
    ldx    #$A1                  ; 2
    lsr                          ; 2   1 player or 2?
    bcs    L3CA2                 ; 2³  - 1 player game
    inx                          ; 2   - 2 player game
L3CA2:
    stx    ram_AC                ; 3
L3CA4:
    jsr    L318E                 ; 6
    dex                          ; 2
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    VBLANK                ; 3
    lda    #$1F                  ; 2
    sta    TIM64T                ; 4
    inc    frameCounter          ; 5
    lda    frameCounter          ; 3
    and    #$01                  ; 2
    sta    ram_81                ; 3
    tax                          ; 2
    lda    ram_BE,X              ; 4
    beq    L3CF7                 ; 2³
    lda    ram_8B,X              ; 4
    ldy    ram_8A                ; 3
    sty    ram_8B,X              ; 4
    ldy    ram_8F,X              ; 4
    beq    L3CCC                 ; 2³
    dec    ram_8F,X              ; 6
    bpl    L3CF7                 ; 2³
L3CCC:
    tay                          ; 2
    lda    ram_E6,X              ; 4
    and    #$40                  ; 2
    lsr                          ; 2
    sta    ram_8F,X              ; 4
    bne    L3CF7                 ; 2³
    lda    ram_82                ; 3
    bpl    L3CF7                 ; 2³
    lda    SWCHA                 ; 4
    eor    #$FF                  ; 2
    and    L3FFE,X               ; 4
    bne    L3CF7                 ; 2³
    tya                          ; 2
    clc                          ; 2
    adc    ram_8A                ; 3
    ror                          ; 2
    clc                          ; 2
    adc    #$05                  ; 2
    cmp    #$95                  ; 2
    bcc    L3CF2                 ; 2³
    lda    #$95                  ; 2
L3CF2:
    jsr    L388D                 ; 6
    sta    ram_8D,X              ; 4
L3CF7:
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    L3D05                 ; 2³+1
    dec    ram_89                ; 5
    bpl    L3D05                 ; 2³
    lda    #$02                  ; 2
    sta    ram_89                ; 3
L3D05:
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    bne    L3D23                 ; 2³
    ldx    #$0B                  ; 2
L3D0D:
    lda    ram_DA,X              ; 4
    and    #$0F                  ; 2
    cmp    #$01                  ; 2
    bne    L3D18                 ; 2³
    lsr                          ; 2
    sta    ram_DA,X              ; 4
L3D18:
    dex                          ; 2
    bpl    L3D0D                 ; 2³
    inc    ram_9A                ; 5
    lda    ram_9A                ; 3
    and    #$03                  ; 2
    sta    ram_9A                ; 3
L3D23:
    lda    ram_83                ; 3
    lsr                          ; 2
    bcs    L3D46                 ; 2³
    bit    ram_E6                ; 3
    bvs    L3D46                 ; 2³
    lda    ram_EA                ; 3
    bpl    L3D46                 ; 2³
    lda    #$0A                  ; 2
    sta    ram_95                ; 3
    ldx    #$00                  ; 2
    stx    ram_E3                ; 3
    inx                          ; 2
    stx    ram_E4                ; 3
    lda    ram_D9                ; 3
    jsr    L3E8B                 ; 6
    eor    #$FF                  ; 2
    and    ram_B2,X              ; 4
    sta    ram_B2,X              ; 4
L3D46:
    lda    ram_EB                ; 3
    bpl    L3D60                 ; 2³
    lda    #$0A                  ; 2
    sta    ram_95                ; 3
    ldx    #$00                  ; 2
    stx    ram_DA                ; 3
    inx                          ; 2
    stx    ram_E5                ; 3
    lda    ram_D0                ; 3
    jsr    L3E8B                 ; 6
    eor    #$FF                  ; 2
    and    ram_B8,X              ; 4
    sta    ram_B8,X              ; 4
L3D60:
    ldy    ram_D0                ; 3
    ldx    #$01                  ; 2  
L3D64:
    stx    ram_F0                ; 3
    lda    ram_E6,X              ; 4
    asl                          ; 2
    bmi    L3DB4                 ; 2³
    lda    ram_E8,X              ; 4
    asl                          ; 2
    bpl    L3DB4                 ; 2³
    lda    #$2F                  ; 2
    sta    ram_94                ; 3
    tya                          ; 2
    jsr    L38AB                 ; 6
    sta    ram_EF                ; 3
    ldx    ram_F0                ; 3
    lda    ram_C2,X              ; 4
    jsr    L3F99                 ; 6
    ldx    ram_F0                ; 3
    and    ram_C4,X              ; 4   decrease planets?
    sta    ram_C4,X              ; 4   NUSIZx
    tay                          ; 2
    lda    L3130,Y               ; 4
    tay                          ; 2
    lda    ram_C2,X              ; 4
    jsr    L38BD                 ; 6
    ldx    ram_F0                ; 3
    sta    ram_C2,X              ; 4
    ldy    ram_C4,X              ; 4
    lda    L3125,Y               ; 4
    sta    ram_C4,X              ; 4   NUSIZx table, find number of planet copies to display
    bne    L3DB4                 ; 2³
    sta    ram_BE,X              ; 4
    ldx    #$05                  ; 2
    ldy    ram_F0                ; 3
    beq    L3DA8                 ; 2³
    ldx    #$0B                  ; 2
L3DA8:
    ldy    #$05                  ; 2
L3DAA:
    sta    ram_B2,X              ; 4
    dex                          ; 2
    dey                          ; 2
    bpl    L3DAA                 ; 2³
    sty    ram_AE                ; 3
    ldx    ram_F0                ; 3
L3DB4:
    ldy    ram_D9                ; 3
    dex                          ; 2
    bpl    L3D64                 ; 2³
    ldx    #$09                  ; 2
    ldy    #$08                  ; 2
L3DBD:
    lda    ram_DA,X              ; 4
    and    #$0F                  ; 2
    cmp    #$01                  ; 2
    beq    L3DC9                 ; 2³
    lda    ram_C6,X              ; 4
    bpl    L3DCB                 ; 2³
L3DC9:
    stx    $C6,Y                 ; 4
L3DCB:
    dex                          ; 2
    dey                          ; 2
    bpl    L3DBD                 ; 2³
    lda    ram_83                ; 3
    lsr                          ; 2
    bcc    L3DEC                 ; 2³
    lda    #$40                  ; 2
    jsr    L3EA7                 ; 6
    lda    #$AA                  ; 2
    jsr    L3EBA                 ; 6
L3DDE:
    jsr    L3ECC                 ; 6
    inc    ram_F0                ; 5
    ldx    ram_F0                ; 3
    cpx    #$0A                  ; 2
    bmi    L3DDE                 ; 2³
    jmp    L3E37                 ; 3

L3DEC:
    lda    #$80                  ; 2
    jsr    L3EA7                 ; 6
    lda    #$A7                  ; 2
    sta    ram_EF                ; 3
    lda    #$10                  ; 2
    and    ram_91                ; 3
    and    ram_ED                ; 3
    tay                          ; 2
    lda    ram_96                ; 3
    sta    ram_F1                ; 3
    ldx    #$09                  ; 2
    stx    ram_F0                ; 3
L3E04:
    jsr    L3ECC                 ; 6
    dec    ram_F0                ; 5
    ldx    ram_F0                ; 3
    cpx    #$05                  ; 2
    bpl    L3E04                 ; 2³
    lda    ram_F1                ; 3
    and    ram_91                ; 3
    sta    ram_96                ; 3
    beq    L3E22                 ; 2³
    tax                          ; 2  <--  never reached in my testing
    sty    ram_C6,X              ; 4              |
    lda    ram_DA,X              ; 4              |
    and    #$0F                  ; 2              |
    bne    L3E22                 ; 2³            \ /
    sta    ram_96                ; 3  <--  never reached in my testing
L3E22:
    lda    #$40                  ; 2
    jsr    L3EA7                 ; 6
    lda    #$AA                  ; 2
    jsr    L3EBA                 ; 6
L3E2C:
    jsr    L3ECC                 ; 6
    inc    ram_F0                ; 5
    ldx    ram_F0                ; 3
    cpx    #$05                  ; 2
    bmi    L3E2C                 ; 2³
L3E37:
    lda    ram_F1                ; 3
    and    ram_92                ; 3
    sta    ram_97                ; 3
    tax                          ; 2
    lda    ram_DA,X              ; 4
    and    #$0F                  ; 2
    bne    L3E46                 ; 2³
    sta    ram_97                ; 3
L3E46:
    lda    INTIM                 ; 4
    bne    L3E46                 ; 2³
    jmp    L3935                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L3E4E x3

L3E4E SUBROUTINE
    lda    #$18                  ; 2
    sta    ram_86                ; 3
    lda    #$39                  ; 2
    sta    ram_8D                ; 3
    sta    ram_8E                ; 3
    lda    #$10                  ; 2
    sta    ram_87                ; 3
    lda    #$07                  ; 2
    sta    ram_C4                ; 3
    sta    ram_C5                ; 3
    lda    #$38                  ; 2   green contients
    sta    ram_C0                ; 3
    lda    #$31                  ; 2   white caps
    sta    ram_C1                ; 3
    lda    #$AA                  ; 2   Blank <<4 | Blank
    sta    ram_AB                ; 3
    ldy    #$01                  ; 2
    sty    ram_89                ; 3
    dey                          ; 2   Y=0
    ldx    #$0B                  ; 2
L3E75:
    lda    #$B8                  ; 2
    sta    ram_D0,X              ; 4
    sty    ram_DA,X              ; 4
    sty    ram_B2,X              ; 4
    dex                          ; 2
    bpl    L3E75                 ; 2³
    sty    ram_99                ; 3
    sty    ram_BE                ; 3
    sty    ram_BF                ; 3   Y=0, hide planets P0
    sty    AUDC0                 ; 3
    sty    AUDC1                 ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L3E8B x3

L3E8B SUBROUTINE
    jsr    L38AB                 ; 6
    clc                          ; 2
    adc    #$03                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    jsr    L38D0                 ; 6
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L3E97 x2

L3E97 SUBROUTINE
    lda.wy ram_D0,Y              ; 4
    sta    ram_D0,X              ; 4
    lda.wy ram_DA,Y              ; 4
    sta    ram_DA,X              ; 4
    lda.wy ram_C6,Y              ; 4
    sta    ram_C6,X              ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L3EA7 x3

L3EA7 SUBROUTINE
    ldx    #$08                  ; 2
    and    SWCHB                 ; 4
    beq    L3EB0                 ; 2³
    ldx    #$10                  ; 2
L3EB0:
    txa                          ; 2
    and    frameCounter          ; 3
    beq    L3EB7                 ; 2³
    lda    #$FF                  ; 2
L3EB7:
    sta    ram_ED                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L3EBA x2

L3EBA SUBROUTINE
    sta    ram_EF                ; 3
    lda    #$10                  ; 2
    and    ram_92                ; 3
    and    ram_ED                ; 3
    tay                          ; 2
    ldx    #$00                  ; 2
    stx    ram_F0                ; 3
    lda    ram_97                ; 3
    sta    ram_F1                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L3ECC x3

L3ECC SUBROUTINE
    lda    ram_C6,X              ; 4
    sty    ram_C6,X              ; 4
    bpl    L3EFA                 ; 2³
    inc    ram_AD                ; 5
    lda    ram_F1                ; 3
    bne    L3EDA                 ; 2³
    stx    ram_F1                ; 3
L3EDA:
    lda    ram_DA,X              ; 4
    and    #$0F                  ; 2
    cmp    #$02                  ; 2
    bmi    L3EFA                 ; 2³
    pha                          ; 3
    lda    #$01                  ; 2
    sta    ram_DA,X              ; 4
    lda    #$1B                  ; 2
    sta    ram_93                ; 3
    pla                          ; 4
    cmp    #$0B                  ; 2
    bne    L3EF7                 ; 2³
    lda    #$23                  ; 2
    sta    ram_94                ; 3
    jsr    L3F05                 ; 6
L3EF7:
    jsr    L3F05                 ; 6
L3EFA:
    lda    ram_F1                ; 3
    beq    L3F04                 ; 2³+1
    cpx    ram_F1                ; 3
    bne    L3F04                 ; 2³
    ldy    #$00                  ; 2
L3F04:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L3F05 x2

L3F05 SUBROUTINE
    sed                          ; 2
    lda    ram_85                ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    L3FDA,X               ; 4  $00,$25,$50,$75
    pha                          ; 3
    ldx    ram_EF                ; 3
    lda    ram_85                ; 3
    lsr                          ; 2
    sta    ram_F2                ; 3
    clc                          ; 2
    pla                          ; 4
    adc    2,X                   ; 4
    sta    2,X                   ; 4
    lda    ram_F2                ; 3
    adc    1,X                   ; 4
    sta    1,X                   ; 4   score is added here!
    bcc    L3F3E                 ; 2³
    sty    ram_F2                ; 3
    txa                          ; 2
    sbc    #$A7                  ; 2
    asl                          ; 2
    tax                          ; 2
    lda    #$FF                  ; 2
    ldy    #$05                  ; 2
L3F2F:
    sta    ram_B2,X              ; 4   rebuild shield
    inx                          ; 2
    dey                          ; 2
    bpl    L3F2F                 ; 2³
    lda    #$9F                  ; 2
    sta    ram_95                ; 3
    ldy    ram_F2                ; 3
    ldx    ram_EF                ; 3
    sec                          ; 2
L3F3E:
    lda    #$00                  ; 2
    adc    0,X                   ; 4
    sta    0,X                   ; 4
    cld                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L3F46 x2
;L3F59 X1

L3F46 SUBROUTINE
    sta    ram_ED                ; 3
    ldx    #$00                  ; 2
    ldy    #$01                  ; 2
L3F4C:
    jsr    L3E97                 ; 6
    iny                          ; 2
    inx                          ; 2
    cpx    ram_ED                ; 3
    bmi    L3F4C                 ; 2³
    lda    ram_BF                ; 3
    sta    ram_EE                ; 3
L3F59 SUBROUTINE
    lda    ram_EC                ; 3
L3F5B:
    lsr                          ; 2
    beq    L3F62                 ; 2³
    cmp    ram_85                ; 3
    bpl    L3F5B                 ; 2³
L3F62:
    clc                          ; 2
    adc    #$02                  ; 2
    tax                          ; 2
    lda    ram_B0                ; 3
    beq    L3F6C                 ; 2³
    ldx    #$00                  ; 2
L3F6C:
    ldy    ram_83                ; 3
    cpy    #$21                  ; 2
    bpl    L3F84                 ; 2³
    dey                          ; 2
    tya                          ; 2
    and    #$04                  ; 2
    bne    L3F7F                 ; 2³
    lda    ram_EC                ; 3
    and    #$01                  ; 2
    bne    L3F7F                 ; 2³
    tax                          ; 2
L3F7F:
    lda    ram_F3                ; 3
    beq    L3F84                 ; 2³
    tax                          ; 2
L3F84:
    txa                          ; 2
    and    ram_EE                ; 3
    clc                          ; 2
    adc    ram_87                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L3F8B x2

L3F8B SUBROUTINE
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    L3FCC,X               ; 4
    sta    AUDC1                 ; 3
    lda    L3FD3,X               ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;L3F99 x1

L3F99 SUBROUTINE
    jsr    L38AB                 ; 6
    sta    ram_ED                ; 3
    cmp    #$50                  ; 2
    bcc    L3FB3                 ; 2³
    sec                          ; 2
    sbc    #$50                  ; 2
    sta    ram_ED                ; 3
    lda    ram_EF                ; 3
    sec                          ; 2
    sbc    #$50                  ; 2
    bpl    L3FB1                 ; 2³
    clc                          ; 2  <--  never reached in my testing
    adc    #$A0                  ; 2  <--  never reached in my testing
L3FB1:
    sta    ram_EF                ; 3
L3FB3:
    lda    ram_EF                ; 3
    sec                          ; 2
    sbc    ram_ED                ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    lsr                          ; 2
    jsr    ShiftHighDigit        ; 6
    tax                          ; 2
    lda    L312D,X               ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3FC4:
    .byte $EE   ; $3FC4
L3FC5:
    .byte $AE   ; $3FC5
    .byte $DE   ; $3FC6
    .byte $8D   ; $3FC7
L3FC8:
    .byte $17   ; $3FC8
    .byte $07   ; $3FC9
    .byte $03   ; $3FCA
    .byte $01   ; $3FCB
L3FCC:
    .byte $02   ; $3FCC  AUDC1
    .byte $02   ; $3FCD
    .byte $02   ; $3FCE
    .byte $02   ; $3FCF
    .byte $08   ; $3FD0
    .byte $08   ; $3FD1
    .byte $08   ; $3FD2
L3FD3:
    .byte $0F   ; $3FD3
    .byte $0D   ; $3FD4
    .byte $0B   ; $3FD5
    .byte $09   ; $3FD6
    .byte $07   ; $3FD7
    .byte $05   ; $3FD8
    .byte $04   ; $3FD9
L3FDA:
    .byte $00   ; $3FDA
    .byte $25   ; $3FDB
    .byte $50   ; $3FDC
    .byte $75   ; $3FDD
L3FDE:
    .byte $E0   ; $3FDE
    .byte $F0   ; $3FDF
    .byte $00   ; $3FE0
    .byte $10   ; $3FE1

L3FE2:
    .byte $00   ; $3FE2
    .byte $00   ; $3FE3
    .byte $53   ; $3FE4
    .byte $A7   ; $3FE5
    .byte $12   ; $3FE6
    .byte $6F   ; $3FE7
    .byte $42   ; $3FE8
    .byte $FA   ; $3FE9
    .byte $DB   ; $3FEA
    .byte $98   ; $3FEB
    .byte $53   ; $3FEC
L3FED:
    .byte $00   ; $3FED
    .byte $00   ; $3FEE
    .byte $55   ; $3FEF
    .byte $AA   ; $3FF0
    .byte $88   ; $3FF1
    .byte $88   ; $3FF2
    .byte $22   ; $3FF3
    .byte $11   ; $3FF4
    .byte $77   ; $3FF5
    .byte $77   ; $3FF6
    .byte $CC   ; $3FF7
    .byte $33   ; $3FF8
    
    
    .byte $00,$00,$00  ; free bytes

       ORG $3FFC

    .word START

L3FFE:
    .byte $40   ; $3FFE
    .byte $80   ; $3FFF
