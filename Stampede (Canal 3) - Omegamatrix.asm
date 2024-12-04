; Disassembly of Stampede (Canal 3)
; Disassembled by Omegamatrix
;
; Command Line: distella -pasfcStamp.cfg Stamp.bin > Stampede.asm
;
; Stamp.cfg contents:
;
;      ORG F000
;      CODE F000 F5E5
;      GFX F5E6 F7AF
;      CODE F7B0 F7FB
;      GFX F7FC F7FF

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
REFP1   =  $0C
PF0     =  $0D
RESP0   =  $10
RESP1   =  $11
RESM1   =  $13
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
HMM1    =  $23
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C

; Read TIA Baseline = $00
CXM0P   =  $00
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

ACTIVISION = 0

       ORG $F000

START:
    sei                          ; 2
    cld                          ; 2
    ldx    #0                    ; 2
    txa                          ; 2
LF005:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    LF005                 ; 2³

    tay                          ; 2
    dec    $99                   ; 5
    jmp    LF1F0                 ; 3
LF011:
    ldx    #8                    ; 2
    ldy    #$A5                  ; 2
LF015:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
LF018:
    and    #$78                  ; 2
    beq    LF020                 ; 2³
    ldy    #0                    ; 2
    beq    LF024                 ; 2³
LF020:
    txa                          ; 2
    beq    LF024                 ; 2³
    tya                          ; 2
LF024:
    sta    $81,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    rts                          ; 6

LF029:
    lda    #0                    ; 2
    sta    ENAM0                 ; 3
    sty    $95                   ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    bcs    LF067                 ; 2³
LF035:
    ldx    $C0                   ; 3
    inx                          ; 2
LF038:
    lda    #$A4                  ; 2
    sta    $91                   ; 3
    bne    LF04A                 ; 2³
LF03E:
    txa                          ; 2
    tay                          ; 2
    lda    ($91),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($93),Y               ; 5
    sta    HMP1                  ; 3
    ldy    $95                   ; 3
LF04A:
    dey                          ; 2
    cpy    #$1A                  ; 2
    bcs    LF029                 ; 2³
    lda    ($8B),Y               ; 5
    sta    HMP0                  ; 3
    and    #$05                  ; 2
    ora    ($8D),Y               ; 5
    sta    HMM0                  ; 3
    eor    #$20                  ; 2
    sta    ENAM0                 ; 3
    and    #$FD                  ; 2
    sta    NUSIZ0                ; 3
    lda    ($8F),Y               ; 5
    sta    HMOVE                 ; 3
    sty    $95                   ; 3
LF067:
    dex                          ; 2
    sta    GRP0                  ; 3
    bne    LF03E                 ; 2³
    stx    GRP1                  ; 3
    dec    $98                   ; 5
    beq    LF035                 ; 2³
    bmi    LF0B9                 ; 2³
    dey                          ; 2
    cpy    #$1A                  ; 2
    txa                          ; 2
    ldx    $98                   ; 3
    bcs    LF090                 ; 2³
    lda    ($8B),Y               ; 5
    sta    HMP0                  ; 3
    and    #$05                  ; 2
    ora    ($8D),Y               ; 5
    sta    HMM0                  ; 3
    eor    #$20                  ; 2
    sta    ENAM0                 ; 3
    and    #$FD                  ; 2
    sta    NUSIZ0                ; 3
    lda    ($8F),Y               ; 5
LF090:
    dey                          ; 2
    cpy    #$1A                  ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    $D5,X                 ; 4
    ldx    #$40                  ; 2
    ora    #$00                  ; 2
    bmi    LF0C5                 ; 2³
    beq    LF0A5                 ; 2³
    tax                          ; 2
LF0A4:
    dex                          ; 2
LF0A5:
    bne    LF0A4                 ; 2³
    sta    RESP1                 ; 3
    stx    HMP1                  ; 3
    bcs    LF0D5                 ; 2³
    lda    ($8B),Y               ; 5
    sta    HMP0                  ; 3
    and    #$05                  ; 2
    ora    ($8D),Y               ; 5
    sta    HMM0                  ; 3
    bcc    LF0EE                 ; 2³
LF0B9:
    lda    CXM0P                 ; 3
    lsr                          ; 2
    ora    COLUP1                ; 3
    sta    $DC                   ; 3
    stx    REFP1                 ; 3
    jmp    LF157                 ; 3
LF0C5:
    tax                          ; 2
    lda    #0                    ; 2
    sta    HMP1                  ; 3
    bcc    LF0DF                 ; 2³
    inx                          ; 2
    inx                          ; 2
    dec    $96                   ; 5
LF0D0:
    dex                          ; 2
    bmi    LF0D0                 ; 2³
    sta    RESP1                 ; 3
LF0D5:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    sta    ENAM0                 ; 3
    beq    LF0FC                 ; 2³
LF0DF:
    lda    ($8B),Y               ; 5
    sta    HMP0                  ; 3
    and    #$05                  ; 2
    ora    ($8D),Y               ; 5
    sta    HMM0                  ; 3
LF0E9:
    dex                          ; 2
    bmi    LF0E9                 ; 2³
    sta    RESP1                 ; 3
LF0EE:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    eor    #$20                  ; 2
    sta    ENAM0                 ; 3
    and    #$FD                  ; 2
    sta    NUSIZ0                ; 3
    lda    ($8F),Y               ; 5
LF0FC:
    sta    GRP0                  ; 3
    dey                          ; 2
    ldx    $98                   ; 3
    cpy    #$1A                  ; 2
    bcs    LF136                 ; 2³
    sec                          ; 2
LF106:
    lda    ($8B),Y               ; 5
    sta    HMP0                  ; 3
    and    #$05                  ; 2
    ora    ($8D),Y               ; 5
    sta    HMM0                  ; 3
    eor    #$20                  ; 2
    sta    ENAM0                 ; 3
    and    #$FD                  ; 2
    sta    NUSIZ0                ; 3
    lda    ($8F),Y               ; 5
    bcs    LF138                 ; 2³
LF11C:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    $DB,X                 ; 4
    sta    COLUP1                ; 3
    lda    CXM0P                 ; 3
    lsr                          ; 2
    ora    COLUP1                ; 3
    sta    $DC,X                 ; 4
    ldx    #$10                  ; 2
    sta    CXCLR                 ; 3
    sta    HMCLR                 ; 3
    jmp    LF04A                 ; 3
LF136:
    lda    #0                    ; 2
LF138:
    dey                          ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    $EB,X                 ; 4
    sta    $91                   ; 3
    lda    $F1,X                 ; 4
    sta    $93                   ; 3
    lda    $C9,X                 ; 4
    sta    NUSIZ1                ; 3
    sta    REFP1                 ; 3
    sta    HMP1                  ; 3
    cpy    #$1A                  ; 2
    bcc    LF106                 ; 2³
    lda    #0                    ; 2
    beq    LF11C                 ; 2³
LF157:
    stx    AUDC0                 ; 3
    stx    GRP0                  ; 3
