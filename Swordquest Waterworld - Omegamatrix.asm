; Rough Disassembly of WaterWorld
; By Omegamatrix
;
; Includes PAL and PAL60 conversions
;
;
;
; water1.cfg contents:
;
;      ORG F000
;      CODE F000 F088
;      GFX F089 F0FF
;      CODE F100 F15E
;      GFX F15F F2D2
;      CODE F2D3 F43D
;      GFX F43E F4B4
;      CODE F4B5 F9DE
;      GFX F9DF F9FF
;      CODE FA00 FA69
;      GFX FA6A FFFF
;
; water2.cfg contents:
;
;      ORG B000
;      CODE B000 B00E
;      GFX B00F B01C
;      CODE B01D B317
;      GFX B318 B349
;      CODE B34A B530
;      GFX B531 B553
;      CODE B554 B640
;      GFX B641 B646
;      CODE B647 B6D8
;      GFX B6D9 B746
;      CODE B747 B833
;      GFX B834 B86F
;      CODE B870 B892
;      GFX B893 B8AE
;      CODE B8AF B95F
;      GFX B960 BA3F
;      CODE BA40 BA57
;      GFX BA58 BA5D
;      CODE BA5E BAB4
;      GFX BAB5 BC28
;      CODE BC29 BCE2
;      GFX BCE3 BEF1
;      CODE BEF2 BEF4
;      GFX BEF5 BFFF

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
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
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
CXCLR   =  $2C

;first bank
INPT_4  =  $0C
;second bank
INPT4   =  $3C

CXP0FB  =  $32
CXPPMM  =  $37
SWCHA   =  $0280
SWCHB   =  $0282
SWBCNT  =  $0283
INTIM   =  $0284
TIM64T  =  $0296


;---------------------------------------
;       1 = yes, 0 = no,
; choose only a single "switch" at a time...
;
NTSC          = 1
PAL           = 0
PAL_M         = 0
;---------------------------------------

BANK_0       = $FFF8
BANK_1       = $FFF9

  IF NTSC
BLACK         = $00
GREY          = $02
WHITE         = $0E
DIRTY_YELLOW  = $10
YELLOW        = $1A
ORANGE        = $20
ORANGE_RED    = $30
RED           = $40
PURPLE_RED    = $50
PURPLE        = $60
PURPLE_BLUE   = $70
BLUE          = $80
BLUE_CYAN     = $90
CYAN          = $A0
GREEN_CYAN    = $B0
GREEN         = $C0
YELLOW_GREEN  = $D0
ORANGE_GREEN  = $E0
BROWN         = $F0

  ELSE

BLACK         = $00
GREY          = $02
WHITE         = $0E
DIRTY_YELLOW  = $10+$20
YELLOW        = $1A+$10
ORANGE        = $20
ORANGE_RED    = $30+$10
RED           = $40+$20
PURPLE_RED    = $50+$30
PURPLE        = $60+$40
PURPLE_BLUE   = $70+$50
BLUE          = $80+$50
BLUE_CYAN     = $90+$20
CYAN          = $A0-$10
GREEN_CYAN    = $B0-$40
GREEN         = $C0-$70
YELLOW_GREEN  = $D0-$A0
ORANGE_GREEN  = $E0-$B0
BROWN         = $F0-$D0

  ENDIF

;NTSC $0x = PAL $0x   no change
;NTSC $1x = PAL $2x <-- ($10to$18  PAL $30to$38)  ($1Ato$1F  PAL $2Ato$2F)
;NTSC $2x = PAL $2x   no change
;NTSC $3x = PAL $4x   +$10
;NTSC $4x = PAL $6x   +$20
;NTSC $5x = PAL $8x   +$30
;NTSC $6x = PAL $Ax   +$40
;NTSC $7x = PAL $Cx   +$50
;NTSC $8x = PAL $Dx   +$50
;NTSC $9x = PAL $Bx   +$20
;NTSC $Ax = PAL $9x   -$10
;NTSC $Bx = PAL $7x   -$40
;NTSC $Cx = PAL $5x   -$70
;NTSC $Dx = PAL $3x   -$A0
;NTSC $Ex = PAL $3x <--  -$B0
;NTSC $Fx = PAL $2x <--  -$D0
;
;BLACK         = $00
;GREY          = $02
;WHITE         = $0E
;DIRTY_YELLOW  = $10
;YELLOW        = $1A
;ORANGE        = $20
;ORANGE_RED    = $30
;RED           = $40
;PURPLE_RED    = $50
;PURPLE        = $60
;PURPLE_BLUE   = $70
;BLUE          = $80
;BLUE_CYAN     = $90
;CYAN          = $A0
;GREEN_CYAN    = $B0
;GREEN         = $C0
;YELLOW_GREEN  = $D0
;ORANGE_GREEN  = $E0
;BROWN         = $F0

  IF PAL
TIME_VBLANK     = 76
TIME_DRAWSCREEN = 214
TIME_OVERSCAN   = 81
  ELSE
TIME_VBLANK     = 52
TIME_DRAWSCREEN = 214
TIME_OVERSCAN   = 46
  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      RIOT RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

frameCounter       ds 1  ; x11
ram_81             ds 1  ; x5
ram_82             ds 1  ; x16
ram_83             ds 1  ; x13
ram_84             ds 6  ; x7
ram_8A             ds 8  ; x6
ram_92             ds 1  ; x11
ram_93             ds 1  ; x5
ram_94             ds 1  ; x12
ram_95             ds 1  ; x5
ram_96             ds 1  ; x5
ram_97             ds 1  ; x8
ram_98             ds 1  ; x10
ram_99             ds 1  ; x11
ram_9A             ds 1  ; x8
ram_9B             ds 1  ; x31
ram_9C             ds 1  ; x8
ram_9D             ds 1  ; x13
ram_9E             ds 1  ; x28
ram_9F             ds 1  ; x19
ram_A0             ds 1  ; x11
ram_A1             ds 1  ; x17
ram_A2             ds 1  ; x2
ram_A3             ds 1  ; x4
ram_A4             ds 1  ; x2
ram_A5             ds 1  ; x8
ram_A6             ds 1  ; x2
ram_A7             ds 1  ; x17
ram_A8             ds 1  ; x16
ram_A9             ds 1  ; x26
ram_AA             ds 1  ; x9
ram_AB             ds 1  ; x9
ram_AC             ds 1  ; x11
ram_AD             ds 1  ; x10
ram_AE             ds 1  ; x11
ram_AF             ds 1  ; x23
ram_B0             ds 1  ; x30
ram_B1             ds 1  ; x18
ram_B2             ds 1  ; x8
ram_B3             ds 1  ; x9
ram_B4             ds 1  ; x2
ram_B5             ds 1  ; x4
ram_B6             ds 1  ; x3
ram_B7             ds 1  ; x3
ram_B8             ds 1  ; x2
ram_B9             ds 1  ; x4
ram_BA             ds 9  ; x16
ram_C3             ds 7  ; x14
ram_CA             ds 1  ; x1
ram_CB             ds 1  ; x1
ram_CC             ds 1  ; x2
ram_CD             ds 1  ; x6
ram_CE             ds 1  ; x3
ram_CF             ds 1  ; x3
ram_D0             ds 1  ; x9
ram_D1             ds 1  ; x6
ram_D2             ds 1  ; x9
ram_D3             ds 1  ; x16
ram_D4             ds 15 ; x3
ram_E3             ds 22 ; x5
ram_F9             ds 1  ; x17
ram_FA             ds 1  ; x8
ram_FB             ds 5  ; x4


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE
       ORG $0000,0
      RORG $F000

START_0:
    sta    BANK_1                ; 4

    jmp    START_0               ; 3
LF006:
    sta    BANK_1                ; 4

    jmp    LF077                 ; 3

    sta    BANK_0                ; 4
LF00F:
    lda    ram_82                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LF089,X               ; 4
    sta    ram_9F                ; 3
    lda    LF08F,X               ; 4
    sta    ram_A0                ; 3
    jmp.ind (ram_9F)             ; 5

LF021:
    lda    INTIM                 ; 4
    bne    LF021                 ; 2³
    lda    #3                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #TIME_VBLANK          ; 2
    sta    TIM64T                ; 4
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #0                    ; 2
    stx    VSYNC                 ; 3
    lda    #BLACK                ; 2
    sta    COLUBK                ; 3
    lda    ram_82                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LF095,X               ; 4
    sta    ram_9F                ; 3
    lda    LF09B,X               ; 4
    sta    ram_A0                ; 3
    jmp.ind (ram_9F)             ; 5

LF051:
    lda    INTIM                 ; 4
    bne    LF051                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #TIME_DRAWSCREEN      ; 2
    sta    TIM64T                ; 4
    sta    CXCLR                 ; 3
    lda    #BLACK                ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    ram_82                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LF0A1,X               ; 4
    sta    ram_9F                ; 3
    lda    LF0A7,X               ; 4
    sta    ram_A0                ; 3
    jmp.ind (ram_9F)             ; 5

LF077:
    lda    ram_82                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LF0AD,X               ; 4
    sta    ram_9F                ; 3
    lda    LF0B3,X               ; 4
    sta    ram_A0                ; 3
    jmp.ind (ram_9F)             ; 5

LF089:
    .byte <LF4C6         ; $F089
    .byte <LF4C6         ; $F08A
    .byte <LF6F8         ; $F08B
    .byte <LF879         ; $F08C
    .byte <LF2D3         ; $F08D
    .byte <LF2D3         ; $F08E
LF08F:
    .byte >LF4C6         ; $F08F
    .byte >LF4C6         ; $F090
    .byte >LF6F8         ; $F091
    .byte >LF879         ; $F092
    .byte >LF2D3         ; $F093
    .byte >LF2D3         ; $F094

LF095:
    .byte <LF4F7         ; $F095
    .byte <LF4F7         ; $F096
    .byte <LF73B         ; $F097
    .byte <LF8B7         ; $F098
    .byte <LF2EA         ; $F099
    .byte <LF2EA         ; $F09A
LF09B:
    .byte >LF4F7         ; $F09B
    .byte >LF4F7         ; $F09C
    .byte >LF73B         ; $F09D
    .byte >LF8B7         ; $F09E
    .byte >LF2EA         ; $F09F
    .byte >LF2EA         ; $F0A0

LF0A1:
    .byte <LF60F         ; $F0A1
    .byte <LF60F         ; $F0A2
    .byte <LF7E0         ; $F0A3
    .byte <LF989         ; $F0A4
    .byte <LF2FA         ; $F0A5
    .byte <LF2FA         ; $F0A6
LF0A7:
    .byte >LF60F         ; $F0A7
    .byte >LF60F         ; $F0A8
    .byte >LF7E0         ; $F0A9
    .byte >LF989         ; $F0AA
    .byte >LF2FA         ; $F0AB
    .byte >LF2FA         ; $F0AC

LF0AD:
    .byte <LF60C         ; $F0AD
    .byte <LF60C         ; $F0AE
    .byte <LF876         ; $F0AF
    .byte <LF96C         ; $F0B0
    .byte <LF2F7         ; $F0B1
    .byte <LF2F7         ; $F0B2
LF0B3:
    .byte >LF60C         ; $F0B3
    .byte >LF60C         ; $F0B4
    .byte >LF876         ; $F0B5
    .byte >LF96C         ; $F0B6
    .byte >LF2F7         ; $F0B7
    .byte >LF2F7         ; $F0B8


    .byte $00 ; |        | $F0B9   free bytes
    .byte $00 ; |        | $F0BA
    .byte $00 ; |        | $F0BB
    .byte $00 ; |        | $F0BC
    .byte $00 ; |        | $F0BD
    .byte $00 ; |        | $F0BE
    .byte $00 ; |        | $F0BF
    .byte $00 ; |        | $F0C0
    .byte $00 ; |        | $F0C1
    .byte $00 ; |        | $F0C2
    .byte $00 ; |        | $F0C3
    .byte $00 ; |        | $F0C4


  IF PAL | PAL_M

CorrectCol3:
    STA   BANK_1
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    LDA   ram_81
    AND   ram_99
    TAX
    LDY   ColTab,X
    STY   $FF
    EOR   #$FF
    TAX
    LDY   ColTab,X
    STY   $FE
    JMP   CorrectCol3

  ELSE

    .byte $00 ; |        | $F0C5
    .byte $00 ; |        | $F0C6
    .byte $00 ; |        | $F0C7
    .byte $00 ; |        | $F0C8
    .byte $00 ; |        | $F0C9
    .byte $00 ; |        | $F0CA
    .byte $00 ; |        | $F0CB
    .byte $00 ; |        | $F0CC
    .byte $00 ; |        | $F0CD
    .byte $00 ; |        | $F0CE
    .byte $00 ; |        | $F0CF
    .byte $00 ; |        | $F0D0
    .byte $00 ; |        | $F0D1
    .byte $00 ; |        | $F0D2
    .byte $00 ; |        | $F0D3
    .byte $00 ; |        | $F0D4
    .byte $00 ; |        | $F0D5
    .byte $00 ; |        | $F0D6
    .byte $00 ; |        | $F0D7
    .byte $00 ; |        | $F0D8
    .byte $00 ; |        | $F0D9
    .byte $00 ; |        | $F0DA
    .byte $00 ; |        | $F0DB
    .byte $00 ; |        | $F0DC
    .byte $00 ; |        | $F0DD
    .byte $00 ; |        | $F0DE
    .byte $00 ; |        | $F0DF
    .byte $00 ; |        | $F0E0
    .byte $00 ; |        | $F0E1
    .byte $00 ; |        | $F0E2

   ENDIF

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

       ORG $0100,0
      RORG $F100

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF100 SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #3                    ; 2
    ldy    #0                    ; 2
    sty    REFP1                 ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    HMP1                  ; 3
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    sty    REFP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF12A:   ;jumped to from LF348
    sta    ram_B9                ; 3
LF12C:
    ldy    ram_B9                ; 3
    lda    (ram_AD),Y            ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_AF),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_B1),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_B3),Y            ; 5
    sta    ram_BA                ; 3
    lda    (ram_B5),Y            ; 5
    tax                          ; 2
    lda    (ram_B7),Y            ; 5
    tay                          ; 2
    lda    ram_BA                ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    dec    ram_B9                ; 5
    bpl    LF12C                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    rts                          ; 6   ;returns to (LF320 & jumps to LF006), or (LF333 & JSR to DrawSword)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;                XXXXX XXX
;               XXXXXXX  XX
;              XXXXXXXXX  XX
;             XXX  XXXXXX  X
;            XXX  X XXXXX XXX
;           XXX  XXX XXXX X X
;           XXX XXX   XXX XXX
;           XXX XX     XXX X
;           XXX XX      XXX X                          X
;           XXX XX       XXX                          XXX
;           XXX XX        X                           XXX
;           XXX XX                                    XXX
;            XXX XX                                    X
;             XXX XX                                   X
;              XXX  XX     X  X   X     X    X   X     X
;               XXXX  X   XXX XX XXX   XXX  XXX XXX XX X
;                XXXXX XX X X  X XXX   XXX  XXX XXX XX X
;                 XXXXX  X  X  X XXX  XX XX XXX XX XXXXX
;                  XXXXXX  XX X   X   XX XX  XX X  X XXX
;                   XXXXXX XX XX  XX  X   XX  XXX X   XXX
;                    XXXXX X  XX  XX  X   XX  XX  X   XXX
;                XX  XXXX XX XXX XXX XX  XXX XX  XX   XXX
;              XX XX  XXX XX XXX XXX XX  XXX XXX XX   XXX
;             XXXX XX XXX XX XXX XXX XX  XXX XXX XX   XXX
;            XXXXXX XX XX XX XXX XXX XX  XXX XXX XX   XXX
;           XXX  XXX X XX XX XXX XXX XX  XXX XXX XX   XXX
;          XXX  X XX X XX XX XXX XXX XX  XXX XXX XX   XXX
;          XXX XXX X   XXX XX XX  XX  X   XX  XX  X    XX
;          XXX XX      XXX XX XXX X   XX XX   X   XX  XX
;          XXX XX      XXXX XXX XXXX  XXXXX  XXX  XXXXXXX
;          XXX XX      XXXX XXX  XXX   XXX   XXX   XXX XX
;          XXX XXXX    XXXX XXX  XXX   XXX   XXX   XXX XX
;          XXX  X  X  XXXXXX X    X     X     X     X  X
;          XXXX  X  X XXXXXXX  X
;           XXXX  X  XXXXXXXXX X                      X
;            XXXX  X XXXXXXXXX X                     XXX
;             XXXX  XXXXXXXXXX X                     XXX
;            X XXXXXXXXXXXXXX                        XXX
;           XXX XXXXXXXXXXXX X   X   X   X     X      X
;           XXX  XXXXXXXXXX XXX XXX XXX XXX   XXX   X X X
;          XXX  X XXXXXXXX  X X XXX XXXXXXX  XX XX XXXXXXX
;          XXX XX          X  X XXX XXX  XX XX   XX X X X
;          XXX XX      XXX X X   X   X    X XX   XX   X
;          XXX XX      XXX  XX   XX  XX     XXX       XX
;          XXX XX      XXX  XX   XX  XX  X  XXXX      XX
;          XXX XX      XXX XX   XXX XXX XXX  XXXXX   XXX
;          XXX XX      XXX XX   XXX XXXXXXXX   XXXX  XXX
;          XXX XX      XXX XX   XXX XXX XXX    XXXXX  XX
;          XXX XX      XXX XX   XXX XXX X       XXXX XXX
;          XXX XX      XXX XX   XXX XXX      X   XXX XXX
;          XXX XX  X   XXX XX   XXX XXX     XXX  XXX XXX
;          XXX XX   X  XXX  XX   XX  XX   X XXX  XXX  XX
;           XX  X  X X XX X  XX XX   X    X XXX  XX   X
;           XXX X  XX XXX X XXXXXXX XXX  XX  X  XXX  XXX
;            XX  X XXXXX X  XXXXXXX XXXXXXX  XXXXX   XXX
;            XXX X  XXXXX   XXX XXX XXX XXX   XXX    XXX
;             XX  X  XXX X   X   X   X   X     X      X
;             XXX   XXXXX X    X
;              XXX XXX XXX X  XXX
;              XXXXXXX XXXX XXX X
;               XXXXX X  XXX XXXX
;                XXX X    XXX  X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SwordQuestOne:
    .byte $03 ; |      XX| $F15F
    .byte $07 ; |     XXX| $F160
    .byte $0F ; |    XXXX| $F161
    .byte $0E ; |    XXX | $F162
    .byte $1C ; |   XXX  | $F163
    .byte $19 ; |   XX  X| $F164
    .byte $3A ; |  XXX X | $F165
    .byte $32 ; |  XX  X | $F166
    .byte $74 ; | XXX X  | $F167
    .byte $64 ; | XX  X  | $F168
    .byte $EC ; |XXX XX  | $F169
    .byte $EC ; |XXX XX  | $F16A
    .byte $EC ; |XXX XX  | $F16B
    .byte $EC ; |XXX XX  | $F16C
    .byte $EC ; |XXX XX  | $F16D
    .byte $EC ; |XXX XX  | $F16E
    .byte $EC ; |XXX XX  | $F16F
    .byte $EC ; |XXX XX  | $F170
    .byte $EC ; |XXX XX  | $F171
    .byte $EC ; |XXX XX  | $F172
    .byte $EC ; |XXX XX  | $F173
    .byte $E5 ; |XXX  X X| $F174
    .byte $73 ; | XXX  XX| $F175
    .byte $77 ; | XXX XXX| $F176
    .byte $2F ; |  X XXXX| $F177
    .byte $1E ; |   XXXX | $F178
    .byte $3C ; |  XXXX  | $F179
    .byte $79 ; | XXXX  X| $F17A
    .byte $F2 ; |XXXX  X | $F17B
    .byte $E4 ; |XXX  X  | $F17C
    .byte $EF ; |XXX XXXX| $F17D
    .byte $EC ; |XXX XX  | $F17E
    .byte $EC ; |XXX XX  | $F17F
    .byte $EC ; |XXX XX  | $F180
    .byte $EE ; |XXX XXX | $F181
    .byte $E5 ; |XXX  X X| $F182
    .byte $73 ; | XXX  XX| $F183
    .byte $3F ; |  XXXXXX| $F184
    .byte $1E ; |   XXXX | $F185
    .byte $0D ; |    XX X| $F186
    .byte $03 ; |      XX| $F187
    .byte $00 ; |        | $F188
    .byte $00 ; |        | $F189
    .byte $00 ; |        | $F18A
    .byte $01 ; |       X| $F18B
    .byte $03 ; |      XX| $F18C
    .byte $07 ; |     XXX| $F18D
    .byte $0E ; |    XXX | $F18E
    .byte $1D ; |   XXX X| $F18F
    .byte $3B ; |  XXX XX| $F190
    .byte $76 ; | XXX XX | $F191
    .byte $76 ; | XXX XX | $F192
    .byte $76 ; | XXX XX | $F193
    .byte $76 ; | XXX XX | $F194
    .byte $76 ; | XXX XX | $F195
    .byte $77 ; | XXX XXX| $F196
    .byte $73 ; | XXX  XX| $F197
    .byte $39 ; |  XXX  X| $F198
    .byte $1C ; |   XXX  | $F199
    .byte $0F ; |    XXXX| $F19A
    .byte $07 ; |     XXX| $F19B
    .byte $03 ; |      XX| $F19C
SwordQuestTwo:
    .byte $A1 ; |X X    X| $F19D
    .byte $D3 ; |XX X  XX| $F19E
    .byte $EF ; |XXX XXXX| $F19F
    .byte $EE ; |XXX XXX | $F1A0
    .byte $7D ; | XXXXX X| $F1A1
    .byte $3A ; |  XXX X | $F1A2
    .byte $7C ; | XXXXX  | $F1A3
    .byte $FA ; |XXXXX X | $F1A4
    .byte $DD ; |XX XXX X| $F1A5
    .byte $AD ; |X X XX X| $F1A6
    .byte $4E ; | X  XXX | $F1A7
    .byte $8E ; |X   XXX | $F1A8
    .byte $0E ; |    XXX | $F1A9
    .byte $0E ; |    XXX | $F1AA
    .byte $0E ; |    XXX | $F1AB
    .byte $0E ; |    XXX | $F1AC
    .byte $0E ; |    XXX | $F1AD
    .byte $0E ; |    XXX | $F1AE
    .byte $0E ; |    XXX | $F1AF
    .byte $0E ; |    XXX | $F1B0
    .byte $00 ; |        | $F1B1
    .byte $FE ; |XXXXXXX | $F1B2
    .byte $FF ; |XXXXXXXX| $F1B3
    .byte $FF ; |XXXXXXXX| $F1B4
    .byte $FF ; |XXXXXXXX| $F1B5
    .byte $7F ; | XXXXXXX| $F1B6
    .byte $BF ; |X XXXXXX| $F1B7
    .byte $3F ; |  XXXXXX| $F1B8
    .byte $5F ; | X XXXXX| $F1B9
    .byte $9F ; |X  XXXXX| $F1BA
    .byte $0F ; |    XXXX| $F1BB
    .byte $0F ; |    XXXX| $F1BC
    .byte $0F ; |    XXXX| $F1BD
    .byte $0E ; |    XXX | $F1BE
    .byte $8E ; |X   XXX | $F1BF
    .byte $AD ; |X X XX X| $F1C0
    .byte $AD ; |X X XX X| $F1C1
    .byte $6D ; | XX XX X| $F1C2
    .byte $DD ; |XX XXX X| $F1C3
    .byte $9D ; |X  XXX X| $F1C4
    .byte $3D ; |  XXXX X| $F1C5
    .byte $3E ; |  XXXXX | $F1C6
    .byte $7E ; | XXXXXX | $F1C7
    .byte $FC ; |XXXXXX  | $F1C8
    .byte $F2 ; |XXXX  X | $F1C9
    .byte $ED ; |XXX XX X| $F1CA
    .byte $91 ; |X  X   X| $F1CB
    .byte $60 ; | XX     | $F1CC
    .byte $80 ; |X       | $F1CD
    .byte $00 ; |        | $F1CE
    .byte $00 ; |        | $F1CF
    .byte $01 ; |       X| $F1D0
    .byte $03 ; |      XX| $F1D1
    .byte $07 ; |     XXX| $F1D2
    .byte $0E ; |    XXX | $F1D3
    .byte $1D ; |   XXX X| $F1D4
    .byte $BD ; |X XXXX X| $F1D5
    .byte $7D ; | XXXXX X| $F1D6
    .byte $FC ; |XXXXXX  | $F1D7
    .byte $F9 ; |XXXXX  X| $F1D8
    .byte $F3 ; |XXXX  XX| $F1D9
    .byte $EE ; |XXX XXX | $F1DA
SwordQuestThree:
    .byte $C8 ; |XX  X   | $F1DB
    .byte $BC ; |X XXXX  | $F1DC
    .byte $74 ; | XXX X  | $F1DD
    .byte $9C ; |X  XXX  | $F1DE
    .byte $08 ; |    X   | $F1DF
    .byte $22 ; |  X   X | $F1E0
    .byte $77 ; | XXX XXX| $F1E1
    .byte $7F ; | XXXXXXX| $F1E2
    .byte $7F ; | XXXXXXX| $F1E3
    .byte $36 ; |  XX XX | $F1E4
    .byte $63 ; | XX   XX| $F1E5
    .byte $C7 ; |XX   XXX| $F1E6
    .byte $C7 ; |XX   XXX| $F1E7
    .byte $C7 ; |XX   XXX| $F1E8
    .byte $C7 ; |XX   XXX| $F1E9
    .byte $C7 ; |XX   XXX| $F1EA
    .byte $C7 ; |XX   XXX| $F1EB
    .byte $63 ; | XX   XX| $F1EC
    .byte $63 ; | XX   XX| $F1ED
    .byte $A2 ; |X X   X | $F1EE
    .byte $97 ; |X  X XXX| $F1EF
    .byte $57 ; | X X XXX| $F1F0
    .byte $77 ; | XXX XXX| $F1F1
    .byte $A2 ; |X X   X | $F1F2
    .byte $C0 ; |XX      | $F1F3
    .byte $E8 ; |XXX X   | $F1F4
    .byte $E8 ; |XXX X   | $F1F5
    .byte $E8 ; |XXX X   | $F1F6
    .byte $C8 ; |XX  X   | $F1F7
    .byte $A1 ; |X X    X| $F1F8
    .byte $73 ; | XXX  XX| $F1F9
    .byte $73 ; | XXX  XX| $F1FA
    .byte $77 ; | XXX XXX| $F1FB
    .byte $DD ; |XX XXX X| $F1FC
    .byte $D9 ; |XX XX  X| $F1FD
    .byte $BB ; |X XXX XX| $F1FE
    .byte $BB ; |X XXX XX| $F1FF
    .byte $BB ; |X XXX XX| $F200
    .byte $BB ; |X XXX XX| $F201
    .byte $BB ; |X XXX XX| $F202
    .byte $BB ; |X XXX XX| $F203
    .byte $99 ; |X  XX  X| $F204
    .byte $D9 ; |XX XX  X| $F205
    .byte $D1 ; |XX X   X| $F206
    .byte $4B ; | X  X XX| $F207
    .byte $4B ; | X  X XX| $F208
    .byte $DB ; |XX XX XX| $F209
    .byte $91 ; |X  X   X| $F20A
    .byte $00 ; |        | $F20B
    .byte $00 ; |        | $F20C
    .byte $00 ; |        | $F20D
    .byte $00 ; |        | $F20E
    .byte $80 ; |X       | $F20F
    .byte $40 ; | X      | $F210
    .byte $80 ; |X       | $F211
    .byte $C0 ; |XX      | $F212
    .byte $40 ; | X      | $F213
    .byte $C0 ; |XX      | $F214
    .byte $80 ; |X       | $F215
    .byte $80 ; |X       | $F216
    .byte $00 ; |        | $F217
    .byte $00 ; |        | $F218
SwordQuestFour:
    .byte $00 ; |        | $F219
    .byte $00 ; |        | $F21A
    .byte $00 ; |        | $F21B
    .byte $00 ; |        | $F21C
    .byte $00 ; |        | $F21D
    .byte $22 ; |  X   X | $F21E
    .byte $77 ; | XXX XXX| $F21F
    .byte $7F ; | XXXXXXX| $F220
    .byte $73 ; | XXX  XX| $F221
    .byte $21 ; |  X    X| $F222
    .byte $31 ; |  XX   X| $F223
    .byte $70 ; | XXX    | $F224
    .byte $70 ; | XXX    | $F225
    .byte $74 ; | XXX X  | $F226
    .byte $77 ; | XXX XXX| $F227
    .byte $7F ; | XXXXXXX| $F228
    .byte $77 ; | XXX XXX| $F229
    .byte $32 ; |  XX  X | $F22A
    .byte $30 ; |  XX    | $F22B
    .byte $21 ; |  X    X| $F22C
    .byte $73 ; | XXX  XX| $F22D
    .byte $7F ; | XXXXXXX| $F22E
    .byte $77 ; | XXX XXX| $F22F
    .byte $22 ; |  X   X | $F230
    .byte $00 ; |        | $F231
    .byte $00 ; |        | $F232
    .byte $00 ; |        | $F233
    .byte $00 ; |        | $F234
    .byte $00 ; |        | $F235
    .byte $04 ; |     X  | $F236
    .byte $8E ; |X   XXX | $F237
    .byte $8E ; |X   XXX | $F238
    .byte $9F ; |X  XXXXX| $F239
    .byte $1B ; |   XX XX| $F23A
    .byte $91 ; |X  X   X| $F23B
    .byte $B3 ; |X XX  XX| $F23C
    .byte $B3 ; |X XX  XX| $F23D
    .byte $B3 ; |X XX  XX| $F23E
    .byte $B3 ; |X XX  XX| $F23F
    .byte $B3 ; |X XX  XX| $F240
    .byte $B3 ; |X XX  XX| $F241
    .byte $91 ; |X  X   X| $F242
    .byte $91 ; |X  X   X| $F243
    .byte $1B ; |   XX XX| $F244
    .byte $9B ; |X  XX XX| $F245
    .byte $8E ; |X   XXX | $F246
    .byte $8E ; |X   XXX | $F247
    .byte $04 ; |     X  | $F248
    .byte $00 ; |        | $F249
    .byte $00 ; |        | $F24A
    .byte $00 ; |        | $F24B
    .byte $00 ; |        | $F24C
    .byte $00 ; |        | $F24D
    .byte $00 ; |        | $F24E
    .byte $00 ; |        | $F24F
    .byte $00 ; |        | $F250
    .byte $00 ; |        | $F251
    .byte $00 ; |        | $F252
    .byte $00 ; |        | $F253
    .byte $00 ; |        | $F254
    .byte $00 ; |        | $F255
    .byte $00 ; |        | $F256
