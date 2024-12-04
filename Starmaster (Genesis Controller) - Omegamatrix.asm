; Rough Disassembly of Starmaster
; By Omegamatrix
;
; Big thanks to TJ for disassembling Starmaster before!!
; It made life a lot easier.
;
;
; - 2 button support added for Genesis controllers,
; button C now controls the map screen instead of B&W/Color switch
; - 12 bytes are still free before the start of data
;
;
;
; Using DiStella v3.0
;
; Command Line: Distella -pasfcStarM.cfg StarM.bin > StarMaster(re).asm
;
; StarM.cfg contents:
;
;      ORG F000
;      CODE F000 FC38
;      GFX FC39 FFFF

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
HMM0    =  $22
HMM1    =  $23
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C

; Read TIA Baseline = $00
CXM0P   =  $00
CXM1P   =  $01
INPT1   =  $09
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296




       ORG $F000

START:
;    sei                          ; 2

    STA    NUSIZ0                ; lock 2600 mode
    CLI                          ; clear the interrupt initially

    cld                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    inx                          ; 2   X=0
    jsr    LFA83                 ; 6
    lda    #$40                  ; 2
    sta    $8A                   ; 3
    sta    $86                   ; 3
    lda    #$12                  ; 2
    sta    $B6                   ; 3
LF013:
    ldx    #1                    ; 2
    ldy    #1                    ; 2
    lda    $83                   ; 3
    and    #$04                  ; 2
    beq    LF027                 ; 2³
    tax                          ; 2
LF01E:
    lda    $A5,X                 ; 4
    bne    LF027                 ; 2³
    dex                          ; 2
    cpx    #1                    ; 2
    bne    LF01E                 ; 2³
LF027:
    lda    LFCA1,X               ; 4
    eor    $81                   ; 3
    and    $82                   ; 3
    sta.wy COLUPF,Y              ; 5
    dex                          ; 2
    dey                          ; 2
    bpl    LF027                 ; 2³
    lda    $8A                   ; 3
    bne    LF047                 ; 2³
    jsr    LFB75                 ; 6
    tax                          ; 2
    cmp    #9                    ; 2
    bne    LF047                 ; 2³
    lda    $B2                   ; 3
    cmp    #$50                  ; 2
    bcc    LF048                 ; 2³
LF047:
    dey                          ; 2
LF048:
    sty    $EE                   ; 3
    lda    #$2C                  ; 2
    ldy    $8A                   ; 3
    bne    LF05C                 ; 2³
    lda    #$8C                  ; 2
    cpx    #9                    ; 2
    beq    LF05C                 ; 2³
    cpx    #5                    ; 2
    beq    LF05C                 ; 2³
    lda    $83                   ; 3
LF05C:
    eor    $81                   ; 3
    and    $82                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    $86                   ; 3
    bne    LF06C                 ; 2³
    lda    $8A                   ; 3
    bne    LF08E                 ; 2³
LF06C:
;    lda    SWCHB                 ; 4
;    lsr                          ; 2
;    and    #$64                  ; 2


    BIT   INPT1
    BPL   .pressed1
    CLI
    BMI   .return1               ; always branch

.pressed1:
    PHP
    SEI
    PLA
    AND   #$04                   ; was interrupt set last frame?
    BNE   .return1               ; branch if interrupt was set last frame
    LDA   $F9                    ; this happens only once per firebutton press
    EOR   #$04                   ; flip map screen switch
    STA   $F9
.return1:
    LDA    SWCHB
    LSR
    AND    #$60
    BIT    INPT1
    BMI    .notPressed1
    ORA    #$04
.notPressed1:


    sta    $88                   ; 3
    eor    $F9                   ; 3
    and    #$64                  ; 2
    beq    LF08E                 ; 2³
    lda    $F9                   ; 3
    eor    #$80                  ; 2
    and    #$80                  ; 2
    ora    $88                   ; 3
    sta    $F9                   ; 3
    lda    $C4                   ; 3
    tay                          ; 2
    jsr    LFA4F                 ; 6
    lda    $C3                   ; 3
    sta    $C4                   ; 3
LF08E:
    lda    $F9                   ; 3
    bpl    LF095                 ; 2³
    jmp    LF204                 ; 3

LF095:
    ldx    #$8F                  ; 2
    stx    REFP1                 ; 3
    txs                          ; 2
    ldx    #0                    ; 2
    lda    $B2                   ; 3
;    lsr                          ; 2
;    lsr                          ; 2
;    lsr                          ; 2
;    lsr                          ; 2
;    lsr                          ; 2
;    ora    #$F8                  ; 2
;    sec                          ; 2

    SEC                          ; 2
    ORA    #$1F                  ; 2
    ROL                          ; 2
    ROL                          ; 2
    ROL                          ; 2
    ROL                          ; 2   carry is now set

    adc    $AE                   ; 3
    cmp    #$8E                  ; 2
    bcs    LF0B6                 ; 2³
    cmp    $AF                   ; 3
    bcs    LF0B7                 ; 2³
    lda    $AF                   ; 3
    cmp    #$8E                  ; 2
    bcs    LF0B7                 ; 2³
LF0B6:
    inx                          ; 2
LF0B7:
    lda    $EB,X                 ; 4
    sta    $ED                   ; 3
    ldy    $E9,X                 ; 4
    sty    $89                   ; 3
    ldy    #$70                  ; 2
    sec                          ; 2
    lda    $AE,X                 ; 4
    sbc    #$91                  ; 2
    bcs    LF0C9                 ; 2³
    tay                          ; 2
LF0C9:
    txa                          ; 2
    eor    #$01                  ; 2
    tax                          ; 2
    lda    $AE,X                 ; 4
    sta    $A4                   ; 3
    lda    $EB,X                 ; 4
    sta    $EB                   ; 3
    lda    $E9,X                 ; 4
    sta    $E9                   ; 3
    lda    $B0                   ; 3
    cmp    #9                    ; 2
    bcc    LF0E3                 ; 2³
    cmp    #$A2                  ; 2
    bcc    LF0E5                 ; 2³
LF0E3:
    ldy    #$70                  ; 2
LF0E5:
    ldx    #7                    ; 2
    stx    $B1                   ; 3
LF0E9:
    lda    INTIM                 ; 4
    bpl    LF0E9                 ; 2³
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    VBLANK                ; 3
    beq    LF150                 ; 3+1   always branch

LF0F8:
    bcs    LF100                 ; 2³+1
    lda    ($ED),Y               ; 5
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
LF100:
    lda    #2                    ; 2
    sta    ENABL                 ; 3
    tsx                          ; 2
    dex                          ; 2

;    lda    #0                    ; 2
    ASL

    cpx    $AD                   ; 3
    bcc    LF112                 ; 2³
    cpx    $AC                   ; 3
    bcs    LF116                 ; 2³

;    lda    #2                    ; 2
    LSR

LF112:
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
LF116:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    dex                          ; 2
    iny                          ; 2
    cpy    #$3C                  ; 2
    bcs    LF126                 ; 2³
    lda    ($ED),Y               ; 5
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
LF126:
    dex                          ; 2
    lda    #0                    ; 2
    iny                          ; 2
    cpy    #$3C                  ; 2
    bcs    LF130                 ; 2³
    lda    ($ED),Y               ; 5
LF130:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #0                    ; 2
    sta    ENABL                 ; 3
    cpx    $AD                   ; 3
    bcc    LF146                 ; 2³
    cpx    $AC                   ; 3
    bcs    LF14A                 ; 2³
    lda    #2                    ; 2
LF146:
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
LF14A:
    dex                          ; 2
    txs                          ; 2
    dec    $B1                   ; 5
    ldx    $B1                   ; 3
LF150:
    lda    $E0,X                 ; 4
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    sta    $88                   ; 3
    iny                          ; 2
    lda    ($ED),Y               ; 5
    cpy    #$3C                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    bcs    LF169                 ; 2³
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    bcc    LF16D                 ; 3   always branch

LF169:
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
LF16D:
;    nop                          ; 2
;    lda    CXM0P                 ; 3
    DEC    $2E

    ldx    $88                   ; 3
LF172:
    dex                          ; 2
    bpl    LF172                 ; 2³
    sta    RESBL                 ; 3
LF177:
    tsx                          ; 2
    dex                          ; 2
    iny                          ; 2
    cpy    #$3C                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    bcs    LF188                 ; 2³
    lda    ($ED),Y               ; 5
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
LF188:
    txa                          ; 2
    and    #$01                  ; 2
    beq    LF19D                 ; 2³
    cpx    $AD                   ; 3
    bcc    LF196                 ; 2³
    cpx    $AC                   ; 3
    bcs    LF196                 ; 2³
    asl                          ; 2
LF196:
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    jmp    LF1A5                 ; 3

LF19D:
    cpy    #$3C                  ; 2
    bcs    LF1A5                 ; 2³
    cpy    $89                   ; 3
    bcs    LF1BD                 ; 2³
LF1A5:
    txs                          ; 2
    txa                          ; 2
    ldx    $B1                   ; 3
    stx    HMBL                  ; 3
    cmp    $CA,X                 ; 4
    bcs    LF177                 ; 2³
    cmp    #6                    ; 2
    bcc    LF1EC                 ; 2³
    iny                          ; 2
    cpy    #$3C                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    LF0F8                 ; 3

LF1BD:
    ldy    $E9                   ; 3
    sty    $89                   ; 3
    ldy    #$70                  ; 2
;    sec                          ; 2   carry already set
    lda    $A4                   ; 3
    stx    $88                   ; 3
    sbc    $88                   ; 3
    bpl    LF1CD                 ; 2³
    tay                          ; 2
LF1CD:
    lda    $EB                   ; 3
    sta    $ED                   ; 3
    txs                          ; 2
    txa                          ; 2
    ldx    $B1                   ; 3
    stx    HMBL                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    cmp    $CA,X                 ; 4
    bcs    LF1E6                 ; 2³
    cmp    #6                    ; 2
    bcc    LF1EA                 ; 2³
    jmp    LF100                 ; 3

LF1E6:
    tsx                          ; 2
    dex                          ; 2
    bne    LF188                 ; 2³
LF1EA:
    sbc    #0                    ; 2
LF1EC:
    tax                          ; 2
LF1ED:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    #0                    ;2  @5
    sta    GRP0                  ;3  @8
    sta    GRP1                  ;3  @11
    dex                          ;2  @13
    bpl    LF1ED                 ;2³ @15/16
    txs                          ;2  @17   X=$FF
;    jsr    LFB0D                 ;6  @23
    jsr    LFB0D+1               ;6  @23      jump inbetween opcode and operand, does a regular nop

    ldx    #1                    ; 2
    stx    REFP1                 ; 3
;    bne    LF27D                 ; 3   always branch
;adds a byte, but saves 3 bytes by being able to move a subroutine inline
    JMP    LF27D


LF204:
    lda    INTIM                 ; 4
    bpl    LF204                 ; 2³
    ldx    #4                    ; 2
LF20B:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LF20B                 ; 2³
    stx    VBLANK                ; 3
    lda    #$2E                  ; 2
    jsr    LFADC                 ; 6   X=0, P0
    inx                          ; 2
    lda    #$5E                  ; 2
    jsr    LFADC                 ; 6   X=1, P1
    ldy    #3                    ; 2
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    #$0A                  ; 2
    lda    #$FF                  ; 2
LF22B:
    sta    $EE,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LF22B                 ; 2³
    lda    #$2C                  ; 2
    eor    $81                   ; 3
    and    $82                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$23                  ; 2
    stx    $E8                   ; 3
LF243:
    ldy    #$0A                  ; 2
LF245:
    lda    $E8                   ; 3
    jsr    LFB77                 ; 6
    tax                          ; 2
    lda    $BA                   ; 3
    and    #$0F                  ; 2
    cmp    #OFS_R                ; 2
    bne    LF257                 ; 2³
    lda    LFF26,X               ; 4
    tax                          ; 2
LF257:
    lda    LFCCC,X               ; 4
    sta.wy $ED,Y                 ; 5
    dec    $E8                   ; 5
    dey                          ; 2
    dey                          ; 2
    bpl    LF245                 ; 2³
;    jsr    LF9BB                 ; 6

;moved inline
;LF9BB SUBROUTINE
    ldy    #7                    ; 2
LF9BD:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($ED),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F3),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($F7),Y               ; 5
    sta    $88                   ; 3
    lda    ($F1),Y               ; 5
    tax                          ; 2
    lda    ($EF),Y               ; 5
    sta    GRP0                  ; 3
    nop                          ; 2
    stx    GRP0                  ; 3
    ldx    $88                   ; 3
    lda    ($F5),Y               ; 5
    sta    GRP1                  ; 3
;    nop                          ; 2
    DEY

    stx    GRP1                  ; 3
;    dey                          ; 2
    bne    LF9BD                 ; 2³

    LDA    $E8

    sty    GRP0                  ; 3   comes 1 cycle later now
    sty    GRP1                  ; 3
;    rts                          ; 6

;    lda    $E8                   ; 3
    bpl    LF243                 ; 2³
    ldx    #$18                  ; 2
LF26C:
    sta    WSYNC                 ; 3
;---------------------------------------
;    lda    CXM0P                 ; 3  waste 11 cycles
;    nop                          ; 2
;    nop                          ; 2
;    nop                          ; 2
;    nop                          ; 2
;    dex                          ; 2
;    bpl    LF26C                 ; 2³
;    nop                          ; 2  @17

;save 3 bytes, note a NOP had to be added in LFB0D subroutine, so only save 3 bytes saved
    JSR   Waste12Cycles          ;12  @12
    DEX                          ;2   @14
    BPL    LF26C                 ;2³  @16/17

    jsr    LFB0D                 ; 6        1 cycle ahead of before, make up for it with 3 cycle NOP
    ldx    #4                    ; 2