LF15B:
    sta    WSYNC                 ; 3
    lda    $B5                   ; 3
    ldx    #$35                  ; 2
    jsr    LF1B2                 ; 6
    asl                          ; 2
    sta    RESP0                 ; 3
    stx    CTRLPF                ; 3
    stx    PF0                   ; 3
    stx    AUDV0                 ; 3
    ldx    #3                    ; 2
    ldy    #$13                  ; 2
    sta    RESP1                 ; 3
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    sty    AUDF1                 ; 3
    eor    #$80                  ; 2
    sta    HMCLR                 ; 3
    sta    RESM1                 ; 3
LF17F:
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    sta    HMM1                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    $FA                   ; 3
    sta    COLUBK                ; 3
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    sty    ENAM1                 ; 3
    lda    #$30                  ; 2
    sty    VDELP1                ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    lda    $FB                   ; 3
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    lda    #$1D                  ; 2
    dex                          ; 2
    bne    LF17F                 ; 2³
    sta    WSYNC                 ; 3
    stx    GRP1                  ; 3
    stx    GRP0                  ; 3
LF1B2:
    stx    ENAM1                 ; 3
    rts                          ; 6

LF1B5:
    ldy    INTIM                 ; 4
    bne    LF1B5                 ; 2³
    sta    WSYNC                 ; 3
    stx    VSYNC                 ; 3
    inc    $80                   ; 5
    bne    LF1C8                 ; 2³
    inc    $BB                   ; 5
    bne    LF1C8                 ; 2³
    stx    $BA                   ; 3
LF1C8:
    txa                          ; 2
    eor    SWCHB                 ; 4
    and    #$08                  ; 2
    asl                          ; 2
    sbc    #0                    ; 2
    bit    $BA                   ; 3
    bpl    LF1D7                 ; 2³
    and    #$F7                  ; 2
LF1D7:
    sta    $E9                   ; 3
    ldx    #4                    ; 2
LF1DB:
    lda    $BB                   ; 3
    and    $BA                   ; 3
    eor    LF6FB,X               ; 4
    and    $E9                   ; 3
    sta    $F7,X                 ; 4
    sta    NUSIZ1,X              ; 4
    dex                          ; 2
    stx    $E2                   ; 3
    bne    LF1DB                 ; 2³
    lda    SWCHB                 ; 4
LF1F0:
    ldx    #$2D                  ; 2
    lsr                          ; 2
    ror                          ; 2
    sta    WSYNC                 ; 3
    sty    VSYNC                 ; 3
    stx    TIM64T                ; 4
    bmi    LF219                 ; 2³+1
    ldx    #$0C                  ; 2
LF1FF:
    lda    LF798,X               ; 4
    sta    $BD,X                 ; 4
    sta    $CB,X                 ; 4
    sty    $99,X                 ; 4
    sty    $A5,X                 ; 4
    sty    $B1,X                 ; 4
    dex                          ; 2
    bne    LF1FF                 ; 2³+1
    lda    $99                   ; 3
    and    #$02                  ; 2
    beq    LF219                 ; 2³
    ora    $80                   ; 3
    sta    $C7                   ; 3
LF219:
    tya                          ; 2
    bcs    LF23A                 ; 2³
    ldx    $99                   ; 3
    dec    $97                   ; 5
    bpl    LF23C                 ; 2³
    inx                          ; 2
    txa                          ; 2
    and    #$07                  ; 2
    sta    $99                   ; 3
    adc    #1                    ; 2
    sta    $B8                   ; 3
    sta    $B9                   ; 3
    ldx    #4                    ; 2
    tya                          ; 2
LF231:
    sta    $BA,X                 ; 4
    dex                          ; 2
    bpl    LF231                 ; 2³
    stx    $9A                   ; 3
    lda    #$1D                  ; 2
LF23A:
    sta    $97                   ; 3
LF23C:
    ldx    $B6                   ; 3
    lda    SWCHA                 ; 4
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    bcs    LF249                 ; 2³
    dex                          ; 2
    bcc    LF24C                 ; 2³
LF249:
    bmi    LF250                 ; 2³
    inx                          ; 2
LF24C:
    sty    $BA                   ; 3
    sty    $BB                   ; 3
LF250:
    txa                          ; 2
    cmp    #$69                  ; 2
    bit    $9A                   ; 3
    ldx    $B3                   ; 3
    bvs    LF2D7                 ; 2³
    bcs    LF261                 ; 2³
    cpx    #4                    ; 2
    bcs    LF261                 ; 2³
    sta    $B6                   ; 3
LF261:
    lda    $BF                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    $B5                   ; 3
    tay                          ; 2
    bne    LF27C                 ; 2³
    bit    $BF                   ; 3
    bmi    LF27C                 ; 2³
    inc    $BF                   ; 5
    ldx    #3                    ; 2
    cpx    $99                   ; 3
    bcs    LF27C                 ; 2³
    ldx    #$80                  ; 2
    stx    $BF                   ; 3
LF27C:
    eor    $B5                   ; 3
    sta    $EA                   ; 3
    and    #$38                  ; 2
    beq    LF29C                 ; 2³
    dec    $E2                   ; 5
    cmp    #$20                  ; 2
    and    #$08                  ; 2
    bne    LF28E                 ; 2³
    dec    $E2                   ; 5
LF28E:
    ldx    #1                    ; 2
    bit    $B3                   ; 3
    bmi    LF29A                 ; 2³
    bcc    LF29C                 ; 2³
    tya                          ; 2
    bmi    LF29C                 ; 2³
    inx                          ; 2
LF29A:
    stx    AUDC0                 ; 3
LF29C:
    sty    $B5                   ; 3
    tya                          ; 2
    inc    $B4                   ; 5
    asl                          ; 2
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    and    #$03                  ; 2
    tay                          ; 2
    lda    $B4                   ; 3
    ldx    $B3                   ; 3
    bmi    LF2BE                 ; 2³
    cpx    #4                    ; 2
    bcs    LF2BA                 ; 2³
    bit    INPT4                 ; 3
    bmi    LF2BC                 ; 2³
    ldx    #$24                  ; 2
    lsr    $EB                   ; 5
LF2BA:
    and    $EB                   ; 3
LF2BC:
    and    #$07                  ; 2
LF2BE:
    asl                          ; 2
    bne    LF2D7                 ; 2³
    cpx    #$14                  ; 2
    beq    LF2D0                 ; 2³
    cpx    #$18                  ; 2
    bne    LF2D2                 ; 2³
    bit    SWCHB                 ; 4
    bvc    LF2D2                 ; 2³
    ldx    #$10                  ; 2
LF2D0:
    rol    $EB                   ; 5
LF2D2:
    dex                          ; 2
    bpl    LF2D7                 ; 2³
    ldx    #3                    ; 2
LF2D7:
    stx    $B3                   ; 3
    bpl    LF2DD                 ; 2³
    ldy    #4                    ; 2
