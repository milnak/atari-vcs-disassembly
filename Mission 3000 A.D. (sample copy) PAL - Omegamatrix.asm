; Rough Disassembly of Mission 3000 A.D. (sample copy) PAL
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: distella -pasfcM3Smpl.cfg M3Smpl.bin > Mission3000AD(re)Sample.asm
;
; M3Smpl.cfg contents:
;
;      ORG 7000
;      CODE 7000 7A3F
;      GFX 7A40 7A65
;      CODE 7A66 7D42
;      GFX 7D43 7D46
;      CODE 7D47 7DA8
;      GFX 7DA9 7EE1
;      CODE 7EE2 7EF3
;      GFX 7EF4 7F57
;      CODE 7F58 7FEE
;      GFX 7FEF 7FFF

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
RESP1   =  $11
RESM0   =  $12
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
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
HMM1    =  $23
HMBL    =  $24
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C

; Read TIA Baseline = $00
CXM0P   =  $00
CXM1P   =  $01
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SWITCHES
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; only one on at a time!
; 0 = off, 1 = on

SAMPLE_COPY  = 1
BITCORP      = 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


       ORG $7000

START:
    cld                          ; 2
    ldx    #0                    ; 2
    lda    #0                    ; 2
L7005:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    L7005                 ; 2³

    lda    #$22                  ; 2
    sta    $A7                   ; 3
    sta    TIM64T                ; 4
    lda    #1                    ; 2
    sta    $A5                   ; 3
    lda    #0                    ; 2
    sta    $81                   ; 3
    sta    $8B                   ; 3
    lda    #$78                  ; 2
    sta    $8F                   ; 3
    jsr    L742B                 ; 6
L7023:
    lda    INTIM                 ; 4
    bne    L7023                 ; 2³
    lda    #$82                  ; 2
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
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    VSYNC                 ; 3
    sta    VBLANK                ; 3
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    lda    #$43                  ; 2
    sta    TIM64T                ; 4
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    bne    L706C                 ; 2³
    ldx    #1                    ; 2
    stx    $A7                   ; 3
    stx    $A5                   ; 3
    lda    #0                    ; 2
    sta    $8B                   ; 3
    sta    $BF                   ; 3
    sta    $C0                   ; 3
    sta    $81                   ; 3
L706C:
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    bne    L70A8                 ; 2³
    lda    #0                    ; 2
    sta    $8B                   ; 3
    sta    $8D                   ; 3
    sta    $A7                   ; 3
    sta    $BF                   ; 3
    sta    $81                   ; 3
    sta    $C0                   ; 3
    sta    $C1                   ; 3
    sta    $82                   ; 3
    lda    #6                    ; 2
    sta    $80                   ; 3
L7089:
    jsr    L742B                 ; 6
    lda    $A5                   ; 3
    jsr    L751C                 ; 6
    sta    $A1                   ; 3
    dec    $A1                   ; 5
    lda    #$50                  ; 2
    sta    $9F                   ; 3
    lda    #$24                  ; 2
    sta    $A0                   ; 3
    lda    #$FF                  ; 2
    sta    $E0                   ; 3
    sta    $A9                   ; 3
    sta    $A3                   ; 3
    jmp    L70E7                 ; 3

L70A8:
    lda    #$FE                  ; 2
    sta    $E0                   ; 3
    lda    $81                   ; 3
    beq    L70C5                 ; 2³
    lda    #$FF                  ; 2
    sta    $B1                   ; 3
    sta    $B4                   ; 3
    sta    $B7                   ; 3
    sta    $BA                   ; 3
    sta    $BD                   ; 3
    sta    $A0                   ; 3
    lda    #$61                  ; 2
    sta    $9E                   ; 3
    jmp    L70E7                 ; 3

L70C5:
    lda    $A7                   ; 3
    bne    L7089                 ; 2³
    lda    $82                   ; 3
    beq    L70D2                 ; 2³
    dec    $82                   ; 5
    jmp    L7089                 ; 3

L70D2:
    jsr    L7837                 ; 6
    lda    $AE                   ; 3
    and    #$01                  ; 2
    beq    L70E1                 ; 2³
    jsr    L7A66                 ; 6
    jmp    L70E4                 ; 3

L70E1:
    jsr    L76C6                 ; 6
L70E4:
    jsr    L7AD4                 ; 6
L70E7:
    lda    $B9                   ; 3
    ldx    #2                    ; 2
    jsr    L7EE2                 ; 6
    lda    $BC                   ; 3
    ldx    #3                    ; 2
    jsr    L7EE2                 ; 6
    lda    $8E                   ; 3
    ldx    #4                    ; 2
    jsr    L7EE2                 ; 6
L70FC:
    lda    INTIM                 ; 4
    bne    L70FC                 ; 2³
    lda    #$6A                  ; 2
    ldx    #0                    ; 2
    ldy    #$C6                  ; 2
    jsr    L7456                 ; 6
    lda    $81                   ; 3
    and    #$F3                  ; 2
    ora    #$01                  ; 2
    sta    COLUBK                ; 3
    lda    #$AE                  ; 2
    sta    TIM64T                ; 4
    lda    #$1C                  ; 2
    sta    $D4                   ; 3
    lda    #$48                  ; 2
    sta    $D8                   ; 3
    lda    #$FE                  ; 2
    sta    $D7                   ; 3
    ldx    #$FF                  ; 2
    stx    $A6                   ; 3
    lda    $81                   ; 3
    beq    L712D                 ; 2³
    ldx    #0                    ; 2
L712D:
    stx    ENABL                 ; 3
    lda    #0                    ; 2
    sta    $DB                   ; 3
    sta    $DC                   ; 3
    ldx    #0                    ; 2
    stx    COLUPF                ; 3
    lda    #$10                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
L713F:
    sta    WSYNC                 ; 3
;---------------------------------------
L7141:
    dec    $D8                   ; 5
    bmi    L7193                 ; 2³
    lda    $D8                   ; 3
    cmp    $A0,X                 ; 4
    beq    L71BE                 ; 2³
    cmp    $A6,X                 ; 4
    bne    L7152                 ; 2³
    jmp    L7207                 ; 3

L7152:
    ldy    #$FF                  ; 2
    cmp    $BA                   ; 3
    bne    L715A                 ; 2³
    sty    ENAM0                 ; 3
L715A:
    cmp    $BD                   ; 3
    bne    L7160                 ; 2³
    sty    ENAM1                 ; 3
L7160:
    lda    #$80                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMBL                  ; 3
    ldy    $DB                   ; 3
    beq    L7176                 ; 2³
    cpy    #8                    ; 2
    bne    L7170                 ; 2³
    sta    HMCLR                 ; 3
L7170:
    lda    ($DF),Y               ; 5
    sta    GRP0                  ; 3
    dec    $DB                   ; 5
L7176:
    ldy    $DC                   ; 3
    beq    L7196                 ; 2³
    cpy    #8                    ; 2
    bne    L7180                 ; 2³
    sta    HMCLR                 ; 3
L7180:
    lda    ($D6),Y               ; 5
    sta    GRP1                  ; 3
    dec    $DC                   ; 5
    lda    #0                    ; 2
    sta    ENAM1                 ; 3
    sta    ENAM0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    L7141                 ; 3

L7193:
    jmp    L723D                 ; 3

L7196:
    lda    $DB                   ; 3
    bne    L71F7                 ; 2³
    ldy    $D4                   ; 3
    lda    $D8                   ; 3
    and    #$03                  ; 2
    sty    COLUPF                ; 3
    beq    L71A8                 ; 2³
    lda    #0                    ; 2
    sta    COLUPF                ; 3
L71A8:
    sec                          ; 2
    lda    $D4                   ; 3
    sbc    #6                    ; 2
    sta    $D4                   ; 3
    lda    #0                    ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUPF                ; 3
    jmp    L7141                 ; 3

L71BE:
    ldy    #0                    ; 2
    sty    GRP0                  ; 3
    ldy    #$10                  ; 2
    lda    $A1,X                 ; 4
    sta    $DF                   ; 3
    cmp    #$51                  ; 2
    bcs    L71CE                 ; 2³
    ldy    #$15                  ; 2
L71CE:
    sty    NUSIZ0                ; 3
    ora    #$0A                  ; 2
    sta    COLUP0                ; 3
    lda    $9F,X                 ; 4
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sec                          ; 2
L71DE:
    sbc    #$0F                  ; 2
    bcs    L71DE                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0                  ; 3
    sta    RESP0                 ; 3
    ldy    #8                    ; 2
    sty    $DB                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    L7141                 ; 3

L71F7:
    lda    #0                    ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    L7141                 ; 3

    jmp    L713F                 ; 3   is there an indirect jump to here?

L7207:
    ldy    #0                    ; 2
    sty    GRP1                  ; 3
    ldy    #$10                  ; 2
    lda    $A7,X                 ; 4
    sta    $D6                   ; 3
    cmp    #$51                  ; 2
    bcs    L7217                 ; 2³
    ldy    #$15                  ; 2
L7217:
    sty    NUSIZ1                ; 3
    ora    #$0A                  ; 2
    sta    COLUP1                ; 3
    lda    $A5,X                 ; 4
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sec                          ; 2
L7224:
    sbc    #$0F                  ; 2
    bcs    L7224                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP1                  ; 3
    sta    RESP1                 ; 3
    ldy    #8                    ; 2
    sty    $DC                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    L7141                 ; 3

L723D:
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
L7249:
    lda    INTIM                 ; 4
    bne    L7249                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $AE                   ; 3
    and    #$01                  ; 2
    beq    L725A                 ; 2³
    ldy    #0                    ; 2
    beq    L725C                 ; 3   always branch

L725A:
    ldy    #2                    ; 2
L725C:
    lda.wy $91,Y                 ; 4
    sta    $D5                   ; 3
    lda.wy $95,Y                 ; 4
    sta    $D7                   ; 3
    lda.wy $99,Y                 ; 4
    sta    $D9                   ; 3
    clc                          ; 2
    lda.wy $94,Y                 ; 4
    adc    #$32                  ; 2
    sta    $DE                   ; 3
    clc                          ; 2
    lda.wy $98,Y                 ; 4
    adc    #$32                  ; 2
    sta    $DC                   ; 3
    clc                          ; 2
    lda.wy $90,Y                 ; 4
    adc    #$32                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sec                          ; 2
L7284:
    sbc    #$0F                  ; 2
    bcs    L7284                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMM0                  ; 3
    sta    RESM0                 ; 3
    lda    $DE                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sec                          ; 2
L7297:
    sbc    #$0F                  ; 2
    bcs    L7297                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMM1                  ; 3
    sta    RESM1                 ; 3
    lda    $DC                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sec                          ; 2
L72AA:
    sbc    #$0F                  ; 2
    bcs    L72AA                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP1                  ; 3
    sta    RESP1                 ; 3
    lda    $9C                   ; 3
    lsr                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lsr                          ; 2
    clc                          ; 2
    adc    #$32                  ; 2
    sta    $DE                   ; 3
    lda    $9D                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ora    #$01                  ; 2
    sta    $DF                   ; 3
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    lda    #$1C                  ; 2
    sta    $D8                   ; 3
    lda    #$15                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #0                    ; 2
    sta    COLUP1                ; 3
    lda    $DE                   ; 3
    ldx    #0                    ; 2
    jsr    L7EE2                 ; 6
    lda    $8F                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUBK                ; 3
    lda    #$FF                  ; 2
    sta    PF2                   ; 3
    lda    #$49                  ; 2
    sta    COLUPF                ; 3
