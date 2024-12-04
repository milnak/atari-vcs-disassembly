; Rough disassembly of Telepathy
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: distella -pasfcTele1.cfg tele.1 > Tele(re1).asm
;
; Tele1.cfg contents:
;
;      ORG 1000
;      CODE 1000 105A
;      GFX 105B 106A
;      CODE 106B 1260
;      GFX 1261 12C1
;      CODE 12C2 139C
;      GFX 139D 13C0
;      CODE 13C1 176A
;      GFX 176B 1FF4
;      CODE 1FF5 1FF7
;      GFX 1FF8 1FFF
;
; Command Line: distella -pasfcTele2.cfg tele.2 > Tele(re2).asm
;
; Tele2.cfg contents:
;
;      ORG 3000
;      CODE 3000 3400
;      GFX 3401 3409
;      CODE 340A 349C
;      GFX 349D 34AC
;      CODE 34AD 3CE8
;      GFX 3CE9 3FF1
;      CODE 3FF2 3FF4
;      GFX 3FF5 3FFF

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
RESBL   =  $14
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
HMP0    =  $20
HMP1    =  $21
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
INPT4   =  $3C

; Read TIA Baseline = $00
CXM0P   =  $00
CXP0FB  =  $02
CXPPMM  =  $07

SWCHA   =  $0280
SWACNT  =  $0281
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      USER CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BANK_0  = $FFF8
BANK_1  = $FFF9

TIME_VBLANK    = $26
TIME_OVERSCAN  = $27

WHITE   = $0F

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

frameCounter   = $D8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $1000

L1000:
    lda    BANK_1                   ; bankswitch, goto L3483

;coming from bank 1
    jmp    L1022                 ; 3

START:
    sei
    cld
    lda    #0
    tax
.loopClear:
    pha
    txs
    stx    $E9                   ; 3
    inx                          ; 2
    bne    .loopClear
    ldx    #$0B                  ; 2
    lda    #$1C                  ; 2
L1016:
    sta    $CC,X                 ; 4
    dex                          ; 2
    bpl    L1016                 ; 2³
    stx    $F4                      ; X=$FF
    stx    $86
    jmp    L1483                 ; 3

L1022:
    ldx    #$FF
    txs                             ; reset stack
    ldx    #0                       ; save a byte with INX
    stx    NUSIZ0
    stx    NUSIZ1
    inx                             ; X=1
    stx    CTRLPF                   ; reflect
    lda    #WHITE
    sta    COLUP0                ; 3
    sta    WSYNC
;---------------------------------------
    lda    $DB                   ; 3
    jsr    L16B4                 ; 6
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
L103D:
    dey                          ; 2
    bpl    L103D                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE
    sta    WSYNC
;---------------------------------------
    sta    HMCLR                 ; 3
    ldx    $86                   ; 3
    lda    IndirectLoTab,X
    sta    $FE                   ; 3
    lda    IndirectHiTab,X
    sta    $FF                   ; 3
    lda    #$AA                     ; this value never gets used...
    jmp.ind ($00FE)              ; 5

IndirectLoTab:
    .byte <L10C4         ; $105B
    .byte <L11B1         ; $105C
    .byte <L12C2         ; $105D
    .byte <L13C1         ; $105E
    .byte <L106B         ; $105F
    .byte <L15E4         ; $1060
    .byte <L1553         ; $1061
    .byte <L1553         ; $1062
IndirectHiTab:
    .byte >L10C4         ; $1063
    .byte >L11B1         ; $1064
    .byte >L12C2         ; $1065
    .byte >L13C1         ; $1066
    .byte >L106B         ; $1067
    .byte >L15E4         ; $1068
    .byte >L1553         ; $1069
    .byte >L1553         ; $106A

L106B:  ;indirect jump
    lda    #$10                  ; 2
    sta    COLUPF                ; 3
    ldx    $CA                   ; 3
L1071:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$20                  ;2  @2
    txa                          ;2  @4
    lsr                          ;2  @6
    bcc    L107B                 ;2³ @8/9
    ldy    #0                    ;2  @10
L107B:
    sty    PF2                   ;3  @12/13
    dex                          ;2  @14/15
    bne    L1071                 ;2³ @16..18
    lda    #$14                  ;2  @18/19
    sta    COLUP0                ;3  @21/22
    sta    COLUP1                ;3  @24/26
    lda    #$B0                  ;2  @26/27
;---------------------------------------
    jsr    L1547                 ;93 @43/44
    jsr    L170C                 ; 6
    ldx    #$10                  ; 2
    jsr    L168D                 ; 6
    ldx    #$0A                  ; 2
    lda    #$50                  ; 2
L1097:
    sta    $CC,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    L1097                 ; 2³
    lda    $9F                   ; 3
    and    #$F0                  ; 2
    beq    L10A6                 ; 2³
    lsr                          ; 2
    sta    $D0                   ; 3
L10A6:
    lda    $9F                   ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $D2                   ; 3
    lda    $C7                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    jsr    L172B                 ; 6
    lda    #$85                  ; 2
    sec                          ; 2
    sbc    $CA                   ; 3
    tax                          ; 2
    jsr    L168D                 ; 6
    jmp    L1483                 ; 3

L10C4:  ;indirect jump
    ldx    #$31                  ; 2
    lda    #$88                  ; 2
L10C8:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUBK                ; 3
    dex                          ; 2
    bpl    L10C8                 ; 2³
    ldx    #$0E                  ; 2   15 scanlines
L10D3:
    lda    ColHillSkyTab,X       ; 4
    ldy    hillShapeLeftPF1,X    ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    COLUBK                ;3  @6    color the sky above the hills
    sty    PF1                   ;3  @9
    lda    ColHillsTab,X         ;4  @13
    sta    COLUPF                ;3  @16   then color the hills themselves
    lda    hillShapeLeftPF2,X    ;4  @20
    sta    PF2                   ;3  @23
    lda    L1EAF,X               ;4  @27
    ldy    L1EBE,X               ;4  @31
    pha                          ;3  @34   delay 11 cycles
    pla                          ;4  @38
    nop                          ;2  @40
    nop                          ;2  @42
    sty    PF1                   ;3  @45
    sta    PF2                   ;3  @48
    dex                          ;2  @50
    bpl    L10D3                 ;2³ @52/53
    sta    WSYNC                 ;3  @55/56
;---------------------------------------
    sta    HMOVE                 ; 3
    inx                          ; 2
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    ldx    #$78                  ; 2
    ldy    $CA                   ; 3
L1109:
    lda    L1B15,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    COLUBK                ;3  @6
    dex                          ;2  @8
    dey                          ;2  @10
    bpl    L1109                 ;2³ @12/13
    lda    #9                    ;2  @14
    sta    $F8                   ;3  @17
    sta    WSYNC                 ;3  @20
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    L1B15,X               ;4  @7
    sta    COLUBK                ;3  @10
    dex                          ;2  @12
    lda    #0                    ;2  @14
L1126:
    pha                          ; 3
    ldy    $F8                   ; 3
    lda.wy $87,Y                 ; 4
    jsr    L16A6                 ; 6
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    L1B15,X               ;4  @7
    sta    COLUBK                ;3  @10
    pla                          ;4  @14
    sta    GRP0                  ;3  @17
    dex                          ;2  @19
L113E:
    dey                          ; 2
    bpl    L113E                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    L1B15,X               ;4  @7
    sta    COLUBK                ;3  @10
    dex                          ;2  @12
    ldy    #0                    ;2  @14
    lda    ($C3),Y               ;5  @19
    sta    GRP0                  ;3  @22
    ldy    $F8                   ;3  @25
    lda.wy $92,Y                 ;4  @29
    sta    NUSIZ1                ;3  @32
    lda.wy $9D,Y                 ;4  @36
    sta    $C5                   ;3  @39
    lda.wy $A8,Y                 ;4  @43
    sta    $C3                   ;3  @46
    lda.wy $B3,Y                 ;4  @50
    sta    COLUP1                ;3  @53
    lda    #0                    ;2  @55
    sta    HMP1                  ;3  @58
    ldy    #9                    ;2  @60
L116F:
    lda    L1B15,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUBK                ; 3
    lda    ($C3),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($C5),Y               ; 5
    sta    GRP1                  ; 3
    dex                          ; 2
    lda    $F8                   ; 3
    bne    L118C                 ; 2³
    dey                          ; 2
    cpy    $CB                   ; 3
    bne    L116F                 ; 2³
    beq    L11A8                    ; always branch

L118C:
    dey                          ; 2
    cpy    #2                    ; 2
    bne    L116F                 ; 2³
    lda    ($C3),Y               ; 5
    ldy    L1B15,X               ; 4
    dex                          ; 2
    dec    $F8                   ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    COLUBK                ; 3
    sta    GRP0                  ; 3
    ldy    #1                    ; 2
    lda    ($C3),Y               ; 5
    jmp    L1126                 ; 3

L11A8:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    jmp    L1483                 ; 3

L11B1:  ;indirect jump
    jsr    L1693                 ; 6
    lda    #2                    ; 2
    sta    $F9                   ; 3
    lda    $DC                   ; 3
    sta    $F8                   ; 3
L11BC:
    lda    #0                    ; 2
    ldy    $F8                   ; 3
    cpy    #$13                  ; 2
    bcs    L11C6                 ; 2³
    lda    ($C3),Y               ; 5
L11C6:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    dey                          ; 2
    lda    #0                    ; 2
    cpy    #$13                  ; 2
    bcs    L11D3                 ; 2³
    lda    ($C3),Y               ; 5
L11D3:
    dey                          ; 2
    sty    $F8                   ; 3
    tay                          ; 2
    ldx    $F9                   ; 3
    lda    $93,X                 ; 4
    sta    REFP1                 ; 3
    lda    $8D,X                 ; 4
    sta    $C5                   ; 3
    lda    $87,X                 ; 4
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    GRP0                  ; 3
    tay                          ; 2
L11EC:
    dey                          ; 2
    bpl    L11EC                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    $F8                   ; 3
    cpy    #$13                  ; 2
    bcs    L11FF                 ; 2³
    lda    ($C3),Y               ; 5
    sta    GRP0                  ; 3
L11FF:
    dey                          ; 2
    ldx    #$12                  ; 2
L1202:
    lda    L1261,X               ; 4
    cpy    #$13                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUPF                ; 3
    bcs    L1211                 ; 2³
    lda    ($C3),Y               ; 5
    sta    GRP0                  ; 3
L1211:
    lda    L127F,X               ; 4
    sta    PF0                   ; 3
    sta    PF2                   ; 3
    lda    L12A0,X               ; 4
    sta    PF1                   ; 3
    dey                          ; 2
    dex                          ; 2
    bpl    L1202                 ; 2³
    sty    $F8                   ; 3
    lda    #$21                  ; 2
    sta    $FA                   ; 3
L1227:
    lda    #0                    ; 2
    ldy    $F8                   ; 3
    cpy    #$13                  ; 2
    bcs    L1231                 ; 2³
    lda    ($C3),Y               ; 5
L1231:
    tax                          ; 2
    ldy    $FA                   ; 3
    lda    ($C5),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    L1261,Y               ; 4
    sta    COLUPF                ; 3
    lda    L127F,Y               ; 4
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    lda    L12A0,Y               ; 4
    sta    PF2                   ; 3
    dec    $F8                   ; 5
    dec    $FA                   ; 5
    bpl    L1227                 ; 2³
    dec    $F9                   ; 5
    bmi    L125A                 ; 2³
    jmp    L11BC                 ; 3

L125A:
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    L1483                 ; 3

L1261:
    .byte $00 ; |        | $1261
    .byte $16 ; |   X XX | $1262
    .byte $14 ; |   X X  | $1263
    .byte $22 ; |  X   X | $1264
    .byte $02 ; |      X | $1265
    .byte $02 ; |      X | $1266
    .byte $02 ; |      X | $1267
    .byte $02 ; |      X | $1268
    .byte $02 ; |      X | $1269
    .byte $02 ; |      X | $126A
    .byte $02 ; |      X | $126B
    .byte $02 ; |      X | $126C
    .byte $02 ; |      X | $126D
    .byte $02 ; |      X | $126E
    .byte $02 ; |      X | $126F
    .byte $02 ; |      X | $1270
    .byte $02 ; |      X | $1271
    .byte $02 ; |      X | $1272
    .byte $02 ; |      X | $1273
    .byte $02 ; |      X | $1274
    .byte $02 ; |      X | $1275
    .byte $02 ; |      X | $1276
    .byte $02 ; |      X | $1277
    .byte $02 ; |      X | $1278
    .byte $02 ; |      X | $1279
    .byte $02 ; |      X | $127A
    .byte $02 ; |      X | $127B
    .byte $02 ; |      X | $127C
    .byte $02 ; |      X | $127D
    .byte $02 ; |      X | $127E
L127F:
    .byte $00 ; |        | $127F
    .byte $91 ; |X  X   X| $1280
    .byte $BD ; |X XXXX X| $1281
    .byte $FF ; |XXXXXXXX| $1282
    .byte $00 ; |        | $1283
    .byte $01 ; |       X| $1284
    .byte $00 ; |        | $1285
    .byte $20 ; |  X     | $1286
    .byte $00 ; |        | $1287
    .byte $41 ; | X     X| $1288
    .byte $00 ; |        | $1289
    .byte $04 ; |     X  | $128A
    .byte $00 ; |        | $128B
    .byte $10 ; |   X    | $128C
    .byte $00 ; |        | $128D
    .byte $02 ; |      X | $128E
    .byte $00 ; |        | $128F
    .byte $14 ; |   X X  | $1290
    .byte $00 ; |        | $1291
    .byte $02 ; |      X | $1292
    .byte $00 ; |        | $1293
    .byte $00 ; |        | $1294
    .byte $00 ; |        | $1295
    .byte $11 ; |   X   X| $1296
    .byte $00 ; |        | $1297
    .byte $22 ; |  X   X | $1298
    .byte $00 ; |        | $1299
    .byte $42 ; | X    X | $129A
    .byte $00 ; |        | $129B
    .byte $21 ; |  X    X| $129C
    .byte $00 ; |        | $129D
    .byte $00 ; |        | $129E
    .byte $00 ; |        | $129F
L12A0:
    .byte $00 ; |        | $12A0
    .byte $3D ; |  XXXX X| $12A1
    .byte $3B ; |  XXX XX| $12A2
    .byte $3F ; |  XXXXXX| $12A3
    .byte $00 ; |        | $12A4
    .byte $00 ; |        | $12A5
    .byte $22 ; |  X   X | $12A6
    .byte $00 ; |        | $12A7
    .byte $04 ; |     X  | $12A8
    .byte $00 ; |        | $12A9
    .byte $00 ; |        | $12AA
    .byte $10 ; |   X    | $12AB
    .byte $02 ; |      X | $12AC
    .byte $00 ; |        | $12AD
    .byte $41 ; | X     X| $12AE
    .byte $00 ; |        | $12AF
    .byte $20 ; |  X     | $12B0
    .byte $00 ; |        | $12B1
    .byte $14 ; |   X X  | $12B2
    .byte $00 ; |        | $12B3
    .byte $00 ; |        | $12B4
    .byte $11 ; |   X   X| $12B5
    .byte $00 ; |        | $12B6
    .byte $04 ; |     X  | $12B7
    .byte $40 ; | X      | $12B8
    .byte $01 ; |       X| $12B9
    .byte $00 ; |        | $12BA
    .byte $00 ; |        | $12BB
    .byte $20 ; |  X     | $12BC
    .byte $00 ; |        | $12BD
    .byte $00 ; |        | $12BE
    .byte $00 ; |        | $12BF
    .byte $00 ; |        | $12C0
    .byte $00 ; |        | $12C1

L12C2:  ;indirect jump
    jsr    L1693                 ; 6
    ldx    #$3F                  ; 2
    ldy    $DC                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
    stx    PF2                   ; 3
    sty    $F8                   ; 3
    lda    $88                   ; 3
    sta    $F9                   ; 3
    jsr    L1760                 ; 6
    sta    RESP1                 ; 3
    ldx    #$64                  ; 2
L12DE:
    lda    #0                    ; 2
    ldy    $F8                   ; 3
    cpy    #$14                  ; 2
    bcs    L12E8                 ; 2³
    lda    ($C3),Y               ; 5
L12E8:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    cpx    #$14                  ; 2
    bne    L12F7                 ; 2³
    lda    #$80                  ; 2
    sta    PF1                   ; 3
    asl                          ; 2
    sta    PF2                   ; 3
L12F7:
    ldy    $F9                   ; 3
    cpy    #$0D                  ; 2
    bcs    L1301                 ; 2³+1
    lda    ($C5),Y               ; 5
    sta    GRP1                  ; 3
L1301:
    dec    $F8                   ; 5
    dec    $F9                   ; 5
    dex                          ; 2
    bne    L12DE                 ; 2³+1
    lda    $9E                   ; 3
    beq    L1316                 ; 2³
    lda    #0                    ; 2
    sta    $C7                   ; 3
    lda    #$1E                  ; 2
    sta    $C8                   ; 3
    bne    L1322                    ; always branch

L1316:
    ldx    #$4E                  ; 2
    lda    frameCounter
    and    #$20                  ; 2
    bne    L1320                 ; 2³
    ldx    #$5B                  ; 2
L1320:
    stx    $C5                   ; 3
L1322:
    lda    #0                    ; 2
    ldy    $F8                   ; 3
    cpy    #$14                  ; 2
    bcs    L132C                 ; 2³
    lda    ($C3),Y               ; 5
L132C:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    #$8F                  ; 2
    sta    PF1                   ; 3
    ldx    #$FF                  ; 2
    stx    PF2                   ; 3
    inx                          ; 2
    stx    GRP1                  ; 3
    pha                          ; 3
    pla                          ; 4
    sta    RESP1                 ; 3
    lda    #$14                  ; 2
    sta    $F9                   ; 3
L1343:
    lda    #0                    ; 2
    ldy    $F8                   ; 3
    cpy    #$14                  ; 2
    bcs    L134D                 ; 2³
    lda    ($C3),Y               ; 5
L134D:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    ldy    $F9                   ; 3
    cpy    #$0D                  ; 2
    bcs    L135F                 ; 2³
    lda    ($C5),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($C7),Y               ; 5
    sta    COLUP1                ; 3
L135F:
    dec    $F8                   ; 5
    dec    $F9                   ; 5
    bpl    L1343                 ; 2³
    ldx    #$14                  ; 2
L1367:
    lda    #0                    ; 2
    ldy    $F8                   ; 3
    cpy    #$14                  ; 2
    bcs    L1371                 ; 2³
    lda    ($C3),Y               ; 5
L1371:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    ldy    #$FF                  ; 2
    sty    PF1                   ; 3
    iny                          ; 2
    sty    GRP1                  ; 3
    ldy    #4                    ; 2
L137E:
    dey                          ; 2
    bne    L137E                 ; 2³
    lda    #$0F                  ; 2
    sta    PF1                   ; 3
    dec    $F8                   ; 5
    dex                          ; 2
    bpl    L1367                 ; 2³
    ldx    #$1A                  ; 2
L138C:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$FF                  ; 2
    sty    PF1                   ; 3
    iny                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    dex                          ; 2
    bne    L138C                 ; 2³
    jmp    L1483                 ; 3

    .byte $00 ; |        | $139D
    .byte $03 ; |      XX| $139E
    .byte $1F ; |   XXXXX| $139F
    .byte $FF ; |XXXXXXXX| $13A0
    .byte $FE ; |XXXXXXX | $13A1
    .byte $B8 ; |X XXX   | $13A2
    .byte $00 ; |        | $13A3
    .byte $00 ; |        | $13A4
    .byte $00 ; |        | $13A5
    .byte $00 ; |        | $13A6
    .byte $00 ; |        | $13A7
    .byte $00 ; |        | $13A8
    .byte $00 ; |        | $13A9
    .byte $00 ; |        | $13AA
    .byte $00 ; |        | $13AB
    .byte $00 ; |        | $13AC
    .byte $00 ; |        | $13AD
    .byte $00 ; |        | $13AE
    .byte $00 ; |        | $13AF
    .byte $00 ; |        | $13B0
    .byte $00 ; |        | $13B1
    .byte $00 ; |        | $13B2
    .byte $00 ; |        | $13B3
L13B4:
    .byte $86 ; |X    XX | $13B4
    .byte $88 ; |X   X   | $13B5
    .byte $8A ; |X   X X | $13B6
    .byte $8C ; |X   XX  | $13B7
    .byte $7C ; | XXXXX  | $13B8
    .byte $78 ; | XXXX   | $13B9
    .byte $76 ; | XXX XX | $13BA
    .byte $74 ; | XXX X  | $13BB
    .byte $72 ; | XXX  X | $13BC
    .byte $82 ; |X     X | $13BD
    .byte $80 ; |X       | $13BE
    .byte $82 ; |X     X | $13BF
    .byte $84 ; |X    X  | $13C0

L13C1:  ;indirect jump
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$A0                  ; 2
    sta    COLUBK                ; 3
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    lda    #0                    ; 2
    sta    $FD                   ; 3
    lda    #$A8                  ; 2
    sta    $FB                   ; 3
    lda    $DC                   ; 3
    sta    $F9                   ; 3
    lda    $CA                   ; 3
    bpl    L13DD                 ; 2³
L13DB:
    lda    #$0D                  ; 2
L13DD:
    sta    $FA                   ; 3
    ldy    $F9                   ; 3
    lda    #0                    ; 2
    cpy    #$13                  ; 2
    bcs    L13E9                 ; 2³
    lda    ($C3),Y               ; 5
L13E9:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    ldx    $FD                   ; 3
    dec    $FB                   ; 5
    beq    L1423                 ; 2³+1
    dec    $F9                   ; 5
    lda    #0                    ; 2
    dey                          ; 2
    cpy    #$13                  ; 2
    bcs    L13FE                 ; 2³
    lda    ($C3),Y               ; 5
L13FE:
    sta    $FE                   ; 3
    ldy    #$A3                  ; 2
    lda    $A8,X                 ; 4
    sta    COLUP1                ; 3
    eor    #$05                  ; 2
    sta    NUSIZ1                ; 3
    cmp    #$20                  ; 2
    beq    L1410                 ; 2³
    ldy    #$9D                  ; 2
L1410:
    sty    $C7                   ; 3
    lda    $9D,X                 ; 4
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    $FE                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    inc    $FD                   ; 5
    dec    $FB                   ; 5
L1423:
    beq    L1479                 ; 2³
L1425:
    dey                          ; 2
    bpl    L1425                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    dec    $F9                   ; 5
    ldy    $F9                   ; 3
    cpy    #$13                  ; 2
    bcs    L143A                 ; 2³
    lda    ($C3),Y               ; 5
    sta    GRP0                  ; 3
L143A:
    dec    $F9                   ; 5
    dec    $FB                   ; 5
    beq    L1479                 ; 2³
    lda    $87,X                 ; 4
    sta    REFP1                 ; 3
    lda    $92,X                 ; 4
    sta    $C5                   ; 3
L1448:
    ldy    $F9                   ; 3
    lda    #0                    ; 2
    cpy    #$13                  ; 2
    bcs    L1452                 ; 2³
    lda    ($C3),Y               ; 5
L1452:
    ldy    $FA                   ; 3
    ldx    L1B92,Y               ; 4
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    PF0                   ; 3
    lda    L13B4,Y               ; 4
    sta    COLUPF                ; 3
    lda    ($C5),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($C7),Y               ; 5
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    dec    $F9                   ; 5
    dec    $FB                   ; 5
    beq    L1479                 ; 2³
    dec    $FA                   ; 5
    bpl    L1448                 ; 2³
    jmp    L13DB                 ; 3

L1479:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
L1483:
    lda    #0                    ; 2
    sta    COLUBK                ; 3   black
    ldx    #4                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
.loopClear64cycles:
    sta    REFP0,X                  ; clear PF2,PF1,PF0,REFP1,REFP0
    sta    GRP0,X                   ; clear ENABL,ENAM1,ENAM0,GRP1,GRP0
    dex
    bpl    .loopClear64cycles
    sta    GRP1                  ;3  @67   clear GRP1 again
    txs                          ;2  @69   X=$FF, reset stack
    lda    $C9                   ;3  @72
    asl                          ;2  @74
    asl                          ;2  @76
;---------------------------------------
    asl                          ;2  @2
    asl                          ;2  @4
    ora    #$0C                  ;2  @6
    sta    COLUP0                ;3  @9
    sta    COLUP1                ;3  @12
    ldx    #2                    ;2  @14
    jsr    L16DA                 ; 6
    jsr    L170C                 ; 6
    lda    $F4                   ; 3
    bpl    L14B8                 ; 2³
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$80                  ; 2
    jsr    L1547                 ; 6
    bmi    L14BD                    ; always branch

L14B8:
    ldx    #5                    ; 2
    jsr    L16DA                 ; 6
L14BD:
    jsr    L172B                 ; 6
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    #TIME_OVERSCAN        ; 2   $27
    sta    TIM64T                ; 4
    sta    VBLANK                ; 3   elecron beam is never turned off...
    ldx    #2                    ; 2
    jsr    L16DA                 ; 6
    lda    SWCHB
    lsr                             ; check reset switch
    bcs    L14DC                    ; - not pressed
    ldx    #$80                     ; - pressed
    stx    $F1                   ; 3
    bmi    L150E                    ; always branch

L14DC:
    ldx    $F1                   ; 3
    bpl    L150E                 ; 2³+1
    lda    $C9                   ; 3
    sta    $F7                   ; 3
    sta    $F5                   ; 3
    ldy    #$FF                  ; 2
    sty    $DA                   ; 3
    sty    $F6                   ; 3
    iny                             ; Y=0
    ldx    #%00000011               ; X=3
    sty    SWACNT                   ; set both joystick ports as all outputs,
    stx    SWCHA                    ; then make everyting low, except P1 (up and down)
    stx    SWACNT                   ; readjust DDR to make P1 (up and down) as inputs
;P1 (up and down) is unaffected by these writes...
    sty    SWCHA                    ; clear,
    stx    SWCHA                    ; clear,
    sty    SWCHA                    ; and clear again. Is this redundancy for the Mindlink hardware?
    sty    $F1                   ; 3
    sty    $9A                   ; 3
    sty    $F4                   ; 3
    iny                            ; Y=1
    sty    $CB                   ; 3
    sty    $CA                   ; 3
    bne    L1525                    ; always branch
L150E:
    lsr                          ; 2
    bcs    L153A                 ; 2³
    lda    $F1                   ; 3
    ora    #$40                  ; 2
    sta    $F1                   ; 3
    lda    frameCounter
    and    #$1F                  ; 2
    bne    L1525                 ; 2³
    inc    $C9                   ; 5
    lda    $C9                   ; 3
    and    #$03                  ; 2
    sta    $C9                   ; 3
L1525:
    ldx    #$0B                  ; 2
    lda    #$1C                  ; 2
    ldy    #0                    ; 2
L152B:
    sta    $CC,X                 ; 4
    sty    $80,X                 ; 4
    dex                          ; 2
    bpl    L152B                 ; 2³
    sty    AUDV0                 ; 3
    sty    AUDV1                 ; 3
    lda    #4                    ; 2
    sta    $86                   ; 3
L153A:
    bit    $F1                   ; 3
    bvc    L1544                 ; 2³
    lda    #$3B                  ; 2
    sta    $CA                   ; 3
    sta    $9A                   ; 3
L1544:
    jmp    L1000                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (JSR, Do Subroutine, RTS) = 93 cycles

L1547 SUBROUTINE
    ldx    #$0A                  ; 2
    sec                          ; 2
L154A:
    sta    $CC,X                 ; 4
    sbc    #8                    ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    L154A                 ; 2³

    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1553:  ;indirect jump
    lda    #$30                  ; 2
    sta    NUSIZ0                ; 3
    lda    #$31                  ; 2
    sta    CTRLPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    L1693                 ; 6
    lda    #$0F                  ; 2
    sta    COLUP0                ; 3
    ldx    #5                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
L1568:
    dex                          ; 2
    bne    L1568                 ; 2³
    sta    RESBL                 ; 3
    pha                          ; 3
    nop                          ; 2
    sta    RESP1                 ; 3
    pla                          ; 4
    ldx    #4                    ; 2
L1574:
    dex                          ; 2
    bne    L1574                 ; 2³
    nop                          ; 2
    sta    RESM0                 ; 3
    lda    $DC                   ; 3
    sta    $F9                   ; 3
    lda    #6                    ; 2
    sta    $F8                   ; 3
    ldx    #2                    ; 2
L1584:
    ldy    $F8                   ; 3
    lda.wy $9D,Y                 ; 4
    sta    $C5                   ; 3
    lda    #$17                  ; 2
    sta    $FA                   ; 3
    lda.wy $92,Y                 ; 4
    sta    NUSIZ1                ; 3
L1594:
    ldy    $F9                   ; 3
    lda    #0                    ; 2
    cpy    #$13                  ; 2
    bcs    L159E                 ; 2³
    lda    ($C3),Y               ; 5
L159E:
    ldy    $FA                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    L1954,Y               ; 4
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    L196A,Y               ; 4
    sta    COLUPF                ; 3
    lda    ($C5),Y               ; 5
    sta    GRP1                  ; 3
    sta    COLUP1                ; 3
    lda    L18FF,Y               ; 4
    sta    ENAM0,X               ; 4
    dec    $F9                   ; 5
    dec    $FA                   ; 5
    bne    L1594                 ; 2³
    ldy    $F9                   ; 3
    cpy    #$13                  ; 2
    bcs    L15CB                 ; 2³
    lda    ($C3),Y               ; 5
L15CB:
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    dec    $F9                   ; 5
    ldy    #0                    ; 2
    lda    ($C5),Y               ; 5
    sta    GRP1                  ; 3
    sta    COLUP1                ; 3
    txa                          ; 2
    eor    #$02                  ; 2
    tax                          ; 2
    dec    $F8                   ; 5
    bpl    L1584                 ; 2³
    jmp    L1483                 ; 3

L15E4:  ;indirect jump
    lda    #7                    ; 2
    sta    $F8                   ; 3
    lda    #5                    ; 2
    sta    CTRLPF                ; 3
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    jsr    L1693                 ; 6
    lda    $C2                   ; 3
    sta    COLUP0                ; 3
    lda    $DC                   ; 3
    sta    $FA                   ; 3
    lda    #$AA                  ; 2
    sta    $FB                   ; 3
L15FF:
    ldx    $F8                   ; 3
    ldy    $FA                   ; 3
    lda    #0                    ; 2
    cpy    #$13                  ; 2
    bcs    L160B                 ; 2³
    lda    ($C3),Y               ; 5
