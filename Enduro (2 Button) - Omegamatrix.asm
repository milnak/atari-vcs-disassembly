; Disassembly of Enduro
; Disassembled by Omegamatrix
;
; Support added for a Sega Genesis controller
; Button B = accelerate
; Button C = brake
;
;
; endr.cfg contents:
;
;      ORG F000
;      CODE F000 F19D
;      GFX F19E F1AD
;      CODE F1AE FC42
;      GFX FC43 FC56
;      CODE FC57 FC9E
;      GFX FC9F FDC8
;      CODE FDC9 FDEB
;      GFX FDEC FDFF
;      CODE FE00 FE0C
;      GFX FE0D FFFF

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
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C

; Read TIA Baseline = $00
CXM0P   =  $00
CXP0FB  =  $02
CXPPMM  =  $07
INPT1   =  $09
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296
LF200   =   $F200

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

colOpponents    = $9B ; $9B - $A1
odometer        = $A8 ; $A8 - $AA
carsRemaining   = $AB ; $AB - $AC
dayNumber       = $AD

;$B1  LSR, LSR, AND #$0F, use to index sky tab

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $F000

P1_66_Cycles:  ; indirect jump
    dec    $2E                   ;5  @32   waste time
    adc    $C8,X                 ;4  @36
    sta    $BD                   ;3  @39
    sta    HMM0                  ;3  @42
    lda    $BE                   ;3  @45
    and    #$0F                  ;2  @47
    adc    $E4,X                 ;4  @51
    sta    $BE                   ;3  @54
    sta    HMBL                  ;3  @57
    dey                          ;2  @59
    lda    LFCB8,X               ;4  @63
    sta    RESP1                 ;3  @66
    sta.w  COLUPF                ;4  @70
    jmp    DrawCarsG             ;3  @73

P1_61_Cycles:  ; indirect jump
    nop                          ;2  @29
    nop                          ;2  @31
    nop                          ;2  @33
    adc    $C8,X                 ;4  @37
    sta    $BD                   ;3  @40
    sta    HMM0                  ;3  @43
    lda    $BE                   ;3  @46
    and    #$0F                  ;2  @48
    adc    $E4,X                 ;4  @52
    sta    $BE                   ;3  @55
    sta    HMBL                  ;3  @58
    sta    RESP1                 ;3  @61
    dey                          ;2  @63
    jmp    DrawCarsF             ;3  @66

P1_56_Cycles:  ; indirect jump
    nop                          ;2  @29
    nop                          ;2  @31
    adc    $C8,X                 ;4  @35
    sta    $BD                   ;3  @38
    sta    HMM0                  ;3  @41
    lda    $BE                   ;3  @44
    and    #$0F                  ;2  @46
    adc    $E4,X                 ;4  @50
    sta    $BE                   ;3  @53
    sta    RESP1                 ;3  @56
    nop                          ;2  @58
    dey                          ;2  @60
    jmp    DrawCarsE             ;3  @63

P1_51_Cycles:  ; indirect jump
    nop                          ;2  @29
    nop                          ;2  @31
    nop                          ;2  @33
    adc    $C8,X                 ;4  @37
    sta    $BD                   ;3  @40
    dey                          ;2  @42
    sta    HMM0                  ;3  @45
    lda    $BE                   ;3  @48
    sta    RESP1                 ;3  @51
    jmp    DrawCarsD             ;3  @54

P1_46_Cycles:  ; indirect jump
    nop                          ;2  @29
    nop                          ;2  @31
    adc    $C8,X                 ;4  @35
    sta    $BD                   ;3  @38
    dey                          ;2  @40
    sta    HMM0                  ;3  @43
    sta    RESP1                 ;3  @46
    jmp    DrawCarsC             ;3  @49

P1_41_Cycles:  ; indirect jump
    nop                          ;2  @29
    nop                          ;2  @31
    adc    $C8,X                 ;4  @35
    sta    $BD                   ;3  @38
    sta    RESP1                 ;3  @41
    dey                          ;2  @43
    jmp    DrawCarsB             ;3  @46

P1_36_Cycles:  ; indirect jump
    nop                          ;2  @29
    nop                          ;2  @31
    dey                          ;2  @33
    sta    RESP1                 ;3  @36
    jmp    DrawCarsA             ;3  @39

LF089:
    sta.w  HMP1                  ;4  @71
    dey                          ;2  @73
    bne    LF0BF                 ;2³ @75/76
;---------------------------------------
    sta.w  HMOVE                 ;4  @3
    sty    COLUBK                ;3  @6    black
    sty    GRP0                  ;3  @9    clear
    sty    ENAM0                 ;3  @12   disable
    sty    GRP1                  ;3  @15
    sty    ENABL                 ;3  @18
    jmp    LFA3F                 ;3  @21   exit point for routine

P1_31_Cycles:  ; indirect jump
    sta.w  RESP1                 ;4  @31
    nop                          ;2  @33
    nop                          ;2  @35
    nop                          ;2  @37
    dey                          ;2  @39
DrawCarsA:
    adc    $C8,X                 ;4  @43
    sta    $BD                   ;3  @46
DrawCarsB:
    sta    HMM0                  ;3  @49
DrawCarsC:
    nop                          ;2  @51
    lda    $BE                   ;3  @54
DrawCarsD:
    and    #$0F                  ;2  @56
    adc    $E4,X                 ;4  @60
    sta    $BE                   ;3  @63
DrawCarsE:
    sta    HMBL                  ;3  @66
DrawCarsF:
    lda    LFCB8,X               ;4  @70
    sta    COLUPF                ;3  @73
DrawCarsG:
    sta    COLUP0                ;3  @76
;---------------------------------------
LF0BF:
    sta    HMOVE                 ;3  @3
    ldx    LFD81,Y               ;4  @7
    lda    ($B2),Y               ;5  @12
    sta    GRP1                  ;3  @15
    lda    ($B4),Y               ;5  @20
    and    LFE77,X               ;4  @24
    sta    GRP0                  ;3  @27
    lda    $BD                   ;3  @30
    and    #$0F                  ;2  @32
    clc                          ;2  @34
    adc    $C8,X                 ;4  @38
    sta    $BD                   ;3  @41
    sta    HMM0                  ;3  @44
    lda    $BE                   ;3  @47
    and    #$0F                  ;2  @49
    adc    $E4,X                 ;4  @53
    sta    $BE                   ;3  @56
    sta    HMBL                  ;3  @59
    lda    #0                    ;2  @61
    cpy    $97                   ;3  @64
    bne    LF089                 ;2³ @66/67
    dey                          ;2  @68
    ldx    LFD81,Y               ;4  @72
    nop                          ;2  @74
    clc                          ;2  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    GRP1                  ;3  @6
    lda    ($B4),Y               ;5  @11
    and    LFE77,X               ;4  @15
    sta    GRP0                  ;3  @18
    dey                          ;2  @20
    lda    $BD                   ;3  @23
    and    #$0F                  ;2  @25
    adc    $C8,X                 ;4  @29
    sta    $BD                   ;3  @32
    sta    HMM0                  ;3  @35
    lda.w  $BE                   ;4  @39
    and    #$0F                  ;2  @41
    adc    $E4,X                 ;4  @45
    sta    $BE                   ;3  @48
    sta    HMBL                  ;3  @51
LF111:
    ldx    LFD81+1,Y             ;4  @55   entry point for routine
    lda    ($B4),Y               ;5  @60
    pha                          ;3  @63
    dey                          ;2  @65
    sty    $B9                   ;3  @68   height for middle section
    ldy    $8A                   ;3  @71
    lda    ($BB),Y               ;5  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    $97                   ;3  @6
    lda.wy $9B,Y                 ;4  @10   color the opponent's cars
    sta    COLUP1                ;3  @13
    pla                          ;4  @17
    and    LFE77,X               ;4  @21
    sta    GRP0                  ;3  @24
    lda    LFE29,Y               ;4  @28
    sta    NUSIZ1                ;3  @31
    lda.wy $8B,Y                 ;4  @35
    sta    $B2                   ;3  @38
    lda    $BD                   ;3  @41
    and    #$0F                  ;2  @43
    adc    $C8,X                 ;4  @47
    sta    $BD                   ;3  @50
    sta    HMM0                  ;3  @53
    lda    $BE                   ;3  @56
    and    #$0F                  ;2  @58
    adc    $E4,X                 ;4  @62
    sta    $BE                   ;3  @65
    sta    HMBL                  ;3  @68
    lda.wy $83,Y                 ;4  @72
    sta.w  HMP1                  ;4  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    and    #$0F                  ;2  @5
    tay                          ;2  @7
    lda    LFE00,Y               ;4  @11
    sta    $E2                   ;3  @14
    ldy    $B9                   ;3  @17
    ldx    LFD81,Y               ;4  @21
    lda    ($B4),Y               ;5  @26
    and    LFE77,X               ;4  @30
    clc                          ;2  @32
    sta    GRP0                  ;3  @35  1 cycle earlier now
    lda    $BD                   ;3  @38
    and    #$0F                  ;2  @40
    adc    $C8,X                 ;4  @44
    sta    $BD                   ;3  @47
    sta    HMM0                  ;3  @50
    lda    $BE                   ;3  @53
    and    #$0F                  ;2  @55
    adc    $E4,X                 ;4  @59
    sta    $BE                   ;3  @62
    sta    HMBL                  ;3  @65
    dec    $8A                   ;5  @70
    dey                          ;2  @72
    ldx    LFD81,Y               ;4  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    ($B4),Y               ;5  @8
    and    LFE77,X               ;4  @12
    sta    GRP0                  ;3  @15
    lda    $BD                   ;3  @18
    clc                          ;2  @20
    and    #$0F                  ;2  @22
    jmp.ind ($00E2)              ;5  @27

LF193:
    lax    $C6                   ; 3   illegal opcode, saves a byte
    and    #$0F                  ; 2
    tay                          ; 2
    iny                          ; 2
    txa                          ; 2
LF19A:
    ldx    INTIM                 ; 4
    bne    LF19A                 ; 2³
    cpy    #4                    ; 2
    bcs    LF1BA                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    ENABL                 ; 3   X=0, disable
    ldx    #$30                  ; 2
    stx    PF0                   ; 3
LF1AB:
    dey                          ; 2
    bne    LF1AB                 ; 2³  Y=0
    sta    HMBL                  ; 3
    sta    RESBL                 ; 3
    tya                          ; 2   A=0
    tax                          ; 2   X=0
    ldy    #6                    ; 2
    stx    PF0                   ; 3   clear
    bne    LF1C9                 ; 3   always branch

LF1BA:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    ENABL                 ; 3   X=0, disable
LF1C0:
    dey                          ; 2
    bne    LF1C0                 ; 2³
    ldy    #6                    ; 2
    sta    HMBL                  ; 3
    sta    RESBL                 ; 3
LF1C9:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    $FE                   ; 3   X=0
    bpl    LF1EF                 ; 3   always branch

LF1D1:
    lda    #$20                  ;2  @28..
    sty    HMBL                  ; 3   Y=$0x, no motion
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    ldx    HillTwo,Y             ; 4
    lda    HillOne,Y             ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    stx    GRP0                  ;3  @6
    sta    GRP1                  ;3  @9
    lda    $FE                   ;3  @12
    beq    LF1EF                 ;2³ @14/15
    sta    COLUBK                ;3  @17
LF1EF:
    ldx    $C0                   ;3  @12..20
    bmi    LF1FE                 ;2³ @14..23
    lda    LFEF1,X               ; 4
    sta    $FE                   ; 3
    tya                          ; 2
    lsr                          ; 2
    bcc    LF1FE                 ; 2³
    dec    $C0                   ; 5
LF1FE:
    lda    $C1                   ;3  @18
    sta    $B4                   ;3  @21
    dey                          ;2  @23
    bpl    LF1D1                 ;2³ @25..
    lda    #$20                  ; 2
    sta    $B2                   ; 3
    ldy    $82                   ; 3
    lda    $E2                   ; 3
    ldx    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    COLUBK                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    iny                          ; 2
