; Rough Disassembly of Kangaroo
; By Omegamatrix
;
;   ** Converted to use a Genesis controller **
;   button B - punch
;   button C - jump
;
;
;   All changes made in bank 1. Possible sources are error:
;   - There maybe some indirect labels I missed. I grabbed on table but LF50D for example seems
;     to be directly loaded in a few places. To minimize damage, I only carved 26 bytes out of a
;     range ($F5E4 to $F9CB). All other code is essentially untouched.
;   - The jumping seems to work well now. I rigged it so pressing diagonally up-left, up-right
;     won't make you jump unexpectedly. I know my hands often drift to up on a D-pad. Near a ladder
;     pressing either up, up-diagonally, or jump will make you climb. This made sense to me as I
;     felt it's more natural to press up to climb, or jump and grab. If this works all the time I'm
;     not sure.
;   - I could only make it part way through the second level. I'm not a good gamer, and I don't
;     have a Genesis controller at the moment, so who knows what will happen on the third level.
;     To be honest I have no idea what it even looks like!! :P
;
;
;
;
; Kang1.cfg contents:
;
;      ORG D000
;      CODE D000 D9E6
;      GFX D9E7 DBD5
;      CODE DBD6 DC00
;      GFX DC01 DDDE
;      CODE DDDF DDF9
;      GFX DDFA DFD7
;      CODE DFD8 DFE3
;      GFX DFE4 DFEB
;      CODE DFEC DFF7
;      GFX DFF8 DFFF
;
;
; Kang2.cfg contents:
;
;      ORG F000
;      GFX F000 F002
;      CODE F003 FCE0
;      GFX FCE1 FCE6
;      CODE FCE7 FD8B
;      GFX FD8C FFEB
;      CODE FFEC FFF7
;      GFX FFF8 FFFF

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
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXM1FB  =  $35
CXPPMM  =  $37
INPT4   =  $3C
INPT5   =  $3D

;added
INPT1   =  $39
INPT3   =  $3B

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

LFA8A   =   $FA8A

BANK_0       = $FFF8
BANK_1       = $FFF9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

frameCounter = $B9

C0_mirror    = $01C0
FC_mirror    = $01FC
FF_mirror    = $01FF

RESP1_mirror = $0111
RESM0_mirror = $0112
GRP1_mirror  = $011C
HMM1_mirror  = $0123

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $D000

START_Bank0:
    sta    BANK_1                ; 4

LD003:
    bit    $BA                   ; 3
    bmi    LD066                 ; 2³
    ldx    $B8                   ; 3
    cpx    #$FF                  ; 2
    beq    LD074                 ; 2³
    lda    LDA58,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LDFCE,Y               ; 4
    and    frameCounter          ; 3
    bne    LD074                 ; 2³
    lda    #4                    ; 2
    sta    AUDC0                 ; 3
    lda    LDA58,X               ; 4
    cmp    #$FF                  ; 2
    beq    LD055                 ; 2³
    and    #$1F                  ; 2
    sta    AUDF0                 ; 3
    beq    LD030                 ; 2³
    lda    #$0A                  ; 2
LD030:
    sta    AUDV0                 ; 3
    inx                          ; 2
    bit    $B5                   ; 3
    bpl    LD074                 ; 2³
    bit    $B6                   ; 3
    bvs    LD043                 ; 2³
    lda    #$FF                  ; 2
    sta    $93                   ; 3
    lda    #$80                  ; 2
    sta    $B6                   ; 3
LD043:
    lda    #$0D                  ; 2
    sta    AUDC1                 ; 3
    lda    LDA58,X               ; 4
    sta    AUDF1                 ; 3
    beq    LD050                 ; 2³
    lda    #5                    ; 2
LD050:
    sta    AUDV1                 ; 3
    inx                          ; 2
    bne    LD074                 ; 2³
LD055:
    lda    $B5                   ; 3
    bpl    LD066                 ; 2³
    ldy    #1                    ; 2
    sty    frameCounter          ; 3
    dey                          ; 2
    bit    $B6                   ; 3
    bvs    LD066                 ; 2³
    sty    $B6                   ; 3
    sty    $93                   ; 3
LD066:
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    lda    $B5                   ; 3
    and    #$7F                  ; 2
    sta    $B5                   ; 3
    ldx    #$FF                  ; 2
LD074:
    stx    $B8                   ; 3
    bit    $B6                   ; 3
    bpl    LD07D                 ; 2³
    jmp    LD1AB                 ; 3

LD07D:
    lda    $A6                   ; 3
    bne    LD085                 ; 2³
    lda    frameCounter          ; 3
    bne    LD09A                 ; 2³
LD085:
    lda    $A3                   ; 3
    bpl    LD09A                 ; 2³
    ldx    #0                    ; 2
    stx    $A3                   ; 3
    inx                          ; 2
    stx    $A2                   ; 3
    ldx    $A4                   ; 3
    lda    LDFD4,X               ; 4
    clc                          ; 2
    adc    #1                    ; 2
    sta    $A1                   ; 3
LD09A:
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcc    LD0FE                 ; 2³
    lda    $B6                   ; 3
    bpl    LD0A6                 ; 2³
LD0A3:
    jmp    LD18E                 ; 3

LD0A6:
    cmp    #1                    ; 2
    beq    LD0FE                 ; 2³
    ldx    #3                    ; 2
    stx    $C1                   ; 3
LD0AE:
    lda    $84,X                 ; 4
    and    #$0F                  ; 2
    cmp    #8                    ; 2
    beq    LD0F8                 ; 2³
    lda    $88,X                 ; 4
    ldy    $8C,X                 ; 4
    sta    $BD                   ; 3
    lda    $92                   ; 3
    and    #$07                  ; 2
    tax                          ; 2
    lda    LDFC6,X               ; 4
    sta    $BF                   ; 3
    lda    $BD                   ; 3
    sec                          ; 2
    sbc    $90                   ; 3
    bpl    LD0D1                 ; 2³
    cmp    #$FF                  ; 2
    bne    LD0F8                 ; 2³
LD0D1:
    cmp    $BF                   ; 3
    bpl    LD0F8                 ; 2³
    tya                          ; 2
    sec                          ; 2
    sbc    $91                   ; 3
    cmp    #6                    ; 2
    bcc    LD0E1                 ; 2³
    cmp    #$FA                  ; 2
    bcc    LD0F8                 ; 2³
LD0E1:
    ldx    $C1                   ; 3
    lda    $84,X                 ; 4
    and    #$08                  ; 2
    bne    LD0F8                 ; 2³
    lda    #8                    ; 2
    sta    $84,X                 ; 4
    jsr    LDBE0                 ; 6
    jsr    LDBD6                 ; 6
    lda    #2                    ; 2
    jsr    LDDDF                 ; 6
LD0F8:
    dec    $C1                   ; 5
    ldx    $C1                   ; 3
    bpl    LD0AE                 ; 2³
LD0FE:
    bit    $B5                   ; 3
    bmi    LD0A3                 ; 2³+1
    lda    $A6                   ; 3
    cmp    #2                    ; 2
    bcc    LD112                 ; 2³
    lda    $BC                   ; 3
    bne    LD116                 ; 2³
    lda    frameCounter          ; 3
    and    #$01                  ; 2
    bpl    LD116                 ; 2³
LD112:
    lda    frameCounter          ; 3
    and    #$07                  ; 2
LD116:
    bne    LD194                 ; 2³
    bit    $A3                   ; 3
    bmi    LD194                 ; 2³
    bvs    LD150                 ; 2³
    clc                          ; 2
    lda    $A2                   ; 3
    adc    #$FF                  ; 2
    cmp    $91                   ; 3
    bcc    LD12F                 ; 2³
LD127:
    lda    $A3                   ; 3
    ora    #$40                  ; 2
    sta    $A3                   ; 3
    bpl    LD194                 ; 2³
LD12F:
    lda    $A3                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    $A2                   ; 3
    cmp    #$7F                  ; 2
    beq    LD127                 ; 2³
    clc                          ; 2
    adc    #2                    ; 2
    sta    $A2                   ; 3
    lda    $A1                   ; 3
    adc    LDBD2,X               ; 4
    sta    $A1                   ; 3
    ldx    $A3                   ; 3
    inx                          ; 2
    txa                          ; 2
    and    #$FB                  ; 2
    sta    $A3                   ; 3
    bpl    LD194                 ; 2³
LD150:
    ldx    $A4                   ; 3
    lda    $A1                   ; 3
    sec                          ; 2
    sbc    LDFD4,X               ; 4
    adc    #1                    ; 2
    sta    $FF                   ; 3
    cmp    $90                   ; 3
    bmi    LD179                 ; 2³
    ldy    $90                   ; 3
    iny                          ; 2
    iny                          ; 2
    cpy    $FF                   ; 3
    bcc    LD179                 ; 2³
    lda    $91                   ; 3
    cmp    $A2                   ; 3
    bpl    LD179                 ; 2³
    adc    #7                    ; 2
    cmp    $A2                   ; 3
    bmi    LD179                 ; 2³
    jsr    LDBE0                 ; 6
    bpl    LD18E                 ; 2³
LD179:
    ldx    $A4                   ; 3
    lda    LDFD4,X               ; 4
    clc                          ; 2
    adc    #$14                  ; 2
    cmp    $A1                   ; 3
    beq    LD18E                 ; 2³
    lda    $A1                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    sta    $A1                   ; 3
    bpl    LD194                 ; 2³
LD18E:
    lda    #$FF                  ; 2
    sta    $A1                   ; 3
    sta    $A3                   ; 3
LD194:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $A2                   ; 3
    sec                          ; 2
    lda    $A2                   ; 3
LD19B:
    sbc    #$0F                  ; 2
    bcs    LD19B                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMBL                  ; 3
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
LD1AB:
    lda    #$FF                  ; 2
    sta    $C2                   ; 3
    sta    $FE                   ; 3
    lda    #$DE                  ; 2
    sta    $F3                   ; 3
    ldx    $A4                   ; 3
    lda    LDFD4,X               ; 4
    sta    $FC                   ; 3
    inx                          ; 2
    lda    LDFD4,X               ; 4
    sta    $FD                   ; 3
    ldx    $C5                   ; 3
    lda    $C8,X                 ; 4
    sta    $C1                   ; 3
    lda    $EC,X                 ; 4
    sta    COLUP1                ; 3
    lda    $E0,X                 ; 4
    sta    $C3                   ; 3
    lda    $E6,X                 ; 4
    sta    $C4                   ; 3
    lda    #$11                  ; 2
    sta    CTRLPF                ; 3
    bit    $92                   ; 3
    bpl    LD1E6                 ; 2³
    lda    $90                   ; 3
    ldx    $A4                   ; 3
    sec                          ; 2
    adc    LDFD4,X               ; 4
    sta    $FE                   ; 3
LD1E6:
    ldx    $C6                   ; 3
    bmi    LD1EE                 ; 2³
    lda    $D4,X                 ; 4
    sta    $C2                   ; 3
LD1EE:
    lda    $DC,X                 ; 4
    sta    $F2                   ; 3
    sec                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    $C6                   ; 3
    lda    $D8,X                 ; 4
    sbc    #3                    ; 2
LD1FB:
    sbc    #$0F                  ; 2
    bcs    LD1FB                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0                  ; 3
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    $FC                   ; 3
    lda    LDF00,X               ; 4
    sta    $BD                   ; 3
    lda    LDF42,X               ; 4
    sta    $BE                   ; 3
    lda    LDF84,X               ; 4
    sta    $BF                   ; 3
    lda    LDD52,X               ; 4
    sta    $C0                   ; 3
LD223:
    ldy    INTIM                 ; 4
    bne    LD223                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    VBLANK                ; 3
    lda    $C1                   ; 3
    beq    LD23A                 ; 2³
    lda    $C2                   ; 3
    bne    LD237                 ; 2³
    jmp    LD4EB                 ; 3

LD237:
    jmp    LD63F                 ; 3

LD23A:
    lda    $C2                   ; 3
    bne    LD242                 ; 2³
    lda    ($C3),Y               ; 5
    bne    LD245                 ; 2³
LD242:
    jmp    LD39D                 ; 3

LD245:
    stx    WSYNC                 ; 3
;---------------------------------------
    sty    ENAM0                 ; 3
    sty    ENAM1                 ; 3
    sty    ENABL                 ; 3
    sta    GRP1                  ; 3
    tax                          ; 2
    lda    $BD                   ; 3
    sta    PF1                   ; 3
    lda    ($F2),Y               ; 5
    sta    GRP0                  ; 3
    lda    $BE                   ; 3
    sta    PF2                   ; 3
    lda    $C0                   ; 3
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    cpx    #0                    ; 2
    sta    PF2                   ; 3
    sta    HMCLR                 ; 3
    bne    LD275                 ; 2³
    dec    $C5                   ; 5
    inc    $F2                   ; 5
    lda    $BD                   ; 3
    ldx    $BE                   ; 3
    jmp    LD512                 ; 3

LD275:
    inc    $C3                   ; 5
    inc    $F2                   ; 5
    lda    $BE                   ; 3
    sta    PF2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $BD                   ; 3
    sta    PF1                   ; 3
    lda    ($C3),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($F2),Y               ; 5
    sta    GRP0                  ; 3
    inc    $C3                   ; 5
    inc    $F2                   ; 5
    lda    $FC                   ; 3
    ldx    C0_mirror             ; 4
    stx    PF1                   ; 3
    ldx    $BF                   ; 3
    stx    PF2                   ; 3
    ldx    #0                    ; 2
    cmp    $FE                   ; 3
    bne    LD2A2                 ; 2³
    ldx    #2                    ; 2
LD2A2:
    cmp    $A1                   ; 3
    bne    LD2A7                 ; 2³
    inx                          ; 2
LD2A7:
    stx    $FF                   ; 3
    lda    $BD                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    lda    $BE                   ; 3
    sta    PF2                   ; 3
    lda    ($C3),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($F2),Y               ; 5
    sta    GRP0                  ; 3
    inc    $C3                   ; 5
    inc    $F2                   ; 5
    lda    C0_mirror             ; 4
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    ldy    #2                    ; 2
    lda    ($C3),Y               ; 5
    sta    $F1                   ; 3
    lda    ($F2),Y               ; 5
    sta    $D3                   ; 3
    ldy    #0                    ; 2
    lda    $BD                   ; 3
    sec                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    lda    $BE                   ; 3
    sta    PF2                   ; 3
    lda    ($C3),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($F2),Y               ; 5
    sta    GRP0                  ; 3
    inc    $C3                   ; 5
    inc    $F2                   ; 5
    lda    C0_mirror             ; 4
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    ldx    $C7                   ; 3
    bmi    LD33E                 ; 2³+1
    dec    $F4,X                 ; 6
    bne    LD33E                 ; 2³+1
    sty    PF2                   ; 3
    lda    ($C3),Y               ; 5
    sty    PF1                   ; 3
    sta    GRP1                  ; 3
    lda    ($F2),Y               ; 5
    sta    GRP0                  ; 3
    lda    $F7,X                 ; 4
LD30A:
    sbc    #$0F                  ; 2
    bcs    LD30A                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    RESM0                 ; 3
    ldx    #2                    ; 2
    sta    HMM0                  ; 3
LD31A:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    ENAM0                 ; 3
    lda    $F1                   ; 3
    sta    GRP1                  ; 3
    lda    $D3                   ; 3
    sta    GRP0                  ; 3
    lda    $FF                   ; 3
    sta    ENAM1                 ; 3
    asl                          ; 2
    sta    ENABL                 ; 3
    sty    HMM0                  ; 3
    inc    $C3                   ; 5
    inc    $F2                   ; 5
    inc    $C3                   ; 5
    inc    $F2                   ; 5
    dec    $C7                   ; 5
    jmp    LD352                 ; 3

LD33E:
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    lda    ($C3),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($F2),Y               ; 5
    sta    GRP0                  ; 3
    inc    $C7                   ; 5
    ldx    #0                    ; 2
    beq    LD31A                 ; 2³
LD352:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($C3),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($F2),Y               ; 5
    sta    GRP0                  ; 3
    inc    $FC                   ; 5
    inc    $C3                   ; 5
    inc    $F2                   ; 5
    lda    ($C3),Y               ; 5
    tax                          ; 2
    lda    ($F2),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    ldx    $FC                   ; 3
    cpx    $FD                   ; 3
    bne    LD378                 ; 2³
    jmp    LD791                 ; 3

LD378:
    lda    LDF00,X               ; 4
    sta    $BD                   ; 3
    lda    LDF42,X               ; 4
    sta    $BE                   ; 3
    lda    LDF84,X               ; 4
    sta    $BF                   ; 3
    lda    LDD52,X               ; 4
    sta    $C0                   ; 3
    inc    $F2                   ; 5
    lda    ($F2),Y               ; 5
    beq    LD399                 ; 2³
    inc    $C3                   ; 5
    lda    ($C3),Y               ; 5
    jmp    LD245                 ; 3

LD399:
    dec    $C6                   ; 5
    inc    $C3                   ; 5
LD39D:
    stx    WSYNC                 ; 3
;---------------------------------------
    sty    ENAM0                 ; 3
    lda    ($C3),Y               ; 5
    sta    GRP1                  ; 3
    ldx    $BD                   ; 3
    stx    PF1                   ; 3
    sty    GRP0                  ; 3
    sty    ENAM1                 ; 3
    sty    ENABL                 ; 3
    tax                          ; 2
    lda    $BE                   ; 3
    sta    PF2                   ; 3
    lda    $C0                   ; 3
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    cpx    #0                    ; 2
    sta    PF2                   ; 3
    sta    HMCLR                 ; 3
    bne    LD3C7                 ; 2³
    dec    $C5                   ; 5
    jmp    LD660                 ; 3

LD3C7:
    inc    $C3                   ; 5
    lda    $BD                   ; 3
    ldx    $BE                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    stx    PF2                   ; 3
    lda    ($C3),Y               ; 5
    sta    GRP1                  ; 3
    ldx    $C6                   ; 3
    bmi    LD3E5                 ; 2³
    lda    $C2                   ; 3
    bne    LD3E8                 ; 2³
    lda    $D4,X                 ; 4
    sta    $C2                   ; 3
    bne    LD3EB                 ; 2³
LD3E5:
    ldx    $C6                   ; 3
    nop                          ; 2
LD3E8:
    pha                          ; 3
    pla                          ; 4
    nop                          ; 2
LD3EB:
    nop                          ; 2
    lda    $C0                   ; 3
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    inc    $C3                   ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $BE                   ; 3
    sta    PF2                   ; 3
    lda    $BD                   ; 3
    sta    PF1                   ; 3
    lda    ($C3),Y               ; 5
    sta    GRP1                  ; 3
    lda    $DC,X                 ; 4
    sta    $F2                   ; 3
    inc    $C3                   ; 5
    lda    FC_mirror             ; 4
    ldx    $C0                   ; 3
    stx    PF1                   ; 3
    ldx    $BF                   ; 3
    stx    PF2                   ; 3
    ldx    #0                    ; 2
    cmp    $FE                   ; 3
    bne    LD41D                 ; 2³
    ldx    #2                    ; 2
LD41D:
    cmp    $A1                   ; 3
    bne    LD422                 ; 2³
    inx                          ; 2
LD422:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $BD                   ; 3
    sta    PF1                   ; 3
    lda    $BE                   ; 3
    sta    PF2                   ; 3
    lda    ($C3),Y               ; 5
    sta    GRP1                  ; 3
    stx    $FF                   ; 3
    ldx    $C6                   ; 3
    bpl    LD44C                 ; 2³
    ldx    #$87                  ; 2
    stx    $BD                   ; 3
    bne    LD450                 ; 2³
LD43C:
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    lda    ($C3),Y               ; 5
    sta    GRP1                  ; 3
    inc    $C7                   ; 5
    ldx    #0                    ; 2
    beq    LD47E                 ; 2³
LD44C:
    lda    $D8,X                 ; 4
    sta    $BD                   ; 3
LD450:
    lda    $C0                   ; 3
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    inc    $C3                   ; 5
    ldx    $C7                   ; 3
    bmi    LD43C                 ; 2³
    dec    $F4,X                 ; 6
    bne    LD43C                 ; 2³
    sty    PF2                   ; 3
    lda    ($C3),Y               ; 5
    sec                          ; 2
    sta    GRP1                  ; 3
    sty    PF1                   ; 3
    lda    $F7,X                 ; 4
LD46D:
    sbc    #$0F                  ; 2
    bcs    LD46D                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    RESM0_mirror          ; 4
    sta    HMM0                  ; 3
    ldx    #2                    ; 2
LD47E:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    ENAM0                 ; 3
    inc    $C3                   ; 5
    lda    ($C3),Y               ; 5
    sta    GRP1                  ; 3
    lda    $FF                   ; 3
    sta    ENAM1                 ; 3
    asl                          ; 2
    sta    ENABL                 ; 3
    inc    $C3                   ; 5
    dec    $C7                   ; 5
    lda    ($C3),Y               ; 5
    sty    HMM0                  ; 3
    tax                          ; 2
    inc    $C3                   ; 5
    inc    $FC                   ; 5
    lda    ($C3),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP1                  ; 3
    tax                          ; 2
    lda    $BD                   ; 3
    sec                          ; 2
    sbc    #3                    ; 2
LD4AA:
    sbc    #$0F                  ; 2
    bcs    LD4AA                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    RESP0                 ; 3
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    GRP1                  ; 3
    ldx    $FC                   ; 3
    cpx    $FD                   ; 3
    bne    LD4C7                 ; 2³
    jmp    LD791                 ; 3

LD4C7:
    lda    LDF00,X               ; 4
    sta    $BD                   ; 3
    lda    LDF42,X               ; 4
    sta    $BE                   ; 3
    lda    LDF84,X               ; 4
    sta    $BF                   ; 3
    lda    LDD52,X               ; 4
    sta    $C0                   ; 3
    dec    $C2                   ; 5
    bne    LD4E6                 ; 2³
    inc    $C3                   ; 5
    lda    ($C3),Y               ; 5
    jmp    LD245                 ; 3

LD4E6:
    inc    $C3                   ; 5
    jmp    LD39D                 ; 3

LD4EB:
    stx    WSYNC                 ; 3
;---------------------------------------
    sty    ENAM0                 ; 3
    lda    $BD                   ; 3
    sta    PF1                   ; 3
    lda    ($F2),Y               ; 5
    sta    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    ENAM1                 ; 3
    sty    ENABL                 ; 3
    lda    $BE                   ; 3
    sta    PF2                   ; 3
    sta    HMCLR                 ; 3
    lda    C0_mirror             ; 4
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    inc    $F2                   ; 5
    lda    $BD                   ; 3
    ldx    $BE                   ; 3
LD512:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    stx    PF2                   ; 3
    lda    ($F2),Y               ; 5
    sta    GRP0                  ; 3
    ldx    $C5                   ; 3
    bmi    LD52A                 ; 2³
    lda    $C1                   ; 3
    bne    LD52D                 ; 2³
    lda    $C8,X                 ; 4
    sta    $C1                   ; 3
    bne    LD530                 ; 2³
LD52A:
    lda    $C0                   ; 3
    nop                          ; 2
LD52D:
    pha                          ; 3
    pla                          ; 4
    nop                          ; 2
LD530:
    nop                          ; 2
    lda    $C0                   ; 3
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    bit    $C5                   ; 3
    bmi    LD541                 ; 2³
    lda    $EC,X                 ; 4
    sta    COLUP1                ; 3
LD541:
    lda    $BD                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    inc    $F2                   ; 5
    sta    PF1                   ; 3
    lda    $BE                   ; 3
    sta    PF2                   ; 3
    lda    ($F2),Y               ; 5
    sta    GRP0                  ; 3
    lda    $E0,X                 ; 4
    sta    $C3                   ; 3
    lda    $E6,X                 ; 4
    sta    $C4                   ; 3
    lda    $C0                   ; 3
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    inc    $F2                   ; 5
    ldx    #0                    ; 2
    lda    $FC                   ; 3
    cmp    $A1                   ; 3
    bne    LD56D                 ; 2³
    ldx    #2                    ; 2
LD56D:
    stx    $FF                   ; 3
    lda    $BD                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    lda    $BE                   ; 3
    sta    PF2                   ; 3
    lda    ($F2),Y               ; 5
    sta    GRP0                  ; 3
    inc    $F2                   ; 5
    ldx    $C5                   ; 3
    bpl    LD596                 ; 2³
    tya                          ; 2
    beq    LD598                 ; 2³
LD586:
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    lda    ($F2),Y               ; 5
    sta    GRP0                  ; 3
    inc    $C7                   ; 5
    ldx    #0                    ; 2
    beq    LD5C8                 ; 2³
LD596:
    lda    $CE,X                 ; 4
LD598:
    sta    $BD                   ; 3
    lda    C0_mirror             ; 4
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    ldx    $C7                   ; 3
    bmi    LD586                 ; 2³
    dec    $F4,X                 ; 6
    bne    LD586                 ; 2³
    sty    PF2                   ; 3
    lda    ($F2),Y               ; 5
    sty    PF1                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    $F7,X                 ; 4
    sec                          ; 2
LD5B8:
    sbc    #$0F                  ; 2
    bcs    LD5B8                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ldx    #2                    ; 2
    sta    RESM0                 ; 3
    sta    HMM0                  ; 3
LD5C8:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    ENAM0                 ; 3
    inc    $F2                   ; 5
    lda    ($F2),Y               ; 5
    sta    GRP0                  ; 3
    lda    $FF                   ; 3
    sta    ENABL                 ; 3
    inc    $F2                   ; 5
    dec    $C7                   ; 5
    lda    ($F2),Y               ; 5
    tax                          ; 2
    inc    $F2                   ; 5
    lda    ($F2),Y               ; 5
    inc    $FC                   ; 5
    sec                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP0                  ; 3
    sty    HMM0                  ; 3
    tax                          ; 2
    lda    $BD                   ; 3
LD5EF:
    sbc    #$0F                  ; 2
    bcs    LD5EF                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    RESP1                 ; 3
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    GRP0                  ; 3
    ldx    $FC                   ; 3
    cpx    $FD                   ; 3
    bne    LD60C                 ; 2³
    jmp    LD791                 ; 3