LF27D:
    stx    $E8                   ; 3
    lda    #$2C                  ; 2
    eor    $81                   ; 3
    and    $82                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #<Colon               ; 2
    sta    $EF                   ; 3
LF28D:
    lda    $FB                   ; 3
    cpx    #4                    ; 2
    beq    LF296                 ; 2³
    lda    LFCA6,X               ; 4
LF296:
    sta    $ED                   ; 3
    txa                          ; 2
    asl                          ; 2
    tax                          ; 2
    inx                          ; 2
    txs                          ; 2
    ldy    #4                    ; 2
LF29F:
    lda    $B9,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFEF0,X               ; 4
    sta.wy $F1,Y                 ; 5
    tsx                          ; 2
    lda    $B9,X                 ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LFEF0,X               ; 4
    sta.wy $F3,Y                 ; 5
    tsx                          ; 2
    dex                          ; 2
    txs                          ; 2
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    bpl    LF29F                 ; 2³
    ldx    #$FF                  ; 2
    txs                          ; 2
    jsr    LFA03                 ; 6
    dec    $E8                   ; 5
    ldx    $E8                   ; 3
    bpl    LF28D                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    PF2                   ; 3
    ldx    #$0B                  ; 2
LF2D5:
    lda    LFCD6,X               ; 4
    sta    $ED,X                 ; 4
    dex                          ; 2
    bpl    LF2D5                 ; 2³
    jsr    LF9E6                 ; 6
    lda    $86                   ; 3
    beq    LF2EA                 ; 2³
    dec    $86                   ; 5
    bne    LF2EA                 ; 2³
    dec    $86                   ; 5
LF2EA:
    ldy    #$19                  ; 2
    sty    TIM64T                ; 4
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcs    LF2FD                 ; 2³
    ldx    #$85                  ; 2
LF2F7:
    jsr    LFA83                 ; 6     do reset
    jmp    LF4EC                 ; 3

LF2FD:
    lsr                          ; 2
    bcs    LF319                 ; 2³
    lda    $B8                   ; 3
    beq    LF308                 ; 2³
    dec    $B8                   ; 5
    bpl    LF31B                 ; 2³
LF308:
    lda    $80                   ; 3
;    clc                          ; 2   carry already clear
    adc    #1                    ; 2
    and    #$03                  ; 2
    sta    $80                   ; 3
    ldx    #$87                  ; 2
    stx    $85                   ; 3
    inc    $86                   ; 5
    bne    LF2F7                 ; 2³+1
LF319:
    stx    $B8                   ; 3
LF31B:
    jsr    LFAC7                 ; 6
    lda    $86                   ; 3
    beq    LF325                 ; 2³
    jmp    LF469                 ; 3

LF325:
    lda    $83                   ; 3
    bne    LF338                 ; 2³
    sed                          ; 2
    clc                          ; 2
    lda    $BE                   ; 3
    adc    #1                    ; 2
    sta    $BE                   ; 3
    lda    $BD                   ; 3
    adc    #0                    ; 2
    sta    $BD                   ; 3
    cld                          ; 2
LF338:
    dec    $DD                   ; 5
    beq    LF33F                 ; 2³
    jmp    LF419                 ; 3

LF33F:
    lda    #$60                  ; 2
    sta    $DD                   ; 3
    ldx    $AB                   ; 3
    lda    LFC67,X               ; 4
    jsr    LFB77                 ; 6
    cmp    #4                    ; 2
    beq    LF35C                 ; 2³
    cmp    #9                    ; 2
    beq    LF35C                 ; 2³
    ldx    $AB                   ; 3
    cpx    #3                    ; 2
    beq    LF35A                 ; 2³
    inx                          ; 2
LF35A:
    stx    $AB                   ; 3
LF35C:
    dec    $DE                   ; 5
    bpl    LF364                 ; 2³
    lda    #$23                  ; 2
    sta    $DE                   ; 3
LF364:
    ldx    $AB                   ; 3
    lda    LFC39,X               ; 4
    ldx    #5                    ; 2
LF36B:
    ldy    LFC95,X               ; 4
    cpy    $DE                   ; 3
    bne    LF374                 ; 2³
    and    #$0B                  ; 2
LF374:
    ldy    LFC9B,X               ; 4
    cpy    $DE                   ; 3
    bne    LF37D                 ; 2³
    and    #$07                  ; 2
LF37D:
    dex                          ; 2
    bpl    LF36B                 ; 2³
    sta    $E1                   ; 3
    tax                          ; 2
    lda    #$0F                  ; 2
    sta    $E4                   ; 3
    lda    $DE                   ; 3
    clc                          ; 2
    adc    LFD09,X               ; 4
    bpl    LF395                 ; 2³
    lda    #$0D                  ; 2
    sta    $E4                   ; 3
    bne    LF39B                 ; 3   always branch

LF395:
    cmp    #$24                  ; 2
    bcc    LF39B                 ; 2³
    dec    $E4                   ; 5
LF39B:
    lda    $E1                   ; 3
    and    $E4                   ; 3
    sta    $E1                   ; 3
    lda    $DE                   ; 3
    jsr    LFB77                 ; 6
    cmp    #4                    ; 2
    bcs    LF3C9                 ; 2³
    sta    $E2                   ; 3
    lda    $DE                   ; 3
;    clc                          ; 2   carry already clear
    ldx    $E1                   ; 3
    adc    LFD09,X               ; 4
    sta    $E3                   ; 3
    jsr    LFB77                 ; 6
    bne    LF3C9                 ; 2³
    lda    $DE                   ; 3
    ldy    #0                    ; 2
    jsr    LFB87                 ; 6
    lda    $E3                   ; 3
    ldy    $E2                   ; 3
    jsr    LFB87                 ; 6
LF3C9:
    ldx    $DB                   ; 3
    lda    LFC67,X               ; 4
    jsr    LFB77                 ; 6
    sta    $E4                   ; 3
    cmp    #4                    ; 2
    beq    LF3DB                 ; 2³
    cmp    #9                    ; 2
    bne    LF411                 ; 2³+1
LF3DB:
    lda    $DB                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    $DC                   ; 3
    tax                          ; 2
    lda    LFC6B,X               ; 4
    jsr    LFB77                 ; 6
    tay                          ; 2
    ldx    $DB                   ; 3
    lda    $C5,X                 ; 4
    sec                          ; 2
    sbc    LFC40,Y               ; 4
    sta    $C5,X                 ; 4
    bcs    LF409                 ; 2³+1
    dec    $C9                   ; 5
    lda    $E4                   ; 3
    sec                          ; 2
    sbc    #4                    ; 2
    tay                          ; 2
    lda    LFC67,X               ; 4
    jsr    LFB87                 ; 6
    lda    #$B0                  ; 2
    sta    $A9                   ; 3
LF409:
    dec    $DC                   ; 5
    bpl    LF419                 ; 2³
    lda    #7                    ; 2
    sta    $DC                   ; 3
LF411:
    dec    $DB                   ; 5
    bpl    LF419                 ; 2³
    lda    #3                    ; 2
    sta    $DB                   ; 3
LF419:
    lda    $83                   ; 3
    and    #$03                  ; 2
    bne    LF425                 ; 2³
    lda    $8A                   ; 3
    beq    LF425                 ; 2³
    dec    $8A                   ; 5
LF425:
    lda    $AA                   ; 3
    beq    LF42D                 ; 2³
    dec    $AA                   ; 5
    bne    LF457                 ; 2³
LF42D:
    lda    #$4E                  ; 2
    sta    $AC                   ; 3
    lda    #$45                  ; 2
    sta    $AD                   ; 3
    lda    $B9                   ; 3
    ora    $A0                   ; 3
    cmp    #HI_DAMAGE            ; 2
    bcs    LF469                 ; 2³
    lda    $8A                   ; 3
    cmp    #$C0                  ; 2
    bcs    LF469                 ; 2³
    lda    INPT4                 ; 3
    ora    $F9                   ; 3
    bmi    LF469                 ; 2³
    lda    #$20                  ; 2
    sta    $AC                   ; 3
    lda    #6                    ; 2
    sta    $AD                   ; 3
    stx    CXCLR                 ; 3
    ldx    #$17                  ; 2
    stx    $AA                   ; 3
LF457:
    lda    $AD                   ; 3
    clc                          ; 2
    adc    #3                    ; 2
    sta    $AD                   ; 3
    lda    $AC                   ; 3
    clc                          ; 2
    adc    #2                    ; 2
    cmp    #$4C                  ; 2
    bcs    LF469                 ; 2³
    sta    $AC                   ; 3
LF469:
    lda    $AA                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFF00,X               ; 4
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    SWCHA                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$0F                  ; 2
    tay                          ; 2
    beq    LF484                 ; 2³
    sta    $87                   ; 3
LF484:
    lda    $86                   ; 3
    ora    $A0                   ; 3
    beq    LF48C                 ; 2³
    ldy    #0                    ; 2
LF48C:
    sty    $88                   ; 3
    lda    $A0                   ; 3
    bne    LF4D5                 ; 2³
    dec    $B5                   ; 5
    bpl    LF4D5                 ; 2³
    lda    $8A                   ; 3
    bmi    LF49F                 ; 2³
    eor    #$FF                  ; 2
    sec                          ; 2
    sbc    #$68                  ; 2
LF49F:
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    $B5                   ; 3
    ldx    #7                    ; 2
LF4A9:
    lda    $CA,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ldy    $88                   ; 3
    clc                          ; 2
    adc    LFC8B,Y               ; 4
    tay                          ; 2
    lda    LFD80,Y               ; 4
    clc                          ; 2
    adc    $CA,X                 ; 4
    sta    $CA,X                 ; 4
    lda    $D2,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LFCB6,Y               ; 4
    ldy    $88                   ; 3
    clc                          ; 2
    adc    LFEE5,Y               ; 4
    clc                          ; 2
    adc    $D2,X                 ; 4
    sta    $D2,X                 ; 4
    dex                          ; 2
    bpl    LF4A9                 ; 2³
LF4D5:
    ldx    #1                    ; 2
    ldy    $88                   ; 3
LF4D9:
    lda    $AE,X                 ; 4
    clc                          ; 2
    adc    LFD25,Y               ; 4
    sta    $AE,X                 ; 4
    dex                          ; 2
    bpl    LF4D9                 ; 2³
    lda    $B0                   ; 3
    clc                          ; 2
    adc    LFF10,Y               ; 4
    sta    $B0                   ; 3
LF4EC:
    ldy    INTIM                 ; 4
    bpl    LF4EC                 ; 2³
    inc    $83                   ; 5
    bne    LF4FC                 ; 2³
    inc    $87                   ; 5
    bne    LF4FC                 ; 2³
    sec                          ; 2
    ror    $87                   ; 5
LF4FC:
    ldx    #3                    ; 2
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    VSYNC                 ; 3
    stx    VBLANK                ; 3
    ldy    #$FF                  ; 2
    lda    #0                    ; 2
    bit    $87                   ; 3
    bpl    LF511                 ; 2³
    ldy    #$F7                  ; 2
    lda    $87                   ; 3
    asl                          ; 2
LF511:
    sty    $82                   ; 3
    sta    $81                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$40                  ; 2
    sty    VSYNC                 ; 3
    sty    TIM64T                ; 4
    lda    $AA                   ; 3
    cmp    #$16                  ; 2
    bne    LF529                 ; 2³
    lda    #1                    ; 2
    jsr    LFBCB                 ; 6
LF529:
    ldx    #7                    ; 2
LF52B:
    lda    $D2,X                 ; 4
    cmp    #$14                  ; 2
    bcc    LF545                 ; 2³
    cmp    #$88                  ; 2
    bcs    LF545                 ; 2³
    lda    $CA,X                 ; 4
    cmp    #$8A                  ; 2
    bcs    LF545                 ; 2³
    cmp    #7                    ; 2
    bcc    LF545                 ; 2³
LF53F:
    dex                          ; 2
    bpl    LF52B                 ; 2³
    jmp    LF5D4                 ; 3

LF545:
    stx    $88                   ; 3
    ldx    #7                    ; 2
LF549:
    lda    $CA,X                 ; 4
    cmp    #$48                  ; 2
    bcc    LF552                 ; 2³
    dex                          ; 2
    bpl    LF549                 ; 2³
LF552:
    inx                          ; 2
    stx    $89                   ; 3
    ldx    $88                   ; 3
    cpx    $89                   ; 3
    bcc    LF5A8                 ; 2³
LF55B:
    dex                          ; 2
    bmi    LF56C                 ; 2³
    cpx    $89                   ; 3
    bcc    LF56C                 ; 2³
    lda    $CA,X                 ; 4
    sta    $CB,X                 ; 4
    lda    $D2,X                 ; 4
    sta    $D3,X                 ; 4
    bcs    LF55B                 ; 2³
LF56C:
    ldx    $89                   ; 3
    lda    #$53                  ; 2
    sta    $CA,X                 ; 4
    cpx    #4                    ; 2
    bcs    LF57E                 ; 2³
    lda    #$3F                  ; 2
    sta    $CA,X                 ; 4
    dex                          ; 2
    jmp    LF5BA                 ; 3

LF57E:
    clc                          ; 2
    adc    #6                    ; 2
    cmp    $CB,X                 ; 4
    bcc    LF597                 ; 2³

    lda    $D3,X                 ; 4
    sta    $D2,X                 ; 4
    lda    $CB,X                 ; 4
    sta    $CA,X                 ; 4

;    clc                          ; 2
    adc    #5;6                    ; 2  carry is set, it adds 1 more
    sta    $CB,X                 ; 4
    inx                          ; 2
    cpx    #7                    ; 2
    bcc    LF57E                 ; 2³