LF21D:
    dey                          ; 2
    bne    LF21D                 ; 2³
    sta    RESP0                 ; 3    position P0 car
    lda    $E2                   ; 3
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    ldy    #2                    ;2  @5
    sty    COLUP0                ;3  @8
    lda    #5                    ;2  @10
    sta    NUSIZ0                ;3  @13
    nop                          ;2  @15
    nop                          ;2  @17
    lda    $C2                   ;3  @20
    sta    REFP0                 ;3  @23
    asl                          ;2  @25
    sta    REFP1                 ;3  @28
    stx    CTRLPF                ;3  @31
    sty    COLUPF                ;3  @34
    sta    HMCLR                 ;3  @37
    sta    CXCLR                 ;3  @40
    sty    ENAM0                 ;3  @43
    sty    ENABL                 ;3  @46
    ldy    #$66                  ;2  @48    height for middle section
    jmp    LF111                 ;3  @51


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
     NOP ; free byte
     NOP ; free byte  14
     NOP ; free byte
     NOP ; free byte  16
     NOP ; free byte
     NOP ; free byte  18
     NOP ; free byte
     NOP ; free byte  20
     NOP ; free byte
     NOP ; free byte  22
     NOP ; free byte
     NOP ; free byte  24
     NOP ; free byte
     NOP ; free byte  26
     NOP ; free byte
     NOP ; free byte  28
     NOP ; free byte
     NOP ; free byte  30
     NOP ; free byte
     NOP ; free byte  32
     NOP ; free byte
     NOP ; free byte  34
     NOP ; free byte
     NOP ; free byte  36
     NOP ; free byte
     NOP ; free byte  38
     NOP ; free byte
     NOP ; free byte  40
     NOP ; free byte
     NOP ; free byte  42
     NOP ; free byte
     NOP ; free byte  44
     NOP ; free byte
     NOP ; free byte  46
     NOP ; free byte
     NOP ; free byte  48
     NOP ; free byte
     NOP ; free byte  50
     NOP ; free byte
     NOP ; free byte  52
     NOP ; free byte
     NOP ; free byte  54
     NOP ; free byte
     NOP ; free byte  56
     NOP ; free byte
     NOP ; free byte  58
     NOP ; free byte
     NOP ; free byte  60
     NOP ; free byte
     NOP ; free byte  62
     NOP ; free byte
     NOP ; free byte  64
     NOP ; free byte
     NOP ; free byte  66
     NOP ; free byte
     NOP ; free byte  68
     NOP ; free byte
     NOP ; free byte  70
     NOP ; free byte
     NOP ; free byte  72
     NOP ; free byte
     NOP ; free byte  74
     NOP ; free byte
     NOP ; free byte  76



ClearRamTIA:
    sei                          ; 2
    cld                          ; 2
    ldx    #0                    ; 2
    txa                          ; 2
.loopClear:
    dex                          ; 2
    txs                          ; 2
    pha                          ; 3
    bne    .loopClear            ; 2³

;initialization
    tsx                          ; 2   #$FF
    stx    $AF                   ; 3
    dex                          ; 2   #$FE
    stx    $B3                   ; 3
    stx    $B5                   ; 3
    dex                          ; 2   #$FD
    stx    $BC                   ; 3
    lda    #$F0                  ; 2   upper nibble for logo/copyright pointers
    sta    $E3                   ; 3
    lsr                          ; 2
    sta    $B6                   ; 3   #$78
    sta    $80                   ; 3   #$78
    lda    #$24                  ; 2
    sta    $B8                   ; 3

LF28D:
    lda    $81                   ; 3
    rol                          ; 2
    lax    $80                   ; 3   illegal opcode, save 2 bytes
    rol                          ; 2
    eor    $81                   ; 3
    sta    $80                   ; 3
    stx    $81                   ; 3
    lda    CXPPMM                ; 3
    sta    HMCLR                 ; 3
    bpl    LF2AF                 ; 2³
    lda    #0                    ; 2
    sta    $96                   ; 3
    ldx    #$8F                  ; 2
    bit    $AE                   ; 3
    bpl    LF2D5                 ; 2³
    ldx    #$9F                  ; 2
    bne    LF2D5                 ; 3   always branch

LF2AF:
    bit    CXM0P                 ; 3
    bvc    LF2B9                 ; 2³
    ldx    #$44                  ; 2
    dec    $AE                   ; 5   stop car crossing left border
    bne    LF2C1                 ; 2³
LF2B9:
    bit    CXP0FB                ; 3
    bvc    LF2D7                 ; 2³
    inc    $AE                   ; 5   stop car crossing right border
    ldx    #$54                  ; 2
LF2C1:
    bit    $A3                   ; 3
    bvs    LF2D7                 ; 2³
    bit    $94                   ; 3
    bpl    LF2CB                 ; 2³
    dex                          ; 2
    dex                          ; 2
LF2CB:
    lsr    $96                   ; 5
    lda    $96                   ; 3
    lsr                          ; 2
    adc    $96                   ; 3
    sta    $96                   ; 3
LF2D5:
    stx    $A3                   ; 3
LF2D7:
    lda    SWCHB                 ; 4
    ora    #$FC                  ; 2   debouncer routine?
    and    SWCHA                 ; 4
    eor    #$FF                  ; 2
    beq    LF2E7                 ; 2³
    lda    #0                    ; 2
    sta    $93                   ; 3
LF2E7:
    lsr    SWCHB                 ; 6   test reset switch
    bcs    LF304                 ; 2³
    ldx    #$1C                  ; 2
    stx    $95                   ; 3
    stx    $B0                   ; 3
    stx    $92                   ; 3   A=0 at this point
LF2F7:
    sta    $96,X                 ; 4
    dex                          ; 2
    bpl    LF2F7                 ; 2³
    stx    $B1                   ; 3
    inc    $AF                   ; 5
    sta    $94                   ; 3
    bpl    LF335                 ; 2³
LF304:
    lda    $92                   ; 3
    beq    LF335                 ; 2³
    lda    INPT4                 ; 3
    bpl    beginRace             ; 2³   when fire button is pressed, the race begins
    lda    $80                   ; 3
    bne    LF312                 ; 2³
    dec    $92                   ; 5
LF312:
    ldx    #$1C                  ; 2
    stx    $95                   ; 3
    stx    $B0                   ; 3
LF335:
    lax    $B0                   ; 3   illegal opcode
    and    #$01                  ; 2
    sta    $F0                   ; 3
    beq    LF343                 ; 2³
    lda    $95                   ; 3
    beq    LF343                 ; 2³
    dec    $95                   ; 5
LF343:
    txa                          ; 2   value in $B0
    and    #$07                  ; 2
    bne    LF355                 ; 2³
    lda    $A3                   ; 3
    and    #$0F                  ; 2
    bne    LF353                 ; 2³
    sta    $A3                   ; 3
    .byte $2C  ; BIT $A3C6 (CXBLPF), overflow flag is not checked before readjusted...
LF353:
    dec    $A3                   ; 5
LF355:
    txa                          ; 2   value in $B0
    beq    LF35E                 ; 2³
    dec    $B0                   ; 5
    jmp    LF3CC                 ; 3

beginRace:
    lda    #0                    ; 2
    ldx    #$20                  ; 2
LF31E:
    sta    $92,X                 ; 4   blank 2 rows of ram
    dex                          ; 2
    bpl    LF31E                 ; 2³
    stx    $B0                   ; 3   #$FF
    stx    $B1                   ; 3   #$FF
    stx    $94                   ; 3   #$FF
    inc    dayNumber             ; 5   start on day one
    lda    #2                    ; 2   start with 200 cars
    sta    $AC                   ; 3
    lda    #$18                  ; 2
    bne    LF38D                 ; 3   always branch

LF35E:
    tay                          ; 2   Y=0
    dec    $B0                   ; 5
    lax    $B1                   ; 3   illegal opcode
    and    #$3F                  ; 2
    ora    $AF                   ; 3
    beq    LF374                 ; 2³
    cmp    #$24                  ; 2
    bne    LF3BE                 ; 2³
    txa                          ; 2   value in $B1
    sbc    #$0C                  ; 2
    sta    $B1                   ; 3
    bne    LF3BE                 ; 2³
LF374:
    lda    $AB                   ; 3
    ora    $AC                   ; 3
    beq    LF392                 ; 2³
    ldx    #4                    ; 2
    sty    $B2                   ; 3   Y=0
LF380:
    sty    $92,X                 ; 4
    dex                          ; 2
    bpl    LF380                 ; 2³
    stx    $AF                   ; 3
    stx    $95                   ; 3
    dec    $B1                   ; 5
    lda    #$28                  ; 2
LF38D:
    sta    $B8                   ; 3
    jmp    LF58C                 ; 3

LF392:
    lda    $B1                   ; 3
    bne    LF39A                 ; 2³
    lda    #$40                  ; 2
    sta    $B1                   ; 3
LF39A:
    sed                          ; 2
    lda    dayNumber             ; 3
    clc                          ; 2
    adc    #1                    ; 2
    sta    dayNumber             ; 3
    cld                          ; 2

    ldx    dayNumber             ; 3
    lda    #3                    ; 2   300 cars every lap after
    sta    $AC                   ; 3
    lda    #0                    ; 2
    sta    $AB                   ; 3   other half of 300 cars
    cpx    #4                    ; 2
    rol                          ; 2
    cpx    #6                    ; 2
    rol                          ; 2
    cpx    #$30                  ; 2
    rol                          ; 2
    eor    #$07                  ; 2
    adc    $B8                   ; 3
    sta    $B8                   ; 3
LF3BE:
    dec    $B1                   ; 5
    lda    $B1                   ; 3
    and    #$07                  ; 2
    bne    LF3CC                 ; 2³
    bit    $93                   ; 3
    bmi    LF3CC                 ; 2³
    inc    $93                   ; 5
LF3CC:
    lda    $95                   ; 3
    beq    LF3FF                 ; 2³
    ldx    #0                    ; 2   kill audio
    stx    AUDV0                 ; 3
    cmp    #$A0                  ; 2
    bcc    LF3E8                 ; 2³
    cmp    #$C0                  ; 2
    bcs    LF3DE                 ; 2³
    lda    #$C0                  ; 2
LF3DE:
    lsr                          ; 2
    lsr                          ; 2
    eor    #$2F                  ; 2
    ldx    $AF                   ; 3
    ldy    #7                    ; 2
    bne    LF3F6                 ; 3   always branch

LF3E8:
    lsr                          ; 2
    adc    $95                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    ldy    #$0C                  ; 2
    lda    MusicAllCarsLapped,X  ; 4
    ldx    $94                   ; 3
LF3F6:
    sta    AUDF1                 ; 3
    stx    AUDV1                 ; 3
    sty    AUDC1                 ; 3
    jmp    LF57E                 ; 3

LF3FF:
    lda    $B1                   ; 3
    and    #$3F                  ; 2
    ldx    #4                    ; 2   for AUDC1
    cmp    #8                    ; 2
    bcs    LF419                 ; 2³
    lda    $AB                   ; 3
    ora    $AC                   ; 3
    beq    LF419                 ; 2³
    lda    $B0                   ; 3
    and    #$3C                  ; 2
    bne    LF419                 ; 2³
    lda    #7                    ; 2   X=4 at this point
    bne    LF42F                 ; 3   always branch

LF419:
    dex                          ; 2   X=3
    lda    #6                    ; 2
    ldy    $9B                   ; 3
    bne    LF427                 ; 2³
    lsr                          ; 2
    ldy    $9C                   ; 3
    bne    LF427                 ; 2³
    tya                          ; 2
LF427:
    bit    $BF                   ; 3
    bvc    LF42F                 ; 2³
    ldx    #8                    ; 2
    lda    #4                    ; 2
LF42F:
    and    $94                   ; 3
    sta    AUDV1                 ; 3
    stx    AUDC1                 ; 3
    lda    #$0C                  ; 2
    sta    AUDF1                 ; 3
    lda    $A3                   ; 3
    beq    LF46C                 ; 2³
    bmi    LF456                 ; 2³
    ldy    #$0F                  ; 2
    ldx    #$10                  ; 2
LF443:
    lda    #3                    ; 2
LF445:
    sta    AUDC0                 ; 3
    txa                          ; 2
    ora    $F0                   ; 3
    sta    AUDF0                 ; 3
    tya                          ; 2
    and    $94                   ; 3
    sta    AUDV0                 ; 3
    jmp    LF4CD                 ; 3

LF456:
    and    #$0F                  ; 2
    cmp    #$0B                  ; 2
    bcc    LF464                 ; 2³
    ldy    #$0F                  ; 2
    ldx    #8                    ; 2
    txa                          ; 2   A=8
    bne    LF445                 ; 3   always branch

LF464:
    ldx    #0                    ; 2
    ldy    #3                    ; 2
    bne    LF443                 ; 3   always branch

LF46C:
    lda    $96                   ; 3
    and    #$1E                  ; 2
    lsr                          ; 2
    eor    #$0F                  ; 2
    adc    #$0F                  ; 2
    sta    AUDF0                 ; 3
    lda    #3                    ; 2
    sta    AUDC0                 ; 3
    ldy    #7                    ; 2
    lda    $B0                   ; 3
    and    #$07                  ; 2
    tax                          ; 2
    bit    $94                   ; 3
    bmi    LF493                 ; 2³
    lda    #$46                  ; 2
    cmp    $96                   ; 3
    bcc    LF4C9                 ; 2³
    txa                          ; 2
    bne    LF4C9                 ; 2³
    inc    $96                   ; 5
    bne    LF4C9                 ; 2³