LD60C:
    lda    LDF00,X               ; 4
    sta    $BD                   ; 3
    lda    LDF42,X               ; 4
    sta    $BE                   ; 3
    lda    LDF84,X               ; 4
    sta    $BF                   ; 3
    lda    LDD52,X               ; 4
    sta    $C0                   ; 3
    dec    $C1                   ; 5
    bne    LD634                 ; 2³
    inc    $F2                   ; 5
    lda    ($F2),Y               ; 5
    beq    LD62F                 ; 2³
    lda    ($C3),Y               ; 5
    jmp    LD245                 ; 3

LD62F:
    dec    $C6                   ; 5
    jmp    LD39D                 ; 3

LD634:
    inc    $F2                   ; 5
    lda    ($F2),Y               ; 5
    beq    LD63D                 ; 2³
    jmp    LD4EB                 ; 3

LD63D:
    dec    $C6                   ; 5
LD63F:
    stx    WSYNC                 ; 3
;---------------------------------------
    sty    ENAM0                 ; 3
    lda    $BD                   ; 3
    sta    PF1                   ; 3
    lda    $BE                   ; 3
    sta    PF2                   ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sty    ENAM1                 ; 3
    sty    ENABL                 ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    HMCLR                 ; 3
    lda    $C0                   ; 3
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
LD660:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $BD                   ; 3
    sta    PF1                   ; 3
    lda    $BE                   ; 3
    sta    PF2                   ; 3
    ldx    $C6                   ; 3
    bmi    LD678                 ; 2³
    lda    $C2                   ; 3
    bne    LD67B                 ; 2³
    lda    $D4,X                 ; 4
    sta    $C2                   ; 3
    bne    LD67E                 ; 2³
LD678:
    ldx    $C6                   ; 3
    nop                          ; 2
LD67B:
    pha                          ; 3
    pla                          ; 4
    nop                          ; 2
LD67E:
    lda    $DC,X                 ; 4
    sta    $F2                   ; 3
    lda    $C0                   ; 3
    ldx    $BF                   ; 3
    stx    PF2                   ; 3
    sta    PF1                   ; 3
    lda    $BD                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    $BE                   ; 3
    sta    PF1                   ; 3
    stx    PF2                   ; 3
    ldx    $C5                   ; 3
    bmi    LD6A2                 ; 2³
    lda    $C1                   ; 3
    bne    LD6AA                 ; 2³
    lda    $C8,X                 ; 4
    sta    $C1                   ; 3
    bne    LD6AD                 ; 2³
LD6A2:
    pha                          ; 3
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    lsr                          ; 2
    nop                          ; 2
    bpl    LD6B1                 ; 2³
LD6AA:
    pha                          ; 3
    pla                          ; 4
    nop                          ; 2
LD6AD:
    lda    $EC,X                 ; 4
    sta    COLUP1                ; 3
LD6B1:
    lda    $C0                   ; 3
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    lda    $E0,X                 ; 4   lo pointer Kangaroo gfx
    sta    $C3                   ; 3
    lda    $E6,X                 ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    $C4                   ; 3
    lda    $BD                   ; 3
    sta    PF1                   ; 3
    lda    $BE                   ; 3
    sta    PF2                   ; 3
    ldx    $C6                   ; 3
    bpl    LD6DF                 ; 2³
    lda    #$87                  ; 2
    bne    LD6E1                 ; 2³
LD6D3:
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    inc    $C7                   ; 5
    ldx    #0                    ; 2
    beq    LD71B                 ; 2³+1
LD6DF:
    lda    $D8,X                 ; 4
LD6E1:
    sta    $BD                   ; 3
    ldx    #2                    ; 2
    stx    $FF                   ; 3
    lda    $FC                   ; 3
    ldx    $C0                   ; 3
    stx    PF1                   ; 3
    ldx    $BF                   ; 3
    stx    PF2                   ; 3
    cmp    $A1                   ; 3
    bne    LD6F8                 ; 2³
    nop                          ; 2
    beq    LD6FB                 ; 2³
LD6F8:
    sty    FF_mirror             ; 4
LD6FB:
    ldx    $C7                   ; 3
    bmi    LD6D3                 ; 2³
    dec    $F4,X                 ; 6
    bne    LD6D3                 ; 2³+1
    nop                          ; 2
    sty    PF2                   ; 3
    sty    PF1                   ; 3
    lda    $F7,X                 ; 4
    sec                          ; 2
LD70B:
    sbc    #$0F                  ; 2
    bcs    LD70B                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ldx    #2                    ; 2
    sta    RESM0                 ; 3
    sta    HMM0                  ; 3
LD71B:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    ENAM0                 ; 3
    ldx    $FF                   ; 3
    stx    ENABL                 ; 3
    dec    $C7                   ; 5
    lda    $BD                   ; 3
    sec                          ; 2
    sbc    #$3F                  ; 2
LD72C:
    sbc    #$0F                  ; 2
    bcs    LD72C                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sec                          ; 2
    ldx    $C5                   ; 3
    sta    HMP0                  ; 3
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    bpl    LD744                 ; 2³
    tya                          ; 2
    beq    LD746                 ; 2³
LD744:
    lda    $CE,X                 ; 4
LD746:
    sty    HMM0                  ; 3
LD748:
    sbc    #$0F                  ; 2
    bcs    LD748                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    RESP1_mirror          ; 4
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    inc    $FC                   ; 5
    ldx    $FC                   ; 3
    cpx    $FD                   ; 3
    beq    LD791                 ; 2³
    lda    LDF00,X               ; 4
    sta    $BD                   ; 3
    lda    LDF42,X               ; 4
    sta    $BE                   ; 3
    lda    LDF84,X               ; 4
    sta    $BF                   ; 3
    lda    LDD52,X               ; 4
    sta    $C0                   ; 3
    dec    $C1                   ; 5
    bne    LD787                 ; 2³
    dec    $C2                   ; 5
    bne    LD784                 ; 2³
    lda    ($C3),Y               ; 5
    jmp    LD245                 ; 3

LD784:
    jmp    LD39D                 ; 3

LD787:
    dec    $C2                   ; 5
    bne    LD78E                 ; 2³
    jmp    LD4EB                 ; 3

LD78E:
    jmp    LD63F                 ; 3

LD791:
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    PF0                   ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sty    COLUBK                ; 3
    lda    #$DB                  ; 2
    sta    $BE                   ; 3
    sta    $C0                   ; 3
    sta    $C3                   ; 3
    sta    $C5                   ; 3
    ldx    #$50                  ; 2
    stx    $FF                   ; 3
    lda    $A7                   ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    bne    LD7B4                 ; 2³
    lda    #$50                  ; 2
LD7B4:
    sta    $FF                   ; 3
    sta    $BD                   ; 3
    lda    $A7                   ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    bne    LD7C8                 ; 2³
    lda    #$50                  ; 2
    cmp    $FF                   ; 3
    beq    LD7C8                 ; 2³
    tya                          ; 2
LD7C8:
    sta    $FF                   ; 3
    sta    $BF                   ; 3
    lda    $A8                   ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    bne    LD7DA                 ; 2³
    lda    #$50                  ; 2
    cmp    $FF                   ; 3
    beq    LD7DA                 ; 2³
    tya                          ; 2
LD7DA:
    sta    $FF                   ; 3
    sta    $C2                   ; 3
    lda    $A8                   ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    bne    LD7EE                 ; 2³
    lda    #$50                  ; 2
    cmp    $FF                   ; 3
    beq    LD7EE                 ; 2³
    tya                          ; 2
LD7EE:
    sta    $C4                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #0                    ; 2
    stx    COLUPF                ; 3
    ldx    $AD                   ; 3
    lda    LDDD6,X               ; 4
    sta    PF1                   ; 3
    lda    LDB96,X               ; 4
    sta    PF2                   ; 3
    sty    HMP1                  ; 3
    iny                          ; 2
    sty    VDELP0                ; 3
    sty    VDELP1                ; 3
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    ldy    #6                    ; 2
    lda    #$E8                  ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sty    $FF                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
LD825:
    lda    #$E8                  ; 2
    sta    COLUPF                ; 3
    lda    ($BD),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($BF),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($C2),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($C4),Y               ; 5
    tax                          ; 2
    lda    LDB00,Y               ; 4
    ldy    #0                    ; 2
    sty    COLUPF                ; 3
    dec    $FF                   ; 5
    stx    GRP1_mirror           ; 4
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    ldy    $FF                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    bpl    LD825                 ; 2³
    lda    $BB                   ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    sta    $BD                   ; 3
    ldx    #0                    ; 2
    stx    VDELP0                ; 3
    stx    VDELP1                ; 3
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    lda    $BB                   ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    ldy    #$DD                  ; 2
    sty    $BE                   ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    asl                          ; 2
    asl                          ; 2
    sta    $BF                   ; 3
    sty    $C0                   ; 3
    ldy    #4                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    $FF                   ; 3
LD880:
    lda    ($BD),Y               ; 5
    and    #$F0                  ; 2
    sta    $FF                   ; 3
    lda    ($BF),Y               ; 5
    and    #$0F                  ; 2
    ora    $FF                   ; 3
    sta    GRP0                  ; 3
    lda    LDD00,Y               ; 4
    sta    GRP1                  ; 3
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    bpl    LD880                 ; 2³
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    stx    GRP1                  ; 3
    stx    GRP0                  ; 3

    lda    #$22                  ; 2
    sta    TIM64T                ; 4
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcc    LD8F4                 ; 2³
    ldy    $90                   ; 3
    iny                          ; 2
    iny                          ; 2
    sty    $BD                   ; 3
    lda    $92                   ; 3
    bpl    LD8F4                 ; 2³
    and    #$08                  ; 2
    beq    LD8BC                 ; 2³
    lda    #$0A                  ; 2
    bpl    LD8BE                 ; 2³
LD8BC:
    lda    #$FD                  ; 2
LD8BE:
    clc                          ; 2
    adc    $91                   ; 3
    sta    $BE                   ; 3
    ldx    #3                    ; 2
LD8C5:
    lda    $84,X                 ; 4
    and    #$0F                  ; 2
    cmp    #8                    ; 2
    beq    LD8F1                 ; 2³
    lda    $8C,X                 ; 4
    cmp    $BE                   ; 3
    bcs    LD8F1                 ; 2³
    adc    #7                    ; 2
    cmp    $BE                   ; 3
    bcc    LD8F1                 ; 2³
    lda    $88,X                 ; 4
    cmp    $BD                   ; 3
    bcs    LD8F1                 ; 2³
    adc    #2                    ; 2
    cmp    $BD                   ; 3
    bcc    LD8F1                 ; 2³
    lda    #8                    ; 2
    sta    $84,X                 ; 4
    jsr    LDBD6                 ; 6
    lda    #2                    ; 2
    jsr    LDDDF                 ; 6
LD8F1:
    dex                          ; 2
    bpl    LD8C5                 ; 2³
LD8F4:
    jmp    LDFF2                 ; 3

LD8F7:
    inc    frameCounter          ; 5
    bne    LD8FE                 ; 2³
    jmp    LDFD8                 ; 3

LD8FE:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    bcc    LD909                 ; 2³
    lda    #0                    ; 2
    beq    LD91D                 ; 2³
LD909:
    lda    $BD                   ; 3
    beq    LD911                 ; 2³
    dec    $95                   ; 5
    bne    LD923                 ; 2³
LD911:
    lda    #1                    ; 2
    sta    frameCounter          ; 3
    ldy    $BA                   ; 3
    iny                          ; 2
    tya                          ; 2
    and    #$FB                  ; 2
    sta    $BA                   ; 3
LD91D:
    sta    $BD                   ; 3
    lda    #$1F                  ; 2
    sta    $95                   ; 3
LD923:
    lda    INTIM                 ; 4
    bne    LD923                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    ldx    #$E4                  ; 2
    stx    TIM64T                ; 4
    sta    COLUBK                ; 3
    sta    COLUPF                ; 3
    sta    GRP0                  ; 3
    ldx    #$2E                  ; 2
LD939:
    dex                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    bne    LD939                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    stx    HMP0                  ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    lda    #3                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    ldy    #$14                  ; 2
    sty    $99                   ; 3
    lda    #$48                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    lda    LDA06                 ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
LD967:
    sta    GRP0                  ; 3
    lda    LDA07,Y               ; 4
    sta    GRP1                  ; 3
    lda    LDA1B,Y               ; 4
    sta    GRP0                  ; 3
    lda    LDA2F,Y               ; 4
    sta    $FD                   ; 3
    ldx    LDA43,Y               ; 4
    lda    LDEE4,Y               ; 4
    tay                          ; 2
    lda    $FD                   ; 3
    nop                          ; 2
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    ldy    $99                   ; 3
    dey                          ; 2
    lda    LD9F2,Y               ; 4
    dec    $99                   ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    bne    LD967                 ; 2³
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    ldx    #$14                  ; 2
LD99E:
    dex                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    bpl    LD99E                 ; 2³
    lda    $BA                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    jsr    LDBED                 ; 6
    ldx    #$0A                  ; 2
LD9AD:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LD9AD                 ; 2³
    lda    #$80                  ; 2
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
LD9BC:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LDE22,X               ; 4
    sta    GRP0                  ; 3
    lda    LDEA3,X               ; 4
    sta    GRP1                  ; 3
    inx                          ; 2
    cpx    #$11                  ; 2
    bne    LD9BC                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    AUDV1                 ; 3
LD9D5:
    lda    INTIM                 ; 4
    bne    LD9D5                 ; 2³
    lda    #$22                  ; 2
    sta    TIM64T                ; 4
LD9DF:
    lda    INTIM                 ; 4
    bne    LD9DF                 ; 2³
    jmp    LDFEC                 ; 3

LD9E7:
    .byte $00 ; |        | $D9E7
    .byte $00 ; |        | $D9E8
    .byte $01 ; |       X| $D9E9
    .byte $01 ; |       X| $D9EA
LD9EB:
    .byte $00 ; |        | $D9EB
    .byte $00 ; |        | $D9EC
    .byte $00 ; |        | $D9ED
    .byte $01 ; |       X| $D9EE
LD9EF:
    .byte $00 ; |        | $D9EF
    .byte $48 ; | X  X   | $D9F0
    .byte $00 ; |        | $D9F1
LD9F2:
    .byte $48 ; | X  X   | $D9F2
    .byte $04 ; |     X  | $D9F3
    .byte $85 ; |X    X X| $D9F4
    .byte $84 ; |X    X  | $D9F5
    .byte $C5 ; |XX   X X| $D9F6
    .byte $E1 ; |XXX    X| $D9F7
    .byte $F1 ; |XXXX   X| $D9F8
    .byte $F0 ; |XXXX    | $D9F9
    .byte $F2 ; |XXXX  X | $D9FA
    .byte $F7 ; |XXXX XXX| $D9FB
    .byte $FF ; |XXXXXXXX| $D9FC
    .byte $FF ; |XXXXXXXX| $D9FD
    .byte $FE ; |XXXXXXX | $D9FE
    .byte $FC ; |XXXXXX  | $D9FF
    .byte $F8 ; |XXXXX   | $DA00
    .byte $FC ; |XXXXXX  | $DA01
    .byte $FC ; |XXXXXX  | $DA02
    .byte $FE ; |XXXXXXX | $DA03
    .byte $F6 ; |XXXX XX | $DA04
    .byte $77 ; | XXX XXX| $DA05
LDA06:
    .byte $13 ; |   X  XX| $DA06
LDA07:
    .byte $00 ; |        | $DA07
    .byte $00 ; |        | $DA08
    .byte $C0 ; |XX      | $DA09
    .byte $40 ; | X      | $DA0A
    .byte $DC ; |XX XXX  | $DA0B
    .byte $55 ; | X X X X| $DA0C
    .byte $DC ; |XX XXX  | $DA0D
    .byte $14 ; |   X X  | $DA0E
    .byte $1C ; |   XXX  | $DA0F
    .byte $01 ; |       X| $DA10
    .byte $60 ; | XX     | $DA11
    .byte $60 ; | XX     | $DA12
    .byte $64 ; | XX  X  | $DA13
    .byte $64 ; | XX  X  | $DA14
    .byte $7D ; | XXXXX X| $DA15
    .byte $65 ; | XX  X X| $DA16
    .byte $65 ; | XX  X X| $DA17
    .byte $7D ; | XXXXX X| $DA18
    .byte $39 ; |  XXX  X| $DA19
    .byte $01 ; |       X| $DA1A
LDA1B:
    .byte $00 ; |        | $DA1B
    .byte $00 ; |        | $DA1C
    .byte $07 ; |     XXX| $DA1D
    .byte $0F ; |    XXXX| $DA1E
    .byte $0C ; |    XX  | $DA1F
    .byte $D8 ; |XX XX   | $DA20
    .byte $5B ; | X XX XX| $DA21
    .byte $DA ; |XX XX X | $DA22
    .byte $5B ; | X XX XX| $DA23
    .byte $C8 ; |XX  X   | $DA24
    .byte $0C ; |    XX  | $DA25
    .byte $07 ; |     XXX| $DA26
    .byte $01 ; |       X| $DA27
    .byte $80 ; |X       | $DA28
    .byte $93 ; |X  X  XX| $DA29
    .byte $97 ; |X  X XXX| $DA2A
    .byte $96 ; |X  X XX | $DA2B
    .byte $96 ; |X  X XX | $DA2C
    .byte $96 ; |X  X XX | $DA2D
    .byte $F7 ; |XXXX XXX| $DA2E
LDA2F:
    .byte $E3 ; |XXX   XX| $DA2F
    .byte $00 ; |        | $DA30
    .byte $80 ; |X       | $DA31
    .byte $C0 ; |XX      | $DA32
    .byte $C0 ; |XX      | $DA33
    .byte $54 ; | X X X  | $DA34
    .byte $54 ; | X X X  | $DA35
    .byte $5C ; | X XXX  | $DA36
    .byte $55 ; | X X X X| $DA37
    .byte $48 ; | X  X   | $DA38
    .byte $80 ; |X       | $DA39
    .byte $80 ; |X       | $DA3A
    .byte $00 ; |        | $DA3B
    .byte $81 ; |X      X| $DA3C
    .byte $D9 ; |XX XX  X| $DA3D
    .byte $D9 ; |XX XX  X| $DA3E
    .byte $5F ; | X XXXXX| $DA3F
    .byte $59 ; | X XX  X| $DA40
    .byte $59 ; | X XX  X| $DA41
    .byte $DF ; |XX XXXXX| $DA42
LDA43:
    .byte $8E ; |X   XXX | $DA43
    .byte $02 ; |      X | $DA44
    .byte $02 ; |      X | $DA45
    .byte $2B ; |  X X XX| $DA46
    .byte $AA ; |X X X X | $DA47
    .byte $BB ; |X XXX XX| $DA48
    .byte $A8 ; |X X X   | $DA49
    .byte $90 ; |X  X    | $DA4A
    .byte $C0 ; |XX      | $DA4B
    .byte $00 ; |        | $DA4C
    .byte $03 ; |      XX| $DA4D
    .byte $07 ; |     XXX| $DA4E
    .byte $66 ; | XX  XX | $DA4F
    .byte $66 ; | XX  XX | $DA50
    .byte $66 ; | XX  XX | $DA51
    .byte $67 ; | XX  XXX| $DA52
    .byte $63 ; | XX   XX| $DA53
    .byte $70 ; | XXX    | $DA54
    .byte $38 ; |  XXX   | $DA55
    .byte $00 ; |        | $DA56
    .byte $00 ; |        | $DA57
LDA58:
    .byte $5B ; | X XX XX| $DA58
    .byte $00 ; |        | $DA59
    .byte $58 ; | X XX   | $DA5A
    .byte $00 ; |        | $DA5B
    .byte $55 ; | X X X X| $DA5C
    .byte $12 ; |   X  X | $DA5D
    .byte $55 ; | X X X X| $DA5E
    .byte $00 ; |        | $DA5F
    .byte $52 ; | X X  X | $DA60
    .byte $0E ; |    XXX | $DA61
    .byte $40 ; | X      | $DA62
    .byte $00 ; |        | $DA63
    .byte $52 ; | X X  X | $DA64
    .byte $18 ; |   XX   | $DA65
    .byte $52 ; | X X  X | $DA66
    .byte $00 ; |        | $DA67
    .byte $52 ; | X X  X | $DA68
    .byte $0E ; |    XXX | $DA69
    .byte $50 ; | X X    | $DA6A
    .byte $00 ; |        | $DA6B
    .byte $52 ; | X X  X | $DA6C
    .byte $12 ; |   X  X | $DA6D
    .byte $52 ; | X X  X | $DA6E
    .byte $00 ; |        | $DA6F
    .byte $55 ; | X X X X| $DA70
    .byte $0E ; |    XXX | $DA71
    .byte $55 ; | X X X X| $DA72
    .byte $00 ; |        | $DA73
    .byte $5B ; | X XX XX| $DA74
    .byte $18 ; |   XX   | $DA75
    .byte $5B ; | X XX XX| $DA76
    .byte $00 ; |        | $DA77
    .byte $5B ; | X XX XX| $DA78
    .byte $0E ; |    XXX | $DA79
    .byte $58 ; | X XX   | $DA7A
    .byte $00 ; |        | $DA7B
    .byte $55 ; | X X X X| $DA7C
    .byte $12 ; |   X  X | $DA7D
    .byte $40 ; | X      | $DA7E
    .byte $00 ; |        | $DA7F
    .byte $55 ; | X X X X| $DA80
    .byte $0E ; |    XXX | $DA81
    .byte $40 ; | X      | $DA82
    .byte $00 ; |        | $DA83
    .byte $58 ; | X XX   | $DA84
    .byte $13 ; |   X  XX| $DA85
    .byte $40 ; | X      | $DA86
    .byte $00 ; |        | $DA87
    .byte $58 ; | X XX   | $DA88
    .byte $10 ; |   X    | $DA89
    .byte $40 ; | X      | $DA8A
    .byte $00 ; |        | $DA8B
    .byte $5B ; | X XX XX| $DA8C
    .byte $12 ; |   X  X | $DA8D
    .byte $5B ; | X XX XX| $DA8E
    .byte $00 ; |        | $DA8F
    .byte $5B ; | X XX XX| $DA90
    .byte $18 ; |   XX   | $DA91
    .byte $5B ; | X XX XX| $DA92
    .byte $00 ; |        | $DA93
    .byte $40 ; | X      | $DA94
    .byte $12 ; |   X  X | $DA95
    .byte $FF ; |XXXXXXXX| $DA96
    .byte $00 ; |        | $DA97
    .byte $00 ; |        | $DA98
    .byte $59 ; | X XX  X| $DA99
    .byte $00 ; |        | $DA9A
    .byte $58 ; | X XX   | $DA9B
    .byte $18 ; |   XX   | $DA9C
    .byte $58 ; | X XX   | $DA9D
    .byte $18 ; |   XX   | $DA9E
    .byte $5D ; | X XXX X| $DA9F
    .byte $10 ; |   X    | $DAA0
    .byte $40 ; | X      | $DAA1
    .byte $00 ; |        | $DAA2
    .byte $5D ; | X XXX X| $DAA3
    .byte $10 ; |   X    | $DAA4
    .byte $40 ; | X      | $DAA5
    .byte $00 ; |        | $DAA6
    .byte $4E ; | X  XXX | $DAA7
    .byte $10 ; |   X    | $DAA8
    .byte $40 ; | X      | $DAA9
    .byte $00 ; |        | $DAAA
    .byte $50 ; | X X    | $DAAB
    .byte $18 ; |   XX   | $DAAC
    .byte $52 ; | X X  X | $DAAD
    .byte $18 ; |   XX   | $DAAE
    .byte $53 ; | X X  XX| $DAAF
    .byte $10 ; |   X    | $DAB0
    .byte $56 ; | X X XX | $DAB1
    .byte $10 ; |   X    | $DAB2
    .byte $58 ; | X XX   | $DAB3
    .byte $18 ; |   XX   | $DAB4
    .byte $40 ; | X      | $DAB5
    .byte $18 ; |   XX   | $DAB6
    .byte $53 ; | X X  XX| $DAB7
    .byte $12 ; |   X  X | $DAB8
    .byte $72 ; | XXX  X | $DAB9
    .byte $13 ; |   X  XX| $DABA
    .byte $52 ; | X X  X | $DABB
    .byte $13 ; |   X  XX| $DABC
    .byte $FF ; |XXXXXXXX| $DABD
    .byte $72 ; | XXX  X | $DABE
    .byte $72 ; | XXX  X | $DABF
    .byte $77 ; | XXX XXX| $DAC0
    .byte $77 ; | XXX XXX| $DAC1
    .byte $74 ; | XXX X  | $DAC2
    .byte $74 ; | XXX X  | $DAC3
    .byte $7F ; | XXXXXXX| $DAC4
    .byte $7F ; | XXXXXXX| $DAC5
    .byte $60 ; | XX     | $DAC6
    .byte $60 ; | XX     | $DAC7
    .byte $7F ; | XXXXXXX| $DAC8
    .byte $7F ; | XXXXXXX| $DAC9
    .byte $74 ; | XXX X  | $DACA
    .byte $74 ; | XXX X  | $DACB
    .byte $72 ; | XXX  X | $DACC
    .byte $72 ; | XXX  X | $DACD
    .byte $77 ; | XXX XXX| $DACE
    .byte $77 ; | XXX XXX| $DACF
    .byte $FF ; |XXXXXXXX| $DAD0
    .byte $0C ; |    XX  | $DAD1
    .byte $0D ; |    XX X| $DAD2
    .byte $0E ; |    XXX | $DAD3
    .byte $10 ; |   X    | $DAD4
    .byte $0E ; |    XXX | $DAD5
    .byte $10 ; |   X    | $DAD6
    .byte $12 ; |   X  X | $DAD7
    .byte $14 ; |   X X  | $DAD8
    .byte $12 ; |   X  X | $DAD9
    .byte $14 ; |   X X  | $DADA
    .byte $17 ; |   X XXX| $DADB
    .byte $18 ; |   XX   | $DADC
    .byte $17 ; |   X XXX| $DADD
    .byte $18 ; |   XX   | $DADE
    .byte $1B ; |   XX XX| $DADF
    .byte $1F ; |   XXXXX| $DAE0
    .byte $FF ; |XXXXXXXX| $DAE1
    .byte $FF ; |XXXXXXXX| $DAE2
    .byte $72 ; | XXX  X | $DAE3
    .byte $77 ; | XXX XXX| $DAE4
    .byte $77 ; | XXX XXX| $DAE5
    .byte $FF ; |XXXXXXXX| $DAE6
    .byte $0C ; |    XX  | $DAE7
    .byte $0D ; |    XX X| $DAE8
    .byte $0E ; |    XXX | $DAE9
    .byte $10 ; |   X    | $DAEA
    .byte $0E ; |    XXX | $DAEB
    .byte $10 ; |   X    | $DAEC
    .byte $12 ; |   X  X | $DAED
    .byte $14 ; |   X X  | $DAEE
    .byte $12 ; |   X  X | $DAEF
    .byte $14 ; |   X X  | $DAF0
    .byte $17 ; |   X XXX| $DAF1
    .byte $18 ; |   XX   | $DAF2
    .byte $17 ; |   X XXX| $DAF3
    .byte $18 ; |   XX   | $DAF4
    .byte $1B ; |   XX XX| $DAF5
    .byte $1F ; |   XXXXX| $DAF6
    .byte $FF ; |XXXXXXXX| $DAF7
    .byte $FF ; |XXXXXXXX| $DAF8
    .byte $18 ; |   XX   | $DAF9
    .byte $1B ; |   XX XX| $DAFA
    .byte $1F ; |   XXXXX| $DAFB
    .byte $FF ; |XXXXXXXX| $DAFC
    .byte $1B ; |   XX XX| $DAFD
    .byte $1F ; |   XXXXX| $DAFE
    .byte $FF ; |XXXXXXXX| $DAFF
