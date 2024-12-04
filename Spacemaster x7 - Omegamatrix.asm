; Disassembly of SM_X7.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: ultrastella -pasfcSM_X7.cfg SM_X7.bin
;
; SM_X7.cfg contents:
;
;      ORG F000
;      CODE F000 FBD6
;      GFX FBD7 FD3F
;      CODE FD40 FD6F
;      GFX FD70 FEEF
;      CODE FEF0 FEFF
;      GFX FF00 FFFF

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
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
RESM0   =  $12
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
ENAM0   =  $1D
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
HMM1    =  $23
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXM0P   =  $30
CXM1P   =  $31
CXP0FB  =  $32
CXP1FB  =  $33
CXM0FB  =  $34
CXM1FB  =  $35
CXBLPF  =  $36
CXPPMM  =  $37
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      USER CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $F000

START:
    sei
    cld
    lda    #0
    tax
.loopClear:
    sta    0,X
    inx
    bne    .loopClear
    dex                             ; X=$FF
    txs                             ; reset stack pointer

    lda    INTIM                 ; 4
    sta    $FD                   ; 3
    ror                          ; 2
    ror                          ; 2
    sta    $C2                   ; 3
    stx    $9A                   ; 3
    dex                             ; X=$FE
    stx    $A8                   ; 3
    stx    $BE                   ; 3
    dex                             ; X=$FD
    stx    $B5                   ; 3
    stx    $F8                   ; 3
    stx    $E4                   ; 3
    stx    $E6                   ; 3
    stx    $E8                   ; 3
    stx    $EA                   ; 3
    stx    $EC                   ; 3
    stx    $EE                   ; 3
    dex                             ; X=$FC
    stx    $90                   ; 3
    lda    #$E0                  ; 2
    sta    $C3                   ; 3
    lda    #$80                  ; 2
    sta    $84                   ; 3
    lda    SWCHB                 ; 4
    and    #$08                  ; 2
    sta    $F9                   ; 3

LF03F:
    ldx    #$2A                  ; 2
    lda    #2
    sta    WSYNC
;---------------------------------------
    sta    VBLANK                   ; electron beam turned off...
    sta    VSYNC                    ; Vsync starts
    stx    TIM8T                 ; 4
    ldx    #2                    ; 2
    ldy    #8                    ; 2
LF050:
    lda    $E0,X                 ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    #$80                  ; 2
    sta.wy $E3,Y                 ; 5
    lda    $E0,X                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    ora    #$80                  ; 2
    sta.wy $E5,Y                 ; 5
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    dex                          ; 2
    bpl    LF050                 ; 2³
    ldx    #8                    ; 2
    ldy    #$D0                  ; 2
LF071:
    lda    $E5,X                 ; 4
    cmp    #$80                  ; 2
    bne    LF07D                 ; 2³
    sty    $E5,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LF071                 ; 2³
LF07D:
    ldx    #$2F                  ; 2
LF07F:
    lda    INTIM                 ; 4
    bne    LF07F                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    stx    TIM64T                ; 4
    inc    $FB                   ; 5
    bne    LF099                 ; 2³
    inc    $D0                   ; 5
    inc    $D0                   ; 5
    bne    LF099                 ; 2³
    lda    #1                    ; 2
    sta    $D9                   ; 3
LF099:
    lda    $D9                   ; 3
    beq    LF0A9                 ; 2³
    lda    $FB                   ; 3
    bne    LF0A9                 ; 2³
    inc    $DB                   ; 5
    lda    $DB                   ; 3
    ora    #$08                  ; 2
    sta    $DB                   ; 3
LF0A9:
    lda    SWCHB                 ; 4
    and    #$08                  ; 2
    cmp    $F9                   ; 3
    beq    LF0CD                 ; 2³
    lda    $D9                   ; 3
    beq    LF0BA                 ; 2³
    ora    #$81                  ; 2
    sta    $D9                   ; 3
LF0BA:
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
    sta    AUDV0                 ; 3
    lda    INPT4                 ; 3
    bmi    LF0CA                 ; 2³
    lda    $F9                   ; 3
    eor    #$08                  ; 2
    sta    $F9                   ; 3
LF0CA:
    jmp    LF6BE                 ; 3

LF0CD:
    lda    $D9                   ; 3
    bpl    LF0D5                 ; 2³
    lda    #0                    ; 2
    sta    $D9                   ; 3
LF0D5:
    bne    LF0DB                 ; 2³
    lda    #0                    ; 2
    sta    $DB                   ; 3
LF0DB:
    lda    $84                   ; 3
    bpl    LF0E8                 ; 2³
    dec    $84                   ; 5
    lda    #8                    ; 2
    sta    $82                   ; 3
    jmp    LF0FC                 ; 3

LF0E8:
    lda    $84                   ; 3
    beq    LF0F0                 ; 2³
    lda    INPT4                 ; 3
    bpl    LF0F6                 ; 2³
LF0F0:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcs    LF12E                 ; 2³+1
LF0F6:
    lda    #0                    ; 2
    sta    $84                   ; 3
    sta    $82                   ; 3
LF0FC:
    lda    #1                    ; 2
    sta    $80                   ; 3
    sta    $81                   ; 3
    jsr    LFBC7                 ; 6
    lda    #$4E                  ; 2
    sta    $C6                   ; 3
    lda    #4                    ; 2
    sta    $83                   ; 3
    ldx    #7                    ; 2
    lda    #0                    ; 2
LF111:
    sta    $91,X                 ; 4
    sta    $88,X                 ; 4
    sta    $A0,X                 ; 4
    sta    $B6,X                 ; 4
    sta    $AD,X                 ; 4
    dex                          ; 2
    bpl    LF111                 ; 2³
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    ldx    #$12                  ; 2
LF124:
    sta    $D0,X                 ; 4
    dex                          ; 2
    bpl    LF124                 ; 2³
    sta    CXCLR                 ; 3
    jmp    LF6BE                 ; 3

LF12E:
    lda    $DE                   ; 3
    beq    LF143                 ; 2³
    dec    $DE                   ; 5
    bne    LF143                 ; 2³
    ldx    #1                    ; 2
    stx    $84                   ; 3
    dex                          ; 2
    stx    AUDV0                 ; 3
    stx    AUDV1                 ; 3
    lda    #4                    ; 2
    sta    $83                   ; 3
LF143:
    lda    $92                   ; 3
    beq    LF14B                 ; 2³
    ora    #$80                  ; 2
    sta    $92                   ; 3
LF14B:
    lda    $97                   ; 3
    beq    LF153                 ; 2³
    ora    #$80                  ; 2
    sta    $97                   ; 3
LF153:
    lda    $82                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    bne    LF15C                 ; 2³
    jmp    LF1E4                 ; 3

LF15C:
    cmp    #8                    ; 2
    bcc    LF162                 ; 2³
    lda    #7                    ; 2
LF162:
    tay                          ; 2
    lda    $EF                   ; 3
    and    LFD18,Y               ; 4
    cmp    LFD18,Y               ; 4
    bne    LF1E4                 ; 2³
    lda    $D5                   ; 3
    bne    LF1E4                 ; 2³
    lda    $80                   ; 3
    cmp    #$0C                  ; 2
    bcc    LF1E4                 ; 2³
    lda    $C6                   ; 3
    cmp    #$42                  ; 2
    bcs    LF1B6                 ; 2³
    cmp    #$3C                  ; 2
    bcs    LF1E4                 ; 2³
    ldx    #1                    ; 2
LF183:
    lda    $96,X                 ; 4
    bne    LF18C                 ; 2³
    dex                          ; 2
    bpl    LF183                 ; 2³
    bmi    LF198                    ; always branch
LF18C:
    dec    $96,X                 ; 6
    lda    $96,X                 ; 4
    cmp    #$C0                  ; 2
    bcs    LF198                 ; 2³
    lda    #0                    ; 2
    sta    $96,X                 ; 4
LF198:
    ldx    #1                    ; 2
LF19A:
    lda    $91,X                 ; 4
    bne    LF1A5                 ; 2³
    inx                          ; 2
    cpx    #3                    ; 2
    bcc    LF19A                 ; 2³
    bcs    LF1E4                    ; always branch

LF1A5:
    inc    $91,X                 ; 6
    jsr    LFBB1                 ; 6
    lda    $91,X                 ; 4
    cmp    #$E0                  ; 2
    bcc    LF1E4                 ; 2³
    lda    #0                    ; 2
    sta    $91,X                 ; 4
    beq    LF1E4                    ; always branch

LF1B6:
    ldx    #2                    ; 2
LF1B8:
    lda    $91,X                 ; 4
    beq    LF1C5                 ; 2³
    cmp    #$D1                  ; 2
    bcs    LF1CB                 ; 2³
    dex                          ; 2
    bne    LF1B8                 ; 2³
    beq    LF1CD                    ; always branch

LF1C5:
    lda    #$E0                  ; 2
    sta    $91,X                 ; 4
    bmi    LF1CD                 ; 2³
LF1CB:
    dec    $91,X                 ; 6
LF1CD:
    ldx    #5                    ; 2
LF1CF:
    lda    $91,X                 ; 4
    beq    LF1DC                 ; 2³
    cmp    #$D0                  ; 2
    bcc    LF1E2                 ; 2³
    inx                          ; 2
    cpx    #7                    ; 2
    bcc    LF1CF                 ; 2³
LF1DC:
    lda    #$C0                  ; 2
    sta    $91,X                 ; 4
    bmi    LF1E4                    ; always branch

LF1E2:
    inc    $91,X                 ; 6
LF1E4:
    lda    $92                   ; 3
    and    #$7F                  ; 2
    sta    $92                   ; 3
    lda    $97                   ; 3
    and    #$7F                  ; 2
    sta    $97                   ; 3
    lda    $80                   ; 3
    cmp    #$0B                  ; 2
    bne    LF1FE                 ; 2³
    lda    #$10                  ; 2
    sta    $94                   ; 3
    lda    #$30                  ; 2
    sta    $95                   ; 3
LF1FE:
    lda    $D8                   ; 3
    beq    LF220                 ; 2³
    bpl    LF216                 ; 2³
    inc    $DC                   ; 5
    inc    $DC                   ; 5
    lda    $DC                   ; 3
    cmp    #$B0                  ; 2
    bne    LF220                 ; 2³
    lda    #0                    ; 2
    sta    $D1                   ; 3
    sta    $D8                   ; 3
    beq    LF220                    ; always branch

LF216:
    dec    $D8                   ; 5
    bne    LF220                 ; 2³
    dec    $D8                   ; 5
    lda    #$A0                  ; 2
    sta    $DC                   ; 3
LF220:
    jsr    LFBA2                 ; 6
    cmp    #$F0                  ; 2
    bcc    LF289                 ; 2³
    lda    $D1                   ; 3
    ora    $D8                   ; 3
    ora    $D5                   ; 3
    ora    $DE                   ; 3
    bne    LF289                 ; 2³
    jsr    LFBA2                 ; 6
    and    #$07                  ; 2
    tay                          ; 2
    lda    LFFF0,Y               ; 4
    sta    $DC                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $82                   ; 3
    cmp    LFBF1,X               ; 4
    bcs    LF24D                 ; 2³
    lda    #0                    ; 2
    sta    $DC                   ; 3