LF493:
    lda    INPT4                 ; 3
    bmi    LF4AC                 ; 2³   no acceleration, check direction
    lda    $96                   ; 3    speed?
    cmp    #$78                  ; 2    max speed?
    bcs    LF4C3                 ; 2³
    ldy    #$0F                  ; 2
    cmp    #$2E                  ; 2    acclerate fast (increments of 2, until #$2E)
    txa                          ; 2    then slow accleration
    bne    LF4C3                 ; 2³
    bcs    LF4A8                 ; 2³
    inc    $96                   ; 5
LF4A8:
    inc    $96                   ; 5
    bne    LF4C3                 ; 3   always branch?
    
LF4AC:
    LDA    INPT1
    BMI    LF4C3
;    lda    SWCHA                 ; 4
;    and    #$20                  ; 2   brakes
;    bne    LF4C3                 ; 2³  pressed...
    lda    $96                   ; 3
    cmp    #7                    ; 2
    bcc    LF4C3                 ; 2³
    dec    $96                   ; 5
    lda    #$0A                  ; 2
    sta    AUDF0                 ; 3
    ldy    #8                    ; 2
    sty    AUDC0                 ; 3
LF4C3:
    tya                          ; 2
    bit    $BF                   ; 3
    bvc    LF4C9                 ; 2³
    lsr                          ; 2
LF4C9:
    and    $94                   ; 3
    sta    AUDV0                 ; 3
LF4CD:
    lda    #6                    ; 2
    cmp    $96                   ; 3
    bmi    LF4D5                 ; 2³
    sta    $96                   ; 3
LF4D5:
    lda    $96                   ; 3
    and    $94                   ; 3
    lsr                          ; 2
    adc    $A7                   ; 3
    sta    $A7                   ; 3

    sed                          ; 2
    ldx    #$FD                  ; 2
LF4E1:
    lda    $AB,X                 ; 4
    adc    #0                    ; 2
    sta    $AB,X                 ; 4
    inx                          ; 2
    bne    LF4E1                 ; 2³
    cld                          ; 2

    lda    $B0                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    $96                   ; 3
    cmp    #$58                  ; 2
    bcc    LF4F8                 ; 2³
    lda    #$58                  ; 2
LF4F8:
    jsr    LFC9C                 ; 6
    sty    $E8                   ; 3
    bit    $BF                   ; 3
    bvc    LF502                 ; 2³
    lsr                          ; 2
LF502:
    ldy    $A3                   ; 3
    beq    LF508                 ; 2³
    lda    #$0C                  ; 2
LF508:
    cmp    #8                    ; 2
    bcs    LF50E                 ; 2³
    lda    #8                    ; 2
LF50E:
    jsr    LFC9C                 ; 6
    sty    $E7                   ; 3
    lsr                          ; 2
    jsr    LFC9C                 ; 6
    sty    $F9                   ; 3
    ldy    #1                    ; 2
    lda    $A3                   ; 3
    beq    LF525                 ; 2³
    and    #$10                  ; 2
    beq    LF52E                 ; 2³
    bne    LF53B                 ; 3   always branch

LF525:
    lda    $94                   ; 3
    beq    LF55A                 ; 2³
    bit    SWCHA                 ; 4
    bmi    LF537                 ; 2³
LF52E:
    lda    #0                    ; 2
    sec                          ; 2
    sbc    $E7                   ; 3
    jmp    LF53D                 ; 3

LF537:
    inc    $80                   ; 5
    bvs    LF55A                 ; 2³
LF53B:
    lda    $E7                   ; 3
LF53D:
    tax                          ; 2
LF53E:
    clc                          ; 2
    adc    $AE                   ; 3
    sta    $AE                   ; 3
    txa                          ; 2
    clc                          ; 2
    bpl    LF550                 ; 2³
    adc    $B6                   ; 3
    bcs    LF558                 ; 2³
    adc    #$A0                  ; 2
    jmp    LF558                 ; 3

LF550:
    adc    $B6                   ; 3
    cmp    #$A0                  ; 2
    bcc    LF558                 ; 2³
    sbc    #$A0                  ; 2
LF558:
    sta    $B6                   ; 3
LF55A:
    dey                          ; 2
    bmi    LF57E                 ; 2³
    lda    $95                   ; 3
    bne    LF57E                 ; 2³
    lda    #0                    ; 2
    sec                          ; 2
    bit    $A6                   ; 3
    bvc    LF57E                 ; 2³
    bmi    LF573                 ; 2³
    ldx    $E8                   ; 3
    sbc    $F9                   ; 3
LF56E:
    and    $94                   ; 3
    jmp    LF53E                 ; 3

LF573:
    sbc    $E8                   ; 3
    tax                          ; 2
    lda    $F9                   ; 3
    jmp    LF56E                 ; 3

LF57E:
    ldy    #0                    ; 2
    sty    $B2                   ; 3
    ldx    #7                    ; 2
LF584:
    lda    $9A,X                 ; 4
    beq    LF589                 ; 2³
    iny                          ; 2
LF589:
    dex                          ; 2
    bne    LF584                 ; 2³
LF58C:
    lda    $B1                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    and    #$0F                  ; 2
    sta    $FB                   ; 3
    sty    $F2                   ; 3
    sec                          ; 2
    lda    $95                   ; 3
    bne    LF5A8                 ; 2³
    lda    $96                   ; 3
    sbc    $B8                   ; 3
    sta    $B2                   ; 3
    lda    $98                   ; 3
    sec                          ; 2
    sbc    $96                   ; 3
    sta    $98                   ; 3
LF5A8:
    php                          ; 3
    bcc    LF5B7                 ; 2³
    lda    $99                   ; 3
    sbc    $B2                   ; 3
    sta    $99                   ; 3
    bit    $B2                   ; 3
    bpl    LF5C7                 ; 2³
    bcs    LF5BA                 ; 2³
LF5B7:
    jmp    LF691                 ; 3

LF5BA:
    ldx    #6                    ; 2
LF5BC:
    lda    $9A,X                 ; 4
    sta    $9B,X                 ; 4
    dex                          ; 2
    bne    LF5BC                 ; 2³
    ldx    $C7                   ; 3
    bcs    LF5FE                 ; 3   always branch

LF5C7:
    bcs    LF5B7                 ; 2³
    lda    $C7                   ; 3
    sbc    $F2                   ; 3
    pha                          ; 3
    lda    $9B                   ; 3
    beq    LF5F3                 ; 2³
    dec    $C7                   ; 5
    lda    $AC                   ; 3
    ora    $AB                   ; 3
    and    $94                   ; 3
    beq    LF5F3                 ; 2³

    sed                          ; 2   passed one car, subtract 1 car from
    lda    $AB                   ; 3   the remaining cars
    clc                          ; 2
    sbc    #0                    ; 2
    sta    $AB                   ; 3
    lda    $AC                   ; 3
    sbc    #0                    ; 2
    sta    $AC                   ; 3
    cld                          ; 2

    ora    $AB                   ; 3
    bne    LF5F3                 ; 2³
    lda    #$34                  ; 2
    sta    $95                   ; 3
LF5F3:
    ldx    #$FA                  ; 2
LF5F5:
    lda    $A2,X                 ; 4
    sta    $A1,X                 ; 4
    inx                          ; 2
    bne    LF5F5                 ; 2³
    pla                          ; 4
    tax                          ; 2
LF5FE:
    lda    LF200,X               ; 4
    ldx    #3                    ; 2
    cpx    $F2                   ; 3
    bcc    LF650                 ; 2³
    ldx    $B1                   ; 3
    cpx    #$E0                  ; 2
    bit    $81                   ; 3
    bcc    LF611                 ; 2³
    bvc    LF650                 ; 2³
LF611:
    bmi    LF650                 ; 2³
    and    #$E1                  ; 2
    ora    #$16                  ; 2
    bit    $B2                   ; 3
    bpl    LF65E                 ; 2³
    ldx    $9C                   ; 3
    bne    LF650                 ; 2³
    lsr                          ; 2
    sta    $9B                   ; 3
    inc    $C7                   ; 5
    lda    $AC                   ; 3
    ldx    #1                    ; 2
    cpx    dayNumber             ; 3
    sbc    #2                    ; 2
    beq    LF646                 ; 2³
    lda    $AB                   ; 3
    ora    $AC                   ; 3
    and    $94                   ; 3
    beq    LF646                 ; 2³

    sed                          ; 2   been passed by one car, so add one car
    lda    $94                   ; 3   not sure why $94 is used intead of SEC
    and    #$01                  ; 2
    adc    $AB                   ; 3
    sta    $AB                   ; 3
    lda    $AC                   ; 3
    adc    #0                    ; 2
    sta    $AC                   ; 3
    cld                          ; 2

LF646:
    lda    $AE                   ; 3
    eor    #$80                  ; 2
    asl                          ; 2
    rol    $9B                   ; 5
    jmp    LF691                 ; 3

LF650:
    lda    #0                    ; 2
    bit    $B2                   ; 3
    bpl    LF68F                 ; 2³
    sta    $9B                   ; 3
    bmi    LF691                 ; 3   always branch

LF65E:
    tay                          ; 2
    bpl    LF673                 ; 2³
    lda    $81                   ; 3
    ldx    dayNumber             ; 3
    cpx    #4                    ; 2
    bcc    LF66A                 ; 2³
    asl                          ; 2
LF66A:
    and    #$03                  ; 2
    php                          ; 3
    tya                          ; 2
    plp                          ; 4
    bne    LF673                 ; 2³
    and    #$EF                  ; 2
LF673:
    sta    $A1                   ; 3
    lda    $AE                   ; 3
    eor    #$80                  ; 2
    asl                          ; 2
    bit    $94                   ; 3
    bpl    LF689                 ; 2³
    lda    dayNumber             ; 3
    cmp    #7                    ; 2
    bcs    LF691                 ; 2³
    lda    $A0                   ; 3
    beq    LF691                 ; 2³
    ror                          ; 2
LF689:
    php                          ; 3
    lda    $A1                   ; 3
    lsr                          ; 2
    plp                          ; 4
    rol                          ; 2
LF68F:
    sta    $A1                   ; 3
LF691:
    lda    $99                   ; 3
    and    #$F0                  ; 2
    lsr                          ; 2   carry is clear
    adc    #1                    ; 2
    sta    $BB                   ; 3
    plp                          ; 4
    bcs    LF6F7                 ; 2³
    dec    $A5                   ; 5
    lda    $A6                   ; 3
    and    #$07                  ; 2
    beq    LF6BC                 ; 2³
    lsr                          ; 2
    bne    LF6B8                 ; 2³
    lda    $A6                   ; 3
    and    #$30                  ; 2
    sta    $A6                   ; 3
    asl                          ; 2
    asl                          ; 2
    ora    $A6                   ; 3
    jmp    LF6F5                 ; 3

LF6B8:
    dec    $A6                   ; 5
    bne    LF6F7                 ; 2³
LF6BC:
    lda    $A4                   ; 3
    beq    LF6C5                 ; 2³
    dec    $A4                   ; 5
    jmp    LF6F7                 ; 3

LF6C5:
    lda    $80                   ; 3
    and    #$30                  ; 2
    cmp    #$20                  ; 2
    bne    LF6CF                 ; 2³
    lda    #0                    ; 2
LF6CF:
    sta    $E7                   ; 3
    lda    $81                   ; 3
    ldx    dayNumber             ; 3
    cpx    #3                    ; 2
    bcc    LF6DA                 ; 2³
    lsr                          ; 2
LF6DA:
    ldx    $E7                   ; 3
    bne    LF6DF                 ; 2³
    lsr                          ; 2
LF6DF:
    sta    $A4                   ; 3
    lda    $E7                   ; 3
    eor    $A6                   ; 3
    and    #$30                  ; 2
    beq    LF6EF                 ; 2³
    lda    $E7                   ; 3
    ora    #$07                  ; 2
    sta    $E7                   ; 3
LF6EF:
    lda    $A6                   ; 3
    asl                          ; 2
    asl                          ; 2
    ora    $E7                   ; 3
LF6F5:
    sta    $A6                   ; 3
LF6F7:
    ldy    INTIM                 ; 4
    bne    LF6F7                 ; 2³
    dey                          ; 2
    sty    WSYNC                 ; 3
;---------------------------------------
    sty    VSYNC                 ; 3    Vsync starts
    ldx    $FB                   ; 3
    lda    LFE19,X               ; 4
    sta    $82                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $BF                   ; 3
    lda    SkyColorTab,X         ; 4
    sta    COLUBK                ; 3
    eor    #$03                  ; 2
    sta    $FA                   ; 3
    lda    $B1                   ; 3
    and    #$3F                  ; 2
    cmp    #$2B                  ; 2
    bcs    LF72C                 ; 2³
    cmp    #$24                  ; 2
    bcc    LF72C                 ; 2³
    sbc    #$1F                  ; 2
    tay                          ; 2
    lda    LFEF1+1,Y             ; 4
    sta    COLUBK                ; 3
    sty    $C0                   ; 3