L72F5:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    dec    $D8                   ; 5
    bmi    L733B                 ; 2³+1
    ldx    #0                    ; 2
    lda    $D8                   ; 3
    cmp    $D5                   ; 3
    bne    L7307                 ; 2³
    ldx    #$FF                  ; 2
L7307:
    stx    ENAM0                 ; 3
    ldx    #0                    ; 2
    cmp    $D7                   ; 3
    bne    L7311                 ; 2³
    ldx    #$FF                  ; 2
L7311:
    stx    ENAM1                 ; 3
    ldx    #0                    ; 2
    cmp    $D9                   ; 3
    bne    L731B                 ; 2³
    ldx    #$80                  ; 2
L731B:
    stx    GRP1                  ; 3
    ldx    #0                    ; 2
    cmp    $DF                   ; 3
    bne    L732E                 ; 2³
    ldx    #$82                  ; 2
    stx    COLUP0                ; 3
    ldx    #$80                  ; 2
    stx    GRP0                  ; 3
    jmp    L7332                 ; 3

L732E:
    stx    GRP0                  ; 3
    stx    COLUP0                ; 3
L7332:
    sta    WSYNC                 ; 3
;---------------------------------------
    dec    $D8                   ; 5
    bmi    L733B                 ; 2³
    jmp    L72F5                 ; 3

L733B:
    lda    #0                    ; 2
    sta    PF2                   ; 3
    sta    COLUBK                ; 3
    sta    COLUPF                ; 3
    sta    GRP0                  ; 3
    sta    COLUP0                ; 3
    lda    #$88                  ; 2
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    ldy    #4                    ; 2
    ldx    $80                   ; 3
    beq    L736B                 ; 2³
    cpx    #8                    ; 2
    bcc    L735D                 ; 2³
    ldx    #8                    ; 2
    stx    $80                   ; 3
L735D:
    sec                          ; 2
    ror                          ; 2
    ror                          ; 2
    dex                          ; 2
    beq    L736B                 ; 2³
    dey                          ; 2
    bne    L735D                 ; 2³
    tay                          ; 2
    lda    #0                    ; 2
    beq    L7372                 ; 3   always branch

L736B:
    sta    WSYNC                 ; 3
;---------------------------------------
    tay                          ; 2
    lda    #0                    ; 2
    beq    L7378                 ; 3   always branch

L7372:
    sec                          ; 2
    rol                          ; 2
    rol                          ; 2
    dex                          ; 2
    bne    L7372                 ; 2³
L7378:
    tax                          ; 2
    lda    #6                    ; 2
    sta    $D4                   ; 3
L737D:
    sta    WSYNC                 ; 3
;---------------------------------------
    dec.w  $D4                   ; 6
    beq    L73A1                 ; 2³
    lda    #0                    ; 2
    sta.w  PF0                   ; 4
    sty.w  PF1                   ; 4
    stx.w  PF2                   ; 4
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta.w  PF1                   ; 4
    sta.w  PF2                   ; 4
    jmp    L737D                 ; 3

L73A1:
    lda    #$38                  ; 2
    sta    TIM64T                ; 4
    sec                          ; 2
    lda    $81                   ; 3
    beq    L73C1                 ; 2³
    sbc    #2                    ; 2
    sta    $81                   ; 3
L73AF:
    inc    $AE                   ; 5
    lda    $AE                   ; 3
    cmp    #4                    ; 2
    bne    L73BE                 ; 2³
    lda    #1                    ; 2
    sta    $AE                   ; 3
    jsr    L7CEB                 ; 6
L73BE:
    jmp    L7023                 ; 3

L73C1:
    lda    $82                   ; 3
    beq    L73C8                 ; 2³
    jmp    L73AF                 ; 3

L73C8:
    lda    $8B                   ; 3
    beq    L73D3                 ; 2³
    cmp    #$50                  ; 2
    bcs    L73D3                 ; 2³
    jsr    L7CF6                 ; 6
L73D3:
    inc    $AE                   ; 5
    lda    $AE                   ; 3
    cmp    #4                    ; 2
    bcc    L73DF                 ; 2³
    lda    #0                    ; 2
    sta    $AE                   ; 3
L73DF:
    and    #$01                  ; 2
    beq    L73EC                 ; 2³
    jsr    L79C7                 ; 6
    jsr    L7B5A                 ; 6
    jmp    L7023                 ; 3

L73EC:
    lda    $AE                   ; 3
    beq    L7422                 ; 2³+1
    lda    SWCHA                 ; 4
    asl                          ; 2
    bcs    L7401                 ; 2³+1
    dec    $8E                   ; 5
    bne    L73FE                 ; 2³
    lda    #$A0                  ; 2
    sta    $8E                   ; 3
L73FE:
    jmp    L740D                 ; 3

L7401:
    inc    $8E                   ; 5
    lda    $8E                   ; 3
    cmp    #$A1                  ; 2
    bcc    L740D                 ; 2³
    lda    #0                    ; 2
    sta    $8E                   ; 3
L740D:
    inc    $8C                   ; 5
    jsr    L7CEB                 ; 6
    jsr    L7F58                 ; 6
    lda    $8B                   ; 3
    cmp    #$A0                  ; 2
    bcs    L741F                 ; 2³
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
L741F:
    jmp    L7023                 ; 3

L7422:
    jsr    L776F                 ; 6
    jsr    L7913                 ; 6
    jmp    L7023                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L742B SUBROUTINE
    sta    CXCLR                 ; 3
    lda    #$FF                  ; 2
    ldx    #0                    ; 2
    stx    $8C                   ; 3
L7433:
    sta    $B1,X                 ; 4
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #$0C                  ; 2
    bne    L7433                 ; 2³
    sta    $BA                   ; 3
    sta    $BD                   ; 3
    sta    $A0                   ; 3
    sta    $EB                   ; 3
    sta    $EE                   ; 3
    sta    $E2                   ; 3
    sta    $E8                   ; 3
    sta    $F1                   ; 3
    sta    $E5                   ; 3
    lda    #$61                  ; 2
    sta    $9E                   ; 3
    jsr    L786C                 ; 6
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7456 SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$D0                  ; 2
    sta    HMP0                  ; 3
    lda    #$A0                  ; 2
    sta    HMP1                  ; 3
    nop                          ; 2
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    RESP0                 ; 3
    lda.wx $BF,X                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    #8                    ; 2
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    $D4                   ; 3
    lda    $BF,X                 ; 4
    and    #$0F                  ; 2
    jsr    L751C                 ; 6
    sta    $D6                   ; 3
    lda    $C0,X                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    #8                    ; 2
    sta    $D8                   ; 3
    lda    $C0,X                 ; 4
    and    #$0F                  ; 2
    jsr    L751C                 ; 6
    sta    $DA                   ; 3
    sty    COLUBK                ; 3
    lda    $C1,X                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    #8                    ; 2
    sta    $DC                   ; 3
    sta    HMCLR                 ; 3
    lda    $C1,X                 ; 4
    and    #$0F                  ; 2
    jsr    L751C                 ; 6
    sta    $DE                   ; 3
    ldy    #7                    ; 2
    lda    #$FF                  ; 2
    sta    $D5                   ; 3
    sta    $D7                   ; 3
    sta    $D9                   ; 3
    sta    $DB                   ; 3
    sta    $DD                   ; 3
    sta    $DF                   ; 3
    ldx    #0                    ; 2
    lda    $D4                   ; 3
    cmp    #8                    ; 2
    bne    L74EB                 ; 2³
    stx    $D4                   ; 3
    lda    $D6                   ; 3
    cmp    #8                    ; 2
    bne    L74EB                 ; 2³
    stx    $D6                   ; 3
    lda    $D8                   ; 3
    cmp    #8                    ; 2
    bne    L74EB                 ; 2³
    stx    $D8                   ; 3
    lda    $DA                   ; 3
    cmp    #8                    ; 2
    bne    L74EB                 ; 2³
    stx    $DA                   ; 3
    lda    $DC                   ; 3
    cmp    #8                    ; 2
    bne    L74EB                 ; 2³
    stx    $DC                   ; 3
L74EB:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($D6),Y               ; 5
    tax                          ; 2
    lda    ($D4),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($DA),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($DE),Y               ; 5
    pha                          ; 3
    stx    GRP0                  ; 3
    lda    ($D8),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($DC),Y               ; 5
    sta    GRP1                  ; 3
    pla                          ; 4
    sta    GRP1                  ; 3
    dey                          ; 2
    bne    L74EB                 ; 2³+1
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    COLUBK                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L751C SUBROUTINE
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    #8                    ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7523 SUBROUTINE
    lda    $B2,X                 ; 4
    cmp    #$91                  ; 2
    beq    L755D                 ; 2³
    cmp    #$99                  ; 2
    beq    L7559                 ; 2³
    cmp    #$A1                  ; 2
    beq    L7555                 ; 2³
    cmp    #$A9                  ; 2
    beq    L7551                 ; 2³
    cmp    #$B1                  ; 2
    beq    L754D                 ; 2³
    cmp    #$B9                  ; 2
    beq    L7549                 ; 2³
    cmp    #$C1                  ; 2
    beq    L7545                 ; 2³
    lda    #$FE                  ; 2
    bne    L7565                 ; 3   always branch

L7545:
    lda    #0                    ; 2
    beq    L7565                 ; 3   always branch

L7549:
    lda    #2                    ; 2
    bne    L7565                 ; 3   always branch

L754D:
    lda    #2                    ; 2
    bne    L755F                 ; 3   always branch

L7551:
    lda    #2                    ; 2
    bne    L756B                 ; 3   always branch

L7555:
    lda    #0                    ; 2
    beq    L756B                 ; 3   always branch

L7559:
    lda    #$FE                  ; 2
    bne    L756B                 ; 3   always branch

L755D:
    lda    #$FE                  ; 2
L755F:
    sta    $D9                   ; 3
    lda    #0                    ; 2
    beq    L756F                 ; 3   always branch

L7565:
    sta    $D9                   ; 3
    lda    #$FF                  ; 2
    bne    L756F                 ; 3   always branch

L756B:
    sta    $D9                   ; 3
    lda    #1                    ; 2
L756F:
    sta    $D5                   ; 3
    lda    SWCHB                 ; 4
    and    #$40                  ; 2
    beq    L757E                 ; 2³
    lda    $8C                   ; 3
    and    #$01                  ; 2
    bne    L7597                 ; 2³
L757E:
    lda    $8F                   ; 3
    cmp    #$58                  ; 2
    beq    L7597                 ; 2³
    cmp    #$B6                  ; 2
    beq    L75A4                 ; 2³
    lda    $D5                   ; 3
    beq    L75A4                 ; 2³
    bmi    L7592                 ; 2³
    inc    $D5                   ; 5
    bne    L75A4                 ; 3   always branch

L7592:
    dec    $D5                   ; 5
    jmp    L75A4                 ; 3

L7597:
    lda    $D9                   ; 3
    beq    L75A4                 ; 2³
    bmi    L75A2                 ; 2³
    dec    $D9                   ; 5
    jmp    L75A4                 ; 3

L75A2:
    inc    $D9                   ; 5
