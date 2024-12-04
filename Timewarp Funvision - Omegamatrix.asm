; Rough Disassembly of Time Warp (Funvision) PAL
; By Omegamatrix
; Using DiStella v3.0
;
;
; Command Line: distella.exe -pasfcTime.cfg TIME4.bin > TimeWarp(Fun).asm
;
; Time Warp (Funvision) PAL
; Time.cfg contents:
;
;      ORG 7000
;      CODE 7000 74D5
;      GFX 74D6 750D
;      CODE 750E 7ACB
;      GFX 7ACC 7ACC
;      CODE 7ACD 7B00
;      GFX 7B01 7B8E
;      CODE 7B8F 7BF5
;      GFX 7BF6 7CBA
;      CODE 7CBB 7CE4
;      GFX 7CE5 7F57
;      CODE 7F58 7FAF
;      GFX 7FB0 7FFF
;
;
; Command Line: distella.exe -pasfcTimeZel.cfg Time(zel).bin > TimeWarp(Zel).asm
;
; Time Warp (Zellers) NTSC
; TimeZel.cfg contents:
;
;      ORG 7000
;      CODE 7000 74BC
;      GFX 74BD 74F4
;      CODE 74F5 7AAE
;      GFX 7AAF 7AB0
;      CODE 7AB1 7AFF
;      GFX 7B00 7B8E
;      CODE 7B8F 7BF5
;      GFX 7BF6 7CBA
;      CODE 7CBB 7CE4
;      GFX 7CE5 7F57
;      CODE 7F58 7FAF
;      GFX 7FB0 7FD0
;      CODE 7FD1 7FF4
;      GFX 7FF5 7FFF


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
HMBL    =  $24
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C

; Read TIA Baseline = $00
CXM0P   =  $00
CXM1P   =  $01
CXP0FB  =  $02
CXM0FB  =  $04
CXPPMM  =  $07
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      USER SWITCHES AND CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


FUNVISION   = 1
ZELLERS     = 0

  IF FUNVISION
TIME_OVERSCAN          = $36
TIME_VBLANK            = $36
TIME3                  = $2F
RED                    = $64
YELLOW                 = $2A
  ELSE ZELLERS
TIME_OVERSCAN          = $22
TIME_VBLANK            = $24
TIME3                  = $27
RED                    = $34
YELLOW                 = $1A
  ENDIF


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Note that the Funvision rom was disassembled first. The labels and
; the branches across page boundaries (2³+1) apply to it specifically.

       ORG $7000

    cld                          ; 2
    ldx    #0                    ; 2
    lda    #0                    ; 2
L7005:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    L7005                 ; 2³

    lda    #TIME_OVERSCAN        ; 2
    sta    TIM64T                ; 4
    jsr    L7BBD                 ; 6
L7013:
    lda    INTIM                 ; 4
    bne    L7013                 ; 2³
    lda    #$82                  ; 2
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3

 IF FUNVISION
    sta    WSYNC                 ; 3   3 extra scanlines
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
  ENDIF

    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
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
    sta    ENABL                 ; 3
    lda    #TIME_VBLANK          ; 2
    sta    TIM64T                ; 4
    lda    $B1                   ; 3
    cmp    #$88                  ; 2
    bcs    L7075                 ; 2³
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    bne    L7080                 ; 2³
    ldx    $B2                   ; 3
    inx                          ; 2
    cpx    #4                    ; 2
    bcc    L705D                 ; 2³
    ldx    #1                    ; 2
L705D:
    stx    $B2                   ; 3
    stx    $B5                   ; 3
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    $BE                   ; 3
    sta    $BD                   ; 3
    sta    $B3                   ; 3
    sta    $B4                   ; 3
    lda    #$88                  ; 2
    sta    $B1                   ; 3
    bne    L7084                 ; 2³
L7075:
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    beq    L7080                 ; 2³
    lda    #$80                  ; 2
    sta    $B1                   ; 3
L7080:
    lda    $B1                   ; 3
    bne    L7084                 ; 2³
L7084:
    lda    $8C                   ; 3
    ldx    #2                    ; 2
    jsr    L7BAB                 ; 6
    lda    $A9                   ; 3
    ldx    #3                    ; 2
    jsr    L7BAB                 ; 6
    lda    $AD                   ; 3
    ldx    #4                    ; 2
    jsr    L7BAB                 ; 6
L7099:
    lda    INTIM                 ; 4
    bne    L7099                 ; 2³
    lda    #YELLOW               ; 2
    ldx    #0                    ; 2
    ldy    $BD                   ; 3
    jsr    L79F8                 ; 6

  IF FUNVISION
    ldx    #8                    ; 2
L70A9:
    sta    WSYNC                 ; 3   9 extra scanlines
    dex                          ; 2
    bpl    L70A9                 ; 2³
  ENDIF

    lda    $85                   ; 3
    ldx    #0                    ; 2
    jsr    L7BAB                 ; 6
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    stx    ENAM0                 ; 3
    stx    ENAM1                 ; 3
    stx    ENABL                 ; 3
    sta    CXCLR                 ; 3
    lda    $B7                   ; 3
    cmp    #$20                  ; 2
    beq    L70DB                 ; 2³
    cmp    #$40                  ; 2
    beq    L70DB                 ; 2³
    lda    #$4B                  ; 2
    sta    $8F                   ; 3

  IF ZELLERS
    lda    #$56                  ; 2
    sta    COLUPF                ; 3   color change
  ENDIF

    ldx    #8                    ; 2
    sta    WSYNC                 ; 3
    sta    HMCLR                 ; 3
    jsr    L756D                 ; 6
    jmp    L716D                 ; 3
L70DB:
    sta    WSYNC                 ; 3
    sta    HMCLR                 ; 3
    lda    #RED                  ; 2
    sta    COLUPF                ; 3
    lda    $98                   ; 3
    ldx    #1                    ; 2
    jsr    L7BAB                 ; 6
    stx    CTRLPF                ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldx    #$A0                  ; 2
    lda    #0                    ; 2
    sta    PF0                   ; 3
    lda    #$27                  ; 2
    sta    $C0                   ; 3
    sta    WSYNC                 ; 3
    sta    HMCLR                 ; 3

  IF FUNVISION
    sta    WSYNC                 ; 3   1 extra scanline
  ENDIF

L7100:
    ldy    $89                   ; 3
    sta    WSYNC                 ; 3
    beq    L710E                 ; 2³
    lda    ($87),Y               ; 5
    sta    GRP0                  ; 3
    dec    $89                   ; 5
    bpl    L7116                 ; 2³
L710E:
    cpx    $86                   ; 3
    bne    L7116                 ; 2³
    lda    #9                    ; 2
    sta    $89                   ; 3
L7116:
    ldy    $C0                   ; 3
    lda    L7B67,Y               ; 4
    sta    PF1                   ; 3
    lda    L7C93,Y               ; 4
    sta    PF2                   ; 3
    ldy    $89                   ; 3
    lda    ($8A),Y               ; 5
    sta    COLUP0                ; 3
    ldy    $A6                   ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($A7),Y               ; 5
    sta    COLUP1                ; 3
    dex                          ; 2
    sta    WSYNC                 ; 3
    ldy    $89                   ; 3
    beq    L7145                 ; 2³
    lda    ($87),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($8A),Y               ; 5
    sta    COLUP0                ; 3
    dec    $89                   ; 5
    bpl    L714D                 ; 2³
L7145:
    cpx    $86                   ; 3
    bne    L714D                 ; 2³
    lda    #9                    ; 2
    sta    $89                   ; 3
L714D:
    txa                          ; 2
    and    #$02                  ; 2
    bne    L7154                 ; 2³
    dec    $C0                   ; 5
L7154:
    ldy    $A6                   ; 3
    beq    L715D                 ; 2³
    dec    $A6                   ; 5
    jmp    L7165                 ; 3
L715D:
    cpx    $99                   ; 3
    bne    L7165                 ; 2³
    lda    #$13                  ; 2
    sta    $A6                   ; 3
L7165:
    dex                          ; 2
    bne    L7100                 ; 2³
    jmp    L71EF                 ; 3
L716B:
    sta    WSYNC                 ; 3
L716D:
    ldy    $89                   ; 3
    beq    L7179                 ; 2³
    lda    ($87),Y               ; 5
    sta    GRP0                  ; 3
    dec    $89                   ; 5
    bpl    L7183                 ; 2³
L7179:
    lda    $8F                   ; 3
    cmp    $86                   ; 3
    bne    L7183                 ; 2³
    lda    #9                    ; 2
    sta    $89                   ; 3
L7183:
    ldy    #$FF                  ; 2
    lda    $8F                   ; 3
    cmp    $8D                   ; 3
    bne    L718D                 ; 2³
    sty    ENAM0                 ; 3
L718D:
    cmp    $AA                   ; 3
    bne    L7193                 ; 2³
    sty    ENAM1                 ; 3
L7193:
    cmp    $AE                   ; 3
    bne    L7199                 ; 2³
    sty    ENABL                 ; 3
L7199:
    dec    $8F                   ; 5
    beq    L71EC                 ; 2³
    cmp    $91,X                 ; 4
    beq    L71CC                 ; 2³
    ldy    $89                   ; 3
    sta    WSYNC                 ; 3
    beq    L71B1                 ; 2³
    lda    ($87),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($8A),Y               ; 5
    sta    COLUP0                ; 3
    dec    $89                   ; 5
L71B1:
    ldy    $A6                   ; 3
    beq    L71BF                 ; 2³
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($A7),Y               ; 5
    sta    COLUP1                ; 3
    dec    $A6                   ; 5
L71BF:
    lda    #0                    ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
    sta    HMCLR                 ; 3
    jmp    L716B                 ; 3
L71CC:
    lda    $90,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    sta    WSYNC                 ; 3
    sec                          ; 2
L71D3:
    sbc    #$0F                  ; 2
    bcs    L71D3                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP1                  ; 3
    sta    RESP1                 ; 3
    ldy    #7                    ; 2
    sty    $A6                   ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    jmp    L716D                 ; 3
L71EC:
    jsr    L756D                 ; 6

L71EF:
  IF FUNVISION
    ldx    #6                    ; 2
L71F1:
    sta    WSYNC                 ; 3   7 extra scanlines
    dex                          ; 2
    bpl    L71F1                 ; 2³
  ENDIF

    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #$20                  ; 2
    sta    CTRLPF                ; 3
    lda    #$9C                  ; 2
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    ldy    #4                    ; 2
    ldx    $B6                   ; 3
    beq    L722E                 ; 2³
    cpx    #8                    ; 2
    bcc    L7220                 ; 2³
    ldx    #8                    ; 2
    stx    $B6                   ; 3
L7220:
    sec                          ; 2
    ror                          ; 2
    ror                          ; 2
    dex                          ; 2
    beq    L722E                 ; 2³
    dey                          ; 2
    bne    L7220                 ; 2³
    tay                          ; 2
    lda    #0                    ; 2
    beq    L7235                 ; 2³
L722E:
    sta    WSYNC                 ; 3
    tay                          ; 2
    lda    #0                    ; 2
    beq    L723B                 ; 2³
L7235:
    sec                          ; 2
    rol                          ; 2
    rol                          ; 2
    dex                          ; 2
    bne    L7235                 ; 2³
L723B:
    tax                          ; 2
    lda    #6                    ; 2
    sta    $DC                   ; 3
L7240:
    sta    WSYNC                 ; 3
    dec.w  $DC                   ; 6
    beq    L7264                 ; 2³
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
    jmp    L7240                 ; 3

L7264:
  IF FUNVISION
    ldx    #6                    ; 2
L7266:
    sta    WSYNC                 ; 3   7 extra scanlines
    dex                          ; 2
    bpl    L7266                 ; 2³
  ENDIF

    jsr    L7F58                 ; 6
    lda    #TIME3                ; 2
    sta    TIM64T                ; 4
    dec    $BB                   ; 5
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    beq    L72AF                 ; 2³
    lda    $BB                   ; 3
    and    #$07                  ; 2
    beq    L7286                 ; 2³
    cmp    #4                    ; 2
    bne    L7289                 ; 2³
L7286:
    jsr    L7624                 ; 6
L7289:
    lda    $B1                   ; 3
    bne    L72E4                 ; 2³
    lda    $BB                   ; 3
    and    #$07                  ; 2
    bne    L7296                 ; 2³
    jsr    L7847                 ; 6
L7296:
    lda    $B7                   ; 3
    cmp    #$20                  ; 2
    beq    L72AC                 ; 2³
    cmp    #$40                  ; 2
    beq    L72AC                 ; 2³
    jsr    L78F7                 ; 6
    jsr    L786B                 ; 6
    jsr    L776B                 ; 6
    jmp    L7013                 ; 3
L72AC:
    jsr    L76EA                 ; 6
L72AF:
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    bne    L72E1                 ; 2³
L72B6:
    lda    #$14                  ; 2
    sta    $C2                   ; 3
    lda    #0                    ; 2
    sta    $B3                   ; 3
    sta    $B4                   ; 3
    sta    $B5                   ; 3
    sta    $BD                   ; 3
    sta    $B1                   ; 3
    sta    $BE                   ; 3
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    ldx    #$40                  ; 2
    lda    $B2                   ; 3
    sta    $C1                   ; 3
    cmp    #2                    ; 2
    bne    L72D8                 ; 2³
    ldx    #$20                  ; 2
L72D8:
    stx    $B7                   ; 3
    lda    #4                    ; 2
    sta    $B6                   ; 3
    jmp    L7351                 ; 3
L72E1:
    jmp    L7013                 ; 3
L72E4:
    cmp    #1                    ; 2
    beq    L72FA                 ; 2³
    cmp    #$60                  ; 2
    beq    L7351                 ; 2³+1
    cmp    #$61                  ; 2
    beq    L72F7                 ; 2³
    cmp    #$62                  ; 2
    beq    L7345                 ; 2³+1
    jmp    L7470                 ; 3