LF24D:
    lda    #$40                  ; 2
    sta    $FC                   ; 3
    jsr    LFBA2                 ; 6
    and    #$07                  ; 2
    tay                          ; 2
    lda    LFDF0,Y               ; 4
    sta    $CC                   ; 3
    lda    LFDF8,Y               ; 4
    sta    $CD                   ; 3
    jsr    LFBA2                 ; 6
    sta    $C8                   ; 3
    jsr    LFBA2                 ; 6
    sta    $C9                   ; 3
    lda    $82                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    cmp    #8                    ; 2
    bcc    LF275                 ; 2³
    lda    #7                    ; 2
LF275:
    tay                          ; 2
    lda    LFD10,Y               ; 4
    sta    $D1                   ; 3
    lda    #0                    ; 2
    sta    $9F                   ; 3
    sta    $9E                   ; 3
    lda    #$3E                  ; 2
    sta    $CE                   ; 3
    lda    #$38                  ; 2
    sta    $CF                   ; 3
LF289:
    lda    $D6                   ; 3
    beq    LF28F                 ; 2³
    dec    $D6                   ; 5
LF28F:
    lda    $84                   ; 3
    beq    LF296                 ; 2³
    jmp    LF324                 ; 3

LF296:
    lda    $80                   ; 3
    sta    AUDV0                 ; 3
    lsr                          ; 2
    lsr                          ; 2
    eor    #$07                  ; 2
    sta    AUDF0                 ; 3
    lda    #8                    ; 2
    sta    AUDC0                 ; 3
    lda    $D2                   ; 3
    beq    LF2BC                 ; 2³
    lda    $C1                   ; 3
    eor    $C0                   ; 3
    ora    #$10                  ; 2
    sta    AUDF0                 ; 3
    lda    $EF                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    ora    #$0C                  ; 2
    sta    AUDV0                 ; 3
    lda    #$0D                  ; 2
    sta    AUDC0                 ; 3
LF2BC:
    lda    $D7                   ; 3
    ora    $D8                   ; 3
    beq    LF2CE                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDV0                 ; 3
    ora    #$10                  ; 2
    sta    AUDF0                 ; 3
    lda    #7                    ; 2
    sta    AUDC0                 ; 3
LF2CE:
    lda    $D1                   ; 3
    beq    LF2E1                 ; 2³
    lda    $DC                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDC1                 ; 3
    asl                          ; 2
    ora    $D1                   ; 3
    sta    AUDF1                 ; 3
    eor    $EF                   ; 3
LF2E1:
    sta    AUDV1                 ; 3
    lda    $D5                   ; 3
    ora    $D6                   ; 3
    beq    LF2FE                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ora    #$08                  ; 2
    sta    AUDV1                 ; 3
    lsr                          ; 2
    sta    AUDV0                 ; 3
    sta    AUDF0                 ; 3
    asl                          ; 2
    sta    AUDF1                 ; 3
    lda    #7                    ; 2
    sta    AUDC0                 ; 3
    sta    AUDC1                 ; 3
LF2FE:
    lda    $DF                   ; 3
    beq    LF30C                 ; 2³
    sta    AUDV0                 ; 3
    lda    #$1C                  ; 2
    sta    AUDC0                 ; 3
    sta    AUDF0                 ; 3
    dec    $DF                   ; 5
LF30C:
    lda    $DE                   ; 3
    beq    LF324                 ; 2³
    lsr                          ; 2
    sta    AUDV0                 ; 3
    lsr                          ; 2
    sta    AUDV1                 ; 3
    lsr                          ; 2
    sta    AUDF0                 ; 3
    lsr                          ; 2
    sta    AUDF1                 ; 3
    lda    #7                    ; 2
    sta    AUDC0                 ; 3
    lda    #8                    ; 2
    sta    AUDC1                 ; 3
LF324:
    lda    CXP1FB                ; 3
    asl                          ; 2
    bpl    LF34A                 ; 2³
    lda    $DC                   ; 3
    cmp    #$A0                  ; 2
    bcs    LF34A                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LFEE0,Y               ; 4
    sta    $9B                   ; 3
    lda    LFEE8,Y               ; 4
    sta    $9C                   ; 3
    jsr    LFD40                 ; 6
    lda    #$10                  ; 2
    sta    $D8                   ; 3
    lda    #$C0                  ; 2
    sta    $DC                   ; 3
LF34A:
    lda    $D7                   ; 3
    ora    $D5                   ; 3
    bne    LF374                 ; 2³
    lda    $D4                   ; 3
    bpl    LF35A                 ; 2³
    lda    #0                    ; 2
    sta    $D1                   ; 3
    beq    LF370                    ; always branch

LF35A:
    lda    $D8                   ; 3
    bne    LF374                 ; 2³
    lda    CXPPMM                ; 3
    bpl    LF374                 ; 2³
    lda    $DC                   ; 3
    cmp    #$A0                  ; 2
    bcs    LF374                 ; 2³
    lda    #$C0                  ; 2
    sta    $DC                   ; 3
    lda    #$10                  ; 2
    sta    $D8                   ; 3
LF370:
    lda    #$3F                  ; 2
    sta    $D7                   ; 3
LF374:
    lda    CXM0FB                ; 3
    ora    CXM1FB                ; 3
    asl                          ; 2
    bpl    LF382                 ; 2³
    lda    #0                    ; 2
    sta    $D2                   ; 3
    jsr    LFBB1                 ; 6
LF382:
    lda    $84                   ; 3
    beq    LF38E                 ; 2³
    lda    $EF                   ; 3
    and    #$7F                  ; 2
    cmp    #$7F                  ; 2
    beq    LF3A0                 ; 2³
LF38E:
    lda    CXBLPF                ; 3
    bpl    LF3E3                 ; 2³
    lda    #0                    ; 2
    sta    $D2                   ; 3
    lda    $C1                   ; 3
    cmp    #$48                  ; 2
    bcs    LF3E3                 ; 2³
    cmp    #$2F                  ; 2
    bcc    LF3E3                 ; 2³
LF3A0:
    lda    $D6                   ; 3
    bne    LF3A8                 ; 2³
    lda    #$18                  ; 2
    sta    $D6                   ; 3
LF3A8:
    lda    #$25                  ; 2
    sta    $9B                   ; 3
    lda    #0                    ; 2
    sta    $9C                   ; 3
    jsr    LFD40                 ; 6
    dec    $C6                   ; 5
    lda    $C6                   ; 3
    cmp    #$30                  ; 2
    bcs    LF3E3                 ; 2³
    lda    #$30                  ; 2
    sta    $C6                   ; 3
    lda    $D5                   ; 3
    bne    LF3E3                 ; 2³
    lda    #$FE                  ; 2
    sta    $D5                   ; 3
    lda    #0                    ; 2
    sta    $D1                   ; 3
    lda    $84                   ; 3
    bne    LF3E3                 ; 2³
    sed                          ; 2
    lda    $DA                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    sta    $DA                   ; 3
    cld                          ; 2
    inc    $82                   ; 5
    lsr                          ; 2
    bcs    LF3E3                 ; 2³
    inc    $83                   ; 5
    lda    #$40                  ; 2
    sta    $DF                   ; 3
LF3E3:
    lda    $D7                   ; 3
    beq    LF3F8                 ; 2³
    dec    $D7                   ; 5
    bne    LF3F8                 ; 2³
    jsr    LFBC7                 ; 6
    dec    $83                   ; 5
    bpl    LF3F8                 ; 2³
    inc    $83                   ; 5
    lda    #$F0                  ; 2
    sta    $DE                   ; 3
LF3F8:
    lda    $84                   ; 3
    beq    LF403                 ; 2³+1
    lda    $EF                   ; 3
    eor    $C0                   ; 3
    jmp    LF406                 ; 3

LF403:
    lda    SWCHA                 ; 4
LF406:
    sta    $9B                   ; 3
    and    #$F0                  ; 2
    cmp    #$F0                  ; 2
    beq    LF462                 ; 2³
    and    #$C0                  ; 2
    beq    LF462                 ; 2³
    lda    $9B                   ; 3
    and    #$30                  ; 2
    beq    LF462                 ; 2³
    lda    $9B                   ; 3
    sta    $C3                   ; 3
    lda    $84                   ; 3
    bne    LF426                 ; 2³
    lda    #0                    ; 2
    sta    $D0                   ; 3
    sta    $D9                   ; 3
LF426:
    bit    INPT4                 ; 3
    bpl    LF462                 ; 2³
    lda    $D7                   ; 3
    ora    $DE                   ; 3
    bne    LF462                 ; 2³
    lda    $9B                   ; 3
    and    #$10                  ; 2
    bne    LF440                 ; 2³
    inc    $AB                   ; 5
    lda    $AB                   ; 3
    cmp    #$70                  ; 2
    bcc    LF440                 ; 2³
    dec    $AB                   ; 5
LF440:
    lda    $9B                   ; 3
    and    #$20                  ; 2
    bne    LF44C                 ; 2³
    dec    $AB                   ; 5
    bne    LF44C                 ; 2³
    inc    $AB                   ; 5
LF44C:
    lda    $9B                   ; 3
    bmi    LF456                 ; 2³
    inc    $AA                   ; 5
    bpl    LF456                 ; 2³
    dec    $AA                   ; 5
LF456:
    lda    $9B                   ; 3
    and    #$40                  ; 2
    bne    LF462                 ; 2³
    dec    $AA                   ; 5
    bpl    LF462                 ; 2³
    inc    $AA                   ; 5
LF462:
    lda    $D2                   ; 3
    ora    $D7                   ; 3
    ora    $DE                   ; 3
    bne    LF4AA                 ; 2³
    lda    $84                   ; 3
    beq    LF477                 ; 2³
    lda    $FD                   ; 3
    cmp    #$F0                  ; 2
    bcc    LF4AA                 ; 2³
    jmp    LF481                 ; 3

LF477:
    lda    INPT4                 ; 3
    bmi    LF4AA                 ; 2³
    lda    #0                    ; 2
    sta    $D0                   ; 3
    sta    $D9                   ; 3
LF481:
    lda    $C3                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$0F                  ; 2
    sta    $D2                   ; 3
    dec    $C2                   ; 5
    tax                          ; 2
    lda    LFD20,X               ; 4
    sta    $C4                   ; 3
    lda    LFBE2,X               ; 4
    sta    $C5                   ; 3
    lda    $AB                   ; 3
    bit    $C4                   ; 3
    beq    LF4A1                 ; 2³
    sec                          ; 2
    sbc    #2                    ; 2
LF4A1:
    sta    $C1                   ; 3
    lda    $AA                   ; 3
    clc                          ; 2
    adc    #3                    ; 2
    sta    $C0                   ; 3
LF4AA:
    lda    $D2                   ; 3
    beq    LF4F4                 ; 2³
    sta    $9B                   ; 3
    lsr    $9B                   ; 5
    bcc    LF4C1                 ; 2³
    lda    $C1                   ; 3
    clc                          ; 2
    adc    #4                    ; 2
    sta    $C1                   ; 3
    bpl    LF4C1                 ; 2³
    lda    #0                    ; 2
    sta    $D2                   ; 3
LF4C1:
    lsr    $9B                   ; 5
    bcc    LF4D2                 ; 2³
    lda    $C1                   ; 3
    sec                          ; 2
    sbc    #4                    ; 2
    sta    $C1                   ; 3
    bpl    LF4D2                 ; 2³
    lda    #0                    ; 2
    sta    $D2                   ; 3
LF4D2:
    lsr    $9B                   ; 5
    bcc    LF4E3                 ; 2³
    lda    $C0                   ; 3
    sec                          ; 2
    sbc    #4                    ; 2
    sta    $C0                   ; 3
    bpl    LF4E3                 ; 2³
    lda    #0                    ; 2
    sta    $D2                   ; 3
