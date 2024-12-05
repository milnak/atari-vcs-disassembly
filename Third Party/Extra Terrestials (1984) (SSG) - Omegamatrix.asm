; Extra Terrestials
;
; Developed by Skill Screen Games,
; manufactured by Telcom Research Ltd. in Burlington, Ontario, Canada.
;
; President: Tom Banting
; Producer: Peter Banting
; Packaging & Artwork: J. Maitland Banting
; Game Design & Programming: Herman Quast
;
;
; Please consult Personal Computer Museum for more details on this incredible discovery!
; http://pcmuseum.ca/extraterrestrials.asp
;
;
;
;
;
; This is a rough disassembly of Extra Terrestials,
; not the original source code...
; Disassembled by Omegamatrix
;
; ET.cfg contents:
;
;      ORG 1000
;      CODE 1000 17B4
;      GFX 17B5 1FFF

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
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
HMP0    =  $20
HMP1    =  $21
VDELP0  =  $25
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXPPMM  =  $37
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      RIOT RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x4
ram_81             ds 8  ; x8
ram_89             ds 1  ; x1
ram_8A             ds 1  ; x24
ram_8B             ds 1  ; x4
ram_8C             ds 1  ; x6
ram_8D             ds 1  ; x1
ram_8E             ds 1  ; x1
ram_8F             ds 1  ; x1
ram_90             ds 1  ; x16
ram_91             ds 1  ; x1
ram_92             ds 1  ; x2
ram_93             ds 1  ; x1
ram_94             ds 1  ; x1
ram_95             ds 1  ; x1
ram_96             ds 1  ; x6
ram_97             ds 1  ; x1
ram_98             ds 1  ; x1
ram_99             ds 1  ; x1
ram_9A             ds 1  ; x1
ram_9B             ds 1  ; x1
ram_9C             ds 1  ; x2
ram_9D             ds 5  ; x1
ram_A2             ds 1  ; x2
ram_A3             ds 5  ; x1
ram_A8             ds 1  ; x2
ram_A9             ds 5  ; x1
ram_AE             ds 1  ; x7
ram_AF             ds 5  ; x1
ram_B4             ds 1  ; x2
ram_B5             ds 5  ; x1
ram_BA             ds 1  ; x3
ram_BB             ds 5  ; x1
ram_C0             ds 1  ; x3
ram_C1             ds 5  ; x1
ram_C6             ds 1  ; x3
ram_C7             ds 5  ; x1
ram_CC             ds 1  ; x3
ram_CD             ds 5  ; x1
ram_D2             ds 1  ; x4
ram_D3             ds 1  ; x6
ram_D4             ds 1  ; x3
ram_D5             ds 1  ; x2
ram_D6             ds 1  ; x1
ram_D7             ds 1  ; x6
ram_D8             ds 1  ; x21
ram_D9             ds 1  ; x12
ram_DA             ds 1  ; x9
ram_DB             ds 1  ; x4
ram_DC             ds 1  ; x5
ram_DD             ds 1  ; x5
ram_DE             ds 1  ; x1
ram_DF             ds 1  ; x10
ram_E0             ds 1  ; x2
ram_E1             ds 1  ; x8
ram_E2             ds 1  ; x6
ram_E3             ds 1  ; x6
ram_E4             ds 1  ; x21
ram_E5             ds 1  ; x8
ram_E6             ds 1  ; x8
ram_E7             ds 1  ; x1
ram_E8             ds 1  ; x4
ram_E9             ds 1  ; x1
ram_EA             ds 1  ; x4
ram_EB             ds 1  ; x1
ram_EC             ds 1  ; x6
ram_ED             ds 1  ; x4
ram_EE             ds 1  ; x4
ram_EF             ds 1  ; x1
ram_F0             ds 13 ; x10
ram_FD             ds 3  ; x1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE
       ORG $1000

START:
    sei                          ; 2
    cld                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    ldx    #$02                  ; 2
    jsr    L13AD                 ; 6
    jsr    L1366                 ; 6
L100D:
    inc    ram_D9                ; 5
    jsr    L1036                 ; 6
    jsr    L1498                 ; 6
    jsr    L16BD                 ; 6
    jsr    L170D                 ; 6
    jsr    L1554                 ; 6
    jsr    L1592                 ; 6
    jsr    L1677                 ; 6
    jsr    L1449                 ; 6
    jsr    L14E0                 ; 6
    jsr    L13B5                 ; 6
    jsr    L1075                 ; 6
    jsr    L10F7                 ; 6
    jmp    L100D                 ; 3

L1036:
    sta    HMCLR                 ; 3
    lda    #$02                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #$2B                  ; 2
    sta    TIM64T                ; 4
    lda    #$00                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$07                  ; 2
    sta    COLUBK                ; 3
    lda    #$28                  ; 2
    sta    VDELP0                ; 3
    lda    SWCHA                 ; 4
    eor    #$FF                  ; 2
    beq    L1074                 ; 2³
    eor    #$55                  ; 2
    eor    ram_D9                ; 3
    eor    ram_DC                ; 3
    rol                          ; 2
    rol                          ; 2
    sta    ram_DC                ; 3
L1074:
    rts                          ; 6

L1075:
    ldy    #$0A                  ; 2
    ldx    #$02                  ; 2
L1079:
    lda    ram_E1,X              ; 4
    and    #$F0                  ; 2
    bne    L10A4                 ; 2³
    lda    #$32                  ; 2
    sta.wy ram_E4,Y              ; 5
    dey                          ; 2
    dey                          ; 2
    lda    ram_E1,X              ; 4
    and    #$0F                  ; 2
    bne    L10B5                 ; 2³
    lda    #$32                  ; 2
    sta.wy ram_E4,Y              ; 5
    dex                          ; 2
    dey                          ; 2
    dey                          ; 2
    bpl    L1079                 ; 2³
    lda    ram_E4                ; 3
    eor    #$32                  ; 2
    bne    L10C3                 ; 2³
    sta    ram_E4                ; 3
    beq    L10C3                 ; 2³
L10A0:
    lda    ram_E1,X              ; 4
    and    #$F0                  ; 2
L10A4:
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_E4                ; 3
    lsr                          ; 2
    lsr                          ; 2
    adc    ram_E4                ; 3
    sta.wy ram_E4,Y              ; 5
    dey                          ; 2
    dey                          ; 2
    lda    ram_E1,X              ; 4
    and    #$0F                  ; 2
L10B5:
    sta    ram_E4                ; 3
    asl                          ; 2
    asl                          ; 2
    adc    ram_E4                ; 3
    sta.wy ram_E4,Y              ; 5
    dex                          ; 2
    dey                          ; 2
    dey                          ; 2
    bpl    L10A0                 ; 2³
L10C3:
    clc                          ; 2
    lda    ram_E4                ; 3
    adc    #$6E                  ; 2
    sta    ram_E4                ; 3
    lda    ram_E6                ; 3
    adc    #$00                  ; 2
    sta    ram_E6                ; 3
    lda    ram_E8                ; 3
    adc    #$37                  ; 2
    sta    ram_E8                ; 3
    lda    ram_EA                ; 3
    adc    #$A5                  ; 2
    sta    ram_EA                ; 3
    lda    ram_EC                ; 3
    adc    #$A5                  ; 2
    sta    ram_EC                ; 3
    lda    ram_EE                ; 3
    adc    #$6E                  ; 2
    sta    ram_EE                ; 3
    lda    #$1B                  ; 2
    sta    ram_E5                ; 3
    sta    ram_E7                ; 3
    sta    ram_E9                ; 3
    sta    ram_EB                ; 3
    sta    ram_ED                ; 3
    sta    ram_EF                ; 3
    rts                          ; 6

L10F7:
    lda    #$20                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
L10FD:
    lda    INTIM                 ; 4
    bne    L10FD                 ; 2³+1
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    CXCLR                 ; 3
    sta    VBLANK                ; 3
    lda    #$00                  ; 2
    sta    CTRLPF                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$04                  ; 2
L1112:
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    lda    (ram_EE),Y            ; 5
    ora    (ram_EC),Y            ; 5
    sta    PF2                   ; 3
    lda    (ram_EA),Y            ; 5
    sta    PF0                   ; 3
    lda    (ram_E8),Y            ; 5
    ora    (ram_E6),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_E4),Y            ; 5
    sta    PF2                   ; 3
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    lda    (ram_EE),Y            ; 5
    ora    (ram_EC),Y            ; 5
    sta    PF2                   ; 3
    lda    (ram_EA),Y            ; 5
    sta    PF0                   ; 3
    lda    (ram_E8),Y            ; 5
    ora    (ram_E6),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_E4),Y            ; 5
    sta    PF2                   ; 3
    dey                          ; 2
    bpl    L1112                 ; 2³
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    ldx    #$06                  ; 2
L1163:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    L1163                 ; 2³
    lda    ram_8B                ; 3
    and    #$70                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    ram_8B                ; 3
    and    #$0F                  ; 2
    adc    L1918,Y               ; 4
    sta    ram_F0                ; 3
    dec    ram_F0                ; 5
    lda    ram_8A                ; 3
    and    #$70                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    ram_8A                ; 3
    and    #$0F                  ; 2
    adc    L1918,Y               ; 4
    asl                          ; 2
    tay                          ; 2
    dey                          ; 2
    lda    #$84                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP1                ; 3
    lda    #$D8                  ; 2
    sta    COLUPF                ; 3
    lda    #$FF                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    ldx    #$07                  ; 2
    lda.w  ram_D8                ; 4
    and    #$02                  ; 2
    bne    L11B8                 ; 2³
    lda.w  ram_D3                ; 4
    bne    L11BA                 ; 2³
    lda.w  ram_D9                ; 4
    and    #$04                  ; 2
    beq    L11BA                 ; 2³
L11B8:
    ldx    #$4F                  ; 2
L11BA:
    stx    COLUBK                ; 3
    lda    #$07                  ; 2
    sta    ram_DA                ; 3
L11C0:
    inc    ram_F0                ; 5
    ldx    ram_F0                ; 3
    txa                          ; 2
    and    #$F8                  ; 2
    beq    L11CB                 ; 2³
    ldx    #$08                  ; 2
L11CB:
    iny                          ; 2
    tya                          ; 2
    and    #$F0                  ; 2
    beq    L11E0                 ; 2³
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ram_81,X              ; 4
    sta    GRP1                  ; 3
    iny                          ; 2
    lda    #$00                  ; 2
    beq    L11F1                 ; 3   always branch

L11E0:
    lda    (ram_DD),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP0                ; 3
    lda    (ram_DF),Y            ; 5
    sta    GRP0                  ; 3
    lda    ram_81,X              ; 4
    sta    GRP1                  ; 3
    iny                          ; 2
    lda    (ram_DF),Y            ; 5
L11F1:
    ldx    #$00                  ; 2
    dec    ram_DA                ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    bpl    L11C0                 ; 2³
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    lda    #$9B                  ; 2
    sta    COLUPF                ; 3
    lda    #$05                  ; 2
    sta    ram_DA                ; 3
L1209:
    jsr    L1273                 ; 6
    jsr    L1273                 ; 6
    jsr    L1273                 ; 6
    jsr    L12B7                 ; 6
    ldx    ram_DA                ; 3
    lda    ram_AE,X              ; 4
    sta    ram_E4                ; 3
    jsr    L12B7                 ; 6
    ldx    ram_DA                ; 3
    lda    ram_B4,X              ; 4
    sta    ram_E5                ; 3
    jsr    L12B7                 ; 6
    lda    #$34                  ; 2
    sta    COLUPF                ; 3
    jsr    L12B7                 ; 6
    jsr    L12F5                 ; 6
    jsr    L12F5                 ; 6
    jsr    L12B7                 ; 6
    lda    #$9B                  ; 2
    sta    COLUPF                ; 3
    jsr    L12B7                 ; 6
    jsr    L12B7                 ; 6
    dec    ram_DA                ; 5
    bpl    L1209                 ; 2³
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$FF                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    ldx    #$19                  ; 2
L126D:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    L126D                 ; 2³
    rts                          ; 6