L75A4:
    sec                          ; 2
    lda.wy $83,Y                 ; 4
    sbc    #1                    ; 2
    sta.wy $83,Y                 ; 5
    bne    L75D3                 ; 2³
    lda    $8C                   ; 3
    adc    $DE,X                 ; 4
    and    #$17                  ; 2
    ora    #$07                  ; 2
    sta.wy $83,Y                 ; 5
    lda    $D9                   ; 3
    bne    L75D6                 ; 2³
    lda    $B1,X                 ; 4
    adc    $8C                   ; 3
    and    #$03                  ; 2
    cmp    #2                    ; 2
    bcc    L75CC                 ; 2³
    lda    #2                    ; 2
    bne    L75CE                 ; 3   always branch

L75CC:
    lda    #$FE                  ; 2
L75CE:
    sta    $D9                   ; 3
    jmp    L7601                 ; 3

L75D3:
    jmp    L7637                 ; 3

L75D6:
    lda    $D5                   ; 3
    bne    L75EF                 ; 2³
    lda    $B1,X                 ; 4
    adc    $8C                   ; 3
    and    #$03                  ; 2
    cmp    #2                    ; 2
    bcc    L75E8                 ; 2³
    lda    #1                    ; 2
    bne    L75EA                 ; 3   always branch

L75E8:
    lda    #$FF                  ; 2
L75EA:
    sta    $D5                   ; 3
    jmp    L7601                 ; 3

L75EF:
    lda    $B1,X                 ; 4
    adc    $8C                   ; 3
    and    #$03                  ; 2
    cmp    #2                    ; 2
    bcc    L75FD                 ; 2³
    lda    #0                    ; 2
    beq    L75EA                 ; 3   always branch

L75FD:
    lda    #0                    ; 2
    beq    L75CE                 ; 3   always branch

L7601:
    lda    $D9                   ; 3
    beq    L7619                 ; 2³
    bmi    L7625                 ; 2³
    lda    $D5                   ; 3
    beq    L7611                 ; 2³
    bmi    L7615                 ; 2³
    lda    #$A9                  ; 2
    bne    L7635                 ; 3   always branch

L7611:
    lda    #$B1                  ; 2
    bne    L7635                 ; 3   always branch

L7615:
    lda    #$B9                  ; 2
    bne    L7635                 ; 3   always branch

L7619:
    lda    $D5                   ; 3
    bmi    L7621                 ; 2³
    lda    #$A1                  ; 2
    bne    L7635                 ; 3   always branch

L7621:
    lda    #$C1                  ; 2
    bne    L7635                 ; 3   always branch

L7625:
    lda    $D5                   ; 3
    beq    L762F                 ; 2³
    bmi    L7633                 ; 2³
    lda    #$99                  ; 2
    bne    L7635                 ; 3   always branch

L762F:
    lda    #$91                  ; 2
    bne    L7635                 ; 3   always branch

L7633:
    lda    #$C9                  ; 2
L7635:
    sta    $B2,X                 ; 4
L7637:
    sty    $DE                   ; 3
    lda    SWCHA                 ; 4
    asl                          ; 2
    bcs    L764D                 ; 2³
    ldy    $D9                   ; 3
    bpl    L7649                 ; 2³
    ldy    #0                    ; 2
    sty    $D9                   ; 3
    beq    L764D                 ; 3   always branch

L7649:
    lda    #$FE                  ; 2
    sta    $D9                   ; 3
L764D:
    asl                          ; 2
    bcs    L765E                 ; 2³
    ldy    $D9                   ; 3
    bmi    L765A                 ; 2³
    ldy    #0                    ; 2
    sty    $D9                   ; 3
    beq    L765E                 ; 3   always branch

L765A:
    lda    #2                    ; 2
    sta    $D9                   ; 3
L765E:
    asl                          ; 2
    bcs    L766F                 ; 2³
    ldy    $D5                   ; 3
    bmi    L766B                 ; 2³
    ldy    #0                    ; 2
    sty    $D5                   ; 3
    beq    L766F                 ; 3   always branch

L766B:
    lda    #2                    ; 2
    sta    $D5                   ; 3
L766F:
    asl                          ; 2
    bcs    L7680                 ; 2³
    ldy    $D5                   ; 3
    bpl    L767C                 ; 2³
    ldy    #0                    ; 2
    sty    $D5                   ; 3
    beq    L7680                 ; 3   always branch

L767C:
    lda    #$FE                  ; 2
    sta    $D5                   ; 3
L7680:
    ldy    $DE                   ; 3
    lda    $D9                   ; 3
    bne    L7693                 ; 2³
    lda    $D5                   ; 3
    bne    L7693                 ; 2³
    lda    #1                    ; 2
    sta.wy $83,Y                 ; 5
    sta    $D9                   ; 3
    sta    $D5                   ; 3
;continued from L7755 SUBROUTINE
L7693:
    clc                          ; 2
    lda    $B1,X                 ; 4
    adc    $D5                   ; 3
    sta    $B1,X                 ; 4
    clc                          ; 2
    lda    $B0,X                 ; 4
    adc    $D9                   ; 3
    cmp    #$F0                  ; 2
    bcs    L76A9                 ; 2³
    cmp    #$94                  ; 2
    bcc    L76AF                 ; 2³
    bcs    L76AD                 ; 3   always branch

L76A9:
    lda    #$93                  ; 2
    bne    L76AF                 ; 3   always branch

L76AD:
    lda    #2                    ; 2
L76AF:
    sta    $B0,X                 ; 4
    lda    $B1,X                 ; 4
    cmp    #$F0                  ; 2
    bcs    L76BD                 ; 2³
    cmp    #$49                  ; 2
    bcc    L76C5                 ; 2³
    bcs    L76C1                 ; 3   always branch

L76BD:
    lda    #$47                  ; 2
    bne    L76C3                 ; 3   always branch

L76C1:
    lda    #1                    ; 2
L76C3:
    sta    $B1,X                 ; 4
L76C5:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L76C6 SUBROUTINE
    lda    $83                   ; 3
    cmp    #1                    ; 2
    bne    L76E0                 ; 2³
    lda    $84                   ; 3
    cmp    #1                    ; 2
    bne    L76E0                 ; 2³
    lda    #2                    ; 2
    sta    $84                   ; 3
    lda    $85                   ; 3
    cmp    #1                    ; 2
    bne    L76E0                 ; 2³
    lda    #3                    ; 2
    sta    $85                   ; 3
L76E0:
    ldx    #0                    ; 2
    ldy    #0                    ; 2
L76E4:
    lda    $B1,X                 ; 4
    cmp    #$FF                  ; 2
    beq    L7706                 ; 2³+1
    lda    $B2,X                 ; 4
    cmp    #$D9                  ; 2
    bne    L76F6                 ; 2³
    lda    #$FF                  ; 2
    sta    $B1,X                 ; 4
    bne    L7706                 ; 3+1   always branch
L76F6:
    cmp    #$D1                  ; 2
    bne    L7703                 ; 2³+1
    jsr    L7755                 ; 6
    lda    #$D9                  ; 2
    sta    $B2,X                 ; 4
    bne    L7706                 ; 3   always branch

L7703:
    jsr    L7523                 ; 6
L7706:
    iny                          ; 2
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #9                    ; 2
    bne    L76E4                 ; 2³+1
    lda    $8B                   ; 3
    cmp    #$A0                  ; 2
    bcs    L7754                 ; 2³
    lda    $AE                   ; 3
    bne    L7754                 ; 2³
    lda    $8F                   ; 3
    cmp    #$58                  ; 2
    beq    L7754                 ; 2³
    cmp    #$68                  ; 2
    beq    L772C                 ; 2³
    lda    $8C                   ; 3
    and    #$03                  ; 2
    bne    L7754                 ; 2³
    lda    #$0C                  ; 2
    bne    L774A                 ; 3   always branch

L772C:
    lda    $F6                   ; 3
    cmp    #$13                  ; 2
    beq    L773E                 ; 2³
    cmp    #$11                  ; 2
    beq    L7742                 ; 2³
    cmp    #$0F                  ; 2
    beq    L7746                 ; 2³
    lda    #$13                  ; 2
    bne    L7748                 ; 3   always branch

L773E:
    lda    #$11                  ; 2
    bne    L7748                 ; 3   always branch

L7742:
    lda    #$0F                  ; 2
    bne    L7748                 ; 3   always branch

L7746:
    lda    #$0E                  ; 2
L7748:
    sta    $F6                   ; 3
L774A:
    sta    AUDF0                 ; 3
    lda    #4                    ; 2
    sta    AUDC0                 ; 3
    lda    #8                    ; 2
    sta    AUDV0                 ; 3
L7754:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7755 SUBROUTINE
    lda    SWCHA                 ; 4
    asl                          ; 2
    bcs    L775D                 ; 2³
    dec    $B0,X                 ; 6
L775D:
    asl                          ; 2
    bcs    L7762                 ; 2³
    inc    $B0,X                 ; 6
L7762:
    asl                          ; 2
    bcs    L7767                 ; 2³
    inc    $B1,X                 ; 6
L7767:
    asl                          ; 2
    bcs    L776C                 ; 2³
    dec    $B1,X                 ; 6
L776C:
    jmp    L7693                 ; 3   go to 2nd half of subroutine

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L776F SUBROUTINE
    lda    SWCHA                 ; 4
    and    #$F0                  ; 2
    cmp    #$70                  ; 2
    beq    L7797                 ; 2³
    cmp    #$B0                  ; 2
    beq    L779B                 ; 2³
    cmp    #$D0                  ; 2
    beq    L779F                 ; 2³
    cmp    #$E0                  ; 2
    beq    L77A3                 ; 2³
    cmp    #$50                  ; 2
    beq    L77A7                 ; 2³
    cmp    #$60                  ; 2
    beq    L77AB                 ; 2³
    cmp    #$90                  ; 2
    beq    L77AF                 ; 2³
    cmp    #$A0                  ; 2
    beq    L77B3                 ; 2³
    jmp    L77B9                 ; 3

L7797:
    lda    #$71                  ; 2
    bne    L77B5                 ; 3   always branch

L779B:
    lda    #$51                  ; 2
    bne    L77B5                 ; 3   always branch

L779F:
    lda    #$81                  ; 2
    bne    L77B5                 ; 3   always branch

L77A3:
    lda    #$61                  ; 2
    bne    L77B5                 ; 3   always branch

L77A7:
    lda    #$79                  ; 2
    bne    L77B5                 ; 3   always branch

L77AB:
    lda    #$69                  ; 2
    bne    L77B5                 ; 3   always branch
L77AF:
    lda    #$89                  ; 2
    bne    L77B5                 ; 3   always branch

L77B3:
    lda    #$59                  ; 2
L77B5:
    sta    $F5                   ; 3
    sta    $9E                   ; 3
L77B9:
    lda.w  INPT4                 ; 4
    and    #$80                  ; 2
    bne    L77CC                 ; 2³
    lda    $BA                   ; 3
    cmp    #$FF                  ; 2
    beq    L77CD                 ; 2³
    lda    $BD                   ; 3
    cmp    #$FF                  ; 2
    beq    L77D1                 ; 2³
L77CC:
    rts                          ; 6

L77CD:
    ldx    #0                    ; 2
    beq    L77D3                 ; 3   always branch

L77D1:
    ldx    #3                    ; 2
L77D3:
    lda    #$54                  ; 2
    sta    $B9,X                 ; 4
    lda    #$20                  ; 2
    sta    $BA,X                 ; 4
    lda    $9E                   ; 3
    sta    $BB,X                 ; 4
    lda    $8B                   ; 3
    bne    L77E7                 ; 2³
    lda    #$44                  ; 2
    sta    $8B                   ; 3