LF2DD:
    lda    LF5F6,Y               ; 4
    sta    $8F                   ; 3
    lda    LF7AB,Y               ; 4
    sta    $8B                   ; 3
    lda    #$13                  ; 2
    ldy    #$C7                  ; 2
    inx                          ; 2
    bne    LF2F3                 ; 2³
    lda    $B4                   ; 3
    lsr                          ; 2
    ldy    #$C3                  ; 2
LF2F3:
    sta    AUDF0                 ; 3
    lda    LF5F1,X               ; 4
    cpx    #5                    ; 2
    bcc    LF30B                 ; 2³+1
    txa                          ; 2
    sbc    #5                    ; 2
    cmp    #$10                  ; 2
    bcc    LF305                 ; 2³
    eor    #$1F                  ; 2
LF305:
    clc                          ; 2
    adc    #$C7                  ; 2
    tay                          ; 2
    lda    #$1F                  ; 2
LF30B:
    sty    $8D                   ; 3
    ldx    #2                    ; 2
    jsr    LF5BD                 ; 6
    jsr    LF7E4                 ; 6
    ldx    #5                    ; 2
LF317:
    ldy    $A7,X                 ; 4
    lda    $AD,X                 ; 4
    bpl    LF334                 ; 2³
    inc    $D0,X                 ; 6
    sec                          ; 2
    lda    #$30                  ; 2
    sbc    $A1,X                 ; 4
    bcc    LF32E                 ; 2³
    sbc    $AD,X                 ; 4
    cmp    $D0,X                 ; 4
    lda    #$F7                  ; 2
    bcs    LF35C                 ; 2³
LF32E:
    lda    $AD,X                 ; 4
    sbc    #$9C                  ; 2
    sta    $AD,X                 ; 4
LF334:
    cpy    #3                    ; 2
    bcs    LF33F                 ; 2³
    lda    LF7FD,Y               ; 4
    bit    $EA                   ; 3
    beq    LF34B                 ; 2³
LF33F:
    lda    $E2                   ; 3
    bcs    LF346                 ; 2³
    cmp    #$80                  ; 2
    ror                          ; 2
LF346:
    clc                          ; 2
    adc    $D0,X                 ; 4
    sta    $D0,X                 ; 4
LF34B:
    lda    LF6D8,Y               ; 4
    eor    #$F8                  ; 2
    bpl    LF362                 ; 2³
    bit    $EA                   ; 3
    beq    LF364                 ; 2³
    lda    $E2                   ; 3
    and    #$3E                  ; 2
    asl                          ; 2
    asl                          ; 2
LF35C:
    adc    $E3,X                 ; 4
    bpl    LF362                 ; 2³
    lda    #$18                  ; 2
LF362:
    sta    $E3,X                 ; 4
LF364:
    lda    $BB                   ; 3
    and    $BA                   ; 3
    eor    LF5FB,Y               ; 4
    and    $E9                   ; 3
    sta    $DC,X                 ; 4
    lda    #$FF                  ; 2
    jsr    LF585                 ; 6
    bcs    LF3EA                 ; 2³
    cpy    #4                    ; 2
    bcc    LF38E                 ; 2³
    lda    #4                    ; 2
    cmp    $A7,X                 ; 4
    beq    LF38E                 ; 2³
    sta    AUDC1                 ; 3
    lda    #$FF                  ; 2
    dec    $BE                   ; 5
    bpl    LF38A                 ; 2³
    inc    $BE                   ; 5
LF38A:
    bne    LF38E                 ; 2³
    sta    $9A                   ; 3
LF38E:
    ldy    $9B,X                 ; 4
    bne    LF3EA                 ; 2³
    sty    $E3,X                 ; 4
    lda    $AD,X                 ; 4
    sec                          ; 2
    sbc    #$0C                  ; 2
    bpl    LF39C                 ; 2³
    tya                          ; 2
LF39C:
    sta    $AD,X                 ; 4
    inc    $C1,X                 ; 6
    lda    $99                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lda    $C1,X                 ; 4
    bcc    LF3AA                 ; 2³
    eor    $C9                   ; 3
LF3AA:
    pha                          ; 3
    and    #$03                  ; 2
    tay                          ; 2
    pla                          ; 4
    php                          ; 3
    lsr                          ; 2
    lsr                          ; 2
    plp                          ; 4
    and    #$07                  ; 2
    beq    LF3BB                 ; 2³
    eor    #$07                  ; 2
    bne    LF3C1                 ; 2³
LF3BB:
    tay                          ; 2
    inc    $A1,X                 ; 6
    bcc    LF3E2                 ; 2³
    dey                          ; 2
LF3C1:
    eor    #$07                  ; 2
    cpy    #3                    ; 2
    bcc    LF3E2                 ; 2³
    lda    $99                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lda    $C7                   ; 3
    bcc    LF3D8                 ; 2³
    sta    $C9                   ; 3
    asl                          ; 2
    eor    $C7                   ; 3
    asl                          ; 2
    asl                          ; 2
    rol    $C7                   ; 5
LF3D8:
    asl                          ; 2
    ldy    #3                    ; 2
    rol    $C7                   ; 5
    bmi    LF3E0                 ; 2³
    iny                          ; 2
LF3E0:
    lda    #7                    ; 2
LF3E2:
    sta    $9B,X                 ; 4
    sty    $A7,X                 ; 4
    lda    #$9F                  ; 2
    sta    $D0,X                 ; 4
LF3EA:
    lda    $D0,X                 ; 4
    cmp    #$A0                  ; 2
    ldy    $9B,X                 ; 4
    bcs    LF3F6                 ; 2³
    bne    LF3F8                 ; 2³
    sty    $A7,X                 ; 4
LF3F6:
    lda    #$9F                  ; 2
LF3F8:
    jsr    LF5BD                 ; 6
    sty    $D6,X                 ; 4
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ldy    $9B,X                 ; 4
    ora    LF7A3,Y               ; 4
    and    $96                   ; 3
    sta    $CA,X                 ; 4
    lda    $D6,X                 ; 4
    sbc    #5                    ; 2
    eor    #$80                  ; 2
    bpl    LF414                 ; 2³
    sta    $D6,X                 ; 4
LF414:
    ldy    $E3,X                 ; 4
    lda    LF607,Y               ; 4
    sta    $EC,X                 ; 4
    lda    LF637,Y               ; 4
    sta    $F2,X                 ; 4
    dex                          ; 2
    bmi    LF426                 ; 2³
    jmp    LF317                 ; 3
LF426:
    lda    $BE                   ; 3
    jsr    LF011                 ; 6
LF42B:
    ldy    INTIM                 ; 4
    bne    LF42B                 ; 2³
    sta    WSYNC                 ; 3
    sty    VBLANK                ; 3
    sty    COLUPF                ; 3
    ldy    #$A5                  ; 2