SwordQuestFive:
    .byte $00 ; |        | $F257
    .byte $00 ; |        | $F258
    .byte $00 ; |        | $F259
    .byte $00 ; |        | $F25A
    .byte $00 ; |        | $F25B
    .byte $08 ; |    X   | $F25C
    .byte $1C ; |   XXX  | $F25D
    .byte $3E ; |  XXXXX | $F25E
    .byte $27 ; |  X  XXX| $F25F
    .byte $73 ; | XXX  XX| $F260
    .byte $73 ; | XXX  XX| $F261
    .byte $73 ; | XXX  XX| $F262
    .byte $23 ; |  X   XX| $F263
    .byte $07 ; |     XXX| $F264
    .byte $0F ; |    XXXX| $F265
    .byte $8F ; |X   XXXX| $F266
    .byte $3E ; |  XXXXX | $F267
    .byte $78 ; | XXXX   | $F268
    .byte $70 ; | XXX    | $F269
    .byte $63 ; | XX   XX| $F26A
    .byte $63 ; | XX   XX| $F26B
    .byte $36 ; |  XX XX | $F26C
    .byte $1C ; |   XXX  | $F26D
    .byte $08 ; |    X   | $F26E
    .byte $00 ; |        | $F26F
    .byte $00 ; |        | $F270
    .byte $00 ; |        | $F271
    .byte $00 ; |        | $F272
    .byte $00 ; |        | $F273
    .byte $10 ; |   X    | $F274
    .byte $38 ; |  XXX   | $F275
    .byte $38 ; |  XXX   | $F276
    .byte $39 ; |  XXX  X| $F277
    .byte $11 ; |   X   X| $F278
    .byte $99 ; |X  XX  X| $F279
    .byte $BB ; |X XXX XX| $F27A
    .byte $BB ; |X XXX XX| $F27B
    .byte $BB ; |X XXX XX| $F27C
    .byte $BB ; |X XXX XX| $F27D
    .byte $BB ; |X XXX XX| $F27E
    .byte $B3 ; |X XX  XX| $F27F
    .byte $99 ; |X  XX  X| $F280
    .byte $9D ; |X  XXX X| $F281
    .byte $34 ; |  XX X  | $F282
    .byte $76 ; | XXX XX | $F283
    .byte $77 ; | XXX XXX| $F284
    .byte $77 ; | XXX XXX| $F285
    .byte $22 ; |  X   X | $F286
    .byte $00 ; |        | $F287
    .byte $00 ; |        | $F288
    .byte $00 ; |        | $F289
    .byte $00 ; |        | $F28A
    .byte $00 ; |        | $F28B
    .byte $00 ; |        | $F28C
    .byte $00 ; |        | $F28D
    .byte $00 ; |        | $F28E
    .byte $00 ; |        | $F28F
    .byte $00 ; |        | $F290
    .byte $00 ; |        | $F291
    .byte $00 ; |        | $F292
    .byte $00 ; |        | $F293
    .byte $00 ; |        | $F294
SwordQuestSix:
    .byte $00 ; |        | $F295
    .byte $00 ; |        | $F296
    .byte $00 ; |        | $F297
    .byte $00 ; |        | $F298
    .byte $00 ; |        | $F299
    .byte $10 ; |   X    | $F29A
    .byte $38 ; |  XXX   | $F29B
    .byte $38 ; |  XXX   | $F29C
    .byte $38 ; |  XXX   | $F29D
    .byte $10 ; |   X    | $F29E
    .byte $98 ; |X  XX   | $F29F
    .byte $B8 ; |X XXX   | $F2A0
    .byte $B8 ; |X XXX   | $F2A1
    .byte $B8 ; |X XXX   | $F2A2
    .byte $98 ; |X  XX   | $F2A3
    .byte $38 ; |  XXX   | $F2A4
    .byte $38 ; |  XXX   | $F2A5
    .byte $18 ; |   XX   | $F2A6
    .byte $18 ; |   XX   | $F2A7
    .byte $10 ; |   X    | $F2A8
    .byte $54 ; | X X X  | $F2A9
    .byte $FE ; |XXXXXXX | $F2AA
    .byte $54 ; | X X X  | $F2AB
    .byte $10 ; |   X    | $F2AC
    .byte $38 ; |  XXX   | $F2AD
    .byte $38 ; |  XXX   | $F2AE
    .byte $38 ; |  XXX   | $F2AF
    .byte $10 ; |   X    | $F2B0
    .byte $00 ; |        | $F2B1
    .byte $48 ; | X  X   | $F2B2
    .byte $EC ; |XXX XX  | $F2B3
    .byte $EC ; |XXX XX  | $F2B4
    .byte $FC ; |XXXXXX  | $F2B5
    .byte $98 ; |X  XX   | $F2B6
    .byte $0C ; |    XX  | $F2B7
    .byte $1C ; |   XXX  | $F2B8
    .byte $1C ; |   XXX  | $F2B9
    .byte $1C ; |   XXX  | $F2BA
    .byte $1C ; |   XXX  | $F2BB
    .byte $1C ; |   XXX  | $F2BC
    .byte $1C ; |   XXX  | $F2BD
    .byte $1C ; |   XXX  | $F2BE
    .byte $1C ; |   XXX  | $F2BF
    .byte $B8 ; |X XXX   | $F2C0
    .byte $F8 ; |XXXXX   | $F2C1
    .byte $68 ; | XX X   | $F2C2
    .byte $68 ; | XX X   | $F2C3
    .byte $08 ; |    X   | $F2C4
    .byte $08 ; |    X   | $F2C5
    .byte $08 ; |    X   | $F2C6
    .byte $1C ; |   XXX  | $F2C7
    .byte $1C ; |   XXX  | $F2C8
    .byte $1C ; |   XXX  | $F2C9
    .byte $08 ; |    X   | $F2CA
    .byte $00 ; |        | $F2CB
    .byte $00 ; |        | $F2CC
    .byte $00 ; |        | $F2CD
    .byte $00 ; |        | $F2CE
    .byte $00 ; |        | $F2CF
    .byte $00 ; |        | $F2D0
    .byte $00 ; |        | $F2D1
    .byte $00 ; |        | $F2D2

LF2D3:   ;indirect jump
    lda    #$FF                  ; 2
    sta    ram_AC                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    RESM0                 ; 3
    nop                          ; 2
    nop                          ; 2
    sta    RESM1                 ; 3
    sta    RESBL                 ; 3
    jmp    LF021                 ; 3

LF2EA:   ;indirect jump
    ldx    #$0B                  ; 2
LF2EC:
    lda    LF43E,X               ; 4
    sta    ram_AD,X              ; 4
    dex                          ; 2
    bpl    LF2EC                 ; 2³
    jmp    LF051                 ; 3

LF2F7:   ;indirect jump
    jmp    LF021                 ; 3


;---------------------------------------
; set up for SWORD QUEST titlescreen
;--------------------------------------
LF2FA:   ;indirect jump
    lda    ram_81                ; 3   big counter, seems to count each new screen
    eor    #$4F                  ; 2
    bne    LF302                 ; 2³
    lda    #2                    ; 2
LF302:
    and    ram_AC                ; 3

  IF PAL | PAL_M
    TAX
    LDA   ColTab,X
  ENDIF

    sta    COLUP0                ; 3   dependent on that big counter
    sta    COLUP1                ; 3
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    ram_99                ; 3
    bne    LF330                 ; 2³
    lda    ram_98                ; 3
    bne    LF323                 ; 2³
    ldx    #$32                  ; 2
LF318:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LF318                 ; 2³
    jsr    LF339                 ; 6
LF320:
    jmp    LF006                 ; 3

LF323:
    ldx    #$32                  ; 2
LF325:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LF325                 ; 2³

  IF NTSC

    jsr    DrawSword             ; 6
    jmp    LF006                 ; 3

LF330:
    jsr    LF339                 ; 6
LF333:
    jsr    DrawSword             ; 6
    jmp    LF006                 ; 3

  ELSE

PF333:
    JSR    DrawSword   ; LDA #0
    BEQ    LF320       ; always branch

LF330:
    JSR    LF339
LF333:
    JMP    PF333

  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF339 SUBROUTINE
    lda    #BLACK                ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    LF100                 ; 6
    lda    #$3D                  ; 2
LF348:
    jmp    LF12A                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  IF NTSC

DrawSword SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    CTRLPF                ; 3
    lda    #$30                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    dec    ram_BA                ; 5
    inc    ram_BA                ; 5
    dec    ram_BA                ; 5
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    inc    ram_BA                ; 5
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    #0                    ; 2
    ldy    frameCounter          ; 3
LF374:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LF485,X               ; 4
    sta    GRP0                  ; 3
    sty    COLUP0                ; 3   dependent on framecounter
    sty    COLUP1                ; 3
    lda    LF49D,X               ; 4
    sta    GRP1                  ; 3
    dey                          ; 2
    dey                          ; 2
    inx                          ; 2
    cpx    #$18                  ; 2
    bcc    LF374                 ; 2³
    ldx    #0                    ; 2
    lda    ram_81                ; 3
    eor    #$D2                  ; 2
    bne    LF395                 ; 2³
    lda    #2                    ; 2
LF395:
    and    ram_AC                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$FF                  ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
LF3A3:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LF44A,X               ; 4
    sta    PF0                   ; 3
    sty    COLUPF                ; 3   dependent on framecounter
    lda    LF454,X               ; 4
    sta    PF1                   ; 3
    lda    LF45E,X               ; 4
    sta    PF2                   ; 3
    lda    LF468,X               ; 4
    sta    PF0                   ; 3
    lda    LF472,X               ; 4
    nop                          ; 2
    nop                          ; 2
    sta    PF1                   ; 3
    lda    LF47C,X               ; 4
    nop                          ; 2
    nop                          ; 2
    sta    PF2                   ; 3
    iny                          ; 2
    iny                          ; 2
    inx                          ; 2
    cpx    #9                    ; 2
    bne    LF3A3                 ; 2³
    dex                          ; 2
    dex                          ; 2
    dey                          ; 2
    dey                          ; 2
LF3D4:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LF44A,X               ; 4
    sta    PF0                   ; 3
    sty    COLUPF                ; 3   dependent on framecounter
    lda    LF454,X               ; 4
    sta    PF1                   ; 3
    lda    LF45E,X               ; 4
    sta    PF2                   ; 3
    lda    LF468,X               ; 4
    sta    PF0                   ; 3
    lda    LF472,X               ; 4
    nop                          ; 2
    nop                          ; 2
    sta    PF1                   ; 3
    lda    LF47C,X               ; 4
    nop                          ; 2
    nop                          ; 2
    sta    PF2                   ; 3
    dey                          ; 2
    dey                          ; 2
    dex                          ; 2
    bpl    LF3D4                 ; 2³
    lda    #0                    ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    ldx    #$17                  ; 2
    lda    LF485,X               ; 4
    sta    GRP0                  ; 3
    sty    COLUP0                ; 3   dependent on framecounter
    lda    LF49D,X               ; 4
    sta    GRP1                  ; 3
    sty    COLUP1                ; 3   dependent on framecounter
    iny                          ; 2
    iny                          ; 2
    dex                          ; 2
LF420:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LF485,X               ; 4
    sta    GRP0                  ; 3
    sty    COLUP0                ; 3   dependent on framecounter
    sty    COLUP1                ; 3
    lda    LF49D,X               ; 4
    sta    GRP1                  ; 3
    iny                          ; 2
    iny                          ; 2
    dex                          ; 2
    bpl    LF420                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    rts                          ; 6

  ELSE

DrawSword SUBROUTINE
    sta    WSYNC
;---------------------------------------
    LDA    #$30
    STA    NUSIZ0
    STA    NUSIZ1
    LDX    #0
    STX    VDELP0
    STX    VDELP1
    STX    CTRLPF
    LDY    frameCounter
    NOP
    NOP
    STA    RESP0
    STA    RESP1
    STA    WSYNC
    STA    WSYNC
;---------------------------------------
    STA    HMOVE

.loopHiltTop:
    LDA    ColTab,Y
    STA    WSYNC
;---------------------------------------
    STA    COLUP0
    STA    COLUP1
    LDA    LF485,X
    STA    GRP0
    LDA    LF49D,X
    STA    GRP1
    DEY
    DEY
    INX
    CPX    #24
    BCC    .loopHiltTop

    LDA    ram_81
    EOR    #$D2
    BNE    .skip1
    LDA    #2
.skip1:
    AND    ram_AC
    TAX
    LDA    ColTab,X
    STA    COLUP0         ; past the position of GRPx, nothing currently being drawed...
    STA    COLUP1
    LDX    #$FF
    STX    ENAM0
    STX    ENAM1
    STX    ENABL
    INX                   ; X=0

.loopBladeTop:
    LDA    ColTab,Y
    STA    WSYNC
;---------------------------------------
    STA    COLUPF
    LDA    LF44A,X
    STA    PF0
    LDA    LF454,X
    STA    PF1
    LDA    LF45E,X
    STA    PF2
    LDA    LF468,X
    STA    PF0
    LDA    LF472,X
    INY
    INY
    STA    PF1
    LDA    LF47C,X
    INX
    CPX    #9
    STA    PF2
    BNE    .loopBladeTop

    DEX
    DEX
    DEY
    DEY

.loopBladeBot:
    LDA    ColTab,Y
    STA    WSYNC
;---------------------------------------
    STA    COLUPF
    LDA    LF44A,X
    STA    PF0
    LDA    LF454,X
    STA    PF1
    LDA    LF45E,X
    STA    PF2
    LDA    LF468,X
    STA    PF0
    LDA    LF472,X
    DEY
    DEY
    STA    PF1
    LDA    LF47C,X
    DEX
    NOP
    STA    PF2
    BPL    .loopBladeBot

    LDA    ColTab,Y
    LDX    #0
    STX    ENAM0
    STX    ENAM1
    STX    ENABL
    STA    WSYNC
;---------------------------------------
    STX    PF0
    STX    PF1

    STA    COLUP0
    STA    COLUP1
    LDX    #23
    LDA    LF485,X
    STA    GRP0
    LDA    LF49D,X
    STA    GRP1
    INY
    INY
    DEX

.loopHiltBot:
    LDA    ColTab,Y
    STA    WSYNC
;---------------------------------------
    STA    COLUP0
    STA    COLUP1
    LDA    LF485,X
    STA    GRP0
    LDA    LF49D,X
    STA    GRP1
    INY
    INY
    DEX
    BPL    .loopHiltBot

    STA    WSYNC
;---------------------------------------
    LDA    #0
    STA    GRP0
    STA    GRP1
    RTS

  ENDIF

       ORG $043E
      RORG $F43E


LF43E:
    .word SwordQuestOne  ; $F43E
    .word SwordQuestTwo  ; $F440
    .word SwordQuestThree; $F442
    .word SwordQuestFour ; $F444
    .word SwordQuestFive ; $F446
    .word SwordQuestSix  ; $F448

LF44A:
    .byte $00 ; |        | $F44A   sword graphics
    .byte $00 ; |        | $F44B
    .byte $FF ; |XXXXXXXX| $F44C
    .byte $FF ; |XXXXXXXX| $F44D
    .byte $FF ; |XXXXXXXX| $F44E
    .byte $FF ; |XXXXXXXX| $F44F
    .byte $FF ; |XXXXXXXX| $F450
    .byte $FF ; |XXXXXXXX| $F451
    .byte $FF ; |XXXXXXXX| $F452
    .byte $FF ; |XXXXXXXX| $F453
LF454:
    .byte $FF ; |XXXXXXXX| $F454
    .byte $FF ; |XXXXXXXX| $F455
    .byte $00 ; |        | $F456
    .byte $00 ; |        | $F457
    .byte $FF ; |XXXXXXXX| $F458
    .byte $FF ; |XXXXXXXX| $F459
    .byte $FF ; |XXXXXXXX| $F45A
    .byte $FF ; |XXXXXXXX| $F45B
    .byte $FF ; |XXXXXXXX| $F45C
    .byte $FF ; |XXXXXXXX| $F45D
LF45E:
    .byte $FF ; |XXXXXXXX| $F45E
    .byte $FF ; |XXXXXXXX| $F45F
    .byte $00 ; |        | $F460
    .byte $00 ; |        | $F461
    .byte $FF ; |XXXXXXXX| $F462
    .byte $FF ; |XXXXXXXX| $F463
    .byte $FF ; |XXXXXXXX| $F464
    .byte $FF ; |XXXXXXXX| $F465
    .byte $FF ; |XXXXXXXX| $F466
    .byte $FF ; |XXXXXXXX| $F467
LF468:
    .byte $FF ; |XXXXXXXX| $F468
    .byte $FF ; |XXXXXXXX| $F469
    .byte $00 ; |        | $F46A
    .byte $00 ; |        | $F46B
    .byte $FF ; |XXXXXXXX| $F46C
    .byte $FF ; |XXXXXXXX| $F46D
    .byte $FF ; |XXXXXXXX| $F46E
    .byte $FF ; |XXXXXXXX| $F46F
    .byte $FF ; |XXXXXXXX| $F470
    .byte $FF ; |XXXXXXXX| $F471
LF472:
    .byte $E0 ; |XXX     | $F472
    .byte $F8 ; |XXXXX   | $F473
    .byte $7E ; | XXXXXX | $F474
    .byte $7F ; | XXXXXXX| $F475
    .byte $FF ; |XXXXXXXX| $F476
    .byte $FF ; |XXXXXXXX| $F477
    .byte $FF ; |XXXXXXXX| $F478
    .byte $FF ; |XXXXXXXX| $F479
    .byte $FF ; |XXXXXXXX| $F47A
    .byte $FF ; |XXXXXXXX| $F47B
LF47C:
    .byte $00 ; |        | $F47C
    .byte $00 ; |        | $F47D
    .byte $00 ; |        | $F47E
    .byte $01 ; |       X| $F47F
    .byte $07 ; |     XXX| $F480
    .byte $1F ; |   XXXXX| $F481
    .byte $3F ; |  XXXXXX| $F482
    .byte $7F ; | XXXXXXX| $F483
    .byte $FF ; |XXXXXXXX| $F484
LF485:
    .byte $0F ; |    XXXX| $F485
    .byte $1F ; |   XXXXX| $F486
    .byte $3E ; |  XXXXX | $F487
    .byte $7C ; | XXXXX  | $F488
    .byte $EE ; |XXX XXX | $F489
    .byte $C6 ; |XX   XX | $F48A
    .byte $EE ; |XXX XXX | $F48B
    .byte $7C ; | XXXXX  | $F48C
    .byte $38 ; |  XXX   | $F48D
    .byte $10 ; |   X    | $F48E
    .byte $01 ; |       X| $F48F
    .byte $01 ; |       X| $F490
    .byte $01 ; |       X| $F491
    .byte $19 ; |   XX  X| $F492
    .byte $3D ; |  XXXX X| $F493
    .byte $6F ; | XX XXXX| $F494
    .byte $C5 ; |XX   X X| $F495
    .byte $69 ; | XX X  X| $F496
    .byte $3C ; |  XXXX  | $F497
    .byte $0E ; |    XXX | $F498
    .byte $0F ; |    XXXX| $F499
    .byte $3F ; |  XXXXXX| $F49A
    .byte $7F ; | XXXXXXX| $F49B
    .byte $FF ; |XXXXXXXX| $F49C
LF49D:
    .byte $C0 ; |XX      | $F49D
    .byte $F0 ; |XXXX    | $F49E
    .byte $7C ; | XXXXX  | $F49F
    .byte $7E ; | XXXXXX | $F4A0
    .byte $5F ; | X XXXXX| $F4A1
    .byte $5B ; | X XX XX| $F4A2
    .byte $51 ; | X X   X| $F4A3
    .byte $7B ; | XXXX XX| $F4A4
    .byte $6F ; | XX XXXX| $F4A5
    .byte $C6 ; |XX   XX | $F4A6
    .byte $EC ; |XXX XX  | $F4A7
    .byte $78 ; | XXXX   | $F4A8
    .byte $70 ; | XXX    | $F4A9
    .byte $60 ; | XX     | $F4AA
    .byte $60 ; | XX     | $F4AB
    .byte $60 ; | XX     | $F4AC
    .byte $70 ; | XXX    | $F4AD
    .byte $B8 ; |X XXX   | $F4AE
    .byte $D8 ; |XX XX   | $F4AF
    .byte $EC ; |XXX XX  | $F4B0
    .byte $F4 ; |XXXX X  | $F4B1
    .byte $EE ; |XXX XXX | $F4B2
    .byte $DF ; |XX XXXXX| $F4B3
    .byte $BF ; |X XXXXXX| $F4B4

LF4B5:
    lda    ram_94                ; 3
    beq    LF4BA                 ; 2³
    rts                          ; 6

LF4BA:
    stx    ram_94                ; 3
    inx                          ; 2
    stx    ram_95                ; 3
    ldx    #0                    ; 2
    stx    ram_92                ; 3
    stx    ram_93                ; 3
    rts                          ; 6

LF4C6:   ;indirect jump
    lda    #0                    ; 2
    sta    ram_B1                ; 3
    lda    #$59                  ; 2
    sta    ram_AF                ; 3
    lda    #$AB                  ; 2
    sta    ram_B0                ; 3
    lda    #0                    ; 2
    sta    ram_FB                ; 3
    lda    #$FC                  ; 2
    sta    ram_F9                ; 3
    ldy    #6                    ; 2
LF4DC:
    lda    #5                    ; 2
    sta.wy ram_B3,Y              ; 5
    lda    LFB09,Y               ; 4
    sta.wy ram_C3,Y              ; 5
    lda    LFB10,Y               ; 4
    sta.wy ram_D3,Y              ; 5
    dey                          ; 2
    bpl    LF4DC                 ; 2³
    lda    #6                    ; 2
    sta    ram_FA                ; 3
    jmp    LF021                 ; 3

LF4F7:   ;indirect jump
    lda    #ORANGE_RED+3         ; 2
    sta    COLUP1                ; 3
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    sta    VDELP0                ; 3
    lda    #$1B                  ; 2
    sta    ram_A1                ; 3
    lda    #$0D                  ; 2
    sta    ram_A5                ; 3
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    bne    LF51B                 ; 2³
    inc    ram_B1                ; 5
    lda    ram_B1                ; 3
    cmp    #3                    ; 2
    bne    LF51B                 ; 2³
    lda    #0                    ; 2
    sta    ram_B1                ; 3
LF51B:
    lda    ram_B1                ; 3
    asl                          ; 2
    clc                          ; 2
    adc    ram_B1                ; 3
    asl                          ; 2
    clc                          ; 2
    adc    ram_B1                ; 3
    asl                          ; 2
    tay                          ; 2
    ldx    #0                    ; 2
LF529:
    lda    LFADF,Y               ; 4
    sta    ram_E3,X              ; 4
    inx                          ; 2
    iny                          ; 2
    cpx    #$0E                  ; 2
    bne    LF529                 ; 2³
    lda    CXPPMM                ; 3
    bpl    LF544                 ; 2³
    lda    ram_F9                ; 3
    cmp    #$FC                  ; 2
    bne    LF544                 ; 2³
    ldx    #$FF                  ; 2
    stx    ram_F9                ; 3
    stx    CXCLR                 ; 3
LF544:
    jsr    LF9BB                 ; 6
    dec    ram_FA                ; 5
    bne    LF54F                 ; 2³
    lda    #$14                  ; 2
    sta    ram_FA                ; 3
LF54F:
    lda    ram_FA                ; 3
    cmp    #$0A                  ; 2
    bcc    LF560                 ; 2³
    lda    #>ManClimbTwo         ; 2
    sta    ram_9C                ; 3
    lda    #<ManClimbTwo         ; 2
    sta    ram_9B                ; 3
    jmp    LF568                 ; 3

LF560:
    lda    #>ManClimbOne         ; 2
    sta    ram_9C                ; 3
    lda    #<ManClimbOne         ; 2
    sta    ram_9B                ; 3
LF568:
    lda    ram_F9                ; 3
    cmp    #$FC                  ; 2
    beq    LF57D                 ; 2³
    ldx    #8                    ; 2
    jsr    LF4B5                 ; 6
    ldx    ram_F9                ; 3
    inx                          ; 2
    clc                          ; 2
    lda    ram_AF                ; 3
    adc    ram_D3,X              ; 4
    sta    ram_AF                ; 3
LF57D:
    jsr    LF583                 ; 6
    jmp    LF5A8                 ; 3

LF583:
    lda    SWCHA                 ; 4
    bmi    LF58A                 ; 2³
    inc    ram_AF                ; 5
LF58A:
    lda    ram_AF                ; 3
    cmp    #$9C                  ; 2
    bcc    LF592                 ; 2³
    lda    #$9B                  ; 2
LF592:
    sta    ram_AF                ; 3
    lda    SWCHA                 ; 4
    and    #$40                  ; 2
    bne    LF59D                 ; 2³
    dec    ram_AF                ; 5
LF59D:
    lda    ram_AF                ; 3
    cmp    #$17                  ; 2
    bcs    LF5A5                 ; 2³
    lda    #$17                  ; 2
LF5A5:
    sta    ram_AF                ; 3
    rts                          ; 6

LF5A8:
    lda    ram_F9                ; 3
    cmp    #$FC                  ; 2
    beq    LF5B3                 ; 2³
    inc    ram_B0                ; 5
    jmp    LF5DC                 ; 3

LF5B3:
    lda    SWCHA                 ; 4
    and    #$10                  ; 2
    bne    LF5C6                 ; 2³
    inc    ram_B0                ; 5
    lda    ram_B0                ; 3
    cmp    #$AD                  ; 2
    bne    LF5C6                 ; 2³
    lda    #$AC                  ; 2
    sta    ram_B0                ; 3
LF5C6:
    lda    CXP0FB                ; 3
    bmi    LF5DC                 ; 2³
    lda    SWCHA                 ; 4
    and    #$20                  ; 2
    bne    LF5DC                 ; 2³
    dec    ram_B0                ; 5
    lda    ram_B0                ; 3
    cmp    #$1B                  ; 2
    bne    LF5DC                 ; 2³
    jsr    LF9DC                 ; 6
LF5DC:
    lda    ram_AF                ; 3
    jsr    LFA00                 ; 6
    ldy    #6                    ; 2
LF5E3:
    lda.wy ram_C3,Y              ; 4
    clc                          ; 2
    adc.wy ram_D3,Y              ; 4
    sta.wy ram_C3,Y              ; 5
    cmp    #$82                  ; 2
    beq    LF5F5                 ; 2³
    cmp    #$0A                  ; 2
    bne    LF600                 ; 2³+1
LF5F5:
    lda    #1                    ; 2
    sec                          ; 2
    lda    #0                    ; 2
    sbc.wy ram_D3,Y              ; 4
    sta.wy ram_D3,Y              ; 5
LF600:
    dey                          ; 2
    bpl    LF5E3                 ; 2³+1
    sta    CXCLR                 ; 3
    lda    #$FC                  ; 2
    sta    ram_F9                ; 3
    jmp    LF051                 ; 3

LF60C:   ;indirect jump
    jmp    LF021                 ; 3

LF60F:   ;indirect jump
    lda    #<LF6CA               ; 2
    sta    ram_9F                ; 3
    lda    #>LF6CA               ; 2
    sta    ram_A0                ; 3
    lda    #ORANGE_RED+3         ; 2
    sta    COLUP1                ; 3
    lda    #WHITE+1              ; 2
    sta    COLUP0                ; 3
    lda    #BLUE_CYAN+2          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    ldy    #$AD                  ; 2
    sty    ram_9E                ; 3
    lda    #6                    ; 2
    sta    ram_9D                ; 3
    ldx    #$1B                  ; 2
    ldy    #0                    ; 2
LF631:
    dec    ram_9E                ; 5
    lda    ram_9E                ; 3
    cmp    ram_B0                ; 3
    bne    LF63B                 ; 2³
    ldy    ram_A1                ; 3
LF63B:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_9B),Y            ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    LF646                 ; 2³
    ldy    #0                    ; 2
LF646:
    dex                          ; 2
    bne    LF631                 ; 2³
LF649:
    dec    ram_9E                ; 5
    lda    ram_B0                ; 3
    cmp    ram_9E                ; 3
    bne    LF653                 ; 2³
    ldy    ram_A1                ; 3
LF653:
    lda    (ram_9B),Y            ; 5
    dey                          ; 2
    bpl    LF65A                 ; 2³
    ldy    #0                    ; 2
LF65A:
    ldx    ram_9D                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ram_C3,X              ; 4
    ldx    ram_FB                ; 3
    beq    LF671                 ; 2³
    pha                          ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFA6A,X               ; 4
    sta    COLUP1                ; 3   done
    pla                          ; 4
LF671:
    tax                          ; 2
    jsr    LFA1D                 ; 6
    lda    CXPPMM                ; 3
    bpl    LF686                 ; 2³
    lda    ram_F9                ; 3
    cmp    #$FE                  ; 2
    bne    LF682                 ; 2³
    tya                          ; 2
    bpl    LF686                 ; 2³
LF682:
    ldx    ram_9D                ; 3
    stx    ram_F9                ; 3
LF686:
    sta    CXCLR                 ; 3
    ldx    ram_A5                ; 3
LF68A:
    dec    ram_9E                ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_9E                ; 3
    cmp    ram_B0                ; 3
    bne    LF696                 ; 2³
    ldy    ram_A1                ; 3
LF696:
    lda    (ram_9B),Y            ; 5
    sta    GRP0                  ; 3
    lda    ram_E3,X              ; 4
    sta    GRP1                  ; 3
    dey                          ; 2
    bpl    LF6A3                 ; 2³
    ldy    #0                    ; 2
LF6A3:
    dex                          ; 2
    bpl    LF68A                 ; 2³
    dec    ram_9D                ; 5
    bpl    LF649                 ; 2³
    dec    ram_9E                ; 5
LF6AC:
    lda    ram_9E                ; 3
    cmp    #8                    ; 2
    beq    LF6C7                 ; 2³
    cmp    ram_B0                ; 3
    bne    LF6B8                 ; 2³
    ldy    ram_A1                ; 3
LF6B8:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_9B),Y            ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    LF6C3                 ; 2³
    ldy    #0                    ; 2
LF6C3:
    dec    ram_9E                ; 5
    bne    LF6AC                 ; 2³
LF6C7:
    jmp.ind (ram_9F)             ; 5

LF6CA:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$F0                  ; 2
    sta    PF0                   ; 3
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
    lda    #$0F                  ; 2
    sta    PF2                   ; 3
    lda    (ram_9B),Y            ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    LF6E1                 ; 2³
    ldy    #0                    ; 2
LF6E1:
    dec    ram_9E                ; 5
    bne    LF6CA                 ; 2³
    lda    #BLACK                ; 2  shared
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    PF0                   ; 3
    sta    COLUBK                ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    jmp    LF006                 ; 3

LF6F8:   ;indirect jump
    lda    #$FF                  ; 2
    sta    ram_FB                ; 3
    lda    #$59                  ; 2
    sta    ram_AF                ; 3
    lda    #$1E                  ; 2
    sta    ram_B0                ; 3
    lda    #$FE                  ; 2
    sta    ram_F9                ; 3
    lda    #$2E                  ; 2  $FF2E
    sta    ram_FA                ; 3
    lda    #ORANGE_RED+8         ; 2
    sta    COLUPF                ; 3
    ldx    #$0F                  ; 2
    lda    #$50                  ; 2
LF714:
    sta    ram_C3,X              ; 4
    dex                          ; 2
    bpl    LF714                 ; 2³
    ldy    #4                    ; 2