L1273:
    inc    ram_F0                ; 5
    ldx    ram_F0                ; 3
    txa                          ; 2
    and    #$F8                  ; 2
    beq    L127E                 ; 2³
    ldx    #$08                  ; 2
L127E:
    iny                          ; 2
    tya                          ; 2
    and    #$F0                  ; 2
    bne    L12A8                 ; 2³
    lda    (ram_DD),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP0                ; 3
    lda    (ram_DF),Y            ; 5
    sta    GRP0                  ; 3
    lda    ram_81,X              ; 4
    sta    GRP1                  ; 3
    iny                          ; 2
    lda    (ram_DF),Y            ; 5
L1295:
    ldx    ram_DA                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ram_9C,X              ; 4
    sta    PF0                   ; 3
    lda    ram_A2,X              ; 4
    sta    PF1                   ; 3
    lda    ram_A8,X              ; 4
    sta    PF2                   ; 3
    rts                          ; 6

L12A8:
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ram_81,X              ; 4
    sta    GRP1                  ; 3
    iny                          ; 2
    lda    #$00                  ; 2
    beq    L1295                 ; 3   always branch

L12B7:
    inc    ram_F0                ; 5
    ldx    ram_F0                ; 3
    txa                          ; 2
    and    #$F8                  ; 2
    beq    L12C2                 ; 2³
    ldx    #$08                  ; 2
L12C2:
    iny                          ; 2
    tya                          ; 2
    and    #$F0                  ; 2
    bne    L12E6                 ; 2³
    lda    (ram_DD),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP0                ; 3
    lda    (ram_DF),Y            ; 5
    sta    GRP0                  ; 3
    lda    ram_81,X              ; 4
    sta    GRP1                  ; 3
    iny                          ; 2
    lda    (ram_DF),Y            ; 5
L12D9:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    #$00                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    rts                          ; 6

L12E6:
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ram_81,X              ; 4
    sta    GRP1                  ; 3
    iny                          ; 2
    lda    #$00                  ; 2
    beq    L12D9                 ; 3   always branch

L12F5:
    inc    ram_F0                ; 5
    ldx    ram_F0                ; 3
    txa                          ; 2
    and    #$F8                  ; 2
    beq    L1300                 ; 2³+1
    ldx    #$08                  ; 2
L1300:
    lda    ram_81,X              ; 4
    tax                          ; 2
    iny                          ; 2
    tya                          ; 2
    and    #$F0                  ; 2
    beq    L1330                 ; 2³
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    ram_E4                ; 3
    sta    PF0                   ; 3
    lda    ram_E5                ; 3
    sta    PF1                   ; 3
    ldx    ram_DA                ; 3
    lda    ram_BA,X              ; 4
    sta    PF2                   ; 3
    lda    ram_C0,X              ; 4
    sta    PF0                   ; 3
    lda    ram_C6,X              ; 4
    sta    PF1                   ; 3
    lda    ram_CC,X              ; 4
    sta    PF2                   ; 3
    iny                          ; 2
    lda    #$00                  ; 2
    beq    L1359                 ; 3   always branch

L1330:
    lda    (ram_DD),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP0                ; 3
    lda    (ram_DF),Y            ; 5
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    ram_E4                ; 3
    sta    PF0                   ; 3
    lda    ram_E5                ; 3
    sta    PF1                   ; 3
    ldx    ram_DA                ; 3
    lda    ram_BA,X              ; 4
    sta    PF2                   ; 3
    lda    ram_C0,X              ; 4
    sta    PF0                   ; 3
    lda    ram_C6,X              ; 4
    sta    PF1                   ; 3
    lda    ram_CC,X              ; 4
    sta    PF2                   ; 3
    iny                          ; 2
    lda    (ram_DF),Y            ; 5
L1359:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    #$00                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    rts                          ; 6

L1366:
    lda    #$03                  ; 2
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    HMP0                  ; 3
    lda    #$0F                  ; 2
    sta    ram_90                ; 3
    lda    #$18                  ; 2
    sta    ram_91                ; 3
    lda    #$20                  ; 2
    sta    ram_8C                ; 3
    sta    ram_92                ; 3
    lda    #$30                  ; 2
    sta    ram_8D                ; 3
    sta    ram_93                ; 3
    lda    #$40                  ; 2
    sta    ram_8E                ; 3
    sta    ram_94                ; 3
    lda    #$00                  ; 2
    sta    ram_8F                ; 3
    sta    ram_95                ; 3
    lda    #$0D                  ; 2
    sta    ram_96                ; 3
    sta    ram_97                ; 3
    sta    ram_98                ; 3
    sta    ram_99                ; 3
    sta    ram_9A                ; 3
    sta    ram_9B                ; 3
    lda    #$01                  ; 2
    sta    ram_80                ; 3
    jmp    L13EF                 ; 3

L13AD:
    lda    #$00                  ; 2
L13AF:
    inx                          ; 2
    sta    ram_FD,X              ; 4
    bne    L13AF                 ; 2³
    rts                          ; 6

L13B5:
    lda    SWCHB                 ; 4
    and    #$03                  ; 2
    cmp    ram_D5                ; 3
    bne    L13BF                 ; 2³
L13BE:
    rts                          ; 6

L13BF:
    sta    ram_D5                ; 3
    lsr                          ; 2
    bcs    L13DA                 ; 2³
    lda    #$03                  ; 2
    sta    ram_D3                ; 3
    lda    #$00                  ; 2
    sta    ram_E1                ; 3
    sta    ram_E2                ; 3
    sta    ram_E3                ; 3
L13D0:
    lda    #$90                  ; 2
    sta    ram_D8                ; 3
    lda    #$04                  ; 2
    sta    ram_D4                ; 3
    bne    L13FF                 ; 3   always branch

L13DA:
    lsr                          ; 2
    bcs    L13BE                 ; 2³
    lda    ram_D2                ; 3
    adc    #$40                  ; 2
    sta    ram_D2                ; 3
    inc    ram_80                ; 5
    lda    ram_80                ; 3
    cmp    #$05                  ; 2
    bne    L13EF                 ; 2³
    lda    #$01                  ; 2
    sta    ram_80                ; 3
L13EF:
    sta    ram_E1                ; 3
    lda    #$00                  ; 2
    sta    ram_E2                ; 3
    sta    ram_E3                ; 3
    lda    #$03                  ; 2
    sta    ram_D3                ; 3
    lda    #$80                  ; 2
    sta    ram_D8                ; 3
L13FF:
    lda    #$20                  ; 2
    sta    ram_D7                ; 3
    lda    #$60                  ; 2
    sta    ram_8A                ; 3
    lda    #$00                  ; 2
    sta    ram_8B                ; 3
    ldx    #$04                  ; 2
L140D:
    lda    #$33                  ; 2
    sta    ram_9C,X              ; 4
    sta    ram_A8,X              ; 4
    sta    ram_A3,X              ; 4
    lda    #$CC                  ; 2
    sta    ram_A2,X              ; 4
    sta    ram_9D,X              ; 4
    sta    ram_A9,X              ; 4
    lda    #$00                  ; 2
    sta    ram_AE,X              ; 4
    sta    ram_BA,X              ; 4
    sta    ram_C0,X              ; 4
    sta    ram_CC,X              ; 4
    sta    ram_B5,X              ; 4
    sta    ram_C7,X              ; 4
    lda    #$00                  ; 2
    sta    ram_B4,X              ; 4
    sta    ram_C6,X              ; 4
    sta    ram_AF,X              ; 4
    sta    ram_BB,X              ; 4
    sta    ram_C1,X              ; 4
    sta    ram_CD,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    L140D                 ; 2³
    ldx    #$03                  ; 2
L143F:
    lda    ram_8C,X              ; 4
    and    #$7F                  ; 2
    sta    ram_8C,X              ; 4
    dex                          ; 2
    bpl    L143F                 ; 2³
    rts                          ; 6

L1449:
    lda    ram_D9                ; 3
    asl                          ; 2
    and    #$30                  ; 2
    bne    L1452                 ; 2³
    lda    #$20                  ; 2
L1452:
    tax                          ; 2
    lda    ram_D7                ; 3
    and    #$FE                  ; 2
    beq    L1481                 ; 2³
    and    #$F8                  ; 2
    beq    L1488                 ; 2³
L145D:
    txa                          ; 2
    ora    ram_D2                ; 3
    sta    ram_DF                ; 3
    and    #$CF                  ; 2
    sta    ram_DD                ; 3
    lda    #$F8                  ; 2
    sta    ram_E0                ; 3
    sta    ram_DE                ; 3
L146C:
    ldy    #$07                  ; 2
    txa                          ; 2
    lsr                          ; 2
    tax                          ; 2
    dex                          ; 2
L1472:
    lda    L1900,X               ; 4
    sta.wy ram_81,Y              ; 5
    dex                          ; 2
    dey                          ; 2
    bpl    L1472                 ; 2³
    lda    #$00                  ; 2
    sta    ram_89                ; 3
    rts                          ; 6

L1481:
    lda    ram_D9                ; 3
    lsr                          ; 2
    bcs    L145D                 ; 2³
    bcc    L148E                 ; 3   always branch

L1488:
    lda    ram_D9                ; 3
    and    #$03                  ; 2
    bne    L145D                 ; 2³
L148E:
    lda    #$5C                  ; 2
    sta    ram_DF                ; 3
    lda    #$19                  ; 2
    sta    ram_E0                ; 3
    bne    L146C                 ; 3   always branch

L1498:
    lda    ram_D8                ; 3
    and    #$03                  ; 2
    beq    L14B2                 ; 2³
    lsr                          ; 2
    bcs    L14A7                 ; 2³
    ldx    #$08                  ; 2
    lda    #$FD                  ; 2
    bne    L14AB                 ; 3   always branch

L14A7:
    ldx    #$09                  ; 2
    lda    #$FE                  ; 2
L14AB:
    and    ram_D8                ; 3
    sta    ram_D8                ; 3
    jmp    L14C9                 ; 3

L14B2:
    lda    ram_D9                ; 3
    and    #$07                  ; 2
    bne    L14D9                 ; 2³
    lda    ram_D2                ; 3
    and    #$C0                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    ram_D9                ; 3
    and    #$08                  ; 2
    beq    L14C9                 ; 2³
    inx                          ; 2
L14C9:
    lda    L196C,X               ; 4
    sta    AUDC0                 ; 3
    lda    L1976,X               ; 4
    sta    AUDF0                 ; 3
    lda    L1980,X               ; 4
    sta    AUDV0                 ; 3
    rts                          ; 6

L14D9:
    lda    #$00                  ; 2
    sta    AUDC0                 ; 3
    sta    AUDF0                 ; 3
    rts                          ; 6

L14E0:
    lda    ram_D8                ; 3
    and    #$70                  ; 2
    beq    L1502                 ; 2³+1
    asl                          ; 2
    bpl    L14EE                 ; 2³
    ldx    #$01                  ; 2
    jmp    L14FA                 ; 3

L14EE:
    asl                          ; 2
    bpl    L14F8                 ; 2³
    dec    ram_D3                ; 5
    ldx    #$2A                  ; 2
    jmp    L14FA                 ; 3

L14F8:
    ldx    #$7D                  ; 2
L14FA:
    stx    ram_DB                ; 3
    lda    ram_D8                ; 3
    and    #$8F                  ; 2
    sta    ram_D8                ; 3
L1502:
    ldx    ram_DB                ; 3
    beq    L151D                 ; 2³
    lda    ram_D9                ; 3
    and    #$03                  ; 2
    bne    L151D                 ; 2³
    lda    L198A,X               ; 4
    bmi    L151E                 ; 2³
    ldx    #$04                  ; 2
    stx    AUDC1                 ; 3
    sta    AUDF1                 ; 3
    lda    #$07                  ; 2
    sta    AUDV1                 ; 3
    inc    ram_DB                ; 5
L151D:
    rts                          ; 6

L151E:
    ldx    #$00                  ; 2
    stx    AUDC1                 ; 3
    stx    AUDF1                 ; 3
    stx    AUDV1                 ; 3
    stx    ram_DB                ; 3
    lsr                          ; 2
    bcc    L1530                 ; 2³
    lda    #$00                  ; 2
    sta    ram_D8                ; 3
    rts                          ; 6

