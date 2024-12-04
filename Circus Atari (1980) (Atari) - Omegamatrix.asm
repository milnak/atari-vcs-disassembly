; Disassembly of circus.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: limit8 -cCircus.cfg circus.bin
;
; Circus.cfg contents:
;
;      ORG F000
;      CODE F000 F808
;      GFX F809 F9FF
;      DATA FA00 FCFF
;      GFX FD00 FD64
;      CODE FD65 FDC3
;      DATA FDC4 FE95
;      CODE FE96 FF64
;      DATA FF65 FFFB
;      GFX FFFC FFFF

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
RESM0   =  $12
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
HMP0    =  $20
HMM0    =  $22
HMM1    =  $23
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXM0P   =  $30
CXM1P   =  $31
CXP0FB  =  $32
CXPPMM  =  $37
INPT0   =  $38
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      RIOT RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x3
ram_81             ds 1  ; x5
ram_82             ds 1  ; x3
ram_83             ds 1  ; x4
ram_84             ds 36 ; x2
ram_A8             ds 1  ; x7
ram_A9             ds 1  ; x12
ram_AA             ds 1  ; x8
ram_AB             ds 1  ; x6
ram_AC             ds 1  ; x6
ram_AD             ds 1  ; x12
ram_AE             ds 1  ; x4
ram_AF             ds 1  ; x4
ram_B0             ds 1  ; x2
ram_B1             ds 1  ; x4
ram_B2             ds 1  ; x3
ram_B3             ds 1  ; x10
ram_B4             ds 1  ; x1
ram_B5             ds 1  ; x2
ram_B6             ds 1  ; x2
ram_B7             ds 1  ; x5
ram_B8             ds 1  ; x1
ram_B9             ds 1  ; x4
ram_BA             ds 1  ; x4
ram_BB             ds 1  ; x1
ram_BC             ds 1  ; x2
ram_BD             ds 1  ; x1
ram_BE             ds 1  ; x2
ram_BF             ds 1  ; x1
ram_C0             ds 2  ; x1
ram_C2             ds 2  ; x1
ram_C4             ds 2  ; x1
ram_C6             ds 2  ; x1
ram_C8             ds 2  ; x1
ram_CA             ds 1  ; x23
ram_CB             ds 1  ; x2
ram_CC             ds 1  ; x3
ram_CD             ds 1  ; x17
ram_CE             ds 1  ; x22
ram_CF             ds 1  ; x8
ram_D0             ds 1  ; x10
ram_D1             ds 1  ; x10
ram_D2             ds 1  ; x4
ram_D3             ds 1  ; x12
ram_D4             ds 1  ; x5
ram_D5             ds 1  ; x8
ram_D6             ds 1  ; x10
ram_D7             ds 1  ; x2
ram_D8             ds 1  ; x2
ram_D9             ds 1  ; x4
ram_DA             ds 1  ; x3
ram_DB             ds 1  ; x1
ram_DC             ds 1  ; x2
ram_DD             ds 1  ; x9
ram_DE             ds 1  ; x7
ram_DF             ds 1  ; x6
ram_E0             ds 1  ; x1
ram_E1             ds 1  ; x7
ram_E2             ds 1  ; x6
ram_E3             ds 1  ; x3
ram_E4             ds 1  ; x4
ram_E5             ds 1  ; x11
ram_E6             ds 1  ; x3
ram_E7             ds 1  ; x2
ram_E8             ds 1  ; x4
ram_E9             ds 1  ; x3
ram_EA             ds 22 ; x4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE
       ORG $F000,0

START:
    sei                          ; 2
    cld                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    inx                          ; 2
    txa                          ; 2
LF007:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    LF007                 ; 2³
    jsr    LF7D6                 ; 6
    inc    ram_A8                ; 5
    lda    LF809                 ; 4
    sta    ram_E5                ; 3
    lda    #$20                  ; 2
    sta    NUSIZ0                ; 3
    jsr    LF04B                 ; 6
    jsr    LF05B                 ; 6
    dec    ram_A9                ; 5
    bmi    LF07C                 ; 2³
LF024:
    lda    0,X                   ; 4
    ora    3,X                   ; 4
    and    #$F0                  ; 2
    ora    4,X                   ; 4
    ora    1,X                   ; 4
    ora    2,X                   ; 4
    ora    5,X                   ; 4
    beq    LF037                 ; 2³
    lda    #$00                  ; 2
    rts                          ; 6

LF037:
    lda    #$AA                  ; 2
    sta    1,X                   ; 4
    sta    4,X                   ; 4
    lda    #$55                  ; 2
    sta    2,X                   ; 4
    sta    5,X                   ; 4
    and    #$F0                  ; 2
    sta    0,X                   ; 4
    sta    3,X                   ; 4
    tya                          ; 2
    rts                          ; 6

LF04B:
    clc                          ; 2
    lda    #$84                  ; 2
    tax                          ; 2
LF04F:
    jsr    LF037                 ; 6
    txa                          ; 2
    adc    #$06                  ; 2
    tax                          ; 2
    cmp    #$A8                  ; 2
    bne    LF04F                 ; 2³
    rts                          ; 6

LF05B:
    lda    #$B0                  ; 2
    sta    ram_CE                ; 3
    sta    ram_D0                ; 3
    asl                          ; 2
    sta    ram_E4                ; 3
    ldx    #$02                  ; 2
    lda    ram_81                ; 3
    lsr                          ; 2
    bcs    LF06D                 ; 2³
    ldx    #$9B                  ; 2
LF06D:
    stx    ram_CD                ; 3
    lda    #$0C                  ; 2
    sta    ram_DE                ; 3
    ldx    #$00                  ; 2
    stx    ram_D1                ; 3
    stx    ram_D6                ; 3
    stx    ram_E1                ; 3
    rts                          ; 6

LF07C:
    lda    #$35                  ; 2
    sta    TIM64T                ; 4
    clc                          ; 2
    lda    ram_D3                ; 3
    adc    ram_CD                ; 3
    sta    ram_CD                ; 3
    cmp    #$99                  ; 2
    bcs    LF096                 ; 2³
    cmp    #$02                  ; 2
    bcs    LF0A3                 ; 2³
    lda    #$05                  ; 2
    sta    ram_CD                ; 3
    bne    LF09A                 ; 3   always branch

LF096:
    lda    #$98                  ; 2
    sta    ram_CD                ; 3
LF09A:
    lda    ram_D3                ; 3
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
    sta    ram_D3                ; 3
LF0A3:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    ram_E6                ; 3
    lda    ram_E5                ; 3
    and    #$40                  ; 2
    beq    LF0BD                 ; 2³
    lda    ram_E5                ; 3
    and    #$38                  ; 2
    ldx    #$02                  ; 2
    stx    ram_E6                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ora    #$30                  ; 2
    sec                          ; 2
LF0BD:
    sta    NUSIZ1                ; 3
    lda    CXM1P                 ; 3
    bmi    LF0C9                 ; 2³
    lda    #$00                  ; 2
    sta    ram_EA                ; 3
    beq    LF0D5                 ; 3   always branch

LF0C9:
    ldx    ram_EA                ; 3
    bne    LF0D5                 ; 2³
    sta    ram_EA                ; 3
    lda    ram_D0                ; 3
    eor    #$80                  ; 2
    sta    ram_D0                ; 3
LF0D5:
    lda    #$F0                  ; 2
    sta    HMM1                  ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    VSYNC                 ; 3
    lda    ram_CD                ; 3
    jsr    LF7BA                 ; 6
    lda    ram_CF                ; 3
    sta    ram_D4                ; 3
    lda    #$00                  ; 2
    sta    VSYNC                 ; 3
    sta    ram_CF                ; 3
    lda    ram_A9                ; 3
    beq    LF0F7                 ; 2³
    jmp    LF35B                 ; 3

LF0F7:
    lda    CXM0P                 ; 3
    and    #$40                  ; 2
    beq    LF100                 ; 2³+1
    jmp    LF236                 ; 3

LF100:
    lda    CXP0FB                ; 3
    bmi    LF107                 ; 2³
LF104:
    jmp    LF1A4                 ; 3

LF107:
    lda    ram_CE                ; 3
    cmp    #$32                  ; 2
    bcc    LF12F                 ; 2³
    lda    #$21                  ; 2
    cmp    ram_D1                ; 3
    bcc    LF104                 ; 2³
    lda    #$80                  ; 2
    sta    ram_D0                ; 3
    lda    #$00                  ; 2
    sta    ram_E1                ; 3
    lda    #$01                  ; 2
    sta    ram_DE                ; 3
    sta    ram_B7                ; 3
    lda    #$A0                  ; 2
    sta    ram_CE                ; 3
    lda    ram_D3                ; 3
    bne    LF1A4                 ; 2³
    lda    #$01                  ; 2
    sta    ram_D3                ; 3
    bne    LF1A4                 ; 3   always branch

LF12F:
    lda    #$00                  ; 2
    sta    ram_E3                ; 3
    sta    ram_EA                ; 3
    sta    ram_E2                ; 3
    ldx    ram_CD                ; 3
    lda    ram_CE                ; 3
    jsr    LF1B0                 ; 6
    lda    ram_CE                ; 3
    clc                          ; 2
    sbc    #$05                  ; 2
    ldx    ram_CD                ; 3
    jsr    LF1B0                 ; 6
    lda    ram_CE                ; 3
    clc                          ; 2
    sbc    #$0A                  ; 2
    ldx    ram_CD                ; 3
    jsr    LF1B0                 ; 6
    lda    ram_CD                ; 3
    sec                          ; 2
    sbc    #$03                  ; 2
    tax                          ; 2
    lda    ram_CE                ; 3
    jsr    LF1B0                 ; 6
    bne    LF161                 ; 2³
    inc    ram_E2                ; 5
