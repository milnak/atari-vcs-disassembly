; Rough disassembly of Big Bird's Egg Catch
; Disassembled by Omegamatrix
; Using DiStella v4.0
;
;
; bigB1.cfg contents:
;
;      ORG B000
;      GFX B000 B06D
;      CODE B06E B326
;      GFX B327 B32C
;      CODE B32D B3E1
;      GFX B3E2 B3E7
;      CODE B3E8 B4E4
;      GFX B4E5 B4E8
;      CODE B4E9 B8DD
;      GFX B8DE B9D3
;      CODE B9D4 B9EC
;      GFX B9ED BDDF
;      CODE BDE0 BDFD
;      GFX BDFE BEAF
;      CODE BEB0 BEFF
;      GFX BF00 BFDC
;      DATA BFDD BFDD
;      CODE BFDE BFDE
;      DATA BFDF BFDF
;      CODE BFE0 BFE0
;      DATA BFE1 BFE1
;      CODE BFE2 BFE2
;      DATA BFE3 BFE3
;      CODE BFE4 BFE4
;      DATA BFE5 BFE5
;      CODE BFE6 BFF5
;      GFX BFF6 BFFF
;
; bigB2.cfg contents:
;
;      ORG F000
;      GFX F000 F1C9
;      CODE F1CA F271
;      GFX F272 F3FE
;      CODE F3FF F692
;      GFX F693 F69A
;      CODE F69B F6CF
;      GFX F6D0 F6DF
;      CODE F6E0 F776
;      GFX F777 F778
;      CODE F779 F8DD
;      GFX F8DE F901
;      CODE F902 FAB5
;      GFX FAB6 FADC
;      CODE FADD FAFA
;      GFX FAFB FAFE
;      CODE FAFF FD26
;      GFX FD27 FD51
;      CODE FD52 FDF7
;      GFX FDF8 FDFC
;      CODE FDFD FEF2
;      GFX FEF3 FEF9
;      CODE FEFA FFAD
;      GFX FFAE FFC9
;      CODE FFCA FFDC
;      GFX FFDD FFEF
;      CODE FFF0 FFF5
;      GFX FFF6 FFFF

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
RESBL   =  $14
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
HMM1    =  $23
HMBL    =  $24
HMOVE   =  $2A
HMCLR   =  $2B
$2D     =  $2D
INPT1   =  $39
INPT4   =  $3C
SWCHA   =  $0280
SWACNT  =  $0281
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

BANK_0  =  $FFF8
BANK_1  =  $FFF9


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SWITCHES
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

KEYBOARD_CONTROLLER = 1   ; 1 = keyboard controllers, 0 = joystick
NTSC                = 1   ; 1 = NTSC, 0 = PAL

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RIOT RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RiotRam
       ORG $80

ram_80             ds 1  ; x7
ram_81             ds 1  ; x4
ram_82             ds 1  ; x4
ram_83             ds 1  ; x4
ram_84             ds 1  ; x2
ram_85             ds 1  ; x7
ram_86             ds 1  ; x14
ram_87             ds 1  ; x14
ram_88             ds 1  ; x34
ram_89             ds 1  ; x38
ram_8A             ds 1  ; x12
ram_8B             ds 1  ; x18
ram_8C             ds 1  ; x12
ram_8D             ds 1  ; x8
ram_8E             ds 1  ; x12
ram_8F             ds 1  ; x7
ram_90             ds 1  ; x3
ram_91             ds 1  ; x6
ram_92             ds 1  ; x9
ram_93             ds 1  ; x6
ram_94             ds 1  ; x7
ram_95             ds 1  ; x8
ram_96             ds 1  ; x5
ram_97             ds 1  ; x4
ram_98             ds 1  ; x27
ram_99             ds 1  ; x17
ram_9A             ds 1  ; x34
ram_9B             ds 1  ; x8
ram_9C             ds 1  ; x2
ram_9D             ds 1  ; x12
ram_9E             ds 1  ; x6
ram_9F             ds 1  ; x11
ram_A0             ds 1  ; x7
ram_A1             ds 1  ; x3
ram_A2             ds 2  ; x9
ram_A4             ds 1  ; x4
ram_A5             ds 1  ; x5
ram_A6             ds 1  ; x3
ram_A7             ds 1  ; x2
ram_A8             ds 1  ; x7
ram_A9             ds 1  ; x10
ram_AA             ds 1  ; x3
ram_AB             ds 1  ; x16
ram_AC             ds 1  ; x17
ram_AD             ds 1  ; x8
ram_AE             ds 1  ; x5
ram_AF             ds 1  ; x6
ram_B0             ds 1  ; x7
ram_B1             ds 5  ; x11
ram_B6             ds 1  ; x8
ram_B7             ds 1  ; x2
ram_B8             ds 1  ; x8
ram_B9             ds 1  ; x1
ram_BA             ds 1  ; x8
ram_BB             ds 1  ; x1
ram_BC             ds 1  ; x3
ram_BD             ds 1  ; x3
ram_BE             ds 1  ; x3
ram_BF             ds 1  ; x6
ram_C0             ds 1  ; x1
ram_C1             ds 1  ; x7
ram_C2             ds 1  ; x1
ram_C3             ds 1  ; x6
ram_C4             ds 1  ; x2
ram_C5             ds 1  ; x6
ram_C6             ds 1  ; x2
ram_C7             ds 1  ; x5
ram_C8             ds 1  ; x1
ram_C9             ds 1  ; x4
ram_CA             ds 1  ; x2
ram_CB             ds 4  ; x3
ram_CF             ds 1  ; x1
ram_D0             ds 5  ; x3
ram_D5             ds 1  ; x3
ram_D6             ds 1  ; x1
ram_D7             ds 1  ; x3
ram_D8             ds 1  ; x1
ram_D9             ds 1  ; x12
ram_DA             ds 1  ; x5
ram_DB             ds 1  ; x12
ram_DC             ds 1  ; x4
ram_DD             ds 1  ; x6
ram_DE             ds 1  ; x5
ram_DF             ds 1  ; x7
ram_E0             ds 1  ; x4
ram_E1             ds 1  ; x5
ram_E2             ds 1  ; x3
ram_E3             ds 1  ; x2
ram_E4             ds 1  ; x1
ram_E5             ds 1  ; x1
ram_E6             ds 1  ; x1
ram_E7             ds 1  ; x1
ram_E8             ds 1  ; x1
ram_E9             ds 1  ; x1
ram_EA             ds 1  ; x4
ram_EB             ds 1  ; x11
ram_EC             ds 1  ; x7
ram_ED             ds 1  ; x5
ram_EE             ds 1  ; x2
ram_EF             ds 1  ; x2
ram_F0             ds 1  ; x6
ram_F1             ds 15 ; x5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE

       ORG $0000
      RORG $B000

    .byte $00 ; |        | $B000
    .byte $7E ; | XXXXXX | $B001
    .byte $FF ; |XXXXXXXX| $B002
    .byte $FF ; |XXXXXXXX| $B003
    .byte $FF ; |XXXXXXXX| $B004
    .byte $FF ; |XXXXXXXX| $B005
    .byte $8E ; |X   XXX | $B006
    .byte $06 ; |     XX | $B007
    .byte $07 ; |     XXX| $B008
    .byte $06 ; |     XX | $B009
    .byte $06 ; |     XX | $B00A
    .byte $00 ; |        | $B00B
    .byte $00 ; |        | $B00C
    .byte $00 ; |        | $B00D
    .byte $00 ; |        | $B00E
    .byte $00 ; |        | $B00F
    .byte $00 ; |        | $B010

  IF NTSC
    .byte $08 ; |    X   | $B011
    .byte $0A ; |    X X | $B012
    .byte $0C ; |    XX  | $B013
    .byte $0C ; |    XX  | $B014
    .byte $0A ; |    X X | $B015
    .byte $08 ; |    X   | $B016
    .byte $0C ; |    XX  | $B017
    .byte $0E ; |    XXX | $B018
    .byte $0C ; |    XX  | $B019
    .byte $36 ; |  XX XX | $B01A
  ELSE
    .byte $0E ; |    XXX | $B011
    .byte $0E ; |    XXX | $B012
    .byte $0E ; |    XXX | $B013
    .byte $0E ; |    XXX | $B014
    .byte $0E ; |    XXX | $B015
    .byte $0E ; |    XXX | $B016
    .byte $0E ; |    XXX | $B017
    .byte $0E ; |    XXX | $B018
    .byte $0E ; |    XXX | $B019
    .byte $44 ; | X   X  | $B01A
  ENDIF

    .byte $00 ; |        | $B01B
    .byte $00 ; |        | $B01C
    .byte $00 ; |        | $B01D
    .byte $00 ; |        | $B01E
    .byte $00 ; |        | $B01F
    .byte $00 ; |        | $B020
    .byte $FF ; |XXXXXXXX| $B021
    .byte $FF ; |XXXXXXXX| $B022
    .byte $FF ; |XXXXXXXX| $B023
    .byte $FF ; |XXXXXXXX| $B024
    .byte $8E ; |X   XXX | $B025
    .byte $07 ; |     XXX| $B026
    .byte $06 ; |     XX | $B027
    .byte $06 ; |     XX | $B028
    .byte $00 ; |        | $B029
    .byte $00 ; |        | $B02A
    .byte $00 ; |        | $B02B
    .byte $00 ; |        | $B02C
    .byte $00 ; |        | $B02D
    .byte $00 ; |        | $B02E
    .byte $00 ; |        | $B02F
    .byte $00 ; |        | $B030

  IF NTSC
    .byte $08 ; |    X   | $B031
    .byte $0A ; |    X X | $B032
    .byte $0C ; |    XX  | $B033
    .byte $0C ; |    XX  | $B034
    .byte $0A ; |    X X | $B035
    .byte $0C ; |    XX  | $B036
    .byte $0C ; |    XX  | $B037
    .byte $36 ; |  XX XX | $B038
  ELSE
    .byte $0E ; |    XXX | $B031
    .byte $0E ; |    XXX | $B032
    .byte $0E ; |    XXX | $B033
    .byte $0E ; |    XXX | $B034
    .byte $0E ; |    XXX | $B035
    .byte $0E ; |    XXX | $B036
    .byte $0E ; |    XXX | $B037
    .byte $44 ; | X   X  | $B038
  ENDIF

    .byte $00 ; |        | $B039
    .byte $00 ; |        | $B03A
    .byte $00 ; |        | $B03B
    .byte $00 ; |        | $B03C
    .byte $00 ; |        | $B03D
    .byte $00 ; |        | $B03E
    .byte $00 ; |        | $B03F
    .byte $00 ; |        | $B040
    .byte $1E ; |   XXXX | $B041
    .byte $14 ; |   X X  | $B042
    .byte $14 ; |   X X  | $B043
    .byte $38 ; |  XXX   | $B044
    .byte $7C ; | XXXXX  | $B045
    .byte $7E ; | XXXXXX | $B046
    .byte $FF ; |XXXXXXXX| $B047
    .byte $FF ; |XXXXXXXX| $B048
    .byte $FF ; |XXXXXXXX| $B049
    .byte $DF ; |XX XXXXX| $B04A
    .byte $8E ; |X   XXX | $B04B
    .byte $86 ; |X    XX | $B04C
    .byte $07 ; |     XXX| $B04D
    .byte $06 ; |     XX | $B04E
    .byte $06 ; |     XX | $B04F

  IF NTSC
    .byte $08 ; |    X   | $B050
    .byte $08 ; |    X   | $B051
    .byte $08 ; |    X   | $B052
    .byte $0A ; |    X X | $B053
    .byte $0A ; |    X X | $B054
    .byte $0C ; |    XX  | $B055
    .byte $0C ; |    XX  | $B056
    .byte $0C ; |    XX  | $B057
    .byte $0A ; |    X X | $B058
    .byte $0A ; |    X X | $B059
    .byte $08 ; |    X   | $B05A
    .byte $0C ; |    XX  | $B05B
    .byte $0C ; |    XX  | $B05C
    .byte $0C ; |    XX  | $B05D
    .byte $36 ; |  XX XX | $B05E
  ELSE
    .byte $0E ; |    XXX | $B050
    .byte $0E ; |    XXX | $B051
    .byte $0E ; |    XXX | $B052
    .byte $0E ; |    XXX | $B053
    .byte $0E ; |    XXX | $B054
    .byte $0E ; |    XXX | $B055
    .byte $0E ; |    XXX | $B056
    .byte $0E ; |    XXX | $B057
    .byte $0E ; |    XXX | $B058
    .byte $0E ; |    XXX | $B059
    .byte $0E ; |    XXX | $B05A
    .byte $0E ; |    XXX | $B05B
    .byte $0E ; |    XXX | $B05C
    .byte $0E ; |    XXX | $B05D
    .byte $44 ; | X   X  | $B05E
  ENDIF

    .byte $00 ; |        | $B05F
    .byte $00 ; |        | $B060
    .byte $00 ; |        | $B061
    .byte $00 ; |        | $B062
    .byte $00 ; |        | $B063
    .byte $00 ; |        | $B064
    .byte $00 ; |        | $B065
    .byte $00 ; |        | $B066
    .byte $00 ; |        | $B067
    .byte $00 ; |        | $B068
    .byte $00 ; |        | $B069
    .byte $00 ; |        | $B06A
    .byte $00 ; |        | $B06B
    .byte $00 ; |        | $B06C
    .byte $00 ; |        | $B06D

LB06E:  ; indirect jump
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    #0                    ;2  @5
    sta    ENABL                 ;3  @8

  IF NTSC
    ldx    #$8A                  ;2  @10   sky color
    stx    COLUBK                ;3  @13
    stx    COLUPF                ;3  @16
    lda    #$FF                  ;2  @18   fill for middle of the roof
    sta    PF2                   ;3  @21
    lda    #$80                  ;2  @23
    sta    HMP0                  ;3  @26
    lda    #$90                  ;2  @28
    sta    HMP1                  ;3  @31
    ldy    ram_9A                ;3  @34
    nop                          ;2  @36
    nop                          ;2  @38
    sta    RESP0                 ;3  @41
    sta    RESP1                 ;3  @44
    jsr    DelayCycles+9         ;14 @58
  ELSE
    ldx    ram_EB                ; 3
    stx    COLUBK                ; 3
    ldy    #$10                  ; 2
    jsr    LB4EE                 ; 6
    stx    COLUPF                ; 3
    lda    #$FF                  ; 2
    sta    PF2                   ; 3
    jsr    DelayCycles           ; 21
    pha                          ; 3
    pla                          ; 4
    ldy    ram_9A                ; 3
  ENDIF

    stx    COLUPF                ;3  @61
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    stx    COLUBK                ;3  @6
    tya                          ;2  @8
    and    #$0F                  ;2  @10
    tax                          ;2  @12
    tya                          ;2  @14
    ldy    #$12                  ;2  @16
LB0A2:
    dex                          ;2
    bne    LB0A2                 ;2³
    sta    RESBL                 ;3
    sta    HMCLR                 ;3
    sta    HMBL                  ;3
    lda    RoofPatEggSign-1,Y    ;4   $B9FE, always #$0F
LoopUpperPartEggSign:
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    PF1                   ;3  @6
  IF NTSC
    lda    ram_9A                ;3  @9  waste time
  ENDIF
LoopLowerPartEggSign:

  IF NTSC
    nop                          ;2  @11
    lda    ColSkyEggSign-1,Y     ;4  @15
    sta    COLUBK                ;3  @18
    lda    ColRoofEggSign-1,Y    ;4  @22
    sta    COLUPF                ;3  @25
    lda    EggsOne-1,Y           ;4  @29
    sta    GRP0                  ;3  @32
    lda    EggsTwo-1,Y           ;4  @36
    sta    GRP1                  ;3  @39
    ldx    EggsFour-1,Y          ;4  @43
    lda    EggsThree-1,Y         ;4  @47
    sta    GRP0                  ;3  @50
    stx    GRP1                  ;3  @53
    dey                          ;2  @55
    beq    .prepForChickens      ;2³ @57/58
    sta    HMCLR                 ;3  @60
    lda    RoofPatEggSign-1,Y    ;4  @64
    cpy    #9                    ;2  @66
  ELSE
    lda    ColRoofEggSign-1,Y    ;4
    sta    COLUPF                ;3
    dey                          ;2
    beq    LoopUpperPartEggSign  ;2³
    lda    RoofPatEggSign-1,Y    ;4
    cpy    #$09                  ;2
    nop                          ;2
    sta    HMCLR                 ;3
  ENDIF
  
    bcs    LoopUpperPartEggSign  ;2³ @68/69
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    PF0                   ;3  @6
    jmp    LoopLowerPartEggSign  ;3  @9

.prepForChickens:

  IF NTSC
    sty    PF2                   ;3  @61   Y=0, clear
    sty    GRP0                  ;3  @64
    sty    GRP1                  ;3  @67
    sty    PF1                   ;3  @70
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    #$06                  ;2  @5
    sta    COLUPF                ;3  @8
    lda    #$36                  ;2  @10
    sta    NUSIZ0                ;3  @13
    lda    #$32                  ;2  @15
    sta    NUSIZ1                ;3  @18
    pha                          ;3  @21
    pla                          ;4  @25
    lda    #$A0                  ;2  @27
    sta    HMP0                  ;3  @30
    sta    RESP0                 ;3  @33
    lda    #$90                  ;2  @35
    sta    RESP1                 ;3  @38
    sta    HMP1                  ;3  @41
  ELSE
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    PF1                   ; 3
    sty.w  PF2                   ; 4
    lda    #$06                  ; 2
    sta    COLUPF                ; 3
    sta    COLUBK                ; 3
    lda    #$36                  ; 2
    sta    NUSIZ0                ; 3
    lda    #$32                  ; 2
    sta    NUSIZ1                ; 3
    lda    #$A0                  ; 2
    sta    RESP0                 ; 3
    ldx    #$90                  ; 2
    sta    RESP1                 ; 3
    sta    HMP0                  ; 3
    stx    HMP1                  ; 3
  ENDIF
  
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    ram_9F                ;3  @6
    asl                          ;2  @8
    tax                          ;2  @10
    lda    IndirectJmpTab,X      ;4  @14
    sta    ram_98                ;3  @17
    lda    IndirectJmpTab+1,X    ;4  @21
    sta    ram_99                ;3  @24
    sta    HMCLR                 ;3  @27
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    
  IF NTSC
    lda    #$00                  ;2  @5   black
    sta    COLUBK                ;3  @8
    lda    #$F2                  ;2  @10
    sta    COLUPF                ;3  @13
    ldx    #$F4                  ;2  @15
    ldy    #$0F                  ;2  @17
  ELSE
    sty    COLUBK                ; 3
    ldx    #$44                  ; 2
    bit    ram_EA                ; 3
    bpl    MB113                 ; 2³
    lda    #$42                  ; 2
    sta    COLUPF                ; 3
    bne    MB115                 ; 2³
MB113:
    stx    COLUPF                ; 3
MB115:
    ldy    #$06                  ; 2
    jsr    LB4EE                 ; 6
    ldy    #$0F                  ; 2
  ENDIF
  
.loopDrawChickens:
    lda    (ram_D5),Y            ;5  @23/67
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    COLUP0                ;3  @6
    sta    COLUP0                ;3  @9
    lda    (ram_D7),Y            ;5  @14
    sta    COLUP1                ;3  @17
    lda    (ram_D9),Y            ;5  @22
    sta    GRP0                  ;3  @25
    lda    (ram_DB),Y            ;5  @30
    sta    GRP1                  ;3  @33
    lda    (ram_DD),Y            ;5  @38
    sta    GRP0                  ;3  @41
    lda    (ram_DF),Y            ;5  @46
    sta    GRP1                  ;3  @49
    lda    (ram_E1),Y            ;5  @54
    sta    GRP0                  ;3  @57
    dey                          ;2  @59
    bne    .loopDrawChickens     ;2³ @61/62

    sty    GRP0                  ;3  @64  Y=0, clear
    sty    GRP1                  ;3  @67
    lda    #$0A                  ;2  @69
    sta    COLUP0                ;3  @72
    sta.w  COLUP1                ;4  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    stx    COLUPF                ;3  @6
    lda    #$C0                  ;2  @8
    sta    COLUBK                ;3  @11
    ldy    #$04                  ;2  @13
    ldx    #$14                  ;2  @15
    nop                          ;2  @17
    jmp.ind ($0098)              ;5  @22

LB174:  ; indirect jump
    lda    #$02                  ;2  @24
    sta    PF1                   ;3  @27
    stx    COLUPF                ;3  @30
    sta    RESP0                 ;3  @33
    lda    #$01                  ;2  @35
    sta    PF2                   ;3  @38
    lda    #$A0                  ;2  @40
    sta    HMP0                  ;3  @43
    lda    #$02                  ;2  @45
    sta    PF2                   ;3  @48
    lda    #$01                  ;2  @50
    sta    PF1                   ;3  @53
    sta    RESP1                 ;3  @56
    lda    #$F0                  ;2  @58
    sta    NUSIZ0                ;3  @61
    jmp    LB23E                 ;3  @64

LB195:  ; indirect jump
    lda    #$00                  ;2  @24
    sta    PF1                   ;3  @27
    stx    COLUPF                ;3  @30
    lda    #$14                  ;2  @32
    sta    PF2                   ;3  @35
    sta    RESP0                 ;3  @38
    lda    #$00                  ;2  @40
    sta    PF1                   ;3  @43
    lda    #$28                  ;2  @45
    sta    PF2                   ;3  @48
    sta    RESP1                 ;3  @51
    lda    #$90                  ;2  @53
    sta    NUSIZ0                ;3  @56
    sta    HMP0                  ;3  @59
    lda    #$00                  ;2  @61
    jmp    LB23E                 ;3  @64

LB1B6:  ; indirect jump
    lda    #$02                  ;2  @24
    sta    PF1                   ;3  @27
    stx    COLUPF                ;3  @30
    sta    RESP0                 ;3  @33
    lda    #$41                  ;2  @35
    sta    PF2                   ;3  @38
    lda    #$82                  ;2  @40
    ldx    #$01                  ;2  @42
    sta    RESP1                 ;3  @45
    sta    PF2                   ;3  @48
    stx    PF1                   ;3  @51
    lda    #$A0                  ;2  @53
    sta    HMP0                  ;3  @56
    sta    NUSIZ0                ;3  @59
    lda    #$E2                  ;2  @61
    jmp    LB23E                 ;3  @64

LB1D7:  ; indirect jump
    lda    #$02                  ;2  @24
    sta    PF1                   ;3  @27
    stx    COLUPF                ;3  @30
    sta    RESP0                 ;3  @33
    lda    #$15                  ;2  @35
    sta    PF2                   ;3  @38
    sta    RESP1                 ;3  @41
    ldx    #$01                  ;2  @43
    lda    #$2A                  ;2  @45
    sta    PF2                   ;3  @48
    stx    PF1                   ;3  @51
    lda    #$A4                  ;2  @53
    sta    NUSIZ0                ;3  @56
    sta    HMP0                  ;3  @59
    lda    #$22                  ;2  @61
    jmp    LB23E                 ;3  @64

LB1F8:  ; indirect jump
    lda    #$00                  ;2  @24
    sta    PF1                   ;3  @27
    stx    COLUPF                ;3  @30
    lda    #$54                  ;2  @32
    sta    PF2                   ;3  @35
    sta    RESP0                 ;3  @38
    lda    #$AA                  ;2  @40
    ldx    #$01                  ;2  @42
    sta    RESP1                 ;3  @45
    sta    PF2                   ;3  @48
    stx    PF1                   ;3  @51
    lda    #$92                  ;2  @53
    sta    NUSIZ0                ;3  @56
    sta    HMP0                  ;3  @59
    lda    #$E2                  ;2  @61
    jmp    LB23E                 ;3  @64

LB219:  ; indirect jump
    lda    #$02                  ;2  @24
    sta    PF1                   ;3  @27
    stx    COLUPF                ;3  @30
    sta    RESP0                 ;3  @33
    lda    #$55                  ;2  @35
    sta    PF2                   ;3  @38
    sta    RESP1                 ;3  @41
    ldx    #$01                  ;2  @43
    lda    #$AA                  ;2  @45
    sta    PF2                   ;3  @48
    stx    PF1                   ;3  @51
    lda    #$A6                  ;2  @53
    sta    NUSIZ0                ;3  @56
    sta    HMP0                  ;3  @59
    lda    #$22                  ;2  @61
    jmp    LB23E                 ;3  @64

.loopDrawNests:
    nop                          ;2  @70
    nop                          ;2  @72
    bne    LB247                 ;3  @75   always branch, 1 cycle early though

LB23E:
    ldx    #$F4                  ;2  @66
    stx.w  COLUPF                ;4  @70
    sta    HMP1                  ;3  @73
    sta    NUSIZ1                ;3  @76
;---------------------------------------
LB247:
    sta    HMOVE                 ;3  @2/3
    lda    LBAD7,Y               ;4  @6/7
    sta    COLUBK                ;3  @9/10
    lda    ram_E3                ;3  @12/13
    sta    PF1                   ;3  @15/16
    ldx    NestGfx-1,Y           ;4  @19/20
    stx    GRP0                  ;3  @22/23
    lda    NestColors-1,Y        ;4  @26/27
    sta    COLUPF                ;3  @29/30
    lda    ram_E5                ;3  @32/33
    sta    PF2                   ;3  @35/36
    stx    GRP1                  ;3  @38/39
    sta    HMCLR                 ;3  @41/42
    lda    ram_E7                ;3  @44/45
    sta    PF2                   ;3  @47/48
    lda    ram_E9                ;3  @50/51
    sta    PF1                   ;3  @53/54
    dey                          ;2  @55/56
    nop                          ;2  @57/58
    lda    #$F4                  ;2  @59/60
    sta    COLUPF                ;3  @62/63
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    LBAD7,Y               ;4  @7
    sta    COLUBK                ;3  @10
    lda    ram_E4                ;3  @13
    sta    PF1                   ;3  @16
    ldx    NestGfx-1,Y           ;4  @20
    stx    GRP0                  ;3  @23
    lda    NestColors-1,Y        ;4  @27
    sta    COLUPF                ;3  @30
    lda    ram_E6                ;3  @33
    sta    PF2                   ;3  @36
    stx    GRP1                  ;3  @39
    lda    ram_9A                ;3  @42
    lda    ram_E8                ;3  @45
    sta    PF2                   ;3  @48
    lda    #$00                  ;2  @50
    sta    PF1                   ;3  @53
    nop                          ;2  @55
    nop                          ;2  @57
    lda    #$F4                  ;2  @59
    sta.w  COLUPF                ;4  @63
    dey                          ;2  @65
    bne    .loopDrawNests        ;2³ @67/68

    sty    PF2                   ;3  @70   Y=0, clear
    sty    PF1                   ;3  @73
    sty    GRP0                  ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    LBAD7,Y               ;4  @7    $BAD7, always $D2
    sta    COLUBK                ;3  @10
    sty    GRP1                  ;3  @13
    lda    #$30                  ;2  @15
    sta    NUSIZ0                ;3  @18
    sta    NUSIZ1                ;3  @21
    jsr    DelayCycles+8         ;15 @36
    bit    ram_9D                ;3  @39
    bpl    LB2C6                 ;2³ @41/42
    sta.w  RESBL                 ;4  @45
    ldx    #$D0                  ;2  @47
    bmi    LB2CC                 ;3  @50   always branch

LB2C6:
    nop                          ;2  @44
    nop                          ;2  @46
    ldx    #$00                  ;2  @48
    lda    #$40                  ;2  @50
LB2CC:
    sta    RESM0                 ;3  @53
    bvc    LB2D4                 ;2³ @55/56
    sta    RESM0                 ;3  @58
    bvs    LB2D8                 ;3  @61   always branch

LB2D4:
    sta    RESM1                 ;3  @59
    lda    #$50                  ;2  @61
LB2D8:
    stx    HMBL                  ;3  @64
    sta    HMM0                  ;3  @67
    lda    #$70                  ;2  @69
    sta    HMM1                  ;3  @72
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3   first grey line after nests
    lda    #$F4                  ;2  @5
    sta    COLUBK                ;3  @8
    sta    COLUPF                ;3  @11
    lda    #$35                  ;2  @13
    sta    CTRLPF                ;3  @16
    lda    #$FF                  ;2  @18
    sta    PF1                   ;3  @21
    sta    PF2                   ;3  @24
    sta    GRP0                  ;3  @27
    sta    GRP1                  ;3  @30
    sta    HMCLR                 ;3  @33
    ldx    ram_9F                ;3  @36
    lda    EggEnableTab,X        ;4  @40
    sta    ENAM0                 ;3  @43
    lsr                          ;2  @45
    sta    ENAM1                 ;3  @48
    lsr                          ;2  @50
    sta    ENABL                 ;3  @53
    lda    ram_EE                ;3  @56
    sta    COLUP0                ;3  @59
    lda    ram_EF                ;3  @62
    sta    COLUP1                ;3  @65
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    ldx    #$00                  ;2  @5
    ldy    #$42                  ;2  @7
    lda    ram_9D                ;3  @10
    bpl    LB31E                 ;2³ @12/13
    jmp    LB3E8                 ;3  @15

LB31E:
    lda    ram_88                ;3  @16
    and    #$08                  ;2  @18
    bne    LB32D                 ;2³ @20/21
    jmp    LB49E                 ;3  @23

EggEnableTab:
    .byte $00 ; |        | $B327  No eggs
    .byte $00 ; |        | $B328  No eggs
    .byte $02 ; |      X | $B329  1 egg  (ENAM0)
    .byte $06 ; |     XX | $B32A  2 eggs (ENAM1, ENAM0)
    .byte $06 ; |     XX | $B32B  2 eggs (ENAM1, ENAM0)
    .byte $0E ; |    XXX | $B32C  3 eggs (ENABL, ENAM1, ENAM0)

LB32D:
    lda    (ram_B8),Y            ;5  @26
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    stx    COLUBK                ;3  @6
    stx    PF1                   ;3  @9
    stx    PF2                   ;3  @12
    sta    CTRLPF                ;3  @15
    lda    (ram_BA),Y            ;5  @20
    sta    ENABL                 ;3  @23
    ldx    ram_EB                ;3  @26
    stx    COLUPF                ;3  @29
    sta    HMBL                  ;3  @32
    cpy    ram_AC                ;3  @35
    bne    LB351                 ;2³ @37/38
    lda    #$00                  ;2  @39
    sta    COLUP0                ;3  @42
    sta    COLUP1                ;3  @45
    beq    LB356                 ;3  @48   always branch

LB351:
    nop                          ;2  @40
    nop                          ;2  @42
    nop                          ;2  @44
    nop                          ;2  @46
    nop                          ;2  @48
LB356:
    ldx    ram_9F                ;3  @51
    lda    LB3E2,X               ;4  @55
    sta    ram_9B                ;3  @58
    lda    (ram_B6),Y            ;5  @63
    ldx    #$F4                  ;2  @65
    stx    COLUPF                ;3  @68
    sta    ram_9A                ;3  @71
LB365:
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    dey                          ;2  @5
    bne    LB36F                 ;2³ @7/8
    jmp    LB517                 ;3  @10

LB36F:
    lda    (ram_B8),Y            ;5  @13
    sta    CTRLPF                ;3  @16
    lda    (ram_BA),Y            ;5  @21
    sta    ENABL                 ;3  @24
    ldx    ram_EB                ;3  @27
    stx    COLUPF                ;3  @30
    sta    HMBL                  ;3  @33
    ldx    ram_9B                ;3  @36
    cpy    ram_AC                ;3  @39
    beq    LB399                 ;2³ @41/42
    lda    #$10                  ;2  @43
    asl    ram_9A                ;5  @48
    bcs    LB38B                 ;2³ @50/51
    lda    #$F0                  ;2  @52
LB38B:
    sta    HMP0,X                ;4  @55/56
LB38D:
    dex                          ;2  @57/58
    bmi    LB3A2                 ;2³ @59..61
    stx    ram_9B                ;3  @62/63
    lda    #$F4                  ;2  @64/65
    sta    COLUPF                ;3  @67/68
    jmp    LB365                 ;3  @70/71

LB399:
    lda    #$00                  ;2  @44
    sta    COLUP0                ;3  @47
    sta    COLUP1                ;3  @50
    nop                          ;2  @52
    beq    LB38D                 ;3  @55   always branch

LB3A2:
    lda    #$F4                  ;2  @62/63
    ldx    ram_9F                ;3  @65/66
    sta    COLUPF                ;3  @68/69
    dey                          ;2  @70/71
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    bne    LB3B3                 ;2³ @5/6
    nop                          ;2  @7
    jmp    LB517                 ;3  @10