L1530:
    lsr                          ; 2
    bcc    L154D                 ; 2³
    lda    ram_D3                ; 3
    beq    L1544                 ; 2³
    lda    #$90                  ; 2
    sta    ram_D8                ; 3
    lda    #$60                  ; 2
    sta    ram_8A                ; 3
    lda    #$00                  ; 2
    sta    ram_8B                ; 3
    rts                          ; 6

L1544:
    lda    #$00                  ; 2
    sta    ram_D7                ; 3
    lda    #$03                  ; 2
    sta    ram_D3                ; 3
    rts                          ; 6

L154D:
    lda    ram_D4                ; 3
    bne    L151D                 ; 2³
    jmp    L13D0                 ; 3

L1554:
    lda    ram_D9                ; 3
    and    #$03                  ; 2
    tax                          ; 2
    inx                          ; 2
    inx                          ; 2
    stx    ram_EC                ; 3
    jsr    L1729                 ; 6
    eor    #$FF                  ; 2
    and    ram_96,X              ; 4
    lsr                          ; 2
    bcc    L1571                 ; 2³
    beq    L156D                 ; 2³
    bit    ram_DC                ; 3
    bmi    L1571                 ; 2³
L156D:
    jsr    L162B                 ; 6
    rts                          ; 6

L1571:
    lsr                          ; 2
    bcc    L157E                 ; 2³
    beq    L157A                 ; 2³
    bit    ram_DC                ; 3
    bmi    L157E                 ; 2³
L157A:
    jsr    L1641                 ; 6
    rts                          ; 6

L157E:
    lsr                          ; 2
    bcc    L158B                 ; 2³
    beq    L1587                 ; 2³
    bit    ram_DC                ; 3
    bmi    L158B                 ; 2³
L1587:
    jsr    L1657                 ; 6
    rts                          ; 6

L158B:
    lsr                          ; 2
    bcc    L1591                 ; 2³
    jsr    L1666                 ; 6
L1591:
    rts                          ; 6

L1592:
    lda    ram_D9                ; 3
    ldx    #$01                  ; 2
    and    #$07                  ; 2
    cmp    #$03                  ; 2
    beq    L15A5                 ; 2³
    and    #$01                  ; 2
    tax                          ; 2
    stx    ram_ED                ; 3
    bit    ram_D8                ; 3
    bpl    L15A8                 ; 2³
L15A5:
    stx    ram_ED                ; 3
    rts                          ; 6

L15A8:
    lda    SWCHA                 ; 4
    cpx    #$01                  ; 2
    beq    L15B3                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
L15B3:
    sta    ram_E4                ; 3
    jsr    L1729                 ; 6
    ora    ram_E4                ; 3
    lsr                          ; 2
    bcs    L15D3                 ; 2³
    cpx    #$00                  ; 2
    bne    L15CF                 ; 2³
    ldy    ram_E6                ; 3
    lda    ram_90                ; 3
    cmp    L1C01,Y               ; 4
    beq    L1624                 ; 2³+1
    cmp    L1C02,Y               ; 4
    beq    L1624                 ; 2³+1
L15CF:
    jsr    L162B                 ; 6
    rts                          ; 6

L15D3:
    lsr                          ; 2
    bcs    L15EC                 ; 2³
    cpx    #$00                  ; 2
    bne    L15E8                 ; 2³
    ldy    ram_E6                ; 3
    lda    ram_90                ; 3
    cmp    L1C00,Y               ; 4
    beq    L1624                 ; 2³+1
    cmp    L1C01,Y               ; 4
    beq    L1624                 ; 2³+1
L15E8:
    jsr    L1641                 ; 6
    rts                          ; 6

L15EC:
    lsr                          ; 2
    bcs    L1608                 ; 2³+1
    cpx    #$00                  ; 2
    bne    L15FC                 ; 2³
    ldy    ram_E5                ; 3
    lda    L1C0D,Y               ; 4
    cmp    ram_90                ; 3
    beq    L1624                 ; 2³+1
L15FC:
    lda    #$10                  ; 2
    sta    HMP0,X                ; 4
    lda    #$08                  ; 2
    sta    REFP0,X               ; 4
    jsr    L1657                 ; 6
    rts                          ; 6

L1608:
    lsr                          ; 2
    bcs    L1623                 ; 2³
    cpx    #$00                  ; 2
    bne    L1618                 ; 2³
    ldy    ram_E5                ; 3
    lda    L1C18,Y               ; 4
    cmp    ram_90                ; 3
    beq    L1624                 ; 2³
L1618:
    lda    #$F0                  ; 2
    sta    HMP0,X                ; 4
    lda    #$00                  ; 2
    sta    REFP0,X               ; 4
    jsr    L1666                 ; 6
L1623:
    rts                          ; 6

L1624:
    lda    ram_D8                ; 3
    ora    #$02                  ; 2
    sta    ram_D8                ; 3
    rts                          ; 6

L162B:
    inc    ram_8A,X              ; 6
    lda    ram_8A,X              ; 4
    and    #$0F                  ; 2
    cmp    #$0C                  ; 2
    bmi    L163C                 ; 2³
    lda    ram_8A,X              ; 4
    clc                          ; 2
    adc    #$04                  ; 2
    sta    ram_8A,X              ; 4
L163C:
    lda    #$0D                  ; 2
    sta    ram_96,X              ; 4
    rts                          ; 6

L1641:
    dec    ram_8A,X              ; 6
    lda    ram_8A,X              ; 4
    and    #$0F                  ; 2
    cmp    #$0C                  ; 2
    bmi    L1652                 ; 2³
    lda    ram_8A,X              ; 4
    sec                          ; 2
    sbc    #$04                  ; 2
    sta    ram_8A,X              ; 4
L1652:
    lda    #$0E                  ; 2
    sta    ram_96,X              ; 4
    rts                          ; 6

L1657:
    dec    ram_90,X              ; 6
    lda    #$9F                  ; 2
    cmp    ram_90,X              ; 4
    bcs    L1661                 ; 2³
    sta    ram_90,X              ; 4
L1661:
    lda    #$07                  ; 2
    sta    ram_96,X              ; 4
    rts                          ; 6

L1666:
    inc    ram_90,X              ; 6
    lda    #$9F                  ; 2
    cmp    ram_90,X              ; 4
    bcs    L1672                 ; 2³
    lda    #$00                  ; 2
    sta    ram_90,X              ; 4
L1672:
    lda    #$0B                  ; 2
    sta    ram_96,X              ; 4
    rts                          ; 6

L1677:
    ldx    ram_ED                ; 3
    cpx    #$01                  ; 2
    beq    L16AA                 ; 2³
    jsr    L1761                 ; 6
    beq    L16AA                 ; 2³
    and.wy ram_AE,Y              ; 4
    beq    L16AA                 ; 2³
    eor    #$FF                  ; 2
    and.wy ram_AE,Y              ; 4
    sta.wy ram_AE,Y              ; 5
    sed                          ; 2
    clc                          ; 2
    lda    ram_E1                ; 3
    adc    #$01                  ; 2
    sta    ram_E1                ; 3
    lda    ram_E2                ; 3
    adc    #$00                  ; 2
    sta    ram_E2                ; 3
    lda    ram_E3                ; 3
    adc    #$00                  ; 2
    sta    ram_E3                ; 3
    cld                          ; 2
    lda    ram_D8                ; 3
    ora    #$01                  ; 2
    sta    ram_D8                ; 3
L16AA:
    ldx    ram_EC                ; 3
    lda    ram_8A,X              ; 4
    asl                          ; 2
    bcs    L16BC                 ; 2³
    jsr    L1761                 ; 6
    beq    L16BC                 ; 2³
    ora.wy ram_AE,Y              ; 4
    sta.wy ram_AE,Y              ; 5
L16BC:
    rts                          ; 6

L16BD:
    bit    ram_D8                ; 3
    bmi    L16D3                 ; 2³
    lda    CXPPMM                ; 3
    bmi    L16CF                 ; 2³
    lda    ram_D9                ; 3
    and    #$7F                  ; 2
    bne    L16D4                 ; 2³
    dec    ram_D7                ; 5
    bne    L16D4                 ; 2³
L16CF:
    lda    #$A0                  ; 2
    sta    ram_D8                ; 3
L16D3:
    rts                          ; 6

L16D4:
    bit    ram_D8                ; 3
    bmi    L16D3                 ; 2³
    ldx    #$03                  ; 2
L16DA:
    lda    ram_8C,X              ; 4
    cmp    ram_8A                ; 3
    bne    L1709                 ; 2³+1
    lda    ram_92,X              ; 4
    cmp    ram_90                ; 3
    bne    L1709                 ; 2³+1
    lda    ram_8C,X              ; 4
    ora    #$80                  ; 2
    sta    ram_8C,X              ; 4
    sed                          ; 2
    clc                          ; 2
    lda    ram_E2                ; 3
    adc    #$01                  ; 2
    sta    ram_E2                ; 3
    lda    ram_E3                ; 3
    adc    #$00                  ; 2
    sta    ram_E3                ; 3
    cld                          ; 2
    lda    ram_D7                ; 3
    adc    #$10                  ; 2
    sta    ram_D7                ; 3
    dec    ram_D4                ; 5
    lda    ram_D8                ; 3
    ora    #$40                  ; 2
    sta    ram_D8                ; 3
L1709:
    dex                          ; 2
    bpl    L16DA                 ; 2³+1
    rts                          ; 6

L170D:
    lda    ram_8A                ; 3
    and    #$0F                  ; 2
    bne    L1722                 ; 2³
    lda    ram_8A                ; 3
    and    #$70                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_E6                ; 3
    adc    ram_D6                ; 3
    sta    ram_E5                ; 3
    rts                          ; 6

L1722:
    lda    #$00                  ; 2
    sta    ram_E5                ; 3
    sta    ram_E6                ; 3
    rts                          ; 6

L1729:
    lda    ram_8A,X              ; 4
    and    #$0F                  ; 2
    beq    L1732                 ; 2³
    lda    #$0C                  ; 2
    rts                          ; 6

L1732:
    lda    ram_90,X              ; 4
    and    #$07                  ; 2
    beq    L173B                 ; 2³
L1738:
    lda    #$03                  ; 2
    rts                          ; 6

L173B:
    lda    ram_90,X              ; 4
    and    #$08                  ; 2
    bne    L1752                 ; 2³
    lda    ram_8A,X              ; 4
    and    #$10                  ; 2
    beq    L1758                 ; 2³
L1747:
    lda    ram_8A,X              ; 4
    and    #$7F                  ; 2
    cmp    #$60                  ; 2
    bcs    L1738                 ; 2³
    lda    #$02                  ; 2
    rts                          ; 6

L1752:
    lda    ram_8A,X              ; 4
    and    #$10                  ; 2
    beq    L1747                 ; 2³
L1758:
    lda    ram_8A,X              ; 4
    and    #$7F                  ; 2
    beq    L1738                 ; 2³
    lda    #$01                  ; 2
    rts                          ; 6

L1761:
    lda    ram_8A,X              ; 4
    and    #$7F                  ; 2
    cmp    #$60                  ; 2
    bcs    L17B2                 ; 2³
    and    #$0F                  ; 2
    bne    L17B2                 ; 2³
    lda    ram_8A,X              ; 4
    and    #$10                  ; 2
    beq    L1790                 ; 2³
    lda    ram_90,X              ; 4
    clc                          ; 2
    adc    #$04                  ; 2
    cmp    #$A0                  ; 2
    bcc    L177E                 ; 2³
    lda    #$00                  ; 2
L177E:
    tay                          ; 2
    and    #$07                  ; 2
    cmp    #$05                  ; 2
    bcs    L17B2                 ; 2³
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L1934,Y               ; 4
    jmp    L17A1                 ; 3

L1790:
    lda    ram_90,X              ; 4
    tay                          ; 2
    and    #$07                  ; 2
    cmp    #$05                  ; 2
    bcs    L17B2                 ; 2³
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L1920,Y               ; 4
L17A1:
    sta    ram_E4                ; 3
    lda    ram_8A,X              ; 4
    and    #$70                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    adc    L1948,Y               ; 4
    tay                          ; 2
    lda    ram_E4                ; 3
    rts                          ; 6