LF161:
    lda    ram_CD                ; 3
    clc                          ; 2
    adc    #$03                  ; 2
    tax                          ; 2
    lda    ram_CE                ; 3
    jsr    LF1B0                 ; 6
    bne    LF170                 ; 2³
    dec    ram_E2                ; 5
LF170:
    lda    ram_CD                ; 3
    sec                          ; 2
    sbc    #$03                  ; 2
    tax                          ; 2
    lda    ram_CE                ; 3
    clc                          ; 2
    adc    #$0A                  ; 2
    jsr    LF1B0                 ; 6
    bne    LF182                 ; 2³
    inc    ram_E2                ; 5
LF182:
    lda    ram_CD                ; 3
    clc                          ; 2
    adc    #$03                  ; 2
    tax                          ; 2
    lda    ram_CE                ; 3
    clc                          ; 2
    adc    #$0A                  ; 2
    jsr    LF1B0                 ; 6
    bne    LF194                 ; 2³
    dec    ram_E2                ; 5
LF194:
    lda    ram_E3                ; 3
    beq    LF1A4                 ; 2³
    lda    ram_E2                ; 3
    bmi    LF1A0                 ; 2³
    and    #$01                  ; 2
    bpl    LF1A2                 ; 3   always branch

LF1A0:
    lda    #$FF                  ; 2
LF1A2:
    sta    ram_D3                ; 3
LF1A4:
    lda    ram_B1                ; 3
    jsr    LF775                 ; 6
    lda    #$00                  ; 2
    sta    ram_B1                ; 3
    jmp    LF236                 ; 3

LF1B0:
    tay                          ; 2
    txa                          ; 2
    pha                          ; 3
    tya                          ; 2
    cmp    #$05                  ; 2
    bcc    LF1DA                 ; 2³
    cmp    #$0B                  ; 2
    bcs    LF1C2                 ; 2³
LF1BC:
    cmp    #$17                  ; 2
    bcs    LF1CE                 ; 2³
LF1C0:
    pla                          ; 4
    rts                          ; 6

LF1C2:
    cmp    #$11                  ; 2
    bcs    LF1BC                 ; 2³
    ldx    #$8A                  ; 2
    lda    #$05                  ; 2
    sta    ram_D2                ; 3
    bne    LF1E0                 ; 3   always branch

LF1CE:
    cmp    #$1D                  ; 2
    bcs    LF1C0                 ; 2³
    lda    #$02                  ; 2
    sta    ram_D2                ; 3
    ldx    #$90                  ; 2
    bne    LF1E0                 ; 3   always branch

LF1DA:
    lda    #$0A                  ; 2
    sta    ram_D2                ; 3
    ldx    #$84                  ; 2
LF1E0:
    pla                          ; 4
    cmp    #$50                  ; 2
    bcs    LF22D                 ; 2³+1
LF1E5:
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LF8A4,Y               ; 4
    pha                          ; 3
    and    #$F0                  ; 2
    sec                          ; 2
LF1EF:
    sbc    #$10                  ; 2
    bmi    LF1F6                 ; 2³
    inx                          ; 2
    bne    LF1EF                 ; 2³
LF1F6:
    pla                          ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    clc                          ; 2
    lda    #$01                  ; 2
LF1FD:
    dey                          ; 2
    bmi    LF203                 ; 2³
    asl                          ; 2
    bne    LF1FD                 ; 2³+1
LF203:
    pha                          ; 3
    and    0,X                   ; 4
    bne    LF20A                 ; 2³
    pla                          ; 4
    rts                          ; 6

LF20A:
    pla                          ; 4
    eor    #$FF                  ; 2
    and    0,X                   ; 4
    sta    0,X                   ; 4
    lda    ram_E5                ; 3
    and    #$04                  ; 2
    bne    LF21D                 ; 2³
    lda    ram_D0                ; 3
    eor    #$80                  ; 2
    sta    ram_D0                ; 3
LF21D:
    lda    ram_D2                ; 3
    clc                          ; 2
    adc    ram_B1                ; 3
    sta    ram_B1                ; 3
    ldy    #$01                  ; 2
    sty    ram_E3                ; 3
    sty    ram_B5                ; 3
    lda    #$00                  ; 2
    rts                          ; 6

LF22D:
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    sec                          ; 2
    sbc    #$50                  ; 2
    jmp    LF1E5                 ; 3

LF236:
    lda    CXM0P                 ; 3
    and    #$40                  ; 2
    bne    LF266                 ; 2³
    lda    ram_CE                ; 3
    bne    LF26C                 ; 2³
    lda    #$00                  ; 2
LF242:
    sta    ram_D0                ; 3
    bne    LF26C                 ; 2³
LF246:
    jmp    LF30D                 ; 3

LF249:
    lda    #$80                  ; 2
    sta    ram_D0                ; 3
    lda    #$00                  ; 2
    sta    ram_E1                ; 3
    lda    #$01                  ; 2
    sta    ram_DE                ; 3
    sta    ram_B7                ; 3
    lda    #$A0                  ; 2
    sta    ram_CE                ; 3
    lda    ram_D3                ; 3
    bne    LF263                 ; 2³
    lda    #$01                  ; 2
    sta    ram_D3                ; 3
LF263:
    jmp    LF344                 ; 3

LF266:
    lda    ram_CE                ; 3
    cmp    #$A1                  ; 2
    bne    LF263                 ; 2³
LF26C:
    cmp    #$A1                  ; 2
    bne    LF246                 ; 2³
    lda    #$21                  ; 2
    cmp    ram_D1                ; 3
    bcc    LF280                 ; 2³
    ldx    CXP0FB                ; 3
    bmi    LF249                 ; 2³
    lda    ram_CD                ; 3
    cmp    #$09                  ; 2
    bcc    LF249                 ; 2³
LF280:
    lda    ram_E4                ; 3
    cmp    #$60                  ; 2
    bne    LF288                 ; 2³
    inc    ram_B9                ; 5
LF288:
    lda    #$00                  ; 2
    sta    ram_D3                ; 3
    lda    ram_D1                ; 3
    sec                          ; 2
    sbc    #$2C                  ; 2
    bmi    LF2A4                 ; 2³
    lda    ram_81                ; 3
    and    #$07                  ; 2
    cmp    #$07                  ; 2
    bne    LF2A8                 ; 2³
    lda    ram_D1                ; 3
    sec                          ; 2
    sbc    #$0B                  ; 2
    cmp    #$21                  ; 2
    bne    LF2A6                 ; 2³
LF2A4:
    lda    #$4D                  ; 2
LF2A6:
    sta    ram_D1                ; 3
LF2A8:
    lda    ram_E4                ; 3
    beq    LF2B1                 ; 2³
    dec    ram_E4                ; 5
    jmp    LF30A                 ; 3

LF2B1:
    lda    ram_B3                ; 3
    ora    ram_B8                ; 3
    ora    ram_B9                ; 3
    ora    ram_B2                ; 3
    ora    ram_B5                ; 3
    ora    ram_B4                ; 3
    ora    ram_B6                ; 3
    ora    ram_B7                ; 3
    ora    ram_DC                ; 3
    ora    ram_DB                ; 3
    bne    LF30A                 ; 2³+1
    lda    ram_AD                ; 3
    and    #$0F                  ; 2
    cmp    #$0A                  ; 2
    beq    LF2D9                 ; 2³
    lda    ram_AD                ; 3
    and    #$F0                  ; 2
    ora    #$0A                  ; 2
    sta    ram_AD                ; 3
    bne    LF307                 ; 2³+1
LF2D9:
    lda    ram_E5                ; 3
    and    #$01                  ; 2
    beq    LF2F8                 ; 2³
    jsr    LF783                 ; 6
    inc    ram_DD                ; 5
    lda    ram_AC                ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    ram_AC                ; 3
    cmp    #$3A                  ; 2
    bne    LF307                 ; 2³+1
    lda    #$00                  ; 2
    sta    ram_DD                ; 3
    clc                          ; 2
    adc    #$1A                  ; 2
    sta    ram_AC                ; 3
LF2F8:
    lda    ram_AD                ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    cmp    #$6A                  ; 2
    bne    LF305                 ; 2³
    lda    #$01                  ; 2
    sta    ram_A9                ; 3
LF305:
    sta    ram_AD                ; 3
LF307:
    jsr    LF05B                 ; 6
LF30A:
    jmp    LF357                 ; 3

LF30D:
    ldx    ram_DD                ; 3
    cmp    #$B0                  ; 2
    bne    LF320                 ; 2³
    lda    ram_DF,X              ; 4
    cmp    #$FE                  ; 2
    beq    LF31C                 ; 2³
    jmp    LF35B                 ; 3

LF31C:
    asl    ram_DF,X              ; 6
    stx    CXCLR                 ; 3
LF320:
    lda    ram_D0                ; 3
    bmi    LF33F                 ; 2³
    dec    ram_DE                ; 5
LF326:
    ldx    ram_E1                ; 3
    cpx    ram_E9                ; 3
    bcc    LF32E                 ; 2³
    ldx    ram_E9                ; 3
LF32E:
    lda    LF900,X               ; 4
    clc                          ; 2
    adc    ram_DE                ; 3
    tay                          ; 2
    lda    LF905,Y               ; 4
    sta    ram_CE                ; 3
    bne    LF344                 ; 2³
    jmp    LF242                 ; 3

LF33F:
    inc    ram_DE                ; 5
    jmp    LF326                 ; 3

LF344:
    lda    ram_81                ; 3
    and    #$07                  ; 2
    cmp    #$07                  ; 2
    bne    LF357                 ; 2³
    lda    ram_D1                ; 3
    sec                          ; 2
    sbc    #$0B                  ; 2
    bpl    LF355                 ; 2³
    lda    #$21                  ; 2
