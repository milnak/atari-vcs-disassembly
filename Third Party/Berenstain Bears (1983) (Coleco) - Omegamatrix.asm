; Disassembly of Berenstain Bears
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcbb1.cfg bb.1
;
; bb1.cfg contents:
;
;      ORG F000
;      CODE F000 F7BD
;      GFX F7BE F7ED
;      CODE F7EE F89D
;      GFX F89E FCD4
;      CODE FCD5 FCEE
;      CODE FCEF FCFD
;      GFX FCFE FEDD
;      CODE FEDE FEF4
;      GFX FEF5 FFC2
;      CODE FFC3 FFCB
;      GFX FFCC FFCD
;      CODE FFCE FFD6
;      GFX FFD7 FFD7
;      CODE FFD8 FFF5
;      GFX FFF6 FFFF
;
; Disassembly of bb.2
; Command Line: newdistella -pasfcbb2.cfg bb.2
;
; bb2.cfg contents:
;
;      ORG F000
;      CODE F000 F683
;      GFX F684 F871
;      CODE F872 F8EB
;      GFX F8EC FAD2
;      CODE FAD3 FCFD
;      GFX FCFE FD00
;      CODE FD01 FD0F
;      GFX FD10 FD5F
;      CODE FD60 FDDF
;      GFX FDE0 FF89
;      CODE FF8A FF9F
;      GFX FFA0 FFCD
;      CODE FFCE FFD6
;      GFX FFD7 FFDC
;      CODE FFDD FFF7
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
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
SWCHA   =  $0280
SWACNT  =  $0281
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

frameCounter      = $97

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      1ST BANK
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $F000

L1000:
    sei                          ; 2
    cld                          ; 2
    ldx    #0                    ; 2
    txa                          ; 2
.loopClear:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    .loopClear            ; 2³

    lda    #$80                  ; 2
    ldx    #5                    ; 2
    stx    $E9                   ; 3
L1011:
    sta    $C3,X                 ; 4
    dex                          ; 2
    bpl    L1011                 ; 2³
    lda    #%011                 ; 2
    sta    SWACNT                ; 4   joy2 (up and down) are outputs, the rest are all inputs
    lda    #%001                 ; 2
    sta    SWCHA                 ; 4   output to Kid Vid
    lda    #>L129A               ; 2
    sta    $81                   ; 3
    lda    #<L129A               ; 2
    sta    $80                   ; 3
L1028:
    ldx    #$0E                  ; 2
L102A:
    lda    L1DFC,X               ; 4
    sta    $81,X                 ; 4
    dex                          ; 2
    bne    L102A                 ; 2³
    jmp    L1735                 ; 3

L1035:
    lda    SWCHA                 ; 4   input from Kid Vid
    and    #$08                  ; 2   keep joy2 (R)ight
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $BA                   ; 3   xRxx xxxx  $00 or $40
    lda    $B9                   ; 3
    bpl    L107E                 ; 2³
    asl                          ; 2
    bmi    L107E                 ; 2³
    lda    $B4                   ; 3
    tax                          ; 2
    and    #$40                  ; 2
    beq    L1072                 ; 2³
    cpx    #$48                  ; 2
    beq    L107E                 ; 2³
L1051:
    lda    #$66                  ; 2
    bne    L1057                 ; 3   always branch

L1055:
    lda    #$26                  ; 2
L1057:
    sta    COLUBK                ; 3
    lda    #%010                 ; 2   output to Kid Vid
    sta    SWCHA                 ; 4
    lda    #0                    ; 2
    sta    VBLANK                ; 3
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    
L1068:
;loops until reset is pressed
    lda    SWCHB                 ; 4
    and    #$01                  ; 2   reset pressed?
    bne    L1068                 ; 2³  - no
    jmp    L1000                 ; 3   - yes

L1072:
    txa                          ; 2
    beq    L1051                 ; 2³
    cpx    #4                    ; 2
    bcs    L1051                 ; 2³
    lda    L1EF7,X               ; 4
    sta    $DB                   ; 3
L107E:
    jsr    L1778                 ; 6
    lda    $FA                   ; 3
    ldx    #2                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    VBLANK                ; 3
    cmp    #5                    ; 2
    bcc    L1099                 ; 2³
    ldx    #3                    ; 2
    lda    $DB                   ; 3
L1091:
    cmp    L1EF5,X               ; 4
    beq    L1055                 ; 2³
    dex                          ; 2
    bpl    L1091                 ; 2³
L1099:
    ldx    INTIM                 ; 4
    bne    L1099                 ; 2³
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    VSYNC                 ; 3
    lda    #$1B                  ; 2
    sta    TIM64T                ; 4
    lda    $93                   ; 3
    beq    L10BB                 ; 2³
    ldx    #3                    ; 2
    bne    L10C1                 ; 3   always branch

L10BB:
    ldx    #1                    ; 2
    lda    $D2                   ; 3
    beq    L10C4                 ; 2³
L10C1:
    jmp    L1FD8                 ; 3

L10C4:
    lda    $DB                   ; 3
    beq    L1114                 ; 2³+1
    dec    $86                   ; 5
    bne    L10D4                 ; 2³
    ldy    $98                   ; 3
    cpy    #4                    ; 2
    beq    L10D7                 ; 2³
    inc    $98                   ; 5
L10D4:
    jmp    L1114                 ; 3

L10D7:
    dec    $87                   ; 5
    bne    L1102                 ; 2³+1
    ldy    #0                    ; 2
    lda    ($84),Y               ; 5
    bpl    L10E7                 ; 2³
    sta    $96                   ; 3
    ldx    #2                    ; 2
    bne    L10C1                 ; 3   always branch

L10E7:
    sta    $87                   ; 3
    iny                          ; 2
    lda    ($84),Y               ; 5
    tay                          ; 2
    lda    L1E8A,Y               ; 4
    sta    $94                   ; 3
    lda    L1E96,Y               ; 4
    sta    $95                   ; 3
    lda    #2                    ; 2
    clc                          ; 2
    adc    $84                   ; 3
    sta    $84                   ; 3
    bcc    L1102                 ; 2³
    inc    $85                   ; 5
L1102:
    lda    $83                   ; 3
    clc                          ; 2
    adc    $95                   ; 3
    sta    $83                   ; 3
    lda    $82                   ; 3
    clc                          ; 2
    adc    $94                   ; 3
    sta    $82                   ; 3
    inc    $86                   ; 5
    inc    $86                   ; 5
L1114:
    ldx    $D2                   ; 3
    beq    L111B                 ; 2³
    jmp    L1475                 ; 3

L111B:
    ldx    $88                   ; 3
    beq    L114B                 ; 2³
    lda    $82                   ; 3
    jsr    L1882                 ; 6
    sta    $99                   ; 3
    stx    $9A                   ; 3
    stx    $A0                   ; 3
    adc    #$0B                  ; 2
    sta    $9F                   ; 3
    lda    #<L1D93               ; 2
    sta    $A3                   ; 3
    sta    $A1                   ; 3
    lda    #>L1D93               ; 2
    sta    $A4                   ; 3
    sta    $A2                   ; 3
    ldy    #<L1CA3               ; 2
    sty    $9D                   ; 3
    ldy    #<L1CAE               ; 2
    sty    $A7                   ; 3
    ldy    #>L1CA3               ; 2
    sty    $9E                   ; 3
    sty    $A8                   ; 3
    jmp    L121D                 ; 3

L114B:
    lda    #<L1B2F               ; 2
    sta    $9D                   ; 3
    lda    #>L1B2F               ; 2
    sta    $9E                   ; 3
    lda    #<L1B38               ; 2
    sta    $A7                   ; 3
    lda    #>L1B38               ; 2
    sta    $A8                   ; 3
    lda    #<L1B4B               ; 2
    sta    $A1                   ; 3
    lda    #>L1B4B               ; 2
    sta    $A2                   ; 3
    lda    #<L1B54               ; 2
    sta    $A9                   ; 3
    lda    #>L1B54               ; 2
    sta    $AA                   ; 3
    ldy    $8C                   ; 3
    dec    $89                   ; 5
    bne    L117E                 ; 2³
    iny                          ; 2
    cpy    #5                    ; 2
    bne    L1178                 ; 2³
    ldy    #0                    ; 2
L1178:
    sty    $8C                   ; 3
    lda    #$0B                  ; 2
    sta    $89                   ; 3
L117E:
    lda    $A5                   ; 3
    beq    L1186                 ; 2³
    ldx    #6                    ; 2
    bne    L1199                 ; 3   always branch

L1186:
    ldx    $8D                   ; 3
    dec    $8A                   ; 5
    bne    L1199                 ; 2³
    inx                          ; 2
    cpx    #3                    ; 2
    bne    L1193                 ; 2³
    ldx    #0                    ; 2
L1193:
    stx    $8D                   ; 3
    lda    #$0A                  ; 2
    sta    $8A                   ; 3
L1199:
    txa                          ; 2
    pha                          ; 3
    lda    L1D7E,Y               ; 4
    clc                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L1A28,Y               ; 4
    sta    $99                   ; 3
    ldx    L1A28+1,Y             ; 4
    stx    $9A                   ; 3
    clc                          ; 2
    adc    #$7D                  ; 2
    sta    $9B                   ; 3
    txa                          ; 2
    adc    #0                    ; 2
    sta    $9C                   ; 3
    pla                          ; 4
    clc                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    L1A28,Y               ; 4
    sta    $9F                   ; 3
    ldx    L1A28+1,Y             ; 4
    stx    $A0                   ; 3
    clc                          ; 2
    adc    #$7D                  ; 2
    sta    $A3                   ; 3
    txa                          ; 2
    adc    #0                    ; 2
    sta    $A4                   ; 3
    jmp    L121D                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L11D0:
    lda    $82                   ; 3
    cmp    #$97                  ; 2
    bcc    L11E4                 ; 2³
    lda    #<L1D93               ; 2
    sta    $9F                   ; 3
    sta    $9B                   ; 3
    lda    #>L1D93               ; 2
    sta    $A0                   ; 3
    sta    $9C                   ; 3
    bne    L11EB                 ; 3   always branch

L11E4:
    jsr    L1882                 ; 6
    sta    $9F                   ; 3
    stx    $A0                   ; 3
L11EB:
    ldy    #<L1CA3               ; 2
    sty    $A7                   ; 3
    ldy    #>L1CA3               ; 2
    sty    $A8                   ; 3
    lda    #<L1E82               ; 2
    sta    $A9                   ; 3
    lda    #>L1E82               ; 2
    sta    $AA                   ; 3
    ldy    $BD                   ; 3
    cpy    #2                    ; 2
    beq    L121D                 ; 2³
    lda    #$FF                  ; 2
    sta    $A4                   ; 3
    lda    $92                   ; 3
    clc                          ; 2
    adc    #0                    ; 2
    cpy    #0                    ; 2
    beq    L1211                 ; 2³
    clc                          ; 2
    adc    #$1C                  ; 2
L1211:
    sta    $A3                   ; 3
    ldy    #7                    ; 2
L1215:
    lda    ($A3),Y               ; 5
    sta.wy $F2,Y                 ; 5
    dey                          ; 2
    bpl    L1215                 ; 2³
L121D:
    ldx    #4                    ; 2
    jmp    L1FD8                 ; 3

L1222:
    lda    INTIM                 ; 4
    bne    L1222                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    GRP1                  ; 3
    lda    #$93                  ; 2
    ldx    $D2                   ; 3
    bne    L1235                 ; 2³
    lda    #$9D                  ; 2
L1235:
    sta    TIM64T                ; 4
    lda    #$B8                  ; 2
    sta    COLUPF                ; 3
    lda    #0                    ; 2
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    $D2                   ; 3
    beq    L1249                 ; 2³
    jmp    L1316                 ; 3

L1249:
    ldx    #5                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
L124D:
    dex                          ; 2
    bpl    L124D                 ; 2³
    sta    RESP0                 ; 3
    nop                          ; 2
    sta.w  RESP1                 ; 4
    ldy    #0                    ; 2
    sty    NUSIZ1                ; 3
    sty    NUSIZ0                ; 3
    sty    CTRLPF                ; 3
    lda    #8                    ; 2
    sta    $BC                   ; 3
L1262:
    cpy    #$4D                  ; 2
    bcc    L1282                 ; 2³
    lda    #$DC                  ; 2
    sta    COLUPF                ; 3
    lda    #$0F                  ; 2
    sta    $BC                   ; 3
    lda    $A6                   ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    ldx    #0                    ; 2
    stx    GRP0                  ; 3
    lda    #$39                  ; 2
    ldx    #4                    ; 2
    jsr    L173A                 ; 6
    jmp    L1363                 ; 3

L1282:
    jsr    L1859                 ; 6
    dec    $BC                   ; 5
    beq    L1297                 ; 2³
L1289:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #6                    ; 2
L128D:
    dex                          ; 2
    bpl    L128D                 ; 2³
L1290:
    iny                          ; 2
    jsr    L1859                 ; 6
    iny                          ; 2
    bne    L1262                 ; 2³
L1297:
    jmp.ind ($0080)              ; 5

L129A:   ;indirect jump
    lda    #<L12B1               ; 2
    sta    $80                   ; 3
    lda    #>L12B1               ; 2
    sta    $81                   ; 3
    lda    #7                    ; 2
    sta    $BC                   ; 3
    ldx    #6                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
L12AA:
    dex                          ; 2
    bpl    L12AA                 ; 2³
    sta    RESP0                 ; 3
    bmi    L1290                 ; 3   always branch

L12B1:   ;indirect jump
    lda    #<L12C8               ; 2
    sta    $80                   ; 3
    lda    #>L12C8               ; 2
    sta    $81                   ; 3
    lda    #1                    ; 2
    sta    $BC                   ; 3
    ldx    #5                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
L12C1:
    dex                          ; 2
    bpl    L12C1                 ; 2³
    sta    RESP0                 ; 3
    bmi    L1290                 ; 3   always branch

L12C8:   ;indirect jump
    lda    #<L12DF               ; 2
    sta    $80                   ; 3
    lda    #>L12DF               ; 2
    sta    $81                   ; 3
    lda    #4                    ; 2
    sta    $BC                   ; 3
    ldx    #5                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
L12D8:
    dex                          ; 2
    bpl    L12D8                 ; 2³
    sta    RESP1                 ; 3
L12DD:
    bmi    L1290                 ; 3   always branch

L12DF:   ;indirect jump
    lda    #<L12F1               ; 2
    sta    $80                   ; 3
    lda    #>L12F1               ; 2
    sta    $81                   ; 3
    lda    #3                    ; 2
    sta    $BC                   ; 3
    lda    #5                    ; 2
    sta    NUSIZ1                ; 3
    bne    L1289                 ; 3   always branch

L12F1:   ;indirect jump
    lda    #<L1303               ; 2
    sta    $80                   ; 3
    lda    #>L1303               ; 2
    sta    $81                   ; 3
    lda    #4                    ; 2
    sta    $BC                   ; 3
    lda    #$F6                  ; 2
    sta    COLUPF                ; 3
    bne    L1289                 ; 3+1   always branch

L1303:   ;indirect jump
    lda    #<L129A               ; 2
    sta    $80                   ; 3
    lda    #>L129A               ; 2
    sta    $81                   ; 3
    ldx    #6                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
L130F:
    dex                          ; 2
    bpl    L130F                 ; 2³
    sta    RESP1                 ; 3
    bmi    L12DD                 ; 3+1   always branch

L1316:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #1                    ; 2
    sty    CTRLPF                ; 3
    lda    #$17                  ; 2
    sta    $BC                   ; 3
    ldy    #0                    ; 2
L1322:
    cpy    #$4D                  ; 2
    bcs    L1357                 ; 2³
    jsr    L1EDE                 ; 6
    dec    $BC                   ; 5
    beq    L1336                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
L132F:
    iny                          ; 2
    jsr    L1EDE                 ; 6
    iny                          ; 2
    bne    L1322                 ; 2³
L1336:
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp.ind ($0090)              ; 5

L133B:   ;indirect jump
    lda    #<L134D               ; 2
    sta    $90                   ; 3
    lda    #>L134D               ; 2
    sta    $91                   ; 3
    lda    #$0F                  ; 2
    sta    $BC                   ; 3
    lda    #$F6                  ; 2
    sta    COLUPF                ; 3
    bne    L132F                 ; 3   always branch

L134D:   ;indirect jump
    lda    #<L133B               ; 2
    sta    $90                   ; 3
    lda    #>L133B               ; 2
    sta    $91                   ; 3
    bne    L132F                 ; 3   always branch

L1357:
    lda    #0                    ; 2
    sta    PF2                   ; 3
    sta    PF1                   ; 3
    sta    PF0                   ; 3
    lda    #$F6                  ; 2
    sta    COLUPF                ; 3
L1363:
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    ldx    #0                    ; 2
    lda    $82                   ; 3
    jsr    L173A                 ; 6
    inx                          ; 2
    lda    $82                   ; 3
    jsr    L173A                 ; 6
L137A:
    lda    INTIM                 ; 4
    bne    L137A                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$7A                  ; 2
    ldx    $D2                   ; 3
    bne    L138B                 ; 2³
    lda    #$70                  ; 2
L138B:
    sta    TIM64T                ; 4
    lda    #0                    ; 2
    sec                          ; 2
    sbc    $83                   ; 3
    tay                          ; 2
    lda    $D2                   ; 3
    beq    L139B                 ; 2³
    jmp    L1499                 ; 3

L139B:
    ldx    #0                    ; 2
L139D:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    L19DE,X               ; 4
    sta    PF0                   ; 3
    lda    L19FE,X               ; 4
    sta    PF1                   ; 3
    lda    L189E,X               ; 4
    sta    PF2                   ; 3
    cpx    $BC                   ; 3
    bcc    L13B6                 ; 2³
    lda    #$18                  ; 2
    sta    COLUPF                ; 3
L13B6:
    iny                          ; 2
    beq    L13C3                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    inx                          ; 2
    cpx    #$24                  ; 2
    bcc    L139D                 ; 2³
    jmp    L146A                 ; 3

L13C3:
    stx    $96                   ; 3
    lda    ($9B),Y               ; 5
    tax                          ; 2
    lda    ($99),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    ($9D),Y               ; 5
    sta    COLUP0                ; 3
    lda    ($A1),Y               ; 5
    sta    COLUP1                ; 3
    ldx    $96                   ; 3
    inx                          ; 2
    iny                          ; 2
    cpy    #$0B                  ; 2
    beq    L1404                 ; 2³+1
    lda    ($99),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($9B),Y               ; 5
    sta    GRP1                  ; 3
    lda    L19DE,X               ; 4
    sta    PF0                   ; 3
    lda    L19FE,X               ; 4
    sta    PF1                   ; 3
    lda    L189E,X               ; 4
    sta    PF2                   ; 3
    iny                          ; 2
    cpx    $BC                   ; 3
    bcc    L13C3                 ; 2³
    lda    #$18                  ; 2
    sta    COLUPF                ; 3
    bne    L13C3                 ; 3+1   always branch

L1404:
    ldy    #0                    ; 2
L1406:
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($A3),Y               ; 5
    sta    GRP1                  ; 3
    lda    L19DE,X               ; 4
    sta    PF0                   ; 3
    lda    L19FE,X               ; 4
    sta    PF1                   ; 3
    lda    L189E,X               ; 4
    sta    PF2                   ; 3
    iny                          ; 2
    cpx    $BC                   ; 3
    bcc    L1428                 ; 2³
    lda    #$18                  ; 2
    sta    COLUPF                ; 3
L1428:
    lda    $88                   ; 3
    beq    L1430                 ; 2³
    cpy    #$13                  ; 2
    bcs    L144F                 ; 2³
L1430:
    cpy    #$17                  ; 2
    bcs    L144F                 ; 2³
    stx    $96                   ; 3
    lda    ($A3),Y               ; 5
    tax                          ; 2
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    ($A7),Y               ; 5
    sta    COLUP0                ; 3
    lda    ($A9),Y               ; 5
    sta    COLUP1                ; 3
    ldx    $96                   ; 3
    inx                          ; 2
    iny                          ; 2
    bne    L1406                 ; 2³
L144F:
    sta    WSYNC                 ; 3
;---------------------------------------
    cpx    #$24                  ; 2
    bcs    L146A                 ; 2³
    inx                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    L19DE,X               ; 4
    sta    PF0                   ; 3
    lda    L19FE,X               ; 4
    sta    PF1                   ; 3
    lda    L189E,X               ; 4
    sta    PF2                   ; 3
    jmp    L144F                 ; 3

L146A:
    lda    INTIM                 ; 4
    bne    L146A                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    COLUBK                ; 3
L1475:
    lda    $D2                   ; 3
    beq    L1496                 ; 2³
    ldx    #$0E                  ; 2
    lda    #0                    ; 2
L147D:
    sta    $81,X                 ; 4
    dex                          ; 2
    bne    L147D                 ; 2³
    sta    $B8                   ; 3
    sta    $9D                   ; 3
    lda    #>L133B               ; 2
    sta    $91                   ; 3
    lda    #<L133B               ; 2
    sta    $90                   ; 3
    lda    #$0A                  ; 2
    sta    $82                   ; 3
    lda    #$0A                  ; 2
    sta    $83                   ; 3
L1496:
    jmp    L1735                 ; 3

L1499:
    ldx    $BD                   ; 3
    beq    L14AC                 ; 2³
    dex                          ; 2
    beq    L14A6                 ; 2³
    ldx    #$1F                  ; 2
    lda    #$16                  ; 2
    bne    L14A8                 ; 3   always branch

L14A6:
    lda    #$AA                  ; 2
L14A8:
    sta    COLUPF                ; 3
L14AA:
    bne    L14F0                 ; 3   always branch

L14AC:
    ldx    #$3C                  ; 2
    bne    L14AA                 ; 3   always branch

L14B0:
    ldx    #0                    ; 2
L14B2:
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    L1DED,X               ; 4
    sta    PF0                   ; 3
    lda    L1FBB,X               ; 4
    sta    PF1                   ; 3
    lda    L1D76,X               ; 4
    sta    PF2                   ; 3
    lda    $F2,X                 ; 4
    sta    GRP1                  ; 3
    lda    L1E83,X               ; 4
    sta    COLUP1                ; 3
    iny                          ; 2
    cpy    #$1B                  ; 2
    bcc    L14D7                 ; 2³
    ldy    #$1B                  ; 2
L14D7:
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($A7),Y               ; 5
    sta    COLUP0                ; 3
    iny                          ; 2
    inx                          ; 2
    cpx    #4                    ; 2
    bne    L14B2                 ; 2³
    ldx    #$1B                  ; 2
    lda    #$DC                  ; 2
    sta    COLUPF                ; 3
    jmp    L16BB                 ; 3

L14F0:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    L1D9A,X               ; 4
    sta    PF0                   ; 3
    lda    L1F68,X               ; 4
    sta    PF1                   ; 3
    lda    L1D23,X               ; 4
    sta    PF2                   ; 3
    iny                          ; 2
    beq    L1509                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    inx                          ; 2
    bne    L14F0                 ; 2³+1
L1509:
    jsr    L1CD5                 ; 6
    cpy    #$0B                  ; 2
    beq    L1555                 ; 2³
    cpx    #$4D                  ; 2
    bne    L151D                 ; 2³
    jsr    L181B                 ; 6
    cpy    #$0B                  ; 2
    beq    L1555                 ; 2³
    bne    L1534                 ; 3   always branch

L151D:
    cpx    #$30                  ; 2
    bne    L152C                 ; 2³
    lda    #$40                  ; 2
    sta    $96                   ; 3
    jsr    L17EE                 ; 6
    cpy    #$0B                  ; 2
    beq    L1555                 ; 2³
L152C:
    cpx    #$12                  ; 2
    bne    L1534                 ; 2³
    lda    #$16                  ; 2
    sta    COLUBK                ; 3
L1534:
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($9B),Y               ; 5
    sta    GRP1                  ; 3
    lda    L1D9A,X               ; 4
    sta    PF0                   ; 3
    lda    L1F68,X               ; 4
    sta    PF1                   ; 3
    lda    L1D23,X               ; 4
    sta    PF2                   ; 3
    iny                          ; 2
    cpy    #$0B                  ; 2
    bne    L1509                 ; 2³
    jmp    L1602                 ; 3

L1555:
    cpx    #$1F                  ; 2
    bcs    L1578                 ; 2³
    cpx    #$12                  ; 2
    bne    L1561                 ; 2³
    lda    #$16                  ; 2
    sta    COLUBK                ; 3
L1561:
    cpx    #$18                  ; 2
    bne    L1593                 ; 2³
    lda    #$E0                  ; 2
    sta    $96                   ; 3
    jsr    L17EE                 ; 6
    lda    #4                    ; 2
    sta    NUSIZ1                ; 3
L1570:
    cpy    #$1B                  ; 2
    bcc    L1576                 ; 2³
    ldy    #$1B                  ; 2
L1576:
    bne    L15E6                 ; 2³
L1578:
    cpx    #$4D                  ; 2
    bne    L1581                 ; 2³
    jsr    L181B                 ; 6
    bne    L1570                 ; 3   always branch

L1581:
    cpx    #$53                  ; 2
    bcc    L1588                 ; 2³
    jmp    L14B0                 ; 3

L1588:
    cpx    #$30                  ; 2
    bcc    L15E6                 ; 2³
    cpx    #$3C                  ; 2
    bcs    L15E6                 ; 2³
    jmp    L1619                 ; 3

L1593:
    cpx    #$1B                  ; 2
    bcc    L15E6                 ; 2³
    ldx    #0                    ; 2
L1599:
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    L1DB5,X               ; 4
    sta    PF0                   ; 3
    lda    L1F83,X               ; 4
    sta    PF1                   ; 3
    lda    L1D3E,X               ; 4
    sta    PF2                   ; 3
    lda    $F2,X                 ; 4
    sta    GRP1                  ; 3
    lda    L1CC5,X               ; 4
    sta    COLUP1                ; 3
    iny                          ; 2
    cpy    #$1B                  ; 2
    bcc    L15BE                 ; 2³
    ldy    #$1B                  ; 2
L15BE:
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($A7),Y               ; 5
    sta    COLUP0                ; 3
    lda    $F6,X                 ; 4
    sta    GRP1                  ; 3
    lda    L1CC9,X               ; 4
    sta    COLUP1                ; 3
    iny                          ; 2
    inx                          ; 2
    cpx    #4                    ; 2
    bne    L1599                 ; 2³
    ldx    #0                    ; 2
    stx    GRP1                  ; 3
    lda    #$DC                  ; 2
    sta    COLUBK                ; 3
    lda    #$AA                  ; 2
    sta    COLUPF                ; 3
    jmp    L16E7                 ; 3

L15E6:
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    L1D9A,X               ; 4
    sta    PF0                   ; 3
    lda    L1F68,X               ; 4
    sta    PF1                   ; 3
    lda    L1D23,X               ; 4
    sta    PF2                   ; 3
    iny                          ; 2
    cpy    #$1B                  ; 2
    bcc    L1602                 ; 2³
    ldy    #$1B                  ; 2
L1602:
    cpx    #$2F                  ; 2
    bne    L160A                 ; 2³
    lda    #2                    ; 2
    sta    NUSIZ1                ; 3
L160A:
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($A7),Y               ; 5
    sta    COLUP0                ; 3
    inx                          ; 2
    iny                          ; 2
    jmp    L1555                 ; 3

L1619:
    ldx    #0                    ; 2
L161B:
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    L1DCA,X               ; 4
    sta    PF0                   ; 3
    lda    L1F98,X               ; 4
    sta    PF1                   ; 3
    lda    L1D53,X               ; 4
    sta    PF2                   ; 3
    cpx    #0                    ; 2
    bne    L163D                 ; 2³
    nop                          ; 2
    nop                          ; 2
    jsr    L177A                 ; 6   waste 12 cycles
    stx    RESP1                 ; 3
    beq    L1651                 ; 3   always branch

L163D:
    cpx    #8                    ; 2
    bne    L1649                 ; 2³
    lda    #2                    ; 2
    sta    NUSIZ1                ; 3
    stx    RESP1                 ; 3
    bne    L1651                 ; 3   always branch

L1649:
    sta    RESP1                 ; 3
    lda    #0                    ; 2
    sta    NUSIZ1                ; 3
    dec    $96                   ; 5
L1651:
    iny                          ; 2
    cpy    #$1B                  ; 2
    bcc    L1658                 ; 2³
    ldy    #$1B                  ; 2
L1658:
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($A7),Y               ; 5
    sta    COLUP0                ; 3
    lda    L1E6B,X               ; 4
    sta    GRP1                  ; 3
    lda    L1EC3,X               ; 4
    sta    COLUP1                ; 3
    inx                          ; 2
    iny                          ; 2
    cpx    #4                    ; 2
    beq    L161B                 ; 2³
    cpx    #8                    ; 2
    beq    L161B                 ; 2³
    cpx    #$0C                  ; 2
    bne    L1693                 ; 2³
    ldx    #$1D                  ; 2
    lda    #$DC                  ; 2
    sta    COLUPF                ; 3
    lda    #0                    ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
L1688:
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    inx                          ; 2
    cpx    #$1F                  ; 2
    bne    L1688                 ; 2³
    beq    L16E7                 ; 3   always branch

L1693:
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    L1DCA,X               ; 4
    sta    PF0                   ; 3
    lda    L1F98,X               ; 4
    sta    PF1                   ; 3
    lda    L1D53,X               ; 4
    sta    PF2                   ; 3
    lda    L1E76,X               ; 4
    sta    GRP1                  ; 3
    lda    L1ECE,X               ; 4
    sta    COLUP1                ; 3
    iny                          ; 2
    cpy    #$1B                  ; 2
    bcc    L1658                 ; 2³
    ldy    #$1B                  ; 2
    bne    L1658                 ; 3   always branch

L16BB:
    ldy    #0                    ; 2
L16BD:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    L1DD6,X               ; 4
    sta    PF0                   ; 3
    lda    L1FA4,X               ; 4
    sta    PF1                   ; 3
    lda    L1D5F,X               ; 4
    sta    PF2                   ; 3
    lda    L1EDB,Y               ; 4
    sta    GRP1                  ; 3
    lda    #$64                  ; 2
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    iny                          ; 2
    cpy    #3                    ; 2
    bne    L16E2                 ; 2³
    ldy    #2                    ; 2
L16E2:
    inx                          ; 2
    cpx    #$1F                  ; 2
    bcc    L16BD                 ; 2³
L16E7:
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    nop                          ; 2
    lda    #0                    ; 2
    sta    HMP0                  ; 3
    lda    #$80                  ; 2
    sta    HMP1                  ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    $BD                   ; 3
    bne    L1703                 ; 2³+1
    ldy    #0                    ; 2
    beq    L170C                 ; 3   always branch