LF438:
    lda    $B6,X                 ; 4
    lsr                          ; 2
    jsr    LF018                 ; 6
    lda    $B8,X                 ; 4
    jsr    LF015                 ; 6
    bpl    LF438                 ; 2³
    jsr    LF7B0                 ; 6
    jsr    LF15B                 ; 6
    ldy    #1                    ; 2
    jsr    LF7E4                 ; 6
    lda    #$83                  ; 2
    sbc    $B6                   ; 3
    tay                          ; 2
    stx    NUSIZ0                ; 3
    lda    #$0A                  ; 2
    sbc    $C0                   ; 3
    tax                          ; 2
    sta    HMCLR                 ; 3
    jsr    LF038                 ; 6
    stx    VDELP1                ; 3
    lda    #7                    ; 2
    sta    $98                   ; 3
    ldy    #4                    ; 2
    jsr    LF7E4                 ; 6
    inx                          ; 2
    stx    NUSIZ1                ; 3
    ldy    #5                    ; 2
    lda    #$1E                  ; 2
    jsr    LF7E4                 ; 6
    sta    $F8                   ; 3
    ldx    #$0A                  ; 2
    stx    AUDV1                 ; 3
    lda    #$70                  ; 2
    ldy    #$F6                  ; 2
LF480:
    sty    $80,X                 ; 4
    sty    $8A,X                 ; 4
    dex                          ; 2
    sta    $80,X                 ; 4
    sbc    #8                    ; 2
    dex                          ; 2
    bne    LF480                 ; 2³
    stx    AUDC1                 ; 3
    lda    $C8                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    LF6F0,Y               ; 4
    sta    $89                   ; 3
    jsr    LF7B0                 ; 6
    ldx    #$1C                  ; 2
    stx    HMP0                  ; 3
    stx    HMP1                  ; 3
    inc    $8C                   ; 5
    inc    $90                   ; 5
    lda    #$23                  ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    VBLANK                ; 3
    sta    TIM64T                ; 4
    sec                          ; 2
    lda    $B8                   ; 3
    sbc    $B9                   ; 3
    lda    $BC                   ; 3
    sbc    $BD                   ; 3
    beq    LF4D0                 ; 2³
    lda    $80                   ; 3
    lsr                          ; 2
    sed                          ; 2
    tya                          ; 2
    adc    $B8                   ; 3
    sta    $B8                   ; 3
    and    #$01                  ; 2
    bne    LF4CA                 ; 2³
    stx    AUDC1                 ; 3
LF4CA:
    tya                          ; 2
    adc    $BC                   ; 3
    sta    $BC                   ; 3
    cld                          ; 2
LF4D0:
    ldx    #$FF                  ; 2
    lda    $B3                   ; 3
    sec                          ; 2
    sbc    #$14                  ; 2
    cmp    #$0E                  ; 2
    bcs    LF52D                 ; 2³+1
    tay                          ; 2
    adc    #$0A                  ; 2
    sbc    $C0                   ; 3
    adc    $B6                   ; 3
LF4E2:
    inx                          ; 2
    sbc    #$14                  ; 2
    bpl    LF4E2                 ; 2³
    lda    $9B,X                 ; 4
    beq    LF52D                 ; 2³+1
    lda    $A7,X                 ; 4
    cmp    #4                    ; 2
    bcs    LF52D                 ; 2³+1
    lda    $DC,X                 ; 4
    asl                          ; 2
    bpl    LF52D                 ; 2³+1
    tya                          ; 2
    eor    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$2A                  ; 2
    jsr    LF585                 ; 6
    bcs    LF52D                 ; 2³
    lda    #$28                  ; 2
    sbc    $B3                   ; 3
    sta    $B3                   ; 3
    ldy    $A7,X                 ; 4
    sty    $DC,X                 ; 4
    lda    LF6F8,Y               ; 4
    sed                          ; 2
    adc    $B9                   ; 3
    sta    $B9                   ; 3
    bcc    LF52C                 ; 2³
    lda    #0                    ; 2
    adc    $BD                   ; 3
    sta    $BD                   ; 3
    bcc    LF520                 ; 2³
    inc    $C8                   ; 5
LF520:
    and    #$0F                  ; 2
    bne    LF52C                 ; 2³
    lda    $BE                   ; 3
    cmp    #9                    ; 2
    bcs    LF52C                 ; 2³
    inc    $BE                   ; 5
LF52C:
    cld                          ; 2
LF52D:
    ldx    #5                    ; 2
    lda    $B6                   ; 3
    clc                          ; 2
    adc    #$7C                  ; 2
    sbc    $C0                   ; 3
LF536:
    clc                          ; 2
    adc    #$14                  ; 2
    tay                          ; 2
    cmp    #$E1                  ; 2
    ror                          ; 2
    and    $DC,X                 ; 4
    bpl    LF553                 ; 2³
    lda    $A7,X                 ; 4
    cmp    #3                    ; 2
    bcs    LF575                 ; 2³
    lda    $AD,X                 ; 4
    bmi    LF553                 ; 2³
    adc    #$A0                  ; 2
    bcc    LF551                 ; 2³
    lda    #$FF                  ; 2
LF551:
    sta    $AD,X                 ; 4
LF553:
    tya                          ; 2
    dex                          ; 2
    bpl    LF536                 ; 2³
    lda    $99                   ; 3
    lsr                          ; 2
    bcc    LF572                 ; 2³
    lda    $B5                   ; 3
    ora    $9A                   ; 3
    and    #$3C                  ; 2
    bne    LF572                 ; 2³
LF564:
    eor    $B7                   ; 3
    sta    $B7                   ; 3
    adc    $C0                   ; 3
    sta    $C0                   ; 3
    cmp    #$0A                  ; 2
    lda    #$FE                  ; 2
    bcs    LF564                 ; 2³
LF572:
    jmp    LF1B5                 ; 3
LF575:
    beq    LF57B                 ; 2³
    cpy    #$EB                  ; 2
    bcc    LF553                 ; 2³
LF57B:
    lda    #$E1                  ; 2
    sta    $B4                   ; 3
    lda    #$FF                  ; 2
    sta    $B3                   ; 3
    bne    LF553                 ; 2³
LF585:
    sec                          ; 2
    sbc    $D0,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LF5ED,Y               ; 4
    cpy    #4                    ; 2
    bcc    LF597                 ; 2³
    bne    LF5BC                 ; 2³
    dey                          ; 2
LF597:
    sty    $95                   ; 3
    ldy    $9B,X                 ; 4
    and    LF5E6,Y               ; 4
    sec                          ; 2
    beq    LF5BC                 ; 2³
    lda    $95                   ; 3
    bne    LF5AF                 ; 2³
    lda    LF5E6,Y               ; 4
    clc                          ; 2
    and    #$70                  ; 2
    adc    $D0,X                 ; 4
    sta    $D0,X                 ; 4
LF5AF:
    tya                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    $95                   ; 3
    tay                          ; 2
    lda    LF6A7,Y               ; 4
    and    #$07                  ; 2
    sta    $9B,X                 ; 4
LF5BC:
    rts                          ; 6