L17B2:
    lda    #$00                  ; 2
    rts                          ; 6

    .byte $FF ; |XXXXXXXX| $17B5  free bytes
    .byte $FF ; |XXXXXXXX| $17B6
    .byte $FF ; |XXXXXXXX| $17B7
    .byte $FF ; |XXXXXXXX| $17B8
    .byte $FF ; |XXXXXXXX| $17B9
    .byte $FF ; |XXXXXXXX| $17BA
    .byte $FF ; |XXXXXXXX| $17BB
    .byte $FF ; |XXXXXXXX| $17BC
    .byte $FF ; |XXXXXXXX| $17BD
    .byte $FF ; |XXXXXXXX| $17BE
    .byte $FF ; |XXXXXXXX| $17BF
    .byte $FF ; |XXXXXXXX| $17C0
    .byte $FF ; |XXXXXXXX| $17C1
    .byte $FF ; |XXXXXXXX| $17C2
    .byte $FF ; |XXXXXXXX| $17C3
    .byte $FF ; |XXXXXXXX| $17C4
    .byte $FF ; |XXXXXXXX| $17C5
    .byte $FF ; |XXXXXXXX| $17C6
    .byte $FF ; |XXXXXXXX| $17C7
    .byte $FF ; |XXXXXXXX| $17C8
    .byte $FF ; |XXXXXXXX| $17C9
    .byte $FF ; |XXXXXXXX| $17CA
    .byte $FF ; |XXXXXXXX| $17CB
    .byte $FF ; |XXXXXXXX| $17CC
    .byte $FF ; |XXXXXXXX| $17CD
    .byte $FF ; |XXXXXXXX| $17CE
    .byte $FF ; |XXXXXXXX| $17CF
    .byte $FF ; |XXXXXXXX| $17D0
    .byte $FF ; |XXXXXXXX| $17D1
    .byte $FF ; |XXXXXXXX| $17D2
    .byte $FF ; |XXXXXXXX| $17D3
    .byte $FF ; |XXXXXXXX| $17D4
    .byte $FF ; |XXXXXXXX| $17D5
    .byte $FF ; |XXXXXXXX| $17D6
    .byte $FF ; |XXXXXXXX| $17D7
    .byte $FF ; |XXXXXXXX| $17D8
    .byte $FF ; |XXXXXXXX| $17D9
    .byte $FF ; |XXXXXXXX| $17DA
    .byte $FF ; |XXXXXXXX| $17DB
    .byte $FF ; |XXXXXXXX| $17DC
    .byte $FF ; |XXXXXXXX| $17DD
    .byte $FF ; |XXXXXXXX| $17DE
    .byte $FF ; |XXXXXXXX| $17DF
    .byte $FF ; |XXXXXXXX| $17E0
    .byte $FF ; |XXXXXXXX| $17E1
    .byte $FF ; |XXXXXXXX| $17E2
    .byte $FF ; |XXXXXXXX| $17E3
    .byte $FF ; |XXXXXXXX| $17E4
    .byte $FF ; |XXXXXXXX| $17E5
    .byte $FF ; |XXXXXXXX| $17E6
    .byte $FF ; |XXXXXXXX| $17E7
    .byte $FF ; |XXXXXXXX| $17E8
    .byte $FF ; |XXXXXXXX| $17E9
    .byte $FF ; |XXXXXXXX| $17EA
    .byte $FF ; |XXXXXXXX| $17EB
    .byte $FF ; |XXXXXXXX| $17EC
    .byte $FF ; |XXXXXXXX| $17ED
    .byte $FF ; |XXXXXXXX| $17EE
    .byte $FF ; |XXXXXXXX| $17EF
    .byte $FF ; |XXXXXXXX| $17F0
    .byte $FF ; |XXXXXXXX| $17F1
    .byte $FF ; |XXXXXXXX| $17F2
    .byte $FF ; |XXXXXXXX| $17F3
    .byte $FF ; |XXXXXXXX| $17F4
    .byte $FF ; |XXXXXXXX| $17F5
    .byte $FF ; |XXXXXXXX| $17F6
    .byte $FF ; |XXXXXXXX| $17F7
    .byte $FF ; |XXXXXXXX| $17F8
    .byte $FF ; |XXXXXXXX| $17F9
    .byte $FF ; |XXXXXXXX| $17FA
    .byte $FF ; |XXXXXXXX| $17FB
    .byte $FF ; |XXXXXXXX| $17FC
    .byte $FF ; |XXXXXXXX| $17FD
    .byte $FF ; |XXXXXXXX| $17FE
    .byte $FF ; |XXXXXXXX| $17FF

       ORG $1800

    .byte $FA ; |XXXXX X | $1800
    .byte $FA ; |XXXXX X | $1801
    .byte $FA ; |XXXXX X | $1802
    .byte $FA ; |XXXXX X | $1803
    .byte $FA ; |XXXXX X | $1804
    .byte $FA ; |XXXXX X | $1805
    .byte $FA ; |XXXXX X | $1806
    .byte $FA ; |XXXXX X | $1807
    .byte $FA ; |XXXXX X | $1808
    .byte $FA ; |XXXXX X | $1809
    .byte $FA ; |XXXXX X | $180A
    .byte $FA ; |XXXXX X | $180B
    .byte $FA ; |XXXXX X | $180C
    .byte $FA ; |XXXXX X | $180D
    .byte $F3 ; |XXXX  XX| $180E
    .byte $F3 ; |XXXX  XX| $180F

    .byte $7E ; | XXXXXX | $1810
    .byte $FB ; |XXXXX XX| $1811
    .byte $FF ; |XXXXXXXX| $1812
    .byte $7E ; | XXXXXX | $1813
    .byte $60 ; | XX     | $1814
    .byte $60 ; | XX     | $1815
    .byte $60 ; | XX     | $1816
    .byte $61 ; | XX    X| $1817
    .byte $62 ; | XX   X | $1818
    .byte $FC ; |XXXXXX  | $1819
    .byte $FE ; |XXXXXXX | $181A
    .byte $FE ; |XXXXXXX | $181B
    .byte $FE ; |XXXXXXX | $181C
    .byte $CE ; |XX  XXX | $181D
    .byte $74 ; | XXX X  | $181E
    .byte $07 ; |     XXX| $181F
    .byte $00 ; |        | $1820
    .byte $00 ; |        | $1821
    .byte $7E ; | XXXXXX | $1822
    .byte $FB ; |XXXXX XX| $1823
    .byte $FF ; |XXXXXXXX| $1824
    .byte $7E ; | XXXXXX | $1825
    .byte $60 ; | XX     | $1826
    .byte $60 ; | XX     | $1827
    .byte $63 ; | XX   XX| $1828
    .byte $FC ; |XXXXXX  | $1829
    .byte $FE ; |XXXXXXX | $182A
    .byte $FE ; |XXXXXXX | $182B
    .byte $FE ; |XXXXXXX | $182C
    .byte $EE ; |XXX XXX | $182D
    .byte $44 ; | X   X  | $182E
    .byte $77 ; | XXX XXX| $182F
    .byte $00 ; |        | $1830
    .byte $00 ; |        | $1831
    .byte $00 ; |        | $1832
    .byte $00 ; |        | $1833
    .byte $7E ; | XXXXXX | $1834
    .byte $FB ; |XXXXX XX| $1835
    .byte $FF ; |XXXXXXXX| $1836
    .byte $FE ; |XXXXXXX | $1837
    .byte $60 ; | XX     | $1838
    .byte $FC ; |XXXXXX  | $1839
    .byte $FE ; |XXXXXXX | $183A
    .byte $FE ; |XXXXXXX | $183B
    .byte $FE ; |XXXXXXX | $183C
    .byte $EE ; |XXX XXX | $183D
    .byte $47 ; | X   XXX| $183E
    .byte $70 ; | XXX    | $183F

    .byte $6A ; | XX X X | $1840
    .byte $6A ; | XX X X | $1841
    .byte $6A ; | XX X X | $1842
    .byte $6A ; | XX X X | $1843
    .byte $6A ; | XX X X | $1844
    .byte $6A ; | XX X X | $1845
    .byte $6A ; | XX X X | $1846
    .byte $6A ; | XX X X | $1847
    .byte $6A ; | XX X X | $1848
    .byte $6A ; | XX X X | $1849
    .byte $6A ; | XX X X | $184A
    .byte $6A ; | XX X X | $184B
    .byte $6A ; | XX X X | $184C
    .byte $6A ; | XX X X | $184D
    .byte $2D ; |  X XX X| $184E
    .byte $2D ; |  X XX X| $184F

    .byte $0C ; |    XX  | $1850
    .byte $1E ; |   XXXX | $1851
    .byte $1B ; |   XX XX| $1852
    .byte $1F ; |   XXXXX| $1853
    .byte $0E ; |    XXX | $1854
    .byte $08 ; |    X   | $1855
    .byte $1E ; |   XXXX | $1856
    .byte $1B ; |   XX XX| $1857
    .byte $1D ; |   XXX X| $1858
    .byte $1E ; |   XXXX | $1859
    .byte $5F ; | X XXXXX| $185A
    .byte $5F ; | X XXXXX| $185B
    .byte $5E ; | X XXXX | $185C
    .byte $3E ; |  XXXXX | $185D
    .byte $1A ; |   XX X | $185E
    .byte $03 ; |      XX| $185F
    .byte $0C ; |    XX  | $1860
    .byte $1E ; |   XXXX | $1861
    .byte $1B ; |   XX XX| $1862
    .byte $1F ; |   XXXXX| $1863
    .byte $0E ; |    XXX | $1864
    .byte $08 ; |    X   | $1865
    .byte $1E ; |   XXXX | $1866
    .byte $1B ; |   XX XX| $1867
    .byte $1B ; |   XX XX| $1868
    .byte $1B ; |   XX XX| $1869
    .byte $9F ; |X  XXXXX| $186A
    .byte $9F ; |X  XXXXX| $186B
    .byte $5E ; | X XXXX | $186C
    .byte $3E ; |  XXXXX | $186D
    .byte $12 ; |   X  X | $186E
    .byte $1B ; |   XX XX| $186F
    .byte $0C ; |    XX  | $1870
    .byte $1E ; |   XXXX | $1871
    .byte $1B ; |   XX XX| $1872
    .byte $1F ; |   XXXXX| $1873
    .byte $0E ; |    XXX | $1874
    .byte $08 ; |    X   | $1875
    .byte $1E ; |   XXXX | $1876
    .byte $1B ; |   XX XX| $1877
    .byte $17 ; |   X XXX| $1878
    .byte $0F ; |    XXXX| $1879
    .byte $1F ; |   XXXXX| $187A
    .byte $1F ; |   XXXXX| $187B
    .byte $DE ; |XX XXXX | $187C
    .byte $3E ; |  XXXXX | $187D
    .byte $13 ; |   X  XX| $187E
    .byte $18 ; |   XX   | $187F
    .byte $0F ; |    XXXX| $1880
    .byte $0F ; |    XXXX| $1881

    .byte $65 ; | XX  X X| $1882
    .byte $65 ; | XX  X X| $1883
    .byte $65 ; | XX  X X| $1884
    .byte $65 ; | XX  X X| $1885
    .byte $65 ; | XX  X X| $1886
    .byte $65 ; | XX  X X| $1887
    .byte $4A ; | X  X X | $1888
    .byte $4A ; | X  X X | $1889
    .byte $4A ; | X  X X | $188A
    .byte $4A ; | X  X X | $188B
    .byte $4A ; | X  X X | $188C
    .byte $4A ; | X  X X | $188D
    .byte $D9 ; |XX XX  X| $188E
    .byte $D9 ; |XX XX  X| $188F

    .byte $22 ; |  X   X | $1890
    .byte $14 ; |   X X  | $1891
    .byte $14 ; |   X X  | $1892
    .byte $14 ; |   X X  | $1893
    .byte $1C ; |   XXX  | $1894
    .byte $3A ; |  XXX X | $1895
    .byte $3E ; |  XXXXX | $1896
    .byte $1C ; |   XXX  | $1897
    .byte $10 ; |   X    | $1898
    .byte $3C ; |  XXXX  | $1899
    .byte $4E ; | X  XXX | $189A
    .byte $5E ; | X XXXX | $189B
    .byte $7E ; | XXXXXX | $189C
    .byte $7E ; | XXXXXX | $189D
    .byte $34 ; |  XX X  | $189E
    .byte $06 ; |     XX | $189F
    .byte $00 ; |        | $18A0
    .byte $00 ; |        | $18A1
    .byte $22 ; |  X   X | $18A2
    .byte $14 ; |   X X  | $18A3
    .byte $1C ; |   XXX  | $18A4
    .byte $3A ; |  XXX X | $18A5
    .byte $3E ; |  XXXXX | $18A6
    .byte $1C ; |   XXX  | $18A7
    .byte $10 ; |   X    | $18A8
    .byte $3C ; |  XXXX  | $18A9
    .byte $6E ; | XX XXX | $18AA
    .byte $6E ; | XX XXX | $18AB
    .byte $6E ; | XX XXX | $18AC
    .byte $7E ; | XXXXXX | $18AD
    .byte $24 ; |  X  X  | $18AE
    .byte $36 ; |  XX XX | $18AF
    .byte $00 ; |        | $18B0
    .byte $00 ; |        | $18B1
    .byte $00 ; |        | $18B2
    .byte $77 ; | XXX XXX| $18B3
    .byte $1C ; |   XXX  | $18B4
    .byte $3A ; |  XXX X | $18B5
    .byte $3E ; |  XXXXX | $18B6
    .byte $1C ; |   XXX  | $18B7
    .byte $10 ; |   X    | $18B8
    .byte $3C ; |  XXXX  | $18B9
    .byte $6E ; | XX XXX | $18BA
    .byte $76 ; | XXX XX | $18BB
    .byte $7A ; | XXXX X | $18BC
    .byte $7E ; | XXXXXX | $18BD
    .byte $26 ; |  X  XX | $18BE
    .byte $30 ; |  XX    | $18BF

    .byte $38 ; |  XXX   | $18C0
    .byte $38 ; |  XXX   | $18C1
    .byte $38 ; |  XXX   | $18C2
    .byte $38 ; |  XXX   | $18C3
    .byte $38 ; |  XXX   | $18C4
    .byte $38 ; |  XXX   | $18C5
    .byte $38 ; |  XXX   | $18C6
    .byte $38 ; |  XXX   | $18C7
    .byte $01 ; |       X| $18C8
    .byte $01 ; |       X| $18C9
    .byte $01 ; |       X| $18CA
    .byte $01 ; |       X| $18CB
    .byte $01 ; |       X| $18CC
    .byte $01 ; |       X| $18CD
    .byte $01 ; |       X| $18CE
    .byte $01 ; |       X| $18CF

    .byte $18 ; |   XX   | $18D0
    .byte $3C ; |  XXXX  | $18D1
    .byte $7E ; | XXXXXX | $18D2
    .byte $B7 ; |X XX XXX| $18D3
    .byte $B7 ; |X XX XXX| $18D4
    .byte $FF ; |XXXXXXXX| $18D5
    .byte $FF ; |XXXXXXXX| $18D6
    .byte $29 ; |  X X  X| $18D7
    .byte $2A ; |  X X X | $18D8
    .byte $49 ; | X  X  X| $18D9
    .byte $5A ; | X XX X | $18DA
    .byte $90 ; |X  X    | $18DB
    .byte $88 ; |X   X   | $18DC
    .byte $4C ; | X  XX  | $18DD
    .byte $84 ; |X    X  | $18DE
    .byte $43 ; | X    XX| $18DF
    .byte $18 ; |   XX   | $18E0
    .byte $3C ; |  XXXX  | $18E1
    .byte $7E ; | XXXXXX | $18E2
    .byte $DB ; |XX XX XX| $18E3
    .byte $DB ; |XX XX XX| $18E4
    .byte $FF ; |XXXXXXXX| $18E5
    .byte $FF ; |XXXXXXXX| $18E6
    .byte $A5 ; |X X  X X| $18E7
    .byte $A5 ; |X X  X X| $18E8
    .byte $AD ; |X X XX X| $18E9
    .byte $C9 ; |XX  X  X| $18EA
    .byte $4A ; | X  X X | $18EB
    .byte $52 ; | X X  X | $18EC
    .byte $91 ; |X  X   X| $18ED
    .byte $49 ; | X  X  X| $18EE
    .byte $82 ; |X     X | $18EF
    .byte $18 ; |   XX   | $18F0
    .byte $3C ; |  XXXX  | $18F1
    .byte $7E ; | XXXXXX | $18F2
    .byte $ED ; |XXX XX X| $18F3
    .byte $ED ; |XXX XX X| $18F4
    .byte $FF ; |XXXXXXXX| $18F5
    .byte $FF ; |XXXXXXXX| $18F6
    .byte $AA ; |X X X X | $18F7
    .byte $AA ; |X X X X | $18F8
    .byte $29 ; |  X X  X| $18F9
    .byte $5B ; | X XX XX| $18FA
    .byte $92 ; |X  X  X | $18FB
    .byte $46 ; | X   XX | $18FC
    .byte $22 ; |  X   X | $18FD
    .byte $41 ; | X     X| $18FE
    .byte $21 ; |  X    X| $18FF