L72F7:
    jmp    L750E                 ; 3
L72FA:
    lda    $BB                   ; 3
    and    #$0F                  ; 2
    bne    L7303                 ; 2³
    jsr    L7847                 ; 6
L7303:
    lda    #$39                  ; 2
    sta    $87                   ; 3
    lda    #0                    ; 2
    sta    $AA                   ; 3
    sta    $AE                   ; 3
    inc    $BD                   ; 5
    inc    $BD                   ; 5
    bne    L733B                 ; 2³
    lda    #$62                  ; 2
    sta    $B1                   ; 3
    sta    $BB                   ; 3
    lda    $B6                   ; 3
    beq    L733E                 ; 2³
    dec    $B6                   ; 5
    lda    $B7                   ; 3
    cmp    #$20                  ; 2
    beq    L7338                 ; 2³
    cmp    #$40                  ; 2
    beq    L7338                 ; 2³
    ldx    #8                    ; 2
L732B:
    lda    L7CE5,X               ; 4
    sta    $90,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    L732B                 ; 2³
    lda    #$23                  ; 2
    sta    $86                   ; 3
L7338:
    jsr    L7CCE                 ; 6
L733B:
    jmp    L7013                 ; 3
L733E:
    lda    #$44                  ; 2
    sta    $B1                   ; 3
    jmp    L7013                 ; 3
L7345:
    lda    $BB                   ; 3
    bne    L734B                 ; 2³
    sta    $B1                   ; 3
L734B:
    jmp    L7013                 ; 3
L734E:
    jmp    L73F5                 ; 3
L7351:
    jsr    L7357                 ; 6
    jmp    L7013                 ; 3
L7357:
    lda    #$FB                  ; 2
    sta    $8B                   ; 3
    lda    #$FC                  ; 2
    sta    $A8                   ; 3
    lda    $B7                   ; 3
    cmp    #$11                  ; 2
    bcc    L7397                 ; 2³
    beq    L73A4                 ; 2³
    cmp    #$20                  ; 2
    bcc    L73B1                 ; 2³
    beq    L737F                 ; 2³
    cmp    #$31                  ; 2
    bcc    L73DB                 ; 2³
    beq    L73E8                 ; 2³
    cmp    #$40                  ; 2
    bcc    L734E                 ; 2³
    lda    $B2                   ; 3
    cmp    #3                    ; 2
    beq    L73CA                 ; 2³
    bne    L7385                 ; 2³
L737F:
    lda    $B2                   ; 3
    cmp    #1                    ; 2
    beq    L73CA                 ; 2³
L7385:
    lda    #$10                  ; 2
    ldx    #9                    ; 2
    jsr    L745E                 ; 6
    lda    #$42                  ; 2
    ldx    #$42                  ; 2
    ldy    $C1                   ; 3
    beq    L740E                 ; 2³+1
    jmp    L7417                 ; 3
L7397:
    lda    #$11                  ; 2
    ldx    #$10                  ; 2
    jsr    L745E                 ; 6
    lda    #$42                  ; 2
    ldx    #$49                  ; 2
    bne    L740E                 ; 2³+1
L73A4:
    lda    #$12                  ; 2
    ldx    #$17                  ; 2
    jsr    L745E                 ; 6
    lda    #$42                  ; 2
    ldx    #$50                  ; 2
    bne    L740E                 ; 2³+1
L73B1:
    lda    $C1                   ; 3
    beq    L73BB                 ; 2³
    lda    #0                    ; 2
    sta    $C1                   ; 3
    beq    L7385                 ; 2³
L73BB:
    lda    #$20                  ; 2
    sta    $C1                   ; 3
    ldx    #$26                  ; 2
    jsr    L745E                 ; 6
    lda    #$54                  ; 2
    ldx    #$6D                  ; 2
    bne    L7421                 ; 2³+1
L73CA:
    lda    #$30                  ; 2
    ldx    #$10                  ; 2
    jsr    L745E                 ; 6
    lda    #$4B                  ; 2
    ldx    #$57                  ; 2
    ldy    $C1                   ; 3
    beq    L740E                 ; 2³+1
    bne    L7417                 ; 2³+1
L73DB:
    lda    #$31                  ; 2
    ldx    #$17                  ; 2
    jsr    L745E                 ; 6
    lda    #$4B                  ; 2
    ldx    #$5E                  ; 2
    bne    L740E                 ; 2³+1
L73E8:
    lda    #$32                  ; 2
    ldx    #$1E                  ; 2
    jsr    L745E                 ; 6
    lda    #$4B                  ; 2
    ldx    #$65                  ; 2
    bne    L740E                 ; 2³+1
L73F5:
    lda    $C1                   ; 3
    beq    L73FF                 ; 2³
    lda    #0                    ; 2
    sta    $C1                   ; 3
    beq    L73CA                 ; 2³
L73FF:
    lda    #$40                  ; 2
    sta    $C1                   ; 3
    ldx    #$26                  ; 2
    jsr    L745E                 ; 6
    lda    #$5D                  ; 2
    ldx    #$80                  ; 2
    bne    L7421                 ; 2³
L740E:
    sta    $8A                   ; 3
    stx    $A7                   ; 3
    lda    #$61                  ; 2
    sta    $B1                   ; 3
    rts                          ; 6

L7417:
    sta    $8A                   ; 3
    stx    $A7                   ; 3
    jsr    L7CBB                 ; 6
    jmp    L7457                 ; 3
L7421:
    sta    $8A                   ; 3
    stx    $A7                   ; 3
    lda    $99                   ; 3
    asl                          ; 2
    and    #$F8                  ; 2
    ora    #$01                  ; 2
    cmp    #$28                  ; 2
    bcs    L7432                 ; 2³
    lda    #$27                  ; 2
L7432:
    cmp    #$9E                  ; 2
    bcc    L7438                 ; 2³
    lda    #$9E                  ; 2
L7438:
    sta    $99                   ; 3
    lda    #$92                  ; 2
    sta    $98                   ; 3
    lda    #0                    ; 2
    sta    $91                   ; 3
    sta    $93                   ; 3
    sta    $95                   ; 3
    sta    $97                   ; 3
    lda    #3                    ; 2
    sta    $85                   ; 3
    lda    $86                   ; 3
    asl                          ; 2
    cmp    #$7D                  ; 2
    bcc    L7455                 ; 2³
    lda    #$7D                  ; 2
L7455:
    sta    $86                   ; 3
L7457:
    lda    #$62                  ; 2
    sta    $B1                   ; 3
    sta    $BB                   ; 3
    rts                          ; 6

L745E:
    sta    $B7                   ; 3
    stx    $A4                   ; 3
    sed                          ; 2
    clc                          ; 2
    lda    $C2                   ; 3
    adc    #5                    ; 2
    bcc    L746C                 ; 2³
    lda    #$99                  ; 2
L746C:
    sta    $C2                   ; 3
    cld                          ; 2
    rts                          ; 6

L7470:
    cmp    #$37                  ; 2
    beq    L74AB                 ; 2³
    cmp    #$44                  ; 2
    bne    L74A0                 ; 2³
    lda    INPT4                 ; 3
    and    #$80                  ; 2
    bne    L7481                 ; 2³
    jmp    L72B6                 ; 3
L7481:
    lda    $BB                   ; 3
    bne    L74A0                 ; 2³
    ldx    #1                    ; 2
    lda    $B7                   ; 3
    cmp    #$20                  ; 2
    beq    L7497                 ; 2³
    cmp    #$40                  ; 2
    beq    L7497                 ; 2³
    ora    #$03                  ; 2
    sta    $B7                   ; 3
    ldx    #0                    ; 2
L7497:
    stx    $C1                   ; 3
    jsr    L7357                 ; 6
    lda    #$44                  ; 2
    sta    $B1                   ; 3
L74A0:
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    $BE                   ; 3
    jmp    L7013                 ; 3
L74AB:
    lda    $BB                   ; 3
    and    #$07                  ; 2
    bne    L74CA                 ; 2³
    ldy    $C3                   ; 3
    beq    L74D1                 ; 2³
    lda    L74D6,Y               ; 4
    sta    AUDF0                 ; 3
    lda    #$0C                  ; 2
    sta    AUDC0                 ; 3
    lda    #8                    ; 2
    sta    AUDV0                 ; 3
L74C2:
    dec    $C3                   ; 5
    bpl    L74CA                 ; 2³
    lda    #$60                  ; 2
    sta    $B1                   ; 3
L74CA:
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
    jmp    L7013                 ; 3
L74D1:
    sty    AUDV0                 ; 3
    jmp    L74C2                 ; 3

L74D6:
    .byte $00 ; |        | $74D6
    .byte $00 ; |        | $74D7
    .byte $00 ; |        | $74D8
    .byte $1A ; |   XX X | $74D9
    .byte $1A ; |   XX X | $74DA
    .byte $1A ; |   XX X | $74DB
    .byte $14 ; |   X X  | $74DC
    .byte $17 ; |   X XXX| $74DD
    .byte $1A ; |   XX X | $74DE
    .byte $1D ; |   XXX X| $74DF
    .byte $1D ; |   XXX X| $74E0
    .byte $00 ; |        | $74E1
    .byte $11 ; |   X   X| $74E2
    .byte $11 ; |   X   X| $74E3
    .byte $00 ; |        | $74E4
    .byte $11 ; |   X   X| $74E5
    .byte $00 ; |        | $74E6
    .byte $11 ; |   X   X| $74E7
    .byte $11 ; |   X   X| $74E8
    .byte $00 ; |        | $74E9
    .byte $0F ; |    XXXX| $74EA
    .byte $0F ; |    XXXX| $74EB
    .byte $00 ; |        | $74EC
    .byte $0F ; |    XXXX| $74ED
    .byte $00 ; |        | $74EE
    .byte $0F ; |    XXXX| $74EF
    .byte $0F ; |    XXXX| $74F0
    .byte $00 ; |        | $74F1
    .byte $1A ; |   XX X | $74F2
    .byte $00 ; |        | $74F3
    .byte $1A ; |   XX X | $74F4
    .byte $14 ; |   X X  | $74F5
    .byte $14 ; |   X X  | $74F6
    .byte $13 ; |   X  XX| $74F7
    .byte $00 ; |        | $74F8
    .byte $13 ; |   X  XX| $74F9
    .byte $00 ; |        | $74FA
    .byte $13 ; |   X  XX| $74FB
    .byte $00 ; |        | $74FC
    .byte $13 ; |   X  XX| $74FD
    .byte $13 ; |   X  XX| $74FE
    .byte $1A ; |   XX X | $74FF
    .byte $1A ; |   XX X | $7500
    .byte $00 ; |        | $7501
    .byte $1A ; |   XX X | $7502
    .byte $00 ; |        | $7503
    .byte $1A ; |   XX X | $7504
    .byte $1A ; |   XX X | $7505
    .byte $00 ; |        | $7506
    .byte $1A ; |   XX X | $7507
    .byte $1A ; |   XX X | $7508
    .byte $00 ; |        | $7509
    .byte $1A ; |   XX X | $750A
    .byte $00 ; |        | $750B
    .byte $1A ; |   XX X | $750C
    .byte $1A ; |   XX X | $750D

L750E:
    lda    $BB                   ; 3
    and    #$0F                  ; 2
    bne    L756A                 ; 2³
    ldy    #0                    ; 2
    sty    $AA                   ; 3
    sty    $AE                   ; 3
    ldx    #8                    ; 2
L751C:
    stx    $A6                   ; 3
    lda    $91,X                 ; 4
    cmp    L7CE6,X               ; 4
    beq    L7558                 ; 2³
    ldy    #$FF                  ; 2
    bcc    L7541                 ; 2³
L7529:
    lda    $91,X                 ; 4
    cmp    L7CE6,X               ; 4
    beq    L7532                 ; 2³
    dec    $91,X                 ; 6
L7532:
    lda    #$92                  ; 2
    cmp    $90,X                 ; 4
    beq    L753A                 ; 2³
    inc    $90,X                 ; 6
L753A:
    dex                          ; 2
    dex                          ; 2
    bpl    L7529                 ; 2³
    jmp    L7558                 ; 3
L7541:
    lda    $91,X                 ; 4
    cmp    L7CE6,X               ; 4
    beq    L754A                 ; 2³
    inc    $91,X                 ; 6
L754A:
    lda    #$92                  ; 2
    cmp    $90,X                 ; 4
    beq    L7552                 ; 2³
    inc    $90,X                 ; 6
L7552:
    inx                          ; 2
    inx                          ; 2
    cpx    #9                    ; 2
    bcc    L7541                 ; 2³
L7558:
    ldx    $A6                   ; 3
    dex                          ; 2
    dex                          ; 2
    bpl    L751C                 ; 2³
    cpy    #0                    ; 2
    bne    L756A                 ; 2³
    ldy    #$62                  ; 2
    sty    $B1                   ; 3
    lda    #5                    ; 2
    sta    $BB                   ; 3
L756A:
    jmp    L7013                 ; 3

L756D:
  IF FUNVISION
    lda    #$A6                  ; 2
    sta    COLUPF                ; 3   color change
  ENDIF

    lda    #7                    ; 2
    sta    $C0                   ; 3
L7575:
    sta    WSYNC                 ; 3
    ldy    $C0                   ; 3
    lda    ($C4),Y               ; 5
    sta    PF0                   ; 3
    lda    ($C6),Y               ; 5
    sta    PF1                   ; 3
    lda    ($C8),Y               ; 5
    sta    PF2                   ; 3
    lda    ($CA),Y               ; 5
    sta    PF0                   ; 3
    lda    ($CC),Y               ; 5
    sta    PF1                   ; 3
    lda    ($CE),Y               ; 5
    sta    PF2                   ; 3
    ldy    $89                   ; 3
    beq    L759B                 ; 2³
    lda    ($87),Y               ; 5
    sta    GRP0                  ; 3
    dec    $89                   ; 5