LF597:
    jsr    LFAC7                 ; 6
    lda    $84                   ; 3
    and    #$3F                  ; 2
    clc                          ; 2
    adc    #$30                  ; 2
    sta    $D2,X                 ; 4
    ldx    $88                   ; 3
    jmp    LF53F                 ; 3

LF5A8:
    dex                          ; 2
    dec    $89                   ; 5
LF5AB:
    inx                          ; 2
    cpx    $89                   ; 3
    bcs    LF56C                 ; 2³
    lda    $CB,X                 ; 4
    sta    $CA,X                 ; 4
    lda    $D3,X                 ; 4
    sta    $D2,X                 ; 4
    bcc    LF5AB                 ; 2³
LF5BA:
    sec                          ; 2
    sbc    #6                    ; 2
    cmp    $CA,X                 ; 4
    bcs    LF5D1                 ; 2³
    lda    $D2,X                 ; 4
    sta    $D3,X                 ; 4
    lda    $CA,X                 ; 4
    sta    $CB,X                 ; 4
    sec                          ; 2
    sbc    #6                    ; 2
    sta    $CA,X                 ; 4
    dex                          ; 2
    bpl    LF5BA                 ; 2³
LF5D1:
    inx                          ; 2
    bne    LF597                 ; 2³
LF5D4:
    ldy    #$FF                  ; 2
    sty    $89                   ; 3
    ldx    #7                    ; 2
LF5DA:
    lda    $D2,X                 ; 4
    cmp    #$88                  ; 2
    bcc    LF5E2                 ; 2³
    lda    #$87                  ; 2
LF5E2:
    jsr    LFAD6                 ; 6
    sta    $E0,X                 ; 4
    tya                          ; 2
    ora    $E0,X                 ; 4
    sta    $E0,X                 ; 4
    dex                          ; 2
    bpl    LF5DA                 ; 2³
    lda    $F9                   ; 3
    bmi    LF5F6                 ; 2³
LF5F3:
    jmp    LF6BF                 ; 3

LF5F6:
    lda    $86                   ; 3
    bne    LF5F3                 ; 2³
    lda    SWCHA                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$0F                  ; 2
    ldx    #5                    ; 2
LF605:
    ldy    LFC95,X               ; 4
    cpy    $C4                   ; 3
    bne    LF60E                 ; 2³
    and    #$0B                  ; 2
LF60E:
    ldy    LFC9B,X               ; 4
    cpy    $C4                   ; 3
    bne    LF617                 ; 2³
    and    #$07                  ; 2
LF617:
    dex                          ; 2
    bpl    LF605                 ; 2³
    tax                          ; 2
    bne    LF621                 ; 2³
    sta    $9E                   ; 3
    beq    LF652                 ; 3   always branch

LF621:
    lda    $9E                   ; 3
    beq    LF629                 ; 2³
    dec    $9E                   ; 5
    bpl    LF652                 ; 2³
LF629:
    lda    #$10                  ; 2
    sta    $9E                   ; 3
    lda    $C4                   ; 3
    tay                          ; 2
    clc                          ; 2
    adc    LFD09,X               ; 4
    bmi    LF652                 ; 2³
    cmp    #$24                  ; 2
    bcs    LF652                 ; 2³
    sta    $C4                   ; 3
    tya                          ; 2
    jsr    LFA4F                 ; 6
    lda    $C4                   ; 3
    cmp    $C3                   ; 3
    beq    LF652                 ; 2³
    jsr    LFB77                 ; 6
    clc                          ; 2
    adc    #5                    ; 2
    tay                          ; 2
    lda    $C4                   ; 3
    jsr    LFB87                 ; 6
LF652:
    ldy    #1                    ; 2
LF654:
    stx    $88                   ; 3
    sta    $89                   ; 3
    lda.wy $C3,Y                 ; 4
    ldx    #0                    ; 2
LF65D:
    cmp    #6                    ; 2
    bcc    LF667                 ; 2³
    inx                          ; 2
;    sec                          ; 2   carry already set
    sbc    #6                    ; 2
    bpl    LF65D                 ; 2³
LF667:
    dey                          ; 2
    bpl    LF654                 ; 2³
    sec                          ; 2
    sbc    $89                   ; 3
    bpl    LF674                 ; 2³
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
LF674:
    sta    $89                   ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    $88                   ; 3
    bpl    LF681                 ; 2³
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
LF681:
    sed                          ; 2
    clc                          ; 2
    adc    $89                   ; 3
    sta    $BF                   ; 3
    ldy    $BA                   ; 3
    cpy    #HI_DAMAGE            ; 2
    bcc    LF690                 ; 2³
    clc                          ; 2
    adc    $BF                   ; 3
LF690:
    cld                          ; 2
    sta    $BF                   ; 3
    ldy    INPT4                 ; 3
    bmi    LF6BF                 ; 2³
    ldy    $C4                   ; 3
    cpy    $C3                   ; 3
    beq    LF6BF                 ; 2³
    jsr    LFB75                 ; 6
    sec                          ; 2
    sbc    #5                    ; 2
    tay                          ; 2
    jsr    LFB85                 ; 6
    lda    $C4                   ; 3
    sta    $C3                   ; 3
    lda    $F9                   ; 3
    eor    #$80                  ; 2
    sta    $F9                   ; 3

    lda    #$FE                  ; 2
    sta    $B2                   ; 3
    lda    #$C8                  ; 2
    sta    $8A                   ; 3
    lda    #0                    ; 2
    sta    $9D                   ; 3
    sta    $A0                   ; 3
LF6BF:
    lda    $A8                   ; 3
    cmp    #1                    ; 2
    bne    LF6DC                 ; 2³
    lda    $84                   ; 3
    and    #$7F                  ; 2
    sta    $AE                   ; 3
    jsr    LFAC7                 ; 6
    lda    $9D                   ; 3
    bne    LF6D8                 ; 2³
    lda    $84                   ; 3
    and    #$7F                  ; 2
    sta    $B0                   ; 3
LF6D8:
    lda    #$FC                  ; 2
    sta    $B2                   ; 3
LF6DC:
    lda    $83                   ; 3
    and    #$01                  ; 2
    ora    $86                   ; 3
    bne    LF6F0                 ; 2³
    ldx    #5                    ; 2
LF6E6:
    lda    $A1,X                 ; 4
    clc                          ; 2
    adc    $AE,X                 ; 4
    sta    $AE,X                 ; 4
    dex                          ; 2
    bpl    LF6E6                 ; 2³
LF6F0:
    ldx    #1                    ; 2
LF6F2:
    lda    $B2,X                 ; 4
    cmp    #$B0                  ; 2
    bcc    LF6FA                 ; 2³
    lda    #$B0                  ; 2
LF6FA:
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    stx    $88                   ; 3
    ldx    $8A                   ; 3
    bne    LF711                 ; 2³
    jsr    LFB75                 ; 6
    cmp    #9                    ; 2
    bne    LF711                 ; 2³
    tya                          ; 2
    clc                          ; 2
    adc    #OFS_BASE ;$0C                  ; 2
    tay                          ; 2
LF711:
    ldx    $88                   ; 3
    cpx    #1                    ; 2
    bne    LF71C                 ; 2³
    tya                          ; 2
    clc                          ; 2
    adc    #OFS_METEOR ;$18                  ; 2
    tay                          ; 2
LF71C:
    lda    LFD5C,Y               ; 4
    sta    $E9,X                 ; 4
    lda    LFD38,Y               ; 4
    sta    $EB,X                 ; 4
    dex                          ; 2
    bpl    LF6F2                 ; 2³+1
    lda    $86                   ; 3
    beq    LF730                 ; 2³
    jmp    LF8E1                 ; 3

LF730:
    lda    $83                   ; 3
    and    #$3F                  ; 2
    bne    LF73B                 ; 2³
    lda    #1                    ; 2
    jsr    LFBBA                 ; 6
LF73B:
    lda    $9D                   ; 3
    bne    LF741                 ; 2³
    sta    $AF                   ; 3
LF741:
    jsr    LFB75                 ; 6
    sta    $89                   ; 3
    lda    $8A                   ; 3
    beq    LF75D                 ; 2³
    lda    $83                   ; 3
    and    #$07                  ; 2
    bne    LF755                 ; 2³
    lda    $BF                   ; 3
    jsr    LFBBA                 ; 6
LF755:
    lda    #$FF                  ; 2
    sta    $B2                   ; 3
    sta    $A5                   ; 3
    bne    LF76B                 ; 3   always branch

LF75D:
    lda    $89                   ; 3
    cmp    #9                    ; 2
    beq    LF77C                 ; 2³
    cmp    #5                    ; 2
    bne    LF76B                 ; 2³
    lda    #0                    ; 2
    sta    $AE                   ; 3
LF76B:
    lda    $A8                   ; 3
    ora    $A7                   ; 3
    ora    $9D                   ; 3
    bne    LF7A8                 ; 2³
    lda    $83                   ; 3
    and    #$7F                  ; 2
    bne    LF7A8                 ; 2³
    jsr    LFBA6                 ; 6
LF77C:
    lda    $8A                   ; 3
    cmp    #$50                  ; 2
    bcs    LF792                 ; 2³
    lda    $89                   ; 3
    cmp    #9                    ; 2
    beq    LF7A8                 ; 2³
    cmp    #5                    ; 2
    beq    LF7A8                 ; 2³
    lda    $B2                   ; 3
    cmp    #$B1                  ; 2
    bcs    LF7A8                 ; 2³
LF792:
    lda    #0                    ; 2
    sta    $A2                   ; 3
    ldx    $80                   ; 3
    lda    LFCAE,X               ; 4
    sta    $A6                   ; 3
    sta    $9D                   ; 3
    lda    $B2                   ; 3
    sta    $B3                   ; 3
    ldy    $AE                   ; 3
    iny                          ; 2
    sty    $AF                   ; 3
LF7A8:
    ldy    #2                    ; 2
    ldx    $9D                   ; 3
LF7AC:
    lda    $AF                   ; 3
    cpy    #2                    ; 2
    bne    LF7B4                 ; 2³
    lda    $B0                   ; 3
LF7B4:
    cmp    LFCC0,Y               ; 4
    bcs    LF7BB                 ; 2³
    ldx    #0                    ; 2
LF7BB:
    cmp    LFCC0+1,Y               ; 4
    bcc    LF7C2                 ; 2³
    ldx    #0                    ; 2
LF7C2:
    dey                          ; 2
    dey                          ; 2
    bpl    LF7AC                 ; 2³
    stx    $9D                   ; 3
    lda    $9D                   ; 3
    beq    LF812                 ; 2³+1
    lda    $B3                   ; 3
    cmp    #6                    ; 2
    bcs    LF816                 ; 2³+1
    ldy    #$7F                  ; 2
    sty    $A9                   ; 3
    jsr    LFBCB                 ; 6
    lda    #0                    ; 2
    sta    $9D                   ; 3
    lda    $B9                   ; 3
    and    #$0F                  ; 2
    cmp    #OFS_S                ; 2
;    bne    LF7E8                 ; 2³
;    jmp    LFBE5                 ; 3
    BEQ    MF872

LF7E8:
    lda    $84                   ; 3
    cmp    #$40                  ; 2
    bcs    LF812                 ; 2³+1
    and    #$03                  ; 2
    tax                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LFD97,X               ; 4
    and    LFD9B+1,X               ; 4
    sta    $88                   ; 3
    eor.wy $B9,Y                 ; 4
    and    LFD9B+1,X               ; 4
    beq    LF812                 ; 2³
    lda.wy $B9,Y                 ; 4
    and    LFD9B,X               ; 4
    ora    $88                   ; 3
    sta.wy $B9,Y                 ; 5
    lda    #$60                  ; 2
    sta    $B4                   ; 3
LF812:
    lda    #$FC                  ; 2
    sta    $B3                   ; 3
LF816:
    ldy    #4                    ; 2
LF818:
    lda.wy $AE,Y                 ; 4
    cmp    LFCC0,Y               ; 4
    bcs    LF827                 ; 2³
    ldx    LFCC6,Y               ; 4
    stx    $A1,Y                 ; 4
    bne    LF831                 ; 2³
LF827:
    cmp    LFCC0+1,Y               ; 4
    bcc    LF831                 ; 2³
    ldx    LFCC6+1,Y               ; 4
    stx    $A1,Y                 ; 4
LF831:
    dey                          ; 2
    dey                          ; 2
    bpl    LF818                 ; 2³
    lda    CXM0P                 ; 3
    ora    CXM1P                 ; 3
    and    #$C0                  ; 2
    bne    LF840                 ; 2³
LF83D:
    jmp    LF8E1                 ; 3



LF8B5:
    lda    $AA                   ; 3
    beq    LF83D ; LF8E1                 ; 2³
    lda    #$F0                  ; 2
    sta    $B2                   ; 3
    lda    #$7F                  ; 2
    sta    $A8                   ; 3
    jsr    LFB75                 ; 6
    sec                          ; 2
    sbc    #1                    ; 2
    tay                          ; 2
    jsr    LFB85                 ; 6
    sed                          ; 2
    sec                          ; 2
    lda    $FA                   ; 3
    sbc    #1                    ; 2
    sta    $FA                   ; 3
    cld                          ; 2
    bne    LF8D9                 ; 2³
MF872:
    jmp    LFBE5                 ; 3

LF840:
    sta    CXCLR                 ; 3
    lda    $B0                   ; 3
    cmp    #$46                  ; 2
    bcc    LF83D                 ; 2³
    cmp    #$5E                  ; 2
    bcs    LF83D                 ; 2³
    lda    $AA                   ; 3
    beq    LF875                 ; 2³
    lda    $9D                   ; 3
    beq    LF875                 ; 2³
    lda    $AF                   ; 3
    cmp    #$45                  ; 2
    bcc    LF875                 ; 2³