LF355:
    sta    ram_D1                ; 3
LF357:
    lda    ram_D1                ; 3
    sta    ram_D6                ; 3
LF35B:
    sty    WSYNC                 ; 3
;---------------------------------------
    sty    HMOVE                 ; 3
    sty    CXCLR                 ; 3
    ldx    #$00                  ; 2
    lda    SWCHB                 ; 4
    and    #$08                  ; 2
    bne    LF36C                 ; 2³
    ldx    #$06                  ; 2
LF36C:
    lda    ram_DD                ; 3
    bne    LF383                 ; 2³
    lda    LF8B8,X               ; 4
    jsr    LF7E3                 ; 6
    sta    COLUP0                ; 3
    ldy    ram_A9                ; 3
    bmi    LF37E                 ; 2³
    bne    LF383                 ; 2³
LF37E:
    sta    COLUP1                ; 3
    jmp    LF391                 ; 3

LF383:
    lda    LF8B9,X               ; 4
    jsr    LF7E3                 ; 6
    sta    COLUP1                ; 3
    ldy    ram_A9                ; 3
    bne    LF391                 ; 2³
    sta    COLUP0                ; 3
LF391:
    lda    LF8BA,X               ; 4
    jsr    LF7E3                 ; 6
    sta    COLUBK                ; 3
    lda    LF8BB,X               ; 4
    jsr    LF7E3                 ; 6
    sta    COLUPF                ; 3
    lda    LF8BC,X               ; 4
    jsr    LF7E3                 ; 6
    sta    ram_D8                ; 3
    lda    LF8BD,X               ; 4
    jsr    LF7E3                 ; 6
    sta    ram_D7                ; 3
    lda    SWCHA                 ; 4
    ldx    #$00                  ; 2
LF3B6:
    asl    ram_DF,X              ; 6
    eor    #$00                  ; 2
    bpl    LF3BE                 ; 2³
    inc    ram_DF,X              ; 6
LF3BE:
    asl                          ; 2
    inx                          ; 2
    cpx    #$02                  ; 2
    bne    LF3B6                 ; 2³
    asl    ram_80                ; 5
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    beq    LF3D1                 ; 2³
    inc    ram_80                ; 5
    bne    LF416                 ; 2³+1
LF3D1:
    lda    #$80                  ; 2
    sta    ram_A9                ; 3
    lda    #$00                  ; 2
    sta    ram_DD                ; 3
    lda    ram_80                ; 3
    and    #$0F                  ; 2
    cmp    #$0E                  ; 2
    beq    LF3E5                 ; 2³
    dec    ram_B0                ; 5
    bne    LF416                 ; 2³+1
LF3E5:
    lda    #$1E                  ; 2
    sta    ram_B0                ; 3
    lda    ram_E5                ; 3
    pha                          ; 3
    inc    ram_E8                ; 5
    ldy    ram_E8                ; 3
    lda    LF809,Y               ; 4
    sta    ram_E5                ; 3
    pla                          ; 4
    and    #$01                  ; 2
    beq    LF403                 ; 2³+1
    sed                          ; 2
    clc                          ; 2
    lda    ram_A8                ; 3
    adc    #$01                  ; 2
    sta    ram_A8                ; 3
    cld                          ; 2
LF403:
    lda    ram_E8                ; 3
    cmp    #$0E                  ; 2
    bne    LF416                 ; 2³
    lda    #$01                  ; 2
    sta    ram_A8                ; 3
    lda    #$00                  ; 2
    sta    ram_E8                ; 3
    lda    LF809                 ; 4
    sta    ram_E5                ; 3
LF416:
    lda    #$40                  ; 2
    ldx    ram_DD                ; 3
    beq    LF41D                 ; 2³
    asl                          ; 2
LF41D:
    and    SWCHB                 ; 4
    sta    ram_E7                ; 3
    lda    ram_81                ; 3
    and    #$03                  ; 2
    bne    LF437                 ; 2³
    ldx    #$84                  ; 2
    jsr    LF66F                 ; 6
    ldx    #$90                  ; 2
    jsr    LF66F                 ; 6
    ldx    #$8A                  ; 2
    jsr    LF694                 ; 6
LF437:
    asl    ram_CC                ; 5
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    beq    LF442                 ; 2³
    inc    ram_CC                ; 5
LF442:
    lda    ram_CC                ; 3
    cmp    #$FE                  ; 2
    bne    LF46C                 ; 2³
    lda    #$00                  ; 2
    sta    ram_A9                ; 3
    sta    ram_AA                ; 3
    sta    ram_AB                ; 3
    sta    ram_AE                ; 3
    sta    ram_DD                ; 3
    sta    ram_AF                ; 3
    sta    ram_83                ; 3
    sta    ram_82                ; 3
    sta    ram_B2                ; 3
    sta    ram_B3                ; 3
    sta    ram_D3                ; 3
    lda    #$1A                  ; 2
    sta    ram_AC                ; 3
    sta    ram_AD                ; 3
    jsr    LF04B                 ; 6
    jsr    LF05B                 ; 6
LF46C:
    lda    ram_B6                ; 3
    beq    LF474                 ; 2³
    lda    #$00                  ; 2
    sta    ram_B7                ; 3
LF474:
    jsr    LF6DD                 ; 6
    ldx    #$06                  ; 2
    stx    ram_D9                ; 3
    stx    ram_DA                ; 3
    lda    #$00                  ; 2
    pha                          ; 3
    pha                          ; 3
    ldx    #$02                  ; 2
    stx    CTRLPF                ; 3
    ldx    #$11                  ; 2
LF487:
    cpx    #$0B                  ; 2
    bne    LF48E                 ; 2³
    lda    ram_D7                ; 3
    pha                          ; 3
LF48E:
    lda    ram_84,X              ; 4
    pha                          ; 3
    dex                          ; 2
    cpx    #$05                  ; 2
    bne    LF487                 ; 2³
    lda    ram_D8                ; 3
    pha                          ; 3
    sta    HMCLR                 ; 3
    lda    #$20                  ; 2
    ldy    ram_D5                ; 3
    bpl    LF4A3                 ; 2³
    lda    #$E0                  ; 2
LF4A3:
    sta    HMM0                  ; 3
    ldy    #$04                  ; 2
LF4A7:
    lda    INTIM                 ; 4
    bne    LF4A7                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    jmp    LFD65                 ; 3

LF4B3:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$24                  ; 2
    sta    TIM64T                ; 4
    lda    #$00                  ; 2
    sta    PF0                   ; 3
    sta    ENAM0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    inc    ram_81                ; 5
    lda    ram_A9                ; 3
    bne    LF4D0                 ; 2³
    lda    ram_DF                ; 3
    and    ram_E0                ; 3
    and    #$01                  ; 2
    beq    LF4E2                 ; 2³
LF4D0:
    inc    ram_82                ; 5
    bne    LF4E6                 ; 2³
    inc    ram_83                ; 5
    bne    LF4E6                 ; 2³
    lda    ram_A9                ; 3
    bne    LF4E6                 ; 2³
    lda    #$01                  ; 2
    sta    ram_A9                ; 3
    bne    LF4E6                 ; 3   always branch

LF4E2:
    sta    ram_82                ; 3
    sta    ram_83                ; 3
LF4E6:
    lda    ram_CF                ; 3
    beq    LF4F4                 ; 2³
    cmp    #$26                  ; 2
    bcs    LF4F0                 ; 2³
    lda    #$26                  ; 2
LF4F0:
    cmp    #$96                  ; 2
    bcc    LF4F6                 ; 2³
LF4F4:
    lda    #$95                  ; 2
LF4F6:
    sta    ram_CF                ; 3
    clc                          ; 2
    adc    ram_D4                ; 3
    ror                          ; 2
    sta    ram_D4                ; 3
    sta    ram_CF                ; 3
    lda    CXM0P                 ; 3
    and    #$40                  ; 2
    beq    LF568                 ; 2³
    lda    CXPPMM                ; 3
    bmi    LF568                 ; 2³
    lda    #$21                  ; 2
    cmp    ram_D1                ; 3
    bcc    LF57F                 ; 2³
    clc                          ; 2
    lda    ram_D4                ; 3
    eor    #$FF                  ; 2
    adc    #$B9                  ; 2
    adc    ram_D5                ; 3
    ldx    ram_D5                ; 3
    bmi    LF528                 ; 2³
    sec                          ; 2
    sbc    ram_CD                ; 3
    sbc    #$07                  ; 2
    beq    LF53F                 ; 2³
    bmi    LF535                 ; 2³
    bpl    LF539                 ; 3   always branch

LF528:
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
    adc    #$FA                  ; 2
    adc    ram_CD                ; 3
    beq    LF53F                 ; 2³
    bpl    LF539                 ; 2³
LF535:
    inc    ram_E1                ; 5
    bne    LF53F                 ; 2³
LF539:
    lda    ram_E1                ; 3
    beq    LF53F                 ; 2³
    dec    ram_E1                ; 5
LF53F:
    lda    #$01                  ; 2
    sta    ram_DE                ; 3
    sta    ram_B7                ; 3
    jsr    LF7D6                 ; 6
    jsr    LF7AB                 ; 6
    clc                          ; 2
    lda    ram_D3                ; 3
    eor    #$FF                  ; 2
    adc    #$01                  ; 2
    sta    ram_D3                ; 3
    lda    #$95                  ; 2
    sta    ram_CE                ; 3
    ldx    #$02                  ; 2
    lda    ram_E7                ; 3
    beq    LF560                 ; 2³
    ldx    #$04                  ; 2
LF560:
    stx    ram_E9                ; 3
    lda    #$80                  ; 2
    sta    ram_D0                ; 3
    bne    LF57F                 ; 3   always branch