LDB00:
    .byte $38 ; |  XXX   | $DB00
    .byte $6C ; | XX XX  | $DB01
    .byte $C6 ; |XX   XX | $DB02
    .byte $C6 ; |XX   XX | $DB03
    .byte $C6 ; |XX   XX | $DB04
    .byte $6C ; | XX XX  | $DB05
    .byte $38 ; |  XXX   | $DB06
    .byte $00 ; |        | $DB07
    .byte $7E ; | XXXXXX | $DB08
    .byte $18 ; |   XX   | $DB09
    .byte $18 ; |   XX   | $DB0A
    .byte $18 ; |   XX   | $DB0B
    .byte $18 ; |   XX   | $DB0C
    .byte $38 ; |  XXX   | $DB0D
    .byte $18 ; |   XX   | $DB0E
    .byte $00 ; |        | $DB0F
    .byte $FE ; |XXXXXXX | $DB10
    .byte $C0 ; |XX      | $DB11
    .byte $E0 ; |XXX     | $DB12
    .byte $3C ; |  XXXX  | $DB13
    .byte $06 ; |     XX | $DB14
    .byte $C6 ; |XX   XX | $DB15
    .byte $7C ; | XXXXX  | $DB16
    .byte $00 ; |        | $DB17
    .byte $FC ; |XXXXXX  | $DB18
    .byte $06 ; |     XX | $DB19
    .byte $06 ; |     XX | $DB1A
    .byte $7C ; | XXXXX  | $DB1B
    .byte $06 ; |     XX | $DB1C
    .byte $06 ; |     XX | $DB1D
    .byte $FC ; |XXXXXX  | $DB1E
    .byte $00 ; |        | $DB1F
    .byte $0C ; |    XX  | $DB20
    .byte $0C ; |    XX  | $DB21
    .byte $0C ; |    XX  | $DB22
    .byte $FE ; |XXXXXXX | $DB23
    .byte $CC ; |XX  XX  | $DB24
    .byte $CC ; |XX  XX  | $DB25
    .byte $CC ; |XX  XX  | $DB26
    .byte $00 ; |        | $DB27
    .byte $FC ; |XXXXXX  | $DB28
    .byte $06 ; |     XX | $DB29
    .byte $06 ; |     XX | $DB2A
    .byte $FC ; |XXXXXX  | $DB2B
    .byte $C0 ; |XX      | $DB2C
    .byte $C0 ; |XX      | $DB2D
    .byte $FC ; |XXXXXX  | $DB2E
    .byte $00 ; |        | $DB2F
    .byte $7C ; | XXXXX  | $DB30
    .byte $C6 ; |XX   XX | $DB31
    .byte $C6 ; |XX   XX | $DB32
    .byte $FC ; |XXXXXX  | $DB33
    .byte $C0 ; |XX      | $DB34
    .byte $C0 ; |XX      | $DB35
    .byte $7C ; | XXXXX  | $DB36
    .byte $00 ; |        | $DB37
    .byte $30 ; |  XX    | $DB38
    .byte $30 ; |  XX    | $DB39
    .byte $18 ; |   XX   | $DB3A
    .byte $18 ; |   XX   | $DB3B
    .byte $0C ; |    XX  | $DB3C
    .byte $06 ; |     XX | $DB3D
    .byte $FE ; |XXXXXXX | $DB3E
    .byte $00 ; |        | $DB3F
    .byte $7C ; | XXXXX  | $DB40
    .byte $C6 ; |XX   XX | $DB41
    .byte $C6 ; |XX   XX | $DB42
    .byte $7C ; | XXXXX  | $DB43
    .byte $C6 ; |XX   XX | $DB44
    .byte $C6 ; |XX   XX | $DB45
    .byte $7C ; | XXXXX  | $DB46
    .byte $00 ; |        | $DB47
    .byte $7C ; | XXXXX  | $DB48
    .byte $06 ; |     XX | $DB49
    .byte $06 ; |     XX | $DB4A
    .byte $7E ; | XXXXXX | $DB4B
    .byte $C6 ; |XX   XX | $DB4C
    .byte $C6 ; |XX   XX | $DB4D
    .byte $7C ; | XXXXX  | $DB4E
    .byte $00 ; |        | $DB4F
    .byte $00 ; |        | $DB50
    .byte $00 ; |        | $DB51
    .byte $00 ; |        | $DB52
    .byte $00 ; |        | $DB53
    .byte $00 ; |        | $DB54
    .byte $00 ; |        | $DB55
    .byte $00 ; |        | $DB56
    .byte $28 ; |  X X   | $DB57
    .byte $7C ; | XXXXX  | $DB58
    .byte $F6 ; |XXXX XX | $DB59
    .byte $BE ; |X XXXXX | $DB5A
    .byte $EE ; |XXX XXX | $DB5B
    .byte $FE ; |XXXXXXX | $DB5C
    .byte $F6 ; |XXXX XX | $DB5D
    .byte $5C ; | X XXX  | $DB5E
    .byte $7C ; | XXXXX  | $DB5F
    .byte $28 ; |  X X   | $DB60
    .byte $38 ; |  XXX   | $DB61
    .byte $00 ; |        | $DB62
    .byte $00 ; |        | $DB63
    .byte $00 ; |        | $DB64
    .byte $00 ; |        | $DB65
    .byte $00 ; |        | $DB66
    .byte $00 ; |        | $DB67
    .byte $18 ; |   XX   | $DB68
    .byte $3C ; |  XXXX  | $DB69
    .byte $7E ; | XXXXXX | $DB6A
    .byte $7E ; | XXXXXX | $DB6B
    .byte $7E ; | XXXXXX | $DB6C
    .byte $5E ; | X XXXX | $DB6D
    .byte $6E ; | XX XXX | $DB6E
    .byte $3C ; |  XXXX  | $DB6F
    .byte $18 ; |   XX   | $DB70
    .byte $00 ; |        | $DB71
    .byte $00 ; |        | $DB72
    .byte $00 ; |        | $DB73
    .byte $00 ; |        | $DB74
    .byte $00 ; |        | $DB75
    .byte $00 ; |        | $DB76
    .byte $00 ; |        | $DB77
    .byte $00 ; |        | $DB78
    .byte $04 ; |     X  | $DB79
    .byte $04 ; |     X  | $DB7A
    .byte $0A ; |    X X | $DB7B
    .byte $0A ; |    X X | $DB7C
    .byte $11 ; |   X   X| $DB7D
    .byte $11 ; |   X   X| $DB7E
    .byte $52 ; | X X  X | $DB7F
    .byte $A5 ; |X X  X X| $DB80
    .byte $E7 ; |XXX  XXX| $DB81
    .byte $E7 ; |XXX  XXX| $DB82
    .byte $42 ; | X    X | $DB83
    .byte $00 ; |        | $DB84
    .byte $00 ; |        | $DB85
    .byte $00 ; |        | $DB86
    .byte $00 ; |        | $DB87
    .byte $00 ; |        | $DB88
    .byte $00 ; |        | $DB89
    .byte $05 ; |     X X| $DB8A
    .byte $1A ; |   XX X | $DB8B
    .byte $3D ; |  XXXX X| $DB8C
    .byte $6E ; | XX XXX | $DB8D
    .byte $7A ; | XXXX X | $DB8E
    .byte $EE ; |XXX XXX | $DB8F
    .byte $BC ; |X XXXX  | $DB90
    .byte $EC ; |XXX XX  | $DB91
    .byte $B8 ; |X XXX   | $DB92
    .byte $F0 ; |XXXX    | $DB93
    .byte $60 ; | XX     | $DB94
    .byte $00 ; |        | $DB95
LDB96:
    .byte $00 ; |        | $DB96
    .byte $00 ; |        | $DB97
    .byte $00 ; |        | $DB98
    .byte $00 ; |        | $DB99
    .byte $00 ; |        | $DB9A
    .byte $01 ; |       X| $DB9B
    .byte $05 ; |     X X| $DB9C
    .byte $15 ; |   X X X| $DB9D
    .byte $55 ; | X X X X| $DB9E
    .byte $18 ; |   XX   | $DB9F
    .byte $18 ; |   XX   | $DBA0
    .byte $3C ; |  XXXX  | $DBA1
    .byte $3C ; |  XXXX  | $DBA2
    .byte $3C ; |  XXXX  | $DBA3
    .byte $3C ; |  XXXX  | $DBA4
    .byte $3C ; |  XXXX  | $DBA5
    .byte $00 ; |        | $DBA6
    .byte $7E ; | XXXXXX | $DBA7
    .byte $7E ; | XXXXXX | $DBA8
    .byte $08 ; |    X   | $DBA9
    .byte $00 ; |        | $DBAA
    .byte $00 ; |        | $DBAB
    .byte $00 ; |        | $DBAC
    .byte $00 ; |        | $DBAD
    .byte $00 ; |        | $DBAE
    .byte $00 ; |        | $DBAF
    .byte $30 ; |  XX    | $DBB0
    .byte $78 ; | XXXX   | $DBB1
    .byte $38 ; |  XXX   | $DBB2
    .byte $3C ; |  XXXX  | $DBB3
    .byte $3E ; |  XXXXX | $DBB4
    .byte $3D ; |  XXXX X| $DBB5
    .byte $3B ; |  XXX XX| $DBB6
    .byte $36 ; |  XX XX | $DBB7
    .byte $2C ; |  X XX  | $DBB8
    .byte $18 ; |   XX   | $DBB9
    .byte $34 ; |  XX X  | $DBBA
    .byte $00 ; |        | $DBBB
    .byte $00 ; |        | $DBBC
    .byte $00 ; |        | $DBBD
    .byte $00 ; |        | $DBBE
    .byte $00 ; |        | $DBBF
    .byte $00 ; |        | $DBC0
    .byte $0C ; |    XX  | $DBC1
    .byte $1E ; |   XXXX | $DBC2
    .byte $1C ; |   XXX  | $DBC3
    .byte $3C ; |  XXXX  | $DBC4
    .byte $7C ; | XXXXX  | $DBC5
    .byte $BC ; |X XXXX  | $DBC6
    .byte $DC ; |XX XXX  | $DBC7
    .byte $6C ; | XX XX  | $DBC8
    .byte $34 ; |  XX X  | $DBC9
    .byte $18 ; |   XX   | $DBCA
    .byte $2C ; |  X XX  | $DBCB
    .byte $00 ; |        | $DBCC
    .byte $00 ; |        | $DBCD
    .byte $00 ; |        | $DBCE
    .byte $00 ; |        | $DBCF
    .byte $00 ; |        | $DBD0
    .byte $00 ; |        | $DBD1
LDBD2:
    .byte $FF ; |XXXXXXXX| $DBD2
    .byte $01 ; |       X| $DBD3
    .byte $01 ; |       X| $DBD4
    .byte $FF ; |XXXXXXXX| $DBD5

LDBD6:
    lda    #$79                  ; 2
    cmp    $B8                   ; 3
    bcc    LDBDD                 ; 2³
    rts                          ; 6

LDBDD:
    sta    $B8                   ; 3
    rts                          ; 6

LDBE0:
    lda    #3                    ; 2
    sta    $92                   ; 3
    lda    #1                    ; 2
    sta    $B6                   ; 3
    lda    #7                    ; 2
    sta    $93                   ; 3
    rts                          ; 6

LDBED:
    lda    LD9EF,X               ; 4
    sta    COLUP1                ; 3
    lda    #$2B                  ; 2
    sta    COLUP0                ; 3
    lda    LD9E7,X               ; 4
    sta    NUSIZ0                ; 3
    lda    LD9EB,X               ; 4
    sta    NUSIZ1                ; 3
    rts                          ; 6

    .byte $40 ; | X      | $DC01
    .byte $40 ; | X      | $DC02
    .byte $40 ; | X      | $DC03
    .byte $40 ; | X      | $DC04
    .byte $40 ; | X      | $DC05
    .byte $A0 ; |X X     | $DC06
    .byte $10 ; |   X    | $DC07
    .byte $50 ; | X X    | $DC08
    .byte $B0 ; |X XX    | $DC09
    .byte $38 ; |  XXX   | $DC0A
    .byte $34 ; |  XX X  | $DC0B
    .byte $1E ; |   XXXX | $DC0C
    .byte $1E ; |   XXXX | $DC0D
    .byte $0A ; |    X X | $DC0E
    .byte $08 ; |    X   | $DC0F
    .byte $18 ; |   XX   | $DC10
    .byte $18 ; |   XX   | $DC11
    .byte $3F ; |  XXXXXX| $DC12
    .byte $3B ; |  XXX XX| $DC13
    .byte $38 ; |  XXX   | $DC14
    .byte $78 ; | XXXX   | $DC15
    .byte $7C ; | XXXXX  | $DC16
    .byte $7C ; | XXXXX  | $DC17
    .byte $78 ; | XXXX   | $DC18
    .byte $70 ; | XXX    | $DC19
    .byte $D0 ; |XX X    | $DC1A
    .byte $A0 ; |X X     | $DC1B
    .byte $3C ; |  XXXX  | $DC1C
    .byte $00 ; |        | $DC1D
    .byte $02 ; |      X | $DC1E
    .byte $05 ; |     X X| $DC1F
    .byte $08 ; |    X   | $DC20
    .byte $0A ; |    X X | $DC21
    .byte $0D ; |    XX X| $DC22
    .byte $1C ; |   XXX  | $DC23
    .byte $2C ; |  X XX  | $DC24
    .byte $78 ; | XXXX   | $DC25
    .byte $78 ; | XXXX   | $DC26
    .byte $50 ; | X X    | $DC27
    .byte $10 ; |   X    | $DC28
    .byte $18 ; |   XX   | $DC29
    .byte $18 ; |   XX   | $DC2A
    .byte $FC ; |XXXXXX  | $DC2B
    .byte $DC ; |XX XXX  | $DC2C
    .byte $1C ; |   XXX  | $DC2D
    .byte $1E ; |   XXXX | $DC2E
    .byte $3E ; |  XXXXX | $DC2F
    .byte $3E ; |  XXXXX | $DC30
    .byte $1E ; |   XXXX | $DC31
    .byte $0E ; |    XXX | $DC32
    .byte $0B ; |    X XX| $DC33
    .byte $05 ; |     X X| $DC34
    .byte $3C ; |  XXXX  | $DC35
    .byte $00 ; |        | $DC36
    .byte $60 ; | XX     | $DC37
    .byte $90 ; |X  X    | $DC38
    .byte $60 ; | XX     | $DC39
    .byte $B8 ; |X XXX   | $DC3A
    .byte $34 ; |  XX X  | $DC3B
    .byte $1E ; |   XXXX | $DC3C
    .byte $1E ; |   XXXX | $DC3D
    .byte $0A ; |    X X | $DC3E
    .byte $08 ; |    X   | $DC3F
    .byte $18 ; |   XX   | $DC40
    .byte $18 ; |   XX   | $DC41
    .byte $18 ; |   XX   | $DC42
    .byte $3F ; |  XXXXXX| $DC43
    .byte $3B ; |  XXX XX| $DC44
    .byte $78 ; | XXXX   | $DC45
    .byte $7C ; | XXXXX  | $DC46
    .byte $7C ; | XXXXX  | $DC47
    .byte $78 ; | XXXX   | $DC48
    .byte $D0 ; |XX X    | $DC49
    .byte $90 ; |X  X    | $DC4A
    .byte $B0 ; |X XX    | $DC4B
    .byte $18 ; |   XX   | $DC4C
    .byte $0C ; |    XX  | $DC4D
    .byte $00 ; |        | $DC4E
    .byte $00 ; |        | $DC4F
    .byte $06 ; |     XX | $DC50
    .byte $09 ; |    X  X| $DC51
    .byte $06 ; |     XX | $DC52
    .byte $1D ; |   XXX X| $DC53
    .byte $2C ; |  X XX  | $DC54
    .byte $78 ; | XXXX   | $DC55
    .byte $78 ; | XXXX   | $DC56
    .byte $50 ; | X X    | $DC57
    .byte $10 ; |   X    | $DC58
    .byte $18 ; |   XX   | $DC59
    .byte $18 ; |   XX   | $DC5A
    .byte $18 ; |   XX   | $DC5B
    .byte $FC ; |XXXXXX  | $DC5C
    .byte $DC ; |XX XXX  | $DC5D
    .byte $1E ; |   XXXX | $DC5E
    .byte $3E ; |  XXXXX | $DC5F
    .byte $3E ; |  XXXXX | $DC60
    .byte $1E ; |   XXXX | $DC61
    .byte $0B ; |    X XX| $DC62
    .byte $09 ; |    X  X| $DC63
    .byte $0D ; |    XX X| $DC64
    .byte $18 ; |   XX   | $DC65
    .byte $30 ; |  XX    | $DC66
    .byte $00 ; |        | $DC67
    .byte $00 ; |        | $DC68
    .byte $1C ; |   XXX  | $DC69
    .byte $72 ; | XXX  X | $DC6A
    .byte $AC ; |X X XX  | $DC6B
    .byte $F2 ; |XXXX  X | $DC6C
    .byte $A0 ; |X X     | $DC6D
    .byte $30 ; |  XX    | $DC6E
    .byte $38 ; |  XXX   | $DC6F
    .byte $7C ; | XXXXX  | $DC70
    .byte $BE ; |X XXXXX | $DC71
    .byte $9E ; |X  XXXX | $DC72
    .byte $1E ; |   XXXX | $DC73
    .byte $0C ; |    XX  | $DC74
    .byte $07 ; |     XXX| $DC75
    .byte $01 ; |       X| $DC76
    .byte $00 ; |        | $DC77
    .byte $00 ; |        | $DC78
    .byte $00 ; |        | $DC79
    .byte $38 ; |  XXX   | $DC7A
    .byte $4E ; | X  XXX | $DC7B
    .byte $35 ; |  XX X X| $DC7C
    .byte $4F ; | X  XXXX| $DC7D
    .byte $05 ; |     X X| $DC7E
    .byte $0C ; |    XX  | $DC7F
    .byte $1C ; |   XXX  | $DC80
    .byte $3E ; |  XXXXX | $DC81
    .byte $7D ; | XXXXX X| $DC82
    .byte $79 ; | XXXX  X| $DC83
    .byte $78 ; | XXXX   | $DC84
    .byte $30 ; |  XX    | $DC85
    .byte $E0 ; |XXX     | $DC86
    .byte $80 ; |X       | $DC87
    .byte $00 ; |        | $DC88
    .byte $00 ; |        | $DC89
    .byte $00 ; |        | $DC8A
    .byte $01 ; |       X| $DC8B
    .byte $22 ; |  X   X | $DC8C
    .byte $12 ; |   X  X | $DC8D
    .byte $12 ; |   X  X | $DC8E
    .byte $D6 ; |XX X XX | $DC8F
    .byte $5C ; | X XXX  | $DC90
    .byte $7C ; | XXXXX  | $DC91
    .byte $78 ; | XXXX   | $DC92
    .byte $38 ; |  XXX   | $DC93
    .byte $38 ; |  XXX   | $DC94
    .byte $BB ; |X XXX XX| $DC95
    .byte $FD ; |XXXXXX X| $DC96
    .byte $B9 ; |X XXX  X| $DC97
    .byte $FB ; |XXXXX XX| $DC98
    .byte $9D ; |X  XXX X| $DC99
    .byte $B1 ; |X XX   X| $DC9A
    .byte $28 ; |  X X   | $DC9B
    .byte $38 ; |  XXX   | $DC9C
    .byte $38 ; |  XXX   | $DC9D
    .byte $10 ; |   X    | $DC9E
    .byte $38 ; |  XXX   | $DC9F
    .byte $38 ; |  XXX   | $DCA0
    .byte $38 ; |  XXX   | $DCA1
    .byte $10 ; |   X    | $DCA2
    .byte $00 ; |        | $DCA3
    .byte $80 ; |X       | $DCA4
    .byte $44 ; | X   X  | $DCA5
    .byte $48 ; | X  X   | $DCA6
    .byte $48 ; | X  X   | $DCA7
    .byte $6B ; | XX X XX| $DCA8
    .byte $3A ; |  XXX X | $DCA9
    .byte $3E ; |  XXXXX | $DCAA
    .byte $1E ; |   XXXX | $DCAB
    .byte $1C ; |   XXX  | $DCAC
    .byte $1C ; |   XXX  | $DCAD
    .byte $1C ; |   XXX  | $DCAE
    .byte $1C ; |   XXX  | $DCAF
    .byte $3C ; |  XXXX  | $DCB0
    .byte $7A ; | XXXX X | $DCB1
    .byte $5A ; | X XX X | $DCB2
    .byte $AB ; |X X X XX| $DCB3
    .byte $95 ; |X  X X X| $DCB4
    .byte $9D ; |X  XXX X| $DCB5
    .byte $9D ; |X  XXX X| $DCB6
    .byte $89 ; |X   X  X| $DCB7
    .byte $9D ; |X  XXX X| $DCB8
    .byte $1C ; |   XXX  | $DCB9
    .byte $1C ; |   XXX  | $DCBA
    .byte $08 ; |    X   | $DCBB
    .byte $00 ; |        | $DCBC
    .byte $04 ; |     X  | $DCBD
    .byte $0A ; |    X X | $DCBE
    .byte $34 ; |  XX X  | $DCBF
    .byte $52 ; | X X  X | $DCC0
    .byte $F0 ; |XXXX    | $DCC1
    .byte $E0 ; |XXX     | $DCC2
    .byte $A1 ; |X X    X| $DCC3
    .byte $31 ; |  XX   X| $DCC4
    .byte $39 ; |  XXX  X| $DCC5
    .byte $FF ; |XXXXXXXX| $DCC6
    .byte $BF ; |X XXXXXX| $DCC7
    .byte $1E ; |   XXXX | $DCC8
    .byte $1E ; |   XXXX | $DCC9
    .byte $04 ; |     X  | $DCCA
    .byte $04 ; |     X  | $DCCB
    .byte $1C ; |   XXX  | $DCCC
    .byte $00 ; |        | $DCCD
    .byte $04 ; |     X  | $DCCE
    .byte $0A ; |    X X | $DCCF
    .byte $10 ; |   X    | $DCD0
    .byte $14 ; |   X X  | $DCD1
    .byte $0A ; |    X X | $DCD2
    .byte $38 ; |  XXX   | $DCD3
    .byte $58 ; | X XX   | $DCD4
    .byte $F0 ; |XXXX    | $DCD5
    .byte $F0 ; |XXXX    | $DCD6
    .byte $A0 ; |X X     | $DCD7
    .byte $20 ; |  X     | $DCD8
    .byte $30 ; |  XX    | $DCD9
    .byte $38 ; |  XXX   | $DCDA
    .byte $F8 ; |XXXXX   | $DCDB
    .byte $3C ; |  XXXX  | $DCDC
    .byte $3C ; |  XXXX  | $DCDD
    .byte $3E ; |  XXXXX | $DCDE
    .byte $3E ; |  XXXXX | $DCDF
    .byte $13 ; |   X  XX| $DCE0
    .byte $1D ; |   XXX X| $DCE1
    .byte $08 ; |    X   | $DCE2
    .byte $18 ; |   XX   | $DCE3
    .byte $10 ; |   X    | $DCE4
    .byte $30 ; |  XX    | $DCE5
    .byte $00 ; |        | $DCE6
    .byte $20 ; |  X     | $DCE7
    .byte $50 ; | X X    | $DCE8
    .byte $08 ; |    X   | $DCE9
    .byte $28 ; |  X X   | $DCEA
    .byte $50 ; | X X    | $DCEB
    .byte $1C ; |   XXX  | $DCEC
    .byte $1A ; |   XX X | $DCED
    .byte $0F ; |    XXXX| $DCEE
    .byte $0F ; |    XXXX| $DCEF
    .byte $05 ; |     X X| $DCF0
    .byte $04 ; |     X  | $DCF1
    .byte $0C ; |    XX  | $DCF2
    .byte $1C ; |   XXX  | $DCF3
    .byte $1F ; |   XXXXX| $DCF4
    .byte $3C ; |  XXXX  | $DCF5
    .byte $3C ; |  XXXX  | $DCF6
    .byte $7C ; | XXXXX  | $DCF7
    .byte $7C ; | XXXXX  | $DCF8
    .byte $C8 ; |XX  X   | $DCF9
    .byte $B8 ; |X XXX   | $DCFA
    .byte $10 ; |   X    | $DCFB
    .byte $18 ; |   XX   | $DCFC
    .byte $08 ; |    X   | $DCFD
    .byte $0C ; |    XX  | $DCFE
    .byte $00 ; |        | $DCFF