LF72C:
    ldx    #1                    ; 2
    sty    WSYNC                 ; 3
;---------------------------------------
    lda    #$5E                  ; 2
    sta    TIM64T                ; 4
LF735:
    lda    $B6                   ; 3
    clc                          ; 2
    adc    LFE69,X               ; 4
    cmp    #$A0                  ; 2
    bcc    LF741                 ; 2³
    sbc    #$A0                  ; 2
LF741:
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    LFC81                 ; 6
    sta    $F5,X                 ; 4
    sta    HMCLR                 ; 3
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3    Vsync stops
    dex                          ; 2
    bpl    LF735                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $A6                   ; 3
    and    #$07                  ; 2
    sta    $F3                   ; 3
    ldy    #0                    ; 2
    sty    $8A                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($BB),Y               ; 5
    sta    $97                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    $EF                   ; 3

    sty    $F0                   ; 3   clear all
    sty    $FC                   ; 3
    sty    $EA                   ; 3
    sty    $EC                   ; 3
    sty    $ED                   ; 3
    sty    $EE                   ; 3
    tya                          ; 2   Y=0
    tax                          ; 2   X=0
    bit    $93                   ; 3
    bpl    LF77F                 ; 2³
    stx    $AE                   ; 3
    lda    #$FF                  ; 2
LF77F:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
LF783:
    lda    $A6                   ; 3
    cpy    $F3                   ; 3
    bcc    LF7DC                 ; 2³
    bne    LF7DA                 ; 2³
    cpy    #0                    ; 2
    beq    LF7DA                 ; 2³
    lsr                          ; 2
    and    #$78                  ; 2
    tay                          ; 2
    lda    LFD08,Y               ; 4
    cmp    #$20                  ; 2
    beq    LF7D6                 ; 2³
    sta    $E7                   ; 3
    lda    #4                    ; 2
    sta    $F0                   ; 3
    lda    #0                    ; 2
    sta    $E8                   ; 3
    lda    $98                   ; 3
    eor    #$FF                  ; 2
    lsr                          ; 2
    clc                          ; 2
    sbc    $98                   ; 3
    rol    $E8                   ; 5
    asl                          ; 2
    rol    $E8                   ; 5
    bit    $E7                   ; 3
    bvc    LF7B8                 ; 2³
    asl                          ; 2
    rol    $E8                   ; 5
LF7B8:
    asl                          ; 2
    rol    $FC                   ; 5
    asl                          ; 2
    rol    $FC                   ; 5
    bit    $E7                   ; 3
    bmi    LF7C9                 ; 2³
    lda    $EA                   ; 3
    adc    $E8                   ; 3
    jmp    LF7D4                 ; 3

LF7C9:
    lda    #1                    ; 2
    sbc    $FC                   ; 3
    sta    $FC                   ; 3
    lda    $EA                   ; 3
    sec                          ; 2
    sbc    $E8                   ; 3
LF7D4:
    sta    $EA                   ; 3
LF7D6:
    ldy    $EC                   ; 3
    lda    $A6                   ; 3
LF7DA:
    asl                          ; 2
    asl                          ; 2
LF7DC:
    sta    $F1                   ; 3
    lda    LFCED,Y               ; 4
    sta    $BA                   ; 3
    sec                          ; 2
    sbc    LFCEC,Y               ; 4
    tay                          ; 2
    lda    LFEEA,Y               ; 4
    tay                          ; 2
    lda    $EA                   ; 3
LF7EE:
    sta    $E9                   ; 3
    clc                          ; 2
    adc    $ED                   ; 3
    sta    $ED                   ; 3
    lda    $E9                   ; 3
    bpl    LF7FD                 ; 2³
    bcs    LF801                 ; 2³+1
    dec    $EE                   ; 5
LF7FD:
    bcc    LF801                 ; 2³+1
    inc    $EE                   ; 5
LF801:
    clc                          ; 2
    adc    #8                    ; 2
    sta    $C8,X                 ; 4
    cpx    $EF                   ; 3
    beq    LF857                 ; 2³
LF80A:
    inx                          ; 2
    cpx    $BA                   ; 3
    beq    LF83E                 ; 2³
    lda    LFCF5,Y               ; 4
    bit    $F1                   ; 3
    bvc    LF831                 ; 2³
    bpl    LF81B                 ; 2³
    clc                          ; 2
    bcc    LF81E                 ; 3   always branch

LF81B:
    eor    #$FF                  ; 2
    sec                          ; 2
LF81E:
    adc    $EA                   ; 3
    iny                          ; 2
LF821:
    dec    $F0                   ; 5
    bne    LF7EE                 ; 2³+1
    clc                          ; 2
    adc    $FC                   ; 3
    pha                          ; 3
    lda    #4                    ; 2
    sta    $F0                   ; 3
    pla                          ; 4
    jmp    LF7EE                 ; 3

LF831:
    lda    $EA                   ; 3
    bvc    LF821                 ; 3   always branch

LF835:
    lda    $EE                   ; 3
    sta    $E8                   ; 3
    lda    $ED                   ; 3
    jmp    LF8D6                 ; 3

LF83E:
    inc    $EC                   ; 5
    ldy    $EC                   ; 3
    cpy    #8                    ; 2
    bcs    LF835                 ; 2³
    lda    #3                    ; 2
    bit    $F1                   ; 3
    bvc    LF854                 ; 2³
    bmi    LF850                 ; 2³
    lda    #$FD                  ; 2
LF850:
    adc    $EA                   ; 3
    sta    $EA                   ; 3
LF854:
    jmp    LF783                 ; 3

LF857:
    sty    $B9                   ; 3
    ldy    $8A                   ; 3
    lda.wy $9B,Y                 ; 4
    bne    LF863                 ; 2³
    jmp    LF923                 ; 3

LF863:
    lsr                          ; 2
    and    #$08                  ; 2
    php                          ; 3
    bne    LF86D                 ; 2³
    lda    #8                    ; 2
    bne    LF873                 ; 3   always branch

LF86D:
    lda    #$0D                  ; 2
    bcs    LF873                 ; 2³
    lda    #3                    ; 2
LF873:
    ror    $F9                   ; 5
    sec                          ; 2
    sbc    $C8,X                 ; 4
    sta    $EB                   ; 3
    lda    #0                    ; 2
    sta    $E8                   ; 3
    plp                          ; 4
    beq    LF895                 ; 2³
    txa                          ; 2
    eor    #$1F                  ; 2
    sta    $F8                   ; 3
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    $F8                   ; 3
    sbc    #$24                  ; 2
    bit    $F9                   ; 3
    bmi    LF895                 ; 2³
    eor    #$FF                  ; 2
    dec    $E8                   ; 5
LF895:
    clc                          ; 2
    adc    $ED                   ; 3
    sta    $E7                   ; 3
    lda    $EE                   ; 3
    adc    $E8                   ; 3
    sta    $E8                   ; 3
    lda    $97                   ; 3
    and    #$03                  ; 2
    beq    LF8B7                 ; 2³
    lsr                          ; 2
    beq    LF8B2                 ; 2³
    lda    #0                    ; 2
    bcc    LF8BA                 ; 2³
    sbc    $EB                   ; 3
    jmp    LF8BA                 ; 3

LF8B2:
    lda    $EB                   ; 3
    jmp    LF8BA                 ; 3

LF8B7:
    lda    $EB                   ; 3
    asl                          ; 2
LF8BA:
    clc                          ; 2
    adc    #$0A                  ; 2
    sta    $EB                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    bit    $EB                   ; 3
    bpl    LF8D0                 ; 2³
    ora    #$C0                  ; 2
    adc    $E7                   ; 3
    bcs    LF8D6                 ; 2³
    dec    $E8                   ; 5
    bcc    LF8D6                 ; 3   always branch

LF8D0:
    adc    $E7                   ; 3
    bcc    LF8D6                 ; 2³
    inc    $E8                   ; 5
LF8D6:
    lsr    $E8                   ; 5
    ror                          ; 2
    lsr    $E8                   ; 5
    ror                          ; 2
    sta    $A2                   ; 3
    clc                          ; 2
    adc    $AE                   ; 3
    cpx    #$1A                  ; 2
    bcs    LF949                 ; 2³+1
    adc    #$3C                  ; 2
    ldy    $8A                   ; 3
    cpy    #2                    ; 2
    bcs    LF8EF                 ; 2³
    sbc    #3                    ; 2
LF8EF:
    cmp    #$E0                  ; 2
    bcc    LF8F5                 ; 2³
    lda    #0                    ; 2
LF8F5:
    cmp    #$78                  ; 2
    bcc    LF8FB                 ; 2³
    lda    #$77                  ; 2
LF8FB:
    jsr    LFC81                 ; 6
    ldy    $8A                   ; 3
    sta.wy $83,Y                 ; 5
    lda    $FA                   ; 3
    beq    LF90E                 ; 2³
    lsr                          ; 2
    bne    LF91D                 ; 2³
    cpy    #4                    ; 2
    bcs    LF923                 ; 2³
LF90E:
    lda.wy $9B,Y                 ; 4
    and    #$11                  ; 2
    ora    #$46                  ; 2
    sta.wy $9B,Y                 ; 5
    lda    LFCA8,Y               ; 4
    bne    LF930                 ; 3   always branch

LF91D:
    lda    LFCB0,Y               ; 4
    bne    LF930                 ; 3   always branch

LF923:
    lda    #4                    ; 2
    sta.wy $83,Y                 ; 5
    lda    #$97                  ; 2
    cpy    #6                    ; 2
    bcc    LF930                 ; 2³
    lda    #$8E                  ; 2
LF930:
    sec                          ; 2
    sbc    $97                   ; 3
    sta.wy $8B,Y                 ; 5
    inc    $8A                   ; 5
    ldy    $8A                   ; 3
    lda    ($BB),Y               ; 5
    sta    $97                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    $EF                   ; 3
    dec    $EF                   ; 5
    ldy    $B9                   ; 3
    jmp    LF80A                 ; 3

LF949:
    adc    #$58                  ; 2
    sta    $F4                   ; 3
    clc                          ; 2
    lda    $AE                   ; 3
    adc    #$41                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $E7                   ; 3
    lda    $AE                   ; 3    do car Hpos
    clc                          ; 2
    adc    #$40                  ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    $E7                   ; 3
    eor    #$FF                  ; 2
    adc    #$5D                  ; 2
    jsr    LFC81                 ; 6   update where to position car
    sta    $E2                   ; 3
    lda    $F4                   ; 3
    jsr    LFC81                 ; 6
    sta    $F7                   ; 3
    lda    #0                    ; 2
    sta    $F9                   ; 3
    sta    $BD                   ; 3
    sta    $BE                   ; 3
    ldy    #6                    ; 2
    sty    $8A                   ; 3
    dec    $BB                   ; 5
    and    $95                   ; 3
    bne    LF9A1                 ; 2³
    lda    $98                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    ldx    $96                   ; 3
    cpx    #$20                  ; 2
    bcc    LF994                 ; 2³
    lda    $B0                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
LF994:
    and    #$08                  ; 2
    sta    $C2                   ; 3
    lda    $B0                   ; 3
    asl                          ; 2
    and    #$04                  ; 2
    ora    $C2                   ; 3
    sta    $C2                   ; 3
LF9A1:
    lda    $F4                   ; 3
    jsr    LFC81                 ; 6
    sta    $C6                   ; 3
    ldx    #2                    ; 2
LF9AA:
    lda    $F5,X                 ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMP0,X                ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    iny                          ; 2
LF9B4:
    dey                          ; 2
    bne    LF9B4                 ; 2³
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LF9AA                 ; 2³
    ldy    $FB                   ; 3
    ldx    #1                    ; 2
LF9C2:
    lda    LFE09,Y               ; 4
    sta    COLUP0,X              ; 4
    lda    #7                    ; 2
    sta    NUSIZ0,X              ; 4
    lda    #$20                  ; 2
    sta    VDELP0,X              ; 4
    dex                          ; 2
    bpl    LF9C2                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    #$1A                  ; 2
LF9D8:
    lda    $C8,X                 ; 4
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    $E4,X                 ; 4
    dex                          ; 2
    bpl    LF9D8                 ; 2³
    sta    HMCLR                 ; 3
    lda    $98                   ; 3
    lsr                          ; 2
    and    #$78                  ; 2
    sta    $C3                   ; 3
    lda    $A5                   ; 3
    and    #$07                  ; 2
    cmp    #7                    ; 2
    bne    LF9F5                 ; 2³
    lda    #6                    ; 2