LF568:
    lda    ram_CE                ; 3
    cmp    #$B0                  ; 2
    beq    LF57F                 ; 2³
    ldx    ram_DD                ; 3
    lda    ram_DF,X              ; 4
    cmp    #$FE                  ; 2
    bne    LF57F                 ; 2³
    lda    ram_CE                ; 3
    cmp    #$A1                  ; 2
    beq    LF57F                 ; 2³
    jsr    LF7D6                 ; 6
LF57F:
    lda    ram_CF                ; 3
    ldx    #$02                  ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$B7                  ; 2
    adc    ram_D5                ; 3
    sta    ram_CA                ; 3
    jsr    LF7BC                 ; 6
    ldx    #$01                  ; 2
    clc                          ; 2
    lda    #$18                  ; 2
    ldy    ram_D5                ; 3
    bmi    LF59C                 ; 2³
    eor    #$FF                  ; 2
    adc    #$FC                  ; 2
LF59C:
    adc    ram_CA                ; 3
    jsr    LF7BC                 ; 6
    ldy    #$03                  ; 2
    ldx    #$0F                  ; 2
    lda    ram_A9                ; 3
    bpl    LF5D0                 ; 2³
    lda    #$AA                  ; 2
    sta    ram_AA                ; 3
    sta    ram_AD                ; 3
    lda    ram_A8                ; 3
    and    #$F0                  ; 2
    bne    LF5BD                 ; 2³
    lda    ram_A8                ; 3
    and    #$0F                  ; 2
    ora    #$A0                  ; 2
    bne    LF5BF                 ; 3   always branch

LF5BD:
    lda    ram_A8                ; 3
LF5BF:
    sta    ram_AB                ; 3
    lda    ram_E5                ; 3
    and    #$01                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    #$0A                  ; 2
    sta    ram_AC                ; 3
LF5D0:
    lda.wy ram_AA,Y              ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    jsr    LF6C7                 ; 6
    dex                          ; 2
    dex                          ; 2
    lda.wy ram_AA,Y              ; 4
    jsr    LF6C7                 ; 6
    dex                          ; 2
    dex                          ; 2
    dey                          ; 2
    bpl    LF5D0                 ; 2³
    lda    ram_CE                ; 3
    cmp    #$32                  ; 2
    bcc    LF603                 ; 2³+1
    lda    ram_E5                ; 3
    and    #$02                  ; 2
    beq    LF62B                 ; 2³+1
    ldx    #$84                  ; 2
LF5F5:
    lda    0,X                   ; 4
    ora    3,X                   ; 4
    and    #$F0                  ; 2
    ora    4,X                   ; 4
    ora    2,X                   ; 4
    ora    1,X                   ; 4
    ora    5,X                   ; 4
LF603:
    bne    LF65F                 ; 2³
    cpx    #$90                  ; 2
    beq    LF610                 ; 2³
    txa                          ; 2
    clc                          ; 2
    adc    #$06                  ; 2
    tax                          ; 2
    bne    LF5F5                 ; 2³+1
LF610:
    jsr    LF037                 ; 6
    ldx    #$84                  ; 2
    jsr    LF037                 ; 6
    ldx    #$8A                  ; 2
    jsr    LF037                 ; 6
    lda    #$11                  ; 2
    sta    ram_B3                ; 3
    lda    ram_AD                ; 3
    and    #$F0                  ; 2
    ora    #$0B                  ; 2
    sta    ram_AD                ; 3
    bne    LF65F                 ; 2³
LF62B:
    ldy    #$0A                  ; 2
    ldx    #$84                  ; 2
    jsr    LF024                 ; 6
    beq    LF642                 ; 2³
    pha                          ; 3
    lda    ram_AD                ; 3
    and    #$F0                  ; 2
    ora    #$0B                  ; 2
    sta    ram_AD                ; 3
    lda    #$0A                  ; 2
    sta    ram_DC                ; 3
    pla                          ; 4
LF642:
    clc                          ; 2
    adc    ram_B3                ; 3
    sta    ram_B3                ; 3
    ldx    #$8A                  ; 2
    ldy    #$05                  ; 2
    jsr    LF024                 ; 6
    clc                          ; 2
    adc    ram_B3                ; 3
    sta    ram_B3                ; 3
    ldx    #$90                  ; 2
    ldy    #$02                  ; 2
    jsr    LF024                 ; 6
    clc                          ; 2
    adc    ram_B3                ; 3
    sta    ram_B3                ; 3
LF65F:
    lda    INTIM                 ; 4
    bne    LF65F                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$82                  ; 2
    sta    VBLANK                ; 3
    sta    VSYNC                 ; 3
    jmp    LF07C                 ; 3

LF66F:
    ror    5,X                   ; 6
    rol    4,X                   ; 6
    ror    3,X                   ; 6
    lda    3,X                   ; 4
    and    #$08                  ; 2
    bne    LF68E                 ; 2³
    clc                          ; 2
LF67C:
    ror    2,X                   ; 6
    rol    1,X                   ; 6
    ror    0,X                   ; 6
    asl    5,X                   ; 6
    lda    0,X                   ; 4
    and    #$08                  ; 2
    bne    LF691                 ; 2³
    clc                          ; 2
LF68B:
    ror    5,X                   ; 6
    rts                          ; 6

LF68E:
    sec                          ; 2
    bcs    LF67C                 ; 3   always branch

LF691:
    sec                          ; 2
    bcs    LF68B                 ; 3   always branch

LF694:
    rol    0,X                   ; 6
    ror    1,X                   ; 6
    rol    2,X                   ; 6
    rol    3,X                   ; 6
    ror    4,X                   ; 6
    rol    5,X                   ; 6
    bcs    LF6BF                 ; 2³
LF6A2:
    lda    3,X                   ; 4
    and    #$01                  ; 2
    beq    LF6B0                 ; 2³
    lda    3,X                   ; 4
    ora    #$10                  ; 2
    and    #$F0                  ; 2
    sta    3,X                   ; 4
LF6B0:
    lda    0,X                   ; 4
    and    #$01                  ; 2
    beq    LF6BE                 ; 2³
    lda    0,X                   ; 4
    ora    #$10                  ; 2
    and    #$F0                  ; 2
    sta    0,X                   ; 4
LF6BE:
    rts                          ; 6

LF6BF:
    lda    0,X                   ; 4
    ora    #$01                  ; 2
    sta    0,X                   ; 4
    bcs    LF6A2                 ; 2³
LF6C7:
    and    #$0F                  ; 2
    sta    ram_CA                ; 3
    asl    ram_CA                ; 5
    asl    ram_CA                ; 5
    clc                          ; 2
    adc    ram_CA                ; 3
    adc    #$C4                  ; 2
    sta    ram_B9,X              ; 4
    lda    #$F8                  ; 2
    adc    #$00                  ; 2
    sta    ram_BA,X              ; 4
    rts                          ; 6

LF6DD:
    lda    #$00                  ; 2
    sta    AUDF0                 ; 3
    sta    AUDC0                 ; 3
    sta    AUDV0                 ; 3
    lda    #$17                  ; 2
    sta    ram_CA                ; 3
    lda    #$F8                  ; 2
    sta    ram_CB                ; 3
LF6ED:
    ldy    #$02                  ; 2
    lda    (ram_CA),Y            ; 5
    tax                          ; 2
    lda    0,X                   ; 4
    bne    LF70E                 ; 2³+1
    lda    1,X                   ; 4
    bne    LF750                 ; 2³+1
    ldy    #$00                  ; 2
    lda    (ram_CA),Y            ; 5
    cmp    #$17                  ; 2
    bne    LF703                 ; 2³
    rts                          ; 6

LF703:
    pha                          ; 3
    iny                          ; 2
    lda    (ram_CA),Y            ; 5
    sta    ram_CB                ; 3
    pla                          ; 4
    sta    ram_CA                ; 3
    bne    LF6ED                 ; 2³+1
LF70E:
    ldy    #$03                  ; 2
    cmp    (ram_CA),Y            ; 5
    beq    LF728                 ; 2³
    ldy    #$04                  ; 2
    cmp    (ram_CA),Y            ; 5
    beq    LF75F                 ; 2³
    clc                          ; 2
    adc    #$01                  ; 2
    pha                          ; 3
    ldy    #$02                  ; 2
    lda    (ram_CA),Y            ; 5
    tax                          ; 2
    pla                          ; 4
    sta    0,X                   ; 4
    bne    LF738                 ; 2³
LF728:
    ldy    #$02                  ; 2
    lda    (ram_CA),Y            ; 5
    tax                          ; 2
    lda    1,X                   ; 4
    bne    LF76A                 ; 2³
    lda    0,X                   ; 4
    clc                          ; 2
    adc    #$01                  ; 2
    sta    0,X                   ; 4
LF738:
    tay                          ; 2
    lda    (ram_CA),Y            ; 5
    pha                          ; 3
    and    #$0F                  ; 2
    sta    AUDV0                 ; 3
    pla                          ; 4
    ror                          ; 2
    ror                          ; 2
    ror                          ; 2
    ror                          ; 2
    and    #$0F                  ; 2
    sta    AUDF0                 ; 3
    ldy    #$06                  ; 2
    lda    (ram_CA),Y            ; 5
    sta    AUDC0                 ; 3
LF74F:
    rts                          ; 6

LF750:
    dec    1,X                   ; 6
    ldy    #$05                  ; 2
    lda    (ram_CA),Y            ; 5
    beq    LF75B                 ; 2³
    jsr    LF771                 ; 6
LF75B:
    lda    #$07                  ; 2
    bne    LF70E                 ; 3   always branch