LDD00:
    .byte $77 ; | XXX XXX| $DD00
    .byte $55 ; | X X X X| $DD01
    .byte $55 ; | X X X X| $DD02
    .byte $55 ; | X X X X| $DD03
    .byte $77 ; | XXX XXX| $DD04
    .byte $00 ; |        | $DD05
    .byte $00 ; |        | $DD06
    .byte $00 ; |        | $DD07
    .byte $77 ; | XXX XXX| $DD08
    .byte $22 ; |  X   X | $DD09
    .byte $22 ; |  X   X | $DD0A
    .byte $66 ; | XX  XX | $DD0B
    .byte $22 ; |  X   X | $DD0C
    .byte $00 ; |        | $DD0D
    .byte $00 ; |        | $DD0E
    .byte $00 ; |        | $DD0F
    .byte $77 ; | XXX XXX| $DD10
    .byte $44 ; | X   X  | $DD11
    .byte $22 ; |  X   X | $DD12
    .byte $11 ; |   X   X| $DD13
    .byte $77 ; | XXX XXX| $DD14
    .byte $00 ; |        | $DD15
    .byte $00 ; |        | $DD16
    .byte $00 ; |        | $DD17
    .byte $77 ; | XXX XXX| $DD18
    .byte $11 ; |   X   X| $DD19
    .byte $33 ; |  XX  XX| $DD1A
    .byte $11 ; |   X   X| $DD1B
    .byte $77 ; | XXX XXX| $DD1C
    .byte $00 ; |        | $DD1D
    .byte $00 ; |        | $DD1E
    .byte $00 ; |        | $DD1F
    .byte $11 ; |   X   X| $DD20
    .byte $11 ; |   X   X| $DD21
    .byte $77 ; | XXX XXX| $DD22
    .byte $55 ; | X X X X| $DD23
    .byte $44 ; | X   X  | $DD24
    .byte $00 ; |        | $DD25
    .byte $00 ; |        | $DD26
    .byte $00 ; |        | $DD27
    .byte $77 ; | XXX XXX| $DD28
    .byte $11 ; |   X   X| $DD29
    .byte $77 ; | XXX XXX| $DD2A
    .byte $44 ; | X   X  | $DD2B
    .byte $77 ; | XXX XXX| $DD2C
    .byte $00 ; |        | $DD2D
    .byte $00 ; |        | $DD2E
    .byte $00 ; |        | $DD2F
    .byte $77 ; | XXX XXX| $DD30
    .byte $55 ; | X X X X| $DD31
    .byte $77 ; | XXX XXX| $DD32
    .byte $44 ; | X   X  | $DD33
    .byte $77 ; | XXX XXX| $DD34
    .byte $00 ; |        | $DD35
    .byte $00 ; |        | $DD36
    .byte $00 ; |        | $DD37
    .byte $22 ; |  X   X | $DD38
    .byte $22 ; |  X   X | $DD39
    .byte $11 ; |   X   X| $DD3A
    .byte $11 ; |   X   X| $DD3B
    .byte $77 ; | XXX XXX| $DD3C
    .byte $00 ; |        | $DD3D
    .byte $00 ; |        | $DD3E
    .byte $00 ; |        | $DD3F
    .byte $77 ; | XXX XXX| $DD40
    .byte $55 ; | X X X X| $DD41
    .byte $77 ; | XXX XXX| $DD42
    .byte $55 ; | X X X X| $DD43
    .byte $77 ; | XXX XXX| $DD44
    .byte $00 ; |        | $DD45
    .byte $00 ; |        | $DD46
    .byte $00 ; |        | $DD47
    .byte $77 ; | XXX XXX| $DD48
    .byte $11 ; |   X   X| $DD49
    .byte $77 ; | XXX XXX| $DD4A
    .byte $55 ; | X X X X| $DD4B
    .byte $77 ; | XXX XXX| $DD4C
    .byte $00 ; |        | $DD4D
    .byte $00 ; |        | $DD4E
    .byte $00 ; |        | $DD4F
    .byte $00 ; |        | $DD50
    .byte $00 ; |        | $DD51
LDD52:
    .byte $00 ; |        | $DD52
    .byte $00 ; |        | $DD53
    .byte $00 ; |        | $DD54
    .byte $FF ; |XXXXXXXX| $DD55
    .byte $60 ; | XX     | $DD56
    .byte $60 ; | XX     | $DD57
    .byte $60 ; | XX     | $DD58
    .byte $60 ; | XX     | $DD59
    .byte $60 ; | XX     | $DD5A
    .byte $FF ; |XXXXXXXX| $DD5B
    .byte $00 ; |        | $DD5C
    .byte $00 ; |        | $DD5D
    .byte $00 ; |        | $DD5E
    .byte $00 ; |        | $DD5F
    .byte $00 ; |        | $DD60
    .byte $FF ; |XXXXXXXX| $DD61
    .byte $60 ; | XX     | $DD62
    .byte $60 ; | XX     | $DD63
    .byte $60 ; | XX     | $DD64
    .byte $60 ; | XX     | $DD65
    .byte $60 ; | XX     | $DD66
    .byte $FF ; |XXXXXXXX| $DD67
    .byte $00 ; |        | $DD68
    .byte $00 ; |        | $DD69
    .byte $00 ; |        | $DD6A
    .byte $FF ; |XXXXXXXX| $DD6B
    .byte $30 ; |  XX    | $DD6C
    .byte $FC ; |XXXXXX  | $DD6D
    .byte $00 ; |        | $DD6E
    .byte $00 ; |        | $DD6F
    .byte $00 ; |        | $DD70
    .byte $FF ; |XXXXXXXX| $DD71
    .byte $3F ; |  XXXXXX| $DD72
    .byte $00 ; |        | $DD73
    .byte $00 ; |        | $DD74
    .byte $00 ; |        | $DD75
    .byte $00 ; |        | $DD76
    .byte $FF ; |XXXXXXXX| $DD77
    .byte $0C ; |    XX  | $DD78
    .byte $3F ; |  XXXXXX| $DD79
    .byte $00 ; |        | $DD7A
    .byte $00 ; |        | $DD7B
    .byte $00 ; |        | $DD7C
    .byte $FF ; |XXXXXXXX| $DD7D
    .byte $00 ; |        | $DD7E
    .byte $00 ; |        | $DD7F
    .byte $00 ; |        | $DD80
    .byte $FF ; |XXXXXXXX| $DD81
    .byte $00 ; |        | $DD82
    .byte $00 ; |        | $DD83
    .byte $00 ; |        | $DD84
    .byte $1F ; |   XXXXX| $DD85
    .byte $0C ; |    XX  | $DD86
    .byte $FF ; |XXXXXXXX| $DD87
    .byte $60 ; | XX     | $DD88
    .byte $FF ; |XXXXXXXX| $DD89
    .byte $00 ; |        | $DD8A
    .byte $00 ; |        | $DD8B
    .byte $01 ; |       X| $DD8C
    .byte $F8 ; |XXXXX   | $DD8D
    .byte $07 ; |     XXX| $DD8E
    .byte $00 ; |        | $DD8F
    .byte $00 ; |        | $DD90
    .byte $00 ; |        | $DD91
    .byte $FF ; |XXXXXXXX| $DD92
    .byte $FF ; |XXXXXXXX| $DD93
    .byte $20 ; |  X     | $DD94
    .byte $50 ; | X X    | $DD95
    .byte $2C ; |  X XX  | $DD96
    .byte $4A ; | X  X X | $DD97
    .byte $0F ; |    XXXX| $DD98
    .byte $07 ; |     XXX| $DD99
    .byte $85 ; |X    X X| $DD9A
    .byte $8C ; |X   XX  | $DD9B
    .byte $9C ; |X  XXX  | $DD9C
    .byte $FF ; |XXXXXXXX| $DD9D
    .byte $FD ; |XXXXXX X| $DD9E
    .byte $78 ; | XXXX   | $DD9F
    .byte $78 ; | XXXX   | $DDA0
    .byte $20 ; |  X     | $DDA1
    .byte $20 ; |  X     | $DDA2
    .byte $38 ; |  XXX   | $DDA3
    .byte $00 ; |        | $DDA4
    .byte $08 ; |    X   | $DDA5
    .byte $1C ; |   XXX  | $DDA6
    .byte $1C ; |   XXX  | $DDA7
    .byte $9D ; |X  XXX X| $DDA8
    .byte $89 ; |X   X  X| $DDA9
    .byte $9D ; |X  XXX X| $DDAA
    .byte $9D ; |X  XXX X| $DDAB
    .byte $95 ; |X  X X X| $DDAC
    .byte $AB ; |X X X XX| $DDAD
    .byte $5A ; | X XX X | $DDAE
    .byte $7A ; | XXXX X | $DDAF
    .byte $3C ; |  XXXX  | $DDB0
    .byte $1C ; |   XXX  | $DDB1
    .byte $1C ; |   XXX  | $DDB2
    .byte $1C ; |   XXX  | $DDB3
    .byte $1C ; |   XXX  | $DDB4
    .byte $1E ; |   XXXX | $DDB5
    .byte $3E ; |  XXXXX | $DDB6
    .byte $3A ; |  XXX X | $DDB7
    .byte $6B ; | XX X XX| $DDB8
    .byte $48 ; | X  X   | $DDB9
    .byte $48 ; | X  X   | $DDBA
    .byte $44 ; | X   X  | $DDBB
    .byte $80 ; |X       | $DDBC
    .byte $00 ; |        | $DDBD
    .byte $10 ; |   X    | $DDBE
    .byte $38 ; |  XXX   | $DDBF
    .byte $38 ; |  XXX   | $DDC0
    .byte $38 ; |  XXX   | $DDC1
    .byte $10 ; |   X    | $DDC2
    .byte $38 ; |  XXX   | $DDC3
    .byte $38 ; |  XXX   | $DDC4
    .byte $28 ; |  X X   | $DDC5
    .byte $B1 ; |X XX   X| $DDC6
    .byte $9D ; |X  XXX X| $DDC7
    .byte $FB ; |XXXXX XX| $DDC8
    .byte $B9 ; |X XXX  X| $DDC9
    .byte $FD ; |XXXXXX X| $DDCA
    .byte $BB ; |X XXX XX| $DDCB
    .byte $38 ; |  XXX   | $DDCC
    .byte $38 ; |  XXX   | $DDCD
    .byte $78 ; | XXXX   | $DDCE
    .byte $7C ; | XXXXX  | $DDCF
    .byte $5C ; | X XXX  | $DDD0
    .byte $D6 ; |XX X XX | $DDD1
    .byte $12 ; |   X  X | $DDD2
    .byte $12 ; |   X  X | $DDD3
    .byte $22 ; |  X   X | $DDD4
    .byte $01 ; |       X| $DDD5
LDDD6:
    .byte $00 ; |        | $DDD6
    .byte $80 ; |X       | $DDD7
    .byte $A0 ; |X X     | $DDD8
    .byte $A8 ; |X X X   | $DDD9
    .byte $AA ; |X X X X | $DDDA
    .byte $AA ; |X X X X | $DDDB
    .byte $AA ; |X X X X | $DDDC
    .byte $AA ; |X X X X | $DDDD
    .byte $AA ; |X X X X | $DDDE

LDDDF:
    bit    $BA                   ; 3
    bmi    LDDF9                 ; 2³
    clc                          ; 2
    sed                          ; 2
    adc    $A8                   ; 3
    sta    $A8                   ; 3
    lda    $A7                   ; 3
    bcc    LDDF4                 ; 2³
    lsr                          ; 2
    bcc    LDDF2                 ; 2³
    inc    $AD                   ; 5
LDDF2:
    rol                          ; 2
    sec                          ; 2
LDDF4:
    adc    #0                    ; 2
    sta    $A7                   ; 3
    cld                          ; 2
LDDF9:
    rts                          ; 6

    .byte $00 ; |        | $DDFA
    .byte $00 ; |        | $DDFB
    .byte $00 ; |        | $DDFC
    .byte $00 ; |        | $DDFD
    .byte $00 ; |        | $DDFE
    .byte $00 ; |        | $DDFF
    .byte $04 ; |     X  | $DE00
    .byte $08 ; |    X   | $DE01
    .byte $34 ; |  XX X  | $DE02
    .byte $70 ; | XXX    | $DE03
    .byte $70 ; | XXX    | $DE04
    .byte $10 ; |   X    | $DE05
    .byte $18 ; |   XX   | $DE06
    .byte $F8 ; |XXXXX   | $DE07
    .byte $DC ; |XX XXX  | $DE08
    .byte $9C ; |X  XXX  | $DE09
    .byte $1D ; |   XXX X| $DE0A
    .byte $1D ; |   XXX X| $DE0B
    .byte $0F ; |    XXXX| $DE0C
    .byte $0A ; |    X X | $DE0D
    .byte $38 ; |  XXX   | $DE0E
    .byte $00 ; |        | $DE0F
    .byte $00 ; |        | $DE10
    .byte $3C ; |  XXXX  | $DE11
    .byte $74 ; | XXX X  | $DE12
    .byte $70 ; | XXX    | $DE13
    .byte $10 ; |   X    | $DE14
    .byte $18 ; |   XX   | $DE15
    .byte $F8 ; |XXXXX   | $DE16
    .byte $DC ; |XX XXX  | $DE17
    .byte $9C ; |X  XXX  | $DE18
    .byte $1C ; |   XXX  | $DE19
    .byte $0D ; |    XX X| $DE1A
    .byte $0F ; |    XXXX| $DE1B
    .byte $0A ; |    X X | $DE1C
    .byte $08 ; |    X   | $DE1D
    .byte $18 ; |   XX   | $DE1E
    .byte $20 ; |  X     | $DE1F
    .byte $00 ; |        | $DE20
    .byte $00 ; |        | $DE21
LDE22:
    .byte $20 ; |  X     | $DE22
    .byte $10 ; |   X    | $DE23
    .byte $2C ; |  X XX  | $DE24
    .byte $0E ; |    XXX | $DE25
    .byte $0E ; |    XXX | $DE26
    .byte $08 ; |    X   | $DE27
    .byte $18 ; |   XX   | $DE28
    .byte $1F ; |   XXXXX| $DE29
    .byte $3B ; |  XXX XX| $DE2A
    .byte $39 ; |  XXX  X| $DE2B
    .byte $B8 ; |X XXX   | $DE2C
    .byte $B8 ; |X XXX   | $DE2D
    .byte $F0 ; |XXXX    | $DE2E
    .byte $50 ; | X X    | $DE2F
    .byte $1C ; |   XXX  | $DE30
    .byte $00 ; |        | $DE31
    .byte $00 ; |        | $DE32
    .byte $3C ; |  XXXX  | $DE33
    .byte $2E ; |  X XXX | $DE34
    .byte $0E ; |    XXX | $DE35
    .byte $08 ; |    X   | $DE36
    .byte $18 ; |   XX   | $DE37
    .byte $1F ; |   XXXXX| $DE38
    .byte $3B ; |  XXX XX| $DE39
    .byte $39 ; |  XXX  X| $DE3A
    .byte $38 ; |  XXX   | $DE3B
    .byte $B0 ; |X XX    | $DE3C
    .byte $F0 ; |XXXX    | $DE3D
    .byte $50 ; | X X    | $DE3E
    .byte $10 ; |   X    | $DE3F
    .byte $18 ; |   XX   | $DE40
    .byte $04 ; |     X  | $DE41
    .byte $00 ; |        | $DE42
    .byte $00 ; |        | $DE43
    .byte $08 ; |    X   | $DE44
    .byte $1C ; |   XXX  | $DE45
    .byte $1C ; |   XXX  | $DE46
    .byte $3C ; |  XXXX  | $DE47
    .byte $3D ; |  XXXX X| $DE48
    .byte $39 ; |  XXX  X| $DE49
    .byte $19 ; |   XX  X| $DE4A
    .byte $3D ; |  XXXX X| $DE4B
    .byte $3F ; |  XXXXXX| $DE4C
    .byte $7E ; | XXXXXX | $DE4D
    .byte $5E ; | X XXXX | $DE4E
    .byte $D7 ; |XX X XXX| $DE4F
    .byte $85 ; |X    X X| $DE50
    .byte $85 ; |X    X X| $DE51
    .byte $85 ; |X    X X| $DE52
    .byte $00 ; |        | $DE53
    .byte $00 ; |        | $DE54
    .byte $80 ; |X       | $DE55
    .byte $80 ; |X       | $DE56
    .byte $C0 ; |XX      | $DE57
    .byte $44 ; | X   X  | $DE58
    .byte $6E ; | XX XXX | $DE59
    .byte $FE ; |XXXXXXX | $DE5A
    .byte $FF ; |XXXXXXXX| $DE5B
    .byte $7F ; | XXXXXXX| $DE5C
    .byte $7F ; | XXXXXXX| $DE5D
    .byte $DE ; |XX XXXX | $DE5E
    .byte $0E ; |    XXX | $DE5F
    .byte $0A ; |    X X | $DE60
    .byte $14 ; |   X X  | $DE61
    .byte $18 ; |   XX   | $DE62
    .byte $00 ; |        | $DE63
    .byte $00 ; |        | $DE64
    .byte $00 ; |        | $DE65
    .byte $00 ; |        | $DE66
    .byte $01 ; |       X| $DE67
    .byte $01 ; |       X| $DE68
    .byte $03 ; |      XX| $DE69
    .byte $22 ; |  X   X | $DE6A
    .byte $76 ; | XXX XX | $DE6B
    .byte $7F ; | XXXXXXX| $DE6C
    .byte $FF ; |XXXXXXXX| $DE6D
    .byte $FE ; |XXXXXXX | $DE6E
    .byte $FE ; |XXXXXXX | $DE6F
    .byte $3B ; |  XXX XX| $DE70
    .byte $30 ; |  XX    | $DE71
    .byte $18 ; |   XX   | $DE72
    .byte $0C ; |    XX  | $DE73
    .byte $00 ; |        | $DE74
    .byte $10 ; |   X    | $DE75
    .byte $38 ; |  XXX   | $DE76
    .byte $38 ; |  XXX   | $DE77
    .byte $3C ; |  XXXX  | $DE78
    .byte $BC ; |X XXXX  | $DE79
    .byte $9C ; |X  XXX  | $DE7A
    .byte $98 ; |X  XX   | $DE7B
    .byte $BC ; |X XXXX  | $DE7C
    .byte $FC ; |XXXXXX  | $DE7D
    .byte $7E ; | XXXXXX | $DE7E
    .byte $7A ; | XXXX X | $DE7F
    .byte $EB ; |XXX X XX| $DE80
    .byte $A5 ; |X X  X X| $DE81
    .byte $A5 ; |X X  X X| $DE82
    .byte $A5 ; |X X  X X| $DE83
    .byte $00 ; |        | $DE84
    .byte $08 ; |    X   | $DE85
    .byte $1C ; |   XXX  | $DE86
    .byte $1C ; |   XXX  | $DE87
    .byte $3C ; |  XXXX  | $DE88
    .byte $38 ; |  XXX   | $DE89
    .byte $FE ; |XXXXXXX | $DE8A
    .byte $9F ; |X  XXXXX| $DE8B
    .byte $1B ; |   XX XX| $DE8C
    .byte $5B ; | X XX XX| $DE8D
    .byte $FC ; |XXXXXX  | $DE8E
    .byte $9A ; |X  XX X | $DE8F
    .byte $0B ; |    X XX| $DE90
    .byte $0C ; |    XX  | $DE91
    .byte $04 ; |     X  | $DE92
    .byte $00 ; |        | $DE93
    .byte $00 ; |        | $DE94
    .byte $00 ; |        | $DE95
    .byte $10 ; |   X    | $DE96
    .byte $38 ; |  XXX   | $DE97
    .byte $38 ; |  XXX   | $DE98
    .byte $7B ; | XXXX XX| $DE99
    .byte $7E ; | XXXXXX | $DE9A
    .byte $7D ; | XXXXX X| $DE9B
    .byte $3D ; |  XXXX X| $DE9C
    .byte $FE ; |XXXXXXX | $DE9D
    .byte $9D ; |X  XXX X| $DE9E
    .byte $0E ; |    XXX | $DE9F
    .byte $08 ; |    X   | $DEA0
    .byte $08 ; |    X   | $DEA1
    .byte $08 ; |    X   | $DEA2
LDEA3:
    .byte $00 ; |        | $DEA3
    .byte $0B ; |    X XX| $DEA4
    .byte $1F ; |   XXXXX| $DEA5
    .byte $1F ; |   XXXXX| $DEA6
    .byte $3D ; |  XXXX X| $DEA7
    .byte $3D ; |  XXXX X| $DEA8
    .byte $3B ; |  XXX XX| $DEA9
    .byte $1E ; |   XXXX | $DEAA
    .byte $7C ; | XXXXX  | $DEAB
    .byte $F8 ; |XXXXX   | $DEAC
    .byte $38 ; |  XXX   | $DEAD
    .byte $3E ; |  XXXXX | $DEAE
    .byte $7B ; | XXXX XX| $DEAF
    .byte $CC ; |XX  XX  | $DEB0
    .byte $04 ; |     X  | $DEB1
    .byte $04 ; |     X  | $DEB2
    .byte $00 ; |        | $DEB3
    .byte $1A ; |   XX X | $DEB4
    .byte $3E ; |  XXXXX | $DEB5
    .byte $7E ; | XXXXXX | $DEB6
    .byte $7E ; | XXXXXX | $DEB7
    .byte $5A ; | X XX X | $DEB8
    .byte $7E ; | XXXXXX | $DEB9
    .byte $18 ; |   XX   | $DEBA
    .byte $18 ; |   XX   | $DEBB
    .byte $18 ; |   XX   | $DEBC
    .byte $3C ; |  XXXX  | $DEBD
    .byte $3C ; |  XXXX  | $DEBE
    .byte $24 ; |  X  X  | $DEBF
    .byte $64 ; | XX  X  | $DEC0
    .byte $04 ; |     X  | $DEC1
    .byte $06 ; |     XX | $DEC2
    .byte $00 ; |        | $DEC3
    .byte $58 ; | X XX   | $DEC4
    .byte $7C ; | XXXXX  | $DEC5
    .byte $7E ; | XXXXXX | $DEC6
    .byte $7E ; | XXXXXX | $DEC7
    .byte $5A ; | X XX X | $DEC8
    .byte $7E ; | XXXXXX | $DEC9
    .byte $18 ; |   XX   | $DECA
    .byte $18 ; |   XX   | $DECB
    .byte $18 ; |   XX   | $DECC
    .byte $3C ; |  XXXX  | $DECD
    .byte $3C ; |  XXXX  | $DECE
    .byte $24 ; |  X  X  | $DECF
    .byte $26 ; |  X  XX | $DED0
    .byte $20 ; |  X     | $DED1
    .byte $60 ; | XX     | $DED2
    .byte $00 ; |        | $DED3
    .byte $40 ; | X      | $DED4
    .byte $A0 ; |X X     | $DED5
    .byte $20 ; |  X     | $DED6
    .byte $48 ; | X  X   | $DED7
    .byte $94 ; |X  X X  | $DED8
    .byte $F6 ; |XXXX XX | $DED9
    .byte $15 ; |   X X X| $DEDA
    .byte $0D ; |    XX X| $DEDB
    .byte $05 ; |     X X| $DEDC
    .byte $02 ; |      X | $DEDD
    .byte $00 ; |        | $DEDE
    .byte $00 ; |        | $DEDF
    .byte $00 ; |        | $DEE0
    .byte $00 ; |        | $DEE1
    .byte $00 ; |        | $DEE2
    .byte $00 ; |        | $DEE3
LDEE4:
    .byte $00 ; |        | $DEE4
    .byte $A0 ; |X X     | $DEE5
    .byte $A0 ; |X X     | $DEE6
    .byte $20 ; |  X     | $DEE7
    .byte $80 ; |X       | $DEE8
    .byte $0E ; |    XXX | $DEE9
    .byte $1F ; |   XXXXX| $DEEA
    .byte $19 ; |   XX  X| $DEEB
    .byte $19 ; |   XX  X| $DEEC
    .byte $19 ; |   XX  X| $DEED
    .byte $9F ; |X  XXXXX| $DEEE
    .byte $CE ; |XX  XXX | $DEEF
    .byte $40 ; | X      | $DEF0
    .byte $40 ; | X      | $DEF1
    .byte $40 ; | X      | $DEF2
    .byte $C0 ; |XX      | $DEF3
    .byte $80 ; |X       | $DEF4
    .byte $00 ; |        | $DEF5
    .byte $00 ; |        | $DEF6
    .byte $00 ; |        | $DEF7
    .byte $00 ; |        | $DEF8
    .byte $00 ; |        | $DEF9
    .byte $00 ; |        | $DEFA
    .byte $00 ; |        | $DEFB
    .byte $00 ; |        | $DEFC
    .byte $B0 ; |X XX    | $DEFD
    .byte $15 ; |   X X X| $DEFE
    .byte $4D ; | X  XX X| $DEFF