LB3B3:
    lda    (ram_B8),Y            ;5  @11
    sta    CTRLPF                ;3  @14
    lda    (ram_BA),Y            ;5  @19
    sta    ENABL                 ;3  @22
    sta    HMBL                  ;3  @25
    lda    ram_EB                ;3  @28
    sta    COLUPF                ;3  @31
    cpy    ram_AC                ;3  @34
    bne    LB3CD                 ;2³ @36/37
    lda    #$00                  ;2  @38
    sta    COLUP0                ;3  @41
    sta    COLUP1                ;3  @44
    beq    LB3D2                 ;3  @47   always branch

LB3CD:
    nop                          ;2  @39
    nop                          ;2  @41
    nop                          ;2  @43
    nop                          ;2  @45
    nop                          ;2  @47
LB3D2:
    lda    LB3E2,X               ;4  @51
    sta    ram_9B                ;3  @54
    lda    (ram_B6),Y            ;5  @59
    sta    ram_9A                ;3  @62
    lda    #$F4                  ;2  @64
    sta    COLUPF                ;3  @67
    jmp    LB365                 ;3  @70

LB3E2:
    .byte $01 ; |       X| $B3E2
    .byte $01 ; |       X| $B3E3
    .byte $02 ; |      X | $B3E4
    .byte $03 ; |      XX| $B3E5
    .byte $03 ; |      XX| $B3E6
    .byte $04 ; |     X  | $B3E7

LB3E8:
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    stx    COLUBK                ;3  @6
    stx    PF1                   ;3  @9
    stx    PF2                   ;3  @12
    jmp    LB401                 ;3  @15

LB3F5:
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    dey                          ;2  @5
    bne    LB3FF                 ;2³ @7/8
    jmp    LB4E9                 ;3  @10

LB3FF:
    pha                          ;3  @11
    pla                          ;4  @15
LB401:
    cpy    ram_AC                ;3  @18
    bcs    LB411                 ;2³ @20/21
    ldx    #$00                  ;2  @22
    stx    COLUP0                ;3  @25
    stx    COLUP1                ;3  @28
    stx    COLUPF                ;3  @31
    sta    HMCLR                 ;3  @34
    beq    LB41A                 ;3  @37   always branch

LB411:
    lda    (ram_B6),Y            ;5  @26
    ldx    ram_F0                ;3  @29
    stx    COLUPF                ;3  @32
    ldx    #$10                  ;2  @34
    asl                          ;2  @36
LB41A:
    bcs    LB41E                 ;2³ @38..40
    ldx    #$F0                  ;2  @40/41
LB41E:
    stx    HMBL                  ;3  @42..44
    sta    ram_9A                ;3  @45..47
    jsr    DelayCycles+7         ;17 @62..64
    lda    #$F4                  ;2  @64..66
    sta    COLUPF                ;3  @67..69
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    dey                          ;2  @5
    bne    LB433                 ;2³ @7/8
    jmp    LB4E9                 ;3  @10

LB433:
    cpy    ram_AC                ;3  @11
    bcs    LB441                 ;2³ @13/14
    ldx    #$00                  ;2  @15
    stx    COLUP0                ;3  @18
    stx    COLUP1                ;3  @21
    sta    HMCLR                 ;3  @24
    beq    LB448                 ;3  @27   always branch

LB441:
    asl    ram_9A                ;5  @19
    nop                          ;2  @21
    nop                          ;2  @23
    ldx.w  ram_F0                ;4  @27
LB448:
    stx    COLUPF                ;3  @30
    ldx    #$10                  ;2  @32
    bcs    LB450                 ;2³ @34/35
    ldx    #$F0                  ;2  @36
LB450:
    stx    HMP0                  ;3  @38/39
    ldx    #$10                  ;2  @40/41
    asl    ram_9A                ;5  @45/46
    bcs    LB45A                 ;2³ @47..49
    ldx    #$F0                  ;2  @49/50
LB45A:
    stx    HMP1                  ;3  @51..53
    pha                          ;3  @54..56
    pla                          ;4  @58..60
    lda    #$F4                  ;2  @60..63
    sta    COLUPF                ;3  @63..65
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    dey                          ;2  @5
    bne    LB46C                 ;2³ @7/8
    jmp    LB4E9                 ;3  @10

LB46C:
    cpy    ram_AC                ;3  @11
    bcs    LB47A                 ;2³ @13/14
    ldx    #$00                  ;2  @15
    stx    COLUP0                ;3  @18
    stx    COLUP1                ;3  @21
    sta    HMCLR                 ;3  @24
    beq    LB481                 ;3  @27   always branch

LB47A:
    asl    ram_9A                ;5  @19
    nop                          ;2  @21
    nop                          ;2  @23
    ldx.w  ram_F0                ;4  @27
LB481:
    stx    COLUPF                ;3  @30
    ldx    #$10                  ;2  @32
    bcs    LB489                 ;2³ @34/35
    ldx    #$F0                  ;2  @36
LB489:
    stx    HMM0                  ;3  @38/39
    ldx    #$10                  ;2  @40/41
    asl    ram_9A                ;5  @45/46
    bcs    LB493                 ;2³ @47..49
    ldx    #$F0                  ;2  @49/50
LB493:
    stx    HMM1                  ;3  @51..53
    pha                          ;3  @54..56
    pla                          ;4  @58..60
    lda    #$F4                  ;2  @60..63
    sta    COLUPF                ;3  @63..65
    jmp    LB3F5                 ;3  @66..68

LB49E:
    lda    (ram_BA),Y            ;5  @28
    sta    ram_9A                ;3  @31
    lda    (ram_B8),Y            ;5  @36
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    stx    COLUBK                ;3  @6
    stx    PF1                   ;3  @9
    stx    PF2                   ;3  @12
    sta    CTRLPF                ;3  @15
    lda    ram_9A                ;3  @18
    jmp    LB4C5                 ;3  @21

LB4B5:
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    dey                          ;2  @5
    bne    LB4BF                 ;2³ @7/8
    jmp    LB517                 ;3  @10

LB4BF:
    lda    (ram_B8),Y            ;5  @13
    sta    CTRLPF                ;3  @16
    lda    (ram_BA),Y            ;5  @21
LB4C5:
    sta    ENABL                 ;3  @24
    ldx    ram_EB                ;3  @27
    stx    COLUPF                ;3  @30
    sta    HMBL                  ;3  @33
    cpy    ram_AC                ;3  @36
    bne    LB4D9                 ;2³ @38/39
    ldx    #$00                  ;2  @40
    stx    COLUP0                ;3  @43
    stx    COLUP1                ;3  @46
    beq    LB4DB                 ;3  @49   always branch

LB4D9:
    pha                          ;3  @42
    pla                          ;4  @46
LB4DB:
    jsr    DelayCycles+9         ;14 @50/53
    lda    #$F4                  ;2  @52/55
    sta    COLUPF                ;3  @55/58
    jmp    LB4B5                 ;3  @58/61
    

  IF NTSC
  
LB4E5:
    .byte $00 ; |        | $B4E5
    .byte $00 ; |        | $B4E6
    .byte $00 ; |        | $B4E7
    .byte $00 ; |        | $B4E8
   
  ELSE
  
    .byte $43 ; | X    XX| $B4CD
    .byte $48 ; | X  X   | $B4CE
    .byte $52 ; | X X  X | $B4CF
    .byte $49 ; | X  X  X| $B4D0
    .byte $53 ; | X X  XX| $B4D1
    .byte $54 ; | X X X  | $B4D2
    .byte $4F ; | X  XXXX| $B4D3
    .byte $50 ; | X X    | $B4D4
    .byte $48 ; | X  X   | $B4D5
    .byte $45 ; | X   X X| $B4D6
    .byte $52 ; | X X  X | $B4D7
    .byte $20 ; |  X     | $B4D8
    .byte $48 ; | X  X   | $B4D9
    .byte $2E ; |  X XXX | $B4DA
    .byte $20 ; |  X     | $B4DB
    .byte $4F ; | X  XXXX| $B4DC
    .byte $4D ; | X  XX X| $B4DD
    .byte $41 ; | X     X| $B4DE
    .byte $52 ; | X X  X | $B4DF
    .byte $5A ; | X XX X | $B4E0
    .byte $55 ; | X X X X| $B4E1
    .byte $00 ; |        | $B4E2
    .byte $00 ; |        | $B4E3
    .byte $00 ; |        | $B4E4
    .byte $00 ; |        | $B4E5
    .byte $00 ; |        | $B4E6
    .byte $00 ; |        | $B4E7
    .byte $00 ; |        | $B4E8
    .byte $00 ; |        | $B4E9
    .byte $00 ; |        | $B4EA
    .byte $00 ; |        | $B4EB
    .byte $00 ; |        | $B4EC
    .byte $00 ; |        | $B4ED
LB4EE:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    dey                          ; 2
    bne    LB4EE                 ; 2³
    rts                          ; 6
    
  ENDIF
  
LB4E9:
    cpy    ram_AC                ;3  @13
    cpy    ram_AC                ;3  @16
    bcs    LB4F7                 ;2³ @18/19
    ldx    #$00                  ;2  @20
    stx    COLUP0                ;3  @23
    stx    COLUP1                ;3  @26
    beq    LB4FB                 ;3  @29   always branch
    
LB4F7:
    pha                          ;3  @22
    pla                          ;4  @26
    ldx    ram_F0                ;3  @29
LB4FB:
    stx    COLUPF                ;3  @32
    sta    HMCLR                 ;3  @35
    jsr    DelayCycles           ;27 @62
    lda    #$F4                  ;2  @64
    sta    COLUPF                ;3  @67
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    jsr    DelayCycles+4         ;21 @24
    lda    ram_F0                ;3  @27
    sta    COLUPF                ;3  @30
    jsr    DelayCycles+5         ;20 @50
    jmp    LB557                 ;3  @53

LB517:
    lda    (ram_B8),Y            ;5  @15
    sta    CTRLPF                ;3  @18
    lda    (ram_BA),Y            ;5  @23
    sta    ENABL                 ;3  @26
    ldx    ram_EB                ;3  @29
    stx    COLUPF                ;3  @32
    sta    HMCLR                 ;3  @35
    sta    HMBL                  ;3  @38
    jsr    DelayCycles+1         ;26 @64
    lda    #$F4                  ;2  @66
    sta    COLUPF                ;3  @69
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    ldx    ram_BC                ;3  @6
    lda    LBF00,X               ;4  @10
    sta    CTRLPF                ;3  @13
    lda    LBF48,X               ;4  @17
    sta    ENABL                 ;3  @20
    ldx    ram_EB                ;3  @23
    cpy    ram_AC                ;3  @26
    sta    HMBL                  ;3  @29
    stx    COLUPF                ;3  @32
    bcs    LB551                 ;2³ @34/35
    ldx    #$00                  ;2  @36
    stx    COLUP0                ;3  @39
    stx    COLUP1                ;3  @42
    nop                          ;2  @44
    beq    LB554                 ;3  @47   always branch

LB551:
    jsr    DelayCycles+10        ;12 @47
LB554:
    nop                          ;2  @49
    nop                          ;2  @51
    nop                          ;2  @53
LB557:
    ldx    ram_EB                ;3  @56
    txs                          ;2  @58
    ldx    #$FF                  ;2  @60
    stx    PF2                   ;3  @63
    lda    #$F4                  ;2  @65
    sta    COLUPF                ;3  @68
    stx    PF1                   ;3  @71
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sty    GRP0                  ;3  @6
    sty    GRP1                  ;3  @9
    lda    ram_BE                ;3  @12
    and    #$0F                  ;2  @14
    tax                          ;2  @16
LB571:
    dex                          ;2
    bne    LB571                 ;2³
    sta    RESP0                 ;3
    sta    RESP1                 ;3
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sty    ENABL                 ;3  @6
    sty    ENAM0                 ;3  @9
    lda    ram_BD                ;3  @12
    and    #$0F                  ;2  @14
    tax                          ;2  @16
LB585:
    dex                          ;2
    bne    LB585                 ;2³
    sta    RESBL                 ;3
    lda    ram_BD                ;3
    sta    HMBL                  ;3
    sty    ENAM1                 ;3
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sty    PF1                   ;3  @6
    sty    PF2                   ;3  @9
    ldy    #$37                  ;2  @11
    lda    (ram_BF),Y            ;5  @16
    sta    CTRLPF                ;3  @19
    lda    (ram_C1),Y            ;5  @24
    sta    ENABL                 ;3  @27
    tsx                          ;2  @29
    stx    COLUPF                ;3  @32
    sta    HMCLR                 ;3  @35
    sta    HMBL                  ;3  @38
    lda    ram_BE                ;3  @41
    sta    HMP0                  ;3  @44
    sta    HMP1                  ;3  @47
    lda    ram_89                ;3  @50
    and    #$08                  ;2  @52
    sta    REFP0                 ;3  @55
    sta    REFP1                 ;3  @58
    dey                          ;2  @60
    nop                          ;2  @62
    lda    #$F4                  ;2  @64
    sta    COLUPF                ;3  @67
    sta    WSYNC                 ;3  @70
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    (ram_BF),Y            ;5  @8
    sta    CTRLPF                ;3  @11
    lda    (ram_C1),Y            ;5  @16
    sta    ENABL                 ;3  @19
    dey                          ;2  @21
    ldx    ram_9A                ;3  @24
    tsx                          ;2  @26
    stx    COLUPF                ;3  @29
    sta    HMCLR                 ;3  @32
    ldx    #$10                  ;2  @34
    stx    HMP1                  ;3  @37
    nop                          ;2  @39
    nop                          ;2  @41
    nop                          ;2  @43
    nop                          ;2  @45
LB5D9:
    sta.w  HMBL                  ;4  @48/49
    nop                          ;2  @50/51
    nop                          ;2  @52/53
    nop                          ;2  @54/55
    nop                          ;2  @56/57
    nop                          ;2  @58/59
    nop                          ;2  @60/61
    nop                          ;2  @62/63
    lda    #$F4                  ;2  @64/65
    sta    COLUPF                ;3  @67/68
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    nop                          ;2  @5
    nop                          ;2  @7
    nop                          ;2  @9
    nop                          ;2  @11
    lda    (ram_BF),Y            ;5  @16
    sta    CTRLPF                ;3  @19
    lda    (ram_C1),Y            ;5  @24
    sta    ENABL                 ;3  @27
    tsx                          ;2  @29
    stx    COLUPF                ;3  @32
    sta.w  HMCLR                 ;4  @36
    dey                          ;2  @38
    cpy    #$2B                  ;2  @40
    bne    LB5D9                 ;2³+1 @42/44
    nop                          ;2  @44
LB603:
    sta    HMBL                  ;3  @47
    lda    (ram_C7),Y            ;5  @52
    tax                          ;2  @54
    lda    (ram_BF),Y            ;5  @59
    sta.w  CTRLPF                ;4  @63
    lda    #$F4                  ;2  @65
    sta    COLUPF                ;3  @68
    lda    (ram_C3),Y            ;5  @73
    sta    GRP0                  ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    stx    COLUP0                ;3  @6
    lda    (ram_C5),Y            ;5  @11
    sta    GRP1                  ;3  @14
    lda    (ram_C9),Y            ;5  @19
    sta    COLUP1                ;3  @22
    lda    (ram_C1),Y            ;5  @27
    sta    ENABL                 ;3  @30
    tsx                          ;2  @32
    stx    COLUPF                ;3  @35
    sta.w  HMCLR                 ;4  @39
    dey                          ;2  @41
    bne    LB603                 ;2³ @43/44
    nop                          ;2  @45
    lda    #$20                  ;2  @47
    sta    HMBL                  ;3  @50
    lda    (ram_C3),Y            ;5  @55
    tax                          ;2  @57
    lda    #$35                  ;2  @59
    sta.w  CTRLPF                ;4  @63
    lda    #$F4                  ;2  @65
    sta    COLUPF                ;3  @68
    lda    (ram_C7),Y            ;5  @73
    sta    COLUP0                ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    COLUP1                ;3  @6
    stx    GRP0                  ;3  @9
    lda    #$D0                  ;2  @11
    sta    COLUBK                ;3  @14
    lda    (ram_C5),Y            ;5  @19
    sta    GRP1                  ;3  @22
    lda    (ram_C1),Y            ;5  @27
    sta    ENABL                 ;3  @30
    tsx                          ;2  @32
    stx    COLUPF                ;3  @35
    ldx    #$FF                  ;2  @37
    txs                          ;2  @39
    jsr    DelayCycles+3         ;23 @62
    lda    #$F4                  ;2  @64
    sta    COLUPF                ;3  @67
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
  IF NTSC
    lda    #$D2                  ;2  @5
    sta.w  COLUBK                ;4  @9
  ELSE
    lda    ram_ED                ; 3
    sta    COLUBK                ; 3
  ENDIF
    sty    PF0                   ;3  @12
    sty    GRP0                  ;3  @15
    sty    GRP1                  ;3  @18
    sty    CTRLPF                ;3  @21
    sta    RESBL                 ;3  @24
    sty    ENABL                 ;3  @27
    sty    REFP0                 ;3  @30
    sty    REFP1                 ;3  @33
    sta    HMCLR                 ;3  @36
    sta    RESP0                 ;3  @39
    lda    #$30                  ;2  @41
    sta    HMBL                  ;3  @44
    lda    #$20                  ;2  @46
    sta    HMP0                  ;3  @49
    lda    #$A0                  ;2  @51
    sta    HMP1                  ;3  @54
    nop                          ;2  @56
    nop                          ;2  @58
    nop                          ;2  @60
    sta    RESP1                 ;3  @63
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    jsr    DelayCycles+4         ;21 @24
    sta    HMCLR                 ;3  @27
    lda    #$70                  ;2  @29
    sta    HMBL                  ;3  @32
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    #$00                  ;2  @5
    sta    NUSIZ0                ;3  @8
    sta    NUSIZ1                ;3  @11
    
  IF NTSC
    ldy    #$04                  ;2  @13
    jsr    DelayCycles+10        ;12 @25
    sta    HMCLR                 ;3  @28
  ELSE
    jsr    DelayCycles+10        ;6
    ldy    #$06                  ;2
    sta    HMCLR                 ;3
    jsr    LB4EE                 ;6
    ldy    #$04                  ;2
  ENDIF
    
LB6AE:
    ldx    #$00                  ;2  @30..63
    stx    GRP0                  ;3  @33..66
    lda.wy ram_CB,Y              ;4  @37..70
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    stx    GRP1                  ;3  @6
    sta    PF1                   ;3  @9
    lda    ram_EC                ;3  @12
    sta    COLUPF                ;3  @15
    tya                          ;2  @17
    clc                          ;2  @19
    adc    #$05                  ;2  @21
    ldx    #$01                  ;2  @23
    cmp    ram_8E                ;3  @26
    bcs    LB6CD                 ;2³ @28/29
    stx    NUSIZ0                ;3  @31
LB6CD:
    cmp    ram_8F                ;3  @32/34
    bcs    LB6D3                 ;2³ @34..37
    stx    NUSIZ1                ;3  @37/39
LB6D3:
    lda.wy ram_D0,Y              ;4  @39..43
    sta    PF1                   ;3  @42..46
    lda    ram_ED                ;3  @45..49
    sta    COLUPF                ;3  @48..52
    ldx    #$18                  ;2  @50..54
    stx    COLUP0                ;3  @53..57
    lda.wy ram_CB,Y              ;4  @57..61
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    PF1                   ;3  @6
    lda    ram_EC                ;3  @9
    sta    COLUPF                ;3  @12
    stx    COLUP1                ;3  @15
    cpy    ram_8E                ;3  @18
    bcs    LB6F7                 ;2³ @20/21
    ldx    #$18                  ;2  @22
    bcc    LB6F9                 ;3  @25   always branch

LB6F7:
    ldx    #$00                  ;2  @23
LB6F9:
    stx    GRP0                  ;3  @26/28
    cpy    ram_8F                ;3  @29/31
    bcs    LB703                 ;2³+1 @31..35
    ldx    #$18                  ;2  @33/35
    bcc    LB705                 ;3  @36/38   always branch

LB703:
    ldx    #$00                  ;2  @35/37
LB705:
    stx    GRP1                  ;3  @38..41
    lda.wy ram_D0,Y              ;4  @42..45
    sta    PF1                   ;3  @45..48
    lda    ram_ED                ;3  @48..51
    sta    COLUPF                ;3  @51..54
    ldx    #$0C                  ;2  @53..56
    stx    COLUP0                ;3  @56..59
    lda.wy ram_CB,Y              ;4  @60..63
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    PF1                   ;3  @6
    lda    ram_EC                ;3  @9
    sta    COLUPF                ;3  @12
    stx    COLUP1                ;3  @15
    cpy    ram_8E                ;3  @18
    bcs    LB72B                 ;2³ @20/21
    ldx    #$FF                  ;2  @22
    bcc    LB72D                 ;3  @25   always branch

LB72B:
    ldx    #$00                  ;2  @23
LB72D:
    stx    GRP0                  ;3  @26/28
    cpy    ram_8F                ;3  @29/31
    bcs    LB737                 ;2³ @31..34
    ldx    #$FF                  ;2  @33/35
    bcc    LB739                 ;3  @36/38   always branch

LB737:
    ldx    #$00                  ;2  @34/36
LB739:
    stx    GRP1                  ;3  @37..41
    lda.wy ram_D0,Y              ;4  @41..45
    sta    PF1                   ;3  @44..48
    lda    ram_ED                ;3  @47..51
    sta    COLUPF                ;3  @50..54
    dey                          ;2  @52..56
    bmi    LB74A                 ;2³ @54..59
    jmp    LB6AE                 ;3  @57..61

LB74A:
    sta    WSYNC                 ;3  @76
;---------------------------------------
    iny                          ;2  @2
    sty    COLUPF                ;3  @5
    lda    #$30                  ;2  @7
    sta    CTRLPF                ;3  @10
    lda    #$02                  ;2  @12
    sta    ENABL                 ;3  @15
    sty    PF0                   ;3  @18
    sty    PF1                   ;3  @21
    sty    GRP0                  ;3  @24
    sty    GRP1                  ;3  @27
    
  IF !NTSC
    ldy    #$08                  ;2
    jsr    LB4EE                 ;6
  ENDIF
    
LB75F:
    lda    #>LF415               ;2
    sta    ram_99                ;3
    lda    #<LF415               ;2
    sta    ram_98                ;3
    jmp    LBFF0                 ;3

LB76A:
    lda    #$F0                  ;2  @9
    sta    HMP0                  ;3  @12
    sta    HMP1                  ;3  @15
    ldy    #$03                  ;2  @17
LB772:
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    #$F8                  ;2  @5
    sta    PF2                   ;3  @8
    ldx    #$00                  ;2  @10
    stx    GRP0                  ;3  @13
    stx    GRP1                  ;3  @16
    stx    REFP0                 ;3  @19
    stx    REFP1                 ;3  @22
    lda    #$07                  ;2  @24
    sta    NUSIZ0                ;3  @27
    sta    NUSIZ1                ;3  @30
    lda    #$08                  ;2  @32
    sta    COLUPF                ;3  @35
    ldx    ram_8B                ;3  @38
    lda    ram_EC,X              ;4  @42
    sta    COLUP0                ;3  @45
    sta    COLUP1                ;3  @48
    sta    HMCLR                 ;3  @51
    pha                          ;3  @54
    pla                          ;4  @58
    stx    COLUPF                ;3  @61
    dey                          ;2  @63
    bne    LB772                 ;2³ @65/66
    ldy    #$05                  ;2  @67
LB7A1:
    ldx    #$03                  ;2  @69/70
LB7A3:
    sta    WSYNC                 ;3  @76
;---------------------------------------
    lda.wy ram_CA,Y              ;4  @4
    sta    GRP0                  ;3  @7
    lda.wy ram_CF,Y              ;4  @11
    sta    GRP1                  ;3  @14
    jsr    DelayCycles+10        ;12 @26
    lda    #$08                  ;2  @28
    sta    COLUPF                ;3  @31
    jsr    DelayCycles+3         ;23 @54
    lda    #$00                  ;2  @56
    sta    COLUPF                ;3  @59
    dex                          ;2  @61
    bne    LB7A3                 ;2³ @63/64
    dey                          ;2  @65
    bne    LB7A1                 ;2³ @67/68
    ldy    #$02                  ;2  @69
LB7C5:
    sta    WSYNC                 ;3  @76
;---------------------------------------
    stx    GRP0                  ;3  @3
    stx    GRP1                  ;3  @6
    
  IF NTSC
    lda    #$C2                  ;2  @8
    sta    COLUBK                ;3  @11
  ENDIF
    
    jsr    DelayCycles+9         ;14 @25
    lda    #$08                  ;2  @27
    sta    COLUPF                ;3  @30
    jsr    DelayCycles+3         ;23 @53
    dey                          ;2  @55
    stx    COLUPF                ;3  @58
    bne    LB7C5                 ;2³ @60/61
    sta    WSYNC                 ;3  @76
;---------------------------------------
    lda    #$06                  ;2  @2
    sta    COLUBK                ;3  @5
    sty    PF2                   ;3  @8
    sta    WSYNC                 ;3  @76
    sta    WSYNC                 ;3
    sta    WSYNC                 ;3
;---------------------------------------
    lda    ram_E0                ;3  @3
    sta    TIM64T                ;4  @7
    sty    COLUBK                ;3  @10
    sty    PF0                   ;3  @13
    lda    ram_DB                ;3  @16
    bne    LB7FC                 ;2³ @18/19
    jmp    LB8D4                 ;3  @21

LB7FC:
    lda    #$08                  ;2  @21
    sta    REFP0                 ;3  @24
    sta    REFP1                 ;3  @27
    nop                          ;2  @29
    sta    RESP0                 ;3  @32
    sta    RESM0                 ;3  @35
    lda    #$0E                  ;2  @37
    sta    COLUP0                ;3  @40
    sta    COLUP1                ;3  @43
    nop                          ;2  @45
    sta    RESP1                 ;3  @48
    sta    RESM1                 ;3  @51
    sta    COLUPF                ;3  @54
    lda    #$F0                  ;2  @56
    sta    HMP0                  ;3  @59
    sta    HMP1                  ;3  @62
    sta    HMM0                  ;3  @65
    sta    HMM1                  ;3  @68
LB81E:
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    nop                          ;2  @5
    nop                          ;2  @7
    lda    ram_DE                ;3  @10
    tay                          ;2  @12
    and    #$0F                  ;2  @14
    tax                          ;2  @16
LB82A:
    dex                          ;2
    bne    LB82A                 ;2³
    sta    RESBL                 ;3
    sta    HMCLR                 ;3
    sty    HMBL                  ;3
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    ram_DF                ;3  @6
    beq    LB83F                 ;2³ @8/9
    ldy    #$06                  ;2  @10
    bne    LB84F                 ;3  @13   always branch

LB83F:
    lda    ram_A0                ;3  @12
    bne    LB846                 ;2³ @14/15
    jmp    LB8D4                 ;3  @17

LB846:
    sed                          ;2  @17
    cmp    #$08                  ;2  @19
    bcc    LB859                 ;2³ @21/22
    sbc    #$06                  ;2  @23
    tay                          ;2  @25
    cld                          ;2  @27
LB84F:
    lda    #>LB8A4               ;2  @15/29
    sta    ram_99                ;3  @18/32
    lda    #<LB8A4               ;2  @20/34
    sta    ram_98                ;3  @23/37
    bne    LB863                 ;3  @26/40   always branch

LB859:
    cld                          ;2  @24
    tay                          ;2  @26
    lda    #>LB899               ;2  @28
    sta    ram_99                ;3  @31
    lda    #<LB899               ;2  @33
    sta    ram_98                ;3  @36
LB863:
    ldx    #$04                  ;2  @28..42
    sta.w  HMCLR                 ;4  @32..46
LB868:
    lda    LBDD0,Y               ;4
    ora    LBDC8-1,X             ;4
    pha                          ;3
    lda    LBDD8,Y               ;4
    and    LBDCC-1,X             ;4
    pha                          ;3
    dex                          ;2
    bne    LB868                 ;2³
    ldy    #$04                  ;2
LB87B:
    lda    LBDC0-1,Y             ;4
    sta    HMBL                  ;3
    sta    HMM0                  ;3
    sta    HMM1                  ;3
    lda    LBDBC-1,Y             ;4
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    CTRLPF                ;3  @6
    lda    #$02                  ;2  @8
    sta    ENABL                 ;3  @11
    pla                          ;4  @15
    sta    GRP0                  ;3  @18
    sta    ENAM0                 ;3  @21
    jmp.ind ($0098)              ;5  @26

LB899:  ; indirect jump
    pla                          ;4  @30
    sta    NUSIZ0                ;3  @33
    ldx    #$00                  ;2  @35
    stx    GRP1                  ;3  @38
    stx    ENAM1                 ;3  @41
    beq    LB8B0                 ;3  @44   always branch

LB8A4:  ; indirect jump
    ldx    LBDC4-1,Y             ;4  @30
    stx    NUSIZ0                ;3  @33
    sta    GRP1                  ;3  @36
    sta    ENAM1                 ;3  @39
    pla                          ;4  @43
    sta    NUSIZ1                ;3  @46
LB8B0:
    dey                          ;2  @46/48
    bne    LB87B                 ;2³ @48..51
    sta    HMCLR                 ;3  @51/53
    lda    #$10                  ;2  @53/55
    sta    HMM0                  ;3  @56/58
    sta    HMM1                  ;3  @59/61
    sta    WSYNC                 ;3  @76
;---------------------------------------
    sty    ENABL                 ;3  @3
    sty    GRP0                  ;3  @6
    sty    ENAM0                 ;3  @9
    sty    GRP1                  ;3  @12
    sty    ENAM1                 ;3  @15
    dec    ram_DF                ;5  @20
    bmi    LB8D4                 ;2³ @22/23
    bne    LB8D1                 ;2³ @24/25
    lda    ram_A0                ;3  @27
    beq    LB8D4                 ;2³ @29/30
LB8D1:
    jmp    LB81E                 ;3  @28/32

LB8D4:
    sta    WSYNC                 ;3  @26/33
;---------------------------------------
LB8D6:
    ldx    INTIM                 ; 4
    bne    LB8D6                 ; 2³
    jmp    LB75F                 ; 3

  IF NTSC
    
    .byte $43 ; | X    XX| $B8DE
    .byte $48 ; | X  X   | $B8DF
    .byte $52 ; | X X  X | $B8E0
    .byte $49 ; | X  X  X| $B8E1
    .byte $53 ; | X X  XX| $B8E2
    .byte $54 ; | X X X  | $B8E3
    .byte $4F ; | X  XXXX| $B8E4
    .byte $50 ; | X X    | $B8E5
    .byte $48 ; | X  X   | $B8E6
    .byte $45 ; | X   X X| $B8E7
    .byte $52 ; | X X  X | $B8E8
    .byte $20 ; |  X     | $B8E9
    .byte $48 ; | X  X   | $B8EA
    .byte $2E ; |  X XXX | $B8EB
    .byte $20 ; |  X     | $B8EC
    .byte $4F ; | X  XXXX| $B8ED
    .byte $4D ; | X  XX X| $B8EE
    .byte $41 ; | X     X| $B8EF
    .byte $52 ; | X X  X | $B8F0
    .byte $5A ; | X XX X | $B8F1
    .byte $55 ; | X X X X| $B8F2
    
  ENDIF
    
    .byte $00 ; |        | $B8F3
    .byte $00 ; |        | $B8F4
    .byte $00 ; |        | $B8F5
    .byte $00 ; |        | $B8F6
    .byte $00 ; |        | $B8F7
    .byte $00 ; |        | $B8F8
    .byte $00 ; |        | $B8F9
    .byte $00 ; |        | $B8FA
    .byte $00 ; |        | $B8FB
    .byte $00 ; |        | $B8FC
    .byte $00 ; |        | $B8FD
    .byte $00 ; |        | $B8FE
    .byte $00 ; |        | $B8FF
    
       ORG $0900
      RORG $B900
    