LF9F5:
    sta    $C4                   ; 3
    ora    $C3                   ; 3
    tay                          ; 2
    lda    LFD01,Y               ; 4
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $C4                   ; 3
    asl                          ; 2
    eor    #$F1                  ; 2
    sta    $C5                   ; 3
    adc    $C8,X                 ; 4
    sta    $C8,X                 ; 4
    lda    $E4,X                 ; 4
    sec                          ; 2
    sbc    $C5                   ; 3
    sta    $E4,X                 ; 4
    dec    $C4                   ; 5
    bmi    LFA2A                 ; 2³
    lda    LFD00,Y               ; 4
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $C8,X                 ; 4
    sec                          ; 2
    sbc    $C5                   ; 3
    sta    $C8,X                 ; 4
    lda    $E4,X                 ; 4
    clc                          ; 2
    adc    $C5                   ; 3
    sta    $E4,X                 ; 4
LFA2A:
    lda    $96                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    #9                    ; 2
    bcc    LFA35                 ; 2³
    lda    #9                    ; 2
LFA35:
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$38                  ; 2
    sta    $C1                   ; 3
    jmp    LF193                 ; 3

LFA3F:
    sta    GRP0                  ; 3
    ldx    #$F0                  ; 2
    lda    #$72                  ; 2
    sta    HMBL                  ; 3
    lsr                          ; 2
    sta    CTRLPF                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    RESBL                 ; 3
    stx    HMP1                  ; 3
    dex                          ; 2
    stx    HMP0                  ; 3
    sty    REFP0                 ; 3
    sty    REFP1                 ; 3
    lda    #$42                  ; 2
    sta    COLUPF                ; 3
    ldy    #$68                  ; 2
    sty    $B9                   ; 3
    ldx    #2                    ; 2
    bit    $B9                   ; 3
    jsr    LFC13                 ; 6
    lda    #3                    ; 2
    sta    VDELP1                ; 3
    sta    VDELP0                ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #<BlankDigit-1        ; 2   #$58
    ldx    $F3                   ; 3
    bne    LFA7B                 ; 2³
    sta    $F3                   ; 3
LFA7B:
    lda    #$FF                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    PF2                   ; 3
    sta    $F5                   ; 3
    lda    $A7                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    $94                   ; 3
    sta    $F8                   ; 3
    ldx    #$F4                  ; 2
LFA92:
    lda    $F5,X                 ; 4
    ora    $F8                   ; 3
    sta    $F5,X                 ; 4
    and    #$F8                  ; 2
    inx                          ; 2
    cmp    #$48                  ; 2
    bne    LFAA2                 ; 2³
    inx                          ; 2
    bne    LFA92                 ; 2³
LFAA2:
    pha                          ; 3
    pla                          ; 4
    inx                          ; 2
    bmi    LFAA2                 ; 2³
    lda    #$28                  ; 2   color around score
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    jsr    LFC57                 ; 6
    sty    $F5                   ; 3
    ldx    #5                    ; 2
    sta    ENABL                 ; 3   A=$FF, enable
    jsr    LFC12                 ; 6
    lda    $B0                   ; 3
    and    #$20                  ; 2
    ora    $AF                   ; 3
    sta    $F9                   ; 3
    lda    dayNumber             ; 3
    cmp    #$10                  ; 2
    bcs    LFAD1                 ; 2³
    lda    $F1                   ; 3
    sta    $F3                   ; 3
    lda    #<GapDigit-1          ; 2   #$72
    sta    $F1                   ; 3
LFAD1:
    bcc    LFAD9                 ; 2³
    lda    #0                    ; 2
    sta    ENABL                 ; 3
    pha                          ; 3
    pla                          ; 4
LFAD9:
    lda    $AF                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ora    $AB                   ; 3
    ora    $AC                   ; 3
    beq    LFAFD                 ; 2³
    nop                          ; 2
    ldx    #<Trophy-1            ; 2   #$68
    lda    dayNumber             ; 3
    cmp    #5                    ; 2
    bcs    LFAEE                 ; 2³
    ldx    #<DiplayCar-1         ; 2   #$60
LFAEE:
    lda    $B1                   ; 3
    and    #$3F                  ; 2
    ora    $F9                   ; 3
    cmp    #8                    ; 2
    bcs    LFAFA                 ; 2³
    ldx    #$58                  ; 2
LFAFA:
    jmp    LFB13                 ; 3

LFAFD:
    ldx    #<RightFlags-1        ; 2   #$DF
    lda    $F9                   ; 3
    beq    LFB05                 ; 2³
    ldx    #<LeftFlags-1         ; 2
LFB05:
    stx    $EF                   ; 3
    stx    $ED                   ; 3
    stx    $EB                   ; 3
    stx    $E9                   ; 3
    lda    #$C8                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
LFB13:
    stx    $EF                   ; 3
    jsr    LFC57                 ; 6
    ldy    #7                    ; 2   loop counter
    lda    $B0                   ; 3   XXXX Xxxx   leftmost five bits logo offset
    and    $AF                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$1F                  ; 2
    cmp    #$14                  ; 2     max value
    bcs    LFB30                 ; 2³
    ldy    #0                    ; 2
    cmp    #$0C                  ; 2
    bcc    LFB30                 ; 2³
    sbc    #$0C                  ; 2
    tay                          ; 2
LFB30:
    sty    $E7                   ; 3
    tya                          ; 2
    eor    #$07                  ; 2
    sta    $E8                   ; 3
    lda    #<CopyrightSix        ; 2
    ldx    #12                   ; 2   12 ram locations...
    sec                          ; 2
    ldy    #>CopyrightSix        ; 2
.loopCopyrightPtrs:
    sty    $E8,X                 ; 4   high nibble
    sta    $E7,X                 ; 4   low nibble
    sbc    #8                    ; 2   subtract height, adjusts low pointer for next digit
    dex                          ; 2
    dex                          ; 2
    bne    .loopCopyrightPtrs    ; 2³
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    stx    COLUPF                ;3  @6
    stx    PF2                   ;3  @9
    lda    #$0C                  ;2  @11
    sta    COLUP0                ;3  @14
    sta    COLUP1                ;3  @17
    lda    #$41                  ;2  @19
    ldy    #$F0                  ;2  @21
    sta.w  CTRLPF                ;4  @25
    sta    RESP0                 ;3  @28
    sta    RESP1                 ;3  @31
    sta    RESBL                 ;3  @34
    sta    HMBL                  ;3  @37
    sty    HMP0                  ;3  @40
    sta    WSYNC                 ;3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    #6                    ; 2
LFB71:
    dey                          ; 2
    bne    LFB71                 ; 2³
    sta    HMCLR                 ; 3
LFB76:
    ldy    $E7                   ; 3
    lda    ($F3),Y               ; 5
    sta    $F9                   ; 3
    lax    ($F1),Y               ; 5   illegal opcode, save a byte
    lda    ($E9),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    ($EB),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($ED),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($EF),Y               ; 5
    ldy    $F9                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    $E7                   ; 5   scrolling logo offset, but this is a temp register
    bpl    LFB76                 ; 2³
    lda    #$80                  ; 2
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    asl                          ;2  @5
    sta    GRP0                  ;3  @8
    sta    GRP1                  ;3  @11
    sta    GRP0                  ;3  @14
    lda    #$78                  ;2  @16
    sta    PF1                   ;3  @19
    lda    #$31                  ;2  @21
    sta    CTRLPF                ;3  @24
    sta    NUSIZ1                ;3  @27
    sta    HMCLR                 ;3  @30
    lsr                          ;2  @32
    sta    HMBL                  ;3  @35
    ldy    #7                    ;2  @37
    sty    ENABL                 ;3  @40
LFBC4:
    ldx    LogoFive,Y            ;4  @44/61
    lda    LogoOne,Y             ;4  @48/65
    sta    GRP0                  ;3  @51/68
    sta    WSYNC                 ;3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    LogoColorBars,Y       ;4  @7
    sta    COLUPF                ;3  @10
    lda    LogoTwo,Y             ;4  @14
    sta    GRP1                  ;3  @17
    lda    LogoThree,Y           ;4  @21
    sta    GRP0                  ;3  @24
    inc    $F8                   ;5  @29
    lda    LogoFour,Y            ;4  @33
    sta    GRP1                  ;3  @36
    stx    GRP0                  ;3  @39
    sta    GRP1                  ;3  @42
    lda    #0                    ;2  @44
    sta    COLUPF                ;3  @47
    dey                          ;2  @49
    dec    $E8                   ;5  @54
    bpl    LFBC4                 ;2³ @56/57
    ldy    #$2F                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    VBLANK                ; 3
    sta    GRP0                  ; 3  clear
    sta    GRP1                  ; 3
    ldx    #$19                  ; 2
    sta    PF1                   ; 3  clear
    sta    GRP0                  ; 3
    sta    RESBL                 ; 3
    sty    HMBL                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    TIM64T                ; 4
    jmp    LF28D                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;odometer        = $A8 ; $A8 - $AA
;carsRemaining   = $AB ; $AB - $AC
;dayNumber       = $AD

LFC12 SUBROUTINE
    clv                          ; 2
LFC13 SUBROUTINE
    clc                          ; 2
    ldy    #10                   ; 2
LFC16:
    lda    #$FF                  ; 2
    sta.wy $EA,Y                 ; 5
    lda    $A8,X                 ; 4   X=5 load day number, X=2 load odometer
    bcs    LFC28                 ; 2³
    lsr                          ; 2
    cpx    #4                    ; 2
    bne    LFC25                 ; 2³
    clv                          ; 2
LFC25:
    sec                          ; 2
    bcs    LFC2D                 ; 3   always branch

LFC28:
    dex                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
LFC2D:
    and    #$78                  ; 2
    bne    LFC37                 ; 2³
    bvs    LFC39                 ; 2³
    lda    #$58                  ; 2
    bne    LFC3B                 ; 3   always branch

LFC37:
    bit    $F4                   ; 3
LFC39:
    nop                          ; 2
    nop                          ; 2
LFC3B:
    sta.wy $E9,Y                 ; 5
    dey                          ; 2
    dey                          ; 2
    bpl    LFC16                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFC57 SUBROUTINE
    ldy    #8                    ; 2
    sty    $F8                   ; 3
    iny                          ; 2
    lda    ($F3),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F1),Y               ; 5
    ldx    #3                    ; 2
    stx    PF2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta.w  GRP1                  ;4  @4
LFC6B:
    lda    ($EF),Y               ;5  @9
    sta    GRP0                  ;3  @12
    lda    ($EB),Y               ;5  @17
    sta    $F9                   ;3  @20
    lda    ($ED),Y               ;5  @25
    tax                          ;2  @27
    lda    ($E9),Y               ;5  @32
    eor    $F5                   ;3  @35
    tay                          ;2  @37
    lda.w  $F9                   ;4  @41
    stx    GRP1                  ;3  @44
    sta    GRP0                  ;3  @47
    sty    GRP1                  ;3  @50
    stx    GRP0                  ;3  @53
    ldy    $F8                   ;3  @56
    lda    ($F3),Y               ;5  @61
    sta    GRP0                  ;3  @64
    lda    ($F1),Y               ;5  @69
    sta    GRP1                  ;3  @72
;---------------------------------------
    dec    $F8                   ;5  @1
    bpl    LFC6B                 ;2³ @3/4
    sty    GRP1                  ;3  @7
    sty    GRP0                  ;3  @10
    sty    GRP1                  ;3  @13
    lda    #$FF                  ;2  @15
    sta    PF2                   ;3  @18
    rts                          ;6  @24

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFC81 SUBROUTINE

;save 4 bytes, 10 cycles
;  keep upper nibble in temp,
;  reload original value, swap its nibbles,
;  and then add the upper nibble from temp to it.
;  the rest of the routine is left untouched...

;new code
    tay                          ; 2
    and    #$F0                  ; 2
    sta    $E7                   ; 3
    tya                          ; 2
    asl                          ; 2
    adc    #$80                  ; 2
    rol                          ; 2
    asl                          ; 2
    adc    #$80                  ; 2
    rol                          ; 2
    clc                          ; 2
    adc    $E7                   ; 3  @26

;old code
;    tay                          ; 2
;    and    #$0F                  ; 2
;    sta    $E7                   ; 3
;    tya                          ; 2
;    lsr                          ; 2
;    lsr                          ; 2
;    lsr                          ; 2
;    lsr                          ; 2
;    sta    $E8                   ; 3
;    clc                          ; 2
;    adc    $E7                   ; 3
;    asl                          ; 2
;    asl                          ; 2
;    asl                          ; 2
;    asl                          ; 2
;    ora    $E8                   ; 3  @36

    bcs    LFC98                 ; 2³
    cmp    #$F0                  ; 2
    bcc    LFC9B                 ; 2³
LFC98:
    adc    #$10                  ; 2
    clc                          ; 2
LFC9B:
    adc    #1                    ; 2
    eor    #$70                  ; 2
    rts                          ; 6