L759B:
    lda    $86                   ; 3
    cmp    $8F                   ; 3
    bne    L75A5                 ; 2³
    lda    #9                    ; 2
    sta    $89                   ; 3
L75A5:
    lda    #0                    ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    ENAM0                 ; 3
    ldy    $89                   ; 3
    beq    L75B7                 ; 2³
    lda    ($87),Y               ; 5
    dec    $89                   ; 5
L75B7:
    dec    $8F                   ; 5
    dec    $C0                   ; 5
    sta    GRP0                  ; 3
    bpl    L7575                 ; 2³
    rts                          ; 6

L75C0:
    and    #$04                  ; 2
    beq    L75CE                 ; 2³
    lda    $BE                   ; 3
    and    #$FB                  ; 2
    sta    $BE                   ; 3
    lda    #2                    ; 2
    sta    $80                   ; 3
L75CE:
    lda    #8                    ; 2
    sta    AUDC0                 ; 3
    dec    $80                   ; 5
    bmi    L75E8                 ; 2³
    ldx    $80                   ; 3
    lda    L7BFA,X               ; 4
    sta    AUDF0                 ; 3
    lda    #$17                  ; 2
    sta    AUDV0                 ; 3
    lda    $BE                   ; 3
    and    #$3B                  ; 2
    jmp    L7630                 ; 3
L75E8:
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    lda    $BE                   ; 3
    and    #$BB                  ; 2
    sta    $BE                   ; 3
    and    #$3B                  ; 2
    jmp    L7630                 ; 3
L75F7:
    and    #$01                  ; 2
    beq    L7605                 ; 2³+1
    lda    $BE                   ; 3
    and    #$FE                  ; 2
    sta    $BE                   ; 3
    lda    #2                    ; 2
    sta    $83                   ; 3
L7605:
    lda    #8                    ; 2
    sta    AUDC1                 ; 3
    dec    $83                   ; 5
    bmi    L7619                 ; 2³
    ldx    $83                   ; 3
    lda    L7CF9,X               ; 4
    sta    AUDF1                 ; 3
    lda    #$16                  ; 2
    sta    AUDV1                 ; 3
    rts                          ; 6

L7619:
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
    lda    $BE                   ; 3
    and    #$EE                  ; 2
    sta    $BE                   ; 3
    rts                          ; 6

L7624:
    lda    $BE                   ; 3
    beq    L7639                 ; 2³
    cmp    #$80                  ; 2
    bcs    L7640                 ; 2³
L762C:
    cmp    #$40                  ; 2
    bcs    L75C0                 ; 2³+1
L7630:
    cmp    #$20                  ; 2
    bcs    L7699                 ; 2³
L7634:
    cmp    #$10                  ; 2
    bcs    L75F7                 ; 2³+1
    rts                          ; 6

L7639:
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    rts                          ; 6

L7640:
    and    #$08                  ; 2
    beq    L7656                 ; 2³
    lda    $BE                   ; 3
    and    #$F7                  ; 2
    sta    $BE                   ; 3
    lda    #4                    ; 2
    sta    $80                   ; 3
    lda    #$0A                  ; 2
    sta    $82                   ; 3
    lda    #$FF                  ; 2
    sta    $81                   ; 3
L7656:
    lda    #8                    ; 2
    sta    AUDC0                 ; 3
    ldx    $80                   ; 3
    lda.w  $81                   ; 4
    cmp    L7BF6,X               ; 4
    bcc    L7672                 ; 2³
    dex                          ; 2
    bmi    L767D                 ; 2³
    stx    $80                   ; 3
    lda    L7BF6,X               ; 4
    sta    AUDV0                 ; 3
    lda    #$10                  ; 2
    sta    $81                   ; 3
L7672:
    sta    AUDF0                 ; 3
    inc    $81                   ; 5
    lda    $BE                   ; 3
    and    #$37                  ; 2
    jmp    L7630                 ; 3
L767D:
    lda    $82                   ; 3
    sta    AUDV0                 ; 3
    ora    #$10                  ; 2
    sta    AUDF0                 ; 3
    dec    $82                   ; 5
    bmi    L7692                 ; 2³
    lda    $BE                   ; 3
    and    #$33                  ; 2
    sta    $BE                   ; 3
    jmp    L7630                 ; 3
L7692:
    lda    $BE                   ; 3
    and    #$77                  ; 2
    jmp    L762C                 ; 3
L7699:
    and    #$02                  ; 2
    beq    L76AF                 ; 2³
    lda    $BE                   ; 3
    and    #$FD                  ; 2
    sta    $BE                   ; 3
    lda    #4                    ; 2
    sta    $83                   ; 3
    lda    #$0D                  ; 2
    sta    $82                   ; 3
    lda    #$FF                  ; 2
    sta    $84                   ; 3
L76AF:
    lda    #8                    ; 2
    sta    AUDC1                 ; 3
    ldx    $83                   ; 3
    lda.w  $84                   ; 4
    cmp    L7BFC,X               ; 4
    bcc    L76CB                 ; 2³
    dex                          ; 2
    bmi    L76D0                 ; 2³
    stx    $83                   ; 3
    lda    L7BFC,X               ; 4
    sta    AUDV1                 ; 3
    lda    #$10                  ; 2
    sta    $84                   ; 3
L76CB:
    sta    AUDF1                 ; 3
    inc    $84                   ; 5
    rts                          ; 6

L76D0:
    lda    $82                   ; 3
    sta    AUDV1                 ; 3
    ora    #$10                  ; 2
    sta    AUDF1                 ; 3
    dec    $82                   ; 5
    bmi    L76E3                 ; 2³
    lda    $BE                   ; 3
    and    #$DD                  ; 2
    sta    $BE                   ; 3
    rts                          ; 6

L76E3:
    lda    $BE                   ; 3
    and    #$11                  ; 2
    jmp    L7634                 ; 3
L76EA:
    lda    #4                    ; 2
    sta    AUDC0                 ; 3
    lda    #$0C                  ; 2
    sta    AUDF0                 ; 3
    lda    $BB                   ; 3
    and    #$07                  ; 2
    bne    L776A                 ; 2³+1
    lda    #1                    ; 2
    ldx    #0                    ; 2
    jsr    L7B8F                 ; 6
    lda    $BB                   ; 3
    and    #$0F                  ; 2
    bne    L770E                 ; 2³
    sta    AUDV0                 ; 3
    lda    SWCHA                 ; 4
    and    #$40                  ; 2
    beq    L771A                 ; 2³
L770E:
    inc    $85                   ; 5
    lda    $BB                   ; 3
    and    #$10                  ; 2
    bne    L771A                 ; 2³
    lda    #8                    ; 2
    sta    AUDV0                 ; 3
L771A:
    lda    SWCHA                 ; 4
    tax                          ; 2
    and    #$10                  ; 2
    bne    L7724                 ; 2³
    inc    $86                   ; 5
L7724:
    txa                          ; 2
    and    #$20                  ; 2
    bne    L772B                 ; 2³
    dec    $86                   ; 5
L772B:
    lda    $85                   ; 3
    cmp    #$98                  ; 2
    bcs    L7762                 ; 2³
    lda.w  CXP0FB                ; 4
    and    #$80                  ; 2
    bne    L7762                 ; 2³
    lda.w  CXPPMM                ; 4
    and    #$80                  ; 2
    beq    L776A                 ; 2³
    lda    $99                   ; 3
    sec                          ; 2
    sbc    #$0A                  ; 2
    sbc    $86                   ; 3
    bcc    L7762                 ; 2³
    cmp    #$0E                  ; 2
    bcs    L7762                 ; 2³
    lda    $B6                   ; 3
    cmp    #8                    ; 2
    beq    L7754                 ; 2³
    inc    $B6                   ; 5
L7754:
    lda    #$90                  ; 2
    ldx    #0                    ; 2
    jsr    L7B8F                 ; 6
    lda    #$37                  ; 2
    sta    $C3                   ; 3
    sta    $B1                   ; 3
    rts                          ; 6

L7762:
    lda    #1                    ; 2
    sta    $B1                   ; 3
    lda    #$AA                  ; 2
    sta    $BE                   ; 3
L776A:
    rts                          ; 6

L776B:
    lda    CXP0FB                ; 3
    and    #$80                  ; 2
    bne    L77E4                 ; 2³
    ldy    #0                    ; 2
    lda    CXPPMM                ; 3
    and    #$40                  ; 2
    beq    L777D                 ; 2³
    sty    $8D                   ; 3
    sty    $AA                   ; 3
L777D:
    lda    CXM0FB                ; 3
    and    #$40                  ; 2
    beq    L7787                 ; 2³
    sty    $8D                   ; 3
    sty    $AE                   ; 3
L7787:
    lda    $AA                   ; 3
    beq    L7796                 ; 2³
    lda    CXM1P                 ; 3
    and    #$80                  ; 2
    beq    L7796                 ; 2³
    sty    $AA                   ; 3
    jmp    L77D6                 ; 3
L7796:
    lda    $AE                   ; 3
    beq    L77A5                 ; 2³
    lda    CXP0FB                ; 3
    and    #$40                  ; 2
    beq    L77A5                 ; 2³
    sty    $AE                   ; 3
    jmp    L77D6                 ; 3
L77A5:
    lda    $8D                   ; 3
    beq    L77BF                 ; 2³
    lda    CXM0P                 ; 3
    and    #$80                  ; 2
    beq    L77BF                 ; 2³
    lda    $8D                   ; 3
    jsr    L77ED                 ; 6
    bne    L77BF                 ; 2³
    sty    $8D                   ; 3
    lda    $C2                   ; 3
    ldx    #0                    ; 2
    jsr    L7B8F                 ; 6
L77BF:
    lda    CXPPMM                ; 3
    and    #$80                  ; 2
    beq    L77EC                 ; 2³
    lda    $86                   ; 3
    jsr    L77ED                 ; 6
    beq    L77D6                 ; 2³
    lda    $86                   ; 3
    sec                          ; 2
    sbc    #4                    ; 2
    jsr    L77ED                 ; 6
    bne    L77EC                 ; 2³
L77D6:
    lda    $B1                   ; 3
    beq    L77E4                 ; 2³
    lda    #0                    ; 2
    sta    $91                   ; 3
    sta    $93                   ; 3
    sta    $95                   ; 3
    sta    $97                   ; 3
L77E4:
    lda    #1                    ; 2
    sta    $B1                   ; 3
    lda    #$AA                  ; 2
    sta    $BE                   ; 3
L77EC:
    rts                          ; 6

L77ED:
    tax                          ; 2
    lda    $97                   ; 3
    bne    L7811                 ; 2³+1
    lda    #$60                  ; 2
    sta    $B1                   ; 3
    lda    $98                   ; 3
    sta    $90                   ; 3
    sta    $92                   ; 3
    sta    $94                   ; 3
    sta    $96                   ; 3
    lda    $99                   ; 3
    sta    $91                   ; 3
    sta    $93                   ; 3
    sta    $95                   ; 3
    sta    $97                   ; 3
    lda    #$AA                  ; 2
    sta    $BE                   ; 3
    lda    #0                    ; 2
    rts                          ; 6

L7811:
    txa                          ; 2
    ldx    #8                    ; 2
L7814:
    cmp    $91,X                 ; 4
    beq    L7829                 ; 2³
    bcs    L781E                 ; 2³
    dex                          ; 2
    dex                          ; 2
    bpl    L7814                 ; 2³
L781E:
    inx                          ; 2
    inx                          ; 2
    clc                          ; 2
    adc    #7                    ; 2
    sec                          ; 2
    sbc.wx $91,X                 ; 4
    bcc    L7846                 ; 2³
L7829:
    cpx    #0                    ; 2
    beq    L7839                 ; 2³
    lda    $8F,X                 ; 4
    sta    $91,X                 ; 4
    lda    $8E,X                 ; 4
    sta    $90,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bne    L7829                 ; 2³
L7839:
    lda    #$88                  ; 2
    ora.w  $BE                   ; 4
    sta    $BE                   ; 3
    lda    #0                    ; 2
    sta    $90                   ; 3
    sta    $91                   ; 3
L7846:
    rts                          ; 6

L7847:
    lda    #$FB                  ; 2
    cmp    $A5                   ; 3
    bne    L784F                 ; 2³
    lda    #$FC                  ; 2
L784F:
    ldx    $B7                   ; 3
    cpx    #$20                  ; 2
    beq    L785B                 ; 2³
    cpx    #$40                  ; 2
    beq    L785B                 ; 2³
    sta    $88                   ; 3
L785B:
    sta    $A5                   ; 3
    ldx    #$0A                  ; 2
L785F:
    clc                          ; 2
    lda    $C4,X                 ; 4
    adc    #8                    ; 2
    sta    $C4,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    L785F                 ; 2³
    rts                          ; 6

L786B:
    lda    #2                    ; 2
    sta    $B8                   ; 3
    lda    SWCHA                 ; 4
    tax                          ; 2
    and    #$10                  ; 2
    bne    L7879                 ; 2³
    inc    $86                   ; 5
L7879:
    txa                          ; 2
    and    #$20                  ; 2
    bne    L7880                 ; 2³
    dec    $86                   ; 5
L7880:
    txa                          ; 2
    and    #$80                  ; 2
    bne    L788B                 ; 2³
    inc    $85                   ; 5
    lda    #3                    ; 2
    sta    $B8                   ; 3
L788B:
    txa                          ; 2
    and    #$40                  ; 2
    bne    L7896                 ; 2³
    dec    $85                   ; 5
    lda    #1                    ; 2
    sta    $B8                   ; 3
L7896:
    lda    $85                   ; 3
    cmp    #3                    ; 2
    bcs    L789E                 ; 2³
    lda    #3                    ; 2
L789E:
    cmp    #$1F                  ; 2
    bcc    L78A4                 ; 2³
    lda    #$1E                  ; 2