L160B:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    dec    $FB                   ; 5
    beq    L168A                 ; 2³
    dec    $FA                   ; 5
    dec    $FA                   ; 5
    lda    $B7,X                 ; 4
    sta    $F9                   ; 3
    lda    $A7,X                 ; 4
    sta    NUSIZ1                ; 3
    lda    $87,X                 ; 4
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    #0                    ; 2
    dey                          ; 2
    cpy    #$13                  ; 2
    bcs    L162F                 ; 2³
    lda    ($C3),Y               ; 5
L162F:
    dec    $FA                   ; 5
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    dec    $FB                   ; 5
    beq    L168A                 ; 2³
L163A:
    dex                          ; 2
    bpl    L163A                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    cpy    #$13                  ; 2
    bcs    L164B                 ; 2³
    lda    ($C3),Y               ; 5
    sta    GRP0                  ; 3
L164B:
    dec    $FB                   ; 5
    beq    L168A                 ; 2³
    ldx    $F8                   ; 3
    lda    $8F,X                 ; 4
    sta    $C5                   ; 3
    lda    $97,X                 ; 4
    sta    $C7                   ; 3
L1659:
    ldy    $FA                   ; 3
    lda    #0                    ; 2
    cpy    #$13                  ; 2
    bcs    L1663                 ; 2³
    lda    ($C3),Y               ; 5
L1663:
    ldy    $F9                   ; 3
    ldx    L1B8E,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    stx    PF0                   ; 3
    lda    ($C5),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($C7),Y               ; 5
    sta    COLUP1                ; 3
    lda    L19B8,Y               ; 4
    sta    COLUPF                ; 3
    dec    $FB                   ; 5
    beq    L168A                 ; 2³
    dec    $FA                   ; 5
    dec    $F9                   ; 5
    bpl    L1659                 ; 2³
    dec    $F8                   ; 5
    jmp    L15FF                 ; 3

L168A:
    jmp    L1483                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L168D SUBROUTINE
.loopDelay:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    .loopDelay            ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1693 SUBROUTINE
    lda    #$64                  ; 2
    ldx    $E4                   ; 3
    stx    REFP0                 ; 3
    bmi    L16A3                 ; 2³
    lda    $DB                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    L1BDD,X               ; 4
L16A3:
    sta    $C3                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L16A6 SUBROUTINE
    pha                          ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    pla                          ; 4
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    eor    #$70                  ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L16B4 SUBROUTINE
    tay                          ; 2
    sta    $F8                   ; 3
    and    #$0F                  ; 2
    sta    $FA                   ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $F9                   ; 3
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$0E                  ; 2
    sec                          ; 2
    sbc    $F9                   ; 3
    cmp    $FA                   ; 3
    bcs    L16CF                 ; 2³
    iny                          ; 2
L16CF:
    tya                          ; 2
    sec                          ; 2
    adc    $F8                   ; 3
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L16DA SUBROUTINE
    ldy    #$0A                  ; 2
L16DC:
    lda    $80,X                 ; 4   X = 2 or 5 initially
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta.wy $CC,Y                 ; 5
    dey                          ; 2
    dey                          ; 2
    lda    $80,X                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    sta.wy $CC,Y                 ; 5
    dex                          ; 2
    dey                          ; 2
    dey                          ; 2
    bpl    L16DC                 ; 2³
    ldx    #0                    ; 2
L16F7:
    lda    $CC,X                 ; 4
    bne    L1705                 ; 2³+1
    lda    #$50                  ; 2
    sta    $CC,X                 ; 4
    inx                          ; 2
    inx                          ; 2
    cpx    #9                    ; 2
    bcc    L16F7                 ; 2³+1
L1705:
    cpx    #5                    ; 2
    bcs    L170B                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
L170B:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L170C SUBROUTINE
    lda    #3                    ; 2
    ldx    #6                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
.loopDelay34cycles:
    dex
    bpl    .loopDelay34cycles
    ldy    #0                    ;2  @36
    sta    RESP0                 ;3  @39
    sta    RESP1                 ;3  @42
    sta    NUSIZ0                ;3  @45
    sta    NUSIZ1                ;3  @48
    stx    HMP0                  ;3  @51
    sty    HMP1                  ;3  @54
    stx    VDELP0                ;3  @57
    stx    VDELP1                ;3  @60
    sta    WSYNC                 ;3  @63
;---------------------------------------
    sta    HMOVE                 ;3  @3
L172B SUBROUTINE
    lda    #7                    ; 2
    sta    $F8                   ; 3
L172F:
    ldy    $F8                   ; 3
    lda    ($CC),Y               ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($CE),Y               ;5  @5
    sta    GRP1                  ;3  @8
    lda    ($D0),Y               ;5  @13
    sta    GRP0                  ;3  @16
    lda    ($D2),Y               ;5  @21
    sta    $F9                   ;3  @24
    lda    ($D4),Y               ;5  @29
    tax                          ;2  @31
    lda    ($D6),Y               ;5  @36
    tay                          ;2  @38
    lda    $F9                   ;3  @41
    sta    GRP1                  ;3  @44
    stx    GRP0                  ;3  @47
    sty    GRP1                  ;3  @50
    sty    GRP0                  ;3  @53
    dec    $F8                   ;5  @58
    bpl    L172F                 ;2³ @60/61
;clear vdelay...
    lda    #0                    ;2  @62
    sta    GRP0                  ;3  @65
    sta    GRP1                  ;3  @68
    sta    GRP0                  ;3  @71
;---------------------------------------
    rts                          ;6  @1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1760 SUBROUTINE
    lda    frameCounter
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    ora    #$14                  ; 2
    sta    COLUP1                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $00 ; |        | $176B
    .byte $FF ; |XXXXXXXX| $176C
    .byte $FF ; |XXXXXXXX| $176D
    .byte $00 ; |        | $176E
    .byte $00 ; |        | $176F
    .byte $FF ; |XXXXXXXX| $1770
    .byte $FF ; |XXXXXXXX| $1771
    .byte $00 ; |        | $1772
    .byte $00 ; |        | $1773
    .byte $FF ; |XXXXXXXX| $1774
    .byte $FF ; |XXXXXXXX| $1775
    .byte $00 ; |        | $1776
    .byte $00 ; |        | $1777
    .byte $FF ; |XXXXXXXX| $1778
    .byte $FF ; |XXXXXXXX| $1779
    .byte $00 ; |        | $177A
    .byte $00 ; |        | $177B
    .byte $FF ; |XXXXXXXX| $177C
    .byte $FF ; |XXXXXXXX| $177D
    .byte $00 ; |        | $177E
    .byte $00 ; |        | $177F
    .byte $FF ; |XXXXXXXX| $1780
    .byte $FF ; |XXXXXXXX| $1781
    .byte $00 ; |        | $1782
    .byte $00 ; |        | $1783
    .byte $FF ; |XXXXXXXX| $1784
    .byte $FF ; |XXXXXXXX| $1785
    .byte $00 ; |        | $1786
    .byte $00 ; |        | $1787
    .byte $FF ; |XXXXXXXX| $1788
    .byte $FF ; |XXXXXXXX| $1789
    .byte $00 ; |        | $178A
    .byte $00 ; |        | $178B
    .byte $FF ; |XXXXXXXX| $178C
    .byte $FF ; |XXXXXXXX| $178D
    .byte $00 ; |        | $178E
    .byte $00 ; |        | $178F
    .byte $FF ; |XXXXXXXX| $1790
    .byte $FF ; |XXXXXXXX| $1791
    .byte $00 ; |        | $1792
    .byte $00 ; |        | $1793
    .byte $FF ; |XXXXXXXX| $1794
    .byte $FF ; |XXXXXXXX| $1795
    .byte $00 ; |        | $1796
    .byte $00 ; |        | $1797
    .byte $FF ; |XXXXXXXX| $1798
    .byte $FF ; |XXXXXXXX| $1799
    .byte $00 ; |        | $179A
    .byte $00 ; |        | $179B
    .byte $FF ; |XXXXXXXX| $179C
    .byte $FF ; |XXXXXXXX| $179D
    .byte $00 ; |        | $179E
    .byte $00 ; |        | $179F
    .byte $FF ; |XXXXXXXX| $17A0
    .byte $FF ; |XXXXXXXX| $17A1
    .byte $00 ; |        | $17A2
    .byte $00 ; |        | $17A3
    .byte $FF ; |XXXXXXXX| $17A4
    .byte $FF ; |XXXXXXXX| $17A5
    .byte $00 ; |        | $17A6
    .byte $00 ; |        | $17A7
    .byte $FF ; |XXXXXXXX| $17A8
    .byte $FF ; |XXXXXXXX| $17A9
    .byte $00 ; |        | $17AA
    .byte $00 ; |        | $17AB
    .byte $FF ; |XXXXXXXX| $17AC
    .byte $FF ; |XXXXXXXX| $17AD
    .byte $00 ; |        | $17AE
    .byte $00 ; |        | $17AF
    .byte $FF ; |XXXXXXXX| $17B0
    .byte $FF ; |XXXXXXXX| $17B1
    .byte $00 ; |        | $17B2
    .byte $00 ; |        | $17B3
    .byte $FF ; |XXXXXXXX| $17B4
    .byte $FF ; |XXXXXXXX| $17B5
    .byte $00 ; |        | $17B6
    .byte $00 ; |        | $17B7
    .byte $FF ; |XXXXXXXX| $17B8
    .byte $FF ; |XXXXXXXX| $17B9
    .byte $00 ; |        | $17BA
    .byte $00 ; |        | $17BB
    .byte $FF ; |XXXXXXXX| $17BC
    .byte $FF ; |XXXXXXXX| $17BD
    .byte $00 ; |        | $17BE
    .byte $00 ; |        | $17BF
    .byte $FF ; |XXXXXXXX| $17C0
    .byte $FF ; |XXXXXXXX| $17C1
    .byte $00 ; |        | $17C2
    .byte $00 ; |        | $17C3
    .byte $FF ; |XXXXXXXX| $17C4
    .byte $FF ; |XXXXXXXX| $17C5
    .byte $00 ; |        | $17C6
    .byte $00 ; |        | $17C7
    .byte $FF ; |XXXXXXXX| $17C8
    .byte $FF ; |XXXXXXXX| $17C9
    .byte $00 ; |        | $17CA
    .byte $00 ; |        | $17CB
    .byte $FF ; |XXXXXXXX| $17CC
    .byte $FF ; |XXXXXXXX| $17CD
    .byte $00 ; |        | $17CE
    .byte $00 ; |        | $17CF
    .byte $FF ; |XXXXXXXX| $17D0
    .byte $FF ; |XXXXXXXX| $17D1
    .byte $00 ; |        | $17D2
    .byte $00 ; |        | $17D3
    .byte $FF ; |XXXXXXXX| $17D4
    .byte $FF ; |XXXXXXXX| $17D5
    .byte $00 ; |        | $17D6
    .byte $00 ; |        | $17D7
    .byte $FF ; |XXXXXXXX| $17D8
    .byte $FF ; |XXXXXXXX| $17D9
    .byte $00 ; |        | $17DA
    .byte $00 ; |        | $17DB
    .byte $FF ; |XXXXXXXX| $17DC
    .byte $FF ; |XXXXXXXX| $17DD
    .byte $00 ; |        | $17DE
    .byte $00 ; |        | $17DF
    .byte $FF ; |XXXXXXXX| $17E0
    .byte $FF ; |XXXXXXXX| $17E1
    .byte $00 ; |        | $17E2
    .byte $00 ; |        | $17E3
    .byte $FF ; |XXXXXXXX| $17E4
    .byte $FF ; |XXXXXXXX| $17E5
    .byte $00 ; |        | $17E6
    .byte $00 ; |        | $17E7
    .byte $FF ; |XXXXXXXX| $17E8
    .byte $FF ; |XXXXXXXX| $17E9
    .byte $00 ; |        | $17EA
    .byte $00 ; |        | $17EB
    .byte $FF ; |XXXXXXXX| $17EC
    .byte $FF ; |XXXXXXXX| $17ED
    .byte $00 ; |        | $17EE
    .byte $00 ; |        | $17EF
    .byte $FF ; |XXXXXXXX| $17F0
    .byte $FF ; |XXXXXXXX| $17F1
    .byte $00 ; |        | $17F2
    .byte $00 ; |        | $17F3
    .byte $FF ; |XXXXXXXX| $17F4
    .byte $FF ; |XXXXXXXX| $17F5
    .byte $00 ; |        | $17F6
    .byte $00 ; |        | $17F7
    .byte $FF ; |XXXXXXXX| $17F8
    .byte $FF ; |XXXXXXXX| $17F9
    .byte $00 ; |        | $17FA
    .byte $00 ; |        | $17FB
    .byte $FF ; |XXXXXXXX| $17FC
    .byte $FF ; |XXXXXXXX| $17FD
    .byte $00 ; |        | $17FE
    .byte $00 ; |        | $17FF
    .byte $00 ; |        | $1800
    .byte $01 ; |       X| $1801
    .byte $73 ; | XXX  XX| $1802
    .byte $FE ; |XXXXXXX | $1803
    .byte $FC ; |XXXXXX  | $1804
    .byte $FE ; |XXXXXXX | $1805
    .byte $BB ; |X XXX XX| $1806
    .byte $79 ; | XXXX  X| $1807
    .byte $30 ; |  XX    | $1808
    .byte $00 ; |        | $1809
    .byte $00 ; |        | $180A
    .byte $00 ; |        | $180B
    .byte $00 ; |        | $180C
    .byte $00 ; |        | $180D
    .byte $00 ; |        | $180E
    .byte $00 ; |        | $180F
    .byte $00 ; |        | $1810
    .byte $00 ; |        | $1811
    .byte $00 ; |        | $1812
    .byte $00 ; |        | $1813
    .byte $00 ; |        | $1814
    .byte $00 ; |        | $1815
    .byte $00 ; |        | $1816
    .byte $00 ; |        | $1817
    .byte $00 ; |        | $1818
    .byte $00 ; |        | $1819
    .byte $71 ; | XXX   X| $181A
    .byte $FB ; |XXXXX XX| $181B
    .byte $AE ; |X X XXX | $181C
    .byte $AC ; |X X XX  | $181D
    .byte $FE ; |XXXXXXX | $181E
    .byte $BB ; |X XXX XX| $181F
    .byte $79 ; | XXXX  X| $1820
    .byte $30 ; |  XX    | $1821
    .byte $00 ; |        | $1822
    .byte $00 ; |        | $1823
    .byte $00 ; |        | $1824
    .byte $00 ; |        | $1825
    .byte $00 ; |        | $1826
    .byte $00 ; |        | $1827
    .byte $00 ; |        | $1828
    .byte $00 ; |        | $1829
    .byte $00 ; |        | $182A
    .byte $70 ; | XXX    | $182B
    .byte $F9 ; |XXXXX  X| $182C
    .byte $AB ; |X X X XX| $182D
    .byte $0E ; |    XXX | $182E
    .byte $0C ; |    XX  | $182F
    .byte $AE ; |X X XXX | $1830
    .byte $FA ; |XXXXX X | $1831
    .byte $BB ; |X XXX XX| $1832
    .byte $71 ; | XXX   X| $1833
    .byte $30 ; |  XX    | $1834
    .byte $00 ; |        | $1835
    .byte $00 ; |        | $1836
    .byte $00 ; |        | $1837
    .byte $00 ; |        | $1838
    .byte $00 ; |        | $1839
    .byte $00 ; |        | $183A
    .byte $C0 ; |XX      | $183B
    .byte $E0 ; |XXX     | $183C
    .byte $61 ; | XX    X| $183D
    .byte $33 ; |  XX  XX| $183E
    .byte $3A ; |  XXX X | $183F
    .byte $1E ; |   XXXX | $1840
    .byte $1C ; |   XXX  | $1841
    .byte $3E ; |  XXXXX | $1842
    .byte $3A ; |  XXX X | $1843
    .byte $73 ; | XXX  XX| $1844
    .byte $51 ; | X X   X| $1845
    .byte $60 ; | XX     | $1846
    .byte $E0 ; |XXX     | $1847
    .byte $C0 ; |XX      | $1848
    .byte $00 ; |        | $1849
    .byte $00 ; |        | $184A
    .byte $00 ; |        | $184B
    .byte $00 ; |        | $184C
    .byte $71 ; | XXX   X| $184D
    .byte $FB ; |XXXXX XX| $184E
    .byte $3E ; |  XXXXX | $184F
    .byte $DC ; |XX XXX  | $1850
    .byte $FE ; |XXXXXXX | $1851
    .byte $BB ; |X XXX XX| $1852
    .byte $79 ; | XXXX  X| $1853
    .byte $30 ; |  XX    | $1854
    .byte $00 ; |        | $1855
    .byte $00 ; |        | $1856
    .byte $00 ; |        | $1857
    .byte $00 ; |        | $1858
    .byte $00 ; |        | $1859
    .byte $00 ; |        | $185A
    .byte $00 ; |        | $185B
    .byte $00 ; |        | $185C
    .byte $FF ; |XXXXXXXX| $185D
    .byte $FF ; |XXXXXXXX| $185E
    .byte $FF ; |XXXXXXXX| $185F
    .byte $FF ; |XXXXXXXX| $1860
    .byte $FF ; |XXXXXXXX| $1861
    .byte $00 ; |        | $1862
    .byte $00 ; |        | $1863
    .byte $00 ; |        | $1864
    .byte $00 ; |        | $1865
    .byte $00 ; |        | $1866
    .byte $00 ; |        | $1867
    .byte $00 ; |        | $1868
    .byte $00 ; |        | $1869
    .byte $00 ; |        | $186A
    .byte $00 ; |        | $186B
    .byte $00 ; |        | $186C
    .byte $00 ; |        | $186D
    .byte $00 ; |        | $186E
    .byte $00 ; |        | $186F
    .byte $00 ; |        | $1870
    .byte $00 ; |        | $1871
    .byte $00 ; |        | $1872
    .byte $00 ; |        | $1873
    .byte $00 ; |        | $1874
    .byte $00 ; |        | $1875
    .byte $00 ; |        | $1876
    .byte $00 ; |        | $1877
    .byte $00 ; |        | $1878
    .byte $00 ; |        | $1879
    .byte $00 ; |        | $187A
    .byte $24 ; |  X  X  | $187B
    .byte $A5 ; |X X  X X| $187C
    .byte $95 ; |X  X X X| $187D
    .byte $55 ; | X X X X| $187E
    .byte $31 ; |  XX   X| $187F
    .byte $CC ; |XX  XX  | $1880
    .byte $FE ; |XXXXXXX | $1881
    .byte $5E ; | X XXXX | $1882
    .byte $0C ; |    XX  | $1883
    .byte $08 ; |    X   | $1884
    .byte $08 ; |    X   | $1885
    .byte $08 ; |    X   | $1886
    .byte $08 ; |    X   | $1887
    .byte $08 ; |    X   | $1888
    .byte $08 ; |    X   | $1889
    .byte $08 ; |    X   | $188A
    .byte $08 ; |    X   | $188B
    .byte $08 ; |    X   | $188C
    .byte $08 ; |    X   | $188D
    .byte $08 ; |    X   | $188E
    .byte $08 ; |    X   | $188F
    .byte $08 ; |    X   | $1890
    .byte $08 ; |    X   | $1891
    .byte $08 ; |    X   | $1892
    .byte $08 ; |    X   | $1893
    .byte $08 ; |    X   | $1894
    .byte $08 ; |    X   | $1895
    .byte $08 ; |    X   | $1896
    .byte $08 ; |    X   | $1897
    .byte $08 ; |    X   | $1898
    .byte $08 ; |    X   | $1899
    .byte $00 ; |        | $189A
    .byte $00 ; |        | $189B
    .byte $00 ; |        | $189C
    .byte $00 ; |        | $189D
    .byte $00 ; |        | $189E
    .byte $00 ; |        | $189F
    .byte $00 ; |        | $18A0
    .byte $00 ; |        | $18A1
    .byte $00 ; |        | $18A2
    .byte $00 ; |        | $18A3
    .byte $00 ; |        | $18A4
    .byte $00 ; |        | $18A5
    .byte $00 ; |        | $18A6
    .byte $00 ; |        | $18A7
    .byte $00 ; |        | $18A8
    .byte $00 ; |        | $18A9
    .byte $00 ; |        | $18AA
    .byte $00 ; |        | $18AB
    .byte $00 ; |        | $18AC
    .byte $00 ; |        | $18AD
    .byte $00 ; |        | $18AE
    .byte $00 ; |        | $18AF
    .byte $00 ; |        | $18B0
    .byte $00 ; |        | $18B1
    .byte $00 ; |        | $18B2
    .byte $24 ; |  X  X  | $18B3
    .byte $42 ; | X    X | $18B4
    .byte $55 ; | X X X X| $18B5
    .byte $29 ; |  X X  X| $18B6
    .byte $12 ; |   X  X | $18B7
    .byte $0C ; |    XX  | $18B8
    .byte $DE ; |XX XXXX | $18B9
    .byte $FE ; |XXXXXXX | $18BA
    .byte $4C ; | X  XX  | $18BB
    .byte $08 ; |    X   | $18BC
    .byte $08 ; |    X   | $18BD
    .byte $08 ; |    X   | $18BE
    .byte $08 ; |    X   | $18BF
    .byte $08 ; |    X   | $18C0
    .byte $08 ; |    X   | $18C1
    .byte $08 ; |    X   | $18C2
    .byte $08 ; |    X   | $18C3
    .byte $08 ; |    X   | $18C4
    .byte $08 ; |    X   | $18C5
    .byte $08 ; |    X   | $18C6
    .byte $08 ; |    X   | $18C7
    .byte $08 ; |    X   | $18C8
    .byte $08 ; |    X   | $18C9
    .byte $08 ; |    X   | $18CA
    .byte $08 ; |    X   | $18CB
    .byte $08 ; |    X   | $18CC
    .byte $08 ; |    X   | $18CD
    .byte $08 ; |    X   | $18CE
    .byte $08 ; |    X   | $18CF
    .byte $08 ; |    X   | $18D0
    .byte $08 ; |    X   | $18D1
    .byte $00 ; |        | $18D2
    .byte $00 ; |        | $18D3
    .byte $FF ; |XXXXXXXX| $18D4
    .byte $FF ; |XXXXXXXX| $18D5
    .byte $00 ; |        | $18D6
    .byte $00 ; |        | $18D7
    .byte $FF ; |XXXXXXXX| $18D8
    .byte $FF ; |XXXXXXXX| $18D9
    .byte $00 ; |        | $18DA
    .byte $00 ; |        | $18DB
    .byte $FF ; |XXXXXXXX| $18DC
    .byte $FF ; |XXXXXXXX| $18DD
    .byte $00 ; |        | $18DE
    .byte $00 ; |        | $18DF
    .byte $FF ; |XXXXXXXX| $18E0
    .byte $FF ; |XXXXXXXX| $18E1
    .byte $00 ; |        | $18E2
    .byte $00 ; |        | $18E3
    .byte $FF ; |XXXXXXXX| $18E4
    .byte $FF ; |XXXXXXXX| $18E5
    .byte $00 ; |        | $18E6
    .byte $00 ; |        | $18E7
    .byte $FF ; |XXXXXXXX| $18E8
    .byte $FF ; |XXXXXXXX| $18E9
    .byte $00 ; |        | $18EA
    .byte $00 ; |        | $18EB
    .byte $FF ; |XXXXXXXX| $18EC
    .byte $FF ; |XXXXXXXX| $18ED
    .byte $00 ; |        | $18EE
    .byte $00 ; |        | $18EF
    .byte $FF ; |XXXXXXXX| $18F0
    .byte $FF ; |XXXXXXXX| $18F1
    .byte $00 ; |        | $18F2
    .byte $00 ; |        | $18F3
    .byte $FF ; |XXXXXXXX| $18F4
    .byte $FF ; |XXXXXXXX| $18F5
    .byte $00 ; |        | $18F6
    .byte $00 ; |        | $18F7
    .byte $FF ; |XXXXXXXX| $18F8
    .byte $FF ; |XXXXXXXX| $18F9
    .byte $00 ; |        | $18FA
    .byte $00 ; |        | $18FB
    .byte $FF ; |XXXXXXXX| $18FC
    .byte $FF ; |XXXXXXXX| $18FD
    .byte $00 ; |        | $18FE
L18FF:
    .byte $00 ; |        | $18FF
    .byte $00 ; |        | $1900
    .byte $00 ; |        | $1901
    .byte $00 ; |        | $1902
    .byte $00 ; |        | $1903
    .byte $14 ; |   X X  | $1904
    .byte $3E ; |  XXXXX | $1905
    .byte $7E ; | XXXXXX | $1906
    .byte $FF ; |XXXXXXXX| $1907
    .byte $00 ; |        | $1908
    .byte $00 ; |        | $1909
    .byte $00 ; |        | $190A
    .byte $00 ; |        | $190B
    .byte $00 ; |        | $190C
    .byte $00 ; |        | $190D
    .byte $00 ; |        | $190E
    .byte $00 ; |        | $190F
    .byte $00 ; |        | $1910
    .byte $00 ; |        | $1911
    .byte $00 ; |        | $1912
    .byte $00 ; |        | $1913
    .byte $00 ; |        | $1914
    .byte $00 ; |        | $1915
    .byte $00 ; |        | $1916
    .byte $00 ; |        | $1917
    .byte $00 ; |        | $1918
    .byte $00 ; |        | $1919
    .byte $00 ; |        | $191A
    .byte $00 ; |        | $191B
    .byte $00 ; |        | $191C
    .byte $00 ; |        | $191D
    .byte $00 ; |        | $191E
    .byte $00 ; |        | $191F
    .byte $04 ; |     X  | $1920
    .byte $4E ; | X  XXX | $1921
    .byte $3E ; |  XXXXX | $1922
    .byte $C7 ; |XX   XXX| $1923
    .byte $1F ; |   XXXXX| $1924
    .byte $3F ; |  XXXXXX| $1925
    .byte $CB ; |XX  X XX| $1926
    .byte $5E ; | X XXXX | $1927
    .byte $0E ; |    XXX | $1928
    .byte $04 ; |     X  | $1929
    .byte $00 ; |        | $192A
    .byte $00 ; |        | $192B
    .byte $00 ; |        | $192C
    .byte $00 ; |        | $192D
    .byte $00 ; |        | $192E
    .byte $00 ; |        | $192F
    .byte $00 ; |        | $1930
    .byte $00 ; |        | $1931
    .byte $00 ; |        | $1932
    .byte $00 ; |        | $1933
    .byte $1C ; |   XXX  | $1934
    .byte $7E ; | XXXXXX | $1935
    .byte $0F ; |    XXXX| $1936
    .byte $33 ; |  XX  XX| $1937
    .byte $BF ; |X XXXXXX| $1938
    .byte $1F ; |   XXXXX| $1939
    .byte $6E ; | XX XXX | $193A
    .byte $04 ; |     X  | $193B
    .byte $00 ; |        | $193C
    .byte $00 ; |        | $193D
    .byte $00 ; |        | $193E
    .byte $00 ; |        | $193F
    .byte $00 ; |        | $1940
    .byte $00 ; |        | $1941
    .byte $00 ; |        | $1942
    .byte $00 ; |        | $1943
    .byte $00 ; |        | $1944
    .byte $00 ; |        | $1945
    .byte $00 ; |        | $1946
    .byte $40 ; | X      | $1947
    .byte $42 ; | X    X | $1948
    .byte $44 ; | X   X  | $1949
    .byte $46 ; | X   XX | $194A
    .byte $4A ; | X  X X | $194B
    .byte $48 ; | X  X   | $194C
    .byte $46 ; | X   XX | $194D
    .byte $44 ; | X   X  | $194E
    .byte $42 ; | X    X | $194F
    .byte $40 ; | X      | $1950
    .byte $22 ; |  X   X | $1951
    .byte $24 ; |  X  X  | $1952
    .byte $26 ; |  X  XX | $1953
L1954:
    .byte $28 ; |  X X   | $1954
    .byte $00 ; |        | $1955
    .byte $01 ; |       X| $1956
    .byte $83 ; |X     XX| $1957
    .byte $DF ; |XX XXXXX| $1958
    .byte $FF ; |XXXXXXXX| $1959
    .byte $00 ; |        | $195A
    .byte $00 ; |        | $195B
    .byte $00 ; |        | $195C
    .byte $10 ; |   X    | $195D
    .byte $00 ; |        | $195E
    .byte $02 ; |      X | $195F
    .byte $80 ; |X       | $1960
    .byte $20 ; |  X     | $1961
    .byte $05 ; |     X X| $1962
    .byte $00 ; |        | $1963
    .byte $10 ; |   X    | $1964
    .byte $04 ; |     X  | $1965
    .byte $02 ; |      X | $1966
    .byte $00 ; |        | $1967
    .byte $40 ; | X      | $1968
    .byte $00 ; |        | $1969
L196A:
    .byte $00 ; |        | $196A
    .byte $00 ; |        | $196B
    .byte $20 ; |  X     | $196C
    .byte $22 ; |  X   X | $196D
    .byte $24 ; |  X  X  | $196E
    .byte $26 ; |  X  XX | $196F
    .byte $0F ; |    XXXX| $1970
    .byte $0F ; |    XXXX| $1971
    .byte $0F ; |    XXXX| $1972
    .byte $02 ; |      X | $1973
    .byte $02 ; |      X | $1974
    .byte $02 ; |      X | $1975
    .byte $02 ; |      X | $1976
    .byte $02 ; |      X | $1977
    .byte $02 ; |      X | $1978
    .byte $02 ; |      X | $1979
    .byte $02 ; |      X | $197A
    .byte $02 ; |      X | $197B
    .byte $02 ; |      X | $197C
    .byte $02 ; |      X | $197D
    .byte $02 ; |      X | $197E
    .byte $00 ; |        | $197F
    .byte $20 ; |  X     | $1980
    .byte $20 ; |  X     | $1981
    .byte $20 ; |  X     | $1982
    .byte $20 ; |  X     | $1983
    .byte $20 ; |  X     | $1984
    .byte $28 ; |  X X   | $1985
    .byte $28 ; |  X X   | $1986
    .byte $A8 ; |X X X   | $1987
    .byte $A8 ; |X X X   | $1988
    .byte $B8 ; |X XXX   | $1989
    .byte $FE ; |XXXXXXX | $198A
    .byte $FE ; |XXXXXXX | $198B
    .byte $3A ; |  XXX X | $198C
    .byte $02 ; |      X | $198D
    .byte $12 ; |   X  X | $198E
    .byte $38 ; |  XXX   | $198F
    .byte $38 ; |  XXX   | $1990
    .byte $10 ; |   X    | $1991
    .byte $00 ; |        | $1992
    .byte $00 ; |        | $1993
    .byte $00 ; |        | $1994
    .byte $28 ; |  X X   | $1995
    .byte $28 ; |  X X   | $1996
    .byte $28 ; |  X X   | $1997
    .byte $28 ; |  X X   | $1998
    .byte $28 ; |  X X   | $1999
    .byte $28 ; |  X X   | $199A
    .byte $28 ; |  X X   | $199B
    .byte $38 ; |  XXX   | $199C
    .byte $7C ; | XXXXX  | $199D
    .byte $7C ; | XXXXX  | $199E
    .byte $38 ; |  XXX   | $199F
    .byte $00 ; |        | $19A0
    .byte $10 ; |   X    | $19A1
    .byte $38 ; |  XXX   | $19A2
    .byte $38 ; |  XXX   | $19A3
    .byte $10 ; |   X    | $19A4
    .byte $00 ; |        | $19A5
    .byte $08 ; |    X   | $19A6
    .byte $08 ; |    X   | $19A7
    .byte $08 ; |    X   | $19A8
    .byte $08 ; |    X   | $19A9
    .byte $08 ; |    X   | $19AA
    .byte $28 ; |  X X   | $19AB
    .byte $28 ; |  X X   | $19AC
    .byte $2A ; |  X X X | $19AD
    .byte $2A ; |  X X X | $19AE
    .byte $3A ; |  XXX X | $19AF
    .byte $FE ; |XXXXXXX | $19B0
    .byte $FE ; |XXXXXXX | $19B1
    .byte $B8 ; |X XXX   | $19B2
    .byte $80 ; |X       | $19B3
    .byte $90 ; |X  X    | $19B4
    .byte $38 ; |  XXX   | $19B5
    .byte $38 ; |  XXX   | $19B6
    .byte $10 ; |   X    | $19B7