LF5BD:
    tay                          ; 2
    cpy    #$60                  ; 2
    rol                          ; 2
    cpy    #$80                  ; 2
    rol                          ; 2
    cpy    #$90                  ; 2
    rol                          ; 2
    ora    #$F8                  ; 2
    eor    #$07                  ; 2
    sta    $96                   ; 3
    iny                          ; 2
    tya                          ; 2
    and    #$0F                  ; 2
    sta    $95                   ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc    $95                   ; 3
    cmp    #$0F                  ; 2
    bcc    LF5E3                 ; 2³
    sbc    #$0F                  ; 2
    iny                          ; 2
LF5E3:
    eor    #$07                  ; 2
    rts                          ; 6

LF5E6:
    .byte $01 ; |       X| $F5E6
    .byte $01 ; |       X| $F5E7
    .byte $13 ; |   X  XX| $F5E8
    .byte $25 ; |  X  X X| $F5E9
    .byte $17 ; |   X XXX| $F5EA
    .byte $49 ; | X  X  X| $F5EB
    .byte $2D ; |  X XX X| $F5EC
LF5ED:
    .byte $01 ; |       X| $F5ED
    .byte $02 ; |      X | $F5EE
    .byte $04 ; |     X  | $F5EF
    .byte $00 ; |        | $F5F0
LF5F1:
    .byte $08 ; |    X   | $F5F1
    .byte $21 ; |  X    X| $F5F2
    .byte $1F ; |   XXXXX| $F5F3
    .byte $1A ; |   XX X | $F5F4
    .byte $1F ; |   XXXXX| $F5F5
LF5F6:
    .byte $1A ; |   XX X | $F5F6
    .byte $00 ; |        | $F5F7
    .byte $00 ; |        | $F5F8
    .byte $00 ; |        | $F5F9
    .byte $34 ; |  XX X  | $F5FA
LF5FB:
    .byte $2E ; |  X XXX | $F5FB
    .byte $2A ; |  X X X | $F5FC
    .byte $22 ; |  X   X | $F5FD
    .byte $00 ; |        | $F5FE
    .byte $0E ; |    XXX | $F5FF
    .byte $3C ; |  XXXX  | $F600
    .byte $66 ; | XX  XX | $F601
    .byte $66 ; | XX  XX | $F602
    .byte $66 ; | XX  XX | $F603
    .byte $66 ; | XX  XX | $F604
    .byte $66 ; | XX  XX | $F605
    .byte $3C ; |  XXXX  | $F606
LF607:
    .byte $8B ; |X   X XX| $F607
    .byte $7E ; | XXXXXX | $F608
    .byte $18 ; |   XX   | $F609
    .byte $18 ; |   XX   | $F60A
    .byte $18 ; |   XX   | $F60B
    .byte $18 ; |   XX   | $F60C
    .byte $78 ; | XXXX   | $F60D
    .byte $38 ; |  XXX   | $F60E
    .byte $7D ; | XXXXX X| $F60F
    .byte $7E ; | XXXXXX | $F610
    .byte $60 ; | XX     | $F611
    .byte $60 ; | XX     | $F612
    .byte $3C ; |  XXXX  | $F613
    .byte $06 ; |     XX | $F614
    .byte $46 ; | X   XX | $F615
    .byte $7C ; | XXXXX  | $F616
    .byte $6E ; | XX XXX | $F617
    .byte $3C ; |  XXXX  | $F618
    .byte $46 ; | X   XX | $F619
    .byte $06 ; |     XX | $F61A
    .byte $0C ; |    XX  | $F61B
    .byte $06 ; |     XX | $F61C
    .byte $46 ; | X   XX | $F61D
    .byte $3C ; |  XXXX  | $F61E
    .byte $7D ; | XXXXX X| $F61F
    .byte $0C ; |    XX  | $F620
    .byte $0C ; |    XX  | $F621
    .byte $7E ; | XXXXXX | $F622
    .byte $4C ; | X  XX  | $F623
    .byte $2C ; |  X XX  | $F624
    .byte $1C ; |   XXX  | $F625
    .byte $0C ; |    XX  | $F626
    .byte $7D ; | XXXXX X| $F627
    .byte $7C ; | XXXXX  | $F628
    .byte $46 ; | X   XX | $F629
    .byte $06 ; |     XX | $F62A
    .byte $7C ; | XXXXX  | $F62B
    .byte $60 ; | XX     | $F62C
    .byte $60 ; | XX     | $F62D
    .byte $7E ; | XXXXXX | $F62E
    .byte $9B ; |X  XX XX| $F62F
    .byte $3C ; |  XXXX  | $F630
    .byte $66 ; | XX  XX | $F631
    .byte $66 ; | XX  XX | $F632
    .byte $7C ; | XXXXX  | $F633
    .byte $60 ; | XX     | $F634
    .byte $62 ; | XX   X | $F635
    .byte $3C ; |  XXXX  | $F636
LF637:
    .byte $AC ; |X X XX  | $F637
    .byte $18 ; |   XX   | $F638
    .byte $18 ; |   XX   | $F639
    .byte $18 ; |   XX   | $F63A
    .byte $0C ; |    XX  | $F63B
    .byte $06 ; |     XX | $F63C
    .byte $42 ; | X    X | $F63D
    .byte $7E ; | XXXXXX | $F63E
    .byte $C9 ; |XX  X  X| $F63F
    .byte $3C ; |  XXXX  | $F640
    .byte $66 ; | XX  XX | $F641
    .byte $66 ; | XX  XX | $F642
    .byte $3C ; |  XXXX  | $F643
    .byte $66 ; | XX  XX | $F644
    .byte $66 ; | XX  XX | $F645
    .byte $3C ; |  XXXX  | $F646
    .byte $C9 ; |XX  X  X| $F647
    .byte $3C ; |  XXXX  | $F648
    .byte $46 ; | X   XX | $F649
    .byte $06 ; |     XX | $F64A
    .byte $3E ; |  XXXXX | $F64B
    .byte $66 ; | XX  XX | $F64C
    .byte $66 ; | XX  XX | $F64D
    .byte $3C ; |  XXXX  | $F64E

  IF ACTIVISION

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;          XXXXXXXX    XXXXXXX
;       X     X   X   XX
;      XXX XX X X X  XX  XXX X XXX X  X
;      X X X  X X X XX X X   X X X XX X
;      XXX X  X X XXX  X XXX X X X XXXX
;      X X X  X X XX   X   X X X X X XX
;      X X XX X X X    X XXX X XXX X  X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $C9 ; |XX  X  X| $F64F
    .byte $E9 ; |XXX X  X| $F650
    .byte $AB ; |X X X XX| $F651
    .byte $AF ; |X X XXXX| $F652
    .byte $AD ; |X X XX X| $F653
    .byte $E9 ; |XXX X  X| $F654
    .byte $00 ; |        | $F655
    .byte $00 ; |        | $F656

    .byte $BA ; |X XXX X | $F657
    .byte $BA ; |X XXX X | $F658
    .byte $8A ; |X   X X | $F659
    .byte $BA ; |X XXX X | $F65A
    .byte $A2 ; |X X   X | $F65B
    .byte $3A ; |  XXX X | $F65C
    .byte $80 ; |X       | $F65D
    .byte $FE ; |XXXXXXX | $F65E

    .byte $A4 ; |X X  X  | $F65F
    .byte $50 ; | X X    | $F660
    .byte $58 ; | X XX   | $F661
    .byte $5C ; | X XXX  | $F662
    .byte $56 ; | X X XX | $F663
    .byte $53 ; | X X  XX| $F664
    .byte $11 ; |   X   X| $F665
    .byte $F0 ; |XXXX    | $F666

    .byte $00 ; |        | $F667
    .byte $AD ; |X X XX X| $F668
    .byte $A9 ; |X X X  X| $F669
    .byte $E9 ; |XXX X  X| $F66A
    .byte $A9 ; |X X X  X| $F66B
    .byte $ED ; |XXX XX X| $F66C
    .byte $41 ; | X     X| $F66D
    .byte $0F ; |    XXXX| $F66E

  ELSE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      XXXX XXXX XX  X XXXX X      XXXX