LB900:
    .byte $00 ; |        | $B900
    .byte $00 ; |        | $B901
    .byte $F0 ; |XXXX    | $B902
    .byte $C0 ; |XX      | $B903
    .byte $D0 ; |XX X    | $B904
    .byte $F0 ; |XXXX    | $B905
    .byte $00 ; |        | $B906
    .byte $F0 ; |XXXX    | $B907
    .byte $C0 ; |XX      | $B908
    .byte $E0 ; |XXX     | $B909
    .byte $C0 ; |XX      | $B90A
    .byte $80 ; |X       | $B90B
    .byte $00 ; |        | $B90C
    .byte $C0 ; |XX      | $B90D
    .byte $60 ; | XX     | $B90E
    .byte $C0 ; |XX      | $B90F
    .byte $D0 ; |XX X    | $B910
    .byte $00 ; |        | $B911
    .byte $C0 ; |XX      | $B912
    .byte $60 ; | XX     | $B913
    .byte $E0 ; |XXX     | $B914
    .byte $D0 ; |XX X    | $B915
    .byte $F0 ; |XXXX    | $B916
    .byte $C0 ; |XX      | $B917
    .byte $C0 ; |XX      | $B918
    .byte $60 ; | XX     | $B919
    .byte $C0 ; |XX      | $B91A
    .byte $F0 ; |XXXX    | $B91B
    .byte $C0 ; |XX      | $B91C
    .byte $40 ; | X      | $B91D
    .byte $C0 ; |XX      | $B91E
    .byte $C0 ; |XX      | $B91F
    .byte $00 ; |        | $B920
    .byte $D0 ; |XX X    | $B921
    .byte $50 ; | X X    | $B922
    .byte $00 ; |        | $B923
    .byte $C0 ; |XX      | $B924
    .byte $F0 ; |XXXX    | $B925
    .byte $D0 ; |XX X    | $B926
    .byte $60 ; | XX     | $B927
    .byte $60 ; | XX     | $B928
    .byte $C0 ; |XX      | $B929
    .byte $F0 ; |XXXX    | $B92A
    .byte $40 ; | X      | $B92B
    .byte $60 ; | XX     | $B92C
    .byte $70 ; | XXX    | $B92D
    .byte $F0 ; |XXXX    | $B92E
    .byte $00 ; |        | $B92F
    .byte $00 ; |        | $B930
    .byte $A0 ; |X X     | $B931
    .byte $60 ; | XX     | $B932
    .byte $B0 ; |X XX    | $B933
    .byte $00 ; |        | $B934
    .byte $40 ; | X      | $B935
    .byte $A0 ; |X X     | $B936
    .byte $E0 ; |XXX     | $B937
    .byte $B0 ; |X XX    | $B938
    .byte $F0 ; |XXXX    | $B939
    .byte $F0 ; |XXXX    | $B93A
    .byte $80 ; |X       | $B93B
    .byte $A0 ; |X X     | $B93C
    .byte $80 ; |X       | $B93D
    .byte $F0 ; |XXXX    | $B93E
    .byte $F0 ; |XXXX    | $B93F
    .byte $B0 ; |X XX    | $B940
    .byte $A0 ; |X X     | $B941
    .byte $80 ; |X       | $B942
    .byte $00 ; |        | $B943
    .byte $00 ; |        | $B944
    .byte $F0 ; |XXXX    | $B945
    .byte $90 ; |X  X    | $B946
LB947:
    .byte $00 ; |        | $B947
    .byte $C0 ; |XX      | $B948
    .byte $90 ; |X  X    | $B949
    .byte $E0 ; |XXX     | $B94A
    .byte $50 ; | X X    | $B94B
    .byte $F0 ; |XXXX    | $B94C
    .byte $C0 ; |XX      | $B94D
    .byte $90 ; |X  X    | $B94E
    .byte $E0 ; |XXX     | $B94F
    .byte $40 ; | X      | $B950
    .byte $E0 ; |XXX     | $B951
    .byte $C0 ; |XX      | $B952
    .byte $90 ; |X  X    | $B953
    .byte $E0 ; |XXX     | $B954
    .byte $60 ; | XX     | $B955
    .byte $E0 ; |XXX     | $B956
    .byte $A0 ; |X X     | $B957
    .byte $C0 ; |XX      | $B958
    .byte $60 ; | XX     | $B959
    .byte $E0 ; |XXX     | $B95A
    .byte $E0 ; |XXX     | $B95B
    .byte $80 ; |X       | $B95C
    .byte $C0 ; |XX      | $B95D
    .byte $60 ; | XX     | $B95E
    .byte $E0 ; |XXX     | $B95F
    .byte $E0 ; |XXX     | $B960
    .byte $C0 ; |XX      | $B961
    .byte $40 ; | X      | $B962
    .byte $60 ; | XX     | $B963
    .byte $80 ; |X       | $B964
    .byte $C0 ; |XX      | $B965
    .byte $D0 ; |XX X    | $B966
    .byte $D0 ; |XX X    | $B967
    .byte $60 ; | XX     | $B968
    .byte $40 ; | X      | $B969
    .byte $00 ; |        | $B96A
    .byte $C0 ; |XX      | $B96B
    .byte $D0 ; |XX X    | $B96C
    .byte $60 ; | XX     | $B96D
    .byte $70 ; | XXX    | $B96E
    .byte $70 ; | XXX    | $B96F
    .byte $40 ; | X      | $B970
    .byte $40 ; | X      | $B971
    .byte $70 ; | XXX    | $B972
    .byte $70 ; | XXX    | $B973
    .byte $70 ; | XXX    | $B974
    .byte $40 ; | X      | $B975
    .byte $00 ; |        | $B976
    .byte $D0 ; |XX X    | $B977
    .byte $60 ; | XX     | $B978
    .byte $40 ; | X      | $B979
    .byte $C0 ; |XX      | $B97A
    .byte $30 ; |  XX    | $B97B
    .byte $80 ; |X       | $B97C
    .byte $E0 ; |XXX     | $B97D
    .byte $C0 ; |XX      | $B97E
    .byte $C0 ; |XX      | $B97F
    .byte $F0 ; |XXXX    | $B980
    .byte $80 ; |X       | $B981
    .byte $A0 ; |X X     | $B982
    .byte $A0 ; |X X     | $B983
    .byte $F0 ; |XXXX    | $B984
    .byte $C0 ; |XX      | $B985
    .byte $80 ; |X       | $B986
    .byte $A0 ; |X X     | $B987
    .byte $A0 ; |X X     | $B988
    .byte $C0 ; |XX      | $B989
    .byte $C0 ; |XX      | $B98A
    .byte $80 ; |X       | $B98B
    .byte $90 ; |X  X    | $B98C
    .byte $A0 ; |X X     | $B98D
    .byte $00 ; |        | $B98E
LB98F:
    .byte $D0 ; |XX X    | $B98F
    .byte $D0 ; |XX X    | $B990
    .byte $D0 ; |XX X    | $B991
    .byte $D0 ; |XX X    | $B992
    .byte $00 ; |        | $B993
    .byte $D0 ; |XX X    | $B994
    .byte $E0 ; |XXX     | $B995
    .byte $E0 ; |XXX     | $B996
    .byte $50 ; | X X    | $B997
    .byte $00 ; |        | $B998
    .byte $D0 ; |XX X    | $B999
    .byte $E0 ; |XXX     | $B99A
    .byte $60 ; | XX     | $B99B
    .byte $60 ; | XX     | $B99C
    .byte $00 ; |        | $B99D
    .byte $C0 ; |XX      | $B99E
    .byte $C0 ; |XX      | $B99F
    .byte $60 ; | XX     | $B9A0
    .byte $40 ; | X      | $B9A1
    .byte $00 ; |        | $B9A2
    .byte $C0 ; |XX      | $B9A3
    .byte $E0 ; |XXX     | $B9A4
    .byte $60 ; | XX     | $B9A5
    .byte $60 ; | XX     | $B9A6
    .byte $00 ; |        | $B9A7
    .byte $30 ; |  XX    | $B9A8
    .byte $40 ; | X      | $B9A9
    .byte $60 ; | XX     | $B9AA
    .byte $60 ; | XX     | $B9AB
    .byte $00 ; |        | $B9AC
    .byte $30 ; |  XX    | $B9AD
    .byte $40 ; | X      | $B9AE
    .byte $60 ; | XX     | $B9AF
    .byte $E0 ; |XXX     | $B9B0
    .byte $00 ; |        | $B9B1
    .byte $70 ; | XXX    | $B9B2
    .byte $50 ; | X X    | $B9B3
    .byte $50 ; | X X    | $B9B4
    .byte $90 ; |X  X    | $B9B5
    .byte $00 ; |        | $B9B6
    .byte $60 ; | XX     | $B9B7
    .byte $C0 ; |XX      | $B9B8
    .byte $C0 ; |XX      | $B9B9
    .byte $C0 ; |XX      | $B9BA
    .byte $00 ; |        | $B9BB
    .byte $C0 ; |XX      | $B9BC
    .byte $C0 ; |XX      | $B9BD
    .byte $D0 ; |XX X    | $B9BE
    .byte $A0 ; |X X     | $B9BF
    .byte $00 ; |        | $B9C0
    .byte $C0 ; |XX      | $B9C1
    .byte $80 ; |X       | $B9C2
    .byte $90 ; |X  X    | $B9C3
    .byte $80 ; |X       | $B9C4
    .byte $00 ; |        | $B9C5
    .byte $C0 ; |XX      | $B9C6
    .byte $80 ; |X       | $B9C7
    .byte $80 ; |X       | $B9C8
    .byte $A0 ; |X X     | $B9C9
    .byte $00 ; |        | $B9CA
    .byte $C0 ; |XX      | $B9CB
    .byte $B0 ; |X XX    | $B9CC
    .byte $A0 ; |X X     | $B9CD
    .byte $A0 ; |X X     | $B9CE
    .byte $00 ; |        | $B9CF
    .byte $D0 ; |XX X    | $B9D0
    .byte $D0 ; |XX X    | $B9D1
    .byte $C0 ; |XX      | $B9D2
    .byte $E0 ; |XXX     | $B9D3

LB9D4:  ; indirect jump
    lda    (ram_B6),Y            ; 5
LB9D6:
    asl                          ; 2
    dex                          ; 2
    bne    LB9D6                 ; 2³
    bcs    LB9E0                 ; 2³
    inc    ram_A8                ; 5
    bcc    LB9E2                 ; 3   always branch

LB9E0:
    dec    ram_A8                ; 5
LB9E2:
    lda    #>LFC33               ; 2
    sta    ram_99                ; 3
    lda    #<LFC33               ; 2
    sta    ram_98                ; 3
    jmp    LBFF0                 ; 3

RoofPatEggSign:
    .byte $FF ; |XXXXXXXX| $B9ED   PF0
    .byte $FF ; |XXXXXXXX| $B9EE
    .byte $E0 ; |XXX     | $B9EF
    .byte $E0 ; |XXX     | $B9F0
    .byte $C0 ; |XX      | $B9F1
    .byte $C0 ; |XX      | $B9F2
    .byte $80 ; |X       | $B9F3
    .byte $80 ; |X       | $B9F4
    .byte $FF ; |XXXXXXXX| $B9F5   PF1
    .byte $FF ; |XXXXXXXX| $B9F6
    .byte $7F ; | XXXXXXX| $B9F7
    .byte $7F ; | XXXXXXX| $B9F8
    .byte $3F ; |  XXXXXX| $B9F9
    .byte $3F ; |  XXXXXX| $B9FA
    .byte $1F ; |   XXXXX| $B9FB
    .byte $1F ; |   XXXXX| $B9FC
    .byte $0F ; |    XXXX| $B9FD
    .byte $0F ; |    XXXX| $B9FE

    .byte $00 ; |        | $B9FF   free byte

       ORG $0A00
      RORG $BA00

LBA00:
    .byte $C0 ; |XX      | $BA00
    .byte $80 ; |X       | $BA01
    .byte $30 ; |  XX    | $BA02
    .byte $C0 ; |XX      | $BA03
    .byte $80 ; |X       | $BA04
    .byte $30 ; |  XX    | $BA05
    .byte $00 ; |        | $BA06
    .byte $80 ; |X       | $BA07
    .byte $38 ; |  XXX   | $BA08
    .byte $00 ; |        | $BA09
    .byte $80 ; |X       | $BA0A
    .byte $38 ; |  XXX   | $BA0B
    .byte $C0 ; |XX      | $BA0C
    .byte $80 ; |X       | $BA0D
    .byte $B8 ; |X XXX   | $BA0E
    .byte $C0 ; |XX      | $BA0F
    .byte $80 ; |X       | $BA10
    .byte $B8 ; |X XXX   | $BA11
    .byte $00 ; |        | $BA12
    .byte $80 ; |X       | $BA13
    .byte $38 ; |  XXX   | $BA14
    .byte $00 ; |        | $BA15
    .byte $80 ; |X       | $BA16
    .byte $78 ; | XXXX   | $BA17
    .byte $C0 ; |XX      | $BA18
    .byte $80 ; |X       | $BA19
    .byte $68 ; | XX X   | $BA1A
    .byte $C0 ; |XX      | $BA1B
    .byte $40 ; | X      | $BA1C
    .byte $68 ; | XX X   | $BA1D
    .byte $00 ; |        | $BA1E
    .byte $40 ; | X      | $BA1F
    .byte $78 ; | XXXX   | $BA20
    .byte $00 ; |        | $BA21
    .byte $40 ; | X      | $BA22
    .byte $B8 ; |X XXX   | $BA23
    .byte $C0 ; |XX      | $BA24
    .byte $40 ; | X      | $BA25
    .byte $88 ; |X   X   | $BA26
    .byte $C0 ; |XX      | $BA27
    .byte $40 ; | X      | $BA28
    .byte $88 ; |X   X   | $BA29
    .byte $00 ; |        | $BA2A
    .byte $40 ; | X      | $BA2B
    .byte $48 ; | X  X   | $BA2C
    .byte $00 ; |        | $BA2D
    .byte $80 ; |X       | $BA2E
    .byte $48 ; | X  X   | $BA2F
    .byte $C0 ; |XX      | $BA30
    .byte $80 ; |X       | $BA31
    .byte $40 ; | X      | $BA32
    .byte $C0 ; |XX      | $BA33
    .byte $80 ; |X       | $BA34
    .byte $C0 ; |XX      | $BA35
    .byte $00 ; |        | $BA36
    .byte $80 ; |X       | $BA37
    .byte $C0 ; |XX      | $BA38
    .byte $00 ; |        | $BA39
    .byte $80 ; |X       | $BA3A
    .byte $C0 ; |XX      | $BA3B
    .byte $C0 ; |XX      | $BA3C
    .byte $80 ; |X       | $BA3D
    .byte $80 ; |X       | $BA3E
    .byte $C0 ; |XX      | $BA3F
    .byte $80 ; |X       | $BA40
    .byte $80 ; |X       | $BA41
    .byte $00 ; |        | $BA42
    .byte $80 ; |X       | $BA43
    .byte $80 ; |X       | $BA44
    .byte $00 ; |        | $BA45
    .byte $80 ; |X       | $BA46
LBA47:
    .byte $80 ; |X       | $BA47
    .byte $30 ; |  XX    | $BA48
    .byte $B8 ; |X XXX   | $BA49
    .byte $98 ; |X  XX   | $BA4A
    .byte $30 ; |  XX    | $BA4B
    .byte $B8 ; |X XXX   | $BA4C
    .byte $98 ; |X  XX   | $BA4D
    .byte $30 ; |  XX    | $BA4E
    .byte $B8 ; |X XXX   | $BA4F
    .byte $88 ; |X   X   | $BA50
    .byte $30 ; |  XX    | $BA51
    .byte $88 ; |X   X   | $BA52
    .byte $88 ; |X   X   | $BA53
    .byte $30 ; |  XX    | $BA54
    .byte $88 ; |X   X   | $BA55
    .byte $A0 ; |X X     | $BA56
    .byte $B0 ; |X XX    | $BA57
    .byte $88 ; |X   X   | $BA58
    .byte $A0 ; |X X     | $BA59
    .byte $30 ; |  XX    | $BA5A
    .byte $88 ; |X   X   | $BA5B
    .byte $A0 ; |X X     | $BA5C
    .byte $70 ; | XXX    | $BA5D
    .byte $88 ; |X   X   | $BA5E
    .byte $20 ; |  X     | $BA5F
    .byte $78 ; | XXXX   | $BA60
    .byte $88 ; |X   X   | $BA61
    .byte $60 ; | XX     | $BA62
    .byte $68 ; | XX X   | $BA63
    .byte $88 ; |X   X   | $BA64
    .byte $20 ; |  X     | $BA65
    .byte $78 ; | XXXX   | $BA66
    .byte $88 ; |X   X   | $BA67
    .byte $A8 ; |X X X   | $BA68
    .byte $B8 ; |X XXX   | $BA69
    .byte $A8 ; |X X X   | $BA6A
    .byte $F8 ; |XXXXX   | $BA6B
    .byte $88 ; |X   X   | $BA6C
    .byte $B8 ; |X XXX   | $BA6D
    .byte $D0 ; |XX X    | $BA6E
    .byte $80 ; |X       | $BA6F
    .byte $98 ; |X  XX   | $BA70
    .byte $D0 ; |XX X    | $BA71
    .byte $40 ; | X      | $BA72
    .byte $98 ; |X  XX   | $BA73
    .byte $D8 ; |XX XX   | $BA74
    .byte $48 ; | X  X   | $BA75
    .byte $C0 ; |XX      | $BA76
    .byte $D8 ; |XX XX   | $BA77
    .byte $48 ; | X  X   | $BA78
    .byte $70 ; | XXX    | $BA79
    .byte $18 ; |   XX   | $BA7A
    .byte $C8 ; |XX  X   | $BA7B
    .byte $30 ; |  XX    | $BA7C
    .byte $18 ; |   XX   | $BA7D
    .byte $C8 ; |XX  X   | $BA7E
    .byte $38 ; |  XXX   | $BA7F
    .byte $98 ; |X  XX   | $BA80
    .byte $C8 ; |XX  X   | $BA81
    .byte $A8 ; |X X X   | $BA82
    .byte $98 ; |X  XX   | $BA83
    .byte $80 ; |X       | $BA84
    .byte $A0 ; |X X     | $BA85
    .byte $90 ; |X  X    | $BA86
    .byte $80 ; |X       | $BA87
    .byte $20 ; |  X     | $BA88
    .byte $C0 ; |XX      | $BA89
    .byte $80 ; |X       | $BA8A
    .byte $20 ; |  X     | $BA8B
    .byte $C0 ; |XX      | $BA8C
    .byte $80 ; |X       | $BA8D
    .byte $20 ; |  X     | $BA8E
    .byte $C0 ; |XX      | $BA8F
LBA90:
    .byte $88 ; |X   X   | $BA90
    .byte $30 ; |  XX    | $BA91
    .byte $00 ; |        | $BA92
    .byte $88 ; |X   X   | $BA93
    .byte $30 ; |  XX    | $BA94
    .byte $00 ; |        | $BA95
    .byte $88 ; |X   X   | $BA96
    .byte $30 ; |  XX    | $BA97
    .byte $00 ; |        | $BA98
    .byte $88 ; |X   X   | $BA99
    .byte $30 ; |  XX    | $BA9A
    .byte $00 ; |        | $BA9B
    .byte $88 ; |X   X   | $BA9C
    .byte $30 ; |  XX    | $BA9D
    .byte $00 ; |        | $BA9E
    .byte $08 ; |    X   | $BA9F
    .byte $30 ; |  XX    | $BAA0
    .byte $00 ; |        | $BAA1
    .byte $48 ; | X  X   | $BAA2
    .byte $30 ; |  XX    | $BAA3
    .byte $00 ; |        | $BAA4
    .byte $48 ; | X  X   | $BAA5
    .byte $30 ; |  XX    | $BAA6
    .byte $00 ; |        | $BAA7
    .byte $48 ; | X  X   | $BAA8
    .byte $58 ; | X XX   | $BAA9
    .byte $00 ; |        | $BAAA
    .byte $78 ; | XXXX   | $BAAB
    .byte $58 ; | X XX   | $BAAC
    .byte $00 ; |        | $BAAD
    .byte $78 ; | XXXX   | $BAAE
    .byte $58 ; | X XX   | $BAAF
    .byte $00 ; |        | $BAB0
    .byte $F0 ; |XXXX    | $BAB1
    .byte $08 ; |    X   | $BAB2
    .byte $00 ; |        | $BAB3
    .byte $D0 ; |XX X    | $BAB4
    .byte $98 ; |X  XX   | $BAB5
    .byte $00 ; |        | $BAB6
    .byte $D0 ; |XX X    | $BAB7
    .byte $98 ; |X  XX   | $BAB8
    .byte $00 ; |        | $BAB9
    .byte $98 ; |X  XX   | $BABA
    .byte $58 ; | X XX   | $BABB
    .byte $00 ; |        | $BABC
    .byte $98 ; |X  XX   | $BABD
    .byte $58 ; | X XX   | $BABE
    .byte $00 ; |        | $BABF
    .byte $98 ; |X  XX   | $BAC0
    .byte $D8 ; |XX XX   | $BAC1
    .byte $00 ; |        | $BAC2
    .byte $98 ; |X  XX   | $BAC3
    .byte $C8 ; |XX  X   | $BAC4
    .byte $00 ; |        | $BAC5
    .byte $98 ; |X  XX   | $BAC6
    .byte $88 ; |X   X   | $BAC7
    .byte $00 ; |        | $BAC8
    .byte $98 ; |X  XX   | $BAC9
    .byte $90 ; |X  X    | $BACA
    .byte $00 ; |        | $BACB
    .byte $80 ; |X       | $BACC
    .byte $90 ; |X  X    | $BACD
    .byte $00 ; |        | $BACE
    .byte $80 ; |X       | $BACF
    .byte $90 ; |X  X    | $BAD0
    .byte $00 ; |        | $BAD1
    .byte $C0 ; |XX      | $BAD2
    .byte $B0 ; |X XX    | $BAD3
    .byte $00 ; |        | $BAD4
    .byte $C0 ; |XX      | $BAD5
    .byte $B0 ; |X XX    | $BAD6
    
  IF NTSC
    
LBAD7:
    .byte $D2 ; |XX X  X | $BAD7
    .byte $D2 ; |XX X  X | $BAD8
    .byte $D2 ; |XX X  X | $BAD9
    .byte $D2 ; |XX X  X | $BADA
    .byte $D0 ; |XX X    | $BADB
ColRoofEggSign:
    .byte $04   ; $BADC  COLUPF
    .byte $04   ; $BADD
    .byte $06   ; $BADE
    .byte $04   ; $BADF
    .byte $06   ; $BAE0
    .byte $04   ; $BAE1
    .byte $06   ; $BAE2
    .byte $04   ; $BAE3
    .byte $06   ; $BAE4
    .byte $04   ; $BAE5
    .byte $06   ; $BAE6
    .byte $04   ; $BAE7
    .byte $06   ; $BAE8
    .byte $08   ; $BAE9
    .byte $06   ; $BAEA
    .byte $08   ; $BAEB
    .byte $06   ; $BAEC
    .byte $18   ; $BAED
ColSkyEggSign:
    .byte $06   ; $BAEE  COLUBK
    .byte $FF   ; $BAEF
    .byte $82   ; $BAF0
    .byte $84   ; $BAF1
    .byte $84   ; $BAF2
    .byte $86   ; $BAF3
    .byte $86   ; $BAF4
    .byte $88   ; $BAF5
    .byte $88   ; $BAF6
    .byte $88   ; $BAF7
    .byte $88   ; $BAF8
    .byte $88   ; $BAF9
    .byte $8A   ; $BAFA
    .byte $8A   ; $BAFB
    .byte $8A   ; $BAFC
    .byte $8A   ; $BAFD
    .byte $8A   ; $BAFE
    .byte $8A   ; $BAFF
    
  ELSE
  
LBAD7:
    .byte $24   ; $BAD7
    .byte $24   ; $BAD8
    .byte $24   ; $BAD9
    .byte $24   ; $BADA
    .byte $24   ; $BADB
ColRoofEggSign:
    .byte $04   ; $BADC
    .byte $04   ; $BADD
    .byte $06   ; $BADE
    .byte $04   ; $BADF
    .byte $06   ; $BAE0
    .byte $04   ; $BAE1
    .byte $06   ; $BAE2
    .byte $04   ; $BAE3
    .byte $06   ; $BAE4
    .byte $04   ; $BAE5
    .byte $06   ; $BAE6
    .byte $04   ; $BAE7
    .byte $06   ; $BAE8
    .byte $08   ; $BAE9
    .byte $06   ; $BAEA
    .byte $08   ; $BAEB
    .byte $06   ; $BAEC
    .byte $18   ; $BAED
    
    .byte $00   ; $BAEE
    .byte $00   ; $BAEF
    .byte $00   ; $BAF0
    .byte $00   ; $BAF1
    .byte $00   ; $BAF2
    .byte $00   ; $BAF3
    .byte $00   ; $BAF4
    .byte $00   ; $BAF5
    .byte $00   ; $BAF6
    .byte $00   ; $BAF7
    .byte $00   ; $BAF8
    .byte $00   ; $BAF9
    .byte $00   ; $BAFA
    .byte $00   ; $BAFB
    .byte $00   ; $BAFC
    .byte $00   ; $BAFD
    .byte $00   ; $BAFE
    .byte $00   ; $BAFF

  ENDIF

       ORG $0B00
      RORG $BB00

BigBirdStanding_A:
    .byte $1E ; |   XXXX | $BB00
    .byte $1E ; |   XXXX | $BB01
    .byte $0E ; |    XXX | $BB02
    .byte $06 ; |     XX | $BB03
    .byte $06 ; |     XX | $BB04
    .byte $06 ; |     XX | $BB05
    .byte $06 ; |     XX | $BB06
    .byte $06 ; |     XX | $BB07
    .byte $06 ; |     XX | $BB08
    .byte $06 ; |     XX | $BB09
    .byte $06 ; |     XX | $BB0A
    .byte $06 ; |     XX | $BB0B
    .byte $37 ; |  XX XXX| $BB0C
    .byte $6F ; | XX XXXX| $BB0D
    .byte $7F ; | XXXXXXX| $BB0E
    .byte $7F ; | XXXXXXX| $BB0F
    .byte $7F ; | XXXXXXX| $BB10
    .byte $7E ; | XXXXXX | $BB11
    .byte $7D ; | XXXXX X| $BB12
    .byte $3F ; |  XXXXXX| $BB13
    .byte $1F ; |   XXXXX| $BB14
    .byte $1F ; |   XXXXX| $BB15
    .byte $0F ; |    XXXX| $BB16
    .byte $0E ; |    XXX | $BB17
    .byte $07 ; |     XXX| $BB18
    .byte $07 ; |     XXX| $BB19
    .byte $03 ; |      XX| $BB1A
    .byte $03 ; |      XX| $BB1B
    .byte $01 ; |       X| $BB1C
    .byte $01 ; |       X| $BB1D
    .byte $01 ; |       X| $BB1E
    .byte $03 ; |      XX| $BB1F
    .byte $07 ; |     XXX| $BB20
    .byte $07 ; |     XXX| $BB21
    .byte $07 ; |     XXX| $BB22
    .byte $07 ; |     XXX| $BB23
    .byte $07 ; |     XXX| $BB24
    .byte $03 ; |      XX| $BB25
    .byte $03 ; |      XX| $BB26
    .byte $01 ; |       X| $BB27
    .byte $07 ; |     XXX| $BB28
    .byte $0A ; |    X X | $BB29
    .byte $0D ; |    XX X| $BB2A
    .byte $0F ; |    XXXX| $BB2B
BigBirdStanding_B:
    .byte $F8 ; |XXXXX   | $BB2C
    .byte $F8 ; |XXXXX   | $BB2D
    .byte $E0 ; |XXX     | $BB2E
    .byte $C0 ; |XX      | $BB2F
    .byte $C0 ; |XX      | $BB30
    .byte $C0 ; |XX      | $BB31
    .byte $C0 ; |XX      | $BB32
    .byte $C0 ; |XX      | $BB33
    .byte $C0 ; |XX      | $BB34
    .byte $C0 ; |XX      | $BB35
    .byte $C0 ; |XX      | $BB36
    .byte $C0 ; |XX      | $BB37
    .byte $C0 ; |XX      | $BB38
    .byte $E0 ; |XXX     | $BB39
    .byte $E0 ; |XXX     | $BB3A
    .byte $F0 ; |XXXX    | $BB3B
    .byte $F0 ; |XXXX    | $BB3C
    .byte $F0 ; |XXXX    | $BB3D
    .byte $70 ; | XXX    | $BB3E
    .byte $B8 ; |X XXX   | $BB3F
    .byte $F8 ; |XXXXX   | $BB40
    .byte $BC ; |X XXXX  | $BB41
    .byte $74 ; | XXX X  | $BB42
    .byte $EE ; |XXX XXX | $BB43
    .byte $FE ; |XXXXXXX | $BB44
    .byte $E6 ; |XXX  XX | $BB45
    .byte $C2 ; |XX    X | $BB46
    .byte $C0 ; |XX      | $BB47
    .byte $C0 ; |XX      | $BB48
    .byte $80 ; |X       | $BB49
    .byte $80 ; |X       | $BB4A
    .byte $80 ; |X       | $BB4B
    .byte $C0 ; |XX      | $BB4C
    .byte $F0 ; |XXXX    | $BB4D
    .byte $C0 ; |XX      | $BB4E
    .byte $F8 ; |XXXXX   | $BB4F
    .byte $C0 ; |XX      | $BB50
    .byte $C0 ; |XX      | $BB51
    .byte $C0 ; |XX      | $BB52
    .byte $80 ; |X       | $BB53
    .byte $C0 ; |XX      | $BB54
    .byte $A0 ; |X X     | $BB55
    .byte $60 ; | XX     | $BB56
    .byte $E0 ; |XXX     | $BB57
    
  IF NTSC
    
ColBigBirdStanding_A:
    .byte $36   ; $BB58
    .byte $36   ; $BB59
    .byte $36   ; $BB5A
    .byte $56   ; $BB5B
    .byte $36   ; $BB5C
    .byte $36   ; $BB5D
    .byte $56   ; $BB5E
    .byte $36   ; $BB5F
    .byte $36   ; $BB60
    .byte $56   ; $BB61
    .byte $36   ; $BB62
    .byte $36   ; $BB63
    .byte $18   ; $BB64
    .byte $1A   ; $BB65
    .byte $1A   ; $BB66
    .byte $1A   ; $BB67
    .byte $1A   ; $BB68
    .byte $1A   ; $BB69
    .byte $1A   ; $BB6A
    .byte $1A   ; $BB6B
    .byte $1A   ; $BB6C
    .byte $1A   ; $BB6D
    .byte $1A   ; $BB6E
    .byte $1A   ; $BB6F
    .byte $1A   ; $BB70
    .byte $1A   ; $BB71
    .byte $1A   ; $BB72
    .byte $1A   ; $BB73
    .byte $1A   ; $BB74
    .byte $18   ; $BB75
    .byte $18   ; $BB76
    .byte $1A   ; $BB77
    .byte $1A   ; $BB78
    .byte $1A   ; $BB79
    .byte $1A   ; $BB7A
    .byte $1A   ; $BB7B
    .byte $1A   ; $BB7C
    .byte $1A   ; $BB7D
    .byte $18   ; $BB7E
    .byte $18   ; $BB7F
    .byte $D2   ; $BB80
    .byte $D8   ; $BB81
    .byte $D8   ; $BB82
    .byte $D2   ; $BB83
ColBigBirdStanding_B:
    .byte $36   ; $BB84
    .byte $36   ; $BB85
    .byte $36   ; $BB86
    .byte $56   ; $BB87
    .byte $36   ; $BB88
    .byte $36   ; $BB89
    .byte $56   ; $BB8A
    .byte $36   ; $BB8B
    .byte $36   ; $BB8C
    .byte $56   ; $BB8D
    .byte $36   ; $BB8E
    .byte $36   ; $BB8F
    .byte $18   ; $BB90
    .byte $1A   ; $BB91
    .byte $1A   ; $BB92
    .byte $1A   ; $BB93
    .byte $1A   ; $BB94
    .byte $1A   ; $BB95
    .byte $1A   ; $BB96
    .byte $1A   ; $BB97
    .byte $1A   ; $BB98
    .byte $1A   ; $BB99
    .byte $1A   ; $BB9A
    .byte $1A   ; $BB9B
    .byte $1A   ; $BB9C
    .byte $1A   ; $BB9D
    .byte $1A   ; $BB9E
    .byte $1A   ; $BB9F
    .byte $1A   ; $BBA0
    .byte $18   ; $BBA1
    .byte $18   ; $BBA2
    .byte $1A   ; $BBA3
    .byte $1A   ; $BBA4
    .byte $1A   ; $BBA5
    .byte $1A   ; $BBA6
    .byte $1A   ; $BBA7
    .byte $8A   ; $BBA8
    .byte $1A   ; $BBA9
    .byte $18   ; $BBAA
    .byte $18   ; $BBAB
    .byte $D2   ; $BBAC
    .byte $D8   ; $BBAD
    .byte $D8   ; $BBAE
    .byte $D2   ; $BBAF
    
  ELSE
    