L78A4:
    sta    $85                   ; 3
    lda    $8D                   ; 3
    beq    L78BC                 ; 2³
    lda    $8C                   ; 3
    clc                          ; 2
    adc    #2                    ; 2
    adc    $8E                   ; 3
    cmp    #$94                  ; 2
    bcc    L78B9                 ; 2³
    lda    #0                    ; 2
    sta    $8D                   ; 3
L78B9:
    sta    $8C                   ; 3
    rts                          ; 6

L78BC:
    lda    INPT4                 ; 3
    and    #$80                  ; 2
    bne    L78D9                 ; 2³
    lda    $85                   ; 3
    adc    #6                    ; 2
    sta    $8C                   ; 3
    lda    $86                   ; 3
    sbc    #2                    ; 2
    sta    $8D                   ; 3
    lda    $B8                   ; 3
    sta    $8E                   ; 3
    lda    #$55                  ; 2
    ora.w  $BE                   ; 4
    sta    $BE                   ; 3
L78D9:
    lda    #3                    ; 2
    ldx    $B3                   ; 3
    cpx    #$10                  ; 2
    bcs    L78F1                 ; 2³
    lda    #2                    ; 2
    cpx    #1                    ; 2
    bcs    L78F1                 ; 2³
    lda    #1                    ; 2
    ldx    $B4                   ; 3
    cpx    #$10                  ; 2
    bcs    L78F1                 ; 2³
    lda    #0                    ; 2
L78F1:
    clc                          ; 2
    adc    $B8                   ; 3
    sta    $B8                   ; 3
    rts                          ; 6

L78F7:
    ldx    $BA                   ; 3
    bpl    L78FD                 ; 2³
    ldx    #8                    ; 2
L78FD:
    lda    $91,X                 ; 4
    beq    L796C                 ; 2³
    lda    $90,X                 ; 4
    sbc    $9A,X                 ; 4
    beq    L790F                 ; 2³
    bcs    L7919                 ; 2³
    cmp    #$FF                  ; 2
    beq    L790F                 ; 2³
    lda    #1                    ; 2
L790F:
    sta    $B9                   ; 3
    sta    $9B,X                 ; 4
    lda    $B8                   ; 3
    sta    $9A,X                 ; 4
    lda    #$94                  ; 2
L7919:
    sta    $90,X                 ; 4
    lda    $91,X                 ; 4
    clc                          ; 2
    adc    $9B,X                 ; 4
    tay                          ; 2
    cpy    #$44                  ; 2
    bcc    L792F                 ; 2³
    lda    #0                    ; 2
    sec                          ; 2
    sbc    $9B,X                 ; 4
    sta    $9B,X                 ; 4
    jmp    L796C                 ; 3
L792F:
    cpy    #9                    ; 2
    bcs    L793D                 ; 2³
    lda    #0                    ; 2
    sec                          ; 2
    sbc    $9B,X                 ; 4
    sta    $9B,X                 ; 4
    jmp    L796C                 ; 3
L793D:
    tya                          ; 2
    cpx    #0                    ; 2
    beq    L7953                 ; 2³
    sbc.wx $8F,X                 ; 4
    cmp    #8                    ; 2
    bcs    L7953                 ; 2³
    lda    #0                    ; 2
    sec                          ; 2
    sbc    $9B,X                 ; 4
    sta    $9B,X                 ; 4
    jmp    L796C                 ; 3
L7953:
    tya                          ; 2
    cpx    #8                    ; 2
    beq    L7969                 ; 2³
    adc    #7                    ; 2
    cmp.wx $93,X                 ; 4
    bcc    L7969                 ; 2³
    lda    #0                    ; 2
    sec                          ; 2
    sbc    $9B,X                 ; 4
    sta    $9B,X                 ; 4
    jmp    L796C                 ; 3
L7969:
    tya                          ; 2
    sta    $91,X                 ; 4
L796C:
    lda    $AA                   ; 3
    bne    L7996                 ; 2³
    lda    $AE                   ; 3
    beq    L797A                 ; 2³
    lda    $AD                   ; 3
    cmp    #$50                  ; 2
    bcs    L7996                 ; 2³
L797A:
    lda    $90,X                 ; 4
    sta    $A9                   ; 3
    lda    $91,X                 ; 4
    sbc    #4                    ; 2
    sta    $AA                   ; 3
    lda    $9A,X                 ; 4
    sta    $AB                   ; 3
    lda    $9B,X                 ; 4
    sta    $AC                   ; 3
    lda    #$55                  ; 2
    ora.w  $BE                   ; 4
    sta    $BE                   ; 3
    jmp    L79C1                 ; 3
L7996:
    lda    $AE                   ; 3
    bne    L79C1                 ; 2³
    lda    $AA                   ; 3
    beq    L79A8                 ; 2³
    lda    $A9                   ; 3
    cmp    #$50                  ; 2
    bcs    L79C1                 ; 2³
    lda    $97                   ; 3
    beq    L79C1                 ; 2³
L79A8:
    lda    $90,X                 ; 4
    sta    $AD                   ; 3
    lda    $91,X                 ; 4
    sbc    #4                    ; 2
    sta    $AE                   ; 3
    lda    $9A,X                 ; 4
    sta    $AF                   ; 3
    lda    $9B,X                 ; 4
    sta    $B0                   ; 3
    lda    #$55                  ; 2
    ora.w  $BE                   ; 4
    sta    $BE                   ; 3
L79C1:
    dex                          ; 2
    dex                          ; 2
    stx    $BA                   ; 3
    ldx    #4                    ; 2
    lda    $BB                   ; 3
    and    #$01                  ; 2
    bne    L79CF                 ; 2³
    ldx    #0                    ; 2
L79CF:
    lda    $A9,X                 ; 4
    beq    L79F1                 ; 2³
    clc                          ; 2
    sbc    $AB,X                 ; 4
    bcc    L79F1                 ; 2³
    cmp    #6                    ; 2
    bcc    L79F1                 ; 2³
    sta    $A9,X                 ; 4
    lda    $BB                   ; 3
    and    #$02                  ; 2
    beq    L79F7                 ; 2³
    lda    $AA,X                 ; 4
    clc                          ; 2
    adc    $AC,X                 ; 4
    cmp    #$44                  ; 2
    bcs    L79F1                 ; 2³
    cmp    #5                    ; 2
    bcs    L79F5                 ; 2³
L79F1:
    lda    #0                    ; 2
    sta    $A9,X                 ; 4
L79F5:
    sta    $AA,X                 ; 4
L79F7:
    rts                          ; 6

L79F8:
    sta    WSYNC                 ; 3
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
    lda.wx $B3,X                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    #8                    ; 2
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    $D0                   ; 3
    lda    $B3,X                 ; 4
    and    #$0F                  ; 2
    jsr    L7AC5                 ; 6
    sta    $D2                   ; 3
    lda    $B4,X                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    #8                    ; 2
    sta    $D4                   ; 3
    lda    $B4,X                 ; 4
    and    #$0F                  ; 2
    jsr    L7AC5                 ; 6
    sta    $D6                   ; 3
    sty    COLUBK                ; 3
    lda    $B5,X                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    #8                    ; 2
    sta    $D8                   ; 3
    sta    HMCLR                 ; 3
    lda    $B5,X                 ; 4
    and    #$0F                  ; 2
    jsr    L7AC5                 ; 6
    sta    $DA                   ; 3
    ldy    #7                    ; 2
    lda    #$FF                  ; 2
    sta    $D1                   ; 3
    sta    $D3                   ; 3
    sta    $D5                   ; 3
    sta    $D7                   ; 3
    sta    $D9                   ; 3
    sta    $DB                   ; 3
    ldx    #0                    ; 2
    lda    $D0                   ; 3
    cmp    #8                    ; 2
    bne    L7A8D                 ; 2³
    stx    $D0                   ; 3
    lda    $D2                   ; 3
    cmp    #8                    ; 2
    bne    L7A8D                 ; 2³
    stx    $D2                   ; 3
    lda    $D4                   ; 3
    cmp    #8                    ; 2
    bne    L7A8D                 ; 2³
    stx    $D4                   ; 3
    lda    $D6                   ; 3
    cmp    #8                    ; 2
    bne    L7A8D                 ; 2³
    stx    $D6                   ; 3
    lda    $D8                   ; 3
    cmp    #8                    ; 2
    bne    L7A8D                 ; 2³
    stx    $D8                   ; 3
L7A8D:
    sta    WSYNC                 ; 3
    lda    ($D2),Y               ; 5
    tax                          ; 2
    lda    ($D0),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($D6),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($DA),Y               ; 5
    pha                          ; 3
    stx    GRP0                  ; 3
    lda    ($D4),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($D8),Y               ; 5
    sta    GRP1                  ; 3
    pla                          ; 4
    sta    GRP1                  ; 3
    dey                          ; 2
    bne    L7A8D                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$20                  ; 2
    sta    NUSIZ0                ; 3
    ldx    #$20                  ; 2
    lda    SWCHB                 ; 4
    and    #$40                  ; 2
    bne    L7AC2                 ; 2³
    ldx    #$25                  ; 2
L7AC2:
    stx    NUSIZ1                ; 3
    rts                          ; 6

L7AC5:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    #8                    ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BROKEN CODE
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  IF FUNVISION
;this broken code is part of the routine at L7303

    .byte $FF ; |XXXXXXXX| $7ACC

    cmp    #$40
    beq    M7338
    ldx    #8
M732B:
    lda    L7CE5,X
    sta    $90,X
    dex
    dex
    bpl    M732B
    lda    #$23
    sta    $86
M7338:
    jsr    L7CCE
M733B:
    jmp    L7013
M733E:
    lda    #$44
    sta    $B1
    jmp    L7013
M7345
    lda    $BB
    bne    M734B
    sta    $B1
M734B:
    jmp    L7013
M734E:
    jmp    L73F5
M7351:
    jsr    L7357
    jmp    L7013
M7357:
    lda    #$FB



  ELSE ZELLERS
;this broken code is part of the routine at L7558

M751C = $7A73

    .byte $FF ; |XXXXXXXX| $7AAF
    .byte $A6   ; ldx $A6

    dex
    dex
    bpl    M751C
    cpy    #0
    bne    M756A
    ldy    #$62
    sty    $B1
    lda    #5
    sta    $BB
M756A:
    jmp    L7013
    lda    #7
    sta    $C0
M7575:
    sta    WSYNC
    ldy    $C0
    lda    ($C4),Y
    sta    PF0
    lda    ($C6),Y
    sta    PF1
    lda    ($C8),Y
    sta    PF2
    lda    ($CA),Y
    sta    PF0
    lda    ($CC),Y
    sta    PF1
    lda    ($CE),Y
    sta    PF2
    ldy    $89
    beq    M759B
    lda    ($87),Y
    sta    GRP0
    dec    $89
M759B:
    lda    $86
    cmp    $8F
    bne    M75A5
    lda    #9
    sta    $89