LDF00:
    .byte $00 ; |        | $DF00
    .byte $00 ; |        | $DF01
    .byte $00 ; |        | $DF02
    .byte $FF ; |XXXXXXXX| $DF03
    .byte $00 ; |        | $DF04
    .byte $00 ; |        | $DF05
    .byte $00 ; |        | $DF06
    .byte $00 ; |        | $DF07
    .byte $00 ; |        | $DF08
    .byte $FF ; |XXXXXXXX| $DF09
    .byte $60 ; | XX     | $DF0A
    .byte $60 ; | XX     | $DF0B
    .byte $60 ; | XX     | $DF0C
    .byte $60 ; | XX     | $DF0D
    .byte $60 ; | XX     | $DF0E
    .byte $FF ; |XXXXXXXX| $DF0F
    .byte $00 ; |        | $DF10
    .byte $00 ; |        | $DF11
    .byte $00 ; |        | $DF12
    .byte $00 ; |        | $DF13
    .byte $00 ; |        | $DF14
    .byte $FF ; |XXXXXXXX| $DF15
    .byte $00 ; |        | $DF16
    .byte $00 ; |        | $DF17
    .byte $00 ; |        | $DF18
    .byte $FF ; |XXXXXXXX| $DF19
    .byte $00 ; |        | $DF1A
    .byte $00 ; |        | $DF1B
    .byte $00 ; |        | $DF1C
    .byte $00 ; |        | $DF1D
    .byte $1F ; |   XXXXX| $DF1E
    .byte $FF ; |XXXXXXXX| $DF1F
    .byte $00 ; |        | $DF20
    .byte $00 ; |        | $DF21
    .byte $00 ; |        | $DF22
    .byte $FF ; |XXXXXXXX| $DF23
    .byte $30 ; |  XX    | $DF24
    .byte $FE ; |XXXXXXX | $DF25
    .byte $00 ; |        | $DF26
    .byte $00 ; |        | $DF27
    .byte $00 ; |        | $DF28
    .byte $00 ; |        | $DF29
    .byte $1F ; |   XXXXX| $DF2A
    .byte $FF ; |XXXXXXXX| $DF2B
    .byte $00 ; |        | $DF2C
    .byte $00 ; |        | $DF2D
    .byte $00 ; |        | $DF2E
    .byte $FF ; |XXXXXXXX| $DF2F
    .byte $60 ; | XX     | $DF30
    .byte $60 ; | XX     | $DF31
    .byte $60 ; | XX     | $DF32
    .byte $60 ; | XX     | $DF33
    .byte $00 ; |        | $DF34
    .byte $00 ; |        | $DF35
    .byte $00 ; |        | $DF36
    .byte $FE ; |XXXXXXX | $DF37
    .byte $00 ; |        | $DF38
    .byte $FF ; |XXXXXXXX| $DF39
    .byte $06 ; |     XX | $DF3A
    .byte $06 ; |     XX | $DF3B
    .byte $06 ; |     XX | $DF3C
    .byte $FF ; |XXXXXXXX| $DF3D
    .byte $60 ; | XX     | $DF3E
    .byte $00 ; |        | $DF3F
    .byte $00 ; |        | $DF40
    .byte $FF ; |XXXXXXXX| $DF41
LDF42:
    .byte $00 ; |        | $DF42
    .byte $00 ; |        | $DF43
    .byte $00 ; |        | $DF44
    .byte $FF ; |XXXXXXXX| $DF45
    .byte $00 ; |        | $DF46
    .byte $00 ; |        | $DF47
    .byte $00 ; |        | $DF48
    .byte $00 ; |        | $DF49
    .byte $00 ; |        | $DF4A
    .byte $FF ; |XXXXXXXX| $DF4B
    .byte $00 ; |        | $DF4C
    .byte $00 ; |        | $DF4D
    .byte $00 ; |        | $DF4E
    .byte $00 ; |        | $DF4F
    .byte $00 ; |        | $DF50
    .byte $FF ; |XXXXXXXX| $DF51
    .byte $00 ; |        | $DF52
    .byte $00 ; |        | $DF53
    .byte $00 ; |        | $DF54
    .byte $00 ; |        | $DF55
    .byte $00 ; |        | $DF56
    .byte $FF ; |XXXXXXXX| $DF57
    .byte $00 ; |        | $DF58
    .byte $00 ; |        | $DF59
    .byte $00 ; |        | $DF5A
    .byte $FF ; |XXXXXXXX| $DF5B
    .byte $00 ; |        | $DF5C
    .byte $00 ; |        | $DF5D
    .byte $00 ; |        | $DF5E
    .byte $F0 ; |XXXX    | $DF5F
    .byte $03 ; |      XX| $DF60
    .byte $7F ; | XXXXXXX| $DF61
    .byte $00 ; |        | $DF62
    .byte $00 ; |        | $DF63
    .byte $7C ; | XXXXX  | $DF64
    .byte $00 ; |        | $DF65
    .byte $00 ; |        | $DF66
    .byte $FE ; |XXXXXXX | $DF67
    .byte $00 ; |        | $DF68
    .byte $00 ; |        | $DF69
    .byte $80 ; |X       | $DF6A
    .byte $FF ; |XXXXXXXX| $DF6B
    .byte $01 ; |       X| $DF6C
    .byte $FF ; |XXXXXXXX| $DF6D
    .byte $00 ; |        | $DF6E
    .byte $00 ; |        | $DF6F
    .byte $00 ; |        | $DF70
    .byte $FF ; |XXXXXXXX| $DF71
    .byte $00 ; |        | $DF72
    .byte $38 ; |  XXX   | $DF73
    .byte $80 ; |X       | $DF74
    .byte $00 ; |        | $DF75
    .byte $00 ; |        | $DF76
    .byte $00 ; |        | $DF77
    .byte $3E ; |  XXXXX | $DF78
    .byte $80 ; |X       | $DF79
    .byte $0F ; |    XXXX| $DF7A
    .byte $FF ; |XXXXXXXX| $DF7B
    .byte $00 ; |        | $DF7C
    .byte $00 ; |        | $DF7D
    .byte $00 ; |        | $DF7E
    .byte $00 ; |        | $DF7F
    .byte $F0 ; |XXXX    | $DF80
    .byte $00 ; |        | $DF81
    .byte $00 ; |        | $DF82
    .byte $FF ; |XXXXXXXX| $DF83
LDF84:
    .byte $00 ; |        | $DF84
    .byte $00 ; |        | $DF85
    .byte $00 ; |        | $DF86
    .byte $FF ; |XXXXXXXX| $DF87
    .byte $00 ; |        | $DF88
    .byte $00 ; |        | $DF89
    .byte $00 ; |        | $DF8A
    .byte $00 ; |        | $DF8B
    .byte $00 ; |        | $DF8C
    .byte $FF ; |XXXXXXXX| $DF8D
    .byte $00 ; |        | $DF8E
    .byte $00 ; |        | $DF8F
    .byte $00 ; |        | $DF90
    .byte $00 ; |        | $DF91
    .byte $00 ; |        | $DF92
    .byte $FF ; |XXXXXXXX| $DF93
    .byte $00 ; |        | $DF94
    .byte $00 ; |        | $DF95
    .byte $00 ; |        | $DF96
    .byte $00 ; |        | $DF97
    .byte $00 ; |        | $DF98
    .byte $FF ; |XXXXXXXX| $DF99
    .byte $00 ; |        | $DF9A
    .byte $00 ; |        | $DF9B
    .byte $00 ; |        | $DF9C
    .byte $FF ; |XXXXXXXX| $DF9D
    .byte $00 ; |        | $DF9E
    .byte $00 ; |        | $DF9F
    .byte $1F ; |   XXXXX| $DFA0
    .byte $80 ; |X       | $DFA1
    .byte $00 ; |        | $DFA2
    .byte $7F ; | XXXXXXX| $DFA3
    .byte $00 ; |        | $DFA4
    .byte $7C ; | XXXXX  | $DFA5
    .byte $00 ; |        | $DFA6
    .byte $00 ; |        | $DFA7
    .byte $00 ; |        | $DFA8
    .byte $FF ; |XXXXXXXX| $DFA9
    .byte $00 ; |        | $DFAA
    .byte $03 ; |      XX| $DFAB
    .byte $FE ; |XXXXXXX | $DFAC
    .byte $00 ; |        | $DFAD
    .byte $00 ; |        | $DFAE
    .byte $FF ; |XXXXXXXX| $DFAF
    .byte $00 ; |        | $DFB0
    .byte $00 ; |        | $DFB1
    .byte $00 ; |        | $DFB2
    .byte $FF ; |XXXXXXXX| $DFB3
    .byte $F3 ; |XXXX  XX| $DFB4
    .byte $03 ; |      XX| $DFB5
    .byte $E3 ; |XXX   XX| $DFB6
    .byte $0F ; |    XXXX| $DFB7
    .byte $00 ; |        | $DFB8
    .byte $07 ; |     XXX| $DFB9
    .byte $00 ; |        | $DFBA
    .byte $FF ; |XXXXXXXX| $DFBB
    .byte $00 ; |        | $DFBC
    .byte $F0 ; |XXXX    | $DFBD
    .byte $07 ; |     XXX| $DFBE
    .byte $00 ; |        | $DFBF
    .byte $03 ; |      XX| $DFC0
    .byte $3C ; |  XXXX  | $DFC1
    .byte $00 ; |        | $DFC2
    .byte $7C ; | XXXXX  | $DFC3
    .byte $01 ; |       X| $DFC4
    .byte $FF ; |XXXXXXXX| $DFC5
LDFC6:
    .byte $03 ; |      XX| $DFC6
    .byte $03 ; |      XX| $DFC7
    .byte $02 ; |      X | $DFC8
    .byte $03 ; |      XX| $DFC9
    .byte $02 ; |      X | $DFCA
    .byte $02 ; |      X | $DFCB
    .byte $03 ; |      XX| $DFCC
    .byte $03 ; |      XX| $DFCD
LDFCE:
    .byte $01 ; |       X| $DFCE
    .byte $03 ; |      XX| $DFCF
    .byte $07 ; |     XXX| $DFD0
    .byte $0F ; |    XXXX| $DFD1
    .byte $1F ; |   XXXXX| $DFD2
    .byte $3F ; |  XXXXXX| $DFD3
LDFD4:
    .byte $00 ; |        | $DFD4
    .byte $16 ; |   X XX | $DFD5
    .byte $2C ; |  X XX  | $DFD6
    .byte $42 ; | X    X | $DFD7

LDFD8:
    ldy    #0                    ; 2
    sty    $93                   ; 3
    iny                          ; 2
    sty    $AD                   ; 3
    sty    $B4                   ; 3
    jmp    LDFEC                 ; 3

    .byte $98 ; |X  XX   | $DFE4
    .byte $04 ; |     X  | $DFE5
    .byte $05 ; |     X X| $DFE6
    .byte $28 ; |  X X   | $DFE7
    .byte $40 ; | X      | $DFE8
    .byte $40 ; | X      | $DFE9
    .byte $40 ; | X      | $DFEA
    .byte $40 ; | X      | $DFEB

LDFEC:
    sta    BANK_1                ; 4
    jmp    LD8F7                 ; 3

LDFF2:
    sta    BANK_1                ; 4
    jmp    LD003                 ; 3

       ORG $1FF8
      RORG $DFF8

    .byte $40 ; | X      | $DFF8
    .byte $40 ; | X      | $DFF9
    .byte $40 ; | X      | $DFFA
    .byte $40 ; | X      | $DFFB

    .word START_Bank0
    .byte $DF ; |XX XXXXX| $DFFE
    .byte $DD ; |XX XXX X| $DFFF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $2000
      RORG $F000

LF000:
    .byte $5B ; | X XX XX| $F000
    .byte $5B ; | X XX XX| $F001
    .byte $6D ; | XX XX X| $F002

START_Bank1:
    sei                          ; 2
    cld                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    lda    #0                    ; 2
LF00A:
    sta     2,X                  ; 4
    dex                          ; 2
    bne    LF00A                 ; 2³
    jmp    LF114                 ; 3

LF012:
    ldx    #$FF                  ; 2
    stx    $A4                   ; 3
    lda    #0                    ; 2
    ldx    #$0F                  ; 2
LF01A:
    sta    $A5,X                 ; 4
    dex                          ; 2
    bpl    LF01A                 ; 2³
    ldx    #2                    ; 2
    stx    $AD                   ; 3
    inx                          ; 2
    stx    $B4                   ; 3
    lda    #$3F                  ; 2
    sta    $B8                   ; 3
    lda    #$88                  ; 2
    sta    $B5                   ; 3
    lda    $BA                   ; 3
    and    #$7F                  ; 2
    sta    $BA                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    lda    LFA8A,X               ; 4
    sta    $A5                   ; 3
    stx    $A6                   ; 3
    stx    $B7                   ; 3
LF040:
    stx    $92                   ; 3
    lda    #$76                  ; 2
    sta    $91                   ; 3
    lda    $93                   ; 3
    bne    LF07F                 ; 2³
    ldx    #3                    ; 2
LF04C:
    sta    $A9,X                 ; 4
    dex                          ; 2
    bpl    LF04C                 ; 2³
    sta    frameCounter          ; 3
    ldx    $A4                   ; 3
    inx                          ; 2
    cpx    #3                    ; 2
    bne    LF068                 ; 2³
    ldy    $A6                   ; 3
    iny                          ; 2
    cpy    #4                    ; 2
    bcc    LF063                 ; 2³
    ldy    #3                    ; 2
LF063:
    sty    $A6                   ; 3
    sty    $B7                   ; 3
    tax                          ; 2
LF068:
    stx    $A4                   ; 3
    lda    $A6                   ; 3
    sta    $B7                   ; 3
    inc    $AD                   ; 5
    bit    $B6                   ; 3
    bvc    LF07D                 ; 2³
    lda    $BB                   ; 3
    bpl    LF07A                 ; 2³
    and    #$0F                  ; 2
LF07A:
    jsr    LFCF4                 ; 6
LF07D:
    lda    $93                   ; 3
LF07F:
    bne    LF09C                 ; 2³
    lda    #$60                  ; 2
    sta    COLUBK                ; 3
    bit    $B6                   ; 3
    bvs    LF0CD                 ; 2³
    lda    $BA                   ; 3
    and    #$03                  ; 2
    cmp    #2                    ; 2
    bmi    LF0CD                 ; 2³
    ldx    $B4                   ; 3
    bne    LF09F                 ; 2³
    ldy    $AD                   ; 3
    bne    LF0CD                 ; 2³
LF099:
    jmp    LF114                 ; 3

LF09C:
    jmp    LF13B                 ; 3

LF09F:
    ldx    #6                    ; 2
LF0A1:
    lda    $A7,X                 ; 4
    ldy    $AE,X                 ; 4
    sta    $AE,X                 ; 4
    sty    $A7,X                 ; 4
    dex                          ; 2
    bpl    LF0A1                 ; 2³
    lda    $A6                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    $A4                   ; 3
    tax                          ; 2
    lda    $A5                   ; 3
    and    #$0F                  ; 2
    sta    $A4                   ; 3
    lda    $A5                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $A6                   ; 3
    sta    $B7                   ; 3
    stx    $A5                   ; 3
    lda    $B5                   ; 3
    eor    #$08                  ; 2
    sta    $B5                   ; 3
LF0CD:
    dec    $AD                   ; 5
    bmi    LF099                 ; 2³
    ldy    #0                    ; 2
    sty    frameCounter          ; 3
    sty    $94                   ; 3
    sty    $9F                   ; 3
    sty    $B6                   ; 3
    dey                          ; 2
    ldx    #3                    ; 2
    sty    $A1                   ; 3
    sty    $C7                   ; 3
    sty    $A3                   ; 3
LF0E4:
    sty    $84,X                 ; 4
    sty    $88,X                 ; 4
    sty    $99,X                 ; 4
    dex                          ; 2
    bpl    LF0E4                 ; 2³

    lda    #$20                  ; 2
    sta    $BB                   ; 3
    lda    #$87                  ; 2
    ldy    #$F1                  ; 2
    ldx    #3                    ; 2
LF0F7:
    sta    $8C,X                 ; 4
    sty    $95,X                 ; 4
    dex                          ; 2
    bpl    LF0F7                 ; 2³
    lda    #8                    ; 2
    sta    $91                   ; 3
    sta    $92                   ; 3
    lda    #$12                  ; 2
    sta    $90                   ; 3
    bpl    LF12F                 ; 3   always branch

LF10A:
    jsr    LFD0F                 ; 6
    lda    SWCHB                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    bcs    LF121                 ; 2³
LF114:
    stx    frameCounter          ; 3
    stx    AUDV0                 ; 3
    lda    $BA                   ; 3
    ora    #$80                  ; 2
    sta    $BA                   ; 3
    jmp    LFFEC                 ; 3

LF121:
    inc    $BC                   ; 5
    lda    $BC                   ; 3
    cmp    #3                    ; 2
    bmi    LF12B                 ; 2³
    stx    $BC                   ; 3
LF12B:
    inc    frameCounter          ; 5
    bit    $B6                   ; 3
LF12F:
    bpl    LF13B                 ; 2³
    dec    $93                   ; 5
    bvc    LF138                 ; 2³
    jmp    LF040                 ; 3

LF138:
    jmp    LF07D                 ; 3

LF13B:
    bit    $B6                   ; 3
    bmi    LF172                 ; 2³
    ldx    $A4                   ; 3
    lda    LFD8C,X               ; 4
    and    frameCounter          ; 3
    cmp    #1                    ; 2
    bne    LF172                 ; 2³
    ldx    #3                    ; 2
LF14C:
    lda    $84,X                 ; 4
    bmi    LF155                 ; 2³
    dex                          ; 2
    bpl    LF14C                 ; 2³
    bmi    LF172                 ; 3   always branch

LF155:
    lda    #1                    ; 2
    sta    $84,X                 ; 4
    lda    #$FF                  ; 2
    sta    $88,X                 ; 4
    lda    #$88                  ; 2
    sta    $8C,X                 ; 4
    ldy    $B7                   ; 3
    lda    LFDD6,Y               ; 4
    sta    $F6                   ; 3
    lda    $95,X                 ; 4
    and    #$F0                  ; 2
    ora    $F6                   ; 3
    sta    $95,X                 ; 4
    inc    $94                   ; 5
LF172:
    ldy    $94                   ; 3
    dey                          ; 2
    sty    $C6                   ; 3
    ldx    #3                    ; 2
    lda    #0                    ; 2
LF17B:
    sta    $F2,X                 ; 4
    sta    $C1,X                 ; 4
    dex                          ; 2
    bpl    LF17B                 ; 2³
    lda    $84                   ; 3
    bmi    LF1D8                 ; 2³
    lda    $88                   ; 3
    clc                          ; 2
    adc    #2                    ; 2
    tay                          ; 2
    sec                          ; 2
    sbc    #5                    ; 2
    tax                          ; 2
    lda    $85                   ; 3
    bmi    LF1A8                 ; 2³
    cpx    $89                   ; 3
    bpl    LF1A8                 ; 2³
    cpy    $89                   ; 3
    bmi    LF1A8                 ; 2³
    lda    $F2                   ; 3
    ora    #$02                  ; 2
    sta    $F2                   ; 3
    lda    $F3                   ; 3
    ora    #$01                  ; 2
    sta    $F3                   ; 3
LF1A8:
    lda    $86                   ; 3
    bmi    LF1C0                 ; 2³
    cpx    $8A                   ; 3
    bpl    LF1C0                 ; 2³
    cpy    $8A                   ; 3
    bmi    LF1C0                 ; 2³
    lda    $F2                   ; 3
    ora    #$04                  ; 2
    sta    $F2                   ; 3
    lda    $F4                   ; 3
    ora    #$01                  ; 2
    sta    $F4                   ; 3
LF1C0:
    lda    $87                   ; 3
    bmi    LF1D8                 ; 2³
    cpx    $8B                   ; 3
    bpl    LF1D8                 ; 2³
    cpy    $8B                   ; 3
    bmi    LF1D8                 ; 2³
    lda    $F2                   ; 3
    ora    #$08                  ; 2
    sta    $F2                   ; 3
    lda    $F5                   ; 3
    ora    #$01                  ; 2
    sta    $F5                   ; 3
LF1D8:
    lda    $85                   ; 3
    bmi    LF21A                 ; 2³+1
    lda    $89                   ; 3
    clc                          ; 2
    adc    #2                    ; 2
    tay                          ; 2
    sec                          ; 2
    sbc    #5                    ; 2
    tax                          ; 2
    lda    $86                   ; 3
    bmi    LF200                 ; 2³+1
    cpx    $8A                   ; 3
    bpl    LF200                 ; 2³+1
    cpy    $8A                   ; 3
    bmi    LF200                 ; 2³+1
    lda    $F3                   ; 3
    ora    #$04                  ; 2
    sta    $F3                   ; 3
    lda    $F4                   ; 3
    bne    LF1FC                 ; 2³
LF1FC:
    ora    #$02                  ; 2
    sta    $F4                   ; 3
LF200:
    lda    $87                   ; 3
    bmi    LF218                 ; 2³
    cpx    $8B                   ; 3
    bpl    LF218                 ; 2³
    cpy    $8B                   ; 3
    bmi    LF218                 ; 2³
    lda    $F3                   ; 3
    ora    #$08                  ; 2
    sta    $F3                   ; 3
    lda    $F5                   ; 3
    ora    #$02                  ; 2
    sta    $F5                   ; 3
LF218:
    ldx    $F3                   ; 3
LF21A:
    lda    $86                   ; 3
    bmi    LF242                 ; 2³
    lda    $8A                   ; 3
    clc                          ; 2
    adc    #2                    ; 2
    tay                          ; 2
    sec                          ; 2
    sbc    #5                    ; 2
    tax                          ; 2
    lda    $87                   ; 3
    bmi    LF242                 ; 2³
    cpx    $8B                   ; 3
    bpl    LF242                 ; 2³
    cpy    $8B                   ; 3
    bmi    LF242                 ; 2³
    lda    $F4                   ; 3
    ora    #$08                  ; 2
    sta    $F4                   ; 3
    lda    $F5                   ; 3
    bne    LF23E                 ; 2³
LF23E:
    ora    #$04                  ; 2
    sta    $F5                   ; 3
LF242:
    ldx    $F4                   ; 3
    lda    LFDB3,X               ; 4
    cmp    #3                    ; 2
    beq    LF266                 ; 2³
    ldx    $F3                   ; 3
    lda    LFDB3,X               ; 4
    cmp    #3                    ; 2
    beq    LF266                 ; 2³
    ldx    $F2                   ; 3
    lda    LFDB3,X               ; 4
    cmp    #3                    ; 2
    beq    LF266                 ; 2³
    ldx    $F5                   ; 3
    lda    LFDB3,X               ; 4
    cmp    #3                    ; 2
    bne    LF269                 ; 2³
LF266:
    jmp    LF33A                 ; 3

LF269:
    lda    $F5                   ; 3
    tay                          ; 2
    lsr                          ; 2
    bcc    LF276                 ; 2³
    rol                          ; 2
    and    #$0E                  ; 2
    ora    $F2                   ; 3
    sta    $F2                   ; 3
LF276:
    tya                          ; 2
    and    #$02                  ; 2
    beq    LF282                 ; 2³
    tya                          ; 2
    and    #$0D                  ; 2
    ora    $F3                   ; 3
    sta    $F3                   ; 3
LF282:
    tya                          ; 2
    and    #$04                  ; 2
    beq    LF28E                 ; 2³
    tya                          ; 2
    and    #$0B                  ; 2
    ora    $F4                   ; 3
    sta    $F4                   ; 3
LF28E:
    lda    $F2                   ; 3
    tay                          ; 2
    and    #$02                  ; 2
    beq    LF29C                 ; 2³
    tya                          ; 2
    and    #$0D                  ; 2
    ora    $F3                   ; 3
    sta    $F3                   ; 3
LF29C:
    tya                          ; 2
    and    #$04                  ; 2
    beq    LF2A8                 ; 2³
    tya                          ; 2
    and    #$0B                  ; 2
    ora    $F4                   ; 3
    sta    $F4                   ; 3
LF2A8:
    tya                          ; 2
    and    #$08                  ; 2
    beq    LF2B4                 ; 2³
    tya                          ; 2
    and    #$07                  ; 2
    ora    $F5                   ; 3
    sta    $F5                   ; 3
LF2B4:
    lda    $F3                   ; 3
    tay                          ; 2
    lsr                          ; 2
    bcc    LF2C1                 ; 2³
    rol                          ; 2
    and    #$0E                  ; 2
    ora    $F2                   ; 3
    sta    $F2                   ; 3
LF2C1:
    tya                          ; 2
    and    #$04                  ; 2
    beq    LF2CD                 ; 2³
    tya                          ; 2
    and    #$0B                  ; 2
    ora    $F4                   ; 3
    sta    $F4                   ; 3
LF2CD:
    tya                          ; 2
    and    #$08                  ; 2
    beq    LF2D9                 ; 2³
    tya                          ; 2
    and    #$07                  ; 2
    ora    $F5                   ; 3
    sta    $F5                   ; 3
LF2D9:
    lda    $F4                   ; 3
    tya                          ; 2
    lsr                          ; 2
    bcc    LF2E6                 ; 2³
    tya                          ; 2
    and    #$0E                  ; 2
    ora    $F2                   ; 3
    sta    $F2                   ; 3
LF2E6:
    tya                          ; 2
    and    #$02                  ; 2
    beq    LF2F2                 ; 2³
    tya                          ; 2
    and    #$0D                  ; 2
    ora    $F3                   ; 3
    sta    $F3                   ; 3
LF2F2:
    tya                          ; 2
    and    #$08                  ; 2
    beq    LF2FE                 ; 2³
    tya                          ; 2
    and    #$07                  ; 2
    ora    $F5                   ; 3
    sta    $F5                   ; 3
LF2FE:
    lda    #0                    ; 2
    sta    $C1                   ; 3
    ldx    $F3                   ; 3
    lda    LFD9F,X               ; 4
    sta    $C2                   ; 3
    lda    LFDB3,X               ; 4
    sta    $F3                   ; 3
    ldx    $F4                   ; 3
    lda    LFDAB,X               ; 4
    sta    $C3                   ; 3
    lda    LFDB3,X               ; 4
    sta    $F4                   ; 3
    ldx    $F5                   ; 3
    lda    LFDB3,X               ; 4
    sta    $C4                   ; 3
    lda    LFDB3,X               ; 4
    sta    $F5                   ; 3
    ldx    $F2                   ; 3
    lda    LFDB3,X               ; 4
    sta    $F2                   ; 3
    clc                          ; 2
    lda    $F2                   ; 3
    adc    $F3                   ; 3
    adc    $F4                   ; 3
    adc    $F5                   ; 3
    cmp    #7                    ; 2
    bmi    LF346                 ; 2³
LF33A:
    lda    #3                    ; 2
    tax                          ; 2
    tay                          ; 2