;    sec                          ; 2   carry already set
    sbc    $EA                   ; 3
    cmp    #$4C                  ; 2
    bcs    LF875                 ; 2³
    lda    #$F0                  ; 2
    sta    $B3                   ; 3
    lda    #0                    ; 2
    sta    $A2                   ; 3
    sta    $A4                   ; 3
    sta    $A6                   ; 3
    sta    $9D                   ; 3
    lda    #$5F                  ; 2
    sta    $A7                   ; 3
    bne    LF83D                 ; 3   always branch

LF875:
    lda    $A8                   ; 3
    ora    $8A                   ; 3
    bne    LF8E1                 ; 2³
    lda    $AE                   ; 3
    cmp    #$45                  ; 2
    bcc    LF8E1                 ; 2³
;    sec                          ; 2   carry already set
    sbc    $E9                   ; 3
    cmp    #$4C                  ; 2
    bcs    LF8E1                 ; 2³
    lda    $89                   ; 3
    cmp    #9                    ; 2
    bne    LF8B5                 ; 2³
    lda    $B2                   ; 3
    ora    $A0                   ; 3
    cmp    #$0F                  ; 2
    bcs    LF8E1                 ; 2³
    sed                          ; 2
    lda    $9F                   ; 3
;    clc                          ; 2   carry already clear
    adc    #1                    ; 2
    sta    $9F                   ; 3
    cld                          ; 2
    lda    #$0F                  ; 2
    sta    $B4                   ; 3
    sta    $B2                   ; 3
    lda    #$99                  ; 2
    sta    $A0                   ; 3
    sta    $BB                   ; 3
    sta    $BC                   ; 3
    lda    #NO_DAMAGE            ; 2
    sta    $B9                   ; 3
    sta    $BA                   ; 3
;    bne    LF8D9                 ; 3   always branch



LF8D9:
    lda    #0                    ; 2
    sta    $A1                   ; 3
    sta    $A3                   ; 3
    sta    $A5                   ; 3
LF8E1:
    ldx    #0                    ; 2
MF8E3:
    lda    $B0                   ; 3
    jsr    LFADC                 ; 6   X=0, P0
    inx                          ; 2
    lda    $B0                   ; 3
    clc                          ; 2
    adc    #8                    ; 2
    jsr    LFADC                 ; 6   P1
    inx                          ; 2
    lda    #$A3                  ; 2
    jsr    LFADC                 ; 6   M0
    inx                          ; 2
    lda    #6                    ; 2
    jsr    LFADC                 ; 6   M1
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    #2                    ; 2
LF903:
    lda    $A7,X                 ; 4
    beq    LF909                 ; 2³
    dec    $A7,X                 ; 6
LF909:
    dex                          ; 2
    bpl    LF903                 ; 2³
    lda    $B4                   ; 3
    beq    LF91A                 ; 2³
    dec    $B4                   ; 5
    sta    AUDF0                 ; 3
    ldx    #$0C                  ; 2
    stx    AUDC0                 ; 3
    bne    LF94D                 ; 3   always branch

LF91A:
    ldx    #8                    ; 2
    stx    AUDC0                 ; 3
    lda    $AA                   ; 3
    beq    LF92E                 ; 2³
    lda    $84                   ; 3
    and    #$03                  ; 2
;    sta    AUDF0                 ; 3
;    lda    #$0F                  ; 2
;    sta    AUDV0                 ; 3
;    bne    LF94F                 ; 3   always branch

    LDX    #$0F                   ; 2
    BNE    MF94B                  ; 3   always branch

LF92E:
    ldx    #0                    ; 2
    lda    $86                   ; 3
    bne    LF948                 ; 2³
    ldx    #8                    ; 2
    lda    $8A                   ; 3
    bne    LF940                 ; 2³
    lda    #$FF                  ; 2
    ldx    #3                    ; 2
    bne    LF948                 ; 3   always branch

LF940:
    cmp    #$16                  ; 2
    bcs    LF948                 ; 2³
    eor    #$FF                  ; 2
    ldx    #6                    ; 2
LF948:
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
MF94B:
    sta    AUDF0                 ; 3
LF94D:
    stx    AUDV0                 ; 3
LF94F:
    lda    $9D                   ; 3
    beq    LF965                 ; 2³
    lda    $B3                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDF1                 ; 3
    lsr                          ; 2   bit 7 = 0
    eor    #$8F                  ; 2   bit 7 = 1
    sta    AUDV1                 ; 3
;    lda    #8                    ; 2
;    sta    AUDC1                 ; 3
;    bne    LF9AE                 ; 3   always branch

    BMI    MF098                 ; 3   always branch

LF965:
    lda    $A8                   ; 3
    ora    $A7                   ; 3
    ora    $A9                   ; 3
    beq    LF97E                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDV1                 ; 3
    lda    $84                   ; 3
    ora    #$18                  ; 2
    sta    AUDF1                 ; 3
MF098:
    lda    #8                    ; 2
    sta    AUDC1                 ; 3
    bne    LF9AE                 ; 3   always branch

LF97E:
    lda    $B6                   ; 3
    beq    LF9AC                 ; 2³
    lda    $83                   ; 3
    and    #$07                  ; 2
    bne    LF9AE                 ; 2³
    lda    #$0C                  ; 2
    sta    AUDC1                 ; 3
    dec    $B7                   ; 5
    lda    $B7                   ; 3
    beq    LF9AC                 ; 2³
    bpl    LF9AE                 ; 2³
    dec    $B6                   ; 5
    ldx    $B6                   ; 3
    lda    LFC49,X               ; 4
    bne    LF9A1                 ; 2³
    sta    $B6                   ; 3
    beq    LF9AC                 ; 3   always branch

LF9A1:
    sta    AUDF1                 ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $B7                   ; 3
    lda    #8                    ; 2
LF9AC:
    sta    AUDV1                 ; 3
LF9AE:
    sta    HMCLR                 ; 3
    lda    #$10                  ; 2
    sta    HMM0                  ; 3
    lda    #$F0                  ; 2
    sta    HMM1                  ; 3
    jmp    LF013                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LF9E6 x 1
;LFA03 x 1

LF9E6 SUBROUTINE
    ldy    #$0F                  ; 2
    lda    #7                    ; 2
    sta    $A4                   ; 3
    lda    $86                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    #$14                  ; 2
    bcs    LF9FE                 ; 2³
    ldy    #7                    ; 2
    cmp    #$0C                  ; 2
    bcc    LF9FE                 ; 2³
    sbc    #4                    ; 2   more than #$0B at this point, subtract 4, still BNE
    tay                          ; 2
LF9FE:
;    sty    $89                   ; 3
;    jmp    LFA09                 ; 3

    TYA
    BNE    MFA07                 ; 3   always branch

LFA03 SUBROUTINE
    lda    #6                    ; 2
;    sta    $89                   ; 3
;    sta    $A4                   ; 3

    STA    $A4
MFA07:
    STA    $89

LFA09:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #1                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    ldx    #$0A                  ; 2
LFA13:
    dex                          ; 2
    bpl    LFA13                 ; 2³
    lda    CXM0P                 ; 3   waste time
LFA18:
    ldy    $89                   ; 3
    lda    ($F7),Y               ; 5
    sta    $0188                 ; 4
    lda    ($F5),Y               ; 5
    tax                          ; 2
    lda    ($ED),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($EF),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($F1),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F3),Y               ; 5
    ldy    $88                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    $89                   ; 5
    dec    $A4                   ; 5
    bpl    LFA18                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFA4F x 2

LFA4F SUBROUTINE
    cmp    $C3                   ; 3
    beq    LFA82                 ; 2³
    clc                          ; 2
    ror                          ; 2
    tax                          ; 2
    lda    $8B,X                 ; 4
    bcc    LFA5E                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
LFA5E:
    and    #$0F                  ; 2
    sec                          ; 2
    sbc    #5                    ; 2
    sta    $88                   ; 3
    tya                          ; 2
;    clc                          ; 2
;    ror                          ; 2

    LSR                          ; 2   same effect

    tax                          ; 2
    lda    $8B,X                 ; 4
    bcc    LFA7C                 ; 2³
    and    #$0F                  ; 2
    asl    $88                   ; 5
    asl    $88                   ; 5
    asl    $88                   ; 5
    asl    $88                   ; 5
;    ora    $88                   ; 3
;    jmp    LFA80                 ; 3
;
;LFA7C:
;    and    #$F0                  ; 2
;    ora    $88                   ; 3
;LFA80:
;    sta    $8B,X                 ; 4
;LFA82:
;    rts                          ; 6


    JMP    MFA7E                 ; 6
LFA7C:
    AND    #$F0                  ; 2
MFA7E:
    ORA    $88                   ; 3
    STA    $8B,X                 ; 4
LFA82:
    RTS                          ; 6


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFA83 x 2


LFA83 SUBROUTINE
    ldy    #0                    ; 2
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
LFA89:
    sty    0,X                   ; 4
    inx                          ; 2
    cpx    #$B8                  ; 2
    bne    LFA89                 ; 2³
    ldx    #$28                  ; 2
LFA92:
    lda    LFCE2,X               ; 4
    sta    $B8,X                 ; 4
    dex                          ; 2
    bpl    LFA92                 ; 2³
    ldy    $80                   ; 3
    lda    LFC3C,Y               ; 4
    sta    $FA                   ; 3
    lda    LFCAA,Y               ; 4
    sta    $FB                   ; 3
    ldx    #$11                  ; 2
LFAA8:
    lda    LFD14,X               ; 4
    sta    $8B,X                 ; 4
    dex                          ; 2
    lda    LFD14,X               ; 4
    ora    $80                   ; 3
    sta    $8B,X                 ; 4
    dex                          ; 2
    bpl    LFAA8                 ; 2³
;    lda    SWCHB                 ; 4
;    lsr                          ; 2
;    and    #$64                  ; 2

    BIT   INPT1
    BPL   .pressed2
    CLI
    BMI   .return2               ; always branch

.pressed2:
    PHP
    SEI
    PLA
    AND   #$04                   ; was interrupt set last frame?
    BNE   .return2               ; branch if interrupt was set last frame
    LDA   $F9                    ; this happens only once per firebutton press
    EOR   #$04                   ; flip map screen switch
    STA   $F9
.return2:
    LDA    SWCHB
    LSR
    AND    #$60
    BIT    INPT1
    BMI    .notPressed2
    ORA    #$04
.notPressed2:

    ldy    $86                   ; 3
    beq    LFAC4                 ; 2³
    ora    #$80                  ; 2
LFAC4:
    sta    $F9                   ; 3
    rts                          ; 6


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFAC7 x 4

LFAC7 SUBROUTINE
    lda    $84                   ; 3
    bne    LFACD                 ; 2³
    lda    #$FF                  ; 2
LFACD:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    eor    $84                   ; 3
    asl                          ; 2
    rol    $84                   ; 5
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFAD6 x 1
;LFADC x 6

LFAD6 SUBROUTINE
    clc                          ; 2
    adc    #$F0                  ; 2
    jmp    LFAE3                 ; 3

LFADC SUBROUTINE
    ldy    #0                    ; 2
    clc                          ; 2
    adc    #$25                  ; 2
    sty    $89                   ; 3
LFAE3:
    tay                          ; 2
    and    #$0F                  ; 2
    sta    $88                   ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc    $88                   ; 3
    cmp    #$0F                  ; 2
    bcc    LFAF8                 ; 2³
    sbc    #$0F                  ; 2
    iny                          ; 2
LFAF8:
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    bit    $89                   ; 3
    bpl    LFB03                 ; 2³
    rts                          ; 6

LFB03:
    sta    HMP0,X                ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
LFB07:
    dey                          ; 2
    bpl    LFB07                 ; 2³
    sta    RESP0,X               ; 4
    rts                          ; 6


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFB0D x 2

LFB0D SUBROUTINE
;    nop                          ; 2
;added a byte
    NOP    $EA                   ; 3

    lda    #$A0                  ; 2
    sta    HMP0                  ; 3
    lda    #$B0                  ; 2
    sta    HMP1                  ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jsr    LFB75                 ; 6
    ldy    #$D4                  ; 2
    cmp    #5                    ; 2
    beq    LFB2F                 ; 2³
    ldy    #$84                  ; 2
    cmp    #9                    ; 2
    beq    LFB2F                 ; 2³
    ldy    #$44                  ; 2
LFB2F:
    tya                          ; 2
    eor    $81                   ; 3
    and    $82                   ; 3
    tax                          ; 2
    ldy    #$80                  ; 2
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    $83                   ; 3
    and    #$1F                  ; 2
    cmp    #$0F                  ; 2
    bcs    LFB4D                 ; 2³
    lda    $BB                   ; 3
    cmp    #$10                  ; 2
    bcs    LFB4D                 ; 2³
    ldy    #$26                  ; 2
LFB4D:
    tya                          ; 2
    eor    $81                   ; 3
    and    $82                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    COLUBK                ; 3
    sta    COLUPF                ; 3
    ldx    #1                    ; 2
    stx    CTRLPF                ; 3
    dex                          ; 2   X=0
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    dex                          ; 2   X=$FF
    stx    PF2                   ; 3
;    lda    #3                    ; 2
;    sta    NUSIZ0                ; 3
;    sta    NUSIZ1                ; 3
;    ldx    #$0A                  ; 2
;    lda    #$FF                  ; 2

    TXA                          ; 2   A=$FF
    LDX   #3                     ; 2
    STX   NUSIZ0                 ; 3
    STX   NUSIZ1                 ; 3
    LDX   #$0A                   ; 2

LFB6E:
    sta    $EE,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LFB6E                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFB75 x 6
;LFB77 x 7

LFB75 SUBROUTINE
    lda    $C3                   ; 3
LFB77 SUBROUTINE
    clc                          ; 2
    ror                          ; 2
    tax                          ; 2
    lda    $8B,X                 ; 4
    bcc    LFB82                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