L19B8:
    .byte $28 ; |  X X   | $19B8
    .byte $20 ; |  X     | $19B9
    .byte $24 ; |  X  X  | $19BA
    .byte $26 ; |  X  XX | $19BB
    .byte $28 ; |  X X   | $19BC
    .byte $26 ; |  X  XX | $19BD
    .byte $24 ; |  X  X  | $19BE
    .byte $12 ; |   X  X | $19BF
    .byte $14 ; |   X X  | $19C0
    .byte $16 ; |   X XX | $19C1
    .byte $14 ; |   X X  | $19C2
    .byte $14 ; |   X X  | $19C3
    .byte $12 ; |   X  X | $19C4
    .byte $10 ; |   X    | $19C5
    .byte $24 ; |  X  X  | $19C6
    .byte $26 ; |  X  XX | $19C7
    .byte $24 ; |  X  X  | $19C8
    .byte $26 ; |  X  XX | $19C9
    .byte $20 ; |  X     | $19CA
    .byte $22 ; |  X   X | $19CB
    .byte $28 ; |  X X   | $19CC
    .byte $28 ; |  X X   | $19CD
    .byte $28 ; |  X X   | $19CE
    .byte $00 ; |        | $19CF
    .byte $FF ; |XXXXXXXX| $19D0
    .byte $FF ; |XXXXXXXX| $19D1
    .byte $00 ; |        | $19D2
    .byte $00 ; |        | $19D3
    .byte $FF ; |XXXXXXXX| $19D4
    .byte $FF ; |XXXXXXXX| $19D5
    .byte $00 ; |        | $19D6
    .byte $00 ; |        | $19D7
    .byte $FF ; |XXXXXXXX| $19D8
    .byte $FF ; |XXXXXXXX| $19D9
    .byte $00 ; |        | $19DA
    .byte $00 ; |        | $19DB
    .byte $FF ; |XXXXXXXX| $19DC
    .byte $FF ; |XXXXXXXX| $19DD
    .byte $00 ; |        | $19DE
    .byte $00 ; |        | $19DF
    .byte $FF ; |XXXXXXXX| $19E0
    .byte $FF ; |XXXXXXXX| $19E1
    .byte $00 ; |        | $19E2
    .byte $00 ; |        | $19E3
    .byte $FF ; |XXXXXXXX| $19E4
    .byte $FF ; |XXXXXXXX| $19E5
    .byte $00 ; |        | $19E6
    .byte $00 ; |        | $19E7
    .byte $FF ; |XXXXXXXX| $19E8
    .byte $FF ; |XXXXXXXX| $19E9
    .byte $00 ; |        | $19EA
    .byte $00 ; |        | $19EB
    .byte $FF ; |XXXXXXXX| $19EC
    .byte $FF ; |XXXXXXXX| $19ED
    .byte $00 ; |        | $19EE
    .byte $00 ; |        | $19EF
    .byte $FF ; |XXXXXXXX| $19F0
    .byte $FF ; |XXXXXXXX| $19F1
    .byte $00 ; |        | $19F2
    .byte $00 ; |        | $19F3
    .byte $FF ; |XXXXXXXX| $19F4
    .byte $FF ; |XXXXXXXX| $19F5
    .byte $00 ; |        | $19F6
    .byte $00 ; |        | $19F7
    .byte $FF ; |XXXXXXXX| $19F8
    .byte $FF ; |XXXXXXXX| $19F9
    .byte $00 ; |        | $19FA
    .byte $00 ; |        | $19FB
    .byte $FF ; |XXXXXXXX| $19FC
    .byte $FF ; |XXXXXXXX| $19FD
    .byte $00 ; |        | $19FE
    .byte $00 ; |        | $19FF
    .byte $00 ; |        | $1A00
    .byte $18 ; |   XX   | $1A01
    .byte $38 ; |  XXX   | $1A02
    .byte $3C ; |  XXXX  | $1A03
    .byte $7C ; | XXXXX  | $1A04
    .byte $7A ; | XXXX X | $1A05
    .byte $FF ; |XXXXXXXX| $1A06
    .byte $FF ; |XXXXXXXX| $1A07
    .byte $7E ; | XXXXXX | $1A08
    .byte $76 ; | XXX XX | $1A09
    .byte $3C ; |  XXXX  | $1A0A
    .byte $38 ; |  XXX   | $1A0B
    .byte $18 ; |   XX   | $1A0C
    .byte $00 ; |        | $1A0D
    .byte $00 ; |        | $1A0E
    .byte $18 ; |   XX   | $1A0F
    .byte $34 ; |  XX X  | $1A10
    .byte $3C ; |  XXXX  | $1A11
    .byte $7E ; | XXXXXX | $1A12
    .byte $7E ; | XXXXXX | $1A13
    .byte $7E ; | XXXXXX | $1A14
    .byte $7D ; | XXXXX X| $1A15
    .byte $7F ; | XXXXXXX| $1A16
    .byte $3E ; |  XXXXX | $1A17
    .byte $1C ; |   XXX  | $1A18
    .byte $08 ; |    X   | $1A19
    .byte $00 ; |        | $1A1A
    .byte $18 ; |   XX   | $1A1B
    .byte $1C ; |   XXX  | $1A1C
    .byte $3C ; |  XXXX  | $1A1D
    .byte $74 ; | XXX X  | $1A1E
    .byte $7E ; | XXXXXX | $1A1F
    .byte $BE ; |X XXXXX | $1A20
    .byte $FF ; |XXXXXXXX| $1A21
    .byte $FF ; |XXXXXXXX| $1A22
    .byte $7E ; | XXXXXX | $1A23
    .byte $3C ; |  XXXX  | $1A24
    .byte $3C ; |  XXXX  | $1A25
    .byte $1C ; |   XXX  | $1A26
    .byte $00 ; |        | $1A27
    .byte $00 ; |        | $1A28
    .byte $0C ; |    XX  | $1A29
    .byte $1C ; |   XXX  | $1A2A
    .byte $3E ; |  XXXXX | $1A2B
    .byte $7E ; | XXXXXX | $1A2C
    .byte $5E ; | X XXXX | $1A2D
    .byte $FE ; |XXXXXXX | $1A2E
    .byte $FE ; |XXXXXXX | $1A2F
    .byte $7E ; | XXXXXX | $1A30
    .byte $2C ; |  X XX  | $1A31
    .byte $18 ; |   XX   | $1A32
    .byte $00 ; |        | $1A33
    .byte $00 ; |        | $1A34
    .byte $A8 ; |X X X   | $1A35
    .byte $82 ; |X     X | $1A36
    .byte $30 ; |  XX    | $1A37
    .byte $25 ; |  X  X X| $1A38
    .byte $4C ; | X  XX  | $1A39
    .byte $6B ; | XX X XX| $1A3A
    .byte $3E ; |  XXXXX | $1A3B
    .byte $3C ; |  XXXX  | $1A3C
    .byte $18 ; |   XX   | $1A3D
    .byte $18 ; |   XX   | $1A3E
    .byte $00 ; |        | $1A3F
    .byte $00 ; |        | $1A40
    .byte $00 ; |        | $1A41
    .byte $42 ; | X    X | $1A42
    .byte $0A ; |    X X | $1A43
    .byte $21 ; |  X    X| $1A44
    .byte $00 ; |        | $1A45
    .byte $0C ; |    XX  | $1A46
    .byte $10 ; |   X    | $1A47
    .byte $00 ; |        | $1A48
    .byte $00 ; |        | $1A49
    .byte $00 ; |        | $1A4A
    .byte $00 ; |        | $1A4B
    .byte $00 ; |        | $1A4C
    .byte $00 ; |        | $1A4D
    .byte $FC ; |XXXXXX  | $1A4E
    .byte $FC ; |XXXXXX  | $1A4F
    .byte $C4 ; |XX   X  | $1A50
    .byte $C4 ; |XX   X  | $1A51
    .byte $C0 ; |XX      | $1A52
    .byte $C0 ; |XX      | $1A53
    .byte $F8 ; |XXXXX   | $1A54
    .byte $F8 ; |XXXXX   | $1A55
    .byte $C0 ; |XX      | $1A56
    .byte $80 ; |X       | $1A57
    .byte $C0 ; |XX      | $1A58
    .byte $C0 ; |XX      | $1A59
    .byte $C0 ; |XX      | $1A5A
    .byte $FC ; |XXXXXX  | $1A5B
    .byte $FC ; |XXXXXX  | $1A5C
    .byte $C4 ; |XX   X  | $1A5D
    .byte $C4 ; |XX   X  | $1A5E
    .byte $C0 ; |XX      | $1A5F
    .byte $C0 ; |XX      | $1A60
    .byte $E0 ; |XXX     | $1A61
    .byte $F0 ; |XXXX    | $1A62
    .byte $D8 ; |XX XX   | $1A63
    .byte $88 ; |X   X   | $1A64
    .byte $C0 ; |XX      | $1A65
    .byte $C0 ; |XX      | $1A66
    .byte $C0 ; |XX      | $1A67
    .byte $86 ; |X    XX | $1A68
    .byte $88 ; |X   X   | $1A69
    .byte $88 ; |X   X   | $1A6A
    .byte $88 ; |X   X   | $1A6B
    .byte $D4 ; |XX X X  | $1A6C
    .byte $D4 ; |XX X X  | $1A6D
    .byte $D4 ; |XX X X  | $1A6E
    .byte $D4 ; |XX X X  | $1A6F
    .byte $D4 ; |XX X X  | $1A70
    .byte $28 ; |  X X   | $1A71
    .byte $28 ; |  X X   | $1A72
    .byte $28 ; |  X X   | $1A73
    .byte $14 ; |   X X  | $1A74
    .byte $FF ; |XXXXXXXX| $1A75
    .byte $FF ; |XXXXXXXX| $1A76
    .byte $FF ; |XXXXXXXX| $1A77
    .byte $7F ; | XXXXXXX| $1A78
    .byte $7F ; | XXXXXXX| $1A79
    .byte $7F ; | XXXXXXX| $1A7A
    .byte $7F ; | XXXXXXX| $1A7B
    .byte $3F ; |  XXXXXX| $1A7C
    .byte $3F ; |  XXXXXX| $1A7D
    .byte $3F ; |  XXXXXX| $1A7E
    .byte $3F ; |  XXXXXX| $1A7F
    .byte $0F ; |    XXXX| $1A80
    .byte $0F ; |    XXXX| $1A81
    .byte $0F ; |    XXXX| $1A82
    .byte $0F ; |    XXXX| $1A83
    .byte $00 ; |        | $1A84
    .byte $00 ; |        | $1A85
    .byte $00 ; |        | $1A86
    .byte $01 ; |       X| $1A87
    .byte $00 ; |        | $1A88
    .byte $04 ; |     X  | $1A89
    .byte $80 ; |X       | $1A8A
    .byte $00 ; |        | $1A8B
    .byte $20 ; |  X     | $1A8C
    .byte $00 ; |        | $1A8D
    .byte $04 ; |     X  | $1A8E
    .byte $0D ; |    XX X| $1A8F
    .byte $1F ; |   XXXXX| $1A90
    .byte $00 ; |        | $1A91
    .byte $10 ; |   X    | $1A92
    .byte $00 ; |        | $1A93
    .byte $80 ; |X       | $1A94
    .byte $10 ; |   X    | $1A95
    .byte $00 ; |        | $1A96
    .byte $48 ; | X  X   | $1A97
    .byte $01 ; |       X| $1A98
    .byte $10 ; |   X    | $1A99
    .byte $90 ; |X  X    | $1A9A
    .byte $A0 ; |X X     | $1A9B
    .byte $44 ; | X   X  | $1A9C
    .byte $EC ; |XXX XX  | $1A9D
    .byte $FC ; |XXXXXX  | $1A9E
    .byte $00 ; |        | $1A9F
    .byte $00 ; |        | $1AA0
    .byte $02 ; |      X | $1AA1
    .byte $00 ; |        | $1AA2
    .byte $14 ; |   X X  | $1AA3
    .byte $40 ; | X      | $1AA4
    .byte $82 ; |X     X | $1AA5
    .byte $10 ; |   X    | $1AA6
    .byte $00 ; |        | $1AA7
    .byte $14 ; |   X X  | $1AA8
    .byte $BE ; |X XXXXX | $1AA9
    .byte $FF ; |XXXXXXXX| $1AAA
    .byte $00 ; |        | $1AAB
    .byte $10 ; |   X    | $1AAC
    .byte $02 ; |      X | $1AAD
    .byte $88 ; |X   X   | $1AAE
    .byte $21 ; |  X    X| $1AAF
    .byte $15 ; |   X X X| $1AB0
    .byte $04 ; |     X  | $1AB1
    .byte $41 ; | X     X| $1AB2
    .byte $80 ; |X       | $1AB3
    .byte $00 ; |        | $1AB4
    .byte $F8 ; |XXXXX   | $1AB5
    .byte $F8 ; |XXXXX   | $1AB6
    .byte $F8 ; |XXXXX   | $1AB7
    .byte $F8 ; |XXXXX   | $1AB8
    .byte $F8 ; |XXXXX   | $1AB9
    .byte $F8 ; |XXXXX   | $1ABA
    .byte $F8 ; |XXXXX   | $1ABB
    .byte $F8 ; |XXXXX   | $1ABC
    .byte $F8 ; |XXXXX   | $1ABD
    .byte $F8 ; |XXXXX   | $1ABE
    .byte $F8 ; |XXXXX   | $1ABF
    .byte $F8 ; |XXXXX   | $1AC0
    .byte $F8 ; |XXXXX   | $1AC1
    .byte $F8 ; |XXXXX   | $1AC2
    .byte $F8 ; |XXXXX   | $1AC3
    .byte $00 ; |        | $1AC4
    .byte $00 ; |        | $1AC5
    .byte $00 ; |        | $1AC6
    .byte $00 ; |        | $1AC7
    .byte $00 ; |        | $1AC8
    .byte $08 ; |    X   | $1AC9
    .byte $00 ; |        | $1ACA
    .byte $40 ; | X      | $1ACB
    .byte $02 ; |      X | $1ACC
    .byte $00 ; |        | $1ACD
    .byte $06 ; |     XX | $1ACE
    .byte $1F ; |   XXXXX| $1ACF
    .byte $3F ; |  XXXXXX| $1AD0
    .byte $00 ; |        | $1AD1
    .byte $04 ; |     X  | $1AD2
    .byte $01 ; |       X| $1AD3
    .byte $40 ; | X      | $1AD4
    .byte $12 ; |   X  X | $1AD5
    .byte $00 ; |        | $1AD6
    .byte $04 ; |     X  | $1AD7
    .byte $02 ; |      X | $1AD8
    .byte $40 ; | X      | $1AD9
    .byte $01 ; |       X| $1ADA
    .byte $10 ; |   X    | $1ADB
    .byte $84 ; |X    X  | $1ADC
    .byte $DE ; |XX XXXX | $1ADD
    .byte $FE ; |XXXXXXX | $1ADE
    .byte $00 ; |        | $1ADF
    .byte $00 ; |        | $1AE0
    .byte $01 ; |       X| $1AE1
    .byte $20 ; |  X     | $1AE2
    .byte $42 ; | X    X | $1AE3
    .byte $10 ; |   X    | $1AE4
    .byte $01 ; |       X| $1AE5
    .byte $02 ; |      X | $1AE6
    .byte $80 ; |X       | $1AE7
    .byte $20 ; |  X     | $1AE8
    .byte $71 ; | XXX   X| $1AE9
    .byte $F1 ; |XXXX   X| $1AEA
    .byte $00 ; |        | $1AEB
    .byte $04 ; |     X  | $1AEC
    .byte $10 ; |   X    | $1AED
    .byte $06 ; |     XX | $1AEE
    .byte $40 ; | X      | $1AEF
    .byte $00 ; |        | $1AF0
    .byte $80 ; |X       | $1AF1
    .byte $01 ; |       X| $1AF2
    .byte $20 ; |  X     | $1AF3
    .byte $00 ; |        | $1AF4
    .byte $20 ; |  X     | $1AF5
    .byte $20 ; |  X     | $1AF6
    .byte $22 ; |  X   X | $1AF7
    .byte $22 ; |  X   X | $1AF8
    .byte $24 ; |  X  X  | $1AF9
    .byte $24 ; |  X  X  | $1AFA
    .byte $26 ; |  X  XX | $1AFB
    .byte $26 ; |  X  XX | $1AFC
    .byte $28 ; |  X X   | $1AFD
    .byte $02 ; |      X | $1AFE
    .byte $02 ; |      X | $1AFF
    .byte $02 ; |      X | $1B00
    .byte $02 ; |      X | $1B01
    .byte $20 ; |  X     | $1B02
    .byte $28 ; |  X X   | $1B03
    .byte $02 ; |      X | $1B04
    .byte $02 ; |      X | $1B05
    .byte $02 ; |      X | $1B06
    .byte $02 ; |      X | $1B07
    .byte $02 ; |      X | $1B08
    .byte $22 ; |  X   X | $1B09
    .byte $28 ; |  X X   | $1B0A
    .byte $02 ; |      X | $1B0B
    .byte $02 ; |      X | $1B0C
    .byte $02 ; |      X | $1B0D
    .byte $02 ; |      X | $1B0E
    .byte $12 ; |   X  X | $1B0F
    .byte $28 ; |  X X   | $1B10
    .byte $02 ; |      X | $1B11
    .byte $02 ; |      X | $1B12
    .byte $02 ; |      X | $1B13
    .byte $02 ; |      X | $1B14
L1B15:
    .byte $D0 ; |XX X    | $1B15
    .byte $D0 ; |XX X    | $1B16
    .byte $D2 ; |XX X  X | $1B17
    .byte $D2 ; |XX X  X | $1B18
    .byte $D0 ; |XX X    | $1B19
    .byte $D0 ; |XX X    | $1B1A
    .byte $D2 ; |XX X  X | $1B1B
    .byte $D2 ; |XX X  X | $1B1C
    .byte $D0 ; |XX X    | $1B1D
    .byte $D0 ; |XX X    | $1B1E
    .byte $D2 ; |XX X  X | $1B1F
    .byte $D2 ; |XX X  X | $1B20
    .byte $D0 ; |XX X    | $1B21
    .byte $D0 ; |XX X    | $1B22
    .byte $D2 ; |XX X  X | $1B23
    .byte $D2 ; |XX X  X | $1B24
    .byte $D0 ; |XX X    | $1B25
    .byte $D0 ; |XX X    | $1B26
    .byte $D2 ; |XX X  X | $1B27
    .byte $D2 ; |XX X  X | $1B28
    .byte $D0 ; |XX X    | $1B29
    .byte $D0 ; |XX X    | $1B2A
    .byte $D2 ; |XX X  X | $1B2B
    .byte $D0 ; |XX X    | $1B2C
    .byte $D0 ; |XX X    | $1B2D
    .byte $D2 ; |XX X  X | $1B2E
    .byte $D2 ; |XX X  X | $1B2F
    .byte $D0 ; |XX X    | $1B30
    .byte $D2 ; |XX X  X | $1B31
    .byte $D2 ; |XX X  X | $1B32
    .byte $D2 ; |XX X  X | $1B33
    .byte $D0 ; |XX X    | $1B34
    .byte $D2 ; |XX X  X | $1B35
    .byte $D2 ; |XX X  X | $1B36
    .byte $D0 ; |XX X    | $1B37
    .byte $D2 ; |XX X  X | $1B38
    .byte $D0 ; |XX X    | $1B39
    .byte $D2 ; |XX X  X | $1B3A
    .byte $D0 ; |XX X    | $1B3B
    .byte $D0 ; |XX X    | $1B3C
    .byte $D2 ; |XX X  X | $1B3D
    .byte $D0 ; |XX X    | $1B3E
    .byte $D2 ; |XX X  X | $1B3F
    .byte $D0 ; |XX X    | $1B40
    .byte $D2 ; |XX X  X | $1B41
    .byte $D2 ; |XX X  X | $1B42
    .byte $D2 ; |XX X  X | $1B43
    .byte $D4 ; |XX X X  | $1B44
    .byte $D2 ; |XX X  X | $1B45
    .byte $D4 ; |XX X X  | $1B46
    .byte $D4 ; |XX X X  | $1B47
    .byte $D2 ; |XX X  X | $1B48
    .byte $D4 ; |XX X X  | $1B49
    .byte $D4 ; |XX X X  | $1B4A
    .byte $D2 ; |XX X  X | $1B4B
    .byte $D4 ; |XX X X  | $1B4C
    .byte $D4 ; |XX X X  | $1B4D
    .byte $D2 ; |XX X  X | $1B4E
    .byte $D4 ; |XX X X  | $1B4F
    .byte $D2 ; |XX X  X | $1B50
    .byte $D4 ; |XX X X  | $1B51
    .byte $D2 ; |XX X  X | $1B52
    .byte $D4 ; |XX X X  | $1B53
    .byte $D2 ; |XX X  X | $1B54
    .byte $D4 ; |XX X X  | $1B55
    .byte $D2 ; |XX X  X | $1B56
    .byte $D4 ; |XX X X  | $1B57
    .byte $D2 ; |XX X  X | $1B58
    .byte $D4 ; |XX X X  | $1B59
    .byte $D4 ; |XX X X  | $1B5A
    .byte $D2 ; |XX X  X | $1B5B
    .byte $D4 ; |XX X X  | $1B5C
    .byte $D4 ; |XX X X  | $1B5D
    .byte $D2 ; |XX X  X | $1B5E
    .byte $D4 ; |XX X X  | $1B5F
    .byte $D4 ; |XX X X  | $1B60
    .byte $D2 ; |XX X  X | $1B61
    .byte $D4 ; |XX X X  | $1B62
    .byte $D4 ; |XX X X  | $1B63
    .byte $D6 ; |XX X XX | $1B64
    .byte $D4 ; |XX X X  | $1B65
    .byte $D4 ; |XX X X  | $1B66
    .byte $D6 ; |XX X XX | $1B67
    .byte $D4 ; |XX X X  | $1B68
    .byte $D4 ; |XX X X  | $1B69
    .byte $D6 ; |XX X XX | $1B6A
    .byte $D4 ; |XX X X  | $1B6B
    .byte $D6 ; |XX X XX | $1B6C
    .byte $D4 ; |XX X X  | $1B6D
    .byte $D6 ; |XX X XX | $1B6E
    .byte $D4 ; |XX X X  | $1B6F
    .byte $D6 ; |XX X XX | $1B70
    .byte $D6 ; |XX X XX | $1B71
    .byte $D4 ; |XX X X  | $1B72
    .byte $D6 ; |XX X XX | $1B73
    .byte $D6 ; |XX X XX | $1B74
    .byte $D4 ; |XX X X  | $1B75
    .byte $D6 ; |XX X XX | $1B76
    .byte $D6 ; |XX X XX | $1B77
    .byte $D8 ; |XX XX   | $1B78
    .byte $D6 ; |XX X XX | $1B79
    .byte $D6 ; |XX X XX | $1B7A
    .byte $D8 ; |XX XX   | $1B7B
    .byte $D6 ; |XX X XX | $1B7C
    .byte $D6 ; |XX X XX | $1B7D
    .byte $D8 ; |XX XX   | $1B7E
    .byte $D6 ; |XX X XX | $1B7F
    .byte $D8 ; |XX XX   | $1B80
    .byte $D6 ; |XX X XX | $1B81
    .byte $D8 ; |XX XX   | $1B82
    .byte $D6 ; |XX X XX | $1B83
    .byte $D8 ; |XX XX   | $1B84
    .byte $D8 ; |XX XX   | $1B85
    .byte $D6 ; |XX X XX | $1B86
    .byte $D8 ; |XX XX   | $1B87
    .byte $D8 ; |XX XX   | $1B88
    .byte $D8 ; |XX XX   | $1B89
    .byte $DA ; |XX XX X | $1B8A
    .byte $DC ; |XX XXX  | $1B8B
    .byte $D8 ; |XX XX   | $1B8C
    .byte $DF ; |XX XXXXX| $1B8D
L1B8E:
    .byte $10 ; |   X    | $1B8E
    .byte $30 ; |  XX    | $1B8F
    .byte $10 ; |   X    | $1B90
    .byte $30 ; |  XX    | $1B91
L1B92:
    .byte $70 ; | XXX    | $1B92
    .byte $F0 ; |XXXX    | $1B93
    .byte $F0 ; |XXXX    | $1B94
    .byte $30 ; |  XX    | $1B95
    .byte $70 ; | XXX    | $1B96
    .byte $F0 ; |XXXX    | $1B97
    .byte $F0 ; |XXXX    | $1B98
    .byte $F0 ; |XXXX    | $1B99
    .byte $70 ; | XXX    | $1B9A
    .byte $30 ; |  XX    | $1B9B
    .byte $70 ; | XXX    | $1B9C
    .byte $30 ; |  XX    | $1B9D
    .byte $10 ; |   X    | $1B9E
    .byte $10 ; |   X    | $1B9F
    .byte $30 ; |  XX    | $1BA0
    .byte $70 ; | XXX    | $1BA1
    .byte $10 ; |   X    | $1BA2
    .byte $10 ; |   X    | $1BA3
    .byte $10 ; |   X    | $1BA4
    .byte $18 ; |   XX   | $1BA5
    .byte $18 ; |   XX   | $1BA6
    .byte $18 ; |   XX   | $1BA7
    .byte $1C ; |   XXX  | $1BA8
    .byte $1C ; |   XXX  | $1BA9
    .byte $1C ; |   XXX  | $1BAA
    .byte $0C ; |    XX  | $1BAB
    .byte $0F ; |    XXXX| $1BAC
    .byte $0F ; |    XXXX| $1BAD
    .byte $0F ; |    XXXX| $1BAE
    .byte $0F ; |    XXXX| $1BAF
    .byte $0E ; |    XXX | $1BB0
    .byte $06 ; |     XX | $1BB1
    .byte $06 ; |     XX | $1BB2
    .byte $06 ; |     XX | $1BB3
    .byte $06 ; |     XX | $1BB4
    .byte $06 ; |     XX | $1BB5
    .byte $07 ; |     XXX| $1BB6
    .byte $07 ; |     XXX| $1BB7
    .byte $03 ; |      XX| $1BB8
    .byte $03 ; |      XX| $1BB9
    .byte $03 ; |      XX| $1BBA
    .byte $03 ; |      XX| $1BBB
    .byte $01 ; |       X| $1BBC
    .byte $01 ; |       X| $1BBD
    .byte $01 ; |       X| $1BBE
    .byte $01 ; |       X| $1BBF
    .byte $00 ; |        | $1BC0
    .byte $0C ; |    XX  | $1BC1
    .byte $0C ; |    XX  | $1BC2
    .byte $0C ; |    XX  | $1BC3
    .byte $1C ; |   XXX  | $1BC4
    .byte $1C ; |   XXX  | $1BC5
    .byte $1C ; |   XXX  | $1BC6
    .byte $18 ; |   XX   | $1BC7
    .byte $F8 ; |XXXXX   | $1BC8
    .byte $F8 ; |XXXXX   | $1BC9
    .byte $F8 ; |XXXXX   | $1BCA
    .byte $F8 ; |XXXXX   | $1BCB
    .byte $38 ; |  XXX   | $1BCC
    .byte $30 ; |  XX    | $1BCD
    .byte $30 ; |  XX    | $1BCE
    .byte $30 ; |  XX    | $1BCF
    .byte $30 ; |  XX    | $1BD0
    .byte $30 ; |  XX    | $1BD1
    .byte $70 ; | XXX    | $1BD2
    .byte $70 ; | XXX    | $1BD3
    .byte $60 ; | XX     | $1BD4
    .byte $E0 ; |XXX     | $1BD5
    .byte $E0 ; |XXX     | $1BD6
    .byte $E0 ; |XXX     | $1BD7
    .byte $C7 ; |XX   XXX| $1BD8
    .byte $C7 ; |XX   XXX| $1BD9
    .byte $C7 ; |XX   XXX| $1BDA
    .byte $C7 ; |XX   XXX| $1BDB
    .byte $87 ; |X    XXX| $1BDC