LF71B:
    lda    LFA7E,Y               ; 4
    sta.wy ram_E3,Y              ; 5
    dey                          ; 2
    bpl    LF71B                 ; 2³
    ldx    #$0D                  ; 2
LF726:
    lda    LFA83,X               ; 4
    sta    ram_C3,X              ; 4
    lda    LFA91,X               ; 4
    sta    ram_D3,X              ; 4
    lda    LFA9F,X               ; 4
    sta    ram_B3,X              ; 4
    dex                          ; 2
    bpl    LF726                 ; 2³
    jmp    LF021                 ; 3

LF73B:   ;indirect jump
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    sta    VDELP0                ; 3
    lda    #$1B                  ; 2
    sta    ram_A1                ; 3
    lda    #4                    ; 2
    sta    ram_A5                ; 3
    lda    CXP0FB                ; 3
    bmi    LF755                 ; 2³
    lda    CXPPMM                ; 3
    bpl    LF755                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_F9                ; 3
LF755:
    jsr    LF9BB                 ; 6
    lda    #$FC                  ; 2
    sta    ram_9C                ; 3
    lda    #$67                  ; 2
    sta    ram_9B                ; 3
    lda    ram_AF                ; 3
    jsr    LFA00                 ; 6
    lda    ram_F9                ; 3
    cmp    #$FE                  ; 2
    bne    LF774                 ; 2³
    lda    #$1E                  ; 2
    cmp    ram_B0                ; 3
    sta    ram_B0                ; 3
    jmp    LF783                 ; 3

LF774:
    lda    CXP0FB                ; 3
    bmi    LF783                 ; 2³
    lda    ram_F9                ; 3
    tax                          ; 2
    inx                          ; 2
    clc                          ; 2
    lda    ram_AF                ; 3
    adc    ram_D3,X              ; 4
    sta    ram_AF                ; 3
LF783:
    jsr    LF583                 ; 6
    lda    SWCHA                 ; 4
    eor    ram_B2                ; 3
    and    #$10                  ; 2
    beq    LF7B3                 ; 2³
    lda    SWCHA                 ; 4
    and    #$10                  ; 2
    bne    LF7B3                 ; 2³
    ldx    #$0C                  ; 2
    jsr    LF4BA                 ; 6
    clc                          ; 2
    lda    ram_B0                ; 3
    adc    #9                    ; 2
    sta    ram_B0                ; 3
    cmp    #$A5                  ; 2
    bne    LF7B3                 ; 2³
    lda    ram_AF                ; 3
    cmp    #$49                  ; 2
    bcc    LF7B3                 ; 2³
    cmp    #$6A                  ; 2
    bcs    LF7B3                 ; 2³
    jsr    LF9DC                 ; 6
LF7B3:
    lda    SWCHA                 ; 4
    sta    ram_B2                ; 3
    lda    #$FE                  ; 2
    sta    ram_F9                ; 3
    ldx    #$0D                  ; 2
LF7BE:
    clc                          ; 2
    lda    ram_C3,X              ; 4
    adc    ram_D3,X              ; 4
    sta    ram_C3,X              ; 4
    cmp    #0                    ; 2
    bne    LF7D0                 ; 2³
    lda    #$9F                  ; 2
    sta    ram_C3,X              ; 4
    jmp    LF7D8                 ; 3

LF7D0:
    cmp    #$A0                  ; 2
    bne    LF7DA                 ; 2³
    lda    #1                    ; 2
    sta    ram_C3,X              ; 4
LF7D8:
    lda    #2                    ; 2
LF7DA:
    dex                          ; 2
    bpl    LF7BE                 ; 2³
    jmp    LF051                 ; 3

LF7E0:   ;indirect jump
    lda    #<LF84E               ; 2
    sta    ram_9F                ; 3
    lda    #>LF84E               ; 2
    sta    ram_A0                ; 3
    lda    #$0D                  ; 2
    sta    ram_9D                ; 3
    lda    #WHITE+1              ; 2
    sta    COLUP0                ; 3
    lda    #BLUE_CYAN+2          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    lda    #$F0                  ; 2
    sta    PF0                   ; 3
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
    lda    #$0F                  ; 2
    sta    PF2                   ; 3
    ldy    #$AD                  ; 2
    sty    ram_9E                ; 3
    ldy    #0                    ; 2
    ldx    #8                    ; 2
LF80A:
    dec    ram_9E                ; 5
    lda    ram_9E                ; 3
    cmp    ram_B0                ; 3
    bne    LF814                 ; 2³
    ldy    ram_A1                ; 3
LF814:
    dex                          ; 2
    beq    LF825                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_9B),Y            ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    LF822                 ; 2³
    ldy    #0                    ; 2
LF822:
    jmp    LF80A                 ; 3

LF825:
    ldx    ram_A1                ; 3
LF827:
    lda    ram_9E                ; 3
    cmp    ram_B0                ; 3
    bne    LF82F                 ; 2³
    ldy    ram_A1                ; 3
LF82F:
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    lda    (ram_9B),Y            ; 5
    sta    GRP0                  ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    dey                          ; 2
    bpl    LF844                 ; 2³
    ldy    #0                    ; 2
LF844:
    dec    ram_9E                ; 5
    dex                          ; 2
    bne    LF827                 ; 2³
    inc    ram_9E                ; 5
    jmp    LF649                 ; 3

LF84E:
    lda    #$F0                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    lda    (ram_9B),Y            ; 5
    sta    GRP0                  ; 3
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    dey                          ; 2
    bpl    LF863                 ; 2³
    ldy    #0                    ; 2
LF863:
    dec    ram_9E                ; 5
    bne    LF84E                 ; 2³
    lda    #BLACK                ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    jmp    LF006                 ; 3

LF876:   ;indirect jump
    jmp    LF021                 ; 3

LF879:   ;indirect jump
    lda    #0                    ; 2
    sta    ram_B1                ; 3
    sta    ram_FB                ; 3
    lda    #$FC                  ; 2
    sta    ram_F9                ; 3
    ldy    #$0B                  ; 2
LF885:
    lda    #5                    ; 2
    sta.wy ram_B3,Y              ; 5
    lda    LFAAE,Y               ; 4
    sta.wy ram_C3,Y              ; 5
    lda    LFABA,Y               ; 4
    sta.wy ram_D3,Y              ; 5
    dey                          ; 2
    bpl    LF885                 ; 2³
    ldy    #$0A                  ; 2
LF89B:
    lda    LFAC7,Y               ; 4
    sta.wy ram_E3,Y              ; 5
    dey                          ; 2
    bpl    LF89B                 ; 2³
    lda    #5                    ; 2
    sta    NUSIZ0                ; 3
    lda    #$17                  ; 2
    sta    ram_AF                ; 3
    lda    #$55                  ; 2
    sta    ram_B0                ; 3
    lda    #$2E                  ; 2
    sta    ram_FA                ; 3
    jmp    LF021                 ; 3

LF8B7:   ;indirect jump
    lda    #BLACK                ; 2   shared
    sta    VDELP0                ; 3
    sta    COLUP1                ; 3
    lda    #5                    ; 2
    sta    NUSIZ0                ; 3
    ldx    #$0A                  ; 2
    stx    ram_A5                ; 3
    ldx    #$0B                  ; 2
    stx    ram_A1                ; 3
    lda    frameCounter          ; 3
    and    #$17                  ; 2
    bne    LF8EB                 ; 2³
    inc    ram_B1                ; 5
    lda    ram_B1                ; 3
    and    #$01                  ; 2
    sta    ram_B1                ; 3
    asl                          ; 2
    clc                          ; 2
    adc    ram_B1                ; 3
    asl                          ; 2
    asl                          ; 2
    tay                          ; 2
    ldx    #0                    ; 2
LF8E0:
    lda    LFAC7,Y               ; 4
    sta    ram_E3,X              ; 4
    iny                          ; 2
    inx                          ; 2
    cpx    #$0B                  ; 2
    bne    LF8E0                 ; 2³
LF8EB:
    lda    #$30                  ; 2
    sta    PF0                   ; 3
    lda    #BLACK                ; 2
    sta    COLUPF                ; 3
    jsr    LF9BB                 ; 6
    inc    ram_FA                ; 5
    lda    ram_FA                ; 3
    lsr                          ; 2
    and    #$0C                  ; 2
    sta    ram_9B                ; 3
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    ram_9B                ; 3
    asl                          ; 2
    lsr    ram_9B                ; 5
    clc                          ; 2
    adc    ram_9B                ; 3
    clc                          ; 2
    adc    #0                    ; 2
    sta    ram_9B                ; 3
    lda    #$FC                  ; 2
    adc    #0                    ; 2
    sta    ram_9C                ; 3
    lda    SWCHA                 ; 4
    and    #$10                  ; 2
    bne    LF928                 ; 2³
    inc    ram_B0                ; 5
    lda    ram_B0                ; 3
    cmp    #$AB                  ; 2
    bne    LF928                 ; 2³
    lda    #$AA                  ; 2
    sta    ram_B0                ; 3
LF928:
    lda    SWCHA                 ; 4
    and    #$20                  ; 2
    bne    LF93B                 ; 2³
    dec    ram_B0                ; 5
    lda    ram_B0                ; 3
    cmp    #$13                  ; 2
    bne    LF93B                 ; 2³
    lda    #$14                  ; 2
    sta    ram_B0                ; 3
LF93B:
    jsr    LF583                 ; 6
    lda    ram_AF                ; 3
    cmp    #$9B                  ; 2
    bne    LF947                 ; 2³
    jsr    LF9DC                 ; 6
LF947:
    lda    ram_F9                ; 3
    cmp    #$FC                  ; 2
    bne    LF951                 ; 2³
    lda    CXPPMM                ; 3
    bpl    LF95E                 ; 2³
LF951:
    ldx    #$0A                  ; 2
    jsr    LF4B5                 ; 6
    lda    #$17                  ; 2
    sta    ram_AF                ; 3
    lda    #$55                  ; 2
    sta    ram_B0                ; 3
LF95E:
    lda    ram_AF                ; 3
    jsr    LFA00                 ; 6
    lda    #$FC                  ; 2
    sta    ram_F9                ; 3
    sta    CXCLR                 ; 3
    jmp    LF051                 ; 3

LF96C:   ;indirect jump
    ldy    #$0A                  ; 2
LF96E:
    lda.wy ram_C3,Y              ; 4
    clc                          ; 2
    adc.wy ram_D3,Y              ; 4
    sta.wy ram_C3,Y              ; 5
    cmp    #0                    ; 2
    bne    LF983                 ; 2³
    lda    #3                    ; 2
    lda    #$9E                  ; 2
    sta.wy ram_C3,Y              ; 5
LF983:
    dey                          ; 2
    bpl    LF96E                 ; 2³
    jmp    LF021                 ; 3

LF989:   ;indirect jump
    lda    #GREY+2               ; 2
    sta    COLUP1                ; 3
    lda    #5                    ; 2
    sta    CTRLPF                ; 3
    lda    #$0A                  ; 2
    sta    ram_9D                ; 3
    lda    #WHITE+1              ; 2
    sta    COLUP0                ; 3
    ldy    #$AD                  ; 2
    sty    ram_9E                ; 3
    lda    #BLUE_CYAN+2          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    ldy    #0                    ; 2
    lda    #<LF9B0               ; 2
    sta    ram_9F                ; 3
    lda    #>LF9B0               ; 2
    sta    ram_A0                ; 3
    jmp    LF649                 ; 3

LF9B0:   ;see label stored right above here
    lda    #BLACK                ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    sta    PF0                   ; 3
    jmp    LF006                 ; 3

LF9BB:
    lda    INPT_4                ; 3
    eor    ram_AE                ; 3
    and    #$80                  ; 2
    beq    LF9D7                 ; 2³
    lda    INPT_4                ; 3
    sta    ram_AE                ; 3
    and    #$80                  ; 2
    bne    LF9D7                 ; 2³
    lda    #2                    ; 2
    sta    ram_97                ; 3
    rts                          ; 6

    lda    #0                    ; 2   is this ever used?
    sta    ram_82                ; 3
    jmp    LF00F                 ; 3
LF9D7:
    lda    INPT_4                ; 3
    sta    ram_AE                ; 3
    rts                          ; 6

LF9DC:
    inc    ram_98                ; 5
    rts                          ; 6

    .byte $00 ; |        | $F9DF
    .byte $00 ; |        | $F9E0
    .byte $00 ; |        | $F9E1
    .byte $00 ; |        | $F9E2
    .byte $00 ; |        | $F9E3
    .byte $00 ; |        | $F9E4
    .byte $00 ; |        | $F9E5
    .byte $00 ; |        | $F9E6
    .byte $00 ; |        | $F9E7
    .byte $00 ; |        | $F9E8
    .byte $00 ; |        | $F9E9
    .byte $00 ; |        | $F9EA
    .byte $00 ; |        | $F9EB
    .byte $00 ; |        | $F9EC
    .byte $00 ; |        | $F9ED
    .byte $00 ; |        | $F9EE
    .byte $00 ; |        | $F9EF
    .byte $00 ; |        | $F9F0
    .byte $00 ; |        | $F9F1
    .byte $00 ; |        | $F9F2
    .byte $00 ; |        | $F9F3
    .byte $00 ; |        | $F9F4
    .byte $00 ; |        | $F9F5
    .byte $00 ; |        | $F9F6
    .byte $00 ; |        | $F9F7
    .byte $00 ; |        | $F9F8
    .byte $00 ; |        | $F9F9
    .byte $00 ; |        | $F9FA
    .byte $00 ; |        | $F9FB
    .byte $00 ; |        | $F9FC
    .byte $00 ; |        | $F9FD
    .byte $00 ; |        | $F9FE
    .byte $00 ; |        | $F9FF

LFA00:
    tax                          ; 2
    lda    LFF00,X               ; 4
    pha                          ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    pla                          ; 4
    and    #$F0                  ; 2
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
LFA0F:
    dex                          ; 2
    bne    LFA0F                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    rts                          ; 6

LFA1D:
    dec    ram_9E                ; 5
    lda    ram_B0                ; 3
    cmp    ram_9E                ; 3
    bne    LFA27                 ; 2³
    ldy    ram_A1                ; 3
LFA27:
    lda    (ram_9B),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    sta    GRP0                  ; 3
    lda    LFF00,X               ; 4
    pha                          ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    pla                          ; 4
    and    #$F0                  ; 2
    sta    HMP1                  ; 3
    dec    ram_9E                ; 5
    lda    ram_9E                ; 3
    cmp    ram_B0                ; 3
    bne    LFA44                 ; 2³
    ldy    ram_A1                ; 3
LFA44:
    lda    (ram_9B),Y            ; 5
    dey                          ; 2
    dec    ram_9E                ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
LFA4D:
    dex                          ; 2
    bne    LFA4D                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_9E                ; 3
    cmp    ram_B0                ; 3
    bne    LFA5E                 ; 2³
    ldy    ram_A1                ; 3
LFA5E:
    lda    (ram_9B),Y            ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    ldx    ram_9D                ; 3
    lda    ram_B3,X              ; 4
    sta    NUSIZ1                ; 3
    rts                          ; 6

LFA6A:
    .byte BLUE_CYAN+5    ; $FA6A
    .byte BLUE_CYAN+5    ; $FA6B
    .byte BLUE_CYAN+7    ; $FA6C
    .byte BLUE_CYAN+9    ; $FA6D
    .byte BLUE_CYAN+11   ; $FA6E
    .byte BLUE_CYAN+12   ; $FA6F
    .byte BLUE_CYAN+15   ; $FA70
    .byte BLUE_CYAN+15   ; $FA71
    .byte BLUE_CYAN+15   ; $FA72
    .byte BLUE_CYAN+15   ; $FA73
    .byte BLUE_CYAN+15   ; $FA74
    .byte BLUE_CYAN+15   ; $FA75
    .byte BLUE_CYAN+12   ; $FA76
    .byte BLUE_CYAN+11   ; $FA77
    .byte BLUE_CYAN+9    ; $FA78
    .byte BLUE_CYAN+7    ; $FA79
    .byte BLUE_CYAN+5    ; $FA7A
    .byte BLUE_CYAN+5    ; $FA7B
    .byte BLUE_CYAN+5    ; $FA7C
    .byte BLUE_CYAN+5    ; $FA7D
LFA7E:
    .byte $00 ; |        | $FA7E  ram_E3
    .byte $FF ; |XXXXXXXX| $FA7F  ram_E4
    .byte $7E ; | XXXXXX | $FA80  ram_E5
    .byte $3C ; |  XXXX  | $FA81  ram_E6
    .byte $18 ; |   XX   | $FA82  ram_E7
LFA83:
    .byte $20 ; |  X     | $FA83  ram_C3
    .byte $46 ; | X   XX | $FA84  ram_C4
    .byte $5A ; | X XX X | $FA85  ram_C5
    .byte $38 ; |  XXX   | $FA86  ram_C6
    .byte $3C ; |  XXXX  | $FA87  ram_C7
    .byte $14 ; |   X X  | $FA88  ram_C8
    .byte $52 ; | X X  X | $FA89  ram_C9
    .byte $30 ; |  XX    | $FA8A  ram_CA
    .byte $22 ; |  X   X | $FA8B  ram_CB
    .byte $44 ; | X   X  | $FA8C  ram_CC
    .byte $52 ; | X X  X | $FA8D  ram_CD
    .byte $34 ; |  XX X  | $FA8E  ram_CE
    .byte $18 ; |   XX   | $FA8F  ram_CF
    .byte $56 ; | X X XX | $FA90  ram_D0
LFA91:
    .byte $01 ; |       X| $FA91  ram_D3
    .byte $FF ; |XXXXXXXX| $FA92  ram_D4
    .byte $01 ; |       X| $FA93  ram_D5
    .byte $FF ; |XXXXXXXX| $FA94  ram_D6
    .byte $01 ; |       X| $FA95  ram_D7
    .byte $FF ; |XXXXXXXX| $FA96  ram_D8
    .byte $01 ; |       X| $FA97  ram_D9
    .byte $FF ; |XXXXXXXX| $FA98  ram_DA
    .byte $01 ; |       X| $FA99  ram_DB
    .byte $FF ; |XXXXXXXX| $FA9A  ram_DC
    .byte $01 ; |       X| $FA9B  ram_DD
    .byte $FF ; |XXXXXXXX| $FA9C  ram_DE
    .byte $01 ; |       X| $FA9D  ram_DF
    .byte $FF ; |XXXXXXXX| $FA9E  ram_E0
LFA9F:
    .byte $05 ; |     X X| $FA9F  ram_B3
    .byte $03 ; |      XX| $FAA0  ram_B4
    .byte $07 ; |     XXX| $FAA1  ram_B5
    .byte $05 ; |     X X| $FAA2  ram_B6
    .byte $03 ; |      XX| $FAA3  ram_B7
    .byte $05 ; |     X X| $FAA4  ram_B8
    .byte $07 ; |     XXX| $FAA5  ram_B9
    .byte $03 ; |      XX| $FAA6  ram_BA
    .byte $05 ; |     X X| $FAA7  ram_BB
    .byte $05 ; |     X X| $FAA8  ram_BC
    .byte $03 ; |      XX| $FAA9  ram_BD
    .byte $07 ; |     XXX| $FAAA  ram_BE
    .byte $03 ; |      XX| $FAAB  ram_BF
    .byte $07 ; |     XXX| $FAAC  ram_C0

    .byte $05 ; |     X X| $FAAD   <-- might not be used!
LFAAE:
    .byte $54 ; | X X X  | $FAAE  ram_C3
    .byte $62 ; | XX   X | $FAAF  ram_C4
    .byte $32 ; |  XX  X | $FAB0  ram_C5
    .byte $12 ; |   X  X | $FAB1  ram_C6
    .byte $24 ; |  X  X  | $FAB2  ram_C7
    .byte $40 ; | X      | $FAB3  ram_C8
    .byte $02 ; |      X | $FAB4  ram_C9
    .byte $22 ; |  X   X | $FAB5  ram_CA
    .byte $4E ; | X  XXX | $FAB6  ram_CB
    .byte $34 ; |  XX X  | $FAB7  ram_CC
    .byte $08 ; |    X   | $FAB8  ram_CD
    .byte $80 ; |X       | $FAB9  ram_CE
LFABA:
    .byte $FF ; |XXXXXXXX| $FABA  ram_D3
    .byte $FE ; |XXXXXXX | $FABB  ram_D4
    .byte $FF ; |XXXXXXXX| $FABC  ram_D5
    .byte $FE ; |XXXXXXX | $FABD  ram_D6
    .byte $FF ; |XXXXXXXX| $FABE  ram_D7
    .byte $FE ; |XXXXXXX | $FABF  ram_D8
    .byte $FF ; |XXXXXXXX| $FAC0  ram_D9
    .byte $FE ; |XXXXXXX | $FAC1  ram_DA
    .byte $FF ; |XXXXXXXX| $FAC2  ram_DB
    .byte $FE ; |XXXXXXX | $FAC3  ram_DC
    .byte $FF ; |XXXXXXXX| $FAC4  ram_DD
    .byte $FE ; |XXXXXXX | $FAC5  ram_DE

    .byte $FF ; |XXXXXXXX| $FAC6
LFAC7:
    .byte $00 ; |        | $FAC7
    .byte $01 ; |       X| $FAC8
    .byte $75 ; | XXX X X| $FAC9
    .byte $3F ; |  XXXXXX| $FACA
    .byte $FE ; |XXXXXXX | $FACB
    .byte $FD ; |XXXXXX X| $FACC
    .byte $79 ; | XXXX  X| $FACD
    .byte $30 ; |  XX    | $FACE
    .byte $10 ; |   X    | $FACF
    .byte $00 ; |        | $FAD0
    .byte $00 ; |        | $FAD1

    .byte $00 ; |        | $FAD2
    .byte $00 ; |        | $FAD3
    .byte $20 ; |  X     | $FAD4
    .byte $20 ; |  X     | $FAD5
    .byte $34 ; |  XX X  | $FAD6
    .byte $3D ; |  XXXX X| $FAD7
    .byte $FF ; |XXXXXXXX| $FAD8
    .byte $FE ; |XXXXXXX | $FAD9
    .byte $79 ; | XXXX  X| $FADA
    .byte $31 ; |  XX   X| $FADB
    .byte $11 ; |   X   X| $FADC
    .byte $00 ; |        | $FADD
    .byte $00 ; |        | $FADE
LFADF:
    .byte $00 ; |        | $FADF
    .byte $40 ; | X      | $FAE0
    .byte $20 ; |  X     | $FAE1
    .byte $90 ; |X  X    | $FAE2
    .byte $49 ; | X  X  X| $FAE3
    .byte $23 ; |  X   XX| $FAE4
    .byte $13 ; |   X  XX| $FAE5
    .byte $4F ; | X  XXXX| $FAE6
    .byte $AF ; |X X XXXX| $FAE7
    .byte $17 ; |   X XXX| $FAE8
    .byte $0D ; |    XX X| $FAE9
    .byte $16 ; |   X XX | $FAEA
    .byte $02 ; |      X | $FAEB
    .byte $00 ; |        | $FAEC
    .byte $00 ; |        | $FAED
    .byte $20 ; |  X     | $FAEE
    .byte $10 ; |   X    | $FAEF
    .byte $08 ; |    X   | $FAF0
    .byte $05 ; |     X X| $FAF1
    .byte $4B ; | X  X XX| $FAF2
    .byte $2F ; |  X XXXX| $FAF3
    .byte $17 ; |   X XXX| $FAF4
    .byte $0F ; |    XXXX| $FAF5
    .byte $4D ; | X  XX X| $FAF6
    .byte $26 ; |  X  XX | $FAF7
    .byte $12 ; |   X  X | $FAF8
    .byte $00 ; |        | $FAF9
    .byte $00 ; |        | $FAFA
    .byte $00 ; |        | $FAFB
    .byte $00 ; |        | $FAFC
    .byte $00 ; |        | $FAFD
    .byte $81 ; |X      X| $FAFE
    .byte $73 ; | XXX  XX| $FAFF
    .byte $0B ; |    X XX| $FB00
    .byte $8F ; |X   XXXX| $FB01
    .byte $77 ; | XXX XXX| $FB02
    .byte $8D ; |X   XX X| $FB03
    .byte $76 ; | XXX XX | $FB04
    .byte $02 ; |      X | $FB05
    .byte $00 ; |        | $FB06
    .byte $00 ; |        | $FB07
    .byte $00 ; |        | $FB08
LFB09:
    .byte $16 ; |   X XX | $FB09
    .byte $20 ; |  X     | $FB0A
    .byte $48 ; | X  X   | $FB0B
    .byte $5A ; | X XX X | $FB0C
    .byte $22 ; |  X   X | $FB0D
    .byte $54 ; | X X X  | $FB0E
    .byte $38 ; |  XXX   | $FB0F
LFB10:
    .byte $02 ; |      X | $FB10
    .byte $FE ; |XXXXXXX | $FB11
    .byte $01 ; |       X| $FB12
    .byte $FF ; |XXXXXXXX| $FB13
    .byte $02 ; |      X | $FB14
    .byte $FF ; |XXXXXXXX| $FB15
    .byte $01 ; |       X| $FB16
    .byte $FF ; |XXXXXXXX| $FB17
    .byte $00 ; |        | $FB18
    .byte $00 ; |        | $FB19
    .byte $00 ; |        | $FB1A
    .byte $00 ; |        | $FB1B
    .byte $00 ; |        | $FB1C
    .byte $00 ; |        | $FB1D
    .byte $00 ; |        | $FB1E
    .byte $00 ; |        | $FB1F
    .byte $00 ; |        | $FB20
    .byte $00 ; |        | $FB21
    .byte $00 ; |        | $FB22
    .byte $00 ; |        | $FB23
    .byte $00 ; |        | $FB24
    .byte $00 ; |        | $FB25
    .byte $00 ; |        | $FB26
    .byte $00 ; |        | $FB27
    .byte $00 ; |        | $FB28
    .byte $00 ; |        | $FB29
    .byte $00 ; |        | $FB2A
    .byte $00 ; |        | $FB2B
    .byte $00 ; |        | $FB2C
    .byte $00 ; |        | $FB2D
    .byte $00 ; |        | $FB2E
    .byte $00 ; |        | $FB2F
    .byte $00 ; |        | $FB30
    .byte $00 ; |        | $FB31
    .byte $00 ; |        | $FB32
    .byte $00 ; |        | $FB33
    .byte $00 ; |        | $FB34
    .byte $00 ; |        | $FB35
    .byte $00 ; |        | $FB36
    .byte $00 ; |        | $FB37
    .byte $00 ; |        | $FB38
    .byte $00 ; |        | $FB39
    .byte $00 ; |        | $FB3A
    .byte $00 ; |        | $FB3B
    .byte $00 ; |        | $FB3C
    .byte $00 ; |        | $FB3D
    .byte $00 ; |        | $FB3E
    .byte $00 ; |        | $FB3F
    .byte $00 ; |        | $FB40
    .byte $00 ; |        | $FB41
    .byte $00 ; |        | $FB42
    .byte $00 ; |        | $FB43
    .byte $00 ; |        | $FB44
    .byte $00 ; |        | $FB45
    .byte $00 ; |        | $FB46
    .byte $00 ; |        | $FB47
    .byte $00 ; |        | $FB48
    .byte $00 ; |        | $FB49
    .byte $00 ; |        | $FB4A
    .byte $00 ; |        | $FB4B
    .byte $00 ; |        | $FB4C
    .byte $00 ; |        | $FB4D
    .byte $00 ; |        | $FB4E
    .byte $00 ; |        | $FB4F
    .byte $00 ; |        | $FB50
    .byte $00 ; |        | $FB51
    .byte $00 ; |        | $FB52
    .byte $00 ; |        | $FB53
    .byte $00 ; |        | $FB54
    .byte $00 ; |        | $FB55
    .byte $00 ; |        | $FB56
    .byte $00 ; |        | $FB57
    .byte $00 ; |        | $FB58
    .byte $00 ; |        | $FB59
    .byte $00 ; |        | $FB5A
    .byte $00 ; |        | $FB5B
    .byte $00 ; |        | $FB5C
    .byte $00 ; |        | $FB5D
    .byte $00 ; |        | $FB5E
    .byte $00 ; |        | $FB5F
    .byte $00 ; |        | $FB60
    .byte $00 ; |        | $FB61
    .byte $00 ; |        | $FB62
    .byte $00 ; |        | $FB63
    .byte $00 ; |        | $FB64
    .byte $00 ; |        | $FB65
    .byte $00 ; |        | $FB66
    .byte $00 ; |        | $FB67
    .byte $00 ; |        | $FB68
    .byte $00 ; |        | $FB69
    .byte $00 ; |        | $FB6A
    .byte $00 ; |        | $FB6B
    .byte $00 ; |        | $FB6C
    .byte $00 ; |        | $FB6D
    .byte $00 ; |        | $FB6E
    .byte $00 ; |        | $FB6F
    .byte $00 ; |        | $FB70
    .byte $00 ; |        | $FB71
    .byte $00 ; |        | $FB72
    .byte $00 ; |        | $FB73
    .byte $00 ; |        | $FB74
    .byte $00 ; |        | $FB75
    .byte $00 ; |        | $FB76
    .byte $00 ; |        | $FB77
    .byte $00 ; |        | $FB78
    .byte $00 ; |        | $FB79
    .byte $00 ; |        | $FB7A
    .byte $00 ; |        | $FB7B
    .byte $00 ; |        | $FB7C
    .byte $00 ; |        | $FB7D
    .byte $00 ; |        | $FB7E
    .byte $00 ; |        | $FB7F
    .byte $00 ; |        | $FB80
    .byte $00 ; |        | $FB81
    .byte $00 ; |        | $FB82
    .byte $00 ; |        | $FB83
    .byte $00 ; |        | $FB84
    .byte $00 ; |        | $FB85
    .byte $00 ; |        | $FB86
    .byte $00 ; |        | $FB87
    .byte $00 ; |        | $FB88
    .byte $00 ; |        | $FB89
    .byte $00 ; |        | $FB8A
    .byte $00 ; |        | $FB8B
    .byte $00 ; |        | $FB8C
    .byte $00 ; |        | $FB8D
    .byte $00 ; |        | $FB8E
    .byte $00 ; |        | $FB8F
    .byte $00 ; |        | $FB90
    .byte $00 ; |        | $FB91
    .byte $00 ; |        | $FB92
    .byte $00 ; |        | $FB93
    .byte $00 ; |        | $FB94
    .byte $00 ; |        | $FB95
    .byte $00 ; |        | $FB96
    .byte $00 ; |        | $FB97
    .byte $00 ; |        | $FB98
    .byte $00 ; |        | $FB99
    .byte $00 ; |        | $FB9A
    .byte $00 ; |        | $FB9B
    .byte $00 ; |        | $FB9C
    .byte $00 ; |        | $FB9D
    .byte $00 ; |        | $FB9E
    .byte $00 ; |        | $FB9F
    .byte $00 ; |        | $FBA0
    .byte $00 ; |        | $FBA1
    .byte $00 ; |        | $FBA2
    .byte $00 ; |        | $FBA3
    .byte $00 ; |        | $FBA4
    .byte $00 ; |        | $FBA5
    .byte $00 ; |        | $FBA6
    .byte $00 ; |        | $FBA7
    .byte $00 ; |        | $FBA8
    .byte $00 ; |        | $FBA9
    .byte $00 ; |        | $FBAA
    .byte $00 ; |        | $FBAB
    .byte $00 ; |        | $FBAC
    .byte $00 ; |        | $FBAD
    .byte $00 ; |        | $FBAE
    .byte $00 ; |        | $FBAF
    .byte $00 ; |        | $FBB0
    .byte $00 ; |        | $FBB1
    .byte $00 ; |        | $FBB2
    .byte $00 ; |        | $FBB3
    .byte $00 ; |        | $FBB4
    .byte $00 ; |        | $FBB5
    .byte $00 ; |        | $FBB6
    .byte $00 ; |        | $FBB7
    .byte $00 ; |        | $FBB8
    .byte $00 ; |        | $FBB9
    .byte $00 ; |        | $FBBA
    .byte $00 ; |        | $FBBB
    .byte $00 ; |        | $FBBC
    .byte $00 ; |        | $FBBD
    .byte $00 ; |        | $FBBE
    .byte $00 ; |        | $FBBF
    .byte $00 ; |        | $FBC0
    .byte $00 ; |        | $FBC1
    .byte $00 ; |        | $FBC2
    .byte $00 ; |        | $FBC3
    .byte $00 ; |        | $FBC4
    .byte $00 ; |        | $FBC5
    .byte $00 ; |        | $FBC6
    .byte $00 ; |        | $FBC7
    .byte $00 ; |        | $FBC8
    .byte $00 ; |        | $FBC9
    .byte $00 ; |        | $FBCA
    .byte $00 ; |        | $FBCB
    .byte $00 ; |        | $FBCC
    .byte $00 ; |        | $FBCD
    .byte $00 ; |        | $FBCE
    .byte $00 ; |        | $FBCF
    .byte $00 ; |        | $FBD0
    .byte $00 ; |        | $FBD1
    .byte $00 ; |        | $FBD2
    .byte $00 ; |        | $FBD3
    .byte $00 ; |        | $FBD4
    .byte $00 ; |        | $FBD5
    .byte $00 ; |        | $FBD6
    .byte $00 ; |        | $FBD7
    .byte $00 ; |        | $FBD8
    .byte $00 ; |        | $FBD9
    .byte $00 ; |        | $FBDA
    .byte $00 ; |        | $FBDB
    .byte $00 ; |        | $FBDC
    .byte $00 ; |        | $FBDD
    .byte $00 ; |        | $FBDE
    .byte $00 ; |        | $FBDF
    .byte $00 ; |        | $FBE0
    .byte $00 ; |        | $FBE1
    .byte $00 ; |        | $FBE2
    .byte $00 ; |        | $FBE3
    .byte $00 ; |        | $FBE4
    .byte $00 ; |        | $FBE5
    .byte $00 ; |        | $FBE6
    .byte $00 ; |        | $FBE7
    .byte $00 ; |        | $FBE8
    .byte $00 ; |        | $FBE9
    .byte $00 ; |        | $FBEA
    .byte $00 ; |        | $FBEB
    .byte $00 ; |        | $FBEC
    .byte $00 ; |        | $FBED
    .byte $00 ; |        | $FBEE
    .byte $00 ; |        | $FBEF
    .byte $00 ; |        | $FBF0
    .byte $00 ; |        | $FBF1
    .byte $00 ; |        | $FBF2
    .byte $00 ; |        | $FBF3
    .byte $00 ; |        | $FBF4
    .byte $00 ; |        | $FBF5
    .byte $00 ; |        | $FBF6
    .byte $00 ; |        | $FBF7
    .byte $00 ; |        | $FBF8
    .byte $00 ; |        | $FBF9
    .byte $00 ; |        | $FBFA
    .byte $00 ; |        | $FBFB
    .byte $00 ; |        | $FBFC
    .byte $00 ; |        | $FBFD
    .byte $00 ; |        | $FBFE
    .byte $00 ; |        | $FBFF