LFB82:
    and    #$0F                  ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFB85 x 2
;LFB87 x 4

LFB85 SUBROUTINE
    lda    $C3                   ; 3
LFB87 SUBROUTINE
    sty    $88                   ; 3
    clc                          ; 2
    ror                          ; 2
    tax                          ; 2
    lda    $8B,X                 ; 4
;    bcc    LFB9F                 ; 2³
;    and    #$0F                  ; 2
;    asl    $88                   ; 5
;    asl    $88                   ; 5
;    asl    $88                   ; 5
;    asl    $88                   ; 5
;    ora    $88                   ; 3
;    jmp    LFBA3                 ; 3
;
;LFB9F:
;    and    #$F0                  ; 2
;    ora    $88                   ; 3
;LFBA3:
;    sta    $8B,X                 ; 4
;    rts                          ; 6

    BCC    LFB9F                 ; 2³
    AND    #$0F                  ; 2
    ASL    $88                   ; 5
    ASL    $88                   ; 5
    ASL    $88                   ; 5
    ASL    $88                   ; 5
MFB90:
    ORA    $88                   ; 3
    STA    $8B,X                 ; 4
    RTS                          ; 6

LFB9F:
    AND    #$F0                  ; 2
    BCC    MFB90                 ; 3   always branch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFBA6 x 1
;LFBBA x 2
;LFBCB x 2

LFBA6 SUBROUTINE
    ldy    #4                    ; 2
LFBA8:
    jsr    LFAC7                 ; 6
    lda    $84                   ; 3
    and    #$07                  ; 2
    tax                          ; 2
    lda    LFD30,X               ; 4
    sta.wy $A1,Y                 ; 5
    dey                          ; 2
    bpl    LFBA8                 ; 2³
Waste12Cycles SUBROUTINE
    rts                          ; 6

LFBBA SUBROUTINE
    sta    $88                   ; 3
    sed                          ; 2
    sec                          ; 2
    lda    $BC                   ; 3
    sbc    $88                   ; 3
    sta    $BC                   ; 3
    lda    $BB                   ; 3
    sbc    #0                    ; 2
    jmp    LFBD4                 ; 3

;moved...
LFBE1:
    sta    $BB                   ; 3
    cld                          ; 2
    rts                          ; 6

LFBCB SUBROUTINE
    sta    $88                   ; 3
    lda    $BB                   ; 3
    sec                          ; 2
    sed                          ; 2
    sbc    $88                   ; 3
    cld                          ; 2
LFBD4:
    bcs    LFBE1                 ; 2³   return from subroutine
    lda    #0                    ; 2
    sta    $BC                   ; 3
    sta    $BB                   ; 3
    pla                          ; 4
    pla                          ; 4    don't return from subroutine
;    jmp    LFBE5                 ; 3

LFBE5:
    ldy    #$0C                  ; 2
    sed                          ; 2
    sec                          ; 2
    ldx    $80                   ; 3
    lda    LFC3C,X               ; 4
    sbc    $FA                   ; 3
    cmp    LFC3C,X               ; 4
    bne    LFBFB                 ; 2³
    ldy    #$12                  ; 2
    clc                          ; 2
    adc    LFCB2,X               ; 4
LFBFB:
    sty    $B6                   ; 3
    clc                          ; 2
;    adc    $C9                   ; 3
;    adc    $C9                   ; 3
;    adc    $C9                   ; 3
;    adc    $C9                   ; 3
;    adc    $C9                   ; 3
;    sec                          ; 2
;    sbc    #$10                  ; 2
;    sec                          ; 2
;    sbc    $9F                   ; 3
;    bcs    LFC12                 ; 2³
;    lda    #0                    ; 2
;LFC12:
;    sta    $C1                   ; 3
;    lda    #0                    ; 2
;    sec                          ; 2
;    sbc    $BE                   ; 3
;    sta    $C2                   ; 3
;    dec    $86                   ; 5
;    lda    $C1                   ; 3
;    sbc    $BD                   ; 3
;    bcs    LFC25                 ; 2³
;    lda    #0                    ; 2
;LFC25:
;    sta    $C1                   ; 3
;    lda    #0                    ; 2
;    sta    $9D                   ; 3
;    sta    $AC                   ; 3
;    sta    $AD                   ; 3
;    sta    $AE                   ; 3
;    sta    $AF                   ; 3
;    sta    $AA                   ; 3
;    cld                          ; 2
;    jmp    LF8E1                 ; 3

    LDX    #5                    ; 2
.loopC9:
    ADC    $C9                   ; 3
    DEX                          ; 2
    BNE    .loopC9               ; 2³
    SEC                          ; 2   X=0
    SBC    #$10                  ; 2
    SEC                          ; 2
    SBC    $9F                   ; 3
    BCS    LFC12                 ; 2³
    TXA                          ; 2   A=0
LFC12:
    STA    $C1                   ; 3
    TXA                          ; 2   A=0
    SEC                          ; 2
    SBC    $BE                   ; 3
    STA    $C2                   ; 3
    DEC    $86                   ; 5
    LDA    $C1                   ; 3
    SBC    $BD                   ; 3
    BCS    LFC25                 ; 2³
    TXA                          ; 2   A=0
LFC25:
    STA    $C1                   ; 3
    STX    $9D                   ; 3   X=0
    STX    $AC                   ; 3
    STX    $AD                   ; 3
    STX    $AE                   ; 3
    STX    $AF                   ; 3
    STX    $AA                   ; 3
    CLD                          ; 2
    JMP    MF8E3 ; LF8E1         ; 3   save 2 cycles, X=0 already


;initially my code was longer, and now
;I have more bytes freed then needed.
    NOP ; free byte
    NOP ; free byte  2
    NOP ; free byte
    NOP ; free byte  4
    NOP ; free byte
    NOP ; free byte  6
    NOP ; free byte
    NOP ; free byte  8
    NOP ; free byte
    NOP ; free byte  10
    NOP ; free byte
    NOP ; free byte  12



       ORG $FC47


LFC3C:
    .byte $09 ; |    X  X| $FC3C
    .byte $17 ; |   X XXX| $FC3D
    .byte $23 ; |  X   XX| $FC3E
    .byte $31 ; |  XX   X| $FC3F
LFC40:
    .byte $00 ; |        | $FC40
    .byte $05 ; |     X X| $FC41
    .byte $0A ; |    X X | $FC42
    .byte $0F ; |    XXXX| $FC43
    .byte $00 ; |        | $FC44
    .byte $00 ; |        | $FC45
    .byte $05 ; |     X X| $FC46
    .byte $0A ; |    X X | $FC47
    .byte $0F ; |    XXXX| $FC48

LFC67:
    .byte $0A ; |    X X | $FC67
    .byte $19 ; |   XX  X| $FC68
    .byte $01 ; |       X| $FC69
    .byte $1D ; |   XXX X| $FC6A
LFC6B:
    .byte $03 ; |      XX| $FC6B
    .byte $04 ; |     X  | $FC6C
    .byte $05 ; |     X X| $FC6D
    .byte $09 ; |    X  X| $FC6E
    .byte $0B ; |    X XX| $FC6F
    .byte $0F ; |    XXXX| $FC70
    .byte $10 ; |   X    | $FC71
    .byte $11 ; |   X   X| $FC72
    .byte $12 ; |   X  X | $FC73
    .byte $19 ; |   XX  X| $FC74
    .byte $14 ; |   X X  | $FC75
    .byte $18 ; |   XX   | $FC76
    .byte $1A ; |   XX X | $FC77
    .byte $1E ; |   XXXX | $FC78
    .byte $1F ; |   XXXXX| $FC79
    .byte $20 ; |  X     | $FC7A
    .byte $01 ; |       X| $FC7B
    .byte $01 ; |       X| $FC7C
    .byte $01 ; |       X| $FC7D
    .byte $00 ; |        | $FC7E
    .byte $02 ; |      X | $FC7F
    .byte $06 ; |     XX | $FC80
    .byte $07 ; |     XXX| $FC81
    .byte $08 ; |    X   | $FC82
    .byte $16 ; |   X XX | $FC83
    .byte $17 ; |   X XXX| $FC84
    .byte $1D ; |   XXX X| $FC85
    .byte $1D ; |   XXX X| $FC86
    .byte $1C ; |   XXX  | $FC87
    .byte $22 ; |  X   X | $FC88
    .byte $23 ; |  X   XX| $FC89
    .byte $1D ; |   XXX X| $FC8A

LFC39:
    .byte $0A ; |    X X | $FC39
    .byte $05 ; |     X X| $FC3A
;    .byte $02 ; |      X | $FC3B

LFC8B:
    .byte $02 ; |      X | $FC8B   shared
    .byte $04 ; |     X  | $FC8C
    .byte $00 ; |        | $FC8D
    .byte $02 ; |      X | $FC8E
    .byte $02 ; |      X | $FC8F
    .byte $04 ; |     X  | $FC90
    .byte $00 ; |        | $FC91
    .byte $02 ; |      X | $FC92
    .byte $02 ; |      X | $FC93
    .byte $04 ; |     X  | $FC94
LFC95:
    .byte $00 ; |        | $FC95
    .byte $06 ; |     XX | $FC96
    .byte $0C ; |    XX  | $FC97
    .byte $12 ; |   X  X | $FC98
    .byte $18 ; |   XX   | $FC99
    .byte $1E ; |   XXXX | $FC9A
LFC9B:
    .byte $05 ; |     X X| $FC9B
    .byte $0B ; |    X XX| $FC9C
    .byte $11 ; |   X   X| $FC9D
    .byte $17 ; |   X XXX| $FC9E
    .byte $1D ; |   XXX X| $FC9F
    .byte $23 ; |  X   XX| $FCA0
LFCA1:
    .byte $0F ; |    XXXX| $FCA1
    .byte $00 ; |        | $FCA2
    .byte $84 ; |X    X  | $FCA3
    .byte $44 ; | X   X  | $FCA4
    .byte $28 ; |  X X   | $FCA5
LFCA6:
    .byte <Letter_D      ; $FCA6
    .byte <Letter_E      ; $FCA7
    .byte <Letter_S      ; $FCA8
    .byte <Letter_W      ; $FCA9
LFCAA:
    .byte <Letter_E      ; $FCAA
    .byte <Letter_L      ; $FCAB
    .byte <Letter_W      ; $FCAC
    .byte <Letter_S      ; $FCAD
LFCAE:
    .byte $FE ; |XXXXXXX | $FCAE
    .byte $FD ; |XXXXXX X| $FCAF
    .byte $FC ; |XXXXXX  | $FCB0
    .byte $FB ; |XXXXX XX| $FCB1
LFCB2:
    .byte $11 ; |   X   X| $FCB2
    .byte $23 ; |  X   XX| $FCB3
    .byte $37 ; |  XX XXX| $FCB4
    .byte $49 ; | X  X  X| $FCB5
LFCB6:
    .byte $FB ; |XXXXX XX| $FCB6
    .byte $FC ; |XXXXXX  | $FCB7
    .byte $FD ; |XXXXXX X| $FCB8
    .byte $FE ; |XXXXXXX | $FCB9
    .byte $FF ; |XXXXXXXX| $FCBA
    .byte $01 ; |       X| $FCBB
    .byte $02 ; |      X | $FCBC
    .byte $03 ; |      XX| $FCBD
    .byte $04 ; |     X  | $FCBE
    .byte $05 ; |     X X| $FCBF
LFCC0:
    .byte $0A ; |    X X | $FCC0
    .byte $86 ; |X    XX | $FCC1
    .byte $0B ; |    X XX| $FCC2
    .byte $9E ; |X  XXXX | $FCC3
    .byte $04 ; |     X  | $FCC4
    .byte $B0 ; |X XX    | $FCC5

LFCCC:
    .byte $4A ; | X  X X | $FCCC
    .byte $54 ; | X X X  | $FCCD
    .byte $5E ; | X XXXX | $FCCE
    .byte <LFFE2-1       ; $FCCF
    .byte <LFFF0-1       ; $FCD0

    .byte $4F ; | X  XXXX| $FCD1
    .byte $59 ; | X XX  X| $FCD2
    .byte $63 ; | XX   XX| $FCD3
    .byte <LFFE9-1       ; $FCD4
    .byte <LFFF6-1       ; $FCD5
LFCD6:
    .byte $A0 ; |X X     | $FCD6
    .byte $FD ; |XXXXXX X| $FCD7
    .byte $B0 ; |X XX    | $FCD8
    .byte $FD ; |XXXXXX X| $FCD9
    .byte $C0 ; |XX      | $FCDA
    .byte $FD ; |XXXXXX X| $FCDB
    .byte $D0 ; |XX X    | $FCDC
    .byte $FD ; |XXXXXX X| $FCDD
    .byte $E0 ; |XXX     | $FCDE
    .byte $FD ; |XXXXXX X| $FCDF
    .byte $F0 ; |XXXX    | $FCE0
    .byte $FD ; |XXXXXX X| $FCE1