L1BDD:
    .byte $64 ; | XX  X  | $1BDD
    .byte $77 ; | XXX XXX| $1BDE
    .byte $8A ; |X   X X | $1BDF
    .byte $77 ; | XXX XXX| $1BE0
    .byte $FF ; |XXXXXXXX| $1BE1
    .byte $00 ; |        | $1BE2
    .byte $00 ; |        | $1BE3
    .byte $FF ; |XXXXXXXX| $1BE4
    .byte $FF ; |XXXXXXXX| $1BE5
    .byte $00 ; |        | $1BE6
    .byte $00 ; |        | $1BE7
    .byte $FF ; |XXXXXXXX| $1BE8
    .byte $FF ; |XXXXXXXX| $1BE9
    .byte $00 ; |        | $1BEA
    .byte $00 ; |        | $1BEB
    .byte $FF ; |XXXXXXXX| $1BEC
    .byte $FF ; |XXXXXXXX| $1BED
    .byte $00 ; |        | $1BEE
    .byte $00 ; |        | $1BEF
    .byte $FF ; |XXXXXXXX| $1BF0
    .byte $FF ; |XXXXXXXX| $1BF1
    .byte $00 ; |        | $1BF2
    .byte $00 ; |        | $1BF3
    .byte $FF ; |XXXXXXXX| $1BF4
    .byte $FF ; |XXXXXXXX| $1BF5
    .byte $00 ; |        | $1BF6
    .byte $00 ; |        | $1BF7
    .byte $FF ; |XXXXXXXX| $1BF8
    .byte $FF ; |XXXXXXXX| $1BF9
    .byte $00 ; |        | $1BFA
    .byte $00 ; |        | $1BFB
    .byte $FF ; |XXXXXXXX| $1BFC
    .byte $FF ; |XXXXXXXX| $1BFD
    .byte $00 ; |        | $1BFE
    .byte $00 ; |        | $1BFF
Zero:
    .byte $18 ; |   XX   | $1C00
    .byte $24 ; |  X  X  | $1C01
    .byte $42 ; | X    X | $1C02
    .byte $42 ; | X    X | $1C03
    .byte $42 ; | X    X | $1C04
    .byte $42 ; | X    X | $1C05
    .byte $24 ; |  X  X  | $1C06
    .byte $18 ; |   XX   | $1C07
One:
    .byte $1C ; |   XXX  | $1C08
    .byte $08 ; |    X   | $1C09
    .byte $08 ; |    X   | $1C0A
    .byte $08 ; |    X   | $1C0B
    .byte $08 ; |    X   | $1C0C
    .byte $08 ; |    X   | $1C0D
    .byte $18 ; |   XX   | $1C0E
    .byte $08 ; |    X   | $1C0F
Two:
    .byte $7E ; | XXXXXX | $1C10
    .byte $20 ; |  X     | $1C11
    .byte $10 ; |   X    | $1C12
    .byte $08 ; |    X   | $1C13
    .byte $04 ; |     X  | $1C14
    .byte $02 ; |      X | $1C15
    .byte $42 ; | X    X | $1C16
    .byte $3C ; |  XXXX  | $1C17
Three:
    .byte $3C ; |  XXXX  | $1C18
    .byte $42 ; | X    X | $1C19
    .byte $02 ; |      X | $1C1A
    .byte $04 ; |     X  | $1C1B
    .byte $08 ; |    X   | $1C1C
    .byte $04 ; |     X  | $1C1D
    .byte $02 ; |      X | $1C1E
    .byte $7E ; | XXXXXX | $1C1F
Four:
    .byte $04 ; |     X  | $1C20
    .byte $04 ; |     X  | $1C21
    .byte $7E ; | XXXXXX | $1C22
    .byte $44 ; | X   X  | $1C23
    .byte $24 ; |  X  X  | $1C24
    .byte $14 ; |   X X  | $1C25
    .byte $0C ; |    XX  | $1C26
    .byte $04 ; |     X  | $1C27
Five:
    .byte $3C ; |  XXXX  | $1C28
    .byte $42 ; | X    X | $1C29
    .byte $02 ; |      X | $1C2A
    .byte $02 ; |      X | $1C2B
    .byte $02 ; |      X | $1C2C
    .byte $7C ; | XXXXX  | $1C2D
    .byte $40 ; | X      | $1C2E
    .byte $7E ; | XXXXXX | $1C2F
Six:
    .byte $3C ; |  XXXX  | $1C30
    .byte $42 ; | X    X | $1C31
    .byte $42 ; | X    X | $1C32
    .byte $7C ; | XXXXX  | $1C33
    .byte $20 ; |  X     | $1C34
    .byte $20 ; |  X     | $1C35
    .byte $10 ; |   X    | $1C36
    .byte $10 ; |   X    | $1C37
Seven:
    .byte $08 ; |    X   | $1C38
    .byte $08 ; |    X   | $1C39
    .byte $04 ; |     X  | $1C3A
    .byte $04 ; |     X  | $1C3B
    .byte $02 ; |      X | $1C3C
    .byte $02 ; |      X | $1C3D
    .byte $42 ; | X    X | $1C3E
    .byte $7E ; | XXXXXX | $1C3F
Eight:
    .byte $3C ; |  XXXX  | $1C40
    .byte $42 ; | X    X | $1C41
    .byte $42 ; | X    X | $1C42
    .byte $42 ; | X    X | $1C43
    .byte $3C ; |  XXXX  | $1C44
    .byte $42 ; | X    X | $1C45
    .byte $42 ; | X    X | $1C46
    .byte $3C ; |  XXXX  | $1C47
Nine:
    .byte $08 ; |    X   | $1C48
    .byte $08 ; |    X   | $1C49
    .byte $04 ; |     X  | $1C4A
    .byte $04 ; |     X  | $1C4B
    .byte $3E ; |  XXXXX | $1C4C
    .byte $42 ; | X    X | $1C4D
    .byte $42 ; | X    X | $1C4E
    .byte $3C ; |  XXXX  | $1C4F
BlankDigit:
    .byte $00 ; |        | $1C50
    .byte $00 ; |        | $1C51
    .byte $00 ; |        | $1C52
    .byte $00 ; |        | $1C53
    .byte $00 ; |        | $1C54
    .byte $00 ; |        | $1C55
    .byte $00 ; |        | $1C56
    .byte $00 ; |        | $1C57
GameOverOne:
    .byte $FA ; |XXXXX X | $1C58
    .byte $8A ; |X   X X | $1C59
    .byte $8A ; |X   X X | $1C5A
    .byte $BB ; |X XXX XX| $1C5B
    .byte $81 ; |X      X| $1C5C
    .byte $81 ; |X      X| $1C5D
    .byte $89 ; |X   X  X| $1C5E
    .byte $F8 ; |XXXXX   | $1C5F
GameOverTwo:
    .byte $28 ; |  X X   | $1C60
    .byte $28 ; |  X X   | $1C61
    .byte $28 ; |  X X   | $1C62
    .byte $EA ; |XXX X X | $1C63
    .byte $4A ; | X  X X | $1C64
    .byte $4D ; | X  XX X| $1C65
    .byte $CD ; |XX  XX X| $1C66
    .byte $88 ; |X   X   | $1C67
GameOverThree:
    .byte $BE ; |X XXXXX | $1C68
    .byte $A0 ; |X X     | $1C69
    .byte $A0 ; |X X     | $1C6A
    .byte $B8 ; |X XXX   | $1C6B
    .byte $A0 ; |X X     | $1C6C
    .byte $A0 ; |X X     | $1C6D
    .byte $A0 ; |X X     | $1C6E
    .byte $BE ; |X XXXXX | $1C6F
GameOverFour:
    .byte $7C ; | XXXXX  | $1C70
    .byte $44 ; | X   X  | $1C71
    .byte $44 ; | X   X  | $1C72
    .byte $44 ; | X   X  | $1C73
    .byte $45 ; | X   X X| $1C74
    .byte $45 ; | X   X X| $1C75
    .byte $45 ; | X   X X| $1C76
    .byte $7D ; | XXXXX X| $1C77
GameOverFive:
    .byte $47 ; | X   XXX| $1C78
    .byte $44 ; | X   X  | $1C79
    .byte $A4 ; |X X  X  | $1C7A
    .byte $A7 ; |X X  XXX| $1C7B
    .byte $14 ; |   X X  | $1C7C
    .byte $14 ; |   X X  | $1C7D
    .byte $14 ; |   X X  | $1C7E
    .byte $17 ; |   X XXX| $1C7F
GameOverSix:
    .byte $D1 ; |XX X   X| $1C80
    .byte $12 ; |   X  X | $1C81
    .byte $14 ; |   X X  | $1C82
    .byte $1F ; |   XXXXX| $1C83
    .byte $11 ; |   X   X| $1C84
    .byte $11 ; |   X   X| $1C85
    .byte $11 ; |   X   X| $1C86
    .byte $DF ; |XX XXXXX| $1C87

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; "MINE" gfx
;   XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;      XXXXX XXXX XXXXX   XXXX XXXXXX XXX    XXXX
;        XXX  XX X XX   XXXXXX XXXXX  XXX XXXXXX
;      XXXXX X X X XXXX XXXXX   XXXX XXXX X XXXXXXX
;       XXXX XX XX XXXX XXXXX XX XX  XXXX XXXXXXX
;     XXXXXX XX X  XXXX   XX  XXX X XXXXX  XXXX
;      XXXX  XXXXXXXX  XXXXX XXXXX  XXXX  X  XXXXX
;       XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;
; "MINE" gfx inverted
;XXX                                           XXXXXXXX
;XXXXXX     X    X     XXX    X      X   XXXX    XXXXXX
;XXXXXXXX   XX  X X  XXX      X     XX   X      XXXXXXX
;XXXXXX     X X X X    X     XXX    X    X X       XXXX
;XXXXXXX    X  X  X    X     X  X  XX    X       XXXXXX
;XXXXX      X  X XX    XXX  XX   X X     XX    XXXXXXXX
;XXXXXX    XX        XX     X     XX    XX XX     XXXXX
;XXXXXXX                                        XXXXXXX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MineGfxOne:
    .byte $0F ; |    XXXX| $1C88
    .byte $1E ; |   XXXX | $1C89
    .byte $3F ; |  XXXXXX| $1C8A
    .byte $0F ; |    XXXX| $1C8B
    .byte $1F ; |   XXXXX| $1C8C
    .byte $07 ; |     XXX| $1C8D
    .byte $1F ; |   XXXXX| $1C8E
    .byte $FF ; |XXXXXXXX| $1C8F
MineGfxTwo:
    .byte $FF ; |XXXXXXXX| $1C90
    .byte $7F ; | XXXXXXX| $1C91
    .byte $69 ; | XX X  X| $1C92
    .byte $6D ; | XX XX X| $1C93
    .byte $55 ; | X X X X| $1C94
    .byte $35 ; |  XX X X| $1C95
    .byte $7B ; | XXXX XX| $1C96
    .byte $FF ; |XXXXXXXX| $1C97
MineGfxThree:
    .byte $FF ; |XXXXXXXX| $1C98
    .byte $9F ; |X  XXXXX| $1C99
    .byte $E3 ; |XXX   XX| $1C9A
    .byte $EF ; |XXX XXXX| $1C9B
    .byte $EF ; |XXX XXXX| $1C9C
    .byte $8F ; |X   XXXX| $1C9D
    .byte $E3 ; |XXX   XX| $1C9E
    .byte $FF ; |XXXXXXXX| $1C9F
MineGfxFour:
    .byte $FF ; |XXXXXXXX| $1CA0
    .byte $7C ; | XXXXX  | $1CA1
    .byte $3A ; |  XXX X | $1CA2
    .byte $B6 ; |X XX XX | $1CA3
    .byte $8F ; |X   XXXX| $1CA4
    .byte $DF ; |XX XXXXX| $1CA5
    .byte $DF ; |XX XXXXX| $1CA6
    .byte $FF ; |XXXXXXXX| $1CA7
MineGfxFive:
    .byte $FF ; |XXXXXXXX| $1CA8
    .byte $F2 ; |XXXX  X | $1CA9
    .byte $F9 ; |XXXXX  X| $1CAA
    .byte $7B ; | XXXX XX| $1CAB
    .byte $7A ; | XXXX X | $1CAC
    .byte $3B ; |  XXX XX| $1CAD
    .byte $B8 ; |X XXX   | $1CAE
    .byte $FF ; |XXXXXXXX| $1CAF
MineGfxSix:
    .byte $F0 ; |XXXX    | $1CB0
    .byte $7C ; | XXXXX  | $1CB1
    .byte $E0 ; |XXX     | $1CB2
    .byte $F8 ; |XXXXX   | $1CB3
    .byte $FE ; |XXXXXXX | $1CB4
    .byte $F0 ; |XXXX    | $1CB5
    .byte $78 ; | XXXX   | $1CB6
    .byte $E0 ; |XXX     | $1CB7

    .byte $FF ; |XXXXXXXX| $1CB8
    .byte $FF ; |XXXXXXXX| $1CB9
    .byte $00 ; |        | $1CBA
    .byte $00 ; |        | $1CBB
    .byte $FF ; |XXXXXXXX| $1CBC
    .byte $FF ; |XXXXXXXX| $1CBD
    .byte $00 ; |        | $1CBE
    .byte $00 ; |        | $1CBF
    .byte $FF ; |XXXXXXXX| $1CC0
    .byte $FF ; |XXXXXXXX| $1CC1
    .byte $00 ; |        | $1CC2
    .byte $00 ; |        | $1CC3
    .byte $FF ; |XXXXXXXX| $1CC4
    .byte $FF ; |XXXXXXXX| $1CC5
    .byte $00 ; |        | $1CC6
    .byte $00 ; |        | $1CC7
    .byte $FF ; |XXXXXXXX| $1CC8
    .byte $FF ; |XXXXXXXX| $1CC9
    .byte $00 ; |        | $1CCA
    .byte $00 ; |        | $1CCB
    .byte $FF ; |XXXXXXXX| $1CCC
    .byte $FF ; |XXXXXXXX| $1CCD
    .byte $00 ; |        | $1CCE
    .byte $00 ; |        | $1CCF
    .byte $FF ; |XXXXXXXX| $1CD0
    .byte $FF ; |XXXXXXXX| $1CD1
    .byte $00 ; |        | $1CD2
    .byte $00 ; |        | $1CD3
    .byte $FF ; |XXXXXXXX| $1CD4
    .byte $FF ; |XXXXXXXX| $1CD5
    .byte $00 ; |        | $1CD6
    .byte $00 ; |        | $1CD7
    .byte $FF ; |XXXXXXXX| $1CD8
    .byte $FF ; |XXXXXXXX| $1CD9
    .byte $00 ; |        | $1CDA
    .byte $00 ; |        | $1CDB
    .byte $FF ; |XXXXXXXX| $1CDC
    .byte $FF ; |XXXXXXXX| $1CDD
    .byte $00 ; |        | $1CDE
    .byte $00 ; |        | $1CDF
    .byte $FF ; |XXXXXXXX| $1CE0
    .byte $FF ; |XXXXXXXX| $1CE1
    .byte $00 ; |        | $1CE2
    .byte $00 ; |        | $1CE3
    .byte $FF ; |XXXXXXXX| $1CE4
    .byte $FF ; |XXXXXXXX| $1CE5
    .byte $00 ; |        | $1CE6
    .byte $00 ; |        | $1CE7
    .byte $FF ; |XXXXXXXX| $1CE8
    .byte $FF ; |XXXXXXXX| $1CE9
    .byte $00 ; |        | $1CEA
    .byte $00 ; |        | $1CEB
    .byte $FF ; |XXXXXXXX| $1CEC
    .byte $FF ; |XXXXXXXX| $1CED
    .byte $00 ; |        | $1CEE
    .byte $00 ; |        | $1CEF
    .byte $FF ; |XXXXXXXX| $1CF0
    .byte $FF ; |XXXXXXXX| $1CF1
    .byte $00 ; |        | $1CF2
    .byte $00 ; |        | $1CF3
    .byte $FF ; |XXXXXXXX| $1CF4
    .byte $FF ; |XXXXXXXX| $1CF5
    .byte $00 ; |        | $1CF6
    .byte $00 ; |        | $1CF7
    .byte $FF ; |XXXXXXXX| $1CF8
    .byte $FF ; |XXXXXXXX| $1CF9
    .byte $00 ; |        | $1CFA
    .byte $00 ; |        | $1CFB
    .byte $FF ; |XXXXXXXX| $1CFC
    .byte $FF ; |XXXXXXXX| $1CFD
    .byte $00 ; |        | $1CFE
    .byte $00 ; |        | $1CFF

    .byte $00 ; |        | $1D00
    .byte $00 ; |        | $1D01
    .byte $00 ; |        | $1D02
    .byte $00 ; |        | $1D03
    .byte $00 ; |        | $1D04
    .byte $00 ; |        | $1D05
    .byte $00 ; |        | $1D06
    .byte $00 ; |        | $1D07
    .byte $00 ; |        | $1D08
    .byte $00 ; |        | $1D09
    .byte $04 ; |     X  | $1D0A
    .byte $06 ; |     XX | $1D0B
    .byte $04 ; |     X  | $1D0C
    .byte $14 ; |   X X  | $1D0D
    .byte $1C ; |   XXX  | $1D0E
    .byte $14 ; |   X X  | $1D0F
    .byte $14 ; |   X X  | $1D10
    .byte $14 ; |   X X  | $1D11
    .byte $14 ; |   X X  | $1D12
    .byte $1C ; |   XXX  | $1D13
    .byte $1C ; |   XXX  | $1D14
    .byte $3E ; |  XXXXX | $1D15
    .byte $3E ; |  XXXXX | $1D16
    .byte $3E ; |  XXXXX | $1D17
    .byte $3E ; |  XXXXX | $1D18
    .byte $3E ; |  XXXXX | $1D19
    .byte $3E ; |  XXXXX | $1D1A
    .byte $3E ; |  XXXXX | $1D1B
    .byte $3E ; |  XXXXX | $1D1C
    .byte $3E ; |  XXXXX | $1D1D
    .byte $3E ; |  XXXXX | $1D1E
    .byte $08 ; |    X   | $1D1F
    .byte $1C ; |   XXX  | $1D20
    .byte $1C ; |   XXX  | $1D21
    .byte $1C ; |   XXX  | $1D22
    .byte $08 ; |    X   | $1D23
    .byte $14 ; |   X X  | $1D24
    .byte $22 ; |  X   X | $1D25
    .byte $00 ; |        | $1D26
    .byte $00 ; |        | $1D27
    .byte $00 ; |        | $1D28
    .byte $00 ; |        | $1D29
    .byte $00 ; |        | $1D2A
    .byte $00 ; |        | $1D2B
    .byte $00 ; |        | $1D2C
    .byte $00 ; |        | $1D2D
    .byte $00 ; |        | $1D2E
    .byte $00 ; |        | $1D2F
    .byte $00 ; |        | $1D30
    .byte $00 ; |        | $1D31
    .byte $00 ; |        | $1D32
    .byte $00 ; |        | $1D33
    .byte $00 ; |        | $1D34
    .byte $00 ; |        | $1D35
    .byte $00 ; |        | $1D36
    .byte $00 ; |        | $1D37
    .byte $00 ; |        | $1D38
    .byte $00 ; |        | $1D39
    .byte $00 ; |        | $1D3A
    .byte $00 ; |        | $1D3B
    .byte $10 ; |   X    | $1D3C
    .byte $18 ; |   XX   | $1D3D
    .byte $10 ; |   X    | $1D3E
    .byte $14 ; |   X X  | $1D3F
    .byte $16 ; |   X XX | $1D40
    .byte $14 ; |   X X  | $1D41
    .byte $14 ; |   X X  | $1D42
    .byte $14 ; |   X X  | $1D43
    .byte $1C ; |   XXX  | $1D44
    .byte $1C ; |   XXX  | $1D45
    .byte $3E ; |  XXXXX | $1D46
    .byte $3E ; |  XXXXX | $1D47
    .byte $3E ; |  XXXXX | $1D48
    .byte $3E ; |  XXXXX | $1D49
    .byte $3E ; |  XXXXX | $1D4A
    .byte $3E ; |  XXXXX | $1D4B
    .byte $3E ; |  XXXXX | $1D4C
    .byte $3E ; |  XXXXX | $1D4D
    .byte $3E ; |  XXXXX | $1D4E
    .byte $3E ; |  XXXXX | $1D4F
    .byte $08 ; |    X   | $1D50
    .byte $08 ; |    X   | $1D51
    .byte $08 ; |    X   | $1D52
    .byte $1C ; |   XXX  | $1D53
    .byte $1C ; |   XXX  | $1D54
    .byte $1C ; |   XXX  | $1D55
    .byte $08 ; |    X   | $1D56
    .byte $14 ; |   X X  | $1D57
    .byte $22 ; |  X   X | $1D58
    .byte $00 ; |        | $1D59
    .byte $00 ; |        | $1D5A
    .byte $00 ; |        | $1D5B
    .byte $00 ; |        | $1D5C
    .byte $00 ; |        | $1D5D
    .byte $00 ; |        | $1D5E
    .byte $00 ; |        | $1D5F
    .byte $00 ; |        | $1D60
    .byte $00 ; |        | $1D61
    .byte $00 ; |        | $1D62
    .byte $00 ; |        | $1D63
    .byte $00 ; |        | $1D64
    .byte $18 ; |   XX   | $1D65
    .byte $18 ; |   XX   | $1D66
    .byte $10 ; |   X    | $1D67
    .byte $10 ; |   X    | $1D68
    .byte $10 ; |   X    | $1D69
    .byte $10 ; |   X    | $1D6A
    .byte $10 ; |   X    | $1D6B
    .byte $10 ; |   X    | $1D6C
    .byte $18 ; |   XX   | $1D6D
    .byte $18 ; |   XX   | $1D6E
    .byte $18 ; |   XX   | $1D6F
    .byte $18 ; |   XX   | $1D70
    .byte $10 ; |   X    | $1D71
    .byte $00 ; |        | $1D72
    .byte $10 ; |   X    | $1D73
    .byte $38 ; |  XXX   | $1D74
    .byte $38 ; |  XXX   | $1D75
    .byte $10 ; |   X    | $1D76
    .byte $00 ; |        | $1D77
    .byte $30 ; |  XX    | $1D78
    .byte $26 ; |  X  XX | $1D79
    .byte $24 ; |  X  X  | $1D7A
    .byte $24 ; |  X  X  | $1D7B
    .byte $34 ; |  XX X  | $1D7C
    .byte $1C ; |   XXX  | $1D7D
    .byte $18 ; |   XX   | $1D7E
    .byte $18 ; |   XX   | $1D7F
    .byte $18 ; |   XX   | $1D80
    .byte $18 ; |   XX   | $1D81
    .byte $18 ; |   XX   | $1D82
    .byte $10 ; |   X    | $1D83
    .byte $00 ; |        | $1D84
    .byte $00 ; |        | $1D85
    .byte $10 ; |   X    | $1D86
    .byte $38 ; |  XXX   | $1D87
    .byte $38 ; |  XXX   | $1D88
    .byte $10 ; |   X    | $1D89
    .byte $00 ; |        | $1D8A
    .byte $C3 ; |XX    XX| $1D8B
    .byte $82 ; |X     X | $1D8C
    .byte $C2 ; |XX    X | $1D8D
    .byte $46 ; | X   XX | $1D8E
    .byte $64 ; | XX  X  | $1D8F
    .byte $2C ; |  X XX  | $1D90
    .byte $38 ; |  XXX   | $1D91
    .byte $18 ; |   XX   | $1D92
    .byte $18 ; |   XX   | $1D93
    .byte $18 ; |   XX   | $1D94
    .byte $18 ; |   XX   | $1D95
    .byte $10 ; |   X    | $1D96
    .byte $00 ; |        | $1D97
    .byte $10 ; |   X    | $1D98
    .byte $38 ; |  XXX   | $1D99
    .byte $38 ; |  XXX   | $1D9A
    .byte $10 ; |   X    | $1D9B
    .byte $00 ; |        | $1D9C
    .byte $00 ; |        | $1D9D
    .byte $CC ; |XX  XX  | $1D9E
    .byte $CC ; |XX  XX  | $1D9F
    .byte $CC ; |XX  XX  | $1DA0
    .byte $CE ; |XX  XXX | $1DA1
    .byte $CE ; |XX  XXX | $1DA2
    .byte $CE ; |XX  XXX | $1DA3
    .byte $C6 ; |XX   XX | $1DA4
    .byte $C7 ; |XX   XXX| $1DA5
    .byte $C7 ; |XX   XXX| $1DA6
    .byte $C7 ; |XX   XXX| $1DA7
    .byte $C7 ; |XX   XXX| $1DA8
    .byte $C7 ; |XX   XXX| $1DA9
    .byte $C3 ; |XX    XX| $1DAA
    .byte $C3 ; |XX    XX| $1DAB
    .byte $C3 ; |XX    XX| $1DAC
    .byte $C3 ; |XX    XX| $1DAD
    .byte $C3 ; |XX    XX| $1DAE
    .byte $C3 ; |XX    XX| $1DAF
    .byte $C1 ; |XX     X| $1DB0
    .byte $C1 ; |XX     X| $1DB1
    .byte $C1 ; |XX     X| $1DB2
    .byte $C1 ; |XX     X| $1DB3
    .byte $C1 ; |XX     X| $1DB4
    .byte $F8 ; |XXXXX   | $1DB5
    .byte $F8 ; |XXXXX   | $1DB6
    .byte $F8 ; |XXXXX   | $1DB7
    .byte $F8 ; |XXXXX   | $1DB8
    .byte $F8 ; |XXXXX   | $1DB9
    .byte $00 ; |        | $1DBA
    .byte $00 ; |        | $1DBB
    .byte $FF ; |XXXXXXXX| $1DBC
    .byte $FF ; |XXXXXXXX| $1DBD
    .byte $00 ; |        | $1DBE
    .byte $00 ; |        | $1DBF
    .byte $FF ; |XXXXXXXX| $1DC0
    .byte $FF ; |XXXXXXXX| $1DC1
    .byte $00 ; |        | $1DC2
    .byte $00 ; |        | $1DC3
    .byte $FF ; |XXXXXXXX| $1DC4
    .byte $FF ; |XXXXXXXX| $1DC5
    .byte $00 ; |        | $1DC6
    .byte $00 ; |        | $1DC7
    .byte $FF ; |XXXXXXXX| $1DC8
    .byte $FF ; |XXXXXXXX| $1DC9
    .byte $00 ; |        | $1DCA
    .byte $00 ; |        | $1DCB
    .byte $FF ; |XXXXXXXX| $1DCC
    .byte $FF ; |XXXXXXXX| $1DCD
    .byte $00 ; |        | $1DCE
    .byte $00 ; |        | $1DCF
    .byte $FF ; |XXXXXXXX| $1DD0
    .byte $FF ; |XXXXXXXX| $1DD1
    .byte $00 ; |        | $1DD2
    .byte $00 ; |        | $1DD3
    .byte $FF ; |XXXXXXXX| $1DD4
    .byte $FF ; |XXXXXXXX| $1DD5
    .byte $00 ; |        | $1DD6
    .byte $00 ; |        | $1DD7
    .byte $FF ; |XXXXXXXX| $1DD8
    .byte $FF ; |XXXXXXXX| $1DD9
    .byte $00 ; |        | $1DDA
    .byte $00 ; |        | $1DDB
    .byte $FF ; |XXXXXXXX| $1DDC
    .byte $FF ; |XXXXXXXX| $1DDD
    .byte $00 ; |        | $1DDE
    .byte $00 ; |        | $1DDF
    .byte $FF ; |XXXXXXXX| $1DE0
    .byte $FF ; |XXXXXXXX| $1DE1
    .byte $00 ; |        | $1DE2
    .byte $00 ; |        | $1DE3
    .byte $FF ; |XXXXXXXX| $1DE4
    .byte $FF ; |XXXXXXXX| $1DE5
    .byte $00 ; |        | $1DE6
    .byte $00 ; |        | $1DE7
    .byte $FF ; |XXXXXXXX| $1DE8
    .byte $FF ; |XXXXXXXX| $1DE9
    .byte $00 ; |        | $1DEA
    .byte $00 ; |        | $1DEB
    .byte $FF ; |XXXXXXXX| $1DEC
    .byte $FF ; |XXXXXXXX| $1DED
    .byte $00 ; |        | $1DEE
    .byte $00 ; |        | $1DEF
    .byte $FF ; |XXXXXXXX| $1DF0
    .byte $FF ; |XXXXXXXX| $1DF1
    .byte $00 ; |        | $1DF2
    .byte $00 ; |        | $1DF3
    .byte $FF ; |XXXXXXXX| $1DF4
    .byte $FF ; |XXXXXXXX| $1DF5
    .byte $00 ; |        | $1DF6
    .byte $00 ; |        | $1DF7
    .byte $FF ; |XXXXXXXX| $1DF8
    .byte $FF ; |XXXXXXXX| $1DF9
    .byte $00 ; |        | $1DFA
    .byte $00 ; |        | $1DFB
    .byte $FF ; |XXXXXXXX| $1DFC
    .byte $FF ; |XXXXXXXX| $1DFD
    .byte $00 ; |        | $1DFE
    .byte $00 ; |        | $1DFF
    .byte $00 ; |        | $1E00
    .byte $00 ; |        | $1E01
    .byte $00 ; |        | $1E02
    .byte $00 ; |        | $1E03
    .byte $00 ; |        | $1E04
    .byte $00 ; |        | $1E05
    .byte $00 ; |        | $1E06
    .byte $00 ; |        | $1E07
    .byte $00 ; |        | $1E08
    .byte $00 ; |        | $1E09
    .byte $00 ; |        | $1E0A
    .byte $00 ; |        | $1E0B
    .byte $00 ; |        | $1E0C
    .byte $00 ; |        | $1E0D
    .byte $00 ; |        | $1E0E
    .byte $00 ; |        | $1E0F
    .byte $00 ; |        | $1E10
    .byte $00 ; |        | $1E11
    .byte $00 ; |        | $1E12
    .byte $10 ; |   X    | $1E13
    .byte $00 ; |        | $1E14
    .byte $00 ; |        | $1E15
    .byte $00 ; |        | $1E16
    .byte $00 ; |        | $1E17
    .byte $00 ; |        | $1E18
    .byte $00 ; |        | $1E19
    .byte $00 ; |        | $1E1A
    .byte $00 ; |        | $1E1B
    .byte $18 ; |   XX   | $1E1C
    .byte $10 ; |   X    | $1E1D
    .byte $00 ; |        | $1E1E
    .byte $00 ; |        | $1E1F
    .byte $00 ; |        | $1E20
    .byte $00 ; |        | $1E21
    .byte $00 ; |        | $1E22
    .byte $00 ; |        | $1E23
    .byte $00 ; |        | $1E24
    .byte $18 ; |   XX   | $1E25
    .byte $18 ; |   XX   | $1E26
    .byte $10 ; |   X    | $1E27
    .byte $00 ; |        | $1E28
    .byte $00 ; |        | $1E29
    .byte $00 ; |        | $1E2A
    .byte $00 ; |        | $1E2B
    .byte $00 ; |        | $1E2C
    .byte $00 ; |        | $1E2D
    .byte $3C ; |  XXXX  | $1E2E
    .byte $18 ; |   XX   | $1E2F
    .byte $18 ; |   XX   | $1E30
    .byte $10 ; |   X    | $1E31
    .byte $00 ; |        | $1E32
    .byte $00 ; |        | $1E33
    .byte $00 ; |        | $1E34
    .byte $00 ; |        | $1E35
    .byte $00 ; |        | $1E36
    .byte $7E ; | XXXXXX | $1E37
    .byte $3C ; |  XXXX  | $1E38
    .byte $18 ; |   XX   | $1E39
    .byte $18 ; |   XX   | $1E3A
    .byte $10 ; |   X    | $1E3B
    .byte $00 ; |        | $1E3C
    .byte $00 ; |        | $1E3D
    .byte $00 ; |        | $1E3E
    .byte $00 ; |        | $1E3F
    .byte $FF ; |XXXXXXXX| $1E40
    .byte $7E ; | XXXXXX | $1E41
    .byte $3C ; |  XXXX  | $1E42
    .byte $18 ; |   XX   | $1E43
    .byte $18 ; |   XX   | $1E44
    .byte $10 ; |   X    | $1E45
    .byte $00 ; |        | $1E46
    .byte $00 ; |        | $1E47
    .byte $00 ; |        | $1E48
    .byte $00 ; |        | $1E49
    .byte $3C ; |  XXXX  | $1E4A
    .byte $3C ; |  XXXX  | $1E4B
    .byte $18 ; |   XX   | $1E4C
    .byte $18 ; |   XX   | $1E4D
    .byte $10 ; |   X    | $1E4E
    .byte $10 ; |   X    | $1E4F
    .byte $00 ; |        | $1E50
    .byte $00 ; |        | $1E51
    .byte $00 ; |        | $1E52
    .byte $00 ; |        | $1E53
    .byte $7E ; | XXXXXX | $1E54
    .byte $3C ; |  XXXX  | $1E55
    .byte $3C ; |  XXXX  | $1E56
    .byte $18 ; |   XX   | $1E57
    .byte $18 ; |   XX   | $1E58
    .byte $10 ; |   X    | $1E59
    .byte $00 ; |        | $1E5A
    .byte $00 ; |        | $1E5B
    .byte $00 ; |        | $1E5C
    .byte $00 ; |        | $1E5D
    .byte $00 ; |        | $1E5E
    .byte $00 ; |        | $1E5F
    .byte $00 ; |        | $1E60
    .byte $10 ; |   X    | $1E61
    .byte $00 ; |        | $1E62
    .byte $00 ; |        | $1E63
    .byte $00 ; |        | $1E64
    .byte $00 ; |        | $1E65
    .byte $00 ; |        | $1E66
    .byte $00 ; |        | $1E67
    .byte $00 ; |        | $1E68
    .byte $00 ; |        | $1E69
    .byte $00 ; |        | $1E6A
    .byte $38 ; |  XXX   | $1E6B
    .byte $00 ; |        | $1E6C
    .byte $00 ; |        | $1E6D
    .byte $00 ; |        | $1E6E
    .byte $00 ; |        | $1E6F
    .byte $00 ; |        | $1E70
    .byte $00 ; |        | $1E71
    .byte $00 ; |        | $1E72
    .byte $00 ; |        | $1E73
    .byte $10 ; |   X    | $1E74
    .byte $7C ; | XXXXX  | $1E75
    .byte $10 ; |   X    | $1E76
    .byte $00 ; |        | $1E77
    .byte $00 ; |        | $1E78
    .byte $00 ; |        | $1E79
    .byte $00 ; |        | $1E7A
    .byte $00 ; |        | $1E7B
    .byte $00 ; |        | $1E7C
    .byte $10 ; |   X    | $1E7D
    .byte $38 ; |  XXX   | $1E7E
    .byte $7C ; | XXXXX  | $1E7F
    .byte $FE ; |XXXXXXX | $1E80
    .byte $7C ; | XXXXX  | $1E81