L1703:
    dex                          ; 2
    bne    L170A                 ; 2³
    ldy    #$10                  ; 2
    bne    L170C                 ; 3   always branch

L170A:
    ldy    #$18                  ; 2
L170C:
    ldx    #1                    ; 2
    jsr    L1762                 ; 6
    ldx    #$15                  ; 2
    jsr    L177B                 ; 6
    ldx    #3                    ; 2
    jsr    L1762                 ; 6
    ldx    #9                    ; 2
    jsr    L177B                 ; 6
    ldx    #5                    ; 2
    jsr    L1762                 ; 6
    ldx    #9                    ; 2
    jsr    L177B                 ; 6
L172A:
    lda    INTIM                 ; 4
    bne    L172A                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
L1735:
    ldx    #0                    ; 2
    jmp    L1FD8                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L173A SUBROUTINE
    clc                          ; 2
    adc    #$2E                  ; 2
    tay                          ; 2
    and    #$0F                  ; 2
    sta    $96                   ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc    $96                   ; 3
    cmp    #$0F                  ; 2
    bcc    L1752                 ; 2³
    sbc    #$0F                  ; 2
    iny                          ; 2
L1752:
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
L175A:
    dey                          ; 2
    bpl    L175A                 ; 2³
    sta    RESP0,X               ; 4
    sta    HMP0,X                ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1762 SUBROUTINE
    lda    #$FF                  ; 2
    sta    $96                   ; 3
    sta    frameCounter          ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $C2,X                 ; 4
    sta    NUSIZ0                ; 3
    bpl    L1772                 ; 2³
    inc    $96                   ; 5
L1772:
    lda    $C3,X                 ; 4
    sta    NUSIZ1                ; 3
    bpl    M177A                 ; 2³
L1778 SUBROUTINE
    inc    frameCounter          ; 5
L177A SUBROUTINE
M177A:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L177B SUBROUTINE
    lda    #5                    ; 2
    sta    $BC                   ; 3
L177F:
    lda    L17BE,X               ; 4
    and    $96                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    and    frameCounter          ; 3
    sta    GRP1                  ; 3
    lda    L17D6,X               ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    L1D83,Y               ; 4
    sta    PF0                   ; 3
    lda    L1D00,Y               ; 4
    sta    PF1                   ; 3
    lda    L1F47,Y               ; 4
    sta    PF2                   ; 3
    dex                          ; 2
    lda    L17BE,X               ; 4
    and    $96                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    and    frameCounter          ; 3
    sta    GRP1                  ; 3
    lda    L17D6,X               ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    dex                          ; 2
    iny                          ; 2
    dec    $BC                   ; 5
    bne    L177F                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L17BE:
    .byte $00 ; |        | $17BE
    .byte $7E ; | XXXXXX | $17BF
    .byte $7E ; | XXXXXX | $17C0
    .byte $7A ; | XXXX X | $17C1
    .byte $7A ; | XXXX X | $17C2
    .byte $3C ; |  XXXX  | $17C3
    .byte $3C ; |  XXXX  | $17C4
    .byte $3C ; |  XXXX  | $17C5
    .byte $18 ; |   XX   | $17C6
    .byte $00 ; |        | $17C7
    .byte $00 ; |        | $17C8
    .byte $00 ; |        | $17C9
    .byte $00 ; |        | $17CA
    .byte $3C ; |  XXXX  | $17CB
    .byte $7E ; | XXXXXX | $17CC
    .byte $7E ; | XXXXXX | $17CD
    .byte $7E ; | XXXXXX | $17CE
    .byte $3C ; |  XXXX  | $17CF
    .byte $3C ; |  XXXX  | $17D0
    .byte $7E ; | XXXXXX | $17D1
    .byte $3C ; |  XXXX  | $17D2
    .byte $00 ; |        | $17D3
    .byte $00 ; |        | $17D4
    .byte $00 ; |        | $17D5
L17D6:
    .byte $00 ; |        | $17D6
    .byte $F4 ; |XXXX X  | $17D7
    .byte $F4 ; |XXXX X  | $17D8
    .byte $F6 ; |XXXX XX | $17D9
    .byte $F6 ; |XXXX XX | $17DA
    .byte $F6 ; |XXXX XX | $17DB
    .byte $F6 ; |XXXX XX | $17DC
    .byte $F6 ; |XXXX XX | $17DD
    .byte $F6 ; |XXXX XX | $17DE
    .byte $00 ; |        | $17DF
    .byte $00 ; |        | $17E0
    .byte $00 ; |        | $17E1
    .byte $00 ; |        | $17E2
    .byte $2C ; |  X XX  | $17E3
    .byte $3A ; |  XXX X | $17E4
    .byte $3A ; |  XXX X | $17E5
    .byte $3A ; |  XXX X | $17E6
    .byte $2C ; |  X XX  | $17E7
    .byte $2C ; |  X XX  | $17E8
    .byte $3A ; |  XXX X | $17E9
    .byte $1C ; |   XXX  | $17EA
    .byte $00 ; |        | $17EB
    .byte $00 ; |        | $17EC
    .byte $00 ; |        | $17ED

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L17EE SUBROUTINE
    sta    HMCLR                 ; 3
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    L1D9A,X               ; 4
    sta    PF0                   ; 3
    lda    L1F68,X               ; 4
    sta    PF1                   ; 3
    lda    L1D23,X               ; 4
    sta    PF2                   ; 3
    iny                          ; 2
    lda    $96                   ; 3
    sta    HMP1                  ; 3
    sta    RESP1                 ; 3
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    ($A7),Y               ; 5
    sta    COLUP0                ; 3
    inx                          ; 2
    iny                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L181B SUBROUTINE
    sta    HMCLR                 ; 3
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    L1D9A,X               ; 4
    sta    PF0                   ; 3
    lda    L1F68,X               ; 4
    sta    PF1                   ; 3
    lda    L1D23,X               ; 4
    sta    PF2                   ; 3
    lda    #$11                  ; 2
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
L1839:
    dex                          ; 2
    bpl    L1839                 ; 2³
    sta    RESP1                 ; 3
    ldx    #$4D                  ; 2
    nop                          ; 2
    lda    #$AA                  ; 2
    sta    COLUBK                ; 3
    iny                          ; 2
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    ($A7),Y               ; 5
    sta    COLUP0                ; 3
    inx                          ; 2
    iny                          ; 2
    lda    #5                    ; 2
    sta    NUSIZ1                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1859 SUBROUTINE
    lda    L18C2,Y               ; 4
    sta    GRP0                  ; 3
    lda    L194C,Y               ; 4
    sta    COLUP0                ; 3
    lda    L1991,Y               ; 4
    sta    COLUP1                ; 3
    lda    L1B6B,Y               ; 4
    sta    PF0                   ; 3
    lda    L1C55,Y               ; 4
    sta    COLUBK                ; 3
L1872:
    lda    L1BB9,Y               ; 4
    sta    PF1                   ; 3
    lda    L1907,Y               ; 4
    sta    GRP1                  ; 3
    lda    L1C07,Y               ; 4
    sta    PF2                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1882 SUBROUTINE
    lsr                          ; 2
    lsr                          ; 2
    sec                          ; 2
L1885:
    sbc    #3                    ; 2
    bcs    L1885                 ; 2³
    adc    #3                    ; 2
    and    #$03                  ; 2
    asl                          ; 2
    tay                          ; 2
    lda    #<L1F3C               ; 2
    sta    $9B                   ; 3
    lda    #>L1F3C               ; 2   presuming they are pointers
    sta    $9C                   ; 3
    lda    L1E0B,Y               ; 4
    ldx    L1E0B+1,Y             ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L189E:
    .byte $80 ; |X       | $189E
    .byte $80 ; |X       | $189F
    .byte $80 ; |X       | $18A0
    .byte $80 ; |X       | $18A1
    .byte $80 ; |X       | $18A2
    .byte $F0 ; |XXXX    | $18A3
    .byte $C8 ; |XX  X   | $18A4
    .byte $80 ; |X       | $18A5
    .byte $80 ; |X       | $18A6
    .byte $80 ; |X       | $18A7
    .byte $80 ; |X       | $18A8
    .byte $80 ; |X       | $18A9
    .byte $80 ; |X       | $18AA
    .byte $C0 ; |XX      | $18AB
    .byte $E0 ; |XXX     | $18AC
    .byte $00 ; |        | $18AD
    .byte $F0 ; |XXXX    | $18AE
    .byte $FF ; |XXXXXXXX| $18AF
    .byte $FF ; |XXXXXXXX| $18B0
    .byte $FF ; |XXXXXXXX| $18B1
    .byte $FF ; |XXXXXXXX| $18B2
    .byte $FF ; |XXXXXXXX| $18B3
    .byte $FF ; |XXXXXXXX| $18B4
    .byte $FF ; |XXXXXXXX| $18B5
    .byte $FF ; |XXXXXXXX| $18B6
    .byte $FF ; |XXXXXXXX| $18B7
    .byte $FF ; |XXXXXXXX| $18B8
    .byte $FF ; |XXXXXXXX| $18B9
    .byte $FF ; |XXXXXXXX| $18BA
    .byte $FF ; |XXXXXXXX| $18BB
    .byte $FF ; |XXXXXXXX| $18BC
    .byte $FF ; |XXXXXXXX| $18BD
    .byte $0F ; |    XXXX| $18BE
    .byte $00 ; |        | $18BF
    .byte $00 ; |        | $18C0
    .byte $00 ; |        | $18C1
L18C2:
    .byte $00 ; |        | $18C2
    .byte $00 ; |        | $18C3
    .byte $00 ; |        | $18C4
    .byte $00 ; |        | $18C5
    .byte $00 ; |        | $18C6
    .byte $10 ; |   X    | $18C7
    .byte $78 ; | XXXX   | $18C8
    .byte $FC ; |XXXXXX  | $18C9
    .byte $30 ; |  XX    | $18CA
    .byte $30 ; |  XX    | $18CB
    .byte $18 ; |   XX   | $18CC
    .byte $18 ; |   XX   | $18CD
    .byte $18 ; |   XX   | $18CE
    .byte $0C ; |    XX  | $18CF
    .byte $16 ; |   X XX | $18D0
    .byte $3F ; |  XXXXXX| $18D1
    .byte $64 ; | XX  X  | $18D2
    .byte $24 ; |  X  X  | $18D3
    .byte $24 ; |  X  X  | $18D4
    .byte $FF ; |XXXXXXXX| $18D5
    .byte $24 ; |  X  X  | $18D6
    .byte $E4 ; |XXX  X  | $18D7
    .byte $64 ; | XX  X  | $18D8
    .byte $3F ; |  XXXXXX| $18D9
    .byte $64 ; | XX  X  | $18DA
    .byte $24 ; |  X  X  | $18DB
    .byte $64 ; | XX  X  | $18DC
    .byte $BF ; |X XXXXXX| $18DD
    .byte $17 ; |   X XXX| $18DE
    .byte $24 ; |  X  X  | $18DF
    .byte $1A ; |   XX X | $18E0
    .byte $35 ; |  XX X X| $18E1
    .byte $64 ; | XX  X  | $18E2
    .byte $3F ; |  XXXXXX| $18E3
    .byte $24 ; |  X  X  | $18E4
    .byte $75 ; | XXX X X| $18E5
    .byte $1E ; |   XXXX | $18E6
    .byte $12 ; |   X  X | $18E7
    .byte $2C ; |  X XX  | $18E8
    .byte $00 ; |        | $18E9
    .byte $00 ; |        | $18EA
    .byte $00 ; |        | $18EB
    .byte $00 ; |        | $18EC
    .byte $E0 ; |XXX     | $18ED
    .byte $E3 ; |XXX   XX| $18EE
    .byte $E3 ; |XXX   XX| $18EF
    .byte $E3 ; |XXX   XX| $18F0
    .byte $E3 ; |XXX   XX| $18F1
    .byte $E0 ; |XXX     | $18F2
    .byte $00 ; |        | $18F3
    .byte $00 ; |        | $18F4
    .byte $00 ; |        | $18F5
    .byte $00 ; |        | $18F6
    .byte $00 ; |        | $18F7
    .byte $00 ; |        | $18F8
    .byte $00 ; |        | $18F9
    .byte $3C ; |  XXXX  | $18FA
    .byte $3C ; |  XXXX  | $18FB
    .byte $3C ; |  XXXX  | $18FC
    .byte $3C ; |  XXXX  | $18FD
    .byte $3C ; |  XXXX  | $18FE
    .byte $3C ; |  XXXX  | $18FF
    .byte $3C ; |  XXXX  | $1900
    .byte $3C ; |  XXXX  | $1901
    .byte $3C ; |  XXXX  | $1902
    .byte $3C ; |  XXXX  | $1903
    .byte $3C ; |  XXXX  | $1904
    .byte $3C ; |  XXXX  | $1905
    .byte $18 ; |   XX   | $1906
L1907:
    .byte $00 ; |        | $1907
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
    .byte $A0 ; |X X     | $1913
    .byte $D0 ; |XX X    | $1914
    .byte $D8 ; |XX XX   | $1915
    .byte $00 ; |        | $1916
    .byte $D8 ; |XX XX   | $1917
    .byte $D8 ; |XX XX   | $1918
    .byte $D8 ; |XX XX   | $1919
    .byte $00 ; |        | $191A
    .byte $D8 ; |XX XX   | $191B
    .byte $D8 ; |XX XX   | $191C
    .byte $D8 ; |XX XX   | $191D
    .byte $00 ; |        | $191E
    .byte $D8 ; |XX XX   | $191F
    .byte $D8 ; |XX XX   | $1920
    .byte $D8 ; |XX XX   | $1921
    .byte $00 ; |        | $1922
    .byte $00 ; |        | $1923
    .byte $00 ; |        | $1924
    .byte $1B ; |   XX XX| $1925
    .byte $1B ; |   XX XX| $1926
    .byte $1B ; |   XX XX| $1927
    .byte $1B ; |   XX XX| $1928
    .byte $1B ; |   XX XX| $1929
    .byte $00 ; |        | $192A
    .byte $00 ; |        | $192B
    .byte $00 ; |        | $192C
    .byte $00 ; |        | $192D
    .byte $00 ; |        | $192E
    .byte $3C ; |  XXXX  | $192F
    .byte $7A ; | XXXX X | $1930
    .byte $7F ; | XXXXXXX| $1931
    .byte $74 ; | XXX X  | $1932
    .byte $74 ; | XXX X  | $1933
    .byte $74 ; | XXX X  | $1934
    .byte $74 ; | XXX X  | $1935
    .byte $74 ; | XXX X  | $1936
    .byte $74 ; | XXX X  | $1937
    .byte $74 ; | XXX X  | $1938
    .byte $74 ; | XXX X  | $1939
    .byte $74 ; | XXX X  | $193A
    .byte $7F ; | XXXXXXX| $193B
    .byte $C0 ; |XX      | $193C
    .byte $C0 ; |XX      | $193D
    .byte $60 ; | XX     | $193E
    .byte $60 ; | XX     | $193F
    .byte $30 ; |  XX    | $1940
    .byte $30 ; |  XX    | $1941
    .byte $18 ; |   XX   | $1942
    .byte $18 ; |   XX   | $1943
    .byte $0C ; |    XX  | $1944
    .byte $1C ; |   XXX  | $1945
    .byte $16 ; |   X XX | $1946
    .byte $16 ; |   X XX | $1947
    .byte $13 ; |   X  XX| $1948
    .byte $13 ; |   X  XX| $1949
    .byte $10 ; |   X    | $194A
    .byte $00 ; |        | $194B
L194C:
    .byte $00 ; |        | $194C
    .byte $00 ; |        | $194D
    .byte $00 ; |        | $194E
    .byte $00 ; |        | $194F
    .byte $00 ; |        | $1950
    .byte $00 ; |        | $1951
    .byte $00 ; |        | $1952
    .byte $00 ; |        | $1953
    .byte $00 ; |        | $1954
    .byte $00 ; |        | $1955
    .byte $00 ; |        | $1956
    .byte $00 ; |        | $1957
    .byte $00 ; |        | $1958
    .byte $00 ; |        | $1959
    .byte $C4 ; |XX   X  | $195A
    .byte $58 ; | X XX   | $195B
    .byte $58 ; | X XX   | $195C
    .byte $58 ; | X XX   | $195D
    .byte $58 ; | X XX   | $195E
    .byte $58 ; | X XX   | $195F
    .byte $58 ; | X XX   | $1960
    .byte $58 ; | X XX   | $1961
    .byte $58 ; | X XX   | $1962
    .byte $58 ; | X XX   | $1963
    .byte $58 ; | X XX   | $1964
    .byte $58 ; | X XX   | $1965
    .byte $58 ; | X XX   | $1966
    .byte $56 ; | X X XX | $1967
    .byte $C4 ; |XX   X  | $1968
    .byte $C4 ; |XX   X  | $1969
    .byte $C4 ; |XX   X  | $196A
    .byte $58 ; | X XX   | $196B
    .byte $58 ; | X XX   | $196C
    .byte $58 ; | X XX   | $196D
    .byte $58 ; | X XX   | $196E
    .byte $58 ; | X XX   | $196F
    .byte $58 ; | X XX   | $1970
    .byte $56 ; | X X XX | $1971
    .byte $C4 ; |XX   X  | $1972
    .byte $00 ; |        | $1973
    .byte $00 ; |        | $1974
    .byte $00 ; |        | $1975
    .byte $00 ; |        | $1976
    .byte $56 ; | X X XX | $1977
    .byte $5E ; | X XXXX | $1978
    .byte $5E ; | X XXXX | $1979
    .byte $5E ; | X XXXX | $197A
    .byte $5E ; | X XXXX | $197B
    .byte $56 ; | X X XX | $197C
    .byte $00 ; |        | $197D
    .byte $00 ; |        | $197E
    .byte $00 ; |        | $197F
    .byte $00 ; |        | $1980
    .byte $00 ; |        | $1981
    .byte $00 ; |        | $1982
    .byte $56 ; | X X XX | $1983
    .byte $5E ; | X XXXX | $1984
    .byte $58 ; | X XX   | $1985
    .byte $5E ; | X XXXX | $1986
    .byte $58 ; | X XX   | $1987
    .byte $5E ; | X XXXX | $1988
    .byte $58 ; | X XX   | $1989
    .byte $5E ; | X XXXX | $198A
    .byte $58 ; | X XX   | $198B
    .byte $5E ; | X XXXX | $198C
    .byte $58 ; | X XX   | $198D
    .byte $5E ; | X XXXX | $198E
    .byte $56 ; | X X XX | $198F
    .byte $54 ; | X X X  | $1990
L1991:
    .byte $00 ; |        | $1991
    .byte $00 ; |        | $1992
    .byte $00 ; |        | $1993
    .byte $00 ; |        | $1994
    .byte $00 ; |        | $1995
    .byte $00 ; |        | $1996
    .byte $00 ; |        | $1997
    .byte $00 ; |        | $1998
    .byte $00 ; |        | $1999
    .byte $00 ; |        | $199A
    .byte $00 ; |        | $199B
    .byte $00 ; |        | $199C
    .byte $C4 ; |XX   X  | $199D
    .byte $C4 ; |XX   X  | $199E
    .byte $5E ; | X XXXX | $199F
    .byte $00 ; |        | $19A0
    .byte $5E ; | X XXXX | $19A1
    .byte $5E ; | X XXXX | $19A2
    .byte $5E ; | X XXXX | $19A3
    .byte $00 ; |        | $19A4
    .byte $5E ; | X XXXX | $19A5
    .byte $5E ; | X XXXX | $19A6
    .byte $5E ; | X XXXX | $19A7
    .byte $00 ; |        | $19A8
    .byte $5E ; | X XXXX | $19A9
    .byte $5E ; | X XXXX | $19AA
    .byte $5E ; | X XXXX | $19AB
    .byte $00 ; |        | $19AC
    .byte $00 ; |        | $19AD
    .byte $00 ; |        | $19AE
    .byte $B8 ; |X XXX   | $19AF
    .byte $5E ; | X XXXX | $19B0
    .byte $5E ; | X XXXX | $19B1
    .byte $00 ; |        | $19B2
    .byte $5E ; | X XXXX | $19B3
    .byte $5E ; | X XXXX | $19B4
    .byte $00 ; |        | $19B5
    .byte $00 ; |        | $19B6
    .byte $00 ; |        | $19B7
    .byte $00 ; |        | $19B8
    .byte $52 ; | X X  X | $19B9
    .byte $54 ; | X X X  | $19BA
    .byte $56 ; | X X XX | $19BB
    .byte $58 ; | X XX   | $19BC
    .byte $58 ; | X XX   | $19BD
    .byte $58 ; | X XX   | $19BE
    .byte $58 ; | X XX   | $19BF
    .byte $58 ; | X XX   | $19C0
    .byte $58 ; | X XX   | $19C1
    .byte $58 ; | X XX   | $19C2
    .byte $58 ; | X XX   | $19C3
    .byte $58 ; | X XX   | $19C4
    .byte $54 ; | X X X  | $19C5
    .byte $56 ; | X X XX | $19C6
    .byte $5E ; | X XXXX | $19C7
    .byte $56 ; | X X XX | $19C8
    .byte $5E ; | X XXXX | $19C9
    .byte $56 ; | X X XX | $19CA
    .byte $5E ; | X XXXX | $19CB
    .byte $56 ; | X X XX | $19CC
    .byte $5E ; | X XXXX | $19CD
    .byte $56 ; | X X XX | $19CE
    .byte $5E ; | X XXXX | $19CF
    .byte $56 ; | X X XX | $19D0
    .byte $5E ; | X XXXX | $19D1
    .byte $56 ; | X X XX | $19D2
    .byte $5E ; | X XXXX | $19D3
    .byte $5E ; | X XXXX | $19D4
    .byte $00 ; |        | $19D5
    .byte $00 ; |        | $19D6
    .byte $00 ; |        | $19D7
    .byte $00 ; |        | $19D8
    .byte $00 ; |        | $19D9
    .byte $00 ; |        | $19DA
    .byte $00 ; |        | $19DB
    .byte $00 ; |        | $19DC
    .byte $00 ; |        | $19DD
L19DE:
    .byte $30 ; |  XX    | $19DE
    .byte $30 ; |  XX    | $19DF
    .byte $30 ; |  XX    | $19E0
    .byte $60 ; | XX     | $19E1
    .byte $00 ; |        | $19E2
    .byte $00 ; |        | $19E3
    .byte $00 ; |        | $19E4
    .byte $00 ; |        | $19E5
    .byte $00 ; |        | $19E6
    .byte $00 ; |        | $19E7
    .byte $00 ; |        | $19E8
    .byte $00 ; |        | $19E9
    .byte $00 ; |        | $19EA
    .byte $00 ; |        | $19EB
    .byte $00 ; |        | $19EC
    .byte $00 ; |        | $19ED
    .byte $F0 ; |XXXX    | $19EE
    .byte $F0 ; |XXXX    | $19EF
    .byte $F0 ; |XXXX    | $19F0
    .byte $F0 ; |XXXX    | $19F1
    .byte $F0 ; |XXXX    | $19F2
    .byte $F0 ; |XXXX    | $19F3
    .byte $F0 ; |XXXX    | $19F4
    .byte $F0 ; |XXXX    | $19F5
    .byte $F0 ; |XXXX    | $19F6
    .byte $F0 ; |XXXX    | $19F7
    .byte $F0 ; |XXXX    | $19F8
    .byte $F0 ; |XXXX    | $19F9
    .byte $F0 ; |XXXX    | $19FA
    .byte $F0 ; |XXXX    | $19FB
    .byte $F0 ; |XXXX    | $19FC
    .byte $F0 ; |XXXX    | $19FD
L19FE:
    .byte $00 ; |        | $19FE
    .byte $00 ; |        | $19FF
    .byte $00 ; |        | $1A00
    .byte $00 ; |        | $1A01
    .byte $00 ; |        | $1A02
    .byte $00 ; |        | $1A03
    .byte $00 ; |        | $1A04
    .byte $00 ; |        | $1A05
    .byte $00 ; |        | $1A06
    .byte $00 ; |        | $1A07
    .byte $00 ; |        | $1A08
    .byte $00 ; |        | $1A09
    .byte $00 ; |        | $1A0A
    .byte $00 ; |        | $1A0B
    .byte $00 ; |        | $1A0C
    .byte $00 ; |        | $1A0D
    .byte $00 ; |        | $1A0E
    .byte $F0 ; |XXXX    | $1A0F
    .byte $FF ; |XXXXXXXX| $1A10
    .byte $FF ; |XXXXXXXX| $1A11
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
    .byte $0F ; |    XXXX| $1A1F
    .byte $00 ; |        | $1A20
    .byte $00 ; |        | $1A21
    .byte $00 ; |        | $1A22
    .byte $00 ; |        | $1A23
    .byte $00 ; |        | $1A24
    .byte $00 ; |        | $1A25
    .byte $00 ; |        | $1A26
    .byte $00 ; |        | $1A27

L1A28:
    .word  L1A36         ; $1A28
    .word  L1A4D         ; $1A2A
    .word  L1A64         ; $1A2C
    .word  L1A7B         ; $1A2E
    .word  L1A86         ; $1A30
    .word  L1A91         ; $1A32
    .word  L1A9C         ; $1A34

L1A36:
    .byte $1E ; |   XXXX | $1A36
    .byte $1E ; |   XXXX | $1A37
    .byte $FE ; |XXXXXXX | $1A38
    .byte $FE ; |XXXXXXX | $1A39
    .byte $1E ; |   XXXX | $1A3A
    .byte $00 ; |        | $1A3B
    .byte $7E ; | XXXXXX | $1A3C
    .byte $FE ; |XXXXXXX | $1A3D
    .byte $FE ; |XXXXXXX | $1A3E
    .byte $EC ; |XXX XX  | $1A3F
    .byte $CC ; |XX  XX  | $1A40
    .byte $CC ; |XX  XX  | $1A41
    .byte $CC ; |XX  XX  | $1A42
    .byte $0C ; |    XX  | $1A43
    .byte $0E ; |    XXX | $1A44
    .byte $0E ; |    XXX | $1A45
    .byte $0E ; |    XXX | $1A46
    .byte $00 ; |        | $1A47
    .byte $00 ; |        | $1A48
    .byte $00 ; |        | $1A49
    .byte $00 ; |        | $1A4A
    .byte $00 ; |        | $1A4B
    .byte $00 ; |        | $1A4C
L1A4D:
    .byte $1E ; |   XXXX | $1A4D
    .byte $1E ; |   XXXX | $1A4E
    .byte $FE ; |XXXXXXX | $1A4F
    .byte $FE ; |XXXXXXX | $1A50
    .byte $1E ; |   XXXX | $1A51
    .byte $00 ; |        | $1A52
    .byte $7E ; | XXXXXX | $1A53
    .byte $7E ; | XXXXXX | $1A54
    .byte $7E ; | XXXXXX | $1A55
    .byte $FC ; |XXXXXX  | $1A56
    .byte $FC ; |XXXXXX  | $1A57
    .byte $FC ; |XXXXXX  | $1A58
    .byte $DE ; |XX XXXX | $1A59
    .byte $DC ; |XX XXX  | $1A5A
    .byte $E8 ; |XXX X   | $1A5B
    .byte $E8 ; |XXX X   | $1A5C
    .byte $00 ; |        | $1A5D
    .byte $00 ; |        | $1A5E
    .byte $00 ; |        | $1A5F
    .byte $00 ; |        | $1A60
    .byte $00 ; |        | $1A61
    .byte $00 ; |        | $1A62
    .byte $00 ; |        | $1A63
L1A64:
    .byte $1E ; |   XXXX | $1A64
    .byte $1E ; |   XXXX | $1A65
    .byte $FE ; |XXXXXXX | $1A66
    .byte $FE ; |XXXXXXX | $1A67
    .byte $1E ; |   XXXX | $1A68
    .byte $00 ; |        | $1A69
    .byte $FE ; |XXXXXXX | $1A6A
    .byte $FE ; |XXXXXXX | $1A6B
    .byte $FC ; |XXXXXX  | $1A6C
    .byte $F8 ; |XXXXX   | $1A6D
    .byte $F8 ; |XXXXX   | $1A6E
    .byte $E0 ; |XXX     | $1A6F
    .byte $E0 ; |XXX     | $1A70
    .byte $60 ; | XX     | $1A71
    .byte $30 ; |  XX    | $1A72
    .byte $38 ; |  XXX   | $1A73
    .byte $00 ; |        | $1A74
    .byte $00 ; |        | $1A75
    .byte $00 ; |        | $1A76
    .byte $00 ; |        | $1A77
    .byte $00 ; |        | $1A78
    .byte $00 ; |        | $1A79
    .byte $00 ; |        | $1A7A
L1A7B:
    .byte $00 ; |        | $1A7B
    .byte $1C ; |   XXX  | $1A7C
    .byte $5E ; | X XXXX | $1A7D
    .byte $3E ; |  XXXXX | $1A7E
    .byte $6E ; | XX XXX | $1A7F
    .byte $FE ; |XXXXXXX | $1A80
    .byte $3E ; |  XXXXX | $1A81
    .byte $1D ; |   XXX X| $1A82
    .byte $0C ; |    XX  | $1A83
    .byte $0E ; |    XXX | $1A84
    .byte $1E ; |   XXXX | $1A85
L1A86:
    .byte $00 ; |        | $1A86
    .byte $1C ; |   XXX  | $1A87
    .byte $5E ; | X XXXX | $1A88
    .byte $3E ; |  XXXXX | $1A89
    .byte $6E ; | XX XXX | $1A8A
    .byte $3E ; |  XXXXX | $1A8B
    .byte $7E ; | XXXXXX | $1A8C
    .byte $1D ; |   XXX X| $1A8D
    .byte $0C ; |    XX  | $1A8E
    .byte $0E ; |    XXX | $1A8F
    .byte $1E ; |   XXXX | $1A90
L1A91:
    .byte $00 ; |        | $1A91
    .byte $1C ; |   XXX  | $1A92
    .byte $5E ; | X XXXX | $1A93
    .byte $3E ; |  XXXXX | $1A94
    .byte $6E ; | XX XXX | $1A95
    .byte $1E ; |   XXXX | $1A96
    .byte $3E ; |  XXXXX | $1A97
    .byte $5D ; | X XXX X| $1A98
    .byte $0C ; |    XX  | $1A99
    .byte $0E ; |    XXX | $1A9A
    .byte $1E ; |   XXXX | $1A9B