LFC9C SUBROUTINE
    lsr                          ; 2
    pha                          ; 3
    clc                          ; 2
    adc    LFDEF,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    pla                          ; 4
;    rts                          ; 6

       ORG $FCA8

LFCA8:
    .byte $60 ; | XX     | $FCA8   shared for RTS
    .byte $60 ; | XX     | $FCA9
    .byte $CD ; |XX  XX X| $FCAA
    .byte $CD ; |XX  XX X| $FCAB
    .byte $BC ; |X XXXX  | $FCAC
    .byte $BC ; |X XXXX  | $FCAD
    .byte $E2 ; |XXX   X | $FCAE
    .byte $E2 ; |XXX   X | $FCAF
LFCB0:
    .byte $47 ; | X   XXX| $FCB0
    .byte $76 ; | XXX XX | $FCB1
    .byte $A5 ; |X X  X X| $FCB2
    .byte $B1 ; |X XX   X| $FCB3
    .byte $D6 ; |XX X XX | $FCB4
    .byte $DE ; |XX XXXX | $FCB5
    .byte $E2 ; |XXX   X | $FCB6
    .byte $E2 ; |XXX   X | $FCB7

LFCB8:
    .byte $0A ; |    X X | $FCB8   car and road border colors
    .byte $0A ; |    X X | $FCB9
    .byte $0A ; |    X X | $FCBA
    .byte $0A ; |    X X | $FCBB
    .byte $0A ; |    X X | $FCBC
    .byte $0A ; |    X X | $FCBD
    .byte $0A ; |    X X | $FCBE
    .byte $0A ; |    X X | $FCBF
    .byte $0A ; |    X X | $FCC0
    .byte $0A ; |    X X | $FCC1
    .byte $0A ; |    X X | $FCC2
    .byte $08 ; |    X   | $FCC3
    .byte $08 ; |    X   | $FCC4
    .byte $06 ; |     XX | $FCC5
    .byte $06 ; |     XX | $FCC6
    .byte $04 ; |     X  | $FCC7
    .byte $04 ; |     X  | $FCC8
    .byte $04 ; |     X  | $FCC9
    .byte $02 ; |      X | $FCCA
    .byte $02 ; |      X | $FCCB
    .byte $02 ; |      X | $FCCC
    .byte $02 ; |      X | $FCCD
    .byte $02 ; |      X | $FCCE
    .byte $02 ; |      X | $FCCF
    .byte $02 ; |      X | $FCD0
    .byte $02 ; |      X | $FCD1
    .byte $02 ; |      X | $FCD2
    .byte $02 ; |      X | $FCD3
    .byte $02 ; |      X | $FCD4
    .byte $02 ; |      X | $FCD5
    .byte $02 ; |      X | $FCD6

SkyColorTab:
    .byte $04 ; |     X  | $FCD7    sky colors
    .byte $03 ; |      XX| $FCD8
    .byte $02 ; |      X | $FCD9
    .byte $02 ; |      X | $FCDA
    .byte $03 ; |      XX| $FCDB
    .byte $03 ; |      XX| $FCDC
    .byte $03 ; |      XX| $FCDD
    .byte $03 ; |      XX| $FCDE
    .byte $03 ; |      XX| $FCDF
    .byte $40 ; | X      | $FCE0
    .byte $82 ; |X     X | $FCE1
    .byte $84 ; |X    X  | $FCE2
    .byte $84 ; |X    X  | $FCE3
    .byte $84 ; |X    X  | $FCE4
    .byte $84 ; |X    X  | $FCE5
    .byte $82 ; |X     X | $FCE6

HillTwo:
    .byte $FE ; |XXXXXXX | $FCE7
    .byte $FC ; |XXXXXX  | $FCE8
    .byte $F8 ; |XXXXX   | $FCE9
    .byte $70 ; | XXX    | $FCEA
    .byte $40 ; | X      | $FCEB
;    .byte $00 ; |        | $FCEC

LFCEC:
    .byte $00 ; |        | $FCEC   shared
LFCED:
    .byte $06 ; |     XX | $FCED
    .byte $0B ; |    X XX| $FCEE
    .byte $0F ; |    XXXX| $FCEF
    .byte $13 ; |   X  XX| $FCF0
    .byte $16 ; |   X XX | $FCF1
    .byte $18 ; |   XX   | $FCF2
    .byte $19 ; |   XX  X| $FCF3
    .byte $1A ; |   XX X | $FCF4
LFCF5:
    .byte $01 ; |       X| $FCF5
    .byte $02 ; |      X | $FCF6
    .byte $00 ; |        | $FCF7
    .byte $01 ; |       X| $FCF8
    .byte $02 ; |      X | $FCF9
    .byte $02 ; |      X | $FCFA
    .byte $00 ; |        | $FCFB
    .byte $01 ; |       X| $FCFC
    .byte $01 ; |       X| $FCFD
    .byte $02 ; |      X | $FCFE
    .byte $02 ; |      X | $FCFF

       ORG $FD00

LFD00:
    .byte $00 ; |        | $FD00
LFD01:
    .byte $00 ; |        | $FD01
    .byte $1A ; |   XX X | $FD02
    .byte $2F ; |  X XXXX| $FD03
    .byte $3F ; |  XXXXXX| $FD04
    .byte $4B ; | X  X XX| $FD05
    .byte $56 ; | X X XX | $FD06
    .byte $5C ; | X XXX  | $FD07
LFD08:
    .byte $20 ; |  X     | $FD08
    .byte $00 ; |        | $FD09
    .byte $1B ; |   XX XX| $FD0A
    .byte $30 ; |  XX    | $FD0B
    .byte $40 ; | X      | $FD0C
    .byte $4C ; | X  XX  | $FD0D
    .byte $56 ; | X X XX | $FD0E
    .byte $5C ; | X XXX  | $FD0F
    .byte $81 ; |X      X| $FD10
    .byte $06 ; |     XX | $FD11
    .byte $1C ; |   XXX  | $FD12
    .byte $31 ; |  XX   X| $FD13
    .byte $41 ; | X     X| $FD14
    .byte $4D ; | X  XX X| $FD15
    .byte $57 ; | X X XXX| $FD16
    .byte $5D ; | X XXX X| $FD17
    .byte $20 ; |  X     | $FD18
    .byte $06 ; |     XX | $FD19
    .byte $1D ; |   XXX X| $FD1A
    .byte $32 ; |  XX  X | $FD1B
    .byte $42 ; | X    X | $FD1C
    .byte $4D ; | X  XX X| $FD1D
    .byte $57 ; | X X XXX| $FD1E
    .byte $5D ; | X XXX X| $FD1F
    .byte $21 ; |  X    X| $FD20
    .byte $07 ; |     XXX| $FD21
    .byte $1F ; |   XXXXX| $FD22
    .byte $33 ; |  XX  XX| $FD23
    .byte $43 ; | X    XX| $FD24
    .byte $4E ; | X  XXX | $FD25
    .byte $58 ; | X XX   | $FD26
    .byte $5D ; | X XXX X| $FD27
    .byte $21 ; |  X    X| $FD28
    .byte $09 ; |    X  X| $FD29
    .byte $20 ; |  X     | $FD2A
    .byte $34 ; |  XX X  | $FD2B
    .byte $43 ; | X    XX| $FD2C
    .byte $4F ; | X  XXXX| $FD2D
    .byte $58 ; | X XX   | $FD2E
    .byte $5E ; | X XXXX | $FD2F
    .byte $20 ; |  X     | $FD30
    .byte $0B ; |    X XX| $FD31
    .byte $22 ; |  X   X | $FD32
    .byte $35 ; |  XX X X| $FD33
    .byte $44 ; | X   X  | $FD34
    .byte $4F ; | X  XXXX| $FD35
    .byte $59 ; | X XX  X| $FD36
    .byte $5E ; | X XXXX | $FD37
    .byte $21 ; |  X    X| $FD38
    .byte $0C ; |    XX  | $FD39
    .byte $23 ; |  X   XX| $FD3A
    .byte $36 ; |  XX XX | $FD3B
    .byte $45 ; | X   X X| $FD3C
    .byte $50 ; | X X    | $FD3D
    .byte $59 ; | X XX  X| $FD3E
    .byte $5F ; | X XXXXX| $FD3F
    .byte $41 ; | X     X| $FD40
    .byte $0E ; |    XXX | $FD41
    .byte $24 ; |  X  X  | $FD42
    .byte $37 ; |  XX XXX| $FD43
    .byte $45 ; | X   X X| $FD44
    .byte $51 ; | X X   X| $FD45
    .byte $59 ; | X XX  X| $FD46
    .byte $5F ; | X XXXXX| $FD47
    .byte $20 ; |  X     | $FD48
    .byte $10 ; |   X    | $FD49
    .byte $26 ; |  X  XX | $FD4A
    .byte $38 ; |  XXX   | $FD4B
    .byte $46 ; | X   XX | $FD4C
    .byte $51 ; | X X   X| $FD4D
    .byte $5A ; | X XX X | $FD4E
    .byte $5F ; | X XXXXX| $FD4F
    .byte $81 ; |X      X| $FD50
    .byte $11 ; |   X   X| $FD51
    .byte $27 ; |  X  XXX| $FD52
    .byte $3A ; |  XXX X | $FD53
    .byte $47 ; | X   XXX| $FD54
    .byte $52 ; | X X  X | $FD55
    .byte $5A ; | X XX X | $FD56
    .byte $60 ; | XX     | $FD57
    .byte $20 ; |  X     | $FD58
    .byte $13 ; |   X  XX| $FD59
    .byte $28 ; |  X X   | $FD5A
    .byte $3B ; |  XXX XX| $FD5B
    .byte $48 ; | X  X   | $FD5C
    .byte $52 ; | X X  X | $FD5D
    .byte $5B ; | X XX XX| $FD5E
    .byte $60 ; | XX     | $FD5F
    .byte $21 ; |  X    X| $FD60
    .byte $14 ; |   X X  | $FD61
    .byte $2A ; |  X X X | $FD62
    .byte $3C ; |  XXXX  | $FD63
    .byte $49 ; | X  X  X| $FD64
    .byte $53 ; | X X  XX| $FD65
    .byte $5B ; | X XX XX| $FD66
    .byte $60 ; | XX     | $FD67
    .byte $81 ; |X      X| $FD68
    .byte $15 ; |   X X X| $FD69
    .byte $2B ; |  X X XX| $FD6A
    .byte $3D ; |  XXXX X| $FD6B
    .byte $49 ; | X  X  X| $FD6C
    .byte $54 ; | X X X  | $FD6D
    .byte $5B ; | X XX XX| $FD6E
    .byte $60 ; | XX     | $FD6F
    .byte $C1 ; |XX     X| $FD70
    .byte $17 ; |   X XXX| $FD71
    .byte $2C ; |  X XX  | $FD72
    .byte $3E ; |  XXXXX | $FD73
    .byte $4A ; | X  X X | $FD74
    .byte $54 ; | X X X  | $FD75
    .byte $5B ; | X XX XX| $FD76
    .byte $60 ; | XX     | $FD77
    .byte $81 ; |X      X| $FD78
    .byte $18 ; |   XX   | $FD79
    .byte $2D ; |  X XX X| $FD7A
    .byte $3F ; |  XXXXXX| $FD7B
    .byte $4B ; | X  X XX| $FD7C
    .byte $55 ; | X X X X| $FD7D
    .byte $5B ; | X XX XX| $FD7E
    .byte $60 ; | XX     | $FD7F
    .byte $20 ; |  X     | $FD80

LFD81:
    .byte $00,$00,$00,$00  ; $FD81
    .byte $01,$01,$01,$01  ; $FD85
    .byte $02,$02,$02,$02  ; $FD89
    .byte $03,$03,$03,$03  ; $FD8D
    .byte $04,$04,$04,$04  ; $FD91
    .byte $05,$05,$05,$05  ; $FD95
    .byte $06,$06,$06,$06  ; $FD99
    .byte $07,$07,$07,$07  ; $FD9D
    .byte $08,$08,$08,$08  ; $FDA1
    .byte $09,$09,$09,$09  ; $FDA5
    .byte $0A,$0A,$0A,$0A  ; $FDA9
    .byte $0B,$0B,$0B,$0B  ; $FDAD
    .byte $0C,$0C,$0C,$0C  ; $FDB1
    .byte $0D,$0D,$0D,$0D  ; $FDB5
    .byte $0E,$0E,$0E,$0E  ; $FDB9
    .byte $0F,$0F,$0F,$0F  ; $FDBD
    .byte $10,$10,$10,$10  ; $FDC1
    .byte $11,$11,$11,$11  ; $FDC5
    .byte $12,$12,$12,$12  ; $FDC9
    .byte $13,$13,$13,$13  ; $FDCD
    .byte $14,$14,$14,$14  ; $FDD1
    .byte $15,$15,$15,$15  ; $FDD5
    .byte $16,$16,$16,$16  ; $FDD9
    .byte $17,$17,$17,$17  ; $FDDD
    .byte $18,$18,$18,$18  ; $FDE1
    .byte $19,$19,$19,$19  ; $FDE5