ColHillSkyTab:
    .byte $20 ; |  X     | $1E82   background colors
    .byte $2E ; |  X XXX | $1E83
    .byte $4C ; | X  XX  | $1E84
    .byte $2C ; |  X XX  | $1E85
    .byte $4A ; | X  X X | $1E86
    .byte $2C ; |  X XX  | $1E87
    .byte $7C ; | XXXXX  | $1E88
    .byte $2A ; |  X X X | $1E89
    .byte $7C ; | XXXXX  | $1E8A
    .byte $8C ; |X   XX  | $1E8B
    .byte $8A ; |X   X X | $1E8C
    .byte $8C ; |X   XX  | $1E8D
    .byte $8A ; |X   X X | $1E8E
    .byte $88 ; |X   X   | $1E8F
    .byte $8A ; |X   X X | $1E90
hillShapeLeftPF1:
    .byte $FF ; |XXXXXXXX| $1E91
    .byte $7F ; | XXXXXXX| $1E92
    .byte $3F ; |  XXXXXX| $1E93
    .byte $1F ; |   XXXXX| $1E94
    .byte $0E ; |    XXX | $1E95
    .byte $04 ; |     X  | $1E96
    .byte $00 ; |        | $1E97
    .byte $00 ; |        | $1E98
    .byte $00 ; |        | $1E99
    .byte $00 ; |        | $1E9A
    .byte $00 ; |        | $1E9B
    .byte $00 ; |        | $1E9C
    .byte $00 ; |        | $1E9D
    .byte $00 ; |        | $1E9E
    .byte $00 ; |        | $1E9F
hillShapeLeftPF2:
    .byte $FF ; |XXXXXXXX| $1EA0
    .byte $FF ; |XXXXXXXX| $1EA1
    .byte $F9 ; |XXXXX  X| $1EA2
    .byte $F0 ; |XXXX    | $1EA3
    .byte $E0 ; |XXX     | $1EA4
    .byte $80 ; |X       | $1EA5
    .byte $00 ; |        | $1EA6
    .byte $00 ; |        | $1EA7
    .byte $00 ; |        | $1EA8
    .byte $00 ; |        | $1EA9
    .byte $00 ; |        | $1EAA
    .byte $00 ; |        | $1EAB
    .byte $00 ; |        | $1EAC
    .byte $00 ; |        | $1EAD
    .byte $00 ; |        | $1EAE
L1EAF:
    .byte $FF ; |XXXXXXXX| $1EAF
    .byte $FF ; |XXXXXXXX| $1EB0
    .byte $FF ; |XXXXXXXX| $1EB1
    .byte $EF ; |XXX XXXX| $1EB2
    .byte $83 ; |X     XX| $1EB3
    .byte $01 ; |       X| $1EB4
    .byte $00 ; |        | $1EB5
    .byte $00 ; |        | $1EB6
    .byte $00 ; |        | $1EB7
    .byte $00 ; |        | $1EB8
    .byte $00 ; |        | $1EB9
    .byte $00 ; |        | $1EBA
    .byte $00 ; |        | $1EBB
    .byte $00 ; |        | $1EBC
    .byte $00 ; |        | $1EBD
L1EBE:
    .byte $FF ; |XXXXXXXX| $1EBE
    .byte $FF ; |XXXXXXXX| $1EBF
    .byte $7F ; | XXXXXXX| $1EC0
    .byte $3F ; |  XXXXXX| $1EC1
    .byte $1F ; |   XXXXX| $1EC2
    .byte $0F ; |    XXXX| $1EC3
    .byte $07 ; |     XXX| $1EC4
    .byte $02 ; |      X | $1EC5
    .byte $00 ; |        | $1EC6
    .byte $00 ; |        | $1EC7
    .byte $00 ; |        | $1EC8
    .byte $00 ; |        | $1EC9
    .byte $00 ; |        | $1ECA
    .byte $00 ; |        | $1ECB
    .byte $00 ; |        | $1ECC
ColHillsTab:
    .byte $40 ; | X      | $1ECD   colors
    .byte $30 ; |  XX    | $1ECE
    .byte $20 ; |  X     | $1ECF
    .byte $22 ; |  X   X | $1ED0
    .byte $24 ; |  X  X  | $1ED1
    .byte $24 ; |  X  X  | $1ED2
    .byte $26 ; |  X  XX | $1ED3
    .byte $26 ; |  X  XX | $1ED4
    .byte $00 ; |        | $1ED5
    .byte $00 ; |        | $1ED6
    .byte $80 ; |X       | $1ED7
    .byte $84 ; |X    X  | $1ED8
    .byte $88 ; |X   X   | $1ED9
    .byte $8C ; |X   XX  | $1EDA
    .byte $8F ; |X   XXXX| $1EDB
    .byte $8F ; |X   XXXX| $1EDC
    .byte $8F ; |X   XXXX| $1EDD
    .byte $8F ; |X   XXXX| $1EDE
    .byte $8C ; |X   XX  | $1EDF
    .byte $88 ; |X   X   | $1EE0
    .byte $84 ; |X    X  | $1EE1
    .byte $80 ; |X       | $1EE2
    .byte $00 ; |        | $1EE3
    .byte $FF ; |XXXXXXXX| $1EE4
    .byte $FF ; |XXXXXXXX| $1EE5
    .byte $00 ; |        | $1EE6
    .byte $00 ; |        | $1EE7
    .byte $FF ; |XXXXXXXX| $1EE8
    .byte $FF ; |XXXXXXXX| $1EE9
    .byte $00 ; |        | $1EEA
    .byte $00 ; |        | $1EEB
    .byte $FF ; |XXXXXXXX| $1EEC
    .byte $FF ; |XXXXXXXX| $1EED
    .byte $00 ; |        | $1EEE
    .byte $00 ; |        | $1EEF
    .byte $FF ; |XXXXXXXX| $1EF0
    .byte $FF ; |XXXXXXXX| $1EF1
    .byte $00 ; |        | $1EF2
    .byte $00 ; |        | $1EF3
    .byte $FF ; |XXXXXXXX| $1EF4
    .byte $FF ; |XXXXXXXX| $1EF5
    .byte $00 ; |        | $1EF6
    .byte $00 ; |        | $1EF7
    .byte $FF ; |XXXXXXXX| $1EF8
    .byte $FF ; |XXXXXXXX| $1EF9
    .byte $00 ; |        | $1EFA
    .byte $00 ; |        | $1EFB
    .byte $FF ; |XXXXXXXX| $1EFC
    .byte $FF ; |XXXXXXXX| $1EFD
    .byte $00 ; |        | $1EFE
    .byte $00 ; |        | $1EFF
    .byte $00 ; |        | $1F00
    .byte $42 ; | X    X | $1F01
    .byte $00 ; |        | $1F02
    .byte $42 ; | X    X | $1F03
    .byte $00 ; |        | $1F04
    .byte $42 ; | X    X | $1F05
    .byte $00 ; |        | $1F06
    .byte $42 ; | X    X | $1F07
    .byte $00 ; |        | $1F08
    .byte $42 ; | X    X | $1F09
    .byte $00 ; |        | $1F0A
    .byte $42 ; | X    X | $1F0B
    .byte $00 ; |        | $1F0C
    .byte $42 ; | X    X | $1F0D
    .byte $00 ; |        | $1F0E
    .byte $42 ; | X    X | $1F0F
    .byte $00 ; |        | $1F10
    .byte $42 ; | X    X | $1F11
    .byte $00 ; |        | $1F12
    .byte $42 ; | X    X | $1F13
    .byte $00 ; |        | $1F14
    .byte $42 ; | X    X | $1F15
    .byte $00 ; |        | $1F16
    .byte $42 ; | X    X | $1F17
    .byte $00 ; |        | $1F18
    .byte $42 ; | X    X | $1F19
    .byte $00 ; |        | $1F1A
    .byte $42 ; | X    X | $1F1B
    .byte $00 ; |        | $1F1C
    .byte $42 ; | X    X | $1F1D
    .byte $00 ; |        | $1F1E
    .byte $42 ; | X    X | $1F1F
    .byte $00 ; |        | $1F20
    .byte $42 ; | X    X | $1F21
    .byte $00 ; |        | $1F22
    .byte $42 ; | X    X | $1F23
    .byte $00 ; |        | $1F24
    .byte $42 ; | X    X | $1F25
    .byte $00 ; |        | $1F26
    .byte $42 ; | X    X | $1F27
    .byte $00 ; |        | $1F28
    .byte $42 ; | X    X | $1F29
    .byte $00 ; |        | $1F2A
    .byte $42 ; | X    X | $1F2B
    .byte $00 ; |        | $1F2C
    .byte $42 ; | X    X | $1F2D
    .byte $00 ; |        | $1F2E
    .byte $FF ; |XXXXXXXX| $1F2F
    .byte $00 ; |        | $1F30
    .byte $42 ; | X    X | $1F31
    .byte $00 ; |        | $1F32
    .byte $42 ; | X    X | $1F33
    .byte $00 ; |        | $1F34
    .byte $42 ; | X    X | $1F35
    .byte $00 ; |        | $1F36
    .byte $42 ; | X    X | $1F37
    .byte $00 ; |        | $1F38
    .byte $42 ; | X    X | $1F39
    .byte $00 ; |        | $1F3A
    .byte $42 ; | X    X | $1F3B
    .byte $00 ; |        | $1F3C
    .byte $42 ; | X    X | $1F3D
    .byte $00 ; |        | $1F3E
    .byte $42 ; | X    X | $1F3F
    .byte $00 ; |        | $1F40
    .byte $42 ; | X    X | $1F41
    .byte $00 ; |        | $1F42
    .byte $42 ; | X    X | $1F43
    .byte $00 ; |        | $1F44
    .byte $42 ; | X    X | $1F45
    .byte $00 ; |        | $1F46
    .byte $42 ; | X    X | $1F47
    .byte $00 ; |        | $1F48
    .byte $42 ; | X    X | $1F49
    .byte $00 ; |        | $1F4A
    .byte $42 ; | X    X | $1F4B
    .byte $00 ; |        | $1F4C
    .byte $42 ; | X    X | $1F4D
    .byte $00 ; |        | $1F4E
    .byte $42 ; | X    X | $1F4F
    .byte $00 ; |        | $1F50
    .byte $42 ; | X    X | $1F51
    .byte $00 ; |        | $1F52
    .byte $42 ; | X    X | $1F53
    .byte $00 ; |        | $1F54
    .byte $42 ; | X    X | $1F55
    .byte $00 ; |        | $1F56
    .byte $42 ; | X    X | $1F57
    .byte $00 ; |        | $1F58
    .byte $42 ; | X    X | $1F59
    .byte $00 ; |        | $1F5A
    .byte $42 ; | X    X | $1F5B
    .byte $00 ; |        | $1F5C
    .byte $42 ; | X    X | $1F5D
    .byte $00 ; |        | $1F5E
    .byte $00 ; |        | $1F5F
    .byte $00 ; |        | $1F60
    .byte $00 ; |        | $1F61
    .byte $00 ; |        | $1F62
    .byte $00 ; |        | $1F63
    .byte $00 ; |        | $1F64
    .byte $00 ; |        | $1F65
    .byte $00 ; |        | $1F66
    .byte $00 ; |        | $1F67
    .byte $00 ; |        | $1F68
    .byte $00 ; |        | $1F69
    .byte $00 ; |        | $1F6A
    .byte $00 ; |        | $1F6B
    .byte $00 ; |        | $1F6C
    .byte $00 ; |        | $1F6D
    .byte $00 ; |        | $1F6E
    .byte $00 ; |        | $1F6F
    .byte $00 ; |        | $1F70
    .byte $00 ; |        | $1F71
    .byte $00 ; |        | $1F72
    .byte $00 ; |        | $1F73
    .byte $00 ; |        | $1F74
    .byte $00 ; |        | $1F75
    .byte $FF ; |XXXXXXXX| $1F76
    .byte $FF ; |XXXXXXXX| $1F77
    .byte $00 ; |        | $1F78
    .byte $42 ; | X    X | $1F79
    .byte $00 ; |        | $1F7A
    .byte $42 ; | X    X | $1F7B
    .byte $00 ; |        | $1F7C
    .byte $42 ; | X    X | $1F7D
    .byte $00 ; |        | $1F7E
    .byte $42 ; | X    X | $1F7F
    .byte $00 ; |        | $1F80
    .byte $42 ; | X    X | $1F81
    .byte $00 ; |        | $1F82
    .byte $42 ; | X    X | $1F83
    .byte $00 ; |        | $1F84
    .byte $42 ; | X    X | $1F85
    .byte $00 ; |        | $1F86
    .byte $42 ; | X    X | $1F87
    .byte $06 ; |     XX | $1F88
    .byte $06 ; |     XX | $1F89
    .byte $06 ; |     XX | $1F8A
    .byte $0E ; |    XXX | $1F8B
    .byte $0E ; |    XXX | $1F8C
    .byte $0E ; |    XXX | $1F8D
    .byte $0C ; |    XX  | $1F8E
    .byte $FC ; |XXXXXX  | $1F8F
    .byte $FC ; |XXXXXX  | $1F90
    .byte $FC ; |XXXXXX  | $1F91
    .byte $FC ; |XXXXXX  | $1F92
    .byte $1C ; |   XXX  | $1F93
    .byte $18 ; |   XX   | $1F94
    .byte $18 ; |   XX   | $1F95
    .byte $18 ; |   XX   | $1F96
    .byte $18 ; |   XX   | $1F97
    .byte $18 ; |   XX   | $1F98
    .byte $B8 ; |X XXX   | $1F99
    .byte $B8 ; |X XXX   | $1F9A
    .byte $B0 ; |X XX    | $1F9B
    .byte $F0 ; |XXXX    | $1F9C
    .byte $F0 ; |XXXX    | $1F9D
    .byte $F0 ; |XXXX    | $1F9E
    .byte $E0 ; |XXX     | $1F9F
    .byte $E0 ; |XXX     | $1FA0
    .byte $E0 ; |XXX     | $1FA1
    .byte $E0 ; |XXX     | $1FA2
    .byte $40 ; | X      | $1FA3
    .byte $C3 ; |XX    XX| $1FA4
    .byte $C3 ; |XX    XX| $1FA5
    .byte $C7 ; |XX   XXX| $1FA6
    .byte $C6 ; |XX   XX | $1FA7
    .byte $C6 ; |XX   XX | $1FA8
    .byte $CE ; |XX  XXX | $1FA9
    .byte $CC ; |XX  XX  | $1FAA
    .byte $CC ; |XX  XX  | $1FAB
    .byte $DC ; |XX XXX  | $1FAC
    .byte $D8 ; |XX XX   | $1FAD
    .byte $D8 ; |XX XX   | $1FAE
    .byte $D8 ; |XX XX   | $1FAF
    .byte $DC ; |XX XXX  | $1FB0
    .byte $DC ; |XX XXX  | $1FB1
    .byte $CE ; |XX  XXX | $1FB2
    .byte $CE ; |XX  XXX | $1FB3
    .byte $C7 ; |XX   XXX| $1FB4
    .byte $C7 ; |XX   XXX| $1FB5
    .byte $C3 ; |XX    XX| $1FB6
    .byte $C3 ; |XX    XX| $1FB7
    .byte $C7 ; |XX   XXX| $1FB8
    .byte $C7 ; |XX   XXX| $1FB9
    .byte $CF ; |XX  XXXX| $1FBA
    .byte $FF ; |XXXXXXXX| $1FBB
    .byte $FE ; |XXXXXXX | $1FBC
    .byte $FE ; |XXXXXXX | $1FBD
    .byte $7C ; | XXXXX  | $1FBE
    .byte $38 ; |  XXX   | $1FBF
    .byte $B0 ; |X XX    | $1FC0
    .byte $30 ; |  XX    | $1FC1
    .byte $30 ; |  XX    | $1FC2
    .byte $30 ; |  XX    | $1FC3
    .byte $30 ; |  XX    | $1FC4
    .byte $30 ; |  XX    | $1FC5
    .byte $30 ; |  XX    | $1FC6
    .byte $30 ; |  XX    | $1FC7
    .byte $30 ; |  XX    | $1FC8
    .byte $30 ; |  XX    | $1FC9
    .byte $30 ; |  XX    | $1FCA
    .byte $30 ; |  XX    | $1FCB
    .byte $30 ; |  XX    | $1FCC
    .byte $30 ; |  XX    | $1FCD
    .byte $30 ; |  XX    | $1FCE
    .byte $30 ; |  XX    | $1FCF
    .byte $30 ; |  XX    | $1FD0
    .byte $30 ; |  XX    | $1FD1
    .byte $30 ; |  XX    | $1FD2
    .byte $30 ; |  XX    | $1FD3
    .byte $30 ; |  XX    | $1FD4
    .byte $30 ; |  XX    | $1FD5
    .byte $30 ; |  XX    | $1FD6
    .byte $30 ; |  XX    | $1FD7
    .byte $30 ; |  XX    | $1FD8
    .byte $30 ; |  XX    | $1FD9
    .byte $30 ; |  XX    | $1FDA
    .byte $30 ; |  XX    | $1FDB

    .byte $A5 ; |X X  X X| $1FDC   colors?
    .byte $1B ; |   XX XX| $1FDD
    .byte $C1 ; |XX     X| $1FDE
    .byte $1B ; |   XX XX| $1FDF
    .byte $9E ; |X  XXXX | $1FE0
    .byte $1D ; |   XXX X| $1FE1
    .byte $88 ; |X   X   | $1FE2
    .byte $1F ; |   XXXXX| $1FE3
    .byte $A4 ; |X X  X  | $1FE4
    .byte $1F ; |   XXXXX| $1FE5
    .byte $C0 ; |XX      | $1FE6
    .byte $1F ; |   XXXXX| $1FE7

    .byte $FF ; |XXXXXXXX| $1FE8
    .byte $FF ; |XXXXXXXX| $1FE9
    .byte $00 ; |        | $1FEA
    .byte $00 ; |        | $1FEB
    .byte $FF ; |XXXXXXXX| $1FEC
    .byte $FF ; |XXXXXXXX| $1FED
    .byte $00 ; |        | $1FEE
    .byte $00 ; |        | $1FEF
    .byte $FF ; |XXXXXXXX| $1FF0
    .byte $FF ; |XXXXXXXX| $1FF1
    .byte $00 ; |        | $1FF2
    .byte $00 ; |        | $1FF3
    .byte $FF ; |XXXXXXXX| $1FF4

    jmp    START                 ; 3

    .byte $FF ; |XXXXXXXX| $1FF8
    .byte $FF ; |XXXXXXXX| $1FF9

       ORG $1FFA
      RORG $1FFA

    .word START,START,START


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $2000
      RORG $3000

DoBankswitch:
    lda    BANK_0                   ; bankswitch, goto L1022

;coming from bank 0
    jmp    L3483

FinishOverscan:
.loopWaitOverscan:
    lda    INTIM
    bne    .loopWaitOverscan
    ldx    #$FF
    sta    WSYNC
;---------------------------------------
    stx    VSYNC                    ; Vsync starts
    inx                             ; X=0
    sta    WSYNC
    sta    WSYNC
    sta    WSYNC                    ; 3 scanlines
;---------------------------------------
    stx    VSYNC                    ; Vsync ends
    stx    VBLANK                   ; elecron beam is never turned off...
    lda    #TIME_VBLANK
    sta    TIM64T
    inc    frameCounter
    ldx    $86                   ; 3
    beq    L3055                 ; 2³
    cpx    #4                    ; 2
    beq    L3081                 ; 2³
    lda    frameCounter
    and    #$0F                  ; 2
    bne    L3055                 ; 2³
    lda    $F6                   ; 3
    bpl    L303B                 ; 2³
    lda    frameCounter
    and    #$10                  ; 2
    bne    L3055                 ; 2³
L303B:
    sed                          ; 2
    lda    $85                   ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    $85                   ; 3
    lda    $84                   ; 3
    sbc    #0                    ; 2
    sta    $84                   ; 3
    bcs    L3054                 ; 2³
    ldx    #0                    ; 2
    stx    $84                   ; 3
    stx    $85                   ; 3
    dex                          ; 2
    stx    $F4                   ; 3
L3054:
    cld                          ; 2
L3055:
    cpx    #3                    ; 2
    bne    L3076                 ; 2³
    lda    frameCounter
    bne    L306B                 ; 2³
    lda    $EB                   ; 3
    beq    L306B                 ; 2³
    lda    $F0                   ; 3
    bne    L306B                 ; 2³
    jsr    L3C3E                 ; 6
    jmp    L30C2                 ; 3

L306B:
    jsr    L351E                 ; 6
    lda    #$0A                  ; 2
    ldx    #$33                  ; 2
    ldy    #$20                  ; 2
    bne    L3088                    ; always branch

L3076:
    cpx    #5                    ; 2
    bne    L3081                 ; 2³
    lda    #7                    ; 2
    tay                          ; 2
    ldx    #$2C                  ; 2
    bne    L3088                    ; always branch

L3081:
    cpx    #1                    ; 2
    bne    L30B9                 ; 2³
    inx                          ; 2
    txa                          ; 2
    tay                          ; 2
L3088:
    sta    $F9                   ; 3
L308A:
    lda    $8A,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $F8                   ; 3
    lda    $8A,X                 ; 4
    and    #$0F                  ; 2
    sta    $FA                   ; 3
    lda    #$0E                  ; 2
    sec                          ; 2
    sbc    $F8                   ; 3
    cmp    $FA                   ; 3
    bcs    L30A3                 ; 2³
    inc    $F8                   ; 5
L30A3:
    lda    $F8                   ; 3
    sec                          ; 2
    adc    $8A,X                 ; 4
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    $F8                   ; 3
    sta.wy $87,Y                 ; 5
    dex                          ; 2
    dey                          ; 2
    dec    $F9                   ; 5
    bpl    L308A                 ; 2³
L30B9:
    jsr    L3B1C                 ; 6
    lda    $F4                   ; 3
    bpl    L30C2                 ; 2³
    sta    $DC                   ; 3
L30C2:
    lda    INTIM                 ; 4
    bne    L30C2                 ; 2³
    sta    CXCLR                 ; 3
    jmp    DoBankswitch          ; 3

L30CC:  ;indirect jump
    lda    CXPPMM                ; 3
    bpl    L30DD                 ; 2³
    lda    $AC                   ; 3
    cmp    #5                    ; 2
    bne    L30DD                 ; 2³
    jsr    L3B12                 ; 6
    lda    #6                    ; 2
    sta    $C2                   ; 3
L30DD:
    lda    $C2                   ; 3
    cmp    #$0F                  ; 2
    beq    L3104                 ; 2³+1
    ldx    $DC                   ; 3
    cpx    #$B4                  ; 2
    bcc    L3102                 ; 2³+1
    cmp    #$0E                  ; 2
    bne    L30FF                 ; 2³
    lda    $C9                   ; 3
    cmp    #2                    ; 2
    beq    L30F9                 ; 2³
    jsr    L3A95                 ; 6
    jmp    FinishOverscan

L30F9:
    jsr    L3CA4                 ; 6
    jmp    FinishOverscan

L30FF:
    jsr    L3B53                 ; 6
L3102:
    inc    $DC                   ; 5
L3104:
    lda    $E2                   ; 3
    bne    L3130                 ; 2³
    lda    $94                   ; 3
    cmp    #8                    ; 2
    bne    L3119                 ; 2³
    ldx    $C2                   ; 3
    cpx    #$0F                  ; 2
    bne    L317A                 ; 2³
    dex                             ; X=$0E
    stx    $C2                   ; 3
    bne    L317A                    ; always branch

L3119:
    cmp    #1                    ; 2
    bne    L317A                 ; 2³
    lda    $B4                   ; 3
    clc                          ; 2
    adc    #$1A                  ; 2
    cmp    $DB                   ; 3
    bcs    L312C                 ; 2³
    adc    #$20                  ; 2
    cmp    $DB                   ; 3
    bcs    L317A                 ; 2³
L312C:
    lda    #2                    ; 2
    sta    $E2                   ; 3
L3130:
    dec    $BE                   ; 5
    bpl    L317A                 ; 2³
    ldx    #$2E                  ; 2
L3136:
    lda    $87,X                 ; 4
    sta    $88,X                 ; 4
    dex                          ; 2
    bne    L3136                 ; 2³
    lda    #$17                  ; 2
    sta    $BE                   ; 3
    lda    $A1                   ; 3
    eor    #$FF                  ; 2
    sta    $9F                   ; 3
    inc    $9F                   ; 5
    ldx    #8                    ; 2
    lda    #7                    ; 2
    sta    $A7                   ; 3
    lda    $DF                   ; 3
    beq    L316B                 ; 2³
    dec    $DF                   ; 5
    ldx    #1                    ; 2
    ldy    #$4E                  ; 2
    lda    #7                    ; 2
    sta    $A7                   ; 3
    lda    $90                   ; 3
    cmp    #1                    ; 2
    bne    L316B                 ; 2³
    lda    #5                    ; 2
    sta    $A7                   ; 3
    ldx    #$1C                  ; 2
    ldy    #$43                  ; 2
L316B:
    stx    $8F                   ; 3
    sty    $97                   ; 3
    lda    frameCounter
    and    #$7F                  ; 2
    clc                          ; 2
    adc    #$12                  ; 2
    sta    $AF                   ; 3
    dec    $E2                   ; 5
L317A:
    ldx    #7                    ; 2
L317C:
    lda    $A7,X                 ; 4
    cmp    #5                    ; 2
    beq    L31BC                 ; 2³
    ldy    $F5                   ; 3
    cpy    #5                    ; 2
    bcs    L3191                 ; 2³
    lda    L3D14,Y               ; 4
    bmi    L31E6                 ; 2³
    and    frameCounter
    bne    L31E6                 ; 2³
L3191:
    lda    $E2                   ; 3
    bne    L31A4                 ; 2³
    cpx    #5                    ; 2
    bne    L31A4                 ; 2³
    lda    $E4                   ; 3
    bpl    L31A4                 ; 2³
    lda    $DB                   ; 3
    clc                          ; 2
    adc    $9F,X                 ; 4
    sta    $DB                   ; 3
L31A4:
    lda    $AF,X                 ; 4
    clc                          ; 2
    adc    $9F,X                 ; 4
    sta    $AF,X                 ; 4
    ldy    #1                    ; 2
    cmp    #$20                  ; 2
    bcc    L31B7                 ; 2³
    ldy    #$FF                  ; 2
    cmp    #$81                  ; 2
    bcc    L31E6                 ; 2³
L31B7:
    sty    $9F,X                 ; 4
    jmp    L31E6                 ; 3

L31BC:
    lda    $DC                   ; 3
    cmp    #$44                  ; 2
    bne    L31D6                 ; 2³
    lda    $AF,X                 ; 4
    cmp    #$10                  ; 2
    beq    L31E6                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$07                  ; 2
    clc                          ; 2
    adc    $AF,X                 ; 4
    cmp    #$A8                  ; 2
    bcc    L31D8                 ; 2³
L31D6:
    lda    #$10                  ; 2
L31D8:
    sta    $AF,X                 ; 4
    ldy    #$1C                  ; 2
    lda    frameCounter
    and    #$04                  ; 2
    bne    L31E4                 ; 2³
    ldy    #$2F                  ; 2