LFCE2:
    .byte $20 ; |  X     | $FCE2
    .byte NO_DAMAGE      ; $FCE3
    .byte NO_DAMAGE      ; $FCE4
    .byte $99 ; |X  XX  X| $FCE5
    .byte $99 ; |X  XX  X| $FCE6
    .byte $00 ; |        | $FCE7
    .byte $00 ; |        | $FCE8
    .byte $00 ; |        | $FCE9
    .byte $00 ; |        | $FCEA
    .byte $AA ; |X X X X | $FCEB
    .byte $AA ; |X X X X | $FCEC
    .byte $0B ; |    X XX| $FCED
    .byte $0B ; |    X XX| $FCEE
    .byte $FF ; |XXXXXXXX| $FCEF
    .byte $FF ; |XXXXXXXX| $FCF0
    .byte $FF ; |XXXXXXXX| $FCF1
    .byte $FF ; |XXXXXXXX| $FCF2
    .byte $06 ; |     XX | $FCF3
    .byte $0B ; |    X XX| $FCF4
    .byte $19 ; |   XX  X| $FCF5
    .byte $37 ; |  XX XXX| $FCF6
    .byte $47 ; | X   XXX| $FCF7
    .byte $55 ; | X X X X| $FCF8
    .byte $65 ; | XX  X X| $FCF9
    .byte $73 ; | XXX  XX| $FCFA
    .byte $83 ; |X     XX| $FCFB
    .byte $14 ; |   X X  | $FCFC
    .byte $82 ; |X     X | $FCFD
    .byte $32 ; |  XX  X | $FCFE
    .byte $6E ; | XX XXX | $FCFF
    .byte $4B ; | X  X XX| $FD00
    .byte $78 ; | XXXX   | $FD01
    .byte $41 ; | X     X| $FD02
    .byte $1E ; |   XXXX | $FD03
    .byte $00 ; |        | $FD04
    .byte $03 ; |      XX| $FD05
    .byte $07 ; |     XXX| $FD06
    .byte $04 ; |     X  | $FD07
    .byte $24 ; |  X  X  | $FD08
LFD09:
    .byte $00 ; |        | $FD09
    .byte $06 ; |     XX | $FD0A
    .byte $FA ; |XXXXX X | $FD0B
    .byte $00 ; |        | $FD0C
    .byte $FF ; |XXXXXXXX| $FD0D
    .byte $05 ; |     X X| $FD0E
    .byte $F9 ; |XXXXX  X| $FD0F
    .byte $00 ; |        | $FD10
    .byte $01 ; |       X| $FD11
    .byte $07 ; |     XXX| $FD12
    .byte $FB ; |XXXXX XX| $FD13
LFD14:
    .byte $42 ; | X    X | $FD14
    .byte $00 ; |        | $FD15
    .byte $00 ; |        | $FD16
    .byte $00 ; |        | $FD17
    .byte $01 ; |       X| $FD18
    .byte $54 ; | X X X  | $FD19
    .byte $00 ; |        | $FD1A
    .byte $00 ; |        | $FD1B
    .byte $00 ; |        | $FD1C
    .byte $00 ; |        | $FD1D
    .byte $10 ; |   X    | $FD1E
    .byte $00 ; |        | $FD1F
    .byte $40 ; | X      | $FD20
    .byte $00 ; |        | $FD21
    .byte $40 ; | X      | $FD22
    .byte $00 ; |        | $FD23
    .byte $32 ; |  XX  X | $FD24
LFD25:
    .byte $00 ; |        | $FD25   shared
    .byte $01 ; |       X| $FD26
    .byte $FF ; |XXXXXXXX| $FD27
    .byte $00 ; |        | $FD28
    .byte $00 ; |        | $FD29
    .byte $01 ; |       X| $FD2A
    .byte $FF ; |XXXXXXXX| $FD2B
    .byte $00 ; |        | $FD2C
    .byte $00 ; |        | $FD2D
;    .byte $01 ; |       X| $FD2E
;    .byte $FF ; |XXXXXXXX| $FD2F

;moved, save 3 bytes

LFCC6:
    .byte $01 ; |       X| $FCC6   shared
    .byte $FF ; |XXXXXXXX| $FCC7   shared
    .byte $01 ; |       X| $FCC8
    .byte $FF ; |XXXXXXXX| $FCC9
    .byte $01 ; |       X| $FCCA
;    .byte $FF ; |XXXXXXXX| $FCCB


LFD30:
    .byte $FF ; |XXXXXXXX| $FD30   shared
    .byte $FF ; |XXXXXXXX| $FD31
    .byte $FF ; |XXXXXXXX| $FD32
    .byte $FF ; |XXXXXXXX| $FD33
    .byte $00 ; |        | $FD34
    .byte $01 ; |       X| $FD35
    .byte $01 ; |       X| $FD36
    .byte $01 ; |       X| $FD37
LFD38:
ShapePtrTab:
    .byte $00 ; |        | $FD38
    .byte $11 ; |   X   X| $FD39
    .byte $20 ; |  X     | $FD3A
    .byte $2D ; |  X XX X| $FD3B
    .byte $38 ; |  XXX   | $FD3C
    .byte $4A ; | X  X X | $FD3D
    .byte $41 ; | X     X| $FD3E
    .byte $41 ; | X     X| $FD3F
    .byte $41 ; | X     X| $FD40
    .byte $41 ; | X     X| $FD41
    .byte $41 ; | X     X| $FD42
    .byte $42 ; | X    X | $FD43
BasePtrTab:
    .byte $03 ; |      XX| $FD44
    .byte $1B ; |   XX XX| $FD45
    .byte $30 ; |  XX    | $FD46
    .byte $3D ; |  XXXX X| $FD47
    .byte $48 ; | X  X   | $FD48
    .byte $5B ; | X XX XX| $FD49
    .byte $4A ; | X  X X | $FD4A
    .byte $41 ; | X     X| $FD4B
    .byte $41 ; | X     X| $FD4C
    .byte $41 ; | X     X| $FD4D
    .byte $41 ; | X     X| $FD4E
    .byte $41 ; | X     X| $FD4F
MeteorPtrTab:
    .byte $89 ; |X   X  X| $FD50
    .byte $A7 ; |X X  XXX| $FD51
    .byte $C1 ; |XX     X| $FD52
    .byte $D7 ; |XX X XXX| $FD53
    .byte $7A ; | XXXX X | $FD54
    .byte $6E ; | XX XXX | $FD55
    .byte $64 ; | XX  X  | $FD56
    .byte $5B ; | X XX XX| $FD57
    .byte $52 ; | X X  X | $FD58
    .byte $4A ; | X  X X | $FD59
    .byte $41 ; | X     X| $FD5A
    .byte $42 ; | X    X | $FD5B


;from Thomas's disassembly
OFS_BASE   = BasePtrTab   - ShapePtrTab
OFS_METEOR = MeteorPtrTab - ShapePtrTab


LFD5C:
    .byte $0B ; |    X XX| $FD5C
    .byte $09 ; |    X  X| $FD5D
    .byte $07 ; |     XXX| $FD5E
    .byte $05 ; |     X X| $FD5F
    .byte $03 ; |      XX| $FD60
    .byte $02 ; |      X | $FD61
    .byte $01 ; |       X| $FD62
    .byte $01 ; |       X| $FD63
    .byte $01 ; |       X| $FD64
    .byte $01 ; |       X| $FD65
    .byte $01 ; |       X| $FD66
    .byte $01 ; |       X| $FD67
    .byte $0B ; |    X XX| $FD68
    .byte $09 ; |    X  X| $FD69
    .byte $07 ; |     XXX| $FD6A
    .byte $05 ; |     X X| $FD6B
    .byte $03 ; |      XX| $FD6C
    .byte $03 ; |      XX| $FD6D
    .byte $02 ; |      X | $FD6E
    .byte $01 ; |       X| $FD6F
    .byte $01 ; |       X| $FD70
    .byte $01 ; |       X| $FD71
    .byte $01 ; |       X| $FD72
    .byte $01 ; |       X| $FD73
    .byte $18 ; |   XX   | $FD74
    .byte $14 ; |   X X  | $FD75
    .byte $10 ; |   X    | $FD76
    .byte $0C ; |    XX  | $FD77
    .byte $08 ; |    X   | $FD78
    .byte $06 ; |     XX | $FD79
    .byte $04 ; |     X  | $FD7A
    .byte $03 ; |      XX| $FD7B
    .byte $03 ; |      XX| $FD7C
    .byte $02 ; |      X | $FD7D
    .byte $01 ; |       X| $FD7E
    .byte $01 ; |       X| $FD7F
LFD80:
    .byte $FA ; |XXXXX X | $FD80
    .byte $FA ; |XXXXX X | $FD81
    .byte $FA ; |XXXXX X | $FD82
    .byte $FA ; |XXXXX X | $FD83
    .byte $FA ; |XXXXX X | $FD84
    .byte $FC ; |XXXXXX  | $FD85
    .byte $FC ; |XXXXXX  | $FD86
    .byte $FC ; |XXXXXX  | $FD87
    .byte $FE ; |XXXXXXX | $FD88
    .byte $FE ; |XXXXXXX | $FD89
    .byte $FE ; |XXXXXXX | $FD8A
    .byte $02 ; |      X | $FD8B
    .byte $02 ; |      X | $FD8C
    .byte $02 ; |      X | $FD8D
    .byte $04 ; |     X  | $FD8E
    .byte $04 ; |     X  | $FD8F
    .byte $04 ; |     X  | $FD90
    .byte $06 ; |     XX | $FD91
    .byte $06 ; |     XX | $FD92
    .byte $06 ; |     XX | $FD93
    .byte $08 ; |    X   | $FD94
    .byte $08 ; |    X   | $FD95
    .byte $08 ; |    X   | $FD96
LFD97:
    .byte OFS_S          ; $FD97
    .byte OFS_L<<4       ; $FD98
    .byte OFS_R          ; $FD99
    .byte OFS_W<<4       ; $FD9A
LFD9B:
    .byte $F0 ; |XXXX    | $FD9B
    .byte $0F ; |    XXXX| $FD9C
    .byte $F0 ; |XXXX    | $FD9D
    .byte $0F ; |    XXXX| $FD9E
    .byte $F0 ; |XXXX    | $FD9F


;moved save 10 bytes

LFC49:
    .byte $00 ; |        | $FC49
    .byte $FE ; |XXXXXXX | $FC4A
    .byte $3F ; |  XXXXXX| $FC4B
    .byte $7E ; | XXXXXX | $FC4C
    .byte $3E ; |  XXXXX | $FC4D
    .byte $7A ; | XXXX X | $FC4E
    .byte $3A ; |  XXX X | $FC4F
    .byte $79 ; | XXXX  X| $FC50
    .byte $FE ; |XXXXXXX | $FC51
    .byte $3E ; |  XXXXX | $FC52
    .byte $7E ; | XXXXXX | $FC53
    .byte $FE ; |XXXXXXX | $FC54
    .byte $00 ; |        | $FC55
    .byte $EC ; |XXX XX  | $FC56
    .byte $2B ; |  X X XX| $FC57
    .byte $EE ; |XXX XXX | $FC58
    .byte $73 ; | XXX  XX| $FC59
    .byte $FD ; |XXXXXX X| $FC5A
    .byte $00 ; |        | $FC5B
    .byte $00 ; |        | $FC5C