LF4E3:
    lsr    $9B                   ; 5
    bcc    LF4F4                 ; 2³
    lda    $C0                   ; 3
    clc                          ; 2
    adc    #4                    ; 2
    sta    $C0                   ; 3
    bpl    LF4F4                 ; 2³
    lda    #0                    ; 2
    sta    $D2                   ; 3
LF4F4:
    inc    $EF                   ; 5
    lda    $82                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    cmp    #8                    ; 2
    bcc    LF500                 ; 2³+1
    lda    #7                    ; 2
LF500:
    tay                          ; 2
    lda    $EF                   ; 3
    and    LFED0,Y               ; 4
    cmp    LFED0,Y               ; 4
    bne    LF529                 ; 2³
    lda    $EF                   ; 3
    sta    $CA                   ; 3
    lda    $80                   ; 3
    clc                          ; 2
    adc    $81                   ; 3
    sta    $80                   ; 3
    cmp    #$3F                  ; 2
    beq    LF522                 ; 2³
    cmp    #$0C                  ; 2
    bne    LF529                 ; 2³
    lda    $81                   ; 3
    bpl    LF529                 ; 2³
LF522:
    lda    #0                    ; 2
    sec                          ; 2
    sbc    $81                   ; 3
    sta    $81                   ; 3
LF529:
    lda    #$7F                  ; 2
    sec                          ; 2
    sbc    $80                   ; 3
    jsr    LFB8D                 ; 6
    sta    $86                   ; 3
    lda    $80                   ; 3
    jsr    LFB8D                 ; 6
    sta    $87                   ; 3
    lda    #0                    ; 2
    sec                          ; 2
    sbc    $80                   ; 3
    sta    $85                   ; 3
    lda    $D8                   ; 3
    bne    LF54F                 ; 2³
    lda    $D1                   ; 3
    beq    LF54F                 ; 2³
    cmp    #1                    ; 2
    beq    LF552                 ; 2³
    dec    $D1                   ; 5
LF54F:
    jmp    LF62B                 ; 3

LF552:
    lda    $DC                   ; 3
    cmp    #$20                  ; 2
    beq    LF582                 ; 2³
    cmp    #$60                  ; 2
    beq    LF582                 ; 2³
    cmp    #$80                  ; 2
    bne    LF5C0                 ; 2³
    lda    $EF                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    tay                          ; 2
    lda    LFD38,Y               ; 4
    sta    $9B                   ; 3
    lda    LFD3C,Y               ; 4
    sta    $9C                   ; 3
    ldy    $FC                   ; 3
    lda    $EF                   ; 3
    and    #$03                  ; 2
    cmp    #3                    ; 2
    bne    LF57F                 ; 2³
    dec    $FC                   ; 5
LF57F:
    jmp    LF59C                 ; 3

LF582:
    lda    $AA                   ; 3
    sta    $9B                   ; 3
    lda    $AB                   ; 3
    sta    $9C                   ; 3
    lda    $82                   ; 3
    clc                          ; 2
    adc    #3                    ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    #8                    ; 2
    bcc    LF597                 ; 2³
    lda    #7                    ; 2
LF597:
    tay                          ; 2
    lda    LFD00,Y               ; 4
    tay                          ; 2
LF59C:
    ldx    #1                    ; 2
LF59E:
    lda    $CE,X                 ; 4
    cmp    $9B,X                 ; 4
    beq    LF5BD                 ; 2³
    bcc    LF5B3                 ; 2³
    lda    $CC,X                 ; 4
    cmp    #$FE                  ; 2
    beq    LF5BD                 ; 2³
    tya                          ; 2
    jsr    LFEF0                 ; 6
    jmp    LF5BD                 ; 3

LF5B3:
    lda    $CC,X                 ; 4
    cmp    #2                    ; 2
    beq    LF5BD                 ; 2³
    tya                          ; 2
    jsr    LFD64                 ; 6
LF5BD:
    dex                          ; 2
    bpl    LF59E                 ; 2³
LF5C0:
    lda    $C8                   ; 3
    clc                          ; 2
    adc    $9E                   ; 3
    sta    $9E                   ; 3
    lda    $CC                   ; 3
    adc    $CE                   ; 3
    sta    $CE                   ; 3
    bpl    LF5F4                 ; 2³
    lda    $DC                   ; 3
    cmp    #$60                  ; 2
    beq    LF5D9                 ; 2³
    cmp    #$40                  ; 2
    bne    LF5F0                 ; 2³
LF5D9:
    lda    #0                    ; 2
    sec                          ; 2
    sbc    $C8                   ; 3
    sta    $C8                   ; 3
    lda    #0                    ; 2
    sbc    $CC                   ; 3
    sta    $CC                   ; 3
    lda    #$FF                  ; 2
    sec                          ; 2
    sbc    $CE                   ; 3
    sta    $CE                   ; 3
    jmp    LF5F4                 ; 3

LF5F0:
    lda    #0                    ; 2
    sta    $D1                   ; 3
LF5F4:
    lda    $C9                   ; 3
    clc                          ; 2
    adc    $9F                   ; 3
    sta    $9F                   ; 3
    lda    $CD                   ; 3
    adc    $CF                   ; 3
    sta    $CF                   ; 3
    bmi    LF60B                 ; 2³
    cmp    #$72                  ; 2
    bcc    LF62B                 ; 2³
    dec    $CF                   ; 5
    dec    $CF                   ; 5
LF60B:
    lda    $DC                   ; 3
    cmp    #$60                  ; 2
    beq    LF615                 ; 2³
    cmp    #$40                  ; 2
    bne    LF627                 ; 2³
LF615:
    lda    #0                    ; 2
    sec                          ; 2
    sbc    $C9                   ; 3
    sta    $C9                   ; 3
    lda    #0                    ; 2
    sbc    $CD                   ; 3
    sta    $CD                   ; 3
    inc    $CF                   ; 5
    jmp    LF62B                 ; 3

LF627:
    lda    #0                    ; 2
    sta    $D1                   ; 3
LF62B:
    lda    $D5                   ; 3
    bne    LF632                 ; 2³
    jmp    LF6BE                 ; 3

LF632:
    cmp    #$E0                  ; 2
    bne    LF63C                 ; 2³
    lda    #$70                  ; 2
    sta    $93                   ; 3
    sta    $96                   ; 3
LF63C:
    cmp    #$D0                  ; 2
    bne    LF646                 ; 2³
    lda    #$90                  ; 2
    sta    $92                   ; 3
    sta    $97                   ; 3
LF646:
    cmp    #$C0                  ; 2
    bne    LF650                 ; 2³
    lda    #$B0                  ; 2
    sta    $91                   ; 3
    sta    $98                   ; 3
LF650:
    ldx    #3                    ; 2
LF652:
    lda    $91,X                 ; 4
    and    #$F0                  ; 2
    sta    $9B                   ; 3
    lda    $91,X                 ; 4
    clc                          ; 2
    adc    #1                    ; 2
    and    #$0F                  ; 2
    ora    $9B                   ; 3
    sta    $91,X                 ; 4
    dex                          ; 2
    bpl    LF652                 ; 2³
    ldx    #3                    ; 2
LF668:
    lda    $95,X                 ; 4
    and    #$F0                  ; 2
    sta    $9B                   ; 3
    lda    $95,X                 ; 4
    sec                          ; 2
    sbc    #1                    ; 2
    and    #$0F                  ; 2
    ora    $9B                   ; 3
    sta    $95,X                 ; 4
    dex                          ; 2
    bpl    LF668                 ; 2³
    lda    $D5                   ; 3
    cmp    #$A0                  ; 2
    bcs    LF6A2                 ; 2³
    and    #$0F                  ; 2
    cmp    #$0E                  ; 2
    bne    LF6A2                 ; 2³
    lda    #0                    ; 2
    sta    $9B                   ; 3
    sta    $9C                   ; 3
    ldy    $82                   ; 3
LF690:
    lda    $9C                   ; 3
    sed                          ; 2
    clc                          ; 2
    adc    #1                    ; 2
    sta    $9C                   ; 3
    cld                          ; 2
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    bpl    LF690                 ; 2³
    jsr    LFD40                 ; 6
LF6A2:
    dec    $D5                   ; 5
    dec    $D5                   ; 5
    bne    LF6BE                 ; 2³
    lda    #0                    ; 2
    ldx    #7                    ; 2
LF6AC:
    sta    $91,X                 ; 4
    dex                          ; 2
    bpl    LF6AC                 ; 2³
    lda    #$4E                  ; 2
    sta    $C6                   ; 3
    lda    #1                    ; 2
    sta    $81                   ; 3
    sta    $80                   ; 3
    jsr    LFBC7                 ; 6
LF6BE:
    lda    $C6                   ; 3
    jsr    LFB8D                 ; 6
    sta    $FA                   ; 3
    ldx    #7                    ; 2
LF6C7:
    lda    #0                    ; 2
    sta    $A0,X                 ; 4
    sta    $B6,X                 ; 4
    sta    $88,X                 ; 4
    sta    $AD,X                 ; 4
    lda    #$10                  ; 2
    sta    $F0,X                 ; 4
    dex                          ; 2
    bpl    LF6C7                 ; 2³
    lda    $AA                   ; 3
    jsr    LFB8D                 ; 6
    sta    $AC                   ; 3
    lda    $AB                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $AB                   ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFCF0,Y               ; 4
    ldy    $D7                   ; 3
    beq    LF705                 ; 2³+1
    sta    $9B                   ; 3
    tya                          ; 2
    and    #$03                  ; 2
    cmp    #3                    ; 2
    bne    LF701                 ; 2³+1
    lda    $9B                   ; 3
    ora    #$60                  ; 2
    bne    LF705                    ; always branch

LF701:
    lda    $9B                   ; 3
    ora    #$80                  ; 2
LF705:
    sta    $A0,X                 ; 4
    eor    #$10                  ; 2
    inx                          ; 2
    cpx    #8                    ; 2
    bcs    LF710                 ; 2³
    sta    $A0,X                 ; 4
LF710:
    lda    $C0                   ; 3
    jsr    LFB8D                 ; 6
    sta    $BF                   ; 3
    lda    $D2                   ; 3
    beq    LF739                 ; 2³
    lda    $C1                   ; 3
    bmi    LF739                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $C1                   ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFCF0,Y               ; 4
    ora    $C5                   ; 3
    sta    $B6,X                 ; 4
    inx                          ; 2
    cpx    #8                    ; 2
    bcs    LF739                 ; 2³
    eor    #$10                  ; 2
    sta    $B6,X                 ; 4
LF739:
    lda    $D1                   ; 3
    beq    LF772                 ; 2³
    lda    $CE                   ; 3
    jsr    LFB8D                 ; 6
    sta    $CB                   ; 3
    lda    $CF                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $CF                   ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFCF0,Y               ; 4
    ora    $DC                   ; 3
    sta    $88,X                 ; 4
    inx                          ; 2
    cpx    #8                    ; 2
    bcs    LF760                 ; 2³
    eor    #$10                  ; 2
    sta    $88,X                 ; 4
LF760:
    lda    $D8                   ; 3
    bpl    LF772                 ; 2³
    dex                          ; 2
    lda    $DC                   ; 3
    sta    $88,X                 ; 4
    inx                          ; 2
    cpx    #8                    ; 2
    bcs    LF772                 ; 2³
    eor    #$0F                  ; 2
    sta    $88,X                 ; 4