L77E7:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L77E8 SUBROUTINE
    cmp    #$89                  ; 2
    beq    L780B                 ; 2³+1
    cmp    #$81                  ; 2
    beq    L780F                 ; 2³+1
    cmp    #$79                  ; 2
    beq    L7816                 ; 2³+1
    cmp    #$71                  ; 2
    beq    L781D                 ; 2³+1
    cmp    #$69                  ; 2
    beq    L7824                 ; 2³+1
    cmp    #$61                  ; 2
    beq    L7828                 ; 2³
    cmp    #$59                  ; 2
    beq    L782F                 ; 2³
    dec    $D6                   ; 5
    dec    $D6                   ; 5
    jmp    L7836                 ; 3

L780B:
    dec    $D6                   ; 5
    dec    $D6                   ; 5
L780F:
    dec    $D7                   ; 5
    dec    $D7                   ; 5
    jmp    L7836                 ; 3

L7816:
    inc    $D6                   ; 5
    inc    $D6                   ; 5
    jmp    L780F                 ; 3

L781D:
    inc    $D6                   ; 5
    inc    $D6                   ; 5
    jmp    L7836                 ; 3

L7824:
    inc    $D6                   ; 5
    inc    $D6                   ; 5
L7828:
    inc    $D7                   ; 5
    inc    $D7                   ; 5
    jmp    L7836                 ; 3

L782F:
    dec    $D6                   ; 5
    dec    $D6                   ; 5
    jmp    L7828                 ; 3

L7836:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7837 SUBROUTINE
    ldx    #0                    ; 2
L7839:
    lda    $B9,X                 ; 4
    sta    $D6                   ; 3
    lda    $BA,X                 ; 4
    cmp    #$FF                  ; 2
    beq    L7864                 ; 2³
    sta    $D7                   ; 3
    lda    $BB,X                 ; 4
    jsr    L77E8                 ; 6
    lda    $D6                   ; 3
    cmp    #$98                  ; 2
    bcs    L785C                 ; 2³
    cmp    #2                    ; 2
    bcc    L785C                 ; 2³
    sta    $B9,X                 ; 4
    lda    $D7                   ; 3
    cmp    #$46                  ; 2
    bcc    L7862                 ; 2³
L785C:
    lda    #0                    ; 2
    sta    $B9,X                 ; 4
    lda    #$FF                  ; 2
L7862:
    sta    $BA,X                 ; 4
L7864:
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #3                    ; 2
    beq    L7839                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L786C SUBROUTINE
    ldy    #0                    ; 2
    lda    #6                    ; 2
    sta    $DD                   ; 3
    lda    $A5                   ; 3
    cmp    #1                    ; 2
    beq    L789C                 ; 2³
    cmp    #2                    ; 2
    beq    L7898                 ; 2³
    cmp    #3                    ; 2
    beq    L7894                 ; 2³
    cmp    #4                    ; 2
    beq    L7890                 ; 2³
    cmp    #6                    ; 2
    beq    L788C                 ; 2³
    ldx    #4                    ; 2
    bne    L789E                 ; 3   always branch

L788C:
    ldx    #4                    ; 2
    bne    L78F4                 ; 3   always branch

L7890:
    ldx    #2                    ; 2
    bne    L78F4                 ; 3   always branch

L7894:
    ldx    #2                    ; 2
    bne    L789E                 ; 3   always branch

L7898:
    ldx    #0                    ; 2
    beq    L78F4                 ; 3   always branch

L789C:
    ldx    #0                    ; 2
L789E:
    dec    $DD                   ; 5
L78A0:
    lda    L7A40,X               ; 4
    sta.wy $C2,Y                 ; 5
    lda    L7A41,X               ; 4
    sta.wy $C3,Y                 ; 5
    lda    #$11                  ; 2
    sta.wy $C4,Y                 ; 5
    txa                          ; 2
    clc                          ; 2
    adc    #8                    ; 2
    tax                          ; 2
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    dec    $DD                   ; 5
    bne    L78A0                 ; 2³
    lda    #$E8                  ; 2
    sta    $D1                   ; 3
    lda    #$43                  ; 2
    sta    $D2                   ; 3
L78C5:
    lda    #$19                  ; 2
    sta    $D3                   ; 3
    sta    $CA                   ; 3
    sta    $C7                   ; 3
    ldy    #0                    ; 2
    ldx    #0                    ; 2
L78D1:
    lda    $C2,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    sta.wy $90,Y                 ; 5
    lda    $C3,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ora    #$01                  ; 2
    sta.wy $91,Y                 ; 5
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    iny                          ; 2
    iny                          ; 2
    cpx    #$12                  ; 2
    bne    L78D1                 ; 2³
    lda    #$28                  ; 2
    sta    $9C                   ; 3
    lda    #$24                  ; 2
    sta    $9D                   ; 3
    rts                          ; 6

L78F4:
    lda    L7A40,X               ; 4
    sta.wy $C2,Y                 ; 5
    lda    L7A41,X               ; 4
    sta.wy $C3,Y                 ; 5
    lda    #$11                  ; 2
    sta.wy $C4,Y                 ; 5
    txa                          ; 2
    clc                          ; 2
    adc    #6                    ; 2
    tax                          ; 2
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    dec    $DD                   ; 5
    bne    L78F4                 ; 2³+1
    beq    L78C5                 ; 3+1   always branch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7913 SUBROUTINE
    ldx    #0                    ; 2
L7915:
    lda    $C3,X                 ; 4
    cmp    #$FF                  ; 2
    beq    L7980                 ; 2³
    lda    SWCHA                 ; 4
    asl                          ; 2
    bcs    L7923                 ; 2³
    dec    $C2,X                 ; 6
L7923:
    asl                          ; 2
    bcs    L7928                 ; 2³
    inc    $C2,X                 ; 6
L7928:
    asl                          ; 2
    bcs    L792D                 ; 2³
    inc    $C3,X                 ; 6
L792D:
    asl                          ; 2
    bcs    L7932                 ; 2³
    dec    $C3,X                 ; 6
L7932:
    lda    $C2,X                 ; 4
    cmp    #2                    ; 2
    bcc    L7940                 ; 2³
    cmp    #$F1                  ; 2
    bcc    L7944                 ; 2³
    lda    #2                    ; 2
    bne    L7942                 ; 3   always branch

L7940:
    lda    #$F0                  ; 2
L7942:
    sta    $C2,X                 ; 4
L7944:
    lda    $C3,X                 ; 4
    cmp    #$F0                  ; 2
    bcs    L7952                 ; 2³
    cmp    #$D8                  ; 2
    bcc    L7956                 ; 2³
    lda    #0                    ; 2
    beq    L7954                 ; 3   always branch

L7952:
    lda    #$D7                  ; 2
L7954:
    sta    $C3,X                 ; 4
L7956:
    lda    $8C                   ; 3
    and    #$03                  ; 2
    bne    L7980                 ; 2³
    lda    $C4,X                 ; 4
    cmp    #$11                  ; 2
    beq    L797C                 ; 2³
    cmp    #$19                  ; 2
    beq    L7978                 ; 2³
    cmp    #$31                  ; 2
    beq    L7974                 ; 2³
    lda    #0                    ; 2
    sta    $C2,X                 ; 4
    lda    #$FF                  ; 2
    sta    $C3,X                 ; 4
    bne    L7980                 ; 3   always branch

L7974:
    lda    #$39                  ; 2
    bne    L797E                 ; 3   always branch

L7978:
    lda    #$11                  ; 2
    bne    L797E                 ; 3   always branch

L797C:
    lda    #$19                  ; 2
L797E:
    sta    $C4,X                 ; 4
L7980:
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #$12                  ; 2
    bne    L7915                 ; 2³
    lda    SWCHA                 ; 4
    asl                          ; 2
    bcs    L798F                 ; 2³
    inc    $9C                   ; 5
L798F:
    asl                          ; 2
    bcs    L7994                 ; 2³
    dec    $9C                   ; 5
L7994:
    asl                          ; 2
    bcs    L7999                 ; 2³
    dec    $9D                   ; 5
L7999:
    asl                          ; 2
    bcs    L799E                 ; 2³
    inc    $9D                   ; 5
L799E:
    lda    $9C                   ; 3
    cmp    #$F8                  ; 2
    bcs    L79AF                 ; 2³
    cmp    #$F1                  ; 2
    bcs    L79AB                 ; 2³
    jmp    L79B3                 ; 3

L79AB:
    lda    #0                    ; 2
    beq    L79B1                 ; 3   always branch

L79AF:
    lda    #$F0                  ; 2
L79B1:
    sta    $9C                   ; 3
L79B3:
    lda    $9D                   ; 3
    cmp    #$F0                  ; 2
    bcs    L79C2                 ; 2³
    cmp    #$D8                  ; 2
    bcs    L79BE                 ; 2³
    rts                          ; 6

L79BE:
    lda    #0                    ; 2
    beq    L79C4                 ; 3   always branch

L79C2:
    lda    #$D7                  ; 2
L79C4:
    sta    $9D                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L79C7 SUBROUTINE
    ldx    #0                    ; 2
    lda    #$FF                  ; 2
L79CB:
    sta    $EB,X                 ; 4
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #9                    ; 2
    bne    L79CB                 ; 2³
    ldy    #0                    ; 2
    ldx    #0                    ; 2
L79D8:
    lda    $C2,X                 ; 4
    cmp    #$4B                  ; 2
    bcs    L79E7                 ; 2³
    lda    $C3,X                 ; 4
    cmp    #$48                  ; 2
    bcs    L79E7                 ; 2³
    jsr    L7A22                 ; 6
L79E7:
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #$12                  ; 2
    bne    L79D8                 ; 2³
    lda    $A5                   ; 3
    cmp    #2                    ; 2
    beq    L7A03                 ; 2³+1
    cmp    #5                    ; 2
    beq    L7A03                 ; 2³+1
    cmp    #3                    ; 2
    beq    L7A07                 ; 2³+1
    cmp    #6                    ; 2
    beq    L7A07                 ; 2³
    jmp    L7A21                 ; 3

L7A03:
    ldx    #$10                  ; 2
    bne    L7A09                 ; 3   always branch

L7A07:
    ldx    #$30                  ; 2
L7A09:
    lda    $EC                   ; 3
    cmp    #$31                  ; 2
    bcs    L7A15                 ; 2³
    clc                          ; 2
    txa                          ; 2
    adc    $EC                   ; 3
    sta    $EC                   ; 3
L7A15:
    lda    $EF                   ; 3
    cmp    #$31                  ; 2
    bcs    L7A21                 ; 2³
    clc                          ; 2
    txa                          ; 2
    adc    $EF                   ; 3
    sta    $EF                   ; 3
L7A21:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7A22 SUBROUTINE
    sta.wy $EB,Y                 ; 5
    lda    $C4,X                 ; 4
    sta.wy $EC,Y                 ; 5
    lda    $C2,X                 ; 4
    asl                          ; 2
    cmp    #2                    ; 2
    bcs    L7A33                 ; 2³
    lda    #2                    ; 2
L7A33:
    cmp    #$94                  ; 2
    bcc    L7A39                 ; 2³
    lda    #$93                  ; 2
L7A39:
    sta.wy $EA,Y                 ; 5
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7A40:
    .byte $10 ; |   X    | $7A40