L1A9C:
    .byte $1E ; |   XXXX | $1A9C
    .byte $1E ; |   XXXX | $1A9D
    .byte $FE ; |XXXXXXX | $1A9E
    .byte $FE ; |XXXXXXX | $1A9F
    .byte $1E ; |   XXXX | $1AA0
    .byte $00 ; |        | $1AA1
    .byte $7E ; | XXXXXX | $1AA2
    .byte $7E ; | XXXXXX | $1AA3
    .byte $FE ; |XXXXXXX | $1AA4
    .byte $EC ; |XXX XX  | $1AA5
    .byte $EC ; |XXX XX  | $1AA6
    .byte $CC ; |XX  XX  | $1AA7
    .byte $CC ; |XX  XX  | $1AA8
    .byte $EE ; |XXX XXX | $1AA9
    .byte $EE ; |XXX XXX | $1AAA
    .byte $EE ; |XXX XXX | $1AAB
    .byte $00 ; |        | $1AAC
    .byte $00 ; |        | $1AAD
    .byte $00 ; |        | $1AAE
    .byte $00 ; |        | $1AAF
    .byte $00 ; |        | $1AB0
    .byte $00 ; |        | $1AB1
    .byte $00 ; |        | $1AB2
    .byte $60 ; | XX     | $1AB3
    .byte $60 ; | XX     | $1AB4
    .byte $00 ; |        | $1AB5
    .byte $00 ; |        | $1AB6
    .byte $60 ; | XX     | $1AB7
    .byte $7E ; | XXXXXX | $1AB8
    .byte $00 ; |        | $1AB9
    .byte $00 ; |        | $1ABA
    .byte $00 ; |        | $1ABB
    .byte $00 ; |        | $1ABC
    .byte $00 ; |        | $1ABD
    .byte $00 ; |        | $1ABE
    .byte $00 ; |        | $1ABF
    .byte $C0 ; |XX      | $1AC0
    .byte $E0 ; |XXX     | $1AC1
    .byte $60 ; | XX     | $1AC2
    .byte $60 ; | XX     | $1AC3
    .byte $C6 ; |XX   XX | $1AC4
    .byte $06 ; |     XX | $1AC5
    .byte $06 ; |     XX | $1AC6
    .byte $0E ; |    XXX | $1AC7
    .byte $00 ; |        | $1AC8
    .byte $00 ; |        | $1AC9
    .byte $60 ; | XX     | $1ACA
    .byte $60 ; | XX     | $1ACB
    .byte $00 ; |        | $1ACC
    .byte $00 ; |        | $1ACD
    .byte $60 ; | XX     | $1ACE
    .byte $7E ; | XXXXXX | $1ACF
    .byte $00 ; |        | $1AD0
    .byte $00 ; |        | $1AD1
    .byte $00 ; |        | $1AD2
L1AD3:
    .byte $00 ; |        | $1AD3
    .byte $00 ; |        | $1AD4
    .byte $00 ; |        | $1AD5
    .byte $00 ; |        | $1AD6
    .byte $02 ; |      X | $1AD7
    .byte $06 ; |     XX | $1AD8
    .byte $07 ; |     XXX| $1AD9
    .byte $67 ; | XX  XXX| $1ADA
    .byte $72 ; | XXX  X | $1ADB
    .byte $36 ; |  XX XX | $1ADC
    .byte $30 ; |  XX    | $1ADD
    .byte $70 ; | XXX    | $1ADE
    .byte $00 ; |        | $1ADF
    .byte $00 ; |        | $1AE0
    .byte $60 ; | XX     | $1AE1
    .byte $60 ; | XX     | $1AE2
    .byte $00 ; |        | $1AE3
    .byte $00 ; |        | $1AE4
    .byte $60 ; | XX     | $1AE5
    .byte $7E ; | XXXXXX | $1AE6
    .byte $00 ; |        | $1AE7
    .byte $00 ; |        | $1AE8
    .byte $00 ; |        | $1AE9
    .byte $00 ; |        | $1AEA
    .byte $00 ; |        | $1AEB
    .byte $18 ; |   XX   | $1AEC
    .byte $1E ; |   XXXX | $1AED
    .byte $1E ; |   XXXX | $1AEE
    .byte $0E ; |    XXX | $1AEF
    .byte $02 ; |      X | $1AF0
    .byte $18 ; |   XX   | $1AF1
    .byte $1C ; |   XXX  | $1AF2
    .byte $0C ; |    XX  | $1AF3
    .byte $0C ; |    XX  | $1AF4
    .byte $1C ; |   XXX  | $1AF5
    .byte $00 ; |        | $1AF6
    .byte $00 ; |        | $1AF7
    .byte $00 ; |        | $1AF8
    .byte $00 ; |        | $1AF9
    .byte $00 ; |        | $1AFA
    .byte $00 ; |        | $1AFB
    .byte $90 ; |X  X    | $1AFC
    .byte $00 ; |        | $1AFD
    .byte $00 ; |        | $1AFE
    .byte $00 ; |        | $1AFF
    .byte $10 ; |   X    | $1B00
    .byte $30 ; |  XX    | $1B01
    .byte $60 ; | XX     | $1B02
    .byte $00 ; |        | $1B03
    .byte $00 ; |        | $1B04
    .byte $00 ; |        | $1B05
    .byte $00 ; |        | $1B06
    .byte $90 ; |X  X    | $1B07
    .byte $00 ; |        | $1B08
    .byte $00 ; |        | $1B09
    .byte $00 ; |        | $1B0A
    .byte $10 ; |   X    | $1B0B
    .byte $30 ; |  XX    | $1B0C
    .byte $60 ; | XX     | $1B0D
    .byte $00 ; |        | $1B0E
    .byte $00 ; |        | $1B0F
    .byte $00 ; |        | $1B10
    .byte $00 ; |        | $1B11
    .byte $90 ; |X  X    | $1B12
    .byte $00 ; |        | $1B13
    .byte $00 ; |        | $1B14
    .byte $00 ; |        | $1B15
    .byte $10 ; |   X    | $1B16
    .byte $30 ; |  XX    | $1B17
    .byte $60 ; | XX     | $1B18
    .byte $60 ; | XX     | $1B19
    .byte $60 ; | XX     | $1B1A
    .byte $00 ; |        | $1B1B
    .byte $00 ; |        | $1B1C
    .byte $60 ; | XX     | $1B1D
    .byte $7E ; | XXXXXX | $1B1E
    .byte $00 ; |        | $1B1F
    .byte $00 ; |        | $1B20
    .byte $00 ; |        | $1B21
    .byte $00 ; |        | $1B22
    .byte $00 ; |        | $1B23
    .byte $00 ; |        | $1B24
    .byte $00 ; |        | $1B25
    .byte $00 ; |        | $1B26
    .byte $00 ; |        | $1B27
    .byte $00 ; |        | $1B28
    .byte $66 ; | XX  XX | $1B29
    .byte $66 ; | XX  XX | $1B2A
    .byte $66 ; | XX  XX | $1B2B
    .byte $66 ; | XX  XX | $1B2C
    .byte $EE ; |XXX XXX | $1B2D
    .byte $00 ; |        | $1B2E
L1B2F:
    .byte $00 ; |        | $1B2F
    .byte $56 ; | X X XX | $1B30
    .byte $56 ; | X X XX | $1B31
    .byte $56 ; | X X XX | $1B32
    .byte $F8 ; |XXXXX   | $1B33
    .byte $F8 ; |XXXXX   | $1B34
    .byte $F8 ; |XXXXX   | $1B35
    .byte $F8 ; |XXXXX   | $1B36
    .byte $EA ; |XXX X X | $1B37
L1B38:
    .byte $EA ; |XXX X X | $1B38
    .byte $EA ; |XXX X X | $1B39
    .byte $EA ; |XXX X X | $1B3A
    .byte $EA ; |XXX X X | $1B3B
    .byte $EA ; |XXX X X | $1B3C
    .byte $EA ; |XXX X X | $1B3D
    .byte $EA ; |XXX X X | $1B3E
    .byte $EA ; |XXX X X | $1B3F
    .byte $EA ; |XXX X X | $1B40
    .byte $EA ; |XXX X X | $1B41
    .byte $EA ; |XXX X X | $1B42
    .byte $EA ; |XXX X X | $1B43
    .byte $EA ; |XXX X X | $1B44
    .byte $EA ; |XXX X X | $1B45
    .byte $EA ; |XXX X X | $1B46
    .byte $EA ; |XXX X X | $1B47
    .byte $EA ; |XXX X X | $1B48
    .byte $EA ; |XXX X X | $1B49
    .byte $EA ; |XXX X X | $1B4A
L1B4B:
    .byte $00 ; |        | $1B4B
    .byte $00 ; |        | $1B4C
    .byte $00 ; |        | $1B4D
    .byte $00 ; |        | $1B4E
    .byte $00 ; |        | $1B4F
    .byte $00 ; |        | $1B50
    .byte $00 ; |        | $1B51
    .byte $00 ; |        | $1B52
    .byte $56 ; | X X XX | $1B53
L1B54:
    .byte $56 ; | X X XX | $1B54
    .byte $56 ; | X X XX | $1B55
    .byte $56 ; | X X XX | $1B56
    .byte $56 ; | X X XX | $1B57
    .byte $56 ; | X X XX | $1B58
    .byte $56 ; | X X XX | $1B59
    .byte $56 ; | X X XX | $1B5A
    .byte $56 ; | X X XX | $1B5B
    .byte $56 ; | X X XX | $1B5C
    .byte $56 ; | X X XX | $1B5D
    .byte $56 ; | X X XX | $1B5E
    .byte $56 ; | X X XX | $1B5F
    .byte $56 ; | X X XX | $1B60
    .byte $F2 ; |XXXX  X | $1B61
    .byte $F2 ; |XXXX  X | $1B62
    .byte $F2 ; |XXXX  X | $1B63
    .byte $F2 ; |XXXX  X | $1B64
    .byte $F2 ; |XXXX  X | $1B65
    .byte $F2 ; |XXXX  X | $1B66
    .byte $F2 ; |XXXX  X | $1B67
    .byte $F2 ; |XXXX  X | $1B68
    .byte $F2 ; |XXXX  X | $1B69
    .byte $F2 ; |XXXX  X | $1B6A
L1B6B:
    .byte $00 ; |        | $1B6B
    .byte $00 ; |        | $1B6C
    .byte $00 ; |        | $1B6D
    .byte $00 ; |        | $1B6E
    .byte $00 ; |        | $1B6F
    .byte $00 ; |        | $1B70
    .byte $00 ; |        | $1B71
    .byte $00 ; |        | $1B72
    .byte $00 ; |        | $1B73
    .byte $00 ; |        | $1B74
    .byte $00 ; |        | $1B75
    .byte $00 ; |        | $1B76
    .byte $00 ; |        | $1B77
    .byte $80 ; |X       | $1B78
    .byte $80 ; |X       | $1B79
    .byte $C0 ; |XX      | $1B7A
    .byte $C0 ; |XX      | $1B7B
    .byte $C0 ; |XX      | $1B7C
    .byte $C0 ; |XX      | $1B7D
    .byte $C0 ; |XX      | $1B7E
    .byte $C0 ; |XX      | $1B7F
    .byte $C0 ; |XX      | $1B80
    .byte $C0 ; |XX      | $1B81
    .byte $C0 ; |XX      | $1B82
    .byte $C0 ; |XX      | $1B83
    .byte $C0 ; |XX      | $1B84
    .byte $C0 ; |XX      | $1B85
    .byte $C0 ; |XX      | $1B86
    .byte $C0 ; |XX      | $1B87
    .byte $C0 ; |XX      | $1B88
    .byte $C0 ; |XX      | $1B89
    .byte $80 ; |X       | $1B8A
    .byte $80 ; |X       | $1B8B
    .byte $80 ; |X       | $1B8C
    .byte $00 ; |        | $1B8D
    .byte $00 ; |        | $1B8E
    .byte $00 ; |        | $1B8F
    .byte $00 ; |        | $1B90
    .byte $00 ; |        | $1B91
    .byte $F0 ; |XXXX    | $1B92
    .byte $F0 ; |XXXX    | $1B93
    .byte $F0 ; |XXXX    | $1B94
    .byte $D0 ; |XX X    | $1B95
    .byte $D0 ; |XX X    | $1B96
    .byte $D0 ; |XX X    | $1B97
    .byte $D0 ; |XX X    | $1B98
    .byte $F0 ; |XXXX    | $1B99
    .byte $E0 ; |XXX     | $1B9A
    .byte $C0 ; |XX      | $1B9B
    .byte $C0 ; |XX      | $1B9C
    .byte $C0 ; |XX      | $1B9D
    .byte $C0 ; |XX      | $1B9E
    .byte $C0 ; |XX      | $1B9F
    .byte $C0 ; |XX      | $1BA0
    .byte $C0 ; |XX      | $1BA1
    .byte $C0 ; |XX      | $1BA2
    .byte $C0 ; |XX      | $1BA3
    .byte $C0 ; |XX      | $1BA4
    .byte $C0 ; |XX      | $1BA5
    .byte $C0 ; |XX      | $1BA6
    .byte $E0 ; |XXX     | $1BA7
    .byte $E0 ; |XXX     | $1BA8
    .byte $C0 ; |XX      | $1BA9
    .byte $A0 ; |X X     | $1BAA
    .byte $01 ; |       X| $1BAB
    .byte $01 ; |       X| $1BAC
    .byte $00 ; |        | $1BAD
    .byte $00 ; |        | $1BAE
    .byte $00 ; |        | $1BAF
    .byte $00 ; |        | $1BB0
    .byte $00 ; |        | $1BB1
    .byte $00 ; |        | $1BB2
    .byte $00 ; |        | $1BB3
    .byte $00 ; |        | $1BB4
    .byte $00 ; |        | $1BB5
    .byte $00 ; |        | $1BB6
    .byte $00 ; |        | $1BB7
    .byte $00 ; |        | $1BB8
L1BB9:
    .byte $1F ; |   XXXXX| $1BB9
    .byte $1F ; |   XXXXX| $1BBA
    .byte $1F ; |   XXXXX| $1BBB
    .byte $3F ; |  XXXXXX| $1BBC
    .byte $3F ; |  XXXXXX| $1BBD
    .byte $7F ; | XXXXXXX| $1BBE
    .byte $7F ; | XXXXXXX| $1BBF
    .byte $7F ; | XXXXXXX| $1BC0
    .byte $FF ; |XXXXXXXX| $1BC1
    .byte $FF ; |XXXXXXXX| $1BC2
    .byte $FF ; |XXXXXXXX| $1BC3
    .byte $FF ; |XXXXXXXX| $1BC4
    .byte $FF ; |XXXXXXXX| $1BC5
    .byte $FF ; |XXXXXXXX| $1BC6
    .byte $FF ; |XXXXXXXX| $1BC7
    .byte $FF ; |XXXXXXXX| $1BC8
    .byte $FF ; |XXXXXXXX| $1BC9
    .byte $FF ; |XXXXXXXX| $1BCA
    .byte $FF ; |XXXXXXXX| $1BCB
    .byte $FF ; |XXXXXXXX| $1BCC
    .byte $FF ; |XXXXXXXX| $1BCD
    .byte $FF ; |XXXXXXXX| $1BCE
    .byte $FF ; |XXXXXXXX| $1BCF
    .byte $FF ; |XXXXXXXX| $1BD0
    .byte $FF ; |XXXXXXXX| $1BD1
    .byte $FF ; |XXXXXXXX| $1BD2
    .byte $FF ; |XXXXXXXX| $1BD3
    .byte $FF ; |XXXXXXXX| $1BD4
    .byte $FF ; |XXXXXXXX| $1BD5
    .byte $FF ; |XXXXXXXX| $1BD6
    .byte $FF ; |XXXXXXXX| $1BD7
    .byte $FF ; |XXXXXXXX| $1BD8
    .byte $FF ; |XXXXXXXX| $1BD9
    .byte $FF ; |XXXXXXXX| $1BDA
    .byte $FF ; |XXXXXXXX| $1BDB
    .byte $FF ; |XXXXXXXX| $1BDC
    .byte $FF ; |XXXXXXXX| $1BDD
    .byte $FF ; |XXXXXXXX| $1BDE
    .byte $FF ; |XXXXXXXX| $1BDF
    .byte $FF ; |XXXXXXXX| $1BE0
    .byte $FF ; |XXXXXXXX| $1BE1
    .byte $FF ; |XXXXXXXX| $1BE2
    .byte $FF ; |XXXXXXXX| $1BE3
    .byte $6F ; | XX XXXX| $1BE4
    .byte $6E ; | XX XXX | $1BE5
    .byte $2E ; |  X XXX | $1BE6
    .byte $2E ; |  X XXX | $1BE7
    .byte $2E ; |  X XXX | $1BE8
    .byte $3E ; |  XXXXX | $1BE9
    .byte $1E ; |   XXXX | $1BEA
    .byte $1E ; |   XXXX | $1BEB
    .byte $0F ; |    XXXX| $1BEC
    .byte $0F ; |    XXXX| $1BED
    .byte $0F ; |    XXXX| $1BEE
    .byte $0F ; |    XXXX| $1BEF
    .byte $0E ; |    XXX | $1BF0
    .byte $0E ; |    XXX | $1BF1
    .byte $0E ; |    XXX | $1BF2
    .byte $0E ; |    XXX | $1BF3
    .byte $0E ; |    XXX | $1BF4
    .byte $8E ; |X   XXX | $1BF5
    .byte $CE ; |XX  XXX | $1BF6
    .byte $CE ; |XX  XXX | $1BF7
    .byte $2E ; |  X XXX | $1BF8
    .byte $8F ; |X   XXXX| $1BF9
    .byte $0F ; |    XXXX| $1BFA
    .byte $0F ; |    XXXX| $1BFB
    .byte $0E ; |    XXX | $1BFC
    .byte $1E ; |   XXXX | $1BFD
    .byte $3F ; |  XXXXXX| $1BFE
    .byte $7F ; | XXXXXXX| $1BFF
    .byte $CB ; |XX  X XX| $1C00
    .byte $CB ; |XX  X XX| $1C01
    .byte $03 ; |      XX| $1C02
    .byte $05 ; |     X X| $1C03
    .byte $0D ; |    XX X| $1C04
    .byte $18 ; |   XX   | $1C05
    .byte $00 ; |        | $1C06
L1C07:
    .byte $01 ; |       X| $1C07
    .byte $01 ; |       X| $1C08
    .byte $01 ; |       X| $1C09
    .byte $03 ; |      XX| $1C0A
    .byte $03 ; |      XX| $1C0B
    .byte $07 ; |     XXX| $1C0C
    .byte $07 ; |     XXX| $1C0D
    .byte $07 ; |     XXX| $1C0E
    .byte $0F ; |    XXXX| $1C0F
    .byte $0F ; |    XXXX| $1C10
    .byte $0F ; |    XXXX| $1C11
    .byte $0F ; |    XXXX| $1C12
    .byte $0F ; |    XXXX| $1C13
    .byte $1F ; |   XXXXX| $1C14
    .byte $1F ; |   XXXXX| $1C15
    .byte $1F ; |   XXXXX| $1C16
    .byte $1F ; |   XXXXX| $1C17
    .byte $1F ; |   XXXXX| $1C18
    .byte $1F ; |   XXXXX| $1C19
    .byte $1F ; |   XXXXX| $1C1A
    .byte $1F ; |   XXXXX| $1C1B
    .byte $1F ; |   XXXXX| $1C1C
    .byte $1F ; |   XXXXX| $1C1D
    .byte $1F ; |   XXXXX| $1C1E
    .byte $1F ; |   XXXXX| $1C1F
    .byte $1F ; |   XXXXX| $1C20
    .byte $1F ; |   XXXXX| $1C21
    .byte $1F ; |   XXXXX| $1C22
    .byte $1F ; |   XXXXX| $1C23
    .byte $1F ; |   XXXXX| $1C24
    .byte $1F ; |   XXXXX| $1C25
    .byte $1F ; |   XXXXX| $1C26
    .byte $1F ; |   XXXXX| $1C27
    .byte $1F ; |   XXXXX| $1C28
    .byte $1F ; |   XXXXX| $1C29
    .byte $0F ; |    XXXX| $1C2A
    .byte $0F ; |    XXXX| $1C2B
    .byte $0F ; |    XXXX| $1C2C
    .byte $0F ; |    XXXX| $1C2D
    .byte $0F ; |    XXXX| $1C2E
    .byte $01 ; |       X| $1C2F
    .byte $01 ; |       X| $1C30
    .byte $00 ; |        | $1C31
    .byte $00 ; |        | $1C32
    .byte $00 ; |        | $1C33
    .byte $00 ; |        | $1C34
    .byte $00 ; |        | $1C35
    .byte $00 ; |        | $1C36
    .byte $00 ; |        | $1C37
    .byte $00 ; |        | $1C38
    .byte $00 ; |        | $1C39
    .byte $03 ; |      XX| $1C3A
    .byte $03 ; |      XX| $1C3B
    .byte $01 ; |       X| $1C3C
    .byte $01 ; |       X| $1C3D
    .byte $00 ; |        | $1C3E
    .byte $00 ; |        | $1C3F
    .byte $00 ; |        | $1C40
    .byte $00 ; |        | $1C41
    .byte $00 ; |        | $1C42
    .byte $00 ; |        | $1C43
    .byte $00 ; |        | $1C44
    .byte $00 ; |        | $1C45
    .byte $00 ; |        | $1C46
    .byte $00 ; |        | $1C47
    .byte $01 ; |       X| $1C48
    .byte $03 ; |      XX| $1C49
    .byte $00 ; |        | $1C4A
    .byte $00 ; |        | $1C4B
    .byte $00 ; |        | $1C4C
L1C4D:
    .byte $00 ; |        | $1C4D
    .byte $00 ; |        | $1C4E
    .byte $00 ; |        | $1C4F
    .byte $00 ; |        | $1C50
    .byte $00 ; |        | $1C51
    .byte $01 ; |       X| $1C52
    .byte $01 ; |       X| $1C53
    .byte $00 ; |        | $1C54
L1C55:
    .byte $B6 ; |X XX XX | $1C55
    .byte $B8 ; |X XXX   | $1C56
    .byte $B6 ; |X XX XX | $1C57
    .byte $B8 ; |X XXX   | $1C58
    .byte $B6 ; |X XX XX | $1C59
    .byte $B8 ; |X XXX   | $1C5A
    .byte $B6 ; |X XX XX | $1C5B
    .byte $B8 ; |X XXX   | $1C5C
    .byte $B4 ; |X XX X  | $1C5D
    .byte $B6 ; |X XX XX | $1C5E
    .byte $B4 ; |X XX X  | $1C5F
    .byte $B6 ; |X XX XX | $1C60
    .byte $B4 ; |X XX X  | $1C61
    .byte $B6 ; |X XX XX | $1C62
    .byte $B4 ; |X XX X  | $1C63
    .byte $B6 ; |X XX XX | $1C64
    .byte $B4 ; |X XX X  | $1C65
    .byte $B6 ; |X XX XX | $1C66
    .byte $B4 ; |X XX X  | $1C67
    .byte $B6 ; |X XX XX | $1C68
    .byte $B4 ; |X XX X  | $1C69
    .byte $B6 ; |X XX XX | $1C6A
    .byte $B4 ; |X XX X  | $1C6B
    .byte $B6 ; |X XX XX | $1C6C
    .byte $B4 ; |X XX X  | $1C6D
    .byte $B6 ; |X XX XX | $1C6E
    .byte $B2 ; |X XX  X | $1C6F
    .byte $B4 ; |X XX X  | $1C70
    .byte $B2 ; |X XX  X | $1C71
    .byte $B4 ; |X XX X  | $1C72
    .byte $B2 ; |X XX  X | $1C73
    .byte $B4 ; |X XX X  | $1C74
    .byte $B2 ; |X XX  X | $1C75
    .byte $B6 ; |X XX XX | $1C76
    .byte $B4 ; |X XX X  | $1C77
    .byte $B6 ; |X XX XX | $1C78
    .byte $B4 ; |X XX X  | $1C79
    .byte $B8 ; |X XXX   | $1C7A
    .byte $B6 ; |X XX XX | $1C7B
    .byte $B8 ; |X XXX   | $1C7C
    .byte $74 ; | XXX X  | $1C7D
    .byte $76 ; | XXX XX | $1C7E
    .byte $74 ; | XXX X  | $1C7F
    .byte $78 ; | XXXX   | $1C80
    .byte $76 ; | XXX XX | $1C81
    .byte $7A ; | XXXX X | $1C82
    .byte $78 ; | XXXX   | $1C83
    .byte $7A ; | XXXX X | $1C84
    .byte $78 ; | XXXX   | $1C85
    .byte $7C ; | XXXXX  | $1C86
    .byte $7A ; | XXXX X | $1C87
    .byte $7C ; | XXXXX  | $1C88
    .byte $7A ; | XXXX X | $1C89
    .byte $7E ; | XXXXXX | $1C8A
    .byte $7C ; | XXXXX  | $1C8B
    .byte $7E ; | XXXXXX | $1C8C
    .byte $7C ; | XXXXX  | $1C8D
    .byte $7E ; | XXXXXX | $1C8E
    .byte $D4 ; |XX X X  | $1C8F
    .byte $D6 ; |XX X XX | $1C90
    .byte $D4 ; |XX X X  | $1C91
    .byte $D8 ; |XX XX   | $1C92
    .byte $D6 ; |XX X XX | $1C93
    .byte $D8 ; |XX XX   | $1C94
    .byte $D6 ; |XX X XX | $1C95
    .byte $D8 ; |XX XX   | $1C96
    .byte $D6 ; |XX X XX | $1C97
    .byte $DA ; |XX XX X | $1C98
    .byte $D8 ; |XX XX   | $1C99
    .byte $DA ; |XX XX X | $1C9A
    .byte $D8 ; |XX XX   | $1C9B
    .byte $DA ; |XX XX X | $1C9C
    .byte $D8 ; |XX XX   | $1C9D
    .byte $DA ; |XX XX X | $1C9E
    .byte $D8 ; |XX XX   | $1C9F
    .byte $DC ; |XX XXX  | $1CA0
    .byte $DA ; |XX XX X | $1CA1
    .byte $DC ; |XX XXX  | $1CA2
L1CA3:
    .byte $F8 ; |XXXXX   | $1CA3
    .byte $F8 ; |XXXXX   | $1CA4
    .byte $F8 ; |XXXXX   | $1CA5
    .byte $F8 ; |XXXXX   | $1CA6
    .byte $F8 ; |XXXXX   | $1CA7
    .byte $F8 ; |XXXXX   | $1CA8
    .byte $F8 ; |XXXXX   | $1CA9
    .byte $F8 ; |XXXXX   | $1CAA
    .byte $36 ; |  XX XX | $1CAB
    .byte $36 ; |  XX XX | $1CAC
    .byte $36 ; |  XX XX | $1CAD
L1CAE:
    .byte $36 ; |  XX XX | $1CAE
    .byte $36 ; |  XX XX | $1CAF
    .byte $86 ; |X    XX | $1CB0
    .byte $86 ; |X    XX | $1CB1
    .byte $86 ; |X    XX | $1CB2
    .byte $86 ; |X    XX | $1CB3
    .byte $86 ; |X    XX | $1CB4
    .byte $86 ; |X    XX | $1CB5
    .byte $86 ; |X    XX | $1CB6
    .byte $86 ; |X    XX | $1CB7
    .byte $86 ; |X    XX | $1CB8
    .byte $86 ; |X    XX | $1CB9
    .byte $86 ; |X    XX | $1CBA
    .byte $86 ; |X    XX | $1CBB
    .byte $00 ; |        | $1CBC
    .byte $00 ; |        | $1CBD
    .byte $00 ; |        | $1CBE
    .byte $00 ; |        | $1CBF
    .byte $00 ; |        | $1CC0
    .byte $00 ; |        | $1CC1
    .byte $00 ; |        | $1CC2
    .byte $00 ; |        | $1CC3
    .byte $00 ; |        | $1CC4
L1CC5:
    .byte $56 ; | X X XX | $1CC5
    .byte $0E ; |    XXX | $1CC6
    .byte $0E ; |    XXX | $1CC7
    .byte $56 ; | X X XX | $1CC8
L1CC9:
    .byte $0E ; |    XXX | $1CC9
    .byte $0E ; |    XXX | $1CCA
    .byte $56 ; | X X XX | $1CCB
    .byte $56 ; | X X XX | $1CCC
    .byte $08 ; |    X   | $1CCD
    .byte $06 ; |     XX | $1CCE
    .byte $02 ; |      X | $1CCF
    .byte $00 ; |        | $1CD0
    .byte $08 ; |    X   | $1CD1
    .byte $06 ; |     XX | $1CD2
    .byte $02 ; |      X | $1CD3
    .byte $00 ; |        | $1CD4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1CD5 SUBROUTINE
    stx    $96                   ; 3
    lda    ($9B),Y               ; 5
    tax                          ; 2
    lda    ($9F),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    ($A7),Y               ; 5
    sta    COLUP0                ; 3
    lda    #0                    ; 2
    sta    COLUP1                ; 3
    ldx    $96                   ; 3
    inx                          ; 2
    iny                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    jmp    LFFE7                 ; 3   second bank?

L1CF2:
    jsr    L1F8A                 ; 6
    cmp    #$D0                  ; 2
    bcs    L1CF2                 ; 2³
    and    #$F8                  ; 2
    adc    #8                    ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $01 ; |       X| $1CFE
    .byte $01 ; |       X| $1CFF
L1D00:
    .byte $FF ; |XXXXXXXX| $1D00
    .byte $FF ; |XXXXXXXX| $1D01
    .byte $FF ; |XXXXXXXX| $1D02
    .byte $FF ; |XXXXXXXX| $1D03
    .byte $FE ; |XXXXXXX | $1D04
    .byte $FE ; |XXXXXXX | $1D05
    .byte $F0 ; |XXXX    | $1D06
    .byte $F0 ; |XXXX    | $1D07
    .byte $E0 ; |XXX     | $1D08
    .byte $E0 ; |XXX     | $1D09
    .byte $E0 ; |XXX     | $1D0A
    .byte $E0 ; |XXX     | $1D0B
    .byte $E0 ; |XXX     | $1D0C
    .byte $E0 ; |XXX     | $1D0D
    .byte $E0 ; |XXX     | $1D0E
    .byte $E0 ; |XXX     | $1D0F
    .byte $03 ; |      XX| $1D10
    .byte $07 ; |     XXX| $1D11
    .byte $0F ; |    XXXX| $1D12
    .byte $1F ; |   XXXXX| $1D13
    .byte $3F ; |  XXXXXX| $1D14
    .byte $3F ; |  XXXXXX| $1D15
    .byte $7F ; | XXXXXXX| $1D16
    .byte $7F ; | XXXXXXX| $1D17
    .byte $7F ; | XXXXXXX| $1D18
    .byte $7F ; | XXXXXXX| $1D19
    .byte $7F ; | XXXXXXX| $1D1A
    .byte $7F ; | XXXXXXX| $1D1B
    .byte $7F ; | XXXXXXX| $1D1C
    .byte $7F ; | XXXXXXX| $1D1D
    .byte $7F ; | XXXXXXX| $1D1E
    .byte $7F ; | XXXXXXX| $1D1F
    .byte $00 ; |        | $1D20
    .byte $00 ; |        | $1D21
    .byte $00 ; |        | $1D22