Swim1:
    .byte $00 ; |        | $FC00
    .byte $80 ; |X       | $FC01
    .byte $80 ; |X       | $FC02
    .byte $40 ; | X      | $FC03
    .byte $60 ; | XX     | $FC04
    .byte $33 ; |  XX  XX| $FC05
    .byte $1E ; |   XXXX | $FC06
    .byte $BC ; |X XXXX  | $FC07
    .byte $CE ; |XX  XXX | $FC08
    .byte $16 ; |   X XX | $FC09
    .byte $0A ; |    X X | $FC0A
    .byte $00 ; |        | $FC0B
Swim2:
    .byte $00 ; |        | $FC0C
    .byte $00 ; |        | $FC0D
    .byte $00 ; |        | $FC0E
    .byte $01 ; |       X| $FC0F
    .byte $02 ; |      X | $FC10
    .byte $84 ; |X    X  | $FC11
    .byte $9C ; |X  XXX  | $FC12
    .byte $FE ; |XXXXXXX | $FC13
    .byte $FE ; |XXXXXXX | $FC14
    .byte $0A ; |    X X | $FC15
    .byte $08 ; |    X   | $FC16
    .byte $04 ; |     X  | $FC17
Swim3:
    .byte $00 ; |        | $FC18
    .byte $00 ; |        | $FC19
    .byte $90 ; |X  X    | $FC1A
    .byte $88 ; |X   X   | $FC1B
    .byte $40 ; | X      | $FC1C
    .byte $6C ; | XX XX  | $FC1D
    .byte $3E ; |  XXXXX | $FC1E
    .byte $1E ; |   XXXX | $FC1F
    .byte $AE ; |X X XXX | $FC20
    .byte $C8 ; |XX  X   | $FC21
    .byte $06 ; |     XX | $FC22
    .byte $03 ; |      XX| $FC23
Swim4:
    .byte $00 ; |        | $FC24
    .byte $00 ; |        | $FC25
    .byte $00 ; |        | $FC26
    .byte $00 ; |        | $FC27
    .byte $80 ; |X       | $FC28
    .byte $B8 ; |X XXX   | $FC29
    .byte $FC ; |XXXXXX  | $FC2A
    .byte $FF ; |XXXXXXXX| $FC2B
    .byte $1E ; |   XXXX | $FC2C
    .byte $0A ; |    X X | $FC2D
    .byte $00 ; |        | $FC2E
    .byte $00 ; |        | $FC2F
ManClimbOne:
    .byte $00 ; |        | $FC30
    .byte $02 ; |      X | $FC31
    .byte $16 ; |   X XX | $FC32
    .byte $3A ; |  XXX X | $FC33
    .byte $3A ; |  XXX X | $FC34
    .byte $16 ; |   X XX | $FC35
    .byte $3E ; |  XXXXX | $FC36
    .byte $7C ; | XXXXX  | $FC37
    .byte $78 ; | XXXX   | $FC38
    .byte $38 ; |  XXX   | $FC39
    .byte $38 ; |  XXX   | $FC3A
    .byte $1C ; |   XXX  | $FC3B
    .byte $24 ; |  X  X  | $FC3C
    .byte $24 ; |  X  X  | $FC3D
    .byte $24 ; |  X  X  | $FC3E
    .byte $04 ; |     X  | $FC3F
    .byte $04 ; |     X  | $FC40
    .byte $04 ; |     X  | $FC41
    .byte $06 ; |     XX | $FC42
    .byte $00 ; |        | $FC43
    .byte $00 ; |        | $FC44
    .byte $00 ; |        | $FC45
    .byte $00 ; |        | $FC46
    .byte $00 ; |        | $FC47
    .byte $00 ; |        | $FC48
    .byte $00 ; |        | $FC49
    .byte $00 ; |        | $FC4A
ManClimbTwo:
    .byte $00 ; |        | $FC4B
    .byte $40 ; | X      | $FC4C
    .byte $68 ; | XX X   | $FC4D
    .byte $5C ; | X XXX  | $FC4E
    .byte $5C ; | X XXX  | $FC4F
    .byte $68 ; | XX X   | $FC50
    .byte $73 ; | XXX  XX| $FC51
    .byte $3E ; |  XXXXX | $FC52
    .byte $1E ; |   XXXX | $FC53
    .byte $1C ; |   XXX  | $FC54
    .byte $1C ; |   XXX  | $FC55
    .byte $1C ; |   XXX  | $FC56
    .byte $38 ; |  XXX   | $FC57
    .byte $24 ; |  X  X  | $FC58
    .byte $24 ; |  X  X  | $FC59
    .byte $24 ; |  X  X  | $FC5A
    .byte $20 ; |  X     | $FC5B
    .byte $20 ; |  X     | $FC5C
    .byte $20 ; |  X     | $FC5D
    .byte $60 ; | XX     | $FC5E
    .byte $00 ; |        | $FC5F
    .byte $00 ; |        | $FC60
    .byte $00 ; |        | $FC61
    .byte $00 ; |        | $FC62
    .byte $00 ; |        | $FC63
    .byte $00 ; |        | $FC64
    .byte $00 ; |        | $FC65
    .byte $00 ; |        | $FC66
    .byte $00 ; |        | $FC67
    .byte $14 ; |   X X  | $FC68
    .byte $14 ; |   X X  | $FC69
    .byte $14 ; |   X X  | $FC6A
    .byte $14 ; |   X X  | $FC6B
    .byte $14 ; |   X X  | $FC6C
    .byte $14 ; |   X X  | $FC6D
    .byte $3E ; |  XXXXX | $FC6E
    .byte $3E ; |  XXXXX | $FC6F
    .byte $3E ; |  XXXXX | $FC70
    .byte $3E ; |  XXXXX | $FC71
    .byte $3E ; |  XXXXX | $FC72
    .byte $3E ; |  XXXXX | $FC73
    .byte $3E ; |  XXXXX | $FC74
    .byte $1C ; |   XXX  | $FC75
    .byte $08 ; |    X   | $FC76
    .byte $1C ; |   XXX  | $FC77
    .byte $1C ; |   XXX  | $FC78
    .byte $08 ; |    X   | $FC79
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
    .byte $00 ; |        | $FC9D
    .byte $00 ; |        | $FC9E
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
    .byte $00 ; |        | $FCEF
    .byte $00 ; |        | $FCF0
    .byte $00 ; |        | $FCF1
    .byte $00 ; |        | $FCF2
    .byte $00 ; |        | $FCF3
    .byte $00 ; |        | $FCF4
    .byte $00 ; |        | $FCF5
    .byte $00 ; |        | $FCF6
    .byte $00 ; |        | $FCF7
    .byte $00 ; |        | $FCF8
    .byte $00 ; |        | $FCF9
    .byte $00 ; |        | $FCFA
    .byte $00 ; |        | $FCFB
    .byte $00 ; |        | $FCFC
    .byte $00 ; |        | $FCFD
    .byte $00 ; |        | $FCFE
    .byte $00 ; |        | $FCFF
    .byte $00 ; |        | $FD00
    .byte $00 ; |        | $FD01
    .byte $00 ; |        | $FD02
    .byte $00 ; |        | $FD03
    .byte $00 ; |        | $FD04
    .byte $00 ; |        | $FD05
    .byte $00 ; |        | $FD06
    .byte $00 ; |        | $FD07
    .byte $00 ; |        | $FD08
    .byte $00 ; |        | $FD09
    .byte $00 ; |        | $FD0A
    .byte $00 ; |        | $FD0B
    .byte $00 ; |        | $FD0C
    .byte $00 ; |        | $FD0D
    .byte $00 ; |        | $FD0E
    .byte $00 ; |        | $FD0F
    .byte $00 ; |        | $FD10
    .byte $00 ; |        | $FD11
    .byte $00 ; |        | $FD12
    .byte $00 ; |        | $FD13
    .byte $00 ; |        | $FD14
    .byte $00 ; |        | $FD15
    .byte $00 ; |        | $FD16
    .byte $00 ; |        | $FD17
    .byte $00 ; |        | $FD18
    .byte $00 ; |        | $FD19
    .byte $00 ; |        | $FD1A
    .byte $00 ; |        | $FD1B
    .byte $00 ; |        | $FD1C
    .byte $00 ; |        | $FD1D
    .byte $00 ; |        | $FD1E
    .byte $00 ; |        | $FD1F
    .byte $00 ; |        | $FD20
    .byte $00 ; |        | $FD21
    .byte $00 ; |        | $FD22
    .byte $00 ; |        | $FD23
    .byte $00 ; |        | $FD24
    .byte $00 ; |        | $FD25
    .byte $00 ; |        | $FD26
    .byte $00 ; |        | $FD27
    .byte $00 ; |        | $FD28
    .byte $00 ; |        | $FD29
    .byte $00 ; |        | $FD2A
    .byte $00 ; |        | $FD2B
    .byte $00 ; |        | $FD2C
    .byte $00 ; |        | $FD2D
    .byte $00 ; |        | $FD2E
    .byte $00 ; |        | $FD2F
    .byte $00 ; |        | $FD30
    .byte $00 ; |        | $FD31
    .byte $00 ; |        | $FD32
    .byte $00 ; |        | $FD33
    .byte $00 ; |        | $FD34
    .byte $00 ; |        | $FD35
    .byte $00 ; |        | $FD36
    .byte $00 ; |        | $FD37
    .byte $00 ; |        | $FD38
    .byte $00 ; |        | $FD39
    .byte $00 ; |        | $FD3A
    .byte $00 ; |        | $FD3B
    .byte $00 ; |        | $FD3C
    .byte $00 ; |        | $FD3D
    .byte $00 ; |        | $FD3E
    .byte $00 ; |        | $FD3F
    .byte $00 ; |        | $FD40
    .byte $00 ; |        | $FD41
    .byte $00 ; |        | $FD42
    .byte $00 ; |        | $FD43
    .byte $00 ; |        | $FD44
    .byte $00 ; |        | $FD45
    .byte $00 ; |        | $FD46
    .byte $00 ; |        | $FD47
    .byte $00 ; |        | $FD48
    .byte $00 ; |        | $FD49
    .byte $00 ; |        | $FD4A
    .byte $00 ; |        | $FD4B
    .byte $00 ; |        | $FD4C
    .byte $00 ; |        | $FD4D
    .byte $00 ; |        | $FD4E
    .byte $00 ; |        | $FD4F
    .byte $00 ; |        | $FD50
    .byte $00 ; |        | $FD51
    .byte $00 ; |        | $FD52
    .byte $00 ; |        | $FD53
    .byte $00 ; |        | $FD54
    .byte $00 ; |        | $FD55
    .byte $00 ; |        | $FD56
    .byte $00 ; |        | $FD57
    .byte $00 ; |        | $FD58
    .byte $00 ; |        | $FD59
    .byte $00 ; |        | $FD5A
    .byte $00 ; |        | $FD5B
    .byte $00 ; |        | $FD5C
    .byte $00 ; |        | $FD5D
    .byte $00 ; |        | $FD5E
    .byte $00 ; |        | $FD5F
    .byte $00 ; |        | $FD60
    .byte $00 ; |        | $FD61
    .byte $00 ; |        | $FD62
    .byte $00 ; |        | $FD63
    .byte $00 ; |        | $FD64
    .byte $00 ; |        | $FD65
    .byte $00 ; |        | $FD66
    .byte $00 ; |        | $FD67
    .byte $00 ; |        | $FD68
    .byte $00 ; |        | $FD69
    .byte $00 ; |        | $FD6A
    .byte $00 ; |        | $FD6B
    .byte $00 ; |        | $FD6C
    .byte $00 ; |        | $FD6D
    .byte $00 ; |        | $FD6E
    .byte $00 ; |        | $FD6F
    .byte $00 ; |        | $FD70
    .byte $00 ; |        | $FD71
    .byte $00 ; |        | $FD72
    .byte $00 ; |        | $FD73
    .byte $00 ; |        | $FD74
    .byte $00 ; |        | $FD75
    .byte $00 ; |        | $FD76
    .byte $00 ; |        | $FD77
    .byte $00 ; |        | $FD78
    .byte $00 ; |        | $FD79
    .byte $00 ; |        | $FD7A
    .byte $00 ; |        | $FD7B
    .byte $00 ; |        | $FD7C
    .byte $00 ; |        | $FD7D
    .byte $00 ; |        | $FD7E
    .byte $00 ; |        | $FD7F
    .byte $00 ; |        | $FD80
    .byte $00 ; |        | $FD81
    .byte $00 ; |        | $FD82
    .byte $00 ; |        | $FD83
    .byte $00 ; |        | $FD84
    .byte $00 ; |        | $FD85
    .byte $00 ; |        | $FD86
    .byte $00 ; |        | $FD87
    .byte $00 ; |        | $FD88
    .byte $00 ; |        | $FD89
    .byte $00 ; |        | $FD8A
    .byte $00 ; |        | $FD8B
    .byte $00 ; |        | $FD8C
    .byte $00 ; |        | $FD8D
    .byte $00 ; |        | $FD8E
    .byte $00 ; |        | $FD8F
    .byte $00 ; |        | $FD90
    .byte $00 ; |        | $FD91
    .byte $00 ; |        | $FD92
    .byte $00 ; |        | $FD93
    .byte $00 ; |        | $FD94
    .byte $00 ; |        | $FD95
    .byte $00 ; |        | $FD96
    .byte $00 ; |        | $FD97
    .byte $00 ; |        | $FD98
    .byte $00 ; |        | $FD99
    .byte $00 ; |        | $FD9A
    .byte $00 ; |        | $FD9B
    .byte $00 ; |        | $FD9C
    .byte $00 ; |        | $FD9D
    .byte $00 ; |        | $FD9E
    .byte $00 ; |        | $FD9F
    .byte $00 ; |        | $FDA0
    .byte $00 ; |        | $FDA1
    .byte $00 ; |        | $FDA2
    .byte $00 ; |        | $FDA3
    .byte $00 ; |        | $FDA4
    .byte $00 ; |        | $FDA5
    .byte $00 ; |        | $FDA6
    .byte $00 ; |        | $FDA7
    .byte $00 ; |        | $FDA8
    .byte $00 ; |        | $FDA9
    .byte $00 ; |        | $FDAA
    .byte $00 ; |        | $FDAB
    .byte $00 ; |        | $FDAC
    .byte $00 ; |        | $FDAD
    .byte $00 ; |        | $FDAE
    .byte $00 ; |        | $FDAF
    .byte $00 ; |        | $FDB0
    .byte $00 ; |        | $FDB1
    .byte $00 ; |        | $FDB2
    .byte $00 ; |        | $FDB3
    .byte $00 ; |        | $FDB4
    .byte $00 ; |        | $FDB5
    .byte $00 ; |        | $FDB6
    .byte $00 ; |        | $FDB7
    .byte $00 ; |        | $FDB8
    .byte $00 ; |        | $FDB9
    .byte $00 ; |        | $FDBA
    .byte $00 ; |        | $FDBB
    .byte $00 ; |        | $FDBC
    .byte $00 ; |        | $FDBD
    .byte $00 ; |        | $FDBE
    .byte $00 ; |        | $FDBF
    .byte $00 ; |        | $FDC0
    .byte $00 ; |        | $FDC1
    .byte $00 ; |        | $FDC2
    .byte $00 ; |        | $FDC3
    .byte $00 ; |        | $FDC4
    .byte $00 ; |        | $FDC5
    .byte $00 ; |        | $FDC6
    .byte $00 ; |        | $FDC7
    .byte $00 ; |        | $FDC8
    .byte $00 ; |        | $FDC9
    .byte $00 ; |        | $FDCA
    .byte $00 ; |        | $FDCB
    .byte $00 ; |        | $FDCC
    .byte $00 ; |        | $FDCD
    .byte $00 ; |        | $FDCE
    .byte $00 ; |        | $FDCF
    .byte $00 ; |        | $FDD0
    .byte $00 ; |        | $FDD1
    .byte $00 ; |        | $FDD2
    .byte $00 ; |        | $FDD3
    .byte $00 ; |        | $FDD4
    .byte $00 ; |        | $FDD5
    .byte $00 ; |        | $FDD6
    .byte $00 ; |        | $FDD7
    .byte $00 ; |        | $FDD8
    .byte $00 ; |        | $FDD9
    .byte $00 ; |        | $FDDA
    .byte $00 ; |        | $FDDB
    .byte $00 ; |        | $FDDC
    .byte $00 ; |        | $FDDD
    .byte $00 ; |        | $FDDE
    .byte $00 ; |        | $FDDF
    .byte $00 ; |        | $FDE0
    .byte $00 ; |        | $FDE1
    .byte $00 ; |        | $FDE2
    .byte $00 ; |        | $FDE3
    .byte $00 ; |        | $FDE4
    .byte $00 ; |        | $FDE5
    .byte $00 ; |        | $FDE6
    .byte $00 ; |        | $FDE7
    .byte $00 ; |        | $FDE8
    .byte $00 ; |        | $FDE9
    .byte $00 ; |        | $FDEA
    .byte $00 ; |        | $FDEB
    .byte $00 ; |        | $FDEC
    .byte $00 ; |        | $FDED
    .byte $00 ; |        | $FDEE
    .byte $00 ; |        | $FDEF
    .byte $00 ; |        | $FDF0
    .byte $00 ; |        | $FDF1
    .byte $00 ; |        | $FDF2
    .byte $00 ; |        | $FDF3
    .byte $00 ; |        | $FDF4
    .byte $00 ; |        | $FDF5
    .byte $00 ; |        | $FDF6
    .byte $00 ; |        | $FDF7
    .byte $00 ; |        | $FDF8
    .byte $00 ; |        | $FDF9
    .byte $00 ; |        | $FDFA
    .byte $00 ; |        | $FDFB
    .byte $00 ; |        | $FDFC
    .byte $00 ; |        | $FDFD
    .byte $00 ; |        | $FDFE
    .byte $00 ; |        | $FDFF


       ORG $0E00,0
      RORG $FE00

  IF PAL | PAL_M

ColTab:
    .byte BLACK
    .byte BLACK+1
    .byte GREY
    .byte GREY+1
    .byte GREY+2
    .byte GREY+3
    .byte GREY+4
    .byte GREY+5
    .byte GREY+6
    .byte GREY+7
    .byte GREY+8
    .byte GREY+9
    .byte GREY+10
    .byte GREY+11
    .byte WHITE
    .byte WHITE+1
    .byte DIRTY_YELLOW
    .byte DIRTY_YELLOW+1
    .byte DIRTY_YELLOW+2
    .byte DIRTY_YELLOW+3
    .byte DIRTY_YELLOW+4
    .byte DIRTY_YELLOW+5
    .byte DIRTY_YELLOW+6
    .byte DIRTY_YELLOW+7
    .byte DIRTY_YELLOW+8
    .byte DIRTY_YELLOW+9
    .byte YELLOW
    .byte YELLOW+1
    .byte YELLOW+2
    .byte YELLOW+3
    .byte YELLOW+4
    .byte YELLOW+5
    .byte ORANGE
    .byte ORANGE+1
    .byte ORANGE+2
    .byte ORANGE+3
    .byte ORANGE+4
    .byte ORANGE+5
    .byte ORANGE+6
    .byte ORANGE+7
    .byte ORANGE+8
    .byte ORANGE+9
    .byte ORANGE+10
    .byte ORANGE+11
    .byte ORANGE+12
    .byte ORANGE+13
    .byte ORANGE+14
    .byte ORANGE+15
    .byte ORANGE_RED
    .byte ORANGE_RED+1
    .byte ORANGE_RED+2
    .byte ORANGE_RED+3
    .byte ORANGE_RED+4
    .byte ORANGE_RED+5
    .byte ORANGE_RED+6
    .byte ORANGE_RED+7
    .byte ORANGE_RED+8
    .byte ORANGE_RED+9
    .byte ORANGE_RED+10
    .byte ORANGE_RED+11
    .byte ORANGE_RED+12
    .byte ORANGE_RED+13
    .byte ORANGE_RED+14
    .byte ORANGE_RED+15
    .byte RED
    .byte RED+1
    .byte RED+2
    .byte RED+3
    .byte RED+4
    .byte RED+5
    .byte RED+6
    .byte RED+7
    .byte RED+8
    .byte RED+9
    .byte RED+10
    .byte RED+11
    .byte RED+12
    .byte RED+13
    .byte RED+14
    .byte RED+15
    .byte PURPLE_RED
    .byte PURPLE_RED+1
    .byte PURPLE_RED+2
    .byte PURPLE_RED+3
    .byte PURPLE_RED+4
    .byte PURPLE_RED+5
    .byte PURPLE_RED+6
    .byte PURPLE_RED+7
    .byte PURPLE_RED+8
    .byte PURPLE_RED+9
    .byte PURPLE_RED+10
    .byte PURPLE_RED+11
    .byte PURPLE_RED+12
    .byte PURPLE_RED+13
    .byte PURPLE_RED+14
    .byte PURPLE_RED+15
    .byte PURPLE
    .byte PURPLE+1
    .byte PURPLE+2
    .byte PURPLE+3
    .byte PURPLE+4
    .byte PURPLE+5
    .byte PURPLE+6
    .byte PURPLE+7
    .byte PURPLE+8
    .byte PURPLE+9
    .byte PURPLE+10
    .byte PURPLE+11
    .byte PURPLE+12
    .byte PURPLE+13
    .byte PURPLE+14
    .byte PURPLE+15
    .byte PURPLE_BLUE
    .byte PURPLE_BLUE+1
    .byte PURPLE_BLUE+2
    .byte PURPLE_BLUE+3
    .byte PURPLE_BLUE+4
    .byte PURPLE_BLUE+5
    .byte PURPLE_BLUE+6
    .byte PURPLE_BLUE+7
    .byte PURPLE_BLUE+8
    .byte PURPLE_BLUE+9
    .byte PURPLE_BLUE+10
    .byte PURPLE_BLUE+11
    .byte PURPLE_BLUE+12
    .byte PURPLE_BLUE+13
    .byte PURPLE_BLUE+14
    .byte PURPLE_BLUE+15
    .byte BLUE
    .byte BLUE+1
    .byte BLUE+2
    .byte BLUE+3
    .byte BLUE+4
    .byte BLUE+5
    .byte BLUE+6
    .byte BLUE+7
    .byte BLUE+8
    .byte BLUE+9
    .byte BLUE+10
    .byte BLUE+11
    .byte BLUE+12
    .byte BLUE+13
    .byte BLUE+14
    .byte BLUE+15
    .byte BLUE_CYAN
    .byte BLUE_CYAN+1
    .byte BLUE_CYAN+2
    .byte BLUE_CYAN+3
    .byte BLUE_CYAN+4
    .byte BLUE_CYAN+5
    .byte BLUE_CYAN+6
    .byte BLUE_CYAN+7
    .byte BLUE_CYAN+8
    .byte BLUE_CYAN+9
    .byte BLUE_CYAN+10
    .byte BLUE_CYAN+11
    .byte BLUE_CYAN+12
    .byte BLUE_CYAN+13
    .byte BLUE_CYAN+14
    .byte BLUE_CYAN+15
    .byte CYAN
    .byte CYAN+1
    .byte CYAN+2
    .byte CYAN+3
    .byte CYAN+4
    .byte CYAN+5
    .byte CYAN+6
    .byte CYAN+7
    .byte CYAN+8
    .byte CYAN+9
    .byte CYAN+10
    .byte CYAN+11
    .byte CYAN+12
    .byte CYAN+13
    .byte CYAN+14
    .byte CYAN+15
    .byte GREEN_CYAN
    .byte GREEN_CYAN+1
    .byte GREEN_CYAN+2
    .byte GREEN_CYAN+3
    .byte GREEN_CYAN+4
    .byte GREEN_CYAN+5
    .byte GREEN_CYAN+6
    .byte GREEN_CYAN+7
    .byte GREEN_CYAN+8
    .byte GREEN_CYAN+9
    .byte GREEN_CYAN+10
    .byte GREEN_CYAN+11
    .byte GREEN_CYAN+12
    .byte GREEN_CYAN+13
    .byte GREEN_CYAN+14
    .byte GREEN_CYAN+15
    .byte GREEN
    .byte GREEN+1
    .byte GREEN+2
    .byte GREEN+3
    .byte GREEN+4
    .byte GREEN+5
    .byte GREEN+6
    .byte GREEN+7
    .byte GREEN+8
    .byte GREEN+9
    .byte GREEN+10
    .byte GREEN+11
    .byte GREEN+12
    .byte GREEN+13
    .byte GREEN+14
    .byte GREEN+15
    .byte YELLOW_GREEN
    .byte YELLOW_GREEN+1
    .byte YELLOW_GREEN+2
    .byte YELLOW_GREEN+3
    .byte YELLOW_GREEN+4
    .byte YELLOW_GREEN+5
    .byte YELLOW_GREEN+6
    .byte YELLOW_GREEN+7
    .byte YELLOW_GREEN+8
    .byte YELLOW_GREEN+9
    .byte YELLOW_GREEN+10
    .byte YELLOW_GREEN+11
    .byte YELLOW_GREEN+12
    .byte YELLOW_GREEN+13
    .byte YELLOW_GREEN+14
    .byte YELLOW_GREEN+15
    .byte ORANGE_GREEN
    .byte ORANGE_GREEN+1
    .byte ORANGE_GREEN+2
    .byte ORANGE_GREEN+3
    .byte ORANGE_GREEN+4
    .byte ORANGE_GREEN+5
    .byte ORANGE_GREEN+6
    .byte ORANGE_GREEN+7
    .byte ORANGE_GREEN+8
    .byte ORANGE_GREEN+9
    .byte ORANGE_GREEN+10
    .byte ORANGE_GREEN+11
    .byte ORANGE_GREEN+12
    .byte ORANGE_GREEN+13
    .byte ORANGE_GREEN+14
    .byte ORANGE_GREEN+15
    .byte BROWN
    .byte BROWN+1
    .byte BROWN+2
    .byte BROWN+3
    .byte BROWN+4
    .byte BROWN+5
    .byte BROWN+6
    .byte BROWN+7
    .byte BROWN+8
    .byte BROWN+9
    .byte BROWN+10
    .byte BROWN+11
    .byte BROWN+12
    .byte BROWN+13
    .byte BROWN+14
    .byte BROWN+15

  ENDIF


       ORG $0F00
      RORG $FF00