L7A41:
    .byte $08 ; |    X   | $7A41
    .byte $48 ; | X  X   | $7A42
    .byte $0C ; |    XX  | $7A43
    .byte $59 ; | X XX  X| $7A44
    .byte $24 ; |  X  X  | $7A45
    .byte $74 ; | XXX X  | $7A46
    .byte $28 ; |  X X   | $7A47
    .byte $93 ; |X  X  XX| $7A48
    .byte $20 ; |  X     | $7A49
    .byte $BE ; |X XXXXX | $7A4A
    .byte $3A ; |  XXX X | $7A4B
    .byte $28 ; |  X X   | $7A4C
    .byte $B6 ; |X XX XX | $7A4D
    .byte $6D ; | XX XX X| $7A4E
    .byte $4F ; | X  XXXX| $7A4F
    .byte $8F ; |X   XXXX| $7A50
    .byte $5E ; | X XXXX | $7A51
    .byte $AC ; |X X XX  | $7A52
    .byte $6B ; | XX X XX| $7A53
    .byte $C4 ; |XX   X  | $7A54
    .byte $50 ; | X X    | $7A55
    .byte $D8 ; |XX XX   | $7A56
    .byte $43 ; | X    XX| $7A57
    .byte $26 ; |  X  XX | $7A58
    .byte $78 ; | XXXX   | $7A59
    .byte $45 ; | X   X X| $7A5A
    .byte $94 ; |X  X X  | $7A5B
    .byte $6A ; | XX X X | $7A5C
    .byte $6A ; | XX X X | $7A5D
    .byte $84 ; |X    X  | $7A5E
    .byte $B9 ; |X XXX  X| $7A5F
    .byte $95 ; |X  X X X| $7A60
    .byte $83 ; |X     XX| $7A61
    .byte $AC ; |X X XX  | $7A62
    .byte $8E ; |X   XXX | $7A63
    .byte $C1 ; |XX     X| $7A64
    .byte $B8 ; |X XXX   | $7A65

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7A66 SUBROUTINE
    lda    #$50                  ; 2
    sta    $F3                   ; 3
    lda    #$24                  ; 2
    sta    $F4                   ; 3
    lda    $9E                   ; 3
    sta    $F5                   ; 3
    ldx    #0                    ; 2
L7A74:
    lda    $B0,X                 ; 4
    sta    $E1,X                 ; 4
    inx                          ; 2
    cpx    #9                    ; 2
    bne    L7A74                 ; 2³
    ldx    #0                    ; 2
L7A7F:
    inc    $E2,X                 ; 6
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #$15                  ; 2
    bne    L7A7F                 ; 2³
    lda    #$12                  ; 2
    sta    $D5                   ; 3
L7A8C:
    ldx    #0                    ; 2
L7A8E:
    lda    $E2,X                 ; 4
    cmp    $E5,X                 ; 4
    bcs    L7AB8                 ; 2³
    lda    $E4,X                 ; 4
    sta    $D9                   ; 3
    lda    $E1,X                 ; 4
    sta    $E4,X                 ; 4
    lda    $D9                   ; 3
    sta    $E1,X                 ; 4
    lda    $E5,X                 ; 4
    sta    $D9                   ; 3
    lda    $E2,X                 ; 4
    sta    $E5,X                 ; 4
    lda    $D9                   ; 3
    sta    $E2,X                 ; 4
    lda    $E6,X                 ; 4
    sta    $D9                   ; 3
    lda    $E3,X                 ; 4
    sta    $E6,X                 ; 4
    lda    $D9                   ; 3
    sta    $E3,X                 ; 4
L7AB8:
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    $D5                   ; 3
    bne    L7A8E                 ; 2³
    sec                          ; 2
    lda    $D5                   ; 3
    sbc    #3                    ; 2
    sta    $D5                   ; 3
    bne    L7A8C                 ; 2³
    ldx    #0                    ; 2
L7ACA:
    dec    $E2,X                 ; 6
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #$15                  ; 2
    bne    L7ACA                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7AD4 SUBROUTINE
    lda    #$FF                  ; 2
    sta    $A6                   ; 3
    sta    $AC                   ; 3
    sta    $AF                   ; 3
    ldy    #0                    ; 2
    lda    $AE                   ; 3
    and    #$01                  ; 2
    beq    L7AE8                 ; 2³
    ldx    #0                    ; 2
    beq    L7AEA                 ; 3   always branch

L7AE8:
    ldx    #3                    ; 2
L7AEA:
    lda    $E1,X                 ; 4
    sta.wy $9F,Y                 ; 5
    lda    $E2,X                 ; 4
    sta.wy $A0,Y                 ; 5
    lda    $E3,X                 ; 4
    sta.wy $A1,Y                 ; 5
    clc                          ; 2
    txa                          ; 2
    adc    #$0C                  ; 2
    tax                          ; 2
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    cpy    #3                    ; 2
    beq    L7AEA                 ; 2³+1
    lda    $AE                   ; 3
    and    #$01                  ; 2
    beq    L7B0F                 ; 2³
    ldx    #6                    ; 2
    bne    L7B11                 ; 3   always branch

L7B0F:
    ldx    #9                    ; 2
L7B11:
    lda    $E1,X                 ; 4
    sta    $A8                   ; 3
    lda    $E2,X                 ; 4
    sta    $A9                   ; 3
    lda    $E3,X                 ; 4
    sta    $AA                   ; 3
    lda    $A1                   ; 3
    cmp    $9E                   ; 3
    bne    L7B3A                 ; 2³
    lda    $A3                   ; 3
    cmp    #$FF                  ; 2
    beq    L7B50                 ; 2³
    sec                          ; 2
    lda    $A0                   ; 3
    sbc    $A3                   ; 3
    cmp    #4                    ; 2
    bcs    L7B51                 ; 2³
    sec                          ; 2
    lda    $A3                   ; 3
    sbc    #3                    ; 2
    sta    $A3                   ; 3
    rts                          ; 6

L7B3A:
    lda    $AA                   ; 3
    cmp    $9E                   ; 3
    bne    L7B50                 ; 2³
    lda    $A3                   ; 3
    cmp    $A9                   ; 3
    bcc    L7B48                 ; 2³
    dec    $A3                   ; 5
L7B48:
    lda    $A9                   ; 3
    cmp    $A0                   ; 3
    bcc    L7B50                 ; 2³
    inc    $A0                   ; 5
L7B50:
    rts                          ; 6

L7B51:
    lda    $A3                   ; 3
    cmp    $A9                   ; 3
    bcc    L7B50                 ; 2³
    dec    $A3                   ; 5
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7B5A SUBROUTINE
    lda.w  CXM0P                 ; 4
    and    #$C0                  ; 2
    beq    L7B66                 ; 2³
    ldy    #0                    ; 2
    jsr    L7C16                 ; 6
L7B66:
    lda.w  CXM1P                 ; 4
    and    #$C0                  ; 2
    beq    L7B72                 ; 2³
    ldy    #3                    ; 2
    jsr    L7C16                 ; 6
L7B72:
    sta    CXCLR                 ; 3
    ldx    #0                    ; 2
L7B76:
    lda    $B2,X                 ; 4
    cmp    #$D1                  ; 2
    beq    L7B9A                 ; 2³
    cmp    #$D9                  ; 2
    beq    L7B9A                 ; 2³
    sec                          ; 2
    lda    $B0,X                 ; 4
    sbc    #$50                  ; 2
    cmp    #7                    ; 2
    bcc    L7B8D                 ; 2³
    cmp    #$F9                  ; 2
    bcc    L7B9A                 ; 2³
L7B8D:
    sec                          ; 2
    lda    $B1,X                 ; 4
    sbc    #$24                  ; 2
    cmp    #6                    ; 2
    bcc    L7BA4                 ; 2³
    cmp    #$FA                  ; 2
    bcs    L7BA4                 ; 2³
L7B9A:
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #9                    ; 2
    bne    L7B76                 ; 2³
    jmp    L7BBC                 ; 3

L7BA4:
    lda    #$D1                  ; 2
    sta    $B2,X                 ; 4
    lda    #$89                  ; 2
    sta    $9E                   ; 3
    lda    #$AA                  ; 2
    sta    $8B                   ; 3
    lda    #$E0                  ; 2
    sta    $81                   ; 3
    dec    $80                   ; 5
    bne    L7BBC                 ; 2³
    lda    #4                    ; 2
    sta    $A7                   ; 3
L7BBC:
    ldy    #0                    ; 2
    ldx    #0                    ; 2
L7BC0:
    lda    $C4,X                 ; 4
    cmp    #$31                  ; 2
    beq    L7BE9                 ; 2³
    cmp    #$39                  ; 2
    beq    L7BE9                 ; 2³
    sec                          ; 2
    lda    $C3,X                 ; 4
    sbc    #$24                  ; 2
    cmp    #8                    ; 2
    bcc    L7BD7                 ; 2³
    cmp    #$F8                  ; 2
    bcc    L7BE9                 ; 2³
L7BD7:
    lda    $C2,X                 ; 4
    cmp    #$4D                  ; 2
    bcs    L7BE9                 ; 2³
    asl                          ; 2
    sec                          ; 2
    sbc    #$50                  ; 2
    cmp    #$0B                  ; 2
    bcc    L7BF5                 ; 2³
    cmp    #$F5                  ; 2
    bcs    L7BF5                 ; 2³
L7BE9:
    iny                          ; 2
    iny                          ; 2
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #$12                  ; 2
    bne    L7BC0                 ; 2³
    jmp    L7CC6                 ; 3   go to 2nd half of subroutine

L7BF5:
    lda    #$31                  ; 2
    sta    $C4,X                 ; 4
    lda    #$FF                  ; 2
    sta.wy $91,Y                 ; 5
    lda    #$89                  ; 2
    sta    $9E                   ; 3
    lda    #$AA                  ; 2
    sta    $8B                   ; 3
    lda    #$E0                  ; 2
    sta    $81                   ; 3
    dec    $80                   ; 5
    bne    L7C13                 ; 2³
    lda    #4                    ; 2
    sta    $A7                   ; 3
    rts                          ; 6

L7C13:
    jmp    L7CC6                 ; 3   go to 2nd half of subroutine

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7C16 SUBROUTINE
    ldx    #0                    ; 2
L7C18:
    lda    $B2,X                 ; 4
    cmp    #$D1                  ; 2
    beq    L7C3E                 ; 2³
    cmp    #$D9                  ; 2
    beq    L7C3E                 ; 2³
    sec                          ; 2
    lda    $B0,X                 ; 4
    sbc.wy $B9,Y                 ; 4
    cmp    #8                    ; 2
    bcc    L7C30                 ; 2³
    cmp    #$F8                  ; 2
    bcc    L7C3E                 ; 2³
L7C30:
    sec                          ; 2
    lda    $B1,X                 ; 4
    sbc.wy $BA,Y                 ; 4
    cmp    #7                    ; 2
    bcc    L7C48                 ; 2³
    cmp    #$F9                  ; 2
    bcs    L7C48                 ; 2³
L7C3E:
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #9                    ; 2
    bne    L7C18                 ; 2³
    jmp    L7C6A                 ; 3

L7C48:
    lda    #$D1                  ; 2
    sta    $B2,X                 ; 4
    lda    #$FF                  ; 2
    sta.wy $BA,Y                 ; 5
    lda    $8B                   ; 3
    cmp    #$82                  ; 2
    bcs    L7C5B                 ; 2³
    lda    #$88                  ; 2
    sta    $8B                   ; 3