L1D23:
    .byte $00 ; |        | $1D23
    .byte $00 ; |        | $1D24
    .byte $00 ; |        | $1D25
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
    .byte $C0 ; |XX      | $1D30
    .byte $F8 ; |XXXXX   | $1D31
    .byte $FF ; |XXXXXXXX| $1D32
    .byte $FF ; |XXXXXXXX| $1D33
    .byte $FF ; |XXXXXXXX| $1D34
    .byte $FF ; |XXXXXXXX| $1D35
    .byte $FF ; |XXXXXXXX| $1D36
    .byte $7F ; | XXXXXXX| $1D37
    .byte $3F ; |  XXXXXX| $1D38
    .byte $1F ; |   XXXXX| $1D39
    .byte $0F ; |    XXXX| $1D3A
    .byte $07 ; |     XXX| $1D3B
    .byte $83 ; |X     XX| $1D3C
    .byte $41 ; | X     X| $1D3D
L1D3E:
    .byte $21 ; |  X    X| $1D3E
    .byte $11 ; |   X   X| $1D3F
    .byte $01 ; |       X| $1D40
    .byte $01 ; |       X| $1D41
    .byte $00 ; |        | $1D42
    .byte $00 ; |        | $1D43
    .byte $00 ; |        | $1D44
    .byte $00 ; |        | $1D45
    .byte $00 ; |        | $1D46
    .byte $00 ; |        | $1D47
    .byte $00 ; |        | $1D48
    .byte $00 ; |        | $1D49
    .byte $00 ; |        | $1D4A
    .byte $00 ; |        | $1D4B
    .byte $00 ; |        | $1D4C
    .byte $00 ; |        | $1D4D
    .byte $00 ; |        | $1D4E
    .byte $00 ; |        | $1D4F
    .byte $00 ; |        | $1D50
    .byte $00 ; |        | $1D51
    .byte $0F ; |    XXXX| $1D52
L1D53:
    .byte $FF ; |XXXXXXXX| $1D53
    .byte $FF ; |XXXXXXXX| $1D54
    .byte $FF ; |XXXXXXXX| $1D55
    .byte $FF ; |XXXXXXXX| $1D56
    .byte $FF ; |XXXXXXXX| $1D57
    .byte $FF ; |XXXXXXXX| $1D58
    .byte $FF ; |XXXXXXXX| $1D59
    .byte $FF ; |XXXXXXXX| $1D5A
    .byte $FF ; |XXXXXXXX| $1D5B
    .byte $FF ; |XXXXXXXX| $1D5C
    .byte $FF ; |XXXXXXXX| $1D5D
    .byte $F0 ; |XXXX    | $1D5E
L1D5F:
    .byte $00 ; |        | $1D5F
    .byte $00 ; |        | $1D60
    .byte $00 ; |        | $1D61
    .byte $00 ; |        | $1D62
    .byte $00 ; |        | $1D63
    .byte $00 ; |        | $1D64
    .byte $00 ; |        | $1D65
    .byte $00 ; |        | $1D66
    .byte $00 ; |        | $1D67
    .byte $00 ; |        | $1D68
    .byte $00 ; |        | $1D69
    .byte $00 ; |        | $1D6A
    .byte $00 ; |        | $1D6B
    .byte $00 ; |        | $1D6C
    .byte $00 ; |        | $1D6D
    .byte $01 ; |       X| $1D6E
    .byte $03 ; |      XX| $1D6F
    .byte $07 ; |     XXX| $1D70
    .byte $0F ; |    XXXX| $1D71
    .byte $1F ; |   XXXXX| $1D72
    .byte $3F ; |  XXXXXX| $1D73
    .byte $3F ; |  XXXXXX| $1D74
    .byte $3F ; |  XXXXXX| $1D75
L1D76:
    .byte $3E ; |  XXXXX | $1D76
    .byte $3D ; |  XXXX X| $1D77
    .byte $3B ; |  XXX XX| $1D78
    .byte $3F ; |  XXXXXX| $1D79
    .byte $3F ; |  XXXXXX| $1D7A
    .byte $3F ; |  XXXXXX| $1D7B
    .byte $1F ; |   XXXXX| $1D7C
    .byte $1F ; |   XXXXX| $1D7D
L1D7E:
    .byte $03 ; |      XX| $1D7E
    .byte $04 ; |     X  | $1D7F
    .byte $05 ; |     X X| $1D80
    .byte $04 ; |     X  | $1D81
    .byte $03 ; |      XX| $1D82
L1D83:
    .byte $F0 ; |XXXX    | $1D83
    .byte $F0 ; |XXXX    | $1D84
    .byte $F0 ; |XXXX    | $1D85
    .byte $F0 ; |XXXX    | $1D86
    .byte $F0 ; |XXXX    | $1D87
    .byte $F0 ; |XXXX    | $1D88
    .byte $F0 ; |XXXX    | $1D89
    .byte $F0 ; |XXXX    | $1D8A
    .byte $F0 ; |XXXX    | $1D8B
    .byte $F0 ; |XXXX    | $1D8C
    .byte $F0 ; |XXXX    | $1D8D
    .byte $F0 ; |XXXX    | $1D8E
    .byte $F0 ; |XXXX    | $1D8F
    .byte $F0 ; |XXXX    | $1D90
    .byte $F0 ; |XXXX    | $1D91
    .byte $00 ; |        | $1D92
L1D93:
    .byte $00 ; |        | $1D93
    .byte $00 ; |        | $1D94
    .byte $00 ; |        | $1D95
    .byte $00 ; |        | $1D96
    .byte $00 ; |        | $1D97
    .byte $00 ; |        | $1D98
    .byte $00 ; |        | $1D99
L1D9A:
    .byte $00 ; |        | $1D9A
    .byte $00 ; |        | $1D9B
    .byte $00 ; |        | $1D9C
    .byte $00 ; |        | $1D9D
    .byte $00 ; |        | $1D9E
    .byte $00 ; |        | $1D9F
    .byte $00 ; |        | $1DA0
    .byte $00 ; |        | $1DA1
    .byte $00 ; |        | $1DA2
    .byte $00 ; |        | $1DA3
    .byte $00 ; |        | $1DA4
    .byte $00 ; |        | $1DA5
    .byte $00 ; |        | $1DA6
    .byte $00 ; |        | $1DA7
    .byte $00 ; |        | $1DA8
    .byte $00 ; |        | $1DA9
    .byte $00 ; |        | $1DAA
    .byte $80 ; |X       | $1DAB
    .byte $00 ; |        | $1DAC
    .byte $00 ; |        | $1DAD
    .byte $00 ; |        | $1DAE
    .byte $00 ; |        | $1DAF
    .byte $00 ; |        | $1DB0
    .byte $00 ; |        | $1DB1
    .byte $00 ; |        | $1DB2
    .byte $F0 ; |XXXX    | $1DB3
    .byte $00 ; |        | $1DB4
L1DB5:
    .byte $00 ; |        | $1DB5
    .byte $00 ; |        | $1DB6
    .byte $00 ; |        | $1DB7
    .byte $00 ; |        | $1DB8
    .byte $00 ; |        | $1DB9
    .byte $00 ; |        | $1DBA
    .byte $00 ; |        | $1DBB
    .byte $00 ; |        | $1DBC
    .byte $00 ; |        | $1DBD
    .byte $00 ; |        | $1DBE
    .byte $00 ; |        | $1DBF
    .byte $00 ; |        | $1DC0
    .byte $00 ; |        | $1DC1
    .byte $00 ; |        | $1DC2
    .byte $00 ; |        | $1DC3
    .byte $00 ; |        | $1DC4
    .byte $00 ; |        | $1DC5
    .byte $F0 ; |XXXX    | $1DC6
    .byte $F0 ; |XXXX    | $1DC7
    .byte $F0 ; |XXXX    | $1DC8
    .byte $F0 ; |XXXX    | $1DC9
L1DCA:
    .byte $F0 ; |XXXX    | $1DCA
    .byte $F0 ; |XXXX    | $1DCB
    .byte $F0 ; |XXXX    | $1DCC
    .byte $F0 ; |XXXX    | $1DCD
    .byte $F0 ; |XXXX    | $1DCE
    .byte $F0 ; |XXXX    | $1DCF
    .byte $F0 ; |XXXX    | $1DD0
    .byte $F0 ; |XXXX    | $1DD1
    .byte $00 ; |        | $1DD2
    .byte $00 ; |        | $1DD3
    .byte $00 ; |        | $1DD4
    .byte $00 ; |        | $1DD5
L1DD6:
    .byte $00 ; |        | $1DD6
    .byte $00 ; |        | $1DD7
    .byte $00 ; |        | $1DD8
    .byte $00 ; |        | $1DD9
    .byte $00 ; |        | $1DDA
    .byte $00 ; |        | $1DDB
    .byte $00 ; |        | $1DDC
    .byte $00 ; |        | $1DDD
    .byte $00 ; |        | $1DDE
    .byte $00 ; |        | $1DDF
    .byte $00 ; |        | $1DE0
    .byte $00 ; |        | $1DE1
    .byte $00 ; |        | $1DE2
    .byte $00 ; |        | $1DE3
    .byte $00 ; |        | $1DE4
    .byte $00 ; |        | $1DE5
    .byte $80 ; |X       | $1DE6
    .byte $F0 ; |XXXX    | $1DE7
    .byte $F0 ; |XXXX    | $1DE8
    .byte $F0 ; |XXXX    | $1DE9
    .byte $F0 ; |XXXX    | $1DEA
    .byte $F0 ; |XXXX    | $1DEB
    .byte $F0 ; |XXXX    | $1DEC
L1DED:
    .byte $F0 ; |XXXX    | $1DED
    .byte $70 ; | XXX    | $1DEE
    .byte $00 ; |        | $1DEF
    .byte $F0 ; |XXXX    | $1DF0
    .byte $F0 ; |XXXX    | $1DF1
    .byte $F0 ; |XXXX    | $1DF2
    .byte $F0 ; |XXXX    | $1DF3
    .byte $F0 ; |XXXX    | $1DF4
    .byte $00 ; |        | $1DF5
    .byte $00 ; |        | $1DF6
    .byte $00 ; |        | $1DF7
    .byte $00 ; |        | $1DF8
    .byte $00 ; |        | $1DF9
    .byte $00 ; |        | $1DFA
    .byte $00 ; |        | $1DFB
L1DFC:
    .byte $00 ; |        | $1DFC
    .byte $97 ; |X  X XXX| $1DFD
    .byte $62 ; | XX   X | $1DFE
    .byte $A2 ; |X X   X | $1DFF
    .byte $FE ; |XXXXXXX | $1E00
    .byte $02 ; |      X | $1E01
    .byte $01 ; |       X| $1E02
    .byte $00 ; |        | $1E03
    .byte $01 ; |       X| $1E04
    .byte $01 ; |       X| $1E05
    .byte $01 ; |       X| $1E06
    .byte $00 ; |        | $1E07
    .byte $00 ; |        | $1E08
    .byte $00 ; |        | $1E09
    .byte $00 ; |        | $1E0A

L1E0B:
    .word  L1E11         ; $1E0B
    .word  L1E2F         ; $1E0D
    .word  L1E4D         ; $1E0F

L1E11:
    .byte $18 ; |   XX   | $1E11
    .byte $3C ; |  XXXX  | $1E12
    .byte $78 ; | XXXX   | $1E13
    .byte $7C ; | XXXXX  | $1E14
    .byte $76 ; | XXX XX | $1E15
    .byte $7E ; | XXXXXX | $1E16
    .byte $7C ; | XXXXX  | $1E17
    .byte $38 ; |  XXX   | $1E18
    .byte $38 ; |  XXX   | $1E19
    .byte $7E ; | XXXXXX | $1E1A
    .byte $7E ; | XXXXXX | $1E1B
    .byte $7C ; | XXXXX  | $1E1C
    .byte $7C ; | XXXXX  | $1E1D
    .byte $7C ; | XXXXX  | $1E1E
    .byte $7C ; | XXXXX  | $1E1F
    .byte $3E ; |  XXXXX | $1E20
    .byte $7E ; | XXXXXX | $1E21
    .byte $F6 ; |XXXX XX | $1E22
    .byte $E6 ; |XXX  XX | $1E23
    .byte $A6 ; |X X  XX | $1E24
    .byte $86 ; |X    XX | $1E25
    .byte $86 ; |X    XX | $1E26
    .byte $C6 ; |XX   XX | $1E27
    .byte $6C ; | XX XX  | $1E28
    .byte $38 ; |  XXX   | $1E29
    .byte $00 ; |        | $1E2A
    .byte $00 ; |        | $1E2B
    .byte $00 ; |        | $1E2C
    .byte $00 ; |        | $1E2D
    .byte $00 ; |        | $1E2E
L1E2F:
    .byte $18 ; |   XX   | $1E2F
    .byte $3C ; |  XXXX  | $1E30
    .byte $78 ; | XXXX   | $1E31
    .byte $7C ; | XXXXX  | $1E32
    .byte $76 ; | XXX XX | $1E33
    .byte $7E ; | XXXXXX | $1E34
    .byte $7C ; | XXXXX  | $1E35
    .byte $38 ; |  XXX   | $1E36
    .byte $38 ; |  XXX   | $1E37
    .byte $7E ; | XXXXXX | $1E38
    .byte $7E ; | XXXXXX | $1E39
    .byte $7C ; | XXXXX  | $1E3A
    .byte $7C ; | XXXXX  | $1E3B
    .byte $7E ; | XXXXXX | $1E3C
    .byte $7E ; | XXXXXX | $1E3D
    .byte $3E ; |  XXXXX | $1E3E
    .byte $7C ; | XXXXX  | $1E3F
    .byte $FE ; |XXXXXXX | $1E40
    .byte $BE ; |X XXXXX | $1E41
    .byte $8E ; |X   XXX | $1E42
    .byte $9E ; |X  XXXX | $1E43
    .byte $9A ; |X  XX X | $1E44
    .byte $CE ; |XX  XXX | $1E45
    .byte $6C ; | XX XX  | $1E46
    .byte $38 ; |  XXX   | $1E47
    .byte $00 ; |        | $1E48
    .byte $00 ; |        | $1E49
    .byte $00 ; |        | $1E4A
    .byte $00 ; |        | $1E4B
    .byte $00 ; |        | $1E4C
L1E4D:
    .byte $18 ; |   XX   | $1E4D
    .byte $3C ; |  XXXX  | $1E4E
    .byte $78 ; | XXXX   | $1E4F
    .byte $7C ; | XXXXX  | $1E50
    .byte $76 ; | XXX XX | $1E51
    .byte $7E ; | XXXXXX | $1E52
    .byte $7C ; | XXXXX  | $1E53
    .byte $38 ; |  XXX   | $1E54
    .byte $38 ; |  XXX   | $1E55
    .byte $7E ; | XXXXXX | $1E56
    .byte $7E ; | XXXXXX | $1E57
    .byte $7C ; | XXXXX  | $1E58
    .byte $7C ; | XXXXX  | $1E59
    .byte $7C ; | XXXXX  | $1E5A
    .byte $7E ; | XXXXXX | $1E5B
    .byte $3E ; |  XXXXX | $1E5C
    .byte $7A ; | XXXX X | $1E5D
    .byte $FE ; |XXXXXXX | $1E5E
    .byte $BE ; |X XXXXX | $1E5F
    .byte $B6 ; |X XX XX | $1E60
    .byte $F2 ; |XXXX  X | $1E61
    .byte $E2 ; |XXX   X | $1E62
    .byte $E6 ; |XXX  XX | $1E63
    .byte $6C ; | XX XX  | $1E64
    .byte $38 ; |  XXX   | $1E65
    .byte $00 ; |        | $1E66
    .byte $00 ; |        | $1E67
    .byte $00 ; |        | $1E68
    .byte $00 ; |        | $1E69
    .byte $00 ; |        | $1E6A
L1E6B:
    .byte $0C ; |    XX  | $1E6B
    .byte $3E ; |  XXXXX | $1E6C
    .byte $3E ; |  XXXXX | $1E6D
    .byte $00 ; |        | $1E6E
    .byte $0C ; |    XX  | $1E6F
    .byte $3E ; |  XXXXX | $1E70
    .byte $3E ; |  XXXXX | $1E71
    .byte $00 ; |        | $1E72
    .byte $0C ; |    XX  | $1E73
    .byte $3E ; |  XXXXX | $1E74
    .byte $3E ; |  XXXXX | $1E75
L1E76:
    .byte $00 ; |        | $1E76
    .byte $1A ; |   XX X | $1E77
    .byte $7E ; | XXXXXX | $1E78
    .byte $1C ; |   XXX  | $1E79
    .byte $00 ; |        | $1E7A
    .byte $1A ; |   XX X | $1E7B
    .byte $7E ; | XXXXXX | $1E7C
    .byte $1C ; |   XXX  | $1E7D
    .byte $00 ; |        | $1E7E
    .byte $1A ; |   XX X | $1E7F
    .byte $7E ; | XXXXXX | $1E80
    .byte $1C ; |   XXX  | $1E81
L1E82:
    .byte $00 ; |        | $1E82
L1E83:
    .byte $56 ; | X X XX | $1E83
    .byte $0E ; |    XXX | $1E84
    .byte $0E ; |    XXX | $1E85
    .byte $56 ; | X X XX | $1E86
    .byte $64 ; | XX  X  | $1E87
    .byte $64 ; | XX  X  | $1E88
    .byte $00 ; |        | $1E89
L1E8A:
    .byte $00 ; |        | $1E8A
    .byte $01 ; |       X| $1E8B
    .byte $01 ; |       X| $1E8C
    .byte $01 ; |       X| $1E8D
    .byte $00 ; |        | $1E8E
    .byte $FF ; |XXXXXXXX| $1E8F
    .byte $FF ; |XXXXXXXX| $1E90
    .byte $FF ; |XXXXXXXX| $1E91
    .byte $00 ; |        | $1E92
    .byte $00 ; |        | $1E93
    .byte $00 ; |        | $1E94
    .byte $6A ; | XX X X | $1E95
L1E96:
    .byte $FE ; |XXXXXXX | $1E96
    .byte $FE ; |XXXXXXX | $1E97
    .byte $00 ; |        | $1E98
    .byte $02 ; |      X | $1E99
    .byte $02 ; |      X | $1E9A
    .byte $02 ; |      X | $1E9B
    .byte $00 ; |        | $1E9C
    .byte $FE ; |XXXXXXX | $1E9D
    .byte $00 ; |        | $1E9E
    .byte $AB ; |X X X XX| $1E9F
    .byte $55 ; | X X X X| $1EA0
    .byte $00 ; |        | $1EA1
    .byte $78 ; | XXXX   | $1EA2
    .byte $08 ; |    X   | $1EA3
    .byte $5A ; | X XX X | $1EA4
    .byte $08 ; |    X   | $1EA5
    .byte $80 ; |X       | $1EA6
    .byte $78 ; | XXXX   | $1EA7
    .byte $08 ; |    X   | $1EA8
    .byte $01 ; |       X| $1EA9
    .byte $09 ; |    X  X| $1EAA
    .byte $46 ; | X   XX | $1EAB
    .byte $06 ; |     XX | $1EAC
    .byte $C0 ; |XX      | $1EAD
    .byte $7E ; | XXXXXX | $1EAE
    .byte $08 ; |    X   | $1EAF
    .byte $88 ; |X   X   | $1EB0
    .byte $E0 ; |XXX     | $1EB1
    .byte $46 ; | X   XX | $1EB2
    .byte $02 ; |      X | $1EB3
    .byte $01 ; |       X| $1EB4
    .byte $0A ; |    X X | $1EB5
    .byte $F0 ; |XXXX    | $1EB6
    .byte $80 ; |X       | $1EB7
    .byte $01 ; |       X| $1EB8
    .byte $0B ; |    X XX| $1EB9
    .byte $78 ; | XXXX   | $1EBA
    .byte $08 ; |    X   | $1EBB
    .byte $78 ; | XXXX   | $1EBC
    .byte $08 ; |    X   | $1EBD
    .byte $01 ; |       X| $1EBE
    .byte $09 ; |    X  X| $1EBF
    .byte $40 ; | X      | $1EC0
    .byte $02 ; |      X | $1EC1
    .byte $C3 ; |XX    XX| $1EC2
L1EC3:
    .byte $08 ; |    X   | $1EC3
    .byte $08 ; |    X   | $1EC4
    .byte $06 ; |     XX | $1EC5
    .byte $00 ; |        | $1EC6
    .byte $08 ; |    X   | $1EC7
    .byte $08 ; |    X   | $1EC8
    .byte $06 ; |     XX | $1EC9
    .byte $00 ; |        | $1ECA
    .byte $08 ; |    X   | $1ECB
    .byte $08 ; |    X   | $1ECC
    .byte $06 ; |     XX | $1ECD
L1ECE:
    .byte $00 ; |        | $1ECE
    .byte $08 ; |    X   | $1ECF
    .byte $06 ; |     XX | $1ED0
    .byte $02 ; |      X | $1ED1
    .byte $00 ; |        | $1ED2
    .byte $08 ; |    X   | $1ED3
    .byte $06 ; |     XX | $1ED4
    .byte $02 ; |      X | $1ED5
    .byte $00 ; |        | $1ED6
    .byte $08 ; |    X   | $1ED7
    .byte $06 ; |     XX | $1ED8
    .byte $02 ; |      X | $1ED9
    .byte $00 ; |        | $1EDA
L1EDB:
    .byte $C3 ; |XX    XX| $1EDB
    .byte $81 ; |X      X| $1EDC
    .byte $00 ; |        | $1EDD

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1EDE SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    L1C55,Y               ; 4
    sta    COLUBK                ; 3
    lda    L1B6B,Y               ; 4
    sta    PF0                   ; 3
    lda    L1BB9,Y               ; 4
    sta    PF1                   ; 3
    lda    L1C07,Y               ; 4
    sta    PF2                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1EF5:
    .byte $15 ; |   X X X| $1EF5
    .byte $2F ; |  X XXXX| $1EF6
L1EF7:
    .byte $7F ; | XXXXXXX| $1EF7
    .byte $01 ; |       X| $1EF8
    .byte $15 ; |   X X X| $1EF9
    .byte $2F ; |  X XXXX| $1EFA
    .byte $8C ; |X   XX  | $1EFB
    .byte $8E ; |X   XXX | $1EFC
    .byte $8C ; |X   XX  | $1EFD
    .byte $8C ; |X   XX  | $1EFE
    .byte $8E ; |X   XXX | $1EFF
    .byte $FF ; |XXXXXXXX| $1F00
    .byte $FF ; |XXXXXXXX| $1F01
    .byte $FF ; |XXXXXXXX| $1F02
    .byte $FF ; |XXXXXXXX| $1F03
    .byte $FF ; |XXXXXXXX| $1F04
    .byte $FE ; |XXXXXXX | $1F05
    .byte $FE ; |XXXXXXX | $1F06
    .byte $FE ; |XXXXXXX | $1F07
    .byte $FF ; |XXXXXXXX| $1F08
    .byte $FC ; |XXXXXX  | $1F09
    .byte $FC ; |XXXXXX  | $1F0A
    .byte $FC ; |XXXXXX  | $1F0B
    .byte $FB ; |XXXXX XX| $1F0C
    .byte $F8 ; |XXXXX   | $1F0D
    .byte $F8 ; |XXXXX   | $1F0E
    .byte $F8 ; |XXXXX   | $1F0F
    .byte $F3 ; |XXXX  XX| $1F10
    .byte $F0 ; |XXXX    | $1F11
    .byte $F0 ; |XXXX    | $1F12
    .byte $F0 ; |XXXX    | $1F13
    .byte $E3 ; |XXX   XX| $1F14
    .byte $E0 ; |XXX     | $1F15
    .byte $E0 ; |XXX     | $1F16
    .byte $E0 ; |XXX     | $1F17
    .byte $C3 ; |XX    XX| $1F18
    .byte $C0 ; |XX      | $1F19
    .byte $C0 ; |XX      | $1F1A
    .byte $C0 ; |XX      | $1F1B
    .byte $FF ; |XXXXXXXX| $1F1C
    .byte $FF ; |XXXXXXXX| $1F1D
    .byte $FF ; |XXXXXXXX| $1F1E
    .byte $C3 ; |XX    XX| $1F1F
    .byte $FF ; |XXXXXXXX| $1F20
    .byte $FF ; |XXXXXXXX| $1F21
    .byte $FF ; |XXXXXXXX| $1F22
    .byte $81 ; |X      X| $1F23
    .byte $FF ; |XXXXXXXX| $1F24
    .byte $FC ; |XXXXXX  | $1F25
    .byte $FC ; |XXXXXX  | $1F26
    .byte $C3 ; |XX    XX| $1F27
    .byte $FC ; |XXXXXX  | $1F28
    .byte $FC ; |XXXXXX  | $1F29
    .byte $FC ; |XXXXXX  | $1F2A
    .byte $81 ; |X      X| $1F2B
    .byte $F3 ; |XXXX  XX| $1F2C
    .byte $F0 ; |XXXX    | $1F2D
    .byte $F0 ; |XXXX    | $1F2E
    .byte $C3 ; |XX    XX| $1F2F
    .byte $F0 ; |XXXX    | $1F30
    .byte $F0 ; |XXXX    | $1F31
    .byte $F0 ; |XXXX    | $1F32
    .byte $81 ; |X      X| $1F33
    .byte $C3 ; |XX    XX| $1F34
    .byte $C0 ; |XX      | $1F35
    .byte $C0 ; |XX      | $1F36
    .byte $C3 ; |XX    XX| $1F37
    .byte $C0 ; |XX      | $1F38
    .byte $C0 ; |XX      | $1F39
    .byte $C0 ; |XX      | $1F3A
    .byte $81 ; |X      X| $1F3B
L1F3C:
    .byte $00 ; |        | $1F3C
    .byte $00 ; |        | $1F3D
    .byte $00 ; |        | $1F3E
    .byte $01 ; |       X| $1F3F
    .byte $08 ; |    X   | $1F40
    .byte $00 ; |        | $1F41
    .byte $00 ; |        | $1F42
    .byte $00 ; |        | $1F43
    .byte $00 ; |        | $1F44
    .byte $00 ; |        | $1F45
    .byte $00 ; |        | $1F46
L1F47:
    .byte $0F ; |    XXXX| $1F47
    .byte $0F ; |    XXXX| $1F48
    .byte $00 ; |        | $1F49
    .byte $00 ; |        | $1F4A
    .byte $00 ; |        | $1F4B
    .byte $00 ; |        | $1F4C
    .byte $00 ; |        | $1F4D
    .byte $00 ; |        | $1F4E
    .byte $00 ; |        | $1F4F
    .byte $00 ; |        | $1F50
    .byte $00 ; |        | $1F51
    .byte $00 ; |        | $1F52
    .byte $00 ; |        | $1F53
    .byte $00 ; |        | $1F54
    .byte $00 ; |        | $1F55
    .byte $00 ; |        | $1F56
    .byte $03 ; |      XX| $1F57
    .byte $07 ; |     XXX| $1F58
    .byte $0F ; |    XXXX| $1F59
    .byte $3F ; |  XXXXXX| $1F5A
    .byte $FF ; |XXXXXXXX| $1F5B
    .byte $FF ; |XXXXXXXX| $1F5C
    .byte $FF ; |XXXXXXXX| $1F5D
    .byte $FF ; |XXXXXXXX| $1F5E
    .byte $FF ; |XXXXXXXX| $1F5F
    .byte $FF ; |XXXXXXXX| $1F60
    .byte $FF ; |XXXXXXXX| $1F61
    .byte $FF ; |XXXXXXXX| $1F62
    .byte $FF ; |XXXXXXXX| $1F63
    .byte $FF ; |XXXXXXXX| $1F64
    .byte $FF ; |XXXXXXXX| $1F65
    .byte $FF ; |XXXXXXXX| $1F66
    .byte $00 ; |        | $1F67
L1F68:
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
    .byte $00 ; |        | $1F76
    .byte $01 ; |       X| $1F77
    .byte $1F ; |   XXXXX| $1F78
    .byte $FF ; |XXXXXXXX| $1F79
    .byte $FF ; |XXXXXXXX| $1F7A
    .byte $7F ; | XXXXXXX| $1F7B
    .byte $3F ; |  XXXXXX| $1F7C
    .byte $1F ; |   XXXXX| $1F7D
    .byte $0F ; |    XXXX| $1F7E
    .byte $07 ; |     XXX| $1F7F
    .byte $03 ; |      XX| $1F80
    .byte $03 ; |      XX| $1F81
    .byte $81 ; |X      X| $1F82
L1F83:
    .byte $41 ; | X     X| $1F83
    .byte $21 ; |  X    X| $1F84
    .byte $11 ; |   X   X| $1F85
    .byte $01 ; |       X| $1F86
    .byte $00 ; |        | $1F87
    .byte $00 ; |        | $1F88
    .byte $00 ; |        | $1F89
L1F8A:
    .byte $00 ; |        | $1F8A
    .byte $00 ; |        | $1F8B
    .byte $00 ; |        | $1F8C
    .byte $00 ; |        | $1F8D
    .byte $00 ; |        | $1F8E
    .byte $00 ; |        | $1F8F
    .byte $00 ; |        | $1F90
    .byte $00 ; |        | $1F91
    .byte $00 ; |        | $1F92
    .byte $00 ; |        | $1F93
    .byte $00 ; |        | $1F94
    .byte $F0 ; |XXXX    | $1F95
    .byte $FF ; |XXXXXXXX| $1F96
    .byte $FF ; |XXXXXXXX| $1F97
L1F98:
    .byte $FF ; |XXXXXXXX| $1F98
    .byte $FF ; |XXXXXXXX| $1F99
    .byte $FF ; |XXXXXXXX| $1F9A
    .byte $FF ; |XXXXXXXX| $1F9B
    .byte $FF ; |XXXXXXXX| $1F9C
    .byte $FF ; |XXXXXXXX| $1F9D
    .byte $FF ; |XXXXXXXX| $1F9E
    .byte $FF ; |XXXXXXXX| $1F9F
    .byte $FF ; |XXXXXXXX| $1FA0
    .byte $0F ; |    XXXX| $1FA1
    .byte $00 ; |        | $1FA2
    .byte $00 ; |        | $1FA3