L1900:
    .byte $18 ; |   XX   | $1900
    .byte $18 ; |   XX   | $1901
    .byte $2C ; |  X XX  | $1902
    .byte $20 ; |  X     | $1903
    .byte $3C ; |  XXXX  | $1904
    .byte $14 ; |   X X  | $1905
    .byte $64 ; | XX  X  | $1906
    .byte $08 ; |    X   | $1907
    .byte $18 ; |   XX   | $1908
    .byte $18 ; |   XX   | $1909
    .byte $34 ; |  XX X  | $190A
    .byte $34 ; |  XX X  | $190B
    .byte $3C ; |  XXXX  | $190C
    .byte $14 ; |   X X  | $190D
    .byte $22 ; |  X   X | $190E
    .byte $41 ; | X     X| $190F
    .byte $18 ; |   XX   | $1910
    .byte $18 ; |   XX   | $1911
    .byte $24 ; |  X  X  | $1912
    .byte $2C ; |  X XX  | $1913
    .byte $3C ; |  XXXX  | $1914
    .byte $16 ; |   X XX | $1915
    .byte $12 ; |   X  X | $1916
    .byte $10 ; |   X    | $1917
L1918:
    .byte $B8 ; |X XXX   | $1918
    .byte $C4 ; |XX   X  | $1919
    .byte $D0 ; |XX X    | $191A
    .byte $DC ; |XX XXX  | $191B
    .byte $E8 ; |XXX X   | $191C
    .byte $F4 ; |XXXX X  | $191D
    .byte $00 ; |        | $191E
    .byte $0C ; |    XX  | $191F
L1920:
    .byte $20 ; |  X     | $1920
    .byte $80 ; |X       | $1921
    .byte $40 ; | X      | $1922
    .byte $10 ; |   X    | $1923
    .byte $04 ; |     X  | $1924
    .byte $01 ; |       X| $1925
    .byte $02 ; |      X | $1926
    .byte $08 ; |    X   | $1927
    .byte $20 ; |  X     | $1928
    .byte $80 ; |X       | $1929
    .byte $20 ; |  X     | $192A
    .byte $80 ; |X       | $192B
    .byte $40 ; | X      | $192C
    .byte $10 ; |   X    | $192D
    .byte $04 ; |     X  | $192E
    .byte $01 ; |       X| $192F
    .byte $02 ; |      X | $1930
    .byte $08 ; |    X   | $1931
    .byte $20 ; |  X     | $1932
    .byte $80 ; |X       | $1933
L1934:
    .byte $10 ; |   X    | $1934
    .byte $40 ; | X      | $1935
    .byte $80 ; |X       | $1936
    .byte $20 ; |  X     | $1937
    .byte $08 ; |    X   | $1938
    .byte $02 ; |      X | $1939
    .byte $01 ; |       X| $193A
    .byte $04 ; |     X  | $193B
    .byte $10 ; |   X    | $193C
    .byte $40 ; | X      | $193D
    .byte $10 ; |   X    | $193E
    .byte $40 ; | X      | $193F
    .byte $80 ; |X       | $1940
    .byte $20 ; |  X     | $1941
    .byte $08 ; |    X   | $1942
    .byte $02 ; |      X | $1943
    .byte $01 ; |       X| $1944
    .byte $04 ; |     X  | $1945
    .byte $10 ; |   X    | $1946
    .byte $40 ; | X      | $1947
L1948:
    .byte $00 ; |        | $1948
    .byte $00 ; |        | $1949
    .byte $06 ; |     XX | $194A
    .byte $06 ; |     XX | $194B
    .byte $06 ; |     XX | $194C
    .byte $06 ; |     XX | $194D
    .byte $0C ; |    XX  | $194E
    .byte $0C ; |    XX  | $194F
    .byte $0C ; |    XX  | $1950
    .byte $0C ; |    XX  | $1951
    .byte $12 ; |   X  X | $1952
    .byte $12 ; |   X  X | $1953
    .byte $18 ; |   XX   | $1954
    .byte $18 ; |   XX   | $1955
    .byte $18 ; |   XX   | $1956
    .byte $18 ; |   XX   | $1957
    .byte $1E ; |   XXXX | $1958
    .byte $1E ; |   XXXX | $1959
    .byte $1E ; |   XXXX | $195A
    .byte $1E ; |   XXXX | $195B
    .byte $00 ; |        | $195C
    .byte $00 ; |        | $195D
    .byte $00 ; |        | $195E
    .byte $00 ; |        | $195F
    .byte $00 ; |        | $1960
    .byte $00 ; |        | $1961
    .byte $00 ; |        | $1962
    .byte $00 ; |        | $1963
    .byte $00 ; |        | $1964
    .byte $00 ; |        | $1965
    .byte $00 ; |        | $1966
    .byte $00 ; |        | $1967
    .byte $00 ; |        | $1968
    .byte $00 ; |        | $1969
    .byte $00 ; |        | $196A
    .byte $00 ; |        | $196B
L196C:
    .byte $08 ; |    X   | $196C
    .byte $00 ; |        | $196D
    .byte $08 ; |    X   | $196E
    .byte $00 ; |        | $196F
    .byte $02 ; |      X | $1970
    .byte $00 ; |        | $1971
    .byte $02 ; |      X | $1972
    .byte $02 ; |      X | $1973
    .byte $0E ; |    XXX | $1974
    .byte $06 ; |     XX | $1975
L1976:
    .byte $18 ; |   XX   | $1976
    .byte $00 ; |        | $1977
    .byte $14 ; |   X X  | $1978
    .byte $00 ; |        | $1979
    .byte $05 ; |     X X| $197A
    .byte $00 ; |        | $197B
    .byte $21 ; |  X    X| $197C
    .byte $21 ; |  X    X| $197D
    .byte $01 ; |       X| $197E
    .byte $03 ; |      XX| $197F
L1980:
    .byte $07 ; |     XXX| $1980
    .byte $07 ; |     XXX| $1981
    .byte $09 ; |    X  X| $1982
    .byte $09 ; |    X  X| $1983
    .byte $05 ; |     X X| $1984
    .byte $05 ; |     X X| $1985
    .byte $05 ; |     X X| $1986
    .byte $05 ; |     X X| $1987
    .byte $19 ; |   XX  X| $1988
    .byte $0D ; |    XX X| $1989