LF772:
    lda    $D5                   ; 3
    beq    LF779                 ; 2³
    jmp    LF822                 ; 3

LF779:
    lda    $80                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $80                   ; 3
    and    #$0F                  ; 2
    sta    $B1,X                 ; 4
    lda    #$10                  ; 2
LF788:
    dex                          ; 2
    bmi    LF78F                 ; 2³
    sta    $B1,X                 ; 4
    bpl    LF788                    ; always branch

LF78F:
    lda    $B4                   ; 3
    sta    $AD                   ; 3
    lda    $B3                   ; 3
    sta    $AE                   ; 3
    lda    $B2                   ; 3
    sta    $AF                   ; 3
    lda    $B1                   ; 3
    sta    $B0                   ; 3
    lda    $80                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $B1,X                 ; 4
    eor    #$1F                  ; 2
    sta    $B1,X                 ; 4
    lda    SWCHB                 ; 4
    and    #$08                  ; 2
    cmp    $F9                   ; 3
    bne    LF7FE                 ; 2³
    lda    $80                   ; 3
    cmp    #$0C                  ; 2
    bcs    LF7BE                 ; 2³
    jmp    LF822                 ; 3

LF7BE:
    lda    $82                   ; 3
    clc                          ; 2
    adc    #2                    ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    #8                    ; 2
    bcc    LF7CB                 ; 2³
    lda    #7                    ; 2
LF7CB:
    tay                          ; 2
    lda    $EF                   ; 3
    and    LFED8,Y               ; 4
    cmp    LFED8,Y               ; 4
    bne    LF7FE                 ; 2³
    lda    $C7                   ; 3
    bmi    LF7ED                 ; 2³
    inc    $D3                   ; 5
    bmi    LF7FE                 ; 2³
    lda    $D3                   ; 3
    clc                          ; 2
    adc    #$11                  ; 2
    cmp    $80                   ; 3
    bcc    LF7FE                 ; 2³
    lda    #$FF                  ; 2
    sta    $C7                   ; 3
    bmi    LF7FE                    ; always branch

LF7ED:
    dec    $D3                   ; 5
    bpl    LF7FE                 ; 2³
    lda    $D3                   ; 3
    sec                          ; 2
    sbc    #2                    ; 2
    cmp    $85                   ; 3
    bcs    LF7FE                 ; 2³
    lda    #0                    ; 2
    sta    $C7                   ; 3
LF7FE:
    lda    $D3                   ; 3
    clc                          ; 2
    adc    #$40                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    cpx    #8                    ; 2
    bcs    LF822                 ; 2³
    lda    $D3                   ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFCF0,Y               ; 4
    clc                          ; 2
    adc    #$10                  ; 2
    sta    $F0,X                 ; 4
    inx                          ; 2
    cpx    #8                    ; 2
    bcs    LF822                 ; 2³
    eor    #$10                  ; 2
    sta    $F0,X                 ; 4
LF822:
    sta    WSYNC                 ; 3
;---------------------------------------
    bit    $FF                   ; 3
    nop                          ; 2
    rol    START,X               ; 7
    lda    $86                   ; 3
    sta    HMM0                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
LF831:
    dex                          ; 2
    bpl    LF831                 ; 2³
    sta    RESM0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    bit    $FF                   ; 3
    nop                          ; 2
    rol    START,X               ; 7
    lda    $87                   ; 3
    sta    HMM1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
LF845:
    dex                          ; 2
    bpl    LF845                 ; 2³
    sta    RESM1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    nop                          ; 2
    rol    START,X               ; 7
    lda    $BF                   ; 3
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
LF858:
    dex                          ; 2
    bpl    LF858                 ; 2³
    sta    RESBL                 ; 3
    ldx    $D2                   ; 3
    lda    LFBD7,X               ; 4
    sta    CTRLPF                ; 3
    lda    #$FF                  ; 2
    sta    $A9                   ; 3
    lda    $D9                   ; 3
    beq    LF874                 ; 2³
    lda    #$F7                  ; 2
    sta    $A9                   ; 3
    and    $CA                   ; 3
    sta    $CA                   ; 3
LF874:
    lda    INTIM                 ; 4
    bne    LF874                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    #$52                  ; 2
    eor    $DB                   ; 3
    eor    $D7                   ; 3
    and    $A9                   ; 3
    sta    COLUBK                ; 3
    sta    CXCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #5                    ; 2
LF88D:
    dex                          ; 2
    bne    LF88D                 ; 2³
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    rol    START,X               ; 7
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$28                  ; 2
    eor    $DB                   ; 3
    eor    $D5                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #7                    ; 2
    sta    $9C                   ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
LF8B7:
    ldy    $9C                   ; 3
    lda    ($E3),Y               ; 5
    sta    $9B                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($E5),Y               ; 5
    tax                          ; 2
    lda    ($ED),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($EB),Y               ; 5
    sta    GRP1                  ; 3
    bit    $FF                   ; 3
    lda    ($E9),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($E7),Y               ; 5
    ldy    $9B                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    $9C                   ; 5
    bpl    LF8B7                 ; 2³
    lda    #0                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    HMCLR                 ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    $CA                   ; 3
    ora    #$08                  ; 2
    eor    #$F0                  ; 2
    eor    $DB                   ; 3
    sta    COLUP0                ; 3
    eor    #$C0                  ; 2
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $EF                   ; 3
    sta    REFP1                 ; 3
    bit    $FF                   ; 3
    nop                          ; 2
    lda    $AC                   ; 3
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
LF90A:
    dex                          ; 2
    bpl    LF90A                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    nop                          ; 2
    rol    START,X               ; 7
    lda    $CB                   ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
LF91D:
    dex                          ; 2
    bpl    LF91D                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    lda    #$32                  ; 2
    eor    $DB                   ; 3
    eor    $D8                   ; 3
    and    $A9                   ; 3
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    sta    PF0                   ; 3
    lda    $D6                   ; 3
    ora    $DE                   ; 3
    eor    $DB                   ; 3
    and    $A9                   ; 3
    sta    COLUBK                ; 3
    lda    $CA                   ; 3
    eor    $DB                   ; 3
    eor    $D5                   ; 3
    and    $A9                   ; 3
    sta    COLUPF                ; 3
    ldx    #7                    ; 2
    lda    #$10                  ; 2
    sta    HMM0                  ; 3
    lda    #$F0                  ; 2
    sta    HMM1                  ; 3
    lda    $98                   ; 3
    sta    $99                   ; 3
    lda    $B4                   ; 3
    sta    $B4                   ; 3
    lda    $F7                   ; 3
    sta    $F7                   ; 3
    ldy    #$0F                  ; 2
LF968:
    sta    WSYNC                 ; 3
;---------------------------------------
LF96A:
    sta    HMOVE                 ; 3
    lda    ($A7),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($8F),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($B4),Y               ; 5
    and    ($F7),Y               ; 5
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    lda    ($99),Y               ; 5
    sta    PF2                   ; 3
    lda    ($BD),Y               ; 5
    sta    ENABL                 ; 3
    sta    HMP1                  ; 3
    beq    LF98C                 ; 2³
    lda    $C4                   ; 3
    sta    HMBL                  ; 3
LF98C:
    dey                          ; 2
    bne    LF968                 ; 2³
    lda    $90,X                 ; 4
    sta    $99                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ($A7),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($8F),Y               ; 5
    sta    GRP1                  ; 3
    lda    $EF,X                 ; 4
    sta    $F7                   ; 3
    lda    LFD07,X               ; 4
    sta    HMM0                  ; 3
    eor    #$E0                  ; 2
    sta    HMM1                  ; 3
    lda    $9F,X                 ; 4
    sta    $A7                   ; 3
    lda    $B5,X                 ; 4
    sta    $BD                   ; 3
    lda    $87,X                 ; 4
    sta    $8F                   ; 3
    lda    $AC,X                 ; 4
    sta    $B4                   ; 3
    ldy    #$0F                  ; 2
    nop                          ; 2
    dex                          ; 2
    bpl    LF96A                 ; 2³
    lda    #0                    ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    PF2                   ; 3
    sta    COLUPF                ; 3
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$FF                  ; 2
    sta    PF0                   ; 3
    lda    #$66                  ; 2
    eor    $DB                   ; 3
    eor    $D8                   ; 3
    and    $A9                   ; 3
    sta    COLUBK                ; 3
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    lda    CXM0P                 ; 3
    asl                          ; 2
    ora    CXM1P                 ; 3
    ora    CXP0FB                ; 3
    sta    $D4                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$F0                  ; 2
    sta    HMM0                  ; 3
    ldx    #5                    ; 2
LF9F3:
    dex                          ; 2
    bpl    LF9F3                 ; 2³
    bit    $FF                   ; 3
    sta    RESM0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    eor    $DB                   ; 3
    and    $A9                   ; 3
    sta    COLUBK                ; 3
    sta    PF0                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$30                  ; 2
    sta    HMP0                  ; 3
    ldx    #5                    ; 2
LFA0E:
    dex                          ; 2
    bpl    LFA0E                 ; 2³
    bit    $FF                   ; 3
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    bit    $FF                   ; 3
    nop                          ; 2
    rol    START,X               ; 7
    lda    $FA                   ; 3
    sta    HMM1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
LFA24:
    dex                          ; 2
    bpl    LFA24                 ; 2³
    sta    RESM1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$28                  ; 2
    eor    $DB                   ; 3
    sta    COLUPF                ; 3
    sta    COLUP0                ; 3
    lda    #$F0                  ; 2
    sta    PF2                   ; 3
    lda    #2                    ; 2
    sta    NUSIZ0                ; 3
    lda    #$FF                  ; 2
    sta    ENAM0                 ; 3
    lda    #$F8                  ; 2
    eor    $DB                   ; 3
    sta    COLUP1                ; 3
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    PF2                   ; 3
    lda    $C6                   ; 3
    cmp    #$40                  ; 2
    bcs    LFA61                 ; 2³
    sec                          ; 2
    sbc    #$30                  ; 2
    tax                          ; 2
    lda    #$F0                  ; 2
    sta    $9D                   ; 3
    bmi    LFA6B                    ; always branch

LFA61:
    eor    #$0F                  ; 2
    and    #$0F                  ; 2
    tax                          ; 2
    dex                          ; 2
    lda    #$10                  ; 2
    sta    $9D                   ; 3
LFA6B:
    lda    LFEB0,X               ; 4
    sta    $9B                   ; 3
    lda    LFEC0,X               ; 4
    sta    $9C                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #7                    ; 2
    lda    #0                    ; 2
    sta    REFP1                 ; 3
LFA7D:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LFD70,Y               ; 4
    sta    GRP0                  ; 3
    lda    #0                    ; 2
    asl    $9B                   ; 5
    bcc    LFA91                 ; 2³
    lda    $9D                   ; 3
    jmp    LFA94                 ; 3

LFA91:
    rol    START,X               ; 7
LFA94:
    sta    HMM1                  ; 3
    cpy    #6                    ; 2
    bne    LFA9E                 ; 2³
    lda    #$FF                  ; 2
    sta    ENAM1                 ; 3
LFA9E:
    lda    LFD78,Y               ; 4
    rol    START,X               ; 7
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    LFA7D                 ; 2³
    ldy    #7                    ; 2
LFAAB:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    lsr    $9C                   ; 5
    bcc    LFAB7                 ; 2³
    lda    $9D                   ; 3