L1FA4:
    .byte $00 ; |        | $1FA4
    .byte $00 ; |        | $1FA5
    .byte $00 ; |        | $1FA6
    .byte $00 ; |        | $1FA7
    .byte $00 ; |        | $1FA8
    .byte $00 ; |        | $1FA9
    .byte $00 ; |        | $1FAA
    .byte $00 ; |        | $1FAB
    .byte $00 ; |        | $1FAC
    .byte $00 ; |        | $1FAD
    .byte $00 ; |        | $1FAE
    .byte $00 ; |        | $1FAF
    .byte $00 ; |        | $1FB0
    .byte $3E ; |  XXXXX | $1FB1
    .byte $7F ; | XXXXXXX| $1FB2
    .byte $FF ; |XXXXXXXX| $1FB3
    .byte $FF ; |XXXXXXXX| $1FB4
    .byte $FF ; |XXXXXXXX| $1FB5
    .byte $FF ; |XXXXXXXX| $1FB6
    .byte $FF ; |XXXXXXXX| $1FB7
    .byte $FF ; |XXXXXXXX| $1FB8
    .byte $C1 ; |XX     X| $1FB9
    .byte $BE ; |X XXXXX | $1FBA
L1FBB:
    .byte $7F ; | XXXXXXX| $1FBB
    .byte $FF ; |XXXXXXXX| $1FBC
    .byte $FF ; |XXXXXXXX| $1FBD
    .byte $FF ; |XXXXXXXX| $1FBE
    .byte $FF ; |XXXXXXXX| $1FBF
    .byte $FF ; |XXXXXXXX| $1FC0
    .byte $FF ; |XXXXXXXX| $1FC1
    .byte $FF ; |XXXXXXXX| $1FC2

L1FC3:
    jmp    L1114                 ; 3
L1FC6:
    jmp    L11D0                 ; 3
L1FC9:
    jmp    L1028                 ; 3
    .byte $02 ; |      X | $1FCC
    .byte $00 ; |        | $1FCD
    jmp    L1C4D                 ; 3
    jmp    L1AD3                 ; 3
    jmp    L1872                 ; 3
    .byte $01 ; |       X| $1FD7
L1FD8:
    lda    #4                    ; 2
    lda    L1FF9                 ; 4
L1FDD:
    dex                          ; 2
    beq    L1FE6                 ; 2³
    dex                          ; 2
    beq    L1FE9                 ; 2³
    jmp    L1000                 ; 3
L1FE6:
    jmp    L1035                 ; 3
L1FE9:
    jmp    L1222                 ; 3
    dex                          ; 2
    bmi    L1FC3                 ; 2³
    beq    L1FC6                 ; 2³
    dex                          ; 2
    beq    L1FC9                 ; 2³
    bne    L1FDD                 ; 3   always branch

    .byte $00 ; |        | $1FF6
    .byte $F0 ; |XXXX    | $1FF7

      RORG $FFF8
    .byte $FE ; |XXXXXXX | $1FF8
L1FF9:
    .byte $FE ; |XXXXXXX | $1FF9
    .byte $01 ; |       X| $1FFA
    .byte $01 ; |       X| $1FFB

    .word START   ; first bank
    .word L1000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      2ND BANK
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $2000
      RORG $F000

LF000:
    jsr    LFC3F                 ; 6
    lda    #0                    ; 2
    sta    $DE                   ; 3
    sta    $E2                   ; 3
    sta    $E3                   ; 3
    sta    $E5                   ; 3
    sta    $EA                   ; 3
    sta    $CF                   ; 3
    sta    $E4                   ; 3
    ldx    #$0B                  ; 2
    stx    $CE                   ; 3
    jsr    LFD01                 ; 6
    lda    #$F9                  ; 2
    sta    $D6                   ; 3
    lda    #4                    ; 2
    sta    AUDC0                 ; 3
    lda    #$0C                  ; 2
    sta    AUDC1                 ; 3
    lda    #1                    ; 2
    sta    $E0                   ; 3
    sta    $E1                   ; 3
    sta    CTRLPF                ; 3
    lda    #$C8                  ; 2
    sta    $D3                   ; 3
    sta    $D4                   ; 3
    lda    #$0C                  ; 2
    sta    $C9                   ; 3
    ldx    #8                    ; 2
    stx    $D0                   ; 3
    lda    $DB                   ; 3
    cmp    #$15                  ; 2
    bcc    LF051                 ; 2³
LF042:
    jsr    LFCF2                 ; 6
    sta    $AA,X                 ; 4
    lda    #$FE                  ; 2   High nybble
    sta    $AB,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LF042                 ; 2³
    bmi    LF05E                 ; 3   always branch

LF051:
    jsr    LFDD3                 ; 6
    sta    $AA,X                 ; 4
    lda    #$FD                  ; 2   High nybble
    sta    $AB,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LF051                 ; 2³
LF05E:
    ldx    INTIM                 ; 4
    bne    LF05E                 ; 2³
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    VSYNC                 ; 3
    lda    #$31                  ; 2
    sta    TIM64T                ; 4
    ldx    $DE                   ; 3
    beq    LF080                 ; 2³
    cpx    #2                    ; 2
    bne    LF08A                 ; 2³
LF080:
    jsr    LFC27                 ; 6
    beq    LF08A                 ; 2³
    jsr    LFD01                 ; 6
    inc    $DE                   ; 5
LF08A:
    ldx    $DE                   ; 3
    beq    LF093                 ; 2³
    dex                          ; 2
    beq    LF0B9                 ; 2³
    bne    LF0B0                 ; 3   always branch

LF093:
    ldy    $DB                   ; 3
    cpy    #$2F                  ; 2
    bcc    LF0B0                 ; 2³
    lda    SWCHB                 ; 4   check difficulty for P0 (player one)
    and    #$40                  ; 2
    beq    LF0B0                 ; 2³  - amateur
    ldx    #2                    ; 2   - pro
LF0A2:
    lda    LF7F3,Y               ; 4
    beq    LF0B0                 ; 2³
    sta    $84,X                 ; 4
    iny                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #$0A                  ; 2
    bne    LF0A2                 ; 2³
LF0B0:
    jmp    LF1D4                 ; 3

LF0B3:
    lda    #0                    ; 2
    sta    $9A                   ; 3
    beq    LF0D8                 ; 3   always branch

LF0B9:
    dec    $CE                   ; 5
    bne    LF108                 ; 2³+1
    dec    $D0                   ; 5
    bne    LF0D8                 ; 2³
    lda    #6                    ; 2
    sta    $D0                   ; 3
    lda    $9A                   ; 3
    bne    LF0B3                 ; 2³
    ldx    $DB                   ; 3
    lda    LF7F3,X               ; 4
    ldx    #8                    ; 2
LF0D0:
    cmp    $AA,X                 ; 4
    beq    LF0E6                 ; 2³
    dex                          ; 2
    dex                          ; 2
    bpl    LF0D0                 ; 2³
LF0D8:
    jsr    LFF8A                 ; 6
    cmp    #$A0                  ; 2
    bcs    LF0D8                 ; 2³
    and    #$E0                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
LF0E6:
    lda    $AA,X                 ; 4
    beq    LF0D8                 ; 2³
    sta    $D9                   ; 3
    lda    $AB,X                 ; 4
    sta    $DA                   ; 3
    lda    #<Letters             ; 2
    sta    $AA,X                 ; 4
    lda    #>Letters             ; 2
    sta    $AB,X                 ; 4
    stx    $DC                   ; 3
    lda    LFF70,X               ; 4
    sta    $CB                   ; 3
    lda    LFF71,X               ; 4
    sta    $D4                   ; 3
    lda    #$5A                  ; 2
    sta    $CE                   ; 3
LF108:
    lda    $D4                   ; 3
    cmp    #$C8                  ; 2
    beq    LF126                 ; 2³
    dec    $D4                   ; 5
    cmp    #$64                  ; 2
    bne    LF126                 ; 2³
    sta    $D3                   ; 3
    lda    $CB                   ; 3
    sta    $CA                   ; 3
    lda    $DA                   ; 3
    sta    $D8                   ; 3
    lda    $D9                   ; 3
    sta    $D7                   ; 3
    lda    $DC                   ; 3
    sta    $DF                   ; 3
LF126:
    lda    $D3                   ; 3
    cmp    #$C8                  ; 2
    bne    LF12F                 ; 2³
LF12C:
    jmp    LF1D4                 ; 3

LF12F:
    dec    $D3                   ; 5
    cmp    #$56                  ; 2
    bne    LF139                 ; 2³
    ldx    #1                    ; 2
    stx    $99                   ; 3
LF139:
    cmp    #$2A                  ; 2
    bcs    LF12C                 ; 2³
    lda    #$C8                  ; 2
    sta    $D3                   ; 3
    lda    #0                    ; 2
    sta    $99                   ; 3
    lda    $CC                   ; 3
    clc                          ; 2
    adc    #6                    ; 2
    sbc    $CA                   ; 3
    bcc    LF19F                 ; 2³
    cmp    #$27                  ; 2
    bcs    LF19F                 ; 2³
    ldy    #0                    ; 2
    ldx    $DB                   ; 3
    lda    LF7F3,X               ; 4
    cmp    $D7                   ; 3
    bne    LF197                 ; 2³
    lda    $DE                   ; 3
    cmp    #1                    ; 2
    bne    LF197                 ; 2³
    ldx    $DB                   ; 3
    cpx    #$2F                  ; 2
    bcc    LF181                 ; 2³
    lda    LF7F3,X               ; 4
    ldx    $CF                   ; 3
    inx                          ; 2
    inx                          ; 2
    stx    $CF                   ; 3
    sta    $84,X                 ; 4
    cpx    #8                    ; 2
    bcs    LF181                 ; 2³
    inc    $DB                   ; 5
    ldx    $DB                   ; 3
    lda    LF7F3,X               ; 4
    bne    LF191                 ; 2³   always branch?

LF181:
    lda    $EA                   ; 3
    bne    LF18A                 ; 2³
    inc    $C2                   ; 5
    jsr    LFD60                 ; 6
LF18A:
    lda    #2                    ; 2
    sta    $DE                   ; 3
    jsr    LFC3F                 ; 6
LF191:
    ldy    #1                    ; 2
    sty    $E7                   ; 3
    bne    LF1A3                 ; 3   always branch

LF197:
    sty    $E7                   ; 3
    inc    $EA                   ; 5
    lda    #$1E                  ; 2
    bne    LF1A5                 ; 3   always branch

LF19F:
    lda    #2                    ; 2
    sta    $E7                   ; 3
LF1A3:
    lda    #$0F                  ; 2
LF1A5:
    sta    $E8                   ; 3
    lda    $9A                   ; 3
    bne    LF1BC                 ; 2³
    lda    $D0                   ; 3
    cmp    #4                    ; 2
    bne    LF1BC                 ; 2³
    ldx    $DB                   ; 3
    lda    LF7F3,X               ; 4
    cpx    #$15                  ; 2
    bcc    LF1CC                 ; 2³
    bcs    LF1C5                 ; 3   always branch

LF1BC:
    lda    $DB                   ; 3
    cmp    #$15                  ; 2
    bcc    LF1C9                 ; 2³
    jsr    LFCF2                 ; 6
LF1C5:
    ldy    #$FE                  ; 2   high nybble
    bne    LF1CE                 ; 3   always branch

LF1C9:
    jsr    LFDD3                 ; 6
LF1CC:
    ldy    #$FD                  ; 2   high nybble
LF1CE:
    ldx    $DF                   ; 3
    sty    $AB,X                 ; 4
    sta    $AA,X                 ; 4
LF1D4:
    lda    $DE                   ; 3
    cmp    #3                    ; 2
    bcs    LF1F3                 ; 2³
    ldx    #0                    ; 2
    lda    SWCHA                 ; 4   check Joy1 right
    bmi    LF1E4                 ; 2³  - not pressed
    inx                          ; 2   - pressed
    bne    LF1E7                 ; 3   always branch

LF1E4:
    asl                          ; 2   check Joy1 left
    bmi    LF1E9                 ; 2³  - not pressed
LF1E7:
    stx    $E4                   ; 3   0 - Joy1 left pressed, 1 - Joy1 right pressed
LF1E9:
    lda    $E4                   ; 3
    beq    LF1F1                 ; 2³
    inc    $C9                   ; 5
    bne    LF1F3                 ; 2³
LF1F1:
    dec    $C9                   ; 5
LF1F3:
    lda    $C9                   ; 3
    cmp    #$0C                  ; 2
    bcs    LF1FD                 ; 2³
    lda    #$0C                  ; 2
    bne    LF203                 ; 3+1   always branch

LF1FD:
    cmp    #$F7                  ; 2
    bcc    LF203                 ; 2³
    lda    #$F6                  ; 2
LF203:
    sta    $C9                   ; 3
    clc                          ; 2
    adc    #2                    ; 2
    sta    $CC                   ; 3
    adc    #2                    ; 2
    sta    $CD                   ; 3
    lda    $C9                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sec                          ; 2
LF213:
    sbc    #3                    ; 2
    bcs    LF213                 ; 2³
    adc    #3                    ; 2
    asl                          ; 2
    tay                          ; 2
    lda    LFFAE,Y               ; 4
    sta    $D5                   ; 3
    ldx    #4                    ; 2
LF222:
    lda    $C9,X                 ; 4
    jsr    LF63A                 ; 6
    sta    $EB,X                 ; 4
    dex                          ; 2
    bpl    LF222                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$FF                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    $EF                   ; 3
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
LF23D:
    dey                          ; 2
    bpl    LF23D                 ; 2³
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$D8                  ; 2
    sta    COLUPF                ; 3
    ldx    $DB                   ; 3
    cpx    #$2F                  ; 2
    bcc    LF252                 ; 2³
    lda    #$34                  ; 2
LF252:
    sta    COLUBK                ; 3
LF254:
    lda    INTIM                 ; 4
    bne    LF254                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    $96                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$13                  ; 2
    sta    HMCLR                 ; 3
    ldy    #7                    ; 2
    sta    HMP1                  ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sty    VDELP0                ; 3
    sty    VDELP1                ; 3
    ldx    #1                    ; 2
LF273:
    dex                          ; 2
    bpl    LF273                 ; 2³
    lda    $AA,X                 ; 4
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$0E                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$0F                  ; 2
    sta    PF2                   ; 3
LF28A:
    sty    $F1                   ; 3
    lda    ($8E),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    $D1                   ; 3
    lda    ($84),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($86),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($88),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($8C),Y               ; 5
    tax                          ; 2
    lda    ($8A),Y               ; 5
    ldy    $D1                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    ldy    $F1                   ; 3
    dey                          ; 2
    bpl    LF28A                 ; 2³
    iny                          ; 2
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sty    VDELP0                ; 3
    sty    VDELP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #4                    ; 2
LF2BF:
    dey                          ; 2
    bpl    LF2BF                 ; 2³
    sta    RESP0                 ; 3
    lda    #$C0                  ; 2
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    lda    #$FF                  ; 2
    sta    PF2                   ; 3
    lda    #$D4                  ; 2
    sta    COLUBK                ; 3
    lda    $ED                   ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
LF2DA:
    dey                          ; 2
    bpl    LF2DA                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    ldy    #7                    ; 2
LF2E9:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($AA),Y               ; 5
    sta    GRP0                  ; 3
    ldx    #2                    ; 2
LF2F1:
    dex                          ; 2
    bpl    LF2F1                 ; 2³
    nop                          ; 2
    lda    ($AC),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($AE),Y               ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    LF2E9                 ; 2³
    lda    #2                    ; 2
    sta    RESP0                 ; 3
    sta    NUSIZ0                ; 3
    lda    #0                    ; 2
    sta    NUSIZ1                ; 3
    sta    GRP0                  ; 3
    ldy    #7                    ; 2
LF30E:
    sty    $D1                   ; 3
    tya                          ; 2
    clc                          ; 2
    adc    #$A3                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sbc    $D4                   ; 3
    tay                          ; 2
    and    #$F8                  ; 2
    beq    LF321                 ; 2³
    lda    #0                    ; 2
    beq    LF323                 ; 3   always branch

LF321:
    lda    ($D9),Y               ; 5
LF323:
    sta    GRP1                  ; 3
    ldy    $D1                   ; 3
    lda    ($B0),Y               ; 5
    sta    GRP0                  ; 3
    lda    LF9F9,Y               ; 4
    sta    PF0                   ; 3
    lda    LFA61,Y               ; 4
    sta    PF1                   ; 3
    lda    LFAC9,Y               ; 4
    sta    PF2                   ; 3
    lda    ($B2),Y               ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    LF30E                 ; 2³
    lda    #0                    ; 2
    sta    NUSIZ1                ; 3
    sta    GRP0                  ; 3
    sta    HMCLR                 ; 3
    lda    #$A1                  ; 2
    sec                          ; 2
    sbc    $D4                   ; 3
    tay                          ; 2
    and    #$F8                  ; 2
    beq    LF357                 ; 2³
    lda    #0                    ; 2
    beq    LF359                 ; 3   always branch

LF357:
    lda    ($D9),Y               ; 5
LF359:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    $D1                   ; 3
    lda    $D1                   ; 3
    lda    $EB                   ; 3
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
LF368:
    dex                          ; 2
    bpl    LF368                 ; 2³
    sta    RESP0                 ; 3
    lda    #$A0                  ; 2
    sec                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sbc    $D4                   ; 3
    tay                          ; 2
    and    #$F8                  ; 2
    beq    LF37F                 ; 2³
    lda    #0                    ; 2
    beq    LF381                 ; 3   always branch

LF37F:
    lda    ($D9),Y               ; 5
LF381:
    sta    GRP1                  ; 3
    ldx    #7                    ; 2
LF385:
    txa                          ; 2
    clc                          ; 2
    adc    #$99                  ; 2
    sbc    $D4                   ; 3
    tay                          ; 2
    and    #$F8                  ; 2
    beq    LF394                 ; 2³
    lda    #0                    ; 2
    beq    LF396                 ; 3   always branch

LF394:
    lda    ($D9),Y               ; 5
LF396:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    LFF30,X               ; 4
    sta    COLUBK                ; 3
    lda    LF9F3,X               ; 4
    sta    PF0                   ; 3
    lda    LFA5B,X               ; 4
    sta    PF1                   ; 3
    lda    LFAC3,X               ; 4
    sta    PF2                   ; 3
    dex                          ; 2
    bpl    LF385                 ; 2³
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    lda    #$14                  ; 2
    sta    COLUPF                ; 3
    ldx    #$37                  ; 2
LF3BB:
    txa                          ; 2
    clc                          ; 2
    adc    #$61                  ; 2
    sbc    $D4                   ; 3
    tay                          ; 2
    and    #$F8                  ; 2
    beq    LF3CA                 ; 2³
    lda    #0                    ; 2
    beq    LF3CC                 ; 3   always branch

LF3CA:
    lda    ($D9),Y               ; 5
LF3CC:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    LFEF8,X               ; 4
    sta    COLUBK                ; 3
    lda    LF9BB,X               ; 4
    sta    PF0                   ; 3
    lda    LFA23,X               ; 4
    sta    PF1                   ; 3
    lda    LFA8B,X               ; 4
    sta    PF2                   ; 3
    dex                          ; 2
    bpl    LF3BB                 ; 2³
    sta    HMCLR                 ; 3
    lda    $99                   ; 3
    beq    LF42D                 ; 2³+1
    lda    #$5F                  ; 2
    sec                          ; 2
    sbc    $D3                   ; 3
    tay                          ; 2
    and    #$F8                  ; 2
    beq    LF3FB                 ; 2³
    lda    #0                    ; 2
    beq    LF3FD                 ; 3   always branch

LF3FB:
    lda    ($D7),Y               ; 5
LF3FD:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    0,X                   ; 4
    lda    #0                    ; 2
    sta    $96                   ; 3
    lda    $EC                   ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
LF40E:
    dey                          ; 2
    bpl    LF40E                 ; 2³
    sta    RESP1                 ; 3
    lda    #$5E                  ; 2
    sec                          ; 2
    sbc    $D3                   ; 3
    tay                          ; 2
    and    #$F8                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    beq    LF425                 ; 2³
    lda    #0                    ; 2
    beq    LF427                 ; 3   always branch

LF425:
    lda    ($D7),Y               ; 5
LF427:
    sta    GRP1                  ; 3
    ldx    #$1D                  ; 2
    bne    LF42F                 ; 3   always branch

LF42D:
    ldx    #$1F                  ; 2
LF42F:
    txa                          ; 2
    clc                          ; 2
    adc    #$41                  ; 2
    sbc    $D3                   ; 3
    tay                          ; 2
    and    #$F8                  ; 2
    beq    LF43E                 ; 2³
    lda    #0                    ; 2
    beq    LF440                 ; 3   always branch

LF43E:
    lda    ($D7),Y               ; 5
LF440:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    LFED8,X               ; 4
    sta    COLUBK                ; 3
    lda    LF99B,X               ; 4
    sta    PF0                   ; 3
    lda    LFA03,X               ; 4
    sta    PF1                   ; 3
    lda    LFA6B,X               ; 4
    sta    PF2                   ; 3
    dex                          ; 2
    bpl    LF42F                 ; 2³
    sta    HMCLR                 ; 3
    lda    #$30                  ; 2
    sta    HMBL                  ; 3
    sta    PF0                   ; 3
    lda    #$F8                  ; 2
    sta    COLUP0                ; 3
    lda    #$12                  ; 2
    sta    COLUPF                ; 3
    ldx    #$0B                  ; 2
LF46D:
    txa                          ; 2
    clc                          ; 2
    adc    #$35                  ; 2
    sbc    $D3                   ; 3
    tay                          ; 2
    and    #$F8                  ; 2
    beq    LF47C                 ; 2³
    lda    #0                    ; 2
    beq    LF47E                 ; 3   always branch

LF47C:
    lda    ($D7),Y               ; 5
LF47E:
    cpx    #4                    ; 2
    bne    LF488                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    beq    LF48A                 ; 3   always branch

LF488:
    sta    WSYNC                 ; 3
;---------------------------------------
LF48A:
    sta    GRP1                  ; 3
    lda    LF955,X               ; 4
    sta    GRP0                  ; 3
    lda    $96                   ; 3
    sta    ENABL                 ; 3
    cpx    #6                    ; 2
    beq    LF49D                 ; 2³
    cpx    #4                    ; 2
    bne    LF49F                 ; 2³
LF49D:
    stx    $96                   ; 3
LF49F:
    dex                          ; 2
    bne    LF46D                 ; 2³
    sta    HMCLR                 ; 3
    lda    #$70                  ; 2
    sta    PF0                   ; 3
    lda    #$34                  ; 2
    sec                          ; 2
    sbc    $D3                   ; 3
    tay                          ; 2
    and    #$F8                  ; 2
    beq    LF4B6                 ; 2³
    lda    #0                    ; 2
    beq    LF4B8                 ; 3   always branch

LF4B6:
    lda    ($D7),Y               ; 5
LF4B8:
    ldy    #$14                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    ($D5),Y               ; 5
    sta    GRP0                  ; 3
    lda    $EE                   ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
LF4C9:
    dex                          ; 2
    bpl    LF4C9                 ; 2³
    sta    RESP1                 ; 3
    lda    #0                    ; 2
    sec                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP1                  ; 3
    ldy    #$13                  ; 2
    lda    ($D5),Y               ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    lda    #$36                  ; 2
    sta    COLUP1                ; 3
    lda    #0                    ; 2
    sta    PF0                   ; 3
LF4E6:
    lda    ($D5),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    LF92D,Y               ; 4
    sta    GRP1                  ; 3
    lda    LF90C,Y               ; 4
    sta    COLUP0                ; 3
    dey                          ; 2
    bpl    LF4E6                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    nop                          ; 2
    lda    #0                    ; 2
    sta    HMP0                  ; 3
    lda    #$80                  ; 2
    sta    HMP1                  ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    #1                    ; 2
    jsr    LF650                 ; 6
    ldx    #$13                  ; 2
    jsr    LF669                 ; 6
    ldx    #3                    ; 2
    jsr    LF650                 ; 6
    ldx    #$0A                  ; 2
    jsr    LF669                 ; 6
    ldx    #5                    ; 2
    jsr    LF650                 ; 6
    ldx    #$0A                  ; 2
    jsr    LF669                 ; 6
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$17                  ; 2
    sta    TIM64T                ; 4
    ldx    #2                    ; 2
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    VBLANK                ; 3
    lda    $DE                   ; 3
    cmp    #1                    ; 2
    beq    LF558                 ; 2³
    cmp    #2                    ; 2
    bne    LF550                 ; 2³
    lda    $E8                   ; 3
    beq    LF550                 ; 2³
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    beq    LF580                 ; 3   always branch

LF550:
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    beq    LF5AF                 ; 3   always branch

LF558:
    dec    $E0                   ; 5
    bne    LF580                 ; 2³
    ldx    $E2                   ; 3
    lda    LF6AB,X               ; 4
    cmp    #$FF                  ; 2
    bne    LF56A                 ; 2³
    lda    #0                    ; 2
    sta    $E2                   ; 3
    tax                          ; 2
LF56A:
    lda    LF6AD,X               ; 4
    sta    $E0                   ; 3
    lda    $E2                   ; 3
    clc                          ; 2
    adc    #3                    ; 2
    sta    $E2                   ; 3
    lda    LF6AB,X               ; 4
    sta    AUDF0                 ; 3
    lda    LF6AC,X               ; 4
    sta    AUDV0                 ; 3
LF580:
    dec    $E1                   ; 5
    bne    LF5AC                 ; 2³
LF584:
    ldx    $E3                   ; 3
    ldy    LF75A,X               ; 4
    cpy    #$FF                  ; 2
    bne    LF592                 ; 2³
    lda    #0                    ; 2
    sta    $E3                   ; 3
    tax                          ; 2
LF592:
    lda    LF75C,X               ; 4
    sta    $E1                   ; 3
    inc    $E5                   ; 5
    lda    $E5                   ; 3
    cmp    #2                    ; 2
    bne    LF5AC                 ; 2³
    lda    $E3                   ; 3
    clc                          ; 2
    adc    #3                    ; 2
    sta    $E3                   ; 3
    lda    #0                    ; 2
    sta    $E5                   ; 3
    beq    LF584                 ; 3   always branch

LF5AC:
    jsr    LF5D6                 ; 6
LF5AF:
    lda    $DE                   ; 3
    cmp    #3                    ; 2
    bcc    LF5D3                 ; 2³
    lda    $C9                   ; 3
    cmp    #$F4                  ; 2
    bcc    LF5D1                 ; 2³
    inc    $DB                   ; 5
    lda    #0                    ; 2
    sta    $9D                   ; 3
    sta    $E8                   ; 3
    sta    $E5                   ; 3
    sta    $B8                   ; 3
    sta    $93                   ; 3
    jsr    LFC3F                 ; 6
    ldx    #3                    ; 2
    jmp    LFFE7                 ; 3

LF5D1:
    inc    $C9                   ; 5
LF5D3:
    jmp    LF05E                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF5D6 SUBROUTINE
    lda    $E8                   ; 3
    beq    LF618                 ; 2³+1
    dec    $E8                   ; 5
    bne    LF5E8                 ; 2³
LF5DE:
    lda    #$0C                  ; 2
    sta    AUDC1                 ; 3
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
    beq    LF639                 ; 3+1   always branch

LF5E8:
    ldx    $E7                   ; 3
    bne    LF5F6                 ; 2³
    lda    #$1C                  ; 2
    sta    AUDF1                 ; 3
    lda    #1                    ; 2
    sta    AUDC1                 ; 3
    bne    LF5FF                 ; 3   always branch

LF5F6:
    dex                          ; 2
    bne    LF605                 ; 2³+1
    lda    $E8                   ; 3
    adc    #1                    ; 2
    sta    AUDF1                 ; 3
LF5FF:
    lda    #$0F                  ; 2
    sta    AUDV1                 ; 3
    bne    LF639                 ; 3   always branch

LF605:
    cmp    #$0A                  ; 2
    bcc    LF5DE                 ; 2³+1
    sta    AUDV1                 ; 3
    dex                          ; 2
    bne    LF610                 ; 2³
    adc    #$0F                  ; 2
LF610:
    sta    AUDF1                 ; 3
    lda    #4                    ; 2
    sta    AUDC1                 ; 3
    bne    LF639                 ; 3   always branch

LF618:
    lda    $E5                   ; 3
    bne    LF620                 ; 2³
    lda    $BB                   ; 3
    beq    LF639                 ; 2³
LF620:
    ldx    $E3                   ; 3
    lda    LF75A,X               ; 4
    sta    AUDF1                 ; 3
    lda    LF75B,X               ; 4
    sta    AUDV1                 ; 3
    lda    #0                    ; 2
    sta    $BB                   ; 3
    sta    $E5                   ; 3
    lda    $E3                   ; 3
    clc                          ; 2
    adc    #3                    ; 2
    sta    $E3                   ; 3
LF639:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF63A SUBROUTINE
    lsr                          ; 2
    ldy    #$FF                  ; 2
    sec                          ; 2
LF63E:
    iny                          ; 2
    sbc    #$0F                  ; 2
    bcs    LF63E                 ; 2³
    sty    $D1                   ; 3
    eor    #$FF                  ; 2
    adc    #9                    ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    $D1                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF650 SUBROUTINE
    lda    #$FF                  ; 2
    sta    $96                   ; 3
    sta    frameCounter          ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $C2,X                 ; 4
    sta    NUSIZ0                ; 3
    bpl    LF660                 ; 2³
    inc    $96                   ; 5
LF660:
    lda    $C3,X                 ; 4
    sta    NUSIZ1                ; 3
    bpl    LF668                 ; 2³
    inc    frameCounter          ; 5
LF668:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF669 SUBROUTINE
    ldy    #$0A                  ; 2
LF66B:
    lda    LF684,X               ; 4
    and    $96                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    and    frameCounter          ; 3
    sta    GRP1                  ; 3
    lda    LF697,X               ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    dex                          ; 2
    dey                          ; 2
    bpl    LF66B                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF684:
    .byte $00 ; |        | $F684
    .byte $7E ; | XXXXXX | $F685
    .byte $7E ; | XXXXXX | $F686
    .byte $7A ; | XXXX X | $F687
    .byte $7A ; | XXXX X | $F688
    .byte $3C ; |  XXXX  | $F689
    .byte $3C ; |  XXXX  | $F68A
    .byte $3C ; |  XXXX  | $F68B
    .byte $18 ; |   XX   | $F68C
    .byte $00 ; |        | $F68D
    .byte $00 ; |        | $F68E
    .byte $3C ; |  XXXX  | $F68F
    .byte $7E ; | XXXXXX | $F690
    .byte $7E ; | XXXXXX | $F691
    .byte $7E ; | XXXXXX | $F692
    .byte $3C ; |  XXXX  | $F693
    .byte $3C ; |  XXXX  | $F694
    .byte $7E ; | XXXXXX | $F695
    .byte $3C ; |  XXXX  | $F696