;      X    X  X XX  X X  X X         X
;      X    X  X X X X X  X X         X
;      X    XXXX X X X XXXX X      XXXX
;      X    X  X X  XX X  X X         X
;      X    X  X X  XX X  X X         X
;      XXXX X  X X   X X  X XXXX   XXXX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $C9 ; |XX  X  X| $F64F   byte is unchanged and it's used, but not for the logo...
    .byte $8F ; |X   XXXX| $F650
    .byte $01 ; |       X| $F651
    .byte $01 ; |       X| $F652
    .byte $0F ; |    XXXX| $F653
    .byte $01 ; |       X| $F654
    .byte $01 ; |       X| $F655
    .byte $0F ; |    XXXX| $F656

    .byte $BA ; |X XXX X | $F657   byte is unchanged and it's used, but not for the logo...
    .byte $97 ; |X  X XXX| $F658
    .byte $94 ; |X  X X  | $F659
    .byte $94 ; |X  X X  | $F65A
    .byte $F4 ; |XXXX X  | $F65B
    .byte $94 ; |X  X X  | $F65C
    .byte $94 ; |X  X X  | $F65D
    .byte $F4 ; |XXXX X  | $F65E

    .byte $A4 ; |X X  X  | $F65F   byte is unchanged and it's used, but not for the logo...
    .byte $A2 ; |X X   X | $F660
    .byte $A6 ; |X X  XX | $F661
    .byte $A6 ; |X X  XX | $F662
    .byte $AA ; |X X X X | $F663
    .byte $AA ; |X X X X | $F664
    .byte $B2 ; |X XX  X | $F665
    .byte $B2 ; |X XX  X | $F666

    .byte $00 ; |        | $F667   byte is unchanged and it's used, but not for the logo...
    .byte $F4 ; |XXXX X  | $F668
    .byte $84 ; |X    X  | $F669
    .byte $84 ; |X    X  | $F66A
    .byte $87 ; |X    XXX| $F66B
    .byte $84 ; |X    X  | $F66C
    .byte $84 ; |X    X  | $F66D
    .byte $F7 ; |XXXX XXX| $F66E
  ENDIF

    .byte $0C ; |    XX  | $F66F
    .byte $28 ; |  X X   | $F670
    .byte $54 ; | X X X  | $F671
    .byte $AC ; |X X XX  | $F672
    .byte $AA ; |X X X X | $F673
    .byte $FE ; |XXXXXXX | $F674
    .byte $7F ; | XXXXXXX| $F675
    .byte $7E ; | XXXXXX | $F676
    .byte $7E ; | XXXXXX | $F677
    .byte $FD ; |XXXXXX X| $F678
    .byte $7F ; | XXXXXXX| $F679
    .byte $1C ; |   XXX  | $F67A
    .byte $18 ; |   XX   | $F67B
    .byte $24 ; |  X  X  | $F67C
    .byte $00 ; |        | $F67D
    .byte $15 ; |   X X X| $F67E
    .byte $A5 ; |X X  X X| $F67F
    .byte $A5 ; |X X  X X| $F680
    .byte $A5 ; |X X  X X| $F681
    .byte $AA ; |X X X X | $F682
    .byte $FE ; |XXXXXXX | $F683
    .byte $BF ; |X XXXXXX| $F684
    .byte $FE ; |XXXXXXX | $F685
    .byte $7C ; | XXXXX  | $F686
    .byte $FA ; |XXXXX X | $F687
    .byte $7E ; | XXXXXX | $F688
    .byte $38 ; |  XXX   | $F689
    .byte $30 ; |  XX    | $F68A
    .byte $48 ; | X  X   | $F68B
    .byte $00 ; |        | $F68C
    .byte $A0 ; |X X     | $F68D
    .byte $85 ; |X    X X| $F68E
    .byte $A2 ; |X X   X | $F68F
    .byte $A5 ; |X X  X X| $F690
    .byte $AA ; |X X X X | $F691
    .byte $FE ; |XXXXXXX | $F692
    .byte $7F ; | XXXXXXX| $F693
    .byte $BF ; |X XXXXXX| $F694
    .byte $F8 ; |XXXXX   | $F695
    .byte $FA ; |XXXXX X | $F696
    .byte $3F ; |  XXXXXX| $F697
    .byte $0E ; |    XXX | $F698
    .byte $0C ; |    XX  | $F699
    .byte $12 ; |   X  X | $F69A
    .byte $00 ; |        | $F69B
    .byte $03 ; |      XX| $F69C
    .byte $05 ; |     X X| $F69D
    .byte $0E ; |    XXX | $F69E
    .byte $1E ; |   XXXX | $F69F
    .byte $3C ; |  XXXX  | $F6A0
    .byte $54 ; | X X X  | $F6A1
    .byte $BA ; |X XXX X | $F6A2
    .byte $82 ; |X     X | $F6A3
    .byte $44 ; | X   X  | $F6A4
    .byte $00 ; |        | $F6A5
    .byte $00 ; |        | $F6A6