L7C5B:
    lda    #1                    ; 2
    clc                          ; 2
    sed                          ; 2
    adc    $C0                   ; 3
    sta    $C0                   ; 3
    lda    $BF                   ; 3
    adc    #0                    ; 2
    sta    $BF                   ; 3
    cld                          ; 2
L7C6A:
    ldx    #0                    ; 2
    stx    $D9                   ; 3
L7C6E:
    lda    $C4,X                 ; 4
    cmp    #$31                  ; 2
    beq    L7C99                 ; 2³
    cmp    #$39                  ; 2
    beq    L7C99                 ; 2³
    sec                          ; 2
    lda    $C3,X                 ; 4
    sbc.wy $BA,Y                 ; 4
    cmp    #9                    ; 2
    bcc    L7C86                 ; 2³
    cmp    #$F9                  ; 2
    bcc    L7C99                 ; 2³
L7C86:
    lda    $C2,X                 ; 4
    cmp    #$4D                  ; 2
    bcs    L7C99                 ; 2³
    asl                          ; 2
    sec                          ; 2
    sbc.wy $B9,Y                 ; 4
    cmp    #$11                  ; 2
    bcc    L7CA5                 ; 2³
    cmp    #$F0                  ; 2
    bcs    L7CA5                 ; 2³
L7C99:
    inc    $D9                   ; 5
    inc    $D9                   ; 5
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #$12                  ; 2
    bne    L7C6E                 ; 2³
    rts                          ; 6

L7CA5:
    lda    #$31                  ; 2
    sta    $C4,X                 ; 4
    lda    #$FF                  ; 2
    sta.wy $BA,Y                 ; 5
    ldx    $D9                   ; 3
    sta    $91,X                 ; 4
    lda    #$AA                  ; 2
    sta    $8B                   ; 3
    lda    #5                    ; 2
    clc                          ; 2
    sed                          ; 2
    adc    $C0                   ; 3
    sta    $C0                   ; 3
    lda    $BF                   ; 3
    adc    #0                    ; 2
    sta    $BF                   ; 3
    cld                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;continued from L7B5A SUBROUTINE

L7CC6:
    ldx    #0                    ; 2
L7CC8:
    lda    $91,X                 ; 4
    cmp    #$FF                  ; 2
    bne    L7CEA                 ; 2³
    inx                          ; 2
    inx                          ; 2
    cpx    #$0C                  ; 2
    bne    L7CC8                 ; 2³
    sta    $A0                   ; 3
;=======================================
  IF SAMPLE_COPY
    lda    $A5                   ; 3   The sample copy is limited to only two levels; levels 1 and 6.
    cmp    #1                    ; 2   Maybe Ample Ace felt these were the two best levels and wanted to
    bne    L7CE0                 ; 2³  showcase them. The sample copy was meant as a promo copy for dealers
    lda    #6                    ; 2   to try out. It's purpose was to get dealers interested and buy some games.
    bne    L7CE2                 ; 3   - always branch

  ELSE BITCORP
    inc    $A5                   ; 5
    lda    $A5                   ; 3
    cmp    #7                    ; 2
    bne    L7CE4                 ; 2³

  ENDIF
;=======================================
L7CE0:
    lda    #1                    ; 2
L7CE2:
    sta    $A5                   ; 3
L7CE4:
    inc    $80                   ; 5
    lda    #$C7                  ; 2
    sta    $82                   ; 3
L7CEA:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7CEB SUBROUTINE
    lda    $8B                   ; 3
    cmp    #$A0                  ; 2
    bcs    L7D47                 ; 2³+1   go to 2nd half of subroutine
    cmp    #$80                  ; 2
    bcs    L7D1D                 ; 2³+1   go to 2nd half of subroutine
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7CF6 SUBROUTINE
    cmp    #$44                  ; 2
    bne    L7D02                 ; 2³+1
    lda    #7                    ; 2
    sta    $8A                   ; 3
    lda    #$41                  ; 2
    sta    $8B                   ; 3
L7D02:
    lda    #4                    ; 2
    sta    AUDC1                 ; 3
    lda    #8                    ; 2
    sta    AUDV1                 ; 3
    inc    $8A                   ; 5
    inc    $8A                   ; 5
    lda    $8A                   ; 3
    cmp    #$18                  ; 2
    bcc    L7D1A                 ; 2³
    lda    #0                    ; 2
    sta    $8B                   ; 3
    sta    AUDV1                 ; 3
L7D1A:
    sta    AUDF1                 ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;continued from L7CEB SUBROUTINE

L7D1D:
    cmp    #$88                  ; 2
    bne    L7D29                 ; 2³
    lda    #4                    ; 2
    sta    $89                   ; 3
    lda    #$81                  ; 2
    sta    $8B                   ; 3
L7D29:
    lda    #4                    ; 2
    sta    AUDC1                 ; 3
    ldx    $89                   ; 3
    lda    L7D43,X               ; 4
    sta    AUDF1                 ; 3
    lda    #8                    ; 2
    sta    AUDV1                 ; 3
    dec    $89                   ; 5
    bpl    L7D42                 ; 2³
    lda    #0                    ; 2
    sta    $8B                   ; 3
    sta    AUDV1                 ; 3
L7D42:
    rts                          ; 6

L7D43:
    .byte $0F ; |    XXXX| $7D43
    .byte $0E ; |    XXX | $7D44
    .byte $13 ; |   X  XX| $7D45
    .byte $11 ; |   X   X| $7D46

;continued from L7CEB SUBROUTINE
L7D47:
    cmp    #$AA                  ; 2
    bne    L7D57                 ; 2³
    lda    #$A1                  ; 2
    sta    $8B                   ; 3
    lda    #$10                  ; 2
    sta    $86                   ; 3
    lda    #$1F                  ; 2
    sta    $87                   ; 3
L7D57:
    lda    #8                    ; 2
    sta    AUDC0                 ; 3
    lda    #3                    ; 2
    sta    AUDC1                 ; 3
    inc    $F7                   ; 5
    lda    $86                   ; 3
    cmp    #9                    ; 2
    bcs    L7D8A                 ; 2³
    lda    $F7                   ; 3
    and    #$03                  ; 2
    beq    L7D70                 ; 2³
    jmp    L7D9B                 ; 3

L7D70:
    lda    $86                   ; 3
    cmp    #4                    ; 2
    bcs    L7D7C                 ; 2³
    lda    #0                    ; 2
    sta    $8B                   ; 3
    beq    L7D97                 ; 3   always branch

L7D7C:
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $86                   ; 3
    sta    AUDV0                 ; 3
    and    #$01                  ; 2
    sta    AUDV1                 ; 3
    jmp    L7D9B                 ; 3

L7D8A:
    lda    $F7                   ; 3
    and    #$01                  ; 2
    beq    L7D9B                 ; 2³
    sec                          ; 2
    lda    $86                   ; 3
    sbc    #1                    ; 2
    sta    $86                   ; 3
L7D97:
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
L7D9B:
    sec                          ; 2
    lda    $87                   ; 3
    sbc    #1                    ; 2
    sta    $87                   ; 3
    sta    AUDF0                 ; 3
    lda    #$15                  ; 2
    sta    AUDF1                 ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $FF ; |XXXXXXXX| $7DA9
    .byte $FF ; |XXXXXXXX| $7DAA
    .byte $FF ; |XXXXXXXX| $7DAB
    .byte $FF ; |XXXXXXXX| $7DAC
    .byte $FF ; |XXXXXXXX| $7DAD
    .byte $FF ; |XXXXXXXX| $7DAE
    .byte $FF ; |XXXXXXXX| $7DAF
    .byte $FF ; |XXXXXXXX| $7DB0
    .byte $FF ; |XXXXXXXX| $7DB1

;==================================================================================================
;this free space is left filled in the sample copy

  IF SAMPLE_COPY

    .byte $FF ; |XXXXXXXX| $7DB2         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DB3         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DB4         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DB5         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DB6         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DB7         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DB8         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DB9         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DBA         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DBB         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DBC         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DBD         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DBE         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DBF         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DC0         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DC1         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DC2         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DC3         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DC4         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DC5         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DC6         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DC7         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DC8         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DC9         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DCA         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DCB         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DCC         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DCD         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DCE         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DCF         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DD0         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DD1         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DD2         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DD3         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DD4         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DD5         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DD6         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DD7         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DD8         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DD9         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DDA         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DDB         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DDC         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DDD         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DDE         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DDF         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DE0         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DE1         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DE2         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DE3         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DE4         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DE5         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DE6         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DE7         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DE8         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DE9         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DEA         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DEB         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DEC         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DED         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DEE         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DEF         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DF0         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DF1         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DF2         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DF3         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DF4         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DF5         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DF6         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DF7         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DF8         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DF9         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DFA         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DFB         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DFC         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DFD         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DFE         Sample Copy
    .byte $FF ; |XXXXXXXX| $7DFF         Sample Copy
    .byte $FF ; |XXXXXXXX| $7E00         Sample Copy
    .byte $FF ; |XXXXXXXX| $7E01         Sample Copy
    .byte $FF ; |XXXXXXXX| $7E02         Sample Copy
    .byte $FF ; |XXXXXXXX| $7E03         Sample Copy
    .byte $FF ; |XXXXXXXX| $7E04         Sample Copy
    .byte $FF ; |XXXXXXXX| $7E05         Sample Copy
    .byte $FF ; |XXXXXXXX| $7E06         Sample Copy
    .byte $FF ; |XXXXXXXX| $7E07         Sample Copy
    .byte $FF ; |XXXXXXXX| $7E08         Sample Copy
    .byte $FF ; |XXXXXXXX| $7E09         Sample Copy
    .byte $FF ; |XXXXXXXX| $7E0A         Sample Copy
    .byte $FF ; |XXXXXXXX| $7E0B         Sample Copy
    .byte $FF ; |XXXXXXXX| $7E0C         Sample Copy
    .byte $FF ; |XXXXXXXX| $7E0D         Sample Copy
    .byte $FF ; |XXXXXXXX| $7E0E         Sample Copy
    .byte $FF ; |XXXXXXXX| $7E0F         Sample Copy

  ELSE BITCORP

;This code originates at $7DB0 in Bit Corporation rom. The
;sample rom has it all erased. It is garbage code, it actually
;comes from $7A00 to $7A5F in the Bit Corp rom, and somehow got
;copied here.

    jmp    $7A21                 ; 3     Bit Corp
G7A03:
    ldx    #$10                  ; 2     Bit Corp
    bne    G7A09                 ; 2³    Bit Corp
G7A07:
    ldx    #$30                  ; 2     Bit Corp
G7A09:
    lda    $EC                   ; 3     Bit Corp
    cmp    #$31                  ; 2     Bit Corp
    bcs    G7A15                 ; 2³    Bit Corp
    clc                          ; 2     Bit Corp
    txa                          ; 2     Bit Corp
    adc    $EC                   ; 3     Bit Corp
    sta    $EC                   ; 3     Bit Corp
G7A15:
    lda    $EF                   ; 3     Bit Corp
    cmp    #$31                  ; 2     Bit Corp
    bcs    G7A21                 ; 2³    Bit Corp
    clc                          ; 2     Bit Corp
    txa                          ; 2     Bit Corp
    adc    $EF                   ; 3     Bit Corp
    sta    $EF                   ; 3     Bit Corp
G7A21:
    rts                          ; 6     Bit Corp