ColBigBirdStanding_A:
    .byte $44   ; $BB58
    .byte $44   ; $BB59
    .byte $44   ; $BB5A
    .byte $86   ; $BB5B
    .byte $44   ; $BB5C
    .byte $44   ; $BB5D
    .byte $86   ; $BB5E
    .byte $44   ; $BB5F
    .byte $44   ; $BB60
    .byte $86   ; $BB61
    .byte $44   ; $BB62
    .byte $44   ; $BB63
    .byte $2C   ; $BB64
    .byte $2C   ; $BB65
    .byte $2C   ; $BB66
    .byte $2C   ; $BB67
    .byte $2C   ; $BB68
    .byte $2C   ; $BB69
    .byte $2C   ; $BB6A
    .byte $2C   ; $BB6B
    .byte $2C   ; $BB6C
    .byte $2C   ; $BB6D
    .byte $2C   ; $BB6E
    .byte $2C   ; $BB6F
    .byte $2C   ; $BB70
    .byte $2C   ; $BB71
    .byte $2C   ; $BB72
    .byte $2C   ; $BB73
    .byte $2C   ; $BB74
    .byte $2C   ; $BB75
    .byte $2C   ; $BB76
    .byte $2C   ; $BB77
    .byte $2C   ; $BB78
    .byte $2C   ; $BB79
    .byte $2C   ; $BB7A
    .byte $2C   ; $BB7B
    .byte $2C   ; $BB7C
    .byte $2C   ; $BB7D
    .byte $2C   ; $BB7E
    .byte $2C   ; $BB7F
    .byte $24   ; $BB80
    .byte $24   ; $BB81
    .byte $24   ; $BB82
    .byte $24   ; $BB83
ColBigBirdStanding_B:
    .byte $44   ; $BB84
    .byte $44   ; $BB85
    .byte $44   ; $BB86
    .byte $86   ; $BB87
    .byte $44   ; $BB88
    .byte $44   ; $BB89
    .byte $86   ; $BB8A
    .byte $44   ; $BB8B
    .byte $44   ; $BB8C
    .byte $86   ; $BB8D
    .byte $44   ; $BB8E
    .byte $44   ; $BB8F
    .byte $2C   ; $BB90
    .byte $2C   ; $BB91
    .byte $2C   ; $BB92
    .byte $2C   ; $BB93
    .byte $2C   ; $BB94
    .byte $2C   ; $BB95
    .byte $2C   ; $BB96
    .byte $2C   ; $BB97
    .byte $2C   ; $BB98
    .byte $2C   ; $BB99
    .byte $2C   ; $BB9A
    .byte $2C   ; $BB9B
    .byte $2C   ; $BB9C
    .byte $2C   ; $BB9D
    .byte $2C   ; $BB9E
    .byte $2C   ; $BB9F
    .byte $2C   ; $BBA0
    .byte $2C   ; $BBA1
    .byte $2C   ; $BBA2
    .byte $2C   ; $BBA3
    .byte $2C   ; $BBA4
    .byte $2C   ; $BBA5
    .byte $2C   ; $BBA6
    .byte $2C   ; $BBA7
    .byte $BA   ; $BBA8
    .byte $2C   ; $BBA9
    .byte $2C   ; $BBAA
    .byte $2C   ; $BBAB
    .byte $24   ; $BBAC
    .byte $24   ; $BBAD
    .byte $24   ; $BBAE
    .byte $24   ; $BBAF

    
  ENDIF
    
LBBB0:
    .byte $00 ; |        | $BBB0
    .byte $00 ; |        | $BBB1
    .byte $80 ; |X       | $BBB2
    .byte $C0 ; |XX      | $BBB3
    .byte $E0 ; |XXX     | $BBB4
    .byte $80 ; |X       | $BBB5
    .byte $80 ; |X       | $BBB6
    .byte $80 ; |X       | $BBB7
    .byte $C0 ; |XX      | $BBB8
    .byte $80 ; |X       | $BBB9
    .byte $A0 ; |X X     | $BBBA
    .byte $C0 ; |XX      | $BBBB
    .byte $C0 ; |XX      | $BBBC
    .byte $80 ; |X       | $BBBD
    .byte $E0 ; |XXX     | $BBBE
    .byte $20 ; |  X     | $BBBF
    .byte $C0 ; |XX      | $BBC0
    .byte $A0 ; |X X     | $BBC1
    .byte $E0 ; |XXX     | $BBC2
    .byte $60 ; | XX     | $BBC3
    .byte $C0 ; |XX      | $BBC4
    .byte $A0 ; |X X     | $BBC5
    .byte $E0 ; |XXX     | $BBC6
    .byte $20 ; |  X     | $BBC7
    .byte $C0 ; |XX      | $BBC8
    .byte $A0 ; |X X     | $BBC9
    .byte $E0 ; |XXX     | $BBCA
    .byte $C0 ; |XX      | $BBCB
    .byte $C0 ; |XX      | $BBCC
    .byte $A0 ; |X X     | $BBCD
    .byte $E0 ; |XXX     | $BBCE
    .byte $80 ; |X       | $BBCF
    .byte $C0 ; |XX      | $BBD0
    .byte $A0 ; |X X     | $BBD1
    .byte $80 ; |X       | $BBD2
    .byte $C0 ; |XX      | $BBD3
    .byte $C0 ; |XX      | $BBD4
    .byte $A0 ; |X X     | $BBD5
    .byte $00 ; |        | $BBD6
    .byte $20 ; |  X     | $BBD7
    .byte $C0 ; |XX      | $BBD8
    .byte $20 ; |  X     | $BBD9
    .byte $00 ; |        | $BBDA
    .byte $60 ; | XX     | $BBDB
    .byte $40 ; | X      | $BBDC
    .byte $00 ; |        | $BBDD
    .byte $80 ; |X       | $BBDE
    .byte $20 ; |  X     | $BBDF
    .byte $20 ; |  X     | $BBE0
    .byte $40 ; | X      | $BBE1
    .byte $40 ; | X      | $BBE2
    .byte $C0 ; |XX      | $BBE3
    .byte $20 ; |  X     | $BBE4
    .byte $40 ; | X      | $BBE5
    .byte $40 ; | X      | $BBE6
    .byte $80 ; |X       | $BBE7
    .byte $00 ; |        | $BBE8
    .byte $C0 ; |XX      | $BBE9
    .byte $40 ; | X      | $BBEA
    .byte $C0 ; |XX      | $BBEB
    .byte $C0 ; |XX      | $BBEC
    .byte $C0 ; |XX      | $BBED
    .byte $00 ; |        | $BBEE
    .byte $20 ; |  X     | $BBEF
    .byte $C0 ; |XX      | $BBF0
    .byte $C0 ; |XX      | $BBF1
    .byte $E0 ; |XXX     | $BBF2
    .byte $60 ; | XX     | $BBF3
    .byte $80 ; |X       | $BBF4
    .byte $C0 ; |XX      | $BBF5
LBBF6:
    .byte $D2 ; |XX X  X | $BBF6
    .byte $1C ; |   XXX  | $BBF7
    .byte $0C ; |    XX  | $BBF8

    .byte $00 ; |        | $BBF9  free bytes
    .byte $00 ; |        | $BBFA
    .byte $00 ; |        | $BBFB
    .byte $00 ; |        | $BBFC
    .byte $00 ; |        | $BBFD
    .byte $00 ; |        | $BBFE
    .byte $00 ; |        | $BBFF

       ORG $0C00
      RORG $BC00

BigBirdWalking_A:
    .byte $18 ; |   XX   | $BC00
    .byte $38 ; |  XXX   | $BC01
    .byte $79 ; | XXXX  X| $BC02
    .byte $71 ; | XXX   X| $BC03
    .byte $79 ; | XXXX  X| $BC04
    .byte $3F ; |  XXXXXX| $BC05
    .byte $03 ; |      XX| $BC06
    .byte $07 ; |     XXX| $BC07
    .byte $07 ; |     XXX| $BC08
    .byte $0F ; |    XXXX| $BC09
    .byte $1F ; |   XXXXX| $BC0A
    .byte $1F ; |   XXXXX| $BC0B
    .byte $1F ; |   XXXXX| $BC0C
    .byte $2F ; |  X XXXX| $BC0D
    .byte $5F ; | X XXXXX| $BC0E
    .byte $7E ; | XXXXXX | $BC0F
    .byte $7D ; | XXXXX X| $BC10
    .byte $7F ; | XXXXXXX| $BC11
    .byte $7F ; | XXXXXXX| $BC12
    .byte $7F ; | XXXXXXX| $BC13
    .byte $2F ; |  X XXXX| $BC14
    .byte $0E ; |    XXX | $BC15
    .byte $07 ; |     XXX| $BC16
    .byte $07 ; |     XXX| $BC17
    .byte $03 ; |      XX| $BC18
    .byte $03 ; |      XX| $BC19
    .byte $01 ; |       X| $BC1A
    .byte $01 ; |       X| $BC1B
    .byte $01 ; |       X| $BC1C
    .byte $03 ; |      XX| $BC1D
    .byte $07 ; |     XXX| $BC1E
    .byte $07 ; |     XXX| $BC1F
    .byte $07 ; |     XXX| $BC20
    .byte $07 ; |     XXX| $BC21
    .byte $07 ; |     XXX| $BC22
    .byte $03 ; |      XX| $BC23
    .byte $03 ; |      XX| $BC24
    .byte $01 ; |       X| $BC25
    .byte $07 ; |     XXX| $BC26
    .byte $0A ; |    X X | $BC27
    .byte $0D ; |    XX X| $BC28
    .byte $0F ; |    XXXX| $BC29
    .byte $00 ; |        | $BC2A
    .byte $00 ; |        | $BC2B
BigBirdWalking_B:
    .byte $E0 ; |XXX     | $BC2C
    .byte $FC ; |XXXXXX  | $BC2D
    .byte $FC ; |XXXXXX  | $BC2E
    .byte $E0 ; |XXX     | $BC2F
    .byte $C0 ; |XX      | $BC30
    .byte $C0 ; |XX      | $BC31
    .byte $80 ; |X       | $BC32
    .byte $80 ; |X       | $BC33
    .byte $00 ; |        | $BC34
    .byte $C0 ; |XX      | $BC35
    .byte $E0 ; |XXX     | $BC36
    .byte $F0 ; |XXXX    | $BC37
    .byte $F0 ; |XXXX    | $BC38
    .byte $F0 ; |XXXX    | $BC39
    .byte $F0 ; |XXXX    | $BC3A
    .byte $F0 ; |XXXX    | $BC3B
    .byte $70 ; | XXX    | $BC3C
    .byte $B8 ; |X XXX   | $BC3D
    .byte $F8 ; |XXXXX   | $BC3E
    .byte $BC ; |X XXXX  | $BC3F
    .byte $76 ; | XXX XX | $BC40
    .byte $EE ; |XXX XXX | $BC41
    .byte $FE ; |XXXXXXX | $BC42
    .byte $E6 ; |XXX  XX | $BC43
    .byte $CE ; |XX  XXX | $BC44
    .byte $CC ; |XX  XX  | $BC45
    .byte $C4 ; |XX   X  | $BC46
    .byte $80 ; |X       | $BC47
    .byte $80 ; |X       | $BC48
    .byte $80 ; |X       | $BC49
    .byte $C0 ; |XX      | $BC4A
    .byte $F0 ; |XXXX    | $BC4B
    .byte $C0 ; |XX      | $BC4C
    .byte $F8 ; |XXXXX   | $BC4D
    .byte $C0 ; |XX      | $BC4E
    .byte $C0 ; |XX      | $BC4F
    .byte $C0 ; |XX      | $BC50
    .byte $80 ; |X       | $BC51
    .byte $C0 ; |XX      | $BC52
    .byte $A0 ; |X X     | $BC53
    .byte $60 ; | XX     | $BC54
    .byte $E0 ; |XXX     | $BC55
    .byte $00 ; |        | $BC56
    .byte $00 ; |        | $BC57
    
  IF NTSC
  
ColBigBirdWalking_A:
    .byte $36   ; $BC58
    .byte $36   ; $BC59
    .byte $36   ; $BC5A
    .byte $56   ; $BC5B
    .byte $36   ; $BC5C
    .byte $36   ; $BC5D
    .byte $56   ; $BC5E
    .byte $36   ; $BC5F
    .byte $36   ; $BC60
    .byte $18   ; $BC61
    .byte $1A   ; $BC62
    .byte $1A   ; $BC63
    .byte $1A   ; $BC64
    .byte $1A   ; $BC65
    .byte $1A   ; $BC66
    .byte $1A   ; $BC67
    .byte $1A   ; $BC68
    .byte $1A   ; $BC69
    .byte $1A   ; $BC6A
    .byte $1A   ; $BC6B
    .byte $1A   ; $BC6C
    .byte $1A   ; $BC6D
    .byte $1A   ; $BC6E
    .byte $1A   ; $BC6F
    .byte $1A   ; $BC70
    .byte $1A   ; $BC71
    .byte $1A   ; $BC72
    .byte $18   ; $BC73
    .byte $18   ; $BC74
    .byte $1A   ; $BC75
    .byte $1A   ; $BC76
    .byte $1A   ; $BC77
    .byte $1A   ; $BC78
    .byte $1A   ; $BC79
    .byte $1A   ; $BC7A
    .byte $1A   ; $BC7B
    .byte $18   ; $BC7C
    .byte $18   ; $BC7D
    .byte $D2   ; $BC7E
    .byte $D8   ; $BC7F
    .byte $D8   ; $BC80
    .byte $D2   ; $BC81
    .byte $FF   ; $BC82
    .byte $FF   ; $BC83
ColBigBirdWalking_B:
    .byte $36   ; $BC84
    .byte $36   ; $BC85
    .byte $36   ; $BC86
    .byte $56   ; $BC87
    .byte $36   ; $BC88
    .byte $36   ; $BC89
    .byte $56   ; $BC8A
    .byte $36   ; $BC8B
    .byte $36   ; $BC8C
    .byte $18   ; $BC8D
    .byte $1A   ; $BC8E
    .byte $1A   ; $BC8F
    .byte $1A   ; $BC90
    .byte $1A   ; $BC91
    .byte $1A   ; $BC92
    .byte $1A   ; $BC93
    .byte $1A   ; $BC94
    .byte $1A   ; $BC95
    .byte $1A   ; $BC96
    .byte $1A   ; $BC97
    .byte $1A   ; $BC98
    .byte $1A   ; $BC99
    .byte $1A   ; $BC9A
    .byte $1A   ; $BC9B
    .byte $1A   ; $BC9C
    .byte $1A   ; $BC9D
    .byte $1A   ; $BC9E
    .byte $18   ; $BC9F
    .byte $18   ; $BCA0
    .byte $1A   ; $BCA1
    .byte $1A   ; $BCA2
    .byte $1A   ; $BCA3
    .byte $1A   ; $BCA4
    .byte $1A   ; $BCA5
    .byte $88   ; $BCA6
    .byte $1A   ; $BCA7
    .byte $18   ; $BCA8
    .byte $18   ; $BCA9
    .byte $D2   ; $BCAA
    .byte $D8   ; $BCAB
    .byte $D8   ; $BCAC
    .byte $D2   ; $BCAD
    .byte $FF   ; $BCAE
    .byte $FF   ; $BCAF

  ELSE
  
ColBigBirdWalking_A:
    .byte $44   ; $BC58
    .byte $44   ; $BC59
    .byte $44   ; $BC5A
    .byte $86   ; $BC5B
    .byte $44   ; $BC5C
    .byte $44   ; $BC5D
    .byte $86   ; $BC5E
    .byte $44   ; $BC5F
    .byte $44   ; $BC60
    .byte $2C   ; $BC61
    .byte $2C   ; $BC62
    .byte $2C   ; $BC63
    .byte $2C   ; $BC64
    .byte $2C   ; $BC65
    .byte $2C   ; $BC66
    .byte $2C   ; $BC67
    .byte $2C   ; $BC68
    .byte $2C   ; $BC69
    .byte $2C   ; $BC6A
    .byte $2C   ; $BC6B
    .byte $2C   ; $BC6C
    .byte $2C   ; $BC6D
    .byte $2C   ; $BC6E
    .byte $2C   ; $BC6F
    .byte $2C   ; $BC70
    .byte $2C   ; $BC71
    .byte $2C   ; $BC72
    .byte $2C   ; $BC73
    .byte $2C   ; $BC74
    .byte $2C   ; $BC75
    .byte $2C   ; $BC76
    .byte $2C   ; $BC77
    .byte $2C   ; $BC78
    .byte $2C   ; $BC79
    .byte $2C   ; $BC7A
    .byte $2C   ; $BC7B
    .byte $2C   ; $BC7C
    .byte $2C   ; $BC7D
    .byte $24   ; $BC7E
    .byte $24   ; $BC7F
    .byte $24   ; $BC80
    .byte $24   ; $BC81
    .byte $FF   ; $BC82
    .byte $FF   ; $BC83
ColBigBirdWalking_B:
    .byte $44   ; $BC84
    .byte $44   ; $BC85
    .byte $44   ; $BC86
    .byte $86   ; $BC87
    .byte $44   ; $BC88
    .byte $44   ; $BC89
    .byte $86   ; $BC8A
    .byte $44   ; $BC8B
    .byte $44   ; $BC8C
    .byte $2C   ; $BC8D
    .byte $2C   ; $BC8E
    .byte $2C   ; $BC8F
    .byte $2C   ; $BC90
    .byte $2C   ; $BC91
    .byte $2C   ; $BC92
    .byte $2C   ; $BC93
    .byte $2C   ; $BC94
    .byte $2C   ; $BC95
    .byte $2C   ; $BC96
    .byte $2C   ; $BC97
    .byte $2C   ; $BC98
    .byte $2C   ; $BC99
    .byte $2C   ; $BC9A
    .byte $2C   ; $BC9B
    .byte $2C   ; $BC9C
    .byte $2C   ; $BC9D
    .byte $2C   ; $BC9E
    .byte $2C   ; $BC9F
    .byte $2C   ; $BCA0
    .byte $2C   ; $BCA1
    .byte $2C   ; $BCA2
    .byte $2C   ; $BCA3
    .byte $2C   ; $BCA4
    .byte $2C   ; $BCA5
    .byte $BA   ; $BCA6
    .byte $2C   ; $BCA7
    .byte $2C   ; $BCA8
    .byte $2C   ; $BCA9
    .byte $24   ; $BCAA
    .byte $24   ; $BCAB
    .byte $24   ; $BCAC
    .byte $24   ; $BCAD
    .byte $FF   ; $BCAE
    .byte $FF   ; $BCAF

  ENDIF
  
  IF NTSC
    
EggsOne:
    .byte $00 ; |        | $BCB0
    .byte $03 ; |      XX| $BCB1
    .byte $FF ; |XXXXXXXX| $BCB2
    .byte $80 ; |X       | $BCB3
    .byte $BE ; |X XXXXX | $BCB4
    .byte $A0 ; |X X     | $BCB5
    .byte $A0 ; |X X     | $BCB6
    .byte $A0 ; |X X     | $BCB7
    .byte $BC ; |X XXXX  | $BCB8
    .byte $A0 ; |X X     | $BCB9
    .byte $A0 ; |X X     | $BCBA
    .byte $A0 ; |X X     | $BCBB
    .byte $BE ; |X XXXXX | $BCBC
    .byte $80 ; |X       | $BCBD
    .byte $FF ; |XXXXXXXX| $BCBE
    .byte $00 ; |        | $BCBF
    .byte $00 ; |        | $BCC0
    .byte $00 ; |        | $BCC1
EggsTwo:
    .byte $00 ; |        | $BCC2
    .byte $00 ; |        | $BCC3
    .byte $FF ; |XXXXXXXX| $BCC4
    .byte $00 ; |        | $BCC5
    .byte $71 ; | XXX   X| $BCC6
    .byte $8A ; |X   X X | $BCC7
    .byte $8A ; |X   X X | $BCC8
    .byte $9A ; |X  XX X | $BCC9
    .byte $82 ; |X     X | $BCCA
    .byte $82 ; |X     X | $BCCB
    .byte $82 ; |X     X | $BCCC
    .byte $8A ; |X   X X | $BCCD
    .byte $71 ; | XXX   X| $BCCE
    .byte $00 ; |        | $BCCF
    .byte $FF ; |XXXXXXXX| $BCD0
    .byte $00 ; |        | $BCD1
    .byte $00 ; |        | $BCD2
    .byte $00 ; |        | $BCD3
EggsThree:
    .byte $00 ; |        | $BCD4
    .byte $30 ; |  XX    | $BCD5
    .byte $FF ; |XXXXXXXX| $BCD6
    .byte $00 ; |        | $BCD7
    .byte $C7 ; |XX   XXX| $BCD8
    .byte $28 ; |  X X   | $BCD9
    .byte $20 ; |  X     | $BCDA
    .byte $60 ; | XX     | $BCDB
    .byte $07 ; |     XXX| $BCDC
    .byte $08 ; |    X   | $BCDD
    .byte $08 ; |    X   | $BCDE
    .byte $28 ; |  X X   | $BCDF
    .byte $C7 ; |XX   XXX| $BCE0
    .byte $00 ; |        | $BCE1
    .byte $FF ; |XXXXXXXX| $BCE2
    .byte $00 ; |        | $BCE3
    .byte $00 ; |        | $BCE4
    .byte $00 ; |        | $BCE5
EggsFour:
    .byte $00 ; |        | $BCE6
    .byte $00 ; |        | $BCE7
    .byte $E0 ; |XXX     | $BCE8
    .byte $20 ; |  X     | $BCE9
    .byte $20 ; |  X     | $BCEA
    .byte $A0 ; |X X     | $BCEB
    .byte $A0 ; |X X     | $BCEC
    .byte $A2 ; |X X   X | $BCED
    .byte $26 ; |  X  XX | $BCEE
    .byte $2C ; |  X XX  | $BCEF
    .byte $38 ; |  XXX   | $BCF0
    .byte $B0 ; |X XX    | $BCF1
    .byte $20 ; |  X     | $BCF2
    .byte $20 ; |  X     | $BCF3
    .byte $E0 ; |XXX     | $BCF4
    .byte $00 ; |        | $BCF5
    .byte $00 ; |        | $BCF6
    .byte $00 ; |        | $BCF7

    .byte $00 ; |        | $BCF8  free bytes
    .byte $00 ; |        | $BCF9
    .byte $00 ; |        | $BCFA
    .byte $00 ; |        | $BCFB
    .byte $00 ; |        | $BCFC
    .byte $00 ; |        | $BCFD
    .byte $00 ; |        | $BCFE
    .byte $00 ; |        | $BCFF
    
  ELSE
  
    REPEAT ($BD00-*)
      .byte 0
    REPEND
    
  ENDIF

       ORG $0D00
      RORG $BD00

BigBirdWalking_C:
    .byte $07 ; |     XXX| $BD00
    .byte $0F ; |    XXXX| $BD01
    .byte $3F ; |  XXXXXX| $BD02
    .byte $3F ; |  XXXXXX| $BD03
    .byte $1E ; |   XXXX | $BD04
    .byte $06 ; |     XX | $BD05
    .byte $06 ; |     XX | $BD06
    .byte $06 ; |     XX | $BD07
    .byte $07 ; |     XXX| $BD08
    .byte $07 ; |     XXX| $BD09
    .byte $07 ; |     XXX| $BD0A
    .byte $37 ; |  XX XXX| $BD0B
    .byte $6F ; | XX XXXX| $BD0C
    .byte $7F ; | XXXXXXX| $BD0D
    .byte $7F ; | XXXXXXX| $BD0E
    .byte $7F ; | XXXXXXX| $BD0F
    .byte $7F ; | XXXXXXX| $BD10
    .byte $7C ; | XXXXX  | $BD11
    .byte $3F ; |  XXXXXX| $BD12
    .byte $1F ; |   XXXXX| $BD13
    .byte $1F ; |   XXXXX| $BD14
    .byte $0F ; |    XXXX| $BD15
    .byte $0E ; |    XXX | $BD16
    .byte $07 ; |     XXX| $BD17
    .byte $07 ; |     XXX| $BD18
    .byte $03 ; |      XX| $BD19
    .byte $03 ; |      XX| $BD1A
    .byte $01 ; |       X| $BD1B
    .byte $01 ; |       X| $BD1C
    .byte $01 ; |       X| $BD1D
    .byte $03 ; |      XX| $BD1E
    .byte $07 ; |     XXX| $BD1F
    .byte $07 ; |     XXX| $BD20
    .byte $07 ; |     XXX| $BD21
    .byte $07 ; |     XXX| $BD22
    .byte $07 ; |     XXX| $BD23
    .byte $03 ; |      XX| $BD24
    .byte $03 ; |      XX| $BD25
    .byte $01 ; |       X| $BD26
    .byte $07 ; |     XXX| $BD27
    .byte $0A ; |    X X | $BD28
    .byte $0D ; |    XX X| $BD29
    .byte $0F ; |    XXXX| $BD2A
    .byte $00 ; |        | $BD2B
BigBirdWalking_D:
    .byte $C0 ; |XX      | $BD2C
    .byte $C0 ; |XX      | $BD2D
    .byte $80 ; |X       | $BD2E
    .byte $00 ; |        | $BD2F
    .byte $00 ; |        | $BD30
    .byte $00 ; |        | $BD31
    .byte $00 ; |        | $BD32
    .byte $00 ; |        | $BD33
    .byte $00 ; |        | $BD34
    .byte $80 ; |X       | $BD35
    .byte $80 ; |X       | $BD36
    .byte $C0 ; |XX      | $BD37
    .byte $E0 ; |XXX     | $BD38
    .byte $E0 ; |XXX     | $BD39
    .byte $F0 ; |XXXX    | $BD3A
    .byte $F0 ; |XXXX    | $BD3B
    .byte $F0 ; |XXXX    | $BD3C
    .byte $F0 ; |XXXX    | $BD3D
    .byte $78 ; | XXXX   | $BD3E
    .byte $B8 ; |X XXX   | $BD3F
    .byte $FC ; |XXXXXX  | $BD40
    .byte $B4 ; |X XX X  | $BD41
    .byte $6C ; | XX XX  | $BD42
    .byte $FC ; |XXXXXX  | $BD43
    .byte $EC ; |XXX XX  | $BD44
    .byte $D8 ; |XX XX   | $BD45
    .byte $C8 ; |XX  X   | $BD46
    .byte $C0 ; |XX      | $BD47
    .byte $80 ; |X       | $BD48
    .byte $80 ; |X       | $BD49
    .byte $80 ; |X       | $BD4A
    .byte $C0 ; |XX      | $BD4B
    .byte $F0 ; |XXXX    | $BD4C
    .byte $C0 ; |XX      | $BD4D
    .byte $F8 ; |XXXXX   | $BD4E
    .byte $C0 ; |XX      | $BD4F
    .byte $C0 ; |XX      | $BD50
    .byte $C0 ; |XX      | $BD51
    .byte $80 ; |X       | $BD52
    .byte $C0 ; |XX      | $BD53
    .byte $A0 ; |X X     | $BD54
    .byte $60 ; | XX     | $BD55
    .byte $E0 ; |XXX     | $BD56
    .byte $00 ; |        | $BD57
    
  IF NTSC
  
ColBigBirdWalking_C:
    .byte $36   ; $BD58
    .byte $36   ; $BD59
    .byte $36   ; $BD5A
    .byte $36   ; $BD5B
    .byte $56   ; $BD5C
    .byte $36   ; $BD5D
    .byte $36   ; $BD5E
    .byte $56   ; $BD5F
    .byte $36   ; $BD60
    .byte $18   ; $BD61
    .byte $1A   ; $BD62
    .byte $1A   ; $BD63
    .byte $1A   ; $BD64
    .byte $1A   ; $BD65
    .byte $1A   ; $BD66
    .byte $1A   ; $BD67
    .byte $1A   ; $BD68
    .byte $1A   ; $BD69
    .byte $1A   ; $BD6A
    .byte $1A   ; $BD6B
    .byte $1A   ; $BD6C
    .byte $1A   ; $BD6D
    .byte $1A   ; $BD6E
    .byte $1A   ; $BD6F
    .byte $1A   ; $BD70
    .byte $1A   ; $BD71
    .byte $1A   ; $BD72
    .byte $1A   ; $BD73
    .byte $18   ; $BD74
    .byte $18   ; $BD75
    .byte $1A   ; $BD76
    .byte $1A   ; $BD77
    .byte $1A   ; $BD78
    .byte $1A   ; $BD79
    .byte $1A   ; $BD7A
    .byte $1A   ; $BD7B
    .byte $1A   ; $BD7C
    .byte $18   ; $BD7D
    .byte $18   ; $BD7E
    .byte $D2   ; $BD7F
    .byte $D8   ; $BD80
    .byte $D8   ; $BD81
    .byte $D2   ; $BD82
    .byte $FF   ; $BD83
ColBigBirdWalking_D:
    .byte $36   ; $BD84
    .byte $36   ; $BD85
    .byte $36   ; $BD86
    .byte $36   ; $BD87
    .byte $56   ; $BD88
    .byte $36   ; $BD89
    .byte $36   ; $BD8A
    .byte $56   ; $BD8B
    .byte $36   ; $BD8C
    .byte $18   ; $BD8D
    .byte $1A   ; $BD8E
    .byte $1A   ; $BD8F
    .byte $1A   ; $BD90
    .byte $1A   ; $BD91
    .byte $1A   ; $BD92
    .byte $1A   ; $BD93
    .byte $1A   ; $BD94
    .byte $1A   ; $BD95
    .byte $1A   ; $BD96
    .byte $1A   ; $BD97
    .byte $1A   ; $BD98
    .byte $1A   ; $BD99
    .byte $1A   ; $BD9A
    .byte $1A   ; $BD9B
    .byte $1A   ; $BD9C
    .byte $1A   ; $BD9D
    .byte $1A   ; $BD9E
    .byte $1A   ; $BD9F
    .byte $18   ; $BDA0
    .byte $18   ; $BDA1
    .byte $1A   ; $BDA2
    .byte $1A   ; $BDA3
    .byte $1A   ; $BDA4
    .byte $1A   ; $BDA5
    .byte $1A   ; $BDA6
    .byte $8A   ; $BDA7
    .byte $1A   ; $BDA8
    .byte $18   ; $BDA9
    .byte $18   ; $BDAA
    .byte $D2   ; $BDAB
    .byte $D8   ; $BDAC
    .byte $D8   ; $BDAD
    .byte $D2   ; $BDAE
    .byte $FF   ; $BDAF
    
  ELSE
  
ColBigBirdWalking_C:
    .byte $44   ; $BD58
    .byte $44   ; $BD59
    .byte $44   ; $BD5A
    .byte $44   ; $BD5B
    .byte $86   ; $BD5C
    .byte $44   ; $BD5D
    .byte $44   ; $BD5E
    .byte $86   ; $BD5F
    .byte $44   ; $BD60
    .byte $2C   ; $BD61
    .byte $2C   ; $BD62
    .byte $2C   ; $BD63
    .byte $2C   ; $BD64
    .byte $2C   ; $BD65
    .byte $2C   ; $BD66
    .byte $2C   ; $BD67
    .byte $2C   ; $BD68
    .byte $2C   ; $BD69
    .byte $2C   ; $BD6A
    .byte $2C   ; $BD6B
    .byte $2C   ; $BD6C
    .byte $2C   ; $BD6D
    .byte $2C   ; $BD6E
    .byte $2C   ; $BD6F
    .byte $2C   ; $BD70
    .byte $2C   ; $BD71
    .byte $2C   ; $BD72
    .byte $2C   ; $BD73
    .byte $2C   ; $BD74
    .byte $2C   ; $BD75
    .byte $2C   ; $BD76
    .byte $2C   ; $BD77
    .byte $2C   ; $BD78
    .byte $2C   ; $BD79
    .byte $2C   ; $BD7A
    .byte $2C   ; $BD7B
    .byte $2C   ; $BD7C
    .byte $2C   ; $BD7D
    .byte $2C   ; $BD7E
    .byte $24   ; $BD7F
    .byte $24   ; $BD80
    .byte $24   ; $BD81
    .byte $24   ; $BD82
    .byte $FF   ; $BD83
ColBigBirdWalking_D:
    .byte $44   ; $BD84
    .byte $44   ; $BD85
    .byte $44   ; $BD86
    .byte $44   ; $BD87
    .byte $86   ; $BD88
    .byte $44   ; $BD89
    .byte $44   ; $BD8A
    .byte $86   ; $BD8B
    .byte $44   ; $BD8C
    .byte $2C   ; $BD8D
    .byte $2C   ; $BD8E
    .byte $2C   ; $BD8F
    .byte $2C   ; $BD90
    .byte $2C   ; $BD91
    .byte $2C   ; $BD92
    .byte $2C   ; $BD93
    .byte $2C   ; $BD94
    .byte $2C   ; $BD95
    .byte $2C   ; $BD96
    .byte $2C   ; $BD97
    .byte $2C   ; $BD98
    .byte $2C   ; $BD99
    .byte $2C   ; $BD9A
    .byte $2C   ; $BD9B
    .byte $2C   ; $BD9C
    .byte $2C   ; $BD9D
    .byte $2C   ; $BD9E
    .byte $2C   ; $BD9F
    .byte $2C   ; $BDA0
    .byte $2C   ; $BDA1
    .byte $2C   ; $BDA2
    .byte $2C   ; $BDA3
    .byte $2C   ; $BDA4
    .byte $2C   ; $BDA5
    .byte $2C   ; $BDA6
    .byte $BA   ; $BDA7
    .byte $2C   ; $BDA8
    .byte $2C   ; $BDA9
    .byte $2C   ; $BDAA
    .byte $24   ; $BDAB
    .byte $24   ; $BDAC
    .byte $24   ; $BDAD
    .byte $24   ; $BDAE
    .byte $FF   ; $BDAF

  
  ENDIF