;    .byte $00 ; |        | $FC5D
;    .byte $00 ; |        | $FC5E
;    .byte $00 ; |        | $FC5F
;    .byte $00 ; |        | $FC60
;    .byte $00 ; |        | $FC61
;    .byte $00 ; |        | $FC62
;    .byte $00 ; |        | $FC63
;    .byte $00 ; |        | $FC64
;    .byte $00 ; |        | $FC65
;    .byte $00 ; |        | $FC66


    ORG $FDA0


    .byte $00 ; |        | $FDA0   shared
    .byte $00 ; |        | $FDA1   shared
    .byte $00 ; |        | $FDA2   shared
    .byte $00 ; |        | $FDA3   shared
    .byte $00 ; |        | $FDA4   shared
    .byte $00 ; |        | $FDA5   shared
    .byte $00 ; |        | $FDA6   shared
    .byte $00 ; |        | $FDA7   shared
    .byte $00 ; |        | $FDA8   shared
    .byte $00 ; |        | $FDA9   shared
    .byte $F7 ; |XXXX XXX| $FDAA
    .byte $95 ; |X  X X X| $FDAB
    .byte $87 ; |X    XXX| $FDAC
    .byte $80 ; |X       | $FDAD
    .byte $90 ; |X  X    | $FDAE
    .byte $F0 ; |XXXX    | $FDAF
    .byte $AD ; |X X XX X| $FDB0
    .byte $A9 ; |X X X  X| $FDB1
    .byte $E9 ; |XXX X  X| $FDB2
    .byte $A9 ; |X X X  X| $FDB3
    .byte $ED ; |XXX XX X| $FDB4
    .byte $41 ; | X     X| $FDB5
    .byte $0F ; |    XXXX| $FDB6
    .byte $00 ; |        | $FDB7
    .byte $47 ; | X   XXX| $FDB8
    .byte $41 ; | X     X| $FDB9
    .byte $77 ; | XXX XXX| $FDBA
    .byte $55 ; | X X X X| $FDBB
    .byte $75 ; | XXX X X| $FDBC
    .byte $00 ; |        | $FDBD
    .byte $00 ; |        | $FDBE
    .byte $00 ; |        | $FDBF
    .byte $50 ; | X X    | $FDC0
    .byte $58 ; | X XX   | $FDC1
    .byte $5C ; | X XXX  | $FDC2
    .byte $56 ; | X X XX | $FDC3
    .byte $53 ; | X X  XX| $FDC4
    .byte $11 ; |   X   X| $FDC5
    .byte $F0 ; |XXXX    | $FDC6
    .byte $00 ; |        | $FDC7
    .byte $03 ; |      XX| $FDC8
    .byte $00 ; |        | $FDC9
    .byte $4B ; | X  X XX| $FDCA
    .byte $4A ; | X  X X | $FDCB
    .byte $6B ; | XX X XX| $FDCC
    .byte $00 ; |        | $FDCD
    .byte $08 ; |    X   | $FDCE
    .byte $00 ; |        | $FDCF
    .byte $BA ; |X XXX X | $FDD0
    .byte $8A ; |X   X X | $FDD1
    .byte $BA ; |X XXX X | $FDD2
    .byte $A2 ; |X X   X | $FDD3
    .byte $3A ; |  XXX X | $FDD4
    .byte $80 ; |X       | $FDD5
    .byte $FE ; |XXXXXXX | $FDD6
    .byte $00 ; |        | $FDD7
    .byte $80 ; |X       | $FDD8
    .byte $80 ; |X       | $FDD9
    .byte $AA ; |X X X X | $FDDA
    .byte $AA ; |X X X X | $FDDB
    .byte $BA ; |X XXX X | $FDDC
    .byte $22 ; |  X   X | $FDDD
    .byte $27 ; |  X  XXX| $FDDE
    .byte $02 ; |      X | $FDDF
    .byte $E9 ; |XXX X  X| $FDE0
    .byte $AB ; |X X X XX| $FDE1
    .byte $AF ; |X X XXXX| $FDE2
    .byte $AD ; |X X XX X| $FDE3
    .byte $E9 ; |XXX X  X| $FDE4
    .byte $00 ; |        | $FDE5
    .byte $00 ; |        | $FDE6
    .byte $00 ; |        | $FDE7
    .byte $00 ; |        | $FDE8
    .byte $00 ; |        | $FDE9
    .byte $11 ; |   X   X| $FDEA
    .byte $11 ; |   X   X| $FDEB
    .byte $17 ; |   X XXX| $FDEC
    .byte $15 ; |   X X X| $FDED
    .byte $17 ; |   X XXX| $FDEE
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
    .byte $77 ; | XXX XXX| $FDFA
    .byte $54 ; | X X X  | $FDFB
    .byte $77 ; | XXX XXX| $FDFC
    .byte $51 ; | X X   X| $FDFD
    .byte $77 ; | XXX XXX| $FDFE
    .byte $00 ; |        | $FDFF
    .byte $03 ; |      XX| $FE00
    .byte $07 ; |     XXX| $FE01
    .byte $07 ; |     XXX| $FE02
    .byte $0F ; |    XXXX| $FE03
    .byte $0D ; |    XX X| $FE04
    .byte $D8 ; |XX XX   | $FE05
    .byte $F0 ; |XXXX    | $FE06
    .byte $E0 ; |XXX     | $FE07
    .byte $E0 ; |XXX     | $FE08
    .byte $60 ; | XX     | $FE09
    .byte $20 ; |  X     | $FE0A
    .byte $00 ; |        | $FE0B
    .byte $00 ; |        | $FE0C
    .byte $00 ; |        | $FE0D
    .byte $00 ; |        | $FE0E
    .byte $00 ; |        | $FE0F
    .byte $00 ; |        | $FE10
    .byte $01 ; |       X| $FE11
    .byte $03 ; |      XX| $FE12
    .byte $07 ; |     XXX| $FE13
    .byte $07 ; |     XXX| $FE14
    .byte $6D ; | XX XX X| $FE15
    .byte $78 ; | XXXX   | $FE16
    .byte $70 ; | XXX    | $FE17
    .byte $30 ; |  XX    | $FE18
    .byte $10 ; |   X    | $FE19
    .byte $00 ; |        | $FE1A
    .byte $00 ; |        | $FE1B
    .byte $00 ; |        | $FE1C
    .byte $00 ; |        | $FE1D
    .byte $00 ; |        | $FE1E
    .byte $00 ; |        | $FE1F
    .byte $01 ; |       X| $FE20
    .byte $03 ; |      XX| $FE21
    .byte $07 ; |     XXX| $FE22
    .byte $35 ; |  XX X X| $FE23
    .byte $38 ; |  XXX   | $FE24
    .byte $18 ; |   XX   | $FE25
    .byte $08 ; |    X   | $FE26
    .byte $00 ; |        | $FE27
    .byte $00 ; |        | $FE28
    .byte $00 ; |        | $FE29
    .byte $00 ; |        | $FE2A
    .byte $00 ; |        | $FE2B
    .byte $00 ; |        | $FE2C
    .byte $01 ; |       X| $FE2D
    .byte $03 ; |      XX| $FE2E
    .byte $0D ; |    XX X| $FE2F
    .byte $0C ; |    XX  | $FE30
    .byte $04 ; |     X  | $FE31
    .byte $00 ; |        | $FE32
    .byte $00 ; |        | $FE33
    .byte $00 ; |        | $FE34
    .byte $00 ; |        | $FE35
    .byte $00 ; |        | $FE36
    .byte $00 ; |        | $FE37
    .byte $01 ; |       X| $FE38
    .byte $05 ; |     X X| $FE39
    .byte $02 ; |      X | $FE3A
    .byte $00 ; |        | $FE3B
    .byte $00 ; |        | $FE3C
    .byte $00 ; |        | $FE3D
    .byte $00 ; |        | $FE3E
    .byte $00 ; |        | $FE3F
    .byte $00 ; |        | $FE40
    .byte $01 ; |       X| $FE41
    .byte $00 ; |        | $FE42
    .byte $00 ; |        | $FE43
    .byte $00 ; |        | $FE44
    .byte $00 ; |        | $FE45
    .byte $00 ; |        | $FE46
    .byte $00 ; |        | $FE47
    .byte $00 ; |        | $FE48
    .byte $00 ; |        | $FE49
    .byte $01 ; |       X| $FE4A
    .byte $01 ; |       X| $FE4B
    .byte $00 ; |        | $FE4C
    .byte $00 ; |        | $FE4D
    .byte $00 ; |        | $FE4E
    .byte $00 ; |        | $FE4F
    .byte $00 ; |        | $FE50
    .byte $00 ; |        | $FE51
    .byte $01 ; |       X| $FE52
    .byte $01 ; |       X| $FE53
    .byte $01 ; |       X| $FE54
    .byte $00 ; |        | $FE55
    .byte $00 ; |        | $FE56
    .byte $00 ; |        | $FE57
    .byte $00 ; |        | $FE58
    .byte $00 ; |        | $FE59
    .byte $00 ; |        | $FE5A
    .byte $01 ; |       X| $FE5B
    .byte $03 ; |      XX| $FE5C
    .byte $01 ; |       X| $FE5D
    .byte $00 ; |        | $FE5E
    .byte $00 ; |        | $FE5F
    .byte $00 ; |        | $FE60
    .byte $00 ; |        | $FE61
    .byte $00 ; |        | $FE62
    .byte $00 ; |        | $FE63
    .byte $01 ; |       X| $FE64
    .byte $03 ; |      XX| $FE65
    .byte $03 ; |      XX| $FE66
    .byte $01 ; |       X| $FE67
    .byte $00 ; |        | $FE68
    .byte $00 ; |        | $FE69
    .byte $00 ; |        | $FE6A
    .byte $00 ; |        | $FE6B
    .byte $00 ; |        | $FE6C
    .byte $00 ; |        | $FE6D
    .byte $01 ; |       X| $FE6E
    .byte $03 ; |      XX| $FE6F
    .byte $07 ; |     XXX| $FE70
    .byte $07 ; |     XXX| $FE71
    .byte $03 ; |      XX| $FE72
    .byte $01 ; |       X| $FE73
    .byte $00 ; |        | $FE74
    .byte $00 ; |        | $FE75
    .byte $00 ; |        | $FE76
    .byte $00 ; |        | $FE77
    .byte $00 ; |        | $FE78
    .byte $00 ; |        | $FE79
    .byte $01 ; |       X| $FE7A
    .byte $03 ; |      XX| $FE7B
    .byte $07 ; |     XXX| $FE7C
    .byte $0F ; |    XXXX| $FE7D
    .byte $0F ; |    XXXX| $FE7E
    .byte $07 ; |     XXX| $FE7F
    .byte $03 ; |      XX| $FE80
    .byte $01 ; |       X| $FE81
    .byte $00 ; |        | $FE82
    .byte $00 ; |        | $FE83
    .byte $00 ; |        | $FE84
    .byte $00 ; |        | $FE85
    .byte $00 ; |        | $FE86
    .byte $00 ; |        | $FE87
    .byte $00 ; |        | $FE88
    .byte $03 ; |      XX| $FE89
    .byte $0F ; |    XXXX| $FE8A
    .byte $1F ; |   XXXXX| $FE8B
    .byte $3F ; |  XXXXXX| $FE8C
    .byte $3F ; |  XXXXXX| $FE8D
    .byte $3F ; |  XXXXXX| $FE8E
    .byte $7F ; | XXXXXXX| $FE8F
    .byte $7F ; | XXXXXXX| $FE90
    .byte $7F ; | XXXXXXX| $FE91
    .byte $7F ; | XXXXXXX| $FE92
    .byte $FF ; |XXXXXXXX| $FE93
    .byte $FF ; |XXXXXXXX| $FE94
    .byte $FF ; |XXXXXXXX| $FE95
    .byte $FF ; |XXXXXXXX| $FE96
    .byte $7F ; | XXXXXXX| $FE97
    .byte $7F ; | XXXXXXX| $FE98
    .byte $7F ; | XXXXXXX| $FE99
    .byte $7F ; | XXXXXXX| $FE9A
    .byte $3F ; |  XXXXXX| $FE9B
    .byte $3F ; |  XXXXXX| $FE9C
    .byte $3F ; |  XXXXXX| $FE9D
    .byte $1F ; |   XXXXX| $FE9E
    .byte $0F ; |    XXXX| $FE9F
    .byte $03 ; |      XX| $FEA0
    .byte $00 ; |        | $FEA1
    .byte $00 ; |        | $FEA2
    .byte $00 ; |        | $FEA3
    .byte $00 ; |        | $FEA4
    .byte $00 ; |        | $FEA5
    .byte $00 ; |        | $FEA6
    .byte $03 ; |      XX| $FEA7
    .byte $0F ; |    XXXX| $FEA8
    .byte $1F ; |   XXXXX| $FEA9
    .byte $1F ; |   XXXXX| $FEAA
    .byte $1F ; |   XXXXX| $FEAB
    .byte $3F ; |  XXXXXX| $FEAC
    .byte $3F ; |  XXXXXX| $FEAD
    .byte $3F ; |  XXXXXX| $FEAE
    .byte $7F ; | XXXXXXX| $FEAF
    .byte $7F ; | XXXXXXX| $FEB0
    .byte $7F ; | XXXXXXX| $FEB1
    .byte $7F ; | XXXXXXX| $FEB2
    .byte $3F ; |  XXXXXX| $FEB3
    .byte $3F ; |  XXXXXX| $FEB4
    .byte $3F ; |  XXXXXX| $FEB5
    .byte $1F ; |   XXXXX| $FEB6
    .byte $1F ; |   XXXXX| $FEB7
    .byte $1F ; |   XXXXX| $FEB8
    .byte $0F ; |    XXXX| $FEB9
    .byte $03 ; |      XX| $FEBA
    .byte $00 ; |        | $FEBB
    .byte $00 ; |        | $FEBC
    .byte $00 ; |        | $FEBD
    .byte $00 ; |        | $FEBE
    .byte $00 ; |        | $FEBF
    .byte $00 ; |        | $FEC0
    .byte $03 ; |      XX| $FEC1
    .byte $0F ; |    XXXX| $FEC2
    .byte $0F ; |    XXXX| $FEC3
    .byte $0F ; |    XXXX| $FEC4
    .byte $1F ; |   XXXXX| $FEC5
    .byte $1F ; |   XXXXX| $FEC6
    .byte $1F ; |   XXXXX| $FEC7
    .byte $3F ; |  XXXXXX| $FEC8
    .byte $3F ; |  XXXXXX| $FEC9
    .byte $1F ; |   XXXXX| $FECA
    .byte $1F ; |   XXXXX| $FECB
    .byte $1F ; |   XXXXX| $FECC
    .byte $0F ; |    XXXX| $FECD
    .byte $0F ; |    XXXX| $FECE
    .byte $0F ; |    XXXX| $FECF
    .byte $03 ; |      XX| $FED0
    .byte $00 ; |        | $FED1
    .byte $00 ; |        | $FED2
    .byte $00 ; |        | $FED3
    .byte $00 ; |        | $FED4
    .byte $00 ; |        | $FED5
    .byte $00 ; |        | $FED6
    .byte $01 ; |       X| $FED7
    .byte $07 ; |     XXX| $FED8
    .byte $07 ; |     XXX| $FED9
    .byte $0F ; |    XXXX| $FEDA
    .byte $0F ; |    XXXX| $FEDB
    .byte $1F ; |   XXXXX| $FEDC
    .byte $1F ; |   XXXXX| $FEDD
    .byte $0F ; |    XXXX| $FEDE
    .byte $0F ; |    XXXX| $FEDF
    .byte $07 ; |     XXX| $FEE0
    .byte $07 ; |     XXX| $FEE1
    .byte $01 ; |       X| $FEE2
    .byte $00 ; |        | $FEE3
    .byte $00 ; |        | $FEE4
LFEE5:
    .byte $00 ; |        | $FEE5
    .byte $00 ; |        | $FEE6
    .byte $00 ; |        | $FEE7
    .byte $00 ; |        | $FEE8
    .byte $03 ; |      XX| $FEE9
    .byte $03 ; |      XX| $FEEA
    .byte $03 ; |      XX| $FEEB
    .byte $00 ; |        | $FEEC
    .byte $FD ; |XXXXXX X| $FEED
    .byte $FD ; |XXXXXX X| $FEEE
    .byte $FD ; |XXXXXX X| $FEEF
LFEF0:
    .byte <Zero          ; $FEF0
    .byte <One           ; $FEF1
    .byte <Two           ; $FEF2
    .byte <Three         ; $FEF3
    .byte <Four          ; $FEF4
    .byte <Five          ; $FEF5
    .byte <Six           ; $FEF6
    .byte <Seven         ; $FEF7
    .byte <Eight         ; $FEF8
    .byte <Nine          ; $FEF9

LFEFA:
    .byte <BlankDigit    ; $FEFA
LFEFB:
    .byte <Letter_S      ; $FEFB
LFEFC:
    .byte <Letter_L      ; $FEFC
LFEFD:
    .byte <Letter_R      ; $FEFD