LFF00:
    .byte $00 ; |        | $FF00
    .byte $73 ; | XXX  XX| $FF01
    .byte $63 ; | XX   XX| $FF02
    .byte $53 ; | X X  XX| $FF03
    .byte $43 ; | X    XX| $FF04
    .byte $33 ; |  XX  XX| $FF05
    .byte $23 ; |  X   XX| $FF06
    .byte $13 ; |   X  XX| $FF07
    .byte $03 ; |      XX| $FF08
    .byte $F3 ; |XXXX  XX| $FF09
    .byte $74 ; | XXX X  | $FF0A
    .byte $64 ; | XX  X  | $FF0B
    .byte $54 ; | X X X  | $FF0C
    .byte $44 ; | X   X  | $FF0D
    .byte $34 ; |  XX X  | $FF0E
    .byte $24 ; |  X  X  | $FF0F
    .byte $14 ; |   X X  | $FF10
    .byte $04 ; |     X  | $FF11
    .byte $F4 ; |XXXX X  | $FF12
    .byte $E4 ; |XXX  X  | $FF13
    .byte $D4 ; |XX X X  | $FF14
    .byte $C4 ; |XX   X  | $FF15
    .byte $B4 ; |X XX X  | $FF16
    .byte $A4 ; |X X  X  | $FF17
    .byte $94 ; |X  X X  | $FF18
    .byte $75 ; | XXX X X| $FF19
    .byte $65 ; | XX  X X| $FF1A
    .byte $55 ; | X X X X| $FF1B
    .byte $45 ; | X   X X| $FF1C
    .byte $35 ; |  XX X X| $FF1D
    .byte $25 ; |  X  X X| $FF1E
    .byte $15 ; |   X X X| $FF1F
    .byte $05 ; |     X X| $FF20
    .byte $F5 ; |XXXX X X| $FF21
    .byte $E5 ; |XXX  X X| $FF22
    .byte $D5 ; |XX X X X| $FF23
    .byte $C5 ; |XX   X X| $FF24
    .byte $B5 ; |X XX X X| $FF25
    .byte $A5 ; |X X  X X| $FF26
    .byte $95 ; |X  X X X| $FF27
    .byte $76 ; | XXX XX | $FF28
    .byte $66 ; | XX  XX | $FF29
    .byte $56 ; | X X XX | $FF2A
    .byte $46 ; | X   XX | $FF2B
    .byte $36 ; |  XX XX | $FF2C
    .byte $26 ; |  X  XX | $FF2D

    .byte $16 ; |   X XX | $FF2E
    .byte $06 ; |     XX | $FF2F
    .byte $F6 ; |XXXX XX | $FF30
    .byte $E6 ; |XXX  XX | $FF31
    .byte $D6 ; |XX X XX | $FF32
    .byte $C6 ; |XX   XX | $FF33
    .byte $B6 ; |X XX XX | $FF34
    .byte $A6 ; |X X  XX | $FF35
    .byte $96 ; |X  X XX | $FF36
    .byte $77 ; | XXX XXX| $FF37
    .byte $67 ; | XX  XXX| $FF38
    .byte $57 ; | X X XXX| $FF39
    .byte $47 ; | X   XXX| $FF3A
    .byte $37 ; |  XX XXX| $FF3B
    .byte $27 ; |  X  XXX| $FF3C
    .byte $17 ; |   X XXX| $FF3D
    .byte $07 ; |     XXX| $FF3E
    .byte $F7 ; |XXXX XXX| $FF3F
    .byte $E7 ; |XXX  XXX| $FF40
    .byte $D7 ; |XX X XXX| $FF41
    .byte $C7 ; |XX   XXX| $FF42
    .byte $B7 ; |X XX XXX| $FF43
    .byte $A7 ; |X X  XXX| $FF44
    .byte $97 ; |X  X XXX| $FF45
    .byte $78 ; | XXXX   | $FF46
    .byte $68 ; | XX X   | $FF47
    .byte $58 ; | X XX   | $FF48
    .byte $48 ; | X  X   | $FF49
    .byte $38 ; |  XXX   | $FF4A
    .byte $28 ; |  X X   | $FF4B
    .byte $18 ; |   XX   | $FF4C
    .byte $08 ; |    X   | $FF4D
    .byte $F8 ; |XXXXX   | $FF4E
    .byte $E8 ; |XXX X   | $FF4F
    .byte $D8 ; |XX XX   | $FF50
    .byte $C8 ; |XX  X   | $FF51
    .byte $B8 ; |X XXX   | $FF52
    .byte $A8 ; |X X X   | $FF53
    .byte $98 ; |X  XX   | $FF54
    .byte $79 ; | XXXX  X| $FF55
    .byte $69 ; | XX X  X| $FF56
    .byte $59 ; | X XX  X| $FF57
    .byte $49 ; | X  X  X| $FF58
    .byte $39 ; |  XXX  X| $FF59
    .byte $29 ; |  X X  X| $FF5A
    .byte $19 ; |   XX  X| $FF5B
    .byte $09 ; |    X  X| $FF5C
    .byte $F9 ; |XXXXX  X| $FF5D
    .byte $E9 ; |XXX X  X| $FF5E
    .byte $D9 ; |XX XX  X| $FF5F
    .byte $C9 ; |XX  X  X| $FF60
    .byte $B9 ; |X XXX  X| $FF61
    .byte $A9 ; |X X X  X| $FF62
    .byte $99 ; |X  XX  X| $FF63
    .byte $7A ; | XXXX X | $FF64
    .byte $6A ; | XX X X | $FF65
    .byte $5A ; | X XX X | $FF66
    .byte $4A ; | X  X X | $FF67
    .byte $3A ; |  XXX X | $FF68
    .byte $2A ; |  X X X | $FF69
    .byte $1A ; |   XX X | $FF6A
    .byte $0A ; |    X X | $FF6B
    .byte $FA ; |XXXXX X | $FF6C
    .byte $EA ; |XXX X X | $FF6D
    .byte $DA ; |XX XX X | $FF6E
    .byte $CA ; |XX  X X | $FF6F
    .byte $BA ; |X XXX X | $FF70
    .byte $AA ; |X X X X | $FF71
    .byte $9A ; |X  XX X | $FF72
    .byte $7B ; | XXXX XX| $FF73
    .byte $6B ; | XX X XX| $FF74
    .byte $5B ; | X XX XX| $FF75
    .byte $4B ; | X  X XX| $FF76
    .byte $3B ; |  XXX XX| $FF77
    .byte $2B ; |  X X XX| $FF78
    .byte $1B ; |   XX XX| $FF79
    .byte $0B ; |    X XX| $FF7A
    .byte $FB ; |XXXXX XX| $FF7B
    .byte $EB ; |XXX X XX| $FF7C
    .byte $DB ; |XX XX XX| $FF7D
    .byte $CB ; |XX  X XX| $FF7E
    .byte $BB ; |X XXX XX| $FF7F
    .byte $AB ; |X X X XX| $FF80
    .byte $9B ; |X  XX XX| $FF81
    .byte $7C ; | XXXXX  | $FF82
    .byte $6C ; | XX XX  | $FF83
    .byte $5C ; | X XXX  | $FF84
    .byte $4C ; | X  XX  | $FF85
    .byte $3C ; |  XXXX  | $FF86
    .byte $2C ; |  X XX  | $FF87
    .byte $1C ; |   XXX  | $FF88
    .byte $0C ; |    XX  | $FF89
    .byte $FC ; |XXXXXX  | $FF8A
    .byte $EC ; |XXX XX  | $FF8B
    .byte $DC ; |XX XXX  | $FF8C
    .byte $CC ; |XX  XX  | $FF8D
    .byte $BC ; |X XXXX  | $FF8E
    .byte $AC ; |X X XX  | $FF8F
    .byte $9C ; |X  XXX  | $FF90
    .byte $7D ; | XXXXX X| $FF91
    .byte $6D ; | XX XX X| $FF92
    .byte $5D ; | X XXX X| $FF93
    .byte $4D ; | X  XX X| $FF94
    .byte $3D ; |  XXXX X| $FF95
    .byte $2D ; |  X XX X| $FF96
    .byte $1D ; |   XXX X| $FF97
    .byte $0D ; |    XX X| $FF98
    .byte $FD ; |XXXXXX X| $FF99
    .byte $ED ; |XXX XX X| $FF9A
    .byte $DD ; |XX XXX X| $FF9B
    .byte $CD ; |XX  XX X| $FF9C
    .byte $BD ; |X XXXX X| $FF9D
    .byte $AD ; |X X XX X| $FF9E
    .byte $9D ; |X  XXX X| $FF9F
    .byte $7E ; | XXXXXX | $FFA0
    .byte $6E ; | XX XXX | $FFA1
    .byte $5E ; | X XXXX | $FFA2
    .byte $4E ; | X  XXX | $FFA3
    .byte $3E ; |  XXXXX | $FFA4
    .byte $2E ; |  X XXX | $FFA5
    .byte $1E ; |   XXXX | $FFA6
    .byte $0E ; |    XXX | $FFA7
    .byte $FE ; |XXXXXXX | $FFA8
    .byte $EE ; |XXX XXX | $FFA9
    .byte $DE ; |XX XXXX | $FFAA
    .byte $CE ; |XX  XXX | $FFAB
    .byte $BE ; |X XXXXX | $FFAC
    .byte $AE ; |X X XXX | $FFAD
    .byte $9E ; |X  XXXX | $FFAE
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
    .byte $00 ; |        | $FFEA
    .byte $00 ; |        | $FFEB
    .byte $00 ; |        | $FFEC
    .byte $00 ; |        | $FFED
    .byte $00 ; |        | $FFEE
    .byte $00 ; |        | $FFEF
    .byte $00 ; |        | $FFF0
    .byte $00 ; |        | $FFF1
    .byte $00 ; |        | $FFF2
    .byte $00 ; |        | $FFF3
    .byte $00 ; |        | $FFF4
    .byte $00 ; |        | $FFF5
    .byte $00 ; |        | $FFF6
    .byte $00 ; |        | $FFF7

       ORG $0FF8
      RORG $FFF8

    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9
    .byte $00 ; |        | $FFFA
    .byte $00 ; |        | $FFFB

    .word START_0
    .word START_0



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $B000

START_1:
    sta    BANK_1                ; 4
    jmp    LB01D                 ; 3

LB006:
    sta    BANK_0                ; 4
    jmp    LB11D                 ; 3

LB00C:
    sta    BANK_0                ; 4

LB00F:
    .byte $20 ; |  X     | $B00F
    .byte $20 ; |  X     | $B010
    .byte $20 ; |  X     | $B011
    .byte $20 ; |  X     | $B012
    .byte $20 ; |  X     | $B013
    .byte $20 ; |  X     | $B014
    .byte $88 ; |X   X   | $B015
    .byte $22 ; |  X   X | $B016
    .byte $66 ; | XX  XX | $B017
    .byte $44 ; | X   X  | $B018
    .byte $AA ; |X X X X | $B019
    .byte $00 ; |        | $B01A
    .byte $24 ; |  X  X  | $B01B
    .byte $68 ; | XX X   | $B01C

LB01D:
    cli                          ; 2
    cld                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    inx                          ; 2
    txa                          ; 2
.loopClear:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    .loopClear            ; 2³

    lda    #$0F                  ; 2
    sta    ram_99                ; 3
LB02D:
    ldx    #$0D                  ; 2
LB02F:
    lda    LB00F,X               ; 4
    sta    ram_84,X              ; 4
    dex                          ; 2
    bpl    LB02F                 ; 2³
    lda    #0                    ; 2
    sta    ram_83                ; 3
LB03B:
    lda    #$28                  ; 2
    sta    ram_A7                ; 3
    sta    ram_A8                ; 3
    sta    ram_B5                ; 3
    sta    ram_B6                ; 3
    lda    #3                    ; 2
    sta    ram_9A                ; 3
    lda    #0                    ; 2
    sta    ram_98                ; 3
    sta    ram_D0                ; 3
    sta    ram_D1                ; 3
    sta    ram_AC                ; 3
    lda    #$32                  ; 2
    sta    ram_97                ; 3
    jsr    LB870                 ; 6
LB05A:
    lda    INTIM                 ; 4
    bne    LB05A                 ; 2³
    lda    #3                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #TIME_VBLANK          ; 2
    sta    TIM64T                ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_AD                ; 3
    eor    INPT4                 ; 3
    and    ram_AD                ; 3
    sta    ram_AD                ; 3
    lda    INPT4                 ; 3
    asl                          ; 2
    ror    ram_AD                ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_AC                ; 3
    beq    LB081                 ; 2³
    dec    ram_AC                ; 5
LB081:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    VSYNC                 ; 3
    lda    ram_82                ; 3
    beq    LB08E                 ; 2³
    jmp    LB76C                 ; 3

LB08E:
    jsr    LB5D9                 ; 6
    lda    ram_D0                ; 3
    bne    LB0E8                 ; 2³
    jsr    LB3DD                 ; 6
    jsr    LB61A                 ; 6
    sta    ram_CC                ; 3
    bmi    LB0E8                 ; 2³
    cmp    #$11                  ; 2
    beq    LB0E8                 ; 2³
    lda    CXPPMM                ; 3
    bpl    LB0E8                 ; 2³
    lda    ram_AD                ; 3
    bmi    LB0E8                 ; 2³
    ldy    ram_CC                ; 3
    cpy    #$10                  ; 2
    bne    LB0C8                 ; 2³
    lda    #2                    ; 2
    sta    ram_96                ; 3
    lda    #$C8                  ; 2
    sta    ram_A8                ; 3
    lda    #0                    ; 2
    sta    ram_A7                ; 3
    lda    #$80                  ; 2
    sta    ram_AD                ; 3
    lda    #$20                  ; 2
    sta    ram_AC                ; 3
    jmp    LB0E8                 ; 3

  IF PAL | PAL_M
;returning from bank 0
    JMP   CorrectCol2
CorrectCol1:
    STA   BANK_0
  ENDIF

LB0C8:
    lda.wy ram_BA,Y              ; 4
    cmp    #$20                  ; 2
    beq    LB0E8                 ; 2³
    lda    #$20                  ; 2
    ldx    #5                    ; 2
LB0D3:
    cmp    ram_84,X              ; 4
    beq    LB0DD                 ; 2³
    dex                          ; 2
    bpl    LB0D3                 ; 2³
    jmp    LB0E8                 ; 3

LB0DD:
    lda.wy ram_BA,Y              ; 4
    sta    ram_84,X              ; 4
    tya                          ; 2
    ldy    #$0F                  ; 2
    jsr    LB647                 ; 6
LB0E8:
    lda    ram_83                ; 3
    and    #$FE                  ; 2
    clc                          ; 2
    adc    #$46                  ; 2
    sta    ram_CB                ; 3
    lda    #$24                  ; 2
    sta    ram_CA                ; 3
LB0F5:
    lda    INTIM                 ; 4
    bne    LB0F5                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #TIME_DRAWSCREEN      ; 2   corridor
    sta    TIM64T                ; 4
    sta    CXCLR                 ; 3
    lda    ram_82                ; 3
    beq    LB10A                 ; 2³
    jmp    LB78C                 ; 3

LB10A:
    lda    #0                    ; 2   ???
    lda    #BLACK                ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    #$FF                  ; 2
    sta    CTRLPF                ; 3
    jsr    LB369                 ; 6
LB11D:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #BLACK                ; 2
    sta    COLUBK                ; 3
    sta    COLUPF                ; 3
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    ram_99                ; 3
    beq    LB166                 ; 2³
    ldx    #$0B                  ; 2
LB131:
    lda    LBF18,X               ; 4
    sta    ram_9B,X              ; 4
    dex                          ; 2
    bpl    LB131                 ; 2³


LB139:

  IF PAL | PAL_M
    JSR    LBC29
    JMP    CorrectCol1
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP

  ELSE

    lda    INTIM                 ; 4
    bne    LB139                 ; 2³
    lda    #TIME_OVERSCAN        ; 2
    sta    TIM64T                ; 4
    jsr    LBC29                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_81                ; 3
    and    ram_99                ; 3
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    eor    #$FF                  ; 2
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3

  ENDIF

CorrectCol4:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #6                    ; 2
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    LBC53                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    LB226                 ; 3

LB166:
    lda    ram_82                ; 3
    beq    LB16D                 ; 2³
    jmp    LB201                 ; 3

LB16D:
    lda    ram_D1                ; 3
    beq    LB1B4                 ; 2³
    lda    LBDE5                 ; 4
    sta    ram_9B                ; 3
    sta    ram_9D                ; 3
    sta    ram_9F                ; 3
    sta    ram_A3                ; 3
    sta    ram_A5                ; 3
    lda    LBDE5+1               ; 4
    sta    ram_9C                ; 3
    sta    ram_9E                ; 3
    sta    ram_A0                ; 3
    sta    ram_A4                ; 3
    sta    ram_A6                ; 3
    lda    ram_83                ; 3
    and    #$FE                  ; 2
    tax                          ; 2
    lda    LB893,X               ; 4
    sta    ram_9F                ; 3
    lda    LB893+1,X             ; 4
    sta    ram_A0                ; 3
    lda    LB8A1,X               ; 4
    sta    ram_A1                ; 3
    lda    LB8A1+1,X             ; 4
    sta    ram_A2                ; 3
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    LB1B1                 ; 2³
    dec    ram_D1                ; 5
    bne    LB1B1                 ; 2³
    jmp    LB01D                 ; 3

LB1B1:
    jmp    LB139                 ; 3

LB1B4:
    lda    ram_D0                ; 3
    beq    LB201                 ; 2³+1
    lda    ram_AC                ; 3
    bne    LB1C4                 ; 2³
    lda    ram_AD                ; 3
    bmi    LB1C4                 ; 2³
    lda    #1                    ; 2
    sta    ram_D0                ; 3
LB1C4:
    ldy    ram_CE                ; 3
    lda    LBDC5,Y               ; 4
    sta    ram_9F                ; 3
    lda    LBDC5+1,Y             ; 4
    sta    ram_A0                ; 3
    ldy    ram_CF                ; 3
    lda    LBDC5,Y               ; 4
    sta    ram_A1                ; 3
    lda    LBDC5+1,Y             ; 4
    sta    ram_A2                ; 3
    lda    LBDE5                 ; 4
    sta    ram_9B                ; 3
    sta    ram_9D                ; 3
    sta    ram_A3                ; 3
    sta    ram_A5                ; 3
    lda    LBDE5+1               ; 4
    sta    ram_9C                ; 3
    sta    ram_9E                ; 3
    sta    ram_A4                ; 3
    sta    ram_A6                ; 3
    ldy    #$88                  ; 2
    lda    frameCounter          ; 3
    and    #$04                  ; 2
    beq    LB1FC                 ; 2³
    ldy    #ORANGE_RED+8         ; 2
LB1FC:
    sty    ram_AB                ; 3
    jmp    LB208                 ; 3

LB201:
    jsr    LB66B                 ; 6
    lda    #BROWN+11             ; 2
    sta    ram_AB                ; 3
LB208:
    lda    INTIM                 ; 4
    bne    LB208                 ; 2³
    lda    #TIME_OVERSCAN        ; 2
    sta    TIM64T                ; 4
    jsr    LBC88                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_AB                ; 3
    sta    COLUBK                ; 3
    lda    #BLACK                ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$0B                  ; 2
    jsr    LBCB2                 ; 6
LB226:
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #BLACK                ; 2
    sta    COLUBK                ; 3
    lda    ram_99                ; 3
    beq    LB23F                 ; 2³
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    AUDF0                 ; 3
    sta    AUDF1                 ; 3
    jmp    LB24C                 ; 3

LB23F:
    ldx    #0                    ; 2
    jsr    LBA5E                 ; 6
    ldx    #1                    ; 2
    jsr    LBA5E                 ; 6
    jsr    LBA40                 ; 6
LB24C:
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    bne    LB25A                 ; 2³
    lda    #0                    ; 2
    sta    ram_99                ; 3
    jmp    LB02D                 ; 3

LB25A:
    lda    ram_99                ; 3
    beq    LB269                 ; 2³
    lda    INPT4                 ; 3
    bmi    LB269                 ; 2³
    lda    #0                    ; 2
    sta    ram_99                ; 3
    jmp    LB03B                 ; 3

LB269:
    inc    frameCounter          ; 5
    bne    LB27E                 ; 2³
    inc    ram_81                ; 5
    bne    LB27E                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_99                ; 3
    sta    ram_9A                ; 3
    lda    #0                    ; 2
    sta    ram_98                ; 3
    jmp    LB2AE                 ; 3

LB27E:
    lda    ram_82                ; 3
    cmp    #5                    ; 2
    bne    LB291                 ; 2³
    lda    #3                    ; 2
    and    frameCounter          ; 3
    bne    LB28E                 ; 2³
    dec    ram_97                ; 5
    beq    LB2BF                 ; 2³
LB28E:
    jmp    LB006                 ; 3

LB291:
    lda    ram_82                ; 3
    beq    LB2FA                 ; 2³
    cmp    #4                    ; 2
    beq    LB2FA                 ; 2³
    lda    ram_98                ; 3
    beq    LB2A4                 ; 2³
    lda    #0                    ; 2
    sta    ram_97                ; 3
    jmp    LB2AE                 ; 3

LB2A4:
    lda    frameCounter          ; 3
    and    #$0F                  ; 2
    bne    LB2FA                 ; 2³
    dec    ram_97                ; 5
    bne    LB2FA                 ; 2³
LB2AE:
    lda    #5                    ; 2
    sta    ram_82                ; 3
    ldx    #$32                  ; 2
    lda    ram_99                ; 3
    bne    LB2BA                 ; 2³
    ldx    #$0A                  ; 2
LB2BA:
    stx    ram_97                ; 3
    jmp    LB00C                 ; 3

LB2BF:
    lda    ram_99                ; 3
    beq    LB2D9                 ; 2³
    dec    ram_9A                ; 5
    lda    ram_9A                ; 3
    and    #$03                  ; 2
    bne    LB2CD                 ; 2³
    lda    #3                    ; 2
LB2CD:
    sta    ram_9A                ; 3
    jsr    LB870                 ; 6
    lda    #$10                  ; 2
    sta    ram_97                ; 3
    jmp    LB05A                 ; 3

LB2D9:
    lda    #0                    ; 2
    sta    ram_92                ; 3
    sta    ram_93                ; 3
    lda    #0                    ; 2
    sta    ram_94                ; 3
    lda    #1                    ; 2
    sta    ram_95                ; 3
    lda    #0                    ; 2
    sta    ram_82                ; 3
    sta    ram_D0                ; 3
    sta    ram_D1                ; 3
    sta    CXCLR                 ; 3
    lda    #$FF                  ; 2
    sta    ram_96                ; 3
    sta    ram_CD                ; 3
    jmp    LB05A                 ; 3

LB2FA:
    lda    ram_82                ; 3
    beq    LB308                 ; 2³+1
    cmp    #4                    ; 2
    bne    LB305                 ; 2³
    jmp    LB80D                 ; 3

LB305:
    jmp    LB006                 ; 3

LB308:
    jsr    LB4C6                 ; 6
    jsr    LB905                 ; 6
    lda    ram_D1                ; 3
    bne    LB315                 ; 2³
    jsr    LB8AF                 ; 6
LB315:
    jmp    LB05A                 ; 3

    .byte $4A ; | X  X X | $B318   unknown data
    .byte $4A ; | X  X X | $B319
    .byte $4A ; | X  X X | $B31A
    .byte $4A ; | X  X X | $B31B
    .byte $29 ; |  X X  X| $B31C
    .byte $0F ; |    XXXX| $B31D
    .byte $0A ; |    X X | $B31E
    .byte $AA ; |X X X X | $B31F
    .byte $BD ; |X XXXX X| $B320
    .byte $C5 ; |XX   X X| $B321
    .byte $BD ; |X XXXX X| $B322
    .byte $99 ; |X  XX  X| $B323
    .byte $9B ; |X  XX XX| $B324
    .byte $00 ; |        | $B325
    .byte $BD ; |X XXXX X| $B326
    .byte $C6 ; |XX   XX | $B327
    .byte $BD ; |X XXXX X| $B328
    .byte $99 ; |X  XX  X| $B329
    .byte $9C ; |X  XXX  | $B32A
    .byte $00 ; |        | $B32B
    .byte $60 ; | XX     | $B32C

LB32D:
    .byte BLUE+3         ; $B32D
    .byte BLUE+6         ; $B32E
    .byte GREEN+8        ; $B32F
    .byte BROWN+8        ; $B330
    .byte ORANGE_RED+8   ; $B331
    .byte RED+8          ; $B332
    .byte RED+3          ; $B333
LB334:
    .byte BLUE+6         ; $B334
    .byte RED+12         ; $B335
    .byte BLUE+8         ; $B336
    .byte RED+11         ; $B337
    .byte BLUE+9         ; $B338
    .byte RED+10         ; $B339
    .byte BLUE+10        ; $B33A
    .byte RED+9          ; $B33B
    .byte BLUE+11        ; $B33C
    .byte RED+8          ; $B33D
    .byte BLUE+12        ; $B33E
    .byte RED+7          ; $B33F
    .byte BLUE+13        ; $B340
    .byte PURPLE_BLUE+6  ; $B341
LB342:
    .byte $FF ; |XXXXXXXX| $B342
    .byte $F0 ; |XXXX    | $B343
    .byte $F0 ; |XXXX    | $B344
    .byte $F0 ; |XXXX    | $B345
    .byte $F0 ; |XXXX    | $B346
    .byte $F0 ; |XXXX    | $B347
    .byte $F0 ; |XXXX    | $B348
    .byte $FF ; |XXXXXXXX| $B349

LB34A:
    ldy    ram_AB                ; 3
    lda    LB342,Y               ; 4
    sta    PF1                   ; 3
    lda    #$FF                  ; 2
    sta    PF2                   ; 3
LB355:
    inx                          ; 2
    lda    #0                    ; 2
    cpx    ram_A8                ; 3
    bcc    LB364                 ; 2³
    ldy    ram_B1                ; 3
    bmi    LB364                 ; 2³
    lda    (ram_AF),Y            ; 5
    dec    ram_B1                ; 5
LB364:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    rts                          ; 6

LB369:
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    lda    #WHITE+1              ; 2
    sta    COLUP0                ; 3
    sta    CXCLR                 ; 3
    lda    #0                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    jsr    LB496                 ; 6
    ldx    ram_83                ; 3
    lda    LB32D,X               ; 4
    sta    COLUPF                ; 3
    txa                          ; 2
    lsr                          ; 2
    sta    ram_AB                ; 3
    tax                          ; 2
    lda    LB334,X               ; 4
    ldx    #$FF                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    stx    PF0                   ; 3
    inx                          ; 2
    jsr    LB34A                 ; 6
LB397:
    jsr    LB355                 ; 6
    cpx    #$14                  ; 2
    bne    LB397                 ; 2³
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
LB3A4:
    jsr    LB355                 ; 6
    cpx    #$1A                  ; 2
    bne    LB3A4                 ; 2³
    jsr    LB355                 ; 6
    inx                          ; 2
    ldy    #0                    ; 2
    jsr    LB554                 ; 6
LB3B4:
    jsr    LB355                 ; 6
    cpx    #$91                  ; 2
    bne    LB3B4                 ; 2³
    ldy    ram_AB                ; 3
    lda    LB342+1,Y             ; 4
    sta    ram_AB                ; 3
    jsr    LB355                 ; 6
    lda    ram_AB                ; 3
    sta    PF1                   ; 3
    lda    #$FF                  ; 2
    sta    PF2                   ; 3
LB3CD:
    jsr    LB355                 ; 6
    cpx    #$A5                  ; 2
    bne    LB3CD                 ; 2³
    lda    #BLACK                ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    rts                          ; 6

LB3DD:
    lda    ram_A8                ; 3
    cmp    #$C8                  ; 2
    bcc    LB40D                 ; 2³+1
    lda    SWCHA                 ; 4
    asl                          ; 2
    bcs    LB3F5                 ; 2³
    inc    ram_A7                ; 5
    ldx    ram_A7                ; 3
    cpx    #$5F                  ; 2
    bcc    LB3F5                 ; 2³
    ldx    #0                    ; 2
    stx    ram_A7                ; 3
LB3F5:
    asl                          ; 2
    bcs    LB400                 ; 2³+1
    dec    ram_A7                ; 5
    bpl    LB400                 ; 2³+1
    ldx    #$5F                  ; 2
    stx    ram_A7                ; 3
LB400:
    asl                          ; 2
    asl                          ; 2
    bcs    LB40C                 ; 2³
    inc    ram_A8                ; 5
    lda    ram_A8                ; 3
    cmp    #$DC                  ; 2
    beq    LB411                 ; 2³
LB40C:
    rts                          ; 6

LB40D:
    lda    CXP0FB                ; 3
    bpl    LB424                 ; 2³
LB411:
    lda    ram_B5                ; 3
    sta    ram_A7                ; 3
    lda    ram_B6                ; 3
    sta    ram_A8                ; 3
    lda    ram_B7                ; 3
    sta    ram_B2                ; 3
    lda    ram_B8                ; 3
    sta    ram_B3                ; 3
    jmp    LB464                 ; 3

LB424:
    lda    ram_A7                ; 3
    sta    ram_B5                ; 3
    lda    ram_A8                ; 3
    sta    ram_B6                ; 3
    lda    ram_B3                ; 3
    sta    ram_B8                ; 3
    lda    ram_B2                ; 3
    sta    ram_B7                ; 3
    lda    #0                    ; 2
    sta    ram_B2                ; 3
    lda    SWCHA                 ; 4
    asl                          ; 2
    bcs    LB446                 ; 2³
    inc    ram_A7                ; 5
    ldx    #0                    ; 2
    asl                          ; 2
    jmp    LB44D                 ; 3

LB446:
    asl                          ; 2
    bcs    LB453                 ; 2³
    dec    ram_A7                ; 5
    ldx    #8                    ; 2
LB44D:
    stx    ram_B3                ; 3
    ldx    ram_A7                ; 3
    stx    ram_B2                ; 3
LB453:
    asl                          ; 2
    bcs    LB45B                 ; 2³
    inc    ram_A8                ; 5
    jmp    LB460                 ; 3

LB45B:
    asl                          ; 2
    bcs    LB464                 ; 2³
    dec    ram_A8                ; 5
LB460:
    lda    ram_A8                ; 3
    sta    ram_B2                ; 3
LB464:
    lda    ram_B2                ; 3
    bne    LB46D                 ; 2³
    ldx    #4                    ; 2
    jmp    LB47D                 ; 3

LB46D:
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    tax                          ; 2
    bne    LB47D                 ; 2³
    stx    ram_A9                ; 3
    ldx    #1                    ; 2
    jsr    LBA40                 ; 6
    ldx    ram_A9                ; 3
LB47D:
    txa                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    LB73D,X               ; 4
    sta    ram_AF                ; 3
    lda    LB73D+1,X             ; 4
    sta    ram_B0                ; 3
    lda    #$13                  ; 2
    sta    ram_B1                ; 3
    lda    ram_A7                ; 3
    jsr    LB747                 ; 6
    sta    ram_B4                ; 3
    rts                          ; 6

LB496:
    lda    #$28                  ; 2
    jsr    LB747                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
LB4A2:
    dey                          ; 2
    bne    LB4A2                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_B4                ; 3
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
LB4B0:
    dey                          ; 2
    bne    LB4B0                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    NUSIZ0                ; 3
    lda    ram_B3                ; 3
    sta    REFP0                 ; 3
    lda    #6                    ; 2
    sta    NUSIZ1                ; 3
    sta    REFP1                 ; 3
    rts                          ; 6

LB4C6:
    ldx    #0                    ; 2
    lda    ram_A8                ; 3
    cmp    #3                    ; 2
    bcc    LB4D5                 ; 2³
    cmp    #$96                  ; 2
    beq    LB4D3                 ; 2³
    rts                          ; 6

LB4D3:
    ldx    #2                    ; 2
LB4D5:
    lda    ram_A7                ; 3
    cmp    #$50                  ; 2
    bcc    LB4DC                 ; 2³
    inx                          ; 2