IndirectJmpTab:
    .word LB174          ; $BDB0
    .word LB195          ; $BDB2
    .word LB1B6          ; $BDB4
    .word LB1D7          ; $BDB6
    .word LB1F8          ; $BDB8
    .word LB219          ; $BDBA
LBDBC:
    .byte $11 ; |   X   X| $BDBC
    .byte $21 ; |  X    X| $BDBD
    .byte $21 ; |  X    X| $BDBE
    .byte $11 ; |   X   X| $BDBF
LBDC0:
    .byte $F0 ; |XXXX    | $BDC0
    .byte $00 ; |        | $BDC1
    .byte $10 ; |   X    | $BDC2
    .byte $F0 ; |XXXX    | $BDC3
LBDC4:
    .byte $13 ; |   X  XX| $BDC4
    .byte $23 ; |  X   XX| $BDC5
    .byte $23 ; |  X   XX| $BDC6
    .byte $13 ; |   X  XX| $BDC7
LBDC8:
    .byte $10 ; |   X    | $BDC8
    .byte $20 ; |  X     | $BDC9
    .byte $20 ; |  X     | $BDCA
    .byte $10 ; |   X    | $BDCB
LBDCC:
    .byte $06 ; |     XX | $BDCC
    .byte $0F ; |    XXXX| $BDCD
    .byte $0F ; |    XXXX| $BDCE
    .byte $06 ; |     XX | $BDCF
LBDD0:
    .byte $00 ; |        | $BDD0
    .byte $00 ; |        | $BDD1
    .byte $00 ; |        | $BDD2
    .byte $00 ; |        | $BDD3
    .byte $01 ; |       X| $BDD4
    .byte $01 ; |       X| $BDD5
    .byte $03 ; |      XX| $BDD6
    .byte $03 ; |      XX| $BDD7
LBDD8:
    .byte $00 ; |        | $BDD8
    .byte $00 ; |        | $BDD9
    .byte $0F ; |    XXXX| $BDDA
    .byte $0F ; |    XXXX| $BDDB
    .byte $0F ; |    XXXX| $BDDC
    .byte $0F ; |    XXXX| $BDDD
    .byte $0F ; |    XXXX| $BDDE
    .byte $0F ; |    XXXX| $BDDF

LBDE0:  ; indirect jump
    lda    ram_F1                ; 3
    lsr                          ; 2
    ldx    #$02                  ; 2
LBDE5:
    lda    LBBF6,X               ; 4
    and    ram_F1                ; 3
    bcs    LBDEE                 ; 2³
    eor    ram_81                ; 3
LBDEE:
    sta    ram_DF,X              ; 4
    dex                          ; 2
    bpl    LBDE5                 ; 2³
    lda    #>LF1CA               ; 2
    sta    ram_99                ; 3
    lda    #<LF1CA               ; 2
    sta    ram_98                ; 3
    jmp    LBFF0                 ; 3

    .byte $00 ; |        | $BDFE   free bytes
    .byte $00 ; |        | $BDFF

       ORG $0E00
      RORG $BE00

BigBirdWalking_E:
    .byte $1E ; |   XXXX | $BE00
    .byte $3E ; |  XXXXX | $BE01
    .byte $7C ; | XXXXX  | $BE02
    .byte $38 ; |  XXX   | $BE03
    .byte $38 ; |  XXX   | $BE04
    .byte $1C ; |   XXX  | $BE05
    .byte $0E ; |    XXX | $BE06
    .byte $0E ; |    XXX | $BE07
    .byte $06 ; |     XX | $BE08
    .byte $07 ; |     XXX| $BE09
    .byte $03 ; |      XX| $BE0A
    .byte $07 ; |     XXX| $BE0B
    .byte $0F ; |    XXXX| $BE0C
    .byte $2F ; |  X XXXX| $BE0D
    .byte $6F ; | XX XXXX| $BE0E
    .byte $7E ; | XXXXXX | $BE0F
    .byte $7D ; | XXXXX X| $BE10
    .byte $7F ; | XXXXXXX| $BE11
    .byte $7F ; | XXXXXXX| $BE12
    .byte $3F ; |  XXXXXX| $BE13
    .byte $0F ; |    XXXX| $BE14
    .byte $0E ; |    XXX | $BE15
    .byte $07 ; |     XXX| $BE16
    .byte $07 ; |     XXX| $BE17
    .byte $03 ; |      XX| $BE18
    .byte $01 ; |       X| $BE19
    .byte $01 ; |       X| $BE1A
    .byte $01 ; |       X| $BE1B
    .byte $01 ; |       X| $BE1C
    .byte $03 ; |      XX| $BE1D
    .byte $07 ; |     XXX| $BE1E
    .byte $07 ; |     XXX| $BE1F
    .byte $07 ; |     XXX| $BE20
    .byte $07 ; |     XXX| $BE21
    .byte $07 ; |     XXX| $BE22
    .byte $03 ; |      XX| $BE23
    .byte $03 ; |      XX| $BE24
    .byte $01 ; |       X| $BE25
    .byte $07 ; |     XXX| $BE26
    .byte $0A ; |    X X | $BE27
    .byte $0D ; |    XX X| $BE28
    .byte $0F ; |    XXXX| $BE29
    .byte $00 ; |        | $BE2A
    .byte $00 ; |        | $BE2B
BigBirdWalking_F:
    .byte $00 ; |        | $BE2C
    .byte $18 ; |   XX   | $BE2D
    .byte $1C ; |   XXX  | $BE2E
    .byte $3E ; |  XXXXX | $BE2F
    .byte $3E ; |  XXXXX | $BE30
    .byte $76 ; | XXX XX | $BE31
    .byte $70 ; | XXX    | $BE32
    .byte $E0 ; |XXX     | $BE33
    .byte $E0 ; |XXX     | $BE34
    .byte $C0 ; |XX      | $BE35
    .byte $C0 ; |XX      | $BE36
    .byte $E0 ; |XXX     | $BE37
    .byte $E0 ; |XXX     | $BE38
    .byte $F0 ; |XXXX    | $BE39
    .byte $F0 ; |XXXX    | $BE3A
    .byte $F0 ; |XXXX    | $BE3B
    .byte $70 ; | XXX    | $BE3C
    .byte $B8 ; |X XXX   | $BE3D
    .byte $F8 ; |XXXXX   | $BE3E
    .byte $BC ; |X XXXX  | $BE3F
    .byte $74 ; | XXX X  | $BE40
    .byte $EC ; |XXX XX  | $BE41
    .byte $FC ; |XXXXXX  | $BE42
    .byte $EC ; |XXX XX  | $BE43
    .byte $DC ; |XX XXX  | $BE44
    .byte $C8 ; |XX  X   | $BE45
    .byte $80 ; |X       | $BE46
    .byte $80 ; |X       | $BE47
    .byte $80 ; |X       | $BE48
    .byte $80 ; |X       | $BE49
    .byte $C0 ; |XX      | $BE4A
    .byte $F0 ; |XXXX    | $BE4B
    .byte $C0 ; |XX      | $BE4C
    .byte $F8 ; |XXXXX   | $BE4D
    .byte $C0 ; |XX      | $BE4E
    .byte $C0 ; |XX      | $BE4F
    .byte $C0 ; |XX      | $BE50
    .byte $80 ; |X       | $BE51
    .byte $C0 ; |XX      | $BE52
    .byte $A0 ; |X X     | $BE53
    .byte $60 ; | XX     | $BE54
    .byte $E0 ; |XXX     | $BE55
    .byte $00 ; |        | $BE56
    .byte $00 ; |        | $BE57
    
  IF NTSC
    
ColBigBirdWalking_E:
    .byte $36   ; $BE58
    .byte $36   ; $BE59
    .byte $36   ; $BE5A
    .byte $36   ; $BE5B
    .byte $56   ; $BE5C
    .byte $36   ; $BE5D
    .byte $36   ; $BE5E
    .byte $56   ; $BE5F
    .byte $36   ; $BE60
    .byte $36   ; $BE61
    .byte $18   ; $BE62
    .byte $1A   ; $BE63
    .byte $1A   ; $BE64
    .byte $1A   ; $BE65
    .byte $1A   ; $BE66
    .byte $1A   ; $BE67
    .byte $1A   ; $BE68
    .byte $1A   ; $BE69
    .byte $1A   ; $BE6A
    .byte $1A   ; $BE6B
    .byte $1A   ; $BE6C
    .byte $1A   ; $BE6D
    .byte $1A   ; $BE6E
    .byte $1A   ; $BE6F
    .byte $1A   ; $BE70
    .byte $1A   ; $BE71
    .byte $1A   ; $BE72
    .byte $18   ; $BE73
    .byte $18   ; $BE74
    .byte $1A   ; $BE75
    .byte $1A   ; $BE76
    .byte $1A   ; $BE77
    .byte $1A   ; $BE78
    .byte $1A   ; $BE79
    .byte $1A   ; $BE7A
    .byte $1A   ; $BE7B
    .byte $18   ; $BE7C
    .byte $18   ; $BE7D
    .byte $D2   ; $BE7E
    .byte $D8   ; $BE7F
    .byte $D8   ; $BE80
    .byte $D2   ; $BE81
    .byte $FF   ; $BE82
    .byte $FF   ; $BE83
ColBigBirdWalking_F:
    .byte $36   ; $BE84
    .byte $36   ; $BE85
    .byte $36   ; $BE86
    .byte $36   ; $BE87
    .byte $36   ; $BE88
    .byte $56   ; $BE89
    .byte $36   ; $BE8A
    .byte $56   ; $BE8B
    .byte $36   ; $BE8C
    .byte $36   ; $BE8D
    .byte $18   ; $BE8E
    .byte $1A   ; $BE8F
    .byte $1A   ; $BE90
    .byte $1A   ; $BE91
    .byte $1A   ; $BE92
    .byte $1A   ; $BE93
    .byte $1A   ; $BE94
    .byte $1A   ; $BE95
    .byte $1A   ; $BE96
    .byte $1A   ; $BE97
    .byte $1A   ; $BE98
    .byte $1A   ; $BE99
    .byte $1A   ; $BE9A
    .byte $1A   ; $BE9B
    .byte $1A   ; $BE9C
    .byte $1A   ; $BE9D
    .byte $1A   ; $BE9E
    .byte $18   ; $BE9F
    .byte $18   ; $BEA0
    .byte $1A   ; $BEA1
    .byte $1A   ; $BEA2
    .byte $1A   ; $BEA3
    .byte $1A   ; $BEA4
    .byte $1A   ; $BEA5
    .byte $88   ; $BEA6
    .byte $1A   ; $BEA7
    .byte $18   ; $BEA8
    .byte $18   ; $BEA9
    .byte $D2   ; $BEAA
    .byte $D8   ; $BEAB
    .byte $D8   ; $BEAC
    .byte $D2   ; $BEAD
    .byte $FF   ; $BEAE
    .byte $FF   ; $BEAF
    
  ELSE
  
ColBigBirdWalking_E:
    .byte $44   ; $BE58
    .byte $44   ; $BE59
    .byte $44   ; $BE5A
    .byte $44   ; $BE5B
    .byte $86   ; $BE5C
    .byte $44   ; $BE5D
    .byte $44   ; $BE5E
    .byte $86   ; $BE5F
    .byte $44   ; $BE60
    .byte $44   ; $BE61
    .byte $2C   ; $BE62
    .byte $2C   ; $BE63
    .byte $2C   ; $BE64
    .byte $2C   ; $BE65
    .byte $2C   ; $BE66
    .byte $2C   ; $BE67
    .byte $2C   ; $BE68
    .byte $2C   ; $BE69
    .byte $2C   ; $BE6A
    .byte $2C   ; $BE6B
    .byte $2C   ; $BE6C
    .byte $2C   ; $BE6D
    .byte $2C   ; $BE6E
    .byte $2C   ; $BE6F
    .byte $2C   ; $BE70
    .byte $2C   ; $BE71
    .byte $2C   ; $BE72
    .byte $2C   ; $BE73
    .byte $2C   ; $BE74
    .byte $2C   ; $BE75
    .byte $2C   ; $BE76
    .byte $2C   ; $BE77
    .byte $2C   ; $BE78
    .byte $2C   ; $BE79
    .byte $2C   ; $BE7A
    .byte $2C   ; $BE7B
    .byte $2C   ; $BE7C
    .byte $2C   ; $BE7D
    .byte $24   ; $BE7E
    .byte $24   ; $BE7F
    .byte $24   ; $BE80
    .byte $24   ; $BE81
    .byte $FF   ; $BE82
ColBigBirdWalking_F:
    .byte $FF   ; $BE83
    .byte $44   ; $BE84
    .byte $44   ; $BE85
    .byte $44   ; $BE86
    .byte $44   ; $BE87
    .byte $44   ; $BE88
    .byte $86   ; $BE89
    .byte $44   ; $BE8A
    .byte $86   ; $BE8B
    .byte $44   ; $BE8C
    .byte $44   ; $BE8D
    .byte $2C   ; $BE8E
    .byte $2C   ; $BE8F
    .byte $2C   ; $BE90
    .byte $2C   ; $BE91
    .byte $2C   ; $BE92
    .byte $2C   ; $BE93
    .byte $2C   ; $BE94
    .byte $2C   ; $BE95
    .byte $2C   ; $BE96
    .byte $2C   ; $BE97
    .byte $2C   ; $BE98
    .byte $2C   ; $BE99
    .byte $2C   ; $BE9A
    .byte $2C   ; $BE9B
    .byte $2C   ; $BE9C
    .byte $2C   ; $BE9D
    .byte $2C   ; $BE9E
    .byte $2C   ; $BE9F
    .byte $2C   ; $BEA0
    .byte $2C   ; $BEA1
    .byte $2C   ; $BEA2
    .byte $2C   ; $BEA3
    .byte $2C   ; $BEA4
    .byte $2C   ; $BEA5
    .byte $BA   ; $BEA6
    .byte $2C   ; $BEA7
    .byte $2C   ; $BEA8
    .byte $2C   ; $BEA9
    .byte $24   ; $BEAA
    .byte $24   ; $BEAB
    .byte $24   ; $BEAC
    .byte $24   ; $BEAD
    .byte $FF   ; $BEAE
    .byte $FF   ; $BEAF

  
  ENDIF

LBEB0:  ; indirect jump
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$C4                  ; 2
    sta    COLUBK                ; 3
    stx    COLUPF                ; 3
    lda    #$30                  ; 2
    sta    PF0                   ; 3
    lda    #$B5                  ; 2
    sta    HMP1                  ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$01                  ; 2
    sta    CTRLPF                ; 3
    lda    ram_89                ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    #$20                  ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    HMP0                  ; 3
    ldy    ram_E1                ; 3
LBED8:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jsr    DelayCycles+4         ; 21
    sta    HMCLR                 ; 3
    dey                          ; 2
    bne    LBED8                 ; 2³
    ldy    ram_E2                ; 3
LBEE6:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_C3),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_C5),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_C7),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_C9),Y            ; 5
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ;2  @2
    bpl    LBEE6                 ;2³ @4/5
    jmp    LB76A                 ;3  @7

       ORG $0F00
      RORG $BF00

LBF00:
    .byte $05 ; |     X X| $BF00
    .byte $05 ; |     X X| $BF01
    .byte $05 ; |     X X| $BF02
    .byte $05 ; |     X X| $BF03
    .byte $05 ; |     X X| $BF04
    .byte $05 ; |     X X| $BF05
    .byte $05 ; |     X X| $BF06
    .byte $05 ; |     X X| $BF07
    .byte $05 ; |     X X| $BF08
    .byte $05 ; |     X X| $BF09
    .byte $05 ; |     X X| $BF0A
    .byte $05 ; |     X X| $BF0B
    .byte $05 ; |     X X| $BF0C
    .byte $05 ; |     X X| $BF0D
    .byte $05 ; |     X X| $BF0E
    .byte $05 ; |     X X| $BF0F
    .byte $05 ; |     X X| $BF10
    .byte $05 ; |     X X| $BF11
    .byte $05 ; |     X X| $BF12
    .byte $05 ; |     X X| $BF13
    .byte $05 ; |     X X| $BF14
    .byte $05 ; |     X X| $BF15
    .byte $05 ; |     X X| $BF16
    .byte $05 ; |     X X| $BF17
    .byte $05 ; |     X X| $BF18
    .byte $05 ; |     X X| $BF19
    .byte $05 ; |     X X| $BF1A
    .byte $05 ; |     X X| $BF1B
    .byte $05 ; |     X X| $BF1C
    .byte $05 ; |     X X| $BF1D
    .byte $05 ; |     X X| $BF1E
    .byte $05 ; |     X X| $BF1F
    .byte $05 ; |     X X| $BF20
    .byte $05 ; |     X X| $BF21
    .byte $05 ; |     X X| $BF22
    .byte $05 ; |     X X| $BF23
    .byte $05 ; |     X X| $BF24
    .byte $05 ; |     X X| $BF25
    .byte $05 ; |     X X| $BF26
    .byte $05 ; |     X X| $BF27
    .byte $05 ; |     X X| $BF28
    .byte $05 ; |     X X| $BF29
    .byte $05 ; |     X X| $BF2A
    .byte $05 ; |     X X| $BF2B
    .byte $05 ; |     X X| $BF2C
    .byte $05 ; |     X X| $BF2D
    .byte $05 ; |     X X| $BF2E
    .byte $05 ; |     X X| $BF2F
    .byte $05 ; |     X X| $BF30
    .byte $05 ; |     X X| $BF31
    .byte $05 ; |     X X| $BF32
    .byte $05 ; |     X X| $BF33
    .byte $05 ; |     X X| $BF34
    .byte $05 ; |     X X| $BF35
    .byte $05 ; |     X X| $BF36
    .byte $05 ; |     X X| $BF37
    .byte $05 ; |     X X| $BF38
    .byte $05 ; |     X X| $BF39
    .byte $05 ; |     X X| $BF3A
    .byte $05 ; |     X X| $BF3B
    .byte $05 ; |     X X| $BF3C
    .byte $05 ; |     X X| $BF3D
    .byte $05 ; |     X X| $BF3E
    .byte $05 ; |     X X| $BF3F
    .byte $05 ; |     X X| $BF40
    .byte $05 ; |     X X| $BF41
    .byte $05 ; |     X X| $BF42
    .byte $05 ; |     X X| $BF43
    .byte $15 ; |   X X X| $BF44
    .byte $25 ; |  X  X X| $BF45   CTRLPF
    .byte $25 ; |  X  X X| $BF46
    .byte $15 ; |   X X X| $BF47
LBF48:
    .byte $05 ; |     X X| $BF48   ENABL and HMBL (chicken egg)
    .byte $05 ; |     X X| $BF49
    .byte $05 ; |     X X| $BF4A
    .byte $05 ; |     X X| $BF4B
    .byte $05 ; |     X X| $BF4C
    .byte $05 ; |     X X| $BF4D
    .byte $05 ; |     X X| $BF4E
    .byte $05 ; |     X X| $BF4F
    .byte $05 ; |     X X| $BF50
    .byte $05 ; |     X X| $BF51
    .byte $05 ; |     X X| $BF52
    .byte $05 ; |     X X| $BF53
    .byte $05 ; |     X X| $BF54
    .byte $05 ; |     X X| $BF55
    .byte $05 ; |     X X| $BF56
    .byte $05 ; |     X X| $BF57
    .byte $05 ; |     X X| $BF58
    .byte $05 ; |     X X| $BF59
    .byte $05 ; |     X X| $BF5A
    .byte $05 ; |     X X| $BF5B
    .byte $05 ; |     X X| $BF5C
    .byte $05 ; |     X X| $BF5D
    .byte $05 ; |     X X| $BF5E
    .byte $05 ; |     X X| $BF5F
    .byte $05 ; |     X X| $BF60
    .byte $05 ; |     X X| $BF61
    .byte $05 ; |     X X| $BF62
    .byte $05 ; |     X X| $BF63
    .byte $05 ; |     X X| $BF64
    .byte $05 ; |     X X| $BF65
    .byte $05 ; |     X X| $BF66
    .byte $05 ; |     X X| $BF67
    .byte $05 ; |     X X| $BF68
    .byte $05 ; |     X X| $BF69
    .byte $05 ; |     X X| $BF6A
    .byte $05 ; |     X X| $BF6B
    .byte $05 ; |     X X| $BF6C
    .byte $05 ; |     X X| $BF6D
    .byte $05 ; |     X X| $BF6E
    .byte $05 ; |     X X| $BF6F
    .byte $05 ; |     X X| $BF70
    .byte $05 ; |     X X| $BF71
    .byte $05 ; |     X X| $BF72
    .byte $05 ; |     X X| $BF73
    .byte $05 ; |     X X| $BF74
    .byte $05 ; |     X X| $BF75
    .byte $05 ; |     X X| $BF76
    .byte $05 ; |     X X| $BF77
    .byte $05 ; |     X X| $BF78
    .byte $05 ; |     X X| $BF79
    .byte $05 ; |     X X| $BF7A
    .byte $05 ; |     X X| $BF7B
    .byte $05 ; |     X X| $BF7C
    .byte $05 ; |     X X| $BF7D
    .byte $05 ; |     X X| $BF7E
    .byte $05 ; |     X X| $BF7F
    .byte $05 ; |     X X| $BF80
    .byte $05 ; |     X X| $BF81
    .byte $05 ; |     X X| $BF82
    .byte $05 ; |     X X| $BF83
    .byte $05 ; |     X X| $BF84
    .byte $05 ; |     X X| $BF85
    .byte $05 ; |     X X| $BF86
    .byte $05 ; |     X X| $BF87
    .byte $05 ; |     X X| $BF88
    .byte $05 ; |     X X| $BF89
    .byte $05 ; |     X X| $BF8A
    .byte $05 ; |     X X| $BF8B
    .byte $02 ; |      X | $BF8C
    .byte $F2 ; |XXXX  X | $BF8D
    .byte $02 ; |      X | $BF8E
    .byte $12 ; |   X  X | $BF8F
LBF90:
    .byte $00 ; |        | $BF90
    .byte $00 ; |        | $BF91
    .byte $00 ; |        | $BF92
    .byte $00 ; |        | $BF93
    .byte $00 ; |        | $BF94
    .byte $00 ; |        | $BF95
    .byte $00 ; |        | $BF96
    .byte $00 ; |        | $BF97
    .byte $00 ; |        | $BF98
    .byte $00 ; |        | $BF99
    .byte $00 ; |        | $BF9A
    .byte $00 ; |        | $BF9B
    .byte $00 ; |        | $BF9C
    .byte $00 ; |        | $BF9D
    .byte $00 ; |        | $BF9E
    .byte $00 ; |        | $BF9F
    .byte $00 ; |        | $BFA0
    .byte $00 ; |        | $BFA1
    .byte $00 ; |        | $BFA2
    .byte $00 ; |        | $BFA3
    .byte $00 ; |        | $BFA4
    .byte $00 ; |        | $BFA5
    .byte $00 ; |        | $BFA6
    .byte $00 ; |        | $BFA7
    .byte $00 ; |        | $BFA8
    .byte $00 ; |        | $BFA9
    .byte $00 ; |        | $BFAA
    .byte $00 ; |        | $BFAB
    .byte $00 ; |        | $BFAC
    .byte $00 ; |        | $BFAD
    .byte $00 ; |        | $BFAE
    .byte $00 ; |        | $BFAF
    .byte $00 ; |        | $BFB0
    .byte $00 ; |        | $BFB1
    .byte $00 ; |        | $BFB2
    .byte $00 ; |        | $BFB3
    .byte $00 ; |        | $BFB4
    .byte $00 ; |        | $BFB5
    .byte $00 ; |        | $BFB6
    .byte $00 ; |        | $BFB7
    .byte $00 ; |        | $BFB8
    .byte $00 ; |        | $BFB9
    .byte $00 ; |        | $BFBA
    .byte $00 ; |        | $BFBB
    .byte $00 ; |        | $BFBC
    .byte $00 ; |        | $BFBD
    .byte $00 ; |        | $BFBE
    .byte $00 ; |        | $BFBF
    .byte $00 ; |        | $BFC0
    .byte $00 ; |        | $BFC1
    .byte $00 ; |        | $BFC2
    .byte $00 ; |        | $BFC3
    .byte $00 ; |        | $BFC4
    .byte $00 ; |        | $BFC5
    .byte $00 ; |        | $BFC6
    .byte $00 ; |        | $BFC7
    .byte $00 ; |        | $BFC8
    .byte $00 ; |        | $BFC9
    .byte $00 ; |        | $BFCA
    .byte $00 ; |        | $BFCB
    .byte $00 ; |        | $BFCC
    .byte $00 ; |        | $BFCD
    .byte $00 ; |        | $BFCE
    .byte $00 ; |        | $BFCF
    .byte $00 ; |        | $BFD0
    .byte $00 ; |        | $BFD1

    .byte $00 ; |        | $BFD2  unused?
    .byte $00 ; |        | $BFD3  unused?

NestColors:
    .byte $14   ; $BFD4
    .byte $16   ; $BFD5
    .byte $14   ; $BFD6
    .byte $16   ; $BFD7
    .byte $18   ; $BFD8  unused

NestGfx:
    .byte $28 ; |  X X   | $BFD9
    .byte $95 ; |X  X X X| $BFDA
    .byte $5A ; | X XX X | $BFDB
    .byte $A5 ; |X X  X X| $BFDC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;DelayCycles x17

DelayCycles SUBROUTINE
    .byte $24 ; BIT opcode       ;    @21 cycles delay...
    nop                          ;+1  @20
    .byte $24 ; BIT opcode       ;+2  @18
    nop                          ;+3  @17
    .byte $24 ; BIT opcode       ;+4  @15
    nop                          ;+5  @14
    .byte $24 ; BIT opcode       ;+6  @12
    nop                          ;+7  @11
    .byte $24 ; BIT opcode       ;+8  @9
    nop                          ;+9  @8
    rts                          ;+10 @6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $0FE8
      RORG $BFE8

START_0:
    lda    #>START_1             ; 2
    sta    ram_99                ; 3
    lda    #<START_1             ; 2
    sta    ram_98                ; 3
LBFF0:
    cmp    BANK_1                ; 4   bankswitch

;coming from bank 1
    jmp.ind ($0098)              ; 5

    .byte $00 ; |        | $BFF6
    .byte $00 ; |        | $BFF7
    .byte $00 ; |        | $BFF8
    .byte $00 ; |        | $BFF9

    .word START_0
    .word START_0
    .word START_0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $F000

LF000:
    .byte $00 ; |        | $F000
LF001:
    .byte $00 ; |        | $F001
    .byte $00 ; |        | $F002
    .byte $00 ; |        | $F003
    .byte $0F ; |    XXXX| $F004
    .byte $0C ; |    XX  | $F005
    .byte $11 ; |   X   X| $F006
    .byte $0C ; |    XX  | $F007
    .byte $13 ; |   X  XX| $F008
    .byte $0C ; |    XX  | $F009
    .byte $14 ; |   X X  | $F00A
    .byte $0C ; |    XX  | $F00B
    .byte $17 ; |   X XXX| $F00C
    .byte $0C ; |    XX  | $F00D
    .byte $1A ; |   XX X | $F00E
    .byte $0C ; |    XX  | $F00F
    .byte $1D ; |   XXX X| $F010
    .byte $0C ; |    XX  | $F011
    .byte $1F ; |   XXXXX| $F012
    .byte $0C ; |    XX  | $F013
    .byte $19 ; |   XX  X| $F014
    .byte $01 ; |       X| $F015
    .byte $1C ; |   XXX  | $F016
    .byte $01 ; |       X| $F017
    .byte $1F ; |   XXXXX| $F018
    .byte $01 ; |       X| $F019
    .byte $14 ; |   X X  | $F01A
    .byte $01 ; |       X| $F01B
    .byte $17 ; |   X XXX| $F01C
    .byte $01 ; |       X| $F01D
    .byte $12 ; |   X  X | $F01E
    .byte $01 ; |       X| $F01F
LF020:
    .byte $00 ; |        | $F020
    .byte $00 ; |        | $F021
    .byte $23 ; |  X   XX| $F022
    .byte $45 ; | X   X X| $F023
    .byte $43 ; | X    XX| $F024
    .byte $47 ; | X   XXX| $F025
    .byte $98 ; |X  XX   | $F026
    .byte $76 ; | XXX XX | $F027
    .byte $79 ; | XXXX  X| $F028
    .byte $71 ; | XXX   X| $F029
    .byte $00 ; |        | $F02A
    .byte $43 ; | X    XX| $F02B
    .byte $21 ; |  X    X| $F02C
    .byte $21 ; |  X    X| $F02D
    .byte $23 ; |  X   XX| $F02E
    .byte $43 ; | X    XX| $F02F
    .byte $21 ; |  X    X| $F030
    .byte $31 ; |  XX   X| $F031
    .byte $31 ; |  XX   X| $F032
    .byte $00 ; |        | $F033
    .byte $43 ; | X    XX| $F034
    .byte $21 ; |  X    X| $F035
    .byte $21 ; |  X    X| $F036
    .byte $23 ; |  X   XX| $F037
    .byte $43 ; | X    XX| $F038
    .byte $21 ; |  X    X| $F039
    .byte $31 ; |  XX   X| $F03A
    .byte $41 ; | X     X| $F03B
    .byte $00 ; |        | $F03C
    .byte $97 ; |X  X XXX| $F03D
    .byte $19 ; |   XX  X| $F03E
    .byte $71 ; | XXX   X| $F03F
    .byte $71 ; | XXX   X| $F040
    .byte $97 ; |X  X XXX| $F041
    .byte $19 ; |   XX  X| $F042
    .byte $77 ; | XXX XXX| $F043
    .byte $11 ; |   X   X| $F044
    .byte $00 ; |        | $F045
    .byte $86 ; |X    XX | $F046
    .byte $18 ; |   XX   | $F047
    .byte $61 ; | XX    X| $F048
    .byte $61 ; | XX    X| $F049
    .byte $86 ; |X    XX | $F04A
    .byte $18 ; |   XX   | $F04B
    .byte $61 ; | XX    X| $F04C
    .byte $00 ; |        | $F04D
    .byte $65 ; | XX  X X| $F04E
    .byte $41 ; | X     X| $F04F
    .byte $41 ; | X     X| $F050
    .byte $71 ; | XXX   X| $F051
    .byte $71 ; | XXX   X| $F052
    .byte $21 ; |  X    X| $F053
    .byte $21 ; |  X    X| $F054
    .byte $31 ; |  XX   X| $F055
    .byte $00 ; |        | $F056
    .byte $43 ; | X    XX| $F057
    .byte $21 ; |  X    X| $F058
    .byte $21 ; |  X    X| $F059
    .byte $23 ; |  X   XX| $F05A
    .byte $43 ; | X    XX| $F05B
    .byte $21 ; |  X    X| $F05C
    .byte $31 ; |  XX   X| $F05D
    .byte $41 ; | X     X| $F05E
    .byte $00 ; |        | $F05F
    .byte $CB ; |XX  X XX| $F060
    .byte $A1 ; |X X    X| $F061
    .byte $A1 ; |X X    X| $F062
    .byte $AB ; |X X X XX| $F063
    .byte $CB ; |XX  X XX| $F064
    .byte $A1 ; |X X    X| $F065
    .byte $B1 ; |X XX   X| $F066
    .byte $B1 ; |X XX   X| $F067
    .byte $00 ; |        | $F068
    .byte $CB ; |XX  X XX| $F069
    .byte $A1 ; |X X    X| $F06A
    .byte $D1 ; |XX X   X| $F06B
    .byte $DA ; |XX XX X | $F06C
    .byte $CB ; |XX  X XX| $F06D
    .byte $A1 ; |X X    X| $F06E
    .byte $B1 ; |X XX   X| $F06F
    .byte $C1 ; |XX     X| $F070
    .byte $00 ; |        | $F071
    .byte $EF ; |XXX XXXX| $F072
    .byte $1E ; |   XXXX | $F073
    .byte $F1 ; |XXXX   X| $F074
    .byte $F1 ; |XXXX   X| $F075
    .byte $EF ; |XXX XXXX| $F076
    .byte $1E ; |   XXXX | $F077
    .byte $F1 ; |XXXX   X| $F078
    .byte $00 ; |        | $F079
    .byte $CB ; |XX  X XX| $F07A
    .byte $A1 ; |X X    X| $F07B
    .byte $D1 ; |XX X   X| $F07C
    .byte $DA ; |XX XX X | $F07D
    .byte $CB ; |XX  X XX| $F07E
    .byte $A1 ; |X X    X| $F07F
    .byte $B1 ; |X XX   X| $F080
    .byte $C1 ; |XX     X| $F081
    .byte $00 ; |        | $F082
    .byte $98 ; |X  XX   | $F083
    .byte $79 ; | XXXX  X| $F084
    .byte $76 ; | XXX XX | $F085
    .byte $71 ; | XXX   X| $F086
    .byte $87 ; |X    XXX| $F087
    .byte $68 ; | XX X   | $F088
    .byte $65 ; | XX  X X| $F089
    .byte $61 ; | XX    X| $F08A
    .byte $43 ; | X    XX| $F08B
    .byte $21 ; |  X    X| $F08C
    .byte $21 ; |  X    X| $F08D
    .byte $23 ; |  X   XX| $F08E
    .byte $43 ; | X    XX| $F08F
    .byte $24 ; |  X  X  | $F090
    .byte $35 ; |  XX X X| $F091
    .byte $41 ; | X     X| $F092
    .byte $00 ; |        | $F093