M75A5:
    lda    #0
    sta    PF0
    sta    PF1
    sta    PF2

    .byte $FF ; |XXXXXXXX| $7B00

  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $00 ; |        | $7B01
    .byte $60 ; | XX     | $7B02
    .byte $30 ; |  XX    | $7B03
    .byte $18 ; |   XX   | $7B04
    .byte $FC ; |XXXXXX  | $7B05
    .byte $FF ; |XXXXXXXX| $7B06
    .byte $48 ; | X  X   | $7B07
    .byte $30 ; |  XX    | $7B08
    .byte $20 ; |  X     | $7B09
    .byte $00 ; |        | $7B0A
    .byte $78 ; | XXXX   | $7B0B
    .byte $DF ; |XX XXXXX| $7B0C
    .byte $DC ; |XX XXX  | $7B0D
    .byte $78 ; | XXXX   | $7B0E
    .byte $30 ; |  XX    | $7B0F
    .byte $78 ; | XXXX   | $7B10
    .byte $00 ; |        | $7B11
    .byte $24 ; |  X  X  | $7B12
    .byte $99 ; |X  XX  X| $7B13
    .byte $6E ; | XX XXX | $7B14
    .byte $76 ; | XXX XX | $7B15
    .byte $99 ; |X  XX  X| $7B16
    .byte $24 ; |  X  X  | $7B17
    .byte $00 ; |        | $7B18
    .byte $18 ; |   XX   | $7B19
    .byte $24 ; |  X  X  | $7B1A
    .byte $42 ; | X    X | $7B1B
    .byte $FF ; |XXXXXXXX| $7B1C
    .byte $3C ; |  XXXX  | $7B1D
    .byte $99 ; |X  XX  X| $7B1E
    .byte $00 ; |        | $7B1F
    .byte $24 ; |  X  X  | $7B20
    .byte $18 ; |   XX   | $7B21
    .byte $18 ; |   XX   | $7B22
    .byte $24 ; |  X  X  | $7B23
    .byte $42 ; | X    X | $7B24
    .byte $81 ; |X      X| $7B25
    .byte $00 ; |        | $7B26
    .byte $00 ; |        | $7B27
    .byte $00 ; |        | $7B28
    .byte $10 ; |   X    | $7B29
    .byte $10 ; |   X    | $7B2A
    .byte $12 ; |   X  X | $7B2B
    .byte $16 ; |   X XX | $7B2C
    .byte $0E ; |    XXX | $7B2D
    .byte $FE ; |XXXXXXX | $7B2E
    .byte $7E ; | XXXXXX | $7B2F
    .byte $1E ; |   XXXX | $7B30
    .byte $1E ; |   XXXX | $7B31
    .byte $7E ; | XXXXXX | $7B32
    .byte $FE ; |XXXXXXX | $7B33
    .byte $0E ; |    XXX | $7B34
    .byte $16 ; |   X XX | $7B35
    .byte $12 ; |   X  X | $7B36
    .byte $10 ; |   X    | $7B37
    .byte $10 ; |   X    | $7B38
    .byte $00 ; |        | $7B39
    .byte $00 ; |        | $7B3A
    .byte $81 ; |X      X| $7B3B
    .byte $42 ; | X    X | $7B3C
    .byte $18 ; |   XX   | $7B3D
    .byte $42 ; | X    X | $7B3E
    .byte $42 ; | X    X | $7B3F
    .byte $18 ; |   XX   | $7B40
    .byte $42 ; | X    X | $7B41
    .byte $81 ; |X      X| $7B42

  IF FUNVISION

    .byte $8C ; |X   XX  | $7B43   probably color tables
    .byte $8C ; |X   XX  | $7B44
    .byte $8A ; |X   X X | $7B45
    .byte $8A ; |X   X X | $7B46
    .byte $88 ; |X   X   | $7B47
    .byte $8A ; |X   X X | $7B48
    .byte $8A ; |X   X X | $7B49
    .byte $8C ; |X   XX  | $7B4A
    .byte $8C ; |X   XX  | $7B4B
    .byte $2F ; |  X XXXX| $7B4C
    .byte $2F ; |  X XXXX| $7B4D
    .byte $2D ; |  X XX X| $7B4E
    .byte $2D ; |  X XX X| $7B4F
    .byte $2B ; |  X X XX| $7B50
    .byte $2D ; |  X XX X| $7B51
    .byte $2D ; |  X XX X| $7B52
    .byte $2F ; |  X XXXX| $7B53
    .byte $2F ; |  X XXXX| $7B54

  ELSE ZELLERS

    .byte $4C ; | X  XX  | $7B43   probably color tables
    .byte $4C ; | X  XX  | $7B44
    .byte $4A ; | X  X X | $7B45
    .byte $4A ; | X  X X | $7B46
    .byte $48 ; | X  X   | $7B47
    .byte $4A ; | X  X X | $7B48
    .byte $4A ; | X  X X | $7B49
    .byte $4C ; | X  XX  | $7B4A
    .byte $4C ; | X  XX  | $7B4B
    .byte $1F ; |   XXXXX| $7B4C
    .byte $1F ; |   XXXXX| $7B4D
    .byte $1D ; |   XXX X| $7B4E
    .byte $1D ; |   XXX X| $7B4F
    .byte $1B ; |   XX XX| $7B50
    .byte $1D ; |   XXX X| $7B51
    .byte $1D ; |   XXX X| $7B52
    .byte $1F ; |   XXXXX| $7B53
    .byte $1F ; |   XXXXX| $7B54

  ENDIF

    .byte $0F ; |    XXXX| $7B55
    .byte $0F ; |    XXXX| $7B56
    .byte $0F ; |    XXXX| $7B57
    .byte $0F ; |    XXXX| $7B58
    .byte $0F ; |    XXXX| $7B59
    .byte $0F ; |    XXXX| $7B5A
    .byte $0F ; |    XXXX| $7B5B
    .byte $0F ; |    XXXX| $7B5C
    .byte $0F ; |    XXXX| $7B5D
    .byte $0F ; |    XXXX| $7B5E
    .byte $0F ; |    XXXX| $7B5F
    .byte $0F ; |    XXXX| $7B60
    .byte $0F ; |    XXXX| $7B61
    .byte $0F ; |    XXXX| $7B62
    .byte $0F ; |    XXXX| $7B63
    .byte $0F ; |    XXXX| $7B64
    .byte $0F ; |    XXXX| $7B65
    .byte $0F ; |    XXXX| $7B66
L7B67:
    .byte $FF ; |XXXXXXXX| $7B67
    .byte $7F ; | XXXXXXX| $7B68
    .byte $0F ; |    XXXX| $7B69
    .byte $06 ; |     XX | $7B6A
    .byte $00 ; |        | $7B6B
    .byte $00 ; |        | $7B6C
    .byte $00 ; |        | $7B6D
    .byte $06 ; |     XX | $7B6E
    .byte $0F ; |    XXXX| $7B6F
    .byte $18 ; |   XX   | $7B70
    .byte $00 ; |        | $7B71
    .byte $00 ; |        | $7B72
    .byte $01 ; |       X| $7B73
    .byte $00 ; |        | $7B74
    .byte $00 ; |        | $7B75
    .byte $18 ; |   XX   | $7B76
    .byte $0F ; |    XXXX| $7B77
    .byte $07 ; |     XXX| $7B78
    .byte $00 ; |        | $7B79
    .byte $00 ; |        | $7B7A
    .byte $00 ; |        | $7B7B
    .byte $00 ; |        | $7B7C
    .byte $07 ; |     XXX| $7B7D
    .byte $0F ; |    XXXX| $7B7E
    .byte $18 ; |   XX   | $7B7F
    .byte $00 ; |        | $7B80
    .byte $00 ; |        | $7B81
    .byte $01 ; |       X| $7B82
    .byte $00 ; |        | $7B83
    .byte $00 ; |        | $7B84
    .byte $18 ; |   XX   | $7B85
    .byte $0F ; |    XXXX| $7B86
    .byte $06 ; |     XX | $7B87
    .byte $00 ; |        | $7B88
    .byte $00 ; |        | $7B89
    .byte $00 ; |        | $7B8A
    .byte $06 ; |     XX | $7B8B
    .byte $0F ; |    XXXX| $7B8C
    .byte $7F ; | XXXXXXX| $7B8D
    .byte $FF ; |XXXXXXXX| $7B8E

L7B8F:
    sec                          ; 2
    sed                          ; 2
    adc    $B5,X                 ; 4
    sta    $B5,X                 ; 4
    lda    $B4,X                 ; 4
    adc    #0                    ; 2
    sta    $B4,X                 ; 4
    lda    $B3,X                 ; 4
    adc    #0                    ; 2
    sta    $B3,X                 ; 4
    cld                          ; 2
    lda    $B4,X                 ; 4
    ora    $B5,X                 ; 4
    bne    L7BAA                 ; 2³
    inc    $B6                   ; 5
L7BAA:
    rts                          ; 6

L7BAB:
    sec                          ; 2
    sta    WSYNC                 ; 3
L7BAE:
    sbc    #$0F                  ; 2
    bcs    L7BAE                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0,X                ; 4
    sta    RESP0,X               ; 4
    rts                          ; 6

L7BBD:
    lda    #1                    ; 2
    sta    $B2                   ; 3
    sta    $B5                   ; 3
    lda    #$FD                  ; 2
    sta    $C5                   ; 3
    sta    $C9                   ; 3
    sta    $CB                   ; 3
    sta    $CF                   ; 3
    lda    #$FE                  ; 2
    sta    $C7                   ; 3
    sta    $CD                   ; 3
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    $BE                   ; 3
    sta    $C4                   ; 3
    lda    #$40                  ; 2
    sta    $C6                   ; 3
    lda    #$80                  ; 2
    sta    $C8                   ; 3
    lda    #$A0                  ; 2
    sta    $CA                   ; 3
    lda    #$E0                  ; 2
    sta    $CC                   ; 3
    lda    #$20                  ; 2
    sta    $CE                   ; 3
    lda    #$44                  ; 2
    sta    $B1                   ; 3
    rts                          ; 6

L7BF6:
    .byte $19 ; |   XX  X| $7BF6
    .byte $1D ; |   XXX X| $7BF7
    .byte $1C ; |   XXX  | $7BF8
    .byte $18 ; |   XX   | $7BF9
L7BFA:
    .byte $06 ; |     XX | $7BFA
    .byte $08 ; |    X   | $7BFB
L7BFC:
    .byte $1B ; |   XX XX| $7BFC
    .byte $1C ; |   XXX  | $7BFD
    .byte $19 ; |   XX  X| $7BFE
    .byte $1A ; |   XX X | $7BFF
    .byte $FF ; |XXXXXXXX| $7C00
    .byte $00 ; |        | $7C01
    .byte $C0 ; |XX      | $7C02
    .byte $60 ; | XX     | $7C03
    .byte $30 ; |  XX    | $7C04
    .byte $FF ; |XXXXXXXX| $7C05
    .byte $BE ; |X XXXXX | $7C06
    .byte $50 ; | X X    | $7C07
    .byte $30 ; |  XX    | $7C08
    .byte $20 ; |  X     | $7C09
    .byte $00 ; |        | $7C0A
    .byte $7A ; | XXXX X | $7C0B
    .byte $DF ; |XX XXXXX| $7C0C
    .byte $DC ; |XX XXX  | $7C0D
    .byte $78 ; | XXXX   | $7C0E
    .byte $30 ; |  XX    | $7C0F
    .byte $30 ; |  XX    | $7C10
    .byte $00 ; |        | $7C11
    .byte $00 ; |        | $7C12
    .byte $18 ; |   XX   | $7C13
    .byte $6E ; | XX XXX | $7C14
    .byte $76 ; | XXX XX | $7C15
    .byte $18 ; |   XX   | $7C16
    .byte $00 ; |        | $7C17
    .byte $00 ; |        | $7C18
    .byte $5A ; | X XX X | $7C19
    .byte $3C ; |  XXXX  | $7C1A
    .byte $FF ; |XXXXXXXX| $7C1B
    .byte $42 ; | X    X | $7C1C
    .byte $24 ; |  X  X  | $7C1D
    .byte $18 ; |   XX   | $7C1E
    .byte $00 ; |        | $7C1F
    .byte $24 ; |  X  X  | $7C20
    .byte $99 ; |X  XX  X| $7C21
    .byte $5A ; | X XX X | $7C22
    .byte $24 ; |  X  X  | $7C23
    .byte $00 ; |        | $7C24
    .byte $00 ; |        | $7C25
    .byte $00 ; |        | $7C26
    .byte $10 ; |   X    | $7C27
    .byte $10 ; |   X    | $7C28
    .byte $12 ; |   X  X | $7C29
    .byte $16 ; |   X XX | $7C2A
    .byte $0E ; |    XXX | $7C2B
    .byte $FE ; |XXXXXXX | $7C2C
    .byte $7E ; | XXXXXX | $7C2D
    .byte $1E ; |   XXXX | $7C2E
    .byte $00 ; |        | $7C2F
    .byte $00 ; |        | $7C30
    .byte $00 ; |        | $7C31
    .byte $1E ; |   XXXX | $7C32
    .byte $7E ; | XXXXXX | $7C33
    .byte $FE ; |XXXXXXX | $7C34
    .byte $0E ; |    XXX | $7C35
    .byte $16 ; |   X XX | $7C36
    .byte $12 ; |   X  X | $7C37
    .byte $10 ; |   X    | $7C38
    .byte $10 ; |   X    | $7C39
    .byte $00 ; |        | $7C3A
    .byte $00 ; |        | $7C3B
    .byte $00 ; |        | $7C3C
    .byte $22 ; |  X   X | $7C3D
    .byte $08 ; |    X   | $7C3E
    .byte $08 ; |    X   | $7C3F
    .byte $22 ; |  X   X | $7C40
    .byte $00 ; |        | $7C41
    .byte $00 ; |        | $7C42

  IF FUNVISION

    .byte $28 ; |  X X   | $7C43   probably color tables
    .byte $28 ; |  X X   | $7C44
    .byte $26 ; |  X  XX | $7C45
    .byte $26 ; |  X  XX | $7C46
    .byte $28 ; |  X X   | $7C47
    .byte $28 ; |  X X   | $7C48
    .byte $9F ; |X  XXXXX| $7C49
    .byte $C6 ; |XX   XX | $7C4A
    .byte $C8 ; |XX  X   | $7C4B
    .byte $CA ; |XX  X X | $7C4C
    .byte $CC ; |XX  XX  | $7C4D
    .byte $CA ; |XX  X X | $7C4E
    .byte $C8 ; |XX  X   | $7C4F
    .byte $C6 ; |XX   XX | $7C50
    .byte $76 ; | XXX XX | $7C51
    .byte $78 ; | XXXX   | $7C52
    .byte $7A ; | XXXX X | $7C53
    .byte $7C ; | XXXXX  | $7C54
    .byte $7A ; | XXXX X | $7C55
    .byte $78 ; | XXXX   | $7C56
    .byte $76 ; | XXX XX | $7C57
    .byte $86 ; |X    XX | $7C58
    .byte $88 ; |X   X   | $7C59
    .byte $88 ; |X   X   | $7C5A
    .byte $8C ; |X   XX  | $7C5B
    .byte $8A ; |X   X X | $7C5C
    .byte $88 ; |X   X   | $7C5D
    .byte $86 ; |X    XX | $7C5E
    .byte $56 ; | X X XX | $7C5F
    .byte $58 ; | X XX   | $7C60
    .byte $5A ; | X XX X | $7C61
    .byte $5C ; | X XXX  | $7C62
    .byte $5A ; | X XX X | $7C63
    .byte $58 ; | X XX   | $7C64
    .byte $56 ; | X X XX | $7C65
    .byte $C6 ; |XX   XX | $7C66
    .byte $C8 ; |XX  X   | $7C67
    .byte $CA ; |XX  X X | $7C68
    .byte $CC ; |XX  XX  | $7C69
    .byte $CA ; |XX  X X | $7C6A
    .byte $C8 ; |XX  X   | $7C6B
    .byte $C6 ; |XX   XX | $7C6C
    .byte $2F ; |  X XXXX| $7C6D
    .byte $2F ; |  X XXXX| $7C6E
    .byte $2D ; |  X XX X| $7C6F
    .byte $2B ; |  X X XX| $7C70
    .byte $2B ; |  X X XX| $7C71
    .byte $29 ; |  X X  X| $7C72
    .byte $29 ; |  X X  X| $7C73
    .byte $27 ; |  X  XXX| $7C74
    .byte $27 ; |  X  XXX| $7C75
    .byte $25 ; |  X  X X| $7C76
    .byte $25 ; |  X  X X| $7C77
    .byte $27 ; |  X  XXX| $7C78
    .byte $27 ; |  X  XXX| $7C79
    .byte $29 ; |  X X  X| $7C7A
    .byte $29 ; |  X X  X| $7C7B
    .byte $2B ; |  X X XX| $7C7C
    .byte $2B ; |  X X XX| $7C7D
    .byte $2D ; |  X XX X| $7C7E
    .byte $2F ; |  X XXXX| $7C7F
    .byte $5D ; | X XXX X| $7C80
    .byte $5D ; | X XXX X| $7C81
    .byte $5B ; | X XX XX| $7C82
    .byte $5B ; | X XX XX| $7C83
    .byte $59 ; | X XX  X| $7C84
    .byte $59 ; | X XX  X| $7C85
    .byte $57 ; | X X XXX| $7C86
    .byte $57 ; | X X XXX| $7C87
    .byte $55 ; | X X X X| $7C88
    .byte $55 ; | X X X X| $7C89
    .byte $57 ; | X X XXX| $7C8A
    .byte $57 ; | X X XXX| $7C8B
    .byte $59 ; | X XX  X| $7C8C
    .byte $59 ; | X XX  X| $7C8D
    .byte $5B ; | X XX XX| $7C8E
    .byte $5B ; | X XX XX| $7C8F
    .byte $5D ; | X XXX X| $7C90
    .byte $5D ; | X XXX X| $7C91
    .byte $5F ; | X XXXXX| $7C92

  ELSE ZELLERS

    .byte $18 ; |   XX   | $7C43   probably color tables
    .byte $18 ; |   XX   | $7C44
    .byte $16 ; |   X XX | $7C45
    .byte $16 ; |   X XX | $7C46
    .byte $18 ; |   XX   | $7C47
    .byte $18 ; |   XX   | $7C48
    .byte $9F ; |X  XXXXX| $7C49
    .byte $66 ; | XX  XX | $7C4A
    .byte $68 ; | XX X   | $7C4B
    .byte $6A ; | XX X X | $7C4C
    .byte $6C ; | XX XX  | $7C4D
    .byte $6A ; | XX X X | $7C4E
    .byte $68 ; | XX X   | $7C4F
    .byte $66 ; | XX  XX | $7C50
    .byte $A6 ; |X X  XX | $7C51
    .byte $A8 ; |X X X   | $7C52
    .byte $AA ; |X X X X | $7C53
    .byte $AC ; |X X XX  | $7C54
    .byte $AA ; |X X X X | $7C55
    .byte $A8 ; |X X X   | $7C56
    .byte $A6 ; |X X  XX | $7C57
    .byte $46 ; | X   XX | $7C58
    .byte $48 ; | X  X   | $7C59
    .byte $4A ; | X  X X | $7C5A
    .byte $4C ; | X  XX  | $7C5B
    .byte $4A ; | X  X X | $7C5C
    .byte $48 ; | X  X   | $7C5D
    .byte $46 ; | X   XX | $7C5E
    .byte $B6 ; |X XX XX | $7C5F
    .byte $B8 ; |X XXX   | $7C60
    .byte $BA ; |X XXX X | $7C61
    .byte $BC ; |X XXXX  | $7C62
    .byte $BA ; |X XXX X | $7C63
    .byte $B8 ; |X XXX   | $7C64
    .byte $B6 ; |X XX XX | $7C65
    .byte $56 ; | X X XX | $7C66
    .byte $58 ; | X XX   | $7C67
    .byte $5A ; | X XX X | $7C68
    .byte $5C ; | X XXX  | $7C69
    .byte $5A ; | X XX X | $7C6A
    .byte $58 ; | X XX   | $7C6B
    .byte $56 ; | X X XX | $7C6C
    .byte $1F ; |   XXXXX| $7C6D
    .byte $1F ; |   XXXXX| $7C6E
    .byte $1D ; |   XXX X| $7C6F
    .byte $1B ; |   XX XX| $7C70
    .byte $1B ; |   XX XX| $7C71
    .byte $19 ; |   XX  X| $7C72
    .byte $19 ; |   XX  X| $7C73
    .byte $17 ; |   X XXX| $7C74
    .byte $17 ; |   X XXX| $7C75
    .byte $15 ; |   X X X| $7C76
    .byte $15 ; |   X X X| $7C77
    .byte $17 ; |   X XXX| $7C78
    .byte $17 ; |   X XXX| $7C79
    .byte $19 ; |   XX  X| $7C7A
    .byte $19 ; |   XX  X| $7C7B
    .byte $1B ; |   XX XX| $7C7C
    .byte $1B ; |   XX XX| $7C7D
    .byte $1D ; |   XXX X| $7C7E
    .byte $1F ; |   XXXXX| $7C7F
    .byte $BD ; |X XXXX X| $7C80
    .byte $BD ; |X XXXX X| $7C81
    .byte $BB ; |X XXX XX| $7C82
    .byte $BB ; |X XXX XX| $7C83
    .byte $B9 ; |X XXX  X| $7C84
    .byte $B9 ; |X XXX  X| $7C85
    .byte $B7 ; |X XX XXX| $7C86
    .byte $B7 ; |X XX XXX| $7C87
    .byte $B5 ; |X XX X X| $7C88
    .byte $B5 ; |X XX X X| $7C89
    .byte $B7 ; |X XX XXX| $7C8A
    .byte $B7 ; |X XX XXX| $7C8B
    .byte $B9 ; |X XXX  X| $7C8C
    .byte $B9 ; |X XXX  X| $7C8D
    .byte $BB ; |X XXX XX| $7C8E
    .byte $BB ; |X XXX XX| $7C8F
    .byte $BD ; |X XXXX X| $7C90
    .byte $BD ; |X XXXX X| $7C91
    .byte $BF ; |X XXXXXX| $7C92
  ENDIF