LFAB7:
    rol    START,X               ; 7
    sta    HMM1                  ; 3
    dey                          ; 2
    bpl    LFAAB                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$F0                  ; 2
    sta    PF2                   ; 3
    lda    #0                    ; 2
    sta    ENAM1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    ENAM0                 ; 3
    sta    PF2                   ; 3
    sta    NUSIZ0                ; 3
    lda    #$18                  ; 2
    eor    $DB                   ; 3
    sta    COLUP1                ; 3
    eor    $DF                   ; 3
    sta    COLUP0                ; 3
    sta    RESP0                 ; 3
    lda    $DA                   ; 3
    and    #$0F                  ; 2
    sta    $9C                   ; 3
    lda    #2                    ; 2
    sta    $E3                   ; 3
    lda    $DA                   ; 3
    sta.w  RESBL                 ; 4
    and    #$F0                  ; 2
    sta    RESP1                 ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $E5                   ; 3
    lda    #$71                  ; 2
    sta    CTRLPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    eor    $DB                   ; 3
    and    $A9                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUPF                ; 3
    lda    #$FF                  ; 2
    sta    PF0                   ; 3
    lda    #$32                  ; 2
    eor    $DB                   ; 3
    eor    $D7                   ; 3
    and    $A9                   ; 3
    sta    COLUBK                ; 3
    lda    $83                   ; 3
    cmp    #$0A                  ; 2
    bcc    LFB1E                 ; 2³
    lda    #9                    ; 2
LFB1E:
    sta    $9B                   ; 3
LFB20:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    ENABL                 ; 3
    lda    $E5                   ; 3
    bmi    LFB30                 ; 2³
    beq    LFB30                 ; 2³
    lda    #$FF                  ; 2
    sta    ENABL                 ; 3
LFB30:
    ldx    $9C                   ; 3
    lda    LFDE6,X               ; 4
    sta    NUSIZ1                ; 3
    ldx    $9B                   ; 3
    lda    LFDE6,X               ; 4
    sta    NUSIZ0                ; 3
    ldy    #3                    ; 2
LFB40:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $9B                   ; 3
    beq    LFB4D                 ; 2³
    bmi    LFB4D                 ; 2³
    lda    LFFF8,Y               ; 4
    sta    GRP0                  ; 3
LFB4D:
    lda    $9C                   ; 3
    beq    LFB58                 ; 2³
    bmi    LFB58                 ; 2³
    lda    LFBED,Y               ; 4
    sta    GRP1                  ; 3
LFB58:
    dey                          ; 2
    bpl    LFB40                 ; 2³
    lda    #0                    ; 2
    sta    ENABL                 ; 3
    lda    $9B                   ; 3
    sec                          ; 2
    sbc    #3                    ; 2
    sta    $9B                   ; 3
    lda    $9C                   ; 3
    sec                          ; 2
    sbc    #3                    ; 2
    sta    $9C                   ; 3
    dec    $E5                   ; 5
    dec    $E3                   ; 5
    bpl    LFB20                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    eor    $DB                   ; 3
    and    $A9                   ; 3
    sta    COLUBK                ; 3
    ldy    #$19                  ; 2
LFB85:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bpl    LFB85                 ; 2³
    jmp    LF03F                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFB8D SUBROUTINE
    ldx    #0                    ; 2
LFB8F:
    cmp    #$0F                  ; 2
    bcc    LFB99                 ; 2³
    sec                          ; 2
    sbc    #$0F                  ; 2
    inx                          ; 2
    bne    LFB8F                    ; always branch

LFB99:
    stx    $9B                   ; 3
    tax                          ; 2
    lda    LFDD8,X               ; 4
    ora    $9B                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBA2 SUBROUTINE
    lda    $C2                   ; 3
    lsr                          ; 2
    lda    $FD                   ; 3
    ror                          ; 2
    eor    $C2                   ; 3
    ldy    $FD                   ; 3
    sta    $FD                   ; 3
    sty    $C2                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBB1 SUBROUTINE
    lda    $DD                   ; 3
    clc                          ; 2
    adc    #$40                  ; 2
    sta    $DD                   ; 3
    bcc    LFBC6                 ; 2³
    inc    $C6                   ; 5
    lda    $C6                   ; 3
    cmp    #$4F                  ; 2
    bcc    LFBC6                 ; 2³
    lda    #$4E                  ; 2
    sta    $C6                   ; 3
LFBC6:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBC7 SUBROUTINE
    lda    $FD                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    LFD30,X               ; 4
    sta    $AA                   ; 3
    lda    LFD34,X               ; 4
    sta    $AB                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBD7:
    .byte $11 ; |   X   X| $FBD7
    .byte $11 ; |   X   X| $FBD8
    .byte $11 ; |   X   X| $FBD9
    .byte $11 ; |   X   X| $FBDA
    .byte $31 ; |  XX   X| $FBDB
    .byte $11 ; |   X   X| $FBDC
    .byte $11 ; |   X   X| $FBDD
    .byte $11 ; |   X   X| $FBDE
    .byte $31 ; |  XX   X| $FBDF
    .byte $11 ; |   X   X| $FBE0
    .byte $11 ; |   X   X| $FBE1
LFBE2:
    .byte $20 ; |  X     | $FBE2
    .byte $40 ; | X      | $FBE3
    .byte $40 ; | X      | $FBE4
    .byte $20 ; |  X     | $FBE5
    .byte $20 ; |  X     | $FBE6
    .byte $40 ; | X      | $FBE7
    .byte $40 ; | X      | $FBE8
    .byte $20 ; |  X     | $FBE9
    .byte $20 ; |  X     | $FBEA
    .byte $40 ; | X      | $FBEB
    .byte $40 ; | X      | $FBEC
LFBED:
    .byte $00 ; |        | $FBED
    .byte $18 ; |   XX   | $FBEE
    .byte $3C ; |  XXXX  | $FBEF
    .byte $18 ; |   XX   | $FBF0
LFBF1:
    .byte $00 ; |        | $FBF1
    .byte $02 ; |      X | $FBF2
    .byte $04 ; |     X  | $FBF3
    .byte $08 ; |    X   | $FBF4
    .byte $06 ; |     XX | $FBF5
    .byte $3C ; |  XXXX  | $FBF6
    .byte $18 ; |   XX   | $FBF7
    .byte $00 ; |        | $FBF8
    .byte $02 ; |      X | $FBF9
    .byte $04 ; |     X  | $FBFA
    .byte $08 ; |    X   | $FBFB
    .byte $06 ; |     XX | $FBFC
    .byte $00 ; |        | $FBFD
    .byte $00 ; |        | $FBFE
    .byte $00 ; |        | $FBFF
    .byte $00 ; |        | $FC00
    .byte $00 ; |        | $FC01
    .byte $00 ; |        | $FC02
    .byte $00 ; |        | $FC03
    .byte $00 ; |        | $FC04
    .byte $00 ; |        | $FC05
    .byte $00 ; |        | $FC06
    .byte $00 ; |        | $FC07
    .byte $00 ; |        | $FC08
    .byte $00 ; |        | $FC09
    .byte $00 ; |        | $FC0A
    .byte $00 ; |        | $FC0B
    .byte $00 ; |        | $FC0C
    .byte $00 ; |        | $FC0D
    .byte $00 ; |        | $FC0E
    .byte $00 ; |        | $FC0F
    .byte $00 ; |        | $FC10
    .byte $00 ; |        | $FC11
    .byte $00 ; |        | $FC12
    .byte $00 ; |        | $FC13
    .byte $02 ; |      X | $FC14
    .byte $44 ; | X   X  | $FC15
    .byte $28 ; |  X X   | $FC16
    .byte $98 ; |X  XX   | $FC17
    .byte $66 ; | XX  XX | $FC18
    .byte $24 ; |  X  X  | $FC19
    .byte $52 ; | X X  X | $FC1A
    .byte $92 ; |X  X  X | $FC1B
    .byte $89 ; |X   X  X| $FC1C
    .byte $00 ; |        | $FC1D
    .byte $00 ; |        | $FC1E
    .byte $00 ; |        | $FC1F
    .byte $00 ; |        | $FC20
    .byte $00 ; |        | $FC21
    .byte $00 ; |        | $FC22
    .byte $00 ; |        | $FC23
    .byte $00 ; |        | $FC24
    .byte $00 ; |        | $FC25
    .byte $00 ; |        | $FC26
    .byte $00 ; |        | $FC27
    .byte $00 ; |        | $FC28
    .byte $00 ; |        | $FC29
    .byte $00 ; |        | $FC2A
    .byte $00 ; |        | $FC2B
    .byte $00 ; |        | $FC2C
    .byte $00 ; |        | $FC2D
    .byte $00 ; |        | $FC2E
    .byte $00 ; |        | $FC2F
    .byte $00 ; |        | $FC30
    .byte $00 ; |        | $FC31
    .byte $00 ; |        | $FC32
    .byte $00 ; |        | $FC33
    .byte $00 ; |        | $FC34
    .byte $08 ; |    X   | $FC35
    .byte $30 ; |  XX    | $FC36
    .byte $0E ; |    XXX | $FC37
    .byte $70 ; | XXX    | $FC38
    .byte $0C ; |    XX  | $FC39
    .byte $10 ; |   X    | $FC3A
    .byte $00 ; |        | $FC3B
    .byte $00 ; |        | $FC3C
    .byte $00 ; |        | $FC3D
    .byte $00 ; |        | $FC3E
    .byte $00 ; |        | $FC3F
    .byte $00 ; |        | $FC40
    .byte $00 ; |        | $FC41
    .byte $00 ; |        | $FC42
    .byte $00 ; |        | $FC43
    .byte $00 ; |        | $FC44
    .byte $00 ; |        | $FC45
    .byte $00 ; |        | $FC46
    .byte $00 ; |        | $FC47
    .byte $00 ; |        | $FC48
    .byte $00 ; |        | $FC49
    .byte $00 ; |        | $FC4A
    .byte $00 ; |        | $FC4B
    .byte $00 ; |        | $FC4C
    .byte $00 ; |        | $FC4D
    .byte $00 ; |        | $FC4E
    .byte $00 ; |        | $FC4F
    .byte $00 ; |        | $FC50
    .byte $00 ; |        | $FC51
    .byte $18 ; |   XX   | $FC52
    .byte $60 ; | XX     | $FC53
    .byte $80 ; |X       | $FC54
    .byte $60 ; | XX     | $FC55
    .byte $18 ; |   XX   | $FC56
    .byte $06 ; |     XX | $FC57
    .byte $01 ; |       X| $FC58
    .byte $06 ; |     XX | $FC59
    .byte $18 ; |   XX   | $FC5A
    .byte $60 ; | XX     | $FC5B
    .byte $80 ; |X       | $FC5C
    .byte $60 ; | XX     | $FC5D
    .byte $18 ; |   XX   | $FC5E
    .byte $00 ; |        | $FC5F
    .byte $00 ; |        | $FC60
    .byte $00 ; |        | $FC61
    .byte $00 ; |        | $FC62
    .byte $00 ; |        | $FC63
    .byte $00 ; |        | $FC64
    .byte $00 ; |        | $FC65
    .byte $00 ; |        | $FC66
    .byte $00 ; |        | $FC67
    .byte $00 ; |        | $FC68
    .byte $00 ; |        | $FC69
    .byte $00 ; |        | $FC6A
    .byte $00 ; |        | $FC6B
    .byte $00 ; |        | $FC6C
    .byte $00 ; |        | $FC6D
    .byte $00 ; |        | $FC6E
    .byte $00 ; |        | $FC6F
    .byte $00 ; |        | $FC70
    .byte $00 ; |        | $FC71
    .byte $00 ; |        | $FC72
    .byte $00 ; |        | $FC73
    .byte $01 ; |       X| $FC74
    .byte $02 ; |      X | $FC75
    .byte $E4 ; |XXX  X  | $FC76
    .byte $18 ; |   XX   | $FC77
    .byte $18 ; |   XX   | $FC78
    .byte $27 ; |  X  XXX| $FC79
    .byte $40 ; | X      | $FC7A
    .byte $80 ; |X       | $FC7B
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
    .byte $3C ; |  XXXX  | $FC94
    .byte $42 ; | X    X | $FC95
    .byte $92 ; |X  X  X | $FC96
    .byte $AA ; |X X X X | $FC97
    .byte $AA ; |X X X X | $FC98
    .byte $A2 ; |X X   X | $FC99
    .byte $9D ; |X  XXX X| $FC9A
    .byte $41 ; | X     X| $FC9B
    .byte $3E ; |  XXXXX | $FC9C
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
    .byte $55 ; | X X X X| $FCB3
    .byte $00 ; |        | $FCB4
    .byte $00 ; |        | $FCB5
    .byte $AA ; |X X X X | $FCB6
    .byte $00 ; |        | $FCB7
    .byte $00 ; |        | $FCB8
    .byte $55 ; | X X X X| $FCB9
    .byte $00 ; |        | $FCBA
    .byte $00 ; |        | $FCBB
    .byte $AA ; |X X X X | $FCBC
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
    .byte $32 ; |  XX  X | $FCD4
    .byte $2A ; |  X X X | $FCD5
    .byte $34 ; |  XX X  | $FCD6
    .byte $3C ; |  XXXX  | $FCD7
    .byte $74 ; | XXX X  | $FCD8
    .byte $A8 ; |X X X   | $FCD9
    .byte $D8 ; |XX XX   | $FCDA
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
LFCF0:
    .byte $10 ; |   X    | $FCF0
    .byte $0F ; |    XXXX| $FCF1
    .byte $0E ; |    XXX | $FCF2
    .byte $0D ; |    XX X| $FCF3
    .byte $0C ; |    XX  | $FCF4
    .byte $0B ; |    X XX| $FCF5
    .byte $0A ; |    X X | $FCF6
    .byte $09 ; |    X  X| $FCF7
    .byte $08 ; |    X   | $FCF8
    .byte $07 ; |     XXX| $FCF9
    .byte $06 ; |     XX | $FCFA
    .byte $05 ; |     X X| $FCFB
    .byte $04 ; |     X  | $FCFC
    .byte $03 ; |      XX| $FCFD
    .byte $02 ; |      X | $FCFE
    .byte $01 ; |       X| $FCFF