LF33E:
    sta    $F2,X                 ; 4
    sty    $C1,X                 ; 4
    dey                          ; 2
    dex                          ; 2
    bpl    LF33E                 ; 2³
LF346:
    lda    #3                    ; 2
    ldx    $B7                   ; 3
    cpx    #4                    ; 2
    bne    LF350                 ; 2³
    sta    $B7                   ; 3
LF350:
    tax                          ; 2
LF351:
    ldy    $88,X                 ; 4
    sty    $F6,X                 ; 4
    dex                          ; 2
    bpl    LF351                 ; 2³
    tax                          ; 2
LF359:
    txa                          ; 2
    sta    $BD,X                 ; 4
    dex                          ; 2
    bpl    LF359                 ; 2³
    ldx    #3                    ; 2
LF361:
    lda    $F6                   ; 3
    cmp    $F7                   ; 3
    bcc    LF375                 ; 2³

    ldy    $F7                   ; 3
    sty    $F6                   ; 3
    sta    $F7                   ; 3

    lda    $BD                   ; 3
    ldy    $BE                   ; 3
    sta    $BE                   ; 3
    sty    $BD                   ; 3
LF375:
    lda    $F7                   ; 3
    cmp    $F8                   ; 3
    bcc    LF389                 ; 2³
    ldy    $F8                   ; 3
    sty    $F7                   ; 3
    sta    $F8                   ; 3
    lda    $BE                   ; 3
    ldy    $BF                   ; 3
    sta    $BF                   ; 3
    sty    $BE                   ; 3
LF389:
    lda    $F8                   ; 3
    cmp    $F9                   ; 3
    bcc    LF39D                 ; 2³
    ldy    $F9                   ; 3
    sta    $F9                   ; 3
    sty    $F8                   ; 3
    lda    $BF                   ; 3
    ldy    $C0                   ; 3
    sta    $C0                   ; 3
    sty    $BF                   ; 3
LF39D:
    dex                          ; 2
    bne    LF361                 ; 2³
    lda    $C7                   ; 3
    bmi    LF3A7                 ; 2³
    jmp    LF42A                 ; 3

LF3A7:
    lda    $94                   ; 3
    beq    LF400                 ; 2³+1
    lda    #3                    ; 2
    sta    $C6                   ; 3
    sta    $F6                   ; 3
    lda    #0                    ; 2
    sta    $F7                   ; 3
    sta    $FD                   ; 3
    tay                          ; 2
LF3B8:
    ldx    $BD,Y                 ; 4
    lda    $F2,X                 ; 4
    beq    LF3CE                 ; 2³
    cmp    #2                    ; 2
    bne    LF3C8                 ; 2³
    lda    #3                    ; 2
    and    $BC                   ; 3
    bpl    LF3CA                 ; 3   always branch

LF3C8:
    and    frameCounter          ; 3
LF3CA:
    cmp    $C1,X                 ; 4
    bne    LF3EA                 ; 2³
LF3CE:
    lda    $8C,X                 ; 4
    ldy    $F6                   ; 3
    sta.wy $D8,Y                 ; 5
    lda    $80,X                 ; 4
    sta.wy $DC,Y                 ; 5
    lda    $88,X                 ; 4
    sec                          ; 2
    sbc    $FD                   ; 3
    sta.wy $D4,Y                 ; 5
    lda    $88,X                 ; 4
    adc    #1                    ; 2
    sta    $FD                   ; 3
    dec    $F6                   ; 5
LF3EA:
    inc    $F7                   ; 5
    ldy    $F7                   ; 3
    cpy    $94                   ; 3
    bne    LF3B8                 ; 2³
    ldy    $F6                   ; 3
    bmi    LF400                 ; 2³+1
    lda    #$FF                  ; 2
    sta.wy $D4,Y                 ; 5
    lda    #$87                  ; 2
    sta.wy $D8,Y                 ; 5
LF400:
    ldx    #2                    ; 2
LF402:
    lda    $99,X                 ; 4
    sta    $F6,X                 ; 4
    dex                          ; 2
    bpl    LF402                 ; 2³
    stx    $F9                   ; 3
    ldy    $9F                   ; 3
    dey                          ; 2
    sty    $C7                   ; 3
    sty    $C2                   ; 3
    iny                          ; 2
    bne    LF418                 ; 2³
    jmp    LF44F                 ; 3

LF418:
    ldy    #$FF                  ; 2
    ldx    #2                    ; 2
LF41C:
    lda    $95,X                 ; 4
    bpl    LF422                 ; 2³
    sty    $F6,X                 ; 4
LF422:
    dex                          ; 2
    bpl    LF41C                 ; 2³
    ldx    #2                    ; 2
    jmp    LF359                 ; 3

LF42A:
    ldx    #0                    ; 2
    stx    $C1                   ; 3
    stx    $C3                   ; 3
LF430:
    ldy    $BD,X                 ; 4
    lda.wy $9C,Y                 ; 4
    ldx    $C2                   ; 3
    sta    $F7,X                 ; 4
    lda.wy $99,Y                 ; 4
    tay                          ; 2
    sec                          ; 2
    sbc    $C3                   ; 3
    sta    $F4,X                 ; 4
    sty    $C3                   ; 3
    dex                          ; 2
    stx    $C2                   ; 3
    inc    $C1                   ; 5
    ldx    $C1                   ; 3
    cpx    #3                    ; 2
    bne    LF430                 ; 2³
LF44F:
    ldx    #$10                  ; 2
    stx    NUSIZ1                ; 3
    stx    NUSIZ0                ; 3
    ldx    #$24                  ; 2
    bit    $B6                   ; 3
    bvc    LF468                 ; 2³
    lda    $A4                   ; 3
    cmp    #2                    ; 2
    bne    LF468                 ; 2³
    lda    $93                   ; 3
    bmi    LF468                 ; 2³
    and    #$F4                  ; 2
    tax                          ; 2
LF468:
    stx    COLUPF                ; 3
    lda    #$FF                  ; 2
    sta    PF0                   ; 3
    lda    #5                    ; 2
    sta    $C5                   ; 3
    lda    #$3A                  ; 2
    sta    COLUP0                ; 3
    jmp    LFFF2                 ; 3

LF479:
    lda    $A9                   ; 3
    tay                          ; 2
    bmi    LF4A4                 ; 2³
    and    #$70                  ; 2
    cmp    #$30                  ; 2
    beq    LF4A0                 ; 2³
    and    #$40                  ; 2
    beq    LF4A4                 ; 2³
    tya                          ; 2
    and    #$0F                  ; 2
    cmp    #9                    ; 2
    bne    LF496                 ; 2³
    tya                          ; 2
    and    #$30                  ; 2
    sta    $A9                   ; 3
    bne    LF4A4                 ; 2³
LF496:
    lda    frameCounter          ; 3
    and    #$1F                  ; 2
    bne    LF4A4                 ; 2³
    inc    $A9                   ; 5
    bpl    LF4A4                 ; 2³
LF4A0:
    lda    #$80                  ; 2
    sta    $A9                   ; 3
LF4A4:
    lda    $A9                   ; 3
    and    #$0F                  ; 2
    cmp    #6                    ; 2
    bne    LF4C0                 ; 2³
    lda    frameCounter          ; 3
    and    #$1F                  ; 2
    bne    LF4C0                 ; 2³
    ldx    #2                    ; 2
LF4B4:
    lda    $AA,X                 ; 4
    bpl    LF4BD                 ; 2³
    clc                          ; 2
    adc    #$81                  ; 2
    sta    $AA,X                 ; 4
LF4BD:
    dex                          ; 2
    bpl    LF4B4                 ; 2³
LF4C0:
    bit    $B6                   ; 3
    bpl    LF4C7                 ; 2³
    jmp    LF82C                 ; 3

LF4C7:
    ldx    frameCounter          ; 3
    inx                          ; 2
    bne    LF504                 ; 2³+1
    lda    $BB                   ; 3
    cmp    #$AA                  ; 2
    beq    LF4E2                 ; 2³
    and    #$F0                  ; 2
    cmp    #$A0                  ; 2
    bne    LF4DE                 ; 2³
    lda    $BB                   ; 3
    and    #$0F                  ; 2
    bpl    LF4E4                 ; 3   always branch

LF4DE:
    lda    $BB                   ; 3
    bpl    LF4E4                 ; 2³
LF4E2:
    lda    #0                    ; 2
LF4E4:
    sec                          ; 2
    sed                          ; 2
    sbc    #1                    ; 2
    cld                          ; 2
    bmi    LF500                 ; 2³+1
    beq    LF4F9                 ; 2³
    cmp    #$10                  ; 2
    bne    LF4F3                 ; 2³
    inc    $B7                   ; 5
LF4F3:
    bpl    LF502                 ; 2³+1
    ora    #$A0                  ; 2
    bmi    LF502                 ; 3+1   always branch

LF4F9:
    jsr    LFCE7                 ; 6
    lda    #$AA                  ; 2
    bmi    LF502                 ; 3   always branch

LF500:
    lda    #$20                  ; 2
LF502:
    sta    $BB                   ; 3
LF504:
    lda    frameCounter          ; 3
    and    #$0F                  ; 2
    bne    LF512                 ; 2³
    ldx    #3                    ; 2
LF50C:
    brk                          ; 7

LF50D:  ; indirect jump
    dex                          ; 2
    bpl    LF50C                 ; 2³
    bmi    LF524                 ; 3   always branch

LF512:
    cmp    #8                    ; 2
    bne    LF524                 ; 2³
    ldx    #3                    ; 2
LF518:
    lda    $84,X                 ; 4
    and    #$EF                  ; 2
    cmp    #$21                  ; 2
    bne    LF521                 ; 2³
    brk                          ; 7

LF521:
    dex                          ; 2
    bpl    LF518                 ; 2³
LF524:
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcc    LF590                 ; 2³
    ldx    #2                    ; 2
LF52B:
    lda    $95,X                 ; 4
    bmi    LF55C                 ; 2³
    lda    $9C,X                 ; 4
    sec                          ; 2
    sbc    #2                    ; 2
    bcc    LF559                 ; 2³
    sta    $9C,X                 ; 4
    cmp    $91                   ; 3
    bmi    LF55C                 ; 2³
    lda    $91                   ; 3
    adc    #4                    ; 2
    cmp    $9C,X                 ; 4
    bmi    LF55C                 ; 2³
    lda    $92                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    $90                   ; 3
    cmp    $99,X                 ; 4
    bpl    LF55C                 ; 2³
    adc    LFF81,Y               ; 4
    cmp    $99,X                 ; 4
    bmi    LF55C                 ; 2³
    jsr    LFCE7                 ; 6
LF559:
    jsr    LF578                 ; 6
LF55C:
    dex                          ; 2
    bpl    LF52B                 ; 2³
    bit    CXPPMM                ; 3
    bvc    LF590                 ; 2³
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcc    LF5A2                 ; 2³
    ldx    #2                    ; 2
    ldy    $90                   ; 3
    iny                          ; 2
    iny                          ; 2
    tya                          ; 2
LF56F:
    cmp    $99,X                 ; 4
    beq    LF585                 ; 2³
    dex                          ; 2
    bpl    LF56F                 ; 2³
    bmi    LF590                 ; 3   always branch

LF578:
    lda    #$FF                  ; 2
    sta    $99,X                 ; 4
    lda    $95,X                 ; 4
    ora    #$F0                  ; 2
    sta    $95,X                 ; 4
    dec    $9F                   ; 5
    rts                          ; 6

LF585:
    jsr    LF578                 ; 6
    jsr    LFC8F                 ; 6
    lda    #1                    ; 2
    jsr    LFCF4                 ; 6
LF590:
    bit    CXM1FB                ; 3
    bvc    LF5A2                 ; 2³
    lda    #$FF                  ; 2
    sta    $A3                   ; 3
    sta    $A1                   ; 3
    jsr    LFC8F                 ; 6
    lda    #2                    ; 2
    jsr    LFCF4                 ; 6
LF5A2:
    sta    CXCLR                 ; 3
    lda    $B6                   ; 3
    cmp    #1                    ; 2
    bne    LF5DA                 ; 2³
    ldx    $90                   ; 3
    lda    LFFC8,X               ; 4
    ldx    #$0A                  ; 2
    ldy    #4                    ; 2
    jsr    LFC99                 ; 6
    dec    $93                   ; 5
    bne    LF5CC                 ; 2³
    lda    $90                   ; 3
    cmp    #$16                  ; 2
    beq    LF5CF                 ; 2³
    inc    $90                   ; 5
    lda    $92                   ; 3
    eor    #$08                  ; 2
    sta    $92                   ; 3
    lda    #4                    ; 2
    sta    $93                   ; 3
LF5CC:
    jmp    LF82C                 ; 3



LF5DA:
    bit    $BA                   ; 3
    bpl    LF5E4                 ; 2³
    lda    #6                    ; 2
    ldx    #0                    ; 2
    beq    LF601                 ; 3+1   always branch

LF5E4:
;    ldy    SWCHA                 ; 4




;read in overscan ~ line 231
;26 bytes needed

    LDX    SWCHA                 ; temporarily save switches with X, saves some bytes
    JSR    LFCA4                 ; this determines whether or not Kangaroo is touching a ladder...
    BEQ    .ladderClose          ; branch taken when Kangaroo is touching the ladder
    TXA
    ORA    #$11                  ; ignore UP being pressed when not near a ladder
    .BYTE  $24  ; BIT opcode, skip 1 byte

.ladderClose:
    TXA
    BIT    INPT1
    BMI    .notPressed
    AND    #$EF                   ; when P0 presses C
.notPressed:
    BIT    INPT3
    BMI    .notPressed2
    AND     #$FE                  ; when P1 presses C
.notPressed2:
    TAY



    lda    $BA                   ; 3      test, is it player 0 or player 1?
    cmp    #2                    ; 2
    bmi    LF5FA                 ; 2³
    lda    $B5                   ; 3
    and    #$08                  ; 2
    beq    LF5FA                 ; 2³
    ldx    INPT5                 ; 3
    tya                          ; 2
    and    #$0F                  ; 2
    bpl    LF601                 ; 3+1   always branch

;moved...
LF5CF:
    lda    #$80                  ; 2
    sta    $B6                   ; 3
    lda    #$3F                  ; 2
    sta    $93                   ; 3
;    jmp    LF828                 ; 3
    BNE    LF665

LF5FA:
    tya                          ; 2    normalize P0 and P1 joystick directions
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ldx    INPT4                 ; 3
LF601:
    eor    #$0F                  ; 2    anything pressed is now a 1
    sta    $FD                   ; 3    save directions
    stx    $FC                   ; 3    save firebuttons
    lda    $92                   ; 3
    cmp    #$20                  ; 2
    bpl    LF668                 ; 2³
    lda    $FD                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $92                   ; 3
    and    LFCE1,X               ; 4
    ora    LFCE4,X               ; 4
    sta    $92                   ; 3

    bit    $FC                   ; 3    test firebutton
    bmi    LF62A                 ; 2³
    ldy    $B6                   ; 3
    bne    LF62E                 ; 2³
    sty    $FD                   ; 3
    ora    #$80                  ; 2
    sta    $92                   ; 3
LF62A:
    ldy    #0                    ; 2
    sty    $B6                   ; 3
LF62E:
    lda    $FD                   ; 3   get switches
    and    #$02                  ; 2   test down
    beq    LF673                 ; 2³  - branch if NOT pressed, to test UP
    sec                          ; 2
    jsr    LFCA4                 ; 6
    bne    LF63F                 ; 2³
    inc    $90                   ; 5
    jmp    LF6D3                 ; 3

LF63F:
    lda    $92                   ; 3
    and    #$10                  ; 2
    bne    LF64F                 ; 2³
    inc    $90                   ; 5
    lda    $92                   ; 3
    and    #$08                  ; 2
    ora    #$14                  ; 2
    sta    $92                   ; 3
LF64F:
    lda    $93                   ; 3
    cmp    #$1F                  ; 2
    beq    LF665                 ; 2³
    lsr                          ; 2
    tax                          ; 2
    lda    LFF5F,X               ; 4
    ldy    #4                    ; 2
    ldx    #7                    ; 2
    jsr    LFC99                 ; 6
    inc    $93                   ; 5
    bpl    LF6B8                 ; 2³
LF665:
    jmp    LF828                 ; 3

LF668:
    lda    $92                   ; 3
    bmi    LF69B                 ; 2³
    cmp    #$40                  ; 2
    bmi    LF6CA                 ; 2³
MF670:
    jmp    LF787                 ; 3

LF673:
    lda    $92                   ; 3
    and    #$10                  ; 2
    beq    LF685                 ; 2³
    lda    $92                   ; 3
    and    #$08                  ; 2
    sta    $92                   ; 3
    ldy    #0                    ; 2
    sty    $93                   ; 3
    dec    $90                   ; 5
LF685:
    lda    $92                   ; 3
    bpl    LF6BB                 ; 2³
;    lda    $92                   ; 3
;    and    #$08                  ; 2
;    ora    #$86                  ; 2
;    sta    $92                   ; 3
;    lda    #$0D                  ; 2
;    sta    $93                   ; 3
;    lda    #2                    ; 2
;    sta    $B6                   ; 3
;    bne    LF665                 ; 3   always branch

;save 2 bytes
    LDA    #$0D
    STA    $93
    LDA    #2
    STA    $B6
    LDA    $92
    AND    #$08
    ORA    #$86
    BNE    MF6A8  ;  always branch


LF69B:
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcc    LF6AC                 ; 2³
    dec    $93                   ; 5
    bne    LF6AC                 ; 2³
    lda    $92                   ; 3
    and    #$08                  ; 2
MF6A8:
    sta    $92                   ; 3
    bpl    LF665                 ; 3   always branch

LF6AC:
    ldy    $93                   ; 3
    ldx    LFFBA,Y               ; 4
    lda    #$0F                  ; 2
    ldy    #8                    ; 2
    jsr    LFC99                 ; 6
LF6B8:
    jmp    LF82C                 ; 3

;moved...
LF723:
    lda    $93                   ; 3
    bne    LF732                 ; 2³
    lda    $92                   ; 3
    and    #$08                  ; 2
    ora    #$41                  ; 2
    sta    $92                   ; 3
;    jmp    LF787                 ; 3
    BNE    MF670

LF6BB:
    lda    $FD                   ; 3
    lsr                          ; 2
    bcc    LF734                 ; 2³+1   branch if up was NOT pressed
    clc                          ; 2
    jsr    LFCA4                 ; 6      trashes A and Y, returns a value in Y that is just used to branch
    bne    LF723                 ; 2³+1   2) taken when Kangaroo is NOT touching the ladder
;Kangaroo is touching the ladder
    dec    $90                   ; 5
    bpl    LF6D3                 ; 2³
LF6CA:
    lda    $FD                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    jsr    LFCA4                 ; 6
    bne    LF70F                 ; 2³+1
LF6D3:
    ldy    #4                    ; 2
    lda    frameCounter          ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    LFFDF,X               ; 4
    ldx    #6                    ; 2
    jsr    LFC99                 ; 6   do some audio
    lda    $FD                   ; 3
    and    #$03                  ; 2
    beq    LF706                 ; 2³+1
    inc    $93                   ; 5
    ldy    $93                   ; 3
    cpy    #$13                  ; 2
    bne    LF706                 ; 2³+1
    lsr                          ; 2
    bcs    LF6FA                 ; 2³
    inc    $90                   ; 5
    bpl    LF6FC                 ; 2³
LF6FA:
    dec    $90                   ; 5
LF6FC:
    lda    #0                    ; 2
    sta    $93                   ; 3
    lda    $92                   ; 3
    eor    #$08                  ; 2
;    sta    $92                   ; 3

    .BYTE $2C ; BIT opcode, skip 2 bytes...

LF706:
    lda    $92                   ; 3
    ora    #$27                  ; 2
    sta    $92                   ; 3
;    jmp    LF82C                 ; 3
    BNE    LF784

LF70F:
    lda    $92                   ; 3
    and    #$08                  ; 2
    sta    $92                   ; 3
    lda    #$0F                  ; 2
    sta    $93                   ; 3
    ldx    $90                   ; 3
;    beq    LF720                 ; 2³
;    jmp    LF828                 ; 3
    BNE    MF740

LF720:
    jmp    LF819                 ; 3



LF732:
    dec    $93                   ; 5
LF734:
    lda    $FD                   ; 3
    and    #$0C                  ; 2
    bne    LF743                 ; 2³
    lda    $92                   ; 3
    and    #$08                  ; 2
    sta    $92                   ; 3
MF740:
    jmp    LF828                 ; 3

LF743:
    ldx    $BC                   ; 3
    bne    LF765                 ; 2³
    cmp    #8                    ; 2
    bpl    LF755                 ; 2³
    lda    $91                   ; 3
    cmp    #1                    ; 2
    beq    LF765                 ; 2³
    dec    $91                   ; 5
    bne    LF75D                 ; 2³
LF755:
    lda    $91                   ; 3
    cmp    #$79                  ; 2
    bpl    LF765                 ; 2³
    inc    $91                   ; 5
LF75D:
    jsr    LFCBC                 ; 6
    bne    LF765                 ; 2³
    jmp    LF814                 ; 3

LF765:
    lda    frameCounter          ; 3
    lsr                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    ldx    #4                    ; 2
    lda    LFF5F,Y               ; 4
    bne    LF773                 ; 2³
    tax                          ; 2
LF773:
    ldy    #$0D                  ; 2
    jsr    LFC99                 ; 6
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    bne    LF784                 ; 2³
    lda    $92                   ; 3
    eor    #$01                  ; 2
    sta    $92                   ; 3
LF784:
    jmp    LF82C                 ; 3

LF787:
    lda    $BC                   ; 3
    bne    LF7AD                 ; 2³
    ldy    $91                   ; 3
    lda    $92                   ; 3
    and    #$08                  ; 2
    beq    LF7A1                 ; 2³
    lda    $FD                   ; 3
    and    #$08                  ; 2
    beq    LF7AD                 ; 2³
    cpy    #$78                  ; 2
    bpl    LF7AD                 ; 2³
    inc    $91                   ; 5
    bpl    LF7AD                 ; 2³
LF7A1:
    lda    $FD                   ; 3
    and    #$04                  ; 2
    beq    LF7AD                 ; 2³
    cpy    #1                    ; 2
    beq    LF7AD                 ; 2³
    dec    $91                   ; 5
LF7AD:
    inc    $93                   ; 5
    lda    $93                   ; 3
    lsr                          ; 2
    tay                          ; 2
    lda    LFF0B,Y               ; 4
    ldx    #8                    ; 2
    ldy    #4                    ; 2
    jsr    LFC99                 ; 6
    ldy    $93                   ; 3
    cpy    #8                    ; 2
    beq    LF7E0                 ; 2³
    cpy    #$10                  ; 2
    beq    LF7E4                 ; 2³
    cpy    #$18                  ; 2
    beq    LF7E8                 ; 2³
    cpy    #$20                  ; 2
    beq    LF7EE                 ; 2³
    cpy    #$28                  ; 2
    beq    LF7D7                 ; 2³
    cpy    #$30                  ; 2
    bne    LF810                 ; 2³+1
LF7D7:
    inc    $90                   ; 5
    jsr    LFCBC                 ; 6
;    beq    LF810                 ; 2³+1
;    bne    LF800                 ; 3+1   always branch
;save 1 byte
    JMP    MF7FD

LF7E0:
    dec    $90                   ; 5
    bpl    LF810                 ; 2³+1
LF7E4:
    inc    $92                   ; 5
    bne    LF810                 ; 2³+1
LF7E8:
    dec    $90                   ; 5
    dec    $92                   ; 5
    bpl    LF810                 ; 2³+1
LF7EE:
    inc    $90                   ; 5
    ldx    $A4                   ; 3
    lda    LFF5B,X               ; 4
    clc                          ; 2
    adc    $90                   ; 3
    tax                          ; 2
    lda    $91                   ; 3
    jsr    LFCD1                 ; 6
MF7FD:
    beq    LF810                 ; 2³
LF800:
    lda    $92                   ; 3
    and    #$08                  ; 2
    sta    $92                   ; 3
    ldy    #0                    ; 2
    sty    $93                   ; 3
    sty    AUDV1                 ; 3
    ldx    $90                   ; 3
    beq    LF819                 ; 2³
LF810:
    cpy    #$30                  ; 2
    bne    LF82C                 ; 2³
LF814:
    jsr    LFCE7                 ; 6
    bne    LF828                 ; 3   always branch

LF819:
    stx    $B8                   ; 3
    dex                          ; 2
    stx    $93                   ; 3
;    lda    #$80                  ; 2
;    ora    $B5                   ; 3
;    sta    $B5                   ; 3
;save 1 byte
    ASL    $B5
    SEC
    ROR    $B5

    lda    #$C0                  ; 2
    sta    $B6                   ; 3
LF828:
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
LF82C:
    lda    #0                    ; 2
    sta    $EC                   ; 3
    ldx    $90                   ; 3
    dex                          ; 2
    dex                          ; 2
    stx    $C4                   ; 3
    lda    $92                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    $90                   ; 3
    clc                          ; 2
    adc    LFF81,Y               ; 4
    sta    $F2                   ; 3
    ldx    #5                    ; 2
    cmp    #1                    ; 2
    bmi    LF856                 ; 2³
    ldy    $C4                   ; 3
    dey                          ; 2
    beq    LF850                 ; 2³
    bpl    LF863                 ; 2³
LF850:
    lda    #$80                  ; 2
    sta    $BD,X                 ; 4
    dex                          ; 2
    sec                          ; 2
LF856:
    lda    #6                    ; 2
    bcc    LF85C                 ; 2³
    ora    #$80                  ; 2
LF85C:
    sta    $BD,X                 ; 4
    sta    $EC                   ; 3
    bcs    LF867                 ; 2³
    dex                          ; 2
LF863:
    lda    #0                    ; 2
    sta    $BD,X                 ; 4
LF867:
    stx    $C5                   ; 3
    ldy    #0                    ; 2
    ldx    $A4                   ; 3
    clc                          ; 2