LF697:
    .byte $00 ; |        | $F697
    .byte $F4 ; |XXXX X  | $F698
    .byte $F4 ; |XXXX X  | $F699
    .byte $F6 ; |XXXX XX | $F69A
    .byte $F6 ; |XXXX XX | $F69B
    .byte $F6 ; |XXXX XX | $F69C
    .byte $F6 ; |XXXX XX | $F69D
    .byte $F6 ; |XXXX XX | $F69E
    .byte $F6 ; |XXXX XX | $F69F
    .byte $00 ; |        | $F6A0
    .byte $00 ; |        | $F6A1
    .byte $2C ; |  X XX  | $F6A2
    .byte $3A ; |  XXX X | $F6A3
    .byte $3A ; |  XXX X | $F6A4
    .byte $3A ; |  XXX X | $F6A5
    .byte $2C ; |  X XX  | $F6A6
    .byte $2C ; |  X XX  | $F6A7
    .byte $3A ; |  XXX X | $F6A8
    .byte $1C ; |   XXX  | $F6A9
    .byte $00 ; |        | $F6AA
LF6AB:
    .byte $17 ; |   X XXX| $F6AB
LF6AC:
    .byte $09 ; |    X  X| $F6AC
LF6AD:
    .byte $09 ; |    X  X| $F6AD
    .byte $00 ; |        | $F6AE
    .byte $00 ; |        | $F6AF
    .byte $09 ; |    X  X| $F6B0
    .byte $13 ; |   X  XX| $F6B1
    .byte $09 ; |    X  X| $F6B2
    .byte $12 ; |   X  X | $F6B3
    .byte $13 ; |   X  XX| $F6B4
    .byte $07 ; |     XXX| $F6B5
    .byte $09 ; |    X  X| $F6B6
    .byte $00 ; |        | $F6B7
    .byte $00 ; |        | $F6B8
    .byte $09 ; |    X  X| $F6B9
    .byte $0E ; |    XXX | $F6BA
    .byte $09 ; |    X  X| $F6BB
    .byte $09 ; |    X  X| $F6BC
    .byte $00 ; |        | $F6BD
    .byte $00 ; |        | $F6BE
    .byte $09 ; |    X  X| $F6BF
    .byte $11 ; |   X   X| $F6C0
    .byte $09 ; |    X  X| $F6C1
    .byte $09 ; |    X  X| $F6C2
    .byte $11 ; |   X   X| $F6C3
    .byte $08 ; |    X   | $F6C4
    .byte $09 ; |    X  X| $F6C5
    .byte $11 ; |   X   X| $F6C6
    .byte $06 ; |     XX | $F6C7
    .byte $09 ; |    X  X| $F6C8
    .byte $13 ; |   X  XX| $F6C9
    .byte $09 ; |    X  X| $F6CA
    .byte $09 ; |    X  X| $F6CB
    .byte $13 ; |   X  XX| $F6CC
    .byte $08 ; |    X   | $F6CD
    .byte $09 ; |    X  X| $F6CE
    .byte $13 ; |   X  XX| $F6CF
    .byte $06 ; |     XX | $F6D0
    .byte $09 ; |    X  X| $F6D1
    .byte $17 ; |   X XXX| $F6D2
    .byte $09 ; |    X  X| $F6D3
    .byte $12 ; |   X  X | $F6D4
    .byte $00 ; |        | $F6D5
    .byte $00 ; |        | $F6D6
    .byte $12 ; |   X  X | $F6D7
    .byte $11 ; |   X   X| $F6D8
    .byte $09 ; |    X  X| $F6D9
    .byte $09 ; |    X  X| $F6DA
    .byte $13 ; |   X  XX| $F6DB
    .byte $09 ; |    X  X| $F6DC
    .byte $09 ; |    X  X| $F6DD
    .byte $13 ; |   X  XX| $F6DE
    .byte $08 ; |    X   | $F6DF
    .byte $09 ; |    X  X| $F6E0
    .byte $13 ; |   X  XX| $F6E1
    .byte $06 ; |     XX | $F6E2
    .byte $09 ; |    X  X| $F6E3
    .byte $17 ; |   X XXX| $F6E4
    .byte $09 ; |    X  X| $F6E5
    .byte $09 ; |    X  X| $F6E6
    .byte $00 ; |        | $F6E7
    .byte $00 ; |        | $F6E8
    .byte $09 ; |    X  X| $F6E9
    .byte $1A ; |   XX X | $F6EA
    .byte $09 ; |    X  X| $F6EB
    .byte $09 ; |    X  X| $F6EC
    .byte $1A ; |   XX X | $F6ED
    .byte $08 ; |    X   | $F6EE
    .byte $09 ; |    X  X| $F6EF
    .byte $1A ; |   XX X | $F6F0
    .byte $07 ; |     XXX| $F6F1
    .byte $09 ; |    X  X| $F6F2
    .byte $1A ; |   XX X | $F6F3
    .byte $06 ; |     XX | $F6F4
    .byte $09 ; |    X  X| $F6F5
    .byte $00 ; |        | $F6F6
    .byte $00 ; |        | $F6F7
    .byte $09 ; |    X  X| $F6F8
    .byte $13 ; |   X  XX| $F6F9
    .byte $09 ; |    X  X| $F6FA
    .byte $12 ; |   X  X | $F6FB
    .byte $00 ; |        | $F6FC
    .byte $00 ; |        | $F6FD
    .byte $09 ; |    X  X| $F6FE
    .byte $17 ; |   X XXX| $F6FF
    .byte $09 ; |    X  X| $F700
    .byte $09 ; |    X  X| $F701
    .byte $00 ; |        | $F702
    .byte $00 ; |        | $F703
    .byte $09 ; |    X  X| $F704
    .byte $13 ; |   X  XX| $F705
    .byte $09 ; |    X  X| $F706
    .byte $09 ; |    X  X| $F707
    .byte $13 ; |   X  XX| $F708
    .byte $08 ; |    X   | $F709
    .byte $09 ; |    X  X| $F70A
    .byte $13 ; |   X  XX| $F70B
    .byte $06 ; |     XX | $F70C
    .byte $09 ; |    X  X| $F70D
    .byte $00 ; |        | $F70E
    .byte $00 ; |        | $F70F
    .byte $09 ; |    X  X| $F710
    .byte $0E ; |    XXX | $F711
    .byte $09 ; |    X  X| $F712
    .byte $09 ; |    X  X| $F713
    .byte $00 ; |        | $F714
    .byte $00 ; |        | $F715
    .byte $09 ; |    X  X| $F716
    .byte $0F ; |    XXXX| $F717
    .byte $09 ; |    X  X| $F718
    .byte $09 ; |    X  X| $F719
    .byte $0F ; |    XXXX| $F71A
    .byte $08 ; |    X   | $F71B
    .byte $09 ; |    X  X| $F71C
    .byte $0F ; |    XXXX| $F71D
    .byte $06 ; |     XX | $F71E
    .byte $09 ; |    X  X| $F71F
    .byte $0E ; |    XXX | $F720
    .byte $09 ; |    X  X| $F721
    .byte $09 ; |    X  X| $F722
    .byte $0E ; |    XXX | $F723
    .byte $08 ; |    X   | $F724
    .byte $09 ; |    X  X| $F725
    .byte $0E ; |    XXX | $F726
    .byte $06 ; |     XX | $F727
    .byte $09 ; |    X  X| $F728
    .byte $11 ; |   X   X| $F729
    .byte $09 ; |    X  X| $F72A
    .byte $12 ; |   X  X | $F72B
    .byte $13 ; |   X  XX| $F72C
    .byte $09 ; |    X  X| $F72D
    .byte $09 ; |    X  X| $F72E
    .byte $00 ; |        | $F72F
    .byte $00 ; |        | $F730
    .byte $09 ; |    X  X| $F731
    .byte $0B ; |    X XX| $F732
    .byte $09 ; |    X  X| $F733
    .byte $09 ; |    X  X| $F734
    .byte $00 ; |        | $F735
    .byte $00 ; |        | $F736
    .byte $09 ; |    X  X| $F737
    .byte $0F ; |    XXXX| $F738
    .byte $09 ; |    X  X| $F739
    .byte $09 ; |    X  X| $F73A
    .byte $0F ; |    XXXX| $F73B
    .byte $08 ; |    X   | $F73C
    .byte $09 ; |    X  X| $F73D
    .byte $0F ; |    XXXX| $F73E
    .byte $06 ; |     XX | $F73F
    .byte $09 ; |    X  X| $F740
    .byte $0E ; |    XXX | $F741
    .byte $09 ; |    X  X| $F742
    .byte $12 ; |   X  X | $F743
    .byte $0E ; |    XXX | $F744
    .byte $08 ; |    X   | $F745
    .byte $09 ; |    X  X| $F746
    .byte $0E ; |    XXX | $F747
    .byte $07 ; |     XXX| $F748
    .byte $09 ; |    X  X| $F749
    .byte $0E ; |    XXX | $F74A
    .byte $06 ; |     XX | $F74B
    .byte $09 ; |    X  X| $F74C
    .byte $0E ; |    XXX | $F74D
    .byte $05 ; |     X X| $F74E
    .byte $09 ; |    X  X| $F74F
    .byte $0E ; |    XXX | $F750
    .byte $04 ; |     X  | $F751
    .byte $09 ; |    X  X| $F752
    .byte $0E ; |    XXX | $F753
    .byte $02 ; |      X | $F754
    .byte $09 ; |    X  X| $F755
    .byte $00 ; |        | $F756
    .byte $00 ; |        | $F757
    .byte $09 ; |    X  X| $F758
    .byte $FF ; |XXXXXXXX| $F759
LF75A:
    .byte $13 ; |   X  XX| $F75A
LF75B:
    .byte $09 ; |    X  X| $F75B
LF75C:
    .byte $09 ; |    X  X| $F75C
    .byte $13 ; |   X  XX| $F75D
    .byte $06 ; |     XX | $F75E
    .byte $09 ; |    X  X| $F75F
    .byte $00 ; |        | $F760
    .byte $00 ; |        | $F761
    .byte $12 ; |   X  X | $F762
    .byte $0F ; |    XXXX| $F763
    .byte $09 ; |    X  X| $F764
    .byte $09 ; |    X  X| $F765
    .byte $0F ; |    XXXX| $F766
    .byte $06 ; |     XX | $F767
    .byte $09 ; |    X  X| $F768
    .byte $00 ; |        | $F769
    .byte $00 ; |        | $F76A
    .byte $12 ; |   X  X | $F76B
    .byte $0E ; |    XXX | $F76C
    .byte $09 ; |    X  X| $F76D
    .byte $09 ; |    X  X| $F76E
    .byte $0E ; |    XXX | $F76F
    .byte $06 ; |     XX | $F770
    .byte $09 ; |    X  X| $F771
    .byte $00 ; |        | $F772
    .byte $00 ; |        | $F773
    .byte $12 ; |   X  X | $F774
    .byte $0F ; |    XXXX| $F775
    .byte $09 ; |    X  X| $F776
    .byte $09 ; |    X  X| $F777
    .byte $0F ; |    XXXX| $F778
    .byte $06 ; |     XX | $F779
    .byte $09 ; |    X  X| $F77A
    .byte $00 ; |        | $F77B
    .byte $00 ; |        | $F77C
    .byte $12 ; |   X  X | $F77D
    .byte $13 ; |   X  XX| $F77E
    .byte $09 ; |    X  X| $F77F
    .byte $09 ; |    X  X| $F780
    .byte $13 ; |   X  XX| $F781
    .byte $06 ; |     XX | $F782
    .byte $09 ; |    X  X| $F783
    .byte $00 ; |        | $F784
    .byte $00 ; |        | $F785
    .byte $12 ; |   X  X | $F786
    .byte $17 ; |   X XXX| $F787
    .byte $09 ; |    X  X| $F788
    .byte $09 ; |    X  X| $F789
    .byte $17 ; |   X XXX| $F78A
    .byte $06 ; |     XX | $F78B
    .byte $09 ; |    X  X| $F78C
    .byte $00 ; |        | $F78D
    .byte $00 ; |        | $F78E
    .byte $12 ; |   X  X | $F78F
    .byte $14 ; |   X X  | $F790
    .byte $09 ; |    X  X| $F791
    .byte $09 ; |    X  X| $F792
    .byte $0E ; |    XXX | $F793
    .byte $09 ; |    X  X| $F794
    .byte $12 ; |   X  X | $F795
    .byte $00 ; |        | $F796
    .byte $00 ; |        | $F797
    .byte $09 ; |    X  X| $F798
    .byte $0F ; |    XXXX| $F799
    .byte $09 ; |    X  X| $F79A
    .byte $09 ; |    X  X| $F79B
    .byte $00 ; |        | $F79C
    .byte $00 ; |        | $F79D
    .byte $09 ; |    X  X| $F79E
    .byte $11 ; |   X   X| $F79F
    .byte $09 ; |    X  X| $F7A0
    .byte $09 ; |    X  X| $F7A1
    .byte $00 ; |        | $F7A2
    .byte $00 ; |        | $F7A3
    .byte $09 ; |    X  X| $F7A4
    .byte $13 ; |   X  XX| $F7A5
    .byte $09 ; |    X  X| $F7A6
    .byte $09 ; |    X  X| $F7A7
    .byte $13 ; |   X  XX| $F7A8
    .byte $06 ; |     XX | $F7A9
    .byte $09 ; |    X  X| $F7AA
    .byte $00 ; |        | $F7AB
    .byte $00 ; |        | $F7AC
    .byte $12 ; |   X  X | $F7AD
    .byte $0F ; |    XXXX| $F7AE
    .byte $09 ; |    X  X| $F7AF
    .byte $09 ; |    X  X| $F7B0
    .byte $0F ; |    XXXX| $F7B1
    .byte $06 ; |     XX | $F7B2
    .byte $09 ; |    X  X| $F7B3
    .byte $00 ; |        | $F7B4
    .byte $00 ; |        | $F7B5
    .byte $12 ; |   X  X | $F7B6
    .byte $0B ; |    X XX| $F7B7
    .byte $09 ; |    X  X| $F7B8
    .byte $09 ; |    X  X| $F7B9
    .byte $0B ; |    X XX| $F7BA
    .byte $06 ; |     XX | $F7BB
    .byte $09 ; |    X  X| $F7BC
    .byte $00 ; |        | $F7BD
    .byte $00 ; |        | $F7BE
    .byte $12 ; |   X  X | $F7BF
    .byte $0D ; |    XX X| $F7C0
    .byte $09 ; |    X  X| $F7C1
    .byte $09 ; |    X  X| $F7C2
    .byte $0D ; |    XX X| $F7C3
    .byte $06 ; |     XX | $F7C4
    .byte $09 ; |    X  X| $F7C5
    .byte $00 ; |        | $F7C6
    .byte $00 ; |        | $F7C7
    .byte $12 ; |   X  X | $F7C8
    .byte $0F ; |    XXXX| $F7C9
    .byte $09 ; |    X  X| $F7CA
    .byte $09 ; |    X  X| $F7CB
    .byte $00 ; |        | $F7CC
    .byte $00 ; |        | $F7CD
    .byte $09 ; |    X  X| $F7CE
    .byte $13 ; |   X  XX| $F7CF
    .byte $09 ; |    X  X| $F7D0
    .byte $09 ; |    X  X| $F7D1
    .byte $00 ; |        | $F7D2
    .byte $00 ; |        | $F7D3
    .byte $09 ; |    X  X| $F7D4
    .byte $1A ; |   XX X | $F7D5
    .byte $09 ; |    X  X| $F7D6
    .byte $12 ; |   X  X | $F7D7
    .byte $00 ; |        | $F7D8
    .byte $00 ; |        | $F7D9
    .byte $09 ; |    X  X| $F7DA
    .byte $13 ; |   X  XX| $F7DB
    .byte $09 ; |    X  X| $F7DC
    .byte $12 ; |   X  X | $F7DD
    .byte $00 ; |        | $F7DE
    .byte $00 ; |        | $F7DF
    .byte $09 ; |    X  X| $F7E0
    .byte $1A ; |   XX X | $F7E1
    .byte $09 ; |    X  X| $F7E2
    .byte $09 ; |    X  X| $F7E3
    .byte $00 ; |        | $F7E4
    .byte $00 ; |        | $F7E5
    .byte $09 ; |    X  X| $F7E6
    .byte $17 ; |   X XXX| $F7E7
    .byte $09 ; |    X  X| $F7E8
    .byte $09 ; |    X  X| $F7E9
    .byte $00 ; |        | $F7EA
    .byte $00 ; |        | $F7EB
    .byte $09 ; |    X  X| $F7EC
    .byte $14 ; |   X X  | $F7ED
    .byte $09 ; |    X  X| $F7EE
    .byte $09 ; |    X  X| $F7EF
    .byte $00 ; |        | $F7F0
    .byte $00 ; |        | $F7F1
    .byte $09 ; |    X  X| $F7F2
LF7F3:
    .byte $FF ; |XXXXXXXX| $F7F3
    .byte $28 ; |  X X   | $F7F4
    .byte $38 ; |  XXX   | $F7F5
    .byte $20 ; |  X     | $F7F6
    .byte $30 ; |  XX    | $F7F7
    .byte $18 ; |   XX   | $F7F8
    .byte $48 ; | X  X   | $F7F9
    .byte $58 ; | X XX   | $F7FA
    .byte $50 ; | X X    | $F7FB
    .byte $40 ; | X      | $F7FC
    .byte $10 ; |   X    | $F7FD
    .byte $28 ; |  X X   | $F7FE
    .byte $38 ; |  XXX   | $F7FF
    .byte $20 ; |  X     | $F800
    .byte $30 ; |  XX    | $F801
    .byte $18 ; |   XX   | $F802
    .byte $48 ; | X  X   | $F803
    .byte $58 ; | X XX   | $F804
    .byte $50 ; | X X    | $F805
    .byte $40 ; | X      | $F806
    .byte $10 ; |   X    | $F807
    .byte $08 ; |    X   | $F808
    .byte $10 ; |   X    | $F809
    .byte $18 ; |   XX   | $F80A
    .byte $20 ; |  X     | $F80B
    .byte $28 ; |  X X   | $F80C
    .byte $30 ; |  XX    | $F80D
    .byte $38 ; |  XXX   | $F80E
    .byte $40 ; | X      | $F80F
    .byte $48 ; | X  X   | $F810
    .byte $50 ; | X X    | $F811
    .byte $58 ; | X XX   | $F812
    .byte $60 ; | XX     | $F813
    .byte $68 ; | XX X   | $F814
    .byte $70 ; | XXX    | $F815
    .byte $78 ; | XXXX   | $F816
    .byte $80 ; |X       | $F817
    .byte $88 ; |X   X   | $F818
    .byte $90 ; |X  X    | $F819
    .byte $98 ; |X  XX   | $F81A
    .byte $A0 ; |X X     | $F81B
    .byte $A8 ; |X X X   | $F81C
    .byte $B0 ; |X XX    | $F81D
    .byte $B8 ; |X XXX   | $F81E
    .byte $C0 ; |XX      | $F81F
    .byte $C8 ; |XX  X   | $F820
    .byte $D0 ; |XX X    | $F821
    .byte $18 ; |   XX   | $F822
    .byte $08 ; |    X   | $F823
    .byte $A0 ; |X X     | $F824
    .byte $00 ; |        | $F825
    .byte $78 ; | XXXX   | $F826
    .byte $70 ; | XXX    | $F827
    .byte $28 ; |  X X   | $F828
    .byte $00 ; |        | $F829
    .byte $90 ; |X  X    | $F82A
    .byte $28 ; |  X X   | $F82B
    .byte $20 ; |  X     | $F82C
    .byte $00 ; |        | $F82D
    .byte $A0 ; |X X     | $F82E
    .byte $B8 ; |X XXX   | $F82F
    .byte $78 ; | XXXX   | $F830
    .byte $00 ; |        | $F831
    .byte $20 ; |  X     | $F832
    .byte $78 ; | XXXX   | $F833
    .byte $38 ; |  XXX   | $F834
    .byte $00 ; |        | $F835
    .byte $98 ; |X  XX   | $F836
    .byte $48 ; | X  X   | $F837
    .byte $C0 ; |XX      | $F838
    .byte $00 ; |        | $F839
    .byte $40 ; | X      | $F83A
    .byte $08 ; |    X   | $F83B
    .byte $A0 ; |X X     | $F83C
    .byte $00 ; |        | $F83D
    .byte $A0 ; |X X     | $F83E
    .byte $28 ; |  X X   | $F83F
    .byte $70 ; | XXX    | $F840
    .byte $00 ; |        | $F841
    .byte $68 ; | XX X   | $F842
    .byte $78 ; | XXXX   | $F843
    .byte $68 ; | XX X   | $F844
    .byte $00 ; |        | $F845
    .byte $20 ; |  X     | $F846
    .byte $08 ; |    X   | $F847
    .byte $20 ; |  X     | $F848
    .byte $00 ; |        | $F849
    .byte $10 ; |   X    | $F84A
    .byte $08 ; |    X   | $F84B
    .byte $60 ; | XX     | $F84C
    .byte $60 ; | XX     | $F84D
    .byte $30 ; |  XX    | $F84E
    .byte $48 ; | X  X   | $F84F
    .byte $98 ; |X  XX   | $F850
    .byte $40 ; | X      | $F851
    .byte $70 ; | XXX    | $F852
    .byte $48 ; | X  X   | $F853
    .byte $70 ; | XXX    | $F854
    .byte $28 ; |  X X   | $F855
    .byte $10 ; |   X    | $F856
    .byte $28 ; |  X X   | $F857
    .byte $08 ; |    X   | $F858
    .byte $90 ; |X  X    | $F859
    .byte $30 ; |  XX    | $F85A
    .byte $78 ; | XXXX   | $F85B
    .byte $A8 ; |X X X   | $F85C
    .byte $90 ; |X  X    | $F85D
    .byte $10 ; |   X    | $F85E
    .byte $48 ; | X  X   | $F85F
    .byte $90 ; |X  X    | $F860
    .byte $20 ; |  X     | $F861
    .byte $A0 ; |X X     | $F862
    .byte $90 ; |X  X    | $F863
    .byte $28 ; |  X X   | $F864
    .byte $28 ; |  X X   | $F865
    .byte $90 ; |X  X    | $F866
    .byte $78 ; | XXXX   | $F867
    .byte $18 ; |   XX   | $F868
    .byte $58 ; | X XX   | $F869
    .byte $10 ; |   X    | $F86A
    .byte $78 ; | XXXX   | $F86B
    .byte $78 ; | XXXX   | $F86C
    .byte $58 ; | X XX   | $F86D
    .byte $90 ; |X  X    | $F86E
    .byte $78 ; | XXXX   | $F86F
    .byte $08 ; |    X   | $F870
    .byte $20 ; |  X     | $F871

LF872:
    lda    $96                   ; 3
    cmp    #$C0                  ; 2
    beq    LF8D2                 ; 2³
    cmp    #$E0                  ; 2
    beq    LF8D6                 ; 2³
    cmp    #$C3                  ; 2
    beq    LF88E                 ; 2³
    cmp    #$F0                  ; 2
    bne    LF88A                 ; 2³
    lda    #1                    ; 2
    sta    $88                   ; 3
    bne    LF8D8                 ; 3   always branch

LF88A:
    sta    $A6                   ; 3
    bne    LF8D8                 ; 2³
LF88E:
    jsr    LFC27                 ; 6
    lda    #2                    ; 2
    sta    $BD                   ; 3
    jsr    LFDA4                 ; 6
    lda    #0                    ; 2
    sta    $BD                   ; 3
    jsr    LFD99                 ; 6
    cmp    #7                    ; 2
    bcs    LF8A7                 ; 2³
    lda    #7                    ; 2
    sta    $83                   ; 3
LF8A7:
    lda    $82                   ; 3
    cmp    #5                    ; 2
    bcs    LF8B1                 ; 2³
    lda    #5                    ; 2
    sta    $82                   ; 3
LF8B1:
    cmp    #$97                  ; 2
    bcc    LF8CC                 ; 2³
    lda    #$62                  ; 2
    sta    $83                   ; 3
    lda    #0                    ; 2
    sta    $B8                   ; 3
    lda    $B5                   ; 3
    beq    LF8CC                 ; 2³
    jsr    LFC3F                 ; 6
    lda    #2                    ; 2
    sta    $D2                   ; 3
    sta    $BD                   ; 3
    bne    LF8E7                 ; 3   always branch

LF8CC:
    inc    $87                   ; 5
    inc    $86                   ; 5
    bne    LF8E7                 ; 2³
LF8D2:
    inc    $A5                   ; 5
    bne    LF8D8                 ; 2³
LF8D6:
    dec    $A5                   ; 5
LF8D8:
    inc    $86                   ; 5
    inc    $87                   ; 5
    lda    $84                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    sta    $84                   ; 3
    bcc    LF8E7                 ; 2³
    inc    $85                   ; 5
LF8E7:
    ldx    #0                    ; 2
    jmp    LFFE7                 ; 3

    .byte $32 ; |  XX  X | $F8EC
    .byte $30 ; |  XX    | $F8ED
    .byte $2E ; |  X XXX | $F8EE
    .byte $2C ; |  X XX  | $F8EF
    .byte $2C ; |  X XX  | $F8F0
    .byte $2C ; |  X XX  | $F8F1
    .byte $2C ; |  X XX  | $F8F2
    .byte $2C ; |  X XX  | $F8F3
    .byte $2C ; |  X XX  | $F8F4
    .byte $2E ; |  X XXX | $F8F5
    .byte $30 ; |  XX    | $F8F6
    .byte $32 ; |  XX  X | $F8F7
    .byte $32 ; |  XX  X | $F8F8
    .byte $32 ; |  XX  X | $F8F9
    .byte $32 ; |  XX  X | $F8FA
    .byte $32 ; |  XX  X | $F8FB
LF8FC:
    .byte $0D ; |    XX X| $F8FC
    .byte $0D ; |    XX X| $F8FD
    .byte $0D ; |    XX X| $F8FE
    .byte $0E ; |    XXX | $F8FF
    .byte $0F ; |    XXXX| $F900
    .byte $10 ; |   X    | $F901
    .byte $11 ; |   X   X| $F902
    .byte $12 ; |   X  X | $F903
    .byte $12 ; |   X  X | $F904
    .byte $12 ; |   X  X | $F905
    .byte $12 ; |   X  X | $F906
    .byte $12 ; |   X  X | $F907
    .byte $12 ; |   X  X | $F908
    .byte $12 ; |   X  X | $F909
    .byte $12 ; |   X  X | $F90A
    .byte $11 ; |   X   X| $F90B
LF90C:
    .byte $10 ; |   X    | $F90C
    .byte $0F ; |    XXXX| $F90D
    .byte $0E ; |    XXX | $F90E
    .byte $0D ; |    XX X| $F90F
    .byte $86 ; |X    XX | $F910
    .byte $86 ; |X    XX | $F911
    .byte $86 ; |X    XX | $F912
    .byte $86 ; |X    XX | $F913
    .byte $86 ; |X    XX | $F914
    .byte $86 ; |X    XX | $F915
    .byte $86 ; |X    XX | $F916
    .byte $86 ; |X    XX | $F917
    .byte $86 ; |X    XX | $F918
    .byte $86 ; |X    XX | $F919
    .byte $86 ; |X    XX | $F91A
    .byte $86 ; |X    XX | $F91B
    .byte $36 ; |  XX XX | $F91C
    .byte $36 ; |  XX XX | $F91D
    .byte $36 ; |  XX XX | $F91E
    .byte $36 ; |  XX XX | $F91F
    .byte $36 ; |  XX XX | $F920
    .byte $F8 ; |XXXXX   | $F921
    .byte $F8 ; |XXXXX   | $F922
    .byte $F8 ; |XXXXX   | $F923
    .byte $F8 ; |XXXXX   | $F924
    .byte $F8 ; |XXXXX   | $F925
    .byte $F8 ; |XXXXX   | $F926
    .byte $F8 ; |XXXXX   | $F927
    .byte $F8 ; |XXXXX   | $F928
    .byte $F8 ; |XXXXX   | $F929
    .byte $F8 ; |XXXXX   | $F92A
    .byte $F8 ; |XXXXX   | $F92B
    .byte $00 ; |        | $F92C
LF92D:
    .byte $00 ; |        | $F92D
    .byte $00 ; |        | $F92E
    .byte $00 ; |        | $F92F
    .byte $00 ; |        | $F930
    .byte $00 ; |        | $F931
    .byte $00 ; |        | $F932
    .byte $00 ; |        | $F933
    .byte $00 ; |        | $F934
    .byte $00 ; |        | $F935
    .byte $00 ; |        | $F936
    .byte $00 ; |        | $F937
    .byte $00 ; |        | $F938
    .byte $00 ; |        | $F939
    .byte $00 ; |        | $F93A
    .byte $00 ; |        | $F93B
    .byte $18 ; |   XX   | $F93C
    .byte $3C ; |  XXXX  | $F93D
    .byte $3C ; |  XXXX  | $F93E
    .byte $FE ; |XXXXXXX | $F93F
    .byte $00 ; |        | $F940
LF941:
    .byte $00 ; |        | $F941
    .byte $00 ; |        | $F942
    .byte $00 ; |        | $F943
    .byte $00 ; |        | $F944
    .byte $38 ; |  XXX   | $F945
    .byte $6C ; | XX XX  | $F946
    .byte $C6 ; |XX   XX | $F947
    .byte $86 ; |X    XX | $F948
    .byte $86 ; |X    XX | $F949
    .byte $A6 ; |X X  XX | $F94A
    .byte $E6 ; |XXX  XX | $F94B
    .byte $F6 ; |XXXX XX | $F94C
    .byte $7E ; | XXXXXX | $F94D
    .byte $3E ; |  XXXXX | $F94E
    .byte $7C ; | XXXXX  | $F94F
    .byte $7C ; | XXXXX  | $F950
    .byte $7C ; | XXXXX  | $F951
    .byte $7C ; | XXXXX  | $F952
    .byte $7E ; | XXXXXX | $F953
    .byte $7E ; | XXXXXX | $F954
LF955:
    .byte $38 ; |  XXX   | $F955
    .byte $38 ; |  XXX   | $F956
    .byte $7C ; | XXXXX  | $F957
    .byte $7E ; | XXXXXX | $F958
    .byte $76 ; | XXX XX | $F959
    .byte $7C ; | XXXXX  | $F95A
    .byte $78 ; | XXXX   | $F95B
    .byte $3C ; |  XXXX  | $F95C
    .byte $18 ; |   XX   | $F95D