LF094:
    .byte $00 ; |        | $F094
LF095:
    .byte $00 ; |        | $F095
    .byte $1F ; |   XXXXX| $F096
    .byte $80 ; |X       | $F097
    .byte $CC ; |XX  XX  | $F098
    .byte $D3 ; |XX X  XX| $F099
    .byte $0C ; |    XX  | $F09A
    .byte $D3 ; |XX X  XX| $F09B
    .byte $0C ; |    XX  | $F09C
    .byte $53 ; | X X  XX| $F09D
    .byte $CC ; |XX  XX  | $F09E
    .byte $59 ; | X XX  X| $F09F
    .byte $0C ; |    XX  | $F0A0
    .byte $99 ; |X  XX  X| $F0A1
    .byte $CC ; |XX  XX  | $F0A2
    .byte $99 ; |X  XX  X| $F0A3
    .byte $CC ; |XX  XX  | $F0A4
    .byte $9F ; |X  XXXXX| $F0A5
    .byte $CC ; |XX  XX  | $F0A6
    .byte $D3 ; |XX X  XX| $F0A7
    .byte $CC ; |XX  XX  | $F0A8
    .byte $D3 ; |XX X  XX| $F0A9
    .byte $CC ; |XX  XX  | $F0AA
    .byte $D3 ; |XX X  XX| $F0AB
    .byte $00 ; |        | $F0AC
    .byte $09 ; |    X  X| $F0AD
    .byte $80 ; |X       | $F0AE
    .byte $CC ; |XX  XX  | $F0AF
    .byte $C9 ; |XX  X  X| $F0B0
    .byte $0C ; |    XX  | $F0B1
    .byte $C9 ; |XX  X  X| $F0B2
    .byte $CC ; |XX  XX  | $F0B3
    .byte $87 ; |X    XXX| $F0B4
    .byte $0C ; |    XX  | $F0B5
    .byte $87 ; |X    XXX| $F0B6
    .byte $CC ; |XX  XX  | $F0B7
    .byte $C9 ; |XX  X  X| $F0B8
    .byte $CC ; |XX  XX  | $F0B9
    .byte $C9 ; |XX  X  X| $F0BA
    .byte $CC ; |XX  XX  | $F0BB
    .byte $C9 ; |XX  X  X| $F0BC
    .byte $CC ; |XX  XX  | $F0BD
    .byte $C9 ; |XX  X  X| $F0BE
    .byte $CC ; |XX  XX  | $F0BF
    .byte $49 ; | X  X  X| $F0C0
    .byte $00 ; |        | $F0C1
    .byte $D9 ; |XX XX  X| $F0C2
    .byte $48 ; | X  X   | $F0C3
    .byte $D9 ; |XX XX  X| $F0C4
    .byte $49 ; | X  X  X| $F0C5
    .byte $D9 ; |XX XX  X| $F0C6
    .byte $4A ; | X  X X | $F0C7
    .byte $D9 ; |XX XX  X| $F0C8
    .byte $4B ; | X  X XX| $F0C9
    .byte $99 ; |X  XX  X| $F0CA
    .byte $4C ; | X  XX  | $F0CB
    .byte $99 ; |X  XX  X| $F0CC
    .byte $4D ; | X  XX X| $F0CD
    .byte $99 ; |X  XX  X| $F0CE
    .byte $4E ; | X  XXX | $F0CF
    .byte $89 ; |X   X  X| $F0D0
    .byte $4F ; | X  XXXX| $F0D1
    .byte $00 ; |        | $F0D2
    .byte $81 ; |X      X| $F0D3
    .byte $5F ; | X XXXXX| $F0D4
    .byte $71 ; | XXX   X| $F0D5
    .byte $5F ; | X XXXXX| $F0D6
    .byte $61 ; | XX    X| $F0D7
    .byte $5F ; | X XXXXX| $F0D8
    .byte $51 ; | X X   X| $F0D9
    .byte $5F ; | X XXXXX| $F0DA
    .byte $41 ; | X     X| $F0DB
    .byte $5F ; | X XXXXX| $F0DC
    .byte $31 ; |  XX   X| $F0DD
    .byte $5F ; | X XXXXX| $F0DE
    .byte $21 ; |  X    X| $F0DF
    .byte $5F ; | X XXXXX| $F0E0
    .byte $21 ; |  X    X| $F0E1
    .byte $5F ; | X XXXXX| $F0E2
    .byte $00 ; |        | $F0E3
    .byte $7B ; | XXXX XX| $F0E4
    .byte $30 ; |  XX    | $F0E5
    .byte $6B ; | XX X XX| $F0E6
    .byte $30 ; |  XX    | $F0E7
    .byte $5B ; | X XX XX| $F0E8
    .byte $30 ; |  XX    | $F0E9

    .byte $00 ; |        | $F0EA
    .byte $B9 ; |X XXX  X| $F0EB
    .byte $46 ; | X   XX | $F0EC
    .byte $B9 ; |X XXX  X| $F0ED
    .byte $45 ; | X   X X| $F0EE
    .byte $B9 ; |X XXX  X| $F0EF
    .byte $44 ; | X   X  | $F0F0
    .byte $B9 ; |X XXX  X| $F0F1
    .byte $43 ; | X    XX| $F0F2
    .byte $B9 ; |X XXX  X| $F0F3
    .byte $42 ; | X    X | $F0F4
    .byte $B9 ; |X XXX  X| $F0F5
    .byte $41 ; | X     X| $F0F6
    .byte $B9 ; |X XXX  X| $F0F7
    .byte $40 ; | X      | $F0F8
    .byte $B9 ; |X XXX  X| $F0F9
    .byte $42 ; | X    X | $F0FA
    .byte $B9 ; |X XXX  X| $F0FB
    .byte $43 ; | X    XX| $F0FC
    .byte $B9 ; |X XXX  X| $F0FD

    .byte $44 ; | X   X  | $F0FE
    .byte $00 ; |        | $F0FF
    .byte $59 ; | X XX  X| $F100
    .byte $47 ; | X   XXX| $F101
    .byte $59 ; | X XX  X| $F102
    .byte $46 ; | X   XX | $F103
    .byte $59 ; | X XX  X| $F104
    .byte $45 ; | X   X X| $F105
    .byte $59 ; | X XX  X| $F106
    .byte $43 ; | X    XX| $F107
    .byte $00 ; |        | $F108
    .byte $59 ; | X XX  X| $F109
    .byte $24 ; |  X  X  | $F10A
    .byte $00 ; |        | $F10B
    .byte $59 ; | X XX  X| $F10C
    .byte $25 ; |  X  X X| $F10D
    .byte $00 ; |        | $F10E
    .byte $59 ; | X XX  X| $F10F
    .byte $26 ; |  X  XX | $F110
    .byte $00 ; |        | $F111
    .byte $59 ; | X XX  X| $F112
    .byte $27 ; |  X  XXX| $F113
    .byte $00 ; |        | $F114
LF115:
    .byte $00 ; |        | $F115
    .byte $03 ; |      XX| $F116
    .byte $02 ; |      X | $F117
    .byte $02 ; |      X | $F118
    .byte $02 ; |      X | $F119
    .byte $02 ; |      X | $F11A
    .byte $02 ; |      X | $F11B
    .byte $02 ; |      X | $F11C
    .byte $03 ; |      XX| $F11D
    .byte $00 ; |        | $F11E
    .byte $00 ; |        | $F11F
    .byte $00 ; |        | $F120
    .byte $00 ; |        | $F121
    .byte $00 ; |        | $F122
    .byte $00 ; |        | $F123
    .byte $00 ; |        | $F124
    .byte $00 ; |        | $F125
    .byte $00 ; |        | $F126
    .byte $00 ; |        | $F127
    .byte $00 ; |        | $F128
    .byte $00 ; |        | $F129
    .byte $00 ; |        | $F12A
    .byte $01 ; |       X| $F12B
    .byte $00 ; |        | $F12C
    .byte $00 ; |        | $F12D
    .byte $F5 ; |XXXX X X| $F12E
    .byte $95 ; |X  X X X| $F12F
    .byte $95 ; |X  X X X| $F130
    .byte $95 ; |X  X X X| $F131
    .byte $F5 ; |XXXX X X| $F132
    .byte $A0 ; |X X     | $F133
    .byte $A4 ; |X X  X  | $F134
    .byte $E0 ; |XXX     | $F135
LF136:
    .byte $00 ; |        | $F136
    .byte $3B ; |  XXX XX| $F137
    .byte $28 ; |  X X   | $F138
    .byte $38 ; |  XXX   | $F139
    .byte $20 ; |  X     | $F13A
    .byte $B8 ; |X XXX   | $F13B
    .byte $00 ; |        | $F13C
    .byte $00 ; |        | $F13D
    .byte $03 ; |      XX| $F13E
    .byte $80 ; |X       | $F13F
    .byte $00 ; |        | $F140
    .byte $00 ; |        | $F141
    .byte $BC ; |X XXXX  | $F142
    .byte $84 ; |X    X  | $F143
    .byte $84 ; |X    X  | $F144
    .byte $84 ; |X    X  | $F145
    .byte $9C ; |X  XXX  | $F146
    .byte $04 ; |     X  | $F147
    .byte $04 ; |     X  | $F148
    .byte $3C ; |  XXXX  | $F149
    .byte $00 ; |        | $F14A
    .byte $00 ; |        | $F14B
    .byte $03 ; |      XX| $F14C
    .byte $02 ; |      X | $F14D
    .byte $02 ; |      X | $F14E
    .byte $F3 ; |XXXX  XX| $F14F
    .byte $92 ; |X  X  X | $F150
    .byte $92 ; |X  X  X | $F151
    .byte $92 ; |X  X  X | $F152
    .byte $F3 ; |XXXX  XX| $F153
    .byte $50 ; | X X    | $F154
    .byte $50 ; | X X    | $F155
    .byte $70 ; | XXX    | $F156
LF157:
    .byte $00 ; |        | $F157
    .byte $DD ; |XX XXX X| $F158
    .byte $91 ; |X  X   X| $F159
    .byte $91 ; |X  X   X| $F15A
    .byte $91 ; |X  X   X| $F15B
    .byte $DD ; |XX XXX X| $F15C
    .byte $81 ; |X      X| $F15D
    .byte $81 ; |X      X| $F15E
    .byte $01 ; |       X| $F15F
    .byte $DC ; |XX XXX  | $F160
    .byte $44 ; | X   X  | $F161
    .byte $44 ; | X   X  | $F162
    .byte $DC ; |XX XXX  | $F163
    .byte $54 ; | X X X  | $F164
    .byte $54 ; | X X X  | $F165
    .byte $54 ; | X X X  | $F166
    .byte $DC ; |XX XXX  | $F167
    .byte $00 ; |        | $F168
    .byte $00 ; |        | $F169
    .byte $00 ; |        | $F16A
    .byte $00 ; |        | $F16B
    .byte $00 ; |        | $F16C
    .byte $00 ; |        | $F16D
    .byte $00 ; |        | $F16E
    .byte $00 ; |        | $F16F
    .byte $51 ; | X X   X| $F170
    .byte $51 ; | X X   X| $F171
    .byte $51 ; | X X   X| $F172
    .byte $55 ; | X X X X| $F173
    .byte $5D ; | X XXX X| $F174
    .byte $00 ; |        | $F175
    .byte $40 ; | X      | $F176
    .byte $00 ; |        | $F177
LF178:
    .byte $00 ; |        | $F178
    .byte $02 ; |      X | $F179
    .byte $02 ; |      X | $F17A
    .byte $02 ; |      X | $F17B
    .byte $02 ; |      X | $F17C
    .byte $03 ; |      XX| $F17D
    .byte $00 ; |        | $F17E
    .byte $00 ; |        | $F17F
    .byte $00 ; |        | $F180
    .byte $00 ; |        | $F181
    .byte $00 ; |        | $F182
    .byte $00 ; |        | $F183
    .byte $00 ; |        | $F184
    .byte $00 ; |        | $F185
    .byte $00 ; |        | $F186
    .byte $00 ; |        | $F187
    .byte $00 ; |        | $F188
    .byte $00 ; |        | $F189
    .byte $00 ; |        | $F18A
    .byte $00 ; |        | $F18B
    .byte $00 ; |        | $F18C
    .byte $00 ; |        | $F18D
    .byte $00 ; |        | $F18E
    .byte $00 ; |        | $F18F
    .byte $00 ; |        | $F190
    .byte $73 ; | XXX  XX| $F191
    .byte $42 ; | X    X | $F192
    .byte $72 ; | XXX  X | $F193
    .byte $12 ; |   X  X | $F194
    .byte $73 ; | XXX  XX| $F195
    .byte $02 ; |      X | $F196
    .byte $0A ; |    X X | $F197
    .byte $0A ; |    X X | $F198
LF199:
    .byte $78 ; | XXXX   | $F199
    .byte $84 ; |X    X  | $F19A
    .byte $B4 ; |X XX X  | $F19B
    .byte $A4 ; |X X  X  | $F19C
    .byte $B4 ; |X XX X  | $F19D
    .byte $84 ; |X    X  | $F19E
    .byte $78 ; | XXXX   | $F19F
LF1A0:
    .byte $12 ; |   X  X | $F1A0
    .byte $15 ; |   X X X| $F1A1
    .byte $11 ; |   X   X| $F1A2
    .byte $13 ; |   X  XX| $F1A3
    .byte $15 ; |   X X X| $F1A4
    .byte $35 ; |  XX X X| $F1A5
    .byte $12 ; |   X  X | $F1A6
LF1A7:
    .byte $22 ; |  X   X | $F1A7
    .byte $55 ; | X X X X| $F1A8
    .byte $51 ; | X X   X| $F1A9
    .byte $22 ; |  X   X | $F1AA
    .byte $51 ; | X X   X| $F1AB
    .byte $55 ; | X X X X| $F1AC
    .byte $22 ; |  X   X | $F1AD

    .byte $55 ; | X X X X| $F1AE
    .byte $55 ; | X X X X| $F1AF
    .byte $55 ; | X X X X| $F1B0
    .byte $75 ; | XXX X X| $F1B1
    .byte $55 ; | X X X X| $F1B2
    .byte $55 ; | X X X X| $F1B3
    .byte $2E ; |  X XXX | $F1B4

    .byte $55 ; | X X X X| $F1B5
    .byte $55 ; | X X X X| $F1B6
    .byte $55 ; | X X X X| $F1B7
    .byte $D9 ; |XX XX  X| $F1B8
    .byte $55 ; | X X X X| $F1B9
    .byte $55 ; | X X X X| $F1BA
    .byte $99 ; |X  XX  X| $F1BB

    .byte $31 ; |  XX   X| $F1BC
    .byte $4A ; | X  X X | $F1BD
    .byte $42 ; | X    X | $F1BE
    .byte $42 ; | X    X | $F1BF
    .byte $42 ; | X    X | $F1C0
    .byte $4A ; | X  X X | $F1C1
    .byte $31 ; |  XX   X| $F1C2

    .byte $8A ; |X   X X | $F1C3
    .byte $55 ; | X X X X| $F1C4
    .byte $15 ; |   X X X| $F1C5
    .byte $15 ; |   X X X| $F1C6
    .byte $11 ; |   X   X| $F1C7
    .byte $51 ; | X X   X| $F1C8
    .byte $91 ; |X  X   X| $F1C9

LF1CA:  ; indirect jump also
    ldx    INTIM                 ; 4
    bne    LF1CA                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$D3                  ; 2
    sta    HMP0                  ; 3
    sta    NUSIZ0                ; 3
    lda    #$E1                  ; 2
    sta    HMP1                  ; 3
    sta    NUSIZ1                ; 3
    sta    CTRLPF                ; 3
    lda    ram_E0                ; 3
    sta    COLUPF                ; 3
    lda    ram_E1                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    bit    ram_80                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    bmi    LF1F7                 ; 2³
    lda    #$AE                  ; 2
    ldx    #$B5                  ; 2
    bne    LF1FB                 ; 3   always branch

LF1F7:
    lda    #$BC                  ; 2
    ldx    #$C3                  ; 2
LF1FB:
    sta    ram_D9                ; 3
    stx    ram_DB                ; 3
    lda    #$F1                  ; 2
    sta    ram_DA                ; 3
    sta    ram_DC                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    #$18                  ; 2
LF20B:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    lda    ram_DF                ; 3
    sta    COLUBK                ; 3
    dey                          ; 2
    bne    LF20B                 ; 2³
    ldx    #$20                  ; 2
LF218:
    ldy    #$03                  ; 2
LF21A:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LF115,X               ; 4
    sta    PF1                   ; 3
    lda    LF136,X               ; 4
    sta    PF2                   ; 3
    pha                          ; 3
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    LF178,X               ; 4
    sta    PF1                   ; 3
    lda    LF157,X               ; 4
    sta    PF2                   ; 3
    dey                          ; 2
    bpl    LF21A                 ; 2³
    dex                          ; 2
    bpl    LF218                 ; 2³
    ldy    #$1F                  ; 2
LF23F:
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    ram_DD                ; 3
    cpy    #$07                  ; 2
    bcs    LF263                 ; 2³
    nop                          ; 2
    lda    LF199,Y               ; 4
    sta    GRP0                  ; 3
    lda    (ram_D9),Y            ; 5
    sta    GRP1                  ; 3
    lda    LF1A7,Y               ; 4
    sta    ram_DE                ; 3
    ldx    LF1A0,Y               ; 4
    lda    (ram_DB),Y            ; 5
    ldy    ram_DE                ; 3
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    sty    GRP0                  ; 3
LF263:
    ldy    ram_DD                ; 3
    dey                          ; 2
    bpl    LF23F                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    iny                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    jmp    LF415                 ; 3

LF272:
    .byte $E0 ; |XXX     | $F272
    .byte $A0 ; |X X     | $F273
    .byte $A0 ; |X X     | $F274
    .byte $A0 ; |X X     | $F275
    .byte $E0 ; |XXX     | $F276
    .byte $40 ; | X      | $F277
    .byte $40 ; | X      | $F278
    .byte $40 ; | X      | $F279
    .byte $40 ; | X      | $F27A
    .byte $40 ; | X      | $F27B
    .byte $E0 ; |XXX     | $F27C
    .byte $80 ; |X       | $F27D
    .byte $E0 ; |XXX     | $F27E
    .byte $20 ; |  X     | $F27F
    .byte $E0 ; |XXX     | $F280
    .byte $E0 ; |XXX     | $F281
    .byte $20 ; |  X     | $F282
    .byte $60 ; | XX     | $F283
    .byte $20 ; |  X     | $F284
    .byte $E0 ; |XXX     | $F285
    .byte $20 ; |  X     | $F286
    .byte $20 ; |  X     | $F287
    .byte $E0 ; |XXX     | $F288
    .byte $A0 ; |X X     | $F289
    .byte $A0 ; |X X     | $F28A
    .byte $E0 ; |XXX     | $F28B
    .byte $20 ; |  X     | $F28C
    .byte $E0 ; |XXX     | $F28D
    .byte $80 ; |X       | $F28E
    .byte $E0 ; |XXX     | $F28F
    .byte $E0 ; |XXX     | $F290
    .byte $A0 ; |X X     | $F291
    .byte $E0 ; |XXX     | $F292
    .byte $80 ; |X       | $F293
    .byte $80 ; |X       | $F294
    .byte $20 ; |  X     | $F295
    .byte $20 ; |  X     | $F296
    .byte $20 ; |  X     | $F297
    .byte $20 ; |  X     | $F298
    .byte $E0 ; |XXX     | $F299
    .byte $E0 ; |XXX     | $F29A
    .byte $A0 ; |X X     | $F29B
    .byte $E0 ; |XXX     | $F29C
    .byte $A0 ; |X X     | $F29D
    .byte $E0 ; |XXX     | $F29E
    .byte $20 ; |  X     | $F29F
    .byte $20 ; |  X     | $F2A0
    .byte $E0 ; |XXX     | $F2A1
    .byte $A0 ; |X X     | $F2A2
    .byte $E0 ; |XXX     | $F2A3
    .byte $00 ; |        | $F2A4
    .byte $00 ; |        | $F2A5
    .byte $00 ; |        | $F2A6
    .byte $00 ; |        | $F2A7
    .byte $00 ; |        | $F2A8
    .byte $40 ; | X      | $F2A9
    .byte $40 ; | X      | $F2AA
    .byte $E0 ; |XXX     | $F2AB
    .byte $40 ; | X      | $F2AC
LF2AD:
    .byte $40 ; | X      | $F2AD
LF2AE:
    .byte $00 ; |        | $F2AE
    .byte $03 ; |      XX| $F2AF
    .byte $06 ; |     XX | $F2B0
    .byte $09 ; |    X  X| $F2B1
    .byte $0C ; |    XX  | $F2B2
    .byte $0F ; |    XXXX| $F2B3
    .byte $12 ; |   X  X | $F2B4
    .byte $19 ; |   XX  X| $F2B5
    .byte $1E ; |   XXXX | $F2B6
    .byte $24 ; |  X  X  | $F2B7
    .byte $2A ; |  X X X | $F2B8
LF2B9:
    .byte $00 ; |        | $F2B9
LF2BA:
    .byte $00 ; |        | $F2BA
    .byte $00 ; |        | $F2BB
    .byte $00 ; |        | $F2BC
    .byte $09 ; |    X  X| $F2BD
    .byte $00 ; |        | $F2BE
    .byte $8A ; |X   X X | $F2BF
    .byte $00 ; |        | $F2C0
    .byte $4B ; | X  X XX| $F2C1
    .byte $00 ; |        | $F2C2
    .byte $54 ; | X X X  | $F2C3
    .byte $00 ; |        | $F2C4
    .byte $8A ; |X   X X | $F2C5
    .byte $08 ; |    X   | $F2C6
    .byte $4B ; | X  X XX| $F2C7
    .byte $0C ; |    XX  | $F2C8
    .byte $54 ; | X X X  | $F2C9
    .byte $0C ; |    XX  | $F2CA
    .byte $01 ; |       X| $F2CB
    .byte $02 ; |      X | $F2CC
    .byte $8A ; |X   X X | $F2CD
    .byte $06 ; |     XX | $F2CE
    .byte $54 ; | X X X  | $F2CF
    .byte $0C ; |    XX  | $F2D0
    .byte $01 ; |       X| $F2D1
    .byte $04 ; |     X  | $F2D2
    .byte $8A ; |X   X X | $F2D3
    .byte $0A ; |    X X | $F2D4
    .byte $53 ; | X X  XX| $F2D5
    .byte $0E ; |    XXX | $F2D6
    .byte $4B ; | X  X XX| $F2D7
    .byte $10 ; |   X    | $F2D8
    .byte $54 ; | X X X  | $F2D9
    .byte $18 ; |   XX   | $F2DA
    .byte $5C ; | X XXX  | $F2DB
    .byte $1A ; |   XX X | $F2DC
    .byte $4C ; | X  XX  | $F2DD
    .byte $16 ; |   X XX | $F2DE
    .byte $54 ; | X X X  | $F2DF
    .byte $22 ; |  X   X | $F2E0
    .byte $5C ; | X XXX  | $F2E1
    .byte $20 ; |  X     | $F2E2
    .byte $64 ; | XX  X  | $F2E3
    .byte $1E ; |   XXXX | $F2E4
    .byte $6C ; | XX XX  | $F2E5
    .byte $1C ; |   XXX  | $F2E6
    .byte $74 ; | XXX X  | $F2E7
    .byte $1A ; |   XX X | $F2E8
    .byte $7C ; | XXXXX  | $F2E9
    .byte $18 ; |   XX   | $F2EA
    .byte $DD ; |XX XXX X| $F2EB
    .byte $26 ; |  X  XX | $F2EC
    .byte $E5 ; |XXX  X X| $F2ED
    .byte $26 ; |  X  XX | $F2EE
    .byte $ED ; |XXX XX X| $F2EF
    .byte $26 ; |  X  XX | $F2F0
    .byte $F5 ; |XXXX X X| $F2F1
    .byte $26 ; |  X  XX | $F2F2
    .byte $FD ; |XXXXXX X| $F2F3
    .byte $26 ; |  X  XX | $F2F4
    .byte $54 ; | X X X  | $F2F5
    .byte $16 ; |   X XX | $F2F6
    .byte $5C ; | X XXX  | $F2F7
    .byte $16 ; |   X XX | $F2F8
    .byte $64 ; | XX  X  | $F2F9
    .byte $16 ; |   X XX | $F2FA
    .byte $6C ; | XX XX  | $F2FB
    .byte $16 ; |   X XX | $F2FC
    .byte $74 ; | XXX X  | $F2FD
    .byte $16 ; |   X XX | $F2FE
    .byte $7C ; | XXXXX  | $F2FF
    .byte $16 ; |   X XX | $F300
    .byte $54 ; | X X X  | $F301
    .byte $16 ; |   X XX | $F302
    .byte $5C ; | X XXX  | $F303
    .byte $16 ; |   X XX | $F304
    .byte $64 ; | XX  X  | $F305
    .byte $16 ; |   X XX | $F306
    .byte $6C ; | XX XX  | $F307
    .byte $16 ; |   X XX | $F308
    .byte $74 ; | XXX X  | $F309
    .byte $16 ; |   X XX | $F30A
    .byte $7C ; | XXXXX  | $F30B
    .byte $16 ; |   X XX | $F30C

LF30D:
    .word LBF90          ; $F30D
    .word LBA00          ; $F30F
    .word LBA00+1        ; $F311
    .word LBBB0          ; $F313
    .word LBBB0+1        ; $F315
    .word LBBB0+3        ; $F317
    .word LB900+1        ; $F319
    .word LB900+2        ; $F31B
    .word LB947          ; $F31D
    .word LB947+1        ; $F31F
    .word LB947+2        ; $F321
LF323:
    .word LB900          ; $F323
    .word LB900+3        ; $F325
    .word LB900+4        ; $F327
    .word LB947+3        ; $F329
    .word LB947+4        ; $F32B
    .word LB98F          ; $F32D
    .word LB98F+1        ; $F32F
    .word LB900+4        ; $F331
LF333:
    .word LBA00+2        ; $F333
    .word LBA47+1        ; $F335
    .word LBA47+2        ; $F337
    .word LBA47+3        ; $F339
    .word LBA90          ; $F33B
    .word LBA90+1        ; $F33D
    .word LBA47+1        ; $F33F
    .word LBA47+3        ; $F341

LF343:
    .byte $03 ; |      XX| $F343
    .byte $05 ; |     X X| $F344
    .byte $04 ; |     X  | $F345
    .byte $06 ; |     XX | $F346
LF347:
    .byte $01 ; |       X| $F347
    .byte $03 ; |      XX| $F348
    .byte $0F ; |    XXXX| $F349
    .byte $0F ; |    XXXX| $F34A
LF34B:
    .word LF353          ; $F34B
    .word LF355          ; $F34D
    .word LF359          ; $F34F
    .word LF369          ; $F351
LF353:
    .byte $01 ; |       X| $F353
    .byte $02 ; |      X | $F354
LF355:
    .byte $04 ; |     X  | $F355
    .byte $03 ; |      XX| $F356
    .byte $01 ; |       X| $F357
    .byte $02 ; |      X | $F358
LF359:
    .byte $02 ; |      X | $F359
    .byte $03 ; |      XX| $F35A
    .byte $01 ; |       X| $F35B
    .byte $02 ; |      X | $F35C
    .byte $03 ; |      XX| $F35D
    .byte $01 ; |       X| $F35E
    .byte $02 ; |      X | $F35F
    .byte $03 ; |      XX| $F360
    .byte $01 ; |       X| $F361
    .byte $02 ; |      X | $F362
    .byte $03 ; |      XX| $F363
    .byte $01 ; |       X| $F364
    .byte $02 ; |      X | $F365
    .byte $03 ; |      XX| $F366
    .byte $01 ; |       X| $F367
    .byte $03 ; |      XX| $F368
LF369:
    .byte $01 ; |       X| $F369
    .byte $02 ; |      X | $F36A
    .byte $03 ; |      XX| $F36B
    .byte $04 ; |     X  | $F36C
    .byte $05 ; |     X X| $F36D
    .byte $01 ; |       X| $F36E
    .byte $02 ; |      X | $F36F
    .byte $03 ; |      XX| $F370
    .byte $04 ; |     X  | $F371
    .byte $05 ; |     X X| $F372
    .byte $01 ; |       X| $F373
    .byte $02 ; |      X | $F374
    .byte $03 ; |      XX| $F375
    .byte $04 ; |     X  | $F376
    .byte $05 ; |     X X| $F377
    .byte $03 ; |      XX| $F378
LF379:
    .byte $00 ; |        | $F379
    .byte $00 ; |        | $F37A
    .byte $40 ; | X      | $F37B
    .byte $00 ; |        | $F37C
    .byte $00 ; |        | $F37D
    .byte $80 ; |X       | $F37E
LF37F:
    .word LF38B-1        ; $F37F
    .word LF38B+1        ; $F381
    .word LF38E          ; $F383
    .word LF391          ; $F385
    .word LF396          ; $F387
    .word LF395          ; $F389

LF38B:
    .byte $2E ; |  X XXX | $F38B
    .byte $6E ; | XX XXX | $F38C
    .byte $3E ; |  XXXXX | $F38D
LF38E:
    .byte $5E ; | X XXXX | $F38E
    .byte $2E ; |  X XXX | $F38F
    .byte $4E ; | X  XXX | $F390
LF391:
    .byte $6E ; | XX XXX | $F391
    .byte $2E ; |  X XXX | $F392
    .byte $3E ; |  XXXXX | $F393
    .byte $5E ; | X XXXX | $F394
LF395:
    .byte $6E ; | XX XXX | $F395
LF396:
    .byte $2E ; |  X XXX | $F396
    .byte $3E ; |  XXXXX | $F397
    .byte $4E ; | X  XXX | $F398
    .byte $5E ; | X XXXX | $F399
    .byte $6E ; | XX XXX | $F39A
LF39B:
    .byte $0E ; |    XXX | $F39B
    .byte $15 ; |   X X X| $F39C
    .byte $0A ; |    X X | $F39D
    .byte $04 ; |     X  | $F39E
    .byte $10 ; |   X    | $F39F
    .byte $00 ; |        | $F3A0
    .byte $03 ; |      XX| $F3A1
    .byte $01 ; |       X| $F3A2
    .byte $01 ; |       X| $F3A3
    .byte $00 ; |        | $F3A4
    .byte $03 ; |      XX| $F3A5
    .byte $01 ; |       X| $F3A6
    .byte $01 ; |       X| $F3A7
    .byte $00 ; |        | $F3A8
    .byte $00 ; |        | $F3A9
    .byte $1C ; |   XXX  | $F3AA
    .byte $08 ; |    X   | $F3AB
    .byte $38 ; |  XXX   | $F3AC
    .byte $10 ; |   X    | $F3AD
    .byte $00 ; |        | $F3AE
    .byte $03 ; |      XX| $F3AF
    .byte $01 ; |       X| $F3B0
    .byte $C1 ; |XX     X| $F3B1
    .byte $80 ; |X       | $F3B2
    .byte $83 ; |X     XX| $F3B3
    .byte $01 ; |       X| $F3B4
    .byte $01 ; |       X| $F3B5
    .byte $03 ; |      XX| $F3B6
    .byte $01 ; |       X| $F3B7
    .byte $1D ; |   XXX X| $F3B8
    .byte $08 ; |    X   | $F3B9
    .byte $3B ; |  XXX XX| $F3BA
    .byte $11 ; |   X   X| $F3BB
    .byte $01 ; |       X| $F3BC
    .byte $00 ; |        | $F3BD
    .byte $00 ; |        | $F3BE
    .byte $DC ; |XX XXX  | $F3BF
    .byte $88 ; |X   X   | $F3C0
    .byte $BB ; |X XXX XX| $F3C1
    .byte $11 ; |   X   X| $F3C2
    .byte $01 ; |       X| $F3C3
    .byte $03 ; |      XX| $F3C4
    .byte $01 ; |       X| $F3C5
    .byte $DD ; |XX XXX X| $F3C6
    .byte $88 ; |X   X   | $F3C7
    .byte $BB ; |X XXX XX| $F3C8
    .byte $11 ; |   X   X| $F3C9
    .byte $01 ; |       X| $F3CA