L198A:
    .byte $00 ; |        | $198A
    .byte $2F ; |  X XXXX| $198B
    .byte $2F ; |  X XXXX| $198C
    .byte $32 ; |  XX  X | $198D
    .byte $32 ; |  XX  X | $198E
    .byte $37 ; |  XX XXX| $198F
    .byte $37 ; |  XX XXX| $1990
    .byte $37 ; |  XX XXX| $1991
    .byte $37 ; |  XX XXX| $1992
    .byte $00 ; |        | $1993
    .byte $37 ; |  XX XXX| $1994
    .byte $37 ; |  XX XXX| $1995
    .byte $37 ; |  XX XXX| $1996
    .byte $37 ; |  XX XXX| $1997
    .byte $00 ; |        | $1998
    .byte $37 ; |  XX XXX| $1999
    .byte $37 ; |  XX XXX| $199A
    .byte $35 ; |  XX X X| $199B
    .byte $35 ; |  XX X X| $199C
    .byte $32 ; |  XX  X | $199D
    .byte $32 ; |  XX  X | $199E
    .byte $31 ; |  XX   X| $199F
    .byte $31 ; |  XX   X| $19A0
    .byte $2F ; |  X XXXX| $19A1
    .byte $2F ; |  X XXXX| $19A2
    .byte $2F ; |  X XXXX| $19A3
    .byte $2F ; |  X XXXX| $19A4
    .byte $00 ; |        | $19A5
    .byte $2F ; |  X XXXX| $19A6
    .byte $2F ; |  X XXXX| $19A7
    .byte $2F ; |  X XXXX| $19A8
    .byte $2F ; |  X XXXX| $19A9
    .byte $00 ; |        | $19AA
    .byte $2F ; |  X XXXX| $19AB
    .byte $2F ; |  X XXXX| $19AC
    .byte $2F ; |  X XXXX| $19AD
    .byte $2F ; |  X XXXX| $19AE
    .byte $32 ; |  XX  X | $19AF
    .byte $32 ; |  XX  X | $19B0
    .byte $32 ; |  XX  X | $19B1
    .byte $32 ; |  XX  X | $19B2
    .byte $F4 ; |XXXX X  | $19B3
    .byte $3E ; |  XXXXX | $19B4
    .byte $3E ; |  XXXXX | $19B5
    .byte $3E ; |  XXXXX | $19B6
    .byte $3E ; |  XXXXX | $19B7
    .byte $3E ; |  XXXXX | $19B8
    .byte $3E ; |  XXXXX | $19B9
    .byte $3E ; |  XXXXX | $19BA
    .byte $3E ; |  XXXXX | $19BB
    .byte $3E ; |  XXXXX | $19BC
    .byte $00 ; |        | $19BD
    .byte $3E ; |  XXXXX | $19BE
    .byte $3E ; |  XXXXX | $19BF
    .byte $3E ; |  XXXXX | $19C0
    .byte $3E ; |  XXXXX | $19C1
    .byte $3E ; |  XXXXX | $19C2
    .byte $3E ; |  XXXXX | $19C3
    .byte $00 ; |        | $19C4
    .byte $3E ; |  XXXXX | $19C5
    .byte $3E ; |  XXXXX | $19C6
    .byte $3E ; |  XXXXX | $19C7
    .byte $00 ; |        | $19C8
    .byte $3E ; |  XXXXX | $19C9
    .byte $3E ; |  XXXXX | $19CA
    .byte $3E ; |  XXXXX | $19CB
    .byte $3E ; |  XXXXX | $19CC
    .byte $3E ; |  XXXXX | $19CD
    .byte $3E ; |  XXXXX | $19CE
    .byte $3E ; |  XXXXX | $19CF
    .byte $3E ; |  XXXXX | $19D0
    .byte $3E ; |  XXXXX | $19D1
    .byte $00 ; |        | $19D2
    .byte $39 ; |  XXX  X| $19D3
    .byte $39 ; |  XXX  X| $19D4
    .byte $39 ; |  XXX  X| $19D5
    .byte $39 ; |  XXX  X| $19D6
    .byte $39 ; |  XXX  X| $19D7
    .byte $39 ; |  XXX  X| $19D8
    .byte $00 ; |        | $19D9
    .byte $3B ; |  XXX XX| $19DA
    .byte $3B ; |  XXX XX| $19DB
    .byte $3B ; |  XXX XX| $19DC
    .byte $00 ; |        | $19DD
    .byte $3B ; |  XXX XX| $19DE
    .byte $3B ; |  XXX XX| $19DF
    .byte $3B ; |  XXX XX| $19E0
    .byte $3B ; |  XXX XX| $19E1
    .byte $3B ; |  XXX XX| $19E2
    .byte $3B ; |  XXX XX| $19E3
    .byte $00 ; |        | $19E4
    .byte $3E ; |  XXXXX | $19E5
    .byte $3E ; |  XXXXX | $19E6
    .byte $3E ; |  XXXXX | $19E7
    .byte $00 ; |        | $19E8
    .byte $3E ; |  XXXXX | $19E9
    .byte $3E ; |  XXXXX | $19EA
    .byte $3E ; |  XXXXX | $19EB
    .byte $3E ; |  XXXXX | $19EC
    .byte $3E ; |  XXXXX | $19ED
    .byte $3E ; |  XXXXX | $19EE
    .byte $00 ; |        | $19EF
    .byte $3F ; |  XXXXXX| $19F0
    .byte $3F ; |  XXXXXX| $19F1
    .byte $3F ; |  XXXXXX| $19F2
    .byte $00 ; |        | $19F3
    .byte $3E ; |  XXXXX | $19F4
    .byte $3E ; |  XXXXX | $19F5
    .byte $3E ; |  XXXXX | $19F6
    .byte $3E ; |  XXXXX | $19F7
    .byte $3E ; |  XXXXX | $19F8
    .byte $3E ; |  XXXXX | $19F9
    .byte $3E ; |  XXXXX | $19FA
    .byte $3E ; |  XXXXX | $19FB
    .byte $3E ; |  XXXXX | $19FC
    .byte $3E ; |  XXXXX | $19FD
    .byte $3E ; |  XXXXX | $19FE
    .byte $3E ; |  XXXXX | $19FF
    .byte $3E ; |  XXXXX | $1A00
    .byte $3E ; |  XXXXX | $1A01
    .byte $3E ; |  XXXXX | $1A02
    .byte $3E ; |  XXXXX | $1A03
    .byte $3E ; |  XXXXX | $1A04
    .byte $3E ; |  XXXXX | $1A05
    .byte $F2 ; |XXXX  X | $1A06
    .byte $08 ; |    X   | $1A07
    .byte $0A ; |    X X | $1A08
    .byte $0C ; |    XX  | $1A09
    .byte $09 ; |    X  X| $1A0A
    .byte $0B ; |    X XX| $1A0B
    .byte $0D ; |    XX X| $1A0C
    .byte $0A ; |    X X | $1A0D
    .byte $0C ; |    XX  | $1A0E
    .byte $0E ; |    XXX | $1A0F
    .byte $F1 ; |XXXX   X| $1A10

    .byte $FF ; |XXXXXXXX| $1A11  free bytes
    .byte $FF ; |XXXXXXXX| $1A12
    .byte $FF ; |XXXXXXXX| $1A13
    .byte $FF ; |XXXXXXXX| $1A14
    .byte $FF ; |XXXXXXXX| $1A15
    .byte $FF ; |XXXXXXXX| $1A16
    .byte $FF ; |XXXXXXXX| $1A17
    .byte $FF ; |XXXXXXXX| $1A18
    .byte $FF ; |XXXXXXXX| $1A19
    .byte $FF ; |XXXXXXXX| $1A1A
    .byte $FF ; |XXXXXXXX| $1A1B
    .byte $FF ; |XXXXXXXX| $1A1C
    .byte $FF ; |XXXXXXXX| $1A1D
    .byte $FF ; |XXXXXXXX| $1A1E
    .byte $FF ; |XXXXXXXX| $1A1F
    .byte $FF ; |XXXXXXXX| $1A20
    .byte $FF ; |XXXXXXXX| $1A21
    .byte $FF ; |XXXXXXXX| $1A22
    .byte $FF ; |XXXXXXXX| $1A23
    .byte $FF ; |XXXXXXXX| $1A24
    .byte $FF ; |XXXXXXXX| $1A25
    .byte $FF ; |XXXXXXXX| $1A26
    .byte $FF ; |XXXXXXXX| $1A27
    .byte $FF ; |XXXXXXXX| $1A28
    .byte $FF ; |XXXXXXXX| $1A29
    .byte $FF ; |XXXXXXXX| $1A2A
    .byte $FF ; |XXXXXXXX| $1A2B
    .byte $FF ; |XXXXXXXX| $1A2C
    .byte $FF ; |XXXXXXXX| $1A2D
    .byte $FF ; |XXXXXXXX| $1A2E
    .byte $FF ; |XXXXXXXX| $1A2F
    .byte $FF ; |XXXXXXXX| $1A30
    .byte $FF ; |XXXXXXXX| $1A31
    .byte $FF ; |XXXXXXXX| $1A32
    .byte $FF ; |XXXXXXXX| $1A33
    .byte $FF ; |XXXXXXXX| $1A34
    .byte $FF ; |XXXXXXXX| $1A35
    .byte $FF ; |XXXXXXXX| $1A36
    .byte $FF ; |XXXXXXXX| $1A37
    .byte $FF ; |XXXXXXXX| $1A38
    .byte $FF ; |XXXXXXXX| $1A39
    .byte $FF ; |XXXXXXXX| $1A3A
    .byte $FF ; |XXXXXXXX| $1A3B
    .byte $FF ; |XXXXXXXX| $1A3C
    .byte $FF ; |XXXXXXXX| $1A3D
    .byte $FF ; |XXXXXXXX| $1A3E
    .byte $FF ; |XXXXXXXX| $1A3F
    .byte $FF ; |XXXXXXXX| $1A40
    .byte $FF ; |XXXXXXXX| $1A41
    .byte $FF ; |XXXXXXXX| $1A42
    .byte $FF ; |XXXXXXXX| $1A43
    .byte $FF ; |XXXXXXXX| $1A44
    .byte $FF ; |XXXXXXXX| $1A45
    .byte $FF ; |XXXXXXXX| $1A46
    .byte $FF ; |XXXXXXXX| $1A47
    .byte $FF ; |XXXXXXXX| $1A48
    .byte $FF ; |XXXXXXXX| $1A49
    .byte $FF ; |XXXXXXXX| $1A4A
    .byte $FF ; |XXXXXXXX| $1A4B
    .byte $FF ; |XXXXXXXX| $1A4C
    .byte $FF ; |XXXXXXXX| $1A4D
    .byte $FF ; |XXXXXXXX| $1A4E
    .byte $FF ; |XXXXXXXX| $1A4F
    .byte $FF ; |XXXXXXXX| $1A50
    .byte $FF ; |XXXXXXXX| $1A51
    .byte $FF ; |XXXXXXXX| $1A52
    .byte $FF ; |XXXXXXXX| $1A53
    .byte $FF ; |XXXXXXXX| $1A54
    .byte $FF ; |XXXXXXXX| $1A55
    .byte $FF ; |XXXXXXXX| $1A56
    .byte $FF ; |XXXXXXXX| $1A57
    .byte $FF ; |XXXXXXXX| $1A58
    .byte $FF ; |XXXXXXXX| $1A59
    .byte $FF ; |XXXXXXXX| $1A5A
    .byte $FF ; |XXXXXXXX| $1A5B
    .byte $FF ; |XXXXXXXX| $1A5C
    .byte $FF ; |XXXXXXXX| $1A5D
    .byte $FF ; |XXXXXXXX| $1A5E
    .byte $FF ; |XXXXXXXX| $1A5F
    .byte $FF ; |XXXXXXXX| $1A60
    .byte $FF ; |XXXXXXXX| $1A61
    .byte $FF ; |XXXXXXXX| $1A62
    .byte $FF ; |XXXXXXXX| $1A63
    .byte $FF ; |XXXXXXXX| $1A64
    .byte $FF ; |XXXXXXXX| $1A65
    .byte $FF ; |XXXXXXXX| $1A66
    .byte $FF ; |XXXXXXXX| $1A67
    .byte $FF ; |XXXXXXXX| $1A68
    .byte $FF ; |XXXXXXXX| $1A69
    .byte $FF ; |XXXXXXXX| $1A6A
    .byte $FF ; |XXXXXXXX| $1A6B
    .byte $FF ; |XXXXXXXX| $1A6C
    .byte $FF ; |XXXXXXXX| $1A6D
    .byte $FF ; |XXXXXXXX| $1A6E
    .byte $FF ; |XXXXXXXX| $1A6F
    .byte $FF ; |XXXXXXXX| $1A70
    .byte $FF ; |XXXXXXXX| $1A71
    .byte $FF ; |XXXXXXXX| $1A72
    .byte $FF ; |XXXXXXXX| $1A73
    .byte $FF ; |XXXXXXXX| $1A74
    .byte $FF ; |XXXXXXXX| $1A75
    .byte $FF ; |XXXXXXXX| $1A76
    .byte $FF ; |XXXXXXXX| $1A77
    .byte $FF ; |XXXXXXXX| $1A78
    .byte $FF ; |XXXXXXXX| $1A79
    .byte $FF ; |XXXXXXXX| $1A7A
    .byte $FF ; |XXXXXXXX| $1A7B
    .byte $FF ; |XXXXXXXX| $1A7C
    .byte $FF ; |XXXXXXXX| $1A7D
    .byte $FF ; |XXXXXXXX| $1A7E
    .byte $FF ; |XXXXXXXX| $1A7F
    .byte $FF ; |XXXXXXXX| $1A80
    .byte $FF ; |XXXXXXXX| $1A81
    .byte $FF ; |XXXXXXXX| $1A82
    .byte $FF ; |XXXXXXXX| $1A83
    .byte $FF ; |XXXXXXXX| $1A84
    .byte $FF ; |XXXXXXXX| $1A85
    .byte $FF ; |XXXXXXXX| $1A86
    .byte $FF ; |XXXXXXXX| $1A87
    .byte $FF ; |XXXXXXXX| $1A88
    .byte $FF ; |XXXXXXXX| $1A89
    .byte $FF ; |XXXXXXXX| $1A8A
    .byte $FF ; |XXXXXXXX| $1A8B
    .byte $FF ; |XXXXXXXX| $1A8C
    .byte $FF ; |XXXXXXXX| $1A8D
    .byte $FF ; |XXXXXXXX| $1A8E
    .byte $FF ; |XXXXXXXX| $1A8F
    .byte $FF ; |XXXXXXXX| $1A90
    .byte $FF ; |XXXXXXXX| $1A91
    .byte $FF ; |XXXXXXXX| $1A92
    .byte $FF ; |XXXXXXXX| $1A93
    .byte $FF ; |XXXXXXXX| $1A94
    .byte $FF ; |XXXXXXXX| $1A95
    .byte $FF ; |XXXXXXXX| $1A96
    .byte $FF ; |XXXXXXXX| $1A97
    .byte $FF ; |XXXXXXXX| $1A98
    .byte $FF ; |XXXXXXXX| $1A99
    .byte $FF ; |XXXXXXXX| $1A9A
    .byte $FF ; |XXXXXXXX| $1A9B
    .byte $FF ; |XXXXXXXX| $1A9C
    .byte $FF ; |XXXXXXXX| $1A9D
    .byte $FF ; |XXXXXXXX| $1A9E
    .byte $FF ; |XXXXXXXX| $1A9F
    .byte $FF ; |XXXXXXXX| $1AA0
    .byte $FF ; |XXXXXXXX| $1AA1
    .byte $FF ; |XXXXXXXX| $1AA2
    .byte $FF ; |XXXXXXXX| $1AA3
    .byte $FF ; |XXXXXXXX| $1AA4
    .byte $FF ; |XXXXXXXX| $1AA5
    .byte $FF ; |XXXXXXXX| $1AA6
    .byte $FF ; |XXXXXXXX| $1AA7
    .byte $FF ; |XXXXXXXX| $1AA8
    .byte $FF ; |XXXXXXXX| $1AA9
    .byte $FF ; |XXXXXXXX| $1AAA
    .byte $FF ; |XXXXXXXX| $1AAB
    .byte $FF ; |XXXXXXXX| $1AAC
    .byte $FF ; |XXXXXXXX| $1AAD
    .byte $FF ; |XXXXXXXX| $1AAE
    .byte $FF ; |XXXXXXXX| $1AAF
    .byte $FF ; |XXXXXXXX| $1AB0
    .byte $FF ; |XXXXXXXX| $1AB1
    .byte $FF ; |XXXXXXXX| $1AB2
    .byte $FF ; |XXXXXXXX| $1AB3
    .byte $FF ; |XXXXXXXX| $1AB4
    .byte $FF ; |XXXXXXXX| $1AB5
    .byte $FF ; |XXXXXXXX| $1AB6
    .byte $FF ; |XXXXXXXX| $1AB7
    .byte $FF ; |XXXXXXXX| $1AB8
    .byte $FF ; |XXXXXXXX| $1AB9
    .byte $FF ; |XXXXXXXX| $1ABA
    .byte $FF ; |XXXXXXXX| $1ABB
    .byte $FF ; |XXXXXXXX| $1ABC
    .byte $FF ; |XXXXXXXX| $1ABD
    .byte $FF ; |XXXXXXXX| $1ABE
    .byte $FF ; |XXXXXXXX| $1ABF
    .byte $FF ; |XXXXXXXX| $1AC0
    .byte $FF ; |XXXXXXXX| $1AC1
    .byte $FF ; |XXXXXXXX| $1AC2
    .byte $FF ; |XXXXXXXX| $1AC3
    .byte $FF ; |XXXXXXXX| $1AC4
    .byte $FF ; |XXXXXXXX| $1AC5
    .byte $FF ; |XXXXXXXX| $1AC6
    .byte $FF ; |XXXXXXXX| $1AC7
    .byte $FF ; |XXXXXXXX| $1AC8
    .byte $FF ; |XXXXXXXX| $1AC9
    .byte $FF ; |XXXXXXXX| $1ACA
    .byte $FF ; |XXXXXXXX| $1ACB
    .byte $FF ; |XXXXXXXX| $1ACC
    .byte $FF ; |XXXXXXXX| $1ACD
    .byte $FF ; |XXXXXXXX| $1ACE
    .byte $FF ; |XXXXXXXX| $1ACF
    .byte $FF ; |XXXXXXXX| $1AD0
    .byte $FF ; |XXXXXXXX| $1AD1
    .byte $FF ; |XXXXXXXX| $1AD2
    .byte $FF ; |XXXXXXXX| $1AD3
    .byte $FF ; |XXXXXXXX| $1AD4
    .byte $FF ; |XXXXXXXX| $1AD5
    .byte $FF ; |XXXXXXXX| $1AD6
    .byte $FF ; |XXXXXXXX| $1AD7
    .byte $FF ; |XXXXXXXX| $1AD8
    .byte $FF ; |XXXXXXXX| $1AD9
    .byte $FF ; |XXXXXXXX| $1ADA
    .byte $FF ; |XXXXXXXX| $1ADB
    .byte $FF ; |XXXXXXXX| $1ADC
    .byte $FF ; |XXXXXXXX| $1ADD
    .byte $FF ; |XXXXXXXX| $1ADE
    .byte $FF ; |XXXXXXXX| $1ADF
    .byte $FF ; |XXXXXXXX| $1AE0
    .byte $FF ; |XXXXXXXX| $1AE1
    .byte $FF ; |XXXXXXXX| $1AE2
    .byte $FF ; |XXXXXXXX| $1AE3
    .byte $FF ; |XXXXXXXX| $1AE4
    .byte $FF ; |XXXXXXXX| $1AE5
    .byte $FF ; |XXXXXXXX| $1AE6
    .byte $FF ; |XXXXXXXX| $1AE7
    .byte $FF ; |XXXXXXXX| $1AE8
    .byte $FF ; |XXXXXXXX| $1AE9
    .byte $FF ; |XXXXXXXX| $1AEA
    .byte $FF ; |XXXXXXXX| $1AEB
    .byte $FF ; |XXXXXXXX| $1AEC
    .byte $FF ; |XXXXXXXX| $1AED
    .byte $FF ; |XXXXXXXX| $1AEE
    .byte $FF ; |XXXXXXXX| $1AEF
    .byte $FF ; |XXXXXXXX| $1AF0
    .byte $FF ; |XXXXXXXX| $1AF1
    .byte $FF ; |XXXXXXXX| $1AF2
    .byte $FF ; |XXXXXXXX| $1AF3
    .byte $FF ; |XXXXXXXX| $1AF4
    .byte $FF ; |XXXXXXXX| $1AF5
    .byte $FF ; |XXXXXXXX| $1AF6
    .byte $FF ; |XXXXXXXX| $1AF7
    .byte $FF ; |XXXXXXXX| $1AF8
    .byte $FF ; |XXXXXXXX| $1AF9
    .byte $FF ; |XXXXXXXX| $1AFA
    .byte $FF ; |XXXXXXXX| $1AFB
    .byte $FF ; |XXXXXXXX| $1AFC
    .byte $FF ; |XXXXXXXX| $1AFD
    .byte $FF ; |XXXXXXXX| $1AFE
    .byte $FF ; |XXXXXXXX| $1AFF

       ORG $1B00

    .byte $0E ; |    XXX | $1B00
    .byte $0A ; |    X X | $1B01
    .byte $0A ; |    X X | $1B02
    .byte $0A ; |    X X | $1B03
    .byte $0E ; |    XXX | $1B04
    .byte $0E ; |    XXX | $1B05
    .byte $04 ; |     X  | $1B06
    .byte $04 ; |     X  | $1B07
    .byte $04 ; |     X  | $1B08
    .byte $0C ; |    XX  | $1B09
    .byte $0E ; |    XXX | $1B0A
    .byte $08 ; |    X   | $1B0B
    .byte $0E ; |    XXX | $1B0C
    .byte $02 ; |      X | $1B0D
    .byte $0E ; |    XXX | $1B0E
    .byte $0E ; |    XXX | $1B0F
    .byte $02 ; |      X | $1B10
    .byte $06 ; |     XX | $1B11
    .byte $02 ; |      X | $1B12
    .byte $0E ; |    XXX | $1B13
    .byte $02 ; |      X | $1B14
    .byte $02 ; |      X | $1B15
    .byte $0E ; |    XXX | $1B16
    .byte $0A ; |    X X | $1B17
    .byte $0A ; |    X X | $1B18
    .byte $0E ; |    XXX | $1B19
    .byte $02 ; |      X | $1B1A
    .byte $0E ; |    XXX | $1B1B
    .byte $08 ; |    X   | $1B1C
    .byte $0E ; |    XXX | $1B1D
    .byte $0E ; |    XXX | $1B1E
    .byte $0A ; |    X X | $1B1F
    .byte $0E ; |    XXX | $1B20
    .byte $08 ; |    X   | $1B21
    .byte $0E ; |    XXX | $1B22
    .byte $02 ; |      X | $1B23
    .byte $02 ; |      X | $1B24
    .byte $02 ; |      X | $1B25
    .byte $02 ; |      X | $1B26
    .byte $0E ; |    XXX | $1B27
    .byte $0E ; |    XXX | $1B28
    .byte $0A ; |    X X | $1B29
    .byte $0E ; |    XXX | $1B2A
    .byte $0A ; |    X X | $1B2B
    .byte $0E ; |    XXX | $1B2C
    .byte $0E ; |    XXX | $1B2D
    .byte $02 ; |      X | $1B2E
    .byte $0E ; |    XXX | $1B2F
    .byte $0A ; |    X X | $1B30
    .byte $0E ; |    XXX | $1B31
    .byte $00 ; |        | $1B32
    .byte $00 ; |        | $1B33
    .byte $00 ; |        | $1B34
    .byte $00 ; |        | $1B35
    .byte $00 ; |        | $1B36
    .byte $E0 ; |XXX     | $1B37
    .byte $A0 ; |X X     | $1B38
    .byte $A0 ; |X X     | $1B39
    .byte $A0 ; |X X     | $1B3A
    .byte $E0 ; |XXX     | $1B3B
    .byte $E0 ; |XXX     | $1B3C
    .byte $40 ; | X      | $1B3D
    .byte $40 ; | X      | $1B3E
    .byte $40 ; | X      | $1B3F
    .byte $C0 ; |XX      | $1B40
    .byte $E0 ; |XXX     | $1B41
    .byte $80 ; |X       | $1B42
    .byte $E0 ; |XXX     | $1B43
    .byte $20 ; |  X     | $1B44
    .byte $E0 ; |XXX     | $1B45
    .byte $E0 ; |XXX     | $1B46
    .byte $20 ; |  X     | $1B47
    .byte $60 ; | XX     | $1B48
    .byte $20 ; |  X     | $1B49
    .byte $E0 ; |XXX     | $1B4A
    .byte $20 ; |  X     | $1B4B
    .byte $20 ; |  X     | $1B4C
    .byte $E0 ; |XXX     | $1B4D
    .byte $A0 ; |X X     | $1B4E
    .byte $A0 ; |X X     | $1B4F
    .byte $E0 ; |XXX     | $1B50
    .byte $20 ; |  X     | $1B51
    .byte $E0 ; |XXX     | $1B52
    .byte $80 ; |X       | $1B53
    .byte $E0 ; |XXX     | $1B54
    .byte $E0 ; |XXX     | $1B55
    .byte $A0 ; |X X     | $1B56
    .byte $E0 ; |XXX     | $1B57
    .byte $80 ; |X       | $1B58
    .byte $E0 ; |XXX     | $1B59
    .byte $20 ; |  X     | $1B5A
    .byte $20 ; |  X     | $1B5B
    .byte $20 ; |  X     | $1B5C
    .byte $20 ; |  X     | $1B5D
    .byte $E0 ; |XXX     | $1B5E
    .byte $E0 ; |XXX     | $1B5F
    .byte $A0 ; |X X     | $1B60
    .byte $E0 ; |XXX     | $1B61
    .byte $A0 ; |X X     | $1B62
    .byte $E0 ; |XXX     | $1B63
    .byte $E0 ; |XXX     | $1B64
    .byte $20 ; |  X     | $1B65
    .byte $E0 ; |XXX     | $1B66
    .byte $A0 ; |X X     | $1B67
    .byte $E0 ; |XXX     | $1B68
    .byte $00 ; |        | $1B69
    .byte $00 ; |        | $1B6A
    .byte $00 ; |        | $1B6B
    .byte $00 ; |        | $1B6C
    .byte $00 ; |        | $1B6D
    .byte $07 ; |     XXX| $1B6E
    .byte $05 ; |     X X| $1B6F
    .byte $05 ; |     X X| $1B70
    .byte $05 ; |     X X| $1B71
    .byte $07 ; |     XXX| $1B72
    .byte $07 ; |     XXX| $1B73
    .byte $02 ; |      X | $1B74
    .byte $02 ; |      X | $1B75
    .byte $02 ; |      X | $1B76
    .byte $03 ; |      XX| $1B77
    .byte $07 ; |     XXX| $1B78
    .byte $01 ; |       X| $1B79
    .byte $07 ; |     XXX| $1B7A
    .byte $04 ; |     X  | $1B7B
    .byte $07 ; |     XXX| $1B7C
    .byte $07 ; |     XXX| $1B7D
    .byte $04 ; |     X  | $1B7E
    .byte $06 ; |     XX | $1B7F
    .byte $04 ; |     X  | $1B80
    .byte $07 ; |     XXX| $1B81
    .byte $04 ; |     X  | $1B82
    .byte $04 ; |     X  | $1B83
    .byte $07 ; |     XXX| $1B84
    .byte $05 ; |     X X| $1B85
    .byte $05 ; |     X X| $1B86
    .byte $07 ; |     XXX| $1B87
    .byte $04 ; |     X  | $1B88
    .byte $07 ; |     XXX| $1B89
    .byte $01 ; |       X| $1B8A
    .byte $07 ; |     XXX| $1B8B
    .byte $07 ; |     XXX| $1B8C
    .byte $05 ; |     X X| $1B8D
    .byte $07 ; |     XXX| $1B8E
    .byte $01 ; |       X| $1B8F
    .byte $07 ; |     XXX| $1B90
    .byte $04 ; |     X  | $1B91
    .byte $04 ; |     X  | $1B92
    .byte $04 ; |     X  | $1B93
    .byte $04 ; |     X  | $1B94
    .byte $07 ; |     XXX| $1B95
    .byte $07 ; |     XXX| $1B96
    .byte $05 ; |     X X| $1B97
    .byte $07 ; |     XXX| $1B98
    .byte $05 ; |     X X| $1B99
    .byte $07 ; |     XXX| $1B9A
    .byte $07 ; |     XXX| $1B9B
    .byte $04 ; |     X  | $1B9C
    .byte $07 ; |     XXX| $1B9D
    .byte $05 ; |     X X| $1B9E
    .byte $07 ; |     XXX| $1B9F
    .byte $00 ; |        | $1BA0
    .byte $00 ; |        | $1BA1
    .byte $00 ; |        | $1BA2
    .byte $00 ; |        | $1BA3
    .byte $00 ; |        | $1BA4
    .byte $70 ; | XXX    | $1BA5
    .byte $50 ; | X X    | $1BA6
    .byte $50 ; | X X    | $1BA7
    .byte $50 ; | X X    | $1BA8
    .byte $70 ; | XXX    | $1BA9
    .byte $70 ; | XXX    | $1BAA
    .byte $20 ; |  X     | $1BAB
    .byte $20 ; |  X     | $1BAC
    .byte $20 ; |  X     | $1BAD
    .byte $30 ; |  XX    | $1BAE
    .byte $70 ; | XXX    | $1BAF
    .byte $10 ; |   X    | $1BB0
    .byte $70 ; | XXX    | $1BB1
    .byte $40 ; | X      | $1BB2
    .byte $70 ; | XXX    | $1BB3
    .byte $70 ; | XXX    | $1BB4
    .byte $40 ; | X      | $1BB5
    .byte $60 ; | XX     | $1BB6
    .byte $40 ; | X      | $1BB7
    .byte $70 ; | XXX    | $1BB8
    .byte $40 ; | X      | $1BB9
    .byte $40 ; | X      | $1BBA
    .byte $70 ; | XXX    | $1BBB
    .byte $50 ; | X X    | $1BBC
    .byte $50 ; | X X    | $1BBD
    .byte $70 ; | XXX    | $1BBE
    .byte $40 ; | X      | $1BBF
    .byte $70 ; | XXX    | $1BC0
    .byte $10 ; |   X    | $1BC1
    .byte $70 ; | XXX    | $1BC2
    .byte $70 ; | XXX    | $1BC3
    .byte $50 ; | X X    | $1BC4
    .byte $70 ; | XXX    | $1BC5
    .byte $10 ; |   X    | $1BC6
    .byte $70 ; | XXX    | $1BC7
    .byte $40 ; | X      | $1BC8
    .byte $40 ; | X      | $1BC9
    .byte $40 ; | X      | $1BCA
    .byte $40 ; | X      | $1BCB
    .byte $70 ; | XXX    | $1BCC
    .byte $70 ; | XXX    | $1BCD
    .byte $50 ; | X X    | $1BCE
    .byte $70 ; | XXX    | $1BCF
    .byte $50 ; | X X    | $1BD0
    .byte $70 ; | XXX    | $1BD1
    .byte $70 ; | XXX    | $1BD2
    .byte $40 ; | X      | $1BD3
    .byte $70 ; | XXX    | $1BD4
    .byte $50 ; | X X    | $1BD5
    .byte $70 ; | XXX    | $1BD6
    .byte $00 ; |        | $1BD7
    .byte $00 ; |        | $1BD8
    .byte $00 ; |        | $1BD9
    .byte $00 ; |        | $1BDA
    .byte $00 ; |        | $1BDB

    .byte $FF ; |XXXXXXXX| $1BDC  free bytes
    .byte $FF ; |XXXXXXXX| $1BDD
    .byte $FF ; |XXXXXXXX| $1BDE
    .byte $FF ; |XXXXXXXX| $1BDF
    .byte $FF ; |XXXXXXXX| $1BE0
    .byte $FF ; |XXXXXXXX| $1BE1
    .byte $FF ; |XXXXXXXX| $1BE2
    .byte $FF ; |XXXXXXXX| $1BE3
    .byte $FF ; |XXXXXXXX| $1BE4
    .byte $FF ; |XXXXXXXX| $1BE5
    .byte $FF ; |XXXXXXXX| $1BE6
    .byte $FF ; |XXXXXXXX| $1BE7
    .byte $FF ; |XXXXXXXX| $1BE8
    .byte $FF ; |XXXXXXXX| $1BE9
    .byte $FF ; |XXXXXXXX| $1BEA
    .byte $FF ; |XXXXXXXX| $1BEB
    .byte $FF ; |XXXXXXXX| $1BEC
    .byte $FF ; |XXXXXXXX| $1BED
    .byte $FF ; |XXXXXXXX| $1BEE
    .byte $FF ; |XXXXXXXX| $1BEF
    .byte $FF ; |XXXXXXXX| $1BF0
    .byte $FF ; |XXXXXXXX| $1BF1
    .byte $FF ; |XXXXXXXX| $1BF2
    .byte $FF ; |XXXXXXXX| $1BF3
    .byte $FF ; |XXXXXXXX| $1BF4
    .byte $FF ; |XXXXXXXX| $1BF5
    .byte $FF ; |XXXXXXXX| $1BF6
    .byte $FF ; |XXXXXXXX| $1BF7
    .byte $FF ; |XXXXXXXX| $1BF8
    .byte $FF ; |XXXXXXXX| $1BF9
    .byte $FF ; |XXXXXXXX| $1BFA
    .byte $FF ; |XXXXXXXX| $1BFB
    .byte $FF ; |XXXXXXXX| $1BFC
    .byte $FF ; |XXXXXXXX| $1BFD
    .byte $FF ; |XXXXXXXX| $1BFE
    .byte $FF ; |XXXXXXXX| $1BFF

       ORG $1C00