LF75F:
    ldy    #$02                  ; 2
    lda    (ram_CA),Y            ; 5
    tax                          ; 2
    lda    #$00                  ; 2
    sta    0,X                   ; 4
    beq    LF74F                 ; 2³
LF76A:
    lda    #$00                  ; 2
    sta    0,X                   ; 4
    jmp    LF6ED                 ; 3

LF771:
    ldy    #$05                  ; 2
    lda    (ram_CA),Y            ; 5
LF775:
    sed                          ; 2
    clc                          ; 2
    adc    ram_AB                ; 3
    sta    ram_AB                ; 3
    lda    ram_AA                ; 3
    adc    #$00                  ; 2
    sta    ram_AA                ; 3
    cld                          ; 2
    rts                          ; 6

LF783:
    lda    ram_E5                ; 3
    and    #$80                  ; 2
    bne    LF79A                 ; 2³
    ldy    #$84                  ; 2
LF78B:
    lda.wy $00,Y                   ; 4
    ldx    RESM0,Y               ; 4
    sta.wy $12   ,Y              ; 5
    stx    VSYNC,Y               ; 4
    iny                          ; 2
    cpy    #$96                  ; 2
    bne    LF78B                 ; 2³
LF79A:
    lda    ram_AA                ; 3
    ldx    ram_AE                ; 3
    stx    ram_AA                ; 3
    sta    ram_AE                ; 3
    lda    ram_AB                ; 3
    ldx    ram_AF                ; 3
    stx    ram_AB                ; 3
    sta    ram_AF                ; 3
    rts                          ; 6

LF7AB:
    clc                          ; 2
    lda    #$00                  ; 2
    ldx    ram_D5                ; 3
    beq    LF7B3                 ; 2³
    txa                          ; 2
LF7B3:
    adc    #$B8                  ; 2
    sec                          ; 2
    sbc    ram_D4                ; 3
    sta    ram_CD                ; 3
LF7BA:
    ldx    #$00                  ; 2
LF7BC:
    ldy    #$02                  ; 2
    sec                          ; 2
LF7BF:
    iny                          ; 2
    sbc    #$0F                  ; 2
    bcs    LF7BF                 ; 2³
    eor    #$FF                  ; 2
    sbc    #$06                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sty    WSYNC                 ; 3
;---------------------------------------
LF7CE:
    dey                          ; 2
    bpl    LF7CE                 ; 2³
    sta    RESP0,X               ; 4
    sta    HMP0,X                ; 4
    rts                          ; 6

LF7D6:
    ldx    #$04                  ; 2
    lda    ram_D5                ; 3
    bpl    LF7DF                 ; 2³
LF7DC:
    stx    ram_D5                ; 3
    rts                          ; 6

LF7DF:
    ldx    #$E8                  ; 2
    bne    LF7DC                 ; 3   always branch

LF7E3:
    ldy    ram_A9                ; 3
    beq    LF801                 ; 2³+1
    sta    ram_CA                ; 3
    lda    #$00                  ; 2
    sta    ram_B2                ; 3
    sta    ram_B3                ; 3
    lda    ram_AE                ; 3
    sta    ram_AC                ; 3
    lda    ram_AF                ; 3
    sta    ram_AD                ; 3
    lda    ram_83                ; 3
    cpx    #$06                  ; 2
    beq    LF804                 ; 2³+1
    eor    ram_CA                ; 3
    and    #$F7                  ; 2
LF801:
    eor    #$00                  ; 2
    rts                          ; 6

LF804:
    eor    ram_CA                ; 3
    and    #$07                  ; 2
    rts                          ; 6

LF809:
    .byte $00 ; |        | $F809
    .byte $01 ; |       X| $F80A
    .byte $70 ; | XXX    | $F80B
    .byte $71 ; | XXX   X| $F80C
    .byte $04 ; |     X  | $F80D
    .byte $05 ; |     X X| $F80E
    .byte $74 ; | XXX X  | $F80F
    .byte $75 ; | XXX X X| $F810
    .byte $02 ; |      X | $F811
    .byte $03 ; |      XX| $F812
    .byte $72 ; | XXX  X | $F813
    .byte $73 ; | XXX  XX| $F814
    .byte $81 ; |X      X| $F815
    .byte $F1 ; |XXXX   X| $F816
    .byte $2E ; |  X XXX | $F817
    .byte $F8 ; |XXXXX   | $F818
    .byte $B6 ; |X XX XX | $F819
    .byte $15 ; |   X X X| $F81A
    .byte $14 ; |   X X  | $F81B
    .byte $01 ; |       X| $F81C
    .byte $07 ; |     XXX| $F81D
    .byte $FF ; |XXXXXXXX| $F81E
    .byte $FE ; |XXXXXXX | $F81F
    .byte $FD ; |XXXXXX X| $F820
    .byte $FC ; |XXXXXX  | $F821
    .byte $FB ; |XXXXX XX| $F822
    .byte $FA ; |XXXXX X | $F823
    .byte $F9 ; |XXXXX  X| $F824
    .byte $F8 ; |XXXXX   | $F825
    .byte $F7 ; |XXXX XXX| $F826
    .byte $F6 ; |XXXX XX | $F827
    .byte $F5 ; |XXXX X X| $F828
    .byte $F4 ; |XXXX X  | $F829
    .byte $F3 ; |XXXX  XX| $F82A
    .byte $F2 ; |XXXX  X | $F82B
    .byte $F1 ; |XXXX   X| $F82C
    .byte $F0 ; |XXXX    | $F82D
    .byte $45 ; | X   X X| $F82E
    .byte $F8 ; |XXXXX   | $F82F
    .byte $B4 ; |X XX X  | $F830
    .byte $15 ; |   X X X| $F831
    .byte $16 ; |   X XX | $F832
    .byte $00 ; |        | $F833
    .byte $08 ; |    X   | $F834
    .byte $11 ; |   X   X| $F835
    .byte $FF ; |XXXXXXXX| $F836
    .byte $22 ; |  X   X | $F837
    .byte $EE ; |XXX XXX | $F838
    .byte $33 ; |  XX  XX| $F839
    .byte $DD ; |XX XXX X| $F83A
    .byte $44 ; | X   X  | $F83B
    .byte $CC ; |XX  XX  | $F83C
    .byte $55 ; | X X X X| $F83D
    .byte $BB ; |X XXX XX| $F83E
    .byte $66 ; | XX  XX | $F83F
    .byte $AA ; |X X X X | $F840
    .byte $77 ; | XXX XXX| $F841
    .byte $99 ; |X  XX  X| $F842
    .byte $88 ; |X   X   | $F843
    .byte $88 ; |X   X   | $F844
    .byte $6E ; | XX XXX | $F845
    .byte $F8 ; |XXXXX   | $F846
    .byte $B8 ; |X XXX   | $F847
    .byte $22 ; |  X   X | $F848
    .byte $23 ; |  X   XX| $F849
    .byte $00 ; |        | $F84A
    .byte $08 ; |    X   | $F84B
    .byte $AF ; |X X XXXX| $F84C
    .byte $AE ; |X X XXX | $F84D
    .byte $AF ; |X X XXXX| $F84E
    .byte $AE ; |X X XXX | $F84F
    .byte $AD ; |X X XX X| $F850
    .byte $AE ; |X X XXX | $F851
    .byte $AD ; |X X XX X| $F852
    .byte $AC ; |X X XX  | $F853
    .byte $AD ; |X X XX X| $F854
    .byte $AE ; |X X XXX | $F855
    .byte $AD ; |X X XX X| $F856
    .byte $AC ; |X X XX  | $F857
    .byte $AB ; |X X X XX| $F858
    .byte $AA ; |X X X X | $F859
    .byte $AB ; |X X X XX| $F85A
    .byte $AA ; |X X X X | $F85B
    .byte $A9 ; |X X X  X| $F85C
    .byte $AA ; |X X X X | $F85D
    .byte $A9 ; |X X X  X| $F85E
    .byte $A8 ; |X X X   | $F85F
    .byte $A9 ; |X X X  X| $F860
    .byte $A7 ; |X X  XXX| $F861
    .byte $A8 ; |X X X   | $F862
    .byte $A7 ; |X X  XXX| $F863
    .byte $A6 ; |X X  XX | $F864
    .byte $A7 ; |X X  XXX| $F865
    .byte $A6 ; |X X  XX | $F866
    .byte $A5 ; |X X  X X| $F867
    .byte $A6 ; |X X  XX | $F868
    .byte $A5 ; |X X  X X| $F869
    .byte $A4 ; |X X  X  | $F86A
    .byte $A3 ; |X X   XX| $F86B
    .byte $A2 ; |X X   X | $F86C
    .byte $A1 ; |X X    X| $F86D
    .byte $85 ; |X    X X| $F86E
    .byte $F8 ; |XXXXX   | $F86F
    .byte $DB ; |XX XX XX| $F870
    .byte $14 ; |   X X  | $F871
    .byte $15 ; |   X X X| $F872
    .byte $00 ; |        | $F873
    .byte $0C ; |    XX  | $F874
    .byte $EE ; |XXX XXX | $F875
    .byte $00 ; |        | $F876
    .byte $EE ; |XXX XXX | $F877
    .byte $00 ; |        | $F878
    .byte $00 ; |        | $F879
    .byte $DD ; |XX XXX X| $F87A
    .byte $00 ; |        | $F87B
    .byte $00 ; |        | $F87C
    .byte $EE ; |XXX XXX | $F87D
    .byte $EE ; |XXX XXX | $F87E
    .byte $FF ; |XXXXXXXX| $F87F
    .byte $FF ; |XXXXXXXX| $F880
    .byte $00 ; |        | $F881
    .byte $AA ; |X X X X | $F882
    .byte $00 ; |        | $F883
    .byte $AA ; |X X X X | $F884
    .byte $17 ; |   X XXX| $F885
    .byte $F8 ; |XXXXX   | $F886
    .byte $B2 ; |X XX  X | $F887
    .byte $0A ; |    X X | $F888
    .byte $1E ; |   XXXX | $F889
    .byte $0A ; |    X X | $F88A
    .byte $0C ; |    XX  | $F88B
    .byte $1F ; |   XXXXX| $F88C
    .byte $2E ; |  X XXX | $F88D
    .byte $3D ; |  XXXX X| $F88E
    .byte $4C ; | X  XX  | $F88F
    .byte $5B ; | X XX XX| $F890
    .byte $6A ; | XX X X | $F891
    .byte $79 ; | XXXX  X| $F892
    .byte $88 ; |X   X   | $F893
    .byte $97 ; |X  X XXX| $F894
    .byte $A6 ; |X X  XX | $F895
    .byte $B5 ; |X XX X X| $F896
    .byte $C4 ; |XX   X  | $F897
    .byte $D3 ; |XX X  XX| $F898
    .byte $E2 ; |XXX   X | $F899
    .byte $F1 ; |XXXX   X| $F89A
    .byte $11 ; |   X   X| $F89B
    .byte $22 ; |  X   X | $F89C
    .byte $33 ; |  XX  XX| $F89D
    .byte $44 ; | X   X  | $F89E
    .byte $55 ; | X X X X| $F89F
    .byte $66 ; | XX  XX | $F8A0
    .byte $77 ; | XXX XXX| $F8A1
    .byte $88 ; |X   X   | $F8A2
    .byte $99 ; |X  XX  X| $F8A3