LF95E:
    .byte $00 ; |        | $F95E
    .byte $00 ; |        | $F95F
    .byte $00 ; |        | $F960
    .byte $00 ; |        | $F961
    .byte $38 ; |  XXX   | $F962
    .byte $6C ; | XX XX  | $F963
    .byte $CE ; |XX  XXX | $F964
    .byte $9A ; |X  XX X | $F965
    .byte $9E ; |X  XXXX | $F966
    .byte $8E ; |X   XXX | $F967
    .byte $BE ; |X XXXXX | $F968
    .byte $FE ; |XXXXXXX | $F969
    .byte $7C ; | XXXXX  | $F96A
    .byte $3E ; |  XXXXX | $F96B
    .byte $7E ; | XXXXXX | $F96C
    .byte $7E ; | XXXXXX | $F96D
    .byte $7C ; | XXXXX  | $F96E
    .byte $7C ; | XXXXX  | $F96F
    .byte $7E ; | XXXXXX | $F970
    .byte $7E ; | XXXXXX | $F971
    .byte $38 ; |  XXX   | $F972
    .byte $38 ; |  XXX   | $F973
    .byte $7C ; | XXXXX  | $F974
    .byte $7E ; | XXXXXX | $F975
    .byte $76 ; | XXX XX | $F976
    .byte $7C ; | XXXXX  | $F977
    .byte $78 ; | XXXX   | $F978
    .byte $3C ; |  XXXX  | $F979
    .byte $18 ; |   XX   | $F97A
LF97B:
    .byte $00 ; |        | $F97B
    .byte $00 ; |        | $F97C
    .byte $00 ; |        | $F97D
    .byte $00 ; |        | $F97E
    .byte $38 ; |  XXX   | $F97F
    .byte $6C ; | XX XX  | $F980
    .byte $E6 ; |XXX  XX | $F981
    .byte $E2 ; |XXX   X | $F982
    .byte $F2 ; |XXXX  X | $F983
    .byte $B6 ; |X XX XX | $F984
    .byte $BE ; |X XXXXX | $F985
    .byte $FE ; |XXXXXXX | $F986
    .byte $7A ; | XXXX X | $F987
    .byte $3E ; |  XXXXX | $F988
    .byte $7E ; | XXXXXX | $F989
    .byte $7C ; | XXXXX  | $F98A
    .byte $7C ; | XXXXX  | $F98B
    .byte $7C ; | XXXXX  | $F98C
    .byte $7E ; | XXXXXX | $F98D
    .byte $7E ; | XXXXXX | $F98E
    .byte $38 ; |  XXX   | $F98F
    .byte $38 ; |  XXX   | $F990
    .byte $7C ; | XXXXX  | $F991
    .byte $7E ; | XXXXXX | $F992
    .byte $76 ; | XXX XX | $F993
    .byte $7C ; | XXXXX  | $F994
    .byte $78 ; | XXXX   | $F995
    .byte $3C ; |  XXXX  | $F996
    .byte $18 ; |   XX   | $F997
    .byte $00 ; |        | $F998
    .byte $00 ; |        | $F999
    .byte $00 ; |        | $F99A
LF99B:
    .byte $10 ; |   X    | $F99B
    .byte $10 ; |   X    | $F99C
    .byte $10 ; |   X    | $F99D
    .byte $10 ; |   X    | $F99E
    .byte $10 ; |   X    | $F99F
    .byte $10 ; |   X    | $F9A0
    .byte $10 ; |   X    | $F9A1
    .byte $10 ; |   X    | $F9A2
    .byte $10 ; |   X    | $F9A3
    .byte $10 ; |   X    | $F9A4
    .byte $10 ; |   X    | $F9A5
    .byte $10 ; |   X    | $F9A6
    .byte $10 ; |   X    | $F9A7
    .byte $10 ; |   X    | $F9A8
    .byte $10 ; |   X    | $F9A9
    .byte $10 ; |   X    | $F9AA
    .byte $00 ; |        | $F9AB
    .byte $00 ; |        | $F9AC
    .byte $00 ; |        | $F9AD
    .byte $00 ; |        | $F9AE
    .byte $00 ; |        | $F9AF
    .byte $00 ; |        | $F9B0
    .byte $00 ; |        | $F9B1
    .byte $00 ; |        | $F9B2
    .byte $80 ; |X       | $F9B3
    .byte $80 ; |X       | $F9B4
    .byte $00 ; |        | $F9B5
    .byte $00 ; |        | $F9B6
    .byte $60 ; | XX     | $F9B7
    .byte $60 ; | XX     | $F9B8
    .byte $C0 ; |XX      | $F9B9
    .byte $C0 ; |XX      | $F9BA
LF9BB:
    .byte $C0 ; |XX      | $F9BB
    .byte $80 ; |X       | $F9BC
    .byte $80 ; |X       | $F9BD
    .byte $80 ; |X       | $F9BE
    .byte $80 ; |X       | $F9BF
    .byte $80 ; |X       | $F9C0
    .byte $80 ; |X       | $F9C1
    .byte $80 ; |X       | $F9C2
    .byte $80 ; |X       | $F9C3
    .byte $80 ; |X       | $F9C4
    .byte $80 ; |X       | $F9C5
    .byte $80 ; |X       | $F9C6
    .byte $80 ; |X       | $F9C7
    .byte $80 ; |X       | $F9C8
    .byte $80 ; |X       | $F9C9
    .byte $80 ; |X       | $F9CA
    .byte $80 ; |X       | $F9CB
    .byte $80 ; |X       | $F9CC
    .byte $80 ; |X       | $F9CD
    .byte $80 ; |X       | $F9CE
    .byte $80 ; |X       | $F9CF
    .byte $80 ; |X       | $F9D0
    .byte $80 ; |X       | $F9D1
    .byte $80 ; |X       | $F9D2
    .byte $C0 ; |XX      | $F9D3
    .byte $C0 ; |XX      | $F9D4
    .byte $C0 ; |XX      | $F9D5
    .byte $C0 ; |XX      | $F9D6
    .byte $E0 ; |XXX     | $F9D7
    .byte $E0 ; |XXX     | $F9D8
    .byte $E0 ; |XXX     | $F9D9
    .byte $E0 ; |XXX     | $F9DA
    .byte $80 ; |X       | $F9DB
    .byte $80 ; |X       | $F9DC
    .byte $80 ; |X       | $F9DD
    .byte $80 ; |X       | $F9DE
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
LF9F3:
    .byte $00 ; |        | $F9F3
    .byte $00 ; |        | $F9F4
    .byte $00 ; |        | $F9F5
    .byte $00 ; |        | $F9F6
    .byte $00 ; |        | $F9F7
    .byte $00 ; |        | $F9F8
LF9F9:
    .byte $00 ; |        | $F9F9
    .byte $00 ; |        | $F9FA
    .byte $80 ; |X       | $F9FB
    .byte $80 ; |X       | $F9FC
    .byte $80 ; |X       | $F9FD
    .byte $80 ; |X       | $F9FE
    .byte $C0 ; |XX      | $F9FF
    .byte $C0 ; |XX      | $FA00
    .byte $C0 ; |XX      | $FA01
    .byte $C0 ; |XX      | $FA02
LFA03:
    .byte $00 ; |        | $FA03
    .byte $00 ; |        | $FA04
    .byte $00 ; |        | $FA05
    .byte $00 ; |        | $FA06
    .byte $00 ; |        | $FA07
    .byte $00 ; |        | $FA08
    .byte $00 ; |        | $FA09
    .byte $00 ; |        | $FA0A
    .byte $09 ; |    X  X| $FA0B
    .byte $09 ; |    X  X| $FA0C
    .byte $05 ; |     X X| $FA0D
    .byte $05 ; |     X X| $FA0E
    .byte $03 ; |      XX| $FA0F
    .byte $03 ; |      XX| $FA10
    .byte $07 ; |     XXX| $FA11
    .byte $07 ; |     XXX| $FA12
    .byte $13 ; |   X  XX| $FA13
    .byte $13 ; |   X  XX| $FA14
    .byte $73 ; | XXX  XX| $FA15
    .byte $73 ; | XXX  XX| $FA16
    .byte $3F ; |  XXXXXX| $FA17
    .byte $3F ; |  XXXXXX| $FA18
    .byte $3B ; |  XXX XX| $FA19
    .byte $3B ; |  XXX XX| $FA1A
    .byte $1B ; |   XX XX| $FA1B
    .byte $1B ; |   XX XX| $FA1C
    .byte $9B ; |X  XX XX| $FA1D
    .byte $9B ; |X  XX XX| $FA1E
    .byte $DB ; |XX XX XX| $FA1F
    .byte $DB ; |XX XX XX| $FA20
    .byte $9B ; |X  XX XX| $FA21
    .byte $9B ; |X  XX XX| $FA22
LFA23:
    .byte $9B ; |X  XX XX| $FA23
    .byte $9B ; |X  XX XX| $FA24
    .byte $9B ; |X  XX XX| $FA25
    .byte $9B ; |X  XX XX| $FA26
    .byte $9B ; |X  XX XX| $FA27
    .byte $9B ; |X  XX XX| $FA28
    .byte $9B ; |X  XX XX| $FA29
    .byte $9B ; |X  XX XX| $FA2A
    .byte $9B ; |X  XX XX| $FA2B
    .byte $9B ; |X  XX XX| $FA2C
    .byte $9B ; |X  XX XX| $FA2D
    .byte $9B ; |X  XX XX| $FA2E
    .byte $9B ; |X  XX XX| $FA2F
    .byte $9B ; |X  XX XX| $FA30
    .byte $9B ; |X  XX XX| $FA31
    .byte $9B ; |X  XX XX| $FA32
    .byte $9B ; |X  XX XX| $FA33
    .byte $9B ; |X  XX XX| $FA34
    .byte $9B ; |X  XX XX| $FA35
    .byte $9B ; |X  XX XX| $FA36
    .byte $9B ; |X  XX XX| $FA37
    .byte $9B ; |X  XX XX| $FA38
    .byte $9B ; |X  XX XX| $FA39
    .byte $9B ; |X  XX XX| $FA3A
    .byte $9B ; |X  XX XX| $FA3B
    .byte $9B ; |X  XX XX| $FA3C
    .byte $9B ; |X  XX XX| $FA3D
    .byte $9B ; |X  XX XX| $FA3E
    .byte $DF ; |XX XXXXX| $FA3F
    .byte $DF ; |XX XXXXX| $FA40
    .byte $DF ; |XX XXXXX| $FA41
    .byte $DF ; |XX XXXXX| $FA42
    .byte $3F ; |  XXXXXX| $FA43
    .byte $3F ; |  XXXXXX| $FA44
    .byte $3F ; |  XXXXXX| $FA45
    .byte $3F ; |  XXXXXX| $FA46
    .byte $7B ; | XXXX XX| $FA47
    .byte $7B ; | XXXX XX| $FA48
    .byte $5B ; | X XX XX| $FA49
    .byte $5B ; | X XX XX| $FA4A
    .byte $4B ; | X  X XX| $FA4B
    .byte $4B ; | X  X XX| $FA4C
    .byte $83 ; |X     XX| $FA4D
    .byte $83 ; |X     XX| $FA4E
    .byte $03 ; |      XX| $FA4F
    .byte $03 ; |      XX| $FA50
    .byte $03 ; |      XX| $FA51
    .byte $03 ; |      XX| $FA52
    .byte $07 ; |     XXX| $FA53
    .byte $07 ; |     XXX| $FA54
    .byte $07 ; |     XXX| $FA55
    .byte $07 ; |     XXX| $FA56
    .byte $0F ; |    XXXX| $FA57
    .byte $0F ; |    XXXX| $FA58
    .byte $1B ; |   XX XX| $FA59
    .byte $1B ; |   XX XX| $FA5A
LFA5B:
    .byte $7F ; | XXXXXXX| $FA5B
    .byte $7F ; | XXXXXXX| $FA5C
    .byte $7F ; | XXXXXXX| $FA5D
    .byte $7F ; | XXXXXXX| $FA5E
    .byte $FF ; |XXXXXXXX| $FA5F
    .byte $FF ; |XXXXXXXX| $FA60
LFA61:
    .byte $FF ; |XXXXXXXX| $FA61
    .byte $FF ; |XXXXXXXX| $FA62
    .byte $FF ; |XXXXXXXX| $FA63
    .byte $FF ; |XXXXXXXX| $FA64
    .byte $FF ; |XXXXXXXX| $FA65
    .byte $FF ; |XXXXXXXX| $FA66
    .byte $FF ; |XXXXXXXX| $FA67
    .byte $FF ; |XXXXXXXX| $FA68
    .byte $FF ; |XXXXXXXX| $FA69
    .byte $FF ; |XXXXXXXX| $FA6A
LFA6B:
    .byte $00 ; |        | $FA6B
    .byte $00 ; |        | $FA6C
    .byte $00 ; |        | $FA6D
    .byte $00 ; |        | $FA6E
    .byte $00 ; |        | $FA6F
    .byte $00 ; |        | $FA70
    .byte $00 ; |        | $FA71
    .byte $00 ; |        | $FA72
    .byte $00 ; |        | $FA73
    .byte $00 ; |        | $FA74
    .byte $01 ; |       X| $FA75
    .byte $01 ; |       X| $FA76
    .byte $07 ; |     XXX| $FA77
    .byte $07 ; |     XXX| $FA78
    .byte $03 ; |      XX| $FA79
    .byte $03 ; |      XX| $FA7A
    .byte $11 ; |   X   X| $FA7B
    .byte $11 ; |   X   X| $FA7C
    .byte $39 ; |  XXX  X| $FA7D
    .byte $39 ; |  XXX  X| $FA7E
    .byte $1D ; |   XXX X| $FA7F
    .byte $1D ; |   XXX X| $FA80
    .byte $3F ; |  XXXXXX| $FA81
    .byte $3F ; |  XXXXXX| $FA82
    .byte $7D ; | XXXXX X| $FA83
    .byte $D7 ; |XX X XXX| $FA84
    .byte $39 ; |  XXX  X| $FA85
    .byte $39 ; |  XXX  X| $FA86
    .byte $19 ; |   XX  X| $FA87
    .byte $19 ; |   XX  X| $FA88
    .byte $19 ; |   XX  X| $FA89
    .byte $19 ; |   XX  X| $FA8A
LFA8B:
    .byte $19 ; |   XX  X| $FA8B
    .byte $19 ; |   XX  X| $FA8C
    .byte $19 ; |   XX  X| $FA8D
    .byte $19 ; |   XX  X| $FA8E
    .byte $19 ; |   XX  X| $FA8F
    .byte $19 ; |   XX  X| $FA90
    .byte $19 ; |   XX  X| $FA91
    .byte $19 ; |   XX  X| $FA92
    .byte $19 ; |   XX  X| $FA93
    .byte $19 ; |   XX  X| $FA94
    .byte $19 ; |   XX  X| $FA95
    .byte $19 ; |   XX  X| $FA96
    .byte $19 ; |   XX  X| $FA97
    .byte $19 ; |   XX  X| $FA98
    .byte $19 ; |   XX  X| $FA99
    .byte $19 ; |   XX  X| $FA9A
    .byte $19 ; |   XX  X| $FA9B
    .byte $19 ; |   XX  X| $FA9C
    .byte $19 ; |   XX  X| $FA9D
    .byte $19 ; |   XX  X| $FA9E
    .byte $19 ; |   XX  X| $FA9F
    .byte $19 ; |   XX  X| $FAA0
    .byte $19 ; |   XX  X| $FAA1
    .byte $19 ; |   XX  X| $FAA2
    .byte $39 ; |  XXX  X| $FAA3
    .byte $39 ; |  XXX  X| $FAA4
    .byte $39 ; |  XXX  X| $FAA5
    .byte $39 ; |  XXX  X| $FAA6
    .byte $79 ; | XXXX  X| $FAA7
    .byte $79 ; | XXXX  X| $FAA8
    .byte $5D ; | X XXX X| $FAA9
    .byte $5D ; | X XXX X| $FAAA
    .byte $11 ; |   X   X| $FAAB
    .byte $01 ; |       X| $FAAC
    .byte $01 ; |       X| $FAAD
    .byte $01 ; |       X| $FAAE
    .byte $01 ; |       X| $FAAF
    .byte $01 ; |       X| $FAB0
    .byte $01 ; |       X| $FAB1
    .byte $01 ; |       X| $FAB2
    .byte $03 ; |      XX| $FAB3
    .byte $03 ; |      XX| $FAB4
    .byte $03 ; |      XX| $FAB5
    .byte $03 ; |      XX| $FAB6
    .byte $07 ; |     XXX| $FAB7
    .byte $07 ; |     XXX| $FAB8
    .byte $05 ; |     X X| $FAB9
    .byte $05 ; |     X X| $FABA
    .byte $0D ; |    XX X| $FABB
    .byte $0D ; |    XX X| $FABC
    .byte $09 ; |    X  X| $FABD
    .byte $09 ; |    X  X| $FABE
    .byte $19 ; |   XX  X| $FABF
    .byte $19 ; |   XX  X| $FAC0
    .byte $11 ; |   X   X| $FAC1
    .byte $11 ; |   X   X| $FAC2
LFAC3:
    .byte $3F ; |  XXXXXX| $FAC3
    .byte $3F ; |  XXXXXX| $FAC4
    .byte $3F ; |  XXXXXX| $FAC5
    .byte $3F ; |  XXXXXX| $FAC6
    .byte $7F ; | XXXXXXX| $FAC7
    .byte $7F ; | XXXXXXX| $FAC8
LFAC9:
    .byte $7F ; | XXXXXXX| $FAC9
    .byte $7F ; | XXXXXXX| $FACA
    .byte $7F ; | XXXXXXX| $FACB
    .byte $7F ; | XXXXXXX| $FACC
    .byte $7F ; | XXXXXXX| $FACD
    .byte $7F ; | XXXXXXX| $FACE
    .byte $7F ; | XXXXXXX| $FACF
    .byte $7F ; | XXXXXXX| $FAD0
    .byte $7F ; | XXXXXXX| $FAD1
    .byte $7F ; | XXXXXXX| $FAD2

LFAD3:
    jsr    LFC27                 ; 6
    dec    $BF                   ; 5
    bne    LFB13                 ; 2³+1
    lda    #$14                  ; 2
    sta    $BF                   ; 3
    inc    $F0                   ; 5
    lda    $BD                   ; 3
    bne    LFAF7                 ; 2³
    ldx    $F0                   ; 3
    cpx    #$18                  ; 2
    bcc    LFAEF                 ; 2³
    lda    #0                    ; 2
    tax                          ; 2
    sta    $F0                   ; 3
LFAEF:
    lda    LFDEC,X               ; 4
    sta    $B7                   ; 3
    jmp    LFB0F                 ; 3

LFAF7:
    lda    $F0                   ; 3
    lsr                          ; 2
    bcc    LFB13                 ; 2³+1
    inc    $BE                   ; 5
    ldx    $BE                   ; 3
    cpx    #$0E                  ; 2
    bcc    LFB09                 ; 2³
    lda    #0                    ; 2
    tax                          ; 2
    sta    $BE                   ; 3
LFB09:
    lda    LFFA0,X               ; 4
    sta    $B7                   ; 3
    asl                          ; 2
LFB0F:
    asl                          ; 2
    asl                          ; 2
    sta    $92                   ; 3
LFB13:
    jsr    LFDA4                 ; 6
    ldx    $82                   ; 3
    cpx    #$97                  ; 2
    bcc    LFB46                 ; 2³
    bne    LFB28                 ; 2³
    lda    #$9F                  ; 2
    sta    $82                   ; 3
    ldx    $9D                   ; 3
    bne    LFB28                 ; 2³
    inc    $C2                   ; 5
LFB28:
    ldx    #$0A                  ; 2
    stx    $83                   ; 3
    stx    $82                   ; 3
    lda    $B5                   ; 3
    beq    LFB40                 ; 2³
    stx    $93                   ; 3
    inc    $FA                   ; 5
    ldx    $FA                   ; 3
    ldy    LFFB4,X               ; 4
    sty    $BD                   ; 3
LFB3D:
    jmp    LFC18                 ; 3

LFB40:
    lda    #$A0                  ; 2
    sta    $82                   ; 3
    bne    LFB3D                 ; 3   always branch

LFB46:
    lda    $82                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    cpx    #$14                  ; 2
    bcc    LFB56                 ; 2³
    stx    $96                   ; 3
    lda    #$27                  ; 2
    sbc    $96                   ; 3
    tax                          ; 2
LFB56:
    ldy    $BD                   ; 3
    beq    LFB63                 ; 2³
    dey                          ; 2
    beq    LFBA3                 ; 2³
    jsr    LFD99                 ; 6
    jmp    LFBCA                 ; 3

LFB63:
    ldy    LFF5C,X               ; 4
    sty    $83                   ; 3
    lda    $B7                   ; 3
    beq    LFB3D                 ; 2³
    lda    $82                   ; 3
    cmp    #$54                  ; 2
    bcs    LFB3D                 ; 2³
    adc    $B7                   ; 3
    adc    $B7                   ; 3
    cmp    #$52                  ; 2
    bcc    LFB3D                 ; 2³
    ldy    $B8                   ; 3
    cpy    #2                    ; 2
    bcc    LFB84                 ; 2³
    lda    #$56                  ; 2
    bne    LFB9A                 ; 3   always branch

LFB84:
    lda    #$52                  ; 2
    sbc    $B7                   ; 3
    sbc    $B7                   ; 3
    bne    LFB9A                 ; 2³
LFB8C:
    lda    #$2E                  ; 2
    sbc    $B7                   ; 3
    sbc    $B7                   ; 3
LFB92:
    ldx    $82                   ; 3
    cpx    #$40                  ; 2
    bcc    LFB9A                 ; 2³
    adc    #$3F                  ; 2
LFB9A:
    sta    $82                   ; 3
    lda    $B8                   ; 3
    beq    LFB3D                 ; 2³
    jmp    LFC0C                 ; 3

LFBA3:
    ldy    LF8FC,X               ; 4
    sty    $83                   ; 3
    lda    $B7                   ; 3
    beq    LFB3D                 ; 2³
    lda    $82                   ; 3
    cmp    #$40                  ; 2
    bcc    LFBB4                 ; 2³
    sbc    #$40                  ; 2
LFBB4:
    cmp    #$30                  ; 2
    bcs    LFB3D                 ; 2³
    adc    $B7                   ; 3
    adc    $B7                   ; 3
    cmp    #$2E                  ; 2
    bcc    LFC18                 ; 2³+1
    ldy    $B8                   ; 3
    cpy    #2                    ; 2
    bne    LFB8C                 ; 2³
    lda    #$32                  ; 2
    bne    LFB92                 ; 3   always branch

LFBCA:
    ldy    $83                   ; 3
    lda    $82                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    cpx    #6                    ; 2
    bne    LFBE0                 ; 2³
    cpy    #$0A                  ; 2
    bcc    LFBE0                 ; 2³
    ldx    #9                    ; 2
    stx    $83                   ; 3
    bne    LFC0C                 ; 3+1   always branch

LFBE0:
    cpx    #$0A                  ; 2
    beq    LFBE8                 ; 2³
    cpx    #$0E                  ; 2
    bne    LFBF2                 ; 2³
LFBE8:
    cpy    #9                    ; 2
    bcs    LFBF2                 ; 2³
    ldx    #$0A                  ; 2
    stx    $83                   ; 3
    bne    LFC0C                 ; 3+1   always branch

LFBF2:
    lsr                          ; 2
    tax                          ; 2
    cpx    #5                    ; 2
    bcc    LFC00                 ; 2³+1
    stx    $96                   ; 3
    lda    #9                    ; 2
    sec                          ; 2
    sbc    $96                   ; 3
    tax                          ; 2
LFC00:
    lda    $83                   ; 3
    cmp    LFDED,X               ; 4
    bcs    LFC18                 ; 2³
    ldy    LFDED,X               ; 4
    sty    $83                   ; 3
LFC0C:
    lda    #0                    ; 2
    sta    $E7                   ; 3
    sta    $B8                   ; 3
    lda    #$0F                  ; 2
    sta    $E8                   ; 3
    sta    $9D                   ; 3
LFC18:
    jsr    LFD60                 ; 6
    ldx    #1                    ; 2
    bne    LFC24                 ; 3   always branch

LFC1F:
    jsr    LF5D6                 ; 6
    ldx    #4                    ; 2
LFC24:
    jmp    LFFE7                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFC27 SUBROUTINE
    lda    $DD                   ; 3
    bne    LFC3A                 ; 2³
    lda    SWCHA                 ; 4   input from Kid Vid
    and    #$08                  ; 2   check Joy2 right
    beq    LFC39                 ; 2³   - pressed
    lda    #%100                 ; 2    - not pressed
    sta    SWCHA                 ; 4    output #0 to Kid Vid,
    sta    $B5                   ; 3    and store #4 in $B5
LFC39:
    rts                          ; 6

LFC3A:
    dec    $DD                   ; 5
    lda    #0                    ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFC3F SUBROUTINE
    lda    #1                    ; 2
    sta    SWCHA                 ; 4   output to Kid Vid
    lda    #0                    ; 2
    sta    $B5                   ; 3
    lda    #$3C                  ; 2
    sta    $DD                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFC4D:
    lda    #$0B                  ; 2
    sta    TIM64T                ; 4
    lda    $B6                   ; 3
    bpl    LFC5C                 ; 2³
    lda    $BA                   ; 3
    bne    LFCAE                 ; 2³  
    beq    LFC6C                 ; 3   always branch

LFC5C:
    lda    $B9                   ; 3
    bpl    LFC66                 ; 2³
    lda    #0                    ; 2
    sta    $B9                   ; 3
    sta    $B4                   ; 3
LFC66:
    lda    $B6                   ; 3
    bne    LFC6E                 ; 2³
    lda    $BA                   ; 3
LFC6C:
    beq    LFCE5                 ; 2³
LFC6E:
    inc    $B6                   ; 5
    lda    $B6                   ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    cpy    #4                    ; 2
    bne    LFC7F                 ; 2³
    lda    $BA                   ; 3
    ora    $B6                   ; 3
    sta    $B6                   ; 3
LFC7F:
    lda    $BA                   ; 3
    bne    LFCCB                 ; 2³
    cpy    #2                    ; 2
    bcc    LFCE3                 ; 2³
    cpy    #9                    ; 2
    bcs    LFCB0                 ; 2³
    lda    #$10                  ; 2
    ora    $B6                   ; 3
    sta    $B6                   ; 3
    lda    $B9                   ; 3
    cmp    #8                    ; 2
    bne    LFCED                 ; 2³
LFC97:
    lda    $B6                   ; 3
    and    #$40                  ; 2
    cmp    #$40                  ; 2
    ldx    $B9                   ; 3
    rol    $B4                   ; 5
    rol    $B9                   ; 5
    inx                          ; 2
    cpx    #9                    ; 2
    beq    LFCC6                 ; 2³
    stx    $B9                   ; 3
    lda    #1                    ; 2
    sta    $B6                   ; 3
LFCAE:
    bne    LFCED                 ; 3   always branch

LFCB0:
    cpy    #$0F                  ; 2
    beq    LFCE3                 ; 2³
    lda    $B6                   ; 3
    and    #$10                  ; 2
    bne    LFCE3                 ; 2³
    lda    #$40                  ; 2
LFCBC:
    ora    #$80                  ; 2
    sta    $B9                   ; 3
    lda    #0                    ; 2
    sta    $B6                   ; 3
    beq    LFCED                 ; 3   always branch

LFCC6:
    lda    $B9                   ; 3
    jmp    LFCBC                 ; 3

LFCCB:
    lda    $B6                   ; 3
    and    #$10                  ; 2
    beq    LFCD7                 ; 2³
    cpy    #5                    ; 2
    bcc    LFCE3                 ; 2³
    bcs    LFC97                 ; 3   always branch

LFCD7:
    cpy    #$0F                  ; 2
    beq    LFCE3                 ; 2³
    cpy    #8                    ; 2
    bne    LFCED                 ; 2³
    lda    $B9                   ; 3
    beq    LFCED                 ; 2³
LFCE3:
    lda    #$80                  ; 2
LFCE5:
    sta    $B6                   ; 3
    lda    #0                    ; 2
    sta    $B9                   ; 3
    sta    $B4                   ; 3
LFCED:
    ldx    #3                    ; 2
    jmp    LFFE7                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFCF2 SUBROUTINE
MFCF2:
    jsr    LFF8A                 ; 6
    cmp    #$D0                  ; 2
    bcs    MFCF2                 ; 2³
    and    #$F8                  ; 2
    adc    #8                    ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $01 ; |       X| $FCFE
    .byte $01 ; |       X| $FCFF
    .byte $FE ; |XXXXXXX | $FD00

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD01 SUBROUTINE
    ldx    #$0A                  ; 2