HillOne:
    .byte $FF ; |XXXXXXXX| $FDE9
    .byte $FE ; |XXXXXXX | $FDEA
    .byte $FC ; |XXXXXX  | $FDEB
    .byte $E8 ; |XXX X   | $FDEC
    .byte $C0 ; |XX      | $FDED
    .byte $80 ; |X       | $FDEE

LFDEF:
    .byte $00 ; |        | $FDEF   ADC,X
    .byte $08 ; |    X   | $FDF0
    .byte $04 ; |     X  | $FDF1
    .byte $0C ; |    XX  | $FDF2
    .byte $02 ; |      X | $FDF3
    .byte $0A ; |    X X | $FDF4
    .byte $06 ; |     XX | $FDF5
    .byte $0E ; |    XXX | $FDF6
    .byte $01 ; |       X| $FDF7
    .byte $09 ; |    X  X| $FDF8
    .byte $05 ; |     X X| $FDF9
    .byte $0D ; |    XX X| $FDFA
    .byte $03 ; |      XX| $FDFB
    .byte $0B ; |    X XX| $FDFC
    .byte $07 ; |     XXX| $FDFD
    .byte $0F ; |    XXXX| $FDFE

     NOP ; free byte

      ORG $FE00

LFE00:
    .byte <P1_31_Cycles  ; $FE00   indirect jump table
    .byte <P1_31_Cycles  ; $FE01
    .byte <P1_36_Cycles  ; $FE02
    .byte <P1_41_Cycles  ; $FE03
    .byte <P1_46_Cycles  ; $FE04
    .byte <P1_51_Cycles  ; $FE05
    .byte <P1_56_Cycles  ; $FE06
    .byte <P1_61_Cycles  ; $FE07
    .byte <P1_66_Cycles  ; $FE08   #$00
LFE09:
    .byte $34 ; |  XX X  | $FE09
    .byte $06 ; |     XX | $FE0A
    .byte $02 ; |      X | $FE0B
    .byte $02 ; |      X | $FE0C
    .byte $06 ; |     XX | $FE0D
    .byte $06 ; |     XX | $FE0E
    .byte $06 ; |     XX | $FE0F
    .byte $06 ; |     XX | $FE10
    .byte $06 ; |     XX | $FE11
    .byte $00 ; |        | $FE12
    .byte $C0 ; |XX      | $FE13
    .byte $0C ; |    XX  | $FE14
    .byte $0C ; |    XX  | $FE15
    .byte $0A ; |    X X | $FE16
    .byte $E6 ; |XXX  XX | $FE17
    .byte $14 ; |   X X  | $FE18
;    .byte $00 ; |        | $FE19
;    .byte $00 ; |        | $FE1A
LFE19:
    .byte $00 ; |        | $FE19   shared
    .byte $00 ; |        | $FE1A   shared
    .byte $02 ; |      X | $FE1B
    .byte $02 ; |      X | $FE1C
    .byte $00 ; |        | $FE1D
    .byte $00 ; |        | $FE1E
    .byte $00 ; |        | $FE1F
    .byte $00 ; |        | $FE20
    .byte $00 ; |        | $FE21
    .byte $E0 ; |XXX     | $FE22
    .byte $D0 ; |XX X    | $FE23
    .byte $0E ; |    XXX | $FE24
    .byte $0E ; |    XXX | $FE25
    .byte $C0 ; |XX      | $FE26
    .byte $C0 ; |XX      | $FE27
    .byte $C0 ; |XX      | $FE28
LFE29:
    .byte $05 ; |     X X| $FE29   NUSIZ1
    .byte $05 ; |     X X| $FE2A
    .byte $00 ; |        | $FE2B
    .byte $00 ; |        | $FE2C
    .byte $00 ; |        | $FE2D
    .byte $00 ; |        | $FE2E
    .byte $00 ; |        | $FE2F   shared
CarGfx:
    .byte $00 ; |        | $FE30   space behind car
    .byte $00 ; |        | $FE31
    .byte $00 ; |        | $FE32
    .byte $00 ; |        | $FE33
    .byte $00 ; |        | $FE34
    .byte $00 ; |        | $FE35
    .byte $00 ; |        | $FE36
    .byte $00 ; |        | $FE37
    .byte $9A ; |X  XX X | $FE38
    .byte $7D ; | XXXXX X| $FE39
    .byte $BE ; |X XXXXX | $FE3A
    .byte $7D ; | XXXXX X| $FE3B
    .byte $BE ; |X XXXXX | $FE3C
    .byte $7D ; | XXXXX X| $FE3D
    .byte $BE ; |X XXXXX | $FE3E
    .byte $59 ; | X XX  X| $FE3F
    .byte $7E ; | XXXXXX | $FE40
    .byte $7E ; | XXXXXX | $FE41
    .byte $5A ; | X XX X | $FE42
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
    .byte $00 ; |        | $FE56
    .byte $00 ; |        | $FE57
    .byte $66 ; | XX  XX | $FE58
    .byte $66 ; | XX  XX | $FE59
    .byte $66 ; | XX  XX | $FE5A
    .byte $00 ; |        | $FE5B
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
LFE69:
    .byte $00 ; |        | $FE69
    .byte $58 ; | X XX   | $FE6A
    .byte $3E ; |  XXXXX | $FE6B
    .byte $7C ; | XXXXX  | $FE6C
    .byte $3E ; |  XXXXX | $FE6D
    .byte $7C ; | XXXXX  | $FE6E
    .byte $1A ; |   XX X | $FE6F
    .byte $7E ; | XXXXXX | $FE70
    .byte $18 ; |   XX   | $FE71
    .byte $00 ; |        | $FE72
    .byte $00 ; |        | $FE73
    .byte $00 ; |        | $FE74
    .byte $00 ; |        | $FE75
    .byte $00 ; |        | $FE76
LFE77:
    .byte $FF ; |XXXXXXXX| $FE77   AND table to presumable cut off height of the car
    .byte $FF ; |XXXXXXXX| $FE78
    .byte $FF ; |XXXXXXXX| $FE79
    .byte $FF ; |XXXXXXXX| $FE7A
    .byte $FF ; |XXXXXXXX| $FE7B
    .byte $FF ; |XXXXXXXX| $FE7C
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
    .byte $00 ; |        | $FE94
    .byte $00 ; |        | $FE95
    .byte $00 ; |        | $FE96
    .byte $00 ; |        | $FE97
    .byte $00 ; |        | $FE98
    .byte $00 ; |        | $FE99
    .byte $00 ; |        | $FE9A
    .byte $7D ; | XXXXX X| $FE9B
    .byte $BE ; |X XXXXX | $FE9C
    .byte $7D ; | XXXXX X| $FE9D
    .byte $BE ; |X XXXXX | $FE9E
    .byte $7E ; | XXXXXX | $FE9F
    .byte $18 ; |   XX   | $FEA0
    .byte $00 ; |        | $FEA1
    .byte $00 ; |        | $FEA2
    .byte $00 ; |        | $FEA3
    .byte $00 ; |        | $FEA4
    .byte $00 ; |        | $FEA5
    .byte $00 ; |        | $FEA6
    .byte $00 ; |        | $FEA7
    .byte $00 ; |        | $FEA8
    .byte $7C ; | XXXXX  | $FEA9
    .byte $3E ; |  XXXXX | $FEAA
    .byte $7C ; | XXXXX  | $FEAB
    .byte $18 ; |   XX   | $FEAC
    .byte $00 ; |        | $FEAD
    .byte $00 ; |        | $FEAE
    .byte $00 ; |        | $FEAF
    .byte $00 ; |        | $FEB0
    .byte $00 ; |        | $FEB1
    .byte $00 ; |        | $FEB2
    .byte $00 ; |        | $FEB3
    .byte $00 ; |        | $FEB4
    .byte $24 ; |  X  X  | $FEB5
    .byte $24 ; |  X  X  | $FEB6
    .byte $00 ; |        | $FEB7
    .byte $00 ; |        | $FEB8
    .byte $00 ; |        | $FEB9
    .byte $00 ; |        | $FEBA
    .byte $00 ; |        | $FEBB
    .byte $00 ; |        | $FEBC
    .byte $00 ; |        | $FEBD
    .byte $00 ; |        | $FEBE
    .byte $00 ; |        | $FEBF
    .byte $00 ; |        | $FEC0
    .byte $00 ; |        | $FEC1
    .byte $00 ; |        | $FEC2
    .byte $00 ; |        | $FEC3
    .byte $00 ; |        | $FEC4
    .byte $00 ; |        | $FEC5
    .byte $66 ; | XX  XX | $FEC6
    .byte $66 ; | XX  XX | $FEC7
    .byte $00 ; |        | $FEC8
    .byte $00 ; |        | $FEC9
    .byte $00 ; |        | $FECA
    .byte $00 ; |        | $FECB
    .byte $00 ; |        | $FECC
    .byte $00 ; |        | $FECD
    .byte $00 ; |        | $FECE
    .byte $38 ; |  XXX   | $FECF
    .byte $1C ; |   XXX  | $FED0
    .byte $18 ; |   XX   | $FED1
    .byte $00 ; |        | $FED2
    .byte $00 ; |        | $FED3
    .byte $00 ; |        | $FED4
    .byte $00 ; |        | $FED5
    .byte $00 ; |        | $FED6
    .byte $00 ; |        | $FED7
    .byte $3C ; |  XXXX  | $FED8
    .byte $18 ; |   XX   | $FED9
    .byte $00 ; |        | $FEDA
    .byte $00 ; |        | $FEDB
    .byte $00 ; |        | $FEDC
    .byte $18 ; |   XX   | $FEDD
    .byte $00 ; |        | $FEDE
    .byte $00 ; |        | $FEDF
    .byte $00 ; |        | $FEE0
    .byte $00 ; |        | $FEE1
    .byte $00 ; |        | $FEE2
    .byte $00 ; |        | $FEE3
    .byte $00 ; |        | $FEE4
    .byte $00 ; |        | $FEE5
    .byte $00 ; |        | $FEE6
    .byte $00 ; |        | $FEE7
    .byte $00 ; |        | $FEE8
    .byte $00 ; |        | $FEE9
;    .byte $00 ; |        | $FEEA
;    .byte $00 ; |        | $FEEB
;    .byte $00 ; |        | $FEEC
;    .byte $00 ; |        | $FEED

LFEEA:
    .byte $00 ; |        | $FEEA   shared
    .byte $00 ; |        | $FEEB   shared
    .byte $00 ; |        | $FEEC   shared
    .byte $00 ; |        | $FEED   shared
    .byte $07 ; |     XXX| $FEEE
    .byte $02 ; |      X | $FEEF
    .byte $06 ; |     XX | $FEF0