LF8A4:
    .byte $04 ; |     X  | $F8A4
    .byte $05 ; |     X X| $F8A5
    .byte $06 ; |     XX | $F8A6
    .byte $07 ; |     XXX| $F8A7
    .byte $17 ; |   X XXX| $F8A8
    .byte $16 ; |   X XX | $F8A9
    .byte $15 ; |   X X X| $F8AA
    .byte $14 ; |   X X  | $F8AB
    .byte $13 ; |   X  XX| $F8AC
    .byte $12 ; |   X  X | $F8AD
    .byte $11 ; |   X   X| $F8AE
    .byte $10 ; |   X    | $F8AF
    .byte $20 ; |  X     | $F8B0
    .byte $21 ; |  X    X| $F8B1
    .byte $22 ; |  X   X | $F8B2
    .byte $23 ; |  X   XX| $F8B3
    .byte $24 ; |  X  X  | $F8B4
    .byte $25 ; |  X  X X| $F8B5
    .byte $26 ; |  X  XX | $F8B6
    .byte $27 ; |  X  XXX| $F8B7
LF8B8:
    .byte $5A ; | X XX X | $F8B8
LF8B9:
    .byte $CD ; |XX  XX X| $F8B9
LF8BA:
    .byte $90 ; |X  X    | $F8BA
LF8BB:
    .byte $44 ; | X   X  | $F8BB
LF8BC:
    .byte $86 ; |X    XX | $F8BC
LF8BD:
    .byte $FF ; |XXXXXXXX| $F8BD
    .byte $0E ; |    XXX | $F8BE
    .byte $02 ; |      X | $F8BF
    .byte $08 ; |    X   | $F8C0
    .byte $0C ; |    XX  | $F8C1
    .byte $0A ; |    X X | $F8C2
    .byte $06 ; |     XX | $F8C3
    .byte $E7 ; |XXX  XXX| $F8C4
    .byte $A5 ; |X X  X X| $F8C5
    .byte $A5 ; |X X  X X| $F8C6
    .byte $A5 ; |X X  X X| $F8C7
    .byte $E7 ; |XXX  XXX| $F8C8
    .byte $42 ; | X    X | $F8C9
    .byte $42 ; | X    X | $F8CA
    .byte $42 ; | X    X | $F8CB
    .byte $42 ; | X    X | $F8CC
    .byte $42 ; | X    X | $F8CD
    .byte $E7 ; |XXX  XXX| $F8CE
    .byte $81 ; |X      X| $F8CF
    .byte $E7 ; |XXX  XXX| $F8D0
    .byte $24 ; |  X  X  | $F8D1
    .byte $E7 ; |XXX  XXX| $F8D2
    .byte $E7 ; |XXX  XXX| $F8D3
    .byte $24 ; |  X  X  | $F8D4
    .byte $66 ; | XX  XX | $F8D5
    .byte $24 ; |  X  X  | $F8D6
    .byte $E7 ; |XXX  XXX| $F8D7
    .byte $24 ; |  X  X  | $F8D8
    .byte $24 ; |  X  X  | $F8D9
    .byte $E7 ; |XXX  XXX| $F8DA
    .byte $A5 ; |X X  X X| $F8DB
    .byte $81 ; |X      X| $F8DC
    .byte $E7 ; |XXX  XXX| $F8DD
    .byte $24 ; |  X  X  | $F8DE
    .byte $E7 ; |XXX  XXX| $F8DF
    .byte $81 ; |X      X| $F8E0
    .byte $E7 ; |XXX  XXX| $F8E1
    .byte $E7 ; |XXX  XXX| $F8E2
    .byte $A5 ; |X X  X X| $F8E3
    .byte $E7 ; |XXX  XXX| $F8E4
    .byte $81 ; |X      X| $F8E5
    .byte $E7 ; |XXX  XXX| $F8E6
    .byte $24 ; |  X  X  | $F8E7
    .byte $24 ; |  X  X  | $F8E8
    .byte $24 ; |  X  X  | $F8E9
    .byte $24 ; |  X  X  | $F8EA
    .byte $E7 ; |XXX  XXX| $F8EB
    .byte $E7 ; |XXX  XXX| $F8EC
    .byte $A5 ; |X X  X X| $F8ED
    .byte $E7 ; |XXX  XXX| $F8EE
    .byte $A5 ; |X X  X X| $F8EF
    .byte $E7 ; |XXX  XXX| $F8F0
    .byte $E7 ; |XXX  XXX| $F8F1
    .byte $24 ; |  X  X  | $F8F2
    .byte $E7 ; |XXX  XXX| $F8F3
    .byte $A5 ; |X X  X X| $F8F4
    .byte $E7 ; |XXX  XXX| $F8F5
    .byte $00 ; |        | $F8F6
    .byte $00 ; |        | $F8F7
    .byte $00 ; |        | $F8F8
    .byte $00 ; |        | $F8F9
    .byte $00 ; |        | $F8FA
    .byte $A5 ; |X X  X X| $F8FB
    .byte $A5 ; |X X  X X| $F8FC
    .byte $42 ; | X    X | $F8FD
    .byte $A5 ; |X X  X X| $F8FE
    .byte $A5 ; |X X  X X| $F8FF
LF900:
    .byte $00 ; |        | $F900
    .byte $28 ; |  X X   | $F901
    .byte $58 ; | X XX   | $F902
    .byte $82 ; |X     X | $F903
    .byte $A4 ; |X X  X  | $F904