LF86E:
    lda    LFFA3,X               ; 4
    sta.wy $D4,Y                 ; 5
    lda    LFFA6,X               ; 4
    sta.wy $D9,Y                 ; 5
    txa                          ; 2
    adc    #6                    ; 2
    tax                          ; 2
    iny                          ; 2
    cpy    #4                    ; 2
    bne    LF86E                 ; 2³
    ldx    $C5                   ; 3
    ldy    #0                    ; 2
LF887:
    lda.wy $A9,Y                 ; 4
    bmi    LF8C2                 ; 2³
    lda    $F2                   ; 3
    cmp.wy $D4,Y                 ; 4
    bmi    LF8B2                 ; 2³
    lda    $C4                   ; 3
    cmp.wy $D4,Y                 ; 4
    beq    LF89C                 ; 2³
    bpl    LF8BD                 ; 2³
LF89C:
    tya                          ; 2
    clc                          ; 2
    adc    #1                    ; 2
    ora    #$80                  ; 2
    dex                          ; 2
    sta    $BD,X                 ; 4
    lda    $EC                   ; 3
    bne    LF8C2                 ; 2³
    dex                          ; 2
    lda    #$86                  ; 2
    sta    $BD,X                 ; 4
    sta    $EC                   ; 3
    bne    LF8C2                 ; 3   always branch

LF8B2:
    lda    $EC                   ; 3
    bne    LF8BD                 ; 2³
    dex                          ; 2
    lda    #6                    ; 2
    sta    $BD,X                 ; 4
    sta    $EC                   ; 3
LF8BD:
    dex                          ; 2
    iny                          ; 2
    sty    $BD,X                 ; 4
    dey                          ; 2
LF8C2:
    iny                          ; 2
    cpy    #4                    ; 2
    bne    LF887                 ; 2³
    lda    $EC                   ; 3
    bne    LF8D0                 ; 2³
    lda    #6                    ; 2
    dex                          ; 2
    sta    $BD,X                 ; 4
LF8D0:
    dex                          ; 2
    bmi    LF8D7                 ; 2³
    lda    #$FF                  ; 2
    sta    $BD,X                 ; 4
LF8D7:
    ldx    #5                    ; 2
    stx    $C5                   ; 3
    lda    #0                    ; 2
    sta    $FD                   ; 3
LF8DF:
    stx    $C4                   ; 3
    ldx    $C5                   ; 3
    lda    $BD,X                 ; 4
    bpl    LF90D                 ; 2³+1
    ldx    $C4                   ; 3
    and    #$0F                  ; 2
    cmp    #$0F                  ; 2
    beq    LF917                 ; 2³+1
    sta    $FE                   ; 3
    tay                          ; 2
    lda    frameCounter          ; 3
    cpy    #6                    ; 2
    beq    LF8FD                 ; 2³
    lsr                          ; 2
    bcs    LF900                 ; 2³+1
;    bcc    LF913                 ; 3+1   always branch


LF913:
    dec    $C5                   ; 5
    bpl    LF8DF                 ; 2³+1
LF917:
    lda    #5                    ; 2
    sta    $C5                   ; 3
    txa                          ; 2
    bmi    LF922                 ; 2³
    lda    #$FF                  ; 2
    sta    $C8,X                 ; 4
LF922:
    jmp    LF9CB                 ; 3

;moved...
LF8FD:
    lsr                          ; 2
    bcs    LF913                 ; 2³
LF900:
    ldx    $C4                   ; 3
    ldy    $FE                   ; 3
    lda    LFF90,Y               ; 4
    pha                          ; 3
    lda    LFF89,Y               ; 4
    pha                          ; 3
    rts                          ; 6

LF90D:
    and    #$0F                  ; 2
    sta    $FE                   ; 3
    bpl    LF900                 ; 3   always branch



LF925: ; indirect jump
    lda    $90                   ; 3
    sec                          ; 2
    sbc    $FD                   ; 3
    sta    $C8,X                 ; 4
    lda    $92                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    LFF81,Y               ; 4
    clc                          ; 2
    adc    $90                   ; 3
    sta    $FD                   ; 3
    lda    $91                   ; 3
    sta    $CE,X                 ; 4
    lda    #$2C                  ; 2
    sta    $EC,X                 ; 4
    lda    $92                   ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFE01,Y               ; 4
    sta    $E6,X                 ; 4
    lda    LFDF1,Y               ; 4
    sta    $E0,X                 ; 4
;    dex                          ; 2
;    jmp    LF913                 ; 3
    BNE    MF9B5      ; always branch

LF954: ; indirect jump
    ldy    #6                    ; 2
    bit    $B6                   ; 3
    bvs    LF963                 ; 2³
    lda    frameCounter          ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tay                          ; 2
LF963:
    lda    LFD8F,Y               ; 4
    sta    $CE,X                 ; 4
    lda    #1                    ; 2
    sec                          ; 2
    sbc    $FD                   ; 3
    sta    $C8,X                 ; 4
    lda    #3                    ; 2
    sta    $FD                   ; 3
    lda    LFD97,Y               ; 4
    sta    $E0,X                 ; 4
    lda    #$DE                  ; 2
    sta    $E6,X                 ; 4
    lda    #$2C                  ; 2
;    sta    $EC,X                 ; 4
;    dex                          ; 2
;    jmp    LF913                 ; 3

    BNE    MF9B3      ; always branch

LF984: ; indirect jump
    dey                          ; 2
    sty    $DE                   ; 3
    lda.wy $D9,Y                 ; 4
    sta    $CE,X                 ; 4
    lda.wy $D4,Y                 ; 4
    tay                          ; 2
    sec                          ; 2
    sbc    $FD                   ; 3
    sta    $C8,X                 ; 4
    tya                          ; 2
    clc                          ; 2
    adc    #2                    ; 2
    sta    $FD                   ; 3
    ldy    $DE                   ; 3
    lda.wy $A9,Y                 ; 4
    and    #$03                  ; 2
    cpy    #0                    ; 2
    beq    LF9B9                 ; 2³
    tay                          ; 2
    lda    LFF9B,Y               ; 4
    sta    $E0,X                 ; 4
    lda    #$DB                  ; 2
    sta    $E6,X                 ; 4
    lda    LFF9F,Y               ; 4
MF9B3:
    sta    $EC,X                 ; 4
MF9B5:
    dex                          ; 2
    jmp    LF913                 ; 3

LF9B9:
    tay                          ; 2
    lda    LFF97,Y               ; 4
    sta    $E0,X                 ; 4
    lda    #$DB                  ; 2
    sta    $E6,X                 ; 4
    lda    #$2B                  ; 2
;    sta    $EC,X                 ; 4
;    dex                          ; 2
;    jmp    LF913                 ; 3
    BNE    MF9B3      ; always branch

LF9CB:
    lda    #5                    ; 2
    sta    $C5                   ; 3
    lda    $B6                   ; 3
    cmp    #1                    ; 2
    beq    LFA22                 ; 2³+1
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcc    LFA43                 ; 2³+1
    ldy    #0                    ; 2
    ldx    $A4                   ; 3
    clc                          ; 2
LF9DF:
    lda    LFFA9,X               ; 4
    sta.wy $D4,Y                 ; 5
    lda    LFFAC,X               ; 4
    sta.wy $D9,Y                 ; 5
    txa                          ; 2
    adc    #6                    ; 2
    tax                          ; 2
    iny                          ; 2
    cpy    #3                    ; 2
    bne    LF9DF                 ; 2³
    ldy    #2                    ; 2
LF9F6:
    sty    $C1                   ; 3
    lda.wy $AA,Y                 ; 4
    bmi    LFA1D                 ; 2³+1
    ldx    $D9,Y                 ; 4
    lda.wy $D4,Y                 ; 4
    jsr    LFA4B                 ; 6
    beq    LFA1D                 ; 2³
    ldy    $C1                   ; 3
    lda.wy $AA,Y                 ; 4
    ora    #$80                  ; 2
    sta.wy $AA,Y                 ; 5
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LFDDB,X               ; 4
    jsr    LFCF4                 ; 6
    jsr    LFC8F                 ; 6
LFA1D:
    ldy    $C1                   ; 3
    dey                          ; 2
    bpl    LF9F6                 ; 2³+1
LFA22:
    ldy    $A4                   ; 3
    ldx    LFFA6,Y               ; 4
    lda    #4                    ; 2
    jsr    LFA4B                 ; 6
    beq    LFA43                 ; 2³
    lda    $A9                   ; 3
    bmi    LFA43                 ; 2³
    and    #$40                  ; 2
    bne    LFA43                 ; 2³
    lda    $A9                   ; 3
    clc                          ; 2
    ora    #$40                  ; 2
    adc    #$10                  ; 2
    sta    $A9                   ; 3
    lda    #$66                  ; 2
    sta    $B8                   ; 3
LFA43:
    lda    INTIM                 ; 4
    bne    LFA43                 ; 2³
    jmp    LF10A                 ; 3

LFA4B:
    sta    $BD                   ; 3
    lda    $92                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    LFF81,Y               ; 4
    sta    $BF                   ; 3
    lda    $BD                   ; 3
    sec                          ; 2
    sbc    $90                   ; 3
    bmi    LFA71                 ; 2³
    cmp    $BF                   ; 3
    bpl    LFA71                 ; 2³
    txa                          ; 2
    sec                          ; 2
    sbc    $91                   ; 3
    cmp    #6                    ; 2
    bcc    LFA6E                 ; 2³
    cmp    #$FA                  ; 2
    bcc    LFA71                 ; 2³
LFA6E:
    lda    #$FF                  ; 2
    rts                          ; 6

LFA71:
    lda    #0                    ; 2
    rts                          ; 6

LFA74:                                     ; break subroutine
    dec    $FE                   ; 5
    lda    $84,X                 ; 4
    tay                          ; 2
    bpl    LFA7C                 ; 2³
    rti                          ; 6

LFA7C:
    lsr                          ; 2
    bcs    LFA82                 ; 2³
    jmp    LFB95                 ; 3

LFA82:
    tya                          ; 2
    and    #$20                  ; 2
    beq    LFAA4                 ; 2³
    lda    $88,X                 ; 4
    cmp    #0                    ; 2
    bpl    LFA9C                 ; 2³
    ora    #$80                  ; 2
    sta    $84,X                 ; 4
    lda    #$88                  ; 2
    sta    $8C,X                 ; 4
    lda    #$80                  ; 2
    sta    $88,X                 ; 4
    dec    $94                   ; 5
    rti                          ; 6

LFA9C:
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $88,X                 ; 4
    tya                          ; 2
    bne    LFAE5                 ; 3   always branch

LFAA4:
    lda    $88,X                 ; 4
    ldy    #$FF                  ; 2
LFAA8:
    iny                          ; 2
    cmp    LFDC3,Y               ; 4
    beq    LFAC5                 ; 2³
    cpy    #2                    ; 2
    bne    LFAA8                 ; 2³
    cmp    #$14                  ; 2
    bne    LFADF                 ; 2³
    lda    $84,X                 ; 4
    eor    #$30                  ; 2
    sta    $84,X                 ; 4
    lda    #$C3                  ; 2
    sta    $80,X                 ; 4
    lda    #$81                  ; 2
    sta    $8C,X                 ; 4
    rti                          ; 6

LFAC5:
    lda    $92                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    $90                   ; 3
    clc                          ; 2
    adc    LFF81,Y               ; 4
    tay                          ; 2
    lda    LFF6D,Y               ; 4
    sta    $C1                   ; 3
    ldy    $88,X                 ; 4
    lda    LFF6D,Y               ; 4
    cmp    $C1                   ; 3
    beq    LFAF7                 ; 2³
LFADF:
    lda    $88,X                 ; 4
    inc    $88,X                 ; 6
    lda    $84,X                 ; 4
LFAE5:
    eor    #$10                  ; 2
    sta    $84,X                 ; 4
    and    #$10                  ; 2
    beq    LFAF2                 ; 2³
    lda    #$B3                  ; 2
    sta    $80,X                 ; 4
    rti                          ; 6

LFAF2:
    lda    #$C3                  ; 2
    sta    $80,X                 ; 4
    rti                          ; 6

LFAF7:
    lda    $91                   ; 3
    cmp    #$70                  ; 2
    bpl    LFB0D                 ; 2³+1
    lda    #$24                  ; 2
    sta    $84,X                 ; 4
    lda    #$43                  ; 2
    sta    $80,X                 ; 4
    lda    $8C,X                 ; 4
    sec                          ; 2
    sbc    #3                    ; 2
    sta    $8C,X                 ; 4
    rti                          ; 6

LFB0D:
    lda    #2                    ; 2
    sta    $84,X                 ; 4
    lda    $9F                   ; 3
    cmp    #3                    ; 2
    beq    LFB7C                 ; 2³
    lda    $95,X                 ; 4
    and    #$0F                  ; 2
    beq    LFB85                 ; 2³
    ldy    #0                    ; 2
LFB1F:
    lda.wy $95,Y                 ; 4
    and    #$F0                  ; 2
    cmp    #$F0                  ; 2
    beq    LFB2F                 ; 2³
    iny                          ; 2
    cpy    #3                    ; 2
    beq    LFB7C                 ; 2³
    bne    LFB1F                 ; 3   always branch

LFB2F:
    sty    $F6                   ; 3
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    #$8F                  ; 2
    and.wy $95,Y                 ; 4
    sta.wy $95,Y                 ; 5
    ldy    $A0                   ; 3
    iny                          ; 2
    cpy    #$12                  ; 2
    bne    LFB47                 ; 2³
    ldy    #0                    ; 2
LFB47:
    stx    $C4                   ; 3
    lda    $B7                   ; 3
    beq    LFB52                 ; 2³
    lda    LFDC6,Y               ; 4
    bpl    LFB55                 ; 3   always branch?
LFB52:
    lda    LFDDF,Y               ; 4
LFB55:
    sty    $A0                   ; 3
    sta    $F7                   ; 3
    dec    $95,X                 ; 6
    clc                          ; 2
    adc    $88,X                 ; 4
    ldy    $F6                   ; 3
    sta.wy $99,Y                 ; 5
    lda    $8C,X                 ; 4
    sbc    #2                    ; 2
    sta.wy $9C,Y                 ; 5
    dec    $F7                   ; 5
    lda    $F7                   ; 3
    bmi    LFB77                 ; 2³
    beq    LFB77                 ; 2³
    lda    #$84                  ; 2
    sta    $80,X                 ; 4
    rti                          ; 6

LFB77:
    lda    #$A3                  ; 2
    sta    $80,X                 ; 4
    rti                          ; 6

LFB7C:
    lda    #$24                  ; 2
    sta    $84,X                 ; 4
    lda    #$43                  ; 2
    sta    $80,X                 ; 4
    rti                          ; 6

LFB85:
    lda    #4                    ; 2
    sta    $84,X                 ; 4
    lda    #$53                  ; 2
    sta    $80,X                 ; 4
    lda    $8C,X                 ; 4
    clc                          ; 2
    adc    #3                    ; 2
    sta    $8C,X                 ; 4
    rti                          ; 6

LFB95:
    lsr                          ; 2
    bcc    LFBFD                 ; 2³
    tya                          ; 2
    and    #$10                  ; 2
    bne    LFBD3                 ; 2³
    tya                          ; 2
    and    #$40                  ; 2
    bne    LFBA8                 ; 2³
    tya                          ; 2
    eor    #$40                  ; 2
    sta    $84,X                 ; 4
    rti                          ; 6

LFBA8:
    tya                          ; 2
    eor    #$50                  ; 2
    sta    $84,X                 ; 4
    lda    #$93                  ; 2
    sta    $80,X                 ; 4
    ldy    #2                    ; 2
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    #$80                  ; 2
    sta    $BD                   ; 3
LFBBC:
    lda.wy $95,Y                 ; 4
    and    #$F0                  ; 2
    cmp    $BD                   ; 3
    beq    LFBC8                 ; 2³
    dey                          ; 2
    bpl    LFBBC                 ; 2³
LFBC8:
    lda.wy $95,Y                 ; 4
    and    #$7F                  ; 2
    sta.wy $95,Y                 ; 5
    inc    $9F                   ; 5
    rti                          ; 6

LFBD3:
    tya                          ; 2
    and    #$40                  ; 2
    bne    LFBDE                 ; 2³
    tya                          ; 2
    eor    #$40                  ; 2
    sta    $84,X                 ; 4
    rti                          ; 6

LFBDE:
    lda    $95,X                 ; 4
    and    #$0F                  ; 2
    bne    LFBF4                 ; 2³
    lda    $8C,X                 ; 4
    cmp    #$88                  ; 2
    beq    LFBED                 ; 2³
    jmp    LFB85                 ; 3

LFBED:
    sec                          ; 2
    lda    $8C,X                 ; 4
    sbc    #3                    ; 2
    sta    $8C,X                 ; 4
LFBF4:
    lda    #$43                  ; 2
    sta    $80,X                 ; 4
    lda    #$24                  ; 2
    sta    $84,X                 ; 4
    rti                          ; 6

LFBFD:
    lsr                          ; 2
    bcc    LFC70                 ; 2³
    tya                          ; 2
    and    #$20                  ; 2
    bne    LFC2D                 ; 2³
    lda    $8C,X                 ; 4
    cmp    #$81                  ; 2
    bmi    LFC15                 ; 2³
    tya                          ; 2
    eor    #$25                  ; 2
    sta    $84,X                 ; 4
    lda    #$B3                  ; 2
    sta    $80,X                 ; 4
    rti                          ; 6

LFC15:
    clc                          ; 2
    adc    #3                    ; 2
    sta    $8C,X                 ; 4
    tya                          ; 2
    eor    #$10                  ; 2
    sta    $84,X                 ; 4
    and    #$10                  ; 2
    beq    LFC28                 ; 2³
    lda    #$74                  ; 2
    sta    $80,X                 ; 4
    rti                          ; 6

LFC28:
    lda    #$53                  ; 2
    sta    $80,X                 ; 4
    rti                          ; 6

LFC2D:
    lda    $8C,X                 ; 4
    cmp    #$82                  ; 2
    bne    LFC42                 ; 2³
    lda    $95,X                 ; 4
    and    #$0F                  ; 2
    bne    LFC42                 ; 2³
    lda    #$21                  ; 2
    sta    $84,X                 ; 4
    lda    #$C3                  ; 2
    sta    $80,X                 ; 4
    rti                          ; 6

LFC42:
    lda    $8C,X                 ; 4
    sty    $C1                   ; 3
    ldy    $A4                   ; 3
    cmp    LF000,Y               ; 4
    beq    LFC51                 ; 2³
    ldy    $C1                   ; 3
    bne    LFC56                 ; 2³
LFC51:
    ldy    $C1                   ; 3
    jmp    LFB0D                 ; 3

LFC56:
    lda    $8C,X                 ; 4
    sec                          ; 2
    sbc    #3                    ; 2
    sta    $8C,X                 ; 4
    tya                          ; 2
    eor    #$10                  ; 2
    sta    $84,X                 ; 4
    and    #$10                  ; 2
    beq    LFC6B                 ; 2³
    lda    #$64                  ; 2
    sta    $80,X                 ; 4
    rti                          ; 6

LFC6B:
    lda    #$43                  ; 2
    sta    $80,X                 ; 4
    rti                          ; 6

LFC70:
    lda    $84,X                 ; 4
    and    #$F0                  ; 2
    cmp    #$30                  ; 2
    beq    LFC84                 ; 2³
    clc                          ; 2
    adc    #$10                  ; 2
    ora    #$08                  ; 2
    sta    $84,X                 ; 4
    lda    #$D4                  ; 2
    sta    $80,X                 ; 4
    rti                          ; 6

LFC84:
    lda    #$FF                  ; 2
    sta    $84,X                 ; 4
    lda    #$7F                  ; 2
    sta    $88,X                 ; 4
    dec    $94                   ; 5
    rti                          ; 6

LFC8F:
    lda    #$79                  ; 2
    cmp    $B8                   ; 3
    bcc    LFC96                 ; 2³
    rts                          ; 6

LFC96:
    sta    $B8                   ; 3
    rts                          ; 6

LFC99:
    bit    $BA                   ; 3
    bmi    LFCA3                 ; 2³
    sta    AUDF1                 ; 3
    sty    AUDC1                 ; 3
    stx    AUDV1                 ; 3
LFCA3:
    rts                          ; 6

LFCA4:
    ldy    $A4                   ; 3
    lda    LFF5B,Y               ; 4   Here's where the code starts to branch (ladder or no ladder)
    adc    $90                   ; 3   add H position of Kangaroo
    tay                          ; 2
    lda    LFE11,Y               ; 4
    sec                          ; 2
    sbc    $91                   ; 3
    bmi    LFCBA                 ; 2³
    cmp    #8                    ; 2
    bpl    LFCBA                 ; 2³  1) this branch is taken when the kangaroo is NOT touching the ladder, and jumping
    lda    #0                    ; 2
LFCBA:
    tay                          ; 2
    rts                          ; 6

LFCBC:
    ldx    $A4                   ; 3
    lda    LFF5B,X               ; 4
    clc                          ; 2
    adc    $90                   ; 3
    tax                          ; 2
    lda    $91                   ; 3
    cmp    LFE54,X               ; 4
    bmi    LFCDE                 ; 2³
    cmp    LFE8F,X               ; 4
    bpl    LFCDE                 ; 2³
LFCD1:
    cmp    LFECD,X               ; 4
    bmi    LFCDB                 ; 2³
    cmp    LFF1D,X               ; 4
    bmi    LFCDE                 ; 2³
LFCDB:
    lda    #0                    ; 2
    rts                          ; 6

LFCDE:
    lda    #$FF                  ; 2
    rts                          ; 6

LFCE1:
    .byte $FF ; |XXXXXXXX| $FCE1
    .byte $F7 ; |XXXX XXX| $FCE2
    .byte $FF ; |XXXXXXXX| $FCE3
LFCE4:
    .byte $00 ; |        | $FCE4
    .byte $00 ; |        | $FCE5
    .byte $08 ; |    X   | $FCE6
LFCE7:
    lda    #3                    ; 2
    sta    $92                   ; 3
    lda    #1                    ; 2
    sta    $B6                   ; 3
    lda    #7                    ; 2
    sta    $93                   ; 3
    rts                          ; 6

LFCF4:
    bit    $BA                   ; 3
    bmi    LFD0E                 ; 2³+1
    sed                          ; 2
    clc                          ; 2
    adc    $A8                   ; 3
    sta    $A8                   ; 3
    lda    $A7                   ; 3
    bcc    LFD09                 ; 2³
    lsr                          ; 2
    bcc    LFD07                 ; 2³
    inc    $AD                   ; 5
LFD07:
    rol                          ; 2
    sec                          ; 2
LFD09:
    adc    #0                    ; 2
    sta    $A7                   ; 3
    cld                          ; 2
LFD0E:
    rts                          ; 6

LFD0F:
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    VBLANK                ; 3
    lda    $92                   ; 3
    and    #$08                  ; 2
    bne    LFD24                 ; 2³
    lda    $91                   ; 3
    sec                          ; 2
    sbc    #1                    ; 2
    bpl    LFD29                 ; 2³
LFD24:
    lda    $91                   ; 3
    clc                          ; 2
    adc    #9                    ; 2
LFD29:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$2C                  ; 2
    sec                          ; 2
LFD2E:
    sbc    #$0F                  ; 2
    bcs    LFD2E                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ldx    $C5                   ; 3
    sta    HMM1_mirror           ; 4
    sta    RESM1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $CE,X                 ; 4
    sec                          ; 2
LFD44:
    sbc    #$0F                  ; 2
    bcs    LFD44                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ldx    #0                    ; 2
    sta    HMP1                  ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    VSYNC                 ; 3
    sty    TIM64T                ; 4
    lda    #$60                  ; 2
    sta    COLUBK                ; 3
    lda    SWCHB                 ; 4
    lsr                          ; 2
    stx    HMCLR                 ; 3
    bcc    LFD71                 ; 2³
    bit    $BA                   ; 3
    bpl    LFD7E                 ; 2³
    bit    INPT4                 ; 3
    bmi    LFD7E                 ; 2³
LFD71:
    stx    AUDV0                 ; 3
    stx    AUDV1                 ; 3
    stx    $93                   ; 3
    stx    $A2                   ; 3
    dex                          ; 2
    txs                          ; 2
    jmp    LF012                 ; 3

LFD7E:
    rts                          ; 6

LFD7F:
    jsr    LFD0F                 ; 6
    lda    frameCounter          ; 3
    bne    LFD89                 ; 2³
    jmp    LF07D                 ; 3

LFD89:
    jmp    LFFEC                 ; 3

LFD8C:
    .byte $FF ; |XXXXXXXX| $FD8C
    .byte $7F ; | XXXXXXX| $FD8D
    .byte $7F ; | XXXXXXX| $FD8E
LFD8F:
    .byte $72 ; | XXX  X | $FD8F
    .byte $6E ; | XX XXX | $FD90
    .byte $6A ; | XX X X | $FD91
    .byte $66 ; | XX  XX | $FD92
    .byte $62 ; | XX   X | $FD93
    .byte $66 ; | XX  XX | $FD94
    .byte $6A ; | XX X X | $FD95
    .byte $6E ; | XX XXX | $FD96
LFD97:
    .byte $00 ; |        | $FD97
    .byte $11 ; |   X   X| $FD98
    .byte $00 ; |        | $FD99
    .byte $11 ; |   X   X| $FD9A
    .byte $22 ; |  X   X | $FD9B
    .byte $33 ; |  XX  XX| $FD9C
    .byte $22 ; |  X   X | $FD9D
    .byte $33 ; |  XX  XX| $FD9E
LFD9F:
    .byte $00 ; |        | $FD9F
    .byte $01 ; |       X| $FDA0
    .byte $00 ; |        | $FDA1
    .byte $00 ; |        | $FDA2
    .byte $00 ; |        | $FDA3
    .byte $01 ; |       X| $FDA4
    .byte $00 ; |        | $FDA5
    .byte $00 ; |        | $FDA6
    .byte $00 ; |        | $FDA7
    .byte $01 ; |       X| $FDA8
    .byte $00 ; |        | $FDA9
    .byte $00 ; |        | $FDAA