L7C93:
    .byte $F3 ; |XXXX  XX| $7C93
    .byte $C1 ; |XX     X| $7C94
    .byte $80 ; |X       | $7C95
    .byte $00 ; |        | $7C96
    .byte $08 ; |    X   | $7C97
    .byte $1C ; |   XXX  | $7C98
    .byte $30 ; |  XX    | $7C99
    .byte $E0 ; |XXX     | $7C9A
    .byte $A1 ; |X X    X| $7C9B
    .byte $40 ; | X      | $7C9C
    .byte $80 ; |X       | $7C9D
    .byte $03 ; |      XX| $7C9E
    .byte $0C ; |    XX  | $7C9F
    .byte $03 ; |      XX| $7CA0
    .byte $80 ; |X       | $7CA1
    .byte $E0 ; |XXX     | $7CA2
    .byte $C1 ; |XX     X| $7CA3
    .byte $80 ; |X       | $7CA4
    .byte $00 ; |        | $7CA5
    .byte $1C ; |   XXX  | $7CA6
    .byte $1C ; |   XXX  | $7CA7
    .byte $00 ; |        | $7CA8
    .byte $80 ; |X       | $7CA9
    .byte $C1 ; |XX     X| $7CAA
    .byte $E0 ; |XXX     | $7CAB
    .byte $80 ; |X       | $7CAC
    .byte $03 ; |      XX| $7CAD
    .byte $0C ; |    XX  | $7CAE
    .byte $03 ; |      XX| $7CAF
    .byte $80 ; |X       | $7CB0
    .byte $40 ; | X      | $7CB1
    .byte $A1 ; |X X    X| $7CB2
    .byte $E0 ; |XXX     | $7CB3
    .byte $30 ; |  XX    | $7CB4
    .byte $1C ; |   XXX  | $7CB5
    .byte $08 ; |    X   | $7CB6
    .byte $00 ; |        | $7CB7
    .byte $80 ; |X       | $7CB8
    .byte $C1 ; |XX     X| $7CB9
    .byte $F3 ; |XXXX  XX| $7CBA

L7CBB:
    ldx    #9                    ; 2
L7CBD:
    lda    L7CEF,X               ; 4
    sta    $9A,X                 ; 4
    lda    L7CE5,X               ; 4
    sta    $90,X                 ; 4
    dex                          ; 2
    bpl    L7CBD                 ; 2³
    lda    #$23                  ; 2
    sta    $86                   ; 3
L7CCE:
    lda    #$0A                  ; 2
    sta    $85                   ; 3
    lda    #0                    ; 2
    sta    $87                   ; 3
    lda    #$FC                  ; 2
    sta    $88                   ; 3
    sta    $A5                   ; 3
    lda    #0                    ; 2
    sta    $8D                   ; 3
    sta    $AA                   ; 3
    sta    $AE                   ; 3
    rts                          ; 6

L7CE5:
    .byte $90 ; |X  X    | $7CE5
L7CE6:
    .byte $0A ; |    X X | $7CE6
    .byte $86 ; |X    XX | $7CE7
    .byte $18 ; |   XX   | $7CE8
    .byte $92 ; |X  X  X | $7CE9
    .byte $23 ; |  X   XX| $7CEA
    .byte $83 ; |X     XX| $7CEB
    .byte $33 ; |  XX  XX| $7CEC
    .byte $91 ; |X  X   X| $7CED
    .byte $40 ; | X      | $7CEE
L7CEF:
    .byte $02 ; |      X | $7CEF
    .byte $01 ; |       X| $7CF0
    .byte $02 ; |      X | $7CF1
    .byte $01 ; |       X| $7CF2
    .byte $02 ; |      X | $7CF3
    .byte $01 ; |       X| $7CF4
    .byte $02 ; |      X | $7CF5
    .byte $01 ; |       X| $7CF6
    .byte $02 ; |      X | $7CF7
    .byte $01 ; |       X| $7CF8