LF905:
    .byte $A1 ; |X X    X| $F905
    .byte $98 ; |X  XX   | $F906
    .byte $92 ; |X  X  X | $F907
    .byte $8C ; |X   XX  | $F908
    .byte $87 ; |X    XXX| $F909
    .byte $81 ; |X      X| $F90A
    .byte $7C ; | XXXXX  | $F90B
    .byte $77 ; | XXX XXX| $F90C
    .byte $72 ; | XXX  X | $F90D
    .byte $6D ; | XX XX X| $F90E
    .byte $68 ; | XX X   | $F90F
    .byte $64 ; | XX  X  | $F910
    .byte $5F ; | X XXXXX| $F911
    .byte $5B ; | X XX XX| $F912
    .byte $57 ; | X X XXX| $F913
    .byte $53 ; | X X  XX| $F914
    .byte $4F ; | X  XXXX| $F915
    .byte $4B ; | X  X XX| $F916
    .byte $48 ; | X  X   | $F917
    .byte $45 ; | X   X X| $F918
    .byte $42 ; | X    X | $F919
    .byte $3F ; |  XXXXXX| $F91A
    .byte $3C ; |  XXXX  | $F91B
    .byte $3A ; |  XXX X | $F91C
    .byte $37 ; |  XX XXX| $F91D
    .byte $35 ; |  XX X X| $F91E
    .byte $33 ; |  XX  XX| $F91F
    .byte $31 ; |  XX   X| $F920
    .byte $2F ; |  X XXXX| $F921
    .byte $2D ; |  X XX X| $F922
    .byte $2B ; |  X X XX| $F923
    .byte $2A ; |  X X X | $F924
    .byte $29 ; |  X X  X| $F925
    .byte $28 ; |  X X   | $F926
    .byte $27 ; |  X  XXX| $F927
    .byte $26 ; |  X  XX | $F928
    .byte $25 ; |  X  X X| $F929
    .byte $25 ; |  X  X X| $F92A
    .byte $24 ; |  X  X  | $F92B
    .byte $00 ; |        | $F92C
    .byte $A1 ; |X X    X| $F92D
    .byte $98 ; |X  XX   | $F92E
    .byte $92 ; |X  X  X | $F92F
    .byte $8C ; |X   XX  | $F930
    .byte $87 ; |X    XXX| $F931
    .byte $81 ; |X      X| $F932
    .byte $7B ; | XXXX XX| $F933
    .byte $76 ; | XXX XX | $F934
    .byte $71 ; | XXX   X| $F935
    .byte $6C ; | XX XX  | $F936
    .byte $67 ; | XX  XXX| $F937
    .byte $62 ; | XX   X | $F938
    .byte $5D ; | X XXX X| $F939
    .byte $59 ; | X XX  X| $F93A
    .byte $54 ; | X X X  | $F93B
    .byte $50 ; | X X    | $F93C
    .byte $4B ; | X  X XX| $F93D
    .byte $47 ; | X   XXX| $F93E
    .byte $43 ; | X    XX| $F93F
    .byte $3F ; |  XXXXXX| $F940
    .byte $3B ; |  XXX XX| $F941
    .byte $38 ; |  XXX   | $F942
    .byte $34 ; |  XX X  | $F943
    .byte $31 ; |  XX   X| $F944
    .byte $2D ; |  X XX X| $F945
    .byte $2A ; |  X X X | $F946
    .byte $27 ; |  X  XXX| $F947
    .byte $24 ; |  X  X  | $F948
    .byte $21 ; |  X    X| $F949
    .byte $1E ; |   XXXX | $F94A
    .byte $1C ; |   XXX  | $F94B
    .byte $19 ; |   XX  X| $F94C
    .byte $17 ; |   X XXX| $F94D
    .byte $15 ; |   X X X| $F94E
    .byte $12 ; |   X  X | $F94F
    .byte $10 ; |   X    | $F950
    .byte $0F ; |    XXXX| $F951
    .byte $0D ; |    XX X| $F952
    .byte $0B ; |    X XX| $F953
    .byte $0A ; |    X X | $F954
    .byte $08 ; |    X   | $F955
    .byte $07 ; |     XXX| $F956
    .byte $06 ; |     XX | $F957
    .byte $04 ; |     X  | $F958
    .byte $03 ; |      XX| $F959
    .byte $02 ; |      X | $F95A
    .byte $01 ; |       X| $F95B
    .byte $00 ; |        | $F95C
    .byte $A1 ; |X X    X| $F95D
    .byte $98 ; |X  XX   | $F95E
    .byte $91 ; |X  X   X| $F95F
    .byte $8A ; |X   X X | $F960
    .byte $84 ; |X    X  | $F961
    .byte $7D ; | XXXXX X| $F962
    .byte $77 ; | XXX XXX| $F963
    .byte $71 ; | XXX   X| $F964
    .byte $6B ; | XX X XX| $F965
    .byte $65 ; | XX  X X| $F966
    .byte $60 ; | XX     | $F967
    .byte $5A ; | X XX X | $F968
    .byte $55 ; | X X X X| $F969
    .byte $50 ; | X X    | $F96A
    .byte $4B ; | X  X XX| $F96B
    .byte $46 ; | X   XX | $F96C
    .byte $41 ; | X     X| $F96D
    .byte $3D ; |  XXXX X| $F96E
    .byte $38 ; |  XXX   | $F96F
    .byte $34 ; |  XX X  | $F970
    .byte $30 ; |  XX    | $F971
    .byte $2C ; |  X XX  | $F972
    .byte $29 ; |  X X  X| $F973
    .byte $25 ; |  X  X X| $F974
    .byte $22 ; |  X   X | $F975
    .byte $1F ; |   XXXXX| $F976
    .byte $1B ; |   XX XX| $F977
    .byte $18 ; |   XX   | $F978
    .byte $16 ; |   X XX | $F979
    .byte $13 ; |   X  XX| $F97A
    .byte $11 ; |   X   X| $F97B
    .byte $0F ; |    XXXX| $F97C
    .byte $0C ; |    XX  | $F97D
    .byte $0B ; |    X XX| $F97E
    .byte $09 ; |    X  X| $F97F
    .byte $07 ; |     XXX| $F980
    .byte $06 ; |     XX | $F981
    .byte $04 ; |     X  | $F982
    .byte $03 ; |      XX| $F983
    .byte $02 ; |      X | $F984
    .byte $01 ; |       X| $F985
    .byte $00 ; |        | $F986
    .byte $A1 ; |X X    X| $F987
    .byte $98 ; |X  XX   | $F988
    .byte $8F ; |X   XXXX| $F989
    .byte $87 ; |X    XXX| $F98A
    .byte $7E ; | XXXXXX | $F98B
    .byte $76 ; | XXX XX | $F98C
    .byte $6E ; | XX XXX | $F98D
    .byte $67 ; | XX  XXX| $F98E
    .byte $60 ; | XX     | $F98F
    .byte $59 ; | X XX  X| $F990
    .byte $52 ; | X X  X | $F991
    .byte $4B ; | X  X XX| $F992
    .byte $45 ; | X   X X| $F993
    .byte $3F ; |  XXXXXX| $F994
    .byte $3A ; |  XXX X | $F995
    .byte $34 ; |  XX X  | $F996
    .byte $2F ; |  X XXXX| $F997
    .byte $2A ; |  X X X | $F998
    .byte $26 ; |  X  XX | $F999
    .byte $21 ; |  X    X| $F99A
    .byte $1D ; |   XXX X| $F99B
    .byte $19 ; |   XX  X| $F99C
    .byte $16 ; |   X XX | $F99D
    .byte $12 ; |   X  X | $F99E
    .byte $0F ; |    XXXX| $F99F
    .byte $0C ; |    XX  | $F9A0
    .byte $0A ; |    X X | $F9A1
    .byte $08 ; |    X   | $F9A2
    .byte $06 ; |     XX | $F9A3
    .byte $04 ; |     X  | $F9A4
    .byte $03 ; |      XX| $F9A5
    .byte $02 ; |      X | $F9A6
    .byte $01 ; |       X| $F9A7
    .byte $00 ; |        | $F9A8
    .byte $A1 ; |X X    X| $F9A9
    .byte $98 ; |X  XX   | $F9AA
    .byte $8E ; |X   XXX | $F9AB
    .byte $84 ; |X    X  | $F9AC
    .byte $7B ; | XXXX XX| $F9AD
    .byte $73 ; | XXX  XX| $F9AE
    .byte $6A ; | XX X X | $F9AF
    .byte $62 ; | XX   X | $F9B0
    .byte $5A ; | X XX X | $F9B1
    .byte $52 ; | X X  X | $F9B2
    .byte $4B ; | X  X XX| $F9B3
    .byte $44 ; | X   X  | $F9B4
    .byte $3E ; |  XXXXX | $F9B5
    .byte $37 ; |  XX XXX| $F9B6
    .byte $31 ; |  XX   X| $F9B7
    .byte $2C ; |  X XX  | $F9B8
    .byte $27 ; |  X  XXX| $F9B9
    .byte $22 ; |  X   X | $F9BA
    .byte $1D ; |   XXX X| $F9BB
    .byte $19 ; |   XX  X| $F9BC
    .byte $15 ; |   X X X| $F9BD
    .byte $11 ; |   X   X| $F9BE
    .byte $0E ; |    XXX | $F9BF
    .byte $0B ; |    X XX| $F9C0
    .byte $08 ; |    X   | $F9C1
    .byte $06 ; |     XX | $F9C2
    .byte $04 ; |     X  | $F9C3
    .byte $02 ; |      X | $F9C4
    .byte $01 ; |       X| $F9C5
    .byte $00 ; |        | $F9C6
    .byte $00 ; |        | $F9C7
    .byte $00 ; |        | $F9C8
    .byte $00 ; |        | $F9C9
    .byte $00 ; |        | $F9CA
    .byte $00 ; |        | $F9CB
    .byte $00 ; |        | $F9CC
    .byte $00 ; |        | $F9CD
    .byte $00 ; |        | $F9CE
    .byte $00 ; |        | $F9CF
    .byte $00 ; |        | $F9D0
    .byte $00 ; |        | $F9D1
    .byte $00 ; |        | $F9D2
    .byte $00 ; |        | $F9D3
    .byte $00 ; |        | $F9D4
    .byte $00 ; |        | $F9D5
    .byte $00 ; |        | $F9D6
    .byte $00 ; |        | $F9D7
    .byte $00 ; |        | $F9D8
    .byte $00 ; |        | $F9D9
    .byte $00 ; |        | $F9DA
    .byte $00 ; |        | $F9DB
    .byte $00 ; |        | $F9DC
    .byte $00 ; |        | $F9DD
    .byte $00 ; |        | $F9DE
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

  IF ECHO_0
    ECHO ([$FCB8 - *]d), "bytes free to $FCB8"
  ENDIF

ECHO_0 = 1

       ORG $FCB8

LFCB8:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00