LB4DC:
    lda    ram_83                ; 3
    and    #$FE                  ; 2
    clc                          ; 2
    adc    LB531,X               ; 4
    bpl    LB4E8                 ; 2³
    lda    ram_83                ; 3
LB4E8:
    cmp    #$0E                  ; 2
    bcc    LB4EE                 ; 2³
    lda    ram_83                ; 3
LB4EE:
    sta    ram_83                ; 3
    lsr                          ; 2
    clc                          ; 2
    adc    LB53D,X               ; 4
    tay                          ; 2
    lda    LB543,Y               ; 4
    sta    ram_9A                ; 3
    lda    LB535,X               ; 4
    sta    ram_A8                ; 3
    lda    LB539,X               ; 4
    sta    ram_A7                ; 3
    lda    #$80                  ; 2
    sta    ram_97                ; 3
    lda    #0                    ; 2
    sta    ram_98                ; 3
    ldx    ram_9A                ; 3
    ldy    LB54C,X               ; 4
    lda.wy ram_8A,Y              ; 4
    and    LB550,X               ; 4
    cmp    LB550,X               ; 4
    bne    LB51F                 ; 2³
    inc    ram_98                ; 5
LB51F:
    lda    ram_8A                ; 3
    and    #$F0                  ; 2
    cmp    #$F0                  ; 2
    bne    LB529                 ; 2³
    inc    ram_98                ; 5
LB529:
    jsr    LB870                 ; 6
    pla                          ; 4
    pla                          ; 4
    jmp    LB05A                 ; 3

LB531:
    .byte $FE ; |XXXXXXX | $B531
    .byte $FF ; |XXXXXXXX| $B532
    .byte $02 ; |      X | $B533
    .byte $03 ; |      XX| $B534
LB535:
    .byte $7D ; | XXXXX X| $B535
    .byte $7D ; | XXXXX X| $B536
    .byte $19 ; |   XX  X| $B537
    .byte $19 ; |   XX  X| $B538
LB539:
    .byte $14 ; |   X X  | $B539
    .byte $64 ; | XX  X  | $B53A
    .byte $14 ; |   X X  | $B53B
    .byte $64 ; | XX  X  | $B53C
LB53D:
    .byte $00 ; |        | $B53D
    .byte $00 ; |        | $B53E
    .byte $FF ; |XXXXXXXX| $B53F
    .byte $FF ; |XXXXXXXX| $B540
    .byte $00 ; |        | $B541
    .byte $00 ; |        | $B542
LB543:
    .byte $01 ; |       X| $B543
    .byte $02 ; |      X | $B544
    .byte $03 ; |      XX| $B545
    .byte $01 ; |       X| $B546
    .byte $02 ; |      X | $B547
    .byte $03 ; |      XX| $B548
    .byte $01 ; |       X| $B549
    .byte $02 ; |      X | $B54A
    .byte $03 ; |      XX| $B54B
LB54C:
    .byte $00 ; |        | $B54C
    .byte $01 ; |       X| $B54D
    .byte $02 ; |      X | $B54E
    .byte $03 ; |      XX| $B54F
LB550:
    .byte $0F ; |    XXXX| $B550
    .byte $0F ; |    XXXX| $B551
    .byte $0F ; |    XXXX| $B552
    .byte $0F ; |    XXXX| $B553

LB554:
    lda    #$11                  ; 2
    sta    ram_AE                ; 3
LB558:
    jsr    LB355                 ; 6
    ldy    ram_AE                ; 3
    lda.wy ram_BA,Y              ; 4
    tay                          ; 2
    lda    LBDC5,Y               ; 4
    sta    ram_9B                ; 3
    lda    LBDC5+1,Y             ; 4
    sta    ram_9C                ; 3
    dec    ram_AE                ; 5
    jsr    LB355                 ; 6
    ldy    ram_AE                ; 3
    lda.wy ram_BA,Y              ; 4
    tay                          ; 2
    lda    LBDC5,Y               ; 4
    sta    ram_9D                ; 3
    lda    LBDC5+1,Y             ; 4
    sta    ram_9E                ; 3
    dec    ram_AE                ; 5
    jsr    LB355                 ; 6
    ldy    ram_AE                ; 3
    lda.wy ram_BA,Y              ; 4
    tay                          ; 2
    lda    LBDC5,Y               ; 4
    sta    ram_9F                ; 3
    lda    LBDC5+1,Y             ; 4
    sta    ram_A0                ; 3
    dec    ram_AE                ; 5
    jsr    LB355                 ; 6
    ldy    #0                    ; 2
    lda    #$0B                  ; 2
    sta    ram_A9                ; 3
    inx                          ; 2
    jmp    LB5C6                 ; 3

LB5A4:
    ldy    ram_B1                ; 3
    bmi    LB5AC                 ; 2³
    lda    (ram_AF),Y            ; 5
    dec    ram_B1                ; 5
LB5AC:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    ldy    ram_A9                ; 3
    bmi    LB5D1                 ; 2³
    lda    (ram_9B),Y            ; 5
    sta    GRP1                  ; 3
    dec    ram_A9                ; 5
    lda    (ram_9F),Y            ; 5
    sta    ram_AA                ; 3
    lda    (ram_9D),Y            ; 5
    inx                          ; 2
    nop                          ; 2
    sta    GRP1                  ; 3
    ldy    ram_AA                ; 3
LB5C6:
    lda    #0                    ; 2
    cpx    ram_A8                ; 3
    sty    GRP1                  ; 3
    bcs    LB5A4                 ; 2³
    jmp    LB5AC                 ; 3

LB5D1:
    iny                          ; 2
    sty    GRP1                  ; 3
    lda    ram_AE                ; 3
    bpl    LB558                 ; 2³
    rts                          ; 6

LB5D9:
    ldx    #7                    ; 2
    lda    ram_83                ; 3
    lsr                          ; 2
    sta    ram_A9                ; 3
    ldy    #$0F                  ; 2
LB5E2:
    lda    #$20                  ; 2
    sta.wy ram_BA,Y              ; 5
    lda    ram_8A,X              ; 4
    lsr                          ; 2
    and    #$07                  ; 2
    cmp    ram_A9                ; 3
    bne    LB5F8                 ; 2³
    tya                          ; 2
    clc                          ; 2
    adc    #$13                  ; 2
    asl                          ; 2
    sta.wy ram_BA,Y              ; 5
LB5F8:
    dey                          ; 2
    lda    #$20                  ; 2
    sta.wy ram_BA,Y              ; 5
    lda    ram_98                ; 3
    beq    LB615                 ; 2³
    lda    ram_8A,X              ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    ram_A9                ; 3
    bne    LB615                 ; 2³
    tya                          ; 2
    clc                          ; 2
    adc    #$13                  ; 2
    asl                          ; 2
    sta.wy ram_BA,Y              ; 5
LB615:
    dex                          ; 2
    dey                          ; 2
    bpl    LB5E2                 ; 2³+1
    rts                          ; 6

LB61A:
    clc                          ; 2
    lda    ram_A8                ; 3
    cmp    #$7A                  ; 2
    bcs    LB629                 ; 2³
    sbc    #$1E                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bcc    LB62C                 ; 2³
LB629:
    lda    #$FF                  ; 2
    rts                          ; 6

LB62C:
    tay                          ; 2
    ldx    #2                    ; 2
    lda    ram_A7                ; 3
    cmp    #$31                  ; 2
    bcc    LB63B                 ; 2³
    cmp    #$4D                  ; 2
    bcc    LB63A                 ; 2³
    dex                          ; 2
LB63A:
    dex                          ; 2
LB63B:
    txa                          ; 2
    clc                          ; 2
    adc    LB641,Y               ; 4
    rts                          ; 6

LB641:
    .byte $0F ; |    XXXX| $B641
    .byte $0C ; |    XX  | $B642
    .byte $09 ; |    X  X| $B643
    .byte $06 ; |     XX | $B644
    .byte $03 ; |      XX| $B645
    .byte $00 ; |        | $B646

LB647:
    sta    ram_CD                ; 3
    lsr                          ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    #$80                  ; 2
    sta    ram_81                ; 3
    lda    #0                    ; 2
    sta    ram_96                ; 3
    lda    #$0F                  ; 2
    bcc    LB65B                 ; 2³
    lda    #$F0                  ; 2
LB65B:
    and    ram_8A,X              ; 4
    sta    ram_A9                ; 3
    tya                          ; 2
    bcs    LB666                 ; 2³
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
LB666:
    ora    ram_A9                ; 3
    sta    ram_8A,X              ; 4
    rts                          ; 6

LB66B:
    ldx    #$0B                  ; 2
LB66D:
    txa                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda.wy ram_84,Y              ; 4
    tay                          ; 2
    lda    LBDC5+1,Y             ; 4
    sta    ram_9B,X              ; 4
    dex                          ; 2
    lda    LBDC5,Y               ; 4
    sta    ram_9B,X              ; 4
    dex                          ; 2
    bpl    LB66D                 ; 2³
    lda    ram_82                ; 3
    bne    LB6C9                 ; 2³
    ldx    ram_A8                ; 3
    cpx    #$BE                  ; 2
    bcc    LB6C9                 ; 2³
    lda    ram_A7                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    bit    ram_AD                ; 3
    bvc    LB6B2                 ; 2³
    lda    ram_AC                ; 3
    bne    LB6B2                 ; 2³
    lda    ram_84,X              ; 4
    cmp    #$20                  ; 2
    beq    LB6B2                 ; 2³
    lsr                          ; 2
    sec                          ; 2
    sbc    #$13                  ; 2
    ldy    ram_83                ; 3
    stx    ram_AA                ; 3
    jsr    LB647                 ; 6
    ldx    ram_AA                ; 3
    lda    #$20                  ; 2
    sta    ram_84,X              ; 4
LB6B2:
    ldy    #$22                  ; 2
    lda    frameCounter          ; 3
    and    #$08                  ; 2
    beq    LB6BC                 ; 2³
    ldy    ram_84,X              ; 4
LB6BC:
    txa                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    LBDC5,Y               ; 4
    sta    ram_9B,X              ; 4
    lda    LBDC5+1,Y             ; 4
    sta    ram_9C,X              ; 4
LB6C9:
    rts                          ; 6

    lda    #$B9                  ; 2
    ldy    #$BD                  ; 2
    ldx    #$0B                  ; 2
LB6D0:
    sty    ram_9B,X              ; 4
    dex                          ; 2
    sta    ram_9B,X              ; 4
    dex                          ; 2
    bpl    LB6D0                 ; 2³
    rts                          ; 6

ManOne:
    .byte $01 ; |       X| $B6D9
    .byte $02 ; |      X | $B6DA
    .byte $02 ; |      X | $B6DB
    .byte $12 ; |   X  X | $B6DC
    .byte $1E ; |   XXXX | $B6DD
    .byte $07 ; |     XXX| $B6DE
    .byte $03 ; |      XX| $B6DF
    .byte $06 ; |     XX | $B6E0
    .byte $0C ; |    XX  | $B6E1
    .byte $0C ; |    XX  | $B6E2
    .byte $16 ; |   X XX | $B6E3
    .byte $2E ; |  X XXX | $B6E4
    .byte $3E ; |  XXXXX | $B6E5
    .byte $1E ; |   XXXX | $B6E6
    .byte $0C ; |    XX  | $B6E7
    .byte $03 ; |      XX| $B6E8
    .byte $07 ; |     XXX| $B6E9
    .byte $07 ; |     XXX| $B6EA
    .byte $02 ; |      X | $B6EB
    .byte $00 ; |        | $B6EC
ManTwo:
    .byte $0C ; |    XX  | $B6ED
    .byte $08 ; |    X   | $B6EE
    .byte $08 ; |    X   | $B6EF
    .byte $18 ; |   XX   | $B6F0
    .byte $0C ; |    XX  | $B6F1
    .byte $0A ; |    X X | $B6F2
    .byte $0E ; |    XXX | $B6F3
    .byte $1C ; |   XXX  | $B6F4
    .byte $18 ; |   XX   | $B6F5
    .byte $1C ; |   XXX  | $B6F6
    .byte $00 ; |        | $B6F7
    .byte $0E ; |    XXX | $B6F8
    .byte $1E ; |   XXXX | $B6F9
    .byte $1E ; |   XXXX | $B6FA
    .byte $0C ; |    XX  | $B6FB
    .byte $03 ; |      XX| $B6FC
    .byte $07 ; |     XXX| $B6FD
    .byte $07 ; |     XXX| $B6FE
    .byte $02 ; |      X | $B6FF
    .byte $00 ; |        | $B700
ManThree:
    .byte $40 ; | X      | $B701
    .byte $44 ; | X   X  | $B702
    .byte $24 ; |  X  X  | $B703
    .byte $14 ; |   X X  | $B704
    .byte $0A ; |    X X | $B705
    .byte $0A ; |    X X | $B706
    .byte $0A ; |    X X | $B707
    .byte $0E ; |    XXX | $B708
    .byte $1C ; |   XXX  | $B709
    .byte $1C ; |   XXX  | $B70A
    .byte $1C ; |   XXX  | $B70B
    .byte $0A ; |    X X | $B70C
    .byte $04 ; |     X  | $B70D
    .byte $0C ; |    XX  | $B70E
    .byte $1C ; |   XXX  | $B70F
    .byte $0C ; |    XX  | $B710
    .byte $06 ; |     XX | $B711
    .byte $0E ; |    XXX | $B712
    .byte $0E ; |    XXX | $B713
    .byte $04 ; |     X  | $B714
ManFour:
    .byte $00 ; |        | $B715
    .byte $40 ; | X      | $B716
    .byte $63 ; | XX   XX| $B717
    .byte $12 ; |   X  X | $B718
    .byte $12 ; |   X  X | $B719
    .byte $12 ; |   X  X | $B71A
    .byte $16 ; |   X XX | $B71B
    .byte $1C ; |   XXX  | $B71C
    .byte $18 ; |   XX   | $B71D
    .byte $18 ; |   XX   | $B71E
    .byte $18 ; |   XX   | $B71F
    .byte $06 ; |     XX | $B720
    .byte $0C ; |    XX  | $B721
    .byte $1C ; |   XXX  | $B722
    .byte $1C ; |   XXX  | $B723
    .byte $0C ; |    XX  | $B724
    .byte $06 ; |     XX | $B725
    .byte $0E ; |    XXX | $B726
    .byte $0E ; |    XXX | $B727
    .byte $04 ; |     X  | $B728
ManFive:
    .byte $14 ; |   X X  | $B729
    .byte $14 ; |   X X  | $B72A
    .byte $14 ; |   X X  | $B72B
    .byte $14 ; |   X X  | $B72C
    .byte $14 ; |   X X  | $B72D
    .byte $14 ; |   X X  | $B72E
    .byte $1C ; |   XXX  | $B72F
    .byte $3E ; |  XXXXX | $B730
    .byte $3E ; |  XXXXX | $B731
    .byte $3E ; |  XXXXX | $B732
    .byte $3E ; |  XXXXX | $B733
    .byte $3E ; |  XXXXX | $B734
    .byte $3E ; |  XXXXX | $B735
    .byte $3E ; |  XXXXX | $B736
    .byte $1C ; |   XXX  | $B737
    .byte $08 ; |    X   | $B738
    .byte $1C ; |   XXX  | $B739
    .byte $1C ; |   XXX  | $B73A
    .byte $08 ; |    X   | $B73B
    .byte $00 ; |        | $B73C

LB73D:
    .word ManOne         ; $B73D
    .word ManTwo         ; $B73F
    .word ManThree       ; $B741
    .word ManFour        ; $B743
    .word ManFive        ; $B745

LB747:
    clc                          ; 2
    adc    #$2E                  ; 2
    tay                          ; 2
    and    #$0F                  ; 2
    sta    ram_A9                ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc    ram_A9                ; 3
    cmp    #$0F                  ; 2
    bcc    LB75F                 ; 2³
    sbc    #$0F                  ; 2
    iny                          ; 2
LB75F:
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    and    #$F0                  ; 2
    sty    ram_A9                ; 3
    ora    ram_A9                ; 3
    rts                          ; 6

LB76C:
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    LB789                 ; 2³
    lda    ram_D2                ; 3
    cmp    #8                    ; 2
    bcc    LB789                 ; 2³
    inc    ram_D4                ; 5
    inc    ram_D3                ; 5
    inc    ram_D3                ; 5
    inc    ram_D3                ; 5
    inc    ram_D3                ; 5
    sec                          ; 2
    lda    ram_D2                ; 3
    sbc    #6                    ; 2
    sta    ram_D2                ; 3
LB789:
    jmp    LB0F5                 ; 3

LB78C:
    lda    #BLACK                ; 2
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    COLUPF                ; 3
    lda    #GREY+3               ; 2
    sta    COLUBK                ; 3
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    ldx    ram_D4                ; 3
    ldy    #0                    ; 2
LB7A6:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #GREY+6               ; 2
    sta    COLUPF                ; 3
    jsr    LB824                 ; 6
    inx                          ; 2
    iny                          ; 2
    cpy    ram_D2                ; 3
    bcs    LB7CA                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    iny                          ; 2
    cpy    ram_D2                ; 3
    bcs    LB7CA                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    iny                          ; 2
    cpy    ram_D2                ; 3
    bcs    LB7CA                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    iny                          ; 2
    cpy    ram_D2                ; 3
    bcc    LB7A6                 ; 2³
LB7CA:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    stx    ram_A9                ; 3
    ldx    ram_83                ; 3
    lda    LB32D,X               ; 4
    sta    COLUPF                ; 3
    ldx    ram_A9                ; 3
    dex                          ; 2
    iny                          ; 2
LB7E1:
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    LB824                 ; 6
    iny                          ; 2
    cpy    ram_D3                ; 3
    bcc    LB7E1                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #GREY+7               ; 2
    sta    COLUPF                ; 3
    iny                          ; 2
    dex                          ; 2
LB7FB:
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    LB824                 ; 6
    cpx    #0                    ; 2
    beq    LB805                 ; 2³
    dex                          ; 2
LB805:
    iny                          ; 2
    cpy    #$A0                  ; 2
    bcc    LB7FB                 ; 2³+1
    jmp    LB11D                 ; 3

LB80D:
    lda    ram_D2                ; 3
    cmp    #$12                  ; 2
    bcs    LB821                 ; 2³
    lda    ram_98                ; 3
    beq    LB81A                 ; 2³
    jmp    LB2D9                 ; 3

LB81A:
    lda    ram_9A                ; 3
    sta    ram_82                ; 3
    jmp    LB00C                 ; 3

LB821:
    jmp    LB05A                 ; 3

LB824:
    lda    LB834,X               ; 4
    sta    PF0                   ; 3
    lda    LB848,X               ; 4
    sta    PF1                   ; 3
    lda    LB85C,X               ; 4
    sta    PF2                   ; 3
    rts                          ; 6

LB834:
    .byte $F0 ; |XXXX    | $B834
    .byte $E0 ; |XXX     | $B835
    .byte $C0 ; |XX      | $B836
    .byte $80 ; |X       | $B837
    .byte $00 ; |        | $B838
    .byte $00 ; |        | $B839
    .byte $00 ; |        | $B83A
    .byte $00 ; |        | $B83B
    .byte $00 ; |        | $B83C
    .byte $00 ; |        | $B83D
    .byte $00 ; |        | $B83E
    .byte $00 ; |        | $B83F
    .byte $00 ; |        | $B840
    .byte $00 ; |        | $B841
    .byte $00 ; |        | $B842
    .byte $00 ; |        | $B843
    .byte $00 ; |        | $B844
    .byte $00 ; |        | $B845
    .byte $00 ; |        | $B846
    .byte $00 ; |        | $B847
LB848:
    .byte $FF ; |XXXXXXXX| $B848
    .byte $FF ; |XXXXXXXX| $B849
    .byte $FF ; |XXXXXXXX| $B84A
    .byte $FF ; |XXXXXXXX| $B84B
    .byte $FF ; |XXXXXXXX| $B84C
    .byte $7F ; | XXXXXXX| $B84D
    .byte $3F ; |  XXXXXX| $B84E
    .byte $1F ; |   XXXXX| $B84F
    .byte $0F ; |    XXXX| $B850
    .byte $07 ; |     XXX| $B851
    .byte $03 ; |      XX| $B852
    .byte $01 ; |       X| $B853
    .byte $00 ; |        | $B854
    .byte $00 ; |        | $B855
    .byte $00 ; |        | $B856
    .byte $00 ; |        | $B857
    .byte $00 ; |        | $B858
    .byte $00 ; |        | $B859
    .byte $00 ; |        | $B85A
    .byte $00 ; |        | $B85B
LB85C:
    .byte $FF ; |XXXXXXXX| $B85C
    .byte $FF ; |XXXXXXXX| $B85D
    .byte $FF ; |XXXXXXXX| $B85E
    .byte $FF ; |XXXXXXXX| $B85F
    .byte $FF ; |XXXXXXXX| $B860
    .byte $FF ; |XXXXXXXX| $B861
    .byte $FF ; |XXXXXXXX| $B862
    .byte $FF ; |XXXXXXXX| $B863
    .byte $FF ; |XXXXXXXX| $B864
    .byte $FF ; |XXXXXXXX| $B865
    .byte $FF ; |XXXXXXXX| $B866
    .byte $FF ; |XXXXXXXX| $B867
    .byte $FF ; |XXXXXXXX| $B868
    .byte $FE ; |XXXXXXX | $B869
    .byte $FC ; |XXXXXX  | $B86A
    .byte $F8 ; |XXXXX   | $B86B
    .byte $F0 ; |XXXX    | $B86C
    .byte $E0 ; |XXX     | $B86D
    .byte $C0 ; |XX      | $B86E
    .byte $80 ; |X       | $B86F

LB870:
    lda    #$50                  ; 2
    sta    ram_D2                ; 3
    lda    #$6E                  ; 2
    sta    ram_D3                ; 3
    lda    #0                    ; 2
    sta    ram_D4                ; 3
    lda    #0                    ; 2
    sta    ram_92                ; 3
    sta    ram_93                ; 3
    lda    #2                    ; 2
    sta    ram_94                ; 3
    lda    #3                    ; 2
    sta    ram_95                ; 3
    lda    #4                    ; 2
    sta    ram_82                ; 3
    lda    #$FF                  ; 2
    sta    ram_CD                ; 3
    rts                          ; 6

LB893:
    .word Two            ; $B893
    .word Nine           ; $B895
    .word Eight          ; $B897
    .word Seven          ; $B899
    .word One            ; $B89B
    .word Six            ; $B89D
    .word Three          ; $B89F

LB8A1:
    .word Six            ; $B8A1
    .word Three          ; $B8A3
    .word Five           ; $B8A5
    .word Seven          ; $B8A7
    .word Six            ; $B8A9
    .word Four           ; $B8AB
    .word Two            ; $B8AD

LB8AF:
    lda    ram_83                ; 3
    lsr                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    #0                    ; 2
    sta    ram_A9                ; 3
    lda    #$20                  ; 2
LB8BC:
    ldy    LB998,X               ; 4
    beq    LB8CC                 ; 2³
    cmp.wy ram_B9,Y              ; 4
    beq    LB8C8                 ; 2³
    inc    ram_A9                ; 5
LB8C8:
    inx                          ; 2
    jmp    LB8BC                 ; 3

LB8CC:
    lda    #0                    ; 2
    sta    ram_AA                ; 3
    ldx    #$0F                  ; 2
    lda    #$20                  ; 2
LB8D4:
    cmp    ram_BA,X              ; 4
    beq    LB8DA                 ; 2³
    inc    ram_AA                ; 5
LB8DA:
    dex                          ; 2
    bpl    LB8D4                 ; 2³
    lda    ram_AA                ; 3
    cmp    ram_A9                ; 3
    bne    LB904                 ; 2³+1
    cmp    #4                    ; 2
    bcc    LB904                 ; 2³+1
    lda    #$FF                  ; 2
    sta    ram_CD                ; 3
    lda    #$F0                  ; 2
    sta    ram_AC                ; 3
    lda    #$64                  ; 2
    sta    ram_D0                ; 3
    sta    ram_D1                ; 3
    lda    #0                    ; 2
    sta    ram_92                ; 3
    sta    ram_93                ; 3
    lda    #4                    ; 2
    sta    ram_94                ; 3
    lda    #5                    ; 2
    sta    ram_95                ; 3
    rts                          ; 6

LB904:
    rts                          ; 6

LB905:
    lda    ram_D0                ; 3
    beq    LB912                 ; 2³
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    bne    LB911                 ; 2³
    dec    ram_D0                ; 5
LB911:
    rts                          ; 6

LB912:
    lda    ram_83                ; 3
    lsr                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_AB                ; 3
    tax                          ; 2
    ldy    ram_CD                ; 3
    bmi    LB92C                 ; 2³
    iny                          ; 2
    tya                          ; 2
    ldy    #6                    ; 2
LB923:
    cmp    LB960,X               ; 4
    beq    LB933                 ; 2³
    inx                          ; 2
    dey                          ; 2
    bpl    LB923                 ; 2³
LB92C:
    lda    #$20                  ; 2
    sta    ram_CE                ; 3
    sta    ram_CF                ; 3
    rts                          ; 6

LB933:
    lda    LB9D0,X               ; 4
    clc                          ; 2
    adc    #$12                  ; 2
    asl                          ; 2
    sta    ram_CE                ; 3
    lda    LBA08,X               ; 4
    clc                          ; 2
    adc    #$12                  ; 2
    asl                          ; 2
    sta    ram_CF                ; 3
    lda    #$1E                  ; 2
    sta    ram_D0                ; 3
    lda    #$FF                  ; 2
    sta    ram_CD                ; 3
    lda    #$40                  ; 2
    sta    ram_AC                ; 3
    lda    #0                    ; 2
    sta    ram_92                ; 3
    sta    ram_93                ; 3
    lda    #6                    ; 2
    sta    ram_94                ; 3
    lda    #7                    ; 2
    sta    ram_95                ; 3
    rts                          ; 6

LB960:
    .byte $10 ; |   X    | $B960
    .byte $03 ; |      XX| $B961
    .byte $09 ; |    X  X| $B962
    .byte $07 ; |     XXX| $B963
    .byte $0E ; |    XXX | $B964
    .byte $0A ; |    X X | $B965
    .byte $04 ; |     X  | $B966
    .byte $00 ; |        | $B967
    .byte $0B ; |    X XX| $B968
    .byte $06 ; |     XX | $B969
    .byte $0D ; |    XX X| $B96A
    .byte $0C ; |    XX  | $B96B
    .byte $01 ; |       X| $B96C
    .byte $08 ; |    X   | $B96D
    .byte $05 ; |     X X| $B96E
    .byte $00 ; |        | $B96F
    .byte $0D ; |    XX X| $B970
    .byte $01 ; |       X| $B971
    .byte $07 ; |     XXX| $B972
    .byte $0B ; |    X XX| $B973
    .byte $0F ; |    XXXX| $B974
    .byte $02 ; |      X | $B975
    .byte $08 ; |    X   | $B976
    .byte $00 ; |        | $B977
    .byte $10 ; |   X    | $B978
    .byte $03 ; |      XX| $B979
    .byte $0E ; |    XXX | $B97A
    .byte $01 ; |       X| $B97B
    .byte $09 ; |    X  X| $B97C
    .byte $06 ; |     XX | $B97D
    .byte $0C ; |    XX  | $B97E
    .byte $00 ; |        | $B97F
    .byte $0A ; |    X X | $B980
    .byte $09 ; |    X  X| $B981
    .byte $0F ; |    XXXX| $B982
    .byte $02 ; |      X | $B983
    .byte $03 ; |      XX| $B984
    .byte $0E ; |    XXX | $B985
    .byte $06 ; |     XX | $B986
    .byte $00 ; |        | $B987
    .byte $0C ; |    XX  | $B988
    .byte $08 ; |    X   | $B989
    .byte $06 ; |     XX | $B98A
    .byte $04 ; |     X  | $B98B
    .byte $0B ; |    X XX| $B98C
    .byte $05 ; |     X X| $B98D
    .byte $0D ; |    XX X| $B98E
    .byte $00 ; |        | $B98F
    .byte $05 ; |     X X| $B990
    .byte $07 ; |     XXX| $B991
    .byte $0F ; |    XXXX| $B992
    .byte $08 ; |    X   | $B993
    .byte $0C ; |    XX  | $B994
    .byte $04 ; |     X  | $B995
    .byte $0A ; |    X X | $B996
    .byte $00 ; |        | $B997
LB998:
    .byte $01 ; |       X| $B998
    .byte $02 ; |      X | $B999
    .byte $03 ; |      XX| $B99A
    .byte $04 ; |     X  | $B99B
    .byte $05 ; |     X X| $B99C
    .byte $06 ; |     XX | $B99D
    .byte $07 ; |     XXX| $B99E
    .byte $00 ; |        | $B99F
    .byte $01 ; |       X| $B9A0
    .byte $07 ; |     XXX| $B9A1
    .byte $08 ; |    X   | $B9A2
    .byte $09 ; |    X  X| $B9A3
    .byte $0A ; |    X X | $B9A4
    .byte $0B ; |    X XX| $B9A5
    .byte $0C ; |    XX  | $B9A6
    .byte $00 ; |        | $B9A7
    .byte $01 ; |       X| $B9A8
    .byte $06 ; |     XX | $B9A9
    .byte $08 ; |    X   | $B9AA
    .byte $0A ; |    X X | $B9AB
    .byte $0D ; |    XX X| $B9AC
    .byte $0E ; |    XXX | $B9AD
    .byte $10 ; |   X    | $B9AE
    .byte $00 ; |        | $B9AF
    .byte $01 ; |       X| $B9B0
    .byte $03 ; |      XX| $B9B1
    .byte $06 ; |     XX | $B9B2
    .byte $0C ; |    XX  | $B9B3
    .byte $0D ; |    XX X| $B9B4
    .byte $0F ; |    XXXX| $B9B5
    .byte $10 ; |   X    | $B9B6
    .byte $00 ; |        | $B9B7
    .byte $02 ; |      X | $B9B8
    .byte $04 ; |     X  | $B9B9
    .byte $05 ; |     X X| $B9BA
    .byte $09 ; |    X  X| $B9BB
    .byte $0D ; |    XX X| $B9BC
    .byte $0E ; |    XXX | $B9BD
    .byte $0F ; |    XXXX| $B9BE
    .byte $00 ; |        | $B9BF
    .byte $03 ; |      XX| $B9C0
    .byte $05 ; |     X X| $B9C1
    .byte $07 ; |     XXX| $B9C2
    .byte $09 ; |    X  X| $B9C3
    .byte $0A ; |    X X | $B9C4
    .byte $0E ; |    XXX | $B9C5
    .byte $0F ; |    XXXX| $B9C6
    .byte $00 ; |        | $B9C7
    .byte $02 ; |      X | $B9C8
    .byte $03 ; |      XX| $B9C9
    .byte $04 ; |     X  | $B9CA
    .byte $09 ; |    X  X| $B9CB
    .byte $0D ; |    XX X| $B9CC
    .byte $0F ; |    XXXX| $B9CD
    .byte $10 ; |   X    | $B9CE
    .byte $00 ; |        | $B9CF