L7CF9:
    .byte $09 ; |    X  X| $7CF9
    .byte $05 ; |     X X| $7CFA
    .byte $FF ; |XXXXXXXX| $7CFB
    .byte $FF ; |XXXXXXXX| $7CFC
    .byte $FF ; |XXXXXXXX| $7CFD
    .byte $FF ; |XXXXXXXX| $7CFE
    .byte $FF ; |XXXXXXXX| $7CFF
    .byte $00 ; |        | $7D00
    .byte $80 ; |X       | $7D01
    .byte $40 ; | X      | $7D02
    .byte $38 ; |  XXX   | $7D03
    .byte $04 ; |     X  | $7D04
    .byte $03 ; |      XX| $7D05
    .byte $01 ; |       X| $7D06
    .byte $00 ; |        | $7D07
    .byte $00 ; |        | $7D08
    .byte $40 ; | X      | $7D09
    .byte $A0 ; |X X     | $7D0A
    .byte $9C ; |X  XXX  | $7D0B
    .byte $82 ; |X     X | $7D0C
    .byte $01 ; |       X| $7D0D
    .byte $00 ; |        | $7D0E
    .byte $00 ; |        | $7D0F
    .byte $00 ; |        | $7D10
    .byte $20 ; |  X     | $7D11
    .byte $50 ; | X X    | $7D12
    .byte $4E ; | X  XXX | $7D13
    .byte $C1 ; |XX     X| $7D14
    .byte $80 ; |X       | $7D15
    .byte $00 ; |        | $7D16
    .byte $00 ; |        | $7D17
    .byte $00 ; |        | $7D18
    .byte $10 ; |   X    | $7D19
    .byte $28 ; |  X X   | $7D1A
    .byte $27 ; |  X  XXX| $7D1B
    .byte $60 ; | XX     | $7D1C
    .byte $C0 ; |XX      | $7D1D
    .byte $00 ; |        | $7D1E
    .byte $00 ; |        | $7D1F
    .byte $00 ; |        | $7D20
    .byte $08 ; |    X   | $7D21
    .byte $14 ; |   X X  | $7D22
    .byte $13 ; |   X  XX| $7D23
    .byte $B0 ; |X XX    | $7D24
    .byte $60 ; | XX     | $7D25
    .byte $00 ; |        | $7D26
    .byte $00 ; |        | $7D27
    .byte $00 ; |        | $7D28
    .byte $04 ; |     X  | $7D29
    .byte $A0 ; |X X     | $7D2A
    .byte $89 ; |X   X  X| $7D2B
    .byte $D8 ; |XX XX   | $7D2C
    .byte $30 ; |  XX    | $7D2D
    .byte $00 ; |        | $7D2E
    .byte $00 ; |        | $7D2F
    .byte $00 ; |        | $7D30
    .byte $02 ; |      X | $7D31
    .byte $05 ; |     X X| $7D32
    .byte $44 ; | X   X  | $7D33
    .byte $EC ; |XXX XX  | $7D34
    .byte $18 ; |   XX   | $7D35
    .byte $00 ; |        | $7D36
    .byte $00 ; |        | $7D37
    .byte $00 ; |        | $7D38
    .byte $01 ; |       X| $7D39
    .byte $02 ; |      X | $7D3A
    .byte $22 ; |  X   X | $7D3B
    .byte $76 ; | XXX XX | $7D3C
    .byte $8C ; |X   XX  | $7D3D
    .byte $80 ; |X       | $7D3E
    .byte $00 ; |        | $7D3F
    .byte $00 ; |        | $7D40
    .byte $00 ; |        | $7D41
    .byte $01 ; |       X| $7D42
    .byte $11 ; |   X   X| $7D43
    .byte $3B ; |  XXX XX| $7D44
    .byte $46 ; | X   XX | $7D45
    .byte $40 ; | X      | $7D46
    .byte $80 ; |X       | $7D47
    .byte $00 ; |        | $7D48
    .byte $00 ; |        | $7D49
    .byte $00 ; |        | $7D4A
    .byte $08 ; |    X   | $7D4B
    .byte $1D ; |   XXX X| $7D4C
    .byte $23 ; |  X   XX| $7D4D
    .byte $A0 ; |X X     | $7D4E
    .byte $C0 ; |XX      | $7D4F
    .byte $00 ; |        | $7D50
    .byte $00 ; |        | $7D51
    .byte $00 ; |        | $7D52
    .byte $04 ; |     X  | $7D53
    .byte $8E ; |X   XXX | $7D54
    .byte $91 ; |X  X   X| $7D55
    .byte $50 ; | X X    | $7D56
    .byte $60 ; | XX     | $7D57
    .byte $00 ; |        | $7D58
    .byte $00 ; |        | $7D59
    .byte $00 ; |        | $7D5A
    .byte $82 ; |X     X | $7D5B
    .byte $47 ; | X   XXX| $7D5C
    .byte $48 ; | X  X   | $7D5D
    .byte $28 ; |  X X   | $7D5E
    .byte $30 ; |  XX    | $7D5F
    .byte $00 ; |        | $7D60
    .byte $00 ; |        | $7D61
    .byte $80 ; |X       | $7D62
    .byte $41 ; | X     X| $7D63
    .byte $23 ; |  X   XX| $7D64
    .byte $24 ; |  X  X  | $7D65
    .byte $14 ; |   X X  | $7D66
    .byte $18 ; |   XX   | $7D67
    .byte $00 ; |        | $7D68
    .byte $80 ; |X       | $7D69
    .byte $40 ; | X      | $7D6A
    .byte $20 ; |  X     | $7D6B
    .byte $11 ; |   X   X| $7D6C
    .byte $12 ; |   X  X | $7D6D
    .byte $0A ; |    X X | $7D6E
    .byte $0C ; |    XX  | $7D6F
    .byte $00 ; |        | $7D70
    .byte $C0 ; |XX      | $7D71
    .byte $20 ; |  X     | $7D72
    .byte $10 ; |   X    | $7D73
    .byte $08 ; |    X   | $7D74
    .byte $09 ; |    X  X| $7D75
    .byte $05 ; |     X X| $7D76
    .byte $06 ; |     XX | $7D77
    .byte $00 ; |        | $7D78
    .byte $60 ; | XX     | $7D79
    .byte $90 ; |X  X    | $7D7A
    .byte $88 ; |X   X   | $7D7B
    .byte $84 ; |X    X  | $7D7C
    .byte $04 ; |     X  | $7D7D
    .byte $02 ; |      X | $7D7E
    .byte $03 ; |      XX| $7D7F
    .byte $00 ; |        | $7D80
    .byte $30 ; |  XX    | $7D81
    .byte $48 ; | X  X   | $7D82
    .byte $44 ; | X   X  | $7D83
    .byte $42 ; | X    X | $7D84
    .byte $82 ; |X     X | $7D85
    .byte $01 ; |       X| $7D86
    .byte $01 ; |       X| $7D87
    .byte $00 ; |        | $7D88
    .byte $18 ; |   XX   | $7D89
    .byte $24 ; |  X  X  | $7D8A
    .byte $22 ; |  X   X | $7D8B
    .byte $A1 ; |X X    X| $7D8C
    .byte $C1 ; |XX     X| $7D8D
    .byte $00 ; |        | $7D8E
    .byte $00 ; |        | $7D8F
    .byte $00 ; |        | $7D90
    .byte $0C ; |    XX  | $7D91
    .byte $92 ; |X  X  X | $7D92
    .byte $91 ; |X  X   X| $7D93
    .byte $50 ; | X X    | $7D94
    .byte $60 ; | XX     | $7D95
    .byte $00 ; |        | $7D96
    .byte $00 ; |        | $7D97
    .byte $00 ; |        | $7D98
    .byte $86 ; |X    XX | $7D99
    .byte $49 ; | X  X  X| $7D9A
    .byte $48 ; | X  X   | $7D9B
    .byte $28 ; |  X X   | $7D9C
    .byte $30 ; |  XX    | $7D9D
    .byte $00 ; |        | $7D9E
    .byte $00 ; |        | $7D9F
    .byte $80 ; |X       | $7DA0
    .byte $43 ; | X    XX| $7DA1
    .byte $24 ; |  X  X  | $7DA2
    .byte $24 ; |  X  X  | $7DA3
    .byte $14 ; |   X X  | $7DA4
    .byte $18 ; |   XX   | $7DA5
    .byte $00 ; |        | $7DA6
    .byte $00 ; |        | $7DA7
    .byte $40 ; | X      | $7DA8
    .byte $A1 ; |X X    X| $7DA9
    .byte $12 ; |   X  X | $7DAA
    .byte $12 ; |   X  X | $7DAB
    .byte $0A ; |    X X | $7DAC
    .byte $0C ; |    XX  | $7DAD
    .byte $00 ; |        | $7DAE
    .byte $00 ; |        | $7DAF
    .byte $20 ; |  X     | $7DB0
    .byte $50 ; | X X    | $7DB1
    .byte $19 ; |   XX  X| $7DB2
    .byte $19 ; |   XX  X| $7DB3
    .byte $05 ; |     X X| $7DB4
    .byte $06 ; |     XX | $7DB5
    .byte $00 ; |        | $7DB6
    .byte $00 ; |        | $7DB7
    .byte $10 ; |   X    | $7DB8
    .byte $28 ; |  X X   | $7DB9
    .byte $44 ; | X   X  | $7DBA
    .byte $44 ; | X   X  | $7DBB
    .byte $82 ; |X     X | $7DBC
    .byte $03 ; |      XX| $7DBD
    .byte $00 ; |        | $7DBE
    .byte $00 ; |        | $7DBF
    .byte $08 ; |    X   | $7DC0
    .byte $14 ; |   X X  | $7DC1
    .byte $22 ; |  X   X | $7DC2
    .byte $22 ; |  X   X | $7DC3
    .byte $41 ; | X     X| $7DC4
    .byte $81 ; |X      X| $7DC5
    .byte $00 ; |        | $7DC6
    .byte $00 ; |        | $7DC7
    .byte $04 ; |     X  | $7DC8
    .byte $0A ; |    X X | $7DC9
    .byte $11 ; |   X   X| $7DCA
    .byte $11 ; |   X   X| $7DCB
    .byte $20 ; |  X     | $7DCC
    .byte $C0 ; |XX      | $7DCD
    .byte $80 ; |X       | $7DCE
    .byte $00 ; |        | $7DCF
    .byte $02 ; |      X | $7DD0
    .byte $05 ; |     X X| $7DD1
    .byte $08 ; |    X   | $7DD2
    .byte $08 ; |    X   | $7DD3
    .byte $10 ; |   X    | $7DD4
    .byte $E0 ; |XXX     | $7DD5
    .byte $40 ; | X      | $7DD6
    .byte $00 ; |        | $7DD7
    .byte $01 ; |       X| $7DD8
    .byte $02 ; |      X | $7DD9
    .byte $04 ; |     X  | $7DDA
    .byte $04 ; |     X  | $7DDB
    .byte $88 ; |X   X   | $7DDC
    .byte $70 ; | XXX    | $7DDD
    .byte $20 ; |  X     | $7DDE
    .byte $00 ; |        | $7DDF
    .byte $00 ; |        | $7DE0
    .byte $01 ; |       X| $7DE1
    .byte $02 ; |      X | $7DE2
    .byte $82 ; |X     X | $7DE3
    .byte $44 ; | X   X  | $7DE4
    .byte $38 ; |  XXX   | $7DE5
    .byte $10 ; |   X    | $7DE6
    .byte $00 ; |        | $7DE7
    .byte $00 ; |        | $7DE8
    .byte $00 ; |        | $7DE9
    .byte $01 ; |       X| $7DEA
    .byte $C1 ; |XX     X| $7DEB
    .byte $22 ; |  X   X | $7DEC
    .byte $1C ; |   XXX  | $7DED
    .byte $08 ; |    X   | $7DEE
    .byte $00 ; |        | $7DEF
    .byte $00 ; |        | $7DF0
    .byte $00 ; |        | $7DF1
    .byte $00 ; |        | $7DF2
    .byte $E0 ; |XXX     | $7DF3
    .byte $11 ; |   X   X| $7DF4
    .byte $0E ; |    XXX | $7DF5
    .byte $04 ; |     X  | $7DF6
    .byte $00 ; |        | $7DF7
    .byte $00 ; |        | $7DF8
    .byte $00 ; |        | $7DF9
    .byte $80 ; |X       | $7DFA
    .byte $70 ; | XXX    | $7DFB
    .byte $08 ; |    X   | $7DFC
    .byte $07 ; |     XXX| $7DFD
    .byte $02 ; |      X | $7DFE
    .byte $00 ; |        | $7DFF
    .byte $00 ; |        | $7E00
    .byte $01 ; |       X| $7E01
    .byte $02 ; |      X | $7E02
    .byte $1C ; |   XXX  | $7E03
    .byte $20 ; |  X     | $7E04
    .byte $C0 ; |XX      | $7E05
    .byte $80 ; |X       | $7E06
    .byte $00 ; |        | $7E07
    .byte $00 ; |        | $7E08
    .byte $02 ; |      X | $7E09
    .byte $05 ; |     X X| $7E0A
    .byte $39 ; |  XXX  X| $7E0B
    .byte $41 ; | X     X| $7E0C
    .byte $80 ; |X       | $7E0D
    .byte $00 ; |        | $7E0E
    .byte $00 ; |        | $7E0F
    .byte $00 ; |        | $7E10
    .byte $04 ; |     X  | $7E11
    .byte $0A ; |    X X | $7E12
    .byte $72 ; | XXX  X | $7E13
    .byte $83 ; |X     XX| $7E14
    .byte $01 ; |       X| $7E15
    .byte $00 ; |        | $7E16
    .byte $00 ; |        | $7E17
    .byte $00 ; |        | $7E18
    .byte $08 ; |    X   | $7E19
    .byte $14 ; |   X X  | $7E1A
    .byte $E4 ; |XXX  X  | $7E1B
    .byte $06 ; |     XX | $7E1C
    .byte $03 ; |      XX| $7E1D
    .byte $00 ; |        | $7E1E
    .byte $00 ; |        | $7E1F
    .byte $00 ; |        | $7E20
    .byte $10 ; |   X    | $7E21
    .byte $28 ; |  X X   | $7E22
    .byte $C8 ; |XX  X   | $7E23
    .byte $0D ; |    XX X| $7E24
    .byte $06 ; |     XX | $7E25
    .byte $00 ; |        | $7E26
    .byte $00 ; |        | $7E27
    .byte $00 ; |        | $7E28
    .byte $20 ; |  X     | $7E29
    .byte $50 ; | X X    | $7E2A
    .byte $91 ; |X  X   X| $7E2B
    .byte $1B ; |   XX XX| $7E2C
    .byte $0C ; |    XX  | $7E2D
    .byte $00 ; |        | $7E2E
    .byte $00 ; |        | $7E2F
    .byte $00 ; |        | $7E30
    .byte $40 ; | X      | $7E31
    .byte $A0 ; |X X     | $7E32
    .byte $22 ; |  X   X | $7E33
    .byte $37 ; |  XX XXX| $7E34
    .byte $18 ; |   XX   | $7E35
    .byte $00 ; |        | $7E36
    .byte $00 ; |        | $7E37
    .byte $00 ; |        | $7E38
    .byte $80 ; |X       | $7E39
    .byte $40 ; | X      | $7E3A
    .byte $44 ; | X   X  | $7E3B
    .byte $6E ; | XX XXX | $7E3C
    .byte $31 ; |  XX   X| $7E3D
    .byte $01 ; |       X| $7E3E
    .byte $00 ; |        | $7E3F
    .byte $00 ; |        | $7E40
    .byte $00 ; |        | $7E41
    .byte $80 ; |X       | $7E42
    .byte $88 ; |X   X   | $7E43
    .byte $DC ; |XX XXX  | $7E44
    .byte $62 ; | XX   X | $7E45
    .byte $02 ; |      X | $7E46
    .byte $01 ; |       X| $7E47
    .byte $00 ; |        | $7E48
    .byte $00 ; |        | $7E49
    .byte $00 ; |        | $7E4A
    .byte $10 ; |   X    | $7E4B
    .byte $B8 ; |X XXX   | $7E4C
    .byte $C4 ; |XX   X  | $7E4D
    .byte $05 ; |     X X| $7E4E
    .byte $03 ; |      XX| $7E4F
    .byte $00 ; |        | $7E50
    .byte $00 ; |        | $7E51
    .byte $00 ; |        | $7E52
    .byte $20 ; |  X     | $7E53
    .byte $71 ; | XXX   X| $7E54
    .byte $19 ; |   XX  X| $7E55
    .byte $0A ; |    X X | $7E56
    .byte $06 ; |     XX | $7E57
    .byte $00 ; |        | $7E58
    .byte $00 ; |        | $7E59
    .byte $00 ; |        | $7E5A
    .byte $41 ; | X     X| $7E5B
    .byte $E2 ; |XXX   X | $7E5C
    .byte $12 ; |   X  X | $7E5D
    .byte $14 ; |   X X  | $7E5E
    .byte $0C ; |    XX  | $7E5F
    .byte $00 ; |        | $7E60
    .byte $00 ; |        | $7E61
    .byte $01 ; |       X| $7E62
    .byte $82 ; |X     X | $7E63
    .byte $C4 ; |XX   X  | $7E64
    .byte $24 ; |  X  X  | $7E65
    .byte $28 ; |  X X   | $7E66
    .byte $18 ; |   XX   | $7E67
    .byte $00 ; |        | $7E68
    .byte $01 ; |       X| $7E69
    .byte $02 ; |      X | $7E6A
    .byte $04 ; |     X  | $7E6B
    .byte $88 ; |X   X   | $7E6C
    .byte $48 ; | X  X   | $7E6D
    .byte $50 ; | X X    | $7E6E
    .byte $30 ; |  XX    | $7E6F
    .byte $00 ; |        | $7E70
    .byte $03 ; |      XX| $7E71
    .byte $04 ; |     X  | $7E72
    .byte $08 ; |    X   | $7E73
    .byte $10 ; |   X    | $7E74
    .byte $90 ; |X  X    | $7E75
    .byte $A0 ; |X X     | $7E76
    .byte $60 ; | XX     | $7E77
    .byte $00 ; |        | $7E78
    .byte $06 ; |     XX | $7E79
    .byte $09 ; |    X  X| $7E7A
    .byte $11 ; |   X   X| $7E7B
    .byte $21 ; |  X    X| $7E7C
    .byte $20 ; |  X     | $7E7D
    .byte $40 ; | X      | $7E7E
    .byte $C0 ; |XX      | $7E7F
    .byte $00 ; |        | $7E80
    .byte $0C ; |    XX  | $7E81
    .byte $12 ; |   X  X | $7E82
    .byte $22 ; |  X   X | $7E83
    .byte $42 ; | X    X | $7E84
    .byte $41 ; | X     X| $7E85
    .byte $80 ; |X       | $7E86
    .byte $80 ; |X       | $7E87
    .byte $00 ; |        | $7E88
    .byte $18 ; |   XX   | $7E89
    .byte $24 ; |  X  X  | $7E8A
    .byte $44 ; | X   X  | $7E8B
    .byte $85 ; |X    X X| $7E8C
    .byte $83 ; |X     XX| $7E8D
    .byte $00 ; |        | $7E8E
    .byte $00 ; |        | $7E8F
    .byte $00 ; |        | $7E90
    .byte $30 ; |  XX    | $7E91
    .byte $49 ; | X  X  X| $7E92
    .byte $89 ; |X   X  X| $7E93
    .byte $0A ; |    X X | $7E94
    .byte $06 ; |     XX | $7E95
    .byte $00 ; |        | $7E96
    .byte $00 ; |        | $7E97
    .byte $00 ; |        | $7E98
    .byte $61 ; | XX    X| $7E99
    .byte $92 ; |X  X  X | $7E9A
    .byte $12 ; |   X  X | $7E9B
    .byte $14 ; |   X X  | $7E9C
    .byte $0C ; |    XX  | $7E9D
    .byte $00 ; |        | $7E9E
    .byte $00 ; |        | $7E9F
    .byte $01 ; |       X| $7EA0
    .byte $C2 ; |XX    X | $7EA1
    .byte $24 ; |  X  X  | $7EA2
    .byte $24 ; |  X  X  | $7EA3
    .byte $28 ; |  X X   | $7EA4
    .byte $18 ; |   XX   | $7EA5
    .byte $00 ; |        | $7EA6
    .byte $00 ; |        | $7EA7
    .byte $02 ; |      X | $7EA8
    .byte $85 ; |X    X X| $7EA9
    .byte $48 ; | X  X   | $7EAA
    .byte $48 ; | X  X   | $7EAB
    .byte $50 ; | X X    | $7EAC
    .byte $30 ; |  XX    | $7EAD
    .byte $00 ; |        | $7EAE
    .byte $00 ; |        | $7EAF
    .byte $04 ; |     X  | $7EB0
    .byte $0A ; |    X X | $7EB1
    .byte $91 ; |X  X   X| $7EB2
    .byte $91 ; |X  X   X| $7EB3
    .byte $A0 ; |X X     | $7EB4
    .byte $60 ; | XX     | $7EB5
    .byte $00 ; |        | $7EB6
    .byte $00 ; |        | $7EB7
    .byte $08 ; |    X   | $7EB8
    .byte $14 ; |   X X  | $7EB9
    .byte $22 ; |  X   X | $7EBA
    .byte $22 ; |  X   X | $7EBB
    .byte $41 ; | X     X| $7EBC
    .byte $C0 ; |XX      | $7EBD
    .byte $00 ; |        | $7EBE
    .byte $00 ; |        | $7EBF
    .byte $10 ; |   X    | $7EC0
    .byte $28 ; |  X X   | $7EC1
    .byte $44 ; | X   X  | $7EC2
    .byte $44 ; | X   X  | $7EC3
    .byte $82 ; |X     X | $7EC4
    .byte $81 ; |X      X| $7EC5
    .byte $00 ; |        | $7EC6
    .byte $00 ; |        | $7EC7
    .byte $20 ; |  X     | $7EC8
    .byte $50 ; | X X    | $7EC9
    .byte $88 ; |X   X   | $7ECA
    .byte $88 ; |X   X   | $7ECB
    .byte $04 ; |     X  | $7ECC
    .byte $03 ; |      XX| $7ECD
    .byte $01 ; |       X| $7ECE
    .byte $00 ; |        | $7ECF
    .byte $40 ; | X      | $7ED0
    .byte $A0 ; |X X     | $7ED1
    .byte $10 ; |   X    | $7ED2
    .byte $10 ; |   X    | $7ED3
    .byte $08 ; |    X   | $7ED4
    .byte $07 ; |     XXX| $7ED5
    .byte $02 ; |      X | $7ED6
    .byte $00 ; |        | $7ED7
    .byte $80 ; |X       | $7ED8
    .byte $40 ; | X      | $7ED9
    .byte $20 ; |  X     | $7EDA
    .byte $20 ; |  X     | $7EDB
    .byte $11 ; |   X   X| $7EDC
    .byte $0E ; |    XXX | $7EDD
    .byte $04 ; |     X  | $7EDE
    .byte $00 ; |        | $7EDF
    .byte $00 ; |        | $7EE0
    .byte $80 ; |X       | $7EE1
    .byte $40 ; | X      | $7EE2
    .byte $41 ; | X     X| $7EE3
    .byte $22 ; |  X   X | $7EE4
    .byte $1C ; |   XXX  | $7EE5
    .byte $08 ; |    X   | $7EE6
    .byte $00 ; |        | $7EE7
    .byte $00 ; |        | $7EE8
    .byte $00 ; |        | $7EE9
    .byte $80 ; |X       | $7EEA
    .byte $83 ; |X     XX| $7EEB
    .byte $44 ; | X   X  | $7EEC
    .byte $38 ; |  XXX   | $7EED
    .byte $10 ; |   X    | $7EEE
    .byte $00 ; |        | $7EEF
    .byte $00 ; |        | $7EF0
    .byte $00 ; |        | $7EF1
    .byte $00 ; |        | $7EF2
    .byte $07 ; |     XXX| $7EF3
    .byte $88 ; |X   X   | $7EF4
    .byte $70 ; | XXX    | $7EF5
    .byte $20 ; |  X     | $7EF6
    .byte $00 ; |        | $7EF7
    .byte $00 ; |        | $7EF8
    .byte $00 ; |        | $7EF9
    .byte $01 ; |       X| $7EFA
    .byte $0E ; |    XXX | $7EFB
    .byte $10 ; |   X    | $7EFC
    .byte $E0 ; |XXX     | $7EFD
    .byte $40 ; | X      | $7EFE
    .byte $00 ; |        | $7EFF
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