LF6A7:
    .byte $00 ; |        | $F6A7
    .byte $00 ; |        | $F6A8
    .byte $00 ; |        | $F6A9
    .byte $00 ; |        | $F6AA
    .byte $00 ; |        | $F6AB
    .byte $00 ; |        | $F6AC
    .byte $00 ; |        | $F6AD
    .byte $30 ; |  XX    | $F6AE
    .byte $E1 ; |XXX    X| $F6AF
    .byte $11 ; |   X   X| $F6B0
    .byte $00 ; |        | $F6B1
    .byte $00 ; |        | $F6B2
    .byte $E1 ; |XXX    X| $F6B3
    .byte $00 ; |        | $F6B4
    .byte $31 ; |  XX   X| $F6B5
    .byte $10 ; |   X    | $F6B6
    .byte $02 ; |      X | $F6B7
    .byte $03 ; |      XX| $F6B8
    .byte $02 ; |      X | $F6B9
    .byte $00 ; |        | $F6BA
    .byte $E1 ; |XXX    X| $F6BB
    .byte $00 ; |        | $F6BC
    .byte $00 ; |        | $F6BD
    .byte $01 ; |       X| $F6BE
    .byte $03 ; |      XX| $F6BF
    .byte $20 ; |  X     | $F6C0
    .byte $F5 ; |XXXX X X| $F6C1
    .byte $F3 ; |XXXX  XX| $F6C2
    .byte $E0 ; |XXX     | $F6C3
    .byte $F0 ; |XXXX    | $F6C4
    .byte $F0 ; |XXXX    | $F6C5
    .byte $00 ; |        | $F6C6
    .byte $00 ; |        | $F6C7
    .byte $20 ; |  X     | $F6C8
    .byte $00 ; |        | $F6C9
    .byte $20 ; |  X     | $F6CA
    .byte $00 ; |        | $F6CB
    .byte $00 ; |        | $F6CC
    .byte $00 ; |        | $F6CD
    .byte $00 ; |        | $F6CE
    .byte $E0 ; |XXX     | $F6CF
    .byte $10 ; |   X    | $F6D0
    .byte $10 ; |   X    | $F6D1
    .byte $20 ; |  X     | $F6D2
    .byte $10 ; |   X    | $F6D3
    .byte $10 ; |   X    | $F6D4
    .byte $00 ; |        | $F6D5
    .byte $00 ; |        | $F6D6
    .byte $90 ; |X  X    | $F6D7
LF6D8:
    .byte $38 ; |  XXX   | $F6D8
    .byte $18 ; |   XX   | $F6D9
    .byte $08 ; |    X   | $F6DA
    .byte $D8 ; |XX XX   | $F6DB
    .byte $D0 ; |XX X    | $F6DC
    .byte $42 ; | X    X | $F6DD
    .byte $B2 ; |X XX  X | $F6DE
    .byte $22 ; |  X   X | $F6DF
    .byte $C2 ; |XX    X | $F6E0
    .byte $C2 ; |XX    X | $F6E1
    .byte $C2 ; |XX    X | $F6E2
    .byte $C2 ; |XX    X | $F6E3
    .byte $C2 ; |XX    X | $F6E4
    .byte $C2 ; |XX    X | $F6E5
    .byte $C2 ; |XX    X | $F6E6
    .byte $C2 ; |XX    X | $F6E7
    .byte $C2 ; |XX    X | $F6E8
    .byte $C2 ; |XX    X | $F6E9
    .byte $C2 ; |XX    X | $F6EA
    .byte $C2 ; |XX    X | $F6EB
    .byte $C2 ; |XX    X | $F6EC
    .byte $C2 ; |XX    X | $F6ED
    .byte $C2 ; |XX    X | $F6EE
    .byte $C2 ; |XX    X | $F6EF
LF6F0:
    .byte $A5 ; |X X  X X| $F6F0
    .byte $95 ; |X  X X X| $F6F1
    .byte $10 ; |   X    | $F6F2
    .byte $18 ; |   XX   | $F6F3
    .byte $20 ; |  X     | $F6F4
    .byte $28 ; |  X X   | $F6F5
    .byte $30 ; |  XX    | $F6F6
    .byte $38 ; |  XXX   | $F6F7
LF6F8:
    .byte $24 ; |  X  X  | $F6F8
    .byte $14 ; |   X X  | $F6F9
    .byte $02 ; |      X | $F6FA