G7A22:
    sta.wy $EB,Y                 ; 5     Bit Corp
    lda    $C4,X                 ; 4     Bit Corp
    sta.wy $EC,Y                 ; 5     Bit Corp
    lda    $C2,X                 ; 4     Bit Corp
    asl                          ; 2     Bit Corp
    cmp    #2                    ; 2     Bit Corp
    bcs    G7A33                 ; 2³    Bit Corp
    lda    #2                    ; 2     Bit Corp
G7A33:
    cmp    #$94                  ; 2     Bit Corp
    bcc    G7A39                 ; 2³    Bit Corp
    lda    #$93                  ; 2     Bit Corp
G7A39:
    sta.wy $EA,Y                 ; 5     Bit Corp
    iny                          ; 2     Bit Corp
    iny                          ; 2     Bit Corp
    iny                          ; 2     Bit Corp
    rts                          ; 6     Bit Corp

    .byte $10 ; |   X    | $7DF0         Bit Corp
    .byte $08 ; |    X   | $7DF1         Bit Corp
    .byte $48 ; | X  X   | $7DF2         Bit Corp
    .byte $0C ; |    XX  | $7DF3         Bit Corp
    .byte $59 ; | X XX  X| $7DF4         Bit Corp
    .byte $24 ; |  X  X  | $7DF5         Bit Corp
    .byte $74 ; | XXX X  | $7DF6         Bit Corp
    .byte $28 ; |  X X   | $7DF7         Bit Corp
    .byte $93 ; |X  X  XX| $7DF8         Bit Corp
    .byte $20 ; |  X     | $7DF9         Bit Corp
    .byte $BE ; |X XXXXX | $7DFA         Bit Corp
    .byte $3A ; |  XXX X | $7DFB         Bit Corp
    .byte $28 ; |  X X   | $7DFC         Bit Corp
    .byte $B6 ; |X XX XX | $7DFD         Bit Corp
    .byte $6D ; | XX XX X| $7DFE         Bit Corp
    .byte $4F ; | X  XXXX| $7DFF         Bit Corp
    .byte $8F ; |X   XXXX| $7E00         Bit Corp
    .byte $5E ; | X XXXX | $7E01         Bit Corp
    .byte $AC ; |X X XX  | $7E02         Bit Corp
    .byte $6B ; | XX X XX| $7E03         Bit Corp
    .byte $C4 ; |XX   X  | $7E04         Bit Corp
    .byte $50 ; | X X    | $7E05         Bit Corp
    .byte $D8 ; |XX XX   | $7E06         Bit Corp
    .byte $43 ; | X    XX| $7E07         Bit Corp
    .byte $26 ; |  X  XX | $7E08         Bit Corp
    .byte $78 ; | XXXX   | $7E09         Bit Corp
    .byte $45 ; | X   X X| $7E0A         Bit Corp
    .byte $94 ; |X  X X  | $7E0B         Bit Corp
    .byte $6A ; | XX X X | $7E0C         Bit Corp
    .byte $6A ; | XX X X | $7E0D         Bit Corp
    .byte $84 ; |X    X  | $7E0E         Bit Corp
    .byte $B9 ; |X XXX  X| $7E0F         Bit Corp

  ENDIF

;==================================================================================================

    .byte $FF ; |XXXXXXXX| $7E10
    .byte $FF ; |XXXXXXXX| $7E11
    .byte $00 ; |        | $7E12
    .byte $5A ; | X XX X | $7E13
    .byte $3C ; |  XXXX  | $7E14
    .byte $F7 ; |XXXX XXX| $7E15
    .byte $7E ; | XXXXXX | $7E16
    .byte $EF ; |XXX XXXX| $7E17
    .byte $3C ; |  XXXX  | $7E18
    .byte $5A ; | X XX X | $7E19
    .byte $00 ; |        | $7E1A
    .byte $18 ; |   XX   | $7E1B
    .byte $7E ; | XXXXXX | $7E1C
    .byte $EF ; |XXX XXXX| $7E1D
    .byte $7E ; | XXXXXX | $7E1E
    .byte $F7 ; |XXXX XXX| $7E1F
    .byte $7E ; | XXXXXX | $7E20
    .byte $18 ; |   XX   | $7E21
    .byte $00 ; |        | $7E22
    .byte $18 ; |   XX   | $7E23
    .byte $3C ; |  XXXX  | $7E24
    .byte $B5 ; |X XX X X| $7E25
    .byte $FF ; |XXXXXXXX| $7E26
    .byte $AD ; |X X XX X| $7E27
    .byte $3C ; |  XXXX  | $7E28
    .byte $18 ; |   XX   | $7E29
    .byte $00 ; |        | $7E2A
    .byte $18 ; |   XX   | $7E2B
    .byte $3C ; |  XXXX  | $7E2C
    .byte $6E ; | XX XXX | $7E2D
    .byte $7E ; | XXXXXX | $7E2E
    .byte $76 ; | XXX XX | $7E2F
    .byte $3C ; |  XXXX  | $7E30
    .byte $18 ; |   XX   | $7E31
    .byte $00 ; |        | $7E32
    .byte $92 ; |X  X  X | $7E33
    .byte $44 ; | X   X  | $7E34
    .byte $10 ; |   X    | $7E35
    .byte $BA ; |X XXX X | $7E36
    .byte $10 ; |   X    | $7E37
    .byte $44 ; | X   X  | $7E38
    .byte $92 ; |X  X  X | $7E39
    .byte $00 ; |        | $7E3A
    .byte $00 ; |        | $7E3B
    .byte $08 ; |    X   | $7E3C
    .byte $00 ; |        | $7E3D
    .byte $41 ; | X     X| $7E3E
    .byte $00 ; |        | $7E3F
    .byte $08 ; |    X   | $7E40
    .byte $00 ; |        | $7E41
    .byte $00 ; |        | $7E42
    .byte $24 ; |  X  X  | $7E43
    .byte $FF ; |XXXXXXXX| $7E44
    .byte $76 ; | XXX XX | $7E45
    .byte $FF ; |XXXXXXXX| $7E46
    .byte $6E ; | XX XXX | $7E47
    .byte $FF ; |XXXXXXXX| $7E48
    .byte $24 ; |  X  X  | $7E49
    .byte $00 ; |        | $7E4A
    .byte $C3 ; |XX    XX| $7E4B
    .byte $7E ; | XXXXXX | $7E4C
    .byte $EF ; |XXX XXXX| $7E4D
    .byte $7E ; | XXXXXX | $7E4E
    .byte $F7 ; |XXXX XXX| $7E4F
    .byte $7E ; | XXXXXX | $7E50
    .byte $C3 ; |XX    XX| $7E51
    .byte $00 ; |        | $7E52
    .byte $0D ; |    XX X| $7E53
    .byte $1A ; |   XX X | $7E54
    .byte $37 ; |  XX XXX| $7E55
    .byte $E5 ; |XXX  X X| $7E56
    .byte $37 ; |  XX XXX| $7E57
    .byte $1A ; |   XX X | $7E58
    .byte $0D ; |    XX X| $7E59
    .byte $00 ; |        | $7E5A
    .byte $AC ; |X X XX  | $7E5B
    .byte $DE ; |XX XXXX | $7E5C
    .byte $56 ; | X X XX | $7E5D
    .byte $6C ; | XX XX  | $7E5E
    .byte $72 ; | XXX  X | $7E5F
    .byte $FC ; |XXXXXX  | $7E60
    .byte $C6 ; |XX   XX | $7E61
    .byte $00 ; |        | $7E62
    .byte $BA ; |X XXX X | $7E63
    .byte $6C ; | XX XX  | $7E64
    .byte $BA ; |X XXX X | $7E65
    .byte $C6 ; |XX   XX | $7E66
    .byte $6C ; | XX XX  | $7E67
    .byte $38 ; |  XXX   | $7E68
    .byte $10 ; |   X    | $7E69
    .byte $00 ; |        | $7E6A
    .byte $6A ; | XX X X | $7E6B
    .byte $F6 ; |XXXX XX | $7E6C
    .byte $D4 ; |XX X X  | $7E6D
    .byte $6C ; | XX XX  | $7E6E
    .byte $9C ; |X  XXX  | $7E6F
    .byte $7E ; | XXXXXX | $7E70
    .byte $C6 ; |XX   XX | $7E71
    .byte $00 ; |        | $7E72
    .byte $B0 ; |X XX    | $7E73
    .byte $58 ; | X XX   | $7E74
    .byte $EC ; |XXX XX  | $7E75
    .byte $A7 ; |X X  XXX| $7E76
    .byte $EC ; |XXX XX  | $7E77
    .byte $58 ; | X XX   | $7E78
    .byte $B0 ; |X XX    | $7E79
    .byte $00 ; |        | $7E7A
    .byte $C6 ; |XX   XX | $7E7B
    .byte $7E ; | XXXXXX | $7E7C
    .byte $9C ; |X  XXX  | $7E7D
    .byte $6C ; | XX XX  | $7E7E
    .byte $D4 ; |XX X X  | $7E7F
    .byte $F6 ; |XXXX XX | $7E80
    .byte $6A ; | XX X X | $7E81
    .byte $00 ; |        | $7E82
    .byte $10 ; |   X    | $7E83
    .byte $38 ; |  XXX   | $7E84
    .byte $6C ; | XX XX  | $7E85
    .byte $C6 ; |XX   XX | $7E86
    .byte $BA ; |X XXX X | $7E87
    .byte $6C ; | XX XX  | $7E88
    .byte $BA ; |X XXX X | $7E89
    .byte $00 ; |        | $7E8A
    .byte $C6 ; |XX   XX | $7E8B
    .byte $FC ; |XXXXXX  | $7E8C
    .byte $72 ; | XXX  X | $7E8D
    .byte $6C ; | XX XX  | $7E8E
    .byte $56 ; | X X XX | $7E8F
    .byte $DE ; |XX XXXX | $7E90
    .byte $AC ; |X X XX  | $7E91
    .byte $00 ; |        | $7E92
    .byte $00 ; |        | $7E93
    .byte $7E ; | XXXXXX | $7E94
    .byte $FF ; |XXXXXXXX| $7E95
    .byte $DB ; |XX XX XX| $7E96
    .byte $66 ; | XX  XX | $7E97
    .byte $3C ; |  XXXX  | $7E98
    .byte $18 ; |   XX   | $7E99
    .byte $00 ; |        | $7E9A
    .byte $00 ; |        | $7E9B
    .byte $07 ; |     XXX| $7E9C
    .byte $1E ; |   XXXX | $7E9D
    .byte $3F ; |  XXXXXX| $7E9E
    .byte $7E ; | XXXXXX | $7E9F
    .byte $7D ; | XXXXX X| $7EA0
    .byte $EA ; |XXX X X | $7EA1
    .byte $00 ; |        | $7EA2
    .byte $70 ; | XXX    | $7EA3
    .byte $F8 ; |XXXXX   | $7EA4
    .byte $F4 ; |XXXX X  | $7EA5
    .byte $FA ; |XXXXX X | $7EA6
    .byte $F4 ; |XXXX X  | $7EA7
    .byte $F8 ; |XXXXX   | $7EA8
    .byte $70 ; | XXX    | $7EA9
    .byte $00 ; |        | $7EAA
    .byte $00 ; |        | $7EAB
    .byte $EA ; |XXX X X | $7EAC
    .byte $7D ; | XXXXX X| $7EAD
    .byte $7E ; | XXXXXX | $7EAE
    .byte $3F ; |  XXXXXX| $7EAF
    .byte $1E ; |   XXXX | $7EB0
    .byte $07 ; |     XXX| $7EB1
    .byte $00 ; |        | $7EB2
    .byte $00 ; |        | $7EB3
    .byte $18 ; |   XX   | $7EB4
    .byte $3C ; |  XXXX  | $7EB5
    .byte $66 ; | XX  XX | $7EB6
    .byte $DB ; |XX XX XX| $7EB7
    .byte $FF ; |XXXXXXXX| $7EB8
    .byte $7E ; | XXXXXX | $7EB9
    .byte $00 ; |        | $7EBA
    .byte $00 ; |        | $7EBB
    .byte $57 ; | X X XXX| $7EBC
    .byte $BE ; |X XXXXX | $7EBD
    .byte $7E ; | XXXXXX | $7EBE
    .byte $FC ; |XXXXXX  | $7EBF
    .byte $78 ; | XXXX   | $7EC0
    .byte $E0 ; |XXX     | $7EC1
    .byte $00 ; |        | $7EC2
    .byte $1C ; |   XXX  | $7EC3
    .byte $3E ; |  XXXXX | $7EC4
    .byte $5E ; | X XXXX | $7EC5
    .byte $BE ; |X XXXXX | $7EC6
    .byte $5E ; | X XXXX | $7EC7
    .byte $3E ; |  XXXXX | $7EC8
    .byte $1C ; |   XXX  | $7EC9
    .byte $00 ; |        | $7ECA
    .byte $00 ; |        | $7ECB
    .byte $E0 ; |XXX     | $7ECC
    .byte $78 ; | XXXX   | $7ECD
    .byte $FC ; |XXXXXX  | $7ECE
    .byte $7E ; | XXXXXX | $7ECF
    .byte $BE ; |X XXXXX | $7ED0
    .byte $57 ; | X X XXX| $7ED1
    .byte $00 ; |        | $7ED2
    .byte $00 ; |        | $7ED3
    .byte $00 ; |        | $7ED4
    .byte $00 ; |        | $7ED5
    .byte $10 ; |   X    | $7ED6
    .byte $28 ; |  X X   | $7ED7
    .byte $10 ; |   X    | $7ED8
    .byte $00 ; |        | $7ED9
    .byte $00 ; |        | $7EDA
    .byte $00 ; |        | $7EDB
    .byte $84 ; |X    X  | $7EDC
    .byte $30 ; |  XX    | $7EDD
    .byte $78 ; | XXXX   | $7EDE
    .byte $78 ; | XXXX   | $7EDF
    .byte $30 ; |  XX    | $7EE0
    .byte $84 ; |X    X  | $7EE1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7EE2 SUBROUTINE
    sec                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