LFD00:
    .byte $08 ; |    X   | $FD00
    .byte $0C ; |    XX  | $FD01
    .byte $10 ; |   X    | $FD02
    .byte $14 ; |   X X  | $FD03
    .byte $18 ; |   XX   | $FD04
    .byte $1C ; |   XXX  | $FD05
    .byte $20 ; |  X     | $FD06
LFD07:
    .byte $24 ; |  X  X  | $FD07
    .byte $F0 ; |XXXX    | $FD08
    .byte $F0 ; |XXXX    | $FD09
    .byte $F0 ; |XXXX    | $FD0A
    .byte $F0 ; |XXXX    | $FD0B
    .byte $10 ; |   X    | $FD0C
    .byte $10 ; |   X    | $FD0D
    .byte $10 ; |   X    | $FD0E
    .byte $10 ; |   X    | $FD0F
LFD10:
    .byte $7F ; | XXXXXXX| $FD10
    .byte $6F ; | XX XXXX| $FD11
    .byte $5F ; | X XXXXX| $FD12
    .byte $4F ; | X  XXXX| $FD13
    .byte $42 ; | X    X | $FD14
    .byte $3A ; |  XXX X | $FD15
    .byte $32 ; |  XX  X | $FD16
    .byte $2A ; |  X X X | $FD17
LFD18:
    .byte $FF ; |XXXXXXXX| $FD18
    .byte $FF ; |XXXXXXXX| $FD19
    .byte $7F ; | XXXXXXX| $FD1A
    .byte $3F ; |  XXXXXX| $FD1B
    .byte $1F ; |   XXXXX| $FD1C
    .byte $0F ; |    XXXX| $FD1D
    .byte $07 ; |     XXX| $FD1E
    .byte $03 ; |      XX| $FD1F
LFD20:
    .byte $00 ; |        | $FD20
    .byte $00 ; |        | $FD21
    .byte $00 ; |        | $FD22
    .byte $00 ; |        | $FD23
    .byte $00 ; |        | $FD24
    .byte $F0 ; |XXXX    | $FD25
    .byte $10 ; |   X    | $FD26
    .byte $00 ; |        | $FD27
    .byte $00 ; |        | $FD28
    .byte $10 ; |   X    | $FD29
    .byte $F0 ; |XXXX    | $FD2A
    .byte $00 ; |        | $FD2B
    .byte $00 ; |        | $FD2C
    .byte $20 ; |  X     | $FD2D
    .byte $20 ; |  X     | $FD2E
    .byte $20 ; |  X     | $FD2F
LFD30:
    .byte $02 ; |      X | $FD30
    .byte $02 ; |      X | $FD31
    .byte $7A ; | XXXX X | $FD32
    .byte $7A ; | XXXX X | $FD33
LFD34:
    .byte $02 ; |      X | $FD34
    .byte $6F ; | XX XXXX| $FD35
    .byte $6F ; | XX XXXX| $FD36
    .byte $02 ; |      X | $FD37
LFD38:
    .byte $42 ; | X    X | $FD38
    .byte $82 ; |X     X | $FD39
    .byte $42 ; | X    X | $FD3A
    .byte $02 ; |      X | $FD3B
LFD3C:
    .byte $82 ; |X     X | $FD3C
    .byte $42 ; | X    X | $FD3D
    .byte $02 ; |      X | $FD3E
    .byte $42 ; | X    X | $FD3F

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD40 SUBROUTINE
    lda    $84                   ; 3
    bne    LFD63                 ; 2³
    sed                          ; 2
    lda    $E0                   ; 3
    clc                          ; 2
    adc    $9B                   ; 3
    sta    $E0                   ; 3
    lda    $E1                   ; 3
    adc    $9C                   ; 3
    sta    $E1                   ; 3
    cld                          ; 2
    bcc    LFD5B                 ; 2³
    inc    $83                   ; 5
    lda    #$40                  ; 2
    sta    $DF                   ; 3
LFD5B:
    sed                          ; 2
    lda    $E2                   ; 3
    adc    #0                    ; 2
    sta    $E2                   ; 3
    cld                          ; 2
LFD63:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD64 SUBROUTINE
    clc                          ; 2
    adc    $C8,X                 ; 4
    sta    $C8,X                 ; 4
    lda    $CC,X                 ; 4
    adc    #0                    ; 2
    sta    $CC,X                 ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD70:
    .byte $00 ; |        | $FD70
    .byte $00 ; |        | $FD71
    .byte $00 ; |        | $FD72
    .byte $00 ; |        | $FD73
    .byte $00 ; |        | $FD74
    .byte $07 ; |     XXX| $FD75
    .byte $00 ; |        | $FD76
    .byte $00 ; |        | $FD77
LFD78:
    .byte $00 ; |        | $FD78
    .byte $00 ; |        | $FD79
    .byte $00 ; |        | $FD7A
    .byte $40 ; | X      | $FD7B
    .byte $40 ; | X      | $FD7C
    .byte $E0 ; |XXX     | $FD7D
    .byte $40 ; | X      | $FD7E
    .byte $40 ; | X      | $FD7F
    .byte $00 ; |        | $FD80
    .byte $7F ; | XXXXXXX| $FD81
    .byte $43 ; | X    XX| $FD82
    .byte $43 ; | X    XX| $FD83
    .byte $43 ; | X    XX| $FD84
    .byte $41 ; | X     X| $FD85
    .byte $41 ; | X     X| $FD86
    .byte $7F ; | XXXXXXX| $FD87
    .byte $00 ; |        | $FD88
    .byte $18 ; |   XX   | $FD89
    .byte $18 ; |   XX   | $FD8A
    .byte $18 ; |   XX   | $FD8B
    .byte $18 ; |   XX   | $FD8C
    .byte $08 ; |    X   | $FD8D
    .byte $08 ; |    X   | $FD8E
    .byte $08 ; |    X   | $FD8F
    .byte $00 ; |        | $FD90
    .byte $7F ; | XXXXXXX| $FD91
    .byte $60 ; | XX     | $FD92
    .byte $60 ; | XX     | $FD93
    .byte $7F ; | XXXXXXX| $FD94
    .byte $01 ; |       X| $FD95
    .byte $41 ; | X     X| $FD96
    .byte $7F ; | XXXXXXX| $FD97
    .byte $00 ; |        | $FD98
    .byte $7F ; | XXXXXXX| $FD99
    .byte $43 ; | X    XX| $FD9A
    .byte $03 ; |      XX| $FD9B
    .byte $3F ; |  XXXXXX| $FD9C
    .byte $02 ; |      X | $FD9D
    .byte $42 ; | X    X | $FD9E
    .byte $7E ; | XXXXXX | $FD9F
    .byte $00 ; |        | $FDA0
    .byte $06 ; |     XX | $FDA1
    .byte $06 ; |     XX | $FDA2
    .byte $06 ; |     XX | $FDA3
    .byte $7F ; | XXXXXXX| $FDA4
    .byte $42 ; | X    X | $FDA5
    .byte $42 ; | X    X | $FDA6
    .byte $42 ; | X    X | $FDA7
    .byte $00 ; |        | $FDA8
    .byte $7F ; | XXXXXXX| $FDA9
    .byte $43 ; | X    XX| $FDAA
    .byte $03 ; |      XX| $FDAB
    .byte $7F ; | XXXXXXX| $FDAC
    .byte $40 ; | X      | $FDAD
    .byte $40 ; | X      | $FDAE
    .byte $7F ; | XXXXXXX| $FDAF
    .byte $00 ; |        | $FDB0
    .byte $7F ; | XXXXXXX| $FDB1
    .byte $43 ; | X    XX| $FDB2
    .byte $43 ; | X    XX| $FDB3
    .byte $7F ; | XXXXXXX| $FDB4
    .byte $40 ; | X      | $FDB5
    .byte $41 ; | X     X| $FDB6
    .byte $7F ; | XXXXXXX| $FDB7
    .byte $00 ; |        | $FDB8
    .byte $03 ; |      XX| $FDB9
    .byte $03 ; |      XX| $FDBA
    .byte $03 ; |      XX| $FDBB
    .byte $03 ; |      XX| $FDBC
    .byte $01 ; |       X| $FDBD
    .byte $01 ; |       X| $FDBE
    .byte $3F ; |  XXXXXX| $FDBF
    .byte $00 ; |        | $FDC0
    .byte $7F ; | XXXXXXX| $FDC1
    .byte $43 ; | X    XX| $FDC2
    .byte $43 ; | X    XX| $FDC3
    .byte $7F ; | XXXXXXX| $FDC4
    .byte $22 ; |  X   X | $FDC5
    .byte $22 ; |  X   X | $FDC6
    .byte $3E ; |  XXXXX | $FDC7
    .byte $00 ; |        | $FDC8
    .byte $03 ; |      XX| $FDC9
    .byte $03 ; |      XX| $FDCA
    .byte $03 ; |      XX| $FDCB
    .byte $7F ; | XXXXXXX| $FDCC
    .byte $41 ; | X     X| $FDCD
    .byte $41 ; | X     X| $FDCE
    .byte $7F ; | XXXXXXX| $FDCF
    .byte $00 ; |        | $FDD0
    .byte $00 ; |        | $FDD1
    .byte $00 ; |        | $FDD2
    .byte $00 ; |        | $FDD3
    .byte $00 ; |        | $FDD4
    .byte $00 ; |        | $FDD5
    .byte $00 ; |        | $FDD6
    .byte $00 ; |        | $FDD7