LF3CB:
    .word LFA18-1        ; $F3CB
    .word LFA15-1        ; $F3CD
    .word LFADD-1        ; $F3CF
    .word LFC91-1        ; $F3D1
    .word LFCC6-1        ; $F3D3
    .word LFA64-1        ; $F3D5
    .word LFD73-1        ; $F3D7
    .word LFD9B-1        ; $F3D9
    .word LFDFD-1        ; $F3DB
    .word LFE3C-1        ; $F3DD
    .word LFE77-1        ; $F3DF

LF3E1:
    .byte $00 ; |        | $F3E1
LF3E2:
    .byte $00 ; |        | $F3E2
    .byte $00 ; |        | $F3E3
    .byte $FF ; |XXXXXXXX| $F3E4
    .byte $FF ; |XXXXXXXX| $F3E5
    .byte $00 ; |        | $F3E6
LF3E7:
    .byte $36 ; |  XX XX | $F3E7
    .byte $26 ; |  X  XX | $F3E8
    .byte $56 ; | X X XX | $F3E9
    .byte $66 ; | XX  XX | $F3EA
    .byte $76 ; | XXX XX | $F3EB
    .byte $96 ; |X  X XX | $F3EC
    .byte $A6 ; |X X  XX | $F3ED
    .byte $B6 ; |X XX XX | $F3EE
LF3EF:
    .byte $78 ; | XXXX   | $F3EF
    .byte $88 ; |X   X   | $F3F0
    .byte $98 ; |X  XX   | $F3F1
    .byte $A8 ; |X X X   | $F3F2
    .byte $38 ; |  XXX   | $F3F3
    .byte $48 ; | X  X   | $F3F4
    .byte $58 ; | X XX   | $F3F5
    .byte $68 ; | XX X   | $F3F6
LF3F7:
    .byte $54 ; | X X X  | $F3F7
    .byte $54 ; | X X X  | $F3F8
    .byte $74 ; | XXX X  | $F3F9
    .byte $84 ; |X    X  | $F3FA
    .byte $A4 ; |X X  X  | $F3FB
    .byte $B4 ; |X XX X  | $F3FC
    .byte $34 ; |  XX X  | $F3FD
    .byte $44 ; | X   X  | $F3FE

START_1:  ; indirect jump also
    sei                          ; 2
    cld                          ; 2
    lda    #0                    ; 2
    tax                          ; 2
LF404:
    sta    0,X                   ; 4
    dex                          ; 2
    bne    LF404                 ; 2³
    dex                          ; 2

  IF KEYBOARD_CONTROLLER
    stx    SWACNT                ; 4
  ELSE
    nop
    nop
    nop
  ENDIF

    stx    ram_F1                ; 3
    lda    #$01                  ; 2
    sta    $2D                   ; 3   undefined, useless...
    sta    ram_9D                ; 3
LF415:  ; indirect jump also
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$24                  ; 2
    sta    TIM64T                ; 4
    lda    ram_8A                ; 3
    bne    LF422                 ; 2³
    sty    COLUBK                ; 3
LF422:
    ldx    #$FF                  ; 2
    txs                          ; 2
    lda    SWCHB                 ; 4
    ror                          ; 2
    bcs    LF432                 ; 2³
    dec    ram_82                ; 5
    bne    LF45D                 ; 2³
    jmp    LF902                 ; 3

LF432:
    ror                          ; 2
    bcs    LF459                 ; 2³
    dec    ram_82                ; 5
    bne    LF45D                 ; 2³
    ldx    ram_8A                ; 3
    cpx    #$02                  ; 2
    bcc    LF449                 ; 2³
    lda    ram_88                ; 3
    and    #$80                  ; 2
    bne    LF449                 ; 2³
    ora    #$80                  ; 2
    bne    LF454                 ; 3   always branch

LF449:
    lda    #$00                  ; 2
    inx                          ; 2
    cpx    #$0B                  ; 2
    bcc    LF452                 ; 2³
    ldx    #$01                  ; 2
LF452:
    stx    ram_8A                ; 3
LF454:
    sta    ram_88                ; 3
    jmp    LF92B                 ; 3

LF459:
    lda    #$01                  ; 2
    sta    ram_82                ; 3
LF45D:
    inc    ram_80                ; 5
    bne    LF477                 ; 2³
    inc    ram_81                ; 5
    bne    LF477                 ; 2³
    lda    ram_9D                ; 3
    and    #$07                  ; 2
    bne    LF477                 ; 2³
    bit    ram_8A                ; 3
    bne    LF473                 ; 2³
    ldx    #$F6                  ; 2
    stx    ram_F1                ; 3
LF473:
    sta    ram_8A                ; 3
    sta    ram_88                ; 3
LF477:
    jsr    LF62D                 ; 6
    and    #$07                  ; 2
    sta    ram_85                ; 3
    ldy    ram_92                ; 3
    lda    ram_91                ; 3
    beq    LF488                 ; 2³
    dec    ram_91                ; 5
    bne    LF495                 ; 2³
LF488:
    lda    ram_90                ; 3
    sta    ram_91                ; 3
    lda    #$80                  ; 2
    eor    ram_93                ; 3
    bpl    LF493                 ; 2³
    iny                          ; 2
LF493:
    sta    ram_93                ; 3
LF495:
    lda    LF020,Y               ; 4
    bne    LF4A0                 ; 2³
    sta    ram_92                ; 3
    sta    AUDV0                 ; 3
    beq    LF4C0                 ; 3   always branch

LF4A0:
    bit    ram_93                ; 3
    bpl    LF4A8                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
LF4A8:
    sty    ram_92                ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    tax                          ; 2
    lda    ram_94                ; 3
    bne    LF4C0                 ; 2³
    lda    LF000,X               ; 4
    sta    AUDF0                 ; 3
    lda    LF001,X               ; 4
    sta    AUDC0                 ; 3
    lda    #$09                  ; 2
    sta    AUDV0                 ; 3
LF4C0:
    ldx    #$00                  ; 2
    jsr    LF647                 ; 6
    ldx    #$01                  ; 2
    jsr    LF647                 ; 6
    jsr    LF7A2                 ; 6
    ldx    ram_86                ; 3
    beq    LF4E6                 ; 2³
    dec    ram_86                ; 5
    bne    LF4E6                 ; 2³
    lda    #$F4                  ; 2
    pha                          ; 3
    lda    #$E5                  ; 2
    pha                          ; 3
    ldx    ram_87                ; 3
    lda    LF3CB+1,X             ; 4
    pha                          ; 3
    lda    LF3CB,X               ; 4
    pha                          ; 3
    rts                          ; 6

LF4E6:
    ldx    INTIM                 ; 4
    bne    LF4E6                 ; 2³
    ldy    #$82                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    VSYNC                 ; 3
    sty    VBLANK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    RESBL                 ; 3
    ldy    #$20                  ; 2
    sty    HMBL                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$2C                  ; 2
    sta    TIM64T                ; 4
    stx    VSYNC                 ; 3
    stx    VBLANK                ; 3
    lda    #$DD                  ; 2
    sta    SWCHA                 ; 4
    lda    ram_8A                ; 3
    bne    LF526                 ; 2³
    stx    COLUBK                ; 3
    stx    ENABL                 ; 3
    lda    #>LBDE0               ; 2
    sta    ram_99                ; 3
    lda    #<LBDE0               ; 2
    sta    ram_98                ; 3
    jmp    LFFF0                 ; 3

LF526:
    lda    #$01                  ; 2
    bit    ram_89                ; 3
    beq    LF52F                 ; 2³
    jmp    LFF10                 ; 3

LF52F:
    lda    #$8A                  ; 2
    sta    COLUBK                ; 3
    lda    #$02                  ; 2
    sta    ENABL                 ; 3
    lda    #$31                  ; 2
    sta    CTRLPF                ; 3
    ldy    ram_9F                ; 3
    lda    #$9A                  ; 2
LF53F:
    clc                          ; 2
    adc    #$07                  ; 2  LF3A1
    dey                          ; 2
    bpl    LF53F                 ; 2³
    sta    ram_98                ; 3
    lda    #$F3                  ; 2
    sta    ram_99                ; 3
    ldy    #$06                  ; 2
LF54D:
    lda    (ram_98),Y            ; 5
    sta.wy ram_E3,Y              ; 5
    dey                          ; 2
    bpl    LF54D                 ; 2³
    jsr    LFAFF                 ; 6
    bit    ram_B1                ; 3
    bpl    LF566                 ; 2³
    bvs    LF5B0                 ; 2³
    lda    ram_B1                ; 3
    and    #$3F                  ; 2
    beq    LF57E                 ; 2³
    bne    LF593                 ; 3   always branch

LF566:
    jsr    LF680                 ; 6
    bcs    LF5B0                 ; 2³
    lda    #$10                  ; 2
    bit    ram_88                ; 3
    beq    LF578                 ; 2³
    lda    ram_95                ; 3
    bne    LF578                 ; 2³
    jsr    LF68B                 ; 6
LF578:
    lda    ram_B1                ; 3
    eor    #$20                  ; 2
    sta    ram_B1                ; 3
LF57E:
    sta    ram_D9                ; 3
    sta    ram_DB                ; 3
    sta    ram_DD                ; 3
    sta    ram_DF                ; 3
    sta    ram_E1                ; 3
    ora    #$10                  ; 2
    sta    ram_D5                ; 3
    sta    ram_D7                ; 3
    ldx    ram_9F                ; 3
    lda    LF39B,X               ; 4
LF593:
    ldy    #$08                  ; 2
    ldx    #$5E                  ; 2
LF597:
    lsr                          ; 2
    bcc    LF59C                 ; 2³
    stx    $D9,Y                 ; 4
LF59C:
    dey                          ; 2
    dey                          ; 2
    bpl    LF597                 ; 2³
    lda    #$B0                  ; 2
    sta    ram_DA                ; 3
    sta    ram_DC                ; 3
    sta    ram_DE                ; 3
    sta    ram_E0                ; 3
    sta    ram_E2                ; 3
    sta    ram_D6                ; 3
    sta    ram_D8                ; 3
LF5B0:
    jsr    LF84D                 ; 6
    lda    ram_A9                ; 3
    ldx    #$00                  ; 2
    jsr    LF69B                 ; 6
    sta    ram_BE                ; 3
    lda    ram_AB                ; 3
    sec                          ; 2
    sbc    #$47                  ; 2
    tax                          ; 2
    cpx    #$05                  ; 2
    bcc    LF5C8                 ; 2³
    ldx    #$04                  ; 2
LF5C8:
    lda    LF3E2,X               ; 4
    clc                          ; 2
    adc    ram_A8                ; 3
    ldx    #$04                  ; 2
    jsr    LF69B                 ; 6
    sta    ram_BD                ; 3
    jsr    LF6F6                 ; 6
    jsr    LF779                 ; 6
    lda    ram_80                ; 3
    and    #$07                  ; 2
    asl                          ; 2
    sta    ram_9A                ; 3
    lda    ram_EB                ; 3
    ror                          ; 2
    bcc    LF5EE                 ; 2³
    rol                          ; 2
    and    #$F1                  ; 2
    ora    ram_9A                ; 3
    sta    ram_EB                ; 3
LF5EE:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    bit    ram_9D                ; 3
    bpl    LF5FA                 ; 2³
    lda    #$4E                  ; 2
    bne    LF608                 ; 3+1   always branch

LF5FA:
    ldx    ram_AB                ; 3
    cpx    #$06                  ; 2
    bcc    LF602                 ; 2³
    ldx    #$05                  ; 2
LF602:
    lda    LF3E1,X               ; 4
    clc                          ; 2
    adc    ram_A8                ; 3
LF608:
    ldx    #$04                  ; 2
    jsr    LF69B                 ; 6
    sta    ram_9A                ; 3
    lda    #$01                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    ram_EA                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    HMCLR                 ; 3
LF61D:
    ldx    INTIM                 ; 4
    bne    LF61D                 ; 2³
    lda    #>LB06E               ; 2
    sta    ram_99                ; 3
    lda    #<LB06E               ; 2
    sta    ram_98                ; 3
    jmp    LFFF0                 ; 3

LF62D:
    lda    ram_83                ; 3
    stx    ram_83                ; 3
    ldx    ram_84                ; 3
    eor    LF415,X               ; 4
    eor    ram_80,X              ; 4
    asl                          ; 2
    adc    #$01                  ; 2
    rol                          ; 2
    inx                          ; 2
    stx    ram_84                ; 3
    eor    ram_80                ; 3
    lsr                          ; 2
    ldx    ram_83                ; 3
    sta    ram_83                ; 3
    rts                          ; 6

LF647:
    ldy    ram_94,X              ; 4
    beq    LF672                 ; 2³
    lda    ram_96,X              ; 4
    beq    LF653                 ; 2³
    dec    ram_96,X              ; 6
    bne    LF672                 ; 2³
LF653:
    iny                          ; 2
    iny                          ; 2
    sty    ram_94,X              ; 4
    lda    LF094,Y               ; 4
    sta    AUDC0,X               ; 4
    bne    LF660                 ; 2³
    sta    ram_94,X              ; 4
LF660:
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDV0,X               ; 4
    lda    LF095,Y               ; 4
    sta    AUDF0,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_96,X              ; 4
LF672:
    rts                          ; 6

LF673:
    lda    #$00                  ; 2
    sta    ram_94                ; 3
    sta    ram_95                ; 3
    sta    ram_92                ; 3
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    rts                          ; 6

LF680:
    ldx    ram_91                ; 3
    dex                          ; 2
    beq    LF687                 ; 2³
    sec                          ; 2
    rts                          ; 6

LF687:
    lda    ram_93                ; 3
    asl                          ; 2
    rts                          ; 6

LF68B:
    ldx    ram_85                ; 3
    lda    LF693,X               ; 4
    sta    ram_95                ; 3
    rts                          ; 6

LF693:
    .byte $6A ; | XX X X | $F693
    .byte $76 ; | XXX XX | $F694
    .byte $79 ; | XXXX  X| $F695
    .byte $7C ; | XXXXX  | $F696
    .byte $73 ; | XXX  XX| $F697
    .byte $76 ; | XXX XX | $F698
    .byte $79 ; | XXXX  X| $F699
    .byte $7C ; | XXXXX  | $F69A

LF69B:
    cpx    #$02                  ; 2
    adc    #$01                  ; 2
    ldx    #$00                  ; 2
    sec                          ; 2
LF6A2:
    inx                          ; 2
    sbc    #$0F                  ; 2
    bcs    LF6A2                 ; 2³
    stx    ram_9A                ; 3
    eor    #$FF                  ; 2
    sbc    #$06                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    ram_9A                ; 3
    rts                          ; 6

LF6B4:
    lda    ram_80                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    #$00                  ; 2
    sta    ram_9A                ; 3
    lda    LF6D0,Y               ; 4
    and    ram_AD,X              ; 4
    beq    LF6C6                 ; 2³
    inc    ram_9A                ; 5
LF6C6:
    lda    ram_AD,X              ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    ram_9A                ; 3
    rts                          ; 6

LF6D0:
    .byte $01 ; |       X| $F6D0
    .byte $08 ; |    X   | $F6D1
    .byte $04 ; |     X  | $F6D2
    .byte $08 ; |    X   | $F6D3
    .byte $02 ; |      X | $F6D4
    .byte $08 ; |    X   | $F6D5
    .byte $04 ; |     X  | $F6D6
    .byte $08 ; |    X   | $F6D7
    .byte $00 ; |        | $F6D8
    .byte $08 ; |    X   | $F6D9
    .byte $04 ; |     X  | $F6DA
    .byte $08 ; |    X   | $F6DB
    .byte $02 ; |      X | $F6DC
    .byte $08 ; |    X   | $F6DD
    .byte $04 ; |     X  | $F6DE
    .byte $08 ; |    X   | $F6DF

LF6E0:
    lda    #$00                  ; 2
    beq    LF6E6                 ; 3   always branch

LF6E4:
    lda    #$04                  ; 2
LF6E6:
    sta    ram_B0                ; 3
    lda    #$01                  ; 2
    sta    ram_AF                ; 3
    rts                          ; 6

LF6ED:
    lda    #$1E                  ; 2
    sta    ram_EC                ; 3
    lda    #$36                  ; 2
    sta    ram_ED                ; 3
    rts                          ; 6

LF6F6:
    lda    ram_80                ; 3
    and    #$07                  ; 2
    bne    LF722                 ; 2³+1
    lda    ram_A5                ; 3
    beq    LF722                 ; 2³
    dec    ram_A5                ; 5
    ldx    ram_8B                ; 3
    lda    ram_8C,X              ; 4
    cmp    #$9A                  ; 2
    bcc    LF70C                 ; 2³
    lda    #$00                  ; 2
LF70C:
    sed                          ; 2
    clc                          ; 2
    adc    #$01                  ; 2
    cld                          ; 2
    sta    ram_8C,X              ; 4
    cmp    #$00                  ; 2
    bne    LF722                 ; 2³
    lda    #$BB                  ; 2
    sta    ram_8C,X              ; 4
    lda    ram_89                ; 3
    ora    LF777,X               ; 4
    sta    ram_89                ; 3
LF722:
    lda    #$00                  ; 2
    sta    ram_99                ; 3
    lda    #$CB                  ; 2  .w  ram_CB
    sta    ram_98                ; 3
    lda    ram_8C                ; 3
    jsr    LF735                 ; 6
    lda    #$D0                  ; 2
    sta    ram_98                ; 3
    lda    ram_8D                ; 3
LF735:
    bne    LF739                 ; 2³
    lda    #$AA                  ; 2
LF739:
    pha                          ; 3
    and    #$F0                  ; 2
    bne    LF740                 ; 2³
    lda    #$A0                  ; 2
LF740:
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    jsr    LF76A                 ; 6
    ldy    #$04                  ; 2
LF749:
    lda    LF272,X               ; 4
    sta    (ram_98),Y            ; 6
    dex                          ; 2
    dey                          ; 2
    bpl    LF749                 ; 2³
    pla                          ; 4
    and    #$0F                  ; 2
    jsr    LF76A                 ; 6
    ldy    #$04                  ; 2
LF75A:
    lda    LF272,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ora    (ram_98),Y            ; 5
    sta    (ram_98),Y            ; 6
    dex                          ; 2
    dey                          ; 2
    bpl    LF75A                 ; 2³
    rts                          ; 6

LF76A:
    clc                          ; 2
    adc    #$01                  ; 2
    sta    ram_9A                ; 3
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    ram_9A                ; 3
    tax                          ; 2
    dex                          ; 2
    rts                          ; 6

LF777:
    .byte $02 ; |      X | $F777
    .byte $04 ; |     X  | $F778

LF779:
    lda    ram_AC                ; 3
    bne    LF78E                 ; 2³
    lda    ram_AE                ; 3
    beq    LF78D                 ; 2³
    dec    ram_AE                ; 5
    bne    LF78D                 ; 2³
    ldx    #$01                  ; 2
    lda    ram_AD                ; 3
LF789:
    sta    ram_AE                ; 3
    stx    ram_AC                ; 3
LF78D:
    rts                          ; 6

LF78E:
    ldx    #$01                  ; 2
    jsr    LF6B4                 ; 6
    clc                          ; 2
    adc    ram_AC                ; 3
    sta    ram_AC                ; 3
    cmp    #$43                  ; 2
    bcc    LF78D                 ; 2³
    lda    #$0F                  ; 2
    ldx    #$00                  ; 2
    beq    LF789                 ; 3   always branch

LF7A2:
    lda    #$20                  ; 2
    bit    ram_88                ; 3
    bne    LF7A9                 ; 2³
    rts                          ; 6

LF7A9:

  IF KEYBOARD_CONTROLLER
    lda    INPT1                 ; 3
    bmi    LF7C3                 ; 2³
    lda    INPT4                 ; 3
    bpl    LF7C7                 ; 2³
  ELSE
    lda    SWCHA
    bpl    LF7D0
    asl
    bmi    LF7C7
  ENDIF

    lda    ram_89                ; 3
    and    #$08                  ; 2   reflect?
    bne    LF7BB                 ; 2³  - yes
    lda    #$01                  ; 2
    sta    ram_AF                ; 3
LF7BB:
    lda    ram_89                ; 3
    ora    #$48                  ; 2
    bmi    LF7E2                 ; 2³
    bpl    LF7F1                 ; 3   always branch

LF7C3:
    lda    INPT4                 ; 3
    bpl    LF7D0                 ; 2³
LF7C7:
    lda    ram_89                ; 3
    and    #$BF                  ; 2   clear debouncer
    sta    ram_89                ; 3
    jmp    LF6E4                 ; 3

LF7D0:
    lda    ram_89                ; 3
    and    #$08                  ; 2
    beq    LF7DA                 ; 2³
    lda    #$01                  ; 2
    sta    ram_AF                ; 3
LF7DA:
    lda    ram_89                ; 3
    and    #$F7                  ; 2
    ora    #$40                  ; 2   set debouncer
    bpl    LF7F1                 ; 2³
LF7E2:
    bit    ram_89                ; 3
    bvs    LF7EE                 ; 2³  test debouncer
    ldx    #$08                  ; 2
    stx    ram_B0                ; 3
    ldx    #$01                  ; 2
    stx    ram_AF                ; 3
LF7EE:
    sta    ram_89                ; 3
    rts                          ; 6

LF7F1:
    tax                          ; 2
    lda    ram_89                ; 3
    stx    ram_89                ; 3
    and    #$40                  ; 2
    beq    LF7FD                 ; 2³
    jmp    LF6E4                 ; 3

LF7FD:
    txa                          ; 2
    ldx    ram_9E                ; 3
    and    #$08                  ; 2
    bne    LF81A                 ; 2³
    ldy    ram_A4                ; 3
    iny                          ; 2
    lda    LF343,X               ; 4
    sta    ram_9A                ; 3
    cpy    ram_9A                ; 3
    bcc    LF827                 ; 2³
    ldy    LF343,X               ; 4
    dey                          ; 2
    lda    ram_89                ; 3
    ora    #$08                  ; 2
    bne    LF825                 ; 3   always branch

LF81A:
    ldy    ram_A4                ; 3
    dey                          ; 2
    bne    LF827                 ; 2³
    ldy    #$01                  ; 2
    lda    ram_89                ; 3
    and    #$F7                  ; 2
LF825:
    sta    ram_89                ; 3
LF827:
    sty    ram_A4                ; 3
    lda    ram_9F                ; 3
    asl                          ; 2
    tax                          ; 2
    lda    LF37F,X               ; 4
    sta    ram_98                ; 3
    lda    LF37F+1,X             ; 4
    sta    ram_99                ; 3
    lda    (ram_98),Y            ; 5
    sec                          ; 2
    sbc    #$08                  ; 2
    ldx    ram_A2                ; 3
    cpx    #$07                  ; 2
    bcc    LF848                 ; 2³
    cpx    #$09                  ; 2
    bcs    LF848                 ; 2³
    sbc    #$03                  ; 2
LF848:
    sta    ram_A9                ; 3
    jmp    LF6E4                 ; 3

LF84D:
    dec    ram_AF                ; 5
    beq    LF852                 ; 2³
    rts                          ; 6

LF852:
    lda    ram_B0                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    and    #$0C                  ; 2
    bne    LF868                 ; 2³
    lda    #$BF                  ; 2
    sta    ram_C4                ; 3
    sta    ram_C6                ; 3
    lda    #$90                  ; 2
    sta    ram_C3                ; 3
    sta    ram_C5                ; 3
    rts                          ; 6

LF868:
    sta    ram_9A                ; 3
    lda    ram_B0                ; 3
    and    #$03                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
    and    #$03                  ; 2
    ora    ram_9A                ; 3
    sta    ram_B0                ; 3
    lda    LF8F2,X               ; 4
    sta    ram_AF                ; 3
    ldy    LF8DE-4,X             ; 4
    beq    LF88D                 ; 2³
    lda    ram_95                ; 3
    bne    LF88D                 ; 2³
    lda    #$4E                  ; 2
    sta    ram_95                ; 3
    lda    #$00                  ; 2
    sta    ram_97                ; 3
LF88D:
    tya                          ; 2
    clc                          ; 2
    adc    #$BB                  ; 2   high nibble, becomes BB, BC, BD, BE...
    sta    ram_C4                ; 3
    sta    ram_C6                ; 3
    sta    ram_C8                ; 3
    sta    ram_CA                ; 3
    lda    #$08                  ; 2
    bit    ram_89                ; 3
    bne    LF8BD                 ; 2³
    lda    #$00                  ; 2
    sta    ram_C3                ; 3
    lda    #$2C                  ; 2
    sta    ram_C5                ; 3
    lda    #$58                  ; 2
    sta    ram_C7                ; 3
    lda    #$84                  ; 2
    sta    ram_C9                ; 3
    lda    LF8E6,X               ; 4
    clc                          ; 2
    adc    ram_A9                ; 3
    cmp    #$90                  ; 2
    bcc    LF8DB                 ; 2³
    lda    #$90                  ; 2
    bne    LF8DB                 ; 3   always branch

LF8BD:
    lda    #$2C                  ; 2
    sta    ram_C3                ; 3
    lda    #$00                  ; 2
    sta    ram_C5                ; 3
    lda    #$84                  ; 2
    sta    ram_C7                ; 3
    lda    #$58                  ; 2
    sta    ram_C9                ; 3
    lda    LF8E6,X               ; 4
    eor    #$FF                  ; 2
    sec                          ; 2
    adc    ram_A9                ; 3
    cmp    #$0E                  ; 2
    bcs    LF8DB                 ; 2³
    lda    #$0E                  ; 2
LF8DB:
    sta    ram_A9                ; 3
    rts                          ; 6

LF8DE:
    .byte $00 ; |        | $F8DE
    .byte $00 ; |        | $F8DF
    .byte $00 ; |        | $F8E0
    .byte $00 ; |        | $F8E1
    .byte $03 ; |      XX| $F8E2
    .byte $02 ; |      X | $F8E3
    .byte $01 ; |       X| $F8E4
    .byte $02 ; |      X | $F8E5
LF8E6:
    .byte $03 ; |      XX| $F8E6
    .byte $00 ; |        | $F8E7
    .byte $00 ; |        | $F8E8
    .byte $00 ; |        | $F8E9
    .byte $00 ; |        | $F8EA
    .byte $00 ; |        | $F8EB
    .byte $00 ; |        | $F8EC
    .byte $00 ; |        | $F8ED
    .byte $03 ; |      XX| $F8EE
    .byte $03 ; |      XX| $F8EF
    .byte $03 ; |      XX| $F8F0
    .byte $03 ; |      XX| $F8F1
LF8F2:
    .byte $00 ; |        | $F8F2
    .byte $00 ; |        | $F8F3
    .byte $00 ; |        | $F8F4
    .byte $00 ; |        | $F8F5
    .byte $01 ; |       X| $F8F6
    .byte $01 ; |       X| $F8F7
    .byte $01 ; |       X| $F8F8
    .byte $01 ; |       X| $F8F9
    .byte $04 ; |     X  | $F8FA
    .byte $04 ; |     X  | $F8FB
    .byte $03 ; |      XX| $F8FC
    .byte $04 ; |     X  | $F8FD
    .byte $08 ; |    X   | $F8FE
    .byte $FF ; |XXXXXXXX| $F8FF
    .byte $FF ; |XXXXXXXX| $F900
    .byte $FF ; |XXXXXXXX| $F901

LF902:
    lda    ram_88                ; 3
    and    #$CF                  ; 2
    sta    ram_88                ; 3
    jsr    LF94B                 ; 6
    lda    #$00                  ; 2
    sta    ram_8C                ; 3
    sta    ram_8D                ; 3
    sta    ram_A5                ; 3
    jsr    LF6ED                 ; 6
    lda    #$00                  ; 2
    sta    ram_87                ; 3
    lda    #$3C                  ; 2
    sta    ram_86                ; 3
LF91E:
    jsr    LF9A9                 ; 6
    jsr    LF673                 ; 6
    lda    #$2D                  ; 2
    sta    ram_82                ; 3
    jmp    LF4E6                 ; 3

LF92B:
    ldx    ram_8A                ; 3
    cpx    #$0A                  ; 2
    bne    LF933                 ; 2³
    ldx    #$10                  ; 2
LF933:
    stx    ram_8C                ; 3
    lda    #$02                  ; 2
    bit    ram_88                ; 3
    bmi    LF93D                 ; 2³
    lda    #$01                  ; 2
LF93D:
    sta    ram_8D                ; 3
    lda    #$0E                  ; 2
    sta    ram_EC                ; 3
    sta    ram_ED                ; 3
    jsr    LF94B                 ; 6
    jmp    LF91E                 ; 3

LF94B:
    lda    #$0E                  ; 2
    sta    ram_EA                ; 3
    ldx    #$00                  ; 2
    stx    ram_86                ; 3
    stx    ram_8E                ; 3
    stx    ram_8F                ; 3
    stx    ram_8B                ; 3
    stx    ram_AC                ; 3
    stx    ram_AB                ; 3
    stx    ram_81                ; 3
    dex                          ; 2
    stx    ram_F1                ; 3
    lda    #$9F                  ; 2
    sta    ram_B1                ; 3
    ldx    ram_8A                ; 3
    bne    LF96E                 ; 2³
    ldx    #$01                  ; 2
    stx    ram_8A                ; 3
LF96E:
    lda    LF2AD,X               ; 4
    sta    ram_A2                ; 3
    lda    #$00                  ; 2
    cpx    #$04                  ; 2
    bcc    LF97B                 ; 2³
    lda    #$A0                  ; 2
LF97B:
    sta    ram_89                ; 3
    lda    ram_88                ; 3
    and    #$BF                  ; 2
    cpx    #$07                  ; 2
    bcc    LF987                 ; 2³
    ora    #$40                  ; 2
LF987:
    sta    ram_88                ; 3
    lda    #$05                  ; 2
    bit    ram_88                ; 3
    bvc    LF995                 ; 2³
    sta    ram_8E                ; 3
    bpl    LF995                 ; 2³
    sta    ram_8F                ; 3
LF995:
    lda    #$00                  ; 2
    cpx    #$09                  ; 2
    bcc    LF99D                 ; 2³
    lda    #$10                  ; 2
LF99D:
    sta    ram_AE                ; 3
    sta    ram_AD                ; 3
    sta    ram_AC                ; 3
    jsr    LF6E0                 ; 6
    jmp    LFFCA                 ; 3

LF9A9:
    lda    ram_A2                ; 3
    asl                          ; 2
    tay                          ; 2
    lda    LF2B9,Y               ; 4
    and    #$07                  ; 2
    sta    ram_9F                ; 3
    tax                          ; 2
    lda    LF2B9,Y               ; 4
    and    #$C0                  ; 2
    asl                          ; 2
    rol                          ; 2
    rol                          ; 2
    sta    ram_9E                ; 3
    lda    LF379,X               ; 4
    sta    ram_9D                ; 3
    lda    ram_85                ; 3
    asl                          ; 2
    tax                          ; 2
    lda    LF2BA,Y               ; 4
    and    #$3E                  ; 2
    tay                          ; 2
    lda    LF30D,Y               ; 4
    sta    ram_B6                ; 3
    lda    LF30D+1,Y             ; 4
    sta    ram_B7                ; 3
    ldy    ram_8A                ; 3
    cpy    #$08                  ; 2
    bne    LF9E6                 ; 2³
    lda    LF333,X               ; 4
    sta    ram_B6                ; 3
    jmp    LF9F3                 ; 3

LF9E6:
    cpy    #$07                  ; 2
    beq    LF9EE                 ; 2³
    cpy    #$09                  ; 2
    bne    LF9F3                 ; 2³
LF9EE:
    lda    LF323,X               ; 4
    sta    ram_B6                ; 3
LF9F3:
    lda    ram_88                ; 3
    and    #$F7                  ; 2
    cpy    #$03                  ; 2
    bcc    LF9FD                 ; 2³
    ora    #$08                  ; 2
LF9FD:
    sta    ram_88                ; 3
    ldx    ram_85                ; 3
    lda    LF3E7,X               ; 4
    sta    ram_EE                ; 3
    lda    LF3EF,X               ; 4
    sta    ram_EF                ; 3
    lda    LF3F7,X               ; 4
    sta    ram_F0                ; 3
    lda    #$C0                  ; 2
    sta    ram_AB                ; 3
    rts                          ; 6

LFA15:  ; indirect jump
    jsr    LF9A9                 ; 6
LFA18:  ; indirect jump
    lda    #$80                  ; 2
    sta    ram_B1                ; 3
    ldx    ram_8B                ; 3
    lda    ram_89                ; 3
    bpl    LFA24                 ; 2³
    ora    #$20                  ; 2