L31E4:
    sty    $8F,X                 ; 4
L31E6:
    dex                          ; 2
    bpl    L317C                 ; 2³
    lda    frameCounter
    ldx    $F5                   ; 3
    cpx    #$0B                  ; 2
    bcs    L31F7                 ; 2³
    cpx    #8                    ; 2
    bcs    L31F6                 ; 2³
    lsr                          ; 2
L31F6:
    lsr                          ; 2
L31F7:
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    $AF,X                 ; 4
    cmp    #$10                  ; 2
    bne    L3204                 ; 2³
    inc    $AF,X                 ; 6
L3204:
    lda    $DC                   ; 3
    cmp    #$44                  ; 2
    beq    L320E                 ; 2³
    inc    $DC                   ; 5
    bne    L3214                 ; 2³
L320E:
    jsr    L38E7                 ; 6
    jsr    L340A                 ; 6
L3214:
    jmp    FinishOverscan

L3217:  ;indirect jump
    sed                          ; 2
    ldx    $C9                   ; 3
    lda    #0                    ; 2
    clc                          ; 2
L321D:
    adc    #1                    ; 2
    dex                          ; 2
    bpl    L321D                 ; 2³
    sta    $9F                   ; 3
    cld                          ; 2
    tsx                          ; 2
    lda    $9A                   ; 3
    beq    L323C                 ; 2³
    lda    $C7                   ; 3
    cmp    #$0F                  ; 2
    beq    L3232                 ; 2³
    inc    $C7                   ; 5
L3232:
    dec    $9A                   ; 5
    bne    L3257                 ; 2³
    inc    $9A                   ; 5
    lda    #0                    ; 2
    sta    $9A                   ; 3
L323C:
    lda    $CA                   ; 3
    cmp    #$3C                  ; 2
    bne    L3248                 ; 2³
    ldy    #$60                  ; 2
    sty    $9A                   ; 3
    stx    $CB                   ; 3
L3248:
    clc                          ; 2
    adc    $CB                   ; 3
    sta    $CA                   ; 3
    inx                          ; 2
    stx    $C7                   ; 3
    cmp    #1                    ; 2
    bne    L3257                 ; 2³
    jsr    L3BC7                 ; 6
L3257:
    jmp    FinishOverscan

L325A:  ;indirect jump
    lda    #0                    ; 2
    sta    $C5                   ; 3
    lda    $EB                   ; 3
    bpl    L326F                 ; 2³
    lda    frameCounter
    bne    L326C                 ; 2³
    lda    #1                    ; 2
    sta    $DC                   ; 3
    sta    $EB                   ; 3
L326C:
    jmp    FinishOverscan

L326F:
    lda    $DC                   ; 3
    cmp    #$64                  ; 2
    bne    L3284                 ; 2³
    lda    CXPPMM                ; 3
    bpl    L3284                 ; 2³
    sta    $EB                   ; 3
    jsr    L3B12                 ; 6
    lda    #$80                  ; 2
    sta    frameCounter
    bmi    L326C                    ; always branch

L3284:
    jsr    L3C8E                 ; 6
    lda    $88                   ; 3
    cmp    #$63                  ; 2
    bcs    L3299                 ; 2³
    adc    $8A                   ; 3
    sta    $88                   ; 3
    cmp    #$63                  ; 2
    bcc    L32B0                 ; 2³
    lda    #2                    ; 2
    sta    $89                   ; 3
L3299:
    lda    frameCounter
    and    #$07                  ; 2
    bne    L32A9                 ; 2³
    dec    $89                   ; 5
    bne    L32A9                 ; 2³
    lda    #1                    ; 2
    sta    $88                   ; 3
    bne    L32B0                    ; always branch

L32A9:
    ldx    $89                   ; 3
    lda    L3F1E,X               ; 4
    sta    $C5                   ; 3
L32B0:
    bit    $E4                   ; 3
    bvs    L32BA                 ; 2³
    jsr    L38E7                 ; 6
    jsr    L340A                 ; 6
L32BA:
    lda    $E4                   ; 3
    and    #$20                  ; 2
    beq    L32E1                 ; 2³
    lda    $DB                   ; 3
    cmp    #$42                  ; 2
    bcs    L32CA                 ; 2³
    inc    $DB                      ; ($01 < $DB < $42)
    bne    L3319                    ; always branch, page boundary crossed (+1 cycle)

L32CA:
    cmp    #$4C                  ; 2
    bne    L331F                 ; 2³+1
    dec    $DB                   ; 5
    dec    $DC                   ; 5
    lda    $DC                   ; 3
    cmp    #$64                  ; 2
    bne    L3325                 ; 2³+1
    lda    $E4                   ; 3
    and    #$DF                  ; 2
    sta    $E4                   ; 3
    jmp    L3325                 ; 3

L32E1:
    lda    $DC                   ; 3
    cmp    #$64                  ; 2
    bcs    L32ED                 ; 2³
    lda    #0                    ; 2
    sta    $88                   ; 3
    beq    L3317                    ; always branch, page boundary crossed (+1 cycle)

L32ED:
    ldx    $DB                   ; 3
    cpx    #$4B                  ; 2
    bcs    L3301                 ; 2³+1
    cmp    #$79                  ; 2
    bcc    L3317                 ; 2³+1
    bne    L3325                 ; 2³+1
    dec    $9E                   ; 5
    lda    $E4                   ; 3
    ora    #$20                  ; 2
    bne    L3323                    ; always branch

L3301:
    cpx    #$BA                  ; 2
    bcc    L330B                 ; 2³
    jsr    L3C36                 ; 6
    jmp    FinishOverscan

L330B:
    cpx    #$AD                  ; 2
    bcc    L331F                 ; 2³
    bne    L3313                 ; 2³
    inc    $DB                   ; 5
L3313:
    cmp    #$8E                  ; 2
    bcs    L331F                 ; 2³
L3317:
    inc    $DC                   ; 5
L3319:
    lda    $E4                   ; 3
    ora    #$C0                  ; 2
    bne    L3323                    ; always branch

L331F:
    lda    $E4                   ; 3
    and    #$BF                  ; 2
L3323:
    sta    $E4                   ; 3
L3325:
    jmp    FinishOverscan

L3328:  ;indirect jump
    lda    $DC                   ; 3
    cmp    #5                    ; 2
    bcs    L3332                 ; 2³
    lda    #$7C                  ; 2
    sta    $DB                   ; 3
L3332:
    lda    #$18                  ; 2
    sta    $C6                   ; 3
    lda    #$DC                  ; 2
    sta    COLUP1                ; 3
    lda    CXPPMM                ; 3
    bpl    L3349                 ; 2³
    lda    $ED                   ; 3
    beq    L3349                 ; 2³
    lda    #0                    ; 2
    sta    $ED                   ; 3
    jsr    L3B12                 ; 6
L3349:
    ldx    #2                    ; 2
L334B:
    lda    #0                    ; 2
    sta    $F8                   ; 3
    ldy    $F5                   ; 3
    lda    $87,X                 ; 4
    adc    frameCounter
    adc    $DB                   ; 3
    and    L3CF5,Y               ; 4
    beq    L3375                 ; 2³
    cpy    #6                    ; 2
    bcc    L3368                 ; 2³
    lda    frameCounter
    and    #$03                  ; 2
    bne    L3368                 ; 2³
    inc    $F8                   ; 5
L3368:
    lda    $8A,X                 ; 4
    sec                          ; 2
    sbc    $93,X                 ; 4
    cmp    #$9E                  ; 2
    bcs    L3375                 ; 2³
    cmp    #$3D                  ; 2
    bcs    L337F                 ; 2³
L3375:
    lda    $93,X                 ; 4
    eor    #$FF                  ; 2
    sta    $93,X                 ; 4
    inc    $93,X                 ; 6
    bne    L3381                 ; 2³
L337F:
    sta    $8A,X                 ; 4
L3381:
    dec    $F8                   ; 5
    bpl    L3368                 ; 2³
    lda    frameCounter
    and    #$01                  ; 2
    bne    L33A2                 ; 2³
    lda    $96,X                 ; 4
    clc                          ; 2
    adc    $90,X                 ; 4
    bmi    L3396                 ; 2³
    cmp    #$12                  ; 2
    bcc    L33A0                 ; 2³
L3396:
    lda    $90,X                 ; 4
    eor    #$FF                  ; 2
    sta    $90,X                 ; 4
    inc    $90,X                 ; 6
    bne    L33B2                 ; 2³
L33A0:
    sta    $96,X                 ; 4
L33A2:
    ldy    #$62                  ; 2
    lda    frameCounter
    and    #$08                  ; 2
    bne    L33AC                 ; 2³
    ldy    #$9A                  ; 2
L33AC:
    tya                          ; 2
    clc                          ; 2
    adc    $96,X                 ; 4
    sta    $8D,X                 ; 4
L33B2:
    dex                          ; 2
    bpl    L334B                 ; 2³
    lda    $ED                   ; 3
    cmp    #6                    ; 2
    bne    L33D1                 ; 2³
    lda    $DC                   ; 3
    cmp    #$C0                  ; 2
    bne    L33D1                 ; 2³
    lda    $C9                   ; 3
    beq    L33CB                 ; 2³
    jsr    L3AD6                 ; 6
    jmp    FinishOverscan

L33CB:
    jsr    L3CA4                 ; 6
    jmp    FinishOverscan

L33D1:
    ldx    $ED                   ; 3
    lda    $DC                   ; 3
    cmp    L3401,X               ; 4
    beq    L33DE                 ; 2³
    inc    $DC                   ; 5
    bne    L33FE                 ; 2³
L33DE:
    txa                          ; 2
    ldy    $DB                   ; 3
    lsr                          ; 2
    bcc    L33EE                 ; 2³
    cpy    #$76                  ; 2
    bcc    L33F8                 ; 2³
    cpy    #$84                  ; 2
    bcs    L33F8                 ; 2³
    bcc    L33F6                    ; always branch

L33EE:
    cpy    #$44                  ; 2
    bcc    L33F6                 ; 2³
    cpy    #$B6                  ; 2
    bcc    L33F8                 ; 2³
L33F6:
    inc    $ED                   ; 5
L33F8:
    jsr    L38E7                 ; 6
    jsr    L340A                 ; 6
L33FE:
    jmp    FinishOverscan

L3401:
    .byte $12 ; |   X  X | $3401
    .byte $34 ; |  XX X  | $3402
    .byte $4A ; | X  X X | $3403
    .byte $6C ; | XX XX  | $3404
    .byte $82 ; |X     X | $3405
L3406:
    .byte $A4 ; |X X  X  | $3406
    .byte $03 ; |      XX| $3407
    .byte $01 ; |       X| $3408
    .byte $00 ; |        | $3409

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L340A SUBROUTINE
    lda    $F6                   ; 3
    bne    L3427                 ; 2³
    lda    $E4                   ; 3
    and    #$F7                  ; 2
    bit    SWCHA                 ; 4
    bpl    L341B                 ; 2³
    bvs    L344C                 ; 2³
    ora    #$08                  ; 2
L341B:
    sta    $E4                   ; 3
    lda    #$0D                  ; 2
    bit    INPT4                 ; 3
    bmi    L343A                 ; 2³
    lda    #4                    ; 2
    bne    L343A                    ; always branch

L3427:
    lda    $E6                   ; 3
    beq    L3435                 ; 2³
    lda    $DE                   ; 3
    sta    $DA                   ; 3
    lda    $E4                   ; 3
    eor    #$08                  ; 2
    sta    $E4                   ; 3
L3435:
    lda    $DE                   ; 3
    sec                          ; 2
    sbc    $DA                   ; 3
L343A:
    cmp    #$0D                  ; 2
    bcs    L3454                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    beq    L344C                 ; 2³
    tax                          ; 2
    lda    frameCounter
    and    L3406,X               ; 4
    beq    L3454                 ; 2³
    bne    L3482                    ; always branch

L344C:
    lda    $E4                   ; 3
    ora    #$80                  ; 2
    sta    $E4                   ; 3
    bmi    L3482                    ; always branch

L3454:
    lda    $DB                   ; 3
    and    #$03                  ; 2
    bne    L3464                 ; 2³
    lda    #8                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDC0                 ; 3
    lda    #1                    ; 2
    sta    AUDF0                 ; 3
L3464:
    ldx    #$FF                  ; 2
    lda    $E4                   ; 3
    and    #$08                  ; 2
    bne    L346E                 ; 2³
    ldx    #1                    ; 2
L346E:
    txa                          ; 2
    clc                          ; 2
    adc    $DB                   ; 3
    cmp    #$3D                  ; 2
    bcc    L3482                 ; 2³
    cmp    #$BC                  ; 2
    bcs    L3482                 ; 2³
    sta    $DB                   ; 3
    lda    $E4                   ; 3
    and    #$7F                  ; 2
    sta    $E4                   ; 3
L3482:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3483:
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    ldx    $86                   ; 3
    bpl    L3490                 ; 2³
    jsr    L3BC7                 ; 6
    ldx    #0                    ; 2
L3490:
    lda    IndirectLoTab2,X
    sta    $FE                   ; 3
    lda    IndirectHiTab2,X
    sta    $FF                   ; 3
    jmp.ind ($00FE)              ; 5

IndirectLoTab2:
    .byte <L36FC         ; $349D
    .byte <L3328         ; $349E
    .byte <L325A         ; $349F
    .byte <L359F         ; $34A0
    .byte <L3217         ; $34A1
    .byte <L30CC         ; $34A2
    .byte <L39B0         ; $34A3
    .byte <L3959         ; $34A4
IndirectHiTab2:
    .byte >L36FC         ; $34A5
    .byte >L3328         ; $34A6
    .byte >L325A         ; $34A7
    .byte >L359F         ; $34A8
    .byte >L3217         ; $34A9
    .byte >L30CC         ; $34AA
    .byte >L39B0         ; $34AB
    .byte >L3959         ; $34AC


    ldx    $E9                   ; 3
    beq    L3511                 ; 2³+1
    bmi    L351D                 ; 2³+1
    dec    $E8                   ; 5
    bne    L34FC                 ; 2³
    lda    L3D63,X               ; 4
    ldy    L3E38,X               ; 4
    cpx    #$14                  ; 2
    bcc    L34CB                 ; 2³
    lda    #4                    ; 2
    ldy    #0                    ; 2
    cpx    #$34                  ; 2
    bne    L34CB                 ; 2³
    ldy    #$10                  ; 2
L34CB:
    sta    AUDC0                 ; 3
    sty    $F2                   ; 3
    lda    L3D76,X               ; 4
    sta    AUDC1                 ; 3
    lda    L3D89,X               ; 4
    sta    AUDF0                 ; 3
    lda    L3DBD,X               ; 4
    sta    AUDF1                 ; 3
    lda    L3DD0,X               ; 4
    sta    $E8                   ; 3
    lda    L3E04,X               ; 4
    sta    $E7                   ; 3
    lda    L3E4B,X               ; 4
    cpx    #$13                  ; 2
    bcc    L34F1                 ; 2³
    lda    #0                    ; 2
L34F1:
    sta    $F3                   ; 3
    inx                          ; 2
    cpx    #$36                  ; 2
    bne    L34FA                 ; 2³
    ldx    #0                    ; 2
L34FA:
    stx    $E9                   ; 3
L34FC:
    lda    $E8                   ; 3
    cmp    $F2                   ; 3
    bcs    L350F                 ; 2³
    lda    frameCounter
    lsr                          ; 2
    bcc    L350F                 ; 2³
    lda    $E7                   ; 3
    cmp    $F3                   ; 3
    beq    L350F                 ; 2³
    dec    $E7                   ; 5
L350F:
    ldx    $E7                   ; 3
L3511:
    stx    AUDV0                 ; 3
    ldy    $E9                   ; 3
    cpy    #$15                  ; 2
    bcc    L351B                 ; 2³
    ldx    #0                    ; 2
L351B:
    stx    AUDV1                 ; 3
L351D:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L351E SUBROUTINE
    lda    $F0                   ; 3
    bne    L3558                 ; 2³
    ldx    #0                    ; 2
    lda    $EB                   ; 3
    bmi    L3556                 ; 2³
    dec    $E8                   ; 5
    bpl    L354B                 ; 2³
    ldx    $E9                   ; 3
    lda    L3ECE,X               ; 4
    sta    AUDF1                 ; 3
    ldx    #0                    ; 2
    lda    $ED                   ; 3
    bmi    L3556                 ; 2³
    lsr                          ; 2
    clc                          ; 2
    adc    #5                    ; 2
    sta    $E8                   ; 3
    lda    #8                    ; 2
    sta    $E7                   ; 3
    dec    $E9                   ; 5
    bpl    L354B                 ; 2³
    lda    #$3B                  ; 2
    sta    $E9                   ; 3
L354B:
    ldx    $E7                   ; 3
    beq    L3556                 ; 2³
    lda    frameCounter
    lsr                          ; 2
    bcc    L3556                 ; 2³
    dec    $E7                   ; 5
L3556:
    stx    AUDV1                 ; 3
L3558:
    lda    $BE                   ; 3
    beq    L355F                 ; 2³
    dec    $BE                   ; 5
    rts                          ; 6

L355F:
    lda    $F6                   ; 3
    bne    L3566                 ; 2³
    jmp    L38D0                 ; 3

L3566:
    jsr    L38E7                 ; 6
    jsr    L3C21                 ; 6
    beq    L3572                 ; 2³
    lda    #$D2                  ; 2
    sta    $F8                   ; 3
L3572:
    ldx    #5                    ; 2
    lda    $F8                   ; 3
    sec                          ; 2
    sbc    $EA                   ; 3
    bcs    L357F                 ; 2³
    ldx    #$FB                  ; 2
    eor    #$FF                  ; 2
L357F:
    cmp    #5                    ; 2
    bcc    L3589                 ; 2³
    txa                          ; 2
    clc                          ; 2
    adc    $EA                   ; 3
    sta    $F8                   ; 3
L3589:
    lda    $F8                   ; 3
    sta    $EA                   ; 3
    lda    $F8                   ; 3
    ldx    #$40                  ; 2
    cmp    #$40                  ; 2
    bcc    L359C                 ; 2³
    ldx    #$B9                  ; 2
    cmp    #$B9                  ; 2
    bcs    L359C                 ; 2³
    tax                          ; 2
L359C:
    stx    $DB                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L359F:  ;indirect jump
    ldx    $ED                   ; 3
    cpx    #1                    ; 2
    bne    L35CF                 ; 2³
    lda    $DF                   ; 3
    bpl    L35CF                 ; 2³
    lda    $BE                   ; 3
    bne    L35CF                 ; 2³
    jsr    L3B07                 ; 6
    lda    #4                    ; 2
    sta    $86                   ; 3
    ldy    #1                    ; 2
    sty    $CA                   ; 3
    sty    $CB                   ; 3
    dey                          ; 2
    sty    AUDV1                 ; 3
    sty    $9A                   ; 3
    jsr    L3A87                 ; 6
    inc    $C9                   ; 5
    lda    $F5                   ; 3
    cmp    #$0C                  ; 2
    beq    L35CC                 ; 2³
    inc    $F5                   ; 5
L35CC:
    jmp    FinishOverscan

L35CF:
    lda    $EB                   ; 3
    bmi    L35CC                 ; 2³
    cpx    #8                    ; 2
    beq    L3628                 ; 2³+1
    lda    $DF                   ; 3
    bmi    L3628                 ; 2³+1
    dec    $BF                   ; 5
    bpl    L3628                 ; 2³+1
    lda    L3D5C,X               ; 4
    sta    $BF                   ; 3
    inc    $CA                   ; 5
    lda    $CA                   ; 3
    cmp    #$11                  ; 2
    bne    L3628                 ; 2³+1
    inc    $ED                   ; 5
    ldx    #$36                  ; 2
L35F0:
    lda    $86,X                 ; 4
    sta    $87,X                 ; 4
    dex                          ; 2
    bne    L35F0                 ; 2³
    stx    $CA                   ; 3
    lda    #$80                  ; 2
    sta    $B3                   ; 3
    ldy    #0                    ; 2
    lda    $F5                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    eor    #$03                  ; 2
    and    $DF                   ; 3
    beq    L360B                 ; 2³
    ldy    #9                    ; 2
L360B:
    sty    $92                   ; 3
    inx                          ; 2
    lda    frameCounter
    lsr                          ; 2
    bcc    L3615                 ; 2³
    ldx    #$FF                  ; 2
L3615:
    ldy    #$25                  ; 2
    lda    $A9                   ; 3
    cmp    #$25                  ; 2
    bne    L3624                 ; 2³
    jsr    L36D5                 ; 6
    ldy    #$A0                  ; 2
    ldx    #0                    ; 2
L3624:
    sty    $A8                   ; 3
    stx    $87                   ; 3
L3628:
    lda    $BE                   ; 3
    bne    L3645                 ; 2³
    ldx    $ED                   ; 3
    lda    $B2,X                 ; 4
    clc                          ; 2
    adc    #$2F                  ; 2
    cmp    $DB                   ; 3
    bcs    L3645                 ; 2³
    adc    #7                    ; 2
    cmp    $DB                   ; 3
    bcc    L3645                 ; 2³
    lda    #$22                  ; 2
    sta    $BE                   ; 3
    dec    $ED                   ; 5
    dec    $ED                   ; 5
L3645:
    ldx    $ED                   ; 3
    lda    L3D51,X               ; 4
    clc                          ; 2
    adc    $CA                   ; 3
    adc    $BE                   ; 3
    adc    #7                    ; 2
    sta    $DC                   ; 3
    dec    $C0                   ; 5
    bpl    L365B                 ; 2³
    lda    #$3F                  ; 2
    sta    $C0                   ; 3
L365B:
    ldy    #0                    ; 2
    lda    $C0                   ; 3
    cmp    #$18                  ; 2
    bcs    L3669                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    ldy    L3D4B,X               ; 4
L3669:
    sty    $F8                   ; 3
    ldx    #$0A                  ; 2
L366D:
    lda    $87,X                 ; 4
    beq    L36C2                 ; 2³
    lda    $92,X                 ; 4
    cmp    #9                    ; 2
    beq    L36AD                 ; 2³
    lda    $F8                   ; 3
    sta    $92,X                 ; 4
    bit    $F6                   ; 3
    bpl    L3683                 ; 2³
    cmp    #$3B                  ; 2
    bne    L36AD                 ; 2³
L3683:
    cpx    $ED                   ; 3
    bne    L36AD                 ; 2³
    lda    $BE                   ; 3
    bne    L36AD                 ; 2³
    lda    $B3,X                 ; 4
    adc    #$2C                  ; 2
    cmp    $DB                   ; 3
    bcs    L36AD                 ; 2³
    adc    #8                    ; 2
    cmp    $DB                   ; 3
    bcc    L36AD                 ; 2³
    lda    #$4C                  ; 2
    sta    $92,X                 ; 4
    jsr    L3B12                 ; 6
    lda    #$40                  ; 2
    sta    frameCounter
    lda    #$FF                  ; 2
    sta    $EB                   ; 3
    sta    $DC                   ; 3
    jmp    FinishOverscan

L36AD:
    lda    $B3,X                 ; 4
    sec                          ; 2
    sbc    $87,X                 ; 4
    sta    $B3,X                 ; 4
    ldy    #1                    ; 2
    cmp    #$8A                  ; 2
    beq    L36C0                 ; 2³
    ldy    #$FF                  ; 2
    cmp    #$14                  ; 2
    bne    L36C2                 ; 2³
L36C0:
    sty    $87,X                 ; 4
L36C2:
    dex                          ; 2
    bpl    L366D                 ; 2³
    lda    frameCounter
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    tax                          ; 2
    lda    L3F0A,X               ; 4
    sta    $C3                   ; 3
    jmp    FinishOverscan

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L36D5 SUBROUTINE
    lda    frameCounter
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    $DB                   ; 3
    and    #$7F                  ; 2
L36DE:
    adc    #$24                  ; 2
    cmp    #$70                  ; 2
    bcc    L36E5                 ; 2³
    lsr                          ; 2
L36E5:
    sta    $B3                   ; 3
    sbc    #8                    ; 2
    cmp    $B5                   ; 3
    bcs    L36F3                 ; 2³
    adc    #$10                  ; 2
    cmp    $B5                   ; 3
    bcs    L36DE                 ; 2³
L36F3:
    dec    $DF                   ; 5
    bmi    L36FB                 ; 2³
    lda    #$5C                  ; 2
    sta    $92                   ; 3
L36FB:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L36FC:  ;indirect jump
    lda    $EC                   ; 3
    bne    L3711                 ; 2³
    tsx                          ; 2
    lda    $E6                   ; 3
    bmi    L370A                 ; 2³
    lda    INPT4                 ; 3
    bmi    L370E                 ; 2³
    inx                          ; 2
L370A:
    inc    $EC                   ; 5
    stx    $F6                   ; 3
L370E:
    jmp    L3885                 ; 3

L3711:
    ldx    #0                    ; 2
    lda    $E9                   ; 3
    beq    L371B                 ; 2³
    dec    $E9                   ; 5
    ldx    #8                    ; 2
L371B:
    stx    AUDV1                 ; 3
    adc    #8                    ; 2
    sta    AUDF1                 ; 3
    lda    $9F                   ; 3
    cmp    #0                    ; 2
    beq    L3790                 ; 2³
    ldx    #$38                  ; 2
    cmp    #$5A                  ; 2
    bcc    L372F                 ; 2³
    ldx    #$40                  ; 2
L372F:
    stx    $F8                   ; 3
    lda    $DB                   ; 3
    sec                          ; 2
    sbc    $F8                   ; 3
    cmp    $89                   ; 3
    bcs    L3790                 ; 2³
    adc    #8                    ; 2
    cmp    $89                   ; 3
    bcc    L3790                 ; 2³
    lda    $9F                   ; 3
    cmp    #$5A                  ; 2
    bcc    L3772                 ; 2³
    ldx    #0                    ; 2
    stx    $85                   ; 3
    stx    $DC                   ; 3
    stx    $ED                   ; 3
    stx    AUDV1                 ; 3
    inx                          ; 2
    stx    $86                   ; 3
    txa                          ; 2
    ldx    #8                    ; 2
L3756:
    sta    $90,X                 ; 4
    dex                          ; 2
    bpl    L3756                 ; 2³
    ldy    #$15                  ; 2
    jsr    L3A8E                 ; 6
    lda    frameCounter
    ldx    #2                    ; 2
L3764:
    and    #$3F                  ; 2
    adc    #$4C                  ; 2
    sta    $8A,X                 ; 4
    adc    frameCounter
    dex                          ; 2
    bpl    L3764                 ; 2³
    jmp    FinishOverscan

L3772:
    lda    #0                    ; 2
    sta    $9F                   ; 3
    lda    $85                   ; 3
    ldx    $84                   ; 3
    jsr    L3CD6                 ; 6
    sed                          ; 2
    lda    $85                   ; 3
    clc                          ; 2
    adc    #5                    ; 2
    sta    $85                   ; 3
    lda    $84                   ; 3
    adc    #0                    ; 2
    sta    $84                   ; 3
    cld                          ; 2
    lda    #8                    ; 2
    sta    $E9                   ; 3
L3790:
    lda    $9F                   ; 3
    cmp    #$5A                  ; 2
    bcc    L3799                 ; 2³
    jmp    L389D                 ; 3

L3799:
    lda    frameCounter
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    sta    $F8                   ; 3
    lda    frameCounter
    and    #$07                  ; 2
    sta    $F9                   ; 3
    ldx    #9                    ; 2
L37A9:
    lda    $B3,X                 ; 4
    beq    L37B1                 ; 2³
    eor    $F8                   ; 3
    sta    $B3,X                 ; 4
L37B1:
    lda    $F9                   ; 3
    bne    L37C1                 ; 2³
    lda    $87,X                 ; 4
    beq    L37C1                 ; 2³
    sec                          ; 2
    sbc    L3F82,X               ; 4
    bcc    L37C1                 ; 2³
    sta    $87,X                 ; 4
L37C1:
    dex                          ; 2
    bpl    L37A9                 ; 2³
    lda    $F6                   ; 3
    bmi    L37DA                 ; 2³
    lda    $CA                   ; 3
    bne    L37DA                 ; 2³
    lda    $9E                   ; 3
    cmp    #0                    ; 2
    beq    L37DA                 ; 2³
    lda    #0                    ; 2
    sta    $84                   ; 3
    lda    #5                    ; 2
    sta    $85                   ; 3
L37DA:
    dec    $BF                   ; 5
    bmi    L37E1                 ; 2³
    jmp    L3885                 ; 3

L37E1:
    ldx    #1                    ; 2
    ldy    #4                    ; 2
    lda    $F6                   ; 3
    bne    L37ED                 ; 2³
    ldy    #2                    ; 2
    ldx    #0                    ; 2
L37ED:
    stx    $F8                   ; 3
    ldx    $F5                   ; 3
L37F1:
    dey                          ; 2
    cpy    $F8                   ; 3
    beq    L37F9                 ; 2³
    dex                          ; 2
    bpl    L37F1                 ; 2³
L37F9:
    sty    $BF                   ; 3
    inc    $CB                   ; 5
    inc    $CA                   ; 5
    lda    $CA                   ; 3
    cmp    #$0A                  ; 2
    beq    L3808                 ; 2³
    jmp    L3885                 ; 3

L3808:
    ldx    #0                    ; 2
    stx    $CA                   ; 3
    lda    #$FF                  ; 2
    sta    $CB                   ; 3
L3810:
    lda    $9E,X                 ; 4
    cmp    #0                    ; 2
    beq    L3832                 ; 2³
    cmp    #$5A                  ; 2
    bcc    L382F                 ; 2³
    tay                          ; 2
    lda    #0                    ; 2
    sta    $B3,X                 ; 4
    lda    L3F78,X               ; 4
    sta    $92,X                 ; 4
    tya                          ; 2
    cmp    #$78                  ; 2
    beq    L3832                 ; 2³
    clc                          ; 2
    adc    #$0A                  ; 2
    jmp    L3832                 ; 3

L382F:
    lda    L3F6F,X               ; 4
L3832:
    sta    $9D,X                 ; 4
    lda    #0                    ; 2
    sta    $9E,X                 ; 4
    lda    $88,X                 ; 4
    sta    $87,X                 ; 4
    inx                          ; 2
    cpx    #9                    ; 2
    bne    L3810                 ; 2³
    lda    $88                   ; 3
    sec                          ; 2
    sbc    #8                    ; 2
    bcc    L384A                 ; 2³
    sta    $88                   ; 3