LFEFE:
    .byte <Letter_W      ; $FEFE
LFEFF:
    .byte <Letter_E      ; $FEFF

;from Thomas's disassembly
OFS_SPACE       = LFEFA - LFEF0      ; 10 = $0a
OFS_S           = LFEFB - LFEF0      ; 11 = $0b
OFS_L           = LFEFC - LFEF0      ; 12 = $0c
OFS_R           = LFEFD - LFEF0      ; 13 = $0d
OFS_W           = LFEFE - LFEF0      ; 14 = $0e
NO_DAMAGE       = OFS_SPACE+[OFS_SPACE<<4]; $aa
HI_DAMAGE       = OFS_S << 4              ; $b0

       ORG $FF00

LFF00:
    .byte $00 ; |        | $FF00
    .byte $10 ; |   X    | $FF01
    .byte $20 ; |  X     | $FF02
    .byte $01 ; |       X| $FF03
    .byte $13 ; |   X  XX| $FF04
    .byte $13 ; |   X  XX| $FF05
    .byte $17 ; |   X XXX| $FF06
    .byte $7F ; | XXXXXXX| $FF07
    .byte $EB ; |XXX X XX| $FF08
    .byte $7F ; | XXXXXXX| $FF09
    .byte $17 ; |   X XXX| $FF0A
    .byte $13 ; |   X  XX| $FF0B
    .byte $13 ; |   X  XX| $FF0C
    .byte $01 ; |       X| $FF0D
    .byte $00 ; |        | $FF0E
    .byte $00 ; |        | $FF0F
LFF10:
    .byte $00 ; |        | $FF10
    .byte $00 ; |        | $FF11
    .byte $00 ; |        | $FF12
    .byte $00 ; |        | $FF13
    .byte $01 ; |       X| $FF14
    .byte $01 ; |       X| $FF15
    .byte $01 ; |       X| $FF16
    .byte $00 ; |        | $FF17
    .byte $FF ; |XXXXXXXX| $FF18
    .byte $FF ; |XXXXXXXX| $FF19
    .byte $FF ; |XXXXXXXX| $FF1A
    .byte $01 ; |       X| $FF1B
    .byte $13 ; |   X  XX| $FF1C
    .byte $17 ; |   X XXX| $FF1D
    .byte $3F ; |  XXXXXX| $FF1E
    .byte $6B ; | XX X XX| $FF1F
    .byte $3F ; |  XXXXXX| $FF20
    .byte $17 ; |   X XXX| $FF21
    .byte $13 ; |   X  XX| $FF22
    .byte $01 ; |       X| $FF23
    .byte $00 ; |        | $FF24
    .byte $00 ; |        | $FF25
LFF26:
    .byte $00 ; |        | $FF26
    .byte $00 ; |        | $FF27
    .byte $00 ; |        | $FF28
    .byte $00 ; |        | $FF29
    .byte $04 ; |     X  | $FF2A
    .byte $05 ; |     X X| $FF2B
    .byte $05 ; |     X X| $FF2C
    .byte $05 ; |     X X| $FF2D
    .byte $05 ; |     X X| $FF2E
    .byte $09 ; |    X  X| $FF2F
    .byte $01 ; |       X| $FF30
    .byte $0B ; |    X XX| $FF31
    .byte $1F ; |   XXXXX| $FF32
    .byte $35 ; |  XX X X| $FF33
    .byte $1F ; |   XXXXX| $FF34
    .byte $0B ; |    X XX| $FF35
    .byte $01 ; |       X| $FF36
    .byte $00 ; |        | $FF37
    .byte $00 ; |        | $FF38
    .byte $00 ; |        | $FF39
    .byte $00 ; |        | $FF3A
    .byte $00 ; |        | $FF3B
    .byte $00 ; |        | $FF3C
    .byte $09 ; |    X  X| $FF3D
    .byte $0F ; |    XXXX| $FF3E
    .byte $1B ; |   XX XX| $FF3F
    .byte $0F ; |    XXXX| $FF40
    .byte $09 ; |    X  X| $FF41
    .byte $00 ; |        | $FF42
    .byte $00 ; |        | $FF43
    .byte $00 ; |        | $FF44
    .byte $00 ; |        | $FF45
    .byte $00 ; |        | $FF46
    .byte $00 ; |        | $FF47
    .byte $05 ; |     X X| $FF48
    .byte $0F ; |    XXXX| $FF49
    .byte $05 ; |     X X| $FF4A
BlankDigit:
    .byte $00 ; |        | $FF4B
    .byte $00 ; |        | $FF4C
    .byte $00 ; |        | $FF4D
    .byte $00 ; |        | $FF4E
    .byte $00 ; |        | $FF4F
    .byte $00 ; |        | $FF50
    .byte $00 ; |        | $FF51
    .byte $08 ; |    X   | $FF52
    .byte $1C ; |   XXX  | $FF53
    .byte $08 ; |    X   | $FF54
    .byte $00 ; |        | $FF55
    .byte $00 ; |        | $FF56
    .byte $40 ; | X      | $FF57
    .byte $40 ; | X      | $FF58
    .byte $00 ; |        | $FF59
    .byte $00 ; |        | $FF5A
    .byte $00 ; |        | $FF5B
    .byte $48 ; | X  X   | $FF5C
    .byte $5C ; | X XXX  | $FF5D
    .byte $08 ; |    X   | $FF5E
    .byte $00 ; |        | $FF5F
    .byte $00 ; |        | $FF60
    .byte $41 ; | X     X| $FF61
    .byte $41 ; | X     X| $FF62
    .byte $00 ; |        | $FF63
    .byte $00 ; |        | $FF64
    .byte $00 ; |        | $FF65
    .byte $49 ; | X  X  X| $FF66
    .byte $5D ; | X XXX X| $FF67
    .byte $08 ; |    X   | $FF68
    .byte $00 ; |        | $FF69
    .byte $00 ; |        | $FF6A
Zero:
    .byte $3C ; |  XXXX  | $FF6B
    .byte $66 ; | XX  XX | $FF6C
    .byte $66 ; | XX  XX | $FF6D
    .byte $66 ; | XX  XX | $FF6E
    .byte $66 ; | XX  XX | $FF6F
    .byte $66 ; | XX  XX | $FF70
;    .byte $3C ; |  XXXX  | $FF71
One:
    .byte $3C ; |  XXXX  | $FF72   shared
    .byte $18 ; |   XX   | $FF73
    .byte $18 ; |   XX   | $FF74
    .byte $18 ; |   XX   | $FF75
    .byte $18 ; |   XX   | $FF76
    .byte $38 ; |  XXX   | $FF77
    .byte $18 ; |   XX   | $FF78
Two:
    .byte $7E ; | XXXXXX | $FF79
    .byte $60 ; | XX     | $FF7A
    .byte $60 ; | XX     | $FF7B
    .byte $3C ; |  XXXX  | $FF7C
    .byte $06 ; |     XX | $FF7D
    .byte $46 ; | X   XX | $FF7E
;    .byte $3C ; |  XXXX  | $FF7F
Three:
    .byte $3C ; |  XXXX  | $FF80   shared
    .byte $46 ; | X   XX | $FF81
    .byte $06 ; |     XX | $FF82
    .byte $0C ; |    XX  | $FF83
    .byte $06 ; |     XX | $FF84
    .byte $46 ; | X   XX | $FF85
    .byte $3C ; |  XXXX  | $FF86
Four:
    .byte $0C ; |    XX  | $FF87
    .byte $0C ; |    XX  | $FF88
    .byte $7E ; | XXXXXX | $FF89
    .byte $4C ; | X  XX  | $FF8A
    .byte $2C ; |  X XX  | $FF8B
    .byte $1C ; |   XXX  | $FF8C
    .byte $0C ; |    XX  | $FF8D
Five:
    .byte $7C ; | XXXXX  | $FF8E
    .byte $46 ; | X   XX | $FF8F
    .byte $06 ; |     XX | $FF90
    .byte $7C ; | XXXXX  | $FF91
    .byte $60 ; | XX     | $FF92
    .byte $60 ; | XX     | $FF93
    .byte $7E ; | XXXXXX | $FF94
Six:
    .byte $3C ; |  XXXX  | $FF95
    .byte $66 ; | XX  XX | $FF96
    .byte $66 ; | XX  XX | $FF97
    .byte $7C ; | XXXXX  | $FF98
    .byte $60 ; | XX     | $FF99
    .byte $62 ; | XX   X | $FF9A
    .byte $3C ; |  XXXX  | $FF9B
Seven:
    .byte $18 ; |   XX   | $FF9C
    .byte $18 ; |   XX   | $FF9D
    .byte $18 ; |   XX   | $FF9E
    .byte $0C ; |    XX  | $FF9F
    .byte $06 ; |     XX | $FFA0
    .byte $42 ; | X    X | $FFA1
    .byte $7E ; | XXXXXX | $FFA2
Eight:
    .byte $3C ; |  XXXX  | $FFA3
    .byte $66 ; | XX  XX | $FFA4
    .byte $66 ; | XX  XX | $FFA5
    .byte $3C ; |  XXXX  | $FFA6
    .byte $66 ; | XX  XX | $FFA7
    .byte $66 ; | XX  XX | $FFA8
;    .byte $3C ; |  XXXX  | $FFA9
Nine:
    .byte $3C ; |  XXXX  | $FFAA    shared
    .byte $46 ; | X   XX | $FFAB
    .byte $06 ; |     XX | $FFAC
    .byte $3E ; |  XXXXX | $FFAD
    .byte $66 ; | XX  XX | $FFAE
    .byte $66 ; | XX  XX | $FFAF
    .byte $3C ; |  XXXX  | $FFB0
Colon:
    .byte $00 ; |        | $FFB1
    .byte $18 ; |   XX   | $FFB2
    .byte $00 ; |        | $FFB3
    .byte $00 ; |        | $FFB4
    .byte $00 ; |        | $FFB5
    .byte $18 ; |   XX   | $FFB6
    .byte $00 ; |        | $FFB7
Letter_D:
    .byte $7C ; | XXXXX  | $FFB8
    .byte $66 ; | XX  XX | $FFB9
    .byte $66 ; | XX  XX | $FFBA
    .byte $66 ; | XX  XX | $FFBB
    .byte $66 ; | XX  XX | $FFBC
    .byte $66 ; | XX  XX | $FFBD
    .byte $7C ; | XXXXX  | $FFBE
Letter_E:
    .byte $7E ; | XXXXXX | $FFBF
    .byte $60 ; | XX     | $FFC0
    .byte $60 ; | XX     | $FFC1
    .byte $78 ; | XXXX   | $FFC2
    .byte $60 ; | XX     | $FFC3
    .byte $60 ; | XX     | $FFC4
;    .byte $7E ; | XXXXXX | $FFC5
Letter_L:
    .byte $7E ; | XXXXXX | $FFC6   shared
    .byte $60 ; | XX     | $FFC7
    .byte $60 ; | XX     | $FFC8
    .byte $60 ; | XX     | $FFC9
    .byte $60 ; | XX     | $FFCA
    .byte $60 ; | XX     | $FFCB
    .byte $60 ; | XX     | $FFCC
Letter_R:
    .byte $66 ; | XX  XX | $FFCD
    .byte $6C ; | XX XX  | $FFCE
    .byte $68 ; | XX X   | $FFCF
    .byte $7C ; | XXXXX  | $FFD0
    .byte $66 ; | XX  XX | $FFD1
    .byte $66 ; | XX  XX | $FFD2
    .byte $7C ; | XXXXX  | $FFD3
Letter_S:
    .byte $3C ; |  XXXX  | $FFD4
    .byte $46 ; | X   XX | $FFD5
    .byte $06 ; |     XX | $FFD6
    .byte $3C ; |  XXXX  | $FFD7
    .byte $60 ; | XX     | $FFD8
    .byte $62 ; | XX   X | $FFD9
    .byte $3C ; |  XXXX  | $FFDA
Letter_W:
    .byte $63 ; | XX   XX| $FFDB
    .byte $77 ; | XXX XXX| $FFDC
    .byte $7F ; | XXXXXXX| $FFDD
    .byte $6B ; | XX X XX| $FFDE
    .byte $6B ; | XX X XX| $FFDF
    .byte $63 ; | XX   XX| $FFE0
    .byte $63 ; | XX   XX| $FFE1
LFFE2:
    .byte $41 ; | X     X| $FFE2
    .byte $41 ; | X     X| $FFE3
    .byte $00 ; |        | $FFE4
    .byte $00 ; |        | $FFE5
    .byte $00 ; |        | $FFE6
    .byte $40 ; | X      | $FFE7
    .byte $40 ; | X      | $FFE8
LFFE9:
    .byte $41 ; | X     X| $FFE9
    .byte $41 ; | X     X| $FFEA
    .byte $08 ; |    X   | $FFEB
    .byte $1C ; |   XXX  | $FFEC
    .byte $08 ; |    X   | $FFED
    .byte $40 ; | X      | $FFEE
    .byte $40 ; | X      | $FFEF
LFFF0:
    .byte $00 ; |        | $FFF0
    .byte $08 ; |    X   | $FFF1
    .byte $5D ; | X XXX X| $FFF2
    .byte $7F ; | XXXXXXX| $FFF3
    .byte $5D ; | X XXX X| $FFF4
    .byte $08 ; |    X   | $FFF5
LFFF6:
    .byte $00 ; |        | $FFF6
    .byte $08 ; |    X   | $FFF7
    .byte $55 ; | X X X X| $FFF8
    .byte $63 ; | XX   XX| $FFF9
    .byte $55 ; | X X X X| $FFFA
    .byte $08 ; |    X   | $FFFB


       ORG $FFF8

    .byte 0              ; supercharger compatibility
    .byte 0
    .byte 0
    .byte 0

    .word START
    .word 0