LFA24:
    and    #$F7                  ; 2
    ora    LFDFA,X               ; 4
    sta    ram_89                ; 3
    lda    LFACF,X               ; 4
    sta    ram_A9                ; 3
    ldy    #$01                  ; 2
    ldx    ram_8B                ; 3
    beq    LFA3C                 ; 2³
    ldx    ram_9E                ; 3
    ldy    LF343,X               ; 4
    dey                          ; 2
LFA3C:
    sty    ram_A4                ; 3
    lda    ram_9F                ; 3
    asl                          ; 2
    clc                          ; 2
    adc    ram_8B                ; 3
    tax                          ; 2
    lda    LFAD1,X               ; 4
    ldx    ram_A2                ; 3
    cpx    #$07                  ; 2
    bcc    LFA54                 ; 2³
    cpx    #$09                  ; 2
    bcs    LFA54                 ; 2³
    sbc    #$03                  ; 2
LFA54:
    sta    ram_AA                ; 3
    lda    #$08                  ; 2
    jsr    LF6E6                 ; 6
LFA5B:
    lda    #$0A                  ; 2
    sta    ram_87                ; 3
    lda    #$01                  ; 2
    sta    ram_86                ; 3
    rts                          ; 6

LFA64:  ; indirect jump
    lda    ram_A9                ; 3
    ldx    ram_8B                ; 3
    bne    LFA70                 ; 2³
    cmp    ram_AA                ; 3
    bcc    LFA5B                 ; 2³
    bcs    LFA74                 ; 3   always branch

LFA70:
    cmp    ram_AA                ; 3
    bcs    LFA5B                 ; 2³
LFA74:
    lda    #$00                  ; 2
    sta    ram_B1                ; 3
    lda    ram_88                ; 3
    ora    #$30                  ; 2
    sta    ram_88                ; 3
    ldx    ram_A2                ; 3
    cpx    #$09                  ; 2
    bcc    LFA86                 ; 2³
    ldx    #$08                  ; 2
LFA86:
    lda    LFAB6,X               ; 4
    sta    ram_A0                ; 3
    lda    ram_A2                ; 3
    asl                          ; 2
    tay                          ; 2
    lda    LF2B9,Y               ; 4
    and    #$38                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFABF,X               ; 4
    sta    ram_AD                ; 3
    sta    ram_A7                ; 3
    lda    LFAC7,X               ; 4
    sta    ram_90                ; 3
    sta    ram_91                ; 3
    lda    #$00                  ; 2
    sta    ram_93                ; 3
    bit    ram_89                ; 3
    bmi    LFAB1                 ; 2³
    jmp    LF6E4                 ; 3

LFAB1:
    lda    #$08                  ; 2
    jmp    LF6E6                 ; 3

LFAB6:
    .byte $03 ; |      XX| $FAB6
    .byte $06 ; |     XX | $FAB7
    .byte $0C ; |    XX  | $FAB8
    .byte $03 ; |      XX| $FAB9
    .byte $06 ; |     XX | $FABA
    .byte $0C ; |    XX  | $FABB
    .byte $03 ; |      XX| $FABC
    .byte $06 ; |     XX | $FABD
    .byte $0C ; |    XX  | $FABE
LFABF:
    .byte $06 ; |     XX | $FABF
    .byte $08 ; |    X   | $FAC0
    .byte $0A ; |    X X | $FAC1
    .byte $0B ; |    X XX| $FAC2
    .byte $0C ; |    XX  | $FAC3
    .byte $0D ; |    XX X| $FAC4
    .byte $0E ; |    XXX | $FAC5
    .byte $10 ; |   X    | $FAC6
LFAC7:
    .byte $09 ; |    X  X| $FAC7
    .byte $08 ; |    X   | $FAC8
    .byte $06 ; |     XX | $FAC9
    .byte $05 ; |     X X| $FACA
    .byte $05 ; |     X X| $FACB
    .byte $05 ; |     X X| $FACC
    .byte $05 ; |     X X| $FACD
    .byte $04 ; |     X  | $FACE
LFACF:
    .byte $0E ; |    XXX | $FACF
    .byte $90 ; |X  X    | $FAD0
LFAD1:
    .byte $26 ; |  X  XX | $FAD1
    .byte $66 ; | XX  XX | $FAD2
    .byte $36 ; |  XX XX | $FAD3
    .byte $56 ; | X X XX | $FAD4
    .byte $26 ; |  X  XX | $FAD5
    .byte $66 ; | XX  XX | $FAD6
    .byte $26 ; |  X  XX | $FAD7
    .byte $66 ; | XX  XX | $FAD8
    .byte $36 ; |  XX XX | $FAD9
    .byte $66 ; | XX  XX | $FADA
    .byte $26 ; |  X  XX | $FADB
    .byte $66 ; | XX  XX | $FADC

LFADD:  ; indirect jump
    jsr    LF680                 ; 6
    bcs    LFAF2                 ; 2³
    lda    ram_85                ; 3
    lsr                          ; 2
    tax                          ; 2
    stx    ram_A6                ; 3
    lda    LFAFB,X               ; 4
    sta    ram_92                ; 3
    lda    #$00                  ; 2
    sta    ram_B1                ; 3
    rts                          ; 6

LFAF2:
    lda    #$04                  ; 2
    sta    ram_87                ; 3
    lda    #$01                  ; 2
    sta    ram_86                ; 3
    rts                          ; 6

LFAFB:
    .byte $1C ; |   XXX  | $FAFB
    .byte $01 ; |       X| $FAFC
    .byte $01 ; |       X| $FAFD
    .byte $2D ; |  X XX X| $FAFE

LFAFF:
    lda    #$BF                  ; 2
    sta    ram_B9                ; 3
    sta    ram_C0                ; 3
    sta    ram_BB                ; 3
    sta    ram_C2                ; 3
    lda    #$00                  ; 2
    sta    ram_B8                ; 3
    sta    ram_BF                ; 3
    sta    ram_BC                ; 3
    lda    #$48                  ; 2
    sta    ram_BA                ; 3
    sta    ram_C1                ; 3
    lda    #$10                  ; 2
    bit    ram_88                ; 3
    bne    LFB1E                 ; 2³
    rts                          ; 6

LFB1E:
    ldx    ram_AB                ; 3
    beq    LFB25                 ; 2³
    jmp    LFBD3                 ; 3

LFB25:
    dec    ram_A0                ; 5
    bpl    LFB2C                 ; 2³
    jmp    LFD52                 ; 3

LFB2C:
    inx                          ; 2
    stx    ram_AB                ; 3
    ldx    ram_8A                ; 3
    cpx    #$0A                  ; 2
    bne    LFB4B                 ; 2³
    lda    ram_85                ; 3
    asl                          ; 2
    tax                          ; 2
    lda    LF323,X               ; 4
    sta    ram_B6                ; 3
    lda    LF323+1,X             ; 4
    sta    ram_B7                ; 3
    lda    #$00                  ; 2
    sta    ram_AC                ; 3
    lda    ram_AD                ; 3
    sta    ram_AE                ; 3
LFB4B:
    lda    ram_9E                ; 3
    tay                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    LF34B,X               ; 4
    sta    ram_98                ; 3
    lda    LF34B+1,X             ; 4
    sta    ram_99                ; 3
    jsr    LF62D                 ; 6
    and    LF347,Y               ; 4
    tay                          ; 2
    lda    (ram_98),Y            ; 5
    tay                          ; 2
    cpy    ram_A1                ; 3
    bne    LFB71                 ; 2³
    lda    ram_9E                ; 3
    beq    LFB71                 ; 2³
    dey                          ; 2
    bne    LFB71                 ; 2³
    iny                          ; 2
    iny                          ; 2
LFB71:
    sty    ram_A1                ; 3
    lda    ram_9D                ; 3
    and    #$F8                  ; 2
    ora    ram_A1                ; 3
    sta    ram_9D                ; 3
    lda    ram_9F                ; 3
    asl                          ; 2
    tax                          ; 2
    lda    LF37F,X               ; 4
    sta    ram_98                ; 3
    lda    LF37F+1,X             ; 4
    sta    ram_99                ; 3
    lda    (ram_98),Y            ; 5
    sta    ram_A8                ; 3
    sec                          ; 2
    sbc    #$2E                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    #$40                  ; 2
    sta.wy ram_D9,Y              ; 5
    lda    #$4F                  ; 2
    sta    ram_D5                ; 3
    sta    ram_D7                ; 3
    lda    #$C0                  ; 2
    sta    ram_B1                ; 3
    lda    ram_A0                ; 3
    cmp    #$02                  ; 2
    bcc    LFBAD                 ; 2³
    lda    ram_85                ; 3
    bne    LFBBD                 ; 2³
LFBAD:
    lda    #$20                  ; 2
    bit    ram_89                ; 3
    beq    LFBBD                 ; 2³
    lda    ram_89                ; 3
    and    #$DF                  ; 2
    sta    ram_89                ; 3
    lda    #$1D                  ; 2
    bne    LFBBF                 ; 3   always branch

LFBBD:
    lda    #$0E                  ; 2
LFBBF:
    sta    ram_EB                ; 3
    sta    ram_EA                ; 3
    lda    #$55                  ; 2
    sta    ram_95                ; 3
    lda    #$00                  ; 2
    sta    ram_97                ; 3
    lda    #$04                  ; 2
    sta    ram_87                ; 3
    lda    #$10                  ; 2
    sta    ram_86                ; 3
LFBD3:
    ldx    #$00                  ; 2
    jsr    LF6B4                 ; 6
    beq    LFC37                 ; 2³+1
    sta    ram_9A                ; 3
LFBDC:
    inc    ram_AB                ; 5
    lda    #$08                  ; 2
    bit    ram_88                ; 3
    beq    LFC33                 ; 2³+1
    lda    ram_AB                ; 3
    cmp    #$49                  ; 2
    bcs    LFC33                 ; 2³+1
    lda    ram_9F                ; 3
    asl                          ; 2
    tay                          ; 2
    lda    LFD3D,Y               ; 4
    sta    ram_98                ; 3
    lda    LFD3D+1,Y             ; 4
    sta    ram_99                ; 3
    lda    ram_9D                ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    (ram_98),Y            ; 5
    tax                          ; 2
    lda    ram_AB                ; 3
    eor    #$FF                  ; 2
    sec                          ; 2
    sbc    #$B5                  ; 2
    bcc    LFC33                 ; 2³
    cmp    #$43                  ; 2
    bcs    LFC33                 ; 2³
    sta    ram_9C                ; 3
    ldy    ram_9E                ; 3
    lda    LFD39,Y               ; 4
    sta    ram_9B                ; 3
    lda    #$42                  ; 2
    clc                          ; 2
    adc    ram_9B                ; 3
LFC1B:
    sec                          ; 2
    sbc    ram_9B                ; 3
    cmp    ram_9C                ; 3
    beq    LFC27                 ; 2³
    bpl    LFC1B                 ; 2³
    clc                          ; 2
    adc    ram_9B                ; 3
LFC27:
    tay                          ; 2
    lda    #>LB9D4               ; 2
    sta    ram_99                ; 3
    lda    #<LB9D4               ; 2
    sta    ram_98                ; 3
    jmp    LFFF0                 ; 3

LFC33:  ; indirect jump also
    dec    ram_9A                ; 5
    bne    LFBDC                 ; 2³+1
LFC37:
    ldx    #$00                  ; 2
    bit    ram_9D                ; 3
    bmi    LFC4D                 ; 2³
    jsr    LFD1A                 ; 6
    bcs    LFC4D                 ; 2³
    adc    #$00                  ; 2
    sta    ram_B8                ; 3
    lda    ram_AB                ; 3
    clc                          ; 2
    adc    #$48                  ; 2
    sta    ram_BA                ; 3
LFC4D:
    inx                          ; 2
    jsr    LFD1A                 ; 6
    bcs    LFC57                 ; 2³
    adc    #$FF                  ; 2
    sta    ram_BC                ; 3
LFC57:
    inx                          ; 2
    jsr    LFD1A                 ; 6
    bcs    LFC68                 ; 2³
    adc    #$C5                  ; 2
    sta    ram_BF                ; 3
    lda    ram_AB                ; 3
    clc                          ; 2
    adc    #$0D                  ; 2
    sta    ram_C1                ; 3
LFC68:
    inx                          ; 2
    jsr    LFD1A                 ; 6
    bcs    LFCDC                 ; 2³
    lda    ram_87                ; 3
    cmp    #$08                  ; 2
    beq    LFCDC                 ; 2³
    lda    ram_A9                ; 3
    clc                          ; 2
    adc    #$02                  ; 2
    cmp    ram_A8                ; 3
    bcs    LFCC6                 ; 2³
    adc    #$0A                  ; 2
    cmp    ram_A8                ; 3
    bcc    LFCC6                 ; 2³
    lda    #$C0                  ; 2
    sta    ram_AB                ; 3
    lda    ram_EB                ; 3
    cmp    #$10                  ; 2
    bcs    LFCA4                 ; 2³
    lda    #$01                  ; 2
    sta    ram_A5                ; 3
LFC91:  ; indirect jump
    jsr    LF680                 ; 6
    bcs    LFC9E                 ; 2³
    ldx    ram_A6                ; 3
    lda    LFD31,X               ; 4
    sta    ram_92                ; 3
    rts                          ; 6

LFC9E:
    lda    #$06                  ; 2
    sta    ram_87                ; 3
    bne    LFCD7                 ; 3   always branch

LFCA4:
    lda    #$05                  ; 2
    sta    ram_A5                ; 3
    jsr    LF673                 ; 6
    lda    #$00                  ; 2
    sta    ram_94                ; 3
    lda    #$17                  ; 2
    sta    ram_95                ; 3
    lda    #$00                  ; 2
    sta    ram_96                ; 3
    sta    ram_97                ; 3
    ldx    ram_8B                ; 3
    lda    ram_8E,X              ; 4
    beq    LFCC5                 ; 2³
    inc    ram_8E,X              ; 6
    bne    LFCC5                 ; 2³
    dec    ram_8E,X              ; 6
LFCC5:
    rts                          ; 6

LFCC6:  ; indirect jump also
    lda    #$08                  ; 2
    sta    ram_87                ; 3
    jsr    LF680                 ; 6
    bcs    LFCD7                 ; 2³
    ldx    ram_A6                ; 3
    lda    LFD35,X               ; 4
    sta    ram_92                ; 3
    rts                          ; 6

LFCD7:
    lda    #$01                  ; 2
    sta    ram_86                ; 3
    rts                          ; 6

LFCDC:
    lda    ram_AB                ; 3
    cmp    #$7F                  ; 2
    bne    LFD0D                 ; 2³+1
    inc    ram_AB                ; 5
    lda    #$02                  ; 2
    sta    ram_AD                ; 3
    jsr    LF673                 ; 6
    lda    #$2C                  ; 2
    sta    ram_94                ; 3
    lda    #$3D                  ; 2
    sta    ram_95                ; 3
    lda    #$00                  ; 2
    sta    ram_96                ; 3
    sta    ram_97                ; 3
    ldx    ram_8B                ; 3
    lda    ram_8E,X              ; 4
    beq    LFD19                 ; 2³+1
    dec    ram_8E,X              ; 6
    bne    LFD19                 ; 2³
    lda    LFD2F,X               ; 4
    ora    ram_88                ; 3
    sta    ram_88                ; 3
LFD0A:
    jmp    LFD52                 ; 3

LFD0D:
    cmp    #$83                  ; 2
    bne    LFD19                 ; 2³
    lda    ram_A7                ; 3
    sta    ram_AD                ; 3
    lda    ram_A0                ; 3
    beq    LFD0A                 ; 2³
LFD19:
    rts                          ; 6

LFD1A:
    lda    ram_AB                ; 3
    cmp    LFD27,X               ; 4
    bcs    LFD23                 ; 2³
    sec                          ; 2
    rts                          ; 6

LFD23:
    cmp    LFD2B,X               ; 4
    rts                          ; 6

LFD27:
    .byte $01 ; |       X| $FD27
    .byte $45 ; | X   X X| $FD28
    .byte $48 ; | X  X   | $FD29
    .byte $54 ; | X X X  | $FD2A
LFD2B:
    .byte $48 ; | X  X   | $FD2B
    .byte $49 ; | X  X  X| $FD2C
    .byte $86 ; |X    XX | $FD2D
    .byte $56 ; | X X XX | $FD2E
LFD2F:
    .byte $01 ; |       X| $FD2F
    .byte $02 ; |      X | $FD30
LFD31:
    .byte $25 ; |  X  X X| $FD31
    .byte $0A ; |    X X | $FD32
    .byte $13 ; |   X  XX| $FD33
    .byte $36 ; |  XX XX | $FD34
LFD35:
    .byte $51 ; | X X   X| $FD35
    .byte $3F ; |  XXXXXX| $FD36
    .byte $48 ; | X  X   | $FD37
    .byte $59 ; | X XX  X| $FD38
LFD39:
    .byte $03 ; |      XX| $FD39
    .byte $05 ; |     X X| $FD3A
    .byte $04 ; |     X  | $FD3B
    .byte $03 ; |      XX| $FD3C
LFD3D:
    .word LFD49+1        ; $FD3D
    .word LFD49+1        ; $FD3F
    .word LFD49          ; $FD41
    .word LFD49-1        ; $FD43
    .word LFD49-1        ; $FD45
    .word LFD49+3        ; $FD47

LFD49:
    .byte $04 ; |     X  | $FD49
    .byte $03 ; |      XX| $FD4A
    .byte $02 ; |      X | $FD4B
    .byte $01 ; |       X| $FD4C
    .byte $02 ; |      X | $FD4D
    .byte $03 ; |      XX| $FD4E
    .byte $01 ; |       X| $FD4F
    .byte $04 ; |     X  | $FD50
    .byte $05 ; |     X X| $FD51

LFD52:
    lda    #$0E                  ; 2
    sta    ram_EA                ; 3
    lda    ram_88                ; 3
    and    #$CF                  ; 2
    sta    ram_88                ; 3
    lda    #$80                  ; 2
    sta    ram_B1                ; 3
    ldx    ram_8B                ; 3
    lda    ram_89                ; 3
    and    #$F7                  ; 2
    ora    LFDFB,X               ; 4
    sta    ram_89                ; 3
    jsr    LFD91                 ; 6
    lda    #$08                  ; 2
    jmp    LF6E6                 ; 3

LFD73:  ; indirect jump
    ldx    ram_8B                ; 3
    lda    ram_A9                ; 3
    cmp    #$0F                  ; 2
    bcs    LFD91                 ; 2³
    bit    ram_89                ; 3
    bpl    LFDED                 ; 2³
    lda    #$01                  ; 2
LFD81:
    bit    ram_88                ; 3
    bne    LFDED                 ; 2³
    bpl    LFDB7                 ; 2³
    bvc    LFD8D                 ; 2³
    lda    ram_8F                ; 3
    beq    LFDB7                 ; 2³
LFD8D:
    ldx    #$01                  ; 2
    bne    LFDD8                 ; 3   always branch

LFD91:
    lda    LFDF8,X               ; 4
    sta    ram_87                ; 3
    lda    #$01                  ; 2
    sta    ram_86                ; 3
    rts                          ; 6

LFD9B:  ; indirect jump
    ldx    ram_8B                ; 3
    lda    ram_A9                ; 3
    cmp    #$90                  ; 2
    bcc    LFD91                 ; 2³
    bit    ram_89                ; 3
    bpl    LFDED                 ; 2³
    lda    #$02                  ; 2
LFDA9:
    bit    ram_88                ; 3
    bne    LFDED                 ; 2³
    bvc    LFDB7                 ; 2³
    lda    ram_8E                ; 3
    bne    LFDB7                 ; 2³
    ldx    #$01                  ; 2
    bne    LFDB9                 ; 3   always branch

LFDB7:
    ldx    #$00                  ; 2
LFDB9:
    ldy    ram_8A                ; 3
    inc    ram_A2                ; 5
    lda    ram_A2                ; 3
    cmp    LF2AE,Y               ; 4
    bcc    LFDC6                 ; 2³
    dec    ram_A2                ; 5
LFDC6:
    clc                          ; 2
    adc    #$01                  ; 2
    bit    ram_88                ; 3
    bvs    LFDD8                 ; 2³
    cmp    LF2AE,Y               ; 4
    bcc    LFDD8                 ; 2³
    lda    ram_88                ; 3
    ora    #$03                  ; 2
    sta    ram_88                ; 3
LFDD8:
    stx    ram_8B                ; 3
    jsr    LF6ED                 ; 6
    txa                          ; 2
    eor    #$01                  ; 2
    tax                          ; 2
    lda    #$00                  ; 2
    sta    ram_EC,X              ; 4
    lda    #$02                  ; 2
    sta    ram_87                ; 3
    lda    #$B4                  ; 2
    bne    LFDF3                 ; 3   always branch

LFDED:
    lda    #$10                  ; 2
    sta    ram_87                ; 3
    lda    #$0F                  ; 2
LFDF3:
    sta    ram_86                ; 3
    jmp    LF6E0                 ; 3

LFDF8:
    .byte $0C ; |    XX  | $FDF8
    .byte $0E ; |    XXX | $FDF9
LFDFA:
    .byte $00 ; |        | $FDFA
LFDFB:
    .byte $08 ; |    X   | $FDFB
    .byte $00 ; |        | $FDFC

LFDFD:  ; indirect jump
    ldx    ram_8B                ; 3
    lda    LFDFA,X               ; 4
    sta    ram_9A                ; 3
    lda    ram_8C,X              ; 4
    sta    ram_DA                ; 3
    lda    ram_8C                ; 3
    sta    ram_DC                ; 3
    lda    ram_8D                ; 3
    sta    ram_DD                ; 3
    lda    #$00                  ; 2
    sta    ram_DB                ; 3
    lda    ram_89                ; 3
    and    #$F7                  ; 2
    ora    ram_9A                ; 3
    ora    #$01                  ; 2
    sta    ram_89                ; 3
    and    LF777,X               ; 4
    beq    LFE27                 ; 2³
    lda    #$99                  ; 2
    sta    ram_DA                ; 3
LFE27:
    lda    #$38                  ; 2
    bit    ram_88                ; 3
    bvc    LFE2F                 ; 2³
    lda    #$18                  ; 2
LFE2F:
    sta    ram_D9                ; 3
    lda    #$12                  ; 2
    sta    ram_87                ; 3
    lda    #$1E                  ; 2
    sta    ram_86                ; 3
    jmp    LF6E4                 ; 3

LFE3C:  ; indirect jump
    lda    ram_DB                ; 3
    cmp    ram_DA                ; 3
    bcs    LFE5F                 ; 2³
    sed                          ; 2
    clc                          ; 2
    adc    #$01                  ; 2
    cld                          ; 2
    sta    ram_DB                ; 3
    jsr    LF68B                 ; 6
    ldx    ram_D9                ; 3
    stx    ram_86                ; 3
    dex                          ; 2
    dex                          ; 2
    cpx    #$08                  ; 2
    bcs    LFE58                 ; 2³
    ldx    #$08                  ; 2
LFE58:
    stx    ram_D9                ; 3
    lda    #$12                  ; 2
    sta    ram_87                ; 3
    rts                          ; 6

LFE5F:
    ldx    #$08                  ; 2
    stx    ram_90                ; 3
    dex                          ; 2
    stx    ram_D9                ; 3
    ldx    #$00                  ; 2
    stx    ram_93                ; 3
    inx                          ; 2
    stx    ram_91                ; 3
    lda    #$62                  ; 2
    sta    ram_92                ; 3
    lda    #$31                  ; 2
    sta    ram_86                ; 3
    bne    LFE98                 ; 3   always branch

LFE77:  ; indirect jump
    ldx    ram_D9                ; 3
    bmi    LFE9D                 ; 2³
    dec    ram_D9                ; 5
    bmi    LFE8B                 ; 2³
    lda    #$0C                  ; 2
    sta    ram_B0                ; 3
    jsr    LF6E6                 ; 6
    lda    LFEF3-1,X             ; 4
    bne    LFE90                 ; 3   always branch

LFE8B:
    jsr    LF6E4                 ; 6
    lda    #$FF                  ; 2
LFE90:
    sta    ram_86                ; 3
    lda    ram_89                ; 3
    eor    #$08                  ; 2
    sta    ram_89                ; 3
LFE98:
    lda    #$14                  ; 2
    sta    ram_87                ; 3
    rts                          ; 6

LFE9D:
    lda    ram_DC                ; 3
    sta    ram_8C                ; 3
    lda    ram_DD                ; 3
    sta    ram_8D                ; 3
    jsr    LF6E0                 ; 6
    ldy    #$00                  ; 2
    bit    ram_89                ; 3
    bmi    LFED2                 ; 2³
    lda    #$01                  ; 2
    bit    ram_88                ; 3
    bmi    LFEBE                 ; 2³
    bne    LFED2                 ; 2³
LFEB6:
    sty    ram_8C                ; 3
LFEB8:
    jsr    LFFCA                 ; 6
    jmp    LFEE3                 ; 3

LFEBE:
    bne    LFEB8                 ; 2³
    ldx    ram_8B                ; 3
    beq    LFEB6                 ; 2³
    lda    #$02                  ; 2
    bit    ram_88                ; 3
    bne    LFED2                 ; 2³
    sty    ram_8D                ; 3
    jsr    LFFCA                 ; 6
    jmp    LFEEF                 ; 3

LFED2:
    jsr    LFFCA                 ; 6
    ldx    ram_8B                ; 3
    bne    LFEE7                 ; 2³
    bit    ram_88                ; 3
    bpl    LFEFA                 ; 2³
    bvc    LFEE3                 ; 2³
    lda    ram_8F                ; 3
    beq    LFEFA                 ; 2³
LFEE3:
    tya                          ; 2
    jmp    LFD81                 ; 3

LFEE7:
    bit    ram_88                ; 3
    bvc    LFEFA                 ; 2³
    lda    ram_8E                ; 3
    beq    LFEFA                 ; 2³
LFEEF:
    tya                          ; 2
    jmp    LFDA9                 ; 3

LFEF3:
    .byte $10 ; |   X    | $FEF3
    .byte $10 ; |   X    | $FEF4
    .byte $20 ; |  X     | $FEF5
    .byte $10 ; |   X    | $FEF6
    .byte $10 ; |   X    | $FEF7
    .byte $20 ; |  X     | $FEF8
    .byte $40 ; | X      | $FEF9

LFEFA:
    lda    ram_9D                ; 3
    and    #$F8                  ; 2
    sta    ram_9D                ; 3
    lda    #$00                  ; 2
    sta    ram_AB                ; 3
    sta    ram_81                ; 3
    jsr    LF6ED                 ; 6
    lda    #$9F                  ; 2
    sta    ram_B1                ; 3
    jmp    LF6E0                 ; 3

LFF10:
    lda    ram_DB                ; 3
    and    #$F0                  ; 2
    sta    ram_9A                ; 3
    lda    ram_DB                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    beq    LFF20                 ; 2³
    ora    #$0A                  ; 2
LFF20:
    sta    ram_8D                ; 3
    beq    LFF26                 ; 2³
    lda    #$0A                  ; 2
LFF26:
    ora    ram_9A                ; 3
    sta    ram_8C                ; 3
    ldx    ram_8B                ; 3
    lda    LF777,X               ; 4
    bit    ram_89                ; 3
    beq    LFF3F                 ; 2³
    lda    ram_DB                ; 3
    cmp    #$99                  ; 2
    bne    LFF3F                 ; 2³
    lda    #$BA                  ; 2
    sta    ram_8C                ; 3
    sta    ram_8D                ; 3
LFF3F:
    jsr    LF722                 ; 6
    jsr    LF6ED                 ; 6
    jsr    LF84D                 ; 6
    ldy    #$00                  ; 2
    lda    ram_DB                ; 3
    beq    LFF5A                 ; 2³
    sed                          ; 2
LFF4F:
    sec                          ; 2
    sbc    #$12                  ; 2
    bcc    LFF57                 ; 2³
    iny                          ; 2
    bcs    LFF4F                 ; 3   always branch

LFF57:
    adc    #$12                  ; 2
    cld                          ; 2
LFF5A:
    sty    ram_DF                ; 3
    sta    ram_A0                ; 3
    tax                          ; 2
    bne    LFF65                 ; 2³
    dey                          ; 2
    bpl    LFF65                 ; 2³
    iny                          ; 2
LFF65:
    lda    LFFC1,Y               ; 4
    sta    ram_E0                ; 3
    lda    #$54                  ; 2
LFF6C:
    sec                          ; 2
    sbc    #$09                  ; 2
    dey                          ; 2
    bpl    LFF6C                 ; 2³
    ldy    ram_B0                ; 3
    cpy    #$0D                  ; 2
    bne    LFF7E                 ; 2³
    adc    #$03                  ; 2
    ldy    #$25                  ; 2
    bne    LFF80                 ; 3   always branch

LFF7E:
    ldy    #$27                  ; 2
LFF80:
    sty    ram_E2                ; 3
    sta    ram_E1                ; 3
    lda    LFFAE,X               ; 4
    sta    ram_DE                ; 3
    ldx    ram_92                ; 3
    beq    LFF9E                 ; 2³
    lda    LF020,X               ; 4
    and    #$0F                  ; 2
    cmp    #$01                  ; 2
    beq    LFF9E                 ; 2³
    jsr    LF680                 ; 6
    bcs    LFF9E                 ; 2³
    jsr    LF68B                 ; 6
LFF9E:
    ldx    INTIM                 ; 4
    bne    LFF9E                 ; 2³
    lda    #>LBEB0               ; 2
    sta    ram_99                ; 3
    lda    #<LBEB0               ; 2
    sta    ram_98                ; 3
    jmp    LFFF0                 ; 3

LFFAE:
    .byte $13 ; |   X  XX| $FFAE
    .byte $13 ; |   X  XX| $FFAF
    .byte $93 ; |X  X  XX| $FFB0
    .byte $04 ; |     X  | $FFB1
    .byte $75 ; | XXX X X| $FFB2
    .byte $F5 ; |XXXX X X| $FFB3
    .byte $66 ; | XX  XX | $FFB4
    .byte $E6 ; |XXX  XX | $FFB5
    .byte $57 ; | X X XXX| $FFB6
    .byte $D7 ; |XX X XXX| $FFB7
    .byte $00 ; |        | $FFB8
    .byte $00 ; |        | $FFB9
    .byte $00 ; |        | $FFBA
    .byte $00 ; |        | $FFBB
    .byte $00 ; |        | $FFBC
    .byte $00 ; |        | $FFBD
    .byte $48 ; | X  X   | $FFBE
    .byte $C8 ; |XX  X   | $FFBF
    .byte $39 ; |  XXX  X| $FFC0
LFFC1:
    .byte $0E ; |    XXX | $FFC1
    .byte $19 ; |   XX  X| $FFC2
    .byte $23 ; |  X   XX| $FFC3
    .byte $2E ; |  X XXX | $FFC4
    .byte $39 ; |  XXX  X| $FFC5
    .byte $43 ; | X    XX| $FFC6
    .byte $4E ; | X  XXX | $FFC7
    .byte $59 ; | X XX  X| $FFC8
    .byte $64 ; | XX  X  | $FFC9

LFFCA:
    ldx    ram_8B                ; 3
    lda    ram_88                ; 3
    and    LFFDD,X               ; 4
    sta    ram_88                ; 3
    lda    ram_89                ; 3
    and    #$FE                  ; 2
    and    LFFDF,X               ; 4
    sta    ram_89                ; 3
    rts                          ; 6

LFFDD:
    .byte $FE ; |XXXXXXX | $FFDD
    .byte $FD ; |XXXXXX X| $FFDE
LFFDF:
    .byte $FD ; |XXXXXX X| $FFDF
    .byte $FB ; |XXXXX XX| $FFE0
    .byte $43 ; | X    XX| $FFE1
    .byte $2E ; |  X XXX | $FFE2
    .byte $48 ; | X  X   | $FFE3
    .byte $2E ; |  X XXX | $FFE4
    .byte $4F ; | X  XXXX| $FFE5
    .byte $4D ; | X  XX X| $FFE6
    .byte $41 ; | X     X| $FFE7
    .byte $52 ; | X X  X | $FFE8
    .byte $5A ; | X XX X | $FFE9
    .byte $55 ; | X X X X| $FFEA
    .byte $00 ; |        | $FFEB
    .byte $00 ; |        | $FFEC
    .byte $00 ; |        | $FFED
    .byte $00 ; |        | $FFEE
    .byte $00 ; |        | $FFEF

       ORG $1FF0
      RORG $FFF0

LFFF0:
    cmp    BANK_0                ; 4   bankswitch

;coming from bank 0
    jmp.ind ($0098)              ; 5

    .byte $00 ; |        | $FFF6
    .byte $00 ; |        | $FFF7
    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9

    .word START_1
    .word START_1
    .word START_1