L7F58:
    lda    #0                    ; 2
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    RESBL                 ; 3
    ldx    #0                    ; 2
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    stx    COLUPF                ; 3
    inx                          ; 2
    stx    NUSIZ0                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    stx    NUSIZ1                ; 3
    lda    #$30                  ; 2
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    HMBL                  ; 3
    lsr                          ; 2
    sta    HMP1                  ; 3
    lda    #$0C                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    ldx    #7                    ; 2
    lda    #0                    ; 2
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    sta    HMCLR                 ; 3
L7F92:
    sta    WSYNC                 ; 3
    nop                          ; 2
    lda    L7FB0,X               ; 4
    sta.w  GRP0                  ; 4
    lda    L7FB8,X               ; 4
    sta    GRP1                  ; 3
    nop                          ; 2
    lda    L7FC8,X               ; 4
    tay                          ; 2
    lda    L7FC0,X               ; 4
    sta    GRP0                  ; 3
    sty    GRP1                  ; 3
    dex                          ; 2
    bpl    L7F92                 ; 2³
    rts                          ; 6

  IF FUNVISION

L7FB0:
    .byte $00 ; |        | $7FB0
    .byte $9D ; |X  XXX X| $7FB1
    .byte $95 ; |X  X X X| $7FB2
    .byte $95 ; |X  X X X| $7FB3
    .byte $F5 ; |XXXX X X| $7FB4
    .byte $95 ; |X  X X X| $7FB5
    .byte $80 ; |X       | $7FB6
    .byte $E0 ; |XXX     | $7FB7
L7FB8:
    .byte $00 ; |        | $7FB8
    .byte $28 ; |  X X   | $7FB9
    .byte $6C ; | XX XX  | $7FBA
    .byte $EE ; |XXX XXX | $7FBB
    .byte $AA ; |X X X X | $7FBC
    .byte $29 ; |  X X  X| $7FBD
    .byte $00 ; |        | $7FBE
    .byte $00 ; |        | $7FBF
L7FC0:
    .byte $00 ; |        | $7FC0
    .byte $BA ; |X XXX X | $7FC1
    .byte $8A ; |X   X X | $7FC2
    .byte $BA ; |X XXX X | $7FC3
    .byte $A2 ; |X X   X | $7FC4
    .byte $38 ; |  XXX   | $7FC5
    .byte $82 ; |X     X | $7FC6
    .byte $00 ; |        | $7FC7
L7FC8:
    .byte $00 ; |        | $7FC8
    .byte $E9 ; |XXX X  X| $7FC9
    .byte $AB ; |X X X XX| $7FCA
    .byte $AF ; |X X XXXX| $7FCB
    .byte $AD ; |X X XX X| $7FCC
    .byte $E9 ; |XXX X  X| $7FCD
    .byte $00 ; |        | $7FCE
    .byte $00 ; |        | $7FCF

  ELSE ZELLERS

L7FB0:
    .byte $00 ; |        | $7FB0
    .byte $00 ; |        | $7FB1
    .byte $00 ; |        | $7FB2
    .byte $00 ; |        | $7FB3
    .byte $00 ; |        | $7FB4
    .byte $00 ; |        | $7FB5
    .byte $00 ; |        | $7FB6
    .byte $00 ; |        | $7FB7
L7FB8:
    .byte $00 ; |        | $7FB8
    .byte $00 ; |        | $7FB9
    .byte $00 ; |        | $7FBA
    .byte $00 ; |        | $7FBB
    .byte $00 ; |        | $7FBC
    .byte $00 ; |        | $7FBD
    .byte $00 ; |        | $7FBE
    .byte $00 ; |        | $7FBF
L7FC0:
    .byte $00 ; |        | $7FC0
    .byte $00 ; |        | $7FC1
    .byte $00 ; |        | $7FC2
    .byte $00 ; |        | $7FC3
    .byte $00 ; |        | $7FC4
    .byte $00 ; |        | $7FC5
    .byte $00 ; |        | $7FC6
    .byte $00 ; |        | $7FC7
L7FC8:
    .byte $00 ; |        | $7FC8
    .byte $00 ; |        | $7FC9
    .byte $00 ; |        | $7FCA
    .byte $00 ; |        | $7FCB
    .byte $00 ; |        | $7FCC
    .byte $00 ; |        | $7FCD
    .byte $00 ; |        | $7FCE
    .byte $00 ; |        | $7FCF

  ENDIF

  IF FUNVISION

    .byte $FF ; |XXXXXXXX| $7FD0
    .byte $FF ; |XXXXXXXX| $7FD1
    .byte $FF ; |XXXXXXXX| $7FD2
    .byte $FF ; |XXXXXXXX| $7FD3
    .byte $FF ; |XXXXXXXX| $7FD4
    .byte $FF ; |XXXXXXXX| $7FD5
    .byte $FF ; |XXXXXXXX| $7FD6
    .byte $FF ; |XXXXXXXX| $7FD7
    .byte $FF ; |XXXXXXXX| $7FD8
    .byte $FF ; |XXXXXXXX| $7FD9
    .byte $FF ; |XXXXXXXX| $7FDA
    .byte $FF ; |XXXXXXXX| $7FDB
    .byte $FF ; |XXXXXXXX| $7FDC
    .byte $FF ; |XXXXXXXX| $7FDD
    .byte $FF ; |XXXXXXXX| $7FDE
    .byte $FF ; |XXXXXXXX| $7FDF
    .byte $FF ; |XXXXXXXX| $7FE0
    .byte $FF ; |XXXXXXXX| $7FE1
    .byte $FF ; |XXXXXXXX| $7FE2
    .byte $FF ; |XXXXXXXX| $7FE3
    .byte $FF ; |XXXXXXXX| $7FE4
    .byte $FF ; |XXXXXXXX| $7FE5
    .byte $FF ; |XXXXXXXX| $7FE6
    .byte $FF ; |XXXXXXXX| $7FE7
    .byte $FF ; |XXXXXXXX| $7FE8
    .byte $FF ; |XXXXXXXX| $7FE9
    .byte $FF ; |XXXXXXXX| $7FEA
    .byte $FF ; |XXXXXXXX| $7FEB
    .byte $FF ; |XXXXXXXX| $7FEC
    .byte $FF ; |XXXXXXXX| $7FED
    .byte $FF ; |XXXXXXXX| $7FEE
    .byte $FF ; |XXXXXXXX| $7FEF
    .byte $FF ; |XXXXXXXX| $7FF0
    .byte $FF ; |XXXXXXXX| $7FF1
    .byte $FF ; |XXXXXXXX| $7FF2
    .byte $FF ; |XXXXXXXX| $7FF3
    .byte $FF ; |XXXXXXXX| $7FF4
    .byte $FF ; |XXXXXXXX| $7FF5

    ELSE ZELLERS
;this broken code is part of the routine at L7672

    .byte $81     ; inc $81
    lda    $BE
    and    #$37
    jmp    L7630
M767D:
    lda    $82
    sta    AUDV0
    ora    #$10
    sta    AUDF0
    dec    $82
    bmi    M7692
    lda    $BE
    and    #$33
    sta    $BE
    jmp    L7630
M7692:
    lda    $BE
    and    #$77
    jmp    L762C
    and    #$FF

  ENDIF

    .byte $FF ; |XXXXXXXX| $7FF6
    .byte $FF ; |XXXXXXXX| $7FF7
    .byte $FF ; |XXXXXXXX| $7FF8
    .byte $FF ; |XXXXXXXX| $7FF9
    .byte $FF ; |XXXXXXXX| $7FFA
    .byte $FF ; |XXXXXXXX| $7FFB

       ORG $7FFC
    .word $F000,$F000