LFDD8:
    .byte $70 ; | XXX    | $FDD8
    .byte $60 ; | XX     | $FDD9
    .byte $50 ; | X X    | $FDDA
    .byte $40 ; | X      | $FDDB
    .byte $30 ; |  XX    | $FDDC
    .byte $20 ; |  X     | $FDDD
    .byte $10 ; |   X    | $FDDE
    .byte $00 ; |        | $FDDF
    .byte $F0 ; |XXXX    | $FDE0
    .byte $E0 ; |XXX     | $FDE1
    .byte $D0 ; |XX X    | $FDE2
    .byte $C0 ; |XX      | $FDE3
    .byte $B0 ; |X XX    | $FDE4
    .byte $A0 ; |X X     | $FDE5
LFDE6:
    .byte $90 ; |X  X    | $FDE6
    .byte $F0 ; |XXXX    | $FDE7
    .byte $F1 ; |XXXX   X| $FDE8
    .byte $F3 ; |XXXX  XX| $FDE9
    .byte $F3 ; |XXXX  XX| $FDEA
    .byte $F3 ; |XXXX  XX| $FDEB
    .byte $F3 ; |XXXX  XX| $FDEC
    .byte $F3 ; |XXXX  XX| $FDED
    .byte $F3 ; |XXXX  XX| $FDEE
    .byte $F3 ; |XXXX  XX| $FDEF
LFDF0:
    .byte $00 ; |        | $FDF0
    .byte $01 ; |       X| $FDF1
    .byte $01 ; |       X| $FDF2
    .byte $01 ; |       X| $FDF3
    .byte $00 ; |        | $FDF4
    .byte $FF ; |XXXXXXXX| $FDF5
    .byte $FF ; |XXXXXXXX| $FDF6
    .byte $FF ; |XXXXXXXX| $FDF7
LFDF8:
    .byte $01 ; |       X| $FDF8
    .byte $01 ; |       X| $FDF9
    .byte $00 ; |        | $FDFA
    .byte $FF ; |XXXXXXXX| $FDFB
    .byte $FF ; |XXXXXXXX| $FDFC
    .byte $FF ; |XXXXXXXX| $FDFD
    .byte $00 ; |        | $FDFE
    .byte $01 ; |       X| $FDFF
    .byte $00 ; |        | $FE00
    .byte $00 ; |        | $FE01
    .byte $00 ; |        | $FE02
    .byte $00 ; |        | $FE03
    .byte $00 ; |        | $FE04
    .byte $00 ; |        | $FE05
    .byte $00 ; |        | $FE06
    .byte $00 ; |        | $FE07
    .byte $00 ; |        | $FE08
    .byte $00 ; |        | $FE09
    .byte $00 ; |        | $FE0A
    .byte $00 ; |        | $FE0B
    .byte $00 ; |        | $FE0C
    .byte $00 ; |        | $FE0D
    .byte $00 ; |        | $FE0E
    .byte $00 ; |        | $FE0F
    .byte $00 ; |        | $FE10
    .byte $00 ; |        | $FE11
    .byte $00 ; |        | $FE12
    .byte $00 ; |        | $FE13
    .byte $00 ; |        | $FE14
    .byte $92 ; |X  X  X | $FE15
    .byte $54 ; | X X X  | $FE16
    .byte $38 ; |  XXX   | $FE17
    .byte $FE ; |XXXXXXX | $FE18
    .byte $38 ; |  XXX   | $FE19
    .byte $54 ; | X X X  | $FE1A
    .byte $92 ; |X  X  X | $FE1B
    .byte $00 ; |        | $FE1C
    .byte $00 ; |        | $FE1D
    .byte $00 ; |        | $FE1E
    .byte $00 ; |        | $FE1F
    .byte $00 ; |        | $FE20
    .byte $00 ; |        | $FE21
    .byte $00 ; |        | $FE22
    .byte $00 ; |        | $FE23
    .byte $00 ; |        | $FE24
    .byte $00 ; |        | $FE25
    .byte $00 ; |        | $FE26
    .byte $00 ; |        | $FE27
    .byte $00 ; |        | $FE28
    .byte $00 ; |        | $FE29
    .byte $00 ; |        | $FE2A
    .byte $00 ; |        | $FE2B
    .byte $00 ; |        | $FE2C
    .byte $00 ; |        | $FE2D
    .byte $00 ; |        | $FE2E
    .byte $00 ; |        | $FE2F
    .byte $00 ; |        | $FE30
    .byte $00 ; |        | $FE31
    .byte $00 ; |        | $FE32
    .byte $00 ; |        | $FE33
    .byte $00 ; |        | $FE34
    .byte $00 ; |        | $FE35
    .byte $00 ; |        | $FE36
    .byte $0F ; |    XXXX| $FE37
    .byte $0F ; |    XXXX| $FE38
    .byte $00 ; |        | $FE39
    .byte $00 ; |        | $FE3A
    .byte $00 ; |        | $FE3B
    .byte $00 ; |        | $FE3C
    .byte $00 ; |        | $FE3D
    .byte $00 ; |        | $FE3E
    .byte $00 ; |        | $FE3F
    .byte $00 ; |        | $FE40
    .byte $00 ; |        | $FE41
    .byte $00 ; |        | $FE42
    .byte $00 ; |        | $FE43
    .byte $00 ; |        | $FE44
    .byte $00 ; |        | $FE45
    .byte $00 ; |        | $FE46
    .byte $00 ; |        | $FE47
    .byte $00 ; |        | $FE48
    .byte $00 ; |        | $FE49
    .byte $00 ; |        | $FE4A
    .byte $00 ; |        | $FE4B
    .byte $00 ; |        | $FE4C
    .byte $00 ; |        | $FE4D
    .byte $00 ; |        | $FE4E
    .byte $00 ; |        | $FE4F
    .byte $00 ; |        | $FE50
    .byte $00 ; |        | $FE51
    .byte $00 ; |        | $FE52
    .byte $00 ; |        | $FE53
    .byte $00 ; |        | $FE54
    .byte $00 ; |        | $FE55
    .byte $0F ; |    XXXX| $FE56
    .byte $0F ; |    XXXX| $FE57
    .byte $0F ; |    XXXX| $FE58
    .byte $0F ; |    XXXX| $FE59
    .byte $0F ; |    XXXX| $FE5A
    .byte $0F ; |    XXXX| $FE5B
    .byte $00 ; |        | $FE5C
    .byte $00 ; |        | $FE5D
    .byte $00 ; |        | $FE5E
    .byte $00 ; |        | $FE5F
    .byte $00 ; |        | $FE60
    .byte $00 ; |        | $FE61
    .byte $00 ; |        | $FE62
    .byte $00 ; |        | $FE63
    .byte $00 ; |        | $FE64
    .byte $00 ; |        | $FE65
    .byte $00 ; |        | $FE66
    .byte $00 ; |        | $FE67
    .byte $00 ; |        | $FE68
    .byte $00 ; |        | $FE69
    .byte $00 ; |        | $FE6A
    .byte $00 ; |        | $FE6B
    .byte $00 ; |        | $FE6C
    .byte $00 ; |        | $FE6D
    .byte $00 ; |        | $FE6E
    .byte $00 ; |        | $FE6F
    .byte $00 ; |        | $FE70
    .byte $00 ; |        | $FE71
    .byte $00 ; |        | $FE72
    .byte $00 ; |        | $FE73
    .byte $00 ; |        | $FE74
    .byte $6C ; | XX XX  | $FE75
    .byte $AA ; |X X X X | $FE76
    .byte $C6 ; |XX   XX | $FE77
    .byte $00 ; |        | $FE78
    .byte $C6 ; |XX   XX | $FE79
    .byte $AA ; |X X X X | $FE7A
    .byte $6C ; | XX XX  | $FE7B
    .byte $00 ; |        | $FE7C
    .byte $00 ; |        | $FE7D
    .byte $00 ; |        | $FE7E
    .byte $00 ; |        | $FE7F
    .byte $00 ; |        | $FE80
    .byte $00 ; |        | $FE81
    .byte $00 ; |        | $FE82
    .byte $00 ; |        | $FE83
    .byte $00 ; |        | $FE84
    .byte $00 ; |        | $FE85
    .byte $00 ; |        | $FE86
    .byte $00 ; |        | $FE87
    .byte $00 ; |        | $FE88
    .byte $00 ; |        | $FE89
    .byte $00 ; |        | $FE8A
    .byte $00 ; |        | $FE8B
    .byte $00 ; |        | $FE8C
    .byte $00 ; |        | $FE8D
    .byte $00 ; |        | $FE8E
    .byte $00 ; |        | $FE8F
    .byte $00 ; |        | $FE90
    .byte $00 ; |        | $FE91
    .byte $00 ; |        | $FE92
    .byte $00 ; |        | $FE93
    .byte $82 ; |X     X | $FE94
    .byte $00 ; |        | $FE95
    .byte $10 ; |   X    | $FE96
    .byte $00 ; |        | $FE97
    .byte $38 ; |  XXX   | $FE98
    .byte $00 ; |        | $FE99
    .byte $10 ; |   X    | $FE9A
    .byte $00 ; |        | $FE9B
    .byte $82 ; |X     X | $FE9C
    .byte $00 ; |        | $FE9D
    .byte $00 ; |        | $FE9E
    .byte $00 ; |        | $FE9F
    .byte $00 ; |        | $FEA0
    .byte $00 ; |        | $FEA1
    .byte $00 ; |        | $FEA2
    .byte $00 ; |        | $FEA3
    .byte $00 ; |        | $FEA4
    .byte $00 ; |        | $FEA5
    .byte $00 ; |        | $FEA6
    .byte $00 ; |        | $FEA7
    .byte $00 ; |        | $FEA8
    .byte $00 ; |        | $FEA9
    .byte $00 ; |        | $FEAA
    .byte $00 ; |        | $FEAB
    .byte $00 ; |        | $FEAC
    .byte $00 ; |        | $FEAD
    .byte $00 ; |        | $FEAE
    .byte $00 ; |        | $FEAF
LFEB0:
    .byte $FF ; |XXXXXXXX| $FEB0
    .byte $FE ; |XXXXXXX | $FEB1
    .byte $FB ; |XXXXX XX| $FEB2
    .byte $EE ; |XXX XXX | $FEB3
    .byte $DD ; |XX XXX X| $FEB4
    .byte $DB ; |XX XX XX| $FEB5
    .byte $6D ; | XX XX X| $FEB6
    .byte $55 ; | X X X X| $FEB7
    .byte $AA ; |X X X X | $FEB8
    .byte $92 ; |X  X  X | $FEB9
    .byte $24 ; |  X  X  | $FEBA
    .byte $22 ; |  X   X | $FEBB
    .byte $11 ; |   X   X| $FEBC
    .byte $04 ; |     X  | $FEBD
    .byte $01 ; |       X| $FEBE
    .byte $00 ; |        | $FEBF