L1C00:
    .byte $FF ; |XXXXXXXX| $1C00
L1C01:
    .byte $FF ; |XXXXXXXX| $1C01
L1C02:
    .byte $FF ; |XXXXXXXX| $1C02
    .byte $10 ; |   X    | $1C03
    .byte $20 ; |  X     | $1C04
    .byte $30 ; |  XX    | $1C05
    .byte $40 ; | X      | $1C06
    .byte $50 ; | X X    | $1C07
    .byte $60 ; | XX     | $1C08
    .byte $70 ; | XXX    | $1C09
    .byte $80 ; |X       | $1C0A
    .byte $90 ; |X  X    | $1C0B
    .byte $18 ; |   XX   | $1C0C
L1C0D:
    .byte $FF ; |XXXXXXXX| $1C0D
    .byte $00 ; |        | $1C0E
    .byte $FF ; |XXXXXXXX| $1C0F
    .byte $38 ; |  XXX   | $1C10
    .byte $FF ; |XXXXXXXX| $1C11
    .byte $50 ; | X X    | $1C12
    .byte $FF ; |XXXXXXXX| $1C13
    .byte $28 ; |  X X   | $1C14
    .byte $FF ; |XXXXXXXX| $1C15
    .byte $90 ; |X  X    | $1C16
    .byte $FF ; |XXXXXXXX| $1C17
L1C18:
    .byte $FF ; |XXXXXXXX| $1C18
    .byte $98 ; |X  XX   | $1C19
    .byte $FF ; |XXXXXXXX| $1C1A
    .byte $30 ; |  XX    | $1C1B
    .byte $FF ; |XXXXXXXX| $1C1C
    .byte $48 ; | X  X   | $1C1D
    .byte $FF ; |XXXXXXXX| $1C1E
    .byte $20 ; |  X     | $1C1F
    .byte $FF ; |XXXXXXXX| $1C20
    .byte $88 ; |X   X   | $1C21
    .byte $FF ; |XXXXXXXX| $1C22

  IF SHOW_BYTES_REMAINING
    ECHO ([$1FFC-*]d), "bytes free...", *, "to $1ffc"
  ENDIF

       ORG $1FFC

    .word START
    .byte $FF ; |XXXXXXXX| $1FFE
    .byte $FF ; |XXXXXXXX| $1FFF

SHOW_BYTES_REMAINING = 1