LFD03:
    lda    #<Letters             ; 2
    sta    $84,X                 ; 4
    lda    #>Letters            ; 2
    sta    $85,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LFD03                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $3C ; |  XXXX  | $FD10
    .byte $66 ; | XX  XX | $FD11
    .byte $66 ; | XX  XX | $FD12
    .byte $66 ; | XX  XX | $FD13
    .byte $66 ; | XX  XX | $FD14
    .byte $66 ; | XX  XX | $FD15
    .byte $3C ; |  XXXX  | $FD16
    .byte $00 ; |        | $FD17
    .byte $7E ; | XXXXXX | $FD18
    .byte $18 ; |   XX   | $FD19
    .byte $18 ; |   XX   | $FD1A
    .byte $18 ; |   XX   | $FD1B
    .byte $38 ; |  XXX   | $FD1C
    .byte $18 ; |   XX   | $FD1D
    .byte $08 ; |    X   | $FD1E
    .byte $00 ; |        | $FD1F
    .byte $7E ; | XXXXXX | $FD20
    .byte $62 ; | XX   X | $FD21
    .byte $60 ; | XX     | $FD22
    .byte $3C ; |  XXXX  | $FD23
    .byte $06 ; |     XX | $FD24
    .byte $46 ; | X   XX | $FD25
    .byte $3C ; |  XXXX  | $FD26
    .byte $00 ; |        | $FD27
    .byte $3C ; |  XXXX  | $FD28
    .byte $46 ; | X   XX | $FD29
    .byte $06 ; |     XX | $FD2A
    .byte $1C ; |   XXX  | $FD2B
    .byte $06 ; |     XX | $FD2C
    .byte $46 ; | X   XX | $FD2D
    .byte $3C ; |  XXXX  | $FD2E
    .byte $00 ; |        | $FD2F
    .byte $0C ; |    XX  | $FD30
    .byte $0C ; |    XX  | $FD31
    .byte $7E ; | XXXXXX | $FD32
    .byte $4C ; | X  XX  | $FD33
    .byte $2C ; |  X XX  | $FD34
    .byte $1C ; |   XXX  | $FD35
    .byte $0C ; |    XX  | $FD36
    .byte $00 ; |        | $FD37
    .byte $3C ; |  XXXX  | $FD38
    .byte $46 ; | X   XX | $FD39
    .byte $06 ; |     XX | $FD3A
    .byte $7C ; | XXXXX  | $FD3B
    .byte $60 ; | XX     | $FD3C
    .byte $60 ; | XX     | $FD3D
    .byte $7E ; | XXXXXX | $FD3E
    .byte $00 ; |        | $FD3F
    .byte $3C ; |  XXXX  | $FD40
    .byte $66 ; | XX  XX | $FD41
    .byte $66 ; | XX  XX | $FD42
    .byte $7C ; | XXXXX  | $FD43
    .byte $60 ; | XX     | $FD44
    .byte $62 ; | XX   X | $FD45
    .byte $3C ; |  XXXX  | $FD46
    .byte $00 ; |        | $FD47
    .byte $30 ; |  XX    | $FD48
    .byte $30 ; |  XX    | $FD49
    .byte $18 ; |   XX   | $FD4A
    .byte $0C ; |    XX  | $FD4B
    .byte $06 ; |     XX | $FD4C
    .byte $42 ; | X    X | $FD4D
    .byte $7E ; | XXXXXX | $FD4E
    .byte $00 ; |        | $FD4F
    .byte $3C ; |  XXXX  | $FD50
    .byte $66 ; | XX  XX | $FD51
    .byte $66 ; | XX  XX | $FD52
    .byte $3C ; |  XXXX  | $FD53
    .byte $66 ; | XX  XX | $FD54
    .byte $66 ; | XX  XX | $FD55
    .byte $3C ; |  XXXX  | $FD56
    .byte $00 ; |        | $FD57
    .byte $3C ; |  XXXX  | $FD58
    .byte $46 ; | X   XX | $FD59
    .byte $06 ; |     XX | $FD5A
    .byte $3E ; |  XXXXX | $FD5B
    .byte $66 ; | XX  XX | $FD5C
    .byte $66 ; | XX  XX | $FD5D
    .byte $3C ; |  XXXX  | $FD5E
    .byte $00 ; |        | $FD5F

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD60 SUBROUTINE
    lda    #$80                  ; 2
    sta    $C7                   ; 3
    sta    $C8                   ; 3
    lda    $C2                   ; 3
    cmp    #$1F                  ; 2
    bcc    LFD76                 ; 2³
    sbc    #$19                  ; 2
    ldx    #3                    ; 2
    stx    $C7                   ; 3
    ldx    #1                    ; 2
    stx    $C8                   ; 3
LFD76:
    ldy    #$FF                  ; 2
    sec                          ; 2
LFD79:
    iny                          ; 2
    sbc    #5                    ; 2
    beq    LFD80                 ; 2³
    bcs    LFD79                 ; 2³
LFD80:
    clc                          ; 2
    adc    #5                    ; 2
    sta    $96                   ; 3
    ldx    #3                    ; 2
    jsr    LFD8E                 ; 6
    ldx    #1                    ; 2
    ldy    $96                   ; 3
LFD8E SUBROUTINE
    lda    LFDE0,Y               ; 4
    sta    $C2,X                 ; 4
    lda    LFDE6,Y               ; 4
    sta    $C3,X                 ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD99 SUBROUTINE
    lda    $83                   ; 3
    cmp    #$0B                  ; 2
    bcc    LFDA3                 ; 2³
    lda    #$0B                  ; 2
    sta    $83                   ; 3
LFDA3:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFDA4 SUBROUTINE
    inc    $C0                   ; 5
    lda    $C0                   ; 3
    lsr                          ; 2
    bcc    LFDD2                 ; 2³
    ldx    #1                    ; 2
    lda    SWCHA                 ; 4   check Joy1 right
    bpl    LFDB6                 ; 2³   - right pressed
    asl                          ; 2    - right is not pressed, so check Joy1 left...
    bmi    LFDBA                 ; 2³   - left is not pressed
    inx                          ; 2    - left pressed
LFDB6:
    stx    $B8                   ; 3   1 - right pressed, 2 left pressed
    bpl    LFDC4                 ; 2³
LFDBA:
    asl                          ; 2
    bmi    LFDBF                 ; 2³
    inc    $83                   ; 5
LFDBF:
    asl                          ; 2
    bmi    LFDC4                 ; 2³
    dec    $83                   ; 5
LFDC4:
    ldx    $B8                   ; 3
    beq    LFDD2                 ; 2³
    dex                          ; 2
    bne    LFDCE                 ; 2³
LFDCB:
    inc    $82                   ; 5
    rts                          ; 6

LFDCE:
    dec    $82                   ; 5
    beq    LFDCB                 ; 2³
LFDD2:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFDD3 SUBROUTINE
MFDD3:
    jsr    LFF8A                 ; 6
    cmp    #$A0                  ; 2
    bcs    MFDD3                 ; 2³
    and    #$F0                  ; 2
    lsr                          ; 2
    adc    #$10                  ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFDE0:
    .byte $80 ; |X       | $FDE0
    .byte $00 ; |        | $FDE1
    .byte $00 ; |        | $FDE2
    .byte $01 ; |       X| $FDE3
    .byte $01 ; |       X| $FDE4
    .byte $03 ; |      XX| $FDE5
LFDE6:
    .byte $80 ; |X       | $FDE6
    .byte $80 ; |X       | $FDE7
    .byte $00 ; |        | $FDE8
    .byte $00 ; |        | $FDE9
    .byte $01 ; |       X| $FDEA
    .byte $01 ; |       X| $FDEB
LFDEC:
    .byte $00 ; |        | $FDEC
LFDED:
    .byte $01 ; |       X| $FDED
    .byte $02 ; |      X | $FDEE
    .byte $03 ; |      XX| $FDEF
    .byte $04 ; |     X  | $FDF0
    .byte $05 ; |     X X| $FDF1
    .byte $06 ; |     XX | $FDF2
    .byte $06 ; |     XX | $FDF3
    .byte $06 ; |     XX | $FDF4
    .byte $06 ; |     XX | $FDF5
    .byte $06 ; |     XX | $FDF6
    .byte $06 ; |     XX | $FDF7
    .byte $06 ; |     XX | $FDF8
    .byte $06 ; |     XX | $FDF9
    .byte $06 ; |     XX | $FDFA
    .byte $05 ; |     X X| $FDFB
    .byte $04 ; |     X  | $FDFC
    .byte $03 ; |      XX| $FDFD
    .byte $02 ; |      X | $FDFE
    .byte $01 ; |       X| $FDFF

Letters:
Blank_Letter:
    .byte $00 ; |        | $FE00
    .byte $00 ; |        | $FE01
    .byte $00 ; |        | $FE02
    .byte $00 ; |        | $FE03
    .byte $00 ; |        | $FE04
    .byte $00 ; |        | $FE05
    .byte $00 ; |        | $FE06
    .byte $00 ; |        | $FE07

    .byte $62 ; | XX   X | $FE08
    .byte $62 ; | XX   X | $FE09
    .byte $62 ; | XX   X | $FE0A
    .byte $7E ; | XXXXXX | $FE0B
    .byte $62 ; | XX   X | $FE0C
    .byte $62 ; | XX   X | $FE0D
    .byte $24 ; |  X  X  | $FE0E
    .byte $3C ; |  XXXX  | $FE0F

    .byte $7C ; | XXXXX  | $FE10
    .byte $66 ; | XX  XX | $FE11
    .byte $62 ; | XX   X | $FE12
    .byte $62 ; | XX   X | $FE13
    .byte $7C ; | XXXXX  | $FE14
    .byte $62 ; | XX   X | $FE15
    .byte $62 ; | XX   X | $FE16
    .byte $7C ; | XXXXX  | $FE17

    .byte $3C ; |  XXXX  | $FE18
    .byte $62 ; | XX   X | $FE19
    .byte $60 ; | XX     | $FE1A
    .byte $60 ; | XX     | $FE1B
    .byte $60 ; | XX     | $FE1C
    .byte $60 ; | XX     | $FE1D
    .byte $62 ; | XX   X | $FE1E
    .byte $3C ; |  XXXX  | $FE1F

    .byte $7C ; | XXXXX  | $FE20
    .byte $62 ; | XX   X | $FE21
    .byte $62 ; | XX   X | $FE22
    .byte $62 ; | XX   X | $FE23
    .byte $62 ; | XX   X | $FE24
    .byte $62 ; | XX   X | $FE25
    .byte $62 ; | XX   X | $FE26
    .byte $7C ; | XXXXX  | $FE27

    .byte $7E ; | XXXXXX | $FE28
    .byte $60 ; | XX     | $FE29
    .byte $60 ; | XX     | $FE2A
    .byte $60 ; | XX     | $FE2B
    .byte $7C ; | XXXXX  | $FE2C
    .byte $60 ; | XX     | $FE2D
    .byte $60 ; | XX     | $FE2E
    .byte $7E ; | XXXXXX | $FE2F

    .byte $60 ; | XX     | $FE30
    .byte $60 ; | XX     | $FE31
    .byte $60 ; | XX     | $FE32
    .byte $60 ; | XX     | $FE33
    .byte $7C ; | XXXXX  | $FE34
    .byte $60 ; | XX     | $FE35
    .byte $60 ; | XX     | $FE36
    .byte $7E ; | XXXXXX | $FE37

    .byte $3C ; |  XXXX  | $FE38
    .byte $66 ; | XX  XX | $FE39
    .byte $66 ; | XX  XX | $FE3A
    .byte $66 ; | XX  XX | $FE3B
    .byte $6C ; | XX XX  | $FE3C
    .byte $60 ; | XX     | $FE3D
    .byte $62 ; | XX   X | $FE3E
    .byte $3C ; |  XXXX  | $FE3F

    .byte $62 ; | XX   X | $FE40
    .byte $62 ; | XX   X | $FE41
    .byte $62 ; | XX   X | $FE42
    .byte $62 ; | XX   X | $FE43
    .byte $7E ; | XXXXXX | $FE44
    .byte $62 ; | XX   X | $FE45
    .byte $62 ; | XX   X | $FE46
    .byte $62 ; | XX   X | $FE47

    .byte $7E ; | XXXXXX | $FE48
    .byte $18 ; |   XX   | $FE49
    .byte $18 ; |   XX   | $FE4A
    .byte $18 ; |   XX   | $FE4B
    .byte $18 ; |   XX   | $FE4C
    .byte $18 ; |   XX   | $FE4D
    .byte $18 ; |   XX   | $FE4E
    .byte $7E ; | XXXXXX | $FE4F

    .byte $7C ; | XXXXX  | $FE50
    .byte $4C ; | X  XX  | $FE51
    .byte $0C ; |    XX  | $FE52
    .byte $0C ; |    XX  | $FE53
    .byte $0C ; |    XX  | $FE54
    .byte $0C ; |    XX  | $FE55
    .byte $0C ; |    XX  | $FE56
    .byte $3E ; |  XXXXX | $FE57

    .byte $62 ; | XX   X | $FE58
    .byte $62 ; | XX   X | $FE59
    .byte $66 ; | XX  XX | $FE5A
    .byte $6C ; | XX XX  | $FE5B
    .byte $78 ; | XXXX   | $FE5C
    .byte $6C ; | XX XX  | $FE5D
    .byte $66 ; | XX  XX | $FE5E
    .byte $62 ; | XX   X | $FE5F

    .byte $7E ; | XXXXXX | $FE60
    .byte $60 ; | XX     | $FE61
    .byte $60 ; | XX     | $FE62
    .byte $60 ; | XX     | $FE63
    .byte $60 ; | XX     | $FE64
    .byte $60 ; | XX     | $FE65
    .byte $60 ; | XX     | $FE66
    .byte $60 ; | XX     | $FE67

    .byte $42 ; | X    X | $FE68
    .byte $42 ; | X    X | $FE69
    .byte $42 ; | X    X | $FE6A
    .byte $5A ; | X XX X | $FE6B
    .byte $5A ; | X XX X | $FE6C
    .byte $7E ; | XXXXXX | $FE6D
    .byte $66 ; | XX  XX | $FE6E
    .byte $42 ; | X    X | $FE6F

    .byte $62 ; | XX   X | $FE70
    .byte $62 ; | XX   X | $FE71
    .byte $66 ; | XX  XX | $FE72
    .byte $66 ; | XX  XX | $FE73
    .byte $6A ; | XX X X | $FE74
    .byte $72 ; | XXX  X | $FE75
    .byte $62 ; | XX   X | $FE76
    .byte $42 ; | X    X | $FE77

    .byte $3C ; |  XXXX  | $FE78
    .byte $62 ; | XX   X | $FE79
    .byte $62 ; | XX   X | $FE7A
    .byte $62 ; | XX   X | $FE7B
    .byte $62 ; | XX   X | $FE7C
    .byte $62 ; | XX   X | $FE7D
    .byte $62 ; | XX   X | $FE7E
    .byte $3C ; |  XXXX  | $FE7F

    .byte $60 ; | XX     | $FE80
    .byte $60 ; | XX     | $FE81
    .byte $60 ; | XX     | $FE82
    .byte $7C ; | XXXXX  | $FE83
    .byte $62 ; | XX   X | $FE84
    .byte $62 ; | XX   X | $FE85
    .byte $62 ; | XX   X | $FE86
    .byte $7C ; | XXXXX  | $FE87

    .byte $3E ; |  XXXXX | $FE88
    .byte $66 ; | XX  XX | $FE89
    .byte $6A ; | XX X X | $FE8A
    .byte $62 ; | XX   X | $FE8B
    .byte $62 ; | XX   X | $FE8C
    .byte $62 ; | XX   X | $FE8D
    .byte $62 ; | XX   X | $FE8E
    .byte $3C ; |  XXXX  | $FE8F

    .byte $62 ; | XX   X | $FE90
    .byte $62 ; | XX   X | $FE91
    .byte $64 ; | XX  X  | $FE92
    .byte $7C ; | XXXXX  | $FE93
    .byte $62 ; | XX   X | $FE94
    .byte $62 ; | XX   X | $FE95
    .byte $62 ; | XX   X | $FE96
    .byte $7C ; | XXXXX  | $FE97

    .byte $3C ; |  XXXX  | $FE98
    .byte $46 ; | X   XX | $FE99
    .byte $06 ; |     XX | $FE9A
    .byte $06 ; |     XX | $FE9B
    .byte $3C ; |  XXXX  | $FE9C
    .byte $60 ; | XX     | $FE9D
    .byte $62 ; | XX   X | $FE9E
    .byte $3C ; |  XXXX  | $FE9F

    .byte $18 ; |   XX   | $FEA0
    .byte $18 ; |   XX   | $FEA1
    .byte $18 ; |   XX   | $FEA2
    .byte $18 ; |   XX   | $FEA3
    .byte $18 ; |   XX   | $FEA4
    .byte $18 ; |   XX   | $FEA5
    .byte $18 ; |   XX   | $FEA6
    .byte $7E ; | XXXXXX | $FEA7

    .byte $3C ; |  XXXX  | $FEA8
    .byte $62 ; | XX   X | $FEA9
    .byte $62 ; | XX   X | $FEAA
    .byte $62 ; | XX   X | $FEAB
    .byte $62 ; | XX   X | $FEAC
    .byte $62 ; | XX   X | $FEAD
    .byte $62 ; | XX   X | $FEAE
    .byte $62 ; | XX   X | $FEAF

    .byte $08 ; |    X   | $FEB0
    .byte $14 ; |   X X  | $FEB1
    .byte $14 ; |   X X  | $FEB2
    .byte $22 ; |  X   X | $FEB3
    .byte $62 ; | XX   X | $FEB4
    .byte $62 ; | XX   X | $FEB5
    .byte $62 ; | XX   X | $FEB6
    .byte $62 ; | XX   X | $FEB7

    .byte $42 ; | X    X | $FEB8
    .byte $66 ; | XX  XX | $FEB9
    .byte $7E ; | XXXXXX | $FEBA
    .byte $5A ; | X XX X | $FEBB
    .byte $5A ; | X XX X | $FEBC
    .byte $42 ; | X    X | $FEBD
    .byte $42 ; | X    X | $FEBE
    .byte $42 ; | X    X | $FEBF

    .byte $66 ; | XX  XX | $FEC0
    .byte $66 ; | XX  XX | $FEC1
    .byte $24 ; |  X  X  | $FEC2
    .byte $18 ; |   XX   | $FEC3
    .byte $18 ; |   XX   | $FEC4
    .byte $24 ; |  X  X  | $FEC5
    .byte $42 ; | X    X | $FEC6
    .byte $42 ; | X    X | $FEC7

    .byte $18 ; |   XX   | $FEC8
    .byte $18 ; |   XX   | $FEC9
    .byte $18 ; |   XX   | $FECA
    .byte $3C ; |  XXXX  | $FECB
    .byte $24 ; |  X  X  | $FECC
    .byte $66 ; | XX  XX | $FECD
    .byte $42 ; | X    X | $FECE
    .byte $42 ; | X    X | $FECF

    .byte $7E ; | XXXXXX | $FED0
    .byte $60 ; | XX     | $FED1
    .byte $30 ; |  XX    | $FED2
    .byte $18 ; |   XX   | $FED3
    .byte $0C ; |    XX  | $FED4
    .byte $06 ; |     XX | $FED5
    .byte $02 ; |      X | $FED6
    .byte $7E ; | XXXXXX | $FED7

LFED8:
    .byte $CC ; |XX  XX  | $FED8
    .byte $CC ; |XX  XX  | $FED9
    .byte $CC ; |XX  XX  | $FEDA
    .byte $CC ; |XX  XX  | $FEDB
    .byte $CC ; |XX  XX  | $FEDC
    .byte $CC ; |XX  XX  | $FEDD
    .byte $CC ; |XX  XX  | $FEDE
    .byte $CC ; |XX  XX  | $FEDF
    .byte $CC ; |XX  XX  | $FEE0
    .byte $CC ; |XX  XX  | $FEE1
    .byte $CA ; |XX  X X | $FEE2
    .byte $CA ; |XX  X X | $FEE3
    .byte $CC ; |XX  XX  | $FEE4
    .byte $CA ; |XX  X X | $FEE5
    .byte $CA ; |XX  X X | $FEE6
    .byte $CC ; |XX  XX  | $FEE7
    .byte $C8 ; |XX  X   | $FEE8
    .byte $C8 ; |XX  X   | $FEE9
    .byte $CA ; |XX  X X | $FEEA
    .byte $C8 ; |XX  X   | $FEEB
    .byte $C8 ; |XX  X   | $FEEC
    .byte $CA ; |XX  X X | $FEED
    .byte $C6 ; |XX   XX | $FEEE
    .byte $C6 ; |XX   XX | $FEEF
    .byte $C8 ; |XX  X   | $FEF0
    .byte $C6 ; |XX   XX | $FEF1
    .byte $C6 ; |XX   XX | $FEF2
    .byte $C8 ; |XX  X   | $FEF3
    .byte $C4 ; |XX   X  | $FEF4
    .byte $C4 ; |XX   X  | $FEF5
    .byte $C4 ; |XX   X  | $FEF6
    .byte $C4 ; |XX   X  | $FEF7
LFEF8:
    .byte $C4 ; |XX   X  | $FEF8
    .byte $8E ; |X   XXX | $FEF9
    .byte $8C ; |X   XX  | $FEFA
    .byte $8C ; |X   XX  | $FEFB
    .byte $8E ; |X   XXX | $FEFC
    .byte $8C ; |X   XX  | $FEFD
    .byte $8C ; |X   XX  | $FEFE
    .byte $8E ; |X   XXX | $FEFF
    .byte $8A ; |X   X X | $FF00
    .byte $8A ; |X   X X | $FF01
    .byte $8C ; |X   XX  | $FF02
    .byte $8A ; |X   X X | $FF03
    .byte $8A ; |X   X X | $FF04
    .byte $8C ; |X   XX  | $FF05
    .byte $88 ; |X   X   | $FF06
    .byte $88 ; |X   X   | $FF07
    .byte $8A ; |X   X X | $FF08
    .byte $88 ; |X   X   | $FF09
    .byte $88 ; |X   X   | $FF0A
    .byte $8A ; |X   X X | $FF0B
    .byte $86 ; |X    XX | $FF0C
    .byte $86 ; |X    XX | $FF0D
    .byte $88 ; |X   X   | $FF0E
    .byte $86 ; |X    XX | $FF0F
    .byte $86 ; |X    XX | $FF10
    .byte $88 ; |X   X   | $FF11
    .byte $84 ; |X    X  | $FF12
    .byte $84 ; |X    X  | $FF13
    .byte $86 ; |X    XX | $FF14
    .byte $84 ; |X    X  | $FF15
    .byte $84 ; |X    X  | $FF16
    .byte $86 ; |X    XX | $FF17
    .byte $D2 ; |XX X  X | $FF18
    .byte $D2 ; |XX X  X | $FF19
    .byte $D4 ; |XX X X  | $FF1A
    .byte $D2 ; |XX X  X | $FF1B
    .byte $D2 ; |XX X  X | $FF1C
    .byte $D4 ; |XX X X  | $FF1D
    .byte $D2 ; |XX X  X | $FF1E
    .byte $D2 ; |XX X  X | $FF1F
    .byte $D6 ; |XX X XX | $FF20
    .byte $D4 ; |XX X X  | $FF21
    .byte $D4 ; |XX X X  | $FF22
    .byte $D6 ; |XX X XX | $FF23
    .byte $D4 ; |XX X X  | $FF24
    .byte $D4 ; |XX X X  | $FF25
    .byte $D6 ; |XX X XX | $FF26
    .byte $D4 ; |XX X X  | $FF27
    .byte $D4 ; |XX X X  | $FF28
    .byte $D6 ; |XX X XX | $FF29
    .byte $D4 ; |XX X X  | $FF2A
    .byte $D4 ; |XX X X  | $FF2B
    .byte $D6 ; |XX X XX | $FF2C
    .byte $D4 ; |XX X X  | $FF2D
    .byte $D4 ; |XX X X  | $FF2E
    .byte $D6 ; |XX X XX | $FF2F
LFF30:
    .byte $D4 ; |XX X X  | $FF30
    .byte $D4 ; |XX X X  | $FF31
    .byte $D6 ; |XX X XX | $FF32
    .byte $D4 ; |XX X X  | $FF33
    .byte $D4 ; |XX X X  | $FF34
    .byte $D6 ; |XX X XX | $FF35
    .byte $D4 ; |XX X X  | $FF36
    .byte $D4 ; |XX X X  | $FF37
    .byte $D6 ; |XX X XX | $FF38
    .byte $D4 ; |XX X X  | $FF39
    .byte $D4 ; |XX X X  | $FF3A
    .byte $D6 ; |XX X XX | $FF3B
    .byte $D4 ; |XX X X  | $FF3C
    .byte $D4 ; |XX X X  | $FF3D
    .byte $D6 ; |XX X XX | $FF3E
    .byte $D4 ; |XX X X  | $FF3F
    .byte $54 ; | X X X  | $FF40
    .byte $52 ; | X X  X | $FF41
    .byte $50 ; | X X    | $FF42
    .byte $4E ; | X  XXX | $FF43
    .byte $4C ; | X  XX  | $FF44
    .byte $4A ; | X  X X | $FF45
    .byte $48 ; | X  X   | $FF46
    .byte $48 ; | X  X   | $FF47
    .byte $48 ; | X  X   | $FF48
    .byte $48 ; | X  X   | $FF49
    .byte $48 ; | X  X   | $FF4A
    .byte $48 ; | X  X   | $FF4B
    .byte $48 ; | X  X   | $FF4C
    .byte $48 ; | X  X   | $FF4D
    .byte $48 ; | X  X   | $FF4E
    .byte $4A ; | X  X X | $FF4F
    .byte $4C ; | X  XX  | $FF50
    .byte $4E ; | X  XXX | $FF51
    .byte $50 ; | X X    | $FF52
    .byte $52 ; | X X  X | $FF53
    .byte $54 ; | X X X  | $FF54
    .byte $54 ; | X X X  | $FF55
    .byte $54 ; | X X X  | $FF56
    .byte $54 ; | X X X  | $FF57
    .byte $54 ; | X X X  | $FF58
    .byte $54 ; | X X X  | $FF59
    .byte $54 ; | X X X  | $FF5A
    .byte $54 ; | X X X  | $FF5B
LFF5C:
    .byte $0D ; |    XX X| $FF5C
    .byte $0D ; |    XX X| $FF5D
    .byte $0D ; |    XX X| $FF5E
    .byte $0C ; |    XX  | $FF5F
    .byte $0B ; |    X XX| $FF60
    .byte $0A ; |    X X | $FF61
    .byte $09 ; |    X  X| $FF62
    .byte $09 ; |    X  X| $FF63
    .byte $09 ; |    X  X| $FF64
    .byte $09 ; |    X  X| $FF65
    .byte $0A ; |    X X | $FF66
    .byte $0B ; |    X XX| $FF67
    .byte $0C ; |    XX  | $FF68
    .byte $0D ; |    XX X| $FF69
    .byte $0E ; |    XXX | $FF6A
    .byte $0E ; |    XXX | $FF6B
    .byte $0E ; |    XXX | $FF6C
    .byte $0E ; |    XXX | $FF6D
    .byte $0E ; |    XXX | $FF6E
    .byte $0E ; |    XXX | $FF6F
LFF70:
    .byte $16 ; |   X XX | $FF70
LFF71:
    .byte $A8 ; |X X X   | $FF71
    .byte $36 ; |  XX XX | $FF72
    .byte $A8 ; |X X X   | $FF73
    .byte $56 ; | X X XX | $FF74
    .byte $A8 ; |X X X   | $FF75
    .byte $90 ; |X  X    | $FF76
    .byte $A0 ; |X X     | $FF77
    .byte $D0 ; |XX X    | $FF78
    .byte $A0 ; |X X     | $FF79
    .byte $70 ; | XXX    | $FF7A
    .byte $6E ; | XX XXX | $FF7B
    .byte $6C ; | XX XX  | $FF7C
    .byte $6A ; | XX X X | $FF7D
    .byte $6A ; | XX X X | $FF7E
    .byte $6A ; | XX X X | $FF7F
    .byte $6A ; | XX X X | $FF80
    .byte $6A ; | XX X X | $FF81
    .byte $6A ; | XX X X | $FF82
    .byte $6C ; | XX XX  | $FF83
    .byte $6E ; | XX XXX | $FF84
    .byte $70 ; | XXX    | $FF85
    .byte $70 ; | XXX    | $FF86
    .byte $70 ; | XXX    | $FF87
    .byte $70 ; | XXX    | $FF88
    .byte $70 ; | XXX    | $FF89

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFF8A SUBROUTINE
    lda    $E9                   ; 3
    
    sta    $D1                   ; 3   stuV WXYZ
    asl    $D1                   ; 5
    adc    #0                    ; 2   
    asl    $D1                   ; 5
    adc    #0                    ; 2   rotate 3 bits left...
    asl    $D1                   ; 5
    adc    #0                    ; 2   VWXY Zstu stored in $D1
    
;accumulator still has the original
;value from $E9 in it at this point    STUV WXyz
    lsr                          ; 2   shift right, then rotate right
    rol    $E9                   ; 5   z_ST UVWX
    lda    $E9                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFFA0:
    .byte $00 ; |        | $FFA0
    .byte $01 ; |       X| $FFA1
    .byte $02 ; |      X | $FFA2
    .byte $03 ; |      XX| $FFA3
    .byte $03 ; |      XX| $FFA4
    .byte $03 ; |      XX| $FFA5
    .byte $03 ; |      XX| $FFA6
    .byte $03 ; |      XX| $FFA7
    .byte $03 ; |      XX| $FFA8
    .byte $02 ; |      X | $FFA9
    .byte $01 ; |       X| $FFAA
    .byte $00 ; |        | $FFAB
    .byte $00 ; |        | $FFAC
    .byte $00 ; |        | $FFAD

LFFAE:
;    .byte $41 ; | X     X| $FFAE
;    .byte $F9 ; |XXXXX  X| $FFAF
;    .byte $5E ; | X XXXX | $FFB0
;    .byte $F9 ; |XXXXX  X| $FFB1
;    .byte $7B ; | XXXX XX| $FFB2
;    .byte $F9 ; |XXXXX  X| $FFB3

    .word  LF941         ; $FFAE   presuming these are pointers
    .word  LF95E         ; $FFB0
    .word  LF97B         ; $FFB2

LFFB4:
    .byte $02 ; |      X | $FFB4
    .byte $01 ; |       X| $FFB5
    .byte $00 ; |        | $FFB6
    .byte $00 ; |        | $FFB7
    .byte $01 ; |       X| $FFB8
    .byte $02 ; |      X | $FFB9
    .byte $00 ; |        | $FFBA
    .byte $01 ; |       X| $FFBB
    .byte $02 ; |      X | $FFBC
    .byte $01 ; |       X| $FFBD
    .byte $00 ; |        | $FFBE
    .byte $02 ; |      X | $FFBF
    .byte $01 ; |       X| $FFC0
    .byte $01 ; |       X| $FFC1
    .byte $00 ; |        | $FFC2
    .byte $02 ; |      X | $FFC3
    .byte $01 ; |       X| $FFC4
    .byte $01 ; |       X| $FFC5
    .byte $00 ; |        | $FFC6
    .byte $02 ; |      X | $FFC7
    .byte $01 ; |       X| $FFC8
    .byte $01 ; |       X| $FFC9
    .byte $00 ; |        | $FFCA
    .byte $00 ; |        | $FFCB
    .byte $02 ; |      X | $FFCC
    .byte $00 ; |        | $FFCD
LFFCE:
    jmp    LFC4D                 ; 3
LFFD1:
    jmp    LFAD3                 ; 3
LFFD4:
    jmp    LF872                 ; 3

    .byte $01 ; |       X| $FFD7
    .byte $FE ; |XXXXXXX | $FFD8
    .byte $FE ; |XXXXXXX | $FFD9
    .byte $01 ; |       X| $FFDA
    .byte $01 ; |       X| $FFDB
    .byte $FE ; |XXXXXXX | $FFDC

    dex                          ; 2
    bmi    LFFCE                 ; 2³
    beq    LFFD1                 ; 2³
    bne    LFFEC                 ; 3   always branch
    nop                          ; 2

START:
    ldx    #5                    ; 2
LFFE7:
    lda    #0                    ; 2
    lda    LFFF8                 ; 4
LFFEC:
    dex                          ; 2
    beq    LFFD4                 ; 2³
    dex                          ; 2
    beq    LFFF5                 ; 2³
    jmp    LFC1F                 ; 3
LFFF5:
    jmp    LF000                 ; 3

      RORG $FFF8

LFFF8:
    .byte $FE ; |XXXXXXX | $FFF8
    .byte $FE ; |XXXXXXX | $FFF9
    .byte $01 ; |       X| $FFFA
    .byte $01 ; |       X| $FFFB

    .word START,START