L384A:
    lda    $DF                   ; 3
    bmi    L3885                 ; 2³
    dec    $DF                   ; 5
    bpl    L3857                 ; 2³
    lda    #$5A                  ; 2
    jmp    L3859                 ; 3

L3857:
    lda    #$0E                  ; 2
L3859:
    sta    $A6                   ; 3
    ldx    $F5                   ; 3
    ldx    #$0A                  ; 2
    lda    $E0                   ; 3
    sta    $90                   ; 3
    clc                          ; 2
    adc    $E1                   ; 3
    tay                          ; 2
    lda    frameCounter
    and    L3D3E,X               ; 4
    beq    L3878                 ; 2³
    tya                          ; 2
    cmp    #$A0                  ; 2
    bcs    L3878                 ; 2³
    cmp    L3D31,X               ; 4
    bcs    L3883                 ; 2³
L3878:
    lda    $E1                   ; 3
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
    sta    $E1                   ; 3
    bne    L3885                 ; 2³
L3883:
    sta    $E0                   ; 3
L3885:
    ldx    #$28                  ; 2
    lda    frameCounter
    and    #$10                  ; 2
    bne    L388F                 ; 2³
    ldx    #$5A                  ; 2
L388F:
    txa                          ; 2
    sec                          ; 2
    sbc    $CA                   ; 3
    ldx    #3                    ; 2
L3895:
    sta    $AA,X                 ; 4
    sec                          ; 2
    sbc    #$0A                  ; 2
    dex                          ; 2
    bpl    L3895                 ; 2³
L389D:
    lda    $EC                   ; 3
    beq    L38AB                 ; 2³
    lda    $F6                   ; 3
    bne    L38AB                 ; 2³
    jsr    L38D0                 ; 6
    jmp    FinishOverscan

L38AB:
    lda    #$D0                  ; 2
    ldx    #$50                  ; 2
    jsr    L38E7                 ; 6
    jsr    L3C21                 ; 6
    tax                          ; 2
    bne    L38CD                 ; 2³
    lda    $F8                   ; 3
    ldx    #$20                  ; 2
    cmp    #$20                  ; 2
    bcc    L38C7                 ; 2³
    ldx    #$A0                  ; 2
    cmp    #$A0                  ; 2
    bcs    L38C7                 ; 2³
    tax                          ; 2
L38C7:
    txa                          ; 2
    clc                          ; 2
    adc    #$20                  ; 2
    sta    $DB                   ; 3
L38CD:
    jmp    FinishOverscan

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;also jumped to from $3563

L38D0 SUBROUTINE
    lda    #2                    ; 2
    bit    SWCHA                 ; 4
    bpl    L38D9                 ; 2³
    lda    #$FE                  ; 2
L38D9:
    clc                          ; 2
    adc    $DB                   ; 3
    cmp    #$40                  ; 2
    bcc    L38E6                 ; 2³
    cmp    #$C0                  ; 2
    bcs    L38E6                 ; 2³
    sta    $DB                   ; 3
L38E6:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L38E7 SUBROUTINE
    lda    SWCHA
    and    #$04                     ; check P1 joystick, left direction
    bne    L3954                    ; - not pressed
    ldx    #$10                     ; - pressed
L38F0:
    sec                          ; 2
    lda    SWCHA
    and    #$08                     ; check P1 joystick, right direction
    bne    L38F9                    ; - not pressed
    clc                             ; - pressed
L38F9:
    ror    $F9                   ; 5
    ror    $F8                   ; 5
    lda    SWCHA                 ; 4
    and    #$FE                  ; 2
    sta    SWCHA                 ; 4
    ora    #$01                  ; 2
    sta    SWCHA                 ; 4
    dex                          ; 2
    bne    L38F0                 ; 2³+1
    lda    SWCHA                 ; 4
    and    #$FC                  ; 2
    sta    SWCHA                 ; 4
    ora    #$02                  ; 2
    sta    SWCHA                 ; 4
    and    #$FC                  ; 2
    sta    SWCHA                 ; 4
    lda    $F9                   ; 3
    ldx    $F8                   ; 3
    cmp    #$27                  ; 2
    bcc    L3954                 ; 2³
    cmp    #$65                  ; 2
    bcc    L393E                 ; 2³
    lda    $E5                   ; 3
    bne    L3954                 ; 2³
    lda    #$FF                  ; 2
    sta    $E6                   ; 3
    sta    $E5                   ; 3
    lda    $DE                   ; 3
    sta    $DA                   ; 3
    lda    $DD                   ; 3
    sta    $D9                   ; 3
    rts                          ; 6

L393E:
    sta    $DE                   ; 3
    stx    $DD                   ; 3
    ldy    #0                    ; 2
    sty    $E5                   ; 3
    cmp    $DA                   ; 3
    bcc    L3950                 ; 2³
    bne    L3954                 ; 2³
    cpx    $D9                   ; 3
    bcs    L3954                 ; 2³
L3950:
    sta    $DA                   ; 3
    stx    $D9                   ; 3
L3954:
    lda    #0                    ; 2
    sta    $E6                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3959:  ;indirect jump
    lda    $ED                   ; 3
    bmi    L396A                 ; 2³
    lda    CXPPMM                ; 3
    bpl    L396A                 ; 2³
    lda    #$FF                  ; 2
    sta    $ED                   ; 3
    sta    $E3                   ; 3
    jsr    L3B12                 ; 6
L396A:
    ldx    #5                    ; 2
L396C:
    dec    $87,X                 ; 6
    bne    L3978                 ; 2³
    lda    $B3,X                 ; 4
    sta    $87,X                 ; 4
    lda    #1                    ; 2
    sta    $A8,X                 ; 4
L3978:
    lda    $A8,X                 ; 4
    clc                          ; 2
    adc    $9D,X                 ; 4
    sta    $9D,X                 ; 4
    ldy    #$FF                  ; 2
    cmp    #$70                  ; 2
    beq    L398A                 ; 2³
    iny                          ; 2
    cmp    #$5E                  ; 2
    bne    L398C                 ; 2³
L398A:
    sty    $A8,X                 ; 4
L398C:
    dex                          ; 2
    bpl    L396C                 ; 2³
    lda    $DC                   ; 3
    cmp    #$B9                  ; 2
    bne    L39AD                 ; 2³
    lda    $E3                   ; 3
    bne    L399F                 ; 2³
    jsr    L3CA4                 ; 6
    jmp    FinishOverscan

L399F:
    lda    #$80                  ; 2
    sta    $DB                   ; 3
    lda    #0                    ; 2
    sta    $DC                   ; 3
    sta    $E3                   ; 3
    lda    #6                    ; 2
    sta    $ED                   ; 3
L39AD:
    jmp    L3A3A                 ; 3

L39B0:  ;indirect jump
    lda    $DF                   ; 3
    bmi    L39C6                 ; 2³
    dec    $BF                   ; 5
    bpl    L39C1                 ; 2³
    ldx    $F5                   ; 3
    lda    L3CE9-1,X             ; 4
    sta    $BF                   ; 3
    bpl    L39DE                 ; 2³
L39C1:
    ldx    $F6                   ; 3
    inx                          ; 2
    stx    $F8                   ; 3
L39C6:
    ldx    #5                    ; 2
L39C8:
    dec    $9D,X                 ; 6
    dec    $9C,X                 ; 6
    bpl    L39D6                 ; 2³
    lda    #$2F                  ; 2
    sta    $9C,X                 ; 4
    lda    #$47                  ; 2
    sta    $9D,X                 ; 4
L39D6:
    dex                          ; 2
    dex                          ; 2
    bpl    L39C8                 ; 2³
    dec    $F8                   ; 5
    bpl    L39C6                 ; 2³
L39DE:
    ldy    #2                    ; 2
    lda    $DB                   ; 3
L39E2:
    cmp    L3E6A,Y               ; 4
    bcc    L39EC                 ; 2³
    cmp    L3E6D,Y               ; 4
    bcc    L39F1                 ; 2³
L39EC:
    dey                          ; 2
    bpl    L39E2                 ; 2³
    bmi    L3A22                    ; always branch, page boundary crossed (+1 cycle)

L39F1:
    ldx    $ED                   ; 3
    lda    $92,X                 ; 4
    cmp    L3E70,Y               ; 4
    bcc    L3A22                 ; 2³+1
    lda    $9D,X                 ; 4
    and    #$FE                  ; 2
    cmp    #$28                  ; 2
    beq    L3A16                 ; 2³
    bcs    L3A22                 ; 2³
    cmp    #$18                  ; 2
    bcc    L3A22                 ; 2³
    lda    $DD                   ; 3
    sta    $D9                   ; 3
    lda    $DE                   ; 3
    sta    $DA                   ; 3
    lda    #$10                  ; 2
    sta    $E0                   ; 3
    bne    L3A22                    ; always branch

L3A16:
    lda    L3E73,Y               ; 4
    sta    $ED                   ; 3
    lda    #$FF                  ; 2
    sta    $DF                   ; 3
    jsr    L3B12                 ; 6
L3A22:
    lda    $DC                   ; 3
    cmp    #$B9                  ; 2
    bne    L3A3A                 ; 2³
    lda    $C9                   ; 3
    cmp    #1                    ; 2
    beq    L3A34                 ; 2³
    jsr    L3B4B                 ; 6
    jmp    FinishOverscan

L3A34:
    jsr    L3CA4                 ; 6
    jmp    FinishOverscan

L3A3A:
    ldx    $ED                   ; 3
    inx                          ; 2
    lda    L3E76,X               ; 4
    cmp    $DC                   ; 3
    beq    L3A4E                 ; 2³
    bcs    L3A4A                 ; 2³
    dec    $DC                   ; 5
    bne    L3A84                 ; 2³
L3A4A:
    inc    $DC                   ; 5
    bne    L3A84                 ; 2³
L3A4E:
    lda    #0                    ; 2
    sta    $DF                   ; 3
    lda    CXM0P                 ; 3
    eor    CXP0FB                ; 3
    and    #$40                  ; 2
    beq    L3A66                 ; 2³
    lda    $DB                   ; 3
    cmp    #$42                  ; 2
    bcc    L3A64                 ; 2³
    cmp    #$B3                  ; 2
    bcc    L3A66                 ; 2³
L3A64:
    dec    $ED                   ; 5
L3A66:
    lda    $E0                   ; 3
    beq    L3A7E                 ; 2³
    dec    $E0                   ; 5
    ldx    #1                    ; 2
    lda    $E4                   ; 3
    and    #$08                  ; 2
    bne    L3A76                 ; 2³
    ldx    #$FF                  ; 2
L3A76:
    txa                          ; 2
    clc                          ; 2
    adc    $DB                   ; 3
    sta    $DB                   ; 3
    bne    L3A84                 ; 2³
L3A7E:
    jsr    L38E7                 ; 6
    jsr    L340A                 ; 6
L3A84:
    jmp    FinishOverscan

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3A87 SUBROUTINE
    lda    $85                   ; 3
    ldx    $84                   ; 3
    jsr    L3CD6                 ; 6
L3A8E SUBROUTINE
    lda    #0                    ; 2
    sta    $85                   ; 3
    sty    $84                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3A95 SUBROUTINE
    lda    #$1D                  ; 2
    sta    $C4                   ; 3
    lda    #$80                  ; 2
    sta    $DB                   ; 3
    ldx    $F5                   ; 3
    ldy    L3D09,X               ; 4
    jsr    L3A87                 ; 6
    ldx    $F5                   ; 3
    lda    L3CFF,X               ; 4
    bit    $F6                   ; 3
    bpl    L3AB1                 ; 2³
    clc                          ; 2
    adc    #$10                  ; 2
L3AB1:
    sta    $F8                   ; 3
    ldx    #6                    ; 2
    stx    $ED                   ; 3
    inx                          ; 2
    stx    $86                   ; 3
L3ABA:
    lda    L3E5D,X               ; 4
    sta    $91,X                 ; 4
    lda    #$5E                  ; 2
    sta    $9D,X                 ; 4
    lda    $F8                   ; 3
    sta    $B3,X                 ; 4
    sbc    #4                    ; 2
    sta    $F8                   ; 3
    lda    #0                    ; 2
    sta    $A8,X                 ; 4
    dex                          ; 2
    bpl    L3ABA                 ; 2³
    sta    $E3                   ; 3
    bmi    L3AF7                    ; always branch

L3AD6 SUBROUTINE
    ldx    #5                    ; 2
L3AD8:
    lda    #$47                  ; 2
    sta    $9D,X                 ; 4
    dex                          ; 2
    lda    #$2F                  ; 2
    sta    $9D,X                 ; 4
    dex                          ; 2
    bpl    L3AD8                 ; 2³
    ldy    #$16                  ; 2
    jsr    L3A87                 ; 6
    ldx    #6                    ; 2
    stx    $86                   ; 3
    stx    $ED                   ; 3
L3AEF:
    lda    L3E64,X               ; 4
    sta    $92,X                 ; 4
    dex                          ; 2
    bpl    L3AEF                 ; 2³
L3AF7:
    inx                          ; 2
    stx    $DC                   ; 3
    stx    $E0                   ; 3
    lda    #$1F                  ; 2
    sta    $C6                   ; 3
    lda    #$5E                  ; 2
    sta    $A3                   ; 3
    sta    $DB                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3B07 SUBROUTINE
    lda    #4                    ; 2
    sta    AUDC1                 ; 3
    sta    $F0                   ; 3
    lda    #$27                  ; 2
    sta    $E9                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3B12 SUBROUTINE
    ldx    #$0C                  ; 2
    stx    AUDC1                 ; 3
    stx    $F0                   ; 3
    dex                          ; 2
    stx    $E9                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3B1C SUBROUTINE
    ldx    $F0                   ; 3
    beq    L3B4A                 ; 2³
    dec    $E8                   ; 5
    bpl    L3B3D                 ; 2³
    ldx    $E9                   ; 3
    lda    L3E7E,X               ; 4
    bne    L3B30                 ; 2³
    sta    $F0                   ; 3
    tax                          ; 2
    beq    L3B48                    ; always branch

L3B30:
    sta    AUDF1                 ; 3
    lda    L3EA6,X               ; 4
    sta    $E8                   ; 3
    lda    #8                    ; 2
    sta    $E7                   ; 3
    dec    $E9                   ; 5
L3B3D:
    ldx    $E7                   ; 3
    beq    L3B48                 ; 2³
    lda    frameCounter
    lsr                          ; 2
    bcc    L3B48                 ; 2³
    dec    $E7                   ; 5
L3B48:
    stx    AUDV1                 ; 3
L3B4A:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3B4B SUBROUTINE
    ldx    $F5                   ; 3
    ldy    L3D17,X               ; 4
    jsr    L3A87                 ; 6
L3B53 SUBROUTINE
    lda    #$1D                  ; 2
    sta    $C4                   ; 3
    lda    #8                    ; 2
    adc    $F5                   ; 3
    asl                          ; 2
    sta    $DF                   ; 3
    lda    #$19                  ; 2
    sta    $C6                   ; 3
    sta    $C8                   ; 3
    ldx    #5                    ; 2
    stx    $86                   ; 3
    inx                          ; 2
    lda    #$14                  ; 2
L3B6B:
    sta    $B7,X                 ; 4
    dex                          ; 2
    bpl    L3B6B                 ; 2³
    lda    #$17                  ; 2
    sta    $BE                   ; 3
    ldx    #7                    ; 2
    lda    #$28                  ; 2
    sta    $F8                   ; 3
L3B7A:
    lda    #1                    ; 2
    sta    $8F,X                 ; 4
    lda    #$1C                  ; 2
    sta    $8E,X                 ; 4
    lda    #$4E                  ; 2
    sta    $97,X                 ; 4
    lda    #$43                  ; 2
    sta    $96,X                 ; 4
    lda    #7                    ; 2
    sta    $A7,X                 ; 4
    lda    #5                    ; 2
    sta    $A6,X                 ; 4
    ldy    #1                    ; 2
    txa                          ; 2
    and    #$02                  ; 2
    bne    L3B9B                 ; 2³
    ldy    #$FF                  ; 2
L3B9B:
    sty    $9F,X                 ; 4
    lda    #$10                  ; 2
    sta    $AE,X                 ; 4
    lda    $F8                   ; 3
    sta    $AF,X                 ; 4
    adc    #$1A                  ; 2
    sta    $F8                   ; 3
    dex                          ; 2
    dex                          ; 2
    bpl    L3B7A                 ; 2³
    stx    $E4                   ; 3
    lda    #8                    ; 2
    sta    $96                   ; 3
    lda    $B4                   ; 3
    clc                          ; 2
    adc    #$34                  ; 2
    sta    $DB                   ; 3
    lda    #1                    ; 2
    sta    $DC                   ; 3
    lda    #$0F                  ; 2
    sta    $C2                   ; 3
    lda    #0                    ; 2
    sta    $E2                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3BC7 SUBROUTINE
    lda    #$10                  ; 2
    sta    $E1                   ; 3
    lda    #$70                  ; 2
    sta    $E0                   ; 3
    sta    $DB                   ; 3
    lda    #$1D                  ; 2
    sta    $C4                   ; 3
    lda    #$1E                  ; 2
    sta    $C6                   ; 3
    lda    #5                    ; 2
    sta    $85                   ; 3
    ldy    #$20                  ; 2
    ldx    #9                    ; 2
    stx    AUDC1                 ; 3
L3BE3:
    lda    #0                    ; 2
    sta    $A8,X                 ; 4
    lda    #0                    ; 2
    sta    $9D,X                 ; 4
    iny                          ; 2
    sty    $B3,X                 ; 4
    lda    #$80                  ; 2
    sta    $87,X                 ; 4
    asl                          ; 2
    sta    $92,X                 ; 4
    dex                          ; 2
    bpl    L3BE3                 ; 2³
    stx    $CB                   ; 3
    sta    $CA                   ; 3
    sta    $86                   ; 3
    sta    $EC                   ; 3
    sta    $83                   ; 3
    sta    $84                   ; 3
    sta    $E9                   ; 3
    clc                          ; 2
    ldx    $F5                   ; 3
    cpx    #4                    ; 2
    bcc    L3C0F                 ; 2³
    ldx    #3                    ; 2
L3C0F:
    adc    #$14                  ; 2
    dex                          ; 2
    bpl    L3C0F                 ; 2³
    sta    $DF                   ; 3
    lda    #5                    ; 2
    sta    $92                   ; 3
    sta    $93                   ; 3
    lda    #$14                  ; 2
    sta    $DC                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3C21 SUBROUTINE
    lda    $DD                   ; 3
    sec                          ; 2
    sbc    $D9                   ; 3
    sta    $F8                   ; 3
    lda    $DE                   ; 3
    sbc    $DA                   ; 3
    ldx    #4                    ; 2
L3C2E:
    lsr                          ; 2
    ror    $F8                   ; 5
    dex                          ; 2
    bne    L3C2E                 ; 2³
    tax                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3C36 SUBROUTINE
    ldx    $F5                   ; 3
    ldy    L3D24,X               ; 4
    jsr    L3A87                 ; 6
L3C3E SUBROUTINE
    lda    $F5                   ; 3
    asl                          ; 2
    asl                          ; 2
    adc    #$18                  ; 2
    adc    $F5                   ; 3
    sta    $DF                   ; 3
    lda    #$19                  ; 2
    sta    $C4                   ; 3
    lda    #$18                  ; 2
    sta    $C6                   ; 3
    lda    #$13                  ; 2
    sta    $C8                   ; 3
    lda    #$0C                  ; 2
    sta    AUDC1                 ; 3
    lda    #3                    ; 2
    sta    $86                   ; 3
    lda    #8                    ; 2
    sta    $ED                   ; 3
    lda    #0                    ; 2
    sta    $BE                   ; 3
    sta    $CA                   ; 3
    sta    $EB                   ; 3
    lda    #$28                  ; 2
    sta    $F8                   ; 3
    ldx    #$0A                  ; 2
L3C6E:
    ldy    #$25                  ; 2
    txa                          ; 2
    lsr                          ; 2
    lda    #9                    ; 2
    bcc    L3C7A                 ; 2³
    ldy    #$A0                  ; 2
    lda    #$5C                  ; 2
L3C7A:
    sty    $A8,X                 ; 4
    sta    $92,X                 ; 4
    lda    #0                    ; 2
    sta    $87,X                 ; 4
    lda    $F8                   ; 3
    sta    $B3,X                 ; 4
    adc    #6                    ; 2
    sta    $F8                   ; 3
    dex                          ; 2
    bpl    L3C6E                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3C8E SUBROUTINE
    lda    frameCounter
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    ldx    $87                   ; 3
    cpx    #$6C                  ; 2
    bcc    L3C9D                 ; 2³
    eor    #$03                  ; 2
L3C9D:
    tax                          ; 2
    lda    L3F1B,X               ; 4
    sta    $C5                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3CA4 SUBROUTINE
    ldy    #$99                  ; 2
    jsr    L3A87                 ; 6
    ldx    #2                    ; 2
    stx    $86                   ; 3
    dex                          ; 2
    stx    $DC                   ; 3
    dex                          ; 2
    stx    $9E                   ; 3
    stx    $E4                   ; 3
    lda    #$1A                  ; 2
    sta    $C6                   ; 3
    sta    $C8                   ; 3
    sta    $88                   ; 3
    lda    $F5                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    $8A                   ; 3
    inc    $8A                   ; 5
    lda    #$68                  ; 2
    sta    $C7                   ; 3
    lda    #$22                  ; 2
    sta    COLUPF                ; 3
    lda    #$1D                  ; 2
    sta    $C4                   ; 3
    lda    #$7C                  ; 2
    sta    $DB                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3CD6 SUBROUTINE
    sed                          ; 2
    clc                          ; 2
    adc    $82                   ; 3
    sta    $82                   ; 3
    txa                          ; 2
    adc    $81                   ; 3
    sta    $81                   ; 3
    lda    #0                    ; 2
    adc    $80                   ; 3
    sta    $80                   ; 3
    cld                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3CE9:
    .byte $01 ; |       X| $3CE9
    .byte $01 ; |       X| $3CEA
    .byte $01 ; |       X| $3CEB
    .byte $02 ; |      X | $3CEC
    .byte $02 ; |      X | $3CED
    .byte $03 ; |      XX| $3CEE
    .byte $03 ; |      XX| $3CEF
    .byte $03 ; |      XX| $3CF0
    .byte $06 ; |     XX | $3CF1
    .byte $08 ; |    X   | $3CF2
    .byte $0A ; |    X X | $3CF3
    .byte $0B ; |    X XX| $3CF4
L3CF5:
    .byte $FF ; |XXXXXXXX| $3CF5
    .byte $FF ; |XXXXXXXX| $3CF6
    .byte $FF ; |XXXXXXXX| $3CF7
    .byte $7F ; | XXXXXXX| $3CF8
    .byte $7F ; | XXXXXXX| $3CF9
    .byte $7F ; | XXXXXXX| $3CFA
    .byte $3F ; |  XXXXXX| $3CFB
    .byte $3F ; |  XXXXXX| $3CFC
    .byte $3F ; |  XXXXXX| $3CFD
    .byte $1F ; |   XXXXX| $3CFE
L3CFF:
    .byte $1F ; |   XXXXX| $3CFF
    .byte $17 ; |   X XXX| $3D00
    .byte $17 ; |   X XXX| $3D01
    .byte $58 ; | X XX   | $3D02
    .byte $55 ; | X X X X| $3D03
    .byte $52 ; | X X  X | $3D04
    .byte $4F ; | X  XXXX| $3D05
    .byte $4C ; | X  XX  | $3D06
    .byte $4C ; | X  XX  | $3D07
    .byte $4C ; | X  XX  | $3D08
L3D09:
    .byte $4B ; | X  X XX| $3D09
    .byte $4B ; | X  X XX| $3D0A
    .byte $4A ; | X  X X | $3D0B
    .byte $20 ; |  X     | $3D0C
    .byte $19 ; |   XX  X| $3D0D
    .byte $18 ; |   XX   | $3D0E
    .byte $17 ; |   X XXX| $3D0F
    .byte $16 ; |   X XX | $3D10
    .byte $17 ; |   X XXX| $3D11
    .byte $18 ; |   XX   | $3D12
    .byte $19 ; |   XX  X| $3D13
L3D14:
    .byte $20 ; |  X     | $3D14
    .byte $25 ; |  X  X X| $3D15
    .byte $FF ; |XXXXXXXX| $3D16
L3D17:
    .byte $03 ; |      XX| $3D17
    .byte $01 ; |       X| $3D18
    .byte $14 ; |   X X  | $3D19
    .byte $14 ; |   X X  | $3D1A
    .byte $14 ; |   X X  | $3D1B
    .byte $16 ; |   X XX | $3D1C
    .byte $16 ; |   X XX | $3D1D
    .byte $16 ; |   X XX | $3D1E
    .byte $20 ; |  X     | $3D1F
    .byte $20 ; |  X     | $3D20
    .byte $20 ; |  X     | $3D21
    .byte $20 ; |  X     | $3D22
    .byte $20 ; |  X     | $3D23
L3D24:
    .byte $18 ; |   XX   | $3D24
    .byte $20 ; |  X     | $3D25
    .byte $20 ; |  X     | $3D26
    .byte $20 ; |  X     | $3D27
    .byte $22 ; |  X   X | $3D28
    .byte $22 ; |  X   X | $3D29
    .byte $23 ; |  X   XX| $3D2A
    .byte $23 ; |  X   XX| $3D2B
    .byte $23 ; |  X   XX| $3D2C
    .byte $24 ; |  X  X  | $3D2D
    .byte $24 ; |  X  X  | $3D2E
    .byte $25 ; |  X  X X| $3D2F
    .byte $28 ; |  X X   | $3D30
L3D31:
    .byte $60 ; | XX     | $3D31
    .byte $5C ; | X XXX  | $3D32
    .byte $58 ; | X XX   | $3D33
    .byte $54 ; | X X X  | $3D34
    .byte $50 ; | X X    | $3D35
    .byte $4C ; | X  XX  | $3D36
    .byte $48 ; | X  X   | $3D37
    .byte $44 ; | X   X  | $3D38
    .byte $40 ; | X      | $3D39
    .byte $3C ; |  XXXX  | $3D3A
    .byte $38 ; |  XXX   | $3D3B
    .byte $34 ; |  XX X  | $3D3C
    .byte $30 ; |  XX    | $3D3D
L3D3E:
    .byte $FF ; |XXXXXXXX| $3D3E
    .byte $FF ; |XXXXXXXX| $3D3F
    .byte $7F ; | XXXXXXX| $3D40
    .byte $3F ; |  XXXXXX| $3D41
    .byte $3F ; |  XXXXXX| $3D42
    .byte $3F ; |  XXXXXX| $3D43
    .byte $1F ; |   XXXXX| $3D44
    .byte $1F ; |   XXXXX| $3D45
    .byte $1F ; |   XXXXX| $3D46
    .byte $0F ; |    XXXX| $3D47
    .byte $0F ; |    XXXX| $3D48
    .byte $17 ; |   X XXX| $3D49
    .byte $17 ; |   X XXX| $3D4A
L3D4B:
    .byte $19 ; |   XX  X| $3D4B
    .byte $2A ; |  X X X | $3D4C
    .byte $3B ; |  XXX XX| $3D4D
    .byte $3B ; |  XXX XX| $3D4E
    .byte $2A ; |  X X X | $3D4F
    .byte $19 ; |   XX  X| $3D50
L3D51:
    .byte $00 ; |        | $3D51
    .byte $11 ; |   X   X| $3D52
    .byte $22 ; |  X   X | $3D53
    .byte $33 ; |  XX  XX| $3D54
    .byte $44 ; | X   X  | $3D55
    .byte $55 ; | X X X X| $3D56
    .byte $66 ; | XX  XX | $3D57
    .byte $77 ; | XXX XXX| $3D58
    .byte $88 ; |X   X   | $3D59
    .byte $99 ; |X  XX  X| $3D5A
    .byte $AA ; |X X X X | $3D5B
L3D5C:
    .byte $BB ; |X XXX XX| $3D5C
    .byte $00 ; |        | $3D5D
    .byte $00 ; |        | $3D5E
    .byte $01 ; |       X| $3D5F
    .byte $01 ; |       X| $3D60
    .byte $02 ; |      X | $3D61
    .byte $02 ; |      X | $3D62
L3D63:
    .byte $03 ; |      XX| $3D63
    .byte $04 ; |     X  | $3D64
    .byte $04 ; |     X  | $3D65
    .byte $04 ; |     X  | $3D66
    .byte $00 ; |        | $3D67
    .byte $04 ; |     X  | $3D68
    .byte $04 ; |     X  | $3D69
    .byte $04 ; |     X  | $3D6A
    .byte $04 ; |     X  | $3D6B
    .byte $04 ; |     X  | $3D6C
    .byte $04 ; |     X  | $3D6D
    .byte $00 ; |        | $3D6E
    .byte $04 ; |     X  | $3D6F
    .byte $0C ; |    XX  | $3D70
    .byte $04 ; |     X  | $3D71
    .byte $00 ; |        | $3D72
    .byte $04 ; |     X  | $3D73
    .byte $04 ; |     X  | $3D74
    .byte $04 ; |     X  | $3D75
L3D76:
    .byte $04 ; |     X  | $3D76
    .byte $04 ; |     X  | $3D77
    .byte $0C ; |    XX  | $3D78
    .byte $04 ; |     X  | $3D79
    .byte $00 ; |        | $3D7A
    .byte $00 ; |        | $3D7B
    .byte $00 ; |        | $3D7C
    .byte $00 ; |        | $3D7D
    .byte $00 ; |        | $3D7E
    .byte $00 ; |        | $3D7F
    .byte $04 ; |     X  | $3D80
    .byte $00 ; |        | $3D81
    .byte $00 ; |        | $3D82
    .byte $00 ; |        | $3D83
    .byte $00 ; |        | $3D84
    .byte $00 ; |        | $3D85
    .byte $00 ; |        | $3D86
    .byte $00 ; |        | $3D87
    .byte $00 ; |        | $3D88