LFEF1:
    .byte $1A ; |   XX X | $FEF1   sunset colors
    .byte $18 ; |   XX   | $FEF2
    .byte $16 ; |   X XX | $FEF3
    .byte $14 ; |   X X  | $FEF4
    .byte $24 ; |  X  X  | $FEF5
    .byte $34 ; |  XX X  | $FEF6
    .byte $32 ; |  XX  X | $FEF7
    .byte $42 ; | X    X | $FEF8
    .byte $52 ; | X X  X | $FEF9
    .byte $62 ; | XX   X | $FEFA
    .byte $72 ; | XXX  X | $FEFB
    .byte $82 ; |X     X | $FEFC
    .byte $82 ; |X     X | $FEFD

     NOP ; free byte
     NOP ; free byte

       ORG $FF00

    .byte $FF ; |XXXXXXXX| $FF00
    .byte $FF ; |XXXXXXXX| $FF01
    .byte $C3 ; |XX    XX| $FF02
    .byte $99 ; |X  XX  X| $FF03
    .byte $99 ; |X  XX  X| $FF04
    .byte $99 ; |X  XX  X| $FF05
    .byte $99 ; |X  XX  X| $FF06
    .byte $99 ; |X  XX  X| $FF07
    .byte $C3 ; |XX    XX| $FF08
    .byte $FF ; |XXXXXXXX| $FF09
    .byte $C3 ; |XX    XX| $FF0A
    .byte $E7 ; |XXX  XXX| $FF0B
    .byte $E7 ; |XXX  XXX| $FF0C
    .byte $E7 ; |XXX  XXX| $FF0D
    .byte $E7 ; |XXX  XXX| $FF0E
    .byte $C7 ; |XX   XXX| $FF0F
    .byte $E7 ; |XXX  XXX| $FF10
    .byte $FF ; |XXXXXXXX| $FF11
    .byte $81 ; |X      X| $FF12
    .byte $9F ; |X  XXXXX| $FF13
    .byte $9F ; |X  XXXXX| $FF14
    .byte $C3 ; |XX    XX| $FF15
    .byte $F9 ; |XXXXX  X| $FF16
    .byte $B9 ; |X XXX  X| $FF17
    .byte $C3 ; |XX    XX| $FF18
    .byte $FF ; |XXXXXXXX| $FF19
    .byte $C3 ; |XX    XX| $FF1A
    .byte $B9 ; |X XXX  X| $FF1B
    .byte $F9 ; |XXXXX  X| $FF1C
    .byte $F3 ; |XXXX  XX| $FF1D
    .byte $F3 ; |XXXX  XX| $FF1E
    .byte $B9 ; |X XXX  X| $FF1F
    .byte $C3 ; |XX    XX| $FF20
    .byte $FF ; |XXXXXXXX| $FF21
    .byte $F3 ; |XXXX  XX| $FF22
    .byte $F3 ; |XXXX  XX| $FF23
    .byte $81 ; |X      X| $FF24
    .byte $B3 ; |X XX  XX| $FF25
    .byte $D3 ; |XX X  XX| $FF26
    .byte $E3 ; |XXX   XX| $FF27
    .byte $F3 ; |XXXX  XX| $FF28
    .byte $FF ; |XXXXXXXX| $FF29
    .byte $83 ; |X     XX| $FF2A
    .byte $B9 ; |X XXX  X| $FF2B
    .byte $F9 ; |XXXXX  X| $FF2C
    .byte $83 ; |X     XX| $FF2D
    .byte $9F ; |X  XXXXX| $FF2E
    .byte $9F ; |X  XXXXX| $FF2F
    .byte $81 ; |X      X| $FF30
    .byte $FF ; |XXXXXXXX| $FF31
    .byte $C3 ; |XX    XX| $FF32
    .byte $99 ; |X  XX  X| $FF33
    .byte $99 ; |X  XX  X| $FF34
    .byte $83 ; |X     XX| $FF35
    .byte $9F ; |X  XXXXX| $FF36
    .byte $9D ; |X  XXX X| $FF37
    .byte $C3 ; |XX    XX| $FF38
    .byte $FF ; |XXXXXXXX| $FF39
    .byte $E7 ; |XXX  XXX| $FF3A
    .byte $E7 ; |XXX  XXX| $FF3B
    .byte $E7 ; |XXX  XXX| $FF3C
    .byte $F3 ; |XXXX  XX| $FF3D
    .byte $F9 ; |XXXXX  X| $FF3E
    .byte $BD ; |X XXXX X| $FF3F
    .byte $81 ; |X      X| $FF40
    .byte $FF ; |XXXXXXXX| $FF41
    .byte $C3 ; |XX    XX| $FF42
    .byte $99 ; |X  XX  X| $FF43
    .byte $99 ; |X  XX  X| $FF44
    .byte $C3 ; |XX    XX| $FF45
    .byte $99 ; |X  XX  X| $FF46
    .byte $99 ; |X  XX  X| $FF47
    .byte $C3 ; |XX    XX| $FF48
    .byte $FF ; |XXXXXXXX| $FF49
    .byte $C3 ; |XX    XX| $FF4A
    .byte $B9 ; |X XXX  X| $FF4B
    .byte $F9 ; |XXXXX  X| $FF4C
    .byte $C1 ; |XX     X| $FF4D
    .byte $99 ; |X  XX  X| $FF4E
    .byte $99 ; |X  XX  X| $FF4F
    .byte $C3 ; |XX    XX| $FF50
    .byte $FF ; |XXXXXXXX| $FF51
    .byte $C3 ; |XX    XX| $FF52
    .byte $99 ; |X  XX  X| $FF53
    .byte $99 ; |X  XX  X| $FF54
    .byte $99 ; |X  XX  X| $FF55
    .byte $99 ; |X  XX  X| $FF56
    .byte $99 ; |X  XX  X| $FF57
    .byte $C3 ; |XX    XX| $FF58
BlankDigit:
    .byte $FF ; |XXXXXXXX| $FF59
    .byte $FF ; |XXXXXXXX| $FF5A
    .byte $FF ; |XXXXXXXX| $FF5B
    .byte $FF ; |XXXXXXXX| $FF5C
    .byte $FF ; |XXXXXXXX| $FF5D
    .byte $FF ; |XXXXXXXX| $FF5E
    .byte $FF ; |XXXXXXXX| $FF5F
    .byte $FF ; |XXXXXXXX| $FF60
DiplayCar:
    .byte $FF ; |XXXXXXXX| $FF61
    .byte $A5 ; |X X  X X| $FF62
    .byte $81 ; |X      X| $FF63
    .byte $A5 ; |X X  X X| $FF64
    .byte $E7 ; |XXX  XXX| $FF65
    .byte $A5 ; |X X  X X| $FF66
    .byte $81 ; |X      X| $FF67
    .byte $BD ; |X XXXX X| $FF68
Trophy:
    .byte $FF ; |XXXXXXXX| $FF69
    .byte $C7 ; |XX   XXX| $FF6A
    .byte $EF ; |XXX XXXX| $FF6B
    .byte $C7 ; |XX   XXX| $FF6C
    .byte $81 ; |X      X| $FF6D
    .byte $82 ; |X     X | $FF6E
    .byte $82 ; |X     X | $FF6F
    .byte $82 ; |X     X | $FF70
    .byte $81 ; |X      X| $FF71
    .byte $FF ; |XXXXXXXX| $FF72
GapDigit:
    .byte $00 ; |        | $FF73
    .byte $00 ; |        | $FF74
    .byte $00 ; |        | $FF75
    .byte $00 ; |        | $FF76
    .byte $00 ; |        | $FF77
    .byte $00 ; |        | $FF78
    .byte $00 ; |        | $FF79
    .byte $00 ; |        | $FF7A
    .byte $00 ; |        | $FF7B
LogoOne:
    .byte $0C ; |    XX  | $FF7C
    .byte $06 ; |     XX | $FF7D
    .byte $03 ; |      XX| $FF7E
    .byte $01 ; |       X| $FF7F
    .byte $00 ; |        | $FF80
    .byte $00 ; |        | $FF81
    .byte $00 ; |        | $FF82
    .byte $00 ; |        | $FF83
LogoTwo:
    .byte $2D ; |  X XX X| $FF84
    .byte $29 ; |  X X  X| $FF85
    .byte $E9 ; |XXX X  X| $FF86
    .byte $A9 ; |X X X  X| $FF87
    .byte $ED ; |XXX XX X| $FF88
    .byte $61 ; | XX    X| $FF89
    .byte $2F ; |  X XXXX| $FF8A
    .byte $00 ; |        | $FF8B
LogoThree:
    .byte $50 ; | X X    | $FF8C
    .byte $58 ; | X XX   | $FF8D
    .byte $5C ; | X XXX  | $FF8E
    .byte $56 ; | X X XX | $FF8F
    .byte $53 ; | X X  XX| $FF90
    .byte $11 ; |   X   X| $FF91
    .byte $F0 ; |XXXX    | $FF92
    .byte $00 ; |        | $FF93
LogoFour:
    .byte $BA ; |X XXX X | $FF94
    .byte $8A ; |X   X X | $FF95
    .byte $BA ; |X XXX X | $FF96
    .byte $A2 ; |X X   X | $FF97
    .byte $3A ; |  XXX X | $FF98
    .byte $80 ; |X       | $FF99
    .byte $FE ; |XXXXXXX | $FF9A
    .byte $00 ; |        | $FF9B
LogoFive:
    .byte $E9 ; |XXX X  X| $FF9C
    .byte $AB ; |X X X XX| $FF9D
    .byte $AF ; |X X XXXX| $FF9E
    .byte $AD ; |X X XX X| $FF9F
    .byte $E9 ; |XXX X  X| $FFA0
    .byte $00 ; |        | $FFA1
    .byte $00 ; |        | $FFA2
    .byte $00 ; |        | $FFA3
CopyrightOne:
    .byte $00 ; |        | $FFA4
    .byte $00 ; |        | $FFA5
    .byte $00 ; |        | $FFA6
    .byte $F7 ; |XXXX XXX| $FFA7
    .byte $95 ; |X  X X X| $FFA8
    .byte $87 ; |X    XXX| $FFA9
    .byte $90 ; |X  X    | $FFAA
    .byte $F0 ; |XXXX    | $FFAB
CopyrightTwo:
    .byte $00 ; |        | $FFAC
    .byte $47 ; | X   XXX| $FFAD
    .byte $41 ; | X     X| $FFAE
    .byte $77 ; | XXX XXX| $FFAF
    .byte $55 ; | X X X X| $FFB0
    .byte $75 ; | XXX X X| $FFB1
    .byte $00 ; |        | $FFB2
    .byte $00 ; |        | $FFB3
CopyrightThree:
    .byte $00 ; |        | $FFB4
    .byte $03 ; |      XX| $FFB5
    .byte $00 ; |        | $FFB6
    .byte $4B ; | X  X XX| $FFB7
    .byte $4A ; | X  X X | $FFB8
    .byte $6B ; | XX X XX| $FFB9
    .byte $00 ; |        | $FFBA
    .byte $08 ; |    X   | $FFBB
CopyrightFour:
    .byte $00 ; |        | $FFBC
    .byte $80 ; |X       | $FFBD
    .byte $80 ; |X       | $FFBE
    .byte $AA ; |X X X X | $FFBF
    .byte $AA ; |X X X X | $FFC0
    .byte $BA ; |X XXX X | $FFC1
    .byte $27 ; |  X  XXX| $FFC2
    .byte $22 ; |  X   X | $FFC3
CopyrightFive:
    .byte $00 ; |        | $FFC4
    .byte $00 ; |        | $FFC5
    .byte $00 ; |        | $FFC6
    .byte $11 ; |   X   X| $FFC7
    .byte $11 ; |   X   X| $FFC8
    .byte $17 ; |   X XXX| $FFC9
    .byte $15 ; |   X X X| $FFCA
    .byte $17 ; |   X XXX| $FFCB
CopyrightSix:
    .byte $00 ; |        | $FFCC
    .byte $00 ; |        | $FFCD
    .byte $00 ; |        | $FFCE
    .byte $77 ; | XXX XXX| $FFCF
    .byte $51 ; | X X   X| $FFD0
    .byte $73 ; | XXX  XX| $FFD1
    .byte $51 ; | X X   X| $FFD2
    .byte $77 ; | XXX XXX| $FFD3
LogoColorBars:
    .byte $84 ; |X    X  | $FFD4   blue
    .byte $D6 ; |XX X XX | $FFD5   green
    .byte $D6 ; |XX X XX | $FFD6   green
    .byte $1A ; |   XX X | $FFD7   yellow
    .byte $26 ; |  X  XX | $FFD8   brown
    .byte $26 ; |  X  XX | $FFD9   brown
    .byte $44 ; | X   X  | $FFDA   red
    .byte $00 ; |        | $FFDB   black
RightFlags:
    .byte $08 ; |    X   | $FFDC
    .byte $08 ; |    X   | $FFDD
    .byte $09 ; |    X  X| $FFDE
    .byte $0F ; |    XXXX| $FFDF
    .byte $0F ; |    XXXX| $FFE0
    .byte $0F ; |    XXXX| $FFE1
    .byte $0E ; |    XXX | $FFE2
    .byte $08 ; |    X   | $FFE3
    .byte $00 ; |        | $FFE4
LeftFlags:
    .byte $08 ; |    X   | $FFE5
    .byte $08 ; |    X   | $FFE6
    .byte $48 ; | X  X   | $FFE7
    .byte $78 ; | XXXX   | $FFE8
    .byte $78 ; | XXXX   | $FFE9
    .byte $78 ; | XXXX   | $FFEA
    .byte $38 ; |  XXX   | $FFEB
    .byte $08 ; |    X   | $FFEC
    .byte $00 ; |        | $FFED
MusicAllCarsLapped:
    .byte $0E ; |    XXX | $FFEE   music frequencies for the tune that
    .byte $0E ; |    XXX | $FFEF   plays after lapping all the cars,
    .byte $0E ; |    XXX | $FFF0   while the flags are waving...
    .byte $0E ; |    XXX | $FFF1
    .byte $13 ; |   X  XX| $FFF2
    .byte $0E ; |    XXX | $FFF3
    .byte $0E ; |    XXX | $FFF4
    .byte $13 ; |   X  XX| $FFF5
    .byte $17 ; |   X XXX| $FFF6
    .byte $1D ; |   XXX X| $FFF7


;can't be used...
    .byte $00 ; |        | $FFF8   for supercharger compatibility, or F8 bankswitching
    .byte $00 ; |        | $FFF9
    .byte $00 ; |        | $FFFA
    .byte $00 ; |        | $FFFB


       ORG $FFFC

    .word ClearRamTIA; START
    .word ClearRamTIA; START