LFDAB:
    .byte $00 ; |        | $FDAB
    .byte $01 ; |       X| $FDAC
    .byte $01 ; |       X| $FDAD
    .byte $02 ; |      X | $FDAE
    .byte $00 ; |        | $FDAF
    .byte $00 ; |        | $FDB0
    .byte $00 ; |        | $FDB1
    .byte $00 ; |        | $FDB2
LFDB3:
    .byte $00 ; |        | $FDB3
    .byte $01 ; |       X| $FDB4
    .byte $01 ; |       X| $FDB5
    .byte $02 ; |      X | $FDB6
    .byte $01 ; |       X| $FDB7
    .byte $02 ; |      X | $FDB8
    .byte $02 ; |      X | $FDB9
    .byte $03 ; |      XX| $FDBA
    .byte $01 ; |       X| $FDBB
    .byte $02 ; |      X | $FDBC
    .byte $02 ; |      X | $FDBD
    .byte $03 ; |      XX| $FDBE
    .byte $02 ; |      X | $FDBF
    .byte $03 ; |      XX| $FDC0
    .byte $03 ; |      XX| $FDC1
    .byte $04 ; |     X  | $FDC2
LFDC3:
    .byte $07 ; |     XXX| $FDC3
    .byte $0D ; |    XX X| $FDC4
    .byte $13 ; |   X  XX| $FDC5
LFDC6:
    .byte $00 ; |        | $FDC6
    .byte $01 ; |       X| $FDC7
    .byte $02 ; |      X | $FDC8
    .byte $00 ; |        | $FDC9
    .byte $01 ; |       X| $FDCA
    .byte $02 ; |      X | $FDCB
    .byte $00 ; |        | $FDCC
    .byte $01 ; |       X| $FDCD
    .byte $02 ; |      X | $FDCE
    .byte $00 ; |        | $FDCF
    .byte $01 ; |       X| $FDD0
    .byte $02 ; |      X | $FDD1
    .byte $00 ; |        | $FDD2
    .byte $01 ; |       X| $FDD3
    .byte $02 ; |      X | $FDD4
    .byte $00 ; |        | $FDD5
LFDD6:
    .byte $01 ; |       X| $FDD6
    .byte $02 ; |      X | $FDD7
    .byte $02 ; |      X | $FDD8
    .byte $03 ; |      XX| $FDD9
    .byte $04 ; |     X  | $FDDA
LFDDB:
    .byte $01 ; |       X| $FDDB
    .byte $02 ; |      X | $FDDC
    .byte $04 ; |     X  | $FDDD
    .byte $08 ; |    X   | $FDDE
LFDDF:
    .byte $00 ; |        | $FDDF
    .byte $02 ; |      X | $FDE0
    .byte $00 ; |        | $FDE1
    .byte $02 ; |      X | $FDE2
    .byte $00 ; |        | $FDE3
    .byte $02 ; |      X | $FDE4
    .byte $00 ; |        | $FDE5
    .byte $02 ; |      X | $FDE6
    .byte $00 ; |        | $FDE7
    .byte $02 ; |      X | $FDE8
    .byte $00 ; |        | $FDE9
    .byte $02 ; |      X | $FDEA
    .byte $00 ; |        | $FDEB
    .byte $02 ; |      X | $FDEC
    .byte $00 ; |        | $FDED
    .byte $02 ; |      X | $FDEE
    .byte $00 ; |        | $FDEF
    .byte $02 ; |      X | $FDF0
LFDF1:
    .byte $1E ; |   XXXX | $FDF1
    .byte $50 ; | X X    | $FDF2
    .byte $69 ; | XX X  X| $FDF3
    .byte $8B ; |X   X XX| $FDF4
    .byte $BD ; |X XXXX X| $FDF5
    .byte $BD ; |X XXXX X| $FDF6
    .byte $CE ; |XX  XXX | $FDF7
    .byte $BE ; |X XXXXX | $FDF8
    .byte $05 ; |     X X| $FDF9
    .byte $37 ; |  XX XXX| $FDFA
    .byte $7A ; | XXXX X | $FDFB
    .byte $A4 ; |X X  X  | $FDFC
    .byte $94 ; |X  X X  | $FDFD
    .byte $94 ; |X  X X  | $FDFE
    .byte $E7 ; |XXX  XXX| $FDFF
    .byte $A5 ; |X X  X X| $FE00   Kangaroo?
LFE01:
    .byte $DC ; |XX XXX  | $FE01
    .byte $DC ; |XX XXX  | $FE02
    .byte $DC ; |XX XXX  | $FE03
    .byte $DC ; |XX XXX  | $FE04
    .byte $DC ; |XX XXX  | $FE05
    .byte $DC ; |XX XXX  | $FE06
    .byte $DC ; |XX XXX  | $FE07
    .byte $DD ; |XX XXX X| $FE08
    .byte $DC ; |XX XXX  | $FE09
    .byte $DC ; |XX XXX  | $FE0A
    .byte $DC ; |XX XXX  | $FE0B
    .byte $DC ; |XX XXX  | $FE0C
    .byte $DD ; |XX XXX X| $FE0D
    .byte $DD ; |XX XXX X| $FE0E
    .byte $DC ; |XX XXX  | $FE0F
    .byte $DD ; |XX XXX X| $FE10
LFE11:
    .byte $81 ; |X      X| $FE11
    .byte $79 ; | XXXX  X| $FE12
    .byte $79 ; | XXXX  X| $FE13
    .byte $79 ; | XXXX  X| $FE14
    .byte $79 ; | XXXX  X| $FE15
    .byte $79 ; | XXXX  X| $FE16
    .byte $79 ; | XXXX  X| $FE17
    .byte $09 ; |    X  X| $FE18
    .byte $09 ; |    X  X| $FE19
    .byte $09 ; |    X  X| $FE1A
    .byte $09 ; |    X  X| $FE1B
    .byte $09 ; |    X  X| $FE1C
    .byte $09 ; |    X  X| $FE1D
    .byte $79 ; | XXXX  X| $FE1E
    .byte $79 ; | XXXX  X| $FE1F
    .byte $79 ; | XXXX  X| $FE20
    .byte $79 ; | XXXX  X| $FE21
    .byte $79 ; | XXXX  X| $FE22
    .byte $79 ; | XXXX  X| $FE23
    .byte $81 ; |X      X| $FE24
    .byte $81 ; |X      X| $FE25
    .byte $81 ; |X      X| $FE26
    .byte $81 ; |X      X| $FE27
    .byte $75 ; | XXX X X| $FE28
    .byte $75 ; | XXX X X| $FE29
    .byte $81 ; |X      X| $FE2A
    .byte $81 ; |X      X| $FE2B
    .byte $81 ; |X      X| $FE2C
    .byte $81 ; |X      X| $FE2D
    .byte $69 ; | XX X  X| $FE2E
    .byte $81 ; |X      X| $FE2F
    .byte $81 ; |X      X| $FE30
    .byte $81 ; |X      X| $FE31
    .byte $0D ; |    XX X| $FE32
    .byte $0D ; |    XX X| $FE33
    .byte $6D ; | XX XX X| $FE34
    .byte $6D ; | XX XX X| $FE35
    .byte $81 ; |X      X| $FE36
    .byte $81 ; |X      X| $FE37
    .byte $81 ; |X      X| $FE38
    .byte $81 ; |X      X| $FE39
    .byte $81 ; |X      X| $FE3A
    .byte $81 ; |X      X| $FE3B
    .byte $81 ; |X      X| $FE3C
    .byte $81 ; |X      X| $FE3D
    .byte $5D ; | X XXX X| $FE3E
    .byte $5D ; | X XXX X| $FE3F
    .byte $5D ; | X XXX X| $FE40
    .byte $5D ; | X XXX X| $FE41
    .byte $6D ; | XX XX X| $FE42
    .byte $6D ; | XX XX X| $FE43
    .byte $79 ; | XXXX  X| $FE44
    .byte $79 ; | XXXX  X| $FE45
    .byte $81 ; |X      X| $FE46
    .byte $81 ; |X      X| $FE47
    .byte $19 ; |   XX  X| $FE48
    .byte $19 ; |   XX  X| $FE49
    .byte $19 ; |   XX  X| $FE4A
    .byte $19 ; |   XX  X| $FE4B
    .byte $81 ; |X      X| $FE4C
    .byte $81 ; |X      X| $FE4D
    .byte $81 ; |X      X| $FE4E
    .byte $81 ; |X      X| $FE4F
    .byte $81 ; |X      X| $FE50
    .byte $00 ; |        | $FE51
    .byte $02 ; |      X | $FE52
    .byte $01 ; |       X| $FE53
LFE54:
    .byte $00 ; |        | $FE54
    .byte $00 ; |        | $FE55
    .byte $00 ; |        | $FE56
    .byte $00 ; |        | $FE57
    .byte $00 ; |        | $FE58
    .byte $00 ; |        | $FE59
    .byte $00 ; |        | $FE5A
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
    .byte $00 ; |        | $FE69
    .byte $00 ; |        | $FE6A
    .byte $00 ; |        | $FE6B
    .byte $00 ; |        | $FE6C
    .byte $00 ; |        | $FE6D
    .byte $00 ; |        | $FE6E
    .byte $00 ; |        | $FE6F
    .byte $3A ; |  XXX X | $FE70
    .byte $00 ; |        | $FE71
    .byte $00 ; |        | $FE72
    .byte $00 ; |        | $FE73
    .byte $00 ; |        | $FE74
    .byte $00 ; |        | $FE75
    .byte $1A ; |   XX X | $FE76
    .byte $00 ; |        | $FE77
    .byte $00 ; |        | $FE78
    .byte $00 ; |        | $FE79
    .byte $00 ; |        | $FE7A
    .byte $00 ; |        | $FE7B
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
    .byte $1D ; |   XXX X| $FE8E
LFE8F:
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
    .byte $00 ; |        | $FE9B
    .byte $00 ; |        | $FE9C
    .byte $00 ; |        | $FE9D
    .byte $00 ; |        | $FE9E
    .byte $00 ; |        | $FE9F
    .byte $00 ; |        | $FEA0
    .byte $00 ; |        | $FEA1
    .byte $00 ; |        | $FEA2
    .byte $00 ; |        | $FEA3
    .byte $00 ; |        | $FEA4
    .byte $00 ; |        | $FEA5
    .byte $7F ; | XXXXXXX| $FEA6
    .byte $7F ; | XXXXXXX| $FEA7
    .byte $7F ; | XXXXXXX| $FEA8
    .byte $7F ; | XXXXXXX| $FEA9
    .byte $7F ; | XXXXXXX| $FEAA
    .byte $41 ; | X     X| $FEAB
    .byte $7F ; | XXXXXXX| $FEAC
    .byte $7F ; | XXXXXXX| $FEAD
    .byte $7F ; | XXXXXXX| $FEAE
    .byte $7F ; | XXXXXXX| $FEAF
    .byte $7F ; | XXXXXXX| $FEB0
    .byte $21 ; |  X    X| $FEB1
    .byte $7F ; | XXXXXXX| $FEB2
    .byte $7F ; | XXXXXXX| $FEB3
    .byte $7F ; | XXXXXXX| $FEB4
    .byte $7F ; | XXXXXXX| $FEB5
    .byte $7F ; | XXXXXXX| $FEB6
    .byte $00 ; |        | $FEB7
    .byte $00 ; |        | $FEB8
    .byte $00 ; |        | $FEB9
    .byte $00 ; |        | $FEBA
    .byte $7F ; | XXXXXXX| $FEBB
    .byte $7F ; | XXXXXXX| $FEBC
    .byte $7F ; | XXXXXXX| $FEBD
    .byte $7F ; | XXXXXXX| $FEBE
    .byte $7F ; | XXXXXXX| $FEBF
    .byte $7F ; | XXXXXXX| $FEC0
    .byte $51 ; | X X   X| $FEC1
    .byte $7F ; | XXXXXXX| $FEC2
    .byte $39 ; |  XXX  X| $FEC3
    .byte $7F ; | XXXXXXX| $FEC4
    .byte $7F ; | XXXXXXX| $FEC5
    .byte $7F ; | XXXXXXX| $FEC6
    .byte $7F ; | XXXXXXX| $FEC7
    .byte $7F ; | XXXXXXX| $FEC8
    .byte $7F ; | XXXXXXX| $FEC9
    .byte $7F ; | XXXXXXX| $FECA
    .byte $7F ; | XXXXXXX| $FECB
    .byte $7F ; | XXXXXXX| $FECC
LFECD:
    .byte $00 ; |        | $FECD
    .byte $00 ; |        | $FECE
    .byte $00 ; |        | $FECF
    .byte $00 ; |        | $FED0
    .byte $00 ; |        | $FED1
    .byte $00 ; |        | $FED2
    .byte $00 ; |        | $FED3
    .byte $00 ; |        | $FED4
    .byte $00 ; |        | $FED5
    .byte $00 ; |        | $FED6
    .byte $00 ; |        | $FED7
    .byte $00 ; |        | $FED8
    .byte $00 ; |        | $FED9
    .byte $00 ; |        | $FEDA
    .byte $00 ; |        | $FEDB
    .byte $00 ; |        | $FEDC
    .byte $00 ; |        | $FEDD
    .byte $00 ; |        | $FEDE
    .byte $00 ; |        | $FEDF
    .byte $00 ; |        | $FEE0
    .byte $00 ; |        | $FEE1
    .byte $00 ; |        | $FEE2
    .byte $00 ; |        | $FEE3
    .byte $00 ; |        | $FEE4
    .byte $64 ; | XX  X  | $FEE5
    .byte $48 ; | X  X   | $FEE6
    .byte $2C ; |  X XX  | $FEE7
    .byte $08 ; |    X   | $FEE8
    .byte $00 ; |        | $FEE9
    .byte $5C ; | X XXX  | $FEEA
    .byte $40 ; | X      | $FEEB
    .byte $24 ; |  X  X  | $FEEC
    .byte $00 ; |        | $FEED
    .byte $00 ; |        | $FEEE
    .byte $00 ; |        | $FEEF
    .byte $00 ; |        | $FEF0
    .byte $54 ; | X X X  | $FEF1
    .byte $38 ; |  XXX   | $FEF2
    .byte $1C ; |   XXX  | $FEF3
    .byte $08 ; |    X   | $FEF4
    .byte $00 ; |        | $FEF5
    .byte $00 ; |        | $FEF6
    .byte $00 ; |        | $FEF7
    .byte $00 ; |        | $FEF8
    .byte $00 ; |        | $FEF9
    .byte $3C ; |  XXXX  | $FEFA
    .byte $28 ; |  X X   | $FEFB
    .byte $38 ; |  XXX   | $FEFC
    .byte $4C ; | X  XX  | $FEFD
    .byte $00 ; |        | $FEFE
    .byte $00 ; |        | $FEFF
    .byte $20 ; |  X     | $FF00
    .byte $00 ; |        | $FF01
    .byte $1C ; |   XXX  | $FF02
    .byte $00 ; |        | $FF03
    .byte $50 ; | X X    | $FF04
    .byte $68 ; | XX X   | $FF05
    .byte $54 ; | X X X  | $FF06
    .byte $44 ; | X   X  | $FF07
    .byte $2C ; |  X XX  | $FF08
    .byte $40 ; | X      | $FF09
    .byte $58 ; | X XX   | $FF0A
LFF0B:
    .byte $00 ; |        | $FF0B
    .byte $00 ; |        | $FF0C
    .byte $18 ; |   XX   | $FF0D
    .byte $18 ; |   XX   | $FF0E
    .byte $16 ; |   X XX | $FF0F
    .byte $13 ; |   X  XX| $FF10
    .byte $12 ; |   X  X | $FF11
    .byte $10 ; |   X    | $FF12
    .byte $0E ; |    XXX | $FF13
    .byte $0D ; |    XX X| $FF14
    .byte $0C ; |    XX  | $FF15
    .byte $0B ; |    X XX| $FF16
    .byte $0C ; |    XX  | $FF17
    .byte $0B ; |    X XX| $FF18
    .byte $0C ; |    XX  | $FF19
    .byte $0B ; |    X XX| $FF1A
    .byte $0C ; |    XX  | $FF1B
    .byte $0B ; |    X XX| $FF1C
LFF1D:
    .byte $00 ; |        | $FF1D
    .byte $00 ; |        | $FF1E
    .byte $00 ; |        | $FF1F
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
    .byte $00 ; |        | $FF31
    .byte $00 ; |        | $FF32
    .byte $00 ; |        | $FF33
    .byte $00 ; |        | $FF34
    .byte $81 ; |X      X| $FF35
    .byte $5E ; | X XXXX | $FF36
    .byte $42 ; | X    X | $FF37
    .byte $26 ; |  X  XX | $FF38
    .byte $00 ; |        | $FF39
    .byte $76 ; | XXX XX | $FF3A
    .byte $56 ; | X X XX | $FF3B
    .byte $3A ; |  XXX X | $FF3C
    .byte $1E ; |   XXXX | $FF3D
    .byte $00 ; |        | $FF3E
    .byte $00 ; |        | $FF3F
    .byte $00 ; |        | $FF40
    .byte $76 ; | XXX XX | $FF41
    .byte $5A ; | X XX X | $FF42
    .byte $3E ; |  XXXXX | $FF43
    .byte $22 ; |  X   X | $FF44
    .byte $00 ; |        | $FF45
    .byte $00 ; |        | $FF46
    .byte $00 ; |        | $FF47
    .byte $00 ; |        | $FF48
    .byte $81 ; |X      X| $FF49
    .byte $4E ; | X  XXX | $FF4A
    .byte $37 ; |  XX XXX| $FF4B
    .byte $4A ; | X  X X | $FF4C
    .byte $72 ; | XXX  X | $FF4D
    .byte $00 ; |        | $FF4E
    .byte $00 ; |        | $FF4F
    .byte $36 ; |  XX XX | $FF50
    .byte $1A ; |   XX X | $FF51
    .byte $2E ; |  X XXX | $FF52
    .byte $4E ; | X  XXX | $FF53
    .byte $62 ; | XX   X | $FF54
    .byte $81 ; |X      X| $FF55
    .byte $6A ; | XX X X | $FF56
    .byte $56 ; | X X XX | $FF57
    .byte $3E ; |  XXXXX | $FF58
    .byte $56 ; | X X XX | $FF59
    .byte $81 ; |X      X| $FF5A
LFF5B:
    .byte $00 ; |        | $FF5B
    .byte $16 ; |   X XX | $FF5C
    .byte $2C ; |  X XX  | $FF5D
    .byte $42 ; | X    X | $FF5E
LFF5F:
    .byte $18 ; |   XX   | $FF5F
    .byte $15 ; |   X X X| $FF60
    .byte $14 ; |   X X  | $FF61
    .byte $13 ; |   X  XX| $FF62
    .byte $12 ; |   X  X | $FF63
    .byte $11 ; |   X   X| $FF64
    .byte $10 ; |   X    | $FF65
    .byte $00 ; |        | $FF66
    .byte $00 ; |        | $FF67
    .byte $1D ; |   XXX X| $FF68
    .byte $1C ; |   XXX  | $FF69
    .byte $1A ; |   XX X | $FF6A
    .byte $19 ; |   XX  X| $FF6B
    .byte $18 ; |   XX   | $FF6C
LFF6D:
    .byte $00 ; |        | $FF6D
    .byte $00 ; |        | $FF6E
    .byte $00 ; |        | $FF6F
    .byte $00 ; |        | $FF70
    .byte $01 ; |       X| $FF71
    .byte $01 ; |       X| $FF72
    .byte $01 ; |       X| $FF73
    .byte $01 ; |       X| $FF74
    .byte $01 ; |       X| $FF75
    .byte $01 ; |       X| $FF76
    .byte $02 ; |      X | $FF77
    .byte $02 ; |      X | $FF78
    .byte $02 ; |      X | $FF79
    .byte $02 ; |      X | $FF7A
    .byte $02 ; |      X | $FF7B
    .byte $02 ; |      X | $FF7C
    .byte $03 ; |      XX| $FF7D
    .byte $03 ; |      XX| $FF7E
    .byte $03 ; |      XX| $FF7F
    .byte $03 ; |      XX| $FF80
LFF81:
    .byte $03 ; |      XX| $FF81
    .byte $03 ; |      XX| $FF82
    .byte $02 ; |      X | $FF83
    .byte $03 ; |      XX| $FF84
    .byte $02 ; |      X | $FF85
    .byte $02 ; |      X | $FF86
    .byte $03 ; |      XX| $FF87
    .byte $03 ; |      XX| $FF88
LFF89:
    .byte <LF954-1       ; $FF89
    .byte <LF984-1       ; $FF8A
    .byte <LF984-1       ; $FF8B
    .byte <LF984-1       ; $FF8C
    .byte <LF984-1       ; $FF8D
    .byte <LF984-1       ; $FF8E
    .byte <LF925-1       ; $FF8F
LFF90:
    .byte >(LF954-1)     ; $FF90
    .byte >(LF984-1)     ; $FF91
    .byte >(LF984-1)     ; $FF92
    .byte >(LF984-1)     ; $FF93
    .byte >(LF984-1)     ; $FF94
    .byte >(LF984-1)     ; $FF95
    .byte >(LF925-1)     ; $FF96
LFF97:
    .byte $9F ; |X  XXXXX| $FF97
    .byte $B0 ; |X XX    | $FF98
    .byte $9F ; |X  XXXXX| $FF99
    .byte $C1 ; |XX     X| $FF9A
LFF9B:
    .byte $57 ; | X X XXX| $FF9B   fruit pointers?
    .byte $68 ; | XX X   | $FF9C
    .byte $79 ; | XXXX  X| $FF9D
    .byte $8A ; |X   X X | $FF9E
LFF9F:
    .byte $48 ; | X  X   | $FF9F
    .byte $48 ; | X  X   | $FFA0
    .byte $48 ; | X  X   | $FFA1
    .byte $28 ; |  X X   | $FFA2
LFFA3:
    .byte $04 ; |     X  | $FFA3
    .byte $04 ; |     X  | $FFA4
    .byte $04 ; |     X  | $FFA5
LFFA6:
    .byte $4D ; | X  XX X| $FFA6
    .byte $0F ; |    XXXX| $FFA7
    .byte $72 ; | XXX  X | $FFA8
LFFA9:
    .byte $07 ; |     XXX| $FFA9
    .byte $08 ; |    X   | $FFAA
    .byte $07 ; |     XXX| $FFAB
LFFAC:
    .byte $2C ; |  X XX  | $FFAC
    .byte $1C ; |   XXX  | $FFAD
    .byte $03 ; |      XX| $FFAE
    .byte $0A ; |    X X | $FFAF
    .byte $0B ; |    X XX| $FFB0
    .byte $0B ; |    X XX| $FFB1
    .byte $18 ; |   XX   | $FFB2
    .byte $6E ; | XX XXX | $FFB3
    .byte $6E ; | XX XXX | $FFB4
    .byte $0D ; |    XX X| $FFB5
    .byte $11 ; |   X   X| $FFB6
    .byte $0E ; |    XXX | $FFB7
    .byte $68 ; | XX X   | $FFB8
    .byte $50 ; | X X    | $FFB9
LFFBA:
    .byte $4B ; | X  X XX| $FFBA
    .byte $00 ; |        | $FFBB
    .byte $05 ; |     X X| $FFBC
    .byte $07 ; |     XXX| $FFBD
    .byte $09 ; |    X  X| $FFBE
    .byte $0B ; |    X XX| $FFBF
    .byte $0D ; |    XX X| $FFC0
    .byte $0F ; |    XXXX| $FFC1
    .byte $05 ; |     X X| $FFC2
    .byte $07 ; |     XXX| $FFC3
    .byte $09 ; |    X  X| $FFC4
    .byte $0B ; |    X XX| $FFC5
    .byte $0D ; |    XX X| $FFC6
    .byte $0F ; |    XXXX| $FFC7
LFFC8:
    .byte $08 ; |    X   | $FFC8
    .byte $0A ; |    X X | $FFC9
    .byte $09 ; |    X  X| $FFCA
    .byte $0B ; |    X XX| $FFCB
    .byte $0A ; |    X X | $FFCC
    .byte $0C ; |    XX  | $FFCD
    .byte $0B ; |    X XX| $FFCE
    .byte $0D ; |    XX X| $FFCF
    .byte $0C ; |    XX  | $FFD0
    .byte $0E ; |    XXX | $FFD1
    .byte $0D ; |    XX X| $FFD2
    .byte $0F ; |    XXXX| $FFD3
    .byte $0E ; |    XXX | $FFD4
    .byte $11 ; |   X   X| $FFD5
    .byte $10 ; |   X    | $FFD6
    .byte $13 ; |   X  XX| $FFD7
    .byte $12 ; |   X  X | $FFD8
    .byte $15 ; |   X X X| $FFD9
    .byte $14 ; |   X X  | $FFDA
    .byte $18 ; |   XX   | $FFDB
    .byte $17 ; |   X XXX| $FFDC
    .byte $1B ; |   XX XX| $FFDD
    .byte $1A ; |   XX X | $FFDE
LFFDF:
    .byte $18 ; |   XX   | $FFDF
    .byte $13 ; |   X  XX| $FFE0
    .byte $15 ; |   X X X| $FFE1
    .byte $12 ; |   X  X | $FFE2
    .byte $13 ; |   X  XX| $FFE3
    .byte $10 ; |   X    | $FFE4
    .byte $12 ; |   X  X | $FFE5
    .byte $0E ; |    XXX | $FFE6
    .byte $03 ; |      XX| $FFE7
    .byte $40 ; | X      | $FFE8
    .byte $40 ; | X      | $FFE9
    .byte $40 ; | X      | $FFEA
    .byte $40 ; | X      | $FFEB

LFFEC:
    sta    BANK_0                ; 4
    jmp    LFD7F                 ; 3

LFFF2:
    sta    BANK_0                ; 4
    jmp    LF479                 ; 3


       ORG $2FF8
      RORG $FFF8

    .byte $40 ; | X      | $FFF8
    .byte $40 ; | X      | $FFF9
    .byte $40 ; | X      | $FFFA
    .byte $40 ; | X      | $FFFB

    .word START_Bank1
    .word LFA74 ; break