LB9D0:
    .byte $01 ; |       X| $B9D0
    .byte $01 ; |       X| $B9D1
    .byte $06 ; |     XX | $B9D2
    .byte $03 ; |      XX| $B9D3
    .byte $02 ; |      X | $B9D4
    .byte $05 ; |     X X| $B9D5
    .byte $10 ; |   X    | $B9D6
    .byte $00 ; |        | $B9D7
    .byte $03 ; |      XX| $B9D8
    .byte $07 ; |     XXX| $B9D9
    .byte $01 ; |       X| $B9DA
    .byte $03 ; |      XX| $B9DB
    .byte $04 ; |     X  | $B9DC
    .byte $0A ; |    X X | $B9DD
    .byte $03 ; |      XX| $B9DE
    .byte $00 ; |        | $B9DF
    .byte $07 ; |     XXX| $B9E0
    .byte $08 ; |    X   | $B9E1
    .byte $0D ; |    XX X| $B9E2
    .byte $06 ; |     XX | $B9E3
    .byte $02 ; |      X | $B9E4
    .byte $07 ; |     XXX| $B9E5
    .byte $0F ; |    XXXX| $B9E6
    .byte $00 ; |        | $B9E7
    .byte $01 ; |       X| $B9E8
    .byte $0B ; |    X XX| $B9E9
    .byte $06 ; |     XX | $B9EA
    .byte $06 ; |     XX | $B9EB
    .byte $04 ; |     X  | $B9EC
    .byte $0E ; |    XXX | $B9ED
    .byte $09 ; |    X  X| $B9EE
    .byte $00 ; |        | $B9EF
    .byte $04 ; |     X  | $B9F0
    .byte $09 ; |    X  X| $B9F1
    .byte $0D ; |    XX X| $B9F2
    .byte $01 ; |       X| $B9F3
    .byte $09 ; |    X  X| $B9F4
    .byte $03 ; |      XX| $B9F5
    .byte $04 ; |     X  | $B9F6
    .byte $00 ; |        | $B9F7
    .byte $05 ; |     X X| $B9F8
    .byte $0B ; |    X XX| $B9F9
    .byte $08 ; |    X   | $B9FA
    .byte $0C ; |    XX  | $B9FB
    .byte $05 ; |     X X| $B9FC
    .byte $03 ; |      XX| $B9FD
    .byte $04 ; |     X  | $B9FE
    .byte $00 ; |        | $B9FF
    .byte $03 ; |      XX| $BA00
    .byte $01 ; |       X| $BA01
    .byte $08 ; |    X   | $BA02
    .byte $0C ; |    XX  | $BA03
    .byte $05 ; |     X X| $BA04
    .byte $0F ; |    XXXX| $BA05
    .byte $02 ; |      X | $BA06
    .byte $00 ; |        | $BA07
LBA08:
    .byte $02 ; |      X | $BA08
    .byte $07 ; |     XXX| $BA09
    .byte $10 ; |   X    | $BA0A
    .byte $14 ; |   X X  | $BA0B
    .byte $0F ; |    XXXX| $BA0C
    .byte $0A ; |    X X | $BA0D
    .byte $17 ; |   X XXX| $BA0E
    .byte $00 ; |        | $BA0F
    .byte $11 ; |   X   X| $BA10
    .byte $0B ; |    X XX| $BA11
    .byte $0A ; |    X X | $BA12
    .byte $0F ; |    XXXX| $BA13
    .byte $0D ; |    XX X| $BA14
    .byte $16 ; |   X XX | $BA15
    .byte $10 ; |   X    | $BA16
    .byte $00 ; |        | $BA17
    .byte $11 ; |   X   X| $BA18
    .byte $0C ; |    XX  | $BA19
    .byte $0E ; |    XXX | $BA1A
    .byte $0D ; |    XX X| $BA1B
    .byte $15 ; |   X X X| $BA1C
    .byte $0E ; |    XXX | $BA1D
    .byte $10 ; |   X    | $BA1E
    .byte $00 ; |        | $BA1F
    .byte $05 ; |     X X| $BA20
    .byte $0C ; |    XX  | $BA21
    .byte $13 ; |   X  XX| $BA22
    .byte $0F ; |    XXXX| $BA23
    .byte $0E ; |    XXX | $BA24
    .byte $0F ; |    XXXX| $BA25
    .byte $17 ; |   X XXX| $BA26
    .byte $00 ; |        | $BA27
    .byte $07 ; |     XXX| $BA28
    .byte $0A ; |    X X | $BA29
    .byte $13 ; |   X  XX| $BA2A
    .byte $03 ; |      XX| $BA2B
    .byte $0F ; |    XXXX| $BA2C
    .byte $05 ; |     X X| $BA2D
    .byte $17 ; |   X XXX| $BA2E
    .byte $00 ; |        | $BA2F
    .byte $06 ; |     XX | $BA30
    .byte $12 ; |   X  X | $BA31
    .byte $0A ; |    X X | $BA32
    .byte $10 ; |   X    | $BA33
    .byte $15 ; |   X X X| $BA34
    .byte $09 ; |    X  X| $BA35
    .byte $09 ; |    X  X| $BA36
    .byte $00 ; |        | $BA37
    .byte $04 ; |     X  | $BA38
    .byte $12 ; |   X  X | $BA39
    .byte $10 ; |   X    | $BA3A
    .byte $14 ; |   X X  | $BA3B
    .byte $09 ; |    X  X| $BA3C
    .byte $16 ; |   X XX | $BA3D
    .byte $10 ; |   X    | $BA3E
    .byte $00 ; |        | $BA3F

LBA40:
    ldx    ram_96                ; 3
    bmi    LBA53                 ; 2³
    lda    LBA58,X               ; 4
    sta    AUDF0                 ; 3
    lda    LBA5A,X               ; 4
    sta    AUDC0                 ; 3
    lda    LBA5C,X               ; 4
    sta    AUDV0                 ; 3
LBA53:
    lda    #$FF                  ; 2
    sta    ram_96                ; 3
    rts                          ; 6

LBA58:
    .byte $0D ; |    XX X| $BA58
    .byte $0A ; |    X X | $BA59
LBA5A:
    .byte $0D ; |    XX X| $BA5A
    .byte $0A ; |    X X | $BA5B
LBA5C:
    .byte $0D ; |    XX X| $BA5C
    .byte $0A ; |    X X | $BA5D

LBA5E:
    lda    ram_92,X              ; 4
    bne    LBA6C                 ; 2³
    ldy    ram_94,X              ; 4
    lda    LBAB5,Y               ; 4
    sta    ram_94,X              ; 4
    jmp    LBA79                 ; 3

LBA6C:
    ldy    ram_94,X              ; 4
    beq    LBAAA                 ; 2³
    lda    LBB96,Y               ; 4
    cmp    ram_92,X              ; 4
    bcs    LBA8C                 ; 2³
    inc    ram_94,X              ; 6
LBA79:
    ldy    ram_94,X              ; 4
    lda    LBB03,Y               ; 4
    bpl    LBA85                 ; 2³
    lda    #0                    ; 2
    jmp    LBA87                 ; 3

LBA85:
    lda    #$E0                  ; 2
LBA87:
    and    LBB96,Y               ; 4
    sta    ram_92,X              ; 4
LBA8C:
    lda    LBB03,Y               ; 4
    bpl    LBA98                 ; 2³
    inc    ram_92,X              ; 6
    asl                          ; 2
    bpl    LBAAE                 ; 2³
    bmi    LBAAA                 ; 3   always branch

LBA98:
    sta    AUDF0,X               ; 4
    ldy    ram_92,X              ; 4
    lda    LBAC3,Y               ; 4
    sta    AUDV0,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDC0,X               ; 4
    inc    ram_92,X              ; 6
    rts                          ; 6

LBAAA:
    lda    #0                    ; 2
    sta    ram_94,X              ; 4
LBAAE:
    lda    #0                    ; 2
    sta    AUDV0,X               ; 4
    sta    AUDF0,X               ; 4
    rts                          ; 6

LBAB5:
    .byte $02 ; |      X | $BAB5
    .byte $0A ; |    X X | $BAB6
    .byte $8A ; |X   X X | $BAB7
    .byte $8E ; |X   XXX | $BAB8
    .byte $31 ; |  XX   X| $BAB9
    .byte $49 ; | X  X  X| $BABA
    .byte $67 ; | XX  XXX| $BABB
    .byte $6C ; | XX XX  | $BABC
    .byte $74 ; | XXX X  | $BABD
    .byte $7B ; | XXXX XX| $BABE
    .byte $84 ; |X    X  | $BABF
    .byte $87 ; |X    XXX| $BAC0
    .byte $14 ; |   X X  | $BAC1
    .byte $22 ; |  X   X | $BAC2
LBAC3:
    .byte $C7 ; |XX   XXX| $BAC3   VOL and TONE
    .byte $CF ; |XX  XXXX| $BAC4
    .byte $CC ; |XX  XX  | $BAC5
    .byte $CA ; |XX  X X | $BAC6
    .byte $C8 ; |XX  X   | $BAC7
    .byte $C7 ; |XX   XXX| $BAC8
    .byte $C6 ; |XX   XX | $BAC9
    .byte $C6 ; |XX   XX | $BACA
    .byte $C5 ; |XX   X X| $BACB
    .byte $C5 ; |XX   X X| $BACC
    .byte $C4 ; |XX   X  | $BACD
    .byte $C4 ; |XX   X  | $BACE
    .byte $C4 ; |XX   X  | $BACF
    .byte $C3 ; |XX    XX| $BAD0
    .byte $C3 ; |XX    XX| $BAD1
    .byte $C3 ; |XX    XX| $BAD2
    .byte $C3 ; |XX    XX| $BAD3
    .byte $C3 ; |XX    XX| $BAD4
    .byte $C2 ; |XX    X | $BAD5
    .byte $C2 ; |XX    X | $BAD6
    .byte $C2 ; |XX    X | $BAD7
    .byte $C2 ; |XX    X | $BAD8
    .byte $C2 ; |XX    X | $BAD9
    .byte $C2 ; |XX    X | $BADA
    .byte $C1 ; |XX     X| $BADB
    .byte $C1 ; |XX     X| $BADC
    .byte $C1 ; |XX     X| $BADD
    .byte $C1 ; |XX     X| $BADE
    .byte $C1 ; |XX     X| $BADF
    .byte $C1 ; |XX     X| $BAE0
    .byte $C1 ; |XX     X| $BAE1
    .byte $C1 ; |XX     X| $BAE2
    .byte $C1 ; |XX     X| $BAE3
    .byte $C2 ; |XX    X | $BAE4
    .byte $C3 ; |XX    XX| $BAE5
    .byte $C4 ; |XX   X  | $BAE6
    .byte $C5 ; |XX   X X| $BAE7
    .byte $C6 ; |XX   XX | $BAE8
    .byte $C7 ; |XX   XXX| $BAE9
    .byte $C7 ; |XX   XXX| $BAEA
    .byte $C7 ; |XX   XXX| $BAEB
    .byte $C7 ; |XX   XXX| $BAEC
    .byte $C7 ; |XX   XXX| $BAED
    .byte $C7 ; |XX   XXX| $BAEE
    .byte $C7 ; |XX   XXX| $BAEF
    .byte $C7 ; |XX   XXX| $BAF0
    .byte $C7 ; |XX   XXX| $BAF1
    .byte $C7 ; |XX   XXX| $BAF2
    .byte $C6 ; |XX   XX | $BAF3
    .byte $C6 ; |XX   XX | $BAF4
    .byte $C5 ; |XX   X X| $BAF5
    .byte $C5 ; |XX   X X| $BAF6
    .byte $C4 ; |XX   X  | $BAF7
    .byte $C3 ; |XX    XX| $BAF8
    .byte $C2 ; |XX    X | $BAF9
    .byte $C1 ; |XX     X| $BAFA
    .byte $C1 ; |XX     X| $BAFB
    .byte $C1 ; |XX     X| $BAFC
    .byte $C1 ; |XX     X| $BAFD
    .byte $C1 ; |XX     X| $BAFE
    .byte $C1 ; |XX     X| $BAFF
    .byte $C1 ; |XX     X| $BB00
    .byte $C1 ; |XX     X| $BB01
    .byte $C1 ; |XX     X| $BB02
LBB03:
    .byte $C0 ; |XX      | $BB03   FREQUENCY
    .byte $C0 ; |XX      | $BB04
    .byte $1D ; |   XXX X| $BB05
    .byte $13 ; |   X  XX| $BB06
    .byte $17 ; |   X XXX| $BB07
    .byte $11 ; |   X   X| $BB08
    .byte $13 ; |   X  XX| $BB09
    .byte $0F ; |    XXXX| $BB0A
    .byte $0E ; |    XXX | $BB0B
    .byte $C0 ; |XX      | $BB0C
    .byte $0E ; |    XXX | $BB0D
    .byte $17 ; |   X XXX| $BB0E
    .byte $11 ; |   X   X| $BB0F
    .byte $17 ; |   X XXX| $BB10
    .byte $1A ; |   XX X | $BB11
    .byte $17 ; |   X XXX| $BB12
    .byte $17 ; |   X XXX| $BB13
    .byte $13 ; |   X  XX| $BB14
    .byte $13 ; |   X  XX| $BB15
    .byte $C0 ; |XX      | $BB16
    .byte $1B ; |   XX XX| $BB17
    .byte $80 ; |X       | $BB18
    .byte $1F ; |   XXXXX| $BB19
    .byte $80 ; |X       | $BB1A
    .byte $14 ; |   X X  | $BB1B
    .byte $80 ; |X       | $BB1C
    .byte $1A ; |   XX X | $BB1D
    .byte $1B ; |   XX XX| $BB1E
    .byte $14 ; |   X X  | $BB1F
    .byte $80 ; |X       | $BB20
    .byte $1C ; |   XXX  | $BB21
    .byte $14 ; |   X X  | $BB22
    .byte $80 ; |X       | $BB23
    .byte $C0 ; |XX      | $BB24
    .byte $14 ; |   X X  | $BB25
    .byte $13 ; |   X  XX| $BB26
    .byte $0F ; |    XXXX| $BB27
    .byte $80 ; |X       | $BB28
    .byte $0D ; |    XX X| $BB29
    .byte $80 ; |X       | $BB2A
    .byte $0F ; |    XXXX| $BB2B
    .byte $13 ; |   X  XX| $BB2C
    .byte $14 ; |   X X  | $BB2D
    .byte $15 ; |   X X X| $BB2E
    .byte $19 ; |   XX  X| $BB2F
    .byte $80 ; |X       | $BB30
    .byte $1B ; |   XX XX| $BB31
    .byte $80 ; |X       | $BB32
    .byte $C0 ; |XX      | $BB33
    .byte $0E ; |    XXX | $BB34
    .byte $80 ; |X       | $BB35
    .byte $13 ; |   X  XX| $BB36
    .byte $80 ; |X       | $BB37
    .byte $11 ; |   X   X| $BB38
    .byte $80 ; |X       | $BB39
    .byte $17 ; |   X XXX| $BB3A
    .byte $17 ; |   X XXX| $BB3B
    .byte $16 ; |   X XX | $BB3C
    .byte $16 ; |   X XX | $BB3D
    .byte $17 ; |   X XXX| $BB3E
    .byte $80 ; |X       | $BB3F
    .byte $11 ; |   X   X| $BB40
    .byte $0B ; |    X XX| $BB41
    .byte $80 ; |X       | $BB42
    .byte $C0 ; |XX      | $BB43
    .byte $13 ; |   X  XX| $BB44
    .byte $13 ; |   X  XX| $BB45
    .byte $13 ; |   X  XX| $BB46
    .byte $1A ; |   XX X | $BB47
    .byte $1A ; |   XX X | $BB48
    .byte $14 ; |   X X  | $BB49
    .byte $13 ; |   X  XX| $BB4A
    .byte $C0 ; |XX      | $BB4B
    .byte $13 ; |   X  XX| $BB4C
    .byte $1D ; |   XXX X| $BB4D
    .byte $13 ; |   X  XX| $BB4E
    .byte $1D ; |   XXX X| $BB4F
    .byte $18 ; |   XX   | $BB50
    .byte $10 ; |   X    | $BB51
    .byte $18 ; |   XX   | $BB52
    .byte $10 ; |   X    | $BB53
    .byte $15 ; |   X X X| $BB54
    .byte $0E ; |    XXX | $BB55
    .byte $15 ; |   X X X| $BB56
    .byte $0E ; |    XXX | $BB57
    .byte $13 ; |   X  XX| $BB58
    .byte $0E ; |    XXX | $BB59
    .byte $11 ; |   X   X| $BB5A
    .byte $0E ; |    XXX | $BB5B
    .byte $0E ; |    XXX | $BB5C
    .byte $13 ; |   X  XX| $BB5D
    .byte $80 ; |X       | $BB5E
    .byte $0B ; |    X XX| $BB5F
    .byte $13 ; |   X  XX| $BB60
    .byte $80 ; |X       | $BB61
    .byte $C0 ; |XX      | $BB62
    .byte $09 ; |    X  X| $BB63
    .byte $0F ; |    XXXX| $BB64
    .byte $0E ; |    XXX | $BB65
    .byte $11 ; |   X   X| $BB66
    .byte $0F ; |    XXXX| $BB67
    .byte $1A ; |   XX X | $BB68
    .byte $C0 ; |XX      | $BB69
    .byte $0B ; |    X XX| $BB6A
    .byte $06 ; |     XX | $BB6B
    .byte $08 ; |    X   | $BB6C
    .byte $05 ; |     X X| $BB6D
    .byte $C0 ; |XX      | $BB6E
    .byte $11 ; |   X   X| $BB6F
    .byte $11 ; |   X   X| $BB70
    .byte $11 ; |   X   X| $BB71
    .byte $11 ; |   X   X| $BB72
    .byte $0D ; |    XX X| $BB73
    .byte $0B ; |    X XX| $BB74
    .byte $11 ; |   X   X| $BB75
    .byte $C0 ; |XX      | $BB76
    .byte $1B ; |   XX XX| $BB77
    .byte $18 ; |   XX   | $BB78
    .byte $17 ; |   X XXX| $BB79
    .byte $18 ; |   XX   | $BB7A
    .byte $18 ; |   XX   | $BB7B
    .byte $18 ; |   XX   | $BB7C
    .byte $C0 ; |XX      | $BB7D
    .byte $14 ; |   X X  | $BB7E
    .byte $1F ; |   XXXXX| $BB7F
    .byte $1B ; |   XX XX| $BB80
    .byte $0F ; |    XXXX| $BB81
    .byte $1B ; |   XX XX| $BB82
    .byte $14 ; |   X X  | $BB83
    .byte $12 ; |   X  X | $BB84
    .byte $1F ; |   XXXXX| $BB85
    .byte $C0 ; |XX      | $BB86
    .byte $18 ; |   XX   | $BB87
    .byte $1D ; |   XXX X| $BB88
    .byte $C0 ; |XX      | $BB89
    .byte $1C ; |   XXX  | $BB8A
    .byte $13 ; |   X  XX| $BB8B
    .byte $C0 ; |XX      | $BB8C
    .byte $13 ; |   X  XX| $BB8D
    .byte $17 ; |   X XXX| $BB8E
    .byte $17 ; |   X XXX| $BB8F
    .byte $C0 ; |XX      | $BB90
    .byte $0F ; |    XXXX| $BB91
    .byte $17 ; |   X XXX| $BB92
    .byte $11 ; |   X   X| $BB93
    .byte $1F ; |   XXXXX| $BB94
    .byte $C0 ; |XX      | $BB95
LBB96:
    .byte $00 ; |        | $BB96
    .byte $00 ; |        | $BB97
    .byte $0F ; |    XXXX| $BB98
    .byte $0F ; |    XXXX| $BB99
    .byte $0F ; |    XXXX| $BB9A
    .byte $0F ; |    XXXX| $BB9B
    .byte $0F ; |    XXXX| $BB9C
    .byte $0F ; |    XXXX| $BB9D
    .byte $0F ; |    XXXX| $BB9E
    .byte $00 ; |        | $BB9F
    .byte $0F ; |    XXXX| $BBA0
    .byte $0F ; |    XXXX| $BBA1
    .byte $0F ; |    XXXX| $BBA2
    .byte $07 ; |     XXX| $BBA3
    .byte $07 ; |     XXX| $BBA4
    .byte $0F ; |    XXXX| $BBA5
    .byte $0F ; |    XXXX| $BBA6
    .byte $0F ; |    XXXX| $BBA7
    .byte $0F ; |    XXXX| $BBA8
    .byte $00 ; |        | $BBA9
    .byte $3F ; |  XXXXXX| $BBAA
    .byte $0B ; |    X XX| $BBAB
    .byte $3F ; |  XXXXXX| $BBAC
    .byte $0B ; |    X XX| $BBAD
    .byte $3F ; |  XXXXXX| $BBAE
    .byte $21 ; |  X    X| $BBAF
    .byte $35 ; |  XX X X| $BBB0
    .byte $35 ; |  XX X X| $BBB1
    .byte $3F ; |  XXXXXX| $BBB2
    .byte $0B ; |    X XX| $BBB3
    .byte $35 ; |  XX X X| $BBB4
    .byte $3F ; |  XXXXXX| $BBB5
    .byte $2D ; |  X XX X| $BBB6
    .byte $00 ; |        | $BBB7
    .byte $15 ; |   X X X| $BBB8
    .byte $15 ; |   X X X| $BBB9
    .byte $1F ; |   XXXXX| $BBBA
    .byte $0B ; |    X XX| $BBBB
    .byte $1F ; |   XXXXX| $BBBC
    .byte $0B ; |    X XX| $BBBD
    .byte $15 ; |   X X X| $BBBE
    .byte $15 ; |   X X X| $BBBF
    .byte $15 ; |   X X X| $BBC0
    .byte $15 ; |   X X X| $BBC1
    .byte $1F ; |   XXXXX| $BBC2
    .byte $0B ; |    X XX| $BBC3
    .byte $1F ; |   XXXXX| $BBC4
    .byte $2D ; |  X XX X| $BBC5
    .byte $00 ; |        | $BBC6
    .byte $1F ; |   XXXXX| $BBC7
    .byte $17 ; |   X XXX| $BBC8
    .byte $1F ; |   XXXXX| $BBC9
    .byte $27 ; |  X  XXX| $BBCA
    .byte $1F ; |   XXXXX| $BBCB
    .byte $1F ; |   XXXXX| $BBCC
    .byte $0F ; |    XXXX| $BBCD
    .byte $0F ; |    XXXX| $BBCE
    .byte $0F ; |    XXXX| $BBCF
    .byte $0F ; |    XXXX| $BBD0
    .byte $1F ; |   XXXXX| $BBD1
    .byte $0F ; |    XXXX| $BBD2
    .byte $0F ; |    XXXX| $BBD3
    .byte $1F ; |   XXXXX| $BBD4
    .byte $1F ; |   XXXXX| $BBD5
    .byte $00 ; |        | $BBD6
    .byte $1F ; |   XXXXX| $BBD7
    .byte $17 ; |   X XXX| $BBD8
    .byte $07 ; |     XXX| $BBD9
    .byte $07 ; |     XXX| $BBDA
    .byte $07 ; |     XXX| $BBDB
    .byte $0F ; |    XXXX| $BBDC
    .byte $17 ; |   X XXX| $BBDD
    .byte $00 ; |        | $BBDE
    .byte $07 ; |     XXX| $BBDF
    .byte $0F ; |    XXXX| $BBE0
    .byte $07 ; |     XXX| $BBE1
    .byte $1F ; |   XXXXX| $BBE2
    .byte $07 ; |     XXX| $BBE3
    .byte $0F ; |    XXXX| $BBE4
    .byte $07 ; |     XXX| $BBE5
    .byte $1F ; |   XXXXX| $BBE6
    .byte $07 ; |     XXX| $BBE7
    .byte $0F ; |    XXXX| $BBE8
    .byte $07 ; |     XXX| $BBE9
    .byte $1F ; |   XXXXX| $BBEA
    .byte $0F ; |    XXXX| $BBEB
    .byte $0F ; |    XXXX| $BBEC
    .byte $0F ; |    XXXX| $BBED
    .byte $0F ; |    XXXX| $BBEE
    .byte $07 ; |     XXX| $BBEF
    .byte $1F ; |   XXXXX| $BBF0
    .byte $07 ; |     XXX| $BBF1
    .byte $0F ; |    XXXX| $BBF2
    .byte $1F ; |   XXXXX| $BBF3
    .byte $1F ; |   XXXXX| $BBF4
    .byte $00 ; |        | $BBF5
    .byte $1F ; |   XXXXX| $BBF6
    .byte $1F ; |   XXXXX| $BBF7
    .byte $07 ; |     XXX| $BBF8
    .byte $07 ; |     XXX| $BBF9
    .byte $0F ; |    XXXX| $BBFA
    .byte $17 ; |   X XXX| $BBFB
    .byte $00 ; |        | $BBFC
    .byte $17 ; |   X XXX| $BBFD
    .byte $0D ; |    XX X| $BBFE
    .byte $0D ; |    XX X| $BBFF
    .byte $0D ; |    XX X| $BC00
    .byte $00 ; |        | $BC01
    .byte $0B ; |    X XX| $BC02
    .byte $03 ; |      XX| $BC03
    .byte $03 ; |      XX| $BC04
    .byte $03 ; |      XX| $BC05
    .byte $0D ; |    XX X| $BC06
    .byte $0D ; |    XX X| $BC07
    .byte $0D ; |    XX X| $BC08
    .byte $00 ; |        | $BC09
    .byte $03 ; |      XX| $BC0A
    .byte $0F ; |    XXXX| $BC0B
    .byte $0F ; |    XXXX| $BC0C
    .byte $11 ; |   X   X| $BC0D
    .byte $11 ; |   X   X| $BC0E
    .byte $17 ; |   X XXX| $BC0F
    .byte $00 ; |        | $BC10
    .byte $03 ; |      XX| $BC11
    .byte $0B ; |    X XX| $BC12
    .byte $03 ; |      XX| $BC13
    .byte $0B ; |    X XX| $BC14
    .byte $03 ; |      XX| $BC15
    .byte $11 ; |   X   X| $BC16
    .byte $11 ; |   X   X| $BC17
    .byte $17 ; |   X XXX| $BC18
    .byte $00 ; |        | $BC19
    .byte $25 ; |  X  X X| $BC1A
    .byte $3F ; |  XXXXXX| $BC1B
    .byte $00 ; |        | $BC1C
    .byte $25 ; |  X  X X| $BC1D
    .byte $3F ; |  XXXXXX| $BC1E
    .byte $00 ; |        | $BC1F
    .byte $11 ; |   X   X| $BC20
    .byte $11 ; |   X   X| $BC21
    .byte $11 ; |   X   X| $BC22
    .byte $00 ; |        | $BC23
    .byte $0B ; |    X XX| $BC24
    .byte $05 ; |     X X| $BC25
    .byte $11 ; |   X   X| $BC26
    .byte $11 ; |   X   X| $BC27
    .byte $00 ; |        | $BC28

LBC29:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #3                    ; 2
    ldy    #0                    ; 2
    sty    REFP1                 ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    HMP1                  ; 3
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    sty    REFP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

LBC53:
    sta    ram_A9                ; 3
LBC55:
    ldy    ram_A9                ; 3
    lda    (ram_9B),Y            ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_9D),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_9F),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_A1),Y            ; 5
    sta    ram_AA                ; 3
    lda    (ram_A3),Y            ; 5
    tax                          ; 2
    lda    (ram_A5),Y            ; 5
    tay                          ; 2
    lda    ram_AA                ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    dec    ram_A9                ; 5
    bpl    LBC55                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    rts                          ; 6

LBC88:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #6                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    ldx    #0                    ; 2
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    GRP0                  ; 3
    inx                          ; 2
    stx    VDELP0                ; 3
    sta    RESP0                 ; 3
    stx    VDELP1                ; 3
    sta    RESP1                 ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

LBCB2:
    sta    ram_A9                ; 3
    ldy    ram_A9                ; 3
LBCB6:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_9B),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_9D),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_9F),Y            ; 5
    sta.w  GRP0                  ; 4
    lda    (ram_A1),Y            ; 5
    dec    ram_A9                ; 5
    sta    GRP1                  ; 3
    lda    (ram_A3),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_A5),Y            ; 5
    sta    GRP1                  ; 3
    nop                          ; 2
    sta    GRP0                  ; 3
    ldy    ram_A9                ; 3
    bpl    LBCB6                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    rts                          ; 6

RomanNumOne:
    .byte $7E ; | XXXXXX | $BCE3
    .byte $18 ; |   XX   | $BCE4
    .byte $18 ; |   XX   | $BCE5
    .byte $18 ; |   XX   | $BCE6
    .byte $18 ; |   XX   | $BCE7
    .byte $18 ; |   XX   | $BCE8
    .byte $18 ; |   XX   | $BCE9
    .byte $18 ; |   XX   | $BCEA
    .byte $18 ; |   XX   | $BCEB
    .byte $18 ; |   XX   | $BCEC
    .byte $18 ; |   XX   | $BCED
    .byte $7E ; | XXXXXX | $BCEE
RomanNumTwo:
    .byte $FE ; |XXXXXXX | $BCEF
    .byte $6C ; | XX XX  | $BCF0
    .byte $6C ; | XX XX  | $BCF1
    .byte $6C ; | XX XX  | $BCF2
    .byte $6C ; | XX XX  | $BCF3
    .byte $6C ; | XX XX  | $BCF4
    .byte $6C ; | XX XX  | $BCF5
    .byte $6C ; | XX XX  | $BCF6
    .byte $6C ; | XX XX  | $BCF7
    .byte $6C ; | XX XX  | $BCF8
    .byte $6C ; | XX XX  | $BCF9
    .byte $FE ; |XXXXXXX | $BCFA
RomanNumThree:
    .byte $FF ; |XXXXXXXX| $BCFB
    .byte $DB ; |XX XX XX| $BCFC
    .byte $DB ; |XX XX XX| $BCFD
    .byte $DB ; |XX XX XX| $BCFE
    .byte $DB ; |XX XX XX| $BCFF
    .byte $DB ; |XX XX XX| $BD00
    .byte $DB ; |XX XX XX| $BD01
    .byte $DB ; |XX XX XX| $BD02
    .byte $DB ; |XX XX XX| $BD03
    .byte $DB ; |XX XX XX| $BD04
    .byte $DB ; |XX XX XX| $BD05
    .byte $FF ; |XXXXXXXX| $BD06
RomanNumFour:
    .byte $FF ; |XXXXXXXX| $BD07
    .byte $C4 ; |XX   X  | $BD08
    .byte $CE ; |XX  XXX | $BD09
    .byte $DF ; |XX XXXXX| $BD0A
    .byte $DB ; |XX XX XX| $BD0B
    .byte $DB ; |XX XX XX| $BD0C
    .byte $DB ; |XX XX XX| $BD0D
    .byte $DB ; |XX XX XX| $BD0E
    .byte $DB ; |XX XX XX| $BD0F
    .byte $DB ; |XX XX XX| $BD10
    .byte $DB ; |XX XX XX| $BD11
    .byte $FF ; |XXXXXXXX| $BD12