L3D89:
    .byte $04 ; |     X  | $3D89
    .byte $0F ; |    XXXX| $3D8A
    .byte $11 ; |   X   X| $3D8B
    .byte $0F ; |    XXXX| $3D8C
    .byte $00 ; |        | $3D8D
    .byte $11 ; |   X   X| $3D8E
    .byte $13 ; |   X  XX| $3D8F
    .byte $14 ; |   X X  | $3D90
    .byte $17 ; |   X XXX| $3D91
    .byte $18 ; |   XX   | $3D92
    .byte $17 ; |   X XXX| $3D93
    .byte $00 ; |        | $3D94
    .byte $1F ; |   XXXXX| $3D95
    .byte $0B ; |    X XX| $3D96
    .byte $1F ; |   XXXXX| $3D97
    .byte $00 ; |        | $3D98
    .byte $14 ; |   X X  | $3D99
    .byte $13 ; |   X  XX| $3D9A
    .byte $18 ; |   XX   | $3D9B
    .byte $17 ; |   X XXX| $3D9C
    .byte $18 ; |   XX   | $3D9D
    .byte $17 ; |   X XXX| $3D9E
    .byte $14 ; |   X X  | $3D9F
    .byte $18 ; |   XX   | $3DA0
    .byte $17 ; |   X XXX| $3DA1
    .byte $14 ; |   X X  | $3DA2
    .byte $18 ; |   XX   | $3DA3
    .byte $17 ; |   X XXX| $3DA4
    .byte $14 ; |   X X  | $3DA5
    .byte $18 ; |   XX   | $3DA6
    .byte $17 ; |   X XXX| $3DA7
    .byte $14 ; |   X X  | $3DA8
    .byte $13 ; |   X  XX| $3DA9
    .byte $11 ; |   X   X| $3DAA
    .byte $14 ; |   X X  | $3DAB
    .byte $13 ; |   X  XX| $3DAC
    .byte $11 ; |   X   X| $3DAD
    .byte $14 ; |   X X  | $3DAE
    .byte $13 ; |   X  XX| $3DAF
    .byte $11 ; |   X   X| $3DB0
    .byte $14 ; |   X X  | $3DB1
    .byte $13 ; |   X  XX| $3DB2
    .byte $11 ; |   X   X| $3DB3
    .byte $0F ; |    XXXX| $3DB4
    .byte $0E ; |    XXX | $3DB5
    .byte $11 ; |   X   X| $3DB6
    .byte $0F ; |    XXXX| $3DB7
    .byte $0E ; |    XXX | $3DB8
    .byte $11 ; |   X   X| $3DB9
    .byte $0F ; |    XXXX| $3DBA
    .byte $0E ; |    XXX | $3DBB
    .byte $11 ; |   X   X| $3DBC
L3DBD:
    .byte $0F ; |    XXXX| $3DBD
    .byte $1F ; |   XXXXX| $3DBE
    .byte $0B ; |    X XX| $3DBF
    .byte $1F ; |   XXXXX| $3DC0
    .byte $00 ; |        | $3DC1
    .byte $00 ; |        | $3DC2
    .byte $00 ; |        | $3DC3
    .byte $00 ; |        | $3DC4
    .byte $00 ; |        | $3DC5
    .byte $00 ; |        | $3DC6
    .byte $1F ; |   XXXXX| $3DC7
    .byte $00 ; |        | $3DC8
    .byte $00 ; |        | $3DC9
    .byte $00 ; |        | $3DCA
    .byte $00 ; |        | $3DCB
    .byte $00 ; |        | $3DCC
    .byte $00 ; |        | $3DCD
    .byte $00 ; |        | $3DCE
    .byte $00 ; |        | $3DCF
L3DD0:
    .byte $1F ; |   XXXXX| $3DD0
    .byte $08 ; |    X   | $3DD1
    .byte $08 ; |    X   | $3DD2
    .byte $40 ; | X      | $3DD3
    .byte $10 ; |   X    | $3DD4
    .byte $06 ; |     XX | $3DD5
    .byte $06 ; |     XX | $3DD6
    .byte $06 ; |     XX | $3DD7
    .byte $06 ; |     XX | $3DD8
    .byte $20 ; |  X     | $3DD9
    .byte $40 ; | X      | $3DDA
    .byte $10 ; |   X    | $3DDB
    .byte $08 ; |    X   | $3DDC
    .byte $08 ; |    X   | $3DDD
    .byte $30 ; |  XX    | $3DDE
    .byte $10 ; |   X    | $3DDF
    .byte $10 ; |   X    | $3DE0
    .byte $10 ; |   X    | $3DE1
    .byte $10 ; |   X    | $3DE2
    .byte $60 ; | XX     | $3DE3
    .byte $0C ; |    XX  | $3DE4
    .byte $08 ; |    X   | $3DE5
    .byte $08 ; |    X   | $3DE6
    .byte $08 ; |    X   | $3DE7
    .byte $08 ; |    X   | $3DE8
    .byte $08 ; |    X   | $3DE9
    .byte $08 ; |    X   | $3DEA
    .byte $08 ; |    X   | $3DEB
    .byte $08 ; |    X   | $3DEC
    .byte $08 ; |    X   | $3DED
    .byte $0C ; |    XX  | $3DEE
    .byte $0C ; |    XX  | $3DEF
    .byte $08 ; |    X   | $3DF0
    .byte $08 ; |    X   | $3DF1
    .byte $08 ; |    X   | $3DF2
    .byte $08 ; |    X   | $3DF3
    .byte $08 ; |    X   | $3DF4
    .byte $08 ; |    X   | $3DF5
    .byte $08 ; |    X   | $3DF6
    .byte $08 ; |    X   | $3DF7
    .byte $08 ; |    X   | $3DF8
    .byte $0C ; |    XX  | $3DF9
    .byte $0C ; |    XX  | $3DFA
    .byte $08 ; |    X   | $3DFB
    .byte $08 ; |    X   | $3DFC
    .byte $08 ; |    X   | $3DFD
    .byte $08 ; |    X   | $3DFE
    .byte $08 ; |    X   | $3DFF
    .byte $08 ; |    X   | $3E00
    .byte $08 ; |    X   | $3E01
    .byte $09 ; |    X  X| $3E02
    .byte $0A ; |    X X | $3E03
L3E04:
    .byte $40 ; | X      | $3E04
    .byte $08 ; |    X   | $3E05
    .byte $08 ; |    X   | $3E06
    .byte $08 ; |    X   | $3E07
    .byte $00 ; |        | $3E08
    .byte $02 ; |      X | $3E09
    .byte $04 ; |     X  | $3E0A
    .byte $06 ; |     XX | $3E0B
    .byte $07 ; |     XXX| $3E0C
    .byte $08 ; |    X   | $3E0D
    .byte $08 ; |    X   | $3E0E
    .byte $00 ; |        | $3E0F
    .byte $08 ; |    X   | $3E10
    .byte $08 ; |    X   | $3E11
    .byte $08 ; |    X   | $3E12
    .byte $00 ; |        | $3E13
    .byte $04 ; |     X  | $3E14
    .byte $04 ; |     X  | $3E15
    .byte $04 ; |     X  | $3E16
    .byte $08 ; |    X   | $3E17
    .byte $02 ; |      X | $3E18
    .byte $02 ; |      X | $3E19
    .byte $02 ; |      X | $3E1A
    .byte $02 ; |      X | $3E1B
    .byte $02 ; |      X | $3E1C
    .byte $02 ; |      X | $3E1D
    .byte $02 ; |      X | $3E1E
    .byte $02 ; |      X | $3E1F
    .byte $02 ; |      X | $3E20
    .byte $02 ; |      X | $3E21
    .byte $02 ; |      X | $3E22
    .byte $03 ; |      XX| $3E23
    .byte $04 ; |     X  | $3E24
    .byte $04 ; |     X  | $3E25
    .byte $04 ; |     X  | $3E26
    .byte $04 ; |     X  | $3E27
    .byte $04 ; |     X  | $3E28
    .byte $04 ; |     X  | $3E29
    .byte $04 ; |     X  | $3E2A
    .byte $04 ; |     X  | $3E2B
    .byte $04 ; |     X  | $3E2C
    .byte $04 ; |     X  | $3E2D
    .byte $05 ; |     X X| $3E2E
    .byte $06 ; |     XX | $3E2F
    .byte $06 ; |     XX | $3E30
    .byte $06 ; |     XX | $3E31
    .byte $06 ; |     XX | $3E32
    .byte $06 ; |     XX | $3E33
    .byte $06 ; |     XX | $3E34
    .byte $06 ; |     XX | $3E35
    .byte $06 ; |     XX | $3E36
    .byte $07 ; |     XXX| $3E37
L3E38:
    .byte $08 ; |    X   | $3E38
    .byte $00 ; |        | $3E39
    .byte $00 ; |        | $3E3A
    .byte $10 ; |   X    | $3E3B
    .byte $00 ; |        | $3E3C
    .byte $00 ; |        | $3E3D
    .byte $00 ; |        | $3E3E
    .byte $00 ; |        | $3E3F
    .byte $00 ; |        | $3E40
    .byte $08 ; |    X   | $3E41
    .byte $10 ; |   X    | $3E42
    .byte $00 ; |        | $3E43
    .byte $00 ; |        | $3E44
    .byte $00 ; |        | $3E45
    .byte $10 ; |   X    | $3E46
    .byte $00 ; |        | $3E47
    .byte $08 ; |    X   | $3E48
    .byte $08 ; |    X   | $3E49
    .byte $08 ; |    X   | $3E4A
L3E4B:
    .byte $10 ; |   X    | $3E4B
    .byte $00 ; |        | $3E4C
    .byte $00 ; |        | $3E4D
    .byte $00 ; |        | $3E4E
    .byte $00 ; |        | $3E4F
    .byte $00 ; |        | $3E50
    .byte $00 ; |        | $3E51
    .byte $00 ; |        | $3E52
    .byte $00 ; |        | $3E53
    .byte $04 ; |     X  | $3E54
    .byte $00 ; |        | $3E55
    .byte $00 ; |        | $3E56
    .byte $00 ; |        | $3E57
    .byte $00 ; |        | $3E58
    .byte $00 ; |        | $3E59
    .byte $00 ; |        | $3E5A
    .byte $04 ; |     X  | $3E5B
    .byte $04 ; |     X  | $3E5C
L3E5D:
    .byte $04 ; |     X  | $3E5D
    .byte $06 ; |     XX | $3E5E
    .byte $02 ; |      X | $3E5F
    .byte $04 ; |     X  | $3E60
    .byte $00 ; |        | $3E61
    .byte $05 ; |     X X| $3E62
    .byte $07 ; |     XXX| $3E63
L3E64:
    .byte $06 ; |     XX | $3E64
    .byte $06 ; |     XX | $3E65
    .byte $06 ; |     XX | $3E66
    .byte $04 ; |     X  | $3E67
    .byte $04 ; |     X  | $3E68
    .byte $00 ; |        | $3E69
L3E6A:
    .byte $57 ; | X X XXX| $3E6A
    .byte $77 ; | XXX XXX| $3E6B
    .byte $97 ; |X  X XXX| $3E6C
L3E6D:
    .byte $5F ; | X XXXXX| $3E6D
    .byte $7F ; | XXXXXXX| $3E6E
    .byte $9F ; |X  XXXXX| $3E6F
L3E70:
    .byte $00 ; |        | $3E70
    .byte $06 ; |     XX | $3E71
    .byte $04 ; |     X  | $3E72
L3E73:
    .byte $06 ; |     XX | $3E73
    .byte $03 ; |      XX| $3E74
    .byte $05 ; |     X X| $3E75
L3E76:
    .byte $BA ; |X XXX X | $3E76
    .byte $A2 ; |X X   X | $3E77
    .byte $8A ; |X   X X | $3E78
    .byte $72 ; | XXX  X | $3E79
    .byte $5A ; | X XX X | $3E7A
    .byte $42 ; | X    X | $3E7B
    .byte $2A ; |  X X X | $3E7C
    .byte $12 ; |   X  X | $3E7D
L3E7E:
    .byte $00 ; |        | $3E7E
    .byte $14 ; |   X X  | $3E7F
    .byte $1D ; |   XXX X| $3E80
    .byte $14 ; |   X X  | $3E81
    .byte $1D ; |   XXX X| $3E82
    .byte $14 ; |   X X  | $3E83
    .byte $1A ; |   XX X | $3E84
    .byte $12 ; |   X  X | $3E85
    .byte $17 ; |   X XXX| $3E86
    .byte $10 ; |   X    | $3E87
    .byte $14 ; |   X X  | $3E88
    .byte $0E ; |    XXX | $3E89
    .byte $00 ; |        | $3E8A
    .byte $13 ; |   X  XX| $3E8B
    .byte $14 ; |   X X  | $3E8C
    .byte $15 ; |   X X X| $3E8D
    .byte $1A ; |   XX X | $3E8E
    .byte $17 ; |   X XXX| $3E8F
    .byte $14 ; |   X X  | $3E90
    .byte $13 ; |   X  XX| $3E91
    .byte $11 ; |   X   X| $3E92
    .byte $0F ; |    XXXX| $3E93
    .byte $0E ; |    XXX | $3E94
    .byte $0F ; |    XXXX| $3E95
    .byte $14 ; |   X X  | $3E96
    .byte $1A ; |   XX X | $3E97
    .byte $14 ; |   X X  | $3E98
    .byte $11 ; |   X   X| $3E99
    .byte $14 ; |   X X  | $3E9A
    .byte $1A ; |   XX X | $3E9B
    .byte $14 ; |   X X  | $3E9C
    .byte $11 ; |   X   X| $3E9D
    .byte $1A ; |   XX X | $3E9E
    .byte $1F ; |   XXXXX| $3E9F
    .byte $1A ; |   XX X | $3EA0
    .byte $13 ; |   X  XX| $3EA1
    .byte $1A ; |   XX X | $3EA2
    .byte $1F ; |   XXXXX| $3EA3
    .byte $1A ; |   XX X | $3EA4
    .byte $13 ; |   X  XX| $3EA5
L3EA6:
    .byte $00 ; |        | $3EA6
    .byte $05 ; |     X X| $3EA7
    .byte $05 ; |     X X| $3EA8
    .byte $05 ; |     X X| $3EA9
    .byte $05 ; |     X X| $3EAA
    .byte $05 ; |     X X| $3EAB
    .byte $08 ; |    X   | $3EAC
    .byte $08 ; |    X   | $3EAD
    .byte $08 ; |    X   | $3EAE
    .byte $08 ; |    X   | $3EAF
    .byte $08 ; |    X   | $3EB0
    .byte $08 ; |    X   | $3EB1
    .byte $00 ; |        | $3EB2
    .byte $18 ; |   XX   | $3EB3
    .byte $0C ; |    XX  | $3EB4
    .byte $02 ; |      X | $3EB5
    .byte $0A ; |    X X | $3EB6
    .byte $06 ; |     XX | $3EB7
    .byte $06 ; |     XX | $3EB8
    .byte $06 ; |     XX | $3EB9
    .byte $06 ; |     XX | $3EBA
    .byte $06 ; |     XX | $3EBB
    .byte $06 ; |     XX | $3EBC
    .byte $0C ; |    XX  | $3EBD
    .byte $06 ; |     XX | $3EBE
    .byte $06 ; |     XX | $3EBF
    .byte $06 ; |     XX | $3EC0
    .byte $06 ; |     XX | $3EC1
    .byte $06 ; |     XX | $3EC2
    .byte $06 ; |     XX | $3EC3
    .byte $06 ; |     XX | $3EC4
    .byte $06 ; |     XX | $3EC5
    .byte $06 ; |     XX | $3EC6
    .byte $06 ; |     XX | $3EC7
    .byte $06 ; |     XX | $3EC8
    .byte $06 ; |     XX | $3EC9
    .byte $06 ; |     XX | $3ECA
    .byte $06 ; |     XX | $3ECB
    .byte $06 ; |     XX | $3ECC
    .byte $06 ; |     XX | $3ECD
L3ECE:
    .byte $1F ; |   XXXXX| $3ECE
    .byte $14 ; |   X X  | $3ECF
    .byte $1B ; |   XX XX| $3ED0
    .byte $12 ; |   X  X | $3ED1
    .byte $18 ; |   XX   | $3ED2
    .byte $10 ; |   X    | $3ED3
    .byte $15 ; |   X X X| $3ED4
    .byte $15 ; |   X X X| $3ED5
    .byte $0E ; |    XXX | $3ED6
    .byte $13 ; |   X  XX| $3ED7
    .byte $13 ; |   X  XX| $3ED8
    .byte $0F ; |    XXXX| $3ED9
    .byte $0F ; |    XXXX| $3EDA
    .byte $0F ; |    XXXX| $3EDB
    .byte $0F ; |    XXXX| $3EDC
    .byte $0F ; |    XXXX| $3EDD
    .byte $0F ; |    XXXX| $3EDE
    .byte $13 ; |   X  XX| $3EDF
    .byte $17 ; |   X XXX| $3EE0
    .byte $1D ; |   XXX X| $3EE1
    .byte $1F ; |   XXXXX| $3EE2
    .byte $1F ; |   XXXXX| $3EE3
    .byte $1F ; |   XXXXX| $3EE4
    .byte $14 ; |   X X  | $3EE5
    .byte $17 ; |   X XXX| $3EE6
    .byte $12 ; |   X  X | $3EE7
    .byte $11 ; |   X   X| $3EE8
    .byte $1F ; |   XXXXX| $3EE9
    .byte $14 ; |   X X  | $3EEA
    .byte $17 ; |   X XXX| $3EEB
    .byte $1F ; |   XXXXX| $3EEC
    .byte $12 ; |   X  X | $3EED
    .byte $11 ; |   X   X| $3EEE
    .byte $1F ; |   XXXXX| $3EEF
    .byte $1F ; |   XXXXX| $3EF0
    .byte $1F ; |   XXXXX| $3EF1
    .byte $1F ; |   XXXXX| $3EF2
    .byte $14 ; |   X X  | $3EF3
    .byte $1F ; |   XXXXX| $3EF4
    .byte $1F ; |   XXXXX| $3EF5
    .byte $17 ; |   X XXX| $3EF6
    .byte $1F ; |   XXXXX| $3EF7
    .byte $1F ; |   XXXXX| $3EF8
    .byte $1A ; |   XX X | $3EF9
    .byte $1F ; |   XXXXX| $3EFA
    .byte $1F ; |   XXXXX| $3EFB
    .byte $1F ; |   XXXXX| $3EFC
    .byte $1F ; |   XXXXX| $3EFD
    .byte $1F ; |   XXXXX| $3EFE
    .byte $14 ; |   X X  | $3EFF
    .byte $1F ; |   XXXXX| $3F00
    .byte $1F ; |   XXXXX| $3F01
    .byte $17 ; |   X XXX| $3F02
    .byte $1F ; |   XXXXX| $3F03
    .byte $1F ; |   XXXXX| $3F04
    .byte $1A ; |   XX X | $3F05
    .byte $1F ; |   XXXXX| $3F06
    .byte $1F ; |   XXXXX| $3F07
    .byte $1F ; |   XXXXX| $3F08
    .byte $1F ; |   XXXXX| $3F09
L3F0A:
    .byte $7F ; | XXXXXXX| $3F0A
    .byte $92 ; |X  X  X | $3F0B
    .byte $A5 ; |X X  X X| $3F0C
    .byte $92 ; |X  X  X | $3F0D
    .byte $0A ; |    X X | $3F0E
    .byte $0A ; |    X X | $3F0F
    .byte $A8 ; |X X X   | $3F10
    .byte $AA ; |X X X X | $3F11
    .byte $0A ; |    X X | $3F12
    .byte $0A ; |    X X | $3F13
    .byte $A8 ; |X X X   | $3F14
    .byte $AA ; |X X X X | $3F15
    .byte $FF ; |XXXXXXXX| $3F16
    .byte $0F ; |    XXXX| $3F17
    .byte $1C ; |   XXX  | $3F18
    .byte $2A ; |  X X X | $3F19
    .byte $00 ; |        | $3F1A
L3F1B:
    .byte $00 ; |        | $3F1B
    .byte $0D ; |    XX X| $3F1C
    .byte $1A ; |   XX X | $3F1D
L3F1E:
    .byte $27 ; |  X  XXX| $3F1E
    .byte $41 ; | X     X| $3F1F
    .byte $34 ; |  XX X  | $3F20
    .byte $00 ; |        | $3F21
    .byte $00 ; |        | $3F22
    .byte $61 ; | XX    X| $3F23
    .byte $8D ; |X   XX X| $3F24
    .byte $00 ; |        | $3F25
    .byte $00 ; |        | $3F26
    .byte $55 ; | X X X X| $3F27
    .byte $99 ; |X  XX  X| $3F28
    .byte $00 ; |        | $3F29
    .byte $38 ; |  XXX   | $3F2A
    .byte $75 ; | XXX X X| $3F2B
    .byte $B1 ; |X XX   X| $3F2C
    .byte $38 ; |  XXX   | $3F2D
    .byte $AD ; |X X XX X| $3F2E
    .byte $91 ; |X  X   X| $3F2F
    .byte $5D ; | X XXX X| $3F30
    .byte $00 ; |        | $3F31
    .byte $00 ; |        | $3F32
    .byte $00 ; |        | $3F33
    .byte $75 ; | XXX X X| $3F34
    .byte $00 ; |        | $3F35
    .byte $00 ; |        | $3F36
    .byte $6E ; | XX XXX | $3F37
    .byte $9A ; |X  XX X | $3F38
    .byte $00 ; |        | $3F39
    .byte $00 ; |        | $3F3A
    .byte $62 ; | XX   X | $3F3B
    .byte $A6 ; |X X  XX | $3F3C
    .byte $00 ; |        | $3F3D
    .byte $4A ; | X  X X | $3F3E
    .byte $86 ; |X    XX | $3F3F
    .byte $BF ; |X XXXXXX| $3F40
    .byte $4E ; | X  XXX | $3F41
    .byte $BF ; |X XXXXXX| $3F42
    .byte $9E ; |X  XXXX | $3F43
    .byte $6A ; | XX X X | $3F44
    .byte $00 ; |        | $3F45
    .byte $00 ; |        | $3F46
    .byte $00 ; |        | $3F47
    .byte $86 ; |X    XX | $3F48
    .byte $14 ; |   X X  | $3F49
    .byte $2C ; |  X XX  | $3F4A
    .byte $48 ; | X  X   | $3F4B
    .byte $62 ; | XX   X | $3F4C
    .byte $95 ; |X  X X X| $3F4D
    .byte $C2 ; |XX    X | $3F4E
    .byte $3D ; |  XXXX X| $3F4F
    .byte $45 ; | X   X X| $3F50
    .byte $4D ; | X  XX X| $3F51
    .byte $55 ; | X X X X| $3F52
    .byte $A1 ; |X X    X| $3F53
    .byte $A9 ; |X X X  X| $3F54
    .byte $B1 ; |X XX   X| $3F55
    .byte $B9 ; |X XXX  X| $3F56
    .byte $42 ; | X    X | $3F57
    .byte $4A ; | X  X X | $3F58
    .byte $52 ; | X X  X | $3F59
    .byte $5A ; | X XX X | $3F5A
    .byte $A6 ; |X X  XX | $3F5B
    .byte $AE ; |X X XXX | $3F5C
    .byte $B6 ; |X XX XX | $3F5D
    .byte $BE ; |X XXXXX | $3F5E
    .byte $3F ; |  XXXXXX| $3F5F
    .byte $CF ; |XX  XXXX| $3F60
    .byte $F3 ; |XXXX  XX| $3F61
    .byte $FC ; |XXXXXX  | $3F62
    .byte $FC ; |XXXXXX  | $3F63
    .byte $F3 ; |XXXX  XX| $3F64
    .byte $CF ; |XX  XXXX| $3F65
    .byte $3F ; |  XXXXXX| $3F66
    .byte $C0 ; |XX      | $3F67
    .byte $30 ; |  XX    | $3F68
    .byte $0C ; |    XX  | $3F69
    .byte $03 ; |      XX| $3F6A
    .byte $03 ; |      XX| $3F6B
    .byte $0C ; |    XX  | $3F6C
    .byte $30 ; |  XX    | $3F6D
    .byte $C0 ; |XX      | $3F6E
L3F6F:
    .byte $50 ; | X X    | $3F6F
    .byte $46 ; | X   XX | $3F70
    .byte $3C ; |  XXXX  | $3F71
    .byte $32 ; |  XX  X | $3F72
    .byte $32 ; |  XX  X | $3F73
    .byte $28 ; |  X X   | $3F74
    .byte $1E ; |   XXXX | $3F75
    .byte $14 ; |   X X  | $3F76
    .byte $14 ; |   X X  | $3F77
L3F78:
    .byte $07 ; |     XXX| $3F78
    .byte $07 ; |     XXX| $3F79
    .byte $07 ; |     XXX| $3F7A
    .byte $07 ; |     XXX| $3F7B
    .byte $05 ; |     X X| $3F7C
    .byte $05 ; |     X X| $3F7D
    .byte $05 ; |     X X| $3F7E
    .byte $00 ; |        | $3F7F
    .byte $00 ; |        | $3F80
    .byte $00 ; |        | $3F81
L3F82:
    .byte $05 ; |     X X| $3F82
    .byte $04 ; |     X  | $3F83
    .byte $03 ; |      XX| $3F84
    .byte $02 ; |      X | $3F85
    .byte $02 ; |      X | $3F86
    .byte $02 ; |      X | $3F87
    .byte $01 ; |       X| $3F88
    .byte $01 ; |       X| $3F89
    .byte $00 ; |        | $3F8A
    .byte $00 ; |        | $3F8B
    .byte $11 ; |   X   X| $3F8C
    .byte $12 ; |   X  X | $3F8D
    .byte $14 ; |   X X  | $3F8E
    .byte $15 ; |   X X X| $3F8F
    .byte $13 ; |   X  XX| $3F90
    .byte $12 ; |   X  X | $3F91
    .byte $11 ; |   X   X| $3F92
    .byte $10 ; |   X    | $3F93
    .byte $0F ; |    XXXX| $3F94
    .byte $0E ; |    XXX | $3F95
    .byte $0D ; |    XX X| $3F96
    .byte $0D ; |    XX X| $3F97
    .byte $0E ; |    XXX | $3F98
    .byte $0E ; |    XXX | $3F99
    .byte $0F ; |    XXXX| $3F9A
    .byte $10 ; |   X    | $3F9B
    .byte $FF ; |XXXXXXXX| $3F9C
    .byte $FF ; |XXXXXXXX| $3F9D
    .byte $00 ; |        | $3F9E
    .byte $00 ; |        | $3F9F
    .byte $FF ; |XXXXXXXX| $3FA0
    .byte $FF ; |XXXXXXXX| $3FA1
    .byte $00 ; |        | $3FA2
    .byte $00 ; |        | $3FA3
    .byte $FF ; |XXXXXXXX| $3FA4
    .byte $FF ; |XXXXXXXX| $3FA5
    .byte $00 ; |        | $3FA6
    .byte $00 ; |        | $3FA7
    .byte $FF ; |XXXXXXXX| $3FA8
    .byte $FF ; |XXXXXXXX| $3FA9
    .byte $00 ; |        | $3FAA
    .byte $00 ; |        | $3FAB
    .byte $FF ; |XXXXXXXX| $3FAC
    .byte $FF ; |XXXXXXXX| $3FAD
    .byte $00 ; |        | $3FAE
    .byte $00 ; |        | $3FAF
    .byte $FF ; |XXXXXXXX| $3FB0
    .byte $FF ; |XXXXXXXX| $3FB1
    .byte $00 ; |        | $3FB2
    .byte $00 ; |        | $3FB3
    .byte $FF ; |XXXXXXXX| $3FB4
    .byte $FF ; |XXXXXXXX| $3FB5
    .byte $00 ; |        | $3FB6
    .byte $00 ; |        | $3FB7
    .byte $FF ; |XXXXXXXX| $3FB8
    .byte $FF ; |XXXXXXXX| $3FB9
    .byte $00 ; |        | $3FBA
    .byte $00 ; |        | $3FBB
    .byte $FF ; |XXXXXXXX| $3FBC
    .byte $FF ; |XXXXXXXX| $3FBD
    .byte $00 ; |        | $3FBE
    .byte $00 ; |        | $3FBF
    .byte $FF ; |XXXXXXXX| $3FC0
    .byte $FF ; |XXXXXXXX| $3FC1
    .byte $00 ; |        | $3FC2
    .byte $00 ; |        | $3FC3
    .byte $FF ; |XXXXXXXX| $3FC4
    .byte $FF ; |XXXXXXXX| $3FC5
    .byte $00 ; |        | $3FC6
    .byte $00 ; |        | $3FC7
    .byte $FF ; |XXXXXXXX| $3FC8
    .byte $FF ; |XXXXXXXX| $3FC9
    .byte $00 ; |        | $3FCA
    .byte $00 ; |        | $3FCB
    .byte $FF ; |XXXXXXXX| $3FCC
    .byte $FF ; |XXXXXXXX| $3FCD
    .byte $00 ; |        | $3FCE
    .byte $00 ; |        | $3FCF
    .byte $FF ; |XXXXXXXX| $3FD0
    .byte $FF ; |XXXXXXXX| $3FD1
    .byte $00 ; |        | $3FD2
    .byte $00 ; |        | $3FD3
    .byte $FF ; |XXXXXXXX| $3FD4
    .byte $FF ; |XXXXXXXX| $3FD5
    .byte $00 ; |        | $3FD6
    .byte $00 ; |        | $3FD7
    .byte $FF ; |XXXXXXXX| $3FD8
    .byte $FF ; |XXXXXXXX| $3FD9
    .byte $00 ; |        | $3FDA
    .byte $00 ; |        | $3FDB
    .byte $FF ; |XXXXXXXX| $3FDC
    .byte $FF ; |XXXXXXXX| $3FDD
    .byte $00 ; |        | $3FDE
    .byte $00 ; |        | $3FDF
    .byte $FF ; |XXXXXXXX| $3FE0
    .byte $FF ; |XXXXXXXX| $3FE1
    .byte $00 ; |        | $3FE2
    .byte $00 ; |        | $3FE3
    .byte $FF ; |XXXXXXXX| $3FE4
    .byte $FF ; |XXXXXXXX| $3FE5
    .byte $00 ; |        | $3FE6
    .byte $00 ; |        | $3FE7
    .byte $FF ; |XXXXXXXX| $3FE8
    .byte $FF ; |XXXXXXXX| $3FE9
    .byte $00 ; |        | $3FEA
    .byte $00 ; |        | $3FEB
    .byte $FF ; |XXXXXXXX| $3FEC
    .byte $FF ; |XXXXXXXX| $3FED
    .byte $00 ; |        | $3FEE
    .byte $00 ; |        | $3FEF
    .byte $FF ; |XXXXXXXX| $3FF0
    .byte $FF ; |XXXXXXXX| $3FF1

L3FF2:
    lda    BANK_0                   ; bankswitch, goto START

    .byte $FF ; |XXXXXXXX| $3FF5
    .byte $00 ; |        | $3FF6
    .byte $00 ; |        | $3FF7
    .byte $FF ; |XXXXXXXX| $3FF8
    .byte $FF ; |XXXXXXXX| $3FF9

       ORG $2FFA
      RORG $3FFA

    .word L3FF2,L3FF2,L3FF2