LF6FB:
    .byte $99 ; |X  XX  X| $F6FB
    .byte $2C ; |  X XX  | $F6FC
    .byte $8C ; |X   XX  | $F6FD
    .byte $0C ; |    XX  | $F6FE
    .byte $D6 ; |XX X XX | $F6FF
    .byte $00 ; |        | $F700
    .byte $A0 ; |X X     | $F701
    .byte $05 ; |     X X| $F702
    .byte $A0 ; |X X     | $F703
    .byte $05 ; |     X X| $F704
    .byte $A0 ; |X X     | $F705
    .byte $05 ; |     X X| $F706
    .byte $A0 ; |X X     | $F707
    .byte $A5 ; |X X  X X| $F708
    .byte $FF ; |XXXXXXXX| $F709
    .byte $FF ; |XXXXXXXX| $F70A
    .byte $FE ; |XXXXXXX | $F70B
    .byte $FE ; |XXXXXXX | $F70C
    .byte $FE ; |XXXXXXX | $F70D
    .byte $7F ; | XXXXXXX| $F70E
    .byte $FF ; |XXXXXXXX| $F70F
    .byte $5D ; | X XXX X| $F710
    .byte $FF ; |XXXXXXXX| $F711
    .byte $DE ; |XX XXXX | $F712
    .byte $DC ; |XX XXX  | $F713
    .byte $D8 ; |XX XX   | $F714
    .byte $E0 ; |XXX     | $F715
    .byte $28 ; |  X X   | $F716
    .byte $63 ; | XX   XX| $F717
    .byte $F1 ; |XXXX   X| $F718
    .byte $18 ; |   XX   | $F719
    .byte $00 ; |        | $F71A
    .byte $0A ; |    X X | $F71B
    .byte $28 ; |  X X   | $F71C
    .byte $10 ; |   X    | $F71D
    .byte $14 ; |   X X  | $F71E
    .byte $28 ; |  X X   | $F71F
    .byte $0A ; |    X X | $F720
    .byte $50 ; | X X    | $F721
    .byte $A5 ; |X X  X X| $F722
    .byte $FF ; |XXXXXXXX| $F723
    .byte $FF ; |XXXXXXXX| $F724
    .byte $FE ; |XXXXXXX | $F725
    .byte $FE ; |XXXXXXX | $F726
    .byte $FE ; |XXXXXXX | $F727
    .byte $7F ; | XXXXXXX| $F728
    .byte $FF ; |XXXXXXXX| $F729
    .byte $5D ; | X XXX X| $F72A
    .byte $FF ; |XXXXXXXX| $F72B
    .byte $DE ; |XX XXXX | $F72C
    .byte $DC ; |XX XXX  | $F72D
    .byte $D8 ; |XX XX   | $F72E
    .byte $E0 ; |XXX     | $F72F
    .byte $28 ; |  X X   | $F730
    .byte $63 ; | XX   XX| $F731
    .byte $F1 ; |XXXX   X| $F732
    .byte $18 ; |   XX   | $F733
    .byte $61 ; | XX    X| $F734
    .byte $C3 ; |XX    XX| $F735
    .byte $C3 ; |XX    XX| $F736
    .byte $E3 ; |XXX   XX| $F737
    .byte $E7 ; |XXX  XXX| $F738
    .byte $F7 ; |XXXX XXX| $F739
    .byte $FF ; |XXXXXXXX| $F73A
    .byte $FF ; |XXXXXXXX| $F73B
    .byte $3D ; |  XXXX X| $F73C
    .byte $3D ; |  XXXX X| $F73D
    .byte $3D ; |  XXXX X| $F73E
    .byte $3D ; |  XXXX X| $F73F
    .byte $3F ; |  XXXXXX| $F740
    .byte $3E ; |  XXXXX | $F741
    .byte $1E ; |   XXXX | $F742
    .byte $0F ; |    XXXX| $F743
    .byte $3F ; |  XXXXXX| $F744
    .byte $5D ; | X XXX X| $F745
    .byte $FF ; |XXXXXXXX| $F746
    .byte $DE ; |XX XXXX | $F747
    .byte $FC ; |XXXXXX  | $F748
    .byte $D8 ; |XX XX   | $F749
    .byte $2F ; |  X XXXX| $F74A
    .byte $66 ; | XX  XX | $F74B
    .byte $66 ; | XX  XX | $F74C
    .byte $26 ; |  X  XX | $F74D
    .byte $75 ; | XXX X X| $F74E
    .byte $A5 ; |X X  X X| $F74F
    .byte $55 ; | X X X X| $F750
    .byte $C5 ; |XX   X X| $F751
    .byte $35 ; |  XX X X| $F752
    .byte $E5 ; |XXX  X X| $F753
    .byte $15 ; |   X X X| $F754
    .byte $05 ; |     X X| $F755
    .byte $05 ; |     X X| $F756
    .byte $05 ; |     X X| $F757
    .byte $05 ; |     X X| $F758
    .byte $15 ; |   X X X| $F759
    .byte $F5 ; |XXXX X X| $F75A
    .byte $55 ; | X X X X| $F75B
    .byte $15 ; |   X X X| $F75C
    .byte $15 ; |   X X X| $F75D
    .byte $15 ; |   X X X| $F75E
    .byte $15 ; |   X X X| $F75F
    .byte $15 ; |   X X X| $F760
    .byte $05 ; |     X X| $F761
    .byte $D5 ; |XX X X X| $F762
    .byte $45 ; | X   X X| $F763
    .byte $00 ; |        | $F764
    .byte $E0 ; |XXX     | $F765
    .byte $00 ; |        | $F766
    .byte $E5 ; |XXX  X X| $F767
    .byte $25 ; |  X  X X| $F768
    .byte $F5 ; |XXXX X X| $F769
    .byte $05 ; |     X X| $F76A
    .byte $05 ; |     X X| $F76B
    .byte $F5 ; |XXXX X X| $F76C
    .byte $05 ; |     X X| $F76D
    .byte $05 ; |     X X| $F76E
    .byte $05 ; |     X X| $F76F
    .byte $05 ; |     X X| $F770
    .byte $05 ; |     X X| $F771
    .byte $15 ; |   X X X| $F772
    .byte $F5 ; |XXXX X X| $F773
    .byte $55 ; | X X X X| $F774
    .byte $15 ; |   X X X| $F775
    .byte $15 ; |   X X X| $F776
    .byte $15 ; |   X X X| $F777
    .byte $15 ; |   X X X| $F778
    .byte $15 ; |   X X X| $F779
    .byte $05 ; |     X X| $F77A
    .byte $D5 ; |XX X X X| $F77B
    .byte $45 ; | X   X X| $F77C
    .byte $00 ; |        | $F77D
    .byte $E0 ; |XXX     | $F77E
    .byte $00 ; |        | $F77F
    .byte $F0 ; |XXXX    | $F780
    .byte $F2 ; |XXXX  X | $F781
    .byte $02 ; |      X | $F782
    .byte $F0 ; |XXXX    | $F783
    .byte $00 ; |        | $F784
    .byte $02 ; |      X | $F785
    .byte $B0 ; |X XX    | $F786
    .byte $17 ; |   X XXX| $F787
    .byte $15 ; |   X X X| $F788
    .byte $1D ; |   XXX X| $F789
    .byte $0F ; |    XXXX| $F78A
    .byte $1D ; |   XXX X| $F78B
    .byte $F5 ; |XXXX X X| $F78C
    .byte $F7 ; |XXXX XXX| $F78D
    .byte $55 ; | X X X X| $F78E
    .byte $15 ; |   X X X| $F78F
    .byte $1F ; |   XXXXX| $F790
    .byte $1F ; |   XXXXX| $F791
    .byte $15 ; |   X X X| $F792
    .byte $1F ; |   XXXXX| $F793
    .byte $D7 ; |XX X XXX| $F794
    .byte $00 ; |        | $F795
    .byte $00 ; |        | $F796
    .byte $00 ; |        | $F797
LF798:
    .byte $70 ; | XXX    | $F798
    .byte $03 ; |      XX| $F799
    .byte $40 ; | X      | $F79A
    .byte $03 ; |      XX| $F79B
    .byte $03 ; |      XX| $F79C
    .byte $24 ; |  X  X  | $F79D
    .byte $63 ; | XX   XX| $F79E
    .byte $05 ; |     X X| $F79F
    .byte $44 ; | X   X  | $F7A0
    .byte $25 ; |  X  X X| $F7A1
    .byte $AA ; |X X X X | $F7A2
LF7A3:
    .byte $00 ; |        | $F7A3
    .byte $00 ; |        | $F7A4
    .byte $01 ; |       X| $F7A5
    .byte $02 ; |      X | $F7A6
    .byte $03 ; |      XX| $F7A7
    .byte $04 ; |     X  | $F7A8
    .byte $06 ; |     XX | $F7A9
    .byte $08 ; |    X   | $F7AA
LF7AB:
    .byte $4D ; | X  XX X| $F7AB
    .byte $66 ; | XX  XX | $F7AC
    .byte $4D ; | X  XX X| $F7AD
    .byte $66 ; | XX  XX | $F7AE
    .byte $7F ; | XXXXXXX| $F7AF
LF7B0:
    ldy    #7                    ; 2
LF7B2:
    dey                          ; 2
    lda    ($89),Y               ; 5
    asl                          ; 2
    ldx    $F8                   ; 3
    sta    WSYNC                 ; 3
    stx    COLUP0                ; 3
    sta    GRP0                  ; 3
    lda    ($85),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($83),Y               ; 5
    tax                          ; 2
    txs                          ; 2
    lda    ($87),Y               ; 5
    tax                          ; 2
    lda    ($81),Y               ; 5
    sty    $95                   ; 3
    ldy    $F9                   ; 3
    sty    COLUP0                ; 3
    stx    GRP0                  ; 3
    tsx                          ; 2
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    ldy    $95                   ; 3
    bne    LF7B2                 ; 2³
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    ldx    #$FD                  ; 2
    txs                          ; 2
    rts                          ; 6

LF7E4:
    sta    WSYNC                 ; 3
    sta    HMCLR                 ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0,X                ; 4
LF7EE:
    dey                          ; 2
    bpl    LF7EE                 ; 2³
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    $F8,X                 ; 4
    sta    COLUP0,X              ; 4
    rts                          ; 6

       ORG $F7FC

    .byte $00 ; |        | $F7FC
LF7FD:
    .byte $F0 ; |XXXX    | $F7FD
    .byte $E0 ; |XXX     | $F7FE
    .byte $C0 ; |XX      | $F7FF