LFEC0:
    .byte $FF ; |XXXXXXXX| $FEC0
    .byte $FF ; |XXXXXXXX| $FEC1
    .byte $EF ; |XXX XXXX| $FEC2
    .byte $EF ; |XXX XXXX| $FEC3
    .byte $BB ; |X XXX XX| $FEC4
    .byte $6D ; | XX XX X| $FEC5
    .byte $B6 ; |X XX XX | $FEC6
    .byte $55 ; | X X X X| $FEC7
    .byte $A8 ; |X X X   | $FEC8
    .byte $49 ; | X  X  X| $FEC9
    .byte $92 ; |X  X  X | $FECA
    .byte $44 ; | X   X  | $FECB
    .byte $10 ; |   X    | $FECC
    .byte $10 ; |   X    | $FECD
    .byte $00 ; |        | $FECE
    .byte $00 ; |        | $FECF
LFED0:
    .byte $0F ; |    XXXX| $FED0
    .byte $07 ; |     XXX| $FED1
    .byte $07 ; |     XXX| $FED2
    .byte $03 ; |      XX| $FED3
    .byte $03 ; |      XX| $FED4
    .byte $01 ; |       X| $FED5
    .byte $01 ; |       X| $FED6
    .byte $00 ; |        | $FED7
LFED8:
    .byte $07 ; |     XXX| $FED8
    .byte $03 ; |      XX| $FED9
    .byte $03 ; |      XX| $FEDA
    .byte $03 ; |      XX| $FEDB
    .byte $01 ; |       X| $FEDC
    .byte $01 ; |       X| $FEDD
    .byte $00 ; |        | $FEDE
    .byte $00 ; |        | $FEDF
LFEE0:
    .byte $25 ; |  X  X X| $FEE0
    .byte $00 ; |        | $FEE1
    .byte $50 ; | X X    | $FEE2
    .byte $00 ; |        | $FEE3
    .byte $00 ; |        | $FEE4
    .byte $00 ; |        | $FEE5
    .byte $00 ; |        | $FEE6
    .byte $00 ; |        | $FEE7
LFEE8:
    .byte $00 ; |        | $FEE8
    .byte $01 ; |       X| $FEE9
    .byte $00 ; |        | $FEEA
    .byte $04 ; |     X  | $FEEB
    .byte $02 ; |      X | $FEEC
    .byte $00 ; |        | $FEED
    .byte $00 ; |        | $FEEE
    .byte $00 ; |        | $FEEF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFEF0 SUBROUTINE
    sta    $9B                   ; 3
    lda    $C8,X                 ; 4
    sec                          ; 2
    sbc    $9B                   ; 3
    sta    $C8,X                 ; 4
    lda    $CC,X                 ; 4
    sbc    #0                    ; 2
    sta    $CC,X                 ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $00 ; |        | $FF00
    .byte $00 ; |        | $FF01
    .byte $00 ; |        | $FF02
    .byte $00 ; |        | $FF03
    .byte $00 ; |        | $FF04
    .byte $00 ; |        | $FF05
    .byte $00 ; |        | $FF06
    .byte $00 ; |        | $FF07
    .byte $00 ; |        | $FF08
    .byte $00 ; |        | $FF09
    .byte $00 ; |        | $FF0A
    .byte $00 ; |        | $FF0B
    .byte $00 ; |        | $FF0C
    .byte $00 ; |        | $FF0D
    .byte $00 ; |        | $FF0E
    .byte $00 ; |        | $FF0F
    .byte $00 ; |        | $FF10
    .byte $00 ; |        | $FF11
    .byte $00 ; |        | $FF12
    .byte $00 ; |        | $FF13
    .byte $00 ; |        | $FF14
    .byte $00 ; |        | $FF15
    .byte $00 ; |        | $FF16
    .byte $00 ; |        | $FF17
    .byte $00 ; |        | $FF18
    .byte $00 ; |        | $FF19
    .byte $00 ; |        | $FF1A
    .byte $80 ; |X       | $FF1B
    .byte $00 ; |        | $FF1C
    .byte $80 ; |X       | $FF1D
    .byte $00 ; |        | $FF1E
    .byte $C0 ; |XX      | $FF1F
    .byte $00 ; |        | $FF20
    .byte $00 ; |        | $FF21
    .byte $00 ; |        | $FF22
    .byte $00 ; |        | $FF23
    .byte $00 ; |        | $FF24
    .byte $00 ; |        | $FF25
    .byte $00 ; |        | $FF26
    .byte $00 ; |        | $FF27
    .byte $00 ; |        | $FF28
    .byte $00 ; |        | $FF29
    .byte $00 ; |        | $FF2A
    .byte $00 ; |        | $FF2B
    .byte $00 ; |        | $FF2C
    .byte $00 ; |        | $FF2D
    .byte $00 ; |        | $FF2E
    .byte $00 ; |        | $FF2F
    .byte $00 ; |        | $FF30
    .byte $C0 ; |XX      | $FF31
    .byte $00 ; |        | $FF32
    .byte $80 ; |X       | $FF33
    .byte $00 ; |        | $FF34
    .byte $80 ; |X       | $FF35
    .byte $00 ; |        | $FF36
    .byte $00 ; |        | $FF37
    .byte $00 ; |        | $FF38
    .byte $00 ; |        | $FF39
    .byte $00 ; |        | $FF3A
    .byte $00 ; |        | $FF3B
    .byte $00 ; |        | $FF3C
    .byte $00 ; |        | $FF3D
    .byte $00 ; |        | $FF3E
    .byte $00 ; |        | $FF3F
    .byte $00 ; |        | $FF40
    .byte $00 ; |        | $FF41
    .byte $00 ; |        | $FF42
    .byte $00 ; |        | $FF43
    .byte $00 ; |        | $FF44
    .byte $00 ; |        | $FF45
    .byte $00 ; |        | $FF46
    .byte $00 ; |        | $FF47
    .byte $00 ; |        | $FF48
    .byte $00 ; |        | $FF49
    .byte $00 ; |        | $FF4A
    .byte $00 ; |        | $FF4B
    .byte $00 ; |        | $FF4C
    .byte $00 ; |        | $FF4D
    .byte $00 ; |        | $FF4E
    .byte $00 ; |        | $FF4F
    .byte $00 ; |        | $FF50
    .byte $00 ; |        | $FF51
    .byte $00 ; |        | $FF52
    .byte $80 ; |X       | $FF53
    .byte $00 ; |        | $FF54
    .byte $C0 ; |XX      | $FF55
    .byte $00 ; |        | $FF56
    .byte $E0 ; |XXX     | $FF57
    .byte $00 ; |        | $FF58
    .byte $E0 ; |XXX     | $FF59
    .byte $00 ; |        | $FF5A
    .byte $C0 ; |XX      | $FF5B
    .byte $00 ; |        | $FF5C
    .byte $80 ; |X       | $FF5D
    .byte $00 ; |        | $FF5E
    .byte $00 ; |        | $FF5F
    .byte $00 ; |        | $FF60
    .byte $00 ; |        | $FF61
    .byte $00 ; |        | $FF62
    .byte $00 ; |        | $FF63
    .byte $00 ; |        | $FF64
    .byte $00 ; |        | $FF65
    .byte $00 ; |        | $FF66
    .byte $00 ; |        | $FF67
    .byte $00 ; |        | $FF68
    .byte $00 ; |        | $FF69
    .byte $00 ; |        | $FF6A
    .byte $00 ; |        | $FF6B
    .byte $00 ; |        | $FF6C
    .byte $00 ; |        | $FF6D
    .byte $00 ; |        | $FF6E
    .byte $00 ; |        | $FF6F
    .byte $00 ; |        | $FF70
    .byte $00 ; |        | $FF71
    .byte $00 ; |        | $FF72
    .byte $00 ; |        | $FF73
    .byte $00 ; |        | $FF74
    .byte $00 ; |        | $FF75
    .byte $00 ; |        | $FF76
    .byte $00 ; |        | $FF77
    .byte $00 ; |        | $FF78
    .byte $00 ; |        | $FF79
    .byte $00 ; |        | $FF7A
    .byte $00 ; |        | $FF7B
    .byte $00 ; |        | $FF7C
    .byte $00 ; |        | $FF7D
    .byte $00 ; |        | $FF7E
    .byte $50 ; | X X    | $FF7F
    .byte $00 ; |        | $FF80
    .byte $00 ; |        | $FF81
    .byte $00 ; |        | $FF82
    .byte $00 ; |        | $FF83
    .byte $00 ; |        | $FF84
    .byte $00 ; |        | $FF85
    .byte $00 ; |        | $FF86
    .byte $00 ; |        | $FF87
    .byte $00 ; |        | $FF88
    .byte $00 ; |        | $FF89
    .byte $00 ; |        | $FF8A
    .byte $00 ; |        | $FF8B
    .byte $00 ; |        | $FF8C
    .byte $00 ; |        | $FF8D
    .byte $00 ; |        | $FF8E
    .byte $00 ; |        | $FF8F
    .byte $00 ; |        | $FF90
    .byte $00 ; |        | $FF91
    .byte $00 ; |        | $FF92
    .byte $00 ; |        | $FF93
    .byte $00 ; |        | $FF94
    .byte $00 ; |        | $FF95
    .byte $00 ; |        | $FF96
    .byte $00 ; |        | $FF97
    .byte $00 ; |        | $FF98
    .byte $00 ; |        | $FF99
    .byte $00 ; |        | $FF9A
    .byte $00 ; |        | $FF9B
    .byte $00 ; |        | $FF9C
    .byte $00 ; |        | $FF9D
    .byte $00 ; |        | $FF9E
    .byte $4A ; | X  X X | $FF9F
    .byte $00 ; |        | $FFA0
    .byte $00 ; |        | $FFA1
    .byte $00 ; |        | $FFA2
    .byte $00 ; |        | $FFA3
    .byte $00 ; |        | $FFA4
    .byte $00 ; |        | $FFA5
    .byte $00 ; |        | $FFA6
    .byte $00 ; |        | $FFA7
    .byte $00 ; |        | $FFA8
    .byte $00 ; |        | $FFA9
    .byte $00 ; |        | $FFAA
    .byte $00 ; |        | $FFAB
    .byte $00 ; |        | $FFAC
    .byte $00 ; |        | $FFAD
    .byte $00 ; |        | $FFAE
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
    .byte $55 ; | X X X X| $FFBF
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
    .byte $04 ; |     X  | $FFD3
    .byte $00 ; |        | $FFD4
    .byte $06 ; |     XX | $FFD5
    .byte $00 ; |        | $FFD6
    .byte $07 ; |     XXX| $FFD7
    .byte $00 ; |        | $FFD8
    .byte $07 ; |     XXX| $FFD9
    .byte $00 ; |        | $FFDA
    .byte $06 ; |     XX | $FFDB
    .byte $00 ; |        | $FFDC
    .byte $04 ; |     X  | $FFDD
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
LFFF0:
    .byte $00 ; |        | $FFF0
    .byte $20 ; |  X     | $FFF1
    .byte $40 ; | X      | $FFF2
    .byte $60 ; | XX     | $FFF3
    .byte $80 ; |X       | $FFF4
    .byte $20 ; |  X     | $FFF5
    .byte $60 ; | XX     | $FFF6
    .byte $80 ; |X       | $FFF7
LFFF8:
    .byte $00 ; |        | $FFF8
    .byte $92 ; |X  X  X | $FFF9
    .byte $7C ; | XXXXX  | $FFFA
    .byte $92 ; |X  X  X | $FFFB

       ORG $FFFC

    .word START,START