L7EE5:
    sbc    #$0F                  ; 2
    bcs    L7EE5                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0,X                ; 4
    sta    RESP0,X               ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $FF ; |XXXXXXXX| $7EF4
    .byte $FF ; |XXXXXXXX| $7EF5
    .byte $FF ; |XXXXXXXX| $7EF6
    .byte $FF ; |XXXXXXXX| $7EF7
    .byte $FF ; |XXXXXXXX| $7EF8
    .byte $FF ; |XXXXXXXX| $7EF9
    .byte $FF ; |XXXXXXXX| $7EFA
    .byte $FF ; |XXXXXXXX| $7EFB
    .byte $FF ; |XXXXXXXX| $7EFC
    .byte $FF ; |XXXXXXXX| $7EFD
    .byte $FF ; |XXXXXXXX| $7EFE
    .byte $FF ; |XXXXXXXX| $7EFF

    .byte $00 ; |        | $7F00
    .byte $00 ; |        | $7F01
    .byte $00 ; |        | $7F02
    .byte $00 ; |        | $7F03
    .byte $00 ; |        | $7F04
    .byte $00 ; |        | $7F05
    .byte $00 ; |        | $7F06
    .byte $00 ; |        | $7F07
    .byte $00 ; |        | $7F08
    .byte $3C ; |  XXXX  | $7F09
    .byte $66 ; | XX  XX | $7F0A
    .byte $66 ; | XX  XX | $7F0B
    .byte $66 ; | XX  XX | $7F0C
    .byte $66 ; | XX  XX | $7F0D
    .byte $66 ; | XX  XX | $7F0E
    .byte $3C ; |  XXXX  | $7F0F
    .byte $00 ; |        | $7F10
    .byte $3C ; |  XXXX  | $7F11
    .byte $18 ; |   XX   | $7F12
    .byte $18 ; |   XX   | $7F13
    .byte $18 ; |   XX   | $7F14
    .byte $18 ; |   XX   | $7F15
    .byte $38 ; |  XXX   | $7F16
    .byte $18 ; |   XX   | $7F17
    .byte $00 ; |        | $7F18
    .byte $7E ; | XXXXXX | $7F19
    .byte $60 ; | XX     | $7F1A
    .byte $60 ; | XX     | $7F1B
    .byte $3C ; |  XXXX  | $7F1C
    .byte $06 ; |     XX | $7F1D
    .byte $46 ; | X   XX | $7F1E
    .byte $3C ; |  XXXX  | $7F1F
    .byte $00 ; |        | $7F20
    .byte $3C ; |  XXXX  | $7F21
    .byte $46 ; | X   XX | $7F22
    .byte $06 ; |     XX | $7F23
    .byte $1C ; |   XXX  | $7F24
    .byte $06 ; |     XX | $7F25
    .byte $46 ; | X   XX | $7F26
    .byte $3C ; |  XXXX  | $7F27
    .byte $00 ; |        | $7F28
    .byte $0C ; |    XX  | $7F29
    .byte $0C ; |    XX  | $7F2A
    .byte $7E ; | XXXXXX | $7F2B
    .byte $6C ; | XX XX  | $7F2C
    .byte $3C ; |  XXXX  | $7F2D
    .byte $1C ; |   XXX  | $7F2E
    .byte $0C ; |    XX  | $7F2F
    .byte $00 ; |        | $7F30
    .byte $7C ; | XXXXX  | $7F31
    .byte $06 ; |     XX | $7F32
    .byte $06 ; |     XX | $7F33
    .byte $7C ; | XXXXX  | $7F34
    .byte $60 ; | XX     | $7F35
    .byte $60 ; | XX     | $7F36
    .byte $7E ; | XXXXXX | $7F37
    .byte $00 ; |        | $7F38
    .byte $3C ; |  XXXX  | $7F39
    .byte $66 ; | XX  XX | $7F3A
    .byte $66 ; | XX  XX | $7F3B
    .byte $7C ; | XXXXX  | $7F3C
    .byte $60 ; | XX     | $7F3D
    .byte $62 ; | XX   X | $7F3E
    .byte $3C ; |  XXXX  | $7F3F
    .byte $00 ; |        | $7F40
    .byte $18 ; |   XX   | $7F41
    .byte $18 ; |   XX   | $7F42
    .byte $18 ; |   XX   | $7F43
    .byte $0C ; |    XX  | $7F44
    .byte $06 ; |     XX | $7F45
    .byte $66 ; | XX  XX | $7F46
    .byte $7E ; | XXXXXX | $7F47
    .byte $00 ; |        | $7F48
    .byte $3C ; |  XXXX  | $7F49
    .byte $66 ; | XX  XX | $7F4A
    .byte $66 ; | XX  XX | $7F4B
    .byte $3C ; |  XXXX  | $7F4C
    .byte $66 ; | XX  XX | $7F4D
    .byte $66 ; | XX  XX | $7F4E
    .byte $3C ; |  XXXX  | $7F4F
    .byte $00 ; |        | $7F50
    .byte $3C ; |  XXXX  | $7F51
    .byte $46 ; | X   XX | $7F52
    .byte $06 ; |     XX | $7F53
    .byte $3E ; |  XXXXX | $7F54
    .byte $66 ; | XX  XX | $7F55
    .byte $66 ; | XX  XX | $7F56
    .byte $3C ; |  XXXX  | $7F57

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7F58 SUBROUTINE
    lda    $8C                   ; 3
    and    #$17                  ; 2
    cmp    #$17                  ; 2
    beq    L7F61                 ; 2³
    rts                          ; 6

L7F61:
    inc    $8D                   ; 5
    lda    $8D                   ; 3
    cmp    #$20                  ; 2
    bcc    L7F7F                 ; 2³
    cmp    #$40                  ; 2
    bcc    L7F83                 ; 2³
    cmp    #$58                  ; 2
    bcc    L7F87                 ; 2³
    cmp    #$80                  ; 2
    bcc    L7F7F                 ; 2³
    cmp    #$A0                  ; 2
    bcc    L7F83                 ; 2³
    cmp    #$B8                  ; 2
    bcc    L7F87                 ; 2³
    bcs    L7F7F                 ; 3   always branch

L7F7F:
    lda    #$58                  ; 2
    bne    L7F89                 ; 3   always branch

L7F83:
    lda    #$B6                  ; 2
    bne    L7F89                 ; 3   always branch

L7F87:
    lda    #$68                  ; 2
L7F89:
    sta    $8F                   ; 3
    ldy    #3                    ; 2
    sty    $DD                   ; 3
    ldy    #0                    ; 2
    ldx    #6                    ; 2
L7F93:
    lda    $B1,X                 ; 4
    cmp    #$FF                  ; 2
    beq    L7F9A                 ; 2³
    iny                          ; 2
L7F9A:
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    L7F93                 ; 2³
    cpy    $DD                   ; 3
    bcs    L7FEE                 ; 2³
L7FA3:
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    lda    $B1,X                 ; 4
    cmp    #$FF                  ; 2
    bne    L7FA3                 ; 2³
    lda    $8C                   ; 3
    and    #$3F                  ; 2
    cmp    #$47                  ; 2
    bcc    L7FB6                 ; 2³
    lda    #$27                  ; 2
L7FB6:
    sta    $B1,X                 ; 4
    lda    $8C                   ; 3
    cmp    #$95                  ; 2
    bcc    L7FC0                 ; 2³
    and    #$7F                  ; 2
L7FC0:
    sta    $B0,X                 ; 4
    lda    $8C                   ; 3
    and    #$03                  ; 2
    beq    L7FE6                 ; 2³
    cmp    #2                    ; 2
    beq    L7FDE                 ; 2³
    bcc    L7FD6                 ; 2³
    lda    #2                    ; 2
    sta    $B0,X                 ; 4
    lda    #$B1                  ; 2
    bne    L7FEC                 ; 3   always branch


L7FD6:
    lda    #1                    ; 2
    sta    $B1,X                 ; 4
    lda    #$A1                  ; 2
    bne    L7FEC                 ; 3   always branch

L7FDE:
    lda    #$94                  ; 2
    sta    $B0,X                 ; 4
    lda    #$91                  ; 2
    bne    L7FEC                 ; 3   always branch

L7FE6:
    lda    #$47                  ; 2
    sta    $B1,X                 ; 4
    lda    #$C1                  ; 2
L7FEC:
    sta    $B2,X                 ; 4
L7FEE:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  REPEAT ($7FFC - *)
    .byte $FF
  REPEND

       ORG $7FFC

    .byte $00 ; |        | $7FFC
    .byte $F0 ; |XXXX    | $7FFD   start
    .byte $00 ; |        | $7FFE
    .byte $F0 ; |XXXX    | $7FFF   start