RomanNumFive:
    .byte $FE ; |XXXXXXX | $BD13
    .byte $10 ; |   X    | $BD14
    .byte $38 ; |  XXX   | $BD15
    .byte $7C ; | XXXXX  | $BD16
    .byte $6C ; | XX XX  | $BD17
    .byte $6C ; | XX XX  | $BD18
    .byte $6C ; | XX XX  | $BD19
    .byte $6C ; | XX XX  | $BD1A
    .byte $6C ; | XX XX  | $BD1B
    .byte $6C ; | XX XX  | $BD1C
    .byte $6C ; | XX XX  | $BD1D
    .byte $FE ; |XXXXXXX | $BD1E
RomanNumSix:
    .byte $FF ; |XXXXXXXX| $BD1F
    .byte $23 ; |  X   XX| $BD20
    .byte $73 ; | XXX  XX| $BD21
    .byte $FB ; |XXXXX XX| $BD22
    .byte $DB ; |XX XX XX| $BD23
    .byte $DB ; |XX XX XX| $BD24
    .byte $DB ; |XX XX XX| $BD25
    .byte $DB ; |XX XX XX| $BD26
    .byte $DB ; |XX XX XX| $BD27
    .byte $DB ; |XX XX XX| $BD28
    .byte $DB ; |XX XX XX| $BD29
    .byte $FF ; |XXXXXXXX| $BD2A
BigZero:
    .byte $FF ; |XXXXXXXX| $BD2B
    .byte $C3 ; |XX    XX| $BD2C
    .byte $C3 ; |XX    XX| $BD2D
    .byte $DB ; |XX XX XX| $BD2E
    .byte $DB ; |XX XX XX| $BD2F
    .byte $DB ; |XX XX XX| $BD30
    .byte $DB ; |XX XX XX| $BD31
    .byte $DB ; |XX XX XX| $BD32
    .byte $DB ; |XX XX XX| $BD33
    .byte $C3 ; |XX    XX| $BD34
    .byte $C3 ; |XX    XX| $BD35
    .byte $FF ; |XXXXXXXX| $BD36
Zero:
    .byte $3C ; |  XXXX  | $BD37
    .byte $66 ; | XX  XX | $BD38
    .byte $66 ; | XX  XX | $BD39
    .byte $66 ; | XX  XX | $BD3A
    .byte $66 ; | XX  XX | $BD3B
    .byte $66 ; | XX  XX | $BD3C
    .byte $3C ; |  XXXX  | $BD3D
    .byte $00 ; |        | $BD3E
    .byte $00 ; |        | $BD3F
    .byte $00 ; |        | $BD40
    .byte $00 ; |        | $BD41
    .byte $00 ; |        | $BD42
    .byte $00 ; |        | $BD43
One:
    .byte $7E ; | XXXXXX | $BD44
    .byte $18 ; |   XX   | $BD45
    .byte $18 ; |   XX   | $BD46
    .byte $18 ; |   XX   | $BD47
    .byte $18 ; |   XX   | $BD48
    .byte $78 ; | XXXX   | $BD49
    .byte $38 ; |  XXX   | $BD4A
    .byte $00 ; |        | $BD4B
    .byte $00 ; |        | $BD4C
    .byte $00 ; |        | $BD4D
    .byte $00 ; |        | $BD4E
    .byte $00 ; |        | $BD4F
    .byte $00 ; |        | $BD50
Two:
    .byte $7E ; | XXXXXX | $BD51
    .byte $60 ; | XX     | $BD52
    .byte $60 ; | XX     | $BD53
    .byte $3C ; |  XXXX  | $BD54
    .byte $06 ; |     XX | $BD55
    .byte $46 ; | X   XX | $BD56
    .byte $7C ; | XXXXX  | $BD57
    .byte $00 ; |        | $BD58
    .byte $00 ; |        | $BD59
    .byte $00 ; |        | $BD5A
    .byte $00 ; |        | $BD5B
    .byte $00 ; |        | $BD5C
    .byte $00 ; |        | $BD5D
Three:
    .byte $3C ; |  XXXX  | $BD5E
    .byte $46 ; | X   XX | $BD5F
    .byte $06 ; |     XX | $BD60
    .byte $0C ; |    XX  | $BD61
    .byte $06 ; |     XX | $BD62
    .byte $46 ; | X   XX | $BD63
    .byte $3C ; |  XXXX  | $BD64
    .byte $00 ; |        | $BD65
    .byte $00 ; |        | $BD66
    .byte $00 ; |        | $BD67
    .byte $00 ; |        | $BD68
    .byte $00 ; |        | $BD69
    .byte $00 ; |        | $BD6A
Four:
    .byte $0C ; |    XX  | $BD6B
    .byte $0C ; |    XX  | $BD6C
    .byte $7E ; | XXXXXX | $BD6D
    .byte $4C ; | X  XX  | $BD6E
    .byte $2C ; |  X XX  | $BD6F
    .byte $1C ; |   XXX  | $BD70
    .byte $0C ; |    XX  | $BD71
    .byte $00 ; |        | $BD72
    .byte $00 ; |        | $BD73
    .byte $00 ; |        | $BD74
    .byte $00 ; |        | $BD75
    .byte $00 ; |        | $BD76
    .byte $00 ; |        | $BD77
Five:
    .byte $7C ; | XXXXX  | $BD78
    .byte $46 ; | X   XX | $BD79
    .byte $06 ; |     XX | $BD7A
    .byte $7C ; | XXXXX  | $BD7B
    .byte $60 ; | XX     | $BD7C
    .byte $60 ; | XX     | $BD7D
    .byte $7E ; | XXXXXX | $BD7E
    .byte $00 ; |        | $BD7F
    .byte $00 ; |        | $BD80
    .byte $00 ; |        | $BD81
    .byte $00 ; |        | $BD82
    .byte $00 ; |        | $BD83
    .byte $00 ; |        | $BD84
Six:
    .byte $3C ; |  XXXX  | $BD85
    .byte $66 ; | XX  XX | $BD86
    .byte $66 ; | XX  XX | $BD87
    .byte $7C ; | XXXXX  | $BD88
    .byte $60 ; | XX     | $BD89
    .byte $62 ; | XX   X | $BD8A
    .byte $3C ; |  XXXX  | $BD8B
    .byte $00 ; |        | $BD8C
    .byte $00 ; |        | $BD8D
    .byte $00 ; |        | $BD8E
    .byte $00 ; |        | $BD8F
    .byte $00 ; |        | $BD90
    .byte $00 ; |        | $BD91
Seven:
    .byte $18 ; |   XX   | $BD92
    .byte $18 ; |   XX   | $BD93
    .byte $08 ; |    X   | $BD94
    .byte $04 ; |     X  | $BD95
    .byte $02 ; |      X | $BD96
    .byte $62 ; | XX   X | $BD97
    .byte $7E ; | XXXXXX | $BD98
    .byte $00 ; |        | $BD99
    .byte $00 ; |        | $BD9A
    .byte $00 ; |        | $BD9B
    .byte $00 ; |        | $BD9C
    .byte $00 ; |        | $BD9D
    .byte $00 ; |        | $BD9E
Eight:
    .byte $3C ; |  XXXX  | $BD9F
    .byte $66 ; | XX  XX | $BDA0
    .byte $66 ; | XX  XX | $BDA1
    .byte $3C ; |  XXXX  | $BDA2
    .byte $66 ; | XX  XX | $BDA3
    .byte $66 ; | XX  XX | $BDA4
    .byte $3C ; |  XXXX  | $BDA5
    .byte $00 ; |        | $BDA6
    .byte $00 ; |        | $BDA7
    .byte $00 ; |        | $BDA8
    .byte $00 ; |        | $BDA9
    .byte $00 ; |        | $BDAA
    .byte $00 ; |        | $BDAB
Nine:
    .byte $3C ; |  XXXX  | $BDAC
    .byte $46 ; | X   XX | $BDAD
    .byte $06 ; |     XX | $BDAE
    .byte $3E ; |  XXXXX | $BDAF
    .byte $66 ; | XX  XX | $BDB0
    .byte $66 ; | XX  XX | $BDB1
    .byte $3C ; |  XXXX  | $BDB2
    .byte $00 ; |        | $BDB3
    .byte $00 ; |        | $BDB4
    .byte $00 ; |        | $BDB5
    .byte $00 ; |        | $BDB6
    .byte $00 ; |        | $BDB7
    .byte $00 ; |        | $BDB8
BlankDigit:
    .byte $00 ; |        | $BDB9
    .byte $00 ; |        | $BDBA
    .byte $00 ; |        | $BDBB
    .byte $00 ; |        | $BDBC
    .byte $00 ; |        | $BDBD
    .byte $00 ; |        | $BDBE
    .byte $00 ; |        | $BDBF
    .byte $00 ; |        | $BDC0
    .byte $00 ; |        | $BDC1
    .byte $00 ; |        | $BDC2
    .byte $00 ; |        | $BDC3
    .byte $00 ; |        | $BDC4

LBDC5:
    .word Zero           ; $BDC5
    .word One            ; $BDC7
    .word Two            ; $BDC9
    .word Three          ; $BDCB
    .word Four           ; $BDCD
    .word Five           ; $BDCF
    .word Six            ; $BDD1
    .word Seven          ; $BDD3
    .word Eight          ; $BDD5
    .word Nine           ; $BDD7
    .word RomanNumOne    ; $BDD9
    .word RomanNumTwo    ; $BDDB
    .word RomanNumThree  ; $BDDD
    .word RomanNumFour   ; $BDDF
    .word RomanNumFive   ; $BDE1
    .word RomanNumSix    ; $BDE3
LBDE5:
    .word BlankDigit     ; $BDE5
    .word CloakOne       ; $BDE7
    .word CloakTwo       ; $BDE9
    .word Crown          ; $BDEB
    .word Chalice        ; $BDED
    .word Scepter        ; $BDEF
    .word RoyalSeal      ; $BDF1
    .word Throne         ; $BDF3
    .word Medallion      ; $BDF5
    .word KingsRing      ; $BDF7
    .word MoneyPurse     ; $BDF9
    .word Key            ; $BDFB
    .word Lamp           ; $BDFD
    .word Shield         ; $BDFF
    .word ShoesOfStealth ; $BE01
    .word Amulet         ; $BE03
    .word PeasantsRing   ; $BE05
    .word WarriorsSword  ; $BE07
    .word Tallisman      ; $BE09
    .word RomanNumOne    ; $BE0B
    .word RomanNumTwo    ; $BE0D
    .word RomanNumThree  ; $BE0F
    .word RomanNumFour   ; $BE11
    .word RomanNumFive   ; $BE13
    .word RomanNumSix    ; $BE15
    .word BigZero        ; $BE17

Crown:
    .byte $00 ; |        | $BE19
    .byte $00 ; |        | $BE1A
    .byte $FE ; |XXXXXXX | $BE1B
    .byte $00 ; |        | $BE1C
    .byte $FE ; |XXXXXXX | $BE1D
    .byte $FE ; |XXXXXXX | $BE1E
    .byte $54 ; | X X X  | $BE1F
    .byte $AA ; |X X X X | $BE20
    .byte $AA ; |X X X X | $BE21
    .byte $AA ; |X X X X | $BE22
    .byte $00 ; |        | $BE23
    .byte $00 ; |        | $BE24
Scepter:
    .byte $08 ; |    X   | $BE25
    .byte $08 ; |    X   | $BE26
    .byte $08 ; |    X   | $BE27
    .byte $08 ; |    X   | $BE28
    .byte $08 ; |    X   | $BE29
    .byte $08 ; |    X   | $BE2A
    .byte $08 ; |    X   | $BE2B
    .byte $1C ; |   XXX  | $BE2C
    .byte $08 ; |    X   | $BE2D
    .byte $14 ; |   X X  | $BE2E
    .byte $1C ; |   XXX  | $BE2F
    .byte $08 ; |    X   | $BE30
RoyalSeal:
    .byte $00 ; |        | $BE31
    .byte $38 ; |  XXX   | $BE32
    .byte $6C ; | XX XX  | $BE33
    .byte $EE ; |XXX XXX | $BE34
    .byte $AA ; |X X X X | $BE35
    .byte $C6 ; |XX   XX | $BE36
    .byte $82 ; |X     X | $BE37
    .byte $C6 ; |XX   XX | $BE38
    .byte $AA ; |X X X X | $BE39
    .byte $EE ; |XXX XXX | $BE3A
    .byte $6C ; | XX XX  | $BE3B
    .byte $38 ; |  XXX   | $BE3C
Throne:
    .byte $84 ; |X    X  | $BE3D
    .byte $84 ; |X    X  | $BE3E
    .byte $FC ; |XXXXXX  | $BE3F
    .byte $FC ; |XXXXXX  | $BE40
    .byte $C4 ; |XX   X  | $BE41
    .byte $FE ; |XXXXXXX | $BE42
    .byte $C0 ; |XX      | $BE43
    .byte $C0 ; |XX      | $BE44
    .byte $C0 ; |XX      | $BE45
    .byte $C0 ; |XX      | $BE46
    .byte $C0 ; |XX      | $BE47
    .byte $C0 ; |XX      | $BE48
Medallion:
    .byte $10 ; |   X    | $BE49
    .byte $38 ; |  XXX   | $BE4A
    .byte $6C ; | XX XX  | $BE4B
    .byte $6C ; | XX XX  | $BE4C
    .byte $44 ; | X   X  | $BE4D
    .byte $6C ; | XX XX  | $BE4E
    .byte $38 ; |  XXX   | $BE4F
    .byte $54 ; | X X X  | $BE50
    .byte $82 ; |X     X | $BE51
    .byte $82 ; |X     X | $BE52
    .byte $82 ; |X     X | $BE53
    .byte $82 ; |X     X | $BE54
KingsRing:
    .byte $30 ; |  XX    | $BE55
    .byte $48 ; | X  X   | $BE56
    .byte $84 ; |X    X  | $BE57
    .byte $84 ; |X    X  | $BE58
    .byte $84 ; |X    X  | $BE59
    .byte $84 ; |X    X  | $BE5A
    .byte $84 ; |X    X  | $BE5B
    .byte $48 ; | X  X   | $BE5C
    .byte $30 ; |  XX    | $BE5D
    .byte $78 ; | XXXX   | $BE5E
    .byte $30 ; |  XX    | $BE5F
    .byte $00 ; |        | $BE60
MoneyPurse:
    .byte $00 ; |        | $BE61
    .byte $28 ; |  X X   | $BE62
    .byte $54 ; | X X X  | $BE63
    .byte $AA ; |X X X X | $BE64
    .byte $54 ; | X X X  | $BE65
    .byte $AA ; |X X X X | $BE66
    .byte $54 ; | X X X  | $BE67
    .byte $AA ; |X X X X | $BE68
    .byte $54 ; | X X X  | $BE69
    .byte $38 ; |  XXX   | $BE6A
    .byte $38 ; |  XXX   | $BE6B
    .byte $54 ; | X X X  | $BE6C
Shield:
    .byte $38 ; |  XXX   | $BE6D
    .byte $7C ; | XXXXX  | $BE6E
    .byte $6C ; | XX XX  | $BE6F
    .byte $D6 ; |XX X XX | $BE70
    .byte $EE ; |XXX XXX | $BE71
    .byte $EE ; |XXX XXX | $BE72
    .byte $EE ; |XXX XXX | $BE73
    .byte $82 ; |X     X | $BE74
    .byte $FE ; |XXXXXXX | $BE75
    .byte $7C ; | XXXXX  | $BE76
    .byte $38 ; |  XXX   | $BE77
    .byte $10 ; |   X    | $BE78
Lamp:
    .byte $70 ; | XXX    | $BE79  a candle is also called a lamp in olde days.
    .byte $FC ; |XXXXXX  | $BE7A
    .byte $5A ; | X XX X | $BE7B
    .byte $2A ; |  X X X | $BE7C
    .byte $2A ; |  X X X | $BE7D
    .byte $24 ; |  X  X  | $BE7E
    .byte $20 ; |  X     | $BE7F
    .byte $20 ; |  X     | $BE80
    .byte $20 ; |  X     | $BE81
    .byte $20 ; |  X     | $BE82
    .byte $00 ; |        | $BE83
    .byte $20 ; |  X     | $BE84
    .byte $20 ; |  X     | $BE85
Key:
    .byte $00 ; |        | $BE86
    .byte $00 ; |        | $BE87
    .byte $00 ; |        | $BE88
    .byte $40 ; | X      | $BE89
    .byte $A0 ; |X X     | $BE8A
    .byte $FF ; |XXXXXXXX| $BE8B
    .byte $A2 ; |X X   X | $BE8C
    .byte $45 ; | X   X X| $BE8D
    .byte $00 ; |        | $BE8E
    .byte $00 ; |        | $BE8F
    .byte $00 ; |        | $BE90
    .byte $00 ; |        | $BE91
Chalice:
    .byte $7E ; | XXXXXX | $BE92
    .byte $18 ; |   XX   | $BE93
    .byte $18 ; |   XX   | $BE94
    .byte $18 ; |   XX   | $BE95
    .byte $18 ; |   XX   | $BE96
    .byte $3C ; |  XXXX  | $BE97
    .byte $6A ; | XX X X | $BE98
    .byte $D5 ; |XX X X X| $BE99
    .byte $AB ; |X X X XX| $BE9A
    .byte $56 ; | X X XX | $BE9B
    .byte $7E ; | XXXXXX | $BE9C
    .byte $5A ; | X XX X | $BE9D
ShoesOfStealth:
    .byte $1D ; |   XXX X| $BE9E
    .byte $1F ; |   XXXXX| $BE9F
    .byte $0F ; |    XXXX| $BEA0
    .byte $07 ; |     XXX| $BEA1
    .byte $05 ; |     X X| $BEA2
    .byte $02 ; |      X | $BEA3
    .byte $E8 ; |XXX X   | $BEA4
    .byte $F8 ; |XXXXX   | $BEA5
    .byte $78 ; | XXXX   | $BEA6
    .byte $38 ; |  XXX   | $BEA7
    .byte $28 ; |  X X   | $BEA8
    .byte $10 ; |   X    | $BEA9
Amulet:
    .byte $00 ; |        | $BEAA
    .byte $20 ; |  X     | $BEAB
    .byte $70 ; | XXX    | $BEAC
    .byte $20 ; |  X     | $BEAD
    .byte $D8 ; |XX XX   | $BEAE
    .byte $A8 ; |X X X   | $BEAF
    .byte $A8 ; |X X X   | $BEB0
    .byte $D8 ; |XX XX   | $BEB1
    .byte $20 ; |  X     | $BEB2
    .byte $70 ; | XXX    | $BEB3
    .byte $20 ; |  X     | $BEB4
    .byte $00 ; |        | $BEB5
PeasantsRing:
    .byte $00 ; |        | $BEB6
    .byte $00 ; |        | $BEB7
    .byte $00 ; |        | $BEB8
    .byte $00 ; |        | $BEB9
    .byte $20 ; |  X     | $BEBA
    .byte $50 ; | X X    | $BEBB
    .byte $50 ; | X X    | $BEBC
    .byte $20 ; |  X     | $BEBD
    .byte $00 ; |        | $BEBE
    .byte $00 ; |        | $BEBF
    .byte $00 ; |        | $BEC0
    .byte $00 ; |        | $BEC1
WarriorsSword:
    .byte $10 ; |   X    | $BEC2
    .byte $10 ; |   X    | $BEC3
    .byte $7C ; | XXXXX  | $BEC4
    .byte $38 ; |  XXX   | $BEC5
    .byte $10 ; |   X    | $BEC6
    .byte $10 ; |   X    | $BEC7
    .byte $10 ; |   X    | $BEC8
    .byte $10 ; |   X    | $BEC9
    .byte $10 ; |   X    | $BECA
    .byte $10 ; |   X    | $BECB
    .byte $10 ; |   X    | $BECC
    .byte $10 ; |   X    | $BECD
Tallisman:
    .byte $D8 ; |XX XX   | $BECE
    .byte $70 ; | XXX    | $BECF
    .byte $70 ; | XXX    | $BED0
    .byte $F0 ; |XXXX    | $BED1
    .byte $F0 ; |XXXX    | $BED2
    .byte $F8 ; |XXXXX   | $BED3
    .byte $FC ; |XXXXXX  | $BED4
    .byte $74 ; | XXX X  | $BED5
    .byte $74 ; | XXX X  | $BED6
    .byte $54 ; | X X X  | $BED7
    .byte $70 ; | XXX    | $BED8
    .byte $20 ; |  X     | $BED9

CloakOne:
    .byte $FF ; |XXXXXXXX| $BEDA   flashing effects
    .byte $FF ; |XXXXXXXX| $BEDB
    .byte $FF ; |XXXXXXXX| $BEDC
    .byte $FF ; |XXXXXXXX| $BEDD
    .byte $FF ; |XXXXXXXX| $BEDE
    .byte $FF ; |XXXXXXXX| $BEDF
    .byte $FF ; |XXXXXXXX| $BEE0
    .byte $FF ; |XXXXXXXX| $BEE1
    .byte $FF ; |XXXXXXXX| $BEE2
    .byte $FF ; |XXXXXXXX| $BEE3
    .byte $FF ; |XXXXXXXX| $BEE4
    .byte $FF ; |XXXXXXXX| $BEE5
CloakTwo:
    .byte $18 ; |   XX   | $BEE6
    .byte $3C ; |  XXXX  | $BEE7
    .byte $7E ; | XXXXXX | $BEE8
    .byte $FF ; |XXXXXXXX| $BEE9
    .byte $FF ; |XXXXXXXX| $BEEA
    .byte $7E ; | XXXXXX | $BEEB
    .byte $7E ; | XXXXXX | $BEEC
    .byte $3C ; |  XXXX  | $BEED
    .byte $18 ; |   XX   | $BEEE
    .byte $00 ; |        | $BEEF
    .byte $18 ; |   XX   | $BEF0
    .byte $3C ; |  XXXX  | $BEF1

    nop                          ; 2   free bytes
    nop                          ; 2
    nop                          ; 2

CopyrightOne:
    .byte $79 ; | XXXX  X| $BEF5
    .byte $85 ; |X    X X| $BEF6
    .byte $B5 ; |X XX X X| $BEF7
    .byte $A5 ; |X X  X X| $BEF8
    .byte $B5 ; |X XX X X| $BEF9
    .byte $85 ; |X    X X| $BEFA
    .byte $79 ; | XXXX  X| $BEFB
CopyrightTwo:
    .byte $17 ; |   X XXX| $BEFC
    .byte $15 ; |   X X X| $BEFD
    .byte $15 ; |   X X X| $BEFE
    .byte $77 ; | XXX XXX| $BEFF
    .byte $55 ; | X X X X| $BF00
    .byte $55 ; | X X X X| $BF01
    .byte $77 ; | XXX XXX| $BF02
CopyrightThree:
    .byte $71 ; | XXX   X| $BF03
    .byte $51 ; | X X   X| $BF04
    .byte $11 ; |   X   X| $BF05
    .byte $31 ; |  XX   X| $BF06
    .byte $11 ; |   X   X| $BF07
    .byte $51 ; | X X   X| $BF08
    .byte $70 ; | XXX    | $BF09
CopyrightFour:
    .byte $49 ; | X  X  X| $BF0A
    .byte $49 ; | X  X  X| $BF0B
    .byte $49 ; | X  X  X| $BF0C
    .byte $C9 ; |XX  X  X| $BF0D
    .byte $49 ; | X  X  X| $BF0E
    .byte $49 ; | X  X  X| $BF0F
    .byte $BE ; |X XXXXX | $BF10
CopyrightFive:
    .byte $55 ; | X X X X| $BF11
    .byte $55 ; | X X X X| $BF12
    .byte $55 ; | X X X X| $BF13
    .byte $D9 ; |XX XX  X| $BF14
    .byte $55 ; | X X X X| $BF15
    .byte $55 ; | X X X X| $BF16
    .byte $99 ; |X  XX  X| $BF17
LBF18:
    .word CopyrightOne   ; $BF18
    .word CopyrightTwo   ; $BF1A
    .word CopyrightThree ; $BF1C
    .word CopyrightFour  ; $BF1E
    .word CopyrightFive  ; $BF20
    .word BlankDigit     ; $BF22

     ORG $1F24,0
    RORG $BF24

  IF PAL | PAL_M

CorrectCol2:
    LDA    INTIM
    BNE    CorrectCol2
    LDA    #TIME_OVERSCAN
    STA    TIM64T
    STA    WSYNC
    STA    WSYNC
    STA    WSYNC
;---------------------------------------
    LDA    $FF
    STA    COLUP1
    STA    COLUP0
    LDA    $FE
    STA    COLUBK
    STA    WSYNC
    JMP    CorrectCol4

   ENDIF


;    .byte $00 ; |        | $BF24
;    .byte $00 ; |        | $BF25
;    .byte $00 ; |        | $BF26
;    .byte $00 ; |        | $BF27
;    .byte $00 ; |        | $BF28
;    .byte $00 ; |        | $BF29
;    .byte $00 ; |        | $BF2A
;    .byte $00 ; |        | $BF2B
;    .byte $00 ; |        | $BF2C
;    .byte $00 ; |        | $BF2D
;    .byte $00 ; |        | $BF2E
;    .byte $00 ; |        | $BF2F
;    .byte $00 ; |        | $BF30
;    .byte $00 ; |        | $BF31
;    .byte $00 ; |        | $BF32
;    .byte $00 ; |        | $BF33
;    .byte $00 ; |        | $BF34
;    .byte $00 ; |        | $BF35
;    .byte $00 ; |        | $BF36
;    .byte $00 ; |        | $BF37
;    .byte $00 ; |        | $BF38
;    .byte $00 ; |        | $BF39
;    .byte $00 ; |        | $BF3A
;    .byte $00 ; |        | $BF3B
;    .byte $00 ; |        | $BF3C
;    .byte $00 ; |        | $BF3D
;    .byte $00 ; |        | $BF3E
;    .byte $00 ; |        | $BF3F
;    .byte $00 ; |        | $BF40
;    .byte $00 ; |        | $BF41
;    .byte $00 ; |        | $BF42
    .byte $00 ; |        | $BF43
    .byte $00 ; |        | $BF44
    .byte $00 ; |        | $BF45
    .byte $00 ; |        | $BF46
    .byte $00 ; |        | $BF47
    .byte $00 ; |        | $BF48
    .byte $00 ; |        | $BF49
    .byte $00 ; |        | $BF4A
    .byte $00 ; |        | $BF4B
    .byte $00 ; |        | $BF4C
    .byte $00 ; |        | $BF4D
    .byte $00 ; |        | $BF4E
    .byte $00 ; |        | $BF4F
    .byte $00 ; |        | $BF50
    .byte $00 ; |        | $BF51
    .byte $00 ; |        | $BF52
    .byte $00 ; |        | $BF53
    .byte $00 ; |        | $BF54
    .byte $00 ; |        | $BF55
    .byte $00 ; |        | $BF56
    .byte $00 ; |        | $BF57
    .byte $00 ; |        | $BF58
    .byte $00 ; |        | $BF59
    .byte $00 ; |        | $BF5A
    .byte $00 ; |        | $BF5B
    .byte $00 ; |        | $BF5C
    .byte $00 ; |        | $BF5D
    .byte $00 ; |        | $BF5E
    .byte $00 ; |        | $BF5F
    .byte $00 ; |        | $BF60
    .byte $00 ; |        | $BF61
    .byte $00 ; |        | $BF62
    .byte $00 ; |        | $BF63
    .byte $00 ; |        | $BF64
    .byte $00 ; |        | $BF65
    .byte $00 ; |        | $BF66
    .byte $00 ; |        | $BF67
    .byte $00 ; |        | $BF68
    .byte $00 ; |        | $BF69
    .byte $00 ; |        | $BF6A
    .byte $00 ; |        | $BF6B
    .byte $00 ; |        | $BF6C
    .byte $00 ; |        | $BF6D
    .byte $00 ; |        | $BF6E
    .byte $00 ; |        | $BF6F
    .byte $00 ; |        | $BF70
    .byte $00 ; |        | $BF71
    .byte $00 ; |        | $BF72
    .byte $00 ; |        | $BF73
    .byte $00 ; |        | $BF74
    .byte $00 ; |        | $BF75
    .byte $00 ; |        | $BF76
    .byte $00 ; |        | $BF77
    .byte $00 ; |        | $BF78
    .byte $00 ; |        | $BF79
    .byte $00 ; |        | $BF7A
    .byte $00 ; |        | $BF7B
    .byte $00 ; |        | $BF7C
    .byte $00 ; |        | $BF7D
    .byte $00 ; |        | $BF7E
    .byte $00 ; |        | $BF7F
    .byte $00 ; |        | $BF80
    .byte $00 ; |        | $BF81
    .byte $00 ; |        | $BF82
    .byte $00 ; |        | $BF83
    .byte $00 ; |        | $BF84
    .byte $00 ; |        | $BF85
    .byte $00 ; |        | $BF86
    .byte $00 ; |        | $BF87
    .byte $00 ; |        | $BF88
    .byte $00 ; |        | $BF89
    .byte $00 ; |        | $BF8A
    .byte $00 ; |        | $BF8B
    .byte $00 ; |        | $BF8C
    .byte $00 ; |        | $BF8D
    .byte $00 ; |        | $BF8E
    .byte $00 ; |        | $BF8F
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
    .byte $00 ; |        | $BFD2
    .byte $00 ; |        | $BFD3
    .byte $00 ; |        | $BFD4
    .byte $00 ; |        | $BFD5
    .byte $00 ; |        | $BFD6
    .byte $00 ; |        | $BFD7
    .byte $00 ; |        | $BFD8
    .byte $00 ; |        | $BFD9
    .byte $00 ; |        | $BFDA
    .byte $00 ; |        | $BFDB
    .byte $00 ; |        | $BFDC
    .byte $00 ; |        | $BFDD
    .byte $00 ; |        | $BFDE
    .byte $00 ; |        | $BFDF
    .byte $00 ; |        | $BFE0
    .byte $00 ; |        | $BFE1
    .byte $00 ; |        | $BFE2
    .byte $00 ; |        | $BFE3
    .byte $00 ; |        | $BFE4
    .byte $00 ; |        | $BFE5
    .byte $00 ; |        | $BFE6
    .byte $00 ; |        | $BFE7
    .byte $00 ; |        | $BFE8
    .byte $00 ; |        | $BFE9
    .byte $00 ; |        | $BFEA
    .byte $00 ; |        | $BFEB
    .byte $00 ; |        | $BFEC
    .byte $00 ; |        | $BFED
    .byte $00 ; |        | $BFEE
    .byte $00 ; |        | $BFEF
    .byte $00 ; |        | $BFF0
    .byte $00 ; |        | $BFF1
    .byte $00 ; |        | $BFF2
    .byte $00 ; |        | $BFF3
    .byte $00 ; |        | $BFF4
    .byte $00 ; |        | $BFF5
    .byte $00 ; |        | $BFF6
    .byte $00 ; |        | $BFF7

       ORG $1FF8
      RORG $BFF8

    .byte $00 ; |        | $BFF8
    .byte $00 ; |        | $BFF9
    .byte $00 ; |        | $BFFA
    .byte $00 ; |        | $BFFB

    .word START_1
    .word START_1