LFD00:
    .byte $00 ; |        | $FD00
    .byte $38 ; |  XXX   | $FD01
    .byte $38 ; |  XXX   | $FD02
    .byte $92 ; |X  X  X | $FD03
    .byte $54 ; | X X X  | $FD04
    .byte $38 ; |  XXX   | $FD05
    .byte $10 ; |   X    | $FD06
    .byte $10 ; |   X    | $FD07
    .byte $38 ; |  XXX   | $FD08
    .byte $44 ; | X   X  | $FD09
    .byte $82 ; |X     X | $FD0A
    .byte $00 ; |        | $FD0B
    .byte $38 ; |  XXX   | $FD0C
    .byte $38 ; |  XXX   | $FD0D
    .byte $90 ; |X  X    | $FD0E
    .byte $50 ; | X X    | $FD0F
    .byte $38 ; |  XXX   | $FD10
    .byte $14 ; |   X X  | $FD11
    .byte $12 ; |   X  X | $FD12
    .byte $38 ; |  XXX   | $FD13
    .byte $44 ; | X   X  | $FD14
    .byte $82 ; |X     X | $FD15
    .byte $00 ; |        | $FD16
    .byte $38 ; |  XXX   | $FD17
    .byte $38 ; |  XXX   | $FD18
    .byte $12 ; |   X  X | $FD19
    .byte $14 ; |   X X  | $FD1A
    .byte $38 ; |  XXX   | $FD1B
    .byte $50 ; | X X    | $FD1C
    .byte $90 ; |X  X    | $FD1D
    .byte $38 ; |  XXX   | $FD1E
    .byte $24 ; |  X  X  | $FD1F
    .byte $22 ; |  X   X | $FD20
    .byte $00 ; |        | $FD21
    .byte $38 ; |  XXX   | $FD22
    .byte $38 ; |  XXX   | $FD23
    .byte $10 ; |   X    | $FD24
    .byte $10 ; |   X    | $FD25
    .byte $38 ; |  XXX   | $FD26
    .byte $54 ; | X X X  | $FD27
    .byte $92 ; |X  X  X | $FD28
    .byte $38 ; |  XXX   | $FD29
    .byte $28 ; |  X X   | $FD2A
    .byte $28 ; |  X X   | $FD2B
    .byte $00 ; |        | $FD2C
    .byte $82 ; |X     X | $FD2D
    .byte $44 ; | X   X  | $FD2E
    .byte $38 ; |  XXX   | $FD2F
    .byte $10 ; |   X    | $FD30
    .byte $10 ; |   X    | $FD31
    .byte $FF ; |XXXXXXXX| $FD32
    .byte $FF ; |XXXXXXXX| $FD33
    .byte $00 ; |        | $FD34
    .byte $00 ; |        | $FD35
    .byte $00 ; |        | $FD36
    .byte $00 ; |        | $FD37
    .byte $82 ; |X     X | $FD38
    .byte $44 ; | X   X  | $FD39
    .byte $38 ; |  XXX   | $FD3A
    .byte $12 ; |   X  X | $FD3B
    .byte $14 ; |   X X  | $FD3C
    .byte $FF ; |XXXXXXXX| $FD3D
    .byte $FF ; |XXXXXXXX| $FD3E
    .byte $00 ; |        | $FD3F
    .byte $00 ; |        | $FD40
    .byte $00 ; |        | $FD41
    .byte $00 ; |        | $FD42
    .byte $22 ; |  X   X | $FD43
    .byte $24 ; |  X  X  | $FD44
    .byte $38 ; |  XXX   | $FD45
    .byte $90 ; |X  X    | $FD46
    .byte $50 ; | X X    | $FD47
    .byte $FF ; |XXXXXXXX| $FD48
    .byte $FF ; |XXXXXXXX| $FD49
    .byte $00 ; |        | $FD4A
    .byte $00 ; |        | $FD4B
    .byte $00 ; |        | $FD4C
    .byte $00 ; |        | $FD4D
    .byte $28 ; |  X X   | $FD4E
    .byte $28 ; |  X X   | $FD4F
    .byte $38 ; |  XXX   | $FD50
    .byte $92 ; |X  X  X | $FD51
    .byte $54 ; | X X X  | $FD52
    .byte $FF ; |XXXXXXXX| $FD53
    .byte $FF ; |XXXXXXXX| $FD54
    .byte $00 ; |        | $FD55
    .byte $00 ; |        | $FD56
    .byte $00 ; |        | $FD57
    .byte $00 ; |        | $FD58
    .byte $38 ; |  XXX   | $FD59
    .byte $38 ; |  XXX   | $FD5A
    .byte $10 ; |   X    | $FD5B
    .byte $10 ; |   X    | $FD5C
    .byte $38 ; |  XXX   | $FD5D
    .byte $54 ; | X X X  | $FD5E
    .byte $92 ; |X  X  X | $FD5F
    .byte $38 ; |  XXX   | $FD60
    .byte $28 ; |  X X   | $FD61
    .byte $28 ; |  X X   | $FD62
    .byte $00 ; |        | $FD63
    .byte $00 ; |        | $FD64
    
    
;     .byte $00 ; |        | $FD4A
;     .byte $00 ; |        | $FD4B
;     .byte $00 ; |        | $FD4C
;     .byte $00 ; |        | $FD4D
;     .byte $28 ; |  X X   | $FD4E
;     .byte $28 ; |  X X   | $FD4F
;     .byte $38 ; |  XXX   | $FD50
;     .byte $92 ; |X  X  X | $FD51
;     .byte $54 ; | X X X  | $FD52
;     .byte $FF ; |XXXXXXXX| $FD53
;     .byte $FF ; |XXXXXXXX| $FD54
;     .byte $30 ; |  XX    | $FD55
;     .byte $78 ; | XXXX   | $FD56
;     .byte $3E ; |  XXXXX | $FD57
;     .byte $6E ; | XX XXX | $FD58
    
    

LFD65:
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    nop                          ; 2
    lda    (ram_BC),Y            ; 5
    and    #$F0                  ; 2
    sta    PF1                   ; 3
    lda    (ram_BE),Y            ; 5
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    PF2                   ; 3
    lda    (ram_C4),Y            ; 5
    and    #$F0                  ; 2
    sta    PF1                   ; 3
    lda    (ram_C6),Y            ; 5
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    PF2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_BA),Y            ; 5
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    PF1                   ; 3
    lda    (ram_C0),Y            ; 5
    and    #$0F                  ; 2
    sta    PF2                   ; 3
    lda    (ram_C2),Y            ; 5
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    PF1                   ; 3
    lda    (ram_C8),Y            ; 5
    and    #$0F                  ; 2
    sta    PF2                   ; 3
    dey                          ; 2
    bpl    LFD65                 ; 2³
    iny                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    CTRLPF                ; 3
    ldx    #$00                  ; 2
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    ldx    #$05                  ; 2
LFDB5:
    lda    ram_84,X              ; 4
    sta.wy ram_BA,Y              ; 5
    iny                          ; 2
    dex                          ; 2
    bpl    LFDB5                 ; 2³
    lda    #$00                  ; 2
    tay                          ; 2
    jmp    LFE96                 ; 3

  IF ECHO_1
    ECHO ([$FE96 - *]d), "bytes free to $FE96"
  ENDIF

ECHO_1 = 1

       ORG $FE96

LFE96:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    ldx    ram_D6                ; 3
    cpy    ram_CE                ; 3
    bne    LFEA1                 ; 2³
    inx                          ; 2
LFEA1:
    lda    ram_BF                ; 3
    sta    PF0                   ; 3
    lda    ram_BE                ; 3
    sta    PF1                   ; 3
    lda    ram_BD                ; 3
    sta    PF2                   ; 3
    lda    ram_BC                ; 3
    sta    PF0                   ; 3
    lda    ram_BB                ; 3
    sta    PF1                   ; 3
    iny                          ; 2
    lda    ram_BA                ; 3
    sta    PF2                   ; 3
    lda    LFD00,X               ; 4
    beq    LFEC2                 ; 2³
    inx                          ; 2
    stx    ram_D6                ; 3
LFEC2:
    dec    ram_DA                ; 5
    bne    LFE96                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    #$06                  ; 2
    sta    ram_D9                ; 3
    pla                          ; 4
    sta    COLUPF                ; 3
LFED1:
    lda    #$00                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    pla                          ; 4
    ldx    ram_D9                ; 3
    sta    ram_B9,X              ; 4
    ldx    ram_D6                ; 3
    cpy    ram_CE                ; 3
    bne    LFEE5                 ; 2³
    inx                          ; 2
LFEE5:
    lda    LFD00,X               ; 4
    beq    LFEED                 ; 2³
    inx                          ; 2
    stx    ram_D6                ; 3
LFEED:
    iny                          ; 2
    cpy    #$1F                  ; 2
    beq    LFF00                 ; 2³+1
    dec    ram_D9                ; 5
    beq    LFE96                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    #$06                  ; 2
    sta    ram_DA                ; 3
    bne    LFED1                 ; 2³+1
LFF00:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    #$00                  ; 2
    cpy    #$2A                  ; 2
    bcs    LFF10                 ; 2³
    cpy    #$24                  ; 2
    bcc    LFF10                 ; 2³
    lda    ram_E6                ; 3
LFF10:
    sta    ENAM1                 ; 3
    ldx    ram_CF                ; 3
    bne    LFF1E                 ; 2³
    ldx    ram_DD                ; 3
    lda    INPT0,X               ; 4
    bpl    LFF1E                 ; 2³
    sty    ram_CF                ; 3
LFF1E:
    ldx    ram_D6                ; 3
    cpy    ram_CE                ; 3
    bne    LFF25                 ; 2³
    inx                          ; 2
LFF25:
    lda    LFD00,X               ; 4
    beq    LFF2D                 ; 2³
    inx                          ; 2
    stx    ram_D6                ; 3
LFF2D:
    iny                          ; 2
    cpy    #$A0                  ; 2
    bne    LFF00                 ; 2³
    ldx    #$00                  ; 2
LFF34:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    ldx    #$00                  ; 2
    stx    COLUPF                ; 3
    stx    NUSIZ1                ; 3
    lda    #$32                  ; 2
    sta    PF0                   ; 3
    sta    ENAM0                 ; 3
    inx                          ; 2
    stx    CTRLPF                ; 3
    ldx    ram_D6                ; 3
    cpy    ram_CE                ; 3
    bne    LFF52                 ; 2³
    inx                          ; 2
LFF52:
    lda    LFD00,X               ; 4
    beq    LFF5A                 ; 2³
    inx                          ; 2
    stx    ram_D6                ; 3
LFF5A:
    ldx    LFCB8,Y               ; 4
    iny                          ; 2
    cpy    #$AE                  ; 2
    bne    LFF34                 ; 2³
    jmp    LF4B3                 ; 3

  IF ECHO_2
    ECHO ([$FFFC - *]d), "bytes free to $FFFC"
  ENDIF

ECHO_2 = 1

       ORG $FFFC

    .byte $00 ; |        | $FFFC
    .byte $F0 ; |XXXX    | $FFFD
    .byte $00 ; |        | $FFFE
    .byte $00 ; |        | $FFFF
